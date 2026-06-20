# Mwongozo wa Utekelezaji - Kuwa Mtaalamu wa Utekelezaji wa AZD

**Uabiri wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 4 - Miundombinu kama Msimbo & Utekelezaji
- **⬅️ Sura Iliyopita**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)
- **➡️ Ifuatayo**: [Utayarishaji wa Rasilimali](provisioning.md)
- **🧩 Pia katika sura hii**: [Kuandika Kiolezo Chako](custom-templates.md)
- **🚀 Sura Inayofuata**: [Sura 5: Suluhisho za AI za Wakala Wengi](../../examples/retail-scenario.md)

## Utangulizi

Mwongozo huu kamili unafunika kila unachohitaji kujua kuhusu kusambaza programu kwa kutumia Azure Developer CLI, kuanzia utekelezaji wa amri moja rahisi hadi hali za uzalishaji za hali ya juu zenye hooks maalum, mazingira mengi, na ujumuishaji wa CI/CD. Tambua mzunguko mzima wa utekelezaji kwa mifano ya vitendo na mbinu bora.

## Malengo ya Kujifunza

Kwa kukamilisha mwongozo huu, utakuwa umeweza:
- Kufahamu amri zote na mtiririko wa kazi za utekelezaji za Azure Developer CLI
- Kuelewa mzunguko mzima wa utekelezaji kutoka utayarishaji hadi ufuatiliaji
- Kutekeleza hooks za utekelezaji maalum kwa ajili ya automatisering kabla na baada ya utekelezaji
- Kusanidi mazingira mengi kwa vigezo maalum kwa kila mazingira
- Kuweka mikakati ya juu ya utekelezaji ikijumuisha blue-green na canary deployments
- Kuingiza utekelezaji wa azd katika pipelines za CI/CD na mtiririko wa kazi wa DevOps

## Matokeo ya Kujifunza

Baada ya kukamilisha, utaweza:
- Kutekeleza na kutatua matatizo yote ya mtiririko wa azd deployments kwa uhuru
- Kubuni na kutekeleza automatisering maalum ya utekelezaji ukitumia hooks
- Kusanidi utekelezaji tayari kwa uzalishaji kwa usalama na ufuatiliaji unaofaa
- Kusimamia hali tata za utekelezaji katika mazingira mengi
- Kuboresha utendaji wa utekelezaji na kutekeleza mikakati ya kurudi nyuma
- Kuingiza utekelezaji za azd katika mbinu za DevOps za shirika

## Muhtasari wa Utekelezaji

Azure Developer CLI inatoa amri nyingi za utekelezaji:
- `azd up` - Mtiririko kamili (provision + deploy)
- `azd provision` - Tengeneza/sasisha rasilimali za Azure pekee
- `azd deploy` - Sambaza msimbo wa programu pekee
- `azd package` - Jenga na pakia programu

## Mitiririko Msingi ya Utekelezaji

### Utekelezaji Kamili (azd up)
Mtiririko wa kawaida kwa miradi mipya:
```bash
# Weka kila kitu kuanzia mwanzo
azd up

# Weka kwa mazingira maalum
azd up --environment production

# Weka kwa vigezo vilivyobinafsishwa
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Utekelezaji wa Miundombinu Pekee
Wakati unahitaji tu kusasisha rasilimali za Azure:
```bash
# Tayarisha/kusasisha miundombinu
azd provision

# Tayarisha kwa kuendesha jaribio (dry-run) ili kutazama mabadiliko
azd provision --preview

# Tayarisha huduma maalum
azd provision --service database
```

### Utekelezaji wa Msimbo Pekee
Kwa masasisho ya haraka ya programu:
```bash
# Peleka huduma zote
azd deploy

# Matokeo yanayotarajiwa:
# Kupeleka huduma (azd deploy)
# - web: Inawekwa... Imekamilika
# - api: Inawekwa... Imekamilika
# MAFANIKIO: Utekelezaji wako ulikamilika kwa dakika 2 na sekunde 15

# Peleka huduma maalum
azd deploy --service web
azd deploy --service api

# Peleka kwa vigezo vya kujenga vilivyobinafsishwa
azd deploy --service api --build-arg NODE_ENV=production

# Thibitisha utekelezaji
azd show --output json | jq '.services'
```

### ✅ Uthibitisho wa Utekelezaji

Baada ya utekelezaji wowote, thibitisha mafanikio:

```bash
# Hakikisha huduma zote zinaendesha
azd show

# Jaribu endpoints za afya
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Fuatilia makosa (hufunguka katika kivinjari kwa chaguo-msingi)
azd monitor --logs
```

**Vigezo vya Mafanikio:**
- ✅ Huduma zote zinaonyesha hali ya "Running"
- ✅ Endpoints za afya zinarejesha HTTP 200
- ✅ Hakuna kumbukumbu za makosa katika dakika 5 zilizopita
- ✅ Programu inajibu maombi ya mtihani

## 🏗️ Kuelewa Mchakato wa Utekelezaji

### Mpya kwa hooks? Anza hapa

A **hook** ni amri azd inayoendesha kiotomatiki wakati maalum katika mchakato wa utekelezaji—kabla au baada ya utayarishaji, na kabla au baada ya kusambaza msimbo wako. Zinakuwezesha ku-automate kazi ndogo zinazowazunguka utekelezaji: kuweka mazao kwenye database, kuendesha migrations, kujenga mali, au kufanya smoke-tests kwa programu iliyopo.

| Hook | Inafanyika… | Matumizi ya kawaida |
|------|-------------|---------------------|
| `preprovision` | Kabla rasilimali zinapotengenezwa | Thibitisha vipengele vinavyohitajika, ingia kwenye registry |
| `postprovision` | Baada rasilimali zipo | Sanidi rasilimali, andaa database |
| `predeploy` | Kabla msimbo kusambazwa | Jenga mali za mbele (front-end), endesha unit tests |
| `postdeploy` | Baada msimbo kuwa hai | Endesha DB migrations, fanya smoke-test kwa endpoint |

Hooks zinaishi ndani ya `azure.yaml`. Hapa ni mfano mdogo kabisa—inachapisha tu ujumbe baada ya utekelezaji:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Hiyo ndiyo—wakati ujao utakapoendesha `azd up`, ujumbe utachapishwa kiotomatiki. Pia unaweza kuendesha hook ukiwa peke yako, bila utekelezaji kamili, jambo jema kwa upimaji:

```bash
azd hooks run postdeploy
```

Sehemu hapa chini zinaonyesha hooks za mazingira halisi (migrations, tests, uthibitisho) kwa kila hatua.

### Hatua 1: Hooks za Kabla ya Utayarishaji
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

### Hatua 2: Utayarishaji wa Miundombinu
- Inasoma templati za miundombinu (Bicep/Terraform)
- Inatengeneza au kusasisha rasilimali za Azure
- Inasanidi mitandao na usalama
- Inaweka ufuatiliaji na uandishi wa kumbukumbu

### Hatua 3: Hooks za Baada ya Utayarishaji
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

### Hatua 4: Kupakia Programu
- Inajenga msimbo wa programu
- Inatengeneza artifacts za utekelezaji
- Inapakiana kwa jukwaa linalolengwa (containers, ZIP files, n.k.)

### Hatua 5: Hooks za Kabla ya Utekelezaji
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

### Hatua 6: Utekelezaji wa Programu
- Inasambaza programu zilizopakuliwa kwa huduma za Azure
- Inasasisha mipangilio ya usanidi
- Inaanzisha/kuanza upya huduma

### Hatua 7: Hooks za Baada ya Utekelezaji
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

### Kushughulikia Makosa ya Hook

Kwa chaguo-msingi, **ikiwa amri ya hook inatoka na msimbo wa kutofanana (non-zero), azd inasimamisha operesheni yote.** Hii kwa kawaida ndiyo unayotaka—migration iliyoshindwa inapaswa kuzuia utekelezaji, sio kusafirisha programu iliyoharibika. Lakini inamaanisha hooks lazima ziandikwe kwa uangalifu.

**1. Fanya makosa yawe ya wazi na ya makusudi.** Hook inashindwa wakati amri yake ya mwisho inarejesha msimbo wa exit tofauti na sifuri. Katika shell scripts, ongeza `set -e` ili hook isimame kwa amri ya kwanza inayoshindwa badala ya kuendelea kimya:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Ruhusu hook kushindwa bila kusitisha azd.** Kwa hatua zisizo za lazima (kama kuamsha cache kwa jitihada, taarifa ya jaribio), weka `continueOnError: true`. azd inaandika log ya kushindwa lakini inaendelea:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Pitia hooks kwa upendeleo kabla ya kukimbia kabisa.** Haufai kuendesha `azd up` ili kutambua tatizo la hook—iendeshe pekee yake na rudia haraka:

```bash
azd hooks run predeploy          # inaendesha tu hook ya predeploy
azd hooks run postdeploy --service api
```

**4. Angalia kwa shells maalum za OS.** Hook inayotumia `shell: pwsh` inahitaji PowerShell imewekwa kwenye mashine inayoiendesha (ikijumuisha mawakala wa CI). Tumia `shell: sh` kwa kuboreshwa kwa uhamaji mpana, au toa toleo la `windows` na `posix`:

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

> **Kidokezo cha kutatua matatizo:** run any azd command with `--debug` kuona amri ya hook kamili na matokeo yake yote—ni muhimu wakati hook inafanya kazi kwa ndani lakini inashindwa katika CI.

## 🎛️ Usanidi wa Utekelezaji

### Mipangilio ya Utekelezaji kwa Huduma Maalum
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

### Usanidi kwa Mazingira Maalum
```bash
# Mazingira ya maendeleo
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Mazingira ya maandalizi
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Mazingira ya uzalishaji
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Mifano ya Utekelezaji wa Juu

### Programu zenye Huduma Nyingi
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

### Blue-Green Deployments
```bash
# Unda mazingira ya bluu
azd env new production-blue
azd up --environment production-blue

# Jaribu mazingira ya bluu
./scripts/test-environment.sh production-blue

# Hamisha trafiki kwa bluu (sasisha DNS/kisawazishaji mzigo kwa mkono)
./scripts/switch-traffic.sh production-blue

# Safisha mazingira ya kijani
azd env select production-green
azd down --force
```

### Canary Deployments
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

### Utekelezaji kwa Ngazi (Staged Deployments)
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

## 🐳 Utekelezaji wa Containers

### Utekelezaji wa Container App
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

### Uboreshaji wa Dockerfile wa Ngazi Nyingi
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

## ⚡ Uboreshaji wa Utendaji

### Utekelezaji kwa Huduma Maalum
```bash
# Weka huduma maalum kwa ajili ya mizunguko ya haraka
azd deploy --service web
azd deploy --service api

# Weka huduma zote
azd deploy
```

### Caching ya Ujenzi
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Utekelezaji wa Msimbo kwa Ufanisi
```bash
# Tumia azd deploy (si azd up) kwa mabadiliko ya msimbo pekee
# Hii inaepuka utoaji wa miundombinu na ni ya haraka zaidi
azd deploy

# Sambaza huduma maalum kwa ajili ya mzunguko wa haraka zaidi
azd deploy --service api
```

## 🔍 Ufuatiliaji wa Utekelezaji

### Ufuatiliaji wa Utekelezaji kwa Wakati Halisi
```bash
# Fuatilia programu kwa wakati halisi
azd monitor --live

# Tazama kumbukumbu za programu
azd monitor --logs

# Angalia hali ya utoaji
azd show
```

### Michoro ya Afya (Health Checks)
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

### Uthibitisho wa Baada ya Utekelezaji
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Kagua afya ya programu
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

## 🔐 Mambo ya Usalama

### Usimamizi wa Secrets
```bash
# Hifadhi siri kwa usalama
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Rejea siri katika azure.yaml
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

### Usalama wa Mtandao
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Utambulisho na Usimamizi wa Upatikanaji
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

## 🚨 Mikakati ya Kurudi Nyuma (Rollback)

### Kurudi Nyuma Haraka
```bash
# AZD haina utendaji wa rollback uliojengwa. Mbinu zilizopendekezwa:

# Chaguo 1: Weka tena kutoka Git (inapendekezwa)
git revert HEAD  # Rudisha commit yenye tatizo
git push
azd deploy

# Chaguo 2: Weka tena commit maalum
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Kurudi Nyuma kwa Miundombinu
```bash
# Angalia mabadiliko ya miundombinu kabla ya kuyatekeleza
azd provision --preview

# Kwa kurejesha miundombinu, tumia udhibiti wa toleo:
git revert HEAD  # Rejesha mabadiliko ya miundombinu
azd provision    # Tekeleza hali ya miundombinu ya awali
```

### Kurudi Nyuma kwa Migrations za Database
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrics za Utekelezaji

### Fuata Utendaji wa Utekelezaji
```bash
# Tazama hali ya sasa ya usambazaji
azd show

# Fuatilia programu kwa kutumia Application Insights
azd monitor --overview

# Tazama vipimo vya moja kwa moja
azd monitor --live
```

### Ukusanyaji wa Metrics Maalum
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
# Tumia muundo thabiti wa majina
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Dumisha ulinganifu wa mazingira
./scripts/sync-environments.sh
```

### 2. Uthibitisho wa Miundombinu
```bash
# Angalia mabadiliko ya miundombinu kabla ya utekelezaji
azd provision --preview

# Tumia ukaguzi wa ARM/Bicep
az bicep lint --file infra/main.bicep

# Thibitisha sintaksia ya Bicep
az bicep build --file infra/main.bicep
```

### 3. Ujumuishaji wa Mtihani
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

### 4. Nyaraka na Uandishi wa Kumbukumbu
```bash
# Andika nyaraka za taratibu za uwekaji
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Hatua Zifuatazo

- [Utayarishaji wa Rasilimali](provisioning.md) - Uchunguzi wa kina wa usimamizi wa miundombinu
- [Mipango ya Kabla ya Utekelezaji](../chapter-06-pre-deployment/capacity-planning.md) - Panga mkakati wako wa utekelezaji
- [Masuala ya Kawaida](../chapter-07-troubleshooting/common-issues.md) - Tatua masuala ya utekelezaji
- [Mbinu Bora](../chapter-07-troubleshooting/debugging.md) - Mikakati ya utekelezaji tayari kwa uzalishaji

## 🎯 Mazoezi ya Vitendo ya Utekelezaji

### Zozi 1: Mtiririko wa Utekelezaji wa Kuongezeka (dakika 20)
**Lengo**: Fahamu tofauti kati ya utekelezaji kamili na wa kuongezeka

```bash
# Utekelezaji wa awali
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Rekodi muda wa utekelezaji wa awali
echo "Full deployment: $(date)" > deployment-log.txt

# Fanya mabadiliko ya msimbo
echo "// Updated $(date)" >> src/api/src/server.js

# Sambaza tu msimbo (haraka)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Linganisha nyakati
cat deployment-log.txt

# Safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Utekelezaji kamili unachukua dakika 5-15
- [ ] Utekelezaji wa msimbo pekee unachukua dakika 2-5
- [ ] Mabadiliko ya msimbo yanaonekana katika programu iliyosambazwa
- [ ] Miundombinu haibadiliki baada ya `azd deploy`

**Matokeo ya Kujifunza**: `azd deploy` ni 50-70% haraka zaidi kuliko `azd up` kwa mabadiliko ya msimbo

### Zozi 2: Hooks Maalum za Utekelezaji (dakika 30)
**Lengo**: Tekeleza automatisering kabla na baada ya utekelezaji

```bash
# Unda skripti ya uthibitishaji kabla ya uenezaji
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Angalia kama majaribio yanapita
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Angalia mabadiliko ambayo hayajakomitiwa
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Unda jaribio la haraka baada ya uenezaji
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

# Ongeza hooks kwenye azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Jaribu uenezaji kwa kutumia hooks
azd deploy
```

**Vigezo vya Mafanikio:**
- [ ] Skripti ya kabla ya utekelezaji inaendeshwa kabla ya utekelezaji
- [ ] Utekelezaji unasitishwa ikiwa majaribio yanashindwa
- [ ] Mtihani wa smoke baada ya utekelezaji unathibitisha afya
- [ ] Hooks zinafanya kazi kwa mpangilio sahihi

### Zozi 3: Mkakati wa Utekelezaji kwa Mazingira Mengi (dakika 45)
**Lengo**: Tekeleza mtiririko wa utekelezaji kwa hatua (dev → staging → production)

```bash
# Tengeneza skripti ya utoaji
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Hatua 1: Weka kwenye mazingira ya maendeleo
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Hatua 2: Weka kwenye mazingira ya majaribio
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Hatua 3: Idhinisho la mkono kwa uzalishaji
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

# Unda mazingira
azd env new dev
azd env new staging
azd env new production

# Endesha utoaji uliopangwa
./deploy-staged.sh
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira ya Dev yasambazwa kwa mafanikio
- [ ] Mazingira ya Staging yasambazwa kwa mafanikio
- [ ] Uthibitisho wa mkono unaohitajika kwa uzalishaji
- [ ] Mazingira yote yana health checks zinazofanya kazi
- [ ] Inawezekana kurudi nyuma ikiwa inahitajika

### Zozi 4: Mkakati wa Kurudi Nyuma (dakika 25)
**Lengo**: Tekeleza na upime kurudi nyuma kwa utekelezaji ukitumia Git

```bash
# Weka v1
azd env set APP_VERSION "1.0.0"
azd up

# Hifadhi hash ya commit ya v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Weka v2 yenye mabadiliko ya kuvunja utangamano
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Gundua hitilafu na rudisha nyuma
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rudisha nyuma kwa kutumia git
    git revert HEAD --no-edit
    
    # Rudisha mazingira
    azd env set APP_VERSION "1.0.0"
    
    # Weka tena v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Vigezo vya Mafanikio:**
- [ ] Inaweza kutambua kushindwa kwa utekelezaji
- [ ] Skripti ya kurudi nyuma inaendeshwa kiotomotiki
- [ ] Programu inarudi katika hali inayofanya kazi
- [ ] Health checks zinapita baada ya kurudi nyuma

## 📊 Ufuatiliaji wa Metrics za Utekelezaji

### Fuata Utendaji wako wa Utekelezaji

```bash
# Unda skripti ya vipimo vya utoaji
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

# Andika kwenye faili
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Tumia
./track-deployment.sh
```

**Chambua metrics zako:**
```bash
# Tazama historia ya uwekaji
cat deployment-metrics.csv

# Hesabu wastani wa muda wa uwekaji
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Rasilimali Zaidi

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Uabiri**
- **Somo lililopita**: [Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **Somo lijalo**: [Utayarishaji wa Rasilimali](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->