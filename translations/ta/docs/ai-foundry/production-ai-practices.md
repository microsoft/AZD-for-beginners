<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e2706bfe15e4801ded418f5c1de39212",
  "translation_date": "2025-10-11T16:03:06+00:00",
  "source_file": "docs/ai-foundry/production-ai-practices.md",
  "language_code": "ta"
}
-->
# AZD மூலம் உற்பத்தி AI பணிகளுக்கான சிறந்த நடைமுறைகள்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்கட்டம்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 8 - உற்பத்தி மற்றும் நிறுவன வடிவங்கள்
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 7: பிழை தீர்வு](../troubleshooting/debugging.md)
- **⬅️ தொடர்புடையது**: [AI பணிக்கூடம் ஆய்வகம்](ai-workshop-lab.md)
- **🎯 பாடநெறி முடிந்தது**: [AZD ஆரம்பக்கட்டம்](../../README.md)

## கண்ணோட்டம்

இந்த வழிகாட்டி Azure Developer CLI (AZD) பயன்படுத்தி உற்பத்திக்கு தயாரான AI பணிகளை வெளியிடுவதற்கான விரிவான சிறந்த நடைமுறைகளை வழங்குகிறது. Azure AI Foundry Discord சமூகத்திலிருந்து பெறப்பட்ட கருத்துகள் மற்றும் உண்மையான வாடிக்கையாளர் வெளியீடுகளின் அடிப்படையில், இந்த நடைமுறைகள் உற்பத்தி AI அமைப்புகளில் பொதுவாக எதிர்கொள்ளப்படும் சவால்களை தீர்க்க உதவுகின்றன.

## முக்கிய சவால்கள்

சமூக கருத்துக்கணிப்பு முடிவுகளின் அடிப்படையில், டெவலப்பர்கள் எதிர்கொள்ளும் முக்கிய சவால்கள் இவை:

- **45%** பல சேவை AI வெளியீடுகளில் சிக்கல்
- **38%** அங்கீகாரம் மற்றும் ரகசிய மேலாண்மையில் சிக்கல்  
- **35%** உற்பத்தி தயார்நிலை மற்றும் அளவீட்டில் சிக்கல்
- **32%** செலவுகளை சிறப்பாக மேம்படுத்த தேவையுள்ளது
- **29%** கண்காணிப்பு மற்றும் பிழை தீர்வை மேம்படுத்த வேண்டும்

## உற்பத்தி AI க்கான கட்டமைப்பு வடிவங்கள்

### வடிவம் 1: மைக்ரோசேவை AI கட்டமைப்பு

**எப்போது பயன்படுத்த வேண்டும்**: பல திறன்களுடன் கூடிய சிக்கலான AI பயன்பாடுகள்

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

### வடிவம் 2: நிகழ்வு சார்ந்த AI செயலாக்கம்

**எப்போது பயன்படுத்த வேண்டும்**: தொகுதி செயலாக்கம், ஆவண பகுப்பாய்வு, அசிங்க செயல்பாடுகள்

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

### 1. சுழற்சியற்ற பாதுகாப்பு முறை

**செயல்படுத்தல் உத்தி**:
- அங்கீகாரம் இல்லாமல் சேவை-சேவை தொடர்பு இல்லை
- அனைத்து API அழைப்புகளும் நிர்வகிக்கப்பட்ட அடையாளங்களை பயன்படுத்தும்
- தனியார் முடிவுகளுடன் நெட்வொர்க் தனிமைப்படுத்தல்
- குறைந்த அனுமதி அணுகல் கட்டுப்பாடுகள்

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

**Key Vault ஒருங்கிணைப்பு வடிவம்**:

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

**தனியார் முடிவு அமைப்பு**:

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

### 1. தானியங்கு-அளவீட்டு உத்திகள்

**கண்டெய்னர் பயன்பாடுகள் தானியங்கு-அளவீடு**:

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

**Redis கேஷ் AI பதில்களுக்கு**:

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

### 3. சுமை சமநிலை மற்றும் போக்குவரத்து மேலாண்மை

**Application Gateway WAF உடன்**:

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

## 💰 செலவு மேம்பாடு

### 1. வள அளவீடு சரிசெய்தல்

**சுற்றுச்சூழல்-குறிப்பிட்ட அமைப்புகள்**:

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

### 2. செலவு கண்காணிப்பு மற்றும் பட்ஜெட்டுகள்

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

### 3. டோக்கன் பயன்பாடு மேம்பாடு

**OpenAI செலவு மேலாண்மை**:

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

## கண்காணிப்பு மற்றும் பார்வையிடல்

### 1. விரிவான பயன்பாட்டு தகவல்கள்

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

### 2. AI-குறிப்பிட்ட கண்காணிப்பு

**AI அளவீடுகளுக்கான தனிப்பயன் டாஷ்போர்டுகள்**:

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

### 3. ஆரோக்கிய சோதனைகள் மற்றும் செயல்நிலை கண்காணிப்பு

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

## பேரழிவு மீட்பு மற்றும் உயர் கிடைக்கும் தன்மை

### 1. பல-பிராந்திய வெளியீடு

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

### 2. தரவுப் பேக்கப் மற்றும் மீட்பு

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

### 1. GitHub Actions பணிச்செலுத்தல்

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

### 2. உள்கட்டமைப்பு சரிபார்ப்பு

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

## உற்பத்தி தயார்நிலை சரிபார்ப்பு பட்டியல்

### பாதுகாப்பு ✅
- [ ] அனைத்து சேவைகளும் நிர்வகிக்கப்பட்ட அடையாளங்களை பயன்படுத்தும்
- [ ] ரகசியங்கள் Key Vault இல் சேமிக்கப்பட்டுள்ளன
- [ ] தனியார் முடிவுகள் அமைக்கப்பட்டுள்ளன
- [ ] நெட்வொர்க் பாதுகாப்பு குழுக்கள் செயல்படுத்தப்பட்டுள்ளன
- [ ] குறைந்த அனுமதி RBAC
- [ ] பொது முடிவுகளில் WAF செயல்படுத்தப்பட்டது

### செயல்திறன் ✅
- [ ] தானியங்கு-அளவீடு அமைக்கப்பட்டது
- [ ] கேஷிங் செயல்படுத்தப்பட்டது
- [ ] சுமை சமநிலை அமைக்கப்பட்டது
- [ ] நிலையான உள்ளடக்கத்திற்கான CDN
- [ ] தரவுத்தொகுப்பு இணைப்பு குழுமம்
- [ ] டோக்கன் பயன்பாடு மேம்பாடு

### கண்காணிப்பு ✅
- [ ] பயன்பாட்டு தகவல்கள் அமைக்கப்பட்டது
- [ ] தனிப்பயன் அளவீடுகள் வரையறுக்கப்பட்டுள்ளன
- [ ] எச்சரிக்கை விதிகள் அமைக்கப்பட்டுள்ளன
- [ ] டாஷ்போர்டு உருவாக்கப்பட்டது
- [ ] ஆரோக்கிய சோதனைகள் செயல்படுத்தப்பட்டுள்ளன
- [ ] பதிவு வைத்திருப்பு கொள்கைகள்

### நம்பகத்தன்மை ✅
- [ ] பல-பிராந்திய வெளியீடு
- [ ] பேக்கப் மற்றும் மீட்பு திட்டம்
- [ ] சுற்று முறைகள் செயல்படுத்தப்பட்டுள்ளன
- [ ] மீண்டும் முயற்சி கொள்கைகள் அமைக்கப்பட்டுள்ளன
- [ ] மென்மையான சிதைவு
- [ ] ஆரோக்கிய சோதனை முடிவுகள்

### செலவு மேலாண்மை ✅
- [ ] பட்ஜெட் எச்சரிக்கைகள் அமைக்கப்பட்டுள்ளன
- [ ] வள அளவீடு சரிசெய்தல்
- [ ] Dev/test தள்ளுபடி பயன்படுத்தப்பட்டது
- [ ] முன்பதிவு செய்யப்பட்ட நிகழ்வுகள் வாங்கப்பட்டுள்ளன
- [ ] செலவு கண்காணிப்பு டாஷ்போர்டு
- [ ] வழக்கமான செலவு மதிப்பீடுகள்

### இணக்கம் ✅
- [ ] தரவுக் குடியிருப்பு தேவைகள் பூர்த்தி செய்யப்பட்டுள்ளன
- [ ] ஆடிட் பதிவு செயல்படுத்தப்பட்டது
- [ ] இணக்கம் கொள்கைகள் பயன்படுத்தப்பட்டுள்ளன
- [ ] பாதுகாப்பு அடிப்படைகள் செயல்படுத்தப்பட்டுள்ளன
- [ ] வழக்கமான பாதுகாப்பு மதிப்பீடுகள்
- [ ] சம்பவம் பதிலளிப்பு திட்டம்

## செயல்திறன் அளவீடுகள்

### வழக்கமான உற்பத்தி அளவீடுகள்

| அளவீடு | இலக்கு | கண்காணிப்பு |
|--------|--------|------------|
| **பதிலளிக்கும் நேரம்** | < 2 விநாடிகள் | பயன்பாட்டு தகவல்கள் |
| **கிடைக்கும் தன்மை** | 99.9% | செயல்நிலை கண்காணிப்பு |
| **பிழை விகிதம்** | < 0.1% | பயன்பாட்டு பதிவுகள் |
| **டோக்கன் பயன்பாடு** | < $500/மாதம் | செலவு மேலாண்மை |
| **ஒரே நேரத்தில் பயனர்கள்** | 1000+ | சுமை சோதனை |
| **மீட்பு நேரம்** | < 1 மணி | பேரழிவு மீட்பு சோதனைகள் |

### சுமை சோதனை

```bash
# Load testing script for AI applications
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 சமூக சிறந்த நடைமுறைகள்

Azure AI Foundry Discord சமூக கருத்துகளின் அடிப்படையில்:

### சமூகத்தின் முக்கிய பரிந்துரைகள்:

1. **சிறியதாக தொடங்குங்கள், படிப்படியாக அளவீடு செய்யுங்கள்**: அடிப்படை SKUs உடன் தொடங்கி, உண்மையான பயன்பாட்டின் அடிப்படையில் அளவீடு செய்யுங்கள்
2. **எல்லாவற்றையும் கண்காணிக்கவும்**: முதல் நாளிலிருந்து விரிவான கண்காணிப்பை அமைக்கவும்
3. **பாதுகாப்பை தானியங்கமாக்கவும்**: ஒற்றுமையான பாதுகாப்புக்கான உள்கட்டமைப்பை குறியீடாக பயன்படுத்தவும்
4. **முழுமையாக சோதிக்கவும்**: உங்கள் குழியில் AI-குறிப்பிட்ட சோதனைகளை சேர்க்கவும்
5. **செலவுகளை திட்டமிடுங்கள்**: டோக்கன் பயன்பாட்டை கண்காணிக்கவும் மற்றும் ஆரம்பத்தில் பட்ஜெட் எச்சரிக்கைகளை அமைக்கவும்

### தவிர்க்க வேண்டிய பொதுவான தவறுகள்:

- ❌ API விசைகளை குறியீட்டில் கடினமாக்குதல்
- ❌ சரியான கண்காணிப்பை அமைக்காதது
- ❌ செலவு மேம்பாட்டை புறக்கணித்தல்
- ❌ தோல்வி சூழல்களை சோதிக்காதது
- ❌ ஆரோக்கிய சோதனைகள் இல்லாமல் வெளியீடு செய்தல்

## கூடுதல் வளங்கள்

- **Azure நன்கு-வடிவமைக்கப்பட்ட கட்டமைப்பு**: [AI பணிக்கான வழிகாட்டுதல்](https://learn.microsoft.com/azure/well-architected/ai/)
- **Azure AI Foundry ஆவணங்கள்**: [அதிகாரப்பூர்வ ஆவணங்கள்](https://learn.microsoft.com/azure/ai-studio/)
- **சமூக டெம்ப்ளேட்கள்**: [Azure மாதிரிகள்](https://github.com/Azure-Samples)
- **Discord சமூகங்கள்**: [#Azure சேனல்](https://discord.gg/microsoft-azure)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்கட்டம்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 8 - உற்பத்தி மற்றும் நிறுவன வடிவங்கள்
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 7: பிழை தீர்வு](../troubleshooting/debugging.md)
- **⬅️ தொடர்புடையது**: [AI பணிக்கூடம் ஆய்வகம்](ai-workshop-lab.md)
- **🎆 பாடநெறி முடிந்தது**: [AZD ஆரம்பக்கட்டம்](../../README.md)

**மறக்காதீர்கள்**: உற்பத்தி AI பணிகள் கவனமாக திட்டமிடல், கண்காணிப்பு மற்றும் தொடர்ச்சியான மேம்பாட்டை தேவைப்படும். இந்த வடிவங்களை கொண்டு தொடங்குங்கள் மற்றும் உங்கள் குறிப்பிட்ட தேவைகளுக்கு ஏற்ப அவற்றை மாற்றியமைக்கவும்.

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கின்றோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.