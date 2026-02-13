# Konfiguratsiooni juhend

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 3 - Konfiguratsioon ja autentimine
- **⬅️ Eelmine**: [Teie esimene projekt](first-project.md)
- **➡️ Järgmine**: [Juurutuse juhend](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Järgmine peatükk**: [Peatükk 4: Infrastruktuur koodina](../chapter-04-infrastructure/deployment-guide.md)

## Sissejuhatus

See põhjalik juhend käsitleb kõiki Azure Developer CLI seadistamise aspekte optimaalse arenduse ja juurutamise töövoo jaoks. Sa õpid konfiguratsiooni hierarhiast, keskkonna haldusest, autentimismeetoditest ja täiustatud konfiguratsioonimustritest, mis võimaldavad tõhusat ja turvalist Azure'i juurutamist.

## Õpieesmärgid

Lõpetades selle õppetüki, sa:
- Valdad azd konfiguratsiooni hierarhiat ja mõistad, kuidas seadeid prioritiseeritakse
- Konfigureerid globaalseid ja projekti-spetsiifilisi sätteid tõhusalt
- Haldate mitut keskkonda erinevate seadistustega
- Rakendad turvalisi autentimise ja autoriseerimise mustreid
- Mõistad täiustatud konfiguratsioonimustreid keerukate stsenaariumide jaoks

## Õpitulemused

Pärast selle õppetüki lõpetamist suudad:
- Konfigureerida azd-i optimaalseks arenduse töövoogudeks
- Seada üles ja hallata mitut juurutuskeskkonda
- Rakendada turvalisi konfiguratsiooni haldamise tavasid
- Tõrkeotsinguga lahendada konfiguratsiooniga seotud probleeme
- Kohandada azd käitumist konkreetsete organisatsiooni nõuete jaoks

See põhjalik juhend käsitleb kõiki Azure Developer CLI seadistamise aspekte optimaalse arenduse ja juurutamise töövoo jaoks.

## Konfiguratsiooni hierarhia

azd kasutab hierarhilist konfiguratsioonisüsteemi:
1. **Käsurea lipud** (kõrgeim prioriteet)
2. **Keskkonnamuutujad**
3. **Kohalik projekti konfiguratsioon** (`.azd/config.json`)
4. **Globaalne kasutaja konfiguratsioon** (`~/.azd/config.json`)
5. **Vaikeväärtused** (madalaim prioriteet)

## Globaalne konfiguratsioon

### Globaalse vaikeseadete määramine
```bash
# Määra vaikimisi tellimus
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Määra vaikimisi asukoht
azd config set defaults.location "eastus2"

# Määra vaikimisi ressursigrupi nimetamise konventsioon
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Kuva kogu globaalne konfiguratsioon
azd config list

# Eemalda konfiguratsioon
azd config unset defaults.location
```

### Üldised globaalsed sätted
```bash
# Arenduse eelistused
azd config set alpha.enable true                    # Luba alfa-funktsioonid
azd config set telemetry.enabled false             # Keela telemeetria
azd config set output.format json                  # Määra väljundi formaat

# Turvaseaded
azd config set auth.useAzureCliCredential true     # Kasuta Azure CLI-d autentimiseks
azd config set tls.insecure false                  # Nõua TLS-i kontrollimist

# Jõudluse häälestus
azd config set provision.parallelism 5             # Ressursside paralleelne loomine
azd config set deploy.timeout 30m                  # Juurutamise ajapiirang
```

## 🏗️ Projekti konfiguratsioon

### azure.yaml struktuur
The `azure.yaml` file is the heart of your azd project:

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

### Teenuse konfiguratsiooni valikud

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

#### Keelepõhised sätted
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

## 🌟 Keskkondade haldus

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

### Keskkonnamuutujad
```bash
# Määra keskkonnaspetsiifilised muutujad
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Kuva keskkonnamuutujad
azd env get-values

# Oodatav väljund:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Eemalda keskkonnamuutuja
azd env unset DEBUG

# Kontrolli eemaldamist
azd env get-values | grep DEBUG
# (ei peaks midagi tagastama)
```

### Keskkonna mallid
Loo `.azure/env.template` ühtlase keskkonna seadistuse jaoks:
```bash
# Nõutavad muutujad
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Rakenduse seaded
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Valikulised arenduse seaded
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Autentimise konfiguratsioon

### Azure CLI integreerimine
```bash
# Kasuta Azure CLI mandaate (vaikimisi)
azd config set auth.useAzureCliCredential true

# Logi sisse konkreetse tenantiga
az login --tenant <tenant-id>

# Määra vaikimisi tellimus
az account set --subscription <subscription-id>
```

### Teenusekonto (Service Principal) autentimine
CI/CD torude jaoks:
```bash
# Määra keskkonnamuutujad
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Või seadista otse
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Hallatud identiteet
Azure'i majutatud keskkondade jaoks:
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

## 🚀 Juurutuse konfiguratsioon

### Buildi konfiguratsioon
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

## 🔧 Täiustatud konfiguratsioon

### Kohandatud ressursside nimetamine
```bash
# Määra nimetamisreeglid
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

### Staging-keskkond
```bash
# .azure/staging/.env
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

# Valideeri infrastruktuur
azd provision --dry-run
```

### Konfiguratsiooniskriptid
Loo valideerimisskriptid kausta `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Kontrolli nõutavaid keskkonnamuutujaid
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Valideeri azure.yaml süntaks
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

### 3. Versioonihalduse kaalutlused
```bash
# .gitignore
.azure/*/config.json         # Keskkonna konfiguratsioonid (sisaldavad ressursi ID-sid)
.azure/*/.env               # Keskkonna muutujad (võivad sisaldada salajast teavet)
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

### Harjutus 1: Mitme keskkonna konfiguratsioon (15 minutit)

**Eesmärk**: Loo ja seadista kolm keskkonda erinevate seadistustega

```bash
# Loo arenduskeskkond
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Loo eeltootmiskeskkond
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

**Õnnestumise kriteeriumid:**
- [ ] Kolm keskkonda on edukalt loodud
- [ ] Igal keskkonnal on unikaalne konfiguratsioon
- [ ] Võid vahetada keskkondi ilma vigadeta
- [ ] `azd env list` kuvab kõik kolm keskkonda

### Harjutus 2: Salajaste andmete haldamine (10 minutit)

**Eesmärk**: Harjuta turvalist konfiguratsiooni tundlike andmetega

```bash
# Määra saladused (ei kuvata väljundis)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Määra mitte-salajane konfiguratsioon
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Vaata keskkonda (saladused peaksid olema peidetud)
azd env get-values

# Kontrolli, et saladused on salvestatud
azd env get DB_PASSWORD  # Peaks näitama tegelikku väärtust
```

**Õnnestumise kriteeriumid:**
- [ ] Saladused salvestatakse ilma terminalis kuvamata
- [ ] `azd env get-values` kuvab peidetud saladused
- [ ] Individuaalne `azd env get <SECRET_NAME>` tagastab tegeliku väärtuse

## Järgmised sammud

- [Teie esimene projekt](first-project.md) - Rakenda konfiguratsiooni praktikas
- [Juurutuse juhend](../chapter-04-infrastructure/deployment-guide.md) - Kasuta konfiguratsiooni juurutamiseks
- [Ressursside provisioneerimine](../chapter-04-infrastructure/provisioning.md) - Tootmiseks valmis konfiguratsioonid

## Viited

- [azd konfiguratsiooni viide](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml skeem](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Keskkonnamuutujad](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 3 - Konfiguratsioon ja autentimine
- **⬅️ Eelmine**: [Teie esimene projekt](first-project.md)
- **➡️ Järgmine peatükk**: [Peatükk 4: Infrastruktuur koodina](../chapter-04-infrastructure/deployment-guide.md)
- **Järgmine õppetükk**: [Teie esimene projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Lahtiütlus:
See dokument on tõlgitud tehisintellekti tõlketeenuse Co-op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi püüdleme täpsuse poole, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokumendi versiooni selle algkeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta ühegi arusaamatuse ega väärtõlgenduse eest, mis võivad tuleneda selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->