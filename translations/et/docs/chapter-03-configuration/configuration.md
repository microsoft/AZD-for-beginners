# Konfiguratsiooni juhend

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 3 - Konfiguratsioon ja autentimine
- **⬅️ Eelmine**: [Teie esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine**: [Paigaldusjuhend](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Järgmine peatükk**: [Peatükk 4: Infrastruktuur kui kood](../chapter-04-infrastructure/deployment-guide.md)

## Sissejuhatus

> Vaadatud läbi `azd 1.37.2` (november 2026). Bash-käsud eeldavad, et azd projekt on algatatud. Kui pole selgesõnaliselt kirjeldatud kui täielik fail, on YAML/Bicep lõigud killud, mida liita vastavatesse projekti failidesse, mitte iseseisvateks käivitatavateks projektideks.

See põhjalik juhend hõlmab kõiki Azure Developer CLI konfigureerimise aspekte parimate arendus- ja paigaldustöövoogude jaoks. Õpid konfiguratsiooni hierarhiast, keskkonna haldusest, autentimismeetoditest ja arenenud konfiguratsioonimustritest, mis võimaldavad tõhusat ja turvalist Azure paigaldust.

## Õpieesmärgid

Selle õppetunni lõpuks:
- Valdad azd konfiguratsiooni hierarhia ja mõistad, kuidas seaded prioriseeritakse
- Konfigureerid globaal- ja projekti-spetsiifilisi sätteid tõhusalt
- Haldate mitut keskkonda erinevate konfiguratsioonidega
- Rakendad turvalisi autentimise ja autoriseerimise mustreid
- Mõistad arenenud konfiguratsioonimustreid keerukate stsenaariumide jaoks

## Õpitulemused

Pärast selle õppetunni lõpetamist suudad:
- Konfigureerida azd parimate arendustöövoogude jaoks
- Seadistada ja hallata mitut paigalduskeskkonda
- Rakendada turvalisi konfiguratsiooni haldamise praktikad
- Lahendada konfiguratsiooniga seotud probleeme
- Kohandada azd käitumist spetsiifiliste organisatsiooni nõuete jaoks

See põhjalik juhend hõlmab kõiki Azure Developer CLI konfigureerimise aspekte parimate arendus- ja paigaldustöövoogude jaoks.

## AI agentide mõistmine azd projektis

Kui oled AI agentide uus kasutaja, siis siin on lihtne viis neid azd maailmas mõista.

### Mis on agent?

Agent on tarkvaratükk, mis saab päringu vastu võtta, mõelda selle üle ja tegutseda — sageli AI mudelit kutsudes, andmeid otsides või muid teenuseid käivitades. azd projektis on agent lihtsalt järgmine **teenus** teie veebiliidese või API tagaosa kõrval.

### Kuidas agent sobitub azd projekti struktuuri

azd projekt koosneb kolmest kihist: **infrastruktuur**, **kood** ja **konfiguratsioon**. Agent ühineb nendesse kihtidesse samamoodi nagu iga teine teenus:

| Kiht | Mis see traditsioonilisele rakendusele teeb | Mis see agentile teeb |
|-------|--------------------------------------------|-------------------------|
| **Infrastruktuur** (`infra/`) | Paigaldab veebirakenduse ja andmebaasi | Paigaldab AI mudeli lõpp-punkti, otsinguindeksi või agendi hosti |
| **Kood** (`src/`) | Sisaldab teie kasutajaliidese ja API lähtekoodi | Sisaldab agendi loogikat ja promptide definitsioone |
| **Konfiguratsioon** (`azure.yaml`) | Loetleb teie teenused ja nende hostimiskohad | Loetleb teie agendi teenusena, viidates selle koodile ja hostile |

### `azure.yaml` roll

Sul ei ole praegu vaja süntaksit pähe õppida. Kontseptuaalselt on `azure.yaml` fail, kuhu ütled azd-ile: *„Siin on teenused, mis minu rakendust moodustavad, ja siin asub nende kood.”*

Kui sinu projekt sisaldab AI agenti, siis `azure.yaml` loetleb selle agendi lihtsalt ühe teenusena. azd teab siis õigete infrastruktuuri ressursside (nagu Microsoft Foundry mudelite lõpp-punkt või Container App agendi hostimiseks) paigaldamise ja agendi koodi juurutamise teha — nagu veebirakenduse või API puhul.

See tähendab, et uut õppimiseks põhimõtteliselt pole. Kui mõistad, kuidas azd haldab veebiteenust, siis juba mõistad, kuidas see haldab agenti.

## Konfiguratsiooni hierarhia

azd-l on erinevad konfiguratsioonipinnad, mitte üks universaalne pealiskihi seadistus:
- **Globaalsete kasutuseelistuste**: `~/.azd/config.json`, mille haldab `azd config`.
- **Projekti definitsioon**: `azure.yaml` määratleb teenused, infrastruktuuri ja konksud.
- **Kohaliku keskkonna valik**: `.azure/config.json`.
- **Keskkonnapõhised väärtused**: `.azure/<name>/.env`, mida haldab `azd env`; lisasätted asuvad selle keskkonna `config.json`.
- **Lipud ja protsessimuutujad**: ülekirjutavad vaid käsu/tootja poolt toetatud sätteid.

Suvaline `azd env set` väärtus ei muutu automaatselt infrastruktuuri parameetriks ega juurutatud rakenduse seadmeks. Näita seda selgelt parameetrite failis, toetatud teenuse konfiguratsioonis või konksus.

## Globaalne konfiguratsioon

### Globaalsete vaikeväärtuste seadistamine
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### Tavalised globaalsete seadete näited
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ Projekti konfiguratsioon

### azure.yaml struktuur
`azure.yaml` fail on sinu azd projekti süda:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

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
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

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

See on **projekti definitsiooni näide**, mitte algfail. Loo viidatud lähtekoodikataloogid, konksude skriptid, paketi skriptid ja vastavad `infra/main.bicep`/`main.parameters.json` enne käivitamist. Andmebaasid kuuluvad infrastruktuuri; `postgres` ei ole sisseehitatud teenuse host. Infrastruktuuri parameetrid käivad teenusepakkuja parameeritud faili, mitte `infra.parameters`.

### Teenuse konfiguratsiooni valikud

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

#### Keelespetsiifilised build-konksud

Järgmised teenuse killud illustreerivad konksusid; ühenda need iga teenuse päris `project` ja `host`-ga. `buildCommand` ja `startCommand` ei ole üldised azd teenuse omadused. Käivitage seadistus rakenduse, Dockerfile või hosti infrastruktuuri kaudu.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 Keskkonna haldus

### Keskkondade loomine
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Keskkonna konfiguratsioon
Põhilised keskkonna väärtused asuvad `.azure/<env-name>/.env`, sealhulgas `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` ja `AZURE_LOCATION`. Lisaseaded paigutage `azd env config get/set`. Järgmine JSON on **kontseptuaalne rakenduse seisund**, mitte azd config skeem; ära kopeeri seda azd failidesse:

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

**Puhttekst demonstratsiooniks.** Tavalised `azd env set` väärtused kirjutatakse `.azure/<name>/.env` ja neid saab lugemiskäskudega välja printida. Ära kasuta näite API võtit tõelise mandaadina. Salajaste andmete jaoks kasuta `azd env set-secret` ja selget jooksuaegset ühendamist.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### Keskkonnapõhised mallid
Loo projekti juurkausta **mitte-salajane, käsitsi hallatav** `.env.example` järjepidevaks seadistamiseks. azd ei laadi automaatselt faili nimega `env.template`:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### Keskkondade jagamine meeskonnas

Kui projektis töötab mitu inimest, peate kokku leppima **mis reisib repo´s ja mis jääb kohalikuks**. azd hoiab iga keskkonna `.azure/` kausta all ja kõiki faile ei tohiks commitida.

**Mis on sees `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Mida ignoreerida gitis.** azd vaikimisi `.gitignore` jätab juba välja `.azure/`. Hoia see nii — `.env` failid võivad sisaldada saladusi ja ressursside ID-d on spetsiifilised nende loojale. Iga meeskonnaliige loob oma **enda** keskkonna kohalikus arvutis:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Keskkondade vahetamine.** Mitut keskkonda haldav arendaja valib aktiivse enne käsu käivitamist:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Mitte-salajaste vaikeväärtuste jagamine meeskonnaga.** Commiti `.env.example` väljaspool ignoreeritud `.azure/` kausta. Uued meeskonnaliikmed kopeerivad selle kohalikku ignoreeritud faili, täidavad väärtused ja impordivad selgelt abil `azd env set --file <local-file>`. Ära kunagi impordi tühje kohatäitjaid töötava keskkonna kohale.

**Keskkonnad CI/CD-s.** Torujuhtmed ei loe sinu kohalikku `.azure/` kausta. Selle asemel anna keskkonna väärtused torujuhtme muutujate/saladustena ja azd loeb need protsessi keskkonnast.

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Reegel:** infrastruktuuri kood (`infra/`, `azure.yaml`) jagatakse Git´s; keskkonna *seisund ja saladused* (`.azure/`) on arendaja- ja torujuhtmepõhised. `azd pipeline config` seadistab sinu jaoks torujuhtme muutujad automaatselt.

## 🔐 Autentimise konfiguratsioon

### Azure CLI integratsioon
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Teenuse-põhine autentimine
CI/CD torujuhtmiku jaoks:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Haldusega identiteet
Azure-hostitud keskkondade jaoks:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Infrastruktuuri konfiguratsioon

### Bicep parameetrid
Konfigureeri infrastruktuuri parameetreid failis `infra/main.parameters.json`:
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
Terraform projektide puhul asendab azd kohatäitjaid failis `infra/main.tfvars.json`. Need nimed peavad vastama deklareeritud Terraform sisendmuutujatele:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Paigaldamise konfiguratsioon

### Build konfiguratsioon
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Docker konfiguratsioon
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
 Teed on suhtelised teenuse projekti suhtes. Dockerfile peab deklareerima kõik kasutatavad `ARG` väärtused. Mitme astme build´i puhul pane juurutatav aste viimasena või kasuta kohandatud paketi töövoogu; `docker.target` ei ole toetatud omadus selles vaadeldud skeemis.

## 🔧 Täiustatud konfiguratsioon

### Kohandatud ressursside nimetamine
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Määra tegelikud ressursside nimed Bicep/Terraformis ja hoia ressursside rühma loomine sellest seadmest ühtlane. Pole olemas üldiseid `naming.storageAccount` või `naming.keyVault` konfiguratsioonivõtmeid.

### Võrgu konfiguratsioon
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Lisa need **näitlikud parameetri kirjed** `infra/main.parameters.json` alla `parameters` ja deklareeri ning tarvita vastavad parameetrid Bicepis. Need iseenesest ei tee midagi.

### Jälgimise konfiguratsioon
Paigalda Application Insights ja Log Analytics Bicep/Terraformiga ning configureeri rakenduse telemeetria SDK-s. Pole olemas üldist tipptaseme `monitoring` plokki failis `azure.yaml`, mis neid ressursse looks. Vaata [jälgimise infrastruktuuri](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Keskkonnapõhised konfiguratsioonid

### Arenduskeskkond
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Testkeskkond
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
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Konfiguratsiooni skriptid
Loo valideerimisskriptid kausta `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Parimad praktikad

### 1. Kasuta keskkonnamuutujaid
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Väldi tundlike väärtuste kõvast kodeerimist (see on illustreeriv konfiguratsioon, mitte teine `database` võti samas failis):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Korralda konfiguratsioonifaile
```
.azure/
├── config.json              # Global project config
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
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Konfiguratsiooni dokumentatsioon
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

### Harjutus 1: mitme keskkonna konfiguratsioon (15 minutit)

**Eesmärk**: Loo ja konfigureeri kolm kohalikku keskkonda erinevate väärtustega. Alusta initsialiseeritud projektist; kasuta vabu nimesid, kui need juba eksisteerivad. Need rakenduse spetsiifilised väärtused ei muuda telemeetria/jooksuaegseid sätteid seni kuni sinu mall neid ei kasuta.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Edu kriteeriumid:**
- [ ] Kolm keskkonda loodud edukalt
- [ ] Igal keskkonnal unikaalne konfiguratsioon
- [ ] Saab keskkondade vahel vahetada ilma vigadeta
- [ ] `azd env list` näitab kõiki kolme keskkonda

### Harjutus 2: Key Vault saladuste viited (10-20 minutit)

**Eesmärk**: Salvesta Key Vault viide plaantekstist. **Alguspunkt:** initsialiseeritud keskkond, Azure sisse logimine ja ligipääs Key Vaultile, kus on õigused luua/lugeda näidis saladust. Vaulti toimingud võivad olla tasulised.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**Edu kriteeriumid:**
- [ ] Interaktiivne käsk näitab valitud salve ja saladuse viidet
- [ ] Kohalik `.env` sisaldab viidet, mitte näidis saladust
- [ ] Suudab ära seletada, et jooksuaegne identiteet/RBAC ja tarbimine tuleb ikkagi konfigureerida

**Tavalised probleemid:** 403 tõrge nõuab õiget salve data-plane rolli ja levitamise aega; `azd env set ... --secret` ei ole kehtiv käsk. Tavalist outputi `get-values`/`get-value` ei tohi eeldada puhastatuna. Eemalda treeningviide abil `azd env unset TRAINING_API_KEY`; see ei kustuta salvestusalve saladust, mille pead vajadusel eraldi puhastama, kui selle lõid.

## Järgmised sammud

- [Teie esimene projekt](../chapter-01-foundation/first-project.md) - Rakenda konfiguratsiooni praktikas
- [Paigaldusjuhend](../chapter-04-infrastructure/deployment-guide.md) - Kasuta konfiguratsiooni paigaldamiseks
- [Ressursside provisioneerimine](../chapter-04-infrastructure/provisioning.md) - Tootmiskõlblikud konfiguratsioonid

## Viited

- [azd konfiguratsiooni viide](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml skeem](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Keskkonnamuutujad](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD Algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 3 - Konfigureerimine ja autentimine
- **⬅️ Eelmine**: [Sinu esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine peatükk**: [Peatükk 4: Infrastruktuur koodina](../chapter-04-infrastructure/deployment-guide.md)
- **Järgmine õppetund**: [Autentimine ja turvalisus](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->