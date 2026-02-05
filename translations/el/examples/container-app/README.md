# Παραδείγματα Ανάπτυξης Εφαρμογών Container με AZD

Αυτός ο κατάλογος περιέχει ολοκληρωμένα παραδείγματα για την ανάπτυξη εφαρμογών container στο Azure Container Apps χρησιμοποιώντας το Azure Developer CLI (AZD). Τα παραδείγματα αυτά παρουσιάζουν πραγματικά μοτίβα, βέλτιστες πρακτικές και διαμορφώσεις έτοιμες για παραγωγή.

## 📚 Πίνακας Περιεχομένων

- [Επισκόπηση](../../../../examples/container-app)
- [Προαπαιτούμενα](../../../../examples/container-app)
- [Παραδείγματα Γρήγορης Εκκίνησης](../../../../examples/container-app)
- [Παραδείγματα Παραγωγής](../../../../examples/container-app)
- [Προχωρημένα Μοτίβα](../../../../examples/container-app)
- [Βέλτιστες Πρακτικές](../../../../examples/container-app)

## Επισκόπηση

Το Azure Container Apps είναι μια πλήρως διαχειριζόμενη πλατφόρμα serverless container που σας επιτρέπει να εκτελείτε μικροϋπηρεσίες και εφαρμογές container χωρίς να διαχειρίζεστε υποδομή. Σε συνδυασμό με το AZD, έχετε:

- **Απλοποιημένη Ανάπτυξη**: Μια εντολή για την ανάπτυξη containers με υποδομή
- **Αυτόματη Κλιμάκωση**: Κλιμάκωση σε μηδέν και επέκταση βάσει HTTP κίνησης ή γεγονότων
- **Ενσωματωμένη Δικτύωση**: Ενσωματωμένη ανακάλυψη υπηρεσιών και διαχωρισμός κίνησης
- **Διαχειριζόμενη Ταυτότητα**: Ασφαλής αυθεντικοποίηση σε πόρους του Azure
- **Βελτιστοποίηση Κόστους**: Πληρώνετε μόνο για τους πόρους που χρησιμοποιείτε

## Προαπαιτούμενα

Πριν ξεκινήσετε, βεβαιωθείτε ότι έχετε:

```bash
# Ελέγξτε την εγκατάσταση AZD
azd version

# Ελέγξτε το Azure CLI
az version

# Ελέγξτε το Docker (για τη δημιουργία προσαρμοσμένων εικόνων)
docker --version

# Συνδεθείτε στο Azure
azd auth login
az login
```

**Απαιτούμενοι Πόροι Azure:**
- Ενεργή συνδρομή Azure
- Δικαιώματα δημιουργίας ομάδας πόρων
- Πρόσβαση σε περιβάλλον Container Apps

## Παραδείγματα Γρήγορης Εκκίνησης

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

**Βήματα Ανάπτυξης:**

```bash
# Αρχικοποίηση από πρότυπο
azd init --template todo-python-mongo

# Παροχή υποδομής και ανάπτυξη
azd up

# Δοκιμή της ανάπτυξης
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Κύρια Χαρακτηριστικά:**
- Αυτόματη κλιμάκωση από 0 έως 10 αντίγραφα
- Έλεγχοι υγείας και ζωντάνιας
- Εισαγωγή μεταβλητών περιβάλλοντος
- Ενσωμάτωση Application Insights

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

# Προβολή καταγραφών
azd logs api
```

**Κύρια Στοιχεία Υποδομής:**
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

### 3. Στατικό Frontend + API Backend

Αναπτύξτε μια πλήρη εφαρμογή με React frontend και API backend.

```bash
# Αρχικοποίηση προτύπου πλήρους στοίβας
azd init --template todo-csharp-sql-swa-func

# Επισκόπηση ρυθμίσεων
cat azure.yaml

# Ανάπτυξη και των δύο υπηρεσιών
azd up

# Άνοιγμα της εφαρμογής
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Παραδείγματα Παραγωγής

### Παράδειγμα 1: Αρχιτεκτονική Μικροϋπηρεσιών

**Σενάριο**: Εφαρμογή ηλεκτρονικού εμπορίου με πολλαπλές μικροϋπηρεσίες

**Δομή Καταλόγου:**
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

# Ρύθμιση παραμέτρων παραγωγής
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Ανάπτυξη όλων των υπηρεσιών
azd up

# Παρακολούθηση ανάπτυξης
azd monitor --overview
```

### Παράδειγμα 2: Εφαρμογή Container με AI

**Σενάριο**: Εφαρμογή συνομιλίας AI με ενσωμάτωση Azure OpenAI

**Αρχείο: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Χρησιμοποιήστε τη Διαχειριζόμενη Ταυτότητα για ασφαλή πρόσβαση
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Λάβετε το κλειδί OpenAI από το Key Vault
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

**Εντολές Ανάπτυξης:**
```bash
# Ρύθμιση περιβάλλοντος
azd init --template ai-chat-app
azd env new dev

# Διαμόρφωση OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Ανάπτυξη
azd up

# Δοκιμή του API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Παράδειγμα 3: Εργάτης Παρασκηνίου με Επεξεργασία Ουράς

**Σενάριο**: Σύστημα επεξεργασίας παραγγελιών με ουρά μηνυμάτων

**Δομή Καταλόγου:**
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
            
            # Ολοκλήρωση μηνύματος
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

# Κλιμάκωση εργαζομένου βάσει μήκους ουράς
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Προχωρημένα Μοτίβα

### Μοτίβο 1: Ανάπτυξη Blue-Green

```bash
# Δημιουργήστε νέα αναθεώρηση χωρίς κίνηση
azd deploy api --revision-suffix blue --no-traffic

# Δοκιμάστε τη νέα αναθεώρηση
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Διαχωρίστε την κίνηση (20% στο μπλε, 80% στο τρέχον)
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

### Μοτίβο 2: Ανάπτυξη Canary με AZD

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

**Σενάριο Ανάπτυξης:**
```bash
#!/bin/bash
# deploy-canary.sh

# Ανάπτυξη νέας έκδοσης με 10% κίνηση
azd deploy api --revision-mode multiple

# Παρακολούθηση μετρήσεων
azd monitor --service api --duration 5m

# Αύξηση της κίνησης σταδιακά
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Αναμονή 5 λεπτών
done
```

### Μοτίβο 3: Ανάπτυξη σε Πολλαπλές Περιοχές

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
# Ανάπτυξη σε όλες τις περιοχές
azd up

# Επαλήθευση τελικών σημείων
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

**Κώδικας Εφαρμογής με Dapr:**
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

## Βέλτιστες Πρακτικές

### 1. Οργάνωση Πόρων

```bash
# Χρησιμοποιήστε συνεπείς συμβάσεις ονοματοδοσίας
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Ετικετοποιήστε πόρους για παρακολούθηση κόστους
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Βέλτιστες Πρακτικές Ασφαλείας

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

### 3. Βελτιστοποίηση Απόδοσης

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

### 4. Παρακολούθηση και Παρατηρησιμότητα

```bash
# Ενεργοποίηση του Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Προβολή καταγραφών σε πραγματικό χρόνο
azd logs api --follow

# Παρακολούθηση μετρήσεων
azd monitor --service api

# Δημιουργία ειδοποιήσεων
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Βελτιστοποίηση Κόστους

```bash
# Κλιμακώστε σε μηδέν όταν δεν χρησιμοποιείται
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Χρησιμοποιήστε στιγμιαίες περιπτώσεις για περιβάλλοντα ανάπτυξης
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

## Αναφορά Κοινών Εντολών

```bash
# Αρχικοποίηση νέου έργου εφαρμογής κοντέινερ
azd init --template <template-name>

# Ανάπτυξη υποδομής και εφαρμογής
azd up

# Ανάπτυξη μόνο του κώδικα εφαρμογής (παράλειψη υποδομής)
azd deploy

# Παροχή μόνο υποδομής
azd provision

# Προβολή αναπτυγμένων πόρων
azd show

# Ροή καταγραφών
azd logs <service-name> --follow

# Παρακολούθηση εφαρμογής
azd monitor --overview

# Καθαρισμός πόρων
azd down --force --purge
```

## Επίλυση Προβλημάτων

### Πρόβλημα: Το container αποτυγχάνει να ξεκινήσει

```bash
# Ελέγξτε τα αρχεία καταγραφής
azd logs api --tail 100

# Δείτε τα γεγονότα του κοντέινερ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Δοκιμάστε τοπικά
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Πρόβλημα: Δεν είναι δυνατή η πρόσβαση στο endpoint της εφαρμογής container

```bash
# Επαληθεύστε τη διαμόρφωση εισόδου
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Ελέγξτε αν η εσωτερική είσοδος είναι ενεργοποιημένη
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

## Πρόσθετοι Πόροι και Παραδείγματα
- [Παράδειγμα Μικροϋπηρεσιών](./microservices/README.md)
- [Παράδειγμα Απλού Flash API](./simple-flask-api/README.md)
- [Τεκμηρίωση Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Συλλογή Προτύπων AZD](https://azure.github.io/awesome-azd/)
- [Παραδείγματα Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Πρότυπα Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Συνεισφορά

Για να συνεισφέρετε νέα παραδείγματα εφαρμογών container:

1. Δημιουργήστε έναν νέο υποκατάλογο με το παράδειγμά σας
2. Συμπεριλάβετε πλήρη αρχεία `azure.yaml`, `infra/` και `src/`
3. Προσθέστε αναλυτικό README με οδηγίες ανάπτυξης
4. Δοκιμάστε την ανάπτυξη με `azd up`
5. Υποβάλετε ένα pull request

---

**Χρειάζεστε Βοήθεια;** Εγγραφείτε στην κοινότητα [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) για υποστήριξη και ερωτήσεις.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->