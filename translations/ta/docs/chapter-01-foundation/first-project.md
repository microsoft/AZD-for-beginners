# உங்கள் முதல் திட்டம் - தீர்க்கமாக நடைமுறை பாடம்

**அத்தியாயம் வழிசெலுத்தல்:**
- **📚 کور்ஸ் முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் & விரைவு தொடக்கம்
- **⬅️ முன்னையது**: [Installation & Setup](installation.md)
- **➡️ அடுத்தது**: [Configuration](configuration.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## அறிமுகம்

உங்கள் முதல் Azure Developer CLI திட்டத்திற்கு வருகை! இந்த விரிவான நடைமுறை பாடம் azd பயன்படுத்தி Azure இல் முழு-ஸ்டாக் பயன்பாட்டை உருவாக்குதல், தளம் அமைத்தல் மற்றும் நிர்வகிப்பதை முழுமையாக பயணமாகக் காட்டிறது. நீங்கள் ஒரு உண்மையான todo பயன்பாட்டுடன் பணியாற்றப்போகிறீர்கள், இதில் React முன்னமைப்பு, Node.js API பின்-முனை மற்றும் MongoDB தரவுத்தளம் அடங்கும்.

## கற்றல் நோக்கங்கள்

இந்த பாடத்தை முடித்தவுடன், நீங்கள்:
- வார்ப்புருக்களைப் பயன்படுத்தி azd திட்டத் துவக்கப் பணிபுரிவை கையாளவைப் பெறுவீர்கள்
- Azure Developer CLI திட்டத்தின் கட்டமைப்பு மற்றும் கட்டமைப்பு கோப்புகளைப் புரிந்துகொள்வீர்கள்
- உள்நிறைவூட்டலை ஏற்படுத்தி, Azure க்கு முழு பயன்பாட்டை வழங்க முடிவு செய்யலாம்
- பயன்பாட்டு புதுப்பிப்புகள் மற்றும் மீள்வரவிதிகளை செயல்படுத்தலாம்
- வளர்ச்சி மற்றும் ஸ்டேஜிங் ஆகிய பல சூழ்நிலைகளை நிர்வகிக்கலாம்
- வளங்களை சுத்தம் செய்தல் மற்றும் செலவுத் துறையில் மேலாண்மை நடைமுறைகளை பயன்படுத்தலாம்

## கற்றல் விளைவாக்கள்

முடித்தவுடன், நீங்கள் சற்றே செய்யக்கூடியவைகள்:
- வார்ப்புருக்களிலிருந்து azd திட்டங்களை தனக்குத் தானாகத் தொடங்கி கட்டமைக்க முடியும்
- azd திட்ட கட்டமைப்புகளை திறந்து, மாற்றம் செய்ய முடியும்
- ஒரே கட்டளைகளால் Azure இற்கு முழு-ஸ்டாக் பயன்பாட்டை வெளியிட முடியும்
- பொதுவான வெளியீட்டு பிழைகள் மற்றும் அங்கீகார சிக்கல்களை தீர்க்கலாம்
- வெவ்வேறு வெளியீட்டு நிலைகளுக்காக பல Azure சூழ்நிலைகளை நிர்வகிக்கலாம்
- பயன்பாட்டு புதுப்பிப்புகளுக்காக தொடர்ச்சியான வெளியீட்டு வேல்முறை செயல்படுத்தலாம்

## தொடங்குவதற்கான வழிகாட்டி

### முன் தேவைகள் சுருக்கப்பட்ட பட்டியல்
- ✅ Azure Developer CLI நிறுவப்பட்டுள்ளது ([Installation Guide](installation.md))
- ✅ `azd auth login` மூலம் AZD அங்கீகாரம் முடிக்கப்பட்டுள்ளது
- ✅ உங்கள் கணினியில் Git நிறுவப்பட்டுள்ளது
- ✅ Node.js 16+ (இந்த பாடத்திற்காக)
- ✅ Visual Studio Code (பரிந்துரைக்கப்படுகிறது)

தொடருமுன், கையை அடியில் உள்ள நிரல்தளத்தின் ரூட்டில் இருந்து அமைப்பு சரிபார்ப்பு செயற்பாட்டை இயக்குங்கள்:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### உங்கள் அமைப்பை சரிபார்க்கவும்
```bash
# azd நிறுவல் சரிபார்க்கவும்
azd version

# AZD அங்கீகாரத்தை சரிபார்க்கவும்
azd auth login --check-status
```

### விருப்பமான Azure CLI அங்கீகாரத்தை சரிபார்க்கவும்

```bash
az account show
```

### Node.js பதிப்பை சரிபார்க்கவும்
```bash
node --version
```

## படி 1: ஒரு வார்ப்புருவை தேர்ந்தெடுத்து துவக்கவும்

React முன்னமைப்பு மற்றும் Node.js API பின்-முகத்துடன் ஒரு பிரபல todo பயன்பாட்டு வார்ப்புருவுடன் தொடங்குவோம்.

```bash
# கிடைக்கக்கூடிய வார்ப்புருக்களை உலாவவும்
azd template list

# todo செயலி வார்ப்புருவை தொடங்கவும்
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# கேட்புகளைக் பின்பற்றவும்:
# - ஒரு சூழல் பெயரை உள்ளிடவும்: "dev"
# - ஒரு சந்தாவைத் தேர்ந்தெடுக்கவும் (நீங்களுக்கு பல இருந்தால்)
# - ஒரு மண்டலத்தை தேர்ந்தெடுக்கவும்: "East US 2" (அல்லது உங்கள் விருப்பமான மண்டலம்)
```

### என்ன நடந்தது?
- வார்ப்புரு கோப்புகளை உங்கள் உள்ளூர் அடைவுக்குள் பதிவிறக்கப்பட்டது
- சேவை வரையறைகளுடன் `azure.yaml` கோப்பு உருவாக்கப்பட்டது
- `infra/` அடைவில் போதிய அடித்தளம் குறியீடு அமைக்கப்பட்டது
- ஒரு சூழ்நிலை கட்டமைப்பு உருவாக்கப்பட்டது

## படி 2: திட்ட அமைப்பை ஆய்வு செய்யவும்

azd எங்களுக்காக என்ன உருவாக்கியது என்பதை பரிசீலிக்கலாம்:

```bash
# திட்டத்தின் கட்டமைப்பை பார்க்கவும்
tree /f   # விண்டோஸ்
# அல்லது
find . -type f | head -20   # macOS/லினக்ஸ்
```

நீங்கள் காண்பீர்கள்:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### புரிந்துகொள்ள வேண்டிய முக்கிய கோப்புகள்

**azure.yaml** - உங்கள் azd திட்டத்தின் மையம்:
```bash
# திட்டத்தின் கட்டமைப்பைக் காண்க
cat azure.yaml
```

**infra/main.bicep** - அடித்தளம் வரையறை:
```bash
# அடித்தள அமைப்பின் குறியீட்டை காணவும்
head -30 infra/main.bicep
```

## படி 3: உங்கள் திட்டத்தை தனிப்பயன் அமைக்கவும் (விருப்பமானது)

வெளியேற்றி முன்பாக, நீங்கள் பயன்பாட்டை தனிப்பயனாக்கலாம்:

### முன்னமைப்பை மாற்றவும்
```bash
# React செயலியின் கூறை திறக்கவும்
code src/web/src/App.tsx
```

ஒரு எளிய மாற்றம் செய்யவும்:
```typescript
// தலைப்பைப் கண்டுபிடித்து அதை மாற்றவும்
<h1>My Awesome Todo App</h1>
```

### சூழ்நிலை மாறிலிகளை கட்டமைக்கவும்
```bash
# தனிப்பயன் சூழல் மாறிலிகளை அமைக்கவும்
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# அனைத்து சூழல் மாறிலிகளையும் பார்க்கவும்
azd env get-values
```

## படி 4: Azure இற்கு வெளியிடு

இப்போது சுவாரஸ்யமான பகுதி - அனைத்தையும் Azure இற்கு வெளியிடுங்கள்!

```bash
# அடித்தளம் மற்றும் பயன்பாட்டை வெளியிடவும்
azd up

# இந்த கட்டளை இதைச் செய்யும்:
# 1. Azure வளங்களை (App Service, Cosmos DB போன்றவை) வழங்கும்
# 2. உங்கள் பயன்பாட்டை கட்டும்
# 3. வழங்கப்பட்ட வளங்களில் வெளியிடும்
# 4. பயன்பாட்டின் URL-ஐ காட்டு
```

### வெளியீட்டின் போது என்ன நடக்கிறது?

`azd up` கட்டளை இந்த படி நடவடிக்கைகளை மேற்கொள்கிறது:
1. **Provision** (`azd provision`) - Azure வளங்களை உருவாக்குகிறது
2. **Package** - உங்கள் பயன்பாட்டு குறியீட்டை கட்டமைக்கிறது
3. **Deploy** (`azd deploy`) - குறியீட்டை Azure வளங்களுக்கு வெளியிடுகிறது

### எதிர்பார்க்கப்படும் வெளியீட்டு தகவல்
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## படி 5: உங்கள் பயன்பாட்டை சோதிக்கவும்

### உங்கள் பயன்பாட்டைப் அணுகுதல்
வெளியேற்ற வரும் விளைவில் வழங்கப்பட்ட URL ஐ அழுத்தவும், அல்லது எந்த நேரத்திலும் அதைப் பெறவும்:
```bash
# பயன்பாட்டின் என்ட்பாயிண்டுகளைப் பெறவும்
azd show

# உங்கள் உலாவியில் பயன்பாட்டைத் திறக்கவும்
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo செயலியை சோதிக்கவும்
1. **ஒரு todo பொருள் சேர்க்கவும்** - "Add Todo" ஐ அழுத்தி ஒரு பணி உள்ளிடவும்
2. **முழுமை என குறிக்கவும்** - முடிந்த பொருட்களை மிசை அடிக்கவும்
3. **பொருட்களை நீக்கவும்** - தேவையில்லாத todo-களை அகற்று

### உங்கள் பயன்பாட்டை கண்காணிக்கவும்
```bash
# உங்கள் வளங்களுக்கான Azure போர்டலை திறக்கவும்
azd monitor

# விண்ணப்ப பதிவுகளைப் பார்க்கவும்
azd monitor --logs

# நிகழ்நேர அளவுகோல்களைப் பார்க்கவும்
azd monitor --live
```

## படி 6: மாற்றங்கள் செய்து மீள்வெளியேறு

ஒரு மாற்றம் செய்து அதனை எவ்வளவு எளிதாக புதுப்பிக்க முடியும் என்பதை பார்ப்போம்:

### API-வை மாற்றவும்
```bash
# API குறியீட்டை திருத்துக
code src/api/src/routes/lists.js
```

ஒரு தனிப்பயன் பதில் தலைப்பைச் சேர்க்கவும்:
```javascript
// ஒரு வழி கையாளியை கண்டுபிடித்து சேர்க்கவும்:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### வெறும் குறியீட்டு மாற்றங்களை மட்டுமே வெளியிடவும்
```bash
# பயன்பாட்டுக் குறியீட்டையே மட்டும் வெளியிடவும் (அடிப்படை கட்டமைப்பைத் தவிர்த்து)
azd deploy

# இது 'azd up' விட மிகவும் வேகமானது, ஏனெனில் அடிப்படை கட்டமைப்பு ஏற்கனவே உள்ளது
```

## படி 7: பல சூழ்நிலைகளை நிர்வகிக்கவும்

தயாரிப்புக்கு முன் மாற்றங்களை சோதிக்க ஒரு ஸ்டேஜிங் சூழ்நிலையை உருவாக்கவும்:

```bash
# புதிய ஸ்டேஜிங் சூழலை உருவாக்கவும்
azd env new staging

# ஸ்டேஜிங் சூழலுக்கு வெளியிடவும்
azd up

# மீண்டும் dev சூழலுக்கு மாறவும்
azd env select dev

# அனைத்து சூழல்களையும் பட்டியலிடவும்
azd env list
```

### சூழ்நிலை ஒப்பீடு
```bash
# வளர்ச்சி சூழலை காண்க
azd env select dev
azd show

# முன் வெளியீட்டு சூழலை காண்க
azd env select staging
azd show
```

## படி 8: வளங்களை சுத்தம் செய்யவும்

சோதனை முடிந்தவுடன், தொடர்ச்சியான கட்டணங்களைத் தவிர्க்க வளங்களை சுத்தம் செய்யுங்கள்:

```bash
# தற்போதைய சூழலுக்காக உள்ள அனைத்து Azure வளங்களையும் நீக்கவும்
azd down

# உறுதிப்படுத்தலைக் கேட்காமல் வலியுறுத்தி நீக்கவும் மற்றும் மென்மையாக நீக்கப்பட்ட வளங்களை முற்றிலும் அகற்றவும்
azd down --force --purge

# குறிப்பிட்ட சூழலை நீக்கவும்
azd env select staging
azd down --force --purge
```

## பாரம்பரிய பயன்பாடு vs. AI-செயல்படுத்தப்பட்ட பயன்பாடு: அதே வேலைவழி

நீங்கள் சமீபத்தில் ஒரு பாரம்பரிய வலைப்பயன்பாட்டை வெளியிட்டீர்கள். ஆனால் நீங்கள் Microsoft Foundry Models ஆதரவும் கொண்ட ஒரு AI-சோட் செயலியை வெளியிட விரும்பினால் என்ன ஆகும்?

நலமான செய்தி: **வேலைவழி ஒரே மாதிரியே இருக்கும்.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| தொடங்குதல் | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| அங்கீகாரம் | `azd auth login` | `azd auth login` |
| வெளியிடு | `azd up` | `azd up` |
| கண்காணி | `azd monitor` | `azd monitor` |
| சுத்தம் செய் | `azd down --force --purge` | `azd down --force --purge` |

தொடங்கி இருக்கும் **வார்ப்புருவையே** தவிர வேறெதுமல்ல. ஒரு AI வார்ப்புரு கூடுதல் அடித்தளம் (உதாரணத்திற்கு Microsoft Foundry Models வளம் அல்லது AI Search குறியீடு போன்றவை) கொண்டிருக்கும், ஆனால் azd அவற்றைப் அனைத்தையும் நிர்வகிக்கிறது. புதிய கட்டளைகள் கற்றுக்கொள்ள வேண்டியதில்லை, வேறொரு கருவியை ஏற்க வேண்டியதில்லை, அல்லது வெளியீட்டைப் பற்றி உங்கள் சிந்தனையை மாற்ற வேண்டியதில்லை.

இதே தான் azd இன் மையக் கொள்கை: **ஒரே வேலைவழி, எந்தப் பணிக்கும்மட்டும்.** இந்த பாடத்தில் நீங்கள் பயிற்சி செய்த திறன்கள்—துவக்குதல், வெளியிடுதல், கண்காணித்தல், மீள்வெளியேற்றுதல், மற்றும் சுத்தம் செய்தல்—AI பயன்பாடுகளுக்கும் மற்றும் ஏஜென்டுகளுக்கும் சமமாக பொருந்தும்.

---

## நீங்கள் எதை கற்றுக் கொண்டீர்கள்

வாழ்த்துக்கள்! நீங்கள் வெற்றிகரமாக:
- ✅ வார்ப்புருவிலிருந்து azd திட்டத்தை துவங்கினீர்கள்
- ✅ திட்ட அமைப்பையும் முக்கிய கோப்புகளையும் ஆய்வு செய்தீர்கள்
- ✅ ஒரு முழு-ஸ்டாக் பயன்பாட்டை Azure இற்கு வெளியிட்டீர்கள்
- ✅ குறியீடு மாற்றங்களைச் செய்து மீள்வெளியேற்றினீர்கள்
- ✅ பல சூழ்நிலைகளை நிர்வகித்தீர்கள்
- ✅ வளங்களை சுத்தம்செய்தீர்கள்

## 🎯 திறன் சரிபார்ப்பு பயிற்சிகள்

### பயிற்சி 1: வேறொரு வார்ப்புருவை வெளியிடுக (15 நிமிடம்)
**நோக்கம்**: azd init மற்றும் வெளியீட்டு வேலைவழியை திறமையாக காட்சிப்படுத்து

```bash
# Python + MongoDB தொகுப்பை முயற்சி செய்யவும்
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# பதிவேற்றத்தை சரிபார்க்கவும்
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# சுத்தம் செய்யவும்
azd down --force --purge
```

**வெற்றி கலாதானங்கள்:**
- [ ] பயன்பாடு பிழைகள் இல்லாமல் வெளியிடுகிறது
- [ ] உலாவியில் பயன்பாட்டு URL-ஐ அணுக முடிகிறது
- [ ] பயன்பாடு சரியாக செயல்படுகிறது (todo-கள் சேர்க்க/நீக்க)
- [ ] அனைத்து வளங்களையும் வெற்றிகரமாக சுத்தம் செய்துள்ளது

### பயிற்சி 2: கட்டமைப்பை தனிப்பயனாக்குக (20 நிமிடம்)
**நோக்கம்**: சூழ்நிலை மாறிலி கட்டமைப்பு பயிற்சி

```bash
cd my-first-azd-app

# தனிப்பயன் சூழலை உருவாக்கவும்
azd env new custom-config

# தனிப்பயன் மாறிலிகளை அமைக்கவும்
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# மாறிலிகளை சரிபார்க்கவும்
azd env get-values | grep APP_TITLE

# தனிப்பயன் கட்டமைப்புடன் விநியோகிக்கவும்
azd up
```

**வெற்றி கலாதானங்கள்:**
- [ ] தனிப்பயன் சூழ்நிலை வெற்றிகரமாக உருவாக்கப்பட்டது
- [ ] சூழ்நிலை மாறிலிகள் அமைக்கப்பட்டு பெறக்கூடியவை
- [ ] தனிப்பயன் கட்டமைப்புடன் பயன்பாடு வெளியிடப்பட்டது
- [ ] வெளியிடப்பட்ட செயலியில் தனிப்பயன் அமைப்புகளை சரிபார்க்க முடிகிறது

### பயிற்சி 3: பன்மறை சூழ்நிலை வேலைவழி (25 நிமிடம்)
**நோக்கம்**: சூழ்நிலை நிர்வாகம் மற்றும் வெளியீட்டுத் தந்திரங்களைப் பரிபாட்டி கற்றுக்கொள்ளுதல்

```bash
# வளர்ச்சி சூழலை உருவாக்கு
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# வளர்ச்சி URL-ஐ குறிப்பிடு
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# முன்-தயாரிப்பு சூழலை உருவாக்கு
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# முன்-தயாரிப்பு URL-ஐ குறிப்பிடு
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# சூழல்களை ஒப்பிடு
azd env list

# இரு சூழல்களையும் சோதனை செய்
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# இரண்டையும் சுத்தம் செய்
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**வெற்றி கலாதானங்கள்:**
- [ ] வெவ்வேறு கட்டமைப்புகளுடன் இரண்டு சூழ்நிலைகள் உருவாக்கப்பட்டன
- [ ] இரு சூழ்நிலைகளும் வெற்றிகரமாக வெளியிடப்பட்டன
- [ ] `azd env select` ஐப் பயன்படுத்தி சூழ்நிலைகளை மாற முடிகிறது
- [ ] சூழ்நிலை மாறிலிகள் சூழ்நிலைகளுக்கு இடையே வேறுபடுகின்றன
- [ ] இரு சூழ்நிலைகளையும் வெற்றிகரமாக சுத்தம் செய்துள்ளீர்கள்

## 📊 உங்கள் முன்னேற்றம்

**முடிவில் செலவந்து நேரம்**: ~60-90 நிமிடம்  
**பெறப்பட்ட திறன்கள்**:
- ✅ வார்ப்புரு-அடிப்படையிலான திட்ட துவக்கம்
- ✅ Azure வளவகை ஏற்படுத்தல்
- ✅ பயன்பாட்டு வெளியீட்டு வேலைவழிகள்
- ✅ சூழ்நிலை நிர்வாகம்
- ✅ கட்டமைப்பு மேலாண்மை
- ✅ வளங்கள் சுத்தப்படுத்தல் மற்றும் செலவு மேலாண்மை

**அடுத்த நிலை**: நீங்கள் [Configuration Guide](configuration.md) க்கு தயாராக உள்ளீர்கள், மேம்பட்ட கட்டமைப்பு மாதிரிகள் கற்க!

## பொதுவான சிக்கல்கள் மற்றும் தீர்வுகள்

### அங்கீகாரப் பிழைகள்
```bash
# Azure உடன் மீண்டும் அங்கீகரிக்கவும்
az login

# சப்ஸ்கிரிப்ஷன் அணுகலை சரிபார்க்கவும்
az account show
```

### வெளியீட்டு தோல்விகள்
```bash
# பிழைத்திருத்த பதிவுகளை இயக்கவும்
export AZD_DEBUG=true
azd up --debug

# Azure இல் பயன்பாட்டு பதிவுகளைப் பார்க்கவும்
azd monitor --logs

# Container Apps க்காக, Azure CLI ஐப் பயன்படுத்தவும்:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### வள பெயர் முரண்பாடுகள்
```bash
# தனித்துவமான சூழல் பெயரைப் பயன்படுத்தவும்
azd env new dev-$(whoami)-$(date +%s)
```

### போர்ட்/நெட்வொர்கு சிக்கல்கள்
```bash
# போர்டுகள் கிடைக்கிறதா என்பதை சரிபார்க்கவும்
netstat -an | grep :3000
netstat -an | grep :3100
```

## அடுத்த படிகள்

இப்பொழுது உங்கள் முதல் திட்டத்தை முடித்துவிட்டீர்கள், இவற்றைப் பார்க்கவும்:

### 1. அடித்தளத்தை தனிப்பயனாக்குதல்
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD அமைக்கவும்
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - முழுமையான CI/CD வேலைவழிகள்
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - பைப்லைன் கட்டமைப்பு

### 3. தயாரிப்பு சிறந்த நடைமுறைகள்
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - பாதுகாப்பு, செயல்திறன் மற்றும் கண்காணிப்பு

### 4. மேலும் வார்ப்புருக்களை ஆராய்க
```bash
# வகை வாரியாக வார்ப்புருக்களை உலாவவும்
azd template list --filter web
azd template list --filter api
azd template list --filter database

# வெவ்வேறு தொழில்நுட்ப ஸ்டாக்களை முயற்சி செய்யவும்
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## கூடுதல் வளங்கள்

### கற்றல் பொருட்கள்
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### கம்யூனிட்டி & ஆதரவு
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### வார்ப்புருக்கள் & உதாரணங்கள்
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**உங்கள் முதல் azd திட்டத்தை முடித்ததற்கு வாழ்த்துக்கள்!** இப்போது நீங்கள் நம்பிக்கையுடன் Azure இல் அதிசயமான பயன்பாடுகளை உருவாக்கி வெளியிட தயாராக இருக்கிறீர்கள்.

---

**அத்தியாயம் வழிசெலுத்தல்:**
- **📚 کور்ஸ் முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் & விரைவு தொடக்கம்
- **⬅️ முன்னையது**: [Installation & Setup](installation.md)
- **➡️ அடுத்தது**: [Configuration](configuration.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **அடுத்த பாடம்**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்கிறோம் என்றாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கருத்தில் கொள்ளவும். மூல மொழியில் உள்ள அசல் ஆவணம் அதிகாரப்பூர்வ மூலமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பின் பயன்பாட்டால் ஏற்படும் எந்த தவறான புரிதல்களிற்கோ அல்லது தவறான விளக்கங்களிற்கோ நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->