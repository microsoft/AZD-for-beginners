# ឧទាហរណ៍ការដាក់បង្ហោះ Container App ជាមួយ AZD

ថតឯកសារនេះ មានឧទាហរណ៍ពេញលេញសម្រាប់ការដាក់បង្ហោះកម្មវិធីបោនទឺរ(containerized applications) ទៅ Azure Container Apps ដោយប្រើ Azure Developer CLI (AZD)។ ឧទាហរណ៍ទាំងនេះ បង្ហាញលំនាំក្នុងពិភពជាក់ស្ដែង ฝ្្្ best practices និងការកំណត់ដែលអាចប្រើបានក្នុងផលិតកម្ម។

## 📚 តារាងមាតិកា

- [ទិដ្ឋភាពទូទៅ](#overview)
- [តម្រូវការ​មុនចាប់ផ្តើម](#prerequisites)
- [ឧទាហរណ៍ចាប់ផ្តើមរហ័ស](#quick-start-examples)
- [ឧទាហរណ៍សម្រាប់ផលិតកម្ម](#production-examples)
- [លំនាំកម្រិតខ្ពស់](#advanced-patterns)
- [ការអនុវត្តល្អបំផុត](#best-practices)

## Overview

Azure Container Apps គឺជាវេទិកាកុងតឺន័រសេវាសេវាកម្ម (serverless) ដែលគ្រប់គ្រងពេញលេញ ដែលអនុញ្ញាតឱ្យអ្នករត់ microservices និងកម្មវិធីបោនទឺរ ដោយមិនចាំបាច់គ្រប់គ្រងហេដ្ឋារចនាសម្ព័ន្ធ។ ពេលរួមបញ្ចូលជាមួយ AZD អ្នកនឹងទទួលបាន៖

- **ការដាក់បង្ហោះដែលសាមញ្ញ**: ពាក្យបញ្ជាតែមួយដាក់បង្ហោះកុងតឺន័រជាមួយហេដ្ឋារចនាសម្ព័ន្ធ
- **ការលំហែកាយស្វ័យប្រវត្តិ**: លំហែកាយទៅសូន្យ និងពង្រីកទៅតាមចរាចរណ៍ HTTP ឬព្រឹត្តិការណ៍
- **បណ្តាញដែលក្លាយជាផ្នែកមួយ**: ការស្វែងរកសេវាកម្មក្នុងខ្លួន និងការបំបែកចរាចរណ៍
- **សភាពសម្គាល់ដែលគ្រប់គ្រង**: អត្តសញ្ញាណដែលមានសុវត្ថិភាពដើម្បី Authenticate ទៅកាន់ធនធាន Azure
- **ការបOptimize ថ្លៃចំណាយ**: បង់តែចំនួនធនធានដែលអ្នកប្រើប្រាស់

## Prerequisites

មុនចាប់ផ្តើម សូមប្រាកដថាអ្នកមាន៖

```bash
# ពិនិត្យការដំឡើង AZD
azd version

# ពិនិត្យ Azure CLI
az version

# ពិនិត្យ Docker (សម្រាប់បង្កើតរូបភាពផ្ទាល់ខ្លួន)
docker --version

# ផ្ទៀងផ្ទាត់អត្តសញ្ញាណសម្រាប់ការដាក់ចេញ AZD
azd auth login

# ជាជម្រើស: ចូលក្នុង Azure CLI ប្រសិនបើអ្នកគ្រោងនឹងរត់ពាក្យបញ្ជា az ដោយផ្ទាល់
az login
```

**ធនធាន Azure ที่ត្រូវការ៖**
- ការជាវ Azure ដែលសកម្ម
- សិទ្ធិในการបង្កើត resource group
- ការចូលប្រើបរិយាកាស Container Apps

## Quick Start Examples

### 1. Simple Web API (Python Flask)

ដាក់បង្ហោះ REST API មូលដ្ឋានជាមួយ Azure Container Apps។

**ឧទាហរណ៍៖ Python Flask API**

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

**ជំហានក្នុងការដាក់បង្ហោះ៖**

```bash
# ចាប់ផ្តើមពីគំរូ
azd init --template todo-python-mongo

# រៀបចំហេដ្ឋារចនាសម្ព័ន្ធ និងដាក់ឲ្យដំណើរការ
azd up

# សាកល្បងការដាក់ឲ្យដំណើរការ
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**លក្ខណៈសំខាន់៖**
- ការលំហែកាយស្វ័យប្រវត្តិពី 0 ទៅ 10 នៃចម្លង
- ការបង្ហាប់សុខភាព និងការត្រួតពិនិត្យភាពរស់
- ការចាក់បញ្ចូលអថេរបរិយាកាស
- ការរួមបញ្ចូលជាមួយ Application Insights

### 2. Node.js Express API

ដាក់បង្ហោះ backend Node.js ជាមួយការរួមបញ្ចូល MongoDB។

```bash
# ចាប់ផ្ដើមគំរូ API Node.js
azd init --template todo-nodejs-mongo

# កំណត់អថេរបរិស្ថាន
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ដាក់ប្រើ
azd up

# មើលកំណត់ហេតុតាម Azure Monitor
azd monitor --logs
```

**ចំណុចសំខាន់នៃហេដ្ឋារចនាសម្ព័ន្ធ៖**
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

ដាក់បង្ហោះកម្មវិធី full-stack ជាមួយ frontend React និង backend API។

```bash
# ចាប់ផ្តើមគំរូ full-stack
azd init --template todo-csharp-sql-swa-func

# ពិនិត្យការកំណត់
cat azure.yaml

# ដាក់ឲ្យដំណើរការ សេវាកម្មទាំងពីរ
azd up

# បើកកម្មវិធី
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**ស្ថានភាព**: កម្មវិធីអេឡិចត្រូនិក (E-commerce) ដែលមាន microservices ច្រើន

**រចនាសម្ព័ន្ធថតឯកសារ:**
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

**ការកំណត់ក្នុង azure.yaml:**
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

**ការដាក់បង្ហោះ:**
```bash
# ចាប់ផ្ដើមគម្រោង
azd init

# កំណត់បរិយាកាសផលិត
azd env new production

# កំណត់ការកំណត់សម្រាប់បរិយាកាសផលិត
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# បង្ហោះសេវាកម្មទាំងអស់
azd up

# តាមដានការបង្ហោះ
azd monitor --overview
```

### Example 2: AI-Powered Container App

**ស្ថានភាព**: កម្មវិធីជជែក AI ដែលរួមបញ្ចូល Microsoft Foundry Models

**File: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# ប្រើអត្តសញ្ញាណគ្រប់គ្រងសម្រាប់ការចូលប្រើយ៉ាងមានសុវត្ថិភាព
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # ទាញយកកូនសោ OpenAI ពី Key Vault
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

**File: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**File: infra/main.bicep**
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

**ពាក្យបញ្ជាដាក់បង្ហោះ:**
```bash
# រៀបចំបរិយាកាស
azd init --template ai-chat-app
azd env new dev

# កំណត់ค่า OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# ដាក់ឱ្យប្រើ
azd up

# សាកល្បង API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**ស្ថានភាព**: ប្រព័ន្ធដំណើរការបញ្ជាទិញជាមួយជួរបញ្ជូនសារ

**រចនាសម្ព័ន្ធថតឯកសារ:**
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

**File: src/worker/processor.py**
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
            # ដំណើរការការបញ្ជាទិញ
            print(f"Processing order: {message.content}")
            
            # បញ្ចប់សារ
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**File: azure.yaml**
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

**ការដាក់បង្ហោះ:**
```bash
# ចាប់ផ្តើម
azd init

# ដាក់ប្រើជាមួយការកំណត់ជួរ
azd up

# ពង្រីកកម្មករដោយផ្អែកលើប្រវែងជួរ
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
# បង្កើតកំណែថ្មីដោយគ្មានចរាចរណ៍
azd deploy api --revision-suffix blue --no-traffic

# សាកល្បងកំណែថ្មី
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# បំបែកចរាចរណ៍ (20% ទៅខៀវ, 80% ទៅបច្ចុប្បន្ន)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# ផ្លាស់ប្តូរពេញលេញទៅខៀវ
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: Canary Deployment with AZD

**File: .azure/dev/config.json**
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

**ស្គ្រីបដាក់បង្ហោះ:**
```bash
#!/bin/bash
# deploy-canary.sh

# ចេញផ្សាយកំណែថ្មីជាមួយចរាចរណ៍ 10%
azd deploy api --revision-mode multiple

# តាមដានមាត្រដ្ឋាន
azd monitor --service api --duration 5m

# បង្កើនចរាចរណ៍ដោយជំហាន
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # រង់ចាំ 5 នាទី
done
```

### Pattern 3: Multi-Region Deployment

**File: azure.yaml**
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

**File: infra/multi-region.bicep**
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

**ការដាក់បង្ហោះ:**
```bash
# ដាក់ចេញទៅតំបន់ទាំងអស់
azd up

# ផ្ទៀងផ្ទាត់ចំណុចបញ្ចប់
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Dapr Integration

**File: infra/app/dapr-enabled.bicep**
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

**កូដកម្មវិធីជាមួយ Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # រក្សាទុកស្ថានភាព
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # ផ្សព្វផ្សាយព្រឹត្តិការណ៍
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
# ប្រើគោលការណ៍ដាក់ឈ្មោះដែលមានភាពស្របគ្នា
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ដាក់ស្លាកលើធនធានសម្រាប់តាមដានការចំណាយ
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
# បើកប្រើ Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# មើលកំណត់ហេតុនៅពេលពិត
azd monitor --logs
# ឬប្រើ Azure CLI សម្រាប់ Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# តាមដានមេត្រិក
azd monitor --live

# បង្កើតការព្រមាន
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# កាត់ចុះទៅសូន្យនៅពេលមិនប្រើ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ប្រើ instance ប្រភេទ Spot សម្រាប់បរិយាកាសអភិវឌ្ឍន៍
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# កំណត់ការជូនដំណឹងអំពីថវិកា
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

**ឧទាហរណ៍ GitHub Actions:**
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
# ចាប់ផ្តើមគម្រោងកម្មវិធី Container ថ្មី
azd init --template <template-name>

# ដាក់ឲ្យដំណើរការ រចនាសម្ព័ន្ធ និងកម្មវិធី
azd up

# ដាក់ឲ្យដំណើរការ កូដកម្មវិធី តែប៉ុណ្ណោះ (លើកលែងរចនាសម្ព័ន្ធ)
azd deploy

# រៀបចំ រចនាសម្ព័ន្ធ តែប៉ុណ្ណោះ
azd provision

# មើលធនធានដែលបានដាក់ឲ្យដំណើរការ
azd show

# ផ្សាយបន្តកំណត់ហេតុ ដោយប្រើ azd monitor ឬ Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# ត្រួតពិនិត្យកម្មវិធី
azd monitor --overview

# សម្អាតធនធាន
azd down --force --purge
```

## Troubleshooting

### បញ្ហា៖ កុងតឺន័របរាជ័យក្នុងការចាប់ផ្តើម

```bash
# ពិនិត្យកំណត់ហេតុដោយប្រើ Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# មើលព្រឹត្តិការណ៍របស់កុងតឺន័រ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# សាកល្បងនៅក្នុងម៉ាស៊ីនក្នុងស្រុក
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### បញ្ហា៖ មិនអាចចូលដល់ endpoint នៃ container app

```bash
# ផ្ទៀងផ្ទាត់ការកំណត់ ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ពិនិត្យថា ingress ផ្ទៃខាងក្នុងត្រូវបានបើកឬទេ
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### បញ្ហា៖ ប្រសិទ្ធភាពជួបបញ្ហា

```bash
# ពិនិត្យការប្រើប្រាស់ធនធាន
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# បង្កើនធនធាន
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## ធនធានបន្ថែម និងឧទាហរណ៍
- [ឧទាហរណ៍ Microservices](./microservices/README.md)
- [ឧទាហរណ៍ Simple Flash API](./simple-flask-api/README.md)
- [ឯកសារ Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [គំរូ Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [ទំរង Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

ដើម្បីរួមចំណែកឧទាហរណ៍ container app ថ្មី សូមអនុវត្ត៖

1. បង្កើតថតផ្នែកនៅក្រោមជាមួយឧទាហរណ៍របស់អ្នក
2. រួមបញ្ចូល `azure.yaml`, `infra/`, និង `src/` ឯកសារពេញលេញ
3. បន្ថែម README ពេញលេញជាមួយការណែនាំក្នុងការដាក់បង្ហោះ
4. សាកល្បងការដាក់បង្ហោះជាមួយ `azd up`
5. ដាក់ស្នើ pull request

---

**ត្រូវការជំនួយ?** ចូលរួមសហគមន៍ [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) សម្រាប់ការគាំទ្រ និងសំណួរ។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការមិនទទួលខុសត្រូវ**:
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាបកប្រែបញ្ញាសិប្បនិម្មិត [Co-op Translator](https://github.com/Azure/co-op-translator). ទោះបីយើងខិតខំសម្រាប់ភាពត្រឹមត្រូវ ក៏ដោយ សូមយល់ថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬភាពខុសឆ្គង។ ឯកសារដើមក្នុងភាសាដើមគួរត្រូវបានចាត់ទុកថាជាប្រភពផ្លូវការ។ សម្រាប់ព័ត៌មានសំខាន់ៗ យើងផ្តល់អនុសាសន៍ឱ្យប្រើប្រាស់ការបកប្រែដោយអ្នកជំនាញមនុស្សវិជ្ជាជីវៈ។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសណាមួយ ដែលកើតឡើងពីការប្រើប្រាស់ការបកប្រែនេះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->