<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "db39cf7acc134578c846d7accd6bb04d",
  "translation_date": "2025-09-12T19:34:11+00:00",
  "source_file": "docs/ai-foundry/production-ai-practices.md",
  "language_code": "pa"
}
-->
# AZD ਨਾਲ ਪ੍ਰੋਡਕਸ਼ਨ AI ਵਰਕਲੋਡ ਲਈ ਵਧੀਆ ਤਰੀਕੇ

**ਪਿਛਲਾ:** [AI ਵਰਕਸ਼ਾਪ ਲੈਬ](ai-workshop-lab.md) | **ਅਗਲਾ:** [AI ਟਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ](../troubleshooting/ai-troubleshooting.md)

## ਝਲਕ

ਇਹ ਗਾਈਡ Azure Developer CLI (AZD) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਵਰਕਲੋਡ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਵਧੀਆ ਤਰੀਕਿਆਂ ਦੀ ਵਿਸਤ੍ਰਿਤ ਜਾਣਕਾਰੀ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ। ਇਹ ਤਰੀਕੇ Azure AI Foundry Discord ਕਮਿਊਨਿਟੀ ਅਤੇ ਹਕੀਕਤੀ-ਜੀਵਨ ਗਾਹਕ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪ੍ਰਾਪਤ ਫੀਡਬੈਕ 'ਤੇ ਆਧਾਰਿਤ ਹਨ, ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ AI ਸਿਸਟਮਾਂ ਵਿੱਚ ਆਮ ਚੁਣੌਤੀਆਂ ਨੂੰ ਹੱਲ ਕਰਦੇ ਹਨ।

## ਮੁੱਖ ਚੁਣੌਤੀਆਂ

ਸਾਡੇ ਕਮਿਊਨਿਟੀ ਪੋਲ ਦੇ ਨਤੀਜਿਆਂ ਦੇ ਆਧਾਰ 'ਤੇ, ਇਹ ਮੁੱਖ ਚੁਣੌਤੀਆਂ ਹਨ ਜਿਨ੍ਹਾਂ ਦਾ ਡਿਵੈਲਪਰ ਸਾਹਮਣਾ ਕਰਦੇ ਹਨ:

- **45%** ਨੂੰ ਮਲਟੀ-ਸਰਵਿਸ AI ਡਿਪਲੌਇਮੈਂਟ ਵਿੱਚ ਮੁਸ਼ਕਲਾਂ ਆਉਂਦੀਆਂ ਹਨ  
- **38%** ਨੂੰ ਕ੍ਰਿਡੈਂਸ਼ਲ ਅਤੇ ਸਿਕ੍ਰੇਟ ਮੈਨੇਜਮੈਂਟ ਵਿੱਚ ਸਮੱਸਿਆਵਾਂ ਹਨ  
- **35%** ਨੂੰ ਪ੍ਰੋਡਕਸ਼ਨ ਤਿਆਰੀ ਅਤੇ ਸਕੇਲਿੰਗ ਮੁਸ਼ਕਲ ਲੱਗਦੀ ਹੈ  
- **32%** ਨੂੰ ਲਾਗਤ ਨੂੰ ਵਧੀਆ ਬਣਾਉਣ ਦੀਆਂ ਰਣਨੀਤੀਆਂ ਦੀ ਲੋੜ ਹੈ  
- **29%** ਨੂੰ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਟਰਬਲਸ਼ੂਟਿੰਗ ਵਿੱਚ ਸੁਧਾਰ ਦੀ ਲੋੜ ਹੈ  

## ਪ੍ਰੋਡਕਸ਼ਨ AI ਲਈ ਆਰਕੀਟੈਕਚਰ ਪੈਟਰਨ

### ਪੈਟਰਨ 1: ਮਾਈਕ੍ਰੋਸਰਵਿਸ AI ਆਰਕੀਟੈਕਚਰ

**ਕਦੋਂ ਵਰਤਣਾ ਹੈ**: ਜਟਿਲ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ ਜਿਨ੍ਹਾਂ ਵਿੱਚ ਕਈ ਸਮਰੱਥਾਵਾਂ ਹਨ

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

**AZD ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ**:

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

### ਪੈਟਰਨ 2: ਇਵੈਂਟ-ਡ੍ਰਿਵਨ AI ਪ੍ਰੋਸੈਸਿੰਗ

**ਕਦੋਂ ਵਰਤਣਾ ਹੈ**: ਬੈਚ ਪ੍ਰੋਸੈਸਿੰਗ, ਦਸਤਾਵੇਜ਼ ਵਿਸ਼ਲੇਸ਼ਣ, ਐਸਿੰਕ ਵਰਕਫਲੋਜ਼

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

## ਸੁਰੱਖਿਆ ਲਈ ਵਧੀਆ ਤਰੀਕੇ

### 1. ਜ਼ੀਰੋ-ਟ੍ਰਸਟ ਸੁਰੱਖਿਆ ਮਾਡਲ

**ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ ਰਣਨੀਤੀ**:
- ਪ੍ਰਮਾਣਿਕਤਾ ਤੋਂ ਬਿਨਾਂ ਕੋਈ ਸਰਵਿਸ-ਟੂ-ਸਰਵਿਸ ਸੰਚਾਰ ਨਹੀਂ  
- ਸਾਰੇ API ਕਾਲ ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀਜ਼ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਨ  
- ਪ੍ਰਾਈਵੇਟ ਐਂਡਪੌਇੰਟਸ ਨਾਲ ਨੈਟਵਰਕ ਆਈਸੋਲੇਸ਼ਨ  
- ਘੱਟ ਤੋਂ ਘੱਟ ਅਧਿਕਾਰਾਂ ਵਾਲੇ ਪਹੁੰਚ ਨਿਯੰਤਰਣ  

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

### 2. ਸੁਰੱਖਿਅਤ ਸਿਕ੍ਰੇਟ ਮੈਨੇਜਮੈਂਟ

**ਕੀ ਵੌਲਟ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨ**:

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

### 3. ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ

**ਪ੍ਰਾਈਵੇਟ ਐਂਡਪੌਇੰਟ ਕਨਫਿਗਰੇਸ਼ਨ**:

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

## ਪ੍ਰਦਰਸ਼ਨ ਅਤੇ ਸਕੇਲਿੰਗ

### 1. ਆਟੋ-ਸਕੇਲਿੰਗ ਰਣਨੀਤੀਆਂ

**ਕੰਟੇਨਰ ਐਪਸ ਆਟੋ-ਸਕੇਲਿੰਗ**:

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

### 2. ਕੈਸ਼ਿੰਗ ਰਣਨੀਤੀਆਂ

**Redis Cache ਲਈ AI ਜਵਾਬ**:

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

### 3. ਲੋਡ ਬੈਲੈਂਸਿੰਗ ਅਤੇ ਟ੍ਰੈਫਿਕ ਮੈਨੇਜਮੈਂਟ

**WAF ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਗੇਟਵੇ**:

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

## 💰 ਲਾਗਤ ਨੂੰ ਵਧੀਆ ਬਣਾਉਣਾ

### 1. ਰਿਸੋਰਸ ਰਾਈਟ-ਸਾਈਜ਼ਿੰਗ

**ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਕਨਫਿਗਰੇਸ਼ਨ**:

```bash
# Development environment
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Production environment  
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. ਲਾਗਤ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਬਜਟ

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

### 3. ਟੋਕਨ ਵਰਤੋਂ ਨੂੰ ਵਧੀਆ ਬਣਾਉਣਾ

**OpenAI ਲਾਗਤ ਮੈਨੇਜਮੈਂਟ**:

```typescript
// Application-level token optimization
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Truncate context, not user input
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Rough estimation: 1 token ≈ 4 characters
    return Math.ceil(text.length / 4);
  }
}
```

## ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਮਾਨਤਾ

### 1. ਵਿਸਤ੍ਰਿਤ ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ

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

### 2. AI-ਵਿਸ਼ੇਸ਼ ਮਾਨੀਟਰਿੰਗ

**AI ਮੈਟ੍ਰਿਕਸ ਲਈ ਕਸਟਮ ਡੈਸ਼ਬੋਰਡ**:

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

### 3. ਹੈਲਥ ਚੈਕਸ ਅਤੇ ਅਪਟਾਈਮ ਮਾਨੀਟਰਿੰਗ

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

## ਡਿਜਾਸਟਰ ਰਿਕਵਰੀ ਅਤੇ ਹਾਈ ਐਵੇਲਬਿਲਿਟੀ

### 1. ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ

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

### 2. ਡੇਟਾ ਬੈਕਅਪ ਅਤੇ ਰਿਕਵਰੀ

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

## DevOps ਅਤੇ CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### 1. GitHub Actions ਵਰਕਫਲੋ

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

### 2. ਇੰਫਰਾਸਟਰਕਚਰ ਵੈਲਿਡੇਸ਼ਨ

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Check if all required services are running
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Validate OpenAI model deployments
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# Test AI service connectivity
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## ਪ੍ਰੋਡਕਸ਼ਨ ਤਿਆਰੀ ਚੈੱਕਲਿਸਟ

### ਸੁਰੱਖਿਆ ✅
- [ ] ਸਾਰੇ ਸਰਵਿਸ ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀਜ਼ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਨ  
- [ ] ਸਿਕ੍ਰੇਟ ਕੀ ਵੌਲਟ ਵਿੱਚ ਸਟੋਰ ਕੀਤੇ ਗਏ ਹਨ  
- [ ] ਪ੍ਰਾਈਵੇਟ ਐਂਡਪੌਇੰਟਸ ਕਨਫਿਗਰ ਕੀਤੇ ਗਏ ਹਨ  
- [ ] ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ ਸਮੂਹ ਲਾਗੂ ਕੀਤੇ ਗਏ ਹਨ  
- [ ] ਘੱਟ ਤੋਂ ਘੱਟ ਅਧਿਕਾਰਾਂ ਨਾਲ RBAC  
- [ ] ਪਬਲਿਕ ਐਂਡਪੌਇੰਟਸ 'ਤੇ WAF ਐਨੇਬਲ ਕੀਤਾ ਗਿਆ ਹੈ  

### ਪ੍ਰਦਰਸ਼ਨ ✅
- [ ] ਆਟੋ-ਸਕੇਲਿੰਗ ਕਨਫਿਗਰ ਕੀਤੀ ਗਈ ਹੈ  
- [ ] ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕੀਤੀ ਗਈ ਹੈ  
- [ ] ਲੋਡ ਬੈਲੈਂਸਿੰਗ ਸੈਟਅਪ ਕੀਤਾ ਗਿਆ ਹੈ  
- [ ] ਸਟੈਟਿਕ ਸਮੱਗਰੀ ਲਈ CDN  
- [ ] ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਪੂਲਿੰਗ  
- [ ] ਟੋਕਨ ਵਰਤੋਂ ਨੂੰ ਵਧੀਆ ਬਣਾਉਣਾ  

### ਮਾਨੀਟਰਿੰਗ ✅
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਕਨਫਿਗਰ ਕੀਤੇ ਗਏ ਹਨ  
- [ ] ਕਸਟਮ ਮੈਟ੍ਰਿਕਸ ਪਰिभਾਸ਼ਿਤ ਕੀਤੇ ਗਏ ਹਨ  
- [ ] ਅਲਰਟਿੰਗ ਰੂਲ ਸੈਟਅਪ ਕੀਤੇ ਗਏ ਹਨ  
- [ ] ਡੈਸ਼ਬੋਰਡ ਬਣਾਇਆ ਗਿਆ ਹੈ  
- [ ] ਹੈਲਥ ਚੈਕਸ ਲਾਗੂ ਕੀਤੇ ਗਏ ਹਨ  
- [ ] ਲੌਗ ਰਿਟੈਂਸ਼ਨ ਨੀਤੀਆਂ  

### ਭਰੋਸੇਮੰਦ ✅
- [ ] ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ  
- [ ] ਬੈਕਅਪ ਅਤੇ ਰਿਕਵਰੀ ਯੋਜਨਾ  
- [ ] ਸਰਕਿਟ ਬ੍ਰੇਕਰ ਲਾਗੂ ਕੀਤੇ ਗਏ ਹਨ  
- [ ] ਰੀਟ੍ਰਾਈ ਨੀਤੀਆਂ ਕਨਫਿਗਰ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ  
- [ ] ਗ੍ਰੇਸਫੁਲ ਡਿਗਰੇਡੇਸ਼ਨ  
- [ ] ਹੈਲਥ ਚੈਕ ਐਂਡਪੌਇੰਟਸ  

### ਲਾਗਤ ਪ੍ਰਬੰਧਨ ✅
- [ ] ਬਜਟ ਅਲਰਟਸ ਕਨਫਿਗਰ ਕੀਤੇ ਗਏ ਹਨ  
- [ ] ਰਿਸੋਰਸ ਰਾਈਟ-ਸਾਈਜ਼ਿੰਗ  
- [ ] ਡੈਵ/ਟੈਸਟ ਛੂਟ ਲਾਗੂ ਕੀਤੀ ਗਈ ਹੈ  
- [ ] ਰਿਜ਼ਰਵਡ ਇੰਸਟੈਂਸ ਖਰੀਦੇ ਗਏ ਹਨ  
- [ ] ਲਾਗਤ ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ  
- [ ] ਨਿਯਮਿਤ ਲਾਗਤ ਸਮੀਖਾ  

### ਅਨੁਕੂਲਤਾ ✅
- [ ] ਡੇਟਾ ਰਿਹਾਇਸ਼ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਪੂਰੀਆਂ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ  
- [ ] ਆਡਿਟ ਲੌਗਿੰਗ ਐਨੇਬਲ ਕੀਤੀ ਗਈ ਹੈ  
- [ ] ਅਨੁਕੂਲਤਾ ਨੀਤੀਆਂ ਲਾਗੂ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ  
- [ ] ਸੁਰੱਖਿਆ ਬੇਸਲਾਈਨ ਲਾਗੂ ਕੀਤੇ ਗਏ ਹਨ  
- [ ] ਨਿਯਮਿਤ ਸੁਰੱਖਿਆ ਮੁਲਾਂਕਣ  
- [ ] ਘਟਨਾ ਪ੍ਰਤੀਕਰਿਆ ਯੋਜਨਾ  

## ਪ੍ਰਦਰਸ਼ਨ ਬੈਂਚਮਾਰਕ

### ਆਮ ਪ੍ਰੋਡਕਸ਼ਨ ਮੈਟ੍ਰਿਕਸ

| ਮੈਟ੍ਰਿਕ | ਟਾਰਗਟ | ਮਾਨੀਟਰਿੰਗ |
|--------|--------|------------|
| **ਜਵਾਬ ਸਮਾਂ** | < 2 ਸਕਿੰਟ | ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ |
| **ਉਪਲਬਧਤਾ** | 99.9% | ਅਪਟਾਈਮ ਮਾਨੀਟਰਿੰਗ |
| **ਗਲਤੀ ਦਰ** | < 0.1% | ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ |
| **ਟੋਕਨ ਵਰਤੋਂ** | < $500/ਮਹੀਨਾ | ਲਾਗਤ ਪ੍ਰਬੰਧਨ |
| **ਸਮਕਾਲੀ ਉਪਭੋਗਤਾ** | 1000+ | ਲੋਡ ਟੈਸਟਿੰਗ |
| **ਰਿਕਵਰੀ ਸਮਾਂ** | < 1 ਘੰਟਾ | ਡਿਜਾਸਟਰ ਰਿਕਵਰੀ ਟੈਸਟ |

### ਲੋਡ ਟੈਸਟਿੰਗ

```bash
# Load testing script for AI applications
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 ਕਮਿਊਨਿਟੀ ਵਧੀਆ ਤਰੀਕੇ

Azure AI Foundry Discord ਕਮਿਊਨਿਟੀ ਦੇ ਫੀਡਬੈਕ ਦੇ ਆਧਾਰ 'ਤੇ:

### ਕਮਿਊਨਿਟੀ ਤੋਂ ਸਿਖਰ ਸਿਫਾਰਸ਼ਾਂ:

1. **ਛੋਟੇ ਪੱਧਰ 'ਤੇ ਸ਼ੁਰੂ ਕਰੋ, ਹੌਲੀ-ਹੌਲੀ ਸਕੇਲ ਕਰੋ**: ਬੁਨਿਆਦੀ SKUs ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਅਸਲ ਵਰਤੋਂ ਦੇ ਆਧਾਰ 'ਤੇ ਸਕੇਲ ਕਰੋ  
2. **ਸਭ ਕੁਝ ਮਾਨੀਟਰ ਕਰੋ**: ਪਹਿਲੇ ਦਿਨ ਤੋਂ ਵਿਸਤ੍ਰਿਤ ਮਾਨੀਟਰਿੰਗ ਸੈਟਅਪ ਕਰੋ  
3. **ਸੁਰੱਖਿਆ ਨੂੰ ਆਟੋਮੈਟ ਕਰੋ**: ਸੁਰੱਖਿਆ ਲਈ ਇੰਫਰਾਸਟਰਕਚਰ ਕੋਡ ਵਜੋਂ ਵਰਤੋ  
4. **ਥੋੜੀ-ਥੋੜੀ ਟੈਸਟਿੰਗ ਕਰੋ**: ਆਪਣੇ ਪਾਈਪਲਾਈਨ ਵਿੱਚ AI-ਵਿਸ਼ੇਸ਼ ਟੈਸਟਿੰਗ ਸ਼ਾਮਲ ਕਰੋ  
5. **ਲਾਗਤ ਦੀ ਯੋਜਨਾ ਬਣਾਓ**: ਟੋਕਨ ਵਰਤੋਂ ਦੀ ਮਾਨੀਟਰਿੰਗ ਕਰੋ ਅਤੇ ਬਜਟ ਅਲਰਟਸ ਜਲਦੀ ਸੈਟਅਪ ਕਰੋ  

### ਆਮ ਗਲਤੀਆਂ ਜਿਨ੍ਹਾਂ ਤੋਂ ਬਚਣਾ ਹੈ:

- ❌ ਕੋਡ ਵਿੱਚ API ਕੁੰਜੀਆਂ ਨੂੰ ਹਾਰਡਕੋਡ ਕਰਨਾ  
- ❌ ਸਹੀ ਮਾਨੀਟਰਿੰਗ ਸੈਟਅਪ ਨਾ ਕਰਨਾ  
- ❌ ਲਾਗਤ ਨੂੰ ਵਧੀਆ ਬਣਾਉਣ ਨੂੰ ਨਜ਼ਰਅੰਦਾਜ਼ ਕਰਨਾ  
- ❌ ਫੇਲ੍ਹ ਹੋਣ ਵਾਲੇ ਦ੍ਰਿਸ਼ਾਂ ਦੀ ਟੈਸਟਿੰਗ ਨਾ ਕਰਨਾ  
- ❌ ਹੈਲਥ ਚੈਕਸ ਤੋਂ ਬਿਨਾਂ ਡਿਪਲੌਇਮੈਂਟ  

## ਵਾਧੂ ਸਰੋਤ

- **Azure ਵੈਲ-ਆਰਕੀਟੈਕਟਡ ਫਰੇਮਵਰਕ**: [AI ਵਰਕਲੋਡ ਗਾਈਡ](https://learn.microsoft.com/azure/well-architected/ai/)  
- **Azure AI Foundry ਦਸਤਾਵੇਜ਼**: [ਅਧਿਕਾਰਤ ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/ai-studio/)  
- **ਕਮਿਊਨਿਟੀ ਟੈਂਪਲੇਟਸ**: [Azure ਨਮੂਨੇ](https://github.com/Azure-Samples)  
- **Discord ਕਮਿਊਨਿਟੀ**: [#Azure ਚੈਨਲ](https://discord.gg/microsoft-azure)  

---

**ਪਿਛਲਾ:** [AI ਵਰਕਸ਼ਾਪ ਲੈਬ](ai-workshop-lab.md) | **ਅਗਲਾ:** [AI ਟਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ](../troubleshooting/ai-troubleshooting.md)

**ਯਾਦ ਰੱਖੋ**: ਪ੍ਰੋਡਕਸ਼ਨ AI ਵਰਕਲੋਡ ਲਈ ਧਿਆਨਪੂਰਵਕ ਯੋਜਨਾ, ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲਗਾਤਾਰ ਵਧੀਆ ਬਣਾਉਣ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ। ਇਨ੍ਹਾਂ ਪੈਟਰਨਾਂ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਆਪਣੇ ਵਿਸ਼ੇਸ਼ ਜ਼ਰੂਰਤਾਂ ਅਨੁਸਾਰ ਅਨੁਕੂਲਿਤ ਕਰੋ।

---

**ਅਸਵੀਕਾਰਨਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਹਾਲਾਂਕਿ ਅਸੀਂ ਸਹੀਅਤਾ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚੀਤਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।