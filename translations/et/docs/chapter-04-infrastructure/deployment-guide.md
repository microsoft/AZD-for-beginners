# Paigaldusjuhend - AZD paigalduse valdamine

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 4 - Infrastruktuur kui kood & paigaldus
- **⬅️ Eelmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)
- **➡️ Järgmine**: [Resursside loomine](provisioning.md)
- **🧩 Samuti selles peatükis**: [Oma mallide koostamine](custom-templates.md)
- **🚀 Järgmine peatükk**: [Peatükk 5: Mitmeagendi AI lahendused](../../examples/retail-scenario.md)

## Sissejuhatus

> Läbivaadatud vastavalt `azd 1.37.2` (november 2026). Käsklused kasutavad Bash'i; JSONi näited nõuavad `jq`. Välja arvatud selgelt algatatud ülesanne todo harjutuses, on keerulised näited **integreerimisfragmendid**: paku oma allikat, infrastruktuuri, teste ja skripte. Selles ülevaates ei käivitatud Azure paigaldusi.

See põhjalik juhend katab kõik, mida peate teadma rakenduste paigaldamiseks Azure Developer CLI abil – alates põhilistest ühe käsu paigaldamatutest kuni keerukate tootmistsenaariumiteni koos kohandatud konksude, multiple keskkondade ja CI/CD integreerimisega. Oma paigalduse kogu elutsükli meisterlikult praktiliste näidete ja parimate tavadega.

## Õpieesmärgid

Selle juhendi läbimisega:
- Saate valdamise kõik Azure Developer CLI paigaldus käsud ja töövood
- Mõistate paigalduse kogu elutsüklit alates ressursi loomise kuni jälgimiseni
- Rakendate kohandatud paigalduse konksusid enne ja pärast paigaldust automatiseerimiseks
- Konfigureerite mitut keskkonda keskkonnaspetsiifiliste parameetritega
- Seadistate keerukad paigalduse strateegiad nagu sinine-roheline ja kanarii paigaldused
- Integreerite azd paigaldused CI/CD torustike ja DevOps töövoogudega

## Õpitulemused

Juhendi lõppedes suudate:
- Käivitada ja tõrkeotsida kõiki azd paigaldus töövoogusid iseseisvalt
- Kujundada ja rakendada kohandatud paigaldusautomaatikat konksude abil
- Konfigureerida tootmiseks valmis paigalduseid sobiva turvalisuse ja jälgimisega
- Hallata keerukaid mitmekeskkonna paigaldusstseenaariume
- Optimeerida paigalduse jõudlust ja rakendada tagasipööramise strateegiaid
- Integreerida azd paigaldused ettevõtte DevOps praktikatesse

## Paigalduse ülevaade

Azure Developer CLI pakub mitmeid paigalduskäske:
- `azd up` - Täielik töövoog (ressursside loomine + paigaldus)
- `azd provision` - Loo/uuedienda ainult Azure ressursid
- `azd deploy` - Paigalda ainult rakenduse kood
- `azd package` - Ehita ja paki rakendused

## Põhilised paigaldus töövood

### Täielik paigaldus (azd up)
Kõige sagedasem töövoog uutele projektidele:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Ainult infrastruktuuri paigaldus
Kui vaja vaid Azure ressursse uuendada:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Ainult koodi paigaldus
Kiirete rakenduse uuenduste jaoks:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Paigalduse kontrollimine

Pärast igat paigaldust kontrolli edukust:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Edukuse kriteeriumid:**
- ✅ `azd show` lahendab oodatud teenuste sihtmärgid/URLid
- ✅ Päringud tegelikele rakenduse marsruutidele tagastavad oodatud staatuse ja keha
- ✅ Viimase 5 minuti jooksul ei ole vealogi kirjeid
- ✅ Rakendus vastab testipäringutele

## 🏗️ Paigalduse protsessi mõistmine

### Kas pole konksude kasutamisega kursis? Alusta siit

**Konks** on käsk, mida azd käivitab automaatselt kindlal hetkel paigaldusprotsessis – enne või pärast ressursi loomist ning enne või pärast koodi paigaldust. Need võimaldavad automatiseerida väiksemaid ülesandeid, mis alati paigaldusega kaasnevad: andmebaasi initsiatsioon, migratsioonide käivitamine, ressursside ehitamine või elava rakenduse suitsutestimine.

| Konks | Käivitub… | Tavapärane kasutus |
|------|-------|------------|
| `preprovision` | Enne ressursside loomist | Eeltingimuste valideerimine, logimine registrisse |
| `postprovision` | Pärast ressursside olemasolu | Ressursside konfigureerimine, andmebaasi seadistamine |
| `predeploy` | Enne koodi paigaldust | Esiotsa ressursid ehitamine, üksustestide käivitamine |
| `postdeploy` | Pärast koodi live-staatust | DB migratsioonide käivitamine, suitsutestimine |

Konksud asuvad sinu `azure.yaml`. Siin on väikseim võimalik näide – see prindib sõnumi pärast paigaldust:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

See ongi kõik – järgmine kord, kui käivitad `azd up`, kuvatakse sõnum automaatselt. Konksu saab ka käsitsi käivitada ilma täieliku paigalduseta, mis on kasulik testimiseks:

```bash
azd hooks run postdeploy
```

Alljärgnevad etapid näitavad reaalseid konksusid (migratsioonid, testid, valideerimine) igas staadiumis.

### Etapp 1: Enne ressursi loomist konksud
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
- Loob või uuendab Azure ressursse
- Konfigureerib võrgustiku ja turvalisuse
- Seadistab jälgimise ja logimise

### Etapp 3: Pärast ressursi loomist konksud
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

### Etapp 4: Rakenduse pakendamine
- Ehita rakenduse koodi
- Loo paigaldusartefaktid
- Paki sihtplatvormile (konteinerid, ZIP-failid jne)

### Etapp 5: Enne paigaldust konksud
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

### Etapp 6: Rakenduse paigaldus
- Paigaldab pakendatud rakendused Azure teenustesse
- Uuendab konfiguratsiooni seadeid
- Käivitab/taaskäivitab teenuseid

### Etapp 7: Pärast paigaldust konksud
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### Konksu vigade käsitlemine

Vaikimisi **kui konksukäsk väljub mitte-null koodiga, peatab azd kogu operatsiooni.** See on tavaliselt soovitud – ebaõnnestunud migratsioon peaks peatama paigalduse, mitte tarnima katki rakenduse. Kuid see tähendab, et konksud tuleb kirjutada hoolikalt.

**1. Tee vead valjuks ja teadlikuks.** Konks ebaõnnestub, kui viimase käsu väljumiskood on nullist erinev. Shell-skriptides lisa `set -e`, nii et konks peatub esimese ebaõnnestumise korral, mitte ei jätka vaikselt:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Luba konksul nurjuda ilma azd peatamata.** Mittekriitiliste sammude (valikuline vahemälu soojendus, parima pingutuse teatis) korral seadista `continueOnError: true`. azd logib vea, aga jätkab:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Testi konksusid isoleeritult enne täielikku käivitust.** Sa ei pea kasutama `azd up`, et konksu siluda – käivita see eraldi ja paranda kiiresti:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Ole tähelepanelik operatsioonisüsteemi spetsiifiliste shellidega.** Konks, mis kasutab `shell: pwsh`, vajab masinasse paigaldatud PowerShelli (kaasa arvatud CI agendid). Kasuta `shell: sh` kõige laiema ühilduvuse jaoks või paku mõlemat varianti `windows` ja `posix`:

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

> **Silumise nõuanne:** käivita mis tahes azd käsk koos `--debug`, et näha täpset konksukäsku ja selle täielikku väljundit – hindamatu abivahend, kui konks töötab lokaalselt aga ebaõnnestub CI keskkonnas.

## 🎛️ Paigalduse konfiguratsioon

### Teenusespetsiifilised paigaldusseaded
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Keskkonnaspetsiifilised konfiguratsioonid

Need on ainult lokaalsed azd väärtused. Kaardista need selgelt infrastruktuuri/ runtime konfiguratsiooni. `NODE_ENV` on tavaliselt `production` juurutatud Node rakenduse puhul, kaasa arvatud staging paigaldamine; eristu paigaldusfaaside jaoks tee eraldi rakenduspõhine muutuja.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Keerukamad paigaldusstseenarid

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

### Sinine-roheline paigaldus

**Näidisskeem:** peate pakkuma mõlemad keskkonnad, ühise liikluse suunamise kihi ja kaks alljärgnevat skripti. azd ei vaheta liiklust ega valideeri automaatselt tagasipööramise valmidust. Hoia rohelist seni, kuni sinine on testi edukalt läbinud ja tagasipööramine pole enam vajalik.

```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### Kanarii paigaldus
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Liikluse jagamine kuulub Container Appi konfiguratsiooni (Bicep või Azure CLI), mitte `azure.yaml` `trafficSplit` omaduseks. Eelvaate/ressursside loomine ja hilisemad paigaldused peavad säilitama valitud revisjonirežiimi ja marsruutimise reeglid.

### Etappide kaupa paigaldamine
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Konteinerite paigaldus

### Container App paigaldused
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Seadista runtime saladused koos `configuration.secrets`/`secretRef` (või Key Vault viidetega) ja skaleerimine `template.scale` Container App infrastruktuuris. Ära tee teenuse taseme `secrets` või `scale` omadusi `azure.yaml` sees.

### Mitmeetapiline Dockerfile optimeerimine
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Jõudluse optimeerimine

### Teenusespetsiifilised paigaldused
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Ehituse vahemällu salvestamine
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Standardne Node töövoog kasutab paketiskripte; teenuse `prepackage` konksud saavad lisada vajalikke samme. Docker kihilise vahemälu kasutamine on eraldi teenuse ehituskäsu defineerimisest.

### Tõhusad koodi paigaldused
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Paigaldamise jälgimine

### Reaalaegne paigalduse jälgimine
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Tervisekontrollid
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

Rakendus peab rakendama `/health`; seda ei paku automaatselt azd. Üldist `azure.yaml` `healthCheck` teenuse omadust ei eksisteeri.

### Pärast paigaldust valideerimine
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
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

### Saladuste haldamine
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` on kehtetu. Tavalised keskkonnamuutujad on lokaalsed selges tekstis; ära eelda, et lugemiskäsklused need peidavad. Ülalmainitud käsud salvestavad Key Vault viited, kuid teie infrastruktuur/rakendus peab edasi kasutama saladusi ja andma järgujälje identiteedile ligipääsu.

### Võrgu turvalisus
Deklareeri ja tarvita võrguparameetreid Bicepis, ning kaardista need `infra/main.parameters.json`. Mitte mingit üldist `infra.parameters` liidest `azure.yaml` sees ei ole olemas. Näidisdokumentatsioonis on ulatused `203.0.113.0/24` ja `198.51.100.0/24`, mis ei ole tõelised kontori/VPN võrgud; asenda need volitatud võrgupiirkondadega.

### Identiteedi ja ligipääsu haldus
Luba Container App jaoks `identity` Bicepis ja määra vajalik Key Vault andmeplaani roll salve ulatuses. Konfigureeri nimetatud Key Vault-põhised saladused ja runtime viited selles ressursis; `identity` ja `keyVault` ei ole üldised azd teenuste omadused. Vaata [Autentimine & hallatud identiteet](../chapter-03-configuration/authsecurity.md).

## 🚨 Tagasipööramise strateegiad

### Kiire tagasipööramine
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Infrastruktuuri tagasipööramine
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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

## 📊 Paigalduse mõõdikud

### Jälgi paigalduse jõudlust
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Infrastruktuuri valideerimine
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Testide integreerimine
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Järgmised sammud

- [Resursside loomine](provisioning.md) - Süvitsi infrastruktuuri haldamisse
- [Paigalduse eelplaneerimine](../chapter-06-pre-deployment/capacity-planning.md) - Plaani oma paigalduse strateegiat
- [Tavalised probleemid](../chapter-07-troubleshooting/common-issues.md) - Lahenda paigaldusprobleeme
- [Parimad tavad](../chapter-07-troubleshooting/debugging.md) - Tootmiseks valmis paigalduse strateegiad

## 🎯 Käed-külge paigaldusharjutused

### Harjutus 1: Astmeline paigaldus töövoog (20 minutit)
**Eesmärk**: Valda erinevust täieliku ja astmelise paigalduse vahel

**Alguspunkt:** Bash, Node.js 22, Git, azd sisselogimine ja Azure tellimus koos paigalduse õigustega. Käivita uues kataloogis; oota tasustatavaid App Service/Cosmos DB ressursse. Ajad sõltuvad regioonist ja mallist.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Edukuse kriteeriumid:**
- [ ] Mõõda mõlema käsu kestus (kestust ei garanteerita)
- [ ] Mõlemad käsud lõpetavad edukalt
- [ ] API jääb funktsionaalseks; kommentaarimuudatus ei ole nähtav liideses
- [ ] Infrastruktuur jääb muutumatuks pärast `azd deploy`

**Õpitulemus**: `azd deploy` jätab infrastruktuuri loomise vahele. Võrdle mõõdetud aegu, mitte ära eelda kindlat protsentuaalset kiirendust.

### Harjutus 2: Kohandatud paigalduse konksud (30 minutit)
**Eesmärk**: Rakenda enne ja pärast paigaldust automatiseerimine

**Alguspunkt:** eelnevalt algatatud `deployment-practice` projekt. Kui puhastasid selle, käivita uuesti `azd up` enne koodi-ainult paigalduse testimist. Allpool kasutatav valideerimine kasutab API tegelikku ehitusskripti, mitte mittekasutusel olevat põhiskaan skripti `test:unit`. Malli API testid vajavad konfigureeritud andmebaasi ligipääsu; need ei ole eraldisolatsiooni üksustestid.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Edukuse kriteeriumid:**
- [ ] Enne paigaldust skript käivitatakse
- [ ] Paigaldus katkestatakse, kui ehituse valideerimine ebaõnnestub
- [ ] Pärast paigaldust suitsutest kontrollib tervist
- [ ] Konksud käivituvad õiges järjekorras

### Harjutus 3: Mitmekeskkonna paigalduse strateegia (45 minutit)
**Eesmärk**: Rakenda faaside kaupa paigalduse töövoog (dev → staging → production)

**Alguspunkt:** sama initsialiseeritud todo projekt koos `jq`-ga. Loo alljärgnevad keskkonnad päris tellimuse/asukoha väärtustega (või seadista igaühes `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION`) **enne** viipeta töövoo käivitamist. See ebaõnnestub sihilikult, selle asemel et leiutada puuduvaid väärtusi. Kasuta ainult ajutisi treeningkeskkondi, mitte päris tootmistellimust.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Edu kriteeriumid:**
- [ ] Arenduskeskkond läbib edukalt juurutuse
- [ ] Eelvaatluskeskkond läbib edukalt juurutuse
- [ ] Tootmises on nõutav käsitsi heakskiit
- [ ] Kõik keskkonnad omavad toimivaid tervisekontrolle
- [ ] Vajadusel saab teha tagasikerimise

### Harjutus 4: Tagasikerimise strateegia (25 minutit)
**Eesmärk**: Rakendada ja testida juurutuse tagasikerimist kasutades Giti

**Alguspunkt:** isoleeritud treeningkassett todo mallist, kus kõik algallikad on pühendatud, puhas Git tööpuu ja ajutiselt konfigureeritud keskkond. Tootmisprojekti puhul ära kunagi tekitada tahtlikke rikkeid. Alljärgnev `APP_VERSION` on vaid raamatupidamine, välja arvatud juhul, kui ühendad selle spetsiaalselt rakendusse.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Edu kriteeriumid:**
- [ ] Suudab tuvastada juurutusrikkeid
- [ ] Tagasikerimise skript käivitub automaatselt
- [ ] Rakendus naaseb tööseisundisse
- [ ] Tervisekontrollid läbivad pärast tagasikerimist

## 📊 Juurutuse mõõdikute jälgimine

### Jälgi oma juurutussooritust

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Analüüsi oma mõõdikuid:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Lisamaterjalid

- [Azure Developer CLI juurutuse viide](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service juurutus](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps juurutus](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions juurutus](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigeerimine**
- **Eelmine õppetund**: [Sinu esimene projekt](../chapter-01-foundation/first-project.md)
- **Järgmine õppetund**: [Resursside loomine](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->