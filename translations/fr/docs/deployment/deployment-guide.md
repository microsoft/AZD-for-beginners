<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-19T14:33:46+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "fr"
}
-->
# Guide de Déploiement - Maîtriser les Déploiements AZD

**Navigation des Chapitres :**
- **📚 Accueil du Cours** : [AZD pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 4 - Infrastructure en tant que Code & Déploiement
- **⬅️ Chapitre Précédent** : [Chapitre 3 : Configuration](../getting-started/configuration.md)
- **➡️ Suivant** : [Provisionnement des Ressources](provisioning.md)
- **🚀 Chapitre Suivant** : [Chapitre 5 : Solutions IA Multi-Agent](../../examples/retail-scenario.md)

## Introduction

Ce guide complet couvre tout ce que vous devez savoir sur le déploiement d'applications avec Azure Developer CLI, des déploiements simples en une commande aux scénarios avancés de production avec des hooks personnalisés, plusieurs environnements et intégration CI/CD. Maîtrisez le cycle de vie complet du déploiement grâce à des exemples pratiques et des meilleures pratiques.

## Objectifs d'Apprentissage

En suivant ce guide, vous allez :
- Maîtriser toutes les commandes et workflows de déploiement d'Azure Developer CLI
- Comprendre le cycle de vie complet du déploiement, du provisionnement à la surveillance
- Implémenter des hooks personnalisés pour automatiser les étapes avant et après le déploiement
- Configurer plusieurs environnements avec des paramètres spécifiques
- Mettre en place des stratégies de déploiement avancées, y compris les déploiements blue-green et canary
- Intégrer les déploiements azd dans des pipelines CI/CD et des workflows DevOps

## Résultats d'Apprentissage

À la fin, vous serez capable de :
- Exécuter et résoudre les problèmes de tous les workflows de déploiement azd de manière autonome
- Concevoir et implémenter une automatisation personnalisée pour le déploiement avec des hooks
- Configurer des déploiements prêts pour la production avec une sécurité et une surveillance appropriées
- Gérer des scénarios complexes de déploiement multi-environnements
- Optimiser les performances de déploiement et mettre en œuvre des stratégies de retour en arrière
- Intégrer les déploiements azd dans les pratiques DevOps d'entreprise

## Aperçu du Déploiement

Azure Developer CLI propose plusieurs commandes de déploiement :
- `azd up` - Workflow complet (provisionnement + déploiement)
- `azd provision` - Créer/mettre à jour uniquement les ressources Azure
- `azd deploy` - Déployer uniquement le code de l'application
- `azd package` - Construire et empaqueter les applications

## Workflows de Déploiement de Base

### Déploiement Complet (azd up)
Le workflow le plus courant pour les nouveaux projets :
```bash
# Déployer tout depuis le début
azd up

# Déployer avec un environnement spécifique
azd up --environment production

# Déployer avec des paramètres personnalisés
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Déploiement Infrastructure Seulement
Lorsque vous devez uniquement mettre à jour les ressources Azure :
```bash
# Fournir/mettre à jour l'infrastructure
azd provision

# Fournir avec un essai à blanc pour prévisualiser les changements
azd provision --preview

# Fournir des services spécifiques
azd provision --service database
```

### Déploiement Code Seulement
Pour des mises à jour rapides de l'application :
```bash
# Déployer tous les services
azd deploy

# Résultat attendu :
# Déploiement des services (azd deploy)
# - web : Déploiement... Terminé
# - api : Déploiement... Terminé
# SUCCÈS : Votre déploiement s'est terminé en 2 minutes 15 secondes

# Déployer un service spécifique
azd deploy --service web
azd deploy --service api

# Déployer avec des arguments de construction personnalisés
azd deploy --service api --build-arg NODE_ENV=production

# Vérifier le déploiement
azd show --output json | jq '.services'
```

### ✅ Vérification du Déploiement

Après tout déploiement, vérifiez le succès :

```bash
# Vérifiez que tous les services fonctionnent
azd show

# Testez les points de terminaison de santé
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Vérifiez les journaux pour les erreurs
azd logs --service api --since 5m | grep -i error
```

**Critères de Succès :**
- ✅ Tous les services affichent le statut "Running"
- ✅ Les points de santé renvoient HTTP 200
- ✅ Aucun journal d'erreur dans les 5 dernières minutes
- ✅ L'application répond aux requêtes de test

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
- Compile le code de l'application
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

### Paramètres de Déploiement Spécifiques aux Services
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
# Créer un environnement bleu
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
# déployer-mis-en-scène.sh

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

### Optimisation Multi-Étapes Dockerfile
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
# Configurer le déploiement parallèle
azd config set deploy.parallelism 5

# Déployer les services en parallèle
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
# Déployer uniquement les services modifiés
azd deploy --incremental

# Déployer avec détection des changements
azd deploy --detect-changes
```

## 🔍 Surveillance du Déploiement

### Surveillance en Temps Réel
```bash
# Surveiller la progression du déploiement
azd deploy --follow

# Voir les journaux de déploiement
azd logs --follow --service api

# Vérifier l'état du déploiement
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
# Stocker les secrets en toute sécurité
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

### Retour en Arrière Rapide
```bash
# Revenir au déploiement précédent
azd deploy --rollback

# Revenir à un service spécifique
azd deploy --service api --rollback

# Revenir à une version spécifique
azd deploy --service api --version v1.2.3
```

### Retour en Arrière de l'Infrastructure
```bash
# Annuler les modifications de l'infrastructure
azd provision --rollback

# Prévisualiser les modifications d'annulation
azd provision --rollback --preview
```

### Retour en Arrière des Migrations de Base de Données
```bash
#!/bin/bash
# scripts/annuler-base-de-données.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Métriques de Déploiement

### Suivi des Performances de Déploiement
```bash
# Activer les métriques de déploiement
azd config set telemetry.deployment.enabled true

# Voir l'historique de déploiement
azd history

# Obtenir les statistiques de déploiement
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
# Utiliser une nomenclature cohérente
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintenir la parité de l'environnement
./scripts/sync-environments.sh
```

### 2. Validation de l'Infrastructure
```bash
# Valider avant le déploiement
azd provision --preview
azd provision --what-if

# Utiliser le linting ARM/Bicep
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
# Documenter les procédures de déploiement
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Prochaines Étapes

- [Provisionnement des Ressources](provisioning.md) - Approfondissement de la gestion de l'infrastructure
- [Planification Avant Déploiement](../pre-deployment/capacity-planning.md) - Planifiez votre stratégie de déploiement
- [Problèmes Courants](../troubleshooting/common-issues.md) - Résolvez les problèmes de déploiement
- [Meilleures Pratiques](../troubleshooting/debugging.md) - Stratégies de déploiement prêtes pour la production

## 🎯 Exercices Pratiques de Déploiement

### Exercice 1 : Workflow de Déploiement Incrémental (20 minutes)
**Objectif** : Maîtriser la différence entre les déploiements complets et incrémentaux

```bash
# Déploiement initial
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Enregistrer l'heure du déploiement initial
echo "Full deployment: $(date)" > deployment-log.txt

# Apporter une modification au code
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
- [ ] Le déploiement code seulement prend 2-5 minutes
- [ ] Les modifications du code sont reflétées dans l'application déployée
- [ ] L'infrastructure reste inchangée après `azd deploy`

**Résultat d'Apprentissage** : `azd deploy` est 50-70% plus rapide que `azd up` pour les modifications de code

### Exercice 2 : Hooks de Déploiement Personnalisés (30 minutes)
**Objectif** : Implémenter une automatisation avant et après le déploiement

```bash
# Créer un script de validation avant déploiement
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Vérifier si les tests réussissent
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

# Tester le déploiement avec des hooks
azd deploy
```

**Critères de Succès :**
- [ ] Le script avant déploiement s'exécute avant le déploiement
- [ ] Le déploiement est annulé si les tests échouent
- [ ] Le test de validation après déploiement vérifie la santé
- [ ] Les hooks s'exécutent dans le bon ordre

### Exercice 3 : Stratégie de Déploiement Multi-Environnements (45 minutes)
**Objectif** : Implémenter un workflow de déploiement étagé (dev → staging → production)

```bash
# Créer un script de déploiement
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

**Critères de Succès :**
- [ ] L'environnement de développement est déployé avec succès
- [ ] L'environnement de staging est déployé avec succès
- [ ] Une approbation manuelle est requise pour la production
- [ ] Tous les environnements ont des vérifications de santé fonctionnelles
- [ ] Un retour en arrière est possible si nécessaire

### Exercice 4 : Stratégie de Retour en Arrière (25 minutes)
**Objectif** : Implémenter et tester un retour en arrière de déploiement

```bash
# Déployer v1
azd env set APP_VERSION "1.0.0"
azd up

# Enregistrer la configuration v1
cp -r .azure/production .azure/production-v1-backup

# Déployer v2 avec changement majeur
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Détecter l'échec
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Restaurer le code
    git checkout src/api/src/server.js
    
    # Restaurer l'environnement
    azd env set APP_VERSION "1.0.0"
    
    # Redéployer v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Critères de Succès :**
- [ ] Les échecs de déploiement sont détectés
- [ ] Le script de retour en arrière s'exécute automatiquement
- [ ] L'application revient à un état fonctionnel
- [ ] Les vérifications de santé réussissent après le retour en arrière

## 📊 Suivi des Métriques de Déploiement

### Suivez les Performances de Votre Déploiement

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

**Analysez vos métriques :**
```bash
# Voir l'historique des déploiements
cat deployment-metrics.csv

# Calculer le temps moyen de déploiement
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

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

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, une traduction humaine professionnelle est recommandée. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->