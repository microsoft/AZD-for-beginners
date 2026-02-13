# ডিপ্লয়মেন্ট গাইড - AZD ডিপ্লয়মেন্টে দক্ষতা অর্জন

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [নতুনদের জন্য AZD](../../README.md)
- **📖 Current Chapter**: অধ্যায় ৪ - কোড হিসেবে অবকাঠামো ও ডিপ্লয়মেন্ট
- **⬅️ Previous Chapter**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [রিসোর্স প্রোভিশনিং](provisioning.md)
- **🚀 Next Chapter**: [অধ্যায় ৫: বহু-এজেন্ট এআই সমাধান](../../examples/retail-scenario.md)

## ভূমিকা

এই## Understanding the Deployment Processবিস্তৃত গাইডটি Azure Developer CLI ব্যবহার করে অ্যাপ্লিকেশন ডিপ্লয় করার সম্পর্কে যা জানা প্রয়োজন সবকিছু কভার করে, ভিত্তি একক-কমান্ড ডিপ্লয়মেন্ট থেকে কাস্টম হুক, একাধিক পরিবেশ, এবং CI/CD ইন্টিগ্রেশনের সঙ্গে উন্নত প্রোডাকশন পরিস্থিতি পর্যন্ত। ব্যবহারিক উদাহরণ এবং শ্রেষ্ঠ অনুশীলনসহ পূর্ণ ডিপ্লয়মেন্ট লাইফসাইকেলটি আয়ত্ত করুন।

## শেখার লক্ষ্য

এই গাইড সম্পন্ন করলে, আপনি:
- Azure Developer CLI-এর সব ডিপ্লয়মেন্ট কমান্ড এবং ওয়ার্কফ্লো আয়ত্ত করুন
- প্রোভিশনিং থেকে মনিটরিং পর্যন্ত সম্পূর্ণ ডিপ্লয়মেন্ট লাইফসাইকেল বুঝুন
- প্রি এবং পোস্ট-ডিপ্লয়মেন্ট অটোমেশন জন্য কাস্টম ডিপ্লয়মেন্ট হুক বাস্তবায়ন করুন
- পরিবেশ-নির্দিষ্ট প্যারামিটারসহ একাধিক পরিবেশ কনফিগার করুন
- ব্লু-গ্রিন এবং ক্যানারি ডিপ্লয়মেন্টসহ উন্নত ডিপ্লয়মেন্ট কৌশল সেটআপ করুন
- azd ডিপ্লয়মেন্টকে CI/CD পাইপলাইন এবং DevOps ওয়ার্কফ্লো-এর সাথে ইন্টিগ্রেট করুন

## শেখার ফলাফল

সমাপ্তিতে, আপনি সক্ষম হবেন:
- স্বতন্ত্রভাবে সব azd ডিপ্লয়মেন্ট ওয়ার্কফ্লো চালানো এবং ট্রাবলশুট করা
- হুক ব্যবহার করে কাস্টম ডিপ্লয়মেন্ট অটোমেশন ডিজাইন এবং বাস্তবায়ন করুন
- উপযুক্ত সিকিউরিটি ও মনিটরিং সহ প্রোডাকশন-সাজানো ডিপ্লয়মেন্ট কনফিগার করুন
- জটিল বহু-পরিবেশ ডিপ্লয়মেন্ট পরিস্থিতি পরিচালনা করুন
- ডিপ্লয়মেন্ট পারফরম্যান্স অপ্টিমাইজ করুন এবং রোলব্যাক কৌশল বাস্তবায়ন করুন
- এন্টারপ্রাইজ DevOps অনুশীলনে azd ডিপ্লয়মেন্ট ইন্টিগ্রেট করুন

## ডিপ্লয়মেন্ট ওভারভিউ

Azure Developer CLI কয়েকটি ডিপ্লয়মেন্ট কমান্ড প্রদান করে:
- `azd up` - পূর্ণ ওয়ার্কফ্লো (প্রোভিশন + ডিপ্লয়)
- `azd provision` - শুধুমাত্র Azure রিসোর্স তৈরি/আপডেট
- `azd deploy` - শুধুমাত্র অ্যাপ্লিকেশন কোড ডিপ্লয়
- `azd package` - অ্যাপ্লিকেশন বিল্ড এবং প্যাকেজ

## বেসিক ডিপ্লয়মেন্ট ওয়ার্কফ্লো

### সম্পূর্ণ ডিপ্লয়মেন্ট (azd up)
The most common workflow for new projects:
```bash
# শূন্য থেকে সবকিছু মোতায়েন করুন
azd up

# নির্দিষ্ট পরিবেশ ব্যবহার করে মোতায়েন করুন
azd up --environment production

# কাস্টম প্যারামিটার ব্যবহার করে মোতায়েন করুন
azd up --parameter location=westus2 --parameter sku=P1v2
```

### শুধুমাত্র অবকাঠামো ডিপ্লয়মেন্ট
When you only need to update Azure resources:
```bash
# অবকাঠামো স্থাপন/আপডেট
azd provision

# পরিবর্তনগুলো পূর্বদর্শন করার জন্য ড্রাই-রান সহ প্রদান
azd provision --preview

# নির্দিষ্ট সেবাসমূহ প্রদান
azd provision --service database
```

### কেবল কোড ডিপ্লয়মেন্ট
For quick application updates:
```bash
# সমস্ত সার্ভিস ডেপ্লয় করুন
azd deploy

# প্রত্যাশিত আউটপুট:
# সার্ভিস ডেপ্লয় করা হচ্ছে (azd deploy)
# - web: ডেপ্লয় করা হচ্ছে... সম্পন্ন
# - api: ডেপ্লয় করা হচ্ছে... সম্পন্ন
# সফল: আপনার ডেপ্লয়মেন্ট ২ মিনিট ১৫ সেকেন্ডে সম্পন্ন হয়েছে

# নির্দিষ্ট সার্ভিস ডেপ্লয় করুন
azd deploy --service web
azd deploy --service api

# কাস্টম বিল্ড আর্গুমেন্ট ব্যবহার করে ডেপ্লয় করুন
azd deploy --service api --build-arg NODE_ENV=production

# ডেপ্লয়মেন্ট যাচাই করুন
azd show --output json | jq '.services'
```

### ✅ ডিপ্লয়মেন্ট যাচাই

কোনও ডিপ্লয়মেন্টের পরে, সফলতা যাচাই করুন:

```bash
# সব পরিষেবা চলছে কিনা পরীক্ষা করুন
azd show

# হেলথ এন্ডপয়েন্টগুলো পরীক্ষা করুন
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ত্রুটির জন্য মনিটর করুন (ডিফল্টভাবে ব্রাউজারে খুলবে)
azd monitor --logs
```

**সাফল্যের মানদণ্ড:**
- ✅ সব সার্ভিস "Running" স্ট্যাটাস দেখাচ্ছে
- ✅ হেলথ এন্ডপয়েন্টগুলো HTTP 200 ফেরত দেয়
- ✅ গত ৫ মিনিটে কোনো এরর লগ নেই
- ✅ অ্যাপ্লিকেশন টেস্ট রিকোয়েস্টগুলোর উত্তর দেয়

## 🏗️ ডিপ্লয়মেন্ট প্রক্রিয়া বোঝা

### ধাপ ১: প্রি-প্রোভিশন হুকস
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

### ধাপ ২: অবকাঠামো প্রোভিশনিং
- অবকাঠামো টেমপ্লেট পাঠ করে (Bicep/Terraform)
- Azure রিসোর্স তৈরি বা আপডেট করে
- নেটওয়ার্কিং এবং সিকিউরিটি কনফিগার করে
- মনিটরিং এবং লগিং সেটআপ করে

### ধাপ ৩: পোস্ট-প্রোভিশন হুকস
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
- টার্গেট প্ল্যাটফর্মের জন্য প্যাকেজ করে (কন্টেইনার, ZIP ফাইল, ইত্যাদি)

### ধাপ ৫: প্রি-ডিপ্লয় হুকস
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
- প্যাকেজকৃত অ্যাপগুলো Azure সার্ভিসে ডিপ্লয় করে
- কনফিগারেশন সেটিংস আপডেট করে
- সার্ভিসগুলো শুরু/পুনরায় শুরু করে

### ধাপ ৭: পোস্ট-ডিপ্লয় হুকস
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
# উন্নয়ন পরিবেশ
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# স্টেজিং পরিবেশ
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# প্রোডাকশন পরিবেশ
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 উন্নত ডিপ্লয়মেন্ট পরিস্থিতি

### বহুসার্ভিস অ্যাপ্লিকেশন
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
# নীল পরিবেশ তৈরি করুন
azd env new production-blue
azd up --environment production-blue

# নীল পরিবেশ পরীক্ষা করুন
./scripts/test-environment.sh production-blue

# ট্রাফিক নীল পরিবেশে সরান (ম্যানুয়াল DNS/লোড-ব্যালান্সার আপডেট)
./scripts/switch-traffic.sh production-blue

# সবুজ পরিবেশ পরিষ্কার করুন
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

### পর্যায়ভিত্তিক ডিপ্লয়মেন্ট
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

### মাল্টি-স্টেজ Dockerfile অপ্টিমাইজেশন
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

### সার্ভিস-নির্দিষ্ট ডিপ্লয়মেন্ট
```bash
# দ্রুত পুনরাবৃত্তির জন্য একটি নির্দিষ্ট সেবা ডিপ্লয় করুন
azd deploy --service web
azd deploy --service api

# সমস্ত সেবা ডিপ্লয় করুন
azd deploy
```

### বিল্ড ক্যাশিং
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### কার্যকর কোড ডিপ্লয়মেন্ট
```bash
# শুধু কোড পরিবর্তনের জন্য azd deploy ব্যবহার করুন (azd up নয়)
# এটি অবকাঠামো প্রোভিশনিং এড়িয়ে যায় এবং অনেক দ্রুত
azd deploy

# সবচেয়ে দ্রুত পুনরাবৃত্তির জন্য নির্দিষ্ট সার্ভিস ডিপ্লয় করুন
azd deploy --service api
```

## 🔍 ডিপ্লয়মেন্ট মনিটরিং

### রিয়েল-টাইম ডিপ্লয়মেন্ট মনিটরিং
```bash
# রিয়েল-টাইমে অ্যাপ্লিকেশন পর্যবেক্ষণ করুন
azd monitor --live

# অ্যাপ্লিকেশনের লগ দেখুন
azd monitor --logs

# ডিপ্লয়মেন্টের অবস্থা পরীক্ষা করুন
azd show
```

### হেলথ চেকস
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

# অ্যাপ্লিকেশনের স্বাস্থ্য পরীক্ষা করুন
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

## 🔐 সিকিউরিটি বিবেচ্য বিষয়

### সিক্রেট ম্যানেজমেন্ট
```bash
# গোপন তথ্য নিরাপদে সংরক্ষণ করুন
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml-এ গোপন তথ্য রেফারেন্স করুন
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

### নেটওয়ার্ক সিকিউরিটি
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### আইডেন্টিটি এবং অ্যাক্সেস ম্যানেজমেন্ট
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
# AZD-এ অন্তর্নির্মিত রোলব্যাক নেই। সুপারিশকৃত পদ্ধতিগুলি:

# বিকল্প 1: Git থেকে পুনরায় ডিপ্লয় (সুপারিশকৃত)
git revert HEAD  # সমস্যাজনক কমিটটি পূর্বাবস্থায় ফিরিয়ে আনুন
git push
azd deploy

# বিকল্প 2: নির্দিষ্ট কমিটটি পুনরায় ডিপ্লয় করুন
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### অবকাঠামো রোলব্যাক
```bash
# প্রয়োগের আগে অবকাঠামো পরিবর্তনগুলি পূর্বদৃশ্য দেখুন
azd provision --preview

# অবকাঠামো রোলব্যাকের জন্য সংস্করণ নিয়ন্ত্রণ ব্যবহার করুন:
git revert HEAD  # অবকাঠামো পরিবর্তনগুলি ফেরত নিন
azd provision    # পূর্ববর্তী অবকাঠামো অবস্থা প্রয়োগ করুন
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

### ডিপ্লয়মেন্ট পারফরম্যান্স ট্র্যাক করুন
```bash
# বর্তমান ডিপ্লয়মেন্টের অবস্থা দেখুন
azd show

# Application Insights দিয়ে অ্যাপ্লিকেশন পর্যবেক্ষণ করুন
azd monitor --overview

# লাইভ মেট্রিক্স দেখুন
azd monitor --live
```

### কাস্টম মেট্রিকস সংগ্রহ
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

## 🎯 শ্রেষ্ঠ অনুশীলন

### 1. পরিবেশের সামঞ্জস্য
```bash
# নামকরণে সামঞ্জস্য বজায় রাখুন
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# বিভিন্ন পরিবেশের মধ্যে সামঞ্জস্য বজায় রাখুন
./scripts/sync-environments.sh
```

### 2. অবকাঠামো ভ্যালিডেশন
```bash
# নিয়োগের আগে অবকাঠামোর পরিবর্তনগুলি পূর্বদর্শন করুন
azd provision --preview

# ARM/Bicep লিন্টিং ব্যবহার করুন
az bicep lint --file infra/main.bicep

# Bicep সিনট্যাক্স যাচাই করুন
az bicep build --file infra/main.bicep
```

### 3. টেস্টিং ইন্টিগ্রেশন
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

### 4. ডকুমেন্টেশন এবং লগিং
```bash
# ডিপ্লয়মেন্ট প্রক্রিয়াগুলি নথিভুক্ত করুন
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## পরবর্তী ধাপ

- [রিসোর্স প্রোভিশনিং](provisioning.md) - অবকাঠামো ব্যবস্থাপনা সম্পর্কে গভীর অধ্যয়ন
- [প্রি-ডিপ্লয়মেন্ট পরিকল্পনা](../chapter-06-pre-deployment/capacity-planning.md) - আপনার ডিপ্লয়মেন্ট কৌশল পরিকল্পনা করুন
- [সাধারণ সমস্যা](../chapter-07-troubleshooting/common-issues.md) - ডিপ্লয়মেন্ট সমস্যাগুলো সমাধান করুন
- [সেরা অনুশীলন](../chapter-07-troubleshooting/debugging.md) - প্রোডাকশন-রেডি ডিপ্লয়মেন্ট কৌশল

## 🎯 হাতেকলমে ডিপ্লয়মেন্ট অনুশীলন

### অনুশীলন ১: ইনক্রিমেন্টাল ডিপ্লয়মেন্ট ওয়ার্কফ্লো (২০ মিনিট)
**লক্ষ্য**: পূর্ণ ও ইনক্রিমেন্টাল ডিপ্লয়মেন্টগুলোর মধ্যে পার্থক্য আয়ত্ত করা

```bash
# প্রাথমিক ডিপ্লয়মেন্ট
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# প্রাথমিক ডিপ্লয়মেন্টের সময় রেকর্ড করুন
echo "Full deployment: $(date)" > deployment-log.txt

# কোডে পরিবর্তন করুন
echo "// Updated $(date)" >> src/api/src/server.js

# শুধুমাত্র কোড ডিপ্লয় করুন (দ্রুত)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# সময়গুলি তুলনা করুন
cat deployment-log.txt

# পরিষ্কার করুন
azd down --force --purge
```

**সাফল্যের মানদণ্ড:**
- [ ] পূর্ণ ডিপ্লয়মেন্টে ৫-১৫ মিনিট লাগে
- [ ] কেবল কোড ডিপ্লয়মেন্টে ২-৫ মিনিট লাগে
- [ ] কোড পরিবর্তন ডিপ্লয় করা অ্যাপে প্রতিফলিত হচ্ছে
- [ ] `azd deploy` চালানোর পরে অবকাঠামো অপরিবর্তিত থাকে

**শেখার ফলাফল**: কোড পরিবর্তনের জন্য `azd deploy` হল `azd up`-এর তুলনায় ৫০-৭০% দ্রুততর

### অনুশীলন ২: কাস্টম ডিপ্লয়মেন্ট হুকস (৩০ মিনিট)
**লক্ষ্য**: প্রি এবং পোস্ট-ডিপ্লয়মেন্ট অটোমেশন বাস্তবায়ন করা

```bash
# প্রি-ডিপ্লয় ভ্যালিডেশন স্ক্রিপ্ট তৈরি করুন
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# টেস্টগুলো পাস করেছে কি না পরীক্ষা করুন
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# কমিট না করা পরিবর্তন আছে কি না পরীক্ষা করুন
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ডিপ্লয়ের পর স্মোক টেস্ট তৈরি করুন
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

# azure.yaml-এ হুক যোগ করুন
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# হুকসহ ডিপ্লয় পরীক্ষা করুন
azd deploy
```

**সাফল্যের মানদণ্ড:**
- [ ] প্রি-ডিপ্লয় স্ক্রিপ্ট ডিপ্লয়মেন্টের আগে চলে
- [ ] টেস্ট ব্যর্থ হলে ডিপ্লয়মেন্ট বন্ধ হয়
- [ ] পোস্ট-ডিপ্লয় স্মোক টেস্ট হেলথ যাচাই করে
- [ ] হুকস সঠিক ক্রমে সম্পাদিত হয়

### অনুশীলন ৩: বহু-পরিবেশ ডিপ্লয়মেন্ট কৌশল (৪৫ মিনিট)
**লক্ষ্য**: পর্যায়ভিত্তিক ডিপ্লয়মেন্ট ওয়ার্কফ্লো বাস্তবায়ন করা (dev → staging → production)

```bash
# ডিপ্লয়মেন্ট স্ক্রিপ্ট তৈরি করুন
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ধাপ ১: ডেভেলপমেন্ট পরিবেশে ডিপ্লয় করুন
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ধাপ ২: স্টেজিং পরিবেশে ডিপ্লয় করুন
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ধাপ ৩: প্রোডাকশনের জন্য ম্যানুয়াল অনুমোদন
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

# পরিবেশ তৈরি করুন
azd env new dev
azd env new staging
azd env new production

# ধাপে ধাপে ডিপ্লয়মেন্ট চালান
./deploy-staged.sh
```

**সাফল্যের মানদণ্ড:**
- [ ] Dev পরিবেশ সফলভাবে ডিপ্লয় হয়
- [ ] Staging পরিবেশ সফলভাবে ডিপ্লয় হয়
- [ ] প্রোডাকশনের জন্য ম্যানুয়াল অনুমোদন প্রয়োজন
- [ ] সব পরিবেশে কার্যকর হেলথ চেকস আছে
- [ ] প্রয়োজন হলে রোলব্যাক করা যায়

### অনুশীলন ৪: রোলব্যাক কৌশল (২৫ মিনিট)
**লক্ষ্য**: Git ব্যবহার করে ডিপ্লয়মেন্ট রোলব্যাক বাস্তবায়ন এবং পরীক্ষা করা

```bash
# v1 ডিপ্লয় করুন
azd env set APP_VERSION "1.0.0"
azd up

# v1 কমিট হ্যাশ সংরক্ষণ করুন
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ব্রেকিং পরিবর্তন সহ v2 ডিপ্লয় করুন
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ব্যর্থতা সনাক্ত করুন এবং রোলব্যাক করুন
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ব্যবহার করে রোলব্যাক করুন
    git revert HEAD --no-edit
    
    # পরিবেশ রোলব্যাক করুন
    azd env set APP_VERSION "1.0.0"
    
    # v1 পুনরায় ডিপ্লয় করুন
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**সাফল্যের মানদণ্ড:**
- [ ] ডিপ্লয়মেন্ট ব্যর্থতা সনাক্ত করতে পারে
- [ ] রোলব্যাক স্ক্রিপ্ট স্বয়ংক্রিয়ভাবে চলাচ্ছে
- [ ] অ্যাপ্লিকেশন কাজ করা অবস্থায় ফিরে আসে
- [ ] রোলব্যাকের পরে হেলথ চেকস পাস করে

## 📊 ডিপ্লয়মেন্ট মেট্রিক্স ট্র্যাকিং

### আপনার ডিপ্লয়মেন্ট পারফরম্যান্স ট্র্যাক করুন

```bash
# ডিপ্লয়মেন্ট মেট্রিক্স স্ক্রিপ্ট তৈরি করুন
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

# ফাইলে লগ করুন
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# এটি ব্যবহার করুন
./track-deployment.sh
```

**আপনার মেট্রিকস বিশ্লেষণ করুন:**
```bash
# ডিপ্লয়মেন্ট ইতিহাস দেখুন
cat deployment-metrics.csv

# গড় ডিপ্লয়মেন্ট সময় গণনা করুন
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## অতিরিক্ত রিসোর্স

- [Azure Developer CLI ডিপ্লয়মেন্ট রেফারেন্স](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [আপনার প্রথম প্রজেক্ট](../chapter-01-foundation/first-project.md)
- **পরবর্তী পাঠ**: [রিসোর্স প্রোভিশনিং](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকার:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা নিশ্চিত করার চেষ্টা করি, তবে অনুগ্রহ করে জানতে হবে যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকেই প্রামাণ্য উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট কোনো ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->