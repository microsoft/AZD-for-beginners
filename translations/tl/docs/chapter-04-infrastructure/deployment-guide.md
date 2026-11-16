# Gabay sa Deployment - Paghahasa sa AZD Deployments

**Pag-navigate sa Kabanata:**
- **📚 Bahay ng Kurso**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 4 - Infrastructure as Code at Deployment
- **⬅️ Nakaraang Kabanata**: [Kabanata 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Susunod**: [Provisioning Resources](provisioning.md)
- **🧩 Kasama rin sa kabanatang ito**: [Pagsusulat ng Sariling Template](custom-templates.md)
- **🚀 Susunod na Kabanata**: [Kabanata 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Panimula

> Sinuri laban sa `azd 1.37.2` (Nobyembre 2026). Ang mga utos ay gumagamit ng Bash; ang mga halimbawa ng JSON ay nangangailangan ng `jq`. Maliban sa tahasang inisyalisadong todo exercise, ang mga advanced na halimbawa ay **integration fragments**: magbigay ng sarili mong source, infrastructure, mga pagsubok, at mga script. Walang Azure deployments ang isinagawa sa pagsusuring ito.

Sinasaklaw ng komprehensibong gabay na ito ang lahat ng kailangan mong malaman tungkol sa pag-deploy ng mga aplikasyon gamit ang Azure Developer CLI, mula sa mga simpleng deployment gamit ang isang utos hanggang sa mga advanced na production scenario na may custom hooks, maraming environment, at integrasyon ng CI/CD. Masterin ang buong lifecycle ng deployment gamit ang mga praktikal na halimbawa at pinakamahusay na mga gawi.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng gabay na ito, magagawa mong:
- Masterin ang lahat ng Azure Developer CLI deployment na utos at workflows
- Maunawaan ang kumpletong lifecycle ng deployment mula provisioning hanggang pagmo-monitor
- Magpatupad ng mga custom deployment hooks para sa pre at post-deployment na automation
- I-configure ang maraming environment gamit ang mga partikular na parameter ng kapaligiran
- Mag-set up ng mga advanced deployment strategy kabilang ang blue-green at canary deployments
- I-integrate ang azd deployments sa CI/CD pipelines at DevOps workflows

## Mga Kinalabasan ng Pagkatuto

Sa pagtatapos, magagawa mong:
- Isagawa at ayusin ang lahat ng azd deployment workflows nang mag-isa
- Magdisenyo at magpatupad ng custom deployment automation gamit ang hooks
- I-configure ang production-ready na deployments na may tamang seguridad at pagmo-monitor
- Pangasiwaan ang kumplikadong multi-environment deployment scenarios
- I-optimize ang performance ng deployment at magpatupad ng mga rollback strategy
- I-integrate ang azd deployments sa mga enterprise DevOps practices

## Pangkalahatang Pagsusuri ng Deployment

Nagbibigay ang Azure Developer CLI ng ilang deployment na utos:
- `azd up` - Kumpletong workflow (provision + deploy)
- `azd provision` - Gumawa/update ng mga Azure resource lamang
- `azd deploy` - I-deploy ang application code lamang
- `azd package` - I-build at i-package ang mga application

## Mga Pangunahing Workflow ng Deployment

### Kumpletong Deployment (azd up)
Ang pinaka-karaniwang workflow para sa mga bagong proyekto:
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

### Infrastructure-Only Deployment
Kapag kailangan mo lamang i-update ang mga Azure resource:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Code-Only Deployment
Para sa mabilisang pag-update ng aplikasyon:
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

### ✅ Pag-verify ng Deployment

Pagkatapos ng anumang deployment, tiyaking matagumpay ito:

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

**Mga Pamantayan sa Tagumpay:**
- ✅ `azd show` ay nagreresolba ng mga inaasahang target ng serbisyo/URL
- ✅ Ang mga kahilingan sa totoong mga ruta ng aplikasyon ay nagbabalik ng inaasahang status at katawan
- ✅ Walang error logs sa nakaraang 5 minuto
- ✅ Tumutugon ang aplikasyon sa mga test na kahilingan

## 🏗️ Pag-unawa sa Proseso ng Deployment

### Bago ka sa hooks? Magsimula dito

Ang **hook** ay isang utos na awtomatikong pinapatakbo ng azd sa isang espesipikong pagkakataon sa proseso ng deployment—bago o pagkatapos ng provisioning, at bago o pagkatapos ng pag-deploy ng iyong code. Pinapayagan ka nitong i-automate ang mga maliliit na gawain na palaging nakakabit sa deployment: pag-seed ng database, pagpapatakbo ng mga migration, pagbuo ng mga assets, o smoke-testing ng live app.

| Hook | Pinapatakbo… | Karaniwang gamit |
|------|-------|------------|
| `preprovision` | Bago malikha ang mga resource | I-validate ang mga pangangailangan, mag-login sa isang registry |
| `postprovision` | Pagkatapos na umiral ang mga resource | I-configure ang mga resource, i-set up ang database |
| `predeploy` | Bago i-deploy ang code | Mag-build ng front-end assets, patakbuhin ang mga unit test |
| `postdeploy` | Pagkatapos buhay na ang code | Patakbuhin ang mga DB migration, smoke-test ang endpoint |

Ang mga hook ay nasa loob ng iyong `azure.yaml`. Narito ang pinakamaliit na posibleng halimbawa—nagpi-print lamang ito ng mensahe pagkatapos ng deployment:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Iyon lang—sa susunod na patakbuhin mo ang `azd up`, awtomatikong magpi-print ang mensahe. Maaari mo ring patakbuhin ang isang hook nang mag-isa, nang walang buong deploy, na mainam para sa testing:

```bash
azd hooks run postdeploy
```

Ang mga phase sa ibaba ay nagpapakita ng mga totoong mundo na hook (migrations, mga pagsubok, pag-validate) para sa bawat yugto.

### Phase 1: Mga Pre-Provision Hook
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

### Phase 2: Infrastructure Provisioning
- Binabasa ang mga template ng infrastructure (Bicep/Terraform)
- Lumilikha o nag-a-update ng mga Azure resource
- Naga-configure ng networking at seguridad
- Nagse-set up ng pagmo-monitor at pag-log

### Phase 3: Mga Post-Provision Hook
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

### Phase 4: Pag-pack ng Aplikasyon
- Nagbubuo ng code ng aplikasiyon
- Lumilikha ng mga deployment artifact
- Nagpa-package para sa target na plataporma (containers, ZIP files, atbp.)

### Phase 5: Mga Pre-Deploy Hook
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

### Phase 6: Deployment ng Aplikasyon
- Nagde-deploy ng naka-package na mga aplikasyon sa Azure services
- Nag-a-update ng mga configuration settings
- Nagpapatakbo/muling nagsisimula ng mga serbisyo

### Phase 7: Mga Post-Deploy Hook
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

### Paghawak sa Mga Error ng Hook

Sa default, **kung ang isang hook command ay lumabas na may non-zero na code, ititigil ng azd ang buong operasyon.** Karaniwan, iyon ang nais mo—ang isang nabigong migration ay dapat huminto sa deployment, hindi magpadala ng sirang app. Ngunit nangangahulugan ito na kailangang maingat ang pagsulat ng mga hook.

**1. Gumawing malakas at sinasadya ang mga pagkabigo.** Nabibigo ang hook kapag ang huling utos nito ay nagbalik ng non-zero na exit code. Sa mga shell script, magdagdag ng `set -e` upang huminto ang hook sa unang nabigong utos kaysa magpatuloy nang tahimik:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Pahintulutan ang hook na mabigo nang hindi humihinto ang azd.** Para sa mga non-critical na hakbang (opsyonal na cache warm-up, best-effort na notification), itakda ang `continueOnError: true`. Nilo-log ng azd ang pagkabigo ngunit nagpapatuloy:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Subukan ang mga hook nang hiwalay bago ang buong takbo.** Hindi mo kailangang patakbuhin ang `azd up` para i-debug ang isang hook—patakbuhin ito nang mag-isa at mabilis na mag-iterate:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Mag-ingat sa mga OS-specific shell.** Ang hook na gumagamit ng `shell: pwsh` ay nangangailangan ng naka-install na PowerShell sa makinang nagpapatakbo nito (kabilang na ang mga CI agents). Gumamit ng `shell: sh` para sa pinakamalawak na portability, o magbigay ng parehong `windows` at `posix` na variant:

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

> **Tip sa pag-debug:** patakbuhin ang anumang azd na utos na may `--debug` upang makita ang eksaktong hook command line at buong output nito—napakahalaga kapag ang isang hook ay gumagana nang lokal ngunit nabibigo sa CI.

## 🎛️ Pag-configure ng Deployment

### Mga Partikular na Setting sa Deployment ng Serbisyo
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

### Mga Configuration na Nakalaan sa Kapaligiran

Ito ay mga lokal na halaga lang ng azd. Tahasang i-map ang mga ito sa configuration ng infrastructure/runtime. Ang `NODE_ENV` ay karaniwang `production` para sa isang na-deploy na Node app, kabilang ang staging deployment; gumamit ng hiwalay na app-specific na variable upang makilala ang mga yugto ng deployment.

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

## 🔧 Mga Advanced na Scenario ng Deployment

### Mga Aplikasyong Multi-Serbisyo
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

**Halimbawa ng sketch ng operasyon:** kailangan mong mag-supply ng parehong environment, isang shared na traffic-routing layer, at ang dalawang script sa ibaba. Hindi awtomatikong nagsiswitch ang azd ng traffic o niverify ang readiness ng rollback. Panatilihin ang green hanggang pumasa sa testing ang blue at hindi na kailangan ang rollback.

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

### Canary Deployments
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Ang paghahati ng traffic ay bahagi ng configuration ng Container Apps (Bicep o Azure CLI), hindi isang `azure.yaml` `trafficSplit` na propiedad. Dapat mapanatili ng preview/provisioning at mga kasunod na deployment ang napiling kung paano i-revise at mga patakaran sa routing.

### Staged Deployments
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

## 🐳 Mga Container Deployment

### Container App Deployments
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

I-configure ang mga runtime secret gamit ang `configuration.secrets`/`secretRef` (o Key Vault references) at scaling gamit ang `template.scale` sa Container App infrastructure. Huwag gumawa ng mga service-level na `secrets` o `scale` na propiedad sa `azure.yaml`.

### Multi-Stage Dockerfile Optimization
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

## ⚡ Pag-optimize ng Performance

### Mga Partikular na Deployment ng Serbisyo
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Build Caching
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Ang pangkaraniwan Node workflow ay gumagamit ng mga package script; ang mga service `prepackage` hook ay maaaring magdagdag ng mga kinakailangang hakbang. Ang Docker layer caching ay hiwalay mula sa pagdedeklara ng service build command.

### Mabisang Code Deployment
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Pagmo-monitor ng Deployment

### Real-Time Monitoring ng Deployment
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Health Checks
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

Dapat ipatupad ng iyong app ang `/health`; hindi ito awtomatikong ibinibigay ng azd. Walang generic na `azure.yaml` `healthCheck` service property.

### Pag-validate Pagkatapos ng Deployment
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

## 🔐 Mga Pagsasaalang-alang sa Seguridad

### Pamamahala ng Mga Sekreto
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

Ang `azd env set ... --secret` ay invalid. Ang mga ordinaryong halaga ng kapaligiran ay lokal at plaintext; huwag asumihin na ni-redact sila ng mga read command. Ini-save ng mga utos sa itaas ang mga Key Vault reference, pero kailangang gamitin ng iyong infrastructure/aplikasyon ang mga sekreto at bigyan ng access ang runtime identity.

### Seguridad ng Network
Ideklara at gamitin ang mga parameter ng network sa Bicep, at i-map ang mga ito sa `infra/main.parameters.json`. Walang generic na `infra.parameters` overlay sa `azure.yaml`. Ang dokumentasyon ng halimbawa ay gumagamit ng `203.0.113.0/24` at `198.51.100.0/24` na mga hindi tunay na office/VPN network; palitan ito ng mga awtorisadong network range.

### Pamamahala ng Identity at Access
Paganahin ang `identity` ng Container App sa Bicep at italaga ang kinakailangang Key Vault data-plane role sa saklaw ng vault. I-configure ang mga tinag na Key Vault-backed secrets at runtime references sa resource na iyon; ang `identity` at `keyVault` ay hindi generic na azd service property. Tingnan ang [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Mga Estratehiya sa Rollback

### Mabilis na Rollback
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

### Rollback sa Infrastructure
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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

## 📊 Mga Sukatan ng Deployment

### Subaybayan ang Performance ng Deployment
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Pangongolekta ng Custom Metrics
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

## 🎯 Mga Pinakamahusay na Gawi

### 1. Konsistensi ng Kapaligiran
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Pag-validate ng Infrastructure
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Integrasyon ng Pagsubok
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

### 4. Dokumentasyon at Pag-log
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Susunod na Mga Hakbang

- [Provisioning Resources](provisioning.md) - Malalim na pagsisid sa pamamahala ng infrastructure
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Planuhin ang iyong deployment strategy
- [Mga Karaniwang Isyu](../chapter-07-troubleshooting/common-issues.md) - Ayusin ang mga isyu sa deployment
- [Mga Pinakamahusay na Gawi](../chapter-07-troubleshooting/debugging.md) - Mga production-ready na deployment strategy

## 🎯 Mga Hands-On na Ehersisyo sa Deployment

### Ehersisyo 1: Incremental Deployment Workflow (20 minuto)
**Layunin**: Maiden ang pagkakaiba ng buong deployment at incremental deployment

**Panimulang punto:** Bash, Node.js 22, Git, azd sign-in, at isang Azure subscription na may pahintulot sa deployment. Patakbuhin sa bagong direktoryo; asahan ang billable na App Service/Cosmos DB resources. Ang oras ay nakadepende sa rehiyon at template.

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

**Mga Pamantayan sa Tagumpay:**
- [ ] Irekord ang oras ng pagtakbo para sa parehong utos (walang garantisadong tagal)
- [ ] Matagumpay na natapos ang parehong mga utos
- [ ] Nanatiling functional ang API; ang pag-edit na comment-only ay hindi nakikitang pagbabago sa UI
- [ ] Hindi nagbago ang infrastructure pagkatapos ng `azd deploy`

**Kinalabasan ng Pagkatuto**: `azd deploy` ay nilalaktawan ang provisioning ng infrastructure. Ihambing ang nasukat na oras sa halip na asahang may fixed na porsyento ng pagbilis.

### Ehersisyo 2: Mga Custom na Deployment Hooks (30 minuto)
**Layunin**: Ipatupad ang pre at post-deployment automation

**Panibagong punto:** ang na-initialize na `deployment-practice` proyekto sa itaas. Kung nilinis mo ito, patakbuhin muli ang `azd up` bago subukan ang code-only deployment. Ginagamit ng pag-validate sa ibaba ang aktwal na build script ng API, hindi isang hindi umiiral na root `test:unit` script. Ang mga test ng API ng template ay nangangailangan ng configured database access; hindi ito isolated unit tests.

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

**Mga Pamantayan sa Tagumpay:**
- [ ] Tumakbo ang pre-deploy script bago ang deployment
- [ ] Sumasang-ayon ang deployment kung nabigo ang build validation
- [ ] Pinapatunayan ng post-deploy smoke test ang kalusugan
- [ ] Naipatupad nang tama ang mga hook sa tamang pagkakasunod-sunod

### Ehersisyo 3: Multi-Environment Deployment Strategy (45 minuto)
**Layunin**: Ipatupad ang staged deployment workflow (dev → staging → production)

**Panimulang punto:** ang parehong inisyal na todo project gamit ang `jq`. Gumawa ng mga environment sa ibaba na may totoong subscription/location values (o itakda ang `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` sa bawat isa) **bago** tawagin ang no-prompt workflow. Sinadya nitong mag-fail kaysa gumawa ng mga nawawalang values. Gumamit lamang ng mga disposable na training environment, hindi totoong production subscription.

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

**Pamantayan ng Tagumpay:**
- [ ] Matagumpay na na-deploy ang Dev environment
- [ ] Matagumpay na na-deploy ang Staging environment
- [ ] Kinakailangan ang manual na pag-apruba para sa production
- [ ] Lahat ng mga environment ay may gumaganang health checks
- [ ] Maaaring mag-roll back kung kinakailangan

### Pagsasanay 4: Rollback Strategy (25 minuto)
**Layunin**: Ipatupad at subukan ang deployment rollback gamit ang Git

**Panimulang punto:** isang hiwalay na training checkout ng todo template na may lahat ng baseline source na naisumite, isang malinis na Git working tree, at isang disposable na na-configure na environment. Huwag kailanman magpasok ng sinadyang pagkakamali sa totoong production project. Ang `APP_VERSION` sa ibaba ay bookkeeping lamang maliban kung tahasang i-wire mo ito sa app.

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

**Pamantayan ng Tagumpay:**
- [ ] Kayang matukoy ang mga pagkabigo sa deployment
- [ ] Ang rollback script ay tumatakbo nang awtomatiko
- [ ] Ang application ay bumabalik sa gumaganang estado
- [ ] Pumapasa ang health checks pagkatapos ng rollback

## 📊 Pagsubaybay sa Deployment Metrics

### Subaybayan ang Iyong Deployment Performance

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

**Suriin ang iyong mga metrics:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Karagdagang Mga Mapagkukunan

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Pag-navigate**
- **Nakaraang Aralin**: [Your First Project](../chapter-01-foundation/first-project.md)
- **Susunod na Aralin**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->