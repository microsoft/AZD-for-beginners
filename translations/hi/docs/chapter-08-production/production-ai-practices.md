# Production AI Workload Best Practices with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: अध्याय 8 - प्रोडक्शन और एंटरप्राइज़ पैटर्न
- **⬅️ Previous Chapter**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Course Complete**: [AZD For Beginners](../../README.md)

## Overview

यह मार्गदर्शिका Azure Developer CLI (AZD) का उपयोग करके प्रोडक्शन-तैयार AI वर्कलोड्स को तैनात करने के लिए व्यापक सर्वोत्तम प्रथाएँ प्रदान करती है। Microsoft Foundry Discord समुदाय और वास्तविक ग्राहक तैनाती से मिले फीडबैक के आधार पर, ये प्रथाएँ प्रोडक्शन AI सिस्टम्स में सबसे सामान्य चुनौतियों का समाधान करती हैं।

## Key Challenges Addressed

हमारे समुदाय के पोल परिणामों के आधार पर, डेवलपर्स किन प्रमुख चुनौतियों का सामना कर रहे हैं:

- **45%** बहु-सेवा AI तैनाती के साथ संघर्ष करते हैं
- **38%** क्रेडेंशियल और सीक्रेट प्रबंध में समस्याएँ रखते हैं  
- **35%** प्रोडक्शन रेडीनेस और स्केलिंग को कठिन पाते हैं
- **32%** बेहतर लागत अनुकूलन रणनीतियाँ चाहते हैं
- **29%** निगरानी और समस्या निवारण में सुधार की आवश्यकता है

## Architecture Patterns for Production AI

### Pattern 1: Microservices AI Architecture

**When to use**: जटिल AI एप्लिकेशन जिनमें कई क्षमताएँ हों

```mermaid
graph TD
    Frontend[वेब फ्रंटएंड] --- Gateway[एपीआई गेटवे] --- LB[लोड बैलेंसर]
    Gateway --> Chat[चैट सेवा]
    Gateway --> Image[इमेज सेवा]
    Gateway --> Text[टेक्स्ट सेवा]
    Chat --> OpenAI[Microsoft Foundry मॉडल्स]
    Image --> Vision[कंप्यूटर विज़न]
    Text --> DocIntel[दस्तावेज़ इंटेलिजेंस]
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

**When to use**: बैच प्रोसेसिंग, दस्तावेज़ विश्लेषण, असिंक्रोनस वर्कफ़्लो

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

## Thinking About AI Agent Health

जब एक पारंपरिक वेब ऐप टूटता है, तो लक्षण परिचित होते हैं: एक पेज लोड नहीं होता, एक API त्रुटि लौटाता है, या तैनाती विफल होती है। AI-सक्षम एप्लिकेशन भी उन सभी तरीकों से टूट सकते हैं—लेकिन वे उन सूक्ष्म तरीकों से भी गलत व्यवहार कर सकते हैं जो स्पष्ट त्रुटि संदेश उत्पन्न नहीं करते।

यह अनुभाग आपको AI वर्कलोड्स की निगरानी के लिए एक मानसिक मॉडल बनाने में मदद करता है ताकि जब चीजें सही न लगें तो आप जानें कि कहाँ देखना है।

### How Agent Health Differs from Traditional App Health

एक पारंपरिक ऐप या तो काम करता है या नहीं। एक AI एजेंट काम करते हुए भी खराब परिणाम दे सकता है। एजेंट स्वास्थ्य को दो परतों में सोचें:

| Layer | What to Watch | Where to Look |
|-------|--------------|---------------|
| **Infrastructure health** | क्या सेवा चल रही है? क्या संसाधन प्रोविज़न किए गए हैं? क्या एंडपॉइंट पहुँच योग्य हैं? | `azd monitor`, Azure Portal resource health, container/app logs |
| **Behavior health** | क्या एजेंट सटीक प्रतिक्रिया दे रहा है? क्या प्रतिक्रियाएँ समय पर आ रही हैं? क्या मॉडल सही ढंग से कॉल किया जा रहा है? | Application Insights traces, model call latency metrics, response quality logs |

इंफ्रास्ट्रक्चर स्वास्थ्य परिचित है—यह किसी भी azd ऐप के लिए समान है। व्यवहार स्वास्थ्य वह नई परत है जो AI वर्कलोड्स लाती है।

### Where to Look When AI Apps Don't Behave as Expected

यदि आपका AI एप्लिकेशन अपेक्षित परिणाम नहीं दे रहा है, तो यहाँ एक काल्पनिक चेकलिस्ट है:

1. **बुनियादी बातों से शुरू करें।** क्या ऐप चल रहा है? क्या यह अपनी निर्भरताओं तक पहुँच सकता है? किसी भी ऐप की तरह `azd monitor` और resource health की जाँच करें।
2. **मॉडल कनेक्शन की जाँच करें।** क्या आपका एप्लिकेशन सफलतापूर्वक AI मॉडल को कॉल कर रहा है? असफल या टाइम-आउट मॉडल कॉल AI ऐप समस्याओं का सबसे सामान्य कारण होते हैं और ये आपकी एप्लिकेशन लॉग्स में दिखेंगे।
3. **देखें कि मॉडल को क्या मिला।** AI प्रतिक्रियाएँ इनपुट (प्रॉम्प्ट और किसी भी रिट्रीव्ड संदर्भ) पर निर्भर करती हैं। यदि आउटपुट गलत है, तो आमतौर पर इनपुट गलत होता है। जांचें कि क्या आपका एप्लिकेशन मॉडल को सही डेटा भेज रहा है।
4. **प्रतिक्रिया विलंबता की समीक्षा करें।** AI मॉडल कॉल सामान्य API कॉल्स की तुलना में धीमे होते हैं। यदि आपका ऐप सुस्त महसूस हो रहा है, तो जांचें कि क्या मॉडल प्रतिक्रिया समय बढ़ गया है—यह थ्रॉटलिंग, क्षमता सीमाएँ, या क्षेत्र-स्तरीय भीड़भाड़ संकेत कर सकता है।
5. **लागत संकेतों पर नजर रखें।** टोकन उपयोग या API कॉल्स में अप्रत्याशित उछाल एक लूप, गलत कॉन्फ़िगर किया गया प्रॉम्प्ट, या अत्यधिक रिट्राइज़ का संकेत दे सकता है।

आपको तुरंत ऑब्ज़र्वेबिलिटी टूलिंग में महारत हासिल करने की आवश्यकता नहीं है। मुख्य बात यह है कि AI एप्लिकेशन की निगरानी के लिए एक अतिरिक्त व्यवहार परत होती है, और azd का बिल्ट-इन मॉनिटरिंग (`azd monitor`) आपको दोनों परतों की जांच के लिए एक शुरुआती बिंदु देता है।

---

## Security Best Practices

### 1. Zero-Trust Security Model

**Implementation Strategy**:
- प्रमाणीकरण के बिना कोई सर्विस-टू-सर्विस संवाद नहीं
- सभी API कॉल्स में managed identities का उपयोग
- private endpoints के साथ नेटवर्क आइसोलेशन
- न्यूनतम विशेषाधिकार पहुँच नियंत्रण

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

### 2. Secure Secret Management

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

### 3. Network Security

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

## Performance and Scaling

### 1. Auto-Scaling Strategies

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

### 2. Caching Strategies

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

### 3. Load Balancing and Traffic Management

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

## 💰 Cost Optimization

### 1. Resource Right-Sizing

**Environment-Specific Configurations**:

```bash
# विकास पर्यावरण
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# उत्पादन पर्यावरण
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Cost Monitoring and Budgets

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

### 3. Token Usage Optimization

**OpenAI Cost Management**:

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
    // अनुमानतः 1 टोकन ≈ 4 अक्षर
    return Math.ceil(text.length / 4);
  }
}
```

## Monitoring and Observability

### 1. Comprehensive Application Insights

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

### 2. AI-Specific Monitoring

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

### 3. Health Checks and Uptime Monitoring

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

## Disaster Recovery and High Availability

### 1. Multi-Region Deployment

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

### 2. Data Backup and Recovery

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

## DevOps and CI/CD Integration

### 1. GitHub Actions Workflow

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

### 2. Infrastructure Validation

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# सुनिश्चित करें कि सभी आवश्यक सेवाएँ चल रही हैं
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI मॉडल तैनाती को सत्यापित करें
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

## Production Readiness Checklist

### Security ✅
- [ ] All services use managed identities
- [ ] Secrets stored in Key Vault
- [ ] Private endpoints configured
- [ ] Network security groups implemented
- [ ] RBAC with least privilege
- [ ] WAF enabled on public endpoints

### Performance ✅
- [ ] Auto-scaling configured
- [ ] Caching implemented
- [ ] Load balancing setup
- [ ] CDN for static content
- [ ] Database connection pooling
- [ ] Token usage optimization

### Monitoring ✅
- [ ] Application Insights configured
- [ ] Custom metrics defined
- [ ] Alerting rules setup
- [ ] Dashboard created
- [ ] Health checks implemented
- [ ] Log retention policies

### Reliability ✅
- [ ] Multi-region deployment
- [ ] Backup and recovery plan
- [ ] Circuit breakers implemented
- [ ] Retry policies configured
- [ ] Graceful degradation
- [ ] Health check endpoints

### Cost Management ✅
- [ ] Budget alerts configured
- [ ] Resource right-sizing
- [ ] Dev/test discounts applied
- [ ] Reserved instances purchased
- [ ] Cost monitoring dashboard
- [ ] Regular cost reviews

### Compliance ✅
- [ ] Data residency requirements met
- [ ] Audit logging enabled
- [ ] Compliance policies applied
- [ ] Security baselines implemented
- [ ] Regular security assessments
- [ ] Incident response plan

## Performance Benchmarks

### Typical Production Metrics

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Response Time** | < 2 seconds | Application Insights |
| **Availability** | 99.9% | Uptime monitoring |
| **Error Rate** | < 0.1% | Application logs |
| **Token Usage** | < $500/month | Cost management |
| **Concurrent Users** | 1000+ | Load testing |
| **Recovery Time** | < 1 hour | Disaster recovery tests |

### Load Testing

```bash
# एआई अनुप्रयोगों के लिए लोड परीक्षण स्क्रिप्ट
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Community Best Practices

Microsoft Foundry Discord समुदाय के फीडबैक के आधार पर:

### Top Recommendations from the Community:

1. **छोटे से शुरू करें, धीरे-धीरे स्केल करें**: बुनियादी SKUs के साथ शुरू करें और वास्तविक उपयोग के आधार पर ऊपर स्केल करें
2. **सब कुछ मॉनिटर करें**: पहले दिन से ही व्यापक निगरानी सेट करें
3. **सुरक्षा को ऑटोमेट करें**: निरंतर सुरक्षा के लिए infrastructure as code का उपयोग करें
4. **ठीक तरह से टेस्ट करें**: अपनी पाइपलाइन में AI-विशिष्ट परीक्षण शामिल करें
5. **लागत की योजना बनाएं**: टोकन उपयोग की निगरानी करें और जल्दी से बजट अलर्ट सेट करें

### Common Pitfalls to Avoid:

- ❌ कोड में API keys हार्डकोड करना
- ❌ उचित मॉनिटरिंग न सेट करना
- ❌ लागत अनुकूलन की अनदेखी करना
- ❌ फेलियर सिनेरियो का परीक्षण न करना
- ❌ हेल्थ चेक्स के बिना तैनाती करना

## AZD AI CLI Commands and Extensions

AZD में AI-विशिष्ट कमांड और एक्सटेंशन्स का एक बढ़ता हुआ सेट शामिल है जो प्रोडक्शन AI वर्कफ़्लो को सरल बनाता है। ये उपकरण स्थानीय विकास और प्रोडक्शन तैनाती के बीच की खाई को पाटते हैं।

### AZD Extensions for AI

AZD AI-विशिष्ट क्षमताएँ जोड़ने के लिए एक एक्सटेंशन सिस्टम का उपयोग करता है। एक्सटेंशन्स इंस्टॉल और प्रबंधित करें:

```bash
# सभी उपलब्ध एक्सटेंशन सूचीबद्ध करें (AI सहित)
azd extension list

# Foundry agents एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.agents

# फाइन-ट्यूनिंग एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.finetune

# कस्टम मॉडल्स एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.models

# सभी इंस्टॉल किए गए एक्सटेंशनों को अपग्रेड करें
azd extension upgrade --all
```

**Available AI extensions:**

| Extension | Purpose | Status |
|-----------|---------|--------|
| `azure.ai.agents` | Foundry Agent Service management | Preview |
| `azure.ai.finetune` | Foundry model fine-tuning | Preview |
| `azure.ai.models` | Foundry custom models | Preview |
| `azure.coding-agent` | Coding agent configuration | Available |

### Initializing Agent Projects with `azd ai agent init`

`azd ai agent init` कमांड Microsoft Foundry Agent Service के साथ एकीकृत प्रोडक्शन-तैयार AI एजेंट प्रोजेक्ट स्कैफ़ोल्ड करता है:

```bash
# एजेंट मैनिफेस्ट से नया एजेंट प्रोजेक्ट प्रारंभ करें
azd ai agent init -m <manifest-path-or-uri>

# किसी विशिष्ट Foundry प्रोजेक्ट को प्रारंभ और लक्षित करें
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# कस्टम स्रोत निर्देशिका के साथ प्रारंभ करें
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Container Apps को होस्ट के रूप में लक्षित करें
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Key flags:**

| Flag | Description |
|------|-------------|
| `-m, --manifest` | Path or URI to an agent manifest to add to your project |
| `-p, --project-id` | Existing Microsoft Foundry Project ID for your azd environment |
| `-s, --src` | Directory to download the agent definition (defaults to `src/<agent-id>`) |
| `--host` | Override the default host (e.g., `containerapp`) |
| `-e, --environment` | The azd environment to use |

**Production tip**: `--project-id` का उपयोग करके सीधे किसी मौजूदा Foundry प्रोजेक्ट से कनेक्ट करें, ताकि आपके एजेंट कोड और क्लाउड संसाधन शुरू से ही जुड़े रहें।

### Model Context Protocol (MCP) with `azd mcp`

AZD में बिल्ट-इन MCP सर्वर समर्थन (Alpha) शामिल है, जो AI एजेंट्स और टूल्स को मानकीकृत प्रोटोकॉल के माध्यम से आपके Azure संसाधनों के साथ इंटरैक्ट करने में सक्षम बनाता है:

```bash
# अपने प्रोजेक्ट के लिए MCP सर्वर शुरू करें
azd mcp start

# MCP संचालन के लिए टूल की सहमति प्रबंधित करें
azd mcp consent
```

MCP सर्वर आपके azd प्रोजेक्ट संदर्भ—environments, services, और Azure resources—को AI-समर्थित विकास उपकरणों के लिए एक्सपोज़ करता है। इससे सक्षम होता है:

- **AI-assisted deployment**: कोडिंग एजेंट्स को आपके प्रोजेक्ट स्टेट का क्वेरी करने और तैनाती ट्रिगर करने दें
- **Resource discovery**: AI टूल्स यह पता लगा सकते हैं कि आपका प्रोजेक्ट किन Azure संसाधनों का उपयोग करता है
- **Environment management**: एजेंट्स dev/staging/production environments के बीच स्विच कर सकते हैं

### Infrastructure Generation with `azd infra generate`

प्रोडक्शन AI वर्कलोड्स के लिए, आप ऑटोमैटिक प्रोविजनिंग पर निर्भर रहने के बजाय Infrastructure as Code जनरेट और कस्टमाइज़ कर सकते हैं:

```bash
# अपने प्रोजेक्ट की परिभाषा से Bicep/Terraform फ़ाइलें उत्पन्न करें
azd infra generate
```

यह IaC को डिस्क पर लिखता है ताकि आप:
- तैनाती से पहले इन्फ्रास्ट्रक्चर की समीक्षा और ऑडिट कर सकें
- कस्टम सुरक्षा नीतियाँ जोड़ सकें (नेटवर्क नियम, private endpoints)
- मौजूदा IaC समीक्षा प्रक्रियाओं के साथ एकीकृत कर सकें
- एप्लिकेशन कोड से अलग इन्फ्रास्ट्रक्चर परिवर्तनों का वर्शन कंट्रोल कर सकें

### Production Lifecycle Hooks

AZD hooks आपको तैनाती लाइफ़साइकल के हर चरण पर कस्टम लॉजिक इंजेक्ट करने देते हैं—जो प्रोडक्शन AI वर्कफ़्लो के लिए महत्वपूर्ण हैं:

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
# विकास के दौरान किसी विशिष्ट हुक को मैन्युअल रूप से चलाएँ
azd hooks run predeploy
```

**Recommended production hooks for AI workloads:**

| Hook | Use Case |
|------|----------|
| `preprovision` | AI मॉडल क्षमता के लिए subscription quotas का सत्यापन |
| `postprovision` | private endpoints कॉन्फ़िगर करना, model weights तैनात करना |
| `predeploy` | AI सुरक्षा परीक्षण चलाना, प्रॉम्प्ट टेम्पलेट्स का मान्यकरण |
| `postdeploy` | एजेंट प्रतिक्रियाओं का स्मोक टेस्ट, मॉडल कनेक्टिविटी सत्यापित करना |

### CI/CD Pipeline Configuration

`azd pipeline config` का उपयोग करके अपने प्रोजेक्ट को GitHub Actions या Azure Pipelines से सुरक्षित Azure प्रमाणीकरण के साथ कनेक्ट करें:

```bash
# CI/CD पाइपलाइन कॉन्फ़िगर करें (इंटरएक्टिव)
azd pipeline config

# किसी विशिष्ट प्रदाता के साथ कॉन्फ़िगर करें
azd pipeline config --provider github
```

यह कमांड:
- न्यूनतम-विशेषाधिकार पहुँच के साथ एक service principal बनाता है
- federated credentials कॉन्फ़िगर करता है (कोई संग्रहीत सीक्रेट्स नहीं)
- आपके pipeline definition फ़ाइल को जनरेट या अपडेट करता है
- आपके CI/CD सिस्टम में आवश्यक environment variables सेट करता है

**Production workflow with pipeline config:**

```bash
# 1. उत्पादन वातावरण सेट करें
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. पाइपलाइन को कॉन्फ़िगर करें
azd pipeline config --provider github

# 3. पाइपलाइन हर बार main पर push होने पर azd deploy चलाती है
```

### Adding Components with `azd add`

मौजूदा प्रोजेक्ट में क्रमिक रूप से Azure सेवाएँ जोड़ें:

```bash
# इंटरैक्टिव रूप से एक नया सेवा घटक जोड़ें
azd add
```

यह विशेष रूप से प्रोडक्शन AI एप्लिकेशन का विस्तार करने के लिए उपयोगी है—उदाहरण के लिए, एक वेक्टर सर्च सेवा जोड़ना, एक नया एजेंट एंडपॉइंट, या मौजूदा तैनाती में एक निगरानी कंपोनेंट जोड़ना।

## Additional Resources
- **Azure Well-Architected Framework**: [AI वर्कलोड मार्गदर्शन](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [आधिकारिक दस्तावेज़](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure channel](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 खुले एजेंट स्किल्स Azure AI, Foundry, परिनियोजन, लागत अनुकूलन, और निदान के लिए। अपने एडिटर में इंस्टॉल करें:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: Chapter 8 - उत्पादन और एंटरप्राइज़ पैटर्न
- **⬅️ पिछला अध्याय**: [Chapter 7: समस्या निवारण](../chapter-07-troubleshooting/debugging.md)
- **⬅️ यह भी संबंधित**: [AI Workshop Lab](ai-workshop-lab.md)
- **� कोर्स पूरा**: [AZD For Beginners](../../README.md)

**याद रखें**: Production AI वर्कलोड्स को सावधानीपूर्ण योजना, निगरानी, और निरंतर अनुकूलन की आवश्यकता होती है। इन पैटर्न्स से शुरू करें और इन्हें अपनी विशिष्ट आवश्यकताओं के अनुसार अनुकूलित करें।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल भाषा में मौजूद दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सलाह दी जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->