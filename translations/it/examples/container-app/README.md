# Esempi di Deployment di App Container con AZD

Questa directory contiene esempi completi per il deployment di applicazioni containerizzate su Azure Container Apps utilizzando Azure Developer CLI (AZD). Questi esempi mostrano modelli reali, migliori pratiche e configurazioni pronte per la produzione.

## 📚 Indice

- [Panoramica](../../../../examples/container-app)
- [Prerequisiti](../../../../examples/container-app)
- [Esempi Rapidi](../../../../examples/container-app)
- [Esempi per la Produzione](../../../../examples/container-app)
- [Modelli Avanzati](../../../../examples/container-app)
- [Migliori Pratiche](../../../../examples/container-app)

## Panoramica

Azure Container Apps è una piattaforma serverless completamente gestita che consente di eseguire microservizi e applicazioni containerizzate senza gestire l'infrastruttura. Quando combinato con AZD, offre:

- **Deployment Semplificato**: Un singolo comando per il deployment di container con infrastruttura
- **Scalabilità Automatica**: Scala a zero e scala in base al traffico HTTP o agli eventi
- **Networking Integrato**: Scoperta dei servizi e suddivisione del traffico integrati
- **Identità Gestita**: Autenticazione sicura alle risorse Azure
- **Ottimizzazione dei Costi**: Paghi solo per le risorse utilizzate

## Prerequisiti

Prima di iniziare, assicurati di avere:

```bash
# Controlla l'installazione di AZD
azd version

# Controlla Azure CLI
az version

# Controlla Docker (per creare immagini personalizzate)
docker --version

# Accedi ad Azure
azd auth login
az login
```

**Risorse Azure Necessarie:**
- Abbonamento Azure attivo
- Permessi per la creazione di gruppi di risorse
- Accesso all'ambiente Container Apps

## Esempi Rapidi

### 1. Web API Semplice (Python Flask)

Effettua il deployment di una REST API di base con Azure Container Apps.

**Esempio: Python Flask API**

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

**Passaggi per il Deployment:**

```bash
# Inizializza dal modello
azd init --template todo-python-mongo

# Fornisci l'infrastruttura e distribuisci
azd up

# Testa la distribuzione
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Caratteristiche Principali:**
- Auto-scaling da 0 a 10 repliche
- Controlli di salute e liveness
- Iniezione di variabili d'ambiente
- Integrazione con Application Insights

### 2. Node.js Express API

Effettua il deployment di un backend Node.js con integrazione MongoDB.

```bash
# Inizializza il modello API di Node.js
azd init --template todo-nodejs-mongo

# Configura le variabili d'ambiente
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Distribuisci
azd up

# Visualizza i log
azd logs api
```

**Punti Salienti dell'Infrastruttura:**
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

### 3. Frontend Statico + Backend API

Effettua il deployment di un'app full-stack con frontend React e backend API.

```bash
# Inizializza il template full-stack
azd init --template todo-csharp-sql-swa-func

# Rivedi la configurazione
cat azure.yaml

# Distribuisci entrambi i servizi
azd up

# Apri l'applicazione
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Esempi per la Produzione

### Esempio 1: Architettura Microservizi

**Scenario**: Applicazione e-commerce con più microservizi

**Struttura della Directory:**
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

**Configurazione azure.yaml:**
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

**Deployment:**
```bash
# Inizializza progetto
azd init

# Imposta ambiente di produzione
azd env new production

# Configura impostazioni di produzione
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Distribuisci tutti i servizi
azd up

# Monitora distribuzione
azd monitor --overview
```

### Esempio 2: App Container con AI

**Scenario**: Applicazione di chat AI con integrazione Azure OpenAI

**File: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Utilizzare l'identità gestita per un accesso sicuro
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Ottenere la chiave OpenAI da Key Vault
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

**File: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**File: infra/main.bicep**
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

**Comandi per il Deployment:**
```bash
# Configurare l'ambiente
azd init --template ai-chat-app
azd env new dev

# Configurare OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Distribuire
azd up

# Testare l'API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Esempio 3: Worker in Background con Elaborazione Code

**Scenario**: Sistema di elaborazione ordini con coda di messaggi

**Struttura della Directory:**
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

**File: src/worker/processor.py**
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
            # Elaborare ordine
            print(f"Processing order: {message.content}")
            
            # Completare messaggio
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**File: azure.yaml**
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

**Deployment:**
```bash
# Inizializzare
azd init

# Distribuire con configurazione della coda
azd up

# Ridimensionare il lavoratore in base alla lunghezza della coda
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Modelli Avanzati

### Modello 1: Deployment Blue-Green

```bash
# Crea una nuova revisione senza traffico
azd deploy api --revision-suffix blue --no-traffic

# Testa la nuova revisione
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Dividi il traffico (20% al blu, 80% all'attuale)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Passaggio completo al blu
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Modello 2: Deployment Canary con AZD

**File: .azure/dev/config.json**
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

**Script di Deployment:**
```bash
#!/bin/bash
# deploy-canary.sh

# Distribuisci nuova revisione con il 10% di traffico
azd deploy api --revision-mode multiple

# Monitora metriche
azd monitor --service api --duration 5m

# Aumenta il traffico gradualmente
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Aspetta 5 minuti
done
```

### Modello 3: Deployment Multi-Regione

**File: azure.yaml**
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

**File: infra/multi-region.bicep**
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

**Deployment:**
```bash
# Distribuire in tutte le regioni
azd up

# Verificare gli endpoint
azd show --output json | jq '.services.api.endpoints'
```

### Modello 4: Integrazione Dapr

**File: infra/app/dapr-enabled.bicep**
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

**Codice Applicativo con Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Salva stato
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Pubblica evento
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Migliori Pratiche

### 1. Organizzazione delle Risorse

```bash
# Usa convenzioni di denominazione coerenti
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Etichetta le risorse per il monitoraggio dei costi
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Migliori Pratiche di Sicurezza

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

### 3. Ottimizzazione delle Prestazioni

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

### 4. Monitoraggio e Osservabilità

```bash
# Abilita Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Visualizza i log in tempo reale
azd logs api --follow

# Monitora le metriche
azd monitor --service api

# Crea avvisi
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Ottimizzazione dei Costi

```bash
# Scala a zero quando non in uso
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Usa istanze spot per ambienti di sviluppo
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Configura avvisi di budget
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Integrazione CI/CD

**Esempio GitHub Actions:**
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

## Riferimenti Comandi Comuni

```bash
# Inizializza un nuovo progetto di app container
azd init --template <template-name>

# Distribuisci infrastruttura e applicazione
azd up

# Distribuisci solo il codice dell'applicazione (salta l'infrastruttura)
azd deploy

# Fornisci solo l'infrastruttura
azd provision

# Visualizza le risorse distribuite
azd show

# Trasmetti i log
azd logs <service-name> --follow

# Monitora l'applicazione
azd monitor --overview

# Pulisci le risorse
azd down --force --purge
```

## Risoluzione dei Problemi

### Problema: Il container non si avvia

```bash
# Controlla i log
azd logs api --tail 100

# Visualizza gli eventi del contenitore
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testa localmente
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problema: Impossibile accedere all'endpoint dell'app container

```bash
# Verifica la configurazione dell'ingresso
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Controlla se l'ingresso interno è abilitato
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problema: Problemi di prestazioni

```bash
# Controlla l'utilizzo delle risorse
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Aumenta le risorse
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Risorse e Esempi Aggiuntivi
- [Esempio Microservizi](./microservices/README.md)
- [Esempio API Flask Semplice](./simple-flask-api/README.md)
- [Documentazione Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galleria Template AZD](https://azure.github.io/awesome-azd/)
- [Esempi Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Template Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributi

Per contribuire con nuovi esempi di app container:

1. Crea una nuova sottodirectory con il tuo esempio
2. Includi file completi `azure.yaml`, `infra/` e `src/`
3. Aggiungi un README completo con istruzioni per il deployment
4. Testa il deployment con `azd up`
5. Invia una pull request

---

**Hai bisogno di aiuto?** Unisciti alla community [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) per supporto e domande.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche potrebbero contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->