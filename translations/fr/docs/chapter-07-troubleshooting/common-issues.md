# Problèmes Courants et Solutions

**Navigation dans le Chapitre :**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 7 - Résolution des Problèmes & Débogage
- **⬅️ Chapitre Précédent** : [Chapitre 6 : Vérifications Préliminaires](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Suivant** : [Guide de Débogage](debugging.md)
- **🚀 Chapitre Suivant** : [Chapitre 8 : Production & Modèles Entreprise](../chapter-08-production/production-ai-practices.md)

## Introduction

Ce guide complet de dépannage couvre les problèmes les plus fréquemment rencontrés lors de l'utilisation d'Azure Developer CLI. Apprenez à diagnostiquer, dépanner et résoudre les problèmes courants liés à l'authentification, au déploiement, à la fourniture d'infrastructure et à la configuration des applications. Chaque problème comprend des symptômes détaillés, des causes profondes et des procédures de résolution étape par étape.

## Objectifs d'Apprentissage

En complétant ce guide, vous allez :
- Maîtriser les techniques de diagnostic pour les problèmes d'Azure Developer CLI
- Comprendre les problèmes fréquents d'authentification et de permissions ainsi que leurs solutions
- Résoudre les échecs de déploiement, les erreurs de provisionnement d'infrastructure et les problèmes de configuration
- Mettre en œuvre des stratégies de surveillance proactive et de débogage
- Appliquer des méthodologies de dépannage systématiques pour des problèmes complexes
- Configurer une journalisation et une surveillance appropriées pour prévenir les futurs problèmes

## Résultats d'Apprentissage

À l'issue, vous serez capable de :
- Diagnostiquer les problèmes d'Azure Developer CLI à l'aide des outils de diagnostic intégrés
- Résoudre de manière autonome les problèmes liés à l'authentification, aux abonnements et aux permissions
- Dépanner efficacement les échecs de déploiement et les erreurs de provisionnement d'infrastructure
- Déboguer les problèmes de configuration d'applications et les problèmes spécifiques à l'environnement
- Mettre en place la surveillance et les alertes pour identifier de manière proactive les problèmes potentiels
- Appliquer les meilleures pratiques de journalisation, débogage, et workflows de résolution de problèmes

## Diagnostic Rapide

> Remplacez les noms/IDs d'exemple par les valeurs de votre environnement. Les fragments Bash, Bicep, JavaScript et fichiers de paramètres sont indiqués séparément ci-dessous ; ils ne constituent pas un script exécutable unique. Vérifiez les opérations destructives et anonymisez les secrets avant de partager les diagnostics. `azd monitor --logs` ouvre un navigateur ; il ne transmet pas les logs du terminal.

Avant d'entrer dans les problèmes spécifiques, exécutez ces commandes pour rassembler les informations de diagnostic :

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## Problèmes d'Authentification

### Problème : "Impossible d'obtenir un jeton d'accès"
**Symptômes :**
- `azd up` échoue avec des erreurs d'authentification
- Les commandes retournent "non autorisé" ou "accès refusé"

**Solutions :**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### Problème : "Privilèges insuffisants" lors du déploiement
**Symptômes :**
- Échec du déploiement avec des erreurs de permissions
- Impossible de créer certaines ressources Azure

**Solutions :**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problème : Problèmes d'authentification multi-locataires
**Solutions :**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Erreurs de Provisionnement d'Infrastructure

### Problème : Conflits de noms de ressources
**Symptômes :**
- Erreurs "Le nom de la ressource existe déjà"
- Échec du déploiement lors de la création de la ressource

**Solutions :**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### Problème : Emplacement/Région non disponible
**Symptômes :**
- "L'emplacement 'xyz' n'est pas disponible pour ce type de ressource"
- Certains SKU non disponibles dans la région choisie

**Solutions :**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Modifier la variable d'emplacement ne migre pas les ressources existantes. Un groupe de ressources ou une ressource existante peut refuser un changement d'emplacement ; utilisez un environnement séparé pour un redéploiement régional.

### Problème : Erreurs de dépassement de quota
**Symptômes :**
- "Quota dépassé pour type de ressource"
- "Nombre maximum de ressources atteint"

**Solutions :**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Pour le développement, choisissez un SKU plus petit supporté dans `infra/main.parameters.json` :

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problème : Erreurs dans les templates Bicep
**Symptômes :**
- Échecs de validation des templates
- Erreurs de syntaxe dans les fichiers Bicep

**Solutions :**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 Échecs de Déploiement

### Problème : Échecs de compilation
**Symptômes :**
- L'application ne se compile pas lors du déploiement
- Erreurs d'installation de paquets

**Solutions :**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Problème : Échecs de déploiement de containers
**Symptômes :**
- Les applications conteneurisées ne démarrent pas
- Erreurs de récupération d'image

**Solutions :**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Problème : Échecs de connexion à la base de données
**Symptômes :**
- L'application ne peut pas se connecter à la base de données
- Erreurs de timeout de connexion

**Solutions :**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problèmes de Configuration

### Problème : Variables d'environnement non fonctionnelles
**Symptômes :**
- L'application ne peut pas lire les valeurs de configuration
- Les variables d'environnement semblent vides

**Solutions :**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problème : Problèmes de certificat SSL/TLS
**Symptômes :**
- HTTPS ne fonctionne pas
- Erreurs de validation de certificat

**Solutions :**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problème : Problèmes de configuration CORS
**Symptômes :**
- Le frontend ne peut pas appeler l'API
- Requête inter-origine bloquée

**Solutions :**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Mettez à jour votre application Express existante (avec `cors` importé) :

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 Problèmes de Gestion d'Environnement

### Problème : Problèmes de basculement d'environnement
**Symptômes :**
- Mauvais environnement utilisé
- Configuration qui ne bascule pas correctement

**Solutions :**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Problème : Corruption d'environnement
**Symptômes :**
- L'environnement affiche un état invalide
- Les ressources ne correspondent pas à la configuration

**Solutions :**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Problèmes de Performance

### Problème : Temps de déploiement lents
**Symptômes :**
- Les déploiements prennent trop de temps
- Timeouts durant le déploiement

**Solutions :**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### Problème : Problèmes de performance d'application
**Symptômes :**
- Temps de réponse lents
- Utilisation élevée des ressources

**Solutions :**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Outils et Commandes de Dépannage

### Commandes de Débogage
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Analyse des Journaux
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigation des Ressources
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Obtenir de l'Aide Supplémentaire

### Quand Escalader
- Les problèmes d'authentification persistent après avoir essayé toutes les solutions
- Problèmes d'infrastructure avec les services Azure
- Problèmes liés à la facturation ou aux abonnements
- Problèmes ou incidents de sécurité

### Canaux de Support
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informations à Rassembler
Avant de contacter le support, collectez :
- La sortie de `azd version`
- La sortie de `azd config show`
- `azd show` sortie (statut actuel du déploiement)
- Messages d'erreur (texte complet)
- Étapes pour reproduire le problème
- Détails de l'environnement censurés (ne partagez jamais le `azd env get-values` brut, qui peut contenir des secrets)
- Chronologie du début du problème

### Script de collecte des journaux
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prévention des problèmes

### Liste de contrôle avant déploiement
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### Configuration de la surveillance
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### Maintenance régulière
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Ressources associées

- [Guide de débogage](debugging.md) - Techniques avancées de débogage
- [Approvisionnement des ressources](../chapter-04-infrastructure/provisioning.md) - Dépannage de l'infrastructure
- [Planification de la capacité](../chapter-06-pre-deployment/capacity-planning.md) - Conseils pour la planification des ressources
- [Sélection de SKU](../chapter-06-pre-deployment/sku-selection.md) - Recommandations de niveaux de service

---

**Astuce** : Gardez ce guide en favori et consultez-le chaque fois que vous rencontrez des problèmes. La plupart des problèmes ont déjà été vus et ont des solutions établies !

---

**Navigation**
- **Leçon précédente** : [Approvisionnement des ressources](../chapter-04-infrastructure/provisioning.md)
- **Leçon suivante** : [Guide de débogage](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->