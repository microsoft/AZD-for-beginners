# Vodič za konfiguraciju

**Navigacija poglavljima:**
- **📚 Početak tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 3 - Konfiguracija i autentikacija
- **⬅️ Prethodno**: [Vaš prvi projekt](first-project.md)
- **➡️ Sljedeće**: [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 4: Infrastruktura kao kod](../chapter-04-infrastructure/deployment-guide.md)

## Uvod

Ovaj sveobuhvatni vodič pokriva sve aspekte konfiguracije Azure Developer CLI-ja za optimalne tijekove rada razvojnih i implementacijskih procesa. Naučit ćete o hijerarhiji konfiguracije, upravljanju okruženjima, metodama autentikacije i naprednim obrascima konfiguracije koji omogućuju učinkovite i sigurne Azure implementacije.

## Ciljevi učenja

Na kraju ove lekcije ćete:
- Ovladati hijerarhijom konfiguracije azd-a i razumjeti kako se postavke prioritetiziraju
- Efikasno konfigurirati globalne i specifične postavke projekta
- Upravljati više okruženja s različitim konfiguracijama
- Implementirati sigurne obrasce autentikacije i autorizacije
- Razumjeti napredne obrasce konfiguracije za složene scenarije

## Ishodi učenja

Nakon završetka ove lekcije, moći ćete:
- Konfigurirati azd za optimalne tijekove rada razvoja
- Postaviti i upravljati više razvojnih okruženja za implementaciju
- Primjenjivati sigurne prakse upravljanja konfiguracijom
- Rješavati probleme povezane s konfiguracijom
- Prilagoditi ponašanje azd-a za specifične organizacijske zahtjeve

Ovaj sveobuhvatni vodič pokriva sve aspekte konfiguracije Azure Developer CLI-ja za optimalne tijekove rada razvojnih i implementacijskih procesa.

## Razumijevanje AI agenata u azd projektu

Ako ste novi u svijetu AI agenata, evo jednostavnog načina da ih shvatite u kontekstu azd-a.

### Što je Agent?

Agent je softverska komponenta koja može primiti zahtjev, raspraviti o njemu i poduzeti radnje — često pozivajući AI model, pretražujući podatke ili pozivajući druge usluge. U azd projektu, agent je samo još jedna **usluga** pored vašeg web sučelja ili API pozadinske logike.

### Kako se agenti uklapaju u strukturu azd projekta

azd projekt se sastoji od tri sloja: **infrastruktura**, **kod** i **konfiguracija**. Agenti se spajaju u ove slojeve na isti način kao i bilo koja druga usluga:

| Sloj | Što radi za tradicionalnu aplikaciju | Što radi za agenta |
|-------|-------------------------------------|--------------------|
| **Infrastruktura** (`infra/`) | Postavlja web aplikaciju i bazu podataka | Postavlja AI model endpoint, tražilicu ili host agenta |
| **Kod** (`src/`) | Sadrži izvorni kod frontend-a i API-ja | Sadrži logiku agenta i definicije promptova |
| **Konfiguracija** (`azure.yaml`) | Navodi usluge i njihova mjesta hostanja | Navodi agenta kao uslugu, povezanu s njegovim kodom i hostom |

### Uloga datoteke `azure.yaml`

Nije potrebno trenutno pamtiti sintaksu. Konceptualno, `azure.yaml` je datoteka u kojoj kažete azd-u: *"Evo usluga koje čine moju aplikaciju i ovdje mogu pronaći njihov kod."*

Kada vaš projekt uključuje AI agenta, `azure.yaml` jednostavno navodi tog agenta kao jednu od usluga. azd tada zna kako postaviti pravu infrastrukturu (poput Microsoft Foundry Models endpointa ili ContainerApp-a za hosting agenta) i implementirati vaš agent kod — baš kao što bi to učinio za web aplikaciju ili API.

To znači da nema ničeg fundamentalno novog za naučiti. Ako razumijete kako azd upravlja web uslugom, već razumijete kako upravlja agentom.

## Hijerarhija konfiguracije

azd koristi hijerarhijski sustav konfiguracije:
1. **Zastavice naredbenog retka** (najviši prioritet)
2. **Varijable okruženja**
3. **Lokalna konfiguracija projekta** (`.azd/config.json`)
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

# Prikaži sve globalne konfiguracije
azd config show

# Ukloni konfiguraciju
azd config unset defaults.location
```

### Česte globalne postavke
```bash
# Postavke razvoja
azd config set alpha.enable true                    # Omogući alfa značajke
azd config set telemetry.enabled false             # Onemogući telemetriju
azd config set output.format json                  # Postavi izlazni format

# Sigurnosne postavke
azd config set auth.useAzureCliCredential true     # Koristi Azure CLI za autentifikaciju
azd config set tls.insecure false                  # Primijeni TLS provjeru

# Podešavanje performansi
azd config set provision.parallelism 5             # Paralelna kreacija resursa
azd config set deploy.timeout 30m                  # Vremensko ograničenje implementacije
```

## 🏗️ Konfiguracija projekta

### Struktura `azure.yaml`
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
# Kreiraj novo okruženje
azd env new development

# Kreiraj s određenom lokacijom
azd env new staging --location "westus2"

# Kreiraj iz predloška
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfiguracija okruženja
Svako okruženje ima svoju konfiguraciju u `.azure/<env-name>/config.json`:

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

# Prikaz varijabli okruženja
azd env get-values

# Očekivani rezultat:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Ukloni varijablu okruženja
azd env unset DEBUG

# Provjeri uklanjanje
azd env get-values | grep DEBUG
# (ne bi smjelo vratiti ništa)
```

### Predlošci okruženja
Kreirajte `.azure/env.template` za dosljednu postavu okruženja:
```bash
# Potrebne varijable
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Postavke aplikacije
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Neobavezne razvojne postavke
DEBUG=false
LOG_LEVEL=info
```

### Dijeljenje okruženja u timu

Kad na projektu radi više osoba, morate se dogovoriti **što ide s repozitorijem, a što ostaje lokalno**. azd svako okruženje drži unutar `.azure/` mape, i ne treba sve to verzionirati.

**Što je u `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Što treba staviti u gitignore.** Zadani `.gitignore` za azd već izuzima `.azure/`. Ostavite to tako — `.env` datoteke mogu sadržavati tajne, a ID-jevi resursa su specifični za onoga tko ih je postavio. Svaki član tima lokalno kreira **svoju** verziju okruženja:

```bash
# Svaki programer pokreće ovo jednom da bi dobio vlastito izolirano okruženje
azd env new dev-alice
azd up
```

**Prebacivanje između okruženja.** Razvojni inženjer koji upravlja više okruženja bira aktivno okruženje prije pokretanja naredbi:

```bash
azd env list                 # vidi sve lokalne okoline i koja je zadana
azd env select staging       # postavi 'staging' kao aktivnu okolinu
azd env get-values           # potvrdi da si usmjeren na pravu
```

**Osiguravanje ne-tajnih zadanih vrijednosti za tim.** Objavite predložak (poput `.azure/env.template` gore) kako bi svi znali koje varijable trebaju postaviti — ali nikada ne objavljujte popunjene vrijednosti. Novi članovi tima kopiraju predložak i unose svoje vrijednosti.

**Okruženja u CI/CD-u.** Pipelinovi ne čitaju vašu lokalnu `.azure/` mapu. Umjesto toga, proslijedite vrijednosti okruženja kao varijable/tajne u pipelinu, a azd ih učitava iz procesa okruženja:

```bash
# U CI, azd ih čita iz okruženja, ne iz .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Pravilo palca:** infrastrukturni kod (`infra/`, `azure.yaml`) dijeli se u Gitu; stanje i tajne okruženja (`.azure/`) su po developeru i po pipelinu. `azd pipeline config` automatski postavlja varijable pipelina za vas.

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

### Autentikacija Service Principalom
Za CI/CD pipelineove:
```bash
# Postavi varijable okruženja
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Ili konfiguriraj direktno
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Za Azure-hostana okruženja:
```bash
# Omogući provjeru autentičnosti upravljanog identiteta
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

### Prilagođavanje imena resursa
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

### Predprodukcijsko okruženje
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
Kreirajte skripte za validaciju u `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Provjeri potrebne varijable okoliša
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

### 3. Razmatranja verzioniranja
```bash
# .gitignore
.azure/*/config.json         # Konfiguracije okruženja (sadrže ID-jeve resursa)
.azure/*/.env               # Varijable okruženja (mogu sadržavati tajne)
.env                        # Lokalna datoteka okruženja
```

### 4. Dokumentacija konfiguracije
Dokumentirajte konfiguraciju u `CONFIG.md`:
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

## 🎯 Vježbe iz prakse

### Vježba 1: Konfiguracija više okruženja (15 minuta)

**Cilj**: Kreirati i konfigurirati tri okruženja s različitim postavkama

```bash
# Kreiraj razvojno okruženje
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Kreiraj testno okruženje
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
- [ ] Mogućnost promjene između okruženja bez pogrešaka
- [ ] `azd env list` prikazuje sva tri okruženja

### Vježba 2: Upravljanje tajnama (10 minuta)

**Cilj**: Vježbati sigurnu konfiguraciju s osjetljivim podacima

```bash
# Postavi tajne (nije prikazano u izlazu)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Postavi konfiguraciju koja nije tajna
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Pregledaj okruženje (tajne bi trebale biti uklonjene)
azd env get-values

# Provjeri jesu li tajne pohranjene
azd env get DB_PASSWORD  # Trebalo bi prikazati stvarnu vrijednost
```

**Kriteriji uspjeha:**
- [ ] Tajne pohranjene bez prikaza u terminalu
- [ ] `azd env get-values` prikazuje zatajene tajne
- [ ] Pojedinačni `azd env get <SECRET_NAME>` dohvaća stvarnu vrijednost

## Sljedeći koraci

- [Vaš prvi projekt](first-project.md) - Primjena konfiguracije u praksi
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) - Korištenje konfiguracije za implementaciju
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Konfiguracije spremne za produkciju

## Reference

- [azd Reference konfiguracije](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [shema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [varijable okruženja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigacija poglavljima:**
- **📚 Početak tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 3 - Konfiguracija i autentikacija
- **⬅️ Prethodno**: [Vaš prvi projekt](first-project.md)
- **➡️ Sljedeće poglavlje**: [Poglavlje 4: Infrastruktura kao kod](../chapter-04-infrastructure/deployment-guide.md)
- **Sljedeća lekcija**: [Vaš prvi projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->