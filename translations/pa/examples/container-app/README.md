# AZD ਨਾਲ Container App ਡਿਪਲੋਇਮੈਂਟ ਉਦਾਹਰਨਾਂ

ਇਹ ਡਾਇਰੈਕਟਰੀ Azure Developer CLI (AZD) ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure Container Apps ਤੇ ਕੰਟਰੈਨਰਾਈਜ਼ਡ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਇਮੈਂਟ ਕਰਨ ਲਈ ਵਿਆਪਕ ਉਦਾਹਰਨਾਂ ਰੱਖਦੀ ਹੈ। ਇਹ ਉਦਾਹਰਨਾਂ ਅਸਲ-ਜਿਹੇ ਪੈਟਰਨ, ਸਰਵੋਤਮ ਅਭਿਆਸ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਕਾਨਫਿਗਰੇਸ਼ਨਾਂ ਨੂੰ ਦਰਸਾਉਂਦੀਆਂ ਹਨ।

## 📚 ਸੂਚੀ

- [ਸਾਰ](../../../../examples/container-app)
- [ਪਹਿਲਾਂ ਦੀਆਂ ਲੋੜਾਂ](../../../../examples/container-app)
- [ਤੁਰੰਤ ਸ਼ੁਰੂ ਕਰਨ ਦੀਆਂ ਉਦਾਹਰਨਾਂ](../../../../examples/container-app)
- [ਉਤਪਾਦਨ ਉਦਾਹਰਨਾਂ](../../../../examples/container-app)
- [ਉੱਨਤ ਪੈਟਰਨ](../../../../examples/container-app)
- [ਸਰਵੋਤਮ ਅਭਿਆਸ](../../../../examples/container-app)

## ਸਾਰ

Azure Container Apps ਇੱਕ ਪੂਰੀ ਤਰ੍ਹਾਂ ਪ੍ਰਬੰਧਿਤ ਸਰਵਰਲੈੱਸ ਕੰਟਰੈਨਰ ਪਲੇਟਫਾਰਮ ਹੈ ਜੋ ਤੁਹਾਨੂੰ ਬਿਨਾਂ ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰਬੰਧਨ ਦੇ ਮਾਈਕ੍ਰੋਸਰਵਿਸਜ਼ ਅਤੇ ਕੰਟਰੈਨਰਾਈਜ਼ਡ ਐਪਲੀਕੇਸ਼ਨਾਂ ਚਲਾਉਣ ਯੋਗ ਬਣਾਉਂਦਾ ਹੈ। AZD ਨਾਲ ਮਿਲਾ ਕੇ, ਤੁਹਾਨੂੰ ਮਿਲਦਾ ਹੈ:

- **ਸਰਲ ਡਿਪਲੋਇਮੈਂਟ**: ਇੱਕ ਹੀ ਕਮਾਂਡ ਨਾਲ ਕੰਟਰੈਨਰਾਂ ਅਤੇ ਇੰਫਰਾਸਟਰਕਚਰ ਨੂੰ ਡਿਪਲੋਇਮੈਂਟ ਕਰੋ
- **ਆਟੋਮੈਟਿਕ ਸਕੇਲਿੰਗ**: HTTP ਟ੍ਰੈਫਿਕ ਜਾਂ ਇਵੈਂਟਾਂ ਦੇ ਅਧਾਰ 'ਤੇ ਜ਼ੀਰੋ ਤੱਕ ਸਕੇਲ ਅਤੇ ਵੱਧ ਸਕਦਾ ਹੈ
- **ਇੰਟੀਗਰੇਟਡ ਨੈਟਵਰਕਿੰਗ**: ਬਿਲਟ-ਇਨ ਸਰਵਿਸ ਡਿਸਕਵਰੀ ਅਤੇ ਟ੍ਰੈਫਿਕ ਵੰਡ
- **ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ**: Azure ਸਰੋਤਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣਿਕਤਾ
- **ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ**: ਸਿਰਫ਼ ਉਹਨਾਂ ਸਰੋਤਾਂ ਲਈ ਭੁਗਤਾਨ ਕਰੋ ਜੋ ਤੁਸੀਂ ਵਰਤਦੇ ਹੋ

## ਪਹਿਲਾਂ ਦੀਆਂ ਲੋੜਾਂ

ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਹਾਡੇ ਕੋਲ ਹੈ:

```bash
# AZD ਦੀ ਸਥਾਪਨਾ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# Azure CLI ਦੀ ਜਾਂਚ ਕਰੋ
az version

# Docker ਦੀ ਜਾਂਚ ਕਰੋ (ਕਸਟਮ ਇਮੇਜ ਬਣਾਉਣ ਲਈ)
docker --version

# Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ
azd auth login
az login
```

**ਜ਼ਰੂਰੀ Azure ਸਰੋਤ:**
- ਸක්੍ਰਿਆ Azure subscription
- Resource group ਬਣਾਉਣ ਦੀਆਂ ਅਨੁਮਤੀਆਂ
- Container Apps environment ਦੀ ਪਹੁੰਚ

## ਤੁਰੰਤ ਸ਼ੁਰੂ ਕਰਨ ਦੀਆਂ ਉਦਾਹਰਨਾਂ

### 1. ਸਧਾਰਣ ਵੈੱਬ API (Python Flask)

Azure Container Apps ਨਾਲ ਇੱਕ ਬੁਨਿਆਦੀ REST API ਡਿਪਲੋਇਮੈਂਟ ਕਰੋ।

**ਉਦਾਹਰਨ: Python Flask API**

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

**ਡਿਪਲੋਇਮੈਂਟ ਕਦਮ:**

```bash
# ਟੈਮਪਲੇਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-python-mongo

# ਸਰੰਚਨਾ ਤਿਆਰ ਕਰੋ ਅਤੇ ਤੈਨਾਤ ਕਰੋ
azd up

# ਤੈਨਾਤ ਦੀ ਜਾਂਚ ਕਰੋ
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ਮੁੱਖ ਫੀਚਰ:**
- 0 ਤੋਂ 10 ਰੈਪਲਿਕਿਆਂ ਤੱਕ ਆਟੋ-ਸਕੇਲਿੰਗ
- ਹੈਲਥ ਪ੍ਰੋਬਸ ਅਤੇ ਲਾਈਵਨੈੱਸ ਚੈੱਕ
- ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਇੰਜੈਕਸ਼ਨ
- Application Insights ਇੰਟੀਗਰੇਸ਼ਨ

### 2. Node.js Express API

MongoDB ਇੰਟੀਗਰੇਸ਼ਨ ਨਾਲ Node.js ਬੈਕਇੰਡ ਡਿਪਲੋਇਮੈਂਟ ਕਰੋ।

```bash
# Node.js API ਟੈਮਪਲੇਟ ਨੂੰ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo

# ਮਾਹੌਲ ਦੇ ਵੈਰੀਏਬਲਾਂ ਦੀ ਸੰਰਚਨਾ ਕਰੋ
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ਤੈਨਾਤ ਕਰੋ
azd up

# Azure Monitor ਰਾਹੀਂ ਲਾਗਾਂ ਵੇਖੋ
azd monitor --logs
```

**ਇੰਫਰਾਸਟਰਕਚਰ ਮੁੱਖ ਬਿੰਦੂ:**
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

### 3. ਸਟੈਟਿਕ ਫਰੰਟਏਂਡ + API ਬੈਕਇੰਡ

React ਫਰੰਟਏਂਡ ਅਤੇ API ਬੈਕਇੰਡ ਨਾਲ ਇੱਕ ਫੁੱਲ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇਮੈਂਟ ਕਰੋ।

```bash
# ਫੁੱਲ-ਸਟੈਕ ਟੈਮਪਲੇਟ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-csharp-sql-swa-func

# ਵਿਨਿਆਸ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
cat azure.yaml

# ਦੋਨੋ ਸੇਵਾਵਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd up

# ਐਪਲੀਕੇਸ਼ਨ ਖੋਲ੍ਹੋ
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## ਉਤਪਾਦਨ ਉਦਾਹਰਨਾਂ

### ਉਦਾਹਰਨ 1: ਮਾਇਕ੍ਰੋਸਰਵਿਸਜ਼ ਆਰਕੀਟੈਕਚਰ

**ਸਥਿਤੀ**: ਕਈ ਮਾਇਕ੍ਰੋਸਰਵਿਸਜ਼ ਵਾਲੀ ਈ-ਕਾਮਰਸ ਐਪਲੀਕੇਸ਼ਨ

**ਡਾਇਰੈਕਟਰੀ ਢਾਂਚਾ:**
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

**azure.yaml ਕਾਨਫਿਗਰੇਸ਼ਨ:**
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

**ਡਿਪਲੋਇਮੈਂਟ:**
```bash
# ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
azd init

# ਉਤਪਾਦਨ ਵਾਤਾਵਰਣ ਸੈਟ ਕਰੋ
azd env new production

# ਉਤਪਾਦਨ ਸੈਟਿੰਗਾਂ ਸੰਰਚਿਤ ਕਰੋ
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd up

# ਤੈਨਾਤ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --overview
```

### ਉਦਾਹਰਨ 2: AI-ਸਮਰੱਥ Container App

**ਸਥਿਤੀ**: Azure OpenAI ਇੰਟੀਗਰੇਸ਼ਨ ਨਾਲ AI ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ

**ਫਾਇਲ: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# ਸੁਰੱਖਿਅਤ ਪਹੁੰਚ ਲਈ Managed Identity ਦੀ ਵਰਤੋਂ ਕਰੋ
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Key Vault ਤੋਂ OpenAI ਕੀ ਪ੍ਰਾਪਤ ਕਰੋ
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

**ਫਾਇਲ: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**ਫਾਇਲ: infra/main.bicep**
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

**ਡਿਪਲੋਇਮੈਂਟ ਕਮਾਂਡਾਂ:**
```bash
# ਮਾਹੌਲ ਸੈੱਟ ਕਰੋ
azd init --template ai-chat-app
azd env new dev

# OpenAI ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# ਤੈਨਾਤ ਕਰੋ
azd up

# API ਦੀ ਜਾਂਚ ਕਰੋ
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ਉਦਾਹਰਨ 3: ਕਤਾਰ ਪ੍ਰੋਸੈਸਿੰਗ ਨਾਲ ਬੈਕਗ੍ਰਾਊਂਡ ਵਰਕਰ

**ਸਥਿਤੀ**: ਮੇਸੇਜ ਕਤਾਰ ਵਾਲਾ ਆਰਡਰ ਪ੍ਰੋਸੈਸਿੰਗ ਸਿਸਟਮ

**ਡਾਇਰੈਕਟਰੀ ਢਾਂਚਾ:**
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

**ਫਾਇਲ: src/worker/processor.py**
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
            # ਆਰਡਰ ਨੂੰ ਪ੍ਰਕਿਰਿਆ ਕਰੋ
            print(f"Processing order: {message.content}")
            
            # ਸੰਦੇਸ਼ ਪੂਰਾ ਕਰੋ
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**ਫਾਇਲ: azure.yaml**
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

**ਡਿਪਲੋਇਮੈਂਟ:**
```bash
# ਆਰੰਭ ਕਰੋ
azd init

# ਕਤਾਰ ਸੰਰਚਨਾ ਨਾਲ ਤਾਇਨਾਤ ਕਰੋ
azd up

# ਕਤਾਰ ਦੀ ਲੰਬਾਈ ਦੇ ਆਧਾਰ ਤੇ ਵਰਕਰ ਦੀ ਸੰਖਿਆ ਵਧਾਓ ਜਾਂ ਘਟਾਓ
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## ਉੱਨਤ ਪੈਟਰਨ

### ਪੈਟਰਨ 1: ਬਲੂ-ਗ੍ਰੀਨ ਡਿਪਲੋਇਮੈਂਟ

```bash
# ਟ੍ਰੈਫਿਕ ਦੇ ਬਿਨਾਂ ਨਵੀਂ ਰਿਵੀਜ਼ਨ ਬਣਾਓ
azd deploy api --revision-suffix blue --no-traffic

# ਨਵੀਂ ਰਿਵੀਜ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ਟ੍ਰੈਫਿਕ ਵੰਡੋ (20% ਨੀਲੇ ਨੂੰ, 80% ਮੌਜੂਦਾ ਨੂੰ)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# ਪੂਰੀ ਤਰ੍ਹਾਂ ਨੀਲੇ ਵੱਲ ਕਟਓਵਰ
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### ਪੈਟਰਨ 2: AZD ਨਾਲ ਕੈਨੇਰੀ ਡਿਪਲੋਇਮੈਂਟ

**ਫਾਇਲ: .azure/dev/config.json**
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

**ਡਿਪਲੋਇਮੈਂਟ ਸਕ੍ਰਿਪਟ:**
```bash
#!/bin/bash
# deploy-canary.sh

# ਨਵੀਂ ਰਿਵੀਜ਼ਨ 10% ਟਰੈਫਿਕ ਨਾਲ ਡਿਪਲੋਇ ਕਰੋ
azd deploy api --revision-mode multiple

# ਮੀਟ੍ਰਿਕਸ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --service api --duration 5m

# ਟ੍ਰੈਫਿਕ ਨੂੰ ਧੀਰੇ-ਧੀਰੇ ਵਧਾਓ
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 ਮਿੰਟ ਲਈ ਉਡੀਕ ਕਰੋ
done
```

### ਪੈਟਰਨ 3: ਬਹੁ-ਰਾਜ ਡਿਪਲੋਇਮੈਂਟ

**ਫਾਇਲ: azure.yaml**
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

**ਫਾਇਲ: infra/multi-region.bicep**
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

**ਡਿਪਲੋਇਮੈਂਟ:**
```bash
# ਸਾਰੇ ਖੇਤਰਾਂ ਵਿੱਚ ਤੈਨਾਤ ਕਰੋ
azd up

# ਐਂਡਪੌਇੰਟਸ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd show --output json | jq '.services.api.endpoints'
```

### ਪੈਟਰਨ 4: Dapr ਇੰਟੀਗਰੇਸ਼ਨ

**ਫਾਇਲ: infra/app/dapr-enabled.bicep**
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

**Dapr ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # ਸਥਿਤੀ ਸੰਭਾਲੋ
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # ਘਟਨਾ ਪ੍ਰਕਾਸ਼ਿਤ ਕਰੋ
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## ਸਰਵੋਤਮ ਅਭਿਆਸ

### 1. ਸਰੋਤਾਂ ਦੀ ਵਿਵਸਥਾ

```bash
# ਇਕਸਾਰ ਨਾਮਕਰਨ ਨਿਯਮ ਵਰਤੋ
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ਲਾਗਤ ਦੀ ਨਿਗਰਾਨੀ ਲਈ ਸਰੋਤਾਂ ਨੂੰ ਟੈਗ ਕਰੋ
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. ਸੁਰੱਖਿਆ ਵਧੀਆ ਅਭਿਆਸ

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

### 3. ਪ੍ਰਦਰਸ਼ਨ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

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

### 4. ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਨਿਰੀਖਣਯੋਗਤਾ

```bash
# Application Insights ਨੂੰ ਚਾਲੂ ਕਰੋ
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# ਅਸਲ ਸਮੇਂ ਵਿੱਚ ਲੌਗ ਵੇਖੋ
azd monitor --logs
# ਜਾਂ Container Apps ਲਈ Azure CLI ਦੀ ਵਰਤੋਂ ਕਰੋ:
az containerapp logs show --name api --resource-group rg-myapp --follow

# ਮੀਟ੍ਰਿਕਸ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --live

# ਅਲਰਟ ਬਣਾਓ
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

```bash
# ਜਦੋਂ ਵਰਤੋਂ ਵਿੱਚ ਨਾ ਹੋਵੇ ਤਾਂ ਸਕੇਲ ਨੂੰ ਜੀਰੋ ਤੇ ਲਿਆਓ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ਡੈਵਲਪਮੈਂਟ ਵਾਤਾਵਰਣਾਂ ਲਈ ਸਪੌਟ ਇੰਸਟੈਂਸ ਵਰਤੋ
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ਬਜਟ ਚੇਤਾਵਨੀਆਂ ਸੈਟ ਕਰੋ
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD ਇੰਟੀਗਰੇਸ਼ਨ

**GitHub Actions ਉਦਾਹਰਨ:**
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

## ਆਮ ਕਮਾਂਡ ਰੈਫਰੈਂਸ

```bash
# ਨਵਾਂ ਕੰਟੇਨਰ ਐਪ ਪਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
azd init --template <template-name>

# ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰੋ
azd up

# ਸਿਰਫ਼ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਤੈਨਾਤ ਕਰੋ (ਇਨਫਰਾਸਟਰੱਕਚਰ ਨੂੰ ਛੱਡੋ)
azd deploy

# ਸਿਰਫ਼ ਇਨਫਰਾਸਟਰੱਕਚਰ ਤਿਆਰ ਕਰੋ
azd provision

# ਤੈਨਾਤ ਕੀਤੇ ਸਰੋਤ ਵੇਖੋ
azd show

# azd monitor ਜਾਂ Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲੌਗ ਸਟਰੀਮ ਕਰੋ
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --overview

# ਸਰੋਤਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ
azd down --force --purge
```

## ਸਮੱਸਿਆ ਨਿਵਾਰਣ

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਸ਼ੁਰੂ ਹੋਣ ਵਿੱਚ ਨਾਕਾਮ

```bash
# Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲੌਗ ਚੈੱਕ ਕਰੋ
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# ਕੰਟੇਨਰ ਘਟਨਾਵਾਂ ਵੇਖੋ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ਸਥਾਨਕ ਤੌਰ ਤੇ ਟੈਸਟ ਕਰੋ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਐਪ ਐਂਡਪੁਆਇੰਟ ਤੱਕ ਪਹੁੰਚ ਨਹੀਂ ਹੋ ਰਹੀ

```bash
# ਇਨਗ੍ਰੈੱਸ ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ਜਾਂਚੋ ਕਿ ਅੰਦਰੂਨੀ ਇਨਗ੍ਰੈੱਸ ਚਾਲੂ ਹੈ ਕਿ ਨਹੀਂ
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### ਸਮੱਸਿਆ: ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ

```bash
# ਸੰਸਾਧਨਾਂ ਦੀ ਉਪਯੋਗਤਾ ਜਾਂਚੋ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ਸੰਸਾਧਨਾਂ ਨੂੰ ਵਧਾਓ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## ਵਾਧੂ ਸਰੋਤ ਅਤੇ ਉਦਾਹਰਨਾਂ
- [ਮਾਇਕ੍ਰੋਸਰਵਿਸਜ਼ ਉਦਾਹਰਨ](./microservices/README.md)
- [ਸਧਾਰਣ Flask API ਉਦਾਹਰਨ](./simple-flask-api/README.md)
- [Azure Container Apps ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ](https://learn.microsoft.com/azure/container-apps/)
- [AZD ਟੈਮਪਲੇਟ ਗੈਲਰੀ](https://azure.github.io/awesome-azd/)
- [Container Apps ਨਮੂਨੇ](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep ਟੈਮਪਲੇਟਸ](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## ਯੋਗਦਾਨ

ਨਵੇਂ container app ਉਦਾਹਰਨਾਂ ਵਿੱਚ ਯੋਗਦਾਨ ਦੇਣ ਲਈ:

1. ਆਪਣੇ ਉਦਾਹਰਨ ਨਾਲ ਇੱਕ ਨਵਾਂ ਸਬਡਾਇਰੈਕਟਰੀ ਬਣਾਓ
2. ਪੂਰੇ `azure.yaml`, `infra/`, ਅਤੇ `src/` ਫਾਇਲਾਂ ਸ਼ਾਮਲ ਕਰੋ
3. ਡਿਪਲੋਇਮੈਂਟ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼ਾਂ ਸਮੇਤ ਵਿਆਪਕ README ਜੋੜੋ
4. ਡਿਪਲੋਇਮੈਂਟ ਨੂੰ `azd up` ਨਾਲ ਟੈਸਟ ਕਰੋ
5. ਇੱਕ ਪੁਲ ਰਿਕਵੇਸਟ ਜਮ੍ਹਾਂ ਕਰੋ

---

**ਸਹਾਇਤਾ ਚਾਹੀਦੀ ਹੈ?** ਸਹਾਇਤਾ ਅਤੇ ਪ੍ਰਸ਼ਨਾਂ ਲਈ [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਰਨ:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਪਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਇਹ ਜਾਣਣਾ ਜ਼ਰੂਰੀ ਹੈ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸ਼ੁੱਧਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਨਾਜ਼ੁਕ ਜਾਂ ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਨਾਲ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਵਿਆਖਿਆਈਆਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->