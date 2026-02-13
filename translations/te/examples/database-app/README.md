# AZD తో Microsoft SQL డేటాబేస్ మరియు వెబ్ యాప్‌ను డిప్లాయ్ చేయడం

⏱️ **అంచనా సమయం**: 20-30 నిమిషాలు | 💰 **అంచనా ఖర్చు**: ~$15-25/నెల | ⭐ **సంక్లిష్టత**: మధ్యస్థ

ఈ **పూర్తి, పనిచేసే ఉదాహరణ** ద్వారా మీరు [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) ను ఉపయోగించి Microsoft SQL డేటాబేస్‌తో ఒక Python Flask వెబ్ అప్లికేషన్‌ను Azure కు ఎలా డిప్లాయ్ చేయాలో చూపిస్తోంది. అన్ని కోడ్‌లు చేర్చబడ్డాయి మరియు పరీక్షించబడ్డాయి—బాహ్య ఆధారపడే అంశాలు అవసరం లేదు.

## మీరు ఏం నేర్చుకుంటారు

ఈ ఉదాహరణ పూర్తి చేసిన తర్వాత మీరు:
- ఇన్ఫ్రాస్ట్రక్చర్-అస్-కోడ్ ఉపయోగించి మెయిన్-టియర్ అప్లికేషన్ (వెబ్ యాప్ + డేటాబేస్) ను డిప్లాయ్ చేయడం
- రహస్యాలను హార్డ్‌కోడ్ చేయకుండా సురక్షిత డేటాబేస్ కనెక్షన్లను కాన్ఫిగర్ చేయడం
- Application Insights తో అప్లికేషన్ ఆరోగ్యాన్ని మానిటర్ చేయడం
- AZD CLI తో Azure వనరులను సమర్థవంతంగా నిర్వహించడం
- భద్రత, ఖర్చు ఆప్టిమైజేషన్, మరియు ఆబ్జర్వబిలిటీకి సంబంధించిన Azure ఉత్తమ పద్ధతులను అనుసరించడం

## సందర్భ సారాంశం
- **వెబ్ యాప్**: డేటాబేస్ కనెక్టివిటీతో Python Flask REST API
- **డేటాబేస్**: నమూనా డేటాతో Azure SQL డేటాబేస్
- **ఇన్ఫ్రాస్ట్రక్చర్**: Bicep ఉపయోగించి ప్రొవిజన్ చేయబడిన (మాడ్యులర్, పునర్వినియోగపరచదగిన టెంప్లేట్లు)
- **డిప్లాయ్‌మెంట్**: `azd` కమాండ్లతో పూర్తిగా ఆటోమేటెడ్
- **మానిటరింగ్**: లాగ్స్ మరియు టెలిమెట్రీ కోసం Application Insights

## ముందస్తు అవసరాలు

### అవసరమైన టూల్స్

ప్రారంభించడానికి ముందు, మీ దగ్గర ఈ టూల్స్ ఇన్స్టాల్ చేసినట్టు నిర్ధారించండి:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (సంస్కరణ 2.50.0 లేదా అంతకన్నా ఎక్కువ)
   ```sh
   az --version
   # ఆశించిన అవుట్పుట్: azure-cli 2.50.0 లేదా ఎక్కువ
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (సంస్కరణ 1.0.0 లేదా అంతకన్నా ఎక్కువ)
   ```sh
   azd version
   # నిరీక్షిత అవుట్‌పుట్: azd సంస్కరణ 1.0.0 లేదా అంతకంటే పై
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (లోకల్ డెవలప్మెంట్కు)
   ```sh
   python --version
   # ఆశించబడిన అవుట్పుట్: Python 3.8 లేదా అంతకన్నా ఉన్నతమైన సంస్కరణ
   ```

4. **[Docker](https://www.docker.com/get-started)** (ఐచ్ఛికం, లోకల్ కంటెయినరైజ్డ్ డెవలప్మెంట్కు)
   ```sh
   docker --version
   # అనుకున్న అవుట్పుట్: Docker వెర్షన్ 20.10 లేదా అంతకంటే ఎక్కువ
   ```

### Azure అవసరాలు

- ఒక సక్రియ **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- మీ సబ్‌స్క్రిప్షన్‌లో వనరులు సృష్టించగల అనుమతులు
- సబ్‌స్క్రిప్షన్ లేదా రిసోర్స్ గ్రూప్‌పై **Owner** లేదా **Contributor** పాత్ర

### అవసరమైన జ్ఞానం

ఇది **మధ్యస్థ-స్థాయి** ఉదాహరణ. మీరు ఈ విషయాల్లో పరిచయం కలిగి ఉండాలి:
- బేసిక్ కమాండ్-లైన్ ఆపరేషన్లు
- క్లౌడ్ ఆಧారిత మూల సూత్రాలు (వనరులు, రిసోర్స్ గ్రూపులు)
- వెబ్ అప్లికేషన్లు మరియు డేటాబేస్‌ల ప్రాథమిక అవగాహన

**AZDకి కొత్తవారా?** మొదట [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) చూసి ప్రారంభించండి.

## ఆర్కిటెక్చర్

ఈ ఉదాహరణ ఒక రెండు-టియర్ ఆర్కిటెక్చర్‌ను డిప్లాయ్ చేస్తుంది—వెబ్ అప్లికేషన్ మరియు SQL డేటాబేస్‌తో:

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

**వనరుల డిప్లాయ్‌మెంట్:**
- **Resource Group**: అన్ని వనరుల కోసం కంటైనర్
- **App Service Plan**: Linux-ఆధారిత హోస్టింగ్ (ఖర్చు దృష్ట్యా B1 టైర్)
- **Web App**: Flask అప్లికేషన్‌తో Python 3.11 రన్‌టైమ్
- **SQL Server**: TLS 1.2 కనీసంతో మేనేజ్ చేయబడ్డ డేటాబేస్ సర్వర్
- **SQL Database**: Basic టైర్ (2GB, అభివృద్ధి/పరీక్షలకు సరిపోయే)
- **Application Insights**: మానిటరింగ్ మరియు లోగింగ్
- **Log Analytics Workspace**: సెంట్రలైజ్డ్ లాగ్ నిల్వ

**ఉదాహరణ**: దీనిని ఒక రెస్టారెంట్ (వెబ్ యాప్) మరియు ఓ వాక్-ఇన్ ఫ్రీజర్ (డేటాబేస్) గా ఆలోచించండి. కస్టమర్లు మెనూకి ఆర్డర్ చేస్తారు (API ఎండ్పాయింట్లు), కిచెన్ (Flask యాప్) ఫ్రీజర్ నుండి పదార్థాలను (డేటా) తీసుకుంటుంది. రెస్టారెంట్ మేనేజర్ (Application Insights) అన్ని కార్యకలాపాలను ట్రాక్ చేస్తుంది.

## ఫోల్డర్ నిర్మాణం

ఈ ఉదాహరణలో అన్ని ఫైల్స్ చేర్చబడ్డాయి—బాహ్య ఆధారపడే అంశాలు అవసరం లేదు:

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

**ప్రతి ఫైలు ఏమి చేస్తుంది:**
- **azure.yaml**: AZDకు ఏమి మరియు ఎక్కడ డిప్లాయ్ చేయాలో చెప్తుంది
- **infra/main.bicep**: అన్ని Azure వనరులను ఆర్కెస్ట్రేట్ చేస్తుంది
- **infra/resources/*.bicep**: వ్యక్తిగత వనరుల నిర్వచనాలు (పునర్వినియోగానికి మాడ్యులర్)
- **src/web/app.py**: డేటాబేస్ లాజిక్‌తో Flask అప్లికేషన్
- **requirements.txt**: Python ప్యాకేజ్ డిపెండెన్సీలు
- **Dockerfile**: డిప్లాయ్‌మెంట్ కోసం కంటెయినరైజేషన్ సూచనలు

## త్వరితప్రారంభం (దశలవారీకి)

### దశ 1: క్లోన్ చేసి నావిగేట్ చేయండి

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ విజయ తనిఖీ**: మీకు `azure.yaml` మరియు `infra/` ఫోల్డర్ కనపడుతున్నదో తనిఖీ చేయండి:
```sh
ls
# ఆశించినది: README.md, azure.yaml, infra/, src/
```

### దశ 2: Azure తో ప్రామాణికరణ చేయండి

```sh
azd auth login
```

ఇది మీ బ్రౌజర్‌ను Azure ప్రామాణికరణ కోసం ఓపెన్ చేస్తుంది. మీ Azure క్రెడెన్షియల్స్ తో సైన్ ఇన్ చేయండి.

**✓ విజయ తనిఖీ**: మీరు ఈ దృశ్యాన్ని చూడాలి:
```
Logged in to Azure.
```

### దశ 3: ఎన్విరాన్‌మెంట్‌ను ఇనిషియలైజ్ చేయండి

```sh
azd init
```

**ఏం జరుగుతుంది**: AZD మీ డిప్లాయ్‌మెంట్ కోసం లోకల్ కాన్ఫిగరేషన్ రూపొందిస్తుంది.

**మీరు చూడబోయే ప్రాంప్ట్స్**:
- **Environment name**: చిన్న పేరు నమోదు చేయండి (ఉదాహరణకు, `dev`, `myapp`)
- **Azure subscription**: జాబితాలో నుండి మీ సబ్‌స్క్రిప్షన్ ఎంచుకోండి
- **Azure location**: ఓ ప్రాంతిని ఎంచుకోండి (ఉదా., `eastus`, `westeurope`)

**✓ విజయ తనిఖీ**: మీరు ఈ దృశ్యాన్ని చూడాలి:
```
SUCCESS: New project initialized!
```

### దశ 4: Azure వనరులను ప్రొవిజన్ చేయండి

```sh
azd provision
```

**ఏం జరుగుతుంది**: AZD అన్ని ఇన్ఫ్రాస్ట్రక్చర్‌ను డిప్లాయ్ చేస్తుంది (5-8 నిమిషాలు పట్టవచ్చు):
1. రిసోర్స్ గ్రూప్ సృష్టిస్తుంది
2. SQL Server మరియు డేటాబేస్ సృష్టిస్తుంది
3. App Service Plan సృష్టిస్తుంది
4. Web App సృష్టిస్తుంది
5. Application Insights సృష్టిస్తుంది
6. నెట్‌వర్కింగ్ మరియు భద్రతను కాన్ఫిగర్ చేస్తుంది

**మీరుంచి అడిగే అంశాలు**:
- **SQL admin username**: ఒక యూజర్ పేరు నమోదు చేయండి (ఉదా., `sqladmin`)
- **SQL admin password**: ఒక బలమైన పాస్‌వర్డ్ నమోదు చేయండి (దాన్ని సేవ్ చేయండి!)

**✓ విజయ తనిఖీ**: మీరు ఈ దృశ్యాన్ని చూడాలి:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ సమయం**: 5-8 నిమిషాలు

### దశ 5: అప్లికేషన్‌ను డిప్లాయ్ చేయండి

```sh
azd deploy
```

**ఏం జరుగుతుంది**: AZD మీ Flask అప్లికేషన్‌ను బిల్డ్ చేసి డిప్లాయ్ చేస్తుంది:
1. Python అప్లికేషన్‌ను ప్యాకేజ్ చేస్తుంది
2. Docker కంటెయినర్ బిల్డ్ చేస్తుంది
3. Azure Web App కు పుష్ చేస్తుంది
4. నమూనా డేటాతో డేటాబేస్‌ను ఇనిషియలైజ్ చేస్తుంది
5. అప్లికేషన్ మొదలెడుతుంది

**✓ విజయ తనిఖీ**: మీరు ఈ దృశ్యాన్ని చూడాలి:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ సమయం**: 3-5 నిమిషాలు

### దశ 6: అప్లికేషన్‌ను బ్రౌస్ చేయండి

```sh
azd browse
```

ఇది మీ డిప్లాయ్ చేసిన వెబ్ యాప్‌ను బ్రౌజర్‌లో `https://app-<unique-id>.azurewebsites.net` వద్ద తెరుస్తుంది

**✓ విజయ తనిఖీ**: మీరు JSON అవుట్‌పుట్‌ను చూడాలి:
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

### దశ 7: API ఎండ్పాయింట్లను పరీక్షించండి

**హెల్త్ చెక్** (డేటాబేస్ కనెక్షన్‌ను ధృవీకరించండి):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**అంచనా రేపాన్స్**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**ప్రాడక్ట్స్ జాబితా** (నమూనా డేటా):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**అంచనా రేపాన్స్**:
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

**ఒకే ప్రాడక్ట్ పొందుట**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ విజయ తనిఖీ**: అన్ని ఎండ్‌పాయింట్లు తప్పుల లేకుండా JSON డేటాను తిరిగి ఇవ్వాలి.

---

**🎉 అభినందనలు!** మీరు AZD ఉపయోగించి Azure కు ఒక డేటాబేస్‌తో కూడిన వెబ్ అప్లికేషన్‌ను విజయవంతంగా డిప్లాయ్ చేసారు.

## కాన్ఫిగరేషన్ లోతైన విశ్లేషణ

### పర్యావరణ వేరియబుల్స్

రహస్యాలు Azure App Service కాన్ఫిగరేషన్ ద్వారా సురక్షితంగా నిర్వహించబడతాయి—**కోల్డ్ కోడ్‌లో ఎప్పుడూ హార్డ్‌కోడ్ చేయకండి**.

**AZD ద్వారా ఆటోమేటిగ్గా కాన్ఫిగర్ చేయబడిందే**:
- `SQL_CONNECTION_STRING`: ఎన్క్రిప్టెడ్ క్రెడెన్షియల్స్‌తో డేటాబేస్ కనెక్షన్
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: మానిటరింగ్ టెలిమెట్రీ ఎండ్‌పాయింట్
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: ఆటోమేటిక్ డిపెండెన్సీ సంస్థాపనను ప్రారంభిస్తుంది

**రహస్యాలు ఎక్కడ నిల్వ చేయబడతాయి**:
1. `azd provision` సమయంలో మీరు SQL క్రెడెన్షియల్స్‌ను సురక్షిత ప్రాంప్ట్‌ల ద్వారా అందిస్తారు
2. AZD అవి మీ లోకల్ `.azure/<env-name>/.env` ఫైల్‌లో (git-ignored) స్టోర్ చేస్తుంది
3. AZD వాటిని Azure App Service కాన్ఫిగరేషన్‌లో ఇంజెక్ట్ చేస్తుంది (రెస్టులో ఎంక్రిప్టెడ్)
4. అప్లికేషన్ రన్‌టైమ్‌లో వాటిని `os.getenv()` ద్వారా చదువుతుంది

### లోకల్ డెవలప్‌మెంట్

లోకల్ పరీక్షల కోసం, స్యాంపుల్ నుండి `.env` ఫైల్‌ను రూపొందించండి:

```sh
cp .env.sample .env
# మీ స్థానిక డేటాబేస్ కనెక్షన్‌తో .env‌ను సవరించండి
```

**లోకల్ డెవలప్‌మెంట్ వర్క్‌ఫ్లో**:
```sh
# ఆవశ్యకమైన ఆధారాలను ఇన్‌స్టాల్ చేయండి
cd src/web
pip install -r requirements.txt

# పర్యావరణ చరాలను సెట్ చేయండి
export SQL_CONNECTION_STRING="your-local-connection-string"

# అప్లికేషన్‌ను চালించండి
python app.py
```

**లోకల్‌గా పరీక్షించండి**:
```sh
curl http://localhost:8000/health
# అంచుకోబడింది: {"స్థితి": "ఆరోగ్యవంతమైన", "డేటాబేస్": "జోడించబడింది"}
```

### ఇన్ఫ్రాస్ట్రక్చర్-అస్-కోడ్

అన్ని Azure వనరులు **Bicep టెంప్లేట్స్** (`infra/` ఫోల్డర్) లో నిర్వచించబడ్డాయి:

- **మాడ్యులర్ డిజైన్**: ప్రతీ వనరు రకానికి పునర్వినియోగపరచదగిన ఫైలు ఉంటుంది
- **పారామెటరైజ్ చేయదగినది**: SKUs, ప్రాంతాలు, నామకరణాను అనుకూలీకరించుకోండి
- **ఉత్తమ ప్రథమతలు**: Azure నామకరణ ప్రమాణాలు మరియు భద్రతా డిఫాల్ట్స్‌ను అనుసరిస్తుంది
- **వర్షన్ కంట్రోల్**: ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను Git లో ట్రాక్ చేయబడతాయి

**అనుకూలీకరణ ఉదాహరణ**:
డేటాబేస్ టైర్ మార్చడానికి, `infra/resources/sql-database.bicep` ను సవరించండి:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## భద్రతకు సంబంధించిన ఉత్తమ పద్ధతులు

ఈ ఉదాహరణ Azure భద్రత ఉత్తమ పద్ధతులను అనుసరిస్తుంది:

### 1. **సోర్స్ కోడ్‌లో రహస్యాలు ఉండకూడదు**
- ✅ క్రెడెన్షియల్స్ Azure App Service కాన్ఫిగరేషన్‌లో నిల్వ ఉంటాయి (ఎంక్రిప్టెడ్)
- ✅ `.env` ఫైళ్ళు `.gitignore` ద్వారా Git నుండి విడిచిపెట్టబడ్డాయి
- ✅ ప్రొవిజనింగ్ సమయంలో రహస్యాలు సురక్షిత పారామెటర్లుగా అందించబడుతాయి

### 2. **ఎన్‌క్రిప్టెడ్ కనెక్షన్లు**
- ✅ SQL Server కి కనీసం TLS 1.2
- ✅ Web App కోసం HTTPS మాత్రమే బలవంతం
- ✅ డేటాబేస్ కనెక్షన్లు ఎన్‌క్రిప్టెడ్ చానల్స్ ఉపయోగిస్తాయి

### 3. **నెట్‌వర్క్ భద్రత**
- ✅ Azure సర్వీసులను మాత్రమే అనుమతించేలా SQL Server ఫైర‌వాల్ కాన్ఫిగర్ చేయబడింది
- ✅ పబ్లిక్ నెట్‌వర్క్ యాక్సెస్ పరిమితం చేయబడింది (ప్రైవేట్ ఎండ్పాయింట్లతో ఇంకా కడుచుకోవచ్చు)
- ✅ Web App పై FTPS నిలిపివేయబడింది

### 4. **ప్రామాణీకరణ & అధికారం**
- ⚠️ **ప్రస్తుత స్థితి**: SQL authentication (username/password)
- ✅ **ఉత్పత్తికి సిఫారసు**: పాస్వర్డ్‌లేని ప్రామాణీకరణ కోసం Azure Managed Identity వినియోగించండి

**మ్యానేజ్‌డ్ ఐడెంటిటీకి అప్గ్రేడ్ చేయడానికి** (ఉత్పత్తికి):
1. Web App పై managed identity ఎనేబుల్ చేయండి
2. ఐడెంటిటీకి SQL అనుమతులు ఇవ్వండి
3. కనెక్షన్ స్ట్రింగ్‌ను managed identity ఉపయోగించేలా అప్డేట్ చేయండి
4. పాస్‌వర్డ్ ఆధారిత ప్రామాణీకరణని తీసివేయండి

### 5. **ఆడిట్ & కంప్లయెన్స్**
- ✅ Application Insights అన్ని రిక్వెస్ట్లు మరియు ఎర్రర్స్ లాగ్ చేస్తుంది
- ✅ SQL Database ఆడిటింగ్ ఎనేబుల్ చేయబడింది (కంప్లయెన్స్ కోసం కాన్ఫిగర్ చెయ్యవచ్చు)
- ✅ పాలన కోసం అన్ని వనరులకు ట్యాగ్లు కలవు

**ఉత్పత్తికి ముందు భద్రతా చెక్‌లిస్ట్**:
- [ ] SQL కోసం Azure Defender ఎనేబుల్ చేయండి
- [ ] SQL Database కోసం Private Endpoints కాన్ఫిగర్ చేయండి
- [ ] Web Application Firewall (WAF) ఎనేబుల్ చేయండి
- [ ] రహస్య రొటేషన్ కోసం Azure Key Vault అమలు చేయండి
- [ ] Azure AD authentication ని కాన్ఫిగర్ చేయండి
- [ ] అన్ని వనరులకు డయాగ్నోస్టిక్ లాగింగ్ ఎనేబుల్ చేయండి

## ఖర్చు ఆప్టిమైజేషన్

**అంచనా మాసిక ఖర్చులు** (నవంబర్ 2025 నాటికి):

| వనరు | SKU/టైర్ | అంచనా ఖర్చు |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **మొత్తం** | | **~$20/month** |

**💡 ఖర్చు ఆదా సూచనలు**:

1. **అభ్యాసం కోసం ఫ్రీ టైర్ ఉపయోగించండి**:
   - App Service: F1 టైర్ (ఫ్రీ, పరిమిత గంటలు)
   - SQL Database: Azure SQL Database serverless ఉపయోగించండి
   - Application Insights: 5GB/నెల ఉచిత ఇన్గ్సెషన్

2. **వినియోగంలో లేని సమయాల్లో వనరులను ఆపండి**:
   ```sh
   # వెబ్ యాప్‌ను నిలిపివేయండి (డేటాబేస్‌కు ఇంకా ఛార్జీలు వర్తిస్తాయి)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # అవసరమైతే తిరిగి ప్రారంభించండి
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **పరీక్ష తర్వాత అన్నింటినీ డిలీట్ చేయండి**:
   ```sh
   azd down
   ```
   ఇది అన్ని వనరులన్నిటినీ తీసివేస్తుంది మరియు ఛార్జీలను నిలిపేస్తుంది.

4. **డెవలప్‌మెంట్ vs. ఉత్పత్తి SKUs**:
   - **డెవలప్‌మెంట్**: ఈ ఉదాహరణలో ఉపయోగించిన Basic టైర్
   - **ఉత్పత్తి**: redundancyతో కూడిన Standard/Premium టైర్లు

**ఖర్చు మానిటరింగ్**:
- ఖర్చులను చూడటానికి [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) ను ఉపయోగించండి
- ఆశ్చర్యాలకు గురికావద్దం కోసం ఖర్చు అలర్ట్‌లను సెట్ చేయండి
- ట్రాకింగ్ కోసం అన్ని వనరులకు `azd-env-name` ట్యాగ్ ను జోడించండి

**ఫ్రీ టైర్ ప్రత్యామ్నాయం**:
అభ్యాసం ఉద్దేశ్యాల కోసం, మీరు `infra/resources/app-service-plan.bicep` ను మార్చవచ్చు:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Note**: ఫ్రీ టియర్‌కు పరిమితులు ఉన్నాయి (60 నిమిషాలు/రోజు CPU, ఎప్పుడూ-ఆన్ ఉండదు).

## మానిటరింగ్ & ఆబ్జర్వబిలిటీ

### Application Insights ఇంటిగ్రేషన్

ఈ ఉదాహరణ విస్తృత మానిటరింగ్ కోసం **Application Insights** ను చేర్చింది:

**ఏం మానిటర్ చేయబడుతుంది**:
- ✅ HTTP రిక్వెస్టులు (లేటెన్సీ, స్టేటస్ కోడ్స్, ఎండ్పాయింట్లు)
- ✅ అప్లికేషన్ తప్పులు మరియు ఎక్సెప్షన్లు
- ✅ Flask యాప్ నుండి కస్టమ్ లాగింగ్
- ✅ డేటాబేస్ కనెక్షన్ ఆరోగ్యం
- ✅ పనితన మెట్రిక్స్ (CPU, మెమరీ)

**Application Insights యాక్సెస్ చేయడానికి**:
1. [Azure Portal](https://portal.azure.com) తెరవండి
2. మీ రిసోర్స్ గ్రూప్ (`rg-<env-name>`) వద్దకి నావిగేట్ చేయండి
3. Application Insights రిసోర్స్ (`appi-<unique-id>`) పై క్లిక్ చేయండి

**ఉపయోగకరమైన క్వెరీస్** (Application Insights → Logs):

**అన్ని రిక్వెస్టులను చూడండి**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**లోపాలను కనుగొనండి**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**హెల్త్ ఎండ్పాయింట్‌ను చెక్ చేయండి**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database ఆడిటింగ్

**SQL Database ఆడిటింగ్ ఎనేబుల్ చేయబడి ఉంది** ట్రాక్ చేయడానికి:
- డేటాబేస్ యాక్సెస్ నమూనాలు
- ఫెయిలడ్ లాగిన్ ప్రయత్నాలు
- స్కీమా మార్పులు
- డేటా యాక్సెస్ (కంప్లయెన్స్ కోసం)

**ఆడిట్ లాగ్స్ యాక్సెస్ చేయండి**:
1. Azure Portal → SQL Database → Auditing
2. Log Analytics వర్క్‌స్పేస్‌లో లాగ్స్ చూడండి

### రియల్-టైమ్ మానిటరింగ్

**లైవ్ మెట్రిక్స్ చూడండి**:
1. Application Insights → Live Metrics
2. రియల్-టైంలో రిక్వెస్టులు, ఫెయిల్యర్లు మరియు పనితనాన్ని చూడండి

**ఆలర్ట్స్ సెటప్ చేయండి**:
క్రిటికల్ ఈవెంట్స్ కోసం ఆలర్ట్‌లు సృష్టించండి:
- HTTP 500 errors > 5 in 5 minutes
- డేటాబేస్ కనెక్షన్ ఫెయిల్యర్లు
- ప్రతిస్పందన సమయాలు ఎక్కువగా (>2 సెకన్లు)

**ఉదాహరణ అలర్ట్ సృష్టి**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## సమస్య పరిష్కారం

### సాధారణ సమస్యలు మరియు పరిష్కారాలు

#### 1. `azd provision` "Location not available" అనే లోపంతో విఫలమవుతుంది

**లక్షణం**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**పరిష్కారం**:
విభిన్న Azure ప్రాంతాన్ని ఎంచుకోండి లేదా రిసోర్స్ ప్రొవైడర్‌ను నమోదు చేయండి:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. పంపిణీ సమయంలో SQL కనెక్షన్ విఫలమవుతుంది

**లక్షణం**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**పరిష్కారం**:
- SQL Server ఫైర్వాల్ Azure సేవలకు అనుమతిస్తున్నద‌ని నిర్ధారించండి (ఆటోమేటిక్‌గా కాన్ఫిగర్ చేయబడుతుంది)
- `azd provision` సమయంలో SQL అడ్మిన్ పాస్వర్డ్ సరిగా నమోదు చేయబడిందో తనిఖీ చేయండి
- SQL Server పూర్తి స్థాయిలో provision అయ్యిందని నిర్ధారించండి (ఇది 2-3 నిమిషాలు పడొచ్చు)

**కనెక్షన్‌ని నిర్ధారించండి**:
```sh
# Azure పోర్టల్ నుంచి SQL డేటాబేస్ → క్వెరీ ఎడిటర్ కు వెళ్లండి
# మీ క్రెడెన్షియల్స్ ఉపయోగించి కనెక్ట్ చేయడానికి ప్రయత్నించండి
```

#### 3. వెబ్ యాప్ "Application Error" చూపిస్తుంది

**లక్షణం**:
బ్రౌజర్ సాధారణ లోపం పేజీని చూపిస్తుంది.

**పరిష్కారం**:
అప్లికేషన్ లాగ్‌లను తనిఖీ చేయండి:
```sh
# ఇటీవలి లాగ్‌లను చూడండి
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**సాధారణ కారణాలు**:
- ఎన్విరాన్మెంట్ వేరియబుల్స్ లేకపోవడం (App Service → Configuration ను తనిఖీ చేయండి)
- Python ప్యాకేజ్ ఇన్‌స్టాలేషన్ విఫలమైంది (డిప్లాయ్‌మెంట్ లాగ్‌లను తనిఖీ చేయండి)
- డేటాబేస్ ప్రారంభీకరణ లోపం (SQL కనెక్టివిటీని తనిఖీ చేయండి)

#### 4. `azd deploy` "Build Error" తో విఫలమవుతుంది

**లక్షణం**:
```
Error: Failed to build project
```

**పరిష్కారం**:
- `requirements.txt` లో ఎలాంటి సింటాక్స్ లోపాలు లేవో నిర్ధారించండి
- `infra/resources/web-app.bicep` లో Python 3.11 పేర్కొనబడిందో తనిఖీ చేయండి
- Dockerfile లో సరైన base image ఉందని నిర్ధారించండి

**లోకల్‌గా డీబగ్ చేయండి**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD కమాండ్స్ నడిపినప్పుడు "Unauthorized"

**లక్షణం**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**పరిష్కారం**:
Azure తో మళ్లీ ప్రామాణీకరించండి:
```sh
azd auth login
az login
```

మీకు సబ్స్క్రిప్షన్‌పై సరైన అనుమతులు ఉన్నాయో (Contributor పాత్ర) నిర్ధారించండి.

#### 6. డేటాబేస్ ఖర్చులు ఎక్కువగా ఉన్నవి

**లక్షణం**:
అనూహ్యమైన Azure బిల్లు.

**పరిష్కారం**:
- పరీక్షించిన తర్వాత `azd down` నడిపించటం మర్చిపోయారా అని తనిఖీ చేయండి
- SQL Database Basic tier ను ఉపయోగిస్తున్నదిగా నిర్ధారించండి (Premium కాదు)
- Azure Cost Management లో ఖర్చులను సమీక్షించండి
- ఖర్చు అలర్ట్స్‌ను ఏర్పాటు చేయండి

### సహాయం

**అన్ని AZD ఎన్విరాన్మెంట్ వేరియబుల్స్‌ని చూడండి**:
```sh
azd env get-values
```

**డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**అప్లికేషన్ లాగ్‌లను యాక్సెస్ చేయండి**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**ఇంకా సహాయం కావాలా?**
- [AZD సమస్య పరిష్కార మార్గదర్శి](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service సమస్య పరిష్కార మార్గదర్శనం](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL సమస్య పరిష్కార మార్గదర్శనం](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## ప్రాయోగిక అభ్యాసాలు

### వ్యాయామం 1: మీ డిప్లాయ్‌మెంట్‌ని నిర్ధారించండి (ప్రారంభస్థాయి)

**లక్ష్యం**: అన్ని రిసోర్సులు డిప్లాయ్ అయ్యాయని మరియు అప్లికేషన్ పనిచేస్తున్నదని నిర్ధారించండి.

**దశలు**:
1. మీ రిసోర్స్ గ్రూప్‌లో అన్ని రిసోర్సులను జాబితా చేయండి:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **అంచనా**: 6-7 రిసోర్సులు (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. అన్ని API ఎండ్‌పాయింట్‌లను పరీక్షించండి:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **అంచనా**: అన్ని తప్పులేమీ లేకుండా చెల్లుబాటు అయ్యే JSON ను తిరిగి ఇవ్వాలి

3. Application Insights ని తనిఖీ చేయండి:
   - Azure పోర్టల్‌లో Application Insights కు నావిగేట్ చేయండి
   - "Live Metrics" కి వెళ్ళండి
   - వెబ్ అప్లికేషన్‌పై మీ బ్రౌజర్‌ను రిఫ్రెష్ చేయండి
   **అంచనా**: రియల్-టైమ్‌లో బిరుదులుగా రిక్వెస్ట్‌లు కనిపిస్తున్నాయని చూడండి

**విజయానికి ప్రమాణాలు**: అన్ని 6-7 రిసోర్సులు ఉన్నాయి, అన్ని ఎండ్‌పాయింట్లు డేటా తిరిగి ఇస్తున్నాయి, Live Metrics కార్యకలాపం చూపిస్తుంది.

---

### వ్యాయామం 2: కొత్త API ఎండ్‌పాయింట్ జోడించండి (మధ్యస్థ)

**లక్ష్యం**: కొత్త ఎండ్‌పాయింట్‌తో Flask అప్లికేషన్‌ను విస్తరించండి.

**స్టార్టర్ కోడ్**: ప్రస్తుత ఎండ్‌పాయింట్‌లు `src/web/app.py`లో ఉన్నాయి

**దశలు**:
1. `src/web/app.py` ఎడిట్ చేసి `get_product()` ఫంక్షన్ తరువాత కొత్త ఎండ్‌పాయింట్ జోడించండి:
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

2. నవీకరించబడిన అప్లికేషన్‌ను డిప్లాయ్ చేయండి:
   ```sh
   azd deploy
   ```

3. కొత్త ఎండ్‌పాయింట్‌ను పరీక్షించండి:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **అంచనా**: "laptop" కు సరిపోయే ఉత్పత్తులను తిరిగి ఇస్తుంది

**విజయానికి ప్రమాణాలు**: కొత్త ఎండ్‌పాయింట్ పనిచేస్తుంది, ఫిల్టర్ చేయబడిన ఫలితాలను తిరిగి ఇచ్చింది, Application Insights లాగ్‌లలో కనిపిస్తుంది.

---

### వ్యాయామం 3: మానిటరింగ్ మరియు అలర్ట్స్ జోడించండి (అధిక స్థాయి)

**లక్ష్యం**: అలర్ట్‌లతో ప్రక్రియాత్మక మానిటరింగ్ సెట్ చేయండి.

**దశలు**:
1. HTTP 500 లోపాలకు ఒక అలర్ట్ సృష్టించండి:
   ```sh
   # Application Insights వనరు ID పొందండి
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # అలర్ట్ సృష్టించండి
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. లోపాలు కలిగించి అలర్ట్‌కు ట్రిగర్ చేయండి:
   ```sh
   # ఉనికిలో లేని ఉత్పత్తిని అభ్యర్థించండి
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. అలర్ట్ పడ్డదా చూసుకోండి:
   - Azure పోర్టల్ → Alerts → Alert Rules
   - మీ ఇమెయిల్‌ను తనిఖీ చేయండి (కాన్ఫిగర్ చేసినట్లయితే)

**విజయానికి ప్రమాణాలు**: అలర్ట్ రూల్ సృష్టించబడింది, లోపాలపై ట్రిగర్ అవుతుంది, నోటిఫికేషన్లు అందాయి.

### వ్యాయామం 4: డేటాబేస్ స్కీమా మార్పులు (అధిక స్థాయి)

**లక్ష్యం**: కొత్త టేబుల్ జోడించి అప్లికేషన్‌ను దీన్ని ఉపయోగించ도록 సవరించండి.

**దశలు**:
1. Azure పోర్టల్ Query Editor ద్వారా SQL Databaseకు కనెక్ట్ అవ్వండి

2. కొత్త `categories` టేబుల్ సృష్టించండి:
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

3. స్పందనలలో category సమాచారం చేర్చేందుకు `src/web/app.py` ను అప్‌డేట్ చేయండి

4. డిప్లాయ్ చేసి పరీక్షించండి

**విజయానికి ప్రమాణాలు**: కొత్త టేబుల్ ఉనికిలో ఉంది, ఉత్పత్తులు category సమాచారాన్ని చూపిస్తున్నాయి, అప్లికేషన్ ఇంకా పనిచేస్తుంది.

### వ్యాయామం 5: క్యాచింగ్ అమలు చేయండి (నిపుణుడు)

**లక్ష్యం**: పనితీరును మెరుగుపరచడానికి Azure Redis Cache జోడించండి.

**దశలు**:
1. `infra/main.bicep` లో Redis Cache జోడించండి
2. ఉత్పత్తి ప్రశ్నలను క్యాచ్ చేయడానికి `src/web/app.py` నవీకరించండి
3. Application Insights తో పనితీరు మెరుగుదలను కొలవండి
4. క్యాచింగ్ ముందు/తరువాత ప్రతిస్పందన సమయాలను పోల్చండి

**విజయానికి ప్రమాణాలు**: Redis డిప్లాయ్ అయింది, క్యాచింగ్ పని చేస్తుంది, ప్రతిస్పందన సమయాలు >50% ద్వారా మెరుగుదల చూపిస్తున్నాయి.

**సూచన**: Start with [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## శుభ్రపరచడం

కొనసాగే ఛార్జీలను నివారించడానికి, పనులు పూర్తయిన తర్వాత అన్ని రిసోర్సులను తొలగించండి:

```sh
azd down
```

**ధృవీకరణ ప్రాంప్ట్**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

`y` టైప్ చేసి ధృవీకరించండి.

**✓ విజయం తనిఖీ**: 
- Azure పోర్టల్ నుండి అన్ని రిసోర్సులు తొలగించబడ్డాయి
- ఎటువంటి కొనసాగుతున్న ఛార్జీలు లేవు
- లోకల్ `.azure/<env-name>` ఫోల్డర్ తొలగించవచ్చు

**వికల్పం** (ఇన్‌ఫ్రాస్ట్రక్చర్‌ను ఉంచి, డేటా తొలగించండి):
```sh
# కేవలం వనరుల గ్రూప్‌ను తొలగించండి (AZD కాన్ఫిగరేషన్‌ను ఉంచండి)
az group delete --name rg-<env-name> --yes
```
## మరింత తెలుసుకోండి

### సంబంధిత డాక్యుమెంటేషన్
- [Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/app-service/)
- [Application Insights డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep భాషా సూచిక](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### ఈ కోర్సులో తదుపరి దశలు
- **[కంటైనర్ యాప్స్ ఉదాహరణ](../../../../examples/container-app)**: Azure Container Apps తో మైక్రోసర్వీసులను డిప్లాయ్ చేయండి
- **[AI ఇంటిగ్రేషన్ గైడ్](../../../../docs/ai-foundry)**: మీ యాప్‌కు AI సామర్ధ్యాలను జోడించండి
- **[డిప్లాయ్‌మెంట్ బెస్ట్ ప్రాక్టీసెస్](../../docs/chapter-04-infrastructure/deployment-guide.md)**: ప్రొడక్షన్ డిప్లాయ్‌మెంట్ నమూనాలు

### అధునాతన అంశాలు
- **Managed Identity**: పాస్వర్డ్లను తీసివేసి Azure AD ప్రమాణీకరణను ఉపయోగించండి
- **Private Endpoints**: వర్చువల్ నెట్‌వర్క్‌లో డేటాబేస్ కనెక్షన్లను సురక్షితం చేయండి
- **CI/CD Integration**: GitHub Actions లేదా Azure DevOps తో డిప్లాయ్‌మెంట్స్‌ను ఆటోమేటు చేయండి
- **Multi-Environment**: dev, staging, మరియు production వాతావరణాలను సెట్ చేయండి
- **Database Migrations**: స్కీమా వెర్షనింగ్ కోసం Alembic లేదా Entity Framework ఉపయోగించండి

### ఇతర దారులతో పోలిక

**AZD vs. ARM Templates**:
- ✅ AZD: అధిక స్థాయి సారాంశం, సులభమైన కమాండ్లు
- ⚠️ ARM: మరింత విశదీకరణ, సూక్ష్మ నియంత్రణ

**AZD vs. Terraform**:
- ✅ AZD: Azure-సహజం, Azure సేవలతో సమగ్రం
- ⚠️ Terraform: బహు-క్లౌడ్ మద్దతు, పెద్ద ఎకోసిస్టమ్

**AZD vs. Azure Portal**:
- ✅ AZD: పునరావృతం చేయదగినది, వెర్షన్-నియంత్రితమైనది, ఆటోమేటబుల్
- ⚠️ Portal: మాన్యువల్ క్లిక్లు, పునరుత్పత్తి చేయడం కష్టమే

**AZD ని ఇలా ఆలోచించండి**: Azure కోసం Docker Compose — సంక్లిష్ట డిప్లాయ్‌మెంట్లకు సరళీకృత కాన్ఫిగరేషన్.

---

## తరచుగా అడిగే ప్రశ్నలు

**Q: నేను వేరే ప్రోగ్రామింగ్ భాషను ఉపయోగించగలన嗎?**  
A: అవును! `src/web/` ను Node.js, C#, Go లేదా ఏదైనా భాషతో మార్చండి. `azure.yaml` మరియు Bicep ని తగిన విధంగా నవీకరించండి.

**Q: నేను మరిన్ని డేటాబేస్‌లను ఎలా జోడించవచ్చు?**  
A: `infra/main.bicep` లో మరో SQL Database మాడ్యూల్ జోడించండి లేదా Azure Database సేవల నుండి PostgreSQL/MySQL ఉపయోగించండి.

**Q: నేను దీన్ని ప్రొడక్షన్ కోసం ఉపయోగించగలనా?**  
A: ఇది ప్రారంభబిందువు. ప్రొడక్షన్ కోసం: managed identity, private endpoints, redundancy, బ్యాకప్ వ్యూహం, WAF, మరియు మెరుగైన మానిటరింగ్ జోడించండి.

**Q: కోడ్ డిప్లాయ్‌మెంట్‌కి బదులుగా కంటైనర్లను ఉపయోగించాలని అనుకుంటే ఏం చేయాలి?**  
A: మొత్తం కంటైనర్‌లను ఉపయోగించే [కంటైనర్ యాప్స్ ఉదాహరణ](../../../../examples/container-app) చూడండి.

**Q: నా లోకల్ యంత్రం నుండి డేటాబేస్‌కు ఎలా కనెక్ట్ అవ్వాలి?**  
A: SQL Server ఫైర్వాల్‌కు మీ IPని జోడించండి:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: కొత్త డేటాబేస్ సృష్టించడం బదులుగా ఇప్పటికే ఉన్న డేటాబేస్‌ను ఉపయోగించవచ్చా?**  
A: అవును, `infra/main.bicep` ను ఉన్న SQL Server ను రిఫరెన్స్ చేసేలా మార్చండి మరియు కనెక్షన్ స్ట్రింగ్ పరామితుల్ని అప్డేట్ చేయండి.

---

> **సూచన:** ఈ ఉదాహరణ AZD ఉపయోగించి డేటాబేస్‌తో వెబ్ యాప్‌ను డిప్లాయ్ చేయడానికి ఉత్తమ అభ్యాసాలను చూపిస్తుంది. ఇది పని చేసే కోడ్, సమగ్ర డాక్యుమెంటేషన్, మరియు అభ్యాసాలను కలిగి ఉంది. ప్రొడక్షన్ డిప్లాయ్‌మెంట్‌ల కోసం, మీ సంస్థకు నిర్దిష్టమైన భద్రత, స్కేలింగ్, కంప్లయన్సు, మరియు ఖర్చు అవసరాలను సమీక్షించండి.

**📚 కోర్సు నావిగేషన్:**
- ← ముందు: [కంటైనర్ యాప్స్ ఉదాహరణ](../../../../examples/container-app)
- → తదుపరి: [AI ఇంటిగ్రేషన్ గైడ్](../../../../docs/ai-foundry)
- 🏠 [కోర్సు హోమ్](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నివారణ:
ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ [Co-op Translator] (https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితతకు ప్రయత్నిస్తూనే ఉన్నా, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా లోపాలు ఉండొచ్చు. మూలభాషలో ఉన్న అసలైన డాక్యుమెంట్‌ను అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారం కోసం వృత్తిపరమైన మానవ అనువాదాన్ని సిఫార్సు చేయబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడంవలన జరిగిన ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలపై మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->