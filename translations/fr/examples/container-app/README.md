<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-19T12:48:52+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "fr"
}
-->
# Exemples de Déploiement d'Applications Conteneurisées avec AZD

Ce répertoire contient des exemples complets pour déployer des applications conteneurisées sur Azure Container Apps en utilisant Azure Developer CLI (AZD). Ces exemples illustrent des modèles réels, des meilleures pratiques et des configurations prêtes pour la production.

## 📚 Table des Matières

- [Aperçu](../../../../examples/container-app)
- [Prérequis](../../../../examples/container-app)
- [Exemples de Démarrage Rapide](../../../../examples/container-app)
- [Exemples de Production](../../../../examples/container-app)
- [Modèles Avancés](../../../../examples/container-app)
- [Meilleures Pratiques](../../../../examples/container-app)

## Aperçu

Azure Container Apps est une plateforme de conteneurs serverless entièrement gérée qui vous permet d'exécuter des microservices et des applications conteneurisées sans gérer l'infrastructure. Combiné avec AZD, vous bénéficiez de :

- **Déploiement Simplifié** : Une seule commande pour déployer des conteneurs avec l'infrastructure
- **Mise à l'Échelle Automatique** : Mise à l'échelle de zéro à plusieurs instances en fonction du trafic HTTP ou des événements
- **Réseautage Intégré** : Découverte de services intégrée et répartition du trafic
- **Identité Gérée** : Authentification sécurisée aux ressources Azure
- **Optimisation des Coûts** : Payez uniquement pour les ressources utilisées

## Prérequis

Avant de commencer, assurez-vous d'avoir :

```bash
# Check AZD installation
azd version

# Check Azure CLI
az version

# Check Docker (for building custom images)
docker --version

# Login to Azure
azd auth login
az login
```

**Ressources Azure Requises :**
- Abonnement Azure actif
- Permissions pour créer un groupe de ressources
- Accès à l'environnement Container Apps

## Exemples de Démarrage Rapide

### 1. API Web Simple (Python Flask)

Déployez une API REST de base avec Azure Container Apps.

**Exemple : API Python Flask**

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

**Étapes de Déploiement :**

```bash
# Initialize from template
azd init --template todo-python-mongo

# Provision infrastructure and deploy
azd up

# Test the deployment
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Caractéristiques Clés :**
- Mise à l'échelle automatique de 0 à 10 réplicas
- Probes de santé et vérifications de vivacité
- Injection de variables d'environnement
- Intégration avec Application Insights

### 2. API Node.js Express

Déployez un backend Node.js avec intégration MongoDB.

```bash
# Initialize Node.js API template
azd init --template todo-nodejs-mongo

# Configure environment variables
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Deploy
azd up

# View logs
azd logs api
```

**Points Forts de l'Infrastructure :**
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

### 3. Frontend Statique + Backend API

Déployez une application full-stack avec un frontend React et un backend API.

```bash
# Initialize full-stack template
azd init --template todo-csharp-sql-swa-func

# Review configuration
cat azure.yaml

# Deploy both services
azd up

# Open the application
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Exemples de Production

### Exemple 1 : Architecture Microservices

**Scénario** : Application e-commerce avec plusieurs microservices

**Structure du Répertoire :**
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

**Configuration azure.yaml :**
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

**Déploiement :**
```bash
# Initialize project
azd init

# Set production environment
azd env new production

# Configure production settings
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Deploy all services
azd up

# Monitor deployment
azd monitor --overview
```

### Exemple 2 : Application Conteneurisée Alimentée par l'IA

**Scénario** : Application de chat IA avec intégration Azure OpenAI

**Fichier : src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Use Managed Identity for secure access
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Get OpenAI key from Key Vault
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

**Fichier : azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Fichier : infra/main.bicep**
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

**Commandes de Déploiement :**
```bash
# Set up environment
azd init --template ai-chat-app
azd env new dev

# Configure OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Deploy
azd up

# Test the API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Exemple 3 : Travailleur en Arrière-Plan avec Traitement de File d'Attente

**Scénario** : Système de traitement des commandes avec file de messages

**Structure du Répertoire :**
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

**Fichier : src/worker/processor.py**
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
            # Process order
            print(f"Processing order: {message.content}")
            
            # Complete message
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Fichier : azure.yaml**
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

**Déploiement :**
```bash
# Initialize
azd init

# Deploy with queue configuration
azd up

# Scale worker based on queue length
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Modèles Avancés

### Modèle 1 : Déploiement Blue-Green

```bash
# Create new revision without traffic
azd deploy api --revision-suffix blue --no-traffic

# Test the new revision
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Split traffic (20% to blue, 80% to current)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Full cutover to blue
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Modèle 2 : Déploiement Canary avec AZD

**Fichier : .azure/dev/config.json**
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

**Script de Déploiement :**
```bash
#!/bin/bash
# deploy-canary.sh

# Deploy new revision with 10% traffic
azd deploy api --revision-mode multiple

# Monitor metrics
azd monitor --service api --duration 5m

# Increase traffic gradually
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Wait 5 minutes
done
```

### Modèle 3 : Déploiement Multi-Régions

**Fichier : azure.yaml**
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

**Fichier : infra/multi-region.bicep**
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

**Déploiement :**
```bash
# Deploy to all regions
azd up

# Verify endpoints
azd show --output json | jq '.services.api.endpoints'
```

### Modèle 4 : Intégration Dapr

**Fichier : infra/app/dapr-enabled.bicep**
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

**Code de l'Application avec Dapr :**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Save state
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Publish event
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Meilleures Pratiques

### 1. Organisation des Ressources

```bash
# Use consistent naming conventions
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Tag resources for cost tracking
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Meilleures Pratiques de Sécurité

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

### 3. Optimisation des Performances

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

### 4. Surveillance et Observabilité

```bash
# Enable Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# View logs in real-time
azd logs api --follow

# Monitor metrics
azd monitor --service api

# Create alerts
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Optimisation des Coûts

```bash
# Scale to zero when not in use
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Use spot instances for dev environments
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Set up budget alerts
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Intégration CI/CD

**Exemple GitHub Actions :**
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

## Référence des Commandes Courantes

```bash
# Initialize new container app project
azd init --template <template-name>

# Deploy infrastructure and application
azd up

# Deploy only application code (skip infrastructure)
azd deploy

# Provision only infrastructure
azd provision

# View deployed resources
azd show

# Stream logs
azd logs <service-name> --follow

# Monitor application
azd monitor --overview

# Clean up resources
azd down --force --purge
```

## Dépannage

### Problème : Le conteneur ne démarre pas

```bash
# Check logs
azd logs api --tail 100

# View container events
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Test locally
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problème : Impossible d'accéder au point de terminaison de l'application conteneurisée

```bash
# Verify ingress configuration
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Check if internal ingress is enabled
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problème : Problèmes de performance

```bash
# Check resource utilization
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Scale up resources
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Ressources et Exemples Supplémentaires
- [Exemple Microservices](./microservices/README.md)
- [Exemple Simple Flash API](./simple-flask-api/README.md)
- [Documentation Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galerie de Modèles AZD](https://azure.github.io/awesome-azd/)
- [Exemples Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Modèles Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contribution

Pour contribuer avec de nouveaux exemples d'applications conteneurisées :

1. Créez un nouveau sous-répertoire avec votre exemple
2. Incluez des fichiers complets `azure.yaml`, `infra/`, et `src/`
3. Ajoutez un README détaillé avec des instructions de déploiement
4. Testez le déploiement avec `azd up`
5. Soumettez une pull request

---

**Besoin d'Aide ?** Rejoignez la communauté [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) pour du support et des questions.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle humaine. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->