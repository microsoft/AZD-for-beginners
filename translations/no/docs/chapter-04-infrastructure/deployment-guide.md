# Deployering Guide - Mestre AZD Deployeringer

**Kapittel Navigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 4 - Infrastruktur som kode & Deployering
- **⬅️ Forrige Kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)
- **➡️ Neste**: [Tilrettelegging av ressurser](provisioning.md)
- **🧩 Også i dette kapittelet**: [Forfatterskap av din egen Mal](custom-templates.md)
- **🚀 Neste Kapittel**: [Kapittel 5: Multi-Agent AI Løsninger](../../examples/retail-scenario.md)

## Introduksjon

Denne omfattende guiden dekker alt du trenger å vite om deployering av applikasjoner ved bruk av Azure Developer CLI, fra grunnleggende enkelt-kommando deployeringer til avanserte produksjonsscenarier med egendefinerte hooks, flere miljøer og CI/CD-integrasjon. Mestre den komplette deployeringslivssyklusen med praktiske eksempler og beste praksis.

## Læringsmål

Ved å fullføre denne guiden vil du:
- Mestre alle Azure Developer CLI deployeringskommandoer og arbeidsflyter
- Forstå hele deployeringslivssyklusen fra tilrettelegging til overvåking
- Implementere egendefinerte deployeringshooks for pre- og post-deploy automatisering
- Konfigurere flere miljøer med miljøspesifikke parametere
- Sette opp avanserte deployeringsstrategier inkludert blue-green og canary deployeringer
- Integrere azd deployeringer med CI/CD pipelines og DevOps arbeidsflyter

## Læringsutbytte

Etter fullføring vil du kunne:
- Utføre og feilsøke alle azd deployeringsarbeidsflyter selvstendig
- Designe og implementere egendefinert deployeringsautomatisering ved bruk av hooks
- Konfigurere produksjonsklare deployeringer med riktig sikkerhet og overvåking
- Håndtere komplekse multi-miljø deployeringsscenarier
- Optimalisere deployeringsytelse og implementere rollback-strategier
- Integrere azd deployeringer i bedrifts-DevOps praksis

## Oversikt over deployering

Azure Developer CLI tilbyr flere deployeringskommandoer:
- `azd up` - Komplett arbeidsflyt (tilrettelegg + deployer)
- `azd provision` - Opprett/oppdater kun Azure-ressurser
- `azd deploy` - Kun deploy applikasjonskode
- `azd package` - Bygg og pakk applikasjoner

## Grunnleggende deployeringsarbeidsflyter

### Komplett deployering (azd up)
Den vanligste arbeidsflyten for nye prosjekter:
```bash
# Distribuer alt fra bunnen av
azd up

# Distribuer med spesifikt miljø
azd up --environment production

# Distribuer med egendefinerte parametere
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Kun infrastruktur-deployering
Når du kun trenger å oppdatere Azure-ressurser:
```bash
# Tilfør/oppdater infrastruktur
azd provision

# Tilfør med tørrkjøring for å forhåndsvise endringer
azd provision --preview

# Tilfør spesifikke tjenester
azd provision --service database
```

### Kun kode-deployering
For raske applikasjonsoppdateringer:
```bash
# Distribuer alle tjenester
azd deploy

# Forventet utdata:
# Distribuerer tjenester (azd deploy)
# - web: Distribuerer... Ferdig
# - api: Distribuerer... Ferdig
# SUKSESS: Distribusjonen din ble fullført på 2 minutter 15 sekunder

# Distribuer spesifikk tjeneste
azd deploy --service web
azd deploy --service api

# Distribuer med tilpassede byggeargumenter
azd deploy --service api --build-arg NODE_ENV=production

# Verifiser distribusjon
azd show --output json | jq '.services'
```

### ✅ Verifisering av deployering

Etter enhver deployering, verifiser suksess:

```bash
# Sjekk at alle tjenester kjører
azd show

# Test helsetjenestepunkter
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Overvåk for feil (åpnes i nettleser som standard)
azd monitor --logs
```

**Suksesskriterier:**
- ✅ Alle tjenester viser "Kjører" status
- ✅ Helseressurser returnerer HTTP 200
- ✅ Ingen feillogg siste 5 minutter
- ✅ Applikasjonen svarer på testforespørsler

## 🏗️ Forstå deployeringsprosessen

### Ny til hooks? Start her

En **hook** er en kommando som azd kjører automatisk på et bestemt tidspunkt i deployeringsprosessen — før eller etter tilrettelegging, og før eller etter deployering av kode. De lar deg automatisere de små oppgavene som alltid følger med en deployering: fylle en database, kjøre migrasjoner, bygge ressurser eller røykteste den live appen.

| Hook | Kjører… | Vanlig bruk |
|------|---------|-------------|
| `preprovision` | Før ressursene opprettes | Bekrefte forutsetninger, logge inn i et register |
| `postprovision` | Etter ressursene eksisterer | Konfigurere ressurser, sette opp databasen |
| `predeploy` | Før koden deployeres | Bygge frontend-ressurser, kjøre enhetstester |
| `postdeploy` | Etter koden er live | Kjøre DB-migrasjoner, røykteste endepunktet |

Hooks ligger i din `azure.yaml`. Her er det minste mulige eksemplet — det skriver bare ut en melding etter deployering:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Det er alt — neste gang du kjører `azd up`, skrives meldingen ut automatisk. Du kan også kjøre en hook alene, uten en full deploy, som er flott for testing:

```bash
azd hooks run postdeploy
```

Fasene nedenfor viser hooks fra virkelige scenarioer (migrasjoner, tester, validering) for hver fase.

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

### Fase 2: Infrastruktur Tilrettelegging
- Leser infrastrukturmaler (Bicep/Terraform)
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
- Oppretter deployeringsartefakter
- Pakker for målplattform (containere, ZIP-filer, osv.)

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

### Fase 6: Applikasjonsdeployering
- Deployerer pakkede applikasjoner til Azure-tjenester
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

### Håndtering av Hook Feil

Standard er at **hvis en hook-kommando avsluttes med ikke-null kode, stopper azd hele operasjonen.** Dette er vanligvis ønsket — en feilet migrasjon skal stanse deployeringen, ikke levere en ødelagt app. Men det betyr at hooks må skrives med omhu.

**1. Gjør feil hørbare og hensiktmessige.** En hook feiler når dens siste kommando returnerer en ikke-null exit-kode. I shell-skript, legg til `set -e` slik at hook stopper ved første feilede kommando i stedet for å fortsette stille:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Tillat at en hook kan feile uten å stoppe azd.** For ikke-kritiske steg (valgfri cache-opptining, beste innsats-varsel), sett `continueOnError: true`. azd logger feilen men fortsetter:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Test hooks isolert før full kjøring.** Du trenger ikke kjøre `azd up` for å feilsøke en hook — kjør den alene og iterer raskt:

```bash
azd hooks run predeploy          # kjører bare predeploy-hooken
azd hooks run postdeploy --service api
```

**4. Vær oppmerksom på OS-spesifikke shell.** En hook som bruker `shell: pwsh` trenger PowerShell installert på maskinen som kjører den (inkludert CI-agenter). Bruk `shell: sh` for bredest portabilitet, eller gi både `windows` og `posix` varianter:

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

> **Feilsøkingstips:** kjør hvilken som helst azd-kommando med `--debug` for å se den eksakte hook-kommandoen og fullstendig utdata — uvurderlig når en hook fungerer lokalt men feiler i CI.

## 🎛️ Deployeringskonfigurasjon

### Tjenestespesifikke deployeringsinnstillinger
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

## 🔧 Avanserte deployeringsscenarier

### Multi-tjeneste applikasjoner
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

### Blue-Green Deployeringer
```bash
# Opprett blått miljø
azd env new production-blue
azd up --environment production-blue

# Test blått miljø
./scripts/test-environment.sh production-blue

# Bytt trafikk til blått (manuell DNS/load balancer-oppdatering)
./scripts/switch-traffic.sh production-blue

# Rydd opp grønt miljø
azd env select production-green
azd down --force
```

### Canary Deployeringer
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

### Trinnvise Deployeringer
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

## 🐳 Container-Deployeringer

### Container App Deployeringer
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

### Multi-trinn Dockerfile-optimalisering
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

### Tjenestespesifikke deployeringer
```bash
# Distribuer en bestemt tjeneste for raskere iterasjon
azd deploy --service web
azd deploy --service api

# Distribuer alle tjenester
azd deploy
```

### Bygge-cache
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Effektive kode-deployeringer
```bash
# Bruk azd deploy (ikke azd up) for kodeendringer alene
# Dette hopper over infrastrukturprovisjonering og er mye raskere
azd deploy

# Distribuer spesifikk tjeneste for raskest iterasjon
azd deploy --service api
```

## 🔍 Deployeringsovervåking

### Sanntids deployeringsovervåking
```bash
# Overvåk applikasjon i sanntid
azd monitor --live

# Se applikasjonslogger
azd monitor --logs

# Sjekk distribusjonsstatus
azd show
```

### Helsetester
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

### Post-Deploy Validering
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

## 🚨 Rollback-strategier

### Rask rollback
```bash
# AZD har ikke innebygd rollback. Anbefalte tilnærminger:

# Alternativ 1: Deploy på nytt fra Git (anbefalt)
git revert HEAD  # Tilbakestill den problematiske commiten
git push
azd deploy

# Alternativ 2: Deploy på nytt spesifikk commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktur rollback
```bash
# Forhåndsvis infrastrukturendringer før bruk
azd provision --preview

# For å rulle tilbake infrastruktur, bruk versjonskontroll:
git revert HEAD  # Angre infrastrukturendringer
azd provision    # Bruk tidligere infrastrukturtilstand
```

### Database migrasjons rollback
```bash
#!/bin/bash
# scripts/tilbakestill-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Deployeringsmålinger

### Spor deployeringsytelse
```bash
# Vis gjeldende distribusjonsstatus
azd show

# Overvåk applikasjon med Application Insights
azd monitor --overview

# Vis sanntidsmålinger
azd monitor --live
```

### Egendefinerte målesamlinger
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

### 1. Miljø-konsistens
```bash
# Bruk konsekvent navngivning
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Oppretthold miljøparitet
./scripts/sync-environments.sh
```

### 2. Infrastrukturvalidering
```bash
# Forhåndsvis infrastrukturendringer før distribusjon
azd provision --preview

# Bruk ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Valider Bicep-syntaks
az bicep build --file infra/main.bicep
```

### 3. Testing integrasjon
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
# Dokumenter distribusjonsprosedyrene
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Neste steg

- [Tilrettelegging av ressurser](provisioning.md) - Dybdeinnføring i infrastrukturhåndtering
- [Pre-Deploy Planlegging](../chapter-06-pre-deployment/capacity-planning.md) - Planlegg din deployeringsstrategi
- [Vanlige Problemer](../chapter-07-troubleshooting/common-issues.md) - Løs deployeringsproblemer
- [Beste Praksis](../chapter-07-troubleshooting/debugging.md) - Produksjonsklare deployeringsstrategier

## 🎯 Praktiske deployeringsøvelser

### Øvelse 1: Inkrementell deployeringsarbeidsflyt (20 minutter)
**Mål**: Mestre forskjellen mellom full og inkrementell deployering

```bash
# Første distribusjon
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registrer tidspunkt for første distribusjon
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
- [ ] Full deployering tar 5-15 minutter
- [ ] Kode-kun deployering tar 2-5 minutter
- [ ] Endringer i koden reflekteres i deployert app
- [ ] Infrastruktur uendret etter `azd deploy`

**Læringsutbytte**: `azd deploy` er 50-70 % raskere enn `azd up` for kodeendringer

### Øvelse 2: Egendefinerte deployeringshooks (30 minutter)
**Mål**: Implementer pre- og post-deploy automatisering

```bash
# Lag skript for validering før distribusjon
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Sjekk om tester passerer
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Sjekk for uinnsendte endringer
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Lag post-distribusjon røyktest
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
- [ ] Forhåndsdeploy-skript kjører før deployering
- [ ] Deployering avbrytes hvis tester feiler
- [ ] Post-deploy røyktest validerer helsetilstand
- [ ] Hooks kjører i riktig rekkefølge

### Øvelse 3: Multi-miljø deployeringsstrategi (45 minutter)
**Mål**: Implementer trinnvis deployeringsarbeidsflyt (dev → staging → produksjon)

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
- [ ] Dev-miljø deployerer suksessfullt
- [ ] Staging-miljø deployerer suksessfullt
- [ ] Manuell godkjenning kreves for produksjon
- [ ] Alle miljøer har fungerende helsetester
- [ ] Kan rulles tilbake ved behov

### Øvelse 4: Rollback-strategi (25 minutter)
**Mål**: Implementer og test deployeringsrollback ved bruk av Git

```bash
# Distribuer v1
azd env set APP_VERSION "1.0.0"
azd up

# Lagre v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Distribuer v2 med bruddendring
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Oppdag feil og rull tilbake
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rull tilbake med git
    git revert HEAD --no-edit
    
    # Rull tilbake miljø
    azd env set APP_VERSION "1.0.0"
    
    # Distribuer v1 på nytt
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Suksesskriterier:**
- [ ] Kan oppdage deployeringsfeil
- [ ] Rollback-skript kjører automatisk
- [ ] Applikasjonen går tilbake til fungerende tilstand
- [ ] Helsetester passerer etter rollback

## 📊 Spor deployeringsmålinger

### Spor din deployeringsytelse

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Logg til fil
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Bruk det
./track-deployment.sh
```

**Analyser dine målinger:**
```bash
# Vis distribusjonshistorikk
cat deployment-metrics.csv

# Beregn gjennomsnittlig distribusjonstid
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Ytterligere ressurser

- [Azure Developer CLI Deployering Referanse](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployering](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployering](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployering](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasjon**
- **Forrige leksjon**: [Ditt første prosjekt](../chapter-01-foundation/first-project.md)
- **Neste leksjon**: [Tilrettelegging av ressurser](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->