# Best practice per carichi di lavoro AI in produzione con AZD

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo Corrente**: Capitolo 8 - Pattern di Produzione & Aziendali
- **⬅️ Capitolo Precedente**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Correlati**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Corso Completo**: [AZD For Beginners](../../README.md)

## Panoramica

Questa guida fornisce best practice complete per distribuire carichi di lavoro AI pronti per la produzione usando Azure Developer CLI (AZD). Basate sul feedback della community Microsoft Foundry su Discord e su implementazioni reali dei clienti, queste pratiche affrontano le sfide più comuni nei sistemi AI di produzione.

## Sfide principali affrontate

Basandoci sui risultati del nostro sondaggio nella community, queste sono le principali difficoltà che gli sviluppatori incontrano:

- **45%** hanno difficoltà con distribuzioni AI multi-servizio
- **38%** hanno problemi con la gestione delle credenziali e dei segreti  
- **35%** trovano difficile la readiness per la produzione e il dimensionamento
- **32%** necessitano di migliori strategie di ottimizzazione dei costi
- **29%** richiedono un miglior monitoraggio e troubleshooting

## Modelli architetturali per AI in produzione

### Pattern 1: Architettura AI a microservizi

**Quando usarlo**: Applicazioni AI complesse con più funzionalità

```mermaid
graph TD
    Frontend[Frontend Web] --- Gateway[Gateway API] --- LB[Bilanciatore di carico]
    Gateway --> Chat[Servizio Chat]
    Gateway --> Image[Servizio Immagini]
    Gateway --> Text[Servizio Testo]
    Chat --> OpenAI[Modelli Microsoft Foundry]
    Image --> Vision[Visione artificiale]
    Text --> DocIntel[Intelligenza dei documenti]
```

**Implementazione AZD**:

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

### Pattern 2: Elaborazione AI guidata da eventi

**Quando usarlo**: Elaborazione batch, analisi documentale, workflow asincroni

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

## Riflessioni sulla salute degli agenti AI

Quando una tipica app web si interrompe, i sintomi sono familiari: una pagina non si carica, un'API restituisce un errore o una distribuzione fallisce. Le applicazioni alimentate da AI possono interrompersi in tutti quei modi—ma possono anche comportarsi in modi più sottili che non producono messaggi di errore evidenti.

Questa sezione ti aiuta a costruire un modello mentale per monitorare i carichi di lavoro AI così saprai dove guardare quando le cose non sembrano corrette.

### Come la salute degli agenti differisce dalla salute delle app tradizionali

Un'app tradizionale o funziona o non funziona. Un agente AI può sembrare funzionare ma produrre risultati scadenti. Considera la salute dell'agente su due livelli:

| Livello | Cosa Monitorare | Dove Cercare |
|-------|--------------|---------------|
| **Salute dell'infrastruttura** | Il servizio è in esecuzione? Le risorse sono provisionate? Gli endpoint sono raggiungibili? | `azd monitor`, Azure Portal resource health, container/app logs |
| **Salute del comportamento** | L'agente risponde in modo accurato? Le risposte sono tempestive? Il modello viene chiamato correttamente? | Application Insights traces, model call latency metrics, response quality logs |

La salute dell'infrastruttura è familiare—è la stessa per qualsiasi app azd. La salute del comportamento è il nuovo livello che introducono i carichi di lavoro AI.

### Dove guardare quando le app AI non si comportano come previsto

Se la tua applicazione AI non produce i risultati che ti aspetti, ecco una checklist concettuale:

1. **Inizia dalle basi.** L'app è in esecuzione? Riesce a raggiungere le sue dipendenze? Controlla `azd monitor` e lo stato delle risorse proprio come faresti per qualsiasi app.
2. **Controlla la connessione al modello.** La tua applicazione sta chiamando correttamente il modello AI? Chiamate al modello fallite o scadute sono la causa più comune di problemi nelle app AI e appariranno nei log dell'applicazione.
3. **Guarda cosa ha ricevuto il modello.** Le risposte AI dipendono dall'input (il prompt e qualsiasi contesto recuperato). Se l'output è sbagliato, di solito l'input è sbagliato. Verifica se la tua applicazione sta inviando i dati corretti al modello.
4. **Revisiona la latenza delle risposte.** Le chiamate ai modelli AI sono più lente delle tipiche chiamate API. Se la tua app sembra lenta, verifica se i tempi di risposta del modello sono aumentati—questo può indicare throttling, limiti di capacità o congestione a livello di regione.
5. **Attenzione ai segnali di costo.** Picchi inaspettati nell'uso di token o nelle chiamate API possono indicare un loop, un prompt mal configurato o retry eccessivi.

Non è necessario padroneggiare subito gli strumenti di osservabilità. Il punto chiave è che le applicazioni AI hanno un livello aggiuntivo di comportamento da monitorare, e il monitoraggio integrato di azd (`azd monitor`) ti offre un punto di partenza per investigare entrambi i livelli.

---

## Best practice di sicurezza

### 1. Modello di sicurezza Zero-Trust

**Strategia di implementazione**:
- Nessuna comunicazione servizio-a-servizio senza autenticazione
- Tutte le chiamate API usano managed identities
- Isolamento di rete con private endpoints
- Controlli di accesso con privilegi minimi

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

### 2. Gestione sicura dei segreti

**Pattern di integrazione con Key Vault**:

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

### 3. Sicurezza di rete

**Configurazione private endpoint**:

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

## Prestazioni e Scalabilità

### 1. Strategie di Auto-Scaling

**Auto-scaling per Container Apps**:

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

### 2. Strategie di Caching

**Redis Cache per risposte AI**:

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

### 3. Bilanciamento del carico e gestione del traffico

**Application Gateway con WAF**:

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

## 💰 Ottimizzazione dei costi

### 1. Dimensionamento corretto delle risorse

**Configurazioni specifiche per ambiente**:

```bash
# Ambiente di sviluppo
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Ambiente di produzione
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Monitoraggio dei costi e budget

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

### 3. Ottimizzazione dell'uso dei token

**Gestione dei costi OpenAI**:

```typescript
// Ottimizzazione dei token a livello applicativo
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Tronca il contesto, non l'input dell'utente
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Stima approssimativa: 1 token ≈ 4 caratteri
    return Math.ceil(text.length / 4);
  }
}
```

## Monitoraggio e Osservabilità

### 1. Application Insights completo

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

### 2. Monitoraggio specifico per AI

**Dashboard personalizzate per metriche AI**:

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

### 3. Health check e monitoraggio dell'uptime

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

## Disaster Recovery e Alta Disponibilità

### 1. Distribuzione multi-regione

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

### 2. Backup e recupero dei dati

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

## DevOps e integrazione CI/CD

### 1. Workflow GitHub Actions

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

### 2. Validazione dell'infrastruttura

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Verifica se tutti i servizi necessari sono in esecuzione
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Convalida le distribuzioni dei modelli OpenAI
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# Testa la connettività del servizio AI
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Lista di controllo per la prontezza alla produzione

### Sicurezza ✅
- [ ] Tutti i servizi usano managed identities
- [ ] I segreti sono archiviati in Key Vault
- [ ] Private endpoints configurati
- [ ] Network security groups implementati
- [ ] RBAC con privilegi minimi
- [ ] WAF abilitato sugli endpoint pubblici

### Prestazioni ✅
- [ ] Auto-scaling configurato
- [ ] Caching implementato
- [ ] Bilanciamento del carico configurato
- [ ] CDN per contenuti statici
- [ ] Pooling delle connessioni al database
- [ ] Ottimizzazione dell'uso dei token

### Monitoraggio ✅
- [ ] Application Insights configurato
- [ ] Metriche personalizzate definite
- [ ] Regole di alert configurate
- [ ] Dashboard creato
- [ ] Health check implementati
- [ ] Politiche di retention dei log

### Affidabilità ✅
- [ ] Distribuzione multi-regione
- [ ] Piano di backup e recupero
- [ ] Circuit breaker implementati
- [ ] Policy di retry configurate
- [ ] Degrado graduale (graceful degradation)
- [ ] Endpoint di health check

### Gestione dei costi ✅
- [ ] Alert sul budget configurati
- [ ] Right-sizing delle risorse
- [ ] Sconti dev/test applicati
- [ ] Reserved instances acquistate
- [ ] Dashboard di monitoraggio dei costi
- [ ] Revisioni periodiche dei costi

### Conformità ✅
- [ ] Requisiti di residenza dei dati soddisfatti
- [ ] Audit logging abilitato
- [ ] Policy di conformità applicate
- [ ] Baseline di sicurezza implementate
- [ ] Valutazioni di sicurezza regolari
- [ ] Piano di risposta agli incidenti

## Benchmark di prestazioni

### Metriche tipiche di produzione

| Metrica | Obiettivo | Monitoraggio |
|--------|--------|------------|
| **Tempo di risposta** | < 2 secondi | Application Insights |
| **Disponibilità** | 99.9% | Uptime monitoring |
| **Tasso di errore** | < 0.1% | Application logs |
| **Uso di token** | < $500/mese | Cost management |
| **Utenti concorrenti** | 1000+ | Load testing |
| **Tempo di recupero** | < 1 ora | Disaster recovery tests |

### Test di carico

```bash
# Script di test di carico per applicazioni AI
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Best practice della community

Basato sul feedback della community Microsoft Foundry su Discord:

### Principali raccomandazioni dalla comunità:

1. **Inizia in piccolo, scala gradualmente**: Parti con SKU di base e scala in base all'uso reale
2. **Monitora tutto**: Configura un monitoraggio completo fin dal primo giorno
3. **Automatizza la sicurezza**: Usa infrastructure as code per una sicurezza coerente
4. **Testa a fondo**: Includi test specifici per l'AI nella tua pipeline
5. **Pianifica i costi**: Monitora l'uso dei token e imposta alert di budget presto

### Errori comuni da evitare:

- ❌ Hardcoding delle chiavi API nel codice
- ❌ Non configurare un monitoraggio adeguato
- ❌ Ignorare l'ottimizzazione dei costi
- ❌ Non testare gli scenari di errore
- ❌ Distribuire senza health check

## Comandi AZD AI CLI ed estensioni

AZD include un set in crescita di comandi e estensioni specifiche per l'AI che snelliscono i workflow AI di produzione. Questi strumenti colmano il divario tra sviluppo locale e distribuzione in produzione per i carichi di lavoro AI.

### Estensioni AZD per l'AI

AZD usa un sistema di estensioni per aggiungere capacità specifiche per l'AI. Installa e gestisci le estensioni con:

```bash
# Elenca tutte le estensioni disponibili (inclusa l'IA)
azd extension list

# Ispeziona i dettagli delle estensioni installate
azd extension show azure.ai.agents

# Installa l'estensione Foundry Agents
azd extension install azure.ai.agents

# Installa l'estensione per il fine-tuning
azd extension install azure.ai.finetune

# Installa l'estensione per modelli personalizzati
azd extension install azure.ai.models

# Aggiorna tutte le estensioni installate
azd extension upgrade --all
```

**Estensioni AI disponibili:**

| Extension | Scopo | Stato |
|-----------|---------|--------|
| `azure.ai.agents` | Gestione del servizio Foundry Agent | Anteprima |
| `azure.ai.skills` | Abilità riutilizzabili per agent | Anteprima |
| `azure.ai.connections` | Connessioni Foundry (sorgenti dati, tool) | Anteprima |
| `azure.ai.finetune` | Fine-tuning modelli Foundry | Anteprima |
| `azure.ai.models` | Modelli personalizzati Foundry | Anteprima |
| `azure.coding-agent` | Configurazione agente di coding | Disponibile |

> L'estensione `azure.ai.agents` evolve rapidamente. Questo corso è validato contro `0.1.40-preview`. Esegui `azd extension upgrade --all` per ottenere l'insieme di comandi più recente, e `azd extension show azure.ai.agents` per confermare la versione installata.

**Cosa sono le nuove estensioni `skills` e `connections`?**

Due estensioni in preview sono apparse insieme agli strumenti per gli agent e vale la pena capirle anche da principiante:

- **`azure.ai.skills`** — Una **skill** è una capacità riutilizzabile (un tool o comportamento impacchettato) che puoi allegare a uno o più agent invece di re-implementarla ogni volta. Pensala come un blocco di costruzione condiviso: definisci una "ricerca nella documentazione" o "ricerca di un ordine" una volta, poi riutilizzala tra gli agent. Questo mantiene i sistemi multi-agente (Capitolo 5) coerenti ed evita copia-incolla.
- **`azure.ai.connections`** — Una **connection** è un collegamento gestito dal tuo progetto Foundry a una risorsa esterna di cui i tuoi agent hanno bisogno—una sorgente dati (come Azure AI Search), un endpoint tool, o un altro servizio. Le connection centralizzano *dove* e *come* gli agent accedono ai dati, così credenziali ed endpoint vivono in un unico posto governato invece che sparsi nel codice.

Non ti servono per distribuire i tuoi primi agent—usa `azure.ai.agents` mentre impari. Passa a `skills` quando ti trovi a duplicare lo stesso tool tra agent, e a `connections` quando più agent condividono la stessa sorgente dati.

### Inizializzare progetti agent con `azd ai agent init`

Il comando `azd ai agent init` scaffolda un progetto agente pronto per la produzione integrato con Microsoft Foundry Agent Service:

```bash
# Inizializza un nuovo progetto agent a partire da un manifest dell'agente
azd ai agent init -m <manifest-path-or-uri>

# Inizializza e imposta come target uno specifico progetto Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Inizializza con una directory di origine personalizzata
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Imposta Container Apps come host
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Flag principali:**

| Flag | Descrizione |
|------|-------------|
| `-m, --manifest` | Path o URI a un manifest dell'agente da aggiungere al tuo progetto |
| `-p, --project-id` | Microsoft Foundry Project ID esistente per il tuo ambiente azd |
| `-s, --src` | Directory in cui scaricare la definizione dell'agente (di default `src/<agent-id>`) |
| `--host` | Sovrascrivi l'host predefinito (es. `containerapp`) |
| `-e, --environment` | L'ambiente azd da utilizzare |

**Suggerimento per la produzione**: Usa `--project-id` per connetterti direttamente a un progetto Foundry esistente, mantenendo il codice dell'agente e le risorse cloud collegate fin dall'inizio.

### Gestire il ciclo di vita dell'agente

Oltre a `init`, l'estensione `azure.ai.agents` fornisce comandi per l'intero ciclo di vita di un agente ospitato—testarlo, valutarlo, ottimizzarlo e ritirarlo:

```bash
# Invocare un agente distribuito e visualizzare i tempi di risposta del server
# (latenza totale e tempo al primo byte)
azd ai agent invoke

# Mostra la configurazione dell'endpoint attivo prima di modificarla
azd ai agent endpoint show

# Genera un dataset di valutazione per l'agente
azd ai agent eval generate --dataset ./eval/dataset.jsonl

# Ottimizza le istruzioni dell'agente in base ai tuoi dati di valutazione
# (richiede un optimization_model nel progetto dell'agente)
azd ai agent optimize

# Scarica la sorgente distribuita di un agente ospitato basato su codice
# (con verifica SHA-256)
azd ai agent code download

# Elimina un agente ospitato e tutte le sue versioni
# (--force termina le sessioni attive)
azd ai agent delete --force
```

**Ciclo di vita a colpo d'occhio:**

| Fase | Comando | Uso in produzione |
|-------|---------|----------------|
| Test | `azd ai agent invoke` | Convalidare le risposte e misurare la latenza prima del rilascio |
| Ispeziona | `azd ai agent endpoint show` | Revisionare auth/config dell'endpoint; individuare cambiamenti che rompono presto |
| Misura | `azd ai agent eval generate` | Costruire un set di valutazione ripetibile da tracce reali |
| Migliora | `azd ai agent optimize` | Affinare le istruzioni rispetto alla qualità misurata |
| Recupera | `azd ai agent code download` | Recuperare il codice esatto distribuito per audit/rollback |
| Ritira | `azd ai agent delete --force` | Rimuovere un agente e le sue versioni in modo pulito |

> Questi sono comandi in preview e possono cambiare tra le release dell'estensione. Esegui `azd ai agent --help` per vedere i sottocomandi esatti disponibili nella versione installata.

### Model Context Protocol (MCP) con `azd mcp`
AZD include il supporto integrato del server MCP (Alpha), che permette agli agenti e agli strumenti AI di interagire con le tue risorse Azure tramite un protocollo standardizzato:

```bash
# Avvia il server MCP per il tuo progetto
azd mcp start

# Rivedi le regole di consenso correnti di Copilot per l'esecuzione degli strumenti
azd copilot consent list
```

Il server MCP espone il contesto del tuo progetto azd—ambienti, servizi e risorse Azure—a strumenti di sviluppo potenziati dall'AI. Questo consente:

- **Distribuzione assistita dall'AI**: Consenti agli agenti di coding di interrogare lo stato del progetto e avviare le distribuzioni
- **Scoperta delle risorse**: Gli strumenti AI possono individuare quali risorse Azure il tuo progetto utilizza
- **Gestione degli ambienti**: Gli agenti possono passare tra gli ambienti dev/staging/production

### Generazione dell'infrastruttura con `azd infra generate`

Per i carichi di lavoro AI in produzione, puoi generare e personalizzare l'Infrastructure as Code invece di fare affidamento sul provisioning automatico:

```bash
# Genera file Bicep/Terraform dalla definizione del tuo progetto
azd infra generate
```

Questo scrive IaC su disco in modo che tu possa:
- Revisionare e verificare l'infrastruttura prima di distribuirla
- Aggiungere policy di sicurezza personalizzate (regole di rete, endpoint privati)
- Integrarsi con i processi di revisione IaC esistenti
- Tenere le modifiche all'infrastruttura sotto controllo versione separatamente dal codice dell'applicazione

### Hook del ciclo di vita di produzione

Gli hook di AZD ti permettono di inserire logica personalizzata in ogni fase del ciclo di vita della distribuzione—fondamentale per i workflow AI in produzione:

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
# Esegui manualmente un hook specifico durante lo sviluppo
azd hooks run predeploy
```

**Hook consigliati per i carichi di lavoro AI in produzione:**

| Hook | Caso d'uso |
|------|----------|
| `preprovision` | Validare le quote della sottoscrizione per la capacità dei modelli AI |
| `postprovision` | Configurare endpoint privati, distribuire i pesi del modello |
| `predeploy` | Eseguire test di sicurezza AI, validare i template di prompt |
| `postdeploy` | Eseguire smoke test delle risposte degli agenti, verificare la connettività del modello |

### Configurazione della pipeline CI/CD

Usa `azd pipeline config` per collegare il tuo progetto a GitHub Actions o Azure Pipelines con autenticazione Azure sicura:

```bash
# Configura la pipeline CI/CD (interattiva)
azd pipeline config

# Configura con un provider specifico
azd pipeline config --provider github
```

Questo comando:
- Crea un service principal con accesso a privilegi minimi
- Configura credenziali federate (nessun segreto memorizzato)
- Genera o aggiorna il file di definizione della pipeline
- Imposta le variabili d'ambiente richieste nel tuo sistema CI/CD

#### Passo-passo: la tua prima pipeline GitHub Actions

Ecco la procedura completa da un progetto azd funzionante fino a distribuzioni automatizzate a ogni push.

**1. Assicurati che il tuo progetto sia su GitHub**

```bash
git init
git add .
git commit -m "Initial azd project"
gh repo create my-ai-app --private --source=. --push
```

**2. Esegui pipeline config**

```bash
azd pipeline config --provider github
```

azd, in modo interattivo, farà:
- Chiederà quale sottoscrizione Azure e ambiente targettare
- Creare un'Entra **app registration + service principal** per la pipeline
- Configurare **federated credentials (OIDC)**—così GitHub si autentica in Azure con token a breve durata e **nessun segreto viene memorizzato**
- Pushare le richieste **variabili** nel tuo repo GitHub (`AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`, `AZURE_ENV_NAME`, `AZURE_LOCATION`)

**3. Comprendi il workflow generato**

azd aggiunge `.github/workflows/azure-dev.yml`. Le parti principali sono simili a queste:

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

**4. Verifica che funzioni**

```bash
# Esegui il push di una modifica per attivare la pipeline
git commit -am "Trigger pipeline" --allow-empty
git push
```

Apri la scheda **Actions** nel tuo repo GitHub e osserva il workflow eseguire automaticamente `azd provision` e `azd deploy`.

> **Perché le credenziali federate sono importanti:** le pipeline più vecchie memorizzavano un client secret in GitHub. Le credenziali federate OIDC rimuovono completamente quel secret—GitHub richiede un token a breve scadenza a runtime, il che è sia più sicuro sia qualcosa da non dover ruotare o perdere. Questa è la configurazione predefinita che `azd pipeline config` imposta.

> **Segreti vs. variabili:** gli identificatori non sensibili (`AZURE_CLIENT_ID`, ecc.) vanno nelle **variables** del repo. Se la tua app ha davvero bisogno di un secret in fase di build, aggiungilo come GitHub **secret** e riferiscilo con `${{ secrets.NAME }}`—ma preferisci Key Vault + managed identity a runtime (vedi [Capitolo 3](../chapter-03-configuration/authsecurity.md)).

**Workflow di produzione con pipeline config:**

```bash
# 1. Configura l'ambiente di produzione
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Configura la pipeline
azd pipeline config --provider github

# 3. La pipeline esegue azd deploy ad ogni push sul ramo main
```

#### Passo-passo: Azure DevOps Pipelines

Preferisci Azure DevOps a GitHub Actions? azd lo supporta nativamente con il provider `azdo`. Il flusso è quasi identico—azd genera il file della pipeline, crea una service connection e configura l'autenticazione.

**1. Assicurati di avere un progetto Azure DevOps**

Hai bisogno di un'organizzazione e di un progetto su `https://dev.azure.com/<your-org>`. Genera un Personal Access Token (PAT) con gli ambiti **Build (Read & execute)**, **Code (Read & write)** e **Service Connections (Read, query & manage)**—azd ti chiederà questo token.

**2. Configura la pipeline**

```bash
azd pipeline config --provider azdo
```

azd farà:
- Chiederà la tua organization e il progetto Azure DevOps
- Creerà (o riutilizzerà) una **service connection** ad Azure usando un service principal
- Configurerà **workload identity federation (OIDC)** in modo che nessun client secret venga memorizzato
- Effettuerà il commit di una definizione di pipeline `azure-dev.yml` nel tuo repo

**3. Esamina il `azure-dev.yml` generato**

azd scrive una pipeline che esegue provisioning e deploy ad ogni push su `main`:

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

**4. Da dove provengono le variabili**

azd memorizza i valori dell'ambiente (`AZURE_ENV_NAME`, `AZURE_LOCATION`, `AZURE_SUBSCRIPTION_ID`) come **variable group** in Azure DevOps in modo che la pipeline possa leggerli. Puoi visualizzarli e modificarli sotto **Pipelines → Library**.

> **Stesso beneficio OIDC di GitHub:** il provider `azdo` configura anche di default workload identity federation, quindi non viene memorizzato alcun client secret nella service connection—Azure DevOps scambia un token a breve durata a runtime. Passa `--auth-type client-credentials` solo se la tua organizzazione non può ancora usare OIDC.

**5. Eseguilo**

```bash
git commit -am "Add Azure DevOps pipeline" --allow-empty
git push
```

Apri **Pipelines** in Azure DevOps per osservare l'esecuzione di `azd provision` e `azd deploy`.

### Aggiungere componenti con `azd add`

Aggiungi gradualmente servizi Azure a un progetto esistente:

```bash
# Aggiungi un nuovo componente di servizio in modo interattivo
azd add
```

Questo è particolarmente utile per espandere applicazioni AI in produzione—per esempio, aggiungendo un servizio di ricerca vettoriale, un nuovo endpoint agente o un componente di monitoraggio a una distribuzione esistente.

## Risorse aggiuntive

- **Azure Well-Architected Framework**: [Linee guida per i carichi di lavoro AI](https://learn.microsoft.com/azure/well-architected/ai/)
- **Documentazione Microsoft Foundry**: [Documentazione ufficiale](https://learn.microsoft.com/azure/ai-studio/)
- **Template della community**: [Azure Samples](https://github.com/Azure-Samples)
- **Community Discord**: [canale #Azure](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 agent skills aperti per Azure AI, Foundry, deployment, ottimizzazione dei costi e diagnostica. Installa nel tuo editor:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 8 - Pattern di produzione e aziendali
- **⬅️ Capitolo precedente**: [Capitolo 7: Risoluzione dei problemi](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Anche correlato**: [AI Workshop Lab](ai-workshop-lab.md)
- **� Corso completato**: [AZD For Beginners](../../README.md)

**Ricorda**: I carichi di lavoro AI in produzione richiedono pianificazione attenta, monitoraggio e ottimizzazione continua. Inizia con questi pattern e adattali ai tuoi requisiti specifici.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->