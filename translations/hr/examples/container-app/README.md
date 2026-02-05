# Primjeri implementacije aplikacija u kontejnerima s AZD-om

Ovaj direktorij sadrži detaljne primjere za implementaciju aplikacija u kontejnerima na Azure Container Apps koristeći Azure Developer CLI (AZD). Ovi primjeri prikazuju stvarne obrasce, najbolje prakse i konfiguracije spremne za produkciju.

## 📚 Sadržaj

- [Pregled](../../../../examples/container-app)
- [Preduvjeti](../../../../examples/container-app)
- [Primjeri za brzi početak](../../../../examples/container-app)
- [Primjeri za produkciju](../../../../examples/container-app)
- [Napredni obrasci](../../../../examples/container-app)
- [Najbolje prakse](../../../../examples/container-app)

## Pregled

Azure Container Apps je potpuno upravljana serverless platforma za kontejnere koja omogućuje pokretanje mikrousluga i aplikacija u kontejnerima bez upravljanja infrastrukturom. Kada se koristi s AZD-om, dobivate:

- **Pojednostavljena implementacija**: Jedna naredba implementira kontejnere s infrastrukturom
- **Automatsko skaliranje**: Skaliranje na nulu i skaliranje prema van na temelju HTTP prometa ili događaja
- **Integrirano umrežavanje**: Ugrađeno otkrivanje usluga i podjela prometa
- **Upravljani identitet**: Sigurna autentifikacija za Azure resurse
- **Optimizacija troškova**: Plaćate samo za resurse koje koristite

## Preduvjeti

Prije početka, osigurajte da imate:

```bash
# Provjerite AZD instalaciju
azd version

# Provjerite Azure CLI
az version

# Provjerite Docker (za izradu prilagođenih slika)
docker --version

# Prijavite se na Azure
azd auth login
az login
```

**Potrebni Azure resursi:**
- Aktivna Azure pretplata
- Dozvole za kreiranje grupa resursa
- Pristup okruženju Container Apps

## Primjeri za brzi početak

### 1. Jednostavni Web API (Python Flask)

Implementirajte osnovni REST API s Azure Container Apps.

**Primjer: Python Flask API**

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

**Koraci implementacije:**

```bash
# Inicijaliziraj iz predloška
azd init --template todo-python-mongo

# Osiguraj infrastrukturu i implementiraj
azd up

# Testiraj implementaciju
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Ključne značajke:**
- Automatsko skaliranje od 0 do 10 replika
- Provjere zdravlja i provjere živosti
- Umetanje varijabli okruženja
- Integracija Application Insights

### 2. Node.js Express API

Implementirajte Node.js backend s integracijom MongoDB-a.

```bash
# Inicijaliziraj Node.js API predložak
azd init --template todo-nodejs-mongo

# Konfiguriraj varijable okruženja
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Implementiraj
azd up

# Pregledaj zapisnike
azd logs api
```

**Istaknuti dijelovi infrastrukture:**
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

### 3. Statički frontend + API backend

Implementirajte full-stack aplikaciju s React frontendom i API backendom.

```bash
# Inicijaliziraj full-stack predložak
azd init --template todo-csharp-sql-swa-func

# Pregledaj konfiguraciju
cat azure.yaml

# Implementiraj obje usluge
azd up

# Otvori aplikaciju
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Primjeri za produkciju

### Primjer 1: Arhitektura mikrousluga

**Scenarij**: E-commerce aplikacija s više mikrousluga

**Struktura direktorija:**
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

**azure.yaml konfiguracija:**
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

**Implementacija:**
```bash
# Inicijaliziraj projekt
azd init

# Postavi produkcijsko okruženje
azd env new production

# Konfiguriraj produkcijske postavke
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Implementiraj sve usluge
azd up

# Prati implementaciju
azd monitor --overview
```

### Primjer 2: Aplikacija u kontejneru s AI podrškom

**Scenarij**: AI chat aplikacija s integracijom Azure OpenAI

**Datoteka: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Koristite upravljani identitet za siguran pristup
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Dohvatite OpenAI ključ iz Key Vaulta
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

**Naredbe za implementaciju:**
```bash
# Postavite okruženje
azd init --template ai-chat-app
azd env new dev

# Konfigurirajte OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Implementirajte
azd up

# Testirajte API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Primjer 3: Pozadinski radnik s obradom redova

**Scenarij**: Sustav za obradu narudžbi s redovima poruka

**Struktura direktorija:**
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
            # Obradi narudžbu
            print(f"Processing order: {message.content}")
            
            # Dovrši poruku
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

**Implementacija:**
```bash
# Inicijalizirati
azd init

# Implementirati s konfiguracijom reda čekanja
azd up

# Skalirati radnika na temelju duljine reda čekanja
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Napredni obrasci

### Obrazac 1: Blue-Green implementacija

```bash
# Kreiraj novu reviziju bez prometa
azd deploy api --revision-suffix blue --no-traffic

# Testiraj novu reviziju
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Podijeli promet (20% na plavo, 80% na trenutno)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Potpuni prijelaz na plavo
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Obrazac 2: Canary implementacija s AZD-om

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

**Skripta za implementaciju:**
```bash
#!/bin/bash
# deploy-canary.sh

# Implementiraj novu reviziju s 10% prometa
azd deploy api --revision-mode multiple

# Prati metrike
azd monitor --service api --duration 5m

# Postupno povećavaj promet
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Pričekaj 5 minuta
done
```

### Obrazac 3: Implementacija u više regija

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

**Implementacija:**
```bash
# Implementiraj u sve regije
azd up

# Provjeri krajnje točke
azd show --output json | jq '.services.api.endpoints'
```

### Obrazac 4: Integracija s Dapr-om

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

**Kod aplikacije s Dapr-om:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Spremi stanje
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Objavi događaj
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Najbolje prakse

### 1. Organizacija resursa

```bash
# Koristite dosljedne konvencije imenovanja
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Oznaka resursa za praćenje troškova
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Sigurnosne najbolje prakse

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

### 3. Optimizacija performansi

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

### 4. Praćenje i preglednost

```bash
# Omogući Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Pregledaj zapisnike u stvarnom vremenu
azd logs api --follow

# Prati metrike
azd monitor --service api

# Kreiraj upozorenja
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Optimizacija troškova

```bash
# Skaliraj na nulu kada se ne koristi
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Koristi spot instance za razvojna okruženja
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Postavi upozorenja o proračunu
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Integracija CI/CD-a

**Primjer GitHub Actions:**
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

## Referenca za uobičajene naredbe

```bash
# Inicijaliziraj novi projekt aplikacije za kontejnere
azd init --template <template-name>

# Implementiraj infrastrukturu i aplikaciju
azd up

# Implementiraj samo kod aplikacije (preskoči infrastrukturu)
azd deploy

# Osiguraj samo infrastrukturu
azd provision

# Pregledaj implementirane resurse
azd show

# Prati zapisnike
azd logs <service-name> --follow

# Nadgledaj aplikaciju
azd monitor --overview

# Očisti resurse
azd down --force --purge
```

## Rješavanje problema

### Problem: Kontejner se ne pokreće

```bash
# Provjerite zapisnike
azd logs api --tail 100

# Pregledajte događaje kontejnera
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testirajte lokalno
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problem: Nemoguće pristupiti krajnjoj točki aplikacije u kontejneru

```bash
# Provjerite konfiguraciju ulaza
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Provjerite je li unutarnji ulaz omogućen
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problem: Problemi s performansama

```bash
# Provjeri iskorištenost resursa
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Povećaj resurse
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Dodatni resursi i primjeri
- [Primjer mikrousluga](./microservices/README.md)
- [Primjer jednostavnog Flash API-ja](./simple-flask-api/README.md)
- [Dokumentacija za Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galerija AZD predložaka](https://azure.github.io/awesome-azd/)
- [Primjeri aplikacija u kontejnerima](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep predlošci](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Doprinos

Za doprinos novim primjerima aplikacija u kontejnerima:

1. Kreirajte novi poddirektorij s vašim primjerom
2. Uključite kompletne datoteke `azure.yaml`, `infra/` i `src/`
3. Dodajte detaljan README s uputama za implementaciju
4. Testirajte implementaciju s `azd up`
5. Pošaljite pull request

---

**Treba vam pomoć?** Pridružite se [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) zajednici za podršku i pitanja.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->