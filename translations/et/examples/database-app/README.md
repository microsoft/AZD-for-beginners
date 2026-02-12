# Microsoft SQL-andmebaasi ja veebiäpi juurutamine AZD-ga

⏱️ **Eeldatav aeg**: 20–30 minutit | 💰 **Eeldatav maksumus**: ~$15-25 kuus | ⭐ **Tasemekompleksus**: Kesktase

See **täielik, töötav näide** demonstreerib, kuidas kasutada [Azure Developer CLI-d (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) Python Flask veebirakenduse juurutamiseks Microsoft SQL-andmebaasiga Azure'is. Kõik koodid on kaasatud ja testitud – väliseid sõltuvusi ei ole vaja.

## Mida sa õpid

Selle näite lõpetades:
- Juurutad mitmekihilise rakenduse (veebiäpi + andmebaasi) infrastruktuurina koodina
- Konfigureerid turvalisi andmebaasiühendusi ilma parameetreid kõvakodeerimata
- Jälgid rakenduse tervist Application Insights abil
- Halad Azure'i ressursse efektiivselt AZD CLI-ga
- Järgib Azure parimaid tavasid turvalisuse, kulude optimeerimise ja jälgitavuse alal

## Stsenaariumi ülevaade
- **Veebiäpp**: Python Flask REST API koos andmebaasiühenduvusega
- **Andmebaas**: Azure SQL-andmebaas näidandmetega
- **Infrastruktuur**: Juhtimine Bicepi abil (modulaarne, taaskasutatav mall)
- **Juurutamine**: Täielikult automatiseeritud `azd` käskudega
- **Jälgimine**: Application Insights logide ja telemeetria jaoks

## Nõuded

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

4. **[Docker](https://www.docker.com/get-started)** (valikuline, kohalik konteineripõhine arendus)
   ```sh
   docker --version
   # Oodatav väljund: Docker versioon 20.10 või uuem
   ```

### Azure'i nõuded

- Aktiivne **Azure'i tellimus** ([loo tasuta konto](https://azure.microsoft.com/free/))
- Õigused luua ressursse oma tellimuses
- **Omanik-** või **panustaja** roll tellimusele või ressursigrupile

### Eelteadmised

See on **kesktaseme** näide. Peaksid olema kursis:
- Põhiliste käsureaoperatsioonidega
- Pilve põhimõistetega (ressursid, ressursigrupid)
- Veebirakenduste ja andmebaaside põhitõdede tundmisega

**Oled AZD-ga uus?** Alusta [Sissejuhatuse juhendi](../../docs/chapter-01-foundation/azd-basics.md) lugemisest.

## Arhitektuur

See näide juurutab kahekihilise arhitektuuri koos veebiäpiga ja SQL-andmebaasiga:

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
- **Ressursigrupp**: Kõikide ressursside konteiner
- **App Service plaan**: Linuxi baasil hostimine (B1 tier kulutõhususe jaoks)
- **Veebiäpp**: Python 3.11 runtime Flask-rakendusega
- **SQL Server**: Hallatud andmebaasiserver TLS 1.2 miinimumiga
- **SQL andmebaas**: Basic tier (2GB, sobib arenduseks/testimiseks)
- **Application Insights**: Jälgimine ja logimine
- **Log Analytics tööruum**: Keskne logihoidla

**Näide**: Mõtle sellele kui restoranile (veebiäpp), millel on jalutuskülmik (andmebaas). Kliendid tellivad menüüst (API lõpp-punktid) ja köök (Flask äpp) võtab koostisosi külmikust. Restorani juht (Application Insights) jälgib kõike, mis toimub.

## Kaustastruktuur

Kõik failid on selles näites kaasatud – väliseid sõltuvusi ei ole vaja:

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
- **azure.yaml**: Ütleb AZD-le, mida ja kuhu juurutada
- **infra/main.bicep**: Orkestreerib kõik Azure ressursid
- **infra/resources/*.bicep**: Individuaalsed ressursimääratlused (modulaarne taaskasutus)
- **src/web/app.py**: Flask-rakendus andmebaasi loogikaga
- **requirements.txt**: Python pakettide sõltuvused
- **Dockerfile**: Juhised konteineriks pakendamiseks juurutamiseks

## Kiirkäivitus (samm-sammult)

### Samm 1: klooni ja liigu kausta

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Õnnestumise kontroll**: Kontrolli, et näed `azure.yaml` ja `infra/` kaustu:
```sh
ls
# Oodatud: README.md, azure.yaml, infra/, src/
```

### Samm 2: Autendi Azure'i

```sh
azd auth login
```

See avab brauseri Azure autentimiseks. Logi sisse oma Azure kontoga.

**✓ Õnnestumise kontroll**: Sa peaksid nägema:
```
Logged in to Azure.
```

### Samm 3: Initseeri keskkond

```sh
azd init
```

**Mis toimub**: AZD loob juurutuseks kohaliku konfiguratsiooni.

**Näed järgmisi päringuid**:
- **Keskkonna nimi**: Sisesta lühike nimi (nt `dev`, `myapp`)
- **Azure tellimus**: Vali tellimus nimekirjast
- **Azure asukoht**: Vali piirkond (nt `eastus`, `westeurope`)

**✓ Õnnestumise kontroll**: Sa peaksid nägema:
```
SUCCESS: New project initialized!
```

### Samm 4: Azure'i ressursside loomine

```sh
azd provision
```

**Mis toimub**: AZD juurutab kogu infrastruktuuri (võtab aega 5-8 minutit):
1. Loob ressursigrupi
2. Loob SQL serveri ja andmebaasi
3. Loob App Service plaani
4. Loob veebiäpi
5. Loob Application Insightsi
6. Konfigureerib võrgu ja turvalisuse

**Sind küsitakse**:
- **SQL admin kasutajanimi**: Sisesta kasutajanimi (nt `sqladmin`)
- **SQL admin parool**: Sisesta tugev parool (salvesta see!)

**✓ Õnnestumise kontroll**: Sa peaksid nägema:
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

**Mis toimub**: AZD ehitab ja juurutab Flask-rakenduse:
1. Pakkib Python rakenduse
2. Ehitab Docker-konteineri
3. Pushib Azure Web Appi
4. Algatab andmebaasi näidandmetega
5. Käivitab rakenduse

**✓ Õnnestumise kontroll**: Sa peaksid nägema:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Aeg**: 3-5 minutit

### Samm 6: Ava rakendus brauseris

```sh
azd browse
```

See avab sinu juurutatud veebiäpi brauseris aadressil `https://app-<unique-id>.azurewebsites.net`

**✓ Õnnestumise kontroll**: Sa peaksid nägema JSON-väljundit:
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

### Samm 7: Testi API lõpp-punktid

**Tervisekontroll** (kontrolli andmebaasi ühendust):
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

**Toodete nimekiri** (näidandmed):
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

**Üksik toode**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Õnnestumise kontroll**: Kõik lõpp-punktid tagastavad JSON-andmed veatult.

---

**🎉 Palju õnne!** Sa oled edukalt juurutanud veebiäpi koos andmebaasiga Azure'is AZD abil.

## Konfiguratsiooni detailid

### Keskkonnamuutujad

Saladused haldatakse turvaliselt Azure App Service konfiguratsiooni kaudu – **kunagi ei kõvakodeerita lähtekoodi**.

**AZD konfigureerib automaatselt**:
- `SQL_CONNECTION_STRING`: Andmebaasi ühendus krüpteeritud volitustega
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Jälgimise telemeetria lõpp-punkt
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Võimaldab automaatset sõltuvuste paigaldust

**Kus saladused asuvad**:
1. `azd provision` ajal esitad SQL volitused turvaliste päringute kaudu
2. AZD salvestab need kohalikku `.azure/<env-name>/.env` faili (git'ist ignoreeritud)
3. AZD süstib need Azure App Service konfiguratsiooni (krüpteeritult salvestatuna)
4. Rakendus loeb neid `os.getenv()` abil käitusajal

### Kohalik arendus

Kohaliku testimise jaoks loo `.env` fail näidise põhjal:

```sh
cp .env.sample .env
# Muuda .env vastavalt oma kohalikule andmebaasi ühendusele
```

**Kohaliku arenduse töövoog**:
```sh
# Paigalda sõltuvused
cd src/web
pip install -r requirements.txt

# Sea keskkonnamuutujad
export SQL_CONNECTION_STRING="your-local-connection-string"

# Käivita rakendus
python app.py
```

**Testi kohapeal**:
```sh
curl http://localhost:8000/health
# Oodatud: {"status": "terve", "andmebaas": "ühendatud"}
```

### Infrastruktuur käsukoodina

Kõik Azure ressursid on määratletud **Bicep mallides** (`infra/` kaust):

- **Modulaarne disain**: Igal ressursitüübil oma fail taaskasutuseks
- **Parameetriseeritud**: Kohanda SKU-sid, piirkondi, nimekonventsioone
- **Parimad tavad**: Järgib Azure nimetamist ja turvavaikesätteid
- **Versioonihaldus**: Infrastruktuuri muudatused on Git'is jälgitavad

**Kohandamise näide**:
Andmebaasi taseme muutmiseks muuda faili `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Turvalisuse parimad tavad

See näide järgib Azure turvalisuse parimaid tavasid:

### 1. **Saladusi pole lähtekoodis**
- ✅ Volitused salvestatud Azure App Service konfiguratsioonis (krüpteeritud)
- ✅ `.env` failid on `.gitignore` kaudu Git'st välja jäetud
- ✅ Saladused antakse turvaliste parameetritena provisioning'i ajal

### 2. **Krüpteeritud ühendused**
- ✅ SQL Serveril TLS 1.2 miinimum
- ✅ Veebiäpis HTTPS-only
- ✅ Andmebaasi ühendused kasutavad krüpteeritud kanaleid

### 3. **Võrgu turvalisus**
- ✅ SQL Serveri tulemüür on seatud lubama ainult Azure teenuseid
- ✅ Avalik võrgu ligipääs piiratud (võib veelgi piirata privaatsete otspunktidega)
- ✅ Web Appis on FTPS keelatud

### 4. **Autentimine ja autoriseerimine**
- ⚠️ **Praegu**: SQL autentimine (kasutajanimi/parool)
- ✅ **Tootmise soovitus**: Kasuta Azure Managed Identity paroolita autentimiseks

**Halduse identiteedile üleminek** (tootmiseks):
1. Luba halduri identiteet Web Appl
2. Anna identiteedile SQL õigused
3. Uuenda ühendusstring kasutamaks halduri identiteeti
4. Eemalda paroolipõhine autentimine

### 5. **Audit ja vastavus**
- ✅ Application Insights logib kõik päringud ja vead
- ✅ SQL andmebaasi audit lubatud (võib seadistada vastavuseks)
- ✅ Kõik ressursid on märgistatud halduslikel eesmärkidel

**Turvalisuse kontrollnimekiri enne tootmist**:
- [ ] Luba Azure Defender SQL jaoks
- [ ] Konfigureeri privaatotsapunktid SQL andmebaasile
- [ ] Luba Web Application Firewall (WAF)
- [ ] Kasuta Azure Key Vault saladuste rotatsiooniks
- [ ] Konfigureeri Azure AD autentimine
- [ ] Luba diagnostikalogimine kõigi ressursside jaoks

## Kuluoptimeerimine

**Hinnangulised kuukulud** (seisuga november 2025):

| Ressurss | SKU/Tasand | Hinnanguline maksumus |
|----------|------------|----------------------|
| App Service plaan | B1 (Basic) | ~$13 kuus |
| SQL andmebaas | Basic (2GB) | ~$5 kuus |
| Application Insights | Pay-as-you-go | ~$2 kuus (madal liiklus) |
| **Kokku** | | **~$20 kuus** |

**💡 Kulu kokkuhoiuvihjed**:

1. **Kasuta tasuta taset õppimiseks**:
   - App Service: F1 tier (tasuta, piiratud tundide arv)
   - SQL andmebaas: Kasuta Azure SQL Database serverless
   - Application Insights: 5GB/kuus tasuta ingesteerimist

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
   See eemaldab KÕIK ressursid ja peatab kulutused.

4. **Arendus vs tootmise SKU-d**:
   - **Arendus**: Basic tier (kasutatud selles näites)
   - **Tootmine**: Standard/Premium tier koos redundantsiga

**Kulude jälgimine**:
- Vaata kulusid [Azure Cost Management'is](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Sea sisse kuluteavitused ootamatuste vältimiseks
- Märgista kõik ressursid `azd-env-name` sildiga jälgimiseks

**Tasuta taseme alternatiiv**:
Õppimise eesmärgil saad muuta `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Märkus**: Tasuta tase piirab CPU-d 60 minutit päevas, pole aina sees.

## Jälgimine ja jälgitavus

### Application Insights integreerimine

See näide sisaldab **Application Insights** põhjalikuks jälgimiseks:

**Jälgitavus**:
- ✅ HTTP-päringud (latentsus, staatusekoodid, lõpp-punktid)
- ✅ Rakenduse vead ja erandid
- ✅ Kohandatud logimine Flask-rakendusest
- ✅ Andmebaasi ühenduse seisund
- ✅ Jõudlusnäitajad (CPU, mälu)

**Kuidas Application Insightsi avada**:
1. Ava [Azure Portal](https://portal.azure.com)
2. Liigu oma ressursigrupile (`rg-<env-name>`)
3. Klõpsa Application Insights ressursil (`appi-<unique-id>`)

**Kasulikud päringud** (Application Insights → Logs):

**Kõik päringud**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Leidke vead**:
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
- Andmebaasi ligipääsu mustreid
- Ebaõnnestunud sisselogimiskatseid
- Skeemi muudatusi
- Andmejuurdepääsu (vastavuse tagamiseks)

**Auditilogide vaatamine**:
1. Azure Portal → SQL andmebaas → Auditing
2. Vaatamine Log Analytics tööruumis

### Reaalajas jälgimine

**Vaata jooksvaid mõõdikuid**:
1. Application Insights → Live Metrics
2. Näed päringuid, rikkeid ja jõudlust reaalajas

**Sea teavitused**:
Loo teavitused kriitiliste sündmuste jaoks:
- HTTP 500 vead > 5 viie minuti jooksul
- Andmebaasi ühenduse tõrked
- Kõrged reageerimisajad (>2 sekundit)

**Näidishäire loomine**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Tõrkeotsing

### Levinumad probleemid ja lahendused

#### 1. `azd provision` nurjub teatega "Location not available"

**Süntoom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Lahendus**:
Vali mõni teine Azure regioon või registreeri ressursi pakkuja:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL ühendus ebaõnnestub juurutamise ajal

**Süntoom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Lahendus**:
- Veendu, et SQL Serveri tulemüür lubab Azure teenuseid (konfigureeritakse automaatselt)
- Kontrolli, kas SQL administraatori parool sisestati õigesti `azd provision` käivitamisel
- Veendu, et SQL Server on täielikult juurutatud (võib võtta 2-3 minutit)

**Ühenduse kontroll**:
```sh
# Azure Portaalist mine SQL andmebaasi → Päringute redaktorisse
# Proovi oma mandaate kasutada ühendamiseks
```

#### 3. Veebirakendus kuvab "Application Error" teadet

**Süntoom**:
Brauser kuvab üldise vealehe.

**Lahendus**:
Kontrolli rakenduse logisid:
```sh
# Vaata viimaseid logisid
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Tavalised põhjused**:
- Puuduvad keskkonnamuutujad (kontrolli App Service → Configuration)
- Python pakettide paigaldamine ebaõnnestus (kontrolli juurutamise logisid)
- Andmebaasi initsialiseerimise viga (kontrolli SQL ühenduvust)

#### 4. `azd deploy` nurjub teatega "Build Error"

**Süntoom**:
```
Error: Failed to build project
```

**Lahendus**:
- Veendu, et `requirements.txt` failis pole süntaksivigu
- Kontrolli, et `infra/resources/web-app.bicep` määratleb Python 3.11
- Veendu, et Dockerfile kasutab õiget baas-pilti

**Silumine lokaalselt**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" tõrge AZD käskude käivitamisel

**Süntoom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Lahendus**:
Logi Azure'i uuesti sisse:
```sh
azd auth login
az login
```

Veendu, et sul on tellimuse peal õigeid õigusi (Contributor roll).

#### 6. Kõrged andmebaasi kulud

**Süntoom**:
Ootamatu Azure arve.

**Lahendus**:
- Kontrolli, kas unustasid pärast testimist käivitada `azd down`
- Veendu, et SQL andmebaas kasutab Basic taset (mitte Premium)
- Vaata kulusid Azure Cost Managementist
- Sea kulude hoiatused

### Abi saamine

**Vaata kõiki AZD keskkonnamuutujaid**:
```sh
azd env get-values
```

**Kontrolli juurutamise olekut**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Juurdepääs rakenduse logidele**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Vajate rohkem abi?**
- [AZD tõrkeotsingu juhend](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service tõrkeotsing](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL tõrkeotsing](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktilised harjutused

### Harjutus 1: Kontrolli oma juurutust (Algaja)

**Eesmärk**: Kinnita, et kõik ressursid on juurutatud ja rakendus töötab.

**Sammud**:
1. Väljasta kõik ressursid oma ressursigrupis:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Eeldatav**: 6-7 ressurssi (Veebirakendus, SQL Server, SQL andmebaas, App Service plaan, Application Insights, Log Analytics)

2. Testi kõiki API lõpp-punkte:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Eeldatav**: Kõik tagastavad kehtiva JSON ilma vigadeta

3. Kontrolli Application Insights:
   - Mine Azure portaalis Application Insights sektsiooni
   - Ava "Live Metrics"
   - Värskenda veebirakendust brauseris
   **Eeldatav**: Päringud kuvatakse reaalajas

**Edukuse kriteerium**: Kõik 6-7 ressurssi olemas, kõik lõpp-punktid tagastavad andmed, Live Metrics näitab aktiivsust.

---

### Harjutus 2: Lisa uus API lõpp-punkt (Kesktase)

**Eesmärk**: Laienda Flaski rakendust uue lõpp-punktiga.

**Stardikood**: Praegused lõpp-punktid `src/web/app.py`

**Sammud**:
1. Muuda `src/web/app.py` ja lisa uus lõpp-punkt pärast `get_product()` funktsiooni:
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

2. Juuruta uuendatud rakendus:
   ```sh
   azd deploy
   ```

3. Testi uut lõpp-punkti:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Eeldatav**: Tagastab "laptop" vastavad tooted

**Edukuse kriteerium**: Uus lõpp-punkt töötab, tagastab filtreeritud tulemused, kuvatakse Application Insights logides.

---

### Harjutus 3: Lisa jälgimine ja hoiatused (Edasijõudnu)

**Eesmärk**: Sea üles proaktiivne jälgimine hoiatusedega.

**Sammud**:
1. Loo hoiatus HTTP 500 vigade jaoks:
   ```sh
   # Hangi Application Insights ressursi ID
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Loo häire
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Triggerda hoiatus tekitades vigu:
   ```sh
   # Pöördumine eksisteerimata toote poole
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Kontrolli, kas hoiatus käivitati:
   - Azure portal → Hoiatused → Hoiatuste reeglid
   - Kontrolli oma e-posti (kui eelnevalt seadistatud)

**Edukuse kriteerium**: Hoiatuse reegel loodud, käivitub vigade korral, teavitused saadetakse.

---

### Harjutus 4: Andmebaasi skeemi muudatused (Edasijõudnu)

**Eesmärk**: Lisa uus tabel ja muuda rakendust selle kasutamiseks.

**Sammud**:
1. Ühendu SQL andmebaasiga Azure portaali päringuredaktori kaudu

2. Loo uus tabel `categories`:
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

3. Uuenda `src/web/app.py`, et vastustes oleks kategooria info

4. Juuruta ja testi

**Edukuse kriteerium**: Uus tabel olemas, tooted kuvavad kategooria infot, rakendus toimib jätkuvalt.

---

### Harjutus 5: Rakenda vahemälu (Ekspert)

**Eesmärk**: Lisa Azure Redis Cache jõudluse parandamiseks.

**Sammud**:
1. Lisa Redis Cache `infra/main.bicep` faili
2. Uuenda `src/web/app.py`, et vahemällu salvestada tooteküsimused
3. Mõõda jõudluse paranemine Application Insights abil
4. Võrdle reageerimisaegu enne ja pärast vahemällu salvestamist

**Edukuse kriteerium**: Redis on juurutatud, vahemälu töötab, reageerimisaeg paraneb >50%.

**Vihje**: Alusta [Azure Cache for Redis dokumentatsioonist](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Puhastamine

Järgmiste kulude vältimiseks kustuta kõik ressursid pärast tööd:

```sh
azd down
```

**Kinnitusviip**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Sisesta `y`, et kinnitada.

**✓ Edukontroll**: 
- Kõik ressursid kustutatud Azure portaalist
- Jooksvad kulud puuduvad
- Kohalik `.azure/<env-name>` kaust võib kustutada

**Alternatiiv** (infrastruktuur alles, andmed kustutatud):
```sh
# Kustuta ainult ressursigrupp (hoia AZD konfiguratsiooni)
az group delete --name rg-<env-name> --yes
```
## Rohkem infot

### Seotud dokumentatsioon
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL andmebaasi dokumentatsioon](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service dokumentatsioon](https://learn.microsoft.com/azure/app-service/)
- [Application Insights dokumentatsioon](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep keele viide](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Kursuse järgmised sammud
- **[Container Apps Näide](../../../../examples/container-app)**: Juuruta mikroteenused Azure Container Apps abil
- **[AI Integratsiooni juhend](../../../../docs/ai-foundry)**: Lisa AI võimekusi oma rakendusse
- **[Juurutamise head tavad](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Tootmise juurutamise mustrid

### Täiendavad teemad
- **Managed Identity**: Eemalda paroolid ja kasuta Azure AD autentimist
- **Privaatpunktid**: Turvalised andmebaasi ühendused virtuaalvõrgus
- **CI/CD integratsioon**: Automatiseeri juurutused GitHub Actions või Azure DevOps abil
- **Mitmekeskkonnad**: Sea üles arendus-, testimise ja tootmis keskkonnad
- **Andmebaasi migratsioonid**: Kasuta Alembic või Entity Framework skeemi versioneerimiseks

### Võrdlus teiste lähenemistega

**AZD vs ARM mallid**:
- ✅ AZD: Kõrgema taseme abstraktsioon, lihtsamad käsud
- ⚠️ ARM: Detailsem, granuleeritum kontroll

**AZD vs Terraform**:
- ✅ AZD: Azure-lähene, integreeritud Azure teenustega
- ⚠️ Terraform: Mitmepilve tugi, suurem ökosüsteem

**AZD vs Azure Portal**:
- ✅ AZD: Korduv, versioonitud, automatiseeritav
- ⚠️ Portal: Käsitsi klikkimine, raskesti korratav

**Mõtle AZD-le kui**: Docker Compose'i analoog Azure jaoks — lihtsustatud konfiguratsioon keerukate juurutuste jaoks.

---

## Korduma kippuvad küsimused

**K: Kas saan kasutada mõnda muud programmeerimiskeelt?**  
V: Jah! Asenda `src/web/` Node.js, C#, Go või mõne muu keelega. Uuenda vastavalt `azure.yaml` ja Bicep faile.

**K: Kuidas lisada rohkem andmebaase?**  
V: Lisa veel üks SQL andmebaasi moodul `infra/main.bicep` faili või kasuta Azure Database teenuste PostgreSQL/MySQL lahendust.

**K: Kas saan seda kasutada tootmises?**  
V: See on stardikoht. Tootmisse panemiseks lisa: haldatud identiteet, privaatpunktid, kõrge kättesaadavus, varundusstrateegia, WAF ja täiustatud jälgimine.

**K: Mida teha, kui soovin konteineritega juurutada koodi asemel?**  
V: Vaata [Container Apps näidet](../../../../examples/container-app), kus kasutatakse Docker konteinerid kõigis etappides.

**K: Kuidas ühendada andmebaasiga kohalikust masinast?**  
V: Lisa oma IP SQL Serveri tulemüüri:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**K: Kas saan kasutada olemasolevat andmebaasi uue loomise asemel?**  
V: Jah, muuda `infra/main.bicep`, et viidata olemasolevale SQL serverile ja uuenda ühenduse stringi parameetreid.

---

> **Märkus:** See näidis demonstreerib parimaid praktikaid veebirakenduse ja andmebaasi juurutamiseks AZD-ga. See sisaldab toimivat koodi, põhjalikku dokumentatsiooni ning praktilisi harjutusi teadmiste kinnistamiseks. Tootmisse juurutamisel kontrolli korralikult turvalisust, skaleeritavust, vastavust ja kulu nõudeid vastavalt oma organisatsioonile.

**📚 Kursuse navigeerimine:**
- ← Eelmine: [Container Apps Näide](../../../../examples/container-app)
- → Järgmine: [AI Integratsiooni juhend](../../../../docs/ai-foundry)
- 🏠 [Kursuse avaleht](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtialustus**:
See dokument on tõlgitud kasutades tehisintellekti tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle põhikeeles tuleks pidada ametlikuks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei ole vastutavad mingite arusaamatuste või valesti mõistmiste eest, mis võivad tekkida selle tõlke kasutamisel.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->