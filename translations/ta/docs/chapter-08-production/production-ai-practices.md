# AZD உடன் உற்பத்தி AI பணிப்பொருட்களின் சிறந்த நடைமுறைகள்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பர்களுக்காக](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 8 - உற்பத்தி & நிறுவன வடிவமைப்புகள்
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 7: பிழைச் சரிசெய்தல்](../chapter-07-troubleshooting/debugging.md)
- **⬅️ கூட தொடர்புடையது**: [AI பட்டறை ஆய்வகம்](ai-workshop-lab.md)
- **🎯 பாடநெறி முடிந்தது**: [AZD ஆரம்பர்களுக்காக](../../README.md)

## மேலோட்டம்

இந்த முதன்மை வழிகாட்டி Azure Developer CLI (AZD) பயன்படுத்தி உற்பத்திக்கு தயார் AI பணிப்பொருட்களை desple செய்பவர்களுக்கான விரிவான சிறந்த நடைமுறைகளை வழங்குகிறது. Microsoft Foundry Discord சமுதாயத்தின் கருத்துக்களிலும் நிஜ வாடிக்கையாளர் பிரசுரங்களிலும் அடிப்படையாக கொண்ட இந்த நடைமுறைகள் உற்பத்தி AI அமைப்புகளில் பொதுவாக எதிர்கொள்ளப்படும் சவால்களுக்கான தீர்வுகளை சமர்ப்பிக்கின்றன.

## தீர்க்கப்பட வேண்டிய முக்கிய சவால்கள்

எங்கள் சமுதாயம் நடத்திய சர்வே முடிவுகளின் அடிப்படையில், வளர்ப்பாளர்கள் எதிர்கொள்ளும் முன்னணி சவால்கள் இவை:

- **45%** பல-சேவை AI பிரசுரங்களில் சிரமப்படுகிறார்கள்
- **38%** கடவுச்சொற்கள் மற்றும் ரகசிய மேலாண்மையில் பிரச்சினைகள்  
- **35%** உற்பத்தி தயார் நிலை மற்றும் ஸ்கேலிங் கடினமாக உள்ளது
- **32%** சிறந்த செலவு உத்தீர்களைத் தேவைப்படுகின்றனர்
- **29%** மேம்பட்ட கண்காணிப்பு மற்றும் பிழைச் சரிசெய்தல் தேவை

## உற்பத்தி AIக்கான கட்டமைப்பு மாதிரிகள்

### மாதிரி 1: மைக்ரோசர்வீசஸ் AI கட்டமைப்பு

**பயன்படுத்த வேண்டிய போது**: பல திறன்களை கொண்ட சிக்கலான AI பயன்பாடுகள்

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

**AZD செயல்படுத்தல்**:

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

### மாதிரி 2: நிகழ்வுக்கேற்ப AI செயலாக்கம்

**பயன்படுத்த வேண்டிய போது**: தொகுதி செயலாக்கம், ஆவணம் பகுப்பாய்வு, அசிங்க் வேலைபாடுகள்

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

## பாதுகாப்பு சிறந்த நடைமுறைகள்

### 1. Zero-Trust பாதுகாப்பு முறைமை

**செயல்படுத்தும் முறை**:
- அங்கீகாரம் இல்லாமல் சேவை-திலிருந்து-சேவை தொடர்பு இல்லை
- எல்லா API அழைப்புகளும் நிர்வகிக்கப்பட்ட அடையாளங்களை (managed identities) பயன்படுத்தும்
- தனியார் endpoints மூலம் நெட்வொர்க் தனிமை
- குறைந்த உரிமையுடன் அணுகல் கட்டுப்பாடுகள்

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

### 2. பாதுகாப்பான ரகசிய மேலாண்மை

**Key Vault ஒருங்கிணைப்பு மாதிரி**:

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

### 3. நெட்வொர்க் பாதுகாப்பு

**தனியார் Endpoint கட்டமைப்பு**:

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

## செயல்திறன் மற்றும் அளவீடு

### 1. தானியங்கி அளவீட்டு உத்திகள்

**Container Apps தானாக அளவீடு**:

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

### 2. கேஷிங் உத்திகள்

**AI பதில்களுக்கான Redis கேச்**:

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

### 3. சுமை சமநிலை மற்றும் போக்குவரத்து நிர்வாகம்

**WAF உடன் Application Gateway**:

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

## 💰 செலவு சிறப்படுத்தல்

### 1. வளங்கள் சரியான அளவில் அமைத்தல்

**சூழல்-சார்ந்த கட்டமைப்புகள்**:

```bash
# வளர்ச்சி சூழ்நிலை
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# உற்பத்தி சூழ்நிலை
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. செலவு கண்காணிப்பு மற்றும் பட்ஜெட்

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

### 3. டோக்கன் பயன்பாடு சிறப்படுத்தல்

**OpenAI செலவு மேலாண்மை**:

```typescript
// பயன்பாட்டுநிலை டோக்கன் சிறப்பாக்கம்
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // பயனர் உள்ளீட்டை அல்லாமல், சூழல்தகவலை சுருக்கவும்
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // சுமார் மதிப்பீடு: 1 டோக்கன் ≈ 4 எழுத்துகள்
    return Math.ceil(text.length / 4);
  }
}
```

## கண்காணிப்பு மற்றும் பார்வைத்திறன் (Observability)

### 1. விரிவான Application Insights

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

### 2. AI-க்கு பிரத்யேகமான கண்காணிப்பு

**AI அளவுருகளுக்கான தனிப்பயன் டேஷ்போர்டுகள்**:

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

### 3. உடல்நிலைச் சோதனைகள் மற்றும் செயல்பாட்டு நேர கண்காணிப்பு

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

## பேரழிவு மீட்பு மற்றும் உயர்ந்த கிடைக்கும் தன்மை

### 1. பல பிரதேசங்களில் பிரசுரம்

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

### 2. தரவுக் காப்புப்பிரதி மற்றும் மீட்பு

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

## DevOps மற்றும் CI/CD ஒருங்கிணைப்பு

### 1. GitHub Actions வேலைநெறி

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

### 2. அடித்தள அமைப்பு சரிபார்ப்பு

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# அனைத்து தேவையான சேவைகள் இயங்குகிறதா என்பதைச் சரிபார்க்கவும்
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI மாடல் டிப்லாய்மெண்டுகளை சரிபார்க்கவும்
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI சேவை இணைப்புத்திறனை சோதிக்கவும்
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## உற்பத்தி தயார் நிலை சரிபார்க்கும் பட்டியல்

### பாதுகாப்பு ✅
- [ ] எல்லா சேவைகளும் நிர்வகிக்கப்பட்ட அடையாளங்களை பயன்படுத்துகின்றன
- [ ] Key Vault இல் ரகசியங்கள் சேமிக்கப்பட்டுள்ளன
- [ ] தனியார் endpoints அமைக்கப்பட்டுள்ளன
- [ ] நெட்வொர்க் பாதுகாப்பு குழுக்கள் செயல்படுத்தப்பட்டுள்ளன
- [ ] குறைந்தபட்ச உரிமையுடன் RBAC
- [ ] பொது endpoints இல் WAF இயக்கப்பட்டுள்ளது

### செயல்திறன் ✅
- [ ] தானாக அளவீடு அமைக்கப்பட்டுள்ளது
- [ ] கேஷிங் செயல்படுத்தப்பட்டது
- [ ] சுமை சமநிலை அமைக்கப்பட்டுள்ளது
- [ ] நிலையான உள்ளடக்கங்களுக்கான CDN
- [ ] தரவுத்தள இணைப்புப் பூலிங்
- [ ] டோக்கன் பயன்பாடு சிறப்படுத்தல்

### கண்காணிப்பு ✅
- [ ] Application Insights அமைக்கப்பட்டுள்ளது
- [ ] தனிப்பயன் அளவுருக்கள் வரையறுக்கப்பட்டுள்ளன
- [ ] எச்சரிக்கை விதிகள் அமைக்கப்பட்டுள்ளன
- [ ] டேஷ்போர்டு உருவாக்கப்பட்டுள்ளது
- [ ] உடல்நிலைச் சோதனைகள் செயல்படுத்தப்பட்டுள்ளன
- [ ] பதிவுகள் பாதுகாக்கும் கொள்கைகள்

### நம்பகத்தன்மை ✅
- [ ] பல பிரதேசங்களில் பிரசுரம்
- [ ] காப்பு மற்றும் மீட்பு திட்டம்
- [ ] சர்க்கிட் பிரேக்கர்கள் செயல்படுத்தப்பட்டுள்ளன
- [ ] மீண்டும் முயற்சி கொள்கைகள் அமைக்கப்பட்டுள்ளன
- [ ] மென்மையான குறைவு
- [ ] உடல்நிலைச் சோதனை endpoints

### செலவு மேலாண்மை ✅
- [ ] பட்ஜெட் எச்சரிக்கைகள் அமைக்கப்பட்டுள்ளன
- [ ] வளங்களின் சரியான அளவீடு
- [ ] Dev/test தள்ளுபடியுகள் பயன்படுத்தப்பட்டுள்ளன
- [ ] முன்பதிவு செய்யப்பட்ட இன்ஸ்டான்ஸ்கள் வாங்கப்பட்டுள்ளன
- [ ] செலவு கண்காணிப்பு டேஷ்போர்டு
- [ ] நிரந்தர செலவு மதிப்பீடுகள்

### ஒழுங்கு விதிகள் (Compliance) ✅
- [ ] தரவு இருப்பிட தேவைகள் பூர்த்தி செய்யப்பட்டுள்ளன
- [ ] ஆடிட் பதிவு இயக்கப்பட்டுள்ளது
- [ ] ஒழுங்கு கொள்கைகள் பொருத்தப்பட்டுள்ளன
- [ ] பாதுகாப்பு அடிப்படை வரையறைகள் செயல்படுத்தப்பட்டுள்ளன
- [ ] பொதுவான பாதுகாப்பு மதிப்பீடுகள்
- [ ] சம்பவப் பதிலுத் திட்டம்

## செயல்திறன் தரநிலைகள்

### சாதாரண உற்பத்தி அளவுகள்

| Metric | Target | Monitoring |
|--------|--------|------------|
| **பதில் நேரம்** | < 2 விநாடிகள் | Application Insights |
| **கிடைக்கும் விகிதம்** | 99.9% | செயல்பாடு நேர கண்காணிப்பு |
| **பிழை விகிதம்** | < 0.1% | Application பதிவுகள் |
| **டோக்கன் பயன்பாடு** | < $500/மாதம் | செலவு மேலாண்மை |
| **ஒரே நேரத்தில் உள்ள பயனர்கள்** | 1000+ | சுமை சோதனை |
| **மீட்பு நேரம்** | < 1 மணிநேரம் | பேரழிவு மீட்பு சோதனைகள் |

### சுமை சோதனை

```bash
# ஏஐ பயன்பாடுகளுக்கான சுமை சோதனை ஸ்கிரிப்ட்
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 சமுதாய சிறந்த நடைமுறைகள்

Microsoft Foundry Discord சமுதாய கருத்துக்களின் அடிப்படையில்:

### சமுதாயத்திலிருந்து முக்கிய பரிந்துரைகள்:

1. **சிறியதாக தொடங்கு, படிப்படியாக வளர்க**: அடிப்படை SKU-களுடன் துவங்கி, உண்மையான பயன்பாட்டின் அடிப்படையில் அளவை அதிகரிக்கவும்
2. **எல்லாவற்றையும் கண்காணிக்கவும்**: முதல் நாளிலேயே விரிவான கண்காணிப்பினை அமைக்கவும்
3. **பாதுகாப்பை தானாகச் செய்யவும்**: ஒரே மாதிரியில் பாதுகாப்பை உறுதிசெய்ய Infrastructure as Code ஐப் பயன்படுத்தவும்
4. **முழுமையாக சோதிக்கவும்**: உங்கள் பணிநெறியில் AI-க்கு சொந்தமான சோதனைகளை சேர்க்கவும்
5. **செலவுக்கு திட்டமிடுங்கள்**: டோக்கன் பயன்பாட்டை கண்காணித்து பட்ஜெட் எச்சரிக்கைகளை ஆரம்பத்தில் அமைக்கவும்

### தவிர்க்க வேண்டிய பொதுவான தவறுகள்:

- ❌ API விசைகளை நேரடியாக கோடியில் எழுதுவது
- ❌ தகுந்த கண்காணிப்பை அமைக்காமை
- ❌ செலவு மேம்பாட்டை புறக்கணித்தல்
- ❌ தோல்வி சூழ்நிலைகளை சோதிக்காமை
- ❌ உடல்நிலைச் சோதனைகள் இல்லாமல் பிரசுரம் செய்தல்

## கூடுதல் ஆதாரங்கள்

- **Azure Well-Architected Framework**: [AI பணியளிக்கல் வழிகாட்டி](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [அதிகாரப்பூர்வ ஆவணங்கள்](https://learn.microsoft.com/azure/ai-studio/)
- **சமூக டெம்ப்ளேட்கள்**: [Azure உதாரணங்கள்](https://github.com/Azure-Samples)
- **Discord சமுதாயம்**: [#Azure சேனல்](https://discord.gg/microsoft-azure)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பர்களுக்காக](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 8 - உற்பத்தி & நிறுவன வடிவமைப்புகள்
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 7: பிழைச் சரிசெய்தல்](../chapter-07-troubleshooting/debugging.md)
- **⬅️ கூட தொடர்புடையது**: [AI பட்டறை ஆய்வகம்](ai-workshop-lab.md)
- **🎆 பாடநெறி முடிந்தது**: [AZD ஆரம்பர்களுக்காக](../../README.md)

**குறிப்பு**: உற்பத்தி AI பணிப்பொருட்களுக்கு கவனமுடன் திட்டமிடல், கண்காணிப்பு மற்றும் தொடர்ந்த சிறப்படுத்தல் அவசியம். இந்த மாதிரிகளிலிருந்து தொடங்கி, உங்கள் குறிப்பிட்ட தேவைகளுக்கு ஏற்ப அவைகளைத் தகுந்தபடி மாற்றிக் கொள்ளுங்கள்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:

இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயன்றாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான விளக்கங்கள் இருப்பதற்கு வாய்ப்பு உள்ளது என்பதை தயவுசெய்து கவனிக்கவும். அசல் ஆவணம் அதன் சொந்த மொழியிலுள்ள பதிப்பே அதிகாரப்பூர்வ ஆதாரமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு தொழில்முறை மனித மொழிபெயர்ப்பை பயன்படுத்துவது பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்புப் பட்டிருக்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->