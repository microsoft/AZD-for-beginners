# Container App Deployment Examples wit AZD

Dis folder get plenty examples wey show how to deploy container apps go Azure Container Apps wit Azure Developer CLI (AZD). Di examples dey show real-life patterns, best practices, and settings wey fit work for production.

## 📚 Table of Contents

- [Overview](../../../../examples/container-app)
- [Prerequisites](../../../../examples/container-app)
- [Quick Start Examples](../../../../examples/container-app)
- [Production Examples](../../../../examples/container-app)
- [Advanced Patterns](../../../../examples/container-app)
- [Best Practices](../../../../examples/container-app)

## Overview

Azure Container Apps na serverless container platform wey dem dey manage for you, e go allow you run microservices and container apps without you dey worry about infrastructure. If you use am wit AZD, you go enjoy:

- **Easy Deployment**: One command fit deploy containers plus di infrastructure
- **Automatic Scaling**: E fit scale go zero or scale up based on HTTP traffic or events
- **Integrated Networking**: E get built-in service discovery and traffic splitting
- **Managed Identity**: E dey secure authentication to Azure resources
- **Cost Optimization**: You go only pay for wetin you use

## Prerequisites

Before you start, make sure say you get:

```bash
# Check AZD installation
azd version

# Check Azure CLI
az version

# Check Docker (for building custom images)
docker --version

# Login to Azure
azd auth login
az login
```

**Wetin You Need for Azure:**
- Active Azure subscription
- Permission to create resource group
- Access to Container Apps environment

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Deploy one basic REST API wit Azure Container Apps.

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

**Steps to Deploy:**

```bash
# Start am from template
azd init --template todo-python-mongo

# Arrange infrastructure and put am
azd up

# Check how the deployment dey work
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Key Features:**
- E dey auto-scale from 0 to 10 replicas
- E get health probes and liveness checks
- E dey inject environment variables
- E dey integrate wit Application Insights

### 2. Node.js Express API

Deploy one Node.js backend wey get MongoDB integration.

```bash
# Start Node.js API template
azd init --template todo-nodejs-mongo

# Set environment variables
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Put am for server
azd up

# Check logs
azd logs api
```

**Infrastructure Highlights:**
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

Deploy one full-stack app wey get React frontend and API backend.

```bash
# Start full-stack template
azd init --template todo-csharp-sql-swa-func

# Check configuration
cat azure.yaml

# Put both services for ground
azd up

# Open di application
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**Scenario**: E-commerce app wey get plenty microservices

**Directory Structure:**
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

**azure.yaml Configuration:**
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

**Deployment:**
```bash
# Start project
azd init

# Set production environment
azd env new production

# Arrange production settings
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Put all services for work
azd up

# Check deployment
azd monitor --overview
```

### Example 2: AI-Powered Container App

**Scenario**: AI chat app wey dey use Azure OpenAI

**File: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Use Managed Identity make access secure
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Collect OpenAI key from Key Vault
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

**Deployment Commands:**
```bash
# Set up environment
azd init --template ai-chat-app
azd env new dev

# Configure OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Deploy
azd up

# Test di API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker wit Queue Processing

**Scenario**: Order processing system wey dey use message queue

**Directory Structure:**
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
            # Process order
            print(f"Processing order: {message.content}")
            
            # Finish message
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

**Deployment:**
```bash
# Start am
azd init

# Put am for ground wit queue setup
azd up

# Make worker big based on queue size
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
# Create new revision wey no get traffic
azd deploy api --revision-suffix blue --no-traffic

# Test di new revision
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Share traffic (20% go blue, 80% go current)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Move everything go blue
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: Canary Deployment wit AZD

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

# Deploy new revision wit 10% traffic
azd deploy api --revision-mode multiple

# Check di metrics
azd monitor --service api --duration 5m

# Add traffic small small
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Wait 5 minutes
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

**Deployment:**
```bash
# Deploy for all regions
azd up

# Check endpoints
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

**Application Code wit Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Save state
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Publish event
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
# Dey use name wey dey consistent
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Put tag for resources to track cost
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
# Enable Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# See logs as e dey happen
azd logs api --follow

# Check metrics
azd monitor --service api

# Make alerts
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# Make am zero when you no dey use am
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Use spot instances for dev environments
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Set budget alerts
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

**GitHub Actions Example:**
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
# Start new container app project
azd init --template <template-name>

# Put infrastructure and application for ground
azd up

# Put only application code (no do infrastructure)
azd deploy

# Arrange only infrastructure
azd provision

# See resources wey don dey ground
azd show

# Check logs wey dey show
azd logs <service-name> --follow

# Look how application dey work
azd monitor --overview

# Remove resources wey dey ground
azd down --force --purge
```

## Troubleshooting

### Issue: Container no start

```bash
# Check di logs
azd logs api --tail 100

# See wetin dey happen for di container
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Test am for here
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Issue: No fit access container app endpoint

```bash
# Confirm say ingress configuration dey correct
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Check if internal ingress don dey enabled
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Issue: Performance wahala

```bash
# Check how dem dey use resource
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Add more resource
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Additional Resources and Examples
- [Microservices Example](./microservices/README.md)
- [Simple Flash API Example](./simple-flask-api/README.md)
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Container Apps Samples](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

To add new container app examples:

1. Create new folder for your example
2. Add complete `azure.yaml`, `infra/`, and `src/` files
3. Write full README wit deployment instructions
4. Test am wit `azd up`
5. Submit pull request

---

**Need Help?** Join di [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) community for support and questions.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transle-shon service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transle-shon. Even as we dey try make am correct, abeg make you sabi say AI transle-shon fit get mistake or no dey accurate well. Di original dokyument wey dey for im native language na di one wey you go take as di correct source. For important mata, e good make you use professional human transle-shon. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis transle-shon.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->