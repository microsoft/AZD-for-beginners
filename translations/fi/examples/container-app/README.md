# Container App Deployment Examples with AZD

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 Sisällysluettelo

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Quick Start Examples](#quick-start-examples)
- [Production Examples](#production-examples)
- [Advanced Patterns](#advanced-patterns)
- [Best Practices](#best-practices)

## Overview

Azure Container Apps is a fully managed serverless container platform that enables you to run microservices and containerized applications without managing infrastructure. When combined with AZD, you get:

- **Simplified Deployment**: Single command deploys containers with infrastructure
- **Automatic Scaling**: Scale to zero and scale out based on HTTP traffic or events
- **Integrated Networking**: Built-in service discovery and traffic splitting
- **Managed Identity**: Secure authentication to Azure resources
- **Cost Optimization**: Pay only for resources you use

## Prerequisites

Before getting started, ensure you have:

```bash
# Tarkista AZD:n asennus
azd version

# Tarkista Azure CLI
az version

# Tarkista Docker (mukautettujen kuvien rakentamista varten)
docker --version

# Kirjaudu Azureen
azd auth login
az login
```

**Vaaditut Azure-resurssit:**
- Aktiivinen Azure-tilaus
- Oikeudet resurssiryhmän luomiseen
- Pääsy Container Apps -ympäristöön

## Quick Start Examples

### 1. Yksinkertainen Web-API (Python Flask)

Deploy a basic REST API with Azure Container Apps.

**Esimerkki: Python Flask -API**

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

**Käyttöönoton vaiheet:**

```bash
# Alusta mallipohjasta
azd init --template todo-python-mongo

# Määritä infrastruktuuri ja ota käyttöön
azd up

# Testaa käyttöönotto
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Keskeiset ominaisuudet:**
- Automaattinen skaalaus 0:sta 10:een
- Terveystarkastukset ja elossaolotarkistukset
- Ympäristömuuttujien asettaminen
- Application Insights -integraatio

### 2. Node.js Express API

Deploy a Node.js backend with MongoDB integration.

```bash
# Alusta Node.js-API-malli
azd init --template todo-nodejs-mongo

# Määritä ympäristömuuttujat
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Ota käyttöön
azd up

# Näytä lokit Azure Monitorin kautta
azd monitor --logs
```

**Infrastruktuurin kohokohdat:**
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

### 3. Staattinen frontend + API-backend

Deploy a full-stack application with React frontend and API backend.

```bash
# Alusta täyden pinon malli
azd init --template todo-csharp-sql-swa-func

# Tarkista asetukset
cat azure.yaml

# Ota molemmat palvelut käyttöön
azd up

# Avaa sovellus
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**Skenaario**: E‑commerce -sovellus, jossa useita mikropalveluja

**Hakemistorakenne:**
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

**azure.yaml -konfiguraatio:**
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

**Käyttöönotto:**
```bash
# Alusta projekti
azd init

# Aseta tuotantoympäristö
azd env new production

# Määritä tuotantoasetukset
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Ota kaikki palvelut käyttöön
azd up

# Valvo käyttöönottoa
azd monitor --overview
```

### Example 2: AI-Powered Container App

**Skenaario**: AI‑chat-sovellus, jossa Microsoft Foundry Models -integraatio

**Tiedosto: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Käytä hallittua identiteettiä turvalliseen pääsyyn
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Hae OpenAI-avain Key Vaultista
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

**Tiedosto: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Tiedosto: infra/main.bicep**
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

**Käyttöönoton komennot:**
```bash
# Määritä ympäristö
azd init --template ai-chat-app
azd env new dev

# Määritä OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Ota käyttöön
azd up

# Testaa sovellusrajapintaa
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**Skenaario**: Tilauksien käsittelyjärjestelmä viestijonolla

**Hakemistorakenne:**
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

**Tiedosto: src/worker/processor.py**
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
            # Käsittele tilaus
            print(f"Processing order: {message.content}")
            
            # Täydellinen viesti
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Tiedosto: azure.yaml**
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

**Käyttöönotto:**
```bash
# Alusta
azd init

# Ota käyttöön jonon kokoonpanolla
azd up

# Skaalaa työntekijöitä jonon pituuden mukaan
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### Malli 1: Blue-Green -käyttöönotto

```bash
# Luo uusi revisio ilman liikennettä
azd deploy api --revision-suffix blue --no-traffic

# Testaa uutta revisiota
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Jaa liikenne (20 % siniselle, 80 % nykyiselle)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Täysi siirto siniselle
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Malli 2: Canary-käyttöönotto AZD:n kanssa

**Tiedosto: .azure/dev/config.json**
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

**Käyttöönotto­skripti:**
```bash
#!/bin/bash
# deploy-canary.sh

# Ota käyttöön uusi revisio, jolla on 10 % liikenteestä
azd deploy api --revision-mode multiple

# Seuraa mittareita
azd monitor --service api --duration 5m

# Lisää liikennettä asteittain
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Odota 5 minuuttia
done
```

### Malli 3: Monialueinen käyttöönotto

**Tiedosto: azure.yaml**
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

**Tiedosto: infra/multi-region.bicep**
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

**Käyttöönotto:**
```bash
# Ota käyttöön kaikissa alueissa
azd up

# Tarkista päätepisteet
azd show --output json | jq '.services.api.endpoints'
```

### Malli 4: Dapr-integraatio

**Tiedosto: infra/app/dapr-enabled.bicep**
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

**Sovelluskoodi Daprilla:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Tallenna tila
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Julkaise tapahtuma
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Best Practices

### 1. Resurssien organisointi

```bash
# Käytä johdonmukaisia nimeämiskäytäntöjä
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Merkitse resurssit kustannusseurantaa varten
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Turvallisuuden parhaat käytännöt

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

### 3. Suorituskyvyn optimointi

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

### 4. Seuranta ja havaittavuus

```bash
# Ota Application Insights käyttöön
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Näytä lokit reaaliajassa
azd monitor --logs
# Tai käytä Azure CLI:tä Container Appsia varten:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Seuraa mittareita
azd monitor --live

# Luo hälytyksiä
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Kustannusten optimointi

```bash
# Skaalaa nollaan, kun ei ole käytössä
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Käytä spot-instansseja kehitysympäristöissä
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Ota budjettihälytykset käyttöön
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD-integraatio

**GitHub Actions -esimerkki:**
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

## Yleiset komennot

```bash
# Alusta uusi säiliösovellusprojekti
azd init --template <template-name>

# Ota infrastruktuuri ja sovellus käyttöön
azd up

# Ota käyttöön vain sovelluskoodi (ohita infrastruktuuri)
azd deploy

# Ota käyttöön vain infrastruktuuri
azd provision

# Näytä käyttöön otetut resurssit
azd show

# Seuraa lokeja reaaliajassa käyttäen azd monitoria tai Azure CLI:tä
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Valvo sovellusta
azd monitor --overview

# Siivoa resurssit
azd down --force --purge
```

## Vianmääritys

### Ongelma: Kontti ei käynnisty

```bash
# Tarkista lokit Azure CLI:llä
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Näytä säiliön tapahtumat
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testaa paikallisesti
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Ongelma: Konttisovelluksen päätepisteeseen ei pääse

```bash
# Varmista ingressin kokoonpano
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Tarkista, onko sisäinen ingress käytössä
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Ongelma: Suorituskykyongelmat

```bash
# Tarkista resurssien käyttö
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Lisää resursseja
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Lisäresurssit ja -esimerkit
- [Mikropalveluesimerkki](./microservices/README.md)
- [Yksinkertainen Flask-API -esimerkki](./simple-flask-api/README.md)
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Container Apps Samples](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Osallistuminen

Lisätäksesi uusia container app -esimerkkejä:

1. Luo uusi alihakemisto esimerkillesi
2. Sisällytä täydelliset `azure.yaml`, `infra/` ja `src/` -tiedostot
3. Lisää kattava README, jossa on käyttöönotto-ohjeet
4. Testaa käyttöönotto komennolla `azd up`
5. Lähetä pull request

---

**Tarvitsetko apua?** Liity [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) -yhteisöön saadaksesi tukea ja vastauksia.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automatisoiduissa käännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää virallisena lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mahdollisista tästä käännöksestä johtuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->