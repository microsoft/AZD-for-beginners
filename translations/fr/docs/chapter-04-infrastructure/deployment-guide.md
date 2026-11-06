# Guide de Déploiement - Maîtriser les Déploiements AZD

**Navigation du Chapitre :**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 4 - Infrastructure as Code & Déploiement
- **⬅️ Chapitre Précédent** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Suivant** : [Provisionnement des Ressources](provisioning.md)
- **🧩 Aussi dans ce chapitre** : [Création de Votre Propre Template](custom-templates.md)
- **🚀 Chapitre Suivant** : [Chapitre 5 : Solutions IA Multi-Agents](../../examples/retail-scenario.md)

## Introduction

> Revu selon `azd 1.37.2` (novembre 2026). Les commandes utilisent Bash ; les exemples JSON nécessitent `jq`. À l’exception de l’exercice todo explicitement initialisé, les exemples avancés sont des **fragments d’intégration** : fournissez votre propre source, infrastructure, tests et scripts. Aucun déploiement Azure n’a été exécuté lors de cette revue.

Ce guide complet couvre tout ce que vous devez savoir pour déployer des applications en utilisant Azure Developer CLI, des déploiements basiques en une seule commande aux scénarios avancés de production avec hooks personnalisés, environnements multiples et intégration CI/CD. Maîtrisez le cycle complet de déploiement avec des exemples pratiques et les meilleures pratiques.

## Objectifs d’Apprentissage

En complétant ce guide, vous allez :
- Maîtriser toutes les commandes et workflows de déploiement Azure Developer CLI
- Comprendre le cycle complet de déploiement du provisionnement à la surveillance
- Implémenter des hooks de déploiement personnalisés pour l’automatisation avant et après déploiement
- Configurer plusieurs environnements avec des paramètres spécifiques à chaque environnement
- Mettre en place des stratégies avancées de déploiement incluant blue-green et canary deployments
- Intégrer les déploiements azd avec les pipelines CI/CD et workflows DevOps

## Résultats d’Apprentissage

Après avoir terminé, vous serez capable de :
- Exécuter et dépanner indépendamment tous les workflows de déploiement azd
- Concevoir et implémenter une automatisation de déploiement personnalisée via des hooks
- Configurer des déploiements prêts pour la production avec sécurité et surveillance adéquates
- Gérer des scénarios de déploiement multi-environnements complexes
- Optimiser les performances de déploiement et mettre en œuvre des stratégies de rollback
- Intégrer les déploiements azd dans les pratiques DevOps d'entreprise

## Vue d’Ensemble du Déploiement

Azure Developer CLI fournit plusieurs commandes de déploiement :
- `azd up` - Workflow complet (provision + déploiement)
- `azd provision` - Créer/mettre à jour uniquement les ressources Azure
- `azd deploy` - Déployer uniquement le code de l’application
- `azd package` - Construire et packager les applications

## Workflows de Déploiement Basique

### Déploiement Complet (azd up)
Le workflow le plus courant pour les nouveaux projets :
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Déploiement Infrastructure-Seulement
Quand vous avez seulement besoin de mettre à jour les ressources Azure :
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Déploiement Code-Seulement
Pour des mises à jour rapides de l’application :
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Vérification du Déploiement

Après chaque déploiement, vérifiez la réussite :

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Critères de Réussite :**
- ✅ `azd show` résout les cibles/URLs de service attendues
- ✅ Les requêtes aux routes réelles de l’application retournent le statut et le corps attendus
- ✅ Pas de logs d’erreur dans les 5 dernières minutes
- ✅ L’application répond aux requêtes de test

## 🏗️ Comprendre le Processus de Déploiement

### Nouveau dans les hooks ? Commencez ici

Un **hook** est une commande qu’azd exécute automatiquement à un moment précis du processus de déploiement — avant ou après le provisionnement, et avant ou après le déploiement de votre code. Ils vous permettent d’automatiser les petites tâches habituelles qui accompagnent toujours un déploiement : initialiser une base de données, exécuter des migrations, construire des assets, ou faire un smoke-test de l’application en production.

| Hook | S’exécute… | Usage commun |
|------|------------|-------------|
| `preprovision` | Avant la création des ressources | Valider les prérequis, se connecter à un registre |
| `postprovision` | Après l’existence des ressources | Configurer les ressources, initialiser la base de données |
| `predeploy` | Avant le déploiement du code | Construire les assets front-end, exécuter les tests unitaires |
| `postdeploy` | Après que le code est en production | Exécuter les migrations DB, faire un smoke-test du point d’accès |

Les hooks vivent dans votre `azure.yaml`. Voici l’exemple le plus simple possible — il imprime un message après le déploiement :

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

C’est tout — la prochaine fois que vous lancez `azd up`, le message s’imprime automatiquement. Vous pouvez aussi exécuter un hook seul, sans un déploiement complet, ce qui est idéal pour les tests :

```bash
azd hooks run postdeploy
```

Les phases ci-dessous montrent des hooks réels (migrations, tests, validation) pour chaque étape.

### Phase 1 : Hooks Pré-Provision
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

### Phase 2 : Provisionnement de l’Infrastructure
- Lit les templates d’infrastructure (Bicep/Terraform)
- Crée ou met à jour les ressources Azure
- Configure le réseau et la sécurité
- Met en place la surveillance et la journalisation

### Phase 3 : Hooks Post-Provision
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
- Construit le code de l’application
- Crée les artefacts de déploiement
- Package pour la plateforme cible (conteneurs, fichiers ZIP, etc.)

### Phase 5 : Hooks Pré-Déploiement
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
- Déploie les applications packagées vers les services Azure
- Met à jour les paramètres de configuration
- Démarre/redémarre les services

### Phase 7 : Hooks Post-Déploiement
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### Gestion des Erreurs de Hook

Par défaut, **si une commande hook se termine avec un code non nul, azd interrompt toute l’opération.** C’est généralement ce que vous souhaitez — une migration échouée doit stopper le déploiement, pas livrer une application cassée. Cela implique que les hooks doivent être écrits avec soin.

**1. Faites que les échecs soient forts et intentionnels.** Un hook échoue lorsque sa dernière commande retourne un code de sortie non nul. Dans les scripts shell, ajoutez `set -e` pour que le hook s’arrête dès la première commande échouée au lieu de continuer silencieusement :

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Autorisez un hook à échouer sans arrêter azd.** Pour des étapes non critiques (chauffage de cache optionnel, notification en mode best-effort), définissez `continueOnError: true`. azd consigne l'échec mais continue :

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testez les hooks en isolation avant un passage complet.** Vous n'avez pas besoin de lancer `azd up` pour déboguer un hook — lancez-le seul et itérez rapidement :

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Attention aux shells spécifiques à l’OS.** Un hook utilisant `shell: pwsh` nécessite que PowerShell soit installé sur la machine qui l’exécute (y compris les agents CI). Utilisez `shell: sh` pour la plus large portabilité, ou fournissez à la fois les variantes `windows` et `posix` :

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **Astuce de débogage :** lancez n’importe quelle commande azd avec `--debug` pour voir la ligne de commande exacte du hook et sa sortie complète — inestimable quand un hook fonctionne localement mais échoue en CI.

## 🎛️ Configuration du Déploiement

### Paramètres de Déploiement Spécifiques au Service
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Configurations Spécifiques à l’Environnement

Ce sont uniquement des valeurs azd locales. Mappez-les explicitement à la configuration infrastructure/exécution. `NODE_ENV` est normalement `production` pour une application Node déployée, y compris un déploiement de staging ; utilisez une variable spécifique à l’application pour distinguer les phases de déploiement.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
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

**Esquisse opérationnelle illustrative :** vous devez fournir les deux environnements, une couche de routage de trafic partagée, et les deux scripts ci-dessous. azd ne bascule pas automatiquement le trafic ni ne valide la préparation au rollback. Gardez green jusqu’à ce que blue ait réussi les tests et que le rollback ne soit plus nécessaire.

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
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Le fractionnement du trafic appartient à la configuration Container Apps (Bicep ou Azure CLI), pas à une propriété `azure.yaml` `trafficSplit` d’azd. La prévisualisation/provisionnement et les déploiements ultérieurs doivent conserver le mode de révision choisi et les règles de routage.

### Déploiements en Étapes
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Déploiement de Conteneurs

### Déploiements Container App
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Configurez les secrets d’exécution avec `configuration.secrets`/`secretRef` (ou références Key Vault) et la mise à l’échelle avec `template.scale` dans l’infrastructure Container App. N’inventez pas de propriétés `secrets` ou `scale` au niveau service dans `azure.yaml`.

### Optimisation Dockerfile Multi-Étapes
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
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
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Cache de Build
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Le workflow Node standard utilise des scripts de package ; les hooks `prepackage` service peuvent ajouter des étapes nécessaires. Le cache de couche Docker est séparé de la définition d’une commande de build service.

### Déploiements Code Efficaces
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Surveillance du Déploiement

### Surveillance du Déploiement en Temps Réel
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Contrôles de Santé
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

Votre application doit implémenter `/health` ; cela n’est pas fourni automatiquement par azd. Il n’y a pas de propriété de service générique `azure.yaml` `healthCheck`.

### Validation Post-Déploiement
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
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
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` est invalide. Les valeurs d’environnement ordinaires sont du texte clair local ; ne supposez pas que les commandes de lecture les masquent. Les commandes ci-dessus enregistrent les références Key Vault, mais votre infrastructure/application doit encore consommer les secrets et accorder l’accès via l’identité d’exécution.

### Sécurité Réseau
Déclarez et consommez les paramètres réseau dans Bicep et mappez-les dans `infra/main.parameters.json`. Il n’y a pas de couche générique `infra.parameters` dans `azure.yaml`. Les plages documentées d’exemple `203.0.113.0/24` et `198.51.100.0/24` ne sont pas des réseaux bureau/VPN réels ; remplacez-les par des plages autorisées.

### Gestion des Identités et des Accès
Activez le `identity` du Container App dans Bicep et assignez le rôle de plan de données Key Vault nécessaire au scope du coffre. Configurez les secrets nommés soutenus par Key Vault et les références d’exécution dans cette ressource ; `identity` et `keyVault` ne sont pas des propriétés de service génériques azd. Voir [Authentification & Identité Gérée](../chapter-03-configuration/authsecurity.md).

## 🚨 Stratégies de Rollback

### Rollback Rapide
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Rollback Infrastructure
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Rollback Migration de Base de Données
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

### Suivre la Performance du Déploiement
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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

### 1. Cohérence de l’Environnement
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validation de l’Infrastructure
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Étapes Suivantes

- [Provisionnement des Ressources](provisioning.md) - Approfondir la gestion de l’infrastructure
- [Planification Pré-Déploiement](../chapter-06-pre-deployment/capacity-planning.md) - Planifiez votre stratégie de déploiement
- [Problèmes Courants](../chapter-07-troubleshooting/common-issues.md) - Résoudre les problèmes de déploiement
- [Bonnes Pratiques](../chapter-07-troubleshooting/debugging.md) - Stratégies de déploiement prêtes pour la production

## 🎯 Exercices Pratiques de Déploiement

### Exercice 1 : Workflow de Déploiement Incrémental (20 minutes)
**Objectif** : Maîtriser la différence entre déploiements complets et incrémentaux

**Point de départ :** Bash, Node.js 22, Git, connexion azd, et un abonnement Azure avec les permissions de déploiement. Exécutez dans un nouveau répertoire ; attendez-vous à des ressources App Service/Cosmos DB facturables. Les durées dépendent de la région et du template.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Critères de Réussite :**
- [ ] Enregistrer le temps écoulé pour les deux commandes (durée non garantie)
- [ ] Les deux commandes se terminennt avec succès
- [ ] L’API reste fonctionnelle ; la modification par ajout de commentaire n’est pas un changement visible sur l’UI
- [ ] Infrastructure inchangée après `azd deploy`

**Résultat d’Apprentissage** : `azd deploy` évite le provisionnement d’infrastructure. Comparez les temps mesurés au lieu de supposer un gain fixe en pourcentage.

### Exercice 2 : Hooks Personnalisés de Déploiement (30 minutes)
**Objectif** : Implémenter une automatisation avant et après le déploiement

**Point de départ :** le projet `deployment-practice` initialisé ci-dessus. Si vous l’avez nettoyé, lancez `azd up` à nouveau avant de tester le déploiement code-seulement. La validation ci-dessous utilise le script de build réel de l’API, pas un script `test:unit` racine inexistant. Les tests API du template nécessitent un accès configuré à la base de données ; ils ne sont pas des tests unitaires isolés.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Critères de Réussite :**
- [ ] Le script pré-déploiement s’exécute avant le déploiement
- [ ] Le déploiement est interrompu si la validation du build échoue
- [ ] Le smoke-test post-déploiement valide la santé
- [ ] Les hooks s’exécutent dans le bon ordre

### Exercice 3 : Stratégie de Déploiement Multi-Environnement (45 minutes)
**Objectif** : Implémenter un workflow de déploiement en étapes (dev → staging → production)

**Point de départ :** le même projet todo initialisé avec `jq`. Créez les environnements ci-dessous avec de vraies valeurs d’abonnement/emplacement (ou configurez `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` dans chacun) **avant** d’invoquer le workflow sans invite. Il échoue intentionnellement plutôt que d’inventer des valeurs manquantes. Utilisez uniquement des environnements d’entraînement jetables, pas un abonnement de production réel.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Critères de réussite :**
- [ ] L’environnement Dev se déploie avec succès
- [ ] L’environnement Staging se déploie avec succès
- [ ] Approbation manuelle requise pour la production
- [ ] Tous les environnements ont des contrôles de santé fonctionnels
- [ ] Peut revenir en arrière si nécessaire

### Exercice 4 : Stratégie de rollback (25 minutes)
**Objectif** : Implémenter et tester le rollback de déploiement en utilisant Git

**Point de départ :** une extraction d’entraînement isolée du modèle todo avec toute la source de référence commise, un arbre de travail Git propre, et un environnement configuré jetable. N’introduisez jamais de défaillances volontaires dans un projet de production réel. `APP_VERSION` ci-dessous n’est utilisé que pour la gestion sauf si vous l’intégrez explicitement dans l’application.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Critères de réussite :**
- [ ] Peut détecter les échecs de déploiement
- [ ] Le script de rollback s’exécute automatiquement
- [ ] L’application revient à un état fonctionnel
- [ ] Les contrôles de santé passent après rollback

## 📊 Suivi des métriques de déploiement

### Suivez vos performances de déploiement

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Analysez vos métriques :**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Ressources supplémentaires

- [Référence de déploiement Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Déploiement Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Déploiement Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Déploiement Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Leçon précédente** : [Votre premier projet](../chapter-01-foundation/first-project.md)
- **Leçon suivante** : [Provision des ressources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->