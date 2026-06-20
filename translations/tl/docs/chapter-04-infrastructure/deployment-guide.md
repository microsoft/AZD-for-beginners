# Gabay sa Pag-deploy - Pag-master ng AZD Deployments

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 4 - Imprastruktura bilang Code at Pag-deploy
- **⬅️ Nakaraang Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)
- **➡️ Susunod**: [Provisioning Resources](provisioning.md)
- **🧩 Kasama rin sa kabanatang ito**: [Paggawa ng Iyong Sariling Template](custom-templates.md)
- **🚀 Susunod na Kabanata**: [Kabanata 5: Mga Multi-Agent AI na Solusyon](../../examples/retail-scenario.md)

## Pambungad

Saklaw ng komprehensibong gabay na ito ang lahat ng kailangan mong malaman tungkol sa pag-deploy ng mga aplikasyon gamit ang Azure Developer CLI, mula sa mga pangunahing single-command na pag-deploy hanggang sa mga advanced na production na senaryo na may custom hooks, maraming environment, at integrasyon ng CI/CD. Masterhin ang buong deployment lifecycle gamit ang mga praktikal na halimbawa at mga pinakamahusay na kasanayan.

## Mga Layunin sa Pag-aaral

Sa pagtatapos ng gabay na ito, ikaw ay:
- Magiging bihasa sa lahat ng Azure Developer CLI deployment na mga utos at workflows
- Maiintindihan ang buong deployment lifecycle mula sa provisioning hanggang sa monitoring
- Makakapagpatupad ng custom deployment hooks para sa pre at post-deployment automation
- Makakapag-konpigura ng maraming environment na may mga parameter na akma sa bawat environment
- Makakapag-set up ng advanced na deployment strategies kabilang ang blue-green at canary deployments
- Makakapag-integrate ng azd deployments sa CI/CD pipelines at DevOps workflows

## Mga Kinalabasan ng Pag-aaral

Pagkatapos makumpleto, magagawa mong:
- I-execute at i-troubleshoot ang lahat ng azd deployment workflows nang mag-isa
- Magdisenyo at magpatupad ng custom deployment automation gamit ang hooks
- Mag-configure ng production-ready deployments na may tamang seguridad at monitoring
- Pangasiwaan ang kumplikadong multi-environment deployment scenarios
- I-optimize ang performance ng deployment at magpatupad ng rollback strategies
- I-integrate ang azd deployments sa enterprise DevOps practices

## Pangkalahatang-ideya ng Pag-deploy

Nagbibigay ang Azure Developer CLI ng ilang deployment na mga utos:
- `azd up` - Kumpletong workflow (provision + deploy)
- `azd provision` - Lumikha/i-update lamang ng mga Azure resources
- `azd deploy` - I-deploy lamang ang application code
- `azd package` - I-build at i-package ang mga aplikasyon

## Mga Pangunahing Workflow ng Pag-deploy

### Kumpletong Pag-deploy (azd up)
Ang pinaka-karaniwang workflow para sa mga bagong proyekto:
```bash
# I-deploy ang lahat mula sa simula
azd up

# I-deploy gamit ang espesipikong environment
azd up --environment production

# I-deploy gamit ang pasadyang mga parameter
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Pag-deploy na Imprastruktura-Lamang
Kapag kailangan mo lamang i-update ang mga Azure resources:
```bash
# I-provision o i-update ang imprastruktura
azd provision

# I-provision gamit ang dry-run upang makita ang mga pagbabago
azd provision --preview

# I-provision ang mga partikular na serbisyo
azd provision --service database
```

### Pag-deploy na Code-Lamang
Para sa mabilisang pag-update ng aplikasyon:
```bash
# I-deploy ang lahat ng serbisyo
azd deploy

# Inaasahang output:
# Nagde-deploy ng mga serbisyo (azd deploy)
# - web: Nagde-deploy... Tapos
# - api: Nagde-deploy... Tapos
# TAGUMPAY: Nakumpleto ang pag-deploy mo sa 2 minuto at 15 segundo

# I-deploy ang isang partikular na serbisyo
azd deploy --service web
azd deploy --service api

# I-deploy gamit ang pasadyang mga argumento ng build
azd deploy --service api --build-arg NODE_ENV=production

# Suriin ang pag-deploy
azd show --output json | jq '.services'
```

### ✅ Pag-beripika ng Pag-deploy

Pagkatapos ng anumang pag-deploy, i-verify ang tagumpay:

```bash
# Suriin na tumatakbo ang lahat ng serbisyo
azd show

# Subukan ang mga health endpoint
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Subaybayan ang mga error (bubukas sa browser bilang default)
azd monitor --logs
```

**Kriteria ng Tagumpay:**
- ✅ Lahat ng serbisyo ay nagpapakita ng status na "Running"
- ✅ Nagbabalik ang health endpoints ng HTTP 200
- ✅ Walang error logs sa huling 5 minuto
- ✅ Tumutugon ang aplikasyon sa mga test request

## 🏗️ Pag-unawa sa Proseso ng Pag-deploy

### Bago sa hooks? Magsimula dito

Ang isang **hook** ay isang utos na awtomatikong pinapatakbo ng azd sa isang tiyak na sandali sa proseso ng deploy—bago o pagkatapos ng provisioning, at bago o pagkatapos i-deploy ang iyong code. Pinahihintulutan ka nitong i-automate ang maliliit na gawain na palaging kasama ng deployment: pag-seed ng database, pagpapatakbo ng migrations, pag-build ng mga asset, o smoke-testing ng live na app.

| Hook | Tumatakbo… | Karaniwang gamit |
|------|------------|------------------|
| `preprovision` | Bago malikha ang mga resources | I-validate ang prerequisites, mag-login sa isang registry |
| `postprovision` | Pagkatapos may mga resources na | I-configure ang mga resources, i-set up ang database |
| `predeploy` | Bago i-deploy ang code | I-build ang front-end assets, patakbuhin ang unit tests |
| `postdeploy` | Pagkatapos maging live ang code | Patakbuhin ang DB migrations, smoke-test ang endpoint |

Naninirahan ang mga hooks sa iyong `azure.yaml`. Narito ang pinakamaliit na posibleng halimbawa—nagpi-print lang ito ng mensahe pagkatapos ng deployment:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Iyon lang—sa susunod na patakbuhin mo ang `azd up`, awtomatikong magpi-print ang mensahe. Maaari mo ring patakbuhin ang isang hook mag-isa, nang hindi buong deploy, na maganda para sa testing:

```bash
azd hooks run postdeploy
```

Ipinapakita ng mga yugto sa ibaba ang mga real-world hooks (migrations, tests, validation) para sa bawat stage.

### Yugto 1: Pre-Provision Hooks
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

### Yugto 2: Pagpo-provision ng Imprastruktura
- Binabasa ang mga infrastructure template (Bicep/Terraform)
- Lumilikha o nag-a-update ng mga Azure resources
- Nagko-configure ng networking at seguridad
- Nagse-set up ng monitoring at logging

### Yugto 3: Post-Provision Hooks
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

### Yugto 4: Pag-package ng Aplikasyon
- I-binubuild ang application code
- Lumilikha ng deployment artifacts
- I-pini-package para sa target platform (containers, ZIP files, atbp.)

### Yugto 5: Pre-Deploy Hooks
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

### Yugto 6: Pag-deploy ng Aplikasyon
- I-de-deploy ang mga packaged applications sa Azure services
- Ina-update ang mga configuration settings
- Nagsisimula/muling sinisimulan ang mga serbisyo

### Yugto 7: Post-Deploy Hooks
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

### Pag-handle ng Mga Error sa Hook

Bilang default, **kung ang hook command ay nag-exit na may non-zero code, humihinto ang azd sa buong operasyon.** Karaniwan itong gusto mo—ang nabigong migration ay dapat huminto sa deploy, hindi magpadala ng sirang app. Ngunit nangangahulugan ito na kailangang isulat nang mabuti ang mga hooks.

**1. Gawing malakas at sinasadya ang mga pagkabigo.** Nabibigo ang isang hook kapag ang huling utos nito ay nagbalik ng non-zero exit code. Sa mga shell script, magdagdag ng `set -e` para huminto ang hook sa unang nabigong utos imbes na magpatuloy ng tahimik:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Pahintulutan ang isang hook na mabigo nang hindi humihinto ang azd.** Para sa mga hindi-kritikal na hakbang (opsyonal na cache warm-up, best-effort na notification), i-set ang `continueOnError: true`. I-log ng azd ang pagkabigo ngunit nagpapatuloy:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. I-test ang mga hooks nang hiwalay bago ang buong run.** Hindi mo kailangang patakbuhin ang `azd up` para i-debug ang isang hook—patakbuhin ito nang mag-isa at mag-iterate nang mabilis:

```bash
azd hooks run predeploy          # pinapatakbo lang ang predeploy hook
azd hooks run postdeploy --service api
```

**4. Mag-ingat sa mga OS-specific na shell.** Ang hook na gumagamit ng `shell: pwsh` ay nangangailangan ng PowerShell na naka-install sa makina na nagpapatakbo nito (kasama ang mga CI agent). Gumamit ng `shell: sh` para sa pinakamalawak na portability, o magbigay ng parehong `windows` at `posix` na variant:

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

> **Tip sa Pag-debug:** patakbuhin ang anumang azd na utos na may `--debug` upang makita ang eksaktong hook command line at ang buong output nito—napakahalaga kapag gumagana ang hook nang lokal ngunit nabibigo sa CI.

## 🎛️ Konfigurasyon ng Pag-deploy

### Mga Setting ng Pag-deploy na Espesipiko sa Serbisyo
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

### Mga Konfigurasyong Espesipiko sa Environment
```bash
# Kapaligiran ng pagbuo
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Kapaligiran ng pagsusuri
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Kapaligiran ng produksyon
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Mga Advanced na Senaryo ng Pag-deploy

### Mga Aplikasyon na Maraming Serbisyo
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
# Gumawa ng asul na kapaligiran
azd env new production-blue
azd up --environment production-blue

# Subukan ang asul na kapaligiran
./scripts/test-environment.sh production-blue

# Ilipat ang trapiko sa asul (manwal na pag-update ng DNS/load balancer)
./scripts/switch-traffic.sh production-blue

# Linisin ang berdeng kapaligiran
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

### Staged Deployments
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

## 🐳 Pag-deploy ng Container

### Pag-deploy ng Container App
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

### Multi-Stage Dockerfile Optimization
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

## ⚡ Pag-optimize ng Performance

### Mga Pag-deploy na Espesipiko sa Serbisyo
```bash
# I-deploy ang isang partikular na serbisyo para sa mas mabilis na iterasyon
azd deploy --service web
azd deploy --service api

# I-deploy ang lahat ng serbisyo
azd deploy
```

### Build Caching
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Epektibong Pag-deploy ng Code
```bash
# Gamitin ang azd deploy (huwag ang azd up) para sa mga pagbabago na puro code lang
# Hindi nito isinasagawa ang provisioning ng imprastruktura at mas mabilis ito
azd deploy

# I-deploy ang partikular na serbisyo para sa pinakamabilis na iterasyon
azd deploy --service api
```

## 🔍 Monitoring ng Pag-deploy

### Real-Time na Monitoring ng Pag-deploy
```bash
# Subaybayan ang aplikasyon nang real-time
azd monitor --live

# Tingnan ang mga log ng aplikasyon
azd monitor --logs

# Suriin ang katayuan ng deployment
azd show
```

### Health Checks
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

### Post-Deployment Validation
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Suriin ang kalusugan ng aplikasyon
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

## 🔐 Mga Pagsasaalang-alang sa Seguridad

### Pamamahala ng Secrets
```bash
# Itago nang ligtas ang mga lihim
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Tukuyin ang mga lihim sa azure.yaml
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

### Seguridad ng Network
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identity at Access Management
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

## 🚨 Mga Estratehiya ng Rollback

### Mabilis na Rollback
```bash
# Walang built-in rollback ang AZD. Inirerekomendang mga pamamaraan:

# Opsyon 1: Muling i-deploy mula sa Git (inirerekomenda)
git revert HEAD  # I-revert ang problemadong commit
git push
azd deploy

# Opsyon 2: Muling i-deploy ang partikular na commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback ng Imprastruktura
```bash
# I-preview ang mga pagbabago sa imprastruktura bago ilapat
azd provision --preview

# Para sa rollback ng imprastruktura, gumamit ng version control:
git revert HEAD  # Ibalik ang mga pagbabago sa imprastruktura
azd provision    # Ilapat ang naunang estado ng imprastruktura
```

### Rollback ng Database Migration
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Mga Sukatan ng Pag-deploy

### Subaybayan ang Performance ng Pag-deploy
```bash
# Tingnan ang kasalukuyang katayuan ng deployment
azd show

# Subaybayan ang aplikasyon gamit ang Application Insights
azd monitor --overview

# Tingnan ang mga live na metrics
azd monitor --live
```

### Pagkolekta ng Custom Metrics
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

## 🎯 Mga Pinakamahusay na Kasanayan

### 1. Konsistensya ng Environment
```bash
# Gumamit ng magkakatugmang pangalan
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Panatilihin ang pagkakapareho ng mga kapaligiran
./scripts/sync-environments.sh
```

### 2. Pag-beripika ng Imprastruktura
```bash
# Paunang tingnan ang mga pagbabago sa imprastruktura bago i-deploy
azd provision --preview

# Gumamit ng linting para sa ARM/Bicep
az bicep lint --file infra/main.bicep

# Suriin ang syntax ng Bicep
az bicep build --file infra/main.bicep
```

### 3. Integrasyon ng Testing
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

### 4. Dokumentasyon at Logging
```bash
# Idokumento ang mga pamamaraan ng pag-deploy
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Susunod na Mga Hakbang

- [Provisioning Resources](provisioning.md) - Masusing pagtalakay sa pamamahala ng imprastruktura
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Planuhin ang iyong deployment strategy
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Lutasin ang mga isyu sa pag-deploy
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Mga production-ready na strategy ng pag-deploy

## 🎯 Mga Hands-On na Ehersisyo sa Pag-deploy

### Ehersisyo 1: Incremental Deployment Workflow (20 minuto)
**Layunin**: Ma-master ang pagkakaiba sa pagitan ng full at incremental deployments

```bash
# Paunang pag-deploy
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Itala ang oras ng paunang pag-deploy
echo "Full deployment: $(date)" > deployment-log.txt

# Gumawa ng pagbabago sa kodigo
echo "// Updated $(date)" >> src/api/src/server.js

# I-deploy lamang ang kodigo (mabilis)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Ihambing ang mga oras
cat deployment-log.txt

# Linisin
azd down --force --purge
```

**Kriteria ng Tagumpay:**
- [ ] Ang full deployment ay tumatagal ng 5-15 minuto
- [ ] Ang code-only deployment ay tumatagal ng 2-5 minuto
- [ ] Ang mga pagbabago sa code ay naipapakita sa na-deploy na app
- [ ] Hindi nagbabago ang imprastruktura pagkatapos ng `azd deploy`

**Kinalabasan ng Pag-aaral**: Ang `azd deploy` ay 50-70% mas mabilis kaysa sa `azd up` para sa mga pagbabago sa code

### Ehersisyo 2: Custom Deployment Hooks (30 minuto)
**Layunin**: Magpatupad ng pre at post-deployment automation

```bash
# Gumawa ng script para sa pag-validate bago i-deploy
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Suriin kung pumapasa ang mga test
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Suriin kung may mga hindi pa naka-commit na pagbabago
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Gumawa ng smoke test pagkatapos i-deploy
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

# Magdagdag ng mga hook sa azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Subukan ang pag-deploy gamit ang mga hook
azd deploy
```

**Kriteria ng Tagumpay:**
- [ ] Tumakbo ang pre-deploy script bago ang deployment
- [ ] Humihinto ang deployment kung pumalya ang mga tests
- [ ] Nivavalida ng post-deploy smoke test ang kalusugan
- [ ] Naitutupad ang mga hooks sa tamang pagkakasunod-sunod

### Ehersisyo 3: Estratehiya ng Multi-Environment na Pag-deploy (45 minuto)
**Layunin**: Magpatupad ng staged deployment workflow (dev → staging → production)

```bash
# Gumawa ng script ng deployment
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Hakbang 1: I-deploy sa dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Hakbang 2: I-deploy sa staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Hakbang 3: Manwal na pag-apruba para sa production
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

# Gumawa ng mga environment
azd env new dev
azd env new staging
azd env new production

# Patakbuhin ang staged deployment
./deploy-staged.sh
```

**Kriteria ng Tagumpay:**
- [ ] Matagumpay na nade-deploy ang dev environment
- [ ] Matagumpay na nade-deploy ang staging environment
- [ ] Kailangan ang manual approval para sa production
- [ ] May gumaganang health checks ang lahat ng environment
- [ ] Maaaring mag-roll back kung kinakailangan

### Ehersisyo 4: Estratehiya ng Rollback (25 minuto)
**Layunin**: Magpatupad at subukan ang rollback ng deployment gamit ang Git

```bash
# I-deploy ang v1
azd env set APP_VERSION "1.0.0"
azd up

# I-save ang commit hash ng v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# I-deploy ang v2 na may breaking change
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Tuklasin ang pagkabigo at i-rollback
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # I-rollback gamit ang git
    git revert HEAD --no-edit
    
    # I-rollback ang environment
    azd env set APP_VERSION "1.0.0"
    
    # I-deploy muli ang v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteria ng Tagumpay:**
- [ ] Kayang madetect ang mga pagkabigo sa deployment
- [ ] Awtomatikong tumatakbo ang rollback script
- [ ] Bumabalik sa gumaganang estado ang aplikasyon
- [ ] Nagpa-pasa ang health checks pagkatapos ng rollback

## 📊 Pagsubaybay ng Mga Sukatan ng Pag-deploy

### Subaybayan ang Performance ng Iyong Pag-deploy

```bash
# Gumawa ng script para sa mga metric ng deployment
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

# Mag-log sa file
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Gamitin ito
./track-deployment.sh
```

**Analisa ang iyong mga sukatan:**
```bash
# Tingnan ang kasaysayan ng pag-deploy
cat deployment-metrics.csv

# Kalkulahin ang karaniwang oras ng pag-deploy
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Karagdagang Mga Mapagkukunan

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Pag-navigate**
- **Nakaraang Aralin**: [Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **Susunod na Aralin**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->