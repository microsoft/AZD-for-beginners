# Примери за разгръщане на Container App с AZD

Тази директория съдържа подробни примери за разгръщане на контейнеризирани приложения в Azure Container Apps с помощта на Azure Developer CLI (AZD). Тези примери демонстрират реални модели, най-добри практики и конфигурации готови за продукция.

## 📚 Съдържание

- [Преглед](../../../../examples/container-app)
- [Изисквания](../../../../examples/container-app)
- [Бързи примери](../../../../examples/container-app)
- [Примери за продукция](../../../../examples/container-app)
- [Напреднали шаблони](../../../../examples/container-app)
- [Най-добри практики](../../../../examples/container-app)

## Overview

Azure Container Apps е напълно управлявана безсървърна платформа за контейнери, която ви позволява да стартирате микросървиси и контейнеризирани приложения без да управлявате инфраструктурата. В комбинация с AZD получавате:

- **Оптимизирано внедряване**: Една команда разгръща контейнерите заедно с инфраструктурата
- **Автоматично мащабиране**: Мащабиране до нула и увеличаване според HTTP трафика или събития
- **Интегрирана мрежа**: Вградена откриваемост на услуги и разделяне на трафика
- **Управлявана идентичност**: Защитена автентикация към Azure ресурсите
- **Оптимизация на разходите**: Плащате само за ресурсите, които използвате

## Prerequisites

Преди да започнете, уверете се, че имате:

```bash
# Проверете инсталацията на AZD
azd version

# Проверете инсталацията на Azure CLI
az version

# Проверете Docker (за изграждане на персонализирани образи)
docker --version

# Влезте в Azure
azd auth login
az login
```

**Необходими Azure ресурси:**
- Активен абонамент в Azure
- Разрешения за създаване на група ресурси
- Достъп до среда на Container Apps

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Разгърнете базов REST API с Azure Container Apps.

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

**Стъпки за внедряване:**

```bash
# Инициализиране от шаблон
azd init --template todo-python-mongo

# Осигуряване на инфраструктура и разгръщане
azd up

# Тестване на разгръщането
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Ключови характеристики:**
- Автоматично мащабиране от 0 до 10 реплики
- Проверки за състоянието на услугата и проверки за живост
- Инжектиране на променливи на средата
- Интеграция с Application Insights

### 2. Node.js Express API

Разгърнете Node.js бекенд с интеграция с MongoDB.

```bash
# Инициализиране на шаблон за Node.js API
azd init --template todo-nodejs-mongo

# Конфигуриране на променливи на средата
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Разгръщане
azd up

# Преглед на логовете чрез Azure Monitor
azd monitor --logs
```

**Акценти в инфраструктурата:**
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

### 3. Static Frontend + API Backend

Разгърнете full-stack приложение с React фронтенд и API бекенд.

```bash
# Инициализиране на шаблон за пълен стек
azd init --template todo-csharp-sql-swa-func

# Преглед на конфигурацията
cat azure.yaml

# Разполагане на двете услуги
azd up

# Отваряне на приложението
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Пример 1: Микросървисна архитектура

**Сценарий**: Приложение за електронна търговия с множество микросървиси

**Структура на директориите:**
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

**Внедряване:**
```bash
# Инициализиране на проекта
azd init

# Задаване на продукционната среда
azd env new production

# Конфигуриране на продукционните настройки
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Разгръщане на всички услуги
azd up

# Наблюдение на разгръщането
azd monitor --overview
```

### Пример 2: Контейнерно приложение с AI

**Сценарий**: AI чат приложение с интеграция на Azure OpenAI

**Файл: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Използвайте управлявана идентичност за сигурен достъп
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Вземете ключа на OpenAI от Key Vault
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

**Команди за внедряване:**
```bash
# Настройте средата
azd init --template ai-chat-app
azd env new dev

# Конфигурирайте OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Разгърнете
azd up

# Тествайте API-то
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Пример 3: Фонов работник с обработка на опашка

**Сценарий**: Система за обработка на поръчки с опашка за съобщения

**Структура на директориите:**
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
            # Обработка на поръчка
            print(f"Processing order: {message.content}")
            
            # Пълно съобщение
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

**Внедряване:**
```bash
# Инициализирай
azd init

# Разгърни с конфигурацията на опашката
azd up

# Мащабирай работника според дължината на опашката
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### Модел 1: Blue-Green Deployment

```bash
# Създайте нова ревизия без трафик
azd deploy api --revision-suffix blue --no-traffic

# Тествайте новата ревизия
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Разпределете трафика (20% към синьото, 80% към текущата)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Пълно прехвърляне към синьото
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Модел 2: Canary Deployment with AZD

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

**Скрипт за внедряване:**
```bash
#!/bin/bash
# deploy-canary.sh

# Разгръщане на нова ревизия с 10% от трафика
azd deploy api --revision-mode multiple

# Наблюдение на метрики
azd monitor --service api --duration 5m

# Постепенно увеличаване на трафика
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Изчакайте 5 минути
done
```

### Модел 3: Multi-Region Deployment

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

**Внедряване:**
```bash
# Разгрънете във всички региони
azd up

# Проверете крайните точки
azd show --output json | jq '.services.api.endpoints'
```

### Модел 4: Dapr Integration

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

**Код на приложението с Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Запази състоянието
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Публикувай събитие
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Best Practices

### 1. Resource Organization

```bash
# Използвайте последователни конвенции за именуване
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Етикетирайте ресурсите за проследяване на разходите
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Security Best Practices

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

### 3. Performance Optimization

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

### 4. Monitoring and Observability

```bash
# Активирайте Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Прегледайте логовете в реално време
azd monitor --logs
# Или използвайте Azure CLI за Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Наблюдавайте метриките
azd monitor --live

# Създайте предупреждения
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# Мащабирайте до нула, когато не се използва
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Използвайте Spot инстанции за среди за разработка
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Настройте аларми за бюджет
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

**Пример с GitHub Actions:**
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
# Инициализиране на нов проект за контейнерно приложение
azd init --template <template-name>

# Разгръщане на инфраструктурата и приложението
azd up

# Разгръщане само на кода на приложението (пропуснете инфраструктурата)
azd deploy

# Осигуряване само на инфраструктурата
azd provision

# Преглед на разположените ресурси
azd show

# Поточно показване на логовете чрез azd monitor или Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Наблюдение на приложението
azd monitor --overview

# Почистване на ресурсите
azd down --force --purge
```

## Troubleshooting

### Проблем: Контейнерът не успява да стартира

```bash
# Проверете логовете с Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Прегледайте събитията на контейнера
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Тествайте локално
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Проблем: Не може да се осъществи достъп до endpoint на контейнерното приложение

```bash
# Проверете конфигурацията на ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Проверете дали вътрешният ingress е активиран
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Проблем: Проблеми с производителността

```bash
# Проверете използването на ресурсите
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Увеличете ресурсите
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Допълнителни ресурси и примери
- [Пример: Микросървиси](./microservices/README.md)
- [Пример: Simple Flash API](./simple-flask-api/README.md)
- [Документация за Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Галерия с шаблони за AZD](https://azure.github.io/awesome-azd/)
- [Примери за Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep шаблони](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Допринасяне

За да допринесете с нови примери за контейнерни приложения:

1. Създайте нова подпапка с вашия пример
2. Включете пълни файлове `azure.yaml`, `infra/` и `src/`
3. Добавете изчерпателен README с инструкции за внедряване
4. Тествайте внедряването с `azd up`
5. Изпратете pull request

---

**Нуждаете се от помощ?** Присъединете се към общността [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) за поддръжка и въпроси.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на услуга за превод с изкуствен интелект [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ в оригиналния си език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод от човешки преводач. Не поемаме отговорност за каквито и да било недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->