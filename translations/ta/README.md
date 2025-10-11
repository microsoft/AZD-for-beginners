<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "56313679644ccd28e9d15bb7089ae5ca",
  "translation_date": "2025-10-11T15:25:43+00:00",
  "source_file": "README.md",
  "language_code": "ta"
}
-->
# AZD ஆரம்பக்கட்ட பயிற்சி: கட்டமைக்கப்பட்ட கற்றல் பயணம்

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ta.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## இந்த பாடத்துடன் தொடங்குவது எப்படி

AZD கற்றல் பயணத்தை தொடங்க கீழே உள்ள படிகளை பின்பற்றவும்:

1. **Repository-ஐ Fork செய்யவும்**: கிளிக் செய்யவும் [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Repository-ஐ Clone செய்யவும்**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **சமூகத்தில் சேரவும்**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) மூலம் நிபுணர்களின் உதவியைப் பெறுங்கள்
4. **உங்கள் கற்றல் பாதையைத் தேர்ந்தெடுக்கவும்**: உங்கள் அனுபவ நிலைக்கு பொருந்தும் கீழே உள்ள அத்தியாயத்தைத் தேர்ந்தெடுக்கவும்

### பல மொழி ஆதரவு

#### தானியங்கிய மொழிபெயர்ப்புகள் (எப்போதும் புதுப்பிக்கப்பட்டவை)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](./README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## பாடத்திற்கான மேலோட்டம்

Azure Developer CLI (azd)-ஐ கட்டமைக்கப்பட்ட அத்தியாயங்கள் மூலம் கற்றுக்கொள்ளுங்கள். **Azure AI Foundry ஒருங்கிணைப்புடன் AI பயன்பாடுகளை வெளியிடுவதில் சிறப்பு கவனம்.**

### நவீன டெவலப்பர்களுக்கு இந்த பாடம் ஏன் முக்கியமானது

Azure AI Foundry Discord சமூகத்தின் கருத்துக்களின் அடிப்படையில், **45% டெவலப்பர்கள் AZD-ஐ AI வேலைப்பாடுகளுக்கு பயன்படுத்த விரும்புகிறார்கள்** ஆனால் கீழே உள்ள சவால்களை எதிர்கொள்கிறார்கள்:
- சிக்கலான பல சேவை AI கட்டமைப்புகள்
- உற்பத்தி AI வெளியீட்டு சிறந்த நடைமுறைகள்  
- Azure AI சேவை ஒருங்கிணைப்பு மற்றும் அமைப்பு
- AI வேலைப்பாடுகளுக்கான செலவு மேம்பாடு
- AI-க்கு தனித்துவமான வெளியீட்டு சிக்கல்களை தீர்க்குதல்

### கற்றல் நோக்கங்கள்

இந்த கட்டமைக்கப்பட்ட பாடத்தை முடிக்கும்போது, நீங்கள்:
- **AZD அடிப்படைகளை கற்றுக்கொள்ளுங்கள்**: முக்கிய கருத்துக்கள், நிறுவல் மற்றும் அமைப்பு
- **AI பயன்பாடுகளை வெளியிடுங்கள்**: AZD-ஐ Azure AI Foundry சேவைகளுடன் பயன்படுத்துங்கள்
- **கோடாக கட்டமைப்பை செயல்படுத்துங்கள்**: Bicep டெம்ப்ளேட்களுடன் Azure வளங்களை நிர்வகிக்கவும்
- **வெளியீட்டுகளை சரிசெய்யுங்கள்**: பொதுவான சிக்கல்களை தீர்க்கவும் மற்றும் பிரச்சினைகளை சரிசெய்யவும்
- **உற்பத்திக்கான மேம்பாடு**: பாதுகாப்பு, அளவீடு, கண்காணிப்பு மற்றும் செலவு மேலாண்மை
- **பல முகவர் தீர்வுகளை உருவாக்குங்கள்**: சிக்கலான AI கட்டமைப்புகளை வெளியிடுங்கள்

## 📚 கற்றல் அத்தியாயங்கள்

*உங்கள் அனுபவ நிலை மற்றும் இலக்குகளின் அடிப்படையில் உங்கள் கற்றல் பாதையைத் தேர்ந்தெடுக்கவும்*

### 🚀 அத்தியாயம் 1: அடிப்படை & விரைவான தொடக்கம்
**முன்பதிவுகள்**: Azure சந்தா, அடிப்படை கட்டளை வரி அறிவு  
**கால அளவு**: 30-45 நிமிடங்கள்  
**சிக்கலானது**: ⭐

#### நீங்கள் கற்றுக்கொள்ளும் விஷயங்கள்
- Azure Developer CLI அடிப்படைகளைப் புரிந்துகொள்வது
- உங்கள் தளத்தில் AZD-ஐ நிறுவுதல்
- உங்கள் முதல் வெற்றிகரமான வெளியீடு

#### கற்றல் வளங்கள்
- **🎯 இங்கே தொடங்குங்கள்**: [Azure Developer CLI என்றால் என்ன?](../..)
- **📖 கோட்பாடு**: [AZD அடிப்படைகள்](docs/getting-started/azd-basics.md) - முக்கிய கருத்துக்கள் மற்றும் சொற்கள்
- **⚙️ அமைப்பு**: [நிறுவல் & அமைப்பு](docs/getting-started/installation.md) - தளத்திற்கேற்ப வழிகாட்டிகள்
- **🛠️ நடைமுறை**: [உங்கள் முதல் திட்டம்](docs/getting-started/first-project.md) - படிப்படியாக வழிகாட்டுதல்
- **📋 விரைவான குறிப்புகள்**: [கட்டளை Cheat Sheet](resources/cheat-sheet.md)

#### நடைமுறை பயிற்சிகள்
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 அத்தியாய முடிவு**: AZD-ஐ பயன்படுத்தி Azure-க்கு ஒரு எளிய வலை பயன்பாட்டை வெற்றிகரமாக வெளியிடுங்கள்

---

### 🤖 அத்தியாயம் 2: AI-முதன்மை மேம்பாடு (AI டெவலப்பர்களுக்கு பரிந்துரைக்கப்படுகிறது)
**முன்பதிவுகள்**: அத்தியாயம் 1 முடிக்கப்பட்டது  
**கால அளவு**: 1-2 மணி நேரம்  
**சிக்கலானது**: ⭐⭐

#### நீங்கள் கற்றுக்கொள்ளும் விஷயங்கள்
- AZD உடன் Azure AI Foundry ஒருங்கிணைப்பு
- AI-இயக்கப்பட்ட பயன்பாடுகளை வெளியிடுதல்
- AI சேவை அமைப்புகளைப் புரிந்துகொள்வது

#### கற்றல் வளங்கள்
- **🎯 இங்கே தொடங்குங்கள்**: [Azure AI Foundry ஒருங்கிணைப்பு](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 முறைமைகள்**: [AI மாடல் வெளியீடு](docs/ai-foundry/ai-model-deployment.md) - AI மாடல்களை வெளியிடவும் மற்றும் நிர்வகிக்கவும்
- **🛠️ பணிக்கூடம்**: [AI பணிக்கூடம் ஆய்வகம்](docs/ai-foundry/ai-workshop-lab.md) - உங்கள் AI தீர்வுகளை AZD-க்கு தயாராக்குங்கள்
- **🎥 இடைமுக வழிகாட்டி**: [ஆய்வகப் பொருட்கள்](workshop/README.md) - MkDocs * DevContainer சூழலில் உலாவி-அடிப்படையிலான கற்றல்
- **📋 டெம்ப்ளேட்கள்**: [Azure AI Foundry டெம்ப்ளேட்கள்](../..)

#### நடைமுறை பயிற்சிகள்
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 அத்தியாய முடிவு**: RAG திறன்களுடன் AI-இயக்கப்பட்ட ஒரு உரையாடல் பயன்பாட்டை வெளியிடவும் மற்றும் அமைக்கவும்

---

### ⚙️ அத்தியாயம் 3: அமைப்பு & அங்கீகாரம்
**முன்பதிவுகள்**: அத்தியாயம் 1 முடிக்கப்பட்டது  
**கால அளவு**: 45-60 நிமிடங்கள்  
**சிக்கலானது**: ⭐⭐

#### நீங்கள் கற்றுக்கொள்ளும் விஷயங்கள்
- சூழல் அமைப்பு மற்றும் மேலாண்மை
- அங்கீகாரம் மற்றும் பாதுகாப்பு சிறந்த நடைமுறைகள்
- வள பெயரிடல் மற்றும் அமைப்பு

#### கற்றல் வளங்கள்
- **📖 அமைப்பு**: [அமைப்பு வழிகாட்டி](docs/getting-started/configuration.md) - சூழல் அமைப்பு
- **🔐 பாதுகாப்பு**: அங்கீகாரம் முறைமைகள் மற்றும் நிர்வகிக்கப்பட்ட அடையாளம்
- **📝 உதாரணங்கள்**: [தரவுத்தளம் பயன்பாட்டு உதாரணம்](../../examples/database-app) - அமைப்பு முறைமைகள்

#### நடைமுறை பயிற்சிகள்
- பல சூழல்களை (வளர்ச்சி, மேடையில், உற்பத்தி) அமைக்கவும்
- நிர்வகிக்கப்பட்ட அடையாள அங்கீகாரத்தை அமைக்கவும்
- சூழல்-குறிப்பான அமைப்புகளை செயல்படுத்தவும்

**💡 அத்தியாய முடிவு**: சரியான அங்கீகாரம் மற்றும் பாதுகாப்புடன் பல சூழல்களை நிர்வகிக்கவும்

---

### 🏗️ அத்தியாயம் 4: கோடாக கட்டமைப்பு & வெளியீடு
**முன்பதிவுகள்**: அத்தியாயங்கள் 1-3 முடிக்கப்பட்டது  
**கால அளவு**: 1-1.5 மணி நேரம்  
**சிக்கலானது**: ⭐⭐⭐

#### நீங்கள் கற்றுக்கொள்ளும் விஷயங்கள்
- மேம்பட்ட வெளியீட்டு முறைமைகள்
- Bicep உடன் கோடாக கட்டமைப்பு
- வள வழங்கல் உத்திகள்

#### கற்றல் வளங்கள்
- **📖 வெளியீடு**: [வெளியீட்டு வழிகாட்டி](docs/deployment/deployment-guide.md) - முழுமையான வேலைப்பாடுகள்
- **🏗️ வழங்கல்**: [வளங்களை வழங்குதல்](docs/deployment/provisioning.md) - Azure வள மேலாண்மை
- **📝 உதாரணங்கள்**: [கண்டெய்னர் பயன்பாட்டு உதாரணம்](../../examples/container-app) - கண்டெய்னர்மயமான வெளியீடுகள்

#### நடைமுறை பயிற்சிகள்
- தனிப்பயன் Bicep டெம்ப்ளேட்களை உருவாக்கவும்
- பல சேவை பயன்பாடுகளை வெளியிடவும்
- நீல-பச்சை வெளியீட்டு உத்திகளை செயல்படுத்தவும்

**💡 அத்தியாய முடிவு**: தனிப்பயன் கட்டமைப்பு டெம்ப்ளேட்களைப் பயன்படுத்தி சிக்கலான பல சேவை பயன்பாடுகளை வெளியிடுங்கள்

---

### 🎯 அத்தியாயம் 5: பல முகவர் AI தீர்வுகள் (மேம்பட்டது)
**முன்பதிவுகள்**: அத்தியாயங்கள் 1-2 முடிக்கப்பட்டது  
**கால அளவு**: 2-3 மணி நேரம்  
**சிக்கலானது**: ⭐⭐⭐⭐

#### நீங்கள் கற்றுக்கொள்ளும் விஷயங்கள்
- பல முகவர் கட்டமைப்பு முறைமைகள்
- முகவர் ஒருங்கிணைப்பு மற்றும் ஒத்திசைவு
- உற்பத்தி-தயார் AI வெளியீடுகள்

#### கற்றல் வளங்கள்
- **🤖 சிறப்பு திட்டம்**: [சில்லறை பல முகவர் தீர்வு](examples/retail-scenario.md) - முழுமையான செயல்பாடு
- **🛠️ ARM டெம்ப்ளேட்கள்**: [ARM டெம்ப்ளேட் தொகுப்பு](../../examples/retail-multiagent-arm-template) - ஒரே கிளிக் வெளியீடு
- **📖 கட்டமைப்பு**: பல முகவர் ஒத்திசைவு முறைமைகள்

#### நடைமுறை பயிற்சிகள்
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 அத்தியாய முடிவு**: வாடிக்கையாளர் மற்றும் சரக்கு முகவர்களுடன் உற்பத்தி-தயார் பல முகவர் AI தீர்வை வெளியிடவும் மற்றும் நிர்வகிக்கவும்

---

### 🔍 அத்தியாயம் 6: வெளியீட்டுக்கு முன் சரிபார்ப்பு & திட்டமிடல்
**முன்பதிவுகள்**: அத்தியாயம் 4 முடிக்கப்பட்டது  
**கால அளவு**: 1 மணி நேரம்  
**சிக்கலானது**: ⭐⭐

#### நீங்கள் கற்றுக்கொள்ளும் விஷயங்கள்
- திறன் திட்டமிடல் மற்றும் வள சரிபார்ப்பு
- SKU தேர்வு உத்திகள்
- வெளியீட்டுக்கு முன் சரிபார்ப்பு மற்றும் தானியங்கம்

#### கற்றல் வளங்கள்
- **📊 திட்டமிடல்**: [திறன் திட்டமிடல்](docs/pre-deployment/capacity-planning.md) - வள சரிபார்ப்பு
- **💰 தேர்வு**: [SKU தேர்வு](docs/pre-deployment/sku-selection.md) - செலவு-தடையற்ற தேர்வுகள்
- **✅ சரிபார்ப்பு**: [வெளியீட்டுக்கு முன் சரிபார்ப்புகள்](docs/pre-deployment/preflight-checks.md) - தானியங்கிய ஸ்கிரிப்ட்கள்

#### நடைமுறை பயிற்சிகள்
- திறன் சரிபார்ப்பு ஸ்கிரிப்ட்களை இயக்கவும்
- SKU தேர்வுகளை செலவுக்கு மேம்படுத்தவும்
- தானியங்கிய வெளியீட்டுக்கு முன் சரிபார்ப்புகளை செயல்படுத்தவும்

**💡 அத்தியாய முடிவு**: வெளியீட்டுக்கு முன் சரிபார்த்து மற்றும் மேம்படுத்தி வெளியீடுகளைச் செயல்படுத்தவும்

---

### 🚨 அத்தியாயம் 7: சிக்கல்களை தீர்க்குதல் & பிழைதிருத்தம்
**முன்பதிவுகள்**: எந்த வெளியீட்டு அத்தியாயமும் முடிக்கப்பட்டது  
**கால அளவு**: 1-1.5 மணி நேரம்  
**சிக்கலானது**: ⭐⭐

#### நீங்கள் கற்றுக்கொள்ளும் விஷயங்கள்
- முறையான பிழைதிருத்த அணுகுமுறைகள்
- பொதுவான சிக்கல்கள் மற்றும் தீர்வுகள்
- AI-க்கு தனித்துவமான பிழைதிருத்தம்

#### கற்றல் வளங்கள்
- **🔧 பொதுவான சிக்கல்கள்**: [பொதுவான சிக்கல்கள்](docs/troubleshooting/common-issues.md) - FAQ மற்றும் தீர்வுகள்
- **🕵️ பிழைதிருத்தம்**: [பிழைதிருத்த வழிகாட்டி](docs/troubleshooting/debugging.md) - படிப்படையான உத்திகள்
- **🤖 AI சிக்கல்கள்**: [AI-க்கு தனித்துவமான பிழைதிருத்தம்](docs/troubleshooting/ai-troubleshooting.md) - AI சேவை பிரச்சினைகள்

#### நடைமுறை பயிற்சிகள்
- வெளியீட்டு தோல்விகளை கண்டறியவும்
- அங்கீகார சிக்கல்களை தீர்க்கவும்
- AI சேவை இணைப்பு பிழைகளை திருத்தவும்

**💡 அத்தியாய முடிவு**: பொதுவான வெளியீட்டு சிக்கல்களை சுயமாக கண்டறிந்து தீர்க்கவும்

---

### 🏢 அத்தியாயம் 8: உற்பத்தி & நிறுவன முறைமைகள்
**முன்பதிவுகள்**:
**சிக்கலானது**: ⭐⭐⭐⭐

#### நீங்கள் கற்றுக்கொள்ளப்போகிறீர்கள்
- உற்பத்தி வெளியீட்டு உத்திகள்
- நிறுவன பாதுகாப்பு முறை
- கண்காணிப்பு மற்றும் செலவுக் குறைப்பு

#### கற்றல் வளங்கள்
- **🏭 உற்பத்தி**: [உற்பத்தி AI சிறந்த நடைமுறைகள்](docs/ai-foundry/production-ai-practices.md) - நிறுவன முறை
- **📝 உதாரணங்கள்**: [மைக்ரோசர்வீசஸ் உதாரணம்](../../examples/microservices) - சிக்கலான கட்டமைப்புகள்
- **📊 கண்காணிப்பு**: Application Insights ஒருங்கிணைப்பு

#### நடைமுறை பயிற்சிகள்
- நிறுவன பாதுகாப்பு முறைகளை செயல்படுத்தவும்
- விரிவான கண்காணிப்பை அமைக்கவும்
- சரியான ஆளுமையுடன் உற்பத்திக்கு வெளியிடவும்

**💡 அத்தியாய முடிவு**: முழுமையான உற்பத்தி திறன்களுடன் நிறுவனத்துக்கு தயாரான பயன்பாடுகளை வெளியிடவும்

---

## 🎓 பணிமனை கண்ணோட்டம்: கைக்கூலி கற்றல் அனுபவம்

### தொடர்பு கொண்ட பணிமனைப் பொருட்கள்
**உலாவி அடிப்படையிலான கருவிகள் மற்றும் வழிகாட்டும் பயிற்சிகளுடன் விரிவான கைக்கூலி கற்றல்**

எங்கள் பணிமனைப் பொருட்கள் மேலே உள்ள அத்தியாய அடிப்படையிலான பாடத்திட்டத்தைப் पूர்த்தும் ஒரு கட்டமைக்கப்பட்ட, தொடர்பு கொண்ட கற்றல் அனுபவத்தை வழங்குகின்றன. இந்த பணிமனை சுய-வேக கற்றலுக்கும், பயிற்சியாளரால் நடத்தப்படும் அமர்வுகளுக்கும் வடிவமைக்கப்பட்டுள்ளது.

#### 🛠️ பணிமனை அம்சங்கள்
- **உலாவி அடிப்படையிலான இடைமுகம்**: MkDocs-இன் சக்தியூட்டப்பட்ட பணிமனை தேடல், நகல் மற்றும் தீம் அம்சங்களுடன்
- **GitHub Codespaces ஒருங்கிணைப்பு**: ஒரே கிளிக் மேம்பாட்டு சூழல் அமைப்பு
- **கட்டமைக்கப்பட்ட கற்றல் பாதை**: 7-அடுக்கு வழிகாட்டும் பயிற்சிகள் (மொத்தம் 3.5 மணி நேரம்)
- **கண்டுபிடிப்பு → வெளியீடு → தனிப்பயனாக்கம்**: முன்னேற்றமான முறை
- **இடைமுக DevContainer சூழல்**: முன்கூட்டியே அமைக்கப்பட்ட கருவிகள் மற்றும் சார்புகள்

#### 📚 பணிமனை அமைப்பு
பணிமனை **கண்டுபிடிப்பு → வெளியீடு → தனிப்பயனாக்கம்** முறைமையை பின்பற்றுகிறது:

1. **கண்டுபிடிப்பு கட்டம்** (45 நிமிடங்கள்)
   - Azure AI Foundry டெம்ப்ளேட்கள் மற்றும் சேவைகளை ஆராயவும்
   - பல முகவர் கட்டமைப்பு முறைகளைப் புரிந்துகொள்ளவும்
   - வெளியீட்டு தேவைகள் மற்றும் முன்னோடிகளை மதிப்பாய்வு செய்யவும்

2. **வெளியீட்டு கட்டம்** (2 மணி நேரம்)
   - AZD உடன் AI பயன்பாடுகளை கைக்கூலி வெளியீடு செய்யவும்
   - Azure AI சேவைகள் மற்றும் முடிவுகளை அமைக்கவும்
   - பாதுகாப்பு மற்றும் அங்கீகார முறைகளை செயல்படுத்தவும்

3. **தனிப்பயனாக்கம் கட்டம்** (45 நிமிடங்கள்)
   - குறிப்பிட்ட பயன்பாடுகளுக்காக பயன்பாடுகளை மாற்றவும்
   - உற்பத்தி வெளியீட்டுக்காக மேம்படுத்தவும்
   - கண்காணிப்பு மற்றும் செலவுக் குறைப்பு செயல்படுத்தவும்

#### 🚀 பணிமனை தொடங்குதல்
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 பணிமனை கற்றல் முடிவுகள்
பணிமனையை முடிக்கும்போது, பங்கேற்பாளர்கள்:
- **உற்பத்தி AI பயன்பாடுகளை வெளியிடவும்**: AZD உடன் Azure AI Foundry சேவைகளைப் பயன்படுத்தவும்
- **பல முகவர் கட்டமைப்புகளை கற்றுக்கொள்ளவும்**: ஒருங்கிணைந்த AI முகவர் தீர்வுகளை செயல்படுத்தவும்
- **பாதுகாப்பு சிறந்த நடைமுறைகளை செயல்படுத்தவும்**: அங்கீகாரம் மற்றும் அணுகல் கட்டுப்பாட்டை அமைக்கவும்
- **அளவுக்கு மேம்படுத்தவும்**: செலவுக்குறைவான, செயல்திறன் வாய்ந்த வெளியீடுகளை வடிவமைக்கவும்
- **வெளியீட்டு சிக்கல்களை தீர்க்கவும்**: பொதுவான சிக்கல்களை சுயமாக தீர்க்கவும்

#### 📖 பணிமனை வளங்கள்
- **🎥 தொடர்பு கொண்ட வழிகாட்டி**: [பணிமனைப் பொருட்கள்](workshop/README.md) - உலாவி அடிப்படையிலான கற்றல் சூழல்
- **📋 படி படி வழிகாட்டுதல்**: [வழிகாட்டும் பயிற்சிகள்](../../workshop/docs/instructions) - விரிவான நடைமுறை விளக்கங்கள்
- **🛠️ AI பணிமனை ஆய்வகம்**: [AI பணிமனை ஆய்வகம்](docs/ai-foundry/ai-workshop-lab.md) - AI-க்கு மையமாக்கப்பட்ட பயிற்சிகள்
- **💡 விரைவான தொடக்கம்**: [பணிமனை அமைப்பு வழிகாட்டி](workshop/README.md#quick-start) - சூழல் அமைப்பு

**சிறந்தது**: நிறுவன பயிற்சி, பல்கலைக்கழக பாடங்கள், சுய-வேக கற்றல் மற்றும் டெவலப்பர் பயிற்சி முகாம்கள்.

---

## 📖 Azure Developer CLI என்றால் என்ன?

Azure Developer CLI (azd) என்பது Azure-க்கு பயன்பாடுகளை உருவாக்கி வெளியிடும் செயல்முறையை வேகமாக்கும் டெவலப்பர் மைய CLI ஆகும். இது வழங்குகிறது:

- **டெம்ப்ளேட் அடிப்படையிலான வெளியீடுகள்** - பொதுவான பயன்பாட்டு முறைகளுக்கான முன்கூட்டிய டெம்ப்ளேட்களைப் பயன்படுத்தவும்
- **கோடாக உள்ளமைப்பு** - Bicep அல்லது Terraform-ஐப் பயன்படுத்தி Azure வளங்களை நிர்வகிக்கவும்  
- **ஒருங்கிணைந்த வேலைப்பாடுகள்** - பயன்பாடுகளை சீராக வழங்கவும், வெளியிடவும், கண்காணிக்கவும்
- **டெவலப்பர் நட்பு** - டெவலப்பர் உற்பத்தி மற்றும் அனுபவத்திற்காக மேம்படுத்தப்பட்டது

### **AZD + Azure AI Foundry: AI வெளியீடுகளுக்கு சிறந்தது**

**AI தீர்வுகளுக்கு ஏன் AZD?** AZD AI டெவலப்பர்கள் எதிர்கொள்ளும் முக்கிய சவால்களைத் தீர்க்கிறது:

- **AI-க்கு தயாரான டெம்ப்ளேட்கள்** - Azure OpenAI, Cognitive Services மற்றும் ML வேலைப்பாடுகளுக்கான முன்கூட்டிய டெம்ப்ளேட்கள்
- **பாதுகாப்பான AI வெளியீடுகள்** - AI சேவைகள், API கீக்கள் மற்றும் மாடல் முடிவுகளுக்கான உள்ளமைக்கப்பட்ட பாதுகாப்பு முறைகள்  
- **உற்பத்தி AI முறைகள்** - அளவுக்குறைவான, செலவுக்குறைவான AI பயன்பாட்டு வெளியீடுகளுக்கான சிறந்த நடைமுறைகள்
- **முழுமையான AI வேலைப்பாடுகள்** - மாடல் மேம்பாட்டிலிருந்து சரியான கண்காணிப்புடன் உற்பத்தி வெளியீட்டுக்கு
- **செலவுக் குறைப்பு** - AI வேலைப்பாடுகளுக்கான புத்திசாலி வள ஒதுக்கீடு மற்றும் அளவீட்டு உத்திகள்
- **Azure AI Foundry ஒருங்கிணைப்பு** - AI Foundry மாடல் பட்டியல் மற்றும் முடிவுகளுடன் சீராக இணைப்பு

---

## 🎯 டெம்ப்ளேட்கள் & உதாரண நூலகம்

### சிறப்பு: Azure AI Foundry டெம்ப்ளேட்கள்
**AI பயன்பாடுகளை வெளியிட நீங்கள் இங்கே தொடங்குங்கள்!**

| டெம்ப்ளேட் | அத்தியாயம் | சிக்கலானது | சேவைகள் |
|----------|---------|------------|----------|
| [**AI உரையாடலுடன் தொடங்குங்கள்**](https://github.com/Azure-Samples/get-started-with-ai-chat) | அத்தியாயம் 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI முகவர்களுடன் தொடங்குங்கள்**](https://github.com/Azure-Samples/get-started-with-ai-agents) | அத்தியாயம் 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**பல முகவர் வேலைப்பாடுகளை தானியக்கமாக்குதல்**](https://github.com/Azure-Samples/get-started-with-ai-chat) | அத்தியாயம் 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**உங்கள் தரவிலிருந்து ஆவணங்களை உருவாக்குங்கள்**](https://github.com/Azure-Samples/get-started-with-ai-chat) | அத்தியாயம் 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**முகவர்களுடன் வாடிக்கையாளர் சந்திப்புகளை மேம்படுத்துங்கள்**](https://github.com/Azure-Samples/get-started-with-ai-chat) | அத்தியாயம் 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**உங்கள் குறியீட்டை முகவர்களுடன் நவீனமாக்குங்கள்**](https://github.com/Azure-Samples/get-started-with-ai-chat) | அத்தியாயம் 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**உங்கள் உரையாடல் முகவரை உருவாக்குங்கள்**](https://github.com/Azure-Samples/get-started-with-ai-chat) | அத்தியாயம் 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**உரையாடல் தரவிலிருந்து உள்ளடக்கங்களை திறக்கவும்**](https://github.com/Azure-Samples/get-started-with-ai-chat) | அத்தியாயம் 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**பலவகை உள்ளடக்க செயலாக்கம்**](https://github.com/Azure-Samples/get-started-with-ai-chat) | அத்தியாயம் 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### சிறப்பு: முழுமையான கற்றல் சூழல்கள்
**உற்பத்திக்கு தயாரான பயன்பாட்டு டெம்ப்ளேட்கள் கற்றல் அத்தியாயங்களுக்கு இணைக்கப்பட்டவை**

| டெம்ப்ளேட் | கற்றல் அத்தியாயம் | சிக்கலானது | முக்கிய கற்றல் |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | அத்தியாயம் 2 | ⭐ | அடிப்படை AI வெளியீட்டு முறைகள் |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | அத்தியாயம் 2 | ⭐⭐ | RAG செயல்படுத்தல் Azure AI Search உடன் |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | அத்தியாயம் 4 | ⭐⭐ | ஆவண நுண்ணறிவு ஒருங்கிணைப்பு |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | அத்தியாயம் 5 | ⭐⭐⭐ | முகவர் கட்டமைப்பு மற்றும் செயல்பாடு அழைப்பு |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | அத்தியாயம் 8 | ⭐⭐⭐ | நிறுவன AI ஒருங்கிணைப்பு |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | அத்தியாயம் 5 | ⭐⭐⭐⭐ | வாடிக்கையாளர் மற்றும் சரக்கு முகவர்களுடன் பல முகவர் கட்டமைப்பு |

### உதாரண வகை மூலம் கற்றல்

#### எளிய பயன்பாடுகள் (அத்தியாயங்கள் 1-2)
- [எளிய வலை பயன்பாடு](../../examples/simple-web-app) - அடிப்படை வெளியீட்டு முறைகள்
- [நிலையான வலைத்தளம்](../../examples/static-site) - நிலையான உள்ளடக்க வெளியீடு
- [அடிப்படை API](../../examples/basic-api) - REST API வெளியீடு

#### தரவுத்தொகை ஒருங்கிணைப்பு (அத்தியாயம் 3-4)  
- [தரவுத்தொகை பயன்பாடு](../../examples/database-app) - தரவுத்தொகை இணைப்பு முறைகள்
- [தரவு செயலாக்கம்](../../examples/data-processing) - ETL வேலைப்பாடு வெளியீடு

#### மேம்பட்ட முறைகள் (அத்தியாயங்கள் 4-8)
- [கண்டெய்னர் பயன்பாடுகள்](../../examples/container-app) - கண்டெய்னர்மயமான வெளியீடுகள்
- [மைக்ரோசர்வீசஸ்](../../examples/microservices) - பல சேவை கட்டமைப்புகள்  
- [நிறுவன தீர்வுகள்](../../examples/enterprise) - உற்பத்திக்கு தயாரான முறைகள்

### வெளிப்புற டெம்ப்ளேட் தொகுப்புகள்
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Microsoft அதிகாரப்பூர்வ மாதிரிகள்
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - சமூகத்தால் வழங்கப்பட்ட டெம்ப்ளேட்கள்
- [**உதாரணங்கள் அடைவு**](examples/README.md) - விரிவான விளக்கங்களுடன் உள்ளூர் கற்றல் உதாரணங்கள்

---

## 📚 கற்றல் வளங்கள் & குறிப்புகள்

### விரைவான குறிப்புகள்
- [**கட்டளை சுருக்கத் தாள்**](resources/cheat-sheet.md) - அத்தியாயத்தால் ஒழுங்கமைக்கப்பட்ட முக்கிய azd கட்டளைகள்
- [**கோஷரி**](resources/glossary.md) - Azure மற்றும் azd சொற்களஞ்சியம்  
- [**FAQ**](resources/faq.md) - கற்றல் அத்தியாயத்தால் ஒழுங்கமைக்கப்பட்ட பொதுவான கேள்விகள்
- [**படிப்பு வழிகாட்டி**](resources/study-guide.md) - விரிவான நடைமுறை பயிற்சிகள்

### கைக்கூலி பணிமனைகள்
- [**AI பணிமனை ஆய்வகம்**](docs/ai-foundry/ai-workshop-lab.md) - உங்கள் AI தீர்வுகளை AZD-வெளியீடு செய்யக்கூடியதாக மாற்றவும் (2-3 மணி நேரம்)
- [**தொடர்பு கொண்ட பணிமனை வழிகாட்டி**](workshop/README.md) - MkDocs மற்றும் DevContainer சூழலுடன் உலாவி அடிப்படையிலான பணிமனை
- [**கட்டமைக்கப்பட்ட கற்றல் பாதை**](../../workshop/docs/instructions) - 7-அடுக்கு வழிகாட்டும் பயிற்சிகள் (கண்டுபிடிப்பு → வெளியீடு → தனிப்பயனாக்கம்)
- [**AZD தொடக்கத்திற்கான பணிமனை**](workshop/README.md) - GitHub Codespaces ஒருங்கிணைப்புடன் முழுமையான கைக்கூலி பணிமனைப் பொருட்கள்

### வெளிப்புற கற்றல் வளங்கள்
- [Azure Developer CLI ஆவணங்கள்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure கட்டமைப்பு மையம்](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure விலை கணக்கீடு](https://azure.microsoft.com/pricing/calculator/)
- [Azure நிலை](https://status.azure.com/)

---

## 🎓 பாடநெறி முடிவு & சான்றிதழ்

### முன்னேற்றத்தை கண்காணித்தல்
ஒவ்வொரு அத்தியாயத்திலும் உங்கள் கற்றல் முன்னேற்றத்தை கண்காணிக்கவும்:

- [ ] **அத்தியாயம் 1**: அடித்தளம் & விரைவான தொடக்கம் ✅
- [ ] **அத்தியாயம் 2**: AI-முதல் மேம்பாடு ✅  
- [ ] **அத்தியாயம் 3**: அமைப்பு & அங்கீகாரம் ✅
- [ ] **அத்தியாயம் 4**: கோடாக உள்ளமைப்பு & வெளியீடு ✅
- [ ] **அத்தியாயம் 5**: பல முகவர் AI தீர்வுகள் ✅
- [ ] **அத்தியாயம் 6**: வெளியீட்டு முன் சரிபார்ப்பு & திட்டமிடல் ✅
- [ ] **அத்தியாயம் 7**: சிக்கல்களை தீர்க்குதல் & பிழைதிருத்தம் ✅
- [ ] **அத்தியாயம் 8**: உற்பத்தி & நிறுவன முறைகள் ✅

### கற்றல் சரிபார்ப்பு
ஒவ்வொரு அத்தியாயத்தையும் முடித்த பிறகு, உங்கள் அறிவை சரிபார்க்க:
1. **நடைமுறை பயிற்சி**: அத்தியாயத்தின் கைக்கூலி வெளியீட்டை முடிக்கவும்
2. **அறிவு சரிபார்ப்பு**: உங்கள் அத்தியாயத்திற்கான FAQ பிரிவை மதிப்பாய்வு செய்யவும்
3. **சமூக விவாதம்**: Azure Discord-இல் உங்கள் அனுபவத்தைப் பகிரவும்
4. **அடுத்த அத்தியாயம்**: அடுத்த சிக்கலான நிலைக்கு நகரவும்

### பாடநெறி முடிவு நன்மைகள்
அத்தியாயங்களை முடித்த பிறகு, நீங்கள்:
- **உற்பத்தி அனுபவம்**: உண்மையான AI பயன்பாடுகளை Azure-க்கு வெளியிட்டது
- **தொழில்முறை திறன்கள்**: நிறுவனத்துக்கு தயாரான வெளியீட்டு திறன்கள்  
- **சமூக அங்கீகாரம்**: Azure டெவலப்பர் சமூகத்தின் செயலில் உள்ள உறுப்பினர்
- **தொழில் முன்னேற்றம்**:
- **மொழிபெயர்ப்பு**: பல மொழி ஆதரவை பராமரிக்க உதவுங்கள்  
- **பிழை அறிக்கைகள்**: துல்லியத்தையும் தெளிவையும் மேம்படுத்துங்கள்  
- **சமூக தரநிலைகள்**: எங்கள் உள்ளடக்கிய சமூக வழிகாட்டுதல்களை பின்பற்றுங்கள்  

---

## 📄 பாடத்திட்ட தகவல்  

### உரிமம்  
இந்த திட்டம் MIT உரிமத்தின் கீழ் உரிமம் பெற்றது - மேலும் விவரங்களுக்கு [LICENSE](../../LICENSE) கோப்பைப் பார்க்கவும்.  

### தொடர்புடைய Microsoft கற்றல் வளங்கள்  

எங்கள் குழு மற்ற விரிவான கற்றல் பாடத்திட்டங்களை உருவாக்குகிறது:  

- [Model Context Protocol (MCP) For Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents for Beginners](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners using .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners using Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML for Beginners](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Data Science for Beginners](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI for Beginners](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Cybersecurity for Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Web Dev for Beginners](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT for Beginners](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [XR Development for Beginners](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Mastering GitHub Copilot for AI Paired Programming](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Mastering GitHub Copilot for C#/.NET Developers](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Choose Your Own Copilot Adventure](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

## 🗺️ பாடத்திட்ட வழிகாட்டுதல்  

**🚀 கற்றல் தொடங்க தயாரா?**  

**தொடக்கநிலை மாணவர்கள்**: [அத்தியாயம் 1: அடித்தளம் & விரைவான தொடக்கம்](../..) மூலம் தொடங்குங்கள்  
**AI டெவலப்பர்கள்**: [அத்தியாயம் 2: AI-First Development](../..) க்கு செல்லுங்கள்  
**அனுபவம் வாய்ந்த டெவலப்பர்கள்**: [அத்தியாயம் 3: Configuration & Authentication](../..) மூலம் தொடங்குங்கள்  

**அடுத்த படிகள்**: [அத்தியாயம் 1 - AZD அடிப்படைகள்](docs/getting-started/azd-basics.md) →  

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையை பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. எங்கள் நோக்கம் துல்லியமாக இருக்க வேண்டும் என்பதுதான், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியமின்மைகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.