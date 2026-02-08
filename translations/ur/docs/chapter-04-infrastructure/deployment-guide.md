# ڈپلائمنٹ گائیڈ - AZD ڈپلائمنٹس میں مہارت

**باب نیویگیشن:**
- **📚 کورس ہوم**: [AZD For Beginners](../../README.md)
- **📖 موجودہ باب**: باب 4 - Infrastructure as Code & Deployment
- **⬅️ پچھلا باب**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ اگلا**: [Provisioning Resources](provisioning.md)
- **🚀 اگلا باب**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introduction

This## Understanding the Deployment Processcomprehensive guide آپ کو Azure Developer CLI استعمال کرتے ہوئے ایپلیکیشنز کی تعیناتی کے بارے میں درکار تمام معلومات فراہم کرتا ہے، بنیادی ایک کمانڈ ڈپلائمنٹس سے لے کر کسٹم ہکس، متعدد ماحول، اور CI/CD انضمام کے ساتھ ایڈوانسڈ پروڈکشن منظرناموں تک۔ عملی مثالوں اور بہترین طریقوں کے ساتھ مکمل ڈپلائمنٹ لائف سائیکل میں مہارت حاصل کریں۔

## Learning Goals

اس گائیڈ کو مکمل کرنے کے بعد آپ:
- Azure Developer CLI کی تمام ڈپلائمنٹ کمانڈز اور ورک فلو میں مہارت حاصل کریں گے
- پروویژننگ سے مانیٹرنگ تک مکمل ڈپلائمنٹ لائف سائیکل کو سمجھیں گے
- پری اور پوسٹ ڈپلائمنٹ آٹومیشن کے لیے کسٹم ڈپلائمنٹ ہکس نافذ کریں گے
- ماحول مخصوص پیرا میٹرز کے ساتھ متعدد ماحول ترتیب دیں گے
- بلو-گرین اور کینیری تعیناتی جیسے ایڈوانسڈ ڈپلائمنٹ حکمت عملیاں قائم کریں گے
- azd ڈپلائمنٹس کو CI/CD پائپ لائنز اور DevOps ورک فلو کے ساتھ یکجا کریں گے

## Learning Outcomes

مکمل کرنے پر، آپ قابل ہوں گے:
- تمام azd ڈپلائمنٹ ورک فلو کو خود مختار طریقے سے چلانا اور ٹربل شوٹ کرنا
- ہکس استعمال کرتے ہوئے کسٹم ڈپلائمنٹ آٹومیشن ڈیزائن اور نافذ کرنا
- مناسب سیکیورٹی اور مانیٹرنگ کے ساتھ پروڈکشن-ریڈی ڈپلائمنٹس ترتیب دینا
- پیچیدہ ملٹی-ماحول ڈپلائمنٹ منظرناموں کو منظم کرنا
- ڈپلائمنٹ کارکردگی کو بہتر بنانا اور رول بیک حکمت عملیاں نافذ کرنا
- azd ڈپلائمنٹس کو ادارہ جاتی DevOps طریقہ کار میں انضمام کرنا

## Deployment Overview

Azure Developer CLI کئی ڈپلائمنٹ کمانڈز فراہم کرتا ہے:
- `azd up` - مکمل ورک فلو (provision + deploy)
- `azd provision` - صرف Azure وسائل بنائیں/اپڈیٹ کریں
- `azd deploy` - صرف ایپلیکیشن کوڈ ڈپلائے کریں
- `azd package` - ایپلیکیشنز کو بلڈ اور پیکیج کریں

## Basic Deployment Workflows

### Complete Deployment (azd up)
نئے پروجیکٹس کے لیے سب سے عام ورک فلو:
```bash
# سب کچھ شروع سے تعینات کریں
azd up

# مخصوص ماحول کے ساتھ تعینات کریں
azd up --environment production

# حسبِ ضرورت پیرامیٹرز کے ساتھ تعینات کریں
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
جب آپ کو صرف Azure وسائل اپڈیٹ کرنے کی ضرورت ہو:
```bash
# انفراسٹرکچر فراہم کریں/اپ ڈیٹ کریں
azd provision

# تبدیلیوں کا پیش نظارہ دیکھنے کے لیے dry-run کے ساتھ فراہم کریں
azd provision --preview

# مخصوص خدمات فراہم کریں
azd provision --service database
```

### Code-Only Deployment
تیز رفتار ایپلیکیشن اپڈیٹس کے لیے:
```bash
# تمام خدمات تعینات کریں
azd deploy

# متوقع نتیجہ:
# خدمات تعینات کی جا رہی ہیں (azd deploy)
# - web: تعینات ہو رہا ہے... مکمل
# - api: تعینات ہو رہا ہے... مکمل
# کامیابی: آپ کی تعیناتی 2 منٹ 15 سیکنڈ میں مکمل ہو گئی

# مخصوص سروس کو تعینات کریں
azd deploy --service web
azd deploy --service api

# کسٹم بلڈ دلائل کے ساتھ تعینات کریں
azd deploy --service api --build-arg NODE_ENV=production

# تعیناتی کی تصدیق کریں
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

کسی بھی ڈپلائمنٹ کے بعد، کامیابی کی تصدیق کریں:

```bash
# تمام خدمات چل رہی ہیں یا نہیں، چیک کریں
azd show

# ہیلتھ اینڈ پوائنٹس کی جانچ کریں
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# غلطیوں کی نگرانی کریں (ڈیفالٹ کے طور پر براؤزر میں کھلتا ہے)
azd monitor --logs
```

**کامیابی کے معیار:**
- ✅ تمام سروسز "Running" اسٹیٹس دکھاتی ہیں
- ✅ ہیلتھ اینڈ پوائنٹس HTTP 200 واپس کرتے ہیں
- ✅ گزشتہ 5 منٹس میں کوئی ایرر لاگز نہیں
- ✅ ایپلیکیشن ٹیسٹ ریکوئسٹس کا جواب دیتی ہے

## 🏗️ Understanding the Deployment Process

### Phase 1: Pre-Provision Hooks
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
- انفراسٹرکچر ٹیمپلیٹس پڑھتا ہے (Bicep/Terraform)
- Azure وسائل بناتا یا اپڈیٹ کرتا ہے
- نیٹ ورکنگ اور سیکیورٹی کو کنفیگر کرتا ہے
- مانیٹرنگ اور لاگنگ سیٹ اپ کرتا ہے

### Phase 3: Post-Provision Hooks
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

### Phase 4: Application Packaging
- ایپلیکیشن کوڈ کو بنڈل کرتا ہے
- ڈپلائمنٹ آرٹیفیکٹس بناتا ہے
- ٹارگٹ پلیٹ فارم کے لیے پیک کرتا ہے (کنٹینرز، ZIP فائلز، وغیرہ)

### Phase 5: Pre-Deploy Hooks
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

### Phase 6: Application Deployment
- پیکیج شدہ ایپلیکیشنز کو Azure سروسز پر ڈپلائے کرتا ہے
- کنفیگریشن سیٹنگز کو اپڈیٹ کرتا ہے
- سروسز کو اسٹارٹ/ری اسٹارٹ کرتا ہے

### Phase 7: Post-Deploy Hooks
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
# ترقیاتی ماحول
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# اسٹیجنگ ماحول
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# پیداواری ماحول
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Advanced Deployment Scenarios

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
# نیلا ماحول بنائیں
azd env new production-blue
azd up --environment production-blue

# نیلے ماحول کی جانچ کریں
./scripts/test-environment.sh production-blue

# ٹریفک کو نیلے ماحول کی طرف منتقل کریں (دستی DNS/لوڈ بیلینسر اپڈیٹ)
./scripts/switch-traffic.sh production-blue

# سبز ماحول کو صاف کریں
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

### Service-Specific Deployments
```bash
# مخصوص سروس کو تیزی سے تکرار کے لیے تعینات کریں
azd deploy --service web
azd deploy --service api

# تمام خدمات کو تعینات کریں
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

### Efficient Code Deployments
```bash
# صرف کوڈ کی تبدیلیوں کے لیے azd deploy استعمال کریں (azd up نہیں)
# یہ بنیادی ڈھانچے کی پروویژننگ کو چھوڑ دیتا ہے اور بہت تیز ہے
azd deploy

# تیز ترین تکرار کے لیے مخصوص سروس کو ڈپلائے کریں
azd deploy --service api
```

## 🔍 Deployment Monitoring

### Real-Time Deployment Monitoring
```bash
# حقیقی وقت میں ایپلیکیشن کی نگرانی کریں
azd monitor --live

# ایپلیکیشن کے لاگز دیکھیں
azd monitor --logs

# تعیناتی کی صورتحال چیک کریں
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

# درخواست کی صحت چیک کریں
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
# خفیہ معلومات کو محفوظ طریقے سے ذخیرہ کریں
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml میں خفیہ معلومات کا حوالہ دیں
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
# AZD میں بلٹ ان رول بیک موجود نہیں ہے۔ تجویز کردہ طریقے:

# اختیار 1: Git سے دوبارہ ڈپلائے کریں (تجویز کردہ)
git revert HEAD  # مسئلہ پیدا کرنے والی کمیٹ کو ریورٹ کریں
git push
azd deploy

# اختیار 2: مخصوص کمیٹ کو دوبارہ ڈپلائے کریں
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastructure Rollback
```bash
# لاگو کرنے سے پہلے انفراسٹرکچر میں تبدیلیوں کا پیش نظارہ کریں
azd provision --preview

# انفراسٹرکچر کو واپس پلٹانے کے لیے ورژن کنٹرول استعمال کریں:
git revert HEAD  # انفراسٹرکچر میں کی گئی تبدیلیاں واپس کریں
azd provision    # پچھلے انفراسٹرکچر کی حالت کو لاگو کریں
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

### Track Deployment Performance
```bash
# موجودہ تعیناتی کی حیثیت دیکھیں
azd show

# Application Insights کے ذریعے ایپلیکیشن کی نگرانی کریں
azd monitor --overview

# براہِ راست میٹرکس دیکھیں
azd monitor --live
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
# ناموں میں تسلسل رکھیں
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ماحول میں یکسانیت برقرار رکھیں
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# ڈپلائمنٹ سے پہلے انفراسٹرکچر کی تبدیلیوں کا پیش نظارہ
azd provision --preview

# ARM/Bicep کے لیے لِنٹنگ استعمال کریں
az bicep lint --file infra/main.bicep

# Bicep کی نحو کی توثیق کریں
az bicep build --file infra/main.bicep
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
# تعیناتی طریقہ کار کو دستاویزی شکل دیں
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Next Steps

- [Provisioning Resources](provisioning.md) - انفراسٹرکچر منیجمنٹ میں گہرائی سے مطالعہ
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - اپنی ڈپلائمنٹ حکمت عملی کی منصوبہ بندی کریں
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - ڈپلائمنٹ مسائل حل کریں
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - پروڈکشن-ریڈی ڈپلائمنٹ حکمت عملیاں

## 🎯 Hands-On Deployment Exercises

### Exercise 1: Incremental Deployment Workflow (20 minutes)
**مقصد**: مکمل اور انکریمنٹل ڈپلائمنٹس کے درمیان فرق میں مہارت حاصل کرنا

```bash
# ابتدائی تعیناتی
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ابتدائی تعیناتی کا وقت ریکارڈ کریں
echo "Full deployment: $(date)" > deployment-log.txt

# کوڈ میں تبدیلی کریں
echo "// Updated $(date)" >> src/api/src/server.js

# صرف کوڈ تعینات کریں (تیز)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# اوقات کا موازنہ کریں
cat deployment-log.txt

# صفائی کریں
azd down --force --purge
```

**کامیابی کے معیار:**
- [ ] مکمل ڈپلائمنٹ 5-15 منٹس میں ہوتی ہے
- [ ] صرف کوڈ ڈپلائمنٹ 2-5 منٹس میں ہوتی ہے
- [ ] ڈپلائے شدہ ایپ میں کوڈ تبدیلیاں ظاہر ہوں
- [ ] `azd deploy` کے بعد انفراسٹرکچر میں تبدیلی نہیں ہوئی

**Learning Outcome**: `azd deploy` کوڈ تبدیلیوں کے لیے `azd up` کے مقابلے میں 50-70% تیز ہے

### Exercise 2: Custom Deployment Hooks (30 minutes)
**مقصد**: پری اور پوسٹ ڈپلائمنٹ آٹومیشن نافذ کرنا

```bash
# قبل از تعیناتی تصدیق کا اسکرپٹ بنائیں
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# تصدیق کریں کہ ٹیسٹ پاس ہوئے ہیں
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# غیر کمٹ شدہ تبدیلیاں چیک کریں
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# بعد از تعیناتی سموک ٹیسٹ بنائیں
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

# azure.yaml میں ہکس شامل کریں
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ہکس کے ساتھ تعیناتی کی جانچ کریں
azd deploy
```

**کامیابی کے معیار:**
- [ ] پری-ڈپلائے اسکرپٹ ڈپلائمنٹ سے پہلے چلتا ہے
- [ ] اگر ٹیسٹ فیل ہوں تو ڈپلائمنٹ منسوخ ہو جاتی ہے
- [ ] پوسٹ-ڈپلائے سموک ٹیسٹ ہیلتھ کی تصدیق کرتا ہے
- [ ] ہکس درست ترتیب میں چلتے ہیں

### Exercise 3: Multi-Environment Deployment Strategy (45 minutes)
**مقصد**: اسٹیجڈ ڈپلائمنٹ ورک فلو نافذ کرنا (dev → staging → production)

```bash
# تعیناتی اسکرپٹ بنائیں
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# مرحلہ 1: dev پر تعینات کریں
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# مرحلہ 2: staging پر تعینات کریں
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# مرحلہ 3: پروڈکشن کے لیے دستی منظوری
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

# ماحول بنائیں
azd env new dev
azd env new staging
azd env new production

# مرحلہ وار تعیناتی چلائیں
./deploy-staged.sh
```

**کامیابی کے معیار:**
- [ ] Dev ماحول کامیابی کے ساتھ ڈپلائے ہوتا ہے
- [ ] Staging ماحول کامیابی کے ساتھ ڈپلائے ہوتا ہے
- [ ] پروڈکشن کے لیے دستی منظوری درکار ہے
- [ ] تمام ماحول میں ورکنگ ہیلتھ چیکس ہیں
- [ ] ضرورت پڑنے پر رول بیک کیا جا سکے

### Exercise 4: Rollback Strategy (25 minutes)
**مقصد**: Git کا استعمال کرتے ہوئے ڈپلائمنٹ رول بیک نافذ کرنا اور ٹیسٹ کرنا

```bash
# v1 کو تعینات کریں
azd env set APP_VERSION "1.0.0"
azd up

# v1 کے کمیٹ ہیش کو محفوظ کریں
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# v2 کو ایک بریکنگ چینج کے ساتھ تعینات کریں
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ناکامی کا پتہ لگائیں اور رول بیک کریں
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git استعمال کرتے ہوئے رول بیک کریں
    git revert HEAD --no-edit
    
    # ماحول کو رول بیک کریں
    azd env set APP_VERSION "1.0.0"
    
    # v1 کو دوبارہ تعینات کریں
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**کامیابی کے معیار:**
- [ ] ڈپلائمنٹ فیلیرز کا پتہ لگا سکیں
- [ ] رول بیک اسکرپٹ خودکار طور پر چلتا ہے
- [ ] ایپلیکیشن دوبارہ کام کرنے والی حالت میں واپس آ جاتی ہے
- [ ] رول بیک کے بعد ہیلتھ چیکس پاس ہوتے ہیں

## 📊 Deployment Metrics Tracking

### اپنی ڈپلائمنٹ کارکردگی کا سراغ لگائیں

```bash
# ڈپلائمنٹ میٹرکس کا اسکرپٹ بنائیں
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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# فائل میں لاگ کریں
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# اسے استعمال کریں
./track-deployment.sh
```

**اپنے میٹرکس کا تجزیہ کریں:**
```bash
# تعیناتی کی تاریخ دیکھیں
cat deployment-metrics.csv

# اوسط تعیناتی وقت کا حساب کریں
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Additional Resources

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**نیویگیشن**
- **پچھلا لیکچر**: [Your First Project](../chapter-01-foundation/first-project.md)
- **اگلا لیکچر**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
انکارِ ذمہ داری:
یہ دستاویز AI ترجمہ سروس Co‑op Translator (https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کی کوشش کرتے ہیں، براہِ کرم نوٹ کریں کہ خودکار تراجم میں غلطیاں یا خامیاں ہو سکتی ہیں۔ اصل دستاویز اس کی مادری زبان میں مستند ماخذ سمجھی جائے۔ اہم معلومات کے معاملے میں پیشہ ور انسانی ترجمے کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تعبیر کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->