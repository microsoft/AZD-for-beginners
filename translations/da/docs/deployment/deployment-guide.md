# Implementeringsguide - Mestring af AZD-implementeringer

**Kapiteloversigt:**
- **📚 Kursushjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 4 - Infrastruktur som kode & implementering
- **⬅️ Forrige Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)
- **➡️ Næste**: [Provisionering af ressourcer](provisioning.md)
- **🚀 Næste Kapitel**: [Kapitel 5: Multi-Agent AI-løsninger](../../examples/retail-scenario.md)

## Introduktion

Denne omfattende guide dækker alt, hvad du behøver at vide om at implementere applikationer ved hjælp af Azure Developer CLI, fra grundlæggende implementeringer med én kommando til avancerede produktionsscenarier med brugerdefinerede hooks, flere miljøer og CI/CD-integration. Mestring af hele implementeringslivscyklussen med praktiske eksempler og bedste praksis.

## Læringsmål

Ved at gennemføre denne guide vil du:
- Mestre alle Azure Developer CLI-implementeringskommandoer og arbejdsgange
- Forstå hele implementeringslivscyklussen fra provisionering til overvågning
- Implementere brugerdefinerede implementeringshooks til automatisering før og efter implementering
- Konfigurere flere miljøer med miljøspecifikke parametre
- Opsætte avancerede implementeringsstrategier, herunder blue-green og canary-implementeringer
- Integrere azd-implementeringer med CI/CD-pipelines og DevOps-arbejdsgange

## Læringsresultater

Efter afslutning vil du være i stand til at:
- Udføre og fejlfinde alle azd-implementeringsarbejdsgange selvstændigt
- Designe og implementere brugerdefineret implementeringsautomatisering ved hjælp af hooks
- Konfigurere produktionsklare implementeringer med korrekt sikkerhed og overvågning
- Administrere komplekse implementeringsscenarier med flere miljøer
- Optimere implementeringsydelse og implementere rollback-strategier
- Integrere azd-implementeringer i virksomhedens DevOps-praksis

## Implementeringsoversigt

Azure Developer CLI tilbyder flere implementeringskommandoer:
- `azd up` - Komplet arbejdsgang (provision + implementering)
- `azd provision` - Opret/opdater kun Azure-ressourcer
- `azd deploy` - Implementer kun applikationskode
- `azd package` - Byg og pak applikationer

## Grundlæggende Implementeringsarbejdsgange

### Komplet Implementering (azd up)
Den mest almindelige arbejdsgang for nye projekter:
```bash
# Udrul alt fra bunden
azd up

# Udrul med specifikt miljø
azd up --environment production

# Udrul med brugerdefinerede parametre
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Kun Infrastruktur-Implementering
Når du kun har brug for at opdatere Azure-ressourcer:
```bash
# Klargør/opdater infrastruktur
azd provision

# Klargør med tørkørsel for at forhåndsvise ændringer
azd provision --preview

# Klargør specifikke tjenester
azd provision --service database
```

### Kun Kode-Implementering
Til hurtige applikationsopdateringer:
```bash
# Udrul alle tjenester
azd deploy

# Forventet output:
# Udruller tjenester (azd deploy)
# - web: Udruller... Færdig
# - api: Udruller... Færdig
# SUCCES: Din udrulning blev færdig på 2 minutter og 15 sekunder

# Udrul specifik tjeneste
azd deploy --service web
azd deploy --service api

# Udrul med brugerdefinerede byggeargumenter
azd deploy --service api --build-arg NODE_ENV=production

# Bekræft udrulning
azd show --output json | jq '.services'
```

### ✅ Verifikation af Implementering

Efter enhver implementering, verificer succes:

```bash
# Kontroller, at alle tjenester kører
azd show

# Test sundhedsendepunkter
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Kontroller logfiler for fejl
azd logs --service api --since 5m | grep -i error
```

**Succeskriterier:**
- ✅ Alle tjenester viser status "Kører"
- ✅ Sundhedsendepunkter returnerer HTTP 200
- ✅ Ingen fejl i logfilerne de sidste 5 minutter
- ✅ Applikationen reagerer på testforespørgsler

## 🏗️ Forståelse af Implementeringsprocessen

### Fase 1: Hooks før Provisionering
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

### Fase 2: Infrastrukturprovisionering
- Læser infrastrukturtemplates (Bicep/Terraform)
- Opretter eller opdaterer Azure-ressourcer
- Konfigurerer netværk og sikkerhed
- Opsætter overvågning og logning

### Fase 3: Hooks efter Provisionering
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

### Fase 4: Applikationspakning
- Bygger applikationskode
- Skaber implementeringsartefakter
- Pakker til målplatform (containere, ZIP-filer osv.)

### Fase 5: Hooks før Implementering
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

### Fase 6: Applikationsimplementering
- Implementerer pakkede applikationer til Azure-tjenester
- Opdaterer konfigurationsindstillinger
- Starter/genstarter tjenester

### Fase 7: Hooks efter Implementering
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

## 🎛️ Implementeringskonfiguration

### Tjenestespecifikke Implementeringsindstillinger
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

### Miljøspecifikke Konfigurationer
```bash
# Udviklingsmiljø
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Testmiljø
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

## 🔧 Avancerede Implementeringsscenarier

### Applikationer med Flere Tjenester
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

### Blue-Green Implementeringer
```bash
# Opret blå miljø
azd env new production-blue
azd up --environment production-blue

# Test blå miljø
./scripts/test-environment.sh production-blue

# Skift trafik til blå (manuel DNS/load balancer opdatering)
./scripts/switch-traffic.sh production-blue

# Ryd op i grønt miljø
azd env select production-green
azd down --force
```

### Canary Implementeringer
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

### Fasede Implementeringer
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

## 🐳 Containerimplementeringer

### Implementeringer af Containerapps
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

### Optimering af Multi-Stage Dockerfile
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

### Parallelle Implementeringer
```bash
# Konfigurer parallel deployment
azd config set deploy.parallelism 5

# Udrul tjenester parallelt
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

### Inkrementelle Implementeringer
```bash
# Udrul kun ændrede tjenester
azd deploy --incremental

# Udrul med ændringsdetektion
azd deploy --detect-changes
```

## 🔍 Overvågning af Implementering

### Overvågning i Real-Time
```bash
# Overvåg implementeringsfremskridt
azd deploy --follow

# Se implementeringslogfiler
azd logs --follow --service api

# Kontroller implementeringsstatus
azd show --service api
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

### Validering efter Implementering
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Kontroller applikationens tilstand
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

### Håndtering af Hemmeligheder
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

### Identitets- og Adgangsstyring
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

## 🚨 Rollback-Strategier

### Hurtig Rollback
```bash
# Rul tilbage til tidligere deployment
azd deploy --rollback

# Rul tilbage specifik tjeneste
azd deploy --service api --rollback

# Rul tilbage til specifik version
azd deploy --service api --version v1.2.3
```

### Infrastruktur Rollback
```bash
# Tilbagefør infrastrukturændringer
azd provision --rollback

# Forhåndsvisning af tilbageføringsændringer
azd provision --rollback --preview
```

### Rollback af Databasemigration
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Implementeringsmålinger

### Spor Implementeringsydelse
```bash
# Aktiver implementeringsmetrikker
azd config set telemetry.deployment.enabled true

# Vis implementeringshistorik
azd history

# Få implementeringsstatistikker
azd metrics --type deployment
```

### Indsamling af Brugerdefinerede Målinger
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

## 🎯 Bedste Praksis

### 1. Konsistens i Miljøer
```bash
# Brug konsekvente navngivning
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Oprethold miljøparitet
./scripts/sync-environments.sh
```

### 2. Validering af Infrastruktur
```bash
# Valider før implementering
azd provision --preview
azd provision --what-if

# Brug ARM/Bicep lintning
az bicep lint --file infra/main.bicep
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

### 4. Dokumentation og Logning
```bash
# Dokumenter implementeringsprocedurer
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Næste Skridt

- [Provisionering af Ressourcer](provisioning.md) - Dybdegående om infrastrukturstyring
- [Planlægning før Implementering](../pre-deployment/capacity-planning.md) - Planlæg din implementeringsstrategi
- [Almindelige Problemer](../troubleshooting/common-issues.md) - Løs implementeringsproblemer
- [Bedste Praksis](../troubleshooting/debugging.md) - Produktionsklare implementeringsstrategier

## 🎯 Praktiske Implementeringsøvelser

### Øvelse 1: Inkrementel Implementeringsarbejdsgang (20 minutter)
**Mål**: Mestre forskellen mellem fuld og inkrementel implementering

```bash
# Indledende implementering
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registrer indledende implementeringstid
echo "Full deployment: $(date)" > deployment-log.txt

# Foretag en kodeændring
echo "// Updated $(date)" >> src/api/src/server.js

# Implementer kun kode (hurtigt)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Sammenlign tider
cat deployment-log.txt

# Ryd op
azd down --force --purge
```

**Succeskriterier:**
- [ ] Fuld implementering tager 5-15 minutter
- [ ] Kun kode-implementering tager 2-5 minutter
- [ ] Kodeændringer afspejles i implementeret app
- [ ] Infrastruktur forbliver uændret efter `azd deploy`

**Læringsresultat**: `azd deploy` er 50-70% hurtigere end `azd up` for kodeændringer

### Øvelse 2: Brugerdefinerede Implementeringshooks (30 minutter)
**Mål**: Implementere automatisering før og efter implementering

```bash
# Opret valideringsscript før implementering
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Kontroller om tests består
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

# Opret røgtest efter implementering
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

# Test implementering med hooks
azd deploy
```

**Succeskriterier:**
- [ ] Script før implementering kører før implementering
- [ ] Implementering afbrydes, hvis tests fejler
- [ ] Post-implementerings smoke test validerer sundhed
- [ ] Hooks udføres i korrekt rækkefølge

### Øvelse 3: Implementeringsstrategi for Flere Miljøer (45 minutter)
**Mål**: Implementere fasede implementeringsarbejdsgange (dev → staging → produktion)

```bash
# Opret implementeringsscript
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Trin 1: Implementer til udvikling
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Trin 2: Implementer til staging
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

# Kør trinvis implementering
./deploy-staged.sh
```

**Succeskriterier:**
- [ ] Dev-miljø implementeres succesfuldt
- [ ] Staging-miljø implementeres succesfuldt
- [ ] Manuel godkendelse kræves for produktion
- [ ] Alle miljøer har fungerende sundhedstjek
- [ ] Kan rulles tilbage, hvis nødvendigt

### Øvelse 4: Rollback-Strategi (25 minutter)
**Mål**: Implementere og teste rollback af implementering

```bash
# Udrul v1
azd env set APP_VERSION "1.0.0"
azd up

# Gem v1-konfiguration
cp -r .azure/production .azure/production-v1-backup

# Udrul v2 med brydende ændring
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Registrer fejl
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Tilbagefør kode
    git checkout src/api/src/server.js
    
    # Tilbagefør miljø
    azd env set APP_VERSION "1.0.0"
    
    # Udrul v1 igen
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Succeskriterier:**
- [ ] Kan opdage implementeringsfejl
- [ ] Rollback-script udføres automatisk
- [ ] Applikationen vender tilbage til fungerende tilstand
- [ ] Sundhedstjek består efter rollback

## 📊 Spor Implementeringsmålinger

### Spor Din Implementeringsydelse

```bash
# Opret script til implementeringsmetrikker
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

**Analyser dine målinger:**
```bash
# Vis implementeringshistorik
cat deployment-metrics.csv

# Beregn gennemsnitlig implementeringstid
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Yderligere Ressourcer

- [Azure Developer CLI Implementeringsreference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Implementering](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Implementering](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Implementering](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Forrige Lektion**: [Dit Første Projekt](../getting-started/first-project.md)
- **Næste Lektion**: [Provisionering af Ressourcer](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->