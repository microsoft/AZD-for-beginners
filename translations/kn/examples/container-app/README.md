# AZD ಮೂಲಕ ಕಂಟೈನರ್ ಅಪ್ಸ್ ನಿಯೋಜನೆ ಉದಾಹರಣೆಗಳು

ಈ ಡೈರೆಕ್ಟರಿ Azure Developer CLI (AZD) ಬಳಸಿ Azure Container Apps ಗೆ ಕಂಟೇನರೈಸ್ ಮಾಡಲಾದ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಲು ಸಮಗ್ರ ಉದಾಹರಣೆಗಳನ್ನು ಹೊಂದಿದೆ. ಈ ಉದಾಹರಣೆಗಳು ನೈಜ ಜಗತ್ತಿನ ಮಾದರಿಗಳು, ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು, ಮತ್ತು ಉತ್ಪಾದನಾ-ತರದ ಸಂರಚನೆಗಳನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತವೆ.

## 📚 ವಿಷಯಸೂಚಿ

- [ಅವಲೋಕನ](#ಅವಲೋಕನ)
- [ಆವಶ್ಯಕತೆಗಳು](#ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು)
- [ತ್ವರಿತ ಪ್ರಾರಂಭ ಉದಾಹರಣೆಗಳು](#ತ್ವರಿತ-ಪ್ರಾರಂಭ-ಉದಾಹರಣೆಗಳು)
- [ಉತ್ಪಾದನಾ ಉದಾಹರಣೆಗಳು](#ಉತ್ಪಾದನಾ-ಉದಾಹರಣೆಗಳು)
- [ಉನ್ನತ ಮಾದರಿಗಳು](#ಉನ್ನತ-ಮಾದರಿಗಳು)
- [ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು](#ಉತ್ತಮ-ಅಭ್ಯಾಸಗಳು)

## ಅವಲೋಕನ

Azure Container Apps 는 ಮ್ಯಾನೇಜ್ಡ್ ಸರ್ವರ್‌ಲೆಸ್ ಕಂಟೈನರ್ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ ಆಗಿದ್ದು, ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ನಿರ್ವಹಣೆ ಕೈಗೊಳ್ಳದೆ ಮೈಕ್ರೋಸರ್ವಿಸ್ಗಳನ್ನು ಮತ್ತು ಕಂಟೇನರ್‌ಅಧಾರಿತ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಚಾಲನೆ ಮಾಡಲು ಅನುಮತಿಸುತ್ತದೆ. AZD ಜೊತೆಗೆ ಬಳಕೆ ಮಾಡಿದಾಗ, ನೀವು ಪಡೆಯುತ್ತೀರಿ:

- **ಸರಳಗೊಳಿಸಲಾದ ನಿಯೋಜನೆ**: ಒಂದು ಒಡನಂತಹ ಕಮಾಂಡ್ ಮೂಲಕ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮತ್ತು ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್
- **ಸ್ವಯಂಚಾಲಿತ ಸ್ಕೇಲಿಂಗ್**: HTTP ಟ್ರಾಫಿಕ್ ಅಥವಾ ಇವென್ಟ್‌ಗಳ ಆಧಾರದ ಮೇಲೆ ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್ ಮಾಡುವುದು ಮತ್ತು ಸ್ಕೇಲ್ ಔಟ್ ಮಾಡುವುದು
- **ಒಗ್ಗೂಡಿಸಿದ ನೆಟ್ವರ್ಕಿಂಗ್**: встроенный ಸೇವಾ ಹುಡುಕಿ ಮತ್ತು ಟ್ರಾಫಿಕ್ ವಿಂಗಡಣೆ
- **Managed Identity**: Azure ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಭದ್ರ ಪ್ರಮಾಣೀಕರಣ
- **ವೆಚ್ಚದ ಆಪ್ಟಿಮೈಜೆಶನ್**: ನೀವು ಬಳಸಿದ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಮಾತ್ರ ಪಾವತಿ

## ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು

ಆರಂಭಿಸುವ ಮುನ್ನ, ಖಾತ್ರಿ ಮಾಡಿ ನಿಮ್ಮ ಬಳಿ:

```bash
# AZD ಸ್ಥಾಪನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd version

# Azure CLI ಅನ್ನು ಪರಿಶೀಲಿಸಿ
az version

# Docker ಅನ್ನು ಪರಿಶೀಲಿಸಿ (ಕಸ್ಟಮ್ ಇಮೇಜ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಲು)
docker --version

# Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
azd auth login
az login
```

**ಬೇಕಾಗುವ Azure ಸಂಪನ್ಮೂಲಗಳು:**
- ಸಕ್ರಿಯ Azure ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್
- Resource group ರಚನೆ ಪರವಾನಗಿಗಳು
- Container Apps ಪರಿಸರಕ್ಕೆ ಪ್ರವೇಶ

## ತ್ವರಿತ ಪ್ರಾರಂಭ ಉದಾಹರಣೆಗಳು

### 1. ಸರಳ ವೆಬ್ API (Python Flask)

Azure Container Apps ಬಳಸಿ ಮೂಲಭೂತ REST API ಅನ್ನು ನಿಯೋಜಿಸಿ.

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
# ಟೆಂಪ್ಲೇಟಿನಿಂದ ಆರಂಭಿಸಿ
azd init --template todo-python-mongo

# ಮೂಲಸೌಕರ್ಯವನ್ನು ಒದಗಿಸಿ ಮತ್ತು ಸ್ಥಾಪಿಸಿ
azd up

# ಸ್ಥಾಪನೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ಮುಖ್ಯ ಲಕ್ಷಣಗಳು:**
- ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ 0 ರಿಂದ 10 ಪ್ರತಿರೂಪಗಳವರೆಗೆ
- ಆರೋಗ್ಯ ಪರೀಕ್ಷೆಗಳು ಮತ್ತು ಲೈವ್ನೆಸ್ ಪರಿಶೀಲನೆಗಳು
- ಪರಿಸರ ಚರಗಳ ಸೇರ್ಪಡೆ
- Application Insights ಏಕೀಕರಣ

### 2. Node.js Express API

MongoDB ಏಕೀಕರಣದೊಂದಿಗೆ Node.js ಬ್ಯಾಕೆಂಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ.

```bash
# Node.js API ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-nodejs-mongo

# ಪರಿಸರ ಚರಗಳನ್ನು ಸಂರಚಿಸಿ
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd up

# Azure Monitor ಮೂಲಕ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs
```

**ಅಧಿರಚನಾ ಮುಖ್ಯಾಂಶಗಳು:**
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

React ಫ್ರಂಟ್‌ಎಂಡ್ ಮತ್ತು API ಬ್ಯಾಕೆಂಡ್ ಹೊಂದಿರುವ ಫುಲ್-ಸ್ಟ್ಯಾಕ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ.

```bash
# ಫುಲ್‌ಸ್ಟಾಕ್ ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ಆರಂಭಿಸಿ
azd init --template todo-csharp-sql-swa-func

# ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
cat azure.yaml

# ಎರಡೂ ಸೇವೆಗಳನ್ನೂ ನಿಯೋಜಿಸಿ
azd up

# ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ತೆರೆಯಿರಿ
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## ಉತ್ಪಾದನಾ ಉದಾಹರಣೆಗಳು

### ಉದಾಹರಣೆ 1: ಮೈಕ್ರೋಸರ್ವಿಸಿಸ್ ವಾಸ್ತುಶಿಲ್ಪ

**ದೃಶ್ಯ**: ಬಹು ಮೈಕ್ರೋಸರ್ವಿಸ್ಗಳೊಂದಿಗೆ ಇ-ಕಾಮರ್ಸ್ ಅಪ್ಲಿಕೇಶನ್

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

# ಉತ್ಪಾದನಾ ಪರಿಸರವನ್ನು ಹೊಂದಿಸಿ
azd env new production

# ಉತ್ಪಾದನಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಸಂರಚಿಸಿ
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ಜಾರಿಗೆ ತರು
azd up

# ಜಾರಿಗೊಳಿಸುವಿಕೆಯನ್ನು ನಿಗಾ ವಹಿಸಿ
azd monitor --overview
```

### ಉದಾಹರಣೆ 2: ಏಐ ಚಾಲಿತ ಕಂಟೇನರ್ ಅಪ್

**ದೃಶ್ಯ**: Microsoft Foundry Models ಏಕೀಕರಣದೊಂದಿಗೆ ಏಐ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್

**ಫೈಲ್: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# ಭದ್ರ ಪ್ರವೇಶಕ್ಕಾಗಿ Managed Identity ಅನ್ನು ಬಳಸಿ
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # OpenAI ಕೀಲಿಯನ್ನು Key Vault-ನಿಂದ ಪಡೆಯಿರಿ
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

**ನಿಯೋಜನೆ ಕಮಾಂಡ್ಗಳು:**
```bash
# ಪರಿಸರವನ್ನು ಸಜ್ಜುಗೊಳಿಸಿ
azd init --template ai-chat-app
azd env new dev

# OpenAI ಅನ್ನು ಸಂರಚಿಸಿ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# ವಿತರಣೆಗೆ ಹಾಕಿ
azd up

# API ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ಉದಾಹರಣೆ 3: पछि ಭೂಮಿಕೆಯಲ್ಲಿ ಕಾರ್ಯನಿರ್ವಹಿಸುವ ವರ್ಕರ್ ಹಾಗೂ ಕ್ಯೂ ಪ್ರಾಸೆಸಿಂಗ್

**ದೃಶ್ಯ**: ಸಂದೇಶ ಕ್ಯೂ ಹೊಂದಿರುವ ಆರ್ಡರ್ ಪ್ರಾಸೆಸಿಂಗ್ ವ್ಯವಸ್ಥೆ

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
            # ಆದೇಶವನ್ನು ಸಂಸ್ಕರಿಸಿ
            print(f"Processing order: {message.content}")
            
            # ಸಂಪೂರ್ಣ ಸಂದೇಶ
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
# ಆರಂಭಿಸಿ
azd init

# ಕ್ಯೂ ಸಂರಚನೆ ಬಳಸಿ ನಿಯೋಜಿಸಿ
azd up

# ಕ್ಯೂ ಉದ್ದದ ಆಧಾರದ ಮೇಲೆ worksರ್‌ಗಳ ಸಂಖ್ಯೆಯನ್ನು ಹೊಂದಿಸಿ
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## ಉನ್ನತ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: ಬ್ಲ್ಯೂ-ಗ್ರೀನ್ ನಿಯೋಜನೆ

```bash
# ಟ್ರಾಫಿಕ್ ಇಲ್ಲದೆ ಹೊಸ ರಿವಿಷನ್ ರಚಿಸಿ
azd deploy api --revision-suffix blue --no-traffic

# ಹೊಸ ರಿವಿಷನ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ಟ್ರಾಫಿಕ್ ಅನ್ನು ವಿಭಜಿಸಿ (20% ನೀಲಿಗೆ, 80% ಪ್ರಸ್ತುತಕ್ಕೆ)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# ಸಂಪೂರ್ಣವಾಗಿ ನೀலಿಗೆ ವರ್ಗಾಯಿಸಿ
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### ಮಾದರಿ 2: AZD ಜೊತೆಗೆ ಕ್ಯಾನರಿ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್

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

# ಹೊಸ ಆವೃತ್ತಿಯನ್ನು 10% ಟ್ರಾಫಿಕ್‌ನೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd deploy api --revision-mode multiple

# ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor --service api --duration 5m

# ಕ್ರಮೇಣ ಟ್ರಾಫಿಕ್ ಹೆಚ್ಚಿಸಿ
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 ನಿಮಿಷ ಕಾಯಿರಿ
done
```

### ಮಾದರಿ 3: ಬಹು-ಪ್ರದೇಶ ನಿಯೋಜನೆ

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
# ಎಲ್ಲಾ ಜಿಲ್ಲೆಗಳಲ್ಲಿ ನಿಯೋಜಿಸಿ
azd up

# ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json | jq '.services.api.endpoints'
```

### ಮಾದರಿ 4: Dapr ಏಕೀಕರಣ

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
# ಒಂದೇ ರೀತಿಯ ನಾಮಕರಣ ಸಂಪ್ರदಾಯಗಳನ್ನು ಉಪಯೋಗಿಸಿ
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ವೆಚ್ಚದ ಟ್ರ್ಯಾಕಿಂಗ್‌ಗಾಗಿ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಟ್ಯಾಗ್ ಮಾಡಿ
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. ಭದ್ರತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

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

### 3. ಕಾರ್ಯಕ್ಷಮತೆ ಪರಿಷ್ಕರಣೆ

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

### 4. ನಿಗಾ ಮತ್ತು ನಿರೀಕ್ಷಣಾಸಾಮರ್ಥ್ಯ

```bash
# Application Insights ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# ಲಾಗ್‌ಗಳನ್ನು ನೈಜ ಸಮಯದಲ್ಲಿ ವೀಕ್ಷಿಸಿ
azd monitor --logs
# ಅಥವಾ ಕಂಟೇನರ್ ಆಪ್‌ಗಳಿಗೆ Azure CLI ಅನ್ನು ಬಳಸಿ:
az containerapp logs show --name api --resource-group rg-myapp --follow

# ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor --live

# ಅಲರ್ಟ್‌ಗಳನ್ನು ರಚಿಸಿ
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. ವೆಚ್ಚ ಪರಿಷ್ಕರಣೆ

```bash
# ಬಳಕೆ ಆಗದಾಗ ಶೂನ್ಯಕ್ಕೆ ಪ್ರಮಾಣವನ್ನು ಇಳಿಸಿ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ಡೆವ್ ಪರಿಸರಗಳಿಗಾಗಿ ಸ್ಪಾಟ್ ಇನ್ಸ್ಟಾನ್ಸ್ಗಳನ್ನು ಬಳಸಿ
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸ್ಥಾಪಿಸಿ
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD ಏಕೀಕರಣ

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

## ಸಾಮಾನ್ಯ ಕಮಾಂಡ್‍ಗಳು ಉಲ್ಲೇಖ

```bash
# ಹೊಸ ಕಾಂಟೈನರ್ ಆಪ್ ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template <template-name>

# ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ಕೇವಲ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ (ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಬಿಟ್ಟುಕೊಡಿ)
azd deploy

# ಕೇವಲ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಒದಗಿಸಿ
azd provision

# ನಿಯೋಜಿಸಲಾದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# azd monitor ಅಥವಾ Azure CLI ಬಳಸಿ ಲಾಗ್‌ಗಳನ್ನು ಸ್ಟ್ರೀಮ್ ಮಾಡಿ
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor --overview

# ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ
azd down --force --purge
```

## ಸಮಸ್ಯೆ ಪರಿಹಾರ

### ಸಮಸ್ಯೆ: ಕಂಟೈನರ್ ಪ್ರಾರಂಭವಾಗುವುದಿಲ್ಲ

```bash
# Azure CLI ಬಳಸಿ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# ಕಂಟೈನರ್ ಘಟನೆಗಳನ್ನು ವೀಕ್ಷಿಸಿ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### ಸಮಸ್ಯೆ: ಕಂಟೈನರ್ ಅಪ್ ಎಂಡ್ಪಾಯಿಂಟ್ ಪ್ರವೇಶಿಸಲು ಆಗುತ್ತಿಲ್ಲ

```bash
# ಇನ್‌ಗ್ರೆಸ್ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ಆಂತರಿಕ ಇನ್‌ಗ್ರೆಸ್ ಸಕ್ರಿಯವಾಗಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
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
- [ಮೈಕ್ರೋಸರ್ವಿಸಸ್ ಉದಾಹರಣೆ](./microservices/README.md)
- [ಸರಳ Flask API ಉದಾಹರಣೆ](./simple-flask-api/README.md)
- [Azure Container Apps ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Container Apps ಉದಾಹರಣೆಗಳು](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## ಕೊಡುಗೆ

ಹೊಸ ಕಂಟೈನರ್ ಅಪ್ ಉದಾಹರಣೆಗಳನ್ನು ಕೊಡುಗೆ ನೀಡಲು:

1. ನಿಮ್ಮ ಉದಾಹರಣೆಯೊಂದಿಗೆ ಹೊಸ ಸಬ್‍ಡೈರೆಕ್ಟರಿ ರಚಿಸಿ
2. ಸಂಪೂರ್ಣ `azure.yaml`, `infra/`, ಮತ್ತು `src/` ಫೈல்கள் ಸೇರಿಸಿ
3. ನಿಯೋಜನೆ ಸೂಚನೆಗಳೊಂದಿಗೆ ಸಮಗ್ರ README ಸೇರಿಸಿ
4. `azd up` ಬಳಸಿ ನಿಯೋಜನೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
5. ಪುಲ್ ರಿಕ್ವೆಸ್ಟ್ ಸಲ್ಲಿಸಿ

---

**ಸಹಾಯ ಬೇಕು?** ಬೆಂಬಲ ಮತ್ತು ಪ್ರಶ್ನೆಗಳಿಗೆ [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) ಸಮುದಾಯಕ್ಕೆ ಸೇರಿಕೊಳ್ಳಿ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ನಿರಾಕರಣೆ**:
ಈ ದಸ್ತಾವೇಜನ್ನು [Co-op Translator](https://github.com/Azure/co-op-translator) ಎಂಬ ಕೃತಕ ಬುದ್ಧಿಮತ್ತೆ ಆಧಾರಿತ ಅನುವಾದ ಸೇವೆಯನ್ನು ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸತ್ಯತೆಗಳು ಇರಬಹುದೆಂದನ್ನು ದಯವಿಟ್ಟು ಗಮನದಲ್ಲಿರಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿನ ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವುದರಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿಕೆಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->