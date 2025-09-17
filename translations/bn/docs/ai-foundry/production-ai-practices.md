<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "db39cf7acc134578c846d7accd6bb04d",
  "translation_date": "2025-09-12T19:32:54+00:00",
  "source_file": "docs/ai-foundry/production-ai-practices.md",
  "language_code": "bn"
}
-->
# AZD ব্যবহার করে প্রোডাকশন AI ওয়ার্কলোডের সেরা অনুশীলন

**পূর্ববর্তী:** [AI Workshop Lab](ai-workshop-lab.md) | **পরবর্তী:** [AI Troubleshooting Guide](../troubleshooting/ai-troubleshooting.md)

## সংক্ষিপ্ত বিবরণ

এই গাইডটি Azure Developer CLI (AZD) ব্যবহার করে প্রোডাকশন-রেডি AI ওয়ার্কলোড স্থাপনের জন্য ব্যাপক সেরা অনুশীলন প্রদান করে। Azure AI Foundry Discord কমিউনিটি এবং বাস্তব-জীবনের গ্রাহক স্থাপনার প্রতিক্রিয়ার উপর ভিত্তি করে, এই অনুশীলনগুলি প্রোডাকশন AI সিস্টেমের সবচেয়ে সাধারণ চ্যালেঞ্জগুলির সমাধান করে।

## প্রধান চ্যালেঞ্জগুলি

আমাদের কমিউনিটি পোলের ফলাফলের উপর ভিত্তি করে, ডেভেলপাররা নিম্নলিখিত চ্যালেঞ্জগুলির মুখোমুখি হন:

- **৪৫%** মাল্টি-সার্ভিস AI স্থাপনার সাথে সংগ্রাম করেন
- **৩৮%** ক্রেডেনশিয়াল এবং সিক্রেট ম্যানেজমেন্টে সমস্যার সম্মুখীন হন  
- **৩৫%** প্রোডাকশন প্রস্তুতি এবং স্কেলিং কঠিন মনে করেন
- **৩২%** আরও ভালো খরচ অপ্টিমাইজেশন কৌশল প্রয়োজন
- **২৯%** উন্নত মনিটরিং এবং সমস্যা সমাধানের প্রয়োজন

## প্রোডাকশন AI-এর জন্য আর্কিটেকচার প্যাটার্ন

### প্যাটার্ন ১: মাইক্রোসার্ভিস AI আর্কিটেকচার

**কখন ব্যবহার করবেন**: একাধিক ক্ষমতা সহ জটিল AI অ্যাপ্লিকেশন

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

**AZD বাস্তবায়ন**:

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

### প্যাটার্ন ২: ইভেন্ট-চালিত AI প্রসেসিং

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

## নিরাপত্তার সেরা অনুশীলন

### ১. জিরো-ট্রাস্ট সিকিউরিটি মডেল

**বাস্তবায়ন কৌশল**:
- প্রমাণীকরণ ছাড়া কোনো সার্ভিস-টু-সার্ভিস যোগাযোগ নয়
- সমস্ত API কল ম্যানেজড আইডেন্টিটি ব্যবহার করে
- প্রাইভেট এন্ডপয়েন্ট সহ নেটওয়ার্ক আইসোলেশন
- সর্বনিম্ন প্রিভিলেজ অ্যাক্সেস নিয়ন্ত্রণ

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

### ২. সিক্রেট ম্যানেজমেন্ট সুরক্ষিত করা

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

### ৩. নেটওয়ার্ক সুরক্ষা

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

**AI রেসপন্সের জন্য Redis Cache**:

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

**WAF সহ অ্যাপ্লিকেশন গেটওয়ে**:

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

**পরিবেশ-নির্দিষ্ট কনফিগারেশন**:

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

## মনিটরিং এবং পর্যবেক্ষণযোগ্যতা

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

### ৩. স্বাস্থ্য পরীক্ষা এবং আপটাইম মনিটরিং

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

## দুর্যোগ পুনরুদ্ধার এবং উচ্চ প্রাপ্যতা

### ১. মাল্টি-রিজিওন স্থাপন

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

### ২. ডেটা ব্যাকআপ এবং পুনরুদ্ধার

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

### ২. অবকাঠামো যাচাইকরণ

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

## প্রোডাকশন প্রস্তুতির চেকলিস্ট

### নিরাপত্তা ✅
- [ ] সমস্ত সার্ভিস ম্যানেজড আইডেন্টিটি ব্যবহার করে
- [ ] সিক্রেট Key Vault-এ সংরক্ষিত
- [ ] প্রাইভেট এন্ডপয়েন্ট কনফিগার করা হয়েছে
- [ ] নেটওয়ার্ক সিকিউরিটি গ্রুপ বাস্তবায়িত
- [ ] RBAC সর্বনিম্ন প্রিভিলেজ সহ
- [ ] পাবলিক এন্ডপয়েন্টে WAF সক্রিয়

### পারফরম্যান্স ✅
- [ ] অটো-স্কেলিং কনফিগার করা হয়েছে
- [ ] ক্যাশিং বাস্তবায়িত
- [ ] লোড ব্যালেন্সিং সেটআপ
- [ ] স্ট্যাটিক কন্টেন্টের জন্য CDN
- [ ] ডাটাবেস সংযোগ পুলিং
- [ ] টোকেন ব্যবহারের অপ্টিমাইজেশন

### মনিটরিং ✅
- [ ] অ্যাপ্লিকেশন ইনসাইটস কনফিগার করা হয়েছে
- [ ] কাস্টম মেট্রিক্স সংজ্ঞায়িত
- [ ] অ্যালার্টিং নিয়ম সেটআপ
- [ ] ড্যাশবোর্ড তৈরি করা হয়েছে
- [ ] স্বাস্থ্য পরীক্ষা বাস্তবায়িত
- [ ] লগ রিটেনশন নীতিমালা

### নির্ভরযোগ্যতা ✅
- [ ] মাল্টি-রিজিওন স্থাপন
- [ ] ব্যাকআপ এবং পুনরুদ্ধার পরিকল্পনা
- [ ] সার্কিট ব্রেকার বাস্তবায়িত
- [ ] রিট্রাই নীতিমালা কনফিগার করা হয়েছে
- [ ] গ্রেসফুল ডিগ্রেডেশন
- [ ] স্বাস্থ্য পরীক্ষা এন্ডপয়েন্ট

### খরচ ব্যবস্থাপনা ✅
- [ ] বাজেট অ্যালার্ট কনফিগার করা হয়েছে
- [ ] রিসোর্স রাইট-সাইজিং
- [ ] Dev/test ডিসকাউন্ট প্রয়োগ করা হয়েছে
- [ ] রিজার্ভড ইনস্ট্যান্স কেনা হয়েছে
- [ ] খরচ মনিটরিং ড্যাশবোর্ড
- [ ] নিয়মিত খরচ পর্যালোচনা

### সম্মতি ✅
- [ ] ডেটা রেসিডেন্সি প্রয়োজনীয়তা পূরণ
- [ ] অডিট লগিং সক্রিয়
- [ ] সম্মতি নীতিমালা প্রয়োগ
- [ ] সিকিউরিটি বেসলাইন বাস্তবায়িত
- [ ] নিয়মিত সিকিউরিটি মূল্যায়ন
- [ ] ইনসিডেন্ট রেসপন্স পরিকল্পনা

## পারফরম্যান্স বেঞ্চমার্ক

### সাধারণ প্রোডাকশন মেট্রিক্স

| মেট্রিক | লক্ষ্য | মনিটরিং |
|--------|--------|------------|
| **রেসপন্স টাইম** | < ২ সেকেন্ড | অ্যাপ্লিকেশন ইনসাইটস |
| **প্রাপ্যতা** | ৯৯.৯% | আপটাইম মনিটরিং |
| **ত্রুটি হার** | < ০.১% | অ্যাপ্লিকেশন লগ |
| **টোকেন ব্যবহার** | < $৫০০/মাস | খরচ ব্যবস্থাপনা |
| **একযোগে ব্যবহারকারী** | ১০০০+ | লোড টেস্টিং |
| **পুনরুদ্ধারের সময়** | < ১ ঘণ্টা | দুর্যোগ পুনরুদ্ধার পরীক্ষা |

### লোড টেস্টিং

```bash
# Load testing script for AI applications
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 কমিউনিটির সেরা অনুশীলন

Azure AI Foundry Discord কমিউনিটির প্রতিক্রিয়ার উপর ভিত্তি করে:

### কমিউনিটির শীর্ষ সুপারিশ:

1. **ছোট শুরু করুন, ধীরে ধীরে স্কেল করুন**: বেসিক SKUs দিয়ে শুরু করুন এবং প্রকৃত ব্যবহারের উপর ভিত্তি করে স্কেল করুন
2. **সবকিছু মনিটর করুন**: প্রথম দিন থেকেই ব্যাপক মনিটরিং সেটআপ করুন
3. **নিরাপত্তা স্বয়ংক্রিয় করুন**: ধারাবাহিক নিরাপত্তার জন্য কোড হিসেবে অবকাঠামো ব্যবহার করুন
4. **ভালোভাবে পরীক্ষা করুন**: আপনার পাইপলাইনে AI-নির্দিষ্ট পরীক্ষার অন্তর্ভুক্ত করুন
5. **খরচ পরিকল্পনা করুন**: টোকেন ব্যবহারের মনিটরিং এবং বাজেট অ্যালার্ট আগে থেকেই সেট করুন

### সাধারণ ভুল এড়াতে:

- ❌ কোডে API কী হার্ডকোড করা
- ❌ সঠিক মনিটরিং সেটআপ না করা
- ❌ খরচ অপ্টিমাইজেশন উপেক্ষা করা
- ❌ ব্যর্থতার পরিস্থিতি পরীক্ষা না করা
- ❌ স্বাস্থ্য পরীক্ষা ছাড়া স্থাপন করা

## অতিরিক্ত সম্পদ

- **Azure Well-Architected Framework**: [AI ওয়ার্কলোড গাইডেন্স](https://learn.microsoft.com/azure/well-architected/ai/)
- **Azure AI Foundry ডকুমেন্টেশন**: [অফিশিয়াল ডকস](https://learn.microsoft.com/azure/ai-studio/)
- **কমিউনিটি টেমপ্লেট**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord কমিউনিটি**: [#Azure চ্যানেল](https://discord.gg/microsoft-azure)

---

**পূর্ববর্তী:** [AI Workshop Lab](ai-workshop-lab.md) | **পরবর্তী:** [AI Troubleshooting Guide](../troubleshooting/ai-troubleshooting.md)

**মনে রাখবেন**: প্রোডাকশন AI ওয়ার্কলোডের জন্য যত্নশীল পরিকল্পনা, মনিটরিং এবং ধারাবাহিক অপ্টিমাইজেশন প্রয়োজন। এই প্যাটার্নগুলি দিয়ে শুরু করুন এবং আপনার নির্দিষ্ট প্রয়োজনীয়তার সাথে মানিয়ে নিন।

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।