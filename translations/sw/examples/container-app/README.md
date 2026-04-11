# Mifano ya Usambazaji wa Container App kwa AZD

Hii saraka ina mifano kamili ya kusambaza programu zilizohifadhiwa kwenye kontena kwa Azure Container Apps kwa kutumia Azure Developer CLI (AZD). Mifano hii inaonyesha mifumo ya vitendo, mbinu bora, na usanidi tayari kwa uzalishaji.

## 📚 Jedwali la Yaliyomo

- [Muhtasari](#muhtasari)
- [Mahitaji](#mahitaji)
- [Mifano ya Kuanzia Haraka](#mifano-ya-kuanzia-haraka)
- [Mifano ya Uzalishaji](#mifano-ya-uzalishaji)
- [Mbinu Zinazoendelea](#mbinu-zinazoendelea)
- [Mbinu Bora](#mbinu-bora)

## Muhtasari

Azure Container Apps ni jukwaa la kontena lisilo na seva linalosimamiwa kikamilifu ambalo linakuwezesha kuendesha microservices na programu zilizohifadhiwa kwenye kontena bila kusimamia miundombinu. Ukichanganya na AZD, unapata:

- **Usambazaji Uliorahisishwa**: Amri moja husambaza kontena pamoja na miundombinu
- **Ukipima Moja kwa Moja**: Inapima kutoka sifuri na kupanua kulingana na trafiki ya HTTP au matukio
- **Mitandao Iliyoshirikishwa**: Ugunduzi wa huduma uliowekwa na kugawanya trafiki
- **Utambulisho Usimamiliwa**: Uthibitishaji salama kwa rasilimali za Azure
- **Uboreshaji wa Gharama**: Lipa tu kwa rasilimali unazotumia

## Mahitaji

Kabla ya kuanza, hakikisha una:

```bash
# Angalia usanikishaji wa AZD
azd version

# Angalia Azure CLI
az version

# Angalia Docker (kwa ajili ya kujenga picha zilizobinafsishwa)
docker --version

# Thibitisha kwa ajili ya uanzishaji wa AZD
azd auth login

# Hiari: ingia katika Azure CLI ikiwa unapanga kuendesha amri za az moja kwa moja
az login
```

**Rasilimali za Azure Zinazohitajika:**
- Usajili wa Azure unaotumika
- Idhini za kuunda resource group
- Ufikiaji wa mazingira ya Container Apps

## Mifano ya Kuanzia Haraka

### 1. API Rahisi ya Wavuti (Python Flask)

Sambaza API rahisi ya REST kwa Azure Container Apps.

**Mfano: API ya Python Flask**

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

**Hatua za Usambazaji:**

```bash
# Anzisha kutoka kwa kiolezo
azd init --template todo-python-mongo

# Sanidi miundombinu na upeleke programu
azd up

# Jaribu utekelezaji
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Sifa Muhimu:**
- Kujipanua kwa moja kwa moja kutoka 0 hadi nakala 10
- Upimaji wa afya na ukaguzi wa uhai
- Kuingizwa kwa vigezo vya mazingira
- Uunganisho wa Application Insights

### 2. API ya Node.js Express

Sambaza backend ya Node.js iliyo na uunganisho wa MongoDB.

```bash
# Anzisha templeti ya API ya Node.js
azd init --template todo-nodejs-mongo

# Sanidi vigezo vya mazingira
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Sambaza
azd up

# Tazama kumbukumbu za shughuli kupitia Azure Monitor
azd monitor --logs
```

**Mambo Muhimu ya Miundombinu:**
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

### 3. Frontend Imara + Backend ya API

Sambaza programu kamili yenye frontend ya React na backend ya API.

```bash
# Anzisha kiolezo la full-stack
azd init --template todo-csharp-sql-swa-func

# Kagua usanidi
cat azure.yaml

# Sambaza huduma zote mbili
azd up

# Fungua programu
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Mifano ya Uzalishaji

### Mfano 1: Mimari ya Microservices

**Senario**: Programu ya e-commerce yenye microservices nyingi

**Muundo wa Saraka:**
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

**Usanidi wa azure.yaml:**
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

**Usambazaji:**
```bash
# Anzisha mradi
azd init

# Weka mazingira ya uzalishaji
azd env new production

# Sanidi mipangilio ya uzalishaji
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Sambaza huduma zote
azd up

# Fuatilia usambazaji
azd monitor --overview
```

### Mfano 2: Container App Inayoendeshwa na AI

**Senario**: Programu ya chat ya AI yenye uunganisho na Microsoft Foundry Models

**Faili: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Tumia Utambulisho Ulioendeshwa kwa upatikanaji salama
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Pata ufunguo wa OpenAI kutoka Hazina ya Funguo
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

**Faili: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Faili: infra/main.bicep**
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

**Amri za Usambazaji:**
```bash
# Sanidi mazingira
azd init --template ai-chat-app
azd env new dev

# Sanidi OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Sambaza
azd up

# Jaribu API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Mfano 3: Mfanyakazi wa Mandharinyuma na Usindikaji wa Foleni

**Senario**: Mfumo wa usindikaji wa maagizo wenye foleni ya ujumbe

**Muundo wa Saraka:**
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

**Faili: src/worker/processor.py**
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
            # Shughulikia agizo
            print(f"Processing order: {message.content}")
            
            # Kamilisha ujumbe
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Faili: azure.yaml**
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

**Usambazaji:**
```bash
# Anzisha
azd init

# Sambaza kwa usanidi wa foleni
azd up

# Panga idadi ya wafanyakazi kulingana na urefu wa foleni
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Mbinu Zinazoendelea

### Mfano 1: Usambazaji wa Blue-Green

```bash
# Unda marekebisho mapya bila trafiki
azd deploy api --revision-suffix blue --no-traffic

# Jaribu marekebisho mapya
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Gawanya trafiki (20% kwa bluu, 80% kwa toleo la sasa)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Hamisho kamili kwenda bluu
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Mfano 2: Usambazaji wa Canary kwa AZD

**Faili: .azure/dev/config.json**
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

**Skripti ya Usambazaji:**
```bash
#!/bin/bash
# deploy-canary.sh

# Weka toleo jipya kwa 10% ya trafiki
azd deploy api --revision-mode multiple

# Fuatilia vipimo
azd monitor --service api --duration 5m

# Ongeza trafiki kwa taratibu
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Subiri dakika 5
done
```

### Mfano 3: Usambazaji wa Mikoa Nyingi

**Faili: azure.yaml**
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

**Faili: infra/multi-region.bicep**
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

**Usambazaji:**
```bash
# Weka katika mikoa yote
azd up

# Thibitisha endpoints
azd show --output json | jq '.services.api.endpoints'
```

### Mfano 4: Uunganisho wa Dapr

**Faili: infra/app/dapr-enabled.bicep**
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

**Msimbo wa Programu pamoja na Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Hifadhi hali
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Chapisha tukio
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Mbinu Bora

### 1. Muundo wa Rasilimali

```bash
# Tumia kanuni thabiti za utoaji wa majina
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Weka lebo kwa rasilimali ili kufuatilia gharama
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Mbinu Bora za Usalama

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

### 3. Uboreshaji wa Utendaji

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

### 4. Ufuatiliaji na Uwezo wa Kuchunguza

```bash
# Washa Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Tazama logi kwa wakati halisi
azd monitor --logs
# Au tumia Azure CLI kwa Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Fuatilia vipimo
azd monitor --live

# Unda arifa
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Uboreshaji wa Gharama

```bash
# Punguza hadi sifuri wakati haitumiki
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Tumia spot instances kwa mazingira ya maendeleo
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Sanidi arifa za bajeti
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Uunganisho wa CI/CD

**Mfano wa GitHub Actions:**
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

## Marejeo ya Amri za Kawaida

```bash
# Anzisha mradi mpya wa programu ya kontena
azd init --template <template-name>

# Sambaza miundombinu na programu
azd up

# Sambaza tu msimbo wa programu (ruka miundombinu)
azd deploy

# Tayarisha miundombinu tu
azd provision

# Tazama rasilimali zilizosambazwa
azd show

# Onyesha kumbukumbu kwa wakati halisi kwa kutumia azd monitor au Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Fuatilia programu
azd monitor --overview

# Safisha rasilimali
azd down --force --purge
```

## Utatuzi wa Matatizo

### Tatizo: Kontena haianzi

```bash
# Angalia logi kwa kutumia Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Tazama matukio ya kontena
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Jaribu kwa mashine ya ndani
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Tatizo: Huwezi kufikia endpoint ya container app

```bash
# Thibitisha usanidi wa ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Angalia kama ingress ya ndani imewezeshwa
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Tatizo: Matatizo ya utendaji

```bash
# Angalia matumizi ya rasilimali
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Ongeza rasilimali
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Rasilimali Zingine na Mifano
- [Mfano wa Microservices](./microservices/README.md)
- [Mfano Rahisi wa Flash API](./simple-flask-api/README.md)
- [Nyaraka za Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Makusanyo ya Violezo vya AZD](https://azure.github.io/awesome-azd/)
- [Mifano ya Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Violezo vya Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Kuchangia

Ili kuchangia mifano mpya ya container app:

1. Tengeneza saraka ndogo mpya yenye mfano wako
2. Jumuisha faili kamili za `azure.yaml`, `infra/`, na `src/`
3. Ongeza README kamili yenye maelekezo ya usambazaji
4. Jaribu usambazaji kwa `azd up`
5. Tuma pull request

---

**Unahitaji Msaada?** Jiunge na jumuiya ya [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) kwa msaada na maswali.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ukosefu wa dhamana**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au upotovu. Nyaraka ya asili katika lugha yake ya mzaliwa inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia tafsiri ya kitaalamu iliyofanywa na mtafsiri binafsi. Hatuwezi kuwajibika kwa maelewano potofu au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->