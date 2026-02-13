# Vodnik za konfiguracijo

**Navigacija poglavij:**
- **📚 Domov tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 3 - Konfiguracija in avtentikacija
- **⬅️ Prejšnje**: [Vaš prvi projekt](first-project.md)
- **➡️ Naslednje**: [Vodnik za razmestitev](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Naslednje poglavje**: [Poglavje 4: Infrastruktura kot koda](../chapter-04-infrastructure/deployment-guide.md)

## Uvod

Ta obsežen vodnik pokriva vse vidike konfiguracije Azure Developer CLI za optimalne razvojne in razmestitvene delovne tokove. Naučili se boste o hierarhiji konfiguracije, upravljanju okolij, metodah overjanja in naprednih vzorcih konfiguracije, ki omogočajo učinkovite in varne razmestitve v Azure.

## Cilji učenja

Po zaključku te lekcije boste:
- Obvladali hierarhijo konfiguracije azd in razumeli, kako so nastavitve razporejene po prioriteti
- Učinkovito konfigurirali globalne in za projekt specifične nastavitve
- Upravljali več okolij z različnimi konfiguracijami
- Implementirali varne vzorce avtentikacije in avtorizacije
- Razumeli napredne vzorce konfiguracije za kompleksne scenarije

## Izhodi učenja

Po zaključku te lekcije boste lahko:
- Konfigurirali azd za optimalne razvojne delovne tokove
- Nastavili in upravljali več razmestitvenih okolij
- Implementirali varne prakse upravljanja konfiguracij
- Odpravljali težave, povezane s konfiguracijo
- Prilagodili obnašanje azd za posebne zahteve organizacije

Ta obsežen vodnik pokriva vse vidike konfiguracije Azure Developer CLI za optimalne razvojne in razmestitvene delovne tokove.

## Hierarhija konfiguracije

azd uporablja hierarhičen sistem konfiguracije:
1. **Zastavice ukazne vrstice** (najvišja prioriteta)
2. **Spremenljivke okolja**
3. **Lokalna konfiguracija projekta** (`.azd/config.json`)
4. **Globalna uporabniška konfiguracija** (`~/.azd/config.json`)
5. **Privzete vrednosti** (najnižja prioriteta)

## Globalna konfiguracija

### Nastavitev globalnih privzetih vrednosti
```bash
# Nastavi privzeto naročnino
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Nastavi privzeto lokacijo
azd config set defaults.location "eastus2"

# Nastavi privzeto konvencijo poimenovanja skupin virov
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Prikaži vse globalne nastavitve
azd config list

# Odstrani konfiguracijo
azd config unset defaults.location
```

### Pogoste globalne nastavitve
```bash
# Razvojne nastavitve
azd config set alpha.enable true                    # Omogoči alfa funkcije
azd config set telemetry.enabled false             # Onemogoči telemetrijo
azd config set output.format json                  # Nastavi format izhoda

# Varnostne nastavitve
azd config set auth.useAzureCliCredential true     # Uporabi Azure CLI za preverjanje pristnosti
azd config set tls.insecure false                  # Zahtevaj preverjanje TLS

# Optimizacija zmogljivosti
azd config set provision.parallelism 5             # Vzporedno ustvarjanje virov
azd config set deploy.timeout 30m                  # Časovna omejitev uvajanja
```

## 🏗️ Konfiguracija projekta

### Struktura azure.yaml
Datoteka `azure.yaml` je srce vašega projekta azd:

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

#### Jeziku specifične nastavitve
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

### Konfiguracija okolja
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
# API_KEY=secret-api-key
# DEBUG=true

# Odstrani spremenljivko okolja
azd env unset DEBUG

# Preveri odstranitev
azd env get-values | grep DEBUG
# (ne bi smelo ničesar vrniti)
```

### Predloge okolja
Ustvarite `.azure/env.template` za enotno nastavitev okolja:
```bash
# Zahtevane spremenljivke
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Nastavitve aplikacije
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Neobvezne razvojne nastavitve
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

### Overjanje s Service Principalom
Za CI/CD cevovode:
```bash
# Nastavite spremenljivke okolja
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Ali konfigurirajte neposredno
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Upravljana identiteta
Za okolja, gostovana v Azure:
```bash
# Omogoči overjanje z upravljano identiteto
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
Za Terraform projekte konfigurirajte v `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Konfiguracija razmestitve

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
Primer `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Napredna konfiguracija

### Poimenovanje virov po meri
```bash
# Določite pravila poimenovanja
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Omrežna konfiguracija
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Konfiguracija spremljanja
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

## 🎯 Okolju prilagojene konfiguracije

### Razvojno okolje
```bash
# .azure/razvoj/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Predprodukcijsko okolje
```bash
# .azure/predprodukcijsko/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produkcijsko okolje
```bash
# .azure/produkcija/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Preverjanje konfiguracije

### Preverite konfiguracijo
```bash
# Preverite sintakso konfiguracije
azd config validate

# Preizkusite spremenljivke okolja
azd env get-values

# Preverite infrastrukturo
azd provision --dry-run
```

### Skripte za konfiguracijo
Ustvarite skripte za preverjanje v `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Preveri zahtevane okoljske spremenljivke
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Preveri sintakso datoteke azure.yaml
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

### 3. Premisleki glede nadzora različic
```bash
# .gitignore
.azure/*/config.json         # Konfiguracije okolja (vsebujejo ID-je virov)
.azure/*/.env               # Okoljske spremenljivke (lahko vsebujejo skrivnosti)
.env                        # Lokalna datoteka okolja
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

### Vaja 1: Konfiguracija z več okolji (15 minut)

**Cilj**: Ustvarite in konfigurirajte tri okolja z različnimi nastavitvami

```bash
# Ustvari razvojno okolje
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Ustvari pripravljalno okolje
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
- [ ] Tri okolja uspešno ustvarjena
- [ ] Vsako okolje ima edinstveno konfiguracijo
- [ ] Možno je preklapljati med okolji brez napak
- [ ] `azd env list` prikaže vsa tri okolja

### Vaja 2: Upravljanje skrivnosti (10 minut)

**Cilj**: Vadite varno konfiguracijo z občutljivimi podatki

```bash
# Nastavi skrivnosti (se ne prikažejo v izhodu)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nastavi konfiguracijo, ki ni skrivna
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Prikaži okolje (skrivnosti naj bodo skrite)
azd env get-values

# Preveri, ali so skrivnosti shranjene
azd env get DB_PASSWORD  # Moralo bi prikazati dejansko vrednost
```

**Kriteriji uspeha:**
- [ ] Skrivnosti shranjene brez prikaza v terminalu
- [ ] `azd env get-values` prikazuje rdečene skrivnosti
- [ ] Posamezen `azd env get <SECRET_NAME>` pridobi dejansko vrednost

## Naslednji koraki

- [Vaš prvi projekt](first-project.md) - Uporabite konfiguracijo v praksi
- [Vodnik za razmestitev](../chapter-04-infrastructure/deployment-guide.md) - Uporabite konfiguracijo za razmestitev
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Konfiguracije pripravljene za produkcijo

## Viri

- [Referenca konfiguracije azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Shema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Spremenljivke okolja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigacija poglavij:**
- **📚 Domov tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 3 - Konfiguracija in avtentikacija
- **⬅️ Prejšnje**: [Vaš prvi projekt](first-project.md)
- **➡️ Naslednje poglavje**: [Poglavje 4: Infrastruktura kot koda](../chapter-04-infrastructure/deployment-guide.md)
- **Naslednja lekcija**: [Vaš prvi projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco Co-op Translator (https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za avtoritativni vir. Za ključne informacije priporočamo strokovni prevod, opravljen s strani usposobljenega prevajalca. Ne odgovarjamo za kakršne koli nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->