# Microsoft Foundry Integration wit AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../getting-started/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../getting-started/configuration.md)

## Overview

Dis guide go show you how you fit take connect Microsoft Foundry services wit Azure Developer CLI (AZD) to make AI app deployment easy. Microsoft Foundry na one better platform wey you fit use build, deploy, and manage AI apps, while AZD go help simplify di infrastructure and deployment process.

## Wetin be Microsoft Foundry?

Microsoft Foundry na Microsoft platform wey dem design for AI development, e get di following:

- **Model Catalog**: Access to di latest AI models
- **Prompt Flow**: Visual designer for AI workflows
- **AI Foundry Portal**: Integrated development environment for AI apps
- **Deployment Options**: Plenty hosting and scaling options
- **Safety and Security**: Responsible AI features wey dem don build inside

## AZD + Microsoft Foundry: Better Together

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Prerequisites

- Azure subscription wey get correct permissions
- Azure Developer CLI wey you don install
- Access to Azure OpenAI services
- Small knowledge about Microsoft Foundry

## Core Integration Patterns

### Pattern 1: Azure OpenAI Integration

**Use Case**: Deploy chat apps wit Azure OpenAI models

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

### Pattern 2: AI Search + RAG Integration

**Use Case**: Deploy retrieval-augmented generation (RAG) apps

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

### Pattern 3: Document Intelligence Integration

**Use Case**: Document processing and analysis workflows

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

## 🔧 Configuration Patterns

### Environment Variables Setup

**Production Configuration:**
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

**Development Configuration:**
```bash
# Settings wey go save money for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free level
```

### Secure Configuration wit Key Vault

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

## Deployment Workflows

### Single Command Deployment

```bash
# Deploy everytin wit one command
azd up

# Or deploy small small
azd provision  # Na infrastructure only
azd deploy     # Na application only
```

### Environment-Specific Deployments

```bash
# Place wey dem dey build di software
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Place wey di software go dey work for real
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitoring and Observability

### Application Insights Integration

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

### Cost Monitoring

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

## 🔐 Security Best Practices

### Managed Identity Configuration

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

### Network Security

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

## Performance Optimization

### Caching Strategies

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

### Auto-scaling Configuration

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

## Troubleshooting Common Issues

### Issue 1: OpenAI Quota Don Finish

**Symptoms:**
- Deployment no work because quota don finish
- 429 errors dey show for app logs

**Solutions:**
```bash
# Check how much quota you don use
az cognitiveservices usage list --location eastus

# Try another region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity for now
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Issue 2: Authentication Wahala

**Symptoms:**
- 401/403 errors when you dey call AI services
- "Access denied" messages dey show

**Solutions:**
```bash
# Check say role assignment dey correct
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Confirm managed identity setup
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Make sure Key Vault access dey okay
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Wahala

**Symptoms:**
- Models no dey available for deployment
- Some model versions dey fail

**Solutions:**
```bash
# List models wey dey available for each region
az cognitiveservices model list --location eastus

# Update model version for bicep template
# Check wetin model need for capacity
```

## Example Templates

### Basic Chat Application

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Cognitive Search + App Service

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Document Processing Pipeline

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Services**: Document Intelligence + Storage + Functions

**Quick Start**:
```bash
azd init --template ai-document-processing
azd up
```

### Enterprise Chat wit RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

## Next Steps

1. **Try di Examples**: Start wit pre-built template wey match wetin you wan do
2. **Customize am for Your Needs**: Change di infrastructure and app code
3. **Add Monitoring**: Put better observability
4. **Optimize Costs**: Adjust di configurations to fit your budget
5. **Secure Your Deployment**: Use enterprise security patterns
6. **Scale to Production**: Add multi-region and high-availability features

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Azure OpenAI Chat App (30 minutes)
**Goal**: Deploy and test one production-ready AI chat app

```bash
# Start template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Deploy am
azd up

# Test di application
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Check AI work
azd monitor

# Clear am
azd down --force --purge
```

**Success Criteria:**
- [ ] Deployment work without quota wahala
- [ ] You fit access chat interface for browser
- [ ] You fit ask questions and get AI-powered answers
- [ ] Application Insights dey show telemetry data
- [ ] You don clean up resources well

**Estimated Cost**: $5-10 for 30 minutes of testing

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: Deploy multiple AI models wit different configurations

```bash
# Make custom Bicep configuration
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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

# Deploy am and check am
azd provision
azd show
```

**Success Criteria:**
- [ ] Multiple models deploy well
- [ ] Different capacity settings dey applied
- [ ] Models dey accessible via API
- [ ] You fit call di two models from app

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: Set up budget alerts and cost tracking

```bash
# Add budget alert for Bicep
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

# Deploy budget alert
azd provision

# Check di current costs
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Success Criteria:**
- [ ] Budget alert don dey for Azure
- [ ] Email notifications don set
- [ ] You fit see cost data for Azure Portal
- [ ] Budget thresholds don set well

## 💡 Frequently Asked Questions

<details>
<summary><strong>How I go fit reduce Azure OpenAI costs during development?</strong></summary>

1. **Use Free Tier**: Azure OpenAI dey give 50,000 tokens/month free
2. **Reduce Capacity**: Set capacity to 10 TPM instead of 30+ for dev
3. **Use azd down**: Deallocate resources when you no dey actively develop
4. **Cache Responses**: Use Redis cache for repeated queries
5. **Use Prompt Engineering**: Reduce token usage wit better prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Wetin be di difference between Azure OpenAI and OpenAI API?</strong></summary>

**Azure OpenAI**:
- Enterprise security and compliance
- Private network integration
- SLA guarantees
- Managed identity authentication
- Higher quotas dey available

**OpenAI API**:
- Quick access to new models
- Easy setup
- Lower barrier to entry
- Public internet only

For production apps, **Azure OpenAI na di better option**.
</details>

<details>
<summary><strong>How I go fit handle Azure OpenAI quota don finish errors?</strong></summary>

```bash
# Check di current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity for now
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Ask for quota increase
# Go Azure Portal > Quotas > Ask for increase
```
</details>

<details>
<summary><strong>I fit use my own data wit Azure OpenAI?</strong></summary>

Yes! Use **Azure AI Search** for RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Check di [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>How I go fit secure AI model endpoints?</strong></summary>

**Best Practices**:
1. Use Managed Identity (no API keys)
2. Enable Private Endpoints
3. Configure network security groups
4. Implement rate limiting
5. Use Azure Key Vault for secrets

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

## Community and Support

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../getting-started/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../getting-started/configuration.md)

**Need Help?** Join our community discussions or open an issue for di repository. Di Azure AI + AZD community dey here to help you succeed!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even as we dey try make am accurate, abeg sabi say AI translation fit get mistake or no dey 100% correct. Di original dokyument for im native language na di main source wey you go trust. For important mata, e good make professional human translator check am. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->