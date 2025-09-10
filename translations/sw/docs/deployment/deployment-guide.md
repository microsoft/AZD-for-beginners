<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-10T06:16:13+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "sw"
}
-->
# Mwongozo wa Utekelezaji - Kuweza Kusimamia Utekelezaji wa AZD

## Utangulizi

Mwongozo huu wa kina unashughulikia kila kitu unachohitaji kujua kuhusu kusimamia programu kwa kutumia Azure Developer CLI, kuanzia utekelezaji wa amri moja hadi hali za juu za uzalishaji zenye hooks maalum, mazingira mengi, na ujumuishaji wa CI/CD. Jifunze mzunguko mzima wa utekelezaji kwa mifano ya vitendo na mbinu bora.

## Malengo ya Kujifunza

Kwa kukamilisha mwongozo huu, utaweza:
- Kuelewa amri zote za utekelezaji za Azure Developer CLI na mtiririko wa kazi
- Kuelewa mzunguko mzima wa utekelezaji kuanzia utoaji hadi ufuatiliaji
- Kutekeleza hooks maalum za utekelezaji kwa ajili ya otomatiki kabla na baada ya utekelezaji
- Kuseti mazingira mengi yenye vigezo maalum kwa kila mazingira
- Kuanzisha mikakati ya juu ya utekelezaji ikiwemo blue-green na canary deployments
- Kujumuisha utekelezaji wa azd na CI/CD pamoja na mtiririko wa kazi wa DevOps

## Matokeo ya Kujifunza

Baada ya kukamilisha, utaweza:
- Kutekeleza na kutatua changamoto za mtiririko wa kazi wa utekelezaji wa azd kwa uhuru
- Kubuni na kutekeleza otomatiki ya utekelezaji maalum kwa kutumia hooks
- Kuseti utekelezaji wa kiwango cha uzalishaji wenye usalama na ufuatiliaji sahihi
- Kusimamia hali ngumu za utekelezaji katika mazingira mengi
- Kuboresha utendaji wa utekelezaji na kutekeleza mikakati ya kurudisha hali ya awali
- Kujumuisha utekelezaji wa azd katika mazoea ya DevOps ya biashara

## Muhtasari wa Utekelezaji

Azure Developer CLI inatoa amri kadhaa za utekelezaji:
- `azd up` - Mtiririko kamili (utoaji + utekelezaji)
- `azd provision` - Kuunda/kusasisha rasilimali za Azure pekee
- `azd deploy` - Kusimamia tu msimbo wa programu
- `azd package` - Kujenga na kufunga programu

## Mtiririko wa Kazi wa Msingi wa Utekelezaji

### Utekelezaji Kamili (azd up)
Mtiririko wa kawaida kwa miradi mipya:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Utoaji wa Miundombinu Pekee
Wakati unahitaji tu kusasisha rasilimali za Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Utekelezaji wa Msimbo Pekee
Kwa sasisho za haraka za programu:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Kuelewa Mchakato wa Utekelezaji

### Awamu ya 1: Hooks Kabla ya Utoaji
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

### Awamu ya 2: Utoaji wa Miundombinu
- Husoma templates za miundombinu (Bicep/Terraform)
- Huunda au kusasisha rasilimali za Azure
- Huseti mitandao na usalama
- Huanzisha ufuatiliaji na kurekodi

### Awamu ya 3: Hooks Baada ya Utoaji
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

### Awamu ya 4: Kufunga Programu
- Huunda msimbo wa programu
- Huunda artifacts za utekelezaji
- Hufunga kwa jukwaa lengwa (containers, faili za ZIP, nk.)

### Awamu ya 5: Hooks Kabla ya Utekelezaji
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

### Awamu ya 6: Utekelezaji wa Programu
- Husimamia programu zilizofungwa kwenye huduma za Azure
- Husasisha mipangilio ya usanidi
- Huanzisha/kusimamisha huduma

### Awamu ya 7: Hooks Baada ya Utekelezaji
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

## 🎛️ Usanidi wa Utekelezaji

### Mipangilio Maalum ya Huduma
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

### Usanidi Maalum wa Mazingira
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

## 🔧 Hali za Juu za Utekelezaji

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

### Utekelezaji wa Hatua kwa Hatua
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

### Utekelezaji wa Programu za Container
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

### Uboreshaji wa Dockerfile ya Hatua Nyingi
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

### Utekelezaji Sambamba
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Caching ya Kujenga
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

### Utekelezaji wa Kiongezeko
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Ufuatiliaji wa Utekelezaji

### Ufuatiliaji wa Utekelezaji wa Wakati Halisi
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### Ukaguzi wa Afya
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

### Uthibitishaji Baada ya Utekelezaji
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

## 🔐 Masuala ya Usalama

### Usimamizi wa Siri
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

### Utambulisho na Usimamizi wa Ufikiaji
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

## 🚨 Mikakati ya Kurudisha Hali ya Awali

### Kurudisha Haraka
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Kurudisha Miundombinu
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Kurudisha Uhamishaji wa Hifadhidata
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

### Kufuatilia Utendaji wa Utekelezaji
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
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

### 1. Uthabiti wa Mazingira
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
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Ujumuishaji wa Upimaji
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

### 4. Uandishi wa Nyaraka na Kurekodi
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Hatua Zifuatazo

- [Utoaji wa Rasilimali](provisioning.md) - Uchambuzi wa kina wa usimamizi wa miundombinu
- [Mipango Kabla ya Utekelezaji](../pre-deployment/capacity-planning.md) - Panga mkakati wako wa utekelezaji
- [Masuala ya Kawaida](../troubleshooting/common-issues.md) - Suluhisha changamoto za utekelezaji
- [Mbinu Bora](../troubleshooting/debugging.md) - Mikakati ya utekelezaji wa kiwango cha uzalishaji

## Rasilimali za Ziada

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Urambazaji**
- **Somo la Awali**: [Mradi Wako wa Kwanza](../getting-started/first-project.md)
- **Somo Linalofuata**: [Utoaji wa Rasilimali](provisioning.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, inashauriwa kutumia huduma ya tafsiri ya kitaalamu ya binadamu. Hatutawajibika kwa maelewano mabaya au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.