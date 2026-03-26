# Приклади розгортання контейнерних додатків за допомогою AZD

Ця директорія містить детальні приклади розгортання контейнеризованих додатків в Azure Container Apps за допомогою Azure Developer CLI (AZD). Ці приклади демонструють реальні патерни, найкращі практики та конфігурації, готові для продуктивного використання.

## 📚 Зміст

- [Огляд](#огляд)
- [Вимоги](#вимоги)
- [Приклади швидкого запуску](#приклади-швидкого-запуску)
- [Приклади для продуктивного використання](#приклади-для-продуктивного-використання)
- [Розширені патерни](#розширені-патерни)
- [Найкращі практики](#найкращі-практики)

## Огляд

Azure Container Apps — це повністю керована серверлесс платформа для контейнерів, яка дозволяє запускати мікросервіси та контейнеризовані додатки без управління інфраструктурою. У поєднанні з AZD ви отримуєте:

- **Спрощене розгортання**: Одинa команда для розгортання контейнерів з інфраструктурою
- **Автоматичне масштабування**: Масштабування до нуля і масштабування за HTTP-трафіком або подіями
- **Інтегроване мережеве взаємодія**: Вбудоване відкриття сервісів і розподіл трафіку
- **Керована ідентифікація**: Захищена аутентифікація до ресурсів Azure
- **Оптимізація вартості**: Оплата лише за використані ресурси

## Вимоги

Перед початком переконайтеся, що у вас є:

```bash
# Перевірка встановлення AZD
azd version

# Перевірка Azure CLI
az version

# Перевірка Docker (для створення власних образів)
docker --version

# Вхід в Azure
azd auth login
az login
```

**Необхідні ресурси Azure:**
- Активна підписка Azure
- Права на створення груп ресурсів
- Доступ до середовища Container Apps

## Приклади швидкого запуску

### 1. Простий Web API (Python Flask)

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
# Ініціалізувати з шаблону
azd init --template todo-python-mongo

# Забезпечити інфраструктуру та розгорнути
azd up

# Протестувати розгортання
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Ключові можливості:**
- Автоматичне масштабування від 0 до 10 реплік
- Перевірки здоров'я та живучості
- Інжекція змінних середовища
- Інтеграція з Application Insights

### 2. Node.js Express API

Розгорніть бекенд Node.js з інтеграцією MongoDB.

```bash
# Ініціалізувати шаблон API Node.js
azd init --template todo-nodejs-mongo

# Налаштувати змінні середовища
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Розгорнути
azd up

# Переглянути журнали через Azure Monitor
azd monitor --logs
```

**Особливості інфраструктури:**
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

### 3. Статичний фронтенд + API бекенд

Розгорніть повнофункціональний додаток з React фронтендом і API бекендом.

```bash
# Ініціалізувати шаблон повного стеку
azd init --template todo-csharp-sql-swa-func

# Переглянути конфігурацію
cat azure.yaml

# Розгорнути обидва сервіси
azd up

# Відкрити застосунок
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Приклади для продуктивного використання

### Приклад 1: Архітектура мікросервісів

**Сценарій**: E-commerce додаток з кількома мікросервісами

**Структура директорії:**
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

# Розгорнути всі сервіси
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
# Налаштувати середовище
azd init --template ai-chat-app
azd env new dev

# Налаштувати OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Розгорнути
azd up

# Протестувати API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Приклад 3: Фоновий воркер з обробкою черги

**Сценарій**: Система обробки замовлень з чергою повідомлень

**Структура директорії:**
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
# Ініціалізувати
azd init

# Розгорнути з конфігурацією черги
azd up

# Масштабувати робітника залежно від довжини черги
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Розширені патерни

### Патерн 1: Blue-Green розгортання

```bash
# Створити нову версію без трафіку
azd deploy api --revision-suffix blue --no-traffic

# Протестувати нову версію
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Розділити трафік (20% до синьої, 80% до поточної)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Повне переключення на синю
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Патерн 2: Canary розгортання з AZD

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

# Розгорнути нову версію з 10% трафіку
azd deploy api --revision-mode multiple

# Моніторинг метрик
azd monitor --service api --duration 5m

# Поступове збільшення трафіку
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Почекати 5 хвилин
done
```

### Патерн 3: Розгортання в декількох регіонах

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
# Розгорнути у всі регіони
azd up

# Перевірити кінцеві точки
azd show --output json | jq '.services.api.endpoints'
```

### Патерн 4: Інтеграція Dapr

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
# Використовуйте узгоджені конвенції найменування
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Позначайте ресурси для відстеження витрат
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Найкращі практики безпеки

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

### 4. Моніторинг та спостереження

```bash
# Увімкнути Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Переглядати журнали в режимі реального часу
azd monitor --logs
# Або використовуйте Azure CLI для Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Моніторинг метрик
azd monitor --live

# Створювати сповіщення
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Оптимізація вартості

```bash
# Масштабуйте до нуля, коли не використовується
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

## Загальні команди

```bash
# Ініціалізувати новий проект контейнерного додатка
azd init --template <template-name>

# Розгорнути інфраструктуру та додаток
azd up

# Розгорнути лише код додатка (пропустити інфраструктуру)
azd deploy

# Забезпечити лише інфраструктуру
azd provision

# Переглянути розгорнуті ресурси
azd show

# Потокове відображення логів за допомогою azd monitor або Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Моніторинг додатка
azd monitor --overview

# Очистити ресурси
azd down --force --purge
```

## Усунення неполадок

### Проблема: Контейнер не запускається

```bash
# Перевірте журнали за допомогою Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Перегляньте події контейнера
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Тестуйте локально
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Проблема: Не вдається отримати доступ до кінцевої точки контейнерного додатку

```bash
# Перевірити конфігурацію ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Перевірити, чи увімкнено внутрішній ingress
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
- [Простий Flash API приклад](./simple-flask-api/README.md)
- [Документація Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Галерея шаблонів AZD](https://azure.github.io/awesome-azd/)
- [Приклади Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep шаблони](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Внесок

Щоб додати нові приклади контейнерних додатків:

1. Створіть нову піддиректорію з вашим прикладом
2. Включіть повні файли `azure.yaml`, `infra/` та `src/`
3. Додайте докладний README з інструкціями з розгортання
4. Перевірте розгортання за допомогою `azd up`
5. Надішліть pull request

---

**Потрібна допомога?** Приєднуйтесь до спільноти [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) для підтримки та запитань.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, враховуйте, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->