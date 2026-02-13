# Production AI Workload Best Practices with AZD

**Chapter Navigation:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD အစပြုသူများအတွက်](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 8 - ထုတ်လုပ်ရေးနှင့် စီးပွားရေး ပုံစံများ
- **⬅️ ယခင် အခန်း**: [အခန်း 7: ပြဿနာဖြေရှင်းခြင်း](../chapter-07-troubleshooting/debugging.md)
- **⬅️ အခြား ဆက်စပ်**: [AI အလုပ်ရုံ လက်တွေ့ စမ်းသပ်ခန်း](ai-workshop-lab.md)
- **🎯 သင်တန်း ပြီးစီး**: [AZD အစပြုသူများအတွက်](../../README.md)

## အကျဉ်းချုပ်

ဤလမ်းညွန်သည် Azure Developer CLI (AZD) ကိုအသုံးပြုပြီး ထုတ်လုပ်ရေးအဆင့် အသင့်ဖြစ်သော AI အလုပ်များကို တင်သွင်းရာ၌ အကောင်းဆုံးလေ့ကျင့်မှုများကို တကယ်တမ်းဖော်ပြသည်။ Microsoft Foundry Discord လူမှုစု၏ တုံ့ပြန်ချက်များနှင့် ဖောက်သည်များ၏ အတွေ့အကြုံများ အပေါ် မူတည်ကာ၊ ထုတ်လုပ်ရေး AI စနစ်များတွင် အကြုံကြုံတွေ့ရသော အဓိက အခက်အခဲများကို ဒီလမ်းစဉ်များဖြင့် ဖြေရှင်းပေးသည်။

## ဖြေရှင်းထားသော အဓိက စိန်ခေါ်မှုများ

ကျွန်တော်တို့အသိုင်းအဝိုင်း မဲပေးမှုရလဒ်များအရ၊ ဖန်တီးသူတွေကြုံရသော ထိပ်ဆုံး စိန်ခေါ်မှုများမှာ အောက်ပါအတိုင်းဖြစ်သည်။

- **45%** သည် multi-service AI deployments တွင် စိန်ခေါ်မှုရှိ
- **38%** သည် credential နှင့် secret စီမံခန့်ခွဲမှုနှင့်ပတ်သက်၍ ပြဿနာ ရှိ
- **35%** သည် ထုတ်လုပ်ရေး အသင့်ဖြစ်မှုနှင့် scaling အခက်အခဲ ရှိ
- **32%** သည် ကုန်ကျစရိတ် အကောင်းမြှင့်တင်မှု များအတွက် လိုအပ်ချက်ရှိ
- **29%** သည် monitoring နှင့် troubleshooting ကို ပိုမိုကောင်းမွန်စေရန် လိုအပ်

## ထုတ်လုပ်ရေး AI အတွက် ဖွဲ့စည်းပုံ နမူနာများ

### ပုံစံ 1: မိုက်ခရိုဆာဗ်စ် AI ဖွဲ့စည်းပုံ

**ဘယ်အချိန်တွင် အသုံးပြုရမည်**: အမျိုးမျိုးသော အင်အားများပါသော စုံလင်သော AI အက်ပလီကေးရှင်းများ

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

**AZD အကောင်အထည်ဖော်ခြင်း**:

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

### ပုံစံ 2: ဖြစ်ရပ် အခြေခံ AI အလုပ်စဉ်

**ဘယ်အချိန်တွင် အသုံးပြုရမည်**: အစုလိုက် (batch) အလုပ်များ၊ စာရွက်စာတမ်း ခွဲခြမ်းစိတ်ဖြာခြင်း၊ အသင့်တော်မဲ့ အလုပ်စဉ်များ (async workflows)

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

## လံုခြုံရေး အကောင်းဆုံး လေ့ကျင့်မှုများ

### 1. Zero-Trust လုံခြုံရေး မော်ဒယ်

**အကောင်အထည်ဖော်နည်းဗျူဟာ**:
- authentication မရှိပဲ service-to-service ဆက်သွယ်မှု မရှိစေရန်
- API ခေါ်ဆိုမှုအားလုံး managed identities အသုံးပြုခြင်း
- private endpoints ဖြင့် network သီးခြားခြင်း
- အနည်းဆုံး ခွင့်ပြုချက် (least privilege) အဆင့်များ အကောင်အထည်ဖော်ခြင်း

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

### 2. လျှို့ဝှက် စီမံခန့်ခွဲမှု ဘေးကင်းရေး

**Key Vault ပေါင်းစည်းမှု ပုံစံ**:

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

### 3. ကွန်ရက် လုံခြုံရေး

**Private Endpoint ဖော်ပြမှု**:

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

## လုပ်ဆောင်ရည်နှင့် ကြီးထွားရေး

### 1. အလိုအလျောက် ကြီးပွားအဆင့် မြှင့်ပေးရန် မဟာဗျူဟာများ

**Container Apps အလိုအလျောက် စီမံခြင်း**:

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

### 2. ကက်ရှ် မဟာဗျူဟာများ

**AI တုံ့ပြန်ချက်များအတွက် Redis Cache**:

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

### 3. လွှဲချိန်နှင့် ရှယ်ယာ စီမံခန့်ခွဲမှု

**WAF ပါဝင်သည့် Application Gateway**:

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

## 💰 ကုန်ကျစရိတ် အကောင်းမြှင့်တင်ခြင်း

### 1. ရင်းမြစ်များကို သင့်တော်သော အရွယ်အစား ခွဲခြားခြင်း

**ပတ်ဝန်းကျင် အလိုက် ဆောက်တည်ချက်များ**:

```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# ထုတ်လုပ်ရေး ပတ်ဝန်းကျင်
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. ကုန်ကျစရိတ် ကြီးကြပ်စောင့်ကြည့်မှုနှင့် ဘတ်ဂျက်များ

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

### 3. Token အသုံးပြုမှု အထိရောက်ဆုံး စီမံခြင်း

**OpenAI ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု**:

```typescript
// အပလီကေးရှင်းအဆင့် တိုကင် စီမံပြုပြင်ခြင်း
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // ပတ်ဝန်းကျင်ကို ဖြတ်တောက်ပါ၊ အသုံးပြုသူ၏ ထည့်သွင်းချက်ကို မဖြတ်ပစ်ပါ။
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // ခန့်မှန်းချက်: 1 တိုကင် ≈ 4 စာလုံး
    return Math.ceil(text.length / 4);
  }
}
```

## ကြီးကြပ်စောင့်ကြည့်မှုနှင့် တွေ့ရှိနိုင်မှု

### 1. စုံလင်သော Application Insights

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

### 2. AI အထူး ကြီးကြပ်စောင့်ကြည့်မှု

**AI မက်ထရစ်များအတွက် အထူးပြု Dashboard များ**:

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

### 3. ကျန်းမာရေး စစ်ဆေးခြင်းနှင့် Uptime ကြီးကြပ်မှု

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

## ဘေးအန္တရာယ် ပြန်လည်ကာကွယ်ရေးနှင့် အမြင့်ရရှိနိုင်မှု

### 1. အရပ်ရပ်တွင် တင်သွင်းခြင်း

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

### 2. ဒေတာ မိတ္တူယူခြင်းနှင့် ပြန်လည်ရယူခြင်း

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

## DevOps နှင့် CI/CD ပေါင်းစည်းခြင်း

### 1. GitHub Actions အလုပ်စဉ်

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

### 2. အင်ဖရာစထက်ချာ အတည်ပြုခြင်း

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# လိုအပ်သော ဝန်ဆောင်မှုများအားလုံး လည်ပတ်နေခြင်းကို စစ်ဆေးပါ
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI မော်ဒယ် တပ်ဆင်မှုများကို အတည်ပြုပါ
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI ဝန်ဆောင်မှုများ၏ ချိတ်ဆက်နိုင်မှုကို စမ်းသပ်ပါ
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## ထုတ်လုပ်ရေး အဆင်သင့် စစ်ဆေးစာရင်း

### လုံခြုံရေး ✅
- [ ] ဝန်ဆောင်မှုအားလုံး managed identities အသုံးပြုထားသည်
- [ ] လျှို့ဝှက်ချက်များကို Key Vault တွင် သိမ်းဆည်းထားသည်
- [ ] Private endpoints ပြုလုပ်ထားသည်
- [ ] Network security groups ကို အကောင်အထည်ဖော်ထားသည်
- [ ] အနည်းဆုံး ခွင့်ပြုချက်ဖြင့် RBAC ထည့်သွင်းထားသည်
- [ ] ပွင့်လင်း endpoints များတွင် WAF ကို ဖွင့်ထားသည်

### လုပ်ဆောင်ရည် ✅
- [ ] အလိုအလျောက် ကြီးပွားမှု ကို စီစဉ်ထားသည်
- [ ] ကက်ရှ် ကို တပ်ဆင်ထားသည်
- [ ] လွှဲချိန် စနစ် ထည့်သွင်းထားသည်
- [ ] စတတစ် တောင်းဆက် အကြောင်းအရာများအတွက် CDN ကို အသုံးပြုထားသည်
- [ ] ဒေတာဘေ့စ် ချိတ်ဆက်မှုများအတွက် connection pooling ရှိသည်
- [ ] Token အသုံးပြုမှု အထိရောက်စေမှု ထည့်သွင်းထားသည်

### ကြီးကြပ်စောင့်ကြည့်မှု ✅
- [ ] Application Insights ကို စီစဉ်ထားသည်
- [ ] အထူး metrics များကို သတ်မှတ်ထားသည်
- [ ] Alerting rules များကို ဖော်ပြထားသည်
- [ ] Dashboard တစ်ခု ဖန်တီးထားသည်
- [ ] ကျန်းမာရေး စစ်ဆေးမှုများ ကို အကောင်အထည်ဖော်ထားသည်
- [ ] Log retention မူဝါဒများ ရှိသည်

### ယုံကြည်စိတ်ချရမှု ✅
- [ ] အရပ်ရပ်တွင် တင်သွင်းထားသည်
- [ ] မိတ္တူယူခြင်းနှင့် ပြန်လည်ရယူရေး အစီအစဉ်ရှိသည်
- [ ] Circuit breakers များ ထည့်သွင်းထားသည်
- [ ] Retry မူဝါဒများ ကို ဖော်ပြထားသည်
- [ ] အလုပ်မစွဲသော အခြေအနေတွင် အနည်းငယ် လျော့ကျမှု ရှိစေရန် ချမှတ်ထားသည်
- [ ] ကျန်းမာရေး စစ်ဆေးမှု endpoints များ ရှိသည်

### ကုန်ကျစရိတ် စီမံမှု ✅
- [ ] ဘတ်ဂျက် အကြောင်းကြားချက်များ တပ်ဆင်ထားသည်
- [ ] ရင်းမြစ်များကို သင့်တော်စွာ အရွယ်ချထားသည်
- [ ] Dev/test လျှော့စျေးများ လျှောက်ထားထားသည်
- [ ] Reserved instances ဝယ်ယူထားပြီ
- [ ] ကုန်ကျစရိတ် ကြည့်ရှုရန် Dashboard ရှိသည်
- [ ] ပုံမှန် ကုန်ကျစရိတ် ကို သုံးသပ်ဆန်းစစ်သည်

### လိုက်နာမှု ✅
- [ ] ဒေတာ နေရာထိုင်မှုပြဋ္ဌာန်းချက်များ ကို ဖြည့်ဆည်းထားသည်
- [ ] အကောင့်တင် မှတ်တမ်းများ ဖွင့်ထားသည်
- [ ] လိုက်နာမှု မူဝါဒများ အသုံးပြုထားသည်
- [ ] လုံခြုံရေး ဗေဒင်များ အကောင်အထည်ဖော်ထားသည်
- [ ] ပုံမှန် လုံခြုံရေး သုံးသပ်မှုများ ပြုလုပ်ထားသည်
- [ ] ဖြစ်ပျက်မှု တုံ့ပြန်ရေး အစီအစဉ် ရှိသည်

## လုပ်ဆောင်ရည် စမ်းသပ်မှု အချက်အလက်

### သာမာန် ထုတ်လုပ်ရေး မက်ထရစ်များ

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Response Time** | < 2 seconds | Application Insights |
| **Availability** | 99.9% | Uptime ကြီးကြပ်မှု |
| **Error Rate** | < 0.1% | Application logs |
| **Token Usage** | < $500/month | ကုန်ကျစရိတ် စီမံမှု |
| **Concurrent Users** | 1000+ | Load testing |
| **Recovery Time** | < 1 hour | ဘေးအန်တရာယ် ပြန်လည်ကာကွယ်မှု စမ်းသပ်ချက်များ |

### Load Testing

```bash
# AI အက်ပလီကေးရှင်းများအတွက် ပမာဏစမ်းသပ်ရေး စကရစ်ပ်
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 လူထု အကောင်းဆုံး လေ့ကျင့်မှုများ

Microsoft Foundry Discord လူမှုစု၏ တုံ့ပြန်ချက်များကို အခြေခံ၍ -

### လူထုထံမှ ထိပ်ဆုံး အကြံပြုချက်များ:

1. **အသေးစိတ်မှ စ၍ တဖြည်းဖြည်း တိုးချဲ့ပါ**: မူလတွင် အခြေခံ SKU များဖြင့် စတင်ပြီး အမှန်တကယ် အသုံးပြုမှုအလိုက် တိုးချဲ့ပါ
2. **အားလုံးကို ကြီးကြပ်ပါ**: ပထမနေ့ကစပြီး စုံလင်သော monitoring ကို တပ်ဆင်ပါ
3. **လုံခြုံရေးကို အလိုအလျောက်လုပ်ပါ**: လုံခြုံရေးကို တူညီသည့် ပုံစံဖြင့် ထည့်သွင်းရန် infrastructure as code ကို အသုံးပြုပါ
4. **စမ်းသပ်မှုကို ကောင်းစွာ ပြုလုပ်ပါ**: pipeline ထဲတွင် AI အထူး စမ်းသပ်မှုများကို ထည့်သွင်းပါ
5. **ကုန်ကျစရိတ်အတွက် စီမံချက် ရေးဆွဲပါ**: Token အသုံးပြုမှုကို ကြီးကြပ်၍ ဘတ်ဂျက် alert များ မကြာခဏ သတ်မှတ်ပါ

### မထိခိုက်စေရန် ရှောင်ကြဉ်ရမည့် ပုံစံများ:

- ❌ API key များကို ကုဒ်ထဲတွင် တင်းကျပ်စွာ ထည့်သွင်းထားခြင်း
- ❌ သင့်တော်သော ကြီးကြပ်မှု မတပ်ဆင်ခြင်း
- ❌ ကုန်ကျစရိတ် အကောင်းမြှင့်တင်ခြင်းကို မလေးစားခြင်း
- ❌ ပျက်ကွက်မှု အခြေအနေများကို မစမ်းသပ်ခြင်း
- ❌ ကျန်းမာရေး စစ်ဆေးမှု မပါဘဲ တင်သွင်းခြင်း

## နောက်ထပ် ရင်းမြစ်များ

- **Azure Well-Architected Framework**: [AI အလုပ်စွမ်းရည် လမ်းညွှန်ချက်](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [တရားဝင် စာတမ်းများ](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure နမူနာများ](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure ချန်နယ်](https://discord.gg/microsoft-azure)

---

**Chapter Navigation:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD အစပြုသူများအတွက်](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 8 - ထုတ်လုပ်ရေးနှင့် စီးပွားရေး ပုံစံများ
- **⬅️ ယခင် အခန်း**: [အခန်း 7: ပြဿနာဖြေရှင်းခြင်း](../chapter-07-troubleshooting/debugging.md)
- **⬅️ အခြား ဆက်စပ်**: [AI အလုပ်ရုံ လက်တွေ့ စမ်းသပ်ခန်း](ai-workshop-lab.md)
- **🎆 သင်တန်း ပြီးစီး**: [AZD အစပြုသူများအတွက်](../../README.md)

**မှတ်ထားရန်**: ထုတ်လုပ်ရေး AI အလုပ်များသည် သေချာသော စီမံခန့်ခွဲမှု၊ ကြီးကြပ်စောင့်ကြည့်မှုနှင့် ထပ်ဆင့် အကောင်းပြုပြင်ထိန်းသိမ်းမှုများကို လိုအပ်သည်။ ဤပုံစံများဖြင့် စတင်၍ သင့် လိုအပ်ချက်များအပေါ် ကိုက်ညီစေရန် ပြင်ဆင်ချိန်ဆက် လိုက်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားပေမယ့် အလိုအလျောက် ဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် တိကျမှုလျော့နည်းမှုများ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလစာရွက်စာတမ်းကို မူရင်းဘာသာဖြင့် ရေးသားထားသည့် အာဏာပိုင် ရင်းမြစ်အဖြစ် ယူဆသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် သမားရိုးကျ လူသားဘာသာပြန်တစ်ဦး၏ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်နိုင်သည့် မဖြစ်အောင်နားလည်မှုများ သို့မဟုတ် မှားယွင်းသော အဓိပ္ပါယ်ဖော်ပြချက်များအတွက် ကျွန်တော်တို့/ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->