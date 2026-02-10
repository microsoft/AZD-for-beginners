# Παραδείγματα ανάπτυξης Container App με AZD

Αυτός ο κατάλογος περιέχει ολοκληρωμένα παραδείγματα για την ανάπτυξη εφαρμογών σε containers στο Azure Container Apps χρησιμοποιώντας το Azure Developer CLI (AZD). Αυτά τα παραδείγματα δείχνουν πραγματικά πρότυπα, βέλτιστες πρακτικές και ρυθμίσεις έτοιμες για παραγωγή.

## 📚 Πίνακας περιεχομένων

- [Επισκόπηση](../../../../examples/container-app)
- [Απαιτούμενα](../../../../examples/container-app)
- [Παραδείγματα γρήγορης εκκίνησης](../../../../examples/container-app)
- [Παραδείγματα παραγωγής](../../../../examples/container-app)
- [Προηγμένα πρότυπα](../../../../examples/container-app)
- [Καλές πρακτικές](../../../../examples/container-app)

## Overview

Το Azure Container Apps είναι μια πλήρως διαχειριζόμενη serverless πλατφόρμα για containers που σας επιτρέπει να εκτελείτε μικροϋπηρεσίες και εφαρμογές σε containers χωρίς να διαχειρίζεστε την υποδομή. Όταν συνδυάζεται με το AZD, αποκτάτε:

- **Simplified Deployment**: Μια εντολή αναπτύσσει κοντέινερ μαζί με την υποδομή
- **Automatic Scaling**: Αυτόματη κλιμάκωση σε μηδέν και κλιμάκωση με βάση την κίνηση HTTP ή γεγονότα
- **Integrated Networking**: Ενσωματωμένη ανακάλυψη υπηρεσιών και διαχωρισμός κίνησης
- **Managed Identity**: Ασφαλής έλεγχος ταυτότητας σε πόρους Azure
- **Cost Optimization**: Πληρώστε μόνο για τους πόρους που χρησιμοποιείτε

## Prerequisites

Πριν ξεκινήσετε, βεβαιωθείτε ότι έχετε:

```bash
# Ελέγξτε την εγκατάσταση του AZD
azd version

# Ελέγξτε το Azure CLI
az version

# Ελέγξτε το Docker (για τη δημιουργία προσαρμοσμένων εικόνων)
docker --version

# Συνδεθείτε στο Azure
azd auth login
az login
```

**Required Azure Resources:**
- Ενεργή συνδρομή Azure
- Δικαιώματα δημιουργίας ομάδας πόρων
- Πρόσβαση στο περιβάλλον Container Apps

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Αναπτύξτε ένα βασικό REST API με Azure Container Apps.

**Example: Python Flask API**

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

**Deployment Steps:**

```bash
# Αρχικοποίηση από πρότυπο
azd init --template todo-python-mongo

# Δημιουργία υποδομής και ανάπτυξη
azd up

# Δοκιμή της ανάπτυξης
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Key Features:**
- Αυτόματη κλιμάκωση από 0 έως 10 αντίγραφα
- Έλεγχοι υγείας και ελέγχοι ζωντάνιας
- Έγχυση μεταβλητών περιβάλλοντος
- Ενσωμάτωση με το Application Insights

### 2. Node.js Express API

Αναπτύξτε ένα backend Node.js με ενσωμάτωση MongoDB.

```bash
# Αρχικοποίηση προτύπου API Node.js
azd init --template todo-nodejs-mongo

# Ρύθμιση μεταβλητών περιβάλλοντος
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Ανάπτυξη
azd up

# Προβολή αρχείων καταγραφής μέσω Azure Monitor
azd monitor --logs
```

**Infrastructure Highlights:**
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

Αναπτύξτε μια πλήρους στοίβας εφαρμογή με React frontend και API backend.

```bash
# Αρχικοποιήστε το πρότυπο πλήρους στοίβας
azd init --template todo-csharp-sql-swa-func

# Ελέγξτε τη διαμόρφωση
cat azure.yaml

# Αναπτύξτε και τις δύο υπηρεσίες
azd up

# Ανοίξτε την εφαρμογή
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**Scenario**: Εφαρμογή ηλεκτρονικού εμπορίου με πολλαπλές μικροϋπηρεσίες

**Directory Structure:**
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

**azure.yaml Configuration:**
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
# Αρχικοποιήστε το έργο
azd init

# Ορίστε το περιβάλλον παραγωγής
azd env new production

# Διαμορφώστε τις ρυθμίσεις παραγωγής
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Αναπτύξτε όλες τις υπηρεσίες
azd up

# Παρακολουθήστε την ανάπτυξη
azd monitor --overview
```

### Example 2: AI-Powered Container App

**Scenario**: Εφαρμογή συνομιλίας με AI με ενσωμάτωση Azure OpenAI

**File: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Χρησιμοποιήστε διαχειριζόμενη ταυτότητα για ασφαλή πρόσβαση
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Λάβετε το κλειδί OpenAI από την Αποθήκη Κλειδιών
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

**Deployment Commands:**
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

### Example 3: Background Worker with Queue Processing

**Scenario**: Σύστημα επεξεργασίας παραγγελιών με ουρά μηνυμάτων

**Directory Structure:**
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
            # Επεξεργασία παραγγελίας
            print(f"Processing order: {message.content}")
            
            # Πλήρες μήνυμα
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
# Αρχικοποίηση
azd init

# Ανάπτυξη με διαμόρφωση ουράς
azd up

# Κλιμάκωση εργαζομένου ανάλογα με το μήκος της ουράς
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
# Δημιουργήστε νέα έκδοση χωρίς κυκλοφορία
azd deploy api --revision-suffix blue --no-traffic

# Δοκιμάστε τη νέα έκδοση
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Καταμερίστε την κυκλοφορία (20% στο μπλε, 80% στην τρέχουσα έκδοση)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Πλήρης μεταγωγή στο μπλε
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

# Αναπτύξτε νέα έκδοση με 10% της κυκλοφορίας
azd deploy api --revision-mode multiple

# Παρακολουθήστε τις μετρικές
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

**Deployment:**
```bash
# Αναπτύξτε σε όλες τις περιοχές
azd up

# Επαληθεύστε τα σημεία τερματισμού
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

**Application Code with Dapr:**
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

## Best Practices

### 1. Resource Organization

```bash
# Χρησιμοποιήστε συνεπείς συμβάσεις ονοματοδοσίας
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Επισημάνετε πόρους για παρακολούθηση κόστους
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
# Ενεργοποιήστε το Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Δείτε τα αρχεία καταγραφής σε πραγματικό χρόνο
azd monitor --logs
# Ή χρησιμοποιήστε το Azure CLI για Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Παρακολουθήστε μετρήσεις
azd monitor --live

# Δημιουργήστε ειδοποιήσεις
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# Κλιμάκωση σε μηδέν όταν δεν χρησιμοποιείται
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

### 6. CI/CD Integration

**GitHub Actions Example:**
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
# Αρχικοποιήστε νέο έργο εφαρμογής Container App
azd init --template <template-name>

# Αναπτύξτε την υποδομή και την εφαρμογή
azd up

# Αναπτύξτε μόνο τον κώδικα της εφαρμογής (παράλειψη υποδομής)
azd deploy

# Δημιουργήστε μόνο την υποδομή
azd provision

# Δείτε τους αναπτυγμένους πόρους
azd show

# Παρακολουθήστε ροή καταγραφών χρησιμοποιώντας το azd monitor ή το Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Παρακολουθήστε την εφαρμογή
azd monitor --overview

# Καθαρίστε τους πόρους
azd down --force --purge
```

## Troubleshooting

### Issue: Container fails to start

```bash
# Ελέγξτε τα αρχεία καταγραφής χρησιμοποιώντας το Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Προβάλετε τα συμβάντα του κοντέινερ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Δοκιμάστε το τοπικά
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Issue: Can't access container app endpoint

```bash
# Επαλήθευση διαμόρφωσης Ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Ελέγξτε εάν ο εσωτερικός Ingress είναι ενεργοποιημένος
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Issue: Performance problems

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

## Additional Resources and Examples
- [Παράδειγμα μικροϋπηρεσιών](./microservices/README.md)
- [Απλό παράδειγμα Flash API](./simple-flask-api/README.md)
- [Τεκμηρίωση Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Συλλογή προτύπων AZD](https://azure.github.io/awesome-azd/)
- [Δείγματα Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Πρότυπα Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

Για να συνεισφέρετε νέα παραδείγματα container app:

1. Δημιουργήστε έναν νέο υποκατάλογο με το παράδειγμά σας
2. Συμπεριλάβετε πλήρη αρχεία `azure.yaml`, `infra/` και `src/`
3. Προσθέστε ένα ολοκληρωμένο README με οδηγίες ανάπτυξης
4. Δοκιμάστε την ανάπτυξη με `azd up`
5. Υποβάλετε ένα pull request

---

**Χρειάζεστε βοήθεια;** Ελάτε στην κοινότητα [Microsoft Foundry στο Discord](https://discord.gg/microsoft-azure) για υποστήριξη και ερωτήσεις.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Αυτό το έγγραφο έχει μεταφραστεί με τη χρήση της υπηρεσίας μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για την ακρίβεια, παρακαλείστε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->