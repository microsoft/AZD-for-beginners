# Príručka konfigurácie

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 3 - Konfigurácia a autentifikácia
- **⬅️ Predchádzajúca**: [Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **➡️ Ďalšia**: [Príručka nasadenia](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 4: Infraštruktúra ako kód](../chapter-04-infrastructure/deployment-guide.md)

## Úvod

> Overené voči `azd 1.37.2` (november 2026). Bash príkazy predpokladajú inicializovaný azd projekt. Pokiaľ nie je výslovne uvedené, že ide o kompletný súbor, YAML/Bicep útržky sú fragmenty určené na zlúčenie do zodpovedajúcich projektových súborov, nie samostatné spustiteľné projekty.

Tento komplexný sprievodca pokrýva všetky aspekty konfigurácie Azure Developer CLI pre optimálne vývojové a nasadzovacie pracovné postupy. Naučíte sa o hierarchii konfigurácie, správe prostredí, autentifikačných metódach a pokročilých konfiguračných vzoroch, ktoré umožňujú efektívne a bezpečné nasadenia v Azure.

## Ciele učenia

Na konci tejto lekcie budete:
- Ovládať hierarchiu konfigurácie azd a rozumieť tomu, ako sú nastavenia priorizované
- Efektívne nakonfigurovať globálne a projektovo špecifické nastavenia
- Spravovať viacero prostredí s rôznymi konfiguráciami
- Implementovať bezpečné vzory autentifikácie a autorizácie
- Rozumieť pokročilým konfiguračným vzorcom pre zložité scenáre

## Výsledky učenia

Po dokončení tejto lekcie budete vedieť:
- Konfigurovať azd pre optimálne vývojové pracovné postupy
- Nastaviť a spravovať viacero nasadzovacích prostredí
- Implementovať bezpečné praktiky správy konfigurácie
- Riešiť problémy týkajúce sa konfigurácie
- Prispôsobiť správanie azd pre špecifické organizačné požiadavky

Tento komplexný sprievodca pokrýva všetky aspekty konfigurácie Azure Developer CLI pre optimálne vývojové a nasadzovacie pracovné postupy.

## Pochopenie AI agentov v azd projekte

Ak ste noví v AI agentoch, tu je jednoduchý spôsob, ako ich pochopiť v rámci azd sveta.

### Čo je agent?

Agent je časť softvéru, ktorá dokáže prijímať požiadavku, premýšľať o nej a vykonávať akcie – často volaním AI modelu, vyhľadávaním dát alebo spustením iných služieb. V azd projekte je agent len ďalšou **službou** popri vašom webovom fronte alebo API backende.

### Ako agenti zapadajú do štruktúry azd projektu

azd projekt sa skladá z troch vrstiev: **infraštuktúra**, **kód** a **konfigurácia**. Agenti sa pripájajú do týchto vrstiev rovnako ako akákoľvek iná služba:

| Vrstva | Čo robí pre tradičnú aplikáciu | Čo robí pre agenta |
|-------|-------------------------------------|---------------------------|
| **Infraštuktúra** (`infra/`) | Poskytuje webovú aplikáciu a databázu | Poskytuje endpoint modelu AI, index vyhľadávania alebo hostiteľa agenta |
| **Kód** (`src/`) | Obsahuje váš frontend a API zdrojový kód | Obsahuje logiku agenta a definície promptov |
| **Konfigurácia** (`azure.yaml`) | Zoznam služieb a ich hosťovacie ciele | Zoznam vášho agenta ako služby, odkazujúci na jeho kód a hostiteľa |

### Úloha `azure.yaml`

Nemusíte si práve teraz pamätať syntax. Konceptuálne je `azure.yaml` súbor, kde poviete azd: *"Tu sú služby, ktoré tvoria moju aplikáciu, a tu nájdete ich kód."*

Keď váš projekt obsahuje AI agenta, `azure.yaml` jednoducho uvedie toho agenta ako jednu zo služieb. azd potom vie poskytnúť správnu infraštruktúru (ako napríklad Microsoft Foundry Models endpoint alebo Container App na hosťovanie agenta) a nasadiť váš kód agenta – rovnako ako by to urobil pre webovú aplikáciu alebo API.

To znamená, že nie je potrebné učiť sa nič úplne nové. Ak chápete, ako azd spravuje webovú službu, už rozumiete tomu, ako spravuje agenta.

## Hierarchia konfigurácie

azd má odlišné konfiguračné úrovne, nie jeden univerzálny prekryv:
- **Globálne používateľské preferencie**: `~/.azd/config.json`, spravované `azd config`.
- **Definícia projektu**: `azure.yaml` špecifikuje služby, infraštruktúru a háky.
- **Výber lokálneho prostredia**: `.azure/config.json`.
- **Hodnoty pre jednotlivé prostredia**: `.azure/<name>/.env`, spravované `azd env`; ďalšie nastavenia sú v `config.json` daného prostredia.
- **Prekrytie príznakmi a premennými procesu**: prepíšu iba nastavenia podporované konkrétnym príkazom/providerom.

Hodnota `azd env set` sa automaticky nestane infraštruktúrnym parametrom alebo nastavením nasadenej aplikácie. Výslovne ju odkazujte v súbore parametrov, podporovanej konfiguračnej službe alebo háku.

## Globálna konfigurácia

### Nastavenie globálnych predvolieb
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

### Bežné globálne nastavenia
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

## 🏗️ Konfigurácia projektu

### Štruktúra azure.yaml
Súbor `azure.yaml` je srdcom vášho azd projektu:

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

Toto je **príklad definície projektu**, nie dodávaný štartér. Vytvorte referencované zdrojové adresáre, skripty hákov, skripty balíčkov a zodpovedajúce `infra/main.bicep`/`main.parameters.json` pred jeho spustením. Databázy patria do infraštruktúry; `postgres` nie je vstavaný hostiteľ služby. Parametre infraštruktúry vkladajte do súboru parametrov providera, nie do `infra.parameters`.

### Konfiguračné možnosti služby

#### Typy hostiteľov
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

#### Výstavbové háky špecifické pre jazyk

Nasledujúce útržky služby ilustrujú háky; zlúčte ich s reálnym `project` a `host` každej služby. `buildCommand` a `startCommand` nie sú generické vlastnosti azd služby. Štart konfigurujte v aplikácii, Dockerfile alebo infraštruktúre hostiteľa.

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

## 🌟 Správa prostredí

### Vytváranie prostredí
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfigurácia prostredia
Hlavné hodnoty prostredia sú v `.azure/<env-name>/.env`, vrátane `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` a `AZURE_LOCATION`. Použite `azd env config get/set` pre dodatočné nastavenia prostredia v JSON formáte. Nasledujúci JSON je **konceptuálny stav aplikácie**, nie azd konfiguračné schéma; nekopírujte ho do azd súborov:

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

### Premenné prostredia

**Iba ukážka v čistej forme.** Bežné hodnoty `azd env set` sa zapisujú do `.azure/<name>/.env` a môžu byť vypísané príkazmi na čítanie. Nepoužívajte príkladový API kľúč ako reálnu poverenosť. Pre tajomstvá používajte `azd env set-secret` a explicitné runtime prepojenie.

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

### Šablóny prostredia
Vytvorte **netajný, manuálne udržiavaný** `.env.example` v koreňovom adresári projektu pre konzistentné nastavenie. azd automaticky nenahadzuje súbor s názvom `env.template`:
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

### Zdieľanie prostredí v tíme

Keď na projekte pracuje viac ľudí, musíte sa dohodnúť na tom, **čo sa zdieľa s repozitárom a čo zostáva lokálne**. azd udržiava každé prostredie v adresári `.azure/`, a nie všetko by sa malo commitovať.

**Čo je v `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Čo ignorovať v gite.** Predvolený `.gitignore` azd už vylučuje `.azure/`. Zachovajte to takto – súbory `.env` môžu obsahovať tajomstvá a ID zdrojov sú špecifické pre toho, kto ich poskytol. Každý člen tímu vytvorí **vlastné** lokálne prostredie:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Prepinanie medzi prostrediami.** Vývojár s viacerými prostrediami pred spustením príkazov vyberie aktívne prostredie:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Poskytovanie netajných predvolieb tímu.** Commitnite `.env.example` mimo ignorovaného adresára `.azure/`. Noví členovia si ho skopírujú do lokálne ignorovaného súboru, vyplnia hodnoty a výslovne ho naimportujú pomocou `azd env set --file <local-file>`. Nikdy neimportujte prázdne zástupné symboly cez funkčné prostredie.

**Prostredia v CI/CD.** Pipeline nečíta váš lokálny adresár `.azure/`. Namiesto toho poskytujte hodnoty prostredia ako premenné/tajomstvá pipeline a azd ich načíta z prostredia procesu:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Pravidlo palca:** kód infraštruktúry (`infra/`, `azure.yaml`) sa zdieľa v Gite; *stav prostredia a tajomstvá* (`.azure/`) sú pre každého vývojára a pre každý pipeline. `azd pipeline config` automaticky nastavuje premenné pipeline za vás.

## 🔐 Konfigurácia overovania

### Integrácia Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Overovanie pomocou Service Principal
Pre CI/CD pipelines:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Managed Identity
Pre prostredia hosťované v Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Konfigurácia infraštruktúry

### Bicep parametre
Konfigurujte parametre infraštruktúry v `infra/main.parameters.json`:
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

### Konfigurácia Terraform
Pre projekty Terraform azd nahrádza zástupné symboly v `infra/main.tfvars.json`. Tieto názvy musia zodpovedať deklarovaným vstupným premenným Terraformu:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Konfigurácia nasadenia

### Konfigurácia buildu
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

### Konfigurácia Dockeru
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
 Cesty sú relatívne k projektu služby. Dockerfile musí deklarovať všetky spotrebované hodnoty `ARG`. Pri multi-stage buildu dajte deployovaciu fázu na koniec alebo použite vlastný balíčkovací workflow; `docker.target` nie je podporovanou vlastnosťou v kontrolovanej schéme.

## 🔧 Pokročilá konfigurácia

### Vlastné pomenovanie zdrojov
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Definujte skutočné názvy zdrojov v Bicep/Terraform a zabezpečte konzistenciu vytvárania skupín zdrojov podľa tohto nastavenia. Neexistujú generické kľúče konfigurácie `naming.storageAccount` alebo `naming.keyVault`.

### Sieťová konfigurácia
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Zlúčte tieto **ilustratívne položky parametrov** do `infra/main.parameters.json` pod `parameters`, a deklarujte a použite príslušné parametre v Bicep. Sami o sebe nič nerobia.

### Konfigurácia monitorovania
Zriaďte Application Insights a Log Analytics v Bicep/Terraform a nakonfigurujte telemetriu aplikácie vo vašom SDK. Neblokuje sa vytvorenie týchto zdrojov cez žiadny generický vrcholový blok `monitoring` v `azure.yaml`. Pozrite si [monitorovaciu infraštruktúru](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Konfigurácie špecifické pre prostredia

### Vývojové prostredie
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging prostredie
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produkčné prostredie
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validácia konfigurácie

### Validácia konfigurácie
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Konfiguračné skripty
Vytvorte validačné skripty v `scripts/`:

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

## 🎓 Najlepšie praktiky

### 1. Používajte premenné prostredia
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Vyhnite sa tvrdému zakódovaniu citlivých hodnôt (ilustratívna samostatná konfigurácia, nie druhý kľúč `database` v rovnakom súbore):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizujte konfiguračné súbory
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

### 3. Premýšľajte o verziovacom riadení
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Dokumentácia konfigurácie
Dokumentujte vašu konfiguráciu v `CONFIG.md`:
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

## 🎯 Praktické cvičenia

### Cvičenie 1: Konfigurácia viacerých prostredí (15 minút)

**Cieľ**: Vytvorte a nakonfigurujte tri lokálne prostredia s rôznymi hodnotami. Začnite v inicializovanom projekte; použite nepoužité mená, ak už existujú. Tieto hodnoty špecifické pre aplikáciu nemenia nastavenia telemetrie/spustenia, kým ich váš šablóna nevyužije.

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

**Kritériá úspechu:**
- [ ] Tri prostredia úspešne vytvorené
- [ ] Každé prostredie má jedinečnú konfiguráciu
- [ ] Možnosť prepínať medzi prostrediami bez chýb
- [ ] `azd env list` zobrazuje všetky tri prostredia

### Cvičenie 2: Odkazy na tajomstvá v Key Vault (10-20 minút)

**Cieľ**: Uložte odkaz na Key Vault namiesto čistého textu. **Začiatočný stav:** inicializované prostredie, prihlásenie do Azure a prístup k Key Vault so zásadami na vytvorenie/čítanie testovacieho tajomstva. Operácie so zásobníkom môžu byť spoplatnené.

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

**Kritériá úspechu:**
- [ ] Interaktívny príkaz hlási vybraný zásobník a odkaz na tajomstvo
- [ ] Lokálny `.env` obsahuje odkaz namiesto testovacieho tajomstva
- [ ] Vie sa vysvetliť, že runtime identita/RBAC a spotreba musia byť ešte nakonfigurované

**Bežné problémy:** 403 vyžaduje správnu rolu pre dátovú rovinu zásobníka a čas na propagáciu; `azd env set ... --secret` nie je platný príkaz. Bežné výstupy `get-values`/`get-value` nemožno považovať za skryté. Odstráňte referenciu na školenie pomocou `azd env unset TRAINING_API_KEY`; tým sa neodstráni tajomstvo zo zásobníka, ktoré musíte vyčistiť samostatne, ak ste ho vytvorili.

## Ďalšie kroky

- [Váš prvý projekt](../chapter-01-foundation/first-project.md) - Využitie konfigurácie v praxi
- [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md) - Použitie konfigurácie pre nasadenie
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Konfigurácie pripravené na produkciu

## Referencie

- [azd Konfiguračná referencia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schéma](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Premenné prostredia](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 3 - Konfigurácia a overovanie
- **⬅️ Predchádzajúca**: [Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **➡️ Ďalšia kapitola**: [Kapitola 4: Infraštruktúra ako kód](../chapter-04-infrastructure/deployment-guide.md)
- **Ďalšia lekcia**: [Overovanie a bezpečnosť](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->