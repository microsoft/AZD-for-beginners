# AZD మౌళికాలు - Azure Developer CLI యొక్క అవగాహన

# AZD మౌళికాలు - ప్రాధమిక సిద్ధాంతాలు మరియు మూలసూత్రాలు

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభకులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయము**: అధ్యాయం 1 - పునాది & త్వరిత ప్రారంభం
- **⬅️ మునుపటి**: [కోర్సు అవలోకనం](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ తరువాత**: [ఇన్‌స్టాలేషన్ & సెటప్](installation.md)
- **🚀 తదుపరి అధ్యాయము**: [అధ్యాయం 2: AI-ఆధారిత అభివృద్ధి](../chapter-02-ai-development/microsoft-foundry-integration.md)

## పరిచయం

ఈ పాఠం మీకు Azure Developer CLI (azd) ని పరిచయం చేస్తుంది — ఇది స్థానిక అభివృద్ధి నుండి Azure డిప్లాయ్‌మెంట్ వరకూ మీ ప్రయాణాన్ని వేగవంతం చేసే శక్తివంతమైన కమాండ్-లైన్ టూల్. మీరు ప్రాథమిక భావనలు, ప్రధాన ఫీచర్లు నేర్చుకొని azd క్లౌడ్-నేటివ్ అప్లికేషన్ డిప్లాయ్‌మెంట్‌ను ఎలా సరళీకరించిందో అర్థం చేసుకుంటారు.

## అభ్యసన లక్ష్యాలు

ఈ పాఠం ముగిసే దాకా, మీరు:
- Azure Developer CLI అంటే 무엇 మరియు దాని ప్రాథమిక ఉద్దేశ్యాన్ని అర్థం చేసుకుంటారు
- టెంప్లేట్స్, ఎన్విరాన్‌మెంట్స్, మరియు సేవల ప్రాధమిక భావనలను నేర్చుకుంటారు
- టెంప్లేట్-డ్రై్వెన్ డెవలప్‌మెంట్ మరియు Infrastructure as Code వంటి కీలక ఫీచర్లను అన్వేషిస్తారు
- azd ప్రాజెక్ట్ నిర్మాణం మరియు సఫల్యమైన వర్క్‌ఫ్లోని అర్థం చేసుకుంటారు
- మీ అభివృద్ధి వాతావరణానికి azd ను ఇన్స్టాల్ చేసి కాన్ఫిగర్ చేయడానికి సిద్ధంగా ఉంటారు

## అభ్యసన ఫలితాలు

ఈ పాఠం పూర్తి చేసిన తర్వాత, మీరు చేయగలుగుతారు:
- ఆధునిక క్లౌడ్ డెవలప్‌మెంట్ వర్క్‌ఫ్లోలలో azd పాత్రను వివరించండి
- azd ప్రాజెక్ట్ నిర్మాణంలోని భాగాలను గుర్తించండి
- టెంప్లేట్స్, ఎన్విరాన్‌మెంట్స్, మరియు సేవలు ఎలా కలిసి పనిచేస్తాయో వివరించండి
- azd తో Infrastructure as Code యొక్క లాభాలను అర్థం చేసుకోండి
- వివిధ azd కమాండ్లను మరియు వాటి ప్రయోజనాలను గుర్తించండి

## Azure Developer CLI (azd) అంటే ఏమిటీ?

Azure Developer CLI (azd) అనేది స్థానిక అభివృద్ధి నుండి Azure డిప్లాయ్‌మెంట్ వరకు మీ ప్రయాణాన్ని వేగవంతం చేయడానికి రూపొంది ఒక కమాండ్-లైన్ టూల్. ఇది Azure పై క్లౌడ్-నేటివ్ అప్లికేషన్లు నిర్మించడం, డిప్లాయ్ చేయడం మరియు నిర్వహించడం ప్రక్రియను సరళీకృతం చేస్తుంది.

### 🎯 AZD ఎందుకు ఉపయోగించాలి? ఒక వాస్తవ-ప్రపంచ సరిపోలిక

డేటాబేస్ కలిగిన ఒక సరళ వెబ్ యాప్‌ను డిప్లాయ్ చేయడాన్ని పోల్చుదాం:

#### ❌ AZD లేకుండా: మాన్యువల్ Azure డిప్లాయ్ (30+ నిమిషాలు)

```bash
# దశ 1: రీసోర్స్ గ్రూప్ సృష్టించండి
az group create --name myapp-rg --location eastus

# దశ 2: యాప్ సర్వీస్ ప్లాన్ సృష్టించండి
az appservice plan create --name myapp-plan \
  --resource-group myapp-rg \
  --sku B1 --is-linux

# దశ 3: వెబ్ యాప్ సృష్టించండి
az webapp create --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --plan myapp-plan \
  --runtime "NODE:18-lts"

# దశ 4: Cosmos DB ఖాతా సృష్టించండి (10-15 నిమిషాలు)
az cosmosdb create --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --kind MongoDB

# దశ 5: డేటాబేస్ సృష్టించండి
az cosmosdb mongodb database create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --name tododb

# దశ 6: కలెక్షన్ సృష్టించండి
az cosmosdb mongodb collection create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --database-name tododb \
  --name todos

# దశ 7: కనెక్షన్ స్ట్రింగ్ పొందండి
CONN_STR=$(az cosmosdb keys list \
  --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --type connection-strings \
  --query "connectionStrings[0].connectionString" -o tsv)

# దశ 8: యాప్ సెట్టింగ్స్ కాన్ఫిగర్ చేయండి
az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings MONGODB_URI="$CONN_STR"

# దశ 9: లాగింగ్‌ను సక్రియం చేయండి
az webapp log config --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --application-logging filesystem \
  --detailed-error-messages true

# దశ 10: Application Insights ను ఏర్పాటు చేయండి
az monitor app-insights component create \
  --app myapp-insights \
  --location eastus \
  --resource-group myapp-rg

# దశ 11: App Insights ను వెబ్ యాప్‌కు లింక్ చేయండి
INSTRUMENTATION_KEY=$(az monitor app-insights component show \
  --app myapp-insights \
  --resource-group myapp-rg \
  --query "instrumentationKey" -o tsv)

az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings APPINSIGHTS_INSTRUMENTATIONKEY="$INSTRUMENTATION_KEY"

# దశ 12: అప్లికేషన్‌ను లోకల్‌గా బిల్డ్ చేయండి
npm install
npm run build

# దశ 13: డిప్లాయ్‌మెంట్ ప్యాకేజీ సృష్టించండి
zip -r app.zip . -x "*.git*" "node_modules/*"

# దశ 14: అప్లికేషన్‌ను డిప्लాయ్ చేయండి
az webapp deployment source config-zip \
  --resource-group myapp-rg \
  --name myapp-web-unique123 \
  --src app.zip

# దశ 15: వేచి ఉండండి మరియు అది పని చేస్తుందని ప్రార్థించండి 🙏
# (స్వయంచాలిత ధృవీకరణ లేదు, మాన్యువల్ పరీక్ష అవసరం)
```

**సమస్యలు:**
- ❌ గుర్తుంచుకోడానికి మరియు క్రమబద్ధంగా అమలు చేయడానికి 15+ కమాండ్లు
- ❌ 30-45 నిమిషాల మాన్యువల్ పని
- ❌ తప్పిదాలు చేయడం సులభం (టైపోస్, తప్పు పారామీటర్లు)
- ❌ కనెక్షన్ స్ట్రింగ్స్ టెర్మినల్ హిస్టరీలో కనిపించవచ్చు
- ❌ ఏదైనా విజయవంతం కాకపోతే ఆటోమేటెడ్ రోల్బ్యాక్ లేదు
- ❌ టీమ్ సభ్యులకు పునరుత్పత్తి చేయడం కష్టం
- ❌ ప్రతి సారి వివిధంగా ఉంటుంది (పునరుత్పాదకమవదు)

#### ✅ AZD తో: ఆటోమేటెడ్ డిప్లాయ్‌మెంట్ (5 కమాండ్లు, 10-15 నిమిషాలు)

```bash
# దశ 1: టెంప్లేట్ నుండి ప్రారంభించండి
azd init --template todo-nodejs-mongo

# దశ 2: ప్రామాణీకరించండి
azd auth login

# దశ 3: పరిసరాన్ని సృష్టించండి
azd env new dev

# దశ 4: మార్పులను ముందుగా చూడండి (ఐచ్ఛికం కాని సిఫార్సు చేయబడింది)
azd provision --preview

# దశ 5: అన్నింటినీ డిప్లాయ్ చేయండి
azd up

# ✨ పూర్తయింది! ప్రతిదీ డిప్లాయ్ చేయబడింది, కాన్ఫిగర్ చేయబడింది, మరియు పర్యవేక్షించబడుతోంది
```

**లాభాలు:**
- ✅ **5 కమాండ్లు** వర్సెస్ 15+ మాన్యువల్ స్టెప్స్
- ✅ **10-15 నిమిషాలు** మొత్తం సమయం (ముఖ్యంగా Azure కోసం వేచివుండటం)
- ✅ **శూన్య తప్పులు** - ఆటోమెటెడ్ మరియు పరీక్షించబడిన ప్రక్రియ
- ✅ **రహస్యాలు సురక్షితంగా నిర్వహించబడతాయి** via Key Vault
- ✅ **దోషాలపై ఆటోమేటిక్ రోల్బ్యాక్**
- ✅ **పూర్తిగా పునరుత్పాదకంగా** - ప్రతి సారి అదే ఫలితం
- ✅ **టీమ్-సిద్ధం** - ఎవరికైనా అదే కమాండ్లతో డిప్లాయ్ చేయవచ్చు
- ✅ **Infrastructure as Code** - వెర్షన్-కంట్రోల్ లో Bicep టెంప్లేట్లు
- ✅ **ఇన్‌బిల్ట్ మానిటరింగ్** - Application Insights ఆటోమాటిగ్గా కాన్ఫిగర్ చేస్తుంది

### 📊 సమయం & లోపాల తగ్గింపు

| మెట్రిక్ | మాన్యువల్ డిప్లాయ్‌మెంట్ | AZD డిప్లాయ్‌మెంట్ | మెరుగుదల |
|:-------|:------------------|:---------------|:------------|
| **కమాండ్లు** | 15+ | 5 | 67% తక్కువ |
| **సమయం** | 30-45 నిమిషాలు | 10-15 నిమిషాలు | 60% వేగవంతం |
| **లోపాల రేటు** | ~40% | <5% | 88% తగ్గింపు |
| **స్థిరత్వం** | తక్కువ (మాన్యువల్) | 100% (ఆటోమెటెడ్) | పూర్తి |
| **టీమ్ ఆన్‌బోర్డింగ్** | 2-4 గంటలు | 30 నిమిషాలు | 75% వేగవంతం |
| **రోల్బ్యాక్ సమయం** | 30+ నిమిషాలు (మాన్యువల్) | 2 నిమిషాలు (ఆటోమెటెడ్) | 93% వేగవంతం |

## ప్రధాన భావనలు

### టెంప్లేట్లు
టెంప్లేట్లు azd యొక్క పునాదిగా ఉంటాయి. వాటిలో ఉంటాయి:
- **అప్లికేషన్ కోడ్** - మీ సోర్స్ కోడ్ మరియు డిపెండెన్సీలు
- **ఇన్‌ఫ్రాస్ట్రక్చర్ నిర్వచనాలు** - Bicep లేదా Terraform లో నిర్వచించిన Azure వనరులు
- **కాన్ఫిగర్ ఫైళ్లు** - సెట్టింగ్లు మరియు ఎన్విరాన్‌మెంట్ వేరియబుల్స్
- **డిప్లాయ్‌మెంట్ స్క్రిప్ట్స్** - ఆటోమెటెడ్ డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలు

### ఎన్విరాన్‌మెంట్లు
ఎన్విరాన్‌మెంట్లు వేర్వేరు డిప్లాయ్‌మెంట్ లక్ష్యాలను ప్రతిబింబిస్తాయి:
- **Development** - టెస్టింగ్ మరియు అభివృద్ధికి
- **Staging** - ప్రీ-ప్రొడక్షన్ ఎన్విరాన్‌మెంట్
- **Production** - లైవ్ ప్రొడక్షన్ ఎన్విరాన్‌మెంట్

ప్రతి ఎన్విరాన్‌మెంట్ తన స్వంతాన్ని నిర్వహిస్తుంది:
- Azure రిసోర్స్ గ్రూప్
- కాన్ఫిగరేషన్ సెట్టింగ్లు
- డిప్లాయ్‌మెంట్ స్థితి

### సేవలు
సేవలు మీ అప్లికేషన్ నిర్మాణ భాగాలు:
- **Frontend** - వెబ్ అప్లికేషన్లు, SPAs
- **Backend** - APIs, మైక్రోసర్వీసెస్
- **Database** - డేటా నిల్వ పరిష్కారాలు
- **Storage** - ఫైల్ మరియు బ్లోబ్ స్టోరేజ్

## ముఖ్య ఫీచర్లు

### 1. టెంప్లేట్-ఆధారిత అభివృద్ధి
```bash
# అందుబాటులో ఉన్న టెంప్లేట్లను బ్రౌజ్ చేయండి
azd template list

# టెంప్లేట్ నుండి ప్రారంభించండి
azd init --template <template-name>
```

### 2. కోడ్ రూపంలో ఇన్‌ఫ్రాస్ట్రక్చర్
- **Bicep** - Azure యొక్క డొమైన్-స్పెసిఫిక్ భాష
- **Terraform** - మల్టీ-క్లౌడ్ ఇన్‌ఫ్రాస్ట్రక్చర్ టూల్
- **ARM Templates** - Azure Resource Manager టెంప్లేట్లు

### 3. ఇంటిగ్రేటెడ్ వర్క్‌ఫ్లోస్
```bash
# సంపూర్ణ డిప్లాయ్‌మెంట్ కార్యప్రవాహం
azd up            # Provision + Deploy: ఇది మొదటి సెట్‌అప్ కోసం చేయాల్సిన చర్యల అవసరం లేకుండా ఉంటుంది

# 🧪 NEW: డిప్లాయ్‌మెంట్‌కు ముందు ఇన్‌ఫ్రాస్ట్రక్చర్ మార్పులను ముందుగా పరిశీలించండి (సురక్షితంగా)
azd provision --preview    # మార్పులు చేయకుండా ఇన్‌ఫ్రాస్ట్రక్చర్ డిప్లాయ్‌మెంట్‌ను అనుకరించండి

azd provision     # ఇన్‌ఫ్రాస్ట్రక్చర్‌ను అప్డేట్ చేస్తే Azure వనరులను సృష్టించడానికి దీన్ని ఉపయోగించండి
azd deploy        # అప్లికేషన్ కోడ్‌ను డిప్లాయ్ చేయండి లేదా అప్డేట్ తర్వాత తిరిగి డిప్లాయ్ చేయండి
azd down          # వనరులను తొలగించండి
```

#### 🛡️ ప్రివ్యూ తో భద్రమైన ఇన్‌ఫ్రాస్ట్రక్చర్ ప్లానింగ్
The `azd provision --preview` command is a game-changer for safe deployments:
- **Dry-run విశ్లేషణ** - ఏమి సృష్టించబడబోతుంది, మార్చబడబోతుంది లేదా తొలగించబడబోతుంది చూపిస్తుంది
- **శూన్య ప్రమాదం** - మీ Azure ఎన్విరాన్‌మెంట్‌లో ఏ అసలు మార్పులు కూడా చేయబడవు
- **టీమ్ సహకారం** - డిప్లాయ్ చేయులేదు ముందు ప్రివ్యూ ఫలితాలను పంచుకోండి
- **ఖర్చు అంచనా** - నికరంగా వనరుల ఖర్చును ముందే అర్థం చేసుకోండి

```bash
# ఉదాహరణ ప్రివ్యూ పని ప్రవాహం
azd provision --preview           # ఏం మారుతుందో చూడండి
# ఫలితాన్ని సమీక్షించండి, బృందంతో చర్చించండి
azd provision                     # మార్పులను ఆత్మవిశ్వాసంతో వర్తింపజేయండి
```

### 📊 విజువల్: AZD అభివృద్ధి వర్క్‌ఫ్లో

```mermaid
graph LR
    A[azd init] -->|ప్రాజెక్ట్‌ను ప్రారంభించండి| B[azd auth login]
    B -->|ప్రామాణీకరించండి| C[azd env new]
    C -->|పర్యావరణాన్ని సృష్టించండి| D{మొదటి డిప్లాయ్‌మెంట్?}
    D -->|అవును| E[azd up]
    D -->|కాదు| F[azd provision --preview]
    F -->|మార్పులను సమీక్షించండి| G[azd provision]
    E -->|వనరులను ఏర్పాటు చేసి డిప్లాయ్ చేయుతుంది| H[వనరులు నడుస్తున్నాయి]
    G -->|ఇన్ఫ్రాస్ట్రక్చర్‌ను నవీకరిస్తుంది| H
    H -->|నిరీక్షించండి| I[azd monitor]
    I -->|కోడ్‌లో మార్పులు చేయండి| J[azd deploy]
    J -->|కేవలం కోడ్‌ను మళ్లీ డిప్లాయ్ చేయండి| H
    H -->|శుభ్రపరచండి| K[azd down]
    
    style A fill:#e1f5fe
    style E fill:#c8e6c9
    style F fill:#fff9c4
    style H fill:#c5e1a5
    style K fill:#ffcdd2
```
**వర్క్‌ఫ్లో వివరణ:**
1. **Init** - టెంప్లేట్ లేదా కొత్త ప్రాజెక్ట్ తో ప్రారంభించండి
2. **Auth** - Azure తో ప్రామాణీకరణ చేయండి
3. **Environment** - వేరుసరమైన డిప్లాయ్‌మెంట్ ఎన్విరాన్‌మెంట్ సృష్టించండి
4. **Preview** - 🆕 మొదట ఇన్‌ఫ్రాస్ట్రక్చర్ మార్పులను ఎల్లప్పుడూ పరిశీలించండి (భద్రతా ప్రాక్టీస్)
5. **Provision** - Azure వనరులను సృష్టించండి/అప్‌డేట్ చేయండి
6. **Deploy** - మీ అప్లికేషన్ కోడ్‌ను పుష్ చేయండి
7. **Monitor** - అప్లికేషన్ పనితీరును పరిశీలించండి
8. **Iterate** - మార్పులు చేసి కోడ్ ను మళ్లీ డిప్లాయ్ చేయండి
9. **Cleanup** - అవసరమైతే వనరులను తొలగించండి

### 4. ఎన్విరాన్‌మెంట్ నిర్వహణ
```bash
# పర్యావరణాలను సృష్టించండి మరియు నిర్వహించండి
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 ప్రాజెక్ట్ స్ట్రక్చర్

ఒక సాధారణ azd ప్రాజెక్ట్ నిర్మాణం:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 కాన్ఫిగరేషన్ ఫైల్స్

### azure.yaml
ప్రధాన ప్రాజెక్ట్ కాన్ఫిగరేషన్ ఫైలు:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
ఎన్విరాన్‌మెంట్-ప్రత్యేక కాన్ఫిగరేషన్:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 సాధారణ వర్క్‌ఫ్లోలు ప్రాక్టికల్ వ్యాయామాలతో

> **💡 నేర్చుకోవడానికి సూచన:** ఈ వ్యాయామాలను క్రమంగా అనుసరించండి تاکہ మీ AZD నైపుణ్యాలు مرحلہ وار పెరుగుతాయి.

### 🎯 వ్యాయామం 1: మీ మొదటి ప్రాజెక్ట్‌ను ఇనిషియలైజ్ చేయండి

**లక్ష్యం:** ఒక AZD ప్రాజెక్ట్ సృష్టించి దాని నిర్మాణాన్ని సరిచూడండి

**స్టెప్స్:**
```bash
# పరీక్షించబడిన టెంప్లేట్‌ను ఉపయోగించండి
azd init --template todo-nodejs-mongo

# సృష్టించబడిన ఫైళ్ళను అన్వేషించండి
ls -la  # దాచిన ఫైళ్లు సహా అన్ని ఫైళ్లను చూడండి

# సృష్టించబడిన కీలక ఫైళ్లు:
# - azure.yaml (ప్రధాన కాన్ఫిగరేషన్)
# - infra/ (ఇన్ఫ్రాస్ట్రక్చర్ కోడ్)
# - src/ (అప్లికేషన్ కోడ్)
```

**✅ విజయము:** మీ వద్ద azure.yaml, infra/, మరియు src/ డైరెక్టరీలు ఉన్నాయి

---

### 🎯 వ్యాయామం 2: Azure కి డిప్లాయ్ చేయండి

**లక్ష్యం:** ప్రారంభం నుండి ముగింపు వరకు డిప్లాయ్‌మెంట్ పూర్తి చేయండి

**స్టెప్స్:**
```bash
# 1. ప్రామాణీకరించండి
az login && azd auth login

# 2. పర్యావరణాన్ని సృష్టించండి
azd env new dev
azd env set AZURE_LOCATION eastus

# 3. మార్పులను ముందుగా పూర్వదర్శనం చేయండి (సిఫార్సు చేయబడింది)
azd provision --preview

# 4. అన్నింటినీ డిప్లాయ్ చేయండి
azd up

# 5. డిప్లాయ్‌మెంట్‌ను ధృవీకరించండి
azd show    # మీ యాప్ URL చూడండి
```

**అంచనా సమయం:** 10-15 నిమిషాలు  
**✅ విజయము:** అప్లికేషన్ URL బ్రౌజర్‌లో తెరుచుకుంటుంది

---

### 🎯 వ్యాయామం 3: బహుళ ఎన్విరాన్‌మెంట్లు

**లక్ష్యం:** dev మరియు staging కు డిప్లాయ్ చేయండి

**స్టెప్స్:**
```bash
# ఇప్పటికే dev ఉంది, staging ని సృష్టించండి
azd env new staging
azd env set AZURE_LOCATION westus2
azd up

# అవి మధ్య మార్చుకోండి
azd env list
azd env select dev
```

**✅ విజయము:** Azure పోర్టల్‌లో రెండు వేరు రిసోర్స్ గ్రూపులు కనిపిస్తాయి

---

### 🛡️ క్లీన్ స్లేట్: `azd down --force --purge`

పూర్తిగా రీసెట్ చేయాల్సినప్పుడు:

```bash
azd down --force --purge
```

**ఇది ఏమి చేయనుంది:**
- `--force`: నిర్ధారణ ప్రాంప్ట్‌లు ఉండవు
- `--purge`: అన్ని స్థానిక స్థితి మరియు Azure వనరులను తొలగిస్తుంది

**ఎప్పుడు వాడాలి:**
- డిప్లాయ్‌మెంట్ మధ్యలో విఫలమైనప్పుడు
- ప్రాజెక్టులను మార్చేటప్పుడు
- పూర్తిగా కొత్త ప్రారంభం కావాలనిపించినప్పుడు

---

## 🎪 మూల వర్క్‌ఫ్లో సూచన

### ఒక కొత్త ప్రాజెక్ట్ ప్రారంభించడం
```bash
# విధానం 1: ఉన్న టెంప్లేట్‌ను ఉపయోగించండి
azd init --template todo-nodejs-mongo

# విధానం 2: శూన్యం నుండి ప్రారంభించండి
azd init

# విధానం 3: ప్రస్తుత డైరెక్టరీని ఉపయోగించండి
azd init .
```

### అభివృద్ధి చక్రం
```bash
# అభివృద్ధి వాతావరణాన్ని ఏర్పాటు చేయండి
azd auth login
azd env new dev
azd env select dev

# అన్నింటిని డిప్లాయ్ చేయండి
azd up

# మార్పులు చేయండి మరియు మళ్లీ డిప్లాయ్ చేయండి
azd deploy

# పని పూర్తి అయిన తర్వాత శుభ్రం చేయండి
azd down --force --purge # Azure Developer CLIలోని ఈ కమాండ్ మీ పరిసరానికి **పూర్తి రీసెట్**—ప్రత్యేకంగా ఉపయోగపడుతుంది, మీరు విఫలమైన డిప్లాయ్‌మెంట్‌లను సమస్య పరిష్కరించేటప్పుడు, ఒర్ఫన్‌ అయిన వనరులను శుభ్రం చేసేటప్పుడు లేదా కొత్తగా మళ్లీ డిప్లాయ్ చేయడానికి సన్నాహకాలు చేస్తున్నప్పుడు.
```

## `azd down --force --purge` ను అర్థం చేసుకోవడం
`azd down --force --purge` కమాండ్ మీ azd ఎన్విరాన్‌మెంట్ మరియు అన్ని సంబంధిత వనరులను పూర్తిగా తొలగించడానికి శక్తివంతమైన విధానం. ప్రతి ఫ్లాగ్ ఏమి చేస్తుందో వివరణ මෙక్కడ ఉంది:
```
--force
```

- నిర్ధారణ ప్రాంప్ట్‌లను బైపాస్ చేయబడుతుంది.
- ఆటోమేషన్ లేదా స్క్రిప్టింగ్ కోసం ఉపయోగకరం, అక్కడ మానువల్ ఇన్‌పుట్ సాధ్యంకాకపోవచ్చు.
- CLI అసరిపడుల్ని గుర్తించినా కూడా టియర్‌డౌన్ అంతరాయం లేకుండా కొనసాగుతుంది.

```
--purge
```
Deletes **all associated metadata**, including:
- ఎన్విరాన్‌మెంట్ స్థితి
- స్థానిక `.azure` ఫోల్డర్
- క్యాష్ చేయబడిన డిప్లాయ్‌మెంట్ సమాచారం
- azd_previous deployments ను "గుర్తు పెట్టకుండా" నిరోధిస్తుంది, ఇది mismatched resource groups లేదా పాత రిజిస్ట్రీ_REFERENCES వంటి సమస్యలకు కారణమవచ్చు.

### ఎందుకు ఇద్దరినీ ఉపయోగించాలి?
`azd up` తో మీరు స్థిరంగా సమస్యలు ఎదుర్కొంటే, అడ్డంగా ఉన్న స్టేట్ లేదా భాగంగా జరిగిన డిప్లాయ్‌మెంట్స్ కారణంగా, ఈ కలయిక ఒక **క్లీన్ స్లేట్** ను ఖాయం చేస్తుంది.

ఇది ప్రత్యేకంగా సహాయపడుతుంది Azure పోర్టల్‌లో మాన్యువల్ వనరుల తొలిగింపుల తర్వాత లేదా టెంప్లేట్స్, ఎన్విరాన్‌మెంట్స్, లేదా రిసోర్స్ గ్రూప్ నామకరణ కన్వెన్షన్లను మార్చేటప్పుడు.

### బహుళ ఎన్విరాన్‌మెంట్ల నిర్వహణ
```bash
# స్టేజింగ్ పర్యావరణాన్ని సృష్టించండి
azd env new staging
azd env select staging
azd up

# డెవ్‌కు తిరిగి మార్చండి
azd env select dev

# పర్యావరణాలను పోల్చండి
azd env list
```

## 🔐 ప్రామాణీకరణ మరియు క్రెడెన్షియల్స్

సక్సెస్‌ఫుల్ azd డిప్లాయ్‌మెంట్‌ల కోసం ప్రామాణీకరణను అర్థం చేసుకోవడం అత్యంత కీలకం. Azure అనేక ప్రామాణీకరణ పద్ధతులను ఉపయోగిస్తుంది, మరియు azd ఇతర Azure టూల్‌ల వలె అదే క్రెడెన్షియల్ చైన్‌ను వినియోగిస్తుంది.

### Azure CLI ప్రామాణీకరణ (`az login`)

azd ఉపయోగించే ముందు, మీరు Azure తో ప్రామాణీకరించుకోవాలి. సాధారణంగా ఉపయోగించే విధానం Azure CLI ద్వారా:
```bash
# ఇంటరాక్టివ్ లాగిన్ (బ్రౌజర్‌ను తెరుస్తుంది)
az login

# నిర్దిష్ట టెనెంట్‌తో లాగిన్
az login --tenant <tenant-id>

# సర్వీస్ ప్రిన్సిపల్‌తో లాగిన్
az login --service-principal -u <app-id> -p <password> --tenant <tenant-id>

# ప్రస్తుత లాగిన్ స్థితిని తనిఖీ చేయండి
az account show

# అందుబాటులో ఉన్న సబ్‌స్క్రిప్షన్లను జాబితా చేయండి
az account list --output table

# డిఫాల్ట్ సబ్‌స్క్రిప్షన్‌ను సెట్ చేయండి
az account set --subscription <subscription-id>
```

### ప్రామాణీకరణ ప్రవాహం
1. **ఇంటరాక్టివ్ లాగిన్**: ప్రామాణీకరణ కోసం మీ డిఫాల్ట్ బ్రౌజర్ తెరవబడుతుంది
2. **డివైస్ కోడ్ ఫ్లో**: బ్రౌజర్ యాక్సెస్ లేని వాతావరణాల కోసం
3. **సర్వీస్ ప్రిన్సిపల్**: ఆటోమేషన్ మరియు CI/CD సందర్భాల కోసం
4. **Managed Identity**: Azure-లో హోస్ట్ అయిన అప్లికేషన్ల కోసం

### DefaultAzureCredential చైన్

`DefaultAzureCredential` అనేది ఒక క్రెడెన్షియల్ రకం, ఇది నిర్దిష్ట ఆర్డర్‌లో బహుళ క్రెడెన్షియల్ వనరులను ఆటోమేటిగ్గా ప్రయత్నించడం ద్వారా సరళీకృత ప్రామాణీకరణ అనుభవాన్ని అందిస్తుంది:

#### క్రెడెన్షియల్ చైన్ ఆర్డర్
```mermaid
graph TD
    A[డిఫాల్ట్ Azure క్రెడెన్షియల్] --> B[పర్యావరణ చరాలు]
    B --> C[వర్క్‌లోడ్ గుర్తింపు]
    C --> D[నిర్వహిత గుర్తింపు]
    D --> E[విజువల్ స్టూడియో]
    E --> F[విజువల్ స్టూడియో కోడ్]
    F --> G[Azure కమాండ్-లైన్ (CLI)]
    G --> H[Azure పవర్‌షెల్]
    H --> I[ఇంటరాక్టివ్ బ్రౌజర్]
```
#### 1. ఎన్విరాన్‌మెంట్ వేరియబుల్స్
```bash
# సర్వీస్ ప్రిన్సిపల్ కోసం పర్యావరణ వేరియబుల్స్ సెట్ చేయండి
export AZURE_CLIENT_ID="<app-id>"
export AZURE_CLIENT_SECRET="<password>"
export AZURE_TENANT_ID="<tenant-id>"
```

#### 2. Workload Identity (Kubernetes/GitHub Actions)
ఆటోమేటిగ్గా ఉపయోగించబడుతుంది:
- Azure Kubernetes Service (AKS) తో Workload Identity
- GitHub Actions తో OIDC ఫెడరేషన్
- ఇతర ఫెడరేటెడ్ ఐడెంటిటీ సందర్భాలు

#### 3. Managed Identity
Azure వనరుల కోసం:
- వర్చువల్ మెషీన్లు
- App Service
- Azure Functions
- Container Instances

```bash
# నిర్వహించబడిన ఐడెంటిటీతో Azure వనరుపై నడుస్తోందో లేదో తనిఖీ చేయండి
az account show --query "user.type" --output tsv
# ఫలితం: నిర్వహించబడిన ఐడెంటిటీ ఉపయోగిస్తుంటే "servicePrincipal" ను తిరిగి ఇస్తుంది
```

#### 4. డెవలపర్ టూల్స్ ఇంటిగ్రేషన్
- **Visual Studio**: సైన్-ఇన్ చేయబడిన ఖాతాను ఆటోమాటిగ్గా ఉపయోగిస్తుంది
- **VS Code**: Azure Account ఎక్స్‌టెన్షన్ క్రెడెన్షియల్స్ ఉపయోగిస్తుంది
- **Azure CLI**: `az login` క్రెడెన్షియల్స్ ఉపయోగిస్తుంది (స్థానిక అభివృద్ధికి అత్యంత సాధారణ)

### AZD ప్రామాణీకరణ సెటప్

```bash
# విధానం 1: Azure CLI ఉపయోగించండి (డెవలప్‌మెంట్ కోసం సూచించబడింది)
az login
azd auth login  # ఉన్న Azure CLI క్రెడెన్షియల్స్‌ను 사용합니다

# విధానం 2: నేరుగా azd ప్రామాణీకరణ
azd auth login --use-device-code  # హెడ్‌లెస్ పరిసరాల కోసం

# విధానం 3: ప్రామాణీకరణ స్థితిని తనిఖీ చేయండి
azd auth login --check-status

# విధానం 4: లాగ్ అవుట్ చేసి మళ్లీ ప్రామాణీకరించండి
azd auth logout
azd auth login
```

### ప్రామాణీకరణ ఉత్తమ అభ్యాసాలు

#### స్థానిక అభివృద్ధి కోసం
```bash
# 1. Azure CLIతో లాగిన్ చేయండి
az login

# 2. సరైన సబ్‌స్క్రిప్షన్‌ను ధృవీకరించండి
az account show
az account set --subscription "Your Subscription Name"

# 3. ఉన్న క్రెడెన్షియల్స్‌తో azdను ఉపయోగించండి
azd auth login
```

#### CI/CD పైప్లైన్ల కోసం
```yaml
# GitHub Actions example
- name: Azure Login
  uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}

- name: Deploy with azd
  run: |
    azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
                    --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
                    --tenant-id ${{ secrets.AZURE_TENANT_ID }}
    azd up --no-prompt
```

#### ప్రొడక్షన్ ఎన్విరాన్‌మెంట్స్ కోసం
- Azure వనరులపై నడుస్తున్నప్పుడు **Managed Identity** ఉపయోగించండి
- ఆటోమేషన్ సందర్భాలకు **Service Principal** ఉపయోగించండి
- కోడ్ లేదా కాన్ఫిగరేషన్ ఫైళ్లలో క్రెడెన్షియల్స్ నిల్వ చేయడాన్ని నివారించండి
- సున్నితమైన కాన్ఫిగరేషన్ కోసం **Azure Key Vault** ఉపయోగించండి

### సాధారణ ప్రామాణీకరణ సమస్యలు మరియు పరిష్కారాలు

#### సమస్య: "No subscription found"
```bash
# పరిష్కారం: డిఫాల్ట్ సబ్స్క్రిప్షన్‌ను సెట్ చేయండి
az account list --output table
az account set --subscription "<subscription-id>"
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"
```

#### సమస్య: "Insufficient permissions"
```bash
# పరిష్కారం: అవసరమైన పాత్రలను తనిఖీ చేసి కేటాయించండి
az role assignment list --assignee $(az account show --query user.name --output tsv)

# సాధారణంగా అవసరమయ్యే పాత్రలు:
# - Contributor (వనరుల నిర్వహణ కోసం)
# - User Access Administrator (పాత్రల కేటాయింపుల కోసం)
```

#### సమస్య: "Token expired"
```bash
# పరిష్కారం: మళ్లీ ధృవీకரించండి
az logout
az login
azd auth logout
azd auth login
```

### వివిధ పరిస్థితులలో ప్రామాణీకరణ

#### స్థానిక అభివృద్ధి
```bash
# వ్యక్తిగత అభివృద్ధి ఖాతా
az login
azd auth login
```

#### టీమ్ అభివృద్ధి
```bash
# సంస్థ కోసం నిర్దిష్ట టెనెంట్‌ను ఉపయోగించండి
az login --tenant contoso.onmicrosoft.com
azd auth login
```

#### మల్టీ-టెనెంట్ పరిస్థితులు
```bash
# టెనెంట్ల మధ్య మార్చండి
az login --tenant tenant1.onmicrosoft.com
# టెనెంట్ 1కి డిప్లాయ్ చేయండి
azd up

az login --tenant tenant2.onmicrosoft.com  
# టెనెంట్ 2కి డిప్లాయ్ చేయండి
azd up
```

### భద్రతా అంశాలు

1. **క్రెడెన్షియల్ స్టోరేజ్**: ఎప్పుడూ క్రెడెన్షియల్స్‌ను సోర్స్ కోడ్‌లో నిల్వ చేయవద్దు
2. **స్కోప్ పరిమితి**: సర్వీస్ ప్రిన్సిపల్స్ కోసం కనీస-అధికార సూత్రాన్ని పాటించండి
3. **టోకెన్ రొటేషన్**: సర్వీస్ ప్రిన్సిపల్ సీక్రెట్స్‌ను పర్యావరణంగా తార్కికంగా మార్చండి
4. **ఆడిట్ ట్రైల్**: ప్రామాణీకరణ మరియు డిప్లాయ్‌మెంట్ కార్యకలాపాలను మానిటర్ చేయండి
5. **నెట్‌వర్క్ భద్రత**: సాధ్యమైనప్పుడు ప్రైవేట్ ఎండ్‌పాయింట్‌లను ఉపయోగించండి

### ప్రామాణీకరణ సమస్యలు చెక్ చేయడం

```bash
# అథెంటికేషన్ సమస్యలను డీబగ్ చేయండి
azd auth login --check-status
az account show
az account get-access-token

# సాధారణ డయాగ్నోస్టిక్ కమాండ్లు
whoami                          # ప్రస్తుత వినియోగదారు సందర్భం
az ad signed-in-user show      # Azure AD వినియోగదారు వివరాలు
az group list                  # వనరు యాక్సెస్‌ను పరీక్షించండి
```

## `azd down --force --purge` ను అర్థం చేసుకోవడం

### కనుగొనుట
```bash
azd template list              # టెంప్లేట్లను బ్రౌజ్ చేయండి
azd template show <template>   # టెంప్లేట్ వివరాలు
azd init --help               # ప్రారంభీకరణ ఎంపికలు
```

### ప్రాజెక్ట్ నిర్వహణ
```bash
azd show                     # ప్రాజెక్ట్ అవలోకనం
azd env show                 # ప్రస్తుత వాతావరణం
azd config list             # కాన్ఫిగరేషన్ సెట్టింగులు
```

### మానిటరింగ్
```bash
azd monitor                  # Azure పోర్టల్ మానిటరింగ్‌ను తెరవండి
azd monitor --logs           # అప్లికేషన్ లాగ్‌లను చూడండి
azd monitor --live           # లైవ్ మెట్రిక్స్‌ను చూడండి
azd pipeline config          # CI/CD సెటప్ చేయండి
```

## ఉత్తమ అభ్యాసాలు

### 1. అర్థవంతమైన పేర్లను ఉపయోగించండి
```bash
# మంచిది
azd env new production-east
azd init --template web-app-secure

# నివారించండి
azd env new env1
azd init --template template1
```

### 2. టెంప్లేట్లను వినియోగించండి
- ఎగ్జిస్టింగ్ టెంప్లేట్లతో ప్రారంభించండి
- మీ అవసరాలకు అనుగుణంగా అనుకరించండి
- మీ సంస్థ కోసం పునర్వినియోగ పెట్టుకునే టెంప్లేట్లు సృష్టించండి

### 3. ఎన్విరాన్‌మెంట్ విభజన
- dev/staging/prod కోసం వేరుగా ఎన్విరాన్‌మెంట్‌లు ఉపయోగించండి
- స్థానిక యంత్రం నుండి నేరుగా ప్రొడక్షన్‌కు డిప్లాయ్ చేయరాదు
- ప్రొడక్షన్ డిప్లాయ్‌మెంట్‌ల కోసం CI/CD పైప్లైన్లు ఉపయోగించండి

### 4. కాన్ఫిగరేషన్ నిర్వహణ
- సున్నితమైన డేటాకు ఎన్విరాన్‌మెంట్ వేరియబుల్స్ ఉపయోగించండి
- కాన్ఫిగరేషన్‌ని వెర్షన్ కంట్రోల్‌లో ఉంచండి
- ఎన్విరాన్‌మెంట్-ప్రత్యేక సెట్టింగ్స్ ను డాక్యుమెంట్ చేయండి

## అభ్యసన పురోగతి

### ప్రారంభ దశ (వారం 1-2)
1. azd ఇన్స్టాల్ చేసి ప్రామాణీకరించండి
2. ఒక సింపుల్ టెంప్లెట్ డిప్లాయ్ చేయండి
3. ప్రాజెక్ట్ నిర్మాణాన్ని అర్థం చేసుకోండి
4. బేసిక్ కమాండ్లు నేర్చుకోండి (up, down, deploy)

### మధ్యస్థ (వారం 3-4)
1. టెంప్లేట్లను అనుకరించండి
2. బహుళ ఎన్విరాన్‌మెంట్లు నిర్వహించండి
3. ఇన్‌ఫ్రాస్ట్రక్చర్ కోడ్‌ను అర్థం చేసుకోండి
4. CI/CD పైప్లైన్లు సెటప్ చేయండి

### అధునాతన (వారం 5+)
1. కస్టమ్ టెంప్లేట్లు సృష్టించండి
2. అధునాతన ఇన్‌ఫ్రాస్ట్రక్చర్ నమూనాలు
3. బహుళ-రీజియన్ డిప్లాయ్‌మెంటేలు
4. ఎంటర్‌ప్రైజ్-గ్రేడ్ కాన్ఫిగరేషన్లు

## తదుపరి దశలు

**📖 అధ్యాయము 1 నేర్చుకుంటూనే కొనసాగించండి:**
- [Installation & Setup](installation.md) - azdని ఇన్‌స్టాల్ చేసి కాన్ఫిగర్ చేయడం
- [Your First Project](first-project.md) - పూర్తి হাতে-ఒడి ట్యుటోరియల్
- [Configuration Guide](configuration.md) - అధునాతన కాన్ఫిగరేషన్లు

**🎯 Ready for Next Chapter?**
- [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md) - AI అప్లికేషన్లు రూపొందించడం ప్రారంభించండి

## Additional Resources

- [Azure Developer CLI Overview](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Samples](https://github.com/Azure-Samples)

---

## 🙋 Frequently Asked Questions

### General Questions

**Q: What's the difference between AZD and Azure CLI?**

A: Azure CLI (`az`) వ్యక్తిగత Azure వనరులను నిర్వహించడానికి ఉంటుంది. AZD (`azd`) సంపూర్ణ అప్లికేషన్లను నిర్వహించడానికి ఉంటుంది:

```bash
# Azure CLI - తక్కువ స్థాయి వనరుల నిర్వహణ
az webapp create --name myapp --resource-group rg
az sql server create --name myserver --resource-group rg
# ...ఇంకా చాలా కమాండ్లు అవసరం

# AZD - అప్లికేషన్ స్థాయి నిర్వహణ
azd up  # అన్ని వనరులతో సహా మొత్తం అనువర్తనాన్ని అమర్చుతుంది
```

**ఇలా ఆలోచించండి:**
- `az` = వ్యక్తిగత Lego బ్లాక్స్‌పై పని చేయడం
- `azd` = సంపూర్ణ Lego సెట్‌లతో పని చేయడం

---

**Q: Do I need to know Bicep or Terraform to use AZD?**

A: కాదు! టెంప్లేట్లతో ప్రారంభించండి:
```bash
# ఉన్న టెంప్లేట్‌ను ఉపయోగించండి - IaC గురించి జ్ఞానం అవసరం లేదు
azd init --template todo-nodejs-mongo
azd up
```

నిర్వహణను అనుకూలించడానికి మీరు తర్వాత Bicep నేర్చుకోవచ్చు. టెంప్లేట్లు మెళుకువగా పనిచేసే ఉదాహరణలను అందిస్తాయి.

---

**Q: How much does it cost to run AZD templates?**

A: ఖర్చులు టెంప్లేట్ల ఆధారంగా మారుతాయి. ఎక్కువ భాగం డెవలప్మెంట్ టెంప్లేట్లు $50-150/నెల ఖర్చు ఉంటాయి:

```bash
# అమలు చేయడానికి ముందు ఖర్చులను సమీక్షించండి
azd provision --preview

# వాడకంలో లేకపోతే ఎప్పుడూ శుభ్రపరచండి
azd down --force --purge  # అన్ని వనరులను తొలగిస్తుంది
```

**ప్రయోజనకర చిట్కా:** అందుబాటులో ఉన్న చోట్ల ఉచిత టియర్‌లను ఉపయోగించండి:
- App Service: F1 (Free) tier
- Azure OpenAI: 50,000 tokens/month free
- Cosmos DB: 1000 RU/s free tier

---

**Q: Can I use AZD with existing Azure resources?**

A: అవును, కానీ కొత్తగా ప్రారంభించడం సులభం. AZD పూర్తి లైఫ్‌సైకిల్‌ను నిర్వహిస్తే ఉత్తమంగా పనిచేస్తుంది. ఇప్పటికే ఉన్న వనరుల కోసం:

```bash
# ఓప్షన్ 1: ఉన్న వనరులను దిగుమతి చేయండి (అధిక నైపుణ్యాల కోసం)
azd init
# తర్వాత infra/ను ఉన్న వనరులను సూచించడానికి మార్చండి

# ఓప్షన్ 2: కొత్తగా ప్రారంభించండి (సిఫార్సు చేయబడింది)
azd init --template matching-your-stack
azd up  # కొత్త పరిసరాన్ని సృష్టిస్తుంది
```

---

**Q: How do I share my project with teammates?**

A: AZD ప్రాజెక్ట్‌ను Git లో కమిట్ చేయండి (కాని .azure ఫోల్డర్‌ను కాకుండా):

```bash
# డిఫాల్ట్‌గా ఇప్పటికే .gitignore లో ఉంది
.azure/        # రహస్యాలు మరియు ఎన్విరాన్‌మెంట్ డేటాను కలిగి ఉంది
*.env          # ఎన్విరాన్‌మెంట్ వేరియబుల్స్

# ఆ సమయంలో బృంద సభ్యులు:
git clone <your-repo>
azd auth login
azd env new <their-name>-dev
azd up
```

అందరికి 동일మైన టెంప్లేట్స్ నుండి ఒకే విధమైన ఇన్ఫ్రాస్ట్రక్చర్ వస్తుంది.

---

### Troubleshooting Questions

**Q: "azd up" failed halfway. What do I do?**

A: పొరపాటు చూసి, దానిని సరిచేసి, పునఃప్రయత్నించండి:

```bash
# వివరణాత్మక లాగ్‌లను చూడండి
azd show

# సాధారణ పరిష్కారాలు:

# 1. కోటా మించిపోయినట్లయితే:
azd env set AZURE_LOCATION "westus2"  # వేరే ప్రాంతాన్ని ప్రయత్నించండి

# 2. వనరు పేరులో ఘర్షణ ఉంటే:
azd down --force --purge  # శుభ్రంగా మొదలుపెట్టండి
azd up  # మళ్లీ ప్రయత్నించండి

# 3. ప్రామాణీకరణ గడువు ముగిసినట్లయితే:
az login
azd auth login
azd up
```

**అధికంగా సంభ‌వించే సమస్య:** తప్పు Azure సబ్స్క్రిప్షన్ ఎంపిక చేయబడింది
```bash
az account list --output table
az account set --subscription "<correct-subscription>"
```

---

**Q: How do I deploy just code changes without reprovisioning?**

A: `azd deploy`ని `azd up` స్థానంలో ఉపయోగించండి:

```bash
azd up          # మొదటి సారి: వనరుల ఏర్పాట్లు + డిప్లాయ్ (మందంగా)

# కోడ్‌లో మార్పులు చేయండి...

azd deploy      # తదుపరి సార్లు: కేవలం డిప్లాయ్ మాత్రమే (త్వరగా)
```

వేగం తులన:
- `azd up`: 10-15 నిమిషాలు (ఇన్ఫ్రాస్ట్రక్చర్‌ను ప్రొవిజన్ చేస్తుంది)
- `azd deploy`: 2-5 నిమిషాలు (కేవలం కోడ్)

---

**Q: Can I customize the infrastructure templates?**

A: అవును! `infra/` లోని Bicep ఫైల్స్ ను సవరించండి:

```bash
# azd init తర్వాత
cd infra/
code main.bicep  # VS Codeలో సవరించండి

# మార్పులను ముందుగా చూడండి
azd provision --preview

# మార్పులను అమలు చేయండి
azd provision
```

**సూచన:** చిన్నదిగా ప్రారంభించండి - ముందుగా SKUs మార్చండి:
```bicep
// infra/main.bicep
sku: {
  name: 'B1'  // Change to 'P1V2' for production
}
```

---

**Q: How do I delete everything AZD created?**

A: ఒక ఆదేశం అన్ని వనరులను తొలగిస్తుంది:

```bash
azd down --force --purge

# ఇది తొలగిస్తుంది:
# - అన్ని Azure వనరులు
# - రిసోర్స్ గ్రూప్
# - స్థానిక పర్యావరణ స్థితి
# - క్యాష్ చేయబడిన డిప్లాయ్‌మెంట్ డేటా
```

**ఈ ఆజ్ఞను ఎప్పుడు నడపాలి:**
- టెంప్లేట్ను పరీక్షించటం పూర్తయిన తర్వాత
- వెన్నుకకు వేరు ప్రాజెక్టుకి మారేముందు
- కొత్తగా ప్రారంభించాలనుకుంటున్నప్పుడు

**ఖర్చు పొదుపు:** ఉపయోగంలో లేని వనరులను తొలగించడం = $0 ఛార్జీలు

---

**Q: What if I accidentally deleted resources in Azure Portal?**

A: AZD స్థితి సమన్వయానికి బయటకు పోవచ్చు. శుభ్ర పునాది కలిగించే విధానం:

```bash
# 1. స్థానిక స్థితిని తొలగించండి
azd down --force --purge

# 2. కొత్తగా ప్రారంభించండి
azd up

# వికల్పం: AZD గుర్తించి పరిష్కరించనివ్వండి
azd provision  # లేని వనరులను సృష్టిస్తుంది
```

---

### Advanced Questions

**Q: Can I use AZD in CI/CD pipelines?**

A: అవును! GitHub Actions ఉదాహరణ:

```yaml
# .github/workflows/deploy.yml
name: Deploy with AZD

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Install azd
        run: curl -fsSL https://aka.ms/install-azd.sh | bash
      
      - name: Azure Login
        run: |
          azd auth login \
            --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        run: azd up --no-prompt
```

---

**Q: How do I handle secrets and sensitive data?**

A: AZD స్వయంచాలకంగా Azure Key Vaultతో సమీకరించబడుతుంది:

```bash
# రహస్యాలు కోడ్‌లో కాదు, Key Vault‌లో నిల్వ చేయబడతాయి
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)"

# AZD స్వయంచాలకంగా:
# 1. Key Vaultని సృష్టిస్తుంది
# 2. రహస్యాన్ని నిల్వ చేస్తుంది
# 3. Managed Identity ద్వారా యాప్‌కు యాక్సెస్ అనుమతిస్తుంది
# 4. రన్‌టైమ్‌లో ఇంజెక్ట్ చేస్తుంది
```

**ఎప్పుడూ కమిట్ చేయకండి:**
- `.azure/` folder (contains environment data)
- `.env` files (local secrets)
- Connection strings

---

**Q: Can I deploy to multiple regions?**

A: అవును, ప్రతి ప్రాంతానికి ఒక ఎన్విరాన్మెంట్ సృష్టించండి:

```bash
# తూర్పు అమెరికా పర్యావరణం
azd env new prod-eastus
azd env set AZURE_LOCATION eastus
azd up

# పశ్చిమ యూరప్ పర్యావరణం
azd env new prod-westeurope
azd env set AZURE_LOCATION westeurope
azd up

# ప్రతి పర్యావరణం స్వతంత్రంగా ఉంటుంది
azd env list
```

నిజమైన బహుశాఖ అప్లికేషన్ల కోసం, బహుశాఖలుగా ఒకేసారి డిప్లాయ్ చేయడానికి Bicep టెంప్లేట్లను అనుకూలీకరించండి.

---

**Q: Where can I get help if I'm stuck?**

1. **AZD Documentation:** https://learn.microsoft.com/azure/developer/azure-developer-cli/
2. **GitHub Issues:** https://github.com/Azure/azure-dev/issues
3. **Discord:** [Azure డిస్కార్డ్](https://discord.gg/microsoft-azure) - #azure-developer-cli చానల్
4. **Stack Overflow:** Tag `azure-developer-cli`
5. **This Course:** [Troubleshooting Guide](../chapter-07-troubleshooting/common-issues.md)

**ప్రయోజనకర చిట్కా:** అడగేముందు, నడపండి:
```bash
azd show       # ప్రస్తుత స్థితిని చూపిస్తుంది
azd version    # మీ వెర్షన్ చూపిస్తుంది
```
ఈ సమాచారం మీ ప్రశ్నలో చేర్చండి ताकि త్వరగా సహాయం కోసం.

---

## 🎓 What's Next?

You now understand AZD fundamentals. Choose your path:

### 🎯 For Beginners:
1. **Next:** [Installation & Setup](installation.md) - మీ కాంప్యూటర్‌లో AZD ఇన్స్టాల్ చేయండి
2. **Then:** [Your First Project](first-project.md) - మీ మొట్టమొదటి యాప్‌ను డిప్లాయ్ చేయండి
3. **Practice:** ఈ పాఠంలో ఉన్న అన్ని 3 వ్యాయామాలను పూర్తి చేయండి

### 🚀 For AI Developers:
1. **Skip to:** [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
2. **Deploy:** `azd init --template get-started-with-ai-chat` తో ప్రారంభించండి
3. **Learn:** డిప్లాయ్ చేస్తూ నిర్మించండి

### 🏗️ For Experienced Developers:
1. **Review:** [Configuration Guide](configuration.md) - అధునాతన సెట్టింగులు
2. **Explore:** [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md) - Bicep లో లోతైన అధ్యయనం
3. **Build:** మీ స్టాక్ కోసం అనుకూల టెంప్లేట్లు సృష్టించండి

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start  
- **⬅️ Previous**: [Course Overview](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Next**: [Installation & Setup](installation.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
బాధ్యత నిరాకరణ:

ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ olan [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తాము, అయినప్పటికీ స్వయంచాలక అనువాదాల్లో పొరపాట్లు లేదా తప్పులున్న ఉండొచ్చని దయచేసి గమనించండి. అసలైన భాషలోని మూల డాక్యుమెంట్‌ను అధికారిక మరియు నమ్మకమైన మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి ప్రొఫెషనల్ మానవ అనువాదం చేయించుకోవాలని సూచించబడుతుంది. ఈ అనువాదం వలన ఎదురయ్యే ఏవైనా అవగాహనా లోపాలు లేదా తప్పుగా అర్థం చేసుకోవడంపై మేము బాధ్యత వహించడం లేదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->