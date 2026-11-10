# Deployement Gids - meester worden in AZD Deployments

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 4 - Infrastructure als Code & Deployement
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)
- **➡️ Volgende**: [Provisioning Resources](provisioning.md)
- **🧩 Ook in dit hoofdstuk**: [Je Eigen Sjabloon Schrijven](custom-templates.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 5: Multi-Agent AI Oplossingen](../../examples/retail-scenario.md)

## Introductie

> Gecontroleerd ten opzichte van `azd 1.37.2` (november 2026). Commando's gebruiken Bash; JSON voorbeelden vereisen `jq`. Behalve voor de expliciet geïnitieerde todo oefening zijn geavanceerde voorbeelden **integratief fragmenten**: lever je eigen bron, infrastructuur, tests en scripts aan. Er zijn geen Azure deploys uitgevoerd in deze controle.

Deze uitgebreide gids behandelt alles wat je moet weten over het deployen van applicaties met Azure Developer CLI, van eenvoudige één-commando deploys tot geavanceerde productiescenario's met aangepaste hooks, meerdere omgevingen en CI/CD integratie. Beheers de volledige deploy lifecycle met praktische voorbeelden en best practices.

## Leerdoelen

Na het voltooien van deze gids zul je:
- Alle Azure Developer CLI deploy commando's en workflows beheersen
- De volledige deploy lifecycle begrijpen van provisioning tot monitoring
- Aangepaste deploy hooks implementeren voor pre- en post-deployment automatisering
- Meerdere omgevingen configureren met omgevingsspecifieke parameters
- Geavanceerde deploy strategieën opzetten, inclusief blue-green en canary deploys
- AZD deploys integreren met CI/CD pipelines en DevOps workflows

## Leeruitkomsten

Na voltooiing ben je in staat om:
- Alle azd deploy workflows zelfstandig uit te voeren en problemen op te lossen
- Aangepaste deploy automatisering te ontwerpen en implementeren met hooks
- Productieklare deploys configureren met passende beveiliging en monitoring
- Complexe multi-omgeving deploy scenario's beheren
- Deploy prestaties optimaliseren en rollback strategieën implementeren
- Azd deploys integreren in enterprise DevOps praktijken

## Deploy Overzicht

Azure Developer CLI biedt diverse deploy commando's:
- `azd up` - Complete workflow (provision + deploy)
- `azd provision` - Alleen Azure resources aanmaken/bijwerken
- `azd deploy` - Alleen applicatiecode deployen
- `azd package` - Applicaties bouwen en verpakken

## Basis Deploy Workflows

### Complete Deploy (azd up)
De meest gebruikte workflow voor nieuwe projecten:
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

### Alleen Infrastructuur Deploy
Als je alleen Azure resources hoeft bij te werken:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Alleen Code Deploy
Voor snelle applicatie-updates:
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

### ✅ Deploy Verificatie

Na elke deploy, verifieer het succes:

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

**Succescriteria:**
- ✅ `azd show` lost de verwachte service doelen/URL's op
- ✅ Verzoeken naar daadwerkelijke applicatie-routes retourneren de verwachte status en inhoud
- ✅ Geen foutlogs in de laatste 5 minuten
- ✅ Applicatie reageert op testverzoeken

## 🏗️ Het Deploy Proces Begrijpen

### Nieuw met hooks? Begin hier

Een **hook** is een commando dat azd automatisch uitvoert op een specifiek moment in het deploy proces—voor of na provisioning, en voor of na het deployen van je code. Ze stellen je in staat de kleine klusjes te automatiseren die altijd bij een deploy horen: een database vullen, migraties draaien, assets bouwen, of de live app checken.

| Hook | Wordt uitgevoerd… | Gezamenlijk gebruik |
|------|-------|------------|
| `preprovision` | Voor resources worden aangemaakt | Validatie van vereisten, inloggen bij een registry |
| `postprovision` | Nadat resources bestaan | Configureren van resources, database opzetten |
| `predeploy` | Voor code wordt gedeployed | Front-end assets bouwen, unit tests draaien |
| `postdeploy` | Nadat code live is | DB migraties uitvoeren, endpoint testen |

Hooks staan in jouw `azure.yaml`. Hier is het kleinste mogelijke voorbeeld—het print alleen een bericht na deploy:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Dat is alles—de volgende keer dat je `azd up` draait, print het bericht automatisch. Je kunt een hook ook afzonderlijk draaien, zonder volledige deploy, wat handig is voor testen:

```bash
azd hooks run postdeploy
```

Hieronder zie je de fases met praktische hooks (migraties, tests, validatie) voor elke stap.

### Fase 1: Pre-Provision Hooks
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

### Fase 2: Infrastructure Provisioning
- Leest infrastructuur sjablonen (Bicep/Terraform)
- Maakt aan of werkt Azure resources bij
- Configureren van netwerk en beveiliging
- Zet monitoring en logging op

### Fase 3: Post-Provision Hooks
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

### Fase 4: Applicatie Packaging
- Bouwt applicatie code
- Creëert deploy artefacten
- Pakt in voor doelsysteem (containers, ZIP bestanden, etc.)

### Fase 5: Pre-Deploy Hooks
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

### Fase 6: Applicatie Deployment
- Deployt verpakte applicaties naar Azure services
- Werkt configuratie-instellingen bij
- Start/stopt services

### Fase 7: Post-Deploy Hooks
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

### Omgaan met Hook Fouten

Standaard **stop azd de hele operatie als een hook commando met een niet-nul exit code stopt.** Dit is doorgaans gewenst—een mislukte migratie moet de deploy stoppen, niet een kapotte app uitrollen. Maar het betekent dat hooks zorgvuldig geschreven moeten worden.

**1. Maak fouten luidruchtig en bewust.** Een hook faalt als zijn laatste commando een niet-nul exit code teruggeeft. Voeg in shell scripts `set -e` toe zodat de hook stopt bij de eerste fout in plaats van stilletjes door te gaan:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Sta toe dat een hook faalt zonder azd te stoppen.** Voor niet-kritieke stappen (optionele cache warming, een best-effort melding) zet `continueOnError: true`. azd logt de fout maar gaat door:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Test hooks los van de volledige run.** Je hoeft `azd up` niet te draaien om een hook te debuggen—draai hem apart en iteratief snel:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Let op OS-specifieke shells.** Een hook die `shell: pwsh` gebruikt moet PowerShell geïnstalleerd hebben op het executing machine (inclusief CI agents). Gebruik `shell: sh` voor de breedste compatibiliteit, of lever zowel `windows` als `posix` varianten:

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

> **Debug tip:** draai een azd commando met `--debug` om de precieze hook commando regel en volledige output te zien—onmisbaar wanneer een hook lokaal werkt maar faalt in CI.

## 🎛️ Deploy Configuratie

### Dienstspecifieke Deploy Settings
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

### Omgevingspecifieke Configuraties

Dit zijn alleen lokale azd waarden. Map ze expliciet naar infrastructuur/runtime configuratie. `NODE_ENV` is normaal `production` voor een gedeployde Node app, inclusief staging deploy; gebruik een aparte app-specifieke variabele om deploy fasen te onderscheiden.

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

## 🔧 Geavanceerde Deploy Scenario's

### Multi-Service Applicaties
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

**Illustratieve operationele schets:** je moet beide omgevingen leveren, een gedeelde traffic-routing laag, en de twee scripts hieronder. Azd wisselt verkeer of valideert rollback gereedheid niet automatisch. Houd groen aan tot blauw is getest en rollback niet meer nodig is.

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

### Canary Deployments
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Traffic splitting hoort bij Container Apps configuratie (Bicep of Azure CLI), niet bij een `azure.yaml` `trafficSplit` property. Preview/provisioning en latere deploys moeten je gekozen revisiemodus en routeringsregels behouden.

### Gefaseerde Deployments
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

## 🐳 Container Deployments

### Container App Deployments
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

Configureer runtime secrets met `configuration.secrets`/`secretRef` (of Key Vault verwijzingen) en scaling met `template.scale` in Container App infrastructuur. Vermijd service-level `secrets` of `scale` eigenschappen in `azure.yaml`.

### Multi-Stage Dockerfile Optimalisatie
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

## ⚡ Prestatie Optimalisatie

### Dienstspecifieke Deploys
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Build Caching
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

De standaard Node workflow gebruikt package scripts; service `prepackage` hooks kunnen vereiste stappen toevoegen. Docker layer caching is apart van service build commands.

### Efficiënte Code Deploys
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Deploy Monitoring

### Real-Time Deploy Monitoring
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Gezondheidschecks
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

Je app moet `/health` implementeren; azd levert dit niet automatisch. Er is geen generieke `azure.yaml` `healthCheck` service property.

### Post-Deploy Validatie
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

## 🔐 Beveiligingsaspecten

### Secrets Management
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` is ongeldig. Gewone omgevingswaarden zijn lokaal in platte tekst; neem niet aan dat leescommando's deze verbergen. De commando's hierboven slaan Key Vault verwijzingen op, maar je infrastructuur/app moet de geheimen zelf consumeren en runtime identiteit toegang geven.

### Netwerk Beveiliging
Declareer en gebruik netwerkparameters in Bicep, en map ze in `infra/main.parameters.json`. Er is geen generieke `infra.parameters` overlay in `azure.yaml`. Voorbeeld documentatie reiken `203.0.113.0/24` en `198.51.100.0/24` zijn geen echte kantoor/VPN netwerken; vervang ze door geautoriseerde netwerkbereiken.

### Identiteit en Toegangsbeheer
Schakel de Container App's `identity` in Bicep in en ken de benodigde Key Vault data-plane rol toe op het vault niveau. Configureer benoemde Key Vault-ondersteunde secrets en runtime verwijzingen in die resource; `identity` en `keyVault` zijn geen generieke azd service eigenschappen. Zie [Authenticatie & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Rollback Strategieën

### Snelle Rollback
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

### Infrastructuur Rollback
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Database Migratie Rollback
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Deploy Metrics

### Houd Deploy Prestatie bij
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Aangepaste Metrics Verzameling
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

### 1. Omgevingsconsistentie
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Infrastructuur Validatie
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Test Integratie
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

### 4. Documentatie en Logging
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Volgende Stappen

- [Provisioning Resources](provisioning.md) - Diepgaande infrastructuur beheersing
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Plan je deploy strategie
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Los deploy problemen op
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Productieklare deploy strategieën

## 🎯 Hands-On Deploy Oefeningen

### Oefening 1: Incrementele Deploy Workflow (20 minuten)
**Doel**: Beheers het verschil tussen volledige en incrementele deploys

**Startpunt:** Bash, Node.js 22, Git, azd aanmelding, en een Azure abonnement met deploy rechten. Draai in een nieuwe map; verwacht factureerbare App Service/Cosmos DB resources. Duur hangt af van regio en sjabloon.

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

**Succescriteria:**
- [ ] Leg voltooiingstijd voor beide commando's vast (geen gegarandeerde duur)
- [ ] Beide commando's ronden succesvol af
- [ ] API blijft functioneel; commentaar-only wijziging geeft geen zichtbare UI wijziging
- [ ] Infrastructuur blijft ongewijzigd na `azd deploy`

**Leeruitkomst**: `azd deploy` slaat infrastructuur provisioning over. Vergelijk gemeten tijden in plaats van een vaste procentuele versnelling aannemen.

### Oefening 2: Aangepaste Deploy Hooks (30 minuten)
**Doel**: Implementeer pre- en post-deploy automatisering

**Startpunt:** het hierboven geïnitieerde `deployment-practice` project. Indien je dat hebt opgeruimd, draai `azd up` opnieuw voor het testen van code-only deploy. De validatie hieronder gebruikt het daadwerkelijke build script van de API, geen niet-bestaand root `test:unit` script. De template's API tests hebben geconfigureerde database toegang nodig; het zijn geen geïsoleerde unit tests.

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

**Succescriteria:**
- [ ] Pre-deploy script draait voor het deployen
- [ ] Deploy stopt bij faal in build validatie
- [ ] Post-deploy smoke test valideert gezondheid
- [ ] Hooks worden in de juiste volgorde uitgevoerd

### Oefening 3: Multi-Omgeving Deploy Strategie (45 minuten)
**Doel**: Implementeer gefaseerde deploy workflow (dev → staging → productie)

**Startpunt:** hetzelfde geïnitialiseerde todo-project met `jq`. Maak hieronder de omgevingen aan met echte abonnement-/locatiewaarden (of stel `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` in in elk van deze) **voordat** je de no-prompt workflow start. Het faalt opzettelijk in plaats van ontbrekende waarden te verzinnen. Gebruik alleen tijdelijke trainingsomgevingen, geen werkelijk productie-abonnement.

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

**Succescriteria:**
- [ ] Dev-omgeving wordt succesvol uitgerold
- [ ] Staging-omgeving wordt succesvol uitgerold
- [ ] Handmatige goedkeuring vereist voor productie
- [ ] Alle omgevingen hebben werkende gezondheidscontroles
- [ ] Kan indien nodig teruggerold worden

### Oefening 4: Rollback-strategie (25 minuten)
**Doel**: Implementeren en testen van deployment rollback met Git

**Startpunt:** een geïsoleerde trainingscheckout van de todo-sjabloon met alle basisbroncode gecommit, een schone Git-werkboom en een tijdelijke geconfigureerde omgeving. Breng nooit opzettelijke fouten aan in een echt productieproject. `APP_VERSION` hieronder is alleen voor administratie, tenzij je het expliciet in de app koppelt.

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

**Succescriteria:**
- [ ] Kan deploymentfouten detecteren
- [ ] Rollback-script wordt automatisch uitgevoerd
- [ ] Applicatie keert terug in werkende staat
- [ ] Gezondheidscontroles slagen na rollback

## 📊 Tracking van Deployment Metrics

### Volg je Deployment-prestaties

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

**Analyseer je metrics:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Aanvullende bronnen

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigatie**
- **Vorige les**: [Je eerste project](../chapter-01-foundation/first-project.md)
- **Volgende les**: [Resources provisioneren](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->