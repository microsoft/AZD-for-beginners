# Konfiguratsiooni Juhend

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 3 - Konfiguratsioon ja autentimine
- **⬅️ Eelmine**: [Sinu esimene projekt](first-project.md)
- **➡️ Järgmine**: [Paigaldusjuhend](../deployment/deployment-guide.md)
- **🚀 Järgmine peatükk**: [Peatükk 4: Infrastruktuur kui kood](../deployment/deployment-guide.md)

## Sissejuhatus

See põhjalik juhend hõlmab kõiki Azure Developer CLI seadistamise aspekte, et tagada optimaalne arendus- ja paigaldusvoog. Õpid konfiguratsioonihierarhiat, keskkondade haldamist, autentimismeetodeid ja edasijõudnud konfiguratsioonimustreid, mis võimaldavad tõhusat ja turvalist Azure'i kasutuselevõttu.

## Õpieesmärgid

Selle õppetunni lõpuks:
- Omandad azd konfiguratsioonihierarhia ja mõistad, kuidas seadeid prioritiseeritakse
- Seadistad globaalsed ja projektipõhised sätted tõhusalt
- Halda mitut keskkonda erinevate konfiguratsioonidega
- Rakenda turvalisi autentimis- ja autoriseerimismustreid
- Mõista keerukate stsenaariumide edasijõudnud konfiguratsioonimustreid

## Õpitulemused

Pärast selle õppetunni läbimist suudad:
- Seadistada azd optimaalseks arendusvoogude jaoks
- Luua ja hallata mitut paigalduskeskkonda
- Rakendada turvalisi konfiguratsioonihaldustavasid
- Lahendada konfiguratsiooniga seotud probleeme
- Kohandada azd käitumist vastavalt organisatsiooni vajadustele

See põhjalik juhend hõlmab kõiki Azure Developer CLI seadistamise aspekte, et tagada optimaalne arendus- ja paigaldusvoog.

## Konfiguratsioonihierarhia

azd kasutab hierarhilist konfiguratsioonisüsteemi:
1. **Käsurea lipud** (kõrgeim prioriteet)
2. **Keskkonnamuutujad**
3. **Kohalik projekti konfiguratsioon** (`.azd/config.json`)
4. **Globaalne kasutaja konfiguratsioon** (`~/.azd/config.json`)
5. **Vaikeväärtused** (madalaim prioriteet)

## Globaalne konfiguratsioon

### Globaalsete vaikeseadete määramine
```bash
# Määra vaikimisi tellimus
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Määra vaikimisi asukoht
azd config set defaults.location "eastus2"

# Määra vaikimisi ressursigrupi nimetamise konventsioon
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Vaata kõiki globaalseid konfiguratsioone
azd config list

# Eemalda konfiguratsioon
azd config unset defaults.location
```

### Levinud globaalsed sätted
```bash
# Arenduseelistused
azd config set alpha.enable true                    # Luba alfa funktsioonid
azd config set telemetry.enabled false             # Keela telemeetria
azd config set output.format json                  # Määra väljundi formaat

# Turvaseaded
azd config set auth.useAzureCliCredential true     # Kasuta Azure CLI-d autentimiseks
azd config set tls.insecure false                  # Kehtesta TLS-i verifitseerimine

# Jõudluse häälestamine
azd config set provision.parallelism 5             # Ressursside paralleelne loomine
azd config set deploy.timeout 30m                  # Paigaldamise ajalõpp
```

## 🏗️ Projekti konfiguratsioon

### azure.yaml struktuur
`azure.yaml` fail on sinu azd projekti süda:

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

### Teenuse konfiguratsioonivalikud

#### Hosti tüübid
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

#### Keelespetsiifilised sätted
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

## 🌟 Keskkondade haldamine

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
Igal keskkonnal on oma konfiguratsioon `.azure/<env-name>/config.json` failis:

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

### Keskkonnamuutujad
```bash
# Määra keskkonnaspetsiifilised muutujad
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Vaata keskkonnamuutujaid
azd env get-values

# Oodatav väljund:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=salajane-api-võti
# DEBUG=true

# Eemalda keskkonnamuutuja
azd env unset DEBUG

# Kinnita eemaldamine
azd env get-values | grep DEBUG
# (ei tohiks midagi tagastada)
```

### Keskkonnamallid
Loo `.azure/env.template`, et tagada ühtne keskkonna seadistus:
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
# Kasuta Azure CLI mandaate (vaikimisi)
azd config set auth.useAzureCliCredential true

# Logi sisse konkreetse rentnikuga
az login --tenant <tenant-id>

# Määra vaikimisi tellimus
az account set --subscription <subscription-id>
```

### Teenusepõhise autentimise meetod
CI/CD torujuhtmete jaoks:
```bash
# Määra keskkonnamuutujad
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Või konfigureeri otse
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Hallatud identiteet
Azure'i hostitud keskkondade jaoks:
```bash
# Luba hallatud identiteedi autentimine
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktuuri konfiguratsioon

### Bicep parameetrid
Seadista infrastruktuuri parameetrid failis `infra/main.parameters.json`:
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

### Terraformi konfiguratsioon
Terraformi projektide jaoks seadista failis `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Paigalduskonfiguratsioon

### Ehituse konfiguratsioon
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

### Dockeri konfiguratsioon
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
Näide `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Edasijõudnud konfiguratsioon

### Kohandatud ressursside nimetamine
```bash
# Määrake nimetamise konventsioonid
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Võrgukonfiguratsioon
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Jälgimiskonfiguratsioon
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

## 🎯 Keskkonnaspetsiifilised konfiguratsioonid

### Arenduskeskkond
```bash
# .azure/arendus/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Testimiskeskkond
```bash
# .azure/staging/.keskkond
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

# Kinnita infrastruktuur
azd provision --dry-run
```

### Konfiguratsiooniskriptid
Loo valideerimisskriptid kausta `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Kontrolli vajalikke keskkonnamuutujaid
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Kontrolli azure.yaml süntaksit
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Parimad tavad

### 1. Kasuta keskkonnamuutujaid
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Korralda konfiguratsioonifailid
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
.azure/*/.env               # Keskkonna muutujad (võivad sisaldada saladusi)
.env                        # Kohalik keskkonnafail
```

### 4. Konfiguratsiooni dokumenteerimine
Dokumenteeri oma konfiguratsioon failis `CONFIG.md`:
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

### Harjutus 1: Mitme keskkonna konfiguratsioon (15 minutit)

**Eesmärk**: Loo ja konfigureeri kolm keskkonda erinevate seadistustega

```bash
# Loo arenduskeskkond
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Loo testimiskeskkond
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

**Edu kriteeriumid:**
- [ ] Kolm keskkonda loodud edukalt
- [ ] Igal keskkonnal on unikaalne konfiguratsioon
- [ ] Võimalik vahetada keskkondade vahel vigadeta
- [ ] `azd env list` kuvab kõik kolm keskkonda

### Harjutus 2: Salajaste andmete haldamine (10 minutit)

**Eesmärk**: Harjuta tundlike andmete turvalist seadistamist

```bash
# Määra saladused (ei kuvata väljundis)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Määra mitte-salajane konfiguratsioon
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Vaata keskkonda (saladused peaksid olema redigeeritud)
azd env get-values

# Kontrolli, et saladused on salvestatud
azd env get DB_PASSWORD  # Peaks näitama tegelikku väärtust
```

**Edu kriteeriumid:**
- [ ] Salajased andmed salvestatud ilma terminalis kuvamata
- [ ] `azd env get-values` kuvab redigeeritud salajased andmed
- [ ] Individuaalne `azd env get <SECRET_NAME>` tagastab tegeliku väärtuse

## Järgmised sammud

- [Sinu esimene projekt](first-project.md) - Rakenda konfiguratsioon praktikas
- [Paigaldusjuhend](../deployment/deployment-guide.md) - Kasuta konfiguratsiooni paigaldamiseks
- [Ressursside ettevalmistamine](../deployment/provisioning.md) - Tootmisvalmis konfiguratsioonid

## Viited

- [azd konfiguratsiooni viide](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml skeem](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Keskkonnamuutujad](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 3 - Konfiguratsioon ja autentimine
- **⬅️ Eelmine**: [Sinu esimene projekt](first-project.md)
- **➡️ Järgmine peatükk**: [Peatükk 4: Infrastruktuur kui kood](../deployment/deployment-guide.md)
- **Järgmine õppetund**: [Sinu esimene projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->