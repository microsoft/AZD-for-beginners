# Intégration Microsoft Foundry avec AZD

**Navigation du Chapitre :**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 2 - Développement AI-First
- **⬅️ Chapitre Précédent** : [Chapitre 1 : Votre Premier Projet](../chapter-01-foundation/first-project.md)
- **➡️ Suivant** : [Agents AI](agents.md)
- **🚀 Chapitre Suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

## Vue d’ensemble

Ce guide montre comment intégrer les services Microsoft Foundry avec Azure Developer CLI (AZD) pour des déploiements d’applications AI simplifiés. Microsoft Foundry offre une plateforme complète pour la création, le déploiement et la gestion d'applications AI, tandis qu'AZD simplifie l'infrastructure et le processus de déploiement.

## Qu’est-ce que Microsoft Foundry ?

Microsoft Foundry est la plateforme unifiée de Microsoft pour le développement AI, qui comprend :

- **Catalogue de Modèles** : Accès à des modèles AI à la pointe de la technologie
- **Flux de Prompt** : Concepteur visuel pour les flux de travail AI
- **Portail Microsoft Foundry** : Environnement de développement intégré pour applications AI
- **Options de Déploiement** : Multiples options d’hébergement et de mise à l’échelle
- **Sécurité et Sûreté** : Fonctionnalités AI responsables intégrées

## AZD + Microsoft Foundry : Mieux Ensemble

| Fonctionnalité | Microsoft Foundry | Bénéfice de l’Intégration AZD |
|---------|-----------------|------------------------|
| **Déploiement de Modèles** | Déploiement manuel via portail | Déploiements automatisés et répétables |
| **Infrastructure** | Provisionnement par clic | Infrastructure as Code (Bicep) |
| **Gestion des Environnements** | Focus sur un seul environnement | Multi-environnement (dev/staging/prod) |
| **Intégration CI/CD** | Limitée | Support natif de GitHub Actions |
| **Gestion des Coûts** | Surveillance basique | Optimisation des coûts spécifique à l’environnement |

## Prérequis

- Abonnement Azure avec les permissions appropriées
- Azure Developer CLI installé
- Accès aux services Microsoft Foundry Models
- Familiarité basique avec Microsoft Foundry

> **Revue de version (2026-11-04) :** Les consignes AI CLI ont été vérifiées avec `azd` `1.37.2`, agents `1.0.0-beta.23`, et évaluations `1.0.0-beta.2` documentation/source. Utilisez `azd >= 1.37.0` pour le flux de travail combiné. Voir [changements et corrections de la version](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); cette revue ne certifie pas chaque modèle ou exemple SDK contre un déploiement en direct.

## Principaux Modèles d’Intégration

**Portée des exemples :** Le Bicep ci-dessous contient des fragments de ressources illustratifs, pas un modèle complet déployable. Le modèle parent doit définir les noms, `location`, ressources référencées, identités, sorties, et hébergement d’application. Utilisez un exemple lié pour un point de départ exécutable. Les exemples Bash nécessitent l’authentification Azure CLI séparée d’`azd auth login`.

### Modèle 1 : Intégration des Modèles Microsoft Foundry

**Cas d’usage** : Déploiement d’applications de chat avec les modèles Azure OpenAI dans Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**Infrastructure (main.bicep) :**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

L'appelant nécessite une identité managée attachée et `Cognitive Services OpenAI User` au niveau du compte ; désactiver les clés ne donne pas accès. Vérifiez la disponibilité région/modèle/SKU et le quota avant le déploiement.

### Modèle 2 : Recherche AI + Intégration RAG

**Cas d’usage** : Déploiement d’applications de génération augmentée par récupération (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

Il n’y a pas de ressource ARM `Microsoft.Search/searchServices/dataConnections` spécifique pour cette intégration. Configurez un index Search, source de données, indexeur/ensemble de compétences ou vectoriseur via les API supportées du plan de données Search. Si Search appelle un modèle d’embedding, activez son identité managée, accordez le rôle modèle pertinent, et configurez sa compétence vectorielle/embedding. Voir [vectorisation intégrée](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Modèle 3 : Intégration Document Intelligence

**Cas d’usage** : Flux de traitement et d’analyse documentaire

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Modèles de Configuration

### Configuration des Variables d’Environnement

Sauf pour les paramètres AZD documentés tels que `AZURE_LOCATION`, ce sont des **noms d’entrée personnalisés de modèle**. Ils n’ont aucun effet à moins que le modèle/application ne les consomme via les mappages de paramètres et environnement hôte. Pour `azure-search-openai-demo`, utilisez ses noms réels tels que `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` et `AZURE_SEARCH_SERVICE_SKU` à la place. La capacité du modèle n’est pas un SKU de compte.

**Configuration de Production :**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuration de Développement :**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Configuration Sécurisée avec Key Vault

Préférez Entra ID avec l’authentification locale par clé désactivée. Ce qui suit est seulement une **alternative d’authentification par clé legacy** pour les applications nécessitant des clés : cela requiert un compte avec l’authentification par clé activée, l’identité de l’application attachée à son hôte, et un accès Key Vault/réseau fonctionnel. Ne combinez pas la récupération de clé avec `disableLocalAuth: true` en espérant que les appels basés sur clé fonctionnent.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Flux de Déploiement

### Extensions AZD pour Foundry

AZD offre des extensions qui ajoutent des capacités spécifiques AI pour travailler avec les services Microsoft Foundry :

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

Les extensions AI évoluent encore rapidement en aperçu. Si une commande se comporte différemment que montré ici, mettez à jour l’extension concernée avant de dépanner le projet lui-même.

### Déploiement Agent-Premier avec `azd ai`

Utilisez `azd ai agent init` de façon interactive, ou adoptez un modèle actuel de projet agent `azure.yaml` connecté au Foundry Agent Service :

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` remplace les orthographes dépréciées `--manifest`/`-m` ; la migration des manifestes hérités et des configurations d’agents imbriquées est toujours nécessaire. Évaluez les agents avec `azd ai eval` de `azure.ai.evaluations`, pas via le flux legacy supprimé. Voir [migration d’évaluation](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) pour configuration, exécution et résultats.

Voir [Commandes AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pour la référence complète des commandes et options.

### Déploiement en Une Seule Commande

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Déploiements Spécifiques à l’Environnement

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Surveillance et Observabilité

### Intégration Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

Cela provisionne une ressource Insights, pas une instrumentation télémétrique. Une fois votre app émettant des spans d’appels de modèle sortants, exécutez cette requête illustrative dans Application Insights Logs (adaptez le filtre aux noms effectifs de vos spans) :

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Surveillance des Coûts

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

Utilisez un vrai destinataire et vérifiez les permissions sur la portée de facturation. Un budget envoie des alertes ; ce n’est pas un plafond de dépenses.

## 🔐 Meilleures Pratiques de Sécurité

### Configuration d’Identité Managée

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Sécurité Réseau

Ce fragment de point de terminaison nécessite aussi une zone DNS privée/groupe, liens VNet, connectivité VNet de l’application, et une politique explicite d’accès public. La création d'un point de terminaison privé seul ne désactive pas l’accès public.

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## Optimisation des Performances

### Stratégies de Mise en Cache

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache pour Redis Basic/Standard/Premium est sur une [voie de retrait](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq) ; utilisez Azure Managed Redis pour les nouveaux déploiements et suivez ses directives actuelles de modèle/authentification. Scopez les réponses AI mises en cache par autorisation, modèle/instructions, et version des données, avec expiration ; ne partagez jamais de réponses privées uniquement avec le texte de la requête.

### Configuration de Mise à l’Échelle Automatique

**Ressource partielle :** fusionnez ces paramètres d’échelle/ingress dans une Container App complète avec environnement managé, image container, et limites de ressources. Plus de réplicas n’augmentent pas le quota de modèle.

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Résolution des Problèmes Courants

### Problème 1 : Quota OpenAI Dépassé

**Symptômes :**
- Échec du déploiement avec erreurs de quota
- Erreurs 429 dans les logs de l’application

**Solutions :**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

La variable de capacité ci-dessus s’applique uniquement à un modèle personnalisé connecté pour la consommer. Pour l’exemple RAG, utilisez `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ne changez pas `AZURE_LOCATION` pour déplacer les ressources existantes en place ; créez un environnement séparé pour une nouvelle région et planifiez migration/nettoyage.

### Problème 2 : Échecs d’Authentification

**Symptômes :**
- Erreurs 401/403 lors des appels aux services AI
- Messages « Accès refusé »

**Solutions :**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problème 3 : Problèmes de Déploiement de Modèle

**Symptômes :**
- Modèles non disponibles au déploiement
- Versions spécifiques de modèle en échec

**Solutions :**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Modèles d’Exemple

Ce sont des alternatives, pas des commandes séquentielles. Commencez chacune dans un répertoire vide séparé. La destination explicite `.` garde l’initialisation dans votre répertoire actuel ; sinon, AZD courant peut créer un sous-répertoire nommé d’après le modèle sans changer le répertoire de travail de votre shell.

### Application de Chat RAG (Python)

**Référentiel** : [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services** : Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description** : Une application de chat référence RAG pour questions sur vos documents, avec récupération Azure AI Search. Examinez les modèles supportés, fonctionnalités optionnelles, conseils sur les coûts, et renforcement de production du sample courant avant usage ; le déploiement d’un sample ne rend pas une application prête pour la production.

**Démarrage rapide** :
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Application de Chat RAG (.NET)

**Référentiel** : [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services** : Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description** : L’équivalent .NET/C# de l’exemple chat RAG Python. Construit avec ASP.NET Core Minimal API et frontend Blazor WebAssembly. Inclut chat vocal, support GPT-4o-mini vision, et client compagnon .NET MAUI Blazor Hybrid desktop/mobile.

**Démarrage rapide** :
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Application de Chat RAG (Java)

**Référentiel** : [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services** : Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description** : Version Java de l’exemple chat RAG utilisant Langchain4J pour l’orchestration AI. Supporte architecture microservices basée sur événements, stratégies multiples de recherche (texte, vecteur, hybride), upload de documents avec Azure Document Intelligence, et déploiement sur Azure Container Apps ou Azure Kubernetes Service.

**Démarrage rapide** :
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copilote Retail Entreprise avec Microsoft Foundry

**Référentiel** : [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services** : Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description** : Copilote retail RAG de bout en bout utilisant Microsoft Foundry et Prompty. Un chatbot du détaillant Contoso Outdoor qui fonde ses réponses sur le catalogue produit et les données de commande client. Démontre le flux complet GenAIOps — prototypage avec Prompty, évaluation avec évaluateurs assistés par AI, et déploiement via AZD sur Container Apps.

**Démarrage rapide** :
```bash
azd init --template contoso-chat .
azd up
```

### Application Multi-Agent d’Écriture Créative

**Référentiel** : [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services** : Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description** : Exemple multi-agent démontrant l’orchestration d’agents AI avec Prompty. Utilise un agent de recherche (Bing Grounding dans Azure AI Agent Service), un agent produit (Azure AI Search), un agent rédacteur, et un agent éditeur pour produire collaborativement des articles bien documentés. Inclut CI/CD avec évaluation dans GitHub Actions.

**Démarrage rapide** :
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat RAG Sans Serveur (JavaScript/TypeScript)

**Référentiel** : [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services** : Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB pour NoSQL + LangChain.js

**Description** : Chatbot RAG totalement sans serveur utilisant LangChain.js avec Azure Functions pour l’API et Azure Static Web Apps pour l’hébergement. Utilise Azure Cosmos DB comme magasin vectoriel et base de données d’historique de chat. Supporte le développement local avec Ollama pour des tests zéro-coût.

**Démarrage rapide** :
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Accélérateur de Solution Chat avec Vos Données

**Référentiel** : [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services** : Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search avec Cosmos DB, ou PostgreSQL avec pgvector

**Description** : Accélérateur de chat fondé sur documents avec citations. Le sample actuel héberge un frontend React, backend FastAPI, et worker d’ingestion Functions sur Container Apps ; les options d’orchestrateur sont Agent Framework et LangGraph. Les options base de données/récupération sont sélectionnées au déploiement. C’est un point de départ, pas un système production clé en main ; ne supposez pas que les anciennes variantes App Service, Semantic Kernel, ou Prompt Flow décrivent le défaut actuel.

**Démarrage rapide** :
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agents de Voyage AI — Orchestration MCP Multi-Agent

**Référentiel** : [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services** : Azure OpenAI + Microsoft Foundry + Azure Container Apps + Serveurs MCP (.NET, Python, Java, TypeScript)

**Description** : Application de référence pour l'orchestration multi-agent IA utilisant trois frameworks (LangChain.js, LlamaIndex.TS et Microsoft Agent Framework). Comprend des serveurs MCP (Model Context Protocol) en quatre langages déployés comme Azure Container Apps sans serveur avec une supervision OpenTelemetry.

**Démarrage rapide** :
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Parcourez plus de modèles** : Visitez la [Galerie de modèles IA AZD](https://azure.github.io/awesome-azd/?tags=ai) pour découvrir les modèles actuellement disponibles selon les langages et scénarios. Chaque exemple lié est un dépôt externe, pas un exemple local fourni par ce cours ; vérifiez ses prérequis actuels et conseils de mise en production avant déploiement.

## Prochaines étapes

1. **Essayez les exemples** : Commencez par un modèle pré-construit correspondant à votre cas d’usage
2. **Personnalisez selon vos besoins** : Modifiez l’infrastructure et le code applicatif
3. **Ajoutez la supervision** : Mettez en place une observabilité complète
4. **Optimisez les coûts** : Ajustez les configurations selon votre budget
5. **Sécurisez votre déploiement** : Implémentez des schémas de sécurité entreprise
6. **Passez à la production** : Ajoutez fonctionnalités multi-région et haute disponibilité

## 🎯 Exercices pratiques

### Exercice 1 : Déployer l’application de chat Microsoft Foundry Models (30 minutes)
**Objectif** : Déployer et tester une application de référence conversationnelle IA

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**Critères de succès :**
- [ ] Déploiement sans erreurs de quota
- [ ] Accès à l’interface de chat via navigateur
- [ ] Possibilité de poser des questions et recevoir des réponses IA
- [ ] Application Insights affiche les données de télémétrie
- [ ] Nettoyage réussi des ressources

**Coût :** Consultez le guide tarifaire et les SKUs sélectionnés avant déploiement. La facturation continue tant que les ressources existent ; il n’y a pas d’estimation fixe de 30 minutes applicable à toutes les configurations.

### Exercice 2 : Configurer un déploiement multi-modèles (45 minutes)
**Objectif** : Déployer plusieurs modèles IA avec différentes configurations

**Point de départ :** Un compte Azure OpenAI existant et un module AZD à portée de groupe de ressources capable d’appeler ce fichier. Créez `infra/ai-models.bicep` avec ce contenu via votre éditeur. Il ne sera pas automatiquement déployé parce qu’il est sous `infra/`.

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Depuis le module à portée de groupe de ressources possédant le compte, ajoutez une invocation de module (adaptez le nom du symbole à votre compte) :

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Ne déclarez pas les mêmes déploiements dans les deux modules. Si le point d'entrée AZD est à l’échelle de l’abonnement, invoquez ceci depuis son module enfant à portée groupe de ressources et adaptez le chemin relatif. Compilez ce module contenant avec `az bicep build --file <path-to-containing-module>`, puis :

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Critères de succès :**
- [ ] Plusieurs modèles déployés avec succès
- [ ] Différentes capacités appliquées
- [ ] Modèles accessibles via API
- [ ] Appel des deux modèles possible depuis l’application

### Exercice 3 : Mettre en place la surveillance des coûts (20 minutes)
**Objectif** : Configurer alertes budget et suivi des coûts

**Point de départ :** Le modèle budget ci-dessus et un module d’infrastructure à portée groupe de ressources. Ajoutez cette ressource via votre éditeur ; passez `budgetStartDate` depuis votre mappage de paramètres (ne dupliquez pas ce paramètre s’il est déjà déclaré). Remplacez le destinataire et vérifiez que vous avez l’autorisation d’écriture pour les budgets.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Attendu : la réponse contient `amount: 200`, les deux seuils, et votre destinataire. Inspectez la gestion des coûts dans le portail pour les frais réels ; les données de coûts sont retardées et une alerte peut ne pas se déclencher durant un court exercice.

**Critères de succès :**
- [ ] Alerte budget créée dans Azure
- [ ] Notifications e-mail configurées
- [ ] Consultation des données de coûts dans le portail Azure possible
- [ ] Seuils de budget configurés de manière appropriée

## 💡 Questions fréquemment posées

<details>
<summary><strong>Comment réduire les coûts Microsoft Foundry Models pendant le développement ?</strong></summary>

1. **Vérifiez les prix** : Il n’y a pas d’allocation universelle gratuite de 50 000 tokens par mois pour les modèles Azure OpenAI
2. **Ajustez la capacité** : La capacité `10` représente généralement 10 000 TPM pour ces modèles Standard de texte, pas 10 TPM. Réduire cette limite de débit ne diminue pas le prix par token
3. **Utilisez azd down** : Supprimez les ressources jetables quand vous ne développez pas activement (ce n’est pas une désallocation)
4. **Mettez en cache les réponses** : Implémentez un cache Redis pour les requêtes répétées
5. **Utilisez la conception de prompt** : Réduisez l’usage des tokens avec des prompts efficaces

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Quelle est la différence entre Microsoft Foundry Models et l’API OpenAI ?</strong></summary>

**Microsoft Foundry Models** :
- Sécurité et conformité entreprise
- Intégration réseau privée
- Garanties SLA
- Authentification managed identity
- Quotas supérieurs disponibles

**OpenAI API** : Fournisseur/API distinct avec sa propre disponibilité de modèles, tarification, authentification et options de connectivité entreprise. Comparez les offres actuelles plutôt que de supposer que c’est uniquement public-internet ou toujours le premier à livrer les modèles.

Choisissez selon les besoins de votre organisation ; les exemples managés par identité Azure et private-link de ce cours s’appliquent aux services hébergés Azure, pas à tous les modèles/fournisseurs du catalogue Foundry.
</details>

<details>
<summary><strong>Comment gérer les erreurs de dépassement de quota Microsoft Foundry Models ?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Puis-je utiliser mes propres données avec Microsoft Foundry Models ?</strong></summary>

Oui ! Utilisez **Azure AI Search** pour RAG (Retrieval Augmented Generation) :

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Voir le modèle [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Comment sécuriser les points de terminaison des modèles IA ?</strong></summary>

**Bonnes pratiques** :
1. Utilisez Managed Identity (pas de clés API)
2. Activez les Private Endpoints
3. Configurez les groupes de sécurité réseau
4. Mettez en place un contrôle de débit
5. Utilisez Azure Key Vault pour les secrets

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Communauté et support

- **Discord Microsoft Foundry** : [canal #Azure](https://discord.gg/microsoft-azure)
- **GitHub AZD** : [Issues et discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn** : [Documentation officielle](https://learn.microsoft.com/azure/ai-studio/)
- **Compétences Agent** : [Compétence Microsoft Foundry sur skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installez les compétences agents Azure + Foundry dans votre éditeur avec `npx skills add microsoft/github-copilot-for-azure`

---

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement IA-First
- **⬅️ Chapitre précédent** : [Chapitre 1 : Votre premier projet](../chapter-01-foundation/first-project.md)
- **➡️ Suivant** : [Agents IA](agents.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

**Besoin d’aide ?** Rejoignez les discussions communautaires ou ouvrez un ticket dans le dépôt. La communauté Azure AI + AZD est là pour vous aider à réussir !

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->