# AZD सँग उत्पादन AI वर्कलोडका उत्तम अभ्यासहरू

**Chapter Navigation:**
- **📚 Course Home**: [AZD आरम्भिकहरूका लागि](../../README.md)
- **📖 Current Chapter**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ Previous Chapter**: [अध्याय 7: समस्या समाधान](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI कार्यशाला ल्याब](ai-workshop-lab.md)
- **🎯 Course Complete**: [कोर्स पूरा](../../README.md)

## अवलोकन

यस मार्गदर्शिकाले Azure Developer CLI (AZD) प्रयोग गरेर उत्पादन-तयार AI वर्कलोडहरू डिप्लोय गर्दा लागू हुने व्यापक उत्तम अभ्यासहरू प्रदान गर्दछ। Microsoft Foundry Discord समुदायबाट र वास्तविक ग्राहक डिप्लोयमेन्टबाट प्राप्त प्रतिक्रिया आधारमा, यी अभ्यासहरूले उत्पादन AI प्रणालीहरूमा सबैभन्दा सामान्य चुनौतीहरू सम्बोधन गर्दछन्।

## सम्बोधन गरिएका प्रमुख चुनौतीहरू

हाम्रा समुदाय पोलनतीजा अनुसार, विकासकर्ताहरूले सामना गर्ने शीर्ष चुनौतीहरू यस्ता छन्:

- **45%** बहु-सेवा AI डिप्लोयमेन्टहरूसँग संघर्ष गर्छन्
- **38%** प्रमाणीकरण र गोप्य (credentials and secret) व्यवस्थापनमा समस्या हुन्छ  
- **35%** उत्पादन तयारपन र स्केलिङ कठिन पाउँछन्
- **32%** राम्रो लागत अनुकूलन रणनीतिहरू चाहिन्छ
- **29%** अनुगमन र समस्या समाधानमा सुधार आवश्यक छ

## उत्पादन AI का वास्तुकला ढाँचाहरू

### ढाँचा 1: माइक्रोसर्भिस AI वास्तुकला

**कहिले प्रयोग गर्ने**: बहु क्षमताहरू भएका जटिल AI अनुप्रयोगहरू

```mermaid
graph TD
    Frontend[वेब फ्रन्टएन्ड] --- Gateway[एपीआई गेटवे] --- LB[लोड बेलान्सर]
    Gateway --> Chat[च्याट सेवा]
    Gateway --> Image[छवि सेवा]
    Gateway --> Text[पाठ सेवा]
    Chat --> OpenAI[माइक्रोसफ्ट फाउन्ड्री मोडेलहरू]
    Image --> Vision[कम्प्युटर दृष्टि]
    Text --> DocIntel[दस्तावेज बुद्धिमत्ता]
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

### ढाँचा 2: घटना-प्रेरित AI प्रशोधन

**कहिले प्रयोग गर्ने**: ब्याच प्रशोधन, कागजात विश्लेषण, असिंक्रोनस वर्कफ्लोहरू

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

## AI एजेण्ट स्वास्थ्यबारे सोच्ने

जब पारम्परिक वेब एप टुट्छ, यसको लक्षणहरू परिचित हुन्छन्: पृष्ठ लोड हुँदैन, API त्रुटि फर्काउँछ, वा डिप्लोयमेन्ट फेल हुन्छ। AI-सञ्चालित अनुप्रयोगहरू त्यस्तै तरिकाले टुट्न सक्छन्—तर तिनीहरू सूक्ष्म तरिकाले पनि गलत व्यवहार गर्न सक्छन् जसले स्पष्ट त्रुटि सन्देशहरू नदिन सक्छ।

यो अनुभागले तपाईंलाई AI वर्कलोडको अनुगमनका लागि मानसिक मोडेल निर्माण गर्न मद्दत गर्दछ ताकि कुरा ठिक नलाग्दा कहाँ हेर्ने थाहा होस्।

### कसरी एजेण्ट स्वास्थ्य परम्परागत एप स्वास्थ्यबाट फरक हुन्छ

एक परम्परागत एप वा त चल्छ वा चल्दैन। एक AI एजेण्ट चलिरहेको देखिन सक्छ तर कमजोर नतिजा उत्पादन गर्न सक्छ। एजेण्ट स्वास्थ्यलाई दुई तहमा सोच्नुहोस्:

| तह | के हेरिने | कहाँ हेर्ने |
|-------|--------------|---------------|
| **पूर्वाधार स्वास्थ्य** | सेवा चलिरहेको छ? स्रोतहरू प्रावधान गरिएका छन्? अन्तबिन्दुहरू पहुँचयोग्य छन्? | `azd monitor`, Azure Portal resource health, container/app logs |
| **व्यवहार स्वास्थ्य** | एजेण्ट सही प्रतिक्रिया दिइरहेको छ? प्रतिक्रिया समयमै छ? मोडल सही तरिकाले कल भइरहेको छ? | Application Insights traces, model call latency metrics, response quality logs |

पूर्वाधार स्वास्थ्य परिचित छ—यो कुनै पनि azd एपका लागि एउटै हो। व्यवहार स्वास्थ्य AI वर्कलोडहरूले थप्ने नयाँ तह हो।

### AI अनुप्रयोगहरू आशा अनुसार व्यवहार नगरेमा कहाँ हेर्ने

यदि तपाईंको AI अनुप्रयोगले अपेक्षित नतिजा उत्पन्न गरिरहेको छैन भने, यहाँ एक अवधारणात्मक जाँच सूची छ:

1. **आधारबाट शुरू गर्नुहोस्।** एप चलिरहेको छ? के यसले आफ्नो निर्भरताहरू पहुँच गर्न सक्छ? कुनै पनि एपका लागि गर्ने जस्तै `azd monitor` र स्रोत स्वास्थ्य जाँच गर्नुहोस्।
2. **मोडेल कनेक्सन जाँच गर्नुहोस्।** के तपाईंको एपले सफलतापूर्वक AI मोडललाई कल गरिरहेको छ? असफल वा टाइमआउट भएका मोडल कलहरू AI एप मुद्दाहरूको सर्वाधिक सामान्य कारण हुन् र तपाइँको एप्लिकेसन लगहरूमा देखिनेछ।
3. **मोडेलले के प्राप्त गर्‍यो हेर्नुहोस्।** AI प्रतिक्रियाहरू इनपुट (प्रोम्प्ट र कुनै पनि पुन:प्राप्त सन्दर्भ) मा निर्भर गर्छ। यदि आउटपुट गलत छ भने, सामान्यतया इनपुट गलत हुन्छ। जाँच गर्नुहोस् कि तपाईंको एपले मोडलमा सहि डाटा पठाइरहेको छ कि छैन।
4. **प्रतिक्रिया विलम्ब समीक्षा गर्नुहोस्।** AI मोडल कलहरू सामान्य API कलहरू भन्दा धीमा हुन्छन्। यदि तपाईंको एप सुस्त लाग्छ भने, मोडल प्रतिक्रिया समय बढेको छ कि छैन जाँच गर्नुहोस्—यसले थ्रोटलिङ, क्षमता सीमाहरू, वा क्षेत्र-स्तरको भीड संकेत गर्न सक्छ।
5. **लागत संकेतहरूमा निगरानी राख्नुहोस्।** टोकन प्रयोग वा API कलहरूमा अनपेक्षित उछालले लूप, गलत कन्फिगर गरिएको प्रोम्प्ट, वा अत्यधिक पुन: प्रयासहरू जनाउन सक्छ।

तपाईंले तुरुन्तै अवलोकनीयता उपकरणहरूमा मास्टरी लिन आवश्यक छैन। मुख्य निष्कर्ष के हो भने AI अनुप्रयोगहरूको अनुगमनका लागि थप व्यवहार तह हुन्छ, र azd को बिल्ट-इन अनुगमन (`azd monitor`) ले दुबै तह अन्वेषण गर्न सुरु गर्ने बिन्दु प्रदान गर्छ।

---

## सुरक्षा उत्तम अभ्यासहरू

### 1. शून्य-ट्रस्ट सुरक्षा मोडेल

**कार्यान्वयन रणनीति**:
- प्रमाणीकरण बिना कुनै सेवा-देखि-सेवा सञ्चार हुँदैन
- सबै API कलहरू managed identities प्रयोग गरेर गरियोस्
- प्राइभेट अन्तबिन्दुहरूसँग नेटवर्क अलगाव
- न्यूनतम अधिकार पहुँच नियन्त्रण

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

### 2. क्यासिङ रणनीतिहरू

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

### 1. स्रोतहरूको सही आकार निर्धारण

**वातावरण-विशिष्ट कन्फिगरेसनहरू**:

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

### 2. लागत अनुगमन र बजेटहरू

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

### 3. टोकन प्रयोग अनुकूलन

**OpenAI लागत व्यवस्थापन**:

```typescript
// अनुप्रयोग-स्तरीय टोकन अनुकूलन
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
    // करिब अनुमान: 1 टोकन ≈ 4 वर्ण
    return Math.ceil(text.length / 4);
  }
}
```

## अनुगमन र अवलोकनीयता

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

### 2. AI-विशिष्ट अनुगमन

**AI मेट्रिक्सका लागि अनुकूलित ड्यासबोर्डहरू**:

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

### 3. स्वास्थ्य जाँच र अपटाइम अनुगमन

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

## डिजास्टर रिकभरी र उच्च उपलब्धता

### 1. बहु-क्षेत्र डिप्लोयमेन्ट

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

### 2. डाटा ब्याकअप र रिकभरी

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

### 2. पूर्वाधार प्रमाणीकरण

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

## उत्पादन तयारी चेकलिष्ट

### सुरक्षा ✅
- [ ] सबै सेवाहरू managed identities प्रयोग गर्छन्
- [ ] गोप्यहरू Key Vault मा भण्डारण गरिएका छन्
- [ ] प्राइभेट अन्तबिन्दुहरू कन्फिगर गरिएको छ
- [ ] नेटवर्क सुरक्षा समूहहरू लागू गरिएको छ
- [ ] RBAC न्यूनतम अधिकारको साथ
- [ ] सार्वजनिक अन्तबिन्दुहरूमा WAF सक्षम गरिएको छ

### प्रदर्शन ✅
- [ ] अटो-स्केलिङ कन्फिगर गरिएको छ
- [ ] क्यासिङ लागू गरिएको छ
- [ ] लोड ब्यालेन्सिङ सेटअप गरिएको छ
- [ ] स्थिर सामग्रीका लागि CDN
- [ ] डाटाबेस कनेक्शन पुलिङ
- [ ] टोकन प्रयोग अनुकूलन

### अनुगमन ✅
- [ ] Application Insights कन्फिगर गरिएको छ
- [ ] अनुकूलित मेट्रिक्स परिभाषित गरिएको छ
- [ ] अलर्ट नियमहरू सेटअप गरिएको छ
- [ ] ड्यासबोर्ड सिर्जना गरिएको छ
- [ ] स्वास्थ्य जाँच लागू गरिएको छ
- [ ] लग प्रतिधारण नीतिहरू

### विश्वसनीयता ✅
- [ ] बहु-क्षेत्र डिप्लोयमेन्ट
- [ ] ब्याकअप र रिकभरी योजना
- [ ] सर्किट ब्रेकर लागू गरिएको छ
- [ ] रिट्राइ नीतिहरू कन्फिगर गरिएको छ
- [ ] सुचारु क्षरण
- [ ] स्वास्थ्य जाँच अन्तबिन्दुहरू

### लागत व्यवस्थापन ✅
- [ ] बजेट अलर्ट कन्फिगर गरिएको छ
- [ ] स्रोतहरूको सही आकार निर्धारण
- [ ] Dev/test छुटहरू लागू गरिएको छ
- [ ] रिजर्भ्ड इन्स्टेन्सहरू खरिद गरिएको छ
- [ ] लागत अनुगमन ड्यासबोर्ड
- [ ] नियमित लागत समीक्षा

### अनुपालन ✅
- [ ] डाटा आवास आवश्यकताहरू पूरा गरिएको छ
- [ ] अडिट लगिङ सक्षम गरिएको छ
- [ ] अनुपालन नीतिहरू लागू गरिएको छ
- [ ] सुरक्षा बेसलाइनहरू लागू गरिएको छ
- [ ] नियमित सुरक्षा मूल्याङ्कनहरू
- [ ] घटनाप्रतिक्रिया योजना

## प्रदर्शन मापदण्डहरू

### सामान्य उत्पादन मेट्रिक्स

| मेट्रिक | लक्ष्य | अनुगमन |
|--------|--------|------------|
| **प्रतिक्रिया समय** | < 2 सेकेन्ड | Application Insights |
| **उपलब्धता** | 99.9% | अपटाइम अनुगमन |
| **त्रुटि दर** | < 0.1% | एप्लिकेसन लगहरू |
| **टोकन प्रयोग** | < $500/month | लागत व्यवस्थापन |
| **एकै साथ प्रयोगकर्ता** | 1000+ | लोड परीक्षण |
| **रिकभरी समय** | < 1 घण्टा | डिजास्टर रिकभरी परीक्षणहरू |

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

Microsoft Foundry Discord समुदायका फिडब्याक अनुसार:

### समुदायका शीर्ष सिफारिसहरू:

1. **सानोबाट सुरु गर्नुहोस्, बिस्तारै स्केल गर्नुहोस्**: आधारभूत SKU हरूबाट सुरु गर्नुहोस् र वास्तविक प्रयोग अनुसार स्केल गर्नुहोस्
2. **सबै कुरा अनुगमन गर्नुहोस्**: सुरुबाटै व्यापक अनुगमन सेटअप गर्नुहोस्
3. **सुरक्षा स्वचालित गर्नुहोस्**: समान सुरक्षा सुनिश्चित गर्न Infrastructure as Code प्रयोग गर्नुहोस्
4. **पूर्ण रूपमा परीक्षण गर्नुहोस्**: तपाईंको पाइपलाइनमा AI-विशिष्ट परीक्षण समावेश गर्नुहोस्
5. **लागतका लागि योजना बनाउनुहोस्**: टोकन प्रयोग अनुगमन गर्नुहोस् र प्रारम्भमै बजेट अलर्ट सेट गर्नुहोस्

### जोगिनुपर्ने सामान्य गल्तीहरू:

- ❌ API कुञ्जीहरू कोडमा हार्डकोड गर्नु
- ❌ उपयुक्त अनुगमन सेटअप नगर्ने
- ❌ लागत अनुकूलनलाई बेवास्ता गर्ने
- ❌ विफलता परिदृश्यहरू परीक्षण नगर्ने
- ❌ स्वास्थ्य जाँच बिना डिप्लोय गर्ने

## AZD AI CLI आदेशहरू र एक्सटेन्सनहरू

AZD ले उत्पादन AI वर्कफ्लोहरू सरल बनाउने AI-विशिष्ट आदेशहरू र एक्सटेन्सनहरूको बिस्तार हुँदै गएको सेट समावेश गर्दछ। यी उपकरणहरूले स्थानीय विकास र उत्पादन डिप्लोयमेन्ट बीचको खाडल घटाउँछन्।

### AI का लागि AZD एक्सटेन्सनहरू

AZD ले AI-विशेष क्षमताहरू थप्न एक्सटेन्सन सिस्टम प्रयोग गर्दछ। एक्सटेन्सनहरू यसरी इन्स्टल र व्यवस्थापन गर्नुहोस्:

```bash
# सबै उपलब्ध एक्सटेन्सनहरू सूचीबद्ध गर्नुहोस् (AI सहित)
azd extension list

# Foundry agents एक्सटेन्सन इन्स्टल गर्नुहोस्
azd extension install azure.ai.agents

# फाइन-ट्यूनिङ एक्सटेन्सन इन्स्टल गर्नुहोस्
azd extension install azure.ai.finetune

# कस्टम मोडेलहरूको एक्सटेन्सन इन्स्टल गर्नुहोस्
azd extension install azure.ai.models

# सबै इन्स्टल गरिएका एक्सटेन्सनहरू अपग्रेड गर्नुहोस्
azd extension upgrade --all
```

**उपलब्ध AI एक्सटेन्सनहरू:**

| Extension | उद्देश्य | स्थिति |
|-----------|---------|--------|
| `azure.ai.agents` | Foundry Agent Service व्यवस्थापन | पूर्वावलोकन |
| `azure.ai.finetune` | Foundry मोडल फाइन-ट्यूनिङ | पूर्वावलोकन |
| `azure.ai.models` | Foundry अनुकूलित मोडेलहरू | पूर्वावलोकन |
| `azure.coding-agent` | कोडिङ एजेन्ट कन्फिगरेसन | उपलब्ध |

### `azd ai agent init` संग एजेण्ट प्रोजेक्ट आरम्भ गर्नु

`azd ai agent init` आदेशले Microsoft Foundry Agent Service सँग एकीकृत गरिएको उत्पादन-तयार AI एजेण्ट प्रोजेक्ट स्क्याफोल्ड गर्दछ:

```bash
# एजेन्ट म्यानिफेस्टबाट नयाँ एजेन्ट परियोजना आरम्भ गर्नुहोस्
azd ai agent init -m <manifest-path-or-uri>

# आरम्भ गरी विशिष्ट Foundry परियोजनालाई लक्षित गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# अनुकूल स्रोत निर्देशिका प्रयोग गरेर आरम्भ गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Container Apps लाई होस्टका रूपमा लक्षित गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**प्रमुख फ्ल्यागहरू:**

| Flag | Description |
|------|-------------|
| `-m, --manifest` | तपाईंको प्रोजेक्टमा थप्न एक एजेण्ट म्यानिफेस्टको पथ वा URI |
| `-p, --project-id` | तपाईंको azd वातावरणको लागि अवस्थित Microsoft Foundry Project ID |
| `-s, --src` | एजेण्ट परिभाषा डाउनलोड गर्नको लागि डाइरेक्टरी (defaults to `src/<agent-id>`) |
| `--host` | पूर्वनिर्धारित होस्ट ओभरराइड गर्नुहोस् (उदा., `containerapp`) |
| `-e, --environment` | प्रयोग गर्नको लागि azd वातावरण |

**उत्पादन सुझाव**: `--project-id` प्रयोग गरेर एउटा अवस्थित Foundry प्रोजेक्टसँग सिधै जडान गर्नुहोस्, जसले तपाईंको एजेण्ट कोड र क्लाउड स्रोतहरू सुरुबाटै लिंक गरिएको राख्छ।

### `azd mcp` सँग Model Context Protocol (MCP)

AZD मा बिल्ट-इन MCP सर्भर समर्थन (Alpha) समावेश छ, जसले AI एजेण्ट र उपकरणहरूलाई तपाईंका Azure स्रोतहरूसँग मानकीकृत प्रोटोकलमार्फत अन्तरक्रिया गर्न सक्षम बनाउँछ:

```bash
# तपाईंको परियोजनाका लागि MCP सर्भर सुरु गर्नुहोस्
azd mcp start

# MCP संचालनहरूका लागि उपकरण सहमति व्यवस्थापन गर्नुहोस्
azd mcp consent
```

MCP सर्भरले तपाईंको azd प्रोजेक्ट सन्दर्भ—वातावरणहरू, सेवाहरू, र Azure स्रोतहरू—AI-संचालित विकास उपकरणहरूलाई एक्स्पोज गर्छ। यसले सक्षम बनाउँछ:

- **AI-सहायता प्राप्त डिप्लोयमेन्ट**: कोडिङ एजेन्टहरूलाई तपाईंको प्रोजेक्ट अवस्था क्वेरी गर्न र डिप्लोय्मेन्ट ट्रिगर गर्न दिनुहोस्
- **स्रोत खोज**: AI उपकरणहरूले तपाईंको प्रोजेक्टले प्रयोग गर्ने Azure स्रोतहरू फेला पार्न सक्छन्
- **वातावरण व्यवस्थापन**: एजेण्टहरूले dev/staging/production वातावरणहरू बीच सुईच गर्न सक्छन्

### `azd infra generate` सँग पूर्वाधार उत्पादन

उत्पादन AI वर्कलोडहरूको लागि, तपाईं स्वचालित प्रावधानमा निर्भर नहुने गरी Infrastructure as Code जेनरेट र अनुकूलन गर्न सक्नुहुन्छ:

```bash
# तपाईंको परियोजना परिभाषाबाट Bicep/Terraform फाइलहरू उत्पन्न गर्नुहोस्
azd infra generate
```

यसले IaC डिस्कमा लेख्छ ताकि तपाईं:
- डिप्लोयमेन्ट गर्नु अघि पूर्वाधार समीक्षा र अडिट गर्न सक्नुहुन्छ
- अनुकूलित सुरक्षा नीतिहरू थप्न (नेटवर्क नियमहरू, प्राइभेट अन्तबिन्दुहरू)
- अवस्थित IaC समीक्षा प्रक्रियासँग एकीकरण गर्न
- आवेदन कोडबाट पृथक रूपमा पूर्वाधार परिवर्तनहरू भर्सन नियन्त्रण गर्न

### उत्पादन लाइफसाइकल हुकहरू

AZD हुकहरूले तपाईंलाई डिप्लोयमेन्ट लाइफसाइकलको हरेक चरणमा अनुकूलित लजिक इंजेक्ट गर्न दिन्छ—उत्पादन AI वर्कफ्लोहरूको लागि महत्वपूर्ण:

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
# विकासको क्रममा कुनै विशेष हुकलाई हातैले चलाउनुहोस्
azd hooks run predeploy
```

**AI वर्कलोडहरूको लागि सिफारिस गरिएका उत्पादन हुकहरू:**

| Hook | प्रयोग केस |
|------|----------|
| `preprovision` | AI मोडल क्षमताका लागि सदस्यता कोटा मान्य गर्नुहोस् |
| `postprovision` | प्राइभेट अन्तबिन्दुहरू कन्फिगर गर्नुहोस्, मोडल weights डिप्लोय गर्नुहोस् |
| `predeploy` | AI सुरक्षा परीक्षणहरू चलाउनुहोस्, प्रोम्प्ट टेम्प्लेटहरू मान्य गर्नुहोस् |
| `postdeploy` | एजेण्ट प्रतिक्रियाहरूको स्मोक टेस्ट गर्नुहोस्, मोडल कनेक्टिभिटी प्रमाणित गर्नुहोस् |

### CI/CD पाइपलाइन कन्फिगरेसन

तपाईंको प्रोजेक्टलाई GitHub Actions वा Azure Pipelines सँग सुरक्षित Azure प्रमाणीकरणको साथ जडान गर्न `azd pipeline config` प्रयोग गर्नुहोस्:

```bash
# CI/CD पाइपलाइन कन्फिगर गर्नुहोस् (इन्टरएक्टिभ)
azd pipeline config

# निर्दिष्ट प्रदायकसँग कन्फिगर गर्नुहोस्
azd pipeline config --provider github
```

यस आदेशले:
- न्यूनतम-अधिकार पहुँच सहित सेवा प्रिन्सिपल सिर्जना गर्छ
- फेडेरेटेड क्रेडेन्सियलहरू कन्फिगर गर्छ (कुनै स्टोर्ड गोप्य छैन)
- तपाईंको पाइपलाइन परिभाषा फाइल सिर्जना वा अपडेट गर्छ
- CI/CD प्रणालीमा आवश्यक वातावरण चरहरू सेट गर्छ

**पाइपलाइन कन्फिगसँग उत्पादन वर्कफ्लो:** 

```bash
# 1. उत्पादन वातावरण सेट अप गर्नुहोस्
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. पाइपलाइन कन्फिगर गर्नुहोस्
azd pipeline config --provider github

# 3. पाइपलाइनले प्रत्येक पटक main मा push हुँदा azd deploy चलाउँछ
```

### `azd add` मार्फत कम्पोनेन्टहरू थप्ने

अवस्थित प्रोजेक्टमा क्रमिक रूपमा Azure सेवाहरू थप्नुहोस्:

```bash
# नयाँ सेवा कम्पोनेंट अन्तरक्रियात्मक रूपमा थप्नुहोस्
azd add
```

यो विशेष गरी उत्पादन AI अनुप्रयोगहरू विस्तार गर्दा उपयोगी हुन्छ—उदाहरणका लागि, एउटा भेक्टर सर्च सेवा थप्ने, नयाँ एजेण्ट अन्तबिन्दु थप्ने, वा अवस्थित डिप्लोयमेन्टमा अनुगमन कम्पोनेन्ट थप्ने।

## अतिरिक्त स्रोतहरू
- **Azure Well-Architected Framework**: [AI कार्यभार मार्गदर्शन](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [आधिकारिक दस्तावेज](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure नमूनाहरू](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure च्यानल](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, परिनियोजन, लागत अनुकूलन, र डायग्नोस्टिक्सका लागि 37 खुला एजेन्ट स्किलहरू। आफ्नै सम्पादकमा इन्स्टल गर्नुहोस्:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**अध्याय नेभिगेसन:**
- **📚 Course Home**: [AZD शुरुआतीहरूका लागि](../../README.md)
- **📖 हालको अध्याय**: अध्याय 8 - उत्पादन र उद्यम ढाँचाहरू
- **⬅️ अघिल्लो अध्याय**: [अध्याय 7: समस्या निवारण](../chapter-07-troubleshooting/debugging.md)
- **⬅️ साथै सम्बन्धित**: [AI कार्यशाला प्रयोगशाला](ai-workshop-lab.md)
- **� पाठ्यक्रम पूरा**: [AZD शुरुआतीहरूका लागि](../../README.md)

**सम्झनुहोस्**: उत्पादन AI कार्यभारहरूलाई सावधानीपूर्वक योजना, अनुगमन, र निरन्तर अनुकूलन आवश्यक हुन्छ। यी ढाँचाहरूबाट सुरु गर्नुहोस् र आफ्ना विशिष्ट आवश्यकताहरूका लागि अनुकूलन गर्नुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज [Co-op Translator](https://github.com/Azure/co-op-translator) नामक एआई अनुवाद सेवाले अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तथापि कृपया जान्नुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल भाषामा रहेको दस्तावेजलाई आधिकारिक स्रोतको रूपमा मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->