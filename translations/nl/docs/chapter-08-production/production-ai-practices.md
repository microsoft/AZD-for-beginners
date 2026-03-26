# Beste praktijken voor productie-AI-workloads met AZD

**Chapter Navigation:**
- **📚 Cursus Start**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 8 - Productie- & Enterprise-patronen
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 7: Problemen oplossen](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Ook gerelateerd**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Cursus Voltooid**: [AZD Voor Beginners](../../README.md)

## Overzicht

Deze gids biedt uitgebreide beste praktijken voor het implementeren van productieklare AI-workloads met behulp van Azure Developer CLI (AZD). Op basis van feedback van de Microsoft Foundry Discord-community en implementaties bij klanten in de praktijk, behandelen deze praktijken de meest voorkomende uitdagingen in productie-AI-systemen.

## Belangrijkste aangepakte uitdagingen

Op basis van onze communitypoll zijn dit de belangrijkste uitdagingen waarmee ontwikkelaars te maken hebben:

- **45%** worstelt met multi-service AI-implementaties
- **38%** heeft problemen met credential- en secretbeheer  
- **35%** vindt productieklaarheid en schalen moeilijk
- **32%** heeft betere kostenoptimalisatiestrategieën nodig
- **29%** vereist verbeterde monitoring en probleemoplossing

## Architectuurpatronen voor productie-AI

### Patroon 1: Microservices AI-architectuur

**Wanneer te gebruiken**: Complexe AI-toepassingen met meerdere mogelijkheden

```mermaid
graph TD
    Frontend[Webfrontend] --- Gateway[API-gateway] --- LB[Loadbalancer]
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

### Patroon 2: Evenementgestuurde AI-verwerking

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

Wanneer een traditionele webapplicatie faalt, zijn de symptomen herkenbaar: een pagina laadt niet, een API geeft een fout terug of een deployment faalt. AI-aangedreven applicaties kunnen op al die manieren falen—maar ze kunnen ook subtieler verkeerd functioneren zonder duidelijke foutmeldingen.

Deze sectie helpt je een mentaal model op te bouwen voor het monitoren van AI-workloads, zodat je weet waar je moet kijken wanneer dingen niet goed lijken te werken.

### Hoe agentgezondheid verschilt van traditionele appgezondheid

Een traditionele app werkt of werkt niet. Een AI-agent kan lijken te werken maar slechte resultaten opleveren. Beschouw agentgezondheid als twee lagen:

| Laag | Waar op te letten | Waar te zoeken |
|-------|--------------|---------------|
| **Infrastructuurgezondheid** | Draait de service? Zijn resources toegewezen? Zijn endpoints bereikbaar? | `azd monitor`, Azure Portal resource health, container/app logs |
| **Gedragsgezondheid** | Reageert de agent nauwkeurig? Zijn reacties tijdig? Wordt het model correct aangeroepen? | Application Insights-traces, latentie-metrieken voor modelaanroepen, logs voor responskwaliteit |

Infrastructuurgezondheid is bekend—het is hetzelfde voor elke azd-app. Gedragsgezondheid is de nieuwe laag die AI-workloads introduceren.

### Waar te zoeken wanneer AI-apps zich niet gedragen zoals verwacht

Als je AI-toepassing niet de verwachte resultaten oplevert, is hier een conceptuele checklist:

1. **Begin met de basis.** Draait de app? Kan deze zijn afhankelijkheden bereiken? Controleer `azd monitor` en resource health zoals je dat voor elke app zou doen.
2. **Controleer de modelverbinding.** Roept je toepassing het AI-model succesvol aan? Mislukte of verlopen modelaanroepen zijn de meest voorkomende oorzaak van AI-appproblemen en verschijnen in je applicatielogs.
3. **Bekijk wat het model ontving.** AI-antwoorden zijn afhankelijk van de input (de prompt en eventuele opgehaalde context). Als de output onjuist is, is de input meestal verkeerd. Controleer of je applicatie de juiste gegevens naar het model stuurt.
4. **Bekijk de responstijd.** Modelaanroepen zijn langzamer dan typische API-aanroepen. Als je app traag aanvoelt, controleer dan of de responstijden van het model zijn toegenomen — dit kan wijzen op throttling, capaciteitslimieten of congestie op regiovlak.
5. **Let op kostenindicatoren.** Onverwachte pieken in tokengebruik of API-aanroepen kunnen wijzen op een lus, een verkeerd geconfigureerde prompt of overmatige retries.

Je hoeft niet meteen alle observability-tools te beheersen. De kernboodschap is dat AI-applicaties een extra laag gedrag hebben om te monitoren, en azd's ingebouwde monitoring (`azd monitor`) geeft je een startpunt om beide lagen te onderzoeken.

---

## Beste beveiligingspraktijken

### 1. Zero-Trust beveiligingsmodel

**Implementatiestrategie**:
- Geen service-to-service communicatie zonder authenticatie
- Alle API-aanroepen gebruiken managed identities
- Netwerkisolatie met private endpoints
- Least privilege toegangscontroles

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

### 2. Veilg geheimenbeheer

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

**Private Endpoint-configuratie**:

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

## Prestaties en schalen

### 1. Auto-scalingstrategieën

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

### 2. Cachingstrategieën

**Redis Cache voor AI-reacties**:

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

### 3. Load balancing en verkeersbeheer

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

### 1. Resource right-sizing

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

### 2. Kostenmonitoring en budgetten

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

### 3. Tokengebruik optimaliseren

**OpenAI-kostenbeheer**:

```typescript
// Tokenoptimalisatie op applicatieniveau
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Verkort de context, niet de gebruikersinvoer
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Ruime schatting: 1 token ≈ 4 tekens
    return Math.ceil(text.length / 4);
  }
}
```

## Monitoring en observeerbaarheid

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

### 3. Health checks en uptime-monitoring

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

## Noodherstel en hoge beschikbaarheid

### 1. Multi-region deployment

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

### 2. Data-back-up en herstel

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

## DevOps- en CI/CD-integratie

### 1. GitHub Actions-workflow

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

### 2. Infrastructuurvalidatie

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Controleer of alle vereiste services draaien
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Valideer OpenAI-modelimplementaties
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# Test de connectiviteit van de AI-service
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Checklist voor productieklaarheid

### Beveiliging ✅
- [ ] Alle services gebruiken managed identities
- [ ] Geheimen opgeslagen in Key Vault
- [ ] Private endpoints geconfigureerd
- [ ] Network security groups geïmplementeerd
- [ ] RBAC met least privilege
- [ ] WAF ingeschakeld op publieke endpoints

### Prestaties ✅
- [ ] Auto-scaling geconfigureerd
- [ ] Caching geïmplementeerd
- [ ] Load balancing ingesteld
- [ ] CDN voor statische content
- [ ] Database connection pooling
- [ ] Tokengebruik geoptimaliseerd

### Monitoring ✅
- [ ] Application Insights geconfigureerd
- [ ] Aangepaste metrieken gedefinieerd
- [ ] Alertregels ingesteld
- [ ] Dashboard gemaakt
- [ ] Health checks geïmplementeerd
- [ ] Logretentiebeleid

### Betrouwbaarheid ✅
- [ ] Multi-region deployment
- [ ] Back-up- en herstelplan
- [ ] Circuit breakers geïmplementeerd
- [ ] Retry-beleid geconfigureerd
- [ ] Gracieuze degradatie
- [ ] Health check endpoints

### Kostenbeheer ✅
- [ ] Budget-waarschuwingen geconfigureerd
- [ ] Resource right-sizing
- [ ] Dev/test-kortingen toegepast
- [ ] Reserved instances aangeschaft
- [ ] Kostenmonitoring-dashboard
- [ ] Regelmatige kostenreviews

### Compliance ✅
- [ ] Vereisten voor dataresidency nageleefd
- [ ] Auditlogging ingeschakeld
- [ ] Compliancebeleid toegepast
- [ ] Security baselines geïmplementeerd
- [ ] Regelmatige beveiligingsassessments
- [ ] Incident response-plan

## Prestatiebenchmarks

### Typische productiemetrieken

| Metriek | Doel | Monitoring |
|--------|--------|------------|
| **Responstijd** | < 2 seconden | Application Insights |
| **Beschikbaarheid** | 99.9% | Uptime-monitoring |
| **Foutpercentage** | < 0.1% | Applicatielogs |
| **Tokengebruik** | < $500/month | Kostenbeheer |
| **Gelijktijdige gebruikers** | 1000+ | Loadtesting |
| **Hersteltijd** | < 1 hour | Disaster recovery-tests |

### Loadtesten

```bash
# Script voor loadtesten van AI-toepassingen
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Beste praktijken uit de community

Op basis van feedback uit de Microsoft Foundry Discord-community:

### Topaanbevelingen uit de community:

1. **Begin klein, schaal geleidelijk**: Begin met basale SKUs en schaal op basis van daadwerkelijk gebruik
2. **Monitor alles**: Zet vanaf dag één uitgebreide monitoring op
3. **Automatiseer beveiliging**: Gebruik infrastructure-as-code voor consistente beveiliging
4. **Test grondig**: Neem AI-specifieke tests op in je pipeline
5. **Plan voor kosten**: Monitor tokengebruik en stel vroeg budgetwaarschuwingen in

### Veelvoorkomende valkuilen om te vermijden:

- ❌ API-sleutels in code hardcoderen
- ❌ Geen juiste monitoring instellen
- ❌ Kostenoptimalisatie negeren
- ❌ Faalscenario's niet testen
- ❌ Deployen zonder health checks

## AZD AI CLI-commando's en extensies

AZD bevat een groeiende set AI-specifieke commando's en extensies die productie-AI-workflows stroomlijnen. Deze tools overbruggen de kloof tussen lokale ontwikkeling en productie-implementatie voor AI-workloads.

### AZD-extensies voor AI

AZD gebruikt een extensiesysteem om AI-specifieke mogelijkheden toe te voegen. Installeer en beheer extensies met:

```bash
# Lijst alle beschikbare extensies (inclusief AI)
azd extension list

# Installeer de Foundry Agents-extensie
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
| `azure.ai.agents` | Foundry Agent Service-beheer | Preview |
| `azure.ai.finetune` | Foundry-model fine-tuning | Preview |
| `azure.ai.models` | Foundry aangepaste modellen | Preview |
| `azure.coding-agent` | Configuratie van coding-agent | Available |

### Agentprojecten initialiseren met `azd ai agent init`

Het `azd ai agent init`-commando scaffoldt een productieklare AI-agentproject die geïntegreerd is met Microsoft Foundry Agent Service:

```bash
# Initialiseer een nieuw agentproject op basis van een agentmanifest
azd ai agent init -m <manifest-path-or-uri>

# Initialiseer en selecteer een specifiek Foundry-project als doel
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Initialiseer met een aangepaste bronmap
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Selecteer Container Apps als host
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

**Productietip**: Gebruik `--project-id` om direct verbinding te maken met een bestaand Foundry-project, zodat je agentcode en cloudresources vanaf het begin gekoppeld blijven.

### Model Context Protocol (MCP) met `azd mcp`

AZD bevat ingebouwde MCP-serverondersteuning (Alpha), waarmee AI-agents en tools via een gestandaardiseerd protocol met je Azure-resources kunnen interageren:

```bash
# Start de MCP-server voor je project
azd mcp start

# Beheer toestemmingen van tools voor MCP-bewerkingen
azd mcp consent
```

De MCP-server stelt je azd-projectcontext bloot—omgevingen, services en Azure-resources—aan AI-aangedreven developmenttools. Dit maakt het mogelijk om:

- **AI-geassisteerde deployment**: Laat coding-agents je projectstatus opvragen en deployments triggeren
- **Resource-discovery**: AI-tools kunnen ontdekken welke Azure-resources je project gebruikt
- **Omgevingsbeheer**: Agents kunnen schakelen tussen dev/staging/production-omgevingen

### Infrastructuurgeneratie met `azd infra generate`

Voor productie-AI-workloads kun je Infrastructure as Code genereren en aanpassen in plaats van te vertrouwen op automatische provisioning:

```bash
# Genereer Bicep/Terraform-bestanden op basis van je projectdefinitie
azd infra generate
```

Dit schrijft IaC naar schijf zodat je kunt:
- Infrastructuur beoordelen en auditen voordat je deployt
- Aangepaste beveiligingsregels toevoegen (netwerkregels, private endpoints)
- Integreren met bestaande IaC-reviewprocessen
- Infrastructuurwijzigingen apart van applicatiecode versioneren

### Productie lifecycle-hooks

AZD-hooks laten je aangepaste logica injecteren in elke fase van de deployment-levenscyclus—kritisch voor productie-AI-workflows:

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

| Hook | Gebruikscase |
|------|----------|
| `preprovision` | Valideer abonnementquota voor AI-modelcapaciteit |
| `postprovision` | Configureer private endpoints, deploy modelweights |
| `predeploy` | Voer AI-veiligheidstests uit, valideer prompt-templates |
| `postdeploy` | Smoke-test agentantwoorden, verifieer modelconnectiviteit |

### CI/CD-pijplijnconfiguratie

Gebruik `azd pipeline config` om je project te koppelen aan GitHub Actions of Azure Pipelines met veilige Azure-authenticatie:

```bash
# Configureer CI/CD-pijplijn (interactief)
azd pipeline config

# Configureer met een specifieke provider
azd pipeline config --provider github
```

Dit commando:
- Creëert een serviceprincipal met least-privilege-toegang
- Configureert federated credentials (geen opgeslagen secrets)
- Genereert of werkt je pijplijnconfiguratiebestand bij
- Stelt vereiste omgevingsvariabelen in in je CI/CD-systeem

**Productieworkflow met pipelineconfiguratie:**

```bash
# 1. Productieomgeving opzetten
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Configureer de pipeline
azd pipeline config --provider github

# 3. Pipeline voert azd deploy uit bij elke push naar main
```

### Componenten toevoegen met `azd add`

Voeg geleidelijk Azure-services toe aan een bestaand project:

```bash
# Voeg interactief een nieuwe servicecomponent toe
azd add
```

Dit is bijzonder nuttig voor het uitbreiden van productie-AI-toepassingen—bijvoorbeeld het toevoegen van een vector search-service, een nieuw agentendpoint of een monitoringcomponent aan een bestaande implementatie.

## Aanvullende bronnen
- **Azure Well-Architected Framework**: [Richtlijnen voor AI-workloads](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [Officiële documentatie](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure-kanaal](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 open agentvaardigheden voor Azure AI, Foundry, implementatie, kostenoptimalisatie en diagnostiek. Installeer in je editor:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Hoofdstuknavigatie:**
- **📚 Cursusstart**: [AZD For Beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 8 - Productie- en bedrijfspatronen
- **⬅️ Vorig hoofdstuk**: [Hoofdstuk 7: Problemen oplossen](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Ook gerelateerd**: [AI Workshop Lab](ai-workshop-lab.md)
- **� Cursus voltooid**: [AZD For Beginners](../../README.md)

**Onthoud**: Productie-AI-workloads vereisen zorgvuldige planning, bewaking en doorlopende optimalisatie. Begin met deze patronen en pas ze aan jouw specifieke vereisten aan.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->