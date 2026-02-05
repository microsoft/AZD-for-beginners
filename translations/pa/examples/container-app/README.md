# AZD ਨਾਲ ਕੰਟੇਨਰ ਐਪ ਡਿਪਲੌਇਮੈਂਟ ਦੇ ਉਦਾਹਰਨ

ਇਹ ਡਾਇਰੈਕਟਰੀ AZD (Azure Developer CLI) ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure Container Apps 'ਤੇ ਕੰਟੇਨਰਾਈਜ਼ਡ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਵਿਸਥਾਰਪੂਰਵਕ ਉਦਾਹਰਨਾਂ ਸ਼ਾਮਲ ਕਰਦੀ ਹੈ। ਇਹ ਉਦਾਹਰਨਾਂ ਅਸਲ ਦੁਨੀਆ ਦੇ ਪੈਟਰਨ, ਵਧੀਆ ਪ੍ਰੈਕਟਿਸਾਂ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਕਾਨਫਿਗਰੇਸ਼ਨ ਦਿਖਾਉਂਦੀਆਂ ਹਨ।

## 📚 ਸਮੱਗਰੀ ਦੀ ਸੂਚੀ

- [ਜਾਇਜ਼ਾ](../../../../examples/container-app)
- [ਪੂਰਵ ਸ਼ਰਤਾਂ](../../../../examples/container-app)
- [ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ ਦੇ ਉਦਾਹਰਨ](../../../../examples/container-app)
- [ਪ੍ਰੋਡਕਸ਼ਨ ਦੇ ਉਦਾਹਰਨ](../../../../examples/container-app)
- [ਤਕਨੀਕੀ ਪੈਟਰਨ](../../../../examples/container-app)
- [ਵਧੀਆ ਪ੍ਰੈਕਟਿਸਾਂ](../../../../examples/container-app)

## ਜਾਇਜ਼ਾ

Azure Container Apps ਇੱਕ ਪੂਰੀ ਤਰ੍ਹਾਂ ਪ੍ਰਬੰਧਤ ਸਰਵਰਲੈੱਸ ਕੰਟੇਨਰ ਪਲੇਟਫਾਰਮ ਹੈ ਜੋ ਤੁਹਾਨੂੰ ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਅਤੇ ਕੰਟੇਨਰਾਈਜ਼ਡ ਐਪਲੀਕੇਸ਼ਨ ਚਲਾਉਣ ਦੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ ਬਿਨਾਂ ਇੰਫਰਾਸਟਰਕਚਰ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕੀਤੇ। AZD ਨਾਲ ਮਿਲ ਕੇ, ਤੁਹਾਨੂੰ ਮਿਲਦਾ ਹੈ:

- **ਸਰਲ ਡਿਪਲੌਇਮੈਂਟ**: ਇੱਕ ਕਮਾਂਡ ਨਾਲ ਕੰਟੇਨਰ ਅਤੇ ਇੰਫਰਾਸਟਰਕਚਰ ਡਿਪਲੌਇ ਕਰੋ
- **ਆਟੋਮੈਟਿਕ ਸਕੇਲਿੰਗ**: HTTP ਟ੍ਰੈਫਿਕ ਜਾਂ ਇਵੈਂਟਸ ਦੇ ਆਧਾਰ 'ਤੇ ਸਕੇਲਿੰਗ
- **ਇੰਟੀਗ੍ਰੇਟਡ ਨੈਟਵਰਕਿੰਗ**: ਬਿਲਟ-ਇਨ ਸਰਵਿਸ ਡਿਸਕਵਰੀ ਅਤੇ ਟ੍ਰੈਫਿਕ ਸਪਲਿਟਿੰਗ
- **ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ**: Azure ਸਰੋਤਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣਿਕਤਾ
- **ਲਾਗਤ ਦੀ ਬਚਤ**: ਸਿਰਫ ਉਹਨਾਂ ਸਰੋਤਾਂ ਲਈ ਭੁਗਤਾਨ ਕਰੋ ਜੋ ਤੁਸੀਂ ਵਰਤਦੇ ਹੋ

## ਪੂਰਵ ਸ਼ਰਤਾਂ

ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਹਾਡੇ ਕੋਲ ਹੈ:

```bash
# AZD ਇੰਸਟਾਲੇਸ਼ਨ ਚੈੱਕ ਕਰੋ
azd version

# Azure CLI ਚੈੱਕ ਕਰੋ
az version

# Docker ਚੈੱਕ ਕਰੋ (ਕਸਟਮ ਇਮੇਜ ਬਣਾਉਣ ਲਈ)
docker --version

# Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ
azd auth login
az login
```

**ਲੋੜੀਂਦੇ Azure ਸਰੋਤ:**
- ਐਕਟਿਵ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ
- ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣ ਦੀ ਇਜਾਜ਼ਤ
- Container Apps ਵਾਤਾਵਰਣ ਤੱਕ ਪਹੁੰਚ

## ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ ਦੇ ਉਦਾਹਰਨ

### 1. ਸਧਾਰਨ ਵੈੱਬ API (Python Flask)

Azure Container Apps ਨਾਲ ਇੱਕ ਬੇਸਿਕ REST API ਡਿਪਲੌਇ ਕਰੋ।

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

**ਡਿਪਲੌਇਮੈਂਟ ਦੇ ਕਦਮ:**

```bash
# ਟੈਂਪਲੇਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-python-mongo

# ਢਾਂਚਾ ਪ੍ਰਦਾਨ ਕਰੋ ਅਤੇ ਤੈਨਾਤ ਕਰੋ
azd up

# ਤੈਨਾਤ ਦੀ ਜਾਂਚ ਕਰੋ
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ਮੁੱਖ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ:**
- 0 ਤੋਂ 10 ਰਿਪਲਿਕਾ ਤੱਕ ਆਟੋਮੈਟਿਕ ਸਕੇਲਿੰਗ
- ਹੈਲਥ ਪ੍ਰੋਬਸ ਅਤੇ ਲਾਈਵਨੈੱਸ ਚੈੱਕ
- ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਇੰਜੈਕਸ਼ਨ
- ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### 2. Node.js Express API

MongoDB ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ ਇੱਕ Node.js ਬੈਕਐਂਡ ਡਿਪਲੌਇ ਕਰੋ।

```bash
# ਨੋਡ.ਜੇਐਸ ਏਪੀਆਈ ਟੈਂਪਲੇਟ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo

# ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲਾਂ ਕਨਫਿਗਰ ਕਰੋ
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ਡਿਪਲੌਇ ਕਰੋ
azd up

# ਲੌਗਸ ਦੇਖੋ
azd logs api
```

**ਇੰਫਰਾਸਟਰਕਚਰ ਦੀਆਂ ਹਾਈਲਾਈਟਸ:**
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

### 3. ਸਟੈਟਿਕ ਫਰੰਟਐਂਡ + API ਬੈਕਐਂਡ

React ਫਰੰਟਐਂਡ ਅਤੇ API ਬੈਕਐਂਡ ਨਾਲ ਇੱਕ ਫੁੱਲ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ।

```bash
# ਪੂਰਾ-ਸਟੈਕ ਟੈਂਪਲੇਟ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-csharp-sql-swa-func

# ਕਨਫਿਗਰੇਸ਼ਨ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
cat azure.yaml

# ਦੋਵੇਂ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd up

# ਐਪਲੀਕੇਸ਼ਨ ਖੋਲ੍ਹੋ
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## ਪ੍ਰੋਡਕਸ਼ਨ ਦੇ ਉਦਾਹਰਨ

### ਉਦਾਹਰਨ 1: ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਆਰਕੀਟੈਕਚਰ

**ਸਥਿਤੀ**: ਕਈ ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਵਾਲੀ ਈ-ਕਾਮਰਸ ਐਪਲੀਕੇਸ਼ਨ

**ਡਾਇਰੈਕਟਰੀ ਸਟ੍ਰਕਚਰ:**
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

**ਡਿਪਲੌਇਮੈਂਟ:**
```bash
# ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
azd init

# ਉਤਪਾਦਨ ਵਾਤਾਵਰਣ ਸੈਟ ਕਰੋ
azd env new production

# ਉਤਪਾਦਨ ਸੈਟਿੰਗਾਂ ਕਨਫਿਗਰ ਕਰੋ
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd up

# ਤੈਨਾਤ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --overview
```

### ਉਦਾਹਰਨ 2: AI-ਚਲਿਤ ਕੰਟੇਨਰ ਐਪ

**ਸਥਿਤੀ**: Azure OpenAI ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ AI ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ

**ਫਾਈਲ: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# ਸੁਰੱਖਿਅਤ ਪਹੁੰਚ ਲਈ ਪ੍ਰਬੰਧਿਤ ਪਛਾਣ ਦੀ ਵਰਤੋਂ ਕਰੋ
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # ਕੀ ਵਾਲਟ ਤੋਂ OpenAI ਕੁੰਜੀ ਪ੍ਰਾਪਤ ਕਰੋ
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

**ਫਾਈਲ: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**ਫਾਈਲ: infra/main.bicep**
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

**ਡਿਪਲੌਇਮੈਂਟ ਕਮਾਂਡਸ:**
```bash
# ਵਾਤਾਵਰਣ ਸੈਟ ਕਰੋ
azd init --template ai-chat-app
azd env new dev

# OpenAI ਸੰਰਚਿਤ ਕਰੋ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# ਤੈਨਾਤ ਕਰੋ
azd up

# API ਦੀ ਜਾਂਚ ਕਰੋ
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ਉਦਾਹਰਨ 3: ਬੈਕਗ੍ਰਾਊਂਡ ਵਰਕਰ ਨਾਲ ਕਿਊ ਪ੍ਰੋਸੈਸਿੰਗ

**ਸਥਿਤੀ**: ਮੈਸੇਜ ਕਿਊ ਨਾਲ ਆਰਡਰ ਪ੍ਰੋਸੈਸਿੰਗ ਸਿਸਟਮ

**ਡਾਇਰੈਕਟਰੀ ਸਟ੍ਰਕਚਰ:**
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

**ਫਾਈਲ: src/worker/processor.py**
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
            # ਆਰਡਰ ਪ੍ਰਕਿਰਿਆ
            print(f"Processing order: {message.content}")
            
            # ਸੰਦੇਸ਼ ਪੂਰਾ
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**ਫਾਈਲ: azure.yaml**
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

**ਡਿਪਲੌਇਮੈਂਟ:**
```bash
# ਸ਼ੁਰੂ ਕਰੋ
azd init

# ਕਤਾਰ ਸੰਰਚਨਾ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up

# ਕਤਾਰ ਦੀ ਲੰਬਾਈ ਦੇ ਅਧਾਰ 'ਤੇ ਵਰਕਰ ਨੂੰ ਸਕੇਲ ਕਰੋ
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## ਤਕਨੀਕੀ ਪੈਟਰਨ

### ਪੈਟਰਨ 1: ਬਲੂ-ਗ੍ਰੀਨ ਡਿਪਲੌਇਮੈਂਟ

```bash
# ਨਵੀਂ ਰੀਵਿਜ਼ਨ ਬਿਨਾਂ ਟ੍ਰੈਫਿਕ ਦੇ ਬਣਾਓ
azd deploy api --revision-suffix blue --no-traffic

# ਨਵੀਂ ਰੀਵਿਜ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ਟ੍ਰੈਫਿਕ ਵੰਡੋ (20% ਨੀਲੇ ਨੂੰ, 80% ਮੌਜੂਦਾ ਨੂੰ)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# ਪੂਰੀ ਤਰ੍ਹਾਂ ਨੀਲੇ ਵਿੱਚ ਬਦਲੋ
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### ਪੈਟਰਨ 2: AZD ਨਾਲ ਕੈਨੇਰੀ ਡਿਪਲੌਇਮੈਂਟ

**ਫਾਈਲ: .azure/dev/config.json**
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

**ਡਿਪਲੌਇਮੈਂਟ ਸਕ੍ਰਿਪਟ:**
```bash
#!/bin/bash
# deploy-canary.sh

# ਨਵੀਂ ਰੀਵਿਜ਼ਨ ਨੂੰ 10% ਟ੍ਰੈਫਿਕ ਨਾਲ ਡਿਪਲੌਇ ਕਰੋ
azd deploy api --revision-mode multiple

# ਮੈਟ੍ਰਿਕਸ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --service api --duration 5m

# ਟ੍ਰੈਫਿਕ ਨੂੰ ਹੌਲੀ-ਹੌਲੀ ਵਧਾਓ
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 ਮਿੰਟ ਉਡੀਕ ਕਰੋ
done
```

### ਪੈਟਰਨ 3: ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ

**ਫਾਈਲ: azure.yaml**
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

**ਫਾਈਲ: infra/multi-region.bicep**
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

**ਡਿਪਲੌਇਮੈਂਟ:**
```bash
# ਸਾਰੇ ਖੇਤਰਾਂ ਵਿੱਚ ਤੈਨਾਤ ਕਰੋ
azd up

# ਐਂਡਪੌਇੰਟਸ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd show --output json | jq '.services.api.endpoints'
```

### ਪੈਟਰਨ 4: Dapr ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**ਫਾਈਲ: infra/app/dapr-enabled.bicep**
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
        # ਸਟੇਟ ਸੇਵ ਕਰੋ
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # ਇਵੈਂਟ ਪ੍ਰਕਾਸ਼ਿਤ ਕਰੋ
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## ਵਧੀਆ ਪ੍ਰੈਕਟਿਸਾਂ

### 1. ਸਰੋਤਾਂ ਦੀ ਸੰਗਠਨਾ

```bash
# ਸਥਿਰ ਨਾਮਕਰਨ ਰੀਤੀਆਂ ਦੀ ਵਰਤੋਂ ਕਰੋ
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ਖਰਚਾ ਟ੍ਰੈਕਿੰਗ ਲਈ ਸਰੋਤਾਂ ਨੂੰ ਟੈਗ ਕਰੋ
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. ਸੁਰੱਖਿਆ ਲਈ ਵਧੀਆ ਪ੍ਰੈਕਟਿਸਾਂ

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

### 3. ਪ੍ਰਦਰਸ਼ਨ ਦਾ ਅਧਿਕਤਮ ਬਣਾਉਣਾ

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

### 4. ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਟਤਾ

```bash
# ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਨੂੰ ਸਚਾਲਿਤ ਕਰੋ
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# ਲਾਗਜ਼ ਨੂੰ ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ ਵੇਖੋ
azd logs api --follow

# ਮੈਟ੍ਰਿਕਸ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --service api

# ਚੇਤਾਵਨੀਆਂ ਬਣਾਓ
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. ਲਾਗਤ ਦੀ ਬਚਤ

```bash
# ਵਰਤੋਂ ਵਿੱਚ ਨਾ ਹੋਣ 'ਤੇ ਜ਼ੀਰੋ 'ਤੇ ਸਕੇਲ ਕਰੋ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ਡਿਵ ਐਨਵਾਇਰਨਮੈਂਟ ਲਈ ਸਪਾਟ ਇੰਸਟੈਂਸ ਵਰਤੋ
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ਬਜਟ ਅਲਰਟ ਸੈਟ ਕਰੋ
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**GitHub Actions ਦਾ ਉਦਾਹਰਨ:**
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

## ਆਮ ਕਮਾਂਡਸ ਰਿਫਰੈਂਸ

```bash
# ਨਵਾਂ ਕੰਟੇਨਰ ਐਪ ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
azd init --template <template-name>

# ਢਾਂਚਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰੋ
azd up

# ਸਿਰਫ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਤੈਨਾਤ ਕਰੋ (ਢਾਂਚਾ ਛੱਡੋ)
azd deploy

# ਸਿਰਫ ਢਾਂਚਾ ਪ੍ਰਦਾਨ ਕਰੋ
azd provision

# ਤੈਨਾਤ ਕੀਤੇ ਸਰੋਤਾਂ ਨੂੰ ਵੇਖੋ
azd show

# ਲਾਗਸ ਸਟ੍ਰੀਮ ਕਰੋ
azd logs <service-name> --follow

# ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --overview

# ਸਰੋਤਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ
azd down --force --purge
```

## ਸਮੱਸਿਆ ਹੱਲ

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਸ਼ੁਰੂ ਨਹੀਂ ਹੁੰਦਾ

```bash
# ਲਾਗਜ਼ ਚੈੱਕ ਕਰੋ
azd logs api --tail 100

# ਕੰਟੇਨਰ ਇਵੈਂਟਸ ਵੇਖੋ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ਸਥਾਨਕ ਤੌਰ 'ਤੇ ਟੈਸਟ ਕਰੋ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਐਪ ਐਂਡਪੌਇੰਟ ਤੱਕ ਪਹੁੰਚ ਨਹੀਂ

```bash
# ਇਨਗ੍ਰੈਸ ਕਨਫਿਗਰੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ਜਾਂਚੋ ਕਿ ਅੰਦਰੂਨੀ ਇਨਗ੍ਰੈਸ ਚਾਲੂ ਹੈ
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### ਸਮੱਸਿਆ: ਪ੍ਰਦਰਸ਼ਨ ਦੀ ਸਮੱਸਿਆ

```bash
# ਸਰੋਤਾਂ ਦੀ ਵਰਤੋਂ ਦੀ ਜਾਂਚ ਕਰੋ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ਸਰੋਤਾਂ ਨੂੰ ਵਧਾਓ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## ਵਾਧੂ ਸਰੋਤ ਅਤੇ ਉਦਾਹਰਨਾਂ
- [ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਉਦਾਹਰਨ](./microservices/README.md)
- [ਸਧਾਰਨ Flash API ਉਦਾਹਰਨ](./simple-flask-api/README.md)
- [Azure Container Apps ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/container-apps/)
- [AZD ਟੈਂਪਲੇਟ ਗੈਲਰੀ](https://azure.github.io/awesome-azd/)
- [Container Apps ਦੇ ਨਮੂਨੇ](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep ਟੈਂਪਲੇਟ](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## ਯੋਗਦਾਨ

ਨਵੇਂ ਕੰਟੇਨਰ ਐਪ ਦੇ ਉਦਾਹਰਨ ਜੋੜਨ ਲਈ:

1. ਆਪਣੇ ਉਦਾਹਰਨ ਨਾਲ ਇੱਕ ਨਵੀਂ ਸਬਡਾਇਰੈਕਟਰੀ ਬਣਾਓ
2. ਪੂਰੇ `azure.yaml`, `infra/`, ਅਤੇ `src/` ਫਾਈਲਾਂ ਸ਼ਾਮਲ ਕਰੋ
3. ਡਿਪਲੌਇਮੈਂਟ ਨਿਰਦੇਸ਼ਾਂ ਨਾਲ ਵਿਸਥਾਰਪੂਰਵਕ README ਸ਼ਾਮਲ ਕਰੋ
4. `azd up` ਨਾਲ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਜਾਂਚ ਕਰੋ
5. ਇੱਕ ਪੁਲ ਰਿਕਵੈਸਟ ਜਮ੍ਹਾਂ ਕਰੋ

---

**ਮਦਦ ਦੀ ਲੋੜ ਹੈ?** ਸਹਾਇਤਾ ਅਤੇ ਸਵਾਲਾਂ ਲਈ [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਰਤਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਣੀਕਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->