<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-18T13:22:24+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "my"
}
-->
# Deployment Guide - AZD Deployments ကို ကျွမ်းကျင်စွာ အသုံးချခြင်း

**အခန်းများ လမ်းညွှန်:**
- **📚 သင်ခန်းစာ မူလစာမျက်နှာ**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 4 - Infrastructure as Code & Deployment
- **⬅️ ယခင် အခန်း**: [အခန်း 3: Configuration](../getting-started/configuration.md)
- **➡️ နောက်တစ်ခု**: [Provisioning Resources](provisioning.md)
- **🚀 နောက်အခန်း**: [အခန်း 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## အကျဉ်းချုပ်

ဒီလမ်းညွှန်မှာ Azure Developer CLI ကို အသုံးပြုပြီး application များကို deploy လုပ်ခြင်းဆိုင်ရာ အခြေခံ single-command deployment မှ custom hooks, အမျိုးမျိုးသော environment များ, CI/CD integration အထိ အဆင့်မြင့် production scenario များအထိ အားလုံးကို လေ့လာနိုင်ပါမည်။ လက်တွေ့ နမူနာများနှင့် အကောင်းဆုံး လုပ်နည်းများကို အသုံးပြု၍ deployment lifecycle အားလုံးကို ကျွမ်းကျင်စွာ လေ့လာနိုင်ပါမည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီလမ်းညွှန်ကို ပြီးမြောက်ပါက:
- Azure Developer CLI deployment command များနှင့် workflow များကို ကျွမ်းကျင်စွာ အသုံးပြုနိုင်မည်
- Provisioning မှ monitoring အထိ deployment lifecycle အားလုံးကို နားလည်နိုင်မည်
- Pre နှင့် Post-deployment automation အတွက် custom deployment hooks များကို အသုံးပြုနိုင်မည်
- Environment-specific parameters များဖြင့် အမျိုးမျိုးသော environment များကို configure လုပ်နိုင်မည်
- Blue-green နှင့် canary deployment များအပါအဝင် အဆင့်မြင့် deployment strategy များကို အကောင်အထည်ဖော်နိုင်မည်
- azd deployment များကို CI/CD pipeline နှင့် DevOps workflow များနှင့် ပေါင်းစပ်နိုင်မည်

## သင်ယူပြီးရရှိမည့် အကျိုးကျေးဇူးများ

ဒီလမ်းညွှန်ကို ပြီးမြောက်ပါက:
- azd deployment workflow များကို ကိုယ်တိုင် အဆင်ပြေစွာ run နှင့် troubleshoot လုပ်နိုင်မည်
- Custom deployment automation ကို hooks အသုံးပြု၍ ဒီဇိုင်းဆွဲနိုင်မည်
- Security နှင့် monitoring အဆင့်မြင့်သော production-ready deployment များကို configure လုပ်နိုင်မည်
- အဆင့်မြင့် multi-environment deployment scenario များကို စီမံနိုင်မည်
- Deployment performance ကို optimize လုပ်ပြီး rollback strategy များကို အကောင်အထည်ဖော်နိုင်မည်
- azd deployment များကို အဖွဲ့အစည်း DevOps လုပ်ငန်းစဉ်များနှင့် ပေါင်းစပ်နိုင်မည်

## Deployment အကျဉ်းချုပ်

Azure Developer CLI မှာ deployment command များအမျိုးမျိုး ပါဝင်သည်:
- `azd up` - အားလုံးကို လုပ်ဆောင်သော workflow (provision + deploy)
- `azd provision` - Azure resources များကို ဖန်တီး/အပ်ဒိတ်လုပ်ခြင်း
- `azd deploy` - Application code ကို deploy လုပ်ခြင်း
- `azd package` - Application များကို build နှင့် package လုပ်ခြင်း

## အခြေခံ Deployment Workflow များ

### အပြည့်အစုံ Deployment (azd up)
Project အသစ်များအတွက် အများဆုံး အသုံးပြုသော workflow:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
Azure resources များကို update လုပ်ရန်သာလိုအပ်သောအခါ:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Code-Only Deployment
Application ကို အမြန် update လုပ်ရန်:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Deployment လုပ်ငန်းစဉ်ကို နားလည်ခြင်း

### အဆင့် 1: Pre-Provision Hooks
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

### အဆင့် 2: Infrastructure Provisioning
- Infrastructure templates (Bicep/Terraform) ကို ဖတ်ရှုခြင်း
- Azure resources များကို ဖန်တီး/အပ်ဒိတ်လုပ်ခြင်း
- Networking နှင့် security ကို configure လုပ်ခြင်း
- Monitoring နှင့် logging ကို စနစ်တကျ စီမံခြင်း

### အဆင့် 3: Post-Provision Hooks
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

### အဆင့် 4: Application Packaging
- Application code ကို build လုပ်ခြင်း
- Deployment artifacts များကို ဖန်တီးခြင်း
- Target platform အတွက် package လုပ်ခြင်း (containers, ZIP files, စသည်)

### အဆင့် 5: Pre-Deploy Hooks
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

### အဆင့် 6: Application Deployment
- Packaged applications များကို Azure services တွင် deploy လုပ်ခြင်း
- Configuration settings များကို update လုပ်ခြင်း
- Services များကို စတင်/ပြန်စတင်ခြင်း

### အဆင့် 7: Post-Deploy Hooks
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

## 🎛️ Deployment Configuration

### Service-Specific Deployment Settings
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

### Environment-Specific Configurations
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

## 🔧 အဆင့်မြင့် Deployment Scenario များ

### Multi-Service Applications
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

## 🐳 Container Deployments

### Container App Deployments
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

## ⚡ Performance Optimization

### Parallel Deployments
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Build Caching
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

### Incremental Deployments
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Deployment Monitoring

### Real-Time Deployment Monitoring
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
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

## 🔐 Security Considerations

### Secrets Management
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

### Network Security
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identity and Access Management
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

## 🚨 Rollback Strategies

### Quick Rollback
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Infrastructure Rollback
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Database Migration Rollback
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Deployment Metrics

### Deployment Performance ကို ထိန်းသိမ်းခြင်း
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Custom Metrics Collection
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

## 🎯 Best Practices

### 1. Environment Consistency
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Testing Integration
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

### 4. Documentation and Logging
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## နောက်တစ်ဆင့်

- [Provisioning Resources](provisioning.md) - Infrastructure စီမံခန့်ခွဲမှုကို နက်နက်ရှိုင်းရှိုင်း လေ့လာခြင်း
- [Pre-Deployment Planning](../pre-deployment/capacity-planning.md) - Deployment strategy ကို စီစဉ်ခြင်း
- [Common Issues](../troubleshooting/common-issues.md) - Deployment ပြဿနာများကို ဖြေရှင်းခြင်း
- [Best Practices](../troubleshooting/debugging.md) - Production-ready deployment strategy များ

## အပိုဆောင်း ရင်းမြစ်များ

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**လမ်းညွှန်**
- **ယခင် သင်ခန်းစာ**: [Your First Project](../getting-started/first-project.md)
- **နောက် သင်ခန်းစာ**: [Provisioning Resources](provisioning.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါရှိနိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် ရှုလေ့လာသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွဲအချော်အချော်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။