# AZD ಸಹಿತ ಉತ್ಪಾದನೆ AI ಕಾರ್ಯಭಾರಗಳಿಗೆ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ ಇನ್ನೂ ಸಂಬಂಧಿತ**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 ಕೋರ್ಸ್ ಪೂರ್ಣಗೊಂಡಿದೆ**: [AZD For Beginners](../../README.md)

## ಸಾರಾಂಶ

ಈ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI (AZD) ಬಳಸಿ ಉತ್ಪಾದನಾ-ಸಿದ್ಧ AI ಕಾರ್ಯಭಾರಗಳನ್ನು ನಿಯೋಜಿಸುವ ಕುರಿತು ಸವಿಸ್ತಾರವಾದ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ. Microsoft Foundry Discord ಸಮುದಾಯದಿಂದ ಮತ್ತು ವಾಸ್ತವಿಕ ಗ್ರಾಹಕ ನಿಯೋಜನೆಗಳಿಂದ ಪಡೆದ ಅಭಿಪ್ರಾಯದ ಆಧಾರದ ಮೇಲೆ, ಈ ಅಭ್ಯಾಸಗಳು ಉತ್ಪಾದನಾ AI ವ್ಯವಸ್ಥೆಗಳಲ್ಲಿನ ಸಾಮಾನ್ಯ ಸವಾಲುಗಳನ್ನು ಪರಿಹರಿಸಲು ರೂಪಿಸಲಾಗಿದೆ.

## ಪ್ರಮುಖ ಸಮಸ್ಯೆಗಳು

ನಮ್ಮ ಸಮುದಾಯದ ಸಮೀಕ್ಷಾ ಫಲಿತಾಂಶದ ಆಧಾರದ ಮೇಲೆ, ಅಭಿವೃದ್ಧಿಪಡಕರಿಗೆ ಎದುರಾಗುವ ಪ್ರಮುಖ ಸವಾಲುಗಳು ಇವು:

- **45%** ಬಹು-ಸೇವಾ AI ನಿಯೋಜನೆಗಳೊಂದಿಗೆ ಹೋರಾಡುತ್ತಾರೆ
- **38%** ಪ್ರಮಾಣಪತ್ರ ಮತ್ತು ರಹಸ್ಯ ನಿರ್ವಹಣೆಯಲ್ಲಿ ಸಮಸ್ಯೆಗಳನ್ನು ಹೊಂದಿದ್ದಾರೆ  
- **35%** ಉತ್ಪಾದನಾ ಸಿದ್ದತೆ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ಕಠಿಣವಾಗಿದೆ
- **32%** ಖರ್ಚು ಉತ್ಕೃಷ್ಟೀಕರಣಕ್ಕೆ ಉತ್ತಮ ತಂತ್ರಗಳನ್ನು ಅಗತ್ಯಪಡುತ್ತಾರೆ
- **29%** ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ದೋಷನಿರ್ಣಯ ಸುಧಾರಣೆ ಅಗತ್ಯವಿದೆ

## ಉತ್ಪಾದನಾ AI ಗಾಗಿ ವಾಸ್ತುಶಿಲ್ಪ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: ಮೈಕ್ರೋಸೇವೆಗಳು AI ವಾಸ್ತುಶಿಲ್ಪ

**ಬಳಸಬೇಕಾದಾಗ**: ಬಹು ಸಾಮರ್ಥ್ಯಗಳಿರುವ ಸಂಕೀರ್ಣ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ

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

**AZD ಜಾರಿಗೆ**:

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

### ಮಾದರಿ 2: ಈವೆಂಟ್-ಚಾಲಿತ AI ಪ್ರೊಸೆಸಿಂಗ್

**ಬಳಸಬೇಕಾದಾಗ**: ಬ್ಯಾಚ್ ಪ್ರೊಸೆಸಿಂಗ್, ಡಾಕ್ಯುಮೆಂಟ್ ವಿಶ್ಲೇಷಣೆ, ಅಸಿಂಕ್ ವರ್ಕ್‌ಫ್ಲೋಗಳು

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

### 1. ಶೂನ್ಯ-ವಿಶ್ವಾಸ (Zero-Trust) ಸುರಕ್ಷತಾ ಮಾದರಿ

**ಕಾರ್ಯಗತಗೊಳಿಸುವ ತಂತ್ರ**:
- ಪ್ರಾಮಾಣೀಕರಣವಿಲ್ಲದೆ ಸರ್ವಿಸ್-ತೊ-ಸರ್ವಿಸ್ ಸಂವಹನಕ್ಕೆ ಅವಕಾಶವಿಲ್ಲ
- ಎಲ್ಲಾ API ಕರೆಗಳು ನಿರ್ವಹಿತ ಗುರುತಿನಿಗಳನ್ನು ಬಳಕೆ ಮಾಡುತ್ತವೆ
- ಖಾಸಗಿ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳೊಂದಿಗೆ ನೆಟ್ವರ್ಕ್ বিচ್ಛೇದನ
- ಕನಿಷ್ಠ ಹಕ್ಕುಗಳ ಪ್ರವೇಶ ನಿಯಂತ್ರಣಗಳು

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

### 2. ಭದ್ರ ರಹಸ್ಯ ನಿರ್ವಹಣೆ

**Key Vault ಸಂಯೋಜನೆ ಮಾದರಿ**:

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

### 3. ನೆಟ್ವರ್ಕ್ ಭದ್ರತೆ

**ಖಾಸಗಿ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಸಂರಚನೆ**:

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

## ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ವಿಸ್ತರಣೆ

### 1. ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ತಂತ್ರಗಳು

**ಕಂಟೇನರ್ ಅಪ್ಸ್ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್**:

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

**AI ಪ್ರತಿಕ್ರಿಯೆಗಳಿಗೆ Redis ಕ್ಯಾಶೆ**:

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

### 3. ಲೋಡ್ ಸಮತೋಲನ ಮತ್ತು ಟ್ರಾಫಿಕ್ ನಿರ್ವಹಣೆ

**WAF ಇರುವ ಅಪ್ಲಿಕೇಶನ್ ಗೇಟ್ವೇ**:

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

## 💰 ಖರ್ಚು ಆಪ್ಟಿಮೈಜೆಷನ್

### 1. ಸಂಪನ್ಮೂಲಗಳ ಸಮರ್ಪಕ ಗಾತ್ರ ನಿರ್ಧಾರ

**ವಾತಾವರಣ-ನಿರ್ದಿಷ್ಟ ಸಂರಚನೆಗಳು**:

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

### 2. ಖರ್ಚು ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಬಜೆಟ್‌ಗಳು

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

### 3. ಟೋಕನ್ ಬಳಕೆಯ ಉತ್ಕೃಷ್ಟೀಕರಣ

**OpenAI ಖರ್ಚು ನಿರ್ವಹಣೆ**:

```typescript
// ಅಪ್ಲಿಕೇಶನ್-ಮಟ್ಟದ ಟೋಕನ್ ಆಪ್ಟಿಮೈಸೇಶನ್
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // ಸಂದರ್ಭವನ್ನು ಕತ್ತರಿಸಿ, ಬಳಕೆದಾರರ ಇನ್‌ಪುಟ್ ಅನ್ನು ಅಲ್ಲ
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // ಸುಮಾರು ಅಂದಾಜು: 1 ಟೋಕನ್ ≈ 4 ಅಕ್ಷರಗಳು
    return Math.ceil(text.length / 4);
  }
}
```

## ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಅವಲೋಕನಶೀಲತೆ

### 1. ವಿಸ್ತೃತ Application Insights

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

**AI ಮೆಟ್ರಿಕ್‌ಗಳಿಗಾಗಿ ಕಸ್ಟಮ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ಗಳು**:

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

### 3. ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳು ಮತ್ತು ಅಪ್ಟೈಮ್ ಮೇಲ್ವಿಚಾರಣೆ

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

## ಅಪಘಾತ ಪುನರುದ್ಧಾರ ಮತ್ತು ಉನ್ನತ ಲಭ್ಯತೆ

### 1. ಬಹು-ಪ್ರಾಂತ್ಯ ನಿಯೋಜನೆ

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

### 2. ಡೇಟಾ ಬ್ಯಾಕಪ್ ಮತ್ತು ಪುನರುದ್ಧಾರ

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

## DevOps ಮತ್ತು CI/CD ಏಕೀಕರಣ

### 1. GitHub Actions ವರ್ಕ್‌ಫ್ಲೋ

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

### 2. ಬಿಲ್ಟ್‌ಕಿಟ್ ಮತ್ತು ಮೂಲಸೌಕರ್ಯ ಪರಿಶೀಲನೆ

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# ಎಲ್ಲಾ ಅಗತ್ಯ ಸೇವೆಗಳು ಚಾಲನೆಯಲ್ಲಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI ಮಾದರಿ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI ಸೇವೆಯ ಸಂಪರ್ಕವನ್ನು ಪರೀಕ್ಷಿಸಿ
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## ಉತ್ಪಾದನಾ ಸಿದ್ಧತಾ ಚೆಕ್ಳಿಸ್ಟ್

### ಸುರಕ್ಷತೆ ✅
- [ ] ಎಲ್ಲಾ ಸೇವೆಗಳು ನಿರ್ವಹಿತ ಗುರುತಿನಿಗಳನ್ನು ಬಳಕೆ ಮಾಡುತ್ತವೆ
- [ ] ರಹಸ್ಯಗಳು Key Vault ನಲ್ಲಿ ಸಂಗ್ರಹಿಸಲಾಗಿದೆ
- [ ] ಖಾಸಗಿ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು ಸಂರಚಿಸಲಾಗಿದೆ
- [ ] ನೆಟ್ವರ್ಕ್ ಸೆಕ್ಯುರಿಟಿ ಗುಂಪುಗಳು ಅನ್ವಯಿಸಲಾಗಿದೆ
- [ ] ಕನಿಷ್ಠ ಹಕ್ಕುಗಳೊಂದಿಗೆ RBAC
- [ ] ಸಾರ್ವಜನಿಕ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳ ಮೇಲೆ WAF ಸಕ್ರಿಯವಾಗಿದೆ

### ಕಾರ್ಯಕ್ಷಮತೆ ✅
- [ ] ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಸಂರಚಿಸಲಾಗಿದೆ
- [ ] ಕ್ಯಾಶಿಂಗ್ ಅನ್ವಯಿಸಲಾಗಿದೆ
- [ ] ಲೋಡ್ ಸಮತೋಲನ ಸ್ಥಾಪಿಸಲಾಗಿದೆ
- [ ] ಸ್ಟ್ಯಾಟಿಕ್ ವಿಷಯಕ್ಕಾಗಿ CDN
- [ ] ಡೇಟಾಬೇಸ್ ಕನೆಕ್ಷನ್ ಪೂಲಿಂಗ್
- [ ] ಟೋಕನ್ ಬಳಕೆಯ ಉತ್ಕೃಷ್ಟೀಕರಣ

### ಮೇಲ್ವಿಚಾರಣೆ ✅
- [ ] Application Insights ಸಂರಚಿಸಲಾಗಿದೆ
- [ ] ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್‌ಗಳು ನಿರ್ಧರಿಸಲಾಗಿದೆ
- [ ] ಎಚ್ಚರಿಕೆ ನಿಯಮಗಳು ಸ್ಥಾಪಿಸಲಾಗಿದೆ
- [ ] ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ರಚಿಸಲಾಗಿದೆ
- [ ] ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳು ಅನುಷ್ಠಾನಗೊಳ್ಳಿವೆ
- [ ] ಲಾಗ್ ಸಂರಕ್ಷಣೆ ನೀತಿಗಳು

### ನಂಬಿಕೆ(sender) ✅
- [ ] ಬಹು-ಪ್ರಾಂತ್ಯ ನಿಯೋಜನೆ
- [ ] ಬ್ಯಾಕಪ್ ಮತ್ತು ಪುನರುದ್ಧಾರ ಯೋಜನೆ
- [ ] ಸರ್ಕ್ಯೂಟ್ ಬ್ರೇಕರ್‌ಗಳು ಅನುಷ್ಠಾನಗೊಳ್ಳಿವೆ
- [ ] ಮರುಪ್ರಯತ್ನ ನೀತಿಗಳು ಸಂರಚಿಸಲಾಗಿದೆ
- [ ] ಸೌಮ್ಯ ಕುಗ್ಗುವಿಕೆ
- [ ] ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು

### ఖರ್ಚు ನಿರ್ವಹಣೆ ✅
- [ ] ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳು ಸಂರಚಿಸಲಾಗಿದೆ
- [ ] ಸಂಪನ್ಮೂಲಗಳ ಸಮರ್ಪಕ ಗಾತ್ರ ನಿರ್ಧಾರ
- [ ] Dev/test ರಿಯಾಯಿತಿಗಳು ಅನ್ವಯಿಸಲಾಗಿದೆ
- [ ] ರಿಸರ್ವಡ್ ಇನ್ಸ್ಟಾನ್ಸ್‌ಗಳನ್ನು ಖರೀದಿಸಲಾಗಿದೆ
- [ ] ಖರ್ಚು ಮೇಲ್ವಿಚಾರಣಾ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್
- [ ] ನಿಯಮಿತ ಖರ್ಚು ಪರಿಷೀಲನೆಗಳು

### ಅನುಸಾರಣೆ ✅
- [ ] ಡೇಟಾ ಸ್ಥಳೀಯತೆ ಅವಶ್ಯಕತೆಗಳು ಪೂರೈಸಲ್ಪಟ್ಟಿವೆ
- [ ] ಆಡಿಟ್ ಲಾಗಿಂಗ್ ಸಕ್ರಿಯವಾಗಿದೆ
- [ ] ಅನುಸಾರ ನೀತಿಗಳು ಅನ್ವಯಿಸಲಾಗಿದೆ
- [ ] ಸುರಕ್ಷತಾ ಬೇಸ್‌ಲೈನ್‌ಗಳು ಅನುಷ್ಠಾನಗೊಳ್ಳಿವೆ
- [ ] ನಿಯಮಿತ ಸುರಕ್ಷತಾ ಮೌಲ್ಯಮಾಪನಗಳು
- [ ] ಘಟನೆ ಪ್ರತಿಕ್ರಿಯೆ ಯೋಜನೆ

## ಕಾರ್ಯಕ್ಷಮತಾ ಮೀಸಲುಗುಳು

### ಸಾಮಾನ್ಯ ಉತ್ಪಾದನಾ ಮೆಟ್ರಿಕ್‌ಗಳು

| Metric | Target | Monitoring |
|--------|--------|------------|
| **ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯ** | < 2 ಸೆಕೆಂಡುಗಳು | Application Insights |
| **ಲಭ್ಯತೆ** | 99.9% | ಅಪ್ಟೈಮ್ ಮೇಲ್ವಿಚಾರಣೆ |
| **ದೋಷದ ಪ್ರಮಾಣ** | < 0.1% | ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್ಗಳು |
| **ಟೋಕನ್ ಬಳಕೆ** | < $500/ತಿಂಗಳು | ಖರ್ಚು ನಿರ್ವಹಣೆ |
| **ಸಮಕಾಲೀನ ಬಳಕೆದಾರರು** | 1000+ | ಲೋಡ್ ಟೆಸ್ಟಿಂಗ್ |
| **ಪುನರುದ್ಧಾರ ಸಮಯ** | < 1 ಘಂಟೆ | ಅಪಘಾತ ಪುನರುದ್ಧಾರ ಪರೀಕ್ಷೆಗಳು |

### ಲೋಡ್ ಟೆಸ್ಟಿಂಗ್

```bash
# кೃತಕ ಬುದ್ಧಿಮತ್ತೆ ಅನ್ವಯಿಕೆಗಳಿಗಾಗಿ ಲೋಡ್ ಪರೀಕ್ಷಾ ಸ್ಕ್ರಿಪ್ಟ್
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 ಸಮುದಾಯದ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

Microsoft Foundry Discord ಸಮುದಾಯದ ಅಭಿಪ್ರಾಯದ ಆಧಾರದ ಮೇಲೆ:

### ಸಮುದಾಯದಿಂದ 나온 ಪ್ರಮುಖ ಶಿಫಾರಸುಗಳು:

1. **ಸಣ್ಣದರಿಂದ ಪ್ರಾರಂಭಿಸಿ, ಕ್ರಮವಾಗಿ ವಿಸ್ತರಿಸಿ**: ಮೂಲಭೂತ SKUಗಳಿಂದ ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು ವಾಸ್ತವಿಕ ಬಳಕೆಯ ಆಧಾರದ ಮೇಲೆ ಸ್ಕೇಲ್ ಮಾಡಿ
2. **ಎಲ್ಲವನ್ನೂ ಮಾನಿಟರ್ ಮಾಡಿ**: ಮೊದಲಿನಿಂದಲೇ ವಿಸ್ತೃತ ಮೇಲ್ವಿಚಾರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
3. **ಸುರಕ್ಷತೆಯನ್ನು ಸ್ವಯಂಕ್ರಮಗೊಳಿಸಿ**: ಸತತ ಸುರಕ್ಷತಿಗಾಗಿ Infrastructure as Code ಬಳಸಿ
4. **ಸಾವಧಾನವಾಗಿ ಪರೀಕ್ಷಿಸಿ**: ನಿಮ್ಮ ಪೈಪ್‌ಲೈನಿನಲ್ಲಿ AI-ನಿರ್ದಿಷ್ಟ ಪರೀಕ್ಷೆಗಳನ್ನು ಸೇರಿಸಿ
5. **ಖರ್ಚಿಗಾಗಿ ಯೋಜಿಸಿ**: ಟೋಕನ್ ಬಳಕೆಯನ್ನು ಮಾನಿಟರ್ ಮಾಡಿ ಮತ್ತು ಬೇಗನೆ ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸ್ಥಾಪಿಸಿ

### ತಪ್ಪಿಸಿಕೊಳ್ಳಬೇಕಾದ ಸಾಮಾನ್ಯ ಭುಲ್‌ಗಳು:

- ❌ ಕೋಡ್‌ನಲ್ಲಿ API ಕೀಲಿಗಳನ್ನು ಹಾರ್ಡ್‌ಕೋಡ್ ಮಾಡುವುದು
- ❌ ಯೋಗ್ಯ ಮಾನಿಟರಿಂಗ್ ಸ್ಥಾಪಿಸದಿರುವುದು
- ❌ ಖರ್ಚು ಉತ್ಕೃಷ್ಟೀಕರಣವನ್ನು ನಿರ್ಲಕ್ಷಿಸುಧುದು
- ❌ ವಿಫಲತಾ ಘಟನೆಗಳನ್ನು ಪರೀಕ್ಷಿಸದಿರುವುದು
- ❌ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳಿಲ್ಲದೆ ನಿಯೋಜಿಸುವುದು

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

- **Azure ಚೆನ್ನಾಗಿ ರಚಿಸಲಾದ ಫ್ರೇಮ್ವರ್ಕ್**: [AI ಕಾರ್ಯಭಾರ ಮಾರ್ಗದರ್ಶನ](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry ಡಾಕ್ಯುಮೆಂಟೇಶನ್**: [ಅಧಿಕೃತ ಡಾಕ್ಸ್](https://learn.microsoft.com/azure/ai-studio/)
- **ಸಮುದಾಯ ಟೆಂಪ್ಲೇಟ್ಗಳು**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord ಸಮುದಾಯ**: [#Azure ಚಾನೆಲ್](https://discord.gg/microsoft-azure)

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ ಇನ್ನೂ ಸಂಬಂಧಿತ**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎆 ಕೋರ್ಸ್ ಪೂರ್ಣಗೊಂಡಿದೆ**: [AZD For Beginners](../../README.md)

**ಗಮನಿಸಿ**: ಉತ್ಪಾದನಾ AI ಕಾರ್ಯಭಾರಗಳಿಗೆ ಸೂಕ್ಷ್ಮ ಯೋಜನೆ, ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ನಿರಂತರ ಉತ್ಕೃಷ್ಟೀಕರಣ ಅಗತ್ಯವಿದೆ. ಈ ಮಾದರಿಗಳಿಂದ ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು ನಿಮ್ಮ ನಿರ್ದಿಷ್ಟ ಅಗತ್ಯಗಳಿಗೆ ಅವುಗಳನ್ನು ಹೊಂದಿಸಿ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಅಸ್ವೀಕಾರ:
ಈ ದಾಖಲೆ AI ಅನುವಾದ ಸೇವೆ [Co-op Translator] (https://github.com/Azure/co-op-translator) ಬಳಸಿಕೊಂಡು ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ಸತ್ಯತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ ಸಹ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಮರ್ಪಕತೆಗಳು ಇರಬಹುದು ಎಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಾಖಲೆನ್ನು ಅಧಿಕೃತ ಮೂಲವಾಗಿ ಪರಿಗಣಿಸಬೇಕು. ನಿರ್ಣಾಯಕ/ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿಕೆ ಅಥವಾ ದುಃವ್ಯಾಖ್ಯಾನಗಳಿಗಾಗಿ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->