# Príklady nasadenia Container App pomocou AZD

Tento adresár obsahuje komplexné príklady nasadenia kontajnerových aplikácií do Azure Container Apps pomocou Azure Developer CLI (AZD). Tieto príklady demonštrujú reálne vzory, osvedčené postupy a konfigurácie pripravené do produkcie.

## 📚 Obsah

- [Prehľad](#overview)
- [Požiadavky](#prerequisites)
- [Rýchle spustenie](#quick-start-examples)
- [Produkčné príklady](#production-examples)
- [Pokročilé vzory](#pokročilé-vzory)
- [Osvedčené postupy](#osvedčené-postupy)

## Overview

Azure Container Apps je plne spravovaná serverless platforma pre kontajnery, ktorá vám umožňuje spúšťať mikroservisy a kontajnerové aplikácie bez správy infraštruktúry. V kombinácii s AZD získate:

- **Zjednodušené nasadenie**: Jedným príkazom nasadíte kontajnery s infraštruktúrou
- **Automatické škálovanie**: Škálovanie na nulu a rozširovanie podľa HTTP prevádzky alebo udalostí
- **Integrované sieťovanie**: Vstavané zisťovanie služieb a rozdeľovanie prevádzky
- **Spravovaná identita**: Bezpečné overovanie k Azure zdrojom
- **Optimalizácia nákladov**: Platíte iba za zdroje, ktoré používate

## Prerequisites

Pred začatím sa uistite, že máte:

```bash
# Skontrolujte inštaláciu AZD
azd version

# Skontrolujte Azure CLI
az version

# Skontrolujte Docker (na zostavovanie vlastných obrazov)
docker --version

# Prihláste sa do Azure
azd auth login
az login
```

**Požadované Azure zdroje:**
- Aktívne predplatné Azure
- Povolenia na vytváranie skupín prostriedkov
- Prístup k prostrediu Container Apps

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Nasadiť základné REST API do Azure Container Apps.

**Príklad: Python Flask API**

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

**Kroky nasadenia:**

```bash
# Inicializovať z šablóny
azd init --template todo-python-mongo

# Zabezpečiť infraštruktúru a nasadiť
azd up

# Otestovať nasadenie
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Kľúčové vlastnosti:**
- Automatické škálovanie od 0 do 10 inštancií
- Kontroly zdravia a kontroly živosti
- Vkladanie premenných prostredia
- Integrácia s Application Insights

### 2. Node.js Express API

Nasadiť backend v Node.js s integráciou MongoDB.

```bash
# Inicializovať šablónu Node.js API
azd init --template todo-nodejs-mongo

# Nastaviť premenné prostredia
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Nasadiť
azd up

# Zobraziť denníky cez Azure Monitor
azd monitor --logs
```

**Hlavné prvky infraštruktúry:**
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

Nasadiť full-stack aplikáciu s React frontendom a API backendom.

```bash
# Inicializovať full-stack šablónu
azd init --template todo-csharp-sql-swa-func

# Skontrolovať konfiguráciu
cat azure.yaml

# Nasadiť obe služby
azd up

# Otvoriť aplikáciu
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Príklad 1: Mikroservisná architektúra

**Scenár**: E-commerce aplikácia s viacerými mikroservismi

**Adresárová štruktúra:**
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

**Konfigurácia azure.yaml:**
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

**Nasadenie:**
```bash
# Inicializovať projekt
azd init

# Nastaviť produkčné prostredie
azd env new production

# Konfigurovať produkčné nastavenia
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Nasadiť všetky služby
azd up

# Monitorovať nasadenie
azd monitor --overview
```

### Príklad 2: Container App poháňaný AI

**Scenár**: AI chat aplikácia s integráciou Microsoft Foundry Models

**Súbor: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Použite spravovanú identitu na zabezpečený prístup
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Získajte kľúč OpenAI z Key Vaultu
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

**Súbor: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Súbor: infra/main.bicep**
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

**Príkazy na nasadenie:**
```bash
# Nastaviť prostredie
azd init --template ai-chat-app
azd env new dev

# Konfigurovať OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Nasadiť
azd up

# Otestovať API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Príklad 3: Pozadový worker so spracovaním fronty

**Scenár**: Systém spracovania objednávok s frontou správ

**Adresárová štruktúra:**
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

**Súbor: src/worker/processor.py**
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
            # Spracovať objednávku
            print(f"Processing order: {message.content}")
            
            # Dokončiť správu
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Súbor: azure.yaml**
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

**Nasadenie:**
```bash
# Inicializovať
azd init

# Nasadiť s konfiguráciou fronty
azd up

# Škálovať pracovníka podľa dĺžky fronty
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Pokročilé vzory

### Vzor 1: Blue-Green nasadenie

```bash
# Vytvorte novú revíziu bez priradenej prevádzky
azd deploy api --revision-suffix blue --no-traffic

# Otestujte novú revíziu
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Rozdeľte prevádzku (20 % na blue, 80 % na aktuálnu)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Prepnite úplne na blue
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Vzor 2: Canary nasadenie s AZD

**Súbor: .azure/dev/config.json**
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

**Skript nasadenia:**
```bash
#!/bin/bash
# deploy-canary.sh

# Nasadiť novú revíziu s 10% prevádzky
azd deploy api --revision-mode multiple

# Monitorovať metriky
azd monitor --service api --duration 5m

# Postupne zvyšovať prevádzku
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Počkať 5 minút
done
```

### Vzor 3: Nasadenie do viacerých regiónov

**Súbor: azure.yaml**
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

**Súbor: infra/multi-region.bicep**
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

**Nasadenie:**
```bash
# Nasadiť do všetkých regiónov
azd up

# Overiť koncové body
azd show --output json | jq '.services.api.endpoints'
```

### Vzor 4: Integrácia s Dapr

**Súbor: infra/app/dapr-enabled.bicep**
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

**Kód aplikácie s Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Uložiť stav
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Publikovať udalosť
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Osvedčené postupy

### 1. Organizácia zdrojov

```bash
# Používajte konzistentné pomenovacie konvencie
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Označujte zdroje pre sledovanie nákladov
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Bezpečnostné osvedčené postupy

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

### 3. Optimalizácia výkonu

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

### 4. Monitorovanie a observabilita

```bash
# Povoliť Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Zobraziť denníky v reálnom čase
azd monitor --logs
# Alebo použite Azure CLI pre Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Sledovať metriky
azd monitor --live

# Vytvoriť upozornenia
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Optimalizácia nákladov

```bash
# Škálujte na nulu, keď sa nepoužíva
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Použite spotové inštancie pre vývojové prostredia
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Nastavte rozpočtové upozornenia
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Integrácia CI/CD

**Príklad GitHub Actions:**
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

## Referencia bežných príkazov

```bash
# Inicializovať nový projekt aplikácie v kontajneri
azd init --template <template-name>

# Nasadiť infraštruktúru a aplikáciu
azd up

# Nasadiť iba kód aplikácie (preskočiť infraštruktúru)
azd deploy

# Zabezpečiť len infraštruktúru
azd provision

# Zobraziť nasadené zdroje
azd show

# Sledovať logy pomocou azd monitor alebo Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Monitorovať aplikáciu
azd monitor --overview

# Vyčistiť zdroje
azd down --force --purge
```

## Riešenie problémov

### Problém: Kontajner sa nespustí

```bash
# Skontrolujte logy pomocou Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Zobrazte udalosti kontajnera
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Otestujte lokálne
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problém: Nie je možné pristúpiť k endpointu Container App

```bash
# Overiť konfiguráciu ingressu
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Skontrolovať, či je interný ingress povolený
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problém: Výkonové problémy

```bash
# Skontrolujte využitie zdrojov
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Navýšte zdroje
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Ďalšie zdroje a príklady
- [Príklad mikroservisov](./microservices/README.md)
- [Jednoduchý Flask API príklad](./simple-flask-api/README.md)
- [Dokumentácia Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galéria šablón AZD](https://azure.github.io/awesome-azd/)
- [Ukážky Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Šablóny Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Prispievanie

Ak chcete prispieť novými príkladmi kontajnerových aplikácií:

1. Vytvorte nový podadresár s vaším príkladom
2. Zahrňte kompletné súbory `azure.yaml`, `infra/` a `src/`
3. Pridajte podrobný README s inštrukciami na nasadenie
4. Otestujte nasadenie pomocou `azd up`
5. Odošlite pull request

---

**Potrebujete pomoc?** Pridajte sa do komunity [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) pre podporu a otázky.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o vylúčení zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, vezmite prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by sa mal považovať za autoritatívny zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo mylné interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->