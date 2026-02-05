# Distribusjonsveiledning - Mestre AZD-distribusjoner

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD for nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 4 - Infrastruktur som kode og distribusjon
- **⬅️ Forrige kapittel**: [Kapittel 3: Konfigurasjon](../getting-started/configuration.md)
- **➡️ Neste**: [Klargjøring av ressurser](provisioning.md)
- **🚀 Neste kapittel**: [Kapittel 5: Multi-agent AI-løsninger](../../examples/retail-scenario.md)

## Introduksjon

Denne omfattende veiledningen dekker alt du trenger å vite om å distribuere applikasjoner ved hjelp av Azure Developer CLI, fra grunnleggende distribusjoner med én kommando til avanserte produksjonsscenarier med tilpassede hooks, flere miljøer og CI/CD-integrasjon. Mestre hele distribusjonslivssyklusen med praktiske eksempler og beste praksis.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Mestre alle distribusjonskommandoer og arbeidsflyter i Azure Developer CLI
- Forstå hele distribusjonslivssyklusen fra klargjøring til overvåking
- Implementere tilpassede distribusjonshooks for automatisering før og etter distribusjon
- Konfigurere flere miljøer med miljøspesifikke parametere
- Sette opp avanserte distribusjonsstrategier som blå-grønn og kanaridistribusjoner
- Integrere azd-distribusjoner med CI/CD-pipelines og DevOps-arbeidsflyter

## Læringsutbytte

Etter fullføring vil du kunne:
- Utføre og feilsøke alle azd-distribusjonsarbeidsflyter selvstendig
- Designe og implementere tilpasset distribusjonsautomatisering ved hjelp av hooks
- Konfigurere produksjonsklare distribusjoner med riktig sikkerhet og overvåking
- Håndtere komplekse distribusjonsscenarier med flere miljøer
- Optimalisere distribusjonsytelse og implementere tilbakeføringsstrategier
- Integrere azd-distribusjoner i bedrifts-DevOps-praksis

## Oversikt over distribusjon

Azure Developer CLI tilbyr flere distribusjonskommandoer:
- `azd up` - Komplett arbeidsflyt (klargjøring + distribusjon)
- `azd provision` - Opprett/oppdater kun Azure-ressurser
- `azd deploy` - Distribuer kun applikasjonskode
- `azd package` - Bygg og pakk applikasjoner

## Grunnleggende distribusjonsarbeidsflyter

### Komplett distribusjon (azd up)
Den vanligste arbeidsflyten for nye prosjekter:
```bash
# Distribuer alt fra bunnen av
azd up

# Distribuer med spesifikt miljø
azd up --environment production

# Distribuer med egendefinerte parametere
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Kun infrastrukturdistribusjon
Når du kun trenger å oppdatere Azure-ressurser:
```bash
# Tilby/oppdater infrastruktur
azd provision

# Tilby med dry-run for å forhåndsvise endringer
azd provision --preview

# Tilby spesifikke tjenester
azd provision --service database
```

### Kun kodedistribusjon
For raske applikasjonsoppdateringer:
```bash
# Distribuer alle tjenester
azd deploy

# Forventet resultat:
# Distribuerer tjenester (azd deploy)
# - web: Distribuerer... Ferdig
# - api: Distribuerer... Ferdig
# SUKSESS: Distribusjonen din ble fullført på 2 minutter og 15 sekunder

# Distribuer spesifikk tjeneste
azd deploy --service web
azd deploy --service api

# Distribuer med egendefinerte byggeargumenter
azd deploy --service api --build-arg NODE_ENV=production

# Verifiser distribusjon
azd show --output json | jq '.services'
```

### ✅ Verifisering av distribusjon

Etter enhver distribusjon, verifiser suksess:

```bash
# Sjekk at alle tjenester kjører
azd show

# Test helsesjekk-endepunkter
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Sjekk logger for feil
azd logs --service api --since 5m | grep -i error
```

**Suksesskriterier:**
- ✅ Alle tjenester viser status "Kjører"
- ✅ Helseendepunkter returnerer HTTP 200
- ✅ Ingen feillogger de siste 5 minuttene
- ✅ Applikasjonen svarer på testforespørsler

## 🏗️ Forstå distribusjonsprosessen

### Fase 1: Hooks før klargjøring
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

### Fase 2: Klargjøring av infrastruktur
- Leser infrastrukturmaler (Bicep/Terraform)
- Oppretter eller oppdaterer Azure-ressurser
- Konfigurerer nettverk og sikkerhet
- Setter opp overvåking og logging

### Fase 3: Hooks etter klargjøring
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

### Fase 4: Pakketering av applikasjon
- Bygger applikasjonskode
- Oppretter distribusjonsartefakter
- Pakkes for målplattform (containere, ZIP-filer, etc.)

### Fase 5: Hooks før distribusjon
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

### Fase 6: Distribusjon av applikasjon
- Distribuerer pakkede applikasjoner til Azure-tjenester
- Oppdaterer konfigurasjonsinnstillinger
- Starter/omstarter tjenester

### Fase 7: Hooks etter distribusjon
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

## 🎛️ Distribusjonskonfigurasjon

### Tjenestespesifikke distribusjonsinnstillinger
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

### Miljøspesifikke konfigurasjoner
```bash
# Utviklingsmiljø
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Testmiljø
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Produksjonsmiljø
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Avanserte distribusjonsscenarier

### Applikasjoner med flere tjenester
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

### Blå-grønn distribusjon
```bash
# Opprett blått miljø
azd env new production-blue
azd up --environment production-blue

# Test blått miljø
./scripts/test-environment.sh production-blue

# Bytt trafikk til blått (manuell DNS/load balancer oppdatering)
./scripts/switch-traffic.sh production-blue

# Rydd opp i grønt miljø
azd env select production-green
azd down --force
```

### Kanaridistribusjoner
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

### Fasedistribusjoner
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

## 🐳 Containerdistribusjoner

### Distribusjon av containerapper
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

### Optimalisering av multi-stage Dockerfile
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

## ⚡ Ytelsesoptimalisering

### Parallelle distribusjoner
```bash
# Konfigurer parallell distribusjon
azd config set deploy.parallelism 5

# Distribuer tjenester parallelt
azd deploy --parallel
```

### Byggecache
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

### Inkrementelle distribusjoner
```bash
# Distribuer bare endrede tjenester
azd deploy --incremental

# Distribuer med endringsdeteksjon
azd deploy --detect-changes
```

## 🔍 Overvåking av distribusjon

### Sanntidsovervåking av distribusjon
```bash
# Overvåk distribusjonsfremdrift
azd deploy --follow

# Vis distribusjonslogger
azd logs --follow --service api

# Sjekk distribusjonsstatus
azd show --service api
```

### Helsesjekker
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

### Validering etter distribusjon
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Sjekk applikasjonens helse
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

## 🔐 Sikkerhetsvurderinger

### Håndtering av hemmeligheter
```bash
# Lagre hemmeligheter sikkert
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Referer til hemmeligheter i azure.yaml
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

### Nettverkssikkerhet
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identitets- og tilgangsstyring
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

## 🚨 Tilbakeføringsstrategier

### Rask tilbakeføring
```bash
# Tilbakestill til forrige distribusjon
azd deploy --rollback

# Tilbakestill spesifikk tjeneste
azd deploy --service api --rollback

# Tilbakestill til spesifikk versjon
azd deploy --service api --version v1.2.3
```

### Tilbakeføring av infrastruktur
```bash
# Tilbakestill infrastrukturendringer
azd provision --rollback

# Forhåndsvis tilbakestillingsendringer
azd provision --rollback --preview
```

### Tilbakeføring av databaseendringer
```bash
#!/bin/bash
# skript/tilbakestill-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Distribusjonsmetrikker

### Spor distribusjonsytelse
```bash
# Aktiver distribusjonsmetrikker
azd config set telemetry.deployment.enabled true

# Vis distribusjonshistorikk
azd history

# Få distribusjonsstatistikk
azd metrics --type deployment
```

### Samle inn tilpassede metrikker
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

## 🎯 Beste praksis

### 1. Konsistens i miljøer
```bash
# Bruk konsekvent navngivning
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Oppretthold miljøparitet
./scripts/sync-environments.sh
```

### 2. Validering av infrastruktur
```bash
# Valider før distribusjon
azd provision --preview
azd provision --what-if

# Bruk ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Testing og integrasjon
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

### 4. Dokumentasjon og logging
```bash
# Dokumenter distribusjonsprosedyrer
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Neste steg

- [Klargjøring av ressurser](provisioning.md) - Dypdykk i infrastrukturhåndtering
- [Planlegging før distribusjon](../pre-deployment/capacity-planning.md) - Planlegg din distribusjonsstrategi
- [Vanlige problemer](../troubleshooting/common-issues.md) - Løs distribusjonsproblemer
- [Beste praksis](../troubleshooting/debugging.md) - Produksjonsklare distribusjonsstrategier

## 🎯 Praktiske distribusjonsøvelser

### Øvelse 1: Inkrementell distribusjonsarbeidsflyt (20 minutter)
**Mål**: Mestre forskjellen mellom full og inkrementell distribusjon

```bash
# Første utrulling
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registrer tidspunkt for første utrulling
echo "Full deployment: $(date)" > deployment-log.txt

# Gjør en kodeendring
echo "// Updated $(date)" >> src/api/src/server.js

# Rull ut kun kode (raskt)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Sammenlign tider
cat deployment-log.txt

# Rydd opp
azd down --force --purge
```

**Suksesskriterier:**
- [ ] Full distribusjon tar 5-15 minutter
- [ ] Kun kodedistribusjon tar 2-5 minutter
- [ ] Kodeendringer reflekteres i distribuert app
- [ ] Infrastruktur forblir uendret etter `azd deploy`

**Læringsutbytte**: `azd deploy` er 50-70% raskere enn `azd up` for kodeendringer

### Øvelse 2: Tilpassede distribusjonshooks (30 minutter)
**Mål**: Implementere automatisering før og etter distribusjon

```bash
# Opprett valideringsskript før distribusjon
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Sjekk om tester består
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Sjekk for ikke-innsendte endringer
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Opprett røyktest etter distribusjon
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

# Legg til kroker i azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Test distribusjon med kroker
azd deploy
```

**Suksesskriterier:**
- [ ] Script før distribusjon kjører før distribusjon
- [ ] Distribusjon avbrytes hvis tester feiler
- [ ] Etter distribusjon validerer røyktest helsen
- [ ] Hooks kjører i riktig rekkefølge

### Øvelse 3: Distribusjonsstrategi for flere miljøer (45 minutter)
**Mål**: Implementere fasedistribusjonsarbeidsflyt (dev → staging → produksjon)

```bash
# Opprett distribusjonsskript
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Steg 1: Distribuer til dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Steg 2: Distribuer til staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Steg 3: Manuell godkjenning for produksjon
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

# Opprett miljøer
azd env new dev
azd env new staging
azd env new production

# Kjør trinnvis distribusjon
./deploy-staged.sh
```

**Suksesskriterier:**
- [ ] Dev-miljø distribueres vellykket
- [ ] Staging-miljø distribueres vellykket
- [ ] Manuell godkjenning kreves for produksjon
- [ ] Alle miljøer har fungerende helsesjekker
- [ ] Kan rulles tilbake ved behov

### Øvelse 4: Tilbakeføringsstrategi (25 minutter)
**Mål**: Implementere og teste distribusjonstilbakeføring

```bash
# Distribuer v1
azd env set APP_VERSION "1.0.0"
azd up

# Lagre v1-konfigurasjon
cp -r .azure/production .azure/production-v1-backup

# Distribuer v2 med brytende endring
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Oppdag feil
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rull tilbake kode
    git checkout src/api/src/server.js
    
    # Rull tilbake miljø
    azd env set APP_VERSION "1.0.0"
    
    # Distribuer v1 på nytt
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Suksesskriterier:**
- [ ] Kan oppdage distribusjonsfeil
- [ ] Tilbakeføringsscript kjører automatisk
- [ ] Applikasjonen returnerer til fungerende tilstand
- [ ] Helsesjekker passerer etter tilbakeføring

## 📊 Spor distribusjonsmetrikker

### Spor din distribusjonsytelse

```bash
# Opprett distribusjonsmetrikkskript
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

# Logg til fil
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Bruk det
./track-deployment.sh
```

**Analyser dine metrikker:**
```bash
# Vis distribusjonshistorikk
cat deployment-metrics.csv

# Beregn gjennomsnittlig distribusjonstid
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Ytterligere ressurser

- [Azure Developer CLI Distribusjonsreferanse](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Distribusjon](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Distribusjon](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Distribusjon](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasjon**
- **Forrige leksjon**: [Ditt første prosjekt](../getting-started/first-project.md)
- **Neste leksjon**: [Klargjøring av ressurser](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->