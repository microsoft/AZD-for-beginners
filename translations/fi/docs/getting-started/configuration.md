<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-21T16:04:53+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "fi"
}
-->
# Konfigurointiohje

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 3 - Konfigurointi ja autentikointi
- **⬅️ Edellinen**: [Ensimmäinen projektisi](first-project.md)
- **➡️ Seuraava**: [Julkaisuohje](../deployment/deployment-guide.md)
- **🚀 Seuraava luku**: [Luku 4: Infrastructure as Code](../deployment/deployment-guide.md)

## Johdanto

Tämä kattava opas käsittelee Azure Developer CLI:n konfigurointia optimaalisten kehitys- ja julkaisuvirtojen saavuttamiseksi. Opit konfigurointihierarkiasta, ympäristön hallinnasta, autentikointimenetelmistä ja edistyneistä konfigurointimalleista, jotka mahdollistavat tehokkaat ja turvalliset Azure-julkaisut.

## Oppimistavoitteet

Tämän oppitunnin lopussa osaat:
- Hallita azd:n konfigurointihierarkiaa ja ymmärtää, miten asetukset priorisoidaan
- Konfiguroida globaalit ja projektikohtaiset asetukset tehokkaasti
- Hallita useita ympäristöjä eri asetuksilla
- Toteuttaa turvallisia autentikointi- ja valtuutusmalleja
- Ymmärtää edistyneitä konfigurointimalleja monimutkaisiin tilanteisiin

## Oppimistulokset

Kun olet suorittanut tämän oppitunnin, pystyt:
- Konfiguroimaan azd:n optimaalisiin kehitysvirtoihin
- Asettamaan ja hallitsemaan useita julkaisuympäristöjä
- Toteuttamaan turvallisia konfigurointikäytäntöjä
- Ratkaisemaan konfigurointiin liittyviä ongelmia
- Mukauttamaan azd:n toimintaa organisaation erityistarpeisiin

Tämä kattava opas käsittelee Azure Developer CLI:n konfigurointia optimaalisten kehitys- ja julkaisuvirtojen saavuttamiseksi.

## Konfigurointihierarkia

azd käyttää hierarkkista konfigurointijärjestelmää:
1. **Komentorivin liput** (korkein prioriteetti)
2. **Ympäristömuuttujat**
3. **Paikallinen projektikonfiguraatio** (`.azd/config.json`)
4. **Globaali käyttäjäkonfiguraatio** (`~/.azd/config.json`)
5. **Oletusarvot** (alin prioriteetti)

## Globaali konfiguraatio

### Globaalien oletusten asettaminen
```bash
# Aseta oletustilaus
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Aseta oletussijainti
azd config set defaults.location "eastus2"

# Aseta oletusresurssiryhmän nimeämiskäytäntö
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Näytä kaikki globaalit asetukset
azd config list

# Poista asetus
azd config unset defaults.location
```

### Yleiset globaalit asetukset
```bash
# Kehityksen mieltymykset
azd config set alpha.enable true                    # Ota alfa-ominaisuudet käyttöön
azd config set telemetry.enabled false             # Poista telemetria käytöstä
azd config set output.format json                  # Aseta tulostusmuoto

# Turvallisuusasetukset
azd config set auth.useAzureCliCredential true     # Käytä Azure CLI:tä autentikointiin
azd config set tls.insecure false                  # Pakota TLS-varmennus

# Suorituskyvyn optimointi
azd config set provision.parallelism 5             # Rinnakkainen resurssien luonti
azd config set deploy.timeout 30m                  # Käyttöönoton aikakatkaisu
```

## 🏗️ Projektikonfiguraatio

### azure.yaml-rakenne
`azure.yaml`-tiedosto on azd-projektisi ydin:

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

### Palvelun konfigurointivaihtoehdot

#### Isäntätyypit
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

#### Kieleen liittyvät asetukset
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

## 🌟 Ympäristön hallinta

### Ympäristöjen luominen
```bash
# Luo uusi ympäristö
azd env new development

# Luo tiettyyn sijaintiin
azd env new staging --location "westus2"

# Luo mallipohjasta
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Ympäristön konfiguraatio
Jokaisella ympäristöllä on oma konfiguraatio tiedostossa `.azure/<env-name>/config.json`:

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

### Ympäristömuuttujat
```bash
# Aseta ympäristökohtaiset muuttujat
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Näytä ympäristömuuttujat
azd env get-values

# Odotettu tulos:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=salainen-api-avain
# DEBUG=true

# Poista ympäristömuuttuja
azd env unset DEBUG

# Vahvista poisto
azd env get-values | grep DEBUG
# (ei pitäisi palauttaa mitään)
```

### Ympäristömallit
Luo `.azure/env.template` johdonmukaista ympäristön asennusta varten:
```bash
# Vaaditut muuttujat
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Sovelluksen asetukset
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Valinnaiset kehitysasetukset
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Autentikointikonfiguraatio

### Azure CLI -integraatio
```bash
# Käytä Azure CLI -tunnuksia (oletus)
azd config set auth.useAzureCliCredential true

# Kirjaudu sisään tietyn vuokraajan kanssa
az login --tenant <tenant-id>

# Aseta oletustilaus
az account set --subscription <subscription-id>
```

### Service Principal -autentikointi
CI/CD-putkia varten:
```bash
# Aseta ympäristömuuttujat
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Tai määritä suoraan
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Hallittu identiteetti
Azure-isännöidyille ympäristöille:
```bash
# Ota käyttöön hallittu identiteettitodennus
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktuurin konfiguraatio

### Bicep-parametrit
Konfiguroi infrastruktuurin parametrit tiedostossa `infra/main.parameters.json`:
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

### Terraform-konfiguraatio
Terraform-projekteille konfiguroi tiedostossa `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Julkaisukonfiguraatio

### Rakennuskonfiguraatio
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

### Docker-konfiguraatio
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
Esimerkki `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Edistynyt konfiguraatio

### Mukautettu resurssien nimeäminen
```bash
# Aseta nimeämiskäytännöt
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Verkkokonfiguraatio
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Seurantakonfiguraatio
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

## 🎯 Ympäristökohtaiset konfiguraatiot

### Kehitysympäristö
```bash
# .azure/kehitys/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Välivaiheen ympäristö
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Tuotantoympäristö
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfiguraation validointi

### Konfiguraation validointi
```bash
# Tarkista konfiguraation syntaksi
azd config validate

# Testaa ympäristömuuttujat
azd env get-values

# Vahvista infrastruktuuri
azd provision --dry-run
```

### Konfiguraatioskriptit
Luo validointiskriptit kansioon `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Tarkista vaaditut ympäristömuuttujat
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Vahvista azure.yaml-syntaksi
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Parhaat käytännöt

### 1. Käytä ympäristömuuttujia
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Järjestä konfiguraatiotiedostot
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

### 3. Versionhallinnan huomioiminen
```bash
# .gitignore
.azure/*/config.json         # Ympäristön asetukset (sisältävät resurssitunnuksia)
.azure/*/.env               # Ympäristömuuttujat (voi sisältää salaisuuksia)
.env                        # Paikallinen ympäristötiedosto
```

### 4. Konfiguraation dokumentointi
Dokumentoi konfiguraatiosi tiedostossa `CONFIG.md`:
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

## 🎯 Käytännön harjoitukset

### Harjoitus 1: Moniympäristön konfiguraatio (15 minuuttia)

**Tavoite**: Luo ja konfiguroi kolme ympäristöä eri asetuksilla

```bash
# Luo kehitysympäristö
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Luo testausympäristö
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Luo tuotantoympäristö
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Varmista jokainen ympäristö
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Onnistumisen kriteerit:**
- [ ] Kolme ympäristöä luotu onnistuneesti
- [ ] Jokaisella ympäristöllä on ainutlaatuinen konfiguraatio
- [ ] Ympäristöjen välillä voi vaihtaa ilman virheitä
- [ ] `azd env list` näyttää kaikki kolme ympäristöä

### Harjoitus 2: Salaisuuksien hallinta (10 minuuttia)

**Tavoite**: Harjoittele turvallista konfiguraatiota arkaluontoisilla tiedoilla

```bash
# Aseta salaisuudet (ei näytetä tulosteessa)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Aseta ei-salainen konfiguraatio
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Näytä ympäristö (salaisuudet pitäisi peittää)
azd env get-values

# Varmista, että salaisuudet tallennetaan
azd env get DB_PASSWORD  # Pitäisi näyttää todellinen arvo
```

**Onnistumisen kriteerit:**
- [ ] Salaisuudet tallennettu ilman, että ne näkyvät terminaalissa
- [ ] `azd env get-values` näyttää salaisuudet peitettyinä
- [ ] Yksittäinen `azd env get <SECRET_NAME>` hakee todellisen arvon

## Seuraavat askeleet

- [Ensimmäinen projektisi](first-project.md) - Sovella konfiguraatiota käytännössä
- [Julkaisuohje](../deployment/deployment-guide.md) - Käytä konfiguraatiota julkaisuun
- [Resurssien provisiointi](../deployment/provisioning.md) - Tuotantovalmiit konfiguraatiot

## Viitteet

- [azd Konfiguraatioviite](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Ympäristömuuttujat](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 3 - Konfigurointi ja autentikointi
- **⬅️ Edellinen**: [Ensimmäinen projektisi](first-project.md)
- **➡️ Seuraava luku**: [Luku 4: Infrastructure as Code](../deployment/deployment-guide.md)
- **Seuraava oppitunti**: [Ensimmäinen projektisi](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->