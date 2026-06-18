# ডিপ্লয়মেন্ট গাইড - AZD ডিপ্লয়মেন্টে দক্ষতা অর্জন

**চ্যাপ্টার নেভিগেশন:**
- **📚 Course Home**: [প্রারম্ভিকদের জন্য AZD](../../README.md)
- **📖 Current Chapter**: অধ্যায় 4 - ইনফ্রাস্ট্রাকচার অ্যাজ কোড & ডিপ্লয়মেন্ট
- **⬅️ Previous Chapter**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [রিসোর্স প্রোভিশনিং](provisioning.md)
- **🧩 Also in this chapter**: [নিজের টেমপ্লেট তৈরি করা](custom-templates.md)
- **🚀 Next Chapter**: [অধ্যায় ৫: মাল্টি-এজেন্ট AI সমাধানসমূহ](../../examples/retail-scenario.md)

## পরিচিতি

এই বিস্তৃত গাইডটি Azure Developer CLI ব্যবহার করে অ্যাপ্লিকেশন ডিপ্লয় সম্পর্কে যা কিছু জানা প্রয়োজন তা সবই কভার করে — সাধারণ সিঙ্গেল-কমান্ড ডিপ্লয়মেন্ট থেকে শুরু করে কাস্টম হুক, একাধিক পরিবেশ, এবং CI/CD একীকরণসহ উন্নত প্রোডাকশন দৃশ্যপট পর্যন্ত। ব্যবহারিক উদাহরণ ও সেরা অনুশীলনের মাধ্যমে সম্পূর্ণ ডিপ্লয়মেন্ট লাইফসাইকেল মাস্টার করুন।

## শেখার লক্ষ্য

By completing this guide, you will:
- Master all Azure Developer CLI deployment commands and workflows
- Understand the complete deployment lifecycle from provisioning to monitoring
- Implement custom deployment hooks for pre and post-deployment automation
- Configure multiple environments with environment-specific parameters
- Set up advanced deployment strategies including blue-green and canary deployments
- Integrate azd deployments with CI/CD pipelines and DevOps workflows

## শেখার ফলাফল

Upon completion, you will be able to:
- Execute and troubleshoot all azd deployment workflows independently
- Design and implement custom deployment automation using hooks
- Configure production-ready deployments with proper security and monitoring
- Manage complex multi-environment deployment scenarios
- Optimize deployment performance and implement rollback strategies
- Integrate azd deployments into enterprise DevOps practices

## ডিপ্লয়মেন্ট ওভারভিউ

Azure Developer CLI provides several deployment commands:
- `azd up` - সম্পূর্ণ ওয়ার্কফ্লো (প্রোভিশন + ডিপ্লয়)
- `azd provision` - কেবল Azure রিসোর্স তৈরি/হালনাগাদ করে
- `azd deploy` - কেবল অ্যাপ্লিকেশন কোড ডিপ্লয় করে
- `azd package` - অ্যাপ তৈরি ও প্যাকেজ করে

## মৌলিক ডিপ্লয়মেন্ট ওয়ার্কফ্লো

### সম্পূর্ণ ডিপ্লয়মেন্ট (azd up)
The most common workflow for new projects:
```bash
# শূন্য থেকে সবকিছু মোতায়েন করুন
azd up

# নির্দিষ্ট পরিবেশে মোতায়েন করুন
azd up --environment production

# কাস্টম প্যারামিটার দিয়ে মোতায়েন করুন
azd up --parameter location=westus2 --parameter sku=P1v2
```

### শুধুমাত্র ইনফ্রাস্ট্রাকচার ডিপ্লয়মেন্ট
When you only need to update Azure resources:
```bash
# ইনফ্রাস্ট্রাকচার প্রোভিশন/আপডেট
azd provision

# পরিবর্তনগুলি পূর্বদর্শনের জন্য ড্রাই-রানসহ প্রোভিশন
azd provision --preview

# নির্দিষ্ট সার্ভিসসমূহ প্রোভিশন
azd provision --service database
```

### শুধুমাত্র কোড ডিপ্লয়মেন্ট
For quick application updates:
```bash
# সমস্ত সার্ভিস ডিপ্লয় করুন
azd deploy

# প্রত্যাশিত আউটপুট:
# সার্ভিস ডিপ্লয় করা হচ্ছে (azd deploy)
# - web: ডিপ্লয় করা হচ্ছে... সম্পন্ন
# - api: ডিপ্লয় করা হচ্ছে... সম্পন্ন
# সফল: আপনার ডিপ্লয়মেন্ট 2 মিনিট 15 সেকেন্ডে সম্পন্ন হয়েছে

# নির্দিষ্ট সার্ভিস ডিপ্লয় করুন
azd deploy --service web
azd deploy --service api

# কাস্টম বিল্ড আর্গুমেন্ট ব্যবহার করে ডিপ্লয় করুন
azd deploy --service api --build-arg NODE_ENV=production

# ডিপ্লয়মেন্ট যাচাই করুন
azd show --output json | jq '.services'
```

### ✅ ডিপ্লয়মেন্ট যাচাই

After any deployment, verify success:

```bash
# সব সার্ভিস চলছে কি না পরীক্ষা করুন
azd show

# হেলথ এন্ডপয়েন্টগুলো পরীক্ষা করুন
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ত্রুটির জন্য নজর রাখুন (ডিফল্টভাবে ব্রাউজারে খুলবে)
azd monitor --logs
```

**সফলতার মানদণ্ড:**
- ✅ সমস্ত সার্ভিস "Running" স্ট্যাটাস দেখায়
- ✅ হেলথ এন্ডপয়েন্টগুলি HTTP 200 রিটার্ন করে
- ✅ শেষ 5 মিনিটে কোনো এরর লগ নেই
- ✅ অ্যাপ্লিকেশন টেস্ট রিকোয়েস্টের প্রতি সাড়া দেয়

## 🏗️ ডিপ্লয়মেন্ট প্রক্রিয়া বুঝুন

### হুক সম্পর্কে নতুন? এখান থেকেই শুরু করুন

A **হুক** হল এমন একটি কমান্ড যা azd ডিপ্লয় প্রক্রিয়ার নির্দিষ্ট মুহূর্তে স্বয়ংক্রিয়ভাবে চালায়—প্রোভিশনের আগে বা পরে, এবং আপনার কোড ডিপ্লয় করার আগে বা পরে। এগুলো আপনাকে ডিপ্লয়মেন্টের সাথে সর্বদা থাকা ছোট কাজগুলো অটোমেট করতে দেয়: ডেটাবেস সিড করা, মাইগ্রেশন চালানো, অ্যাসেট বিল্ড করা, বা লাইভ অ্যাপের স্মোক-টেস্ট করা।

| হুক | চালায়… | সাধারণ ব্যবহার |
|------|-------|------------|
| `preprovision` | রিসোর্স তৈরি হওয়ার আগে | প্রয়োজনীয়তা যাচাই করুন, একটি রেজিস্ট্রিতে লগ ইন করুন |
| `postprovision` | রিসোর্সগুলো তৈরি হওয়ার পরে | রিসোর্স কনফিগার করা, ডেটাবেস সেট আপ করা |
| `predeploy` | কোড ডিপ্লয় হওয়ার আগে | ফ্রন্ট-এন্ড অ্যাসেট বিল্ড করা, ইউনিট টেস্ট চালানো |
| `postdeploy` | কোড লাইভ হওয়ার পরে | DB মাইগ্রেশন চালানো, এন্ডপয়েন্ট স্মোক-টেস্ট করা |

Hooks live in your `azure.yaml`. Here's the smallest possible example—it just prints a message after deployment:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

That's it—next time you run `azd up`, the message prints automatically. You can also run a hook by itself, without a full deploy, which is great for testing:

```bash
azd hooks run postdeploy
```

The phases below show real-world hooks (migrations, tests, validation) for each stage.

### ধাপ ১: প্রি-প্রোভিশন হুক
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

### ধাপ ২: ইনফ্রাস্ট্রাকচার প্রোভিশনিং
- ইনফ্রাস্ট্রাকচার টেমপ্লেট (Bicep/Terraform) পড়ে
- Azure রিসোর্স তৈরি বা হালনাগাদ করে
- নেটওয়ার্কিং এবং সিকিউরিটি কনফিগার করে
- মনিটরিং ও লগিং সেট আপ করে

### ধাপ ৩: পোস্ট-প্রোভিশন হুক
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
- টার্গেট প্ল্যাটফর্মের জন্য প্যাকেজ করে (কনটেইনার, ZIP ফাইল ইত্যাদি)

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
- প্যাকেজড অ্যাপগুলো Azure সার্ভিসে ডিপ্লয় করে
- কনফিগারেশন সেটিংস আপডেট করে
- সার্ভিসগুলো স্টার্ট/রিস্টার্ট করে

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

### হুক ত্রুটি হ্যান্ডেল করা

By default, **if a hook command exits with a non-zero code, azd stops the whole operation.** This is usually what you want—a failed migration should halt the deploy, not ship a broken app. But it means hooks need to be written carefully.

**1. Make failures loud and intentional.** A hook fails when its last command returns a non-zero exit code. In shell scripts, add `set -e` so the hook stops at the first failing command instead of silently continuing:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Allow a hook to fail without stopping azd.** For non-critical steps (an optional cache warm-up, a best-effort notification), set `continueOnError: true`. azd logs the failure but keeps going:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Test hooks in isolation before a full run.** You don't have to run `azd up` to debug a hook—run it on its own and iterate quickly:

```bash
azd hooks run predeploy          # শুধুমাত্র predeploy হুক চালায়
azd hooks run postdeploy --service api
```

**4. Watch for OS-specific shells.** A hook using `shell: pwsh` needs PowerShell installed on the machine running it (including CI agents). Use `shell: sh` for the broadest portability, or provide both `windows` and `posix` variants:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **ডিবাগ টিপ:** run any azd command with `--debug` to see the exact hook command line and its full output—invaluable when a hook works locally but fails in CI.

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

## 🔧 উন্নত ডিপ্লয়মেন্ট দৃশ্যপট

### বহু-সার্ভিস অ্যাপ্লিকেশন
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

### ব্লু-গ্রীন ডিপ্লয়মেন্ট
```bash
# নীল পরিবেশ তৈরি করুন
azd env new production-blue
azd up --environment production-blue

# নীল পরিবেশ পরীক্ষা করুন
./scripts/test-environment.sh production-blue

# ট্রাফিক নীল পরিবেশে স্থানান্তর করুন (ম্যানুয়াল DNS/লোড ব্যালেন্সার আপডেট)
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

### স্তরভিত্তিক ডিপ্লয়মেন্ট
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

## 🐳 কনটেইনার ডিপ্লয়মেন্ট

### কনটেইনার অ্যাপ ডিপ্লয়মেন্ট
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
# দ্রুত পুনরাবৃত্তি করার জন্য একটি নির্দিষ্ট সার্ভিস ডিপ্লয় করুন
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

### দক্ষ কোড ডিপ্লয়মেন্ট
```bash
# শুধুমাত্র কোড পরিবর্তনের জন্য azd deploy ব্যবহার করুন (azd up নয়)
# এটি ইনফ্রাস্ট্রাকচার প্রোভিশনিং বাদ দেয় এবং অনেক দ্রুত
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

# অ্যাপ্লিকেশনের স্বাস্থ্য পরীক্ষা
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

### আইডেন্টিটি এবং অ্যাকসেস ম্যানেজমেন্ট
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
# AZD-তে বিল্ট-ইন রোলব্যাক নেই। সুপারিশকৃত পদ্ধতিসমূহ:

# বিকল্প 1: Git থেকে পুনরায় ডিপ্লয় করা (সুপারিশকৃত)
git revert HEAD  # সমস্যাযুক্ত কমিটটি পূর্বাবস্থায় ফিরিয়ে আনুন
git push
azd deploy

# বিকল্প 2: নির্দিষ্ট কমিট পুনরায় ডিপ্লয় করা
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ইনফ্রাস্ট্রাকচার রোলব্যাক
```bash
# প্রয়োগের আগে অবকাঠামো পরিবর্তনগুলি পূর্বদর্শন করুন
azd provision --preview

# অবকাঠামো রোলব্যাকের জন্য ভার্সন কন্ট্রোল ব্যবহার করুন:
git revert HEAD  # অবকাঠামো পরিবর্তনগুলি পূর্বাবস্থায় ফিরিয়ে আনুন
azd provision    # পূর্ববর্তী অবকাঠামোর অবস্থা প্রয়োগ করুন
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

## 📊 ডিপ্লয়মেন্ট মেট্রিকস

### ডিপ্লয়মেন্ট পারফরম্যান্স ট্র্যাক করুন
```bash
# বর্তমান ডেপ্লয়মেন্টের অবস্থা দেখুন
azd show

# Application Insights ব্যবহার করে অ্যাপ্লিকেশন পর্যবেক্ষণ করুন
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

### ১. পরিবেশের সামঞ্জস্য
```bash
# একরূপ নামকরণ ব্যবহার করুন
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# পরিবেশের সামঞ্জস্য বজায় রাখুন
./scripts/sync-environments.sh
```

### ২. ইনফ্রাস্ট্রাকচার ভ্যালিডেশন
```bash
# ডেপ্লয়মেন্টের আগে অবকাঠামো পরিবর্তনগুলোর পূর্বরূপ দেখুন
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
# ডিপ্লয়মেন্ট পদ্ধতিগুলি নথিভুক্ত করুন
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## পরবর্তী পদক্ষেপ

- [Provisioning Resources](provisioning.md) - ইনফ্রাস্ট্রাকচার ম্যানেজমেন্টে গভীর বিশ্লেষণ
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - আপনার ডিপ্লয়মেন্ট কৌশল পরিকল্পনা করুন
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - ডিপ্লয়মেন্ট সমস্যা সমাধান করুন
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - প্রোডাকশন-রেডি ডিপ্লয়মেন্ট কৌশল

## 🎯 হ্যান্ডস-অন ডিপ্লয়মেন্ট অনুশীলন

### অনুশীলন ১: ইনক্রিমেন্টাল ডিপ্লয়মেন্ট ওয়ার্কফ্লো (20 minutes)
**লক্ষ্য**: ফুল এবং ইনক্রিমেন্টাল ডিপ্লয়মেন্টের মধ্যে পার্থক্য আয়ত্ত করা

```bash
# প্রাথমিক স্থাপন
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# প্রাথমিক স্থাপনের সময় রেকর্ড করুন
echo "Full deployment: $(date)" > deployment-log.txt

# কোডে পরিবর্তন করুন
echo "// Updated $(date)" >> src/api/src/server.js

# শুধুমাত্র কোড স্থাপন করুন (দ্রুত)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# সময়গুলো তুলনা করুন
cat deployment-log.txt

# পরিষ্কার করুন
azd down --force --purge
```

**সফলতার মানদণ্ড:**
- [ ] ফুল ডিপ্লয়মেন্টে 5-15 মিনিট লাগে
- [ ] কেবল কোড ডিপ্লয়মেন্টে 2-5 মিনিট লাগে
- [ ] কোড পরিবর্তনগুলি ডিপ্লয় করা অ্যাপে প্রতিফলিত হয়
- [ ] ইনফ্রাস্ট্রাকচার `azd deploy` এর পরে অপরিবর্তিত থাকে

**শিখনের ফলাফল**: `azd deploy` কোড পরিবর্তনের জন্য `azd up` এর তুলনায় 50-70% দ্রুত

### অনুশীলন ২: কাস্টম ডিপ্লয়মেন্ট হুক (30 minutes)
**লক্ষ্য**: প্রি ও পোস্ট-ডিপ্লয়মেন্ট অটোমেশন বাস্তবায়ন করা

```bash
# প্রি-ডিপ্লয় ভ্যালিডেশন স্ক্রিপ্ট তৈরি করুন
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# টেস্টগুলো পাস হয়েছে কি না পরীক্ষা করুন
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

**সফলতার মানদণ্ড:**
- [ ] প্রি-ডিপ্লয় স্ক্রিপ্ট ডিপ্লয়মেন্টের আগে চলে
- [ ] টেস্ট ব্যর্থ হলে ডিপ্লয়মেন্ট বন্ধ হয়
- [ ] পোস্ট-ডিপ্লয় স্মোক টেস্ট হেলথ যাচাই করে
- [ ] হুকগুলো সঠিক ক্রমে কার্যকর হয়

### অনুশীলন ৩: বহু-পরিবেশ ডিপ্লয়মেন্ট কৌশল (45 minutes)
**লক্ষ্য**: স্তরভিত্তিক ডিপ্লয়মেন্ট ওয়ার্কফ্লো বাস্তবায়ন করা (dev → staging → production)

```bash
# ডিপ্লয়মেন্ট স্ক্রিপ্ট তৈরি করুন
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ধাপ ১: ডেভে (dev) ডিপ্লয় করুন
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ধাপ ২: স্টেজিং-এ ডিপ্লয় করুন
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
- [ ] Dev পরিবেশ সফলভাবে ডিপ্লয় হয়
- [ ] Staging পরিবেশ সফলভাবে ডিপ্লয় হয়
- [ ] প্রোডাকশনের জন্য ম্যানুয়াল অনুমোদন প্রয়োজন
- [ ] সকল পরিবেশে কাজ করা হেলথ চেক আছে
- [ ] প্রয়োজনে রোলব্যাক করা যায়

### অনুশীলন ৪: রোলব্যাক কৌশল (25 minutes)
**লক্ষ্য**: Git ব্যবহার করে ডিপ্লয়মেন্ট রোলব্যাক বাস্তবায়ন ও পরীক্ষা করা

```bash
# v1 ডিপ্লয়
azd env set APP_VERSION "1.0.0"
azd up

# v1 কমিট হ্যাশ সংরক্ষণ
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ব্রেকিং চেঞ্জসহ v2 ডিপ্লয়
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ব্যর্থতা সনাক্ত করে রোলব্যাক
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ব্যবহার করে রোলব্যাক
    git revert HEAD --no-edit
    
    # পরিবেশ রোলব্যাক
    azd env set APP_VERSION "1.0.0"
    
    # v1 পুনরায় ডিপ্লয়
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**সফলতার মানদণ্ড:**
- [ ] ডিপ্লয়মেন্ট ব্যর্থতা শনাক্ত করতে পারে
- [ ] রোলব্যাক স্ক্রিপ্ট স্বয়ংক্রিয়ভাবে চালিত হয়
- [ ] অ্যাপ্লিকেশন কাজ করা অবস্থায় ফিরে আসে
- [ ] রোলব্যাকের পরে হেলথ চেকস পাস করে

## 📊 ডিপ্লয়মেন্ট মেট্রিকস ট্র্যাকিং

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

**আপনার মেট্রিকস বিশ্লেষণ করুন:**
```bash
# ডিপ্লয়মেন্ট ইতিহাস দেখুন
cat deployment-metrics.csv

# গড় ডিপ্লয়মেন্ট সময় হিসাব করুন
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## অতিরিক্ত রিসোর্স

- [Azure Developer CLI ডিপ্লয়মেন্ট রেফারেন্স](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions ডিপ্লয়মেন্ট](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**নেভিগেশন**
- **Previous Lesson**: [আপনার প্রথম প্রজেক্ট](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [রিসোর্স প্রোভিশনিং](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->