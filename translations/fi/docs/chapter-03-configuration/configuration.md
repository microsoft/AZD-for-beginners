# Konfigurointiopas

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 3 - Konfigurointi ja todennus
- **⬅️ Edellinen**: [Ensimmäinen projektisi](first-project.md)
- **➡️ Seuraava**: [Julkaisuopas](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Seuraava luku**: [Luku 4: Infrastruktuuri koodina](../chapter-04-infrastructure/deployment-guide.md)

## Johdanto

Tämä kattava opas kattaa kaikki Azure Developer CLI:n konfigurointiin liittyvät osa-alueet optimoitujen kehitys- ja julkaisuvirtausten tukemiseksi. Opit konfiguraation hierarkiasta, ympäristöjen hallinnasta, todennusmenetelmistä ja edistyneistä konfigurointimalleista, jotka mahdollistavat tehokkaat ja turvalliset Azure-julkaisut.

## Oppimistavoitteet

Tämän oppitunnin jälkeen osaat:
- Hallita azd:n konfigurointihierarkiaa ja ymmärtää, miten asetusten priorisointi toimii
- Konfiguroida globaaleja ja projekti-kohtaisia asetuksia tehokkaasti
- Hallita useita ympäristöjä eri asetuksilla
- Toteuttaa turvallisia todennus- ja valtuutusmalleja
- Ymmärtää edistyneitä konfigurointimalleja monimutkaisille skenaarioille

## Oppimistulokset

Oppitunnin suorittamisen jälkeen pystyt:
- Konfiguroimaan azd:n optimoiduiksi kehitysvirtauksiksi
- Asettamaan ja hallitsemaan useita julkaisuympäristöjä
- Toteuttamaan turvallisia konfiguraationhallintakäytäntöjä
- Vianmääräämään konfiguraatioihin liittyviä ongelmia
- Mukauttamaan azd:n toimintaa organisaation vaatimusten mukaan

Tämä kattava opas kattaa kaikki Azure Developer CLI:n konfigurointiin liittyvät osa-alueet optimoitujen kehitys- ja julkaisuvirtausten tukemiseksi.

## AI-agenttien ymmärtäminen azd-projektissa

Jos olet uusi AI-agenttien kanssa, tässä on yksinkertainen tapa ymmärtää niiden rooli azd-maailmassa.

### Mikä on agentti?

Agentti on ohjelmisto, joka voi vastaanottaa pyynnön, käsitellä sitä ja suorittaa toimintoja—usein kutsumalla AI-mallia, hakemalla tietoja tai kutsumalla muita palveluja. Azd-projektissa agentti on vain toinen **palvelu** web-frontendisi tai API-backendisi rinnalla.

### Kuinka agentit sopivat azd-projektin rakenteeseen

Azd-projekti koostuu kolmesta tasosta: **infrastruktuuri**, **koodi** ja **konfiguraatio**. Agentit liitetään näihin tasoihin samalla tavalla kuin muut palvelut:

| Kerros | Mitä se tekee perinteiselle sovellukselle | Mitä se tekee agentille |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Provisionoi verkkosovelluksen ja tietokannan | Provisionoi AI-mallin päätepisteen, hakemiston indeksin tai agentin isännän |
| **Code** (`src/`) | Sisältää frontendisi ja API:n lähdekoodin | Sisältää agenttilogiikkasi ja kehotteiden määrittelyt |
| **Configuration** (`azure.yaml`) | Luettelee palvelusi ja niiden isäntäympäristöt | Luettelee agenttisi palveluna, osoittaen sen koodiin ja isäntään |

### `azure.yaml`-tiedoston rooli

Sinun ei tarvitse muistaa syntaksia juuri nyt. Käsitteellisesti `azure.yaml` on tiedosto, jossa kerrot azd:lle: *"Tässä ovat sovellukseni palvelut, ja tässä on niiden koodin sijainti."*

Kun projektiisi sisältyy AI-agentti, `azure.yaml` yksinkertaisesti listaa agentin yhtenä palveluna. Azd tietää tämän jälkeen provisionoida oikean infrastruktuurin (kuten Microsoft Foundry Models -päätepisteen tai Container Appin agentin isännöimiseksi) ja julkaista agenttisi koodin—täsmälleen samalla tavalla kuin web-sovelluksen tai API:n kanssa.

Tämä tarkoittaa, ettei ole mitään olennaisesti uutta opittavaa. Jos ymmärrät, miten azd hallinnoi web-palvelua, ymmärrät jo miten se hallitsee agenttia.

## Konfigurointihierarkia

azd käyttää hierarkkista konfiguraatiojärjestelmää:
1. **Komentorivivalitsimet** (korkein prioriteetti)
2. **Ympäristömuuttujat**
3. **Paikallinen projektikonfiguraatio** (`.azd/config.json`)
4. **Käyttäjän globaali konfiguraatio** (`~/.azd/config.json`)
5. **Oletusarvot** (matalin prioriteetti)

## Globaali konfiguraatio

### Globaalien oletusten asettaminen
```bash
# Aseta oletustilaus
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Aseta oletussijainti
azd config set defaults.location "eastus2"

# Aseta resurssiryhmien oletusnimeämiskäytäntö
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Näytä kaikki globaalit määritykset
azd config show

# Poista määritys
azd config unset defaults.location
```

### Yleiset globaalit asetukset
```bash
# Kehitysmieltymykset
azd config set alpha.enable true                    # Ota alfaominaisuudet käyttöön
azd config set telemetry.enabled false             # Poista telemetria käytöstä
azd config set output.format json                  # Aseta ulostulomuoto

# Suojausasetukset
azd config set auth.useAzureCliCredential true     # Käytä Azure CLI:tä todennukseen
azd config set tls.insecure false                  # Pakota TLS-tarkistus

# Suorituskyvyn viritys
azd config set provision.parallelism 5             # Resurssien rinnakkainen luonti
azd config set deploy.timeout 30m                  # Käyttöönoton aikakatkaisu
```

## 🏗️ Projektikonfiguraatio

### azure.yaml-rakenne
Tiedosto `azure.yaml` on azd-projektisi ydin:

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

## 🌟 Ympäristöjen hallinta

### Ympäristöjen luominen
```bash
# Luo uusi ympäristö
azd env new development

# Luo tiettyyn sijaintiin
azd env new staging --location "westus2"

# Luo mallista
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Ympäristöjen konfiguraatio
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

# Vahvista poisto
azd env get-values | grep DEBUG
# (ei pitäisi palauttaa mitään)
```

### Ympäristömallit
Luo `.azure/env.template` yhdenmukaisen ympäristöasetuksen takaamiseksi:
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

### Ympäristöjen jakaminen tiimin kesken

Kun useampi kuin yksi henkilö työskentelee projektissa, pitää sopia **mitä versionhallinnassa jaetaan ja mitä pidetään paikallisena**. azd pitää jokaisen ympäristön `.azure/`-kansion alla, eikä kaikkea siitä pitäisi sitoa versionhallintaan.

**Mitä `.azure/` sisältää:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Mitä gitignoreen laitetaan.** azd:n oletus `.gitignore` sulkee jo `.azure/`-kansion. Pidä se niin — `.env`-tiedostot voivat sisältää salaisuuksia, ja resurssitunnukset ovat spesifisiä sille, joka provisionoi ne. Jokainen tiimiläinen luo **oman** ympäristönsä paikallisesti:

```bash
# Jokainen kehittäjä suorittaa tämän kerran saadakseen oman eristetyn ympäristön
azd env new dev-alice
azd up
```

**Ympäristöjen vaihtaminen.** Kehittäjä, joka ylläpitää useita ympäristöjä, valitsee aktiivisen ennen komentojen suorittamista:

```bash
azd env list                 # näytä kaikki paikalliset ympäristöt ja mikä niistä on oletus
azd env select staging       # aseta 'staging' aktiiviseksi ympäristöksi
azd env get-values           # varmista, että osoitat oikeaan ympäristöön
```

**Ei-salaisten oletusarvojen tarjoaminen tiimille.** Committaa malli (kuten yllä oleva `.azure/env.template`), jotta kaikki tietävät, mitkä muuttujat pitää asettaa — mutta älä koskaan commitoi täytettyjä arvoja. Uudet tiimiläiset kopioivat mallin ja täyttävät omat arvonsa.

**Ympäristöt CI/CD:ssä.** Putket eivät lue paikallista `.azure/`-kansiotasi. Sen sijaan tarjoa ympäristöarvot putken muuttujina/salaisuuksina, ja azd lukee ne prosessin ympäristöstä:

```bash
# CI:ssä azd lukee nämä ympäristömuuttujista, ei .azure/-hakemistosta.
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Nyrkkisääntö:** infrastruktuurikoodi (`infra/`, `azure.yaml`) jaetaan Gitissä; ympäristöjen *tila ja salaisuudet* (`.azure/`) ovat kehittäjäkohtaisia ja putkikohtaisia. `azd pipeline config` asettaa putken muuttujat puolestasi automaattisesti.

## 🔐 Todennusasetukset

### Azure CLI -integraatio
```bash
# Käytä Azure CLI -tunnistetietoja (oletus)
azd config set auth.useAzureCliCredential true

# Kirjaudu tiettyyn vuokraajaan
az login --tenant <tenant-id>

# Aseta oletustilaus
az account set --subscription <subscription-id>
```

### Palvelutunnuksen todennus
CI/CD-putkille:
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

## 🏗️ Infrastruktuuriasetukset

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
Terraform-projekteissa määrittele `infra/terraform.tfvars`-tiedostossa:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Julkaisuasetukset

### Build-asetukset
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

### Docker-asetukset
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

### Mukautettu resurssin nimeäminen
```bash
# Määritä nimeämiskäytännöt
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

### Valvonta-asetukset
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

### Esituotantoympäristö
```bash
# .azure/esituotanto/.env
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

### 3. Versionhallinnan huomioita
```bash
# .gitignore
.azure/*/config.json         # Ympäristömääritykset (sisältävät resurssitunnuksia)
.azure/*/.env               # Ympäristömuuttujat (saattaa sisältää salaisuuksia)
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

### Harjoitus 1: Moniympäristökonfiguraatio (15 minuuttia)

**Tavoite**: Luo ja konfiguroi kolme ympäristöä eri asetuksilla

```bash
# Luo kehitysympäristö
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Luo esituotantoympäristö
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
- [ ] Jokaisella ympäristöllä on ainutlaatuinen konfiguraatio
- [ ] Voi vaihtaa ympäristöjen välillä ilman virheitä
- [ ] `azd env list` näyttää kaikki kolme ympäristöä

### Harjoitus 2: Salausten hallinta (10 minuuttia)

**Tavoite**: Harjoittele turvallista konfigurointia arkaluonteisten tietojen kanssa

```bash
# Aseta salaisuudet (ei näytetä tulosteessa)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Aseta ei-salainen konfiguraatio
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Näytä ympäristö (salaisuudet tulisi peittää)
azd env get-values

# Varmista, että salaisuudet on tallennettu
azd env get DB_PASSWORD  # Pitäisi näyttää todellinen arvo
```

**Onnistumiskriteerit:**
- [ ] Salaisuudet tallennettu näyttämättä niitä terminaalissa
- [ ] `azd env get-values` näyttää sensuroidut salaisuudet
- [ ] Yksittäinen `azd env get <SECRET_NAME>` hakee todellisen arvon

## Seuraavat askeleet

- [Ensimmäinen projektisi](first-project.md) - Sovella konfiguraatiota käytännössä
- [Julkaisuopas](../chapter-04-infrastructure/deployment-guide.md) - Käytä konfiguraatiota käyttöönotossa
- [Resurssien provisointi](../chapter-04-infrastructure/provisioning.md) - Tuotantovalmiit konfiguraatiot

## Viitteet

- [azd-konfiguraatioreferenssi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml-skeema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Ympäristömuuttujat](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 3 - Konfigurointi ja todennus
- **⬅️ Edellinen**: [Ensimmäinen projektisi](first-project.md)
- **➡️ Seuraava luku**: [Luku 4: Infrastruktuuri koodina](../chapter-04-infrastructure/deployment-guide.md)
- **Seuraava oppitunti**: [Ensimmäinen projektisi](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->