# Vodnik za konfiguracijo

**Navigacija poglavij:**
- **📚 Course Home**: [AZD za začetnike](../../README.md)
- **📖 Current Chapter**: Poglavje 3 - Konfiguracija & Avtentikacija
- **⬅️ Previous**: [Vaš prvi projekt](first-project.md)
- **➡️ Next**: [Vodnik za uvajanje](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Poglavje 4: Infrastruktura kot koda](../chapter-04-infrastructure/deployment-guide.md)

## Uvod

Ta obsežen vodnik pokriva vse vidike konfiguracije Azure Developer CLI za optimalne razvojne in uvajalne postopke. Naučili se boste hierarhije konfiguracije, upravljanja okolij, metod avtentikacije in naprednih konfiguracijskih vzorcev, ki omogočajo učinkovita in varna uvajanja v Azure.

## Cilji učenja

Do konca te lekcije boste:
- Obvladali hierarhijo konfiguracije azd in razumeli, kako so nastavitve razvrščene po prioriteti
- Učinkovito konfigurirali globalne in projektno-specifične nastavitve
- Upravljali več okolij z različnimi konfiguracijami
- Implementirali varne vzorce avtentikacije in avtorizacije
- Razumeli napredne konfiguracijske vzorce za kompleksne scenarije

## Rezultati učenja

Po končani tej lekciji boste lahko:
- Konfigurirali azd za optimalne razvojne tokove
- Nastavili in upravljali več okolij za uvajanje
- Implementirali varne prakse upravljanja konfiguracij
- Odpravljali težave, povezane s konfiguracijo
- Prilagodili obnašanje azd specifičnim zahtevam organizacije

Ta obsežen vodnik pokriva vse vidike konfiguracije Azure Developer CLI za optimalne razvojne in uvajalne postopke.

## Razumevanje AI agentov v projektu azd

Če ste novi pri AI agentih, je tukaj preprost način, kako jih zamisliti znotraj sveta azd.

### Kaj je agent?

Agent je programska komponenta, ki lahko prejme zahtevo, razmisli o njej in izvede dejanja — pogosto z uporabo klica AI modela, iskanjem podatkov ali klicanjem drugih storitev. V projektu azd je agent le še ena **storitev** poleg vašega spletnega frontenda ali API zaledja.

### Kako se agenti vključujejo v strukturo projekta azd

Projekt azd je sestavljen iz treh slojev: **infrastruktura**, **koda** in **konfiguracija**. Agenti se povežejo z njimi na enak način kot katera koli druga storitev:

| Plast | Kaj počne za tradicionalno aplikacijo | Kaj počne za agenta |
|-------|---------------------------------------|---------------------|
| **Infrastruktura** (`infra/`) | Vzpostavi spletno aplikacijo in podatkovno bazo | Vzpostavi končno točko modela AI, iskalni indeks ali gostitelja agenta |
| **Koda** (`src/`) | Vsebuje vašo frontend in API izvorno kodo | Vsebuje logiko agenta in definicije pozivov |
| **Konfiguracija** (`azure.yaml`) | Navaja vaše storitve in njihove cilje gostovanja | Navaja vašega agenta kot storitev, ki kaže na njegovo kodo in gostitelja |

### Vloga `azure.yaml`

Trenutno vam ni treba zapomniti sintakse. Konceptualno je `azure.yaml` datoteka, kjer poveste azd: *"Tukaj so storitve, ki sestavljajo mojo aplikacijo, in tukaj je, kje najti njihovo kodo."*

Ko vaš projekt vključuje AI agenta, `azure.yaml` preprosto navaja tega agenta kot eno od storitev. azd nato ve, da je treba vzpostaviti ustrezno infrastrukturo (npr. končno točko Microsoft Foundry Models ali Container App za gostovanje agenta) in razmestiti kodo vašega agenta — enako kot bi to storil za spletno aplikacijo ali API.

To pomeni, da ni nič temeljno novega za učenje. Če razumete, kako azd upravlja spletno storitev, že razumete, kako upravlja agenta.

## Hierarhija konfiguracije

azd uporablja hierarhičen konfiguracijski sistem:
1. **Parametri ukazne vrstice** (najvišja prioriteta)
2. **Sistemske spremenljivke**
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

# Nastavi privzeto konvencijo poimenovanja skupin virov
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Prikaži vse globalne konfiguracije
azd config list

# Odstrani konfiguracijo
azd config unset defaults.location
```

### Pogoste globalne nastavitve
```bash
# Razvojne preference
azd config set alpha.enable true                    # Omogoči alfa funkcije
azd config set telemetry.enabled false             # Onemogoči telemetrijo
azd config set output.format json                  # Nastavi format izhoda

# Varnostne nastavitve
azd config set auth.useAzureCliCredential true     # Uporabi Azure CLI za avtentikacijo
azd config set tls.insecure false                  # Zahtevaj preverjanje TLS

# Prilagajanje zmogljivosti
azd config set provision.parallelism 5             # Vzporedno ustvarjanje virov
azd config set deploy.timeout 30m                  # Časovna omejitev za razmestitev
```

## 🏗️ Projektna konfiguracija

### Struktura `azure.yaml`
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
# (ne bi smelo vrniti ničesar)
```

### Predloge okolij
Ustvarite `.azure/env.template` za dosledno nastavitev okolja:
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

### Integracija Azure CLI
```bash
# Uporabi poverilnice Azure CLI (privzeto)
azd config set auth.useAzureCliCredential true

# Prijavite se z določenim najemnikom
az login --tenant <tenant-id>

# Nastavi privzeto naročnino
az account set --subscription <subscription-id>
```

### Avtentikacija s Service Principal
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
Za v Azure gostovana okolja:
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

### Po meri poimenovanje virov
```bash
# Določite konvencije poimenovanja
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

## 🎯 Konfiguracije specifične za okolje

### Razvojno okolje
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Predprodukcijsko okolje
```bash
# .azure/staging/.env
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
# Preveri sintakso konfiguracije
azd config validate

# Preizkusi spremenljivke okolja
azd env get-values

# Preveri infrastrukturo
azd provision --dry-run
```

### Skripte za konfiguracijo
Ustvarite skripte za preverjanje v `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Preveri zahtevane spremenljivke okolja
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

### 3. Premisleki glede sistema za nadzor različic
```bash
# .gitignore
.azure/*/config.json         # Konfiguracije okolja (vsebujejo ID-je virov)
.azure/*/.env               # Spremenljivke okolja (lahko vsebujejo skrivnosti)
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
# Ustvarite razvojno okolje
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Ustvarite predprodukcijsko okolje
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Ustvarite produkcijsko okolje
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Preverite vsako okolje
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Kriteriji uspeha:**
- [ ] Tri okolja uspešno ustvarjena
- [ ] Vsako okolje ima edinstveno konfiguracijo
- [ ] Lahko preklapljate med okolji brez napak
- [ ] `azd env list` prikaže vsa tri okolja

### Vaja 2: Upravljanje skrivnosti (10 minut)

**Cilj**: Vaditi varno konfiguracijo s občutljivimi podatki

```bash
# Nastavi skrivnosti (se ne prikažejo v izhodu)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nastavi konfiguracijo brez skrivnosti
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Prikaži okolje (skrivnosti bi morale biti prikrite)
azd env get-values

# Preveri, ali so skrivnosti shranjene
azd env get DB_PASSWORD  # Naj bi prikazalo dejansko vrednost
```

**Kriteriji uspeha:**
- [ ] Skrivnosti shranjene brez prikaza v terminalu
- [ ] `azd env get-values` prikazuje zamaskirane skrivnosti
- [ ] Individualni `azd env get <SECRET_NAME>` pridobi dejansko vrednost

## Naslednji koraki

- [Vaš prvi projekt](first-project.md) - Uporabite konfiguracijo v praksi
- [Vodnik za uvajanje](../chapter-04-infrastructure/deployment-guide.md) - Uporabite konfiguracijo za uvajanje
- [Zagotavljanje virov](../chapter-04-infrastructure/provisioning.md) - Konfiguracije primerne za produkcijo

## Reference

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigacija poglavij:**
- **📚 Course Home**: [AZD za začetnike](../../README.md)
- **📖 Current Chapter**: Poglavje 3 - Konfiguracija & Avtentikacija
- **⬅️ Previous**: [Vaš prvi projekt](first-project.md)
- **➡️ Next Chapter**: [Poglavje 4: Infrastruktura kot koda](../chapter-04-infrastructure/deployment-guide.md)
- **Naslednja lekcija**: [Vaš prvi projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ta dokument je bil preveden z AI prevajalsko storitvijo [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v svojem izvor­nem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokoven človeški prevod. Ne odgovarjamo za kakršnekoli nesporazume ali napačne interpretacije, ki bi nastale zaradi uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->