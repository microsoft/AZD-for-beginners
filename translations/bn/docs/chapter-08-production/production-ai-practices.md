# AZD সহ প্রোডাকশন AI ওয়ার্কলোড সেরা অনুশীলনসমূহ

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৮ - প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস
- **⬅️ পূর্ববর্তী অধ্যায়**: [অধ্যায় ৭: সমস্যা সমাধান](../chapter-07-troubleshooting/debugging.md)
- **⬅️ সম্পর্কিত আরও**: [AI ওয়ার্কশপ ল্যাব](ai-workshop-lab.md)
- **🎯 কোর্স সম্পন্ন**: [AZD For Beginners](../../README.md)

## ওভারভিউ

এই গাইডটি Azure Developer CLI (AZD) ব্যবহার করে প্রোডাকশন-রেডি AI ওয়ার্কলোড মোতায়েনের জন্য বিস্তৃত সেরা অনুশীলন সরবরাহ করে। Microsoft Foundry Discord কমিউনিটির প্রতিক্রিয়া এবং বাস্তব বিশ্বের গ্রাহক মোতায়েনের উপর ভিত্তি করে, এই অনুশীলনগুলো প্রোডাকশন AI সিস্টেমে সবচেয়ে সাধারণ চ্যালেঞ্জগুলো সমাধান করে।

## মোকাবেলা করা মূল চ্যালেঞ্জগুলো

আমাদের কমিউনিটি পোলের ফলাফলের ভিত্তিতে, ডেভেলপাররা সম্মুখীন হওয়া প্রধান চ্যালেঞ্জগুলো হলো:

- **৪৫%** মাল্টি-সার্ভিস AI মোতায়েন নিয়ে কষ্ট পাচ্ছে
- **৩৮%** ক্রেডেনশিয়াল ও সিক্রেট ম্যানেজমেন্টে সমস্যা রয়েছে  
- **৩৫%** প্রোডাকশন রেডিনেস ও স্কেলিং কঠিন মনে করছে
- **৩২%** আরও ভাল খরচ অপ্টিমাইজেশন প্রয়োজন
- **২৯%** উন্নত মনিটরিং ও ডিবাগিং দরকার

## প্রোডাকশন AI’র জন্য আর্কিটেকচার প্যাটার্নস

### প্যাটার্ন ১: মাইক্রোসার্ভিসেস AI আর্কিটেকচার

**কখন ব্যবহার করবেন**: একাধিক সক্ষমতা সম্পন্ন জটিল AI অ্যাপ্লিকেশনসমূহ

```mermaid
graph TD
    Frontend[ওয়েব ফ্রন্টএন্ড] --- Gateway[এপিআই গেটওয়ে] --- LB[লোড ব্যালান্সার]
    Gateway --> Chat[চ্যাট সার্ভিস]
    Gateway --> Image[ইমেজ সার্ভিস]
    Gateway --> Text[টেক্সট সার্ভিস]
    Chat --> OpenAI[মাইক্রোসফট ফাউন্ড্রি মডেলস]
    Image --> Vision[কম্পিউটার ভিশন]
    Text --> DocIntel[ডকুমেন্ট ইন্টেলিজেন্স]
```
**AZD ইমপ্লিমেন্টেশন**:

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

### প্যাটার্ন ২: ইভেন্ট-ড্রিভেন AI প্রসেসিং

**কখন ব্যবহার করবেন**: ব্যাচ প্রসেসিং, ডকুমেন্ট বিশ্লেষণ, অ্যাসিঙ্ক ওয়ার্কফ্লো

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

## AI এজেন্টের স্বাস্থ্য সম্পর্কে চিন্তা

একটি প্রচলিত ওয়েব অ্যাপ ভেঙে গেলে লক্ষণগুলি পরিচিত: একটি পেজ লোড হয় না, একটি API ত্রুটি ফেরত দেয়, বা একটি মোতায়েন ব্যর্থ হয়। AI-ক্ষমতাসম্পন্ন অ্যাপ্লিকেশনও একইরকমভাবে ভাঙতে পারে — তবে এগুলি আরও সূক্ষ্ম উপায়ে খারাপ আচরণ করতে পারে যা স্পষ্ট ত্রুটি বার্তা তৈরি করে না।

এই অংশটি আপনাকে AI ওয়ার্কলোড মনিটরিংয়ের জন্য একটি মানসিক মডেল তৈরি করতে সাহায্য করে যাতে আপনি জানেন কীভাবে দেখতে হবে যখন কিছু ঠিক মনে হয় না।

### AI এজেন্টের স্বাস্থ্য প্রচলিত অ্যাপের স্বাস্থ্য থেকে কিভাবে আলাদা

একটি প্রচলিত অ্যাপ হয় কাজ করে বা করে না। একটি AI এজেন্ট কাজ করছে বলে মনে হতে পারে কিন্তু খারাপ ফলাফল দিতে পারে। এজেন্টের স্বাস্থ্য দুই স্তরে ভাবুন:

| স্তর | কী নজরে রাখবেন | কোথায় দেখবেন |
|-------|--------------|---------------|
| **ইনফ্রাস্ট্রাকচার স্বাস্থ্য** | সেবা চলছে কি? রিসোর্স প্রভিশন করা হয়েছে কি? এন্ডপয়েন্টগুলি পৌঁছানো যাচ্ছে? | `azd monitor`, Azure পোর্টাল রিসোর্স স্বাস্থ্য, কন্টেইনার/অ্যাপ লগ |
| **আচরণ স্বাস্থ্য** | এজেন্ট সঠিকভাবে প্রতিক্রিয়া দিচ্ছে? প্রতিক্রিয়া সময়মতো আসছে? মডেল সঠিকভাবে কল হচ্ছে? | অ্যাপ্লিকেশন ইনসাইটস ট্রেস, মডেল কল লেটেন্সি মেট্রিক, প্রতিক্রিয়া গুণমান লগ |

ইনফ্রাস্ট্রাকচার স্বাস্থ্য পরিচিত—যেকোনো azd অ্যাপে একই। আচরণ স্বাস্থ্য হলো AI ওয়ার্কলোড দ্বারা প্রবর্তিত নতুন স্তর।

### AI অ্যাপ প্রত্যাশিতমত কাজ না করলে কোথায় দেখতে হবে

যদি আপনার AI অ্যাপ প্রত্যাশিত ফলাফল না দেয়, নিম্নলিখিত ধারণাগত চেকলিস্ট ব্যবহার করুন:

১. **মৌলিক থেকে শুরু করুন।** অ্যাপটি চলছে কি? তার ডিপেন্ডেন্সি পর্যন্ত পৌঁছাতে পারছে কি? যেকোনো অ্যাপের মতো `azd monitor` এবং রিসোর্স স্বাস্থ্য পরীক্ষা করুন।  
২. **মডেল সংযোগ পরীক্ষা করুন।** আপনার অ্যাপ্লিকেশন সফলভাবে AI মডেল কল করছে কি? ব্যর্থ বা টাইমআউট হওয়া মডেল কলগুলি AI অ্যাপের সবচেয়ে সাধারণ সমস্যা এবং এটি আপনার অ্যাপ্লিকেশন লগে দেখা যাবে।  
৩. **মডেলের কাছে যেটা গেল তা দেখুন।** AI প্রতিক্রিয়া ইনপুটের (প্রম্পট এবং প্রাপ্ত প্রসঙ্গ) ওপর নির্ভর করে। আউটপুট ভুল হলে, ইনপুট সাধারণত ভুলই থাকে। দেখুন আপনার অ্যাপ সঠিক ডেটা মডেলে পাঠাচ্ছে কি না।  
৪. **প্রতিক্রিয়া বিলম্ব পর্যালোচনা করুন।** AI মডেল কল গুলো সাধারণ API কলের চেয়ে ধীর। যদি আপনার অ্যাপ স্লগিশ মনে হয়, পরীক্ষা করুন মডেল প্রতিক্রিয়ার সময় বাড়ছে কি না – এতে থ্রটলিং, ক্যাপাসিটি সীমা, বা অঞ্চল-স্তরের ট্রাফিক ঘনত্ব বোঝাতে পারে।  
৫. **খরচ সংকেত দেখুন।** টোকেন ব্যবহার বা API কলের অপ্রত্যাশিত স্পাইক লুপ, ভুল প্রম্পট, বা অত্যধিক পুনঃচেষ্টা নির্দেশ করতে পারে।

আপনাকে অবজারভেবিলিটি টুলিং তাত্ক্ষণিকভাবে পারদর্শী হতে হবে না। মূল বিষয় হলো AI অ্যাপ্লিকেশনগুলোর অতিরিক্ত আচরণ স্তর মনিটর করা প্রয়োজন, এবং azd-র বিল্ট-ইন মনিটরিং (`azd monitor`) উভয় স্তর তদন্তের জন্য একটি সূচনা বিন্দু সরবরাহ করে।

---

## সিকিউরিটি সেরা অনুশীলন

### ১. জিরো-ট্রাস্ট সিকিউরিটি মডেল

**বাস্তবায়ন কৌশল**:
- কোনো সার্ভিস-টু-সার্ভিস যোগাযোগ ব্যতীত প্রমাণীকরণ ছাড়া নয়
- সকল API কল ম্যানেজড আইডেন্টিটিজ ব্যবহার করে
- প্রাইভেট এন্ডপয়েন্ট দ্বারা নেটওয়ার্ক বিচ্ছিন্নকরণ
- সর্বনিম্ন অগ্রাধিকারের প্রবেশাধিকার নিয়ন্ত্রণ

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

### ২. নিরাপদ সিক্রেট ম্যানেজমেন্ট

**কি ভল্ট ইন্টিগ্রেশন প্যাটার্ন**:

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

### ৩. নেটওয়ার্ক সিকিউরিটি

**প্রাইভেট এন্ডপয়েন্ট কনফিগারেশন**:

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

### ১. অটো-স্কেলিং কৌশল

**কন্টেইনার অ্যাপস অটো-স্কেলিং**:

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

### ২. ক্যাশিং কৌশল

**Redis ক্যাশ AI প্রতিক্রিয়ার জন্য**:

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

### ৩. লোড ব্যালেন্সিং ও ট্র্যাফিক ম্যানেজমেন্ট

**ওয়েব অ্যাপ্লিকেশন গেটওয়ে WAF সহ**:

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

### ১. রিসোর্স সঠিক আকার নির্ধারণ

**পরিবেশ-নির্দিষ্ট কনফিগারেশন**:

```bash
# উন্নয়ন পরিবেশ
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# উৎপাদন পরিবেশ
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### ২. খরচ মনিটরিং ও বাজেট

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

### ৩. টোকেন ব্যবহারের অপ্টিমাইজেশন

**OpenAI খরচ ব্যবস্থাপনা**:

```typescript
// অ্যাপ্লিকেশন-স্তরের টোকেন অপ্টিমাইজেশন
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // ব্যবহারকারীর ইনপুট নয়, প্রসঙ্গ সংক্ষিপ্ত করুন
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // মোটামুটি অনুমান: ১ টোকেন ≈ ৪ টি অক্ষর
    return Math.ceil(text.length / 4);
  }
}
```

## মনিটরিং এবং অবজারভেবিলিটি

### ১. বিস্তৃত অ্যাপ্লিকেশন ইনসাইটস

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

### ২. AI-নির্দিষ্ট মনিটরিং

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

### ৩. স্বাস্থ্য পরীক্ষা ও আপটাইম মনিটরিং

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

## ডিজাস্টার রিকভারি এবং উচ্চ প্রাপ্যতা

### ১. মাল্টি-রিজিয়ন মোতায়েন

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

### ২. ডেটা ব্যাকআপ ও পুনরুদ্ধার

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

### ১. GitHub Actions ওয়ার্কফ্লো

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

### ২. ইনফ্রাস্ট্রাকচার ভ্যালিডেশন

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# চেক করুন যে সমস্ত প্রয়োজনীয় সার্ভিস চলছে কি না
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI মডেল ডিপ্লয়মেন্ট যাচাই করুন
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# AI সার্ভিস কানেক্টিভিটি পরীক্ষা করুন
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## প্রোডাকশন রেডিনেস চেকলিস্ট

### সিকিউরিটি ✅
- [ ] সব সার্ভিস ম্যানেজড আইডেন্টিটিজ ব্যবহার করে
- [ ] সিক্রেট কি ভল্টে সংরক্ষিত
- [ ] প্রাইভেট এন্ডপয়েন্ট কনফিগার করা
- [ ] নেটওয়ার্ক সিকিউরিটি গ্রুপ বাস্তবায়িত
- [ ] সর্বনিম্ন অগ্রাধিকার সহ RBAC
- [ ] পাবলিক এন্ডপয়েন্টে WAF সক্রিয়

### পারফরম্যান্স ✅
- [ ] অটো-স্কেলিং কনফিগার করা
- [ ] ক্যাশিং বাস্তবায়িত
- [ ] লোড ব্যালেন্সিং সেটআপ করা
- [ ] স্ট্যাটিক কনটেন্টের জন্য CDN
- [ ] ডেটাবেস কানেকশন পুলিং
- [ ] টোকেন ব্যবহারের অপ্টিমাইজেশন

### মনিটরিং ✅
- [ ] অ্যাপ্লিকেশন ইনসাইটস কনফিগার করা
- [ ] কাস্টম মেট্রিক সংজ্ঞায়িত করা
- [ ] এলার্টিং রুলস সেটআপ
- [ ] ড্যাশবোর্ড তৈরি করা
- [ ] স্বাস্থ্য পরীক্ষা বাস্তবায়িত
- [ ] লগ রিটেনশন নীতি

### বিশ্বাসযোগ্যতা ✅
- [ ] মাল্টি-রিজিয়ন মোতায়েন
- [ ] ব্যাকআপ ও রিকভারি পরিকল্পনা
- [ ] সার্কিট ব্রেকার বাস্তবায়িত
- [ ] পুনঃচেষ্টা নীতি কনফিগার
- [ ] গ্রেসফুল ডিগ্রেডেশন
- [ ] স্বাস্থ্য পরীক্ষা এন্ডপয়েন্ট

### খরচ ব্যবস্থাপনা ✅
- [ ] বাজেট এলার্ট কনফিগার
- [ ] রিসোর্স সঠিক আকার নির্ধারণ
- [ ] ডেভ/টেস্ট ডিসকাউন্ট প্রয়োগ
- [ ] রিজার্ভড ইনস্ট্যান্স কেনা
- [ ] খরচ মনিটরিং ড্যাশবোর্ড
- [ ] নিয়মিত খরচ পর্যালোচনা

### কমপ্লায়েন্স ✅
- [ ] ডেটা আবাসন প্রয়োজনীয়তা পূরণ
- [ ] অডিট লগিং সক্রিয়
- [ ] কমপ্লায়েন্স নীতি প্রয়োগ
- [ ] সিকিউরিটি বেসলাইন বাস্তবায়িত
- [ ] নিয়মিত সিকিউরিটি মূল্যায়ন
- [ ] ইনসিডেন্ট রেসপন্স পরিকল্পনা

## পারফরম্যান্স বেঞ্চমার্কসমূহ

### সাধারণ প্রোডাকশন মেট্রিক্স

| মেট্রিক | লক্ষ্য | মনিটরিং |
|--------|--------|------------|
| **প্রতিক্রিয়া সময়** | < ২ সেকেন্ড | অ্যাপ্লিকেশন ইনসাইটস |
| **প্রাপ্যতা** | ৯৯.৯% | আপটাইম মনিটরিং |
| **ত্রুটি হার** | < ০.১% | অ্যাপ্লিকেশন লগ |
| **টোকেন ব্যবহার** | < $৫০০/মাস | খরচ ব্যবস্থাপনা |
| **সাময়িক ব্যবহারকারী** | ১০০০+ | লোড টেস্টিং |
| **রিকভারি সময়** | < ১ ঘন্টা | ডিজাস্টার রিকভারি পরীক্ষা |

### লোড টেস্টিং

```bash
# AI অ্যাপ্লিকেশনের জন্য লোড টেস্টিং স্ক্রিপ্ট
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 কমিউনিটির সেরা অনুশীলনসমূহ

Microsoft Foundry Discord কমিউনিটির প্রতিক্রিয়ার ভিত্তিতে:

### কমিউনিটির শীর্ষ সুপারিশসমূহ:

১. **ছোট থেকে শুরু করে ধীরে ধীরে স্কেল করুন**: মৌলিক SKU দিয়ে শুরু করুন এবং বাস্তব ব্যবহার অনুসারে স্কেল করুন  
২. **সবকিছু মনিটর করুন**: প্রথম দিন থেকেই বিস্তৃত মনিটরিং সেট আপ করুন  
৩. **সিকিউরিটি অটোমেট করুন**: ধারাবাহিকতার জন্য ইনফ্রাস্ট্রাকচার অ্যাজ কোড ব্যবহার করুন  
৪. **সতর্কতার সাথে পরীক্ষা করুন**: AI-নির্দিষ্ট পরীক্ষা আপনার পাইপলাইনে অন্তর্ভুক্ত করুন  
৫. **খরচের পরিকল্পনা করুন**: টোকেন ব্যবহার মনিটর করুন এবং বাজেট এলার্ট আগে থেকে সেট করুন  

### সাধারণ ভুলগুলো এড়িয়ে চলুন:

- ❌ কোডে হার্ডকোড করা API কি ব্যবহার করা
- ❌ সঠিক মনিটরিং না করা
- ❌ খরচ অপ্টিমাইজেশন উপেক্ষা করা
- ❌ ব্যর্থতার সিনারিও পরীক্ষা না করা
- ❌ স্বাস্থ্য পরীক্ষা ছাড়া মোতায়েন করা

## AZD AI CLI কমান্ড এবং এক্সটেনশনস

AZD AI-নির্দিষ্ট কমান্ড এবং এক্সটেনশনসের একটি ক্রমবর্ধমান সেট অন্তর্ভুক্ত করে যা প্রোডাকশন AI ওয়ার্কফ্লোকে সহজ করে। এই সরঞ্জামগুলো স্থানীয় ডেভেলপমেন্ট এবং প্রোডাকশন মোতায়েনের মধ্যে ব্যবধান কমায়।

### AI এর জন্য AZD এক্সটেনশনস

AZD একটি এক্সটেনশন সিস্টেম ব্যবহার করে AI-নির্দিষ্ট সক্ষমতা যুক্ত করতে। এক্সটেনশন ইনস্টল এবং পরিচালনা করুন:

```bash
# সব উপলব্ধ এক্সটেনশন তালিকাভুক্ত করুন (এআই সহ)
azd extension list

# ইনস্টল করা এক্সটেনশনের বিস্তারিত পরিদর্শন করুন
azd extension show azure.ai.agents

# ফাউন্ড্রি এজেন্টস এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.agents

# ফাইন-টিউনিং এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.finetune

# কাস্টম মডেল এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.models

# সব ইনস্টল করা এক্সটেনশন আপগ্রেড করুন
azd extension upgrade --all
```

**উপলব্ধ AI এক্সটেনশনস:**

| এক্সটেনশন | উদ্দেশ্য | অবস্থা |
|-----------|---------|--------|
| `azure.ai.agents` | Foundry Agent সার্ভিস ম্যানেজমেন্ট | প্রিভিউ |
| `azure.ai.finetune` | Foundry মডেল ফাইন-টিউনিং | প্রিভিউ |
| `azure.ai.models` | Foundry কাস্টম মডেল | প্রিভিউ |
| `azure.coding-agent` | কোডিং এজেন্ট কনফিগারেশন | উপলব্ধ |

### `azd ai agent init` দিয়ে এজেন্ট প্রকল্প আরম্ভ

`azd ai agent init` কমান্ডটি একটি প্রোডাকশন-রেডি AI এজেন্ট প্রকল্প স্ক্যাফোল্ড এবং Microsoft Foundry Agent সার্ভিসের সাথে সংহত করে:

```bash
# একটি এজেন্ট মেনিফেস্ট থেকে নতুন এজেন্ট প্রকল্প শুরু করুন
azd ai agent init -m <manifest-path-or-uri>

# একটি নির্দিষ্ট ফাউন্ড্রি প্রকল্প শুরু করুন এবং লক্ষ্য করুন
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# একটি কাস্টম সোর্স ডিরেক্টরি দিয়ে শুরু করুন
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# হোস্ট হিসাবে কন্টেইনার অ্যাপস লক্ষ্য করুন
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**মূল ফ্ল্যাগ:**

| ফ্ল্যাগ | বিবরণ |
|------|-------------|
| `-m, --manifest` | একটি এজেন্ট manifests পাথ বা URI যা প্রকল্পে যোগ করা হবে |
| `-p, --project-id` | বিদ্যমান Microsoft Foundry প্রজেক্ট আইডি আপনার azd পরিবেশের জন্য |
| `-s, --src` | এজেন্ট ডিফিনিশন ডাউনলোডের ডিরেক্টরি (ডিফল্ট `src/<agent-id>`) |
| `--host` | ডিফল্ট হোস্ট ওভাররাইড করুন (যেমন, `containerapp`) |
| `-e, --environment` | ব্যবহার করার azd পরিবেশ |

**প্রোডাকশন টিপ**: `--project-id` ব্যবহার করে সরাসরি বিদ্যমান Foundry প্রজেক্টের সাথে সংযোগ করুন, আপনার এজেন্ট কোড ও ক্লাউড রিসোর্সকে শুরু থেকেই যুক্ত রাখুন।

### `azd mcp` সহ মডেল কনটেক্সট প্রোটোকল (MCP)

AZD বিল্ট-ইন MCP সার্ভার সাপোর্ট (অ্যালফা) প্রদান করে, যা AI এজেন্ট এবং টুলকে Azure রিসোর্সের সাথে স্ট্যান্ডার্ড প্রোটোকলে ইন্টারঅ্যাক্ট করার সুযোগ দেয়:

```bash
# আপনার প্রকল্পের জন্য MCP সার্ভার শুরু করুন
azd mcp start

# টুল কার্যকর করার জন্য বর্তমান কপাইলট সম্মতিমূলক নিয়মগুলি পর্যালোচনা করুন
azd copilot consent list
```

MCP সার্ভার আপনার azd প্রজেক্ট কনটেক্সট—পরিবেশ, সার্ভিস, এবং Azure রিসোর্সগুলো AI-চালিত ডেভেলপমেন্ট টুলের কাছে প্রদর্শন করে। এর সুফল:

- **AI-সহায়ক মোতায়েন**: কোডিং এজেন্টরা আপনার প্রজেক্ট অবস্থা জানতে পারে ও মোতায়েন ট্রিগার করতে পারে  
- **রিসোর্স আবিষ্কার**: AI টুলগুলো জানতে পারে আপনার প্রজেক্ট কোন Azure রিসোর্স ব্যবহার করছে  
- **পরিবেশ ম্যানেজমেন্ট**: এজেন্টরা dev/staging/production পরিবেশের মধ্যে স্যুইচ করতে পারে  

### `azd infra generate` দিয়ে ইনফ্রাস্ট্রাকচার জেনারেশন

প্রোডাকশন AI ওয়ার্কলোডের জন্য, আপনি স্বয়ংক্রিয় প্রভিশনিংয়ের পরিবর্তে ইনফ্রাস্ট্রাকচার অ্যাজ কোড তৈরি ও কাস্টমাইজ করতে পারেন:

```bash
# আপনার প্রকল্প সংজ্ঞা থেকে Bicep/Terraform ফাইল তৈরি করুন
azd infra generate
```

এটি ডিস্কে IaC লিখে যাতে আপনি:
- মোতায়েনের আগে পর্যালোচনা এবং নিরীক্ষণ করতে পারেন
- কাস্টম সিকিউরিটি নীতি (নেটওয়ার্ক রুল, প্রাইভেট এন্ডপয়েন্ট) যোগ করতে পারেন
- বিদ্যমান IaC পর্যালোচনা প্রক্রিয়ার সাথে সংহত করতে পারেন
- অ্যাপ্লিকেশন কোড থেকে আলাদা করে ইনফ্রাস্ট্রাকচার পরিবর্তন ভার্সন কন্ট্রোল করতে পারেন

### প্রোডাকশন লাইফসাইকেল হুকস

AZD হুকস আপনাকে মোতায়েন লাইফসাইকেলের প্রত্যেক ধাপে কাস্টম লজিক ইনজেক্ট করার সুযোগ দেয় — যা প্রোডাকশন AI ওয়ার্কফ্লোর জন্য অত্যন্ত গুরুত্বপূর্ণ:

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
# ডেভেলপমেন্টের সময় একটি নির্দিষ্ট হুক ম্যানুয়ালি চালান
azd hooks run predeploy
```

**AI ওয়ার্কলোডের জন্য প্রস্তাবিত প্রোডাকশন হুকস:**

| হুক | ব্যবহারের ক্ষেত্র |
|------|----------|
| `preprovision` | AI মডেল ক্ষমতার সাবস্ক্রিপশন কোটার যাচাইকরণ |
| `postprovision` | প্রাইভেট এন্ডপয়েন্ট কনফিগারেশন, মডেল ওয়েট মোতায়েন |
| `predeploy` | AI সেফটি পরীক্ষা চালানো, প্রম্পট টেমপ্লেট যাচাইকরণ |
| `postdeploy` | এজেন্ট প্রতিক্রিয়া স্মোকটেস্ট, মডেল সংযোগ যাচাই |

### CI/CD পাইপলাইন কনফিগারেশন

`azd pipeline config` ব্যবহার করে আপনার প্রজেক্ট GitHub Actions বা Azure Pipelines এর সাথে নিরাপদ Azure প্রমাণীকরণ দিয়ে সংযুক্ত করুন:

```bash
# সি আই/সি ডি পাইপলাইন কনফিগার করুন (ইন্টারঅ্যাক্টিভ)
azd pipeline config

# একটি নির্দিষ্ট প্রদানকারীর সাথে কনফিগার করুন
azd pipeline config --provider github
```

এই কমান্ডটি:
- সর্বনিম্ন অগ্রাধিকার সহ একটি সার্ভিস প্রিন্সিপাল তৈরি করে
- ফেডারেটেড ক্রেডেনশিয়াল কনফিগার (কোন সিক্রেট সংরক্ষণ নয়)
- আপনার পাইপলাইন সংজ্ঞা ফাইল তৈরি বা আপডেট করে
- আপনার CI/CD সিস্টেমে প্রয়োজনীয় পরিবেশ পরিবর্তনশীল সেট করে

**পাইপলাইন কনফিগ সহ প্রোডাকশন ওয়ার্কফ্লো:**

```bash
# ১. প্রোডাকশন পরিবেশ সেট আপ করুন
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# ২. পাইপলাইন কনফিগার করুন
azd pipeline config --provider github

# ৩. পাইপলাইন প্রতিটি মেইন ব্রাঞ্চের পুশে azd deploy চালায়
```

### `azd add` দিয়ে কম্পোনেন্ট যোগ করা

বিদ্যমান প্রজেক্টে Azure সার্ভিস ইনক্রিমেন্টালি যোগ করুন:

```bash
# একটি নতুন সার্ভিস কম্পোনেন্ট ইন্টারঅ্যাকটিভভাবে যোগ করুন
azd add
```

এটি প্রোডাকশন AI অ্যাপ্লিকেশন বিস্তারের জন্য বিশেষভাবে সহায়ক — উদাহরণস্বরূপ, একটি ভেক্টর সার্চ সার্ভিস, নতুন এজেন্ট এন্ডপয়েন্ট, বা একটি মনিটরিং উপাদান বিদ্যমান মোতায়েনে যোগ করা।

## অতিরিক্ত রিসোর্সসমূহ
- **অ্যাজিউর ওয়েল-আর্কিটেক্টেড ফ্রেমওয়ার্ক**: [এআই ওয়ার্কলোড গাইডেন্স](https://learn.microsoft.com/azure/well-architected/ai/)
- **মাইক্রোসফট ফাউন্ড্রি ডকুমেন্টেশন**: [আধিকারিক ডকস](https://learn.microsoft.com/azure/ai-studio/)
- **কমিউনিটি টেমপ্লেটস**: [অ্যাজিউর স্যাম্পলস](https://github.com/Azure-Samples)
- **ডিসকর্ড কমিউনিটি**: [#অ্যাজিউর চ্যানেল](https://discord.gg/microsoft-azure)
- **অ্যাজেন্ট স্কিলস ফর অ্যাজিউর**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - অ্যাজিউর এআই, ফাউন্ড্রি, ডিপ্লয়মেন্ট, খরচ কমানো, এবং ডায়াগনস্টিকসের জন্য ৩৭টি ওপেন অ্যাজেন্ট স্কিল। আপনার এডিটরে ইনস্টল করুন:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর শুরু করার জন্য](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৮ - প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস
- **⬅️ আগের অধ্যায়**: [অধ্যায় ৭: সমস্যা সমাধান](../chapter-07-troubleshooting/debugging.md)
- **⬅️ এছাড়াও সম্পর্কিত**: [এআই ওয়ার্কশপ ল্যাব](ai-workshop-lab.md)
- **🧑‍🎓 কোর্স সম্পন্ন**: [AZD ফর শুরু করার জন্য](../../README.md)

**স্মরণ করিয়ে দিচ্ছি**: প্রোডাকশন এআই ওয়ার্কলোডস সতর্ক পরিকল্পনা, পর্যবেক্ষণ, এবং ধারাবাহিক অপ্টিমাইজেশন প্রয়োজন। এই প্যাটার্ন থেকে শুরু করুন এবং আপনার নির্দিষ্ট চাহিদাগুলোর সাথে এগুলো মানিয়ে নিন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**স্বীকারোক্তি**:  
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে automated অনুবাদে ভুল বা অসঙ্গতির সম্ভাবনা থাকতে পারে। মূল নথিটি তার মাতৃভাষায়ই কর্তৃপক্ষের উৎস হিসেবে বিবেচনা করা উচিত। গুরত্বপূর্ণ তথ্যের জন্য পেশাগত মানব অনুবাদের সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে সৃষ্ট যে কোনও ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়িত্ব নেই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->