# មគ្គុទ្ទេសក៍ចេញផ្សាយ - ការគ្រប់គ្រងការចេញផ្សាយ AZD

**ការជិះចរាចរណ៍ជាផ្នែកៈ**
- **📚 ទំព័រដើមវគ្គ**: [AZD សម្រាប់អ្នកដំបូង](../../README.md)
- **📖 ផ្នែកបច្ចុប្បន្ន**: ផ្នែកទី 4 - ហេដ្ឋារចនាសម្ព័ន្ធជាកូដ និង ការចេញផ្សាយ
- **⬅️ ផ្នែកមុន**: [ផ្នែកទី 3: ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md)
- **➡️ បន្ទាប់**: [ការផ្គត់ផ្គង់ធនធាន](provisioning.md)
- **🚀 ផ្នែកបន្ទាប់**: [ផ្នែកទី 5: ដំណោះស្រាយ AI មួយចំនួនជាអ្នកប្រតិបត្តិករ](../../examples/retail-scenario.md)

## ជំហានមុខមាត់

មគ្គុទ្ទេសក៍សរុបនេះគ្របដណ្តប់ពីអ្វីគ្រប់យ៉ាងដែលអ្នកត្រូវបានដឹងអំពីការចេញផ្សាយកម្មវិធីដោយប្រើ Azure Developer CLI ចាប់ពីការចេញផ្សាយមួយពាក្យបញ្ជាពីរបៀបដល់សេណារីយ៉ូផលិតកម្មកម្រិតខ្ពស់ជាមួយអាគុយម៉ង់ផ្ទាល់ខ្លួន, បរិយាកាសច្រើន, និងការបញ្ចូល CI/CD។ ជំនាញផ្ទះគ្រប់ជុំវិញជីវិតបញ្ចេញនេះជាមួយឧទាហារណ៍អនុវត្តន៍ និងការអនុវត្តល្អបំផុត។

## គោលដៅការសិក្សា

ដោយបញ្ចប់មគ្គុទ្ទេសក៍នេះ អ្នកនឹង:
- ឯកទេសបញ្ជាដំណើរការចេញផ្សាយ Azure Developer CLI ទាំងអស់ និង លំហូរការងារ
- យល់ដឹងពីជីវិតពេញលេញនៃការចេញផ្សាយចាប់ពីការផ្គត់ផ្គង់ទៅការត្រួតពិនិត្យ
- អនុវត្តឃុំព្យាករណ៍ចេញផ្សាយផ្ទាល់ខ្លួនសម្រាប់ស្វ័យប្រវត្តិមុន និងក្រោយចេញផ្សាយ
- កំណត់បរិយាកាសច្រើនជាមួយប៉ារ៉ាម៉ែត្រ विशिष्टបរិយាកាស
- រៀបចំយុទ្ធសាស្រ្តចេញផ្សាយកម្រិតខ្ពស់រួមមានការចេញផ្សាយពណ៌ខៀវ-បៃតង និង ការចេញផ្សាយកណ្តុរ
- បញ្ចូលការចេញផ្សាយ azd ជាមួយបណ្តាញ CI/CD និង លំហូរការងារ DevOps

## លទ្ធផលការសិក្សា

នៅពេលបញ្ចប់ អ្នកអាច:
- ប្រតិបត្តិ និងស្រាវជ្រាវបញ្ហាលំហូរការងារចេញផ្សាយ azd ទាំងអស់ដោយឯករាជ្យ
- បង្កើត និងអនុវត្តការស្វ័យប្រវត្តិការចេញផ្សាយផ្ទាល់ខ្លួនដោយប្រើឃុំព្យាក
- កំណត់ការចេញផ្សាយដែលរួមជាមួយសុវត្ថិភាព និងការត្រួតពិនិត្យចំពោះផលិតកម្ម
- គ្រប់គ្រងសេណារីយ៉ូចេញផ្សាយបរិយាកាសច្រើនស្មុគស្មាញ
- បង្កើនការសមត្ថភាពចេញផ្សាយ និងអនុវត្តយុទ្ធសាស្រ្តត្រឡប់ក្រោយ
- បញ្ចូលការចេញផ្សាយ azd ទៅក្នុងអនុស្សាវរីយ DevOps ធំៗ

## ទិដ្ឋភាពសង្ខេបនៃការចេញផ្សាយ

Azure Developer CLI ផ្តល់បញ្ជាចេញផ្សាយជាច្រើន៖
- `azd up` - លំហូរការងារសរុប (ផ្គត់ផ្គង់ + ចេញផ្សាយ)
- `azd provision` - បង្កើត/អាប់ដេតធនធាន Azure តែប៉ុណ្ណោះ
- `azd deploy` - ចេញផ្សាយកូដកម្មវិធីតែប៉ុណ្ណោះ
- `azd package` - សាងសង់ និង​បញ្ចូល​កញ្ចប់កម្មវិធី

## លំហូរការងារចេញផ្សាយមូលដ្ឋាន

### ការចេញផ្សាយសរុប (azd up)
លំហូរការងារធម្មតាសម្រាប់គម្រោងថ្មីៗ៖
```bash
# ផ្ទុកពេញលេញពីចូលដំណើរការ
azd up

# ផ្ទុកដោយបរិស្ថានជាក់លាក់
azd up --environment production

# ផ្ទុកដោយប៉ារ៉ាម៉ែត្រដែលប្តូរតាមបំណង
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ការចេញផ្សាយមូលដ្ឋានហេដ្ឋារចនាសម្ព័ន្ធតែប៉ុណ្ណោះ
ពេលដែលអ្នកត្រូវការអាប់ដេតធនធាន Azure តែប៉ុណ្ណោះ៖
```bash
# រៀបចំ/បន្ទាន់សម័យហេដ្ឋារចនាសម្ព័ន្ធ
azd provision

# រៀបចំជាមួយ dry-run ដើម្បីមើលជាមុនការផ្លាស់ប្តូរ
azd provision --preview

# រៀបចំសេវាកម្មជាក់លាក់
azd provision --service database
```

### ការចេញផ្សាយកូដតែប៉ុណ្ណោះ
សម្រាប់ការអាប់ដេតកម្មវិធីឆាប់រហ័ស៖
```bash
# ប្រើប្រាស់សេវាកម្មទាំងអស់
azd deploy

# ប្រសិទ្ធផលដែលរំពឹងទុក៖
# កំពុងប្រើប្រាស់សេវាកម្ម (azd deploy)
# - គេហទំព័រ៖ កំពុងប្រើប្រាស់... បានជោគជ័យ
# - API៖ កំពុងប្រើប្រាស់... បានជោគជ័យ
# ជោគជ័យ៖ ការប្រើប្រាស់របស់អ្នកបានបញ្ចប់ក្នុងរយៈពេល 2 នាទី 15 វិនាទី

# ប្រើប្រាស់សេវាកម្មជាក់លាក់
azd deploy --service web
azd deploy --service api

# ប្រើប្រាស់ដោយប្រើអំឡុងការសាងសង់ខុសប្លែក
azd deploy --service api --build-arg NODE_ENV=production

# ផ្ទៀងផ្ទាត់ការប្រើប្រាស់
azd show --output json | jq '.services'
```

### ✅ ការត្រួតពិនិត្យការចេញផ្សាយ

បន្ទាប់ពីការចេញផ្សាយណាមួយ ចូរត្រួតពិនិត្យភាពជោគជ័យ៖

```bash
# ពិនិត្យមើលថាទាំងអស់សេវាកម្មកំពុងដំណើរការ
azd show

# សាកល្បងចំណុចផ្លូវសុខភាព
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ពិនិត្យមើលកំហុស (បើកក្នុងកម្មវិធីរុករកដោយលំនាំ)
azd monitor --logs
```

**លក្ខខណ្ឌជោគជ័យ៖**
- ✅ សេវាកម្មទាំងអស់បង្ហាញស្ថានភាព "កំពុងដំណើរការ"
- ✅ ចំណុចត្រួតពិនិត្យសុខភាពតបតាម HTTP 200
- ✅ គ្មានកំណត់ហេតុបញ្ហានៅក្នុង៥នាទីចុងក្រោយ
- ✅ កម្មវិធីឆ្លើយតបនឹងសំណើតេស្ត

## 🏗️ យល់ដឹងអំពីដំណើរការចេញផ្សាយ

### ដំណាក់កាលទី 1: ការតភ្ជាប់មុនការផ្គត់ផ្គង់
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

### ដំណាក់កាលទី 2: ការផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ
- អានប្លង់ហេដ្ឋារចនាសម្ព័ន្ធ (Bicep/Terraform)
- បង្កើត ឬ អាប់ដេតធនធាន Azure
- កំណត់បណ្តាញ និងសុវត្ថិភាព
- តំឡើងការត្រួតពិនិត្យ និងកំណត់ហេតុ

### ដំណាក់កាលទី 3: ការតភ្ជាប់ក្រោយការផ្គត់ផ្គង់
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

### ដំណាក់កាលទី 4: ការបញ្ចប់កញ្ចប់កម្មវិធី
- សង់កូដកម្មវិធី
- បង្កើតកម្មវិធីចេញផ្សាយ
- បញ្ចូលកញ្ចប់សម្រាប់វេទិកាទីផ្សារ (containers, ZIP files, ល.អ.)

### ដំណាក់កាលទី 5: ការតភ្ជាប់មុនចេញផ្សាយ
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

### ដំណាក់កាលទី 6: ការចេញផ្សាយកម្មវិធី
- ចេញផ្សាយកម្មវិធីបញ្ចប់ទៅសេវាកម្ម Azure
- បន្ទាន់សម័យការកំណត់រចនាសម្ព័ន្ធ
- ចាប់ផ្តើម/បញ្ឈប់សេវាកម្មម្ដងទៀត

### ដំណាក់កាលទី 7: ការតភ្ជាប់ក្រោយចេញផ្សាយ
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

## 🎛️ ការកំណត់រចនាសម្ព័ន្ធចេញផ្សាយ

### ការកំណត់ចេញផ្សាយមូលដ្ឋានសម្រាប់សេវាកម្ម
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

### ការកំណត់រចនាសម្ព័ន្ធពិសេសសម្រាប់បរិយាកាស
```bash
# បរិយាកាសអភិវឌ្ឍន៍
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# បរិយាកាសស្តេជីង
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# បរិយាកាសផលិតផល
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 សេណារីយ៉ូចេញផ្សាយកម្រិតខ្ពស់

### កម្មវិធីមានសេវាកម្មច្រើន
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

### ការចេញផ្សាយពណ៌ខៀវ-បៃតង
```bash
# បង្កើតបរិវេណខៀវ
azd env new production-blue
azd up --environment production-blue

# សាកល្បងបរិវេណខៀវ
./scripts/test-environment.sh production-blue

# ផ្លាស់ប្តូរចរាចរទៅខៀវ (ធ្វើបច្ចុប្បន្នភាព DNS/load balancer ដោយដៃ)
./scripts/switch-traffic.sh production-blue

# សម្អាតបរិវេណបៃតង
azd env select production-green
azd down --force
```

### ការចេញផ្សាយកណ្តុរ
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

### ការចេញផ្សាយបែបជំហាន
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

## 🐳 ការចេញផ្សាយកុងតឺន័រ

### ការចេញផ្សាយកម្មវិធីកុងតឺន័រ
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

### ការបង្កើត Dockerfile ជាច្រើនជំហានយ៉ាងមានប្រសិទ្ធភាព
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

## ⚡ ការបង្កើនសមត្ថភាព

### ការចេញផ្សាយសេវាកម្មឡែកៗ
```bash
# ចេញផ្សាយសេវាកម្មជាក់លាក់សម្រាប់ការធ្វើលើកមួយបានលឿនជាងមុន
azd deploy --service web
azd deploy --service api

# ចេញផ្សាយសេវាកម្មទាំងអស់
azd deploy
```

### ការសន្សំកូដសាងសង់
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### ការចេញផ្សាយកូដមានប្រសិទ្ធភាព
```bash
# ប្រើ azd deploy (មិនមែន azd up) សម្រាប់ការផ្លាស់ប្តូរកូដតែប៉ុណ្ណោះ
# នេះរំលងការផ្គត់ផ្គង់រចនាសម្ព័ន្ធ ហើយមានល្បឿនលឿនជាង
azd deploy

# ផ្ញើសេវាកម្មជាក់លាក់សម្រាប់ការវិវត្តលឿនបំផុត
azd deploy --service api
```

## 🔍 ការត្រួតពិនិត្យការចេញផ្សាយ

### ការត្រួតពិនិត្យការចេញផ្សាយពេលវេលាពិត
```bash
# ត្រួតគម្រោងកម្មវិធីក្នុងពេលពិត
azd monitor --live

# មើលកំណត់ហេតុកម្មវិធី
azd monitor --logs

# ត្រួតពិនិត្យស្ថានភាពចែកចាយ
azd show
```

### ការត្រួតពិនិត្យសុខភាព
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

### ការត្រួតពិនិត្យក្រោយចេញផ្សាយ
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# ពិនិត្យសុខភាពកម្មវិធី
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

## 🔐 ការពិចារណាសុវត្ថិភាព

### ការគ្រប់គ្រងអាថ៌កំបាំង
```bash
# រក្សាទុកអាថ៌កំបាំងយ៉ាងសុវត្ថិភាព
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# ឯកសារយោងអាថ៌កំបាំងនៅក្នុង azure.yaml
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

### សុវត្ថិភាពបណ្តាញ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### អត្តសញ្ញាណ និងការគ្រប់គ្រងការចូលប្រើ
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

## 🚨 យុទ្ធសាស្រ្តត្រឡប់ក្រោយ

### ការត្រឡប់ក្រោយឆាប់រហ័ស
```bash
# AZD មិនមានការត្រឡប់ក្រោយ​តាមបំណងក្នុងខ្លួនវាឡើយ។ វិធីដែលបានណែនាំ៖

# ជម្រើសទី ១៖ ប្រើប្រាស់ការដាក់បញ្ចូលឡើងវិញពី Git (បានណែនាំ)
git revert HEAD  # ត្រឡប់កាលបរិច្ឆេទ commit ដែលមានបញ្ហា
git push
azd deploy

# ជម្រើសទី ២៖ ដាក់បញ្ចូល commit ជាក់លាក់ឡើងវិញ
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ការត្រឡប់ក្រោយហេដ្ឋារចនាសម្ព័ន្ធ
```bash
# មើលមុនការផ្លាស់ប្តូររចនាសម្ព័ន្ធមុនពេលអនុវត្ត
azd provision --preview

# សម្រាប់ត្រឡប់ក្រោយរចនាសម្ព័ន្ធ ប្រើការគ្រប់គ្រងកំណែ៖
git revert HEAD  # ត្រឡប់ការផ្លាស់ប្តូររចនាសម្ព័ន្ធ
azd provision    # អនុវត្តស្ថានភាពរចនាសម្ព័ន្ធមុនដើម
```

### ការត្រឡប់ក្រោយបំលែងមូលដ្ឋានទិន្នន័យ
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 មាត្រដ្ឋានចេញផ្សាយ

### តាមដានសមត្ថភាពចេញផ្សាយ
```bash
# មើលស្ថានភាពចាក់ផ្សាយបច្ចុប្បន្ន
azd show

# តាមដានកម្មវិធីជាមួយ Application Insights
azd monitor --overview

# មើលវិមាត្រសកម្ម
azd monitor --live
```

### ការប្រមូលមាត្រដ្ឋានផ្ទាល់ខ្លួន
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

## 🎯 លទ្ធផលល្អបំផុត

### 1. សមត្ថភាពបរិយាកាសឯកភាព
```bash
# ប្រើឈ្មោះដោយឲ្យមានភាពស្ថិតស្ថេរដូចគ្នា
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# រក្សាប្រព័ន្ធបរិស្ថានឲ្យស្រដៀងគ្នា
./scripts/sync-environments.sh
```

### 2. ការត្រួតពិនិត្យហេដ្ឋារចនាសម្ព័ន្ធ
```bash
# មើលមុនការផ្លាស់ប្តូររចនាសម្ព័ន្ធមុនពេលដាក់បញ្ចូល
azd provision --preview

# ប្រើការត្រួតពិនិត្យកូដ ARM/Bicep
az bicep lint --file infra/main.bicep

# វាយតម្លៃវេយ្យាករណ៍ Bicep
az bicep build --file infra/main.bicep
```

### 3. ការបញ្ចូលការធ្វើតេស្ត
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

### 4. ឯកសារនិងកំណត់ហេតុ
```bash
# ឯកសារជំហានការដាក់បញ្ចូល
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ជំហានបន្ទាប់

- [ការផ្គត់ផ្គង់ធនធាន](provisioning.md) - ជ្រាបជ្រាបចូលក្នុងការគ្រប់គ្រងហេដ្ឋារចនាសម្ព័ន្ធ
- [ការរៀបចំមុនចេញផ្សាយ](../chapter-06-pre-deployment/capacity-planning.md) - ផែនការយុទ្ធសាស្ត្រចេញផ្សាយរបស់អ្នក
- [បញ្ហាទូទៅ](../chapter-07-troubleshooting/common-issues.md) - ដោះសោបញ្ហាចេញផ្សាយ
- [របៀបល្អបំផុត](../chapter-07-troubleshooting/debugging.md) - យុទ្ធសាស្ត្រចេញផ្សាយសម្រាប់ផលិតកម្ម

## 🎯 លំហាត់ប្រាជ្ញាចេញផ្សាយ

### លំហាត់ 1: លំហូរការងារចេញផ្សាយបង្កើនជំហាន (២០ នាទី)
**គោលដៅ**: ឯកទេសភាពខុសគ្នារវាងការចេញផ្សាយពេញលេញ និង បង្កើនជំហាន

```bash
# ការចាប់ផ្តើមដាក់ឲ្យដំណើរការ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# កត់ត្រាពេលវេលាដាក់ឲ្យដំណើរការដំបូង
echo "Full deployment: $(date)" > deployment-log.txt

# បម្លែងកូដមួយ
echo "// Updated $(date)" >> src/api/src/server.js

# ដាក់កូដតែប៉ុណ្ណោះ (លឿន)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# សៀវភៅពេលវេលា
cat deployment-log.txt

# សម្អាត
azd down --force --purge
```

**លក្ខខណ្ឌជោគជ័យ:**
- [ ] ចេញផ្សាយពេញលេញចំណាយពេល ៥-១៥ នាទី
- [ ] ចេញផ្សាយកូដតែប៉ុណ្ណោះចំណាយពេល ២-៥ នាទី
- [ ] ការផ្លាស់ប្តូរកូដបង្ហាញនៅកម្មវិធីចេញផ្សាយ
- [ ] ហេដ្ឋារចនាសម្ព័ន្ធមិនបានផ្លាស់ប្ដូរបន្ទាប់ពី `azd deploy`

**លទ្ធផលសិក្សា**: `azd deploy` លឿនជាង ៥០-៧០% យ៉ាងងាយស្រួលជាង `azd up` សម្រាប់ការផ្លាស់ប្តូរកូដ

### លំហាត់ 2: ឃុំព្យាកការចេញផ្សាយផ្ទាល់ខ្លួន (៣០ នាទី)
**គោលដៅ**: អនុវត្តស្វ័យប្រវត្តិការមុន និងក្រោយចេញផ្សាយ

```bash
# បង្កើតស្គ្រីបផ្ទៀងផ្ទាត់មុនការដាក់ពង្រិត
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ពិនិត្យមើលថាតេស្តបានជោគជ័យ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ពិនិត្យមើលការផ្លាស់ប្តូរដែលមិនទាន់បានបញ្ជូន
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# បង្កើតតេស្តស្រូមបន្ទាប់ពីដាក់ពង្រឹង
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

# បន្ថែមហ៊ូកទៅក្នុង azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# សាកល្បងការដាក់ពង្រឹងជាមួយហ៊ូក
azd deploy
```

**លក្ខខណ្ឌជោគជ័យ:**
- [ ] ស្គ្រីបមុនចេញផ្សាយរត់មុនការចេញផ្សាយ
- [ ] ចេញផ្សាយបោះបង់បើសំណួរតេស្តបរាជ័យ
- [ ] តេស្តស្រមោលក្រោយចេញផ្សាយបញ្ជាក់សុខភាព
- [ ] ឃុំព្យាកដំណើរការត្រឹមត្រូវ

### លំហាត់ 3: យុទ្ធសាស្រ្តចេញផ្សាយបរិយាកាសច្រើន (៤៥ នាទី)
**គោលដៅ**: អនុវត្តលំហូរការងារចេញផ្សាយបែបជំហាន (dev → staging → production)

```bash
# បង្កើតស្គ្រីបចែកចាយ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ជំហានទី ១: ចែកចាយទៅកាន់ dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ជំហានទី ២: ចែកចាយទៅកាន់ staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ជំហានទី ៣: អនុម័តដោយដៃសម្រាប់ផលិតកម្ម
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

# បង្កើតបរិយាកាស
azd env new dev
azd env new staging
azd env new production

# ប្រតិបត្តិការចែកចាយតាមដំណាក់កាល
./deploy-staged.sh
```

**លក្ខខណ្ឌជោគជ័យ:**
- [ ] បរិយាកាស dev ចេញផ្សាយជោគជ័យ
- [ ] បរិយាកាស staging ចេញផ្សាយជោគជ័យ
- [ ] តម្រូវការអនុម័តដោយមនុស្សសម្រាប់ផលិតកម្ម
- [ ] បរិយាកាសទាំងអស់មានការត្រួតពិនិត្យសុខភាពដំណើរការ
- [ ] អាចត្រឡប់ក្រោយបានតាមតំរូវការជាមួយ

### លំហាត់ 4: យុទ្ធសាស្រ្តត្រឡប់ក្រោយ (២៥ នាទី)
**គោលដៅ**: អនុវត្ត ហើយតេស្តការត្រឡប់ក្រោយការចេញផ្សាយជាមួយ Git

```bash
# ផ្តល់ជូន v1
azd env set APP_VERSION "1.0.0"
azd up

# រក្សាទុក hash commit v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ផ្តល់ជូន v2 ជាមួយការផ្លាស់ប្តូរខូចខាត
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ស្គាល់បរាជ័យ និងត្រឡប់ក្រោយ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # ត្រឡប់ក្រោយដោយប្រើ git
    git revert HEAD --no-edit
    
    # បរិយាកាសត្រឡប់ក្រោយ
    azd env set APP_VERSION "1.0.0"
    
    # ផ្តល់ជូន v1 ថ្មី
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**លក្ខខណ្ឌជោគជ័យ:**
- [ ] អាចស្គាល់ករណីបរាជ័យចេញផ្សាយ
- [ ] ស្គ្រីបត្រឡប់ក្រោយរត់ស្វ័យប្រវត្តិ
- [ ] កម្មវិធីត្រឡប់ទៅស្ថានភាពដំណើរការ
- [ ] ការត្រួតពិនិត្យសុខភាពជោគជ័យបន្ទាប់ពីការត្រឡប់ក្រោយ

## 📊 ការតាមដានមាត្រដ្ឋានចេញផ្សាយ

### តាមដានសមត្ថភាពចេញផ្សាយរបស់អ្នក

```bash
# បង្កើតស្គ្រីបវិមាត្រការចេញផ្សាយ
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

# កំណត់ហេតុលើឯកសារ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ប្រើវា
./track-deployment.sh
```

**វិភាគមាត្រដ្ឋានរបស់អ្នក៖**
```bash
# មើលប្រវត្តិនៃការចែកចាយ
cat deployment-metrics.csv

# គណនាពេលវេលាមធ្យមនៃការចែកចាយ
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## ធនធានបន្ថែម

- [ការយោងការចេញផ្សាយ Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [ការចេញផ្សាយ Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [ការចេញផ្សាយ Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [ការចេញផ្សាយ Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ការជិះចរាចរ**
- **មេរៀនមុន**: [គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **មេរៀនបន្ទាប់**: [ការផ្គត់ផ្គង់ធនធាន](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**៖  
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ខណៈពេលដែលយើងខិតខំប្រឹងប្រែងដើម្បីភាពត្រឹមត្រូវ សូមយកចិត្តទុកដាក់ថា ការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬភាពខុសគ្នា។ ឯកសារដើមនៅភាសាទស្រទាប់ត្រូវត្រូវបានគិតថាជា ប្រភពណែនាំដែលមានសុពលភាព។ សម្រាប់ព័ត៌មានសំខាន់ៗ គួរឲ្យប្រើការបកប្រែដោយមនុស្សដែលមានជំនាញវិជ្ជាជីវៈ។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសដែលកើតឡើងពីការប្រើប្រាស់ការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->