# Handleiding voor implementatie - Meesterschap in AZD-implementaties

**Hoofdstuknavigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 4 - Infrastructuur als Code & Implementatie
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 3: Configuratie](../getting-started/configuration.md)
- **➡️ Volgende**: [Resources Provisioneren](provisioning.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 5: Multi-Agent AI-oplossingen](../../examples/retail-scenario.md)

## Introductie

Deze uitgebreide handleiding behandelt alles wat je moet weten over het implementeren van applicaties met Azure Developer CLI, van eenvoudige implementaties met één commando tot geavanceerde productieomgevingen met aangepaste hooks, meerdere omgevingen en CI/CD-integratie. Beheers de volledige implementatiecyclus met praktische voorbeelden en best practices.

## Leerdoelen

Na het voltooien van deze handleiding kun je:
- Alle implementatiecommando's en workflows van Azure Developer CLI beheersen
- De volledige implementatiecyclus begrijpen, van provisioning tot monitoring
- Aangepaste implementatiehooks implementeren voor automatisering vóór en na implementatie
- Meerdere omgevingen configureren met omgevingsspecifieke parameters
- Geavanceerde implementatiestrategieën opzetten, zoals blue-green en canary deployments
- AZD-implementaties integreren met CI/CD-pipelines en DevOps-workflows

## Leerresultaten

Na voltooiing ben je in staat om:
- Alle AZD-implementatieworkflows zelfstandig uit te voeren en problemen op te lossen
- Aangepaste implementatieautomatisering te ontwerpen en implementeren met hooks
- Productieklare implementaties te configureren met de juiste beveiliging en monitoring
- Complexe multi-omgeving implementatiescenario's te beheren
- Implementatieprestaties te optimaliseren en rollbackstrategieën te implementeren
- AZD-implementaties te integreren in bedrijfsbrede DevOps-praktijken

## Overzicht van implementatie

Azure Developer CLI biedt verschillende implementatiecommando's:
- `azd up` - Volledige workflow (provision + deploy)
- `azd provision` - Alleen Azure-resources maken/bijwerken
- `azd deploy` - Alleen applicatiecode implementeren
- `azd package` - Applicaties bouwen en verpakken

## Basisimplementatieworkflows

### Volledige implementatie (azd up)
De meest voorkomende workflow voor nieuwe projecten:
```bash
# Alles vanaf nul implementeren
azd up

# Implementeren met specifieke omgeving
azd up --environment production

# Implementeren met aangepaste parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Alleen infrastructuur implementeren
Wanneer je alleen Azure-resources hoeft bij te werken:
```bash
# Voorzien/update infrastructuur
azd provision

# Voorzien met dry-run om wijzigingen te bekijken
azd provision --preview

# Voorzien specifieke diensten
azd provision --service database
```

### Alleen code implementeren
Voor snelle applicatie-updates:
```bash
# Implementeer alle services
azd deploy

# Verwachte output:
# Services implementeren (azd deploy)
# - web: Implementeren... Klaar
# - api: Implementeren... Klaar
# SUCCES: Uw implementatie is voltooid in 2 minuten en 15 seconden

# Specifieke service implementeren
azd deploy --service web
azd deploy --service api

# Implementeer met aangepaste buildargumenten
azd deploy --service api --build-arg NODE_ENV=production

# Verifieer implementatie
azd show --output json | jq '.services'
```

### ✅ Verificatie van implementatie

Controleer na elke implementatie het succes:

```bash
# Controleer of alle services actief zijn
azd show

# Test gezondheidsendpoints
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Controleer logs op fouten
azd logs --service api --since 5m | grep -i error
```

**Succescriteria:**
- ✅ Alle services tonen de status "Running"
- ✅ Gezondheidseindpunten geven HTTP 200 terug
- ✅ Geen foutlogboeken in de laatste 5 minuten
- ✅ Applicatie reageert op testverzoeken

## 🏗️ Begrijpen van het implementatieproces

### Fase 1: Hooks vóór provisioning
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

### Fase 2: Infrastructuur provisioning
- Leest infrastructuursjablonen (Bicep/Terraform)
- Maakt of werkt Azure-resources bij
- Configureert netwerken en beveiliging
- Stelt monitoring en logging in

### Fase 3: Hooks na provisioning
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
- Creëert implementatie-artifacten
- Verpakt voor doelplatform (containers, ZIP-bestanden, etc.)

### Fase 5: Hooks vóór implementatie
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
- Start/herstart services

### Fase 7: Hooks na implementatie
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

### Omgevingsspecifieke configuraties
```bash
# Ontwikkelomgeving
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Testomgeving
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

### Blue-Green implementaties
```bash
# Maak blauwe omgeving
azd env new production-blue
azd up --environment production-blue

# Test blauwe omgeving
./scripts/test-environment.sh production-blue

# Schakel verkeer naar blauw (handmatige DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Ruim groene omgeving op
azd env select production-green
azd down --force
```

### Canary implementaties
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
# implementeer-gestaged.sh

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

## 🐳 Containerimplementaties

### Containerapplicatie-implementaties
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

### Parallelle implementaties
```bash
# Configureer parallelle implementatie
azd config set deploy.parallelism 5

# Implementeer services parallel
azd deploy --parallel
```

### Build caching
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

### Incrementele implementaties
```bash
# Alleen gewijzigde services implementeren
azd deploy --incremental

# Implementeren met wijzigingsdetectie
azd deploy --detect-changes
```

## 🔍 Monitoring van implementatie

### Real-time monitoring van implementatie
```bash
# Controleer de voortgang van de implementatie
azd deploy --follow

# Bekijk implementatielogs
azd logs --follow --service api

# Controleer de status van de implementatie
azd show --service api
```

### Gezondheidscontroles
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

## 🚨 Rollbackstrategieën

### Snelle rollback
```bash
# Terugzetten naar vorige implementatie
azd deploy --rollback

# Terugzetten specifieke service
azd deploy --service api --rollback

# Terugzetten naar specifieke versie
azd deploy --service api --version v1.2.3
```

### Rollback van infrastructuur
```bash
# Infrastructuurwijzigingen terugdraaien
azd provision --rollback

# Voorbeeld van terugdraaiwijzigingen
azd provision --rollback --preview
```

### Rollback van database-migratie
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Implementatiemetrics

### Volg implementatieprestaties
```bash
# Schakel implementatiemetrics in
azd config set telemetry.deployment.enabled true

# Bekijk implementatiegeschiedenis
azd history

# Verkrijg implementatiestatistieken
azd metrics --type deployment
```

### Verzameling van aangepaste metrics
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

### 1. Consistentie van omgevingen
```bash
# Gebruik consistente naamgeving
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Behoud omgevingspariteit
./scripts/sync-environments.sh
```

### 2. Validatie van infrastructuur
```bash
# Valideer vóór implementatie
azd provision --preview
azd provision --what-if

# Gebruik ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Integratietesten
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
# Documenteer implementatieprocedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Volgende stappen

- [Resources Provisioneren](provisioning.md) - Diepgaande infrastructuurbeheer
- [Voorbereiding op implementatie](../pre-deployment/capacity-planning.md) - Plan je implementatiestrategie
- [Veelvoorkomende problemen](../troubleshooting/common-issues.md) - Los implementatieproblemen op
- [Best practices](../troubleshooting/debugging.md) - Productieklare implementatiestrategieën

## 🎯 Praktische implementatieoefeningen

### Oefening 1: Incrementele implementatieworkflow (20 minuten)
**Doel**: Beheers het verschil tussen volledige en incrementele implementaties

```bash
# Initiële implementatie
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registreer initiële implementatietijd
echo "Full deployment: $(date)" > deployment-log.txt

# Maak een codewijziging
echo "// Updated $(date)" >> src/api/src/server.js

# Implementeer alleen code (snel)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Vergelijk tijden
cat deployment-log.txt

# Opruimen
azd down --force --purge
```

**Succescriteria:**
- [ ] Volledige implementatie duurt 5-15 minuten
- [ ] Alleen code-implementatie duurt 2-5 minuten
- [ ] Codewijzigingen worden weergegeven in de geïmplementeerde app
- [ ] Infrastructuur blijft ongewijzigd na `azd deploy`

**Leerresultaat**: `azd deploy` is 50-70% sneller dan `azd up` voor codewijzigingen

### Oefening 2: Aangepaste implementatiehooks (30 minuten)
**Doel**: Automatisering vóór en na implementatie implementeren

```bash
# Maak script voor pre-deploy validatie
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Controleer of tests slagen
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Controleer op niet-gecommit wijzigingen
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Maak post-deploy rooktest
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

# Test implementatie met hooks
azd deploy
```

**Succescriteria:**
- [ ] Script vóór implementatie wordt uitgevoerd vóór implementatie
- [ ] Implementatie wordt geannuleerd als tests falen
- [ ] Post-implementatie smoke test valideert gezondheid
- [ ] Hooks worden in de juiste volgorde uitgevoerd

### Oefening 3: Multi-omgeving implementatiestrategie (45 minuten)
**Doel**: Gefaseerde implementatieworkflow implementeren (dev → staging → productie)

```bash
# Maak implementatiescript
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Stap 1: Implementeer naar dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Stap 2: Implementeer naar staging
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

# Maak omgevingen
azd env new dev
azd env new staging
azd env new production

# Voer gefaseerde implementatie uit
./deploy-staged.sh
```

**Succescriteria:**
- [ ] Dev-omgeving implementeert succesvol
- [ ] Staging-omgeving implementeert succesvol
- [ ] Handmatige goedkeuring vereist voor productie
- [ ] Alle omgevingen hebben werkende gezondheidscontroles
- [ ] Kan terugdraaien indien nodig

### Oefening 4: Rollbackstrategie (25 minuten)
**Doel**: Implementatie rollback implementeren en testen

```bash
# Implementeer v1
azd env set APP_VERSION "1.0.0"
azd up

# Sla v1-configuratie op
cp -r .azure/production .azure/production-v1-backup

# Implementeer v2 met brekende wijziging
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Detecteer fout
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Code terugdraaien
    git checkout src/api/src/server.js
    
    # Omgeving terugdraaien
    azd env set APP_VERSION "1.0.0"
    
    # Herimplementeer v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Succescriteria:**
- [ ] Kan implementatiefouten detecteren
- [ ] Rollbackscript wordt automatisch uitgevoerd
- [ ] Applicatie keert terug naar werkende staat
- [ ] Gezondheidscontroles slagen na rollback

## 📊 Metrics voor implementatie volgen

### Volg je implementatieprestaties

```bash
# Maak script voor implementatiemetrics
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
# Bekijk implementatiegeschiedenis
cat deployment-metrics.csv

# Bereken gemiddelde implementatietijd
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Aanvullende bronnen

- [Azure Developer CLI Implementatiereferentie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Implementatie](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Implementatie](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Implementatie](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigatie**
- **Vorige Les**: [Je Eerste Project](../getting-started/first-project.md)
- **Volgende Les**: [Resources Provisioneren](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->