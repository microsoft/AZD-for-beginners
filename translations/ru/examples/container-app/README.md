# Примеры развертывания контейнерных приложений с AZD

В этом каталоге содержатся комплексные примеры развертывания контейнеризованных приложений в Azure Container Apps с использованием Azure Developer CLI (AZD). Эти примеры демонстрируют реальные паттерны, лучшие практики и готовые к производству конфигурации.

## 📚 Содержание

- [Обзор](#обзор)
- [Требования](#требования)
- [Примеры быстрого старта](#примеры-быстрого-старта)
- [Производственные примеры](#производственные-примеры)
- [Расширенные паттерны](#расширенные-паттерны)
- [Лучшие практики](#лучшие-практики)

## Обзор

Azure Container Apps — это полностью управляемая бессерверная контейнерная платформа, которая позволяет запускать микросервисы и контейнеризованные приложения без управления инфраструктурой. В сочетании с AZD вы получаете:

- **Упрощённое развертывание**: одна команда для развертывания контейнеров с инфраструктурой
- **Автоматическое масштабирование**: масштабирование до нуля и масштабирование в зависимости от HTTP-трафика или событий
- **Интегрированная сеть**: встроенное обнаружение сервисов и распределение трафика
- **Управляемая идентичность**: безопасная аутентификация к ресурсам Azure
- **Оптимизация затрат**: оплата только за используемые ресурсы

## Требования

Перед началом убедитесь, что у вас есть:

```bash
# Проверьте установку AZD
azd version

# Проверьте Azure CLI
az version

# Проверьте Docker (для создания пользовательских образов)
docker --version

# Аутентификация для развертываний AZD
azd auth login

# По желанию: войдите в Azure CLI, если планируете запускать команды az напрямую
az login
```

**Требуемые ресурсы Azure:**
- Активная подписка Azure
- Разрешения на создание группы ресурсов
- Доступ к среде Container Apps

## Примеры быстрого старта

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

# Обеспечение инфраструктуры и развертывание
azd up

# Тестирование развертывания
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Основные возможности:**
- Автоматическое масштабирование от 0 до 10 реплик
- Пробы работоспособности и проверки жизнеспособности
- Внедрение переменных окружения
- Интеграция с Application Insights

### 2. Node.js Express API

Развертывание backend на Node.js с интеграцией MongoDB.

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

**Особенности инфраструктуры:**
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

### 3. Статический фронтенд + API Backend

Развертывание полнофункционального приложения с фронтендом на React и backend API.

```bash
# Инициализация шаблона полного стека
azd init --template todo-csharp-sql-swa-func

# Проверка конфигурации
cat azure.yaml

# Развертывание обоих сервисов
azd up

# Открыть приложение
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Производственные примеры

### Пример 1: Архитектура микросервисов

**Сценарий**: Приложение электронной коммерции с множеством микросервисов

**Структура каталогов:**
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

# Настроить параметры производства
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Развернуть все сервисы
azd up

# Отслеживать развертывание
azd monitor --overview
```

### Пример 2: Контейнерное приложение с поддержкой ИИ

**Сценарий**: Чат-приложение на базе ИИ с интеграцией Microsoft Foundry Models

**Файл: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Используйте управляемую идентификацию для безопасного доступа
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
        model="gpt-4.1",
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
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Развернуть
azd up

# Тестировать API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Пример 3: Фоновый работник с обработкой очереди

**Сценарий**: Система обработки заказов с использованием очереди сообщений

**Структура каталогов:**
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

# Развертывание с конфигурацией очереди
azd up

# Масштабировать рабочий процесс в зависимости от длины очереди
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Расширенные паттерны

### Паттерн 1: Blue-Green развертывание

```bash
# Создать новую ревизию без трафика
azd deploy api --revision-suffix blue --no-traffic

# Протестировать новую ревизию
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Разделить трафик (20% на синий, 80% на текущий)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Полный переход на синий
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Паттерн 2: Canary-развертывание с AZD

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

# Развернуть новую версию с 10% трафика
azd deploy api --revision-mode multiple

# Отслеживать метрики
azd monitor --service api --duration 5m

# Постепенно увеличивать трафик
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Подождать 5 минут
done
```

### Паттерн 3: Мульти-региональное развертывание

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

### Паттерн 4: Интеграция Dapr

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

## Лучшие практики

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

# Просматривать логи в реальном времени
azd monitor --logs
# Или использовать Azure CLI для Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Отслеживать метрики
azd monitor --live

# Создавать оповещения
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Оптимизация затрат

```bash
# Масштабировать до нуля при отсутствии использования
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

## Справочник по основным командам

```bash
# Инициализировать новый проект container app
azd init --template <template-name>

# Развернуть инфраструктуру и приложение
azd up

# Развернуть только код приложения (пропустить инфраструктуру)
azd deploy

# Обеспечить только инфраструктуру
azd provision

# Просмотреть развернутые ресурсы
azd show

# Трансляция логов с помощью azd monitor или Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Мониторинг приложения
azd monitor --overview

# Очистить ресурсы
azd down --force --purge
```

## Решение проблем

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

### Проблема: Нет доступа к эндпоинту контейнерного приложения

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

## Вклад в проект

Чтобы внести новые примеры контейнерных приложений:

1. Создайте новый подкаталог с вашим примером
2. Включите полный набор файлов `azure.yaml`, `infra/` и `src/`
3. Добавьте подробный README с инструкциями по развертыванию
4. Проверьте развертывание командой `azd up`
5. Отправьте pull request

---

**Нужна помощь?** Присоединяйтесь к сообществу [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) для поддержки и вопросов.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Данный документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует рассматривать как официальный источник. Для критически важной информации рекомендуется обратиться к профессиональному переводу, выполненному человеком. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->