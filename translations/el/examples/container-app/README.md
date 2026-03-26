# Παραδείγματα ανάπτυξης Container App με AZD

Αυτός ο κατάλογος περιέχει ολοκληρωμένα παραδείγματα για την ανάπτυξη εφαρμογών σε κοντέινερ στο Azure Container Apps χρησιμοποιώντας το Azure Developer CLI (AZD). Αυτά τα παραδείγματα δείχνουν πραγματικά μοτίβα, βέλτιστες πρακτικές και ρυθμίσεις έτοιμες για παραγωγή.

## 📚 Περιεχόμενα

- [Επισκόπηση](../../../../examples/container-app)
- [Προαπαιτούμενα](../../../../examples/container-app)
- [Παραδείγματα γρήγορης εκκίνησης](../../../../examples/container-app)
- [Παραδείγματα παραγωγής](../../../../examples/container-app)
- [Προχωρημένα μοτίβα](../../../../examples/container-app)
- [Καλές πρακτικές](../../../../examples/container-app)

## Overview

Το Azure Container Apps είναι μια πλήρως διαχειριζόμενη serverless πλατφόρμα κοντέινερ που σας επιτρέπει να εκτελείτε μικροϋπηρεσίες και εφαρμογές σε κοντέινερ χωρίς να διαχειρίζεστε την υποδομή. Όταν συνδυάζεται με το AZD, αποκτάτε:

- **Απλοποιημένη Ανάπτυξη**: Ένα εντολή αναπτύσσει κοντέινερ μαζί με την υποδομή
- **Αυτόματη Κλιμάκωση**: Κλιμάκωση στο μηδέν και κλιμάκωση ανάλογα με την HTTP κίνηση ή γεγονότα
- **Ενσωματωμένη Δικτύωση**: Ενσωματωμένη ανίχνευση υπηρεσιών και διαίρεση κυκλοφορίας
- **Διαχειριζόμενη Ταυτότητα**: Ασφαλής αυθεντικοποίηση σε πόρους Azure
- **Βελτιστοποίηση Κόστους**: Πληρώνετε μόνο για τους πόρους που χρησιμοποιείτε

## Προαπαιτούμενα

Πριν ξεκινήσετε, βεβαιωθείτε ότι έχετε:

```bash
# Έλεγχος εγκατάστασης του AZD
azd version

# Έλεγχος Azure CLI
az version

# Έλεγχος Docker (για τη δημιουργία προσαρμοσμένων εικόνων)
docker --version

# Σύνδεση στο Azure
azd auth login
az login
```

**Απαιτούμενοι πόροι Azure:**
- Ενεργή συνδρομή Azure
- Δικαιώματα δημιουργίας ομάδας πόρων
- Πρόσβαση στο περιβάλλον Container Apps

## Παραδείγματα γρήγορης εκκίνησης

### 1. Απλό Web API (Python Flask)

Αναπτύξτε ένα βασικό REST API με το Azure Container Apps.

**Παράδειγμα: Python Flask API**

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

**Βήματα ανάπτυξης:**

```bash
# Αρχικοποίηση από πρότυπο
azd init --template todo-python-mongo

# Παροχή υποδομής και ανάπτυξη
azd up

# Δοκιμή της ανάπτυξης
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Βασικά χαρακτηριστικά:**
- Αυτόματη κλιμάκωση από 0 έως 10 αντίγραφα
- Έλεγχοι υγείας (health probes) και έλεγχοι liveness
- Έγχυση μεταβλητών περιβάλλοντος
- Ενσωμάτωση με Application Insights

### 2. Node.js Express API

Αναπτύξτε ένα backend Node.js με ενσωμάτωση MongoDB.

```bash
# Αρχικοποίηση προτύπου API Node.js
azd init --template todo-nodejs-mongo

# Διαμόρφωση μεταβλητών περιβάλλοντος
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Ανάπτυξη
azd up

# Προβολή αρχείων καταγραφής μέσω του Azure Monitor
azd monitor --logs
```

**Βασικά στοιχεία υποδομής:**
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

Αναπτύξτε μια εφαρμογή full-stack με React frontend και API backend.

```bash
# Αρχικοποίηση προτύπου πλήρους στοίβας
azd init --template todo-csharp-sql-swa-func

# Επανεξέταση διαμόρφωσης
cat azure.yaml

# Ανάπτυξη και των δύο υπηρεσιών
azd up

# Άνοιγμα της εφαρμογής
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Παραδείγματα παραγωγής

### Παράδειγμα 1: Αρχιτεκτονική μικροϋπηρεσιών

**Σενάριο**: Εφαρμογή ηλεκτρονικού εμπορίου με πολλαπλές μικροϋπηρεσίες

**Δομή καταλόγου:**
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

**Διαμόρφωση azure.yaml:**
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

**Ανάπτυξη:**
```bash
# Αρχικοποίηση έργου
azd init

# Ορισμός περιβάλλοντος παραγωγής
azd env new production

# Διαμόρφωση ρυθμίσεων παραγωγής
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Ανάπτυξη όλων των υπηρεσιών
azd up

# Παρακολούθηση ανάπτυξης
azd monitor --overview
```

### Παράδειγμα 2: Container App με δυνατότητες AI

**Σενάριο**: Εφαρμογή συνομιλίας AI με ενσωμάτωση Microsoft Foundry Models

**Αρχείο: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Χρησιμοποιήστε Διαχειριζόμενη Ταυτότητα για ασφαλή πρόσβαση
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Αποκτήστε το κλειδί OpenAI από το Key Vault
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

**Αρχείο: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Αρχείο: infra/main.bicep**
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

**Εντολές ανάπτυξης:**
```bash
# Ρύθμιση περιβάλλοντος
azd init --template ai-chat-app
azd env new dev

# Διαμόρφωση του OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Ανάπτυξη
azd up

# Δοκιμή του API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Παράδειγμα 3: Εργαζόμενος φόντου με επεξεργασία ουρών

**Σενάριο**: Σύστημα επεξεργασίας παραγγελιών με ουρά μηνυμάτων

**Δομή καταλόγου:**
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

**Αρχείο: src/worker/processor.py**
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
            # Επεξεργασία παραγγελίας
            print(f"Processing order: {message.content}")
            
            # Ολοκληρωμένο μήνυμα
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Αρχείο: azure.yaml**
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

**Ανάπτυξη:**
```bash
# Αρχικοποίηση
azd init

# Ανάπτυξη με διαμόρφωση ουράς
azd up

# Κλιμάκωση του εργάτη με βάση το μήκος της ουράς
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Προχωρημένα μοτίβα

### Μοτίβο 1: Blue-Green ανάπτυξη

```bash
# Δημιουργήστε νέα αναθεώρηση χωρίς κυκλοφορία
azd deploy api --revision-suffix blue --no-traffic

# Δοκιμάστε τη νέα αναθεώρηση
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Διαμοιράστε την κυκλοφορία (20% στο μπλε, 80% στην τρέχουσα)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Πλήρης μετάβαση στο μπλε
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Μοτίβο 2: Canary deployment με AZD

**Αρχείο: .azure/dev/config.json**
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

**Σενάριο ανάπτυξης:**
```bash
#!/bin/bash
# deploy-canary.sh

# Αναπτύξτε νέα αναθεώρηση με 10% της κυκλοφορίας
azd deploy api --revision-mode multiple

# Παρακολουθήστε μετρικές
azd monitor --service api --duration 5m

# Αυξήστε την κυκλοφορία σταδιακά
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Περιμένετε 5 λεπτά
done
```

### Μοτίβο 3: Ανάπτυξη σε πολλαπλές περιοχές

**Αρχείο: azure.yaml**
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

**Αρχείο: infra/multi-region.bicep**
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

**Ανάπτυξη:**
```bash
# Αναπτύξτε σε όλες τις περιοχές
azd up

# Επαληθεύστε τα σημεία τερματισμού
azd show --output json | jq '.services.api.endpoints'
```

### Μοτίβο 4: Ενσωμάτωση Dapr

**Αρχείο: infra/app/dapr-enabled.bicep**
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

**Κώδικας εφαρμογής με Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Αποθήκευση κατάστασης
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Δημοσίευση συμβάντος
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Καλές πρακτικές

### 1. Οργάνωση πόρων

```bash
# Χρησιμοποιήστε συνεπείς κανόνες ονοματοδοσίας
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Επισημάνετε πόρους με ετικέτες για την παρακολούθηση του κόστους
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Καλές πρακτικές ασφάλειας

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

### 3. Βελτιστοποίηση απόδοσης

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

### 4. Παρακολούθηση και παρατηρησιμότητα

```bash
# Ενεργοποιήστε το Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Δείτε τα αρχεία καταγραφής σε πραγματικό χρόνο
azd monitor --logs
# Ή χρησιμοποιήστε το Azure CLI για τις Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Παρακολουθήστε μετρικές
azd monitor --live

# Δημιουργήστε ειδοποιήσεις
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Βελτιστοποίηση κόστους

```bash
# Κλιμάκωση στο μηδέν όταν δεν χρησιμοποιείται
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Χρησιμοποιήστε spot instances για περιβάλλοντα ανάπτυξης
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Ρυθμίστε ειδοποιήσεις προϋπολογισμού
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Ενσωμάτωση CI/CD

**Παράδειγμα GitHub Actions:**
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

## Αναφορά κοινών εντολών

```bash
# Αρχικοποίηση νέου έργου εφαρμογής container
azd init --template <template-name>

# Ανάπτυξη υποδομής και εφαρμογής
azd up

# Ανάπτυξη μόνο του κώδικα εφαρμογής (παράλειψη υποδομής)
azd deploy

# Παροχή μόνο υποδομής
azd provision

# Προβολή αναπτυγμένων πόρων
azd show

# Ροή καταγραφών χρησιμοποιώντας azd monitor ή το Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Παρακολούθηση εφαρμογής
azd monitor --overview

# Καθαρισμός πόρων
azd down --force --purge
```

## Επίλυση προβλημάτων

### Πρόβλημα: Το container δεν ξεκινά

```bash
# Ελέγξτε τα αρχεία καταγραφής χρησιμοποιώντας το Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Δείτε τα συμβάντα του κοντέινερ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Δοκιμάστε το τοπικά
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Πρόβλημα: Δεν είναι δυνατή η πρόσβαση στο endpoint της εφαρμογής container

```bash
# Επαληθεύστε τη διαμόρφωση του ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Ελέγξτε αν το εσωτερικό ingress είναι ενεργοποιημένο
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Πρόβλημα: Προβλήματα απόδοσης

```bash
# Ελέγξτε τη χρήση πόρων
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Αυξήστε τους πόρους
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Πρόσθετοι πόροι και παραδείγματα
- [Παράδειγμα μικροϋπηρεσιών](./microservices/README.md)
- [Παράδειγμα Simple Flash API](./simple-flask-api/README.md)
- [Τεκμηρίωση Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Συλλογή προτύπων AZD](https://azure.github.io/awesome-azd/)
- [Δείγματα Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Πρότυπα Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Συνεισφορά

Για να συνεισφέρετε νέα παραδείγματα εφαρμογών container:

1. Δημιουργήστε έναν νέο υποκατάλογο με το παράδείγμά σας
2. Περιλάβετε πλήρη αρχεία `azure.yaml`, `infra/` και `src/`
3. Προσθέστε ένα αναλυτικό README με οδηγίες ανάπτυξης
4. Δοκιμάστε την ανάπτυξη με `azd up`
5. Υποβάλετε ένα pull request

---

**Χρειάζεστε βοήθεια;** Ελάτε στην κοινότητα [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) για υποστήριξη και ερωτήσεις.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθύνης:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που επιδιώκουμε την ακρίβεια, να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του πρέπει να θεωρείται η αυθεντική/επίσημη πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από ανθρώπινο μεταφραστή. Δεν φέρουμε ευθύνη για οποιεσδήποτε παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->