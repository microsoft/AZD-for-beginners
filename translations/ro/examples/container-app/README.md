# Exemple de implementare a aplicațiilor container cu AZD

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 Cuprins

- [Prezentare generală](#prezentare-generală)
- [Cerințe prealabile](#cerințe-prealabile)
- [Exemple de pornire rapidă](#exemple-de-pornire-rapidă)
- [Exemple pentru producție](#exemple-pentru-producție)
- [Modele avansate](#modele-avansate)
- [Cele mai bune practici](#cele-mai-bune-practici)

## Prezentare generală

Azure Container Apps is a fully managed serverless container platform that enables you to run microservices and containerized applications without managing infrastructure. When combined with AZD, you get:

- **Implementare simplificată**: O singură comandă implementează containerele împreună cu infrastructura
- **Scalare automată**: Scalează la zero și se extinde în funcție de traficul HTTP sau evenimente
- **Rețea integrată**: Descoperire de servicii încorporată și împărțire a traficului
- **Identitate gestionată**: Autentificare securizată către resursele Azure
- **Optimizare a costurilor**: Plătiți doar pentru resursele pe care le utilizați

## Cerințe prealabile

Before getting started, ensure you have:

```bash
# Verificați instalarea AZD
azd version

# Verificați Azure CLI
az version

# Verificați Docker (pentru construirea imaginilor personalizate)
docker --version

# Autentificați-vă pentru implementările AZD
azd auth login

# Opțional: autentificați-vă la Azure CLI dacă intenționați să rulați comenzile az direct
az login
```

**Resurse Azure necesare:**
- Abonament Azure activ
- Permisiuni pentru crearea grupurilor de resurse
- Acces la mediul Container Apps

## Exemple de pornire rapidă

### 1. API Web simplu (Python Flask)

Deploy a basic REST API with Azure Container Apps.

**Exemplu: API Python Flask**

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

**Pași de implementare:**

```bash
# Inițializează din șablon
azd init --template todo-python-mongo

# Pregătește infrastructura și implementează
azd up

# Testează implementarea
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Caracteristici cheie:**
- Auto-scalare de la 0 la 10 replici
- Probe de sănătate și verificări de liveness
- Injecție de variabile de mediu
- Integrare Application Insights

### 2. API Node.js Express

Deploy a Node.js backend with MongoDB integration.

```bash
# Inițializează șablonul API Node.js
azd init --template todo-nodejs-mongo

# Configurează variabilele de mediu
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Implementare
azd up

# Vizualizează jurnalele prin Azure Monitor
azd monitor --logs
```

**Repere ale infrastructurii:**
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

### 3. Frontend static + Backend API

Deploy a full-stack application with React frontend and API backend.

```bash
# Inițializează șablonul full-stack
azd init --template todo-csharp-sql-swa-func

# Revizuiește configurația
cat azure.yaml

# Desfășoară ambele servicii
azd up

# Deschide aplicația
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Exemple pentru producție

### Exemplu 1: Arhitectură microservicii

**Scenariu**: Aplicație de comerț electronic cu mai multe microservicii

**Structura directorului:**
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

**Configurare azure.yaml:**
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

**Implementare:**
```bash
# Inițializează proiectul
azd init

# Setează mediul de producție
azd env new production

# Configurează setările de producție
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Desfășoară toate serviciile
azd up

# Monitorizează implementarea
azd monitor --overview
```

### Exemplu 2: Aplicație container bazată pe AI

**Scenariu**: Aplicație de chat AI cu integrare Microsoft Foundry Models

**Fișier: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Utilizați o identitate gestionată pentru acces securizat
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Obțineți cheia OpenAI din Key Vault
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

**Fișier: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Fișier: infra/main.bicep**
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

**Comenzi de implementare:**
```bash
# Configurarea mediului
azd init --template ai-chat-app
azd env new dev

# Configurarea OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Implementarea
azd up

# Testarea API-ului
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Exemplu 3: Worker de fundal cu procesare a cozii

**Scenariu**: Sistem de procesare a comenzilor cu coadă de mesaje

**Structura directorului:**
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

**Fișier: src/worker/processor.py**
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
            # Procesează comanda
            print(f"Processing order: {message.content}")
            
            # Mesaj complet
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Fișier: azure.yaml**
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

**Implementare:**
```bash
# Inițializează
azd init

# Desfășurare cu configurația cozii
azd up

# Redimensionează workerul în funcție de lungimea cozii
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Modele avansate

### Model 1: Implementare Blue-Green

```bash
# Creează o nouă revizie fără trafic
azd deploy api --revision-suffix blue --no-traffic

# Testează noua revizie
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Împarte traficul (20% către blue, 80% către curent)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Trecere completă la blue
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Model 2: Implementare Canary cu AZD

**Fișier: .azure/dev/config.json**
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

**Script de implementare:**
```bash
#!/bin/bash
# deploy-canary.sh

# Desfășoară o nouă revizie cu 10% din trafic
azd deploy api --revision-mode multiple

# Monitorizează metricile
azd monitor --service api --duration 5m

# Crește treptat traficul
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Așteaptă 5 minute
done
```

### Model 3: Implementare multi-regiune

**Fișier: azure.yaml**
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

**Fișier: infra/multi-region.bicep**
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

**Implementare:**
```bash
# Implementați în toate regiunile
azd up

# Verificați endpoint-urile
azd show --output json | jq '.services.api.endpoints'
```

### Model 4: Integrare Dapr

**Fișier: infra/app/dapr-enabled.bicep**
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

**Cod aplicație cu Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Salvează starea
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Publică evenimentul
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Cele mai bune practici

### 1. Organizarea resurselor

```bash
# Folosește convenții de denumire consecvente
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Etichetează resursele pentru urmărirea costurilor
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Practici recomandate de securitate

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

### 3. Optimizarea performanței

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

### 4. Monitorizare și observabilitate

```bash
# Activează Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Vizualizează jurnalele în timp real
azd monitor --logs
# Sau folosește Azure CLI pentru Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Monitorizează metricile
azd monitor --live

# Creează alerte
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Optimizarea costurilor

```bash
# Scalare până la zero când nu este folosit
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Folosește instanțe spot pentru mediile de dezvoltare
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Configurează alerte de buget
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Integrare CI/CD

**Exemplu GitHub Actions:**
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

## Referință comenzi comune

```bash
# Inițializează un nou proiect de aplicație containerizată
azd init --template <template-name>

# Desfășoară infrastructura și aplicația
azd up

# Desfășoară doar codul aplicației (omite infrastructura)
azd deploy

# Asigură numai infrastructura
azd provision

# Vizualizează resursele implementate
azd show

# Urmărește jurnalele în timp real folosind azd monitor sau Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Monitorizează aplicația
azd monitor --overview

# Curăță resursele
azd down --force --purge
```

## Depanare

### Problemă: Containerul nu pornește

```bash
# Verifică jurnalele folosind Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Vizualizează evenimentele containerului
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testează local
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problemă: Nu se poate accesa endpoint-ul aplicației container

```bash
# Verificați configurația ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Verificați dacă ingress-ul intern este activat
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problemă: Probleme de performanță

```bash
# Verificați utilizarea resurselor
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Creșteți resursele
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Resurse și exemple suplimentare
- [Exemplu microservicii](./microservices/README.md)
- [Exemplu Simple Flash API](./simple-flask-api/README.md)
- [Documentația Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galeria șabloanelor AZD](https://azure.github.io/awesome-azd/)
- [Exemple Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Șabloane Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contribuții

Pentru a contribui cu noi exemple de aplicații container:

1. Creați un subdirector nou cu exemplul dvs.
2. Includeți fișiere complete `azure.yaml`, `infra/` și `src/`
3. Adăugați un README cuprinzător cu instrucțiuni de implementare
4. Testați implementarea cu `azd up`
5. Trimiteți un pull request

---

**Aveți nevoie de ajutor?** Alăturați-vă comunității [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) pentru suport și întrebări.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru orice neînțelegeri sau interpretări eronate care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->