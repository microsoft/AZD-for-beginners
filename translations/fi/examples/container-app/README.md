# Container App -käyttöönottoesimerkit AZD:llä

Tämä hakemisto sisältää kattavia esimerkkejä säilöön pakattujen sovellusten käyttöönotosta Azure Container Appsiin käyttäen Azure Developer CLI:tä (AZD). Nämä esimerkit näyttävät todellisen maailman malleja, parhaita käytäntöjä ja tuotantovalmiita konfiguraatioita.

## 📚 Sisällysluettelo

- [Yleiskatsaus](#overview)
- [Esivaatimukset](#prerequisites)
- [Pika-aloitusesimerkit](#quick-start-examples)
- [Tuotantoesimerkit](#production-examples)
- [Edistyneet mallit](#advanced-patterns)
- [Parhaat käytännöt](#best-practices)

## Overview

Azure Container Apps on täysin hallinnoitu serverittömä säilöalusta, joka mahdollistaa mikropalvelujen ja säilöön pakattujen sovellusten ajamisen ilman infrastruktuurin hallintaa. Yhdistettynä AZD:hen saat:

- **Yksinkertaistettu käyttöönotto**: Yhdellä komennolla otat käyttöön säilöt ja infrastruktuurin
- **Automaattinen skaalaus**: Skaalaa nollasta ja ulospäin HTTP-liikenteen tai tapahtumien perusteella
- **Integroitu verkottuminen**: Sisäänrakennettu palvelunlöytäminen ja liikenteen jakaminen
- **Hallittu identiteetti**: Turvallinen todennus Azure-resursseille
- **Kustannusten optimointi**: Maksa vain käyttämistäsi resursseista

## Prerequisites

Ennen aloittamista varmista, että sinulla on:

```bash
# Tarkista AZD:n asennus
azd version

# Tarkista Azure CLI
az version

# Tarkista Docker (mukautettujen kuvien rakentamiseen)
docker --version

# Autentikoi AZD-käyttöönottoja varten
azd auth login

# Valinnainen: kirjaudu Azure CLI:hin, jos aiot suorittaa az-komentoja suoraan
az login
```

**Vaadittavat Azure-resurssit:**
- Aktiivinen Azure-tilaus
- Oikeudet resurssiryhmän luomiseen
- Käyttöoikeus Container Apps -ympäristöön

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Ota käyttöön perus REST-API Azure Container Appsilla.

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

# Provisionoi infrastruktuuri ja ota käyttöön
azd up

# Testaa käyttöönotto
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Tärkeimmät ominaisuudet:**
- Automaattinen skaalaus 0:sta 10:een replikaan
- Terveystarkastukset ja liveness-tarkistukset
- Ympäristömuuttujien asetukset
- Application Insights -integraatio

### 2. Node.js Express API

Ota käyttöön Node.js-backend MongoDB-integraatiolla.

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

### 3. Static Frontend + API Backend

Ota käyttöön täyden pinon sovellus React-frontendilla ja API-backendillä.

```bash
# Alusta full-stack-mallipohja
azd init --template todo-csharp-sql-swa-func

# Tarkista konfiguraatio
cat azure.yaml

# Ota molemmat palvelut käyttöön
azd up

# Avaa sovellus
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**Skenaario**: Verkkokauppasovellus, jossa on useita mikropalveluja

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

**Skenaario**: Tekoälychat-sovellus, jossa on Microsoft Foundry Models -integraatio

**Tiedosto: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Käytä hallittua identiteettiä (Managed Identity) turvalliseen käyttöön
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

# Testaa API:ta
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
            # Prosessin järjestys
            print(f"Processing order: {message.content}")
            
            # Kokonainen viesti
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

# Skaalaa työntekijää jonon pituuden perusteella
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

### Pattern 2: Canary Deployment with AZD

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

**Käyttöönotto-skripti:**
```bash
#!/bin/bash
# deploy-canary.sh

# Ota käyttöön uusi revisio 10 %:n liikenteelle
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

### Pattern 3: Multi-Region Deployment

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
# Ota käyttöön kaikilla alueilla
azd up

# Tarkista päätepisteet
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Dapr Integration

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

**Sovelluksen koodi Daprilla:**
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

### 1. Resource Organization

```bash
# Käytä johdonmukaisia nimeämiskäytäntöjä
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Merkitse resurssit kustannusseurantaa varten
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
# Ota Application Insights käyttöön
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Näytä lokit reaaliajassa
azd monitor --logs
# Tai käytä Azure CLI:tä Container Appsille:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Valvo mittareita
azd monitor --live

# Luo hälytyksiä
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# Skaalaa nollaan, kun ei ole käytössä
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Käytä spot-instansseja kehitysympäristöissä
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Ota käyttöön budjettihälytykset
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

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

## Common Commands Reference

```bash
# Alusta uusi Container App -projekti
azd init --template <template-name>

# Ota käyttöön infrastruktuuri ja sovellus
azd up

# Ota käyttöön vain sovelluskoodi (ohita infrastruktuuri)
azd deploy

# Luo vain infrastruktuuri
azd provision

# Tarkastele käyttöön otettuja resursseja
azd show

# Suoratoista lokit azd monitorilla tai Azure CLI:llä
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Valvo sovellusta
azd monitor --overview

# Siivoa resurssit
azd down --force --purge
```

## Troubleshooting

### Issue: Container fails to start

```bash
# Tarkista lokit Azure CLI:n avulla
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Näytä konttien tapahtumat
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testaa paikallisesti
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Issue: Can't access container app endpoint

```bash
# Varmista ingressin määritys
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

### Issue: Performance problems

```bash
# Tarkista resurssien käyttöaste
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

## Additional Resources and Examples
- [Mikropalveluesimerkki](./microservices/README.md)
- [Yksinkertainen Flash-API -esimerkki](./simple-flask-api/README.md)
- [Azure Container Apps -dokumentaatio](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Container Apps Samples](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

Lisätäksesi uusia Container App -esimerkkejä:

1. Luo uusi alihakemisto esimerkillesi
2. Sisällytä täydelliset `azure.yaml`, `infra/` ja `src/` tiedostot
3. Lisää kattava README, jossa on käyttöönotto-ohjeet
4. Testaa käyttöönotto komennolla `azd up`
5. Lähetä pull request

---

**Tarvitsetko apua?** Liity [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) -yhteisöön saadaksesi tukea ja vastauksia kysymyksiisi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää ensisijaisena ja auktoritatiivisena lähteenä. Kriittisissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mistään tämän käännöksen käytöstä johtuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->