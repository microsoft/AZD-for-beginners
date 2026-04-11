# Juurutusjuhend - AZD juurutuste valdamine

**Peatükkide navigatsioon:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 4 - Infrastruktuur kui kood & juurutus
- **⬅️ Eelmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)
- **➡️ Järgmine**: [Ressursside loomine](provisioning.md)
- **🚀 Järgmine peatükk**: [Peatükk 5: Mitmeagendi AI lahendused](../../examples/retail-scenario.md)

## Sissejuhatus

See põhjalik juhend käsitleb kõike, mida peate teadma rakenduste juurutamiseks Azure Developer CLI-ga, alustades lihtsatest ühe-käsuga juurutustest kuni keerukate tootmistingimuste stsenaariumiteni, kus kasutatakse kohandatud konksusid, mitut keskkonda ja CI/CD integratsiooni. Valdage kogu juurutustsükkel praktiliste näidete ja parimate tavade abil.

## Õpieesmärgid

Selle juhendi läbimisel:
- Valdate kõiki Azure Developer CLI juurutuskäske ja töövooge
- Mõistate juurutustsükli täielikku ulatust alates ressursside loomise staadiumist kuni jälgimiseni
- Rakendate kohandatud juurutuskonkse eeljuhisteks ja järelmeetmeteks
- Konfigureerite mitut keskkonda koos keskkonnapõhiste parameetritega
- Seate üles täiustatud juurutusstrateegiad, sealhulgas sinakas-roheline ja kanarilinnu juurutused
- Integreerite azd juurutused CI/CD torujuhtmetesse ja DevOps töövoogudesse

## Õpitulemused

Pärast juhendi läbitöötamist oskate:
- Käivitada ja tõrkeotsingut teha kõigis azd juurutustöövoogudes iseseisvalt
- Kujundada ja rakendada kohandatud juurutusautomaatikat konksude abil
- Konfigureerida tootmisküpsed juurutused nõuetekohase turvalisuse ja jälgimisega
- Hallata keerukaid mitme keskkonna juurutusstsenaariume
- Optimeerida juurutuse jõudlust ja rakendada tagasipööramise strateegiaid
- Integreerida azd juurutused ettevõtte DevOps praktikatesse

## Juurutuse ülevaade

Azure Developer CLI pakub mitmeid juurutuskäske:
- `azd up` - Täielik töövoog (ressursside loomine + juurutus)
- `azd provision` - Loo/värskenda ainult Azure ressursse
- `azd deploy` - Juuruta ainult rakenduse kood
- `azd package` - Koosta ja paki rakendused

## Põhilised juurutustöövood

### Täielik juurutus (azd up)
Kõige tavalisem töövoog uutele projektidele:
```bash
# Paigalda kõik nullist
azd up

# Paigalda konkreetse keskkonnaga
azd up --environment production

# Paigalda kohandatud parameetritega
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Ainult infrastruktuuri juurutus
Kui on vaja vaid Azure ressursse uuendada:
```bash
# Taristu pakkumine/uuendamine
azd provision

# Taristu pakkumine kuivjooksuga muudatuste eelvaatamiseks
azd provision --preview

# Spetsiifiliste teenuste pakkumine
azd provision --service database
```

### Ainult koodi juurutus
Kiirete rakenduse uuenduste jaoks:
```bash
# Paigaldage kõik teenused
azd deploy

# Oodatav väljund:
# Teenuste paigaldamine (azd deploy)
# - veeb: Paigaldamine... Valmis
# - api: Paigaldamine... Valmis
# EDU: Teie paigaldus lõppes 2 minuti ja 15 sekundiga

# Paigalda konkreetne teenus
azd deploy --service web
azd deploy --service api

# Paigalda kohandatud ehitussuvanditega
azd deploy --service api --build-arg NODE_ENV=production

# Kontrolli paigaldust
azd show --output json | jq '.services'
```

### ✅ Juurutuse kontrollimine

Pärast iga juurutust kontrollige edukust:

```bash
# Kontrolli, kas kõik teenused töötavad
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
- ✅ Kõik teenused näitavad "Running" olekut
- ✅ Tervise lõpp-punktid tagastavad HTTP 200
- ✅ Viimase 5 minuti jooksul vigu ei ole logitud
- ✅ Rakendus reageerib testipäringutele

## 🏗️ Juurutuse protsessi mõistmine

### Etapp 1: Eelprovisioonikonksud
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

### Etapp 2: Infrastruktuuri loomine
- Loeb infrastruktuuri malle (Bicep/Terraform)
- Loodab või uuendab Azure ressursse
- Konfigureerib võrguühenduse ja turve
- Seab üles jälgimise ja logimise

### Etapp 3: Järelprovisioonikonksud
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

### Etapp 4: Rakenduse pakkimine
- Koostab rakenduse koodi
- Loob juurutusartefaktid
- Pakib sihtplatvormi jaoks (konteinerid, ZIP-failid jne)

### Etapp 5: Eeljuhistuse konksud
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

### Etapp 6: Rakenduse juurutus
- Juurutab pakitud rakendused Azure teenustesse
- Uuendab konfiguratsiooni seadistusi
- Käivitab/taaskäivitab teenuseid

### Etapp 7: Järgjuhistuse konksud
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

### Teenusele spetsiifilised juurutussätted
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

### Keskkonnale spetsiifilised konfiguratsioonid
```bash
# Arenduskeskkond
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Testkeskkond
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

## 🔧 Täiustatud juurutusstsenaariumid

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

### Sinakas-rohelised juurutused
```bash
# Loo sinine keskkond
azd env new production-blue
azd up --environment production-blue

# Testi sinist keskkonda
./scripts/test-environment.sh production-blue

# Suuna liiklus sinisele (manuaalne DNS-/koormusejaoturi värskendus)
./scripts/switch-traffic.sh production-blue

# Puhasta roheline keskkond
azd env select production-green
azd down --force
```

### Kanarilinnu juurutused
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

### Container App juurutused
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

### Teenusele spetsiifilised juurutused
```bash
# Paigalda konkreetne teenus kiirema iteratsiooni jaoks
azd deploy --service web
azd deploy --service api

# Paigalda kõik teenused
azd deploy
```

### Koostamise vahemällu salvestamine
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
# Kasutage ainult koodi muudatuste puhul azd deploy (mitte azd up)
# See vahele jätab infrastruktuuri loomise ning on palju kiirem
azd deploy

# Kiireima iteratsiooni jaoks kasutage konkreetse teenuse juurutamist
azd deploy --service api
```

## 🔍 Juurutuse jälgimine

### Reaalajas juurutuse jälgimine
```bash
# Jälgi rakendust reaalajas
azd monitor --live

# Vaata rakenduse logisid
azd monitor --logs

# Kontrolli juurutamise olekut
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

### Pärast juurutust valideerimine
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
# Hoidke saladused turvaliselt
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

### Võrguturve
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identiteedi ja ligipääsu haldus
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
# AZD-l puudub sisseehitatud tagasipööramine. Soovitatud lähenemised:

# Valik 1: Taaspaigalda Git-ist (soovitatav)
git revert HEAD  # Tagasi võta probleeme tekitav commit
git push
azd deploy

# Valik 2: Taaspaigalda konkreetne commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktuuri tagasipööramine
```bash
# Vaadake infrastruktuuri muudatusi enne rakendamist
azd provision --preview

# Infrastruktuuri tagasipööramiseks kasutage versioonikontrolli:
git revert HEAD  # Võta infrastruktuuri muudatused tagasi
azd provision    # Rakenda eelmise infrastruktuuri olek
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

### Jälgi juurutuse jõudlust
```bash
# Vaata praegust kasutuselevõtu staatust
azd show

# Jälgi rakendust Application Insightsiga
azd monitor --overview

# Vaata reaalajas mõõdikuid
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

## 🎯 Parimad praktikad

### 1. Keskkonna ühtlus
```bash
# Kasuta järjepidevat nimekujundust
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Säilita keskkondade vastavus
./scripts/sync-environments.sh
```

### 2. Infrastruktuuri valideerimine
```bash
# Enne kasutuselevõttu eelvaata infrastruktuuri muudatusi
azd provision --preview

# Kasuta ARM/Bicep-süntaksi kontrolli
az bicep lint --file infra/main.bicep

# Kontrolli Bicep-süntaksit
az bicep build --file infra/main.bicep
```

### 3. Testimise integratsioon
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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Järgmised sammud

- [Ressursside loomine](provisioning.md) - Süvitsi infrastruktuuri haldamisse
- [Eeljuurutuse planeerimine](../chapter-06-pre-deployment/capacity-planning.md) - Planeeri oma juurutusstrateegia
- [Tavalised probleemid](../chapter-07-troubleshooting/common-issues.md) - Lahenda juurutusprobleeme
- [Parimad praktikad](../chapter-07-troubleshooting/debugging.md) - Tootmisküpsed juurutusstrateegiad

## 🎯 Praktilised juurutusharjutused

### Harjutus 1: Samm-sammuline juurutustöövoog (20 minutit)
**Eesmärk**: Saada selgust täis- ja etapiviisilise juurutuse erinevustes

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

# Puhastage
azd down --force --purge
```

**Edukuse kriteeriumid:**
- [ ] Täisjuurutus kestab 5-15 minutit
- [ ] Ainult koodi juurutus kestab 2-5 minutit
- [ ] Koodimuudatused kajastuvad juurutatud rakenduses
- [ ] Pärast `azd deploy` infrastruktuur ei muutu

**Õpitulemus**: `azd deploy` on koodimuuduste puhul 50-70% kiirem kui `azd up`

### Harjutus 2: Kohandatud juurutuskonksude rakendamine (30 minutit)
**Eesmärk**: Rakenda eeljuhiseid ja järelmeetmeid juurutuse automatiseerimiseks

```bash
# Loo eeldeploy'i valideerimisskript
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Kontrolli, kas testid läbivad
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Kontrolli, kas on muudatusi, mida ei ole commititud
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Loo postdeploy'i suitsetest
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

# Testi deploy'd konksudega
azd deploy
```

**Edukuse kriteeriumid:**
- [ ] Enne juurutust käivitatakse skript
- [ ] Juurutus katkestatakse, kui testid ebaõnnestuvad
- [ ] Pärast juurutust tehakse tervisestarditest
- [ ] Konksud käivitatakse õiges järjekorras

### Harjutus 3: Mitmekeskkonna juurutusstrateegia (45 minutit)
**Eesmärk**: Rakenda etapiviisiline juurutustöövoog (arendus → testimine → tootmine)

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

# Samm 2: Juuruta testkeskkonda
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Samm 3: Käsitsi kinnitamine tootmises
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

# Käivita etappide kaupa juurutus
./deploy-staged.sh
```

**Edukuse kriteeriumid:**
- [ ] Arenduskeskkond juurutatakse edukalt
- [ ] Testkeskkond juurutatakse edukalt
- [ ] Tootmisse minekuks on vajalik käsitsi heakskiit
- [ ] Kõikidel keskkondadel toimivad tervisekontrollid
- [ ] Vajadusel võimalik tagasipööramine

### Harjutus 4: Tagasipööramise strateegia (25 minutit)
**Eesmärk**: Rakenda ja testi juurutuse tagasipööramist Git'i abil

```bash
# Paigalda v1
azd env set APP_VERSION "1.0.0"
azd up

# Salvesta v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Paigalda v2 katkise muudatusega
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Tuvasta tõrge ja tagasi pöörata
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Tagasi pööramine git'i abil
    git revert HEAD --no-edit
    
    # Tagasi pööramine keskkonnas
    azd env set APP_VERSION "1.0.0"
    
    # Paigalda uuesti v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Edukuse kriteeriumid:**
- [ ] Juurutuse ebaõnnestumised tuvastatakse
- [ ] Tagasipööramise skript käivitub automaatselt
- [ ] Rakendus taastub töökorda
- [ ] Tagasipööramise järel läbivad tervisekontrollid

## 📊 Juurutuse mõõdikute jälgimine

### Jälgi oma juurutuse jõudlust

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Logi faili
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Kasuta seda
./track-deployment.sh
```

**Analüüsi oma mõõdikuid:**
```bash
# Vaata juurutamise ajalugu
cat deployment-metrics.csv

# Arvuta keskmine juurutamise aeg
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Lisamaterjalid

- [Azure Developer CLI juurutuse viide](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service juurutus](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps juurutus](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions juurutus](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigatsioon**
- **Eelmine õppetund**: [Sinu esimene projekt](../chapter-01-foundation/first-project.md)
- **Järgmine õppetund**: [Ressursside loomine](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame täpsust, palun pidage meeles, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle emakeeles tuleks lugeda autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta tõlgendamisest tekkivate arusaamatuste ega valesti tõlgendamise eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->