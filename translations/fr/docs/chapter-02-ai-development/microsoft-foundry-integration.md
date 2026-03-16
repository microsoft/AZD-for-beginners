# Intégration de Microsoft Foundry avec AZD

**Navigation du chapitre :**
- **📚 Accueil du cours**: [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel**: Chapitre 2 - Développement axé sur l'IA
- **⬅️ Chapitre précédent**: [Chapitre 1 : Votre premier projet](../chapter-01-foundation/first-project.md)
- **➡️ Suivant**: [Déploiement de modèles IA](ai-model-deployment.md)
- **🚀 Chapitre suivant**: [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

## Aperçu

Ce guide montre comment intégrer les services Microsoft Foundry avec Azure Developer CLI (AZD) pour simplifier les déploiements d'applications IA. Microsoft Foundry fournit une plateforme complète pour créer, déployer et gérer des applications IA, tandis qu'AZD simplifie l'infrastructure et le processus de déploiement.

## Qu'est-ce que Microsoft Foundry ?

Microsoft Foundry est la plateforme unifiée de Microsoft pour le développement IA qui inclut :

- **Catalogue de modèles** : Accès à des modèles IA à la pointe
- **Prompt Flow** : Concepteur visuel pour les flux de travail IA
- **Portail Microsoft Foundry** : Environnement de développement intégré pour les applications IA
- **Options de déploiement** : Plusieurs options d'hébergement et de mise à l'échelle
- **Sécurité et sûreté** : Fonctions intégrées de responsabilité en IA

## AZD + Microsoft Foundry : Mieux ensemble

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Prérequis

- Abonnement Azure avec les autorisations appropriées
- Azure Developer CLI installé
- Accès aux services Microsoft Foundry Models
- Connaissances de base de Microsoft Foundry

## Principaux modèles d'intégration

### Modèle 1 : Intégration Microsoft Foundry Models

**Cas d'utilisation** : Déployer des applications de chat avec les modèles Microsoft Foundry Models

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
```

**Infrastructure (main.bicep):**
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
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Modèle 2 : Recherche IA + intégration RAG

**Cas d'utilisation** : Déployer des applications de génération augmentée par récupération (RAG)

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

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### Modèle 3 : Intégration Document Intelligence

**Cas d'utilisation** : Flux de travail de traitement et d'analyse de documents

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

## 🔧 Modèles de configuration

### Configuration des variables d'environnement

**Configuration de production :**
```bash
# Services d'IA essentiels
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurations du modèle
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Paramètres de performance
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuration de développement :**
```bash
# Paramètres optimisés en termes de coût pour le développement
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Niveau gratuit
```

### Configuration sécurisée avec Key Vault

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
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

## Flux de déploiement

### Extensions AZD pour Foundry

AZD fournit des extensions qui ajoutent des capacités spécifiques à l'IA pour travailler avec les services Microsoft Foundry :

```bash
# Installer l'extension Foundry agents
azd extension install azure.ai.agents

# Installer l'extension de réglage fin
azd extension install azure.ai.finetune

# Installer l'extension des modèles personnalisés
azd extension install azure.ai.models

# Lister les extensions installées
azd extension list
```

### Déploiement orienté agent avec `azd ai`

Si vous avez un manifeste d'agent, utilisez `azd ai agent init` pour générer un projet connecté au service Foundry Agent :

```bash
# Initialiser à partir d'un manifeste d'agent
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Déployer sur Azure
azd up
```

Voir [Commandes CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pour la référence complète des commandes et des options.

### Déploiement en une seule commande

```bash
# Déployer tout en une seule commande
azd up

# Ou déployer de manière incrémentale
azd provision  # Infrastructure uniquement
azd deploy     # Application uniquement
```

### Déploiements spécifiques à l'environnement

```bash
# Environnement de développement
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Environnement de production
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Surveillance et observabilité

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
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### Surveillance des coûts

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
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

## 🔐 Bonnes pratiques de sécurité

### Configuration d'identité gérée

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

### Sécurité réseau

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

## Optimisation des performances

### Stratégies de mise en cache

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
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

### Configuration de la mise à l'échelle automatique

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

## Dépannage des problèmes courants

### Problème 1 : Quota OpenAI dépassé

**Symptômes :**
- Le déploiement échoue avec des erreurs de quota
- Erreurs 429 dans les journaux de l'application

**Solutions :**
```bash
# Vérifier l'utilisation actuelle du quota
az cognitiveservices usage list --location eastus

# Essayer une autre région
azd env set AZURE_LOCATION westus2
azd up

# Réduire temporairement la capacité
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problème 2 : Échecs d'authentification

**Symptômes :**
- Erreurs 401/403 lors des appels aux services d'IA
- Messages "Access denied"

**Solutions :**
```bash
# Vérifier les attributions de rôles
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Vérifier la configuration de l'identité gérée
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Valider l'accès au Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problème 3 : Problèmes de déploiement de modèles

**Symptômes :**
- Modèles non disponibles dans le déploiement
- Versions spécifiques de modèles qui échouent

**Solutions :**
```bash
# Lister les modèles disponibles par région
az cognitiveservices model list --location eastus

# Mettre à jour la version du modèle dans le template Bicep
# Vérifier les exigences de capacité du modèle
```

## Modèles d'exemple

### Application de chat RAG (Python)

**Dépôt**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: L'exemple Azure AI le plus populaire — une application de chat RAG prête pour la production qui vous permet de poser des questions sur vos propres documents. Utilise GPT-4.1-mini pour le chat, text-embedding-ada-002 pour les embeddings, et Azure AI Search pour la recherche. Prend en charge les documents multimodaux, l'entrée/sortie vocale, l'authentification Microsoft Entra, et le traçage Application Insights.

**Démarrage rapide**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Application de chat RAG (.NET)

**Dépôt**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: L'équivalent .NET/C# de l'exemple de chat RAG en Python. Construit avec ASP.NET Core Minimal API et frontend Blazor WebAssembly. Inclut chat vocal, prise en charge de GPT-4o-mini vision, et un client compagnon .NET MAUI Blazor Hybrid pour bureau/mobile.

**Démarrage rapide**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Application de chat RAG (Java)

**Dépôt**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Version Java de l'exemple de chat RAG utilisant Langchain4J pour l'orchestration IA. Prend en charge une architecture microservices pilotée par événements, plusieurs stratégies de recherche (texte, vecteur, hybride), téléversement de documents avec Azure Document Intelligence, et déploiement sur Azure Container Apps ou Azure Kubernetes Service.

**Démarrage rapide**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilot pour la vente au détail en entreprise avec Azure AI Foundry

**Dépôt**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: Copilot RAG de bout en bout pour le commerce de détail utilisant Azure AI Foundry et Prompty. Un chatbot pour un détaillant Contoso Outdoor qui ancre ses réponses dans le catalogue de produits et les données de commande client. Démontre le flux GenAIOps complet — prototypage avec Prompty, évaluation avec évaluateurs assistés par IA, et déploiement via AZD vers Container Apps.

**Démarrage rapide**:
```bash
azd init --template contoso-chat
azd up
```

### Application multi-agent d'écriture créative

**Dépôt**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Exemple multi-agent démontrant l'orchestration d'agents IA avec Prompty. Utilise un agent de recherche (Bing Grounding dans Azure AI Agent Service), un agent produit (Azure AI Search), un agent écrivain et un agent éditeur pour produire collaborativement des articles bien documentés. Inclut CI/CD avec évaluation dans GitHub Actions.

**Démarrage rapide**:
```bash
azd init --template contoso-creative-writer
azd up
```

### RAG Chat Serverless (JavaScript/TypeScript)

**Dépôt**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: Chatbot RAG entièrement serverless utilisant LangChain.js avec Azure Functions pour l'API et Azure Static Web Apps pour l'hébergement. Utilise Azure Cosmos DB comme magasin de vecteurs et base d'historique de chat. Prend en charge le développement local avec Ollama pour des tests sans frais.

**Démarrage rapide**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Dépôt**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: Accélérateur de solution RAG de niveau entreprise avec portail d'administration pour le téléversement/gestion de documents, plusieurs options d'orchestrateur (Semantic Kernel, LangChain, Prompt Flow), reconnaissance vocale, intégration Microsoft Teams, et choix de backend PostgreSQL ou Cosmos DB. Conçu comme point de départ personnalisable pour des scénarios RAG en production.

**Démarrage rapide**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agents de voyage IA — Orchestration multi-agent MCP

**Dépôt**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: Application de référence pour l'orchestration multi-agent IA utilisant trois frameworks (LangChain.js, LlamaIndex.TS et Microsoft Agent Framework). Comprend des serveurs MCP (Model Context Protocol) en quatre langages déployés en tant que Azure Container Apps serverless avec surveillance OpenTelemetry.

**Démarrage rapide**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Dépôt**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: Modèle Bicep minimal qui déploie les services Azure AI avec des modèles de machine learning configurés. Un point de départ léger lorsque vous n'avez besoin que de l'infrastructure Azure AI provisionnée sans une pile applicative complète.

**Démarrage rapide**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Parcourez plus de modèles**: Visitez la [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) pour plus de 80 modèles AZD spécifiques à l'IA couvrant des langages et scénarios variés.

## Étapes suivantes

1. **Essayez les exemples** : Commencez par un modèle préconstruit qui correspond à votre cas d'utilisation
2. **Personnalisez selon vos besoins** : Modifiez l'infrastructure et le code applicatif
3. **Ajoutez la surveillance** : Implémentez une observabilité complète
4. **Optimisez les coûts** : Ajustez les configurations en fonction de votre budget
5. **Sécurisez votre déploiement** : Mettez en œuvre des modèles de sécurité d'entreprise
6. **Passez à la production** : Ajoutez des fonctionnalités multi-régions et haute disponibilité

## 🎯 Exercices pratiques

### Exercice 1 : Déployer une application de chat Microsoft Foundry Models (30 minutes)
**Objectif** : Déployer et tester une application de chat IA prête pour la production

```bash
# Initialiser le modèle
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Définir les variables d'environnement
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Déployer
azd up

# Tester l'application
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Surveiller les opérations d'IA
azd monitor

# Nettoyer
azd down --force --purge
```

**Critères de réussite :**
- [ ] Le déploiement se termine sans erreurs de quota
- [ ] Accès à l'interface de chat via un navigateur
- [ ] Possibilité de poser des questions et d'obtenir des réponses alimentées par l'IA
- [ ] Application Insights affiche des données de télémétrie
- [ ] Nettoyage des ressources effectué avec succès

**Coût estimé** : $5-10 pour 30 minutes de test

### Exercice 2 : Configurer un déploiement multi-modèle (45 minutes)
**Objectif** : Déployer plusieurs modèles IA avec différentes configurations

```bash
# Créer une configuration Bicep personnalisée
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

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
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Déployer et vérifier
azd provision
azd show
```

**Critères de réussite :**
- [ ] Plusieurs modèles déployés avec succès
- [ ] Différents paramètres de capacité appliqués
- [ ] Modèles accessibles via l'API
- [ ] Possibilité d'appeler les deux modèles depuis l'application

### Exercice 3 : Mettre en place la surveillance des coûts (20 minutes)
**Objectif** : Configurer des alertes budgétaires et le suivi des coûts

```bash
# Ajouter une alerte de budget à Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
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
EOF

# Déployer l'alerte de budget
azd provision

# Vérifier les coûts actuels
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Critères de réussite :**
- [ ] Alerte budgétaire créée dans Azure
- [ ] Notifications par e-mail configurées
- [ ] Possibilité de consulter les données de coûts dans le Portail Azure
- [ ] Seuils budgétaires définis de manière appropriée

## 💡 Questions fréquemment posées

<details>
<summary><strong>Comment réduire les coûts des Microsoft Foundry Models pendant le développement ?</strong></summary>

1. **Utilisez le forfait gratuit** : Microsoft Foundry Models offre 50 000 tokens/mois gratuits
2. **Réduisez la capacité** : Définissez la capacité à 10 TPM au lieu de 30+ pour le développement
3. **Utilisez azd down** : Désallouez les ressources lorsque vous ne développez pas activement
4. **Mettez en cache les réponses** : Implémentez un cache Redis pour les requêtes répétées
5. **Utilisez l'ingénierie des prompts** : Réduisez l'utilisation de tokens avec des prompts efficaces

```bash
# Configuration de développement
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Quelle est la différence entre Microsoft Foundry Models et l'API OpenAI ?</strong></summary>

**Microsoft Foundry Models**:
- Sécurité d'entreprise et conformité
- Intégration réseau privée
- Garanties de SLA
- Authentification par identité gérée
- Quotas plus élevés disponibles

**OpenAI API**:
- Accès plus rapide aux nouveaux modèles
- Configuration plus simple
- Barrière d'entrée plus faible
- Internet public uniquement

Pour les applications en production, **Microsoft Foundry Models est recommandé**.
</details>

<details>
<summary><strong>Comment gérer les erreurs de dépassement de quota des modèles Microsoft Foundry ?</strong></summary>

```bash
# Vérifier le quota actuel
az cognitiveservices usage list --location eastus2

# Essayer une autre région
azd env set AZURE_LOCATION westus2
azd up

# Réduire temporairement la capacité
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Demander une augmentation du quota
# Aller sur le Portail Azure > Quotas > Demander une augmentation
```
</details>

<details>
<summary><strong>Puis-je utiliser mes propres données avec les modèles Microsoft Foundry ?</strong></summary>

Oui ! Utilisez **Azure AI Search** pour le RAG (génération augmentée par récupération) :

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Voir le modèle [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Comment sécuriser les points de terminaison des modèles IA ?</strong></summary>

**Meilleures pratiques**:
1. Utilisez Managed Identity (pas de clés API)
2. Activer les Private Endpoints
3. Configurer les groupes de sécurité réseau
4. Mettre en place une limitation de débit
5. Utiliser Azure Key Vault pour les secrets

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

- **Microsoft Foundry Discord**: [#Canal Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues et discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentation officielle](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installez les compétences d'agent Azure + Foundry dans votre éditeur avec `npx skills add microsoft/github-copilot-for-azure`

---

**Navigation du chapitre:**
- **📚 Accueil du cours**: [AZD For Beginners](../../README.md)
- **📖 Chapitre actuel**: Chapitre 2 - Développement axé sur l'IA
- **⬅️ Chapitre précédent**: [Chapitre 1 : Votre premier projet](../chapter-01-foundation/first-project.md)
- **➡️ Suivant**: [Déploiement du modèle IA](ai-model-deployment.md)
- **🚀 Chapitre suivant**: [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

**Besoin d'aide ?** Rejoignez nos discussions communautaires ou ouvrez une issue dans le dépôt. La communauté Azure AI + AZD est là pour vous aider à réussir !

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction par IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne saurions être tenus responsables des malentendus ou des interprétations erronées découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->