# Konfiguratsioonijuht

**Peatüki navigatsioon:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 3 - Konfiguratsioon ja autentimine
- **⬅️ Eelmine**: [Teie esimene projekt](first-project.md)
- **➡️ Järgmine**: [Käivitamise juhend](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Järgmine peatükk**: [Peatükk 4: Infrastruktuur koodina](../chapter-04-infrastructure/deployment-guide.md)

## Sissejuhatus

See põhjalik juhend käsitleb kõiki Azure Developer CLI optimaalse arendus- ja juurutustöövoo konfiguratsiooni aspekte. Õpite konfiguratsioonihierarhiat, keskkonna haldust, autentimismeetodeid ja arenenud konfiguratsioonimustreid, mis võimaldavad tõhusaid ja turvalisi Azure'i juurutusi.

## Õpieesmärgid

Selle tunni lõpuks:
- Valdate azd konfiguratsioonihierarhiat ja mõistate, kuidas seadeid prioritiseeritakse
- Konfigureerite globaalseid ja projekti-spetsiifilisi seadeid tõhusalt
- Haldate mitut erineva konfiguratsiooniga keskkonda
- Rakendate turvalisi autentimise ja autoriseerimise mustreid
- Mõistate keerukate stsenaariumide arenenud konfiguratsioonimustreid

## Õpitulemused

Pärast selle tunni läbimist saate:
- Konfigureerida azd optimaalseks arendustöövoogudeks
- Seada üles ja hallata mitut juurutuskeskkonda
- Rakendada turvalisi konfiguratsioonihalduspraktikaid
- Lahendada konfiguratsiooniga seotud probleeme
- Kohandada azd käitumist konkreetsete organisatsiooninõuete jaoks

See põhjalik juhend käsitleb kõiki Azure Developer CLI optimaalse arendus- ja juurutustöövoo konfiguratsiooni aspekte.

## AI agentide mõistmine azd projektis

Kui AI agentide kontseptsioon on teile uus, siis siin on lihtne viis nende mõistmiseks azd maailmas.

### Mis on agent?

Agent on tarkvarakomponent, mis saab päringu, analüüsib seda ja võtab meetmeid — sageli kutsudes AI mudelit, otsides andmeid või kasutades muid teenuseid. Azd projektis on agent lihtsalt üks **teenus** naast oma veebiliidese või API-tagaosa teenuse kõrval.

### Kuidas agent sobitub azd projekti struktuuri

Azd projekt koosneb kolmest kihist: **infrastruktuur**, **kood** ja **konfiguratsioon**. Agendid ühenduvad nendesse kihtidesse nagu iga teine teenus:

| Kiht | Traditsioonilise rakenduse roll | Agendi roll |
|-------|-------------------------------------|---------------------------|
| **Infrastruktuur** (`infra/`) | Veebirakenduse ja andmebaasi propageerimine | AI mudeli lõpp-punkti, otsinguindeksi või agendi hosti propageerimine |
| **Kood** (`src/`) | Teie frontend'i ja API lähtekood | Teie agendi loogika ja promptide määratlused |
| **Konfiguratsioon** (`azure.yaml`) | Teenuste ja nende majutamise sihtkohtade loetelu | Agent teenusena koos koodi ja hosti näitamisega |

### `azure.yaml` roll

Teil ei ole vaja süntaksit praegu pähe õppida. Kontseptuaalselt on `azure.yaml` fail, kuhu ütlete azd-le: *„Siin on minu rakenduse moodustavad teenused ja kus nende kood paikneb.“*

Kui teie projekt sisaldab AI agenti, loetleb `azure.yaml` selle lihtsalt teenuste hulgas. Seejärel teab azd, millist infrastruktuuri luua (näiteks Microsoft Foundry Models lõpp-punkt või Container App agendi majutamiseks) ja juurutada teie agendi kood — täpselt nagu veebirakenduse või API puhul.

See tähendab, et sisuliselt pole midagi uut õppida. Kui mõistate, kuidas azd haldab veebiteenust, mõistate ka, kuidas ta haldab agenti.

## Konfiguratsioonihierarhia

azd kasutab hierarhilist konfiguratsioonisüsteemi:
1. **Käsurea lipud** (kõrgeim prioriteet)
2. **Keskkonnamuutujad**
3. **Paikne projekti konfiguratsioon** (`.azd/config.json`)
4. **Globaalne kasutaja konfiguratsioon** (`~/.azd/config.json`)
5. **Vaikimisi väärtused** (madalaim prioriteet)

## Globaalne konfiguratsioon

### Globaalse vaikeseadete määramine
```bash
# Määra vaikimisi tellimus
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Määra vaikimisi asukoht
azd config set defaults.location "eastus2"

# Määra vaikimisi ressursirühma nimetamise konventsioon
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Vaata kogu globaalset konfiguratsiooni
azd config show

# Eemalda konfiguratsioon
azd config unset defaults.location
```

### Üldised globaalsed seaded
```bash
# Arenduse eelistused
azd config set alpha.enable true                    # Luba alfa funktsioonid
azd config set telemetry.enabled false             # Keela telemeetria
azd config set output.format json                  # Sea väljundi formaat

# Turvaseaded
azd config set auth.useAzureCliCredential true     # Kasuta Azure CLI autentimiseks
azd config set tls.insecure false                  # Nõua TLS kontrolli

# Jõudluse häälestamine
azd config set provision.parallelism 5             # Resursside paralleelne loomine
azd config set deploy.timeout 30m                  # Deploymendi ajalõpp
```

## 🏗️ Projekti konfiguratsioon

### azure.yaml struktuur
`azure.yaml` fail on teie azd projekti süda:

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

### Teenuse konfiguratsioonivõimalused

#### Host tüübid
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

#### Keele-spetsiifilised seaded
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

## 🌟 Keskkonna haldus

### Keskkondade loomine
```bash
# Loo uus keskkond
azd env new development

# Loo kindla asukohaga
azd env new staging --location "westus2"

# Loo mallist
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Keskkonna konfiguratsioon
Igal keskkonnal on oma konfiguratsioon failis `.azure/<env-name>/config.json`:

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

### Keskkonna muutujad
```bash
# Määra keskkonnaspetsiifilised muutujad
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Vaata keskkonnamuutujaid
azd env get-values

# Oodatud väljund:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=salajane-api-võti
# DEBUG=jah

# Eemalda keskkonnamuutuja
azd env unset DEBUG

# Kontrolli eemaldamist
azd env get-values | grep DEBUG
# (ei tohiks midagi tagastada)
```

### Keskkonna mallid
Looge `.azure/env.template` ühtlase keskkonnaseadistuse jaoks:
```bash
# Nõutavad muutujad
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Rakenduse seaded
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Valikulised arendusseaded
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Autentimise konfiguratsioon

### Azure CLI integratsioon
```bash
# Kasuta Azure CLI volitusi (vaikimisi)
azd config set auth.useAzureCliCredential true

# Logi sisse kindla üürniku alt
az login --tenant <tenant-id>

# Sea vaikimisi tellimus
az account set --subscription <subscription-id>
```

### Teenuskontoga autentimine
CI/CD torujuhtmete jaoks:
```bash
# Määra keskkonnamuutujad
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Või seadista otse
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Hallatav identiteet
Azure'i majutatud keskkondade jaoks:
```bash
# Luba hallatud identiteedi autentimine
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktuuri konfiguratsioon

### Bicepi parameetrid
Seadistage infrastruktuuri parameetrid failis `infra/main.parameters.json`:
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

### Terraform konfiguratsioon
Terraform projektide jaoks seadistage `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Juurutamise konfiguratsioon

### Koostamise konfiguratsioon
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

### Docker konfiguratsioon
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
Näidis `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Arendatud konfiguratsioon

### Kohandatud ressursinimede määramine
```bash
# Määra nimetamisstandardsused
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Võrgu konfiguratsioon
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Jälgimise konfiguratsioon
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

## 🎯 Keskkonnapõhised konfiguratsioonid

### Arenduskeskkond
```bash
# .azure/arendus/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Eelprodutsentsikeskkond
```bash
# .azure/ajutine/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Tootmiskeskkond
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfiguratsiooni valideerimine

### Konfiguratsiooni valideerimine
```bash
# Kontrolli konfiguratsiooni süntaksit
azd config validate

# Testi keskkonnamuutujaid
azd env get-values

# Kontrolli infrastruktuuri kehtivust
azd provision --dry-run
```

### Konfiguratsiooni skriptid
Looge valideerimisskriptid kataloogis `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Kontrolli nõutud keskkonnamuutujaid
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Kontrolli azure.yaml sünaksit
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Parimad praktikad

### 1. Kasutage keskkonnamuutujaid
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Korraldage konfiguratsioonifailid
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

### 3. Versioonikontrolli kaalutlused
```bash
# .gitignore
.azure/*/config.json         # Keskkonna konfiguratsioonid (sisaldavad ressursi ID-sid)
.azure/*/.env               # Keskkonna muutujad (võivad sisaldada salasõnu)
.env                        # Kohalik keskkonna fail
```

### 4. Konfiguratsiooni dokumentatsioon
Dokumenteerige oma konfiguratsioon failis `CONFIG.md`:
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

## 🎯 Praktilised harjutused

### Harjutus 1: Mitmekeskkonnaline konfiguratsioon (15 minutit)

**Eesmärk**: Loo ja konfigureeri kolm erineva seadistusega keskkonda

```bash
# Loo arendus keskkond
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Loo staging keskkond
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Loo tootmiskeskkond
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Kontrolli iga keskkonda
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Edukuse kriteeriumid:**
- [ ] Loodi edukalt kolm keskkonda
- [ ] Igal keskkonnal on eraldiseisev konfiguratsioon
- [ ] Võimalus keskkondade vahel vigadeta vahetada
- [ ] `azd env list` kuvab kõik kolm keskkonda

### Harjutus 2: Saladuste haldamine (10 minutit)

**Eesmärk**: Harjuta turvalist konfiguratsiooni tundliku andmete haldamisega

```bash
# Määra saladused (tulemustes ei kuvata)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Määra mitte-saladus konfiguratsioon
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Vaata keskkonda (saladusi tuleks varjata)
azd env get-values

# Kontrolli, et saladused on salvestatud
azd env get DB_PASSWORD  # Peaks näitama tegelikku väärtust
```

**Edukuse kriteeriumid:**
- [ ] Saladused salvestati ilma terminalis kuvamata
- [ ] `azd env get-values` kuvab tsenseeritud saladusi
- [ ] Individuaalne `azd env get <SECRET_NAME>` tagastab reaalse väärtuse

## Järgmised sammud

- [Teie esimene projekt](first-project.md) - Rakenda konfiguratsiooni praktikas
- [Käivitamise juhend](../chapter-04-infrastructure/deployment-guide.md) - Kasuta konfiguratsiooni juurutamiseks
- [Ressursside valmis seadmine](../chapter-04-infrastructure/provisioning.md) - Tootmiskõlblikud konfiguratsioonid

## Viited

- [azd konfiguratsiooni viide](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml skeem](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Keskkonnamuutujad](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Peatüki navigatsioon:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 3 - Konfiguratsioon ja autentimine
- **⬅️ Eelmine**: [Teie esimene projekt](first-project.md)
- **➡️ Järgmine peatükk**: [Peatükk 4: Infrastruktuur koodina](../chapter-04-infrastructure/deployment-guide.md)
- **Järgmine õppetund**: [Teie esimene projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame täpsust, palun pidage meeles, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada usaldusväärseks allikaks. Kriitilise teabe puhul soovitatakse professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tekkida võivate arusaamatuste või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->