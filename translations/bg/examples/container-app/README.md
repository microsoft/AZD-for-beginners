<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-23T19:14:43+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "bg"
}
-->
# Примери за разгръщане на контейнерни приложения с AZD

Тази директория съдържа изчерпателни примери за разгръщане на контейнеризирани приложения в Azure Container Apps с помощта на Azure Developer CLI (AZD). Примерите демонстрират реални модели, добри практики и конфигурации, готови за производство.

## 📚 Съдържание

- [Общ преглед](../../../../examples/container-app)
- [Предварителни условия](../../../../examples/container-app)
- [Бързи примери за стартиране](../../../../examples/container-app)
- [Примери за производство](../../../../examples/container-app)
- [Разширени модели](../../../../examples/container-app)
- [Добри практики](../../../../examples/container-app)

## Общ преглед

Azure Container Apps е напълно управлявана сървърна платформа за контейнери, която ви позволява да стартирате микросървиси и контейнеризирани приложения без управление на инфраструктурата. В комбинация с AZD получавате:

- **Опростено разгръщане**: Една команда разгръща контейнери с инфраструктура
- **Автоматично мащабиране**: Мащабиране до нула и разширяване според HTTP трафик или събития
- **Интегрирана мрежа**: Вградено откриване на услуги и разделяне на трафика
- **Управлявана идентичност**: Сигурна автентикация към Azure ресурси
- **Оптимизация на разходите**: Плащате само за използваните ресурси

## Предварителни условия

Преди да започнете, уверете се, че разполагате с:

```bash
# Проверете инсталацията на AZD
azd version

# Проверете Azure CLI
az version

# Проверете Docker (за създаване на персонализирани изображения)
docker --version

# Влезте в Azure
azd auth login
az login
```

**Необходими Azure ресурси:**
- Активен Azure абонамент
- Разрешения за създаване на ресурсни групи
- Достъп до среда за Container Apps

## Бързи примери за стартиране

### 1. Прост Web API (Python Flask)

Разгръщане на основен REST API с Azure Container Apps.

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

**Стъпки за разгръщане:**

```bash
# Инициализиране от шаблон
azd init --template todo-python-mongo

# Осигуряване на инфраструктура и разгръщане
azd up

# Тестване на разгръщането
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Основни характеристики:**
- Автоматично мащабиране от 0 до 10 реплики
- Проверки за здраве и живост
- Инжектиране на променливи на средата
- Интеграция с Application Insights

### 2. Node.js Express API

Разгръщане на Node.js бекенд с интеграция на MongoDB.

```bash
# Инициализирайте шаблон за API на Node.js
azd init --template todo-nodejs-mongo

# Конфигурирайте променливите на средата
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Разгърнете
azd up

# Прегледайте дневниците
azd logs api
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

### 3. Статичен фронтенд + API бекенд

Разгръщане на пълноценна апликация с React фронтенд и API бекенд.

```bash
# Инициализирайте шаблон за пълен стек
azd init --template todo-csharp-sql-swa-func

# Прегледайте конфигурацията
cat azure.yaml

# Разгърнете и двете услуги
azd up

# Отворете приложението
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Примери за производство

### Пример 1: Архитектура на микросървиси

**Сценарий**: Електронна търговия с множество микросървиси

**Структура на директорията:**
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

**Конфигурация в azure.yaml:**
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

**Разгръщане:**
```bash
# Инициализиране на проекта
azd init

# Задаване на производствена среда
azd env new production

# Конфигуриране на производствени настройки
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

# Използвайте Управлявана Идентичност за сигурен достъп
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Вземете ключ за OpenAI от Key Vault
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

**Команди за разгръщане:**
```bash
# Настройте средата
azd init --template ai-chat-app
azd env new dev

# Конфигурирайте OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Разгърнете
azd up

# Тествайте API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Пример 3: Фонов работник с обработка на опашки

**Сценарий**: Система за обработка на поръчки с опашка за съобщения

**Структура на директорията:**
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
            # Обработване на поръчка
            print(f"Processing order: {message.content}")
            
            # Завършване на съобщение
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

**Разгръщане:**
```bash
# Инициализиране
azd init

# Разгръщане с конфигурация на опашката
azd up

# Скалиране на работника въз основа на дължината на опашката
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Разширени модели

### Модел 1: Blue-Green разгръщане

```bash
# Създайте нова ревизия без трафик
azd deploy api --revision-suffix blue --no-traffic

# Тествайте новата ревизия
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Разделете трафика (20% към синьо, 80% към текущо)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Пълно прехвърляне към синьо
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Модел 2: Canary разгръщане с AZD

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

**Скрипт за разгръщане:**
```bash
#!/bin/bash
# deploy-canary.sh

# Разгърнете нова ревизия с 10% трафик
azd deploy api --revision-mode multiple

# Наблюдавайте метриките
azd monitor --service api --duration 5m

# Увеличете трафика постепенно
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Изчакайте 5 минути
done
```

### Модел 3: Разгръщане в множество региони

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

**Разгръщане:**
```bash
# Разпределете във всички региони
azd up

# Проверете крайните точки
azd show --output json | jq '.services.api.endpoints'
```

### Модел 4: Интеграция с Dapr

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

**Код на приложение с Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Запазване на състоянието
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Публикуване на събитие
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Добри практики

### 1. Организация на ресурсите

```bash
# Използвайте последователни конвенции за именуване
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Маркирайте ресурсите за проследяване на разходите
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Най-добри практики за сигурност

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

### 3. Оптимизация на производителността

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

### 4. Мониторинг и наблюдение

```bash
# Активиране на Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Преглед на логовете в реално време
azd logs api --follow

# Наблюдение на метрики
azd monitor --service api

# Създаване на известия
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Оптимизация на разходите

```bash
# Скалирайте до нула, когато не се използва
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Използвайте spot инстанции за развойни среди
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Настройте известия за бюджет
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Интеграция на CI/CD

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

## Справка за често използвани команди

```bash
# Инициализиране на нов проект за контейнерно приложение
azd init --template <template-name>

# Разгръщане на инфраструктура и приложение
azd up

# Разгръщане само на код на приложението (пропускане на инфраструктурата)
azd deploy

# Осигуряване само на инфраструктура
azd provision

# Преглед на разположените ресурси
azd show

# Поточно предаване на дневници
azd logs <service-name> --follow

# Наблюдение на приложението
azd monitor --overview

# Почистване на ресурси
azd down --force --purge
```

## Отстраняване на проблеми

### Проблем: Контейнерът не стартира

```bash
# Проверете логовете
azd logs api --tail 100

# Прегледайте събитията на контейнера
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Тествайте локално
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Проблем: Не може да се достъпи крайна точка на контейнерното приложение

```bash
# Проверете конфигурацията на входа
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Проверете дали вътрешният вход е активиран
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Проблем: Проблеми с производителността

```bash
# Проверете използването на ресурси
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
- [Пример за микросървиси](./microservices/README.md)
- [Пример за прост Flash API](./simple-flask-api/README.md)
- [Документация за Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Галерия с шаблони на AZD](https://azure.github.io/awesome-azd/)
- [Примери за Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Шаблони на Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Принос

За да добавите нови примери за контейнерни приложения:

1. Създайте нова поддиректория с вашия пример
2. Включете пълни файлове `azure.yaml`, `infra/` и `src/`
3. Добавете изчерпателен README с инструкции за разгръщане
4. Тествайте разгръщането с `azd up`
5. Изпратете pull request

---

**Нуждаете се от помощ?** Присъединете се към общността [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) за подкрепа и въпроси.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да било недоразумения или погрешни интерпретации, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->