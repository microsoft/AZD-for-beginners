# Container App deploymentimise näited AZD-ga

See kataloog sisaldab põhjalikke näiteid konteinerirakenduste juurutamiseks Azure Container Apps platvormile, kasutades Azure Developer CLI-d (AZD). Need näited demonstreerivad reaalse maailma mustreid, parimaid tavasid ja tootmiskõlblikke konfiguratsioone.

## 📚 Sisukord

- [Ülevaade](#ülevaade)
- [Eeltingimused](#eeltingimused)
- [Kiire alguse näited](#kiire-alguse-näited)
- [Tootmise näited](#tootmise-näited)
- [Täpsemad mustrid](#täpsemad-mustrid)
- [Parimad tavad](#parimad-tavad)

## Ülevaade

Azure Container Apps on täielikult hallatav serverivaba konteinerite platvorm, mis võimaldab teil käivitada mikroteenuseid ja konteineripõhiseid rakendusi ilma infrastruktuuri haldamata. Kui seda kombineerida AZD-ga, saate:

- **Lihtsustatud juurutamine**: Üks käsk paneb konteinerid ja infrastruktuuri tööle
- **Automaatne skaleerimine**: Skaalib nullini ja laieneb vastavalt HTTP-liiklusele või sündmustele
- **Integreeritud võrgustamine**: Sisseehitatud teenuste avastamine ja liikluse jagamine
- **Haldatav identiteet**: Turvaline autentimine Azure ressurssidele
- **Maksimaalne kuluefektiivsus**: Maksate ainult kasutatud ressursside eest

## Eeltingimused

Enne alustamist veenduge, et teil on:

```bash
# Kontrolli AZD paigaldust
azd version

# Kontrolli Azure CLI-d
az version

# Kontrolli Dockerit (kohandatud piltide ehitamiseks)
docker --version

# Autenda AZD juurutuste jaoks
azd auth login

# Valikuline: logi sisse Azure CLI-sse, kui plaanid otse az käske käivitada
az login
```

**Vajalikud Azure ressursid:**
- Aktiivne Azure tellimus
- Ressursigrupi loomiseks vajalikud õigused
- Juurdepääs Container Apps keskkonnale

## Kiire alguse näited

### 1. Lihtne veebipõhine API (Python Flask)

Juurutage põhiline REST API Azure Container Apps keskkonnas.

**Näide: Python Flask API**

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

**Juurutamise sammud:**

```bash
# Algatamine mallist
azd init --template todo-python-mongo

# Infrastruktuuri varustamine ja juurutamine
azd up

# Juurutuse testimine
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Põhifunktsioonid:**
- Automaatne skaleerimine 0-st kuni 10 koopiani
- Tervisekontrollid ja elujõulisuse testid
- Keskkonnamuutujate süstimine
- Application Insightsi integreerimine

### 2. Node.js Express API

Juurutage Node.js tagaplaan MongoDB integratsiooniga.

```bash
# Initsialiseeri Node.js API mall
azd init --template todo-nodejs-mongo

# Konfigureeri keskkonnamuutujad
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Käivita
azd up

# Vaata logisid Azure Monitori kaudu
azd monitor --logs
```

**Infrastruktuuri esiletõstmised:**
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

### 3. Staatiline frontend + API taustaprogramm

Juurutage täisfunktsionaalne rakendus Reacti frontendiga ja API taustaga.

```bash
# Algatage täispinou mall
azd init --template todo-csharp-sql-swa-func

# Vaadake konfiguratsiooni üle
cat azure.yaml

# Paigaldage mõlemad teenused
azd up

# Avage rakendus
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Tootmise näited

### Näide 1: Mikroteenuste arhitektuur

**Stsenaarium**: E-kaubanduse rakendus mitme mikroteenusega

**Kataloogi struktuur:**
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

**azure.yaml konfiguratsioon:**
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

**Juurutamine:**
```bash
# Projekti algatamine
azd init

# Määra tootmiskeskkond
azd env new production

# Konfigureeri tootmise seaded
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Hangi kõik teenused üle
azd up

# Jälgi juurutamist
azd monitor --overview
```

### Näide 2: Tehisintellektil põhinev konteinerirakendus

**Stsenaarium**: AI vestlusrakendus Microsoft Foundry mudelite integratsiooniga

**Fail: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Kasutage turvaliseks juurdepääsuks haldatud identiteeti
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Hankige OpenAI võti võtmeladust
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

**Fail: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Fail: infra/main.bicep**
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

**Juurutamiskäsud:**
```bash
# Keskkonna seadistamine
azd init --template ai-chat-app
azd env new dev

# OpenAI konfigureerimine
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Paigaldamine
azd up

# API testimine
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Näide 3: Taustatöötlus töötlejaga, mis töötleb järjekorda

**Stsenaarium**: Tellimuste töötlemise süsteem sõnumijärjekorraga

**Kataloogi struktuur:**
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

**Fail: src/worker/processor.py**
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
            # Töötle tellimust
            print(f"Processing order: {message.content}")
            
            # Täida sõnum
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Fail: azure.yaml**
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

**Juurutamine:**
```bash
# Initsialiseeri
azd init

# Kasutades järjekorra konfiguratsiooni juurutamine
azd up

# Töötaja skaleerimine vastavalt järjekorra pikkusele
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Täpsemad mustrid

### Muster 1: Sinine-Roheline juurutamine

```bash
# Loo uus revisjon ilma liikluseta
azd deploy api --revision-suffix blue --no-traffic

# Testi uut revisjoni
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Jaga liiklust (20% sinisele, 80% jooksvale)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Täielik üleminek sinisele
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Muster 2: Kanarilendurite juurutamine AZD-ga

**Fail: .azure/dev/config.json**
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

**Juurutusskript:**
```bash
#!/bin/bash
# deploy-canary.sh

# Juhi uus revisjon 10% liiklusega
azd deploy api --revision-mode multiple

# Jälgi mõõdikuid
azd monitor --service api --duration 5m

# Suurenda liiklust järk-järgult
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Oota 5 minutit
done
```

### Muster 3: Mitme regiooni juurutamine

**Fail: azure.yaml**
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

**Fail: infra/multi-region.bicep**
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

**Juurutamine:**
```bash
# Paiguta kõigisse regioonidesse
azd up

# Kontrolli lõpp-punkte
azd show --output json | jq '.services.api.endpoints'
```

### Muster 4: Dapri integratsioon

**Fail: infra/app/dapr-enabled.bicep**
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

**Rakenduse kood koos Dapriga:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Salvesta olek
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Avalda sündmus
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Parimad tavad

### 1. Ressursside organiseerimine

```bash
# Kasutage järjepidevaid nimetamise konventsioone
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Märgistage ressursid kulude jälgimiseks
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Turvalisuse parimad tavad

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

### 3. Jõudluse optimeerimine

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

### 4. Jälgimine ja vaatlus

```bash
# Luba Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Vaata logisid reaalajas
azd monitor --logs
# Või kasuta Azure CLI Container Apps jaoks:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Jälgi mõõdikuid
azd monitor --live

# Loo teavitused
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Kuluoptimeerimine

```bash
# Skaaleeri nulli, kui ei kasutata
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Kasuta arenduskeskkondades spot-instantsse
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Sea üles eelarvehoiatused
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD integreerimine

**GitHub Actions näide:**
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

## Sageli kasutatavad käsud

```bash
# Initsialiseeri uus konteineri rakenduse projekt
azd init --template <template-name>

# Paiguta infrastruktuur ja rakendus
azd up

# Paiguta ainult rakenduse kood (jäta infrastruktuur vahele)
azd deploy

# Paiguta ainult infrastruktuur
azd provision

# Vaata paigaldatud ressursse
azd show

# Jälgi logisid kasutades azd monitori või Azure CLI-d
azd monitor --logs
# az containerapp logs show --name <teenuse-nimi> --resource-group <rg-nimi> --follow

# Jälgi rakendust
azd monitor --overview

# Puhasta ressursid
azd down --force --purge
```

## Tõrkeotsing

### Probleem: konteiner ei käivitu

```bash
# Kontrolli logisid Azure CLI abil
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Vaata konteineri sündmusi
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testi lokaalselt
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Probleem: konteinerirakendusele ligipääs ebaõnnestub

```bash
# Kontrolli ingressi konfiguratsiooni
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Kontrolli, kas sise-ingress on lubatud
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Probleem: jõudlusprobleemid

```bash
# Kontrolli ressursikasutust
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Suurenda ressursse
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Täiendavad ressursid ja näited
- [Mikroteenuste näide](./microservices/README.md)
- [Lihtsa Flash API näide](./simple-flask-api/README.md)
- [Azure Container Apps dokumentatsioon](https://learn.microsoft.com/azure/container-apps/)
- [AZD mallide galerii](https://azure.github.io/awesome-azd/)
- [Container Apps näidised](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep mallid](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Panusta

Uute konteinerirakenduste näidete panustamiseks:

1. Loo uus alamkataloog oma näitega
2. Lisa täielikud failid `azure.yaml`, `infra/` ja `src/`
3. Lisa põhjalik README koos juurutusjuhistega
4. Testi juurutamist käsuga `azd up`
5. Esita pull request

---

**Abi vajate?** Liituge toetuseks ja küsimusteks [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) kogukonnaga.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud kasutades tehisintellekti tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta ühegi arusaamatuse ega valesti tõlgendamise eest, mis võivad tuleneda selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->