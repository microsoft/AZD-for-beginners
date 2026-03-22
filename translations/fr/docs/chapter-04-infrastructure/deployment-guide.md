# Guide de déploiement - Maîtriser les déploiements AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD pour débutants](../../README.md)
- **📖 Current Chapter**: Chapitre 4 - Infrastructure en tant que code et déploiement
- **⬅️ Previous Chapter**: [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisionnement des ressources](provisioning.md)
- **🚀 Next Chapter**: [Chapitre 5 : Solutions IA multi-agents](../../examples/retail-scenario.md)

## Introduction

Ce guide complet couvre tout ce que vous devez savoir sur le déploiement d'applications à l'aide de l'Azure Developer CLI, depuis les déploiements basiques en une seule commande jusqu'aux scénarios de production avancés avec hooks personnalisés, environnements multiples et intégration CI/CD. Maîtrisez l'intégralité du cycle de vie du déploiement avec des exemples pratiques et des bonnes pratiques.

## Learning Goals

By completing this guide, you will:
- Maîtriser toutes les commandes et workflows de déploiement d'Azure Developer CLI
- Comprendre le cycle de vie complet du déploiement, de la provision à la supervision
- Mettre en œuvre des hooks de déploiement personnalisés pour l'automatisation avant et après le déploiement
- Configurer plusieurs environnements avec des paramètres spécifiques à chaque environnement
- Mettre en place des stratégies de déploiement avancées, y compris blue-green et canary
- Intégrer les déploiements azd aux pipelines CI/CD et aux workflows DevOps

## Learning Outcomes

Upon completion, you will be able to:
- Exécuter et dépanner de manière autonome tous les workflows de déploiement azd
- Concevoir et implémenter une automatisation de déploiement personnalisée en utilisant des hooks
- Configurer des déploiements prêts pour la production avec sécurité et supervision appropriées
- Gérer des scénarios de déploiement complexes multi-environnements
- Optimiser les performances de déploiement et mettre en place des stratégies de rollback
- Intégrer les déploiements azd dans les pratiques DevOps d'entreprise

## Deployment Overview

Azure Developer CLI provides several deployment commands:
- `azd up` - Workflow complet (provision + déploiement)
- `azd provision` - Crée/met à jour uniquement les ressources Azure
- `azd deploy` - Déploie uniquement le code applicatif
- `azd package` - Construit et empaquette les applications

## Basic Deployment Workflows

### Complete Deployment (azd up)
The most common workflow for new projects:
```bash
# Déployer tout à partir de zéro
azd up

# Déployer dans un environnement spécifique
azd up --environment production

# Déployer avec des paramètres personnalisés
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
When you only need to update Azure resources:
```bash
# Provisionner/mettre à jour l'infrastructure
azd provision

# Provisionner en mode simulation (dry-run) pour prévisualiser les modifications
azd provision --preview

# Provisionner des services spécifiques
azd provision --service database
```

### Code-Only Deployment
For quick application updates:
```bash
# Déployer tous les services
azd deploy

# Sortie attendue :
# Déploiement des services (azd deploy)
# - web : Déploiement... Terminé
# - api : Déploiement... Terminé
# SUCCÈS : Votre déploiement s'est terminé en 2 minutes 15 secondes

# Déployer un service spécifique
azd deploy --service web
azd deploy --service api

# Déployer avec des arguments de compilation personnalisés
azd deploy --service api --build-arg NODE_ENV=production

# Vérifier le déploiement
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

After any deployment, verify success:

```bash
# Vérifier que tous les services sont en cours d'exécution
azd show

# Tester les points de terminaison de santé
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Surveiller les erreurs (s'ouvre dans le navigateur par défaut)
azd monitor --logs
```

**Success Criteria:**
- ✅ Tous les services affichent le statut "Running"
- ✅ Les points de terminaison de santé renvoient HTTP 200
- ✅ Aucun journal d'erreur dans les 5 dernières minutes
- ✅ L'application répond aux requêtes de test

## 🏗️ Understanding the Deployment Process

### Phase 1: Pre-Provision Hooks
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

### Phase 2: Infrastructure Provisioning
- Lit les modèles d'infrastructure (Bicep/Terraform)
- Crée ou met à jour les ressources Azure
- Configure le réseau et la sécurité
- Configure la surveillance et la journalisation

### Phase 3: Post-Provision Hooks
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

### Phase 4: Application Packaging
- Compile le code applicatif
- Crée les artefacts de déploiement
- Emballe pour la plateforme cible (conteneurs, fichiers ZIP, etc.)

### Phase 5: Pre-Deploy Hooks
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

### Phase 6: Application Deployment
- Déploie les applications empaquetées sur les services Azure
- Met à jour les paramètres de configuration
- Démarre/redémarre les services

### Phase 7: Post-Deploy Hooks
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

## 🎛️ Deployment Configuration

### Service-Specific Deployment Settings
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

### Environment-Specific Configurations
```bash
# Environnement de développement
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Environnement de pré-production
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Environnement de production
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Advanced Deployment Scenarios

### Multi-Service Applications
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

### Blue-Green Deployments
```bash
# Créer l'environnement bleu
azd env new production-blue
azd up --environment production-blue

# Tester l'environnement bleu
./scripts/test-environment.sh production-blue

# Basculer le trafic vers le bleu (mise à jour manuelle du DNS/équilibreur de charge)
./scripts/switch-traffic.sh production-blue

# Nettoyer l'environnement vert
azd env select production-green
azd down --force
```

### Canary Deployments
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

### Staged Deployments
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

## 🐳 Container Deployments

### Container App Deployments
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

### Multi-Stage Dockerfile Optimization
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

## ⚡ Performance Optimization

### Service-Specific Deployments
```bash
# Déployer un service spécifique afin d'itérer plus rapidement
azd deploy --service web
azd deploy --service api

# Déployer tous les services
azd deploy
```

### Build Caching
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Efficient Code Deployments
```bash
# Utilisez azd deploy (pas azd up) pour les modifications de code uniquement
# Cela évite le provisionnement de l'infrastructure et est beaucoup plus rapide
azd deploy

# Déployez un service spécifique pour itérer plus rapidement
azd deploy --service api
```

## 🔍 Deployment Monitoring

### Real-Time Deployment Monitoring
```bash
# Surveiller l'application en temps réel
azd monitor --live

# Voir les journaux de l'application
azd monitor --logs

# Vérifier l'état du déploiement
azd show
```

### Health Checks
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

### Post-Deployment Validation
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Vérifier la santé de l'application
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

## 🔐 Security Considerations

### Secrets Management
```bash
# Stocker les secrets en toute sécurité
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Faire référence aux secrets dans azure.yaml
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

### Network Security
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identity and Access Management
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

## 🚨 Rollback Strategies

### Quick Rollback
```bash
# AZD n'a pas de mécanisme d'annulation intégré. Approches recommandées :

# Option 1 : redéployer depuis Git (recommandée)
git revert HEAD  # Annuler le commit problématique
git push
azd deploy

# Option 2 : redéployer un commit spécifique
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastructure Rollback
```bash
# Prévisualiser les modifications d'infrastructure avant de les appliquer
azd provision --preview

# Pour revenir en arrière sur l'infrastructure, utilisez le contrôle de version :
git revert HEAD  # Annuler les modifications d'infrastructure
azd provision    # Appliquer l'état précédent de l'infrastructure
```

### Database Migration Rollback
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Deployment Metrics

### Track Deployment Performance
```bash
# Afficher le statut actuel du déploiement
azd show

# Surveiller l'application avec Application Insights
azd monitor --overview

# Afficher les métriques en temps réel
azd monitor --live
```

### Custom Metrics Collection
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

## 🎯 Best Practices

### 1. Environment Consistency
```bash
# Utiliser une convention de nommage cohérente
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintenir la parité des environnements
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# Prévisualiser les modifications de l'infrastructure avant le déploiement
azd provision --preview

# Utiliser le linting pour ARM/Bicep
az bicep lint --file infra/main.bicep

# Valider la syntaxe Bicep
az bicep build --file infra/main.bicep
```

### 3. Testing Integration
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

### 4. Documentation and Logging
```bash
# Documenter les procédures de déploiement
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Next Steps

- [Provisionnement des ressources](provisioning.md) - Approfondissement de la gestion de l'infrastructure
- [Planification pré-déploiement](../chapter-06-pre-deployment/capacity-planning.md) - Planifiez votre stratégie de déploiement
- [Problèmes courants](../chapter-07-troubleshooting/common-issues.md) - Résoudre les problèmes de déploiement
- [Bonnes pratiques](../chapter-07-troubleshooting/debugging.md) - Stratégies de déploiement prêtes pour la production

## 🎯 Hands-On Deployment Exercises

### Exercise 1: Incremental Deployment Workflow (20 minutes)
**Goal**: Master the difference between full and incremental deployments

```bash
# Déploiement initial
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Enregistrer l'heure du déploiement initial
echo "Full deployment: $(date)" > deployment-log.txt

# Modifier le code
echo "// Updated $(date)" >> src/api/src/server.js

# Déployer uniquement le code (rapide)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Comparer les temps
cat deployment-log.txt

# Nettoyer
azd down --force --purge
```

**Success Criteria:**
- [ ] Le déploiement complet prend 5-15 minutes
- [ ] Le déploiement uniquement du code prend 2-5 minutes
- [ ] Les modifications de code sont reflétées dans l'application déployée
- [ ] L'infrastructure reste inchangée après `azd deploy`

**Learning Outcome**: `azd deploy` est 50-70% plus rapide que `azd up` pour les changements de code

### Exercise 2: Custom Deployment Hooks (30 minutes)
**Goal**: Implement pre and post-deployment automation

```bash
# Créer un script de validation pré-déploiement
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Vérifier si les tests passent
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Vérifier les modifications non validées
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Créer un test de vérification post-déploiement
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Ajouter des hooks à azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Tester le déploiement avec des hooks
azd deploy
```

**Success Criteria:**
- [ ] Le script pré-déploiement s'exécute avant le déploiement
- [ ] Le déploiement est annulé si les tests échouent
- [ ] Le test smoke post-déploiement valide la santé
- [ ] Les hooks s'exécutent dans le bon ordre

### Exercise 3: Multi-Environment Deployment Strategy (45 minutes)
**Goal**: Implement staged deployment workflow (dev → staging → production)

```bash
# Créer le script de déploiement
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Étape 1 : Déployer sur dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Étape 2 : Déployer sur staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Étape 3 : Approbation manuelle pour la production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Créer des environnements
azd env new dev
azd env new staging
azd env new production

# Exécuter le déploiement par étapes
./deploy-staged.sh
```

**Success Criteria:**
- [ ] L'environnement dev est déployé avec succès
- [ ] L'environnement staging est déployé avec succès
- [ ] Approbation manuelle requise pour la production
- [ ] Tous les environnements ont des vérifications de santé fonctionnelles
- [ ] Possibilité de revenir en arrière si nécessaire

### Exercise 4: Rollback Strategy (25 minutes)
**Goal**: Implement and test deployment rollback using Git

```bash
# Déployer v1
azd env set APP_VERSION "1.0.0"
azd up

# Enregistrer le hash du commit de v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Déployer v2 avec un changement incompatible
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Détecter l'échec et revenir en arrière
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Revenir en arrière en utilisant git
    git revert HEAD --no-edit
    
    # Restaurer l'environnement
    azd env set APP_VERSION "1.0.0"
    
    # Redéployer v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Success Criteria:**
- [ ] Peut détecter les échecs de déploiement
- [ ] Le script de rollback s'exécute automatiquement
- [ ] L'application revient à un état fonctionnel
- [ ] Les vérifications de santé passent après le rollback

## 📊 Deployment Metrics Tracking

### Track Your Deployment Performance

```bash
# Créer un script de métriques de déploiement
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Enregistrer dans un fichier
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Utilisez-le
./track-deployment.sh
```

**Analyze your metrics:**
```bash
# Afficher l'historique des déploiements
cat deployment-metrics.csv

# Calculer le temps moyen de déploiement
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Additional Resources

- [Référence du déploiement Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Déploiement Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Déploiement Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Déploiement Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Previous Lesson**: [Votre premier projet](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Provisionnement des ressources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Clause de non-responsabilité :

Ce document a été traduit à l'aide du service de traduction automatique Co-op Translator (https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la version faisant foi. Pour les informations critiques, une traduction humaine professionnelle est recommandée. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->