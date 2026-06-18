# Production AI Workload Best Practices with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ Previous Chapter**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Course Complete**: [AZD For Beginners](../../README.md)

## সারসংক্ষেপ

এই গাইডটি Azure Developer CLI (AZD) ব্যবহার করে প্রোডাকশন-রেডি AI ওয়ার্কলোড ডিপ্লয় করার জন্য বিস্তৃত সেরা অনুশীলন প্রদান করে। Microsoft Foundry Discord কমিউনিটি থেকে ফিডব্যাক এবং বাস্তব গ্রাহক ডিপ্লয়মেন্টের উপর ভিত্তি করে, এই অনুশীলনগুলি প্রোডাকশন AI সিস্টেমে সবচেয়ে সাধারণ চ্যালেঞ্জগুলো সমাধান করে।

## সমাধানকৃত মূল চ্যালেঞ্জসমূহ

আমাদের কমিউনিটি পোল ফলাফলের উপর ভিত্তি করে, ডেভেলপাররা যে শীর্ষ চ্যালেঞ্জগুলোর মুখোমুখি হচ্ছেন সেগুলো হল:

- **45%** বহু-সার্ভিস AI ডিপ্লয়মেন্টে সমস্যায় পড়েন
- **38%** ক্রেডেনশিয়াল এবং সিক্রেট ম্যানেজমেন্ট নিয়ে সমস্যা করছেন  
- **35%** প্রোডাকশন প্রস্তুতি এবং স্কেলিং কঠিন মনে করেন
- **32%** খরচ অপ্টিমাইজেশনের কৌশলগুলি উন্নত করার প্রয়োজন
- **29%** উন্নত মনিটরিং এবং ট্রাবলশুটিং প্রয়োজন

## প্রোডাকশন AI-এর আর্কিটেকচার প্যাটার্নসমূহ

### Pattern 1: Microservices AI Architecture

**কখন ব্যবহার করবেন**: বহু ক্ষমতাসম্পন্ন জটিল AI অ্যাপ্লিকেশনগুলির জন্য

```mermaid
graph TD
    Frontend[ওয়েব ফ্রন্টএন্ড] --- Gateway[এপিআই গেটওয়ে] --- LB[লোড ব্যালেন্সার]
    Gateway --> Chat[চ্যাট সার্ভিস]
    Gateway --> Image[ইমেজ সার্ভিস]
    Gateway --> Text[টেক্সট সার্ভিস]
    Chat --> OpenAI[মাইক্রোসফট ফাউন্ড্রি মডেলগুলি]
    Image --> Vision[কম্পিউটার ভিশন]
    Text --> DocIntel[ডকুমেন্ট ইন্টেলিজেন্স]
```

**AZD Implementation**:

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

### Pattern 2: Event-Driven AI Processing

**কখন ব্যবহার করবেন**: ব্যাচ প্রসেসিং, ডকুমেন্ট বিশ্লেষণ, অ্যাসিঙ্ক ওয়ার্কফ্লোসমূহের জন্য

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

## AI এজেন্টের হেলথ সম্পর্কে চিন্তা

যখন একটি প্রচলিত ওয়েব অ্যাপ ভেঙে যায়, লক্ষণগুলো চেনার মতোই: একটি পেজ লোড হয় না, একটি API ত্রুটি দেয়, বা একটি ডিপ্লয়মেন্ট ব্যর্থ হয়। AI-চালিত অ্যাপ্লিকেশনগুলোও একইভাবে ভাঙতে পারে—কিন্তু তারা এমন সূক্ষ্মভাবে খারাপ আচরণও করতে পারে যা স্পষ্ট ত্রুটি বার্তা তৈরি করে না।

এই অংশটি আপনাকে AI ওয়ার্কলোড মনিটর করার জন্য একটি মানসিক মডেল তৈরি করতে সাহায্য করে যাতে আপনি জানতে পারেন সমস্যা হলে কোথায় খোঁজ দেবেন।

### এজেন্ট হেলথ কীভাবে প্রচলিত অ্যাপ হেলথ থেকে আলাদা

একটি প্রচলিত অ্যাপ বা তো কাজ করে বা করে না। একটি AI এজেন্ট কাজ করছে মনে হলেও খারাপ ফলাফল দিতে পারে। এজেন্ট হেলথকে দুই স্তরে ভাবুন:

| Layer | What to Watch | Where to Look |
|-------|--------------|---------------|
| **Infrastructure health** | সার্ভিস কি চলছে? রিসোর্সProvision করা আছে কি? এন্ডপয়েন্ট গুলো পৌঁছনীয় কি? | `azd monitor`, Azure Portal resource health, container/app logs |
| **Behavior health** | এজেন্ট কি সঠিকভাবে প্রতিক্রিয়া দিচ্ছে? প্রতিক্রিয়াগুলো সময়োপযোগী কি? মডেল কি সঠিকভাবে কল হচ্ছে? | Application Insights traces, model call latency metrics, response quality logs |

Infrastructure health পরিচিত—এটি যেকোনো azd অ্যাপের জন্য একই। Behavior health হল AI ওয়ার্কলোড যোগ করা নতুন স্তর।

### যখন AI অ্যাপ প্রত্যাশিতভাবে আচরণ করে না তখন কোথায় খোঁজ দেবেন

আপনার AI অ্যাপ যদি প্রত্যাশিত ফলাফল দিচ্ছে না, এখানে একটি ধারণাগত চেকলিস্ট আছে:

1. **মূল বিষয়গুলো দিয়ে শুরু করুন।** অ্যাপটি কি চলছে? কি এটি তার নির্ভরশীল সিস্টেমগুলোতে পৌঁছাতে পারে? যেকোনো অ্যাপের মতো `azd monitor` এবং resource health চেক করুন।
2. **মডেল সংযোগ পরীক্ষা করুন।** আপনার অ্যাপটি কি সফলভাবে AI মডেলকে কল করছে? ব্যর্থ বা টাইমআউট হওয়া মডেল কল AI অ্যাপ সমস্যার সবচেয়ে সাধারণ কারণ এবং এটি আপনার অ্যাপ্লিকেশন লগসে দেখা যাবে।
3. **মডেল যা পেয়েছে তা দেখুন।** AI প্রতিক্রিয়াগুলো ইনপুটের উপর নির্ভর করে (প্রম্পট এবং যেকোনো উদ্ধারকৃত কনটেক্সট)। যদি আউটপুট ভুল হয়, ইনপুট সাধারণত ভুল থাকে। দেখুন আপনার অ্যাপ কি সঠিক ডাটা মডেলকে পাঠাচ্ছে কি না।
4. **প্রতিক্রিয়া ল্যাটেন্সি পর্যালোচনা করুন।** AI মডেল কলগুলি সাধারণ API কলগুলোর চেয়ে ধীর। যদি আপনার অ্যাপ ধীর মনে হয়, পরীক্ষা করুন মডেল রেসপন্স টাইম বাড়ে কি না—এটি থ্রোটলিং, ক্যাপাসিটি সীমা, বা রিজিওন-স্তরের কনজেশন নির্দেশ করতে পারে।
5. **খরচের সংকেত দেখুন।** টোকেন ব্যবহারে বা API কলগুলিতে অপ্রত্যাশিত উত্থান একটি লুপ, ভুল কনফিগার করা প্রম্পট, বা অতিরিক্ত রিট্রাই নির্দেশ করতে পারে।

আপনাকে অবজার্ভেবিলিটি টুলিং একদমই একবারে মাস্টার করতে হবে না। মূল ঐতিহাসিক বিষয় হল AI অ্যাপ্লিকেশনগুলোর মনিটরিংয়ের অতিরিক্ত একটি আচরণিক স্তর থাকে, এবং azd-এর বিল্ট-ইন মনিটরিং (`azd monitor`) আপনাকে উভয় স্তর তদন্ত করার জন্য একটি সূচনা দেবে।

---

## নিরাপত্তা সেরা অনুশীলনসমূহ

### 1. Zero-Trust Security Model

**বাস্তবায়ন কৌশল**:
- প্রমাণীকরণ ছাড়া সার্ভিস-টু-সার্ভিস যোগাযোগ নেই
- সব API কল managed identities ব্যবহার করে
- private endpoints দিয়ে নেটওয়ার্ক পৃথকীকরণ
- সর্বনিম্ন অধিকার ভিত্তিক অ্যাক্সেস কন্ট্রোল

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

### 2. সিকিউর সিক্রেট ম্যানেজমেন্ট

**Key Vault ইন্টিগ্রেশন প্যাটার্ন**:

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

### 3. নেটওয়ার্ক নিরাপত্তা

**Private Endpoint কনফিগারেশন**:

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

## পারফরম্যান্স এবং স্কেলিং

### 1. অটো-স্কেলিং কৌশল

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

### 2. ক্যাশিং কৌশল

**AI প্রতিক্রিয়াগুলির জন্য Redis Cache**:

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

### 3. লোড ব্যালান্সিং এবং ট্রাফিক ম্যানেজমেন্ট

**WAF সহ Application Gateway**:

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

## 💰 খরচ অপ্টিমাইজেশন

### 1. রিসোর্স সঠিক আকার নির্ধারণ

**পরিবেশ- নির্দিষ্ট কনফিগারেশনসমূহ**:

```bash
# উন্নয়ন পরিবেশ
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# প্রোডাকশন পরিবেশ
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. খরচ মনিটরিং এবং বাজেট

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

### 3. টোকেন ব্যবহারের অপ্টিমাইজেশন

**OpenAI খরচ ম্যানেজমেন্ট**:

```typescript
// অ্যাপ্লিকেশন-স্তরের টোকেন অপ্টিমাইজেশন
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // প্রসঙ্গ সংক্ষিপ্ত করুন, ব্যবহারকারীর ইনপুট নয়
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // আনুমানিক হিসাব: 1 টোকেন ≈ 4 অক্ষর
    return Math.ceil(text.length / 4);
  }
}
```

## মনিটরিং এবং অবজার্ভেবিলিটি

### 1. সমগ্র Application Insights

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

### 2. AI-নির্দিষ্ট মনিটরিং

**AI মেট্রিক্সের জন্য কাস্টম ড্যাশবোর্ড**:

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

### 3. হেলথ চেক এবং আপটাইম মনিটরিং

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

## দুর্যোগ পুনরুদ্ধার এবং উচ্চ উপলব্ধতা

### 1. মাল্টি-রিজিওন ডিপ্লয়মেন্ট

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

### 2. ডেটা ব্যাকআপ এবং পুনরুদ্ধার

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

## DevOps এবং CI/CD ইন্টিগ্রেশন

### 1. GitHub Actions ওয়ার্কফ্লো

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

### 2. ইনফ্রাস্ট্রাকচার ভ্যালিডেশন

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# সব প্রয়োজনীয় সেবাগুলি চলছে কি না পরীক্ষা করুন
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI মডেল ডেপ্লয়মেন্টগুলি যাচাই করুন
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# AI সার্ভিসের সংযোগ পরীক্ষা করুন
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## প্রোডাকশন রেডিনেস চেকলিস্ট

### নিরাপত্তা ✅
- [ ] সব সার্ভিস managed identities ব্যবহার করে
- [ ] সিক্রেটগুলো Key Vault-এ সংরক্ষিত
- [ ] Private endpoints কনফিগার করা আছে
- [ ] Network security groups বাস্তবায়িত
- [ ] সর্বনিম্ন_privilege সহ RBAC
- [ ] পাবলিক এন্ডপয়েন্টে WAF চালু

### পারফরম্যান্স ✅
- [ ] অটো-স্কেলিং কনফিগার করা আছে
- [ ] ক্যাশিং বাস্তবায়িত
- [ ] লোড ব্যালান্সিং সেটআপ
- [ ] স্ট্যাটিক কনটেন্টের জন্য CDN
- [ ] ডাটাবেস কানেকশন পুলিং
- [ ] টোকেন ব্যবহার অপ্টিমাইজেশন

### মনিটরিং ✅
- [ ] Application Insights কনফিগার করা আছে
- [ ] কাস্টম মেট্রিক্স নির্ধারিত
- [ ] অ্যালার্টিং রুলগুলি সেটআপ করা আছে
- [ ] ড্যাশবোর্ড তৈরি করা আছে
- [ ] হেলথ চেক বাস্তবায়িত
- [ ] লগ রিটেনশন পলিসি

### নির্ভরযোগ্যতা ✅
- [ ] মাল্টি-রিজিওন ডিপ্লয়মেন্ট
- [ ] ব্যাকআপ এবং পুনরুদ্ধার পরিকল্পনা
- [ ] সার্কিট ব্রেকারগুলো বাস্তবায়িত
- [ ] রিট্রাই পলিসি কনফিগার করা আছে
- [ ] গ্রেসফুল ডিগ্রেডেশন
- [ ] হেলথ চেক এন্ডপয়েন্টস

### খরচ ব্যবস্থাপনা ✅
- [ ] বাজেট অ্যালার্ট কনফিগার করা আছে
- [ ] রিসোর্স সঠিক আকার নির্ধারণ
- [ ] ডেভ/টেস্ট ছাড় প্রয়োগ করা হয়েছে
- [ ] রিজার্ভড ইনস্ট্যান্স কেনা আছে
- [ ] খরচ মনিটরিং ড্যাশবোর্ড
- [ ] নিয়মিত খরচ পর্যালোচনা

### সম্মতি (Compliance) ✅
- [ ] ডেটা রেসিডেন্সি প্রয়োজনীয়তা পূরণ
- [ ] অডিট লগিং চালু
- [ ] সম্মতি নীতিমালা প্রয়োগ
- [ ] নিরাপত্তা বেসলাইন বাস্তবায়ন
- [ ] নিয়মিত নিরাপত্তা মূল্যায়ন
- [ ] ইনসিডেন্ট রেসপন্স পরিকল্পনা

## পারফরম্যান্স বেঞ্চমার্কস

### সাধারণ প্রোডাকশন মেট্রিক্স

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Response Time** | < 2 seconds | Application Insights |
| **Availability** | 99.9% | Uptime monitoring |
| **Error Rate** | < 0.1% | Application logs |
| **Token Usage** | < $500/month | Cost management |
| **Concurrent Users** | 1000+ | Load testing |
| **Recovery Time** | < 1 hour | Disaster recovery tests |

### লোড টেস্টিং

```bash
# এআই অ্যাপ্লিকেশনগুলোর লোড টেস্টিং স্ক্রিপ্ট
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 কমিউনিটি সেরা অনুশীলনসমূহ

Microsoft Foundry Discord কমিউনিটির ফিডব্যাকের উপর ভিত্তি করে:

### কমিউনিটির শীর্ষ সুপারিশসমূহ:

1. **ছোট থেকে শুরু করুন, ধীরে ধীরে স্কেল করুন**: মৌলিক SKU দিয়ে শুরু করুন এবং বাস্তব ব্যবহার অনুযায়ী স্কেল করুন
2. **সবকিছু মনিটর করুন**: প্রথম দিন থেকেই ব্যাপক মনিটরিং সেটআপ করুন
3. **নিরাপত্তা অটোমেট করুন**: ধারাবাহিক নিরাপত্তার জন্য ইনফ্রাস্ট্রাকচার অ্যাজ কোড ব্যবহার করুন
4. **পরীক্ষা সম্পূর্ণভাবে করুন**: আপনার পাইপলাইনে AI-নির্দিষ্ট টেস্টিং অন্তর্ভুক্ত করুন
5. **খরচের পরিকল্পনা করুন**: টোকেন ব্যবহার মনিটর করুন এবং আগেভাগে বাজেট অ্যালার্ট সেট করুন

### এড়ানো সাধারণ ভুলভ্রান্তি:

- ❌ কোডে API কী হার্ডকোড করা
- ❌ সঠিক মনিটরিং সেট না করা
- ❌ খরচ অপ্টিমাইজেশন উপেক্ষা করা
- ❌ ব্যর্থতার সিনারিওগুলো টেস্ট না করা
- ❌ হেলথ চেক ছাড়া ডিপ্লয় করা

## AZD AI CLI কমান্ড এবং এক্সটেনশনসমূহ

AZD AI-নির্দিষ্ট কমান্ড এবং এক্সটেনশনের একটি বাড়তে থাকা সেট অন্তর্ভুক্ত করে যা প্রোডাকশন AI ওয়ার্কফ্লোগুলো সঙ্কলিত করে। এই টুলগুলো লোকাল ডেভেলপমেন্ট এবং প্রোডাকশন ডিপ্লয়মেন্টের মধ্যে সেতুবন্ধন তৈরি করে AI ওয়ার্কলোডের জন্য।

### AI-এর জন্য AZD এক্সটেনশনসমূহ

AZD AI-নির্দিষ্ট সক্ষমতা যোগ করতে একটি এক্সটেনশন সিস্টেম ব্যবহার করে। এক্সটেনশন ইনস্টল এবং ম্যানেজ করুন:

```bash
# সমস্ত উপলব্ধ এক্সটেনশন দেখান (এআই সহ)
azd extension list

# ইনস্টল করা এক্সটেনশনের বিবরণ পরীক্ষা করুন
azd extension show azure.ai.agents

# Foundry agents এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.agents

# ফাইন-টিউনিং এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.finetune

# কাস্টম মডেল এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.models

# সমস্ত ইনস্টল করা এক্সটেনশন আপগ্রেড করুন
azd extension upgrade --all
```

**উপলব্ধ AI এক্সটেনশনসমূহ:**

| Extension | Purpose | Status |
|-----------|---------|--------|
| `azure.ai.agents` | Foundry Agent Service management | প্রিভিউ |
| `azure.ai.skills` | Reusable agent skills | প্রিভিউ |
| `azure.ai.connections` | Foundry connections (data sources, tools) | প্রিভিউ |
| `azure.ai.finetune` | Foundry model fine-tuning | প্রিভিউ |
| `azure.ai.models` | Foundry custom models | প্রিভিউ |
| `azure.coding-agent` | Coding agent configuration | উপলভ্য |

> The `azure.ai.agents` extension evolves quickly. This course is validated against `0.1.40-preview`. Run `azd extension upgrade --all` to pick up the latest command set, and `azd extension show azure.ai.agents` to confirm your installed version.

**নতুন `skills` এবং `connections` এক্সটেনশনগুলো কী?**

দুইটি প্রিভিউ এক্সটেনশন এজেন্ট টুলিংয়ের সাথে একে অপরের সাথে প্রদর্শিত হয়েছে এবং একজন শুরুত থেকেই সেগুলো বোঝা উপকারী:

- **`azure.ai.skills`** — একটি **skill** হল একটি পুনরায় ব্যবহারযোগ্য ক্ষমতা (একটি প্যাকেজকৃত টুল বা আচরণ) যা আপনি প্রতিবার পুনরায় বাস্তবায়ন করার পরিবর্তে এক বা একাধিক এজেন্টে সংযুক্ত করতে পারবেন। এটিকে একটি শেয়ার করা বিল্ডিং ব্লক হিসেবে ভাবুন: একবার "ডকুমেন্ট সার্চ" বা "অর্ডার লুকআপ" skill সংজ্ঞায়িত করুন, তারপর সেটি এজেন্টগুলোর মধ্যে পুনরায় ব্যবহার করুন। এটি বহু-এজেন্ট সিস্টেমগুলোকে (Chapter 5) সামঞ্জস্যপূর্ণ রাখে এবং কপি-পেস্ট এড়ায়।
- **`azure.ai.connections`** — একটি **connection** হল আপনার Foundry প্রকল্প থেকে একটি পরিচালিত লিঙ্ক যা আপনার এজেন্টগুলোকে যে বাইরের রিসোর্সগুলোর প্রয়োজন—একটি ডেটা সোর্স (যেমন Azure AI Search), একটি টুল এন্ডপয়েন্ট, বা অন্য সার্ভিস—তাতে পৌঁছাতে দেয়। Connections কেন্দ্রীভূত করে *কোথায়* এবং *কিভাবে* এজেন্টরা ডেটা অ্যাক্সেস করে, তাই ক্রেডেনশিয়াল এবং এন্ডপয়েন্টগুলো একটি নিয়ন্ত্রিত স্থানে থাকে কোডের মধ্যে ছড়িয়ে না থাকার বদলে।

আপনাকে প্রথম এজেন্টগুলো ডিপ্লয় করার জন্য এগুলো দরকার নেই—শেখার সময় `azure.ai.agents` দিয়ে থাকুন। যখন আপনি একাধিক এজেন্টে একই টুলটি বারবার ডুপ্লিকেট করছেন তখন `skills` ব্যবহার করুন, এবং যখন একাধিক এজেন্ট একই ডেটা সোর্স শেয়ার করে তখন `connections` ব্যবহার করুন।

### `azd ai agent init` দিয়ে এজেন্ট প্রকল্প ইনিশিয়ালাইজ করা

`azd ai agent init` কমান্ড Microsoft Foundry Agent Service-এ ইন্টিগ্রেটেড একটি প্রোডাকশন-রেডি AI এজেন্ট প্রকল্প স্ক্যাফল্ড করে:

```bash
# এজেন্ট ম্যানিফেস্ট থেকে একটি নতুন এজেন্ট প্রকল্প আরম্ভ করুন
azd ai agent init -m <manifest-path-or-uri>

# একটি নির্দিষ্ট Foundry প্রকল্প আরম্ভ করুন এবং সেটিকে টার্গেট করুন
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# একটি কাস্টম সোর্স ডিরেক্টরি ব্যবহার করে আরম্ভ করুন
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Container Apps-কে হোস্ট হিসেবে নির্ধারণ করুন
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**মূল ফ্ল্যাগসমূহ:**

| Flag | Description |
|------|-------------|
| `-m, --manifest` | Path or URI to an agent manifest to add to your project |
| `-p, --project-id` | Existing Microsoft Foundry Project ID for your azd environment |
| `-s, --src` | Directory to download the agent definition (defaults to `src/<agent-id>`) |
| `--host` | Override the default host (e.g., `containerapp`) |
| `-e, --environment` | The azd environment to use |

**প্রোডাকশন টিপ**: `--project-id` ব্যবহার করে একটি বিদ্যমান Foundry প্রোজেক্টের সাথে সরাসরি সংযোগ করুন, যাতে আপনার এজেন্ট কোড এবং ক্লাউড রিসোর্সগুলো শুরু থেকেই লিঙ্কড থাকে।

### এজেন্ট লাইফসাইকেল ম্যানেজমেন্ট

`init` ছাড়াও, `azure.ai.agents` এক্সটেনশন হোস্ট করা এজেন্টের পূর্ণ লাইফসাইকেলের জন্য কমান্ড সরবরাহ করে—টেস্ট, মূল্যায়ন, অপ্টিমাইজ এবং অবসর করা:

```bash
# ডেপ্লয় করা এজেন্টকে কল করুন এবং সার্ভারের প্রতিক্রিয়ার সময় দেখুন
# (মোট বিলম্বতা এবং প্রথম বাইটে পৌঁছানোর সময়)
azd ai agent invoke

# পরিবর্তন করার আগে লাইভ এন্ডপয়েন্ট কনফিগারেশন দেখান
azd ai agent endpoint show

# এজেন্টের জন্য একটি মূল্যায়ন ডেটাসেট তৈরি করুন
azd ai agent eval generate --dataset ./eval/dataset.jsonl

# আপনার মূল্যায়ন ডেটার ভিত্তিতে এজেন্ট নির্দেশাবলী অপ্টিমাইজ করুন
# (এজেন্ট প্রকল্পে একটি optimization_model প্রয়োজন)
azd ai agent optimize

# কোড-ভিত্তিক হোস্ট করা এজেন্টের ডেপ্লয় করা সোর্স ডাউনলোড করুন
# (SHA-256 যাচাইকরণসহ)
azd ai agent code download

# একটি হোস্ট করা এজেন্ট এবং তার সমস্ত সংস্করণ মুছে ফেলুন
# (--force সক্রিয় সেশনগুলি সমাপ্ত করে)
azd ai agent delete --force
```

**লাইফসাইকেল এক নজরে:**

| Stage | Command | Production use |
|-------|---------|----------------|
| Test | `azd ai agent invoke` | প্রকাশের আগে প্রতিক্রিয়া যাচাই এবং ল্যাটেন্সি পরিমাপ করুন |
| Inspect | `azd ai agent endpoint show` | এন্ডপয়েন্ট auth/config পর্যালোচনা করুন; দ্রুত ব্রেকিং পরিবর্তন খুঁজে পান |
| Measure | `azd ai agent eval generate` | বাস্তব ট্রেস থেকে একটি পুনরাবৃত্তিযোগ্য মূল্যায়ন সেট তৈরি করুন |
| Improve | `azd ai agent optimize` | পরিমাপ করা গুণমানের বিরুদ্ধে নির্দেশাবলী টিউন করুন |
| Recover | `azd ai agent code download` | অডিট/রোলব্যাকের জন্য সঠিক ডিপ্লয় করা সোর্স পুনরুদ্ধার করুন |
| Retire | `azd ai agent delete --force` | একটি এজেন্ট এবং এর ভার্সনগুলো পরিস্কারভাবে টেয়ার ডাউন করুন |

> These are preview commands and may change between extension releases. Run `azd ai agent --help` to see the exact subcommands available in your installed version.

### Model Context Protocol (MCP) with `azd mcp`
AZD includes built-in MCP server support (Alpha), enabling AI agents and tools to interact with your Azure resources through a standardized protocol:

```bash
# আপনার প্রকল্পের জন্য MCP সার্ভার শুরু করুন
azd mcp start

# টুল চালানোর জন্য বর্তমান Copilot সম্মতি নিয়মসমূহ পর্যালোচনা করুন
azd copilot consent list
```

MCP সার্ভার আপনার azd প্রকল্পের প্রসঙ্গ—পরিবেশসমূহ, সার্ভিসসমূহ, এবং Azure রিসোর্স—AI-চালিত ডেভেলপমেন্ট টুলগুলোর কাছে প্রকাশ করে। এর ফলে সহজ হয়:

- **AI-assisted deployment**: কোডিং এজেন্টগুলোকে আপনার প্রকল্পের অবস্থান অনুসন্ধান করতে এবং ডিপ্লয়মেন্ট ট্রিগার করতে দিন
- **Resource discovery**: AI টুলগুলো আবিষ্কার করতে পারে আপনার প্রকল্প কোন Azure রিসোর্সগুলো ব্যবহার করে
- **Environment management**: এজেন্টগুলো dev/staging/production পরিবেশগুলোর মধ্যে সুইচ করতে পারে

### ইনফ্রাসট্রাকচার জেনারেশন `azd infra generate` দিয়ে

প্রোডাকশন AI ওয়ার্কলোডগুলোর জন্য, আপনি স্বয়ংক্রিয় প্রোভিশনিং-এ নির্ভর করার বদলে ইনফ্রাসট্রাকচার অ্যাজ কোড তৈরি ও কাস্টমাইজ করতে পারেন:

```bash
# আপনার প্রকল্প সংজ্ঞা থেকে Bicep/Terraform ফাইল তৈরি করুন
azd infra generate
```

এটি IaC ডিস্কে লিখে, যাতে আপনি:
- ডিপ্লয় করার আগে ইনফ্রাস্ট্রাকচার পর্যালোচনা ও অডিট করতে পারেন
- কাস্টম সিকিউরিটি নীতিমালা যোগ করতে পারেন (নেটওয়ার্ক নিয়ম, প্রাইভেট এন্ডপয়েন্ট)
- বিদ্যমান IaC রিভিউ প্রসেসগুলোর সাথে একীভূত করতে পারেন
- অ্যাপ্লিকেশন কোড থেকে আলাদা করে ইনফ্রাস্ট্রাকচারের পরিবর্তনগুলো ভার্সন কন্ট্রোল করতে পারেন

### প্রোডাকশন লাইফসাইকেল হুকস

AZD হুকস আপনাকে ডিপ্লয়মেন্ট লাইফসাইকেলের প্রতিটি ধাপে কাস্টম লজিক ইনজেক্ট করার সুযোগ দেয়—প্রোডাকশন AI ওয়ার্কফ্লোর জন্য এটি অত্যন্ত গুরুত্বপূর্ণ:

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
# উন্নয়ন চলাকালীন নির্দিষ্ট একটি হুক ম্যানুয়ালি চালান
azd hooks run predeploy
```

**AI ওয়ার্কলোডগুলোর জন্য প্রস্তাবিত প্রোডাকশন হুকস:**

| হুক | ব্যবহার |
|------|----------|
| `preprovision` | AI মডেল ক্যাপাসিটির জন্য সাবস্ক্রিপশন কোটা যাচাই |
| `postprovision` | প্রাইভেট এন্ডপয়েন্ট কনফিগার করা, মডেল ওয়েট ডিপ্লয় করা |
| `predeploy` | AI সেফটি টেস্ট চালানো, প্রম্পট টেমপ্লেট যাচাই করা |
| `postdeploy` | এজেন্ট রেসপন্সগুলোর স্মোক টেস্ট করা, মডেলের কানেক্টিভিটি যাচাই করা |

### CI/CD পাইপলাইন কনফিগারেশন

আপনার প্রকল্পকে GitHub Actions অথবা Azure Pipelines-এর সাথে সিকিউর Azure অথেনটিকেশনের মাধ্যমে কানেক্ট করতে `azd pipeline config` ব্যবহার করুন:

```bash
# CI/CD পাইপলাইন কনফিগার করুন (ইন্টারঅ্যাকটিভ)
azd pipeline config

# নির্দিষ্ট প্রদানকারীর সাথে কনফিগার করুন
azd pipeline config --provider github
```

এই কমান্ডটি:
- ন্যূনতম-প্রিভিলেজ অ্যাক্সেস সহ একটি সার্ভিস প্রিন্সিপাল তৈরি করে
- ফেডারেটেড ক্রেডেনশিয়াল কনফিগার করে (কোনও স্টোর করা সিক্রেট নেই)
- আপনার পাইপলাইন ডেফিনিশন ফাইল জেনারেট বা আপডেট করে
- CI/CD সিস্টেমে প্রয়োজনীয় এনভায়রনমেন্ট ভ্যারিয়েবল সেট করে

#### ধাপে ধাপে: আপনার প্রথম GitHub Actions পাইপলাইন

Here's the full walkthrough from a working azd project to automated deployments on every push.

**1. Make sure your project is on GitHub**

```bash
git init
git add .
git commit -m "Initial azd project"
gh repo create my-ai-app --private --source=. --push
```

**2. pipeline config চালান**

```bash
azd pipeline config --provider github
```

azd ইন্টারঅ্যাকটিভভাবে নিম্নগুলো করবে:
- প্রশ্ন করবে কোন Azure সাবস্ক্রিপশন এবং কোন পরিবেশকে টার্গেট করতে হবে
- pipeline-এর জন্য একটি Entra **app registration + service principal** তৈরি করবে
- **federated credentials (OIDC)** সেট আপ করবে—যা GitHub কে স্বল্পকালীন টোকেন দিয়ে Azure-এ অথেনটিকেট করে এবং **কোনও সিক্রেট সঞ্চিত হয় না**
- প্রয়োজনীয় **variables** আপনার GitHub রেপোতে পুশ করবে (`AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`, `AZURE_ENV_NAME`, `AZURE_LOCATION`)

**3. জেনারেট করা ওয়ার্কফ্লো বুঝুন**

azd `.github/workflows/azure-dev.yml` যোগ করে। মূল অংশগুলো এরকম দেখায়:

```yaml
# .github/workflows/azure-dev.yml
on:
  push:
    branches: [ main ]
  workflow_dispatch:        # lets you run it manually too

permissions:
  id-token: write           # required for OIDC federated login
  contents: read

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      AZURE_CLIENT_ID: ${{ vars.AZURE_CLIENT_ID }}
      AZURE_TENANT_ID: ${{ vars.AZURE_TENANT_ID }}
      AZURE_SUBSCRIPTION_ID: ${{ vars.AZURE_SUBSCRIPTION_ID }}
      AZURE_ENV_NAME: ${{ vars.AZURE_ENV_NAME }}
      AZURE_LOCATION: ${{ vars.AZURE_LOCATION }}
    steps:
      - uses: actions/checkout@v4
      - name: Install azd
        uses: Azure/setup-azd@v2
      - name: Log in with OIDC
        run: azd auth login --client-id "$AZURE_CLIENT_ID" --federated-credential-provider "github" --tenant-id "$AZURE_TENANT_ID"
      - name: Provision infrastructure
        run: azd provision --no-prompt
      - name: Deploy application
        run: azd deploy --no-prompt
```

**4. যাচাই করুন এটা কাজ করে**

```bash
# পাইপলাইনটি ট্রিগার করতে একটি পরিবর্তন পুশ করুন
git commit -am "Trigger pipeline" --allow-empty
git push
```

আপনার GitHub রেপোর **Actions** ট্যাবটি খুলুন এবং ওয়ার্কফ্লো স্বয়ংক্রিয়ভাবে `azd provision` এবং `azd deploy` চালাতে দেখুন।

> **কেন ফেডারেটেড ক্রেডেনশিয়াল গুরুত্বপূর্ণ:** পুরনো পাইপলাইনগুলো GitHub-এ একটি ক্লায়েন্ট সিক্রেট সংরক্ষণ করত। OIDC ফেডারেটেড ক্রেডেনশিয়াল সেই সিক্রেটটি সম্পূর্ণরূপে অপসারণ করে—GitHub রানটাইমে একটি স্বল্পকালীন টোকেন অনুরোধ করে, যা উভয়ভাবে বেশি সুরক্ষিত এবং রোটেট বা লিক করার মতো কিছু থাকে না। এটি হলো ডিফল্ট যা `azd pipeline config` সেট আপ করে।

> **সিক্রেট বনাম ভ্যারিয়েবল:** সংবেদনশীল নয় এমন শনাক্তকারী (`AZURE_CLIENT_ID`, ইত্যাদি) রেপো **variables**-এ যায়। যদি আপনার অ্যাপে প্রকৃতপক্ষে বিল্ড সময়ে একটি সিক্রেট প্রয়োজন হয়, তাহলে এটি GitHub **secret** হিসেবে যুক্ত করুন এবং `${{ secrets.NAME }}` দিয়ে রেফারেন্স করুন—কিন্তু রানটাইমে Key Vault + managed identity বেছে নিন (দেখুন [অধ্যায় ৩](../chapter-03-configuration/authsecurity.md))।

**pipeline config সহ প্রোডাকশন ওয়ার্কফ্লো:**

```bash
# 1. উত্পাদন পরিবেশ সেট আপ করুন
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. পাইপলাইন কনফিগার করুন
azd pipeline config --provider github

# 3. পাইপলাইন প্রতিটি main-এ push-এ azd deploy চালায়
```

#### ধাপে ধাপে: Azure DevOps পাইপলাইন

GitHub Actions-এর বদলে Azure DevOps পছন্দ করেন? azd নেটিভভাবে `azdo` প্রোভাইডার দিয়ে এটি সাপোর্ট করে। ফ্লো প্রায় একই—azd পাইপলাইন ফাইল জেনারেট করে, একটি সার্ভিস কানেকশন তৈরি করে, এবং অথেনটিকেশন সেট করে।

**1. Make sure you have an Azure DevOps project**

আপনাকে `https://dev.azure.com/<your-org>`-এ একটি অর্গানাইজেশন এবং একটি প্রজেক্ট লাগবে। একটি Personal Access Token (PAT) জেনারেট করুন যার মধ্যে **Build (Read & execute)**, **Code (Read & write)**, এবং **Service Connections (Read, query & manage)** স্কোপ থাকবে—azd আপনাকে এর জন্য প্রম্পট করবে।

**2. পাইপলাইন কনফিগার করুন**

```bash
azd pipeline config --provider azdo
```

azd নিম্নগুলো করবে:
- আপনার Azure DevOps অর্গানাইজেশন এবং প্রজেক্ট সম্পর্কে জিজ্ঞাসা করবে
- service principal ব্যবহার করে Azure-তে একটি **service connection** তৈরি (বা পুনঃব্যবহার) করবে
- কোনও ক্লায়েন্ট সিক্রেট সঞ্চিত না থাকে তা নিশ্চিত করতে **workload identity federation (OIDC)** কনফিগার করবে
- আপনার রেপোতে একটি `azure-dev.yml` পাইপলাইন ডেফিনিশন কমিট করবে

**3. জেনারেট করা `azure-dev.yml` পর্যালোচনা করুন**

azd এমন একটি পাইপলাইন লিখে যা প্রতিটি `main`-এ পুশে প্রোভিশন এবং ডিপ্লয় করে:

```yaml
# azure-dev.yml
trigger:
  - main

pool:
  vmImage: ubuntu-latest

steps:
  - task: setup-azd@1
    displayName: Install azd

  - script: azd provision --no-prompt
    displayName: Provision Infrastructure
    env:
      AZURE_SUBSCRIPTION_ID: $(AZURE_SUBSCRIPTION_ID)
      AZURE_ENV_NAME: $(AZURE_ENV_NAME)
      AZURE_LOCATION: $(AZURE_LOCATION)

  - script: azd deploy --no-prompt
    displayName: Deploy Application
    env:
      AZURE_SUBSCRIPTION_ID: $(AZURE_SUBSCRIPTION_ID)
      AZURE_ENV_NAME: $(AZURE_ENV_NAME)
      AZURE_LOCATION: $(AZURE_LOCATION)
```

**4. ভ্যারিয়েবলগুলি কোথা থেকে আসে**

azd এনভায়রনমেন্ট ভ্যালুসমূহ (`AZURE_ENV_NAME`, `AZURE_LOCATION`, `AZURE_SUBSCRIPTION_ID`) Azure DevOps-এ একটি **variable group** হিসেবে স্টোর করে যাতে পাইপলাইন সেগুলো পড়তে পারে। আপনি এগুলো **Pipelines → Library**-তে দেখে ও সম্পাদনা করতে পারবেন।

> **GitHub-র মতো একই OIDC সুবিধা:** `azdo` প্রোভাইডারও ডিফল্ট হিসেবে workload identity federation কনফিগার করে, তাই সার্ভিস কানেকশনে কোনও ক্লায়েন্ট সিক্রেট সঞ্চিত থাকে না—Azure DevOps রানটাইমে একটি স্বল্পকালীন টোকেন এক্সচেঞ্জ করে। কেবল তখনই `--auth-type client-credentials` পাস করুন যদি আপনার সংগঠন এখনও OIDC ব্যবহার করতে না পারে।

**5. এটি চালান**

```bash
git commit -am "Add Azure DevOps pipeline" --allow-empty
git push
```

Azure DevOps-এ **Pipelines** খুলুন এবং `azd provision` ও `azd deploy` চলতে দেখুন।

### `azd add` দিয়ে কম্পোনেন্ট যোগ করা

অধিকতর ধাপে ধাপে একটি বিদ্যমান প্রকল্পে Azure সার্ভিস যোগ করুন:

```bash
# ইন্টারঅ্যাকটিভভাবে একটি নতুন সার্ভিস কম্পোনেন্ট যুক্ত করুন
azd add
```

এটি বিশেষভাবে প্রোডাকশন AI অ্যাপ্লিকেশন বিস্তারের জন্য উপকারী—উদাহরণস্বরূপ, একটি ভেক্টর সার্চ সার্ভিস, নতুন একটি এজেন্ট এন্ডপয়েন্ট, বা একটি মনিটরিং কম্পোনেন্ট বিদ্যমান ডিপ্লয়মেন্টে যোগ করা।

## অতিরিক্ত রিসোর্স

- **Azure Well-Architected Framework**: [AI ওয়ার্কলোড নির্দেশিকা](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [অফিশিয়াল ডকুমেন্টেশন](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure channel](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, deployment, cost optimization, এবং diagnostics-এর জন্য 37টি ওপেন এজেন্ট স্কিল। আপনার এডিটরে ইনস্টল করুন:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**অধ্যায় নেভিগেশন:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: অধ্যায় 8 - প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস
- **⬅️ Previous Chapter**: [অধ্যায় ৭: ট্রাবলশুটিং](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI ওয়ার্কশপ ল্যাব](ai-workshop-lab.md)
- **� কোর্স সম্পূর্ণ**: [AZD For Beginners](../../README.md)

**মনে রাখবেন**: প্রোডাকশন AI ওয়ার্কলোডগুলো সতর্ক পরিকল্পনা, মনিটরিং, এবং ধারাবাহিক অপ্টিমাইজেশন দাবি করে। এই প্যাটার্নগুলো দিয়ে শুরু করুন এবং আপনার নির্দিষ্ট চাহিদা অনুযায়ী তাদের অভিযোজিত করুন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->