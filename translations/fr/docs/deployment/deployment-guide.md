<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-09T16:58:25+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "fr"
}
-->
# Guide de Déploiement - Maîtriser les Déploiements AZD

## Introduction

Ce guide complet couvre tout ce que vous devez savoir sur le déploiement d'applications avec Azure Developer CLI, des déploiements simples en une commande aux scénarios avancés de production avec des hooks personnalisés, des environnements multiples et une intégration CI/CD. Maîtrisez le cycle de vie complet du déploiement grâce à des exemples pratiques et des meilleures pratiques.

## Objectifs d'apprentissage

En suivant ce guide, vous allez :
- Maîtriser toutes les commandes et workflows de déploiement d'Azure Developer CLI
- Comprendre le cycle de vie complet du déploiement, de la mise en service à la surveillance
- Implémenter des hooks personnalisés pour automatiser les étapes avant et après le déploiement
- Configurer plusieurs environnements avec des paramètres spécifiques à chaque environnement
- Mettre en place des stratégies de déploiement avancées, y compris les déploiements blue-green et canary
- Intégrer les déploiements azd dans des pipelines CI/CD et des workflows DevOps

## Résultats d'apprentissage

À la fin de ce guide, vous serez capable de :
- Exécuter et résoudre les problèmes liés à tous les workflows de déploiement azd de manière autonome
- Concevoir et implémenter une automatisation personnalisée pour les déploiements à l'aide de hooks
- Configurer des déploiements prêts pour la production avec une sécurité et une surveillance adéquates
- Gérer des scénarios complexes de déploiement multi-environnements
- Optimiser les performances des déploiements et mettre en œuvre des stratégies de retour en arrière
- Intégrer les déploiements azd dans les pratiques DevOps d'entreprise

## Aperçu du Déploiement

Azure Developer CLI propose plusieurs commandes de déploiement :
- `azd up` - Workflow complet (provisionnement + déploiement)
- `azd provision` - Crée/Met à jour uniquement les ressources Azure
- `azd deploy` - Déploie uniquement le code de l'application
- `azd package` - Construit et empaquette les applications

## Workflows de Déploiement de Base

### Déploiement Complet (azd up)
Le workflow le plus courant pour les nouveaux projets :
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Déploiement de l'Infrastructure Seulement
Lorsque vous avez seulement besoin de mettre à jour les ressources Azure :
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Déploiement du Code Seulement
Pour des mises à jour rapides de l'application :
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Comprendre le Processus de Déploiement

### Phase 1 : Hooks Avant Provisionnement
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### Phase 2 : Provisionnement de l'Infrastructure
- Lit les modèles d'infrastructure (Bicep/Terraform)
- Crée ou met à jour les ressources Azure
- Configure le réseau et la sécurité
- Met en place la surveillance et la journalisation

### Phase 3 : Hooks Après Provisionnement
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### Phase 4 : Empaquetage de l'Application
- Construit le code de l'application
- Crée des artefacts de déploiement
- Prépare pour la plateforme cible (conteneurs, fichiers ZIP, etc.)

### Phase 5 : Hooks Avant Déploiement
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### Phase 6 : Déploiement de l'Application
- Déploie les applications empaquetées sur les services Azure
- Met à jour les paramètres de configuration
- Démarre/redémarre les services

### Phase 7 : Hooks Après Déploiement
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

## 🎛️ Configuration du Déploiement

### Paramètres de Déploiement Spécifiques au Service
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### Configurations Spécifiques à l'Environnement
```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Scénarios de Déploiement Avancés

### Applications Multi-Services
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### Déploiements Blue-Green
```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### Déploiements Canary
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### Déploiements Étagés
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Déploiements de Conteneurs

### Déploiements d'Applications Conteneurisées
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### Optimisation Multi-Étapes des Dockerfiles
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Optimisation des Performances

### Déploiements Parallèles
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Mise en Cache des Builds
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### Déploiements Incrémentaux
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Surveillance des Déploiements

### Surveillance en Temps Réel des Déploiements
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### Vérifications de Santé
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### Validation Après Déploiement
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 Considérations de Sécurité

### Gestion des Secrets
```bash
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### Sécurité Réseau
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Gestion des Identités et des Accès
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 Stratégies de Retour en Arrière

### Retour Rapide
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Retour de l'Infrastructure
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Retour des Migrations de Base de Données
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Métriques de Déploiement

### Suivi des Performances de Déploiement
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Collecte de Métriques Personnalisées
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 Meilleures Pratiques

### 1. Cohérence des Environnements
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validation de l'Infrastructure
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Intégration des Tests
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. Documentation et Journalisation
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Prochaines Étapes

- [Provisionnement des Ressources](provisioning.md) - Approfondissement de la gestion de l'infrastructure
- [Planification Avant Déploiement](../pre-deployment/capacity-planning.md) - Planifiez votre stratégie de déploiement
- [Problèmes Courants](../troubleshooting/common-issues.md) - Résolvez les problèmes de déploiement
- [Meilleures Pratiques](../troubleshooting/debugging.md) - Stratégies de déploiement prêtes pour la production

## Ressources Supplémentaires

- [Référence de Déploiement Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Déploiement Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Déploiement Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Déploiement Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Leçon Précédente** : [Votre Premier Projet](../getting-started/first-project.md)
- **Leçon Suivante** : [Provisionnement des Ressources](provisioning.md)

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.