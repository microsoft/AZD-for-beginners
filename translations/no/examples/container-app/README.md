# Container App Distribusjonseksempler med AZD

Denne katalogen inneholder omfattende eksempler på distribusjon av containeriserte applikasjoner til Azure Container Apps ved bruk av Azure Developer CLI (AZD). Disse eksemplene viser virkelige mønstre, beste praksis og produksjonsklare konfigurasjoner.

## 📚 Innholdsfortegnelse

- [Oversikt](#oversikt)
- [Forutsetninger](#forutsetninger)
- [Raske start-eksempler](#raske-start-eksempler)
- [Produksjonseksempler](#produksjonseksempler)
- [Avanserte Mønstre](#avanserte-mønstre)
- [Beste Praksis](#beste-praksis)

## Oversikt

Azure Container Apps er en fullstendig administrert serverløs containerplattform som gjør det mulig å kjøre mikrotjenester og containeriserte applikasjoner uten å administrere infrastruktur. Kombinert med AZD får du:

- **Forenklet Distribusjon**: Ett enkelt kommando deployer containere med infrastruktur
- **Automatisk Skalering**: Skaler til null og ut fra HTTP-trafikk eller hendelser
- **Integrert Nettverk**: Innebygd serviceregistrering og trafikkdeling
- **Administrert Identitet**: Sikker autentisering mot Azure-ressurser
- **Kostnadsoptimalisering**: Betal kun for ressursene du bruker

## Forutsetninger

Før du begynner, sørg for at du har:

```bash
# Sjekk AZD-installasjon
azd version

# Sjekk Azure CLI
az version

# Sjekk Docker (for å bygge tilpassede bilder)
docker --version

# Logg inn i Azure
azd auth login
az login
```

**Påkrevde Azure-ressurser:**
- Aktiv Azure-abonnement
- Tillatelser til å opprette ressursgrupper
- Tilgang til Container Apps-miljø

## Raske start-eksempler

### 1. Enkel Web API (Python Flask)

Distribuer et grunnleggende REST API med Azure Container Apps.

**Eksempel: Python Flask API**

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

**Distribusjonstrinn:**

```bash
# Initialiser fra mal
azd init --template todo-python-mongo

# Tilrettelegg infrastruktur og distribuer
azd up

# Test distribusjonen
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Nøkkelfunksjoner:**
- Autoskalering fra 0 til 10 replikaer
- Helseprobe og livstidsjekk
- Miljøvariabelinjeksjon
- Integrasjon med Application Insights

### 2. Node.js Express API

Distribuer en Node.js backend med MongoDB-integrasjon.

```bash
# Initialiserer Node.js API-mal
azd init --template todo-nodejs-mongo

# Konfigurer miljøvariabler
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Distribuer
azd up

# Se logger via Azure Monitor
azd monitor --logs
```

**Infrastrukturhøydepunkter:**
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

### 3. Statisk Frontend + API Backend

Distribuer en fullstack-applikasjon med React frontend og API backend.

```bash
# Initialiser full-stack-mal
azd init --template todo-csharp-sql-swa-func

# Gå gjennom konfigurasjonen
cat azure.yaml

# Distribuer begge tjenester
azd up

# Åpne applikasjonen
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Produksjonseksempler

### Eksempel 1: Mikrotjenestearkitektur

**Scenario**: E-handelsapplikasjon med flere mikrotjenester

**Katalogstruktur:**
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

**azure.yaml-konfigurasjon:**
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

**Distribusjon:**
```bash
# Initialiser prosjekt
azd init

# Sett produksjonsmiljø
azd env new production

# Konfigurer produksjonsinnstillinger
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Distribuer alle tjenester
azd up

# Overvåk distribusjon
azd monitor --overview
```

### Eksempel 2: AI-drevet Container App

**Scenario**: AI-chatapplikasjon med Microsoft Foundry Models integrasjon

**Fil: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Bruk styrt identitet for sikker tilgang
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Hent OpenAI-nøkkel fra Key Vault
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

**Fil: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Fil: infra/main.bicep**
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

**Distribusjonskommandoer:**
```bash
# Sett opp miljø
azd init --template ai-chat-app
azd env new dev

# Konfigurer OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Distribuer
azd up

# Test API-en
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Eksempel 3: Bakgrunnsarbetere med købehandling

**Scenario**: Ordrebehandlingssystem med meldingskø

**Katalogstruktur:**
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

**Fil: src/worker/processor.py**
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
            # Behandle ordre
            print(f"Processing order: {message.content}")
            
            # Fullfør melding
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Fil: azure.yaml**
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

**Distribusjon:**
```bash
# Initialiser
azd init

# Distribuer med køkonfigurasjon
azd up

# Skaler arbeider basert på kølengde
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Avanserte Mønstre

### Mønster 1: Blue-Green Distribusjon

```bash
# Opprett ny revisjon uten trafikk
azd deploy api --revision-suffix blue --no-traffic

# Test den nye revisjonen
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Del trafikk (20 % til blå, 80 % til nåværende)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Full overføring til blå
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Mønster 2: Canary Distribusjon med AZD

**Fil: .azure/dev/config.json**
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

**Distribusjonsskript:**
```bash
#!/bin/bash
# deploy-canary.sh

# Distribuer ny revisjon med 10 % trafikk
azd deploy api --revision-mode multiple

# Overvåk måledata
azd monitor --service api --duration 5m

# Øk trafikken gradvis
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Vent i 5 minutter
done
```

### Mønster 3: Multi-Region Distribusjon

**Fil: azure.yaml**
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

**Fil: infra/multi-region.bicep**
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

**Distribusjon:**
```bash
# Distribuer til alle regioner
azd up

# Bekreft endepunkter
azd show --output json | jq '.services.api.endpoints'
```

### Mønster 4: Dapr Integrasjon

**Fil: infra/app/dapr-enabled.bicep**
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

**Applikasjonskode med Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Lagre tilstand
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Publiser hendelse
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Beste Praksis

### 1. Ressursorganisering

```bash
# Bruk konsekvente navnekonvensjoner
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Merk ressurser for kostnadssporing
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Sikkerhetsbeste praksis

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

### 3. Ytelsesoptimalisering

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

### 4. Overvåkning og observabilitet

```bash
# Aktiver Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Se logger i sanntid
azd monitor --logs
# Eller bruk Azure CLI for Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Overvåk metrikker
azd monitor --live

# Opprett varsler
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Kostnadsoptimalisering

```bash
# Skaler til null når det ikke er i bruk
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Bruk spot-forekomster for utviklingsmiljøer
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Sett opp budsjettvarsler
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD-integrasjon

**GitHub Actions-eksempel:**
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

## Vanlige kommandoer Referanse

```bash
# Initialiser nytt container app-prosjekt
azd init --template <template-name>

# Distribuer infrastruktur og applikasjon
azd up

# Distribuer bare applikasjonskode (hopp over infrastruktur)
azd deploy

# Tilrettelegg bare infrastruktur
azd provision

# Vis distribuerte ressurser
azd show

# Strøm logger ved hjelp av azd monitor eller Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Overvåk applikasjon
azd monitor --overview

# Rydd opp ressurser
azd down --force --purge
```

## Feilsøking

### Problem: Container starter ikke

```bash
# Sjekk logger ved bruk av Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Vis beholderhendelser
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Test lokalt
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problem: Kan ikke få tilgang til containerapp-endepunkt

```bash
# Verifiser inngangsoppsett
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Sjekk om intern inngang er aktivert
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problem: Ytelsesproblemer

```bash
# Sjekk ressursutnyttelse
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Skaler opp ressurser
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Ytterligere ressurser og eksempler
- [Mikrotjenester Eksempel](./microservices/README.md)
- [Enkel Flask API Eksempel](./simple-flask-api/README.md)
- [Azure Container Apps Dokumentasjon](https://learn.microsoft.com/azure/container-apps/)
- [AZD Malgalleri](https://azure.github.io/awesome-azd/)
- [Container Apps Eksempler](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Maler](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Bidra

For å bidra med nye container app-eksempler:

1. Opprett en ny undermappe med ditt eksempel
2. Inkluder komplette `azure.yaml`, `infra/` og `src/` filer
3. Legg til en omfattende README med distribusjonsinstruksjoner
4. Test distribusjon med `azd up`
5. Send en pull request

---

**Trenger du hjelp?** Bli med i [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) fellesskapet for støtte og spørsmål.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->