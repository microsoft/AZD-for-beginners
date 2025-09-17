<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e2706bfe15e4801ded418f5c1de39212",
  "translation_date": "2025-09-17T16:22:21+00:00",
  "source_file": "docs/ai-foundry/production-ai-practices.md",
  "language_code": "fa"
}
-->
# بهترین روش‌ها برای بارکاری هوش مصنوعی در محیط تولید با AZD

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۸ - الگوهای تولید و سازمانی
- **⬅️ فصل قبلی**: [فصل ۷: عیب‌یابی](../troubleshooting/debugging.md)
- **⬅️ مرتبط دیگر**: [کارگاه آزمایش هوش مصنوعی](ai-workshop-lab.md)
- **🎯 پایان دوره**: [AZD برای مبتدیان](../../README.md)

## مقدمه

این راهنما بهترین روش‌های جامع برای استقرار بارکاری‌های هوش مصنوعی آماده تولید با استفاده از Azure Developer CLI (AZD) را ارائه می‌دهد. این روش‌ها بر اساس بازخورد جامعه Discord Azure AI Foundry و استقرارهای واقعی مشتریان طراحی شده‌اند و به رایج‌ترین چالش‌ها در سیستم‌های هوش مصنوعی تولیدی می‌پردازند.

## چالش‌های کلیدی

بر اساس نتایج نظرسنجی جامعه، این‌ها چالش‌های اصلی هستند که توسعه‌دهندگان با آن‌ها مواجه‌اند:

- **۴۵٪** در استقرار هوش مصنوعی چند سرویس مشکل دارند
- **۳۸٪** در مدیریت اعتبارنامه‌ها و اسرار دچار مشکل هستند  
- **۳۵٪** آماده‌سازی تولید و مقیاس‌پذیری را دشوار می‌دانند
- **۳۲٪** به استراتژی‌های بهینه‌سازی هزینه بهتر نیاز دارند
- **۲۹٪** به نظارت و عیب‌یابی بهبود یافته نیاز دارند

## الگوهای معماری برای هوش مصنوعی تولیدی

### الگو ۱: معماری هوش مصنوعی میکروسرویس‌ها

**زمان استفاده**: برنامه‌های پیچیده هوش مصنوعی با قابلیت‌های متعدد

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

**پیاده‌سازی با AZD**:

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

### الگو ۲: پردازش هوش مصنوعی مبتنی بر رویداد

**زمان استفاده**: پردازش دسته‌ای، تحلیل اسناد، جریان‌های کاری غیرهمزمان

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

## بهترین روش‌های امنیتی

### ۱. مدل امنیتی اعتماد صفر

**استراتژی پیاده‌سازی**:
- هیچ ارتباط سرویس به سرویس بدون احراز هویت
- تمام تماس‌های API از هویت‌های مدیریت‌شده استفاده می‌کنند
- ایزوله‌سازی شبکه با نقاط پایانی خصوصی
- کنترل‌های دسترسی با حداقل مجوز

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

### ۲. مدیریت امن اسرار

**الگوی یکپارچه‌سازی Key Vault**:

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

### ۳. امنیت شبکه

**پیکربندی نقاط پایانی خصوصی**:

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

## عملکرد و مقیاس‌پذیری

### ۱. استراتژی‌های مقیاس‌پذیری خودکار

**مقیاس‌پذیری خودکار برنامه‌های کانتینری**:

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

### ۲. استراتژی‌های کش

**Redis Cache برای پاسخ‌های هوش مصنوعی**:

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

### ۳. مدیریت بار و ترافیک

**Application Gateway با WAF**:

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

## 💰 بهینه‌سازی هزینه

### ۱. اندازه‌گیری صحیح منابع

**پیکربندی‌های خاص محیط**:

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

### ۲. نظارت بر هزینه‌ها و بودجه‌ها

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

### ۳. بهینه‌سازی استفاده از توکن‌ها

**مدیریت هزینه OpenAI**:

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

## نظارت و مشاهده‌پذیری

### ۱. بینش جامع برنامه

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

### ۲. نظارت خاص هوش مصنوعی

**داشبوردهای سفارشی برای معیارهای هوش مصنوعی**:

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

### ۳. بررسی سلامت و نظارت بر زمان بالا بودن

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

## بازیابی از فاجعه و دسترسی بالا

### ۱. استقرار چند منطقه‌ای

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

### ۲. پشتیبان‌گیری و بازیابی داده‌ها

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

## یکپارچه‌سازی DevOps و CI/CD

### ۱. جریان کاری GitHub Actions

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

### ۲. اعتبارسنجی زیرساخت

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

## چک‌لیست آماده‌سازی تولید

### امنیت ✅
- [ ] تمام سرویس‌ها از هویت‌های مدیریت‌شده استفاده می‌کنند
- [ ] اسرار در Key Vault ذخیره شده‌اند
- [ ] نقاط پایانی خصوصی پیکربندی شده‌اند
- [ ] گروه‌های امنیتی شبکه پیاده‌سازی شده‌اند
- [ ] RBAC با حداقل مجوز
- [ ] WAF در نقاط پایانی عمومی فعال شده است

### عملکرد ✅
- [ ] مقیاس‌پذیری خودکار پیکربندی شده است
- [ ] کش پیاده‌سازی شده است
- [ ] مدیریت بار تنظیم شده است
- [ ] CDN برای محتوای ثابت
- [ ] اتصال به پایگاه داده بهینه شده است
- [ ] بهینه‌سازی استفاده از توکن‌ها

### نظارت ✅
- [ ] Application Insights پیکربندی شده است
- [ ] معیارهای سفارشی تعریف شده‌اند
- [ ] قوانین هشدار تنظیم شده‌اند
- [ ] داشبورد ایجاد شده است
- [ ] بررسی‌های سلامت پیاده‌سازی شده‌اند
- [ ] سیاست‌های نگهداری لاگ

### قابلیت اطمینان ✅
- [ ] استقرار چند منطقه‌ای
- [ ] برنامه پشتیبان‌گیری و بازیابی
- [ ] قطع‌کننده‌های مدار پیاده‌سازی شده‌اند
- [ ] سیاست‌های تلاش مجدد تنظیم شده‌اند
- [ ] کاهش تدریجی
- [ ] نقاط پایانی بررسی سلامت

### مدیریت هزینه ✅
- [ ] هشدارهای بودجه تنظیم شده‌اند
- [ ] اندازه‌گیری صحیح منابع
- [ ] تخفیف‌های توسعه/آزمایش اعمال شده‌اند
- [ ] نمونه‌های رزرو شده خریداری شده‌اند
- [ ] داشبورد نظارت بر هزینه
- [ ] بررسی‌های منظم هزینه

### انطباق ✅
- [ ] الزامات محل داده‌ها رعایت شده‌اند
- [ ] لاگ‌های حسابرسی فعال شده‌اند
- [ ] سیاست‌های انطباق اعمال شده‌اند
- [ ] پایه‌های امنیتی پیاده‌سازی شده‌اند
- [ ] ارزیابی‌های امنیتی منظم
- [ ] برنامه پاسخ به حادثه

## معیارهای عملکرد

### معیارهای معمول تولید

| معیار | هدف | نظارت |
|-------|------|--------|
| **زمان پاسخ** | < ۲ ثانیه | Application Insights |
| **دسترس‌پذیری** | ۹۹.۹٪ | نظارت بر زمان بالا بودن |
| **نرخ خطا** | < ۰.۱٪ | لاگ‌های برنامه |
| **استفاده از توکن‌ها** | < $۵۰۰/ماه | مدیریت هزینه |
| **کاربران همزمان** | ۱۰۰۰+ | آزمایش بار |
| **زمان بازیابی** | < ۱ ساعت | آزمایش‌های بازیابی از فاجعه |

### آزمایش بار

```bash
# Load testing script for AI applications
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 بهترین روش‌های جامعه

بر اساس بازخورد جامعه Discord Azure AI Foundry:

### توصیه‌های برتر از جامعه:

1. **کوچک شروع کنید، به تدریج مقیاس دهید**: با SKUs پایه شروع کنید و بر اساس استفاده واقعی مقیاس دهید
2. **همه چیز را نظارت کنید**: از روز اول نظارت جامع تنظیم کنید
3. **امنیت را خودکار کنید**: از زیرساخت به عنوان کد برای امنیت سازگار استفاده کنید
4. **کاملاً آزمایش کنید**: آزمایش‌های خاص هوش مصنوعی را در خط لوله خود بگنجانید
5. **برنامه‌ریزی برای هزینه‌ها**: استفاده از توکن‌ها را نظارت کنید و هشدارهای بودجه را زود تنظیم کنید

### اشتباهات رایج که باید از آن‌ها اجتناب کرد:

- ❌ کلیدهای API را در کد سخت‌کد کردن
- ❌ عدم تنظیم نظارت مناسب
- ❌ نادیده گرفتن بهینه‌سازی هزینه
- ❌ عدم آزمایش سناریوهای شکست
- ❌ استقرار بدون بررسی‌های سلامت

## منابع اضافی

- **چارچوب معماری خوب Azure**: [راهنمای بارکاری هوش مصنوعی](https://learn.microsoft.com/azure/well-architected/ai/)
- **مستندات Azure AI Foundry**: [مستندات رسمی](https://learn.microsoft.com/azure/ai-studio/)
- **قالب‌های جامعه**: [نمونه‌های Azure](https://github.com/Azure-Samples)
- **جامعه Discord**: [کانال #Azure](https://discord.gg/microsoft-azure)

---

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۸ - الگوهای تولید و سازمانی
- **⬅️ فصل قبلی**: [فصل ۷: عیب‌یابی](../troubleshooting/debugging.md)
- **⬅️ مرتبط دیگر**: [کارگاه آزمایش هوش مصنوعی](ai-workshop-lab.md)
- **🎆 پایان دوره**: [AZD برای مبتدیان](../../README.md)

**به یاد داشته باشید**: بارکاری‌های هوش مصنوعی تولیدی نیاز به برنامه‌ریزی دقیق، نظارت و بهینه‌سازی مداوم دارند. با این الگوها شروع کنید و آن‌ها را با نیازهای خاص خود تطبیق دهید.

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.