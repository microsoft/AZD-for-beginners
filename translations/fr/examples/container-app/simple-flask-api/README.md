<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1c0a9f09606dbd775c684b2a1143e546",
  "translation_date": "2025-11-19T12:53:23+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "fr"
}
-->
# Exemple d'application conteneur - API Flask simple

Une API REST basique en Python Flask déployée sur Azure Container Apps à l'aide de l'outil AZD CLI.

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

- Azure Developer CLI (azd) installé
- Docker installé localement
- Abonnement Azure

## Démarrage rapide

```bash
# Clone and navigate
cd examples/container-app/simple-flask-api

# Initialize environment
azd env new dev

# Deploy everything
azd up

# Test the API
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
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
| `/health` | GET | Vérification de l'état |
| `/api/items` | GET | Liste tous les éléments |
| `/api/items` | POST | Crée un nouvel élément |
| `/api/items/{id}` | GET | Récupère un élément spécifique |
| `/api/items/{id}` | PUT | Met à jour un élément |
| `/api/items/{id}` | DELETE | Supprime un élément |

## Configuration

### Variables d'environnement

```bash
# Set custom configuration
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Configuration de mise à l'échelle

L'API s'adapte automatiquement en fonction du trafic HTTP :
- **Réplicas minimum** : 0 (s'adapte à zéro lorsqu'elle est inactive)
- **Réplicas maximum** : 10
- **Requêtes simultanées par réplique** : 50

## Développement

### Exécuter localement

```bash
# Install dependencies
cd src
pip install -r requirements.txt

# Run the app
python app.py

# Test locally
curl http://localhost:8000/health
```

### Construire et tester le conteneur

```bash
# Build Docker image
docker build -t flask-api:local ./src

# Run container locally
docker run -p 8000:8000 flask-api:local

# Test container
curl http://localhost:8000/health
```

## Déploiement

### Déploiement complet

```bash
# Deploy infrastructure and application
azd up
```

### Déploiement du code uniquement

```bash
# Deploy only application code (infrastructure unchanged)
azd deploy api
```

### Mettre à jour la configuration

```bash
# Update environment variables
azd env set API_KEY "new-api-key"

# Redeploy with new configuration
azd deploy api
```

## Surveillance

### Consulter les journaux

```bash
# Stream live logs
azd logs api --follow

# View last 100 lines
azd logs api --tail 100
```

### Surveiller les métriques

```bash
# Open Azure Monitor dashboard
azd monitor --overview

# View specific metrics
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Tests

### Vérification de l'état

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

### Récupérer tous les éléments

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimisation des coûts

Ce déploiement utilise une mise à l'échelle à zéro, vous ne payez donc que lorsque l'API traite des requêtes :

- **Coût en veille** : ~0 $/mois (mise à l'échelle à zéro)
- **Coût actif** : ~0,000024 $/seconde par réplique
- **Coût mensuel estimé** (utilisation légère) : 5-15 $

### Réduire davantage les coûts

```bash
# Scale down max replicas for dev
azd env set MAX_REPLICAS 3

# Use shorter idle timeout
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutes
```

## Résolution des problèmes

### Le conteneur ne démarre pas

```bash
# Check container logs
azd logs api --tail 100

# Verify Docker image builds locally
docker build -t test ./src
```

### L'API n'est pas accessible

```bash
# Verify ingress is external
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Temps de réponse élevés

```bash
# Check CPU/Memory usage
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Scale up resources if needed
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Nettoyage

```bash
# Delete all resources
azd down --force --purge
```

## Prochaines étapes

- Ajouter une intégration de base de données (voir [exemple d'intégration de base de données](../../../../../examples/container-app/database-integration))
- Implémenter l'authentification (voir [exemple d'authentification](../../../../../examples/container-app/auth-example))
- Configurer un pipeline CI/CD (voir [exemple de CI/CD](../../../../../examples/container-app/cicd-example))
- Ajouter Dapr pour les microservices (voir [exemple Dapr](../../../../../examples/container-app/dapr-example))

## Ressources supplémentaires

- [Documentation Flask](https://flask.palletsprojects.com/)
- [Documentation Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Guide AZD Container Apps](../../../docs/microsoft-foundry/ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle humaine. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->