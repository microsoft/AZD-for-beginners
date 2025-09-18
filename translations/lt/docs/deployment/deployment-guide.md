<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-18T14:07:52+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "lt"
}
-->
# Diegimo vadovas - AZD diegimų įvaldymas

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 4 skyrius - Infrastruktūra kaip kodas ir diegimas
- **⬅️ Ankstesnis skyrius**: [3 skyrius: Konfigūracija](../getting-started/configuration.md)
- **➡️ Toliau**: [Išteklių paruošimas](provisioning.md)
- **🚀 Kitas skyrius**: [5 skyrius: Daugiaagentės AI sprendimai](../../examples/retail-scenario.md)

## Įvadas

Šis išsamus vadovas apima viską, ką reikia žinoti apie programų diegimą naudojant Azure Developer CLI – nuo paprastų vieno komandos diegimų iki sudėtingų gamybos scenarijų su pritaikytais kabliukais, keliomis aplinkomis ir CI/CD integracija. Įvaldykite visą diegimo ciklą su praktiniais pavyzdžiais ir geriausiomis praktikomis.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Įvaldysite visas Azure Developer CLI diegimo komandas ir darbo eigas
- Suprasite visą diegimo ciklą nuo paruošimo iki stebėjimo
- Įgyvendinsite pritaikytus diegimo kabliukus automatizavimui prieš ir po diegimo
- Konfigūruosite kelias aplinkas su specifiniais aplinkos parametrais
- Nustatysite pažangias diegimo strategijas, įskaitant „blue-green“ ir „canary“ diegimus
- Integruosite azd diegimus su CI/CD vamzdynais ir DevOps darbo eigomis

## Mokymosi rezultatai

Baigę, galėsite:
- Savarankiškai vykdyti ir šalinti visų azd diegimo darbo eigų problemas
- Kurti ir įgyvendinti pritaikytą diegimo automatizavimą naudojant kabliukus
- Konfigūruoti gamybai paruoštus diegimus su tinkamu saugumu ir stebėjimu
- Valdyti sudėtingus kelių aplinkų diegimo scenarijus
- Optimizuoti diegimo našumą ir įgyvendinti atsisakymo strategijas
- Integruoti azd diegimus į įmonės DevOps praktikas

## Diegimo apžvalga

Azure Developer CLI siūlo kelias diegimo komandas:
- `azd up` - Pilna darbo eiga (paruošimas + diegimas)
- `azd provision` - Tik Azure išteklių kūrimas/atnaujinimas
- `azd deploy` - Tik programos kodo diegimas
- `azd package` - Programų kūrimas ir paketavimas

## Pagrindinės diegimo darbo eigos

### Pilnas diegimas (azd up)
Dažniausiai naudojama darbo eiga naujiems projektams:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Tik infrastruktūros diegimas
Kai reikia atnaujinti tik Azure išteklius:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Tik kodo diegimas
Greiti programos atnaujinimai:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Diegimo proceso supratimas

### 1 fazė: Kabliukai prieš paruošimą
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

### 2 fazė: Infrastruktūros paruošimas
- Skaito infrastruktūros šablonus (Bicep/Terraform)
- Kuria arba atnaujina Azure išteklius
- Konfigūruoja tinklus ir saugumą
- Nustato stebėjimą ir žurnalavimą

### 3 fazė: Kabliukai po paruošimo
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

### 4 fazė: Programos paketavimas
- Kuria programos kodą
- Sukuria diegimo artefaktus
- Pakuoja tikslinei platformai (konteineriai, ZIP failai ir kt.)

### 5 fazė: Kabliukai prieš diegimą
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

### 6 fazė: Programos diegimas
- Diegia supakuotas programas į Azure paslaugas
- Atnaujina konfigūracijos nustatymus
- Paleidžia/perkrauna paslaugas

### 7 fazė: Kabliukai po diegimo
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

## 🎛️ Diegimo konfigūracija

### Paslaugai specifiniai diegimo nustatymai
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

### Aplinkai specifinės konfigūracijos
```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Pažangūs diegimo scenarijai

### Kelių paslaugų programos
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

### „Blue-Green“ diegimai
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

### „Canary“ diegimai
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

### Etapinis diegimas
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

## 🐳 Konteinerių diegimai

### Konteinerių programų diegimai
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

### Daugiaetapė Dockerfile optimizacija
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

## ⚡ Našumo optimizavimas

### Lygiagretūs diegimai
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Kūrimo talpyklos
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

### Inkrementiniai diegimai
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Diegimo stebėjimas

### Realaus laiko diegimo stebėjimas
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### Sveikatos patikrinimai
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

### Patikrinimas po diegimo
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Check application health
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

## 🔐 Saugumo aspektai

### Slaptų duomenų valdymas
```bash
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
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

### Tinklo saugumas
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Tapatybės ir prieigos valdymas
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

## 🚨 Atsisakymo strategijos

### Greitas atsisakymas
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Infrastruktūros atsisakymas
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Duomenų bazės migracijos atsisakymas
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Diegimo metrika

### Diegimo našumo stebėjimas
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Individualių metrikų rinkimas
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

## 🎯 Geriausios praktikos

### 1. Aplinkos nuoseklumas
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Infrastruktūros patikrinimas
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Testavimo integracija
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

### 4. Dokumentacija ir žurnalavimas
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Kiti žingsniai

- [Išteklių paruošimas](provisioning.md) - Išsamus infrastruktūros valdymo vadovas
- [Planuojant diegimą](../pre-deployment/capacity-planning.md) - Planuokite savo diegimo strategiją
- [Dažnos problemos](../troubleshooting/common-issues.md) - Spręskite diegimo problemas
- [Geriausios praktikos](../troubleshooting/debugging.md) - Gamybai paruoštos diegimo strategijos

## Papildomi ištekliai

- [Azure Developer CLI diegimo nuoroda](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service diegimas](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps diegimas](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions diegimas](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Ankstesnė pamoka**: [Jūsų pirmasis projektas](../getting-started/first-project.md)
- **Kita pamoka**: [Išteklių paruošimas](provisioning.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.