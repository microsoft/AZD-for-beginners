# Примери деплоја контейнер апликација са AZD

Овај директоријум садржи свеобухватне примере за деплојмент контейнеризованих апликација у Azure Container Apps користећи Azure Developer CLI (AZD). Ови примери показују реалне шаблоне, најбоље праксе и конфигурације спремне за продукцију.

## 📚 Садржај

- [Преглед](#преглед)
- [Захтеви](#захтеви)
- [Брзи примери](#брзи-примери)
- [Примери за продукцију](#примери-за-продукцију)
- [Напредни узорци](#напредни-узорци)
- [Најбоље праксе](#најбоље-праксе)

## Преглед

Azure Container Apps је у потпуности управљана серверлесс платформа за контејнере која вам омогућава да покрећете микросервисе и контейнеризоване апликације без управљања инфраструктуром. У комбинацији са AZD добијате:

- **Поједностављено деплојање**: Једна команда деплојује контејнере са инфраструктуром
- **Аутоматско скалирање**: Скалирање до нуле и ширење у складу са HTTP саобраћајем или догађајима
- **Интегрисано умрежавање**: Уграђено откривање сервиса и раздвајање саобраћаја
- **Managed Identity**: Сигурна аутентикација према Azure ресурсима
- **Оптимизација трошкова**: Платите само за ресурсе које користите

## Захтеви

Пре почетка, уверите се да имате:

```bash
# Проверите инсталацију AZD
azd version

# Проверите Azure CLI
az version

# Проверите Docker (за изградњу прилагођених слика)
docker --version

# Аутентификујте се за AZD распоређивања
azd auth login

# Опционо: пријавите се у Azure CLI ако планирате да директно покрећете az команде
az login
```

**Потребни Azure ресурси:**
- Активна Azure претплата
- Doзволе за креирање ресурс групе
- Приступ окружењу Container Apps

## Брзи примери

### 1. Једноставан веб API (Python Flask)

Деплојујте основни REST API помоћу Azure Container Apps.

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

**Кораци за деплој:**

```bash
# Иницијализуј из шаблона
azd init --template todo-python-mongo

# Обезбеди инфраструктуру и размешти
azd up

# Тестирај размештање
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Кључне карактеристике:**
- Аутоматско скалирање од 0 до 10 реплика
- Провере здравља и провере доступности (liveness)
- Инјекција променљивих окружења
- Интеграција са Application Insights

### 2. Node.js Express API

Деплојујте Node.js бекенд са интеграцијом MongoDB-а.

```bash
# Иницијализујте шаблон Node.js API-ја
azd init --template todo-nodejs-mongo

# Конфигуришите променљиве окружења
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Размештите
azd up

# Прегледајте логове помоћу Azure Monitor-а
azd monitor --logs
```

**Главне карактеристике инфраструктуре:**
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

### 3. Статички фронтенд + API бекенд

Деплојујте full-stack апликацију са React фронтендом и API бекендом.

```bash
# Иницијализујте фул-стек шаблон
azd init --template todo-csharp-sql-swa-func

# Прегледајте конфигурацију
cat azure.yaml

# Разместите оба сервиса
azd up

# Отворите апликацију
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Примери за продукцију

### Пример 1: Архитектура микросервиса

**Сценарио**: Апликација за е-трговину са више микросервиса

**Структура директоријума:**
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

**Конфигурација azure.yaml:**
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

**Деплој:**
```bash
# Иницијализуј пројекат
azd init

# Постави производно окружење
azd env new production

# Конфигуриши производна подешавања
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Размешти све услуге
azd up

# Надгледај распоређивање
azd monitor --overview
```

### Пример 2: AI-покретана контейнер апликација

**Сценарио**: AI чат апликација са интеграцијом Microsoft Foundry модела

**Фајл: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Користите управљани идентитет за безбедан приступ
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Добијте OpenAI кључ из Key Vault-а
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

**Фајл: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Фајл: infra/main.bicep**
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

**Команде за деплој:**
```bash
# Подесити окружење
azd init --template ai-chat-app
azd env new dev

# Конфигурисати OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Распоредити
azd up

# Тестирати АПИ
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Пример 3: Позадински радник са обрадом реда

**Сценарио**: Систем за обраду поруџбина са редом порука

**Структура директоријума:**
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

**Фајл: src/worker/processor.py**
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
            # Редослед обраде
            print(f"Processing order: {message.content}")
            
            # Цела порука
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Фајл: azure.yaml**
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

**Деплој:**
```bash
# Иницијализуј
azd init

# Распореди са конфигурацијом реда
azd up

# Скалирај радника у зависности од дужине реда
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Напредни узорци

### Узорак 1: Blue-Green деплој

```bash
# Креирај нову ревизију без саобраћаја
azd deploy api --revision-suffix blue --no-traffic

# Тестирај нову ревизију
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Подели саобраћај (20% ка плавој, 80% ка текућој)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Потпуно пребацивање на плаву
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Узорак 2: Canary деплој са AZD

**Фајл: .azure/dev/config.json**
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

**Скрипта за деплој:**
```bash
#!/bin/bash
# deploy-canary.sh

# Размести нову ревизију са 10% саобраћаја
azd deploy api --revision-mode multiple

# Прати метрике
azd monitor --service api --duration 5m

# Повећај саобраћај постепено
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Сачекај 5 минута
done
```

### Узорак 3: Деплој у више региона

**Фајл: azure.yaml**
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

**Фајл: infra/multi-region.bicep**
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

**Деплој:**
```bash
# Распоредити на све регионе
azd up

# Проверити крајње тачке
azd show --output json | jq '.services.api.endpoints'
```

### Узорак 4: Интеграција са Dapr

**Фајл: infra/app/dapr-enabled.bicep**
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

**Код апликације са Dapr-ом:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Сачувај стање
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Објави догађај
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Најбоље праксе

### 1. Организација ресурса

```bash
# Користите доследне конвенције именовања
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Означите ресурсе ради праћења трошкова
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Најбоље безбедносне праксе

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

### 3. Оптимизација перформанси

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

### 4. Надгледање и опсервабилност

```bash
# Омогућите Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Прегледајте логове у реалном времену
azd monitor --logs
# Или користите Azure CLI за Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Пратите метрике
azd monitor --live

# Креирајте упозорења
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Оптимизација трошкова

```bash
# Скалирај на нулу када није у употреби
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Користи спот инстанце за развојна окружења
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Подеси упозорења о буџету
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Интеграција CI/CD

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

## Референца за уобичајене команде

```bash
# Иницијализуј нови пројекат контейнерске апликације
azd init --template <template-name>

# Распореди инфраструктуру и апликацију
azd up

# Распореди само код апликације (прескочи инфраструктуру)
azd deploy

# Постави само инфраструктуру
azd provision

# Прегледај распоређене ресурсе
azd show

# Стримуј логове помоћу azd monitor или Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Надгледај апликацију
azd monitor --overview

# Очисти ресурсе
azd down --force --purge
```

## Решавање проблема

### Проблем: Контејнер не успева да се покрене

```bash
# Проверите логове помоћу Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Погледајте догађаје контејнера
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Тестирајте локално
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Проблем: Не могу да приступим ендпоинту контейнер апликације

```bash
# Проверите конфигурацију ингреса
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Проверите да ли је интерни ингрес омогућен
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Проблем: Проблеми са перформансама

```bash
# Проверите искоришћеност ресурса
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Повећајте ресурсе
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Додатни ресурси и примери
- [Пример микросервиса](./microservices/README.md)
- [Пример једноставног Flask API-ја](./simple-flask-api/README.md)
- [Документација за Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Галерија AZD шаблона](https://azure.github.io/awesome-azd/)
- [Примери Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep шаблони](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Како допринети

Да бисте допринели новим примерима контейнер апликација:

1. Креирајте нови поддиректоријум са вашим примером
2. Укључите потпун `azure.yaml`, `infra/` и `src/` фајлове
3. Додајте детаљан README са упутствима за деплој
4. Тестирајте деплој са `azd up`
5. Пошаљите pull request

---

**Треба помоћ?** Придружите се заједници [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) за подршку и питања.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ограничење одговорности**:
Овај документ је преведен помоћу AI услуге за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да будемо прецизни, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Изворни документ на свом оригиналном језику треба сматрати коначним и ауторитетним извором. За критичне информације препоручује се професионални превод од стране људског преводиоца. Не сносимо одговорност за било какве неспоразуме или погрешне тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->