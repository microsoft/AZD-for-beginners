<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-17T18:40:20+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "ur"
}
-->
# تعیناتی گائیڈ - AZD تعیناتیوں میں مہارت حاصل کریں

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 4 - کوڈ کے طور پر انفراسٹرکچر اور تعیناتی
- **⬅️ پچھلا باب**: [باب 3: کنفیگریشن](../getting-started/configuration.md)
- **➡️ اگلا**: [وسائل کی فراہمی](provisioning.md)
- **🚀 اگلا باب**: [باب 5: ملٹی ایجنٹ AI حل](../../examples/retail-scenario.md)

## تعارف

یہ جامع گائیڈ Azure Developer CLI کا استعمال کرتے ہوئے ایپلیکیشنز کی تعیناتی کے بارے میں سب کچھ شامل کرتی ہے، بنیادی سنگل کمانڈ تعیناتیوں سے لے کر پروڈکشن کے پیچیدہ منظرناموں تک، جن میں کسٹم ہکس، متعدد ماحول، اور CI/CD انضمام شامل ہیں۔ عملی مثالوں اور بہترین طریقوں کے ساتھ مکمل تعیناتی کے لائف سائیکل میں مہارت حاصل کریں۔

## سیکھنے کے اہداف

اس گائیڈ کو مکمل کرنے کے بعد، آپ:
- Azure Developer CLI کے تمام تعیناتی کمانڈز اور ورک فلو میں مہارت حاصل کریں گے
- تعیناتی کے مکمل لائف سائیکل کو فراہمی سے مانیٹرنگ تک سمجھیں گے
- تعیناتی سے پہلے اور بعد میں خودکار عمل کے لیے کسٹم ہکس نافذ کریں گے
- ماحول کے مخصوص پیرامیٹرز کے ساتھ متعدد ماحول کو ترتیب دیں گے
- بلیو-گرین اور کینری تعیناتی سمیت جدید تعیناتی حکمت عملیوں کو ترتیب دیں گے
- azd تعیناتیوں کو CI/CD پائپ لائنز اور DevOps ورک فلو کے ساتھ مربوط کریں گے

## سیکھنے کے نتائج

گائیڈ مکمل کرنے کے بعد، آپ:
- azd تعیناتی ورک فلو کو خود مختاری سے انجام دیں اور ان میں خرابیوں کو دور کریں گے
- کسٹم تعیناتی خودکار عمل کو ڈیزائن اور نافذ کریں گے
- مناسب سیکیورٹی اور مانیٹرنگ کے ساتھ پروڈکشن کے لیے تیار تعیناتیوں کو ترتیب دیں گے
- پیچیدہ ملٹی ماحول تعیناتی منظرناموں کا انتظام کریں گے
- تعیناتی کی کارکردگی کو بہتر بنائیں گے اور رول بیک حکمت عملیوں کو نافذ کریں گے
- azd تعیناتیوں کو انٹرپرائز DevOps طریقوں میں مربوط کریں گے

## تعیناتی کا جائزہ

Azure Developer CLI کئی تعیناتی کمانڈز فراہم کرتا ہے:
- `azd up` - مکمل ورک فلو (فراہم + تعینات)
- `azd provision` - صرف Azure وسائل بنائیں/اپ ڈیٹ کریں
- `azd deploy` - صرف ایپلیکیشن کوڈ تعینات کریں
- `azd package` - ایپلیکیشنز کو بنائیں اور پیک کریں

## بنیادی تعیناتی ورک فلو

### مکمل تعیناتی (azd up)
نئے پروجیکٹس کے لیے سب سے عام ورک فلو:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### صرف انفراسٹرکچر کی تعیناتی
جب آپ کو صرف Azure وسائل کو اپ ڈیٹ کرنے کی ضرورت ہو:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### صرف کوڈ کی تعیناتی
تیز ایپلیکیشن اپ ڈیٹس کے لیے:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ تعیناتی کے عمل کو سمجھنا

### مرحلہ 1: فراہمی سے پہلے کے ہکس
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

### مرحلہ 2: انفراسٹرکچر کی فراہمی
- انفراسٹرکچر ٹیمپلیٹس (Bicep/Terraform) کو پڑھتا ہے
- Azure وسائل بناتا یا اپ ڈیٹ کرتا ہے
- نیٹ ورکنگ اور سیکیورٹی کو ترتیب دیتا ہے
- مانیٹرنگ اور لاگنگ کو سیٹ اپ کرتا ہے

### مرحلہ 3: فراہمی کے بعد کے ہکس
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

### مرحلہ 4: ایپلیکیشن پیکجنگ
- ایپلیکیشن کوڈ بناتا ہے
- تعیناتی کے آرٹفیکٹس بناتا ہے
- ہدف پلیٹ فارم کے لیے پیک کرتا ہے (کنٹینرز، ZIP فائلز، وغیرہ)

### مرحلہ 5: تعیناتی سے پہلے کے ہکس
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

### مرحلہ 6: ایپلیکیشن کی تعیناتی
- پیک شدہ ایپلیکیشنز کو Azure سروسز پر تعینات کرتا ہے
- کنفیگریشن سیٹنگز کو اپ ڈیٹ کرتا ہے
- سروسز کو شروع/دوبارہ شروع کرتا ہے

### مرحلہ 7: تعیناتی کے بعد کے ہکس
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

## 🎛️ تعیناتی کی کنفیگریشن

### سروس کے مخصوص تعیناتی سیٹنگز
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

### ماحول کے مخصوص کنفیگریشنز
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

## 🔧 جدید تعیناتی منظرنامے

### ملٹی سروس ایپلیکیشنز
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

### بلیو-گرین تعیناتیاں
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

### کینری تعیناتیاں
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

### مرحلہ وار تعیناتیاں
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

## 🐳 کنٹینر تعیناتیاں

### کنٹینر ایپ تعیناتیاں
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

### ملٹی اسٹیج Dockerfile کی اصلاح
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

## ⚡ کارکردگی کی اصلاح

### متوازی تعیناتیاں
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### بلڈ کیشنگ
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

### انکریمنٹل تعیناتیاں
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 تعیناتی کی مانیٹرنگ

### حقیقی وقت کی تعیناتی مانیٹرنگ
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### صحت کی جانچ
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

### تعیناتی کے بعد کی توثیق
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

## 🔐 سیکیورٹی کے تحفظات

### رازوں کا انتظام
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

### نیٹ ورک سیکیورٹی
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### شناخت اور رسائی کا انتظام
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

## 🚨 رول بیک حکمت عملی

### فوری رول بیک
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### انفراسٹرکچر رول بیک
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### ڈیٹا بیس مائیگریشن رول بیک
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 تعیناتی میٹرکس

### تعیناتی کی کارکردگی کو ٹریک کریں
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### کسٹم میٹرکس جمع کرنا
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

## 🎯 بہترین طریقے

### 1. ماحول کی مستقل مزاجی
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. انفراسٹرکچر کی توثیق
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. انضمام کی جانچ
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

### 4. دستاویزات اور لاگنگ
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## اگلے مراحل

- [وسائل کی فراہمی](provisioning.md) - انفراسٹرکچر کے انتظام میں گہرائی سے مطالعہ
- [تعیناتی سے پہلے کی منصوبہ بندی](../pre-deployment/capacity-planning.md) - اپنی تعیناتی کی حکمت عملی کی منصوبہ بندی کریں
- [عام مسائل](../troubleshooting/common-issues.md) - تعیناتی کے مسائل کو حل کریں
- [بہترین طریقے](../troubleshooting/debugging.md) - پروڈکشن کے لیے تیار تعیناتی حکمت عملی

## اضافی وسائل

- [Azure Developer CLI تعیناتی حوالہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service تعیناتی](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps تعیناتی](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions تعیناتی](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**نیویگیشن**
- **پچھلا سبق**: [آپ کا پہلا پروجیکٹ](../getting-started/first-project.md)
- **اگلا سبق**: [وسائل کی فراہمی](provisioning.md)

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔