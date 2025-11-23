<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-23T12:01:21+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "hu"
}
-->
# Konténeres alkalmazások telepítési példái AZD-vel

Ez a könyvtár átfogó példákat tartalmaz konténeres alkalmazások Azure Container Apps-be történő telepítésére az Azure Developer CLI (AZD) használatával. A példák valós életből vett mintákat, legjobb gyakorlatokat és gyártásra kész konfigurációkat mutatnak be.

## 📚 Tartalomjegyzék

- [Áttekintés](../../../../examples/container-app)
- [Előfeltételek](../../../../examples/container-app)
- [Gyors kezdési példák](../../../../examples/container-app)
- [Gyártási példák](../../../../examples/container-app)
- [Haladó minták](../../../../examples/container-app)
- [Legjobb gyakorlatok](../../../../examples/container-app)

## Áttekintés

Az Azure Container Apps egy teljesen menedzselt szerver nélküli konténerplatform, amely lehetővé teszi mikro-szolgáltatások és konténeres alkalmazások futtatását infrastruktúra kezelés nélkül. AZD-vel kombinálva a következőket kapja:

- **Egyszerűsített telepítés**: Egyetlen parancs telepíti a konténereket az infrastruktúrával együtt
- **Automatikus skálázás**: Skálázás nullára vagy felfelé HTTP forgalom vagy események alapján
- **Integrált hálózatkezelés**: Beépített szolgáltatásfelfedezés és forgalomelosztás
- **Menedzselt identitás**: Biztonságos hitelesítés Azure erőforrásokhoz
- **Költségoptimalizálás**: Csak az igénybe vett erőforrásokért fizet

## Előfeltételek

Mielőtt elkezdené, győződjön meg róla, hogy rendelkezik:

```bash
# Ellenőrizze az AZD telepítést
azd version

# Ellenőrizze az Azure CLI-t
az version

# Ellenőrizze a Dockert (egyedi képek készítéséhez)
docker --version

# Jelentkezzen be az Azure-ba
azd auth login
az login
```

**Szükséges Azure erőforrások:**
- Aktív Azure előfizetés
- Erőforráscsoport létrehozási jogosultságok
- Hozzáférés Container Apps környezethez

## Gyors kezdési példák

### 1. Egyszerű Web API (Python Flask)

Telepítsen egy alapvető REST API-t az Azure Container Apps segítségével.

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

# Infrastruktúra biztosítása és telepítés
azd up

# A telepítés tesztelése
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Főbb jellemzők:**
- Automatikus skálázás 0-tól 10 replikáig
- Egészségügyi ellenőrzések és életképességi vizsgálatok
- Környezeti változók injektálása
- Application Insights integráció

### 2. Node.js Express API

Telepítsen egy Node.js backendet MongoDB integrációval.

```bash
# Inicializálja a Node.js API sablont
azd init --template todo-nodejs-mongo

# Konfigurálja a környezeti változókat
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Telepítés
azd up

# Naplók megtekintése
azd logs api
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

Telepítsen egy teljes stack alkalmazást React frontenddel és API backenddel.

```bash
# Teljes stack sablon inicializálása
azd init --template todo-csharp-sql-swa-func

# Konfiguráció áttekintése
cat azure.yaml

# Mindkét szolgáltatás telepítése
azd up

# Az alkalmazás megnyitása
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Gyártási példák

### Példa 1: Mikro-szolgáltatások architektúra

**Forgatókönyv**: E-kereskedelmi alkalmazás több mikro-szolgáltatással

**Könyvtárszerkezet:**
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

# Az összes szolgáltatás telepítése
azd up

# Telepítés figyelése
azd monitor --overview
```

### Példa 2: AI-alapú konténeres alkalmazás

**Forgatókönyv**: AI chat alkalmazás Azure OpenAI integrációval

**Fájl: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Használjon kezelt identitást a biztonságos hozzáféréshez
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Szerezze meg az OpenAI kulcsot a Kulcstárból
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

# Az API tesztelése
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Példa 3: Háttérmunkás üzenetfeldolgozással

**Forgatókönyv**: Rendelésfeldolgozó rendszer üzenetsorral

**Könyvtárszerkezet:**
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
            # Rendelés feldolgozása
            print(f"Processing order: {message.content}")
            
            # Üzenet befejezése
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

# Telepítés sor konfigurációval
azd up

# Munkavállaló méretezése a sor hossza alapján
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Haladó minták

### Minta 1: Blue-Green telepítés

```bash
# Hozzon létre új verziót forgalom nélkül
azd deploy api --revision-suffix blue --no-traffic

# Tesztelje az új verziót
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Ossza meg a forgalmat (20% a kékhez, 80% a jelenlegihez)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Teljes átállás a kékre
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

# Mutatók figyelése
azd monitor --service api --duration 5m

# Forgalom fokozatos növelése
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Várjon 5 percet
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

**Alkalmazáskód Dapr-rel:**
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

## Legjobb gyakorlatok

### 1. Erőforrások szervezése

```bash
# Használjon következetes elnevezési konvenciókat
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Címkézze fel az erőforrásokat a költségek nyomon követéséhez
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Biztonsági legjobb gyakorlatok

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

### 3. Teljesítményoptimalizálás

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
# Engedélyezze az Application Insights-t
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Naplók megtekintése valós időben
azd logs api --follow

# Metrikák figyelése
azd monitor --service api

# Riasztások létrehozása
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Költségoptimalizálás

```bash
# Méretezés nullára, ha nincs használatban
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Használjon spot példányokat fejlesztési környezetekhez
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

## Gyakori parancsok referenciája

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

# Naplók streamelése
azd logs <service-name> --follow

# Alkalmazás monitorozása
azd monitor --overview

# Erőforrások törlése
azd down --force --purge
```

## Hibakeresés

### Probléma: A konténer nem indul el

```bash
# Ellenőrizze a naplókat
azd logs api --tail 100

# Tekintse meg a konténer eseményeket
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Tesztelje helyben
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Probléma: Nem lehet elérni a konténeres alkalmazás végpontját

```bash
# Ellenőrizze az ingress konfigurációt
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Ellenőrizze, hogy az internal ingress engedélyezve van-e
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Probléma: Teljesítményproblémák

```bash
# Ellenőrizze az erőforrások kihasználtságát
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Növelje az erőforrásokat
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## További források és példák
- [Mikro-szolgáltatások példa](./microservices/README.md)
- [Egyszerű Flash API példa](./simple-flask-api/README.md)
- [Azure Container Apps dokumentáció](https://learn.microsoft.com/azure/container-apps/)
- [AZD sablonok galériája](https://azure.github.io/awesome-azd/)
- [Container Apps minták](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep sablonok](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Hozzájárulás

Új konténeres alkalmazás példák hozzáadásához:

1. Hozzon létre egy új alkönyvtárat a példájával
2. Tartalmazza a teljes `azure.yaml`, `infra/` és `src/` fájlokat
3. Adjon hozzá részletes README-t telepítési utasításokkal
4. Tesztelje a telepítést az `azd up` paranccsal
5. Küldjön be egy pull requestet

---

**Segítségre van szüksége?** Csatlakozzon a [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) közösséghez támogatásért és kérdésekért.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->