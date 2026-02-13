# AZD کے ساتھ پروڈکشن AI ورک لوڈ کے بہترین طریقے

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD برائے مبتدی](../../README.md)
- **📖 موجودہ باب**: باب 8 - پروڈکشن اور انٹرپرائز پیٹرنز
- **⬅️ پچھلا باب**: [باب 7: خرابیوں کا ازالہ](../chapter-07-troubleshooting/debugging.md)
- **⬅️ مزید متعلقہ**: [AI ورکشاپ لیب](ai-workshop-lab.md)
- **🎯 کورس مکمل**: [AZD برائے مبتدی](../../README.md)

## جائزہ

یہ گائیڈ Azure Developer CLI (AZD) استعمال کرتے ہوئے پروڈکشن-ریڈی AI ورک لوڈز کو ڈیپلائے کرنے کے لیے جامع بہترین طریقے فراہم کرتی ہے۔ Microsoft Foundry Discord کمیونٹی کی آراء اور حقیقی دنیا کے کسٹمر ڈیپلائمنٹس کی بنیاد پر، یہ طریقے پروڈکشن AI سسٹمز میں سب سے عام چیلنجز کو حل کرتے ہیں۔

## حل شدہ کلیدی چیلنجز

ہماری کمیونٹی پول کے نتائج کی بنیاد پر، یہ وہ اہم چیلنجز ہیں جن کا ڈویلپرز سامنا کرتے ہیں:

- **45%** متعدد سروسز پر مشتمل AI ڈیپلائمنٹس میں مشکلات کا سامنا کرتے ہیں
- **38%** کریڈینشل اور سیکرٹ مینجمنٹ میں مسائل کا سامنا کرتے ہیں  
- **35%** پروڈکشن ریڈینس اور اسکیلنگ کو مشکل سمجھتے ہیں
- **32%** بہتر لاگت اصلاح حکمتِ عملیاں چاہتے ہیں
- **29%** مانیٹرنگ اور خرابیوں کے ازالے میں بہتری چاہتے ہیں

## پروڈکشن AI کے لیے آرکیٹیکچر پیٹرنز

### پیٹرن 1: مائیکروسروسز AI آرکیٹیکچر

**استعمال کب کریں**: پیچیدہ AI ایپلیکیشنز جن میں متعدد صلاحیتیں ہوں

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

**AZD نفاذ**:

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

### پیٹرن 2: ایونٹ پر مبنی AI پروسیسنگ

**استعمال کب کریں**: بیچ پروسیسنگ، دستاویزات کا تجزیہ، غیر متزامن ورک فلو

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

## سیکیورٹی کے بہترین طریقے

### 1. زیرو ٹرسٹ سیکیورٹی ماڈل

**نفاذ کی حکمتِ عملی**:
- بغیر تصدیق کے سروس سے سروس تک مواصلت نہ ہو
- تمام API کالز مینیجڈ شناختیں استعمال کریں
- نیٹ ورک انفصال پرائیویٹ اینڈپوائنٹس کے ذریعے
- کم از کم مراعات کا اصول اپنائیں

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

### 2. محفوظ سیکرٹس مینجمنٹ

**Key Vault انٹیگریشن پیٹرن**:

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

### 3. نیٹ ورک سیکیورٹی

**پرائیویٹ اینڈپوائنٹ کنفیگریشن**:

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

## کارکردگی اور اسکیلنگ

### 1. آٹو اسکیلنگ حکمتِ عملیاں

**Container Apps آٹو اسکیلنگ**:

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

### 2. کیشنگ حکمتِ عملیاں

**AI جوابات کے لیے Redis Cache**:

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

### 3. لوڈ بیلنسنگ اور ٹریفک مینجمنٹ

**WAF کے ساتھ Application Gateway**:

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

## 💰 لاگت کی اصلاح

### 1. وسائل کا درست سائز طے کرنا

**ماحول کے مطابق کنفیگریشنز**:

```bash
# ترقیاتی ماحول
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# پیداواری ماحول
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. لاگت کی نگرانی اور بجٹس

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

### 3. ٹوکن کے استعمال کی اصلاح

**OpenAI لاگت کا انتظام**:

```typescript
// درخواست کی سطح پر ٹوکن کی اصلاح
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // سیاق و سباق کو مختصر کریں، صارف کے ان پٹ کو نہیں
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // تقریبی اندازہ: 1 ٹوکن ≈ 4 حروف
    return Math.ceil(text.length / 4);
  }
}
```

## مانیٹرنگ اور مشاہداتی صلاحیت

### 1. جامع Application Insights

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

### 2. AI مخصوص مانیٹرنگ

**AI میٹرکس کے لیے کسٹم ڈیش بورڈز**:

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

### 3. صحت کے چیکس اور اپ ٹائم مانیٹرنگ

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

## ڈیزاسٹر ریکوری اور ہائی دستیابی

### 1. متعدد خطوں میں تعیناتی

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

### 2. ڈیٹا بیک اپ اور ریکوری

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

## DevOps اور CI/CD انٹیگریشن

### 1. GitHub Actions ورک فلو

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

### 2. انفراسٹرکچر کی توثیق

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# چیک کریں کہ تمام ضروری خدمات چل رہی ہیں
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI ماڈلز کی تعیناتیوں کی تصدیق کریں
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI سروس کے رابطے کی جانچ کریں
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## پروڈکشن ریڈینس چیک لسٹ

### سیکیورٹی ✅
- [ ] تمام سروسز مینیجڈ شناختیں استعمال کریں
- [ ] سیکرٹس Key Vault میں محفوظ ہوں
- [ ] پرائیویٹ اینڈپوائنٹس کنفیگر کیے گئے ہوں
- [ ] نیٹ ورک سیکیورٹی گروپس نافذ کیے گئے ہوں
- [ ] RBAC کم از کم مراعات کے اصول کے ساتھ
- [ ] پبلک اینڈپوائنٹس پر WAF فعال ہو

### کارکردگی ✅
- [ ] آٹو اسکیلنگ کنفیگر ہو
- [ ] کیشنگ نافذ کی گئی ہو
- [ ] لوڈ بیلنسنگ ترتیب دی گئی ہو
- [ ] اسٹیٹک مواد کے لیے CDN
- [ ] ڈیٹا بیس کنکشن پولنگ
- [ ] ٹوکن کے استعمال کی اصلاح

### مانیٹرنگ ✅
- [ ] Application Insights کنفیگر ہو
- [ ] کسٹم میٹرکس متعین ہوں
- [ ] الرٹنگ رولز ترتیب دیے گئے ہوں
- [ ] ڈیش بورڈ بنایا گیا ہو
- [ ] ہیلتھ چیکس نافذ کیے گئے ہوں
- [ ] لاگ ریٹنشن پالیسیاں

### قابلِ اعتماد ✅
- [ ] متعدد خطوں میں تعیناتی
- [ ] بیک اپ اور ریکوری پلان
- [ ] سِرکٹ بریکرز نافذ کیے گئے ہوں
- [ ] ری ٹرائی پالیسیاں کنفیگر کی گئی ہوں
- [ ] خوش اسلوبی میں کارکردگی میں کمی
- [ ] ہیلتھ چیک اینڈپوائنٹس

### لاگت کا انتظام ✅
- [ ] بجٹ الرٹس کنفیگر کیے گئے ہوں
- [ ] وسائل کا درست سائز طے کیا گیا ہو
- [ ] ڈیولپ/ٹیسٹ رعایتیں لاگو ہوں
- [ ] Reserved instances خریدی گئی ہوں
- [ ] لاگت مانیٹرنگ ڈیش بورڈ
- [ ] باقاعدہ لاگت کے جائزے

### تعمیل ✅
- [ ] ڈیٹا رہائش کے تقاضے پورے کیے گئے ہوں
- [ ] آڈٹ لاگنگ فعال ہو
- [ ] تعمیل پالیسیاں لاگو ہوں
- [ ] سیکیورٹی بیس لائنز نافذ ہوں
- [ ] باقاعدہ سیکیورٹی جائزے
- [ ] واقعہ جوابی منصوبہ

## کارکردگی بنچ مارکس

### عام پروڈکشن میٹرکس

| میٹرک | ہدف | مانیٹرنگ |
|--------|--------|------------|
| **ردعمل کا وقت** | < 2 سیکنڈ | Application Insights |
| **دستیابی** | 99.9% | اپ ٹائم مانیٹرنگ |
| **خرابی کی شرح** | < 0.1% | ایپلیکیشن لاگز |
| **ٹوکن استعمال** | < $500/ماہ | لاگت کا انتظام |
| **متزامن صارفین** | 1000+ | لوڈ ٹیسٹنگ |
| **ریکوری وقت** | < 1 گھنٹہ | ڈیزاسٹر ریکوری ٹیسٹس |

### لوڈ ٹیسٹنگ

```bash
# مصنوعی ذہانت کی ایپلیکیشنز کے لیے لوڈ ٹیسٹنگ کا اسکرپٹ
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 کمیونٹی کے بہترین طریقے

Microsoft Foundry Discord کمیونٹی کی آراء کی بنیاد پر:

### کمیونٹی کی جانب سے اہم سفارشات:

1. چھوٹا شروع کریں، آہستہ آہستہ اسکیل کریں: بنیادی SKUs کے ساتھ شروع کریں اور حقیقی استعمال کی بنیاد پر اسکیل کریں
2. ہر چیز کی نگرانی کریں: پہلے دن سے جامع مانیٹرنگ قائم کریں
3. سیکیورٹی کو خودکار بنائیں: مستقل سیکیورٹی کے لیے انفراسٹرکچر بطور کوڈ استعمال کریں
4. مکمل جانچ کریں: اپنے پائپ لائن میں AI مخصوص ٹیسٹنگ شامل کریں
5. لاگت کا منصوبہ بنائیں: ٹوکن کے استعمال کی نگرانی کریں اور جلدی بجٹ الرٹس مقرر کریں

### عام غلطیوں سے بچیں:

- ❌ کوڈ میں API کیز کو ہارڈ کوڈ کرنا
- ❌ مناسب مانیٹرنگ نہ لگانا
- ❌ لاگت کی اصلاح کو نظر انداز کرنا
- ❌ ناکامی کے منظرناموں کی جانچ نہ کرنا
- ❌ ہیلتھ چیکس کے بغیر ڈپلائے کرنا

## اضافی وسائل

- **Azure Well-Architected Framework**: [AI ورک لوڈ رہنمائی](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [سرکاری دستاویزات](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure چینل](https://discord.gg/microsoft-azure)

---

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD برائے مبتدی](../../README.md)
- **📖 موجودہ باب**: باب 8 - پروڈکشن اور انٹرپرائز پیٹرنز
- **⬅️ پچھلا باب**: [باب 7: خرابیوں کا ازالہ](../chapter-07-troubleshooting/debugging.md)
- **⬅️ مزید متعلقہ**: [AI ورکشاپ لیب](ai-workshop-lab.md)
- **🎆 کورس مکمل**: [AZD برائے مبتدی](../../README.md)

**یاد رکھیں**: پروڈکشن AI ورک لوڈز کے لیے محتاط منصوبہ بندی، مانیٹرنگ، اور مسلسل اصلاح ضروری ہے۔ ان پیٹرنز سے شروع کریں اور انہیں اپنی مخصوص ضروریات کے مطابق ڈھالیں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
دستبرداری:
اس دستاویز کا ترجمہ AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے کیا گیا ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہِ کرم نوٹ کریں کہ خودکار تراجم میں غلطیاں یا کمی بیشی ہو سکتی ہے۔ اصل دستاویز کو اس کی مادری زبان میں مستند ماخذ سمجھا جانا چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی مترجم کی خدمات لینے کی تجویز دی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تعبیر کے لیے ذمہ دار نہیں ہوں گے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->