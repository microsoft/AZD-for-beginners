# Deployimise juhend - AZD juurutuste valdamine

**Peatüli navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 4 - Infrastruktuur kui kood ja juurutamine
- **⬅️ Eelmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)
- **➡️ Järgmine**: [Resursside provisioneerimine](provisioning.md)
- **🚀 Järgmine peatükk**: [Peatükk 5: Mitmeagendi AI-lahendused](../../examples/retail-scenario.md)

## Sissejuhatus

See## Juurutamisprotsessi mõistminepõhjalik juhend käsitleb kõike, mida peate teadma rakenduste juurutamisest Azure Developer CLI abil, alates lihtsatest ühe käsuga juurutamistest kuni keerukate tootmistsükliteni, mis sisaldavad kohandatud hooke, mitut keskkonda ja CI/CD integratsiooni. Valdage kogu juurutustsükkel praktiliste näidete ja parimate tavade abil.

## Õpieesmärgid

Selle juhendi läbimisel:
- Valdage kõiki Azure Developer CLI juurutuskäske ja töövooge
- Mõistke kogu juurutustsüklit alates provisioneerimisest kuni monitoorimiseni
- Rakendage kohandatud juurutushooke eel- ja järgjuurutuse automatiseerimiseks
- Seadistage mitu keskkonda keskkonnaspetsiifiliste parameetritega
- Seadistage täiustatud juurutusstrateegiad, sh sinine-roheline ja canary-juurutused
- Integreerige azd juurutused CI/CD torujuhtmete ja DevOps-töövoogudega

## Õpitulemused

Pärast lõpetamist suudate:
- Käivitada ja tõrkeotsida kõiki azd juurutustöövooge iseseisvalt
- Disainida ja rakendada kohandatud juurutuse automatiseerimist, kasutades hooke
- Seadistada tootmiskõlblikud juurutused sobiva turvalisuse ja monitooringuga
- Haldada keerukaid mitme keskkonna juurutusstsenaariume
- Optimeerida juurutuste jõudlust ja rakendada tagasipööramise strateegiaid
- Integreerida azd juurutused ettevõtte DevOps-tavadesse

## Juurutuse ülevaade

Azure Developer CLI pakub mitmeid juurutuskäske:
- `azd up` - Täielik töövoog (provisioneerimine + juurutamine)
- `azd provision` - Loo/uuenda ainult Azure'i ressursse
- `azd deploy` - Juuruta ainult rakenduse koodi
- `azd package` - Ehita ja paki rakendusi

## Põhilised juurutustöövood

### Täielik juurutus (azd up)
Uute projektide kõige levinum töövoog:
```bash
# Juuruta kõik algusest peale
azd up

# Juuruta konkreetse keskkonna jaoks
azd up --environment production

# Juuruta kohandatud parameetritega
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Ainult infrastruktuuri juurutamine
Kui peate ainult Azure'i ressursse värskendama:
```bash
# Infrastruktuuri provisioneerimine ja värskendamine
azd provision

# Provisioneerimine simulatsioonirežiimis, et eelvaadata muudatusi
azd provision --preview

# Konkreetsete teenuste provisioneerimine
azd provision --service database
```

### Ainult koodi juurutamine
Kiirete rakenduse värskenduste jaoks:
```bash
# Paigalda kõik teenused
azd deploy

# Oodatav väljund:
# Teenuste juurutamine (azd deploy)
# - web: Juurutamine... Valmis
# - api: Juurutamine... Valmis
# EDUKAS: Teie juurutus lõppes 2 minuti ja 15 sekundiga

# Juuruta konkreetne teenus
azd deploy --service web
azd deploy --service api

# Juuruta kohandatud build-argumentidega
azd deploy --service api --build-arg NODE_ENV=production

# Kontrolli juurutust
azd show --output json | jq '.services'
```

### ✅ Juurutuse kontrollimine

Pärast iga juurutust kontrollige, et see õnnestus:

```bash
# Kontrolli, et kõik teenused töötavad
azd show

# Testi tervisekontrolli lõpp-punkte
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Jälgi vigu (avatakse vaikimisi brauseris)
azd monitor --logs
```

**Edu kriteeriumid:**
- ✅ Kõik teenused näitavad olekut „Töötab”
- ✅ Tervise lõpp-punktid tagastavad HTTP 200
- ✅ Viimase 5 minuti jooksul pole vealogi kirjeid
- ✅ Rakendus vastab testpäringutele

## 🏗️ Juurutamisprotsessi mõistmine

### Faas 1: Eelprovisioneerimise hookid
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

### Faas 2: Infrastruktuuri provisioneerimine
- Loeb infrastruktuuri malle (Bicep/Terraform)
- Loodab või uuendab Azure'i ressursse
- Konfigureerib võrgustikku ja turvalisust
- Seadistab monitooringu ja logimise

### Faas 3: Post-provisioneerimise hookid
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
- Kompileerib rakenduse koodi
- Loodab juurutusartefakte
- Pakitseb sihtplatvormi jaoks (konteinerid, ZIP-failid jne.)

### Faas 5: Eeljuurutuse hookid
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
- Juurutab pakitud rakendused Azure teenustesse
- Uuendab konfiguratsiooni seadeid
- Käivitab/taaskäivitab teenuseid

### Faas 7: Post-juurutuse hookid
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

### Teenusespetsiifilised juurutuse seaded
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

# Staging-keskkond
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

### Mitme teenusega rakendused
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

### Sinine-roheline juurutamine
```bash
# Loo sinine keskkond
azd env new production-blue
azd up --environment production-blue

# Testi sinist keskkonda
./scripts/test-environment.sh production-blue

# Suuna liiklus sinisele (DNS-i/koormuse tasakaalustaja käsitsi uuendamine)
./scripts/switch-traffic.sh production-blue

# Puhasta roheline keskkond
azd env select production-green
azd down --force
```

### Canary-juurutused
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

## 🐳 Konteineri juurutused

### Konteinerirakenduste juurutamine
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

### Mitmeastmeline Dockerfile'i optimeerimine
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

### Teenusepõhised juurutused
```bash
# Juuruta konkreetne teenus kiiremaks iteratsiooniks
azd deploy --service web
azd deploy --service api

# Juuruta kõik teenused
azd deploy
```

### Ehitusvahemälu
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
# Koodimuudatuste puhul kasutage azd deploy (mitte azd up)
# See jätab infrastruktuuri provisioneerimise vahele ja on palju kiirem
azd deploy

# Juurutage konkreetne teenus kiireima iteratsiooni jaoks
azd deploy --service api
```

## 🔍 Juurutuse jälgimine

### Reaalajas juurutuse jälgimine
```bash
# Jälgi rakendust reaalajas
azd monitor --live

# Vaata rakenduse logisid
azd monitor --logs

# Kontrolli juurutuse olekut
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

## 🔐 Turvaküsimused

### Salajaste andmete haldamine
```bash
# Salvesta saladused turvaliselt
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Viita saladustele azure.yaml-failis
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

### Identiteedi ja juurdepääsu haldus
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
# AZD-l puudub sisseehitatud tagasipööramine. Soovitatavad lähenemised:

# Valik 1: Juuruta uuesti Gitist (soovitatav)
git revert HEAD  # Võta probleemne commit tagasi
git push
azd deploy

# Valik 2: Juuruta uuesti konkreetne commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastruktuuri tagasipööramine
```bash
# Eelvaata infrastruktuuri muudatusi enne rakendamist
azd provision --preview

# Infrastruktuuri tagasipööramiseks kasuta versioonikontrolli:
git revert HEAD  # Tühista infrastruktuuri muudatused
azd provision    # Rakenda infrastruktuuri varasem olek
```

### Andmebaasi migratsiooni tagasipööramine
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Juurutuse mõõdikud

### Jälgige juurutuste jõudlust
```bash
# Vaata praegust juurutamise olekut
azd show

# Jälgi rakendust Application Insightsi abil
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

## 🎯 Parimad tavad

### 1. Keskkondade järjepidevus
```bash
# Kasutage järjepidevat nimetamisstiili
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Hoidke keskkondade vastavus
./scripts/sync-environments.sh
```

### 2. Infrastruktuuri valideerimine
```bash
# Eelvaata infrastruktuuri muudatusi enne juurutamist
azd provision --preview

# Kasuta ARM/Bicep lintimist
az bicep lint --file infra/main.bicep

# Kontrolli Bicepi süntaksit
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
# Dokumenteerige juurutamise protseduurid
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Järgmised sammud

- [Resursside provisioneerimine](provisioning.md) - Sügav sukeldumine infrastruktuuri haldamisse
- [Ettejuurutuse planeerimine](../chapter-06-pre-deployment/capacity-planning.md) - Planeerige oma juurutusstrateegia
- [Levinud probleemid](../chapter-07-troubleshooting/common-issues.md) - Lahendage juurutuse probleeme
- [Parimad tavad](../chapter-07-troubleshooting/debugging.md) - Tootmiskõlblikud juurutusstrateegiad

## 🎯 Käed-külge juurutuse harjutused

### Harjutus 1: Inkrementaalne juurutustöövoog (20 minutit)
**Eesmärk**: Valdada erinevust täis- ja inkrementaalsete juurutuste vahel

```bash
# Esialgne juurutus
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Salvesta esialgne juurutusaeg
echo "Full deployment: $(date)" > deployment-log.txt

# Tee koodimuudatus
echo "// Updated $(date)" >> src/api/src/server.js

# Juuruta ainult koodi (kiirelt)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Võrdle aegu
cat deployment-log.txt

# Puhasta
azd down --force --purge
```

**Edu kriteeriumid:**
- [ ] Täielik juurutus võtab 5–15 minutit
- [ ] Ainult koodi juurutus võtab 2–5 minutit
- [ ] Koodimuudatused kajastuvad juurutatud rakenduses
- [ ] Infrastruktuur ei muutu pärast `azd deploy`

**Õpitulemus**: `azd deploy` on koodimuudatuste puhul 50–70% kiirem kui `azd up`

### Harjutus 2: Kohandatud juurutushookid (30 minutit)
**Eesmärk**: Rakendada eel- ja järgjuurutuse automatiseerimist

```bash
# Loo enne juurutamist käivitatav valideerimisskript
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Kontrolli, kas testid õnnestusid
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Kontrolli, kas on kinnitamata muudatusi
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Loo pärast juurutamist toimiv smoke-test
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

# Lisa hookid faili azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Testi juurutust hookidega
azd deploy
```

**Edu kriteeriumid:**
- [ ] Eeljuurutuse skript käivitub enne juurutust
- [ ] Juurutamine katkestatakse, kui testid ebaõnnestuvad
- [ ] Pärast juurutust tehtav smoke-test kontrollib teenuse tervist
- [ ] Hookid käivituvad õiges järjekorras

### Harjutus 3: Mitme keskkonna juurutusstrateegia (45 minutit)
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

# Samm 2: Juuruta testkeskkonda
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Samm 3: Manuaalne heakskiit tootmiskeskkonda
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

# Käivita etappeline juurutus
./deploy-staged.sh
```

**Edu kriteeriumid:**
- [ ] Dev-keskkond juurutatakse edukalt
- [ ] Staging-keskkond juurutatakse edukalt
- [ ] Tootmisse vajab käsitsi kinnitust
- [ ] Kõigis keskkondades töötavad tervisekontrollid
- [ ] Võimalus vajadusel tagasi pöörata

### Harjutus 4: Tagasipööramise strateegia (25 minutit)
**Eesmärk**: Rakendada ja testida juurutuse tagasipööramist kasutades Giti

```bash
# Juuruta v1
azd env set APP_VERSION "1.0.0"
azd up

# Salvesta v1 commit-hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Juuruta v2 tagurpidiühilduvust rikkuva muudatusega
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Tuvasta tõrge ja pöördu tagasi
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Tagasipööramine gitiga
    git revert HEAD --no-edit
    
    # Keskkonna tagasipööramine
    azd env set APP_VERSION "1.0.0"
    
    # Juuruta v1 uuesti
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Edu kriteeriumid:**
- [ ] Suudab tuvastada juurutuse rikkeid
- [ ] Tagasipööramisskript käivitub automaatselt
- [ ] Rakendus naaseb töökorda
- [ ] Tervisekontrollid on pärast tagasipöördumist läbitud

## 📊 Juurutuse mõõdikute jälgimine

### Jälgige oma juurutuste jõudlust

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

# Kirjuta logifaili
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Kasuta seda
./track-deployment.sh
```

**Analüüsige oma mõõdikuid:**
```bash
# Kuva juurutamise ajalugu
cat deployment-metrics.csv

# Arvuta keskmine juurutusaeg
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Täiendavad ressursid

- [Azure Developer CLI juurutuse viide](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service juurutamine](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps juurutamine](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions juurutamine](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigeerimine**
- **Eelmine õppetund**: [Teie esimene projekt](../chapter-01-foundation/first-project.md)
- **Järgmine õppetund**: [Resursside provisioneerimine](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastutusest loobumine:
See dokument on tõlgitud tehisintellekti tõlke-teenuse Co-op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palun pidage meeles, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Algset dokumenti selle emakeeles tuleks pidada autoriteetseks allikaks. Kriitilise tähtsusega teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->