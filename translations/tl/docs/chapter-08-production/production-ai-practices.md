# Production AI Workload Best Practices with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Current Chapter**: Kabanata 8 - Production & Enterprise Patterns
- **⬅️ Previous Chapter**: [Kabanata 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Course Complete**: [AZD Para sa Mga Nagsisimula](../../README.md)

## Overview

Ang gabay na ito ay nagbibigay ng komprehensibong mga best practice para sa pag-deploy ng production-ready na AI workloads gamit ang Azure Developer CLI (AZD). Batay sa feedback mula sa Microsoft Foundry Discord community at mga totoong deployment ng customer, tinutugunan ng mga praktikang ito ang mga pinaka-karaniwang hamon sa mga production AI system.

## Key Challenges Addressed

Batay sa resulta ng aming poll sa komunidad, ito ang mga nangungunang hamon na hinarap ng mga developer:

- **45%** nahihirapan sa multi-service AI deployments
- **38%** may mga isyu sa credential at pamamahala ng secret  
- **35%** nahihirapan sa production readiness at scaling
- **32%** kailangan ng mas mahusay na mga estratehiya sa pag-optimize ng gastos
- **29%** nangangailangan ng pinahusay na monitoring at troubleshooting

## Architecture Patterns for Production AI

### Pattern 1: Microservices AI Architecture

**When to use**: Complex AI applications with multiple capabilities

```mermaid
graph TD
    Frontend[Frontend ng Web] --- Gateway[Gateway ng API] --- LB[Tagapantimbang ng Karga]
    Gateway --> Chat[Serbisyo ng Chat]
    Gateway --> Image[Serbisyo ng Imahe]
    Gateway --> Text[Serbisyo ng Teksto]
    Chat --> OpenAI[Mga Modelo ng Microsoft Foundry]
    Image --> Vision[Paningin ng Kompyuter]
    Text --> DocIntel[Intelihensiya ng Dokumento]
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

**When to use**: Batch processing, document analysis, async workflows

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

Kapag nasira ang isang tradisyonal na web app, pamilyar ang mga sintomas: hindi naglo-load ang isang pahina, nagbabalik ng error ang isang API, o nabigo ang deployment. Ang mga AI-powered na aplikasyon ay maaaring masira sa parehong mga paraan—ngunit maaari rin silang kumilos nang mas banayad na hindi nagpapakita ng malinaw na mga mensahe ng error.

Ang seksyong ito ay tumutulong sa iyo na bumuo ng isang mental model para sa pagmo-monitor ng AI workloads upang malaman mo kung saan hahanapin kapag hindi tama ang takbo ng mga bagay.

### How Agent Health Differs from Traditional App Health

Ang isang tradisyonal na app ay gumagana o hindi. Ang isang AI agent ay maaaring magmukhang gumagana ngunit maglabas ng mahihinang resulta. Isipin ang kalagayan ng agent sa dalawang patong:

| Antas | Ano ang Bantayan | Saan Titignan |
|-------|--------------|---------------|
| **Infrastructure health** | Gumagana ba ang serbisyo? Nakaprovisyon ba ang mga resources? Maaabot ba ang mga endpoint? | `azd monitor`, Azure Portal resource health, container/app logs |
| **Behavior health** | Tumutugon ba ang agent nang tama? Maaasahan ba ang oras ng tugon? Tama ba ang pagtawag sa modelo? | Application Insights traces, model call latency metrics, response quality logs |

Pamilyar ang infrastructure health—pareho lang ito para sa anumang azd app. Ang behavior health ang bagong patong na ipinakikilala ng mga AI workload.

### Where to Look When AI Apps Don't Behave as Expected

Kung ang iyong AI application ay hindi naglalabas ng inaasahan mong resulta, narito ang isang konseptwal na checklist:

1. **Magsimula sa mga batayan.** Gumagana ba ang app? Maaabot ba nito ang mga dependency nito? Suriin ang `azd monitor` at resource health gaya ng gagawin mo sa anumang app.
2. **Suriin ang koneksyon sa modelo.** Matagumpay ba na tinatawagan ng iyong application ang AI model? Ang mga nabigong o na-timeout na tawag sa modelo ang pinaka-karaniwang sanhi ng mga isyu sa AI app at makikita sa iyong application logs.
3. **Tingnan kung ano ang natanggap ng modelo.** Nakadepende ang mga AI response sa input (ang prompt at anumang narekober na konteksto). Kung mali ang output, karaniwang mali ang input. Suriin kung ipinapadala ng iyong application ang tamang data sa modelo.
4. **Suriin ang latency ng tugon.** Mas mabagal ang mga tawag sa AI model kaysa sa tipikal na API calls. Kung mabagal ang pakiramdam ng app, tingnan kung tumaas ang mga oras ng tugon ng modelo—maaaring magpahiwatig ito ng throttling, mga limitasyon sa kapasidad, o congested na rehiyon.
5. **Magbantay para sa mga senyales ng gastos.** Ang hindi inaasahang pagtaas sa paggamit ng token o bilang ng API calls ay maaaring magpahiwatig ng loop, maling naka-configure na prompt, o labis na retries.

Hindi mo kailangang maging dalubhasa sa observability tooling agad. Ang pangunahing takeaway ay may dagdag na patong ng pag-uugali na kailangang i-monitor ang mga AI application, at nagbibigay ang built-in na monitoring ng azd (`azd monitor`) ng panimulang punto para imbestigahan ang parehong patong.

---

## Security Best Practices

### 1. Zero-Trust Security Model

**Implementation Strategy**:
- Walang service-to-service communication nang walang authentication
- Lahat ng API calls ay gumagamit ng managed identities
- Network isolation gamit ang private endpoints
- Least privilege access controls

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
# Kapaligiran ng pag-unlad
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Kapaligiran ng produksyon
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
// Pag-optimize ng token sa antas ng aplikasyon
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Putulin ang konteksto, hindi ang input ng gumagamit
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Magaspang na pagtatantya: 1 token ≈ 4 na karakter
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

### 2. Infrastructure Validation

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Suriin kung tumatakbo ang lahat ng kinakailangang serbisyo
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Patunayan ang pag-deploy ng mga modelo ng OpenAI
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# Subukan ang koneksyon ng serbisyo ng AI
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Production Readiness Checklist

### Security ✅
- [ ] Lahat ng serbisyo ay gumagamit ng managed identities
- [ ] Secrets naka-imbak sa Key Vault
- [ ] Na-configure ang private endpoints
- [ ] Naipatupad ang network security groups
- [ ] RBAC na may least privilege
- [ ] WAF naka-enable sa public endpoints

### Performance ✅
- [ ] Na-configure ang auto-scaling
- [ ] Naipatupad ang caching
- [ ] Naayos ang load balancing
- [ ] CDN para sa static content
- [ ] Database connection pooling
- [ ] Pag-optimize ng token usage

### Monitoring ✅
- [ ] Na-configure ang Application Insights
- [ ] Na-define ang custom metrics
- [ ] Na-set up ang alerting rules
- [ ] Nalikha ang dashboard
- [ ] Naipatupad ang health checks
- [ ] Mga patakaran sa log retention

### Reliability ✅
- [ ] Multi-region deployment
- [ ] Plano para sa backup at recovery
- [ ] Naipatupad ang circuit breakers
- [ ] Na-configure ang retry policies
- [ ] Graceful degradation
- [ ] Health check endpoints

### Cost Management ✅
- [ ] Na-configure ang budget alerts
- [ ] Resource right-sizing
- [ ] Na-apply ang dev/test discounts
- [ ] Na-purchase ang reserved instances
- [ ] Cost monitoring dashboard
- [ ] Regular na pagsusuri ng gastos

### Compliance ✅
- [ ] Natugunan ang data residency requirements
- [ ] Na-enable ang audit logging
- [ ] Na-apply ang compliance policies
- [ ] Naipatupad ang security baselines
- [ ] Regular na security assessments
- [ ] Plano para sa incident response

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
# Script para sa load testing ng mga aplikasyon ng AI
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Community Best Practices

Batay sa feedback ng Microsoft Foundry Discord community:

### Top Recommendations from the Community:

1. **Magsimula nang Maliit, Mag-scale Nang Paunti-unti**: Magsimula sa basic SKUs at mag-scale batay sa aktwal na paggamit
2. **I-monitor Lahat**: Mag-set up ng komprehensibong monitoring mula unang araw
3. **I-automate ang Seguridad**: Gumamit ng infrastructure as code para sa consistent na seguridad
4. **Mag-test nang Mabuti**: Isama ang AI-specific testing sa iyong pipeline
5. **Magplano para sa Gastos**: I-monitor ang token usage at mag-set ng budget alerts nang maaga

### Common Pitfalls to Avoid:

- ❌ Hardcoding API keys sa code
- ❌ Hindi pag-set up ng tamang monitoring
- ❌ Pagwawalang-bahala sa cost optimization
- ❌ Hindi pag-test ng failure scenarios
- ❌ Pag-deploy nang walang health checks

## AZD AI CLI Commands and Extensions

Kasama sa AZD ang lumalaking hanay ng AI-specific na commands at extensions na nagpapadali sa production AI workflows. Binubuo ng mga tool na ito ang agwat sa pagitan ng lokal na development at production deployment para sa AI workloads.

### AZD Extensions for AI

Gumagamit ang AZD ng extension system para magdagdag ng AI-specific na kakayahan. I-install at i-manage ang mga extension gamit ang:

```bash
# Ilista ang lahat ng magagamit na extension (kabilang ang AI)
azd extension list

# Suriin ang mga detalye ng naka-install na extension
azd extension show azure.ai.agents

# I-install ang extension na Foundry Agents
azd extension install azure.ai.agents

# I-install ang extension para sa fine-tuning
azd extension install azure.ai.finetune

# I-install ang extension para sa pasadyang mga modelo
azd extension install azure.ai.models

# I-upgrade ang lahat ng naka-install na extension
azd extension upgrade --all
```

**Available AI extensions:**

| Extension | Layunin | Katayuan |
|-----------|---------|--------|
| `azure.ai.agents` | Pamamahala ng Foundry Agent Service | Preview |
| `azure.ai.skills` | Reusable agent skills | Preview |
| `azure.ai.connections` | Foundry connections (data sources, tools) | Preview |
| `azure.ai.finetune` | Foundry model fine-tuning | Preview |
| `azure.ai.models` | Foundry custom models | Preview |
| `azure.coding-agent` | Coding agent configuration | Available |

> Ang `azure.ai.agents` extension ay mabilis na umuunlad. Ang kursong ito ay na-validate laban sa `0.1.40-preview`. Patakbuhin ang `azd extension upgrade --all` upang kunin ang pinakabagong command set, at `azd extension show azure.ai.agents` upang kumpirmahin ang naka-install mong bersyon.

**Ano ang mga mas bagong `skills` at `connections` extensions?**

Lumabas ang dalawang preview extension kasabay ng agent tooling at sulit na maintindihan kahit bilang nagsisimula:

- **`azure.ai.skills`** — Ang isang **skill** ay isang reusable na kakayahan (isang naka-package na tool o pag-uugali) na maaari mong ikabit sa isa o higit pang mga agent sa halip na muling i-implementa ito sa bawat pagkakataon. Isipin ito bilang isang shared building block: idefine ang isang "search the docs" o "look up an order" skill nang isang beses, pagkatapos ay gamitin muli ito sa iba't ibang agents. Pinananatili nitong pare-pareho ang multi-agent systems (Kabanata 5) at iniiwasan ang copy-paste.
- **`azure.ai.connections`** — Ang isang **connection** ay isang managed link mula sa iyong Foundry project papunta sa isang external resource na kailangan ng iyong mga agent—isang data source (tulad ng Azure AI Search), isang tool endpoint, o ibang serbisyo. Pinag-iisa ng Connections kung saan at paano ina-access ng mga agent ang data, kaya't ang credentials at mga endpoint ay nasa isang pinamamahalaang lugar sa halip na nakakalat sa code.

Hindi mo kailangan ang mga ito para i-deploy ang iyong unang mga agent—manatili sa `azure.ai.agents` habang nag-aaral. Gumamit ng `skills` kapag napapansin mong paulit-ulit mong dinadoble ang parehong tool sa iba't ibang agent, at `connections` kapag maraming agent ang nagbabahagi ng parehong data source.

### Initializing Agent Projects with `azd ai agent init`

Ang `azd ai agent init` command ay nagsasayos ng isang production-ready na AI agent project na naka-integrate sa Microsoft Foundry Agent Service:

```bash
# I-initialize ang bagong proyekto ng ahente mula sa manifest ng ahente
azd ai agent init -m <manifest-path-or-uri>

# I-initialize at i-target ang isang partikular na proyekto ng Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# I-initialize gamit ang pasadyang direktoryo ng pinagmulan
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# I-target ang Container Apps bilang host
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Key flags:**

| Flag | Description |
|------|-------------|
| `-m, --manifest` | Path o URI sa isang agent manifest na idadagdag sa iyong proyekto |
| `-p, --project-id` | Existing Microsoft Foundry Project ID para sa iyong azd environment |
| `-s, --src` | Directory upang i-download ang agent definition (default sa `src/<agent-id>`) |
| `--host` | I-override ang default host (hal., `containerapp`) |
| `-e, --environment` | Ang azd environment na gagamitin |

**Production tip**: Gamitin ang `--project-id` upang direktang kumonekta sa isang existing Foundry project, na pinananatiling naka-link ang iyong agent code at cloud resources mula pa sa simula.

### Managing the Agent Lifecycle

Lampas sa `init`, nagbibigay ang `azure.ai.agents` extension ng mga command para sa buong lifecycle ng isang hosted agent—pagsusuri, ebalwasyon, pag-optimize, at pag-retire nito:

```bash
# Patakbuhin ang na-deploy na ahente at tingnan ang oras ng tugon ng server
# (kabuuang pagkaantala at oras hanggang unang byte)
azd ai agent invoke

# Ipakita ang live na konfigurasyon ng endpoint bago baguhin ito
azd ai agent endpoint show

# Gumawa ng dataset ng pagsusuri para sa ahente
azd ai agent eval generate --dataset ./eval/dataset.jsonl

# I-optimize ang mga tagubilin ng ahente batay sa iyong datos ng pagsusuri
# (nangangailangan ng optimization_model sa proyekto ng ahente)
azd ai agent optimize

# I-download ang na-deploy na source ng hosted agent na nakabase sa code
# (na may beripikasyon ng SHA-256)
azd ai agent code download

# Tanggalin ang isang hosted agent at lahat ng mga bersyon nito
# (tinatapos ng --force ang mga aktibong session)
azd ai agent delete --force
```

**Lifecycle at a glance:**

| Stage | Command | Production use |
|-------|---------|----------------|
| Test | `azd ai agent invoke` | I-validate ang mga response at sukatin ang latency bago ilabas |
| Inspect | `azd ai agent endpoint show` | Suriin ang endpoint auth/config; makita nang maaga ang mga breaking changes |
| Measure | `azd ai agent eval generate` | Bumuo ng repeatable evaluation set mula sa real traces |
| Improve | `azd ai agent optimize` | I-tune ang mga instruction laban sa nasukat na kalidad |
| Recover | `azd ai agent code download` | Kunin ang eksaktong deployed source para sa audit/rollback |
| Retire | `azd ai agent delete --force` | I-tear down ang isang agent at ang mga bersyon nito nang malinis |

> Ito ay mga preview command at maaaring magbago sa pagitan ng mga release ng extension. Patakbuhin ang `azd ai agent --help` upang makita ang eksaktong subcommands na available sa iyong naka-install na bersyon.

### Model Context Protocol (MCP) with `azd mcp`
AZD includes built-in MCP server support (Alpha), enabling AI agents and tools to interact with your Azure resources through a standardized protocol:

```bash
# Simulan ang MCP server para sa iyong proyekto
azd mcp start

# Suriin ang kasalukuyang mga patakaran ng Copilot tungkol sa pahintulot para sa pagpapatakbo ng mga tool
azd copilot consent list
```

Inilalantad ng MCP server ang konteksto ng iyong azd project—mga environment, serbisyo, at mga Azure resource—sa mga AI-powered development tool. Ito ay nagpapahintulot ng:

- **AI-assisted deployment**: Payagang mag-query ng estado ng iyong proyekto at i-trigger ang mga deployment ng mga coding agent
- **Resource discovery**: Maaaring tuklasin ng mga AI tool kung anong mga Azure resource ang ginagamit ng iyong proyekto
- **Environment management**: Maaaring lumipat ang mga agent sa pagitan ng dev/staging/production environments

### Infrastructure Generation with `azd infra generate`

Para sa production AI workloads, maaari mong i-generate at i-customize ang Infrastructure as Code sa halip na umasa sa awtomatikong provisioning:

```bash
# Gumawa ng mga Bicep/Terraform file mula sa definisyon ng iyong proyekto
azd infra generate
```

Isinusulat nito ang IaC sa disk kaya maaari mong:
- Suriin at i-audit ang imprastruktura bago mag-deploy
- Magdagdag ng pasadyang mga patakaran sa seguridad (network rules, private endpoints)
- Isama sa umiiral na mga proseso ng pag-review ng IaC
- I-version control ang mga pagbabago sa imprastruktura hiwalay sa application code

### Production Lifecycle Hooks

Pinahihintulutan ka ng AZD hooks na mag-inject ng pasadyang lohika sa bawat yugto ng deployment lifecycle—kritikal para sa production AI workflows:

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
# Patakbuhin nang manu-mano ang isang partikular na hook habang nagde-develop.
azd hooks run predeploy
```

**Inirerekomendang mga production hook para sa AI workloads:**

| Hook | Gamit |
|------|----------|
| `preprovision` | I-validate ang mga quota ng subscription para sa kapasidad ng AI model |
| `postprovision` | I-configure ang private endpoints, i-deploy ang mga timbang ng modelo |
| `predeploy` | Patakbuhin ang mga AI safety test, i-validate ang mga prompt template |
| `postdeploy` | Magsagawa ng smoke test sa mga tugon ng agent, i-verify ang konektividad ng modelo |

### CI/CD Pipeline Configuration

Gamitin ang `azd pipeline config` para i-connect ang iyong proyekto sa GitHub Actions o Azure Pipelines na may secure na Azure authentication:

```bash
# I-configure ang pipeline ng CI/CD (interaktibo)
azd pipeline config

# I-configure gamit ang isang tiyak na provider
azd pipeline config --provider github
```

Ang utos na ito:
- Lumilikha ng service principal na may least-privilege access
- Nagko-configure ng federated credentials (walang naka-imbak na secrets)
- Nagge-generate o nag-a-update ng iyong pipeline definition file
- Itinatakda ang kinakailangang environment variables sa iyong CI/CD system

#### Hakbang-hakbang: ang iyong unang GitHub Actions pipeline

Narito ang buong walkthrough mula sa gumaganang azd project hanggang sa awtomatikong mga deployment sa bawat push.

**1. Make sure your project is on GitHub**

```bash
git init
git add .
git commit -m "Initial azd project"
gh repo create my-ai-app --private --source=. --push
```

**2. Run pipeline config**

```bash
azd pipeline config --provider github
```

ang azd ay, nang interactive:
- Magtatanong kung alin ang Azure subscription at environment na target
- Gumagawa ng Entra **app registration + service principal** para sa pipeline
- Nagtatakda ng **federated credentials (OIDC)**—kaya ang GitHub ay magpa-aauthenticate sa Azure gamit ang short-lived tokens at **walang secrets ang iniimbak**
- Ipupush ang kinakailangang **variables** sa iyong GitHub repo (`AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`, `AZURE_ENV_NAME`, `AZURE_LOCATION`)

**3. Unawain ang na-generate na workflow**

azd adds `.github/workflows/azure-dev.yml`. The key parts look like this:

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

**4. Beripikahin na gumagana ito**

```bash
# I-push ang isang pagbabago para mapagana ang pipeline.
git commit -am "Trigger pipeline" --allow-empty
git push
```

Buksan ang **Actions** tab sa iyong GitHub repo at panoorin ang workflow na awtomatikong nagpapatakbo ng `azd provision` at `azd deploy`.

> **Bakit mahalaga ang federated credentials:** Ang mga lumang pipeline ay nag-iimbak ng client secret sa GitHub. Inaalis ng OIDC federated credentials ang secret na iyon nang buo—humihiling ang GitHub ng short-lived token sa runtime, na mas secure at walang kailangang i-rotate o i-leak. Ito ang default na isinetup ng `azd pipeline config`.

> **Secrets vs. variables:** Ang mga non-sensitive identifier (`AZURE_CLIENT_ID`, etc.) ay inilalagay sa repo **variables**. Kung talagang kailangan ng iyong app ng secret sa build time, idagdag ito bilang GitHub **secret** at i-reference gamit ang `${{ secrets.NAME }}`—ngunit mas mainam ang Key Vault + managed identity sa runtime (tingnan ang [Chapter 3](../chapter-03-configuration/authsecurity.md)).

**Production workflow with pipeline config:**

```bash
# 1. I-set up ang production environment
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. I-configure ang pipeline
azd pipeline config --provider github

# 3. Ang pipeline ay nagpapatakbo ng azd deploy sa bawat push sa main
```

#### Hakbang-hakbang: Azure DevOps Pipelines

Mas gusto ang Azure DevOps kaysa sa GitHub Actions? Sinusuportahan ito ng azd nang nakapaloob gamit ang `azdo` provider. Halos magkakapareho ang daloy—nagge-generate ang azd ng pipeline file, gumagawa ng service connection, at inaayos ang authentication.

**1. Make sure you have an Azure DevOps project**

Kailangan mo ng isang organization at isang project sa `https://dev.azure.com/<your-org>`. Gumawa ng Personal Access Token (PAT) na may **Build (Read & execute)**, **Code (Read & write)**, at **Service Connections (Read, query & manage)** scopes—magtatanong ang azd para dito.

**2. Configure the pipeline**

```bash
azd pipeline config --provider azdo
```

ang azd ay:
- Magtatanong para sa iyong Azure DevOps organization at project
- Gumagawa (o gagamit muli) ng **service connection** papunta sa Azure gamit ang service principal
- Ina-configure ang **workload identity federation (OIDC)** kaya walang client secret ang iniimbak
- Nagko-commit ng `azure-dev.yml` pipeline definition sa iyong repo

**3. Suriin ang na-generate na `azure-dev.yml`**

azd writes a pipeline that provisions and deploys on every push to `main`:

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

**4. Saan nanggagaling ang mga variable**

azd stores the environment values (`AZURE_ENV_NAME`, `AZURE_LOCATION`, `AZURE_SUBSCRIPTION_ID`) as a **variable group** in Azure DevOps so the pipeline can read them. Maaari mong tingnan at i-edit ang mga ito sa ilalim ng **Pipelines → Library**.

> **Parehong benepisyo ng OIDC gaya ng sa GitHub:** Ina-configure din ng `azdo` provider ang workload identity federation bilang default, kaya walang client secret na naka-imbak sa service connection—nagpapalitan ang Azure DevOps ng short-lived token sa runtime. I-pass ang `--auth-type client-credentials` lamang kung hindi pa makakagamit ng OIDC ang iyong organization.

**5. Patakbuhin ito**

```bash
git commit -am "Add Azure DevOps pipeline" --allow-empty
git push
```

Buksan ang **Pipelines** sa Azure DevOps para panoorin ang pagpapatakbo ng `azd provision` at `azd deploy`.

### Adding Components with `azd add`

Dagdagan nang paunti-unti ang mga Azure service sa umiiral na proyekto:

```bash
# Magdagdag ng bagong bahagi ng serbisyo nang interaktibo
azd add
```

Labis itong kapaki-pakinabang para sa pagpapalawak ng production AI applications—halimbawa, pagdagdag ng vector search service, bagong agent endpoint, o isang monitoring component sa umiiral na deployment.

## Karagdagang Mga Mapagkukunan

- **Azure Well-Architected Framework**: [Patnubay para sa AI workload](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [Opisyal na dokumentasyon](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure channel](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 open agent skills para sa Azure AI, Foundry, deployment, pag-optimize ng gastos, at diagnostics. I-install sa iyong editor:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Pag-navigate ng Kabanata:**
- **📚 Pangunahing Pahina ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 8 - Mga Pattern para sa Produksyon at Enterprise
- **⬅️ Nakaraang Kabanata**: [Kabanata 7: Pag-troubleshoot](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Kaugnay din**: [AI Workshop Lab](ai-workshop-lab.md)
- **� Kumpletong Kurso**: [AZD For Beginners](../../README.md)

**Tandaan**: Ang mga production AI workload ay nangangailangan ng maingat na pagpaplano, pagmamanman, at tuloy-tuloy na pag-optimize. Magsimula sa mga pattern na ito at iakma ang mga ito sa iyong partikular na mga kinakailangan.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->