# بهترین شیوه‌ها برای بار کاری تولیدی AI با AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ Previous Chapter**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Course Complete**: [AZD For Beginners](../../README.md)

## مرور کلی

این راهنما بهترین شیوه‌های جامع برای استقرار بارهای کاری آماده تولید AI با استفاده از Azure Developer CLI (AZD) را ارائه می‌دهد. بر اساس بازخورد جامعه Microsoft Foundry در Discord و استقرارهای واقعی مشتریان، این شیوه‌ها رایج‌ترین چالش‌ها در سیستم‌های AI تولیدی را پوشش می‌دهند.

## چالش‌های کلیدی مطرح‌شده

بر اساس نتایج نظرسنجی جامعه ما، این‌ها مهم‌ترین چالش‌هایی هستند که توسعه‌دهندگان با آن‌ها مواجه‌اند:

- **45%** با استقرارهای چندخدمتی هوش مصنوعی مشکل دارند
- **38%** مسائل مرتبط با مدیریت اعتبارنامه و اسرار دارند  
- **35%** آماده‌سازی برای تولید و مقیاس‌بندی را دشوار می‌دانند
- **32%** به استراتژی‌های بهتر بهینه‌سازی هزینه نیاز دارند
- **29%** نیاز به بهبود نظارت و رفع اشکال دارند

## الگوهای معماری برای AI تولیدی

### الگوی 1: معماری AI مبتنی بر میکروسرویس‌ها

**چه زمانی باید استفاده شود**: برنامه‌های پیچیده AI با چندین قابلیت

```mermaid
graph TD
    Frontend[فرانت‌اند وب] --- Gateway[دروازهٔ API] --- LB[توزیع‌کننده بار]
    Gateway --> Chat[سرویس گفتگو]
    Gateway --> Image[سرویس تصویر]
    Gateway --> Text[سرویس متن]
    Chat --> OpenAI[مدل‌های مایکروسافت فاندری]
    Image --> Vision[بینایی ماشین]
    Text --> DocIntel[هوش اسناد]
```
**پیاده‌سازی AZD**:

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

### الگوی 2: پردازش AI مبتنی بر رویداد

**چه زمانی باید استفاده شود**: پردازش دسته‌ای، تحلیل اسناد، جریان‌های کاری ناهمزمان

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

## تفکر درباره سلامت عامل‌های AI

وقتی یک برنامه وب سنتی خراب می‌شود، علائم آشنا هستند: صفحه بارگذاری نمی‌شود، یک API خطا برمی‌گرداند، یا یک استقرار شکست می‌خورد. برنامه‌های مبتنی بر AI می‌توانند به همان روش‌ها خراب شوند—اما آن‌ها همچنین ممکن است به شیوه‌های ظریف‌تری بدعمل کنند که پیام‌های خطای واضحی تولید نمی‌کنند.

این بخش به شما کمک می‌کند یک مدل ذهنی برای نظارت بر بارهای کاری AI بسازید تا بدانید هنگام بروز مشکلات کجا را بررسی کنید.

### چگونه سلامت عامل با سلامت برنامه سنتی تفاوت دارد

یک برنامه سنتی یا کار می‌کند یا کار نمی‌کند. یک عامل AI ممکن است به‌نظر کار کند اما نتایج ضعیفی تولید کند. سلامت عامل را در دو لایه در نظر بگیرید:

| Layer | What to Watch | Where to Look |
|-------|--------------|---------------|
| **Infrastructure health** | آیا سرویس در حال اجرا است؟ آیا منابع اختصاص یافته‌اند؟ آیا نقطه‌های پایانی قابل دسترسی‌اند؟ | `azd monitor`, Azure Portal resource health, container/app logs |
| **Behavior health** | آیا عامل پاسخ‌های دقیق می‌دهد؟ آیا پاسخ‌ها به‌موقع هستند؟ آیا مدل به‌درستی فراخوانی می‌شود؟ | Application Insights traces, model call latency metrics, response quality logs |

سلامت زیرساخت آشنا است—برای هر برنامه azd یکسان است. سلامت رفتار لایه جدیدی است که بارهای کاری AI معرفی می‌کنند.

### کجا را بررسی کنید وقتی برنامه‌های AI همان‌طور که انتظار می‌رود رفتار نمی‌کنند

اگر برنامه AI شما نتایجی که انتظار دارید را تولید نمی‌کند، این یک چک‌لیست مفهومی است:

1. **با اصول شروع کنید.** آیا برنامه در حال اجراست؟ آیا می‌تواند به وابستگی‌های خود دسترسی پیدا کند؟ همان‌طور که برای هر برنامه‌ای انجام می‌دهید، `azd monitor` و سلامت منابع را بررسی کنید.
2. **اتصال به مدل را بررسی کنید.** آیا برنامه شما به‌طور موفقیت‌آمیزی مدل AI را فراخوانی می‌کند؟ فراخوانی‌های مدل که شکست می‌خورند یا تایم‌اوت می‌شوند شایع‌ترین علت مشکلات برنامه‌های AI هستند و در لاگ‌های برنامه شما ظاهر خواهند شد.
3. **نگاه کنید مدل چه چیزی دریافت کرده است.** پاسخ‌های AI به ورودی وابسته‌اند (پرومپت و هر زمینه بازیابی‌شده). اگر خروجی اشتباه است، معمولاً ورودی اشتباه است. بررسی کنید آیا برنامه شما داده‌های درست را به مدل ارسال می‌کند یا خیر.
4. **تاخیر پاسخ را بازبینی کنید.** فراخوانی‌های مدل AI کندتر از فراخوانی‌های معمول API هستند. اگر برنامه شما کند به‌نظر می‌رسد، بررسی کنید آیا زمان پاسخ مدل افزایش یافته است—این می‌تواند نشان‌دهنده محدودیت‌های نرخ، محدودیت ظرفیت، یا تراکم در سطح منطقه باشد.
5. **برای نشانه‌های هزینه مراقب باشید.** افزایش‌های ناگهانی در مصرف توکن یا فراخوانی‌های API می‌تواند نشان‌دهنده یک حلقه، یک پرومپت نادرست پیکربندی‌شده، یا تلاش‌های مجدد بیش از حد باشد.

لازم نیست فوراً در ابزارهای قابل‌مشاهده‌سازی استاد شوید. نکته کلیدی این است که برنامه‌های AI یک لایه رفتار اضافی برای نظارت دارند، و مانیتورینگ داخلی azd (`azd monitor`) نقطه شروعی برای بررسی هر دو لایه به شما می‌دهد.

---

## بهترین شیوه‌های امنیتی

### 1. مدل امنیتی Zero-Trust

**راهبرد پیاده‌سازی**:
- هیچ ارتباط سرویس‌به‌سرویس بدون احراز هویت مجاز نیست
- تمام فراخوانی‌های API از managed identities استفاده کنند
- جداسازی شبکه با private endpoints
- کنترل‌های دسترسی با حداقل امتیاز

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

### 2. مدیریت امن اسرار

**الگوی ادغام Key Vault**:

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

### 3. امنیت شبکه

**پیکربندی Private Endpoint**:

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

### 1. استراتژی‌های مقیاس خودکار

**مقیاس خودکار Container Apps**:

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

### 2. استراتژی‌های کش

**کش Redis برای پاسخ‌های AI**:

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

### 3. توازن بار و مدیریت ترافیک

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

## بهینه‌سازی هزینه 💰

### 1. تعیین اندازه مناسب منابع

**پیکربندی‌های خاص محیط**:

```bash
# محیط توسعه
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# محیط تولید
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. نظارت بر هزینه و بودجه‌ها

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

### 3. بهینه‌سازی استفاده از توکن

**مدیریت هزینه OpenAI**:

```typescript
// بهینه‌سازی توکن در سطح برنامه
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // متن زمینه را کوتاه کنید، نه ورودی کاربر
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // تخمین تقریبی: ۱ توکن ≈ ۴ کاراکتر
    return Math.ceil(text.length / 4);
  }
}
```

## نظارت و قابل‌مشاهده‌سازی

### 1. Application Insights جامع

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

### 2. نظارت اختصاصی AI

**داشبوردهای سفارشی برای معیارهای AI**:

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

### 3. بررسی سلامت و مانیتورینگ آپ‌تایم

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

## بازیابی از حادثه و دسترسی‌پذیری بالا

### 1. استقرار در چند منطقه

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

### 2. پشتیبان‌گیری و بازیابی داده

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

## ادغام DevOps و CI/CD

### 1. گردش‌کار GitHub Actions

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
        uses: Azure/setup-azd@v2
        
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
        uses: Azure/setup-azd@v2
        
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

### 2. اعتبارسنجی زیرساخت

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# بررسی اینکه آیا همه‌ی سرویس‌های مورد نیاز در حال اجرا هستند
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# اعتبارسنجی استقرار مدل‌های OpenAI
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# تست اتصال سرویس هوش مصنوعی
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## چک‌لیست آمادگی تولید

### امنیت ✅
- [ ] تمام سرویس‌ها از managed identities استفاده می‌کنند
- [ ] اسرار در Key Vault ذخیره شده‌اند
- [ ] private endpoints پیکربندی شده‌اند
- [ ] گروه‌های امنیت شبکه پیاده‌سازی شده‌اند
- [ ] RBAC با حداقل امتیاز
- [ ] WAF روی نقاط پایانی عمومی فعال است

### عملکرد ✅
- [ ] مقیاس خودکار پیکربندی شده است
- [ ] کش پیاده‌سازی شده است
- [ ] توازن بار تنظیم شده است
- [ ] CDN برای محتوای استاتیک
- [ ] پولینگ اتصالات پایگاه‌داده
- [ ] بهینه‌سازی استفاده از توکن

### مانیتورینگ ✅
- [ ] Application Insights پیکربندی شده است
- [ ] معیارهای سفارشی تعریف شده‌اند
- [ ] قوانین هشداردهی تنظیم شده‌اند
- [ ] داشبورد ایجاد شده است
- [ ] بررسی‌های سلامت پیاده‌سازی شده‌اند
- [ ] سیاست‌های نگهداری لاگ‌ها

### قابلیت اطمینان ✅
- [ ] استقرار در چند منطقه
- [ ] برنامه پشتیبان‌گیری و بازیابی
- [ ] پیاده‌سازی circuit breakers
- [ ] پیکربندی سیاست‌های تلاش مجدد
- [ ] افت تدریجی کنترل‌شده
- [ ] نقاط پایانی بررسی سلامت

### مدیریت هزینه ✅
- [ ] هشدارهای بودجه پیکربندی شده‌اند
- [ ] تعیین اندازه مناسب منابع
- [ ] تخفیف‌های Dev/Test اعمال شده‌اند
- [ ] خرید reserved instances
- [ ] داشبورد نظارت هزینه
- [ ] بازبینی‌های منظم هزینه

### تطابق و انطباق ✅
- [ ] الزامات محل نگهداری داده‌ها رعایت شده‌اند
- [ ] ثبت لاگ حسابرسی فعال شده است
- [ ] سیاست‌های تطابق اعمال شده‌اند
- [ ] مبانی امنیتی پیاده‌سازی شده‌اند
- [ ] ارزیابی‌های منظم امنیتی
- [ ] برنامه پاسخ به حادثه

## معیارهای عملکرد

### معیارهای معمول تولید

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Response Time** | < 2 ثانیه | Application Insights |
| **Availability** | 99.9% | Uptime monitoring |
| **Error Rate** | < 0.1% | Application logs |
| **Token Usage** | < $500/ماه | Cost management |
| **Concurrent Users** | 1000+ | Load testing |
| **Recovery Time** | < 1 ساعت | Disaster recovery tests |

### آزمون بار

```bash
# اسکریپت تست بار برای برنامه‌های کاربردی هوش‌مصنوعی
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## بهترین شیوه‌های جامعه 🤝

بر اساس بازخورد جامعه Microsoft Foundry در Discord:

### برترین توصیه‌ها از سوی جامعه:

1. **کوچک شروع کنید، به‌تدریج مقیاس دهید**: با SKUهای پایه شروع کنید و براساس استفاده واقعی مقیاس را افزایش دهید
2. **همه‌چیز را زیر نظر بگیرید**: از روز اول نظارت جامع را راه‌اندازی کنید
3. **امنیت را خودکار کنید**: از Infrastructure as Code برای امنیت یک‌دست استفاده کنید
4. **آزمون را به‌طور کامل انجام دهید**: آزمون‌های اختصاصی AI را در خط لوله خود بگنجانید
5. **برای هزینه‌ها برنامه‌ریزی کنید**: مصرف توکن را نظارت کرده و هشدارهای بودجه را زود تنظیم کنید

### دام‌های رایج که باید اجتناب شوند:

- ❌ هاردکُد کردن کلیدهای API در کد
- ❌ راه‌اندازی نکردن نظارت مناسب
- ❌ نادیده گرفتن بهینه‌سازی هزینه
- ❌ تست نکردن سناریوهای خطا
- ❌ استقرار بدون بررسی‌های سلامت

## دستورات CLI و افزونه‌های AZD برای AI

AZD شامل مجموعه‌ای رو به رشد از دستورات و افزونه‌های مخصوص AI است که جریان‌های کاری تولیدی AI را ساده می‌کنند. این ابزارها پل بین توسعه محلی و استقرار تولیدی برای بارهای کاری AI را فراهم می‌کنند.

### افزونه‌های AZD برای AI

AZD از یک سیستم افزونه برای افزودن قابلیت‌های خاص AI استفاده می‌کند. افزونه‌ها را با دستور زیر نصب و مدیریت کنید:

```bash
# تمام افزونه‌های موجود را فهرست کن (شامل هوش مصنوعی)
azd extension list

# جزئیات افزونه‌های نصب‌شده را بررسی کن
azd extension show azure.ai.agents

# افزونهٔ Foundry agents را نصب کن
azd extension install azure.ai.agents

# افزونهٔ تنظیم دقیق را نصب کن
azd extension install azure.ai.finetune

# افزونهٔ مدل‌های سفارشی را نصب کن
azd extension install azure.ai.models

# تمام افزونه‌های نصب‌شده را به‌روزرسانی کن
azd extension upgrade --all
```

**افزونه‌های AI موجود:**

| Extension | Purpose | Status |
|-----------|---------|--------|
| `azure.ai.agents` | مدیریت Foundry Agent Service | پیش‌نمایش |
| `azure.ai.finetune` | فاین-تیون مدل‌های Foundry | پیش‌نمایش |
| `azure.ai.models` | مدل‌های سفارشی Foundry | پیش‌نمایش |
| `azure.coding-agent` | پیکربندی عامل کدنویسی | موجود |

### مقداردهی پروژه‌های عامل با `azd ai agent init`

دستور `azd ai agent init` یک پروژه عامل AI آماده تولید که با Microsoft Foundry Agent Service یکپارچه شده است را اسکافولد می‌کند:

```bash
# یک پروژهٔ عامل جدید را از فایل مانفیستِ عامل مقداردهی اولیه کنید
azd ai agent init -m <manifest-path-or-uri>

# یک پروژهٔ مشخصِ Foundry را مقداردهی اولیه کرده و هدف قرار دهید
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# با یک دایرکتوریِ منبعِ سفارشی مقداردهی اولیه کنید
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Container Apps را به‌عنوان میزبان هدف قرار دهید
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**پرچم‌های کلیدی:**

| Flag | Description |
|------|-------------|
| `-m, --manifest` | Path or URI to an agent manifest to add to your project |
| `-p, --project-id` | Existing Microsoft Foundry Project ID for your azd environment |
| `-s, --src` | Directory to download the agent definition (defaults to `src/<agent-id>`) |
| `--host` | Override the default host (e.g., `containerapp`) |
| `-e, --environment` | The azd environment to use |

**نکته تولیدی**: از `--project-id` استفاده کنید تا مستقیماً به یک پروژه Foundry موجود متصل شوید و کد عامل و منابع ابری شما از ابتدا مرتبط باقی بمانند.

### پروتکل زمینه مدل (MCP) با `azd mcp`

AZD پشتیبانی سرور MCP داخلی (Alpha) را شامل می‌شود که به عامل‌ها و ابزارهای AI اجازه می‌دهد از طریق یک پروتکل استاندارد با منابع Azure شما تعامل کنند:

```bash
# سرور MCP را برای پروژهٔ خود راه‌اندازی کنید
azd mcp start

# قوانین موافقت کنونی Copilot را برای اجرای ابزار بازبینی کنید
azd copilot consent list
```

سرور MCP زمینه پروژه azd شما—محیط‌ها، سرویس‌ها و منابع Azure—را در اختیار ابزارهای مبتنی بر AI توسعه قرار می‌دهد. این امکان را فراهم می‌کند برای:

- **استقرار با کمک AI**: اجازه دهید عامل‌های کدنویسی وضعیت پروژه شما را پرس‌وجو کرده و استقرارها را فعال کنند
- **کشف منابع**: ابزارهای AI می‌توانند کشف کنند پروژه شما از چه منابع Azure استفاده می‌کند
- **مدیریت محیط‌ها**: عامل‌ها می‌توانند بین محیط‌های dev/staging/production جابجا شوند

### تولید زیرساخت با `azd infra generate`

برای بارهای کاری AI تولیدی، می‌توانید Infrastructure as Code را تولید و سفارشی کنید به‌جای اینکه به تامین خودکار تکیه کنید:

```bash
# فایل‌های Bicep/Terraform را از تعریف پروژهٔ خود تولید کنید
azd infra generate
```

این IaC را روی دیسک می‌نویسد تا بتوانید:
- زیرساخت را قبل از استقرار بررسی و ممیزی کنید
- سیاست‌های امنیتی سفارشی اضافه کنید (قوانین شبکه، private endpoints)
- با فرایندهای بازبینی IaC موجود ادغام کنید
- تغییرات زیرساخت را جدا از کد برنامه نسخه‌بندی کنید

### هوک‌های چرخه عمر تولید

هوک‌های AZD به شما اجازه می‌دهند منطق سفارشی را در هر مرحله از چرخه عمر استقرار تزریق کنید—مهم برای جریان‌های کاری AI تولیدی:

```yaml
# azure.yaml - Production hooks example
name: ai-production-app
hooks:
  preprovision:
    shell: sh
    run: scripts/validate-quotas.sh    # Check AI model quota before provisioning
  postprovision:
    shell: sh
    run: scripts/configure-networking.sh  # Set up private endpoints
  predeploy:
    shell: sh
    run: scripts/run-ai-safety-tests.sh  # Run prompt safety checks
  postdeploy:
    shell: sh
    run: scripts/smoke-test.sh           # Verify agent responses post-deploy
services:
  agent-api:
    project: ./src/agent
    host: containerapp
    hooks:
      predeploy:
        shell: sh
        run: scripts/validate-model-access.sh  # Per-service hook
```

```bash
# اجرای دستی یک هوک مشخص در طول توسعه
azd hooks run predeploy
```

**هوک‌های پیشنهادی برای تولید برای بارهای کاری AI:**

| Hook | Use Case |
|------|----------|
| `preprovision` | Validate subscription quotas for AI model capacity |
| `postprovision` | Configure private endpoints, deploy model weights |
| `predeploy` | Run AI safety tests, validate prompt templates |
| `postdeploy` | Smoke test agent responses, verify model connectivity |

### پیکربندی خط لوله CI/CD

از `azd pipeline config` برای اتصال پروژه خود به GitHub Actions یا Azure Pipelines با احراز هویت امن Azure استفاده کنید:

```bash
# پیکربندی خط‌لوله CI/CD (تعاملی)
azd pipeline config

# پیکربندی با ارائه‌دهندهٔ خاص
azd pipeline config --provider github
```

این دستور:
- یک service principal با دسترسی حداقل مورد نیاز ایجاد می‌کند
- اعتبارنامه‌های فدراسیون‌شده را پیکربندی می‌کند (بدون اسرار ذخیره‌شده)
- فایل تعریف خط لوله شما را ایجاد یا به‌روزرسانی می‌کند
- متغیرهای محیطی مورد نیاز را در سیستم CI/CD شما تنظیم می‌کند

**گردش‌کار تولیدی با pipeline config:**

```bash
# 1. راه‌اندازی محیط تولید
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. پیکربندی خط‌لوله
azd pipeline config --provider github

# 3. خط‌لوله در هر بار push به شاخهٔ main دستور azd deploy را اجرا می‌کند
```

### افزودن اجزا با `azd add`

به‌تدریج سرویس‌های Azure را به یک پروژه موجود اضافه کنید:

```bash
# یک مؤلفهٔ سرویس جدید را به‌صورت تعاملی اضافه کنید.
azd add
```

این برای گسترش برنامه‌های AI تولیدی خصوصاً مفید است—برای مثال، افزودن یک سرویس جستجوی وکتور، یک نقطه انتهایی عامل جدید، یا یک جزء مانیتورینگ به یک استقرار موجود.

## منابع اضافی
- **چارچوب Azure Well-Architected**: [راهنمای بار کاری هوش مصنوعی](https://learn.microsoft.com/azure/well-architected/ai/)
- **مستندات Microsoft Foundry**: [مستندات رسمی](https://learn.microsoft.com/azure/ai-studio/)
- **الگوهای جامعه**: [نمونه‌های Azure](https://github.com/Azure-Samples)
- **جامعه Discord**: [کانال #Azure](https://discord.gg/microsoft-azure)
- **مهارت‌های Agent برای Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 مهارت عامل باز برای Azure AI، Foundry، استقرار، بهینه‌سازی هزینه و تشخیص‌خطا. در ویرایشگر خود نصب کنید:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل 8 - الگوهای تولید و سازمانی
- **⬅️ فصل قبلی**: [فصل 7: عیب‌یابی](../chapter-07-troubleshooting/debugging.md)
- **⬅️ موارد مرتبط**: [کارگاه هوش مصنوعی](ai-workshop-lab.md)
- **� پایان دوره**: [AZD برای مبتدیان](../../README.md)

**به یاد داشته باشید**: بارهای کاری هوش مصنوعی در محیط تولید نیازمند برنامه‌ریزی دقیق، پایش و بهینه‌سازی مستمر هستند. با این الگوها شروع کنید و آن‌ها را متناسب با نیازهای خاص خود تطبیق دهید.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
این سند با استفاده از سرویس ترجمه مبتنی بر هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان اصلی خود باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرستی که ناشی از استفاده از این ترجمه باشد، مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->