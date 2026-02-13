# AZD सँग उत्पादन AI कार्यभारका उत्तम अभ्यासहरू

**अध्याय नेभिगेसन:**
- **📚 कोर्स गृहपृष्ठ**: [AZD आरम्भकर्ताका लागि](../../README.md)
- **📖 हालको अध्याय**: अध्याय 8 - उत्पादन र उद्यम ढाँचाहरू
- **⬅️ अघिल्लो अध्याय**: [अध्याय 7: समस्या निवारण](../chapter-07-troubleshooting/debugging.md)
- **⬅️ पनि सम्बन्धित**: [AI कार्यशाला ल्याब](ai-workshop-lab.md)
- **🎯 पाठ्यक्रम पूरा**: [AZD आरम्भकर्ताका लागि](../../README.md)

## अवलोकन

यो गाइडले Azure Developer CLI (AZD) प्रयोग गरेर उत्पादन-तयार AI कार्यभारहरू तैनाथ गर्दा प्रयोग गर्न मिल्ने समग्र उत्तम अभ्यासहरू प्रदान गर्छ। Microsoft Foundry Discord समुदायको प्रतिक्रिया र वास्तविक ग्राहक तैनाथीकरणहरूमा आधारित यी अभ्यासहरूले उत्पादन AI प्रणालीहरूमा सबैभन्दा सामान्य चुनौतीहरूलाई सम्बोधन गर्छन्।

## समाधान गरिएका प्रमुख चुनौतीहरू

हाम्रो समुदायको पोल परिणामहरूका आधारमा, विकासकर्ताहरूले भोग्ने शीर्ष चुनौतीहरू यी हुन्:

- **45%** लाई बहु-सेवा AI तैनाथीकरणहरूमा कठिनाइ हुन्छ
- **38%** लाई क्रेडेन्शियल र गोप्य व्यवस्थापनसँग समस्या हुन्छ  
- **35%** लाई उत्पादन तयारी र स्केलिङ गाह्रो लाग्छ
- **32%** लाई राम्रो लागत अनुकूलन रणनीतिहरू चाहिन्छ
- **29%** लाई निगरानी र समस्या निवारण सुधार गर्न आवश्यक छ

## उत्पादन AI का लागि वास्तुकला ढाँचाहरू

### ढाँचा 1: माइक्रोसर्भिसेज AI वास्तुकला

**कहिल्यै प्रयोग गर्ने**: बहुविध क्षमताहरू भएका जटिल AI अनुप्रयोगहरू

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

### ढाँचा 2: इभेन्ट-ड्राइवेन AI प्रसोधन

**कहिल्यै प्रयोग गर्ने**: ब्याच प्रोसेसिङ, दस्तावेज विश्लेषण, एसिंक्रोनस वर्कफ्लोज

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

## सुरक्षा सम्बन्धी उत्तम अभ्यासहरू

### 1. शून्य-ट्रस्ट सुरक्षा मोडल

**कार्यान्वयन रणनीति**:
- प्रमाणीकरण बिना सेवा-देखि-सेवा सञ्चार नगर्ने
- सबै API कलहरूले managed identities प्रयोग गर्ने
- प्राइभेट एन्डप्वाइन्टहरूसँग नेटवर्क अलगाव
- सबैभन्दा कम अधिकारको पहुँच नियन्त्रण

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

### 2. सुरक्षित गोप्य व्यवस्थापन

**Key Vault एकीकरण ढाँचा**:

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

**Private Endpoint कन्फिगरेसन**:

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

## प्रदर्शन र स्केलिङ

### 1. अटो-स्केलिङ रणनीतिहरू

**Container Apps अटो-स्केलिङ**:

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

### 2. क्याचिङ रणनीतिहरू

**AI प्रतिक्रियाहरूका लागि Redis Cache**:

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

### 3. लोड ब्यालेन्सिङ र ट्राफिक व्यवस्थापन

**WAF सहित Application Gateway**:

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

### 1. स्रोतको उपयुक्त आकार निर्धारण

**पर्यावरण-विशिष्ट कन्फिगरेसनहरू**:

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

### 2. लागत निगरानी र बजेटहरू

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

**OpenAI लागत व्यवस्थापन**:

```typescript
// एप्लिकेशन-स्तर टोकन अनुकूलन
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // सन्दर्भ छोट्याउनुहोस्, प्रयोगकर्ताको इनपुट होइन
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // करीव अनुमान: 1 टोकन ≈ 4 वर्ण
    return Math.ceil(text.length / 4);
  }
}
```

## निगरानी र अवलोकनयोग्यता

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

### 2. AI-विशेष निगरानी

**AI मेट्रिक्सका लागि कस्टम ड्यासबोर्डहरू**:

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

### 3. स्वास्थ्य जाँच र अपटाइम निगरानी

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

## प्रकोप पुनर्प्राप्ति र उच्च उपलब्धता

### 1. बहु-क्षेत्र तैनाथीकरण

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

### 2. डेटा ब्याकअप र पुनर्प्राप्ति

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

## DevOps र CI/CD एकीकरण

### 1. GitHub Actions वर्कफ्लो

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

### 2. पूर्वाधार मान्यकरण

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# सबै आवश्यक सेवाहरू चलिरहेका छन् कि छैनन् जाँच गर्नुहोस्
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI मोडेल तैनातीहरू मान्य गर्नुहोस्
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI सेवाको जडान परीक्षण गर्नुहोस्
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## उत्पादन तयारी चेकलिस्ट

### सुरक्षा ✅
- [ ] सबै सेवाहरू managed identities प्रयोग गर्छन्
- [ ] गोप्यहरू Key Vault मा भण्डारण गरिएका छन्
- [ ] प्राइभेट एन्डप्वाइन्टहरू कन्फिगर गरिएका छन्
- [ ] नेटवर्क सुरक्षा समूहहरू कार्यान्वयन गरिएका छन्
- [ ] RBAC न्यूनतम पहुँच अधिकारसँग
- [ ] सार्वजनिक एन्डप्वाइन्टहरूमा WAF सक्षम गरिएको छ

### प्रदर्शन ✅
- [ ] अटो-स्केलिङ कन्फिगर गरिएको छ
- [ ] क्याचिङ कार्यान्वयन गरिएको छ
- [ ] लोड ब्यालेन्सिङ सेटअप गरिएको छ
- [ ] स्थिर सामग्रीका लागि CDN
- [ ] डेटाबेस कनेक्शन पूलिङ
- [ ] टोकन उपयोग अनुकूलन

### निगरानी ✅
- [ ] Application Insights कन्फिगर गरिएको छ
- [ ] कस्टम मेट्रिक्स परिभाषित गरिएको छ
- [ ] अलर्ट नियम सेटअप गरिएको छ
- [ ] ड्यासबोर्ड सिर्जना गरिएको छ
- [ ] हेल्थ चेकहरू कार्यान्वयन गरिएको छ
- [ ] लग रिटेन्सन नीतिहरू

### विश्वसनीयता ✅
- [ ] बहु-क्षेत्र तैनाथीकरण
- [ ] ब्याकअप र पुनर्प्राप्ति योजना
- [ ] सर्किट ब्रेकरहरू कार्यान्वयन गरिएको छ
- [ ] रिट्राइ नीतिहरू कन्फिगर गरिएको छ
- [ ] शिष्ट अवनति कार्यान्वयन गरिएको छ
- [ ] हेल्थ चेक एन्डप्वाइन्टहरू

### लागत व्यवस्थापन ✅
- [ ] बजेट अलर्टहरू कन्फिगर गरिएको छ
- [ ] स्रोत उपयुक्त आकार निर्धारण गरिएको छ
- [ ] डेभ/टेस्ट छुटहरू लागू गरिएको छ
- [ ] आरक्षित इन्स्टेन्सहरू खरिद गरिएको छ
- [ ] लागत निगरानी ड्यासबोर्ड
- [ ] नियमित लागत समीक्षा

### अनुपालन ✅
- [ ] डेटा आवास आवश्यकताहरू पूरा गरिएको छ
- [ ] अडिट लगिङ सक्षम गरिएको छ
- [ ] अनुपालन नीतिहरू लागू गरिएको छ
- [ ] सुरक्षा बेसलाइनहरू कार्यान्वयन गरिएको छ
- [ ] नियमित सुरक्षा मूल्याङ्कनहरू
- [ ] घटना प्रतिक्रिया योजना

## प्रदर्शन बेन्चमार्कहरू

### सामान्य उत्पादन मेट्रिक्स

| Metric | Target | Monitoring |
|--------|--------|------------|
| **प्रतिक्रिया समय** | < 2 सेकेन्ड | Application Insights |
| **उपलब्धता** | 99.9% | अपटाइम निगरानी |
| **त्रुटि दर** | < 0.1% | अनुप्रयोग लगहरू |
| **टोकन प्रयोग** | < $500/महिना | लागत व्यवस्थापन |
| **एकसाथ प्रयोगकर्ता** | 1000+ | लोड परीक्षण |
| **पुन:प्राप्ति समय** | < 1 घण्टा | प्रकोप पुनर्प्राप्ति परीक्षणहरू |

### लोड परीक्षण

```bash
# एआई अनुप्रयोगहरूको लागि लोड परीक्षण स्क्रिप्ट
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 समुदायका उत्तम अभ्यासहरू

Microsoft Foundry Discord समुदायको प्रतिक्रिया अनुसार:

### समुदायबाट शीर्ष सिफारिसहरू:

1. **साना बाट सुरु गर्नुहोस्, क्रमशः स्केल गर्नुहोस्**: आधारभूत SKUs बाट सुरु गर्नुहोस् र वास्तविक प्रयोग अनुसार स्केल अप गर्नुहोस्
2. **सबै कुरा निगरानी गर्नुहोस्**: पहिलो दिनदेखि व्यापक निगरानी सेटअप गर्नुहोस्
3. **सुरक्षा स्वचालित गर्नुहोस्**: निरन्तर सुरक्षाका लागि Infrastructure as Code प्रयोग गर्नुहोस्
4. **प्रयाप्त परीक्षण गर्नुहोस्**: आफ्नो पाइपलाइनमा AI-विशिष्ट परीक्षण समावेश गर्नुहोस्
5. **लागतका लागि योजना बनाउनुहोस्**: टोकन प्रयोग निगरानी गर्नुहोस् र चाँडै बजेट अलर्टहरू सेट गर्नुहोस्

### टाढा राख्नुपर्ने सामान्य गल्तीहरू:

- ❌ कोडमा API कुञ्जीहरू हार्डकोड गर्ने
- ❌ उचित निगरानी सेटअप नगर्ने
- ❌ लागत अनुकूलनलाई बेवास्ता गर्ने
- ❌ असफलताको परिदृश्यहरू परीक्षण नगर्ने
- ❌ हेल्थ चेकहरू बिना तैनाथ गर्ने

## अतिरिक्त स्रोतहरू

- **Azure Well-Architected Framework**: [AI कार्यभार मार्गदर्शन](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [आधिकारिक कागजात](https://learn.microsoft.com/azure/ai-studio/)
- **समुदाय टेम्प्लेटहरू**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord समुदाय**: [#Azure च्यानल](https://discord.gg/microsoft-azure)

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स गृहपृष्ठ**: [AZD आरम्भकर्ताका लागि](../../README.md)
- **📖 हालको अध्याय**: अध्याय 8 - उत्पादन र उद्यम ढाँचाहरू
- **⬅️ अघिल्लो अध्याय**: [अध्याय 7: समस्या निवारण](../chapter-07-troubleshooting/debugging.md)
- **⬅️ पनि सम्बन्धित**: [AI कार्यशाला ल्याब](ai-workshop-lab.md)
- **🎆 पाठ्यक्रम पूरा**: [AZD आरम्भकर्ताका लागि](../../README.md)

**स्मरण**: उत्पादन AI कार्यभारहरूले सावधानीपूर्वक योजना, निगरानी, र निरन्तर अनुकूलन आवश्यक पर्छ। यी ढाँचाहरूबाट सुरु गर्नुहोस् र तपाईंका विशेष आवश्यकताहरूअनुसार अनुकूलन गर्नुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सटीकताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल दस्तावेजलाई यसको मूल भाषामा नै अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलत बुझाइ वा गलत व्याख्याको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->