# Juhtimisjuhend - AZD juurutuste valdamine

**Peatüki navigatsioon:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 4 - Infrastruktur kui kood & juurutus
- **⬅️ Eelmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)
- **➡️ Järgmine**: [Ressursside proviisorimine](provisioning.md)
- **🚀 Järgmine peatükk**: [Peatükk 5: Mitme-agendi AI lahendused](../../examples/retail-scenario.md)

## Sissejuhatus

See põhjalik juhend käsitleb kõike, mida peate teadma rakenduste juurutamiseks kasutades Azure Developer CLI-d, alates lihtsatest ühe käsuga juurutustest kuni keerukate tootmistsenaariumiteni kohandatud konksude, mitme keskkonna ja CI/CD integratsiooniga. Valdage kogu juurutustsükkel praktiliste näidete ja parimate tavade abil.

## Õppe eesmärgid

Selle juhendi läbimisel saate:
- Valdada kõiki Azure Developer CLI juurutuskäske ja töövooge
- Mõista kogu juurutustsüklit alates proviisorisamisest kuni jälgimiseni
- Rakendada kohandatud juurutuskonksusid enne ja pärast juurutust automatiseerimiseks
- Konfigureerida mitmeid keskkondi nee-rakenduspõhiste parameetritega
- Seadistada täiustatud juurutusstrateegiad, sealhulgas sinine-roheline ja kanarilendud
- Integreerida azd juurutused CI/CD torujuhtmete ja DevOpsi töövoogudega

## Õpitulemused

Juhendi lõpetamisel oskate:
- Ise sõltumatult käivitada ja tõrkeotsida kõiki azd juurutustöövooge
- Kavandada ja rakendada kohandatud juurutusautomatiseerimist konksude abil
- Konfigureerida tootmiskõlblikke juurutusi õige turvalisuse ja jälgimisega
- Hallata keerukaid mitmekeskkonna juurutustsenaariume
- Optimeerida juurutustulemuslikkust ja rakendada tagasikerimise strateegiaid
- Integreerida azd juurutused ettevõtte DevOps-tavadesse

## Juurutuse ülevaade

Azure Developer CLI pakub mitu juurutuskäsku:
- `azd up` - Täielik töövoog (proviisor + juurutus)
- `azd provision` - Ainult Azure ressursside loomine/uuring
- `azd deploy` - Ainult rakenduskoodi juurutus
- `azd package` - Rakenduste ehitamine ja paki koostamine

## Põhilised juurutustöövood

### Täielik juurutus (azd up)
Kõige tavalisem töövoog uute projektide jaoks:
```bash
# Rakendage kõik nullist
azd up

# Rakendage konkreetse keskkonnaga
azd up --environment production

# Rakendage kohandatud parameetritega
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Ainult infrastruktuuri juurutus
Kui vaja ainult Azure ressursse uuendada:
```bash
# Infrastruktuuri ettevalmistamine/uuendamine
azd provision

# Ettevalmistus kuivkatsega muudatuste eelvaatamiseks
azd provision --preview

# Spetsiifiliste teenuste ettevalmistamine
azd provision --service database
```

### Ainult koodi juurutus
Kiirete rakenduseuuenduste jaoks:
```bash
# Paigalda kõik teenused
azd deploy

# Oodatud väljund:
# Teenuste paigaldamine (azd deploy)
# - veeb: Paigaldamine... Valmis
# - api: Paigaldamine... Valmis
# EDU: Teie paigaldus lõpetati 2 minuti 15 sekundiga

# Paigalda konkreetne teenus
azd deploy --service web
azd deploy --service api

# Paigalda kohandatud ehitussätetega
azd deploy --service api --build-arg NODE_ENV=production

# Kontrolli paigaldust
azd show --output json | jq '.services'
```

### ✅ Juurutuse kontrollimine

Pärast igat juurutust kontrollige edukust:

```bash
# Kontrolli, et kõik teenused töötavad
azd show

# Testi tervise lõpp-punkte
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Jälgi vigu (avatakse vaikimisi brauseris)
azd monitor --logs
```

**Edukuse kriteeriumid:**
- ✅ Kõik teenused näitavad olekut "Töötab"
- ✅ Tervise lõpp-punktid tagastavad HTTP 200
- ✅ Viimase 5 minuti jooksul puuduvad vealogid
- ✅ Rakendus reageerib testipäringutele

## 🏗️ Juurutuse protsessi mõistmine

### Faas 1: Eel-proviisorimise konksud
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

### Faas 2: Infrastrukturiproviisorisam
- Loeb infrastruktuuri malle (Bicep/Terraform)
- Loob või uuendab Azure ressursse
- Konfigureerib võrgustiku ja turvalisuse
- Seadistab jälgimise ja logimise

### Faas 3: Pärast proviisorisamise konksud
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
- Ehitatakse rakenduskood
- Luua juurutusartefaktid
- Pakitakse sihtplatvormi jaoks (konteinerid, ZIP-failid jne)

### Faas 5: Eel-juurutuse konksud
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

### Faas 6: Rakenduse juurutus
- Juurutab pakitud rakendused Azure teenustesse
- Uuendab konfiguratsiooniseadeid
- Käivitab/taaskäivitab teenuseid

### Faas 7: Pärast juurutuse konksud
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

### Teenuse-põhised juurutussätted
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

### Keskkonna-spetsiifilised konfiguratsioonid
```bash
# Arenduskeskkond
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Eelvaatluskeskkond
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

## 🔧 Täiustatud juurutusskenaarid

### Mitme-teenuse rakendused
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

### Sinine-roheline juurutus
```bash
# Loo sinine keskkond
azd env new production-blue
azd up --environment production-blue

# Testi sinist keskkonda
./scripts/test-environment.sh production-blue

# Suuna liiklus sinisele (käsitsi DNS/i koormuse tasakaalustaja uuendus)
./scripts/switch-traffic.sh production-blue

# Puhasta roheline keskkond
azd env select production-green
azd down --force
```

### Kanarilennu juurutus
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

### Etappide kaupa juurutused
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

## 🐳 Konteinerite juurutus

### Konteinerirakenduse juurutused
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

## ⚡ Tulemuslikkuse optimeerimine

### Teenuspõhised juurutused
```bash
# Paiguta konkreetne teenus kiirema iteratsiooni jaoks
azd deploy --service web
azd deploy --service api

# Paiguta kõik teenused
azd deploy
```

### Ehitusvahemälu kasutamine
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Tõhusad koodi juurutused
```bash
# Kasutage koodimuudatuste puhul azd deploy (mitte azd up)
# See vahele jätab infrastruktuuri loomise ja on palju kiirem
azd deploy

# Kiireima iteratsiooni jaoks kasutage konkreetse teenuse juurutamist
azd deploy --service api
```

## 🔍 Juurutuse jälgimine

### Reaalajas juurutuse jälgimine
```bash
# Rakenduse reaalajas jälgimine
azd monitor --live

# Vaata rakenduse logisid
azd monitor --logs

# Kontrolli juurutamise staatust
azd show
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

### Pärast juurutuse valideerimine
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

# Viita saladustele failis azure.yaml
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

### Võrguturvalisus
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

## 🚨 Tagasikerimise strateegiad

### Kiire tagasikerimine
```bash
# AZD-l puudub sisseehitatud tagasikerimine. Soovitatavad lähenemised:

# Variant 1: Ümberpaigaldamine Git-ist (soovitatav)
git revert HEAD  # Probleemse commit'i tagasipööramine
git push
azd deploy

# Variant 2: Spetsiifilise commit'i ümberpaigaldamine
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktuuri tagasikerimine
```bash
# Eelvaade infrastruktuurimuudatustele enne nende rakendamist
azd provision --preview

# Infrastruktuuri tagasipööramiseks kasuta versioonihaldust:
git revert HEAD  # Võta infrastruktuuri muudatused tagasi
azd provision    # Rakenda varasem infrastruktuuri seisund
```

### Andmebaasi migratsiooni tagasikerimine
```bash
#!/bin/bash
# skriptid/tagasi-võta-andmebaas.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Juurutuse mõõdikud

### Jälgi juurutustulemuslikkust
```bash
# Vaata praegust juurutamise olekut
azd show

# Jälgi rakendust Application Insightsiga
azd monitor --overview

# Vaata reaalajas metrikat
azd monitor --live
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

## 🎯 Parimad tavad

### 1. Keskkondade järjepidevus
```bash
# Kasutage järjepidevat nimetamist
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Säilitage keskkondade vastavus
./scripts/sync-environments.sh
```

### 2. Infrastrukturikontroll
```bash
# Enne juurutamist eelvaade infrastruktuuri muudatustele
azd provision --preview

# Kasuta ARM/Bicep lintimist
az bicep lint --file infra/main.bicep

# Kontrolli Bicep süntaksit
az bicep build --file infra/main.bicep
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

### 4. Dokumenteerimine ja logimine
```bash
# Dokumenteerige juurutusprotseduurid
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Järgmised sammud

- [Ressursside proviisorimine](provisioning.md) - Süvaülevaade infrastruktuuri haldusest
- [Enne juurutust planeerimine](../chapter-06-pre-deployment/capacity-planning.md) - Planeerige juurutusstrateegiat
- [Levinud probleemid](../chapter-07-troubleshooting/common-issues.md) - Lahendage juurutusprobleeme
- [Parimad tavad](../chapter-07-troubleshooting/debugging.md) - Tootmiskõlblikud juurutusstrateegiad

## 🎯 Praktikalised juurutuse ülesanded

### Ülesanne 1: Inkrementaalne juurutustöövoog (20 minutit)
**Eesmärk**: Valdada erinevust täielike ja inkrementaalsete juurutuste vahel

```bash
# Esialgne juurutamine
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Salvestage esialgne juurutamisaeg
echo "Full deployment: $(date)" > deployment-log.txt

# Tehke koodimuudatus
echo "// Updated $(date)" >> src/api/src/server.js

# Juurutage ainult kood (kiire)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Võrrelge aegu
cat deployment-log.txt

# Puhastage üles
azd down --force --purge
```

**Edukuse kriteeriumid:**
- [ ] Täielik juurutus võtab 5-15 minutit
- [ ] Ainult koodi juurutus võtab 2-5 minutit
- [ ] Koodimuudatused kajastuvad juurutatud rakenduses
- [ ] Infrastruktur ei muutu pärast `azd deploy` käivitamist

**Õpitulemus**: `azd deploy` on 50-70% kiirem kui `azd up` koodimuudatuste korral

### Ülesanne 2: Kohandatud juurutuskonksud (30 minutit)
**Eesmärk**: Rakendada enne ja pärast juurutust automatiseerimine

```bash
# Loo eelpainutuse valideerimisskript
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Kontrolli, kas testid õnnestuvad
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Kontrolli, kas on muutmata muudatusi
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Loo järelepainutuse suitsutest
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

# Testi paigaldust konksudega
azd deploy
```

**Edukuse kriteeriumid:**
- [ ] Eel-juurutus skript käivitatakse enne juurutust
- [ ] Juurutus katkestatakse, kui testid ebaõnnestuvad
- [ ] Pärast juurutust toimuv suitsutest kontrollib tervist
- [ ] Konksud käivitatakse õiges järjekorras

### Ülesanne 3: Mitmekeskkonna juurutusstrateegia (45 minutit)
**Eesmärk**: Rakendada etapiviisiline juurutustöövoog (dev → staging → production)

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

# Samm 2: Juuruta katsekeskkonda
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Samm 3: Tootmiseks käsitsi kinnitamine
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

# Käivita etapiviisiline juurutus
./deploy-staged.sh
```

**Edukuse kriteeriumid:**
- [ ] Arenduskeskkond juurutatakse edukalt
- [ ] Staging keskkond juurutatakse edukalt
- [ ] Tootmisse minekuks on vajalik manuaalne kinnitamine
- [ ] Kõik keskkonnad omavad töökindlaid tervisekontrolle
- [ ] Võimalus vajadusel tagasikerimiseks

### Ülesanne 4: Tagasikerimise strateegia (25 minutit)
**Eesmärk**: Rakendada ja testida juurutuse tagasikerimist kasutades Giti

```bash
# Paigalda v1
azd env set APP_VERSION "1.0.0"
azd up

# Salvesta v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Paigalda v2 purustava muudatusega
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Tuvasta rike ja tagasipööre
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Tagasipööre git abil
    git revert HEAD --no-edit
    
    # Keskkonna tagasipööre
    azd env set APP_VERSION "1.0.0"
    
    # Paigalda uuesti v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Edukuse kriteeriumid:**
- [ ] Suudetakse tuvastada juurutamise ebaõnnestumisi
- [ ] Tagasikerimise skript käivitub automaatselt
- [ ] Rakendus taastub töökorda
- [ ] Tervisekontrollid läbivad pärast tagasikerimist

## 📊 Juurutuse mõõdikute jälgimine

### Jälgi oma juurutustulemuslikkust

```bash
# Loo juurutusmõõdikute skript
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

**Analüüsi oma mõõdikuid:**
```bash
# Vaata juurutamise ajalugu
cat deployment-metrics.csv

# Arvuta keskmine juurutamisaeg
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Täiendavad ressursid

- [Azure Developer CLI juurutuse viide](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service juurutus](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps juurutus](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions juurutus](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigatsioon**
- **Eelmine õppetund**: [Teie esimene projekt](../chapter-01-foundation/first-project.md)
- **Järgmine õppetund**: [Ressursside proviisorimine](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame täpsust, tuleb arvestada, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Algkeeles dokumenti tuleks pidada autoriteetseks allikaks. Kriitilise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tingitud arusaamatuste või väärarusaamade eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->