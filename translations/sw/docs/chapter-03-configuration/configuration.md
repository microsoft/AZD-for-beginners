# Mwongozo wa Usanidi

**Chapter Navigation:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 3 - Usanidi & Uthibitishaji
- **⬅️ Iliyotangulia**: [Mradi Wako wa Kwanza](first-project.md)
- **➡️ Ifuatayo**: [Mwongozo wa Utekelezaji](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Sura Ifuatayo**: [Sura 4: Miundombinu kama Msimbo](../chapter-04-infrastructure/deployment-guide.md)

## Utangulizi

Mwongozo huu kamili unafunika nyanja zote za kusanidi Azure Developer CLI kwa mtiririko bora wa maendeleo na utekelezaji. Utajifunza kuhusu hierarchy ya usanidi, usimamizi wa mazingira, mbinu za uthibitishaji, na mifumo ya usanidi wa juu inayowezesha utekelezaji wa Azure kwa ufanisi na usalama.

## Malengo ya Kujifunza

Mwisho wa somo hili, utakuwa umeweza:
- Kumiliki hierarchy ya usanidi ya azd na kuelewa jinsi mipangilio inavyopangiwa kwa kipaumbele
- Kusanidi mipangilio ya kimataifa na maalum kwa mradi kwa ufanisi
- Kusimamia mazingira mengi yenye mipangilio tofauti
- Kutekeleza mifumo salama ya uthibitishaji na idhini
- Kuelewa mifumo ya usanidi ya juu kwa senario tata

## Matokeo ya Kujifunza

Baada ya kukamilisha somo hili, utaweza:
- Kusanidi azd kwa mtiririko bora wa maendeleo
- Kuanzisha na kusimamia mazingira mengi ya utekelezaji
- Kutekeleza mbinu salama za usimamizi wa usanidi
- Kutatua matatizo yanayohusiana na usanidi
- Kubadilisha tabia ya azd kwa mahitaji maalum ya shirika

Mwongozo huu kamili unafunika nyanja zote za kusanidi Azure Developer CLI kwa mtiririko bora wa maendeleo na utekelezaji.

## Kuelewa Wakala wa AI katika Mradi wa azd

Ikiwa wewe ni mpya kwa wakala wa AI, hapa kuna njia rahisi ya kuwaza juu yao ndani ya ulimwengu wa azd.

### Wakala ni Nini?

Wakala ni kipande cha programu kinachoweza kupokea ombi, kukisia juu yake, na kuchukua hatua—mara nyingi kwa kumpigia modeli ya AI, kutafuta data, au kuita huduma nyingine. Katika mradi wa azd, wakala ni huduma nyingine tu ya **huduma** sambamba na mbele ya wavuti yako au backend ya API.

### Wakala Jinsi Unavyofaa Kwenye Muundo wa Mradi wa azd

Mradi wa azd unaundwa na tabaka tatu: **miundombinu**, **msimbo**, na **usanidi**. Wakala huingizwa katika tabaka hizi kwa njia sawa na huduma nyingine yoyote:

| Layer | Inafanya Nini kwa Programu ya Kawaida | Inafanya Nini kwa Wakala |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Hutoa programu ya wavuti na hifadhidata | Hutoa kiunganishi cha mfano wa AI, faharasa ya utafutaji, au mwenyeji wa wakala |
| **Code** (`src/`) | Ina msimbo wa mbele na wa API | Ina mantiki ya wakala yako na ufafanuzi wa prompt |
| **Configuration** (`azure.yaml`) | Inaorodhesha huduma zako na maeneo yao ya kuhosting | Inaorodhesha wakala wako kama huduma, ikielekeza kwenye msimbo wake na mwenyeji wake |

### Nafasi ya `azure.yaml`

Hauhitaji kukumbuka sintaksia sasa hivi. Kimsingi, `azure.yaml` ni faili unayomwambia azd: *"Hapa kuna huduma zinazounda programu yangu, na hapa ndiko kutafuta msimbo wao."*

Wakati mradi wako unajumuisha wakala wa AI, `azure.yaml` inaorodhesha tu wakala huo kama moja ya huduma. azd kisha inajua kuandaa miundombinu sahihi (kama Microsoft Foundry Models endpoint au Container App ku-host wakala) na kutekeleza msimbo wa wakala wako—kama ilivyofanya kwa programu ya wavuti au API.

Hii ina maana hakuna kitu kipya kabisa cha kujifunza. Ukiwa unaelewa jinsi azd inavyosimamia huduma ya wavuti, tayari unaelewa jinsi inavyosimamia wakala.

## Hierarchy ya Usanidi

azd inatumia mfumo wa hierarchy wa usanidi:
1. **Bendera za mstari wa amri** (kipaumbele cha juu zaidi)
2. **Vigezo vya mazingira**
3. **Usanidi wa mradi wa ndani** (`.azd/config.json`)
4. **Usanidi wa mtumiaji wa kimataifa** (`~/.azd/config.json`)
5. **Thamani za chaguo-msingi** (kipaumbele cha chini kabisa)

## Usanidi wa Kimataifa

### Ku setting Thamani za Kimataifa
```bash
# Weka usajili wa chaguo-msingi
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Weka eneo la chaguo-msingi
azd config set defaults.location "eastus2"

# Weka kanuni ya kuteua majina ya kikundi cha rasilimali cha chaguo-msingi
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Tazama usanidi wote wa kimataifa
azd config show

# Ondoa usanidi
azd config unset defaults.location
```

### Mipangilio ya Kimataifa ya Kawaida
```bash
# Mapendeleo ya ukuzaji
azd config set alpha.enable true                    # Washa vipengele vya alfa
azd config set telemetry.enabled false             # Zima telemetria
azd config set output.format json                  # Weka muundo wa pato

# Mipangilio ya usalama
azd config set auth.useAzureCliCredential true     # Tumia Azure CLI kwa uthibitishaji
azd config set tls.insecure false                  # Lazimisha uhakiki wa TLS

# Uboreshaji wa utendaji
azd config set provision.parallelism 5             # Uundaji wa rasilimali kwa sambamba
azd config set deploy.timeout 30m                  # Muda wa kusubiri wa uanzishaji
```

## 🏗️ Usanidi wa Mradi

### Muundo wa azure.yaml
Faili ya `azure.yaml` ni moyo wa mradi wako wa azd:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### Chaguzi za Usanidi wa Huduma

#### Aina za Mwenyeji
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Mipangilio Maalumu kwa Lugha
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Usimamizi wa Mazingira

### Kuunda Mazingira
```bash
# Unda mazingira mapya
azd env new development

# Unda na eneo maalum
azd env new staging --location "westus2"

# Unda kutoka kwa kiolezo
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Usanidi wa Mazingira
Kila mazingira yana usanidi wake ndani ya `.azure/<env-name>/config.json`:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Vigezo vya Mazingira
```bash
# Weka vigezo maalum vya mazingira
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Tazama vigezo vya mazingira
azd env get-values

# Matokeo yanayotarajiwa:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Ondoa kigezo cha mazingira
azd env unset DEBUG

# Thibitisha uondoaji
azd env get-values | grep DEBUG
# (haipaswi kurudisha chochote)
```

### Violezo vya Mazingira
Unda `.azure/env.template` kwa upangaji thabiti wa mazingira:
```bash
# Vigezo vinavyohitajika
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Mipangilio ya programu
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Mipangilio hiari ya maendeleo
DEBUG=false
LOG_LEVEL=info
```

### Kushirikiana Mazingira Kati ya Timu

Wakati watu zaidi ya mmoja wanafanya kazi kwenye mradi, mnahitaji kukubaliana juu ya **nini kinachofuatana na repo na nini kinabaki ndani ya mahali**. azd inaweka kila mazingira chini ya folda `.azure/`, na si sehemu yote inapaswa kupelekwa kwenye git.

**Nini kiko ndani ya `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Nini cha kuweka katika .gitignore.** `.gitignore` ya chaguo-msingi ya azd tayari inatoa `.azure/`. Wauike hivyo—faili za `.env` zinaweza kuwa na siri, na vitambulisho vya rasilimali ni maalum kwa mtu aliyewaandaa. Kila mshikamano wa timu anaunda mazingira yao **binafsi** ndani ya kompyuta yao:

```bash
# Kila mwanendelezaji anaendesha hili mara moja ili kupata mazingira yake yaliyotengwa
azd env new dev-alice
azd up
```

**Kubadilisha kati ya mazingira.** Mendeja anayeendesha mazingira kadhaa huchagua ile inayofanya kazi kabla ya kuendesha amri:

```bash
azd env list                 # ona mazingira yote ya ndani na ni ipi chaguo-msingi
azd env select staging       # fanya 'staging' iwe mazingira yanayotumika
azd env get-values           # thibitisha umeelekezwa kwa ile sahihi
```

**Kutoa chaguo-msingi bila siri kwa timu.** Tumia commit ya kiolezo (kama `.azure/env.template` hapo juu) ili kila mtu ajue vigezo gani ya kuweka—lakini usiwahi kucommit thamani zilizojazwa. Wafanyakazi wapya wanakopi kiolezo na kujaza wao wenyewe.

**Mazingira kwenye CI/CD.** Mifumoni ya pipeline haisomei folda yako ya ndani `.azure/`. Badala yake, toa thamani za mazingira kama vigezo/siri za pipeline, na azd inazisoma kutoka kwenye mazingira ya mchakato:

```bash
# Katika CI, azd husoma hizi kutoka kwa mazingira, sio kutoka kwa .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Kanuni ya kuchukua tahadhari:** msimbo wa miundombinu (`infra/`, `azure.yaml`) unashirikiwa kwenye Git; *hali ya mazingira na siri* (`.azure/`) ni za kila msanidi na kwa kila pipeline. `azd pipeline config` inaunda vigezo vya pipeline kwa ajili yako kiotomatiki.

## 🔐 Usanidi wa Uthibitishaji

### Uunganisho wa Azure CLI
```bash
# Tumia vyeti vya Azure CLI (chaguo-msingi)
azd config set auth.useAzureCliCredential true

# Ingia kwa mpangaji maalum
az login --tenant <tenant-id>

# Weka usajili wa chaguo-msingi
az account set --subscription <subscription-id>
```

### Uthibitishaji wa Service Principal
Kwa pipelines za CI/CD:
```bash
# Weka vigezo vya mazingira
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Au sanidi moja kwa moja
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Kitambulisho Kilichosimamiwa
Kwa mazingira yaliyohostwa Azure:
```bash
# Wezesha uthibitishaji wa utambulisho uliosimamiwa
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Usanidi wa Miundombinu

### Vigezo za Bicep
Sananisha vigezo vya miundombinu katika `infra/main.parameters.json`:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Usanidi wa Terraform
Kwa miradi ya Terraform, sanidi katika `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Usanidi wa Utekelezaji

### Usanidi wa Ujenzi
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Usanidi wa Docker
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
        NODE_ENV: production
        API_VERSION: v1.0.0
```
Mfano wa `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Usanidi wa Juu

### Uteuzi wa Majina ya Rasilimali
```bash
# Weka kanuni za majina
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Usanidi wa Mtandao
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Usanidi wa Ufuatiliaji
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 Usanidi Maalum kwa Mazingira

### Mazingira ya Maendeleo
```bash
# .azure/maendeleo/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Mazingira ya Maandalizi (Staging)
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Mazingira ya Uzalishaji
```bash
# .azure/uzalishaji/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Uthibitisho wa Usanidi

### Thibitisha Usanidi
```bash
# Kagua sintaksia ya usanidi
azd config validate

# Jaribu vigezo vya mazingira
azd env get-values

# Thibitisha miundombinu
azd provision --dry-run
```

### Skripti za Usanidi
Unda skripti za uthibitisho ndani ya `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Angalia vigezo vya mazingira vinavyohitajika
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Thibitisha sintaksia ya azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Mbinu Bora

### 1. Tumia Vigezo vya Mazingira
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Panga Faili za Usanidi
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Mambo ya Kuzingatia katika Udhibiti wa Toleo
```bash
# .gitignore
.azure/*/config.json         # Usanidi wa mazingira (zina vitambulisho vya rasilimali)
.azure/*/.env               # Vigezo vya mazingira (zinaweza kuwa na siri)
.env                        # Faili la mazingira ya ndani
```

### 4. Nyarisha Usanidi
Sanihisha usanidi wako katika `CONFIG.md`:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 Mazoezi ya Vitendo

### Zoezi 1: Usanidi wa Mazingira Nyingi (dakika 15)

**Lengo**: Unda na usanidi mazingira matatu yenye mipangilio tofauti

```bash
# Unda mazingira ya maendeleo
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Unda mazingira ya kabla ya uzalishaji
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Unda mazingira ya uzalishaji
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Thibitisha kila mazingira
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira matatu yameundwa kwa mafanikio
- [ ] Kila mazingira yana usanidi wa kipekee
- [ ] Inawezekana kubadilisha kati ya mazingira bila makosa
- [ ] `azd env list` inaonyesha mazingira yote matatu

### Zoezi 2: Usimamizi wa Siri (dakika 10)

**Lengo**: Fanya mazoezi ya usanidi salama kwa data nyeti

```bash
# Weka siri (haionekani katika matokeo)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Weka usanidi usio wa siri
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Tazama mazingira (siri zinapaswa kufichwa)
azd env get-values

# Thibitisha siri zimehifadhiwa
azd env get DB_PASSWORD  # Inapaswa kuonyesha thamani halisi
```

**Vigezo vya Mafanikio:**
- [ ] Siri zimehifadhiwa bila kuonyeshwa kwenye terminal
- [ ] `azd env get-values` inaonyesha siri zilizofichwa
- [ ] `azd env get <SECRET_NAME>` ya mtu mmoja inapata thamani halisi

## Hatua Zifuatazo

- [Mradi Wako wa Kwanza](first-project.md) - Tumia usanidi kwa vitendo
- [Mwongozo wa Utekelezaji](../chapter-04-infrastructure/deployment-guide.md) - Tumia usanidi kwa utekelezaji
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Mipangilio ya uzalishaji

## Marejeleo

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 3 - Usanidi & Uthibitishaji
- **⬅️ Iliyotangulia**: [Mradi Wako wa Kwanza](first-project.md)
- **➡️ Sura Ifuatayo**: [Sura 4: Miundombinu kama Msimbo](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Mradi Wako wa Kwanza](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->