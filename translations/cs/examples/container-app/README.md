# Příklady nasazení Container App s AZD

Tento adresář obsahuje komplexní příklady nasazení kontejnerizovaných aplikací do Azure Container Apps pomocí Azure Developer CLI (AZD). Tyto příklady demonstrují reálné vzory, osvědčené postupy a konfigurace připravené pro produkci.

## 📚 Obsah

- [Přehled](../../../../examples/container-app)
- [Požadavky](../../../../examples/container-app)
- [Rychlé začátky](../../../../examples/container-app)
- [Příklady pro produkci](../../../../examples/container-app)
- [Pokročilé vzory](../../../../examples/container-app)
- [Nejlepší postupy](../../../../examples/container-app)

## Overview

Azure Container Apps je plně spravovaná serverless platforma pro kontejnery, která vám umožňuje provozovat mikroslužby a kontejnerizované aplikace bez správy infrastruktury. V kombinaci s AZD získáte:

- **Zjednodušené nasazení**: Jediný příkaz nasadí kontejnery i infrastrukturu
- **Automatické škálování**: Škálování na nulu a škálování podle HTTP provozu nebo událostí
- **Integrované síťování**: Vestavěné zjišťování služeb a rozdělování provozu
- **Spravovaná identita**: Bezpečné ověřování k Azure zdrojům
- **Optimalizace nákladů**: Platíte pouze za zdroje, které používáte

## Prerequisites

Než začnete, ujistěte se, že máte:

```bash
# Zkontrolujte instalaci AZD
azd version

# Zkontrolujte Azure CLI
az version

# Zkontrolujte Docker (pro vytváření vlastních obrazů)
docker --version

# Přihlaste se do Azure
azd auth login
az login
```

**Požadované Azure prostředky:**
- Aktivní předplatné Azure
- Oprávnění k vytváření skupin prostředků
- Přístup k prostředí Container Apps

## Quick Start Examples

### 1. Jednoduché Web API (Python Flask)

Nasazení základního REST API do Azure Container Apps.

**Příklad: Python Flask API**

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

**Kroky nasazení:**

```bash
# Inicializovat z šablony
azd init --template todo-python-mongo

# Zajistit infrastrukturu a nasadit
azd up

# Otestovat nasazení
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Hlavní funkce:**
- Automatické škálování od 0 do 10 replik
- Kontroly stavu a kontroly životaschopnosti
- Vkládání proměnných prostředí
- Integrace s Application Insights

### 2. Node.js Express API

Nasazení backendu v Node.js s integrací MongoDB.

```bash
# Inicializovat šablonu Node.js API
azd init --template todo-nodejs-mongo

# Konfigurovat proměnné prostředí
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Nasadit
azd up

# Zobrazit protokoly pomocí Azure Monitoru
azd monitor --logs
```

**Hlavní prvky infrastruktury:**
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

### 3. Statický frontend + API backend

Nasazení full-stack aplikace s React frontendem a API backendem.

```bash
# Inicializovat šablonu full-stack
azd init --template todo-csharp-sql-swa-func

# Zkontrolovat konfiguraci
cat azure.yaml

# Nasadit obě služby
azd up

# Otevřít aplikaci
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Příklad 1: Mikroslužbová architektura

**Scénář**: E‑commerce aplikace s více mikroslužbami

**Struktura adresářů:**
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

**Konfigurace azure.yaml:**
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

**Nasazení:**
```bash
# Inicializovat projekt
azd init

# Nastavit produkční prostředí
azd env new production

# Konfigurovat produkční nastavení
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Nasadit všechny služby
azd up

# Monitorovat nasazení
azd monitor --overview
```

### Příklad 2: AI‑řízená Container App

**Scénář**: AI chat aplikace s integrací Azure OpenAI

**Soubor: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Použijte spravovanou identitu pro zabezpečený přístup
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Získejte klíč OpenAI z Key Vaultu
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

**Soubor: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Soubor: infra/main.bicep**
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

**Příkazy pro nasazení:**
```bash
# Nastavit prostředí
azd init --template ai-chat-app
azd env new dev

# Nakonfigurovat OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Nasadit
azd up

# Otestovat API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Příklad 3: Pracovník na pozadí se zpracováním fronty

**Scénář**: Systém zpracování objednávek s frontou zpráv

**Struktura adresářů:**
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

**Soubor: src/worker/processor.py**
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
            # Zpracovat objednávku
            print(f"Processing order: {message.content}")
            
            # Kompletní zpráva
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Soubor: azure.yaml**
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

**Nasazení:**
```bash
# Inicializovat
azd init

# Nasadit s konfigurací fronty
azd up

# Škálovat pracovníka podle délky fronty
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### Vzor 1: Blue-Green nasazení

```bash
# Vytvořit novou revizi bez provozu
azd deploy api --revision-suffix blue --no-traffic

# Otestovat novou revizi
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Rozdělit provoz (20 % na modrou revizi, 80 % na současnou revizi)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Úplné přepnutí na modrou
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Vzor 2: Canary nasazení s AZD

**Soubor: .azure/dev/config.json**
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

**Nasazovací skript:**
```bash
#!/bin/bash
# deploy-canary.sh

# Nasadit novou revizi s 10% provozu
azd deploy api --revision-mode multiple

# Sledovat metriky
azd monitor --service api --duration 5m

# Postupně zvyšovat provoz
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Počkat 5 minut
done
```

### Vzor 3: Víceregionální nasazení

**Soubor: azure.yaml**
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

**Soubor: infra/multi-region.bicep**
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

**Nasazení:**
```bash
# Nasadit do všech regionů
azd up

# Ověřit koncové body
azd show --output json | jq '.services.api.endpoints'
```

### Vzor 4: Integrace Dapr

**Soubor: infra/app/dapr-enabled.bicep**
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

**Kód aplikace s Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Uložit stav
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Publikovat událost
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Best Practices

### 1. Organizace zdrojů

```bash
# Používejte konzistentní pojmenovací konvence
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Označujte zdroje pro sledování nákladů
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Nejlepší bezpečnostní postupy

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

### 3. Optimalizace výkonu

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

### 4. Monitorování a observabilita

```bash
# Povolit Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Zobrazit protokoly v reálném čase
azd monitor --logs
# Nebo použijte Azure CLI pro Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Sledovat metriky
azd monitor --live

# Vytvořit upozornění
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Optimalizace nákladů

```bash
# Škálovat na nulu, když se nepoužívá
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Používat spot instance pro vývojová prostředí
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Nastavit rozpočtová upozornění
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Integrace CI/CD

**Příklad GitHub Actions:**
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

## Reference běžných příkazů

```bash
# Inicializovat nový projekt kontejnerové aplikace
azd init --template <template-name>

# Nasadit infrastrukturu a aplikaci
azd up

# Nasadit pouze kód aplikace (vynechat infrastrukturu)
azd deploy

# Zajistit pouze infrastrukturu
azd provision

# Zobrazit nasazené prostředky
azd show

# Sledovat protokoly pomocí azd monitoru nebo Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Monitorovat aplikaci
azd monitor --overview

# Vyčistit prostředky
azd down --force --purge
```

## Řešení problémů

### Problém: Kontejner se nespustí

```bash
# Zkontrolovat protokoly pomocí Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Zobrazit události kontejneru
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Otestovat lokálně
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problém: Nelze přistoupit k endpointu kontejnerové aplikace

```bash
# Ověřte konfiguraci ingressu
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Zkontrolujte, zda je interní ingress povolen
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problém: Problémy s výkonem

```bash
# Zkontrolujte využití zdrojů
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Zvyšte zdroje
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Další zdroje a příklady
- [Příklad mikroslužeb](./microservices/README.md)
- [Příklad jednoduchého Flask API](./simple-flask-api/README.md)
- [Dokumentace Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galerie šablon AZD](https://azure.github.io/awesome-azd/)
- [Ukázky Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Šablony Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Přispívání

Chcete-li přispět novými příklady kontejnerových aplikací:

1. Vytvořte nový podsložku s vaším příkladem
2. Zahrňte kompletní `azure.yaml`, `infra/` a `src/` soubory
3. Přidejte obsáhlý README s instrukcemi nasazení
4. Otestujte nasazení pomocí `azd up`
5. Odešlete pull request

---

**Potřebujete pomoc?** Přidejte se do komunity [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) pro podporu a dotazy.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro zásadní informace doporučujeme využít profesionální lidský překlad. Nepřebíráme odpovědnost za jakákoli nedorozumění nebo chybné výklady vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->