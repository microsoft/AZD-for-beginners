<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a248f574dbb58c1f58a7bcc3f47e361",
  "translation_date": "2025-11-24T23:30:56+00:00",
  "source_file": "docs/microsoft-foundry/production-ai-practices.md",
  "language_code": "ml"
}
-->
# AZD ഉപയോഗിച്ച് പ്രൊഡക്ഷൻ AI വർക്ക്‌ലോഡുകൾക്കുള്ള മികച്ച പ്രാക്ടീസുകൾ

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ മുൻ അധ്യായം**: [Chapter 7: Troubleshooting](../troubleshooting/debugging.md)
- **⬅️ ബന്ധപ്പെട്ടവ**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 കോഴ്സ് പൂർത്തിയാക്കുക**: [AZD For Beginners](../../README.md)

## അവലോകനം

Azure Developer CLI (AZD) ഉപയോഗിച്ച് പ്രൊഡക്ഷൻ-റെഡി AI വർക്ക്‌ലോഡുകൾ ഡിപ്ലോയ് ചെയ്യുന്നതിനുള്ള സമഗ്രമായ മികച്ച പ്രാക്ടീസുകൾ ഈ ഗൈഡ് നൽകുന്നു. Microsoft Foundry Discord കമ്മ്യൂണിറ്റിയുടെയും യഥാർത്ഥ ലോക ഉപഭോക്തൃ ഡിപ്ലോയ്‌മെന്റുകളുടെയും ഫീഡ്ബാക്ക് അടിസ്ഥാനമാക്കി, ഈ പ്രാക്ടീസുകൾ പ്രൊഡക്ഷൻ AI സിസ്റ്റങ്ങളിൽ ഏറ്റവും സാധാരണമായ വെല്ലുവിളികളെ പരിഹരിക്കുന്നു.

## പരിഹരിച്ച പ്രധാന വെല്ലുവിളികൾ

കമ്മ്യൂണിറ്റി പോൾ ഫലങ്ങൾ അടിസ്ഥാനമാക്കി, ഡെവലപ്പർമാർ നേരിടുന്ന പ്രധാന വെല്ലുവിളികൾ ഇവയാണ്:

- **45%** മൾട്ടി-സർവീസ് AI ഡിപ്ലോയ്‌മെന്റുകളിൽ ബുദ്ധിമുട്ട് അനുഭവപ്പെടുന്നു
- **38%** ക്രെഡൻഷ്യൽ, സീക്രട്ട് മാനേജ്മെന്റിൽ പ്രശ്നങ്ങൾ നേരിടുന്നു  
- **35%** പ്രൊഡക്ഷൻ റെഡിനസ്, സ്കെയിലിംഗ് എന്നിവ ദുഷ്കരമാണ്
- **32%** ചെലവ് ഓപ്റ്റിമൈസേഷൻ തന്ത്രങ്ങൾ മെച്ചപ്പെടുത്തേണ്ടതുണ്ട്
- **29%** മോണിറ്ററിംഗ്, ട്രബിള്‍ഷൂട്ടിംഗ് എന്നിവയിൽ മെച്ചപ്പെടുത്തൽ ആവശ്യമാണ്

## പ്രൊഡക്ഷൻ AI-ക്കുള്ള ആർക്കിടെക്ചർ പാറ്റേണുകൾ

### പാറ്റേൺ 1: മൈക്രോസർവീസസ് AI ആർക്കിടെക്ചർ

**ഉപയോഗിക്കേണ്ട സമയത്ത്**: ഒന്നിലധികം ശേഷികളുള്ള സങ്കീർണ്ണ AI ആപ്ലിക്കേഷനുകൾ

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

### പാറ്റേൺ 2: ഇവന്റ്-ഡ്രിവൻ AI പ്രോസസ്സിംഗ്

**ഉപയോഗിക്കേണ്ട സമയത്ത്**: ബാച്ച് പ്രോസസ്സിംഗ്, ഡോക്യുമെന്റ് വിശകലനം, അസിങ്ക് വർക്ക്‌ഫ്ലോകൾ

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

## സുരക്ഷയ്ക്കുള്ള മികച്ച പ്രാക്ടീസുകൾ

### 1. സീറോ-ട്രസ്റ്റ് സെക്യൂരിറ്റി മോഡൽ

**നടപ്പാക്കൽ തന്ത്രം**:
- ഓതന്റിക്കേഷൻ ഇല്ലാതെ സർവീസ്-ടു-സർവീസ് കമ്മ്യൂണിക്കേഷൻ ഇല്ല
- എല്ലാ API കോൾസും മാനേജ്ഡ് ഐഡന്റിറ്റികൾ ഉപയോഗിക്കുന്നു
- പ്രൈവറ്റ് എൻഡ്പോയിന്റുകളുള്ള നെറ്റ്‌വർക്കിന്റെ ഐസലേഷൻ
- ഏറ്റവും കുറഞ്ഞ പ്രിവിലേജ് ആക്സസ് കൺട്രോൾ

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

### 2. സുരക്ഷിത സീക്രട്ട് മാനേജ്മെന്റ്

**Key Vault Integration Pattern**:

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

### 3. നെറ്റ്‌വർക്കിന്റെ സുരക്ഷ

**Private Endpoint Configuration**:

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

**Container Apps Auto-scaling**:

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

**Redis Cache for AI Responses**:

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

### 3. ലോഡ് ബാലൻസിംഗ്, ട്രാഫിക് മാനേജ്മെന്റ്

**Application Gateway with WAF**:

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

## 💰 ചെലവ് ഓപ്റ്റിമൈസേഷൻ

### 1. റിസോഴ്സ് റൈറ്റ്-സൈസിംഗ്

**Environment-Specific Configurations**:

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

### 2. ചെലവ് മോണിറ്ററിംഗ്, ബഡ്ജറ്റുകൾ

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

### 3. ടോക്കൺ ഉപയോഗ ഓപ്റ്റിമൈസേഷൻ

**OpenAI Cost Management**:

```typescript
// ആപ്ലിക്കേഷൻ-തല ടോക്കൺ ഓപ്റ്റിമൈസേഷൻ
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // ഉപയോക്തൃ ഇൻപുട്ട് അല്ല, കോൺടെക്സ്റ്റ് മുറിക്കുക
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // ഏകദേശ കണക്കുകൂട്ടൽ: 1 ടോക്കൺ ≈ 4 അക്ഷരങ്ങൾ
    return Math.ceil(text.length / 4);
  }
}
```

## മോണിറ്ററിംഗ്, ഒബ്സർവബിലിറ്റി

### 1. സമഗ്രമായ ആപ്ലിക്കേഷൻ ഇൻസൈറ്റുകൾ

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

### 2. AI-സ്പെസിഫിക് മോണിറ്ററിംഗ്

**Custom Dashboards for AI Metrics**:

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

### 3. ഹെൽത്ത് ചെക്കുകൾ, അപ്‌ടൈം മോണിറ്ററിംഗ്

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

## ദുരന്തം പുനരുദ്ധാരണവും ഉയർന്ന ലഭ്യതയും

### 1. മൾട്ടി-റീജിയൻ ഡിപ്ലോയ്‌മെന്റ്

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

### 2. ഡാറ്റ ബാക്കപ്പ്, പുനരുദ്ധാരണം

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

## DevOps, CI/CD ഇന്റഗ്രേഷൻ

### 1. GitHub Actions Workflow

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

### 2. ഇൻഫ്രാസ്ട്രക്ചർ വാലിഡേഷൻ

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# ആവശ്യമായ എല്ലാ സേവനങ്ങളും പ്രവർത്തിക്കുന്നുണ്ടോ എന്ന് പരിശോധിക്കുക
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI മോഡൽ വിന്യാസങ്ങൾ സാധൂകരിക്കുക
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI സേവന ബന്ധം പരിശോധിക്കുക
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## പ്രൊഡക്ഷൻ റെഡിനസ് ചെക്ക്ലിസ്റ്റ്

### സുരക്ഷ ✅
- [ ] എല്ലാ സർവീസുകളും മാനേജ്ഡ് ഐഡന്റിറ്റികൾ ഉപയോഗിക്കുന്നു
- [ ] സീക്രട്ടുകൾ Key Vault-ൽ സൂക്ഷിക്കുന്നു
- [ ] പ്രൈവറ്റ് എൻഡ്പോയിന്റുകൾ കോൺഫിഗർ ചെയ്തിരിക്കുന്നു
- [ ] നെറ്റ്‌വർക്കിന്റെ സുരക്ഷാ ഗ്രൂപ്പുകൾ നടപ്പിലാക്കി
- [ ] ഏറ്റവും കുറഞ്ഞ പ്രിവിലേജ് RBAC
- [ ] പബ്ലിക് എൻഡ്പോയിന്റുകളിൽ WAF സജ്ജമാക്കി

### പ്രകടനം ✅
- [ ] ഓട്ടോ-സ്കെയിലിംഗ് കോൺഫിഗർ ചെയ്തിരിക്കുന്നു
- [ ] കാഷിംഗ് നടപ്പിലാക്കി
- [ ] ലോഡ് ബാലൻസിംഗ് സജ്ജമാക്കി
- [ ] സ്റ്റാറ്റിക് ഉള്ളടക്കത്തിന് CDN
- [ ] ഡാറ്റാബേസ് കണക്ഷൻ പൂളിംഗ്
- [ ] ടോക്കൺ ഉപയോഗ ഓപ്റ്റിമൈസേഷൻ

### മോണിറ്ററിംഗ് ✅
- [ ] ആപ്ലിക്കേഷൻ ഇൻസൈറ്റുകൾ കോൺഫിഗർ ചെയ്തിരിക്കുന്നു
- [ ] കസ്റ്റം മെട്രിക്‌സ് നിർവചിച്ചു
- [ ] അലർട്ട് റൂളുകൾ സജ്ജമാക്കി
- [ ] ഡാഷ്ബോർഡ് സൃഷ്ടിച്ചു
- [ ] ഹെൽത്ത് ചെക്കുകൾ നടപ്പിലാക്കി
- [ ] ലോഗ് റിട്ടൻഷൻ പോളിസികൾ

### വിശ്വാസ്യത ✅
- [ ] മൾട്ടി-റീജിയൻ ഡിപ്ലോയ്‌മെന്റ്
- [ ] ബാക്കപ്പ്, പുനരുദ്ധാരണ പദ്ധതി
- [ ] സർക്യൂട്ട് ബ്രേക്കറുകൾ നടപ്പിലാക്കി
- [ ] റിട്രൈ പോളിസികൾ കോൺഫിഗർ ചെയ്തു
- [ ] ഗ്രേസ്‌ഫുൾ ഡിഗ്രഡേഷൻ
- [ ] ഹെൽത്ത് ചെക്ക് എൻഡ്പോയിന്റുകൾ

### ചെലവ് മാനേജ്മെന്റ് ✅
- [ ] ബഡ്ജറ്റ് അലർട്ടുകൾ കോൺഫിഗർ ചെയ്തു
- [ ] റിസോഴ്സ് റൈറ്റ്-സൈസിംഗ്
- [ ] ഡെവ്/ടെസ്റ്റ് ഡിസ്കൗണ്ടുകൾ പ്രയോഗിച്ചു
- [ ] റിസർവ്ഡ് ഇൻസ്റ്റൻസുകൾ വാങ്ങി
- [ ] ചെലവ് മോണിറ്ററിംഗ് ഡാഷ്ബോർഡ്
- [ ] സ്ഥിരമായ ചെലവ് അവലോകനങ്ങൾ

### соответствие ✅
- [ ] ഡാറ്റ റെസിഡൻസി ആവശ്യങ്ങൾ പാലിച്ചു
- [ ] ഓഡിറ്റ് ലോഗിംഗ് സജ്ജമാക്കി
- [ ] соответствие പോളിസികൾ പ്രയോഗിച്ചു
- [ ] സുരക്ഷാ ബേസ്ലൈനുകൾ നടപ്പിലാക്കി
- [ ] സ്ഥിരമായ സുരക്ഷാ വിലയിരുത്തലുകൾ
- [ ] ഇൻസിഡന്റ് റെസ്പോൺസ് പ്ലാൻ

## പ്രകടന ബെഞ്ച്മാർക്കുകൾ

### സാധാരണ പ്രൊഡക്ഷൻ മെട്രിക്‌സ്

| മെട്രിക് | ലക്ഷ്യം | മോണിറ്ററിംഗ് |
|--------|--------|------------|
| **റിസ്പോൺസ് ടൈം** | < 2 സെക്കൻഡ് | ആപ്ലിക്കേഷൻ ഇൻസൈറ്റുകൾ |
| **ലഭ്യത** | 99.9% | അപ്‌ടൈം മോണിറ്ററിംഗ് |
| **എറർ റേറ്റ്** | < 0.1% | ആപ്ലിക്കേഷൻ ലോഗുകൾ |
| **ടോക്കൺ ഉപയോഗം** | < $500/മാസം | ചെലവ് മാനേജ്മെന്റ് |
| **കൺകറന്റ് യൂസേഴ്സ്** | 1000+ | ലോഡ് ടെസ്റ്റിംഗ് |
| **പുനരുദ്ധാരണ സമയം** | < 1 മണിക്കൂർ | ദുരന്തം പുനരുദ്ധാരണ ടെസ്റ്റുകൾ |

### ലോഡ് ടെസ്റ്റിംഗ്

```bash
# AI അപ്ലിക്കേഷനുകൾക്കുള്ള ലോഡ് ടെസ്റ്റിംഗ് സ്ക്രിപ്റ്റ്
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 കമ്മ്യൂണിറ്റി മികച്ച പ്രാക്ടീസുകൾ

Microsoft Foundry Discord കമ്മ്യൂണിറ്റി ഫീഡ്ബാക്ക് അടിസ്ഥാനമാക്കി:

### കമ്മ്യൂണിറ്റിയുടെ പ്രധാന ശുപാർശകൾ:

1. **ചെറുതായി ആരംഭിക്കുക, تدريجيമായി സ്കെയിൽ ചെയ്യുക**: അടിസ്ഥാന SKUs ഉപയോഗിച്ച് ആരംഭിച്ച് യഥാർത്ഥ ഉപയോഗം അടിസ്ഥാനമാക്കി സ്കെയിൽ ചെയ്യുക
2. **എല്ലാം മോണിറ്റർ ചെയ്യുക**: ആദ്യ ദിവസം മുതൽ സമഗ്രമായ മോണിറ്ററിംഗ് സജ്ജമാക്കുക
3. **സുരക്ഷ ഓട്ടോമേറ്റ് ചെയ്യുക**: സ്ഥിരതയുള്ള സുരക്ഷയ്ക്കായി ഇൻഫ്രാസ്ട്രക്ചർ കോഡ് ആയി ഉപയോഗിക്കുക
4. **നന്നായി ടെസ്റ്റ് ചെയ്യുക**: നിങ്ങളുടെ പൈപ്പ്ലൈനിൽ AI-സ്പെസിഫിക് ടെസ്റ്റിംഗ് ഉൾപ്പെടുത്തുക
5. **ചെലവുകൾക്ക് പദ്ധതി തയ്യാറാക്കുക**: ടോക്കൺ ഉപയോഗം മോണിറ്റർ ചെയ്യുക, ബഡ്ജറ്റ് അലർട്ടുകൾ നേരത്തേ സജ്ജമാക്കുക

### ഒഴിവാക്കേണ്ട സാധാരണ പിഴവുകൾ:

- ❌ API കീകൾ കോഡിൽ ഹാർഡ്‌കോഡ് ചെയ്യുന്നു
- ❌ ശരിയായ മോണിറ്ററിംഗ് സജ്ജമാക്കാത്തത്
- ❌ ചെലവ് ഓപ്റ്റിമൈസേഷൻ അവഗണിക്കുന്നു
- ❌ പരാജയ സീനാരിയോകൾ ടെസ്റ്റ് ചെയ്യാത്തത്
- ❌ ഹെൽത്ത് ചെക്കുകൾ ഇല്ലാതെ ഡിപ്ലോയ് ചെയ്യുന്നു

## അധിക റിസോഴ്സുകൾ

- **Azure Well-Architected Framework**: [AI വർക്ക്‌ലോഡ് ഗൈഡൻസ്](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [ഓഫീഷ്യൽ ഡോക്സ്](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure ചാനൽ](https://discord.gg/microsoft-azure)

---

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ മുൻ അധ്യായം**: [Chapter 7: Troubleshooting](../troubleshooting/debugging.md)
- **⬅️ ബന്ധപ്പെട്ടവ**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎆 കോഴ്സ് പൂർത്തിയാക്കുക**: [AZD For Beginners](../../README.md)

**ഓർമ്മിക്കുക**: പ്രൊഡക്ഷൻ AI വർക്ക്‌ലോഡുകൾ ശ്രദ്ധാപൂർവമായ പദ്ധതി, മോണിറ്ററിംഗ്, തുടർച്ചയായ ഓപ്റ്റിമൈസേഷൻ എന്നിവ ആവശ്യമാണ്. ഈ പാറ്റേണുകൾ ഉപയോഗിച്ച് ആരംഭിച്ച് നിങ്ങളുടെ പ്രത്യേക ആവശ്യങ്ങൾക്കനുസരിച്ച് അവയെ അനുകൂലമാക്കുക.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:  
ഈ പ്രമാണം AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, സ്വയം പ്രവർത്തിക്കുന്ന വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള യഥാർത്ഥ പ്രമാണം പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കണം. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->