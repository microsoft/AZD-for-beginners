<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a248f574dbb58c1f58a7bcc3f47e361",
  "translation_date": "2025-11-25T08:27:23+00:00",
  "source_file": "docs/ai-foundry/production-ai-practices.md",
  "language_code": "te"
}
-->
# AZD తో ప్రొడక్షన్ AI వర్క్‌లోడ్ బెస్ట్ ప్రాక్టీసెస్

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ఫర్ బిగినర్స్](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: చాప్టర్ 8 - ప్రొడక్షన్ & ఎంటర్‌ప్రైజ్ ప్యాటర్న్స్
- **⬅️ గత చాప్టర్**: [చాప్టర్ 7: ట్రబుల్‌షూటింగ్](../troubleshooting/debugging.md)
- **⬅️ సంబంధిత అంశం**: [AI వర్క్‌షాప్ ల్యాబ్](ai-workshop-lab.md)
- **🎯 కోర్సు పూర్తి**: [AZD ఫర్ బిగినర్స్](../../README.md)

## అవలోకనం

ఈ గైడ్ Azure Developer CLI (AZD) ఉపయోగించి ప్రొడక్షన్-రెడీ AI వర్క్‌లోడ్స్‌ను డిప్లాయ్ చేయడానికి సమగ్ర బెస్ట్ ప్రాక్టీసెస్‌ను అందిస్తుంది. Microsoft Foundry Discord కమ్యూనిటీ మరియు రియల్-వరల్డ్ కస్టమర్ డిప్లాయ్‌మెంట్స్ నుండి వచ్చిన ఫీడ్‌బ్యాక్ ఆధారంగా, ఈ ప్రాక్టీసెస్ ప్రొడక్షన్ AI సిస్టమ్స్‌లో సాధారణంగా ఎదురయ్యే సవాళ్లను పరిష్కరిస్తాయి.

## పరిష్కరించిన ముఖ్యమైన సవాళ్లు

మా కమ్యూనిటీ పోల్స్ ఫలితాల ఆధారంగా, డెవలపర్లు ఎదుర్కొనే టాప్ సవాళ్లు ఇవి:

- **45%** మల్టీ-సర్వీస్ AI డిప్లాయ్‌మెంట్స్‌తో ఇబ్బంది పడుతున్నారు
- **38%** క్రెడెన్షియల్ మరియు సీక్రెట్ మేనేజ్‌మెంట్ సమస్యలు ఎదుర్కొంటున్నారు  
- **35%** ప్రొడక్షన్ రెడీనెస్ మరియు స్కేలింగ్ కష్టంగా ఉంది
- **32%** ఖర్చు ఆప్టిమైజేషన్ స్ట్రాటజీలను మెరుగుపరచుకోవాలి
- **29%** మానిటరింగ్ మరియు ట్రబుల్‌షూటింగ్ మెరుగుపరచుకోవాలి

## ప్రొడక్షన్ AI కోసం ఆర్కిటెక్చర్ ప్యాటర్న్స్

### ప్యాటర్న్ 1: మైక్రోసర్వీసెస్ AI ఆర్కిటెక్చర్

**ఎప్పుడు ఉపయోగించాలి**: బహుళ సామర్థ్యాలతో కూడిన క్లిష్టమైన AI అప్లికేషన్లు

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

**AZD అమలు**:

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

### ప్యాటర్న్ 2: ఈవెంట్-డ్రివెన్ AI ప్రాసెసింగ్

**ఎప్పుడు ఉపయోగించాలి**: బ్యాచ్ ప్రాసెసింగ్, డాక్యుమెంట్ విశ్లేషణ, అసింక్ వర్క్‌ఫ్లోలు

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

## భద్రత బెస్ట్ ప్రాక్టీసెస్

### 1. జీరో-ట్రస్ట్ సెక్యూరిటీ మోడల్

**అమలు స్ట్రాటజీ**:
- ఆథెంటికేషన్ లేకుండా సర్వీస్-టు-సర్వీస్ కమ్యూనికేషన్ లేదు
- అన్ని API కాల్స్ మేనేజ్‌డ్ ఐడెంటిటీలను ఉపయోగిస్తాయి
- ప్రైవేట్ ఎండ్‌పాయింట్లతో నెట్‌వర్క్ ఐసోలేషన్
- తక్కువ ప్రివిలేజ్ యాక్సెస్ కంట్రోల్స్

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

### 2. సురక్షిత సీక్రెట్ మేనేజ్‌మెంట్

**కీ వాల్ట్ ఇంటిగ్రేషన్ ప్యాటర్న్**:

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

### 3. నెట్‌వర్క్ సెక్యూరిటీ

**ప్రైవేట్ ఎండ్‌పాయింట్ కాన్ఫిగరేషన్**:

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

## పనితీరు మరియు స్కేలింగ్

### 1. ఆటో-స్కేలింగ్ స్ట్రాటజీలు

**కంటైనర్ అప్లికేషన్ల ఆటో-స్కేలింగ్**:

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

### 2. క్యాషింగ్ స్ట్రాటజీలు

**Redis Cache కోసం AI రెస్పాన్స్‌లు**:

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

### 3. లోడ్ బ్యాలెన్సింగ్ మరియు ట్రాఫిక్ మేనేజ్‌మెంట్

**అప్లికేషన్ గేట్‌వే WAFతో**:

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

## 💰 ఖర్చు ఆప్టిమైజేషన్

### 1. రిసోర్స్ రైట్-సైజింగ్

**ఎన్విరాన్‌మెంట్-స్పెసిఫిక్ కాన్ఫిగరేషన్లు**:

```bash
# అభివృద్ధి వాతావరణం
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# ఉత్పత్తి వాతావరణం
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. ఖర్చు మానిటరింగ్ మరియు బడ్జెట్‌లు

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

### 3. టోకెన్ వినియోగ ఆప్టిమైజేషన్

**OpenAI ఖర్చు మేనేజ్‌మెంట్**:

```typescript
// అప్లికేషన్-స్థాయి టోకెన్ ఆప్టిమైజేషన్
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // కాంటెక్స్ట్‌ను కుదించండి, యూజర్ ఇన్‌పుట్‌ను కాదు
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // సుమారుగా అంచనా: 1 టోకెన్ ≈ 4 అక్షరాలు
    return Math.ceil(text.length / 4);
  }
}
```

## మానిటరింగ్ మరియు ఆబ్జర్వబిలిటీ

### 1. సమగ్ర అప్లికేషన్ ఇన్‌సైట్స్

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

### 2. AI-స్పెసిఫిక్ మానిటరింగ్

**AI మెట్రిక్స్ కోసం కస్టమ్ డాష్‌బోర్డులు**:

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

### 3. హెల్త్ చెక్స్ మరియు అప్టైమ్ మానిటరింగ్

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

## డిజాస్టర్ రికవరీ మరియు హై అవైలబిలిటీ

### 1. మల్టీ-రీజన్ డిప్లాయ్‌మెంట్

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

### 2. డేటా బ్యాకప్ మరియు రికవరీ

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

## డెవ్‌ఒప్స్ మరియు CI/CD ఇంటిగ్రేషన్

### 1. GitHub Actions వర్క్‌ఫ్లో

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

### 2. ఇన్‌ఫ్రాస్ట్రక్చర్ వాలిడేషన్

```bash
# స్క్రిప్ట్స్/వాలిడేట్_ఇన్‌ఫ్రాస్ట్రక్చర్.sh
#!/బిన్/బాష్

echo "Validating AI infrastructure deployment..."

# అవసరమైన అన్ని సేవలు నడుస్తున్నాయా అని తనిఖీ చేయండి
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI మోడల్ డిప్లాయ్‌మెంట్‌లను ధృవీకరించండి
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI సేవ కనెక్టివిటీని పరీక్షించండి
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## ప్రొడక్షన్ రెడీనెస్ చెక్లిస్ట్

### భద్రత ✅
- [ ] అన్ని సర్వీసులు మేనేజ్‌డ్ ఐడెంటిటీలను ఉపయోగిస్తాయి
- [ ] సీక్రెట్లు కీ వాల్ట్‌లో నిల్వ చేయబడ్డాయి
- [ ] ప్రైవేట్ ఎండ్‌పాయింట్లు కాన్ఫిగర్ చేయబడ్డాయి
- [ ] నెట్‌వర్క్ సెక్యూరిటీ గ్రూపులు అమలు చేయబడ్డాయి
- [ ] తక్కువ ప్రివిలేజ్ RBAC
- [ ] పబ్లిక్ ఎండ్‌పాయింట్లపై WAF ఎనేబుల్ చేయబడింది

### పనితీరు ✅
- [ ] ఆటో-స్కేలింగ్ కాన్ఫిగర్ చేయబడింది
- [ ] క్యాషింగ్ అమలు చేయబడింది
- [ ] లోడ్ బ్యాలెన్సింగ్ సెటప్ చేయబడింది
- [ ] స్టాటిక్ కంటెంట్ కోసం CDN
- [ ] డేటాబేస్ కనెక్షన్ పూలింగ్
- [ ] టోకెన్ వినియోగ ఆప్టిమైజేషన్

### మానిటరింగ్ ✅
- [ ] అప్లికేషన్ ఇన్‌సైట్స్ కాన్ఫిగర్ చేయబడింది
- [ ] కస్టమ్ మెట్రిక్స్ డిఫైన్ చేయబడ్డాయి
- [ ] అలర్టింగ్ రూల్స్ సెటప్ చేయబడ్డాయి
- [ ] డాష్‌బోర్డ్ క్రియేట్ చేయబడింది
- [ ] హెల్త్ చెక్స్ అమలు చేయబడ్డాయి
- [ ] లాగ్ రిటెన్షన్ పాలసీలు

### విశ్వసనీయత ✅
- [ ] మల్టీ-రీజన్ డిప్లాయ్‌మెంట్
- [ ] బ్యాకప్ మరియు రికవరీ ప్లాన్
- [ ] సర్క్యూట్ బ్రేకర్స్ అమలు చేయబడ్డాయి
- [ ] రిట్రై పాలసీలు కాన్ఫిగర్ చేయబడ్డాయి
- [ ] గ్రేస్‌ఫుల్ డీగ్రడేషన్
- [ ] హెల్త్ చెక్ ఎండ్‌పాయింట్లు

### ఖర్చు మేనేజ్‌మెంట్ ✅
- [ ] బడ్జెట్ అలర్ట్‌లు కాన్ఫిగర్ చేయబడ్డాయి
- [ ] రిసోర్స్ రైట్-సైజింగ్
- [ ] డెవ్/టెస్ట్ డిస్కౌంట్లు అప్లై చేయబడ్డాయి
- [ ] రిజర్వ్డ్ ఇన్‌స్టాన్సెస్ కొనుగోలు చేయబడ్డాయి
- [ ] ఖర్చు మానిటరింగ్ డాష్‌బోర్డ్
- [ ] రెగ్యులర్ ఖర్చు రివ్యూలు

### కంప్లయన్స్ ✅
- [ ] డేటా రెసిడెన్సీ అవసరాలు పూర్తయ్యాయి
- [ ] ఆడిట్ లాగింగ్ ఎనేబుల్ చేయబడింది
- [ ] కంప్లయన్స్ పాలసీలు అప్లై చేయబడ్డాయి
- [ ] సెక్యూరిటీ బేస్‌లైన్లు అమలు చేయబడ్డాయి
- [ ] రెగ్యులర్ సెక్యూరిటీ అసెస్‌మెంట్స్
- [ ] ఇన్సిడెంట్ రెస్పాన్స్ ప్లాన్

## పనితీరు బెంచ్‌మార్క్స్

### సాధారణ ప్రొడక్షన్ మెట్రిక్స్

| మెట్రిక్ | టార్గెట్ | మానిటరింగ్ |
|--------|--------|------------|
| **రెస్పాన్స్ టైమ్** | < 2 సెకన్లు | అప్లికేషన్ ఇన్‌సైట్స్ |
| **అవైలబిలిటీ** | 99.9% | అప్టైమ్ మానిటరింగ్ |
| **ఎరర్ రేట్** | < 0.1% | అప్లికేషన్ లాగ్స్ |
| **టోకెన్ వినియోగం** | < $500/నెల | ఖర్చు మేనేజ్‌మెంట్ |
| **కన్కరెంట్ యూజర్లు** | 1000+ | లోడ్ టెస్టింగ్ |
| **రికవరీ టైమ్** | < 1 గంట | డిజాస్టర్ రికవరీ టెస్టులు |

### లోడ్ టెస్టింగ్

```bash
# AI అప్లికేషన్ల కోసం లోడ్ టెస్టింగ్ స్క్రిప్ట్
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 కమ్యూనిటీ బెస్ట్ ప్రాక్టీసెస్

Microsoft Foundry Discord కమ్యూనిటీ ఫీడ్‌బ్యాక్ ఆధారంగా:

### కమ్యూనిటీ నుండి టాప్ సిఫార్సులు:

1. **చిన్నగా ప్రారంభించి, క్రమంగా స్కేల్ చేయండి**: ప్రాథమిక SKUsతో ప్రారంభించి, వాస్తవ వినియోగం ఆధారంగా స్కేల్ చేయండి
2. **అన్నింటినీ మానిటర్ చేయండి**: మొదటి రోజు నుంచే సమగ్ర మానిటరింగ్ సెటప్ చేయండి
3. **సెక్యూరిటీ ఆటోమేట్ చేయండి**: స్థిరమైన భద్రత కోసం ఇన్‌ఫ్రాస్ట్రక్చర్ కోడ్‌ను ఉపయోగించండి
4. **తప్పనిసరిగా పరీక్షించండి**: మీ పైప్‌లైన్‌లో AI-స్పెసిఫిక్ టెస్టింగ్‌ను చేర్చండి
5. **ఖర్చు కోసం ప్లాన్ చేయండి**: టోకెన్ వినియోగాన్ని మానిటర్ చేసి, బడ్జెట్ అలర్ట్‌లను ముందుగానే సెటప్ చేయండి

### నివారించాల్సిన సాధారణ తప్పులు:

- ❌ కోడ్‌లో API కీలు హార్డ్‌కోడ్ చేయడం
- ❌ సరైన మానిటరింగ్ సెటప్ చేయకపోవడం
- ❌ ఖర్చు ఆప్టిమైజేషన్‌ను నిర్లక్ష్యం చేయడం
- ❌ వైఫల్య పరిస్థితులను పరీక్షించకపోవడం
- ❌ హెల్త్ చెక్స్ లేకుండా డిప్లాయ్ చేయడం

## అదనపు వనరులు

- **Azure వెల్-ఆర్కిటెక్టెడ్ ఫ్రేమ్‌వర్క్**: [AI వర్క్‌లోడ్ గైడెన్స్](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry డాక్యుమెంటేషన్**: [అధికారిక డాక్స్](https://learn.microsoft.com/azure/ai-studio/)
- **కమ్యూనిటీ టెంప్లేట్స్**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord కమ్యూనిటీ**: [#Azure ఛానల్](https://discord.gg/microsoft-azure)

---

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ఫర్ బిగినర్స్](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: చాప్టర్ 8 - ప్రొడక్షన్ & ఎంటర్‌ప్రైజ్ ప్యాటర్న్స్
- **⬅️ గత చాప్టర్**: [చాప్టర్ 7: ట్రబుల్‌షూటింగ్](../troubleshooting/debugging.md)
- **⬅️ సంబంధిత అంశం**: [AI వర్క్‌షాప్ ల్యాబ్](ai-workshop-lab.md)
- **🎆 కోర్సు పూర్తి**: [AZD ఫర్ బిగినర్స్](../../README.md)

**గమనించండి**: ప్రొడక్షన్ AI వర్క్‌లోడ్స్ జాగ్రత్తగా ప్లానింగ్, మానిటరింగ్, మరియు నిరంతర ఆప్టిమైజేషన్ అవసరం. ఈ ప్యాటర్న్స్‌తో ప్రారంభించి, మీ ప్రత్యేక అవసరాలకు అనుగుణంగా వాటిని అనుసరించండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:  
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదం సిఫారసు చేయబడుతుంది. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->