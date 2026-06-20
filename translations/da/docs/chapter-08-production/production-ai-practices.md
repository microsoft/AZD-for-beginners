# Bedste praksis for produktions-AI-arbejdsbelastninger med AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD for begyndere](../../README.md)
- **📖 Current Chapter**: Kapitel 8 - Produktions- og virksomhedsmønstre
- **⬅️ Previous Chapter**: [Kapitel 7: Fejlfinding](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Also Related**: [AI Workshop-lab](ai-workshop-lab.md)
- **🎯 Course Complete**: [AZD for begyndere](../../README.md)

## Oversigt

Denne guide giver omfattende bedste praksisser for udrulning af produktionsklare AI-arbejdsbelastninger ved hjælp af Azure Developer CLI (AZD). Baseret på feedback fra Microsoft Foundry Discord-fællesskabet og virkelige kunders udrulninger adresserer disse fremgangsmåder de mest almindelige udfordringer i produktions-AI-systemer.

## Vigtigste udfordringer der adresseres

Baseret på vores fællesskabsafstemning er dette de største udfordringer udviklere står overfor:

- **45%** har problemer med AI-udrulninger med flere tjenester
- **38%** har problemer med legitimations- og hemmelighedshåndtering  
- **35%** finder produktionsparathed og skalering vanskeligt
- **32%** har brug for bedre omkostningsoptimeringsstrategier
- **29%** kræver forbedret overvågning og fejlfinding

## Arkitekturmønstre til produktions-AI

### Pattern 1: Microservices AI Architecture

**When to use**: Komplekse AI-applikationer med flere kapabiliteter

```mermaid
graph TD
    Frontend[Webfrontend] --- Gateway[API-gateway] --- LB[Loadbalancer]
    Gateway --> Chat[Chatservice]
    Gateway --> Image[Billedservice]
    Gateway --> Text[Tekstservice]
    Chat --> OpenAI[Microsoft Foundry-modeller]
    Image --> Vision[Computersyn]
    Text --> DocIntel[Dokumentintelligens]
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

**When to use**: Batch-behandling, dokumentanalyse, asynkrone arbejdsflows

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

## Overvejelse af AI-agenters sundhed

Når en traditionel webapp går ned, er symptomerne velkendte: en side indlæses ikke, et API returnerer en fejl, eller en udrulning fejler. AI-drevne applikationer kan gå i stykker på alle de samme måder—men de kan også opføre sig forkert på mere subtile måder, der ikke giver åbenlyse fejlmeddelelser.

Denne sektion hjælper dig med at opbygge en mental model for overvågning af AI-arbejdsbelastninger, så du ved, hvor du skal kigge, når tingene ikke ser rigtige ud.

### Hvordan agents sundhed adskiller sig fra traditionel app-sundhed

En traditionel app virker enten eller ikke. En AI-agent kan se ud til at fungere, men producere dårlige resultater. Tænk på agents sundhed i to lag:

| Layer | What to Watch | Where to Look |
|-------|--------------|---------------|
| **Infrastructure health** | Kører tjenesten? Er ressourcer provisioneret? Er endpoints tilgængelige? | `azd monitor`, Azure Portal resource health, container/app logs |
| **Behavior health** | Reagerer agenten præcist? Er svarene rettidige? Kaldes modellen korrekt? | Application Insights traces, model call latency metrics, response quality logs |

Infrastructure health er velkendt—det er det samme for enhver azd-app. Behavior health er det nye lag, som AI-arbejdsbelastninger introducerer.

### Hvor du skal kigge, når AI-apps ikke opfører sig som forventet

Hvis din AI-applikation ikke producerer de forventede resultater, er her en konceptuel tjekliste:

1. **Start med det grundlæggende.** Kører appen? Kan den nå sine afhængigheder? Tjek `azd monitor` og resource health ligesom du ville for enhver app.
2. **Kontroller modelforbindelsen.** Kalder din applikation med succes AI-modellen? Mislykkede eller tidsudløbne modelopkald er den mest almindelige årsag til AI-app-problemer og vil vises i dine applikationslogs.
3. **Se på, hvad modellen modtog.** AI-svar afhænger af input (prompten og eventuel hentet kontekst). Hvis output er forkert, er input som regel forkert. Tjek om din applikation sender de rigtige data til modellen.
4. **Gennemgå svartid.** AI-modelopkald er langsommere end typiske API-opkald. Hvis din app føles langsom, så tjek om modelresponstider er steget—det kan indikere throttling, kapacitetsgrænser eller regionsniveau-kongestion.
5. **Hold øje med omkostningssignaler.** Uventede stigninger i tokenbrug eller API-opkald kan indikere en loop, en forkert konfigureret prompt eller overdrevne retries.

Du behøver ikke mestre observability-værktøjer med det samme. Den vigtigste pointe er, at AI-applikationer har et ekstra lag af adfærd, der skal overvåges, og azd's indbyggede overvågning (`azd monitor`) giver dig et udgangspunkt for at undersøge begge lag.

---

## Sikkerheds bedste praksisser

### 1. Zero-Trust sikkerhedsmodel

**Implementeringsstrategi**:
- Ingen service-til-service-kommunikation uden autentifikation
- Alle API-opkald bruger managed identities
- Netværksisolation med private endpoints
- Adgangskontrol med mindst privilegium

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

### 2. Sikker hemmelighedshåndtering

**Key Vault-integrationsmønster**:

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

### 3. Netværkssikkerhed

**Private Endpoint-konfiguration**:

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

## Ydeevne og skalering

### 1. Auto-skalering strategier

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

### 2. Caching-strategier

**Redis Cache til AI-responser**:

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

### 3. Load Balancing og trafikstyring

**Application Gateway med WAF**:

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

## 💰 Omkostningsoptimering

### 1. Rette ressourcestørrelser

**Environment-specifikke konfigurationer**:

```bash
# Udviklingsmiljø
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Produktionsmiljø
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Omkostningsovervågning og budgetter

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

### 3. Tokenbrug-optimering

**OpenAI omkostningsstyring**:

```typescript
// Tokenoptimering på applikationsniveau
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Forkort konteksten, ikke brugerinput
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Omtrentlig vurdering: 1 token ≈ 4 tegn
    return Math.ceil(text.length / 4);
  }
}
```

## Overvågning og observability

### 1. Omfattende Application Insights

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

### 2. AI-specifik overvågning

**Tilpassede dashboards for AI-målepunkter**:

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

### 3. Health checks og oppetidsmonitorering

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

## Katastrofeberedskab og høj tilgængelighed

### 1. Multi-region udrulning

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

### 2. Data-backup og recovery

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

## DevOps og CI/CD-integration

### 1. GitHub Actions workflow

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

### 2. Infrastrukturvalidering

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Kontroller, at alle krævede tjenester kører
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Valider OpenAI-modeludrulninger
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# Test forbindelsen til AI-tjenesten
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Produktionsparathed tjekliste

### Sikkerhed ✅
- [ ] Alle services bruger managed identities
- [ ] Secrets gemt i Key Vault
- [ ] Private endpoints konfigureret
- [ ] Network security groups implementeret
- [ ] RBAC med mindst privilegium
- [ ] WAF aktiveret på offentlige endpoints

### Ydeevne ✅
- [ ] Auto-skalering konfigureret
- [ ] Caching implementeret
- [ ] Load balancing opsat
- [ ] CDN til statisk indhold
- [ ] Database connection pooling
- [ ] Tokenbrug optimeret

### Overvågning ✅
- [ ] Application Insights konfigureret
- [ ] Tilpassede målepunkter defineret
- [ ] Alert-regler opsat
- [ ] Dashboard oprettet
- [ ] Health checks implementeret
- [ ] Log retention-politikker

### Pålidelighed ✅
- [ ] Multi-region udrulning
- [ ] Backup- og recovery-plan
- [ ] Circuit breakers implementeret
- [ ] Retry-politikker konfigureret
- [ ] Graceful degradation
- [ ] Health check endpoints

### Omkostningsstyring ✅
- [ ] Budgetalarmer konfigureret
- [ ] Ressourcer rettet til korrekt størrelse
- [ ] Dev/test-rabat anvendt
- [ ] Reserved instances købt
- [ ] Omkostningsmonitoreringsdashboard
- [ ] Regelmæssige omkostningsgennemgange

### Compliance ✅
- [ ] Dataresidenskrav opfyldt
- [ ] Audit-logging aktiveret
- [ ] Compliance-politikker anvendt
- [ ] Sikkerhedsbaselines implementeret
- [ ] Regelmæssige sikkerhedsvurderinger
- [ ] Incident response-plan

## Ydeevne benchmarks

### Typiske produktionsmålepunkter

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
# Script til belastningstest af AI-applikationer
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Fællesskabets bedste praksisser

Baseret på feedback fra Microsoft Foundry Discord-fællesskabet:

### Top anbefalinger fra fællesskabet:

1. **Start småt, skaler gradvist**: Begynd med grundlæggende SKUs og skaler op baseret på faktisk brug
2. **Overvåg alt**: Opsæt omfattende overvågning fra dag ét
3. **Automatiser sikkerhed**: Brug infrastructure as code for konsekvent sikkerhed
4. **Test grundigt**: Inkluder AI-specifik test i din pipeline
5. **Planlæg for omkostninger**: Overvåg tokenbrug og sæt budgetalarmer tidligt

### Almindelige faldgruber at undgå:

- ❌ Hardcoding af API-nøgler i kode
- ❌ Manglende opsætning af korrekt overvågning
- ❌ Ignorering af omkostningsoptimering
- ❌ Ikke at teste fejlsituationer
- ❌ Udrulning uden health checks

## AZD AI CLI-kommandoer og udvidelser

AZD inkluderer et voksende sæt AI-specifikke kommandoer og udvidelser, der strømliner produktions-AI-workflows. Disse værktøjer bygger bro mellem lokal udvikling og produktionsudrulning for AI-arbejdsbelastninger.

### AZD-udvidelser til AI

AZD bruger et udvidelsessystem til at tilføje AI-specifikke kapabiliteter. Installer og administrer udvidelser med:

```bash
# Vis alle tilgængelige udvidelser (inklusive AI)
azd extension list

# Vis detaljer om installerede udvidelser
azd extension show azure.ai.agents

# Installer Foundry Agents-udvidelsen
azd extension install azure.ai.agents

# Installer finjusteringsudvidelsen
azd extension install azure.ai.finetune

# Installer udvidelsen til brugerdefinerede modeller
azd extension install azure.ai.models

# Opgrader alle installerede udvidelser
azd extension upgrade --all
```

**Tilgængelige AI-udvidelser:**

| Extension | Purpose | Status |
|-----------|---------|--------|
| `azure.ai.agents` | Foundry Agent Service management | Preview |
| `azure.ai.skills` | Reusable agent skills | Preview |
| `azure.ai.connections` | Foundry connections (data sources, tools) | Preview |
| `azure.ai.finetune` | Foundry model fine-tuning | Preview |
| `azure.ai.models` | Foundry custom models | Preview |
| `azure.coding-agent` | Coding agent configuration | Available |

> `azure.ai.agents`-udvidelsen udvikler sig hurtigt. Dette kursus er valideret mod `0.1.40-preview`. Kør `azd extension upgrade --all` for at hente det nyeste sæt kommandoer, og `azd extension show azure.ai.agents` for at bekræfte din installerede version.

**Hvad er de nyere `skills` og `connections`-udvidelser?**

To preview-udvidelser dukkede op sideløbende med agent-værktøjerne og er værd at forstå, selv som nybegynder:

- **`azure.ai.skills`** — Et **skill** er en genanvendelig kapabilitet (et pakketeret værktøj eller adfærd), du kan tilknytte til en eller flere agenter i stedet for at genimplementere den hver gang. Tænk på det som en delt byggeklods: definer f.eks. en "søg i dokumentationen" eller "slå en ordre op" skill én gang, og genbrug den på tværs af agenter. Dette holder multi-agent-systemer (Kapitel 5) konsistente og undgår copy-paste.
- **`azure.ai.connections`** — En **connection** er et administreret link fra dit Foundry-projekt til en ekstern ressource, dine agenter behøver—en datakilde (som Azure AI Search), et tool-endpoint eller en anden service. Connections centraliserer *hvor* og *hvordan* agenter får adgang til data, så legitimationsoplysninger og endpoints lever ét styret sted i stedet for spredt i koden.

Du behøver ikke disse for at udrulle dine første agenter—bliv ved med `azure.ai.agents` mens du lærer. Brug `skills`, når du oplever, at du duplicerer det samme værktøj på tværs af agenter, og `connections`, når flere agenter deler den samme datakilde.

### Initialisering af agentprojekter med `azd ai agent init`

Kommandoen `azd ai agent init` scaffold'er et produktionsklart AI-agentprojekt, integreret med Microsoft Foundry Agent Service:

```bash
# Initialiser et nyt agentprojekt ud fra et agentmanifest
azd ai agent init -m <manifest-path-or-uri>

# Initialiser og målret et specifikt Foundry-projekt
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Initialiser med en brugerdefineret kildemappe
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Målret Container Apps som vært
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Vigtige flags:**

| Flag | Description |
|------|-------------|
| `-m, --manifest` | Path or URI to an agent manifest to add to your project |
| `-p, --project-id` | Existing Microsoft Foundry Project ID for your azd environment |
| `-s, --src` | Directory to download the agent definition (defaults to `src/<agent-id>`) |
| `--host` | Override the default host (e.g., `containerapp`) |
| `-e, --environment` | The azd environment to use |

**Produktionstips**: Brug `--project-id` for at forbinde direkte til et eksisterende Foundry-projekt, så din agentkode og cloud-ressourcer er linket fra starten.

### Håndtering af agentens livscyklus

Udover `init` tilbyder `azure.ai.agents`-udvidelsen kommandoer til hele livscyklussen for en hostet agent—test, evaluering, optimering og pensionering:

```bash
# Kald en udrullet agent og se serverens svartidsmålinger
# (samlet latenstid og tid til første byte)
azd ai agent invoke

# Vis den live endpoint-konfiguration, før du ændrer den
azd ai agent endpoint show

# Generér et evalueringsdatasæt for agenten
azd ai agent eval generate --dataset ./eval/dataset.jsonl

# Optimer agentinstruktioner i forhold til dine evalueringsdata
# (kræver en optimization_model i agentprojektet)
azd ai agent optimize

# Download den udrullede kildekode for en kodebaseret hostet agent
# (med SHA-256-verifikation)
azd ai agent code download

# Slet en hostet agent og alle dens versioner
# (--force afslutter aktive sessioner)
azd ai agent delete --force
```

**Livscyklus oversigt:**

| Stage | Command | Production use |
|-------|---------|----------------|
| Test | `azd ai agent invoke` | Validate responses and measure latency before release |
| Inspect | `azd ai agent endpoint show` | Review endpoint auth/config; spot breaking changes early |
| Measure | `azd ai agent eval generate` | Build a repeatable evaluation set from real traces |
| Improve | `azd ai agent optimize` | Tune instructions against measured quality |
| Recover | `azd ai agent code download` | Retrieve the exact deployed source for audit/rollback |
| Retire | `azd ai agent delete --force` | Tear down an agent and its versions cleanly |

> Dette er preview-kommandoer og kan ændre sig mellem udgivelsessektioner af udvidelsen. Kør `azd ai agent --help` for at se de nøjagtige underkommandoer, der er tilgængelige i din installerede version.

### Model Context Protocol (MCP) med `azd mcp`
AZD inkluderer indbygget MCP-serverunderstøttelse (Alpha), så AI-agenter og -værktøjer kan interagere med dine Azure-ressourcer gennem en standardiseret protokol:

```bash
# Start MCP-serveren for dit projekt
azd mcp start

# Gennemgå de nuværende Copilot-samtykkeregler for udførelse af værktøjer
azd copilot consent list
```

MCP-serveren eksponerer din azd-projektkontekst—miljøer, services og Azure-ressourcer—for AI-drevne udviklingsværktøjer. Dette muliggør:

- **AI-assisteret udrulning**: Lad kodeagenter forespørge dit projektstatus og udløse udrulninger
- **Ressourceopdagelse**: AI-værktøjer kan opdage, hvilke Azure-ressourcer dit projekt bruger
- **Miljøstyring**: Agenter kan skifte mellem dev/staging/production-miljøer

### Infrastrukturgenerering med `azd infra generate`

For produktions-AI-workloads kan du generere og tilpasse Infrastructure as Code i stedet for at stole på automatisk provisioning:

```bash
# Generer Bicep/Terraform-filer ud fra din projektdefinition
azd infra generate
```

Dette skriver IaC til disken, så du kan:
- Gennemgå og revidere infrastrukturen, før du sætter den i drift
- Tilføje brugerdefinerede sikkerhedspolitikker (netværksregler, private endpoints)
- Integrere med eksisterende IaC-gennemgangsprocesser
- Versionsstyring af infrastrukturændringer adskilt fra applikationskoden

### Produktionslivscyklus-hooks

AZD-hooks giver dig mulighed for at indsætte brugerdefineret logik i alle faser af udrulningslivscyklussen—kritisk for produktions-AI-workflows:

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
# Kør et specifikt hook manuelt under udvikling
azd hooks run predeploy
```

**Anbefalede produktions-hooks til AI-workloads:**

| Hook | Brugstilfælde |
|------|---------------|
| `preprovision` | Validér abonnementskvoter for AI-modelkapacitet |
| `postprovision` | Konfigurer private endpoints, udrul modelvægte |
| `predeploy` | Kør AI-sikkerhedstests, valider prompt-skabeloner |
| `postdeploy` | Kør smoke-tests af agentrespons, verificer modelforbindelse |

### CI/CD-pipelinekonfiguration

Brug `azd pipeline config` til at forbinde dit projekt til GitHub Actions eller Azure Pipelines med sikker Azure-autentificering:

```bash
# Konfigurer CI/CD-pipeline (interaktiv)
azd pipeline config

# Konfigurer med en specifik udbyder
azd pipeline config --provider github
```

Denne kommando:
- Opretter en serviceprincipal med mindst-privilegieret adgang
- Konfigurerer federerede legitimationsoplysninger (ingen gemte secrets)
- Genererer eller opdaterer din pipeline-definitionsfil
- Sætter nødvendige miljøvariabler i dit CI/CD-system

#### Trin for trin: din første GitHub Actions-pipeline

Her er den komplette gennemgang fra et fungerende azd-projekt til automatiserede udrulninger ved hvert push.

**1. Sørg for, at dit projekt er på GitHub**

```bash
git init
git add .
git commit -m "Initial azd project"
gh repo create my-ai-app --private --source=. --push
```

**2. Kør pipeline config**

```bash
azd pipeline config --provider github
```

azd vil interaktivt:
- Spørge, hvilket Azure-abonnement og miljø der skal målrettes
- Oprette en Entra **app-registrering + serviceprincipal** til pipelinen
- Opsætte **federerede legitimationsoplysninger (OIDC)**—så GitHub autentificerer til Azure med kortlivede tokens og **ingen secrets gemmes**
- Push de nødvendige **variabler** til dit GitHub-repo (`AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`, `AZURE_ENV_NAME`, `AZURE_LOCATION`)

**3. Forstå den genererede workflow**

azd tilføjer `.github/workflows/azure-dev.yml`. De væsentlige dele ser sådan ud:

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

**4. Bekræft, at det virker**

```bash
# Push en ændring for at udløse pipelinen
git commit -am "Trigger pipeline" --allow-empty
git push
```

Åbn fanen **Actions** i dit GitHub-repo og se workflowet køre `azd provision` og `azd deploy` automatisk.

> **Hvorfor federerede legitimationsoplysninger betyder noget:** ældre pipelines gemte en klientsecret i GitHub. OIDC-federerede legitimationsoplysninger fjerner den secret helt—GitHub anmoder om et kortlivet token ved runtime, hvilket både er mere sikkert og intet der skal roteres eller kan lække. Dette er standardopsætningen `azd pipeline config` laver.

> **Secrets vs. variables:** ikke-følsomme identifikatorer (`AZURE_CLIENT_ID`, osv.) skal ligge i repoets **variables**. Hvis din app virkelig har brug for en secret ved build-tid, tilføj den som en GitHub **secret** og referér til den med `${{ secrets.NAME }}`—men foretræk Key Vault + managed identity ved runtime (se [Kapitel 3](../chapter-03-configuration/authsecurity.md)).

**Produktionsworkflow med pipeline config:**

```bash
# 1. Opsæt produktionsmiljø
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Konfigurer pipelinen
azd pipeline config --provider github

# 3. Pipeline kører azd deploy ved hvert push til main
```

#### Trin for trin: Azure DevOps Pipelines

Foretrækker du Azure DevOps frem for GitHub Actions? azd understøtter det indbygget med `azdo`-provideren. Forløbet er næsten identisk—azd genererer pipeline-filen, opretter en serviceforbindelse og sætter autentificeringen op.

**1. Sørg for, at du har et Azure DevOps-projekt**

Du skal have en organisation og et projekt på `https://dev.azure.com/<your-org>`. Generér en Personal Access Token (PAT) med scopes **Build (Read & execute)**, **Code (Read & write)** og **Service Connections (Read, query & manage)**—azd vil bede dig om den.

**2. Konfigurer pipelinen**

```bash
azd pipeline config --provider azdo
```

azd vil:
- Spørge efter din Azure DevOps-organisation og -projekt
- Oprette (eller genbruge) en **serviceforbindelse** til Azure ved hjælp af en serviceprincipal
- Konfigurere **workload identity federation (OIDC)** så ingen klientsecret gemmes
- Committe en `azure-dev.yml` pipeline-definition til dit repo

**3. Gennemgå den genererede `azure-dev.yml`**

azd skriver en pipeline, der provisionerer og deployer ved hvert push til `main`:

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

**4. Hvor variablerne kommer fra**

azd gemmer miljøværdierne (`AZURE_ENV_NAME`, `AZURE_LOCATION`, `AZURE_SUBSCRIPTION_ID`) som en **variable group** i Azure DevOps, så pipelinen kan læse dem. Du kan se og redigere dem under **Pipelines → Library**.

> **Samme OIDC-fordel som GitHub:** `azdo`-provideren konfigurerer også workload identity federation som standard, så der ikke gemmes nogen klientsecret i serviceforbindelsen—Azure DevOps udveksler et kortlivet token ved runtime. Angiv `--auth-type client-credentials` kun hvis din organisation endnu ikke kan bruge OIDC.

**5. Kør den**

```bash
git commit -am "Add Azure DevOps pipeline" --allow-empty
git push
```

Åbn **Pipelines** i Azure DevOps for at se `azd provision` og `azd deploy` køre.

### Tilføjelse af komponenter med `azd add`

Tilføj løbende Azure-tjenester til et eksisterende projekt:

```bash
# Tilføj en ny servicekomponent interaktivt
azd add
```

Dette er især nyttigt til at udvide produktions-AI-applikationer—for eksempel tilføje en vektorsøgetjeneste, en ny agent-endpoint eller en overvågningskomponent til en eksisterende udrulning.

## Yderligere ressourcer

- **Azure Well-Architected Framework**: [Vejledning til AI-workloads](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [Officiel dokumentation](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Azure-eksempler](https://github.com/Azure-Samples)
- **Discord Community**: [#Azure-kanal](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure på skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 åbne agent-færdigheder til Azure AI, Foundry, deployment, omkostningsoptimering og diagnostik. Installér i din editor:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 8 - Produktion & Enterprise-mønstre
- **⬅️ Forrige kapitel**: [Kapitel 7: Fejlfinding](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Også relateret**: [AI Workshop Lab](ai-workshop-lab.md)
- **� Kursus fuldført**: [AZD For Beginners](../../README.md)

**Husk**: Produktions-AI-workloads kræver omhyggelig planlægning, overvågning og løbende optimering. Start med disse mønstre og tilpas dem til dine specifikke krav.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->