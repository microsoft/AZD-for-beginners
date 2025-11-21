<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-21T09:39:47+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "sv"
}
-->
# Exempel på distribution av containerappar med AZD

Den här katalogen innehåller omfattande exempel för att distribuera containeriserade applikationer till Azure Container Apps med Azure Developer CLI (AZD). Exemplen visar verkliga mönster, bästa praxis och produktionsklara konfigurationer.

## 📚 Innehållsförteckning

- [Översikt](../../../../examples/container-app)
- [Förutsättningar](../../../../examples/container-app)
- [Snabbstartsexempel](../../../../examples/container-app)
- [Produktionsklara exempel](../../../../examples/container-app)
- [Avancerade mönster](../../../../examples/container-app)
- [Bästa praxis](../../../../examples/container-app)

## Översikt

Azure Container Apps är en fullt hanterad serverlös containerplattform som gör det möjligt att köra mikrotjänster och containeriserade applikationer utan att behöva hantera infrastrukturen. När det kombineras med AZD får du:

- **Förenklad distribution**: En enda kommando distribuerar containrar med infrastruktur
- **Automatisk skalning**: Skalning till noll och utökning baserat på HTTP-trafik eller händelser
- **Integrerat nätverk**: Inbyggd tjänstupptäckt och trafikdelning
- **Hanterad identitet**: Säker autentisering till Azure-resurser
- **Kostnadsoptimering**: Betala endast för resurser du använder

## Förutsättningar

Innan du börjar, se till att du har:

```bash
# Kontrollera AZD-installation
azd version

# Kontrollera Azure CLI
az version

# Kontrollera Docker (för att bygga anpassade bilder)
docker --version

# Logga in på Azure
azd auth login
az login
```

**Nödvändiga Azure-resurser:**
- Aktiv Azure-prenumeration
- Behörighet att skapa resursgrupper
- Åtkomst till Container Apps-miljö

## Snabbstartsexempel

### 1. Enkel webb-API (Python Flask)

Distribuera ett grundläggande REST-API med Azure Container Apps.

**Exempel: Python Flask API**

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

**Distributionssteg:**

```bash
# Initiera från mall
azd init --template todo-python-mongo

# Tillhandahåll infrastruktur och distribuera
azd up

# Testa distributionen
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Nyckelfunktioner:**
- Automatisk skalning från 0 till 10 repliker
- Hälsokontroller och liveness-checkar
- Miljövariabelinjektion
- Integration med Application Insights

### 2. Node.js Express API

Distribuera en Node.js-backend med MongoDB-integration.

```bash
# Initiera Node.js API-mall
azd init --template todo-nodejs-mongo

# Konfigurera miljövariabler
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Distribuera
azd up

# Visa loggar
azd logs api
```

**Infrastrukturhöjdpunkter:**
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

### 3. Statisk frontend + API-backend

Distribuera en fullstack-applikation med React-frontend och API-backend.

```bash
# Initiera fullstack-mall
azd init --template todo-csharp-sql-swa-func

# Granska konfiguration
cat azure.yaml

# Distribuera båda tjänsterna
azd up

# Öppna applikationen
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Produktionsklara exempel

### Exempel 1: Mikrotjänstarkitektur

**Scenario**: E-handelsapplikation med flera mikrotjänster

**Katalogstruktur:**
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

**azure.yaml-konfiguration:**
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

**Distribution:**
```bash
# Initiera projekt
azd init

# Ställ in produktionsmiljö
azd env new production

# Konfigurera produktionsinställningar
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Distribuera alla tjänster
azd up

# Övervaka distribution
azd monitor --overview
```

### Exempel 2: AI-driven containerapp

**Scenario**: AI-chattapplikation med Azure OpenAI-integration

**Fil: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Använd hanterad identitet för säker åtkomst
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Hämta OpenAI-nyckel från Key Vault
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

**Fil: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Fil: infra/main.bicep**
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

**Distributionskommandon:**
```bash
# Ställ in miljö
azd init --template ai-chat-app
azd env new dev

# Konfigurera OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Distribuera
azd up

# Testa API:et
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Exempel 3: Bakgrundsprocess med köhantering

**Scenario**: Orderhanteringssystem med meddelandekö

**Katalogstruktur:**
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

**Fil: src/worker/processor.py**
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
            # Bearbeta order
            print(f"Processing order: {message.content}")
            
            # Slutför meddelande
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Fil: azure.yaml**
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

**Distribution:**
```bash
# Initiera
azd init

# Distribuera med kökonfiguration
azd up

# Skala arbetare baserat på kölängd
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Avancerade mönster

### Mönster 1: Blue-Green-distribution

```bash
# Skapa ny revision utan trafik
azd deploy api --revision-suffix blue --no-traffic

# Testa den nya revisionen
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Dela trafik (20% till blå, 80% till nuvarande)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Full övergång till blå
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Mönster 2: Canary-distribution med AZD

**Fil: .azure/dev/config.json**
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

**Distributionsskript:**
```bash
#!/bin/bash
# deploy-canary.sh

# Distribuera ny revision med 10% trafik
azd deploy api --revision-mode multiple

# Övervaka mätvärden
azd monitor --service api --duration 5m

# Öka trafiken gradvis
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Vänta 5 minuter
done
```

### Mönster 3: Multi-region-distribution

**Fil: azure.yaml**
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

**Fil: infra/multi-region.bicep**
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

**Distribution:**
```bash
# Distribuera till alla regioner
azd up

# Verifiera slutpunkter
azd show --output json | jq '.services.api.endpoints'
```

### Mönster 4: Dapr-integration

**Fil: infra/app/dapr-enabled.bicep**
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

**Applikationskod med Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Spara tillstånd
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Publicera händelse
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Bästa praxis

### 1. Resursorganisation

```bash
# Använd konsekventa namngivningskonventioner
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Märk resurser för kostnadsspårning
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Säkerhetsbästa praxis

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

### 3. Prestandaoptimering

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

### 4. Övervakning och insyn

```bash
# Aktivera Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Visa loggar i realtid
azd logs api --follow

# Övervaka mätvärden
azd monitor --service api

# Skapa varningar
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Kostnadsoptimering

```bash
# Skala till noll när den inte används
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Använd spotinstanser för utvecklingsmiljöer
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Ställ in budgetvarningar
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD-integration

**Exempel på GitHub Actions:**
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

## Vanliga kommandoreferenser

```bash
# Initiera nytt containerapp-projekt
azd init --template <template-name>

# Distribuera infrastruktur och applikation
azd up

# Distribuera endast applikationskod (hoppa över infrastruktur)
azd deploy

# Tillhandahåll endast infrastruktur
azd provision

# Visa distribuerade resurser
azd show

# Strömma loggar
azd logs <service-name> --follow

# Övervaka applikation
azd monitor --overview

# Rensa resurser
azd down --force --purge
```

## Felsökning

### Problem: Containern startar inte

```bash
# Kontrollera loggar
azd logs api --tail 100

# Visa behändelse för container
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testa lokalt
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problem: Kan inte komma åt containerappens slutpunkt

```bash
# Verifiera ingresskonfiguration
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Kontrollera om intern ingress är aktiverad
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problem: Prestandaproblem

```bash
# Kontrollera resursanvändning
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Skala upp resurser
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Ytterligare resurser och exempel
- [Exempel på mikrotjänster](./microservices/README.md)
- [Exempel på enkel Flask-API](./simple-flask-api/README.md)
- [Dokumentation för Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Exempel på Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep-mallar](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Bidra

För att bidra med nya exempel på containerappar:

1. Skapa en ny underkatalog med ditt exempel
2. Inkludera kompletta `azure.yaml`, `infra/` och `src/`-filer
3. Lägg till en omfattande README med distributionsinstruktioner
4. Testa distributionen med `azd up`
5. Skicka in en pull request

---

**Behöver du hjälp?** Gå med i [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)-communityn för support och frågor.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->