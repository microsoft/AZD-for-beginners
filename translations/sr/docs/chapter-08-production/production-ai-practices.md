# Најбоље праксе за продукциона AI радна оптерећења уз AZD

**Навигација по поглављима:**
- **📚 Почетна курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 8 - Продукциони и предузећки обрасци
- **⬅️ Претходно поглавље**: [Поглавље 7: Решавање проблема](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Такође повезано**: [AI радионица](ai-workshop-lab.md)
- **🎯 Курс завршен**: [AZD за почетнике](../../README.md)

## Преглед

Ово упутство пружа свеобухватне најбоље праксе за распоређивање продукционих AI радних оптерећења користећи Azure Developer CLI (AZD). На основу повратних информација из Microsoft Foundry Discord заједнице и реалних корисничких распоређивања, ове праксе решавају најчешће изазове у продукционим AI системима.

## Кључни изазови који се адресирају

На основу резултата наше анкете у заједници, ово су главни изазови са којима се развијачи суочавају:

- **45%** има потешкоћа са распоређивањем AI више услуга
- **38%** има проблема са управљањем акредитивима и тајнама  
- **35%** сматрају да је припрема за продукцију и скалирање тешка
- **32%** потребне су боље стратегије оптимизације трошкова
- **29%** захтевају побољшано надгледање и решавање проблема

## Архитектонски обрасци за продукциони AI

### Образац 1: Микросервисна AI архитектура

**Када користити**: Сложене AI апликације са више функција

```mermaid
graph TD
    Frontend[Веб фронтенд] --- Gateway[API пролаз] --- LB[Уравнотеживач оптерећења]
    Gateway --> Chat[Услуга ћаскања]
    Gateway --> Image[Услуга слика]
    Gateway --> Text[Услуга текста]
    Chat --> OpenAI[Мицрософт Фаундри модели]
    Image --> Vision[Компјутерски вид]
    Text --> DocIntel[Интелигенција докумената]
```
**AZD имплементација**:

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

### Образац 2: Догађајима покренута AI обрада

**Када користити**: Обрада у серијама, анализа докумената, асинхрони токови рада

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

## Размишљање о здрављу AI агента

Када се традиционална веб апликација поквари, симптоми су познати: страница се не учитава, API враћа грешку или распоређивање не успе. AI-погонске апликације могу да се покваре на све те исте начине—али могу и да се понашају на суптилније начине који не производе очигледне поруке о грешци.

Ова секција вам помаже да изградите ментални модел за надгледање AI радних оптерећења како бисте знали где да тражите када ствари не делују како треба.

### Како се здравље агента разликује од здравља традиционалне апликације

Традиционална апликација или ради или не ради. AI агент може изгледати да ради али производити лоше резултате. Размислите о здрављу агента у два слоја:

| Layer | What to Watch | Where to Look |
|-------|--------------|---------------|
| **Infrastructure health** | Is the service running? Are resources provisioned? Are endpoints reachable? | `azd monitor`, Azure Portal resource health, container/app logs |
| **Behavior health** | Is the agent responding accurately? Are responses timely? Is the model being called correctly? | Application Insights traces, model call latency metrics, response quality logs |

Инфраструктурно здравље је познато—исто је за било коју azd апликацију. Понашајно здравље је нови слој који уводе AI радна оптерећења.

### Где тражити кад се AI апликације не понашају како се очекује

Ако ваша AI апликација не производи очекиване резултате, ево концептуалне контролне листе:

1. **Почните од основа.** Да ли апликација ради? Да ли може да достигне зависности? Проверите `azd monitor` и здравље ресурса баш као и за било коју апликацију.
2. **Проверите везу са моделом.** Да ли ваша апликација успешно позива AI модел? Неуспели или истекли позиви модела су најчешћи узрок проблема у AI апликацијама и појавиће се у лог-овима апликације.
3. **Погледајте шта је модел примио.** AI одговори зависе од улаза (промпта и било ког преузетог контекста). Ако је излаз погрешан, улаз је обично погрешан. Проверите да ли ваша апликација шаље праве податке моделу.
4. **Проверите латенцију одговора.** Позиви AI модела су спорији од типичних API позива. Ако апликација изгледа успорено, проверите да ли су времена одзива модела порасла—то може указивати на тротлинг, лимите капацитета или загушење на нивоу региона.
5. **Пазите на сигнале о трошковима.** Неочекивани скокови у коришћењу токена или API позивима могу указивати на петљу, неправилно конфигурисан промпт или прекомерне поновне покушаје.

Не треба одмах савладати алате за опсервабилност. Кључна поента је да AI апликације имају додатни слој понашања који треба надгледати, а ugrađeni nadzor alata azd ( `azd monitor`) вам даје полазну тачку за истрагу оба слоја.

---

## Безбедносне најбоље праксе

### 1. Zero-Trust модел безбедности

**Стратегија имплементације**:
- Ниједна комуникација услуга не без аутентификације
- Сви API позиви користе managed identities
- Мрежна изолација са приватним крајњим тачкама
- Контроле приступа по принципу најмањих привилегија

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

### 2. Безбедно управљање тајнама

**Образац интеграције са Key Vault-ом**:

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

### 3. Мрежна безбедност

**Конфигурација приватних крајњих тачака**:

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

## Перформансе и скалирање

### 1. Стратегије аутоматског скалирања

**Аутоматско скалирање за Container Apps**:

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

### 2. Стратегије кеширања

**Redis кеш за AI одговоре**:

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

### 3. Балансирање оптерећења и управљање саобраћајем

**Application Gateway са WAF-ом**:

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

## 💰 Оптимизација трошкова

### 1. Правилно димензионисање ресурса

**Конфигурације специфичне за окружење**:

```bash
# Развојно окружење
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Продукционо окружење
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Надгледање трошкова и буџети

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

### 3. Оптимизација коришћења токена

**Управљање трошковима OpenAI**:

```typescript
// Оптимизација токена на нивоу апликације
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Скраћујте контекст, а не унос корисника
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Приближна процена: 1 токен ≈ 4 знака
    return Math.ceil(text.length / 4);
  }
}
```

## Надгледање и опсервабилност

### 1. Свеобухватни Application Insights

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

### 2. Мониторинг специфичан за AI

**Прилагођене контролне табле за AI метрике**:

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

### 3. Провере здравља и надгледање доступности

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

## Опоравак од катастрофа и висока доступност

### 1. Распоређивање у више региона

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

### 2. Бекап података и опоравак

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

## DevOps и CI/CD интеграција

### 1. GitHub Actions радни ток

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

### 2. Валидација инфраструктуре

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Проверите да ли су сви потребни сервиси покренути
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Проверите распоређивања OpenAI модела
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# Тестирајте повезаност AI сервиса
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Контрола спремности за продукцију

### Безбедност ✅
- [ ] Све услуге користе managed identities
- [ ] Тајне складиштене у Key Vault-у
- [ ] Приватне крајње тачке конфигурисане
- [ ] Мрежне групе за безбедност имплементиране
- [ ] RBAC са најмањим привилегијама
- [ ] WAF омогућен на јавним крајњим тачкама

### Перформансе ✅
- [ ] Аутоматско скалирање конфигурисано
- [ ] Кеширање имплементирано
- [ ] Близирање оптерећења подешено
- [ ] CDN за статички садржај
- [ ] Пула веза са базом података
- [ ] Оптимизација коришћења токена

### Надгледање ✅
- [ ] Application Insights конфигурисан
- [ ] Прилагођене метрике дефинисане
- [ ] Правила упозоравања подешена
- [ ] Контролна табла креирана
- [ ] Провере здравља имплементиране
- [ ] Политике задржавања логова

### Поузданост ✅
- [ ] Распоређивање у више региона
- [ ] План бекапа и опоравка
- [ ] Имплементирани circuit breaker-и
- [ ] Подешене политике поновних покушаја
- [ ] Грациозна деградација
- [ ] Ендпоинти за проверу здравља

### Управљање трошковима ✅
- [ ] Буџетска упозорења подешена
- [ ] Правилно димензионисање ресурса
- [ ] Попусти за дев/тест окружења примењени
- [ ] Купљене резервисане инстанце
- [ ] Контролна табла за праћење трошкова
- [ ] Редовни прегледи трошкова

### Усклађеност ✅
- [ ] Захтеви за локацију података испуњени
- [ ] Аудит логова омогућени
- [ ] Примењене политике усаглашености
- [ ] Имплементирани безбедносни базисни нивои
- [ ] Редовне безбедносне процене
- [ ] План за реаговање на инциденте

## Перформанс бенцмаркови

### Типичне продукционе метрике

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Response Time** | < 2 seconds | Application Insights |
| **Availability** | 99.9% | Uptime monitoring |
| **Error Rate** | < 0.1% | Application logs |
| **Token Usage** | < $500/month | Cost management |
| **Concurrent Users** | 1000+ | Load testing |
| **Recovery Time** | < 1 hour | Disaster recovery tests |

### Оптерећење тестирања

```bash
# Скрипта за тестирање оптерећења апликација вештачке интелигенције
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Најбоље праксе заједнице

На основу повратних информација Microsoft Foundry Discord заједнице:

### Најбоље препоруке од заједнице:

1. **Започните мало, скалирајте постепено**: Почните са базичним SKU-овима и скалирајте на основу стварног коришћења
2. **Надгледајте све**: Поставите свеобухватно надгледање од првог дана
3. **Аутоматизујте безбедност**: Користите инфраструктуру као код за доследну безбедност
4. **Тестирајте темељно**: Укључите AI-специфична тестирања у ваш pipeline
5. **Планирајте трошкове**: Пратите коришћење токена и подесите буџетска упозорења рано

### Уобичајене замке које треба избегавати:

- ❌ Убацивање API кључева у код
- ❌ Не поставити правилно надгледање
- ❌ Игнорисање оптимизације трошкова
- ❌ Не тестирање сценарија неуспеха
- ❌ Распоређивање без провера здравља

## AZD AI CLI команде и екстензије

AZD укључује растући скуп AI-специфичних команди и екстензија које поједностављују продукционе AI токове рада. Ови алати премошћују јаз између локалног развоја и продукционог распоређивања за AI радне оптерећења.

### AZD екстензије за AI

AZD користи систем екстензија за додавање AI-специфичних могућности. Инсталирајте и управљајте екстензијама помоћу:

```bash
# Прикажи све доступне екстензије (укључујући АИ)
azd extension list

# Провери детаље инсталиране екстензије
azd extension show azure.ai.agents

# Инсталирај екстензију Foundry agents
azd extension install azure.ai.agents

# Инсталирај екстензију за фино подешавање
azd extension install azure.ai.finetune

# Инсталирај екстензију за прилагођене моделе
azd extension install azure.ai.models

# Ажурирај све инсталиране екстензије
azd extension upgrade --all
```

**Доступне AI екстензије:**

| Extension | Purpose | Status |
|-----------|---------|--------|
| `azure.ai.agents` | Управљање Foundry Agent Service-ом | Preview |
| `azure.ai.finetune` | Финетјунинг модела у Foundry-у | Preview |
| `azure.ai.models` | Прилагођени модели у Foundry-у | Preview |
| `azure.coding-agent` | Конфигурација coding агента | Available |

### Иницијализација агенatskih пројеката са `azd ai agent init`

Команда `azd ai agent init` скелетира продукционо спреман AI agent пројекат интегрисан са Microsoft Foundry Agent Service:

```bash
# Инициализујте нови агентски пројекат из манифеста агента
azd ai agent init -m <manifest-path-or-uri>

# Инициализујте и усмерите на одређени Foundry пројекат
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Инициализујте са прилагођеним директоријумом извора
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Циљајте Container Apps као хост
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Кључне флаге:**

| Flag | Description |
|------|-------------|
| `-m, --manifest` | Path or URI to an agent manifest to add to your project |
| `-p, --project-id` | Existing Microsoft Foundry Project ID for your azd environment |
| `-s, --src` | Directory to download the agent definition (defaults to `src/<agent-id>`) |
| `--host` | Override the default host (e.g., `containerapp`) |
| `-e, --environment` | The azd environment to use |

**Продукциони савет**: Koristite `--project-id` да бисте се директно повезали на постојећи Foundry пројекат, држећи ваш agent код и cloud ресурсе повезаним од почетка.

### Model Context Protocol (MCP) са `azd mcp`

AZD укључује уграђену подршку за MCP сервер (Alpha), омогућавајући AI агентима и алатима да интерагују са вашим Azure ресурсима путем стандардизованог протокола:

```bash
# Покрените MCP сервер за ваш пројекат
azd mcp start

# Прегледајте текућа правила пристанка Copilot-а за извршавање алата
azd copilot consent list
```

MCP сервер излажe контекст вашег azd пројекта—окружења, услуге и Azure ресурсе—AI-погонским развојним алатима. Ово омогућава:

- **AI-assisted deployment**: Нека coding агенти упитују стање вашег пројекта и покрећу распоређивања
- **Resource discovery**: AI алати могу да открију које Azure ресурсе ваш пројекат користи
- **Environment management**: Агенти могу да пребацују између dev/staging/production окружења

### Генерисање инфраструктуре са `azd infra generate`

За продукциона AI радна оптерећења, можете генерисати и прилагодити Infrastructure as Code уместо да се ослањате на аутоматско провизионисање:

```bash
# Генеришите Bicep/Terraform датотеке из дефиниције вашег пројекта
azd infra generate
```

Ово записује IaC на диск тако да можете:
- Прегледати и ревидирати инфраструктуру пре распоређивања
- Додати прилагођене безбедносне политике (мрежна правила, приватне крајње тачке)
- Интегрисати са постојећим процесима ревизије IaC-а
- Верзионисати промене инфраструктуре одвојено од апликационог кода

### Продкциони lifecycle хук-ови

AZD hook-ови вам дозвољавају да убаците прилагођену логику у сваку фазу lifecycle-а распоређивања—критично за продукционе AI токове рада:

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
# Ручно покрените одређени хук током развоја
azd hooks run predeploy
```

**Препоручени продукциони hook-ови за AI радна оптерећења:**

| Hook | Use Case |
|------|----------|
| `preprovision` | Валидација квота претплате за капацитет модела |
| `postprovision` | Конфигурисање приватних крајњих тачака, распоређивање тежина модела |
| `predeploy` | Покретање AI безбедносних тестова, валидација шаблона промптова |
| `postdeploy` | Smoke тестирање одговора агента, верификација повезаности модела |

### Конфигурација CI/CD pipeline-а

Користите `azd pipeline config` да повежете ваш пројекат са GitHub Actions или Azure Pipelines уз сигурну Azure аутентификацију:

```bash
# Конфигуришите CI/CD пајплајн (интерактивно)
azd pipeline config

# Конфигуришите са одређеним провајдером
azd pipeline config --provider github
```

Ова команда:
- Креира service principal са приступом по принципу најмањих привилегија
- Конфигурише федеративне креденцијале (без складиштених тајни)
- Генерише или ажурира дефиницију вашег pipeline фајла
- Подешава неопходне променљиве окружења у вашем CI/CD систему

**Продукциони радни ток са pipeline config-ом:**

```bash
# 1. Подесите продукционо окружење
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Конфигуришите пајплајн
azd pipeline config --provider github

# 3. Пајплајн покреће azd deploy при сваком push-у у main грану
```

### Додавање компоненти са `azd add`

Инкрементално додајте Azure услуге у постојећи пројекат:

```bash
# Интерактивно додај нову сервисну компоненту
azd add
```

Ово је посебно корисно за проширивање продукционих AI апликација—на пример, додавање вектор претраживања, новог ендпоинта агента или компонента за надгледање у постојеће распоређивање.

## Додатни ресурси
- **Azure Well-Architected Framework**: [Смернице за AI радна оптерећења](https://learn.microsoft.com/azure/well-architected/ai/)
- **Документација Microsoft Foundry**: [Званична документација](https://learn.microsoft.com/azure/ai-studio/)
- **Шаблони за заједницу**: [Azure Samples](https://github.com/Azure-Samples)
- **Discord заједница**: [#Azure канал](https://discord.gg/microsoft-azure)
- **Вештине агента за Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 отворених вештина агената за Azure AI, Foundry, распоређивање, оптимизацију трошкова и дијагностику. Инсталирајте у вашем уређивачу:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 8 - Производни и предузетнички обрасци
- **⬅️ Претходно поглавље**: [Поглавље 7: Решавање проблема](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Такође повезано**: [AI радионица](ai-workshop-lab.md)
- **� Курс завршен**: [AZD For Beginners](../../README.md)

**Имајте на уму**: Производна AI радна оптерећења захтевају пажљиво планирање, праћење и континуирану оптимизацију. Почните са овим обрасцима и прилагодите их вашим специфичним захтевима.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен помоћу AI сервиса за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква непоразумевања или погрешна тумачења која могу произаћи из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->