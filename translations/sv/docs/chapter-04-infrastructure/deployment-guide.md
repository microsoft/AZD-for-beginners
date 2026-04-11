# Driftsättningsguide - Bemästra AZD-distributioner

**Kapitelnavigering:**
- **📚 Kursens startsida**: [AZD för nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 4 - Infrastruktur som kod & distribution
- **⬅️ Föregående kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)
- **➡️ Nästa**: [Provisionering av resurser](provisioning.md)
- **🚀 Nästa kapitel**: [Kapitel 5: Multi-Agent AI-lösningar](../../examples/retail-scenario.md)

## Introduktion

Denna omfattande guide täcker allt du behöver veta om att driftsätta applikationer med Azure Developer CLI, från grundläggande enstaka-kommandon driftsättningar till avancerade produktionsscenarier med anpassade hooks, flera miljöer och CI/CD-integrering. Bemästra hela driftsättningslivscykeln med praktiska exempel och bästa praxis.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Bemästra alla Azure Developer CLI driftsättningskommandon och arbetsflöden
- Förstå hela driftsättningslivscykeln från provisioning till övervakning
- Implementera anpassade driftsättningshooks för automatisering före och efter driftsättning
- Konfigurera flera miljöer med miljöspecifika parametrar
- Ställa in avancerade driftsättningsstrategier inklusive blue-green och canary-driftsättningar
- Integrera azd-driftsättningar med CI/CD-pipelines och DevOps-arbetsflöden

## Läranderesultat

Efter slutförande kommer du att kunna:
- Köra och felsöka alla azd-driftsättningsarbetsflöden självständigt
- Designa och implementera anpassad driftsättningsautomatisering med hooks
- Konfigurera produktionsklara driftsättningar med korrekt säkerhet och övervakning
- Hantera komplexa multi-miljö driftsättningsscenarier
- Optimera driftsättningsprestanda och implementera återställningsstrategier
- Integrera azd-driftsättningar i företags-DevOps-praktiker

## Översikt över distribution

Azure Developer CLI tillhandahåller flera driftsättningskommandon:
- `azd up` - Komplett arbetsflöde (provision + deploy)
- `azd provision` - Skapa/uppdatera endast Azure-resurser
- `azd deploy` - Driftsätt endast applikationskod
- `azd package` - Bygg och paketera applikationer

## Grundläggande driftsättningsarbetsflöden

### Komplett driftsättning (azd up)
Det vanligaste arbetsflödet för nya projekt:
```bash
# Distribuera allt från grunden
azd up

# Distribuera med specifik miljö
azd up --environment production

# Distribuera med anpassade parametrar
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Endast infrastruktur-driftsättning
När du endast behöver uppdatera Azure-resurser:
```bash
# Provisionera/uppdatera infrastruktur
azd provision

# Provisionera med torrkörning för att förhandsgranska ändringar
azd provision --preview

# Provisionera specifika tjänster
azd provision --service database
```

### Endast kod-driftsättning
För snabba applikationsuppdateringar:
```bash
# Distribuera alla tjänster
azd deploy

# Förväntad utdata:
# Distribuerar tjänster (azd deploy)
# - web: Distribuerar... Klart
# - api: Distribuerar... Klart
# SUCCESS: Din distribution slutfördes på 2 minuter och 15 sekunder

# Distribuera en specifik tjänst
azd deploy --service web
azd deploy --service api

# Distribuera med egna byggargument
azd deploy --service api --build-arg NODE_ENV=production

# Verifiera distributionen
azd show --output json | jq '.services'
```

### ✅ Verifiering av driftsättning

Efter varje driftsättning, verifiera framgång:

```bash
# Kontrollera att alla tjänster körs
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
- ✅ Hälsoslutpunkter returnerar HTTP 200
- ✅ Inga fel i loggarna de senaste 5 minuterna
- ✅ Applikationen svarar på testförfrågningar

## 🏗️ Förstå driftsättningsprocessen

### Fas 1: Pre-Provision Hooks
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
- Läser infrastruktursmallar (Bicep/Terraform)
- Skapar eller uppdaterar Azure-resurser
- Konfigurerar nätverk och säkerhet
- Ställer in övervakning och loggning

### Fas 3: Post-Provision Hooks
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

### Fas 4: Applikationspaketering
- Bygger applikationskod
- Skapar driftsättningsartefakter
- Paketerar för målplattform (containers, ZIP-filer, med mera)

### Fas 5: Pre-Deploy Hooks
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

### Fas 6: Applikationsdriftsättning
- Driftsätter paketerade applikationer till Azure-tjänster
- Uppdaterar konfigurationsinställningar
- Startar/omstartar tjänster

### Fas 7: Post-Deploy Hooks
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

## 🎛️ Driftsättningskonfiguration

### Tjänstspecificerade driftsättningsinställningar
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

## 🔧 Avancerade driftsättningsscenarier

### Multi-tjänst applikationer
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

### Blue-Green-driftsättningar
```bash
# Skapa blå miljö
azd env new production-blue
azd up --environment production-blue

# Testa blå miljö
./scripts/test-environment.sh production-blue

# Byt trafik till blå (manuell uppdatering av DNS/lastbalanserare)
./scripts/switch-traffic.sh production-blue

# Rensa upp grön miljö
azd env select production-green
azd down --force
```

### Canary-driftsättningar
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

### Stegvisa driftsättningar
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

## 🐳 Containerdriftsättningar

### Container-app driftsättningar
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

### Multisteg Dockerfile-optimering
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

### Tjänstspecificerade driftsättningar
```bash
# Distribuera en specifik tjänst för snabbare iteration
azd deploy --service web
azd deploy --service api

# Distribuera alla tjänster
azd deploy
```

### Bygg-caching
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Effektiva koddriftsättningar
```bash
# Använd azd deploy (inte azd up) för ändringar som endast gäller koden
# Detta hoppar över provisionering av infrastrukturen och är betydligt snabbare
azd deploy

# Distribuera en specifik tjänst för snabbast möjliga iteration
azd deploy --service api
```

## 🔍 Övervakning av driftsättningar

### Realtidsövervakning av driftsättningar
```bash
# Övervaka applikationen i realtid
azd monitor --live

# Visa applikationsloggar
azd monitor --logs

# Kontrollera driftsättningsstatus
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

### Post-driftsättningsvalidering
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

## 🔐 Säkerhetsaspekter

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

## 🚨 Återställningsstrategier

### Snabb återställning
```bash
# AZD har ingen inbyggd återställningsfunktion. Rekommenderade tillvägagångssätt:

# Alternativ 1: Distribuera om från Git (rekommenderas)
git revert HEAD  # Återställ den problematiska committen
git push
azd deploy

# Alternativ 2: Distribuera om en specifik commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastrukturåterställning
```bash
# Förhandsgranska infrastrukturförändringar innan du tillämpar dem
azd provision --preview

# För återställning av infrastrukturen, använd versionskontroll:
git revert HEAD  # Återställ infrastrukturförändringar
azd provision    # Tillämpa tidigare infrastrukturtillstånd
```

### Återställning av databas-migrering
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Driftsättningsmetrik

### Spåra driftsättningsprestanda
```bash
# Visa aktuell distributionsstatus
azd show

# Övervaka applikationen med Application Insights
azd monitor --overview

# Visa live-mätvärden
azd monitor --live
```

### Anpassad metriksamling
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
# Förhandsgranska infrastruktursändringar innan distribution
azd provision --preview

# Använd ARM/Bicep-lintning
az bicep lint --file infra/main.bicep

# Validera Bicep-syntax
az bicep build --file infra/main.bicep
```

### 3. Testintegrering
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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Nästa steg

- [Provisionering av resurser](provisioning.md) - Fördjupning i hantering av infrastruktur
- [Planering före driftsättning](../chapter-06-pre-deployment/capacity-planning.md) - Planera din driftsättningsstrategi
- [Vanliga problem](../chapter-07-troubleshooting/common-issues.md) - Lös driftsättningsproblem
- [Bästa praxis](../chapter-07-troubleshooting/debugging.md) - Produktionsklara driftsättningsstrategier

## 🎯 Praktiska övningar i driftsättning

### Övning 1: Inkrementellt driftsättningsarbetsflöde (20 minuter)
**Mål**: Bemästra skillnaden mellan full och inkrementell driftsättning

```bash
# Initial driftsättning
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Registrera tidpunkt för initial driftsättning
echo "Full deployment: $(date)" > deployment-log.txt

# Gör en kodändring
echo "// Updated $(date)" >> src/api/src/server.js

# Driftsätt endast kod (snabbt)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Jämför tider
cat deployment-log.txt

# Städa upp
azd down --force --purge
```

**Kriterier för framgång:**
- [ ] Fullständig driftsättning tar 5–15 minuter
- [ ] Endast kod-driftsättning tar 2–5 minuter
- [ ] Kodändringar reflekteras i den driftsatta appen
- [ ] Infrastrukturen oförändrad efter `azd deploy`

**Läranderesultat**: `azd deploy` är 50–70 % snabbare än `azd up` för kodändringar

### Övning 2: Anpassade driftsättningshooks (30 minuter)
**Mål**: Implementera automatisering före och efter driftsättning

```bash
# Skapa valideringsskript före distribution
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Kontrollera om testerna passerar
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Kontrollera om det finns ändringar som inte har committats
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
- [ ] Pre-deploy-script körs före driftsättning
- [ ] Driftsättning avbryts om tester misslyckas
- [ ] Post-deploy smoke-test validerar hälsa
- [ ] Hooks körs i korrekt ordning

### Övning 3: Multi-miljö driftsättningsstrategi (45 minuter)
**Mål**: Implementera ett stegvis driftsättningsarbetsflöde (dev → staging → production)

```bash
# Skapa distributionsskript
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Steg 1: Distribuera till dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Steg 2: Distribuera till staging
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

# Kör etappvis distribution
./deploy-staged.sh
```

**Kriterier för framgång:**
- [ ] Dev-miljön driftsätts framgångsrikt
- [ ] Staging-miljön driftsätts framgångsrikt
- [ ] Manuell godkännande krävs för produktion
- [ ] Alla miljöer har fungerande hälsokontroller
- [ ] Kan rullas tillbaka vid behov

### Övning 4: Återställningsstrategi (25 minuter)
**Mål**: Implementera och testa återställning av driftsättning med Git

```bash
# Driftsätt v1
azd env set APP_VERSION "1.0.0"
azd up

# Spara v1:s commit-hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Driftsätt v2 med en bakåtinkompatibel ändring
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Upptäck fel och rulla tillbaka
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rulla tillbaka med git
    git revert HEAD --no-edit
    
    # Rulla tillbaka miljön
    azd env set APP_VERSION "1.0.0"
    
    # Driftsätt v1 igen
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriterier för framgång:**
- [ ] Kan upptäcka driftsättningsfel
- [ ] Återställningsscript körs automatiskt
- [ ] Applikationen återgår till fungerande tillstånd
- [ ] Hälsokontroller godkänns efter återställning

## 📊 Spårning av driftsättningsmetrik

### Spåra din driftsättningsprestanda

```bash
# Skapa skript för driftsättningsstatistik
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

# Logga till fil
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
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

- [Azure Developer CLI driftsättningsreferens](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigering**
- **Föregående lektion**: [Ditt första projekt](../chapter-01-foundation/first-project.md)
- **Nästa lektion**: [Provisionering av resurser](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var god observera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör anses vara den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->