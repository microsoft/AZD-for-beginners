# ডিপ্লয়মেন্ট গাইড - AZD ডিপ্লয়মেন্টে দক্ষতা অর্জন

**চ্যাপ্টার নেভিগেশন:**
- **📚 Course Home**: [শুরুকারীদের জন্য AZD](../../README.md)
- **📖 Current Chapter**: Chapter 4 - ইনফ্রাস্ট্রাকচার অ্যাজ কোড ও ডিপ্লয়মেন্ট
- **⬅️ Previous Chapter**: [চ্যাপ্টার 3: কনফিগারেশন](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [রিসোর্স প্রোভিশনিং](provisioning.md)
- **🚀 Next Chapter**: [চ্যাপ্টার 5: মাল্টি-এজেন্ট AI সমাধান](../../examples/retail-scenario.md)

## ভূমিকা

এই বিস্তৃত গাইডটি Azure Developer CLI ব্যবহার করে অ্যাপ্লিকেশন ডিপ্লয় করার বিষয়ে আপনাকে যা জানতে হবে সবকিছু কভার করে, প্রাথমিক এক-কমান্ড ডিপ্লয়মেন্ট থেকে শুরু করে কাস্টম হুক, একাধিক পরিবেশ এবং CI/CD ইন্টিগ্রেশন সহ উন্নত প্রোডাকশন দৃশ্যাবলী পর্যন্ত। বাস্তব উদাহরণ এবং সেরা অনুশীলনসমূহ সহ সম্পূর্ণ ডিপ্লয়মেন্ট লাইফসাইকেল আয়ত্ত করুন।

## শেখার লক্ষ্য

By completing this guide, you will:
- Azure Developer CLI-এর সব ডিপ্লয়মেন্ট কমান্ড এবং ওয়ার্কফ্লো আয়ত্ত করুন
- প্রোভিশনিং থেকে মনিটরিং পর্যন্ত সম্পূর্ণ ডিপ্লয়মেন্ট লাইফসাইকেল বুঝুন
- প্রি ও পোস্ট-ডিপ্লয়মেন্ট অটোমেশন এর জন্য কাস্টম ডিপ্লয়মেন্ট হুক বাস্তবায়ন করুন
- পরিবেশ-নির্দিষ্ট প্যারামিটার সহ একাধিক পরিবেশ কনফিগার করুন
- ব্লু-গ্রিন এবং ক্যানারি ডিপ্লয়মেন্টসহ উন্নত ডিপ্লয়মেন্ট কৌশল সেট আপ করুন
- azd ডিপ্লয়মেন্টকে CI/CD পাইপলাইন এবং DevOps ওয়ার্কফ্লোতে ইন্টিগ্রেট করুন

## শেখার ফলাফল

Upon completion, you will be able to:
- স্বাধীনভাবে সব azd ডিপ্লয়মেন্ট ওয়ার্কফ্লো চালান এবং সমস্যার সমাধান করুন
- হুক ব্যবহার করে কাস্টম ডিপ্লয়মেন্ট অটোমেশন ডিজাইন ও বাস্তবায়ন করুন
- সঠিক নিরাপত্তা ও মনিটরিং সহ প্রোডাকশন-রেডি ডিপ্লয়মেন্ট কনফিগার করুন
- জটিল মাল্টি-এনভায়রনমেন্ট ডিপ্লয়মেন্ট দৃশ্যাবলী পরিচালনা করুন
- ডিপ্লয়মেন্ট পারফরম্যান্স অপ্টিমাইজ করুন এবং রোলব্যাক কৌশল বাস্তবায়ন করুন
- azd ডিপ্লয়মেন্টকে এন্টারপ্রাইজ DevOps অনুশীলনের সাথে ইন্টিগ্রেট করুন

## ডিপ্লয়মেন্ট ওভারভিউ

Azure Developer CLI কয়েকটি ডিপ্লয়মেন্ট কমান্ড প্রদান করে:
- `azd up` - সম্পূর্ণ ওয়ার্কফ্লো (প্রোভিশন + ডিপ্লয়)
- `azd provision` - শুধুমাত্র Azure রিসোর্স তৈরি/আপডেট
- `azd deploy` - শুধুমাত্র অ্যাপ্লিকেশন কোড ডিপ্লয়
- `azd package` - অ্যাপ্লিকেশন বিল্ড এবং প্যাকেজ

## বেসিক ডিপ্লয়মেন্ট ওয়ার্কফ্লো

### সম্পূর্ণ ডিপ্লয়মেন্ট (azd up)
নতুন প্রকল্পগুলির জন্য সবচেয়ে সাধারণ ওয়ার্কফ্লো:
```bash
# শুরু থেকে সবকিছু ডিপ্লয় করুন
azd up

# নির্দিষ্ট পরিবেশ দিয়ে ডিপ্লয় করুন
azd up --environment production

# কাস্টম প্যারামিটার ব্যবহার করে ডিপ্লয় করুন
azd up --parameter location=westus2 --parameter sku=P1v2
```

### কেবল ইনফ্রাস্ট্রাকচার ডিপ্লয়মেন্ট
যখন আপনি কেবল Azure রিসোর্স আপডেট করতে চান:
```bash
# ইনফ্রাস্ট্রাকচার প্রদান/আপডেট
azd provision

# পরিবর্তনগুলি পূর্বদর্শন করার জন্য ড্রাই-রান সহ প্রভিশন
azd provision --preview

# নির্দিষ্ট পরিষেবা প্রদান
azd provision --service database
```

### কেবল কোড ডিপ্লয়মেন্ট
দ্রুত অ্যাপ্লিকেশন আপডেটের জন্য:
```bash
# সমস্ত সার্ভিস ডিপ্লয় করুন
azd deploy

# প্রত্যাশিত আউটপুট:
# সার্ভিস ডিপ্লয় করা হচ্ছে (azd deploy)
# - web: ডিপ্লয় করা হচ্ছে... সম্পন্ন
# - api: ডিপ্লয় করা হচ্ছে... সম্পন্ন
# সফল: আপনার ডিপ্লয়মেন্ট ২ মিনিট ১৫ সেকেন্ডে সম্পন্ন হয়েছে

# নির্দিষ্ট সার্ভিস ডিপ্লয় করুন
azd deploy --service web
azd deploy --service api

# কাস্টম বিল্ড আর্গুমেন্ট ব্যবহার করে ডিপ্লয় করুন
azd deploy --service api --build-arg NODE_ENV=production

# ডিপ্লয় যাচাই করুন
azd show --output json | jq '.services'
```

### ✅ ডিপ্লয়মেন্ট যাচাই

যেকোনো ডিপ্লয়মেন্টের পরে, সফলতা যাচাই করুন:

```bash
# সমস্ত পরিষেবা চলছে কিনা পরীক্ষা করুন
azd show

# স্বাস্থ্য এন্ডপয়েন্টগুলো পরীক্ষা করুন
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ত্রুটিগুলির জন্য পর্যবেক্ষণ করুন (ডিফল্টভাবে ব্রাউজারে খোলা হবে)
azd monitor --logs
```

**সফলতার মানদন্ড:**
- ✅ সব সার্ভিসে "Running" স্ট্যাটাস দেখায়
- ✅ হেলথ এন্ডপয়েন্টগুলো HTTP 200 রিটার্ন করে
- ✅ শেষ 5 মিনিটে কোনো এরর লগ নেই
- ✅ অ্যাপ্লিকেশন টেস্ট রিকোয়েস্টে সাড়া দেয়

## 🏗️ ডিপ্লয়মেন্ট প্রক্রিয়া বোঝা

### ধাপ 1: প্রি-প্রোভিশন হুক
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

### ধাপ 2: ইনফ্রাস্ট্রাকচার প্রোভিশনিং
- ইনফ্রাস্ট্রাকচার টেমপ্লেট পড়ে (Bicep/Terraform)
- Azure রিসোর্স তৈরি বা আপডেট করে
- নেটওয়ার্কিং এবং সিকিউরিটি কনফিগার করে
- মনিটরিং এবং লগিং সেট আপ করে

### ধাপ 3: পোস্ট-প্রোভিশন হুক
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

### ধাপ 4: অ্যাপ্লিকেশন প্যাকেজিং
- অ্যাপ্লিকেশন কোড বিল্ড করে
- ডিপ্লয়মেন্ট আর্টিফ্যাক্ট তৈরি করে
- টার্গেট প্ল্যাটফর্মের জন্য প্যাকেজ করে (containers, ZIP files, ইত্যাদি)

### ধাপ 5: প্রি-ডিপ্লয় হুক
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

### ধাপ 6: অ্যাপ্লিকেশন ডিপ্লয়মেন্ট
- প্যাকেজকৃত অ্যাপ্লিকেশনগুলো Azure সার্ভিসে ডিপ্লয় করে
- কনফিগারেশন সেটিংস আপডেট করে
- সার্ভিসগুলো শুরু/রিস্টার্ট করে

### ধাপ 7: পোস্ট-ডিপ্লয় হুক
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

## 🔧 উন্নত ডিপ্লয়মেন্ট দৃশ্যাবলী

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

# ট্র্যাফিক নীল পরিবেশে সরান (ম্যানুয়াল DNS/লোড ব্যালান্সার আপডেট)
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

## ⚡ কর্মক্ষমতা অপ্টিমাইজেশন

### সার্ভিস-নির্দিষ্ট ডিপ্লয়মেন্ট
```bash
# দ্রুত পুনরাবৃত্তির জন্য একটি নির্দিষ্ট সার্ভিস ডিপ্লয় করুন
azd deploy --service web
azd deploy --service api

# সমস্ত সার্ভিস ডিপ্লয় করুন
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
# কেবল কোড পরিবর্তনের জন্য azd deploy (azd up নয়) ব্যবহার করুন
# এটি অবকাঠামো প্রোভিশনিং বাদ দেয় এবং অনেক দ্রুত
azd deploy

# দ্রুততম পুনরাবৃত্তির জন্য নির্দিষ্ট সার্ভিস ডিপ্লয় করুন
azd deploy --service api
```

## 🔍 ডিপ্লয়মেন্ট মনিটরিং

### রিয়েল-টাইম ডিপ্লয়মেন্ট মনিটরিং
```bash
# অ্যাপ্লিকেশনকে রিয়েল-টাইমে পর্যবেক্ষণ করুন
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

## 🔐 নিরাপত্তা সংক্রান্ত বিবেচনা

### সিক্রেটস ম্যানেজমেন্ট
```bash
# গোপন তথ্য নিরাপদে সংরক্ষণ করুন
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml-এ গোপন তথ্য উল্লেখ করুন
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

### আইডেন্টিটি ও অ্যাক্সেস ম্যানেজমেন্ট
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
# AZD-এ বিল্ট-ইন রোলব্যাক নেই। সুপারিশকৃত পদ্ধতিসমূহ:

# বিকল্প 1: Git থেকে পুনরায় ডিপ্লয় (প্রস্তাবিত)
git revert HEAD  # সমস্যাযুক্ত কমিটটি ফিরিয়ে নিন
git push
azd deploy

# বিকল্প 2: নির্দিষ্ট কমিট পুনরায় ডিপ্লয়
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ইনফ্রাস্ট্রাকচার রোলব্যাক
```bash
# প্রয়োগের আগে অবকাঠামো পরিবর্তনগুলির পূর্বরূপ দেখুন
azd provision --preview

# অবকাঠামো রোলব্যাকের জন্য সংস্করণ নিয়ন্ত্রণ ব্যবহার করুন:
git revert HEAD  # অবকাঠামো পরিবর্তনগুলি পূর্বাবস্থায় ফিরিয়ে আনুন
azd provision    # পূর্ববর্তী অবকাঠামো অবস্থা প্রয়োগ করুন
```

### ডেটাবেস মাইগ্রেশন রোলব্যাক
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
# বর্তমান ডেপ্লয়মেন্টের অবস্থা দেখুন
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

## 🎯 সেরা অনুশীলন

### 1. পরিবেশের সঙ্গতি
```bash
# নামকরণে ধারাবাহিকতা বজায় রাখুন
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# পরিবেশগুলির সামঞ্জস্য বজায় রাখুন
./scripts/sync-environments.sh
```

### 2. ইনফ্রাস্ট্রাকচার ভ্যালিডেশন
```bash
# প্রয়োগের আগে অবকাঠামো পরিবর্তনগুলি পূর্বদর্শন করুন
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
# ডিপ্লয়মেন্ট পদ্ধতিগুলি নথিভুক্ত করুন
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## পরবর্তী ধাপ

- [রিসোর্স প্রোভিশনিং](provisioning.md) - ইনফ্রাস্ট্রাকচার পরিচালনার গভীর বিশ্লেষণ
- [প্রি-ডিপ্লয়মেন্ট পরিকল্পনা](../chapter-06-pre-deployment/capacity-planning.md) - আপনার ডিপ্লয়মেন্ট কৌশল পরিকল্পনা করুন
- [সাধারণ সমস্যা](../chapter-07-troubleshooting/common-issues.md) - ডিপ্লয়মেন্ট সমস্যাগুলি সমাধান করুন
- [সেরা অনুশীলন](../chapter-07-troubleshooting/debugging.md) - প্রোডাকশন-রেডি ডিপ্লয়মেন্ট কৌশল

## 🎯 হ্যান্ডস-オン ডিপ্লয়মেন্ট অনুশীলন

### অনুশীলন 1: ইনক্রিমেন্টাল ডিপ্লয়মেন্ট ওয়ার্কফ্লো (20 minutes)
**লক্ষ্য**: পূর্ণ ও ইনক্রিমেন্টাল ডিপ্লয়মেন্টের মধ্যে পার্থক্য আয়ত্ত করা

```bash
# প্রাথমিক স্থাপন
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# প্রাথমিক স্থাপনের সময় রেকর্ড করুন
echo "Full deployment: $(date)" > deployment-log.txt

# কোডে পরিবর্তন করুন
echo "// Updated $(date)" >> src/api/src/server.js

# শুধু কোড ডিপ্লয় করুন (দ্রুত)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# সময়গুলো তুলনা করুন
cat deployment-log.txt

# পরিষ্কার করুন
azd down --force --purge
```

**সফলতার মানদন্ড:**
- [ ] পূর্ণ ডিপ্লয়মেন্টে 5-15 মিনিট লাগে
- [ ] কেবল কোড ডিপ্লয়মেন্টে 2-5 মিনিট লাগে
- [ ] কোড পরিবর্তনগুলো ডিপ্লয় করা অ্যাপে প্রতিফলিত হয়
- [ ] ইনফ্রাস্ট্রাকচার `azd deploy` চালানোর পর অপরিবর্তিত থাকে

**শিক্ষার ফলাফল**: `azd deploy` কোড পরিবর্তনের জন্য `azd up` থেকে 50-70% দ্রুত

### অনুশীলন 2: কাস্টম ডিপ্লয়মেন্ট হুক (30 minutes)
**লক্ষ্য**: প্রি ও পোস্ট-ডিপ্লয়মেন্ট অটোমেশন বাস্তবায়ন করা

```bash
# প্রি-ডেপ্লয় যাচাইকরণ স্ক্রিপ্ট তৈরি করুন
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# টেস্টগুলি পাস করেছে কিনা পরীক্ষা করুন
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# কমিট না করা পরিবর্তন আছে কিনা পরীক্ষা করুন
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ডেপ্লয়ের পর স্মোক টেস্ট তৈরি করুন
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

# হুকসহ ডেপ্লয়মেন্ট পরীক্ষা করুন
azd deploy
```

**সফলতার মানদন্ড:**
- [ ] প্রি-ডিপ্লয় স্ক্রিপ্ট ডিপ্লয়মেন্টের আগে চলে
- [ ] টেস্ট ব্যর্থ হলে ডিপ্লয়মেন্ট বন্ধ হয়
- [ ] পোস্ট-ডিপ্লয় স্মোক টেস্ট হেলথ যাচাই করে
- [ ] হুকগুলো সঠিক ক্রমে এক্সিকিউট হয়

### অনুশীলন 3: মাল্টি-এনভায়রনমেন্ট ডিপ্লয়মেন্ট কৌশল (45 minutes)
**লক্ষ্য**: পর্যায়ভিত্তিক ডিপ্লয়মেন্ট ওয়ার্কফ্লো বাস্তবায়ন করুন (dev → staging → production)

```bash
# ডিপ্লয়মেন্ট স্ক্রিপ্ট তৈরি করুন
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ধাপ ১: ডেভ পরিবেশে ডিপ্লয় করুন
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

# ধাপ ৩: প্রোডাকশন পরিবেশের জন্য ম্যানুয়াল অনুমোদন
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

# পরিবেশগুলি তৈরি করুন
azd env new dev
azd env new staging
azd env new production

# ধাপে ধাপে ডিপ্লয়মেন্ট চালান
./deploy-staged.sh
```

**সফলতার মানদন্ড:**
- [ ] Dev এনভায়রনমেন্ট সফলভাবে ডিপ্লয় হয়
- [ ] Staging এনভায়রনমেন্ট সফলভাবে ডিপ্লয় হয়
- [ ] প্রোডাকশনের জন্য ম্যানুয়াল অনুমোদন প্রয়োজন
- [ ] সব এনভায়রনমেন্টে কার্যকর হেলথ চেক আছে
- [ ] প্রয়োজন হলে রোলব্যাক করা যায়

### অনুশীলন 4: রোলব্যাক কৌশল (25 minutes)
**লক্ষ্য**: Git ব্যবহার করে ডিপ্লয়মেন্ট রোলব্যাক বাস্তবায়ন এবং পরীক্ষা করা

```bash
# v1 ডিপ্লয় করুন
azd env set APP_VERSION "1.0.0"
azd up

# v1-এর কমিট হ্যাশ সংরক্ষণ করুন
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ব্রেকিং চেঞ্জসহ v2 ডিপ্লয় করুন
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

**সফলতার মানদন্ড:**
- [ ] ডিপ্লয়মেন্ট ব্যর্থতা সনাক্ত করতে পারে
- [ ] রোলব্যাক স্ক্রিপ্ট স্বয়ংক্রিয়ভাবে এক্সিকিউট হয়
- [ ] অ্যাপ্লিকেশন কার্যকর অবস্থায় ফিরে আসে
- [ ] রোলব্যাকের পর হেলথ চেক পাস করে

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

**আপনার মেট্রিক্স বিশ্লেষণ করুন:**
```bash
# ডিপ্লয়মেন্টের ইতিহাস দেখুন
cat deployment-metrics.csv

# গড় ডিপ্লয়মেন্টের সময় হিসাব করুন
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## অতিরিক্ত সম্পদ

- [Azure Developer CLI ডিপ্লয়মেন্ট রেফারেন্স](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**নেভিগেশন**
- **Previous Lesson**: [আপনার প্রথম প্রকল্প](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [রিসোর্স প্রোভিশনিং](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা যথাসম্ভব সঠিকতার চেষ্টা করি, তবুও অনুগ্রহ করে মনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসামঞ্জস্য থাকতে পারে। মূল নথিটিকে তার নিজ ভাষায় প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারের ফলে সৃষ্ট কোনো ভুলবোঝাবুঝি বা ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->