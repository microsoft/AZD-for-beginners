# Eksempler på Container App-udrulning med AZD

Denne mappe indeholder omfattende eksempler på udrulning af containeriserede applikationer til Azure Container Apps ved hjælp af Azure Developer CLI (AZD). Disse eksempler viser virkelige mønstre, bedste praksis og produktionsklare konfigurationer.

## 📚 Indholdsfortegnelse

- [Oversigt](../../../../examples/container-app)
- [Forudsætninger](../../../../examples/container-app)
- [Hurtigstart Eksempler](../../../../examples/container-app)
- [Produktions Eksempler](../../../../examples/container-app)
- [Avancerede Mønstre](../../../../examples/container-app)
- [Bedste Praksis](../../../../examples/container-app)

## Oversigt

Azure Container Apps er en fuldt administreret serverløs containerplatform, der gør det muligt at køre mikrotjenester og containeriserede applikationer uden at skulle administrere infrastrukturen. Når det kombineres med AZD, får du:

- **Forenklet Udrulning**: En enkelt kommando udruller containere med infrastruktur
- **Automatisk Skalering**: Skalering til nul og udvidelse baseret på HTTP-trafik eller hændelser
- **Integreret Netværk**: Indbygget tjenesteopdagelse og trafikdeling
- **Administreret Identitet**: Sikker autentificering til Azure-ressourcer
- **Omkostningsoptimering**: Betal kun for de ressourcer, du bruger

## Forudsætninger

Før du går i gang, skal du sikre dig, at du har:

```bash
# Kontroller AZD installation
azd version

# Kontroller Azure CLI
az version

# Kontroller Docker (til opbygning af brugerdefinerede billeder)
docker --version

# Log ind på Azure
azd auth login
az login
```

**Påkrævede Azure-ressourcer:**
- Aktiv Azure-abonnement
- Tilladelser til oprettelse af ressourcegrupper
- Adgang til Container Apps-miljø

## Hurtigstart Eksempler

### 1. Simpel Web API (Python Flask)

Udrul en grundlæggende REST API med Azure Container Apps.

**Eksempel: Python Flask API**

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

**Udrulnings Trin:**

```bash
# Initialiser fra skabelon
azd init --template todo-python-mongo

# Klargør infrastruktur og implementer
azd up

# Test implementeringen
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Nøglefunktioner:**
- Automatisk skalering fra 0 til 10 replikaer
- Sundhedsprober og liveness-tjek
- Indsprøjtning af miljøvariabler
- Integration med Application Insights

### 2. Node.js Express API

Udrul en Node.js backend med MongoDB-integration.

```bash
# Initialiser Node.js API-skabelon
azd init --template todo-nodejs-mongo

# Konfigurer miljøvariabler
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Udrul
azd up

# Vis logfiler
azd logs api
```

**Infrastruktur Højdepunkter:**
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

### 3. Statisk Frontend + API Backend

Udrul en fuld-stack applikation med React frontend og API backend.

```bash
# Initialiser fuld-stack skabelon
azd init --template todo-csharp-sql-swa-func

# Gennemgå konfiguration
cat azure.yaml

# Udrul begge tjenester
azd up

# Åbn applikationen
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Produktions Eksempler

### Eksempel 1: Mikrotjeneste Arkitektur

**Scenario**: E-handelsapplikation med flere mikrotjenester

**Mappe Struktur:**
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

**azure.yaml Konfiguration:**
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

**Udrulning:**
```bash
# Initialiser projekt
azd init

# Indstil produktionsmiljø
azd env new production

# Konfigurer produktionsindstillinger
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Udrul alle tjenester
azd up

# Overvåg udrulning
azd monitor --overview
```

### Eksempel 2: AI-drevet Container App

**Scenario**: AI-chatapplikation med Azure OpenAI-integration

**Fil: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Brug administreret identitet for sikker adgang
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Hent OpenAI-nøgle fra Key Vault
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

**Udrulnings Kommandoer:**
```bash
# Opsæt miljø
azd init --template ai-chat-app
azd env new dev

# Konfigurer OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Udrul
azd up

# Test API'en
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Eksempel 3: Baggrundsarbejder med Købehandling

**Scenario**: Ordrebehandlingssystem med beskedkø

**Mappe Struktur:**
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
            # Behandl ordre
            print(f"Processing order: {message.content}")
            
            # Fuldfør besked
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

**Udrulning:**
```bash
# Initialiser
azd init

# Udrul med køkonfiguration
azd up

# Skaler arbejder baseret på kølængde
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Avancerede Mønstre

### Mønster 1: Blue-Green Udrulning

```bash
# Opret ny revision uden trafik
azd deploy api --revision-suffix blue --no-traffic

# Test den nye revision
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Del trafik (20% til blå, 80% til nuværende)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Fuld overgang til blå
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Mønster 2: Canary Udrulning med AZD

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

**Udrulnings Script:**
```bash
#!/bin/bash
# deploy-canary.sh

# Udrul ny revision med 10% trafik
azd deploy api --revision-mode multiple

# Overvåg metrikker
azd monitor --service api --duration 5m

# Øg trafikken gradvist
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Vent 5 minutter
done
```

### Mønster 3: Multi-Region Udrulning

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

**Udrulning:**
```bash
# Udrul til alle regioner
azd up

# Bekræft slutpunkter
azd show --output json | jq '.services.api.endpoints'
```

### Mønster 4: Dapr Integration

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

**Applikationskode med Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Gem tilstand
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Udgiv begivenhed
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Bedste Praksis

### 1. Ressource Organisation

```bash
# Brug konsekvente navngivningskonventioner
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Tag ressourcer for omkostningssporing
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Sikkerheds Bedste Praksis

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

### 3. Optimering af Ydeevne

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

### 4. Overvågning og Observabilitet

```bash
# Aktiver Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Se logfiler i realtid
azd logs api --follow

# Overvåg metrikker
azd monitor --service api

# Opret alarmer
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Omkostningsoptimering

```bash
# Skaler til nul, når det ikke er i brug
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Brug spotinstanser til udviklingsmiljøer
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Opsæt budgetadvarsler
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

**GitHub Actions Eksempel:**
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

## Almindelige Kommandoer Reference

```bash
# Initialiser nyt container-app-projekt
azd init --template <template-name>

# Udrul infrastruktur og applikation
azd up

# Udrul kun applikationskode (spring infrastruktur over)
azd deploy

# Klargør kun infrastruktur
azd provision

# Se udrullede ressourcer
azd show

# Stream logfiler
azd logs <service-name> --follow

# Overvåg applikation
azd monitor --overview

# Ryd op i ressourcer
azd down --force --purge
```

## Fejlfinding

### Problem: Containeren starter ikke

```bash
# Kontroller logfiler
azd logs api --tail 100

# Se containerbegivenheder
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Test lokalt
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problem: Kan ikke få adgang til container app endpoint

```bash
# Bekræft ingress-konfiguration
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Kontroller, om intern ingress er aktiveret
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problem: Ydeevneproblemer

```bash
# Kontroller ressourceudnyttelse
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Skaler ressourcer op
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Yderligere Ressourcer og Eksempler
- [Mikrotjenester Eksempel](./microservices/README.md)
- [Simpel Flask API Eksempel](./simple-flask-api/README.md)
- [Azure Container Apps Dokumentation](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Galleri](https://azure.github.io/awesome-azd/)
- [Container Apps Eksempler](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Bidrag

For at bidrage med nye container app eksempler:

1. Opret en ny undermappe med dit eksempel
2. Inkluder komplette `azure.yaml`, `infra/`, og `src/` filer
3. Tilføj en omfattende README med udrulningsinstruktioner
4. Test udrulning med `azd up`
5. Indsend en pull request

---

**Brug for hjælp?** Deltag i [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) fællesskabet for support og spørgsmål.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->