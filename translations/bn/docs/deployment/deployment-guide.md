<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-17T19:24:30+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "bn"
}
-->
# ডিপ্লয়মেন্ট গাইড - AZD ডিপ্লয়মেন্টে দক্ষতা অর্জন

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার ৪ - কোড ও ডিপ্লয়মেন্ট হিসেবে অবকাঠামো
- **⬅️ পূর্ববর্তী চ্যাপ্টার**: [চ্যাপ্টার ৩: কনফিগারেশন](../getting-started/configuration.md)
- **➡️ পরবর্তী**: [রিসোর্স প্রভিশনিং](provisioning.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [চ্যাপ্টার ৫: মাল্টি-এজেন্ট AI সলিউশন](../../examples/retail-scenario.md)

## ভূমিকা

এই বিস্তৃত গাইডটি Azure Developer CLI ব্যবহার করে অ্যাপ্লিকেশন ডিপ্লয় করার প্রক্রিয়া সম্পর্কে সবকিছু কভার করে। এটি বেসিক সিঙ্গেল-কমান্ড ডিপ্লয়মেন্ট থেকে শুরু করে কাস্টম হুক, একাধিক পরিবেশ এবং CI/CD ইন্টিগ্রেশনের সাথে উন্নত প্রোডাকশন পরিস্থিতি পর্যন্ত। বাস্তব উদাহরণ এবং সেরা অনুশীলনের মাধ্যমে সম্পূর্ণ ডিপ্লয়মেন্ট লাইফসাইকেল আয়ত্ত করুন।

## শেখার লক্ষ্য

এই গাইড সম্পন্ন করার মাধ্যমে আপনি:
- Azure Developer CLI ডিপ্লয়মেন্ট কমান্ড এবং ওয়ার্কফ্লো আয়ত্ত করবেন
- প্রভিশনিং থেকে মনিটরিং পর্যন্ত সম্পূর্ণ ডিপ্লয়মেন্ট লাইফসাইকেল বুঝতে পারবেন
- প্রি এবং পোস্ট-ডিপ্লয়মেন্ট অটোমেশনের জন্য কাস্টম হুক বাস্তবায়ন করবেন
- পরিবেশ-নির্দিষ্ট প্যারামিটার সহ একাধিক পরিবেশ কনফিগার করবেন
- ব্লু-গ্রিন এবং ক্যানারি ডিপ্লয়মেন্ট সহ উন্নত ডিপ্লয়মেন্ট কৌশল সেট আপ করবেন
- azd ডিপ্লয়মেন্টকে CI/CD পাইপলাইন এবং DevOps ওয়ার্কফ্লোতে ইন্টিগ্রেট করবেন

## শেখার ফলাফল

গাইড সম্পন্ন করার পর আপনি:
- azd ডিপ্লয়মেন্ট ওয়ার্কফ্লো স্বাধীনভাবে এক্সিকিউট এবং ট্রাবলশুট করতে পারবেন
- কাস্টম ডিপ্লয়মেন্ট অটোমেশন ডিজাইন এবং বাস্তবায়ন করতে পারবেন
- সঠিক নিরাপত্তা এবং মনিটরিং সহ প্রোডাকশন-রেডি ডিপ্লয়মেন্ট কনফিগার করতে পারবেন
- জটিল মাল্টি-এনভায়রনমেন্ট ডিপ্লয়মেন্ট পরিস্থিতি পরিচালনা করতে পারবেন
- ডিপ্লয়মেন্ট পারফরম্যান্স অপ্টিমাইজ এবং রোলব্যাক কৌশল বাস্তবায়ন করতে পারবেন
- এন্টারপ্রাইজ DevOps প্র্যাকটিসে azd ডিপ্লয়মেন্ট ইন্টিগ্রেট করতে পারবেন

## ডিপ্লয়মেন্ট ওভারভিউ

Azure Developer CLI বিভিন্ন ডিপ্লয়মেন্ট কমান্ড প্রদান করে:
- `azd up` - সম্পূর্ণ ওয়ার্কফ্লো (প্রভিশন + ডিপ্লয়)
- `azd provision` - শুধুমাত্র Azure রিসোর্স তৈরি/আপডেট
- `azd deploy` - শুধুমাত্র অ্যাপ্লিকেশন কোড ডিপ্লয়
- `azd package` - অ্যাপ্লিকেশন বিল্ড এবং প্যাকেজ

## বেসিক ডিপ্লয়মেন্ট ওয়ার্কফ্লো

### সম্পূর্ণ ডিপ্লয়মেন্ট (azd up)
নতুন প্রকল্পের জন্য সবচেয়ে সাধারণ ওয়ার্কফ্লো:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### শুধুমাত্র অবকাঠামো ডিপ্লয়মেন্ট
যখন শুধুমাত্র Azure রিসোর্স আপডেট করতে হবে:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### শুধুমাত্র কোড ডিপ্লয়মেন্ট
দ্রুত অ্যাপ্লিকেশন আপডেটের জন্য:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ ডিপ্লয়মেন্ট প্রক্রিয়া বোঝা

### ধাপ ১: প্রি-প্রভিশন হুক
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

### ধাপ ২: অবকাঠামো প্রভিশনিং
- অবকাঠামো টেমপ্লেট (Bicep/Terraform) পড়ে
- Azure রিসোর্স তৈরি বা আপডেট করে
- নেটওয়ার্কিং এবং নিরাপত্তা কনফিগার করে
- মনিটরিং এবং লগিং সেট আপ করে

### ধাপ ৩: পোস্ট-প্রভিশন হুক
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

### ধাপ ৪: অ্যাপ্লিকেশন প্যাকেজিং
- অ্যাপ্লিকেশন কোড বিল্ড করে
- ডিপ্লয়মেন্ট আর্টিফ্যাক্ট তৈরি করে
- টার্গেট প্ল্যাটফর্মের জন্য প্যাকেজ করে (কন্টেইনার, ZIP ফাইল ইত্যাদি)

### ধাপ ৫: প্রি-ডিপ্লয় হুক
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

### ধাপ ৬: অ্যাপ্লিকেশন ডিপ্লয়মেন্ট
- প্যাকেজ করা অ্যাপ্লিকেশন Azure সার্ভিসে ডিপ্লয় করে
- কনফিগারেশন সেটিংস আপডেট করে
- সার্ভিস শুরু/পুনরায় শুরু করে

### ধাপ ৭: পোস্ট-ডিপ্লয় হুক
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

## 🎛️ ডিপ্লয়মেন্ট কনফিগারেশন

### সার্ভিস-নির্দিষ্ট ডিপ্লয়মেন্ট সেটিংস
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

### পরিবেশ-নির্দিষ্ট কনফিগারেশন
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

## 🔧 উন্নত ডিপ্লয়মেন্ট পরিস্থিতি

### মাল্টি-সার্ভিস অ্যাপ্লিকেশন
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

### ব্লু-গ্রিন ডিপ্লয়মেন্ট
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

### ক্যানারি ডিপ্লয়মেন্ট
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

### স্টেজড ডিপ্লয়মেন্ট
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

## 🐳 কন্টেইনার ডিপ্লয়মেন্ট

### কন্টেইনার অ্যাপ ডিপ্লয়মেন্ট
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

### মাল্টি-স্টেজ ডকারফাইল অপ্টিমাইজেশন
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

## ⚡ পারফরম্যান্স অপ্টিমাইজেশন

### প্যারালাল ডিপ্লয়মেন্ট
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### বিল্ড ক্যাশিং
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

### ইনক্রিমেন্টাল ডিপ্লয়মেন্ট
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 ডিপ্লয়মেন্ট মনিটরিং

### রিয়েল-টাইম ডিপ্লয়মেন্ট মনিটরিং
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### হেলথ চেক
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

### পোস্ট-ডিপ্লয়মেন্ট ভ্যালিডেশন
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

## 🔐 নিরাপত্তা বিবেচনা

### সিক্রেট ম্যানেজমেন্ট
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

### নেটওয়ার্ক নিরাপত্তা
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### পরিচয় এবং অ্যাক্সেস ম্যানেজমেন্ট
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

## 🚨 রোলব্যাক কৌশল

### দ্রুত রোলব্যাক
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### অবকাঠামো রোলব্যাক
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### ডাটাবেস মাইগ্রেশন রোলব্যাক
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ডিপ্লয়মেন্ট মেট্রিক্স

### ডিপ্লয়মেন্ট পারফরম্যান্স ট্র্যাক করা
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### কাস্টম মেট্রিক্স সংগ্রহ
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

## 🎯 সেরা অনুশীলন

### ১. পরিবেশের সামঞ্জস্যতা
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### ২. অবকাঠামো যাচাই
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### ৩. টেস্টিং ইন্টিগ্রেশন
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

### ৪. ডকুমেন্টেশন এবং লগিং
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## পরবর্তী পদক্ষেপ

- [রিসোর্স প্রভিশনিং](provisioning.md) - অবকাঠামো ব্যবস্থাপনা সম্পর্কে গভীরভাবে জানুন
- [প্রি-ডিপ্লয়মেন্ট পরিকল্পনা](../pre-deployment/capacity-planning.md) - আপনার ডিপ্লয়মেন্ট কৌশল পরিকল্পনা করুন
- [সাধারণ সমস্যা](../troubleshooting/common-issues.md) - ডিপ্লয়মেন্ট সমস্যা সমাধান করুন
- [সেরা অনুশীলন](../troubleshooting/debugging.md) - প্রোডাকশন-রেডি ডিপ্লয়মেন্ট কৌশল

## অতিরিক্ত রিসোর্স

- [Azure Developer CLI ডিপ্লয়মেন্ট রেফারেন্স](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [আপনার প্রথম প্রকল্প](../getting-started/first-project.md)
- **পরবর্তী পাঠ**: [রিসোর্স প্রভিশনিং](provisioning.md)

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা নিশ্চিত করার চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।