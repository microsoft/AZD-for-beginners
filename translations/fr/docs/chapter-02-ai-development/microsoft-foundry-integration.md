# Intégration Microsoft Foundry avec AZD

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement orienté IA
- **⬅️ Chapitre précédent** : [Chapitre 1 : Votre premier projet](../chapter-01-foundation/first-project.md)
- **➡️ Suivant** : [Déploiement de modèle IA](ai-model-deployment.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

## Vue d'ensemble

Ce guide montre comment intégrer les services Microsoft Foundry avec Azure Developer CLI (AZD) pour des déploiements d'applications IA simplifiés. Microsoft Foundry fournit une plateforme complète pour construire, déployer et gérer des applications IA, tandis qu'AZD simplifie l’infrastructure et le processus de déploiement.

## Qu’est-ce que Microsoft Foundry ?

Microsoft Foundry est la plateforme unifiée de Microsoft pour le développement IA qui inclut :

- **Catalogue de modèles** : Accès aux modèles IA de pointe
- **Prompt Flow** : Concepteur visuel de workflows IA
- **Portail Microsoft Foundry** : Environnement de développement intégré pour applications IA
- **Options de déploiement** : Multiples options d’hébergement et de mise à l’échelle
- **Sécurité et sûreté** : Fonctionnalités d’IA responsable intégrées

## AZD + Microsoft Foundry : Mieux ensemble

| Fonctionnalité | Microsoft Foundry | Avantage Intégration AZD |
|---------|-----------------|------------------------|
| **Déploiement de modèles** | Déploiement manuel via portail | Déploiements automatisés et reproductibles |
| **Infrastructure** | Provisionnement par clic | Infrastructure as Code (Bicep) |
| **Gestion des environnements** | Focus sur un seul environnement | Multi-environnements (dev/staging/prod) |
| **Intégration CI/CD** | Limitée | Support natif GitHub Actions |
| **Gestion des coûts** | Surveillance basique | Optimisation des coûts spécifique à l’environnement |

## Prérequis

- Abonnement Azure avec les permissions appropriées
- Azure Developer CLI installé
- Accès aux services Microsoft Foundry Models
- Connaissances de base sur Microsoft Foundry

> **Base AZD actuelle :** Ces exemples ont été testés avec `azd` `1.23.12`. Pour le workflow agent IA, utilisez la version actuelle de l’extension preview et vérifiez votre version installée avant de commencer.

## Modèles d’intégration principaux

### Modèle 1 : Intégration des modèles Microsoft Foundry

**Cas d’usage** : Déployer des applications de chat avec les modèles Microsoft Foundry Models

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
    disableLocalAuth: false
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
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Modèle 2 : Recherche IA + Intégration RAG

**Cas d’usage** : Déployer des applications de génération augmentée par récupération (RAG)

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

### Modèle 3 : Intégration Document Intelligence

**Cas d’usage** : Workflows de traitement et d’analyse documentaire

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

### Configuration des variables d’environnement

**Configuration production :**
```bash
# Services d'IA de base
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurations du modèle
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Paramètres de performance
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuration développement :**
```bash
# Paramètres optimisés pour le coût en développement
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Offre gratuite
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

## Workflows de déploiement

### Extensions AZD pour Foundry

AZD fournit des extensions qui ajoutent des capacités spécifiques à l’IA pour travailler avec les services Microsoft Foundry :

```bash
# Installer l'extension des agents Foundry
azd extension install azure.ai.agents

# Installer l'extension de réglage fin
azd extension install azure.ai.finetune

# Installer l'extension des modèles personnalisés
azd extension install azure.ai.models

# Lister les extensions installées
azd extension list --installed

# Vérifier la version de l'extension agent actuellement installée
azd extension show azure.ai.agents
```

Les extensions IA évoluent rapidement en preview. Si une commande se comporte différemment de ce qui est montré ici, mettez à jour l’extension concernée avant de dépanner le projet lui-même.

### Déploiement orienté agent avec `azd ai`

Si vous avez un manifeste d’agent, utilisez `azd ai agent init` pour créer un projet connecté à Foundry Agent Service :

```bash
# Initialiser à partir d'un manifeste d'agent
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Déployer sur Azure
azd up
```

Les récentes versions preview de `azure.ai.agents` ont aussi ajouté le support d’initialisation par template pour `azd ai agent init`. Si vous suivez des exemples d’agents plus récents, consultez l’aide de l’extension pour connaître les flags exacts disponibles dans votre version installée.

Voir [Commandes AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pour la référence complète des commandes et flags.

### Déploiement en une seule commande

```bash
# Déployez tout avec une seule commande
azd up

# Ou déployez de manière incrémentale
azd provision  # Infrastructure uniquement
azd deploy     # Application uniquement

# Pour les déploiements d'applications IA de longue durée dans azd 1.23.11+
azd deploy --timeout 1800
```

### Déploiements spécifiques par environnement

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

### Configuration de l’identité managée

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

### Configuration de l’auto-scalabilité

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

## Résolution des problèmes courants

### Problème 1 : Quota OpenAI dépassé

**Symptômes :**
- Échec du déploiement avec erreurs de quota
- Erreurs 429 dans les logs de l’application

**Solutions :**
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

### Problème 2 : Échecs d’authentification

**Symptômes :**
- Erreurs 401/403 lors des appels aux services IA
- Messages « Accès refusé »

**Solutions :**
```bash
# Vérifier les affectations de rôle
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Vérifier la configuration de l'identité gérée
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Valider l'accès au coffre de clés
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problème 3 : Problèmes de déploiement de modèles

**Symptômes :**
- Modèles non disponibles lors du déploiement
- Versions spécifiques de modèle qui échouent

**Solutions :**
```bash
# Lister les modèles disponibles par région
az cognitiveservices model list --location eastus

# Mettre à jour la version du modèle dans le modèle bicep
# Vérifier les exigences de capacité du modèle
```

## Exemples de templates

### Application RAG Chat (Python)

**Dépôt** : [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services** : Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description** : L’exemple Azure AI le plus populaire — application chat RAG prête pour la production qui permet de poser des questions sur vos propres documents. Utilise GPT-4.1-mini pour le chat, text-embedding-3-large pour les embeddings, et Azure AI Search pour la recherche. Supporte les documents multimodaux, input/output vocal, authentification Microsoft Entra et traçage Application Insights.

**Démarrage rapide** :
```bash
azd init --template azure-search-openai-demo
azd up
```

### Application RAG Chat (.NET)

**Dépôt** : [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services** : Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description** : Equivalent .NET/C# de l’exemple chat RAG Python. Construite avec ASP.NET Core Minimal API et frontend Blazor WebAssembly. Inclut chat vocal, support GPT-4o-mini vision et client desktop/mobile hybride .NET MAUI Blazor compagnon.

**Démarrage rapide** :
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Application RAG Chat (Java)

**Dépôt** : [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services** : Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description** : Version Java de l’exemple chat RAG utilisant Langchain4J pour l’orchestration IA. Supporte une architecture microservices orientée événements, plusieurs stratégies de recherche (texte, vecteur, hybride), téléchargement de documents avec Azure Document Intelligence, et déploiement sur Azure Container Apps ou Azure Kubernetes Service.

**Démarrage rapide** :
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilote Retail Entreprise avec Azure AI Foundry

**Dépôt** : [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services** : Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description** : Copilote retail RAG complet utilisant Azure AI Foundry et Prompty. Chatbot détaillant Contoso Outdoor qui appuie ses réponses sur le catalogue produit et les données commandes clients. Démonstration du workflow complet GenAIOps — prototype avec Prompty, évaluation assistée IA, et déploiement via AZD vers Container Apps.

**Démarrage rapide** :
```bash
azd init --template contoso-chat
azd up
```

### Application multi-agent Creative Writing

**Dépôt** : [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services** : Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description** : Exemple multi-agent démontrant l’orchestration par agents IA avec Prompty. Utilise un agent de recherche (Bing Grounding dans Azure AI Agent Service), un agent produit (Azure AI Search), un agent rédacteur, et un agent éditeur pour produire collaborativement des articles bien documentés. Inclut CI/CD avec évaluation dans GitHub Actions.

**Démarrage rapide** :
```bash
azd init --template contoso-creative-writer
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Dépôt** : [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services** : Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB pour NoSQL + LangChain.js

**Description** : Chatbot RAG entièrement serverless utilisant LangChain.js avec Azure Functions pour l’API et Azure Static Web Apps pour l’hébergement. Utilise Azure Cosmos DB à la fois comme magasin vectoriel et base de données historique du chat. Supporte le développement local avec Ollama pour tests gratuits.

**Démarrage rapide** :
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Accélérateur de solution Chat avec vos données

**Dépôt** : [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services** : Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description** : Accélérateur de solution RAG de niveau entreprise avec portail admin pour gestion/téléchargement documentaire, multiples options d’orchestrateurs (Semantic Kernel, LangChain, Prompt Flow), reconnaissance vocale, intégration Microsoft Teams, et choix backend PostgreSQL ou Cosmos DB. Conçu comme point de départ personnalisable pour scénarios RAG en production.

**Démarrage rapide** :
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agents de voyage IA — Orchestration multi-agent MCP

**Dépôt** : [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services** : Azure OpenAI + Azure AI Foundry + Azure Container Apps + serveurs MCP (.NET, Python, Java, TypeScript)

**Description** : Application de référence pour orchestration IA multi-agent utilisant trois frameworks (LangChain.js, LlamaIndex.TS, et Microsoft Agent Framework). Comprend des serveurs MCP (Model Context Protocol) en quatre langages déployés en serverless Azure Container Apps avec monitoring OpenTelemetry.

**Démarrage rapide** :
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Dépôt** : [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services** : Services Azure AI + Azure OpenAI

**Description** : Template Bicep minimal qui déploie les services Azure AI avec modèles machine learning configurés. Point de départ léger quand vous avez uniquement besoin de l’infrastructure Azure AI sans un stack applicatif complet.

**Démarrage rapide** :
```bash
azd init --template azd-ai-starter
azd up
```

> **Consultez plus de templates** : Visitez la [Galerie Awesome AZD AI Templates](https://azure.github.io/awesome-azd/?tags=ai) pour plus de 80 templates AZD spécifiques à l’IA dans divers langages et scénarios.

## Prochaines étapes

1. **Essayez les exemples** : Commencez avec un template préconstruit adapté à votre cas d’usage
2. **Personnalisez selon vos besoins** : Modifiez l’infrastructure et le code applicatif
3. **Ajoutez la surveillance** : Mettez en œuvre une observabilité complète
4. **Optimisez les coûts** : Ajustez la configuration selon votre budget
5. **Sécurisez votre déploiement** : Implémentez des modèles de sécurité entreprise
6. **Passez en production** : Ajoutez fonctionnalités multi-régions et haute disponibilité

## 🎯 Exercices pratiques

### Exercice 1 : Déployer une application chat Microsoft Foundry Models (30 minutes)
**Objectif** : Déployer et tester une application chat IA prête pour la production

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

**Critères de réussite :**
- [ ] Déploiement terminé sans erreur de quota
- [ ] Accès possible à l’interface chat dans le navigateur
- [ ] Questions posées et réponses IA reçues
- [ ] Application Insights affiche des données télémétriques
- [ ] Ressources nettoyées avec succès

**Coût estimé** : 5-10 $ pour 30 minutes de test

### Exercice 2 : Configurer un déploiement multi-modèles (45 minutes)
**Objectif** : Déployer plusieurs modèles IA avec des configurations différentes

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
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
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

**Critères de réussite :**
- [ ] Plusieurs modèles déployés avec succès
- [ ] Paramètres de capacité différents appliqués
- [ ] Modèles accessibles via API
- [ ] Appel possible des deux modèles depuis l’application

### Exercice 3 : Mettre en place la surveillance des coûts (20 minutes)
**Objectif** : Configurer alertes budget et suivi des coûts

```bash
# Ajouter une alerte budget à Bicep
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

# Déployer l'alerte budget
azd provision

# Vérifier les coûts actuels
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Critères de réussite :**
- [ ] Alerte budget créée dans Azure
- [ ] Notifications par email configurées
- [ ] Visualisation des coûts dans Azure Portal possible
- [ ] Seuils de budget correctement définis

## 💡 Questions fréquentes

<details>
<summary><strong>Comment réduire les coûts Microsoft Foundry Models pendant le développement ?</strong></summary>

1. **Utiliser le niveau gratuit** : Microsoft Foundry Models offre 50 000 tokens/mois gratuits
2. **Réduire la capacité** : Mettre la capacité à 10 TPM au lieu de 30+ pour le dev
3. **Utiliser azd down** : Désallouer les ressources quand vous ne développez pas activement
4. **Cacher les réponses** : Mettre en œuvre un cache Redis pour les requêtes récurrentes
5. **Utiliser le prompt engineering** : Réduire la consommation de tokens avec des prompts efficaces
```bash
# Configuration de développement
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Quelle est la différence entre Microsoft Foundry Models et l’API OpenAI ?</strong></summary>

**Microsoft Foundry Models** :
- Sécurité et conformité pour les entreprises
- Intégration au réseau privé
- Garanties de SLA
- Authentification par identité gérée
- Quotas plus élevés disponibles

**API OpenAI** :
- Accès plus rapide aux nouveaux modèles
- Configuration plus simple
- Barrière d’entrée plus basse
- Internet public uniquement

Pour les applications en production, **Microsoft Foundry Models est recommandé**.
</details>

<details>
<summary><strong>Comment gérer les erreurs de dépassement de quota Microsoft Foundry Models ?</strong></summary>

```bash
# Vérifier le quota actuel
az cognitiveservices usage list --location eastus2

# Essayer une région différente
azd env set AZURE_LOCATION westus2
azd up

# Réduire temporairement la capacité
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Demander une augmentation du quota
# Aller sur le portail Azure > Quotas > Demander une augmentation
```
</details>

<details>
<summary><strong>Puis-je utiliser mes propres données avec Microsoft Foundry Models ?</strong></summary>

Oui ! Utilisez **Azure AI Search** pour la RAG (Retrieval Augmented Generation) :

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

**Bonnes pratiques** :
1. Utilisez l’identité gérée (pas de clés API)
2. Activez les points de terminaison privés
3. Configurez les groupes de sécurité réseau
4. Mettez en œuvre la limitation du débit
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

## Communauté et Support

- **Microsoft Foundry Discord** : [Canal #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub** : [Problèmes et discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn** : [Documentation officielle](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills** : [Compétence Microsoft Foundry sur skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installez les compétences d’agent Azure + Foundry dans votre éditeur avec `npx skills add microsoft/github-copilot-for-azure`

---

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre en cours** : Chapitre 2 - Développement AI First
- **⬅️ Chapitre précédent** : [Chapitre 1 : Votre premier projet](../chapter-01-foundation/first-project.md)
- **➡️ Suivant** : [Déploiement du modèle IA](ai-model-deployment.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

**Besoin d’aide ?** Rejoignez nos discussions communautaires ou ouvrez un ticket dans le dépôt. La communauté Azure AI + AZD est là pour vous aider à réussir !

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour des informations critiques, une traduction professionnelle humaine est recommandée. Nous ne sommes pas responsables des malentendus ou des erreurs d'interprétation résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->