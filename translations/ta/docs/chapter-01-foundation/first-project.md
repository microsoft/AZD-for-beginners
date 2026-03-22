# Your First Project - Hands-On Tutorial

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநூல் முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: Chapter 1 - Foundation & Quick Start
- **⬅️ முந்தையது**: [Installation & Setup](installation.md)
- **➡️ அடுத்தது**: [Configuration](configuration.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## அறிமுகம்

உங்கள் முதல் Azure Developer CLI திட்டத்திற்கு நலம்நலக்குகள்! azd பயன்படுத்தி Azure இல் ஒரு முழு-கட்டமைப்புத் திட்டத்தை உருவாக்குதல், பரிமாறுதல் மற்றும் நிர்வகிப்பதற்கு இந்த விரிவான நடைமுறை பயிற்சி முழுமையான வழிகாட்டுதலை வழங்குகிறது. இதனுடன் ஒரு உண்மையான todo பயன்பாட்டை நீங்கள் செயல்படுத்துவீர்கள்; அதில் React முன்னணி, Node.js API பின்னணி மற்றும் MongoDB தரவுத்தளம் அடங்கும்.

## கற்றல் இலக்குகள்

இந்த பயிற்சியை முடித்தபின், நீங்கள்:
- டெம்ப்ளேடுகள் பயன்படுத்தி azd திட்ட ஆரம்ப சுழற்சியை தேர்ச்சியாகச் செய்யலாம்
- Azure Developer CLI திட்ட அமைப்பு மற்றும் கட்டமைப்பு கோப்புகளை புரிந்துகொள்கின்றீர்கள்
- கூறமைப்பு வழங்கலைச் சேர்க்க Azure இல் முழு பயன்பாட்டையும் இயக்கலாம்
- பயன்பாட்டுப் புதுப்பிப்புகள் மற்றும் மறுசீரமைப்பு நுட்பங்களை செயல்படுத்தலாம்
- வளர்ச்சிக்கும் ஸ்டேஜிங்கிற்குமான பல்வேறு சூழல்களை நிர்வகிக்கலாம்
- வளங்கள் சுத்தப்படுத்துதல் மற்றும் செலவு நிர்வாக நடைமுறைகளை பின்பற்றலாம்

## கற்றல் முடிவுகள்

முடித்தவுடன், நீங்கள் முடிந்ததைப் பெறுவீர்கள்:
- தன்னிச்சையான முறையில் டெம்ப்ளேடுகளில் இருந்து azd திட்டங்களை ஆரம்பித்து கட்டமைக்க முடியும்
- azd திட்ட அமைப்புகளை திறந்து மாற்றங்களைச் செய்யலாம்
- ஒரே கட்டளைகளால் Azure இற்கு முழு-ஸ்டாக் பயன்பாடுகளை பரிமாற முடியும்
- பொதுவான பரிமாற்றப் பிரச்சினைகள் மற்றும் அங்கீகார சிக்கல்களை தீர்க்கக் கற்றுக்கொள்வீர்கள்
- பல Azure சூழல்களை வெவ்வேறு பரிமாற்ற கட்டங்களுக்கு நிர்வகிக்கலாம்
- பயன்பாட்டு புதுப்பிப்புகளுக்கான தொடர்ச்சியான பரிமாற்ற வேலைப்பாடுகளை அமல்படுத்தலாம்

## ஆரம்பிக்க

### முன் நிபந்தனைகள் சரிபார்ப்பு
- ✅ Azure Developer CLI நிறுவப்பட்டுள்ளது ([Installation Guide](installation.md))
- ✅ Azure CLI நிறுவப்பட்டு அங்கீகரிக்கப்பட்டுள்ளது
- ✅ உங்கள் கணினியில் Git நிறுவப்பட்டுள்ளது
- ✅ Node.js 16+ (இந்த பயிற்சிக்கு)
- ✅ Visual Studio Code ( பரிந்துரைக்கப்படுகிறது )

### உங்கள் அமைப்பை சரிபார்க்கவும்
```bash
# azd நிறுவலை சரிபார்க்கவும்
azd version
```
### Azure அங்கீகாரம் சரிபார்க்கவும்

```bash
az account show
```

### Node.js பதிப்பை சரிபார்க்கவும்
```bash
node --version
```

## படி 1: டெம்ப்ளேட்டை தேர்ந்தெடுத்து ஆரம்பிக்கவும்

React முன்னணி மற்றும் Node.js API பின்னணியை கொண்ட ஒரு பிரபலமான todo பயன்பாட்டு டெம்ப்ளேட்டுடன் தொடங்குவோம்.

```bash
# கிடைக்கும் வார்ப்புருக்களை உலாவவும்
azd template list

# todo செயலி வார்ப்புருவை ஆரம்பிக்கவும்
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# கூறப்பட்ட வழிமுறைகளை பின்பற்றவும்:
# - ஒரு சூழல் பெயரை உள்ளிடவும்: "dev"
# - ஒரு சந்தாவைத் தேர்ந்தெடுக்கவும் (நீங்களிடம் பல இருந்தால்)
# - ஒரு பிரதேசத்தைத் தேர்ந்தெடுக்கவும்: "East US 2" (அல்லது உங்கள் விருப்பமான பிரதேசம்)
```

### என்ன நடந்தது?
- டெம்ப்ளேட் கோடை உங்கள் உள்ளூர் அடைவுக்குள் பதிவிறக்கப்பட்டது
- சேவைகள் வரையறைகளுடன் `azure.yaml` கோப்பு உருவாக்கப்பட்டது
- `infra/` அடைவில் தொடர்புடைய கூறமைப்பு குறியீடு அமைக்கப்பட்டது
- ஒரு சூழல் கட்டமைப்பு உருவாக்கப்பட்டது

## படி 2: திட்ட அமைப்பை ஆராயுங்கள்

azd எங்களுக்கு உருவாக்கியது என்ன என்பதை பார்ப்போம்:

```bash
# திட்ட அமைப்பை பார்வையிடவும்
tree /f   # விண்டோஸ்
# அல்லது
find . -type f | head -20   # macOS/லினக்ஸ்
```

நீங்கள் காண வேண்டும்:
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

### புரிந்துகொள்ள முக்கிய கோப்புகள்

**azure.yaml** - உங்கள் azd திட்டத்தின் இதயம்:
```bash
# திட்டக் கட்டமைப்பை பார்க்க
cat azure.yaml
```

**infra/main.bicep** - கூறமைப்பு வரையறை:
```bash
# அடித்தளக் குறியீட்டை பாருங்கள்
head -30 infra/main.bicep
```

## படி 3: உங்கள் திட்டத்தை தனிப்பயனாக்கவும் (விருப்பமானது)

பரிமாற்றத்திற்கு முன், நீங்கள் பயன்பாட்டைப் தனிப்பயனாக்கலாம்:

### முன்னணியை மாற்றவும்
```bash
# React பயன்பாட்டு கூறைத் திறக்கவும்
code src/web/src/App.tsx
```

ஒரு எளிய மாற்றம் செய்யவும்:
```typescript
// தலைப்பை கண்டுபிடித்து அதை மாற்றவும்
<h1>My Awesome Todo App</h1>
```

### சூழல் மாறிகளை அமைக்கவும்
```bash
# தனிப்பயன் சுற்றுச்சூழல் மாறிலிகளை அமைக்க
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# அனைத்து சுற்றுச்சூழல் மாறிலிகளையும் காண்க
azd env get-values
```

## படி 4: Azure இல் பரிமாறவும்

இப்போது அதிர்ஷ்டமான பகுதி — அனைத்தையும் Azure இல் பரிமாறுங்கள்!

```bash
# அடித்தள கட்டமைப்பையும் பயன்பாட்டையும் வெளியிடு
azd up

# இந்த கட்டளை இதைச் செய்யும்:
# 1. Azure வளங்களை ஒதுக்குதல் (App Service, Cosmos DB, மற்றும் பிற)
# 2. உங்கள் பயன்பாட்டை கட்டமைத்தல்
# 3. ஒதுக்கப்பட்ட வளங்களுக்கு பயன்பாட்டை வெளியிடுதல்
# 4. பயன்பாட்டின் URL ஐ காட்டுதல்
```

### பரிமாற்றத்தின் போது என்ன நடக்கிறது?

`azd up` கட்டளை இந்த படிகளைக் செயற்படுத்துகிறது:
1. **Provision** (`azd provision`) - Azure வளங்களை உருவாக்குகிறது
2. **Package** - உங்கள் பயன்பாட்டு குறியீட்டை கட்டமைக்கிறது
3. **Deploy** (`azd deploy`) - Azure வளங்களுக்கு குறியீடை பரிமாறுகிறது

### எதிர்பார்க்கப்படும் வெளியீடு
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## படி 5: உங்கள் பயன்பாட்டை சோதிக்கவும்

### உங்கள் பயன்பாட்டிற்கு அணுகவும்
பரிமாற்ற வெளியீட்டில் கொடுக்கப்பட்ட URL இல் கிளிக் செய்யவும், அல்லது எப்போதும் இதை பெறுங்கள்:
```bash
# பயன்பாட்டின் இறுதி முகவரிகளைப் பெறவும்
azd show

# உங்கள் உலாவியில் பயன்பாட்டை திறக்கவும்
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo பயன்பாட்டை சோதிக்கவும்
1. **ஒரு todo உருப்படியை சேர்க்கவும்** - "Add Todo" ஐ கிளிக் செய்து ஒரு பணியை உள்ளிடுக
2. **முடித்ததாக குறிக்கவும்** - முடிக்கப்பட்ட உருப்படிகளை குறிக்கச் செக் செய்யவும்
3. **உருப்படிகளை நீக்கவும்** - உங்களுக்கு தேவையில்லாத todo களை நீக்கவும்

### உங்கள் பயன்பாட்டை கண்காணிக்கவும்
```bash
# உங்கள் வளங்களுக்கு арналған Azure போர்டலை திறக்கவும்
azd monitor

# பயன்பாட்டு பதிவுகளைப் பார்க்கவும்
azd monitor --logs

# நேரடி அளவுகோல்களைப் பார்க்கவும்
azd monitor --live
```

## படி 6: மாற்றங்கள் செய்து மறுபரிமாற்றம் செய்யவும்

ஒரு மாற்றத்தைச் செய்து அதை எவ்வளவு எளிதாக புதுப்பிப்பது என்பதை பார்க்கலாம்:

### API ஐ மாற்றவும்
```bash
# API குறியீட்டை திருத்தவும்
code src/api/src/routes/lists.js
```

ஒரு தனிப்பயன் பதிலாளி தலைப்பை சேர்க்கவும்:
```javascript
// ஒரு வழி கையாள்பவரைக் கண்டுபிடித்து சேர்க்க:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### வெறும் குறியீடு மாற்றங்களை பரிமாறவும்
```bash
# விண்ணப்பக் குறியீட்டை மட்டும் நிறுவவும் (இன்ஃப்ராஸ்ட்ரக்சரை தவிர்க்கவும்)
azd deploy

# இன்ஃப்ராஸ்ட்ரக்சர் ஏற்கனவே உள்ளதால் இது 'azd up' விட மிகவும் வேகமாகும்
```

## படி 7: பல சூழல்களை நிர்வகிக்கவும்

தயாரிப்புக்கு முன் மாற்றங்களை சோதிக்க ஒரு ஸ்டேஜிங் சூழலை உருவாக்கவும்:

```bash
# ஒரு புதிய ஸ்டேஜிங் சுற்றுச்சூழலை உருவாக்கவும்
azd env new staging

# ஸ்டேஜிங் சுற்றுச்சூழலுக்கு வெளியிடவும்
azd up

# டெவ் சுற்றுச்சூழலுக்குத் திரும்பவும்
azd env select dev

# அனைத்து சுற்றுச்சூழல்களையும் பட்டியலிடவும்
azd env list
```

### சூழல் ஒப்பிடுதல்
```bash
# வளர்ச்சி சூழலைப் பார்க்க
azd env select dev
azd show

# முன்-வெளியீட்டு சூழலைப் பார்க்க
azd env select staging
azd show
```

## படி 8: வளங்களை சுத்தம் செய்யவும்

பயிற்சி முடிந்ததும் தொடர்ச்சியான கட்டணங்களை தவிர்க்க தூய்மைப்படுத்தவும்:

```bash
# தற்போதைய சூழலுக்கான அனைத்து Azure வளங்களையும் நீக்கவும்
azd down

# உறுதிப்படுத்தல் இல்லாமல் வலியுறுத்தி நீக்கவும் மற்றும் மென்மையாக நீக்கப்பட்ட வளங்களை நிர்மூலமாக அகற்றவும்
azd down --force --purge

# குறிப்பிட்ட சுற்றுச்சூழலை நீக்கவும்
azd env select staging
azd down --force --purge
```

## பாரம்பரிய பயன்பாடு vs. AI-செயல்படுத்தப்பட்ட பயன்பாடு: ஒரே வேலைபாடு

நீங்கள் இப்பொழுது ஒரு பாரம்பரிய வலை பயன்பாட்டை பரிமாறியுள்ளீர்கள். ஆனால் நீங்கள் பிறகு Microsoft Foundry Models ஆதரவுள்ள ஒரு உரையாடல் பயன்பாட்டைப் பரிமாறினால் என்ன?

சிறந்த செய்தி: **வேலைபாடு ஒரே மாதிரியே இருக்கும்.**

| படி | பாரம்பரிய Todo பயன்பாடு | AI உரையாடல் பயன்பாடு |
|------|-------------------------|-----------------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

ஒன்றே வேறுபாடு நீங்கள் தொடங்கும் **டெம்ப்ளேட்** தான். AI டெம்ப்ளேட் கூடுதல் கூறமைப்பு (உதாரணமாக Microsoft Foundry Models வளம் அல்லது ஒரு AI Search குறியீடு போன்றவை) கொண்டிருக்கலாம், ஆனால் azd அவற்றை எல்லாவற்றையும் கையாளும். புதிய கட்டளைகளை கற்றுக்கொள்ளவோ, வேறொரு கருவியை பயன்படுத்தவோ, அல்லது பரிமாற்றத்தைப் பற்றி உங்கள் எண்ணத்தை மாற்றவோ தேவையில்லை.

இது azd இன் நிஜ அடிப்படைத் தத்துவம்: **ஒரே வேலைபாடு, எந்த பணிக்கும் சரி.** நீங்கள் இந்த பயிற்சியில் பயிற்சி பெற்ற திறன்கள் — ஆரம்பித்தல், பரிமாற்றம், கண்காணித்தல், மறுபரிமாற்றம் மற்றும் சுத்தப்படுத்துதல் — AI பயன்பாடுகளுக்கும் முகவரிகளுக்கும் சமமாகப் பொருந்தும்.

---

## நீங்கள் என்ன கற்றுக்கொண்டீர்கள்

வாழ்த்துக்கள்! நீங்கள் வெற்றிகரமாக:
- ✅ ஒரு டெம்ப்ளேட்டில் இருந்து azd திட்டத்தைத் துவக்கியுள்ளீர்கள்
- ✅ திட்ட அமைப்பையும் முக்கிய கோப்புகளையும் ஆராய்ந்துள்ளீர்கள்
- ✅ Azure இற்கு ஒரு முழு-ஸ்டாக் பயன்பாட்டை பரிமாற்றியுள்ளீர்கள்
- ✅ குறியீடு மாற்றங்களை செய்து மறுபரிமாற்றம் செய்துள்ளீர்கள்
- ✅ பல சூழல்களை நிர்வகித்துள்ளீர்கள்
- ✅ வளங்களை சுத்தம் செய்துள்ளீர்கள்

## 🎯 திறன் சரிபார்ப்பு பயிற்சிகள்

### பயிற்சி 1: வேறொரு டெம்ப்ளேட்டை பரிமாறவும் (15 நிமிடங்கள்)
**இலக்கு**: azd init மற்றும் பரிமாற்ற வேலைசூழலில் நிபுணத்துவத்தை தெளிவுபடுத்துதல்

```bash
# Python + MongoDB ஸ்டாக்கை முயற்சி செய்யவும்
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# பதிவேற்றத்தைச் சரிபார்க்கவும்
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# சுத்தம் செய்யவும்
azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] பயன்பாடு பிழைகளில்லாமல் பரிமாறப்படுகிறது
- [ ] உலாவியில் பயன்பாட்டு URL ஐ அணுக முடிகிறது
- [ ] பயன்பாடு சரியாக செயல்படுகிறது (todo சேர்க்க/நீக்க)
- [ ] அனைத்து வளங்களும் வெற்றிகரமாக சுத்தம் செய்யப்பட்டுவிட்டன

### பயிற்சி 2: கட்டமைப்பை தனிப்பயனாக்கவும் (20 நிமிடங்கள்)
**இலக்கு**: சூழல் மாறி கட்டமைப்பின் பயிற்சியை நடைமொழி செய்யுங்கள்

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

# தனிப்பயன் கட்டமைப்புடன் வெளியிடவும்
azd up
```

**வெற்றி அளவுகோல்கள்:**
- [ ] தனிப்பயன் சூழல் வெற்றிகரமாக உருவாக்கப்பட்டது
- [ ] சூழல் மாறிகள் அமைக்கப்பட்டு பெறக்கூடியவை
- [ ] தனிப்பயன் கட்டமைப்புடன் பயன்பாடு பரிமாறப்பட்டது
- [ ] பரிமாறிய பயன்பாட்டில் தனிப்பயன் அமைப்புகளை சரிபார்க்க முடிகிறது

### பயிற்சி 3: பல-சூழல் வேலைபாடு (25 நிமிடங்கள்)
**இலக்கு**: சூழல் நிர்வாகம் மற்றும் பரிமாற்றதிட்டங்களை கற்றுக்கொள்ளுதல்

```bash
# டெவ் சூழலை உருவாக்கவும்
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# டெவ் URL-ஐ குறிப்பிட்டு வைக்கவும்
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# ஸ்டேஜிங் சூழலை உருவாக்கவும்
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# ஸ்டேஜிங் URL-ஐ குறிப்பிட்டு வைக்கவும்
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# சூழல்களை ஒப்பிடவும்
azd env list

# இரு சூழல்களையும் பரிசோதனை செய்யவும்
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# இரு சூழல்களையும் சுத்தம் செய்யவும்
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] வெவ்வேறு கட்டமைப்புகளுடன் இரண்டு சூழல்கள் உருவாக்கப்பட்டன
- [ ] இரு சூழல்களும் வெற்றிகரமாக பரிமாறப்பட்டன
- [ ] `azd env select` பயன்படுத்தி சூழலுக்கு இடையே மாற்ற முடிகிறது
- [ ] சூழல் மாறிகள் சூழல்களுக்கு இடையே வேறுபடுகின்றன
- [ ] இரு சூழல்களையும் வெற்றிகரமாக சுத்தம் செய்துள்ளீர்கள்

## 📊 உங்கள் முன்னேற்றம்

**முற்றுப் பயன்பட்ட காலம்**: ~60-90 நிமிடங்கள்  
**கற்றுக்கொள்ளப்பட்ட திறன்கள்**:
- ✅ டெம்ப்ளேட்-அடிப்படையிலான திட்ட ஆரம்பம்
- ✅ Azure வளங்களின் வழங்கல்
- ✅ பயன்பாட்டு பரிமாற்ற வேலைப்பாடுகள்
- ✅ சூழல் நிர்வாகம்
- ✅ கட்டமைப்பு நிர்வாகம்
- ✅ வளங்கள் சுத்தப்படுத்தல் மற்றும் செலவு நிர்வாகம்

**அடுத்த நிலை**: முன்னேறிய கட்டமைப்பு மாதிரிகள் கற்க [Configuration Guide](configuration.md)!

## பொதுவான சிக்கல்களின் தீர்வு

### அங்கீகாரம் பிழைகள்
```bash
# Azure உடன் மறுபடியும் அங்கீகரிக்க
az login

# சந்தா அணுகலைச் சரிபார்க்க
az account show
```

### பரிமாற்ற தோல்விகள்
```bash
# டீபக் பதிவு செயல்பாட்டை இயக்கு
export AZD_DEBUG=true
azd up --debug

# Azure இல் பயன்பாட்டு பதிவுகளைப் பார்க்கவும்
azd monitor --logs

# Container Apps க்காக, Azure CLI ஐ பயன்படுத்தவும்:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### வல அல்லது உலா பெயர் மோதல்கள்
```bash
# ஒரு தனித்துவமான சூழல் பெயரைப் பயன்படுத்தவும்
azd env new dev-$(whoami)-$(date +%s)
```

### போர்ட்/நெட்வொர்க் பிரச்சினைகள்
```bash
# போர்ட்கள் கிடைக்கிறதா என்பதைச் சரிபார்க்கவும்
netstat -an | grep :3000
netstat -an | grep :3100
```

## அடுத்த படிகள்

இப்போது நீங்கள் உங்கள் முதல் திட்டத்தை முடித்துள்ளீர்கள், இந்த முன்னேறிய தலைப்புகளை ஆராயுங்கள்:

### 1. கூறமைப்பை தனிப்பயனாக்கவும்
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD அமைக்கவும்
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - முழுமையான CI/CD வேலைப்பாடுகள்
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - पाइப்லைன் கட்டமைப்பு

### 3. உற்பத்தி சிறந்த நடைமுறைகள்
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - பாதுகாப்பு, செயல்திறன் மற்றும் கண்காணித்தல்

### 4. மேலும் டெம்ப்ளேட்களை ஆராயவும்
```bash
# மாதிரிகளை வகைபடி உலாவுங்கள்
azd template list --filter web
azd template list --filter api
azd template list --filter database

# வித்தியாசமான தொழில்நுட்ப தொகுப்புகளை முயற்சி செய்யுங்கள்
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## கூடுதல் வளங்கள்

### கற்றல் பொருட்கள்
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### சமுதாயம் & ஆதரவு
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### டெம்ப்ளேட்கள் & உதாரணங்கள்
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**உங்கள் முதல் azd திட்டத்தை முடித்ததற்கு வாழ்த்துக்கள்!** இப்போது நீங்கள் தன்னம்பிக்கையுடன் Azure இல் அற்புதமான பயன்பாடுகளை கட்டமைத்து பரிமாற தயாராக இருக்கிறீர்கள்.

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநூல் முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: Chapter 1 - Foundation & Quick Start
- **⬅️ முந்தையது**: [Installation & Setup](installation.md)
- **➡️ அடுத்தது**: [Configuration](configuration.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **அடுத்த பாடம்**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியக்கமாக செய்யப்பட்ட மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான விளக்கங்கள் இருக்கலாம் என்பதை தயவுசெய்து மனதில் கொள்ளவும். அதில் உள்ள அசல் ஆவணம் அதன் சொந்த மொழியில் அதிகாரபூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பின் பயன்பாட்டால் ஏற்படும் எந்தவொரு தவறான புரிதலிற்கோ அல்லது தவறான விளக்கத்திற்கோ நாங்கள் பொறுப்பல்ல.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->