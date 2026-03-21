# Konfigurointiopas

**Lukujen navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 3 - Konfigurointi ja todennus
- **⬅️ Edellinen**: [Ensimmäinen projektisi](first-project.md)
- **➡️ Seuraava**: [Julkaisuopas](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Seuraava luku**: [Luku 4: Infrastruktuuri koodina](../chapter-04-infrastructure/deployment-guide.md)

## Johdanto

Tämä kattava opas käsittelee kaikkia Azure Developer CLI:n konfiguroinnin osa-alueita optimaalisten kehitys- ja julkaisutöiden tukemiseksi. Opit konfiguraation hierarkian, ympäristöhallinnan, todennustavat ja edistyneet konfiguraatiomallit, jotka mahdollistavat tehokkaat ja turvalliset Azure-julkaisut.

## Oppimistavoitteet

Tämän oppitunnin jälkeen osaat:
- Hallita azd:n konfiguraatiohierarkiaa ja ymmärtää asetusten priorisoinnin
- Konfiguroida globaalit ja projektiikohtaiset asetukset tehokkaasti
- Hallita useita ympäristöjä eri asetuksilla
- Toteuttaa turvallisia todennus- ja valtuutusmalleja
- Ymmärtää edistyneitä konfiguraatiomalleja monimutkaisiin tilanteisiin

## Oppimistulokset

Oppitunnin suorittamisen jälkeen pystyt:
- Konfiguroimaan azd:n optimaalisiin kehitystyönkulkujen vaatimuksiin
- Luomaan ja hallinnoimaan useita julkaisuympäristöjä
- Toteuttamaan turvallisia konfiguraationhallintakäytäntöjä
- Vianmääritykseen konfiguraatioihin liittyvissä ongelmissa
- Räätälöimään azd:n toimintaa organisaation erityisvaatimusten mukaisesti

Tämä kattava opas käsittelee kaikkia Azure Developer CLI:n konfiguroinnin osa-alueita optimaalisten kehitys- ja julkaisutöiden tukemiseksi.

## AI-agenttien ymmärtäminen azd-projektissa

Jos olet uusi AI-agenttien kanssa, tässä on yksinkertainen tapa ajatella niitä azd-maailmassa.

### Mikä on agentti?

Agentti on ohjelmisto, joka voi vastaanottaa pyynnön, järkeillä sitä ja toteuttaa toimintoja—usein kutsumalla AI-mallia, hakemalla tietoa tai kutsumalla muita palveluja. azd-projektissa agentti on vain toinen palvelu web-frontendin tai API-backendin rinnalla.

### Miten agentit sopivat azd-projektin rakenteeseen

Azd-projekti koostuu kolmesta kerroksesta: **infrastruktuuri**, **koodi** ja **konfiguraatio**. Agentit liitetään näihin kerroksiin samalla tavalla kuin muutkin palvelut:

| Kerros | Mitä se tekee perinteiselle sovellukselle | Mitä se tekee agentille |
|-------|-------------------------------------|---------------------------|
| **Infrastruktuuri** (`infra/`) | Provisionoi verkkosovelluksen ja tietokannan | Provisionoi AI-mallin päätepisteen, hakemistoindeksin tai agentin isännän |
| **Koodi** (`src/`) | Sisältää käyttöliittymän ja API:n lähdekoodin | Sisältää agentin logiikan ja prompt-määrittelyt |
| **Konfiguraatio** (`azure.yaml`) | Luettelee palvelusi ja niiden isännöintikohteet | Luettelee agentin palveluna, osoittaen sen koodiin ja isäntään |

### `azure.yaml`-tiedoston rooli

Sinun ei tarvitse osata syntaksia ulkoa juuri nyt. Käsitteellisesti `azure.yaml` on tiedosto, jossa kerrot azd:lle: "Tässä ovat sovellukseni palvelut ja tässä kerrotaan, mistä löydät niiden koodin."

Kun projektiisi sisältyy AI-agentti, `azure.yaml` listaa kyseisen agentin yhtenä palveluna. azd tietää sitten provisionoida oikean infrastruktuurin (kuten Microsoft Foundry Models -päätepisteen tai Container Appin agentin isännöimiseksi) ja julkaista agenttisi koodin—samalla tavalla kuin se tekisi web-sovellukselle tai API:lle.

Tämä tarkoittaa, ettei ole perusasioissa mitään uutta opittavaa. Jos ymmärrät kuinka azd hallitsee web-palvelua, ymmärrät jo myös, kuinka se hallitsee agenttia.

## Konfiguraation hierarkia

azd käyttää hierarkkista konfiguraatiojärjestelmää:
1. **Komentoriviparametrit** (korkein prioriteetti)
2. **Ympäristömuuttujat**
3. **Paikallinen projektikonfiguraatio** (`.azd/config.json`)
4. **Käyttäjän globaali konfiguraatio** (`~/.azd/config.json`)
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

# Näytä kaikki globaalit määritykset
azd config list

# Poista määritys
azd config unset defaults.location
```

### Yleiset globaalit asetukset
```bash
# Kehityksen asetukset
azd config set alpha.enable true                    # Ota alfaominaisuudet käyttöön
azd config set telemetry.enabled false             # Poista telemetria käytöstä
azd config set output.format json                  # Aseta ulostulomuoto

# Suojausasetukset
azd config set auth.useAzureCliCredential true     # Käytä Azure CLI:tä todennukseen
azd config set tls.insecure false                  # Pakota TLS-tarkistus

# Suorituskyvyn viritys
azd config set provision.parallelism 5             # Resurssien rinnakkainen luominen
azd config set deploy.timeout 30m                  # Käyttöönoton aikakatkaisu
```

## 🏗️ Projektikonfiguraatio

### `azure.yaml`-rakenne
`azure.yaml`-tiedosto on azd-projektisi sydän:

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

### Palvelun konfiguraatioasetukset

#### Isännöintityypit
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

#### Kielekohtaiset asetukset
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

# Luo mallin pohjalta
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Ympäristön konfiguraatio
Jokaisella ympäristöllä on oma konfiguraationsa tiedostossa `.azure/<env-name>/config.json`:

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

# Odotettu tuloste:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Poista ympäristömuuttuja
azd env unset DEBUG

# Varmista poisto
azd env get-values | grep DEBUG
# (ei pitäisi palauttaa mitään)
```

### Ympäristöpohjat
Luo `.azure/env.template` yhdenmukaista ympäristöasetusta varten:
```bash
# Pakolliset muuttujat
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

## 🔐 Autentikoinnin asetukset

### Azure CLI -integraatio
```bash
# Käytä Azure CLI -tunnistetietoja (oletus)
azd config set auth.useAzureCliCredential true

# Kirjaudu sisään tiettyyn vuokraajaan
az login --tenant <tenant-id>

# Aseta oletustilaus
az account set --subscription <subscription-id>
```

### Service Principal -todennus
CI/CD-putkistoja varten:
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
# Ota käyttöön hallinnoidun identiteetin todennus
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastruktuurin konfigurointi

### Bicep-parametrit
Määritä infrastruktuurin parametrit tiedostossa `infra/main.parameters.json`:
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
Terraform-projekteissa määritä tiedostossa `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Julkaisukonfiguraatio

### Build-konfiguraatio
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

## 🔧 Edistynyt konfigurointi

### Mukautetut resurssinimet
```bash
# Aseta nimeämiskäytännöt
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Verkon konfiguraatio
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Valvonnan konfiguraatio
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

### Staging-ympäristö
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

# Validoi infrastruktuuri
azd provision --dry-run
```

### Konfiguraation skriptit
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

# Tarkista azure.yaml-tiedoston syntaksi
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

### 3. Versiohallinnan huomioitavat seikat
```bash
# .gitignore
.azure/*/config.json         # Ympäristöasetukset (sisältävät resurssitunnuksia)
.azure/*/.env               # Ympäristömuuttujat (voi sisältää salaisuuksia)
.env                        # Paikallinen ympäristötiedosto
```

### 4. Konfiguraation dokumentointi
Dokumentoi konfiguraatiosi tiedostoon `CONFIG.md`:
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

## 🎯 Käytännön harjoitustehtävät

### Harjoitus 1: Moniympäristökonfigurointi (15 minuuttia)

**Tavoite**: Luo ja konfiguroi kolme ympäristöä eri asetuksilla

```bash
# Luo kehitysympäristö
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Luo staging-ympäristö
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Luo tuotantoympäristö
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Tarkista jokainen ympäristö
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Onnistumiskriteerit:**
- [ ] Kolme ympäristöä luotu onnistuneesti
- [ ] Jokaisella ympäristöllä on yksilöllinen konfiguraatio
- [ ] Voi vaihtaa ympäristöjen välillä ilman virheitä
- [ ] `azd env list` näyttää kaikki kolme ympäristöä

### Harjoitus 2: Salaisuuksien hallinta (10 minuuttia)

**Tavoite**: Harjoitella turvallista konfiguraatiota arkaluontoisen datan kanssa

```bash
# Aseta salaisuudet (ei näytetä tulosteessa)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Aseta ei-salainen konfiguraatio
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Näytä ympäristö (salaisuuksien pitäisi olla sensuroituja)
azd env get-values

# Varmista, että salaisuudet on tallennettu
azd env get DB_PASSWORD  # Pitäisi näyttää todellinen arvo
```

**Onnistumiskriteerit:**
- [ ] Salaisuudet tallennettu ilman, että niitä näytetään terminaalissa
- [ ] `azd env get-values` näyttää sensuroidut salaisuudet
- [ ] Yksittäinen `azd env get <SECRET_NAME>` palauttaa todellisen arvon

## Seuraavat askeleet

- [Ensimmäinen projektisi](first-project.md) - Sovella konfiguraatiota käytännössä
- [Julkaisuopas](../chapter-04-infrastructure/deployment-guide.md) - Käytä konfiguraatiota käyttöönotossa
- [Resurssien provisiointi](../chapter-04-infrastructure/provisioning.md) - Tuotantovalmiit konfiguraatiot

## Viitteet

- [azd-konfiguraation viite](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml-skeema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Ympäristömuuttujat](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Lukujen navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 3 - Konfigurointi ja todennus
- **⬅️ Edellinen**: [Ensimmäinen projektisi](first-project.md)
- **➡️ Seuraava luku**: [Luku 4: Infrastruktuuri koodina](../chapter-04-infrastructure/deployment-guide.md)
- **Seuraava oppitunti**: [Ensimmäinen projektisi](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälypohjaisen käännöspalvelun [Co-op Translator](https://github.com/Azure/co-op-translator) avulla. Vaikka pyrimme tarkkuuteen, automaattisissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä on pidettävä määräävänä lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskääntäjää. Emme ole vastuussa mahdollisista väärinymmärryksistä tai virhetulkinoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->