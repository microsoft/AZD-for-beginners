<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-22T10:35:20+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "tl"
}
-->
# Mga Halimbawa ng Pag-deploy ng Container App gamit ang AZD

Ang direktoryong ito ay naglalaman ng mga detalyadong halimbawa para sa pag-deploy ng mga containerized na aplikasyon sa Azure Container Apps gamit ang Azure Developer CLI (AZD). Ang mga halimbawang ito ay nagpapakita ng mga aktwal na pattern, pinakamahusay na kasanayan, at mga configuration na handa para sa produksyon.

## 📚 Talaan ng Nilalaman

- [Pangkalahatang-ideya](../../../../examples/container-app)
- [Mga Kinakailangan](../../../../examples/container-app)
- [Mga Halimbawa ng Mabilisang Pagsisimula](../../../../examples/container-app)
- [Mga Halimbawa para sa Produksyon](../../../../examples/container-app)
- [Mga Advanced na Pattern](../../../../examples/container-app)
- [Pinakamahusay na Kasanayan](../../../../examples/container-app)

## Pangkalahatang-ideya

Ang Azure Container Apps ay isang ganap na pinamamahalaang serverless container platform na nagbibigay-daan sa iyo na magpatakbo ng mga microservices at containerized na aplikasyon nang hindi kinakailangang pamahalaan ang imprastruktura. Kapag pinagsama sa AZD, makakakuha ka ng:

- **Pinadaling Pag-deploy**: Isang utos para sa pag-deploy ng mga container kasama ang imprastruktura
- **Awtomatikong Pag-scale**: Pag-scale sa zero at pag-scale out batay sa HTTP traffic o mga kaganapan
- **Integrated Networking**: Built-in na service discovery at traffic splitting
- **Managed Identity**: Secure na authentication sa mga Azure resources
- **Pag-optimize ng Gastos**: Magbayad lamang para sa mga resources na ginagamit mo

## Mga Kinakailangan

Bago magsimula, tiyakin na mayroon ka ng:

```bash
# Suriin ang pag-install ng AZD
azd version

# Suriin ang Azure CLI
az version

# Suriin ang Docker (para sa paggawa ng custom na mga imahe)
docker --version

# Mag-login sa Azure
azd auth login
az login
```

**Mga Kinakailangang Azure Resources:**
- Aktibong Azure subscription
- Mga pahintulot para sa paglikha ng resource group
- Access sa Container Apps environment

## Mga Halimbawa ng Mabilisang Pagsisimula

### 1. Simple Web API (Python Flask)

Mag-deploy ng basic REST API gamit ang Azure Container Apps.

**Halimbawa: Python Flask API**

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

**Mga Hakbang sa Pag-deploy:**

```bash
# Magsimula mula sa template
azd init --template todo-python-mongo

# Maglaan ng imprastraktura at mag-deploy
azd up

# Subukan ang deployment
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Mga Pangunahing Tampok:**
- Auto-scaling mula 0 hanggang 10 replicas
- Health probes at liveness checks
- Pag-inject ng environment variables
- Application Insights integration

### 2. Node.js Express API

Mag-deploy ng Node.js backend na may MongoDB integration.

```bash
# I-initialize ang template ng Node.js API
azd init --template todo-nodejs-mongo

# I-configure ang mga variable ng kapaligiran
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# I-deploy
azd up

# Tingnan ang mga log
azd logs api
```

**Mga Highlight ng Imprastruktura:**
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

Mag-deploy ng full-stack application na may React frontend at API backend.

```bash
# I-initialize ang full-stack na template
azd init --template todo-csharp-sql-swa-func

# Suriin ang configuration
cat azure.yaml

# I-deploy ang parehong serbisyo
azd up

# Buksan ang application
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Mga Halimbawa para sa Produksyon

### Halimbawa 1: Microservices Architecture

**Scenario**: E-commerce application na may maraming microservices

**Istruktura ng Direktoryo:**
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

**Konfigurasyon ng azure.yaml:**
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

**Pag-deploy:**
```bash
# I-initialize ang proyekto
azd init

# Itakda ang production environment
azd env new production

# I-configure ang production settings
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# I-deploy ang lahat ng serbisyo
azd up

# Subaybayan ang deployment
azd monitor --overview
```

### Halimbawa 2: AI-Powered Container App

**Scenario**: AI chat application na may Azure OpenAI integration

**File: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Gumamit ng Managed Identity para sa ligtas na pag-access
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Kunin ang OpenAI key mula sa Key Vault
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

**Mga Utos sa Pag-deploy:**
```bash
# I-set up ang kapaligiran
azd init --template ai-chat-app
azd env new dev

# I-configure ang OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# I-deploy
azd up

# Subukan ang API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Halimbawa 3: Background Worker na may Queue Processing

**Scenario**: Order processing system na may message queue

**Istruktura ng Direktoryo:**
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
            # Proseso ng order
            print(f"Processing order: {message.content}")
            
            # Kumpletuhin ang mensahe
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

**Pag-deploy:**
```bash
# I-initialize
azd init

# I-deploy gamit ang configuration ng pila
azd up

# I-scale ang worker base sa haba ng pila
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Mga Advanced na Pattern

### Pattern 1: Blue-Green Deployment

```bash
# Gumawa ng bagong rebisyon nang walang trapiko
azd deploy api --revision-suffix blue --no-traffic

# Subukan ang bagong rebisyon
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Hatiin ang trapiko (20% sa asul, 80% sa kasalukuyan)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Ganap na paglipat sa asul
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: Canary Deployment gamit ang AZD

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

**Deployment Script:**
```bash
#!/bin/bash
# deploy-canary.sh

# I-deploy ang bagong rebisyon na may 10% na trapiko
azd deploy api --revision-mode multiple

# Subaybayan ang mga sukatan
azd monitor --service api --duration 5m

# Unti-unting dagdagan ang trapiko
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Maghintay ng 5 minuto
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

**Pag-deploy:**
```bash
# I-deploy sa lahat ng rehiyon
azd up

# I-verify ang mga endpoint
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

**Application Code na may Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # I-save ang estado
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # I-publish ang kaganapan
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Pinakamahusay na Kasanayan

### 1. Organisasyon ng Resources

```bash
# Gumamit ng pare-parehong mga kumbensyon sa pagbibigay ng pangalan
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Lagyan ng tag ang mga resources para sa pagsubaybay ng gastos
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Pinakamahusay na Kasanayan sa Seguridad

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

### 3. Pag-optimize ng Performance

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

### 4. Monitoring at Observability

```bash
# Paganahin ang Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Tingnan ang mga log sa real-time
azd logs api --follow

# Subaybayan ang mga sukatan
azd monitor --service api

# Lumikha ng mga alerto
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Pag-optimize ng Gastos

```bash
# I-scale sa zero kapag hindi ginagamit
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Gumamit ng spot instances para sa mga dev environment
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Mag-set up ng mga alerto sa badyet
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

**Halimbawa ng GitHub Actions:**
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

## Karaniwang Mga Utos na Sanggunian

```bash
# I-initialize ang bagong proyekto ng container app
azd init --template <template-name>

# I-deploy ang imprastraktura at aplikasyon
azd up

# I-deploy lamang ang code ng aplikasyon (laktawan ang imprastraktura)
azd deploy

# Maglaan lamang ng imprastraktura
azd provision

# Tingnan ang mga na-deploy na resources
azd show

# I-stream ang mga log
azd logs <service-name> --follow

# I-monitor ang aplikasyon
azd monitor --overview

# Linisin ang mga resources
azd down --force --purge
```

## Pag-troubleshoot

### Isyu: Hindi nag-start ang container

```bash
# Suriin ang mga log
azd logs api --tail 100

# Tingnan ang mga kaganapan ng container
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Subukan nang lokal
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Isyu: Hindi ma-access ang endpoint ng container app

```bash
# Suriin ang konfigurasyon ng ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Tiyakin kung naka-enable ang internal ingress
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Isyu: Mga problema sa performance

```bash
# Suriin ang paggamit ng mga mapagkukunan
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Dagdagan ang mga mapagkukunan
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Karagdagang Resources at Mga Halimbawa
- [Halimbawa ng Microservices](./microservices/README.md)
- [Halimbawa ng Simple Flash API](./simple-flask-api/README.md)
- [Dokumentasyon ng Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Mga Halimbawa ng Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Pag-aambag

Para mag-ambag ng bagong mga halimbawa ng container app:

1. Gumawa ng bagong subdirectory na may iyong halimbawa
2. Isama ang kumpletong `azure.yaml`, `infra/`, at `src/` files
3. Magdagdag ng detalyadong README na may mga tagubilin sa pag-deploy
4. Subukan ang pag-deploy gamit ang `azd up`
5. Mag-submit ng pull request

---

**Kailangan ng Tulong?** Sumali sa [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) na komunidad para sa suporta at mga tanong.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->