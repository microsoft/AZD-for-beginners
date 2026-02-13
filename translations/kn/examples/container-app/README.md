# AZD ನೊಂದಿಗೆ Container App ನಿಯೋಜನೆ ಉದಾಹರಣೆಗಳು

ಈ ಡೈರೆಕ್ಟರಿ Azure Developer CLI (AZD) ಬಳಸಿಕೊಂಡು containerized ಅನ್ವಯಿಕೆಗಳನ್ನು Azure Container Apps ಗೆ ನಿಯೋಜಿಸುವ ಸಮಗ್ರ ಉದಾಹರಣೆಗಳನ್ನು ಹೊಂದಿದೆ. ಈ ಉದಾಹರಣೆಗಳು ನೈಜ-ಲೋಕದ ಮಾದರಿಗಳು, ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು ಮತ್ತು ಉತ್ಪಾದನೆ-ಸಿದ್ಧ ಸಂರಚನೆಗಳನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತವೆ.

## 📚 ವಿಷಯಗಳ ಸೂಚಿ

- [ಅವಲೋಕನ](../../../../examples/container-app)
- [ಆವಶ್ಯಕತೆಗಳು](../../../../examples/container-app)
- [ತ್ವರಿತ ಪ್ರಾರಂಭ ಉದಾಹರಣೆಗಳು](../../../../examples/container-app)
- [ಉತ್ಪಾದನಾ ಉದಾಹರಣೆಗಳು](../../../../examples/container-app)
- [ಉನ್ನತ ಮಾದರಿಗಳು](../../../../examples/container-app)
- [ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು](../../../../examples/container-app)

## Overview

Azure Container Apps ಒಂದು ಸಂಪೂರ್ಣವಾಗಿ ನಿರ್ವಹಿಸಲಾಗುವ ಸೆರ್ವರ್ ರಹಿತ ಕಂಟೈನರ್ ವೇದಿಕೆ ಆಗಿದ್ದು, ಮೂಲಸೌಕರ್ಯವನ್ನು ನಿರ್ವಹಿಸದೆ ನಿಮ್ಮನ್ನು ಮೈಕ್ರಮೋಸರ್ವಿಸ್‌ಗಳು ಮತ್ತು containerized ಅನ್ವಯಿಕೆಗಳನ್ನು ચલಿಸಲು ಅನುಮತಿಸುತ್ತದೆ. AZD ಜೊತೆಗೆ ಸಂಯೋಜಿಸಿದಾಗ, ನಿಮಗೆ ಸಿಗುತ್ತದೆ:

- **ಸರಳೀಕೃತ ನಿಯೋಜನೆ**: ಒಂದು ಕಮಾಂಡ್ ಅನ್ನು ಬಳಸಿಕೊಂಡು ಕಂಟೈನರ್‌ಗಳನ್ನು ಮತ್ತು ಮೂಲಸೌಕರ್ಯವನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ
- **ಸ್ವಯಂಚಾಲಿತ ಸ್ಕೇಲಿಂಗ್**: HTTP ಟ್ರಾಫಿಕ್ ಅಥವಾ ಈವೆಂಟ್‌ಗಳ ಆಧಾರದಲ್ಲಿ 0ಕ್ಕೆ ಸ್ಕೇಲ್ ಮಾಡುವುದು ಮತ್ತು ಸ್ಕೇಲ್ ಮಾಡಲು ವಿಸ್ತರಿಸುವುದು
- **ಒಗ್ಗೂಡಿಸಲಾದ ನೆಟ್ವರ್ಕಿಂಗ್**: ಸ್ಥಳದಲ್ಲೇ ಸೇವಾ ಕಂಡುಹಿಡಿಮೆ ಮತ್ತು ಟ್ರಾಫಿಕ್ ಮತ್ತುುದ್ಧರಣೆ
- **Managed Identity**: Azure ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಸುರಕ್ಷಿತ ಪ್ರಾಮಾಣೀಕರಣ
- **ವೆಚ್ಚದ ಸುಧಾರಣೆ**: ನೀವು ಬಳಸುವ ಸಂಪನ್ಮೂಲಗಳಿಗಾಗಿ ಮಾತ್ರ ಪಾವತಿಸಿ

## Prerequisites

ಪ್ರಾರಂಭಿಸುವ ಮೊದಲು, ನಿಮ್ಮ ಬಳಿ ಈವು ಇರುವುದನ್ನು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ:

```bash
# AZD ಸ್ಥಾಪನೆ ಪರಿಶೀಲಿಸಿ
azd version

# Azure CLI ಪರಿಶೀಲಿಸಿ
az version

# Docker (ಕಸ್ಟಮ್ ಇಮೇಜ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಲು) ಪರಿಶೀಲಿಸಿ
docker --version

# Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
azd auth login
az login
```

**ಅಗತ್ಯ Azure ಸಂಪನ್ಮೂಲಗಳು:**
- ಸಕ್ರಿಯ Azure ಸಬ್‌ಸ್ಕ್ರಿಪ್ಷನ್
- Resource group ರಚನೆ ಮಾಡಬಹುದಾದ ಅನುವು
- Container Apps ماحولへの ಪ್ರಾಪ್ತಿ

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Azure Container Apps ಬಳಸಿ ಮೂಲ REST API ಅನ್ನು ನಿಯೋಜಿಸಿ.

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

**ನಿಯೋಜನೆಯ ಹಂತಗಳು:**

```bash
# ಟೆಂಪ್ಲೇಟಿನಿಂದ ಆರಂಭಿಸಿ
azd init --template todo-python-mongo

# ಭೌತಸೌಕರ್ಯವನ್ನು ಒದಗಿಸಿ ಮತ್ತು ನಿಯೋಜಿಸಿ
azd up

# ನಿಯೋಜನೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ಮುಖ್ಯ ವೈಶಿಷ್ಟ್ಯಗಳು:**
- 0 ರಿಂದ 10 ರಿಪ್ಲಿಕಾಗಳಿಗೆ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್
- ಹೆಲ್ತ್ ಪ್ರೋಬ್‌ಗಳು ಮತ್ತು ಲೈವ್ನೆಸ್ ಪರಿಶೀಲನೆಗಳು
- ಪರಿಸರ ಚರರಗಳನ್ನು ಸೇರಿಸುವಿಕೆ
- Application Insights ಏಕೀಕರಣ

### 2. Node.js Express API

MongoDB ಸಂಯೋಜನೆ ಸಹಿತ Node.js ಬ್ಯಾಕೆಂಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ.

```bash
# Node.js API ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-nodejs-mongo

# ಪರಿಸರ ಚರಗಳನ್ನು ಸಂರಚಿಸಿ
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ಡೆಪ್ಲಾಯ್ ಮಾಡಿ
azd up

# Azure Monitor ಮೂಲಕ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs
```

**ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮುಖ್ಯಾಂಶಗಳು:**
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

### 3. స్థಿರ ఫ్రంట్‌ಎಂಡ್ + API ಬ್ಯಾಕೆಂಡ್

React ಫ್ರಂಟ್‌ಎಂಡ್ ಮತ್ತು API ಬ್ಯಾಕೆಂಡ್ ಸಹಿತ ಪೂರ್ಣ-ಸ್ಟಾಕ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ.

```bash
# ಪೂರ್ಣ-ಸ್ಟ್ಯಾಕ್ ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-csharp-sql-swa-func

# ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
cat azure.yaml

# ಎರಡೂ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ತೆರೆಯಿರಿ
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**ದೃಶ್ಯ**: ಬಹು ಮೈಕ್ರೋಸರ್ವಿಸ್ ಗಳೊಂದಿಗೆ ಇ-ಕಾಮರ್ಸ್ ಅಪ್ಲಿಕೇಶನ್

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
# ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init

# ಉತ್ಪಾದನಾ ಪರಿಸರವನ್ನು ಹೊಂದಿಸಿ
azd env new production

# ಉತ್ಪಾದನಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಸಂರಚಿಸಿ
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ತೈನಾತು ಮಾಡಿ
azd up

# ನಿಯೋಜನೆಯನ್ನು ಮೇಲ್ವಿಚಾರಿಸಿ
azd monitor --overview
```

### Example 2: AI-Powered Container App

**ದೃಶ್ಯ**: Azure OpenAI ಸಂಯೋಜನೆಯೊಂದಿಗೆ AI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್

**ಫೈಲ್: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# ಸುರಕ್ಷಿತ ಪ್ರವೇಶಕ್ಕಾಗಿ Managed Identity ಅನ್ನು ಬಳಸಿ
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Key Vault ನಿಂದ OpenAI ಕೀ ಪಡೆಯಿರಿ
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

**ನಿಯೋಜನಾ ಕಮಾಂಡ್‌ಗಳು:**
```bash
# ಪರಿಸರವನ್ನು ಸಿದ್ಧಪಡಿಸಿ
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

### Example 3: Background Worker with Queue Processing

**ದೃಶ್ಯ**: ಸಂದೇಶ ಕ್ಯೂಯೊಂದಿಗೆ ಆರ್ಡರ್ ಪ್ರೊಸೆಸಿಂಗ್ ವ್ಯವಸ್ಥೆ

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
            # ಆದೇಶ ಪ್ರಕ್ರಿಯೆ
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

# ಕ್ಯೂ ಸಂರಚನೆಯೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up

# ಕ್ಯೂದ ಉದ್ದದ ಆಧಾರದ ಮೇಲೆ ಕಾರ್ಯಕರ್ತರ ಪ್ರಮಾಣವನ್ನು ಹೊಂದಿಸಿ
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### ಮಾದರಿ 1: Blue-Green Deployment

```bash
# ಟ್ರಾಫಿಕ್ ಇಲ್ಲದೆ ಹೊಸ ರಿವಿಷನ್ ಅನ್ನು ರಚಿಸಿ
azd deploy api --revision-suffix blue --no-traffic

# ಹೊಸ ರಿವಿಷನ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ಟ್ರಾಫಿಕ್ ವಿಂಗಡಿಸಿ (20% ಅನ್ನು ನೀಲಿಗೆ, 80% ಅನ್ನು ಪ್ರಸ್ತುತಕ್ಕೆ)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# ಸಂಪೂರ್ಣವಾಗಿ ನೀಲಿಗೆ ಸ್ಥಳಾಂತರಿಸಿ
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### ಮಾದರಿ 2: Canary Deployment with AZD

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

**ನಿಯೋಜನಾ ಸ್ಕ್ರಿಪ್ಟ್:**
```bash
#!/bin/bash
# deploy-canary.sh

# ಹೊಸ ರಿವಿಷನ್ ಅನ್ನು 10% ಟ್ರಾಫಿಕ್‌ಗೆ ನಿಯೋಜಿಸಿ
azd deploy api --revision-mode multiple

# ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ನಿರೀಕ್ಷಿಸಿ
azd monitor --service api --duration 5m

# ಟ್ರಾಫಿಕ್ ಅನ್ನು ಕ್ರಮೇಣ ಹೆಚ್ಚಿಸಿ
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 ನಿಮಿಷಗಳ ಕಾಲ ಕಾಯಿರಿ
done
```

### ಮಾದರಿ 3: Multi-Region Deployment

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
# ಎಲ್ಲಾ ಪ್ರಾಂತ್ಯಗಳಲ್ಲಿ ನಿಯೋಜಿಸಿ
azd up

# ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json | jq '.services.api.endpoints'
```

### ಮಾದರಿ 4: Dapr Integration

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

**Dapr ನೊಂದಿಗೆ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್:**
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
        
        # ಘಟನೆಯನ್ನು ಪ್ರಕಟಿಸಿ
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Best Practices

### 1. ಸಂಪನ್ಮೂಲ ಸಂಘಟನೆ

```bash
# ಏಕರೂಪ ಹೆಸರಿಸುವ ನಿಯಮಗಳನ್ನು ಬಳಸಿ
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ಖರ್ಚು ಅನುಸರಣೆಗಾಗಿ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಗುರುತಿಸಿ
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

### 3. ಕಾರ್ಯಕ್ಷಮತೆ ಉತ್ತಮಗೊಳಿಸುವಿಕೆ

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

### 4. ನಿಗಾ ಮತ್ತು ನಿರೀಕ್ಷಣೀಯತೆ

```bash
# Application Insights ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# ಲಾಗ್‌ಗಳನ್ನು ನೇರ ಸಮಯದಲ್ಲಿ ವೀಕ್ಷಿಸಿ
azd monitor --logs
# ಅಥವಾ Container Apps සඳහා Azure CLI ಅನ್ನು ಬಳಸಿ:
az containerapp logs show --name api --resource-group rg-myapp --follow

# ಮೆಟ್ರಿಕ್ಸ್ ಅನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor --live

# ಎಚ್ಚರಿಕೆಗಳನ್ನು ರಚಿಸಿ
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. ವೆಚ್ಚದ ಸುಧಾರಣೆ

```bash
# ಬಳಕೆಯಲ್ಲದಾಗ ಶೂನ್ಯಕ್ಕೆ ಕಡಿಮೆ ಮಾಡಿ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ವಿಕಾಸ ಪರಿಸರಗಳಿಗೆ ಸ್ಪಾಟ್ ಇನ್ಸ್ಟಾನ್ಸ್‌ಗಳನ್ನು ಬಳಸಿ
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

## Common Commands Reference

```bash
# ಹೊಸ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಯೋಜನೆಯನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template <template-name>

# ಅಧೋಸಂರಚನೆ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ಕೇವಲ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ (ಅಧೋಸಂರಚನೆಯನ್ನು ಬಿಟ್ಟುಬಿಡಿ)
azd deploy

# ಮಾತ್ರ ಅಧೋಸಂರಚನೆಯನ್ನು ಒದಗಿಸಿ
azd provision

# ನಿಯೋಜಿಸಲಾದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# azd monitor ಅಥವಾ Azure CLI ಉಪಯೋಗಿಸಿ ಲಾಗ್‌ಗಳನ್ನು ಸ್ಟ್ರೀಮ್ ಮಾಡಿ
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor --overview

# ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ
azd down --force --purge
```

## Troubleshooting

### ಸಮಸ್ಯೆ: ಕಾಂಟೇನರ್ ಪ್ರಾರಂಭವಾಗುವುದಿಲ್ಲ

```bash
# Azure CLI ಬಳಸಿ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# ಕಂಟೇನರ್ ಘಟನೆಗಳನ್ನು ವೀಕ್ಷಿಸಿ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### ಸಮಸ್ಯೆ: ಕಾಂಟೇನರ್ ಅಪ್ಲಿಕೇಶನ್ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗೆ ಪ್ರವೇಶ ಸಾಧ್ಯವಿಲ್ಲ

```bash
# ಇನ್ಗ್ರೆಸ್ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ಆಂತರಿಕ ಇನ್ಗ್ರೆಸ್ ಸಕ್ರಿಯವಾಗಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
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

## Additional Resources and Examples
- [ಮೈಕ್ರೋಸರ್ವಿಸ್ ಉದಾಹರಣೆ](./microservices/README.md)
- [ಸರಳ ಫ್ಲಾಶ್ API ಉದಾಹರಣೆ](./simple-flask-api/README.md)
- [Azure Container Apps ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/container-apps/)
- [AZD ಟೆಂಪ್ಲೇಟ್ಸ್ ಗ್ಯಾಲರಿ](https://azure.github.io/awesome-azd/)
- [Container Apps ಮಾದರಿಗಳು](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep ಟೆಂಪ್ಲೇಟ್ಸ್](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## ಕೊಡುಗೆ ನೀಡುವುದು

ಹೊಸ container app ಉದಾಹರಣೆಗಳನ್ನು ಕೊಡುಗೆ ನೀಡಲು:

1. ನಿಮ್ಮ ಉದಾಹರಣೆಯೊಂದಿಗೆ ಹೊಸ ಉಪಡೈರೆಕ್ಟರಿ ರಚಿಸಿ
2. ಸಂಪೂರ್ಣ `azure.yaml`, `infra/`, ಮತ್ತು `src/` ಫೈಲ್‌ಗಳನ್ನು ಸೇರಿಸಿ
3. ನಿಯೋಜನೆ ಸೂಚನೆಗಳನ್ನು ಹೊಂದಿರುವ ವಿವರವಾದ README ಅನ್ನು ಸೇರಿಸಿ
4. `azd up` ಬಳಸಿ ನಿಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
5. ಒಂದು pull request ಸಲ್ಲಿಸಿ

---

**ಸಹಾಯ ಬೇಕೇ?** ಬೆಂಬಲ ಮತ್ತು ಪ್ರಶ್ನೆಗಳಿಗಾಗಿ [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) ಸಮುದಾಯಕ್ಕೆ ಸೇರಿ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಅಸ್ವೀಕರಣ:
ಈ ದಾಖಲೆ ಅನ್ನು ಎಐ ಭಾಷಾಂತರ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಂಗತತೆಗಳು ಇರಬಹುದು ಎಂದು ದಯವಿಟ್ಟು ಜ್ಞಾನದಲ್ಲಿಡಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿನ ಮೂಲ ದಾಖಲೆನೇ ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮುಖ್ಯವಾದ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ misunderstanding ಗಳಿಗೆ ಅಥವಾ ತಪ್ಪಾಗಿ ವ್ಯಾಖ್ಯಾನಗೊಂಡ ಪರಿಣಾಮಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->