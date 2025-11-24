<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-24T14:01:59+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "et"
}
-->
# Konteinerirakenduste juurutamise näited AZD-ga

See kataloog sisaldab põhjalikke näiteid konteinerirakenduste juurutamiseks Azure Container Apps platvormile, kasutades Azure Developer CLI-d (AZD). Näited illustreerivad reaalseid mustreid, parimaid tavasid ja tootmiskõlblikke konfiguratsioone.

## 📚 Sisukord

- [Ülevaade](../../../../examples/container-app)
- [Eeltingimused](../../../../examples/container-app)
- [Kiirstarti näited](../../../../examples/container-app)
- [Tootmise näited](../../../../examples/container-app)
- [Täpsemad mustrid](../../../../examples/container-app)
- [Parimad tavad](../../../../examples/container-app)

## Ülevaade

Azure Container Apps on täielikult hallatav serverivaba konteineriplatvorm, mis võimaldab käivitada mikroteenuseid ja konteinerirakendusi ilma infrastruktuuri haldamiseta. Koos AZD-ga saate:

- **Lihtsustatud juurutamine**: Ühe käsuga konteinerite ja infrastruktuuri juurutamine
- **Automaatne skaleerimine**: Skaleerimine nullist ülespoole vastavalt HTTP-liiklusele või sündmustele
- **Integreeritud võrgustik**: Sisseehitatud teenuste avastamine ja liikluse jagamine
- **Hallatud identiteet**: Turvaline autentimine Azure'i ressurssidele
- **Kulude optimeerimine**: Maksate ainult kasutatud ressursside eest

## Eeltingimused

Enne alustamist veenduge, et teil on:

```bash
# Kontrolli AZD paigaldust
azd version

# Kontrolli Azure CLI-d
az version

# Kontrolli Dockeri (kohandatud piltide loomiseks)
docker --version

# Logi sisse Azure'i
azd auth login
az login
```

**Nõutavad Azure'i ressursid:**
- Aktiivne Azure'i tellimus
- Õigused ressursigrupi loomiseks
- Juurdepääs Container Apps keskkonnale

## Kiirstarti näited

### 1. Lihtne veebirakendus (Python Flask)

Juurutage põhiline REST API Azure Container Apps abil.

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
# Initsialiseeri mallist
azd init --template todo-python-mongo

# Varusta infrastruktuur ja juuruta
azd up

# Testi juurutust
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Peamised omadused:**
- Automaatne skaleerimine 0 kuni 10 koopiani
- Tervisekontrollid ja elujõulisuse kontrollid
- Keskkonnamuutujate süstimine
- Application Insights integratsioon

### 2. Node.js Express API

Juurutage Node.js taustsüsteem MongoDB integratsiooniga.

```bash
# Initsialiseeri Node.js API mall
azd init --template todo-nodejs-mongo

# Konfigureeri keskkonnamuutujad
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Paigalda
azd up

# Vaata logisid
azd logs api
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

### 3. Staatiline esiosa + API taustsüsteem

Juurutage täisfunktsionaalne rakendus React esiosa ja API taustsüsteemiga.

```bash
# Initsialiseeri täislahenduse mall
azd init --template todo-csharp-sql-swa-func

# Vaata konfiguratsiooni üle
cat azure.yaml

# Paigalda mõlemad teenused
azd up

# Ava rakendus
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Tootmise näited

### Näide 1: Mikroteenuste arhitektuur

**Stsenaarium**: E-kaubanduse rakendus mitme mikroteenusega

**Kataloogistruktuur:**
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
# Algata projekt
azd init

# Määra tootmiskeskkond
azd env new production

# Konfigureeri tootmise seaded
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Paigalda kõik teenused
azd up

# Jälgi paigaldust
azd monitor --overview
```

### Näide 2: Tehisintellektiga konteinerirakendus

**Stsenaarium**: AI vestlusrakendus Azure OpenAI integratsiooniga

**Fail: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Kasuta hallatud identiteeti turvaliseks juurdepääsuks
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Hangi OpenAI võti võtmehoidlast
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
# Seadista keskkond
azd init --template ai-chat-app
azd env new dev

# Konfigureeri OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Paigalda
azd up

# Testi API-d
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Näide 3: Tausttöötaja järjekorra töötlemisega

**Stsenaarium**: Tellimuste töötlemise süsteem sõnumijärjekorraga

**Kataloogistruktuur:**
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
            # Töötle tellimus
            print(f"Processing order: {message.content}")
            
            # Lõpeta sõnum
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

# Paigalda järjekorra konfiguratsiooniga
azd up

# Skaaleeri töötaja vastavalt järjekorra pikkusele
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Täpsemad mustrid

### Muster 1: Sinine-roheline juurutamine

```bash
# Loo uus versioon ilma liikluseta
azd deploy api --revision-suffix blue --no-traffic

# Testi uut versiooni
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Jaga liiklust (20% sinisele, 80% praegusele)
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

### Muster 2: Kanarijuurutamine AZD-ga

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

**Juurutamisskript:**
```bash
#!/bin/bash
# deploy-canary.sh

# Paigalda uus versioon 10% liiklusega
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

### Muster 3: Mitme piirkonna juurutamine

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
# Paigalda kõikidesse piirkondadesse
azd up

# Kontrolli lõpp-punkte
azd show --output json | jq '.services.api.endpoints'
```

### Muster 4: Dapr integratsioon

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

**Rakenduse kood Dapr-iga:**
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
# Kasuta järjepidevaid nimekonventsioone
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Märgista ressursid kulude jälgimiseks
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

### 4. Jälgimine ja nähtavus

```bash
# Luba Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Vaata logisid reaalajas
azd logs api --follow

# Jälgi mõõdikuid
azd monitor --service api

# Loo teavitused
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Kulude optimeerimine

```bash
# Skaala nulli, kui ei kasutata
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Kasuta spot-instanse arenduskeskkondade jaoks
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Sea eelarvehoiatused
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD integratsioon

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

## Levinud käskude viide

```bash
# Initsialiseeri uus konteinerirakenduse projekt
azd init --template <template-name>

# Paigalda infrastruktuur ja rakendus
azd up

# Paigalda ainult rakenduse kood (jäta infrastruktuur vahele)
azd deploy

# Loo ainult infrastruktuur
azd provision

# Vaata paigaldatud ressursse
azd show

# Edasta logisid
azd logs <service-name> --follow

# Jälgi rakendust
azd monitor --overview

# Puhasta ressursid
azd down --force --purge
```

## Tõrkeotsing

### Probleem: Konteiner ei käivitu

```bash
# Kontrolli logisid
azd logs api --tail 100

# Vaata konteineri sündmusi
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testi kohapeal
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Probleem: Ei pääse konteinerirakenduse lõpp-punktile ligi

```bash
# Kontrolli sissetuleku konfiguratsiooni
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Kontrolli, kas sisemine sissetulek on lubatud
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Probleem: Jõudlusprobleemid

```bash
# Kontrolli ressursside kasutamist
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
- [Lihtne Flask API näide](./simple-flask-api/README.md)
- [Azure Container Apps dokumentatsioon](https://learn.microsoft.com/azure/container-apps/)
- [AZD mallide galerii](https://azure.github.io/awesome-azd/)
- [Container Apps näited](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep mallid](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Kaasamine

Uute konteinerirakenduste näidete lisamiseks:

1. Looge oma näite jaoks uus alamkataloog
2. Lisage täielikud `azure.yaml`, `infra/` ja `src/` failid
3. Lisage põhjalik README koos juurutusjuhistega
4. Testige juurutust käsuga `azd up`
5. Esitage pull request

---

**Vajate abi?** Liituge [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) kogukonnaga, et saada tuge ja esitada küsimusi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta arusaamatuste või valesti tõlgenduste eest, mis võivad tekkida selle tõlke kasutamise tõttu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->