# Distribueringsguide - Bemästra AZD-distributioner

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD For Beginners](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 4 - Infrastruktur som kod & Distribution
- **⬅️ Föregående kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)
- **➡️ Nästa**: [Resursprovisionering](provisioning.md)
- **🚀 Nästa kapitel**: [Kapitel 5: Multiagent-AI-lösningar](../../examples/retail-scenario.md)

## Introduktion

Denna## Förstå distributionsprocessenomfattande guide täcker allt du behöver veta om att distribuera applikationer med Azure Developer CLI, från enkla enkelkommandodistributioner till avancerade produktionsscenarier med anpassade hooks, flera miljöer och CI/CD-integration. Bemästra hela distributionslivscykeln med praktiska exempel och bästa praxis.

## Lärandemål

Genom att slutföra den här guiden kommer du att:
- Bemästra alla Azure Developer CLI-kommandon och arbetsflöden för distribution
- Förstå hela distributionslivscykeln från provisionering till övervakning
- Implementera anpassade deployment-hooks för automatisering före och efter distribution
- Konfigurera flera miljöer med miljöspecifika parametrar
- Ställ in avancerade distributionsstrategier inklusive blue-green och canary-distributioner
- Integrera azd-distributioner med CI/CD-pipelines och DevOps-arbetsflöden

## Läranderesultat

Efter slutförande kommer du att kunna:
- Köra och felsöka alla azd-distributionsarbetsflöden självständigt
- Designa och implementera anpassad distributionsautomatisering med hooks
- Konfigurera produktionsklara distributioner med korrekt säkerhet och övervakning
- Hantera komplexa distributionsscenarier med flera miljöer
- Optimera distributionsprestanda och implementera rollback-strategier
- Integrera azd-distributioner i företags-DevOps-praktiker

## Översikt över distribution

Azure Developer CLI erbjuder flera distributionskommandon:
- `azd up` - Fullständigt arbetsflöde (provisionering + distribution)
- `azd provision` - Skapar eller uppdaterar endast Azure-resurser
- `azd deploy` - Distribuerar endast applikationskod
- `azd package` - Bygger och paketerar applikationer

## Grundläggande distributionsarbetsflöden

### Komplett distribution (azd up)
Det vanligaste arbetsflödet för nya projekt:
```bash
# Distribuera allt från grunden
azd up

# Distribuera med en specifik miljö
azd up --environment production

# Distribuera med anpassade parametrar
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Endast infrastrukturdistribution
När du endast behöver uppdatera Azure-resurser:
```bash
# Provisionera/uppdatera infrastruktur
azd provision

# Provisionera med torrkörning för att förhandsgranska ändringar
azd provision --preview

# Provisionera specifika tjänster
azd provision --service database
```

### Endast koddistribution
För snabba uppdateringar av applikationer:
```bash
# Distribuera alla tjänster
azd deploy

# Förväntad utdata:
# Distribuerar tjänster (azd deploy)
# - web: Distribuerar... Klart
# - api: Distribuerar... Klart
# KLART: Din distribution slutfördes på 2 minuter och 15 sekunder

# Distribuera en specifik tjänst
azd deploy --service web
azd deploy --service api

# Distribuera med anpassade byggargument
azd deploy --service api --build-arg NODE_ENV=production

# Verifiera distributionen
azd show --output json | jq '.services'
```

### ✅ Verifiering av distribution

Efter varje distribution, verifiera framgång:

```bash
# Kontrollera att alla tjänster är igång
azd show

# Testa hälsoendpunkter
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Övervaka efter fel (öppnas i webbläsaren som standard)
azd monitor --logs
```

**Kriterier för framgång:**
- ✅ Alla tjänster visar statusen "Running"
- ✅ Hälsokontroller returnerar HTTP 200
- ✅ Inga fel i loggarna under de senaste 5 minuterna
- ✅ Applikationen svarar på testförfrågningar

## 🏗️ Förstå distributionsprocessen

### Fas 1: För-provisioneringshooks
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

### Fas 2: Infrastrukturprovisionering
- Läser infrastrukturmallar (Bicep/Terraform)
- Skapar eller uppdaterar Azure-resurser
- Konfigurerar nätverk och säkerhet
- Ställer in övervakning och loggning

### Fas 3: Post-provisioneringshooks
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

### Fas 4: Paketering av applikation
- Bygger applikationskod
- Skapar distributionsartefakter
- Paketerar för målplattform (containers, ZIP-filer, etc.)

### Fas 5: För-distributionshooks
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

### Fas 6: Applikationsdistribution
- Distribuerar paketerade applikationer till Azure-tjänster
- Uppdaterar konfigurationsinställningar
- Startar/omstartar tjänster

### Fas 7: Post-distributionshooks
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

## 🎛️ Distributionskonfiguration

### Tjänstspecificerade distributionsinställningar
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

### Miljöspecifika konfigurationer
```bash
# Utvecklingsmiljö
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Stagingmiljö
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Produktionsmiljö
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Avancerade distributionsscenarier

### Applikationer med flera tjänster
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

### Blue-Green-distributioner
```bash
# Skapa den blå miljön
azd env new production-blue
azd up --environment production-blue

# Testa den blå miljön
./scripts/test-environment.sh production-blue

# Växla trafiken till den blå miljön (manuell uppdatering av DNS/lastbalanserare)
./scripts/switch-traffic.sh production-blue

# Rensa upp den gröna miljön
azd env select production-green
azd down --force
```

### Canary-distributioner
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

### Stegvis distribution
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

## 🐳 Container-distributioner

### Distributioner av Container App
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

### Optimering av Dockerfile med flera steg
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

## ⚡ Prestandaoptimering

### Tjänstspecificerade distributioner
```bash
# Distribuera en specifik tjänst för snabbare iterationer
azd deploy --service web
azd deploy --service api

# Distribuera alla tjänster
azd deploy
```

### Byggcache
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Effektiva koddistributioner
```bash
# Använd azd deploy (inte azd up) för enbart kodändringar
# Detta hoppar över uppsättning av infrastrukturen och är mycket snabbare
azd deploy

# Distribuera en specifik tjänst för snabbast möjliga iteration
azd deploy --service api
```

## 🔍 Distributionsövervakning

### Realtidsövervakning av distributioner
```bash
# Övervaka applikationen i realtid
azd monitor --live

# Visa applikationsloggar
azd monitor --logs

# Kontrollera distributionsstatus
azd show
```

### Hälsokontroller
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

### Validering efter distribution
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Kontrollera applikationens hälsa
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

## 🔐 Säkerhetsöverväganden

### Hantering av hemligheter
```bash
# Lagra hemligheter säkert
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Referera till hemligheter i azure.yaml
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

### Nätverkssäkerhet
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identitets- och åtkomsthantering
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

### Snabb rollback
```bash
# AZD har ingen inbyggd återställning. Rekommenderade metoder:

# Alternativ 1: Distribuera om från Git (rekommenderas)
git revert HEAD  # Ångra den problematiska committen
git push
azd deploy

# Alternativ 2: Distribuera en specifik commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastrukturrollback
```bash
# Förhandsgranska ändringar i infrastrukturen innan de tillämpas
azd provision --preview

# För att återställa infrastrukturen, använd versionshantering:
git revert HEAD  # Återställ ändringar i infrastrukturen
azd provision    # Tillämpa tidigare tillstånd för infrastrukturen
```

### Rollback av databasmigration
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Distributionsmått

### Spåra distributionsprestanda
```bash
# Visa aktuell utrullningsstatus
azd show

# Övervaka applikationen med Application Insights
azd monitor --overview

# Visa realtidsmått
azd monitor --live
```

### Anpassad insamling av mätvärden
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

## 🎯 Bästa praxis

### 1. Miljökonsistens
```bash
# Använd konsekvent namngivning
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Upprätthåll paritet mellan miljöer
./scripts/sync-environments.sh
```

### 2. Infrastrukturvalidering
```bash
# Förhandsgranska infrastrukturändringar innan distribution
azd provision --preview

# Använd ARM/Bicep-lintning
az bicep lint --file infra/main.bicep

# Validera Bicep-syntax
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

### 4. Dokumentation och loggning
```bash
# Dokumentera driftsättningsprocedurer
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Nästa steg

- [Provisioning Resources](provisioning.md) - Djupdykning i infrastrukturhantering
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Planera din distributionsstrategi
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Lös distributionsproblem
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Produktionsklara distributionsstrategier

## 🎯 Praktiska övningar för distribution

### Övning 1: Inkrementellt distributionsarbetsflöde (20 minuter)
**Mål**: Bemästra skillnaden mellan fullständiga och inkrementella distributioner

```bash
# Initial driftsättning
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registrera tiden för den initiala driftsättningen
echo "Full deployment: $(date)" > deployment-log.txt

# Gör en kodändring
echo "// Updated $(date)" >> src/api/src/server.js

# Driftsätt endast kod (snabbt)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Jämför tiderna
cat deployment-log.txt

# Rensa upp
azd down --force --purge
```

**Kriterier för framgång:**
- [ ] Fullständig distribution tar 5-15 minuter
- [ ] Endast kod-distribution tar 2-5 minuter
- [ ] Kodändringar återspeglas i den distribuerade appen
- [ ] Infrastrukturen är oförändrad efter `azd deploy`

**Läranderesultat**: `azd deploy` är 50-70% snabbare än `azd up` för kodändringar

### Övning 2: Anpassade distributionshooks (30 minuter)
**Mål**: Implementera automation före och efter distribution

```bash
# Skapa valideringsskript före distribution
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Kontrollera att testerna passerar
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Kontrollera om det finns ocommitterade ändringar
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Skapa röktest efter distribution
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

# Lägg till hooks i azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testa distributionen med hooks
azd deploy
```

**Kriterier för framgång:**
- [ ] Fördistributionsskript körs innan distributionen
- [ ] Distributionen avbryts om tester misslyckas
- [ ] Efterdistributions smoke-test validerar hälsa
- [ ] Hooks körs i korrekt ordning

### Övning 3: Strategi för distribution i flera miljöer (45 minuter)
**Mål**: Implementera ett stegvis distributionsarbetsflöde (dev → staging → production)

```bash
# Skapa driftsättningsskript
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Steg 1: Driftsätt till dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Steg 2: Driftsätt till staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Steg 3: Manuellt godkännande för produktion
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

# Skapa miljöer
azd env new dev
azd env new staging
azd env new production

# Kör stegvis driftsättning
./deploy-staged.sh
```

**Kriterier för framgång:**
- [ ] Dev-miljön distribueras framgångsrikt
- [ ] Staging-miljön distribueras framgångsrikt
- [ ] Manuellt godkännande krävs för produktion
- [ ] Alla miljöer har fungerande hälsokontroller
- [ ] Kan rulla tillbaka vid behov

### Övning 4: Rollback-strategi (25 minuter)
**Mål**: Implementera och testa rollback av distribution med Git

```bash
# Distribuera v1
azd env set APP_VERSION "1.0.0"
azd up

# Spara v1 commit-hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Distribuera v2 med en bakåtkompatibilitetsbrytande ändring
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Detektera fel och rulla tillbaka
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rulla tillbaka med git
    git revert HEAD --no-edit
    
    # Rulla tillbaka miljö
    azd env set APP_VERSION "1.0.0"
    
    # Distribuera v1 igen
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriterier för framgång:**
- [ ] Kan upptäcka distributionsfel
- [ ] Rollback-skript körs automatiskt
- [ ] Applikationen återgår till fungerande tillstånd
- [ ] Hälsokontrollerna passerar efter rollback

## 📊 Spårning av distributionsmått

### Spåra din distributionsprestanda

```bash
# Skapa skript för distributionsmetrik
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

# Logga till fil
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Använd det
./track-deployment.sh
```

**Analysera dina mätvärden:**
```bash
# Visa driftsättningshistorik
cat deployment-metrics.csv

# Beräkna genomsnittlig driftsättningstid
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Ytterligare resurser

- [Azure Developer CLI Distributionsreferens](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service-distribution](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Distribution av Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Distribution av Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigering**
- **Föregående lektion**: [Ditt första projekt](../chapter-01-foundation/first-project.md)
- **Nästa lektion**: [Resursprovisionering](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på sitt ursprungliga språk ska betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->