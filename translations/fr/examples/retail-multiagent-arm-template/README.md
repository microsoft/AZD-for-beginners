<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T13:39:18+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "fr"
}
-->
# Solution Multi-Agent pour le Commerce de Détail - Déploiement du Modèle ARM

**Chapitre 5 : Package de Déploiement en Production**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre associé** : [Chapitre 5 : Solutions IA Multi-Agent](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Guide du scénario** : [Implémentation complète](../retail-scenario.md)
- **🎯 Déploiement rapide** : [Déploiement en un clic](../../../../examples/retail-multiagent-arm-template)

Ce répertoire contient un modèle complet Azure Resource Manager (ARM) pour déployer la solution de support client multi-agent pour le commerce de détail, fournissant une infrastructure en tant que code pour toute l'architecture.

## 🎯 Ce qui est déployé

### Infrastructure principale
- **Services Azure OpenAI** (Multi-régions pour une haute disponibilité)
  - Région principale : GPT-4o pour l'agent client
  - Région secondaire : GPT-4o-mini pour l'agent inventaire  
  - Région tertiaire : Modèle d'embeddings textuels
  - Région d'évaluation : Modèle GPT-4o pour l'évaluation
- **Azure AI Search** avec capacités de recherche vectorielle
- **Compte de stockage Azure** avec conteneurs blob pour les documents et les téléchargements
- **Environnement Azure Container Apps** avec mise à l'échelle automatique
- **Container Apps** pour le routeur d'agents et le frontend
- **Azure Cosmos DB** pour le stockage de l'historique des conversations
- **Azure Key Vault** pour la gestion des secrets (optionnel)
- **Application Insights** et Log Analytics pour la surveillance (optionnel)
- **Document Intelligence** pour le traitement des documents
- **API Bing Search** pour des informations en temps réel

### Modes de déploiement

| Mode | Description | Cas d'utilisation | Ressources |
|------|-------------|-------------------|------------|
| **Minimal** | Déploiement basique optimisé pour les coûts | Développement, tests | SKUs basiques, région unique, capacité réduite |
| **Standard** | Déploiement équilibré pour les charges de production | Production, échelle modérée | SKUs standards, multi-régions, capacité standard |
| **Premium** | Déploiement haute performance pour les entreprises | Entreprise, grande échelle | SKUs premium, multi-régions, haute capacité |

## 📋 Prérequis

1. **Azure CLI** installé et configuré
2. **Abonnement Azure actif** avec quotas suffisants
3. **Permissions appropriées** pour créer des ressources dans l'abonnement cible
4. **Quotas de ressources** pour :
   - Azure OpenAI (vérifiez la disponibilité régionale)
   - Container Apps (varie selon la région)
   - AI Search (niveau standard ou supérieur recommandé)

## 🚀 Déploiement rapide

### Option 1 : Utiliser Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Option 2 : Utiliser le portail Azure

[![Déployer sur Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Option 3 : Utiliser directement Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Options de configuration

### Paramètres du modèle

| Paramètre | Type | Valeur par défaut | Description |
|-----------|------|-------------------|-------------|
| `projectName` | string | "retail" | Préfixe pour tous les noms de ressources |
| `location` | string | Emplacement du groupe de ressources | Région principale de déploiement |
| `secondaryLocation` | string | "westus2" | Région secondaire pour le déploiement multi-régions |
| `tertiaryLocation` | string | "francecentral" | Région pour le modèle d'embeddings |
| `environmentName` | string | "dev" | Désignation de l'environnement (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Configuration de déploiement (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Activer le déploiement multi-régions |
| `enableMonitoring` | bool | true | Activer Application Insights et la journalisation |
| `enableSecurity` | bool | true | Activer Key Vault et la sécurité renforcée |

### Personnalisation des paramètres

Modifier `azuredeploy.parameters.json` :

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Vue d'ensemble de l'architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Utilisation du script de déploiement

Le script `deploy.sh` offre une expérience de déploiement interactive :

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Fonctionnalités du script

- ✅ **Validation des prérequis** (Azure CLI, statut de connexion, fichiers de modèle)
- ✅ **Gestion des groupes de ressources** (création si inexistant)
- ✅ **Validation du modèle** avant déploiement
- ✅ **Suivi de progression** avec sortie colorée
- ✅ **Affichage des résultats du déploiement**
- ✅ **Guidance post-déploiement**

## 📊 Surveillance du déploiement

### Vérifier le statut du déploiement

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Résultats du déploiement

Après un déploiement réussi, les résultats suivants sont disponibles :

- **URL du frontend** : Point d'accès public pour l'interface web
- **URL du routeur** : Point d'accès API pour le routeur d'agents
- **Points d'accès OpenAI** : Points d'accès principaux et secondaires des services OpenAI
- **Service de recherche** : Point d'accès du service Azure AI Search
- **Compte de stockage** : Nom du compte de stockage pour les documents
- **Key Vault** : Nom du Key Vault (si activé)
- **Application Insights** : Nom du service de surveillance (si activé)

## 🔧 Configuration post-déploiement

### 1. Configurer l'index de recherche

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. Télécharger les données initiales

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Tester les points d'accès des agents

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Configurer les Container Apps

Le modèle ARM déploie des images de conteneurs de remplacement. Pour déployer le code réel des agents :

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Résolution des problèmes

### Problèmes courants

#### 1. Quota Azure OpenAI dépassé

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Échec du déploiement des Container Apps

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Initialisation du service de recherche

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validation du déploiement

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Considérations de sécurité

### Gestion des clés
- Tous les secrets sont stockés dans Azure Key Vault (si activé)
- Les Container Apps utilisent une identité managée pour l'authentification
- Les comptes de stockage ont des paramètres sécurisés par défaut (HTTPS uniquement, pas d'accès public aux blobs)

### Sécurité réseau
- Les Container Apps utilisent un réseau interne lorsque possible
- Le service de recherche est configuré avec l'option de points d'accès privés
- Cosmos DB est configuré avec les permissions minimales nécessaires

### Configuration RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimisation des coûts

### Estimations des coûts (mensuels, USD)

| Mode | OpenAI | Container Apps | Recherche | Stockage | Total estimé |
|------|--------|----------------|-----------|----------|--------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Surveillance des coûts

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Mises à jour et maintenance

### Mises à jour du modèle
- Versionner les fichiers de modèle ARM
- Tester les modifications dans un environnement de développement en premier
- Utiliser le mode de déploiement incrémental pour les mises à jour

### Mises à jour des ressources
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Sauvegarde et récupération
- Sauvegarde automatique activée pour Cosmos DB
- Suppression douce activée pour Key Vault
- Révisions des Container Apps maintenues pour un retour en arrière

## 📞 Support

- **Problèmes liés au modèle** : [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Support Azure** : [Portail de support Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Communauté** : [Discord Azure AI](https://discord.gg/microsoft-azure)

---

**⚡ Prêt à déployer votre solution multi-agent ?**

Commencez avec : `./deploy.sh -g myResourceGroup`

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de faire appel à une traduction professionnelle humaine. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.