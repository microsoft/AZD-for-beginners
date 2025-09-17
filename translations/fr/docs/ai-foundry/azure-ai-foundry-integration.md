<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T13:21:50+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "fr"
}
-->
# Intégration d'Azure AI Foundry avec AZD

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD pour les débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement axé sur l'IA
- **⬅️ Chapitre précédent** : [Chapitre 1 : Votre premier projet](../getting-started/first-project.md)
- **➡️ Suivant** : [Déploiement de modèles IA](ai-model-deployment.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../getting-started/configuration.md)

## Vue d'ensemble

Ce guide explique comment intégrer les services Azure AI Foundry avec Azure Developer CLI (AZD) pour simplifier les déploiements d'applications IA. Azure AI Foundry offre une plateforme complète pour créer, déployer et gérer des applications IA, tandis qu'AZD simplifie les processus d'infrastructure et de déploiement.

## Qu'est-ce qu'Azure AI Foundry ?

Azure AI Foundry est la plateforme unifiée de Microsoft pour le développement IA, qui inclut :

- **Catalogue de modèles** : Accès à des modèles IA de pointe
- **Prompt Flow** : Concepteur visuel pour les workflows IA
- **Portail AI Foundry** : Environnement de développement intégré pour les applications IA
- **Options de déploiement** : Plusieurs options d'hébergement et de mise à l'échelle
- **Sécurité et fiabilité** : Fonctionnalités intégrées pour une IA responsable

## AZD + Azure AI Foundry : Une meilleure combinaison

| Fonctionnalité | Azure AI Foundry | Avantage de l'intégration avec AZD |
|----------------|------------------|------------------------------------|
| **Déploiement de modèles** | Déploiement manuel via le portail | Déploiements automatisés et reproductibles |
| **Infrastructure** | Provisionnement via clics | Infrastructure en tant que code (Bicep) |
| **Gestion des environnements** | Focus sur un seul environnement | Multi-environnements (dev/staging/prod) |
| **Intégration CI/CD** | Limitée | Support natif des GitHub Actions |
| **Gestion des coûts** | Surveillance basique | Optimisation des coûts spécifique à l'environnement |

## Prérequis

- Abonnement Azure avec les permissions appropriées
- Azure Developer CLI installé
- Accès aux services Azure OpenAI
- Connaissances de base sur Azure AI Foundry

## Modèles d'intégration principaux

### Modèle 1 : Intégration Azure OpenAI

**Cas d'utilisation** : Déployer des applications de chat avec des modèles Azure OpenAI

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
// Azure OpenAI Account
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

### Modèle 2 : Recherche IA + Intégration RAG

**Cas d'utilisation** : Déployer des applications de génération augmentée par récupération (RAG)

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

### Modèle 3 : Intégration Intelligence Documentaire

**Cas d'utilisation** : Workflows de traitement et d'analyse de documents

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

**Configuration de production :**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuration de développement :**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
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

### Déploiement en une seule commande

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Déploiements spécifiques à l'environnement

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

## Surveillance et observabilité

### Intégration avec Application Insights

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

## 🔐 Meilleures pratiques de sécurité

### Configuration d'identité managée

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

### Configuration de l'auto-scaling

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
- Échec du déploiement avec des erreurs de quota
- Erreurs 429 dans les journaux de l'application

**Solutions :**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problème 2 : Échecs d'authentification

**Symptômes :**
- Erreurs 401/403 lors des appels aux services IA
- Messages "Accès refusé"

**Solutions :**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problème 3 : Problèmes de déploiement de modèles

**Symptômes :**
- Modèles non disponibles dans le déploiement
- Échec de certaines versions de modèles spécifiques

**Solutions :**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Modèles d'exemple

### Application de chat basique

**Référentiel** : [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services** : Azure OpenAI + Recherche cognitive + Service d'application

**Démarrage rapide** :
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline de traitement de documents

**Référentiel** : [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Services** : Intelligence documentaire + Stockage + Fonctions

**Démarrage rapide** :
```bash
azd init --template ai-document-processing
azd up
```

### Chat d'entreprise avec RAG

**Référentiel** : [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services** : Azure OpenAI + Recherche + Applications conteneurisées + Cosmos DB

**Démarrage rapide** :
```bash
azd init --template contoso-chat
azd up
```

## Prochaines étapes

1. **Essayez les exemples** : Commencez avec un modèle préconstruit adapté à votre cas d'utilisation
2. **Personnalisez selon vos besoins** : Modifiez l'infrastructure et le code de l'application
3. **Ajoutez une surveillance** : Implémentez une observabilité complète
4. **Optimisez les coûts** : Ajustez les configurations selon votre budget
5. **Sécurisez votre déploiement** : Appliquez des modèles de sécurité d'entreprise
6. **Passez à la production** : Ajoutez des fonctionnalités multi-régions et haute disponibilité

## Communauté et support

- **Discord Azure AI Foundry** : [#Azure channel](https://discord.gg/microsoft-azure)
- **GitHub AZD** : [Problèmes et discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn** : [Documentation officielle](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD pour les débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement axé sur l'IA
- **⬅️ Chapitre précédent** : [Chapitre 1 : Votre premier projet](../getting-started/first-project.md)
- **➡️ Suivant** : [Déploiement de modèles IA](ai-model-deployment.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../getting-started/configuration.md)

**Besoin d'aide ?** Rejoignez nos discussions communautaires ou ouvrez un problème dans le référentiel. La communauté Azure AI + AZD est là pour vous aider à réussir !

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de faire appel à une traduction professionnelle humaine. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.