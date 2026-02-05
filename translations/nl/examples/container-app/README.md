# Voorbeelden van Container App Implementaties met AZD

Deze map bevat uitgebreide voorbeelden voor het implementeren van container-applicaties naar Azure Container Apps met behulp van Azure Developer CLI (AZD). De voorbeelden tonen realistische patronen, best practices en configuraties die klaar zijn voor productie.

## 📚 Inhoudsopgave

- [Overzicht](../../../../examples/container-app)
- [Vereisten](../../../../examples/container-app)
- [Snelle Start Voorbeelden](../../../../examples/container-app)
- [Productievoorbeelden](../../../../examples/container-app)
- [Geavanceerde Patronen](../../../../examples/container-app)
- [Best Practices](../../../../examples/container-app)

## Overzicht

Azure Container Apps is een volledig beheerd serverless containerplatform waarmee je microservices en container-applicaties kunt draaien zonder infrastructuur te beheren. In combinatie met AZD krijg je:

- **Eenvoudige Implementatie**: Eén commando implementeert containers met infrastructuur
- **Automatische Schaling**: Schaal naar nul en schaal op basis van HTTP-verkeer of gebeurtenissen
- **Geïntegreerde Netwerken**: Ingebouwde service discovery en verkeerssplitsing
- **Beheerde Identiteit**: Veilige authenticatie naar Azure-resources
- **Kostenoptimalisatie**: Betaal alleen voor de resources die je gebruikt

## Vereisten

Voordat je begint, zorg ervoor dat je beschikt over:

```bash
# Controleer AZD-installatie
azd version

# Controleer Azure CLI
az version

# Controleer Docker (voor het bouwen van aangepaste afbeeldingen)
docker --version

# Inloggen bij Azure
azd auth login
az login
```

**Vereiste Azure Resources:**
- Actief Azure-abonnement
- Machtigingen om resourcegroepen te maken
- Toegang tot Container Apps-omgeving

## Snelle Start Voorbeelden

### 1. Eenvoudige Web API (Python Flask)

Implementeer een basis REST API met Azure Container Apps.

**Voorbeeld: Python Flask API**

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

**Implementatiestappen:**

```bash
# Initialiseer vanuit sjabloon
azd init --template todo-python-mongo

# Voorzie infrastructuur en implementeer
azd up

# Test de implementatie
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Belangrijkste Kenmerken:**
- Automatische schaling van 0 tot 10 replica's
- Gezondheidscontroles en liveness checks
- Injectie van omgevingsvariabelen
- Integratie met Application Insights

### 2. Node.js Express API

Implementeer een Node.js backend met MongoDB-integratie.

```bash
# Initialiseer Node.js API-sjabloon
azd init --template todo-nodejs-mongo

# Configureer omgevingsvariabelen
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Implementeren
azd up

# Bekijk logs
azd logs api
```

**Hoogtepunten van de Infrastructuur:**
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

### 3. Statische Frontend + API Backend

Implementeer een full-stack applicatie met React frontend en API backend.

```bash
# Initialiseer full-stack template
azd init --template todo-csharp-sql-swa-func

# Controleer configuratie
cat azure.yaml

# Implementeer beide services
azd up

# Open de applicatie
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Productievoorbeelden

### Voorbeeld 1: Microservices Architectuur

**Scenario**: E-commerce applicatie met meerdere microservices

**Mapstructuur:**
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

**azure.yaml Configuratie:**
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

**Implementatie:**
```bash
# Initialiseer project
azd init

# Stel productieomgeving in
azd env new production

# Configureer productie-instellingen
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Implementeer alle services
azd up

# Bewaak implementatie
azd monitor --overview
```

### Voorbeeld 2: AI-aangedreven Container App

**Scenario**: AI-chatapplicatie met Azure OpenAI-integratie

**Bestand: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Gebruik Managed Identity voor veilige toegang
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Haal OpenAI-sleutel uit Key Vault
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

**Bestand: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Bestand: infra/main.bicep**
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

**Implementatiecommando's:**
```bash
# Stel de omgeving in
azd init --template ai-chat-app
azd env new dev

# Configureer OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Implementeren
azd up

# Test de API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Voorbeeld 3: Achtergrondwerker met Wachtrijverwerking

**Scenario**: Orderverwerkingssysteem met berichtwachtrij

**Mapstructuur:**
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

**Bestand: src/worker/processor.py**
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
            # Verwerk bestelling
            print(f"Processing order: {message.content}")
            
            # Voltooi bericht
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Bestand: azure.yaml**
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

**Implementatie:**
```bash
# Initialiseren
azd init

# Implementeren met wachtrijconfiguratie
azd up

# Schaal werknemer op basis van wachtrijlengte
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Geavanceerde Patronen

### Patroon 1: Blue-Green Implementatie

```bash
# Maak een nieuwe revisie zonder verkeer
azd deploy api --revision-suffix blue --no-traffic

# Test de nieuwe revisie
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Verdeel verkeer (20% naar blauw, 80% naar huidig)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Volledige overgang naar blauw
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Patroon 2: Canary Implementatie met AZD

**Bestand: .azure/dev/config.json**
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

**Implementatiescript:**
```bash
#!/bin/bash
# deploy-canary.sh

# Implementeer nieuwe revisie met 10% verkeer
azd deploy api --revision-mode multiple

# Monitor statistieken
azd monitor --service api --duration 5m

# Verhoog het verkeer geleidelijk
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Wacht 5 minuten
done
```

### Patroon 3: Multi-Region Implementatie

**Bestand: azure.yaml**
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

**Bestand: infra/multi-region.bicep**
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

**Implementatie:**
```bash
# Implementeren in alle regio's
azd up

# Controleer eindpunten
azd show --output json | jq '.services.api.endpoints'
```

### Patroon 4: Dapr Integratie

**Bestand: infra/app/dapr-enabled.bicep**
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

**Applicatiecode met Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Staat opslaan
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Gebeurtenis publiceren
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Best Practices

### 1. Resourceorganisatie

```bash
# Gebruik consistente naamgevingsconventies
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Label resources voor kostenbeheer
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Beveiligingsrichtlijnen

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

### 3. Prestatieoptimalisatie

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

### 4. Monitoring en Observatie

```bash
# Inschakelen Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Bekijk logs in realtime
azd logs api --follow

# Bewaak statistieken
azd monitor --service api

# Maak meldingen
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Kostenoptimalisatie

```bash
# Schaal naar nul wanneer niet in gebruik
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Gebruik spot-instanties voor ontwikkelomgevingen
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Stel budgetwaarschuwingen in
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integratie

**GitHub Actions Voorbeeld:**
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

## Veelgebruikte Commando's Referentie

```bash
# Initialiseer nieuw container-app project
azd init --template <template-name>

# Implementeer infrastructuur en applicatie
azd up

# Implementeer alleen applicatiecode (sla infrastructuur over)
azd deploy

# Voorzie alleen infrastructuur
azd provision

# Bekijk geïmplementeerde resources
azd show

# Stream logs
azd logs <service-name> --follow

# Monitor applicatie
azd monitor --overview

# Ruim resources op
azd down --force --purge
```

## Probleemoplossing

### Probleem: Container start niet

```bash
# Controleer logs
azd logs api --tail 100

# Bekijk containergebeurtenissen
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Test lokaal
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Probleem: Kan container app endpoint niet bereiken

```bash
# Verifieer ingress-configuratie
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Controleer of interne ingress is ingeschakeld
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Probleem: Prestatieproblemen

```bash
# Controleer het gebruik van middelen
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Schaal middelen op
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Aanvullende Bronnen en Voorbeelden
- [Microservices Voorbeeld](./microservices/README.md)
- [Eenvoudige Flash API Voorbeeld](./simple-flask-api/README.md)
- [Azure Container Apps Documentatie](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Galerij](https://azure.github.io/awesome-azd/)
- [Container Apps Voorbeelden](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Bijdragen

Om nieuwe container app voorbeelden bij te dragen:

1. Maak een nieuwe submap met jouw voorbeeld
2. Voeg complete `azure.yaml`, `infra/`, en `src/` bestanden toe
3. Voeg een uitgebreide README toe met implementatie-instructies
4. Test implementatie met `azd up`
5. Dien een pull request in

---

**Hulp nodig?** Word lid van de [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) community voor ondersteuning en vragen.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->