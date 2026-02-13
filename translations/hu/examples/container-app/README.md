# Konténeralkalmazás telepítési példák AZD-vel

Ez a könyvtár átfogó példákat tartalmaz konténerizált alkalmazások Azure Container Apps-be történő telepítésére az Azure Developer CLI (AZD) használatával. Ezek a példák valós mintákat, bevált gyakorlatokat és éles üzemre kész konfigurációkat mutatnak be.

## 📚 Tartalomjegyzék

- [Áttekintés](../../../../examples/container-app)
- [Előfeltételek](../../../../examples/container-app)
- [Gyors indítási példák](../../../../examples/container-app)
- [Éles példák](../../../../examples/container-app)
- [Fejlett minták](../../../../examples/container-app)
- [Bevált gyakorlatok](../../../../examples/container-app)

## Áttekintés

Az Azure Container Apps egy teljesen felügyelt szerver nélküli konténerplatform, amely lehetővé teszi mikroszolgáltatások és konténerizált alkalmazások futtatását infrastruktúra kezelése nélkül. Az AZD-vel kombinálva a következőket kapja:

- **Egyszerűsített telepítés**: Egy parancs konténerek telepítésére és az infrastruktúrára
- **Automatikus skálázás**: Nulla példánytól skálázás HTTP-forgalom vagy események alapján
- **Integrált hálózatkezelés**: Beépített szolgáltatásfelfedezés és forgalommenedzsment
- **Felügyelt azonosítás**: Biztonságos hitelesítés Azure-erőforrásokhoz
- **Költségoptimalizálás**: Csak a használt erőforrásokért fizet

## Előfeltételek

A kezdés előtt győződjön meg róla, hogy rendelkezik:

```bash
# Ellenőrizze az AZD telepítését
azd version

# Ellenőrizze az Azure CLI-t
az version

# Ellenőrizze a Dockert (egyéni képek készítéséhez)
docker --version

# Jelentkezzen be az Azure-ba
azd auth login
az login
```

**Szükséges Azure-erőforrások:**
- Aktív Azure-előfizetés
- Jogosultság erőforráscsoport létrehozására
- Hozzáférés a Container Apps környezethez

## Gyors indítási példák

### 1. Egyszerű Web API (Python Flask)

Alap REST API telepítése Azure Container Apps-be.

**Példa: Python Flask API**

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

**Telepítési lépések:**

```bash
# Inicializálás sablonból
azd init --template todo-python-mongo

# Infrastruktúra előkészítése és telepítés
azd up

# A telepítés tesztelése
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Főbb jellemzők:**
- Automatikus skálázás 0-tól 10 példányig
- Egészségügyi vizsgálatok és élőszolgáltatás-ellenőrzés
- Környezeti változó beadagolás
- Application Insights integráció

### 2. Node.js Express API

Node.js háttérrendszer telepítése MongoDB integrációval.

```bash
# Node.js API sablon inicializálása
azd init --template todo-nodejs-mongo

# Környezeti változók konfigurálása
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Telepítés
azd up

# Naplók megtekintése az Azure Monitoron keresztül
azd monitor --logs
```

**Infrastruktúra kiemelések:**
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

### 3. Statikus frontend + API backend

Teljes stack-es alkalmazás telepítése React frontenddel és API backenddel.

```bash
# Teljes körű sablon inicializálása
azd init --template todo-csharp-sql-swa-func

# Konfiguráció áttekintése
cat azure.yaml

# Mindkét szolgáltatás telepítése
azd up

# Alkalmazás megnyitása
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Éles példák

### Példa 1: Mikroszolgáltatás architektúra

**Forgatókönyv**: Több mikroszolgáltatásos e-kereskedelmi alkalmazás

**Könyvtár struktúra:**
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

**azure.yaml konfiguráció:**
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

**Telepítés:**
```bash
# Projekt inicializálása
azd init

# Gyártási környezet beállítása
azd env new production

# Gyártási beállítások konfigurálása
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Összes szolgáltatás telepítése
azd up

# Telepítés figyelése
azd monitor --overview
```

### Példa 2: Mesterséges intelligencián alapuló konténeralkalmazás

**Forgatókönyv**: AI-chat alkalmazás Azure OpenAI integrációval

**Fájl: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Használjon kezelői identitást a biztonságos hozzáféréshez
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Szerezze be az OpenAI kulcsot a Key Vaultból
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

**Fájl: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Fájl: infra/main.bicep**
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

**Telepítési parancsok:**
```bash
# Környezet beállítása
azd init --template ai-chat-app
azd env new dev

# OpenAI konfigurálása
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Telepítés
azd up

# API tesztelése
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Példa 3: Háttérmunkás üzenetsor feldolgozással

**Forgatókönyv**: Rendelésfeldolgozó rendszer üzenetsorral

**Könyvtár struktúra:**
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

**Fájl: src/worker/processor.py**
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
            # Feldolgozás sorrendje
            print(f"Processing order: {message.content}")
            
            # Teljes üzenet
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Fájl: azure.yaml**
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

**Telepítés:**
```bash
# Inicializálás
azd init

# Kiszolgálói telepítés a sor konfigurációval
azd up

# A munkás skálázása a sor hosszának megfelelően
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Fejlett minták

### Minta 1: Blue-Green telepítés

```bash
# Új verzió létrehozása forgalom nélkül
azd deploy api --revision-suffix blue --no-traffic

# Az új verzió tesztelése
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Forgalom megosztása (20% kékhez, 80% jelenlegihez)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Teljes átállás kékre
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Minta 2: Canary telepítés AZD-vel

**Fájl: .azure/dev/config.json**
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

**Telepítési szkript:**
```bash
#!/bin/bash
# deploy-canary.sh

# Új verzió telepítése 10% forgalommal
azd deploy api --revision-mode multiple

# Mérőszámok figyelése
azd monitor --service api --duration 5m

# Forgalom fokozatos növelése
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Várakozás 5 percig
done
```

### Minta 3: Több régiós telepítés

**Fájl: azure.yaml**
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

**Fájl: infra/multi-region.bicep**
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

**Telepítés:**
```bash
# Telepítés minden régióba
azd up

# Végpontok ellenőrzése
azd show --output json | jq '.services.api.endpoints'
```

### Minta 4: Dapr integráció

**Fájl: infra/app/dapr-enabled.bicep**
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

**Alkalmazáskód Dapr-ral:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Állapot mentése
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Esemény közzététele
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Bevált gyakorlatok

### 1. Erőforrások szervezése

```bash
# Használjon következetes elnevezési konvenciókat
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Címkézze meg az erőforrásokat a költségkövetéshez
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Biztonsági bevált gyakorlatok

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

### 3. Teljesítmény optimalizálás

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

### 4. Felügyelet és megfigyelhetőség

```bash
# Alkalmazás Insights engedélyezése
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Naplók valós időben történő megtekintése
azd monitor --logs
# Vagy használja az Azure CLI-t Container Apps-hez:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Mérés figyelése
azd monitor --live

# Értesítések létrehozása
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Költségoptimalizálás

```bash
# Amikor nem használja, állítsa nullára a skálát
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Használjon spot példányokat fejlesztői környezetekhez
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Állítson be költségvetési riasztásokat
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD integráció

**GitHub Actions példa:**
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

## Gyakori parancsok hivatkozása

```bash
# Új konténeralkalmazás projekt inicializálása
azd init --template <template-name>

# Infrastruktúra és alkalmazás telepítése
azd up

# Csak az alkalmazáskód telepítése (infrastruktúra kihagyása)
azd deploy

# Csak az infrastruktúra előkészítése
azd provision

# Telepített erőforrások megtekintése
azd show

# Naplók streamelése az azd monitor vagy az Azure CLI segítségével
azd monitor --logs
# az containerapp logs show --name <szolgáltatás-név> --resource-group <erőforráscsoport-név> --follow

# Alkalmazás figyelése
azd monitor --overview

# Erőforrások tisztítása
azd down --force --purge
```

## Hibakeresés

### Probléma: A konténer nem indul el

```bash
# Naplók ellenőrzése Azure CLI használatával
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Konténer események megtekintése
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Helyi tesztelés
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Probléma: Nem lehet elérni a konténeralkalmazás végpontját

```bash
# Ellenőrizze a bejövő konfigurációt
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Ellenőrizze, hogy az belső ingress engedélyezve van-e
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Probléma: Teljesítményproblémák

```bash
# Erőforrás-használat ellenőrzése
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Erőforrások felskálázása
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## További források és példák
- [Mikroszolgáltatások példa](./microservices/README.md)
- [Egyszerű Flask API példa](./simple-flask-api/README.md)
- [Azure Container Apps dokumentáció](https://learn.microsoft.com/azure/container-apps/)
- [AZD sablonok galéria](https://azure.github.io/awesome-azd/)
- [Container Apps minták](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep sablonok](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Közreműködés

Új konténeralkalmazás példák beküldéséhez:

1. Hozzon létre egy új alkönyvtárat a példájával
2. Tartalmazza a teljes `azure.yaml`, `infra/` és `src/` fájlokat
3. Adjon hozzá átfogó README-t telepítési utasításokkal
4. Tesztelje a telepítést `azd up` parancsal
5. Küldjön be egy pull requestet

---

**Segítségre van szüksége?** Csatlakozzon a [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) közösséghez támogatásért és kérdésekért.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:  
Ezt a dokumentumot az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk le. Bár igyekszünk pontosak lenni, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális, emberi fordítást ajánlunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->