# Konfiguračný sprievodca

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 3 - Konfigurácia a autentifikácia
- **⬅️ Predchádzajúca**: [Váš prvý projekt](first-project.md)
- **➡️ Ďalšia**: [Sprievodca nasadením](../deployment/deployment-guide.md)
- **🚀 Ďalšia kapitola**: [Kapitola 4: Infrastruktúra ako kód](../deployment/deployment-guide.md)

## Úvod

Tento komplexný sprievodca pokrýva všetky aspekty konfigurácie Azure Developer CLI pre optimálne vývojové a nasadzovacie pracovné postupy. Naučíte sa o hierarchii konfigurácie, správe prostredí, metódach autentifikácie a pokročilých konfiguračných vzoroch, ktoré umožňujú efektívne a bezpečné nasadenia v Azure.

## Ciele učenia

Na konci tejto lekcie budete:
- Ovládať hierarchiu konfigurácie azd a rozumieť tomu, ako sú nastavenia prioritizované
- Efektívne konfigurovať globálne a projektovo špecifické nastavenia
- Spravovať viacero prostredí s rôznymi konfiguráciami
- Implementovať bezpečné vzory autentifikácie a autorizácie
- Rozumieť pokročilým konfiguračným vzorom pre komplexné scenáre

## Výsledky učenia

Po dokončení tejto lekcie budete schopní:
- Konfigurovať azd pre optimálne vývojové pracovné postupy
- Nastaviť a spravovať viacero nasadzovacích prostredí
- Implementovať bezpečné praktiky správy konfigurácie
- Riešiť problémy súvisiace s konfiguráciou
- Prispôsobiť správanie azd pre špecifické požiadavky organizácie

Tento komplexný sprievodca pokrýva všetky aspekty konfigurácie Azure Developer CLI pre optimálne vývojové a nasadzovacie pracovné postupy.

## Hierarchia konfigurácie

azd používa hierarchický systém konfigurácie:
1. **Príkazové vlajky** (najvyššia priorita)
2. **Premenné prostredia**
3. **Lokálna projektová konfigurácia** (`.azd/config.json`)
4. **Globálna užívateľská konfigurácia** (`~/.azd/config.json`)
5. **Predvolené hodnoty** (najnižšia priorita)

## Globálna konfigurácia

### Nastavenie globálnych predvolieb
```bash
# Nastaviť predvolené predplatné
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Nastaviť predvolenú lokalitu
azd config set defaults.location "eastus2"

# Nastaviť predvolený názvový konvenciu skupiny zdrojov
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Zobraziť všetky globálne konfigurácie
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

# Nastavenia zabezpečenia
azd config set auth.useAzureCliCredential true     # Použiť Azure CLI na autentifikáciu
azd config set tls.insecure false                  # Vynútiť overenie TLS

# Optimalizácia výkonu
azd config set provision.parallelism 5             # Paralelné vytváranie zdrojov
azd config set deploy.timeout 30m                  # Časový limit nasadenia
```

## 🏗️ Projektová konfigurácia

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
# Vytvorte nové prostredie
azd env new development

# Vytvorte so špecifickou lokalitou
azd env new staging --location "westus2"

# Vytvorte zo šablóny
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfigurácia prostredí
Každé prostredie má svoju vlastnú konfiguráciu v `.azure/<env-name>/config.json`:

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
# (nemalo by nič vrátiť)
```

### Šablóny prostredí
Vytvorte `.azure/env.template` pre konzistentné nastavenie prostredí:
```bash
# Požadované premenné
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Nastavenia aplikácie
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Voliteľné nastavenia vývoja
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Konfigurácia autentifikácie

### Integrácia Azure CLI
```bash
# Použiť predvolené poverenia Azure CLI
azd config set auth.useAzureCliCredential true

# Prihlásiť sa s konkrétnym nájomcom
az login --tenant <tenant-id>

# Nastaviť predvolené predplatné
az account set --subscription <subscription-id>
```

### Autentifikácia pomocou Service Principal
Pre CI/CD pipelines:
```bash
# Nastavte premenné prostredia
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
# Povoliť autentifikáciu spravovanej identity
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Konfigurácia infraštruktúry

### Parametre Bicep
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
Pre projekty Terraform, konfigurujte v `infra/terraform.tfvars`:
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
# Nastavte konvencie pomenovania
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Konfigurácia siete
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Konfigurácia monitorovania
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
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validácia konfigurácie

### Validácia konfigurácie
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

# Overte syntax azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
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

### 3. Zohľadnite verzovanie
```bash
# .gitignore
.azure/*/config.json         # Konfigurácie prostredia (obsahujú identifikátory zdrojov)
.azure/*/.env               # Premenné prostredia (môžu obsahovať tajomstvá)
.env                        # Súbor lokálneho prostredia
```

### 4. Dokumentácia konfigurácie
Dokumentujte svoju konfiguráciu v `CONFIG.md`:
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

**Cieľ**: Vytvorte a nakonfigurujte tri prostredia s rôznymi nastaveniami

```bash
# Vytvorte vývojové prostredie
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Vytvorte testovacie prostredie
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
- [ ] Každé prostredie má unikátnu konfiguráciu
- [ ] Možnosť prepínať medzi prostrediami bez chýb
- [ ] `azd env list` zobrazuje všetky tri prostredia

### Cvičenie 2: Správa tajomstiev (10 minút)

**Cieľ**: Precvičte si bezpečnú konfiguráciu s citlivými údajmi

```bash
# Nastaviť tajomstvá (nezobrazujú sa vo výstupe)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nastaviť nekonfigurované tajomstvá
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Zobraziť prostredie (tajomstvá by mali byť skryté)
azd env get-values

# Overiť, že tajomstvá sú uložené
azd env get DB_PASSWORD  # Malo by ukázať skutočnú hodnotu
```

**Kritériá úspechu:**
- [ ] Tajomstvá uložené bez zobrazenia v termináli
- [ ] `azd env get-values` zobrazuje redigované tajomstvá
- [ ] Individuálne `azd env get <SECRET_NAME>` získava skutočnú hodnotu

## Ďalšie kroky

- [Váš prvý projekt](first-project.md) - Aplikujte konfiguráciu v praxi
- [Sprievodca nasadením](../deployment/deployment-guide.md) - Použite konfiguráciu na nasadenie
- [Provisioning Resources](../deployment/provisioning.md) - Konfigurácie pripravené na produkciu

## Referencie

- [Referenčná príručka konfigurácie azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schéma azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Premenné prostredia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 3 - Konfigurácia a autentifikácia
- **⬅️ Predchádzajúca**: [Váš prvý projekt](first-project.md)
- **➡️ Ďalšia kapitola**: [Kapitola 4: Infrastruktúra ako kód](../deployment/deployment-guide.md)
- **Ďalšia lekcia**: [Váš prvý projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->