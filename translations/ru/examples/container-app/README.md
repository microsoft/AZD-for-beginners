# Примеры развертывания контейнерных приложений с AZD

В этом каталоге представлены комплексные примеры развертывания контейнеризованных приложений в Azure Container Apps с использованием Azure Developer CLI (AZD). Эти примеры демонстрируют реальные сценарии, лучшие практики и готовые к производству конфигурации.

## 📚 Содержание

- [Обзор](../../../../examples/container-app)
- [Требования](../../../../examples/container-app)
- [Примеры быстрого старта](../../../../examples/container-app)
- [Примеры для производственной среды](../../../../examples/container-app)
- [Продвинутые паттерны](../../../../examples/container-app)
- [Лучшие практики](../../../../examples/container-app)

## Overview

Azure Container Apps — это полностью управляемая бессерверная платформа для контейнеров, которая позволяет запускать микросервисы и контейнеризованные приложения без управления инфраструктурой. В сочетании с AZD вы получаете:

- **Упрощённое развертывание**: одна команда для запуска контейнеров вместе с инфраструктурой
- **Автоматическое масштабирование**: масштабирование от нуля до большего количества экземпляров в зависимости от HTTP трафика или событий
- **Интегрированная сеть**: встроенное обнаружение сервисов и распределение трафика
- **Управляемая идентичность**: безопасная аутентификация для ресурсов Azure
- **Оптимизация затрат**: оплата только за используемые ресурсы

## Prerequisites

Перед началом убедитесь, что у вас есть:

```bash
# Проверить установку AZD
azd version

# Проверить Azure CLI
az version

# Проверить Docker (для сборки пользовательских образов)
docker --version

# Войти в Azure
azd auth login
az login
```

**Необходимые ресурсы Azure:**
- Активная подписка Azure
- Разрешения на создание группы ресурсов
- Доступ к окружению Container Apps

## Quick Start Examples

### 1. Простой Web API (Python Flask)

Разверните базовый REST API с помощью Azure Container Apps.

**Пример: Python Flask API**

```yaml
# azure.yaml
name: flask-api-demo
metadata:
  template: flask-api-demo@0.0.1-beta
services:
  api:
    project: ./src/api
    language: python
    host: containerapp
```

**Шаги развертывания:**

```bash
# Инициализация из шаблона
azd init --template todo-python-mongo

# Подготовка инфраструктуры и развертывание
azd up

# Тестирование развертывания
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Ключевые особенности:**
- Автоматическое масштабирование от 0 до 10 экземпляров
- Пробы здоровья и проверки живости
- Внедрение переменных окружения
- Интеграция с Application Insights

### 2. Node.js Express API

Разверните backend на Node.js с интеграцией MongoDB.

```bash
# Инициализация шаблона API для Node.js
azd init --template todo-nodejs-mongo

# Настройка переменных окружения
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Развертывание
azd up

# Просмотр логов через Azure Monitor
azd monitor --logs
```

**Основные моменты инфраструктуры:**
```bicep
// Bicep snippet from infra/main.bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'api-${resourceToken}'
  location: location
  properties: {
    managedEnvironmentId: containerEnv.id
    configuration: {
      ingress: {
        external: true
        targetPort: 3000
        transport: 'auto'
      }
      secrets: [
        {
          name: 'mongodb-connection'
          value: mongoConnection
        }
      ]
    }
    template: {
      containers: [
        {
          name: 'api'
          image: containerImage
          env: [
            {
              name: 'DATABASE_URL'
              secretRef: 'mongodb-connection'
            }
          ]
        }
      ]
      scale: {
        minReplicas: 0
        maxReplicas: 10
      }
    }
  }
}
```

### 3. Статичный фронтенд + backend API

Разверните полнофункциональное приложение с React фронтендом и backend API.

```bash
# Инициализировать полнофункциональный шаблон
azd init --template todo-csharp-sql-swa-func

# Проверить конфигурацию
cat azure.yaml

# Развернуть оба сервиса
azd up

# Открыть приложение
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Пример 1: Архитектура микросервисов

**Сценарий**: e-commerce приложение с несколькими микросервисами

**Структура каталога:**
```
microservices-demo/
├── azure.yaml
├── infra/
│   ├── main.bicep
│   ├── app/
│   │   ├── container-env.bicep
│   │   ├── product-service.bicep
│   │   ├── order-service.bicep
│   │   └── payment-service.bicep
│   └── core/
│       ├── storage.bicep
│       └── database.bicep
└── src/
    ├── product-service/
    ├── order-service/
    └── payment-service/
```

**Конфигурация azure.yaml:**
```yaml
name: microservices-ecommerce
services:
  product-service:
    project: ./src/product-service
    language: python
    host: containerapp
    
  order-service:
    project: ./src/order-service
    language: csharp
    host: containerapp
    
  payment-service:
    project: ./src/payment-service
    language: nodejs
    host: containerapp
```

**Развертывание:**
```bash
# Инициализировать проект
azd init

# Установить производственную среду
azd env new production

# Настроить производственные параметры
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Развернуть все сервисы
azd up

# Мониторить развертывание
azd monitor --overview
```

### Пример 2: Контейнерное приложение с AI

**Сценарий**: AI чат-приложение с интеграцией Azure OpenAI

**Файл: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Используйте управляемую идентичность для безопасного доступа
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Получите ключ OpenAI из Key Vault
    openai_key = client.get_secret("openai-api-key").value
    openai.api_key = openai_key
    
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[{"role": "user", "content": user_message}]
    )
    
    return jsonify({"response": response.choices[0].message.content})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**Файл: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Файл: infra/main.bicep**
```bicep
param location string = resourceGroup().location
param environmentName string

var resourceToken = uniqueString(subscription().id, environmentName, location)

// Container Apps Environment
module containerEnv './app/container-env.bicep' = {
  name: 'container-env-${resourceToken}'
  params: {
    location: location
    environmentName: environmentName
  }
}

// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: 'kv-${resourceToken}'
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
  }
}

// Container App with Managed Identity
module aiChatApp './app/container-app.bicep' = {
  name: 'ai-chat-app-${resourceToken}'
  params: {
    location: location
    environmentId: containerEnv.outputs.environmentId
    containerImage: 'your-registry.azurecr.io/ai-chat:latest'
    keyVaultName: keyVault.name
  }
}
```

**Команды развертывания:**
```bash
# Настроить окружение
azd init --template ai-chat-app
azd env new dev

# Настроить OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Развернуть
azd up

# Протестировать API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Пример 3: Фоновый воркер с обработкой очереди

**Сценарий**: система обработки заказов с очередью сообщений

**Структура каталога:**
```
queue-worker/
├── azure.yaml
├── infra/
│   ├── main.bicep
│   ├── app/
│   │   ├── api.bicep
│   │   └── worker.bicep
│   └── core/
│       ├── storage-queue.bicep
│       └── servicebus.bicep
└── src/
    ├── api/
    └── worker/
```

**Файл: src/worker/processor.py**
```python
import os
from azure.storage.queue import QueueClient
from azure.identity import DefaultAzureCredential

def process_orders():
    credential = DefaultAzureCredential()
    queue_url = os.getenv('AZURE_QUEUE_URL')
    
    queue_client = QueueClient.from_queue_url(
        queue_url=queue_url,
        credential=credential
    )
    
    while True:
        messages = queue_client.receive_messages(max_messages=10)
        for message in messages:
            # Обработать заказ
            print(f"Processing order: {message.content}")
            
            # Полное сообщение
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Файл: azure.yaml**
```yaml
name: order-processing
services:
  api:
    project: ./src/api
    language: python
    host: containerapp
    
  worker:
    project: ./src/worker
    language: python
    host: containerapp
```

**Развертывание:**
```bash
# Инициализация
azd init

# Развернуть с конфигурацией очереди
azd up

# Масштабировать рабочий процесс в зависимости от длины очереди
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### Паттерн 1: Blue-Green развертывание

```bash
# Создать новую версию без трафика
azd deploy api --revision-suffix blue --no-traffic

# Протестировать новую версию
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Разделить трафик (20% на синюю, 80% на текущую)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Полный переход на синюю версию
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Паттерн 2: Canary развертывание с AZD

**Файл: .azure/dev/config.json**
```json
{
  "deploymentStrategy": "canary",
  "canary": {
    "initialTrafficPercentage": 10,
    "incrementPercentage": 10,
    "intervalMinutes": 5
  }
}
```

**Скрипт развертывания:**
```bash
#!/bin/bash
# deploy-canary.sh

# Развернуть новую ревизию с 10% трафика
azd deploy api --revision-mode multiple

# Мониторить метрики
azd monitor --service api --duration 5m

# Постепенно увеличивать трафик
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Ждать 5 минут
done
```

### Паттерн 3: Развертывание в нескольких регионах

**Файл: azure.yaml**
```yaml
name: global-app
services:
  api:
    project: ./src/api
    language: python
    host: containerapp
    regions:
      - eastus
      - westeurope
      - southeastasia
```

**Файл: infra/multi-region.bicep**
```bicep
param regions array = ['eastus', 'westeurope', 'southeastasia']

module containerApps './app/container-app.bicep' = [for region in regions: {
  name: 'app-${region}'
  params: {
    location: region
    environmentName: environmentName
  }
}]

// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficManagerProfiles@2022-04-01' = {
  name: 'tm-global-app'
  location: 'global'
  properties: {
    trafficRoutingMethod: 'Performance'
    endpoints: [for i in range(0, length(regions)): {
      name: 'endpoint-${regions[i]}'
      type: 'Microsoft.Network/trafficManagerProfiles/externalEndpoints'
      properties: {
        target: containerApps[i].outputs.fqdn
        endpointStatus: 'Enabled'
      }
    }]
  }
}
```

**Развертывание:**
```bash
# Развернуть во всех регионах
azd up

# Проверить конечные точки
azd show --output json | jq '.services.api.endpoints'
```

### Паттерн 4: Интеграция с Dapr

**Файл: infra/app/dapr-enabled.bicep**
```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'dapr-app'
  properties: {
    configuration: {
      dapr: {
        enabled: true
        appId: 'order-service'
        appPort: 8000
        appProtocol: 'http'
      }
    }
    template: {
      containers: [
        {
          name: 'app'
          image: containerImage
        }
      ]
    }
  }
}
```

**Код приложения с Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Сохранить состояние
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Опубликовать событие
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Best Practices

### 1. Организация ресурсов

```bash
# Используйте последовательные соглашения об именах
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Помечайте ресурсы для отслеживания затрат
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Лучшие практики безопасности

```bicep
// Always use managed identity
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  identity: {
    type: 'SystemAssigned'
  }
}

// Store secrets in Key Vault
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  properties: {
    enableRbacAuthorization: true
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
    }
  }
}

// Use private endpoints
resource privateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  properties: {
    subnet: {
      id: subnetId
    }
    privateLinkServiceConnections: [
      {
        name: 'containerapp-connection'
        properties: {
          privateLinkServiceId: containerApp.id
        }
      }
    ]
  }
}
```

### 3. Оптимизация производительности

```yaml
# azure.yaml with performance settings
services:
  api:
    project: ./src/api
    host: containerapp
    resources:
      cpu: 1.0
      memory: 2Gi
    scale:
      minReplicas: 2
      maxReplicas: 20
      rules:
        - name: http-rule
          http:
            concurrent: 100
```

### 4. Мониторинг и наблюдаемость

```bash
# Включить Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Просмотр журналов в реальном времени
azd monitor --logs
# Или используйте Azure CLI для контейнерных приложений:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Мониторинг метрик
azd monitor --live

# Создать оповещения
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Оптимизация затрат

```bash
# Масштабировать до нуля, когда не используется
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Использовать спотовые инстансы для сред разработки
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Настроить оповещения о бюджете
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Интеграция CI/CD

**Пример GitHub Actions:**
```yaml
name: Deploy to Azure Container Apps

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup AZD
        uses: Azure/setup-azd@v1
      
      - name: Login to Azure
        run: |
          azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        run: azd up --no-prompt
        env:
          AZURE_ENV_NAME: ${{ secrets.AZURE_ENV_NAME }}
          AZURE_LOCATION: ${{ secrets.AZURE_LOCATION }}
```

## Common Commands Reference

```bash
# Инициализация нового проекта контейнерного приложения
azd init --template <template-name>

# Развернуть инфраструктуру и приложение
azd up

# Развернуть только код приложения (пропустить инфраструктуру)
azd deploy

# Обеспечить только инфраструктуру
azd provision

# Просмотр развернутых ресурсов
azd show

# Потоковая передача логов с помощью azd monitor или Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Мониторинг приложения
azd monitor --overview

# Очистка ресурсов
azd down --force --purge
```

## Troubleshooting

### Проблема: Контейнер не запускается

```bash
# Проверить журналы с помощью Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Просмотреть события контейнера
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Тестировать локально
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Проблема: Невозможно получить доступ к конечной точке контейнерного приложения

```bash
# Проверить конфигурацию ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Проверить, включен ли внутренний ingress
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Проблема: Проблемы с производительностью

```bash
# Проверить использование ресурсов
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Масштабировать ресурсы вверх
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Дополнительные ресурсы и примеры
- [Пример микросервисов](./microservices/README.md)
- [Простой пример Flask API](./simple-flask-api/README.md)
- [Документация Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Галерея шаблонов AZD](https://azure.github.io/awesome-azd/)
- [Примеры Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Шаблоны Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

Чтобы добавить новые примеры контейнерных приложений:

1. Создайте новый подкаталог с вашим примером
2. Включите полные файлы `azure.yaml`, `infra/` и `src/`
3. Добавьте подробный README с инструкциями по развертыванию
4. Проверьте развертывание командой `azd up`
5. Отправьте pull request

---

**Нужна помощь?** Присоединяйтесь к сообществу [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) для поддержки и вопросов.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, пожалуйста, учитывайте, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обращаться к профессиональному переводу, выполненному человеком. Мы не несём ответственности за любые недоразумения или неверные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->