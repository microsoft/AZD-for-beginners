# Deployment Guide - Beheersing van AZD-implementaties

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Hoofdstuk 4 - Infrastructuur als Code & Implementatie
- **⬅️ Previous Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🧩 Also in this chapter**: [Authoring Your Own Template](custom-templates.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Inleiding

Deze uitgebreide gids behandelt alles wat je moet weten over het implementeren van applicaties met de Azure Developer CLI, van eenvoudige implementaties met één opdracht tot geavanceerde productiescenario's met aangepaste hooks, meerdere omgevingen en CI/CD-integratie. Beheers de volledige implementatielevenscyclus met praktische voorbeelden en best practices.

## Leerdoelen

Door deze gids te voltooien, zul je:
- Alle Azure Developer CLI-implementatieopdrachten en workflows beheersen
- De volledige implementatielevenscyclus begrijpen, van provisie tot monitoring
- Aangepaste implementatiehooks implementeren voor pre- en post-implementatie-automatisering
- Meerdere omgevingen configureren met omgeving-specifieke parameters
- Geavanceerde implementatiestrategieën instellen, inclusief blue-green en canary-implementaties
- azd-implementaties integreren met CI/CD-pijplijnen en DevOps-workflows

## Leerresultaten

Na voltooiing kun je:
- Alle azd-implementatieworkflows zelfstandig uitvoeren en oplossen
- Aangepaste implementatieautomatisering ontwerpen en implementeren met hooks
- Productierijpe implementaties configureren met de juiste beveiliging en monitoring
- Complexe multi-omgeving-implementatiescenario's beheren
- Implementatieprestaties optimaliseren en rollback-strategieën implementeren
- azd-implementaties integreren in enterprise DevOps-praktijken

## Overzicht van implementatie

Azure Developer CLI biedt meerdere implementatieopdrachten:
- `azd up` - Volledige workflow (provision + deploy)
- `azd provision` - Alleen Azure-resources aanmaken/bijwerken
- `azd deploy` - Alleen applicatiecode implementeren
- `azd package` - Applicaties bouwen en verpakken

## Basis implementatieworkflows

### Volledige implementatie (azd up)
De meest gebruikelijke workflow voor nieuwe projecten:
```bash
# Alles vanaf nul uitrollen
azd up

# Uitrollen met een specifieke omgeving
azd up --environment production

# Uitrollen met aangepaste parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Alleen infrastructuur implementeren
Wanneer je alleen Azure-resources hoeft bij te werken:
```bash
# Infrastructuur inrichten/bijwerken
azd provision

# Provisioneren met dry-run om wijzigingen te bekijken
azd provision --preview

# Provisioneren van specifieke diensten
azd provision --service database
```

### Alleen code implementeren
Voor snelle applicatie-updates:
```bash
# Implementeer alle services
azd deploy

# Verwachte uitvoer:
# Services implementeren (azd deploy)
# - web: Implementeren... Klaar
# - api: Implementeren... Klaar
# SUCCES: Uw implementatie is voltooid in 2 minuten en 15 seconden

# Een specifieke service implementeren
azd deploy --service web
azd deploy --service api

# Implementeren met aangepaste build-argumenten
azd deploy --service api --build-arg NODE_ENV=production

# Controleer implementatie
azd show --output json | jq '.services'
```

### ✅ Implementatieverificatie

Controleer na elke implementatie het succes:

```bash
# Controleer of alle services draaien
azd show

# Test health-eindpunten
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Controleer op fouten (opent standaard in de browser)
azd monitor --logs
```

**Succescriteria:**
- ✅ Alle services tonen de status "Running"
- ✅ Health-endpoints geven HTTP 200 terug
- ✅ Geen foutlogboeken in de afgelopen 5 minuten
- ✅ Applicatie reageert op testverzoeken

## 🏗️ Begrijpen van het implementatieproces

### Nieuw met hooks? Begin hier

Een **hook** is een commando dat azd automatisch uitvoert op een specifiek moment in het implementatieproces—voor of na provisioning, en voor of na het implementeren van je code. Ze laten je de kleine klusjes automatiseren die altijd bij een implementatie horen: een database vullen, migraties uitvoeren, assets bouwen of een smoke-test van de live-app uitvoeren.

| Hook | Runs… | Common use |
|------|-------|------------|
| `preprovision` | Voor resources worden aangemaakt | Controleer vereisten, log in bij een registry |
| `postprovision` | Nadat resources bestaan | Resources configureren, de database instellen |
| `predeploy` | Voordat code wordt geïmplementeerd | Front-end assets bouwen, unittests uitvoeren |
| `postdeploy` | Nadat de code live is | DB-migraties uitvoeren, smoke-test van endpoint |

Hooks staan in je `azure.yaml`. Dit is het kleinste mogelijke voorbeeld—het print gewoon een bericht na implementatie:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Dat is alles—de volgende keer dat je `azd up` uitvoert, wordt het bericht automatisch weergegeven. Je kunt ook een hook zelfstandig uitvoeren, zonder een volledige deploy, wat geweldig is om te testen:

```bash
azd hooks run postdeploy
```

De fasen hieronder tonen hooks uit de praktijk (migraties, tests, validatie) voor elke fase.

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

### Fase 2: Infrastructuurprovisioning
- Leest infrastructuurtemplates (Bicep/Terraform)
- Maakt Azure-resources aan of werkt ze bij
- Configureert netwerken en beveiliging
- Stelt monitoring en logging in

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

### Fase 4: Applicatiepackaging
- Bouwt applicatiecode
- Maakt implementatie-artifacts aan
- Pakt voor het doelplatform (containers, ZIP-bestanden, enz.)

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

### Fase 6: Applicatie-implementatie
- Implementeert verpakte applicaties naar Azure-services
- Werkt configuratie-instellingen bij
- Start/herstelt services

### Fase 7: Post-Deploy Hooks
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

### Omgaan met hook-fouten

Standaard: **als een hook-commando met een niet-nul exitcode eindigt, stopt azd de hele operatie.** Dit is meestal wat je wilt—een mislukte migratie moet de deploy stoppen, niet een kapotte app uitrollen. Maar het betekent dat hooks zorgvuldig geschreven moeten worden.

**1. Maak fouten luid en intentioneel.** Een hook faalt wanneer het laatste commando een niet-nul exitcode retourneert. In shell-scripts voeg `set -e` toe zodat de hook stopt bij de eerste mislukte opdracht in plaats van stilletjes door te gaan:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Sta toe dat een hook faalt zonder azd te stoppen.** Voor niet-kritieke stappen (optionele cache-warmup, een poging tot notificatie) zet `continueOnError: true`. azd logt de fout maar gaat door:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Test hooks geïsoleerd voordat je een volledige run uitvoert.** Je hoeft `azd up` niet uit te voeren om een hook te debuggen—voer hem afzonderlijk uit en iterateer snel:

```bash
azd hooks run predeploy          # voert alleen de predeploy-hook uit
azd hooks run postdeploy --service api
```

**4. Let op OS-specifieke shells.** Een hook die `shell: pwsh` gebruikt heeft PowerShell geïnstalleerd nodig op de machine die hem uitvoert (inclusief CI-agents). Gebruik `shell: sh` voor de breedste draagbaarheid, of bied zowel `windows` als `posix` varianten aan:

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

> **Debugging tip:** voer een azd-commando uit met `--debug` om de exacte hook-commando-regel en de volledige output te zien—onmisbaar wanneer een hook lokaal werkt maar faalt in CI.

## 🎛️ Implementatieconfiguratie

### Service-specifieke implementatie-instellingen
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

### Omgeving-specifieke configuraties
```bash
# Ontwikkelomgeving
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging-omgeving
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Productieomgeving
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Geavanceerde implementatiescenario's

### Multi-service applicaties
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

### Blue-Green-implementaties
```bash
# Maak blauwe omgeving aan
azd env new production-blue
azd up --environment production-blue

# Test de blauwe omgeving
./scripts/test-environment.sh production-blue

# Schakel verkeer over naar blauw (handmatige DNS-/loadbalancer-update)
./scripts/switch-traffic.sh production-blue

# Ruim groene omgeving op
azd env select production-green
azd down --force
```

### Canary-implementaties
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

### Gefaseerde implementaties
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

## 🐳 Container-implementaties

### Container App-implementaties
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

### Multi-stage Dockerfile-optimalisatie
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

## ⚡ Prestatie-optimalisatie

### Service-specifieke implementaties
```bash
# Rol een specifieke service uit voor snellere iteratie
azd deploy --service web
azd deploy --service api

# Rol alle services uit
azd deploy
```

### Build-caching
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Efficiënte code-implementaties
```bash
# Gebruik azd deploy (niet azd up) voor alleen codewijzigingen
# Dit slaat het provisioneren van de infrastructuur over en is veel sneller
azd deploy

# Implementeer een specifieke service voor de snelste iteratie
azd deploy --service api
```

## 🔍 Implementatiemonitoring

### Real-time implementatiemonitoring
```bash
# Applicatie in realtime monitoren
azd monitor --live

# Bekijk applicatielogs
azd monitor --logs

# Controleer de implementatiestatus
azd show
```

### Health-checks
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

### Post-implementatievalidatie
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Controleer de gezondheid van de applicatie
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

## 🔐 Beveiligingsoverwegingen

### Geheimenbeheer
```bash
# Sla geheimen veilig op
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Verwijs naar geheimen in azure.yaml
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

### Netwerkbeveiliging
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identity- en toegangsbeheer
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

## 🚨 Rollback-strategieën

### Snelle rollback
```bash
# AZD heeft geen ingebouwde rollback. Aanbevolen opties:

# Optie 1: Opnieuw uitrollen vanuit Git (aanbevolen)
git revert HEAD  # Draai de problematische commit terug
git push
azd deploy

# Optie 2: Opnieuw uitrollen van een specifieke commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastructuur-rollback
```bash
# Bekijk infrastructuurwijzigingen voordat u ze toepast
azd provision --preview

# Voor het terugdraaien van infrastructuur, gebruik versiebeheer:
git revert HEAD  # Maak infrastructuurwijzigingen ongedaan
azd provision    # Pas de vorige infrastructuurstatus toe
```

### Rollback van databasemigraties
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Implementatiestatistieken

### Volg implementatieprestaties
```bash
# Bekijk de huidige implementatiestatus
azd show

# Monitor de applicatie met Application Insights
azd monitor --overview

# Bekijk live statistieken
azd monitor --live
```

### Aangepaste metriekverzameling
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

## 🎯 Best practices

### 1. Omgevingsconsistentie
```bash
# Gebruik consistente naamgeving
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Behoud consistentie tussen omgevingen
./scripts/sync-environments.sh
```

### 2. Validatie van infrastructuur
```bash
# Voorvertoning van infrastructuurwijzigingen vóór implementatie
azd provision --preview

# Gebruik ARM/Bicep-linting
az bicep lint --file infra/main.bicep

# Valideer Bicep-syntaxis
az bicep build --file infra/main.bicep
```

### 3. Testintegratie
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

### 4. Documentatie en logging
```bash
# Documenteer uitrolprocedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Volgende stappen

- [Provisioning Resources](provisioning.md) - Diepgaande duik in infrastructuurbeheer
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Plan je implementatiestrategie
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Los implementatieproblemen op
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Productierijpe implementatiestrategieën

## 🎯 Hands-on implementatieoefeningen

### Oefening 1: Incrementele implementatieworkflow (20 minuten)
**Doel**: Begrijp het verschil tussen volledige en incrementele implementaties

```bash
# Initiële uitrol
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registreer de tijd van de initiële uitrol
echo "Full deployment: $(date)" > deployment-log.txt

# Breng een codewijziging aan
echo "// Updated $(date)" >> src/api/src/server.js

# Alleen code uitrollen (snel)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Vergelijk tijden
cat deployment-log.txt

# Opruimen
azd down --force --purge
```

**Succescriteria:**
- [ ] Volledige implementatie duurt 5-15 minuten
- [ ] Alleen-code-implementatie duurt 2-5 minuten
- [ ] Codewijzigingen zichtbaar in de geïmplementeerde app
- [ ] Infrastructuur ongewijzigd na `azd deploy`

**Leerresultaat**: `azd deploy` is 50-70% sneller dan `azd up` voor codewijzigingen

### Oefening 2: Aangepaste implementatiehooks (30 minuten)
**Doel**: Implementeer pre- en post-deploy automatisering

```bash
# Maak een pre-deploy-validatiescript
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Controleer of de tests slagen
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Controleer op niet-gecommitte wijzigingen
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Maak een post-deploy smoke-test
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

# Voeg hooks toe aan azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Test de deployment met hooks
azd deploy
```

**Succescriteria:**
- [ ] Pre-deploy script draait vóór de implementatie
- [ ] Implementatie wordt afgebroken als tests falen
- [ ] Post-deploy smoke-test valideert gezondheid
- [ ] Hooks voeren in de juiste volgorde uit

### Oefening 3: Multi-omgeving implementatiestrategie (45 minuten)
**Doel**: Implementeer een gefaseerde workflow (dev → staging → production)

```bash
# Maak een implementatiescript
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Stap 1: Uitrollen naar dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Stap 2: Uitrollen naar staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Stap 3: Handmatige goedkeuring voor productie
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

# Maak omgevingen aan
azd env new dev
azd env new staging
azd env new production

# Voer gefaseerde uitrol uit
./deploy-staged.sh
```

**Succescriteria:**
- [ ] Dev-omgeving wordt succesvol uitgerold
- [ ] Staging-omgeving wordt succesvol uitgerold
- [ ] Handmatige goedkeuring vereist voor productie
- [ ] Alle omgevingen hebben werkende health-checks
- [ ] Kan terugrollen indien nodig

### Oefening 4: Rollback-strategie (25 minuten)
**Doel**: Implementeer en test rollback van implementatie met Git

```bash
# Rol v1 uit
azd env set APP_VERSION "1.0.0"
azd up

# Sla commit-hash van v1 op
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Rol v2 uit met brekende wijziging
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Detecteer fout en rol terug
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rol terug met git
    git revert HEAD --no-edit
    
    # Rol de omgeving terug
    azd env set APP_VERSION "1.0.0"
    
    # Rol v1 opnieuw uit
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Succescriteria:**
- [ ] Kan implementatiefouten detecteren
- [ ] Rollback-script wordt automatisch uitgevoerd
- [ ] Applicatie keert terug naar werkende staat
- [ ] Health-checks slagen na rollback

## 📊 Volgen van implementatiestatistieken

### Volg je implementatieprestaties

```bash
# Maak een script voor implementatiestatistieken
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

# Log naar bestand
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Gebruik het
./track-deployment.sh
```

**Analyseer je metrics:**
```bash
# Bekijk de implementatiegeschiedenis
cat deployment-metrics.csv

# Bereken de gemiddelde implementatietijd
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Aanvullende resources

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigatie**
- **Previous Lesson**: [Your First Project](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->