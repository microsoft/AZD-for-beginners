# Примери деплоја Container App помоћу AZD

Овај директоријум садржи свеобухватне примере за деплој контейнеризованих апликација на Azure Container Apps уз помоћ Azure Developer CLI (AZD). Ови примери показују реалне сценарије, најбоље праксе и конфигурације спремне за продукцију.

## 📚 Садржај

- [Преглед](#overview)
- [Претходни захтеви](#prerequisites)
- [Брзи примери за покретање](#quick-start-examples)
- [Примери за продукцију](#production-examples)
- [Напредни обрасци](#advanced-patterns)
- [Најбоље праксе](#best-practices)

## Overview

Azure Container Apps је потпуно управљана serverless платформа за контејнере која вам омогућава да покрећете микросервисе и контейнеризоване апликације без управљања инфраструктуром. У комбинацији са AZD, добијате:

- **Поједностављено деплојање**: Једна команда деплојује контејнере са инфраструктуром
- **Аутоматско скалирање**: Скалирање до нуле и скалирање на основу HTTP саобраћаја или догађаја
- **Интегрисано умрежавање**: Уграђено откривање сервиса и поделa саобраћаја
- **Управљани идентитет**: Безбедна аутентификација према Azure ресурсима
- **Оптимизација трошкова**: Платите само за ресурсе које користите

## Prerequisites

Пре него што почнете, уверите се да имате:

```bash
# Провери инсталацију AZD
azd version

# Провери Azure CLI
az version

# Провери Docker (за изградњу прилагођених слика)
docker --version

# Пријави се у Azure
azd auth login
az login
```

**Потребни Azure ресурси:**
- Активан Azure претплатни рачун
- Дозволе за креирање ресурсних група
- Приступ окружењу Container Apps

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Деплојујте основни REST API са Azure Container Apps.

**Example: Python Flask API**

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

**Степени деплоја:**

```bash
# Иницијализуј из шаблона
azd init --template todo-python-mongo

# Обезбеди инфраструктуру и размешти
azd up

# Тестирај распоређивање
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Кључне карактеристике:**
- Аутоматско скалирање од 0 до 10 реплика
- Провере здравља и ливнесс провере
- Убацивање променљивих окружења
- Интеграција са Application Insights

### 2. Node.js Express API

Деплојујте Node.js бекенд са интеграцијом MongoDB.

```bash
# Иницијализујте Node.js API шаблон
azd init --template todo-nodejs-mongo

# Конфигуришите променљиве окружења
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Размештите
azd up

# Прегледајте логове помоћу Azure Monitor-а
azd monitor --logs
```

**Истакнута инфраструктура:**
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

Деплојујте full-stack апликацију са React фронтендом и API бекендом.

```bash
# Иницијализуј шаблон фул-стек
azd init --template todo-csharp-sql-swa-func

# Прегледај конфигурацију
cat azure.yaml

# Распореди обе услуге
azd up

# Отвори апликацију
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**Сценарио**: E-commerce апликација са више микросервиса

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

**azure.yaml конфигурација:**
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

# Постави продукционо окружење
azd env new production

# Конфигуриши продукциона подешавања
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Размешти све услуге
azd up

# Надгледај распоређивање
azd monitor --overview
```

### Example 2: AI-Powered Container App

**Сценарио**: AI чат апликација са интеграцијом Microsoft Foundry модела

**Фајл: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Користите управљани идентитет за сигуран приступ
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Преузмите OpenAI кључ из складишта кључева
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
# Поставити окружење
azd init --template ai-chat-app
azd env new dev

# Конфигурисати OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Разместити
azd up

# Тестирати АПИ
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**Сценарио**: Систем за обраду поруџбина са порукама у реду

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
            # Обради наруџбину
            print(f"Processing order: {message.content}")
            
            # Заврши поруку
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

# Размести са конфигурацијом реда
azd up

# Прилагоди број радника у зависности од дужине реда
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### Pattern 1: Blue-Green Deployment

```bash
# Креирај нову ревизију без саобраћаја
azd deploy api --revision-suffix blue --no-traffic

# Тестирај нову ревизију
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Подели саобраћај (20% ка плавој, 80% ка тренутној)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Потпуни прелаз на плаву
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: Canary Deployment with AZD

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

# Распореди нову ревизију са 10% саобраћаја
azd deploy api --revision-mode multiple

# Надгледај метрике
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

### Pattern 3: Multi-Region Deployment

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
# Разместити у све регионе
azd up

# Проверити крајње тачке
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Dapr Integration

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

**Апликациони код са Dapr-ом:**
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

## Best Practices

### 1. Организација ресурса

```bash
# Користите доследне конвенције именовања
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Означите ресурсе за праћење трошкова
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Најбоље праксе за безбедност

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

### 4. Надгледање и посматрање

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

# Постави обавештења о буџету
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD интеграција

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
# Иницијализуј нови пројекат контейнерске апликације
azd init --template <template-name>

# Размешти инфраструктуру и апликацију
azd up

# Размешти само код апликације (прескочи инфраструктуру)
azd deploy

# Обезбеди само инфраструктуру
azd provision

# Погледај распоређене ресурсе
azd show

# Стримуј логове користећи azd monitor или Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Надгледај апликацију
azd monitor --overview

# Очисти ресурсе
azd down --force --purge
```

## Troubleshooting

### Проблем: Контейнер не успева да стартује

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

### Проблем: Не може да приступи endpoint-у контейнер апликације

```bash
# Проверите конфигурацију ингреса
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Проверите да ли је унутрашњи ингрес омогућен
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Проблем: Проблеми са перформансама

```bash
# Провери употребу ресурса
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Повећај ресурсе
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Додатни ресурси и примери
- [Microservices Example](./microservices/README.md)
- [Simple Flash API Example](./simple-flask-api/README.md)
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Container Apps Samples](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

Да бисте допринели новим примерима за container app:

1. Креирајте нови поддиректоријум са вашим примером
2. Укључите комплетан `azure.yaml`, `infra/`, и `src/` фајлове
3. Додајте детаљан README са упутствима за деплој
4. Тестирајте деплој са `azd up`
5. Пошаљите pull request

---

**Need Help?** Придружите се заједници [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) за подршку и питања.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен помоћу услуге за превођење засноване на вештачкој интелигенцији [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да будемо прецизни, имајте на уму да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која проистекну из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->