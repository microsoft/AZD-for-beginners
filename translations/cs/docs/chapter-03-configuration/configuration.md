# Konfigurační příručka

**Navigace kapitolou:**
- **📚 Domovská stránka kurzu**: [AZD Pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 3 - Konfigurace & Autentizace
- **⬅️ Předchozí**: [Váš první projekt](../chapter-01-foundation/first-project.md)
- **➡️ Další**: [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Další kapitola**: [Kapitola 4: Infrastruktura jako kód](../chapter-04-infrastructure/deployment-guide.md)

## Úvod

> Přezkoumáno vůči `azd 1.37.2` (listopad 2026). Bash příkazy předpokládají inicializovaný azd projekt. Pokud není výslovně uvedeno, že jde o kompletní soubor, YAML/Bicep úryvky jsou fragmenty pro sloučení do odpovídajících souborů projektu, nikoli samostatné spustitelné projekty.

Tato komplexní příručka pokrývá všechny aspekty konfigurace Azure Developer CLI pro optimální vývojové a nasazovací procesy. Naučíte se hierarchii konfigurace, správu prostředí, metody autentizace a pokročilé konfigurační vzory, které umožňují efektivní a bezpečné Azure nasazení.

## Vzdělávací cíle

Na konci této lekce:
- Ovládnete hierarchii konfigurace azd a porozumíte prioritizaci nastavení
- Efektivně nastavíte globální a projektové konfigurace
- Budete spravovat více prostředí s různými konfiguracemi
- Implementujete bezpečné autentizační a autorizací vzory
- Pochopíte pokročilé konfigurační vzory pro složité scénáře

## Výsledky učení

Po dokončení této lekce budete schopni:
- Konfigurovat azd pro optimální vývojové procesy
- Nastavit a spravovat vícero nasazovacích prostředí
- Implementovat bezpečné postupy správy konfigurace
- Řešit problémy související s konfigurací
- Přizpůsobit chování azd specifickým organizačním požadavkům

Tato komplexní příručka pokrývá všechny aspekty konfigurace Azure Developer CLI pro optimální vývojové a nasazovací procesy.

## Pochopení AI agentů v azd projektu

Pokud jste noví v AI agentech, tady je jednoduchý způsob, jak na ně nahlížet ve světě azd.

### Co je agent?

Agent je kus softwaru, který může přijmout požadavek, rozumět mu a jednat – často voláním AI modelu, vyhledáváním dat nebo vyvoláváním jiných služeb. V azd projektu je agent pouze další **službou** vedle vaší webové frontendové nebo API backendové části.

### Jak agenti zapadají do struktury azd projektu

azd projekt se skládá ze tří vrstev: **infrastruktury**, **kódu** a **konfigurace**. Agenti zapojují tyto vrstvy stejným způsobem jako jakákoli jiná služba:

| Vrstva | Co dělá pro tradiční aplikaci | Co dělá pro agenta |
|-------|-------------------------------|--------------------|
| **Infrastruktura** (`infra/`) | Províjí webovou aplikaci a databázi | Províjí endpoint Microsoft Foundry Models, index vyhledávání nebo hostitele agenta |
| **Kód** (`src/`) | Obsahuje váš frontend a zdrojový kód API | Obsahuje logiku agenta a definice promptů |
| **Konfigurace** (`azure.yaml`) | Uvádí vaše služby a jejich hostingové cíle | Uvádí vašeho agenta jako službu, odkazující na jeho kód a hostitele |

### Role `azure.yaml`

Nemusíte si nyní syntax zapamatovat. Konceptuálně je `azure.yaml` soubor, kde říkáte azd: *"Tady jsou služby, které tvoří mou aplikaci, a tady najdete jejich kód."*

Když váš projekt zahrnuje AI agenta, `azure.yaml` jednoduše uvede toho agenta jako jednu ze služeb. azd pak ví, že má vytvořit správnou infrastrukturu (například Microsoft Foundry Models endpoint nebo Container App, který hostí agenta) a nasadit váš agentní kód – stejně jako by to udělal pro webovou aplikaci nebo API.

To znamená, že není nic zásadně nového, co byste se museli učit. Pokud rozumíte, jak azd spravuje webovou službu, už rozumíte, jak spravuje agenta.

## Hierarchie konfigurace

azd má rozlišné konfigurační úrovně, ne jednu univerzální vrstvu:
- **Globální uživatelské preference**: `~/.azd/config.json`, spravovány `azd config`.
- **Definice projektu**: `azure.yaml` uvádí služby, infrastrukturu a hooky.
- **Výběr lokálního prostředí**: `.azure/config.json`.
- **Hodnoty pro jednotlivá prostředí**: `.azure/<name>/.env`, spravováno `azd env`; doplňková nastavení jsou v `config.json` toho prostředí.
- **Flagy a proměnné procesu**: přepisují jen nastavení podporovaná daným příkazem/poskytovatelem.

Libovolná hodnota `azd env set` se automaticky nestane parametrem infrastruktury nebo nastavením nasazené aplikace. Výslovně ji odkažte v parametrizačním souboru, podporované konfiguraci služby nebo hooku.

## Globální konfigurace

### Nastavení globálních výchozích hodnot
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

### Běžná globální nastavení
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

## 🏗️ Konfigurace projektu

### Struktura azure.yaml
Soubor `azure.yaml` je srdcem vašeho azd projektu:

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

Toto je **příklad definice projektu**, nikoli dodaný startér. Vytvořte odkazované zdrojové adresáře, hook skripty, balící skripty a odpovídající `infra/main.bicep`/`main.parameters.json` před spuštěním. Databáze patří do infrastruktury; `postgres` není vestavěný hostitel služby. Parametry infrastruktury patří do parametrizačního souboru poskytovatele, ne do `infra.parameters`.

### Konfigurační možnosti služby

#### Typy hostitelů
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

#### Jazykově specifické build hooky

Následující servisní fragmenty ilustrují hooky; sloučte je se skutečnými `project` a `host` každé služby. `buildCommand` a `startCommand` nejsou obecné vlastnosti azd služeb. Nastavte spuštění v aplikaci, Dockerfile nebo infrastruktuře hostitele.

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

## 🌟 Správa prostředí

### Vytváření prostředí
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfigurace prostředí
Základní hodnoty prostředí jsou v `.azure/<env-name>/.env`, včetně `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` a `AZURE_LOCATION`. Pro doplňková JSON nastavení prostředí používejte `azd env config get/set`. Následující JSON je **konceptuální stav aplikace**, nikoli azd konfigurační schéma; nekopírujte jej do souborů azd:

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

### Proměnné prostředí

**Pouze demonstrační plaintext.** Běžné hodnoty `azd env set` jsou uloženy v `.azure/<name>/.env` a lze je vypsat příkazy read. Nepoužívejte ukázkový API klíč jako skutečné pověření. Pro tajemství používejte `azd env set-secret` a explicitní runtime propojení.

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

### Šablony prostředí
Vytvořte **neverejnou, ručně spravovanou** `.env.example` v kořeni projektu pro konzistentní nastavení. azd automaticky nenačítá soubor pojmenovaný `env.template`:
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

### Sdílení prostředí v týmu

Pokud na projektu pracuje více lidí, je třeba si dohodnout, **co putuje s repozitářem a co zůstává lokální**. azd ukládá každé prostředí do složky `.azure/` a ne vše by mělo být zařazeno do verzování.

**Co je v `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Co ignorovat v gitu.** Výchozí `.gitignore` azd už vylučuje `.azure/`. Nechte to tak – soubory `.env` mohou obsahovat tajemství a identifikátory zdrojů jsou specifické pro toho, kdo je vytvořil. Každý člen týmu si vytváří **vlastní** lokální prostředí:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Přepínání mezi prostředími.** Vývojář spravující několik prostředí si vybere aktivní před spuštěním příkazů:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Poskytování neverejných výchozích hodnot týmu.** Zařaďte `.env.example` mimo ignorovaný `.azure/` adresář. Noví členové týmu si jej zkopírují do lokálního ignorovaného souboru, doplní hodnoty a explicitně importují pomocí `azd env set --file <local-file>`. Nikdy neimportujte prázdné zástupné symboly přes funkční prostředí.

**Prostředí v CI/CD.** Pipeline nečtou váš lokální `.azure/` adresář. Místo toho poskytněte hodnoty prostředí jako proměnné/tajemství pipeline a azd je načte z prostředí procesu:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Pravidlo:** kód infrastruktury (`infra/`, `azure.yaml`) se sdílí v gitu; *stav a tajemství prostředí* (`.azure/`) jsou na vývojáře a pipeline. `azd pipeline config` vám automaticky nastaví pipeline proměnné.

## 🔐 Konfigurace autentizace

### Integrace s Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Autentizace pomocí Service Principal
Pro CI/CD pipeline:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Spravovaná identita
Pro prostředí hostovaná v Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Konfigurace infrastruktury

### Parametry Bicep
Konfigurujte parametry infrastruktury v `infra/main.parameters.json`:
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

### Konfigurace Terraform
Pro Terraform projekty azd nahrazuje zástupné symboly v `infra/main.tfvars.json`. Tyto názvy musí odpovídat deklarovaným vstupním proměnným Terraformu:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Konfigurace nasazení

### Konfigurace buildu
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

### Konfigurace Dockeru
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
 Cesty jsou relativní k projektu služby. Dockerfile musí deklarovat jakékoli `ARG` hodnoty, které spotřebovává. Pro vícefázový build dejte deployovatelnou fázi poslední nebo použijte vlastní balící workflow; `docker.target` není podporovaná vlastnost ve zkoumaném schématu.

## 🔧 Pokročilá konfigurace

### Vlastní pojmenování zdrojů
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Definujte skutečná jména zdrojů v Bicep/Terraform a zachovejte konzistenci tvorby resource group podle tohoto nastavení. Neexistují generické konfigurační klíče `naming.storageAccount` nebo `naming.keyVault`.

### Konfigurace sítě
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Sloučte tyto **ilustrativní položky parametrů** do `infra/main.parameters.json` pod `parameters` a deklarujte a spotřebujte odpovídající parametry v Bicep. Sami o sobě nic nedělají.

### Konfigurace monitoringu
Províjejte Application Insights a Log Analytics v Bicep/Terraform a nakonfigurujte telemetrii aplikace v SDK. Neexistuje žádný generický vrcholový `monitoring` blok v `azure.yaml`, který by tyto zdroje vytvářel. Viz [monitoring infrastruktury](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Konfigurace specifické pro prostředí

### Vývojové prostředí
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging prostředí
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produkční prostředí
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validace konfigurace

### Validace konfigurace
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Konfigurační skripty
Vytvořte validační skripty v `scripts/`:

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

## 🎓 Doporučené postupy

### 1. Používejte proměnné prostředí
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Vyhněte se tvrdému zakódování citlivých hodnot (ilustrativní samostatná konfigurace, ne druhý `database` klíč ve stejném souboru):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizujte konfigurační soubory
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

### 3. Úvahy ohledně verzovacího systému
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Dokumentace konfigurace
Dokumentujte svou konfiguraci v `CONFIG.md`:
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

## 🎯 Praktické cvičení

### Cvičení 1: Konfigurace více prostředí (15 minut)

**Cíl**: Vytvořit a nakonfigurovat tři lokální prostředí s odlišnými hodnotami. Začněte v inicializovaném projektu; použijte nepoužitá jména, pokud už existují. Tyto specifické hodnoty aplikace nemění telemetrii/nastavení běhu, dokud je vaše šablona nespotřebuje.

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

**Kritéria úspěchu:**
- [ ] Vytvořena tři prostředí
- [ ] Každé prostředí má unikátní konfiguraci
- [ ] Lze přepínat mezi prostředími bez chyb
- [ ] `azd env list` zobrazuje všechna tři prostředí

### Cvičení 2: Odkazy na tajemství Key Vault (10-20 minut)

**Cíl**: Uložit odkaz na Key Vault místo plaintextu. **Výchozí stav:** inicializované prostředí, přihlášení do Azure a přístup k Key Vault s oprávněními pro vytvoření/čtení testovacího tajemství. Operace vaultu mohou být zpoplatněny.

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

**Kritéria úspěchu:**
- [ ] Interaktivní příkaz hlásí vybraný vault a odkaz na tajemství
- [ ] Lokální `.env` obsahuje odkaz místo testovacího tajemství
- [ ] Dokáže vysvětlit nutnost konfigurace runtime identity/RBAC a spotřeby

**Běžné problémy:** 403 vyžaduje správnou roli datové roviny vaultu a čas potřebný na propagaci; `azd env set ... --secret` není platný příkaz. Nelze předpokládat, že standardní `get-values`/`get-value` výstup je redigovaný. Odstraňte tréninkový odkaz pomocí `azd env unset TRAINING_API_KEY`; to nezmaže tajemství vaultu, které musíte vyčistit samostatně, pokud jste jej vytvořili.

## Další kroky

- [Váš první projekt](../chapter-01-foundation/first-project.md) - Praktická aplikace konfigurace
- [Průvodce nasazením](../chapter-04-infrastructure/deployment-guide.md) - Použití konfigurace pro nasazení
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Produkčně připravené konfigurace

## Reference

- [Referenční dokumentace konfigurace azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schéma azure.yaml](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Proměnné prostředí](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Navigace kapitolou:**
- **📚 Domov kurzu**: [AZD Pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 3 - Konfigurace a autentizace
- **⬅️ Předchozí**: [Váš první projekt](../chapter-01-foundation/first-project.md)
- **➡️ Další kapitola**: [Kapitola 4: Infrastruktura jako kód](../chapter-04-infrastructure/deployment-guide.md)
- **Další lekce**: [Autentizace a bezpečnost](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->