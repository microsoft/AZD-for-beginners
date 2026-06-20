# Deploymentsvejledning - Mestring af AZD-udrulninger

**Kapitelnavigation:**
- **📚 Course Home**: [AZD til begyndere](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 4 - Infrastruktur som kode og udrulning
- **⬅️ Forrige kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)
- **➡️ Næste**: [Provisionering af ressourcer](provisioning.md)
- **🧩 Også i dette kapitel**: [Udarbejdelse af din egen skabelon](custom-templates.md)
- **🚀 Næste kapitel**: [Kapitel 5: Multi-agent AI-løsninger](../../examples/retail-scenario.md)

## Introduktion

Denne omfattende vejledning dækker alt, du skal vide om at udrulle applikationer med Azure Developer CLI, fra grundlæggende én-kommando-udrulninger til avancerede produktionsscenarier med tilpassede hooks, flere miljøer og CI/CD-integration. Mestre hele udrulningslivscyklussen med praktiske eksempler og bedste praksis.

## Læringsmål

Ved at gennemføre denne vejledning vil du:
- Mestre alle Azure Developer CLI udrulningskommandoer og arbejdsgange
- Forstå hele udrulningslivscyklussen fra provisionering til overvågning
- Implementere tilpassede udrulningshooks til pre- og post-udrulningsautomatisering
- Konfigurere flere miljøer med miljøspecifikke parametre
- Opsætte avancerede udrulningsstrategier inklusive blue-green og canary-udrulninger
- Integrere azd-udrulninger med CI/CD-pipelines og DevOps-arbejdsgange

## Læringsresultater

Efter gennemførelsen vil du være i stand til at:
- Udføre og fejlsøge alle azd-udrulningsarbejdsgange selvstændigt
- Designe og implementere tilpasset udrulningsautomatisering ved hjælp af hooks
- Konfigurere produktionsklare udrulninger med korrekt sikkerhed og overvågning
- Håndtere komplekse multi-miljø udrulningsscenarier
- Optimere udrulningsydelse og implementere rollback-strategier
- Integrere azd-udrulninger i virksomheds DevOps-praksis

## Oversigt over udrulning

Azure Developer CLI tilbyder flere udrulningskommandoer:
- `azd up` - Fuldt workflow (provisionering + udrulning)
- `azd provision` - Opret/opdater Azure-ressourcer kun
- `azd deploy` - Udrul kun applikationskode
- `azd package` - Byg og pak applikationer

## Grundlæggende udrulningsarbejdsgange

### Fuldt udrul (azd up)
Den mest almindelige arbejdsgang for nye projekter:
```bash
# Udrul alt fra bunden
azd up

# Udrul i et specifikt miljø
azd up --environment production

# Udrul med brugerdefinerede parametre
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Kun infrastruktur-udrulning
Når du kun skal opdatere Azure-ressourcer:
```bash
# Provisionér/opdater infrastruktur
azd provision

# Provisionér med dry-run for at forhåndsvise ændringer
azd provision --preview

# Provisionér specifikke tjenester
azd provision --service database
```

### Kun kode-udrulning
Til hurtige opdateringer af applikationen:
```bash
# Udrul alle tjenester
azd deploy

# Forventet output:
# Udruller tjenester (azd deploy)
# - web: Udruller... Færdig
# - api: Udruller... Færdig
# SUCCES: Din udrulning blev gennemført på 2 minutter og 15 sekunder

# Udrul en specifik tjeneste
azd deploy --service web
azd deploy --service api

# Udrul med brugerdefinerede build-argumenter
azd deploy --service api --build-arg NODE_ENV=production

# Bekræft udrulning
azd show --output json | jq '.services'
```

### ✅ Verificering af udrulning

Efter enhver udrulning, bekræft at den var succesfuld:

```bash
# Kontroller, at alle tjenester kører
azd show

# Test sundhedsendepunkter
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Overvåg for fejl (åbnes i browseren som standard)
azd monitor --logs
```

**Succeskriterier:**
- ✅ Alle tjenester viser "Kører" status
- ✅ Sundhedsendepunkter returnerer HTTP 200
- ✅ Ingen fejl i loggene i de sidste 5 minutter
- ✅ Applikationen svarer på testforespørgsler

## 🏗️ Forstå udrulningsprocessen

### Ny til hooks? Start her

En **hook** er en kommando azd kører automatisk på et bestemt tidspunkt i udrulningsprocessen—før eller efter provisionering, og før eller efter udrulning af din kode. De lader dig automatisere de små opgaver, som altid omgiver en udrulning: seedning af en database, kørsel af migrationer, bygge assets eller smoke-test af den live app.

| Hook | Kører… | Typisk anvendelse |
|------|--------|-------------------|
| `preprovision` | Før ressourcer oprettes | Valider forudsætninger, log ind i et register |
| `postprovision` | Efter ressourcer eksisterer | Konfigurer ressourcer, opsæt databasen |
| `predeploy` | Før kode udrulles | Byg front-end assets, kør enhedstest |
| `postdeploy` | Efter kode er live | Kør DB-migrationer, smoke-test endpointet |

Hooks ligger i din `azure.yaml`. Her er det mindste mulige eksempel—det printer blot en besked efter udrulning:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Det var det—næste gang du kører `azd up`, udskrives beskeden automatisk. Du kan også køre en hook alene, uden en fuld udrulning, hvilket er godt til test:

```bash
azd hooks run postdeploy
```

Faserne nedenfor viser virkelighedsnære hooks (migrationer, tests, validering) for hver fase.

### Fase 1: Pre-provision hooks
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

### Fase 2: Provisionering af infrastruktur
- Læser infrastruktur-skabeloner (Bicep/Terraform)
- Opretter eller opdaterer Azure-ressourcer
- Konfigurerer netværk og sikkerhed
- Opsætter overvågning og logning

### Fase 3: Post-provision hooks
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

### Fase 4: Pakning af applikationen
- Bygger applikationskode
- Opretter udrulningsartefakter
- Pakker til målplatformen (containere, ZIP-filer, osv.)

### Fase 5: Pre-deploy hooks
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

### Fase 6: Udrulning af applikationen
- Udruller pakkede applikationer til Azure-tjenester
- Opdaterer konfigurationsindstillinger
- Starter/genstarter tjenester

### Fase 7: Post-deploy hooks
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

### Håndtering af hook-fejl

Som standard, **hvis en hook-kommando afsluttes med en ikke-nul exitkode, stopper azd hele operationen.** Det er som regel det, du ønsker—en fejlet migration bør stoppe udrulningen, ikke sende en brudt app i produktion. Men det betyder også, at hooks skal skrives omhyggeligt.

**1. Gør fejl tydelige og tilsigtede.** En hook fejler, når dens sidste kommando returnerer en ikke-nul exitkode. I shell-scripts, tilføj `set -e`, så hooken stopper ved den første fejl i stedet for at fortsætte stille:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Tillad at en hook fejler uden at stoppe azd.** For ikke-kritiske trin (en valgfri cache-opvarmning, en best-effort-notifikation), sæt `continueOnError: true`. azd logger fejlen, men fortsætter:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Test hooks isoleret før en fuld kørsels.** Du behøver ikke køre `azd up` for at debugge en hook—kør den alene og iterér hurtigt:

```bash
azd hooks run predeploy          # kører kun predeploy-hooken
azd hooks run postdeploy --service api
```

**4. Pas på OS-specifikke shells.** En hook der bruger `shell: pwsh` kræver PowerShell installeret på maskinen, der kører den (inklusive CI-agenter). Brug `shell: sh` for bredest mulig portabilitet, eller lever begge `windows` og `posix` varianter:

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

> **Debugging-tip:** kør enhver azd-kommando med `--debug` for at se den præcise hook-kommando og dens fulde output—uvurderligt, når en hook virker lokalt men fejler i CI.

## 🎛️ Udrulningskonfiguration

### Tjeneste-specifikke udrulningsindstillinger
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

### Miljøspecifikke konfigurationer
```bash
# Udviklingsmiljø
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging-miljø
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Produktionsmiljø
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Avancerede udrulningsscenarier

### Multitjenesteapplikationer
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

### Blue-green-udrulninger
```bash
# Opret blå miljø
azd env new production-blue
azd up --environment production-blue

# Test det blå miljø
./scripts/test-environment.sh production-blue

# Skift trafik til blå (manuel opdatering af DNS/load balancer)
./scripts/switch-traffic.sh production-blue

# Ryd op i det grønne miljø
azd env select production-green
azd down --force
```

### Canary-udrulninger
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

### Trinvise udrulninger
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

## 🐳 Containerudrulninger

### Container-app-udrulninger
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

### Flertrins Dockerfile-optimering
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

## ⚡ Ydelsesoptimering

### Tjenestespecifikke udrulninger
```bash
# Udrul en specifik tjeneste for hurtigere iteration
azd deploy --service web
azd deploy --service api

# Udrul alle tjenester
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

### Effektive kodeudrulninger
```bash
# Brug azd deploy (ikke azd up) til ændringer, der kun er i koden
# Dette springer opsætning af infrastrukturen over og er meget hurtigere
azd deploy

# Udrul en specifik tjeneste for hurtigst mulig iteration
azd deploy --service api
```

## 🔍 Overvågning af udrulning

### Realtids-overvågning af udrulninger
```bash
# Overvåg applikationen i realtid
azd monitor --live

# Se applikationslogfiler
azd monitor --logs

# Kontroller udrulningsstatus
azd show
```

### Sundhedstjek
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

### Validering efter udrulning
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Kontroller applikationens sundhed
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

## 🔐 Sikkerhedsovervejelser

### Håndtering af hemmeligheder
```bash
# Opbevar hemmeligheder sikkert
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Referer til hemmeligheder i azure.yaml
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

### Netværkssikkerhed
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identitets- og adgangsstyring
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

### Hurtig rollback
```bash
# AZD har ikke indbygget tilbageførsel. Anbefalede fremgangsmåder:

# Mulighed 1: Genudrul fra Git (anbefalet)
git revert HEAD  # Tilbagefør det problematiske commit
git push
azd deploy

# Mulighed 2: Genudrul et specifikt commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback af infrastruktur
```bash
# Forhåndsvis infrastrukturændringer før anvendelse
azd provision --preview

# Til tilbagerulning af infrastrukturen, brug versionsstyring:
git revert HEAD  # Tilbagefør ændringer i infrastrukturen
azd provision    # Anvend tidligere infrastrukturtilstand
```

### Rollback af databasemigrationer
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Udrulningsmetrikker

### Spor udrulningsydelse
```bash
# Vis den aktuelle udrulningsstatus
azd show

# Overvåg applikationen med Application Insights
azd monitor --overview

# Vis live-metrikker
azd monitor --live
```

### Tilpasset metriksamling
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

## 🎯 Bedste praksis

### 1. Konsistens mellem miljøer
```bash
# Brug konsekvent navngivning
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Oprethold paritet mellem miljøerne
./scripts/sync-environments.sh
```

### 2. Infrastrukturvalidering
```bash
# Forhåndsvis infrastrukturændringer før udrulning
azd provision --preview

# Brug ARM/Bicep-linting
az bicep lint --file infra/main.bicep

# Valider Bicep-syntaks
az bicep build --file infra/main.bicep
```

### 3. Testintegration
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

### 4. Dokumentation og logning
```bash
# Dokumentér udrulningsprocedurer
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Næste skridt

- [Provisionering af ressourcer](provisioning.md) - Dybdegående gennemgang af infrastrukturadministration
- [Planlægning før udrulning](../chapter-06-pre-deployment/capacity-planning.md) - Planlæg din udrulningsstrategi
- [Almindelige problemer](../chapter-07-troubleshooting/common-issues.md) - Løs udrulningsproblemer
- [Bedste praksis](../chapter-07-troubleshooting/debugging.md) - Produktionsklare udrulningsstrategier

## 🎯 Praktiske udrulningsøvelser

### Øvelse 1: Inkrementel udrulningsarbejdsgang (20 minutter)
**Mål**: Mestre forskellen mellem fulde og inkrementelle udrulninger

```bash
# Initial udrulning
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registrer tidspunkt for initial udrulning
echo "Full deployment: $(date)" > deployment-log.txt

# Foretag en kodeændring
echo "// Updated $(date)" >> src/api/src/server.js

# Udrul kun kode (hurtigt)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Sammenlign tider
cat deployment-log.txt

# Ryd op
azd down --force --purge
```

**Succeskriterier:**
- [ ] En fuld udrulning tager 5-15 minutter
- [ ] En udrulning kun af kode tager 2-5 minutter
- [ ] Kodeændringer afspejles i den udrullede app
- [ ] Infrastruktur uændret efter `azd deploy`

**Læringsudbytte**: `azd deploy` er 50-70% hurtigere end `azd up` for kodeændringer

### Øvelse 2: Tilpassede udrulningshooks (30 minutter)
**Mål**: Implementer pre- og post-udrulningsautomatisering

```bash
# Opret valideringsskript før udrulning
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Kontroller om testene passerer
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Kontroller for ikke-committede ændringer
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Opret smoke-test efter udrulning
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

# Tilføj hooks til azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Test udrulning med hooks
azd deploy
```

**Succeskriterier:**
- [ ] Pre-deploy-scriptet kører før udrulning
- [ ] Udrulning afbrydes hvis tests fejler
- [ ] Post-deploy smoke-test validerer sundhed
- [ ] Hooks udføres i korrekt rækkefølge

### Øvelse 3: Multi-miljø udrulningsstrategi (45 minutter)
**Mål**: Implementer en trinvise udrulningsarbejdsgang (dev → staging → production)

```bash
# Opret udrulningsscript
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Trin 1: Udrul til dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Trin 2: Udrul til staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Trin 3: Manuel godkendelse til produktion
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

# Opret miljøer
azd env new dev
azd env new staging
azd env new production

# Kør trinvis udrulning
./deploy-staged.sh
```

**Succeskriterier:**
- [ ] Dev-miljøet udrulles succesfuldt
- [ ] Staging-miljøet udrulles succesfuldt
- [ ] Manuel godkendelse kræves til produktion
- [ ] Alle miljøer har fungerende sundhedstjek
- [ ] Kan rulle tilbage om nødvendigt

### Øvelse 4: Rollback-strategi (25 minutter)
**Mål**: Implementer og test rollback af udrulning ved hjælp af Git

```bash
# Udrul v1
azd env set APP_VERSION "1.0.0"
azd up

# Gem v1 commit-hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Udrul v2 med inkompatibel ændring
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Opdag fejl og rul tilbage
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rul tilbage med git
    git revert HEAD --no-edit
    
    # Rul miljøet tilbage
    azd env set APP_VERSION "1.0.0"
    
    # Udrul v1 igen
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Succeskriterier:**
- [ ] Kan opdage udrulningsfejl
- [ ] Rollback-script kører automatisk
- [ ] Applikationen vender tilbage til fungerende tilstand
- [ ] Sundhedstjek bestås efter rollback

## 📊 Sporing af udrulningsmetrikker

### Spor din udrulningsydelse

```bash
# Opret script til udrulningsmålinger
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

# Log til fil
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Brug det
./track-deployment.sh
```

**Analyser dine metrikker:**
```bash
# Vis udrulningshistorik
cat deployment-metrics.csv

# Beregn gennemsnitlig udrulningstid
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Yderligere ressourcer

- [Azure Developer CLI - Udrulningsreference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Udrulning](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps - Udrulning af artefakt](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Udrulning](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Forrige lektion**: [Dit første projekt](../chapter-01-foundation/first-project.md)
- **Næste lektion**: [Provisionering af ressourcer](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->