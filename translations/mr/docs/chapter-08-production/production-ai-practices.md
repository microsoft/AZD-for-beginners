# AZD सह उत्पादन AI कार्यभार सर्वोत्तम पद्धती

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स गृहपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 8 - उत्पादन व एंटरप्राइज पॅटर्न्स
- **⬅️ मागील अध्याय**: [अध्याय 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ संबंधित**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 कोर्स पूर्ण**: [AZD For Beginners](../../README.md)

## आढावा

हा मार्गदर्शक उत्पादन-तयार AI कार्यभार तैनात करण्यासाठी Azure Developer CLI (AZD) वापरण्याच्या सर्वसमावेशक सर्वोत्तम पद्धती प्रदान करतो. Microsoft Foundry Discord समुदायाच्या अभिप्रायावर आणि प्रत्यक्ष ग्राहक तैनातींवर आधारित, या पद्धती उत्पादन AI सिस्टममधील सर्वसाधारण समस्या सोडवतात.

## मुख्य समस्या addressed केल्या

आमच्या समुदायाच्या मतदानांच्या निकालांनुसार, विकासकांना या शीर्ष समस्यांचा सामना करावा लागतो:

- **४५%** मल्टी-सर्व्हिस AI तैनातींमध्ये अडचणी
- **३८%** क्रिडेन्शियल आणि सीक्रेट व्यवस्थापनात समस्या  
- **३५%** उत्पादन तयारी आणि स्केलिंग कठीण वाटणे
- **३२%** चांगल्या खर्च अनुकूलन धोरणांची गरज
- **२९%** सुधारित मॉनिटरिंग व ट्रबलशूटिंग आवश्यक

## उत्पादन AI साठी आर्किटेक्चर पॅटर्न्स

### पॅटर्न १: मायक्रोसर्व्हिसेस AI आर्किटेक्चर

**कधी वापरायचे**: अनेक क्षमता असलेल्या क्लिष्ट AI अनुप्रयोगांसाठी

```mermaid
graph TD
    Frontend[वेब फ्रंटएंड] --- Gateway[API गेटवे] --- LB[लोड बलांसर]
    Gateway --> Chat[चॅट सेवा]
    Gateway --> Image[प्रतिमा सेवा]
    Gateway --> Text[टेक्स्ट सेवा]
    Chat --> OpenAI[मायक्रोसॉफ्ट फाउंड्री मॉडेल्स]
    Image --> Vision[कंप्युटर व्हिजन]
    Text --> DocIntel[दस्तऐवज बुद्धिमत्ता]
```

**AZD अंमलबजावणी**:

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

### पॅटर्न २: इव्हेंट-ड्रिव्हन AI प्रक्रिया

**कधी वापरायचे**: बॅच प्रक्रिया, दस्तऐवज विश्लेषण, असिंक्रोनस वर्कफ्लोज

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

## AI एजंट आरोग्याबद्दल विचार

पारंपारिक वेब अ‍ॅप खराब झाल्यावर लक्षणे परिचित असतात: एखादी पृष्ठ लोड होत नाही, API त्रुटी देते किंवा तैनाती अपयशी होते. AI-शक्तीवान अनुप्रयोग देखील अशाच प्रकारे भंग होऊ शकतात—पण ते सूक्ष्म मार्गांनी चुकीचे वागू शकतात जे स्पष्ट त्रुटी संदेश निर्माण करत नाहीत.

हा विभाग आपल्याला AI कार्यभार मॉनिटर करण्यासाठी मानसिक मॉडेल तयार करण्यात मदत करतो जेणेकरून काहीतरी चुकीचे वाटल्यास कुठे पाहायचे ते माहिती येईल.

### एजंट आरोग्य पारंपारिक अ‍ॅप आरोग्यापेक्षा कसे वेगळे आहे

पारंपारिक अ‍ॅप कार्यान्वित होते किंवा नाहीच. AI एजंट कार्यरत दिसू शकतो पण निकृष्ट निकाल देऊ शकतो. एजंट आरोग्य दोन स्तरांमध्ये पाहा:

| स्तर | काय पहावे | कुठे पहावे |
|-------|--------------|---------------|
| **पूर्वाधार आरोग्य** | सेवा चालू आहे का? संसाधने दिली आहेत का? एंडपॉइंट्स पोहोचता येतात का? | `azd monitor`, Azure Portal संसाधन आरोग्य, कंटेनर/अ‍ॅप लॉग्ज |
| **वर्तन आरोग्य** | एजंट अचूक प्रतिसाद देतो का? प्रतिसाद वेळेत येतात का? मॉडेल योग्यरित्या कॉल केले जात आहे का? | Application Insights ट्रेसेस, मॉडेल कॉल लेटन्सी मेट्रिक्स, प्रतिसाद गुणवत्ता लॉग्ज |

पूर्वाधार आरोग्य परिचित आहे - ही कोणत्याही azd अ‍ॅपसाठी सारखीच आहे. वर्तन आरोग्य हा AI कार्यभारांतील नवीन स्तर आहे.

### AI अ‍ॅप अपेक्षेप्रमाणे वागत नसल्यास कुठे पाहावे

आपला AI अनुप्रयोग अपेक्षित निकाल देत नसेल, तर खालील संकल्पनात्मक तपासणी करा:

1. **मुळाशी सुरू करा.** अ‍ॅप चालू आहे का? त्याच्या अवलंबित्वाकडे पोहोचू शकतो का? `azd monitor` आणि संसाधन आरोग्य तपासा जसे तुम्ही कोणत्याही अ‍ॅपसाठी करता.
2. **मॉडेल कनेक्शन तपासा.** तुमचा अ‍ॅप यशस्वीपणे AI मॉडेल कॉल करतोय का? अयशस्वी किंवा टाइम-आउट मॉडेल कॉल हे AI अ‍ॅप समस्यांमागील सर्वात सामान्य कारण असून ते तुमच्या अ‍ॅप लॉग्जमध्ये दिसतील.
3. **मॉडेलला काय मिळाले पाहा.** AI प्रतिसाद इनपुटवर (प्रॉम्प्ट आणि कोणतीही शोधलेली संदर्भ सामग्री) अवलंबून असतो. जर आउटपुट चुकीचा असेल, तर इनपुट सहसा चुकलेला असतो. तुमचा अ‍ॅप मॉडेलला योग्य डेटा पाठवत आहे का ते तपासा.
4. **प्रतिक्रिया लेटन्सी तपासा.** AI मॉडेल कॉल सामान्य API कॉलच्या तुलनेत जास्त वेळ घेतात. तुमचा अ‍ॅप सुस्त वाटत असेल तर मॉडेल प्रतिसाद वेळ वाढला आहे का ते पहा—यामुळे थ्रॉटलिंग, क्षमतेचे मर्यादा किंवा प्रदेश-स्तरीय गर्दी सूचित होऊ शकते.
5. **खर्च संकेतांसाठी पहा.** टोकन वापर किंवा API कॉलमध्ये अनपेक्षित वाढ म्हणजे लूप, चुकीचा प्रॉम्प्ट किंवा अति पुनरावृत्ती सूचित करू शकतो.

आपल्याला तत्काळ ऑब्झर्व्हेबिलिटी टूल्समध्ये पारंगत होण्याची गरज नाही. मुख्य मुद्दा म्हणजे AI अ‍ॅप्समध्ये वर्तनाचे अतिरिक्त स्तर असते ज्यावर लक्ष ठेवायला हवे आणि azd च्या अंगभूत मॉनिटरिंग (`azd monitor`) ने दोन्ही स्तरांसाठी तपासणी सुरू करता येते.

---

## सुरक्षा सर्वोत्तम पद्धती

### १. झिरो-ट्रस्ट सुरक्षा मॉडेल

**अंमलबजावणी रणनीती**:
- प्रमाणीकरणाशिवाय कोणत्याही सेवा-ते-सेवा संवादास परवानगी नाही
- सर्व API कॉल्स मॅनेज्ड ओळखपत्रांसह होतात
- खासगी एंडपॉइंटसह नेटवर्क अलगाव
- किमान विशेषाधिकार प्रवेश नियंत्रणे

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

### २. सुरक्षित सीक्रेट व्यवस्थापन

**की व्हॉल्ट समाकलन नमुना**:

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

### ३. नेटवर्क सुरक्षा

**खासगी एंडपॉइंट कॉन्फिगरेशन**:

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

## कामगिरी व स्केलिंग

### १. ऑटो-स्केलिंग धोरणे

**कंटेनर अ‍ॅप्स ऑटो-स्केलिंग**:

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

### २. कॅशिंग धोरणे

**Redis कॅश AI प्रतिसादांसाठी**:

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

### ३. लोड बॅलन्सिंग व ट्रॅफिक व्यवस्थापन

**WAF सह अ‍ॅप्लिकेशन गेटवे**:

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

## 💰 खर्च अनुकूलन

### १. संसाधन योग्य आकाराचे निर्धारण

**परिसर-विशिष्ट कॉन्फिगरेशन**:

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

### २. खर्च मॉनिटरिंग व बजेट

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

### ३. टोकन वापर अनुकूलन

**OpenAI खर्च व्यवस्थापन**:

```typescript
// अनुप्रयोग-स्तर टोकन ऑप्टिमायझेशन
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // वापरकर्त्याच्या इनपुटऐवजी संदर्भ कापा
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // अंदाजे मूल्यांकन: 1 टोकन ≈ 4 अक्षरे
    return Math.ceil(text.length / 4);
  }
}
```

## मॉनिटरिंग व ऑब्झर्व्हेबिलिटी

### १. सर्वसमावेशक Application Insights

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

### २. AI-स्पेसिफिक मॉनिटरिंग

**AI मेट्रिक्ससाठी कस्टम डॅशबोर्ड**:

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

### ३. हेल्थ चेक आणि अपटाइम मॉनिटरिंग

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

## आपत्ती पुनर्प्राप्ती व उच्च उपलब्धता

### १. मल्टी-रिजन तैनाती

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

### २. डेटा बॅकअप व पुनर्प्राप्ती

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

## DevOps व CI/CD समाकलन

### १. GitHub Actions वर्कफ्लो

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

### २. पूर्वाधार वैधता

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# तपासा की सर्व आवश्यक सेवा चालू आहेत का
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI मॉडेल डिप्लॉयमेंट्स वैध ठरवा
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# AI सेवा कनेक्टिव्हिटीची चाचणी करा
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## उत्पादन तयारी चेकलिस्ट

### सुरक्षा ✅
- [ ] सर्व सेवा मॅनेज्ड ओळखपत्रे वापरतात
- [ ] सीक्रेट्स की व्हॉल्टमध्ये साठवले जातात
- [ ] खासगी एंडपॉइंट कॉन्फिगर केलेले आहेत
- [ ] नेटवर्क सुरक्षा गट अंमलात आले आहेत
- [ ] किमान विशेषाधिकारांसह RBAC
- [ ] सार्वजनिक एंडपॉइंटसाठी WAF सक्षम आहे

### कामगिरी ✅
- [ ] ऑटो-स्केलिंग कॉन्फिगर केलेले आहे
- [ ] कॅशिंग राबवले गेले आहे
- [ ] लोड बॅलन्सिंग सेटअप केलेले आहे
- [ ] स्थिर सामग्रीसाठी CDN
- [ ] डेटाबेस कनेक्शन पूलिंग
- [ ] टोकन वापर अनुकूलन

### मॉनिटरिंग ✅
- [ ] Application Insights कॉन्फिगर केलेले आहे
- [ ] कस्टम मेट्रिक्स परिभाषित केलेले आहेत
- [ ] अलर्ट नियम सेटअप केलेले आहेत
- [ ] डॅशबोर्ड तयार केलेले आहे
- [ ] हेल्थ चेक्ज लागू केलेले आहेत
- [ ] लॉग रिटेंशन धोरणे

### विश्वासार्हता ✅
- [ ] मल्टी-रिजन तैनाती
- [ ] बॅकअप व पुनर्प्राप्ती योजना
- [ ] सर्किट ब्रेकर अंमलात आणलेले आहेत
- [ ] पुनरावृत्ती धोरणे कॉन्फिगर केलेली आहेत
- [ ] मार्जीनली डिग्रेडेशन
- [ ] हेल्थ चेक एंडपॉइंट्स

### खर्च व्यवस्थापन ✅
- [ ] बजेट अलर्ट कॉन्फिगर केलेले आहेत
- [ ] संसाधन योग्य आकारांसाठी
- [ ] विकास/चाचणी सवलती लागू केल्या
- [ ] आरक्षित उदाहरणे खरेदी केली
- [ ] खर्च मॉनिटरिंग डॅशबोर्ड
- [ ] नियमित खर्च पुनरावलोकने

### अनुपालन ✅
- [ ] डेटा निवास गरजा पूर्ण झाल्या
- [ ] ऑडिट लॉगिंग सक्षम केलेले
- [ ] अनुपालन धोरणे लागू केल्या
- [ ] सुरक्षा बेसलाईन्स अंमलात आलेले
- [ ] नियमित सुरक्षा मूल्यांकन
- [ ] आपत्ती प्रतिसाद योजना

## कामगिरी बेंचमार्क्स

### सामान्य उत्पादन मेट्रिक्स

| मेट्रिक | लक्ष्य | मॉनिटरिंग |
|--------|--------|------------|
| **प्रतिक्रिया वेळ** | < २ सेकंद | Application Insights |
| **उपलब्धता** | ९९.९% | अपटाइम मॉनिटरिंग |
| **त्रुटी दर** | < ०.१% | अ‍ॅप्लिकेशन लॉग्ज |
| **टोकन वापर** | < $५००/महिना | खर्च व्यवस्थापन |
| **समांतर वापरकर्ते** | १०००+ | लोड चाचणी |
| **पुनर्प्राप्ती वेळ** | < १ तास | आपत्ती पुनर्प्राप्ती चाचण्या |

### लोड चाचणी

```bash
# AI अनुप्रयोगांसाठी लोड चाचणी स्क्रिप्ट
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 समुदायाच्या सर्वोत्तम पद्धती

Microsoft Foundry Discord समुदायाच्या अभिप्रायावर आधारित:

### समुदायाकडून शीर्ष शिफारसी:

1. **लहानपासून सुरुवात करा, हळूहळू स्केल करा**: मूलभूत SKU सह सुरू करा आणि प्रत्यक्ष वापरानुसार वाढवा
2. **सर्वकाही मॉनिटर करा**: पहिल्याच दिवशी सर्वसमावेशक मॉनिटरिंग सेट करा
3. **सुरक्षा स्वयंचलित करा**: सुसंगततेसाठी इन्फ्रास्ट्रक्चर एज कोड वापरा
4. **संपूर्ण चाचणी करा**: तुमच्या पाइपलाइनमध्ये AI-विशिष्ट चाचणी समाविष्ट करा
5. **खर्चांसाठी योजना करा**: टोकन वापर पहा आणि लवकरच बजेट अलर्ट सेट करा

### सामान्य चुका टाळा:

- ❌ API की कोडमध्ये हार्डकोड करणे
- ❌ योग्य मॉनिटरिंग न करणे
- ❌ खर्च अनुकूलनकडे दुर्लक्ष करणे
- ❌ अपयश परिस्थिती चाचणी न करणे
- ❌ हेल्थ चेक न वापरता तैनात करणे

## AZD AI CLI कमांड्स आणि एक्सटेंशन्स

AZD मध्ये AI-विशिष्ट कमांड्स आणि एक्सटेंशन्स वाढत आहेत जे उत्पादन AI वर्कफ्लो सुलभ करतात. हे साधने स्थानिक विकास व उत्पादन तैनाती यांच्यातील अंतर कमी करतात.

### AI साठी AZD एक्सटेंशन्स

AZD एक एक्सटेंशन प्रणाली वापरते ज्याद्वारे AI-विशिष्ट क्षमता जोडल्या जातात. खालीलप्रमाणे एक्सटेंशन्स इन्स्टॉल व व्यवस्थापित करा:

```bash
# सर्व उपलब्ध विस्तारांची यादी करा (AI सह)
azd extension list

# इन्स्टॉल केलेल्या विस्तारांचे तपशील तपासा
azd extension show azure.ai.agents

# Foundry एजंट्स विस्तार स्थापित करा
azd extension install azure.ai.agents

# फाइन-ट्यूनिंग विस्तार स्थापित करा
azd extension install azure.ai.finetune

# कस्टम मॉडेल्स विस्तार स्थापित करा
azd extension install azure.ai.models

# सर्व इन्स्टॉल केलेले विस्तार अपग्रेड करा
azd extension upgrade --all
```

**उपलब्ध AI एक्सटेंशन्स:**

| एक्सटेंशन | उद्देश | स्थिती |
|-----------|---------|--------|
| `azure.ai.agents` | Foundry एजंट सेवा व्यवस्थापन | प्रिव्ह्यू |
| `azure.ai.skills` | पुनर्वापरयोग्य एजंट कौशल्ये | प्रिव्ह्यू |
| `azure.ai.connections` | Foundry कनेक्शन्स (डेटा स्रोत, उपकरणे) | प्रिव्ह्यू |
| `azure.ai.finetune` | Foundry मॉडेल फाइन-ट्यूनिंग | प्रिव्ह्यू |
| `azure.ai.models` | Foundry कस्टम मॉडेल्स | प्रिव्ह्यू |
| `azure.coding-agent` | कोडिंग एजंट कॉन्फिगरेशन | उपलब्ध |

> `azure.ai.agents` एक्सटेंशन जलद विकसित होत आहे. हा कोर्स `0.1.40-preview` वर सत्यापित आहे. `azd extension upgrade --all` चालवा ताजे कमांड सेट मिळविण्यासाठी, आणि `azd extension show azure.ai.agents` करून तुमचा इन्स्टॉल केलेला संस्करण तपासा.

**नवीन `skills` आणि `connections` एक्सटेंशन्स काय आहेत?**

एजंट टूलिंगसोबत दोन प्रिव्ह्यू एक्सटेंशन्स आले आहेत आणि सुरुवातीला हे समजून घेणे उपयुक्त आहे:

- **`azure.ai.skills`** — एक **कौशल्य** म्हणजे पुनर्वापरासाठी असलेली क्षमता (पॅकेज केलेले साधन किंवा वर्तन) जी तुम्ही अनेक एजंट्सना जोडू शकता, पुन्हा तयार करण्याऐवजी. हे एका सामायिक बिल्डिंग ब्लॉकसारखे आहे: "दस्तऐवज शोधा" किंवा "ऑर्डर शोधा" असे कौशल्य एकदाच तयार करा आणि नंतर एजंट्समध्ये पुनर्वापर करा. यामुळे मल्टी-एजंट सिस्टम्स (अध्याय 5) सुसंगत राहतात आणि कॉपी-पेस्ट टाळता येतो.
- **`azure.ai.connections`** — एक **कनेक्शन** म्हणजे तुमच्या Foundry प्रोजेक्टचे बाह्य स्त्रोताकडे एजंट्सना प्रवेश देणारे व्यवस्थापित दुवा—डेटा स्रोत (जसे Azure AI Search), उपकरण एंडपॉइंट, किंवा दुसरी सेवा. कनेक्शन्स एजंट्सकडे डेटा कोठे आणि कसे पोहोचतो याचे केंद्रीकरण करतात, त्यामुळे क्रेडेन्शियल्स आणि एंडपॉइंट्स कोडमध्ये विखुरले जाण्याऐवजी एका नियंत्रित ठिकाणी राहतात.

तुम्हाला तुमचे पहिले एजंट तैनात करण्यासाठी हे आवश्यक नाही—`azure.ai.agents` वर लक्ष ठेवा शिकण्याच्या काळात. जेव्हा तुम्हाला त्या सारखे उपकरण अनेक एजंट्समध्ये डुप्लिकेट करावे लागेल तेव्हा `skills` वापरा, आणि जेव्हा अनेक एजंट्स एकाच डेटा स्रोताचा वापर करतात तेव्हा `connections`.

### `azd ai agent init` सह एजंट प्रोजेक्ट्सची सुरुवात

`azd ai agent init` कमांड Microsoft Foundry Agent Service सह जोडलेला उत्पादन-तयार AI एजंट प्रोजेक्ट तयार करते:

```bash
# एजंट मॅनिफेस्टमधून नवीन एजंट प्रकल्प सुरू करा
azd ai agent init -m <manifest-path-or-uri>

# विशिष्ट Foundry प्रकल्प सुरू करा आणि लक्ष्य करा
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# कस्टम स्रोत निर्देशिकेसह प्रारंभ करा
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# होस्ट म्हणून कंटेनर अॅप्सचे लक्ष्य करा
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**महत्त्वाचे ध्वज (flags):**

| ध्वज | वर्णन |
|------|-------------|
| `-m, --manifest` | तुमच्या प्रोजेक्टमध्ये जोडण्यासाठी एजंट मॅनिफेस्टची मार्ग किंवा URI |
| `-p, --project-id` | तुमच्या azd पर्यावरणासाठी विद्यमान Microsoft Foundry प्रोजेक्ट आयडी |
| `-s, --src` | एजंट व्याख्या डाउनलोड करण्यासाठी निर्देशिका (मूलतः `src/<agent-id>`) |
| `--host` | डीफॉल्ट होस्ट ओवरराईड करा (उदा., `containerapp`) |
| `-e, --environment` | वापरण्याचे azd वातावरण |

**उत्पादन टिप**: `--project-id` वापरून थेट विद्यमान Foundry प्रोजेक्टशी कनेक्ट करा, तुमचा एजंट कोड आणि क्लाउड संसाधने सुरुवातीपासून लिंक्ड राहतील.

### एजंट जीवनचक्र व्यवस्थापन

`init` व्यतिरिक्त, `azure.ai.agents` एक्सटेंशन होस्टेड एजंटचे पूर्ण जीवनचक्र व्यवस्थापित करणाऱ्या कमांड्स पुरवते—चाचणी, मूल्यांकन, ऑप्टिमायझेशन, आणि निवृत्ती:

```bash
# तैनात एजंटला कॉल करा आणि सर्व्हर प्रतिसाद वेळ पहा
# (एकूण विलंब आणि प्रथम बाइटपर्यंतचा वेळ)
azd ai agent invoke

# बदल करण्यापूर्वी थेट एंडपॉइंट कॉन्फिगरेशन दाखवा
azd ai agent endpoint show

# एजंटसाठी मूल्यमापन डेटा सेट तयार करा
azd ai agent eval generate --dataset ./eval/dataset.jsonl

# आपल्या मूल्यमापन डेटाअनुसार एजंट सूचनांचे अनुकूलन करा
# (एजंट प्रोजेक्टमध्ये optimization_model आवश्यक आहे)
azd ai agent optimize

# कोड-आधारित होस्टेड एजंटचा तैनात स्रोत डाउनलोड करा
# (SHA-256 पडताळणीसह)
azd ai agent code download

# होस्टेड एजंट आणि त्याच्या सर्व आवृत्त्या हटवा
# (--force सक्रिय सत्रे समाप्त करते)
azd ai agent delete --force
```

**जीवनचक्राचा आढावा:**

| टप्पा | कमांड | उत्पादन वापर |
|-------|---------|----------------|
| चाचणी | `azd ai agent invoke` | प्रकाशनापूर्वी प्रतिसाद वैधता आणि लेटन्सी मोजा |
| तपासणी | `azd ai agent endpoint show` | एंडपॉइंट ऑथ/कॉन्फिग तपासा; ताबडतोब बदलांसाठी लक्ष ठेवा |
| मोजणी | `azd ai agent eval generate` | वास्तविक ट्रेसेसपासून पुनरावृत्ती होऊ शकणारे मूल्यांकन संच तयार करा |
| सुधारणा | `azd ai agent optimize` | मोजलेल्या गुणवत्तेवर आधारित सूचना ट्यून करा |
| पुनर्प्राप्ती | `azd ai agent code download` | अचूक तैनात स्रोत प्राप्त करा ऑडिट/रोलबॅकसाठी |
| निवृत्ती | `azd ai agent delete --force` | एजंट आणि त्याच्या आवृत्त्या स्वच्छपणे हटवा |

> ही प्रिव्ह्यू कमांड्स आहेत आणि एक्सटेंशनच्या आवृत्त्यांमध्ये बदलू शकतात. `azd ai agent --help` चालवा तुमच्या इन्स्टॉल आवृत्तीतील उपलब्ध सबकमानड्स पाहण्यासाठी.

### `azd mcp` सह मॉडेल संदर्भ प्रोटोकॉल (MCP)
AZDमध्ये इनबिल्ट MCP सर्व्हर सपोर्ट (अल्फा) समाविष्ट आहे, ज्यामुळे AI एजंट्स आणि साधने आपल्या Azure संसाधनांशी एकसंध प्रोटोकॉलद्वारे संवाद साधू शकतात:

```bash
# आपल्या प्रकल्पासाठी MCP सर्व्हर सुरू करा
azd mcp start

# टूल अंमलबजावणीसाठी सध्याच्या Copilot संमती नियमांचे पुनरावलोकन करा
azd copilot consent list
```

MCP सर्व्हर आपला azd प्रोजेक्ट संदर्भ—पर्यावरण, सेवा, आणि Azure संसाधने—AI-शक्तीप्राप्त विकास साधनांसमोर मोकळा करतो. हे सक्षम करते:

- **AI सहायक तैनाती**: कोडिंग एजंट्सना आपला प्रोजेक्ट स्थिती विचारण्याचा आणि तैनाती सुरू करण्याचा परवानगी द्या
- **संसाधन शोध**: AI साधने शोधू शकतात की आपल्या प्रोजेक्टमध्ये कोणती Azure संसाधने वापरली जातात
- **पर्यावरण व्यवस्थापन**: एजंट्स डेव/स्टेजिंग/उत्पादन पर्यावरणांमध्ये स्विच करू शकतात

### `azd infra generate` सह पायाभूत सुविधा निर्मिती

उत्पादन AI वर्कलोडसाठी, आपण आपोआप प्राविजनिंगवर अवलंबून न राहता Infrastructure as Code तयार आणि सानुकूलित करू शकता:

```bash
# तुमच्या प्रकल्प व्याख्येतून बायसेप/टेराफॉर्म फाइल्स तयार करा
azd infra generate
```

हे IaC डिस्कवर लिहिते त्यामुळे आपण करू शकता:
- तैनात करण्यापूर्वी पायाभूत सुविधा पुनरावलोकन आणि ऑडिट करा
- सानुकूल सुरक्षा धोरणे जोडा (नेटवर्क नियम, खासगी एंडपॉइंट्स)
- विद्यमान IaC पुनरावलोकन प्रक्रियांमध्ये समाकलित करा
- अ‍ॅप्लिकेशन कोडपासून स्वतंत्रपणे पायाभूत सुविधा बदलांचे आवृत्ती नियंत्रण करा

### उत्पादन जीवनचक्र हुक

AZD हुक आपल्याला तैनाती जीवनचक्राच्या प्रत्येक टप्प्यावर सानुकूल लॉजिक इन्सर्ट करण्याची मुभा देतात—जो उत्पादन AI वर्कफ्लोजसाठी महत्त्वाचा आहे:

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
# विकास दरम्यान विशिष्ट हुक हाताने चालवा
azd hooks run predeploy
```

**AI वर्कलोडसाठी शिफारस केलेले उत्पादन हुक:**

| हुक | वापर प्रकरण |
|------|----------|
| `preprovision` | AI मॉडेल क्षमतेसाठी सबस्क्रिप्शन कोटा वैध करा |
| `postprovision` | खासगी एंडपॉइंट कॉन्फिगर करा, मॉडेल वेट्स तैनात करा |
| `predeploy` | AI सुरक्षा चाचण्या चालवा, प्रॉम्प्ट टेम्पलेट्स वैध करा |
| `postdeploy` | एजंट प्रतिसादांसाठी स्मोक टेस्ट करा, मॉडेल कनेक्टिव्हिटी सत्यापित करा |

### CI/CD पाईपलाइन कॉन्फिगरेशन

आपला प्रोजेक्ट GitHub Actions किंवा Azure Pipelines शी सुरक्षित Azure प्रमाणीकरणासह कनेक्ट करण्यासाठी `azd pipeline config` वापरा:

```bash
# CI/CD पाईपलाइन कॉन्फिगर करा (इंटरऐक्टिव्ह)
azd pipeline config

# एखाद्या विशिष्ट प्रदात्यासह कॉन्फिगर करा
azd pipeline config --provider github
```

हा कमांड:
- किमान-प्राधान्य प्रवेशासह सेवा प्रिंसिपल तयार करतो
- फेडरेटेड क्रेडेन्शियल्स कॉन्फिगर करतो (कोणतेही सांत्विक सिक्रेट संग्रहित नाही)
- आपली पाईपलाइन परिभाषा फाइल तयार किंवा अद्ययावत करतो
- आपली CI/CD प्रणालीमध्ये आवश्यक पर्यावरण चल सेट करतो

#### टप्प्याटप्प्याने: आपली पहिली GitHub Actions पाईपलाइन

इथे एका काम करणाऱ्या azd प्रोजेक्टपासून दर पुषवर आपोआप तैनातीपर्यंत संपूर्ण मार्गदर्शन आहे.

**1. खात्री करा की आपला प्रोजेक्ट GitHub वर आहे**

```bash
git init
git add .
git commit -m "Initial azd project"
gh repo create my-ai-app --private --source=. --push
```

**2. पाइपलाइन कॉन्फिग चालवा**

```bash
azd pipeline config --provider github
```

azd संवादात्मकरित्या:
- कोणता Azure सबस्क्रिप्शन आणि पर्यावरण लक्ष्यित करायचा हे विचारेल
- पाइपलाइनसाठी Entra **अ‍ॅप नोंदणी + सेवा प्रिंसिपल** तयार करेल
- **फेडरेटेड क्रेडेन्शियल्स (OIDC)** सेटअप करेल—म्हणजे GitHub Azure शी लघु-कालावधी टोकन्ससह प्रमाणीकरण करते आणि **कोणतेही सिक्रेट संग्रहित केले जात नाहीत**
- आवश्यक **चल** आपल्या GitHub रेपोत ढकलेल (`AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`, `AZURE_ENV_NAME`, `AZURE_LOCATION`)

**3. तयार केलेले वर्कफ्लो समजून घ्या**

azd `.github/workflows/azure-dev.yml` जोडतो. प्रमुख भाग असे दिसतात:

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

**4. ते कार्यरत आहे का तपासा**

```bash
# पाइपलाइन ट्रिगर करण्यासाठी एक बदल पुश करा
git commit -am "Trigger pipeline" --allow-empty
git push
```

आपल्या GitHub रेपोत **Actions** टॅब उघडा आणि वर्कफ्लो `azd provision` आणि `azd deploy` आपोआप चालताना पहा.

> **फेडरेटेड क्रेडेन्शियल्स का महत्त्वाचे आहेत:** जुन्या पाईपलाइनमध्ये GitHub मध्ये क्लाएंट सिक्रेट संग्रहित केले जात असे. OIDC फेडरेटेड क्रेडेन्शियल्स त्या सिक्रेटला पूर्णपणे काढून टाकतात—GitHub रनटाइममध्ये लघु-कालावधी टोकनची विनंती करतो, जे अधिक सुरक्षित आहे आणि पुन:प्रक्रिया किंवा लीक होण्याची काळजी नाही. हे डीफॉल्ट `azd pipeline config` सेटअप आहे.

> **सिक्रेट विरुद्ध चल:** गैर-संवेदनशील ओळखपत्रे (`AZURE_CLIENT_ID` इ.) रेपो **चल** मध्ये जातात. आपल्या अ‍ॅपला खरोखर बिल्ड वेळेत सिक्रेटची आवश्यकता असल्यास, GitHub **सिक्रेट** म्हणून जोडा आणि ` ${{ secrets.NAME }}` असा संदर्भ द्या—पण रनटाइममध्ये Key Vault + मॅनेज्ड ओळख प्राधान्य द्या (बघा [Chapter 3](../chapter-03-configuration/authsecurity.md)).

**पाईपलाइन कॉन्फिगसह उत्पादन वर्कफ्लो:**

```bash
# 1. उत्पादन वातावरण सेट करा
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. पाईपलाईन कॉन्फिगर करा
azd pipeline config --provider github

# 3. मुख्य शाखेत प्रत्येक पुशवर पाईपलाईन azd deploy चालवते
```

#### टप्प्याटप्प्याने: Azure DevOps Pipelines

GitHub Actions पेक्षा Azure DevOps प्राधान्य द्याल का? azd त्याला नैसर्गिकरित्या `azdo` प्रदात्यासह समर्थन देते. फ्लो जवळजवळ सारखाच आहे—azd पाईपलाइन फाइल तयार करते, सेवा कनेक्शन तयार करते, आणि प्रमाणीकरण सुसज्ज करते.

**1. खात्री करा की आपल्याकडे एक Azure DevOps प्रोजेक्ट आहे**

आपल्याला `https://dev.azure.com/<your-org>` येथे एक संघटना आणि प्रोजेक्ट आवश्यक आहे. **Build (Read & execute)**, **Code (Read & write)**, आणि **Service Connections (Read, query & manage)** स्कोपसह व्यावसायिक प्रवेश टोकन (PAT) तयार करा—azd आपल्याला यासाठी विचारेल.

**2. पाइपलाइन कॉन्फिग करा**

```bash
azd pipeline config --provider azdo
```

azd:
- आपल्या Azure DevOps संघटना आणि प्रोजेक्टसाठी विचारेल
- सेवा प्रिंसिपल वापरून Azure साठी **सेवा कनेक्शन** तयार करेल (किंवा पुन्हा वापरेल)
- **वर्कलोड ओळख फेडरेशन (OIDC)** कॉन्फिगर करेल त्यामुळे कोणतेही क्लाएंट सिक्रेट संग्रहित नाही
- आपल्या रेपोत `azure-dev.yml` पाईपलाइन परिभाषा कमिट करेल

**3. तयार झालेले `azure-dev.yml` पुनरावलोकन करा**

azd एक अशी पाईपलाइन लिहिते जी प्रत्येक `main` पुशवर प्राव्हिजन आणि तैनात करते:

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

**4. चल कुठून येतात**

azd पर्यावरण मूल्ये (`AZURE_ENV_NAME`, `AZURE_LOCATION`, `AZURE_SUBSCRIPTION_ID`) Azure DevOps मध्ये एक **variable group** म्हणून संग्रहित करतो जेणेकरून पाईपलाइन त्यांना वाचू शकेल. आपण ते **Pipelines → Library** अंतर्गत पाहू आणि संपादित करू शकता.

> **GitHub प्रमाणेच OIDC फायदा:** `azdo` प्रदाता डीफॉल्टनुसार वर्कलोड ओळख फेडरेशन देखील कॉन्फिगर करतो, त्यामुळे सेवा कनेक्शनमध्ये कोणताही क्लाएंट सिक्रेट संग्रहित होत नाही—Azure DevOps रनटाइममध्ये लघु-कालावधी टोकन देवाणघेवाण करते. आपली संघटना OIDC वापरू शकत नाही तरच `--auth-type client-credentials` पास करा.

**5. त्याला चालवा**

```bash
git commit -am "Add Azure DevOps pipeline" --allow-empty
git push
```

Azure DevOps मध्ये **Pipelines** उघडा आणि `azd provision` आणि `azd deploy` चालताना पाहा.

### `azd add` सह घटक जोडणे

वर्तमान प्रोजेक्टमध्ये हळूहळू Azure सेवा जोडा:

```bash
# नवीन सेवा घटक संवादात्मकपणे जोडा
azd add
```

हे उत्पादन AI अनुप्रयोग वाढवण्यासाठी विशेषतः उपयुक्त आहे—उदाहरणार्थ, व्हेक्टर शोध सेवा, नवीन एजंट एंडपॉइंट किंवा विद्यमान तैनातीसाठी देखरेख घटक जोडणे.

## अतिरिक्त संसाधने

- **Azure वेळ-आर्किटेक्टेड फ्रेमवर्क**: [AI वर्कलोड मार्गदर्शन](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry डॉक्यूमेंटेशन**: [अधिकृत दस्तऐवज](https://learn.microsoft.com/azure/ai-studio/)
- **समुदाय टेम्पलेट्स**: [Azure सॅम्पल्स](https://github.com/Azure-Samples)
- **डिसकॉर्ड समुदाय**: [#Azure चॅनेल](https://discord.gg/microsoft-azure)
- **Azure साठी एजंट कौशल्ये**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, तैनाती, खर्च ऑप्टिमायझेशन, आणि निदानासाठी 37 खुल्या एजंट कौशल्ये. आपले एडिटरमध्ये इंस्टॉल करा:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 8 - उत्पादन आणि एंटरप्राइझ नमुने
- **⬅️ मागील अध्याय**: [अध्याय 7: समस्या सोडवणे](../chapter-07-troubleshooting/debugging.md)
- **⬅️ संबंधित देखील:** [AI वर्कशॉप लॅब](ai-workshop-lab.md)
- **� कोर्स पूर्ण**: [AZD For Beginners](../../README.md)

**लक्षात ठेवा**: उत्पादन AI वर्कलोडसाठी काळजीपूर्वक नियोजन, निरीक्षण, आणि सातत्यपूर्ण ऑप्टिमायझेशन आवश्यक आहे. ह्या पॅटर्न्सपासून सुरू करा आणि आपल्या विशिष्ट गरजांनुसार त्यास अनुकूल करा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->