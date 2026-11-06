# Konfigurointiohje

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 3 - Konfigurointi & Tunnistus
- **⬅️ Edellinen**: [Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava**: [Julkaisun opas](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Seuraava luku**: [Luku 4: Infrastruktuuri koodina](../chapter-04-infrastructure/deployment-guide.md)

## Johdanto

> Tarkistettu versioon `azd 1.37.2` (marraskuu 2026). Bash-komennot olettavat alustetun azd-projektin. Ellei erikseen kuvata täydellistä tiedostoa, YAML/Bicep-koodipätkät ovat osia, jotka yhdistetään vastaaviin projektitiedostoihin, eivät itsenäisiä suoritettavia projekteja.

Tämä kattava opas käsittelee kaikki Azure Developer CLI:n konfigurointiin liittyvät näkökohdat optimaalisten kehitys- ja julkaisutapojen saavuttamiseksi. Opit konfigurointihierarkian, ympäristöhallinnan, tunnistusmenetelmät ja edistyneet konfigurointimallit, jotka mahdollistavat tehokkaat ja turvalliset Azure-julkaisut.

## Oppimistavoitteet

Tämän oppitunnin lopussa osaat:
- Hallita azd:n konfigurointihierarkiaa ja ymmärtää asetusten priorisoinnin
- Konfiguroida globaalit ja projektikohtaiset asetukset tehokkaasti
- Hallita useita ympäristöjä erilaisilla konfiguraatioilla
- Toteuttaa turvallisia tunnistus- ja valtuutusmalleja
- Ymmärtää edistyneet konfigurointimallit monimutkaisille skenaarioille

## Oppimistulokset

Oppitunnin suorittamisen jälkeen pystyt:
- Konfiguroimaan azd:tä optimaalisia kehitystyönkulkuja varten
- Perustamaan ja hallitsemaan useita julkaisuympäristöjä
- Toteuttamaan turvalliset konfiguroinnin hallintakäytännöt
- Ratkaisemaan konfigurointiin liittyviä ongelmia
- Räätälöimään azd:n toimintaa organisaation erityisvaatimusten mukaan

Tämä kattava opas käsittelee kaikki Azure Developer CLI:n konfiguroinnin näkökohdat optimaalisten kehitys- ja julkaisutapojen saavuttamiseksi.

## Ymmärtäminen AI-agenttien roolista azd-projektissa

Jos olet uusi AI-agenteissa, tässä yksinkertainen tapa ajatella niitä azd-maailmassa.

### Mitä agentti on?

Agentti on ohjelmisto, joka voi vastaanottaa pyynnön, käsitellä sitä ja toteuttaa toimenpiteitä – usein kutsumalla tekoälymallia, hakemalla tietoja tai kutsumalla muita palveluita. azd-projektissa agentti on vain toinen **palvelu** web-käyttöliittymäsi tai API-takapalvelusi rinnalla.

### Miten agentit sopivat azd-projektin rakenteeseen

azd-projekti koostuu kolmesta tasosta: **infrastruktuuri**, **koodi** ja **konfigurointi**. Agentit yhdistetään näihin tasoihin samalla tavalla kuin muutkin palvelut:

| Taso | Mitä se tekee perinteiselle sovellukselle | Mitä se tekee agentille |
|-------|-----------------------------------------|-------------------------|
| **Infrastruktuuri** (`infra/`) | Tarjoaa web-sovelluksen ja tietokannan | Tarjoaa AI-mallin päätepisteen, hakemistopalvelimen tai agentin isännän |
| **Koodi** (`src/`) | Sisältää frontend- ja API-lähdekoodin | Sisältää agenttilogiikan ja kehotemäärittelyt |
| **Konfigurointi** (`azure.yaml`) | Listaa palvelut ja niiden hosting-kohteet | Listaa agentin palveluna, osoittaen sen koodiin ja isäntään |

### `azure.yaml` rooli

Sinun ei tarvitse muistaa syntaksia juuri nyt. Käsitteellisesti `azure.yaml` on tiedosto, jossa kerrot azd:lle: *"Tässä ovat sovellukseni palvelut, ja tässä niiden koodi."*

Kun projekti sisältää AI-agentin, `azure.yaml` vain listaa tuon agentin palveluista. azd tietää sitten, että sen täytyy varata oikeanlainen infrastruktuuri (kuten Microsoft Foundry Models -päätepiste tai Container App agentin isännöintiin) ja ottaa agenttikoodi käyttöön – aivan kuten web-sovelluksen tai API:n kanssa.

Tämä tarkoittaa, että ei ole mitään täysin uutta opittavaa. Jos ymmärrät, miten azd hallinnoi web-palvelua, ymmärrät jo, miten se hallinnoi agenttia.

## Konfigurointihierarkia

azd:llä on erilliset konfigurointipinnat, ei yhtä yleistä päällekkäisyystä:
- **Globaalit käyttäjäasetukset**: `~/.azd/config.json`, joita hallinnoi `azd config`.
- **Projektin määrittely**: `azure.yaml` määrittelee palvelut, infrastruktuurin ja koukut.
- **Paikallinen ympäristön valinta**: `.azure/config.json`.
- **Ympäristökohtaiset arvot**: `.azure/<name>/.env`, joita hallinnoi `azd env`; lisäasetukset sijaitsevat kyseisen ympäristön `config.json`.
- **Liput ja prosessimuuttujat**: ohittavat vain tietyn komennon/palveluntarjoajan tukemat asetukset.

Satunnainen `azd env set`-arvo ei automaattisesti muutu infrastruktuurin parametriksi tai käyttöön otettavaksi sovellusasetukseksi. Viittaa siihen nimenomaisesti parametrien tiedostossa, tuetussa palvelukonfiguraatiossa tai koukussa.

## Globaali konfigurointi

### Oletusasetusten määrittäminen globaalisti
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### Yleisiä globaaleja asetuksia
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ Projektin konfigurointi

### azure.yaml -rakenne
`azure.yaml`-tiedosto on azd-projektisi sydän:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

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
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

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

Tämä on **projektin määrittelyesimerkki**, ei valmiiksi toimitettu aloitusmalli. Luo siihen viitatut lähdekansiot, koukkuskriptit, pakkausskriptit ja vastaavat `infra/main.bicep`/`main.parameters.json` ennen sen suorittamista. Tietokannat kuuluvat infrastruktuuriin; `postgres` ei ole sisäänrakennettu palvelin. Infrastruktuurin parametrit määritellään palveluntarjoajan parametrien tiedostossa, ei `infra.parameters`.

### Palvelun konfiguraatiovaihtoehdot

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

#### Kielen erityiset rakentamiskoukut

Seuraavat palvelupätkät havainnollistavat koukkuja; yhdistä ne kunkin palvelun oikeisiin `project` ja `host` kanssa. `buildCommand` ja `startCommand` eivät ole yleisiä azd-palvelun ominaisuuksia. Määritä käynnistys sovelluksessa, Dockerfilessä tai isännän infrastruktuurissa.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 Ympäristön hallinta

### Ympäristöjen luonti
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Ympäristön konfigurointi
Ympäristön ydinarvot sijaitsevat `.azure/<env-name>/.env`, mukaan lukien `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` ja `AZURE_LOCATION`. Käytä `azd env config get/set` lisäympäristöjen JSON-asetuksiin. Seuraava JSON on **käsitteellinen sovellustila**, ei azd-konfiguraation skeema; älä kopioi sitä azd:n tiedostoihin:

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

**Vain selkeyttä varten suorassa tekstissä.** Tavalliset `azd env set` arvot kirjoitetaan `.azure/<name>/.env` ja ne voidaan tulostaa read-komentoja käyttämällä. Älä käytä esimerkin API-avainta oikeana tunnistetietona. Salaisuuksiin käytä `azd env set-secret` ja selkeää ajoajan yhdistämistä.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### Ympäristömallit
Luo **ei-salainen, manuaalisesti ylläpidettävä** `.env.example` projektin juureen yhtenäistä käyttöönottoa varten. azd ei lataa automaattisesti tiedostoa nimeltä `env.template`:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### Ympäristöjen jakaminen tiimin kesken

Kun useampi henkilö työskentelee projektissa, on sovittava **mitä versionhallinnassa on ja mitä säilytetään paikallisesti**. azd pitää jokaisen ympäristön `.azure/`-kansiossa, eikä kaikkea siitä pitäisi tallentaa.

**Mitä on `.azure/`:ssä:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Mitä gitignoreen.** azd:n oletus `.gitignore` sulkee jo `.azure/` pois. Pidä näin – `.env` tiedostot voivat sisältää salaisuuksia, ja resurssi-ID:t ovat yksilöllisiä sen mukaan, kuka ne varasi. Kukin tiimin jäsen luo **oman** oman ympäristönsä paikallisesti:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Vaihtaminen ympäristöjen välillä.** Kehittäjä, joka hallinnoi useita ympäristöjä, valitsee aktiivisen ennen komentojen suorittamista:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Ei-salaisien oletusten tarjoaminen tiimille.** Tallenna `.env.example` pois ignored `.azure/` -kansiosta. Uudet tiimikaverit kopioivat sen paikalliseen ignored-tiedostoon, täyttävät arvot ja tuovat sen nimenomaisesti `azd env set --file <local-file>` avulla. Älä koskaan tuo tyhjiä paikkamerkkejä toimivan ympäristön päälle.

**Ympäristöt CI/CD:ssä.** Putket eivät lue paikallista `.azure/`-kansiotasi. Sen sijaan tarjoa ympäristöarvot putkimuuttujina/salaisuuksina, ja azd lukee ne prosessiympäristöstä:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Nyrkkisääntö:** infrastruktuurikoodi (`infra/`, `azure.yaml`) jaetaan Gitissä; ympäristön *tila ja salaisuudet* (`.azure/`) ovat kehittäjäkohtaisia ja putkikohtaisia. `azd pipeline config` asettaa putkimuuttujat automaattisesti.

## 🔐 Tunnistuksen konfigurointi

### Azure CLI -integraatio
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Palveluperiaattella tunnistautuminen
CI/CD-putkille:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Hallittu identiteetti
Azure-isännöidyille ympäristöille:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Infrastruktuurin konfigurointi

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

### Terraform-konfigurointi
Terraform-projekteissa azd korvaa paikkamerkit tiedostossa `infra/main.tfvars.json`. Näiden nimien on vastattava määriteltyjä Terraformin syötteitä:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Julkaisun konfigurointi

### Rakennuskonfigurointi
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Docker-konfigurointi
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
Polut ovat palvelun projektin suhteessa. Dockerfile:n on määriteltävä kaikki käyttämänsä `ARG` -arvot. Monivaiheisessa rakenteessa aseta julkaistava vaihe viimeiseksi tai käytä mukautettua pakkausprosessia; `docker.target` ei ole tuettu ominaisuus tarkastellussa skeemassa.

## 🔧 Edistynyt konfigurointi

### Mukautettu resurssin nimeäminen
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Määrittele todelliset resurssinimet Bicepissä/Terraformissa ja pidä resurssiryhmän luonti yhdenmukaisena tämän asetuksen kanssa. Yleisiä `naming.storageAccount` tai `naming.keyVault` -konfigurointiavainparia ei ole.

### Verkkokonfigurointi
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Yhdistä nämä **havainnollistavat parametrimerkinnät** tiedostoon `infra/main.parameters.json` osion `parameters` alle, ja määrittele sekä käytä vastaavia parametreja Bicepissä. Ne eivät tee mitään itsenäisesti.

### Monitorointi-konfigurointi
Luo Application Insights ja Log Analytics Bicepissä/Terraformissa ja konfiguroi sovelluksen telemetria SDK:ssasi. Ei ole olemassa yleistä ylimmän tason `monitoring` lohkoa tiedostossa `azure.yaml`, joka loisi näitä resursseja. Katso [seurannan infrastruktuuri](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Ympäristökohtaiset konfiguraatiot

### Kehitysympäristö
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Esikatseluympäristö
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

## 🔍 Konfiguroinnin validointi

### Validoi konfigurointi
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Konfigurointiskriptit
Luo validointiskriptit tiedostoon `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
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

```

Vältä kovakoodaamasta arkaluontoisia arvoja (erottelu havainnollistava konfiguraatio, ei toinen `database` -avain samassa tiedostossa):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Järjestä konfiguraatiotiedostot
```
.azure/
├── config.json              # Global project config
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

### 3. Versionhallinnan huomioonottaminen
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Konfiguroinnin dokumentointi
Dokumentoi konfigurointi tiedostoon `CONFIG.md`:
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

### Harjoitus 1: Moniympäristöinen konfigurointi (15 minuuttia)

**Tavoite**: Luo ja konfiguroi kolme paikallista ympäristöä eri arvoilla. Aloita alustetusta projektista; käytä vapaana olevia nimiä jos nämä jo ovat olemassa. Nämä sovelluskohtaiset arvot eivät muuta telemetria- tai ajoaikaisia asetuksia, ennen kuin mallipohjasi käyttää niitä.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Onnistumisen kriteerit:**
- [ ] Kolme ympäristöä luotu onnistuneesti
- [ ] Jokaisella ympäristöllä on uniikki konfiguraatio
- [ ] Ympäristöjen välillä voi vaihtaa ilman virheitä
- [ ] `azd env list` näyttää kaikki kolme ympäristöä

### Harjoitus 2: Key Vault -salaisuuden viitteet (10-20 minuuttia)

**Tavoite**: Tallenna Key Vault -viite suoraan, ei raakatekstin. **Alkupiste:** alustettu ympäristö, Azure-kirjautuminen ja pääsy Key Vaultiin, jossa on lupa luoda/lukea esimerkkisalaisuus. Vault-operaatiot voivat maksaa.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**Onnistumisen kriteerit:**
- [ ] Interaktiivinen komento kertoo valitun vaultin ja salaisuuden viitteen
- [ ] Paikallinen `.env` sisältää viitteen, ei esimerkkisalaisuutta
- [ ] Osaa selittää, että ajoajan identiteetti/RBAC ja kulutus on edelleen konfiguroitava

**Yleisiä ongelmia:** 403 vaatii oikean vaultin data-plane-roolin ja leviämisajan; `azd env set ... --secret` ei ole validi komento. Tavallista `get-values`/`get-value` tulostetta ei pidä olettaa sensuroiduksi. Poista testiviite `azd env unset TRAINING_API_KEY` avulla; tämä ei poista vaultin salaista, jonka täytyy siivota erikseen, jos loit sen.

## Seuraavat askeleet

- [Ensimmäinen projektisi](../chapter-01-foundation/first-project.md) - Konfiguroinnin soveltaminen käytännössä
- [Julkaisun opas](../chapter-04-infrastructure/deployment-guide.md) - Käytä konfigurointia julkaisussa
- [Resurssien provisiointi](../chapter-04-infrastructure/provisioning.md) - Tuotantovalmiit konfiguraatiot

## Viitteet

- [azd-konfiguroinnin viite](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml-skeema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Ympäristömuuttujat](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 3 - Määritys ja todennus
- **⬅️ Edellinen**: [Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava luku**: [Luku 4: Infrastruktuuri koodina](../chapter-04-infrastructure/deployment-guide.md)
- **Seuraava oppitunti**: [Todennus ja turvallisuus](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->