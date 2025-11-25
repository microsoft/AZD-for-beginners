<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-24T21:41:28+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "kn"
}
-->
# AZD ಬಳಸಿ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಉದಾಹರಣೆಗಳು

ಈ ಡೈರೆಕ್ಟರಿಯಲ್ಲಿ Azure Developer CLI (AZD) ಬಳಸಿ Azure Container Apps ಗೆ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಸಂಪೂರ್ಣ ಉದಾಹರಣೆಗಳು ಸೇರಿವೆ. ಈ ಉದಾಹರಣೆಗಳು ನೈಜ ಜಗತ್ತಿನ ಮಾದರಿಗಳು, ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು ಮತ್ತು ಉತ್ಪಾದನಾ-ಸಿದ್ಧ ಸಂರಚನೆಗಳನ್ನು ತೋರಿಸುತ್ತವೆ.

## 📚 ವಿಷಯಗಳ ಪಟ್ಟಿಯು

- [ಅವಲೋಕನ](../../../../examples/container-app)
- [ಪೂರ್ವಶರತ್ತುಗಳು](../../../../examples/container-app)
- [ತ್ವರಿತ ಪ್ರಾರಂಭದ ಉದಾಹರಣೆಗಳು](../../../../examples/container-app)
- [ಉತ್ಪಾದನಾ ಉದಾಹರಣೆಗಳು](../../../../examples/container-app)
- [ಅಧುನಾತನ ಮಾದರಿಗಳು](../../../../examples/container-app)
- [ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು](../../../../examples/container-app)

## ಅವಲೋಕನ

Azure Container Apps ಒಂದು ಸಂಪೂರ್ಣ ನಿರ್ವಹಿತ ಸರ್ವರ್‌ಲೆಸ್ ಕಂಟೈನರ್ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ ಆಗಿದ್ದು, ನೀವು ಮೂಲಸೇವೆಗಳು ಮತ್ತು ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಮೂಲಸೌಕರ್ಯವನ್ನು ನಿರ್ವಹಿಸದೆ ಚಲಾಯಿಸಲು ಅನುಮತಿಸುತ್ತದೆ. AZD ಜೊತೆಯಾಗಿ ಬಳಸಿದಾಗ, ನೀವು ಪಡೆಯುವದು:

- **ಸರಳೀಕೃತ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್**: ಒಂದು ಕಮಾಂಡ್ ಮೂಲಕ ಕಂಟೈನರ್‌ಗಳನ್ನು ಮೂಲಸೌಕರ್ಯಗಳೊಂದಿಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಬಹುದು
- **ಸ್ವಯಂಚಾಲಿತ ಸ್ಕೇಲಿಂಗ್**: HTTP ಟ್ರಾಫಿಕ್ ಅಥವಾ ಈವೆಂಟ್‌ಗಳ ಆಧಾರದ ಮೇಲೆ ಶೂನ್ಯದಿಂದ ಸ್ಕೇಲ್ ಔಟ್
- **ಒಗ್ಗೂಡಿಸಿದ ನೆಟ್‌ವರ್ಕಿಂಗ್**: ಬಿಲ್ಟ್-ಇನ್ ಸೇವಾ ಪತ್ತೆ ಮತ್ತು ಟ್ರಾಫಿಕ್ ವಿಭಜನೆ
- **ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿ**: Azure ಸಂಪತ್ತಿಗೆ ಸುರಕ್ಷಿತ ಪ್ರಾಮಾಣೀಕರಣ
- **ವೆಚ್ಚದ ಆಪ್ಟಿಮೈಸೇಶನ್**: ನೀವು ಬಳಸುವ ಸಂಪತ್ತಿಗೆ ಮಾತ್ರ ಪಾವತಿ

## ಪೂರ್ವಶರತ್ತುಗಳು

ಪ್ರಾರಂಭಿಸುವ ಮೊದಲು, ನೀವು ಹೊಂದಿರಬೇಕು:

```bash
# AZD ಸ್ಥಾಪನೆ ಪರಿಶೀಲಿಸಿ
azd version

# Azure CLI ಪರಿಶೀಲಿಸಿ
az version

# ಡಾಕರ್ ಪರಿಶೀಲಿಸಿ (ಕಸ್ಟಮ್ ಇಮೇಜ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಲು)
docker --version

# Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
azd auth login
az login
```

**ಅಗತ್ಯವಿರುವ Azure ಸಂಪತ್ತುಗಳು:**
- ಸಕ್ರಿಯ Azure ಚಂದಾದಾರಿಕೆ
- ರಿಸೋರ್ಸ್ ಗುಂಪು ರಚನೆ ಅನುಮತಿಗಳು
- Container Apps ಪರಿಸರ ಪ್ರವೇಶ

## ತ್ವರಿತ ಪ್ರಾರಂಭದ ಉದಾಹರಣೆಗಳು

### 1. ಸರಳ ವೆಬ್ API (Python Flask)

Azure Container Apps ಮೂಲಕ ಮೂಲ REST API ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ.

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

**ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಹಂತಗಳು:**

```bash
# ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-python-mongo

# ಮೂಲಸೌಕರ್ಯವನ್ನು ಒದಗಿಸಿ ಮತ್ತು ನಿಯೋಜಿಸಿ
azd up

# ನಿಯೋಜನೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ಮುಖ್ಯ ವೈಶಿಷ್ಟ್ಯಗಳು:**
- 0 ರಿಂದ 10 ರೆಪ್ಲಿಕಾಗಳವರೆಗೆ ಸ್ವಯಂಚಾಲಿತ ಸ್ಕೇಲಿಂಗ್
- ಆರೋಗ್ಯ ಪ್ರೋಬ್‌ಗಳು ಮತ್ತು ಲೈವ್ನೆಸ್ ಚೆಕ್‌ಗಳು
- ಪರಿಸರ ವ್ಯಾರಿಯಬಲ್ ಇಂಜೆಕ್ಷನ್
- ಅಪ್ಲಿಕೇಶನ್ ಇನ್‌ಸೈಟ್ಸ್ ಇಂಟಿಗ್ರೇಶನ್

### 2. Node.js Express API

MongoDB ಇಂಟಿಗ್ರೇಶನ್ ಹೊಂದಿರುವ Node.js ಬ್ಯಾಕೆಂಡ್ ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ.

```bash
# Node.js API ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-nodejs-mongo

# ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳನ್ನು ಸಂರಚಿಸಿ
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ನಿಯೋಜಿಸಿ
azd up

# ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd logs api
```

**ಮೂಲಸೌಕರ್ಯದ ಮುಖ್ಯಾಂಶಗಳು:**
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

### 3. ಸ್ಟ್ಯಾಟಿಕ್ ಫ್ರಂಟ್‌ಎಂಡ್ + API ಬ್ಯಾಕೆಂಡ್

React ಫ್ರಂಟ್‌ಎಂಡ್ ಮತ್ತು API ಬ್ಯಾಕೆಂಡ್ ಹೊಂದಿರುವ ಸಂಪೂರ್ಣ-ಸ್ಟಾಕ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ.

```bash
# ಸಂಪೂರ್ಣ ಸ್ಟಾಕ್ ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-csharp-sql-swa-func

# ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
cat azure.yaml

# ಎರಡೂ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ತೆರೆಯಿರಿ
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## ಉತ್ಪಾದನಾ ಉದಾಹರಣೆಗಳು

### ಉದಾಹರಣೆ 1: ಮೈಕ್ರೋಸರ್ವಿಸ್ ಆರ್ಕಿಟೆಕ್ಚರ್

**ಸನ್ನಿವೇಶ**: ಬಹು ಮೈಕ್ರೋಸರ್ವಿಸ್‌ಗಳೊಂದಿಗೆ ಇ-ಕಾಮರ್ಸ್ ಅಪ್ಲಿಕೇಶನ್

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

**ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್:**
```bash
# ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸಿ
azd init

# ಉತ್ಪಾದನಾ ಪರಿಸರವನ್ನು ಹೊಂದಿಸಿ
azd env new production

# ಉತ್ಪಾದನಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಸಂರಚಿಸಿ
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ನಿಯೋಜನೆವನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor --overview
```

### ಉದಾಹರಣೆ 2: AI-ಚಾಲಿತ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್

**ಸನ್ನಿವೇಶ**: Azure OpenAI ಇಂಟಿಗ್ರೇಶನ್ ಹೊಂದಿರುವ AI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್

**ಫೈಲ್: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# ಸುರಕ್ಷಿತ ಪ್ರವೇಶಕ್ಕಾಗಿ ನಿರ್ವಹಿತ ಗುರುತನ್ನು ಬಳಸಿ
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
        model="gpt-4",
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

**ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಮಾಂಡ್‌ಗಳು:**
```bash
# ಪರಿಸರವನ್ನು ಸಜ್ಜುಗೊಳಿಸಿ
azd init --template ai-chat-app
azd env new dev

# OpenAI ಅನ್ನು ಸಂರಚಿಸಿ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# ನಿಯೋಜಿಸಿ
azd up

# API ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ಉದಾಹರಣೆ 3: ಬ್ಯಾಕ್ಗ್ರೌಂಡ್ ವರ್ಕರ್ ಮತ್ತು ಕ್ಯೂ ಪ್ರೊಸೆಸಿಂಗ್

**ಸನ್ನಿವೇಶ**: ಮೆಸೇಜ್ ಕ್ಯೂ ಹೊಂದಿರುವ ಆರ್ಡರ್ ಪ್ರೊಸೆಸಿಂಗ್ ಸಿಸ್ಟಮ್

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
            # ಆದೇಶವನ್ನು ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಿ
            print(f"Processing order: {message.content}")
            
            # ಸಂದೇಶವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ
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

**ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್:**
```bash
# ಪ್ರಾರಂಭಿಸಿ
azd init

# ಕ್ಯೂ ಸಂರಚನೆಯೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up

# ಕ್ಯೂ ಉದ್ದದ ಆಧಾರದ ಮೇಲೆ ಕಾರ್ಮಿಕನನ್ನು ಪ್ರಮಾಣಿತಗೊಳಿಸಿ
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## ಅಧುನಾತನ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: ಬ್ಲೂ-ಗ್ರೀನ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್

```bash
# ಹೊಸ ಆವೃತ್ತಿಯನ್ನು ಟ್ರಾಫಿಕ್ ಇಲ್ಲದೆ ರಚಿಸಿ
azd deploy api --revision-suffix blue --no-traffic

# ಹೊಸ ಆವೃತ್ತಿಯನ್ನು ಪರೀಕ್ಷಿಸಿ
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ಟ್ರಾಫಿಕ್ ಹಂಚಿಕೆ (20% ಬ್ಲೂಗೆ, 80% ಪ್ರಸ್ತುತಕ್ಕೆ)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# ಸಂಪೂರ್ಣ ಬ್ಲೂಗೆ ಸ್ಥಳಾಂತರ
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### ಮಾದರಿ 2: AZD ಬಳಸಿ ಕ್ಯಾನರಿ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್

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

**ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ಕ್ರಿಪ್ಟ್:**
```bash
#!/bin/bash
# deploy-canary.sh

# ಹೊಸ ಆವೃತ್ತಿಯನ್ನು 10% ಟ್ರಾಫಿಕ್‌ನೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd deploy api --revision-mode multiple

# ಮೆಟ್ರಿಕ್ಸ್ ಅನ್ನು ನಿಗಾ ಮಾಡಿ
azd monitor --service api --duration 5m

# ಟ್ರಾಫಿಕ್ ಅನ್ನು ಹಂತಹಂತವಾಗಿ ಹೆಚ್ಚಿಸಿ
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 ನಿಮಿಷಗಳ ಕಾಲ ಕಾಯಿರಿ
done
```

### ಮಾದರಿ 3: ಬಹು-ಪ್ರಾದೇಶಿಕ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್

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

**ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್:**
```bash
# ಎಲ್ಲಾ ಪ್ರದೇಶಗಳಿಗೆ ನಿಯೋಜಿಸಿ
azd up

# ಅಂತಿಮ ಬಿಂದುಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json | jq '.services.api.endpoints'
```

### ಮಾದರಿ 4: Dapr ಇಂಟಿಗ್ರೇಶನ್

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

**Dapr ಹೊಂದಿರುವ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್:**
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
        
        # ಈವೆಂಟ್ ಪ್ರಕಟಿಸಿ
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### 1. ಸಂಪತ್ತಿನ ಸಂಘಟನೆ

```bash
# ಸತತ ಹೆಸರು ನಿಯಮಗಳನ್ನು ಬಳಸಿ
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ವೆಚ್ಚ ಟ್ರ್ಯಾಕಿಂಗ್‌ಗಾಗಿ ಸಂಪತ್ತುಗಳನ್ನು ಟ್ಯಾಗ್ ಮಾಡಿ
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

### 3. ಕಾರ್ಯಕ್ಷಮತೆಯ ಆಪ್ಟಿಮೈಸೇಶನ್

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

### 4. ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅವಲೋಕನ

```bash
# ಅಪ್ಲಿಕೇಶನ್ ಇನ್‌ಸೈಟ್ಸ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# ಲಾಗ್‌ಗಳನ್ನು ರಿಯಲ್-ಟೈಮ್‌ನಲ್ಲಿ ವೀಕ್ಷಿಸಿ
azd logs api --follow

# ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor --service api

# ಎಚ್ಚರಿಕೆಗಳನ್ನು ರಚಿಸಿ
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. ವೆಚ್ಚದ ಆಪ್ಟಿಮೈಸೇಶನ್

```bash
# ಬಳಸದಾಗ ಶೂನ್ಯಕ್ಕೆ ಪ್ರಮಾಣಿತಗೊಳಿಸಿ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ಡೆವ್ ಪರಿಸರಗಳಿಗಾಗಿ ಸ್ಪಾಟ್ ಇನ್‌ಸ್ಟಾನ್ಸ್‌ಗಳನ್ನು ಬಳಸಿ
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡಿ
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD ಇಂಟಿಗ್ರೇಶನ್

**GitHub Actions ಉದಾಹರಣೆ:**
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

## ಸಾಮಾನ್ಯ ಕಮಾಂಡ್‌ಗಳ ಉಲ್ಲೇಖ

```bash
# ಹೊಸ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸಿ
azd init --template <template-name>

# ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಮಾತ್ರ ನಿಯೋಜಿಸಿ (ಮೂಲಸೌಕರ್ಯವನ್ನು ಬಿಟ್ಟುಬಿಡಿ)
azd deploy

# ಮೂಲಸೌಕರ್ಯವನ್ನು ಮಾತ್ರ ಒದಗಿಸಿ
azd provision

# ನಿಯೋಜಿತ ಸಂಪತ್ತನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# ಲಾಗ್‌ಗಳನ್ನು ಸ್ಟ್ರೀಮ್ ಮಾಡಿ
azd logs <service-name> --follow

# ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಗಾ ಮಾಡಿ
azd monitor --overview

# ಸಂಪತ್ತನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd down --force --purge
```

## ತೊಂದರೆ ಪರಿಹಾರ

### ಸಮಸ್ಯೆ: ಕಂಟೈನರ್ ಪ್ರಾರಂಭವಾಗುವುದಿಲ್ಲ

```bash
# ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd logs api --tail 100

# ಕಂಟೈನರ್ ಈವೆಂಟ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### ಸಮಸ್ಯೆ: ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ ಅನ್ನು ಪ್ರವೇಶಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ

```bash
# ಇನ್‌ಗ್ರೆಸ್ ಕಾನ್ಫಿಗರೇಶನ್ ಪರಿಶೀಲಿಸಿ
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ಆಂತರಿಕ ಇನ್‌ಗ್ರೆಸ್ ಸಕ್ರಿಯಗೊಂಡಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### ಸಮಸ್ಯೆ: ಕಾರ್ಯಕ್ಷಮತೆಯ ಸಮಸ್ಯೆಗಳು

```bash
# ಸಂಪತ್ತಿನ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ಸಂಪತ್ತನ್ನು ಹೆಚ್ಚಿಸಿ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## ಹೆಚ್ಚುವರಿ ಸಂಪತ್ತುಗಳು ಮತ್ತು ಉದಾಹರಣೆಗಳು
- [ಮೈಕ್ರೋಸರ್ವಿಸ್‌ಗಳ ಉದಾಹರಣೆ](./microservices/README.md)
- [ಸರಳ Flash API ಉದಾಹರಣೆ](./simple-flask-api/README.md)
- [Azure Container Apps ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/container-apps/)
- [AZD ಟೆಂಪ್ಲೇಟ್ಸ್ ಗ್ಯಾಲರಿ](https://azure.github.io/awesome-azd/)
- [Container Apps ಮಾದರಿಗಳು](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep ಟೆಂಪ್ಲೇಟ್ಸ್](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## ಕೊಡುಗೆ ನೀಡುವುದು

ಹೊಸ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಉದಾಹರಣೆಗಳನ್ನು ಕೊಡುಗೆ ನೀಡಲು:

1. ನಿಮ್ಮ ಉದಾಹರಣೆಯೊಂದಿಗೆ ಹೊಸ ಉಪಡೈರೆಕ್ಟರಿ ರಚಿಸಿ
2. ಸಂಪೂರ್ಣ `azure.yaml`, `infra/`, ಮತ್ತು `src/` ಫೈಲ್‌ಗಳನ್ನು ಸೇರಿಸಿ
3. ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸೂಚನೆಗಳೊಂದಿಗೆ ಸಮಗ್ರ README ಸೇರಿಸಿ
4. `azd up` ಬಳಸಿ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಪರೀಕ್ಷಿಸಿ
5. ಪುಲ್ ರಿಕ್ವೆಸ್ಟ್ ಸಲ್ಲಿಸಿ

---

**ಸಹಾಯ ಬೇಕೆ?** [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) ಸಮುದಾಯವನ್ನು ಸೇರಿ ಬೆಂಬಲ ಮತ್ತು ಪ್ರಶ್ನೆಗಳಿಗೆ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸಮೀಕ್ಷೆ**:  
ಈ ದಾಖಲೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಎಂಬ AI ಅನುವಾದ ಸೇವೆಯನ್ನು ಬಳಸಿಕೊಂಡು ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಮರ್ಪಕತೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಾಖಲೆ ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪುಅರ್ಥಗಳು ಅಥವಾ ತಪ್ಪುಅರ್ಥೈಸುವಿಕೆಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->