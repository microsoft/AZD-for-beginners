# AZD తో ప్రొడక్షన్ AI వర్క్‌లోడ్ ఉత్తమ పద్ధతులు

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ మునుపటి అధ్యాయం**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ సంబంధిత**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 కోర్సు పూర్తి**: [AZD ప్రారంభికులకు](../../README.md)

## అవలోకనం

ఈ మార్గదర్శకము Azure Developer CLI (AZD) ఉపయోగించి ప్రొడక్షన్-రెడీ AI వర్క్‌లోడ్లను డిప్లాయ్ చేయడానికి సమగ్ర ఉత్తమ పద్ధతులను అందిస్తుంది. Microsoft Foundry Discord సమూహం నుండి ప్రাপ্ত ఫీడ్‌బ్యాక్ మరియు నిజ ప్రపంచ కస్టమర్ డిప్లాయ్‌మెంట్ల ఆధారంగా, ఈ పద్ధతులు ప్రొడక్షన్ AI వ్యవస్థలలో సాధారణంగా ఎదురయ్యే సవాళ్లను పరిష్కరిస్తాయి.

## పరిష్కరించబడే ప్రధాన సవాళ్లు

మన కమ్యూనిటీ పోల్స్ ఫలితాల ఆధారంగా, డెవలపర్లు ఎదుర్కొంటున్న ప్రముఖ సవాళ్లు ఇవే:

- **45%** బహు-సేవల AI డిప్లాయ్‌మెంట్లలో ఇబ్బందులు
- **38%** క్రెడెన్షియల్ మరియు రహస్య నిర్వహణ సమస్యలు ఉన్నాయి  
- **35%** ప్రొడక్షన్ రెడినెస్ మరియు స్కేలింగ్ కష్టం
- **32%** మంచి ఖర్చు ఆప్టిమైజేషన్ వ్యూహాల అవసరం
- **29%** మానిటరింగ్ మరియు ట్రబుల్షూటింగ్ మెరుగుపరచాల్సి ఉంది

## ప్రొడక్షన్ AI కోసం ఆర్కిటెక్చర్ నమూనాలు

### నమూనా 1: మైక్రోసర్వీసెస్ AI ఆర్కిటెక్చర్

**ఎప్పుడు ఉపయోగించాలి**: బహుముఖ్యమైన సామర్థ్యాలు కలిగిన సంక్లిష్ట AI అప్లికేషన్లు

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

### నమూనా 2: ఈవెంట్-డ్రైవెన్ AI ప్రాసెసింగ్

**ఎప్పుడు ఉపయోగించాలి**: బ్యాచ్ ప్రాసెసింగ్, డాక్యుమెంట్ విశ్లేషణ, అసింక్ వర్క్ ఫ్లోస్

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

## భద్రత ఉత్తమ పద్ధతులు

### 1. జీరో-ట్రస్ట్ భద్రతా నమూనా

**అమలు విధానం**:
- ఆథెంటికేషన్ లేకుండా సర్వీస్-టు-సర్వీస్ కమ్యూనికేషన్ ఉండరాదు
- అన్ని API కాల్స్ మేనేజ్డ్ ఐడెంటిటీస్ ఉపయోగిస్తాయి
- ప్రైవేట్ ఎండ్‌పాయింట్లతో నెట్‌వర్క్ వేరుచేసివేత
- కనిష్ట హక్కుల యాక్సెస్ నియంత్రణలు

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

### 2. రహస్యాల సురక్షిత నిర్వహణ

**Key Vault ఇంటిగ్రేషన్ నమూనా**:

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

### 3. నెట్‌వర్క్ భద్రత

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

### 1. ఆటో-స్కేలింగ్ విధానాలు

**కంటెయినర్ యాప్స్ ఆటో-స్కేలింగ్**:

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

### 2. క్యాషింగ్ విధానాలు

**AI స్పందనల కోసం Redis క్యాష్**:

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

### 3. లోడ్ బలాన్సింగ్ మరియు ట్రాఫిక్ నిర్వహణ

**WAFతో అప్లికేషన్ గేట్‌వే**:

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

**పరిసర-నిర్ధారిత కాన్ఫిగరేషన్లు**:

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

### 2. ఖర్చు పరిశీలన మరియు బడ్జెట్లు

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

**OpenAI ఖర్చు నిర్వహణ**:

```typescript
// అప్లికేషన్-స్థాయి టోకెన్ ఆప్టిమైజేషన్
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // సందర్భాన్ని సంక్షేపించండి, వినియోగదారు ఇన్‌పుట్‌ను కాదు
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

## మానిటరింగ్ మరియు పరిశీలన

### 1. సమగ్ర Application Insights

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

**AI మెట్రిక్స్ కోసం కస్టమ్ డాష్‌బోర్డ్లు**:

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

### 1. బహుళ-రీజియన్ డిప్లాయ్‌మెంట్

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

## DevOps మరియు CI/CD సమీకరణ

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

### 2. ఇన్‌ఫ్రాస్ట్రక్చర్ ధృవీకరణ

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# అవసరమైన అన్ని సేవలు నడుస్తున్నాయో లేదో తనిఖీ చేయండి
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

## ప్రొడక్షన్ సిద్ధత చెక్‌లిస్ట్

### భద్రత ✅
- [ ] అన్ని సేవలు మేనేజ్డ్ ఐడెంటిటీస్ ఉపయోగిస్తాయి
- [ ] రహస్యాలు Key Vault లో నిల్వ చేయబడ్డాయి
- [ ] ప్రైవేట్ ఎండ్‌పాయింట్లు కాన్ఫిగర్ చేయబడ్డాయి
- [ ] నెట్‌వర్క్ సెక్యూరిటీ గ్రూప్స్ అమలు చేయబడ్డాయి
- [ ] కనిష్ట హక్కులతో RBAC
- [ ] పబ్లిక్ ఎండ్‌పాయింట్లపై WAF యాక్టివ్

### పనితీరు ✅
- [ ] ఆటో-స్కేలింగ్ కాన్ఫిగర్ చేయబడ్డది
- [ ] క్యాషింగ్ అమలు చేయబడ్డది
- [ ] లోడ్ బలాన్సింగ్ సెటప్
- [ ] స్టాటిక్ కంటెంట్ కోసం CDN
- [ ] డేటాబేస్ కనెక్షన్ పూలింగ్
- [ ] టోకెన్ వినియోగ ఆప్టిమైజేషన్

### మానిటరింగ్ ✅
- [ ] Application Insights కాన్ఫిగర్ చేయబడింది
- [ ] కస్టమ్ మెట్రిక్స్ నిర్వచించబడ్డాయి
- [ ] అలర్టింగ్ రూల్స్ సెటప్ చేయబడ్డాయి
- [ ] డాష్‌బోర్డ్ సృష్టించబడింది
- [ ] హెల్త్ చెక్స్ అమలు చేయబడ్డాయి
- [ ] లాగ్ రిటెన్షన్ పాలసీలు

### విశ్వసనీయత ✅
- [ ] బహుళ-రిజియన్ డిప్లాయ్‌మెంట్
- [ ] బ్యాకప్ మరియు రికవరీ ప్లాన్
- [ ] సెర్క్యూట్ బ్రేకర్లు అమలు చేయబడ్డాయి
- [ ] రీట్రై పాలసీలు కాన్ఫిగర్ చేయబడ్డాయి
- [ ] గ్రేస్ఫుల్ డిగ్రాడేషన్
- [ ] హెల్త్ చెక్ ఎండ్‌పాయింట్లు

### ఖర్చు నిర్వహణ ✅
- [ ] బడ్జెట్ అలర్ట్స్ కాన్ఫిగర్ చేయబడ్డాయి
- [ ] రిసోర్స్ రైట్-సైజింగ్
- [ ] డెవ్/టెస్ట్ డిస్కౌంట్లు వర్తింపబడ్డాయి
- [ ] రిజర్వ్డ్ ఇన్‌స్టాన్సులు కొనుగోలు చేయబడ్డాయి
- [ ] ఖర్చు మానిటరింగ్ డాష్‌బోర్డ్
- [ ] నియమిత ఖర్చు సమీక్షలు

### కంప్లయన్సు ✅
- [ ] డేటా రెసిడెన్సీ అవసరాలు తీర్చబడ్డాయి
- [ ] ఆడిట్ లాగింగ్ ఎనేబుల్ చేయబడింది
- [ ] కంప్లయన్సు పాలసీలు వర్తింపబడ్డాయి
- [ ] సెక్యూరిటీ బేస్‌లైన్స్ అమలు చేయబడ్డాయి
- [ ] నియమిత భద్రతా మూల్యాంకనాలు
- [ ] ఇన్సిడెంట్ రెస్పాన్స్ ప్లాన్

## పనితీరు బెంచ్‌మార్కులు

### సాధారణ ప్రొడక్షన్ మెట్రిక్స్

| మెట్రిక్ | లక్ష్యం | మానిటరింగ్ |
|--------|--------|------------|
| **స్పందన సమయం** | < 2 seconds | Application Insights |
| **లభ్యత** | 99.9% | అప్టైమ్ మానిటరింగ్ |
| **పొరపాటు రేటు** | < 0.1% | అప్లికేషన్ లాగ్స్ |
| **టోకెన్ వినియోగం** | < $500/month | ఖర్చు నిర్వహణ |
| **సమకాలిక వినియోగదారులు** | 1000+ | లోడ్ టెస్టింగ్ |
| **పునరుద్ధరణ సమయం** | < 1 hour | డిజాస్టర్ రికవరీ పరీక్షలు |

### లోడ్ టెస్టింగ్

```bash
# AI అప్లికేషన్ల కోసం లోడ్ టెస్టింగ్ స్క్రిప్ట్
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 కమ్యునిటీ ఉత్తమ పద్ధతులు

Microsoft Foundry Discord కమ్యూనిటీ ఫీడ్‌బ్యాక్ ఆధారంగా:

### కమ్యూనిటీ నుండి టాప్ సూచనలు:

1. **చిన్నదిగా మొదలు పెట్టండి, التدريجగా పెంపొందించండి**: ప్రాథమిక SKUs తో ప్రారంభించి వాస్తవ వినియోగం ఆధారంగా స్కేల్ చేయండి
2. **అన్నింటినీ మానిటర్ చేయండి**: మొదటి రోజునే సమగ్ర మానిటరింగ్ సెటప్ చేయండి
3. **భద్రతను ఆటోమేటె చేయండి**: స్థిరభద్రత కోసం ഇൻఫ్రాస్ట్రక్చర్ as కోడ్ ఉపయోగించండి
4. **పూర్తిగా పరీక్షించండి**: మీ పైప్లైన్‌లో AI-గణన సంబంధిత పరీక్షలను చేర్చండి
5. **ఖర్చుల కోసం ప్రణాళిక చేయండి**: టోకెన్ వినియోగాన్ని మానిటర్ చేయండి మరియు తొందరగా బడ్జెట్ అలర్ట్స్ సెట్ చేయండి

### నివారించవలసిన సామాన్య పొరపాట్లు:

- ❌ కోడ్‌లో API కీస్‌ను హార్డ్‌కోడ్ చేయడం
- ❌ సరైన మానిటరింగ్ సెటప్ చేయకపోవడం
- ❌ ఖర్చు ఆప్టిమైజేషన్‌ను పక్కన పెట్టడం
- ❌ ఫెయిల్యూర్ సన్నివేశాలను పరీక్షించకపోవడం
- ❌ హెల్త్ చెక్స్ లేకుండా డిప్లాయ్ చేయడం

## అదనపు వనరులు

- **Azure Well-Architected Framework**: [AI వర్క్‌లోడ్ మార్గదర్శకత్వం](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [అధికారిక డాక్స్](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure నమూనాలు](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure చానల్](https://discord.gg/microsoft-azure)

---

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ మునుపటి అధ్యాయం**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ సంబంధిత**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎆 కోర్సు పూర్తి**: [AZD ప్రారంభికులకు](../../README.md)

**గుర్తుంచుకోండి**: ప్రొడక్షన్ AI వర్క్‌లోడ్లు జాగ్రత్తగా ప్రణాళిక, మానిటరింగ్, మరియు నిరంతర ఆప్టిమైజేషన్ అవసరం. ఈ నమూనాలతో ప్రారంభించి అవి మీ నిర్దిష్ట అవసరాలకు అనుగుణంగా మార్చుకోండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ పత్రాన్ని AI అనువాద సేవ Co‑op Translator (https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా అసమీపతలు ఉండవచ్చు. మూల పత్రాన్ని దాని మాతృభాషలోని ప్రామాణిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫార్సు చేయబడుతుంది. ఈ అనువాద వినియోగం వలన ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలకోసం మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->