<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-10-11T15:58:59+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "ta"
}
-->
# Deployment Guide - AZD Deployments கற்றல்

**அத்தியாய வழிகாட்டி:**
- **📚 பாடம் முகப்பு**: [AZD ஆரம்பக்கட்டம்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 4 - கோடாக் கட்டமைப்பு மற்றும் வெளியீடு
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../getting-started/configuration.md)
- **➡️ அடுத்தது**: [வளங்களை உருவாக்குதல்](provisioning.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 5: பல முகவர் AI தீர்வுகள்](../../examples/retail-scenario.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி, Azure Developer CLI-யை பயன்படுத்தி பயன்பாடுகளை வெளியிடுவதற்கான அனைத்து தகவல்களையும் உள்ளடக்கியது. இது அடிப்படை ஒரே கட்டளைகளிலிருந்து தொடங்கி, முன்னேற்றமான உற்பத்தி சூழல்களில் தனிப்பயன் hooks, பல சூழல்கள் மற்றும் CI/CD ஒருங்கிணைப்புடன் கூடிய முறைகளை கற்றுக்கொடுக்கிறது. நடைமுறை உதாரணங்கள் மற்றும் சிறந்த நடைமுறைகளுடன் முழு வெளியீட்டு வாழ்க்கைச்சுழற்சியை கற்றுக்கொள்ளுங்கள்.

## கற்றல் இலக்குகள்

இந்த வழிகாட்டியை முடிக்கும்போது, நீங்கள்:
- Azure Developer CLI வெளியீட்டு கட்டளைகள் மற்றும் வேலைவழிகளை முழுமையாக கற்றுக்கொள்வீர்கள்
- வெளியீட்டு வாழ்க்கைச்சுழற்சியை உருவாக்குதல் முதல் கண்காணிப்பு வரை முழுமையாக புரிந்துகொள்வீர்கள்
- வெளியீட்டுக்கு முன் மற்றும் பின் தானியங்க hooks-ஐ செயல்படுத்துவீர்கள்
- சூழல்-குறிப்பிட்ட அளவுருக்களுடன் பல சூழல்களை அமைப்பீர்கள்
- முன்னேற்றமான வெளியீட்டு உத்திகளை அமைப்பீர்கள், அதில் blue-green மற்றும் canary வெளியீடுகள் அடங்கும்
- azd வெளியீட்டுகளை CI/CD குழாய்கள் மற்றும் DevOps வேலைவழிகளுடன் ஒருங்கிணைப்பீர்கள்

## கற்றல் முடிவுகள்

வழிகாட்டியை முடித்தவுடன், நீங்கள்:
- azd வெளியீட்டு வேலைவழிகளை சுயமாக செயல்படுத்தவும் மற்றும் சிக்கல்களை தீர்க்கவும்
- hooks-ஐ பயன்படுத்தி தனிப்பயன் வெளியீட்டு தானியங்கத்தை வடிவமைக்கவும் மற்றும் செயல்படுத்தவும்
- பாதுகாப்பு மற்றும் கண்காணிப்புடன் தயாராக உள்ள உற்பத்தி வெளியீட்டுகளை அமைக்கவும்
- சிக்கலான பல சூழல் வெளியீட்டு சூழல்களை நிர்வகிக்கவும்
- வெளியீட்டு செயல்திறனை மேம்படுத்தவும் மற்றும் திரும்பப்பெறல் உத்திகளை செயல்படுத்தவும்
- azd வெளியீட்டுகளை நிறுவன DevOps நடைமுறைகளுடன் ஒருங்கிணைக்கவும்

## வெளியீட்டு மேற்பார்வை

Azure Developer CLI பல வெளியீட்டு கட்டளைகளை வழங்குகிறது:
- `azd up` - முழு வேலைவழி (உருவாக்குதல் + வெளியீடு)
- `azd provision` - Azure வளங்களை உருவாக்க/மேம்படுத்த மட்டும்
- `azd deploy` - பயன்பாட்டு குறியீட்டை வெளியிட மட்டும்
- `azd package` - பயன்பாடுகளை கட்டமைக்கவும் மற்றும் தொகுப்பாக்கம் செய்யவும்

## அடிப்படை வெளியீட்டு வேலைவழிகள்

### முழுமையான வெளியீடு (azd up)
புதிய திட்டங்களுக்கு பொதுவான வேலைவழி:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### கட்டமைப்பு மட்டும் வெளியீடு
Azure வளங்களை மேம்படுத்த மட்டுமே தேவைப்படும் போது:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### குறியீடு மட்டும் வெளியீடு
விரைவான பயன்பாட்டு மேம்பாடுகளுக்கு:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ வெளியீட்டு செயல்முறையை புரிந்துகொள்வது

### கட்டம் 1: வெளியீட்டுக்கு முன் hooks
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

### கட்டம் 2: கட்டமைப்பு உருவாக்குதல்
- கட்டமைப்பு டெம்ப்ளேட்களை (Bicep/Terraform) படிக்கிறது
- Azure வளங்களை உருவாக்குகிறது அல்லது மேம்படுத்துகிறது
- நெட்வொர்க்கிங் மற்றும் பாதுகாப்பை அமைக்கிறது
- கண்காணிப்பு மற்றும் பதிவு அமைப்புகளை அமைக்கிறது

### கட்டம் 3: உருவாக்கத்திற்குப் பின் hooks
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

### கட்டம் 4: பயன்பாட்டு தொகுப்பாக்கம்
- பயன்பாட்டு குறியீட்டை கட்டமைக்கிறது
- வெளியீட்டு பொருட்களை உருவாக்குகிறது
- இலக்கு தளத்திற்கான தொகுப்புகளை (கண்டெய்னர்கள், ZIP கோப்புகள், முதலியன) உருவாக்குகிறது

### கட்டம் 5: வெளியீட்டுக்கு முன் hooks
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

### கட்டம் 6: பயன்பாட்டு வெளியீடு
- தொகுப்பாக்கப்பட்ட பயன்பாடுகளை Azure சேவைகளுக்கு வெளியிடுகிறது
- கட்டமைப்பு அமைப்புகளை மேம்படுத்துகிறது
- சேவைகளை தொடங்குகிறது/மீண்டும் தொடங்குகிறது

### கட்டம் 7: வெளியீட்டிற்குப் பின் hooks
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

## 🎛️ வெளியீட்டு கட்டமைப்பு

### சேவை-குறிப்பிட்ட வெளியீட்டு அமைப்புகள்
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

### சூழல்-குறிப்பிட்ட கட்டமைப்புகள்
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

## 🔧 முன்னேற்றமான வெளியீட்டு சூழல்கள்

### பல சேவை பயன்பாடுகள்
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

### Blue-Green வெளியீடுகள்
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

### Canary வெளியீடுகள்
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

### நிலை வெளியீடுகள்
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

## 🐳 கண்டெய்னர் வெளியீடுகள்

### கண்டெய்னர் பயன்பாட்டு வெளியீடுகள்
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

### பல கட்ட Dockerfile மேம்பாடு
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

## ⚡ செயல்திறன் மேம்பாடு

### இணை வெளியீடுகள்
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### கட்டமைப்பு கேஷிங்
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

### படிநிலை வெளியீடுகள்
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 வெளியீட்டு கண்காணிப்பு

### நேரடி வெளியீட்டு கண்காணிப்பு
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### ஆரோக்கிய சோதனைகள்
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

### வெளியீட்டிற்குப் பின் சரிபார்ப்பு
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

## 🔐 பாதுகாப்பு கருத்துக்கள்

### ரகசிய மேலாண்மை
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

### நெட்வொர்க் பாதுகாப்பு
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### அடையாளம் மற்றும் அணுகல் மேலாண்மை
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

## 🚨 திரும்பப்பெறல் உத்திகள்

### விரைவான திரும்பப்பெறல்
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### கட்டமைப்பு திரும்பப்பெறல்
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### தரவுத்தொகை மாற்றம் திரும்பப்பெறல்
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 வெளியீட்டு அளவுருக்கள்

### வெளியீட்டு செயல்திறனை கண்காணிக்கவும்
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### தனிப்பயன் அளவுருக்கள் சேகரிப்பு
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

## 🎯 சிறந்த நடைமுறைகள்

### 1. சூழல் நிலைத்தன்மை
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. கட்டமைப்பு சரிபார்ப்பு
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. ஒருங்கிணைப்பு சோதனை
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

### 4. ஆவணப்படுத்தல் மற்றும் பதிவு
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## அடுத்த படிகள்

- [வளங்களை உருவாக்குதல்](provisioning.md) - கட்டமைப்பு மேலாண்மையில் ஆழமான பார்வை
- [வெளியீட்டுக்கு முன் திட்டமிடல்](../pre-deployment/capacity-planning.md) - உங்கள் வெளியீட்டு உத்தியை திட்டமிடுங்கள்
- [பொதுவான சிக்கல்கள்](../troubleshooting/common-issues.md) - வெளியீட்டு சிக்கல்களை தீர்க்கவும்
- [சிறந்த நடைமுறைகள்](../troubleshooting/debugging.md) - உற்பத்தி-தயார் வெளியீட்டு உத்திகள்

## கூடுதல் வளங்கள்

- [Azure Developer CLI வெளியீட்டு குறிப்புகள்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service வெளியீடு](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps வெளியீடு](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions வெளியீடு](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**வழிகாட்டி**
- **முந்தைய பாடம்**: [உங்கள் முதல் திட்டம்](../getting-started/first-project.md)
- **அடுத்த பாடம்**: [வளங்களை உருவாக்குதல்](provisioning.md)

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கின்றோம், ஆனால் தானியக்க மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.