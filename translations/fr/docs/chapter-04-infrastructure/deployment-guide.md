# Guide de Déploiement - Maîtriser les Déploiements AZD

**Navigation dans le Chapitre :**
- **📚 Page d'accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 4 - Infrastructure as Code & Déploiement
- **⬅️ Chapitre précédent** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Suivant** : [Provisionnement des Ressources](provisioning.md)
- **🚀 Chapitre suivant** : [Chapitre 5 : Solutions IA Multi-Agents](../../examples/retail-scenario.md)

## Introduction

Ce guide complet couvre tout ce que vous devez savoir sur le déploiement d’applications avec Azure Developer CLI, depuis les déploiements de base en une seule commande jusqu’aux scénarios avancés en production avec des hooks personnalisés, plusieurs environnements, et une intégration CI/CD. Maîtrisez le cycle complet de déploiement avec des exemples pratiques et des bonnes pratiques.

## Objectifs d’Apprentissage

En suivant ce guide, vous allez :
- Maîtriser toutes les commandes et workflows de déploiement Azure Developer CLI
- Comprendre le cycle complet de déploiement, du provisionnement à la supervision
- Implémenter des hooks de déploiement personnalisés pour l’automatisation avant et après déploiement
- Configurer plusieurs environnements avec des paramètres spécifiques à chaque environnement
- Mettre en place des stratégies de déploiement avancées incluant blue-green et canary deployments
- Intégrer les déploiements azd dans des pipelines CI/CD et workflows DevOps

## Résultats d’Apprentissage

À l’issue, vous serez capable de :
- Exécuter et dépanner tous les workflows de déploiement azd de façon autonome
- Concevoir et implémenter une automatisation personnalisée des déploiements via des hooks
- Configurer des déploiements prêts pour la production avec sécurité et supervision adaptées
- Gérer des scénarios complexes de déploiement multi-environnements
- Optimiser les performances de déploiement et appliquer des stratégies de rollback
- Intégrer les déploiements azd dans les pratiques DevOps d’entreprise

## Vue d’Ensemble du Déploiement

Azure Developer CLI fournit plusieurs commandes de déploiement :
- `azd up` - Workflow complet (provision + déploiement)
- `azd provision` - Créer/met à jour uniquement les ressources Azure
- `azd deploy` - Déployer uniquement le code applicatif
- `azd package` - Compiler et empaqueter les applications

## Workflows de Déploiement de Base

### Déploiement Complet (azd up)
Le workflow le plus courant pour les projets neufs :
```bash
# Déployer tout depuis le début
azd up

# Déployer avec un environnement spécifique
azd up --environment production

# Déployer avec des paramètres personnalisés
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Déploiement Infrastructure Seulement
Quand vous avez seulement besoin de mettre à jour les ressources Azure :
```bash
# Approvisionner/mettre à jour l'infrastructure
azd provision

# Approvisionner avec exécution à blanc pour prévisualiser les modifications
azd provision --preview

# Approvisionner des services spécifiques
azd provision --service database
```

### Déploiement Code Seulement
Pour des mises à jour rapides de l’application :
```bash
# Déployer tous les services
azd deploy

# Sortie attendue :
# Déploiement des services (azd deploy)
# - web : Déploiement... Terminé
# - api : Déploiement... Terminé
# SUCCÈS : Votre déploiement est terminé en 2 minutes 15 secondes

# Déployer un service spécifique
azd deploy --service web
azd deploy --service api

# Déployer avec des arguments de construction personnalisés
azd deploy --service api --build-arg NODE_ENV=production

# Vérifier le déploiement
azd show --output json | jq '.services'
```

### ✅ Vérification du Déploiement

Après chaque déploiement, vérifiez le succès :

```bash
# Vérifiez que tous les services fonctionnent
azd show

# Testez les points de terminaison de santé
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Surveillez les erreurs (s'ouvre dans le navigateur par défaut)
azd monitor --logs
```

**Critères de Succès :**
- ✅ Tous les services affichent le statut "En cours d’exécution"
- ✅ Les points de contrôle santé renvoient HTTP 200
- ✅ Aucun log d’erreur dans les 5 dernières minutes
- ✅ L’application répond aux requêtes de test

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

### Phase 2 : Provisionnement Infrastructure
- Lecture des modèles d’infrastructure (Bicep/Terraform)
- Création ou mise à jour des ressources Azure
- Configuration réseau et sécurité
- Mise en place de la supervision et journalisation

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

### Phase 4 : Packaging de l’Application
- Compilation du code applicatif
- Création des artefacts de déploiement
- Packaging pour la plateforme cible (conteneurs, fichiers ZIP, etc.)

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

### Phase 6 : Déploiement de l’Application
- Déploiement des applications empaquetées sur les services Azure
- Mise à jour des paramètres de configuration
- Démarrage/redémarrage des services

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

### Configurations Spécifiques aux Environnements
```bash
# Environnement de développement
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Environnement de préproduction
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

## 🔧 Scénarios Avancés de Déploiement

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
# Créer un environnement bleu
azd env new production-blue
azd up --environment production-blue

# Tester l'environnement bleu
./scripts/test-environment.sh production-blue

# Basculer le trafic vers le bleu (mise à jour manuelle du DNS/du répartiteur de charge)
./scripts/switch-traffic.sh production-blue

# Nettoyer l'environnement vert
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

### Déploiements Échelonnés
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

### Déploiements d’Applications Conteneurisées
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

### Optimisation Dockerfile Multi-Étapes
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

### Déploiements Spécifiques au Service
```bash
# Déployer un service spécifique pour une itération plus rapide
azd deploy --service web
azd deploy --service api

# Déployer tous les services
azd deploy
```

### Mise en Cache de la Compilation
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Déploiement Efficace du Code
```bash
# Utilisez azd deploy (pas azd up) pour les modifications de code uniquement
# Cela évite le provisionnement de l'infrastructure et est beaucoup plus rapide
azd deploy

# Déployez un service spécifique pour une itération plus rapide
azd deploy --service api
```

## 🔍 Supervision du Déploiement

### Supervision du Déploiement en Temps Réel
```bash
# Surveiller l'application en temps réel
azd monitor --live

# Voir les journaux de l'application
azd monitor --logs

# Vérifier le statut du déploiement
azd show
```

### Contrôles de Santé
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

### Validation Post-Déploiement
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

## 🔐 Considérations de Sécurité

### Gestion des Secrets
```bash
# Stocker les secrets de manière sécurisée
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Référencer les secrets dans azure.yaml
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

### Gestion des Identités et Accès
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

## 🚨 Stratégies de Rollback

### Rollback Rapide
```bash
# AZD ne dispose pas de fonction de retour en arrière intégrée. Approches recommandées :

# Option 1 : Redéployer depuis Git (recommandé)
git revert HEAD  # Revenir au commit problématique
git push
azd deploy

# Option 2 : Redéployer un commit spécifique
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback de l’Infrastructure
```bash
# Aperçu des modifications de l'infrastructure avant l'application
azd provision --preview

# Pour le retour en arrière de l'infrastructure, utilisez le contrôle de version :
git revert HEAD  # Annuler les modifications de l'infrastructure
azd provision    # Appliquer l'état précédent de l'infrastructure
```

### Rollback de Migration de Base de Données
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Indicateurs de Déploiement

### Suivre la Performance des Déploiements
```bash
# Voir le statut actuel du déploiement
azd show

# Surveiller l'application avec Application Insights
azd monitor --overview

# Voir les métriques en direct
azd monitor --live
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

## 🎯 Bonnes Pratiques

### 1. Cohérence des Environnements
```bash
# Utilisez une nomenclature cohérente
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintenez la parité de l'environnement
./scripts/sync-environments.sh
```

### 2. Validation de l’Infrastructure
```bash
# Prévisualiser les changements d'infrastructure avant le déploiement
azd provision --preview

# Utiliser le linting ARM/Bicep
az bicep lint --file infra/main.bicep

# Valider la syntaxe Bicep
az bicep build --file infra/main.bicep
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
# Documenter les procédures de déploiement
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Étapes Suivantes

- [Provisionnement des Ressources](provisioning.md) - Approfondissement de la gestion d’infrastructure
- [Planification Pré-Déploiement](../chapter-06-pre-deployment/capacity-planning.md) - Planifiez votre stratégie de déploiement
- [Problèmes Courants](../chapter-07-troubleshooting/common-issues.md) - Résolution des problèmes de déploiement
- [Bonnes Pratiques](../chapter-07-troubleshooting/debugging.md) - Stratégies de déploiement prêtes pour la production

## 🎯 Exercices Pratiques de Déploiement

### Exercice 1 : Workflow de Déploiement Incrémental (20 minutes)
**Objectif** : Maîtriser la différence entre déploiements complets et incrémentaux

```bash
# Déploiement initial
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Enregistrer le temps de déploiement initial
echo "Full deployment: $(date)" > deployment-log.txt

# Faire un changement de code
echo "// Updated $(date)" >> src/api/src/server.js

# Déployer uniquement le code (rapide)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Comparer les temps
cat deployment-log.txt

# Nettoyer
azd down --force --purge
```

**Critères de Succès :**
- [ ] Le déploiement complet prend 5-15 minutes
- [ ] Le déploiement code-seulement prend 2-5 minutes
- [ ] Les changements de code sont reflétés dans l’application déployée
- [ ] L’infrastructure reste inchangée après `azd deploy`

**Résultat attendu** : `azd deploy` est 50-70 % plus rapide que `azd up` pour les modifications de code

### Exercice 2 : Hooks de Déploiement Personnalisés (30 minutes)
**Objectif** : Mettre en place l’automatisation avant et après déploiement

```bash
# Créer un script de validation avant déploiement
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

# Créer un test de fumée après déploiement
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

# Tester le déploiement avec les hooks
azd deploy
```

**Critères de Succès :**
- [ ] Le script pré-déploiement s’exécute avant le déploiement
- [ ] Le déploiement est interrompu si les tests échouent
- [ ] Le test post-déploiement valide la santé
- [ ] Les hooks s’exécutent dans le bon ordre

### Exercice 3 : Stratégie de Déploiement Multi-Environnements (45 minutes)
**Objectif** : Implémenter un workflow de déploiement échelonné (dev → staging → production)

```bash
# Créer un script de déploiement
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Étape 1 : Déployer en dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Étape 2 : Déployer en staging
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

# Exécuter un déploiement par étapes
./deploy-staged.sh
```

**Critères de Succès :**
- [ ] L’environnement dev se déploie avec succès
- [ ] L’environnement staging se déploie avec succès
- [ ] Une approbation manuelle est requise pour la production
- [ ] Tous les environnements ont des contrôles de santé fonctionnels
- [ ] Possibilité de rollback si nécessaire

### Exercice 4 : Stratégie de Rollback (25 minutes)
**Objectif** : Mettre en œuvre et tester le rollback de déploiement via Git

```bash
# Déployer v1
azd env set APP_VERSION "1.0.0"
azd up

# Enregistrer le hash du commit v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Déployer v2 avec changement incompatible
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Détecter l'échec et revenir en arrière
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Revenir en arrière en utilisant git
    git revert HEAD --no-edit
    
    # Revenir en arrière l'environnement
    azd env set APP_VERSION "1.0.0"
    
    # Redéployer v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Critères de Succès :**
- [ ] Capacité à détecter les échecs de déploiement
- [ ] Le script de rollback s’exécute automatiquement
- [ ] L’application revient à un état fonctionnel
- [ ] Les contrôles de santé passent après rollback

## 📊 Suivi des Indicateurs de Déploiement

### Suivez la Performance de Vos Déploiements

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Enregistrer dans un fichier
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Utilisez-le
./track-deployment.sh
```

**Analysez vos métriques :**
```bash
# Voir l'historique des déploiements
cat deployment-metrics.csv

# Calculer le temps moyen de déploiement
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Ressources Supplémentaires

- [Référence Déploiement Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Déploiement Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Déploiement Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Déploiement Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Leçon Précédente** : [Votre Premier Projet](../chapter-01-foundation/first-project.md)
- **Leçon Suivante** : [Provisionnement des Ressources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, une traduction professionnelle humaine est recommandée. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->