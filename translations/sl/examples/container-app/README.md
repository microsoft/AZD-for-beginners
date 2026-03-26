# Primeri uvajanja Container App z AZD

Ta imenik vsebuje obsežne primere za uvajanje kontejneriziranih aplikacij v Azure Container Apps z uporabo Azure Developer CLI (AZD). Ti primeri prikazujejo vzorce iz resničnega sveta, najboljše prakse in konfiguracije pripravljene za produkcijo.

## 📚 Kazalo vsebine

- [Pregled](#overview)
- [Predpogoji](#predpogoji)
- [Primeri za hiter začetek](#primeri-za-hiter-začetek)
- [Primeri za produkcijo](#primeri-za-produkcijo)
- [Napredni vzorci](#napredni-vzorci)
- [Najboljše prakse](#najboljše-prakse)

## Overview

Azure Container Apps je popolnoma upravljana strežnik brez platforme za kontejnerje, ki vam omogoča izvajanje mikrostoritev in kontejneriziranih aplikacij brez upravljanja infrastrukture. V kombinaciji z AZD dobite:

- **Poenostavljeno uvajanje**: En ukaz uvaja kontejnerje z infrastrukturo
- **Samodejno skaliranje**: Skaliranje na nič in razširjanje glede na HTTP promet ali dogodke
- **Integrirana omrežna povezljivost**: Vgrajeno odkrivanje storitev in razdeljevanje prometa
- **Upravljana identiteta**: Varen dostop do Azure virov
- **Optimizacija stroškov**: Plačujte samo za vire, ki jih uporabljate

## Predpogoji

Preden začnete, se prepričajte, da imate:

```bash
# Preverite namestitev AZD
azd version

# Preverite Azure CLI
az version

# Preverite Docker (za gradnjo prilagojenih slik)
docker --version

# Prijavite se v Azure
azd auth login
az login
```

**Zahtevani Azure viri:**
- Aktivno Azure naročnino
- Pooblastila za ustvarjanje skupine virov
- Dostop do okolja Container Apps

## Primeri za hiter začetek

### 1. Preprost spletni API (Python Flask)

Uvajanje osnovnega REST API-ja z Azure Container Apps.

**Primer: Python Flask API**

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

**Koraki uvajanja:**

```bash
# Inicializiraj iz predloge
azd init --template todo-python-mongo

# Vzpostavi infrastrukturo in namesti
azd up

# Preizkusi namestitev
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Ključne značilnosti:**
- Samodejno skaliranje od 0 do 10 replik
- Pregledi zdravja in preverjanja živega stanja
- Vbrizgavanje spremenljivk okolja
- Integracija z Application Insights

### 2. Node.js Express API

Uvajanje Node.js strežniške aplikacije z integracijo MongoDB.

```bash
# Inicializiraj predlogo Node.js API
azd init --template todo-nodejs-mongo

# Konfiguriraj spremenljivke okolja
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Objavi
azd up

# Ogled dnevnikov prek Azure Monitorja
azd monitor --logs
```

**Poudarki infrastrukture:**
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

### 3. Statični frontend + API backend

Uvajanje celotne aplikacije z React frontendom in API backendom.

```bash
# Inicializiraj predlogo za full-stack
azd init --template todo-csharp-sql-swa-func

# Preglej konfiguracijo
cat azure.yaml

# Namesti obe storitvi
azd up

# Odpri aplikacijo
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Primeri za produkcijo

### Primer 1: Mikrostoritvena arhitektura

**Scenarij**: E-trgovinska aplikacija z več mikrostoritvami

**Struktura imenika:**
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

**Konfiguracija azure.yaml:**
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

**Uvajanje:**
```bash
# Inicializiraj projekt
azd init

# Nastavi produkcijsko okolje
azd env new production

# Konfiguriraj produkcijske nastavitve
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Razporedi vse storitve
azd up

# Spremljaj nameščanje
azd monitor --overview
```

### Primer 2: AI-podprta kontejnerska aplikacija

**Scenarij**: AI klepetalna aplikacija z integracijo Microsoft Foundry Models

**Datoteka: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Uporabite upravljano identiteto za varen dostop
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Pridobite ključ OpenAI iz Key Vaulta
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

**Datoteka: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Datoteka: infra/main.bicep**
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

**Ukazi za uvajanje:**
```bash
# Nastavi okolje
azd init --template ai-chat-app
azd env new dev

# Konfiguriraj OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Razporedi
azd up

# Preizkusi API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Primer 3: Ozadinski delavec za obdelavo čakalnih vrst

**Scenarij**: Sistem za obdelavo naročil z vrsto sporočil

**Struktura imenika:**
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

**Datoteka: src/worker/processor.py**
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
            # Obdelaj naročilo
            print(f"Processing order: {message.content}")
            
            # Celotno sporočilo
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Datoteka: azure.yaml**
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

**Uvajanje:**
```bash
# Inicializiraj
azd init

# Razporedi s konfiguracijo čakalne vrste
azd up

# Prilagodi število delavcev glede na dolžino čakalne vrste
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Napredni vzorci

### Vzorec 1: Blue-Green uvajanje

```bash
# Ustvari novo revizijo brez prometa
azd deploy api --revision-suffix blue --no-traffic

# Preizkusi novo revizijo
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Razdeli promet (20 % na modro, 80 % na trenutno)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Popolna preusmeritev na modro
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Vzorec 2: Canary uvajanje z AZD

**Datoteka: .azure/dev/config.json**
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

**Skript za uvajanje:**
```bash
#!/bin/bash
# deploy-canary.sh

# Namesti novo različico z 10 % prometa
azd deploy api --revision-mode multiple

# Spremljaj metrike
azd monitor --service api --duration 5m

# Povečuj promet postopoma
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Počakaj 5 minut
done
```

### Vzorec 3: Uvajanje v več regijah

**Datoteka: azure.yaml**
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

**Datoteka: infra/multi-region.bicep**
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

**Uvajanje:**
```bash
# Razporedi v vse regije
azd up

# Preveri končne točke
azd show --output json | jq '.services.api.endpoints'
```

### Vzorec 4: Integracija z Dapr

**Datoteka: infra/app/dapr-enabled.bicep**
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

**Aplikacijska koda z Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Shrani stanje
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Objavi dogodek
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Najboljše prakse

### 1. Organizacija virov

```bash
# Uporabljajte dosledne konvencije poimenovanja
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Označite vire za spremljanje stroškov
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Najboljše varnostne prakse

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

### 3. Optimizacija zmogljivosti

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

### 4. Nadzor in opazljivost

```bash
# Omogoči Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Prikaži dnevnike v realnem času
azd monitor --logs
# Ali uporabite Azure CLI za Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Spremljaj metrike
azd monitor --live

# Ustvari opozorila
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Optimizacija stroškov

```bash
# Zmanjšaj na nič, ko ni v uporabi
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Uporabi spot instance v razvojnih okoljih
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Nastavi opozorila o proračunu
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Integracija CI/CD

**Primer GitHub Actions:**
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

## Referenca pogostih ukazov

```bash
# Inicializiraj nov projekt kontejnerske aplikacije
azd init --template <template-name>

# Razporedi infrastrukturo in aplikacijo
azd up

# Razporedi samo kodo aplikacije (preskoči infrastrukturo)
azd deploy

# Vzpostavi le infrastrukturo
azd provision

# Prikaži nameščene vire
azd show

# Pretakaj dnevnike z azd monitor ali Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Nadzoruj aplikacijo
azd monitor --overview

# Počisti vire
azd down --force --purge
```

## Odpravljanje težav

### Težava: Kontejner se ne zažene

```bash
# Preverite dnevnike z uporabo Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Oglejte si dogodke kontejnerja
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Preizkusite lokalno
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Težava: Ni dostopa do končnega URL-ja aplikacije kontejnerja

```bash
# Preveri konfiguracijo ingressa
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Preveri, ali je notranji ingress omogočen
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Težave z zmogljivostjo

```bash
# Preveri uporabo virov
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Povečaj vire
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Dodatni viri in primeri
- [Primer mikrostoritev](./microservices/README.md)
- [Preprost primer Flask API](./simple-flask-api/README.md)
- [Dokumentacija Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galerija predlog AZD](https://azure.github.io/awesome-azd/)
- [Vzorci Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Predloge Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Prispevanje

Za prispevanje novih primerov aplikacij Container Apps:

1. Ustvarite nov podimenik s svojim primerom
2. Vključite popolne datoteke `azure.yaml`, `infra/` in `src/`
3. Dodajte obsežen README z navodili za uvajanje
4. Preizkusite uvajanje z `azd up`
5. Pošljite pull request

---

**Potrebujete pomoč?** Pridružite se skupnosti [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) za podporo in vprašanja.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Medtem ko si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku naj se šteje za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->