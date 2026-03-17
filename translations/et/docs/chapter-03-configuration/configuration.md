# Konfiguratsiooni juhend

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 3 - Konfiguratsioon ja autentimine
- **⬅️ Eelmine**: [Teie esimene projekt](first-project.md)
- **➡️ Järgmine**: [Juurutamise juhend](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Järgmine peatükk**: [Peatükk 4: Infrastruktuur koodina](../chapter-04-infrastructure/deployment-guide.md)

## Sissejuhatus

See põhjalik juhend käsitleb kõiki Azure Developer CLI konfigureerimise aspekte optimaalsete arendus- ja juurutusprotsesside tarbeks. Õpite tundma konfiguratsiooni hierarhiat, keskkondade haldust, autentimismeetodeid ja arenenud konfiguratsiooni mustreid, mis võimaldavad tõhusat ja turvalist Azure'i juurutust.

## Õpieesmärgid

Selle õppetunni lõpuks:
- Omate täielikku ülevaadet azd konfiguratsiooni hierarhiast ja teadlikkust seadete prioriteedist
- Oskate tõhusalt seadistada globaalseid ja projektipõhiseid sätteid
- Haldate mitut keskkonda erinevate konfiguratsioonidega
- Rakendate turvalisi autentimise ja autoriseerimise mustreid
- Mõistate arenenud konfiguratsiooni mustreid keerukate stsenaariumide jaoks

## Õpitulemused

Pärast selle õppetunni läbimist suudate:
- Konfigureerida azd optimaalsete arendusprotsesside tarbeks
- Seada üles ja hallata mitut juurutuskeskkonda
- Rakendada turvalisi konfiguratsiooni haldamise tavasid
- Lahendada konfiguratsiooni seotud probleeme
- Kohandada azd käitumist vastavalt konkreetsetele organisatsiooninõuetele

See põhjalik juhend käsitleb kõiki Azure Developer CLI konfigureerimise aspekte optimaalsete arendus- ja juurutusprotsesside tarbeks.

## AI agendide mõistmine azd projektis

Kui AI agendid on teile uued, siis siin on lihtne viis neid azd maailmas ette kujutada.

### Mis on agent?

Agent on tarkvaratükk, mis suudab vastu võtta päringu, sellele mõelda ja toiminguid teha—tavaliselt AI mudeli kutsumise, andmete otsimise või teiste teenuste kasutamise kaudu. Azd projektis on agent lihtsalt üks **teenus** teie veebiliidese või API tagaosa kõrval.

### Kuidas agendid sobituvad azd projekti struktuuri

Azd projekt koosneb kolmest kihist: **infrastruktuur**, **kood** ja **konfiguratsioon**. Agendid integreeruvad nendesse kihtidesse samamoodi nagu teised teenused:

| Kiht | Mis see teeb traditsioonilise rakenduse jaoks | Mis see teeb agendi jaoks |
|-------|---------------------------------------------|---------------------------|
| **Infrastruktuur** (`infra/`) | Varustab veebirakendus ja andmebaasi | Varustab AI mudeli lõpp-punkti, otsinguindeksi või agendi hosti |
| **Kood** (`src/`) | Sisaldab teie esipaneeli ja API lähtekoodi | Sisaldab teie agendi loogikat ja üleskutse definitsioone |
| **Konfiguratsioon** (`azure.yaml`) | Loetleb teie teenused ja nende majutuse sihtmärgid | Loetleb teie agendi teenusena, osutades selle koodile ja hostile |

### `azure.yaml` roll

Te ei pea süntaksit praegu pähe õppima. Kontseptuaalselt on `azure.yaml` fail, kus ütlete azd-le: *"Siin on teenused, mis moodustavad minu rakenduse, ja siin asub nende kood."*

Kui teie projekt sisaldab AI agenti, loetleb `azure.yaml` lihtsalt selle agendi teenusena. Seejärel teab azd õigete infrastruktuuride (näiteks Microsoft Foundry mudelite lõpp-punkt või konteinerirakendus agendi majutamiseks) loomist ja teie agendi koodi juurutamist – täpselt nii nagu veebirakenduse või API puhul.

See tähendab, et põhimõtteliselt pole midagi uut õppida. Kui teate, kuidas azd haldab veebiteenust, mõistate juba, kuidas see haldab agenti.

## Konfiguratsiooni hierarhia

azd kasutab hierarhilist konfiguratsioonisüsteemi:
1. **Käsurealipud** (kõrgeim prioriteet)
2. **Keskkonnamuutujad**
3. **Kohalik projekti konfiguratsioon** (`.azd/config.json`)
4. **Globaalne kasutajakonfiguratsioon** (`~/.azd/config.json`)
5. **Vaikimisi väärtused** (kõrgeim prioriteet)

## Globaalne konfiguratsioon

### Globaalsete vaikimisi väärtuste seadistamine
```bash
# Määra vaikimisi tellimus
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Määra vaikimisi asukoht
azd config set defaults.location "eastus2"

# Määra vaikimisi ressursigrupi nimetamise tava
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Vaata kogu globaalseid seadeid
azd config list

# Eemalda konfiguratsioon
azd config unset defaults.location
```

### Üldised globaalsed sätted
```bash
# Arendusvalikud
azd config set alpha.enable true                    # Luba alfa funktsioonid
azd config set telemetry.enabled false             # Keela telemeetria
azd config set output.format json                  # Määra väljundi formaat

# Turvaseaded
azd config set auth.useAzureCliCredential true     # Kasuta Azure CLI autentimiseks
azd config set tls.insecure false                  # Nõua TLS kontrollimist

# Jõudluse optimeerimine
azd config set provision.parallelism 5             # Ressursside paralleelne loomine
azd config set deploy.timeout 30m                  # Paigaldusaja ületamise aeg
```

## 🏗️ Projekti konfiguratsioon

### `azure.yaml` struktuur
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

### Teenuste konfiguratsiooni valikud

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

#### Keele-spetsiifilised sätted
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

# Vaata keskkonnamuutujaid
azd env get-values

# Oodatav väljund:
# DATABASE_URL=postgresql://kasutaja:parool@host:5432/andmebaas
# API_KEY=salajane-api-võti
# DEBUG=tõene

# Eemalda keskkonnamuutuja
azd env unset DEBUG

# Kontrolli eemaldamist
azd env get-values | grep DEBUG
# (ei tohiks midagi tagastada)
```

### Keskkonna mallid
Loo fail `.azure/env.template`, et keskkondade seadistamine oleks ühtlane:
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
# Kasutage Azure CLI mandaate (vaikimisi)
azd config set auth.useAzureCliCredential true

# Logi sisse konkreetse üürniku kaudu
az login --tenant <tenant-id>

# Määra vaikimisi tellimus
az account set --subscription <subscription-id>
```

### Teenusprintsiipi autentimine
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

### Halatud identiteet
Azure'is majutatud keskkondade jaoks:
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

### Terraform konfiguratsioon
Terraform projektide jaoks seadista failis `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Juurutuse konfiguratsioon

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
Näiteks `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Arendatud konfiguratsioon

### Kohandatud ressursside nimetamine
```bash
# Määrake nimetamisreeglid
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

## 🎯 Keskkonnaspetsiifilised konfiguratsioonid

### Arendus keskkond
```bash
# .azure/arendus/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Stage keskkond
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Tootmiskeskkond
```bash
# .azure/tootmine/.env
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
Loo valideerimisskriptid kaustas `scripts/`:

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

### 3. Versioonihalduse kaalutlused
```bash
# .gitignore
.azure/*/config.json         # Keskkonna konfiguratsioonid (sisaldavad ressursi ID-sid)
.azure/*/.env               # Keskkonnaparameetrid (võivad sisaldada salasõnu)
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

### Harjutus 1: Mitmekeskkondade konfiguratsioon (15 minutit)

**Eesmärk**: Loo ja konfigureeri kolm erineva seadistusega keskkonda

```bash
# Loo arenduskeskkond
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Loo testkeskkond
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
- [ ] Kolm keskkonda edukalt loodud
- [ ] Igal keskkonnal on unikaalne konfiguratsioon
- [ ] Keskkondade vahel saab ilma vigadeta vahetada
- [ ] Käsk `azd env list` kuvab kõik kolm keskkonda

### Harjutus 2: Saladuste haldamine (10 minutit)

**Eesmärk**: Praktiseeri turvalist konfiguratsiooni tundlike andmetega

```bash
# Määra saladused (mitte väljundis kuvamiseks)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Määra mitte-saladus konfiguratsioon
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Vaata keskkonda (saladusi peaks varjama)
azd env get-values

# Kinnita, et saladused on salvestatud
azd env get DB_PASSWORD  # Peaks näitama tegelikku väärtust
```

**Edu kriteeriumid:**
- [ ] Saladused salvestatud ilma terminalis kuvamata
- [ ] `azd env get-values` näitab punktiiriga varjatud saladusi
- [ ] Individuaalne käsk `azd env get <SECRET_NAME>` tagastab tegeliku väärtuse

## Järgmised sammud

- [Teie esimene projekt](first-project.md) - Rakendage konfiguratsioon praktikas
- [Juurutamise juhend](../chapter-04-infrastructure/deployment-guide.md) - Kasutage konfiguratsiooni juurutamiseks
- [Ressursside loomine](../chapter-04-infrastructure/provisioning.md) - Tootmisvalmis konfiguratsioonid

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
- **Järgmine õppetund**: [Teie esimene projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Loaavaldus**:
See dokument on tõlgitud kasutades tehisintellekti tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame täpsust, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma emakeeles on autoriteetne allikas. Kriitilise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta tekkida võivate arusaamatuste või valesti mõistmiste eest, mis võivad tuleneda selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->