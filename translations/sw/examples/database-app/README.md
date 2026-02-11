# Kuweka Hifadhidata ya Microsoft SQL na Web App kwa AZD

⏱️ **Muda unaokadiriwa**: 20-30 dakika | 💰 **Gharama Inayokadiriwa**: ~$15-25/mwezi | ⭐ **Ugumu**: Kati

Mfano huu kamili, unaofanya kazi unaonyesha jinsi ya kutumia [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) kupeleka programu ya wavuti ya Python Flask yenye hifadhidata ya Microsoft SQL kwenye Azure. Msimbo mzima umejumuishwa na umejaribiwa—hakuna utegemezi wa nje unaohitajika.

## Utajifunza Nini

Kwa kukamilisha mfano huu, ut:
- Kupeleka programu yenye ngazi nyingi (web app + hifadhidata) ukitumia miundombinu kama msimbo
- Kusanidi muunganisho salama wa hifadhidata bila kuweka siri ndani ya msimbo
- Kufuatilia afya ya programu kwa Application Insights
- Kusimamia rasilimali za Azure kwa ufanisi kwa kutumia AZD CLI
- Kufuatilia mbinu bora za Azure kwa usalama, uboreshaji wa gharama, na uonekano

## Muhtasari wa Senario
- **Web App**: API ya REST ya Python Flask yenye muunganisho wa hifadhidata
- **Database**: Azure SQL Database yenye data ya mfano
- **Infrastructure**: Imetolewa kwa kutumia Bicep (modular, templates zinazoweza kutumika tena)
- **Deployment**: Imewezeshwa kikamilifu kwa amri za `azd`
- **Monitoring**: Application Insights kwa kumbukumbu na telemetry

## Mahitaji ya Awali

### Zana Zinazohitajika

Kabla ya kuanza, hakikisha umeweka zana hizi:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (toleo 2.50.0 au juu)
   ```sh
   az --version
   # Matokeo yanayotarajiwa: azure-cli 2.50.0 au zaidi
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (toleo 1.0.0 au juu)
   ```sh
   azd version
   # Matokeo yanayotarajiwa: toleo la azd 1.0.0 au juu zaidi
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (kwa uendelezaji wa sehemu ya mtaa)
   ```sh
   python --version
   # Matokeo yanayotarajiwa: Python 3.8 au zaidi
   ```

4. **[Docker](https://www.docker.com/get-started)** (hiari, kwa maendeleo ya ndani kwa kutumia kontena)
   ```sh
   docker --version
   # Matokeo yanayotarajiwa: Toleo la Docker 20.10 au zaidi
   ```

### Mahitaji ya Azure

- Usajili wa **Azure** unaofanya kazi ([unda akaunti ya bure](https://azure.microsoft.com/free/))
- Ruhusa za kuunda rasilimali kwenye usajili wako
- Nafasi ya **Owner** au **Contributor** kwenye usajili au kundi la rasilimali

### Maarifa Yanayohitajika

Mfano huu ni wa ngazi ya **kati**. Unapaswa kuwa unafahamu:
- Uendeshaji wa mistari ya amri kwa msingi
- Misingi ya dhana za wingu (rasilimali, makundi ya rasilimali)
- Uelewa wa msingi wa programu za wavuti na hifadhidata

**Mpya kwa AZD?** Anza na [Mwongozo wa Kuanzisha](../../docs/chapter-01-foundation/azd-basics.md) kwanza.

## Miundombinu

Mfano huu unapeleka usanifu wa ngazi mbili yenye programu ya wavuti na hifadhidata ya SQL:

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
- **Resource Group**: Chombo cha kuhifadhi rasilimali zote
- **App Service Plan**: Uendeshaji kwa Linux (ngazi B1 kwa ufanisi wa gharama)
- **Web App**: Runtime ya Python 3.11 na programu ya Flask
- **SQL Server**: Seva ya hifadhidata inayodhibitiwa na TLS 1.2 au zaidi
- **SQL Database**: Ngazi ya Basic (2GB, inafaa kwa maendeleo/majaribio)
- **Application Insights**: Ufuatiliaji na kumbukumbu
- **Log Analytics Workspace**: Uhifadhi wa kumbukumbu ulio katikati

**Mfanano**: Fikiria hii kama mkahawa (web app) una friza ya walk-in (hifadhidata). Wateja wanaagiza kutoka kwenye menyu (endpoints za API), na jikoni (app ya Flask) huchukua viungo (data) kutoka friza. Meneja wa mkahawa (Application Insights) anafuatilia kila kitu kinachotokea.

## Muundo wa Folda

Faili zote zimetajwa katika mfano huu—hakuna utegemezi wa nje unaohitajika:

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

**What Each File Does:**
- **azure.yaml**: Inaeleza AZD nini cha kupeleka na wapi
- **infra/main.bicep**: Inaratibu rasilimali zote za Azure
- **infra/resources/*.bicep**: Ufafanuzi wa kila rasilimali (moduli kwa matumizi tena)
- **src/web/app.py**: Programu ya Flask yenye mantiki ya hifadhidata
- **requirements.txt**: Vimnunuzi vya pakiti za Python
- **Dockerfile**: Maelekezo ya kuweka ndani ya kontena kwa ajili ya utumiaji

## Mwongozo wa Haraka (Hatua kwa Hatua)

### Hatua 1: Kloni na Nenda Katika Folda

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Kagua Umefanikiwa**: Hakikisha unaona `azure.yaml` na folda `infra/`:
```sh
ls
# Inatarajiwa: README.md, azure.yaml, infra/, src/
```

### Hatua 2: Ingia kwenye Azure

```sh
azd auth login
```

Hii itafungua kivinjari chako kwa uthibitishaji wa Azure. Ingia kwa nyaraka zako za Azure.

**✓ Kagua Umefanikiwa**: Unapaswa kuona:
```
Logged in to Azure.
```

### Hatua 3: Anzisha Mazingira

```sh
azd init
```

**Nini kinatokea**: AZD huunda usanidi wa ndani kwa ajili ya utekelezaji wako.

**Una maswali utakaoyaona**:
- **Environment name**: Ingiza jina fupi (kwa mfano, `dev`, `myapp`)
- **Azure subscription**: Chagua usajili wako kutoka kwenye orodha
- **Azure location**: Chagua eneo (kwa mfano, `eastus`, `westeurope`)

**✓ Kagua Umefanikiwa**: Unapaswa kuona:
```
SUCCESS: New project initialized!
```

### Hatua 4: Toa Rasilimali za Azure

```sh
azd provision
```

**Nini kinatokea**: AZD inapeleka miundombinu yote (huchukua dakika 5-8):
1. Inaunda resource group
2. Inaunda SQL Server na Database
3. Inaunda App Service Plan
4. Inaunda Web App
5. Inaunda Application Insights
6. Inasanidi mtandao na usalama

**Utaulizwa kwa**:
- **SQL admin username**: Weka jina la mtumiaji (kwa mfano, `sqladmin`)
- **SQL admin password**: Weka nenosiri salama (hihifadhi!)

**✓ Kagua Umefanikiwa**: Unapaswa kuona:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Muda**: 5-8 dakika

### Hatua 5: Peleka Programu

```sh
azd deploy
```

**Nini kinatokea**: AZD hujenga na kupeleka programu yako ya Flask:
1. Inapakisha programu ya Python
2. Inajenga kontena la Docker
3. Inatuliza kwenye Azure Web App
4. Inanzisha hifadhidata kwa data ya mfano
5. Inaamsha programu

**✓ Kagua Umefanikiwa**: Unapaswa kuona:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Muda**: 3-5 dakika

### Hatua 6: Vinjari Programu

```sh
azd browse
```

Hii itafungua web app yako iliyowekwa kwenye kivinjari kwa `https://app-<unique-id>.azurewebsites.net`

**✓ Kagua Umefanikiwa**: Unapaswa kuona toleo la JSON:
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

### Hatua 7: Jaribu Endpoints za API

**Ukaguzi wa Afya** (hakikisha muunganisho wa hifadhidata):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Majibu Yanayotarajiwa**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Orodha ya Bidhaa** (data ya mfano):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Majibu Yanayotarajiwa**:
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

**Pata Bidhaa Moja**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Kagua Umefanikiwa**: Endpoints zote zinarejea data ya JSON bila makosa.

---

**🎉 Hongera!** Umefanikiwa kupeleka programu ya wavuti yenye hifadhidata kwenye Azure kwa kutumia AZD.

## Ufafanuzi wa Mipangilio

### Vigezo vya Mazingira

Siri zinadhibitiwa kwa usalama kupitia usanidi wa Azure App Service—**zitafutwe kamwe ndani ya msimbo wa chanzo**.

**Zimewekwa Kiotomatiki na AZD**:
- `SQL_CONNECTION_STRING`: Muunganisho wa hifadhidata yenye sifa zilizofichwa
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Seva ya telemetry ya ufuatiliaji
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Inawezesha usakinishaji wa utegemezi wakati wa utolewaji

**Wapi Siri Zinahifadhiwa**:
1. Wakati wa `azd provision`, unatoa nyaraka za SQL kupitia vituo vya usalama
2. AZD inazihifadhi katika faili yako ya ndani `.azure/<env-name>/.env` (haijajumuishwa Git)
3. AZD zinaingizwa kwenye usanidi wa Azure App Service (zilifichwa wakati wa kupumzika)
4. Programu inazisoma kupitia `os.getenv()` wakati wa utekelezaji

### Maendeleo ya Ndani (Local Development)

Kwa ajili ya majaribio ya ndani, tengeneza faili `.env` kutoka kwa sampuli:

```sh
cp .env.sample .env
# Hariri .env na muunganisho wa hifadhidata yako ya ndani
```

**Mfumo wa Kazi wa Maendeleo ya Ndani**:
```sh
# Sakinisha utegemezi
cd src/web
pip install -r requirements.txt

# Weka vigezo vya mazingira
export SQL_CONNECTION_STRING="your-local-connection-string"

# Endesha programu
python app.py
```

**Jaribu kwa ndani**:
```sh
curl http://localhost:8000/health
# Inatarajiwa: {"status": "hai", "database": "imeunganishwa"}
```

### Miundombinu kama Msimbo

Rasilimali zote za Azure zimetajwa katika **templates za Bicep** (folda `infra/`):

- **Muundo wa Moduli**: Kila aina ya rasilimali ina faili yake kwa matumizi tena
- **Iliyoparametishwa**: Badilisha SKUs, maeneo, na kanuni za uandishi majina
- **Marekebisho Bora**: Inafuata viwango vya uandishi majina vya Azure na chaguo-msingi za usalama
- **Iliyodhibitiwa kwa Tovuti ya Msimbo**: Mabadiliko ya miundombinu yafuatiwa kwa Git

**Mfano wa Urekebishaji**:
Ili kubadilisha ngazi ya hifadhidata, badilisha `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Mbinu Bora za Usalama

Mfano huu unafuata mbinu bora za usalama za Azure:

### 1. **Hakuna Siri Katika Msimbo wa Chanzo**
- ✅ Nywila zimedhibitiwa kwenye usanidi wa Azure App Service (zilifichwa)
- ✅ Faili `.env` zimeondolewa kutoka Git kwa `.gitignore`
- ✅ Siri zinapitishwa kupitia vigezo salama wakati wa utolewaji

### 2. **Muunganisho uliofichwa**
- ✅ TLS 1.2 angalau kwa SQL Server
- ✅ HTTPS pekee imetekelezwa kwa Web App
- ✅ Muunganisho wa hifadhidata unatumia njia zilizo na usimbaji

### 3. **Usalama wa Mtandao**
- ✅ Firewall ya SQL Server imesanifiwa ili kuruhusu huduma za Azure pekee
- ✅ Ufikiaji wa mtandao wa umma umezuiliwa (unaweza kufungwa zaidi kwa Private Endpoints)
- ✅ FTPS imezimwa kwenye Web App

### 4. **Uthibitishaji & Uidhinishaji**
- ⚠️ **Sasa**: Uthibitishaji wa SQL (jina la mtumiaji/nenosiri)
- ✅ **Mapendekezo kwa Uzalishaji**: Tumia Azure Managed Identity kwa uthibitishaji bila neno la siri

**Ili Kuboresha kwa Managed Identity** (kwa uzalishaji):
1. Washa managed identity kwenye Web App
2. Toa ruhusa za SQL kwa utambulisho
3. Sasisha string ya muunganisho ili kutumia managed identity
4. Ondoa uthibitishaji unaotumia nenosiri

### 5. **Ukaguzi & Uzingatiaji**
- ✅ Application Insights inarekodi maombi yote na makosa
- ✅ Ukaguzi wa SQL Database umewezeshwa (unaweza kusanidiwa kwa uzingatiaji)
- ✅ Rasilimali zote zimewekwa tag kwa ajili ya utawala

**Orodha ya Usalama Kabla ya Uzalishaji**:
- [ ] Washa Azure Defender kwa SQL
- [ ] Sanidi Private Endpoints kwa SQL Database
- [ ] Washa Web Application Firewall (WAF)
- [ ] Tekeleza Azure Key Vault kwa mzunguko wa siri
- [ ] Sanidi uthibitishaji wa Azure AD
- [ ] Washa kurekodi uchunguzi kwa rasilimali zote

## Uboreshaji wa Gharama

**Gharama za Kila Mwezi Zinazokadiriwa** (kama ya Novemba 2025):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 Vidokezo vya Kuokoa Gharama**:

1. **Tumia Ngazi ya Bure kwa Kujifunza**:
   - App Service: ngazi F1 (bure, saa chache)
   - SQL Database: Tumia Azure SQL Database serverless
   - Application Insights: 5GB/mwezi ukusanyaji wa bure

2. **Zima Rasilimali Usizotumia**:
   ```sh
   # Simamisha programu ya wavuti (hifadhidata bado inagharimu)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Anzisha upya inapohitajika
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Futa Kila Kitu Baada ya Majaribio**:
   ```sh
   azd down
   ```
   Hii inafuta RASILIMALI ZOTE na kusitisha malipo.

4. **SKUs kwa Maendeleo dhidi ya Uzalishaji**:
   - **Maendeleo**: Ngazi ya Basic (inayotumika katika mfano huu)
   - **Uzalishaji**: Ngazi ya Standard/Premium yenye redundancy

**Ufuatiliaji wa Gharama**:
- Tazama gharama katika [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Sanidi arifa za gharama ili kuepuka mshangao
- Piga tag kwa rasilimali zote kwa `azd-env-name` kwa ufuatiliaji

**Mbadala wa Ngazi ya Bure**:
Kwa madhumuni ya kujifunza, unaweza kubadilisha `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Kumbuka**: Ngazi ya bure ina mipaka (60 min/saa CPU kwa siku, hakuna always-on).

## Ufuatiliaji & Uonekano

### Uunganishaji wa Application Insights

Mfano huu unajumuisha **Application Insights** kwa ufuatiliaji kamili:

**Kinachofuatiliwa**:
- ✅ Maombi ya HTTP (ugumu, nambari za msimamo, endpoints)
- ✅ Makosa na exceptions za programu
- ✅ Kumbukumbu maalum kutoka app ya Flask
- ✅ Afya ya muunganisho wa hifadhidata
- ✅ Vipimo vya utendaji (CPU, kumbukumbu)

**Fikia Application Insights**:
1. Fungua [Azure Portal](https://portal.azure.com)
2. Nenda kwenye kundi lako la rasilimali (`rg-<env-name>`)
3. Bofya kwenye rasilimali ya Application Insights (`appi-<unique-id>`)

**Maswali Yanayofaa** (Application Insights → Logs):

**Tazama Maombi Yote**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Tafuta Makosa**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Kagua Endpoint ya Afya**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Ukaguzi wa SQL Database

**Ukaguzi wa SQL Database umewezeshwa** ili kufuatilia:
- Mifumo ya upatikanaji wa hifadhidata
- Jaribio la kuingia lililoshindikana
- Mabadiliko ya skima
- Upatikanaji wa data (kwa uzingatiaji)

**Fikia Logi za Ukaguzi**:
1. Azure Portal → SQL Database → Auditing
2. Tazama logi kwenye Log Analytics workspace

### Ufuatiliaji wa Wakati Halisi

**Tazama Vipimo Hai**:
1. Application Insights → Live Metrics
2. Tazama maombi, kushindwa, na utendaji kwa wakati halisi

**Sanidi Arifa**:
Tengeneza arifa kwa matukio muhimu:
- HTTP 500 makosa > 5 ndani ya dakika 5
- Kushindwa kwa muunganisho wa hifadhidata
- Muda wa majibu mrefu (>2 sekunde)

**Mfano wa Kuunda Onyo**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Utatuzi wa Matatizo

### Masuala ya Kawaida na Suluhisho

#### 1. `azd provision` inashindwa na "Location not available"

**Dalili**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Suluhisho**:
Chagua eneo tofauti la Azure au jisajili kwa mtoa rasilimali:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Muunganisho wa SQL Unashindwa Wakati wa Utekelezaji

**Dalili**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Suluhisho**:
- Thibitisha firewall ya SQL Server inaruhusu huduma za Azure (imewekwa kiotomatiki)
- Kagua kuwa nenosiri la msimamizi wa SQL liliingizwa kwa usahihi wakati wa `azd provision`
- Hakikisha SQL Server imeanzishwa kikamilifu (inaweza kuchukua 2-3 dakika)

**Thibitisha Muunganisho**:
```sh
# Kutoka kwenye Portal ya Azure, nenda kwenye SQL Database → Mhariri wa Maswali
# Jaribu kuungana kwa kutumia vitambulisho vyako
```

#### 3. Web App Inaonyesha "Application Error"

**Dalili**:
Kivinjari kinaonyesha ukurasa wa ujumbe wa hitilafu wa jumla.

**Suluhisho**:
Kagua kumbukumbu za programu:
```sh
# Tazama rekodi za hivi karibuni
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Sababu za kawaida**:
- Vigezo vya mazingira vinakosekana (angalia App Service → Configuration)
- Usakinishaji wa vifurushi vya Python umefeli (angalia deployment logs)
- Hitilafu ya uzinduzi wa hifadhidata (angalia muunganisho wa SQL)

#### 4. `azd deploy` Inashindwa na "Build Error"

**Dalili**:
```
Error: Failed to build project
```

**Suluhisho**:
- Hakikisha `requirements.txt` haina makosa ya sintaksia
- Angalia kuwa Python 3.11 imeainishwa katika `infra/resources/web-app.bicep`
- Thibitisha Dockerfile ina picha ya msingi sahihi

**Chunguza kwa kompyuta yako**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" Wakati wa Kuendesha Amri za AZD

**Dalili**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Suluhisho**:
Jisajili tena na Azure:
```sh
azd auth login
az login
```

Thibitisha una ruhusa sahihi (Contributor role) kwenye subscription.

#### 6. Gharama za Juu za Hifadhidata

**Dalili**:
Bili ya Azure isiyotarajiwa.

**Suluhisho**:
- Angalia kama ulikosa kuendesha `azd down` baada ya kupima
- Thibitisha SQL Database inatumia Basic tier (si Premium)
- Kagua gharama katika Azure Cost Management
- Sanidi arifa za gharama

### Kupata Msaada

**Tazama Vigezo Vyote vya Mazingira vya AZD**:
```sh
azd env get-values
```

**Kagua Hali ya Utekelezaji**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Pata Logu za Programu**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Unahitaji Msaada Zaidi?**
- [Mwongozo wa Utatuzi wa AZD](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Utatuzi wa Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Utatuzi wa Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Mazoezi ya Vitendo

### Zoezi 1: Thibitisha Utekelezaji Wako (Mwanzo)

**Lengo**: Thibitisha rasilimali zote zimewekwa na programu inafanya kazi.

**Hatua**:
1. Orodhesha rasilimali zote katika kundi lako la rasilimali:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Inayotarajiwa**: 6-7 resources (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Jaribu vituo vya mwisho vya API zote:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Inayotarajiwa**: Zote zirejeshe JSON halali bila makosa

3. Angalia Application Insights:
   - Nenda kwenye Application Insights kwenye Azure Portal
   - Nenda kwenye "Live Metrics"
   - Sasisha kivinjari chako kwenye web app
   **Inayotarajiwa**: Oona maombi yanaonekana kwa wakati halisi

**Vigezo vya Mafanikio**: Rasilimali zote 6-7 zipo, vituo vyote vya mwisho vinarejesha data, Live Metrics inaonyesha shughuli.

---

### Zoezi 2: Ongeza Endpoint Mpya wa API (Kati)

**Lengo**: Panua programu ya Flask kwa kuongeza endpoint mpya.

**Msimbo wa Mwanzo**: Endpoint za sasa katika `src/web/app.py`

**Hatua**:
1. Hariri `src/web/app.py` na ongeza endpoint mpya baada ya kazi ya `get_product()`:
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

2. Tekeleza programu iliyosasishwa:
   ```sh
   azd deploy
   ```

3. Jaribu endpoint mpya:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Inayotarajiwa**: Inarejesha bidhaa zinazolingana na "laptop"

**Vigezo vya Mafanikio**: Endpoint mpya inafanya kazi, inarejesha matokeo yaliyosefa, inaonekana kwenye logu za Application Insights.

---

### Zoezi 3: Ongeza Ufuatiliaji na Arifa (Kiwango cha Juu)

**Lengo**: Sanidi ufuatiliaji wa kuzuia matatizo na arifa.

**Hatua**:
1. Unda onyo la makosa ya HTTP 500:
   ```sh
   # Pata ID ya rasilimali ya Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Unda onyo
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Zidisha onyo kwa kusababisha makosa:
   ```sh
   # Ombi la bidhaa isiyopo
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Angalia kama onyo limezinduliwa:
   - Azure Portal → Alerts → Alert Rules
   - Angalia barua pepe yako (ikiwa imewekwa)

**Vigezo vya Mafanikio**: Sheria ya onyo imetengenezwa, inazinduliwa kwa makosa, taarifa zinapokelewa.

---

### Zoezi 4: Mabadiliko ya Schema ya Hifadhidata (Kiwango cha Juu)

**Lengo**: Ongeza jedwali jipya na urekebishe programu ili kuitumia.

**Hatua**:
1. Unganisha na SQL Database kupitia Query Editor ya Azure Portal

2. Unda jedwali jipya `categories`:
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

3. Sasisha `src/web/app.py` ili kujumuisha taarifa za kategoria katika majibu

4. Tekeleza na jaribu

**Vigezo vya Mafanikio**: Jedwali jipya lipo, bidhaa zinaonyesha taarifa za kategoria, programu bado inafanya kazi.

---

### Zoezi 5: Tekeleza Caching (Mtaalam)

**Lengo**: Ongeza Azure Redis Cache ili kuboresha utendaji.

**Hatua**:
1. Ongeza Redis Cache kwenye `infra/main.bicep`
2. Sasisha `src/web/app.py` ili kuhifadhi (cache) maswali ya bidhaa
3. Pima uboreshaji wa utendaji kwa kutumia Application Insights
4. Linganisha nyakati za majibu kabla/baada ya caching

**Vigezo vya Mafanikio**: Redis imesakinishwa, caching inafanya kazi, nyakati za majibu zinaboresha kwa >50%.

**Kidokezo**: Anza na [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Usafishaji

To avoid ongoing charges, delete all resources when done:

```sh
azd down
```

**Onyo la Uthibitisho**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Andika `y` kuthibitisha.

**✓ Ukaguzi wa Mafanikio**: 
- Rasilimali zote zimefutwa kutoka Azure Portal
- Hakuna malipo yanayoendelea
- Folda ya eneo `.azure/<env-name>` inaweza kufutwa

**Mbadala** (hifadhi miundombinu, futa data):
```sh
# Futa kikundi cha rasilimali tu (hifadhi usanidi wa AZD)
az group delete --name rg-<env-name> --yes
```
## Jifunze Zaidi

### Nyaraka Zinazohusiana
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Nyaraka za Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Nyaraka za Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Nyaraka za Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Marejeo ya Lugha ya Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Hatua Zifuatazo Katika Kozi Hii
- **[Mfano wa Container Apps](../../../../examples/container-app)**: Tuma microservices kwa Azure Container Apps
- **[Mwongozo wa Uingizaji AI](../../../../docs/ai-foundry)**: Ongeza uwezo wa AI kwenye programu yako
- **[Mbinu Bora za Utekelezaji](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Mifano ya utekelezaji kwa uzalishaji

### Mada za Juu
- **Managed Identity**: Ondoa nywila na tumia uthibitishaji wa Azure AD
- **Private Endpoints**: Linda muunganisho wa hifadhidata ndani ya virtual network
- **CI/CD Integration**: Automaticisha deployments kwa kutumia GitHub Actions au Azure DevOps
- **Multi-Environment**: Sanidi dev, staging, na production environments
- **Database Migrations**: Tumia Alembic au Entity Framework kwa ufuatiliaji wa toleo la schema

### Ulinganifu na Njia Nyingine

**AZD vs. ARM Templates**:
- ✅ AZD: Abstraksi ya ngazi ya juu, amri rahisi
- ⚠️ ARM: Maelezo mengi, udhibiti wa kina

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, imeunganishwa na huduma za Azure
- ⚠️ Terraform: Inasaidia wingu nyingi, mfumo mkubwa wa mazingira

**AZD vs. Azure Portal**:
- ✅ AZD: Inarudiwa, inasimamiwa kwa toleo, inaweza kuendeshwa kiotomatiki
- ⚠️ Portal: Bonyeza kwa mwongozo, ngumu kuiga tena

Fikiria AZD kama: Docker Compose kwa Azure—usanidi uliorahisishwa kwa utekelezaji mgumu.

---

## Maswali Yanayoulizwa Mara kwa Mara

**Q: Je, naweza kutumia lugha tofauti ya programu?**  
A: Ndiyo! Badilisha `src/web/` na Node.js, C#, Go, au lugha yoyote. Sasisha `azure.yaml` na Bicep ipasavyo.

**Q: Ninawezaje kuongeza hifadhidata zaidi?**  
A: Ongeza moduli nyingine ya SQL Database ndani ya `infra/main.bicep` au tumia PostgreSQL/MySQL kutoka kwa huduma za Azure Database.

**Q: Je, naweza kuitumia kwa uzalishaji?**  
A: Hii ni mwanzo wa mradi. Kwa uzalishaji, ongeza: managed identity, private endpoints, redundancy, mkakati wa backup, WAF, na ufuatiliaji ulioboreshwa.

**Q: Je, ninataka kutumia kontena badala ya kupeleka msimbo?**  
A: Angalia [Mfano wa Container Apps](../../../../examples/container-app) ambayo inatumia kontena za Docker kote.

**Q: Ninawezaje kuungana na hifadhidata kutoka mashine yangu ya ndani?**  
A: Ongeza IP yako kwenye firewall ya SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Je, naweza kutumia hifadhidata iliyopo badala ya kuunda mpya?**  
A: Ndiyo, rekebisha `infra/main.bicep` kurejea SQL Server iliyopo na sasisha vigezo vya connection string.

---

> **Kumbuka:** Mfano huu unaonyesha mbinu bora za kupeleka web app pamoja na hifadhidata kwa kutumia AZD. Unajumuisha msimbo unaofanya kazi, nyaraka kamili, na mazoezi ya vitendo ili kuimarisha kujifunza. Kwa utekelezaji wa uzalishaji, kagua usalama, upanuzi, utii wa sheria, na mahitaji ya gharama maalum kwa shirika lako.

**📚 Urambazaji wa Kozi:**
- ← Iliyotangulia: [Mfano wa Container Apps](../../../../examples/container-app)
- → Inayofuata: [Mwongozo wa Uingizaji AI](../../../../docs/ai-foundry)
- 🏠 [Nyumbani wa Kozi](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Angalizo:
Waraka huu umetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya asili katika lugha yake ya asili inapaswa kutambulika kama chanzo cha mamlaka. Kwa taarifa muhimu, tunapendekeza utumie tafsiri ya kitaalamu iliyofanywa na mtafsiri wa binadamu. Hatutawajibika kwa maelewano potofu au tafsiri isiyo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->