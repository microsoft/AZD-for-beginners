# Container App diegimo pavyzdžiai su AZD

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 Turinys

- [Apžvalga](#apžvalga)
- [Reikalavimai](#reikalavimai)
- [Greito paleidimo pavyzdžiai](#greito-paleidimo-pavyzdžiai)
- [Produkciniai pavyzdžiai](#produkciniai-pavyzdžiai)
- [Išplėstiniai modeliai](#išplėstiniai-modeliai)
- [Geriausios praktikos](#geriausios-praktikos)

## Apžvalga

Azure Container Apps is a fully managed serverless container platform that enables you to run microservices and containerized applications without managing infrastructure. When combined with AZD, you get:

- **Supaprastintas diegimas**: Single command deploys containers with infrastructure
- **Automatinis mastelio keitimas**: Scale to zero and scale out based on HTTP traffic or events
- **Integruotas tinklas**: Built-in service discovery and traffic splitting
- **Valdomas identitetas**: Secure authentication to Azure resources
- **Išlaidų optimizavimas**: Pay only for resources you use

## Reikalavimai

Before getting started, ensure you have:

```bash
# Patikrinkite AZD įdiegimą
azd version

# Patikrinkite Azure CLI
az version

# Patikrinkite Docker (skirta kuriant pasirinktinius vaizdus)
docker --version

# Prisijunkite prie Azure
azd auth login
az login
```

**Būtini Azure ištekliai:**
- Veikianti Azure prenumerata
- Leidimai kurti resursų grupes
- Prieiga prie Container Apps aplinkos

## Greito paleidimo pavyzdžiai

### 1. Paprastas Web API (Python Flask)

Diegti paprastą REST API su Azure Container Apps.

**Pavyzdys: Python Flask API**

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

**Diegimo žingsniai:**

```bash
# Inicializuoti iš šablono
azd init --template todo-python-mongo

# Paruošti infrastruktūrą ir įdiegti
azd up

# Išbandyti diegimą
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Pagrindinės savybės:**
- Automatinis mastelio keitimas nuo 0 iki 10 kopijų
- Sveikatos sondos ir gyvybingumo patikrinimai
- Aplinkos kintamųjų įterpimas
- Application Insights integracija

### 2. Node.js Express API

Diegti Node.js serverį su MongoDB integracija.

```bash
# Inicializuoti Node.js API šabloną
azd init --template todo-nodejs-mongo

# Konfigūruoti aplinkos kintamuosius
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Diegti
azd up

# Peržiūrėti žurnalus per Azure Monitor
azd monitor --logs
```

**Infrastruktūros akcentai:**
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

### 3. Statinis Frontend + API Backend

Diegti pilno steko programą su React frontendu ir API backend'u.

```bash
# Inicializuoti viso steko šabloną
azd init --template todo-csharp-sql-swa-func

# Peržiūrėti konfigūraciją
cat azure.yaml

# Diegti abi paslaugas
azd up

# Atidaryti programą
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Produkciniai pavyzdžiai

### Pavyzdys 1: Mikropaslaugų architektūra

**Scenarijus**: E. komercijos programa su keliomis mikropaslaugomis

**Katalogo struktūra:**
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

**azure.yaml konfigūracija:**
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

**Diegimas:**
```bash
# Inicializuoti projektą
azd init

# Nustatyti gamybos aplinką
azd env new production

# Konfigūruoti gamybos nustatymus
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Diegti visas paslaugas
azd up

# Stebėti diegimą
azd monitor --overview
```

### Pavyzdys 2: Dirbtiniu intelektu valdomas Container App

**Scenarijus**: DI pokalbių programa su Microsoft Foundry Models integracija

**Failas: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Naudokite valdomąją tapatybę (Managed Identity) saugiam prieigos užtikrinimui
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Gaukite OpenAI raktą iš Key Vault
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

**Failas: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Failas: infra/main.bicep**
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

**Diegimo komandos:**
```bash
# Nustatyti aplinką
azd init --template ai-chat-app
azd env new dev

# Konfigūruoti OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Diegti
azd up

# Išbandyti API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Pavyzdys 3: Foninis darbininkas su eilutės apdorojimu

**Scenarijus**: Užsakymų apdorojimo sistema su žinučių eile

**Katalogo struktūra:**
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

**Failas: src/worker/processor.py**
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
            # Apdoroti užsakymą
            print(f"Processing order: {message.content}")
            
            # Užbaigti pranešimą
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Failas: azure.yaml**
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

**Diegimas:**
```bash
# Inicializuoti
azd init

# Diegti su eilės konfigūracija
azd up

# Keisti darbinio proceso mastą pagal eilės ilgį
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Išplėstiniai modeliai

### Modelis 1: Blue-Green diegimas

```bash
# Sukurti naują versiją be srauto
azd deploy api --revision-suffix blue --no-traffic

# Išbandyti naują versiją
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Padalyti srautą (20% į mėlyną, 80% į esamą)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Pilnas perėjimas į mėlyną
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Modelis 2: Canary diegimas su AZD

**Failas: .azure/dev/config.json**
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

**Diegimo skriptas:**
```bash
#!/bin/bash
# deploy-canary.sh

# Diegti naują versiją su 10% srauto
azd deploy api --revision-mode multiple

# Stebėti metrikas
azd monitor --service api --duration 5m

# Palaipsniui didinti srautą
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Palaukti 5 minučių
done
```

### Modelis 3: Diegimas keliuose regionuose

**Failas: azure.yaml**
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

**Failas: infra/multi-region.bicep**
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

**Diegimas:**
```bash
# Diegti į visus regionus
azd up

# Patikrinti galinius taškus
azd show --output json | jq '.services.api.endpoints'
```

### Modelis 4: Dapr integracija

**Failas: infra/app/dapr-enabled.bicep**
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

**Programos kodas su Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Išsaugoti būseną
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Paskelbti įvykį
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Geriausios praktikos

### 1. Išteklių organizavimas

```bash
# Naudokite nuoseklias pavadinimų konvencijas
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Pažymėkite išteklius sąnaudų stebėjimui
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Saugumo gerosios praktikos

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

### 3. Našumo optimizavimas

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

### 4. Stebėjimas ir matomumas

```bash
# Įgalinti Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Peržiūrėti žurnalus realiuoju laiku
azd monitor --logs
# Arba naudokite Azure CLI Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Stebėti metrikas
azd monitor --live

# Sukurti įspėjimus
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Išlaidų optimizavimas

```bash
# Sumažinti iki nulio, kai nenaudojama
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Naudokite spot instancijas vystymo aplinkose
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Nustatykite biudžeto įspėjimus
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD integracija

**GitHub Actions pavyzdys:**
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

## Dažniausiai naudojamos komandos

```bash
# Inicializuoti naują konteinerinės programos projektą
azd init --template <template-name>

# Diegti infrastruktūrą ir programą
azd up

# Diegti tik programos kodą (praleisti infrastruktūrą)
azd deploy

# Sukurti tik infrastruktūrą
azd provision

# Peržiūrėti įdiegtus išteklius
azd show

# Srautinti žurnalus naudojant azd monitor arba Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Stebėti programą
azd monitor --overview

# Išvalyti išteklius
azd down --force --purge
```

## Trikčių šalinimas

### Problema: Konteineris nepaleidžiamas

```bash
# Patikrinkite žurnalus naudodami Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Peržiūrėkite konteinerio įvykius
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Išbandykite lokaliai
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problema: Negalite pasiekti Container App galinio taško

```bash
# Patikrinti ingress konfigūraciją
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Patikrinti, ar vidinis ingress yra įjungtas
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problema: Našumo problemos

```bash
# Patikrinti išteklių naudojimą
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Padidinti išteklius
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Papildomi ištekliai ir pavyzdžiai
- [Mikropaslaugų pavyzdys](./microservices/README.md)
- [Paprastas Flask API pavyzdys](./simple-flask-api/README.md)
- [Azure Container Apps dokumentacija](https://learn.microsoft.com/azure/container-apps/)
- [AZD šablonų galerija](https://azure.github.io/awesome-azd/)
- [Container Apps pavyzdžiai](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep šablonai](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Prisidėjimas

Norėdami pridėti naujų Container App pavyzdžių:

1. Sukurkite naują apakatalogą su savo pavyzdžiu
2. Įtraukite visus failus `azure.yaml`, `infra/` ir `src/`
3. Pridėkite išsamų README su diegimo instrukcijomis
4. Išbandykite diegimą su `azd up`
5. Pateikite pull request'ą

---

**Reikia pagalbos?** Prisijunkite prie [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) bendruomenės palaikymui ir klausimams.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turi būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojamas profesionalus, žmogaus atliktas vertimas. Mes neatsakome už bet kokius nesusipratimus ar klaidingą aiškinimą, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->