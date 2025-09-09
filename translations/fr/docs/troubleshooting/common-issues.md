<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T17:06:22+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "fr"
}
-->
# Problèmes Courants & Solutions

## Introduction

Ce guide de dépannage complet couvre les problèmes les plus fréquemment rencontrés lors de l'utilisation de l'Azure Developer CLI. Apprenez à diagnostiquer, résoudre et corriger les problèmes courants liés à l'authentification, au déploiement, à la provision d'infrastructure et à la configuration des applications. Chaque problème inclut des symptômes détaillés, des causes racines et des procédures de résolution étape par étape.

## Objectifs d'Apprentissage

En suivant ce guide, vous allez :
- Maîtriser les techniques de diagnostic pour les problèmes liés à l'Azure Developer CLI
- Comprendre les problèmes courants d'authentification et de permissions ainsi que leurs solutions
- Résoudre les échecs de déploiement, les erreurs de provision d'infrastructure et les problèmes de configuration
- Mettre en œuvre des stratégies de surveillance et de débogage proactives
- Appliquer des méthodologies de dépannage systématiques pour des problèmes complexes
- Configurer une journalisation et une surveillance appropriées pour éviter les problèmes futurs

## Résultats d'Apprentissage

À la fin de ce guide, vous serez capable de :
- Diagnostiquer les problèmes liés à l'Azure Developer CLI en utilisant les outils de diagnostic intégrés
- Résoudre de manière autonome les problèmes d'authentification, d'abonnement et de permissions
- Traiter efficacement les échecs de déploiement et les erreurs de provision d'infrastructure
- Déboguer les problèmes de configuration des applications et les problèmes spécifiques à l'environnement
- Mettre en œuvre des systèmes de surveillance et d'alerte pour identifier de manière proactive les problèmes potentiels
- Appliquer les meilleures pratiques pour la journalisation, le débogage et les workflows de résolution de problèmes

## Diagnostics Rapides

Avant de plonger dans des problèmes spécifiques, exécutez ces commandes pour recueillir des informations de diagnostic :

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Problèmes d'Authentification

### Problème : "Échec de l'obtention du jeton d'accès"
**Symptômes :**
- `azd up` échoue avec des erreurs d'authentification
- Les commandes renvoient "non autorisé" ou "accès refusé"

**Solutions :**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problème : "Privilèges insuffisants" lors du déploiement
**Symptômes :**
- Le déploiement échoue avec des erreurs de permissions
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

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Erreurs de Provision d'Infrastructure

### Problème : Conflits de noms de ressources
**Symptômes :**
- Erreurs "Le nom de la ressource existe déjà"
- Échec du déploiement lors de la création de ressources

**Solutions :**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Problème : Emplacement/Région non disponible
**Symptômes :**
- "L'emplacement 'xyz' n'est pas disponible pour le type de ressource"
- Certains SKUs ne sont pas disponibles dans la région sélectionnée

**Solutions :**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Problème : Erreurs de dépassement de quota
**Symptômes :**
- "Quota dépassé pour le type de ressource"
- "Nombre maximum de ressources atteint"

**Solutions :**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problème : Erreurs de modèle Bicep
**Symptômes :**
- Échecs de validation de modèle
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

### Problème : Échecs de construction
**Symptômes :**
- L'application échoue à se construire lors du déploiement
- Erreurs d'installation de paquets

**Solutions :**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Problème : Échecs de déploiement de conteneurs
**Symptômes :**
- Les applications conteneurisées échouent à démarrer
- Erreurs de récupération d'image

**Solutions :**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Problème : Échecs de connexion à la base de données
**Symptômes :**
- L'application ne peut pas se connecter à la base de données
- Erreurs de délai d'attente de connexion

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

### Problème : Les variables d'environnement ne fonctionnent pas
**Symptômes :**
- L'application ne peut pas lire les valeurs de configuration
- Les variables d'environnement semblent vides

**Solutions :**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problème : Problèmes de certificats SSL/TLS
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
- Requête cross-origin bloquée

**Solutions :**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Problèmes de Gestion d'Environnement

### Problème : Problèmes de changement d'environnement
**Symptômes :**
- Mauvais environnement utilisé
- La configuration ne change pas correctement

**Solutions :**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Problème : Corruption de l'environnement
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

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Problèmes de Performance

### Problème : Temps de déploiement trop longs
**Symptômes :**
- Les déploiements prennent trop de temps
- Délais d'attente pendant le déploiement

**Solutions :**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Problème : Problèmes de performance de l'application
**Symptômes :**
- Temps de réponse lents
- Utilisation élevée des ressources

**Solutions :**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Outils et Commandes de Dépannage

### Commandes de Débogage
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Analyse des Journaux
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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
- Problèmes liés à la facturation ou à l'abonnement
- Préoccupations ou incidents de sécurité

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

### Informations à Collecter
Avant de contacter le support, rassemblez :
- Résultat de `azd version`
- Résultat de `azd info`
- Messages d'erreur (texte complet)
- Étapes pour reproduire le problème
- Détails de l'environnement (`azd env show`)
- Chronologie du début du problème

### Script de Collecte des Journaux
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prévention des Problèmes

### Liste de Vérification Avant Déploiement
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

### Configuration de la Surveillance
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Maintenance Régulière
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Ressources Associées

- [Guide de Débogage](debugging.md) - Techniques avancées de débogage
- [Provision de Ressources](../deployment/provisioning.md) - Dépannage de l'infrastructure
- [Planification de Capacité](../pre-deployment/capacity-planning.md) - Conseils pour la planification des ressources
- [Sélection de SKU](../pre-deployment/sku-selection.md) - Recommandations sur les niveaux de service

---

**Astuce** : Gardez ce guide en favori et consultez-le chaque fois que vous rencontrez des problèmes. La plupart des problèmes ont déjà été rencontrés et ont des solutions établies !

---

**Navigation**
- **Leçon Précédente** : [Provision de Ressources](../deployment/provisioning.md)
- **Leçon Suivante** : [Guide de Débogage](debugging.md)

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.