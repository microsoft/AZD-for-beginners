# Exemples de déploiement d'applications conteneurisées avec AZD

Ce répertoire contient des exemples complets de déploiement d'applications conteneurisées sur Azure Container Apps à l'aide d'Azure Developer CLI (AZD). Ces exemples démontrent des modèles réels, des bonnes pratiques et des configurations prêtes pour la production.

## 📚 Table des matières

- [Présentation](#présentation)
- [Prérequis](#prérequis)
- [Exemples de démarrage rapide](#exemples-de-démarrage-rapide)
- [Exemples pour la production](#exemples-pour-la-production)
- [Modèles avancés](#modèles-avancés)
- [Bonnes pratiques](#bonnes-pratiques)

## Présentation

Azure Container Apps est une plateforme conteneurisée serverless entièrement gérée qui vous permet d’exécuter des microservices et des applications conteneurisées sans gérer l’infrastructure. Associé à AZD, vous bénéficiez de :

- **Déploiement simplifié** : une commande unique pour déployer des conteneurs avec l’infrastructure
- **Mise à l’échelle automatique** : mise à l’échelle jusqu’à zéro et extension en fonction du trafic HTTP ou des événements
- **Réseau intégré** : découverte de services intégrée et répartition du trafic
- **Identité managée** : authentification sécurisée aux ressources Azure
- **Optimisation des coûts** : paiement uniquement des ressources utilisées

## Prérequis

Avant de commencer, assurez-vous d’avoir :

```bash
# Vérifier l'installation d'AZD
azd version

# Vérifier Azure CLI
az version

# Vérifier Docker (pour construire des images personnalisées)
docker --version

# S'authentifier pour les déploiements AZD
azd auth login

# Optionnel : se connecter à Azure CLI si vous prévoyez d'exécuter des commandes az directement
az login
```

**Ressources Azure requises :**
- Abonnement Azure actif
- Permissions pour créer un groupe de ressources
- Accès à un environnement Container Apps

## Exemples de démarrage rapide

### 1. API Web simple (Python Flask)

Déployez une API REST basique avec Azure Container Apps.

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

**Étapes de déploiement :**

```bash
# Initialiser à partir du modèle
azd init --template todo-python-mongo

# Approvisionner l'infrastructure et déployer
azd up

# Tester le déploiement
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Fonctionnalités clés :**
- Auto-scalabilité de 0 à 10 réplicas
- Probes de santé et vérifications de vivacité
- Injection de variables d’environnement
- Intégration Application Insights

### 2. API Node.js Express

Déployez un backend Node.js avec intégration MongoDB.

```bash
# Initialiser le modèle d'API Node.js
azd init --template todo-nodejs-mongo

# Configurer les variables d'environnement
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Déployer
azd up

# Voir les journaux via Azure Monitor
azd monitor --logs
```

**Points forts de l’infrastructure :**
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

### 3. Frontend statique + Backend API

Déployez une application full-stack avec un frontend React et un backend API.

```bash
# Initialiser le modèle full-stack
azd init --template todo-csharp-sql-swa-func

# Examiner la configuration
cat azure.yaml

# Déployer les deux services
azd up

# Ouvrir l'application
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Exemples pour la production

### Exemple 1 : Architecture microservices

**Scénario** : Application e-commerce avec plusieurs microservices

**Structure du répertoire :**
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
# Initialiser le projet
azd init

# Définir l'environnement de production
azd env new production

# Configurer les paramètres de production
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Déployer tous les services
azd up

# Surveiller le déploiement
azd monitor --overview
```

### Exemple 2 : Application conteneurisée alimentée par l’IA

**Scénario** : Application de chat IA avec intégration des modèles Microsoft Foundry

**Fichier : src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Utilisez l'identité gérée pour un accès sécurisé
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Obtenez la clé OpenAI depuis Key Vault
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

**Commandes de déploiement :**
```bash
# Configurer l'environnement
azd init --template ai-chat-app
azd env new dev

# Configurer OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Déployer
azd up

# Tester l'API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Exemple 3 : Worker en arrière-plan avec traitement par file d’attente

**Scénario** : Système de traitement de commandes avec file de messages

**Structure du répertoire :**
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
            # Traiter la commande
            print(f"Processing order: {message.content}")
            
            # Message complet
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
# Initialiser
azd init

# Déployer avec la configuration de la file d'attente
azd up

# Ajuster le nombre de travailleurs en fonction de la longueur de la file d'attente
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Modèles avancés

### Modèle 1 : Déploiement blue-green

```bash
# Créer une nouvelle révision sans trafic
azd deploy api --revision-suffix blue --no-traffic

# Tester la nouvelle révision
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Répartir le trafic (20 % vers bleu, 80 % vers actuel)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Basculement complet vers bleu
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Modèle 2 : Déploiement canari avec AZD

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

**Script de déploiement :**
```bash
#!/bin/bash
# deploy-canary.sh

# Déployer une nouvelle révision avec 10 % du trafic
azd deploy api --revision-mode multiple

# Surveiller les métriques
azd monitor --service api --duration 5m

# Augmenter progressivement le trafic
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Attendre 5 minutes
done
```

### Modèle 3 : Déploiement multi-région

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
# Déployer dans toutes les régions
azd up

# Vérifier les points de terminaison
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

**Code d’application avec Dapr :**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Sauvegarder l'état
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Publier l'événement
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Bonnes pratiques

### 1. Organisation des ressources

```bash
# Utilisez des conventions de nommage cohérentes
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Marquez les ressources pour le suivi des coûts
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Bonnes pratiques de sécurité

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

### 3. Optimisation des performances

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

### 4. Monitoring et observabilité

```bash
# Activer Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Voir les journaux en temps réel
azd monitor --logs
# Ou utiliser Azure CLI pour les applications de conteneurs :
az containerapp logs show --name api --resource-group rg-myapp --follow

# Surveiller les métriques
azd monitor --live

# Créer des alertes
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Optimisation des coûts

```bash
# Mettre à l'échelle à zéro lorsqu'il n'est pas utilisé
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Utiliser des instances spot pour les environnements de développement
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Configurer des alertes budgétaires
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

## Référence des commandes courantes

```bash
# Initialiser un nouveau projet d'application conteneurisée
azd init --template <template-name>

# Déployer l'infrastructure et l'application
azd up

# Déployer uniquement le code de l'application (ignorer l'infrastructure)
azd deploy

# Provisionner uniquement l'infrastructure
azd provision

# Voir les ressources déployées
azd show

# Diffuser les logs en utilisant azd monitor ou Azure CLI
azd monitor --logs
# az containerapp logs show --name <nom-service> --resource-group <nom-rg> --follow

# Surveiller l'application
azd monitor --overview

# Nettoyer les ressources
azd down --force --purge
```

## Dépannage

### Problème : Échec de démarrage du conteneur

```bash
# Vérifiez les journaux en utilisant Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Voir les événements du conteneur
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testez localement
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problème : Impossible d’accéder au point de terminaison de l’application conteneurisée

```bash
# Vérifier la configuration de l'ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Vérifier si l'ingress interne est activé
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problème : Problèmes de performances

```bash
# Vérifier l'utilisation des ressources
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Augmenter les ressources
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Ressources supplémentaires et exemples
- [Exemple Microservices](./microservices/README.md)
- [Exemple Simple Flask API](./simple-flask-api/README.md)
- [Documentation Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galerie de modèles AZD](https://azure.github.io/awesome-azd/)
- [Exemples Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Modèles Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contribution

Pour contribuer de nouveaux exemples d'applications conteneurisées :

1. Créez un nouveau sous-répertoire avec votre exemple
2. Incluez des fichiers complets `azure.yaml`, `infra/` et `src/`
3. Ajoutez un README complet avec les instructions de déploiement
4. Testez le déploiement avec `azd up`
5. Soumettez une pull request

---

**Besoin d’aide ?** Rejoignez la communauté [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) pour du support et poser vos questions.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d’assurer la précision, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue natale doit être considéré comme la source faisant autorité. Pour des informations critiques, une traduction humaine professionnelle est recommandée. Nous ne pouvons être tenus responsables des malentendus ou des erreurs d’interprétation résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->