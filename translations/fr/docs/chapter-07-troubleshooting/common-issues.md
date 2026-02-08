# Problèmes courants et solutions

**Navigation du chapitre :**
- **📚 Accueil du cours**: [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel**: Chapitre 7 - Dépannage & débogage
- **⬅️ Chapitre précédent**: [Chapitre 6 : Contrôles préalables](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Suivant**: [Guide de débogage](debugging.md)
- **🚀 Chapitre suivant**: [Chapitre 8 : Modèles de production et d'entreprise](../chapter-08-production/production-ai-practices.md)

## Introduction

Ce guide complet de dépannage couvre les problèmes les plus fréquemment rencontrés lors de l'utilisation d'Azure Developer CLI. Apprenez à diagnostiquer, dépanner et résoudre les problèmes courants liés à l'authentification, au déploiement, au provisionnement de l'infrastructure et à la configuration des applications. Chaque problème inclut des symptômes détaillés, les causes profondes et des procédures de résolution étape par étape.

## Objectifs d'apprentissage

En terminant ce guide, vous allez :
- Maîtriser les techniques de diagnostic pour les problèmes d'Azure Developer CLI
- Comprendre les problèmes courants d'authentification et d'autorisations ainsi que leurs solutions
- Résoudre les échecs de déploiement, les erreurs de provisionnement d'infrastructure et les problèmes de configuration
- Mettre en œuvre des stratégies proactives de surveillance et de débogage
- Appliquer des méthodologies de dépannage systématiques pour les problèmes complexes
- Configurer une journalisation et une surveillance appropriées pour prévenir les problèmes futurs

## Résultats d'apprentissage

Après avoir terminé, vous serez capable de :
- Diagnostiquer les problèmes d'Azure Developer CLI à l'aide des outils de diagnostic intégrés
- Résoudre de manière autonome les problèmes d'authentification, d'abonnement et d'autorisations
- Dépanner efficacement les échecs de déploiement et les erreurs de provisionnement d'infrastructure
- Déboguer les problèmes de configuration d'application et les problèmes spécifiques à l'environnement
- Mettre en place la surveillance et les alertes pour identifier de manière proactive les problèmes potentiels
- Appliquer les bonnes pratiques pour la journalisation, le débogage et les workflows de résolution de problèmes

## Diagnostics rapides

Avant d'examiner des problèmes spécifiques, exécutez ces commandes pour recueillir des informations de diagnostic :

```bash
# Vérifier la version et l'état d'azd
azd version
azd config list

# Vérifier l'authentification Azure
az account show
az account list

# Vérifier l'environnement actuel
azd env show
azd env get-values

# Activer la journalisation de débogage
export AZD_DEBUG=true
azd <command> --debug
```

## Problèmes d'authentification

### Problème : "Échec de l'obtention du jeton d'accès"
**Symptômes :**
- `azd up` échoue avec des erreurs d'authentification
- Les commandes renvoient "non autorisé" ou "accès refusé"

**Solutions :**
```bash
# 1. Se réauthentifier avec Azure CLI
az login
az account show

# 2. Effacer les informations d'identification mises en cache
az account clear
az login

# 3. Utiliser le flux de code d'appareil (pour les systèmes sans interface graphique)
az login --use-device-code

# 4. Définir explicitement l'abonnement
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problème : "Privilèges insuffisants" lors du déploiement
**Symptômes :**
- Le déploiement échoue avec des erreurs d'autorisation
- Impossible de créer certaines ressources Azure

**Solutions :**
```bash
# 1. Vérifiez vos attributions de rôles Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Assurez-vous d'avoir les rôles requis
# - Contributeur (pour la création de ressources)
# - Administrateur de l'accès utilisateur (pour les attributions de rôle)

# 3. Contactez votre administrateur Azure pour obtenir les autorisations appropriées
```

### Problème : problèmes d'authentification multi-locataire
**Solutions :**
```bash
# 1. Se connecter avec un locataire spécifique
az login --tenant "your-tenant-id"

# 2. Définir le locataire dans la configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Vider le cache du locataire lors du changement de locataire
az account clear
```

## 🏗️ Erreurs de provisionnement d'infrastructure

### Problème : Conflits de noms de ressources
**Symptômes :**
- Erreurs "Le nom de ressource existe déjà"
- Le déploiement échoue lors de la création des ressources

**Solutions :**
```bash
# 1. Utilisez des noms de ressources uniques avec des jetons
# Dans votre modèle Bicep :
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Modifiez le nom de l'environnement
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Supprimez les ressources existantes
azd down --force --purge
```

### Problème : Emplacement/Région non disponible
**Symptômes :**
- "La région 'xyz' n'est pas disponible pour le type de ressource"
- Certaines SKU non disponibles dans la région sélectionnée

**Solutions :**
```bash
# 1. Vérifier les emplacements disponibles pour les types de ressources
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Utiliser des régions couramment disponibles
azd config set defaults.location eastus2
# ou
azd env set AZURE_LOCATION eastus2

# 3. Vérifier la disponibilité des services par région
# Visitez : https://azure.microsoft.com/global-infrastructure/services/
```

### Problème : Quota dépassé
**Symptômes :**
- "Quota dépassé pour le type de ressource"
- "Nombre maximum de ressources atteint"

**Solutions :**
```bash
# 1. Vérifier l'utilisation actuelle des quotas
az vm list-usage --location eastus2 -o table

# 2. Demander une augmentation des quotas via le portail Azure
# Aller à : Abonnements > Utilisation + quotas

# 3. Utiliser des SKU plus petits pour le développement
# Dans main.parameters.json :
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Supprimer les ressources inutilisées
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problème : Erreurs de modèle Bicep
**Symptômes :**
- Échecs de validation du modèle
- Erreurs de syntaxe dans les fichiers Bicep

**Solutions :**
```bash
# 1. Valider la syntaxe Bicep
az bicep build --file infra/main.bicep

# 2. Utiliser le linter Bicep
az bicep lint --file infra/main.bicep

# 3. Vérifier la syntaxe du fichier de paramètres
cat infra/main.parameters.json | jq '.'

# 4. Prévisualiser les modifications de déploiement
azd provision --preview
```

## 🚀 Échecs de déploiement

### Problème : Échecs de compilation
**Symptômes :**
- L'application échoue à se compiler lors du déploiement
- Erreurs d'installation de paquets

**Solutions :**
```bash
# 1. Vérifier la sortie de compilation avec l'option de débogage
azd deploy --service web --debug

# 2. Voir l'état du service déployé
azd show

# 3. Tester la compilation localement
cd src/web
npm install
npm run build

# 3. Vérifier la compatibilité des versions de Node.js et de Python
node --version  # Doit correspondre aux paramètres du fichier azure.yaml
python --version

# 4. Vider le cache de compilation
rm -rf node_modules package-lock.json
npm install

# 5. Vérifier le Dockerfile si vous utilisez des conteneurs
docker build -t test-image .
docker run --rm test-image
```

### Problème : Échecs de déploiement de conteneurs
**Symptômes :**
- Les applications conteneurisées ne démarrent pas
- Erreurs de récupération d'image

**Solutions :**
```bash
# 1. Tester la construction Docker localement
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Vérifier les journaux du conteneur avec Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Surveiller l'application via azd
azd monitor --logs

# 3. Vérifier l'accès au registre de conteneurs
az acr login --name myregistry

# 4. Vérifier la configuration de l'application conteneurisée
az containerapp show --name my-app --resource-group my-rg
```

### Problème : Échecs de connexion à la base de données
**Symptômes :**
- L'application ne peut pas se connecter à la base de données
- Erreurs de délai d'attente de connexion

**Solutions :**
```bash
# 1. Vérifiez les règles du pare-feu de la base de données
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testez la connectivité depuis l'application
# Ajoutez temporairement à votre application :
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Vérifiez le format de la chaîne de connexion
azd env get-values | grep DATABASE

# 4. Vérifiez l'état du serveur de base de données
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problèmes de configuration

### Problème : Les variables d'environnement ne fonctionnent pas
**Symptômes :**
- L'application ne peut pas lire les valeurs de configuration
- Les variables d'environnement apparaissent vides

**Solutions :**
```bash
# 1. Vérifier que les variables d'environnement sont définies
azd env get-values
azd env get DATABASE_URL

# 2. Vérifier les noms des variables dans azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Redémarrer l'application
azd deploy --service web

# 4. Vérifier la configuration du service d'application
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problème : Problèmes de certificat SSL/TLS
**Symptômes :**
- Le HTTPS ne fonctionne pas
- Erreurs de validation de certificat

**Solutions :**
```bash
# 1. Vérifier l'état du certificat SSL
az webapp config ssl list --resource-group myrg

# 2. Activer uniquement HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Ajouter un domaine personnalisé (si nécessaire)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problème : Problèmes de configuration CORS
**Symptômes :**
- Le front-end ne peut pas appeler l'API
- Requête cross-origin bloquée

**Solutions :**
```bash
# 1. Configurer CORS pour App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Mettre à jour l'API pour gérer CORS
# Dans Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Vérifier si l'application s'exécute aux URL correctes
azd show
```

## 🌍 Problèmes de gestion des environnements

### Problème : Basculement d'environnement
**Symptômes :**
- Mauvais environnement utilisé
- La configuration ne bascule pas correctement

**Solutions :**
```bash
# 1. Lister tous les environnements
azd env list

# 2. Sélectionner explicitement l'environnement
azd env select production

# 3. Vérifier l'environnement actuel
azd env show

# 4. Créer un nouvel environnement si celui-ci est corrompu
azd env new production-new
azd env select production-new
```

### Problème : Corruption d'environnement
**Symptômes :**
- L'environnement affiche un état invalide
- Les ressources ne correspondent pas à la configuration

**Solutions :**
```bash
# 1. Rafraîchir l'état de l'environnement
azd env refresh

# 2. Réinitialiser la configuration de l'environnement
azd env new production-reset
# Copier les variables d'environnement requises
azd env set DATABASE_URL "your-value"

# 3. Importer les ressources existantes (si possible)
# Mettre à jour manuellement .azure/production/config.json avec les ID des ressources
```

## 🔍 Problèmes de performance

### Problème : Temps de déploiement lents
**Symptômes :**
- Les déploiements prennent trop de temps
- Délai d'attente lors du déploiement

**Solutions :**
```bash
# 1. Déployer des services spécifiques pour itérer plus rapidement
azd deploy --service web
azd deploy --service api

# 2. Déployer uniquement le code lorsque l'infrastructure n'a pas changé
azd deploy  # Plus rapide que azd up

# 3. Optimiser le processus de build
# Dans package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Vérifier les emplacements des ressources (utiliser la même région)
azd config set defaults.location eastus2
```

### Problème : Problèmes de performance de l'application
**Symptômes :**
- Temps de réponse lents
- Utilisation élevée des ressources

**Solutions :**
```bash
# 1. Augmenter les ressources
# Mettre à jour le SKU dans main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Activer la surveillance d'Application Insights
azd monitor --overview

# 3. Vérifier les journaux de l'application dans Azure
az webapp log tail --name myapp --resource-group myrg
# ou pour Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Mettre en place la mise en cache
# Ajouter un cache Redis à votre infrastructure
```

## 🛠️ Outils et commandes de dépannage

### Commandes de débogage
```bash
# Débogage complet
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Vérifier la version d'azd
azd version

# Afficher la configuration actuelle
azd config list

# Tester la connectivité
curl -v https://myapp.azurewebsites.net/health
```

### Analyse des journaux
```bash
# Journaux de l'application via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Surveiller l'application avec azd
azd monitor --logs
azd monitor --live

# Journaux des ressources Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Journaux des conteneurs (pour Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigation des ressources
```bash
# Lister toutes les ressources
az resource list --resource-group myrg -o table

# Vérifier l'état des ressources
az webapp show --name myapp --resource-group myrg --query state

# Diagnostics réseau
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Obtenir de l'aide supplémentaire

### Quand escalader
- Les problèmes d'authentification persistent après avoir essayé toutes les solutions
- Problèmes d'infrastructure avec les services Azure
- Problèmes liés à la facturation ou aux abonnements
- Problèmes ou incidents de sécurité

### Canaux de support
```bash
# 1. Vérifier l'état des services Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Créer un ticket de support Azure
# Aller sur: https://portal.azure.com -> Aide + support

# 3. Ressources communautaires
# - Stack Overflow: tag azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informations à recueillir
Avant de contacter le support, collectez :
- Sortie de `azd version`
- Sortie de `azd config list`
- Sortie de `azd show` (état actuel du déploiement)
- Messages d'erreur (texte complet)
- Étapes pour reproduire le problème
- Détails de l'environnement (`azd env show`)
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
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prévention des problèmes

### Liste de contrôle pré-déploiement
```bash
# 1. Valider l'authentification
az account show

# 2. Vérifier les quotas et les limites
az vm list-usage --location eastus2

# 3. Valider les modèles
az bicep build --file infra/main.bicep

# 4. Tester d'abord localement
npm run build
npm run test

# 5. Utiliser des déploiements en mode simulation
azd provision --preview
```

### Configuration de la surveillance
```bash
# Activer Application Insights
# Ajouter à main.bicep :
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Configurer des alertes
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Maintenance régulière
```bash
# Contrôles de santé hebdomadaires
./scripts/health-check.sh

# Revue mensuelle des coûts
az consumption usage list --billing-period-name 202401

# Revue de sécurité trimestrielle
az security assessment list --resource-group myrg
```

## Ressources associées

- [Guide de débogage](debugging.md) - Techniques avancées de débogage
- [Approvisionnement des ressources](../chapter-04-infrastructure/provisioning.md) - Résolution des problèmes d'infrastructure
- [Planification de la capacité](../chapter-06-pre-deployment/capacity-planning.md) - Conseils de planification des ressources
- [Sélection des SKU](../chapter-06-pre-deployment/sku-selection.md) - Recommandations de niveau de service

---

**Conseil** : Gardez ce guide dans vos favoris et consultez-le chaque fois que vous rencontrez des problèmes. La plupart des problèmes ont déjà été rencontrés et disposent de solutions établies !

---

**Navigation**
- **Leçon précédente**: [Approvisionnement des ressources](../chapter-04-infrastructure/provisioning.md)
- **Leçon suivante**: [Guide de débogage](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Clause de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction par IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle effectuée par un traducteur humain. Nous déclinons toute responsabilité pour les malentendus ou les interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->