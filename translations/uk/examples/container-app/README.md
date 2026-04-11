# Приклади розгортання контейнерних додатків за допомогою AZD

Цей каталог містить комплексні приклади розгортання контейнеризованих додатків в Azure Container Apps з використанням Azure Developer CLI (AZD). Ці приклади демонструють реальні шаблони, найкращі практики та готові до продуктивного використання конфігурації.

## 📚 Зміст

- [Огляд](#огляд)
- [Вимоги](#вимоги)
- [Приклади швидкого запуску](#приклади-швидкого-запуску)
- [Приклади для продакшену](#приклади-для-продакшену)
- [Розширені шаблони](#розширені-шаблони)
- [Найкращі практики](#найкращі-практики)

## Огляд

Azure Container Apps — це повністю керована серверлес-контейнерна платформа, яка дозволяє запускати мікросервіси та контейнеризовані додатки без керування інфраструктурою. У поєднанні з AZD ви отримуєте:

- **Спрощене розгортання**: одна команда для розгортання контейнерів з інфраструктурою
- **Автоматичне масштабування**: масштабування до нуля та масштабування залежно від HTTP-трафіку або подій
- **Інтегровані мережеві можливості**: вбудоване виявлення сервісів та розподіл трафіку
- **Керована ідентичність**: безпечна аутентифікація до ресурсів Azure
- **Оптимізація витрат**: сплачуйте лише за використані ресурси

## Вимоги

Перед початком переконайтеся, що у вас є:

```bash
# Перевірити встановлення AZD
azd version

# Перевірити Azure CLI
az version

# Перевірити Docker (для створення власних образів)
docker --version

# Аутентифікація для розгортань AZD
azd auth login

# Опціонально: увійти в Azure CLI, якщо плануєте запускати команди az безпосередньо
az login
```

**Необхідні ресурси Azure:**
- Активна підписка Azure
- Дозволи на створення груп ресурсів
- Доступ до середовища Container Apps

## Приклади швидкого запуску

### 1. Простий веб-API (Python Flask)

Розгорніть базовий REST API з Azure Container Apps.

**Приклад: Python Flask API**

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

**Кроки розгортання:**

```bash
# Ініціалізація з шаблону
azd init --template todo-python-mongo

# Забезпечення інфраструктури та розгортання
azd up

# Тестування розгортання
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Основні функції:**
- Автоматичне масштабування від 0 до 10 реплік
- Перевірки стану та живучості
- Впровадження змінних оточення
- Інтеграція з Application Insights

### 2. Node.js Express API

Розгорніть бекенд на Node.js з інтеграцією MongoDB.

```bash
# Ініціалізація шаблону API Node.js
azd init --template todo-nodejs-mongo

# Налаштування змінних середовища
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Розгортання
azd up

# Перегляд журналів через Azure Monitor
azd monitor --logs
```

**Основні моменти інфраструктури:**
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

### 3. Статичний фронтенд + API-бекенд

Розгорніть повноцінний додаток з React-фронтендом та API-бекендом.

```bash
# Ініціалізація шаблону full-stack
azd init --template todo-csharp-sql-swa-func

# Перевірте конфігурацію
cat azure.yaml

# Розгорніть обидва сервіси
azd up

# Відкрийте додаток
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Приклади для продакшену

### Приклад 1: Архітектура мікросервісів

**Сценарій**: електронна комерція з кількома мікросервісами

**Структура каталогу:**
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

**Конфігурація azure.yaml:**
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

**Розгортання:**
```bash
# Ініціалізувати проект
azd init

# Встановити виробниче середовище
azd env new production

# Налаштувати параметри виробництва
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Розгорнути всі служби
azd up

# Моніторинг розгортання
azd monitor --overview
```

### Приклад 2: AI-контейнерний додаток

**Сценарій**: AI чат-додаток з інтеграцією Microsoft Foundry Models

**Файл: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Використовуйте керовану ідентичність для безпечного доступу
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Отримайте ключ OpenAI з Key Vault
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

**Команди розгортання:**
```bash
# Налаштувати оточення
azd init --template ai-chat-app
azd env new dev

# Налаштувати OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Розгорнути
azd up

# Тестувати API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Приклад 3: Фоновий воркер з обробкою черги

**Сценарій**: система обробки замовлень з чергою повідомлень

**Структура каталогу:**
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
            # Обробити замовлення
            print(f"Processing order: {message.content}")
            
            # Повідомлення завершено
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

**Розгортання:**
```bash
# Ініціалізація
azd init

# Розгортання з конфігурацією черги
azd up

# Масштабувати робітника залежно від довжини черги
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Розширені шаблони

### Шаблон 1: Blue-Green розгортання

```bash
# Створити нову ревізію без трафіку
azd deploy api --revision-suffix blue --no-traffic

# Протестувати нову ревізію
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Поділити трафік (20% до синього, 80% до поточного)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Повний перехід на синій
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Шаблон 2: Canary розгортання з AZD

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

**Скрипт розгортання:**
```bash
#!/bin/bash
# deploy-canary.sh

# Розгорнути нову ревізію з 10% трафіку
azd deploy api --revision-mode multiple

# Моніторинг метрик
azd monitor --service api --duration 5m

# Поступово збільшувати трафік
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Чекати 5 хвилин
done
```

### Шаблон 3: Розгортання у кількох регіонах

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

**Розгортання:**
```bash
# Розгорнути у всіх регіонах
azd up

# Перевірити кінцеві точки
azd show --output json | jq '.services.api.endpoints'
```

### Шаблон 4: Інтеграція Dapr

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

**Код додатка з Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Зберегти стан
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Опублікувати подію
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Найкращі практики

### 1. Організація ресурсів

```bash
# Використовуйте узгоджені конвенції найменувань
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Позначайте ресурси для відстеження витрат
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Безпека

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

### 3. Оптимізація продуктивності

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

### 4. Моніторинг і спостережливість

```bash
# Увімкнути Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Переглядати журнали в режимі реального часу
azd monitor --logs
# Або використовуйте Azure CLI для Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Моніторинг метрик
azd monitor --live

# Створити сповіщення
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Оптимізація витрат

```bash
# Масштабувати до нуля, коли не використовується
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Використовуйте спотові інстанси для середовищ розробки
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Налаштуйте сповіщення про бюджет
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Інтеграція CI/CD

**Приклад GitHub Actions:**
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

## Довідник основних команд

```bash
# Ініціалізувати новий проект контейнерного застосунку
azd init --template <template-name>

# Розгорнути інфраструктуру та застосунок
azd up

# Розгорнути лише код застосунку (пропустити інфраструктуру)
azd deploy

# Забезпечити тільки інфраструктуру
azd provision

# Переглянути розгорнуті ресурси
azd show

# Передавати журнали за допомогою azd monitor або Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Моніторинг застосунку
azd monitor --overview

# Очистити ресурси
azd down --force --purge
```

## Вирішення проблем

### Проблема: Контейнер не запускається

```bash
# Перевірте журнали за допомогою Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Перегляд подій контейнера
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Тестування локально
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Проблема: Не вдається отримати доступ до кінцевої точки контейнерного додатка

```bash
# Перевірте конфігурацію входу
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Перевірте, чи увімкнено внутрішній вхід
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Проблема: Проблеми з продуктивністю

```bash
# Перевірити використання ресурсів
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Масштабувати ресурси вгору
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Додаткові ресурси та приклади
- [Приклад мікросервісів](./microservices/README.md)
- [Приклад простого Flask API](./simple-flask-api/README.md)
- [Документація Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Галерея шаблонів AZD](https://azure.github.io/awesome-azd/)
- [Приклади Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Шаблони Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Участь у проєкті

Щоб додати нові приклади контейнерних додатків:

1. Створіть новий підкаталог із вашим прикладом
2. Додайте повні файли `azure.yaml`, `infra/` та `src/`
3. Додайте розгорнутий README з інструкціями з розгортання
4. Перевірте розгортання за допомогою `azd up`
5. Надішліть pull request

---

**Потрібна допомога?** Приєднуйтесь до спільноти [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) для підтримки та питань.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу штучного інтелекту [Co-op Translator](https://github.com/Azure/co-op-translator). Незважаючи на наші зусилля забезпечити точність, будь ласка, майте на увазі, що автоматизовані переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->