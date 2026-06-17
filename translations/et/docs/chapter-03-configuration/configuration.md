# Konfiguratsioonijuhend

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 3 - Konfiguratsioon ja autentimine
- **⬅️ Eelmine**: [Teie esimene projekt](first-project.md)
- **➡️ Järgmine**: [Ladustamise juhend](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Järgmine peatükk**: [Peatükk 4: Infrastruktuur koodina](../chapter-04-infrastructure/deployment-guide.md)

## Sissejuhatus

See põhjalik juhend hõlmab kõiki aspekte Azure Developer CLI optimaalsete arendus- ja juurutusprotsesside konfigureerimiseks. Õpite konfiguratsioonihierarhiat, keskkonna haldamist, autentimismeetodeid ja keerukamaid konfiguratsioonimustreid, mis võimaldavad tõhusat ja turvalist Azure’i juurutust.

## Õpieesmärgid

Selle tunni lõpuks:
- Omandate azd konfiguratsioonihierarhia ja mõistate, kuidas seadeid prioriseeritakse
- Konfigureerite globaalseid ja projektilahendatud sätteid tõhusalt
- Haldate mitut keskkonda erinevate konfiguratsioonidega
- Rakendate turvalisi autentimise ja autoriseerimise mustreid
- Mõistate keerukate olukordade jaoks mõeldud täiustatud konfiguratsioonimustreid

## Õpitulemused

Pärast selle tunni lõpetamist oskate:
- Konfigureerida azd optimaalseks arendusprotsessiks
- Luua ja hallata mitut juurutuskeskkonda
- Rakendada turvalisi konfiguratsiooni haldamise tava
- Lahendada konfiguratsiooniga seotud probleeme
- Kohandada azd käitumist konkreetsete organisatsiooni nõuetega

See põhjalik juhend hõlmab kõiki aspekte Azure Developer CLI optimaalsete arendus- ja juurutusprotsesside konfigureerimiseks.

## AI agentide mõistmine azd projektis

Kui AI agentide kontseptsioon on teile uus, siis siin on lihtne viis neid azd kontekstis mõelda.

### Mis on agent?

Agent on tarkvaratükk, mis saab päringu, analüüsib seda ja võtab meetmeid – sageli kutsudes AI mudelit, otsides andmeid või käivitades teisi teenuseid. Azd projektis on agent lihtsalt üks **teenus** teie veebiliidese või API tagapoolsete teenuste kõrval.

### Kuidas agent sobitub azd projekti struktuuri

Azd projekt koosneb kolmest kihist: **infrastruktuur**, **kood** ja **konfiguratsioon**. Agentid ühenduvad nende kihtidega samamoodi nagu teised teenused:

| Kiht | Mida teeb traditsioonilisele rakendusele | Mida teeb agendi puhul |
|-------|------------------------------------------|------------------------|
| **Infrastruktuur** (`infra/`) | Paigaldab veebirakenduse ja andmebaasi | Paigaldab AI mudeli lõpp-punkti, otsinguindeksi või agendi hosti |
| **Kood** (`src/`) | Hõlmab teie frontendi ja API lähtekoodi | Hõlmab agentide loogikat ja käsklustedefinitsioone |
| **Konfiguratsioon** (`azure.yaml`) | Loetleb teie teenused ja nende hosting sihtkohad | Loetleb agendi teenusena, näidates selle koodi ja hosti asukohta |

### `azure.yaml` roll

Te ei pea sümbolite süntaksit praegu pähe õppima. Mõtteliselt on `azure.yaml` fail, kuhu ütlete azd-le: *"Siin on teenused, mis moodustavad minu rakenduse, ja siin saate nende koodi leida."*

Kui teie projekt sisaldab AI agenti, siis `azure.yaml` lihtsalt loetleb selle ühe teenusena. Azd teab siis õigesti paigaldada infrastruktuuri (näiteks Microsoft Foundry mudeleid sisaldav lõpp-punkt või Container App agendi majutamiseks) ja juurutada teie agentide koodi – täpselt nagu veebirakenduse või API puhul.

See tähendab, et pole midagi põhimõtteliselt uut õppida. Kui mõistate, kuidas azd haldab veebiteenust, siis mõistate juba agenti haldamist.

## Konfiguratsioonihierarhia

azd kasutab hierarhilist konfiguratsioonisüsteemi:
1. **Käsurea lipud** (kõrgeim prioriteet)
2. **Keskkonnamuutujad**
3. **Kohalik projekti konfiguratsioon** (`.azd/config.json`)
4. **Globaalne kasutajakonfiguratsioon** (`~/.azd/config.json`)
5. **Vaikimisi väärtused** (madalaim prioriteet)

## Globaalne konfiguratsioon

### Globaalsete vaikeväärtuste seadistamine
```bash
# Määra vaike-tellimus
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Määra vaike asukoht
azd config set defaults.location "eastus2"

# Määra vaike ressursigrupi nimetamise konventsioon
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Vaata kogu globaalseid seadeid
azd config show

# Eemalda seadistus
azd config unset defaults.location
```

### Levinud globaalsed sätted
```bash
# Arenduse eelistused
azd config set alpha.enable true                    # Luba alfa-funktsioonid
azd config set telemetry.enabled false             # Keela telemeetria
azd config set output.format json                  # Määra väljundvorming

# Turvaseaded
azd config set auth.useAzureCliCredential true     # Kasuta autentimiseks Azure CLI-d
azd config set tls.insecure false                  # Jõusta TLS-i kontroll

# Jõudluse seadistamine
azd config set provision.parallelism 5             # Parallelne ressursi loomine
azd config set deploy.timeout 30m                  # Paigaldamise aegumine
```

## 🏗️ Projekti konfiguratsioon

### azure.yaml struktuur
`azure.yaml` fail on teie azd projekti südames:

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

#### Hostitüübid
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

## 🌟 Keskkonna haldamine

### Keskkondade loomine
```bash
# Loo uus keskkond
azd env new development

# Loo kindla asukohaga
azd env new staging --location "westus2"

# Loo mallist
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Keskkonnakonfiguratsioon
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
# Määrake keskkonnaspetsiifilised muutujad
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Vaadake keskkonnamuutujaid
azd env get-values

# Oodatav väljund:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Eemaldage keskkonnamuutuja
azd env unset DEBUG

# Kontrollige eemaldamist
azd env get-values | grep DEBUG
# (ei tohiks midagi tagastada)
```

### Keskkonnapõhjad
Looge `.azure/env.template` järjepidevaks keskkonna seadistamiseks:
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

### Keskkondade jagamine meeskonnas

Kui projekti töötab rohkem kui üks inimene, peate kokku leppima **mis liigub repo sees ja mis jääb lokaalseks**. azd hoiab iga keskkonna `.azure/` kaustas, kuid mitte kõike sellest ei tohiks kinnitada.

**Mis on `.azure/` sees:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Mida gitignore’i lisada.** Azd vaikimisi `.gitignore` välistab juba `.azure/`. Las see olla nii – `.env` failid võivad sisaldada salasõnu ja ressursi ID-d on spetsiifilised neile, kes neid varustavad. Iga tiimiliige loob **oma** keskkonna lokaalselt:

```bash
# Iga arendaja käivitab selle korra oma isoleeritud keskkonna saamiseks
azd env new dev-alice
azd up
```

**Keskkondade vahetamine.** Arendaja, kes haldab mitut keskkonda, valib aktiivse keskkonna enne käskude jooksutamist:

```bash
azd env list                 # näita kõiki kohalikke keskkondi ja milline on vaikimisi
azd env select staging       # tee 'staging' aktiivseks keskkonnaks
azd env get-values           # kinnita, et oled õigel keskkonnal
```

**Mitte-salajaste vaikeseadete jagamine meeskonnaga.** Suvandage mall (näiteks ülaltoodud `.azure/env.template`), et kõigil oleks teada, milliseid muutujaid seadistada – kuid ärge kunagi kinnitage täidetud väärtusi. Uued tiimiliikmed kopeerivad malli ja lisavad oma.

**Keskkonnad CI/CDs.** Pipelines ei loe teie kohalikku `.azure/` kausta. Selle asemel esitage keskkonna väärtused torujuhtme muutujate/saladustena ja azd loeb need protsessi keskkonnast:

```bash
# CI-s loeb azd need keskkonnast, mitte kaustast .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Võtmesõna:** infrastruktuuri kood (`infra/`, `azure.yaml`) jagatakse Gitis; keskkonna *seisund ja saladused* (`.azure/`) on arendaja- ja torujuhtmepõhised. `azd pipeline config` seadistab torujuhtme muutujad automaatselt.

## 🔐 Autentimise konfiguratsioon

### Azure CLI integratsioon
```bash
# Kasuta Azure CLI mandaate (vaikimisi)
azd config set auth.useAzureCliCredential true

# Logi sisse kindla üürnikuna
az login --tenant <tenant-id>

# Sea vaikimisi tellimus
az account set --subscription <subscription-id>
```

### Teenusepõhine autenticatsioon
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

### Hallatud identiteet
Azure-hostitud keskkondade jaoks:
```bash
# Luba hallatud identiteedi autentimine
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktuuri konfiguratsioon

### Bicep parameetrid
Seadistage infrastruktuuri parameetreid failis `infra/main.parameters.json`:
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
Terraform projektide jaoks seadistage failis `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Juurutuse konfiguratsioon

### Kogumisprotsessi konfiguratsioon
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
Näidisdokk `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Täiustatud konfiguratsioon

### Kohandatud ressursside nimed
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

## 🎯 Spetsiifilised keskkonnakonfiguratsioonid

### Arenduskeskkond
```bash
# .azure/arendus/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Ettevalmistuskeskkond
```bash
# .azure/veerandamine/.env
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

### Valideeri konfiguratsioon
```bash
# Kontrolli konfiguratsiooni süntaksit
azd config validate

# Testi keskkonnamuutujaid
azd env get-values

# Kontrolli infrastruktuuri kehtivust
azd provision --dry-run
```

### Konfiguratsiooni skriptid
Looge valideerimisskriptid kausta `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Kontrolli nõutud keskkonnamuutujaid
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

### 3. Versioonihalduse kaalutlused
```bash
# .gitignore
.azure/*/config.json         # Keskkonna konfiguratsioonid (sisaldavad ressursi ID-sid)
.azure/*/.env               # Keskkonnamuutujad (võivad sisaldada salasõnu)
.env                        # Kohalik keskkonna fail
```

### 4. Konfiguratsiooni dokumentatsioon
Dokumenteerige oma konfiguratsioon faili `CONFIG.md`:
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

### Harjutus 1: Mitmekeskkonna konfiguratsioon (15 minutit)

**Eesmärk**: Luua ja seadistada kolm erineva konfiguratsiooniga keskkonda

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

# Kontrolli iga keskkond
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Edu kriteeriumid:**
- [ ] Kolm keskkonda edukalt loodud
- [ ] Iga keskkonna konfiguratsioon on unikaalne
- [ ] Keskkondade vahel saab tõrgeteta vahetada
- [ ] `azd env list` kuvab kõik kolm keskkonda

### Harjutus 2: Salasõnade haldus (10 minutit)

**Eesmärk**: Harjutada turvalist konfiguratsiooni tundliku info haldusega

```bash
# Määra saladused (väljal ei kuvata)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Määra mitte-saladus konfiguratsioon
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Vaata keskkonda (saladused peaksid olema tsenseeritud)
azd env get-values

# Kontrolli, kas saladused on salvestatud
azd env get DB_PASSWORD  # Peaks näitama tegelikku väärtust
```

**Edu kriteeriumid:**
- [ ] Saladused salvestatakse ilma terminalis kuvamata
- [ ] `azd env get-values` näitab tsenseeritud salasõnu
- [ ] Individuaalne `azd env get <SECRET_NAME>` toob tegeliku väärtuse

## Järgmised sammud

- [Teie esimene projekt](first-project.md) - Rakendage konfiguratsiooni praktikas
- [Ladustamise juhend](../chapter-04-infrastructure/deployment-guide.md) - Kasutage konfiguratsiooni juurutamiseks
- [Ressursside varustamine](../chapter-04-infrastructure/provisioning.md) - Tootmiskõlblikud konfiguratsioonid

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
- **Järgmine tund**: [Teie esimene projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->