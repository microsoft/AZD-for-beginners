<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-19T14:25:04+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "fr"
}
-->
# Solution multi-agents pour le commerce de détail - Modèle d'infrastructure

**Chapitre 5 : Package de déploiement en production**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre associé** : [Chapitre 5 : Solutions IA multi-agents](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Guide du scénario** : [Architecture complète](../retail-scenario.md)
- **🎯 Déploiement rapide** : [Déploiement en un clic](../../../../examples/retail-multiagent-arm-template)

> **⚠️ MODÈLE D'INFRASTRUCTURE UNIQUEMENT**  
> Ce modèle ARM déploie des **ressources Azure** pour un système multi-agents.  
>  
> **Ce qui est déployé (15-25 minutes) :**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings dans 3 régions)
> - ✅ Service de recherche IA (vide, prêt pour la création d'index)
> - ✅ Applications conteneurs (images de remplacement, prêtes pour votre code)
> - ✅ Stockage, Cosmos DB, Key Vault, Application Insights
>  
> **Ce qui n'est PAS inclus (nécessite un développement) :**
> - ❌ Code d'implémentation des agents (Agent client, Agent inventaire)
> - ❌ Logique de routage et points de terminaison API
> - ❌ Interface utilisateur de chat frontend
> - ❌ Schémas d'index de recherche et pipelines de données
> - ❌ **Effort de développement estimé : 80-120 heures**
>  
> **Utilisez ce modèle si :**
> - ✅ Vous souhaitez provisionner une infrastructure Azure pour un projet multi-agents
> - ✅ Vous prévoyez de développer séparément l'implémentation des agents
> - ✅ Vous avez besoin d'une base d'infrastructure prête pour la production
>  
> **Ne l'utilisez pas si :**
> - ❌ Vous attendez une démonstration multi-agents fonctionnelle immédiatement
> - ❌ Vous recherchez des exemples de code d'application complet

## Aperçu

Ce répertoire contient un modèle complet Azure Resource Manager (ARM) pour déployer la **fondation d'infrastructure** d'un système de support client multi-agents. Le modèle provisionne tous les services Azure nécessaires, correctement configurés et interconnectés, prêts pour le développement de votre application.

**Après le déploiement, vous aurez :** Une infrastructure Azure prête pour la production  
**Pour compléter le système, vous aurez besoin :** Du code des agents, de l'interface utilisateur frontend et de la configuration des données (voir [Guide d'architecture](../retail-scenario.md))

## 🎯 Ce qui est déployé

### Infrastructure principale (Statut après déploiement)

✅ **Services Azure OpenAI** (Prêts pour les appels API)
  - Région principale : Déploiement GPT-4o (capacité de 20K TPM)
  - Région secondaire : Déploiement GPT-4o-mini (capacité de 10K TPM)
  - Région tertiaire : Modèle d'embeddings textuels (capacité de 30K TPM)
  - Région d'évaluation : Modèle évaluateur GPT-4o (capacité de 15K TPM)
  - **Statut :** Entièrement fonctionnel - appels API possibles immédiatement

✅ **Recherche IA Azure** (Vide - prêt pour la configuration)
  - Capacités de recherche vectorielle activées
  - Niveau standard avec 1 partition, 1 réplique
  - **Statut :** Service opérationnel, mais nécessite la création d'index
  - **Action requise :** Créer un index de recherche avec votre schéma

✅ **Compte de stockage Azure** (Vide - prêt pour les téléchargements)
  - Conteneurs Blob : `documents`, `uploads`
  - Configuration sécurisée (HTTPS uniquement, aucun accès public)
  - **Statut :** Prêt à recevoir des fichiers
  - **Action requise :** Télécharger vos données produits et documents

⚠️ **Environnement d'applications conteneurs** (Images de remplacement déployées)
  - Application de routage des agents (image par défaut nginx)
  - Application frontend (image par défaut nginx)
  - Configuration d'auto-scaling (0-10 instances)
  - **Statut :** Conteneurs de remplacement en cours d'exécution
  - **Action requise :** Construire et déployer vos applications d'agents

✅ **Azure Cosmos DB** (Vide - prêt pour les données)
  - Base de données et conteneur préconfigurés
  - Optimisé pour les opérations à faible latence
  - TTL activé pour le nettoyage automatique
  - **Statut :** Prêt à stocker l'historique des chats

✅ **Azure Key Vault** (Optionnel - prêt pour les secrets)
  - Suppression douce activée
  - RBAC configuré pour les identités gérées
  - **Statut :** Prêt à stocker les clés API et chaînes de connexion

✅ **Application Insights** (Optionnel - surveillance active)
  - Connecté à l'espace de travail Log Analytics
  - Métriques personnalisées et alertes configurées
  - **Statut :** Prêt à recevoir la télémétrie de vos applications

✅ **Intelligence documentaire** (Prêt pour les appels API)
  - Niveau S0 pour les charges de travail en production
  - **Statut :** Prêt à traiter les documents téléchargés

✅ **API Bing Search** (Prêt pour les appels API)
  - Niveau S1 pour les recherches en temps réel
  - **Statut :** Prêt pour les requêtes de recherche web

### Modes de déploiement

| Mode | Capacité OpenAI | Instances de conteneurs | Niveau de recherche | Redondance de stockage | Idéal pour |
|------|-----------------|-------------------------|---------------------|-----------------------|------------|
| **Minimal** | 10K-20K TPM | 0-2 répliques | Basique | LRS (Local) | Développement/test, apprentissage, preuve de concept |
| **Standard** | 30K-60K TPM | 2-5 répliques | Standard | ZRS (Zone) | Production, trafic modéré (<10K utilisateurs) |
| **Premium** | 80K-150K TPM | 5-10 répliques, redondance zonale | Premium | GRS (Géo) | Entreprise, trafic élevé (>10K utilisateurs), SLA 99,99% |

**Impact sur les coûts :**
- **Minimal → Standard :** Augmentation des coûts ~4x (100-370 $/mois → 420-1 450 $/mois)
- **Standard → Premium :** Augmentation des coûts ~3x (420-1 450 $/mois → 1 150-3 500 $/mois)
- **Choisissez en fonction de :** Charge attendue, exigences SLA, contraintes budgétaires

**Planification de la capacité :**
- **TPM (Tokens Par Minute) :** Total sur tous les déploiements de modèles
- **Instances de conteneurs :** Plage d'auto-scaling (répliques min-max)
- **Niveau de recherche :** Impacte les performances des requêtes et les limites de taille des index

## 📋 Prérequis

### Outils requis
1. **Azure CLI** (version 2.50.0 ou supérieure)
   ```bash
   az --version  # Vérifier la version
   az login      # Authentifier
   ```

2. **Abonnement Azure actif** avec accès Propriétaire ou Contributeur
   ```bash
   az account show  # Vérifier l'abonnement
   ```

### Quotas Azure requis

Avant le déploiement, vérifiez les quotas suffisants dans vos régions cibles :

```bash
# Vérifiez la disponibilité d'Azure OpenAI dans votre région
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Vérifiez le quota OpenAI (exemple pour gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Vérifiez le quota des applications de conteneur
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Quotas minimaux requis :**
- **Azure OpenAI :** 3-4 déploiements de modèles dans plusieurs régions
  - GPT-4o : 20K TPM (Tokens Par Minute)
  - GPT-4o-mini : 10K TPM
  - text-embedding-ada-002 : 30K TPM
  - **Remarque :** GPT-4o peut être en liste d'attente dans certaines régions - vérifiez [disponibilité des modèles](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Applications conteneurs :** Environnement géré + 2-10 instances de conteneurs
- **Recherche IA :** Niveau standard (Basique insuffisant pour la recherche vectorielle)
- **Cosmos DB :** Débit provisionné standard

**Si les quotas sont insuffisants :**
1. Accédez au portail Azure → Quotas → Demander une augmentation
2. Ou utilisez Azure CLI :
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Envisagez des régions alternatives avec disponibilité

## 🚀 Déploiement rapide

### Option 1 : Utilisation de Azure CLI

```bash
# Cloner ou télécharger les fichiers modèles
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Rendre le script de déploiement exécutable
chmod +x deploy.sh

# Déployer avec les paramètres par défaut
./deploy.sh -g myResourceGroup

# Déployer pour la production avec des fonctionnalités premium
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Option 2 : Utilisation du portail Azure

[![Déployer sur Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Option 3 : Utilisation directe de Azure CLI

```bash
# Créer un groupe de ressources
az group create --name myResourceGroup --location eastus2

# Déployer le modèle
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Chronologie du déploiement

### À quoi s'attendre

| Phase | Durée | Ce qui se passe |
|-------|-------|-----------------||
| **Validation du modèle** | 30-60 secondes | Azure valide la syntaxe et les paramètres du modèle ARM |
| **Configuration du groupe de ressources** | 10-20 secondes | Crée le groupe de ressources (si nécessaire) |
| **Provisionnement OpenAI** | 5-8 minutes | Crée 3-4 comptes OpenAI et déploie les modèles |
| **Applications conteneurs** | 3-5 minutes | Crée l'environnement et déploie les conteneurs de remplacement |
| **Recherche et stockage** | 2-4 minutes | Provisionne le service de recherche IA et les comptes de stockage |
| **Cosmos DB** | 2-3 minutes | Crée la base de données et configure les conteneurs |
| **Configuration de la surveillance** | 2-3 minutes | Configure Application Insights et Log Analytics |
| **Configuration RBAC** | 1-2 minutes | Configure les identités gérées et les permissions |
| **Déploiement total** | **15-25 minutes** | Infrastructure complète prête |

**Après le déploiement :**
- ✅ **Infrastructure prête :** Tous les services Azure provisionnés et opérationnels
- ⏱️ **Développement d'application :** 80-120 heures (votre responsabilité)
- ⏱️ **Configuration des index :** 15-30 minutes (nécessite votre schéma)
- ⏱️ **Téléchargement des données :** Variable selon la taille du dataset
- ⏱️ **Tests et validation :** 2-4 heures

---

## ✅ Vérification du succès du déploiement

### Étape 1 : Vérifiez le provisionnement des ressources (2 minutes)

```bash
# Vérifiez que toutes les ressources ont été déployées avec succès
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Attendu :** Tableau vide (toutes les ressources affichent le statut "Succeeded")

### Étape 2 : Vérifiez les déploiements Azure OpenAI (3 minutes)

```bash
# Lister tous les comptes OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Vérifier les déploiements de modèles pour la région principale
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Attendu :** 
- 3-4 comptes OpenAI (régions principale, secondaire, tertiaire, évaluation)
- 1-2 déploiements de modèles par compte (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Étape 3 : Testez les points de terminaison de l'infrastructure (5 minutes)

```bash
# Obtenir les URL de l'application conteneur
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Tester le point de terminaison du routeur (une image de remplacement répondra)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Attendu :** 
- Les applications conteneurs affichent le statut "Running"
- Nginx de remplacement répond avec HTTP 200 ou 404 (pas encore de code d'application)

### Étape 4 : Vérifiez l'accès API Azure OpenAI (3 minutes)

```bash
# Obtenir le point de terminaison et la clé OpenAI
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Tester le déploiement de GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Attendu :** Réponse JSON avec complétion de chat (confirme que OpenAI est fonctionnel)

### Ce qui fonctionne vs. ce qui ne fonctionne pas

**✅ Fonctionne après le déploiement :**
- Modèles Azure OpenAI déployés et acceptant les appels API
- Service de recherche IA opérationnel (vide, pas encore d'index)
- Applications conteneurs opérationnelles (images nginx de remplacement)
- Comptes de stockage accessibles et prêts pour les téléchargements
- Cosmos DB prêt pour les opérations de données
- Application Insights collectant la télémétrie de l'infrastructure
- Key Vault prêt pour le stockage des secrets

**❌ Ne fonctionne pas encore (nécessite un développement) :**
- Points de terminaison des agents (aucun code d'application déployé)
- Fonctionnalité de chat (nécessite une implémentation frontend + backend)
- Requêtes de recherche (aucun index de recherche créé)
- Pipeline de traitement des documents (aucune donnée téléchargée)
- Télémétrie personnalisée (nécessite l'instrumentation des applications)

**Prochaines étapes :** Voir [Configuration post-déploiement](../../../../examples/retail-multiagent-arm-template) pour développer et déployer votre application

---

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

Modifiez `azuredeploy.parameters.json` :

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

## 🏗️ Aperçu de l'architecture

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
# Afficher l'aide
./deploy.sh --help

# Déploiement de base
./deploy.sh -g myResourceGroup

# Déploiement avancé avec paramètres personnalisés
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Déploiement de développement sans multi-région
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
- ✅ **Validation du modèle** avant le déploiement
- ✅ **Suivi de progression** avec sortie colorée
- ✅ **Affichage des résultats du déploiement**
- ✅ **Guidance post-déploiement**

## 📊 Surveillance du déploiement

### Vérifiez le statut du déploiement

```bash
# Lister les déploiements
az deployment group list --resource-group myResourceGroup --output table

# Obtenir les détails du déploiement
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Surveiller la progression du déploiement
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Résultats du déploiement

Après un déploiement réussi, les résultats suivants sont disponibles :

- **URL frontend** : Point de terminaison public pour l'interface web
- **URL du routeur** : Point de terminaison API pour le routeur des agents
- **Points de terminaison OpenAI** : Points de terminaison des services OpenAI principaux et secondaires
- **Service de recherche** : Point de terminaison du service de recherche IA Azure
- **Compte de stockage** : Nom du compte de stockage pour les documents
- **Key Vault** : Nom du Key Vault (si activé)
- **Application Insights** : Nom du service de surveillance (si activé)

## 🔧 Post-déploiement : Prochaines étapes
> **📝 Important :** L'infrastructure est déployée, mais vous devez développer et déployer le code de l'application.

### Phase 1 : Développer les applications d'agent (Votre responsabilité)

Le modèle ARM crée des **Container Apps vides** avec des images nginx de remplacement. Vous devez :

**Développement requis :**
1. **Implémentation des agents** (30-40 heures)
   - Agent de service client avec intégration GPT-4o
   - Agent d'inventaire avec intégration GPT-4o-mini
   - Logique de routage des agents

2. **Développement Frontend** (20-30 heures)
   - Interface utilisateur de chat (React/Vue/Angular)
   - Fonctionnalité de téléchargement de fichiers
   - Rendu et mise en forme des réponses

3. **Services Backend** (12-16 heures)
   - Routeur FastAPI ou Express
   - Middleware d'authentification
   - Intégration de la télémétrie

**Voir :** [Guide d'architecture](../retail-scenario.md) pour des modèles d'implémentation détaillés et des exemples de code

### Phase 2 : Configurer l'index de recherche AI (15-30 minutes)

Créez un index de recherche correspondant à votre modèle de données :

```bash
# Obtenez les détails du service de recherche
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Créez un index avec votre schéma (exemple)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Ressources :**
- [Conception du schéma d'index de recherche AI](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Configuration de la recherche vectorielle](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Phase 3 : Téléchargez vos données (Durée variable)

Une fois que vous avez les données produits et documents :

```bash
# Obtenez les détails du compte de stockage
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Téléchargez vos documents
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Exemple : Téléchargez un fichier unique
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Phase 4 : Construire et déployer vos applications (8-12 heures)

Une fois que vous avez développé le code de vos agents :

```bash
# 1. Créer un registre de conteneurs Azure (si nécessaire)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Construire et pousser l'image du routeur d'agent
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Construire et pousser l'image du frontend
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Mettre à jour les applications de conteneurs avec vos images
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Configurer les variables d'environnement
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Phase 5 : Tester votre application (2-4 heures)

```bash
# Obtenez l'URL de votre application
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Tester le point de terminaison de l'agent (une fois votre code déployé)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Vérifiez les journaux de l'application
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Ressources d'implémentation

**Architecture et conception :**
- 📖 [Guide complet d'architecture](../retail-scenario.md) - Modèles d'implémentation détaillés
- 📖 [Modèles de conception multi-agents](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Exemples de code :**
- 🔗 [Exemple de chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Modèle RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Framework d'agent (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orchestration d'agents (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Conversations multi-agents

**Effort total estimé :**
- Déploiement de l'infrastructure : 15-25 minutes (✅ Terminé)
- Développement des applications : 80-120 heures (🔨 Votre travail)
- Tests et optimisation : 15-25 heures (🔨 Votre travail)

## 🛠️ Dépannage

### Problèmes courants

#### 1. Quota Azure OpenAI dépassé

```bash
# Vérifier l'utilisation actuelle du quota
az cognitiveservices usage list --location eastus2

# Demander une augmentation de quota
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Échec du déploiement des Container Apps

```bash
# Vérifiez les journaux de l'application conteneur
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Redémarrez l'application conteneur
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Initialisation du service de recherche

```bash
# Vérifier l'état du service de recherche
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Tester la connectivité du service de recherche
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validation du déploiement

```bash
# Valider que toutes les ressources sont créées
az resource list \
  --resource-group myResourceGroup \
  --output table

# Vérifier l'état de santé des ressources
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Considérations de sécurité

### Gestion des clés
- Tous les secrets sont stockés dans Azure Key Vault (lorsqu'activé)
- Les Container Apps utilisent une identité managée pour l'authentification
- Les comptes de stockage ont des paramètres sécurisés par défaut (HTTPS uniquement, pas d'accès public aux blobs)

### Sécurité réseau
- Les Container Apps utilisent un réseau interne lorsque possible
- Le service de recherche est configuré avec l'option des points de terminaison privés
- Cosmos DB est configuré avec les permissions minimales nécessaires

### Configuration RBAC
```bash
# Assigner les rôles nécessaires pour l'identité gérée
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

### Suivi des coûts

```bash
# Configurer des alertes budgétaires
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Mises à jour et maintenance

### Mises à jour des modèles
- Versionnez les fichiers de modèles ARM
- Testez les modifications dans un environnement de développement d'abord
- Utilisez le mode de déploiement incrémental pour les mises à jour

### Mises à jour des ressources
```bash
# Mettre à jour avec de nouveaux paramètres
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Sauvegarde et récupération
- Sauvegarde automatique activée pour Cosmos DB
- Suppression réversible activée pour Key Vault
- Révisions des Container Apps maintenues pour un retour en arrière

## 📞 Support

- **Problèmes de modèle :** [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Support Azure :** [Portail de support Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Communauté :** [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Prêt à déployer votre solution multi-agents ?**

Commencez avec : `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->