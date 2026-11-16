# មគ្គុទេសក៍ការដាក់អនុវត្ត - ការគ្រប់គ្រងការដាក់អនុវត្ត AZD

**ការរុករកជំពូក៖**
- **📚 ផ្ទះសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 4 - ឧបករណ៍អវសាខ់ជាបញ្ចី & ការដាក់អនុវត្ត
- **⬅️ ជំពូកមុន**: [ជំពូក 3: ការកំណត់រចនា](../chapter-03-configuration/configuration.md)
- **➡️ បន្ទាប់**: [ការផ្គត់ផ្គង់ប្រភព](provisioning.md)
- **🧩 ក៏មាននៅក្នុងជំពូកនេះ**: [ការច្នៃប្រឌិតការប្រព្រឹត្តិតែមួយទ្រង់ទ្រាយ](custom-templates.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 5: ដំណោះស្រាយ AI បន្តិចបន្តួចជាច្រើនភ្នាក់ងារ](../../examples/retail-scenario.md)

## ទិដ្ឋភាពទូទៅ

> បានពិនិត្យឡើងវិញ ប្រឆាំងនឹង `azd 1.37.2` (វិច្ឆិកា ២០២៦)។ ពាក្យបញ្ជា​ប្រើ Bash; ឧទាហរណ៍ JSON តម្រូវឱ្យមាន `jq`។ លើសពីលំហាត់ todo ដែលបាន initialized យ៉ាងច្បាស់ អ្នកទាំងអស់គ្នាគឺជា **ផ្នែកបញ្ចូលគ្នា**៖ ផ្តល់ប្រភពឯង, អគារវិទ្យាសាស្ត្រ, ការធ្វើតេស្ត និងស្គ្រីបរបស់អ្នក។ មិនមានការដាក់បញ្ចូល Azure ត្រូវបានអនុវត្តក្នុងការពិនិត្យនេះទេ។

មគ្គុទេសក៍ទូលំទូលាយនេះគ្របដណ្តប់អ្វីគ្រប់យ៉ាងដែលអ្នកត្រូវការដើម្បីដាក់អនុសាសន៍កម្មវិធីដោយប្រើ Azure Developer CLI ពីការដាក់បញ្ចូលពាក្យបញ្ជាលោកតែមួយដល់ស្ថានភាពផលិតកម្មកម្រិតខ្ពស់ជាមួយគន្លឹះប្តូរពិសេស បរិយាកាសច្រើន និងការរួមបញ្ចូល CI/CD។ ចេះគ្រប់គ្រងវដ្តដាក់បញ្ចូលទាំងមូលដោយឧទាហរណ៍ប្រាកដ និងការអនុវត្តល្អបំផុត។

## គោលបំណងការសិក្សា

ដោយបញ្ចប់មគ្គុទេសក៍នេះ អ្នកនឹង:
- ជំនាញពាក្យបញ្ជារ Azure Developer CLI សម្រាប់ដាក់ការងារ និងវដ្តការងារ
- អ្វីដែលចេះពីវដ្តដាក់បញ្ចូលទាំងមូលពីការផ្គត់ផ្គង់ទៅការត្រួតពិនិត្យ
- អនុវត្តខ្សែពេលប្តូរពិសេសសម្រាប់ស្វ័យប្រតិបត្តិការពាក់ព័ន្ធមុននិងបន្ទាប់ពីដាក់បញ្ចូល
- កំណត់បរិយាកាសច្រើនជាមួយប៉ារ៉ាម៉ែត្រ​ឯកសារបរិយាកាស
- តំឡើងយុទ្ធសាស្ត្រដាក់បញ្ចូលកម្រិតខ្ពស់ រួមមានដាក់បន្លូតប្លូផោន និង canary
- រួមបញ្ចូលការដាក់បញ្ចូល azd ជាមួយបំពង់ CI/CD និងវដ្តការងារ DevOps

## ផលប៉ះពាល់ការសិក្សា

នៅពេលបញ្ចប់ អ្នកនឹងអាច:
- ប្រតិបត្តិ និងដោះស្រាយបញ្ហាវដ្តបញ្ចូល azd ទាំងអស់ដោយឯករាជ្យ
- រចនារ និងអនុវត្តស្វ័យប្រតិបត្តិការដាក់បញ្ចូលដោយខ្សែពេល
- កំណត់ការដាក់បញ្ចូលដែលបានបង្ហាញសម្រាប់ផលិតកម្មជាមួយសុវត្ថិភាព និងការត្រួតពិនិត្យត្រឹមត្រូវ
- គ្រប់គ្រងស្ថានភាពដាក់បញ្ចូលមួយចំនួននៃបរិយាកាស
- បង្កើនប្រសិទ្ធភាពការដាក់បញ្ចូល និងអនុវត្តយុទ្ធសាស្ត្រត្រឡប់ក្រោយ
- រួមបញ្ចូលការដាក់បញ្ចូល azd ទៅក្នុងអនុវត្ត DevOps របស់សហគ្រាស

## ទិដ្ឋភាពទូទៅនៃការដាក់បញ្ចូល

Azure Developer CLI ផ្ដល់ពាក្យបញ្ជាដាក់បញ្ចូលច្រើន:
- `azd up` - វដ្តការងារពេញលេញ (ផ្គត់ផ្គង់ + ដាក់បញ្ចូល)
- `azd provision` - បង្កើត/ធ្វើបច្ចុប្បន្នភាពធនធាន Azure តែមួយ
- `azd deploy` - ដាក់បញ្ចូលកូដកម្មវិធីតែមួយ
- `azd package` - សង់ និងបញ្ចប់កម្មវិធី

## វដ្តដាក់បញ្ចូលមូលដ្ឋាន

### ដាក់បញ្ចូលពេញលេញ (azd up)
វដ្តការងារដែលទូទៅបំផុតសម្រាប់គម្រោងថ្មីៗ:
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

### ដាក់បញ្ចូលគ្រោងនិយមតែធនធាន
នៅពេលដែលអ្នកត្រូវការធ្វើបច្ចុប្បន្នភាពធនធាន Azure តែប៉ុណ្ណោះ:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### ដាក់បញ្ចូលគ្រោងតែកូដ
សម្រាប់បច្ចុប្បន្នភាពកម្មវិធីរហ័ស:
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

### ✅ ការត្រួតពិនិត្យការដាក់បញ្ចូល

បន្ទាប់ពីការដាក់បញ្ចូលណាមួយ ត្រួតពិនិត្យភាពជោគជ័យ:

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

**លក្ខខណ្ឌជោគជ័យ:**
- ✅ `azd show` ដោះសោរគោលដៅ/URL ប្រើប្រាស់បាន
- ✅ សំណើទៅផ្លូវកម្មវិធីពិតប្រាកដត្រឡប់ស្ថានភាព និងខួរក្បាលបានគោរព
- ✅ គ្មានកំណត់ហេតុបញ្ហាក្នុងរយៈពេល ៥ នាទីចុងក្រោយ
- ✅ កម្មវិធីបង្ហាញចំលើយចំពោះសំណួរតេស្ត

## 🏗️ ការយល់ដឹងអំពីដំណើរការដាក់បញ្ចូល

### ថ្មីចំពោះ hooks? ចាប់ផ្តើមនៅទីនេះ

**hook** គឺជាពាក្យបញ្ជាដែល azd រត់ស្វ័យប្រវត្តិនៅពេលណាមួយជាក់លាក់ក្នុងដំណើរការដាក់បញ្ចូល—មុន ឬបន្ទាប់ពីការផ្គត់ផ្គង់ ឬមុន ឬបន្ទាប់ពីដាក់កូដ។ វាអនុញ្ញាតឱ្យអ្នកអូតូម៉ាតិករងារតូចៗដែលតែងតែជុំវិញការដាក់បញ្ចូល៖ ដាំទិន្នន័យក្នុងមូលដ្ឋានទិន្នន័យ ដំណើរការបម្លែង សង់ទ្រព្យសកម្ម ឬពិនិត្យកម្មវិធីផ្លូវការឡើងវិញ។

| Hook | រត់… | ការប្រើប្រាស់ទូទៅ |
|------|-------|------------|
| `preprovision` | មុនធនធានត្រូវបានបង្កើត | ផ្ទៀងផ្ទាត់លក្ខខណ្ឌជាមុន ការចូលទៅតាមកំណត់ក្នុងស្តុក |
| `postprovision` | បន្ទាប់ពីធនធានមាន | កំណត់រៀបចំធនធាន តំឡើងមូលដ្ឋានទិន្នន័យ |
| `predeploy` | មុនកូដត្រូវបានដាក់បញ្ចូល | សង់ទ្រព្យសកម្មផ្នែកមុខ​ រត់តេស្តឯកត្តា |
| `postdeploy` | បន្ទាប់ពីកូដនៅលីវ | រត់បម្លែងមូលដ្ឋានទិន្នន័យ ពិនិត្យកម្មវិធីផ្លូវការឡើងវិញ |

Hooks ស្ថិតនៅក្នុង `azure.yaml` របស់អ្នក។ នេះគឺជាឧទាហរណ៍តូចបំផុតដែលបោះពុម្ពសារ បន្ទាប់ពីដាក់បញ្ចូល:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

ប៉ុណ្ណោះ—លើកក្រោយដែលអ្នករត់ `azd up` សារ​នឹងបោះពុម្ពស្វ័យប្រវត្តិ។ អ្នកក៏អាចរត់ hook តែមួយ ដោយគ្មានការដាក់បញ្ចូលពេញលេញ ដែលល្អសម្រាប់ការតេស្ត:

```bash
azd hooks run postdeploy
```

ជំហានខាងក្រោមបង្ហាញ hooks ពិត (បម្លែង, តេស្ត, ផ្ទៀងផ្ទាត់) សម្រាប់រាល់ដំណាក់កាល។

### ដំណាក់កាលទី 1៖ Hook មុនផ្គត់ផ្គង់
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

### ដំណាក់កាលទី 2៖ ផ្គត់ផ្គង់អគារវិទ្យាសាស្ត្រ
- អានគំរូអគារវិទ្យាសាស្ត្រ (Bicep/Terraform)
- បង្កើត ឬ បច្ចុប្បន្នភាពធនធាន Azure
- កំណត់បណ្តាញ និងសុវត្ថិភាព
- តំឡើងការត្រួតពិនិត្យ និង កំណត់ហេតុ

### ដំណាក់កាលទី 3៖ Hook បន្ទាប់ពីផ្គត់ផ្គង់
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

### ដំណាក់កាលទី 4៖ ការបញ្ចប់កម្មវិធី
- សង់កូដកម្មវិធី
- បង្កើតឯកសារដាក់បញ្ចូល
- បញ្ចប់សម្រាប់វេទិកាគោលដៅ (containers, ZIP, ល។)

### ដំណាក់កាលទី 5៖ Hook មុនដាក់បញ្ចូល
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

### ដំណាក់កាលទី 6៖ ដាក់បញ្ចូលកម្មវិធី
- ដាក់បញ្ចូលកម្មវិធីដែលបានបញ្ចប់ទៅសេវាកម្ម Azure
- បច្ចុប្បន្នភាពការកំណត់រចនាសម្ព័ន្ធ
- ចាប់ផ្តើម/ចាប់ផ្តើមឡើងវិញសេវាកម្ម

### ដំណាក់កាលទី 7៖ Hook បន្ទាប់ពីដាក់បញ្ចូល
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

### ការដោះស្រាយកំហុស Hook

ដោយផ្ទាល់, **ប្រសិនបើពាក្យបញ្ជា hook បញ្ចប់ជាមួយកូដកំហុស មិនមែនសូន្យ azd នឹងបញ្ឈប់ប្រតិបត្តិការទាំងមូល។** នេះជារឿងដែលត្រូវការប្រើប្រាស់៖ ការផ្លាស់ប្តូរមិនជោគជ័យគួរតែបញ្ឈប់ការដាក់បញ្ចូល មិនគួរអោយកម្មវិធីខូចឆ្លងផ្លូវ។ តែវាមានន័យថា hooks ត្រូវបានសរសេរយ៉ាងប្រុងប្រយ័ត្ន។

**1. ធ្វើឱ្យកំហុសមិនត្រូវបានភ្លេច និងមានមោទយភាព។** Hook នោះបរាជ័យនៅពេលដែលពាក្យបញ្ជាចុងក្រោយត្រឡប់កូដមិនសូន្យ។ នៅក្នុង script បង្កប់ បន្ថែម `set -e` ដើម្បីឱ្យ hook បញ្ឈប់នៅពេលបញ្ជា​មួយបរាជ័យ ជួយមិនឲ្យតាមដានបន្តដោយស្ងាត់ស្ងៀម:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. អនុញ្ញាតឱ្យ hook បរាជ័យដោយគ្មានការបញ្ឈប់ azd។** សម្រាប់ជំហានមិនចាំបាច់ (ការកំដៅ cache ជាជម្រើស, សេចក្ដីជូនដំណឹងល្អបំផុត), កំណត់ `continueOnError: true`។ azd កត់ត្រាកំហុស ប៉ុន្តែបន្តដំណើរការ:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. សាកល្បង hooks ដាច់ដោយឡែកមុនការរត់ពេញលេញ។** អ្នកមិនចាំបាច់រត់ `azd up` ដើម្បីដោះស្រាយបញ្ហា hook — រត់វាដាច់ដោយឡែក និងកែប្រែបានយ៉ាងរហ័ស:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. រក្សាយោបល់ចំពោះ shell ជាក់លាក់នៃប្រព័ន្ធប្រតិបត្តិការ។** Hook ដែលប្រើ `shell: pwsh` ត្រូវការតំឡើង PowerShell នៅលើម៉ាស៊ីនដែលរត់វា (រួមមានភ្នាក់ងារក្នុង CI)។ ប្រើ `shell: sh` សម្រាប់ភាពអាចដំណើរការបរិសុទ្ធបំផុត ឬផ្ដល់ទាំង `windows` និង `posix` ជាច្រើនប្រភេទ:

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

> **ក្បួនដោះស្រាយបញ្ហា:** រត់ពាក្យបញ្ជា azd ណាមួយជាមួយ `--debug` ដើម្បីមើលបន្ទាត់ពាក្យបញ្ជារនិងលទ្ធផលពេញលេញ—មានតម្លៃខ្លាំងពេល hook ប្រតិបត្តិបានល្អក្នុងក្នុងស្រុក ប៉ុន្តែនៅ CI បរាជ័យ។

## 🎛️ ការកំណត់តម្លៃការដាក់បញ្ចូល

### កំណត់តម្លៃការដាក់បញ្ចូលសេវាកម្មជាក់លាក់
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

### ការកំណត់បរិយាកាសជាក់លាក់

អ្នកគ្រាន់តែបំពេញតម្លៃ azd ផ្ទាល់ខ្លួនប៉ុណ្ណោះ។ ផ្ទៀងផ្ទាត់ផែនទីទៅកំណត់រចនាសម្ព័ន្ធអគារវិទ្យាសាស្ត្រ/ពេលរត់។ `NODE_ENV` ជាធម្មតាជា `production` សម្រាប់កម្មវិធី Node ដែលបានដាក់រៀបចំ រួមទាំងការដាក់បញ្ចូល staging; ប្រើអថេរពិសេស app-specific ខុសគ្នាសម្រាប់ដំណាក់កាលដាក់បញ្ចូល។

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

## 🔧 ស្ថានភាពដាក់បញ្ចូលកម្រិតខ្ពស់

### កម្មវិធីពហុសេវាកម្ម
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

### ដាក់បញ្ជូលប្លូផោន

**ការអធិប្បាយប្រតិបត្តិការទាំងមូល៖ អ្នកត្រូវផ្គត់ផ្គង់ទាំងពីរបរិយាកាស ស្រទាប់ការ​បែងចែកចរាចរណ៍រួម និងស្គ្រីបពីរខាងក្រោម។ azd មិនប្តូរចរាចរណ៍ ឬផ្ទៀងផ្ទាត់ស្រាប់ត្រៀមត្រលប់ក្រោយស្វ័យប្រវត្តិទេ។ រក្សាស្លៀកប្ដូរពណ៌បៃតងរហូតដល់បៃតងបានចេញពីការតេស្ត ហើយមិនត្រូវការត្រលប់ក្រោយបានទៀតទេ។

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

### ដាក់បញ្ចូល canary
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

ការបែកចែកចរាចរណ៍ជារបស់កំណត់តម្លៃ Container Apps (Bicep ឬ Azure CLI) មិនមែនជាគ្រឿងចំណុច `azure.yaml` `trafficSplit`។ ការមើលជាមុន/ផ្គត់ផ្គង់ និងការដាក់បញ្ចូលក្រោយត្រូវរក្សា​របៀបនិងច្បាប់ដឹកនាំដែលអ្នកបានជ្រើសរើស។

### ដាក់បញ្ចូលជាចំណុចមួយៗ
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

## 🐳 ដាក់បញ្ចូលកុងតឺណ័រ

### ដាក់បញ្ចូលកម្មវិធី Container App
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

កំណត់តម្លៃសម្ងាត់ runtime ជាមួយ `configuration.secrets`/`secretRef` (ឬយោង Key Vault) និងកំណត់អត្រាពង្រីកជាមួយ `template.scale` នៅក្នុងអគារវិទ្យាសាស្ត្រ Container App។ កុំបង្កើតគ្រឿងចំណុចបរិវេណសេវាកម្ម `secrets` ឬ `scale` ក្នុង `azure.yaml`។

### ការបញ្ចូល Dockerfile ជាច្រើនដំណាក់កាល
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

## ⚡ បង្កើនប្រសិទ្ធភាព

### ដាក់បញ្ចូលសេវាកម្មជាក់លាក់
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### កាកសំណល់គ្រប់គ្រងសំណង់
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

វដ្ត Node ស្តង់ដារប្រើស្គ្រីបកញ្ចប់; hooks សេវា `prepackage` អាចបន្ថែមជំហានដែលត្រូវការបាន។ កាកសំណល់ស្រទាប់ Docker គឺបំបែកពីការកំណត់ពាក្យបញ្ជាសង់សេវា។

### ដាក់បញ្ចូលកូដប្រសិទ្ធភាព
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 ត្រួតពិនិត្យការដាក់បញ្ចូល

### ត្រួតពិនិត្យការដាក់បញ្ចូលពេលពិត
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### ត្រួតពិនិត្យសុខភាព
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

កម្មវិធីរបស់អ្នកត្រូវអនុវត្ត `/health`; វា​មិនត្រូវបានផ្ដល់ដោយស្វ័យប្រវត្តិ​ដោយ azd ទេ។ គ្មានគ្រឿងចំណុចសេវា `azure.yaml` `healthCheck` ទូទៅទេ។

### ផ្ទៀងផ្ទាត់បន្ទាប់ពីដាក់បញ្ចូល
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

## 🔐 គិតគូរអំពីសុវត្ថិភាព

### ការគ្រប់គ្រងសម្ងាត់
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` មិនត្រឹមត្រូវទេ។ តម្លៃបរិយាកាសធម្មតាគឺជាអត្ថបទរលោងនៅក្នុងភ្លៅ បើមិនយកទៅជាការវាយតម្លៃនូវការចុចអានផ្សេងទៀត។ ពាក្យបញ្ជាខាងលើរក្សាទុកកំណត់យោង Key Vault ប៉ុន្តែអគារវិទ្យាសាស្ត្រ/កម្មវិធីរបស់អ្នកត្រូវតែបរិភោគសម្ងាត់នោះ និងផ្ដល់សិទ្ធិចូលដំណើរការជាផ្លូវការពេលរត់។

### សុវត្ថិភាពបណ្តាញ
សន្និដ្ឋាន និងប្រើប្រាស់ប៉ារ៉ាម៉ែត្របណ្តាញនៅក្នុង Bicep ហើយផ្ទៀងផ្ទាត់វានៅក្នុង `infra/main.parameters.json`។ គ្មានស្រទាប់ `infra.parameters` ទូទៅនៅក្នុង `azure.yaml` ទេ។ ឧទាហរណ៍ឯកសារសង្កេត `203.0.113.0/24` និង `198.51.100.0/24` មិនមែនបណ្តាញកន្លែងធ្វើការណ៍/VPN ពិតប្រាកដទេ; ជំនួសវាដោយបណ្តាញដែលមានអាណត្តិ។

### ការគ្រប់គ្រងអត្តសញ្ញាណ និងការចូលដំណើរការ
បើករបស់ Container App `identity` នៅក្នុង Bicep ហើយផ្ដល់តួនាទី Key Vault ផ្នែកទិន្នន័យនៅ​លើវិស័យ Vault។ កំណត់ឡើងសម្ងាត់ដែលគាំទ្រដោយ Key Vault និងយោងពេលរត់នៅក្នុងធនធាននោះ។ `identity` និង `keyVault` មិនមែនជាគ្រឿងចំណុចសេវា azd ទូទៅទេ។ មើល [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md)។

## 🚨 យុទ្ធសាស្ត្រត្រឡប់ក្រោយ

### ត្រឡប់ក្រោយរហ័ស
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

### ត្រឡប់ក្រោយអគារវិទ្យាសាស្ត្រ
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### ត្រឡប់ក្រោយបម្លែងមូលដ្ឋានទិន្នន័យ
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 គន្លងវាស់វែងការដាក់បញ្ចូល

### តាមដានប្រសិទ្ធភាពការដាក់បញ្ចូល
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### ការបង្កើតគន្លងវាស់វែងផ្ទាល់ខ្លួន
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

## 🎯 អនុវត្តល្អបំផុត

### 1. ទៀងទាត់បរិយាកាស
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. ផ្ទៀងផ្ទាត់អគារវិទ្យាសាស្ត្រ
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. ការរួមបញ្ចូលតេស្ត
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

### 4. ឯកសារ និងកំណត់ហេតុ
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ជំហានបន្ទាប់

- [Provisioning Resources](provisioning.md) - ជ្រៅចូលក្នុងការគ្រប់គ្រងអគារវិទ្យាសាស្ត្រ
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - ផែនការយុទ្ធសាស្ត្រ​ដាក់បញ្ចូល
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - ដោះស្រាយបញ្ហាក្នុងការដាក់បញ្ចូល
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - យុទ្ធសាស្ត្រដាក់បញ្ចូលសម្រាប់ផលិតកម្ម

## 🎯 លំហាត់ដាក់បញ្ចូលប្រាក់ប្រឹក្សា

### លំហាត់ ១៖ វដ្តដាក់បញ្ចូលបន្តបន្ទាប់ (២០នាទី)
**គោលបំណង**: ជំនាញកំណត់ខុសគ្នារវាងការដាក់បញ្ចូលពេញលេញ និងបន្តបន្ទាប់

**ចំណុចចាប់ផ្តើម:** Bash, Node.js 22, Git, ការចូល azd, និងការជាវ Azure ដែលមានសិទ្ធិដាក់បញ្ចូល។ រត់នៅក្នុងថតថ្មី; រំពឹងថា App Service/Cosmos DB អាចគិតថ្លៃ។ ពេលវេលាសំឡេងពីតំបន់ និងគំរូ។

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

**លក្ខខណ្ឌជោគជ័យ:**
- [ ] កត់ត្រាពេលវេលាប្រតិបត្តិការ១២៥សម្រាប់ពាក្យបញ្ជារ២ទាំងអស់ (គ្មានប៉ុណ្ណោះពេលវេលានៅធានាឡើយ)
- [ ] ពាក្យបញ្ជាទាំងពីរបញ្ចប់ដោយជោគជ័យ
- [ ] API នៅស្ថិតក្នុងសភាពដំណើរការ; ការកែប្រែមតិយោបល់តែមួយគឺមិនមែនជាបម្លែង UI ច្បាស់ឡើយ
- [ ] អគារវិទ្យាសាស្ត្រមិនបានផ្លាស់ប្តួរតាំងពី `azd deploy`

**ផលប៉ះពាល់ការសិក្សា**: `azd deploy` មិនបញ្ចូលការផ្គត់ផ្គង់អគារវិទ្យាសាស្ត្រ។ ប្រៀបធៀបទ្រង់ទ្រាយពេលវេលាដែលបានវាស់ ត្រូវប្រៀបធៀបមិនត្រូវទុកចិត្តលើការល្បឿនបង្គួរដែលថេរ។

### លំហាត់ ២៖ Hook ដាក់បញ្ចូលស្វ័យប្រវត្តិកម្ម (៣០នាទី)
**គោលបំណង**: អនុវត្តស្វ័យប្រវត្តិការមុន និងបន្ទាប់ពីដាក់បញ្ចូល

**ចំណុចចាប់ផ្តើម:** គម្រោង `deployment-practice` ដែលបាន initialize ខាងលើ។ ប្រសិនបើអ្នកបានសំអាត វារត់ `azd up` ម្តងទៀតមុនពេលតេស្តការដាក់បញ្ចូលតែកូដ។ ការផ្ទៀងផ្ទាត់ខាងក្រោមប្រើ script សង់ API ពិតមួយ មិនមែន script `test:unit` មិនមានស្ថិត។ តេស្ត API ក្នុងគំរូត្រូវការចូលទៅមូលដ្ឋានទិន្នន័យដែលបានកំណត់; មិនមែនតេស្តឯកត្តា។

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

**លក្ខខណ្ឌជោគជ័យ:**
- [ ] script មុនដាក់បញ្ចូលរត់មុនការដាក់បញ្ចូល
- [ ] ដាក់បញ្ចូលបញ្ឈប់បើការផ្ទៀងផ្ទាត់សង់បរាជ័យ
- [ ] នេះបន្ទាប់ពីដាក់បញ្ចូល smoke test ផ្ទៀងផ្ទាត់សុខភាព
- [ ] Hooks រត់តាមលំដាប់ត្រឹមត្រូវ

### លំហាត់ ៣៖ យុទ្ធសាស្ត្រដាក់បញ្ចូលពហុបរិយាកាស (៤៥នាទី)
**គោលបំណង**: អនុវត្តវដ្តដាក់បញ្ចូលជាចំណុច (dev → staging → production)

**ចំណុចចាប់ផ្តើម៖** គម្រោង todo រួចរាល់ដូចគ្នាជាមួយ `jq`។ បង្កើតបរិយាកាសខាងក្រោមដោយមានតម្លៃការជាវ/ទីតាំងពិត (ឬកំណត់ `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` ក្នុងមួយមួយ) **មុន**ការហៅការងារដែលគ្មានការទាមទារ។ វាធ្វើឱ្យបរាជ័យដោយចេតនា ជាជាងបង្កើតតម្លៃខ្វះ។ ប្រើបរិយាកាសហ្វឹកហាត់ដែលអាចចោលបានតែប៉ុណ្ណោះ មិនមែនការជាវផលិតកម្មពិតទេ។

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

**គោលសំដៅជោគជ័យ៖**
- [ ] បរិយាកាស Dev ត្រូវបានផ្សព្វផ្សាយដោយជោគជ័យ
- [ ] បរិយាកាស Staging ត្រូវបានផ្សព្វផ្សាយដោយជោគជ័យ
- [ ] តម្រូវការការអនុម័តដោយដៃសម្រាប់ផលិតកម្ម
- [ ] បរិយាកាសទាំងអស់មានការត្រួតពិនិត្យសុខភាពដំណើរការ
- [ ] អាចត្រឡប់ក្រោយបានបើចាំបាច់

### លំហាត់ 4៖ យុទ្ធសាស្ត្រត្រឡប់ក្រោយ (25 នាទី)
**គោលដៅ៖** អនុវត្តន៍ និងសាកល្បងការត្រឡប់ក្រោយការផ្សព្វផ្សាយដោយប្រើ Git

**ចំណុចចាប់ផ្តើម៖** ការត្រួតពិនិត្យហ្វឹកហាត់ដែលត្រូវបានបំបែកនៃពាំនាំ todo ទាំងអស់ពីមូលដ្ឋានប្រភពបានបញ្ជូនទៅ, ធ្វើការងារ Git ស្អាត, និងបរិយាកាសកំណត់រចនាសម្ព័ន្ធដែលអាចចោលបាន។ មិនដែលណែនាំឱ្យមានការបរាជ័យដោយចេតនានៅក្នុងគម្រោងផលិតកម្មពិត។ `APP_VERSION` ខាងក្រោយគឺសម្រាប់កំណត់ហេតុបណ្ដោះអាសន្នទេ រហូតតែអ្នកភ្ជាប់វាចូលក្នុងកម្មវិធីយ៉ាងច្បាស់។

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

**គោលសំដៅជោគជ័យ៖**
- [ ] អាចរកឃើញការបរាជ័យការផ្សព្វផ្សាយ
- [ ] ស្គ្រីបត្រឡប់ក្រោយអនុវត្តដោយស្វ័យប្រវត្តិ
- [ ] កម្មវិធីត្រឡប់ទៅស្ថានភាពដំណើរការឡើងវិញ
- [ ] ការត្រួតពិនិត្យសុខភាពជាប់ខ្នងបន្ទាប់ពីត្រឡប់ក្រោយ

## 📊 ការតាមដានមេតូណកីឡាផ្សព្វផ្សាយ

### តាមដានប្រសិទ្ធភាពការផ្សព្វផ្សាយរបស់អ្នក

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

**វិភាគមេតូណិចរបស់អ្នក៖**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## ប្រាក់ចំណេញបន្ថែម

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ការនាវិក**
- **មេរៀនមុន**៖ [គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **មេរៀនបន្ទាប់**៖ [ការផ្គត់ផ្គង់ធនធាន](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->