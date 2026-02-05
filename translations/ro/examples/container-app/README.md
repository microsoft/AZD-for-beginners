# Exemple de implementare a aplicațiilor containerizate cu AZD

Acest director conține exemple detaliate pentru implementarea aplicațiilor containerizate în Azure Container Apps folosind Azure Developer CLI (AZD). Aceste exemple demonstrează modele reale, bune practici și configurații pregătite pentru producție.

## 📚 Cuprins

- [Prezentare generală](../../../../examples/container-app)
- [Prerechizite](../../../../examples/container-app)
- [Exemple rapide](../../../../examples/container-app)
- [Exemple pentru producție](../../../../examples/container-app)
- [Modele avansate](../../../../examples/container-app)
- [Bune practici](../../../../examples/container-app)

## Prezentare generală

Azure Container Apps este o platformă serverless complet gestionată care permite rularea microserviciilor și aplicațiilor containerizate fără a gestiona infrastructura. În combinație cu AZD, obțineți:

- **Implementare simplificată**: O singură comandă pentru implementarea containerelor cu infrastructură
- **Scalare automată**: Scalare la zero și extindere bazată pe trafic HTTP sau evenimente
- **Rețea integrată**: Descoperire de servicii și divizare a traficului integrate
- **Identitate gestionată**: Autentificare securizată la resursele Azure
- **Optimizare costuri**: Plătiți doar pentru resursele utilizate

## Prerechizite

Înainte de a începe, asigurați-vă că aveți:

```bash
# Verifica instalarea AZD
azd version

# Verifica Azure CLI
az version

# Verifica Docker (pentru construirea imaginilor personalizate)
docker --version

# Autentificare în Azure
azd auth login
az login
```

**Resurse Azure necesare:**
- Abonament Azure activ
- Permisiuni pentru crearea grupurilor de resurse
- Acces la mediul Container Apps

## Exemple rapide

### 1. API Web simplu (Python Flask)

Implementați un API REST de bază cu Azure Container Apps.

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
# Inițializați din șablon
azd init --template todo-python-mongo

# Asigurați infrastructura și implementați
azd up

# Testați implementarea
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Caracteristici cheie:**
- Scalare automată de la 0 la 10 replici
- Probe de sănătate și verificări de funcționare
- Injectare de variabile de mediu
- Integrare cu Application Insights

### 2. API Node.js Express

Implementați un backend Node.js cu integrare MongoDB.

```bash
# Inițializați șablonul API Node.js
azd init --template todo-nodejs-mongo

# Configurați variabilele de mediu
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Implementați
azd up

# Vizualizați jurnalele
azd logs api
```

**Aspecte ale infrastructurii:**
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

Implementați o aplicație full-stack cu frontend React și backend API.

```bash
# Inițializați șablonul full-stack
azd init --template todo-csharp-sql-swa-func

# Revizuiți configurația
cat azure.yaml

# Implementați ambele servicii
azd up

# Deschideți aplicația
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Exemple pentru producție

### Exemplu 1: Arhitectură microservicii

**Scenariu**: Aplicație de e-commerce cu mai multe microservicii

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

**Configurație azure.yaml:**
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
# Inițializați proiectul
azd init

# Setați mediul de producție
azd env new production

# Configurați setările de producție
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Implementați toate serviciile
azd up

# Monitorizați implementarea
azd monitor --overview
```

### Exemplu 2: Aplicație containerizată bazată pe AI

**Scenariu**: Aplicație de chat AI cu integrare Azure OpenAI

**Fișier: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Utilizați Identitatea Gestionată pentru acces securizat
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
        model="gpt-4",
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
# Configurați mediul
azd init --template ai-chat-app
azd env new dev

# Configurați OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Implementați
azd up

# Testați API-ul
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Exemplu 3: Worker de fundal cu procesare în coadă

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
            
            # Finalizează mesajul
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

# Distribuie cu configurația cozii
azd up

# Scalează lucrătorul în funcție de lungimea cozii
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

# Împarte traficul (20% către albastru, 80% către curent)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Trecere completă la albastru
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

# Implementați o revizie nouă cu 10% trafic
azd deploy api --revision-mode multiple

# Monitorizați metricile
azd monitor --service api --duration 5m

# Creșteți traficul treptat
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Așteptați 5 minute
done
```

### Model 3: Implementare multi-regională

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
# Distribuie în toate regiunile
azd up

# Verifică punctele de acces
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
        
        # Publică eveniment
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Bune practici

### 1. Organizarea resurselor

```bash
# Utilizați convenții de denumire consistente
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Etichetați resursele pentru urmărirea costurilor
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Bune practici de securitate

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
azd logs api --follow

# Monitorizează metricile
azd monitor --service api

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
# Scalează la zero când nu este utilizat
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Folosește instanțe spot pentru medii de dezvoltare
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

## Referință pentru comenzi comune

```bash
# Inițializați un nou proiect de aplicație container
azd init --template <template-name>

# Implementați infrastructura și aplicația
azd up

# Implementați doar codul aplicației (omiteți infrastructura)
azd deploy

# Proviționați doar infrastructura
azd provision

# Vizualizați resursele implementate
azd show

# Transmiteți jurnalele
azd logs <service-name> --follow

# Monitorizați aplicația
azd monitor --overview

# Curățați resursele
azd down --force --purge
```

## Depanare

### Problemă: Containerul nu pornește

```bash
# Verificați jurnalele
azd logs api --tail 100

# Vizualizați evenimentele containerului
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testați local
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problemă: Nu se poate accesa endpoint-ul aplicației containerizate

```bash
# Verificați configurația de intrare
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Verificați dacă intrarea internă este activată
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problemă: Probleme de performanță

```bash
# Verifica utilizarea resurselor
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Extinde resursele
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Resurse și exemple suplimentare
- [Exemplu Microservicii](./microservices/README.md)
- [Exemplu API Flash simplu](./simple-flask-api/README.md)
- [Documentație Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galerie de șabloane AZD](https://azure.github.io/awesome-azd/)
- [Exemple Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Șabloane Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contribuții

Pentru a contribui cu noi exemple de aplicații containerizate:

1. Creați un subdirector nou cu exemplul dvs.
2. Includeți fișierele complete `azure.yaml`, `infra/` și `src/`
3. Adăugați un README detaliat cu instrucțiuni de implementare
4. Testați implementarea cu `azd up`
5. Trimiteți un pull request

---

**Aveți nevoie de ajutor?** Alăturați-vă comunității [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) pentru suport și întrebări.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de oameni. Nu ne asumăm responsabilitatea pentru neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->