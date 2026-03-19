# Mwongozo wa Usanidi

**Chapter Navigation:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 3 - Usanidi & Uthibitishaji
- **⬅️ Iliyotangulia**: [Mradi Wako wa Kwanza](first-project.md)
- **➡️ Ifuatayo**: [Mwongozo wa Utekelezaji](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Sura Ifuatayo**: [Sura 4: Miundombinu kama Msimbo](../chapter-04-infrastructure/deployment-guide.md)

## Utangulizi

Mwongozo huu wa kina unashughulikia nyanja zote za kusanidi Azure Developer CLI kwa mtiririko mzuri wa maendeleo na utekelezaji. Utajifunza kuhusu hierarki ya usanidi, usimamizi wa mazingira, mbinu za uthibitishaji, na mifumo ya usanidi ya juu inayowezesha utekelezaji wa Azure kwa ufanisi na usalama.

## Malengo ya Kujifunza

Mwisho wa somo hili, utakuwa umeweza:
- Kumaster hierarki ya usanidi ya azd na kuelewa jinsi mipangilio inavyopangiwa kwa kipaumbele
- Kusanidi mipangilio ya kimataifa na maalum kwa mradi kwa ufanisi
- Kusimamia mazingira mengi yenye mipangilio tofauti
- Kutekeleza mbinu salama za uthibitishaji na idhini
- Kuelewa mifumo ya usanidi ya juu kwa matukio changamano

## Matokeo ya Kujifunza

Baada ya kumaliza somo hili, utaweza:
- Kusanidi azd kwa mtiririko mzuri wa maendeleo
- Kusanidi na kusimamia mazingira mengi ya utekelezaji
- Kutekeleza mbinu salama za usimamizi wa usanidi
- Kutatua masuala yanayohusiana na usanidi
- Kubinafsisha tabia ya azd kwa mahitaji maalum ya shirika

Mwongozo huu wa kina unashughulikia nyanja zote za kusanidi Azure Developer CLI kwa mtiririko mzuri wa maendeleo na utekelezaji.

## Kuelewa Mawakala wa AI katika Mradi wa azd

Ikiwa wewe ni mpya kwa mawakala wa AI, hapa kuna njia rahisi ya kuwafikiria ndani ya ulimwengu wa azd.

### Wakala ni Nini?

Wakala ni kipande cha programu kinachoweza kupokea ombi, kukisia juu yake, na kuchukua hatua—mara nyingi kwa kukamata mfano wa AI, kutafuta data, au kuitisha huduma nyingine. Katika mradi wa azd, wakala ni tu huduma nyingine **service** kando na frontend ya wavuti au backend ya API yako.

### Mawakala Wanavyofaa Katika Muundo wa Mradi wa azd

Mradi wa azd unaundwa kwa tabaka tatu: **infrastructure**, **code**, na **configuration**. Mawakala huingizwa katika tabaka hizi kwa namna ile ile huduma nyingine yoyote inavyofanya:

| Layer | Kile Inachofanya kwa Programu ya Kawaida | Kile Inachofanya kwa Wakala |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Huandaa web app na database | Huandaa endpoint ya Microsoft Foundry Models, index ya utafutaji, au mwenyeji wa wakala |
| **Code** (`src/`) | Inajumuisha msimbo wako wa frontend na API | Inajumuisha mantiki ya wakala wako na ufafanuzi wa prompt |
| **Configuration** (`azure.yaml`) | Inaorodhesha huduma zako na malengo yao ya kuhost | Inaorodhesha wakala wako kama huduma, ikielekeza kwenye msimbo wake na mwenyeji |

### Nafasi ya `azure.yaml`

Hauhitaji kukumbuka sintaksia sasa hivi. Kwa dhana, `azure.yaml` ni faili ambapo unaambia azd: *"Hizi ndizo huduma zinazounda programu yangu, na hapa ndipo pa kupata msimbo wao."*

Wakati mradi wako unajumuisha wakala wa AI, `azure.yaml` inamoorodhesha wakala huo tu kama moja ya huduma. azd basi inajua kuandaa miundombinu sahihi (kama Microsoft Foundry Models endpoint au Container App kuhosti wakala) na kupeleka msimbo wa wakala wako—kama ilivyofanya kwa web app au API.

Hii inamaanisha hakuna jambo jipya kabisa la kujifunza. Ikiwa unaelewa jinsi azd inavyosimamia huduma ya wavuti, tayari unaelewa jinsi inavyosimamia wakala.

## Hierarki ya Usanidi

azd inatumia mfumo wa usanidi wenye hierarki:
1. **Bendera za mstari wa amri** (kipaumbele cha juu)
2. **Variable za mazingira**
3. **Usanidi wa mradi wa ndani** (`.azd/config.json`)
4. **Usanidi wa mtumiaji wa kimataifa** (`~/.azd/config.json`)
5. **Thamani za msingi** (kipaumbele cha chini)

## Usanidi wa Kimataifa

### Setting Global Defaults
```bash
# Weka usajili wa chaguo-msingi
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Weka eneo la chaguo-msingi
azd config set defaults.location "eastus2"

# Weka kanuni ya majina ya kikundi cha rasilimali cha chaguo-msingi
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Onyesha usanidi wote wa kimataifa
azd config list

# Ondoa usanidi
azd config unset defaults.location
```

### Common Global Settings
```bash
# Mapendeleo ya ukuzaji
azd config set alpha.enable true                    # Washa vipengele vya alpha
azd config set telemetry.enabled false             # Zima telemetri
azd config set output.format json                  # Weka muundo wa pato

# Mipangilio ya usalama
azd config set auth.useAzureCliCredential true     # Tumia Azure CLI kwa uthibitisho
azd config set tls.insecure false                  # Lazimisha uhakiki wa TLS

# Uboreshaji wa utendaji
azd config set provision.parallelism 5             # Uundaji wa rasilimali sambamba
azd config set deploy.timeout 30m                  # Muda wa mwisho wa utekelezaji
```

## 🏗️ Usanidi wa Mradi

### Muundo wa `azure.yaml`
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

### Chaguo za Usanidi wa Huduma

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

#### Mipangilio Maalum kwa Lugha
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

# Unda kwa eneo maalum
azd env new staging --location "westus2"

# Unda kutoka kwa kiolezo
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Usanidi wa Mazingira
Kila mazingira yana usanidi wake katika `.azure/<env-name>/config.json`:

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

### Variable za Mazingira
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

# Thibitisha kuondolewa
azd env get-values | grep DEBUG
# (haipaswi kurudisha chochote)
```

### Violezo vya Mazingira
Tengeneza `.azure/env.template` kwa usanidi thabiti wa mazingira:
```bash
# Vibadilishaji vinavyohitajika
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Mipangilio ya programu
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Mipangilio ya maendeleo hiari
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Usanidi wa Uthibitishaji

### Uunganishaji wa Azure CLI
```bash
# Tumia taarifa za uthibitisho za Azure CLI (chaguo-msingi)
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

### Utambulisho Ulioendeshwa
Kwa mazingira yaliyohostiwa Azure:
```bash
# Wezesha uthibitishaji wa kitambulisho kilichosimamiwa
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Usanidi wa Miundombinu

### Vigezo vya Bicep
Sanidi vigezo vya miundombinu katika `infra/main.parameters.json`:
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
# Weka miongozo ya majina
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

### Mazingira ya Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Mazingira ya Uzalishaji
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Uthibitishaji wa Usanidi

### Thibitisha Usanidi
```bash
# Angalia sintaksia ya usanidi
azd config validate

# Jaribu vigezo vya mazingira
azd env get-values

# Thibitisha miundombinu
azd provision --dry-run
```

### Skripti za Usanidi
Tengeneza skripti za uthibitisho katika `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Kagua vigezo vya mazingira vinavyohitajika
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

### 1. Tumia Variable za Mazingira
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Panga Mafaili ya Usanidi
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

### 3. Mambo ya Kuzingatia kwenye Udhibiti wa Matoleo
```bash
# .gitignore
.azure/*/config.json         # Usanidi wa mazingira (zina vitambulisho vya rasilimali)
.azure/*/.env               # Vigezo vya mazingira (vinaweza kuwa na siri)
.env                        # Faili ya mazingira ya ndani
```

### 4. Nyaraka za Usanidi
Andika nyaraka za usanidi wako katika `CONFIG.md`:
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

### Zoëzi 1: Usanidi wa Mazingira Nyingi (15 minutes)

**Lengo**: Unda na usanidi mazingira matatu yenye mipangilio tofauti

```bash
# Unda mazingira ya maendeleo
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Unda mazingira ya maandalizi
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Unda mazingira ya uzalishaji
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Thibitisha kila moja ya mazingira
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira matatu yalioundwa kwa mafanikio
- [ ] Kila mazingira yana usanidi tofauti
- [ ] Inawezekana kubadilisha kati ya mazingira bila makosa
- [ ] `azd env list` inaonyesha mazingira yote matatu

### Zoëzi 2: Usimamizi wa Siri (10 minutes)

**Lengo**: Tumia usanidi salama kwa data nyeti

```bash
# Weka siri (hazionyeshwi katika pato)
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
- [ ] `azd env get-values` inaonyesha siri zilizosafishwa
- [ ] `azd env get <SECRET_NAME>` inairejesha thamani halisi

## Hatua Zifuatazo

- [Mradi Wako wa Kwanza](first-project.md) - Tumia usanidi vitendo
- [Mwongozo wa Utekelezaji](../chapter-04-infrastructure/deployment-guide.md) - Tumia usanidi kwa utekelezaji
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Usanidi tayari kwa uzalishaji

## Marejeo

- [Marejeo ya Usanidi wa azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Muundo wa azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variable za Mazingira](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 3 - Usanidi & Uthibitishaji
- **⬅️ Iliyotangulia**: [Mradi Wako wa Kwanza](first-project.md)
- **➡️ Sura Ifuatayo**: [Sura 4: Miundombinu kama Msimbo](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Mradi Wako wa Kwanza](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kukanusha**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokamilika. Nyaraka ya awali katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya kitaalamu ya kibinadamu. Hatuwajibiki kwa mwelewa mbaya au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->