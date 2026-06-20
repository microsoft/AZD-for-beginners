# Deployment Guide - Mastering AZD Deployments

**Chapter Navigation:**
- **📚 ទំព័រមេគណៈសិក្សា**: [AZD For Beginners](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 4 - កិច្ចការក្រៅ (Infrastructure as Code & Deployment)
- **⬅️ ជំពូកមុន**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ បន្ទាប់**: [Provisioning Resources](provisioning.md)
- **🧩 ក៏នៅក្នុងជំពូកនេះ**: [Authoring Your Own Template](custom-templates.md)
- **🚀 ជំពូកបន្ទាប់**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## ការណែនាំ

មគ្គុទេសក៍នេះគ្របដណ្តប់អ្វីគ្រប់យ៉ាងដែលអ្នកត្រូវត្រៀមខ្លួនសម្រាប់ការបញ្ចូនកម្មវិធីដោយប្រើ Azure Developer CLI ចាប់ពីការបញ្ចូនបញ្ជា​តែមួយរហូតដល់​សถานភាពផលិតកម្ម​កម្រិតខ្ពស់ជាមួយ hooks ផ្ទាល់ខ្លួន, បរិយាកាស​ច្រើន, និងការរួមបញ្ចូល CI/CD។ បង្កើតជំនាញលំអិតលើលំនាំជីវិតនៃការដាក់ឲ្យដំណើរការជាមួយឧទាហរណ៍អនុវត្តន៍ និងអនុប្បទានល្អៗ។

## គោលដៅការសិក្សា

ដោយបញ្ចប់មគ្គុទេសក៍នេះ អ្នកនឹង:
- ស្គាល់ពាក្យបញ្ជា និងចរន្តការងារ Azure Developer CLI សម្រាប់ការដាក់ឲ្យដំណើរការ
- យល់ដឹងពីលំនាំជីវិតទាំងមូលរបស់ការដាក់ឲ្យដំណើរការ ពីការបង្កើតធនធានដល់ការត្រួតពិនិត្យ
- អនុវត្ត hooks ផ្ទាល់ខ្លួនសម្រាប់អូតូម៉ាទ័រ​កុនិតកម្មមុននិងបន្ទាប់ការដាក់ឲ្យដំណើរការ
- កំណត់បរិយាកាសច្រើនជាមួយប៉ារ៉ាម៉ែត្រ​ដែលបំណុលនឹងបរិយាកាសនីមួយៗ
- តំឡើងយុទ្ធសាស្រ្តដាក់ឲ្យដំណើរការខ្ពស់ រួមទាំង blue-green និង canary
- រួមបញ្ចូល azd deployments ជាមួយបណ្ដាញ CI/CD និងដំណើរការ DevOps

## លទ្ធផលការសិក្សា

បន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច:
- ប្រតិបត្តិ និងដោះស្រាយ​បញ្ហាចរន្តការដាក់ឲ្យដំណើរការ azd ដោយឯករាជ្យ
- រចនា និងអនុវត្តអូតូម៉ាទ័រការដាក់ឲ្យដំណើរការ​ផ្ទាល់ខ្លួនដោយប្រើ hooks
- កំណត់ការដាក់ឲ្យដំណើរការដែលរួចទៅរកផលិតកម្មជាមួយសុវត្ថិភាព និងការត្រួតពិនិត្យសមរម្យ
- គ្រប់គ្រង​សถานភាព​ដាក់ឲ្យដំណើរការច្រើនជ្រុលស្មុគស្មាញ
- បង្កើនប្រសិទ្ធិភាពនៃការដាក់ឲ្យដំណើរការ និងអនុវត្តយុទ្ធសាស្រ្តចូលត្រឡប់
- រួមបញ្ចូល azd deployments ទៅក្នុងការអនុវត្ត DevOps ក្រុមហ៊ុន

## ទិដ្ឋភាពទូទៅនៃការដាក់ឲ្យដំណើរការ

Azure Developer CLI ផ្ដល់ពាក្យបញ្ជាច្រើនសម្រាប់ការដាក់ឲ្យដំណើរការ:
- `azd up` - ចរន្តការងារពេញលេញ (provision + deploy)
- `azd provision` - បង្កើត/ធ្វើបច្ចុប្បន្នភាពធនធាន Azure តែប៉ុណ្ណោះ
- `azd deploy` - ដាក់ឲ្យដំណើរការកូដកម្មវិធីតែម្ដង
- `azd package` - សង់ និងកញ្ចប់កម្មវិធី

## ចរន្តការដាក់ឲ្យដំណើរការមូលដ្ឋាន

### ការដាក់ឲ្យដំណើរការពេញលេញ (azd up)
ចរន្តការងារដែលគេប្រើជាញឹកញាប់សម្រាប់គម្រោងថ្មី:
```bash
# ដាក់ប្រើអ្វីៗទាំងអស់ពីចាប់ផ្តើម
azd up

# ដាក់ប្រើជាមួយបរិយាកាសដែលបានកំណត់
azd up --environment production

# ដាក់ប្រើជាមួយប៉ារ៉ាម៉ែត្រផ្ទាល់ខ្លួន
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ការដាក់ឲ្យដំណើរការជាមិញសម្រាប់ហេតុបរិស្ថានធនធានតែប៉ុណ្ណោះ
នៅពេលដែលអ្នកត្រូវការកែប្រែធនធាន Azure តែប៉ុណ្ណោះ:
```bash
# ផ្ដល់/ធ្វើបច្ចុប្បន្នភាព ហេដ្ឋារចនាសម្ព័ន្ធ
azd provision

# ផ្ដល់ដោយ dry-run ដើម្បីពិនិត្យមើលការផ្លាស់ប្តូរមុន
azd provision --preview

# ផ្ដល់សេវាកម្មជាក់លាក់
azd provision --service database
```

### ការដាក់ឲ្យដំណើរការតែ​កូដ
សម្រាប់ការអាប់ដែតកម្មវិធីយ៉ាងលឿន:
```bash
# ចែកចាយសេវាកម្មទាំងអស់
azd deploy

# លទ្ធផលដែលរំពឹងទុក:
# កំពុងចែកចាយសេវាកម្ម (azd deploy)
# - web: កំពុងចែកចាយ... រួចរាល់
# - api: កំពុងចែកចាយ... រួចរាល់
# SUCCESS: ការចែកចាយរបស់អ្នកបានបញ្ចប់ក្នុង 2 នាទី 15 វិនាទី

# ចែកចាយសេវាកម្មជាក់លាក់
azd deploy --service web
azd deploy --service api

# ចែកចាយដោយប្រើប៉ារ៉ាម៉ែត្រសាងសង់ផ្ទាល់ខ្លួន
azd deploy --service api --build-arg NODE_ENV=production

# ផ្ទៀងផ្ទាត់ការចែកចាយ
azd show --output json | jq '.services'
```

### ✅ ការផ្ទៀងផ្ទាត់ការដាក់ឲ្យដំណើរការ

បន្ទាប់ពីការដាក់ឲ្យដំណើរការ ធ្វើការផ្ទៀងផ្ទាត់ភាពជោគជ័យ:

```bash
# ពិនិត្យថាសេវាកម្មទាំងអស់កំពុងដំណើរការ
azd show

# សាកល្បងចំណុចបញ្ចប់សុខភាព
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# តាមដានកំហុស (ដោយលំនាំដើម នឹងបើកក្នុងកម្មវិធីរុករក)
azd monitor --logs
```

**កញ្ចប់ជោគជ័យ៖**
- ✅ សេវាកម្មទាំងអស់បង្ហាញស្ថានភាព "Running"
- ✅ ចំណុចផ្ទុកសុខភាព (health endpoints) បញ្ចូន HTTP 200
- ✅ គ្មានកំណត់ហេតុកំហុសនៅក្នុង 5 នាទីចុងក្រោយ
- ✅ កម្មវិធីឆ្លើយតបនឹងសំណើសាកល្បង

## 🏗️ យល់ដឹងអំពីដំណើរការដាក់ឲ្យដំណើរការ

### ថ្មីចំពោះ hooks? ចាប់ផ្តើមពីទីនេះ

A **hook** គឺជាពាក្យបញ្ជា​មួយដែល azd ជូនដំណើរការអូតូម៉ាទ័រនៅពេលពិសេសមួយក្នុងដំណើរការ deploy—មុនឬបន្ទាប់ពី provision, និងមុនឬបន្ទាប់ពី deploy កូដរបស់អ្នក។ វាអនុញ្ញាតឱ្យអ្នកអូតូម៉ាទ័រងារតូចៗដែលជារឿងធម្មតារីករាលដាលជុំវិញការដាក់ឲ្យដំណើរការ: ដាំទិន្នន័យទៅក្នុងទិន្នន័យសន្ដាន, រត់ migrations, សង់អាសserts, ឬធ្វើការសាកល្បងសាមញ្ញលើកម្មវិធីចាក់សកម្ម។

| Hook | Runs… | Common use |
|------|-------|------------|
| `preprovision` | Before resources are created | Validate prerequisites, log in to a registry |
| `postprovision` | After resources exist | Configure resources, set up the database |
| `predeploy` | Before code is deployed | Build front-end assets, run unit tests |
| `postdeploy` | After code is live | Run DB migrations, smoke-test the endpoint |

Hooks ស្ថិតនៅក្នុង `azure.yaml` របស់អ្នក។ នេះគឺជា ឧទាហរណ៍តូចជាងគេ—វាចុចសារមួយបន្ទាប់ពីការដាក់ឲ្យដំណើរការ:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

នេះហើយ—នៅពេលក្រោយដែលអ្នករត់ `azd up` សារ​នោះនឹងបោះពុម្ពដោយស្វ័យប្រវត្តិ។ អ្នកក៏អាចរត់ hook មួយប្រភេទដោយឯង មិនចាំបាច់ធ្វើ deploy ពេញលេញ ដែលល្អសម្រាប់សាកល្បង:

```bash
azd hooks run postdeploy
```

ដំណាក់កាលខាងក្រោមបង្ហាញ hooks ក្នុងពិភពពិត (migrations, tests, validation) សម្រាប់មួយគ្រប់ដំណាក់កាល។

### ដំណាក់កាល 1: Pre-Provision Hooks
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

### ដំណាក់កាល 2: ការបង្កើតធនធានអ៊ីនហ្វ្រាស្ត្រាក់ចcture
- អានបំណែក template របស់ហេដ្ឋារចនាសម្ព័ន្ធ (Bicep/Terraform)
- បង្កើតឬធ្វើបច្ចុប្បន្នភាពធនធាន Azure
- កំណត់បណ្ដាញ និងសុវត្ថិភាព
- តំឡើងការត្រួតពិនិត្យ និងកំណត់ហេតុ

### ដំណាក់កាល 3: Post-Provision Hooks
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

### ដំណាក់កាល 4: ការកញ្ចប់កម្មវិធី
- សង់កូដកម្មវិធី
- បង្កើតអត្ថប្រយោជន៍សម្រាប់ការដាក់ឲ្យដំណើរការ
- កញ្ចប់សម្រាប់វេទិកាគោលដ្ឋាន (containers, ZIP files, ជាដើម)

### ដំណាក់កាល 5: Pre-Deploy Hooks
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

### ដំណាក់កាល 6: ការដាក់ឲ្យដំណើរការកម្មវិធី
- ដាក់ឲ្យដំណើរការកម្មវិធីដែលបានកញ្ចប់ទៅសេវាកម្ម Azure
- អាប់ដែតការកំណត់រចនាសម្ព័ន្ធ
- ចាប់/ផ្ដើមឡើងវិញសេវាកម្ម

### ដំណាក់កាល 7: Post-Deploy Hooks
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

### ការដោះស្រាយបញ្ហា Hook

ដោយផ្ដល់លំនាំដើម, **បើពាក្យបញ្ជា hook បញ្ចប់ជាមួយកូដ non-zero, azd នឹងបញ្ឈបកម្មវិធីទាំងមូល។** នេះជារឿងដែលភាគច្រើនអ្នកចង់បាន—migration មួយបរាជ័យ គួរតែពន្យល់ការដាក់ឲ្យដំណើរការ មិនម្តងទេបញ្ចូនកម្មវិធីដែលខូច។ ប៉ុន្តែវាក៏មានន័យថា hooks ចាំបាច់ត្រូវបានសរសេរយ៉ាងប្រុងប្រយ័ត្ន។

**1. ធ្វើឱ្យកំហុសភ្លក់ចេញ និងមានបំណង។** Hook មួយបរាជ័យពេលពាក្យបញ្ជាចុងក្រោយរបស់វាបង្វិលមកវិញកូដ exit non-zero។ ក្នុង script shell, បន្ថែម `set -e` ដូច្នេះ hook នឹងផ្អាកនៅពេលមានបច្ចុប្បន្នកំហុសទីមួយ មិនឲ្យបន្តភ្លាត់ចោល:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. អនុញ្ញាតឲ្យ hook បរាជ័យដោយគ្មានការឈប់ azd។** សម្រាប់ជំហានមិនសំខាន់ (ជាឧទាហរណ៍ ការកម្ចាត់ cache ជាជម្រើស, ការជូនដំណឹងដោយខ្ជះខ្ជាយ), កំណត់ `continueOnError: true`។ azd នឹងកត់ឡុកកំហុសប៉ុន្តែបន្តការងារ:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. សាកល្បង hooks ដោយឯកឡែក មុនការរត់ពេញលេញ។** អ្នកមិនចាំបាច់រត់ `azd up` ដើម្បីដោះស្រាយកំហុស hook—រត់វាឯងហើយធ្វើការ iteration ឆាប់រហ័ស:

```bash
azd hooks run predeploy          # ដំណើរការតែ hook មុន​ការ​ដាក់ចេញ
azd hooks run postdeploy --service api
```

**4. កត់សម្គាល់សម្រាប់​សែលផ្ទុកតាមប្រព័ន្ធប្រតិបត្តិការ។** Hook ដែលប្រើ `shell: pwsh` ត្រូវការតំឡើង PowerShell លើម៉ាស៊ីនដែលរត់វា (រួមទាំងភេព CI agents)។ ប្រើ `shell: sh` សម្រាប់ភាពអាចផ្ទុកបានទូលំទូលាយបំផុត, ឬផ្តល់ទាំង `windows` និង `posix` ជាវិភាគបម្រើ:

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

> **ក技巧 Debugging:** រត់ពាក្យបញ្ជា azd ណាមួយជាមួយ `--debug` ដើម្បីឃើញតួអក្សរពេញលេញនៃបញ្ជា hook និងលទ្ធផលពេញលេញ—មានតំលៃយ៉ាងខ្លាំងពេល hook ធ្វើការ_locally ប៉ុន្តែបរាជ័យនៅក្នុង CI។

## 🎛️ ការកំណត់ការដាក់ឲ្យដំណើរការ

### ការកំណត់បែបថ្មីសម្រាប់សេវាកម្មជាក់លាក់
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

### ការកំណត់បរិយាកាសជាក់លាក់
```bash
# បរិយាកាសអភិវឌ្ឍន៍
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# បរិយាកាសសាកល្បង
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# បរិយាកាសផលិតកម្ម
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 សេណារីយ៉ូដាក់ឲ្យដំណើរការដ៏ខ្ពស់

### កម្មវិធីច្រើនសេវា
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
# បង្កើតបរិយាកាសពណ៌ខៀវ
azd env new production-blue
azd up --environment production-blue

# សាកល្បងបរិយាកាសពណ៌ខៀវ
./scripts/test-environment.sh production-blue

# ប្ដូរចរាចរណ៍ទៅពណ៌ខៀវ (ធ្វើបច្ចប្បន្នភាព DNS/ឧបករណ៍បែងចែកបន្ទុកដោយដៃ)
./scripts/switch-traffic.sh production-blue

# សម្អាតបរិយាកាសពណ៌បៃតង
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

## 🐳 ការដាក់ឲ្យដំណើរការដោយcontainer

### ការដាក់ឲ្យដំណើរការ Container App
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

### ការបង្កើត Dockerfile ជាច្រើនដំណាក់កាល
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

## ⚡ បង្កើនប្រសិទ្ធភាព

### ការដាក់ឲ្យដំណើរការតាមសេវាកម្ម
```bash
# ដាក់ដំណើរការសេវាកម្មជាក់លាក់ ដើម្បីធ្វើវដ្តបានលឿន
azd deploy --service web
azd deploy --service api

# ដាក់ដំណើរការសេវាកម្មទាំងអស់
azd deploy
```

### កាសេវ៍ Build Caching
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### ការដាក់ឲ្យដំណើរការកូដដែលមានប្រសិទ្ធភាព
```bash
# ប្រើ azd deploy (មិនមែន azd up) សម្រាប់ការផ្លាស់ប្ដូរជាកូដតែប៉ុណ្ណោះ
# នេះលើកលែងការផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ និងរហ័សជាច្រើន
azd deploy

# ដាក់ចេញសេវាកម្មជាក់លាក់ ដើម្បីអនុវត្តបានលឿនបំផុត
azd deploy --service api
```

## 🔍 ការត្រួតពិនិត្យការដាក់ឲ្យដំណើរការ

### ការត្រួតពិនិត្យតាមពេលវេលាពិត
```bash
# តាមដានកម្មវិធីក្នុងពេលពិត
azd monitor --live

# មើលកំណត់ហេតុរបស់កម្មវិធី
azd monitor --logs

# ពិនិត្យស្ថានភាពការដាក់ចេញ
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

### ការផ្ទៀងផ្ទាត់បន្ទាប់ពីដាក់ឲ្យដំណើរការ
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

## 🔐 ការពិចារណាផ្នែកសន្តិសុខ

### ការគ្រប់គ្រងសម្ងាត់ (Secrets Management)
```bash
# ផ្ទុកសម្ងាត់ដោយយ៉ាងសុវត្ថិភាព
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# យោងសម្ងាត់នៅក្នុង azure.yaml
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

### សុវត្ថិភាពបណ្ដាញ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### អត្តសញ្ញាណ និងការគ្រប់គ្រងការចូលដំណើរការ
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

## 🚨 យុទ្ធសាស្រ្តបង្វិលត្រឡប់

### ការត្រឡប់ឆាប់រហ័ស
```bash
# AZD មិនមានមុខងារ​បង្វិលត្រឡប់ (rollback) ស្រេចក្នុងខ្លួនទេ។ វិធីសាស្ត្រដែលផ្ដល់អនុសាសន៍៖

# ជម្រើស 1: ដាក់ឡើងវិញពី Git (ផ្ដល់អនុសាសន៍)
git revert HEAD  # ត្រឡប់ការផ្លាស់ប្ដូរ commit ដែលមានបញ្ហា
git push
azd deploy

# ជម្រើស 2: ដាក់ឡើងវិញ commit ជាក់លាក់
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ការត្រឡប់ហេដ្ឋារចនាសម្ព័ន្ធ
```bash
# ពិនិត្យមើលការផ្លាស់ប្តូរហេដ្ឋារចនាសម្ព័ន្ធ មុនអនុវត្ត
azd provision --preview

# សម្រាប់ការវិលត្រឡប់ហេដ្ឋារចនាសម្ព័ន្ធ សូមប្រើការគ្រប់គ្រងកំណែ:
git revert HEAD  # វិលត្រឡប់ការផ្លាស់ប្តូរហេដ្ឋារចនាសម្ព័ន្ធ
azd provision    # អនុវត្តស្ថានភាពមុននៃហេដ្ឋារចនាសម្ព័ន្ធ
```

### ការត្រឡប់មigrations ទិន្នន័យ
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ម៉េត្រិកការដាក់ឲ្យដំណើរការ

### តាមដានប្រសិទ្ធភាពការដាក់ឲ្យដំណើរការ
```bash
# មើលស្ថានភាពនៃការដាក់ឲ្យដំណើរការបច្ចុប្បន្ន
azd show

# តាមដានកម្មវិធីដោយប្រើ Application Insights
azd monitor --overview

# មើលមេត្រិចក្នុងពេលពិត
azd monitor --live
```

### ការចាប់ប្រមូលម៉េត្រិកផ្ទាល់ខ្លួន
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

## 🎯 អនុវត្តន៍ល្អបំផុត

### 1. ភាពស្របគ្នារវាងបរិយាកាស
```bash
# ប្រើឈ្មោះឲ្យស្របគ្នា
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# រក្សាសមភាពរវាងបរិយាកាស
./scripts/sync-environments.sh
```

### 2. ការផ្ទៀងផ្ទាត់ហេដ្ឋារចនាសម្ព័ន្ធ
```bash
# ពិនិត្យមើលការផ្លាស់ប្តូររចនាសម្ព័ន្ធមុនការដាក់ឱ្យប្រតិបត្តិ
azd provision --preview

# ប្រើការត្រួតពិនិត្យកូដ (linting) សម្រាប់ ARM/Bicep
az bicep lint --file infra/main.bicep

# ផ្ទៀងផ្ទាត់វេយ្យាករណ៍របស់ Bicep
az bicep build --file infra/main.bicep
```

### 3. ការរួមបញ្ចូលការធ្វើតេស្ត
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

### 4. ការយោង និងកំណត់ហេតុ
```bash
# កត់ត្រានីតិវិធីដាក់ចេញ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ជំហានបន្ទាប់

- [Provisioning Resources](provisioning.md) - ជជែកជ្រៅជាងក្នុងការគ្រប់គ្រងហេដ្ឋារចនាសម្ព័ន្ធ
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - ផែនការយុទ្ធសាស្ត្រការដាក់ឲ្យដំណើរការ
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - ដោះស្រាយបញ្ហាក្នុងការដាក់ឲ្យដំណើរការ
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - យុទ្ធសាស្ត្រដាក់ឲ្យដំណើរការសម្រាប់ផលិតកម្ម

## 🎯 លំហាត់អនុវត្តផ្ទាល់

### លំហាត់ 1: ចរន្តការដាក់ឲ្យដំណើរការបន្ថែមលើ (20 នាទី)
**គោលដៅ**: បង្កើតជំនាញក្នុងការប្រៀបធៀបរវាងការដាក់ឲ្យដំណើរការពេញលេញ និងការដាក់ឲ្យដំណើរការបន្ថែម

```bash
# ការដាក់ប្រើដំបូង
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# កត់ត្រាពេលវេលានៃការដាក់ប្រើដំបូង
echo "Full deployment: $(date)" > deployment-log.txt

# ធ្វើការផ្លាស់ប្តូរកូដ
echo "// Updated $(date)" >> src/api/src/server.js

# ដាក់ប្រើតែកូដ (លឿន)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# ប្រៀបធៀបពេលវេលា
cat deployment-log.txt

# សម្អាត
azd down --force --purge
```

**កញ្ចប់ជោគជ័យ:**
- [ ] ការដាក់ឲ្យដំណើរការពេញលេញចំណាយ 5-15 នាទី
- [ ] ការដាក់ឲ្យដំណើរការបែប code-only ចំណាយ 2-5 នាទី
- [ ] ការផ្លាស់ប្តូរកូដបញ្ចេញនៅក្នុងកម្មវិធីដែលបានដាក់
- [ ] ហេដ្ឋារចនាសម្ព័ន្ធមិនផ្លាស់ប្តូរបន្ទាប់ពី `azd deploy`

**លទ្ធផលការសិក្សា**: `azd deploy` លឿន 50-70% ជាង `azd up` សម្រាប់ការផ្លាស់ប្តូរកូដ

### លំហាត់ 2: Hooks ដាក់ឲ្យដំណើរការផ្ទាល់ខ្លួន (30 នាទី)
**គោលដៅ**: អនុវត្តអូតូម៉ាទ័រមុននិងបន្ទាប់ការដាក់ឲ្យដំណើរការ

```bash
# បង្កើតស្គ្រីបផ្ទៀងផ្ទាត់មុនការដាក់ចេញ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ពិនិត្យថាការធ្វើតេស្តបានជោគជ័យ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ពិនិត្យរកការផ្លាស់ប្តូរដែលមិនទាន់បាន commit
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# បង្កើតសាកល្បងសុខភាពបន្ទាប់ពីការដាក់ចេញ
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

# បន្ថែម hooks ទៅក្នុង azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# សាកល្បងការដាក់ចេញជាមួយ hooks
azd deploy
```

**កញ្ចប់ជោគជ័យ:**
- [ ] ស្គ្រីប Pre-deploy រត់មុនការដាក់ឲ្យដំណើរការ
- [ ] ការដាក់ឲ្យដំណើរការបញ្ឈប់បើតេស្តបរាជ័យ
- [ ] ការសាកល្បង smoke បន្ទាប់-deploy ធ្វើការផ្ទៀងផ្ទាត់សុខភាព
- [ ] Hooks រត់តាមលំដាប់ត្រឹមត្រូវ

### លំហាត់ 3: យុទ្ធសាស្ត្រការដាក់ឲ្យដំណើរការជាច្រើនបរិយាកាស (45 នាទី)
**គោលដៅ**: អនុវត្តចរន្តការដាក់ឲ្យដំណើរការជាដំណាក់កាល (dev → staging → production)

```bash
# បង្កើតស្គ្រីបសម្រាប់ដាក់ចេញ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ជំហាន 1: ដាក់ចេញទៅ dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ជំហាន 2: ដាក់ចេញទៅ staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ជំហាន 3: ការអនុម័តដោយដៃសម្រាប់បរិយាកាសផលិត
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

# រត់ការដាក់ចេញតាមដំណាក់កាល
./deploy-staged.sh
```

**កញ្ចប់ជោគជ័យ:**
- [ ] បរិយាកាស Dev ដាក់ឲ្យដំណើរការជោគជ័យ
- [ ] បរិយាកាស Staging ដាក់ឲ្យដំណើរការជោគជ័យ
- [ ] តម្រូវការអនុម័តដោយដោយដៃសម្រាប់ផលិតកម្ម
- [ ] បរិយាកាសទាំងអស់មានការត្រួតពិនិត្យសុខភាពដំណើរការបាន
- [ ] អាចត្រឡប់ក្រោយបានប្រសិនបើចាំបាច់

### លំហាត់ 4: យុទ្ធសាស្ត្រត្រឡប់ (25 នាទី)
**គោលដៅ**: អនុវត្តនិងសាកល្បងការត្រឡប់ការដាក់ឲ្យដំណើរការប្រើ Git

```bash
# ដាក់ឲ្យដំណើរការ v1
azd env set APP_VERSION "1.0.0"
azd up

# រក្សាទុក hash នៃ commit v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ដាក់ឲ្យដំណើរការ v2 ដែលមានការផ្លាស់ប្តូរដែលបាក់បែក
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# រកឃើញការបរាជ័យ និងត្រឡប់វិញ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # ត្រឡប់វិញដោយប្រើ git
    git revert HEAD --no-edit
    
    # ត្រឡប់បរិយាកាសវិញ
    azd env set APP_VERSION "1.0.0"
    
    # ដាក់ឲ្យដំណើរការ v1 វិញ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**កញ្ចប់ជោគជ័យ:**
- [ ] អាចរកឃើញការបរាជ័យក្នុងការដាក់ឲ្យដំណើរការ
- [ ] ស្គ្រីបត្រឡប់រត់ដោយស្វ័យប្រវត្តិ
- [ ] កម្មវិធីត្រលប់ទៅស្ថានភាពដំណើរការបាន
- [ ] ការត្រួតពិនិត្យសុខភាពជោគជ័យបន្ទាប់ពីត្រឡប់

## 📊 ការតាមដានម៉េត្រិកការដាក់ឲ្យដំណើរការ

### តាមដានប្រសិទ្ធភាពការដាក់ឲ្យដំណើរការ

```bash
# បង្កើតស្គ្រីបសម្រាប់មេត្រិចការដាក់ប្រើ
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

# កត់ត្រាទៅក្នុងឯកសារ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ប្រើវា
./track-deployment.sh
```

**វិភាគម៉េត្រិករបស់អ្នក:**
```bash
# មើលប្រវត្តិការដាក់ចេញ
cat deployment-metrics.csv

# គណនាពេលវេលាមធ្យមនៃការដាក់ចេញ
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## ធនធានបន្ថែម

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **មេរៀនមុន**: [Your First Project](../chapter-01-foundation/first-project.md)
- **មេរៀនបន្ទាប់**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->