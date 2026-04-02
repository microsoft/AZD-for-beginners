# AZD ನೊಂದಿಗೆ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ ಉದಾಹರಣೆಗಳು

ಈ ಡೈರೆಕ್ಟರಿ ನೀವಗೆ ಅಜ್ಯೂರ್ ಡೆವಲಪರ್ CLI (AZD) ಬಳಸಿ ಅಜ್ಯೂರ್ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ ಕಂಟೈನರ್ ರೂಪದ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವ ವ್ಯಾಪಕ ಉದಾಹರಣೆಗಳನ್ನು ಒಳಗೊಂಡಿದೆ. ಈ ಉದಾಹರಣೆಗಳು ನೈಜ ಜಿಮ್ಮು ಪ್ಯಾಟರ್ನ್‌ಗಳು, ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು, ಮತ್ತು ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಸಮೆಪನಗಳನ್ನು ತೋರಿಸುತ್ತವೆ.

## 📚 ವಿಷಯಗಳ ಟೇಬಲ್

- [ಓವರ್‌ವ್ಯೂ](#ಓವರ್‌ವ್ಯೂ)
- [ಮೂಲೆಭೂತ ಅಗತ್ಯಗಳು](#ಮೂಲೆಭೂತ-ಅಗತ್ಯಗಳು)
- [ತ್ವರಿತ ಪ್ರಾರಂಭ ಉದಾಹರಣೆಗಳು](#ತ್ವರಿತ-ಪ್ರಾರಂಭ-ಉದಾಹರಣೆಗಳು)
- [ಉತ್ಪಾದನಾ ಉದಾಹರಣೆಗಳು](#ಉತ್ಪಾದನಾ-ಉದಾಹರಣೆಗಳು)
- [ಉನ್ನತ ಪ್ಯಾಟರ್ನ್‌ಗಳು](#ಉನ್ನತ-ಪ್ಯಾಟರ್ನ್‌ಗಳು)
- [ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು](#ಉತ್ತಮ-ಅಭ್ಯಾಸಗಳು)

## ಓವರ್‌ವ್ಯೂ

ಅಜ್ಯೂರ್ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ಸ್ ಎನ್ನುವುದು ಸಂಪೂರ್ಣ ನಿರ್ವಹಿತ ಸರ್ವರ್‌ಲೆಸ್ ಕಂಟೈನರ್ ವೇದಿಕೆ ಆಗಿದ್ದು, ಮೂಲಸೌಕರ್ಯ ನಿರ್ವಹಣೆ ಇಲ್ಲದೆ ಮೈಕ್ರೋಸರ್ವಿಸ್‌ಗಳು ಮತ್ತು ಕಂಟೈನರ್ ರೂಪದ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಡೆಸಲು ಸಾಧ್ಯವಾಗಿಸುತ್ತದೆ. AZD ಜೊತೆಗೆ:

- **ಸರಳೀಕೃತ ನಿಯೋಜನೆ**: ಒಂದೇ ಆದೇಶದಲ್ಲಿ ಮೂಲಸೌಕರ್ಯ ಬದಿಗೊಟ್ಟಿರುವ ಕಂಟೈನರ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಿ
- **ಸ್ವಯಂಚಾಲಿತ ವಿಸ್ತರಣೆ**: HTTP ಟ್ರಾಫಿಕ್ ಅಥವಾ ಘಟನೆಗಳ ಆಧಾರದ ಮೇಲೆ ಶೂನ್ಯಕ್ಕೆ ಮತ್ತು ಹೊರಗೆ ವ್ಯಾಪಿಸು
- **ಒಕ್ಕೂಟಗೊಳ್ಳುವ ನೆಟ್ವರ್ಕಿಂಗ್**: ಒಳಗೊಂಡಿರುವ ಸರ್ವಿಸ್ ಪತ್ತೆ ಮತ್ತು ಟ್ರಾಫಿಕ್ ವಿಭಜನೆ
- **ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿ**: ಅಜ್ಯೂರ್ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಸುರಕ್ಷಿತ 身ಪೈಕಿ
- **ವೆಚ್ಚ ದಕ್ಷತೆ**: ನೀವು ಬಳಕೆಯಾದ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಮಾತ್ರ ಪಾವತಿಸಿ

## ಮೂಲೆಭೂತ ಅಗತ್ಯಗಳು

ಆರಂಭಿಸುವುದಕ್ಕೆ ಮುನ್ನ താഴಿತುಂಡಿರುವುದನ್ನು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ:

```bash
# AZD ಸ್ಥಾಪನೆಯನ್ನ ಪರಿಶೀಲಿಸಿ
azd version

# ಅಜೂರ್ CLI ಪರಿಶೀಲಿಸಿ
az version

# ಡೋಕರ್ ಪರಿಶೀಲಿಸಿ (ಕಸ್ಟಮ್ ಇಮೇಜ್‌ಗಳನ್ನು ರಚಿಸಲು)
docker --version

# AZD ನಿಯೋಜನೆಗಳಿಗೆ ಪ್ರಮಾಣೀಕರಿಸಿ
azd auth login

# ಐಚ್ಛಿಕ: ನೀವು ನೇರವಾಗಿ az ಕಮಾಂಡ್‌ಗಳನ್ನು ચલಿಸಲು ಯೋಜಿಸುತ್ತಿದ್ದರೆ ಅಜೂರ್ CLI ಯಲ್ಲಿ ಸೈನ್ ಇನ್ ಮಾಡಿ
az login
```

**ಅಗತ್ಯ ಅಜ್ಯೂರ್ ಸಂಪನ್ಮೂಲಗಳು:**
- ಸಕ್ರಿಯ ಅಜ್ಯೂರ್ ಚಂದಾದಾರಿಕೆ
- ಸಂಪನ್ಮೂಲ ಗುಂಪು ರಚನೆ ಅನುಮತಿಗಳು
- ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ವಾತಾವರಣ ಪ್ರವೇಶ

## ತ್ವರಿತ ಪ್ರಾರಂಭ ಉದಾಹರಣೆಗಳು

### 1. ಸರಳ ವೆಬ್ API (Python Flask)

ಅಜ್ಯೂರ್ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ಸ್ ಬಳಸಿ ಮೂಲ REST API ಅನ್ನು ನಿಯೋಜಿಸಿ.

**ಉದಾಹರಣೆ: Python Flask API**

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

**ನಿಯೋಜನೆ ಹಂತಗಳು:**

```bash
# ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-python-mongo

# ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಒದಗಿಸಿ ಮತ್ತು ನಿಯೋಜಿಸಿ
azd up

# ನಿಯೋಜನೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ಮುಖ್ಯ ವೈಶಿಷ್ಟ್ಯಗಳು:**
- 0 ರಿಂದ 10 ಪ್ರತಿಲಿಪಿಗಳವರೆಗೆ ಸ್ವಯಂ ವಿಸ್ತರಣೆ
- ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳು ಮತ್ತು ಬಾಳಿಕೆ ಪರೀಕ್ಷೆಗಳು
- ಪರಿಸರ ಚರ ಸೆರಿಸುವಿಕೆ
- ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಒಕ್ಕೂಟ

### 2. Node.js Express API

Node.js ಬ್ಯಾಕೆಂಡ್ ಜೊತೆಗೆ MongoDB ಒಕ್ಕೂಟವನ್ನು ನಿಯೋಜಿಸಿ.

```bash
# Node.js API ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-nodejs-mongo

# ಪರಿಸರ ಚರಗಳನ್ನು ಸಂರಚಿಸಿ
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ನಿಯೋಜಿಸಿ
azd up

# Azure ಮಾನಿಟರ್ ಮೂಲಕ ಲಾಗ್‌ಗಳನ್ನು ನೋಡಿ
azd monitor --logs
```

**ಮೂಲಸೌಕರ್ಯ ಪ್ರಮುಖಾಂಶಗಳು:**
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

### 3. ಸ್ಥಿರ ಫ್ರಂಟ್‌ಎಂಡ್ + API ಬ್ಯಾಕೆಂಡ್

React ಫ್ರಂಟ್‌ಎಂಡ್ ಮತ್ತು API ಬ್ಯಾಕೆಂಡ್ ಸಹಿತ ಪೂರ್ಣ-ಸ್ಟಾಕ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜಿಸಿ.

```bash
# ಫುಲ್-ಸ್ಟಾಕ್ ಟೆಂಪ್ಲೇಟ್ನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-csharp-sql-swa-func

# ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
cat azure.yaml

# ಎರಡೂ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ತೆರೆಯಿರಿ
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## ಉತ್ಪಾದನಾ ಉದಾಹರಣೆಗಳು

### ಉದಾಹರಣೆ 1: ಮೈಕ್ರೋಸರ್ವಿಸ್ ವಾಸ್ತುಶಿಲ್ಪ

**ಸ್ಥಿತಿ**: ಬಹು ಮೈಕ್ರೋಸರ್ವಿಸ್‌ಗಳೊಂದಿಗೆ ಇ-ಕಾಮರ್ಸ್ ಅಪ್ಲಿಕೇಶನ್

**ಡೈರೆಕ್ಟರಿ ರಚನೆ:**
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

**azure.yaml ಸಂರಚನೆ:**
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

**ನಿಯೋಜನೆ:**
```bash
# ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸಿ
azd init

# ಉತ್ಪಾದನಾ ಪರಿಸರವನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env new production

# ಉತ್ಪಾದನಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಸಂರಚಿಸಿ
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ನಿಯೋಜನೆಯನ್ನು ನಿಗದಿಪಡಿಸಿ
azd monitor --overview
```

### ಉದಾಹರಣೆ 2: AI-ಸಮರ್ಥಿತ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್

**ಸ್ಥಿತಿ**: Microsoft Foundry ಮಾದರಿಗಳ ಒಕ್ಕೂಟದೊಂದಿಗೆ AI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್

**ಫೈಲ್: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# ಸುರಕ್ಷಿತ ಪ್ರವೇಶಕ್ಕೆ ನಿರ್ವಹಿತ ಗುರುತನ್ನು ಬಳಸಿ
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # ಕೀ ವಾಲ್ಟ್‌ನಿಂದ OpenAI ಕೀ ಪಡೆಯಿರಿ
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

**ಫೈಲ್: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**ಫೈಲ್: infra/main.bicep**
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

**ನಿಯೋಜನೆ ಆದೇಶಗಳು:**
```bash
# ಪರಿಸರವನ್ನು ಸೆಟ್‌ಅಪ್ ಮಾಡಿ
azd init --template ai-chat-app
azd env new dev

# OpenAI ಅನ್ನು ಕನ್ಫಿಗರ್ ಮಾಡಿ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# ನಿಯೋಜಿಸಿ
azd up

# API ಪರೀಕ್ಷಿಸಿ
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ಉದಾಹರಣೆ 3: ಬ್ಯಾಕ್ಗ್ರೌಂಡ್ ವರ್ಕರ್ ನಲ್ಲಿ ಕ್ಯೂ ಪ್ರೋಸೆಸಿಂಗ್

**ಸ್ಥಿತಿ**: ಸಂದೇಶ ಕ್ಯೂ ಬಳಸಿ ಆದೇಶ ಪ್ರೋಸೆಸಿಂಗ್ ವ್ಯವಸ್ಥೆ

**ಡೈರೆಕ್ಟರಿ ರಚನೆ:**
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

**ಫೈಲ್: src/worker/processor.py**
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
            # ಆರ್ಡರ್ ಪ್ರಕ್ರಿಯೆ
            print(f"Processing order: {message.content}")
            
            # ಪೂರ್ಣ ಸಂದೇಶ
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**ಫೈಲ್: azure.yaml**
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

**ನಿಯೋಜನೆ:**
```bash
# ಪ್ರಾರಂಭಿಸಿ
azd init

# ಸರಣಿ ಕಾನ್ಫಿಗರೇಶನ್‌ನೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up

# ಸರಣಿ ದೈರ್ಘ್ಯದ ಮೇಲೆ ಕೆಲಸಗಾರರನ್ನು ಪ್ರಮಾಣಿಸಿ
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## ಉನ್ನತ ಪ್ಯಾಟರ್ನ್‌ಗಳು

### ಪ್ಯಾಟರ್ನ್ 1: ಬ್ಲೂ-ಗ್ರೀನ್ ನಿಯೋಜನೆ

```bash
# ಟ್ರಾಫಿಕ್ ಇಲ್ಲದೆ ಹೊಸ ತಿದ್ದುಪಡಿ ಸೃಷ್ಟಿಸಿ
azd deploy api --revision-suffix blue --no-traffic

# ಹೊಸ ತಿದ್ದುಪடியನ್ನು ಪರೀಕ್ಷಿಸಿ
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ಟ್ರಾಫಿಕ್ ವಿಭಜಿಸಿ (20% ಬ್ಲೂಗೆ, 80% वर्तमानಕ್ಕೆ)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# ಸಂಪೂರ್ಣವಾಗಿ ಬ್ಲೂಗೆ ಕಟ್‌ಓವರ್ ಮಾಡಿ
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### ಪ್ಯಾಟರ್ನ್ 2: AZD ಮೂಲಕ ಕ್ಯಾನರಿ ನಿಯೋಜನೆ

**ಫೈಲ್: .azure/dev/config.json**
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

**ನಿಯೋಜನೆ ಸ್ಕ್ರಿಪ್ಟ್:**
```bash
#!/bin/bash
# deploy-canary.sh

# 10% ಟ್ರಾಫಿಕ್‌ನಲ್ಲಿ ಹೊಸ ಸಂಶೋಧನೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd deploy api --revision-mode multiple

# ಮಾನದಂಡಗಳನ್ನು ಅಧ್ಯಯನ ಮಾಡಿ
azd monitor --service api --duration 5m

# ಟ್ರಾಫಿಕ್ ಅನ್ನು ಹಸ್ತಾಂತರವಾಗಿ ಹೆಚ್ಚಿಸಿ
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 ನಿಮಿಷಗಳು ಕಾಯಿರಿ
done
```

### ಪ್ಯಾಟರ್ನ್ 3: ಬಹು-ಪ್ರದೇಶ ನಿಯೋಜನೆ

**ಫೈಲ್: azure.yaml**
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

**ಫೈಲ್: infra/multi-region.bicep**
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

**ನಿಯೋಜನೆ:**
```bash
# ಎಲ್ಲ ಪ್ರದೇಶಗಳಿಗೆ ನಿಯೋಜಿಸಿ
azd up

# ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json | jq '.services.api.endpoints'
```

### ಪ್ಯಾಟರ್ನ್ 4: ಡ್ಯಾಪರ್ ಒಕ್ಕೂಟ

**ಫೈಲ್: infra/app/dapr-enabled.bicep**
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

**ಡ್ಯಾಪರ್ ಸಹಿತ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # ಸ್ಥಿತಿಯನ್ನು ಉಳಿಸಿ
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # ಘಟನೆ ಪ್ರಕಟಿಸಿ
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### 1. ಸಂಪನ್ಮೂಲ ಸಂಘಟನೆ

```bash
# ಸತತ ನಾಮಕರಣ ನಿಯಮಗಳನ್ನು ಬಳಸಿ
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ವೆಚ್ಚ ಟ್ರ್ಯಾಕಿಂಗ್‌ಗಾಗಿ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಟ್ಯಾಗ್ ಮಾಡಿ
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. ಸುರಕ್ಷತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

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

### 3. ಕಾರ್ಯಕ್ಷಮತೆ ದಕ್ಷತೆ

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

### 4. ಮೌಲ್ಯಮಾಪನ ಮತ್ತು ಗಮನಾರ್ಹತೆ

```bash
# ಅಪ್ಲಿಕೇಶನ್ ಇನ್‌ಸೈಟ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# ಲಾಗ್ಗಳನ್ನು ನೈಜ ಸಮಯದಲ್ಲಿ ವೀಕ್ಷಿಸಿ
azd monitor --logs
# ಅಥವಾ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ ಅಜ್ಯೂರ್ CLI ಬಳಸಿ:
az containerapp logs show --name api --resource-group rg-myapp --follow

# ಮಾನದಂಡಗಳನ್ನು ಗಮನಿಸಿ
azd monitor --live

# ಅಲ್ಟ್‌ಗಳನ್ನು ರಚಿಸಿ
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. ವೆಚ್ಚ ದಕ್ಷತೆ

```bash
# ಬಳಸದಿದ್ದಾಗ ಶೂನ್ಯಕ್ಕೆ ಮಿತಿವೆನು
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ಡೆವ್ ಪರಿಸರಗಳಿಗೆ ಸ್ಪಾಟ್ ಇನ್ಸ್ಟಾನ್ಸ್‌ಗಳನ್ನು ಬಳಸಿರಿ
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಹೊಂದಿಸಿ
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD ಒಕ್ಕೂಟ

**GitHub ಕ್ರಿಯೆಗಳು ಉದಾಹರಣೆ:**
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

## ಸಾಮಾನ್ಯ ಆದೇಶಗಳ ಉಲ್ಲೇಖ

```bash
# ಹೊಸ ಕಂಟೇನರ್ ಅಪ್ಲಿಕೇಶನ್ ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸಿ
azd init --template <template-name>

# ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ಕೇವಲ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ (ಮೂಲಸೌಕರ್ಯ ಬಿಟ್ಟು ಬಿಡಿ)
azd deploy

# ಕೇವಲ ಮೂಲಸೌಕರ್ಯವನ್ನು ಒದಗಿಸಿ
azd provision

# ನಿಯೋಜಿಸಲಾದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# azd ಮಾನಿಟರ್ ಅಥವಾ ಅಜೂರ್ CLI ಬಳಸಿ ಲಾಗ್‌ಗಳನ್ನು ಸ್ಟ್ರೀಮ್ ಮಾಡಿ
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮಾನಿಟರ್ ಮಾಡಿ
azd monitor --overview

# ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd down --force --purge
```

## ಸಮಸ್ಯೆ ಪರಿಹಾರ

### ಸಮಸ್ಯೆ: ಕಂಟೈನರ್ ಪ್ರಾರಂಭಿಸಲು ವಿಫಲವಾಗಿದೆ

```bash
# ಅಜೂರ್ CLI ಬಳಸಿ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# ಕಾಂಟೇನರ್ ಘಟನೆಗಳನ್ನು ವೀಕ್ಷಿಸಿ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### ಸಮಸ್ಯೆ: ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಅಂತಿಮ ಬಿಂದುವಿಗೆ ಪ್ರವೇಶ ಸಾಧ್ಯವಿಲ್ಲ

```bash
# ಇನ್ಗ్రెస్ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ಆಂತರಿಕ ಇನ್ಗ್ರೆಸ್ಸು ಸಕ್ರಿಯವಾಗಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### ಸಮಸ್ಯೆ: ಕಾರ್ಯಕ್ಷಮತೆ ಸಮಸ್ಯೆಗಳು

```bash
# ಸಂಪನ್ಮೂಲ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ಸಂಪನ್ಮೂಲಗಳನ್ನು ಹೆಚ್ಚಿಸಿ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು ಮತ್ತು ಉದಾಹರಣೆಗಳು
- [ಮೈಕ್ರೋಸರ್ವಿಸ್ ಉದಾಹರಣೆ](./microservices/README.md)
- [ಸರಳ ಫ್ಲಾಸ್ಕ್ API ಉದಾಹರಣೆ](./simple-flask-api/README.md)
- [ಅಜ್ಯೂರ್ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳ ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/container-apps/)
- [AZD ಟೆಂಪ್ಲೇಟ್ಸ್ ಗ್ಯಾಲರಿ](https://azure.github.io/awesome-azd/)
- [ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ಸ್ ನಂಯೋಜನೆ ಸಂಗ್ರಹ](https://github.com/Azure-Samples/container-apps-samples)
- [ಬೈಸಪ್ ಟೆಂಪ್ಲೇಟ್ಸ್](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## ಕೊಡುಗೆ ನೀಡುವಿಕೆ

ಹೊಸ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಉದಾಹರಣೆಗಳನ್ನು ಕೊಡುಗೆ ನೀಡಲು:

1. ನಿಮ್ಮ ಉದಾಹರಣೆಯೊಂದಿಗೆ ಹೊಸ ಉಪಡೈರೆಕ್ಟರಿ ರಚಿಸಿ
2. ಪೂರ್ಣ `azure.yaml`, `infra/`, ಮತ್ತು `src/` ಫೈಲ್‌ಗಳನ್ನು ಒಳಗೊಂಡಿರಿಸಿ
3. ನಿಯೋಜನೆ ಸೂಚನೆಗಳೊಂದಿಗೆ ವ್ಯಾಪಕ README ಸೇರಿಸಿ
4. `azd up` ಮೂಲಕ ನಿಯೋಜನೆ ಪರೀಕ್ಷಿಸಿ
5. ಪೋಜ್ ವಿನಂತಿಯನ್ನು ಸಲ್ಲಿಸಿ

---

**ಸಹಾಯ ಬೇಕೇ?** ಬೆಂಬಲ ಮತ್ತು ಪ್ರಶ್ನೆಗಳಿಗಾಗಿ [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) ಸಮುದಾಯದಲ್ಲಿ ಸೇರಿಕೊಳ್ಳಿ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕರಣ**:  
ಈ ಡಾಕ್ಯುಮೆಂಟ್ ಅನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವದಿಸಲಾಗಿದೆ. ನಾವು ಶುದ್ದತೆಗಾಗಿ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದದಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸಂಬಳತೆಗಳು ಇರಬಹುದು ಎಂದು ದಯವಿಟ್ಟು ಗಮನವಿಟ್ಟುಿರಿ. ಮೂಲ ಭಾಷೆಯ ಮೂಲ ಡಾಕ್ಯುಮೆಂಟ್ ಅನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವರಿಂದ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ误understanding ಗಳು ಅಥವಾ ತಪ್ಪು ಅರ್ಥಗಳಿಗಾಗಿ ನಾವು ಹೊಣೆಗಾರರಾಗಿರುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->