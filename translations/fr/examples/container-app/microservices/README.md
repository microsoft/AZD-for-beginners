<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "933ed5b10b761a61ac633494eb275d8c",
  "translation_date": "2025-11-19T12:51:38+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "fr"
}
-->
# Architecture de microservices - Exemple d'application conteneurisée

Une architecture de microservices prête pour la production déployée sur Azure Container Apps à l'aide de l'interface CLI AZD. Cet exemple illustre la communication entre services, la mise en file d'attente des messages et la traçabilité distribuée.

## Architecture

```
                    ┌─────────────────────────────┐
                    │  Azure Front Door (CDN)     │
                    └──────────────┬──────────────┘
                                   │
              ┌────────────────────┴────────────────────┐
              │                                         │
    ┌─────────▼─────────┐                   ┌─────────▼─────────┐
    │  API Gateway      │                   │   Web Frontend    │
    │  (Container App)  │                   │  (Container App)  │
    └─────────┬─────────┘                   └───────────────────┘
              │
       ┌──────┴──────┬──────────┬──────────┐
       │             │          │          │
┌──────▼──────┐ ┌───▼────┐ ┌───▼────┐ ┌───▼────┐
│ Product Svc │ │Order Svc│ │User Svc│ │Notify  │
│ (Container) │ │(Ctnr)   │ │(Ctnr)  │ │Svc     │
└──────┬──────┘ └───┬────┘ └───┬────┘ └───┬────┘
       │            │          │          │
┌──────▼──────────────▼──────────▼──────────▼─────┐
│         Azure Service Bus Queue                  │
│         (Async Communication)                    │
└──────────────────────────────────────────────────┘
       │            │          │
┌──────▼──────┐ ┌───▼────┐ ┌──▼──────┐
│ Cosmos DB   │ │SQL DB  │ │ Storage │
└─────────────┘ └────────┘ └─────────┘
```

## Fonctionnalités

✅ **Découverte de services** : Découverte automatique basée sur DNS entre les services  
✅ **Répartition de charge** : Répartition de charge intégrée entre les réplicas  
✅ **Auto-scaling** : Mise à l'échelle indépendante par service  
✅ **Surveillance de la santé** : Probes de vivacité et de disponibilité  
✅ **Traçabilité distribuée** : Intégration avec Application Insights  
✅ **File de messages** : Traitement asynchrone avec Service Bus  
✅ **Identité managée** : Accès sécurisé aux ressources Azure  
✅ **Déploiement Blue-Green** : Déploiements sans interruption  

## Prérequis

```bash
# Verify AZD installation
azd version

# Verify Azure CLI
az version

# Login to Azure
azd auth login
```

## Démarrage rapide

```bash
# Navigate to example
cd examples/container-app/microservices

# Initialize environment
azd env new production

# Configure settings
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_NAME production

# Deploy all services
azd up

# Verify deployment
azd show
```

## Structure du projet

```
microservices/
├── azure.yaml                    # AZD configuration
├── infra/
│   ├── main.bicep               # Main infrastructure
│   ├── main.parameters.json
│   ├── core/
│   │   ├── monitor.bicep        # Application Insights
│   │   ├── servicebus.bicep     # Service Bus
│   │   ├── cosmos.bicep         # Cosmos DB
│   │   └── sql.bicep            # SQL Database
│   └── app/
│       ├── container-env.bicep  # Container environment
│       ├── api-gateway.bicep
│       ├── product-service.bicep
│       ├── order-service.bicep
│       ├── user-service.bicep
│       └── notification-service.bicep
├── src/
│   ├── api-gateway/
│   │   ├── Dockerfile
│   │   ├── app.js
│   │   └── package.json
│   ├── product-service/
│   │   ├── Dockerfile
│   │   ├── main.py
│   │   └── requirements.txt
│   ├── order-service/
│   │   ├── Dockerfile
│   │   ├── Program.cs
│   │   └── OrderService.csproj
│   ├── user-service/
│   │   ├── Dockerfile
│   │   ├── main.go
│   │   └── go.mod
│   └── notification-service/
│       ├── Dockerfile
│       ├── handler.js
│       └── package.json
└── tests/
    ├── integration/
    └── load/
```

## Aperçu des services

### API Gateway (Node.js)

**Port** : 8080  
**Objectif** : Redirige les requêtes vers les microservices appropriés  
**Endpoints** :
- `GET /health` - Vérification de l'état
- `GET /api/products/*` - Routes du service produit
- `GET /api/orders/*` - Routes du service commande
- `GET /api/users/*` - Routes du service utilisateur

**Fonctionnalités** :
- Routage des requêtes
- Limitation de débit
- Authentification JWT
- Journalisation des requêtes/réponses

### Service Produit (Python)

**Port** : 8000  
**Base de données** : Cosmos DB  
**Objectif** : Gère le catalogue de produits  
**Endpoints** :
- `GET /products` - Liste des produits
- `GET /products/{id}` - Détails d'un produit
- `POST /products` - Création d'un produit
- `PUT /products/{id}` - Mise à jour d'un produit
- `DELETE /products/{id}` - Suppression d'un produit

### Service Commande (C#)

**Port** : 5000  
**Base de données** : Azure SQL  
**Objectif** : Traite et gère les commandes  
**Endpoints** :
- `GET /orders` - Liste des commandes
- `GET /orders/{id}` - Détails d'une commande
- `POST /orders` - Création d'une commande
- `PUT /orders/{id}/status` - Mise à jour du statut d'une commande

**Fonctionnalités** :
- Gestion des transactions
- Modèle Saga pour les transactions distribuées
- Publication d'événements sur Service Bus

### Service Utilisateur (Go)

**Port** : 9000  
**Base de données** : Cosmos DB  
**Objectif** : Authentification des utilisateurs et gestion des profils  
**Endpoints** :
- `POST /auth/login` - Connexion utilisateur
- `POST /auth/register` - Inscription utilisateur
- `GET /users/{id}` - Profil utilisateur
- `PUT /users/{id}` - Mise à jour du profil

### Service Notification (Node.js)

**Objectif** : Traite les événements de notification provenant de la file d'attente  
**Déclencheurs** : Messages Service Bus  
**Notifications** :
- Notifications par email
- Alertes SMS
- Notifications push

## Déploiement

### Déploiement complet (tous les services)

```bash
# Deploy infrastructure and all services
azd up
```

### Déployer un service individuel

```bash
# Deploy only product service
azd deploy product-service

# Deploy only order service
azd deploy order-service
```

### Déploiement Blue-Green

```bash
# Deploy new version without traffic
azd deploy product-service --revision-suffix v2 --no-traffic

# Test new version
curl https://product-service--v2.example.azurecontainerapps.io/health

# Gradually shift traffic (10% to v2)
az containerapp ingress traffic set \
  --name product-service \
  --resource-group rg-microservices \
  --revision-weight latest=90 v2=10

# Complete cutover
az containerapp ingress traffic set \
  --name product-service \
  --resource-group rg-microservices \
  --revision-weight v2=100
```

## Configuration

### Variables d'environnement

```bash
# API Gateway
azd env set GATEWAY_PORT 8080
azd env set JWT_SECRET "your-secret-key"
azd env set RATE_LIMIT_REQUESTS 1000

# Product Service
azd env set COSMOS_DATABASE products
azd env set COSMOS_CONTAINER items

# Order Service
azd env set SQL_DATABASE orders
azd env set SQL_CONNECTION_TIMEOUT 30

# User Service
azd env set JWT_EXPIRATION 3600
azd env set BCRYPT_ROUNDS 10
```

### Configuration de mise à l'échelle

```bash
# Set scaling rules per service
azd env set PRODUCT_MIN_REPLICAS 2
azd env set PRODUCT_MAX_REPLICAS 20

azd env set ORDER_MIN_REPLICAS 3
azd env set ORDER_MAX_REPLICAS 30
```

## Communication entre services

### Communication synchrone (HTTP)

Les services communiquent en utilisant des noms DNS internes :

```javascript
// From API Gateway to Product Service
const response = await fetch('http://product-service/products');

// From Order Service to User Service
const user = await httpClient.get('http://user-service/users/123');
```

### Communication asynchrone (Service Bus)

```python
# Product Service publishes event
from azure.servicebus import ServiceBusClient, ServiceBusMessage

async def publish_product_created(product_id):
    async with ServiceBusClient.from_connection_string(
        conn_str, transport_type=TransportType.AmqpOverWebsocket
    ) as client:
        sender = client.get_queue_sender('product-events')
        message = ServiceBusMessage(json.dumps({
            'event': 'ProductCreated',
            'productId': product_id,
            'timestamp': datetime.utcnow().isoformat()
        }))
        await sender.send_messages(message)
```

```javascript
// Notification Service subscribes
const { ServiceBusClient } = require('@azure/service-bus');

async function processMessages() {
    const receiver = client.createReceiver('product-events');
    
    receiver.subscribe({
        processMessage: async (message) => {
            const event = JSON.parse(message.body);
            await sendNotification(event);
        }
    });
}
```

## Surveillance

### Voir tous les journaux des services

```bash
# Stream logs from all services
azd logs --follow

# View logs for specific service
azd logs product-service --tail 100
```

### Requêtes Application Insights

```kusto
// Find slow requests across all services
requests
| where duration > 1000
| summarize count() by name, cloud_RoleName
| order by count_ desc

// Track service dependencies
dependencies
| where timestamp > ago(1h)
| summarize count() by target, name
| order by count_ desc

// Error rate by service
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName
```

### Tableau de bord des métriques personnalisées

```bash
# Open monitoring dashboard
azd monitor --overview

# View specific metrics
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.product-service.resourceId') \
  --metric "Requests,CPUPercentage,MemoryPercentage"
```

## Tests

### Tests d'intégration

```bash
# Run integration test suite
cd tests/integration
npm install
npm test

# Test specific service
npm test -- --service=product-service
```

### Tests de charge

```bash
# Install Azure Load Testing CLI extension
az extension add --name load

# Run load test
cd tests/load
az load test create \
  --name microservices-load-test \
  --test-plan-file loadtest.jmx \
  --engine-instances 10

# View results
az load test show --name microservices-load-test
```

### Scénario de test de bout en bout

```bash
# Create user
USER_ID=$(curl -X POST \
  $(azd show --output json | jq -r '.services.api-gateway.endpoint')/api/users \
  -H "Content-Type: application/json" \
  -d '{"email": "test@example.com", "name": "Test User"}' \
  | jq -r '.id')

# Create product
PRODUCT_ID=$(curl -X POST \
  $(azd show --output json | jq -r '.services.api-gateway.endpoint')/api/products \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Product", "price": 29.99}' \
  | jq -r '.id')

# Create order
ORDER_ID=$(curl -X POST \
  $(azd show --output json | jq -r '.services.api-gateway.endpoint')/api/orders \
  -H "Content-Type: application/json" \
  -d "{\"userId\": \"$USER_ID\", \"productId\": \"$PRODUCT_ID\", \"quantity\": 2}" \
  | jq -r '.id')

# Verify order
curl $(azd show --output json | jq -r '.services.api-gateway.endpoint')/api/orders/$ORDER_ID
```

## Optimisation des performances

### Activer HTTP/2

```bicep
resource apiGateway 'Microsoft.App/containerApps@2023-05-01' = {
  properties: {
    configuration: {
      ingress: {
        transport: 'http2'
      }
    }
  }
}
```

### Pooling de connexions

```python
# Product Service - Reuse Cosmos DB client
from azure.cosmos import CosmosClient

class Database:
    _client = None
    
    @classmethod
    def get_client(cls):
        if not cls._client:
            cls._client = CosmosClient(url, credential)
        return cls._client
```

### Stratégie de mise en cache

```javascript
// API Gateway - Redis cache integration
const redis = require('redis');
const client = redis.createClient({
  socket: {
    host: process.env.REDIS_HOST,
    port: 6379
  }
});

async function getCachedProduct(id) {
  const cached = await client.get(`product:${id}`);
  if (cached) return JSON.parse(cached);
  
  const product = await fetchFromService(id);
  await client.setEx(`product:${id}`, 3600, JSON.stringify(product));
  return product;
}
```

## Sécurité

### Configuration de l'identité managée

```bicep
// Enable managed identity for all services
resource productService 'Microsoft.App/containerApps@2023-05-01' = {
  identity: {
    type: 'SystemAssigned'
  }
}

// Grant access to Cosmos DB
resource cosmosRoleAssignment 'Microsoft.DocumentDB/databaseAccounts/sqlRoleAssignments@2023-04-15' = {
  parent: cosmosAccount
  name: guid(productService.id, cosmosAccount.id)
  properties: {
    principalId: productService.identity.principalId
    roleDefinitionId: cosmosBuiltInDataContributor.id
  }
}
```

### Sécurité réseau

```bicep
// Internal ingress for backend services
resource orderService 'Microsoft.App/containerApps@2023-05-01' = {
  properties: {
    configuration: {
      ingress: {
        external: false  // Only accessible within Container Apps environment
        targetPort: 5000
      }
    }
  }
}
```

### Rotation des clés API

```bash
# Rotate API keys using Key Vault
az keyvault secret set \
  --vault-name kv-microservices \
  --name api-gateway-key \
  --value $(openssl rand -base64 32)

# Trigger rolling restart
azd deploy api-gateway
```

## Dépannage

### Un service ne peut pas communiquer

```bash
# Verify service discovery
az containerapp show --name product-service --resource-group rg-microservices \
  --query properties.configuration.ingress.fqdn

# Test internal connectivity
az containerapp exec --name api-gateway --resource-group rg-microservices \
  --command "curl http://product-service/health"
```

### Latence élevée entre les services

```bash
# Check service location
az containerapp show --name product-service --resource-group rg-microservices \
  --query location

# Ensure all services are in same region and environment
```

### Accumulation dans la file de messages

```bash
# Check Service Bus metrics
az monitor metrics list \
  --resource-id $(az servicebus namespace show --name sb-microservices --resource-group rg-microservices --query id -o tsv) \
  --metric "ActiveMessages" \
  --start-time $(date -u -d '1 hour ago' +%Y-%m-%dT%H:%M:%SZ)

# Scale up notification service
az containerapp update \
  --name notification-service \
  --resource-group rg-microservices \
  --min-replicas 5 \
  --max-replicas 30
```

## Analyse des coûts

### Coûts mensuels estimés (production)

| Ressource | Configuration | Coût estimé |
|-----------|---------------|-------------|
| API Gateway | 2-10 réplicas, 1 vCPU, 2GB RAM | $50-200 |
| Service Produit | 2-20 réplicas, 0.5 vCPU, 1GB RAM | $40-300 |
| Service Commande | 3-30 réplicas, 1 vCPU, 2GB RAM | $100-500 |
| Service Utilisateur | 2-15 réplicas, 0.5 vCPU, 1GB RAM | $40-250 |
| Service Notification | 1-10 réplicas, 0.25 vCPU, 0.5GB RAM | $20-100 |
| Cosmos DB | 400 RU/s, 10GB stockage | $24 |
| Azure SQL | Niveau basique | $5 |
| Service Bus | Niveau standard | $10 |
| Application Insights | 5GB/mois | $10 |
| **Total** | | **$299-1,399/mois** |

### Conseils pour optimiser les coûts

```bash
# Use scale-to-zero for non-critical services
azd env set NOTIFICATION_MIN_REPLICAS 0

# Use consumption-based Cosmos DB
azd env set COSMOS_THROUGHPUT_MODE serverless

# Enable request-based autoscaling
azd env set SCALE_RULE_TYPE http
azd env set CONCURRENT_REQUESTS 100
```

## Nettoyage

```bash
# Remove all resources
azd down --force --purge
```

## Prochaines étapes

- Ajouter [API Management](https://learn.microsoft.com/azure/api-management/) pour des fonctionnalités avancées de passerelle  
- Implémenter [Dapr](https://dapr.io/) pour les capacités de maillage de services  
- Ajouter [Azure Front Door](https://learn.microsoft.com/azure/frontdoor/) pour la répartition de charge globale  
- Configurer [Azure Monitor Workbooks](https://learn.microsoft.com/azure/azure-monitor/visualize/workbooks-overview) pour des tableaux de bord personnalisés  

## Ressources supplémentaires

- [Guide d'architecture de microservices](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)  
- [Bonnes pratiques pour les applications conteneurisées](https://learn.microsoft.com/azure/container-apps)  
- [Traçabilité distribuée avec Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->