# Exemple de implementare Container App cu AZD

Acest director conține exemple cuprinzătoare pentru implementarea aplicațiilor containerizate în Azure Container Apps folosind Azure Developer CLI (AZD). Aceste exemple demonstrează modele din lumea reală, cele mai bune practici și configurații pregătite pentru producție.

## 📚 Cuprins

- [Prezentare generală](../../../../examples/container-app)
- [Cerințe preliminare](../../../../examples/container-app)
- [Exemple de pornire rapidă](../../../../examples/container-app)
- [Exemple de producție](../../../../examples/container-app)
- [Modele avansate](../../../../examples/container-app)
- [Cele mai bune practici](../../../../examples/container-app)

## Prezentare generală

Azure Container Apps este o platformă complet gestionată de containere serverless care vă permite să rulați microservicii și aplicații containerizate fără a gestiona infrastructura. Combinată cu AZD, obțineți:

- **Implementare simplificată**: O singură comandă implementează containerele cu infrastructura
- **Scalare automată**: Scalare la zero și scalare în funcție de traficul HTTP sau evenimente
- **Rețea integrată**: Descoperire de servicii și împărțire a traficului încorporată
- **Identitate gestionată**: Autentificare securizată la resursele Azure
- **Optimizare a costurilor**: Plătiți doar pentru resursele pe care le utilizați

## Cerințe preliminare

Înainte de a începe, asigurați-vă că aveți:

```bash
# Verificați instalarea AZD
azd version

# Verificați Azure CLI
az version

# Verificați Docker (pentru construirea imaginilor personalizate)
docker --version

# Autentificare în Azure
azd auth login
az login
```

**Resurse Azure necesare:**
- Abonament Azure activ
- Permisiuni pentru crearea grupurilor de resurse
- Acces la mediul Container Apps

## Exemple de pornire rapidă

### 1. API web simplu (Python Flask)

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

**Pași pentru implementare:**

```bash
# Inițializează din șablon
azd init --template todo-python-mongo

# Asigură infrastructura și implementează
azd up

# Testează implementarea
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Caracteristici cheie:**
- Scalare automată de la 0 la 10 replici
- Probe de stare și verificări de liveness
- Injecție de variabile de mediu
- Integrare Application Insights

### 2. API Node.js Express

Implementați un backend Node.js cu integrare MongoDB.

```bash
# Inițializează șablonul API Node.js
azd init --template todo-nodejs-mongo

# Configurează variabilele de mediu
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Publică
azd up

# Vizualizează jurnalele prin Azure Monitor
azd monitor --logs
```

**Repere infrastructură:**
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

### 3. Frontend static + API backend

Implementați o aplicație full-stack cu frontend React și backend API.

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

## Exemple de producție

### Exemplu 1: Arhitectură microservicii

**Scenariu**: Aplicație e-commerce cu multiple microservicii

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

# Monitorizează desfășurarea
azd monitor --overview
```

### Exemplu 2: Container App cu inteligență artificială

**Scenariu**: Aplicație chat AI cu integrare Azure OpenAI

**Fișier: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Utilizați Managed Identity pentru acces securizat
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
# Configurează mediul
azd init --template ai-chat-app
azd env new dev

# Configurează OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Implementare
azd up

# Testează API-ul
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Exemplu 3: Worker în fundal cu procesare coadă

**Scenariu**: Sistem de procesare comenzi cu coadă de mesaje

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

# Desfășurare cu configurarea cozii
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
# Creați o nouă revizie fără trafic
azd deploy api --revision-suffix blue --no-traffic

# Testați noua revizie
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Împărțiți traficul (20% către albastru, 80% către curent)
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

# Implementați noua revizie cu 10% trafic
azd deploy api --revision-mode multiple

# Monitorizați metricele
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

### Model 3: Implementare Multi-Regiune

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

# Verificați punctele finale
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
# Folosiți convenții de denumire consistente
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Etichetați resursele pentru urmărirea costurilor
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Cele mai bune practici de securitate

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
# Scalare la zero când nu este utilizat
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Folosiți instanțe spot pentru mediile de dezvoltare
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Configurați alertele pentru buget
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

# Deplasează infrastructura și aplicația
azd up

# Deplasează doar codul aplicației (omite infrastructura)
azd deploy

# Pregătește doar infrastructura
azd provision

# Vizualizează resursele deplasate
azd show

# Transmite logurile folosind azd monitor sau Azure CLI
azd monitor --logs
# az containerapp logs show --name <nume-serviciu> --resource-group <nume-grup-resurse> --follow

# Monitorizează aplicația
azd monitor --overview

# Curăță resursele
azd down --force --purge
```

## Rezolvarea problemelor

### Problemă: Container-ul nu pornește

```bash
# Verificați jurnalele folosind Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Vizualizați evenimentele containerului
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testați local
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
# Verifică utilizarea resurselor
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Mărește resursele
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Resurse și exemple suplimentare
- [Exemplu Microservicii](./microservices/README.md)
- [Exemplu API Flask simplu](./simple-flask-api/README.md)
- [Documentație Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galerie template-uri AZD](https://azure.github.io/awesome-azd/)
- [Sample-uri Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Template-uri Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contribuții

Pentru a contribui cu noi exemple de aplicații containerizate:

1. Creați un subdirector nou cu exemplul dvs.
2. Includeți fișiere complete `azure.yaml`, `infra/` și `src/`
3. Adăugați un README cuprinzător cu instrucțiuni de implementare
4. Testați implementarea cu `azd up`
5. Trimiteți un pull request

---

**Aveți nevoie de ajutor?** Alăturați-vă comunității [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) pentru suport și întrebări.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus utilizând serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să oferim o traducere precisă, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa authoritative. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări eronate rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->