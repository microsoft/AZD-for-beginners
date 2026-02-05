# Příklady nasazení kontejnerových aplikací s AZD

Tento adresář obsahuje komplexní příklady nasazení kontejnerových aplikací do Azure Container Apps pomocí Azure Developer CLI (AZD). Tyto příklady ukazují reálné vzory, osvědčené postupy a konfigurace připravené pro produkční prostředí.

## 📚 Obsah

- [Přehled](../../../../examples/container-app)
- [Předpoklady](../../../../examples/container-app)
- [Rychlé příklady](../../../../examples/container-app)
- [Produkční příklady](../../../../examples/container-app)
- [Pokročilé vzory](../../../../examples/container-app)
- [Osvědčené postupy](../../../../examples/container-app)

## Přehled

Azure Container Apps je plně spravovaná serverless platforma pro kontejnery, která vám umožňuje provozovat mikroslužby a kontejnerové aplikace bez nutnosti správy infrastruktury. V kombinaci s AZD získáte:

- **Zjednodušené nasazení**: Jediný příkaz nasadí kontejnery s infrastrukturou
- **Automatické škálování**: Škálování na nulu a škálování na základě HTTP provozu nebo událostí
- **Integrované sítě**: Vestavěné vyhledávání služeb a rozdělování provozu
- **Spravovaná identita**: Bezpečné ověřování k Azure zdrojům
- **Optimalizace nákladů**: Platíte pouze za zdroje, které využíváte

## Předpoklady

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

**Požadované Azure zdroje:**
- Aktivní Azure předplatné
- Oprávnění k vytvoření resource group
- Přístup k prostředí Container Apps

## Rychlé příklady

### 1. Jednoduché Web API (Python Flask)

Nasazení základního REST API s Azure Container Apps.

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

**Klíčové vlastnosti:**
- Automatické škálování od 0 do 10 replik
- Kontroly zdraví a živosti
- Vkládání proměnných prostředí
- Integrace Application Insights

### 2. Node.js Express API

Nasazení backendu Node.js s integrací MongoDB.

```bash
# Inicializovat šablonu API Node.js
azd init --template todo-nodejs-mongo

# Konfigurovat proměnné prostředí
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Nasadit
azd up

# Zobrazit logy
azd logs api
```

**Hlavní body infrastruktury:**
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
# Inicializovat full-stack šablonu
azd init --template todo-csharp-sql-swa-func

# Zkontrolovat konfiguraci
cat azure.yaml

# Nasadit obě služby
azd up

# Otevřít aplikaci
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Produkční příklady

### Příklad 1: Architektura mikroslužeb

**Scénář**: E-commerce aplikace s více mikroslužbami

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

# Sledovat nasazení
azd monitor --overview
```

### Příklad 2: Kontejnerová aplikace s AI

**Scénář**: AI chat aplikace s integrací Azure OpenAI

**Soubor: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Použijte spravovanou identitu pro bezpečný přístup
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Získejte klíč OpenAI z trezoru klíčů
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

**Příkazy nasazení:**
```bash
# Nastavit prostředí
azd init --template ai-chat-app
azd env new dev

# Konfigurovat OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Nasadit
azd up

# Otestovat API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Příklad 3: Background Worker s frontou zpráv

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
            
            # Dokončit zprávu
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

# Škálovat pracovníka na základě délky fronty
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Pokročilé vzory

### Vzor 1: Blue-Green nasazení

```bash
# Vytvořte novou revizi bez provozu
azd deploy api --revision-suffix blue --no-traffic

# Otestujte novou revizi
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Rozdělte provoz (20 % na modrou, 80 % na aktuální)
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

**Skript nasazení:**
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

### Vzor 3: Nasazení do více regionů

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

**Aplikační kód s Dapr:**
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

## Osvědčené postupy

### 1. Organizace zdrojů

```bash
# Používejte konzistentní konvence pojmenování
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Označte zdroje pro sledování nákladů
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Osvědčené postupy zabezpečení

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

### 4. Monitoring a sledovatelnost

```bash
# Povolit Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Zobrazit logy v reálném čase
azd logs api --follow

# Sledovat metriky
azd monitor --service api

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
# Zmenšit na nulu, když se nepoužívá
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Použijte spot instance pro vývojová prostředí
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Nastavte upozornění na rozpočet
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

## Referenční příkazy

```bash
# Inicializovat nový projekt kontejnerové aplikace
azd init --template <template-name>

# Nasadit infrastrukturu a aplikaci
azd up

# Nasadit pouze aplikační kód (přeskočit infrastrukturu)
azd deploy

# Zajistit pouze infrastrukturu
azd provision

# Zobrazit nasazené zdroje
azd show

# Streamovat logy
azd logs <service-name> --follow

# Monitorovat aplikaci
azd monitor --overview

# Vyčistit zdroje
azd down --force --purge
```

## Řešení problémů

### Problém: Kontejner se nespustí

```bash
# Zkontrolujte logy
azd logs api --tail 100

# Zobrazte události kontejneru
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Otestujte lokálně
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problém: Nelze přistupovat k endpointu kontejnerové aplikace

```bash
# Ověřte konfiguraci ingressu
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Zkontrolujte, zda je povolen interní ingress
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

# Zvyšte kapacitu zdrojů
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Další zdroje a příklady
- [Příklad mikroslužeb](./microservices/README.md)
- [Příklad jednoduchého Flash API](./simple-flask-api/README.md)
- [Dokumentace Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galerie šablon AZD](https://azure.github.io/awesome-azd/)
- [Ukázky Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Šablony Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Přispívání

Chcete-li přispět novými příklady kontejnerových aplikací:

1. Vytvořte nový podadresář s vaším příkladem
2. Zahrňte kompletní soubory `azure.yaml`, `infra/` a `src/`
3. Přidejte podrobný README s pokyny k nasazení
4. Otestujte nasazení pomocí `azd up`
5. Odešlete pull request

---

**Potřebujete pomoc?** Připojte se ke komunitě [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) pro podporu a dotazy.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->