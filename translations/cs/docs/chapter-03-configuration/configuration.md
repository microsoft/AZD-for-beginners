# Průvodce konfigurací

**Navigace kapitolou:**
- **📚 Course Home**: [AZD pro začátečníky](../../README.md)
- **📖 Current Chapter**: Kapitola 3 - Konfigurace a ověřování
- **⬅️ Previous**: [Váš první projekt](first-project.md)
- **➡️ Next**: [Příručka nasazení](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Kapitola 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Úvod

Tento obsáhlý průvodce pokrývá všechny aspekty konfigurace Azure Developer CLI pro optimální vývojové a nasazovací pracovní postupy. Naučíte se o hierarchii konfigurace, správě prostředí, metodách autentizace a pokročilých vzorech konfigurace, které umožňují efektivní a bezpečné nasazování do Azure.

## Cíle učení

Po absolvování této lekce budete:
- Zvládnete hierarchii konfigurace azd a pochopíte, jak jsou nastavení prioritizována
- Efektivně nakonfigurujete globální a projektově specifická nastavení
- Spravovat více prostředí s různými konfiguracemi
- Implementovat bezpečné vzory autentizace a autorizace
- Pochopíte pokročilé konfigurační vzory pro složité scénáře

## Výsledky učení

Po dokončení této lekce budete schopni:
- Nakonfigurovat azd pro optimální vývojové pracovní postupy
- Nastavit a spravovat více nasazovacích prostředí
- Implementovat bezpečné postupy správy konfigurací
- Řešit problémy související s konfigurací
- Přizpůsobit chování azd pro konkrétní organizační požadavky

Tento obsáhlý průvodce pokrývá všechny aspekty konfigurace Azure Developer CLI pro optimální vývojové a nasazovací pracovní postupy.

## Hierarchie konfigurace

azd používá hierarchický konfigurační systém:
1. **Command-line flags** (nejvyšší priorita)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (nejnižší priorita)

## Globální konfigurace

### Nastavení globálních výchozích hodnot
```bash
# Nastavit výchozí předplatné
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Nastavit výchozí umístění
azd config set defaults.location "eastus2"

# Nastavit výchozí konvenci pojmenovávání skupin prostředků
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Zobrazit všechna globální nastavení
azd config list

# Odstranit konfiguraci
azd config unset defaults.location
```

### Běžná globální nastavení
```bash
# Předvolby vývoje
azd config set alpha.enable true                    # Povolit alfa funkce
azd config set telemetry.enabled false             # Zakázat telemetrii
azd config set output.format json                  # Nastavit formát výstupu

# Bezpečnostní nastavení
azd config set auth.useAzureCliCredential true     # Použít Azure CLI pro autentizaci
azd config set tls.insecure false                  # Vynutit ověření TLS

# Ladění výkonu
azd config set provision.parallelism 5             # Paralelní vytváření zdrojů
azd config set deploy.timeout 30m                  # Časový limit nasazení
```

## 🏗️ Konfigurace projektu

### Struktura azure.yaml
Soubor `azure.yaml` je srdcem vašeho projektu azd:

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

### Možnosti konfigurace služby

#### Typy hostů
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

#### Nastavení specifická pro jazyky
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

## 🌟 Správa prostředí

### Vytváření prostředí
```bash
# Vytvořit nové prostředí
azd env new development

# Vytvořit se specifickým umístěním
azd env new staging --location "westus2"

# Vytvořit z šablony
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfigurace prostředí
Každé prostředí má vlastní konfiguraci v `.azure/<env-name>/config.json`:

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
```bash
# Nastavte proměnné specifické pro prostředí
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Zobrazte proměnné prostředí
azd env get-values

# Očekávaný výstup:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Odstraňte proměnnou prostředí
azd env unset DEBUG

# Ověřte odstranění
azd env get-values | grep DEBUG
# (nemělo by nic vrátit)
```

### Šablony prostředí
Vytvořte `.azure/env.template` pro konzistentní nastavení prostředí:
```bash
# Povinné proměnné
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Nastavení aplikace
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Volitelné nastavení pro vývoj
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Konfigurace autentizace

### Integrace s Azure CLI
```bash
# Použijte přihlašovací údaje Azure CLI (výchozí)
azd config set auth.useAzureCliCredential true

# Přihlásit se s konkrétním tenantem
az login --tenant <tenant-id>

# Nastavit výchozí předplatné
az account set --subscription <subscription-id>
```

### Autentizace pomocí Service Principal
Pro CI/CD pipeliney:
```bash
# Nastavte proměnné prostředí
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Nebo nakonfigurujte přímo
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Spravovaná identita
Pro prostředí hostovaná v Azure:
```bash
# Povolit autentizaci spravované identity
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Konfigurace infrastruktury

### Parametry Bicep
Nakonfigurujte parametry infrastruktury v `infra/main.parameters.json`:
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
Pro projekty Terraform nakonfigurujte v `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Konfigurace nasazení

### Konfigurace sestavení
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

### Konfigurace Dockeru
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
Příklad `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Pokročilá konfigurace

### Vlastní pojmenování prostředků
```bash
# Nastavte konvence pojmenování
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Konfigurace sítě
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Konfigurace monitoringu
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

## 🎯 Konfigurace specifické pro prostředí

### Vývojové prostředí
```bash
# .azure/vývoj/.env
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

### Validovat konfiguraci
```bash
# Zkontrolujte syntaxi konfigurace
azd config validate

# Otestujte proměnné prostředí
azd env get-values

# Ověřte infrastrukturu
azd provision --dry-run
```

### Skripty pro konfiguraci
Vytvořte validační skripty v `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Zkontrolujte požadované proměnné prostředí
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ověřte syntaxi souboru azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Nejlepší postupy

### 1. Používejte proměnné prostředí
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizujte konfigurační soubory
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

### 3. Úvahy ohledně verzování
```bash
# .gitignore
.azure/*/config.json         # Konfigurace prostředí (obsahují ID zdrojů)
.azure/*/.env               # Proměnné prostředí (mohou obsahovat tajné údaje)
.env                        # Lokální soubor prostředí
```

### 4. Dokumentace konfigurace
Zdokumentujte svou konfiguraci v `CONFIG.md`:
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

## 🎯 Praktická cvičení

### Cvičení 1: Konfigurace pro více prostředí (15 minut)

**Cíl**: Vytvořit a nakonfigurovat tři prostředí s různými nastaveními

```bash
# Vytvořit vývojové prostředí
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Vytvořit předprodukční prostředí
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Vytvořit produkční prostředí
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Ověřit každé prostředí
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Kritéria úspěchu:**
- [ ] Tři prostředí úspěšně vytvořena
- [ ] Každé prostředí má jedinečnou konfiguraci
- [ ] Lze přepínat mezi prostředími bez chyb
- [ ] `azd env list` zobrazuje všechna tři prostředí

### Cvičení 2: Správa tajemství (10 minut)

**Cíl**: Procvičit bezpečnou konfiguraci s citlivými daty

```bash
# Nastavte tajné údaje (nebudou zobrazeny ve výstupu)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nastavte netajnou konfiguraci
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Zobrazit prostředí (tajné údaje by měly být skryty)
azd env get-values

# Ověřte, že jsou tajné údaje uloženy
azd env get DB_PASSWORD  # Mělo by zobrazit skutečnou hodnotu
```

**Kritéria úspěchu:**
- [ ] Tajemství uložena bez zobrazení v terminálu
- [ ] `azd env get-values` zobrazuje redigovaná tajemství
- [ ] Jednotlivý příkaz `azd env get <SECRET_NAME>` vrátí skutečnou hodnotu

## Další kroky

- [Váš první projekt](first-project.md) - Použijte konfiguraci v praxi
- [Příručka nasazení](../chapter-04-infrastructure/deployment-guide.md) - Použijte konfiguraci pro nasazení
- [Nasazení zdrojů](../chapter-04-infrastructure/provisioning.md) - Konfigurace připravené pro produkci

## Odkazy

- [Reference konfigurace azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schéma azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Proměnné prostředí](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigace kapitolou:**
- **📚 Course Home**: [AZD pro začátečníky](../../README.md)
- **📖 Current Chapter**: Kapitola 3 - Konfigurace a ověřování
- **⬅️ Previous**: [Váš první projekt](first-project.md)
- **➡️ Next Chapter**: [Kapitola 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Váš první projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí AI překladatelské služby Co-op Translator (https://github.com/Azure/co-op-translator). Ačkoli usilujeme o přesnost, mějte na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakákoliv nedorozumění nebo nesprávné výklady vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->