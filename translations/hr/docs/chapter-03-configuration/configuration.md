# Vodič za konfiguraciju

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD Za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 3 - Konfiguracija i autentikacija
- **⬅️ Prethodno**: [Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Sljedeće**: [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 4: Infrastruktura kao kod](../chapter-04-infrastructure/deployment-guide.md)

## Uvod

> Pregledano prema `azd 1.37.2` (studeni 2026.). Bash naredbe pretpostavljaju inicijalizirani azd projekt. Osim ako nije izričito opisano kao potpuna datoteka, YAML/Bicep isječci su fragmenti za spajanje u odgovarajuće projektne datoteke, a ne samostalni pokretni projekti.

Ovaj opsežni vodič pokriva sve aspekte konfiguracije Azure Developer CLI za optimalne razvojne i implementacijske tijekove rada. Naučit ćete o hijerarhiji konfiguracije, upravljanju okruženjima, metodama autentikacije i naprednim obrascima konfiguracije koji omogućuju učinkovite i sigurne Azure implementacije.

## Ciljevi učenja

Do kraja ove lekcije ćete:
- Savladati hijerarhiju konfiguracije azd-a i razumjeti kako se prioritiziraju postavke
- Učinkovito konfigurirati globalne i projektno specifične postavke
- Upravljati višestrukim okruženjima s različitim konfiguracijama
- Implementirati sigurne obrasce autentikacije i autorizacije
- Razumjeti napredne obrasce konfiguracije za složene scenarije

## Ishodi učenja

Nakon završetka ove lekcije moći ćete:
- Konfigurirati azd za optimalne razvojne tijekove rada
- Postaviti i upravljati višestrukim okruženjima za implementaciju
- Implementirati sigurne prakse upravljanja konfiguracijom
- Rješavati probleme povezane s konfiguracijom
- Prilagoditi ponašanje azd-a za specifične organizacijske zahtjeve

Ovaj opsežni vodič pokriva sve aspekte konfiguriranja Azure Developer CLI za optimalne razvojne i implementacijske tijekove rada.

## Razumijevanje AI agenata u azd projektu

Ako ste novi u AI agentima, evo jednostavan način kako ih shvatiti u svijetu azd-a.

### Što je agent?

Agent je programski dio koji može primiti zahtjev, razmišljati o njemu i poduzeti radnje — često pozivanjem AI modela, pronalaženjem podataka ili pozivanjem drugih usluga. U azd projektu, agent je samo još jedna **usluga** uz vaš web frontend ili API backend.

### Kako agenti pristaju u strukturu azd projekta

azd projekt se sastoji od tri sloja: **infrastruktura**, **kod** i **konfiguracija**. Agenti se integriraju u te slojeve na isti način kao i bilo koja druga usluga:

| Sloj | Što radi za tradicionalnu aplikaciju | Što radi za agenta |
|-------|-------------------------------------|---------------------------|
| **Infrastruktura** (`infra/`) | Obezbjeđuje web aplikaciju i bazu podataka | Obezbjeđuje AI model endpoint, indeks pretraživanja ili host agenata |
| **Kod** (`src/`) | Sadrži vaš frontend i API izvorni kod | Sadrži logiku agenata i definicije promptova |
| **Konfiguracija** (`azure.yaml`) | Navodi vaše usluge i njihove ciljeve hostinga | Navodi vašeg agenta kao uslugu, usmjeravajući na njegov kod i host |

### Uloga `azure.yaml`

Ne trebate sada pamtiti sintaksu. Konceptualno, `azure.yaml` je datoteka u kojoj kažete azd-u: *"Ovo su usluge koje čine moju aplikaciju i ovdje se nalazi njihov kod."*

Kada vaš projekt uključuje AI agenta, `azure.yaml` jednostavno navodi tog agenta kao jednu od usluga. azd tada zna kako osigurati pravu infrastrukturu (kao što je Microsoft Foundry Models endpoint ili Container App za hostanje agenta) i implementirati vaš kod agenta — baš kao što bi to učinio za web aplikaciju ili API.

To znači da nema ničeg fundamentalno novog za naučiti. Ako razumijete kako azd upravlja web uslugom, već shvaćate kako upravlja agentom.

## Hijerarhija konfiguracije

azd ima različite površine konfiguracije, a ne jedan univerzalni sloj:
- **Globalne korisničke postavke**: `~/.azd/config.json`, koje upravlja `azd config`.
- **Definicija projekta**: `azure.yaml` specificira usluge, infrastrukturu i hooks.
- **Izbor lokalnog okruženja**: `.azure/config.json`.
- **Vrijednosti po okruženju**: `.azure/<name>/.env`, koje upravlja `azd env`; dodatne postavke postoje u `config.json` tog okruženja.
- **Zastavice i procesne varijable**: nadjačavaju samo postavke podržane od strane određene naredbe/servisa.

Arbitrarnu vrijednost `azd env set` ne postaje automatski parametar infrastrukture ili postavka implementirane aplikacije. Izričito je referencirajte u parametarskoj datoteci, podržanoj konfiguraciji usluge ili hook-u.

## Globalna konfiguracija

### Postavljanje globalnih zadane postavke
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

### Uobičajene globalne postavke
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

## 🏗️ Konfiguracija projekta

### Struktura azure.yaml
Datoteka `azure.yaml` je srce vašeg azd projekta:

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

Ovo je **primjer definicije projekta**, a ne ponuđeni starter. Izradite navedene izvorišne direktorije, hook skripte, package skripte i odgovarajuće `infra/main.bicep`/`main.parameters.json` prije pokretanja. Baze podataka pripadaju infrastrukturi; `postgres` nije ugrađeni host usluge. Infrastrukturni parametri idu u providersku parametarsku datoteku, a ne u `infra.parameters`.

### Opcije konfiguracije usluga

#### Tipovi hostova
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

#### Jezično specifični hookovi za izgradnju

Sljedeći fragmenti usluga ilustriraju hookove; spojite ih s pravim `project` i `host` svake usluge. `buildCommand` i `startCommand` nisu generička svojstva azd usluge. Konfigurirajte pokretanje u aplikaciji, Dockerfile-u ili infrastrukturi hosta.

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

## 🌟 Upravljanje okruženjima

### Kreiranje okruženja
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfiguracija okruženja
Osnovne vrijednosti okruženja žive u `.azure/<env-name>/.env`, uključujući `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` i `AZURE_LOCATION`. Koristite `azd env config get/set` za dodatne JSON postavke okruženja. Sljedeći JSON je **konceptualno stanje aplikacije**, a ne azd konfiguracijska shema; nemojte ga kopirati u azd datoteke:

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

### Varijable okruženja

**Samo demonstracija u običnom tekstu.** Obične vrijednosti `azd env set` zapisuju se u `.azure/<name>/.env` i mogu se ispisivati read naredbama. Nemojte koristiti primjerni API ključ kao pravi vjerodaj. Za tajne koristite `azd env set-secret` i eksplicitno povezivanje u runtime-u.

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

### Šablone okruženja
Kreirajte **nesekretni, ručno održavani** `.env.example` u korijenu projekta za konzistentno postavljanje. azd ne učitava automatski datoteku nazvanu `env.template`:
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

### Dijeljenje okruženja unutar tima

Kada na projektu radi više osoba, morate se dogovoriti o **onome što putuje s repozitorijem i što ostaje lokalno**. azd čuva svako okruženje unutar `.azure/` mape, a ne sve treba commitati.

**Što je u `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Što gitignorirati.** zadani azd `.gitignore` već isključuje `.azure/`. Ostavite tako — `.env` datoteke mogu sadržavati tajne, a ID resursa specifični su za onoga tko ih je osigurao. Svaki član tima kreira **svako svoje** lokalno okruženje:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Prebacivanje između okruženja.** Programer koji upravlja s nekoliko okruženja bira aktivno prije pokretanja naredbi:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Davanje nesekretnih zadanih vrijednosti timu.** Commitajte `.env.example` izvan ignorirane `.azure/` direktorije. Novi članovi tima kopiraju ga u lokalnu ignoriranu datoteku, popunjavaju vrijednosti i eksplicitno ga uvoze s `azd env set --file <local-file>`. Nikada ne uvozite prazne rezervirane mjesta preko ispravnog okruženja.

**Okruženja u CI/CD-u.** Pipelines ne čitaju vašu lokalnu `.azure/` mapu. Umjesto toga, dostavite vrijednosti okruženja kao pipeline varijable/tajne, a azd ih čita iz procesnog okruženja:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Pravilo palca:** kod infrastrukture (`infra/`, `azure.yaml`) dijeli se u Gitu; *stanje i tajne* (`.azure/`) okoliša su po programeru i po pipelines-u. `azd pipeline config` automatski postavlja varijable za pipeline za vas.

## 🔐 Konfiguracija autentifikacije

### Integracija Azure CLI-ja
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Autentifikacija servisnog glavnog entiteta
Za CI/CD pipelineove:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Upravljani identitet
Za okruženja hostana u Azuru:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Konfiguracija infrastrukture

### Bicep parametri
Konfigurirajte infrastrukturne parametre u `infra/main.parameters.json`:
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

### Terraform konfiguracija
Za Terraform projekte, azd zamjenjuje varijable u `infra/main.tfvars.json`. Ta se imena moraju podudarati s deklariranim Terraform ulaznim varijablama:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Konfiguracija implementacije

### Konfiguracija gradnje
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

### Docker konfiguracija
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
Putanje su relativne prema servisnom projektu. Dockerfile mora deklarirati sve `ARG` vrijednosti koje koristi. Za višestupanjsko sastavljanje, postavite fazu za implementaciju zadnju ili koristite prilagođeni tijek rada pakiranja; `docker.target` nije podržano svojstvo u revidiranoj shemi.

## 🔧 Napredna konfiguracija

### Prilagođeno imenovanje resursa
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Definirajte stvarna imena resursa u Bicep/Terraform i održavajte konzistentnost stvaranja grupe resursa s ovom postavkom. Ne postoje generički `naming.storageAccount` ili `naming.keyVault` ključevi konfiguracije.

### Konfiguracija mreže
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Spojite ove **primjere parametara** u `infra/main.parameters.json` unutar `parameters`, i deklarirajte te parametre i koristite ih u Bicep-u. Sami po sebi ništa ne rade.

### Konfiguracija nadzora
Osigurajte Application Insights i Log Analytics u Bicep/Terraform-u i konfigurirajte telemetry aplikacije u svom SDK-u. Ne postoji generički `monitoring` blok na najvišoj razini u `azure.yaml` koji stvara te resurse. Pogledajte [monitoring infrastructure](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Konfiguracije specifične za okruženje

### Razvojno okruženje
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging okruženje
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produkcijsko okruženje
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validacija konfiguracije

### Validacija konfiguracije
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Skripte za konfiguraciju
Kreirajte skripte za validaciju u `scripts/`:

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

## 🎓 Najbolje prakse

### 1. Koristite varijable okruženja
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Izbjegavajte tvrdokodno unošenje osjetljivih vrijednosti (odvojena ilustrativna konfiguracija, ne drugi `database` ključ u istoj datoteci):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizirajte konfiguracijske datoteke
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

### 3. Razmatranja verzioniranja
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Dokumentacija konfiguracije
Dokumentirajte svoju konfiguraciju u `CONFIG.md`:
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

## 🎯 Vježbe za praktičnu primjenu

### Vježba 1: Konfiguracija za višestruka okruženja (15 minuta)

**Cilj**: Stvoriti i konfigurirati tri lokalna okruženja s različitim vrijednostima. Počnite u inicijaliziranom projektu; koristite neiskorištena imena ako već postoje. Te vrijednosti specifične za aplikaciju ne mijenjaju postavke telemetrije/izvršavanja sve dok ih vaš predložak ne iskoristi.

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

**Kriteriji uspjeha:**
- [ ] Uspješno stvorena tri okruženja
- [ ] Svako okruženje ima jedinstvenu konfiguraciju
- [ ] Moguće je prebacivati se između okruženja bez pogrešaka
- [ ] `azd env list` prikazuje sva tri okruženja

### Vježba 2: Reference tajni u Key Vaultu (10-20 minuta)

**Cilj**: Pohraniti referencu na Key Vault umjesto običnog teksta. **Početna točka:** inicijalizirano okruženje, prijava na Azure i pristup Key Vaultu s dopuštenjima za stvaranje/čitanje lažne tajne. Operacije u Vaultu mogu imati troškove.

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

**Kriteriji uspjeha:**
- [ ] Interaktivna naredba prikazuje odabrani vault i referencu tajne
- [ ] Lokalni `.env` sadrži referencu umjesto lažne tajne
- [ ] Može se objasniti da identitet za izvršenje/RBAC i konzumacija još uvijek moraju biti konfigurirani

**Česti problemi:** 403 zahtijeva ispravnu ulogu na razini podataka vaulta i vrijeme propagacije; `azd env set ... --secret` nije valjana naredba. Obični izlaz `get-values`/`get-value` ne treba pretpostaviti kao cenzuriran. Uklonite referencu za obuku pomoću `azd env unset TRAINING_API_KEY`; to ne briše tajnu u vaultu, koju morate zasebno ukloniti ako ste je vi stvorili.

## Sljedeći koraci

- [Vaš prvi projekt](../chapter-01-foundation/first-project.md) - Primjena konfiguracije u praksi
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) - Korištenje konfiguracije za implementaciju
- [Provisioniranje resursa](../chapter-04-infrastructure/provisioning.md) - Konfiguracije spremne za produkciju

## Reference

- [Referenca za azd konfiguraciju](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml shema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Varijable okruženja](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Navigacija po poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 3 - Konfiguracija i autentifikacija
- **⬅️ Prethodno**: [Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Sljedeće poglavlje**: [Poglavlje 4: Infrastruktura kao kod](../chapter-04-infrastructure/deployment-guide.md)
- **Sljedeća lekcija**: [Autentifikacija i sigurnost](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->