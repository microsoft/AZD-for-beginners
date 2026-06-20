# Productie AI Workload Beste Praktijken met AZD

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 8 - Productie- & Enterprise-patronen
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Ook Gerelateerd**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Cursus Voltooid**: [AZD voor Beginners](../../README.md)

## Overzicht

Deze gids biedt uitgebreide beste praktijken voor het inzetten van productieklare AI-workloads met de Azure Developer CLI (AZD). Gebaseerd op feedback van de Microsoft Foundry Discord-community en implementaties bij klanten in de praktijk, behandelen deze praktijken de meest voorkomende uitdagingen in productie-AI-systemen.

## Belangrijkste Uitdagingen die Aangepakt Worden

Gebaseerd op de resultaten van onze community-enquête, zijn dit de grootste uitdagingen voor ontwikkelaars:

- **45%** heeft moeite met multi-service AI-implementaties
- **38%** heeft problemen met credential- en geheimbeheer  
- **35%** vindt productierijpheid en schaling moeilijk
- **32%** heeft behoefte aan betere kostenoptimalisatiestrategieën
- **29%** heeft verbeterde monitoring en probleemoplossing nodig

## Architectuurpatronen voor Productie-AI

### Patroon 1: Microservices AI Architectuur

**Wanneer te gebruiken**: Complexe AI-toepassingen met meerdere mogelijkheden

```mermaid
graph TD
    Frontend[Web-frontend] --- Gateway[API-gateway] --- LB[Loadbalancer]
    Gateway --> Chat[Chatservice]
    Gateway --> Image[Afbeeldingsservice]
    Gateway --> Text[Tekstservice]
    Chat --> OpenAI[Microsoft Foundry-modellen]
    Image --> Vision[Computervisie]
    Text --> DocIntel[Documentintelligentie]
```

**AZD-implementatie**:

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

### Patroon 2: Event-Driven AI-verwerking

**Wanneer te gebruiken**: Batchverwerking, documentanalyse, asynchrone workflows

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

## Nadenken over de gezondheid van AI-agents

Wanneer een traditionele webapplicatie faalt, zijn de symptomen bekend: een pagina laadt niet, een API geeft een fout terug, of een deployment faalt. Door AI aangedreven applicaties kunnen op al die manieren falen—maar ze kunnen ook subtieler verkeerd functioneren zonder duidelijke foutmeldingen.

Deze sectie helpt je een mentaal model op te bouwen voor het monitoren van AI-workloads, zodat je weet waar je moet kijken als dingen niet goed lijken te gaan.

### Hoe agentgezondheid verschilt van gezondheid van traditionele apps

Een traditionele app werkt of werkt niet. Een AI-agent kan lijken te werken maar slechte resultaten opleveren. Zie agentgezondheid in twee lagen:

| Laag | Wat te controleren | Waar te kijken |
|-------|--------------|---------------|
| **Infrastructuurgezondheid** | Draait de service? Zijn resources geprovisioned? Zijn eindpunten bereikbaar? | `azd monitor`, Azure Portal resource health, container/app logs |
| **Gedragsgezondheid** | Reageert de agent accuraat? Zijn reacties tijdig? Wordt het model correct aangeroepen? | Application Insights traces, model call latency metrics, response quality logs |

Infrastructuurgezondheid is vertrouwd—het is hetzelfde voor elke azd-app. Gedragsgezondheid is de nieuwe laag die AI-workloads introduceren.

### Waar te kijken wanneer AI-apps zich onverwacht gedragen

Als je AI-toepassing niet de verwachte resultaten oplevert, is hier een conceptuele checklist:

1. **Begin met de basis.** Draait de app? Kan deze zijn afhankelijkheden bereiken? Controleer `azd monitor` en resource health zoals je dat voor elke app zou doen.
2. **Controleer de modelverbinding.** Roept je applicatie het AI-model succesvol aan? Mislukte of time-out modelaanroepen zijn de meest voorkomende oorzaak van AI-app problemen en verschijnen in je applicatielogs.
3. **Bekijk wat het model heeft ontvangen.** AI-antwoorden hangen af van de input (de prompt en eventuele opgehaalde context). Als de output verkeerd is, is de input vaak verkeerd. Controleer of je applicatie de juiste gegevens naar het model stuurt.
4. **Controleer de reactietijd.** AI-modelaanroepen zijn trager dan typische API-aanroepen. Als je app traag aanvoelt, controleer dan of de model-responstijden zijn toegenomen—dit kan wijzen op throttling, capaciteitstekorten of congestie op regiogebied.
5. **Let op kostenindicatoren.** Onverwachte pieken in tokengebruik of API-aanroepen kunnen wijzen op een loop, een verkeerd geconfigureerde prompt of teveel retries.

Je hoeft niet meteen een observability-expert te zijn. De belangrijkste conclusie is dat AI-applicaties een extra laag van gedrag hebben om te monitoren, en azd's ingebouwde monitoring (`azd monitor`) geeft je een startpunt om beide lagen te onderzoeken.

---

## Beste praktijken voor beveiliging

### 1. Zero-Trust beveiligingsmodel

**Implementatiestrategie**:
- Geen service-tot-service communicatie zonder authenticatie
- Alle API-aanroepen gebruiken beheerde identiteiten
- Netwerkisolatie met private eindpunten
- Toegangscontrole met minimaal benodigde rechten

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

### 2. Veilig geheimbeheer

**Key Vault-integratiepatroon**:

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

### 3. Netwerkbeveiliging

**Private-eindpuntconfiguratie**:

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

## Prestaties en Schaling

### 1. Auto-Scaling Strategieën

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

### 2. Caching Strategieën

**Redis Cache voor AI-responses**:

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

### 3. Load Balancing en Verkeersbeheer

**Application Gateway met WAF**:

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

## 💰 Kostenoptimalisatie

### 1. Resource Right-Sizing

**Omgevingsspecifieke configuraties**:

```bash
# Ontwikkelomgeving
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Productieomgeving
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Kostenmonitoring en Budgetten

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

### 3. Tokengebruikoptimalisatie

**OpenAI kostenbeheer**:

```typescript
// Tokenoptimalisatie op applicatieniveau
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Beperk de context, niet de gebruikersinvoer
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Ruwe schatting: 1 token ≈ 4 tekens
    return Math.ceil(text.length / 4);
  }
}
```

## Monitoring en Observeerbaarheid

### 1. Uitgebreide Application Insights

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

### 2. AI-specifieke monitoring

**Aangepaste dashboards voor AI-metrieken**:

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

### 3. Health Checks en Uptime Monitoring

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

## Noodherstel en Hoge Beschikbaarheid

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

### 2. Data Backup en Recovery

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

## DevOps en CI/CD-integratie

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

### 2. Validatie van infrastructuur

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Controleren of alle vereiste diensten draaien
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Valideren van OpenAI-modelimplementaties
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# Testen van AI-serviceconnectiviteit
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Checklist voor productieklaarheid

### Beveiliging ✅
- [ ] Alle services gebruiken beheerde identiteiten
- [ ] Geheimen opgeslagen in Key Vault
- [ ] Private eindpunten geconfigureerd
- [ ] Network Security Groups geïmplementeerd
- [ ] RBAC met minimaal benodigde rechten
- [ ] WAF ingeschakeld op openbare eindpunten

### Prestaties ✅
- [ ] Auto-scaling geconfigureerd
- [ ] Caching geïmplementeerd
- [ ] Load balancing ingesteld
- [ ] CDN voor statische content
- [ ] Verbindingspooling voor databases
- [ ] Tokengebruik geoptimaliseerd

### Monitoring ✅
- [ ] Application Insights geconfigureerd
- [ ] Aangepaste metrics gedefinieerd
- [ ] Alarmregels ingesteld
- [ ] Dashboard gemaakt
- [ ] Health checks geïmplementeerd
- [ ] Logretentiebeleid

### Betrouwbaarheid ✅
- [ ] Multi-region deployment
- [ ] Backup- en recoveryplan
- [ ] Circuit breakers geïmplementeerd
- [ ] Retry-beleid geconfigureerd
- [ ] Graceful degradation
- [ ] Health check-eindpunten

### Kostenbeheer ✅
- [ ] Budgetalerts geconfigureerd
- [ ] Resource right-sizing
- [ ] Dev/test-kortingen toegepast
- [ ] Reserved instances aangeschaft
- [ ] Kostenmonitoring-dashboard
- [ ] Regelmatige kostenreviews

### Compliance ✅
- [ ] Vereisten omtrent dataresidency nageleefd
- [ ] Auditlogging ingeschakeld
- [ ] Compliancebeleid toegepast
- [ ] Beveiligingsbaselines geïmplementeerd
- [ ] Regelmatige beveiligingsbeoordelingen
- [ ] Incidentresponsplan

## Prestatiebenchmarks

### Typische productiemetrieken

| Metriek | Doel | Monitoring |
|--------|--------|------------|
| **Reactietijd** | < 2 seconden | Application Insights |
| **Beschikbaarheid** | 99.9% | Uptime monitoring |
| **Foutpercentage** | < 0.1% | Applicatielogs |
| **Tokengebruik** | < $500/month | Kostenbeheer |
| **Gelijktijdige gebruikers** | 1000+ | Load testing |
| **Hersteltijd** | < 1 uur | Noodhersteltests |

### Loadtesting

```bash
# Script voor loadtesten van AI-toepassingen
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Community beste praktijken

Gebaseerd op feedback uit de Microsoft Foundry Discord-community:

### Belangrijkste aanbevelingen uit de community:

1. **Begin klein, schaal geleidelijk**: Begin met basis-SKU's en schakel op op basis van daadwerkelijk gebruik
2. **Monitor alles**: Zet vanaf dag één uitgebreide monitoring op
3. **Automatiseer beveiliging**: Gebruik infrastructure as code voor consistente beveiliging
4. **Test grondig**: Neem AI-specifieke tests op in je pipeline
5. **Plan voor kosten**: Monitor tokengebruik en stel vroeg budgetalerts in

### Veelvoorkomende valkuilen om te vermijden:

- ❌ API-sleutels hardcoden in de code
- ❌ Geen juiste monitoring opzetten
- ❌ Kostenoptimalisatie negeren
- ❌ Falingssituaties niet testen
- ❌ Implementeren zonder health checks

## AZD AI CLI-commando's en extensies

AZD bevat een groeiende set AI-specifieke commando's en extensies die productie-AI-workflows stroomlijnen. Deze tools overbruggen de kloof tussen lokale ontwikkeling en productie-implementatie voor AI-workloads.

### AZD-extensies voor AI

AZD gebruikt een extensiesysteem om AI-specifieke mogelijkheden toe te voegen. Installeer en beheer extensies met:

```bash
# Lijst alle beschikbare extensies (inclusief AI)
azd extension list

# Inspecteer details van geïnstalleerde extensies
azd extension show azure.ai.agents

# Installeer de Foundry agents-extensie
azd extension install azure.ai.agents

# Installeer de fine-tuning-extensie
azd extension install azure.ai.finetune

# Installeer de extensie voor aangepaste modellen
azd extension install azure.ai.models

# Werk alle geïnstalleerde extensies bij
azd extension upgrade --all
```

**Beschikbare AI-extensies:**

| Extensie | Doel | Status |
|-----------|---------|--------|
| `azure.ai.agents` | Beheer van Foundry Agent Service | Preview |
| `azure.ai.skills` | Herbruikbare agentvaardigheden | Preview |
| `azure.ai.connections` | Foundry-verbindingen (datasources, tools) | Preview |
| `azure.ai.finetune` | Foundry model fine-tuning | Preview |
| `azure.ai.models` | Foundry aangepaste modellen | Preview |
| `azure.coding-agent` | Coding agent configuratie | Available |

> De `azure.ai.agents` extensie evolueert snel. Deze cursus is gevalideerd tegen `0.1.40-preview`. Voer `azd extension upgrade --all` uit om de nieuwste set commando's op te halen, en `azd extension show azure.ai.agents` om de geïnstalleerde versie te bevestigen.

**Wat zijn de nieuwere `skills` en `connections` extensies?**

Twee preview-extensies verschenen naast de agent-tooling en zijn het waard om te begrijpen, zelfs als beginner:

- **`azure.ai.skills`** — Een **skill** is een herbruikbare capaciteit (een verpakt hulpmiddel of gedrag) die je aan één of meerdere agents kunt koppelen in plaats van het elke keer opnieuw te implementeren. Zie het als een gedeelde bouwsteen: definieer één keer een "zoek de docs" of "zoek een bestelling op" skill en hergebruik deze vervolgens over agents heen. Dit houdt multi-agent systemen (Hoofdstuk 5) consistent en voorkomt copy-paste.
- **`azure.ai.connections`** — Een **connection** is een beheerde koppeling van je Foundry-project naar een externe resource die je agents nodig hebben—een datasource (zoals Azure AI Search), een tool-eindpunt of een andere service. Connections centraliseren *waar* en *hoe* agents data benaderen, zodat credentials en eindpunten op één beheerde plek leven in plaats van verspreid door de code.

Je hebt deze niet nodig om je eerste agents te deployen—houd het bij `azure.ai.agents` terwijl je leert. Pak `skills` erbij wanneer je merkt dat je hetzelfde hulpmiddel in meerdere agents dupliceert, en `connections` wanneer meerdere agents dezelfde datasource delen.

### Initialiseren van agentprojecten met `azd ai agent init`

Het `azd ai agent init` commando scaffoldt een productie-klaar AI-agentproject geïntegreerd met Microsoft Foundry Agent Service:

```bash
# Initialiseer een nieuw agent-project vanuit een agent-manifest
azd ai agent init -m <manifest-path-or-uri>

# Initialiseer en richt op een specifiek Foundry-project
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Initialiseer met een aangepaste bronmap
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Gebruik Container Apps als host
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Belangrijke flags:**

| Flag | Beschrijving |
|------|-------------|
| `-m, --manifest` | Pad of URI naar een agentmanifest om aan je project toe te voegen |
| `-p, --project-id` | Bestaande Microsoft Foundry Project ID voor je azd-omgeving |
| `-s, --src` | Directory om de agentdefinitie te downloaden (standaard `src/<agent-id>`) |
| `--host` | Overschrijf de standaard host (bijv. `containerapp`) |
| `-e, --environment` | De azd-omgeving die gebruikt moet worden |

**Productietip**: Gebruik `--project-id` om direct te koppelen aan een bestaand Foundry-project, zodat je agentcode en cloudresources vanaf het begin gekoppeld zijn.

### Beheren van de agentlevenscyclus

Naast `init` biedt de `azure.ai.agents` extensie commando's voor de volledige levenscyclus van een gehoste agent—testen, evalueren, optimaliseren en uitfaseren:

```bash
# Roep een geïmplementeerde agent aan en bekijk de responstijden van de server
# (totale latentie en tijd tot de eerste byte)
azd ai agent invoke

# Toon de configuratie van het live-eindpunt voordat u deze wijzigt
azd ai agent endpoint show

# Genereer een evaluatiedataset voor de agent
azd ai agent eval generate --dataset ./eval/dataset.jsonl

# Optimaliseer agentinstructies op basis van uw evaluatiegegevens
# (vereist een optimization_model in het agentproject)
azd ai agent optimize

# Download de geïmplementeerde bron van een op code gebaseerde gehoste agent
# (met SHA-256-verificatie)
azd ai agent code download

# Verwijder een gehoste agent en al zijn versies
# (--force beëindigt actieve sessies)
azd ai agent delete --force
```

**Levenscyclus in één oogopslag:**

| Fase | Commando | Gebruik in productie |
|-------|---------|----------------|
| Test | `azd ai agent invoke` | Valideer responses en meet latency vóór release |
| Inspect | `azd ai agent endpoint show` | Bekijk endpoint auth/config; spot breaking changes vroeg |
| Measure | `azd ai agent eval generate` | Bouw een herhaalbare evaluatieset uit echte traces |
| Improve | `azd ai agent optimize` | Stem instructies af op gemeten kwaliteit |
| Recover | `azd ai agent code download` | Haal de exact gedeployde broncode op voor audit/rollback |
| Retire | `azd ai agent delete --force` | Verwijder een agent en zijn versies netjes |

> Dit zijn preview-commando's en kunnen veranderen tussen extensie-releases. Voer `azd ai agent --help` uit om de exacte subcommando's te zien die in jouw geïnstalleerde versie beschikbaar zijn.

### Model Context Protocol (MCP) met `azd mcp`
AZD bevat ingebouwde MCP-serverondersteuning (Alpha), waarmee AI-agenten en -hulpmiddelen via een gestandaardiseerd protocol met uw Azure-resources kunnen communiceren:

```bash
# Start de MCP-server voor je project
azd mcp start

# Bekijk de huidige Copilot-toestemmingsregels voor het uitvoeren van tools
azd copilot consent list
```

De MCP-server maakt de azd-projectcontext—omgevingen, services en Azure-resources—beschikbaar voor AI-gestuurde ontwikkelhulpmiddelen. Dit maakt het mogelijk:

- **AI-assisted deployment**: Laat codeeragenten uw projectstatus opvragen en implementaties starten
- **Resource discovery**: AI-hulpmiddelen kunnen ontdekken welke Azure-resources uw project gebruikt
- **Environment management**: Agenten kunnen schakelen tussen dev/staging/productie-omgevingen

### Infrastructuurgeneratie met `azd infra generate`

Voor productie-AI-workloads kunt u Infrastructure as Code genereren en aanpassen in plaats van te vertrouwen op automatische provisioning:

```bash
# Genereer Bicep- en Terraform-bestanden op basis van je projectdefinitie
azd infra generate
```

Dit schrijft IaC naar schijf zodat u kunt:
- Infrastructuur beoordelen en auditen voordat u deze implementeert
- Aangepaste beveiligingsbeleid toevoegen (netwerkregels, private endpoints)
- Integreren met bestaande IaC-reviewprocessen
- Versiebeheer van infrastructuurwijzigingen apart van applicatiecode

### Lifecycle-hooks voor productie

AZD-hooks stellen u in staat aangepaste logica in te voegen in elke fase van de implementatielevenscyclus—kritisch voor productie-AI-workflows:

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
# Voer een specifieke hook handmatig uit tijdens de ontwikkeling
azd hooks run predeploy
```

**Aanbevolen productiehooks voor AI-workloads:**

| Hook | Use Case |
|------|----------|
| `preprovision` | Valideer abonnementsquotums voor AI-modelcapaciteit |
| `postprovision` | Configureer private endpoints, implementeer modelgewichten |
| `predeploy` | Voer AI-veiligheidstests uit, valideer prompt-sjablonen |
| `postdeploy` | Smoke-test agentantwoorden, verifieer modelconnectiviteit |

### CI/CD-pijplijnconfiguratie

Gebruik `azd pipeline config` om uw project te koppelen aan GitHub Actions of Azure Pipelines met veilige Azure-authenticatie:

```bash
# Configureer CI/CD-pijplijn (interactief)
azd pipeline config

# Configureer met een specifieke provider
azd pipeline config --provider github
```

Dit commando:
- Maakt een service principal aan met minimaal benodigde machtigingen
- Configureert federated credentials (geen opgeslagen geheimen)
- Genereert of werkt uw pijplijn-definitiebestand bij
- Stelt de vereiste omgevingsvariabelen in uw CI/CD-systeem in

#### Stap-voor-stap: uw eerste GitHub Actions-pijplijn

Hier is de volledige handleiding van een werkend azd-project naar geautomatiseerde implementaties bij elke push.

**1. Zorg dat uw project op GitHub staat**

```bash
git init
git add .
git commit -m "Initial azd project"
gh repo create my-ai-app --private --source=. --push
```

**2. Voer pipeline config uit**

```bash
azd pipeline config --provider github
```

azd zal, interactief:
- Vragen welke Azure-abonnement en omgeving u wilt targeten
- Een Entra **app-registratie + serviceprincipal** voor de pijplijn aanmaken
- **federated credentials (OIDC)** instellen—zodat GitHub met kortdurende tokens naar Azure kan authenticeren en er **geen geheimen worden opgeslagen**
- Plaatst de vereiste **variabelen** in uw GitHub-repo (`AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`, `AZURE_ENV_NAME`, `AZURE_LOCATION`)

**3. Begrijp de gegenereerde workflow**

azd voegt `.github/workflows/azure-dev.yml` toe. De belangrijkste onderdelen zien er als volgt uit:

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

**4. Controleer of het werkt**

```bash
# Push een wijziging om de pipeline te starten
git commit -am "Trigger pipeline" --allow-empty
git push
```

Open het **Actions**-tabblad in uw GitHub-repo en bekijk hoe de workflow automatisch `azd provision` en `azd deploy` uitvoert.

> **Waarom federated credentials belangrijk zijn:** oudere pipelines sloegen een client secret op in GitHub. OIDC federated credentials verwijderen dat geheim volledig—GitHub vraagt een kortdurend token op runtime op, wat niet alleen veiliger is, maar ook betekent dat er niets is om te roteren of te lekken. Dit is de standaardconfiguratie die `azd pipeline config` instelt.

> **Geheimen vs. variabelen:** niet-gevoelige identificatoren (`AZURE_CLIENT_ID`, enz.) gaan in repo-**variabelen**. Als uw app echt een geheim nodig heeft tijdens het builden, voeg het dan toe als een GitHub-**secret** en verwijs ernaar met `${{ secrets.NAME }}`—maar geef de voorkeur aan Key Vault + managed identity tijdens runtime (zie [Hoofdstuk 3](../chapter-03-configuration/authsecurity.md)).

**Productieworkflow met pipeline config:**

```bash
# 1. Productieomgeving opzetten
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Configureer de pipeline
azd pipeline config --provider github

# 3. De pipeline voert azd deploy uit bij elke push naar main
```

#### Stap-voor-stap: Azure DevOps-pijplijnen

Geef je de voorkeur aan Azure DevOps boven GitHub Actions? azd ondersteunt het native met de `azdo`-provider. De flow is bijna identiek—azd genereert het pipelinebestand, maakt een serviceverbinding en regelt de authenticatie.

**1. Zorg dat u een Azure DevOps-project hebt**

U heeft een organisatie en een project nodig op `https://dev.azure.com/<your-org>`. Genereer een Personal Access Token (PAT) met de scopes **Build (Read & execute)**, **Code (Read & write)** en **Service Connections (Read, query & manage)**—azd zal erom vragen.

**2. Configureer de pijplijn**

```bash
azd pipeline config --provider azdo
```

azd zal:
- Vragen om uw Azure DevOps-organisatie en project
- Maken (of hergebruiken) van een **service connection** naar Azure met behulp van een service principal
- Configureren van **workload identity federation (OIDC)** zodat er geen client secret wordt opgeslagen
- Commit een `azure-dev.yml` pipeline-definitie naar uw repo

**3. Bekijk de gegenereerde `azure-dev.yml`**

azd schrijft een pijplijn die provisioning en deployment uitvoert bij elke push naar `main`:

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

**4. Waar de variabelen vandaan komen**

azd slaat de omgevingswaarden (`AZURE_ENV_NAME`, `AZURE_LOCATION`, `AZURE_SUBSCRIPTION_ID`) op als een **variable group** in Azure DevOps zodat de pijplijn ze kan lezen. U kunt ze bekijken en bewerken onder **Pipelines → Library**.

> **Zelfde OIDC-voordeel als GitHub:** de `azdo`-provider configureert ook standaard workload identity federation, dus er wordt geen client secret opgeslagen in de service connection—Azure DevOps wisselt een kortdurend token uit tijdens runtime. Gebruik `--auth-type client-credentials` alleen als uw organisatie OIDC nog niet kan gebruiken.

**5. Voer het uit**

```bash
git commit -am "Add Azure DevOps pipeline" --allow-empty
git push
```

Open **Pipelines** in Azure DevOps om te zien hoe `azd provision` en `azd deploy` worden uitgevoerd.

### Componenten toevoegen met `azd add`

Voeg stapsgewijs Azure-services toe aan een bestaand project:

```bash
# Voeg interactief een nieuwe servicecomponent toe
azd add
```

Dit is bijzonder nuttig voor het uitbreiden van productie-AI-toepassingen—bijvoorbeeld het toevoegen van een vector-zoekservice, een nieuw agent-endpoint of een monitoringcomponent aan een bestaande implementatie.

## Aanvullende bronnen

- **Azure Well-Architected Framework**: [Richtlijnen voor AI-workloads](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [Officiële documentatie](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure-voorbeelden](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure-kanaal](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure op skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 open agent-skills voor Azure AI, Foundry, deployment, kostenoptimalisatie en diagnostiek. Installeer in uw editor:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 8 - Productie- & Enterprise-patronen
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 7: Problemen oplossen](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Ook gerelateerd**: [AI Workshop-lab](ai-workshop-lab.md)
- **� Cursus voltooid**: [AZD Voor Beginners](../../README.md)

**Onthoud**: Productie-AI-workloads vereisen zorgvuldige planning, monitoring en continue optimalisatie. Begin met deze patronen en pas ze aan uw specifieke vereisten aan.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->