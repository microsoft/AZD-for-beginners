# उत्पादन AI वर्कलोड हेतु सर्वोत्कृष्ट प्रथाएँ AZD के साथ

**अध्याय नेविगेशन:**
- **📚 पाठ्यक्रम गृह**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 8 - उत्पादन और एंटरप्राइज़ पैटर्न
- **⬅️ पिछला अध्याय**: [अध्याय 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ भी संबंधित**: [AI वर्कशॉप लैब](ai-workshop-lab.md)
- **🎯 पाठ्यक्रम पूरा**: [AZD For Beginners](../../README.md)

## अवलोकन

यह मार्गदर्शिका Azure Developer CLI (AZD) का उपयोग करके प्रोडक्शन-तैयार AI वर्कलोड्स को डिप्लॉय करने के लिए व्यापक सर्वोत्तम प्रथाएँ प्रदान करती है। Microsoft Foundry Discord समुदाय से प्रतिक्रिया और वास्तविक ग्राहक तैनातियों के आधार पर, ये प्रथाएँ प्रोडक्शन AI सिस्टम्स में सबसे सामान्य चुनौतियों को संबोधित करती हैं।

## प्रमुख चुनौतियाँ जिन्हें संबोधित किया गया है

हमारे समुदाय के पोल परिणामों के आधार पर, डेवलपर्स जिन्हें सबसे अधिक समस्याएँ होती हैं वे हैं:

- **45%** बहु-सर्विस AI डिप्लॉयमेंट्स के साथ जूझते हैं
- **38%** क्रेडेंशियल और सीक्रेट प्रबंधन में समस्याएँ करते हैं  
- **35%** प्रोडक्शन रेडीनेस और स्केलिंग को कठिन पाते हैं
- **32%** बेहतर लागत अनुकूलन रणनीतियों की आवश्यकता है
- **29%** निगरानी और ट्रबलशूटिंग में सुधार की आवश्यकता है

## प्रोडक्शन AI के लिए आर्किटेक्चर पैटर्न

### पैटर्न 1: माइक्रोसर्विसेज़ AI आर्किटेक्चर

**कब उपयोग करें**: जटिल AI एप्लिकेशन्स जिनमें कई क्षमताएँ हों

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

**AZD कार्यान्वयन**:

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

### पैटर्न 2: इवेंट-ड्रिवन AI प्रोसेसिंग

**कब उपयोग करें**: बैच प्रोसेसिंग, दस्तावेज़ विश्लेषण, असिंक्रोनस वर्कफ़्लो

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

## सुरक्षा सर्वोत्तम प्रथाएँ

### 1. ज़ीरो-ट्रस्ट सुरक्षा मॉडल

**कार्यान्वयन रणनीति**:
- प्रमाणिकरण के बिना कोई सेवा-से-सेवा संचार नहीं
- सभी API कॉल्स प्रबंधित पहचान (managed identities) का उपयोग करते हैं
- प्राइवेट एंडपॉइंट्स के साथ नेटवर्क अलगाव
- न्यूनतम अनुमतियाँ (least privilege) एक्सेस कंट्रोल

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

### 2. सुरक्षित सीक्रेट प्रबंधन

**Key Vault एकीकरण पैटर्न**:

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

### 3. नेटवर्क सुरक्षा

**प्राइवेट एंडपॉइंट कॉन्फ़िगरेशन**:

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

## प्रदर्शन और स्केलिंग

### 1. ऑटो-स्केलिंग रणनीतियाँ

**Container Apps ऑटो-स्केलिंग**:

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

### 2. कैशिंग रणनीतियाँ

**AI प्रतिक्रियाओं के लिए Redis Cache**:

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

### 3. लोड बैलेंसिंग और ट्रैफ़िक प्रबंधन

**Application Gateway के साथ WAF**:

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

## 💰 लागत अनुकूलन

### 1. संसाधन का सही आकार निर्धारण

**पर्यावरण-विशिष्ट कॉन्फ़िगरेशन**:

```bash
# विकास वातावरण
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# उत्पादन वातावरण
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. लागत निगरानी और बजट

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

### 3. टोकन उपयोग अनुकूलन

**OpenAI लागत प्रबंधन**:

```typescript
// एप्लिकेशन-स्तरीय टोकन अनुकूलन
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // संदर्भ को छोटा करें, उपयोगकर्ता इनपुट को नहीं
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // अनुमान: 1 टोकन ≈ 4 वर्ण
    return Math.ceil(text.length / 4);
  }
}
```

## निगरानी और अवलोकन

### 1. व्यापक Application Insights

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

### 2. AI-विशिष्ट निगरानी

**AI मेट्रिक्स के लिए कस्टम डैशबोर्ड**:

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

### 3. हेल्थ चेक और अपटाइम मॉनिटरिंग

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

## डिज़ास्टर रिकवरी और हाई अवेलेबिलिटी

### 1. मल्टी-रीजन तैनाती

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

### 2. डेटा बैकअप और रिकवरी

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

## DevOps और CI/CD एकीकरण

### 1. GitHub Actions वर्कफ़्लो

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

### 2. इन्फ्रास्ट्रक्चर मान्यता (Infrastructure Validation)

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# जांचें कि सभी आवश्यक सेवाएँ चल रही हैं
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI मॉडल की तैनाती की जाँच करें
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI सेवा की कनेक्टिविटी का परीक्षण करें
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## प्रोडक्शन रेडीनेस चेकलिस्ट

### सुरक्षा ✅
- [ ] सभी सेवाएँ प्रबंधित पहचान का उपयोग करें
- [ ] सीक्रेट्स Key Vault में संग्रहीत हों
- [ ] प्राइवेट एंडपॉइंट्स कॉन्फ़िगर किए गए हों
- [ ] नेटवर्क सुरक्षा समूह लागू किए गए हों
- [ ] न्यूनतम अनुमतियों के साथ RBAC
- [ ] सार्वजनिक एंडपॉइंट्स पर WAF सक्षम हो

### प्रदर्शन ✅
- [ ] ऑटो-स्केलिंग कॉन्फ़िगर किया गया हो
- [ ] कैशिंग लागू की गई हो
- [ ] लोड बैलेंसिंग सेटअप हो
- [ ] स्टैटिक कंटेंट के लिए CDN
- [ ] डेटाबेस कनेक्शन पूलिंग
- [ ] टोकन उपयोग अनुकूलन

### निगरानी ✅
- [ ] Application Insights कॉन्फ़िगर किया गया हो
- [ ] कस्टम मेट्रिक्स परिभाषित हों
- [ ] अलर्टिंग नियम सेटअप हों
- [ ] डैशबोर्ड बनाया गया हो
- [ ] हेल्थ चेक लागू किए गए हों
- [ ] लॉग रिटेंशन नीतियाँ

### विश्वसनीयता ✅
- [ ] मल्टी-रीजन तैनाती
- [ ] बैकअप और रिकवरी प्लान
- [ ] सर्किट ब्रेकर्स लागू किए गए हों
- [ ] रीट्राई नीतियाँ कॉन्फ़िगर की गई हों
- [ ] ग्रेसफुल डिग्रेडेशन
- [ ] हेल्थ चेक एंडपॉइंट्स

### लागत प्रबंधन ✅
- [ ] बजट अलर्ट कॉन्फ़िगर किए गए हों
- [ ] संसाधन सही आकार के हों
- [ ] Dev/test छूट लागू की गई हों
- [ ] रिज़र्व्ड इंस्टेंसेज़ खरीदी गई हों
- [ ] लागत निगरानी डैशबोर्ड
- [ ] नियमित लागत समीक्षाएँ

### अनुपालन ✅
- [ ] डेटा रेजिडेंसी आवश्यकताएँ पूरी हों
- [ ] ऑडिट लॉगिंग सक्षम हो
- [ ] अनुपालन नीतियाँ लागू हों
- [ ] सुरक्षा बेसलाइन्स लागू हों
- [ ] नियमित सुरक्षा आकलन
- [ ] घटना प्रतिक्रिया योजना

## प्रदर्शन बेंचमार्क

### सामान्य प्रोडक्शन मेट्रिक्स

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Response Time** | < 2 seconds | Application Insights |
| **Availability** | 99.9% | अपटाइम मॉनिटरिंग |
| **Error Rate** | < 0.1% | एप्लिकेशन लॉग्स |
| **Token Usage** | < $500/month | लागत प्रबंधन |
| **Concurrent Users** | 1000+ | लोड परीक्षण |
| **Recovery Time** | < 1 hour | डिज़ास्टर रिकवरी परीक्षण |

### लोड परीक्षण

```bash
# एआई अनुप्रयोगों के लिए लोड परीक्षण स्क्रिप्ट
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 समुदाय की सर्वोत्तम प्रथाएँ

Microsoft Foundry Discord समुदाय की प्रतिक्रियाओं के आधार पर:

### समुदाय से शीर्ष सिफारिशें:

1. **छोटे से शुरू करें, धीरे-धीरे स्केल करें**: बेसिक SKUs से शुरू करें और वास्तविक उपयोग के आधार पर ऊपर स्केल करें
2. **सब कुछ मॉनिटर करें**: पहले दिन से व्यापक निगरानी सेट करें
3. **सुरक्षा को ऑटोमेट करें**: निरंतर सुरक्षा के लिए Infrastructure as Code का उपयोग करें
4. **थorough परीक्षण करें**: अपनी पाइपलाइन में AI-विशिष्ट परीक्षण शामिल करें
5. **लागत की योजना बनाएं**: टोकन उपयोग मॉनिटर करें और जल्दी बजट अलर्ट सेट करें

### सामान्य चलती-फिसलती गलतियाँ जिन्हें बचना चाहिए:

- ❌ कोड में API कुंजियों का हार्डकोडिंग करना
- ❌ उचित निगरानी सेट न करना
- ❌ लागत अनुकूलन की अनदेखी करना
- ❌ विफलता परिदृश्यों का परीक्षण न करना
- ❌ हेल्थ चेक के बिना डिप्लॉय करना

## अतिरिक्त संसाधन

- **Azure Well-Architected Framework**: [AI वर्कलोड मार्गदर्शन](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [आधिकारिक दस्तावेज़](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure channel](https://discord.gg/microsoft-azure)

---

**अध्याय नेविगेशन:**
- **📚 पाठ्यक्रम गृह**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 8 - उत्पादन और एंटरप्राइज़ पैटर्न
- **⬅️ पिछला अध्याय**: [अध्याय 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ भी संबंधित**: [AI वर्कशॉप लैब](ai-workshop-lab.md)
- **🎆 पाठ्यक्रम पूरा**: [AZD For Beginners](../../README.md)

**याद रखें**: प्रोडक्शन AI वर्कलोड्स के लिए सावधानीपूर्वक योजना, निगरानी, और सतत अनुकूलन आवश्यक हैं। इन पैटर्नों से शुरू करें और इन्हें अपनी विशिष्ट आवश्यकताओं के अनुसार अनुकूलित करें।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। हम सटीकता के लिए प्रयासरत हैं, पर कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ को उसकी मूल भाषा में अधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->