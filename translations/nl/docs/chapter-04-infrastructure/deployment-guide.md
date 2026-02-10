# Implementatiehandleiding - Beheersing van AZD-implementaties

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD voor beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 4 - Infrastructuur als Code & Implementatie
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)
- **➡️ Volgende**: [Bronnen provisioneren](provisioning.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 5: Multi-agent AI-oplossingen](../../examples/retail-scenario.md)

## Inleiding

Deze## Begrijpen van het implementatieprocesuitgebreide gids behandelt alles wat je moet weten over het implementeren van applicaties met Azure Developer CLI, van basisimplementaties met één opdracht tot geavanceerde productiescenario's met aangepaste hooks, meerdere omgevingen en CI/CD-integratie. Beheers de volledige implementatielevenscyclus met praktische voorbeelden en best practices.

## Leerdoelen

By completing this guide, you will:
- Beheers alle Azure Developer CLI-implementatieopdrachten en workflows
- Begrijp de volledige implementatielevenscyclus van provisioning tot monitoring
- Implementeer aangepaste implementatie-hooks voor pre- en post-implementatie-automatisering
- Configureer meerdere omgevingen met omgeving-specifieke parameters
- Stel geavanceerde implementatiestrategieën in, waaronder blue-green en canary-implementaties
- Integreer azd-implementaties met CI/CD-pijplijnen en DevOps-workflows

## Leerresultaten

Upon completion, you will be able to:
- Voer zelfstandig alle azd-implementatieworkflows uit en los problemen op
- Ontwerp en implementeer aangepaste implementatieautomatisering met hooks
- Configureer productieklare implementaties met juiste beveiliging en monitoring
- Beheer complexe multi-omgeving implementatiescenario's
- Optimaliseer implementatieprestaties en implementeer rollback-strategieën
- Integreer azd-implementaties in enterprise DevOps-praktijken

## Overzicht van implementatie

Azure Developer CLI biedt verschillende implementatieopdrachten:
- `azd up` - Volledige workflow (voorziening + implementatie)
- `azd provision` - Alleen Azure-resources maken/bijwerken
- `azd deploy` - Alleen applicatiecode implementeren
- `azd package` - Bouw en pak applicaties in

## Basisimplementatieworkflows

### Volledige implementatie (azd up)
De meest voorkomende workflow voor nieuwe projecten:
```bash
# Alles helemaal opnieuw uitrollen
azd up

# Uitrollen met specifieke omgeving
azd up --environment production

# Uitrollen met aangepaste parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Alleen infrastructuurimplementatie
Wanneer je alleen Azure-resources hoeft bij te werken:
```bash
# Infrastructuur inrichten/bijwerken
azd provision

# Inrichten met een proefuitvoering (dry-run) om wijzigingen te bekijken
azd provision --preview

# Specifieke diensten inrichten
azd provision --service database
```

### Alleen code-implementatie
Voor snelle applicatie-updates:
```bash
# Alle services implementeren
azd deploy

# Verwachte uitvoer:
# Services implementeren (azd deploy)
# - web: Implementeren... Klaar
# - api: Implementeren... Klaar
# SUCCES: Uw implementatie is voltooid in 2 minuten 15 seconden

# Een specifieke service implementeren
azd deploy --service web
azd deploy --service api

# Implementeren met aangepaste buildargumenten
azd deploy --service api --build-arg NODE_ENV=production

# Implementatie verifiëren
azd show --output json | jq '.services'
```

### ✅ Implementatieverificatie

Controleer na elke implementatie of deze succesvol is:

```bash
# Controleer of alle services actief zijn
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
- ✅ Alle services tonen de status "Actief"
- ✅ Health-eindpunten geven HTTP 200 terug
- ✅ Geen foutlogboeken in de laatste 5 minuten
- ✅ Applicatie reageert op testverzoeken

## 🏗️ Begrijpen van het implementatieproces

### Fase 1: Pre-voorzieningshooks
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

### Fase 2: Infrastructuurvoorziening
- Leest infrastructuursjablonen (Bicep/Terraform)
- Maakt of werkt Azure-resources bij
- Configureert netwerken en beveiliging
- Stelt monitoring en logging in

### Fase 3: Post-voorzieningshooks
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

### Fase 4: Applicatieverpakking
- Bouwt applicatiecode
- Maakt implementatie-artifacten
- Pakt in voor het doelplatform (containers, ZIP-bestanden, enz.)

### Fase 5: Pre-deployhooks
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
- Bijwerkt configuratie-instellingen
- Start/herstart services

### Fase 7: Post-deployhooks
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
# Maak de blauwe omgeving aan
azd env new production-blue
azd up --environment production-blue

# Test de blauwe omgeving
./scripts/test-environment.sh production-blue

# Schakel het verkeer over naar blauw (handmatige DNS/loadbalancer-update)
./scripts/switch-traffic.sh production-blue

# Ruim de groene omgeving op
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

### Container-app-implementaties
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

## ⚡ Prestatieoptimalisatie

### Service-specifieke implementaties
```bash
# Rol een specifieke service uit om sneller te itereren
azd deploy --service web
azd deploy --service api

# Rol alle services uit
azd deploy
```

### Buildcaching
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
# Dit slaat de provisionering van de infrastructuur over en is veel sneller
azd deploy

# Implementeer een specifieke service voor de snelste iteratie
azd deploy --service api
```

## 🔍 Implementatiemonitoring

### Realtime implementatiemonitoring
```bash
# Applicatie in realtime bewaken
azd monitor --live

# Bekijk applicatielogs
azd monitor --logs

# Controleer de status van de implementatie
azd show
```

### Healthchecks
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

### Validatie na implementatie
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

### Beheer van geheimen
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

### Identiteits- en toegangsbeheer
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
# AZD heeft geen ingebouwde rollback. Aanbevolen benaderingen:

# Optie 1: Opnieuw uitrollen vanuit Git (aanbevolen)
git revert HEAD  # Draai de problematische commit terug
git push
azd deploy

# Optie 2: Opnieuw uitrollen van een specifieke commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastructuur rollback
```bash
# Bekijk infrastructuurwijzigingen voordat u ze toepast
azd provision --preview

# Voor het terugdraaien van infrastructuur, gebruik versiebeheer:
git revert HEAD  # Draai infrastructuurwijzigingen terug
azd provision    # Pas de vorige infrastructuurtoestand toe
```

### Rollback van databasemigratie
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
# Bekijk huidige implementatiestatus
azd show

# Bewaak de applicatie met Application Insights
azd monitor --overview

# Bekijk live statistieken
azd monitor --live
```

### Aangepaste metricsverzameling
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

## 🎯 Beste praktijken

### 1. Consistentie van omgevingen
```bash
# Gebruik consistente naamgeving
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Behoud pariteit tussen omgevingen
./scripts/sync-environments.sh
```

### 2. Validatie van infrastructuur
```bash
# Bekijk infrastructuurwijzigingen vóór implementatie
azd provision --preview

# Gebruik ARM/Bicep-linting
az bicep lint --file infra/main.bicep

# Valideer Bicep-syntaxis
az bicep build --file infra/main.bicep
```

### 3. Integratie van testen
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
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Volgende stappen

- [Voorziening van bronnen](provisioning.md) - Diepgaande duik in infrastructuurbeheer
- [Pre-implementatieplanning](../chapter-06-pre-deployment/capacity-planning.md) - Plan je implementatiestrategie
- [Veelvoorkomende problemen](../chapter-07-troubleshooting/common-issues.md) - Los implementatieproblemen op
- [Beste praktijken](../chapter-07-troubleshooting/debugging.md) - Productieklare implementatiestrategieën

## 🎯 Hands-on implementatieoefeningen

### Oefening 1: Incrementele implementatieworkflow (20 minuten)
**Doel**: Beheers het verschil tussen volledige en incrementele implementaties

```bash
# Initiële uitrol
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registreer de tijd van de initiële uitrol
echo "Full deployment: $(date)" > deployment-log.txt

# Breng een wijziging in de code aan
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
- [ ] Codewijzigingen worden weergegeven in de geïmplementeerde app
- [ ] Infrastructuur ongewijzigd na `azd deploy`

**Leerresultaat**: `azd deploy` is 50-70% sneller dan `azd up` voor codewijzigingen

### Oefening 2: Aangepaste implementatiehooks (30 minuten)
**Doel**: Implementeer pre- en post-implementatie-automatisering

```bash
# Maak pre-deploy-validatiescript
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

# Maak post-deploy smoke-test
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
- [ ] Pre-deployscript draait vóór implementatie
- [ ] Implementatie stopt als tests falen
- [ ] Post-deploy smoke-test valideert gezondheid
- [ ] Hooks voeren uit in de juiste volgorde

### Oefening 3: Multi-omgeving implementatiestrategie (45 minuten)
**Doel**: Implementeer een gefaseerde implementatieworkflow (dev → staging → production)

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
- [ ] Dev-omgeving wordt succesvol geïmplementeerd
- [ ] Staging-omgeving wordt succesvol geïmplementeerd
- [ ] Handmatige goedkeuring vereist voor productie
- [ ] Alle omgevingen hebben werkende healthchecks
- [ ] Kan indien nodig terugrollen

### Oefening 4: Rollback-strategie (25 minuten)
**Doel**: Implementeer en test rollback van implementaties met Git

```bash
# Uitrollen v1
azd env set APP_VERSION "1.0.0"
azd up

# Sla v1 commit-hash op
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Uitrollen v2 met een brekende wijziging
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Detecteer falen en rol terug
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Terugrollen met git
    git revert HEAD --no-edit
    
    # Rol de omgeving terug
    azd env set APP_VERSION "1.0.0"
    
    # Heruitrollen v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Succescriteria:**
- [ ] Kan implementatiefouten detecteren
- [ ] Rollback-script wordt automatisch uitgevoerd
- [ ] Applicatie keert terug naar werkende toestand
- [ ] Healthchecks slagen na rollback

## 📊 Bijhouden van implementatiestatistieken

### Volg je implementatieprestaties

```bash
# Maak script voor implementatiestatistieken
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

# Log naar bestand
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
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

## Aanvullende bronnen

- [Azure Developer CLI Implementatiereferentie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service-implementatie](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps-implementatie](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions-implementatie](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigatie**
- **Vorig Lessen**: [Je eerste project](../chapter-01-foundation/first-project.md)
- **Volgende Les**: [Voorziening van bronnen](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, dient u zich ervan bewust te zijn dat automatische vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->