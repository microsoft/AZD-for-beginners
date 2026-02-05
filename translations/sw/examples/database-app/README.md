# Kuweka Hifadhidata ya Microsoft SQL na Programu ya Wavuti kwa AZD

⏱️ **Muda Unaokadiriwa**: Dakika 20-30 | 💰 **Gharama Inayokadiriwa**: ~$15-25/mwezi | ⭐ **Ugumu**: Kati

Mfano huu **kamili na unaofanya kazi** unaonyesha jinsi ya kutumia [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) kuweka programu ya wavuti ya Python Flask na Hifadhidata ya Microsoft SQL kwenye Azure. Msimbo wote umejumuishwa na kujaribiwa—hakuna utegemezi wa nje unaohitajika.

## Utakachojifunza

Kwa kukamilisha mfano huu, utaweza:
- Kuweka programu ya tabaka nyingi (programu ya wavuti + hifadhidata) kwa kutumia miundombinu kama msimbo
- Kuseti muunganisho salama wa hifadhidata bila kuweka siri kwenye msimbo
- Kufuatilia afya ya programu kwa Application Insights
- Kusimamia rasilimali za Azure kwa ufanisi kwa kutumia AZD CLI
- Kufuatilia mazoea bora ya Azure kwa usalama, uboreshaji wa gharama, na ufuatiliaji

## Muhtasari wa Hali
- **Programu ya Wavuti**: API ya Python Flask REST yenye muunganisho wa hifadhidata
- **Hifadhidata**: Hifadhidata ya Azure SQL yenye data ya mfano
- **Miundombinu**: Imewekwa kwa kutumia Bicep (violezo vya modular, vinavyoweza kutumika tena)
- **Uwekaji**: Imefanywa kikamilifu kwa amri za `azd`
- **Ufuatiliaji**: Application Insights kwa magogo na telemetry

## Mahitaji

### Zana Zinazohitajika

Kabla ya kuanza, hakikisha una zana hizi zimesakinishwa:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (toleo 2.50.0 au zaidi)
   ```sh
   az --version
   # Matokeo yanayotarajiwa: azure-cli 2.50.0 au zaidi
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (toleo 1.0.0 au zaidi)
   ```sh
   azd version
   # Matokeo yanayotarajiwa: toleo la azd 1.0.0 au zaidi
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (kwa maendeleo ya ndani)
   ```sh
   python --version
   # Matokeo yanayotarajiwa: Python 3.8 au zaidi
   ```

4. **[Docker](https://www.docker.com/get-started)** (hiari, kwa maendeleo ya ndani yaliyowekwa kwenye kontena)
   ```sh
   docker --version
   # Matokeo yanayotarajiwa: Toleo la Docker 20.10 au juu zaidi
   ```

### Mahitaji ya Azure

- Usajili wa **Azure** unaofanya kazi ([unda akaunti ya bure](https://azure.microsoft.com/free/))
- Ruhusa za kuunda rasilimali kwenye usajili wako
- **Mmiliki** au **Mchangiaji** wa usajili au kikundi cha rasilimali

### Maarifa Yanayohitajika

Huu ni mfano wa **kiwango cha kati**. Unapaswa kuwa na uelewa wa:
- Operesheni za msingi za mstari wa amri
- Dhana za msingi za wingu (rasilimali, vikundi vya rasilimali)
- Uelewa wa msingi wa programu za wavuti na hifadhidata

**Mpya kwa AZD?** Anza na [Mwongozo wa Kuanza](../../docs/getting-started/azd-basics.md) kwanza.

## Muundo

Mfano huu unaweka muundo wa tabaka mbili na programu ya wavuti na hifadhidata ya SQL:

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

**Uwekaji wa Rasilimali:**
- **Kikundi cha Rasilimali**: Kontena kwa rasilimali zote
- **Mpango wa Huduma ya Programu**: Ukaribishaji wa Linux (daraja la B1 kwa ufanisi wa gharama)
- **Programu ya Wavuti**: Python 3.11 runtime na programu ya Flask
- **Seva ya SQL**: Seva ya hifadhidata inayosimamiwa na TLS 1.2 minimum
- **Hifadhidata ya SQL**: Daraja la msingi (2GB, inayofaa kwa maendeleo/majaribio)
- **Application Insights**: Ufuatiliaji na magogo
- **Workspace ya Log Analytics**: Hifadhi ya magogo ya kati

**Mfano**: Fikiria hii kama mgahawa (programu ya wavuti) na friza ya kuingia (hifadhidata). Wateja wanaagiza kutoka kwenye menyu (API endpoints), na jikoni (programu ya Flask) inachukua viungo (data) kutoka friza. Meneja wa mgahawa (Application Insights) anafuatilia kila kinachotokea.

## Muundo wa Folda

Faili zote zimejumuishwa katika mfano huu—hakuna utegemezi wa nje unaohitajika:

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

**Kazi ya Kila Faili:**
- **azure.yaml**: Inaeleza AZD nini cha kuweka na wapi
- **infra/main.bicep**: Inaweka rasilimali zote za Azure
- **infra/resources/*.bicep**: Ufafanuzi wa rasilimali za mtu binafsi (modular kwa matumizi tena)
- **src/web/app.py**: Programu ya Flask yenye mantiki ya hifadhidata
- **requirements.txt**: Utegemezi wa kifurushi cha Python
- **Dockerfile**: Maelekezo ya kontena kwa uwekaji

## Kuanza Haraka (Hatua kwa Hatua)

### Hatua ya 1: Kloni na Tembea

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Ukaguzi wa Mafanikio**: Hakikisha unaona `azure.yaml` na folda ya `infra/`:
```sh
ls
# Inatarajiwa: README.md, azure.yaml, infra/, src/
```

### Hatua ya 2: Thibitisha na Azure

```sh
azd auth login
```

Hii inafungua kivinjari chako kwa uthibitisho wa Azure. Ingia kwa kutumia maelezo yako ya Azure.

**✓ Ukaguzi wa Mafanikio**: Unapaswa kuona:
```
Logged in to Azure.
```

### Hatua ya 3: Anzisha Mazingira

```sh
azd init
```

**Kinachotokea**: AZD inaunda usanidi wa ndani kwa uwekaji wako.

**Maswali utakayoulizwa**:
- **Jina la mazingira**: Ingiza jina fupi (mfano, `dev`, `myapp`)
- **Usajili wa Azure**: Chagua usajili wako kutoka kwenye orodha
- **Eneo la Azure**: Chagua eneo (mfano, `eastus`, `westeurope`)

**✓ Ukaguzi wa Mafanikio**: Unapaswa kuona:
```
SUCCESS: New project initialized!
```

### Hatua ya 4: Weka Rasilimali za Azure

```sh
azd provision
```

**Kinachotokea**: AZD inaweka miundombinu yote (inachukua dakika 5-8):
1. Inaunda kikundi cha rasilimali
2. Inaunda Seva ya SQL na Hifadhidata
3. Inaunda Mpango wa Huduma ya Programu
4. Inaunda Programu ya Wavuti
5. Inaunda Application Insights
6. Inasanidi mtandao na usalama

**Utaulizwa kuhusu**:
- **Jina la msimamizi wa SQL**: Ingiza jina la mtumiaji (mfano, `sqladmin`)
- **Nenosiri la msimamizi wa SQL**: Ingiza nenosiri lenye nguvu (hifadhi hili!)

**✓ Ukaguzi wa Mafanikio**: Unapaswa kuona:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Muda**: Dakika 5-8

### Hatua ya 5: Weka Programu

```sh
azd deploy
```

**Kinachotokea**: AZD inajenga na kuweka programu yako ya Flask:
1. Inapakia programu ya Python
2. Inajenga kontena la Docker
3. Inasukuma kwenye Programu ya Wavuti ya Azure
4. Inaanzisha hifadhidata na data ya mfano
5. Inaanzisha programu

**✓ Ukaguzi wa Mafanikio**: Unapaswa kuona:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Muda**: Dakika 3-5

### Hatua ya 6: Vinjari Programu

```sh
azd browse
```

Hii inafungua programu yako ya wavuti iliyowekwa kwenye kivinjari kwa `https://app-<unique-id>.azurewebsites.net`

**✓ Ukaguzi wa Mafanikio**: Unapaswa kuona matokeo ya JSON:
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

### Hatua ya 7: Jaribu API Endpoints

**Ukaguzi wa Afya** (thibitisha muunganisho wa hifadhidata):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Jibu Linalotarajiwa**:
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

**Jibu Linalotarajiwa**:
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

**✓ Ukaguzi wa Mafanikio**: Endpoints zote zinarudisha data ya JSON bila makosa.

---

**🎉 Hongera!** Umefanikiwa kuweka programu ya wavuti yenye hifadhidata kwenye Azure kwa kutumia AZD.

## Uchambuzi wa Usanidi

### Vigezo vya Mazingira

Siri zinadhibitiwa kwa usalama kupitia usanidi wa Azure App Service—**hazijawahi kuwekwa kwenye msimbo wa chanzo**.

**Zimesanidiwa Kiotomatiki na AZD**:
- `SQL_CONNECTION_STRING`: Muunganisho wa hifadhidata na hati zilizofichwa
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endpoint ya telemetry ya ufuatiliaji
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Inawezesha usakinishaji wa utegemezi kiotomatiki

**Mahali Siri Zinahifadhiwa**:
1. Wakati wa `azd provision`, unatoa hati za SQL kupitia maswali salama
2. AZD inahifadhi hizi kwenye faili yako ya ndani ya `.azure/<env-name>/.env` (imepuuzwa na git)
3. AZD inazipachika kwenye usanidi wa Azure App Service (imefichwa kwa kupumzika)
4. Programu inazisoma kupitia `os.getenv()` wakati wa kukimbia

### Maendeleo ya Ndani

Kwa majaribio ya ndani, unda faili ya `.env` kutoka kwa mfano:

```sh
cp .env.sample .env
# Hariri .env na muunganisho wa hifadhidata yako ya ndani
```

**Mtiririko wa Maendeleo ya Ndani**:
```sh
# Sakinisha utegemezi
cd src/web
pip install -r requirements.txt

# Weka vigezo vya mazingira
export SQL_CONNECTION_STRING="your-local-connection-string"

# Endesha programu
python app.py
```

**Jaribu ndani**:
```sh
curl http://localhost:8000/health
# Inatarajiwa: {"status": "nzima", "database": "imeunganishwa"}
```

### Miundombinu kama Msimbo

Rasilimali zote za Azure zimesanidiwa katika **violezo vya Bicep** (`infra/` folda):

- **Muundo wa Modular**: Kila aina ya rasilimali ina faili yake kwa matumizi tena
- **Imewekwa Parameta**: Badilisha SKUs, maeneo, kanuni za majina
- **Mazoea Bora**: Inafuata viwango vya majina vya Azure na chaguo-msingi za usalama
- **Imewekwa Toleo**: Mabadiliko ya miundombinu yanafuatiliwa kwenye Git

**Mfano wa Kubadilisha**:
Kubadilisha daraja la hifadhidata, hariri `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Mazoea Bora ya Usalama

Mfano huu unafuata mazoea bora ya usalama ya Azure:

### 1. **Hakuna Siri kwenye Msimbo wa Chanzo**
- ✅ Hati zimehifadhiwa kwenye usanidi wa Azure App Service (imefichwa)
- ✅ Faili za `.env` zimepuuzwa na Git kupitia `.gitignore`
- ✅ Siri zinapita kupitia maswali salama wakati wa uwekaji

### 2. **Muunganisho Uliofichwa**
- ✅ TLS 1.2 minimum kwa Seva ya SQL
- ✅ HTTPS tu inasisitizwa kwa Programu ya Wavuti
- ✅ Muunganisho wa hifadhidata hutumia njia zilizofichwa

### 3. **Usalama wa Mtandao**
- ✅ Seva ya SQL firewall imewekwa kuruhusu huduma za Azure pekee
- ✅ Ufikiaji wa mtandao wa umma umepunguzwa (unaweza kufungwa zaidi kwa Private Endpoints)
- ✅ FTPS imezimwa kwenye Programu ya Wavuti

### 4. **Uthibitisho na Uidhinishaji**
- ⚠️ **Sasa**: Uthibitisho wa SQL (jina la mtumiaji/nenosiri)
- ✅ **Pendekezo la Uzalishaji**: Tumia Azure Managed Identity kwa uthibitisho bila nenosiri

**Kuboresha hadi Managed Identity** (kwa uzalishaji):
1. Washa managed identity kwenye Programu ya Wavuti
2. Peana ruhusa za SQL kwa identity
3. Sasisha muunganisho wa hifadhidata kutumia managed identity
4. Ondoa uthibitisho wa msingi wa nenosiri

### 5. **Ukaguzi na Uzingatiaji**
- ✅ Application Insights inarekodi maombi yote na makosa
- ✅ Ukaguzi wa Hifadhidata ya SQL umewezeshwa (unaweza kusanidiwa kwa uzingatiaji)
- ✅ Rasilimali zote zimewekewa lebo kwa usimamizi

**Orodha ya Usalama Kabla ya Uzalishaji**:
- [ ] Washa Azure Defender kwa SQL
- [ ] Sanidi Private Endpoints kwa Hifadhidata ya SQL
- [ ] Washa Web Application Firewall (WAF)
- [ ] Tekeleza Azure Key Vault kwa mzunguko wa siri
- [ ] Sanidi uthibitisho wa Azure AD
- [ ] Washa magogo ya uchunguzi kwa rasilimali zote

## Uboreshaji wa Gharama

**Gharama za Kila Mwezi Zinazokadiriwa** (kuanzia Novemba 2025):

| Rasilimali | SKU/Daraja | Gharama Inayokadiriwa |
|------------|------------|-----------------------|
| Mpango wa Huduma ya Programu | B1 (Msingi) | ~$13/mwezi |
| Hifadhidata ya SQL | Msingi (2GB) | ~$5/mwezi |
| Application Insights | Pay-as-you-go | ~$2/mwezi (trafiki ndogo) |
| **Jumla** | | **~$20/mwezi** |

**💡 Vidokezo vya Kuokoa Gharama**:

1. **Tumia Daraja la Bure kwa Kujifunza**:
   - Huduma ya Programu: Daraja la F1 (bure, masaa yaliyopunguzwa)
   - Hifadhidata ya SQL: Tumia Azure SQL Database serverless
   - Application Insights: 5GB/mwezi bure kwa uingizaji

2. **Zima Rasilimali Wakati Hazitumiki**:
   ```sh
   # Zima programu ya wavuti (hifadhidata bado inatoza)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Anzisha tena inapohitajika
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Futa Kila Kitu Baada ya Majaribio**:
   ```sh
   azd down
   ```
   Hii inaondoa rasilimali ZOTE na kusimamisha malipo.

4. **Daraja la Maendeleo vs. Uzalishaji**:
   - **Maendeleo**: Daraja la msingi (lililotumika katika mfano huu)
   - **Uzalishaji**: Daraja la Kawaida/Premium lenye redundancy

**Ufuatiliaji wa Gharama**:
- Tazama gharama kwenye [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Sanidi arifa za gharama ili kuepuka mshangao
- Weka lebo zote za rasilimali na `azd-env-name` kwa ufuatiliaji

**Njia Mbadala ya Daraja la Bure**:
Kwa madhumuni ya kujifunza, unaweza kubadilisha `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Kumbuka**: Daraja la bure lina mipaka (dakika 60/siku CPU, hakuna hali ya daima).

## Ufuatiliaji na Ufuatiliaji

### Ushirikiano wa Application Insights

Mfano huu unajumuisha **Application Insights** kwa ufuatiliaji wa kina:

**Kinachofuatiliwa**:
- ✅ Maombi ya HTTP (latency, nambari za hali, endpoints)
- ✅ Makosa ya programu na ubaguzi
- ✅ Magogo maalum kutoka programu ya Flask
- ✅ Afya ya muunganisho wa hifadhidata
- ✅ Vipimo vya utendaji (CPU, kumbukumbu)

**Fikia Application Insights**:
1. Fungua [Azure Portal](https://portal.azure.com)
2. Tembea kwenye kikundi chako cha rasilimali (`rg-<env-name>`)
3. Bonyeza rasilimali ya Application Insights (`appi-<unique-id>`)

**Maswali Muhimu** (Application Insights → Logs):

**Tazama Maombi Yote**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Pata Makosa**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Angalia Endpoint ya Afya**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Ukaguzi wa Hifadhidata ya SQL

**Ukaguzi wa Hifadhidata ya SQL umewezeshwa** kufuatilia:
- Mwelekeo wa ufikiaji wa hifadhidata
- Jaribio la kuingia lililoshindwa
- Mabadiliko ya schema
- Ufikiaji wa data (kwa uzingatiaji)

**Fikia Magogo ya Ukaguzi**:
1. Azure Portal → Hifadhidata ya SQL → Ukaguzi
2. Tazama magogo kwenye workspace ya Log Analytics

### Ufuatiliaji wa Wakati Halisi

**Tazama Vipimo vya Moja kwa Moja**:
1. Application Insights → Live Metrics
2. Tazama maombi, kushindwa, na utendaji kwa wakati halisi

**Sanidi Arifa**:
Unda arifa kwa matukio muhimu:
- Makosa ya HTTP 500 > 5 kwa dakika 5
- Muda wa majibu ya juu (> sekunde 2)

**Mfano wa Kuunda Tahadhari**:
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

#### 1. `azd provision` inashindwa na "Eneo halipatikani"

**Dalili**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Suluhisho**:
Chagua eneo tofauti la Azure au sajili mtoa huduma wa rasilimali:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Muunganisho wa SQL Unashindwa Wakati wa Uwekaji

**Dalili**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Suluhisho**:
- Hakikisha firewall ya SQL Server inaruhusu huduma za Azure (imewekwa kiotomatiki)
- Thibitisha nenosiri la msimamizi wa SQL liliingizwa kwa usahihi wakati wa `azd provision`
- Hakikisha SQL Server imewekwa kikamilifu (inaweza kuchukua dakika 2-3)

**Thibitisha Muunganisho**:
```sh
# Kutoka Azure Portal, nenda kwa SQL Database → Mhariri wa Maswali
# Jaribu kuunganishwa na hati zako za kuingia
```

#### 3. Programu ya Wavuti Inaonyesha "Hitilafu ya Programu"

**Dalili**:
Kivinjari kinaonyesha ukurasa wa hitilafu wa kawaida.

**Suluhisho**:
Angalia kumbukumbu za programu:
```sh
# Tazama kumbukumbu za hivi karibuni
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Sababu za Kawaida**:
- Kutokuwepo kwa vigezo vya mazingira (angalia App Service → Configuration)
- Kushindwa kwa usakinishaji wa kifurushi cha Python (angalia kumbukumbu za uwekaji)
- Hitilafu ya uanzishaji wa hifadhidata (angalia muunganisho wa SQL)

#### 4. `azd deploy` Inashindwa na "Hitilafu ya Kujenga"

**Dalili**:
```
Error: Failed to build project
```

**Suluhisho**:
- Hakikisha `requirements.txt` haina hitilafu za sintaksia
- Angalia kuwa Python 3.11 imetajwa katika `infra/resources/web-app.bicep`
- Thibitisha Dockerfile ina picha sahihi ya msingi

**Fanya Utatuzi wa Matatizo Lokali**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Haijaruhusiwa" Wakati wa Kuendesha Amri za AZD

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

Thibitisha una ruhusa sahihi (jukumu la Contributor) kwenye usajili.

#### 6. Gharama za Juu za Hifadhidata

**Dalili**:
Bili ya Azure isiyotarajiwa.

**Suluhisho**:
- Angalia kama umesahau kuendesha `azd down` baada ya majaribio
- Thibitisha Hifadhidata ya SQL inatumia kiwango cha Msingi (si Premium)
- Kagua gharama katika Usimamizi wa Gharama wa Azure
- Weka tahadhari za gharama

### Kupata Msaada

**Angalia Vigezo Vyote vya Mazingira ya AZD**:
```sh
azd env get-values
```

**Angalia Hali ya Uwekaji**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Fikia Kumbukumbu za Programu**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Unahitaji Msaada Zaidi?**
- [Mwongozo wa Utatuzi wa AZD](../../docs/troubleshooting/common-issues.md)
- [Utatuzi wa Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Utatuzi wa Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Mazoezi ya Vitendo

### Zoezi 1: Thibitisha Uwekaji Wako (Mwanzo)

**Lengo**: Thibitisha rasilimali zote zimewekwa na programu inafanya kazi.

**Hatua**:
1. Orodhesha rasilimali zote katika kikundi chako cha rasilimali:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Inatarajiwa**: Rasilimali 6-7 (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Jaribu viingilio vyote vya API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Inatarajiwa**: Vyote vinarejesha JSON halali bila hitilafu

3. Angalia Application Insights:
   - Nenda kwenye Application Insights katika Azure Portal
   - Nenda kwenye "Live Metrics"
   - Fanya upya kivinjari chako kwenye programu ya wavuti
   **Inatarajiwa**: Ona maombi yanavyoonekana kwa wakati halisi

**Vigezo vya Mafanikio**: Rasilimali zote 6-7 zipo, viingilio vyote vinarejesha data, Live Metrics inaonyesha shughuli.

---

### Zoezi 2: Ongeza Kiingilio Kipya cha API (Kati)

**Lengo**: Panua programu ya Flask kwa kiingilio kipya.

**Msimbo wa Kuanza**: Viingilio vya sasa katika `src/web/app.py`

**Hatua**:
1. Hariri `src/web/app.py` na ongeza kiingilio kipya baada ya kazi ya `get_product()`:
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

2. Weka programu iliyosasishwa:
   ```sh
   azd deploy
   ```

3. Jaribu kiingilio kipya:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Inatarajiwa**: Inarejesha bidhaa zinazolingana na "laptop"

**Vigezo vya Mafanikio**: Kiingilio kipya kinafanya kazi, kinarejesha matokeo yaliyofichuliwa, kinaonekana katika kumbukumbu za Application Insights.

---

### Zoezi 3: Ongeza Ufuatiliaji na Tahadhari (Juu)

**Lengo**: Weka ufuatiliaji wa proaktif na tahadhari.

**Hatua**:
1. Unda tahadhari kwa hitilafu za HTTP 500:
   ```sh
   # Pata kitambulisho cha rasilimali cha Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Unda tahadhari
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Sababisha tahadhari kwa kuleta hitilafu:
   ```sh
   # Omba bidhaa isiyokuwepo
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Angalia kama tahadhari imeanzishwa:
   - Azure Portal → Alerts → Alert Rules
   - Angalia barua pepe yako (ikiwa imewekwa)

**Vigezo vya Mafanikio**: Kanuni ya tahadhari imeundwa, inachochea kwa hitilafu, arifa zinapokelewa.

---

### Zoezi 4: Mabadiliko ya Mpangilio wa Hifadhidata (Juu)

**Lengo**: Ongeza jedwali jipya na ubadilishe programu ili itumie.

**Hatua**:
1. Unganisha na Hifadhidata ya SQL kupitia Mhariri wa Maswali wa Azure Portal

2. Unda jedwali jipya la `categories`:
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

4. Weka na jaribu

**Vigezo vya Mafanikio**: Jedwali jipya lipo, bidhaa zinaonyesha taarifa za kategoria, programu bado inafanya kazi.

---

### Zoezi 5: Tekeleza Uwekaji Akiba (Mtaalamu)

**Lengo**: Ongeza Azure Redis Cache ili kuboresha utendaji.

**Hatua**:
1. Ongeza Redis Cache kwa `infra/main.bicep`
2. Sasisha `src/web/app.py` ili kuweka akiba ya maswali ya bidhaa
3. Pima uboreshaji wa utendaji na Application Insights
4. Linganisha muda wa majibu kabla/baada ya kuweka akiba

**Vigezo vya Mafanikio**: Redis imewekwa, kuweka akiba kunafanya kazi, muda wa majibu unaboreshwa kwa >50%.

**Kidokezo**: Anza na [Nyaraka za Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Usafishaji

Ili kuepuka gharama zinazoendelea, futa rasilimali zote ukimaliza:

```sh
azd down
```

**Kidokezo cha uthibitisho**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Andika `y` kuthibitisha.

**✓ Ukaguzi wa Mafanikio**: 
- Rasilimali zote zimefutwa kutoka Azure Portal
- Hakuna gharama zinazoendelea
- Folda ya ndani `.azure/<env-name>` inaweza kufutwa

**Njia Mbadala** (weka miundombinu, futa data):
```sh
# Futa tu kikundi cha rasilimali (weka usanidi wa AZD)
az group delete --name rg-<env-name> --yes
```
## Jifunze Zaidi

### Nyaraka Zinazohusiana
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Nyaraka za Hifadhidata ya Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/)
- [Nyaraka za Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Nyaraka za Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Marejeleo ya Lugha ya Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Hatua Zifuatazo Katika Kozi Hii
- **[Mfano wa Programu za Kontena](../../../../examples/container-app)**: Weka huduma ndogo na Azure Container Apps
- **[Mwongozo wa Ujumuishaji wa AI](../../../../docs/ai-foundry)**: Ongeza uwezo wa AI kwenye programu yako
- **[Mbinu Bora za Uwekaji](../../docs/deployment/deployment-guide.md)**: Mifumo ya uwekaji wa uzalishaji

### Mada za Juu
- **Utambulisho Unaosimamiwa**: Ondoa nywila na tumia uthibitisho wa Azure AD
- **Viingilio vya Kibinafsi**: Linda muunganisho wa hifadhidata ndani ya mtandao wa kibinafsi
- **Ujumuishaji wa CI/CD**: Weka uwekaji kiotomatiki na GitHub Actions au Azure DevOps
- **Mazingira Mengi**: Weka mazingira ya maendeleo, majaribio, na uzalishaji
- **Uhamishaji wa Hifadhidata**: Tumia Alembic au Entity Framework kwa toleo la mpangilio

### Ulinganisho na Njia Nyingine

**AZD vs. Violezo vya ARM**:
- ✅ AZD: Utoaji wa kiwango cha juu, amri rahisi
- ⚠️ ARM: Maelezo zaidi, udhibiti wa kina

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, imeunganishwa na huduma za Azure
- ⚠️ Terraform: Msaada wa wingu nyingi, mfumo mkubwa

**AZD vs. Azure Portal**:
- ✅ AZD: Inaweza kurudiwa, kudhibitiwa kwa toleo, kiotomatiki
- ⚠️ Portal: Kubofya kwa mikono, vigumu kurudia

**Fikiria AZD kama**: Docker Compose kwa Azure—usanidi rahisi kwa uwekaji tata.

---

## Maswali Yanayoulizwa Mara kwa Mara

**Swali: Je, naweza kutumia lugha tofauti ya programu?**  
Jibu: Ndio! Badilisha `src/web/` na Node.js, C#, Go, au lugha yoyote. Sasisha `azure.yaml` na Bicep ipasavyo.

**Swali: Jinsi ya kuongeza hifadhidata zaidi?**  
Jibu: Ongeza moduli nyingine ya Hifadhidata ya SQL katika `infra/main.bicep` au tumia PostgreSQL/MySQL kutoka huduma za Hifadhidata za Azure.

**Swali: Je, naweza kutumia hii kwa uzalishaji?**  
Jibu: Hii ni mwanzo tu. Kwa uzalishaji, ongeza: utambulisho unaosimamiwa, viingilio vya kibinafsi, upungufu, mkakati wa chelezo, WAF, na ufuatiliaji ulioboreshwa.

**Swali: Nini ikiwa nataka kutumia kontena badala ya uwekaji wa msimbo?**  
Jibu: Angalia [Mfano wa Programu za Kontena](../../../../examples/container-app) ambao hutumia kontena za Docker kote.

**Swali: Jinsi ya kuunganisha na hifadhidata kutoka kwa mashine yangu ya ndani?**  
Jibu: Ongeza IP yako kwenye firewall ya SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Swali: Je, naweza kutumia hifadhidata iliyopo badala ya kuunda mpya?**  
Jibu: Ndio, badilisha `infra/main.bicep` kurejelea SQL Server iliyopo na sasisha vigezo vya muunganisho.

---

> **Kumbuka:** Mfano huu unaonyesha mbinu bora za kuweka programu ya wavuti na hifadhidata kwa kutumia AZD. Inajumuisha msimbo unaofanya kazi, nyaraka za kina, na mazoezi ya vitendo ili kuimarisha kujifunza. Kwa uwekaji wa uzalishaji, kagua mahitaji ya usalama, upanuzi, uzingatiaji, na gharama maalum kwa shirika lako.

**📚 Uabiri wa Kozi:**
- ← Awali: [Mfano wa Programu za Kontena](../../../../examples/container-app)
- → Ifuatayo: [Mwongozo wa Ujumuishaji wa AI](../../../../docs/ai-foundry)
- 🏠 [Nyumbani kwa Kozi](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->