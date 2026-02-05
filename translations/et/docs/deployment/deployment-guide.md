# Juhtnöörid juurutamiseks - AZD juurutuste valdamine

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Käesolev peatükk**: Peatükk 4 - Infrastruktuur kui kood & juurutamine
- **⬅️ Eelmine peatükk**: [Peatükk 3: Konfiguratsioon](../getting-started/configuration.md)
- **➡️ Järgmine**: [Ressursside ettevalmistamine](provisioning.md)
- **🚀 Järgmine peatükk**: [Peatükk 5: Mitmeagendilised AI lahendused](../../examples/retail-scenario.md)

## Sissejuhatus

See põhjalik juhend hõlmab kõike, mida peate teadma rakenduste juurutamisest Azure Developer CLI abil, alates lihtsatest ühe käsuga juurutustest kuni keerukate tootmistsenaariumiteni, mis hõlmavad kohandatud hook'e, mitut keskkonda ja CI/CD integratsiooni. Valdage kogu juurutustsüklit praktiliste näidete ja parimate tavade abil.

## Õpieesmärgid

Selle juhendi läbimisega:
- Valdate kõik Azure Developer CLI juurutuskäsud ja töövood
- Mõistate täielikku juurutustsüklit alates ettevalmistamisest kuni monitooringuni
- Rakendate kohandatud juurutushook'e automaatseks eel- ja järeljuurutuseks
- Konfigureerite mitut keskkonda keskkonnaspetsiifiliste parameetritega
- Seadistate keerukaid juurutusstrateegiaid, sealhulgas blue-green ja kanarijuurutusi
- Integreerite azd juurutused CI/CD torustike ja DevOps töövoogudega

## Õpitulemused

Pärast juhendi läbimist suudate:
- Iseseisvalt täita ja tõrkeotsingut teha kõigi azd juurutustöövoogude puhul
- Kavandada ja rakendada kohandatud juurutusautomaatikat hook'ide abil
- Konfigureerida tootmisvalmis juurutusi koos turvalisuse ja monitooringuga
- Hallata keerukaid mitmekeskkonnalisi juurutustsenaariume
- Optimeerida juurutuse jõudlust ja rakendada tagasipööramise strateegiaid
- Integreerida azd juurutused ettevõtte DevOps praktikatesse

## Juurutuse ülevaade

Azure Developer CLI pakub mitmeid juurutuskäske:
- `azd up` - Täielik töövoog (ettevalmistamine + juurutamine)
- `azd provision` - Azure'i ressursside loomine/uuendamine
- `azd deploy` - Rakenduskoodi juurutamine
- `azd package` - Rakenduste ehitamine ja pakendamine

## Põhilised juurutustöövood

### Täielik juurutus (azd up)
Kõige tavalisem töövoog uute projektide jaoks:
```bash
# Paigalda kõik algusest peale
azd up

# Paigalda konkreetse keskkonnaga
azd up --environment production

# Paigalda kohandatud parameetritega
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Ainult infrastruktuuri juurutamine
Kui on vaja uuendada ainult Azure'i ressursse:
```bash
# Varusta/uuenda infrastruktuuri
azd provision

# Varusta kuivkäivitusega, et eelvaadata muudatusi
azd provision --preview

# Varusta konkreetseid teenuseid
azd provision --service database
```

### Ainult koodi juurutamine
Kiirete rakenduse uuenduste jaoks:
```bash
# Paigalda kõik teenused
azd deploy

# Oodatav väljund:
# Teenuste paigaldamine (azd deploy)
# - veeb: Paigaldamine... Valmis
# - api: Paigaldamine... Valmis
# EDUKAS: Teie paigaldamine lõpetati 2 minuti ja 15 sekundiga

# Paigalda konkreetne teenus
azd deploy --service web
azd deploy --service api

# Paigalda kohandatud ehitusargumentidega
azd deploy --service api --build-arg NODE_ENV=production

# Kontrolli paigaldust
azd show --output json | jq '.services'
```

### ✅ Juurutuse kontrollimine

Pärast igat juurutust kontrollige edu:

```bash
# Kontrolli, et kõik teenused töötavad
azd show

# Testi tervise lõpp-punkte
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Kontrolli logisid vigade suhtes
azd logs --service api --since 5m | grep -i error
```

**Edu kriteeriumid:**
- ✅ Kõik teenused näitavad "Running" staatust
- ✅ Tervise lõpp-punktid tagastavad HTTP 200
- ✅ Viimase 5 minuti jooksul pole vealoge
- ✅ Rakendus vastab testpäringutele

## 🏗️ Juurutustsükli mõistmine

### Faas 1: Eel-ettevalmistamise hook'id
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

### Faas 2: Infrastruktuuri ettevalmistamine
- Loeb infrastruktuuri mallid (Bicep/Terraform)
- Loob või uuendab Azure'i ressursse
- Konfigureerib võrgu ja turvalisuse
- Seadistab monitooringu ja logimise

### Faas 3: Järel-ettevalmistamise hook'id
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

### Faas 4: Rakenduse pakendamine
- Ehitab rakenduskoodi
- Loob juurutusartefaktid
- Pakendab sihtplatvormi jaoks (konteinerid, ZIP-failid jne)

### Faas 5: Eeljuurutuse hook'id
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

### Faas 6: Rakenduse juurutamine
- Juurutab pakendatud rakendused Azure'i teenustesse
- Uuendab konfiguratsiooniseadeid
- Käivitab/taaskäivitab teenused

### Faas 7: Järeljuurutuse hook'id
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

## 🎛️ Juurutuse konfiguratsioon

### Teenusepõhised juurutusseaded
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

### Keskkonnaspetsiifilised konfiguratsioonid
```bash
# Arenduskeskkond
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Testimiskeskkond
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Tootmiskeskkond
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Täiustatud juurutustsenaariumid

### Mitmeteenuselised rakendused
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

### Blue-Green juurutused
```bash
# Loo sinine keskkond
azd env new production-blue
azd up --environment production-blue

# Testi sinist keskkonda
./scripts/test-environment.sh production-blue

# Suuna liiklus sinisele (manuaalne DNS/koormuse tasakaalustaja uuendus)
./scripts/switch-traffic.sh production-blue

# Puhasta roheline keskkond
azd env select production-green
azd down --force
```

### Kanarijuurutused
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

### Etapiviisilised juurutused
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

## 🐳 Konteinerite juurutused

### Konteinerirakenduste juurutused
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

### Mitmeastmeline Dockerfile optimeerimine
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

## ⚡ Jõudluse optimeerimine

### Paralleelsed juurutused
```bash
# Konfigureeri paralleelne juurutamine
azd config set deploy.parallelism 5

# Juuruta teenused paralleelselt
azd deploy --parallel
```

### Ehituse vahemälu
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

### Järk-järguline juurutamine
```bash
# Paigalda ainult muudetud teenused
azd deploy --incremental

# Paigalda muudatuste tuvastamisega
azd deploy --detect-changes
```

## 🔍 Juurutuse monitooring

### Reaalajas juurutuse monitooring
```bash
# Jälgi juurutamise edenemist
azd deploy --follow

# Vaata juurutamise logisid
azd logs --follow --service api

# Kontrolli juurutamise olekut
azd show --service api
```

### Tervisekontrollid
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

### Järeljuurutuse valideerimine
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Kontrolli rakenduse tervist
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

## 🔐 Turvalisuse kaalutlused

### Saladuste haldamine
```bash
# Salvestage saladused turvaliselt
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Viidake saladustele failis azure.yaml
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

### Võrgu turvalisus
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identiteedi ja juurdepääsu haldamine
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

## 🚨 Tagasipööramise strateegiad

### Kiire tagasipööramine
```bash
# Tagasi eelmise juurutuse juurde
azd deploy --rollback

# Tagasi konkreetse teenuse juurde
azd deploy --service api --rollback

# Tagasi konkreetse versiooni juurde
azd deploy --service api --version v1.2.3
```

### Infrastruktuuri tagasipööramine
```bash
# Tagasi pöörata infrastruktuuri muudatused
azd provision --rollback

# Eelvaade tagasipööramise muudatustest
azd provision --rollback --preview
```

### Andmebaasi migratsiooni tagasipööramine
```bash
#!/bin/bash
# skriptid/tagasi-pööramine-andmebaas.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Juurutuse mõõdikud

### Juurutuse jõudluse jälgimine
```bash
# Luba juurutamise mõõdikud
azd config set telemetry.deployment.enabled true

# Vaata juurutamise ajalugu
azd history

# Hangi juurutamise statistika
azd metrics --type deployment
```

### Kohandatud mõõdikute kogumine
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

## 🎯 Parimad praktikad

### 1. Keskkonna järjepidevus
```bash
# Kasuta järjepidevat nimetust
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Säilita keskkonna võrdsus
./scripts/sync-environments.sh
```

### 2. Infrastruktuuri valideerimine
```bash
# Kontrolli enne juurutamist
azd provision --preview
azd provision --what-if

# Kasuta ARM/Bicep lintimist
az bicep lint --file infra/main.bicep
```

### 3. Testimise integreerimine
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

### 4. Dokumentatsioon ja logimine
```bash
# Dokumenteerige juurutusprotseduurid
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Järgmised sammud

- [Ressursside ettevalmistamine](provisioning.md) - Süvitsi infrastruktuuri haldamine
- [Eeljuurutuse planeerimine](../pre-deployment/capacity-planning.md) - Planeerige oma juurutusstrateegia
- [Levinud probleemid](../troubleshooting/common-issues.md) - Lahendage juurutusprobleeme
- [Parimad praktikad](../troubleshooting/debugging.md) - Tootmisvalmis juurutusstrateegiad

## 🎯 Praktilised juurutusharjutused

### Harjutus 1: Järk-järguline juurutustöövoog (20 minutit)
**Eesmärk**: Valdage täieliku ja järk-järgulise juurutuse erinevust

```bash
# Esialgne juurutamine
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Salvestage esialgse juurutamise aeg
echo "Full deployment: $(date)" > deployment-log.txt

# Tehke koodimuudatus
echo "// Updated $(date)" >> src/api/src/server.js

# Juurutage ainult kood (kiire)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Võrrelge aegu
cat deployment-log.txt

# Koristage
azd down --force --purge
```

**Edu kriteeriumid:**
- [ ] Täielik juurutus kestab 5-15 minutit
- [ ] Ainult koodi juurutus kestab 2-5 minutit
- [ ] Koodimuudatused kajastuvad juurutatud rakenduses
- [ ] Infrastruktuur jääb muutumatuks pärast `azd deploy`

**Õpitulemus**: `azd deploy` on koodimuudatuste jaoks 50-70% kiirem kui `azd up`

### Harjutus 2: Kohandatud juurutushook'id (30 minutit)
**Eesmärk**: Rakendada eel- ja järeljuurutuse automaatikat

```bash
# Loo eelpaigaldamise valideerimise skript
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Kontrolli, kas testid läbivad
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Kontrolli, kas on salvestamata muudatusi
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Loo paigaldamise järgne suitsutest
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

# Lisa konksud azure.yaml faili
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testi paigaldamist koos konksudega
azd deploy
```

**Edu kriteeriumid:**
- [ ] Eeljuurutuse skript käivitub enne juurutust
- [ ] Juurutus katkestatakse, kui testid ebaõnnestuvad
- [ ] Järeljuurutuse kontrolltest valideerib tervise
- [ ] Hook'id käivituvad õiges järjekorras

### Harjutus 3: Mitmekeskkonnaline juurutusstrateegia (45 minutit)
**Eesmärk**: Rakendada etapiviisilist juurutustöövoogu (arendus → testimine → tootmine)

```bash
# Loo juurutusskript
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Samm 1: Juuruta arenduskeskkonda
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Samm 2: Juuruta testimiskeskkonda
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Samm 3: Käsitsi kinnitus tootmiskeskkonna jaoks
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

# Loo keskkonnad
azd env new dev
azd env new staging
azd env new production

# Käivita etappide kaupa juurutamine
./deploy-staged.sh
```

**Edu kriteeriumid:**
- [ ] Arenduskeskkond juurutatakse edukalt
- [ ] Testimiskeskkond juurutatakse edukalt
- [ ] Tootmise jaoks on vajalik käsitsi kinnitus
- [ ] Kõikidel keskkondadel on töötavad tervisekontrollid
- [ ] Vajadusel saab tagasipöörata

### Harjutus 4: Tagasipööramise strateegia (25 minutit)
**Eesmärk**: Rakendada ja testida juurutuse tagasipööramist

```bash
# Paigalda v1
azd env set APP_VERSION "1.0.0"
azd up

# Salvesta v1 konfiguratsioon
cp -r .azure/production .azure/production-v1-backup

# Paigalda v2 koos katkestava muudatusega
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Tuvasta tõrge
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Tagasi kood
    git checkout src/api/src/server.js
    
    # Tagasi keskkond
    azd env set APP_VERSION "1.0.0"
    
    # Paigalda uuesti v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Edu kriteeriumid:**
- [ ] Juurutuse ebaõnnestumised tuvastatakse
- [ ] Tagasipööramise skript käivitub automaatselt
- [ ] Rakendus taastub töötavasse olekusse
- [ ] Tervisekontrollid läbivad pärast tagasipööramist

## 📊 Juurutuse mõõdikute jälgimine

### Jälgige oma juurutuse jõudlust

```bash
# Loo juurutamise mõõdikute skript
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

# Logi faili
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Kasuta seda
./track-deployment.sh
```

**Analüüsige oma mõõdikuid:**
```bash
# Vaata juurutamise ajalugu
cat deployment-metrics.csv

# Arvuta keskmine juurutamise aeg
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Täiendavad ressursid

- [Azure Developer CLI juurutuse viide](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service juurutamine](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps juurutamine](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions juurutamine](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigeerimine**
- **Eelmine õppetund**: [Teie esimene projekt](../getting-started/first-project.md)
- **Järgmine õppetund**: [Ressursside ettevalmistamine](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->