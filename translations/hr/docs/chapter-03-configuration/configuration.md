# Vodič za konfiguraciju

**Chapter Navigation:**
- **📚 Početna tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 3 - Konfiguracija i autentikacija
- **⬅️ Previous**: [Vaš prvi projekt](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Poglavlje 4: Infrastruktura kao kod](../chapter-04-infrastructure/deployment-guide.md)

## Uvod

Ovaj sveobuhvatni vodič pokriva sve aspekte konfiguriranja Azure Developer CLI za optimalne tijekove razvoja i implementacije. Naučit ćete o hijerarhiji konfiguracije, upravljanju okruženjima, metodama autentikacije i naprednim obrascima konfiguracije koji omogućuju učinkovite i sigurne Azure implementacije.

## Ciljevi učenja

Do kraja ove lekcije ćete:
- Ovladati azd hijerarhijom konfiguracije i razumjeti kako su postavke prioritetizirane
- Učinkovito konfigurirati globalne i projekt-specifične postavke
- Upravljati višestrukim okruženjima s različitim konfiguracijama
- Implementirati sigurne obrasce autentikacije i autorizacije
- Razumjeti napredne obrasce konfiguracije za složene scenarije

## Ishodi učenja

Nakon dovršetka ove lekcije, moći ćete:
- Konfigurirati azd za optimalne razvojne tijekove
- Postaviti i upravljati višestrukim okruženjima za implementaciju
- Implementirati sigurnu praksu upravljanja konfiguracijom
- Rješavati probleme povezane s konfiguracijom
- Prilagoditi ponašanje azd za specifične zahtjeve organizacije

Ovaj sveobuhvatni vodič pokriva sve aspekte konfiguriranja Azure Developer CLI za optimalne tijekove razvoja i implementacije.

## Hijerarhija konfiguracije

azd koristi hijerarhijski sustav konfiguracije:
1. **Zastavice naredbenog retka** (najveći prioritet)
2. **Varijable okruženja**
3. **Lokalna projektna konfiguracija** (`.azd/config.json`)
4. **Globalna korisnička konfiguracija** (`~/.azd/config.json`)
5. **Zadane vrijednosti** (najniži prioritet)

## Globalna konfiguracija

### Postavljanje globalnih zadanih vrijednosti
```bash
# Postavi zadanu pretplatu
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Postavi zadanu lokaciju
azd config set defaults.location "eastus2"

# Postavi zadanu konvenciju imenovanja grupe resursa
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Prikaži svu globalnu konfiguraciju
azd config list

# Ukloni konfiguraciju
azd config unset defaults.location
```

### Uobičajene globalne postavke
```bash
# Preferencije razvoja
azd config set alpha.enable true                    # Omogući alfa značajke
azd config set telemetry.enabled false             # Onemogući telemetriju
azd config set output.format json                  # Postavi izlazni format

# Sigurnosne postavke
azd config set auth.useAzureCliCredential true     # Koristi Azure CLI za autentifikaciju
azd config set tls.insecure false                  # Nametni provjeru TLS-a

# Podešavanje performansi
azd config set provision.parallelism 5             # Paralelno kreiranje resursa
azd config set deploy.timeout 30m                  # Vremensko ograničenje raspoređivanja
```

## 🏗️ Konfiguracija projekta

### Struktura azure.yaml
Datoteka `azure.yaml` je srce vašeg azd projekta:

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

### Opcije konfiguracije servisa

#### Tipovi hosta
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

#### Postavke specifične za jezik
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

## 🌟 Upravljanje okruženjima

### Kreiranje okruženja
```bash
# Stvori novo okruženje
azd env new development

# Stvori s određenom lokacijom
azd env new staging --location "westus2"

# Stvori iz predloška
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfiguracija okruženja
Svako okruženje ima vlastitu konfiguraciju u `.azure/<env-name>/config.json`:

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
```bash
# Postavi varijable specifične za okruženje
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Prikaži varijable okruženja
azd env get-values

# Očekivani izlaz:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Ukloni varijablu okruženja
azd env unset DEBUG

# Provjeri uklanjanje
azd env get-values | grep DEBUG
# (ne bi trebalo vratiti ništa)
```

### Predlošci okruženja
Kreirajte `.azure/env.template` za dosljedno postavljanje okruženja:
```bash
# Obvezne varijable
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Postavke aplikacije
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Neobavezne postavke za razvoj
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Konfiguracija autentikacije

### Integracija s Azure CLI
```bash
# Koristite Azure CLI vjerodajnice (zadano)
azd config set auth.useAzureCliCredential true

# Prijavite se s određenim tenantom
az login --tenant <tenant-id>

# Postavite zadanu pretplatu
az account set --subscription <subscription-id>
```

### Autentikacija servisnog principala
Za CI/CD pipeline-ove:
```bash
# Postavite varijable okruženja
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Ili konfigurirajte izravno
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Upravljani identitet
Za okruženja hostana na Azureu:
```bash
# Omogućite autentifikaciju upravljanog identiteta
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Konfiguracija infrastrukture

### Parametri za Bicep
Konfigurirajte parametre infrastrukture u `infra/main.parameters.json`:
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

### Konfiguracija Terraform-a
Za Terraform projekte, konfigurirajte u `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Konfiguracija implementacije

### Konfiguracija izgradnje
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

### Konfiguracija Dockera
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
Primjer `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Napredna konfiguracija

### Prilagođeno imenovanje resursa
```bash
# Postavite konvencije imenovanja
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Konfiguracija mreže
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Konfiguracija nadzora
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

## 🎯 Konfiguracije specifične za okruženje

### Razvojno okruženje
```bash
# .azure/razvoj/.env
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
# Provjeri sintaksu konfiguracije
azd config validate

# Testiraj varijable okruženja
azd env get-values

# Validiraj infrastrukturu
azd provision --dry-run
```

### Skripte za konfiguraciju
Kreirajte skripte za validaciju u `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Provjeri potrebne varijable okruženja
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validiraj sintaksu azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
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

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizirajte konfiguracijske datoteke
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

### 3. Razmatranja vezana uz kontrolu verzija
```bash
# .gitignore
.azure/*/config.json         # Konfiguracije okruženja (sadrže identifikatore resursa)
.azure/*/.env               # Varijable okruženja (mogu sadržavati tajne)
.env                        # Lokalna datoteka okruženja
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

## 🎯 Praktične vježbe

### Vježba 1: Konfiguracija za više okruženja (15 minuta)

**Cilj**: Kreirati i konfigurirati tri okruženja s različitim postavkama

```bash
# Kreiraj razvojno okruženje
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Kreiraj pripremno okruženje
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Kreiraj produkcijsko okruženje
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Provjeri svako okruženje
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Kriteriji uspjeha:**
- [ ] Tri okruženja uspješno kreirana
- [ ] Svako okruženje ima jedinstvenu konfiguraciju
- [ ] Mogućnost prebacivanja između okruženja bez grešaka
- [ ] `azd env list` prikazuje sva tri okruženja

### Vježba 2: Upravljanje tajnama (10 minuta)

**Cilj**: Vježbati sigurnu konfiguraciju s osjetljivim podacima

```bash
# Postavite tajne (ne prikazuju se u izlazu)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Postavite konfiguraciju koja nije tajna
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Prikažite okruženje (tajne bi trebale biti sakrivene)
azd env get-values

# Provjerite jesu li tajne pohranjene
azd env get DB_PASSWORD  # Trebao bi prikazati stvarnu vrijednost
```

**Kriteriji uspjeha:**
- [ ] Tajne pohranjene bez prikaza u terminalu
- [ ] `azd env get-values` prikazuje zasjenjene tajne
- [ ] Pojedinačno `azd env get <SECRET_NAME>` dohvaća stvarnu vrijednost

## Sljedeći koraci

- [Vaš prvi projekt](first-project.md) - Primijenite konfiguraciju u praksi
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Koristite konfiguraciju za implementaciju
- [Provisioniranje resursa](../chapter-04-infrastructure/provisioning.md) - Konfiguracije spremne za produkciju

## Reference

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Početna tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 3 - Konfiguracija i autentikacija
- **⬅️ Previous**: [Vaš prvi projekt](first-project.md)
- **➡️ Next Chapter**: [Poglavlje 4: Infrastruktura kao kod](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Vaš prvi projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje odgovornosti**:
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati mjerodavnim izvorom. Za kritične informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->