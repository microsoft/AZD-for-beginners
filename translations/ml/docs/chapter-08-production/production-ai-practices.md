# AZD ഉപയോഗിച്ച് പ്രൊഡക്ഷൻ AI വർക്ക്ലോഡ് മികച്ച പ്രവർത്തനരീതികൾ

**Chapter Navigation:**
- **📚 Course Home**: [ആരംഭകർക്കുള്ള AZD](../../README.md)
- **📖 Current Chapter**: അദ്ധ്യായം 8 - പ്രൊഡක්ෂൻ & എന്റർപ്രൈസ് മാതൃകകൾ
- **⬅️ Previous Chapter**: [അദ്ധ്യായം 7: പ്രശ്നപരിഹാരം](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI വർക്ക്‌ഷോപ്പ് ലാബ്](ai-workshop-lab.md)
- **🎯 Course Complete**: [ആരംഭകർക്കുള്ള AZD](../../README.md)

## അവലോകനം

ഈ ഗൈഡ് Azure Developer CLI (AZD) ഉപയോഗിച്ച് പ്രൊഡക്ഷൻ-റഡി AI വർക്ക്ലോഡുകൾ വിന്യസിക്കുമ്പോൾ അനുയോജ്യമായ മികച്ച പ്രവർത്തനരീതികൾ വിശദമായി 제공합니다. Microsoft Foundry Discord കമ്മ്യൂണിറ്റിയുടെ പ്രതികരണങ്ങളും യഥാർത്ഥ ഉപഭോക്തൃ വിന്യാസങ്ങളുമായുള്ള അനുഭവങ്ങളെ അടിസ്ഥാനമാക്കി, ഈ പദ്ധതികൾ പ്രൊഡക്ഷൻ AI സിസ്റ്റങ്ങളിലെ ഏറ്റവും സാധാരണമായ പ്രശ്നങ്ങൾ പരിഹരിക്കുന്നു.

## പരിഹരിച്ച പ്രധാന വെല്ലുവിളികൾ

കമ്മ്യൂണിറ്റി പോൾ ഫലങ്ങളെ അടിസ്ഥാനമാക്കി, ഡെവലപ്പർമാർ നേരിടുന്ന പ്രധാന വെല്ലുവിഴകൾ ഇവയാണ്:

- **45%** മൾട്ടി-സർവീസ് AI വിന്യാസങ്ങൾ കൈകാര്യം ചെയ്യുന്നതിൽ ബുദ്ധിമുട്ടുന്നു
- **38%** ക്രെഡൻഷ്യൽസും രഹസ്യ സമ്പാദനവും കൈകാര്യം ചെയ്യുന്നതിൽ പ്രശ്നങ്ങൾ നേരിടുന്നു  
- **35%** പ്രൊഡക്ഷൻ റെഡിനസ്‌വും സ്കെയിലിംഗും പ്രയാസകരമാണെന്ന് കാണുന്നു
- **32%** ചെലവ് ഒപ്റ്റിമൈസേഷനിൽ മെച്ചപ്പെട്ട തന്ത്രങ്ങൾ ആവശ്യമുണ്ട്
- **29%** മെച്ചപ്പെട്ട നിരീക്ഷണവും ട്രബിള്ഷൂട്ടിംഗും ആവശ്യമുണ്ട്

## പ്രൊഡക്ഷൻ AI നുള്ള ആർക്കിടെക്ചർ മാതൃകകൾ

### മാതൃക 1: മൈക്രോസർവീസ് AI ആർക്കിടെക്ചർ

**ഉപയോഗിക്കേണ്ടപ്പോൾ**: പല കഴിവുകളുള്ള സങ്കീർണ്ണ AI ആപ്ലിക്കേഷനുകൾക്ക്

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

**AZD നടപ്പാക്കൽ**:

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

### മാതൃക 2: ഇവന്റ്-ഡ്രിവൻ AI പ്രോസസ്സിംഗ്

**ഉപയോഗിക്കേണ്ടപ്പോൾ**: ബാച്ച് പ്രോസസ്സിംഗ്, ഡോക്യുമെന്റ് വിശകലനം, അസിങ്ക്രോണസ് പ്രവാഹങ്ങൾ

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

## സുരക്ഷാ മികച്ച രീതികൾ

### 1. സീറോ-ട്രസ്റ്റ് സുരക്ഷാ മോഡൽ

**നടപ്പാക്കൽ തന്ത്രം**:
- ഓതന്റിക്കേഷൻ ഇല്ലാതെ സർവീസ്-ടു-സർവീസ് കമ്മ്യൂണിക്കേഷൻ അനുവദിക്കരുത്
- എല്ലാ API കോൾസും മാനേജ്‍ഡ് ഐഡന്റിറ്റികൾ ഉപയോഗിക്കുന്നു
- പ്രൈവറ്റ് എൻഡ്‌പോയിന്റുകളിലൂടെ നെറ്റ്‌വർക്ക് ഐസൊലേഷൻ
- കുറഞ്ഞ അവകാശമുള്ള ആക്‌സസ് നിയന്ത്രണങ്ങൾ

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

### 2. സുരക്ഷിത രഹസ്യ മാനേജുമെന്റ്

**Key Vault ഇന്റഗ്രേഷൻ മാതൃക**:

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

### 3. നെറ്റ്‌വർക്ക് സുരക്ഷ

**പ്രൈവറ്റ് എൻഡ്‌പോയിന്റ് കോൺഫിഗറേഷൻ**:

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

## പ്രകടനവും സ്കെയിലിംഗും

### 1. ഓട്ടോ-സ്കെയിലിംഗ് തന്ത്രങ്ങൾ

**Container Apps ഓട്ടോ-സ്കെയിലിംഗ്**:

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

### 2. കാഷിംഗ് തന്ത്രങ്ങൾ

**AI പ്രതികരണങ്ങൾക്കുള്ള Redis കാഷ്**:

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

### 3. ലോഡ് ബാലൻസിംഗും ട്രാഫിക് മാനേജ്മെന്റും

**WAF ഉള്ള Application Gateway**:

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

## 💰 ചെലവ് ഒപ്റ്റിമൈസേഷൻ

### 1. റിസോഴ്‌സ് ശരിയായ വലുപ്പത്തിൽ ക്രമീകരിക്കൽ

**പരിസ്ഥിതി-നിർദിഷ്ട കോൺഫിഗറേഷനുകൾ**:

```bash
# വികസന പരിസ്ഥിതി
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# ഉത്പാദന പരിസ്ഥിതി
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. ചെലവ് നിരീക്ഷണവും ബജറ്റുകളും

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

### 3. ടോക്കൺ ഉപയോഗ ഒപ്റ്റിമൈസേഷൻ

**OpenAI ചെലവ് മാനേജ്മെന്റ്**:

```typescript
// ആപ്ലിക്കേഷൻ-തലത്തിലുള്ള ടോക്കൺ മെച്ചപ്പെടുത്തൽ
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // സന്ദർഭം വെട്ടിക്കുറയ്ക്കുക, ഉപയോക്താവിന്റെ ഇൻപുട്ട് അല്ല
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // ഏകദേശം കണക്കുകൂട്ടൽ: 1 ടോക്കൺ ≈ 4 അക്ഷരങ്ങൾ
    return Math.ceil(text.length / 4);
  }
}
```

## നിരീക്ഷണവും ദൃശ്യീകരണവും

### 1. സമഗ്രമായ Application Insights

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

### 2. AI-നിർദിഷ്ട നിരീക്ഷണം

**AI മെട്രിക്കുകൾക്കുള്ള കസ്റ്റം ഡാഷ്ബോർഡുകൾ**:

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

### 3. ഹെൽത്ത് ചെക്കുകളും അപ്‌ടൈം നിരീക്ഷണവും

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

## ദുരന്തം പുനഃസ്ഥാപനവും ഉയർന്ന ലഭ്യതയും

### 1. മൾട്ടി-റീജിയൻ വിന്യാസം

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

### 2. ഡാറ്റ ബാക്കപ്പ്യും പുനഃസ്ഥാപനവും

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

## DevOpsയും CI/CD ഇന്റഗ്രേഷനും

### 1. GitHub Actions വർക്‌ഫ്ലോ

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

### 2. ഇൻഫ്രാസ്ട്രക്ചർ സാധുതാ പരിശോധന

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# ആവശ്യമായ എല്ലാ സേവനങ്ങളും പ്രവർത്തിക്കുകയാണോ എന്ന് പരിശോധിക്കുക
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI മോഡൽ ഡിപ്ലോയ്മെന്റുകൾ സാധൂകരിക്കുക
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI സേവന കണക്ടിവിറ്റി പരിശോധിക്കുക
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## പ്രൊഡക്ഷൻ റെഡിനസ് ചെക്ക്ലിസ്റ്റ്

### സുരക്ഷാ ✅
- [ ] എല്ലാ സർവീസുകളും മാനേജ് ചെയ്ത ഐഡന്റിറ്റികൾ ഉപയോഗിക്കുന്നു
- [ ] രഹസ്യങ്ങൾ Key Vault-ൽ സൂക്ഷിച്ചിരിക്കുന്നു
- [ ] പ്രൈവറ്റ് എൻഡ്‌പോയിന്റുകൾ കോൺഫിഗർ ചെയ്തിരിക്കുന്നു
- [ ] നെറ്റ്‌വർക്ക് സെക്യൂരിറ്റി ഗ്രൂപ്പുകൾ നടപ്പിലാക്കിയിരിക്കുന്നു
- [ ] കുറഞ്ഞ അവകാശമുള്ള RBAC
- [ ] പബ്ലിക്ക് എൻഡ്‌പോയിന്റുകളിൽ WAF സജ്ജമാക്കിയിട്ടുള്ളത്

### പ്രകടനം ✅
- [ ] ഓട്ടോ-സ്കെയിലിംഗ് കോൺഫിഗർ ചെയ്തിരിക്കുന്നു
- [ ] കാഷിംഗ് നടപ്പിലാക്കിയിട്ടുണ്ട്
- [ ] ലോഡ് ബാലൻസിംഗ് സജ്ജീകരിച്ചിരിക്കുന്നു
- [ ] സ്റ്റാറ്റിക് കണ്ടന്റിനുള്ള CDN
- [ ] ഡാറ്റാബേസ് കണക്ഷൻ പൂലിംഗ്
- [ ] ടോക്കൺ ഉപയോഗം ഒപ്റ്റിമൈസ് ചെയ്തിട്ടുണ്ട്

### നിരീക്ഷണം ✅
- [ ] Application Insights കോൺഫിഗർ ചെയ്തിരിക്കുന്നു
- [ ] കസ്റ്റം മെട്രിക്കുകൾ നിർവചിച്ചിരിക്കുന്നു
- [ ] അലേർട്ടിംഗ് നിബന്ധനകൾ സജ്ജീകരിച്ചിരിക്കുന്നു
- [ ] ഡാഷ്ബോർഡ് നിർമ്മിച്ചിട്ടുള്ളത്
- [ ] ഹെൽത്ത് ചെക്കുകൾ നടപ്പിലാക്കിയിരിക്കുന്നത്
- [ ] ലോഗ് റിട്ടക്ഷൻ നയങ്ങൾ

### വിശ്വാസ്യത ✅
- [ ] മൾട്ടി-റീജിയൻ വിന്യാസം
- [ ] ബാക്കപ്പ് & പുനഃസ്ഥാപന പദ്ധതി
- [ ] സർക്യൂട്ട് ബ്രേക്കറുകൾ നടപ്പിലാക്കിയിട്ടുണ്ട്
- [ ] റിട്രൈ നയങ്ങൾ കോൺഫിഗർ ചെയ്തിരിക്കുന്നു
- [ ] ഗ്രേസ്‌ഫുൾ ഡീഗ്രേഡേഷൻ
- [ ] ഹെൽത്ത് ചെക്ക് എൻഡ്‌പോയിന്റുകൾ

### ചെലവ് നിയന്ത്രണം ✅
- [ ] ബജറ്റ് അലേർട്ടുകൾ കോൺഫിഗർ ചെയ്തിരിക്കുന്നു
- [ ] റിസോഴ്‌സ് ശരിയായ വലുപ്പം
- [ ] ഡെവ്/ടെസ്റ്റ് ഡിസ്കൗണ്ടുകൾ പ്രയോഗിച്ചത്
- [ ] റിസർവഡ് ഇൻസ്റ്റാൻസുകൾ വാങ്ങിയത്
- [ ] ചെലവ് നിരീക്ഷണ ഡാഷ്ബോർഡ്
- [ ] regelmäßige ചെലവ് പര്യവേക്ഷണങ്ങൾ (regular cost reviews) — പരിഭാഷ: regelmäßige മലയാളത്തിലേക്ക് മാറ്റേണ്ടതില്ലെങ്കിൽ വിശകലനം ചെയ്യുക

### അനുസരണം ✅
- [ ] ഡാറ്റ നിവാസിത്വ ആവശ്യകതകൾ പാലിച്ചിട്ടുണ്ട്
- [ ] ഓഡിറ്റ് ലോഗിംഗ് സജ്ജമാക്കിയിട്ടുണ്ട്
- [ ] അനുസരണം നയങ്ങൾ പ്രയോഗിച്ചിട്ടുണ്ട്
- [ ] സുരക്ഷാ അടിസ്ഥാനരേഖകൾ നടപ്പിലാക്കിയിട്ടുണ്ട്
- [ ] নিয়মിത സുരക്ഷാ പരിശോധനകൾ
- [ ] ഇൻസിഡന്റ് പ്രതികരണ പദ്ധതി

## പ്രകടന ബेंച്മാർക്കുകൾ

### സാധാരണ പ്രൊഡക്ഷൻ മെട്രിക്‌സ്

| മെട്രിക് | ലക്ഷ്യം | നിരീക്ഷണം |
|--------|--------|------------|
| **പ്രതികരണ സമയം** | < 2 സെക്കൻഡുകൾ | Application Insights |
| **ലഭ്യത** | 99.9% | അപ്‌ടൈം നിരീക്ഷണം |
| **ലഭ്യമല്ലാത്ത നിരക്ക് (Error Rate)** | < 0.1% | അപ്ലിക്കേഷൻ ലോഗുകൾ |
| **ടോക്കൺ ഉപയോഗം** | < $500/മാസം | ചെലവ് മാനേജ്മെന്റ് |
| **സമകാലിക ഉപയോക്താക്കൾ** | 1000+ | ലോഡ് ടെസ്റ്റിംഗ് |
| **പുനഃപ്രാപ്തി സമയം** | < 1 മണിക്കൂർ | ദുരന്ത പുനഃസ്ഥാപന പരീക്ഷണങ്ങൾ |

### ലോഡ് ടെസ്റ്റിംഗ്

```bash
# AI ആപ്ലിക്കേഷനുകൾക്കുള്ള ലോഡ് ടെസ്റ്റിംഗ് സ്ക്രിപ്റ്റ്
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 കമ്മ്യൂണിറ്റി മികച്ച രീതികൾ

Microsoft Foundry Discord കമ്മ്യൂണിറ്റിയുടെ ഫീഡ്ബാക്ക് അടിസ്ഥാനമാക്കി:

### കമ്മ്യൂണിറ്റിയുടെ ടോപ് ശുപാർശകൾ:

1. **ചെറുതായി തുടങ്ങുക, ക്രമമായി സ്കെയിൽ ചെയ്യുക**: അടിസ്ഥാന SKUs-ൽ നിന്ന് ആരംഭിച്ച് യാഥാർത്ഥ്യ ഉപയോഗത്തെ ആശ്രയിച്ച് ഉയർത്തുക
2. **എല്ലാം നിരീക്ഷിക്കുക**: ആദ്യ ദിവസമുതൽ സമഗ്രമായ നിരീക്ഷണം സജ്ജമാക്കുക
3. **സുരക്ഷ ഓട്ടോമേറ്റ് ചെയ്യൂ**: സ്ഥിരമായ സുരക്ഷയ്ക്ക് ഇൻഫ്രാസ്ട്രക്ചർ എസ്സ് കോഡ് ഉപയോഗിക്കുക
4. **മുന്നറിയിപ്പായി പരീക്ഷിച്ചുകണ്ട്**: നിങ്ങളുടെ പൈപ്പ്ലൈനിൽ AI-നിർദിഷ്ട ടെസ്റ്റിംഗ് ഉൾപ്പെടുത്തുക
5. **ചെലവിന് പ്ലാൻ ചെയ്യൂ**: ടോക്കൺ ഉപയോഗം നിരീക്ഷിച്ച് ആദ്യഘട്ടത്തിൽ ബജറ്റ് അലേർട്ടുകൾ സജ്ജമാക്കുക

### ഒഴിവാക്കേണ്ട പൊതുവായ തകരാറുകൾ:

- ❌ കോഡിൽ API കീകൾ ഹാർഡ്-കോഡ് ചെയ്യരുത്
- ❌ സുസ്ഥിരമായ നിരീക്ഷണം സജ്ജമാക്കാതിരിക്കുക
- ❌ ചെലവ് ഒപ്റ്റിമൈസേഷൻ അവഗണിക്കുക
- ❌ പരാജയ സംഭവങ്ങളോടുള്ള ടെസ്റ്റിംഗ് നോക്കാതെ മുഖേന വിന്യസിക്കുക
- ❌ ഹെൽത്ത് ചെക്കുകൾ ഇല്ലാതെ ഡിപ്ലോ ചെയ്യരുത്

## അധിക വിഭവങ്ങൾ

- **Azure Well-Architected Framework**: [AI വർക്ക്‌ലോഡ് മാർഗ്ഗനിർദേശം](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [അധികൃത രേഖകൾ](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure ചാനൽ](https://discord.gg/microsoft-azure)

---

**Chapter Navigation:**
- **📚 Course Home**: [ആരംഭകർക്കുള്ള AZD](../../README.md)
- **📖 Current Chapter**: அദ്ധ്യായം 8 - പ്രൊഡക്ഷൻ & എന്റർപ്രൈസ് മാതൃകകൾ
- **⬅️ Previous Chapter**: [അദ്ധ്യായം 7: പ്രശ്നപരിഹാരം](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI വർക്ക്‌ഷോപ്പ് ലാബ്](ai-workshop-lab.md)
- **🎆 Course Complete**: [ആരംഭകർക്കുള്ള AZD](../../README.md)

**സ്മരണം**: പ്രൊഡക്ഷൻ AI വർക്ക്ലോഡുകൾ ശ്രദ്ധപൂർവമായ പദ്ധതികരം, നിരീക്ഷണം, സ്ഥിരം ഒപ്റ്റിമൈസേഷൻ എന്നിവ ആവശ്യപ്പെടുന്നു. ഈ മാതൃകകളോടെയുടർന്ന് ആരംഭിച്ച് നിങ്ങളുടെ നിർദ്ദിഷ്ട ആവശ്യകതകൾക്ക് അനുസരിച്ച് അവ പരിഷ്കരിക്കുക.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
അറിവിപ്പിക്കല്‍:
ഈ രേഖ AI തര്‍ജ്ജമാ സേവനം (Co-op Translator: https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവര്‍ത്തനം ചെയ്തിട്ടില്ല. ഞങ്ങള്‍ കൃത്യതയ്ക്ക് പരിശ്രമിച്ചാലും സ്വയം പ്രവര്‍ത്തിക്കുന്ന തര്‍ജ്ജമകളില്‍ പിശകുകളും അപൂര്‍ണതകളും ഉണ്ടായിരിക്കാമെന്നും ദയവായി ശ്രദ്ധിക്കുക. അതിന്റെ മാതൃഭാഷയിലെ മൗലിക രേഖ അധികാരപരമായ സ്രോതസ്സാണ് എന്ന് കരുതണം. നിര്‍ണായകമായ വിവരങ്ങള്‍ക്കായി പ്രൊഫഷണല്‍ മനുഷ്യന്‍ നടത്തിയ തര്‍ജ്ജമയെയാണ് ശുപാര്‍ശ ചെയ്യുന്നത്. ഈ വിവര്‍ത്തനത്തിന്റെ ഉപയോഗത്തില്‍നിന്നുണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണത്തിനും വ്യാഖ്യാനത്തിലുണ്ടാകുന്ന പ്രശ്നങ്ങള്‍ക്കും ഞങ്ങള്‍ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->