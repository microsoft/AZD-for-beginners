# Esempi di distribuzione di Container App con AZD

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 Sommario

- [Panoramica](../../../../examples/container-app)
- [Prerequisiti](../../../../examples/container-app)
- [Esempi di avvio rapido](../../../../examples/container-app)
- [Esempi di produzione](../../../../examples/container-app)
- [Pattern avanzati](../../../../examples/container-app)
- [Migliori pratiche](../../../../examples/container-app)

## Overview

Azure Container Apps is a fully managed serverless container platform that enables you to run microservices and containerized applications without managing infrastructure. When combined with AZD, you get:

- **Distribuzione semplificata**: Un unico comando distribuisce i container con l'infrastruttura
- **Scaling automatico**: Scala a zero e scala orizzontalmente in base al traffico HTTP o agli eventi
- **Networking integrato**: Service discovery integrato e split del traffico
- **Managed Identity**: Autenticazione sicura alle risorse Azure
- **Ottimizzazione dei costi**: Paghi solo per le risorse che utilizzi

## Prerequisiti

Prima di iniziare, assicurati di avere:

```bash
# Verifica l'installazione di AZD
azd version

# Verifica l'installazione di Azure CLI
az version

# Verifica Docker (per la creazione di immagini personalizzate)
docker --version

# Accedi ad Azure
azd auth login
az login
```

**Risorse Azure richieste:**
- Sottoscrizione Azure attiva
- Permessi per la creazione di gruppi di risorse
- Accesso all'ambiente Container Apps

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Distribuisci una REST API di base con Azure Container Apps.

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

**Passaggi di distribuzione:**

```bash
# Inizializza dal modello
azd init --template todo-python-mongo

# Prepara l'infrastruttura e distribuisci
azd up

# Testa la distribuzione
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Caratteristiche principali:**
- Auto-scaling da 0 a 10 repliche
- Probe di integrità e controlli di liveness
- Iniezione di variabili d'ambiente
- Integrazione con Application Insights

### 2. Node.js Express API

Distribuisci un backend Node.js con integrazione MongoDB.

```bash
# Inizializza il template dell'API Node.js
azd init --template todo-nodejs-mongo

# Configura le variabili di ambiente
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Distribuisci
azd up

# Visualizza i log tramite Azure Monitor
azd monitor --logs
```

**Punti salienti dell'infrastruttura:**
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

Distribuisci un'applicazione full-stack con frontend React e backend API.

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

## Production Examples

### Example 1: Microservices Architecture

**Scenario**: Applicazione e-commerce con più microservizi

**Struttura della directory:**
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

**Distribuzione:**
```bash
# Inizializza il progetto
azd init

# Imposta l'ambiente di produzione
azd env new production

# Configura le impostazioni di produzione
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Distribuisci tutti i servizi
azd up

# Monitora la distribuzione
azd monitor --overview
```

### Example 2: AI-Powered Container App

**Scenario**: Applicazione di chat AI con integrazione Azure OpenAI

**File: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Usa l'identità gestita per l'accesso sicuro
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Recupera la chiave OpenAI da Key Vault
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

**Comandi di distribuzione:**
```bash
# Imposta l'ambiente
azd init --template ai-chat-app
azd env new dev

# Configura OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Distribuisci
azd up

# Testa l'API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**Scenario**: Sistema di elaborazione ordini con coda di messaggi

**Struttura della directory:**
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
            # Elabora ordine
            print(f"Processing order: {message.content}")
            
            # Messaggio completo
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

**Distribuzione:**
```bash
# Inizializza
azd init

# Distribuisci con la configurazione della coda
azd up

# Scala il worker in base alla lunghezza della coda
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### Pattern 1: Blue-Green Deployment

```bash
# Crea una nuova revisione senza traffico
azd deploy api --revision-suffix blue --no-traffic

# Testa la nuova revisione
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Dividi il traffico (20% a blue, 80% alla versione corrente)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Passaggio completo a blue
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: Canary Deployment with AZD

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

**Deployment Script:**
```bash
#!/bin/bash
# deploy-canary.sh

# Distribuisci nuova revisione con il 10% del traffico
azd deploy api --revision-mode multiple

# Monitora le metriche
azd monitor --service api --duration 5m

# Aumenta gradualmente il traffico
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Attendi 5 minuti
done
```

### Pattern 3: Multi-Region Deployment

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

**Distribuzione:**
```bash
# Distribuire in tutte le regioni
azd up

# Verificare gli endpoint
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Dapr Integration

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

**Codice dell'applicazione con Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Salva lo stato
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

## Best Practices

### 1. Resource Organization

```bash
# Usa convenzioni di denominazione coerenti
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Etichetta le risorse per il monitoraggio dei costi
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Security Best Practices

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

### 3. Performance Optimization

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

### 4. Monitoring and Observability

```bash
# Abilita Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Visualizza i log in tempo reale
azd monitor --logs
# Oppure usa Azure CLI per Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Monitora le metriche
azd monitor --live

# Crea avvisi
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# Ridurre a zero quando non in uso
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Usare istanze spot per gli ambienti di sviluppo
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Impostare avvisi di budget
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

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

## Common Commands Reference

```bash
# Inizializza un nuovo progetto di app container
azd init --template <template-name>

# Distribuisci l'infrastruttura e l'applicazione
azd up

# Distribuisci solo il codice dell'applicazione (salta l'infrastruttura)
azd deploy

# Provisiona solo l'infrastruttura
azd provision

# Visualizza le risorse distribuite
azd show

# Visualizza i log in streaming usando azd monitor o Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Monitora l'applicazione
azd monitor --overview

# Rimuovi le risorse
azd down --force --purge
```

## Troubleshooting

### Issue: Container fails to start

```bash
# Controlla i log usando Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Visualizza gli eventi del contenitore
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testa localmente
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Issue: Can't access container app endpoint

```bash
# Verificare la configurazione dell'ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Verificare se l'ingress interno è abilitato
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Issue: Performance problems

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

## Additional Resources and Examples
- [Esempio microservizi](./microservices/README.md)
- [Esempio Simple Flash API](./simple-flask-api/README.md)
- [Documentazione di Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galleria template AZD](https://azure.github.io/awesome-azd/)
- [Esempi di Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Template Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

Per contribuire con nuovi esempi di container app:

1. Crea una nuova sottodirectory con il tuo esempio
2. Includi i file completi `azure.yaml`, `infra/` e `src/`
3. Aggiungi un README completo con istruzioni di distribuzione
4. Testa la distribuzione con `azd up`
5. Invia una pull request

---

**Hai bisogno di aiuto?** Unisciti alla community [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) per supporto e domande.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua deve essere considerato la fonte autorevole. Per informazioni di natura critica, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo alcuna responsabilità per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->