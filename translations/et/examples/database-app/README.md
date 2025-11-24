<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-24T14:32:08+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "et"
}
-->
# Microsoft SQL andmebaasi ja veebirakenduse juurutamine AZD abil

⏱️ **Hinnanguline aeg**: 20-30 minutit | 💰 **Hinnanguline kulu**: ~15-25 $/kuus | ⭐ **Keerukus**: Keskmine

See **täielik ja töötav näide** näitab, kuidas kasutada [Azure Developer CLI-d (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/), et juurutada Python Flask veebirakendus koos Microsoft SQL andmebaasiga Azure'i. Kogu kood on kaasas ja testitud—väliseid sõltuvusi pole vaja.

## Mida õpid

Selle näite läbimisega õpid:
- Juurutama mitmetasandilist rakendust (veebirakendus + andmebaas) infrastruktuuri koodina
- Konfigureerima turvalisi andmebaasiühendusi ilma salasõnu koodi kõvaks kirjutamata
- Jälgima rakenduse tervist Application Insights abil
- Halda Azure'i ressursse tõhusalt AZD CLI abil
- Järgima Azure'i parimaid tavasid turvalisuse, kulude optimeerimise ja jälgitavuse osas

## Stsenaariumi ülevaade
- **Veebirakendus**: Python Flask REST API koos andmebaasiühendusega
- **Andmebaas**: Azure SQL andmebaas koos näidisandmetega
- **Infrastruktuur**: Loodud Bicepiga (modulaarsed, taaskasutatavad mallid)
- **Juurutamine**: Täielikult automatiseeritud `azd` käskudega
- **Jälgimine**: Application Insights logide ja telemeetria jaoks

## Eeltingimused

### Vajalikud tööriistad

Enne alustamist veendu, et sul on need tööriistad paigaldatud:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versioon 2.50.0 või uuem)
   ```sh
   az --version
   # Oodatav väljund: azure-cli 2.50.0 või uuem
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versioon 1.0.0 või uuem)
   ```sh
   azd version
   # Oodatav väljund: azd versioon 1.0.0 või uuem
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (kohalikuks arenduseks)
   ```sh
   python --version
   # Oodatav väljund: Python 3.8 või uuem
   ```

4. **[Docker](https://www.docker.com/get-started)** (valikuline, kohalikuks konteineripõhiseks arenduseks)
   ```sh
   docker --version
   # Oodatav väljund: Docker versioon 20.10 või uuem
   ```

### Azure'i nõuded

- Aktiivne **Azure'i tellimus** ([loo tasuta konto](https://azure.microsoft.com/free/))
- Õigused ressursside loomiseks oma tellimuses
- **Omaniku** või **kaastöötaja** roll tellimuses või ressursigrupis

### Teadmiste eeltingimused

See on **keskmise taseme** näide. Sa peaksid olema tuttav:
- Põhiliste käsurea toimingutega
- Pilve põhimõistetega (ressursid, ressursigrupid)
- Veebirakenduste ja andmebaaside põhialustega

**Uus AZD-s?** Alusta [Alustamise juhendist](../../docs/getting-started/azd-basics.md).

## Arhitektuur

See näide juurutab kahetasandilise arhitektuuri veebirakenduse ja SQL andmebaasiga:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Ressursside juurutamine:**
- **Ressursigrupp**: Kõigi ressursside konteiner
- **App Service Plan**: Linuxipõhine hostimine (B1 tase kulutõhususe jaoks)
- **Veebirakendus**: Python 3.11 runtime Flask rakendusega
- **SQL Server**: Hallatav andmebaasiserver TLS 1.2 miinimumiga
- **SQL andmebaas**: Basic tase (2GB, sobib arenduseks/testimiseks)
- **Application Insights**: Jälgimine ja logimine
- **Log Analytics Workspace**: Keskne logide salvestus

**Võrdlus**: Mõtle sellele nagu restoranile (veebirakendus) koos külmkambriga (andmebaas). Kliendid tellivad menüüst (API lõpp-punktid) ja köök (Flask rakendus) toob koostisosad (andmed) külmkapist. Restorani juht (Application Insights) jälgib kõike, mis toimub.

## Kaustastruktuur

Kõik failid on selles näites kaasas—väliseid sõltuvusi pole vaja:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Mida iga fail teeb:**
- **azure.yaml**: Määrab, mida AZD juurutab ja kuhu
- **infra/main.bicep**: Orkestreerib kõik Azure'i ressursid
- **infra/resources/*.bicep**: Üksikute ressursside definitsioonid (modulaarsed taaskasutuseks)
- **src/web/app.py**: Flask rakendus andmebaasiloogikaga
- **requirements.txt**: Python'i pakettide sõltuvused
- **Dockerfile**: Konteineriseerimise juhised juurutamiseks

## Kiirstart (samm-sammult)

### Samm 1: Klooni ja liigu kausta

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Edu kontroll**: Veendu, et näed `azure.yaml` ja `infra/` kausta:
```sh
ls
# Oodatud: README.md, azure.yaml, infra/, src/
```

### Samm 2: Autendi Azure'iga

```sh
azd auth login
```

See avab sinu brauseris Azure'i autentimise. Logi sisse oma Azure'i mandaatidega.

**✓ Edu kontroll**: Sa peaksid nägema:
```
Logged in to Azure.
```

### Samm 3: Algata keskkond

```sh
azd init
```

**Mis juhtub**: AZD loob sinu juurutuse jaoks kohaliku konfiguratsiooni.

**Küsimused, mida näed**:
- **Keskkonna nimi**: Sisesta lühike nimi (nt `dev`, `myapp`)
- **Azure'i tellimus**: Vali oma tellimus loendist
- **Azure'i asukoht**: Vali regioon (nt `eastus`, `westeurope`)

**✓ Edu kontroll**: Sa peaksid nägema:
```
SUCCESS: New project initialized!
```

### Samm 4: Azure'i ressursside loomine

```sh
azd provision
```

**Mis juhtub**: AZD juurutab kogu infrastruktuuri (võtab 5-8 minutit):
1. Loob ressursigrupi
2. Loob SQL Serveri ja andmebaasi
3. Loob App Service Plani
4. Loob veebirakenduse
5. Loob Application Insightsi
6. Konfigureerib võrgustiku ja turvalisuse

**Sinult küsitakse**:
- **SQL administraatori kasutajanimi**: Sisesta kasutajanimi (nt `sqladmin`)
- **SQL administraatori parool**: Sisesta tugev parool (salvesta see!)

**✓ Edu kontroll**: Sa peaksid nägema:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Aeg**: 5-8 minutit

### Samm 5: Rakenduse juurutamine

```sh
azd deploy
```

**Mis juhtub**: AZD koostab ja juurutab sinu Flask rakenduse:
1. Pakendab Python'i rakenduse
2. Koostab Docker'i konteineri
3. Laeb Azure'i veebirakendusse
4. Initsialiseerib andmebaasi näidisandmetega
5. Käivitab rakenduse

**✓ Edu kontroll**: Sa peaksid nägema:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Aeg**: 3-5 minutit

### Samm 6: Ava rakendus

```sh
azd browse
```

See avab sinu juurutatud veebirakenduse brauseris aadressil `https://app-<unique-id>.azurewebsites.net`

**✓ Edu kontroll**: Sa peaksid nägema JSON väljundit:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Samm 7: Testi API lõpp-punkte

**Tervisekontroll** (kontrolli andmebaasiühendust):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Oodatav vastus**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Toodete loetelu** (näidisandmed):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Oodatav vastus**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Üksiku toote päring**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Edu kontroll**: Kõik lõpp-punktid tagastavad JSON andmeid ilma vigadeta.

---

**🎉 Palju õnne!** Oled edukalt juurutanud veebirakenduse koos andmebaasiga Azure'i kasutades AZD-d.

## Konfiguratsiooni süvaanalüüs

### Keskkonnamuutujad

Salasõnu hallatakse turvaliselt Azure App Service konfiguratsiooni kaudu—**mitte kunagi koodi kõvaks kirjutatuna**.

**AZD poolt automaatselt konfigureeritud**:
- `SQL_CONNECTION_STRING`: Andmebaasiühendus krüpteeritud mandaatidega
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Jälgimistelemetria lõpp-punkt
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Lubab automaatse sõltuvuste paigalduse

**Kus salasõnu hoitakse**:
1. `azd provision` ajal sisestad SQL mandaadid turvaliste küsimuste kaudu
2. AZD salvestab need sinu kohalikku `.azure/<env-name>/.env` faili (git-ignored)
3. AZD süstib need Azure App Service konfiguratsiooni (krüpteeritud kujul)
4. Rakendus loeb neid `os.getenv()` kaudu käitamise ajal

### Kohalik arendus

Kohalikuks testimiseks loo `.env` fail näidisest:

```sh
cp .env.sample .env
# Muuda .env oma kohaliku andmebaasi ühendusega
```

**Kohaliku arenduse töövoog**:
```sh
# Paigalda sõltuvused
cd src/web
pip install -r requirements.txt

# Määra keskkonnamuutujad
export SQL_CONNECTION_STRING="your-local-connection-string"

# Käivita rakendus
python app.py
```

**Testi kohapeal**:
```sh
curl http://localhost:8000/health
# Oodatud: {"status": "terve", "database": "ühendatud"}
```

### Infrastruktuur koodina

Kõik Azure'i ressursid on määratletud **Bicep mallides** (`infra/` kaust):

- **Modulaarne disain**: Igal ressursitüübil on oma fail taaskasutuseks
- **Parametriseeritud**: Kohanda SKU-sid, regioone, nimekonventsioone
- **Parimad tavad**: Järgib Azure'i nime- ja turvastandardeid
- **Versioonikontrollitud**: Infrastruktuuri muudatused on jälgitavad Gitis

**Kohandamise näide**:
Andmebaasi taseme muutmiseks redigeeri `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Turvalisuse parimad tavad

See näide järgib Azure'i turvalisuse parimaid tavasid:

### 1. **Salasõnu pole lähtekoodis**
- ✅ Mandaatide hoidmine Azure App Service konfiguratsioonis (krüpteeritud)
- ✅ `.env` failid on Gitist välja jäetud `.gitignore` kaudu
- ✅ Salasõnad edastatakse turvaliste parameetritena juurutamise ajal

### 2. **Krüpteeritud ühendused**
- ✅ TLS 1.2 miinimum SQL Serverile
- ✅ HTTPS-i sundimine veebirakendusele
- ✅ Andmebaasiühendused kasutavad krüpteeritud kanaleid

### 3. **Võrguturve**
- ✅ SQL Serveri tulemüür konfigureeritud lubama ainult Azure'i teenuseid
- ✅ Avalik võrgupääs piiratud (saab veelgi lukustada privaatsete lõpp-punktidega)
- ✅ FTPS keelatud veebirakendusel

### 4. **Autentimine ja autoriseerimine**
- ⚠️ **Praegune**: SQL autentimine (kasutajanimi/parool)
- ✅ **Soovitus tootmiseks**: Kasuta Azure Managed Identity't paroolivabaks autentimiseks

**Managed Identity'le üleminek** (tootmiseks):
1. Luba veebirakendusel hallatav identiteet
2. Anna identiteedile SQL õigused
3. Uuenda ühenduse stringi kasutama hallatavat identiteeti
4. Eemalda paroolipõhine autentimine

### 5. **Audit ja vastavus**
- ✅ Application Insights logib kõik päringud ja vead
- ✅ SQL andmebaasi audit lubatud (saab konfigureerida vastavuseks)
- ✅ Kõik ressursid on märgistatud halduseks

**Turvakontroll enne tootmist**:
- [ ] Luba Azure Defender SQL jaoks
- [ ] Konfigureeri privaatlõpp-punktid SQL andmebaasile
- [ ] Luba veebirakenduse tulemüür (WAF)
- [ ] Rakenda Azure Key Vault salasõnade roteerimiseks
- [ ] Konfigureeri Azure AD autentimine
- [ ] Luba diagnostikalogimine kõigile ressurssidele

## Kulude optimeerimine

**Hinnangulised kuukulud** (november 2025 seisuga):

| Ressurss | SKU/Tase | Hinnanguline kulu |
|----------|----------|-------------------|
| App Service Plan | B1 (Basic) | ~13 $/kuus |
| SQL andmebaas | Basic (2GB) | ~5 $/kuus |
| Application Insights | Pay-as-you-go | ~2 $/kuus (madal liiklus) |
| **Kokku** | | **~20 $/kuus** |

**💡 Kulude kokkuhoiu näpunäited**:

1. **Kasuta tasuta taset õppimiseks**:
   - App Service: F1 tase (tasuta, piiratud tundidega)
   - SQL andmebaas: Kasuta Azure SQL Database serverless
   - Application Insights: 5GB/kuus tasuta andmete kogumist

2. **Peata ressursid, kui neid ei kasutata**:
   ```sh
   # Peata veebirakendus (andmebaas võtab endiselt tasu)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Taaskäivita vajadusel
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Kustuta kõik pärast testimist**:
   ```sh
   azd down
   ```
   See eemaldab KÕIK ressursid ja peatab kulud.

4. **Arendus- vs tootmistasemed**:
   - **Arendus**: Basic tase (kasutatud selles näites)
   - **Tootmine**: Standard/Premium tase koos redundantsusega

**Kulude jälgimine**:
- Vaata kulusid [Azure Cost Managementis](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Sea üles kuluhäired, et vältida üllatusi
- Märgista kõik ressursid `azd-env-name` abil jälgimiseks

**Tasuta taseme alternatiiv**:
Õppimise eesmärgil saad muuta `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Märkus**: Tasuta tasemel on piirangud (60 min/päev CPU, pole alati sees).

## Jälgimine ja jälgitavus

### Application Insights integratsioon

See näide sisaldab **Application Insightsi** põhjalikuks jälgimiseks:

**Mida jälgitakse**:
- ✅ HTTP päringud (latentsus, olekukoodid, lõpp-punktid)
- ✅ Rakenduse vead ja erandid
- ✅ Kohandatud logimine Flask rakendusest
- ✅ Andmebaasiühenduse tervis
- ✅ Jõudlusmõõdikud (CPU, mälu)

**Juurdepääs Application Insightsile**:
1. Ava [Azure Portal](https://portal.azure.com)
2. Liigu oma ressursigrupini (`rg-<env-name>`)
3. Klõpsa Application Insights ressursil (`appi-<unique-id>`)

**Kasulikud päringud** (Application Insights → Logid):

**Vaata kõiki päringuid**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Leia vead**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Kontrolli tervise lõpp-punkti**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL andmebaasi audit

**SQL andmebaasi audit on lubatud**, et jälgida:
- Andmebaasi juurdepääsumustreid
- Ebaõnnestunud sisselogimiskatseid
- Skeemimuudatusi
- Andmete juurdepääsu (vastavuse jaoks)

**Auditilogide vaatamine**:
1. Azure Portal → SQL andmebaas → Audit
2. Vaata logisid Log Analytics tööruumis

### Reaalajas jälgimine

**Vaata reaalajas mõõdikuid**:
1. Application Insights → Live Metrics
2. Vaata päringuid, tõrkeid ja jõudlust reaalajas

**Häirete seadistamine**:
Loo häired kriitiliste sündmuste jaoks:
- HTTP 500 vead > 5 viie minuti jooksul
- Andmebaasiühenduse tõrked
- Kõrged vastuseajad (>2 sekundit)

**Näide häire loomisest**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Tõrkeotsing

### Levinud probleemid ja lahendused

#### 1. `azd provision` ebaõnnestub veaga "Asukoht pole saadaval"

**Sümptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Lahendus**:
Valige teine Azure'i piirkond või registreerige ressursipakkuja:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL-ühendus ebaõnnestub juurutamise ajal

**Sümptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Lahendus**:
- Kontrollige, kas SQL Serveri tulemüür lubab Azure'i teenuseid (konfigureeritud automaatselt)
- Veenduge, et SQL-i administraatori parool sisestati õigesti `azd provision` käigus
- Kontrollige, kas SQL Server on täielikult juurutatud (see võib võtta 2-3 minutit)

**Ühenduse kontrollimine**:
```sh
# Azure Portaali kaudu minge SQL andmebaas → Päringu redaktor
# Proovige ühendust luua oma mandaadiga
```

#### 3. Veebirakendus kuvab "Rakenduse viga"

**Sümptom**:
Brauser kuvab üldise vealehe.

**Lahendus**:
Kontrollige rakenduse logisid:
```sh
# Vaata hiljutisi logisid
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Levinud põhjused**:
- Puuduvad keskkonnamuutujad (kontrollige App Service → Configuration)
- Python'i pakettide installimine ebaõnnestus (kontrollige juurutamise logisid)
- Andmebaasi algatamise viga (kontrollige SQL-ühendust)

#### 4. `azd deploy` ebaõnnestub veaga "Build Error"

**Sümptom**:
```
Error: Failed to build project
```

**Lahendus**:
- Kontrollige, et `requirements.txt` failis poleks süntaksivigu
- Veenduge, et Python 3.11 on määratud `infra/resources/web-app.bicep` failis
- Kontrollige, et Dockerfile sisaldab õiget baaspilti

**Lokaalne silumine**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" AZD käskude käivitamisel

**Sümptom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Lahendus**:
Autentige end uuesti Azure'is:
```sh
azd auth login
az login
```

Veenduge, et teil on õiged õigused (Contributor roll) tellimuses.

#### 6. Kõrged andmebaasi kulud

**Sümptom**:
Ootamatu Azure'i arve.

**Lahendus**:
- Kontrollige, kas unustasite pärast testimist käivitada `azd down`
- Veenduge, et SQL andmebaas kasutab Basic taset (mitte Premium)
- Vaadake kulusid Azure Cost Management'is
- Seadistage kuluhäired

### Abi saamine

**Vaata kõiki AZD keskkonnamuutujaid**:
```sh
azd env get-values
```

**Kontrollige juurutamise olekut**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Juurdepääs rakenduse logidele**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Vajate rohkem abi?**
- [AZD tõrkeotsingu juhend](../../docs/troubleshooting/common-issues.md)
- [Azure App Service tõrkeotsing](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL tõrkeotsing](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktilised harjutused

### Harjutus 1: Kontrollige oma juurutust (Algaja)

**Eesmärk**: Veenduge, et kõik ressursid on juurutatud ja rakendus töötab.

**Sammud**:
1. Loetlege kõik ressursid oma ressursigrupis:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Oodatav tulemus**: 6-7 ressurssi (veebirakendus, SQL Server, SQL andmebaas, App Service Plan, Application Insights, Log Analytics)

2. Testige kõiki API lõpp-punkte:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Oodatav tulemus**: Kõik tagastavad kehtiva JSON-i ilma vigadeta

3. Kontrollige Application Insights'i:
   - Navigeerige Azure'i portaalis Application Insights'i
   - Minge "Live Metrics" sektsiooni
   - Värskendage veebirakenduse brauserit
   **Oodatav tulemus**: Näete päringuid reaalajas

**Edu kriteeriumid**: Kõik 6-7 ressurssi eksisteerivad, kõik lõpp-punktid tagastavad andmeid, Live Metrics näitab aktiivsust.

---

### Harjutus 2: Lisage uus API lõpp-punkt (Kesktase)

**Eesmärk**: Laiendage Flask rakendust uue lõpp-punktiga.

**Alguskood**: Praegused lõpp-punktid asuvad `src/web/app.py` failis

**Sammud**:
1. Muutke `src/web/app.py` faili ja lisage uus lõpp-punkt pärast `get_product()` funktsiooni:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Juurutage uuendatud rakendus:
   ```sh
   azd deploy
   ```

3. Testige uut lõpp-punkti:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Oodatav tulemus**: Tagastab tooted, mis vastavad "laptop" otsingule

**Edu kriteeriumid**: Uus lõpp-punkt töötab, tagastab filtreeritud tulemused, ilmub Application Insights'i logides.

---

### Harjutus 3: Lisage monitooring ja häired (Edasijõudnud)

**Eesmärk**: Seadistage proaktiivne monitooring häiretega.

**Sammud**:
1. Looge häire HTTP 500 vigade jaoks:
   ```sh
   # Hankige Application Insights ressursi ID
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Looge hoiatus
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Käivitage häire, tekitades vigu:
   ```sh
   # Taotle olematut toodet
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Kontrollige, kas häire käivitus:
   - Azure'i portaal → Alerts → Alert Rules
   - Kontrollige oma e-posti (kui seadistatud)

**Edu kriteeriumid**: Häirereegel on loodud, käivitub vigade korral, teavitused on saadud.

---

### Harjutus 4: Andmebaasi skeemi muutmine (Edasijõudnud)

**Eesmärk**: Lisage uus tabel ja muutke rakendust seda kasutama.

**Sammud**:
1. Ühenduge SQL andmebaasiga Azure'i portaalis Query Editor'i kaudu

2. Looge uus `categories` tabel:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Uuendage `src/web/app.py` faili, et lisada kategooria teave vastustesse

4. Juurutage ja testige

**Edu kriteeriumid**: Uus tabel eksisteerib, tooted kuvavad kategooria teavet, rakendus töötab endiselt.

---

### Harjutus 5: Rakendage vahemälu (Ekspert)

**Eesmärk**: Lisage Azure Redis Cache, et parandada jõudlust.

**Sammud**:
1. Lisage Redis Cache `infra/main.bicep` faili
2. Uuendage `src/web/app.py` faili, et vahemällu salvestada toodete päringud
3. Mõõtke jõudluse paranemist Application Insights'i abil
4. Võrrelge vastuseaegu enne/pärast vahemälu rakendamist

**Edu kriteeriumid**: Redis on juurutatud, vahemälu töötab, vastuseajad paranevad >50%.

**Vihje**: Alustage [Azure Cache for Redis dokumentatsioonist](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Puhastamine

Et vältida jätkuvaid kulusid, kustutage kõik ressursid pärast lõpetamist:

```sh
azd down
```

**Kinnituse küsimine**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Sisestage `y`, et kinnitada.

**✓ Edu kontroll**: 
- Kõik ressursid on Azure'i portaalist kustutatud
- Pole jätkuvaid kulusid
- Kohalik `.azure/<env-name>` kaust võib kustutada

**Alternatiiv** (hoidke infrastruktuur, kustutage andmed):
```sh
# Kustuta ainult ressursigrupp (hoia AZD konfiguratsioon)
az group delete --name rg-<env-name> --yes
```
## Lisateave

### Seotud dokumentatsioon
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL andmebaasi dokumentatsioon](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service dokumentatsioon](https://learn.microsoft.com/azure/app-service/)
- [Application Insights dokumentatsioon](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep keele viide](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Järgmised sammud selles kursuses
- **[Container Apps näide](../../../../examples/container-app)**: Juurutage mikroteenused Azure Container Apps'iga
- **[AI integratsiooni juhend](../../../../docs/ai-foundry)**: Lisage rakendusele AI võimekused
- **[Juurutamise parimad tavad](../../docs/deployment/deployment-guide.md)**: Tootmise juurutamise mustrid

### Täiustatud teemad
- **Hallatud identiteet**: Eemaldage paroolid ja kasutage Azure AD autentimist
- **Privaatne lõpp-punkt**: Turvalised andmebaasiühendused virtuaalses võrgus
- **CI/CD integratsioon**: Automatiseerige juurutused GitHub Actions'i või Azure DevOps'iga
- **Mitme keskkonna seadistamine**: Looge arendus-, testimis- ja tootmiskeskkonnad
- **Andmebaasi migratsioonid**: Kasutage Alembic'it või Entity Framework'i skeemi versioonimiseks

### Võrdlus teiste lähenemistega

**AZD vs. ARM mallid**:
- ✅ AZD: Kõrgema taseme abstraktsioon, lihtsamad käsud
- ⚠️ ARM: Rohkem detailsust, täpsem kontroll

**AZD vs. Terraform**:
- ✅ AZD: Azure'i natiivne, integreeritud Azure'i teenustega
- ⚠️ Terraform: Mitme pilve tugi, suurem ökosüsteem

**AZD vs. Azure'i portaal**:
- ✅ AZD: Korduvkasutatav, versioonikontrollitud, automatiseeritav
- ⚠️ Portaal: Käsitsi klõpsud, raske reprodutseerida

**Mõelge AZD-st kui**: Docker Compose Azure'i jaoks—lihtsustatud konfiguratsioon keerukate juurutuste jaoks.

---

## Korduma kippuvad küsimused

**K: Kas ma saan kasutada teist programmeerimiskeelt?**  
V: Jah! Asendage `src/web/` Node.js, C#, Go või mõne muu keelega. Uuendage `azure.yaml` ja Bicep vastavalt.

**K: Kuidas lisada rohkem andmebaase?**  
V: Lisage teine SQL andmebaasi moodul `infra/main.bicep` faili või kasutage PostgreSQL/MySQL Azure'i andmebaasi teenustest.

**K: Kas seda saab kasutada tootmises?**  
V: See on alguspunkt. Tootmiseks lisage: hallatud identiteet, privaatne lõpp-punkt, redundantsus, varundusstrateegia, WAF ja täiustatud monitooring.

**K: Mis siis, kui tahan kasutada konteinereid koodi juurutamise asemel?**  
V: Vaadake [Container Apps näidet](../../../../examples/container-app), mis kasutab kogu juurutuses Docker konteinereid.

**K: Kuidas ühendada andmebaasiga oma kohalikust masinast?**  
V: Lisage oma IP SQL Serveri tulemüüri:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**K: Kas ma saan kasutada olemasolevat andmebaasi uue loomise asemel?**  
V: Jah, muutke `infra/main.bicep` faili, et viidata olemasolevale SQL Serverile ja uuendage ühenduse stringi parameetreid.

---

> **Märkus:** See näide demonstreerib parimaid tavasid veebirakenduse juurutamiseks andmebaasiga, kasutades AZD-d. See sisaldab töötavat koodi, põhjalikku dokumentatsiooni ja praktilisi harjutusi õppimise tugevdamiseks. Tootmise juurutuste jaoks vaadake üle turvalisuse, skaleerimise, vastavuse ja kulude nõuded, mis on teie organisatsioonile spetsiifilised.

**📚 Kursuse navigeerimine:**
- ← Eelmine: [Container Apps näide](../../../../examples/container-app)
- → Järgmine: [AI integratsiooni juhend](../../../../docs/ai-foundry)
- 🏠 [Kursuse avaleht](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->