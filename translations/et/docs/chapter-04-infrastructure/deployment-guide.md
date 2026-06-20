# Juurutusjuhend – AZD juurutuste valdamine

**Peatükkide navigatsioon:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 4 – Taristu kui kood & Juurutus
- **⬅️ Eelmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)
- **➡️ Järgmine**: [Ressursside loomine](provisioning.md)
- **🧩 Samas peatükis**: [Oma mallide koostamine](custom-templates.md)
- **🚀 Järgmine peatükk**: [Peatükk 5: Multi-agent AI lahendused](../../examples/retail-scenario.md)

## Sissejuhatus

See põhjalik juhend hõlmab kõike, mida on vaja teada Azure Developer CLI abil rakenduste juurutamiseks, alustades lihtsatest ühe käsu juurutustest kuni keerukate tootmistsenaariumideni koos kohandatud konksude, mitme keskkonna ja CI/CD integratsiooniga. Valda täielikult juurutustsüklit praktiliste näidete ja parimate praktikatega.

## Õpieesmärgid

Selle juhendi läbimisega:
- Õpid valdavaks kõiki Azure Developer CLI juurutuskäske ja töövooge
- Saad aru täielikust juurutustsüklist alates ressursside loomisest kuni jälgimiseni
- Rakendad kohandatud juurutuskonksusid eel- ja järeltöötlemise automatiseerimiseks
- Konfigureerid mitut keskkonda vastavalt keskkonnaspetsiifilistele parameetritele
- Seadistad keerukaid juurutusstrateegiaid, näiteks sinine-roheline ja kanarilend
- Integreerid azd juurutused CI/CD torujuhtmetega ja DevOps töövoogudega

## Õpitulemused

Pärast juhendi lõpetamist saad:
- Ise seada üles ja siluda kõiki azd juurutustöövooge
- Kujundada ja rakendada kohandatud juurutusautomaatikat konksude abil
- Konfigureerida tootmiskõlblikke juurutusi nõuetekohase turbe ja jälgimisega
- Hallata keerukaid mitmekeskkondlikke juurutusstsenaariume
- Optimeerida juurutuse jõudlust ja rakendada tagasipöördumisstrateegiaid
- Integreerida azd juurutused ettevõtte DevOps praktikatesse

## Juurutuse ülevaade

Azure Developer CLI pakub mitmeid juurutuskäske:
- `azd up` – Täielik töövoog (ressursside loomine + juurutus)
- `azd provision` – Ainult Azure ressursside loomine / uuendamine
- `azd deploy` – Ainult rakenduskoodi juurutus
- `azd package` – Rakenduste ehitus ja pakkimine

## Põhilised juurutustöövood

### Täielik juurutus (azd up)
Kõige tavalisem töövoog uute projektide puhul:
```bash
# Paigaldage kõik nullist
azd up

# Paigaldage konkreetse keskkonnaga
azd up --environment production

# Paigaldage kohandatud parameetritega
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Ainult taristu juurutus
Kui vaja on ainult Azure ressursse värskendada:
```bash
# Taristu loomine/uuendamine
azd provision

# Taristu loomine kuivkatsega muudatuste eelvaatamiseks
azd provision --preview

# Spetsiifiliste teenuste loomine
azd provision --service database
```

### Ainult koodi juurutus
Kiirete rakenduse värskenduste jaoks:
```bash
# Käivita kõik teenused
azd deploy

# Oodatav väljund:
# Teenuste juurutamine (azd deploy)
# - veeb: Juurutamine... Valmis
# - api: Juurutamine... Valmis
# EDUKAS: Teie juurutus lõpetati 2 minutiga 15 sekundit

# Juuruta konkreetne teenus
azd deploy --service web
azd deploy --service api

# Juuruta kohandatud build-argumentidega
azd deploy --service api --build-arg NODE_ENV=production

# Kontrolli juurutust
azd show --output json | jq '.services'
```

### ✅ Juurutuse kinnitamine

Pärast iga juurutust kontrolli edukust:

```bash
# Kontrolli, kas kõik teenused töötavad
azd show

# Testi tervise lõpp-punkte
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Jälgi vigu (avasub vaikimisi brauseris)
azd monitor --logs
```

**Edu kriteeriumid:**
- ✅ Kõik teenused näitavad olekut "Running"
- ✅ Tervise lõpp-punktid tagastavad HTTP 200
- ✅ Viimase 5 minuti jooksul vigu logides pole
- ✅ Rakendus reageerib testipäringutele

## 🏗️ Juurutuse protsessi mõistmine

### Konksudega alles tutvud? Alusta siit

**Konks** on käsk, mida azd käivitab automaatselt juurutusprotsessi kindlal hetkel – enne või pärast ressursside loomist, ning enne või pärast koodi juurutamist. Need võimaldavad automatiseerida väikesi taas- ja pidevaid ülesandeid, mis juurutust sageli saadavad: andmebaasi ettevalmistamine, migratsioonide käivitamine, ressursside ehitamine või rakenduse põhitesti sooritamine.

| Konks | Käivitus… | Tavaline kasutus |
|-------|-----------|------------------|
| `preprovision` | Enne ressursside loomist | Eelduste kontrollimine, sisselogimine registrisse |
| `postprovision` | Pärast ressursside loomist | Ressursside seadistamine, andmebaasi ettevalmistamine |
| `predeploy` | Enne koodi juurutamist | Frontend ressursside ehitamine, üksustestimine |
| `postdeploy` | Pärast koodi eluleviimist | Andmebaasimigratsioonide käivitamine, lõpp-punkti põhitestimine |

Konksud asuvad sinu `azure.yaml` failis. Siin on väikseim näide – pärast juurutust prinditakse sõnum:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Nii lihtne see ongi – järgmisel korral, kui käivitad `azd up`, trükitakse sõnum automaatselt välja. Konksu saab käivitada ka eraldi, ilma täieliku juurutuseta, mis sobib hästi testimiseks:

```bash
azd hooks run postdeploy
```

Järgmistes etappides on näidatud reaalsed konksud (migratsioonid, testid, valideerimine) iga faasi jaoks.

### Faas 1: Eelresursside konksud
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

### Faas 2: Taristu loomine
- Loeb taristu malle (Bicep/Terraform)
- Loob või uuendab Azure ressursse
- Seadistab võrgustiku ja turbe
- Seadistab jälgimise ja logimise

### Faas 3: Järelresursside konksud
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

### Faas 4: Rakenduse pakkimine
- Ehita rakenduskood
- Loo juurutusartifaktid
- Paki sihtplatvormile (konteinerid, ZIP-failid jms)

### Faas 5: Eeljuhutuskonksud
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
- Juuruta pakitud rakendused Azure teenustesse
- Uuenda konfiguratsioonisätteid
- Käivita / taaskäivita teenused

### Faas 7: Järeljuhutuskonksud
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

### Konksude vigade käsitlemine

Vaikimisi **kui konksukäsk lõpetab mitte-nulliga, peatab azd kogu protsessi.** See on tavaliselt soovitav – nurjunud migratsioon peab peatama juurutuse, mitte saatma katkendliku rakenduse. Siiski tähendab see, et konksusid tuleb kirjutada ettevaatlikult.

**1. Muuda vead valjuks ja tahtlikuks.** Konks ebaõnnestub, kui viimane käsk tagastab mitte-nulliga lõpetuskoodi. Shelli skriptides lisa `set -e`, et konks peatuks esimesel veal, selle asemel et vaikselt jätkata:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Luba konksul ebaõnnestuda ilma azdi peatamata.** Mitte-kriitiliste sammude (nt valikuline vahemälu soojendamine, pingutuslik teavitus) jaoks määra `continueOnError: true`. azd logib vea, kuid jätkab tegevust:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Testi konksusid iseseisvalt enne täielikku jooksutamist.** Sul ei pea käivitama `azd up`, et konksu siluda – käivita see eraldi ja paranda kiiresti:

```bash
azd hooks run predeploy          # käivitab ainult eelpakkumise konksu
azd hooks run postdeploy --service api
```

**4. Ole teadlik OS-spetsiifilistest shellidest.** Konks, mis kasutab `shell: pwsh`, nõuab PowerShelli masina peal (kaasa arvatud CI-agentidel). Kõige universaalsemaks on `shell: sh`, või paku mõlemad variandid `windows` ja `posix`:

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

> **Silumise nõuanne:** käivita ükskõik milline azd käsk koos `--debug`, et näha konksu täpset käsurea käsku ja kogu väljundit – hindamatu, kui konks töötab lokaalselt, aga ebaõnnestub CI keskkonnas.

## 🎛️ Juurutuse konfigureerimine

### Teenuse-spetsiifilised juurutusparameetrid
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

### Sinine-roheline juurutus
```bash
# Loo sinine keskkond
azd env new production-blue
azd up --environment production-blue

# Testi sinist keskkonda
./scripts/test-environment.sh production-blue

# Suuna liiklus sinisele (käsitsi DNS/i koorm tasakaalustaja uuendus)
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

### Perioodilised juurutused
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

## 🐳 Konteinerite juurutamine

### Konteinerirakenduste juurutus
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

### Mitmefaasiline Dockerfile-optimeerimine
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

### Teenuse-spetsiifilised juurutused
```bash
# Paigalda konkreetne teenus kiirema iteratsiooni jaoks
azd deploy --service web
azd deploy --service api

# Paigalda kõik teenused
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

### Tõhus koodi juurutamine
```bash
# Kasutage koodi muudatuste puhul azd deploy (mitte azd up)
# See vahele jätab infrastruktuuri loomise ja on palju kiirem
azd deploy

# Kiireima iteratsiooni jaoks paigaldage konkreetne teenus
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

# Rakenduse tervise kontrollimine
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

## 🚨 Tagasipöördumise strateegiad

### Kiire tagasipöördumine
```bash
# AZD-l puudub sisseehitatud tagasikerimine. Soovitatud lähenemisviisid:

# Variant 1: Taaspaigalda Git-ist (soovitatav)
git revert HEAD  # Võta probleemne commit tagasi
git push
azd deploy

# Variant 2: Taaspaigalda konkreetne commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Taristu tagasipöördumine
```bash
# Eelvaade infrastruktuuri muudatustele enne rakendamist
azd provision --preview

# Infrastruktuuri tagasipööramiseks kasuta versioonikontrolli:
git revert HEAD  # Võta infrastruktuuri muudatused tagasi
azd provision    # Rakenda varasem infrastruktuuri olek
```

### Andmebaasimigratsiooni tagasipöördumine
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

### Jälgi juurutuse jõudlust
```bash
# Vaata praegust juurutuse staatust
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

## 🎯 Parimad tavad

### 1. Keskkonna järjepidevus
```bash
# Kasuta järjepidevat nimetust
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Säilita keskkonna sarnasus
./scripts/sync-environments.sh
```

### 2. Taristu valideerimine
```bash
# Eelvaade infrastruktuuri muudatustele enne juurutamist
azd provision --preview

# Kasuta ARM/Bicep koodi kontrolli
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

### 4. Dokumentatsioon ja logimine
```bash
# Dokumenteerige kasutuselevõtu protseduurid
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Järgmised sammud

- [Ressursside loomine](provisioning.md) – Taristu haldamise süvaalustus
- [Eeltöö juurutamiseks](../chapter-06-pre-deployment/capacity-planning.md) – Juurutusstrateegia planeerimine
- [Levinud probleemid](../chapter-07-troubleshooting/common-issues.md) – Juurutuse probleemide lahendamine
- [Parimad praktikad](../chapter-07-troubleshooting/debugging.md) – Tootmiskõlblike juurutusstrateegiate lähenemine

## 🎯 Praktilised juurutusharjutused

### Harjutus 1: Juurutuse järkjärgulise töövoo praktiseerimine (20 minutit)
**Eesmärk**: Mõista täis- ja järkjärguliste juurutuste erinevust

```bash
# Algne juurutamine
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Salvestage algne juurutamise aeg
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

**Edu kriteeriumid:**
- [ ] Täielik juurutus võtab 5–15 minutit
- [ ] Ainult koodi juurutus võtab 2–5 minutit
- [ ] Koodimuudatused kajastuvad juurutatud rakenduses
- [ ] Pärast `azd deploy` pole taristu muutunud

**Õpitulemus**: `azd deploy` on koodimuuduste puhul 50–70% kiirem kui `azd up`

### Harjutus 2: Kohandatud juurutuskonksude loomine (30 minutit)
**Eesmärk**: Rakendada eel- ja järeljuurutuse automatiseerimist

```bash
# Loo eelpande valideerimisskript
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

# Loo järelandmise suitsutest
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

# Testi juurutamist konksudega
azd deploy
```

**Edu kriteeriumid:**
- [ ] Eeljuhutusskript käivitub enne juurutust
- [ ] Kui testid ebaõnnestuvad, katkestatakse juurutus
- [ ] Järeljuhutus teeb tervisekontrolli
- [ ] Konksud täidetakse õiges järjekorras

### Harjutus 3: Mitme keskkonna juurutusstrateegia (45 minutit)
**Eesmärk**: Rakendada faasiline juurutustöövoog (dev → staging → tootmine)

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

# Samm 2: Juuruta ettekandekeskkonda
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Samm 3: Käsitsi kinnitamine tootmiskeskkonnale
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

**Edu kriteeriumid:**
- [ ] Dev keskkond juurutub edukalt
- [ ] Staging keskkond juurutub edukalt
- [ ] Tootmises on manuaalne kinnitamine kohustuslik
- [ ] Kõik keskkonnad omavad töötavaid tervisekontrolle
- [ ] Vajadusel võimalik tagasipöördumine

### Harjutus 4: Tagasipöördumise strateegia (25 minutit)
**Eesmärk**: Rakendada ja testida juurutuse tagasipöördumist Git abil

```bash
# Paigalda v1
azd env set APP_VERSION "1.0.0"
azd up

# Salvesta v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Paigalda v2 koos katkestava muudatusega
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Tuvasta tõrge ja ennista varasem seis
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Ennista varasem seis git'i abil
    git revert HEAD --no-edit
    
    # Ennista varasem keskkond
    azd env set APP_VERSION "1.0.0"
    
    # Paigalda uuesti v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Edu kriteeriumid:**
- [ ] Suudad tuvastada juurutuse vead
- [ ] Tagasipöördusskript käivitub automaatselt
- [ ] Rakendus naaseb töökorda
- [ ] Tervisekontrollid läbivad pärast tagasipöördumist

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
# Kuvada juurutamise ajalugu
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
- **Eelmine õppetund**: [Sinu esimene projekt](../chapter-01-foundation/first-project.md)
- **Järgmine õppetund**: [Ressursside loomine](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->