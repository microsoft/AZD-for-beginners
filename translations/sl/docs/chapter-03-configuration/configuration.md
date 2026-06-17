# Vodnik za konfiguracijo

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 3 - Konfiguracija in preverjanje pristnosti
- **⬅️ Prejšnje**: [Vaš prvi projekt](first-project.md)
- **➡️ Naslednje**: [Vodnik za razmestitev](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Naslednje poglavje**: [Poglavje 4: Infrastruktura kot koda](../chapter-04-infrastructure/deployment-guide.md)

## Uvod

Ta obširen vodnik zajema vse vidike konfiguracije Azure Developer CLI za optimalne razvojne in razmestitvene poteke. Naučili se boste o hierarhiji konfiguracij, upravljanju okolij, metodah preverjanja pristnosti in naprednih konfiguracijskih vzorcih, ki omogočajo učinkovite in varne Azure razmestitve.

## Cilji učenja

Do konca te lekcije boste:
- Obvladali hierarhijo konfiguracije azd in razumeli, kako so nastavitve prioritizirane
- Učinkovito konfigurirali globalne in projektnemu specifične nastavitve
- Upravljali več okolij z različnimi konfiguracijami
- Uvedli varne vzorce preverjanja pristnosti in avtorizacije
- Razumeli napredne konfiguracijske vzorce za kompleksne scenarije

## Pričakovani rezultati učenja

Po zaključku te lekcije boste lahko:
- Konfigurirali azd za optimalne razvojne poteke
- Nastavili in upravljali več razmestitvenih okolij
- Uvedli varne prakse upravljanja konfiguracij
- Odpravljali težave, povezane s konfiguracijo
- Prilagodili vedenje azd za specifične zahteve organizacije

Ta obširen vodnik zajema vse vidike konfiguracije Azure Developer CLI za optimalne razvojne in razmestitvene poteke.

## Razumevanje AI agentov v azd projektu

Če ste novi pri AI agentih, je tukaj preprost način, kako jih razumeti v svetu azd.

### Kaj je agent?

Agent je kos programske opreme, ki lahko prejme zahtevo, razmisli o njej in izvede dejanja—pogosto z uporabo klica AI modela, iskanjem podatkov ali klicanjem drugih storitev. V azd projektu je agent le še ena **storitev** poleg vašega spletnega frontenda ali API zaledja.

### Kako se agenti prilegajo v strukturo azd projekta

azd projekt je sestavljen iz treh plasti: **infrastruktura**, **koda** in **konfiguracija**. Agenti se vključijo v te plasti na enak način kot katerakoli druga storitev:

| Plast | Kaj počne za tradicionalno aplikacijo | Kaj počne za agenta |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Vzpostavi spletno aplikacijo in bazo podatkov | Vzpostavi končno točko AI modela, iskalni indeks ali gostitelja agenta |
| **Code** (`src/`) | Vsebuje vaš frontend in API izvorno kodo | Vsebuje logiko agenta in definicije pozivov |
| **Configuration** (`azure.yaml`) | Navedene so vaše storitve in cilji gostovanja | Navede agenta kot storitev, ki kaže na njegovo kodo in gostitelja |

### Vloga datoteke `azure.yaml`

Ni treba, da si takoj zapomnite sintakse. Konceptualno je `azure.yaml` datoteka, v kateri azd poveš: *"Tu so storitve, ki sestavljajo mojo aplikacijo, in tukaj je, kje najti njihovo kodo."*

Ko vaš projekt vključuje AI agenta, `azure.yaml` preprosto navede tega agenta kot eno izmed storitev. azd potem ve, da je treba vzpostaviti ustrezno infrastrukturo (na primer Microsoft Foundry Models endpoint ali Container App za gostovanje agenta) in razmestiti vašo kodo agenta—tako kot bi to naredil za spletno aplikacijo ali API.

To pomeni, da ni nič temeljno novega za naučiti. Če razumete, kako azd upravlja spletno storitev, že razumete, kako upravlja agenta.

## Hierarhija konfiguracije

azd uporablja hierarhičen konfiguracijski sistem:
1. **Parametri ukazne vrstice** (najvišja prioriteta)
2. **Spremenljivke okolja**
3. **Lokalna konfiguracija projekta** (`.azd/config.json`)
4. **Globalna uporabniška konfiguracija** (`~/.azd/config.json`)
5. **Privzete vrednosti** (najnižja prioriteta)

## Globalna konfiguracija

### Nastavljanje globalnih privzetih nastavitev
```bash
# Nastavi privzeto naročnino
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Nastavi privzeto lokacijo
azd config set defaults.location "eastus2"

# Nastavi privzeto konvencijo poimenovanja skupin virov
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Prikaži vse globalne nastavitve
azd config show

# Odstrani konfiguracijo
azd config unset defaults.location
```

### Pogoste globalne nastavitve
```bash
# Razvojne nastavitve
azd config set alpha.enable true                    # Omogoči alfa funkcije
azd config set telemetry.enabled false             # Onemogoči telemetrijo
azd config set output.format json                  # Nastavi izhodni format

# Varnostne nastavitve
azd config set auth.useAzureCliCredential true     # Uporabi Azure CLI za avtentikacijo
azd config set tls.insecure false                  # Zahtevaj preverjanje TLS

# Prilagajanje zmogljivosti
azd config set provision.parallelism 5             # Vzporedno ustvarjanje virov
azd config set deploy.timeout 30m                  # Časovna omejitev uvajanja
```

## 🏗️ Konfiguracija projekta

### Struktura `azure.yaml`
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

### Možnosti konfiguracije storitve

#### Tipi gostiteljev
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

#### Nastavitve po jeziku
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

# Ustvari na določeni lokaciji
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

# Pričakovan izhod:
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

### Souporaba okolij v ekipi

Ko na projektu dela več oseb, se je treba dogovoriti o tem, **kaj gre z repozitorijem in kaj ostane lokalno**. azd hrani vsako okolje v mapi `.azure/`, in ne vsega bi smeli dodati v repozitorij.

**Kaj je v `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Kaj dodati v .gitignore.** Privzeta `.gitignore` datoteka azd že izključuje `.azure/`. Pustite tako—datoteke `.env` lahko vsebujejo skrivnosti, in ID-ji virov so specifični za tistega, ki jih je vzpostavil. Vsak član ekipe ustvari svoje **lastno** okolje lokalno:

```bash
# Vsak razvijalec to zažene enkrat, da dobi svoje izolirano okolje
azd env new dev-alice
azd up
```

**Preklapljanje med okolji.** Razvijalec, ki upravlja več okolij, izbere aktivno okolje pred izvajanjem ukazov:

```bash
azd env list                 # prikaži vsa lokalna okolja in katero je privzeto
azd env select staging       # nastavi 'staging' kot aktivno okolje
azd env get-values           # preveri, ali si usmerjen na pravo okolje
```

**Nudenje ne-zaupanih privzetih nastavitev ekipi.** Zavežite predlogo (commit) (kot je `.azure/env.template` zgoraj), da vsi vedo, katere spremenljivke je treba nastaviti—vendar nikoli ne zavežite izpolnjenih vrednosti. Novi sodelavci kopirajo predlogo in vpišejo svoje vrednosti.

**Okolja v CI/CD.** Pipeline-i ne berejo vaše lokalne mape `.azure/`. Namesto tega zagotovite vrednosti okolja kot spremenljivke/skrivnosti pipeline-a, in azd jih prebere iz procesa okolja:

```bash
# V CI, azd prebere te vrednosti iz okolja, ne iz .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Pravilo palca:** infrastrukturna koda (`infra/`, `azure.yaml`) se deli v Gitu; stanje okolja in skrivnosti (`.azure/`) so za posameznega razvijalca in za pipeline. `azd pipeline config` samodejno nastavi spremenljivke pipeline-a za vas.

## 🔐 Konfiguracija preverjanja pristnosti

### Integracija z Azure CLI
```bash
# Uporabi poverilnice Azure CLI (privzeto)
azd config set auth.useAzureCliCredential true

# Prijavi se z določenim najemnikom
az login --tenant <tenant-id>

# Nastavi privzeto naročnino
az account set --subscription <subscription-id>
```

### Avtentikacija s Service Principal
Za CI/CD pipeline-e:
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
# Omogoči preverjanje pristnosti upravljane identitete.
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Konfiguracija infrastrukture

### Bicep parametri
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

### Terraform konfiguracija
Za Terraform projekte konfigurirajte v `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Konfiguracija razmestitve

### Nastavitve gradnje
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
Primer `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Napredna konfiguracija

### Poimenovanje virov po meri
```bash
# Določite konvencije poimenovanja
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

## 🎯 Konfiguracije, specifične za okolje

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
# .azure/priprava/.env
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

### Preverjanje konfiguracije
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

### Vaja 1: Konfiguracija za več okolij (15 minut)

**Cilj**: Ustvariti in konfigurirati tri okolja z različnimi nastavitvami

```bash
# Ustvari razvojno okolje
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Ustvari predprodukcijsko okolje
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
- [ ] Tri okolja ustvarjena uspešno
- [ ] Vsako okolje ima edinstveno konfiguracijo
- [ ] Možno je preklapljati med okolji brez napak
- [ ] `azd env list` prikaže vsa tri okolja

### Vaja 2: Upravljanje skrivnosti (10 minut)

**Cilj**: Vaditi varno konfiguracijo z občutljivimi podatki

```bash
# Nastavi skrivnosti (se ne prikažejo v izhodu)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nastavi konfiguracijo brez skrivnosti
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Prikaži okolje (skrivnosti naj bodo cenzurirane)
azd env get-values

# Preveri, ali so skrivnosti shranjene
azd env get DB_PASSWORD  # Naj bi prikazalo dejansko vrednost
```

**Kriteriji uspeha:**
- [ ] Skrivnosti shranjene brez prikaza v terminalu
- [ ] `azd env get-values` prikaže zamejene skrivnosti
- [ ] Posamezen `azd env get <SECRET_NAME>` pridobi dejansko vrednost

## Naslednji koraki

- [Vaš prvi projekt](first-project.md) - Uporabite konfiguracijo v praksi
- [Vodnik za razmestitev](../chapter-04-infrastructure/deployment-guide.md) - Uporabite konfiguracijo za razmestitev
- [Vzpostavljanje virov](../chapter-04-infrastructure/provisioning.md) - Konfiguracije pripravljene za produkcijo

## Reference

- [Referenca konfiguracije azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Shema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Spremenljivke okolja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 3 - Konfiguracija in preverjanje pristnosti
- **⬅️ Prejšnje**: [Vaš prvi projekt](first-project.md)
- **➡️ Naslednje poglavje**: [Poglavje 4: Infrastruktura kot koda](../chapter-04-infrastructure/deployment-guide.md)
- **Naslednja lekcija**: [Vaš prvi projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->