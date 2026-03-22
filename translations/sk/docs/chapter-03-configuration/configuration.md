# Konfiguračný sprievodca

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 3 - Konfigurácia a autentifikácia
- **⬅️ Predchádzajúca**: [Váš prvý projekt](first-project.md)
- **➡️ Ďalšia**: [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 4: Infrastruktúra ako kód](../chapter-04-infrastructure/deployment-guide.md)

## Úvod

Tento komplexný sprievodca pokrýva všetky aspekty konfigurácie Azure Developer CLI pre optimálne vývojové a nasadzovacie pracovné postupy. Naučíte sa o hierarchii konfigurácie, správe prostredí, metódach autentifikácie a pokročilých konfiguračných vzoroch, ktoré umožňujú efektívne a bezpečné nasadzovanie do Azure.

## Ciele učenia

Na konci tejto lekcie budete:
- Ovládať hierarchiu konfigurácie azd a rozumieť, ako sú nastavenia uprednostňované
- Efektívne konfigurovať globálne a projektovo špecifické nastavenia
- Spravovať viaceré prostredia s rôznymi konfiguráciami
- Implementovať bezpečné vzory autentifikácie a autorizácie
- Rozumieť pokročilým konfiguračným vzorcom pre zložité scenáre

## Výsledky učenia

Po absolvovaní tejto lekcie budete vedieť:
- Konfigurovať azd pre optimálne vývojové pracovné postupy
- Nastaviť a spravovať viacero nasadzovacích prostredí
- Implementovať bezpečné postupy správy konfigurácie
- Riešiť problémy súvisiace s konfiguráciou
- Prispôsobiť správanie azd pre špecifické požiadavky organizácie

Tento komplexný sprievodca pokrýva všetky aspekty konfigurácie Azure Developer CLI pre optimálne vývojové a nasadzovacie pracovné postupy.

## Pochopenie AI agentov v azd projekte

Ak ste noví v oblasti AI agentov, tu je jednoduchý spôsob, ako o nich premýšľať v kontexte azd.

### Čo je agent?

Agent je kus softvéru, ktorý môže prijať požiadavku, premyslieť ju a vykonať akcie — často volaním AI modelu, vyhľadávaním dát alebo vyvolaním iných služieb. V azd projekte je agent len ďalšia **služba** vedľa vášho webového frontendu alebo API backendu.

### Ako agenti zapadajú do štruktúry azd projektu

azd projekt sa skladá z troch vrstiev: **infrastruktúra**, **kód** a **konfigurácia**. Agenti sa pripájajú do týchto vrstiev rovnakým spôsobom ako každá iná služba:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Provisionuje webovú aplikáciu a databázu | Provisionuje endpoint modelu AI, vyhľadávací index alebo hostiteľa agenta |
| **Code** (`src/`) | Obsahuje váš frontend a zdrojový kód API | Obsahuje logiku agenta a definície promptov |
| **Configuration** (`azure.yaml`) | Zoznam vašich služieb a ich hostingových cieľov | Zoznam agenta ako služby, odkazujúci na jeho kód a hostiteľa |

### Úloha `azure.yaml`

Nemusíte si teraz pamätať syntax naspamäť. Konceptuálne je `azure.yaml` súbor, v ktorom hovoríte azd: *"Tu sú služby, ktoré tvoria moju aplikáciu, a tu nájdete ich kód."*

Keď váš projekt obsahuje AI agenta, `azure.yaml` jednoducho uvedie tohto agenta ako jednu zo služieb. azd potom vie provisionovať správnu infraštruktúru (napríklad Microsoft Foundry Models endpoint alebo Container App na hosťovanie agenta) a nasadiť váš kód agenta — rovnako ako by to urobil pre webovú aplikáciu alebo API.

To znamená, že nie je nič zásadne nové na učenie. Ak rozumiete, ako azd spravuje webovú službu, už rozumiete, ako spravuje aj agenta.

## Hierarchia konfigurácie

azd používa hierarchický konfiguračný systém:
1. **Prepínače príkazového riadku** (najvyššia priorita)
2. **Premenné prostredia**
3. **Lokálna projektová konfigurácia** (`.azd/config.json`)
4. **Globálna používateľská konfigurácia** (`~/.azd/config.json`)
5. **Predvolené hodnoty** (najnižšia priorita)

## Globálna konfigurácia

### Nastavenie globálnych predvolieb
```bash
# Nastaviť predvolené predplatné
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Nastaviť predvolené umiestnenie
azd config set defaults.location "eastus2"

# Nastaviť predvolenú konvenciu pomenovania skupín prostriedkov
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Zobraziť všetku globálnu konfiguráciu
azd config list

# Odstrániť konfiguráciu
azd config unset defaults.location
```

### Bežné globálne nastavenia
```bash
# Preferencie vývoja
azd config set alpha.enable true                    # Povoliť alfa funkcie
azd config set telemetry.enabled false             # Zakázať telemetriu
azd config set output.format json                  # Nastaviť formát výstupu

# Bezpečnostné nastavenia
azd config set auth.useAzureCliCredential true     # Použiť Azure CLI na autentifikáciu
azd config set tls.insecure false                  # Vynútiť overenie TLS

# Ladenie výkonu
azd config set provision.parallelism 5             # Paralelné vytváranie zdrojov
azd config set deploy.timeout 30m                  # Časový limit nasadenia
```

## 🏗️ Konfigurácia projektu

### Štruktúra azure.yaml
Súbor `azure.yaml` je srdcom vášho azd projektu:

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

### Možnosti konfigurácie služieb

#### Typy hostingu
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

#### Nastavenia špecifické pre jazyk
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

## 🌟 Správa prostredí

### Vytváranie prostredí
```bash
# Vytvoriť nové prostredie
azd env new development

# Vytvoriť s konkrétnym umiestnením
azd env new staging --location "westus2"

# Vytvoriť z šablóny
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfigurácia prostredia
Každé prostredie má vlastnú konfiguráciu v `.azure/<env-name>/config.json`:

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
```bash
# Nastaviť premenné špecifické pre prostredie
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Zobraziť premenné prostredia
azd env get-values

# Očakávaný výstup:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Odstrániť premennú prostredia
azd env unset DEBUG

# Overiť odstránenie
azd env get-values | grep DEBUG
# (nemalo by vrátiť nič)
```

### Šablóny prostredí
Vytvorte `.azure/env.template` pre konzistentné nastavenie prostredia:
```bash
# Požadované premenné
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Nastavenia aplikácie
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Voliteľné nastavenia pre vývoj
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Konfigurácia autentifikácie

### Integrácia Azure CLI
```bash
# Použiť prihlasovacie údaje Azure CLI (predvolené)
azd config set auth.useAzureCliCredential true

# Prihlásiť sa s konkrétnym tenantom
az login --tenant <tenant-id>

# Nastaviť predvolené predplatné
az account set --subscription <subscription-id>
```

### Autentifikácia služobným princípom
Pre CI/CD pipeline:
```bash
# Nastaviť premenné prostredia
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Alebo nakonfigurujte priamo
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Spravovaná identita
Pre prostredia hostované v Azure:
```bash
# Povoliť overenie spravovanej identity
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Konfigurácia infraštruktúry

### Parametre Bicep
Konfigurujte infra parametre v `infra/main.parameters.json`:
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

### Konfigurácia Terraformu
Pre Terraform projekty, konfigurujte v `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Konfigurácia nasadenia

### Konfigurácia buildu
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

### Konfigurácia Dockeru
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
Príklad `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Pokročilá konfigurácia

### Vlastné pomenovanie zdrojov
```bash
# Nastaviť pravidlá pomenovávania
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Sieťová konfigurácia
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Konfigurácia monitoringu
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

## 🎯 Konfigurácie špecifické pre prostredie

### Vývojové prostredie
```bash
# .azure/vývoj/.env
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
# .azure/produkcia/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validácia konfigurácie

### Overenie konfigurácie
```bash
# Skontrolujte syntax konfigurácie
azd config validate

# Otestujte premenné prostredia
azd env get-values

# Overte infraštruktúru
azd provision --dry-run
```

### Konfiguračné skripty
Vytvorte validačné skripty v `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Skontrolujte požadované premenné prostredia
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Overte syntaktiku súboru azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Najlepšie postupy

### 1. Používajte premenné prostredia
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizujte konfiguračné súbory
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

### 3. Zásady verzovania
```bash
# .gitignore
.azure/*/config.json         # Konfigurácie prostredia (obsahujú ID zdrojov)
.azure/*/.env               # Premenné prostredia (môžu obsahovať tajné údaje)
.env                        # Lokálny súbor prostredia
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

## 🎯 Cvičenia na precvičenie

### Cvičenie 1: Konfigurácia pre viacero prostredí (15 minút)

**Cieľ**: Vytvoriť a nakonfigurovať tri prostredia s rôznymi nastaveniami

```bash
# Vytvorte vývojové prostredie
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Vytvorte predprodukčné prostredie
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Vytvorte produkčné prostredie
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Overte každé prostredie
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Kritériá úspechu:**
- [ ] Tri prostredia úspešne vytvorené
- [ ] Každé prostredie má jedinečnú konfiguráciu
- [ ] Možnosť prepínať medzi prostrediami bez chýb
- [ ] `azd env list` zobrazuje všetky tri prostredia

### Cvičenie 2: Správa tajomstiev (10 minút)

**Cieľ**: Precvičiť bezpečnú konfiguráciu citlivých údajov

```bash
# Nastaviť tajomstvá (v výstupe sa nezobrazia)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nastaviť konfiguráciu, ktorá nie je tajná
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Zobraziť prostredie (tajomstvá by mali byť zacenzurované)
azd env get-values

# Overiť, že tajomstvá sú uložené
azd env get DB_PASSWORD  # Malo by zobraziť skutočnú hodnotu
```

**Kritériá úspechu:**
- [ ] Tajomstvá uložené bez zobrazovania v termináli
- [ ] `azd env get-values` zobrazuje redigované tajomstvá
- [ ] Jednotlivé `azd env get <SECRET_NAME>` získavajú skutočnú hodnotu

## Ďalšie kroky

- [Váš prvý projekt](first-project.md) - Aplikujte konfiguráciu v praxi
- [Sprievodca nasadením](../chapter-04-infrastructure/deployment-guide.md) - Použite konfiguráciu pre nasadenie
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Produkčné konfigurácie pripravené na nasadenie

## Referencie

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 3 - Konfigurácia a autentifikácia
- **⬅️ Predchádzajúca**: [Váš prvý projekt](first-project.md)
- **➡️ Nasledujúca kapitola**: [Kapitola 4: Infrastruktúra ako kód](../chapter-04-infrastructure/deployment-guide.md)
- **Ďalšia lekcia**: [Váš prvý projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tento dokument bol preložený pomocou služby prekladu založenej na AI [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny preklad vykonaný človekom. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->