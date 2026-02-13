# రిటైల్ మల్టీ-ఏజెంట్ సొల్యూషన్ - ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్

**5వ అధ్యాయం: ప్రొడక్షన్ డిప్లాయ్‌మెంట్ ప్యాకేజ్**
- **📚 కోర్సు హోమ్**: [AZD ఫర్ బిగినర్స్](../../README.md)
- **📖 సంబంధిత అధ్యాయం**: [అధ్యాయం 5: మల్టీ-ఏజెంట్ AI సొల్యూషన్స్](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 సన్నివేశ గైడ్**: [పూర్తి ఆర్కిటెక్చర్](../retail-scenario.md)
- **🎯 త్వరిత డిప్లాయ్‌మెంట్**: [ఒక క్లిక్ డిప్లాయ్‌మెంట్](../../../../examples/retail-multiagent-arm-template)

> **⚠️ కేవలం ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్**  
> ఈ ARM టెంప్లేట్ **Azure వనరులను** మల్టీ-ఏజెంట్ సిస్టమ్ కోసం డిప్లాయ్ చేస్తుంది.  
>  
> **డిప్లాయ్ అయ్యేవి (15-25 నిమిషాలు):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, మూడు ప్రాంతాల్లో ఎంబెడింగ్స్)
> - ✅ AI సెర్చ్ సర్వీస్ (ఖాళీ, ఇండెక్స్ క్రియేషన్‌కు సిద్ధంగా)
> - ✅ కంటైనర్ యాప్స్ (ప్లేస్‌హోల్డర్ ఇమేజెస్, మీ కోడ్‌కు సిద్ధంగా)
> - ✅ స్టోరేజ్, Cosmos DB, Key Vault, Application Insights  
>  
> **డిప్లాయ్ చేయబడనివి (డెవలప్‌మెంట్ అవసరం):**
> - ❌ ఏజెంట్ ఇంప్లిమెంటేషన్ కోడ్ (కస్టమర్ ఏజెంట్, ఇన్వెంటరీ ఏజెంట్)
> - ❌ రౌటింగ్ లాజిక్ మరియు API ఎండ్‌పాయింట్స్
> - ❌ ఫ్రంట్‌ఎండ్ చాట్ UI
> - ❌ సెర్చ్ ఇండెక్స్ స్కీమాలు మరియు డేటా పైప్‌లైన్లు
> - ❌ **అంచనా డెవలప్‌మెంట్ సమయం: 80-120 గంటలు**
>  
> **ఈ టెంప్లేట్ ఉపయోగించండి:**
> - ✅ మీరు మల్టీ-ఏజెంట్ ప్రాజెక్ట్ కోసం Azure ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజన్ చేయాలనుకుంటే
> - ✅ మీరు ఏజెంట్ ఇంప్లిమెంటేషన్ వేరు గా డెవలప్ చేయాలనుకుంటే
> - ✅ మీరు ప్రొడక్షన్-రెడీ ఇన్‌ఫ్రాస్ట్రక్చర్ బేస్‌లైన్ అవసరం ఉంటే  
>  
> **ఉపయోగించవద్దు:**
> - ❌ మీరు వెంటనే పని చేసే మల్టీ-ఏజెంట్ డెమో ఆశిస్తే
> - ❌ మీరు పూర్తి అప్లికేషన్ కోడ్ ఉదాహరణలు చూస్తున్నట్లయితే

## అవలోకనం

ఈ డైరెక్టరీ **మల్టీ-ఏజెంట్ కస్టమర్ సపోర్ట్ సిస్టమ్** యొక్క **ఇన్‌ఫ్రాస్ట్రక్చర్ ఫౌండేషన్**ను డిప్లాయ్ చేయడానికి సమగ్ర Azure Resource Manager (ARM) టెంప్లేట్‌ను కలిగి ఉంది. ఈ టెంప్లేట్ అవసరమైన అన్ని Azure సేవలను ప్రొవిజన్ చేస్తుంది, సరైన విధంగా కాన్ఫిగర్ చేయబడింది మరియు అనుసంధానించబడింది, మీ అప్లికేషన్ డెవలప్‌మెంట్‌కు సిద్ధంగా ఉంటుంది.

**డిప్లాయ్‌మెంట్ తర్వాత, మీకు ఉంటుంది:** ప్రొడక్షన్-రెడీ Azure ఇన్‌ఫ్రాస్ట్రక్చర్  
**సిస్టమ్ పూర్తి చేయడానికి మీకు అవసరం:** ఏజెంట్ కోడ్, ఫ్రంట్‌ఎండ్ UI, మరియు డేటా కాన్ఫిగరేషన్ (చూడండి [ఆర్కిటెక్చర్ గైడ్](../retail-scenario.md))

## 🎯 డిప్లాయ్ అయ్యేవి

### కోర్ ఇన్‌ఫ్రాస్ట్రక్చర్ (డిప్లాయ్‌మెంట్ తర్వాత స్థితి)

✅ **Azure OpenAI సేవలు** (API కాల్స్‌కు సిద్ధంగా)
  - ప్రాథమిక ప్రాంతం: GPT-4o డిప్లాయ్‌మెంట్ (20K TPM సామర్థ్యం)
  - ద్వితీయ ప్రాంతం: GPT-4o-mini డిప్లాయ్‌మెంట్ (10K TPM సామర్థ్యం)
  - తృతీయ ప్రాంతం: టెక్స్ట్ ఎంబెడింగ్స్ మోడల్ (30K TPM సామర్థ్యం)
  - మూల్యాంకన ప్రాంతం: GPT-4o గ్రేడర్ మోడల్ (15K TPM సామర్థ్యం)
  - **స్థితి:** పూర్తిగా ఫంక్షనల్ - వెంటనే API కాల్స్ చేయవచ్చు

✅ **Azure AI సెర్చ్** (ఖాళీ - కాన్ఫిగరేషన్‌కు సిద్ధంగా)
  - వెక్టర్ సెర్చ్ సామర్థ్యాలు ఎనేబుల్ చేయబడ్డాయి
  - స్టాండర్డ్ టియర్ 1 పార్టిషన్, 1 రిప్లికా
  - **స్థితి:** సర్వీస్ రన్నింగ్, కానీ ఇండెక్స్ క్రియేషన్ అవసరం
  - **అవసరమైన చర్య:** మీ స్కీమాతో సెర్చ్ ఇండెక్స్ క్రియేట్ చేయండి

✅ **Azure స్టోరేజ్ అకౌంట్** (ఖాళీ - అప్లోడ్స్‌కు సిద్ధంగా)
  - బ్లోబ్ కంటైనర్లు: `documents`, `uploads`
  - సురక్షిత కాన్ఫిగరేషన్ (HTTPS మాత్రమే, పబ్లిక్ యాక్సెస్ లేదు)
  - **స్థితి:** ఫైళ్లను స్వీకరించడానికి సిద్ధంగా ఉంది
  - **అవసరమైన చర్య:** మీ ప్రొడక్ట్ డేటా మరియు డాక్యుమెంట్లను అప్లోడ్ చేయండి

⚠️ **కంటైనర్ యాప్స్ ఎన్విరాన్‌మెంట్** (ప్లేస్‌హోల్డర్ ఇమేజెస్ డిప్లాయ్ చేయబడ్డాయి)
  - ఏజెంట్ రౌటర్ యాప్ (nginx డిఫాల్ట్ ఇమేజ్)
  - ఫ్రంట్‌ఎండ్ యాప్ (nginx డిఫాల్ట్ ఇమేజ్)
  - ఆటో-స్కేలింగ్ కాన్ఫిగర్ చేయబడింది (0-10 ఇన్స్టాన్సులు)
  - **స్థితి:** ప్లేస్‌హోల్డర్ కంటైనర్లు రన్నింగ్
  - **అవసరమైన చర్య:** మీ ఏజెంట్ అప్లికేషన్లను నిర్మించి డిప్లాయ్ చేయండి

✅ **Azure Cosmos DB** (ఖాళీ - డేటాకు సిద్ధంగా)
  - డేటాబేస్ మరియు కంటైనర్ ప్రీ-కాన్ఫిగర్ చేయబడ్డాయి
  - తక్కువ-లేటెన్సీ ఆపరేషన్లకు ఆప్టిమైజ్ చేయబడింది
  - TTL ఆటోమేటిక్ క్లీనప్ కోసం ఎనేబుల్ చేయబడింది
  - **స్థితి:** చాట్ హిస్టరీ నిల్వ చేయడానికి సిద్ధంగా ఉంది

✅ **Azure Key Vault** (ఐచ్ఛికం - సీక్రెట్స్‌కు సిద్ధంగా)
  - సాఫ్ట్ డిలీట్ ఎనేబుల్ చేయబడింది
  - RBAC మేనేజ్‌డ్ ఐడెంటిటీలకు కాన్ఫిగర్ చేయబడింది
  - **స్థితి:** API కీలు మరియు కనెక్షన్ స్ట్రింగ్స్ నిల్వ చేయడానికి సిద్ధంగా ఉంది

✅ **Application Insights** (ఐచ్ఛికం - మానిటరింగ్ యాక్టివ్)
  - లాగ్ అనలిటిక్స్ వర్క్‌స్పేస్‌కు కనెక్ట్ చేయబడింది
  - కస్టమ్ మెట్రిక్స్ మరియు అలర్ట్స్ కాన్ఫిగర్ చేయబడ్డాయి
  - **స్థితి:** మీ యాప్స్ నుండి టెలిమెట్రీ స్వీకరించడానికి సిద్ధంగా ఉంది

✅ **డాక్యుమెంట్ ఇంటెలిజెన్స్** (API కాల్స్‌కు సిద్ధంగా)
  - S0 టియర్ ప్రొడక్షన్ వర్క్‌లోడ్స్ కోసం
  - **స్థితి:** అప్లోడ్ చేయబడిన డాక్యుమెంట్లను ప్రాసెస్ చేయడానికి సిద్ధంగా ఉంది

✅ **Bing సెర్చ్ API** (API కాల్స్‌కు సిద్ధంగా)
  - S1 టియర్ రియల్-టైమ్ సెర్చ్‌ల కోసం
  - **స్థితి:** వెబ్ సెర్చ్ క్వెరీస్‌కు సిద్ధంగా

### డిప్లాయ్‌మెంట్ మోడ్‌లు

| మోడ్ | OpenAI సామర్థ్యం | కంటైనర్ ఇన్స్టాన్సులు | సెర్చ్ టియర్ | స్టోరేజ్ రెడండెన్సీ | ఉత్తమమైనది |
|------|-----------------|---------------------|-------------|-------------------|----------|
| **మినిమల్** | 10K-20K TPM | 0-2 రిప్లికాలు | బేసిక్ | LRS (లోకల్) | డెవ్/టెస్ట్, లెర్నింగ్, ప్రూఫ్-ఆఫ్-కాన్సెప్ట్ |
| **స్టాండర్డ్** | 30K-60K TPM | 2-5 రిప్లికాలు | స్టాండర్డ్ | ZRS (జోన్) | ప్రొడక్షన్, మోస్తరు ట్రాఫిక్ (<10K యూజర్లు) |
| **ప్రీమియం** | 80K-150K TPM | 5-10 రిప్లికాలు, జోన్-రెడండెంట్ | ప్రీమియం | GRS (జియో) | ఎంటర్‌ప్రైజ్, అధిక ట్రాఫిక్ (>10K యూజర్లు), 99.99% SLA |

**ఖర్చు ప్రభావం:**
- **మినిమల్ → స్టాండర్డ్:** ~4x ఖర్చు పెరుగుదల ($100-370/మో → $420-1,450/మో)
- **స్టాండర్డ్ → ప్రీమియం:** ~3x ఖర్చు పెరుగుదల ($420-1,450/మో → $1,150-3,500/మో)
- **ఎంచుకోండి:** అంచనా లోడ్, SLA అవసరాలు, బడ్జెట్ పరిమితుల ఆధారంగా

**సామర్థ్య ప్లానింగ్:**
- **TPM (టోకెన్స్ పర్ మినిట్):** అన్ని మోడల్ డిప్లాయ్‌మెంట్‌లలో మొత్తం
- **కంటైనర్ ఇన్స్టాన్సులు:** ఆటో-స్కేలింగ్ పరిధి (మినిమం-మాక్స్ రిప్లికాలు)
- **సెర్చ్ టియర్:** క్వెరీ పనితీరు మరియు ఇండెక్స్ పరిమితులపై ప్రభావం

## 📋 అవసరమైనవి

### అవసరమైన టూల్స్
1. **Azure CLI** (వర్షన్ 2.50.0 లేదా ఎక్కువ)
   ```bash
   az --version  # వెర్షన్ తనిఖీ చేయండి
   az login      # ప్రామాణీకరించండి
   ```

2. **యాక్టివ్ Azure సబ్‌స్క్రిప్షన్** ఓనర్ లేదా కాంట్రిబ్యూటర్ యాక్సెస్‌తో
   ```bash
   az account show  # సభ్యత్వాన్ని ధృవీకరించండి
   ```

### అవసరమైన Azure కోటాలు

డిప్లాయ్‌మెంట్‌కు ముందు, మీ టార్గెట్ ప్రాంతాల్లో సరిపడా కోటాలు ఉన్నాయా అని ధృవీకరించండి:

```bash
# మీ ప్రాంతంలో Azure OpenAI అందుబాటులో ఉందో లేదో తనిఖీ చేయండి
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# OpenAI కోటాను ధృవీకరించండి (ఉదాహరణకు gpt-4o కోసం)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# కంటైనర్ యాప్స్ కోటాను తనిఖీ చేయండి
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**కనీస అవసరమైన కోటాలు:**
- **Azure OpenAI:** 3-4 మోడల్ డిప్లాయ్‌మెంట్‌లు ప్రాంతాల మధ్య
  - GPT-4o: 20K TPM (టోకెన్స్ పర్ మినిట్)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **గమనిక:** GPT-4o కొన్ని ప్రాంతాల్లో వెయిట్‌లిస్ట్‌లో ఉండవచ్చు - [మోడల్ అందుబాటు](https://learn.microsoft.com/azure/ai-services/openai/concepts/models) తనిఖీ చేయండి
- **కంటైనర్ యాప్స్:** మేనేజ్‌డ్ ఎన్విరాన్‌మెంట్ + 2-10 కంటైనర్ ఇన్స్టాన్సులు
- **AI సెర్చ్:** స్టాండర్డ్ టియర్ (వెక్టర్ సెర్చ్‌కు బేసిక్ సరిపోదు)
- **Cosmos DB:** స్టాండర్డ్ ప్రొవిజన్ చేసిన త్రూపుట్

**కోటా సరిపోకపోతే:**
1. Azure పోర్టల్ → కోటాలు → పెంపు అభ్యర్థనకు వెళ్ళండి
2. లేదా Azure CLI ఉపయోగించండి:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. అందుబాటులో ఉన్న ప్రత్యామ్నాయ ప్రాంతాలను పరిగణించండి

## 🚀 త్వరిత డిప్లాయ్‌మెంట్

### ఆప్షన్ 1: Azure CLI ఉపయోగించి

```bash
# టెంప్లేట్ ఫైళ్లను క్లోన్ చేయండి లేదా డౌన్‌లోడ్ చేయండి
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# డిప్లాయ్‌మెంట్ స్క్రిప్ట్‌ను ఎగ్జిక్యూటబుల్‌గా చేయండి
chmod +x deploy.sh

# డిఫాల్ట్ సెట్టింగ్స్‌తో డిప్లాయ్ చేయండి
./deploy.sh -g myResourceGroup

# ప్రీమియం ఫీచర్లతో ప్రొడక్షన్ కోసం డిప్లాయ్ చేయండి
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### ఆప్షన్ 2: Azure పోర్టల్ ఉపయోగించి

[![Azureకు డిప్లాయ్ చేయండి](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### ఆప్షన్ 3: Azure CLI నేరుగా ఉపయోగించి

```bash
# రిసోర్స్ గ్రూప్ సృష్టించండి
az group create --name myResourceGroup --location eastus2

# టెంప్లేట్‌ను డిప్లాయ్ చేయండి
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ డిప్లాయ్‌మెంట్ టైమ్‌లైన్

### ఏమి ఆశించాలి

| దశ | వ్యవధి | ఏమి జరుగుతుంది |
|-------|----------|--------------||
| **టెంప్లేట్ వాలిడేషన్** | 30-60 సెకన్లు | Azure ARM టెంప్లేట్ సింటాక్స్ మరియు పారామీటర్లను ధృవీకరిస్తుంది |
| **రీసోర్స్ గ్రూప్ సెటప్** | 10-20 సెకన్లు | రీసోర్స్ గ్రూప్ క్రియేట్ చేస్తుంది (అవసరమైతే) |
| **OpenAI ప్రొవిజనింగ్** | 5-8 నిమిషాలు | 3-4 OpenAI అకౌంట్లు క్రియేట్ చేసి మోడల్స్ డిప్లాయ్ చేస్తుంది |
| **కంటైనర్ యాప్స్** | 3-5 నిమిషాలు | ఎన్విరాన్‌మెంట్ క్రియేట్ చేసి ప్లేస్‌హోల్డర్ కంటైనర్లను డిప్లాయ్ చేస్తుంది |
| **సెర్చ్ & స్టోరేజ్** | 2-4 నిమిషాలు | AI సెర్చ్ సర్వీస్ మరియు స్టోరేజ్ అకౌంట్లను ప్రొవిజన్ చేస్తుంది |
| **Cosmos DB** | 2-3 నిమిషాలు | డేటాబేస్ క్రియేట్ చేసి కంటైనర్లను కాన్ఫిగర్ చేస్తుంది |
| **మానిటరింగ్ సెటప్** | 2-3 నిమిషాలు | Application Insights మరియు లాగ్ అనలిటిక్స్ సెటప్ చేస్తుంది |
| **RBAC కాన్ఫిగరేషన్** | 1-2 నిమిషాలు | మేనేజ్‌డ్ ఐడెంటిటీలకు అనుమతులను కాన్ఫిగర్ చేస్తుంది |
| **మొత్తం డిప్లాయ్‌మెంట్** | **15-25 నిమిషాలు** | పూర్తి ఇన్‌ఫ్రాస్ట్రక్చర్ సిద్ధంగా ఉంటుంది |

**డిప్లాయ్‌మెంట్ తర్వాత:**
- ✅ **ఇన్‌ఫ్రాస్ట్రక్చర్ సిద్ధంగా:** అన్ని Azure సేవలు ప్రొవిజన్ చేయబడి రన్నింగ్‌లో ఉన్నాయి
- ⏱️ **అప్లికేషన్ డెవలప్‌మెంట్:** 80-120 గంటలు (మీ బాధ్యత)
- ⏱️ **ఇండెక్స్ కాన్ఫిగరేషన్:** 15-30 నిమిషాలు (మీ స్కీమా అవసరం)
- ⏱️ **డేటా అప్లోడ్:** డేటాసెట్ పరిమాణం ఆధారంగా మారుతుంది
- ⏱️ **టెస్టింగ్ & వాలిడేషన్:** 2-4 గంటలు

---

## ✅ డిప్లాయ్‌మెంట్ విజయాన్ని ధృవీకరించండి

### దశ 1: రీసోర్స్ ప్రొవిజనింగ్ తనిఖీ చేయండి (2 నిమిషాలు)

```bash
# అన్ని వనరులు విజయవంతంగా మోహరించబడినట్లు ధృవీకరించండి
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**అంచనా:** ఖాళీ టేబుల్ (అన్ని రీసోర్సులు "Succeeded" స్థితిని చూపుతాయి)

### దశ 2: Azure OpenAI డిప్లాయ్‌మెంట్‌లను ధృవీకరించండి (3 నిమిషాలు)

```bash
# అన్ని OpenAI ఖాతాలను జాబితా చేయండి
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# ప్రాథమిక ప్రాంతానికి మోడల్ మోహరింపులను తనిఖీ చేయండి
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**అంచనా:** 
- 3-4 OpenAI అకౌంట్లు (ప్రాథమిక, ద్వితీయ, తృతీయ, మూల్యాంకన ప్రాంతాలు)
- ప్రతి అకౌంట్‌కు 1-2 మోడల్ డిప్లాయ్‌మెంట్‌లు (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### దశ 3: ఇన్‌ఫ్రాస్ట్రక్చర్ ఎండ్‌పాయింట్లను పరీక్షించండి (5 నిమిషాలు)

```bash
# కంటైనర్ యాప్ URLలను పొందండి
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# రౌటర్ ఎండ్‌పాయింట్‌ను పరీక్షించండి (ప్లేస్‌హోల్డర్ చిత్రం స్పందిస్తుంది)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**అంచనా:** 
- కంటైనర్ యాప్స్ "Running" స్థితిని చూపుతాయి
- ప్లేస్‌హోల్డర్ nginx HTTP 200 లేదా 404తో స్పందిస్తుంది (ఇంకా అప్లికేషన్ కోడ్ లేదు)

### దశ 4: Azure OpenAI API యాక్సెస్‌ను ధృవీకరించండి (3 నిమిషాలు)

```bash
# ఓపెన్‌ఏఐ ఎండ్‌పాయింట్ మరియు కీ పొందండి
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# GPT-4o డిప్లాయ్‌మెంట్‌ను పరీక్షించండి
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**అంచనా:** JSON స్పందన చాట్ కంప్లీషన్‌తో (OpenAI ఫంక్షనల్ అని ధృవీకరిస్తుంది)

### ఏమి పని చేస్తుంది మరియు ఏమి పని చేయదు

**✅ డిప్లాయ్‌మెంట్ తర్వాత పని చేస్తుంది:**
- Azure OpenAI మోడల్స్ డిప్లాయ
> **📝 ముఖ్యమైనది:** మౌలిక సదుపాయాలు అమలు చేయబడ్డాయి, కానీ మీరు అప్లికేషన్ కోడ్‌ను అభివృద్ధి చేసి అమలు చేయాలి.

### దశ 1: ఏజెంట్ అప్లికేషన్లను అభివృద్ధి చేయండి (మీ బాధ్యత)

ARM టెంప్లేట్ **ఖాళీ కంటైనర్ యాప్స్** placeholder nginx చిత్రాలతో సృష్టిస్తుంది. మీరు చేయవలసినవి:

**అవసరమైన అభివృద్ధి:**
1. **ఏజెంట్ అమలు** (30-40 గంటలు)
   - GPT-4o ఇంటిగ్రేషన్‌తో కస్టమర్ సర్వీస్ ఏజెంట్
   - GPT-4o-mini ఇంటిగ్రేషన్‌తో ఇన్వెంటరీ ఏజెంట్
   - ఏజెంట్ రూటింగ్ లాజిక్

2. **ఫ్రంట్ ఎండ్ అభివృద్ధి** (20-30 గంటలు)
   - చాట్ ఇంటర్ఫేస్ UI (React/Vue/Angular)
   - ఫైల్ అప్‌లోడ్ ఫంక్షనాలిటీ
   - రెస్పాన్స్ రెండరింగ్ మరియు ఫార్మాటింగ్

3. **బ్యాక్ ఎండ్ సర్వీసులు** (12-16 గంటలు)
   - FastAPI లేదా Express రౌటర్
   - ఆథెంటికేషన్ మిడిల్‌వేర్
   - టెలిమెట్రీ ఇంటిగ్రేషన్

**చూడండి:** [ఆర్కిటెక్చర్ గైడ్](../retail-scenario.md) వివరమైన అమలు నమూనాలు మరియు కోడ్ ఉదాహరణల కోసం

### దశ 2: AI సెర్చ్ ఇండెక్స్‌ను కాన్ఫిగర్ చేయండి (15-30 నిమిషాలు)

మీ డేటా మోడల్‌కు సరిపోయే సెర్చ్ ఇండెక్స్‌ను సృష్టించండి:

```bash
# శోధన సేవ వివరాలను పొందండి
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# మీ స్కీమాతో సూచికను సృష్టించండి (ఉదాహరణ)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**వనరులు:**
- [AI సెర్చ్ ఇండెక్స్ స్కీమా డిజైన్](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [వెక్టార్ సెర్చ్ కాన్ఫిగరేషన్](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### దశ 3: మీ డేటాను అప్‌లోడ్ చేయండి (సమయం మారుతుంది)

మీకు ప్రొడక్ట్ డేటా మరియు డాక్యుమెంట్లు ఉన్న తర్వాత:

```bash
# నిల్వ ఖాతా వివరాలను పొందండి
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# మీ పత్రాలను అప్‌లోడ్ చేయండి
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# ఉదాహరణ: ఒకే ఫైల్‌ను అప్‌లోడ్ చేయండి
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### దశ 4: మీ అప్లికేషన్లను నిర్మించి అమలు చేయండి (8-12 గంటలు)

మీరు ఏజెంట్ కోడ్‌ను అభివృద్ధి చేసిన తర్వాత:

```bash
# 1. అవసరమైతే Azure కంటైనర్ రిజిస్ట్రీని సృష్టించండి
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. ఏజెంట్ రౌటర్ ఇమేజ్‌ను నిర్మించి పుష్ చేయండి
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. ఫ్రంట్ ఎండ్ ఇమేజ్‌ను నిర్మించి పుష్ చేయండి
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. మీ ఇమేజ్‌లతో కంటైనర్ యాప్స్‌ను నవీకరించండి
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. పర్యావరణ వేరియబుల్స్‌ను కాన్ఫిగర్ చేయండి
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### దశ 5: మీ అప్లికేషన్‌ను పరీక్షించండి (2-4 గంటలు)

```bash
# మీ అప్లికేషన్ URL పొందండి
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# ఏజెంట్ ఎండ్‌పాయింట్‌ను పరీక్షించండి (మీ కోడ్ డిప్లాయ్ చేసిన తర్వాత)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# అప్లికేషన్ లాగ్‌లను తనిఖీ చేయండి
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### అమలు వనరులు

**ఆర్కిటెక్చర్ & డిజైన్:**
- 📖 [పూర్తి ఆర్కిటెక్చర్ గైడ్](../retail-scenario.md) - వివరమైన అమలు నమూనాలు
- 📖 [మల్టీ-ఏజెంట్ డిజైన్ ప్యాటర్న్స్](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**కోడ్ ఉదాహరణలు:**
- 🔗 [Azure OpenAI చాట్ సాంపిల్](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG ప్యాటర్న్
- 🔗 [సెమాంటిక్ కర్నెల్](https://github.com/microsoft/semantic-kernel) - ఏజెంట్ ఫ్రేమ్‌వర్క్ (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - ఏజెంట్ ఆర్కెస్ట్రేషన్ (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - మల్టీ-ఏజెంట్ సంభాషణలు

**అంచనా మొత్తం ప్రయత్నం:**
- మౌలిక సదుపాయాల అమలు: 15-25 నిమిషాలు (✅ పూర్తయింది)
- అప్లికేషన్ అభివృద్ధి: 80-120 గంటలు (🔨 మీ పని)
- పరీక్ష మరియు ఆప్టిమైజేషన్: 15-25 గంటలు (🔨 మీ పని)

## 🛠️ సమస్యల పరిష్కారం

### సాధారణ సమస్యలు

#### 1. Azure OpenAI కోటా మించిపోయింది

```bash
# ప్రస్తుత కోటా వినియోగాన్ని తనిఖీ చేయండి
az cognitiveservices usage list --location eastus2

# కోటా పెంపు కోసం అభ్యర్థించండి
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. కంటైనర్ యాప్స్ అమలు విఫలమైంది

```bash
# కంటైనర్ యాప్ లాగ్‌లను తనిఖీ చేయండి
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# కంటైనర్ యాప్‌ను మళ్లీ ప్రారంభించండి
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. సెర్చ్ సర్వీస్ ప్రారంభం

```bash
# శోధన సేవ స్థితిని ధృవీకరించండి
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# శోధన సేవ కనెక్టివిటీని పరీక్షించండి
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### అమలు ధృవీకరణ

```bash
# అన్ని వనరులు సృష్టించబడ్డాయని ధృవీకరించండి
az resource list \
  --resource-group myResourceGroup \
  --output table

# వనరుల ఆరోగ్యాన్ని తనిఖీ చేయండి
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 భద్రతా అంశాలు

### కీ నిర్వహణ
- అన్ని రహస్యాలు Azure Key Vaultలో నిల్వ చేయబడతాయి (అమలు చేయబడినప్పుడు)
- కంటైనర్ యాప్స్ ఆథెంటికేషన్ కోసం మేనేజ్‌డ్ ఐడెంటిటీని ఉపయోగిస్తాయి
- స్టోరేజ్ అకౌంట్లు సురక్షిత డిఫాల్ట్‌లను కలిగి ఉంటాయి (HTTPS మాత్రమే, పబ్లిక్ బ్లోబ్ యాక్సెస్ లేదు)

### నెట్‌వర్క్ భద్రత
- కంటైనర్ యాప్స్ సాధ్యమైనంత వరకు అంతర్గత నెట్‌వర్కింగ్‌ను ఉపయోగిస్తాయి
- సెర్చ్ సర్వీస్ ప్రైవేట్ ఎండ్‌పాయింట్ ఆప్షన్‌తో కాన్ఫిగర్ చేయబడింది
- Cosmos DB అవసరమైన కనీస అనుమతులతో కాన్ఫిగర్ చేయబడింది

### RBAC కాన్ఫిగరేషన్
```bash
# నిర్వహిత గుర్తింపుకు అవసరమైన పాత్రలను కేటాయించండి
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 ఖర్చు ఆప్టిమైజేషన్

### ఖర్చు అంచనాలు (నెలవారీ, USD)

| మోడ్ | OpenAI | కంటైనర్ యాప్స్ | సెర్చ్ | స్టోరేజ్ | మొత్తం అంచనా |
|------|--------|----------------|--------|---------|------------|
| కనిష్టం | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| ప్రామాణికం | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| ప్రీమియం | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### ఖర్చు మానిటరింగ్

```bash
# బడ్జెట్ అలర్ట్‌లను సెటప్ చేయండి
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 నవీకరణలు మరియు నిర్వహణ

### టెంప్లేట్ నవీకరణలు
- ARM టెంప్లేట్ ఫైళ్లను వెర్షన్ కంట్రోల్ చేయండి
- అభివృద్ధి వాతావరణంలో మార్పులను ముందుగా పరీక్షించండి
- నవీకరణల కోసం ఇన్‌క్రిమెంటల్ డిప్లాయ్‌మెంట్ మోడ్‌ను ఉపయోగించండి

### వనరుల నవీకరణలు
```bash
# కొత్త పారామీటర్లతో నవీకరించండి
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### బ్యాకప్ మరియు రికవరీ
- Cosmos DB ఆటోమేటిక్ బ్యాకప్ ఎనేబుల్ చేయబడింది
- Key Vault సాఫ్ట్ డిలీట్ ఎనేబుల్ చేయబడింది
- కంటైనర్ యాప్ రివిజన్లు రోల్బ్యాక్ కోసం నిర్వహించబడతాయి

## 📞 మద్దతు

- **టెంప్లేట్ సమస్యలు**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure మద్దతు**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **సమాజం**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ మీ మల్టీ-ఏజెంట్ పరిష్కారాన్ని అమలు చేయడానికి సిద్ధంగా ఉన్నారా?**

ప్రారంభించండి: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:  
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వస్థల భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫార్సు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏదైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->