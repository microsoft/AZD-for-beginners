<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-23T21:37:10+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "sl"
}
-->
# Vodnik za konfiguracijo

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 3 - Konfiguracija in avtentikacija
- **⬅️ Prejšnje**: [Vaš prvi projekt](first-project.md)
- **➡️ Naslednje**: [Vodnik za uvajanje](../deployment/deployment-guide.md)
- **🚀 Naslednje poglavje**: [Poglavje 4: Infrastruktura kot koda](../deployment/deployment-guide.md)

## Uvod

Ta obsežen vodnik pokriva vse vidike konfiguracije Azure Developer CLI za optimalne razvojne in uvajalne delovne tokove. Naučili se boste o hierarhiji konfiguracije, upravljanju okolij, metodah avtentikacije in naprednih vzorcih konfiguracije, ki omogočajo učinkovite in varne uvajanja v Azure.

## Cilji učenja

Do konca te lekcije boste:
- Obvladali hierarhijo konfiguracije azd in razumeli, kako se nastavitve prioritetizirajo
- Učinkovito konfigurirali globalne in projektno specifične nastavitve
- Upravljali več okolij z različnimi konfiguracijami
- Implementirali varne vzorce avtentikacije in avtorizacije
- Razumeli napredne vzorce konfiguracije za kompleksne scenarije

## Rezultati učenja

Po zaključku te lekcije boste sposobni:
- Konfigurirati azd za optimalne razvojne delovne tokove
- Nastaviti in upravljati več uvajalnih okolij
- Uvesti varne prakse upravljanja konfiguracije
- Odpravljati težave, povezane s konfiguracijo
- Prilagoditi vedenje azd za specifične organizacijske zahteve

Ta obsežen vodnik pokriva vse vidike konfiguracije Azure Developer CLI za optimalne razvojne in uvajalne delovne tokove.

## Hierarhija konfiguracije

azd uporablja hierarhični sistem konfiguracije:
1. **Zastavice ukazne vrstice** (najvišja prioriteta)
2. **Spremenljivke okolja**
3. **Lokalna projektna konfiguracija** (`.azd/config.json`)
4. **Globalna uporabniška konfiguracija** (`~/.azd/config.json`)
5. **Privzete vrednosti** (najnižja prioriteta)

## Globalna konfiguracija

### Nastavitev globalnih privzetih vrednosti
```bash
# Nastavi privzeto naročnino
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Nastavi privzeto lokacijo
azd config set defaults.location "eastus2"

# Nastavi privzeto poimenovanje skupine virov
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Prikaži vse globalne nastavitve
azd config list

# Odstrani nastavitev
azd config unset defaults.location
```

### Pogoste globalne nastavitve
```bash
# Nastavitve razvoja
azd config set alpha.enable true                    # Omogoči alfa funkcije
azd config set telemetry.enabled false             # Onemogoči telemetrijo
azd config set output.format json                  # Nastavi format izhoda

# Varnostne nastavitve
azd config set auth.useAzureCliCredential true     # Uporabi Azure CLI za avtentikacijo
azd config set tls.insecure false                  # Uveljavi preverjanje TLS

# Nastavitev zmogljivosti
azd config set provision.parallelism 5             # Vzporedna ustvaritev virov
azd config set deploy.timeout 30m                  # Časovna omejitev uvajanja
```

## 🏗️ Projektna konfiguracija

### Struktura azure.yaml
Datoteka `azure.yaml` je srce vašega azd projekta:

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

### Možnosti konfiguracije storitev

#### Vrste gostiteljev
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

#### Nastavitve specifične za jezik
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

## 🌟 Upravljanje okolij

### Ustvarjanje okolij
```bash
# Ustvari novo okolje
azd env new development

# Ustvari z določeno lokacijo
azd env new staging --location "westus2"

# Ustvari iz predloge
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfiguracija okolij
Vsako okolje ima svojo konfiguracijo v `.azure/<env-name>/config.json`:

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

### Spremenljivke okolja
```bash
# Nastavi spremenljivke, specifične za okolje
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Prikaži spremenljivke okolja
azd env get-values

# Pričakovani izhod:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=skrivni-api-ključ
# DEBUG=true

# Odstrani spremenljivko okolja
azd env unset DEBUG

# Preveri odstranitev
azd env get-values | grep DEBUG
# (ne sme vrniti ničesar)
```

### Predloge okolij
Ustvarite `.azure/env.template` za dosledno nastavitev okolij:
```bash
# Zahtevane spremenljivke
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Nastavitve aplikacije
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Izbirne nastavitve za razvoj
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Konfiguracija avtentikacije

### Integracija z Azure CLI
```bash
# Uporabi poverilnice Azure CLI (privzeto)
azd config set auth.useAzureCliCredential true

# Prijava z določenim najemnikom
az login --tenant <tenant-id>

# Nastavi privzeto naročnino
az account set --subscription <subscription-id>
```

### Avtentikacija s servisnim računom
Za CI/CD procese:
```bash
# Nastavi okoljske spremenljivke
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Ali konfiguriraj neposredno
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Upravljana identiteta
Za okolja, gostovana v Azure:
```bash
# Omogoči preverjanje pristnosti z upravljano identiteto
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Konfiguracija infrastrukture

### Parametri Bicep
Konfigurirajte parametre infrastrukture v `infra/main.parameters.json`:
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

### Konfiguracija Terraform
Za projekte Terraform konfigurirajte v `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Konfiguracija uvajanja

### Konfiguracija gradnje
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

### Konfiguracija Docker
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
Primer `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Napredna konfiguracija

### Prilagojeno poimenovanje virov
```bash
# Nastavite poimenovalne konvencije
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Konfiguracija omrežja
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

## 🎯 Konfiguracije specifične za okolje

### Razvojno okolje
```bash
# .azure/razvoj/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Testno okolje
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Proizvodno okolje
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
# Preveri sintakso konfiguracije
azd config validate

# Preizkusi okoljske spremenljivke
azd env get-values

# Potrdi infrastrukturo
azd provision --dry-run
```

### Skripti za validacijo konfiguracije
Ustvarite skripte za validacijo v `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Preveri zahtevane okoljske spremenljivke
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Preveri sintakso azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Najboljše prakse

### 1. Uporabljajte spremenljivke okolja
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

### 3. Razmisleki o različicah
```bash
# .gitignore
.azure/*/config.json         # Konfiguracije okolja (vsebujejo ID-je virov)
.azure/*/.env               # Spremenljivke okolja (lahko vsebujejo skrivnosti)
.env                        # Datoteka lokalnega okolja
```

### 4. Dokumentacija konfiguracije
Dokumentirajte svojo konfiguracijo v `CONFIG.md`:
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

## 🎯 Praktične vaje

### Vaja 1: Konfiguracija več okolij (15 minut)

**Cilj**: Ustvarite in konfigurirajte tri okolja z različnimi nastavitvami

```bash
# Ustvari razvojno okolje
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Ustvari testno okolje
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Ustvari produkcijsko okolje
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Preveri vsako okolje
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Kriteriji uspeha:**
- [ ] Uspešno ustvarjena tri okolja
- [ ] Vsako okolje ima edinstveno konfiguracijo
- [ ] Možnost preklapljanja med okolji brez napak
- [ ] `azd env list` prikazuje vsa tri okolja

### Vaja 2: Upravljanje skrivnosti (10 minut)

**Cilj**: Vadite varno konfiguracijo z občutljivimi podatki

```bash
# Nastavi skrivnosti (ne prikazano v izhodu)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nastavi konfiguracijo brez skrivnosti
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Preglej okolje (skrivnosti naj bodo prikrite)
azd env get-values

# Preveri, ali so skrivnosti shranjene
azd env get DB_PASSWORD  # Naj pokaže dejansko vrednost
```

**Kriteriji uspeha:**
- [ ] Skrivnosti shranjene brez prikaza v terminalu
- [ ] `azd env get-values` prikazuje skrite skrivnosti
- [ ] Posamezni `azd env get <SECRET_NAME>` pridobi dejansko vrednost

## Naslednji koraki

- [Vaš prvi projekt](first-project.md) - Uporaba konfiguracije v praksi
- [Vodnik za uvajanje](../deployment/deployment-guide.md) - Uporaba konfiguracije za uvajanje
- [Zagotavljanje virov](../deployment/provisioning.md) - Konfiguracije pripravljene za produkcijo

## Reference

- [Referenca konfiguracije azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Shema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Spremenljivke okolja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 3 - Konfiguracija in avtentikacija
- **⬅️ Prejšnje**: [Vaš prvi projekt](first-project.md)
- **➡️ Naslednje poglavje**: [Poglavje 4: Infrastruktura kot koda](../deployment/deployment-guide.md)
- **Naslednja lekcija**: [Vaš prvi projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve AI za prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatski prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->