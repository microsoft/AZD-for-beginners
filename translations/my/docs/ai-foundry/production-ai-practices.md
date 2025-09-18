<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e2706bfe15e4801ded418f5c1de39212",
  "translation_date": "2025-09-18T13:19:25+00:00",
  "source_file": "docs/ai-foundry/production-ai-practices.md",
  "language_code": "my"
}
-->
# AZD ဖြင့် AI Workload များကို ထုတ်လုပ်မှုအဆင့်သို့ ရောက်ရန်အကောင်းဆုံးနည်းလမ်းများ

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၈ - ထုတ်လုပ်မှုနှင့် စီးပွားရေးပုံစံများ
- **⬅️ ယခင်အခန်း**: [အခန်း ၇: ပြဿနာရှာဖွေခြင်း](../troubleshooting/debugging.md)
- **⬅️ ဆက်စပ်အကြောင်းအရာ**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 သင်ခန်းစာပြီးစီးမှု**: [AZD အခြေခံများ](../../README.md)

## အကျဉ်းချုပ်

ဒီလမ်းညွှန်စာအုပ်မှာ Azure Developer CLI (AZD) ကို အသုံးပြုပြီး ထုတ်လုပ်မှုအဆင့် AI workload များကို deploy လုပ်ရန်အတွက် အကောင်းဆုံးနည်းလမ်းများကို ဖော်ပြထားပါတယ်။ Azure AI Foundry Discord အသိုင်းအဝိုင်းနှင့် အမှန်တကယ် customer deployment များမှ ရရှိသော အကြံပြုချက်များအပေါ် အခြေခံပြီး ထုတ်လုပ်မှု AI စနစ်များတွင် အများဆုံးကြုံတွေ့ရသော စိန်ခေါ်မှုများကို ဖြေရှင်းပေးထားပါတယ်။

## ဖြေရှင်းထားသော အဓိကစိန်ခေါ်မှုများ

အသိုင်းအဝိုင်းမှ မဲပေးမှုရလဒ်များအပေါ် အခြေခံပြီး developer များကြုံတွေ့ရသော အဓိကစိန်ခေါ်မှုများမှာ:

- **၄၅%** multi-service AI deployment များတွင် အခက်အခဲရှိသည်
- **၃၈%** credential နှင့် secret စီမံခန့်ခွဲမှုတွင် ပြဿနာရှိသည်  
- **၃၅%** ထုတ်လုပ်မှုအဆင့် readiness နှင့် scaling ကို ခက်ခဲစေသည်
- **၃၂%** ကုန်ကျစရိတ်ကို ပိုမိုကောင်းမွန်စွာ optimize လုပ်ရန် လိုအပ်သည်
- **၂၉%** monitoring နှင့် troubleshooting ကို တိုးတက်စေရန် လိုအပ်သည်

## ထုတ်လုပ်မှု AI အတွက် Architecture ပုံစံများ

### ပုံစံ ၁: Microservices AI Architecture

**အသုံးပြုရန်အချိန်**: အစွမ်းထက်သော AI application များတွင် အစွမ်းအလွန် functionalities များပါဝင်သောအခါ

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

**AZD အကောင်အထည်ဖော်မှု**:

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

### ပုံစံ ၂: Event-Driven AI Processing

**အသုံးပြုရန်အချိန်**: Batch processing, စာရွက်စာတမ်းခွဲခြမ်းစိတ်ဖြာခြင်း, async workflows

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

## လုံခြုံရေးအကောင်းဆုံးနည်းလမ်းများ

### ၁. Zero-Trust Security Model

**အကောင်အထည်ဖော်မှုနည်းလမ်း**:
- Authentication မရှိဘဲ service-to-service ဆက်သွယ်မှုမရှိပါ
- API call များအားလုံး managed identities ကို အသုံးပြုပါ
- Private endpoints ဖြင့် network isolation
- Least privilege access controls

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

### ၂. Secure Secret Management

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

### ၃. Network Security

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

## စွမ်းဆောင်ရည်နှင့် Scaling

### ၁. Auto-Scaling Strategies

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

### ၂. Caching Strategies

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

### ၃. Load Balancing နှင့် Traffic Management

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

## 💰 ကုန်ကျစရိတ် Optimize လုပ်ခြင်း

### ၁. Resource Right-Sizing

**Environment-Specific Configurations**:

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

### ၂. Cost Monitoring နှင့် Budgets

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

### ၃. Token Usage Optimization

**OpenAI Cost Management**:

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

## Monitoring နှင့် Observability

### ၁. Comprehensive Application Insights

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

### ၂. AI-Specific Monitoring

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

### ၃. Health Checks နှင့် Uptime Monitoring

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

## Disaster Recovery နှင့် High Availability

### ၁. Multi-Region Deployment

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

### ၂. Data Backup နှင့် Recovery

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

## DevOps နှင့် CI/CD Integration

### ၁. GitHub Actions Workflow

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

### ၂. Infrastructure Validation

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

## ထုတ်လုပ်မှုအဆင့် Readiness Checklist

### လုံခြုံရေး ✅
- [ ] Managed identities ဖြင့် service များအားလုံးကို အသုံးပြုထားသည်
- [ ] Secrets များကို Key Vault တွင် သိမ်းဆည်းထားသည်
- [ ] Private endpoints များကို configure လုပ်ထားသည်
- [ ] Network security groups များကို အကောင်အထည်ဖော်ထားသည်
- [ ] RBAC ကို least privilege ဖြင့် အသုံးပြုထားသည်
- [ ] Public endpoints များတွင် WAF ကို enable လုပ်ထားသည်

### စွမ်းဆောင်ရည် ✅
- [ ] Auto-scaling ကို configure လုပ်ထားသည်
- [ ] Caching ကို implement လုပ်ထားသည်
- [ ] Load balancing ကို setup လုပ်ထားသည်
- [ ] Static content အတွက် CDN ကို အသုံးပြုထားသည်
- [ ] Database connection pooling ကို configure လုပ်ထားသည်
- [ ] Token usage optimization ကို ပြုလုပ်ထားသည်

### Monitoring ✅
- [ ] Application Insights ကို configure လုပ်ထားသည်
- [ ] Custom metrics များကို သတ်မှတ်ထားသည်
- [ ] Alerting rules များကို setup လုပ်ထားသည်
- [ ] Dashboard ကို ဖန်တီးထားသည်
- [ ] Health checks ကို implement လုပ်ထားသည်
- [ ] Log retention policies များကို သတ်မှတ်ထားသည်

### ယုံကြည်စိတ်ချမှု ✅
- [ ] Multi-region deployment ကို ပြုလုပ်ထားသည်
- [ ] Backup နှင့် recovery အစီအစဉ်ကို ပြုလုပ်ထားသည်
- [ ] Circuit breakers ကို implement လုပ်ထားသည်
- [ ] Retry policies ကို configure လုပ်ထားသည်
- [ ] Graceful degradation ကို ပြုလုပ်ထားသည်
- [ ] Health check endpoints များကို implement လုပ်ထားသည်

### ကုန်ကျစရိတ်စီမံခန့်ခွဲမှု ✅
- [ ] Budget alerts များကို configure လုပ်ထားသည်
- [ ] Resource right-sizing ကို ပြုလုပ်ထားသည်
- [ ] Dev/test discounts များကို အသုံးပြုထားသည်
- [ ] Reserved instances များကို ဝယ်ယူထားသည်
- [ ] Cost monitoring dashboard ကို ဖန်တီးထားသည်
- [ ] Regular cost reviews များကို ပြုလုပ်ထားသည်

### အညီအဖွဲ့ ✅
- [ ] Data residency requirements များကို ဖြည့်ဆည်းထားသည်
- [ ] Audit logging ကို enable လုပ်ထားသည်
- [ ] Compliance policies များကို အသုံးပြုထားသည်
- [ ] Security baselines များကို implement လုပ်ထားသည်
- [ ] Regular security assessments များကို ပြုလုပ်ထားသည်
- [ ] Incident response plan ကို ပြုလုပ်ထားသည်

## စွမ်းဆောင်ရည် Benchmarks

### ထုတ်လုပ်မှုအဆင့် Metrics များ

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Response Time** | < ၂ စက္ကန့် | Application Insights |
| **Availability** | ၉၉.၉% | Uptime monitoring |
| **Error Rate** | < ၀.၁% | Application logs |
| **Token Usage** | < $၅၀၀/လ | Cost management |
| **Concurrent Users** | ၁၀၀၀+ | Load testing |
| **Recovery Time** | < ၁ နာရီ | Disaster recovery tests |

### Load Testing

```bash
# Load testing script for AI applications
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 အသိုင်းအဝိုင်းအကောင်းဆုံးနည်းလမ်းများ

Azure AI Foundry Discord အသိုင်းအဝိုင်းမှ အကြံပြုချက်များအပေါ် အခြေခံပြီး:

### အသိုင်းအဝိုင်းမှ အကောင်းဆုံးအကြံပြုချက်များ:

1. **အသေးစားစတင်ပြီး၊ တဖြည်းဖြည်း Scale လုပ်ပါ**: အခြေခံ SKUs များဖြင့် စတင်ပြီး အသုံးပြုမှုအပေါ် အခြေခံ၍ တိုးချဲ့ပါ
2. **အရာအားလုံးကို Monitor လုပ်ပါ**: စတင်ချိန်မှစ၍ monitoring ကို ပြုလုပ်ပါ
3. **လုံခြုံရေးကို အလိုအလျောက်လုပ်ဆောင်ပါ**: Infrastructure as code ကို အသုံးပြု၍ လုံခြုံရေးကို တိကျစွာ ပြုလုပ်ပါ
4. **စမ်းသပ်မှုကို အပြည့်အဝလုပ်ပါ**: AI-specific testing ကို သင်၏ pipeline တွင် ထည့်သွင်းပါ
5. **ကုန်ကျစရိတ်ကို စီမံပါ**: Token usage ကို monitor လုပ်ပြီး budget alerts များကို စောစောမှ သတ်မှတ်ပါ

### ရှောင်ရှားရန် အများဆုံး Pitfalls:

- ❌ API keys များကို code တွင် hardcode လုပ်ခြင်း
- ❌ Monitoring ကို မပြုလုပ်ခြင်း
- ❌ Cost optimization ကို မလုပ်ဆောင်ခြင်း
- ❌ Failure scenarios မစမ်းသပ်ခြင်း
- ❌ Health checks မပါဘဲ deploy လုပ်ခြင်း

## အပိုဆောင်းအရင်းအမြစ်များ

- **Azure Well-Architected Framework**: [AI workload အတွက် လမ်းညွှန်ချက်](https://learn.microsoft.com/azure/well-architected/ai/)
- **Azure AI Foundry Documentation**: [တရားဝင်စာရွက်စာတမ်းများ](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure channel](https://discord.gg/microsoft-azure)

---

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၈ - ထုတ်လုပ်မှုနှင့် စီးပွားရေးပုံစံများ
- **⬅️ ယခင်အခန်း**: [အခန်း ၇: ပြဿနာရှာဖွေခြင်း](../troubleshooting/debugging.md)
- **⬅️ ဆက်စပ်အကြောင်းအရာ**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎆 သင်ခန်းစာပြီးစီးမှု**: [AZD အခြေခံများ](../../README.md)

**သတိပြုရန်**: ထုတ်လုပ်မှု AI workload များအတွက် စီမံကိန်းချမှတ်ခြင်း၊ monitoring ပြုလုပ်ခြင်းနှင့် အဆက်မပြတ် optimize လုပ်ခြင်းတို့ကို ဂရုစိုက်ရန်လိုအပ်သည်။ ဒီပုံစံများကို စတင်အသုံးပြုပြီး သင့်လိုအပ်ချက်များအပေါ် အခြေခံ၍ ပြုပြင်ပြောင်းလဲပါ။

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူလဘာသာစကားဖြင့် အာဏာတရားရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားယူမှုမှားများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။