# Vodič za konfiguraciju

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 3 - Konfiguracija i autentikacija
- **⬅️ Prethodno**: [Vaš prvi projekt](first-project.md)
- **➡️ Sljedeće**: [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 4: Infrastruktura kao kod](../chapter-04-infrastructure/deployment-guide.md)

## Uvod

Ovaj sveobuhvatni vodič pokriva sve aspekte konfiguracije Azure Developer CLI-ja za optimalne tijekove rada u razvoju i implementaciji. Naučit ćete o hijerarhiji konfiguracije, upravljanju okruženjima, metodama autentikacije i naprednim obrascima konfiguracije koji omogućuju učinkovite i sigurne Azure implementacije.

## Ciljevi učenja

Do kraja ovog lekcija, moći ćete:
- Ovladati hijerarhijom konfiguracije azd-a i razumjeti kako se postavke prioritiziraju
- Konfigurirati globalne i projekt-specifične postavke učinkovito
- Upravljati s više okruženja sa različitim konfiguracijama
- Implementirati sigurne obrasce autentikacije i autorizacije
- Razumjeti napredne obrasce konfiguracije za složene scenarije

## Ishodi učenja

Nakon završetka lekcije, moći ćete:
- Konfigurirati azd za optimalne tijekove rada u razvoju
- Postaviti i upravljati višestrukim okruženjima implementacije
- Implementirati sigurne prakse upravljanja konfiguracijom
- Otkloniti probleme povezane s konfiguracijom
- Prilagoditi ponašanje azd-a za specifične organizacijske zahtjeve

Ovaj sveobuhvatni vodič pokriva sve aspekte konfiguracije Azure Developer CLI-ja za optimalne tijekove rada u razvoju i implementaciji.

## Razumijevanje AI agenata u azd projektu

Ako ste nove u AI agentima, ovo je jednostavan način da ih shvatite unutar svijeta azd-a.

### Što je agent?

Agent je softverski program koji može primiti zahtjev, razmotriti ga i poduzeti radnje—često pozivajući AI model, tražeći podatke ili pozivajući druge usluge. U azd projektu, agent je samo još jedna **usluga** uz vaš web frontend ili API backend.

### Kako agenti pristaju u strukturu azd projekta

azd projekt se sastoji od tri sloja: **infrastruktura**, **kod** i **konfiguracija**. Agenti se uklapaju u te slojeve na isti način kao i svaka druga usluga:

| Sloj | Što radi za tradicionalnu aplikaciju | Što radi za agenta |
|-------|-------------------------------------|---------------------------|
| **Infrastruktura** (`infra/`) | Provisonira web aplikaciju i bazu podataka | Provisonira AI model endpoint, indeks pretraživanja ili host agenta |
| **Kod** (`src/`) | Sadrži izvorni kod vašeg frontenda i API-ja | Sadrži logiku vašeg agenta i definicije upita |
| **Konfiguracija** (`azure.yaml`) | Navodi vaše usluge i njihove ciljeve hostanja | Navodi vašeg agenta kao uslugu, usmjeravajući na njegov kod i host |

### Uloga `azure.yaml`

Ne morate trenutno pamtiti sintaksu. Konceptualno, `azure.yaml` je datoteka gdje kažete azd-u: *"Ovo su usluge koje čine moju aplikaciju, i evo gdje se nalazi njihov kod."*

Kad vaš projekt uključuje AI agenta, `azure.yaml` jednostavno navodi tog agenta kao jednu od usluga. azd tada zna kako provisonirati pravu infrastrukturu (kao Microsoft Foundry Models endpoint ili Container App za hostanje agenta) i implementirati kod vašeg agenta—kao što bi to radio za web aplikaciju ili API.

To znači da nema ničeg fundamentalno novog za naučiti. Ako razumijete kako azd upravlja web uslugom, već razumijete kako upravlja s agentom.

## Hijerarhija konfiguracije

azd koristi hijerarhijski sustav konfiguracije:
1. **Zastavice komandne linije** (najviši prioritet)
2. **Varijable okruženja**
3. **Lokalna projektna konfiguracija** (`.azd/config.json`)
4. **Globalna korisnička konfiguracija** (`~/.azd/config.json`)
5. **Zadane vrijednosti** (najniži prioritet)

## Globalna konfiguracija

### Postavljanje globalnih zadataka
```bash
# Postavi zadanu pretplatu
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Postavi zadanu lokaciju
azd config set defaults.location "eastus2"

# Postavi zadanu konvenciju imenovanja grupe resursa
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Pregledaj sve globalne konfiguracije
azd config show

# Ukloni konfiguraciju
azd config unset defaults.location
```

### Uobičajene globalne postavke
```bash
# Postavke razvoja
azd config set alpha.enable true                    # Omogući alfa značajke
azd config set telemetry.enabled false             # Onemogući telemetriju
azd config set output.format json                  # Postavi izlazni format

# Sigurnosne postavke
azd config set auth.useAzureCliCredential true     # Koristi Azure CLI za autentifikaciju
azd config set tls.insecure false                  # Nametni TLS provjeru

# Podešavanje performansi
azd config set provision.parallelism 5             # Paralelno stvaranje resursa
azd config set deploy.timeout 30m                  # Vremensko ograničenje za implementaciju
```

## 🏗️ Projektna konfiguracija

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

### Opcije konfiguracije usluge

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

#### Postavke specifične za programski jezik
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
Svako okruženje ima vlastitu konfiguraciju u `.azure/<ime-okruženja>/config.json`:

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
# Postavite varijable specifične za okruženje
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Pregledajte varijable okruženja
azd env get-values

# Očekivani izlaz:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=tajni-api-kljuc
# DEBUG=true

# Uklonite varijablu okruženja
azd env unset DEBUG

# Potvrdite uklanjanje
azd env get-values | grep DEBUG
# (ne bi trebalo vratiti ništa)
```

### Predlošci okruženja
Kreirajte `.azure/env.template` za dosljednu postavku okruženja:
```bash
# Potrebne varijable
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Postavke aplikacije
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Opcionalne razvojne postavke
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Konfiguracija autentikacije

### Integracija Azure CLI-ja
```bash
# Koristi Azure CLI vjerodajnice (zadano)
azd config set auth.useAzureCliCredential true

# Prijava s određenim zakupcem
az login --tenant <tenant-id>

# Postavi zadanu pretplatu
az account set --subscription <subscription-id>
```

### Autentikacija pomoću Service Principal
Za CI/CD pipelineove:
```bash
# Postavi varijable okruženja
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Ili konfiguriraj izravno
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Za Azure-hostana okruženja:
```bash
# Omogući autentifikaciju upravljanim identitetom
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Konfiguracija infrastrukture

### Bicep parametri
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

### Terraform konfiguracija
Za Terraform projekte konfigurirajte u `infra/terraform.tfvars`:
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

### Docker konfiguracija
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
# Postavi konvencije imenovanja
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Mrežna konfiguracija
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
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Izvedbeno okruženje
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

### Validirajte konfiguraciju
```bash
# Provjeri sintaksu konfiguracije
azd config validate

# Testiraj varijable okoline
azd env get-values

# Potvrdi infrastrukturu
azd provision --dry-run
```

### Skripte za konfiguraciju
Kreirajte validacijske skripte u `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Provjerite potrebne varijable okruženja
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Provjerite sintaksu azure.yaml
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

### 3. Razmatranja verzioniranja
```bash
# .gitignore
.azure/*/config.json         # Konfiguracije okruženja (sadrže ID-jeve resursa)
.azure/*/.env               # Varijable okruženja (mogu sadržavati tajne)
.env                        # Lokalna datoteka okruženja
```

### 4. Dokumentacija konfiguracije
Dokumentirajte vašu konfiguraciju u `CONFIG.md`:
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

## 🎯 Vježbe praktične primjene

### Vježba 1: Konfiguracija za višestruka okruženja (15 minuta)

**Cilj**: Kreirajte i konfigurirajte tri različita okruženja s različitim postavkama

```bash
# Kreirajte razvojno okruženje
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Kreirajte pripremno okruženje
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Kreirajte produkcijsko okruženje
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Provjerite svako okruženje
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Kriteriji uspjeha:**
- [ ] Uspješno kreirana tri okruženja
- [ ] Svako okruženje ima jedinstvenu konfiguraciju
- [ ] Moguće je prebacivati se između okruženja bez grešaka
- [ ] `azd env list` prikazuje sva tri okruženja

### Vježba 2: Upravljanje tajnama (10 minuta)

**Cilj**: Vježbajte sigurnu konfiguraciju sa osjetljivim podacima

```bash
# Postavi tajne (ne prikazuje se u rezultatu)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Postavi konfiguraciju bez tajni
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Prikaži okruženje (tajne bi trebale biti uklonjene)
azd env get-values

# Provjeri jesu li tajne pohranjene
azd env get DB_PASSWORD  # Trebalo bi prikazati stvarnu vrijednost
```

**Kriteriji uspjeha:**
- [ ] Tajne pohranjene bez prikaza u terminalu
- [ ] `azd env get-values` prikazuje skriveno tajne
- [ ] Pojedinačni `azd env get <SECRET_NAME>` dohvaća stvarnu vrijednost

## Sljedeći koraci

- [Vaš prvi projekt](first-project.md) - primijenite konfiguraciju u praksi
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) - koristite konfiguraciju za implementaciju
- [Provisioning resursa](../chapter-04-infrastructure/provisioning.md) - konfiguracije za produkcijsko okruženje

## Reference

- [azd Referenca konfiguracije](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Shema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Varijable okruženja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 3 - Konfiguracija i autentikacija
- **⬅️ Prethodno**: [Vaš prvi projekt](first-project.md)
- **➡️ Sljedeće poglavlje**: [Poglavlje 4: Infrastruktura kao kod](../chapter-04-infrastructure/deployment-guide.md)
- **Sljedeća lekcija**: [Vaš prvi projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden korištenjem AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatizirani prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne preuzimamo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->