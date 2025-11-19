<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-19T14:30:55+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "fr"
}
-->
# Exemple d'application conteneurisée avec une API Flask simple

**Niveau d'apprentissage :** Débutant ⭐ | **Durée :** 25-35 minutes | **Coût :** 0-15 $/mois

Une API REST Python Flask complète et fonctionnelle déployée sur Azure Container Apps à l'aide d'Azure Developer CLI (azd). Cet exemple illustre le déploiement de conteneurs, l'auto-scalabilité et les bases de la surveillance.

## 🎯 Ce que vous allez apprendre

- Déployer une application Python conteneurisée sur Azure
- Configurer l'auto-scalabilité avec une mise à l'échelle jusqu'à zéro
- Mettre en œuvre des sondes de santé et des vérifications de disponibilité
- Surveiller les journaux et les métriques de l'application
- Utiliser Azure Developer CLI pour un déploiement rapide

## 📦 Ce qui est inclus

✅ **Application Flask** - API REST complète avec opérations CRUD (`src/app.py`)  
✅ **Dockerfile** - Configuration de conteneur prête pour la production  
✅ **Infrastructure Bicep** - Environnement Container Apps et déploiement de l'API  
✅ **Configuration AZD** - Déploiement en une seule commande  
✅ **Sondes de santé** - Vérifications de vivacité et de disponibilité configurées  
✅ **Auto-scalabilité** - 0 à 10 réplicas en fonction de la charge HTTP  

## Architecture

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Prérequis

### Obligatoires
- **Azure Developer CLI (azd)** - [Guide d'installation](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Abonnement Azure** - [Compte gratuit](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Installer Docker](https://www.docker.com/products/docker-desktop/) (pour les tests locaux)

### Vérifier les prérequis

```bash
# Vérifiez la version d'azd (besoin de 1.5.0 ou supérieur)
azd version

# Vérifiez la connexion à Azure
azd auth login

# Vérifiez Docker (optionnel, pour les tests locaux)
docker --version
```

## ⏱️ Chronologie du déploiement

| Phase | Durée | Ce qui se passe |
|-------|-------|-----------------|
| Configuration de l'environnement | 30 secondes | Création de l'environnement azd |
| Construction du conteneur | 2-3 minutes | Construction Docker de l'application Flask |
| Provisionnement de l'infrastructure | 3-5 minutes | Création des Container Apps, du registre, de la surveillance |
| Déploiement de l'application | 2-3 minutes | Pousser l'image et déployer sur Container Apps |
| **Total** | **8-12 minutes** | Déploiement complet prêt |

## Démarrage rapide

```bash
# Naviguez vers l'exemple
cd examples/container-app/simple-flask-api

# Initialisez l'environnement (choisissez un nom unique)
azd env new myflaskapi

# Déployez tout (infrastructure + application)
azd up
# Vous serez invité à :
# 1. Sélectionner l'abonnement Azure
# 2. Choisir l'emplacement (par exemple, eastus2)
# 3. Attendre 8-12 minutes pour le déploiement

# Obtenez votre point de terminaison API
azd env get-values

# Testez l'API
curl $(azd env get-value API_ENDPOINT)/health
```

**Résultat attendu :**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Vérifier le déploiement

### Étape 1 : Vérifier l'état du déploiement

```bash
# Voir les services déployés
azd show

# La sortie attendue montre :
# - Service : api
# - Point de terminaison : https://ca-api-[env].xxx.azurecontainerapps.io
# - Statut : En cours d'exécution
```

### Étape 2 : Tester les points de terminaison de l'API

```bash
# Obtenir le point de terminaison de l'API
API_URL=$(azd env get-value API_ENDPOINT)

# Tester la santé
curl $API_URL/health

# Tester le point de terminaison racine
curl $API_URL/

# Créer un élément
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Obtenir tous les éléments
curl $API_URL/api/items
```

**Critères de réussite :**
- ✅ Le point de terminaison de santé retourne HTTP 200
- ✅ Le point de terminaison racine affiche les informations de l'API
- ✅ POST crée un élément et retourne HTTP 201
- ✅ GET retourne les éléments créés

### Étape 3 : Consulter les journaux

```bash
# Diffuser les journaux en direct
azd logs api --follow

# Vous devriez voir :
# - Messages de démarrage de Gunicorn
# - Journaux des requêtes HTTP
# - Journaux d'informations de l'application
```

## Structure du projet

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## Points de terminaison de l'API

| Point de terminaison | Méthode | Description |
|----------------------|---------|-------------|
| `/health` | GET | Vérification de santé |
| `/api/items` | GET | Lister tous les éléments |
| `/api/items` | POST | Créer un nouvel élément |
| `/api/items/{id}` | GET | Obtenir un élément spécifique |
| `/api/items/{id}` | PUT | Mettre à jour un élément |
| `/api/items/{id}` | DELETE | Supprimer un élément |

## Configuration

### Variables d'environnement

```bash
# Définir une configuration personnalisée
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Configuration de la mise à l'échelle

L'API s'adapte automatiquement en fonction du trafic HTTP :
- **Réplicas minimums :** 0 (mise à l'échelle jusqu'à zéro en cas d'inactivité)
- **Réplicas maximums :** 10
- **Requêtes simultanées par réplique :** 50

## Développement

### Exécuter localement

```bash
# Installer les dépendances
cd src
pip install -r requirements.txt

# Exécuter l'application
python app.py

# Tester localement
curl http://localhost:8000/health
```

### Construire et tester le conteneur

```bash
# Construire une image Docker
docker build -t flask-api:local ./src

# Exécuter le conteneur localement
docker run -p 8000:8000 flask-api:local

# Tester le conteneur
curl http://localhost:8000/health
```

## Déploiement

### Déploiement complet

```bash
# Déployer l'infrastructure et l'application
azd up
```

### Déploiement du code uniquement

```bash
# Déployer uniquement le code de l'application (infrastructure inchangée)
azd deploy api
```

### Mettre à jour la configuration

```bash
# Mettre à jour les variables d'environnement
azd env set API_KEY "new-api-key"

# Redéployer avec la nouvelle configuration
azd deploy api
```

## Surveillance

### Consulter les journaux

```bash
# Diffuser les journaux en direct
azd logs api --follow

# Voir les 100 dernières lignes
azd logs api --tail 100
```

### Surveiller les métriques

```bash
# Ouvrir le tableau de bord Azure Monitor
azd monitor --overview

# Afficher des métriques spécifiques
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Tests

### Vérification de santé

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Réponse attendue :
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Créer un élément

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Obtenir tous les éléments

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimisation des coûts

Ce déploiement utilise la mise à l'échelle jusqu'à zéro, vous ne payez donc que lorsque l'API traite des requêtes :

- **Coût en inactivité :** ~0 $/mois (mise à l'échelle à zéro)
- **Coût actif :** ~0,000024 $/seconde par réplique
- **Coût mensuel estimé** (utilisation légère) : 5-15 $

### Réduire encore les coûts

```bash
# Réduire le nombre maximal de réplicas pour le développement
azd env set MAX_REPLICAS 3

# Utiliser un délai d'inactivité plus court
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutes
```

## Dépannage

### Le conteneur ne démarre pas

```bash
# Vérifiez les journaux du conteneur
azd logs api --tail 100

# Vérifiez que l'image Docker se construit localement
docker build -t test ./src
```

### L'API n'est pas accessible

```bash
# Vérifier que l'entrée est externe
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Temps de réponse élevés

```bash
# Vérifier l'utilisation du CPU/mémoire
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Augmenter les ressources si nécessaire
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Nettoyage

```bash
# Supprimer toutes les ressources
azd down --force --purge
```

## Étapes suivantes

### Étendre cet exemple

1. **Ajouter une base de données** - Intégrer Azure Cosmos DB ou SQL Database  
   ```bash
   # Ajouter le module Cosmos DB à infra/main.bicep
   # Mettre à jour app.py avec la connexion à la base de données
   ```

2. **Ajouter une authentification** - Implémenter Azure AD ou des clés API  
   ```python
   # Ajouter un middleware d'authentification à app.py
   from functools import wraps
   ```

3. **Configurer CI/CD** - Workflow GitHub Actions  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Ajouter une identité managée** - Sécuriser l'accès aux services Azure  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Exemples associés

- **[Application avec base de données](../../../../../examples/database-app)** - Exemple complet avec SQL Database  
- **[Microservices](../../../../../examples/container-app/microservices)** - Architecture multi-services  
- **[Guide principal des Container Apps](../README.md)** - Tous les modèles de conteneurs  

### Ressources d'apprentissage

- 📚 [Cours AZD pour débutants](../../../README.md) - Page principale du cours  
- 📚 [Modèles de Container Apps](../README.md) - Plus de modèles de déploiement  
- 📚 [Galerie de modèles AZD](https://azure.github.io/awesome-azd/) - Modèles communautaires  

## Ressources supplémentaires

### Documentation
- **[Documentation Flask](https://flask.palletsprojects.com/)** - Guide du framework Flask  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Documentation officielle Azure  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Référence des commandes azd  

### Tutoriels
- **[Démarrage rapide des Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Déployez votre première application  
- **[Python sur Azure](https://learn.microsoft.com/azure/developer/python/)** - Guide de développement Python  
- **[Langage Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure en tant que code  

### Outils
- **[Portail Azure](https://portal.azure.com)** - Gérer les ressources visuellement  
- **[Extension Azure pour VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Intégration IDE  

---

**🎉 Félicitations !** Vous avez déployé une API Flask prête pour la production sur Azure Container Apps avec auto-scalabilité et surveillance.

**Des questions ?** [Ouvrez une issue](https://github.com/microsoft/AZD-for-beginners/issues) ou consultez la [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->