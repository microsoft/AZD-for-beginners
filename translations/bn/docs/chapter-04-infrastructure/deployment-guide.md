# ডিপ্লয়মেন্ট গাইড - AZD ডিপ্লয়মেন্টে দক্ষতা অর্জন

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনার্স](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৪ - অবকাঠামো কোড ও ডিপ্লয়মেন্ট
- **⬅️ পূর্ববর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)
- **➡️ পরবর্তী**: [প্রোভিশনিং রিসোর্সেস](provisioning.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৫: মাল্টি-এজেন্ট AI সমাধান](../../examples/retail-scenario.md)

## পরিচিতি

এই বিস্তৃত গাইডটি নিম্ন থেকে শুরু করে অ্যাজিউর ডেভেলপার CLI ব্যবহার করে অ্যাপ্লিকেশন ডিপ্লয়মেন্টে আপনাকে যা জানতে হবে তা কভার করে, সিঙ্গেল-কমান্ড ডিপ্লয়মেন্ট থেকে উন্নত প্রোডাকশন সিনারিও, কাস্টম হুক্স, একাধিক পরিবেশ এবং CI/CD ইন্টিগ্রেশন পর্যন্ত। ব্যবহারিক উদাহরণ এবং সেরা অনুশীলনের মাধ্যমে সম্পূর্ণ ডিপ্লয়মেন্ট জীবনচক্রে দক্ষতা অর্জন করুন।

## শেখার উদ্দেশ্যসমূহ

এই গাইড সম্পন্ন করার মাধ্যমে আপনি:
- সব Azure Developer CLI ডিপ্লয়মেন্ট কমান্ড এবং ওয়ার্কফ্লোতে দক্ষ হবেন
- প্রোভিশন থেকে মনিটরিং পর্যন্ত সম্পূর্ণ ডিপ্লয়মেন্ট জীবনচক্র বুঝতে পারবেন
- প্রি এবং পোস্ট-ডিপ্লয়মেন্ট অটোমেশনের জন্য কাস্টম ডিপ্লয়মেন্ট হুক্স প্রয়োগ করতে পারবেন
- পরিবেশ-নির্দিষ্ট প্যারামিটার সহ একাধিক পরিবেশ কনফিগার করতে পারবেন
- ব্লু-গ্রিন ও ক্যানারি ডিপ্লয়মেন্টসহ উন্নত ডিপ্লয়মেন্ট স্ট্র্যাটেজি সেটআপ করতে পারবেন
- azd ডিপ্লয়মেন্টগুলোকে CI/CD পাইপলাইন এবং DevOps ওয়ার্কফ্লোর সাথে ইন্টিগ্রেট করতে পারবেন

## শেখার ফলাফল

সমাপ্তির পর, আপনি সক্ষম হবেন:
- একা একে সকল azd ডিপ্লয়মেন্ট ওয়ার্কফ্লো চালানো এবং সমস্যার সমাধান করা
- হুক্স ব্যবহার করে কাস্টম ডিপ্লয়মেন্ট অটোমেশন ডিজাইন ও বাস্তবায়ন করা
- সঠিক সিকিউরিটি ও মনিটরিংসহ প্রোডাকশন-রেডি ডিপ্লয়মেন্ট কনফিগার করা
- জটিল মাল্টি-এনভায়রনমেন্ট ডিপ্লয়মেন্ট সিনারিও পরিচালনা করা
- ডিপ্লয়মেন্ট পারফরম্যান্স অপ্টিমাইজ করা এবং রোলব্যাক স্ট্র্যাটেজি বাস্তবায়ন করা
- azd ডিপ্লয়মেন্টগুলোকে এন্টারপ্রাইজ DevOps প্র্যাকটিসে ইন্টিগ্রেট করা

## ডিপ্লয়মেন্ট ওভারভিউ

Azure Developer CLI কয়েকটি ডিপ্লয়মেন্ট কমান্ড প্রদান করে:
- `azd up` - সম্পূর্ণ ওয়ার্কফ্লো (প্রোভিশন + ডিপ্লয়)
- `azd provision` - শুধুমাত্র Azure রিসোর্স তৈরি/আপডেট
- `azd deploy` - শুধুমাত্র অ্যাপ্লিকেশন কোড ডিপ্লয়
- `azd package` - অ্যাপ্লিকেশন বিল্ড এবং প্যাকেজ

## মৌলিক ডিপ্লয়মেন্ট ওয়ার্কফ্লো

### সম্পূর্ণ ডিপ্লয়মেন্ট (azd up)
নতুন প্রকল্পের জন্য সবচেয়ে সাধারণ ওয়ার্কফ্লো:
```bash
# সমস্ত কিছু শূন্য থেকে মোতায়েন করুন
azd up

# নির্দিষ্ট পরিবেশ সহ মোতায়েন করুন
azd up --environment production

# কাস্টম প্যারামিটার সহ মোতায়েন করুন
azd up --parameter location=westus2 --parameter sku=P1v2
```

### শুধুমাত্র অবকাঠামো ডিপ্লয়মেন্ট
যখন শুধু Azure রিসোর্স আপডেট করার প্রয়োজন:
```bash
# অবকাঠামো প্রবর্তন/হালনাগাদ
azd provision

# পরিবর্তনগুলো পূর্বদর্শনের জন্য ড্রাই-রানের সাথে প্রবর্তন
azd provision --preview

# নির্দিষ্ট সেবাসমূহ প্রবর্তন
azd provision --service database
```

### শুধুমাত্র কোড ডিপ্লয়মেন্ট
দ্রুত অ্যাপ্লিকেশন আপডেটের জন্য:
```bash
# সমস্ত সেবা স্থাপন করুন
azd deploy

# প্রত্যাশিত আউটপুট:
# সেবা স্থাপন করা হচ্ছে (azd deploy)
# - ওয়েব: স্থাপন করা হচ্ছে... সম্পন্ন
# - এপিআই: স্থাপন করা হচ্ছে... সম্পন্ন
# সফল: আপনার স্থাপনাটি ২ মিনিট ১৫ সেকেন্ডে শেষ হয়েছে

# নির্দিষ্ট সেবা স্থাপন করুন
azd deploy --service web
azd deploy --service api

# কাস্টম বিল্ড আর্গুমেন্ট সহ স্থাপন করুন
azd deploy --service api --build-arg NODE_ENV=production

# স্থাপন যাচাই করুন
azd show --output json | jq '.services'
```

### ✅ ডিপ্লয়মেন্ট যাচাই

যেকোনো ডিপ্লয়মেন্টের পরে সফলতা যাচাই করুন:

```bash
# সমস্ত পরিষেবা চলছে কিনা যাচাই করুন
azd show

# স্বাস্থ্য শেষ বিন্দুগুলি পরীক্ষা করুন
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ত্রুটির জন্য নজরদারি করুন (ডিফল্টরূপে ব্রাউজারে খোলে)
azd monitor --logs
```

**সফলতা মাপকাঠি:**
- ✅ সব সার্ভিসের "রানিং" স্ট্যাটাস দেখা যাচ্ছে
- ✅ হেলথ এন্ডপয়েন্ট থেকে HTTP 200 রিটার্ন করছে
- ✅ শেষ ৫ মিনিটে কোনো এরর লগ নেই
- ✅ অ্যাপ্লিকেশন টেস্ট রিকুয়েস্টে সাড়া দিচ্ছে

## 🏗️ ডিপ্লয়মেন্ট প্রক্রিয়া বোঝা

### ধাপ ১: প্রি-প্রোভিশন হুক্স
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
- অবকাঠামো টেমপ্লেট পড়া (Bicep/Terraform)
- Azure রিসোর্স তৈরি বা আপডেট
- নেটওয়ার্কিং ও সিকিউরিটি কনফিগারেশন
- মনিটরিং ও লগিং সেটআপ

### ধাপ ৩: পোস্ট-প্রোভিশন হুক্স
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
- অ্যাপ্লিকেশন কোড বিল্ড করা
- ডিপ্লয়মেন্ট আর্টিফ্যাক্ট তৈরি করা
- টার্গেট প্ল্যাটফর্ম (কন্টেইনার, ZIP ফাইল ইত্যাদি) জন্য প্যাকেজিং

### ধাপ ৫: প্রি-ডিপ্লয় হুক্স
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
- প্যাকেজকৃত অ্যাপ্লিকেশনগুলো Azure সার্ভিসে ডিপ্লয় করা
- কনফিগারেশন সেটিংস আপডেট করা
- সার্ভিস চালু/রিস্টার্ট করা

### ধাপ ৭: পোস্ট-ডিপ্লয় হুক্স
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

### সার্ভিস-স্পেসিফিক ডিপ্লয়মেন্ট সেটিংস
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

# উৎপাদন পরিবেশ
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 উন্নত ডিপ্লয়মেন্ট সিনারিও

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
# নীল পরিবেশ তৈরি করুন
azd env new production-blue
azd up --environment production-blue

# নীল পরিবেশ পরীক্ষা করুন
./scripts/test-environment.sh production-blue

# নীলের দিকে ট্রাফিক পরিবর্তন করুন (ম্যানুয়াল DNS/লোড ব্যালান্সার আপডেট)
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

### সার্ভিস-স্পেসিফিক ডিপ্লয়মেন্ট
```bash
# দ্রুত পুনরাবৃত্তির জন্য একটি নির্দিষ্ট পরিষেবা স্থাপন করুন
azd deploy --service web
azd deploy --service api

# সমস্ত পরিষেবা স্থাপন করুন
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
# শুধুমাত্র কোড পরিবর্তনের জন্য azd deploy (azd up নয়) ব্যবহার করুন
# এটি অবকাঠামো প্রোভিশনিং এড়িয়ে চলে এবং অনেক দ্রুত হয়
azd deploy

# সবচেয়ে দ্রুত পুনরাবৃত্তির জন্য নির্দিষ্ট সার্ভিস ডিপ্লয় করুন
azd deploy --service api
```

## 🔍 ডিপ্লয়মেন্ট মনিটরিং

### রিয়েল-টাইম ডিপ্লয়মেন্ট মনিটরিং
```bash
# অ্যাপ্লিকেশনটি বাস্তব সময়ে পর্যবেক্ষণ করুন
azd monitor --live

# অ্যাপ্লিকেশন লগগুলি দেখুন
azd monitor --logs

# মোতায়েনের অবস্থা যাচাই করুন
azd show
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

### পোস্ট-ডিপ্লয়মেন্ট যাচাই
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# অ্যাপ্লিকেশন স্বাস্থ্যের পরীক্ষা করুন
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

## 🔐 সিকিউরিটি বিবেচনা

### সিক্রেটস ম্যানেজমেন্ট
```bash
# গোপন তথ্য নিরাপদে সংরক্ষণ করুন
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml-এ গোপন তথ্য বোঝানো হয়েছে
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

## 🚨 রোলব্যাক স্ট্র্যাটেজি

### দ্রুত রোলব্যাক
```bash
# AZD এর বিল্ট-ইন রোলব্যাক নেই। সুপারিশকৃত পদ্ধতিসমূহ:

# অপশন 1: গিট থেকে পুনঃমোতায়েন (সুপারিশকৃত)
git revert HEAD  # সমস্যা সৃষ্টিকারী কমিট ফিরিয়ে নিন
git push
azd deploy

# অপশন 2: নির্দিষ্ট কমিট পুনঃমোতায়েন করুন
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### অবকাঠামো রোলব্যাক
```bash
# প্রয়োগের আগে অবকাঠামো পরিবর্তনগুলি পূর্বদর্শন করুন
azd provision --preview

# অবকাঠামো রোলব্যাকের জন্য, সংস্করণ নিয়ন্ত্রণ ব্যবহার করুন:
git revert HEAD  # অবকাঠামো পরিবর্তনগুলি প্রত্যাহার করুন
azd provision    # পূর্ববর্তী অবকাঠামো অবস্থা প্রয়োগ করুন
```

### ডাটাবেস মাইগ্রেশন রোলব্যাক
```bash
#!/bin/bash
# স্ক্রিপ্টস/রোলব্যাক-ডাটাবেস.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ডিপ্লয়মেন্ট মেট্রিক্স

### ডিপ্লয়মেন্ট পারফরম্যান্স ট্র্যাক করুন
```bash
# বর্তমান ডিপ্লয়মেন্ট স্থিতি দেখুন
azd show

# অ্যাপ্লিকেশন ইনসাইটস দিয়ে অ্যাপ্লিকেশন মনিটর করুন
azd monitor --overview

# লাইভ মেট্রিক্স দেখুন
azd monitor --live
```

### কাস্টম মেট্রিক সংগ্রহ
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

## 🎯 সেরা অনুশীলনসমূহ

### ১. পরিবেশের ধারাবাহিকতা
```bash
# সঙ্গতিপূর্ণ নামকরণ ব্যবহার করুন
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# পরিবেশের সামঞ্জস্য বজায় রাখুন
./scripts/sync-environments.sh
```

### ২. অবকাঠামো যাচাই
```bash
# ডিপ্লয়মেন্টের আগে অবকাঠামো পরিবর্তনগুলি পূর্বরূপ দেখুন
azd provision --preview

# ARM/Bicep লিন্টিং ব্যবহার করুন
az bicep lint --file infra/main.bicep

# Bicep সিনট্যাক্স যাচাই করুন
az bicep build --file infra/main.bicep
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
# ডকুমেন্ট ডেপ্লয়মেন্ট প্রক্রিয়া
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## পরবর্তী ধাপসমূহ

- [প্রোভিশনিং রিসোর্সেস](provisioning.md) - অবকাঠামো ব্যবস্থাপনায় গভীর প্রবেশ
- [প্রি-ডিপ্লয়মেন্ট পরিকল্পনা](../chapter-06-pre-deployment/capacity-planning.md) - আপনার ডিপ্লয়মেন্ট স্ট্র্যাটেজি পরিকল্পনা করুন
- [সাধারণ সমস্যা](../chapter-07-troubleshooting/common-issues.md) - ডিপ্লয়মেন্ট সমস্যা সমাধান
- [সেরা অনুশীলন](../chapter-07-troubleshooting/debugging.md) - প্রোডাকশন-রেডি ডিপ্লয়মেন্ট স্ট্র্যাটেজি

## 🎯 হাতে-কলমে ডিপ্লয়মেন্ট অনুশীলন

### অনুশীলন ১: ইনক্রিমেন্টাল ডিপ্লয়মেন্ট ওয়ার্কফ্লো (২০ মিনিট)
**উদ্দেশ্য**: সম্পূর্ণ এবং ইনক্রিমেন্টাল ডিপ্লয়মেন্টের পার্থক্য মাস্টার করা

```bash
# প্রাথমিক স্থাপন
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# প্রাথমিক স্থাপনার সময় রেকর্ড করুন
echo "Full deployment: $(date)" > deployment-log.txt

# কোড পরিবর্তন করুন
echo "// Updated $(date)" >> src/api/src/server.js

# শুধুমাত্র কোড স্থাপন করুন (দ্রুত)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# সময়গুলি তুলনা করুন
cat deployment-log.txt

# পরিষ্কার করুন
azd down --force --purge
```

**সফলতার মানদণ্ড:**
- [ ] সম্পূর্ণ ডিপ্লয়মেন্টে ৫-১৫ মিনিট সময় লাগে
- [ ] শুধু কোড ডিপ্লয়মেন্টে ২-৫ মিনিট সময় লাগে
- [ ] ডিপ্লয়মেন্টকৃত অ্যাপে কোড পরিবর্তন প্রতিফলিত হয়
- [ ] `azd deploy` করার পর অবকাঠামো অপরিবর্তিত থাকে

**শেখার ফলাফল**: কোড পরিবর্তনের জন্য `azd deploy` `azd up` থেকে ৫০-৭০% দ্রুত

### অনুশীলন ২: কাস্টম ডিপ্লয়মেন্ট হুক্স (৩০ মিনিট)
**উদ্দেশ্য**: প্রি ও পোস্ট-ডিপ্লয়মেন্ট অটোমেশন বাস্তবায়ন

```bash
# প্রি-ডিপ্লয় যাচাইকরণ স্ক্রিপ্ট তৈরি করুন
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# পরীক্ষা গুলো পাস হয়েছে কিনা চেক করুন
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# অনকমিটেড পরিবর্তন আছে কিনা চেক করুন
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# পোস্ট-ডিপ্লয় স্মোক টেস্ট তৈরি করুন
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

# azure.yaml এ হুকস যোগ করুন
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# হুকস দিয়ে ডিপ্লয়মেন্ট পরীক্ষা করুন
azd deploy
```

**সফলতার মানদণ্ড:**
- [ ] ডিপ্লয়মেন্টের আগে প্রি-ডিপ্লয় স্ক্রিপ্ট চলছে
- [ ] টেস্ট ব্যর্থ হলে ডিপ্লয়মেন্ট বন্ধ হয়
- [ ] পোস্ট-ডিপ্লয় স্মোক টেস্ট হেলথ যাচাই করে
- [ ] হুক্স সঠিক ক্রমে কার্যকর হচ্ছে

### অনুশীলন ৩: মাল্টি-এনভায়রনমেন্ট ডিপ্লয়মেন্ট স্ট্র্যাটেজি (৪৫ মিনিট)
**উদ্দেশ্য**: স্টেজড ডিপ্লয়মেন্ট ওয়ার্কফ্লো বাস্তবায়ন (ডেভ → স্টেজিং → প্রোডাকশন)

```bash
# ডিপ্লয়মেন্ট স্ক্রিপ্ট তৈরি করুন
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ধাপ ১: ডেভেলপমেন্টে ডিপ্লয় করুন
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ধাপ ২: স্টেজিং এ ডিপ্লয় করুন
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

# স্টেজড ডিপ্লয়মেন্ট চালান
./deploy-staged.sh
```

**সফলতার মানদণ্ড:**
- [ ] ডেভ পরিবেশ সফলভাবে ডিপ্লয় হয়
- [ ] স্টেজিং পরিবেশ সফলভাবে ডিপ্লয় হয়
- [ ] প্রোডাকশনের জন্য ম্যানুয়াল অনুমোদন প্রয়োজন
- [ ] সব পরিবেশে কার্যকর হেলথ চেক রয়েছে
- [ ] প্রয়োজনে রোলব্যাক করা যায়

### অনুশীলন ৪: রোলব্যাক স্ট্র্যাটেজি (২৫ মিনিট)
**উদ্দেশ্য**: গিট ব্যবহার করে ডিপ্লয়মেন্ট রোলব্যাক বাস্তবায়ন ও পরীক্ষা

```bash
# v1 ডেপ্লয় করুন
azd env set APP_VERSION "1.0.0"
azd up

# v1 কমিট হ্যাশ সংরক্ষণ করুন
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ব্রেকিং চেঞ্জ সহ v2 ডেপ্লয় করুন
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ব্যর্থতা শনাক্ত করুন এবং রোলব্যাক করুন
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # গিট ব্যবহার করে রোলব্যাক করুন
    git revert HEAD --no-edit
    
    # পরিবেশ রোলব্যাক করুন
    azd env set APP_VERSION "1.0.0"
    
    # v1 পুনরায় ডেপ্লয় করুন
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**সফলতার মানদণ্ড:**
- [ ] ডিপ্লয়মেন্ট ব্যর্থতা শনাক্ত করতে পারে
- [ ] রোলব্যাক স্ক্রিপ্ট স্বয়ংক্রিয়ভাবে চালিত হয়
- [ ] অ্যাপ্লিকেশন কাজের অবস্থায় ফিরিয়ে আনে
- [ ] রোলব্যাকের পরে হেলথ চেক পাস হয়

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# ফাইলে লগ করুন
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# এটি ব্যবহার করুন
./track-deployment.sh
```

**আপনার মেট্রিক্স বিশ্লেষণ করুন:**
```bash
# মোতায়েনের ইতিহাস দেখুন
cat deployment-metrics.csv

# গড় মোতায়েন সময় হিসাব করুন
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## অতিরিক্ত রিসোর্স

- [Azure Developer CLI ডিপ্লয়মেন্ট রেফারেন্স](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [আপনার প্রথম প্রকল্প](../chapter-01-foundation/first-project.md)
- **পরবর্তী পাঠ**: [প্রোভিশনিং রিসোর্সেস](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। আমরা যথাসম্ভব সঠিকতার জন্য চেষ্টা করি, তবে দয়া করে জানুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথি তার নিজস্ব ভাষায় কর্তৃত্বপূর্ণ উৎস হিসাবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে, পেশাদার মানব অনুবাদের পরামর্শ দেওয়া হয়। এই অনুবাদের ব্যবহারের ফলে সৃষ্ট কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->