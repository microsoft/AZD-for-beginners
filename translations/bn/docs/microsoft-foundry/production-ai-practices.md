<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a248f574dbb58c1f58a7bcc3f47e361",
  "translation_date": "2025-11-20T15:50:21+00:00",
  "source_file": "docs/microsoft-foundry/production-ai-practices.md",
  "language_code": "bn"
}
-->
# AZD দিয়ে প্রোডাকশন AI ওয়ার্কলোডের সেরা অনুশীলন

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনার্স](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার ৮ - প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস
- **⬅️ পূর্ববর্তী চ্যাপ্টার**: [চ্যাপ্টার ৭: সমস্যা সমাধান](../troubleshooting/debugging.md)
- **⬅️ সম্পর্কিত**: [AI ওয়ার্কশপ ল্যাব](ai-workshop-lab.md)
- **🎯 কোর্স সম্পন্ন**: [AZD ফর বিগিনার্স](../../README.md)

## সংক্ষিপ্ত বিবরণ

এই গাইডটি Azure Developer CLI (AZD) ব্যবহার করে প্রোডাকশন-রেডি AI ওয়ার্কলোড ডিপ্লয় করার জন্য সেরা অনুশীলন প্রদান করে। Microsoft Foundry Discord কমিউনিটি এবং বাস্তব গ্রাহক ডিপ্লয়মেন্ট থেকে পাওয়া মতামতের ভিত্তিতে, এই অনুশীলনগুলো প্রোডাকশন AI সিস্টেমে সাধারণ চ্যালেঞ্জগুলো সমাধান করে।

## প্রধান চ্যালেঞ্জগুলো

আমাদের কমিউনিটি পোলের ফলাফলের ভিত্তিতে, ডেভেলপাররা নিম্নলিখিত চ্যালেঞ্জগুলোতে বেশি সমস্যায় পড়েন:

- **৪৫%** মাল্টি-সার্ভিস AI ডিপ্লয়মেন্টে সমস্যায় পড়েন
- **৩৮%** ক্রেডেনশিয়াল এবং সিক্রেট ম্যানেজমেন্টে সমস্যায় পড়েন  
- **৩৫%** প্রোডাকশন রেডিনেস এবং স্কেলিং কঠিন মনে করেন
- **৩২%** খরচ অপ্টিমাইজেশনের জন্য ভালো কৌশল প্রয়োজন
- **২৯%** মনিটরিং এবং সমস্যা সমাধানে উন্নতি চান

## প্রোডাকশন AI এর জন্য আর্কিটেকচার প্যাটার্নস

### প্যাটার্ন ১: মাইক্রোসার্ভিস AI আর্কিটেকচার

**কখন ব্যবহার করবেন**: একাধিক সক্ষমতা সহ জটিল AI অ্যাপ্লিকেশন

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

**কখন ব্যবহার করবেন**: ব্যাচ প্রসেসিং, ডকুমেন্ট অ্যানালাইসিস, অ্যাসিঙ্ক ওয়ার্কফ্লো

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

## সিকিউরিটি সেরা অনুশীলন

### ১. জিরো-ট্রাস্ট সিকিউরিটি মডেল

**ইমপ্লিমেন্টেশন স্ট্র্যাটেজি**:
- অটেনটিকেশন ছাড়া কোনো সার্ভিস-টু-সার্ভিস কমিউনিকেশন নয়
- সব API কল ম্যানেজড আইডেন্টিটি ব্যবহার করে
- প্রাইভেট এন্ডপয়েন্ট দিয়ে নেটওয়ার্ক আইসোলেশন
- লিস্ট প্রিভিলেজ অ্যাক্সেস কন্ট্রোল

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

### ২. সিকিউর সিক্রেট ম্যানেজমেন্ট

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

### ৩. নেটওয়ার্ক সিকিউরিটি

**প্রাইভেট এন্ডপয়েন্ট কনফিগারেশন**:

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

### ১. অটো-স্কেলিং স্ট্র্যাটেজি

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

### ২. ক্যাশিং স্ট্র্যাটেজি

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

### ৩. লোড ব্যালেন্সিং এবং ট্রাফিক ম্যানেজমেন্ট

**অ্যাপ্লিকেশন গেটওয়ে WAF সহ**:

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

### ১. রিসোর্স রাইট-সাইজিং

**এনভায়রনমেন্ট-স্পেসিফিক কনফিগারেশন**:

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

### ২. খরচ মনিটরিং এবং বাজেট

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
      // প্রসঙ্গ ছাঁটাই করুন, ব্যবহারকারীর ইনপুট নয়
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // আনুমানিক হিসাব: ১ টোকেন ≈ ৪ অক্ষর
    return Math.ceil(text.length / 4);
  }
}
```

## মনিটরিং এবং অবজারভেবিলিটি

### ১. ব্যাপক অ্যাপ্লিকেশন ইনসাইটস

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

### ২. AI-স্পেসিফিক মনিটরিং

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

### ৩. হেলথ চেক এবং আপটাইম মনিটরিং

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

## ডিজাস্টার রিকভারি এবং হাই অ্যাভেইলেবিলিটি

### ১. মাল্টি-রিজিওন ডিপ্লয়মেন্ট

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

### ২. ডেটা ব্যাকআপ এবং রিকভারি

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

## ডেভঅপস এবং CI/CD ইন্টিগ্রেশন

### ১. GitHub Actions Workflow

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

### ২. ইনফ্রাস্ট্রাকচার ভ্যালিডেশন

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# সমস্ত প্রয়োজনীয় পরিষেবাগুলি চালু আছে কিনা তা পরীক্ষা করুন
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI মডেল ডিপ্লয়মেন্টগুলি যাচাই করুন
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI পরিষেবার সংযোগযোগ্যতা পরীক্ষা করুন
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## প্রোডাকশন রেডিনেস চেকলিস্ট

### সিকিউরিটি ✅
- [ ] সব সার্ভিস ম্যানেজড আইডেন্টিটি ব্যবহার করে
- [ ] সিক্রেট কি ভল্টে সংরক্ষিত
- [ ] প্রাইভেট এন্ডপয়েন্ট কনফিগার করা
- [ ] নেটওয়ার্ক সিকিউরিটি গ্রুপ ইমপ্লিমেন্ট করা
- [ ] লিস্ট প্রিভিলেজ সহ RBAC
- [ ] পাবলিক এন্ডপয়েন্টে WAF সক্রিয়

### পারফরম্যান্স ✅
- [ ] অটো-স্কেলিং কনফিগার করা
- [ ] ক্যাশিং ইমপ্লিমেন্ট করা
- [ ] লোড ব্যালেন্সিং সেটআপ করা
- [ ] স্ট্যাটিক কন্টেন্টের জন্য CDN
- [ ] ডাটাবেস কানেকশন পুলিং
- [ ] টোকেন ব্যবহারের অপ্টিমাইজেশন

### মনিটরিং ✅
- [ ] অ্যাপ্লিকেশন ইনসাইটস কনফিগার করা
- [ ] কাস্টম মেট্রিক্স ডিফাইন করা
- [ ] অ্যালার্টিং রুলস সেটআপ করা
- [ ] ড্যাশবোর্ড তৈরি করা
- [ ] হেলথ চেক ইমপ্লিমেন্ট করা
- [ ] লগ রিটেনশন পলিসি

### রিলায়েবিলিটি ✅
- [ ] মাল্টি-রিজিওন ডিপ্লয়মেন্ট
- [ ] ব্যাকআপ এবং রিকভারি প্ল্যান
- [ ] সার্কিট ব্রেকার ইমপ্লিমেন্ট করা
- [ ] রিট্রাই পলিসি কনফিগার করা
- [ ] গ্রেসফুল ডিগ্রেডেশন
- [ ] হেলথ চেক এন্ডপয়েন্ট

### খরচ ব্যবস্থাপনা ✅
- [ ] বাজেট অ্যালার্ট কনফিগার করা
- [ ] রিসোর্স রাইট-সাইজিং
- [ ] ডেভ/টেস্ট ডিসকাউন্ট প্রয়োগ করা
- [ ] রিজার্ভড ইনস্ট্যান্স কেনা
- [ ] খরচ মনিটরিং ড্যাশবোর্ড
- [ ] নিয়মিত খরচ পর্যালোচনা

### কমপ্লায়েন্স ✅
- [ ] ডেটা রেসিডেন্সি রিকোয়ারমেন্ট পূরণ
- [ ] অডিট লগিং সক্রিয়
- [ ] কমপ্লায়েন্স পলিসি প্রয়োগ
- [ ] সিকিউরিটি বেসলাইন ইমপ্লিমেন্ট
- [ ] নিয়মিত সিকিউরিটি অ্যাসেসমেন্ট
- [ ] ইনসিডেন্ট রেসপন্স প্ল্যান

## পারফরম্যান্স বেঞ্চমার্ক

### সাধারণ প্রোডাকশন মেট্রিক্স

| মেট্রিক | লক্ষ্য | মনিটরিং |
|--------|--------|------------|
| **রেসপন্স টাইম** | < ২ সেকেন্ড | অ্যাপ্লিকেশন ইনসাইটস |
| **অ্যাভেইলেবিলিটি** | ৯৯.৯% | আপটাইম মনিটরিং |
| **এরর রেট** | < ০.১% | অ্যাপ্লিকেশন লগ |
| **টোকেন ব্যবহারের খরচ** | < $৫০০/মাস | খরচ ব্যবস্থাপনা |
| **কনকারেন্ট ইউজার** | ১০০০+ | লোড টেস্টিং |
| **রিকভারি টাইম** | < ১ ঘণ্টা | ডিজাস্টার রিকভারি টেস্ট |

### লোড টেস্টিং

```bash
# এআই অ্যাপ্লিকেশনের জন্য লোড টেস্টিং স্ক্রিপ্ট
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 কমিউনিটি সেরা অনুশীলন

Microsoft Foundry Discord কমিউনিটির মতামতের ভিত্তিতে:

### কমিউনিটির শীর্ষ সুপারিশ:

1. **ছোট থেকে শুরু করুন, ধীরে ধীরে স্কেল করুন**: বেসিক SKUs দিয়ে শুরু করুন এবং বাস্তব ব্যবহারের ভিত্তিতে স্কেল করুন
2. **সবকিছু মনিটর করুন**: প্রথম দিন থেকেই ব্যাপক মনিটরিং সেটআপ করুন
3. **সিকিউরিটি অটোমেট করুন**: ইনফ্রাস্ট্রাকচার অ্যাজ কোড ব্যবহার করে সিকিউরিটি নিশ্চিত করুন
4. **ভালোভাবে টেস্ট করুন**: আপনার পাইপলাইনে AI-স্পেসিফিক টেস্টিং অন্তর্ভুক্ত করুন
5. **খরচ পরিকল্পনা করুন**: টোকেন ব্যবহারের মনিটরিং এবং বাজেট অ্যালার্ট আগে থেকেই সেট করুন

### সাধারণ ভুলগুলো এড়িয়ে চলুন:

- ❌ কোডে API কী হার্ডকোড করা
- ❌ সঠিক মনিটরিং সেটআপ না করা
- ❌ খরচ অপ্টিমাইজেশন উপেক্ষা করা
- ❌ ব্যর্থতার পরিস্থিতি টেস্ট না করা
- ❌ হেলথ চেক ছাড়া ডিপ্লয় করা

## অতিরিক্ত রিসোর্স

- **Azure Well-Architected Framework**: [AI ওয়ার্কলোড গাইডেন্স](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry ডকুমেন্টেশন**: [অফিশিয়াল ডকস](https://learn.microsoft.com/azure/ai-studio/)
- **কমিউনিটি টেমপ্লেটস**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord কমিউনিটি**: [#Azure চ্যানেল](https://discord.gg/microsoft-azure)

---

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনার্স](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার ৮ - প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস
- **⬅️ পূর্ববর্তী চ্যাপ্টার**: [চ্যাপ্টার ৭: সমস্যা সমাধান](../troubleshooting/debugging.md)
- **⬅️ সম্পর্কিত**: [AI ওয়ার্কশপ ল্যাব](ai-workshop-lab.md)
- **🎆 কোর্স সম্পন্ন**: [AZD ফর বিগিনার্স](../../README.md)

**মনে রাখবেন**: প্রোডাকশন AI ওয়ার্কলোডের জন্য সঠিক পরিকল্পনা, মনিটরিং এবং ক্রমাগত অপ্টিমাইজেশন প্রয়োজন। এই প্যাটার্নগুলো দিয়ে শুরু করুন এবং আপনার নির্দিষ্ট প্রয়োজন অনুযায়ী এগুলোকে মানিয়ে নিন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->