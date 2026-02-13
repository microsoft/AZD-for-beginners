# Architecture Microservices - Exemple d'Application Conteneurisée

⏱️ **Temps estimé** : 25-35 minutes | 💰 **Coût estimé** : ~50-100$/mois | ⭐ **Complexité** : Avancé

Une architecture microservices **simplifiée mais fonctionnelle** déployée sur Azure Container Apps à l'aide de l'AZD CLI. Cet exemple illustre la communication service-à-service, l'orchestration de conteneurs et la supervision avec une configuration pratique à 2 services.

> **📚 Approche d'apprentissage** : Cet exemple commence par une architecture minimale à 2 services (API Gateway + Service Backend) que vous pouvez réellement déployer et étudier. Après avoir maîtrisé cette base, nous fournissons des conseils pour étendre vers un écosystème microservices complet.

## Ce que vous apprendrez

En réalisant cet exemple, vous allez :
- Déployer plusieurs conteneurs sur Azure Container Apps
- Mettre en œuvre la communication service-à-service avec un réseau interne
- Configurer la montée en charge basée sur l’environnement et les contrôles de santé
- Surveiller les applications distribuées avec Application Insights
- Comprendre les modèles de déploiement microservices et les bonnes pratiques
- Apprendre l’extension progressive, des architectures simples aux complexes

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

**Pourquoi commencer simple ?**
- ✅ Déployer et comprendre rapidement (25-35 minutes)
- ✅ Apprendre les modèles de base des microservices sans complexité
- ✅ Code fonctionnel que vous pouvez modifier et expérimenter
- ✅ Coût réduit pour apprendre (~50-100$/mois contre 300-1400$/mois)
- ✅ Construire la confiance avant d’ajouter bases de données et files de messages

**Analogie** : C’est comme apprendre à conduire. Vous commencez sur un parking vide (2 services), maîtrisez les bases, puis passez à la circulation urbaine (5+ services avec bases de données).

### Phase 2 : Extension future (Architecture de référence)

Une fois que vous maîtrisez l’architecture à 2 services, vous pouvez étendre vers :

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

Voir la section "Guide d’extension" à la fin pour des instructions détaillées.

## Fonctionnalités incluses

✅ **Découverte de services** : Découverte automatique basée sur DNS entre conteneurs  
✅ **Équilibrage de charge** : Équilibrage de charge intégré entre répliques  
✅ **Mise à l’échelle automatique** : Mise à l’échelle indépendante par service basée sur les requêtes HTTP  
✅ **Surveillance de santé** : Probes de liveness et readiness pour les deux services  
✅ **Journalisation distribuée** : Journalisation centralisée avec Application Insights  
✅ **Réseau interne** : Communication sécurisée service-à-service  
✅ **Orchestration des conteneurs** : Déploiement et mise à l’échelle automatiques  
✅ **Mises à jour sans interruption** : Mises à jour progressives avec gestion des révisions  

## Prérequis

### Outils nécessaires

Avant de commencer, vérifiez que vous avez ces outils installés :

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 ou supérieure)
   ```bash
   azd version
   # Sortie attendue : azd version 1.0.0 ou supérieure
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 ou supérieure)
   ```bash
   az --version
   # Sortie attendue : azure-cli 2.50.0 ou supérieure
   ```

3. **[Docker](https://www.docker.com/get-started)** (pour développement/test local - optionnel)
   ```bash
   docker --version
   # Sortie attendue : version Docker 20.10 ou supérieure
   ```

### Exigences Azure

- Un **abonnement Azure** actif ([créez un compte gratuit](https://azure.microsoft.com/free/))
- Permissions pour créer des ressources dans votre abonnement
- Rôle **Contributeur** sur l’abonnement ou groupe de ressources

### Prérequis de connaissances

C’est un exemple de niveau **avancé**. Vous devez avoir :
- Réalisé l’exemple [Simple Flask API](../../../../../examples/container-app/simple-flask-api)  
- Compréhension de base de l’architecture microservices
- Familiarité avec les API REST et HTTP
- Compréhension des concepts de conteneurs

**Nouveau sur Container Apps ?** Commencez par l’exemple [Simple Flask API](../../../../../examples/container-app/simple-flask-api) pour apprendre les bases.

## Démarrage rapide (Étape par étape)

### Étape 1 : Cloner et se déplacer

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Vérification de réussite** : Vérifiez que vous voyez `azure.yaml` :
```bash
ls
# Attendu : README.md, azure.yaml, infra/, src/
```

### Étape 2 : Authentification Azure

```bash
azd auth login
```

Cela ouvre votre navigateur pour l’authentification Azure. Connectez-vous avec vos identifiants Azure.

**✓ Vérification de réussite** : Vous devriez voir :
```
Logged in to Azure.
```

### Étape 3 : Initialiser l’environnement

```bash
azd init
```

**Invites que vous verrez** :
- **Nom de l’environnement** : Entrez un nom court (ex. `microservices-dev`)
- **Abonnement Azure** : Sélectionnez votre abonnement
- **Région Azure** : Choisissez une région (ex. `eastus`, `westeurope`)

**✓ Vérification de réussite** : Vous devriez voir :
```
SUCCESS: New project initialized!
```

### Étape 4 : Déployer l’infrastructure et les services

```bash
azd up
```

**Ce qui se passe** (prend 8-12 minutes) :
1. Création de l’environnement Container Apps
2. Création d’Application Insights pour la supervision
3. Construction du conteneur API Gateway (Node.js)
4. Construction du conteneur Product Service (Python)
5. Déploiement des deux conteneurs sur Azure
6. Configuration du réseau et des probes de santé
7. Mise en place de la supervision et journalisation

**✓ Vérification de réussite** : Vous devriez voir :
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Temps** : 8-12 minutes

### Étape 5 : Tester le déploiement

```bash
# Obtenir le point de terminaison de la passerelle
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Tester la santé de l'API Gateway
curl $GATEWAY_URL/health

# Sortie attendue :
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Tester le service produit via la passerelle** :
```bash
# Lister les produits
curl $GATEWAY_URL/api/products

# Sortie attendue :
# [
#   {"id":1,"name":"Ordinateur portable","price":999.99,"stock":50},
#   {"id":2,"name":"Souris","price":29.99,"stock":200},
#   {"id":3,"name":"Clavier","price":79.99,"stock":150}
# ]
```

**✓ Vérification de réussite** : Les deux points de terminaison renvoient des données JSON sans erreur.

---

**🎉 Félicitations !** Vous avez déployé une architecture microservices sur Azure !

## Structure du projet

Tous les fichiers d’implémentation sont inclus – voici un exemple complet et fonctionnel :

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

**Fonction de chaque composant :**

**Infrastructure (infra/)** :
- `main.bicep` : Orchestration de toutes les ressources Azure et leurs dépendances
- `core/container-apps-environment.bicep` : Crée l’environnement Container Apps et le registre de conteneurs Azure
- `core/monitor.bicep` : Configure Application Insights pour la journalisation distribuée
- `app/*.bicep` : Définitions des applications conteneurisées individuelles avec mise à l’échelle et probes de santé

**API Gateway (src/api-gateway/)** :
- Service public qui route les requêtes vers les services backend
- Implémente la journalisation, la gestion des erreurs et le routage des requêtes
- Montre la communication HTTP service-à-service

**Product Service (src/product-service/)** :
- Service interne avec catalogue produit (en mémoire pour simplicité)
- API REST avec probes de santé
- Exemple de modèle microservice backend

## Aperçu des services

### API Gateway (Node.js/Express)

**Port** : 8080  
**Accès** : Public (ingress externe)  
**Rôle** : Route les requêtes entrantes vers les services backend appropriés  

**Endpoints** :
- `GET /` - Informations sur le service
- `GET /health` - Endpoint de vérification de santé
- `GET /api/products` - Redirige vers le service produit (liste complète)
- `GET /api/products/:id` - Redirige vers le service produit (détail par ID)

**Fonctionnalités clés** :
- Routage des requêtes avec axios
- Journalisation centralisée
- Gestion des erreurs et timeout
- Découverte de services via variables d’environnement
- Intégration avec Application Insights

**Code remarquable** (`src/api-gateway/app.js`) :
```javascript
// Communication interne de service
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port** : 8000  
**Accès** : Interne uniquement (pas d’ingress externe)  
**Rôle** : Gère le catalogue produit avec données en mémoire  

**Endpoints** :
- `GET /` - Informations sur le service
- `GET /health` - Endpoint de vérification de santé
- `GET /products` - Liste tous les produits
- `GET /products/<id>` - Produit par ID

**Fonctionnalités clés** :
- API RESTful avec Flask
- Stockage produit en mémoire (simple, pas de DB nécessaire)
- Supervision de la santé avec probes
- Journalisation structurée
- Intégration Application Insights

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
Le service produit n’est pas exposé publiquement. Toutes les requêtes doivent passer par l’API Gateway, ce qui apporte :
- Sécurité : point d’accès contrôlé
- Flexibilité : backend modifiable sans impacter les clients
- Supervision : journalisation des requêtes centralisée

## Comprendre la communication entre services

### Comment les services communiquent entre eux

Dans cet exemple, l’API Gateway communique avec le Product Service via des **appels HTTP internes** :

```javascript
// Passerelle API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Faire une requête HTTP interne
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Points clés** :

1. **Découverte DNS** : Container Apps fournit automatiquement le DNS pour les services internes
   - FQDN Product Service : `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplifié en : `http://product-service` (résolu par Container Apps)

2. **Pas d’exposition publique** : Product Service a `external: false` dans le Bicep
   - Accessible uniquement dans l’environnement Container Apps
   - Non atteignable depuis Internet

3. **Variables d’environnement** : URLs des services injectées au déploiement
   - Bicep passe le FQDN interne à la gateway
   - Pas d’URLs codées en dur dans le code de l’application

**Analogie** : Imaginez cela comme des bureaux dans un bâtiment. L’API Gateway est la réception (publique), le Product Service est un bureau interne. Les visiteurs doivent passer par la réception pour accéder aux bureaux.

## Options de déploiement

### Déploiement complet (recommandé)

```bash
# Déployer l'infrastructure et les deux services
azd up
```

Cela déploie :
1. Environnement Container Apps
2. Application Insights
3. Registre de conteneurs
4. Conteneur API Gateway
5. Conteneur Product Service

**Temps** : 8-12 minutes

### Déployer un service individuel

```bash
# Déployer un seul service (après le premier azd up)
azd deploy api-gateway

# Ou déployer le service produit
azd deploy product-service
```

**Cas d’usage** : Quand vous avez mis à jour le code d’un service et souhaitez redéployer uniquement ce service.

### Mettre à jour la configuration

```bash
# Modifier les paramètres d'échelle
azd env set GATEWAY_MAX_REPLICAS 30

# Redéployer avec la nouvelle configuration
azd up
```

## Configuration

### Configuration de la mise à l’échelle

Les deux services sont configurés avec l’autoscaling HTTP dans leurs fichiers Bicep :

**API Gateway** :
- Répliques minimales : 2 (toujours au moins 2 pour disponibilité)
- Répliques maximales : 20
- Déclencheur de montée en charge : 50 requêtes simultanées par réplique

**Product Service** :
- Répliques minimales : 1 (peut scaler jusqu’à zéro si besoin)
- Répliques maximales : 10
- Déclencheur : 100 requêtes simultanées par réplique

**Personnaliser la mise à l’échelle** (dans `infra/app/*.bicep`) :
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

### Probes de santé

Les deux services incluent des probes liveness et readiness :

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
- **Liveness** : Si le contrôle échoue, Container Apps redémarre le conteneur
- **Readiness** : Si non prêt, Container Apps cesse de router le trafic vers cette réplique



## Supervision & Observabilité

### Voir les logs des services

```bash
# Afficher les journaux avec azd monitor
azd monitor --logs

# Ou utilisez Azure CLI pour des applications de conteneur spécifiques :
# Diffuser les journaux depuis la passerelle API
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Afficher les journaux récents du service produit
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
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

**Suivre les appels service-à-service** :
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Taux d’erreur par service** :
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volume des requêtes dans le temps** :
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

### Mesures en direct

1. Naviguez vers Application Insights dans le portail Azure
2. Cliquez sur "Live Metrics"
3. Voyez les requêtes, échecs et performance en temps réel
4. Testez avec : `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Exercices pratiques

[Note : Voir les exercices complets ci-dessus dans la section "Practical Exercises" pour des exercices détaillés pas-à-pas incluant vérification de déploiement, modification des données, tests d’autoscaling, gestion des erreurs, et ajout d’un troisième service.]

## Analyse des coûts

### Coûts mensuels estimés (pour cet exemple 2 services)

| Ressource | Configuration | Coût estimé |
|----------|--------------|----------------|
| API Gateway | 2-20 répliques, 1 vCPU, 2GB RAM | 30-150 $ |
| Product Service | 1-10 répliques, 0.5 vCPU, 1GB RAM | 15-75 $ |
| Registre de conteneurs | Niveau basique | 5 $ |
| Application Insights | 1-2 GB/mois | 5-10 $ |
| Log Analytics | 1 GB/mois | 3 $ |
| **Total** | | **58-243 $/mois** |

**Répartition des coûts selon l’usage** :
- **Trafic léger** (tests/apprentissage) : ~60 $/mois
- **Trafic modéré** (petite production) : ~120 $/mois
- **Trafic élevé** (périodes chargées) : ~240 $/mois

### Conseils d’optimisation des coûts

1. **Mise à l’échelle jusqu’à zéro en développement** :
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Utiliser le plan à la consommation pour Cosmos DB** (lorsque ajouté) :
   - Payez uniquement ce que vous consommez
   - Pas de frais minimum

3. **Configurer le sampling dans Application Insights** :
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Échantillonner 50 % des requêtes
   ```

4. **Nettoyer lorsque ce n’est pas utilisé** :
   ```bash
   azd down
   ```

### Options de niveau gratuit
Pour l’apprentissage/test, considérez :  
- Utilisez les crédits gratuits Azure (30 premiers jours)  
- Gardez un minimum de réplicas  
- Supprimez après le test (pas de frais continus)

---

## Nettoyage

Pour éviter des frais continus, supprimez toutes les ressources :

```bash
azd down --force --purge
```
  
**Invite de confirmation** :  
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```
  
Tapez `y` pour confirmer.

**Ce qui sera supprimé** :  
- Environnement Container Apps  
- Les deux Container Apps (passerelle & service produit)  
- Registre de conteneurs  
- Application Insights  
- Espace de travail Log Analytics  
- Groupe de ressources

**✓ Vérifier le nettoyage** :  
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```
  
Devrait retourner vide.

---

## Guide d’expansion : de 2 à 5+ services

Une fois que vous maîtrisez cette architecture à 2 services, voici comment étendre :

### Phase 1 : Ajouter la persistance de base de données (étape suivante)

**Ajouter Cosmos DB pour le service produit** :

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

3. Coût supplémentaire estimé : ~25 $/mois (serveurless)

### Phase 2 : Ajouter un troisième service (gestion des commandes)

**Créer le service commande** :

1. Nouveau dossier : `src/order-service/` (Python/Node.js/C#)  
2. Nouveau Bicep : `infra/app/order-service.bicep`  
3. Mettez à jour la passerelle API pour router `/api/orders`  
4. Ajoutez une base de données Azure SQL pour la persistance des commandes

**L’architecture devient** :  
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```
  
### Phase 3 : Ajouter la communication asynchrone (Service Bus)

**Implémenter une architecture événementielle** :

1. Ajoutez Azure Service Bus : `infra/core/servicebus.bicep`  
2. Le service produit publie des événements "ProductCreated"  
3. Le service commande s’abonne aux événements produit  
4. Ajoutez un service de notifications pour traiter les événements

**Modèle** : Requête/Réponse (HTTP) + Événementiel (Service Bus)

### Phase 4 : Ajouter l’authentification utilisateur

**Implémenter le service utilisateur** :

1. Créez `src/user-service/` (Go/Node.js)  
2. Ajoutez Azure AD B2C ou authentification JWT personnalisée  
3. La passerelle API valide les jetons  
4. Les services vérifient les permissions utilisateur

### Phase 5 : Préparation à la production

**Ajoutez ces composants** :  
- Azure Front Door (équilibrage global de charge)  
- Azure Key Vault (gestion des secrets)  
- Azure Monitor Workbooks (tableaux de bord personnalisés)  
- Pipeline CI/CD (GitHub Actions)  
- Déploiements Blue-Green  
- Managed Identity pour tous les services

**Coût total de l’architecture production** : ~300-1 400 $/mois

---

## En savoir plus

### Documentation liée  
- [Documentation Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)  
- [Guide d’architecture microservices](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)  
- [Application Insights pour le traçage distribué](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)  
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Étapes suivantes dans ce cours  
- ← Précédent : [API Flask simple](../../../../../examples/container-app/simple-flask-api) - Exemple débutant mono-conteneur  
- → Suivant : [Guide d’intégration IA](../../../../../examples/docs/ai-foundry) - Ajouter des capacités IA  
- 🏠 [Accueil du cours](../../README.md)

### Comparaison : quand utiliser quoi

**Application mono-conteneur** (exemple simple Flask API) :  
- ✅ Applications simples  
- ✅ Architecture monolithique  
- ✅ Déploiement rapide  
- ❌ Scalabilité limitée  
- **Coût** : ~15-50 $/mois

**Microservices** (cet exemple) :  
- ✅ Applications complexes  
- ✅ Scalabilité indépendante par service  
- ✅ Autonomie d’équipe (services et équipes différents)  
- ❌ Plus complexe à gérer  
- **Coût** : ~60-250 $/mois

**Kubernetes (AKS)** :  
- ✅ Contrôle et flexibilité maximaux  
- ✅ Portabilité multi-cloud  
- ✅ Réseau avancé  
- ❌ Nécessite une expertise Kubernetes  
- **Coût** : ~150-500 $/mois minimum

**Recommandation** : Commencez par Container Apps (cet exemple), migrez vers AKS seulement si vous avez besoin des fonctionnalités spécifiques Kubernetes.

---

## Questions fréquentes

**Q : Pourquoi seulement 2 services au lieu de 5+ ?**  
R : Progression pédagogique. Maîtrisez les fondamentaux (communication inter-service, monitoring, scalabilité) avec un exemple simple avant d’ajouter de la complexité. Les modèles appris ici s’appliquent aux architectures à 100 services.

**Q : Puis-je ajouter d’autres services moi-même ?**  
R : Absolument ! Suivez le guide d’expansion ci-dessus. Chaque nouveau service suit le même schéma : créer le dossier src, créer le fichier Bicep, mettre à jour azure.yaml, déployer.

**Q : Est-ce prêt pour la production ?**  
R : C’est une base solide. Pour la production, ajoutez : managed identity, Key Vault, bases de données persistantes, pipeline CI/CD, alertes de monitoring, stratégie de sauvegarde.

**Q : Pourquoi ne pas utiliser Dapr ou un autre maillage de service ?**  
R : Gardez simple pour l’apprentissage. Une fois que vous comprenez le réseau natif Container Apps, vous pouvez ajouter Dapr pour des scénarios avancés.

**Q : Comment déboguer localement ?**  
R : Exécutez les services localement avec Docker :  
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```
  
**Q : Puis-je utiliser des langages de programmation différents ?**  
R : Oui ! Cet exemple montre Node.js (passerelle) + Python (service produit). Vous pouvez mélanger n’importe quels langages fonctionnant en conteneurs.

**Q : Et si je n’ai pas de crédits Azure ?**  
R : Utilisez le niveau gratuit Azure (30 premiers jours avec nouveau compte) ou déployez pour de courtes périodes de test puis supprimez immédiatement.

---

> **🎓 Résumé du parcours d’apprentissage** : Vous avez appris à déployer une architecture multi-service avec scalabilité automatique, réseau interne, monitoring centralisé et patterns prêts pour la production. Cette base vous prépare à des systèmes distribués complexes et aux architectures microservices d’entreprise.

**📚 Navigation du cours :**  
- ← Précédent : [API Flask simple](../../../../../examples/container-app/simple-flask-api)  
- → Suivant : [Exemple d’intégration base de données](../../../../../examples/database-app)  
- 🏠 [Accueil du cours](../../../README.md)  
- 📖 [Bonnes pratiques Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d’origine doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle réalisée par un humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou d’interprétations erronées résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->