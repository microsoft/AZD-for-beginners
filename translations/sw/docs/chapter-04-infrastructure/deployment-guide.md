# Mwongozo wa Utekelezaji - Kumiliki Utekelezaji wa AZD

**Uchaguzi wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 4 - Miundombinu kama Msimbo & Utekelezaji
- **⬅️ Sura ya Awali**: [Sura ya 3: Usanidi](../chapter-03-configuration/configuration.md)
- **➡️ Inayofuata**: [Utayarishaji wa Rasilimali](provisioning.md)
- **🧩 Pia katika sura hii**: [Kuandika Kiolezo Chako Binafsi](custom-templates.md)
- **🚀 Sura Inayofuata**: [Sura ya 5: Suluhisho za AI zenye Wakala Wengi](../../examples/retail-scenario.md)

## Utangulizi

> Imeangaliwa dhidi ya `azd 1.37.2` (Novemba 2026). Amri hutumia Bash; mifano ya JSON inahitaji `jq`. Isipokuwa mazoezi ya todo yaliyowekwa wazi, mifano ya hali ya juu ni **vidonge vya muunganisho**: toa chanzo chako, miundombinu, majaribio, na hati za maandishi. Hakuna utekelezaji wa Azure uliofanyika katika uhakiki huu.

Mwongozo huu kamili unashughulikia kila kitu unachohitaji kujua kuhusu kupeleka programu kwa kutumia Azure Developer CLI, kutoka utekelezaji wa amri moja hadi hali za uzalishaji zenye mzunguko wa juu na hooks maalum, mazingira mengi, na muunganisho wa CI/CD. Jifunze mzunguko kamili wa utekelezaji kwa mifano halisi na mbinu bora.

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utakuwa na uwezo wa:
- Kumiliki amri zote na muendelezo wa kazi wa utekelezaji wa Azure Developer CLI
- Kuelewa mzunguko kamili wa utekelezaji kutoka utayarishaji hadi ufuatiliaji
- Kutekeleza hooks za tofauti za utekelezaji kwa ajili ya kiotomatiki kabla na baada ya utekelezaji
- Kusanidi mazingira mengi na vigezo maalum vya mazingira
- Kuweka mikakati ya juu ya utekelezaji ikijumuisha blue-green na canary
- Kuunganisha utekelezaji wa azd na mistari ya CI/CD na miongozo ya DevOps

## Matarajio ya Kujifunza

Baada ya kumaliza, utaweza:
- Kuweka na kutatua matatizo katika mitiririko yote ya kazi ya utekelezaji wa azd kwa uhuru
- Kubuni na kutekeleza otomatiki za utekelezaji kwa kutumia hooks
- Kusanidi utekelezaji wa uzalishaji uliotayarishwa vyema na usalama na ufuatiliaji wa kutosha
- Kusimamia hali ngumu za utekelezaji kwa mazingira mengi
- Kuboresha utendaji wa utekelezaji na kutekeleza mikakati ya kurudisha nyuma
- Kuunganisha utekelezaji wa azd katika mazoea ya mambo makubwa ya DevOps

## Muhtasari wa Utekelezaji

Azure Developer CLI hutoa amri kadhaa za utekelezaji:
- `azd up` - Muendelezo kamili (kutayarisha + kupeleka)
- `azd provision` - Tengeneza/tengeneza upya rasilimali za Azure pekee
- `azd deploy` - Peleka msimbo wa program pekee
- `azd package` - Jenga na pakia programu

## Mitiririko Msingi ya Utekelezaji

### Utekelezaji Kamili (azd up)
Muendelezo wa kawaida zaidi kwa miradi mipya:
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

### Utekelezaji wa Miundombinu Pekee
Unapotaka tu kusasisha rasilimali za Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Utekelezaji wa Msimbo Pekee
Kwa sasisho za programu haraka:
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

### ✅ Uhakiki wa Utekelezaji

Baada ya utekelezaji wowote, hakikisha mafanikio:

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

**Vigezo vya Mafanikio:**
- ✅ `azd show` hutatua malengo/URLs zinazotarajiwa za huduma
- ✅ Maombi kwenye njia halisi za programu hurudisha hali na mwili unaotarajiwa
- ✅ Hakuna makosa katika logi kwa dakika 5 zilizopita
- ✅ Programu hujibu maombi ya majaribio

## 🏗️ Kuelewa Mchakato wa Utekelezaji

### Mpya kwa hooks? Anza hapa

**Hook** ni amri ambayo azd huendesha moja kwa moja wakati maalum katika mchakato wa utekelezaji—kabla au baada ya utayarishaji, na kabla au baada ya kupeleka msimbo wako. Hukuwezesha kiotomatiki kazi ndogo ndogo zinazotuzunguka utekelezaji: kupanda databaini, kuendesha mabadiliko, kujenga mali, au kupima harufu ya app hai.

| Hook | Huendesha… | Matumizi ya Kawaida |
|------|-------|------------|
| `preprovision` | Kabla ya rasilimali kuundwa | Thibitisha mahitaji, ingia kwenye rejista |
| `postprovision` | Baada ya rasilimali kuwepo | Sanidi rasilimali, weka upya databasi |
| `predeploy` | Kabla ya msimbo kupelekwa | Jenga mali za mbele za mbele, endesha majaribio ya vitengo |
| `postdeploy` | Baada ya msimbo kuwepo | Endesha mabadiliko ya DB, jaribu endpoints kwa harufu |

Hooks huishi ndani ya `azure.yaml` yako. Huu ni mfano mdogo kabisa—huchapisha ujumbe baada ya utekelezaji:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Hiyo ni yote—wakati mwingine unapopiga `azd up`, ujumbe hutumiwa moja kwa moja. Pia unaweza kuendesha hook peke yake, bila utekelezaji kamili, ambayo ni nzuri kwa majaribio:

```bash
azd hooks run postdeploy
```

Hatua zilizofuata zinaonyesha hooks halisi za ulimwengu (mabadiliko, majaribio, uthibitishaji) kwa kila hatua.

### Hatua ya 1: Hooks za Kabla ya Utayarishaji
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

### Hatua ya 2: Utayarishaji wa Miundombinu
- Husoma templeti za miundombinu (Bicep/Terraform)
- Huunda au kusasisha rasilimali za Azure
- Husanidi mtandao na usalama
- Huanzisha ufuatiliaji na uandika logi

### Hatua ya 3: Hooks za Baada ya Utayarishaji
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

### Hatua ya 4: Ufunga wa Programu
- Anajenga msimbo wa programu
- Huunda vitu vya utekelezaji
- Huandaa pakiti kwa jukwaa lengwa (kontena, faili za ZIP, n.k.)

### Hatua ya 5: Hooks za Kabla ya Utekelezaji
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

### Hatua ya 6: Utekelezaji wa Programu
- Hupeleka programu zilizopakizwa kwa huduma za Azure
- Husasisha mipangilio ya usanidi
- Huanza/kuzindua upya huduma

### Hatua ya 7: Hooks za Baada ya Utekelezaji
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

### Kushughulikia Makosa ya Hook

Kwa default, **kama amri ya hook inatoka na msimbo usio sifuri, azd husitisha kazi nzima.** Hii kawaida ndiyo unayotaka—mabadiliko yanayoshindwa yanapaswa kusitisha utekelezaji, si kupeleka programu iliyo na hitilafu. Lakini ina maana hooks zinapaswa kuandikwa kwa makini.

**1. Fanya kushindwa kusikike na kwa makusudi.** Hook inashindwa wakati amri yake ya mwisho inarudisha msimbo usio sifuri. Katika hati za shell, ongeza `set -e` ili hook ipate kusitisha kwa amri ya kwanza inayoshindwa badala ya kuendelea kimya:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Ruhusu hook kushindwa bila kusitisha azd.** Kwa hatua zisizo muhimu (kutayarisha cache kwa hiari, arifa ya jitihada bora), weka `continueOnError: true`. azd huandika makosa lakini inaendelea:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Jaribu hooks peke yako kabla ya mkondo kamili.** Huna haja ya kuendesha `azd up` kusuluhisha hook—iendeshe peke yako na fanya mabadiliko kwa haraka:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Angalia shells maalum za OS.** Hook inayotumia `shell: pwsh` inahitaji PowerShell imewekwa kwenye mashine inayoiendesha (ikiwa ni pamoja na maajenti wa CI). Tumia `shell: sh` kwa uenezi mpana zaidi, au toa toleo za `windows` na `posix`:

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

> **Vidokezo vya kutatua matatizo:** endesha amri yoyote ya azd na `--debug` kuona amri sahihi ya hook na matokeo yake kamili—ni muhimu wakati hook inafanya kazi kiasili lakini inashindwa kwenye CI.

## 🎛️ Usanidi wa Utekelezaji

### Mipangilio ya Utekelezaji wa Huduma Maalum
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

### Usanidi Maalum wa Mazingira

Haya ni maadili ya ndani ya azd tu. Yaweke wazi kwenye usanidi wa miundombinu/utendaji. `NODE_ENV` kawaida ni `production` kwa programu ya Node iliyotekelezwa, ikiwa ni pamoja na utekelezaji wa staging; tumia kigezo tofauti maalum cha programu kutofautisha hatua za utekelezaji.

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

## 🔧 Mifano ya Utekelezaji wa Juu

### Programu za Huduma Nyingi
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

### Utekelezaji wa Blue-Green

**Mchoro unaoonyesha utendakazi:** lazima utoe mazingira yote mawili, safu ya pamoja ya usambazaji wa trafiki, na hati mbili zilizo chini. azd haubadili trafiki wala kuthibitisha ushawishi wa kurudisha nyuma moja kwa moja. Hifadhi kijani hadi bluu imethibitishwa na haipatikani tena kurudisha nyuma.

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

### Utekelezaji wa Canary
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Kugawanya trafiki ni sehemu ya usanidi wa Container Apps (Bicep au Azure CLI), si mwonekano wa `azure.yaml` `trafficSplit`. Mapitisho/utayarishaji na utekelezaji wa baadaye lazima yaweke hali uliyochagua ya marekebisho na sheria za usambazaji.

### Utekelezaji wa Hatua Nyingi
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

## 🐳 Utekelezaji wa Kontena

### Utekelezaji wa Programu za Kontena
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

Sanidi siri za runtime kwa `configuration.secrets`/`secretRef` (au marejeleo ya Key Vault) na upanuzi kwa `template.scale` katika miundombinu ya Container App. Usizidishe sifa za huduma za kiwango cha `secrets` au `scale` katika `azure.yaml`.

### Uboreshaji wa Dockerfile wa Hatua Nyingi
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

## ⚡ Uboreshaji wa Utendaji

### Utekelezaji wa Huduma Maalum
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Kufunga Kache za Ujenzi
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Muendelezo wa kawaida wa Node hutumia hati za kifurushi; hooks za `prepackage` za huduma zinaweza kuongeza hatua zinazohitajika. Kache ya tabaka la Docker ni tofauti na kufafanua amri ya huduma za ujenzi.

### Utekelezaji wa Msimbo Chenye Ufanisi
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Ufuatiliaji wa Utekelezaji

### Ufuatiliaji wa Utekelezaji kwa Wakati Halisi
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Ukaguzi wa Afya
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

Programu yako lazima itekeleze `/health`; haipatikani moja kwa moja na azd. Hakuna sifa ya huduma ya jumla ya `azure.yaml` `healthCheck`.

### Uhakiki wa Baada ya Utekelezaji
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

## 🔐 Mambo ya Usalama

### Usimamizi wa Siri
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` si halali. Maadili ya kawaida ya mazingira ni maandishi ya wazi ya ndani; usidhani amri za kusoma zitayaficha. Amri zilizo juu hifadhi marejeleo ya Key Vault, lakini miundombinu/ programu yako bado inapaswa kutumia siri hizo na kutoa ruhusa ya kitambulisho cha runtime.

### Usalama wa Mtandao
Tambulisha na tumia vigezo vya mtandao katika Bicep, na viongoze katika `infra/main.parameters.json`. Hakuna tabaka la jumla la usalama wa mtandao la `infra.parameters` katika `azure.yaml`. Mifano ya nyaraka kuanzia `203.0.113.0/24` na `198.51.100.0/24` si mitandao halisi ya ofisi/VPN; badilisha na mistari ya mitandao iliyoruhusiwa.

### Utambulisho na Usimamizi wa Ruhusa
Washa `identity` ya Container App katika Bicep na uteue jukwaa lenye kazi la data la Key Vault katika eneo la ghala. Sanidi siri zilizopewa Key Vault kwa majina na marejeleo ya runtime katika rasilimali hiyo; `identity` na `keyVault` si sifa za jumla za azd za huduma. Angalia [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Mikakati ya Kurudisha Nyuma

### Kurudisha Nyuma kwa Haraka
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

### Kurudisha Nyuma kwa Miundombinu
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Kurudisha Nyuma kwa Mabadiliko ya Databasi
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Vipimo vya Utekelezaji

### Fuata Ufanisi wa Utekelezaji
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Ukusanyaji wa Vipimo Maalum
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

## 🎯 Mbinu Bora

### 1. Ulinganifu wa Mazingira
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Uthibitishaji wa Miundombinu
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Muunganisho wa Majaribio
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

### 4. Nyaraka na Uandika Logi
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Hatua Inayofuata

- [Utayarishaji wa Rasilimali](provisioning.md) - Utafiti wa kina wa usimamizi wa miundombinu
- [Mipango Kabla ya Utekelezaji](../chapter-06-pre-deployment/capacity-planning.md) - Panga mkakati wako wa utekelezaji
- [Matatizo ya Kawaida](../chapter-07-troubleshooting/common-issues.md) - Rekebisha matatizo ya utekelezaji
- [Mbinu Bora](../chapter-07-troubleshooting/debugging.md) - Mikakati ya utekelezaji inayotayarishwa uzalishaji

## 🎯 Mazoezi ya Vitendo ya Utekelezaji

### Zoefesi 1: Muendelezo wa Utekelezaji wa Hatua kwa Hatua (dakika 20)
**Lengo**: Kumiliki tofauti kati ya utekelezaji kamili na hatua kwa hatua

**Mahali pa kuanza:** Bash, Node.js 22, Git, kuingia kwa azd, na usajili wa Azure wenye ruhusa za utekelezaji. Endesha katika saraka mpya; tarajia rasilimali za App Service/Cosmos DB zinazolipishwa. Muda hutegemea eneo na kiolezo.

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

**Vigezo vya Mafanikio:**
- [ ] Rekodi muda uliochukua kwa amri zote mbili (hakuna muda uliodhamiriwa)
- [ ] Amri zote mbili zinakamilika kwa mafanikio
- [ ] API inabaki na kazi; mabadiliko ya maoni pekee si mabadiliko ya mwonekano wa UI
- [ ] Miundombinu haijabadilika baada ya `azd deploy`

**Matokeo ya Kujifunza**: `azd deploy` huzusha utekelezaji wa miundombinu. Linganisha vipindi vilivyopimwa badala ya kudhani ongezeko la asilimia fulani ya kasi.

### Zoefesi 2: Hooks Maalum za Utekelezaji (dakika 30)
**Lengo**: Tekeleza utumiaji wa otomatiki kabla na baada ya utekelezaji

**Mahali pa kuanza:** mradi uliotangwa `deployment-practice` hapo juu. Ikiwa uliusafisha, fanya `azd up` tena kabla ya kujaribu utekelezaji wa msimbo pekee. Uhakiki huu hutumia hati halisi ya ujenzi ya API, si hati ya mzizi isiyopo ya `test:unit`. Majaribio ya API ya kiolezo yanahitaji ufikiaji wa database uliosanidiwa; si majaribio ya vitengo vilivyopewa.

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

**Vigezo vya Mafanikio:**
- [ ] Hati ya kabla ya utekelezaji inaendeshwa kabla ya utekelezaji
- [ ] Utekelezaji unasitishwa ikiwa ujenzi uthibitisho unashindwa
- [ ] Jaribio la harufu baada ya utekelezaji linathibitisha afya
- [ ] Hooks zinaendeshwa kwa mpangilio sahihi

### Zoefesi 3: Mkakati wa Utekelezaji kwa Mazingira Mengi (dakika 45)
**Lengo**: Tekeleza muendelezo wa kazi wa hatua (dev → staging → uzalishaji)

**Mazingira ya kuanzia:** mradi ule ule wa todo uliowekwa na `jq`. Tengeneza mazingira yaliyo chini na maadili halisi ya usajili/mahali (au weka `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` kila moja) **kabla** ya kuitisha mtiririko usio na ombi. Inaweza kushindwa kwa makusudi badala ya kubuni maadili yaliyokosekana. Tumia mazingira ya mafunzo yanayotumika mara moja tu, si usajili halisi wa uzalishaji.

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

**Vigezo vya Mafanikio:**
- [ ] Mazingira ya Dev yanaanzishwa kwa mafanikio
- [ ] Mazingira ya Staging yanaanzishwa kwa mafanikio
- [ ] Uidhinishaji wa mkono unahitajika kwa uzalishaji
- [ ] Mazingira yote yana ukaguzi wa afya unaofanya kazi
- [ ] Inaweza kurejesha hali nyuma ikiwa inahitajika

### Zoho la 4: Mkakati wa Kurejesha Hali (dakika 25)
**Lengo**: Tekeleza na jaribu kurejesha hali ya utoaji kwa kutumia Git

**Mazingira ya kuanzia:** ukaguzi wa mafunzo uliotengwa wa template ya todo na msimbo wa msingi wote uliosajiliwa, mti safi wa kazi wa Git, na mazingira yaliyosanidiwa yanayotumika mara moja. Kamwe usilete kushindwa kwa makusudi katika mradi halisi wa uzalishaji. `APP_VERSION` hapa chini ni kwa ajili ya uhasibu tu isipokuwa ukiiweka waziwazi kwenye app.

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

**Vigezo vya Mafanikio:**
- [ ] Inaweza kugundua kushindwa kwa utoaji
- [ ] Skripti ya kurejesha hali inatekelezwa moja kwa moja
- [ ] Programu inarudi kwenye hali inayofanya kazi
- [ ] Ukaguzi wa afya unapita baada ya kurejesha hali

## 📊 Ufuatiliaji wa Vipimo vya Utoaji

### Fuata Utendaji wa Utoaji Wako

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

**Chambua vipimo vyako:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Rasilimali Zaidi

- [Kumbukumbu ya Utoaji wa Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Utoaji wa Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Utoaji wa Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Utoaji wa Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Urambazaji**
- **Somo Lililopita**: [Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **Somo Linalofuata**: [Kutayarisha Rasilimali](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->