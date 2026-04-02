# Лучшие практики для производственных AI рабочих нагрузок с AZD

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 8 - Производственные и корпоративные паттерны
- **⬅️ Предыдущая глава**: [Глава 7: Отладка](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Также по теме**: [Лабораторная работа AI Workshop](ai-workshop-lab.md)
- **🎯 Завершение курса**: [AZD для начинающих](../../README.md)

## Обзор

Это руководство предоставляет комплексные лучшие практики для развертывания производственных AI рабочих нагрузок с использованием Azure Developer CLI (AZD). Основываясь на отзывам из сообщества Microsoft Foundry Discord и реальных развертываниях клиентов, эти практики решают наиболее распространённые проблемы в производственных AI системах.

## Основные решаемые задачи

Согласно результатам нашего опроса сообщества, это главные сложности, с которыми сталкиваются разработчики:

- **45%** испытывают трудности с мультисервисными AI-развёртываниями
- **38%** имеют проблемы с управлением учетными данными и секретами  
- **35%** находят сложным обеспечение готовности к эксплуатации и масштабирование
- **32%** нуждаются в лучших стратегиях оптимизации затрат
- **29%** требуют улучшенного мониторинга и устранения неполадок

## Архитектурные паттерны для производственного AI

### Паттерн 1: Микросервисная AI архитектура

**Когда использовать**: Сложные AI-приложения с несколькими возможностями

```mermaid
graph TD
    Frontend[Веб-Фронтенд] --- Gateway[API Шлюз] --- LB[Балансировщик Нагрузки]
    Gateway --> Chat[Сервис Чата]
    Gateway --> Image[Сервис Изображений]
    Gateway --> Text[Сервис Текста]
    Chat --> OpenAI[Модели Microsoft Foundry]
    Image --> Vision[Компьютерное Зрение]
    Text --> DocIntel[Интеллект Документов]
```
**Реализация в AZD**:

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

### Паттерн 2: Событийно-ориентированная обработка AI

**Когда использовать**: Пакетная обработка, анализ документов, асинхронные рабочие процессы

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

## Оценка состояния AI агента

Когда традиционное веб-приложение ломается, симптомы знакомы: страница не загружается, API возвращает ошибку или развёртывание не удаётся. AI-приложения, основанные на ИИ, могут ломаться всеми этими способами — но также могут работать с ошибками гораздо более тонко, не выдавая очевидных сообщений об ошибках.

Этот раздел поможет вам создать мысленную модель мониторинга AI рабочих нагрузок, чтобы понимать, куда смотреть, когда что-то кажется неправильным.

### Чем здоровье агента AI отличается от здоровья традиционного приложения

Традиционное приложение либо работает, либо нет. AI агент может казаться работоспособным, но создавать плохие результаты. Рассмотрите здоровье агента как состоящее из двух уровней:

| Уровень | На что обращать внимание | Где смотреть |
|---------|--------------------------|--------------|
| **Здоровье инфраструктуры** | Работает ли служба? Выделены ли ресурсы? Доступны ли конечные точки? | `azd monitor`, статус ресурсов в Azure Portal, логи контейнеров/приложений |
| **Здоровье поведения** | Отвечает ли агент точно? Ответы своевременные? Правильно ли вызывается модель? | Application Insights трассировки, метрики задержек вызовов модели, логи качества ответов |

Здоровье инфраструктуры привычно — оно одинаково для любого azd приложения. Здоровье поведения — новый уровень, который добавляют AI рабочие нагрузки.

### Куда смотреть, если AI приложения ведут себя не так, как ожидалось

Если ваше AI-приложение не даёт ожидаемых результатов, вот концептуальный список для проверки:

1. **Начните с основ.** Работает ли приложение? Может ли оно обращаться к своим зависимостям? Проверьте `azd monitor` и статус ресурсов, как для любого приложения.
2. **Проверьте подключение к модели.** Приложение успешно вызывает AI модель? Ошибки или тайм-ауты вызовов модели — самая частая причина проблем AI приложений, они появляются в логах приложения.
3. **Посмотрите, что модель получила.** Ответы AI зависят от входных данных (промпта и любого извлечённого контекста). Если вывод неправильный, скорее всего, входные данные неверны. Проверьте, посылает ли приложение правильные данные модели.
4. **Проверьте задержку ответов.** Вызовы AI моделей медленнее, чем обычные API вызовы. Если приложение кажется медленным, проверьте, возросли ли времена ответа модели — это может указывать на ограничение пропускной способности, лимиты ресурсов или перегрузку региона.
5. **Следите за сигналами затрат.** Неожиданные всплески использования токенов или API вызовов могут указывать на цикл, неправильно настроенный промпт или чрезмерные повторные попытки.

Не обязательно сразу осваивать средства наблюдаемости. Главное — запомнить, что AI приложения имеют дополнительный уровень поведения для мониторинга, а встроенный мониторинг azd (`azd monitor`) предоставляет отправную точку для исследования обоих уровней.

---

## Лучшие практики безопасности

### 1. Модель безопасности Zero-Trust

**Стратегия реализации**:
- Без сервис-сервис аутентификации без проверки
- Все API вызовы используют управляемые идентичности
- Сетевой изолированной с приватными конечными точками
- Контроль доступа с минимальными привилегиями

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

### 2. Безопасное управление секретами

**Шаблон интеграции Key Vault**:

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

### 3. Сетевая безопасность

**Конфигурация приватных конечных точек**:

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

## Производительность и масштабирование

### 1. Стратегии автоскалирования

**Автоматическое масштабирование контейнеров**:

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

### 2. Стратегии кэширования

**Redis Cache для AI ответов**:

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

### 3. Балансировка нагрузки и управление трафиком

**Application Gateway с WAF**:

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

## 💰 Оптимизация затрат

### 1. Правильное размерение ресурсов

**Конфигурации для конкретных сред**:

```bash
# Среда разработки
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Производственная среда
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Мониторинг затрат и бюджеты

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

### 3. Оптимизация использования токенов

**Управление затратами OpenAI**:

```typescript
// Оптимизация токенов на уровне приложений
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Обрезать контекст, а не ввод пользователя
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Приблизительная оценка: 1 токен ≈ 4 символа
    return Math.ceil(text.length / 4);
  }
}
```

## Мониторинг и наблюдаемость

### 1. Комплексный Application Insights

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

### 2. Специфический мониторинг AI

**Пользовательские панели для метрик AI**:

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

### 3. Проверки здоровья и мониторинг времени работы

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

## Восстановление после сбоев и высокая доступность

### 1. Развертывание в нескольких регионах

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

### 2. Резервное копирование и восстановление данных

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

## DevOps и интеграция CI/CD

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

### 2. Валидация инфраструктуры

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Проверить, запущены ли все необходимые службы
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Проверить развертывания моделей OpenAI
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# Проверить подключение к сервису ИИ
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Чеклист готовности к продакшену

### Безопасность ✅
- [ ] Все службы используют управляемые идентичности
- [ ] Секреты хранятся в Key Vault
- [ ] Настроены приватные конечные точки
- [ ] Внедрены сетевые группы безопасности
- [ ] RBAC с минимальными привилегиями
- [ ] Включён WAF на публичных конечных точках

### Производительность ✅
- [ ] Настроено автоскалирование
- [ ] Реализовано кэширование
- [ ] Настроена балансировка нагрузки
- [ ] CDN для статического контента
- [ ] Пул подключений к базе данных
- [ ] Оптимизация использования токенов

### Мониторинг ✅
- [ ] Настроен Application Insights
- [ ] Определены пользовательские метрики
- [ ] Настроены правила оповещений
- [ ] Созданы панели мониторинга
- [ ] Реализованы проверки здоровья
- [ ] Политики хранения логов

### Надёжность ✅
- [ ] Развёртывание в нескольких регионах
- [ ] План резервного копирования и восстановления
- [ ] Внедрены circuit breakers
- [ ] Настроены политики повторных попыток
- [ ] Корректное снижение качества при ошибках
- [ ] Конечные точки для проверок здоровья

### Управление затратами ✅
- [ ] Настроены оповещения по бюджету
- [ ] Правильное размерение ресурсов
- [ ] Применены скидки для dev/test сред
- [ ] Закуплены зарезервированные инстансы
- [ ] Панель мониторинга затрат
- [ ] Регулярные обзоры затрат

### Соответствие требованиям ✅
- [ ] Выполнение требований по местоположению данных
- [ ] Включён аудит логов
- [ ] Применены политики соответствия
- [ ] Внедрены базовые стандарты безопасности
- [ ] Регулярные оценки безопасности
- [ ] План реагирования на инциденты

## Бенчмарки производительности

### Типичные производственные метрики

| Метрика | Цель | Мониторинг |
|---------|-------|------------|
| **Время отклика** | < 2 секунд | Application Insights |
| **Доступность** | 99.9% | Мониторинг uptime |
| **Процент ошибок** | < 0.1% | Логи приложений |
| **Использование токенов** | < $500/месяц | Управление затратами |
| **Одновременные пользователи** | 1000+ | Нагрузочное тестирование |
| **Время восстановления** | < 1 часа | Тесты аварийного восстановления |

### Нагрузочное тестирование

```bash
# Скрипт нагрузочного тестирования для приложений ИИ
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Лучшие практики сообщества

На основе отзывов сообщества Microsoft Foundry Discord:

### Главные рекомендации от сообщества:

1. **Начинайте с малого, масштабируйтесь постепенно**: Начинайте с базовых SKU и расширяйтесь по мере фактического использования
2. **Мониторьте всё**: Настройте комплексный мониторинг с первого дня
3. **Автоматизируйте безопасность**: Используйте инфраструктуру как код для согласованной безопасности
4. **Тестируйте тщательно**: Включайте AI-специфические тесты в ваши пайплайны
5. **Планируйте затраты**: Мониторьте использование токенов и заранее настройте оповещения по бюджету

### Частые ошибки, которых стоит избегать:

- ❌ Хардкодинг API ключей в коде
- ❌ Отсутствие надлежащего мониторинга
- ❌ Игнорирование оптимизации затрат
- ❌ Отсутствие тестирования сценариев отказа
- ❌ Развёртывание без проверок здоровья

## AZD AI CLI команды и расширения

AZD включает растущий набор AI-специфических команд и расширений, которые упрощают производственные AI рабочие процессы. Эти инструменты преодолевают разрыв между локальной разработкой и производственным развёртыванием AI нагрузок.

### Расширения AZD для AI

AZD использует систему расширений для добавления AI-специфических возможностей. Устанавливайте и управляйте расширениями с помощью:

```bash
# Перечислить все доступные расширения (включая ИИ)
azd extension list

# Просмотреть детали установленных расширений
azd extension show azure.ai.agents

# Установить расширение агентов Foundry
azd extension install azure.ai.agents

# Установить расширение тонкой настройки
azd extension install azure.ai.finetune

# Установить расширение пользовательских моделей
azd extension install azure.ai.models

# Обновить все установленные расширения
azd extension upgrade --all
```

**Доступные AI расширения:**

| Расширение | Назначение | Статус |
|------------|------------|--------|
| `azure.ai.agents` | Управление Foundry Agent Service | Предварительный просмотр |
| `azure.ai.finetune` | Тонкая настройка моделей Foundry | Предварительный просмотр |
| `azure.ai.models` | Кастомные модели Foundry | Предварительный просмотр |
| `azure.coding-agent` | Конфигурация coding агента | Доступно |

### Инициализация проектов агентов через `azd ai agent init`

Команда `azd ai agent init` scaffolding-ует готовый к производству AI агент проект, интегрированный с Microsoft Foundry Agent Service:

```bash
# Инициализировать новый проект агента из манифеста агента
azd ai agent init -m <manifest-path-or-uri>

# Инициализировать и нацелить конкретный проект Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Инициализировать с пользовательским каталогом исходников
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Нацелиться на Container Apps в качестве хоста
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Основные флаги:**

| Флаг | Описание |
|------|----------|
| `-m, --manifest` | Путь или URI к манифесту агента для добавления в проект |
| `-p, --project-id` | Существующий ID проекта Microsoft Foundry для вашей среды azd |
| `-s, --src` | Каталог для загрузки определения агента (по умолчанию `src/<agent-id>`) |
| `--host` | Переопределение хоста по умолчанию (например, `containerapp`) |
| `-e, --environment` | Среда azd для использования |

**Совет для продакшена**: Используйте `--project-id` для прямого подключения к существующему Foundry проекту, чтобы с самого начала связать ваш код агента и облачные ресурсы.

### Model Context Protocol (MCP) с `azd mcp`

AZD включает встроенную поддержку MCP сервера (альфа), позволяющего AI агентам и инструментам взаимодействовать с вашими Azure ресурсами через стандартизованный протокол:

```bash
# Запустите MCP-сервер для вашего проекта
azd mcp start

# Просмотрите текущие правила согласия Copilot для выполнения инструментов
azd copilot consent list
```

MCP сервер открывает контекст вашего проекта azd — среды, сервисы и Azure ресурсы — для AI-управляемых инструментов разработки. Это позволяет:

- **AI-ассистированное развертывание**: Позволяет coding агентам запрашивать состояние проекта и запускать развертывания
- **Обнаружение ресурсов**: AI инструменты могут находить, какие Azure ресурсы используются проектом
- **Управление средами**: Агенты могут переключаться между dev/staging/production средами

### Генерация инфраструктуры с помощью `azd infra generate`

Для производственных AI рабочих нагрузок вы можете генерировать и настраивать инфраструктуру как код, вместо автоматического provision:

```bash
# Генерировать файлы Bicep/Terraform из определения вашего проекта
azd infra generate
```

Это записывает IaC на диск, чтобы вы могли:
- Просматривать и аудитировать инфраструктуру перед развертыванием
- Добавлять пользовательские политики безопасности (сетевые правила, приватные конечные точки)
- Интегрировать с текущими процессами ревью IaC
- Версионировать изменения инфраструктуры отдельно от кода приложения

### Производственные хуки жизненного цикла

Хуки AZD позволяют внедрять кастомную логику на каждом этапе жизненного цикла развёртывания — критично для производственных AI рабочих процессов:

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
# Запустите конкретный хук вручную во время разработки
azd hooks run predeploy
```

**Рекомендуемые продакшен хуки для AI нагрузок:**

| Хук | Сценарий использования |
|------|------------------------|
| `preprovision` | Проверка квот подписки для мощности AI моделей |
| `postprovision` | Настройка приватных конечных точек, развертывание весов моделей |
| `predeploy` | Запуск AI safety тестов, проверка шаблонов промптов |
| `postdeploy` | Smoke-тесты ответов агента, проверка подключения к модели |

### Конфигурация CI/CD пайплайна

Используйте `azd pipeline config` для подключения проекта к GitHub Actions или Azure Pipelines с безопасной аутентификацией Azure:

```bash
# Настроить CI/CD пайплайн (интерактивно)
azd pipeline config

# Настроить с конкретным провайдером
azd pipeline config --provider github
```

Эта команда:
- Создаёт сервисный принципал с минимальными правами
- Настраивает федеративные учётные данные (без сохранённых секретов)
- Генерирует или обновляет файл определения пайплайна
- Устанавливает необходимые переменные окружения в вашей CI/CD системе

**Производственный workflow с конфигом пайплайна:**

```bash
# 1. Настроить производственную среду
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Настроить конвейер
azd pipeline config --provider github

# 3. Конвейер запускает azd deploy при каждом пуше в main
```

### Добавление компонентов с `azd add`

Пошагово добавляйте Azure сервисы в существующий проект:

```bash
# Добавить новый компонент сервиса интерактивно
azd add
```

Это особенно полезно для расширения производственных AI приложений — например, добавление сервиса векторного поиска, новой конечной точки агента или компонента мониторинга в существующее развёртывание.

## Дополнительные ресурсы
- **Архитектурные рекомендации Azure**: [Руководство по рабочим нагрузкам ИИ](https://learn.microsoft.com/azure/well-architected/ai/)
- **Документация Microsoft Foundry**: [Официальная документация](https://learn.microsoft.com/azure/ai-studio/)
- **Шаблоны сообщества**: [Azure Samples](https://github.com/Azure-Samples)
- **Сообщество Discord**: [канал #Azure](https://discord.gg/microsoft-azure)
- **Навыки агентов для Azure**: [microsoft/github-copilot-for-azure на skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 открытых навыков агентов для Azure AI, Foundry, развертывания, оптимизации затрат и диагностики. Установите в своем редакторе:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 8 - Паттерны для производства и предприятий
- **⬅️ Предыдущая глава**: [Глава 7: Поиск и устранение неисправностей](../chapter-07-troubleshooting/debugging.md)
- **⬅️ По теме также**: [Лаборатория AI Workshop](ai-workshop-lab.md)
- **� Курс завершен**: [AZD для начинающих](../../README.md)

**Помните**: Производственные рабочие нагрузки ИИ требуют тщательного планирования, мониторинга и постоянной оптимизации. Начните с этих паттернов и адаптируйте их под свои конкретные требования.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Данный документ был переведен с помощью сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, пожалуйста, имейте в виду, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильное толкование, возникающие при использовании данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->