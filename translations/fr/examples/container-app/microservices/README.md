# Architecture de microservices - Exemple d'application conteneurisée

⏱️ **Temps estimé** : 25-35 minutes | 💰 **Coût estimé** : ~50-100 $/mois | ⭐ **Complexité** : Avancée

Une **architecture de microservices simplifiée mais fonctionnelle** déployée sur Azure Container Apps à l'aide de l'interface CLI AZD. Cet exemple illustre la communication entre services, l'orchestration des conteneurs et la surveillance avec une configuration pratique de 2 services.

> **📚 Approche pédagogique** : Cet exemple commence par une architecture minimale de 2 services (API Gateway + Backend Service) que vous pouvez réellement déployer et apprendre. Une fois cette base maîtrisée, nous fournissons des conseils pour étendre vers un écosystème complet de microservices.

## Ce que vous apprendrez

En complétant cet exemple, vous allez :
- Déployer plusieurs conteneurs sur Azure Container Apps
- Implémenter la communication entre services avec un réseau interne
- Configurer la mise à l'échelle basée sur l'environnement et les vérifications de santé
- Surveiller les applications distribuées avec Application Insights
- Comprendre les modèles de déploiement de microservices et les meilleures pratiques
- Apprendre à passer progressivement d'architectures simples à complexes

## Architecture

### Phase 1 : Ce que nous construisons (inclus dans cet exemple)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Pourquoi commencer simplement ?**
- ✅ Déployer et comprendre rapidement (25-35 minutes)
- ✅ Apprendre les modèles de microservices essentiels sans complexité
- ✅ Code fonctionnel que vous pouvez modifier et expérimenter
- ✅ Coût réduit pour l'apprentissage (~50-100 $/mois contre 300-1400 $/mois)
- ✅ Gagner en confiance avant d'ajouter des bases de données et des files de messages

**Analogie** : Pensez à cela comme apprendre à conduire. Vous commencez dans un parking vide (2 services), maîtrisez les bases, puis progressez vers la circulation urbaine (5+ services avec bases de données).

### Phase 2 : Expansion future (architecture de référence)

Une fois que vous maîtrisez l'architecture à 2 services, vous pouvez l'étendre à :

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Voir la section "Guide d'expansion" à la fin pour des instructions étape par étape.

## Fonctionnalités incluses

✅ **Découverte de services** : Découverte automatique basée sur DNS entre conteneurs  
✅ **Répartition de charge** : Répartition de charge intégrée entre les réplicas  
✅ **Auto-scaling** : Mise à l'échelle indépendante par service basée sur les requêtes HTTP  
✅ **Surveillance de la santé** : Probes de vivacité et de disponibilité pour les deux services  
✅ **Journalisation distribuée** : Journalisation centralisée avec Application Insights  
✅ **Réseau interne** : Communication sécurisée entre services  
✅ **Orchestration de conteneurs** : Déploiement et mise à l'échelle automatiques  
✅ **Mises à jour sans interruption** : Mises à jour progressives avec gestion des révisions  

## Prérequis

### Outils requis

Avant de commencer, vérifiez que vous avez ces outils installés :

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 ou supérieure)
   ```bash
   azd version
   # Résultat attendu : version azd 1.0.0 ou supérieure
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 ou supérieure)
   ```bash
   az --version
   # Résultat attendu : azure-cli 2.50.0 ou supérieur
   ```

3. **[Docker](https://www.docker.com/get-started)** (pour le développement/test local - optionnel)
   ```bash
   docker --version
   # Résultat attendu : version Docker 20.10 ou supérieure
   ```

### Exigences Azure

- Un **abonnement Azure** actif ([créez un compte gratuit](https://azure.microsoft.com/free/))
- Permissions pour créer des ressources dans votre abonnement
- Rôle **Contributeur** sur l'abonnement ou le groupe de ressources

### Connaissances requises

Ceci est un exemple de **niveau avancé**. Vous devriez avoir :
- Complété l'[exemple Simple Flask API](../../../../../examples/container-app/simple-flask-api) 
- Une compréhension de base de l'architecture de microservices
- Une familiarité avec les API REST et HTTP
- Une compréhension des concepts de conteneurs

**Nouveau sur Container Apps ?** Commencez par l'[exemple Simple Flask API](../../../../../examples/container-app/simple-flask-api) pour apprendre les bases.

## Démarrage rapide (étape par étape)

### Étape 1 : Cloner et naviguer

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Vérification de succès** : Vérifiez que vous voyez `azure.yaml` :
```bash
ls
# Attendu : README.md, azure.yaml, infra/, src/
```

### Étape 2 : Authentifiez-vous avec Azure

```bash
azd auth login
```

Cela ouvre votre navigateur pour l'authentification Azure. Connectez-vous avec vos identifiants Azure.

**✓ Vérification de succès** : Vous devriez voir :
```
Logged in to Azure.
```

### Étape 3 : Initialisez l'environnement

```bash
azd init
```

**Invites que vous verrez** :
- **Nom de l'environnement** : Entrez un nom court (ex. : `microservices-dev`)
- **Abonnement Azure** : Sélectionnez votre abonnement
- **Emplacement Azure** : Choisissez une région (ex. : `eastus`, `westeurope`)

**✓ Vérification de succès** : Vous devriez voir :
```
SUCCESS: New project initialized!
```

### Étape 4 : Déployez l'infrastructure et les services

```bash
azd up
```

**Ce qui se passe** (prend 8-12 minutes) :
1. Crée l'environnement Container Apps
2. Crée Application Insights pour la surveillance
3. Construit le conteneur API Gateway (Node.js)
4. Construit le conteneur Product Service (Python)
5. Déploie les deux conteneurs sur Azure
6. Configure le réseau et les vérifications de santé
7. Configure la surveillance et la journalisation

**✓ Vérification de succès** : Vous devriez voir :
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Temps** : 8-12 minutes

### Étape 5 : Testez le déploiement

```bash
# Obtenir le point de terminaison de la passerelle
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Tester la santé de l'API Gateway
curl $GATEWAY_URL/health

# Résultat attendu :
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testez le service produit via la passerelle** :
```bash
# Lister les produits
curl $GATEWAY_URL/api/products

# Résultat attendu :
# [
#   {"id":1,"name":"Ordinateur portable","price":999.99,"stock":50},
#   {"id":2,"name":"Souris","price":29.99,"stock":200},
#   {"id":3,"name":"Clavier","price":79.99,"stock":150}
# ]
```

**✓ Vérification de succès** : Les deux points de terminaison renvoient des données JSON sans erreurs.

---

**🎉 Félicitations !** Vous avez déployé une architecture de microservices sur Azure !

## Structure du projet

Tous les fichiers d'implémentation sont inclus—c'est un exemple complet et fonctionnel :

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Ce que chaque composant fait :**

**Infrastructure (infra/)** :
- `main.bicep` : Orchestre toutes les ressources Azure et leurs dépendances
- `core/container-apps-environment.bicep` : Crée l'environnement Container Apps et Azure Container Registry
- `core/monitor.bicep` : Configure Application Insights pour la journalisation distribuée
- `app/*.bicep` : Définitions individuelles des applications conteneurisées avec mise à l'échelle et vérifications de santé

**API Gateway (src/api-gateway/)** :
- Service public qui route les requêtes vers les services backend
- Implémente la journalisation, la gestion des erreurs et le transfert des requêtes
- Illustre la communication HTTP entre services

**Product Service (src/product-service/)** :
- Service interne avec un catalogue de produits (en mémoire pour simplifier)
- API REST avec vérifications de santé
- Exemple de modèle de microservice backend

## Aperçu des services

### API Gateway (Node.js/Express)

**Port** : 8080  
**Accès** : Public (ingress externe)  
**Objectif** : Route les requêtes entrantes vers les services backend appropriés  

**Points de terminaison** :
- `GET /` - Informations sur le service
- `GET /health` - Point de terminaison de vérification de santé
- `GET /api/products` - Transfert vers le service produit (liste complète)
- `GET /api/products/:id` - Transfert vers le service produit (par ID)

**Caractéristiques principales** :
- Routage des requêtes avec axios
- Journalisation centralisée
- Gestion des erreurs et des délais d'attente
- Découverte de services via des variables d'environnement
- Intégration avec Application Insights

**Extrait de code** (`src/api-gateway/app.js`) :
```javascript
// Communication interne entre services
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port** : 8000  
**Accès** : Interne uniquement (pas d'ingress externe)  
**Objectif** : Gère le catalogue de produits avec des données en mémoire  

**Points de terminaison** :
- `GET /` - Informations sur le service
- `GET /health` - Point de terminaison de vérification de santé
- `GET /products` - Liste complète des produits
- `GET /products/<id>` - Obtenir un produit par ID

**Caractéristiques principales** :
- API RESTful avec Flask
- Stockage de produits en mémoire (simple, pas de base de données nécessaire)
- Surveillance de la santé avec probes
- Journalisation structurée
- Intégration avec Application Insights

**Modèle de données** :
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Pourquoi interne uniquement ?**
Le service produit n'est pas exposé publiquement. Toutes les requêtes doivent passer par l'API Gateway, ce qui offre :
- Sécurité : Point d'accès contrôlé
- Flexibilité : Possibilité de modifier le backend sans impacter les clients
- Surveillance : Journalisation centralisée des requêtes

## Comprendre la communication entre services

### Comment les services communiquent entre eux

Dans cet exemple, l'API Gateway communique avec le Product Service via des **appels HTTP internes** :

```javascript
// Passerelle API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Faire une requête HTTP interne
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Points clés** :

1. **Découverte basée sur DNS** : Container Apps fournit automatiquement un DNS pour les services internes
   - FQDN du Product Service : `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplifié en : `http://product-service` (Container Apps le résout)

2. **Pas d'exposition publique** : Le Product Service a `external: false` dans Bicep
   - Accessible uniquement dans l'environnement Container Apps
   - Impossible à atteindre depuis Internet

3. **Variables d'environnement** : Les URL des services sont injectées au moment du déploiement
   - Bicep transmet le FQDN interne à la passerelle
   - Pas d'URL codées en dur dans le code de l'application

**Analogie** : Pensez à cela comme des bureaux. L'API Gateway est la réception (publique), et le Product Service est un bureau interne (privé). Les visiteurs doivent passer par la réception pour accéder à un bureau.

## Options de déploiement

### Déploiement complet (recommandé)

```bash
# Déployer l'infrastructure et les deux services
azd up
```

Cela déploie :
1. Environnement Container Apps
2. Application Insights
3. Container Registry
4. Conteneur API Gateway
5. Conteneur Product Service

**Temps** : 8-12 minutes

### Déployer un service individuel

```bash
# Déployez uniquement un service (après le premier azd up)
azd deploy api-gateway

# Ou déployez le service produit
azd deploy product-service
```

**Cas d'utilisation** : Lorsque vous avez mis à jour le code d'un service et souhaitez redéployer uniquement ce service.

### Mettre à jour la configuration

```bash
# Modifier les paramètres de mise à l'échelle
azd env set GATEWAY_MAX_REPLICAS 30

# Redéployer avec une nouvelle configuration
azd up
```

## Configuration

### Configuration de la mise à l'échelle

Les deux services sont configurés avec une mise à l'échelle basée sur HTTP dans leurs fichiers Bicep :

**API Gateway** :
- Réplicas minimum : 2 (toujours au moins 2 pour la disponibilité)
- Réplicas maximum : 20
- Déclencheur de mise à l'échelle : 50 requêtes concurrentes par réplique

**Product Service** :
- Réplicas minimum : 1 (peut passer à zéro si nécessaire)
- Réplicas maximum : 10
- Déclencheur de mise à l'échelle : 100 requêtes concurrentes par réplique

**Personnaliser la mise à l'échelle** (dans `infra/app/*.bicep`) :
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Allocation des ressources

**API Gateway** :
- CPU : 1.0 vCPU
- Mémoire : 2 GiB
- Raison : Gère tout le trafic externe

**Product Service** :
- CPU : 0.5 vCPU
- Mémoire : 1 GiB
- Raison : Opérations légères en mémoire

### Vérifications de santé

Les deux services incluent des probes de vivacité et de disponibilité :

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Ce que cela signifie** :
- **Vivacité** : Si la vérification échoue, Container Apps redémarre le conteneur
- **Disponibilité** : Si non prêt, Container Apps arrête de router le trafic vers cette réplique

## Surveillance et observabilité

### Voir les journaux des services

```bash
# Diffuser les journaux depuis API Gateway
azd logs api-gateway --follow

# Voir les journaux récents du service produit
azd logs product-service --tail 100

# Voir tous les journaux des deux services
azd logs --follow
```

**Résultat attendu** :
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Requêtes Application Insights

Accédez à Application Insights dans le portail Azure, puis exécutez ces requêtes :

**Trouver les requêtes lentes** :
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Suivre les appels entre services** :
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Taux d'erreur par service** :
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volume de requêtes au fil du temps** :
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Accéder au tableau de bord de surveillance

```bash
# Obtenir les détails d'Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Ouvrir la surveillance du portail Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Métriques en temps réel

1. Accédez à Application Insights dans le portail Azure
2. Cliquez sur "Métriques en temps réel"
3. Consultez les requêtes, échecs et performances en temps réel
4. Testez en exécutant : `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Exercices pratiques

[Note : Voir les exercices complets ci-dessus dans la section "Exercices pratiques" pour des exercices détaillés étape par étape, y compris la vérification du déploiement, la modification des données, les tests de mise à l'échelle automatique, la gestion des erreurs et l'ajout d'un troisième service.]

## Analyse des coûts

### Coûts mensuels estimés (pour cet exemple à 2 services)

| Ressource | Configuration | Coût estimé |
|-----------|---------------|-------------|
| API Gateway | 2-20 réplicas, 1 vCPU, 2GB RAM | 30-150 $ |
| Product Service | 1-10 réplicas, 0.5 vCPU, 1GB RAM | 15-75 $ |
| Container Registry | Niveau basique | 5 $ |
| Application Insights | 1-2 GB/mois | 5-10 $ |
| Log Analytics | 1 GB/mois | 3 $ |
| **Total** | | **58-243 $/mois** |

**Répartition des coûts par utilisation** :
- **Faible trafic** (test/apprentissage) : ~60 $/mois
- **Trafic modéré** (petite production) : ~120 $/mois
- **Trafic élevé** (périodes chargées) : ~240 $/mois

### Conseils pour optimiser les coûts

1. **Mise à l'échelle à zéro pour le développement** :
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Utiliser le plan de consommation pour Cosmos DB** (lorsque vous l'ajoutez) :
   - Payez uniquement ce que vous utilisez
   - Pas de frais minimum

3. **Configurer l'échantillonnage Application Insights** :
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Échantillonner 50% des requêtes
   ```

4. **Nettoyer lorsque non nécessaire** :
   ```bash
   azd down
   ```

### Options de niveau gratuit
Pour apprendre/tester, envisagez :
- Utiliser les crédits gratuits Azure (premiers 30 jours)
- Limiter le nombre de réplicas au minimum
- Supprimer après les tests (pas de frais récurrents)

---

## Nettoyage

Pour éviter des frais récurrents, supprimez toutes les ressources :

```bash
azd down --force --purge
```

**Invite de confirmation** :
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Tapez `y` pour confirmer.

**Ce qui est supprimé** :
- Environnement des applications de conteneur
- Les deux applications de conteneur (passerelle et service produit)
- Registre de conteneurs
- Application Insights
- Espace de travail Log Analytics
- Groupe de ressources

**✓ Vérifiez le nettoyage** :
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Devrait retourner vide.

---

## Guide d'expansion : De 2 à 5+ services

Une fois que vous avez maîtrisé cette architecture à 2 services, voici comment l'étendre :

### Phase 1 : Ajouter une persistance de base de données (prochaine étape)

**Ajoutez Cosmos DB pour le service produit** :

1. Créez `infra/core/cosmos.bicep` :
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Mettez à jour le service produit pour utiliser Cosmos DB au lieu des données en mémoire

3. Coût supplémentaire estimé : ~25 $/mois (sans serveur)

### Phase 2 : Ajouter un troisième service (gestion des commandes)

**Créez un service de commande** :

1. Nouveau dossier : `src/order-service/` (Python/Node.js/C#)
2. Nouveau fichier Bicep : `infra/app/order-service.bicep`
3. Mettez à jour la passerelle API pour router `/api/orders`
4. Ajoutez une base de données Azure SQL pour la persistance des commandes

**L'architecture devient** :
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Phase 3 : Ajouter une communication asynchrone (Service Bus)

**Implémentez une architecture orientée événements** :

1. Ajoutez Azure Service Bus : `infra/core/servicebus.bicep`
2. Le service produit publie des événements "ProductCreated"
3. Le service de commande s'abonne aux événements produits
4. Ajoutez un service de notification pour traiter les événements

**Modèle** : Requête/Réponse (HTTP) + Orienté événements (Service Bus)

### Phase 4 : Ajouter une authentification utilisateur

**Implémentez un service utilisateur** :

1. Créez `src/user-service/` (Go/Node.js)
2. Ajoutez Azure AD B2C ou une authentification JWT personnalisée
3. La passerelle API valide les jetons
4. Les services vérifient les permissions des utilisateurs

### Phase 5 : Préparation à la production

**Ajoutez ces composants** :
- Azure Front Door (répartition de charge globale)
- Azure Key Vault (gestion des secrets)
- Azure Monitor Workbooks (tableaux de bord personnalisés)
- Pipeline CI/CD (GitHub Actions)
- Déploiements Blue-Green
- Identité gérée pour tous les services

**Coût total de l'architecture en production** : ~300-1 400 $/mois

---

## En savoir plus

### Documentation associée
- [Documentation Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Guide d'architecture microservices](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights pour le traçage distribué](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Prochaines étapes dans ce cours
- ← Précédent : [API Flask simple](../../../../../examples/container-app/simple-flask-api) - Exemple débutant avec un conteneur unique
- → Suivant : [Guide d'intégration AI](../../../../../examples/docs/ai-foundry) - Ajouter des capacités AI
- 🏠 [Accueil du cours](../../README.md)

### Comparaison : Quand utiliser quoi

**Application de conteneur unique** (Exemple API Flask simple) :
- ✅ Applications simples
- ✅ Architecture monolithique
- ✅ Déploiement rapide
- ❌ Évolutivité limitée
- **Coût** : ~15-50 $/mois

**Microservices** (Cet exemple) :
- ✅ Applications complexes
- ✅ Évolutivité indépendante par service
- ✅ Autonomie des équipes (différents services, différentes équipes)
- ❌ Gestion plus complexe
- **Coût** : ~60-250 $/mois

**Kubernetes (AKS)** :
- ✅ Contrôle et flexibilité maximum
- ✅ Portabilité multi-cloud
- ✅ Réseautage avancé
- ❌ Nécessite une expertise Kubernetes
- **Coût** : ~150-500 $/mois minimum

**Recommandation** : Commencez avec les applications de conteneur (cet exemple), passez à AKS uniquement si vous avez besoin de fonctionnalités spécifiques à Kubernetes.

---

## Questions fréquentes

**Q : Pourquoi seulement 2 services au lieu de 5+ ?**  
R : Progression éducative. Maîtrisez les fondamentaux (communication entre services, surveillance, mise à l'échelle) avec un exemple simple avant d'ajouter de la complexité. Les modèles que vous apprenez ici s'appliquent aux architectures à 100 services.

**Q : Puis-je ajouter moi-même plus de services ?**  
R : Absolument ! Suivez le guide d'expansion ci-dessus. Chaque nouveau service suit le même modèle : créer un dossier src, créer un fichier Bicep, mettre à jour azure.yaml, déployer.

**Q : Est-ce prêt pour la production ?**  
R : C'est une base solide. Pour la production, ajoutez : identité gérée, Key Vault, bases de données persistantes, pipeline CI/CD, alertes de surveillance et stratégie de sauvegarde.

**Q : Pourquoi ne pas utiliser Dapr ou un autre service mesh ?**  
R : Gardez-le simple pour l'apprentissage. Une fois que vous comprenez le réseau natif des applications de conteneur, vous pouvez ajouter Dapr pour des scénarios avancés.

**Q : Comment déboguer localement ?**  
R : Exécutez les services localement avec Docker :
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q : Puis-je utiliser différents langages de programmation ?**  
R : Oui ! Cet exemple montre Node.js (passerelle) + Python (service produit). Vous pouvez mélanger tous les langages qui s'exécutent dans des conteneurs.

**Q : Que faire si je n'ai pas de crédits Azure ?**  
R : Utilisez le niveau gratuit Azure (premiers 30 jours avec de nouveaux comptes) ou déployez pour de courtes périodes de test et supprimez immédiatement.

---

> **🎓 Résumé du parcours d'apprentissage** : Vous avez appris à déployer une architecture multi-services avec mise à l'échelle automatique, réseau interne, surveillance centralisée et modèles prêts pour la production. Cette base vous prépare aux systèmes distribués complexes et aux architectures microservices d'entreprise.

**📚 Navigation du cours** :
- ← Précédent : [API Flask simple](../../../../../examples/container-app/simple-flask-api)
- → Suivant : [Exemple d'intégration de base de données](../../../../../examples/database-app)
- 🏠 [Accueil du cours](../../README.md)
- 📖 [Meilleures pratiques pour les applications de conteneur](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->