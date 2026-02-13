# Deploymentsguide - Mestre AZD-udrulninger

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 4 - Infrastruktur som kode & udrulning
- **⬅️ Forrige kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)
- **➡️ Næste**: [Provisionering af ressourcer](provisioning.md)
- **🚀 Næste kapitel**: [Kapitel 5: Multi-Agent AI-løsninger](../../examples/retail-scenario.md)

## Introduktion

Denne## Forstå udrulningsprocessenen omfattende guide dækker alt, du har brug for at vide om udrulning af applikationer ved hjælp af Azure Developer CLI, fra grundlæggende udrulninger med én kommando til avancerede produktionsscenarier med brugerdefinerede hooks, flere miljøer og CI/CD-integration. Mestér hele udrulningslivscyklussen med praktiske eksempler og bedste fremgangsmåder.

## Læringsmål

By completing this guide, you will:
- Mestre alle Azure Developer CLI-udrulningskommandoer og arbejdsgange
- Forstå hele udrulningslivscyklussen fra provisionering til overvågning
- Implementere brugerdefinerede udrulningshooks til præ- og post-udrulningsautomation
- Konfigurere flere miljøer med miljøspecifikke parametre
- Opsætte avancerede udrulningsstrategier inklusive blue-green og canary-udrulninger
- Integrere azd-udrulninger med CI/CD-pipelines og DevOps-arbejdsgange

## Læringsudbytte

Upon completion, you will be able to:
- Udføre og fejlsøge alle azd-udrulningsarbejdsgange selvstændigt
- Designe og implementere brugerdefineret udrulningsautomation ved hjælp af hooks
- Konfigurere produktionsklare udrulninger med korrekt sikkerhed og overvågning
- Håndtere komplekse multi-miljø udrulningsscenarier
- Optimere udrulningsydelse og implementere rollback-strategier
- Integrere azd-udrulninger i enterprise DevOps-praksis

## Udrulningsoversigt

Azure Developer CLI tilbyder flere udrulningskommandoer:
- `azd up` - Complete workflow (provision + deploy)
- `azd provision` - Create/update Azure resources only
- `azd deploy` - Deploy application code only
- `azd package` - Build and package applications

## Grundlæggende udrulningsworkflows

### Fuld udrulning (azd up)
The most common workflow for new projects:
```bash
# Udrul alt fra bunden
azd up

# Udrul med et specifikt miljø
azd up --environment production

# Udrul med brugerdefinerede parametre
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Kun infrastrukturudrulning
Når du kun skal opdatere Azure-ressourcer:
```bash
# Opsætte/opdatere infrastruktur
azd provision

# Opsætte med dry-run for at forhåndsvise ændringer
azd provision --preview

# Opsætte specifikke tjenester
azd provision --service database
```

### Kun kodeudrulning
Til hurtige applikationsopdateringer:
```bash
# Udrul alle tjenester
azd deploy

# Forventet output:
# Udruller tjenester (azd deploy)
# - web: Udruller... Fuldført
# - api: Udruller... Fuldført
# SUCCES: Din udrulning blev fuldført på 2 minutter og 15 sekunder

# Udrul en specifik tjeneste
azd deploy --service web
azd deploy --service api

# Udrul med brugerdefinerede byggeargumenter
azd deploy --service api --build-arg NODE_ENV=production

# Bekræft udrulning
azd show --output json | jq '.services'
```

### ✅ Verifikation af udrulning

Efter enhver udrulning, verificer succes:

```bash
# Kontroller, at alle tjenester kører
azd show

# Test sundhedsendpoints
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Overvåg for fejl (åbnes i browseren som standard)
azd monitor --logs
```

**Succes kriterier:**
- ✅ Alle tjenester viser status "Running"
- ✅ Sundhedsendepunkter returnerer HTTP 200
- ✅ Ingen fejl-logs i de sidste 5 minutter
- ✅ Applikationen svarer på testforespørgsler

## 🏗️ Forstå udrulningsprocessen

### Fase 1: Hooks før provisionering
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
- Læser infrastrukturskabeloner (Bicep/Terraform)
- Opretter eller opdaterer Azure-ressourcer
- Konfigurerer netværk og sikkerhed
- Opsætter overvågning og logning

### Fase 3: Hooks efter provisionering
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

### Fase 4: Pakning af applikation
- Bygger applikationskode
- Opretter udrulningsartefakter
- Pakker til målplatform (containere, ZIP-filer osv.)

### Fase 5: Hooks før udrulning
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

### Fase 6: Applikationsudrulning
- Udruller pakkede applikationer til Azure-tjenester
- Opdaterer konfigurationsindstillinger
- Starter/genstarter tjenester

### Fase 7: Hooks efter udrulning
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

## 🎛️ Udrulningskonfiguration

### Tjenestespecifikke udrulningsindstillinger
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

### Multi-service applikationer
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
# Opret blåt miljø
azd env new production-blue
azd up --environment production-blue

# Test blåt miljø
./scripts/test-environment.sh production-blue

# Skift trafik til blåt (manuel opdatering af DNS/load balancer)
./scripts/switch-traffic.sh production-blue

# Ryd op i grønt miljø
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

## 🐳 Container-udrulninger

### Udrulninger af Container Apps
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

### Optimering af multistadie Dockerfile
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

## ⚡ Ydeevneoptimering

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
# Brug azd deploy (ikke azd up) til kodeændringer
# Dette springer over opsætning af infrastrukturen og er meget hurtigere
azd deploy

# Udrul en specifik tjeneste for hurtigste iteration
azd deploy --service api
```

## 🔍 Udrulningsovervågning

### Real-time udrulningsovervågning
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

## 🔐 Sikkerhedsmæssige overvejelser

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
git revert HEAD  # Rul den problematiske commit tilbage
git push
azd deploy

# Mulighed 2: Genudrul et specifikt commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktur-rollback
```bash
# Forhåndsvis infrastrukturændringer før anvendelse
azd provision --preview

# For at rulle infrastrukturen tilbage, brug versionskontrol:
git revert HEAD  # Fortryd infrastrukturændringer
azd provision    # Anvend tidligere infrastrukturtilstand
```

### Rollback af database-migration
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Udrulningsmetrics

### Spor udrulningsydelse
```bash
# Vis den aktuelle udrulningsstatus
azd show

# Overvåg applikationen med Application Insights
azd monitor --overview

# Vis målinger i realtid
azd monitor --live
```

### Indsamling af brugerdefinerede metrics
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

### 1. Miljøkonsistens
```bash
# Brug konsekvent navngivning
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Oprethold miljøparitet
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
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Næste skridt

- [Provisionering af ressourcer](provisioning.md) - Dybere indblik i infrastrukturadministration
- [Forudgående udrulningsplanlægning](../chapter-06-pre-deployment/capacity-planning.md) - Planlæg din udrulningsstrategi
- [Almindelige problemer](../chapter-07-troubleshooting/common-issues.md) - Løs udrulningsproblemer
- [Bedste praksis](../chapter-07-troubleshooting/debugging.md) - Produktionsklare udrulningsstrategier

## 🎯 Hands-on udrulningsøvelser

### Øvelse 1: Inkrementelt udrulningsworkflow (20 minutter)
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

# Sammenlign tiderne
cat deployment-log.txt

# Ryd op
azd down --force --purge
```

**Succes kriterier:**
- [ ] Fuld udrulning tager 5-15 minutter
- [ ] Kun kodeudrulning tager 2-5 minutter
- [ ] Kodeændringer afspejles i den udrullede app
- [ ] Infrastruktur uændret efter `azd deploy`

**Læringsudbytte**: `azd deploy` er 50–70% hurtigere end `azd up` for kodeændringer

### Øvelse 2: Brugerdefinerede udrulningshooks (30 minutter)
**Mål**: Implementer præ- og post-udrulningsautomation

```bash
# Opret valideringsscript før udrulning
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Tjek om testene består
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Tjek for ændringer, der ikke er committet
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

**Succes kriterier:**
- [ ] For-udrulningsscript kører før udrulning
- [ ] Udrulning afbrydes, hvis tests fejler
- [ ] Post-deploy smoke-test validerer sundhed
- [ ] Hooks kører i korrekt rækkefølge

### Øvelse 3: Multi-miljø udrulningsstrategi (45 minutter)
**Mål**: Implementer et trinvist udrulningsworkflow (dev → staging → production)

```bash
# Opret udrulningsscript
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Trin 1: Udrul til udviklingsmiljø
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Trin 2: Udrul til staging-miljø
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

# Kør faseopdelt udrulning
./deploy-staged.sh
```

**Succes kriterier:**
- [ ] Dev-miljøet udrulles med succes
- [ ] Staging-miljøet udrulles med succes
- [ ] Manuel godkendelse kræves for produktion
- [ ] Alle miljøer har fungerende sundhedstjek
- [ ] Kan rulles tilbage hvis nødvendigt

### Øvelse 4: Rollback-strategi (25 minutter)
**Mål**: Implementer og test rollback af udrulning ved hjælp af Git

```bash
# Udrul v1
azd env set APP_VERSION "1.0.0"
azd up

# Gem v1-commit-hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Udrul v2 med en inkompatibel ændring
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Opdag fejl og rul tilbage
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rul tilbage ved hjælp af git
    git revert HEAD --no-edit
    
    # Rul miljøet tilbage
    azd env set APP_VERSION "1.0.0"
    
    # Udrul v1 igen
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Succes kriterier:**
- [ ] Kan opdage udrulningsfejl
- [ ] Rollback-script kører automatisk
- [ ] Applikationen vender tilbage til fungerende tilstand
- [ ] Sundhedstjek bestås efter rollback

## 📊 Sporing af udrulningsmetrics

### Spor din udrulningsydelse

```bash
# Opret script til udrulningsmetrikker
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

# Log til fil
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Brug det
./track-deployment.sh
```

**Analyser dine metrics:**
```bash
# Vis udrulningshistorik
cat deployment-metrics.csv

# Beregn gennemsnitlig udrulningstid
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Yderligere ressourcer

- [Azure Developer CLI Udrulningsreference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Udrulning](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Udrulning](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Udrulning](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Forrige lektion**: [Dit første projekt](../chapter-01-foundation/first-project.md)
- **Næste lektion**: [Provisionering af ressourcer](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten Co-op Translator (https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. Ved kritisk information anbefales en professionel, menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->