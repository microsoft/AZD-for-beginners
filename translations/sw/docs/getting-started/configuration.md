# Mwongozo wa Usanidi

**Ukurasa wa Sehemu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wanaoanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 3 - Usanidi & Uthibitishaji
- **⬅️ Iliyopita**: [Mradi Wako wa Kwanza](first-project.md)
- **➡️ Inayofuata**: [Mwongozo wa Uwekaji](../deployment/deployment-guide.md)
- **🚀 Sura Inayofuata**: [Sura ya 4: Miundombinu kama Nambari](../deployment/deployment-guide.md)

## Utangulizi

Mwongozo huu wa kina unashughulikia vipengele vyote vya kusanidi Azure Developer CLI kwa ajili ya kazi bora za maendeleo na uwekaji. Utajifunza kuhusu mfumo wa usanidi, usimamizi wa mazingira, mbinu za uthibitishaji, na mifumo ya usanidi ya hali ya juu inayowezesha uwekaji salama na bora wa Azure.

## Malengo ya Kujifunza

Mwisho wa somo hili, utaweza:
- Kuelewa mfumo wa usanidi wa azd na jinsi mipangilio inavyopangiliwa
- Kusimamia mipangilio ya kimataifa na ya mradi kwa ufanisi
- Kusimamia mazingira mengi yenye usanidi tofauti
- Kutekeleza mifumo salama ya uthibitishaji na idhini
- Kuelewa mifumo ya usanidi ya hali ya juu kwa hali ngumu

## Matokeo ya Kujifunza

Baada ya kukamilisha somo hili, utaweza:
- Kusanidi azd kwa kazi bora za maendeleo
- Kuweka na kusimamia mazingira mengi ya uwekaji
- Kutekeleza mazoea salama ya usimamizi wa usanidi
- Kutatua masuala yanayohusiana na usanidi
- Kubinafsisha tabia ya azd kwa mahitaji maalum ya shirika

Mwongozo huu wa kina unashughulikia vipengele vyote vya kusanidi Azure Developer CLI kwa ajili ya kazi bora za maendeleo na uwekaji.

## Mfumo wa Usanidi

azd hutumia mfumo wa usanidi wa kihierarkia:
1. **Bendera za mstari wa amri** (kipaumbele cha juu zaidi)
2. **Vigezo vya mazingira**
3. **Usanidi wa mradi wa ndani** (`.azd/config.json`)
4. **Usanidi wa mtumiaji wa kimataifa** (`~/.azd/config.json`)
5. **Thamani za msingi** (kipaumbele cha chini zaidi)

## Usanidi wa Kimataifa

### Kuweka Mipangilio ya Kimataifa
```bash
# Weka usajili wa chaguo-msingi
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Weka eneo la chaguo-msingi
azd config set defaults.location "eastus2"

# Weka kanuni ya kutaja kikundi cha rasilimali cha chaguo-msingi
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Tazama usanidi wote wa kimataifa
azd config list

# Ondoa usanidi
azd config unset defaults.location
```

### Mipangilio ya Kawaida ya Kimataifa
```bash
# Mapendeleo ya maendeleo
azd config set alpha.enable true                    # Washa vipengele vya alpha
azd config set telemetry.enabled false             # Zima telemetry
azd config set output.format json                  # Weka muundo wa matokeo

# Mipangilio ya usalama
azd config set auth.useAzureCliCredential true     # Tumia Azure CLI kwa uthibitisho
azd config set tls.insecure false                  # Lazimisha uthibitishaji wa TLS

# Marekebisho ya utendaji
azd config set provision.parallelism 5             # Uundaji wa rasilimali kwa sambamba
azd config set deploy.timeout 30m                  # Muda wa kusubiri wa upelekaji
```

## 🏗️ Usanidi wa Mradi

### Muundo wa azure.yaml
Faili ya `azure.yaml` ni msingi wa mradi wako wa azd:

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

#### Mipangilio Maalum ya Lugha
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
# API_KEY=siri-api-key
# DEBUG=true

# Ondoa kigezo cha mazingira
azd env unset DEBUG

# Thibitisha kuondolewa
azd env get-values | grep DEBUG
# (inapaswa kurudi bila kitu)
```

### Violezo vya Mazingira
Unda `.azure/env.template` kwa usanidi thabiti wa mazingira:
```bash
# Vigezo vinavyohitajika
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Mipangilio ya programu
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Mipangilio ya hiari ya maendeleo
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Usanidi wa Uthibitishaji

### Muunganisho wa Azure CLI
```bash
# Tumia hati za Azure CLI (chaguo-msingi)
azd config set auth.useAzureCliCredential true

# Ingia na mpangaji maalum
az login --tenant <tenant-id>

# Weka usajili wa chaguo-msingi
az account set --subscription <subscription-id>
```

### Uthibitishaji wa Service Principal
Kwa njia za CI/CD:
```bash
# Weka vigezo vya mazingira
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Au sanidi moja kwa moja
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Utambulisho Uliofanywa
Kwa mazingira yanayohifadhiwa na Azure:
```bash
# Washa uthibitishaji wa utambulisho unaosimamiwa
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

## 🚀 Usanidi wa Uwekaji

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

## 🔧 Usanidi wa Hali ya Juu

### Uwekaji Jina wa Rasilimali Maalum
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

## 🎯 Usanidi Maalum wa Mazingira

### Mazingira ya Maendeleo
```bash
# .azure/maendeleo/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Mazingira ya Jaribio
```bash
# .azure/staging/.mazingira
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

### Hati za Usanidi
Unda hati za uthibitishaji katika `scripts/`:

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

## 🎓 Mazoea Bora

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

### 3. Mazingatio ya Udhibiti wa Toleo
```bash
# .gitignore
.azure/*/config.json         # Usanidi wa mazingira (una vitambulisho vya rasilimali)
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

### Zoezi 1: Usanidi wa Mazingira Mengi (Dakika 15)

**Lengo**: Unda na usanidi mazingira matatu yenye mipangilio tofauti

```bash
# Unda mazingira ya maendeleo
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Unda mazingira ya majaribio
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
- [ ] Unaweza kubadilisha kati ya mazingira bila makosa
- [ ] `azd env list` inaonyesha mazingira yote matatu

### Zoezi 2: Usimamizi wa Siri (Dakika 10)

**Lengo**: Fanya mazoezi ya usanidi salama na data nyeti

```bash
# Weka siri (hazionyeshwi kwenye matokeo)
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
- [ ] `azd env get <SECRET_NAME>` inapata thamani halisi

## Hatua Zifuatazo

- [Mradi Wako wa Kwanza](first-project.md) - Tumia usanidi kwa vitendo
- [Mwongozo wa Uwekaji](../deployment/deployment-guide.md) - Tumia usanidi kwa uwekaji
- [Utoaji wa Rasilimali](../deployment/provisioning.md) - Usanidi tayari kwa uzalishaji

## Marejeleo

- [Rejea ya Usanidi wa azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Muundo wa azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Vigezo vya Mazingira](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Ukurasa wa Sehemu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wanaoanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 3 - Usanidi & Uthibitishaji
- **⬅️ Iliyopita**: [Mradi Wako wa Kwanza](first-project.md)
- **➡️ Sura Inayofuata**: [Sura ya 4: Miundombinu kama Nambari](../deployment/deployment-guide.md)
- **Somo Linalofuata**: [Mradi Wako wa Kwanza](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->