<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a248f574dbb58c1f58a7bcc3f47e361",
  "translation_date": "2025-11-25T00:00:20+00:00",
  "source_file": "docs/ai-foundry/production-ai-practices.md",
  "language_code": "kn"
}
-->
# AZD ಬಳಸಿ ಉತ್ಪಾದನಾ AI ಕಾರ್ಯಭಾರಗಳ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಪ್ರಾರಂಭಿಕರಿಗಾಗಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 8 - ಉತ್ಪಾದನಾ ಮತ್ತು ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 7: ತೊಂದರೆ ಪರಿಹಾರ](../troubleshooting/debugging.md)
- **⬅️ ಸಂಬಂಧಿತ**: [AI ವರ್ಕ್‌ಶಾಪ್ ಲ್ಯಾಬ್](ai-workshop-lab.md)
- **🎯 ಕೋರ್ಸ್ ಪೂರ್ಣಗೊಂಡಿದೆ**: [AZD ಪ್ರಾರಂಭಿಕರಿಗಾಗಿ](../../README.md)

## ಅವಲೋಕನ

ಈ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI (AZD) ಬಳಸಿ ಉತ್ಪಾದನಾ-ಸಿದ್ಧ AI ಕಾರ್ಯಭಾರಗಳನ್ನು ನಿಯೋಜಿಸಲು ಸಮಗ್ರ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ. Microsoft Foundry Discord ಸಮುದಾಯ ಮತ್ತು ನೈಜ-ಜಗತ್ತಿನ ಗ್ರಾಹಕ ನಿಯೋಜನೆಗಳಿಂದ ಪಡೆದ ಪ್ರತಿಕ್ರಿಯೆ ಆಧರಿಸಿ, ಈ ಅಭ್ಯಾಸಗಳು ಉತ್ಪಾದನಾ AI ವ್ಯವಸ್ಥೆಗಳಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ ಎದುರಾಗುವ ಸವಾಲುಗಳನ್ನು ಪರಿಹರಿಸುತ್ತವೆ.

## ಮುಖ್ಯ ಸವಾಲುಗಳು

ನಮ್ಮ ಸಮುದಾಯದ ಸಮೀಕ್ಷಾ ಫಲಿತಾಂಶಗಳ ಆಧಾರದ ಮೇಲೆ, ಡೆವಲಪರ್‌ಗಳು ಎದುರಿಸುವ ಪ್ರಮುಖ ಸವಾಲುಗಳು ಇವು:

- **45%** ಬಹು-ಸೇವಾ AI ನಿಯೋಜನೆಗಳಲ್ಲಿ ಕಷ್ಟಪಡುತ್ತಾರೆ
- **38%** ರಹಸ್ಯ ಮತ್ತು ಕ್ರೆಡೆನ್ಷಿಯಲ್ ನಿರ್ವಹಣೆಯಲ್ಲಿ ಸಮಸ್ಯೆಗಳನ್ನು ಹೊಂದಿದ್ದಾರೆ  
- **35%** ಉತ್ಪಾದನಾ ಸಿದ್ಧತೆ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ಅನ್ನು ಕಷ್ಟಕರವೆಂದು ಪಡುತ್ತಾರೆ
- **32%** ವೆಚ್ಚದ ಆಪ್ಟಿಮೈಸೇಶನ್ ತಂತ್ರಗಳನ್ನು ಅಗತ್ಯವಿದೆ
- **29%** ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ತೊಂದರೆ ಪರಿಹಾರವನ್ನು ಸುಧಾರಿಸಲು ಅಗತ್ಯವಿದೆ

## ಉತ್ಪಾದನಾ AI ಗಾಗಿ ಆರ್ಕಿಟೆಕ್ಚರ್ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: ಮೈಕ್ರೋಸರ್ವಿಸ್‌ಗಳ AI ಆರ್ಕಿಟೆಕ್ಚರ್

**ಬಳಸುವ ಸಮಯ**: ಬಹು ಸಾಮರ್ಥ್ಯಗಳೊಂದಿಗೆ ಸಂಕೀರ್ಣ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳು

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Web Frontend  │────│   API Gateway   │────│  Load Balancer  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │
                ┌───────────────┼───────────────┐
                │               │               │
        ┌───────▼──────┐ ┌──────▼──────┐ ┌─────▼──────┐
        │ Chat Service │ │Image Service│ │Text Service│
        └──────────────┘ └─────────────┘ └────────────┘
                │               │               │
        ┌───────▼──────┐ ┌──────▼──────┐ ┌─────▼──────┐
        │Azure OpenAI  │ │Computer     │ │Document    │
        │              │ │Vision       │ │Intelligence│
        └──────────────┘ └─────────────┘ └────────────┘
```

**AZD ಅನುಷ್ಠಾನ**:

```yaml
# azure.yaml
name: enterprise-ai-platform
services:
  web:
    project: ./web
    host: staticwebapp
  api-gateway:
    project: ./api-gateway
    host: containerapp
  chat-service:
    project: ./services/chat
    host: containerapp
  vision-service:
    project: ./services/vision
    host: containerapp
  text-service:
    project: ./services/text
    host: containerapp
```

### ಮಾದರಿ 2: ಈವೆಂಟ್-ಚಾಲಿತ AI ಪ್ರಕ್ರಿಯೆ

**ಬಳಸುವ ಸಮಯ**: ಬ್ಯಾಚ್ ಪ್ರಕ್ರಿಯೆ, ಡಾಕ್ಯುಮೆಂಟ್ ವಿಶ್ಲೇಷಣೆ, ಅಸಿಂಕ್ ವರ್ಕ್‌ಫ್ಲೋಗಳು

```bicep
// Event Hub for AI processing pipeline
resource eventHub 'Microsoft.EventHub/namespaces@2023-01-01-preview' = {
  name: eventHubNamespaceName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 1
  }
}

// Service Bus for reliable message processing
resource serviceBus 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: serviceBusNamespaceName
  location: location
  sku: {
    name: 'Premium'
    tier: 'Premium'
    capacity: 1
  }
}

// Function App for processing
resource functionApp 'Microsoft.Web/sites@2023-01-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp,linux'
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'AZURE_OPENAI_ENDPOINT'
          value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=openai-endpoint)'
        }
      ]
    }
  }
}
```

## ಭದ್ರತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### 1. ಶೂನ್ಯ-ವಿಶ್ವಾಸ ಭದ್ರತಾ ಮಾದರಿ

**ಅನುಷ್ಠಾನ ತಂತ್ರ**:
- ಪ್ರಾಮಾಣೀಕರಣವಿಲ್ಲದೆ ಯಾವುದೇ ಸೇವೆ-ಸೇವೆ ಸಂವಹನವಿಲ್ಲ
- ಎಲ್ಲಾ API ಕರೆಗಳು ನಿರ್ವಹಿತ ಗುರುತಿನ ಚಿಹ್ನೆಗಳನ್ನು ಬಳಸುತ್ತವೆ
- ಖಾಸಗಿ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳೊಂದಿಗೆ ನೆಟ್‌ವರ್ಕ್ ಪ್ರತ್ಯೇಕತೆ
- ಕನಿಷ್ಠ ಪ್ರಿವಿಲೇಜ್ ಪ್ರವೇಶ ನಿಯಂತ್ರಣಗಳು

```bicep
// Managed Identity for each service
resource chatServiceIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'chat-service-identity'
  location: location
}

// Role assignments with minimal permissions
resource openAIUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, chatServiceIdentity.id, openAIUserRoleDefinitionId)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: chatServiceIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### 2. ರಹಸ್ಯ ನಿರ್ವಹಣೆಯನ್ನು ಭದ್ರಗೊಳಿಸಿ

**ಕೀ ವಾಲ್ಟ್ ಇಂಟಿಗ್ರೇಶನ್ ಮಾದರಿ**:

```bicep
// Key Vault with proper access policies
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'premium'  // Use premium for production
    }
    enableRbacAuthorization: true  // Use RBAC instead of access policies
    enablePurgeProtection: true    // Prevent accidental deletion
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
  }
}

// Store all AI service credentials
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
    attributes: {
      enabled: true
    }
  }
}
```

### 3. ನೆಟ್‌ವರ್ಕ್ ಭದ್ರತೆ

**ಖಾಸಗಿ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಕಾನ್ಫಿಗರೇಶನ್**:

```bicep
// Virtual Network for AI services
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'ai-services-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          privateEndpointNetworkPolicies: 'Disabled'
        }
      }
      {
        name: 'app-services-subnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'Microsoft.Web/serverFarms'
              properties: {
                serviceName: 'Microsoft.Web/serverFarms'
              }
            }
          ]
        }
      }
    ]
  }
}

// Private endpoints for all AI services
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

## ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್

### 1. ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ತಂತ್ರಗಳು

**ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್**:

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
        transport: 'http'
      }
    }
    template: {
      scale: {
        minReplicas: 2  // Always have 2 instances minimum
        maxReplicas: 50 // Scale up to 50 for high load
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '20'  // Scale when >20 concurrent requests
              }
            }
          }
          {
            name: 'cpu-scaling'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'  // Scale when CPU >70%
              }
            }
          }
        ]
      }
    }
  }
}
```

### 2. ಕ್ಯಾಶಿಂಗ್ ತಂತ್ರಗಳು

**Redis ಕ್ಯಾಶ್ AI ಪ್ರತಿಕ್ರಿಯೆಗಳಿಗೆ**:

```bicep
// Redis Premium for production workloads
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Premium'
      family: 'P'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
    redisConfiguration: {
      'maxmemory-policy': 'allkeys-lru'
    }
    // Enable clustering for high availability
    redisVersion: '6.0'
    shardCount: 2
  }
}

// Cache configuration in application
var cacheConnectionString = '${redisCache.properties.hostName}:6380,password=${redisCache.listKeys().primaryKey},ssl=True,abortConnect=False'
```

### 3. ಲೋಡ್ ಬ್ಯಾಲೆನ್ಸಿಂಗ್ ಮತ್ತು ಟ್ರಾಫಿಕ್ ನಿರ್ವಹಣೆ

**WAF ಸಹಿತ ಅಪ್ಲಿಕೇಶನ್ ಗೇಟ್‌ವೇ**:

```bicep
// Application Gateway with Web Application Firewall
resource applicationGateway 'Microsoft.Network/applicationGateways@2023-04-01' = {
  name: appGatewayName
  location: location
  properties: {
    sku: {
      name: 'WAF_v2'
      tier: 'WAF_v2'
      capacity: 2
    }
    webApplicationFirewallConfiguration: {
      enabled: true
      firewallMode: 'Prevention'
      ruleSetType: 'OWASP'
      ruleSetVersion: '3.2'
    }
    // Backend pools for AI services
    backendAddressPools: [
      {
        name: 'ai-services-pool'
        properties: {
          backendAddresses: [
            {
              fqdn: '${containerApp.properties.configuration.ingress.fqdn}'
            }
          ]
        }
      }
    ]
  }
}
```

## 💰 ವೆಚ್ಚದ ಆಪ್ಟಿಮೈಸೇಶನ್

### 1. ಸಂಪತ್ತಿನ ಸರಿಯಾದ ಗಾತ್ರ

**ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು**:

```bash
# ಅಭಿವೃದ್ಧಿ ಪರಿಸರ
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# ಉತ್ಪಾದನಾ ಪರಿಸರ
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. ವೆಚ್ಚದ ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಬಜೆಟ್‌ಗಳು

```bicep
// Cost management and budgets
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 2000  // $2000 monthly budget
    category: 'Cost'
    notifications: {
      warning: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'finance@company.com'
          'engineering@company.com'
        ]
        contactRoles: [
          'Owner'
          'Contributor'
        ]
      }
      critical: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 95
        contactEmails: [
          'cto@company.com'
        ]
      }
    }
  }
}
```

### 3. ಟೋಕನ್ ಬಳಕೆಯ ಆಪ್ಟಿಮೈಸೇಶನ್

**OpenAI ವೆಚ್ಚ ನಿರ್ವಹಣೆ**:

```typescript
// ಅಪ್ಲಿಕೇಶನ್-ಮಟ್ಟದ ಟೋಕನ್ ಆಪ್ಟಿಮೈಸೇಶನ್
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // ಸಂದರ್ಭವನ್ನು ಕಡಿತಗೊಳಿಸಿ, ಬಳಕೆದಾರರ ಇನ್‌ಪುಟ್ ಅನ್ನು ಅಲ್ಲ
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // ಅಂದಾಜು: 1 ಟೋಕನ್ ≈ 4 ಅಕ್ಷರಗಳು
    return Math.ceil(text.length / 4);
  }
}
```

## ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಅವಲೋಕನ

### 1. ಸಮಗ್ರ ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್

```bicep
// Application Insights with advanced features
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    SamplingPercentage: 100  // Full sampling for AI apps
    DisableIpMasking: false  // Enable for security
  }
}

// Custom metrics for AI operations
resource aiMetricAlerts 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: 'ai-high-error-rate'
  location: 'global'
  properties: {
    description: 'Alert when AI service error rate is high'
    severity: 2
    enabled: true
    scopes: [
      applicationInsights.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'high-error-rate'
          metricName: 'requests/failed'
          operator: 'GreaterThan'
          threshold: 10
          timeAggregation: 'Count'
        }
      ]
    }
  }
}
```

### 2. AI-ನಿರ್ದಿಷ್ಟ ಮೇಲ್ವಿಚಾರಣೆ

**AI ಮೆಟ್ರಿಕ್‌ಗಳಿಗೆ ಕಸ್ಟಮ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ಗಳು**:

```json
// Dashboard configuration for AI workloads
{
  "dashboard": {
    "name": "AI Application Monitoring",
    "tiles": [
      {
        "name": "OpenAI Request Volume",
        "query": "requests | where name contains 'openai' | summarize count() by bin(timestamp, 5m)"
      },
      {
        "name": "AI Response Latency",
        "query": "requests | where name contains 'openai' | summarize avg(duration) by bin(timestamp, 5m)"
      },
      {
        "name": "Token Usage",
        "query": "customMetrics | where name == 'openai_tokens_used' | summarize sum(value) by bin(timestamp, 1h)"
      },
      {
        "name": "Cost per Hour",
        "query": "customMetrics | where name == 'openai_cost' | summarize sum(value) by bin(timestamp, 1h)"
      }
    ]
  }
}
```

### 3. ಆರೋಗ್ಯ ತಪಾಸಣೆ ಮತ್ತು ಅಪ್‌ಟೈಮ್ ಮೇಲ್ವಿಚಾರಣೆ

```bicep
// Application Insights availability tests
resource availabilityTest 'Microsoft.Insights/webtests@2022-06-15' = {
  name: 'ai-app-availability-test'
  location: location
  tags: {
    'hidden-link:${applicationInsights.id}': 'Resource'
  }
  properties: {
    SyntheticMonitorId: 'ai-app-availability-test'
    Name: 'AI Application Availability Test'
    Description: 'Tests AI application endpoints'
    Enabled: true
    Frequency: 300  // 5 minutes
    Timeout: 120    // 2 minutes
    Kind: 'ping'
    Locations: [
      {
        Id: 'us-east-2-azr'
      }
      {
        Id: 'us-west-2-azr'
      }
    ]
    Configuration: {
      WebTest: '''
        <WebTest Name="AI Health Check" 
                 Id="8d2de8d2-a2b0-4c2e-9a0d-8f9c9a0b8c8d" 
                 Enabled="True" 
                 CssProjectStructure="" 
                 CssIteration="" 
                 Timeout="120" 
                 WorkItemIds="" 
                 xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010" 
                 Description="" 
                 CredentialUserName="" 
                 CredentialPassword="" 
                 PreAuthenticate="True" 
                 Proxy="default" 
                 StopOnError="False" 
                 RecordedResultFile="" 
                 ResultsLocale="">
          <Items>
            <Request Method="GET" 
                     Guid="a5f10126-e4cd-570d-961c-cea43999a200" 
                     Version="1.1" 
                     Url="${webApp.properties.defaultHostName}/health" 
                     ThinkTime="0" 
                     Timeout="120" 
                     ParseDependentRequests="True" 
                     FollowRedirects="True" 
                     RecordResult="True" 
                     Cache="False" 
                     ResponseTimeGoal="0" 
                     Encoding="utf-8" 
                     ExpectedHttpStatusCode="200" 
                     ExpectedResponseUrl="" 
                     ReportingName="" 
                     IgnoreHttpStatusCode="False" />
          </Items>
        </WebTest>
      '''
    }
  }
}
```

## ವಿಪತ್ತು ಪುನಃಪ್ರಾಪ್ತಿ ಮತ್ತು ಹೆಚ್ಚಿನ ಲಭ್ಯತೆ

### 1. ಬಹು-ಪ್ರಾದೇಶಿಕ ನಿಯೋಜನೆ

```yaml
# azure.yaml - Multi-region configuration
name: ai-app-multiregion
services:
  api-primary:
    project: ./api
    host: containerapp
    env:
      - AZURE_REGION=eastus
  api-secondary:
    project: ./api
    host: containerapp
    env:
      - AZURE_REGION=westus2
```

```bicep
// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficManagerProfiles@2022-04-01' = {
  name: trafficManagerProfileName
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Priority'
    dnsConfig: {
      relativeName: trafficManagerProfileName
      ttl: 30
    }
    monitorConfig: {
      protocol: 'HTTPS'
      port: 443
      path: '/health'
      intervalInSeconds: 30
      toleratedNumberOfFailures: 3
      timeoutInSeconds: 10
    }
    endpoints: [
      {
        name: 'primary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: primaryAppService.id
          endpointStatus: 'Enabled'
          priority: 1
        }
      }
      {
        name: 'secondary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: secondaryAppService.id
          endpointStatus: 'Enabled'
          priority: 2
        }
      }
    ]
  }
}
```

### 2. ಡೇಟಾ ಬ್ಯಾಕಪ್ ಮತ್ತು ಪುನಃಪ್ರಾಪ್ತಿ

```bicep
// Backup configuration for critical data
resource backupVault 'Microsoft.DataProtection/backupVaults@2023-05-01' = {
  name: backupVaultName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    storageSettings: [
      {
        datastoreType: 'VaultStore'
        type: 'LocallyRedundant'
      }
    ]
  }
}

// Backup policy for AI models and data
resource backupPolicy 'Microsoft.DataProtection/backupVaults/backupPolicies@2023-05-01' = {
  parent: backupVault
  name: 'ai-data-backup-policy'
  properties: {
    policyRules: [
      {
        backupParameters: {
          backupType: 'Full'
          objectType: 'AzureBackupParams'
        }
        trigger: {
          schedule: {
            repeatingTimeIntervals: [
              'R/2024-01-01T02:00:00+00:00/P1D'  // Daily at 2 AM
            ]
          }
          objectType: 'ScheduleBasedTriggerContext'
        }
        dataStore: {
          datastoreType: 'VaultStore'
          objectType: 'DataStoreInfoBase'
        }
        name: 'BackupDaily'
        objectType: 'AzureBackupRule'
      }
    ]
  }
}
```

## ಡೆವ್‌ಆಪ್ಸ್ ಮತ್ತು CI/CD ಇಂಟಿಗ್ರೇಶನ್

### 1. GitHub ಕ್ರಿಯೆಗಳ ವರ್ಕ್‌ಫ್ಲೋ

```yaml
# .github/workflows/deploy-ai-app.yml
name: Deploy AI Application

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
          
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
          pip install pytest
          
      - name: Run tests
        run: pytest tests/
        
      - name: AI Safety Tests
        run: |
          python scripts/test_ai_safety.py
          python scripts/validate_prompts.py

  deploy-staging:
    needs: test
    if: github.event_name == 'pull_request'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup AZD
        uses: Azure/setup-azd@v1.0.0
        
      - name: Login to Azure
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
          
      - name: Deploy to Staging
        run: |
          azd env select staging
          azd deploy

  deploy-production:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup AZD
        uses: Azure/setup-azd@v1.0.0
        
      - name: Login to Azure
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
          
      - name: Deploy to Production
        run: |
          azd env select production
          azd deploy
          
      - name: Run Production Health Checks
        run: |
          python scripts/health_check.py --env production
```

### 2. ಮೂಲಸೌಕರ್ಯ ಮಾನ್ಯತೆ

```bash
# ಸ್ಕ್ರಿಪ್ಟ್ಸ್/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# ಎಲ್ಲಾ ಅಗತ್ಯ ಸೇವೆಗಳು ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI ಮಾದರಿ ನಿಯೋಜನೆಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI ಸೇವೆ ಸಂಪರ್ಕತೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## ಉತ್ಪಾದನಾ ಸಿದ್ಧತಾ ಚೆಕ್‌ಲಿಸ್ಟ್

### ಭದ್ರತೆ ✅
- [ ] ಎಲ್ಲಾ ಸೇವೆಗಳು ನಿರ್ವಹಿತ ಗುರುತಿನ ಚಿಹ್ನೆಗಳನ್ನು ಬಳಸುತ್ತವೆ
- [ ] ರಹಸ್ಯಗಳು ಕೀ ವಾಲ್ಟ್‌ನಲ್ಲಿ ಸಂಗ್ರಹಿಸಲಾಗಿದೆ
- [ ] ಖಾಸಗಿ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
- [ ] ನೆಟ್‌ವರ್ಕ್ ಭದ್ರತಾ ಗುಂಪುಗಳು ಅನುಷ್ಠಾನಗೊಳಿಸಲಾಗಿದೆ
- [ ] ಕನಿಷ್ಠ ಪ್ರಿವಿಲೇಜ್‌ನೊಂದಿಗೆ RBAC
- [ ] ಸಾರ್ವಜನಿಕ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳಲ್ಲಿ WAF ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ

### ಕಾರ್ಯಕ್ಷಮತೆ ✅
- [ ] ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
- [ ] ಕ್ಯಾಶಿಂಗ್ ಅನುಷ್ಠಾನಗೊಳಿಸಲಾಗಿದೆ
- [ ] ಲೋಡ್ ಬ್ಯಾಲೆನ್ಸಿಂಗ್ ಸೆಟಪ್ ಮಾಡಲಾಗಿದೆ
- [ ] ಸ್ಥಿರ ವಿಷಯಕ್ಕಾಗಿ CDN
- [ ] ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕ ಪೂಲಿಂಗ್
- [ ] ಟೋಕನ್ ಬಳಕೆಯ ಆಪ್ಟಿಮೈಸೇಶನ್

### ಮೇಲ್ವಿಚಾರಣೆ ✅
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
- [ ] ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್‌ಗಳು ವ್ಯಾಖ್ಯಾನಿಸಲಾಗಿದೆ
- [ ] ಎಚ್ಚರಿಕೆ ನಿಯಮಗಳು ಸೆಟಪ್ ಮಾಡಲಾಗಿದೆ
- [ ] ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ರಚಿಸಲಾಗಿದೆ
- [ ] ಆರೋಗ್ಯ ತಪಾಸಣೆಗಳು ಅನುಷ್ಠಾನಗೊಳಿಸಲಾಗಿದೆ
- [ ] ಲಾಗ್ ಸಂಗ್ರಹಣಾ ನೀತಿಗಳು

### ನಂಬಿಕೆ ✅
- [ ] ಬಹು-ಪ್ರಾದೇಶಿಕ ನಿಯೋಜನೆ
- [ ] ಬ್ಯಾಕಪ್ ಮತ್ತು ಪುನಃಪ್ರಾಪ್ತಿ ಯೋಜನೆ
- [ ] ಸರ್ಕ್ಯೂಟ್ ಬ್ರೇಕರ್‌ಗಳು ಅನುಷ್ಠಾನಗೊಳಿಸಲಾಗಿದೆ
- [ ] ಪುನಃಪ್ರಯತ್ನ ನೀತಿಗಳು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
- [ ] ಗ್ರೇಸ್‌ಫುಲ್ ಡಿಗ್ರಡೇಶನ್
- [ ] ಆರೋಗ್ಯ ತಪಾಸಣೆ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು

### ವೆಚ್ಚ ನಿರ್ವಹಣೆ ✅
- [ ] ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳು ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
- [ ] ಸಂಪತ್ತಿನ ಸರಿಯಾದ ಗಾತ್ರ
- [ ] ಡೆವ್/ಟೆಸ್ಟ್ ರಿಯಾಯಿತಿಗಳು ಅನ್ವಯಿಸಲಾಗಿದೆ
- [ ] ಮೀಸಲು ಘಟಕಗಳನ್ನು ಖರೀದಿಸಲಾಗಿದೆ
- [ ] ವೆಚ್ಚದ ಮೇಲ್ವಿಚಾರಣೆ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್
- [ ] ನಿಯಮಿತ ವೆಚ್ಚ ವಿಮರ್ಶೆಗಳು

### соответствие ✅
- [ ] ಡೇಟಾ ನಿವಾಸದ ಅಗತ್ಯತೆಗಳನ್ನು ಪೂರೈಸಲಾಗಿದೆ
- [ ] ಆಡಿಟ್ ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ
- [ ] ಅನುಕೂಲತೆಯ ನೀತಿಗಳನ್ನು ಅನ್ವಯಿಸಲಾಗಿದೆ
- [ ] ಭದ್ರತಾ ಮೂಲಭೂತಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಲಾಗಿದೆ
- [ ] ನಿಯಮಿತ ಭದ್ರತಾ ಮೌಲ್ಯಮಾಪನಗಳು
- [ ] ಘಟನೆ ಪ್ರತಿಕ್ರಿಯಾ ಯೋಜನೆ

## ಕಾರ್ಯಕ್ಷಮತೆ ಬೆಂಚ್ಮಾರ್ಕ್‌ಗಳು

### ಸಾಮಾನ್ಯ ಉತ್ಪಾದನಾ ಮೆಟ್ರಿಕ್‌ಗಳು

| ಮೆಟ್ರಿಕ್ | ಗುರಿ | ಮೇಲ್ವಿಚಾರಣೆ |
|--------|--------|------------|
| **ಪ್ರತಿಕ್ರಿಯಾ ಸಮಯ** | < 2 ಸೆಕೆಂಡುಗಳು | ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ |
| **ಲಭ್ಯತೆ** | 99.9% | ಅಪ್‌ಟೈಮ್ ಮೇಲ್ವಿಚಾರಣೆ |
| **ದೋಷ ದರ** | < 0.1% | ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳು |
| **ಟೋಕನ್ ಬಳಕೆ** | < $500/ತಿಂಗಳು | ವೆಚ್ಚ ನಿರ್ವಹಣೆ |
| **ಸಮಕಾಲೀನ ಬಳಕೆದಾರರು** | 1000+ | ಲೋಡ್ ಪರೀಕ್ಷೆ |
| **ಪುನಃಪ್ರಾಪ್ತಿ ಸಮಯ** | < 1 ಗಂಟೆ | ವಿಪತ್ತು ಪುನಃಪ್ರಾಪ್ತಿ ಪರೀಕ್ಷೆಗಳು |

### ಲೋಡ್ ಪರೀಕ್ಷೆ

```bash
# AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ ಲೋಡ್ ಪರೀಕ್ಷಾ ಸ್ಕ್ರಿಪ್ಟ್
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 ಸಮುದಾಯದ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

Microsoft Foundry Discord ಸಮುದಾಯದ ಪ್ರತಿಕ್ರಿಯೆ ಆಧರಿಸಿ:

### ಸಮುದಾಯದ ಪ್ರಮುಖ ಶಿಫಾರಸುಗಳು:

1. **ಸಣ್ಣದಾಗಿ ಪ್ರಾರಂಭಿಸಿ, ಹಂತ ಹಂತವಾಗಿ ಸ್ಕೇಲ್ ಮಾಡಿ**: ಮೂಲ SKUs ನಿಂದ ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು ನಿಜವಾದ ಬಳಕೆಯ ಆಧಾರದ ಮೇಲೆ ಸ್ಕೇಲ್ ಮಾಡಿ
2. **ಎಲ್ಲವನ್ನೂ ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ**: ಮೊದಲ ದಿನದಿಂದ ಸಮಗ್ರ ಮೇಲ್ವಿಚಾರಣೆಯನ್ನು ಸೆಟಪ್ ಮಾಡಿ
3. **ಭದ್ರತೆಯನ್ನು ಸ್ವಯಂಚಾಲಿತಗೊಳಿಸಿ**: ಸತತ ಭದ್ರತೆಗೆ ಕೋಡ್‌ನ ಮೂಲಸೌಕರ್ಯವನ್ನು ಬಳಸಿ
4. **ಸಮಗ್ರವಾಗಿ ಪರೀಕ್ಷಿಸಿ**: ನಿಮ್ಮ ಪೈಪ್‌ಲೈನ್‌ನಲ್ಲಿ AI-ನಿರ್ದಿಷ್ಟ ಪರೀಕ್ಷೆಯನ್ನು ಸೇರಿಸಿ
5. **ವೆಚ್ಚವನ್ನು ಯೋಜಿಸಿ**: ಟೋಕನ್ ಬಳಕೆಯನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ ಮತ್ತು ಶೀಘ್ರದಲ್ಲೇ ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸೆಟಪ್ ಮಾಡಿ

### ಸಾಮಾನ್ಯ ತಪ್ಪುಗಳು:

- ❌ API ಕೀಗಳನ್ನು ಕೋಡ್‌ನಲ್ಲಿ ಹಾರ್ಡ್‌ಕೋಡ್ ಮಾಡುವುದು
- ❌ ಸರಿಯಾದ ಮೇಲ್ವಿಚಾರಣೆಯನ್ನು ಸೆಟಪ್ ಮಾಡದಿರುವುದು
- ❌ ವೆಚ್ಚದ ಆಪ್ಟಿಮೈಸೇಶನ್ ಅನ್ನು ನಿರ್ಲಕ್ಷಿಸುವುದು
- ❌ ವೈಫಲ್ಯ ಪರಿಸ್ಥಿತಿಗಳನ್ನು ಪರೀಕ್ಷಿಸದಿರುವುದು
- ❌ ಆರೋಗ್ಯ ತಪಾಸಣೆಗಳಿಲ್ಲದೆ ನಿಯೋಜನೆ ಮಾಡುವುದು

## ಹೆಚ್ಚುವರಿ ಸಂಪತ್ತುಗಳು

- **Azure ಉತ್ತಮ-ಆರ್ಕಿಟೆಕ್ಚರ್ ಚೌಕಟ್ಟು**: [AI ಕಾರ್ಯಭಾರ ಮಾರ್ಗದರ್ಶನ](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry ಡಾಕ್ಯುಮೆಂಟೇಶನ್**: [ಅಧಿಕೃತ ಡಾಕ್ಸ್](https://learn.microsoft.com/azure/ai-studio/)
- **ಸಮುದಾಯ ಟೆಂಪ್ಲೇಟುಗಳು**: [Azure ಮಾದರಿಗಳು](https://github.com/Azure-Samples)
- **Discord ಸಮುದಾಯ**: [#Azure ಚಾನೆಲ್](https://discord.gg/microsoft-azure)

---

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಪ್ರಾರಂಭಿಕರಿಗಾಗಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 8 - ಉತ್ಪಾದನಾ ಮತ್ತು ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 7: ತೊಂದರೆ ಪರಿಹಾರ](../troubleshooting/debugging.md)
- **⬅️ ಸಂಬಂಧಿತ**: [AI ವರ್ಕ್‌ಶಾಪ್ ಲ್ಯಾಬ್](ai-workshop-lab.md)
- **🎆 ಕೋರ್ಸ್ ಪೂರ್ಣಗೊಂಡಿದೆ**: [AZD ಪ್ರಾರಂಭಿಕರಿಗಾಗಿ](../../README.md)

**ಗಮನಿಸಿ**: ಉತ್ಪಾದನಾ AI ಕಾರ್ಯಭಾರಗಳು ಸೂಕ್ಷ್ಮ ಯೋಜನೆ, ಮೇಲ್ವಿಚಾರಣೆ, ಮತ್ತು ನಿರಂತರ ಆಪ್ಟಿಮೈಸೇಶನ್ ಅಗತ್ಯವಿದೆ. ಈ ಮಾದರಿಗಳಿಂದ ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು ನಿಮ್ಮ ನಿರ್ದಿಷ್ಟ ಅಗತ್ಯಗಳಿಗೆ ಅವುಗಳನ್ನು ಹೊಂದಿಸಿ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸಮಾಕ್ಷ್ಯತೆ**:  
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯಿಗಾಗಿ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಮಾಕ್ಷ್ಯತೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮಹತ್ವದ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->