# Mifano ya Utekelezaji wa Container App kwa AZD

Hili saraka lina mifano kamili ya kupeleka programu zilizokonteniwa kwenye Azure Container Apps kwa kutumia Azure Developer CLI (AZD). Mifano hii inaonyesha mifumo ya ulimwengu halisi, mbinu bora, na usanidi tayari kwa uzalishaji.

## 📚 Jedwali la Maudhui

- [Muhtasari](../../../../examples/container-app)
- [Mahitaji](../../../../examples/container-app)
- [Mifano za Kuanzia Haraka](../../../../examples/container-app)
- [Mifano ya Uzalishaji](../../../../examples/container-app)
- [Mifumo ya Juu](../../../../examples/container-app)
- [Mbinu Bora](../../../../examples/container-app)

## Muhtasari

Azure Container Apps ni jukwaa la kontena lisilohitaji kusimamiwa kikamilifu linalokuwezesha kuendesha microservices na programu zilizokonteniwa bila kusimamia miundombinu. Wakati linapoambatana na AZD, unapata:

- **Utekelezaji Uliorahisishwa**: Amri moja inaweka kontena pamoja na miundombinu
- **Kuinuka kwa Kiotomatiki**: Inakuwezesha kufikia sifuri na kuongeza replicas kulingana na trafiki ya HTTP au matukio
- **Uunganishaji wa Mtandao**: Ugunduo wa huduma uliomo ndani na kugawanya trafiki
- **Utambulisho Unaosimamiwa**: Uthibitishaji salama kwa rasilimali za Azure
- **Uboreshaji wa Gharama**: Lipa tu kwa rasilimali unazotumia

## Mahitaji

Kabla ya kuanza, hakikisha una:

```bash
# Angalia usakinishaji wa AZD
azd version

# Angalia Azure CLI
az version

# Angalia Docker (kwa ajili ya kujenga imaji maalum)
docker --version

# Ingia kwenye Azure
azd auth login
az login
```

**Rasilimali za Azure Zinazohitajika:**
- Kadi/akaunti ya Azure inayofanya kazi
- Ruhusa za kuunda resource group
- Upatikanaji wa mazingira ya Container Apps

## Mifano za Kuanzia Haraka

### 1. API ya Wavuti Rahisi (Python Flask)

Sambaza API ya msingi ya REST kwa Azure Container Apps.

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

**Hatua za Utekelezaji:**

```bash
# Anzisha kutoka kwa kiolezo
azd init --template todo-python-mongo

# Tayarisha miundombinu na zindua
azd up

# Jaribu uanzishaji
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Sifa Muhimu:**
- Kuongezeka kwa replicas otomatiki kutoka 0 hadi 10
- Upimaji wa afya na ukaguzi wa uhai
- Uingizaji wa vigezo vya mazingira
- Uunganishaji na Application Insights

### 2. API ya Node.js Express

Sambaza backend ya Node.js yenye uunganisho wa MongoDB.

```bash
# Anzisha kiolezo cha API ya Node.js
azd init --template todo-nodejs-mongo

# Sanidi vigezo vya mazingira
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Sambaza
azd up

# Tazama kumbukumbu kupitia Azure Monitor
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

Sambaza programu ya full-stack yenye frontend ya React na backend ya API.

```bash
# Anzisha kiolezo cha full-stack
azd init --template todo-csharp-sql-swa-func

# Kagua usanidi
cat azure.yaml

# Sambaza huduma zote mbili
azd up

# Fungua programu
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Mifano ya Uzalishaji

### Mfano 1: Arkiteti ya Microservices

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

**azure.yaml Configuration:**
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

**Utekelezaji:**
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

### Mfano 2: Programu ya Container Iliyowezeshwa na AI

**Senario**: Programu ya mazungumzo ya AI yenye uunganisho wa Azure OpenAI

**Faili: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Tumia Managed Identity kwa upatikanaji salama
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Pata ufunguo wa OpenAI kutoka Key Vault
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

**Amri za Utekelezaji:**
```bash
# Sanidi mazingira
azd init --template ai-chat-app
azd env new dev

# Sanidi OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Weka kwenye uzalishaji
azd up

# Jaribu API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Mfano 3: Mfanyakazi wa Nyuma na Uchakataji wa Foleni

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
            # Chakata agizo
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

**Utekelezaji:**
```bash
# Anzisha
azd init

# Sambaza kwa usanidi wa foleni
azd up

# Badilisha idadi ya wafanyakazi kulingana na urefu wa foleni
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Mifumo ya Juu

### Mfumo 1: Utekelezaji wa Blue-Green

```bash
# Unda toleo jipya bila trafiki
azd deploy api --revision-suffix blue --no-traffic

# Jaribu toleo jipya
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Gawanya trafiki (20% kwa blue, 80% kwa sasa)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Hamisho kamili kwenda blue
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Mfumo 2: Utekelezaji wa Canary kwa AZD

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

**Skripti ya Utekelezaji:**
```bash
#!/bin/bash
# deploy-canary.sh

# Sambaza toleo jipya kwa 10% ya trafiki
azd deploy api --revision-mode multiple

# Fuatilia vipimo
azd monitor --service api --duration 5m

# Ongeza trafiki hatua kwa hatua
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Subiri dakika 5
done
```

### Mfumo 3: Utekelezaji wa Maeneo Nyingi

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

**Utekelezaji:**
```bash
# Sambaza kwa mikoa yote
azd up

# Thibitisha miisho
azd show --output json | jq '.services.api.endpoints'
```

### Mfumo 4: Uunganishaji wa Dapr

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

**Msimbo wa Programu unaotumia Dapr:**
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

### 1. Mipangilio ya Rasilimali

```bash
# Tumia kanuni za uundaji majina zinazofanana
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Weka lebo kwa rasilimali kwa ajili ya kufuatilia gharama
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

### 4. Ufuatiliaji na Uonekano

```bash
# Wezesha Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Tazama rejista kwa wakati halisi
azd monitor --logs
# Au tumia Azure CLI kwa ajili ya Container Apps:
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

# Tumia instances za spot kwa mazingira ya maendeleo
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
# Anzisha mradi mpya wa programu ya container
azd init --template <template-name>

# Weka miundombinu na programu
azd up

# Weka tu msimbo wa programu (ruka miundombinu)
azd deploy

# Tayarisha miundombinu pekee
azd provision

# Tazama rasilimali zilizowekwa
azd show

# Tiririsha logi kwa kutumia azd monitor au Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Fuatilia programu
azd monitor --overview

# Safisha rasilimali
azd down --force --purge
```

## Kutatua Matatizo

### Tatizo: Kontena haianzi

```bash
# Angalia kumbukumbu kwa kutumia Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Tazama matukio ya kontena
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Jaribu kwenye mazingira ya ndani
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Tatizo: Haiwezekani kufikia endpoint ya programu ya kontena

```bash
# Thibitisha usanidi wa ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Angalia ikiwa ingress ya ndani imewezeshwa
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

## Rasilimali na Mifano Zaidi
- [Mfano wa Microservices](./microservices/README.md)
- [Mfano wa Simple Flash API](./simple-flask-api/README.md)
- [Nyaraka za Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Mkusanyiko wa Violezo vya AZD](https://azure.github.io/awesome-azd/)
- [Mifano za Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Violezo vya Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Kuchangia

Ili kuchangia mifano mipya ya container app:

1. Unda saraka ndogo mpya iliyo na mfano wako
2. Jumuisha faili kamili `azure.yaml`, `infra/`, na `src/` files
3. Ongeza README kamili yenye maelekezo ya utekelezaji
4. Jaribu utekelezaji kwa kutumia `azd up`
5. Wasilisha pull request

---

**Unahitaji Msaada?** Jiunge na jamii ya [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) kwa msaada na maswali.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutowajibika:

Nyaraka hii imefasiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokamilika. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo rasmi. Kwa habari muhimu, tunapendekeza kutumia tafsiri ya kitaalamu iliyofanywa na mtafsiri wa kibinadamu. Hatutowajibiki kwa uelewa usio sahihi au tafsiri potofu zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->