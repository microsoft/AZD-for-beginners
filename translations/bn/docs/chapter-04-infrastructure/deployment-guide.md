# মোতায়েন গাইড - AZD মোতায়েন নিয়ন্ত্রণ

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [শুরু করার জন্য AZD](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৪ - কোড হিসাবে অবকাঠামো ও মোতায়েন
- **⬅️ পূর্ববর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)
- **➡️ পরবর্তী**: [রিসোর্স প্রোভিশনিং](provisioning.md)
- **🧩 এ অধ্যায়ে আরও**: [নিজস্ব টেমপ্লেট লিখন](custom-templates.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৫: মাল্টি-এজেন্ট AI সমাধান](../../examples/retail-scenario.md)

## পরিচিতি

> `azd 1.37.2` এর বিরুদ্ধে পর্যালোচনা করা হয়েছে (নভেম্বর ২০২৬)। কমান্ডগুলি Bash ব্যবহার করে; JSON উদাহরণগুলির জন্য `jq` প্রয়োজন। স্পষ্টভাবে প্রাথমিককৃত todo ব্যায়ামের বাইরে, উন্নত উদাহরণগুলি **ইনটিগ্রেশন ফ্রাগমেন্টস**: আপনার নিজের সোর্স, অবকাঠামো, টেস্ট এবং স্ক্রিপ্ট সরবরাহ করুন। এই পর্যালোচনায় কোনো Azure ডিপ্লয়মেন্ট সম্পাদিত হয়নি।

এই বিস্তৃত গাইডটি Azure Developer CLI ব্যবহার করে অ্যাপ্লিকেশন ডিপ্লয় করার জন্য প্রয়োজনীয় সবকিছু কভার করে, বেসিক একক-কমান্ড ডিপ্লয়মেন্ট থেকে কাস্টম হুক, একাধিক পরিবেশ, এবং CI/CD একত্রীকরণের সঙ্গে উন্নত প্রোডাকশন দৃশ্যপট পর্যন্ত। ব্যবহারিক উদাহরণ এবং সেরা অনুশীলন সহ সম্পূর্ণ ডিপ্লয়মেন্ট লাইফসাইকেল আয়ত্ত করুন।

## শেখার লক্ষ্য

এই গাইড সম্পন্ন করার মাধ্যমে, আপনি:
- সমস্ত Azure Developer CLI ডিপ্লয়মেন্ট কমান্ড এবং কর্মপ্রবাহ আয়ত্ত করবেন
- প্রোভিশনিং থেকে মনিটরিং পর্যন্ত সম্পূর্ণ ডিপ্লয়মেন্ট লাইফসাইকেল বুঝতে পারবেন
- পূর্ব এবং পরবর্তী ডিপ্লয়মেন্ট অটোমেশনের জন্য কাস্টম ডিপ্লয়মেন্ট হুক কার্যকর করবেন
- পরিবেশ-নির্দিষ্ট প্যারামিটার সহ একাধিক পরিবেশ কনফিগার করবেন
- ব্লু-গ্রিন এবং ক্যানারি ডিপ্লয়মেন্টসহ উন্নত ডিপ্লয়মেন্ট স্ট্র্যাটেজি সেটআপ করবেন
- azd ডিপ্লয়মেন্টসমূহকে CI/CD পাইপলাইন এবং DevOps কর্মপ্রবাহের সঙ্গে একীভূত করবেন

## শেখার ফলাফল

সমাপ্তির পরে, আপনি সক্ষম হবেন:
- সমস্ত azd ডিপ্লয়মেন্ট ওয়ার্কফ্লো স্বতন্ত্রভাবে চালানো এবং সমস্যা সমাধান করা
- হুক ব্যবহার করে কাস্টম ডিপ্লয়মেন্ট অটোমেশন ডিজাইন এবং বাস্তবায়ন করা
- সঠিক সুরক্ষা এবং মনিটরিং সহ প্রোডাকশন-রেডি ডিপ্লয়মেন্ট কনফিগার করা
- জটিল মাল্টি-পরিবেশ ডিপ্লয়মেন্ট পরিস্থিতি পরিচালনা করা
- ডিপ্লয়মেন্ট পারফরম্যান্স অপ্টিমাইজ করা এবং রোলব্যাক কৌশলগুলি বাস্তবায়ন করা
- azd ডিপ্লয়মেন্টকে এন্টারপ্রাইজ ডেভঅপস অনুশীলনে একীভূত করা

## ডিপ্লয়মেন্ট পর্যালোচনা

অ্যাজুর ডেভেলপার CLI কয়েকটি ডিপ্লয়মেন্ট কমান্ড প্রদান করে:
- `azd up` - সম্পূর্ণ ওয়ার্কফ্লো (প্রোভিশন + ডিপ্লয়)
- `azd provision` - শুধুমাত্র Azure রিসোর্স তৈরি/আপডেট করা
- `azd deploy` - শুধুমাত্র অ্যাপ্লিকেশন কোড ডিপ্লয় করা
- `azd package` - অ্যাপ্লিকেশনগুলি তৈরি এবং প্যাকেজ করা

## মৌলিক ডিপ্লয়মেন্ট ওয়ার্কফ্লো

### সম্পূর্ণ ডিপ্লয়মেন্ট (azd up)
নতুন প্রকল্পের জন্য সবচেয়ে সাধারণ কার্যপ্রবাহ:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### শুধুমাত্র অবকাঠামো ডিপ্লয়মেন্ট
যখন শুধুমাত্র Azure সম্পদগুলি আপডেট করতে হবে:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### শুধুমাত্র কোড ডিপ্লয়মেন্ট
দ্রুত অ্যাপ্লিকেশন আপডেটের জন্য:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ ডিপ্লয়মেন্ট যাচাই

যেকোনো ডিপ্লয়মেন্টের পর, সফলতা যাচাই করুন:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**সফলতার মানদণ্ড:**
- ✅ `azd show` প্রত্যাশিত সার্ভিস লক্ষ্যমাত্রা/URL সমাধান করে
- ✅ প্রকৃত অ্যাপ্লিকেশন রুটে অনুরোধ প্রত্যাশিত স্ট্যাটাস এবং বডি ফেরত দেয়
- ✅ শেষ ৫ মিনিটে কোনো ত্রুটি লগ নেই
- ✅ অ্যাপ্লিকেশন টেস্ট অনুরোধের উত্তর দেয়

## 🏗️ ডিপ্লয়মেন্ট প্রক্রিয়া বোঝা

### হুক সম্পর্কে নতুন? এখান থেকে শুরু করুন

একটি **হুক** হলো এমন একটি কমান্ড যা azd স্বয়ংক্রিয়ভাবে ডিপ্লয়মেন্ট প্রক্রিয়ার নির্দিষ্ট সময়ে চালায় — প্রোভিশনিংয়ের আগে বা পরে, এবং আপনার কোড ডিপ্লয় করার আগে বা পরে। এগুলি আপনাকে স্বয়ংক্রিয় করতে সাহায্য করে ছোট ছোট কাজগুলো যা সবসময় একটি ডিপ্লয়মেন্টের সাথে থাকে: একটি ডেটাবেস সীড করা, মাইগ্রেশন চালানো, অ্যাসেট তৈরি করা, অথবা লাইভ অ্যাপের স্মোক-টেস্ট করা।

| হুক | চালানো হয়… | সাধারণ ব্যবহার |
|------|-------|------------|
| `preprovision` | রিসোর্স তৈরি হওয়ার আগে | পূর্বশর্ত যাচাই, একটি রেজিস্ট্রিতে লগইন করা |
| `postprovision` | রিসোর্স তৈরি হওয়ার পরে | রিসোর্স কনফিগার করা, ডেটাবেস সেট আপ করা |
| `predeploy` | কোড ডিপ্লয়মেন্টের আগে | ফ্রন্ট-এন্ড অ্যাসেট তৈরি, ইউনিট টেস্ট চালানো |
| `postdeploy` | কোড লাইভ হওয়ার পরে | ডিবি মাইগ্রেশন চালানো, এন্ডপয়েন্ট স্মোক-টেস্ট করা |

হুকগুলো আপনার `azure.yaml` এ থাকে। এখানে সবচেয়ে ছোট উদাহরণ — এটি শুধু ডিপ্লয়মেন্টের পর একটি মেসেজ প্রিন্ট করে:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

এটুকুই—পরের সময় আপনি `azd up` চালাবেন, বার্তাটি স্বয়ংক্রিয়ভাবে মুদ্রিত হবে। আপনি সম্পূর্ণ ডিপ্লয় ছাড়াই শুধুমাত্র একটি হুক নিজেই চালাতে পারেন, যা পরীক্ষার জন্য বেশ ভালো:

```bash
azd hooks run postdeploy
```

নীচের ধাপগুলো প্রতিটি স্টেজের জন্য বাস্তব হুকগুলি (মাইগ্রেশন, টেস্ট, ভ্যালিডেশন) দেখায়।

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
- অবকাঠামো টেমপ্লেট পড়ে (Bicep/Terraform)
- Azure রিসোর্স তৈরি বা আপডেট করে
- নেটওয়ার্কিং এবং সিকিউরিটি কনফিগার করে
- মনিটরিং এবং লগিং সেট আপ করে

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
- অ্যাপ্লিকেশন কোড তৈরি করে
- ডিপ্লয়মেন্ট আর্টিফ্যাক্ট তৈরি করে
- লক্ষ্য প্ল্যাটফর্মের জন্য প্যাকেজ করে (কন্টেইনার, ZIP ফাইল ইত্যাদি)

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
- প্যাকেজকৃত অ্যাপ্লিকেশনগুলো Azure সার্ভিসে ডিপ্লয় করে
- কনফিগারেশন সেটিংস আপডেট করে
- সার্ভিস শুরু/রিস্টার্ট করে

### ধাপ ৭: পোস্ট-ডিপ্লয় হুকস
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### হুক ত্রুটি পরিচালনা

ডিফল্ট হিসেবে, **যদি হুক কমান্ড নন-জিরো কোড সহ শেষ হয়, azd পুরো অপারেশন বন্ধ করে দেয়।** সাধারণত এটাই আপনি চান—একটি ব্যর্থ মাইগ্রেশন ডিপ্লয় বন্ধ করবে, ভগ্ন অ্যাপ চালু করবে না। কিন্তু এর মানে হুকগুলো সাবধানে লেখা দরকার।

**১. ব্যর্থতাগুলো স্পষ্ট ও অভিপ্রেত করুন।** একটি হুক ব্যর্থ হয় যখন তার শেষ কমান্ড নন-জিরো এক্সিট কোড ফেরত দেয়। শেল স্ক্রিপ্টে, যোগ করুন `set -e` যাতে হুক প্রথম ব্যর্থ কমান্ডেই থামে এবং নীরবভাবে চালিয়ে না যায়:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**২. একটি হুকের ব্যর্থতা স্বীকার করলেও azd বন্ধ না করা।** অপ্রয়োজনীয় ধাপের জন্য (একটি ঐচ্ছিক ক্যাশ ওয়ার্ম-আপ, সর্বোত্তম প্রচেষ্টা নোটিফিকেশন), সেট করুন `continueOnError: true`। azd ব্যর্থতা লগ করে কিন্তু চালিয়ে যায়:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**৩. সম্পূর্ণ চালানো আগে হুকগুলো পৃথকভাবে পরীক্ষা করুন।** একটি হুক ডিবাগ করতে আপনাকে `azd up` চালাতে হবে না—এটি নিজেই চালান এবং দ্রুত পুনরাবৃত্তি করুন:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**৪. OS-নির্দিষ্ট শেলগুলোর জন্য সতর্ক থাকুন।** একটি হুক যেটি `shell: pwsh` ব্যবহার করে, সেটি চালানোর জন্য যন্ত্রে PowerShell ইনস্টল থাকতে হবে (CI এজেন্টসহ)। সবচেয়ে বিস্তৃত পোর্টেবিলিটির জন্য `shell: sh` ব্যবহার করুন, অথবা উভয় `windows` ও `posix` ভেরিয়ান্ট প্রদান করুন:

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

> **ডিবাগিং টিপ:** যেকোনো azd কমান্ড চালান `--debug` দিয়ে যা সঠিক হুক কমান্ড লাইন এবং তার সম্পূর্ণ আউটপুট দেখতে দেয়—বিশেষ করে যখন একটি হুক লোকালি কাজ করে কিন্তু CI-তে ব্যর্থ হয়।

## 🎛️ ডিপ্লয়মেন্ট কনফিগারেশন

### সার্ভিস-নির্দিষ্ট ডিপ্লয়মেন্ট সেটিংস
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### পরিবেশ-নির্দিষ্ট কনফিগারেশন

এসব শুধুমাত্র স্থানীয় azd মান। এগুলোকে স্পষ্টভাবে অবকাঠামো/রানটাইম কনফিগারেশনের সাথে ম্যাপ করুন। `NODE_ENV` সাধারণত ডিপ্লয় হওয়া Node অ্যাপের জন্য `production` যা স্টেজিং ডিপ্লয়মেন্টসহ; ডিপ্লয়মেন্ট স্টেজ আলাদা করার জন্য আলাদা অ্যাপ-নির্দিষ্ট ভেরিয়েবল ব্যবহার করুন।

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
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

**চিত্রণমূলক অপারেশনাল স্কেচ:** আপনাকে উভয় পরিবেশ, একটি শেয়ার করা ট্রাফিক-রাউটিং স্তর, এবং নীচের দুটি স্ক্রিপ্ট সরবরাহ করতে হবে। azd স্বয়ংক্রিয়ভাবে ট্রাফিক পরিবর্তন করে না বা রোলব্যাক প্রস্তুতির যাচাই করে না। সবুজ বজায় রাখুন যতক্ষণ না নীল পরীক্ষা সম্পন্ন করে এবং রোলব্যাক আর প্রয়োজন হয় না।

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
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

ট্রাফিক বিভাজন কন্টেইনার অ্যাপ কনফিগারেশন (Bicep বা Azure CLI) এর অন্তর্গত, এটি `azure.yaml` `trafficSplit` সম্পত্তি নয়। প্রিভিউ/প্রোভিশনিং এবং পরবর্তী ডিপ্লয়মেন্টগুলো আপনার নির্বাচিত সংস্করণ মোড এবং রাউটিং নিয়মগুলি সংরক্ষণ করতে হবে।

### স্টেজড ডিপ্লয়মেন্ট
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
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
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

রানটাইম সিক্রেটগুলি `configuration.secrets`/`secretRef` (বা কি ভল্ট রেফারেন্স) দিয়ে কনফিগার করুন এবং কন্টেইনার অ্যাপ অবকাঠামোতে `template.scale` দিয়ে স্কেলিং করুন। সার্ভিস-লেভেল `secrets` বা `scale` বৈশিষ্ট্যগুলো `azure.yaml`-এ তৈরি করবেন না।

### মাল্টি-স্টেজ ডকফাইল অপটিমাইজেশন
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
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
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### বিল্ড ক্যাশিং
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

স্ট্যান্ডার্ড নোড ওয়ার্কফ্লো প্যাকেজ স্ক্রিপ্ট ব্যবহার করে; সার্ভিস `prepackage` হুক প্রয়োজনীয় স্টেপ যোগ করতে পারে। ডকার লেয়ার ক্যাশিং সার্ভিস বিল্ড কমান্ড সংজ্ঞায়িত করার থেকে আলাদা।

### দক্ষ কোড ডিপ্লয়মেন্ট
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 ডিপ্লয়মেন্ট মনিটরিং

### রিয়েল-টাইম ডিপ্লয়মেন্ট মনিটরিং
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### হেলথ চেক
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

আপনার অ্যাপকে `/health` বাস্তবায়ন করতে হবে; এটি azd স্বয়ংক্রিয়ভাবে সরবরাহ করে না। কোনো সাধারণ `azure.yaml` `healthCheck` সার্ভিস প্রপার্টি নেই।

### পোস্ট-ডিপ্লয়মেন্ট যাচাই
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
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

### সিক্রেটস ম্যানেজমেন্ট
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` অবৈধ। সাধারণ পরিবেশ মান স্থানীয় প্লেইনটেক্সট; পড়ার কমান্ড সেগুলো লুকিয়ে রাখে বলে ধরে নেবেন না। উপরের কমান্ডগুলো কি ভল্ট রেফারেন্স সংরক্ষণ করে, কিন্তু আপনার অবকাঠামো/অ্যাপ্লিকেশন এখনও সিক্রেটগুলি গ্রহণ করবে এবং রানটাইম পরিচয় অ্যাক্সেস দেবে।

### নেটওয়ার্ক নিরাপত্তা
Bicep-এ নেটওয়ার্ক প্যারামিটার ঘোষণা ও গ্রহণ করুন, এবং `infra/main.parameters.json`-এ মানচিত্র করুন। `azure.yaml`-এ কোনো সাধারণ `infra.parameters` ওভারলে নেই। উদাহরণ ডকুমেন্টেশন-এ `203.0.113.0/24` এবং `198.51.100.0/24` নাকি আসল অফিস/VPN নেটওয়ার্ক নয়; অনুমোদিত নেটওয়ার্ক পরিসীমা দিয়ে প্রতিস্থাপন করুন।

### পরিচয় এবং অ্যাক্সেস ম্যানেজমেন্ট
Bicep-এ কন্টেইনার অ্যাপের `identity` সক্ষম করুন এবং ভল্ট স্কোপে প্রয়োজনীয় কি ভল্ট ডাটা-প্লেন রোল বরাদ্দ করুন। সেই রিসোর্সে নামকৃত কি ভল্ট-ব্যাকযুক্ত সিক্রেট এবং রানটাইম রেফারেন্স কনফিগার করুন; `identity` এবং `keyVault` সাধারণ azd সার্ভিস প্রপার্টি নয়। দেখুন [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md)।

## 🚨 রোলব্যাক কৌশল

### দ্রুত রোলব্যাক
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### অবকাঠামো রোলব্যাক
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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

## 🎯 সেরা অনুশীলন

### ১। পরিবেশের সামঞ্জস্যতা
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### ২। অবকাঠামো যাচাই
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### ৩। পরীক্ষামূলক সংমিশ্রণ
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

### ৪। ডকুমেন্টেশন এবং লগিং
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## পরবর্তী ধাপে

- [রিসোর্স প্রোভিশনিং](provisioning.md) - অবকাঠামো ব্যবস্থাপনায় গভীর প্রবেশ
- [প্রাক-ডিপ্লয়মেন্ট পরিকল্পনা](../chapter-06-pre-deployment/capacity-planning.md) - আপনার ডিপ্লয়মেন্ট কৌশল পরিকল্পনা করুন
- [সাধারণ সমস্যা](../chapter-07-troubleshooting/common-issues.md) - ডিপ্লয়মেন্ট সমস্যাগুলি সমাধান করুন
- [সেরা অনুশীলনগুলি](../chapter-07-troubleshooting/debugging.md) - প্রোডাকশন-রেডি ডিপ্লয়মেন্ট কৌশল

## 🎯 হাতে কলমে ডিপ্লয়মেন্ট অনুশীলন

### অনুশীলন ১: ইনক্রিমেন্টাল ডিপ্লয়মেন্ট কাজের ধারা (২০ মিনিট)
**লক্ষ্য**: সম্পূর্ণ এবং ইনক্রিমেন্টাল ডিপ্লয়মেন্টের মধ্যে পার্থক্য আয়ত্ত করা

**শুরুবিন্দু:** Bash, Node.js ২২, Git, azd সাইন-ইন, এবং ডিপ্লয়মেন্ট অনুমতি সহ একটি Azure সাবস্ক্রিপশন। একটি নতুন ডিরেক্টরিতে রান করুন; বিলেবল App Service/Cosmos DB রিসোর্স আশা করুন। সময় অঞ্চল এবং টেমপ্লেটের উপর নির্ভর করে।

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**সফলতার শর্তাবলী:**
- [ ] উভয় কমান্ডের জন্য ব্যয়কৃত সময় রেকর্ড করুন (নির্দিষ্ট সময় নিশ্চিত নয়)
- [ ] উভয় কমান্ড সফলভাবে সম্পন্ন হয়
- [ ] API কার্যকর থাকে; শুধুমাত্র মন্তব্য সম্পাদনা দৃশ্যমান UI পরিবর্তন নয়
- [ ] `azd deploy` এর পর অবকাঠামো অপরিবর্তিত থাকে

**শিক্ষণ ফলাফল**: `azd deploy` অবকাঠামো প্রোভিশনিং এড়িয়ে যায়। একটি নির্দিষ্ট শতাংশ গতি বাড়ানোর পরিবর্তে পরিমাপ করা সময় তুলনা করুন।

### অনুশীলন ২: কাস্টম ডিপ্লয়মেন্ট হুক (৩০ মিনিট)
**লক্ষ্য**: প্রি এবং পোস্ট-ডিপ্লয়মেন্ট অটোমেশন বাস্তবায়ন

**শুরুবিন্দু:** উপরোক্ত ইনিশিয়ালাইজড `deployment-practice` প্রকল্প। আপনি যদি এটি পরিষ্কার করেন, কোড-শুধুমাত্র ডিপ্লয়মেন্ট পরীক্ষা করার আগে আবার `azd up` চালান। নিচের যাচাই API এর আসল বিল্ড স্ক্রিপ্ট ব্যবহার করে, একটি অনুপস্থিত রুট `test:unit` স্ক্রিপ্ট নয়। টেমপ্লেটের API পরীক্ষা কনফিগারকৃত ডাটাবেস অ্যাক্সেস প্রয়োজন; তারা পৃথক ইউনিট টেস্ট নয়।

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**সফলতার শর্তাবলী:**
- [ ] ডিপ্লয়মেন্টের আগে প্রি-ডিপ্লয় স্ক্রিপ্ট চলতে হবে
- [ ] বিল্ড যাচাই ব্যর্থ হলে ডিপ্লয়মেন্ট বাতিল হয়
- [ ] পোস্ট-ডিপ্লয় স্মোক টেস্ট স্বাস্থ্য যাচাই করে
- [ ] হুকগুলি সঠিক ক্রমে কার্যকর হয়

### অনুশীলন ৩: বহুমুখী পরিবেশ ডিপ্লয়মেন্ট কৌশল (৪৫ মিনিট)
**লক্ষ্য**: পর্যায়ক্রমিক ডিপ্লয়মেন্ট কাজের ধারা বাস্তবায়ন (ডেভ → স্টেজিং → প্রোডাকশন)

**শুরু করার স্থান:** `jq` সহ একই ইনিশিয়ালাইজড টুডু প্রকল্প। নীচের পরিবেশগুলি বাস্তব সাবস্ক্রিপশন/অবস্থান মানের সাথে তৈরি করুন (অথবা প্রতিটিতে `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` সেট করুন) **না-পrompt ওয়ার্কফ্লো চালানোর আগে**। এটি অজানা মান উদ্ভাবন করার পরিবর্তে ইচ্ছাকৃতভাবে ব্যর্থ হয়। শুধুমাত্র ব্যবহারযোগ্য প্রশিক্ষণ পরিবেশ ব্যবহার করুন, প্রকৃত প্রোডাকশন সাবস্ক্রিপশন নয়।

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**সফলতার মানদণ্ড:**
- [ ] ডেভ পরিবেশ সফলভাবে ডিপ্লয় হয়
- [ ] স্টেজিং পরিবেশ সফলভাবে ডিপ্লয় হয়
- [ ] প্রোডাকশনের জন্য ম্যানুয়াল অনুমোদন প্রয়োজন
- [ ] সকল পরিবেশে কার্যকর হেলথ চেক আছে
- [ ] প্রয়োজনে রোলব্যাক করতে পারে

### অনুশীলন ৪: রোলব্যাক কৌশল (২৫ মিনিট)
**লক্ষ্য**: গিট ব্যবহার করে ডিপ্লয়মেন্ট রোলব্যাক বাস্তবায়ন এবং পরীক্ষা করা

**শুরু করার স্থান:** টুডু টেমপ্লেটের আলাদা প্রশিক্ষণ চেকআউট যেখানে সকল বেসলাইন সোর্স কমিট করা হয়েছে, একটি পরিষ্কার গিট ওয়ার্কিং ট্রি, এবং ব্যবহারযোগ্য কনফিগার করা পরিবেশ আছে। প্রকৃত প্রোডাকশন প্রকল্পে কখনো ইচ্ছাকৃত ব্যর্থতা যোগ করবেন না। নিচের `APP_VERSION` শুধুমাত্র বুককিপিং, যতক্ষণ না আপনি স্পষ্টভাবে এটিকে অ্যাপে সংযুক্ত করেন।

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**সফলতার মানদণ্ড:**
- [ ] ডিপ্লয়মেন্ট ব্যর্থতা সনাক্ত করতে পারে
- [ ] রোলব্যাক স্ক্রিপ্ট স্বয়ংক্রিয়ভাবে কাজ করে
- [ ] অ্যাপ্লিকেশন কার্যকর অবস্থায় ফিরে আসে
- [ ] রোলব্যাকের পর হেলথ চেক গুলো সফল হয়

## 📊 ডিপ্লয়মেন্ট মেট্রিকস ট্র্যাকিং

### আপনার ডিপ্লয়মেন্ট পারফরম্যান্স ট্র্যাক করুন

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**আপনার মেট্রিক্স বিশ্লেষণ করুন:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## অতিরিক্ত সম্পদ

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [আপনার প্রথম প্রকল্প](../chapter-01-foundation/first-project.md)
- **পরবর্তী পাঠ**: [রিসোর্স প্রোভিশনিং](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->