# Deploying a Microsoft SQL Database and Web App with AZD

⏱️ **Numatomas laikas**: 20–30 minučių | 💰 **Numatoma kaina**: ~$15–25/mėn. | ⭐ **Sudėtingumas**: Vidutinis

Šis **pilnas, veikiantis pavyzdys** demonstruoja, kaip naudoti [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) diegiant Python Flask žiniatinklio programą su Microsoft SQL duomenų baze į Azure. Visi kodai įtraukti ir išbandyti — nereikia jokių išorinių priklausomybių.

## Ko išmoksit

Atlikę šį pavyzdį, jūs:
- Diegsite daugiapakopę programą (žiniatinklio programa + duomenų bazė) naudodami infrastruktūrą kaip kodą
- Konfigūruosite saugius duomenų bazės ryšius be slaptažodžių įrašymo į kodą
- Stebėsite programos sveikatą su Application Insights
- Efektyviai valdysite Azure išteklius naudodami AZD CLI
- Laikysitės Azure geriausių praktikų saugumo, kaštų optimizavimo ir observability srityse

## Scenarijaus apžvalga
- **Web App**: Python Flask REST API su jungtimi prie duomenų bazės
- **Database**: Azure SQL Database su pavyzdiniais duomenimis
- **Infrastructure**: Sukonfigūruota naudojant Bicep (modulinės, pakartotinai naudojamos šablonai)
- **Deployment**: Visiškai automatizuotas su `azd` komandomis
- **Monitoring**: Application Insights žurnalams ir telemetrijai

## Reikalavimai

### Būtini įrankiai

Prieš pradėdami, įsitikinkite, kad turite įdiegtus šiuos įrankius:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versija 2.50.0 arba naujesnė)
   ```sh
   az --version
   # Tikėtina išvestis: azure-cli 2.50.0 arba naujesnė
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versija 1.0.0 arba naujesnė)
   ```sh
   azd version
   # Tikėtinas išvestis: azd versija 1.0.0 arba naujesnė
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (lokaliam vystymui)
   ```sh
   python --version
   # Tikėtinas rezultatas: Python 3.8 arba naujesnė
   ```

4. **[Docker](https://www.docker.com/get-started)** (pasirinktinai, vietiniam konteinerizuotam vystymui)
   ```sh
   docker --version
   # Tikėtinas išvestis: Docker versija 20.10 arba naujesnė
   ```

### Azure reikalavimai

- Veikianti **Azure prenumerata** ([sukurkite nemokamą paskyrą](https://azure.microsoft.com/free/))
- Leidimai kurti išteklius jūsų prenumeratoje
- **Owner** arba **Contributor** rolė prenumeratoje arba išteklių grupėje

### Žinių reikalavimai

Tai **vidutinio sudėtingumo** pavyzdys. Turėtumėte būti susipažinę su:
- Pagrindiniais komandų eilutės veiksmais
- Esminėmis debesijos sąvokomis (ištekliai, išteklių grupės)
- Pagrindiniu žiniatinklio programų ir duomenų bazių supratimu

**Naujas AZD?** Pirmiausia pradėkite nuo [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md).

## Architektūra

Šis pavyzdys diegia dviejų sluoksnių architektūrą su žiniatinklio programa ir SQL duomenų baze:

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

**Resource Deployment:**
- **Resource Group**: Visų išteklių konteineris
- **App Service Plan**: Linux pagrindu veikianti talpinimo aplinka (B1 lygis dėl kaštų efektyvumo)
- **Web App**: Python 3.11 vykdymo aplinka su Flask programa
- **SQL Server**: Valdomas duomenų bazės serveris su TLS 1.2 minimaliu lygiu
- **SQL Database**: Basic lygis (2GB, tinkama vystymui/testavimui)
- **Application Insights**: Stebėjimas ir žurnalai
- **Log Analytics Workspace**: Centralizuota žurnalų saugykla

**Analogiška**: Galvokite apie tai kaip restoraną (žiniatinklio programa) su šaldikliu (duomenų bazė). Klientai užsisako iš meniu (API galiniai taškai), o virtuvė (Flask programa) pasiima ingredientus (duomenis) iš šaldiklio. Restorano vadybininkas (Application Insights) stebi viską, kas vyksta.

## Aplanko struktūra

Visi failai įtraukti į šį pavyzdį — nereikia išorinių priklausomybių:

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

**Ką daro kiekvienas failas:**
- **azure.yaml**: Nurodo AZD, ką diegti ir kur
- **infra/main.bicep**: Orkesruoja visus Azure išteklius
- **infra/resources/*.bicep**: Atskiri išteklių aprašai (moduliariai, kad būtų pakartotinai naudojami)
- **src/web/app.py**: Flask programa su duomenų bazės logika
- **requirements.txt**: Python paketų priklausomybės
- **Dockerfile**: Konteinerizacijos nurodymai diegimui

## Greitas pradžių (žingsnis po žingsnio)

### 1 žingsnis: Nukopijuokite ir pereikite į katalogą

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Sėkmės patikrinimas**: Įsitikinkite, kad matote `azure.yaml` ir `infra/` aplanką:
```sh
ls
# Tikėtasi: README.md, azure.yaml, infra/, src/
```

### 2 žingsnis: Autentifikuokitės į Azure

```sh
azd auth login
```

Tai atvers jūsų naršyklę Azure autentifikacijai. Prisijunkite naudodami savo Azure paskyrą.

**✓ Sėkmės patikrinimas**: Turėtumėte pamatyti:
```
Logged in to Azure.
```

### 3 žingsnis: Inicializuokite aplinką

```sh
azd init
```

**Kas vyksta**: AZD sukuria lokalią konfigūraciją jūsų diegimui.

**Kokius raginimus pamatysite**:
- **Environment name**: Įveskite trumpą pavadinimą (pvz., `dev`, `myapp`)
- **Azure subscription**: Pasirinkite prenumeratą iš sąrašo
- **Azure location**: Pasirinkite regioną (pvz., `eastus`, `westeurope`)

**✓ Sėkmės patikrinimas**: Turėtumėte pamatyti:
```
SUCCESS: New project initialized!
```

### 4 žingsnis: Paruoškite Azure išteklius

```sh
azd provision
```

**Kas vyksta**: AZD diegia visą infrastruktūrą (trunka 5–8 minutes):
1. Sukuria išteklių grupę
2. Sukuria SQL Server ir Database
3. Sukuria App Service Plan
4. Sukuria Web App
5. Sukuria Application Insights
6. Konfigūruoja tinklus ir saugumą

**Jums bus klausiama**:
- **SQL admin username**: Įveskite vartotojo vardą (pvz., `sqladmin`)
- **SQL admin password**: Įveskite stiprų slaptažodį (išsaugokite jį!)

**✓ Sėkmės patikrinimas**: Turėtumėte pamatyti:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Laikas**: 5–8 minutės

### 5 žingsnis: Diegti programą

```sh
azd deploy
```

**Kas vyksta**: AZD sukuria ir diegia jūsų Flask programą:
1. Supakuoja Python programą
2. Sukuria Docker konteinerį
3. Įkelia į Azure Web App
4. Inicializuoja duomenų bazę su pavyzdiniais duomenimis
5. Paleidžia programą

**✓ Sėkmės patikrinimas**: Turėtumėte pamatyti:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Laikas**: 3–5 minutės

### 6 žingsnis: Peržiūrėkite programą naršyklėje

```sh
azd browse
```

Tai atvers jūsų diegtą žiniatinklio programą naršyklėje adresu `https://app-<unique-id>.azurewebsites.net`

**✓ Sėkmės patikrinimas**: Turėtumėte pamatyti JSON išvestį:
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

### 7 žingsnis: Išbandykite API galinius taškus

**Sveikatos patikra** (patikrinkite duomenų bazės ryšį):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Tikėtina atsakymas**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Produktų sąrašas** (pavyzdiniai duomenys):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Tikėtina atsakymas**:
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

**Gauti vieną produktą**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Sėkmės patikrinimas**: Visi galiniai taškai grąžina JSON duomenis be klaidų.

---

**🎉 Sveikiname!** Sėkmingai įdiegėte žiniatinklio programą su duomenų baze į Azure naudojant AZD.

## Konfigūracijos giluminė peržiūra

### Aplinkos kintamieji

Slaptažodžiai valdomi saugiai per Azure App Service konfigūraciją — **niekada nemeskite slaptažodžių į šaltinio kodą**.

**Automatiškai sukonfigūruoja AZD**:
- `SQL_CONNECTION_STRING`: Duomenų bazės ryšys su užšifruotais kredencialais
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Monitoringo telemetrijos galinis taškas
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Leidžia automatinį priklausomybių įdiegimą diegimo metu

**Kur saugomos slaptos reikšmės**:
1. Per `azd provision` jūs pateikiate SQL kredencialus per saugius raginimus
2. AZD saugo juos jūsų lokaliame `.azure/<env-name>/.env` faile (įtrauktas į .gitignore)
3. AZD injektuoja juos į Azure App Service konfigūraciją (užšifruota saugant)
4. Programa skaito juos per `os.getenv()` vykdymo metu

### Vietinis vystymas

Vietiniam testavimui sukurkite `.env` failą iš pavyzdžio:

```sh
cp .env.sample .env
# Redaguokite .env failą, kad nurodytumėte vietinio duomenų bazės prisijungimo duomenis.
```

**Vietinio vystymo darbo eiga**:
```sh
# Įdiekite priklausomybes
cd src/web
pip install -r requirements.txt

# Nustatykite aplinkos kintamuosius
export SQL_CONNECTION_STRING="your-local-connection-string"

# Paleiskite programą
python app.py
```

**Testuoti lokaliai**:
```sh
curl http://localhost:8000/health
# Tikėtinas: {"status": "sveikas", "database": "prisijungusi"}
```

### Infrastruktūra kaip kodas

Visi Azure ištekliai aprašyti **Bicep šablonuose** (`infra/` aplanke):

- **Modulinis dizainas**: Kiekvienam išteklių tipui yra atskiras failas pakartotiniam naudojimui
- **Parametrizuota**: Tinkinkite SKU, regionus, vardų konvencijas
- **Geriausios praktikos**: Atitinka Azure pavadinimų standartus ir saugumo numatytuosius nustatymus
- **Versijų valdymas**: Infrastruktūros pokyčiai stebimi Gite

**Pritaikymo pavyzdys**:
Norėdami pakeisti duomenų bazės lygį, redaguokite `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Saugumo geriausios praktikos

Šis pavyzdys atitinka Azure saugumo geriausias praktikas:

### 1. **Nėra slaptažodžių šaltinio kode**
- ✅ Kredencialai saugomi Azure App Service konfigūracijoje (užšifruota)
- ✅ `.env` failai pašalinti iš Gito per `.gitignore`
- ✅ Slaptažodžiai perduodami per saugius parametrus diegimo metu

### 2. **Užšifruotos jungtys**
- ✅ TLS 1.2 kaip minimalus SQL Server reikalavimas
- ✅ Web App priverstinai tik HTTPS
- ✅ Duomenų bazės ryšiai naudoja užšifruotus kanalus

### 3. **Tinklo saugumas**
- ✅ SQL Server ugniasienė sukonfigūruota leisti tik Azure paslaugoms
- ✅ Viešas tinklo prieigos ribojimas (gali būti toliau užrakinta naudojant Private Endpoints)
- ✅ FTPS išjungtas Web App

### 4. **Autentifikacija ir autorizacija**
- ⚠️ **Šiuo metu**: SQL autentifikacija (vartotojo vardas/slaptažodis)
- ✅ **Rekomendacija gamybai**: Naudokite Azure Managed Identity be slaptažodžių autentifikacijai

**Norėdami pereiti prie Managed Identity** (gamybai):
1. Įgalinkite managed identity Web App
2. Suteikite tapatybei SQL leidimus
3. Atnaujinkite ryšio eilutę naudoti managed identity
4. Pašalinkite slaptažodžiu pagrįstą autentifikaciją

### 5. **Auditas ir atitiktis**
- ✅ Application Insights registruoja visus užklausimus ir klaidas
- ✅ SQL Database auditas įjungtas (gali būti sukonfigūruotas atitikties reikalavimams)
- ✅ Visi ištekliai pažymėti ženklai valdymui

**Saugumo kontrolinis sąrašas prieš gamybą**:
- [ ] Įgalinti Azure Defender for SQL
- [ ] Konfigūruoti Private Endpoints SQL Database
- [ ] Įjungti Web Application Firewall (WAF)
- [ ] Įdiegti Azure Key Vault slaptažodžių rotacijai
- [ ] Konfigūruoti Azure AD autentifikaciją
- [ ] Įgalinti diagnostikos žurnavimą visiems ištekliams

## Kaštų optimizavimas

**Numatomos mėnesinės išlaidos** (nuo 2025 m. lapkričio):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (mažas srautas) |
| **Total** | | **~$20/month** |

**💡 Patarimai, kaip sutaupyti**:

1. **Naudokite nemokamą lygį mokymuisi**:
   - App Service: F1 lygis (nemokamas, ribotas valandas)
   - SQL Database: Naudokite Azure SQL Database serverless
   - Application Insights: 5GB/mėn. nemokamas įkėlimas

2. **Sustabdykite išteklius, kai nenaudojami**:
   ```sh
   # Sustabdyti žiniatinklio programą (duomenų bazė vis tiek apmokestinama)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Paleisti iš naujo, kai reikia
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Ištrinkite viską po testavimo**:
   ```sh
   azd down
   ```
   Tai pašalina VISUS išteklius ir stabdo mokesčius.

4. **Vystymo vs. gamybos SKU**:
   - **Vystymui**: Basic lygis (naudojamas šiame pavyzdyje)
   - **Gamybai**: Standard/Premium lygis su redundancija

**Kaštų stebėjimas**:
- Peržiūrėkite išlaidas [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Nustatykite kaštų įspėjimus, kad išvengtumėte netikėtumų
- Pažymėkite visus išteklius su `azd-env-name` sekimui

**Nemokamas alternatyvus lygis**:
Mokymosi tikslais galite pakeisti `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Pastaba**: Nemokamas lygis turi apribojimų (60 min/dieną CPU, nėra always-on).

## Stebėjimas ir matomumas

### Application Insights integracija

Šis pavyzdys apima **Application Insights** visapusiškam stebėjimui:

**Kas stebima**:
- ✅ HTTP užklausos (vėlavimas, statuso kodai, galiniai taškai)
- ✅ Programos klaidos ir išimtys
- ✅ Tinkinti žurnalai iš Flask programos
- ✅ Duomenų bazės ryšio sveikata
- ✅ Veikimo metrikos (CPU, atmintis)

**Kaip pasiekti Application Insights**:
1. Atidarykite [Azure Portal](https://portal.azure.com)
2. Pereikite į savo išteklių grupę (`rg-<env-name>`)
3. Spauskite Application Insights išteklių (`appi-<unique-id>`)

**Naudingos užklausos** (Application Insights → Logs):

**Rodyti visas užklausas**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Rasti klaidas**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Patikrinti health endpoint**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database auditas

**SQL Database auditas įjungtas**, kad būtų sekama:
- Duomenų bazės prieigos modeliai
- Nepavykę prisijungimo bandymai
- Schemos pakeitimai
- Duomenų prieigos įrašai (atitikties reikalavimams)

**Kaip pasiekti audito žurnalus**:
1. Azure Portal → SQL Database → Auditing
2. Peržiūrėkite žurnalus Log Analytics workspace

### Realaus laiko stebėjimas

**Rodyti gyvų metrikų srautą**:
1. Application Insights → Live Metrics
2. Matykite užklausas, klaidas ir veikimo rodiklius realiu laiku

**Nustatyti įspėjimus**:
Sukurkite įspėjimus kritiniams įvykiams:
- HTTP 500 klaidos > 5 per 5 minutes
- Duomenų bazės ryšio klaidos
- Dideli atsakymų laikai (>2 sekundžių)

**Pavyzdinis įspėjimo sukūrimas**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Trikčių šalinimas

### Dažnos problemos ir sprendimai

#### 1. `azd provision` nepavyksta su "Location not available"

**Simptomas**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Sprendimas**:
Pasirinkite kitą Azure regioną arba užregistruokite resursų teikėją:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL prisijungimas nepavyksta diegiant

**Simptomas**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Sprendimas**:
- Patikrinkite, ar SQL Server tinklo ugniasienė leidžia Azure paslaugas (konfigūruojama automatiškai)
- Patikrinkite, ar SQL administratoriaus slaptažodis buvo įvestas teisingai vykdant `azd provision`
- Užtikrinkite, kad SQL Server būtų pilnai paruoštas (gali užtrukti 2–3 min.)

**Patikrinkite ryšį**:
```sh
# Iš Azure portalo eikite į SQL Database → Query editor
# Pabandykite prisijungti naudodami savo prisijungimo duomenis
```

#### 3. Web programėlė rodo "Application Error"

**Simptomas**:
Naršyklė rodo bendrą klaidos puslapį.

**Sprendimas**:
Patikrinkite programos žurnalus:
```sh
# Peržiūrėti naujausius žurnalus
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Dažnos priežastys**:
- Trūksta aplinkos kintamųjų (patikrinkite App Service → Configuration)
- Python paketų diegimas nepavyko (patikrinkite diegimo žurnalus)
- Klaida duomenų bazės inicializavimo metu (patikrinkite SQL ryšį)

#### 4. `azd deploy` nepavyksta su "Build Error"

**Simptomas**:
```
Error: Failed to build project
```

**Sprendimas**:
- Įsitikinkite, kad `requirements.txt` neturi sintaksės klaidų
- Patikrinkite, ar Python 3.11 nurodytas faile `infra/resources/web-app.bicep`
- Patikrinkite, kad Dockerfile turi teisingą pagrindinį vaizdą

**Derinkite lokaliai**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" paleidžiant AZD komandas

**Simptomas**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Sprendimas**:
Prisijunkite iš naujo prie Azure:
```sh
azd auth login
az login
```

Patikrinkite, ar prenumeratoje turite tinkamas teises (Contributor rolė).

#### 6. Aukštos duomenų bazės išlaidos

**Simptomas**:
Netikėta Azure sąskaita.

**Sprendimas**:
- Patikrinkite, ar nepamiršote paleisti `azd down` po testavimo
- Patikrinkite, ar SQL Database naudoja Basic lygį (ne Premium)
- Peržiūrėkite išlaidas Azure Cost Management
- Sukonfigūruokite išlaidų įspėjimus

### Pagalba

**Peržiūrėti visus AZD aplinkos kintamuosius**:
```sh
azd env get-values
```

**Patikrinti diegimo būseną**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Prieiga prie programos žurnalų**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Reikia daugiau pagalbos?**
- [AZD trikčių šalinimo vadovas](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service trikčių šalinimas](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL trikčių šalinimas](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktiniai pratimai

### Pratimas 1: Patikrinkite savo diegimą (Pradedantiesiems)

**Tikslas**: Patvirtinti, kad visi resursai yra įdiegti ir programa veikia.

**Žingsniai**:
1. Išvardinkite visus resursus savo resursų grupėje:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Tikėtinas rezultatas**: 6-7 resources (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Išbandykite visus API galinius taškus:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Tikėtinas rezultatas**: visi grąžina galiojančius JSON be klaidų

3. Patikrinkite Application Insights:
   - Eikite į Application Insights Azure portale
   - Eikite į "Live Metrics"
   - Atnaujinkite naršyklės puslapį web programoje
   **Tikėtinas rezultatas**: Matyti užklausas, atsirandančias realiu laiku

**Sėkmės kriterijai**: Visi 6-7 resursai egzistuoja, visi galiniai taškai grąžina duomenis, Live Metrics rodo veiklą.

---

### Pratimas 2: Pridėti naują API galinį tašką (Tarpinis)

**Tikslas**: Išplėsti Flask programą pridėjus naują galinį tašką.

**Pradinė kodo bazė**: Esami galiniai taškai faile `src/web/app.py`

**Žingsniai**:
1. Redaguokite `src/web/app.py` ir pridėkite naują galinį tašką po `get_product()` funkcijos:
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

2. Įdiekite atnaujintą programą:
   ```sh
   azd deploy
   ```

3. Išbandykite naują galinį tašką:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Tikėtinas rezultatas**: Grąžina produktus, atitinkančius "laptop"

**Sėkmės kriterijai**: Naujas galinis taškas veikia, grąžina filtruotus rezultatus, matomas Application Insights žurnaluose.

---

### Pratimas 3: Pridėti stebėjimą ir įspėjimus (Išplėstinis)

**Tikslas**: Sukonfigūruoti proaktyvų stebėjimą su įspėjimais.

**Žingsniai**:
1. Sukurkite įspėjimą dėl HTTP 500 klaidų:
   ```sh
   # Gauti Application Insights resurso identifikatorių
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Sukurti įspėjimą
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Išprovokuokite įspėjimą sukeldami klaidas:
   ```sh
   # Užklausti neegzistuojančio produkto
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Patikrinkite, ar įspėjimas suveikė:
   - Azure Portal → Alerts → Alert Rules
   - Patikrinkite savo el. paštą (jei sukonfigūruota)

**Sėkmės kriterijai**: Įspėjimo taisyklė sukurta, suveikia klaidų atveju, pranešimai gaunami.

---

### Pratimas 4: Duomenų bazės schemos pakeitimai (Išplėstinis)

**Tikslas**: Pridėti naują lentelę ir pakeisti programą, kad ją naudotų.

**Žingsniai**:
1. Prisijunkite prie SQL Database per Azure Portal Query Editor

2. Sukurkite naują lentelę `categories`:
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

3. Atnaujinkite `src/web/app.py`, kad atsakymuose būtų kategorijų informacija

4. Įdiekite ir išbandykite

**Sėkmės kriterijai**: Nauja lentelė egzistuoja, produktai rodo kategorijų informaciją, programa vis dar veikia.

---

### Pratimas 5: Įdiegti talpyklavimą (Ekspertas)

**Tikslas**: Pridėti Azure Redis Cache, kad pagerintumėte našumą.

**Žingsniai**:
1. Pridėkite Redis Cache į `infra/main.bicep`
2. Atnaujinkite `src/web/app.py`, kad talpintumėte produkto užklausas
3. Išmatuokite našumo pagerėjimą su Application Insights
4. Palyginkite atsako laikus prieš/po talpyklavimo

**Sėkmės kriterijai**: Redis įdiegtas, talpyklavimas veikia, atsakymo laikai pagerėja daugiau nei 50%.

**Patarimas**: Pradėkite nuo [Azure Cache for Redis dokumentacijos](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Išvalymas

Norėdami išvengti nuolatinių mokesčių, ištrinkite visus resursus pabaigus:

```sh
azd down
```

**Patvirtinimo raginimas**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Įveskite `y`, kad patvirtintumėte.

**✓ Sėkmės patikrinimas**: 
- Visi resursai ištrinti iš Azure portalo
- Nėra nuolatinių mokesčių
- Vietinis aplankas `.azure/<env-name>` gali būti ištrintas

**Alternatyva** (išlaikyti infrastruktūrą, ištrinti duomenis):
```sh
# Ištrinti tik išteklių grupę (palikti AZD konfigūraciją)
az group delete --name rg-<env-name> --yes
```
## Sužinokite daugiau

### Susijusi dokumentacija
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database dokumentacija](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service dokumentacija](https://learn.microsoft.com/azure/app-service/)
- [Application Insights dokumentacija](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep kalbos nuoroda](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Kiti žingsniai šiame kurse
- **[Container Apps pavyzdys](../../../../examples/container-app)**: Diegti mikroservisus su Azure Container Apps
- **[AI integracijos vadovas](../../../../docs/ai-foundry)**: Pridėkite AI galimybes savo programai
- **[Geriausios diegimo praktikos](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Produkcinių diegimų modeliai

### Išplėstiniai dalykai
- **Managed Identity**: Pašalinkite slaptažodžius ir naudokite Azure AD autentifikaciją
- **Private Endpoints**: Apsaugokite duomenų bazės ryšius virtualiame tinkle
- **CI/CD integracija**: Automatizuokite diegimus su GitHub Actions arba Azure DevOps
- **Multi-Environment**: Sukonfigūruokite dev, staging ir production aplinkas
- **Duomenų bazių migracijos**: Naudokite Alembic arba Entity Framework schemos versijų valdymui

### Palyginimas su kitais požiūriais

**AZD prieš ARM šablonus**:
- ✅ AZD: Aukštesnio lygio abstrakcija, paprastesnės komandos
- ⚠️ ARM: Išsamesnis, suteikia smulkesnę kontrolę

**AZD prieš Terraform**:
- ✅ AZD: Azure natyvus, integruotas su Azure paslaugomis
- ⚠️ Terraform: Palaiko kelių debesų platformas, didesnė ekosistema

**AZD prieš Azure Portal**:
- ✅ AZD: Kartojamas, valdomas versijomis, automatizuojamas
- ⚠️ Portal: Rankiniai paspaudimai, sunku atkartoti

**Pagalvokite apie AZD kaip**: Docker Compose for Azure—supaprastinta konfigūracija sudėtingiems diegimams.

---

## Dažniausiai užduodami klausimai

**K: Ar galiu naudoti kitą programavimo kalbą?**  
A: Taip! Pakeiskite `src/web/` į Node.js, C#, Go arba bet kurią kitą kalbą. Atnaujinkite `azure.yaml` ir Bicep atitinkamai.

**K: Kaip pridėti daugiau duomenų bazių?**  
A: Pridėkite kitą SQL Database modulį faile `infra/main.bicep` arba naudokite PostgreSQL/MySQL iš Azure Database paslaugų.

**K: Ar tai galiu naudoti produkcijoje?**  
A: Tai yra pradinis taškas. Produkcijoje pridėkite: managed identity, private endpoints, redundanciją, atsarginių kopijų strategiją, WAF, ir išplėstinį stebėjimą.

**K: O kas jei noriu naudoti konteinerius vietoje kodo diegimo?**  
A: Peržiūrėkite **[Container Apps pavyzdys](../../../../examples/container-app)**, kuris naudoja Docker konteinerius visur.

**K: Kaip prisijungti prie duomenų bazės iš mano vietinio kompiuterio?**  
A: Pridėkite savo IP prie SQL Server ugniasienės:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**K: Ar galiu naudoti esamą duomenų bazę vietoje naujos kūrimo?**  
A: Taip, pakeiskite `infra/main.bicep`, kad nurodytumėte esamą SQL Server ir atnaujinkite prisijungimo eilutės parametrus.

---

> **Pastaba:** Šis pavyzdys demonstruoja geriausias praktikas diegiant web programą su duomenų baze naudojant AZD. Jame yra veikiantis kodas, išsami dokumentacija ir praktiniai pratimai žinioms stiprinti. Produkciniams diegimams peržiūrėkite saugumo, skalavimo, atitikties ir išlaidų reikalavimus, specifinius jūsų organizacijai.

**📚 Kurso navigacija:**
- ← Ankstesnis: [Container Apps pavyzdys](../../../../examples/container-app)
- → Kitas: [AI integracijos vadovas](../../../../docs/ai-foundry)
- 🏠 [Kurso pradžia](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas pasitelkus dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Jei informacija yra kritinė, rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus arba neteisingas interpretacijas, kilusias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->