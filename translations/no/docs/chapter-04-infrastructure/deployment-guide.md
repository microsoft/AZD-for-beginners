# Distribusjonsveiledning - Mestre AZD-distribusjoner

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 4 - Infrastruktur som kode & distribusjon
- **⬅️ Forrige Kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)
- **➡️ Neste**: [Provisionering av ressurser](provisioning.md)
- **🚀 Neste Kapittel**: [Kapittel 5: Multi-Agent AI-løsninger](../../examples/retail-scenario.md)

## Introduksjon

Denne omfattende veiledningen dekker alt du trenger å vite om å distribuere applikasjoner ved bruk av Azure Developer CLI, fra grunnleggende enkeltkommando-distribusjoner til avanserte produksjonsscenarier med egendefinerte kroker, flere miljøer og CI/CD-integrasjon. Mestre hele distribusjonslivssyklusen med praktiske eksempler og beste praksis.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Mestre alle Azure Developer CLI distribusjonskommandoer og arbeidsflyter
- Forstå hele distribusjonslivssyklusen fra provisjonering til overvåking
- Implementere egendefinerte distribusjonskroker for automatisering før og etter distribusjon
- Konfigurere flere miljøer med miljøspesifikke parametere
- Sette opp avanserte distribusjonsstrategier inkludert blue-green og canary-distribusjoner
- Integrere azd-distribusjoner med CI/CD-pipelines og DevOps-arbeidsflyter

## Læringsutbytte

Etter fullføring vil du kunne:
- Utføre og feilsøke alle azd-distribusjonsarbeidsflyter selvstendig
- Designe og implementere egendefinert distribusjonsautomatisering med kroker
- Konfigurere produksjonsklare distribusjoner med riktig sikkerhet og overvåking
- Håndtere komplekse distribusjonsscenarier med flere miljøer
- Optimalisere distribusjonsytelse og implementere tilbakeføringsstrategier
- Integrere azd-distribusjoner i virksomhetens DevOps-praksis

## Distribusjonsoversikt

Azure Developer CLI tilbyr flere distribusjonskommandoer:
- `azd up` - Komplett arbeidsflyt (provisjon + distribuer)
- `azd provision` - Opprett/oppdater kun Azure-ressurser
- `azd deploy` - Distribuer kun applikasjonskode
- `azd package` - Bygg og pakk applikasjoner

## Grunnleggende distribusjonsarbeidsflyter

### Komplett Distribusjon (azd up)
Den vanligste arbeidsflyten for nye prosjekter:
```bash
# Distribuer alt fra bunnen av
azd up

# Distribuer med spesifikt miljø
azd up --environment production

# Distribuer med egendefinerte parametere
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Kun Infrastruktur-distribusjon
Når du bare trenger å oppdatere Azure-ressurser:
```bash
# Tilrettelegg/oppdater infrastruktur
azd provision

# Tilrettelegg med tørrkjøring for å forhåndsvise endringer
azd provision --preview

# Tilrettelegg spesifikke tjenester
azd provision --service database
```

### Kun Kode-distribusjon
For raske applikasjonsoppdateringer:
```bash
# Distribuer alle tjenester
azd deploy

# Forventet utdata:
# Distribuerer tjenester (azd deploy)
# - web: Distribuerer... Ferdig
# - api: Distribuerer... Ferdig
# VELYKKET: Din distribusjon ble fullført på 2 minutter 15 sekunder

# Distribuer spesifikk tjeneste
azd deploy --service web
azd deploy --service api

# Distribuer med tilpassede byggeargumenter
azd deploy --service api --build-arg NODE_ENV=production

# Verifiser distribusjon
azd show --output json | jq '.services'
```

### ✅ Verifisering av distribusjon

Etter enhver distribusjon, verifiser suksess:

```bash
# Sjekk at alle tjenester kjører
azd show

# Test helseendepunkter
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Overvåk etter feil (åpnes i nettleser som standard)
azd monitor --logs
```

**Suksesskriterier:**
- ✅ Alle tjenester viser "Kjører" status
- ✅ Helseendepunkter returnerer HTTP 200
- ✅ Ingen feil logger de siste 5 minuttene
- ✅ Applikasjonen svarer på testforespørsler

## 🏗️ Forstå distribusjonsprosessen

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

### Fase 2: Infrastrukturprovisjonering
- Leser infrastruktursjabloner (Bicep/Terraform)
- Oppretter eller oppdaterer Azure-ressurser
- Konfigurerer nettverk og sikkerhet
- Setter opp overvåking og logging

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

### Fase 4: Applikasjonspakking
- Bygger applikasjonskode
- Lager distribusjonsartefakter
- Pakker for målplattform (containere, ZIP-filer, etc.)

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

### Fase 6: Applikasjonsdistribusjon
- Distribuerer pakkede applikasjoner til Azure-tjenester
- Oppdaterer konfigurasjonsinnstillinger
- Starter/omstarter tjenester

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

# Staging-miljø
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

### Blue-Green Distribusjoner
```bash
# Opprett blått miljø
azd env new production-blue
azd up --environment production-blue

# Test blått miljø
./scripts/test-environment.sh production-blue

# Skift trafikk til blått (manuell DNS/load balancer-oppdatering)
./scripts/switch-traffic.sh production-blue

# Rydd opp i grønt miljø
azd env select production-green
azd down --force
```

### Canary Distribusjoner
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

### Trinnvise distribusjoner
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

## 🐳 Container-distribusjoner

### Container App-distribusjoner
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

### Optimalisering av Dockerfile med flere trinn
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

### Tjenestespesifikke distribusjoner
```bash
# Distribuer en spesifikk tjeneste for raskere iterasjon
azd deploy --service web
azd deploy --service api

# Distribuer alle tjenester
azd deploy
```

### Byggekaching
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Effektiv kode-distribusjon
```bash
# Bruk azd deploy (ikke azd up) for kodeendringer alene
# Dette hopper over infrastrukturprovisjonering og er mye raskere
azd deploy

# Distribuer spesifikk tjeneste for raskest iterasjon
azd deploy --service api
```

## 🔍 Overvåking av distribusjoner

### Sanntidsovervåking av distribusjoner
```bash
# Overvåk applikasjonen i sanntid
azd monitor --live

# Se applikasjonslogger
azd monitor --logs

# Sjekk distribusjonsstatus
azd show
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

# Sjekk applikasjonshelse
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

## 🔐 Sikkerhetshensyn

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

### Nettsikkerhet
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identitet og tilgangsstyring
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
# AZD har ikke innebygd tilbakeføring. Anbefalte tilnærminger:

# Alternativ 1: Distribuer på nytt fra Git (anbefalt)
git revert HEAD  # Tilbakestill den problematiske commit
git push
azd deploy

# Alternativ 2: Distribuer spesifikk commit på nytt
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktur-tilbakeføring
```bash
# Forhåndsvis infrastrukturendringer før du bruker dem
azd provision --preview

# For infrastruktur-tilbakestilling, bruk versjonskontroll:
git revert HEAD  # Tilbakestill infrastrukturendringer
azd provision    # Bruk forrige infrastrukturtilstand
```

### Tilbakeføring av database-migrasjon
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Distribusjonsmålinger

### Spor distribusjonsytelse
```bash
# Vis gjeldende distribusjonsstatus
azd show

# Overvåk applikasjonen med Application Insights
azd monitor --overview

# Vis sanntidsmålinger
azd monitor --live
```

### Innsamling av egendefinerte målinger
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

## 🎯 Beste praksiser

### 1. Konsistens mellom miljøer
```bash
# Bruk konsistent navngivning
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Oppretthold miljøparitet
./scripts/sync-environments.sh
```

### 2. Validering av infrastruktur
```bash
# Forhåndsvis infrastrukturendringer før distribusjon
azd provision --preview

# Bruk ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Valider Bicep-syntaks
az bicep build --file infra/main.bicep
```

### 3. Testing-integrasjon
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

- [Provisionering av ressurser](provisioning.md) - Dypdykk i infrastrukturstyring
- [Planlegging før distribusjon](../chapter-06-pre-deployment/capacity-planning.md) - Planlegg distribusjonsstrategien din
- [Vanlige problemer](../chapter-07-troubleshooting/common-issues.md) - Løs distribusjonsproblemer
- [Beste praksiser](../chapter-07-troubleshooting/debugging.md) - Produksjonsklare distribusjonsstrategier

## 🎯 Praktiske distribusjonsøvelser

### Øvelse 1: Trinnvis distribusjonsarbeidsflyt (20 minutter)
**Mål**: Mestre forskjellen mellom full og trinnvis distribusjon

```bash
# Første distribusjon
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registrer tid for første distribusjon
echo "Full deployment: $(date)" > deployment-log.txt

# Gjør en kodeendring
echo "// Updated $(date)" >> src/api/src/server.js

# Distribuer kun kode (raskt)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Sammenlign tider
cat deployment-log.txt

# Rydd opp
azd down --force --purge
```

**Suksesskriterier:**
- [ ] Full distribusjon tar 5-15 minutter
- [ ] Kode-kun distribusjon tar 2-5 minutter
- [ ] Kodeendringer reflekteres i distribuert app
- [ ] Infrastruktur uendret etter `azd deploy`

**Læringsutbytte**: `azd deploy` er 50-70 % raskere enn `azd up` for kodeendringer

### Øvelse 2: Egendefinerte distribusjonskroker (30 minutter)
**Mål**: Implementere automatisering før og etter distribusjon

```bash
# Lag et valideringsskript før distribusjon
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Sjekk om tester består
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Sjekk etter uforpliktede endringer
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Lag en røyktest etter distribusjon
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

# Legg til hooks i azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Test distribusjon med hooks
azd deploy
```

**Suksesskriterier:**
- [ ] Pre-deploy-skript kjører før distribusjon
- [ ] Distribusjon avbrytes hvis tester feiler
- [ ] Post-deploy røyketest validerer helsetilstand
- [ ] Kroker utføres i riktig rekkefølge

### Øvelse 3: Distribusjonsstrategi med flere miljøer (45 minutter)
**Mål**: Implementere trinnvis distribusjonsarbeidsflyt (dev → staging → produksjon)

```bash
# Lag distribusjonsskript
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Trinn 1: Distribuer til dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Trinn 2: Distribuer til staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Trinn 3: Manuell godkjenning for produksjon
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
- [ ] Kan tilbakeføres om nødvendig

### Øvelse 4: Tilbakeføringsstrategi (25 minutter)
**Mål**: Implementere og teste distribusjonstilbakeføring ved bruk av Git

```bash
# Distribuer v1
azd env set APP_VERSION "1.0.0"
azd up

# Lagre v1 commit-hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Distribuer v2 med bakoverbrudd
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Oppdag feil og tilbakestill
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Tilbakestill med git
    git revert HEAD --no-edit
    
    # Tilbakestill miljø
    azd env set APP_VERSION "1.0.0"
    
    # Distribuer v1 på nytt
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Suksesskriterier:**
- [ ] Kan oppdage distribusjonsfeil
- [ ] Tilbakeføringsskript kjører automatisk
- [ ] Applikasjonen går tilbake til fungerende tilstand
- [ ] Helsesjekker godkjennes etter tilbakeføring

## 📊 Sporing av distribusjonsmålinger

### Spor distribusjonsytelsen din

```bash
# Lag skript for distribusjonsmålinger
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

**Analyser målingene dine:**
```bash
# Vis distribusjonshistorikk
cat deployment-metrics.csv

# Beregn gjennomsnittlig distribusjonstid
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Ytterligere ressurser

- [Azure Developer CLI distribusjonsreferanse](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service distribusjon](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps distribusjon](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions distribusjon](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasjon**
- **Forrige leksjon**: [Ditt første prosjekt](../chapter-01-foundation/first-project.md)
- **Neste leksjon**: [Provisionering av ressurser](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved bruk av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->