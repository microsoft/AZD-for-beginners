# உங்கள் முதல் திட்டம் - கைமுறைக் கற்கை

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் & விரைவு துவக்கம்
- **⬅️ முந்தையது**: [Installation & Setup](installation.md)
- **➡️ அடுத்தது**: [Configuration](configuration.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## அறிமுகம்

உங்கள் முதல் Azure Developer CLI திட்டத்திற்கு வரவேற்கிறோம்! azd பயன்படுத்தி Azure இல் ஒரு முழு ஸ்டாக் பயன்பாட்டை உருவாக்குதல், தள்ளிப்பரிமாறுதல் மற்றும் நிர்வகிப்பதை முழுமையாக கையேடு செய்யும் இந்த விரிவான கைமுறை பாடம் உங்களுக்கு உள்ளது. இதில் React முன்னமைப்புப் பகுதி, Node.js API பின்னமைப்பு மற்றும் MongoDB தரவுத்தொகுப்பு கொண்ட ஒரு செயல் todo பயன்பாட்டுடன் பணியாற்றுவீர்கள்.

## கற்கும் இலக்குகள்

இந்த பயிற்சியை முடித்த பிறகு, நீங்கள்:
- தளவமைப்புகளோடான azd திட்டத் துவக்க செயல்முறையை மாதிரிகள் மூலம் தெளிவாக கையாள முடியும்
- Azure Developer CLI திட்ட கட்டமைப்பை மற்றும் கட்டமைப்பு கோப்புகளை புரிந்துகொள்ளலாம்
- கட்டமைப்பை வழங்கி பயன்பாட்டை Azure க்கு முழுமையாக தள்ளிப்பரிமாற முடியும்
- பயன்பாட்டுப் புதுப்பிப்புகள் மற்றும் மீண்டும் தள்ளிப்பரிமாற்ற 전략ங்களை நடைமுறைப்படுத்த முடியும்
- மேம்பாடு மற்றும் ஸ்டேஜிங் போன்ற பல சூழல்களை நிர்வகிக்க முடியும்
- வளங்களை நீக்குதல் மற்றும் செலவுப்பிரச்சினைகளை நிர்வகிக்கும் முறைகளை பயன்படுத்த முடியும்

## கற்றலின் முடிவுகள்

முடித்தவுடன், நீங்கள் செய்யக்கூடியவை:
- மாதிரிகளிலிருந்து azd திட்டங்களை சுயமாக துவக்கி கட்டமைக்க முடியும்
- azd திட்ட கட்டமைப்புகளை திறந்து மாற்றங்களைச் செய்ய திறமை பெறுவீர்கள்
- ஒரே கட்டளைகளால் முழு ஸ்டாக் பயன்பாடுகளை Azure க்கு தள்ளிப்பரிமாற்றம் செய்ய முடியும்
- பொதுவான தள்ளிப்பரிமாற்றப் பிழைகள் மற்றும் அத்தாட்சிப்படுத்தல் சிக்கல்களை தெளிவுபடுத்த முடியும்
- வெவ்வேறு தள்ளிப்பரிமாற்ற நிலைகளுக்காக பல Azure சூழல்களை நிர்வகிக்க முடியும்
- பயன்பாட்டு புதுப்பிப்புகளுக்கான தொடர்ச்சியான தள்ளிப்பரிமாற்ற பணிவழிகளை நடைமுறைப்படுத்த முடியும்

## துவங்குதல்

### முன் அவசியங்கள் சரிபார்ப்பு பட்டியல்
- ✅ Azure Developer CLI நிறுவப்பட்டுள்ளது ([Installation Guide](installation.md))
- ✅ Azure CLI நிறுவப்பட்டு அத்தாட்சியடைந்துள்ளது
- ✅ உங்கள் கணினியில் Git நிறுவப்பட்டுள்ளது
- ✅ Node.js 16+ (இந்த பயிற்சிக்காக)
- ✅ Visual Studio Code (பரவலாக பரிந்துரைக்கப்படுகிறது)

### உங்கள் அமைப்பை சரிபார்க்கவும்
```bash
# azd நிறுவலைக் சோதிக்கவும்
azd version
```
### Azure அத்தாட்சிப்படுத்தலை சரிபார்க்கவும்

```bash
az account show
```

### Node.js பதிப்பை சரிபார்க்கவும்
```bash
node --version
```

## படி 1: ஒரு மாதிரியை தேர்ந்தெடுத்து துவங்குங்கள்

React முன்னமைப்பும் Node.js API பின்னமைப்பும் கொண்ட பிரபல todo பயன்பாடு மாதிரியுடன் தொடங்குவோம்.

```bash
# கிடைக்கும் வார்ப்புரைகளை உலாவவும்
azd template list

# todo செயலி வார்ப்புரையை துவக்கவும்
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# அறிவுறுத்தல்களை பின்பற்றவும்:
# - சுற்றுச்சூழல் பெயரை உள்ளிடவும்: "dev"
# - ஒரு சந்தாவை தேர்ந்தெடுக்கவும் (பல இருந்தால்)
# - ஒரு மண்டலத்தை தேர்ந்தெடுக்கவும்: "East US 2" (அல்லது உங்கள் விருப்பமான மண்டலம்)
```

### என்ன நடந்தது?
- மாதிரி குறியீட்டை உங்கள் உள்ளூர் அடைவைக்குள் பதிவிறக்கம் செய்தது
- சேவை வரையறைகளை கொண்ட `azure.yaml` கோப்பை உருவாக்கியது
- `infra/` அடைவில் கட்டமைப்புக் குறியீட்டை அமைத்தது
- ஒரு சூழல் கட்டமைப்பை உருவாக்கியது

## படி 2: திட்ட கட்டமைப்பை ஆராயுங்கள்

azd எங்களுக்கு உருவாக்கியவற்றை இங்கு பார்க்கலாம்:

```bash
# திட்டத்தின் அமைப்பை பார்க்க
tree /f   # விண்டோஸ்
# அல்லது
find . -type f | head -20   # மெக் ஓஎஸ்/லினக்ஸ்
```

உங்களுக்கு கீழே தெரியும்:
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
# திட்டத்தின் கட்டமைப்பை பார்க்கவும்
cat azure.yaml
```

**infra/main.bicep** - கட்டமைப்பு வரையறை:
```bash
# அடிக்கட்டமைப்பு குறியீட்டை பார்க்கவும்
head -30 infra/main.bicep
```

## படி 3: உங்கள் திட்டத்தை தனிப்பயனாக்குங்கள் (விருப்பமானது)

தள்ளிப்பரிமாற்றத்திற்கு முன், நீங்கள் பயன்பாட்டை தனிப்பயனாக்கலாம்:

### முன்னமைப்பைப் பதிப்பி
```bash
# React செயலி கூறைத் திறக்கவும்
code src/web/src/App.tsx
```

ஒரு எளிய மாற்றம் செய்யவும்:
```typescript
// தலைப்பைக் கண்டறிந்து அதை மாற்றவும்
<h1>My Awesome Todo App</h1>
```

### சூழல் மாறிலிகளை அமைக்கவும்
```bash
# தனிப்பயன் சூழல் மாறிலிகளை அமைக்கவும்
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# அனைத்து சூழல் மாறிலிகளையும் காண்க
azd env get-values
```

## படி 4: Azure க்கு தள்ளிப்பரிமாற்றம் செய்க

இப்போது சுவாரஸ்யமான பகுதி - அனைத்தையும் Azure க்கு தள்ளிப்பரிமாற்றம் செய்யுங்கள்!

```bash
# அடித்தள அமைப்பையும் பயன்பாட்டையும் நிறுவு
azd up

# இந்த கட்டளை இதை செய்யும்:
# 1. Azure வளங்களை ஒதுக்குதல் (App Service, Cosmos DB, மற்றும் பிற)
# 2. உங்கள் பயன்பாட்டை கட்டமைக்கும்
# 3. ஒதுக்கப்பட்ட வளங்களில் உங்கள் பயன்பாட்டை அமல்படுத்தும்
# 4. பயன்பாட்டின் URL-ஐ காட்டும்
```

### தள்ளிப்பரிமாற்றத்தின் போது என்ன நடக்கிறது?

`azd up` கட்டளை இந்த படிகளை மேற்கொள்கிறது:
1. **Provision** (`azd provision`) - Azure வளங்களை உருவாக்குகிறது
2. **Package** - உங்கள் பயன்பாட்டு குறியீட்டை கட்டமைக்கிறது
3. **Deploy** (`azd deploy`) - குறியீட்டை Azure வளங்களுக்கு பதிவேற்றுகிறது

### எதிர்பார்க்கப்படும் வெளியீடு
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## படி 5: உங்கள் பயன்பாட்டைக் சோதிக்கவும்

### உங்கள் பயன்பாட்டை அணுகுதல்
தள்ளிப்பரிமாற்ற வெளியீட்டில் கொடுக்கப்பட்ட URL ஐ கிளிக் செய்யவும், அல்லது எப்போதும் இதைப் பெறவும்:
```bash
# பயன்பாட்டின் முடிவுப் புள்ளிகளைப் பெறவும்
azd show

# உங்கள் உலாவியில் பயன்பாட்டைத் திறக்கவும்
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo பயன்பாட்டைப் பார்க்க சோதனை செய்யவும்
1. **ஒரு todo உருப்படியை சேர்க்கவும்** - "Add Todo" ஐ கிளிக் செய்து ஒரு பணியை உள்ளிடவும்
2. **உரை முடித்ததாக குறிக்கவும்** - முடிக்கப்பட்ட உருப்படிகளை குறிக்கச் சாவியை உடைக்கவும்
3. **உருப்படிகளை நீக்கவும்** - தேவையில்லாத todos-ஐ நீக்கவும்

### உங்கள் பயன்பாட்டைக் கண்காணிக்கவும்
```bash
# உங்கள் வளங்களுக்காக Azure போர்டலைத் திறக்கவும்
azd monitor

# பயன்பாட்டு பதிவுகளைப் பார்க்கவும்
azd monitor --logs

# நேரடி அளவுருக்களைப் பார்க்கவும்
azd monitor --live
```

## படி 6: மாற்றங்கள் செய்து மீண்டும் தள்ளிப்பரிமாற்றம் செய்யுங்கள்

ஒரு மாற்றம் செய்து அதை எப்படி புதுப்பிக்க முடிவதை பார்க்கலாம்:

### API-வை மாற்றவும்
```bash
# API குறியீட்டை திருத்தவும்
code src/api/src/routes/lists.js
```

ஒரு தனிப்பட்ட பதில் தலைப்பை சேர்:
```javascript
// ஒரு வழி கையாளியை கண்டறிந்து சேர்க்கவும்:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### கோடு மாற்றங்களை மட்டும் தள்ளிப்பரிமாற்றம் செய்யவும்
```bash
# பயன்பாட்டு குறியீட்டையே மட்டும் வெளியிடுங்கள் (அமைப்புகளைத் தவிர்க்கவும்)
azd deploy

# அமைப்புகள் ஏற்கனவே உள்ளதால் இது 'azd up' விட மிகவும் வேகமாகும்
```

## படி 7: பல சூழல்களை நிர்வகிக்கவும்

உற்பத்தியقبلம் முன்பு மாற்றங்களை சோதிக்க ஒரு ஸ்டேஜிங் சூழலை உருவாக்குங்கள்:

```bash
# புதிய ஸ்டேஜிங் சூழலை உருவாக்கவும்
azd env new staging

# ஸ்டேஜிங் சூழலுக்கு வெளியிடவும்
azd up

# dev சூழலுக்கு மீண்டும் மாற்றவும்
azd env select dev

# எல்லா சூழல்களையும் பட்டியலிடவும்
azd env list
```

### சூழல் ஒப்பீடு
```bash
# வளர்ச்சி சூழலை காண்க
azd env select dev
azd show

# ஸ்டேஜிங் சூழலை காண்க
azd env select staging
azd show
```

## படி 8: வளங்களை சுத்தப்படுத்துங்கள்

பயிற்சி முடிந்தவுடன் தொடர்ந்து பணம் செலவதற்காக வளங்களை சுத்தப்படுத்துங்கள்:

```bash
# தற்போதைய சூழலுக்கான அனைத்து Azure வளங்களையும் அழிக்கவும்
azd down

# உறுதிப்படுத்தாமே வலியாக அழிக்கவும் மற்றும் மென்மையாக நீக்கப்பட்ட வளங்களை நிர்மூலமாக அகற்றவும்
azd down --force --purge

# குறிப்பிட்ட சூழலை நீக்கவும்
azd env select staging
azd down --force --purge
```

## நீங்கள் என்ன கற்றுக்கொண்டீர்கள்

வாழ்த்து! நீங்கள் வெற்றிகரமாக:
- ✅ ஒரு மாதிரியிலிருந்து azd திட்டத்தை துவக்கி இருந்தீர்கள்
- ✅ திட்ட கட்டமைப்பையும் முக்கிய கோப்புகளையும் ஆராய்ந்தீர்கள்
- ✅ ஒரு முழு ஸ்டாக் பயன்பாட்டை Azure க்கு தள்ளிப்பரிமாற்றம் செய்தீர்கள்
- ✅ கோடு மாற்றங்களை செய்தும் மீண்டும் தள்ளிப்பரிமாற்றம் செய்தீர்கள்
- ✅ பல சூழல்களை நிர்வகித்தீர்கள்
- ✅ வளங்களை சுத்தப்படுத்தி நிறுத்திவிட்டீர்கள்

## 🎯 திறன் சோதனை பயிற்சிகள்

### பயிற்சி 1: வேறொரு மாதிரியை தள்ளிப்பரிமாற்றம் செய்க (15 நிமிடங்கள்)
**க குறிக்கோள்**: azd init மற்றும் தள்ளிப்பரிமாற்ற செயல்முறை மீது தேர்ச்சி காட்டல்

```bash
# Python + MongoDB ஸ்டேக் முயற்சி செய்து பார்க்கவும்
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# பதிவேற்றத்தை சரிபார்க்கவும்
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# சுத்தப்படுத்தவும்
azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] பயன்பாடு பிழையின்றி தள்ளிப்பரிமாற்றம் ஆகவேண்டும்
- [ ] உலாவியில் பயன்பாட்டு URL ஐ அணுக முடியும்
- [ ] பயன்பாடு சரியாக செயல்பட வேண்டும் (todo-களை சேர்க்க/அகற்ற)
- [ ] அனைத்து வளங்களும் வெற்றிகரமாக சுத்தப்படுத்தப்பட்டிருக்க வேண்டும்

### பயிற்சி 2: கட்டமைப்பை தனிப்பயனாக்குக (20 நிமிடங்கள்)
**குறிக்கோள்**: சூழல் மாறிலி கட்டமைப்பில் பயிற்சி பெறுதல்

```bash
cd my-first-azd-app

# தனிப்பயன் சூழலை உருவாக்கவும்
azd env new custom-config

# தனிப்பயன் மாறிகளை அமைக்கவும்
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# மாறிகள் சரிபார்க்கவும்
azd env get-values | grep APP_TITLE

# தனிப்பயன் கட்டமைப்புடன் வெளியிடவும்
azd up
```

**வெற்றி அளவுகோல்கள்:**
- [ ] தனிப்பயன் சூழல் வெற்றிகரமாக உருவானது
- [ ] சூழல் மாறிலிகள் அமைக்கப்பட்டு பெறக்கூடியவையாக உள்ளன
- [ ] தனிப்பயன் கட்டமைப்புடன் பயன்பாடு தள்ளிப்பரிமாற்றம் செய்யப்பட்டது
- [ ] தள்ளிப்பரியலிக்கப்பட்ட பயன்பாட்டில் தனிப்பயன் அமைப்புகளை உறுதிசெய்ய முடியும்

### பயிற்சி 3: பன்முயற்சி-சூழல் பணிமுறை (25 நிமிடங்கள்)
**குறிக்கோள்**: சூழல் மேலாண்மை மற்றும் தள்ளிப்பரிமாற்றத் தந்திரங்கள் மீது தகுதி பெறுதல்

```bash
# டெவ் சூழலை உருவாக்கவும்
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# டெவ் URL-ஐ பதிவு செய்யவும்
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# ஸ்டேஜிங் சூழலை உருவாக்கவும்
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# ஸ்டேஜிங் URL-ஐ பதிவு செய்யவும்
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# சூழல்களை ஒப்பிடவும்
azd env list

# இரு சூழல்களையும் சோதிக்கவும்
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# இரு சூழல்களையும் சுத்தம் செய்யவும்
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] வெவ்வேறு கட்டமைப்புகளுடன் இரண்டு சூழல்கள் உருவாக்கப்பட்டன
- [ ] இரு சூழல்களும் வெற்றிகரமாக தள்ளிப்பரிமாற்றம் செய்யப்பட்டன
- [ ] `azd env select` பயன்படுத்தி சூழலுக்கு இடையே மாற முடியும்
- [ ] சூழல் மாறிலிகள் சூழலுக்கு மாறுபட்டவையாக உள்ளன
- [ ] இரண்டு சூழல்களையும் வெற்றிகரமாக சுத்தப்படுத்தினீர்கள்

## 📊 உங்கள் முன்னேற்றம்

**நீங்கள் செலவிட்ட நேரம்**: ~60-90 நிமிடங்கள்  
**பெறப்பட்ட திறன்கள்**:
- ✅ மாதிரிப்படி திட்டத் துவக்கம்
- ✅ Azure வளங்கள் வழங்கல்
- ✅ பயன்பாட்டு தள்ளிப்பரிமாற்ற பணிவழிகள்
- ✅ சூழல் மேலாண்மை
- ✅ கட்டமைப்பு மேலாண்மை
- ✅ வளங்கள் சுத்தப்படுத்துதல் மற்றும் செலவு மேலாண்மை

**அடுத்த நிலை**: மேம்பட்ட கட்டமைப்பு வடிவிமுறைகளை கற்பதற்கு [Configuration Guide](configuration.md) க்கு நீங்கள் தயாராக உள்ளீர்கள்!

## பொதுவான சிக்கல்களை தீர்க்குதல்

### அத்தாட்சிப்படுத்தல் பிழைகள்
```bash
# Azure உடன் மீண்டும் அங்கீகாரிக்கவும்
az login

# சப்ஸ்கிரிப்ஷன் அணுகலைச் சரிபார்க்கவும்
az account show
```

### தள்ளிப்பரிமாற்றம் தோல்விகள்
```bash
# டீபக் பதிவுகளை செயல்படுத்தவும்
export AZD_DEBUG=true
azd up --debug

# Azure இல் பயன்பாட்டு பதிவுகளைப் பார்க்கவும்
azd monitor --logs

# Container Apps க்காக Azure CLI ஐ பயன்படுத்தவும்:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### வள பெயர் மோதல்கள்
```bash
# தனித்துவமான சூழல் பெயரை பயன்படுத்தவும்
azd env new dev-$(whoami)-$(date +%s)
```

### போர்ட்/நெட்வொர்க் சிக்கல்கள்
```bash
# போர்ட்கள் கிடைக்கிறதா என்பதைச் சரிபார்க்கவும்
netstat -an | grep :3000
netstat -an | grep :3100
```

## அடுத்த படிகள்

இப்போது உங்கள் முதல் திட்டத்தை முடித்துவிட்டு, இந்த மேம்பட்ட தலைப்புகளை ஆராயுங்கள்:

### 1. கட்டமைப்பை தனிப்பயனாக்கும்
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD அமைக்கவும்
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - முழு CI/CD பணிவழிகள்
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - பைப்லைன் கட்டமைப்பு

### 3. உற்பத்தி சிறந்த பழக்கங்கள்
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - பாதுகாப்பு, செயல்திறன் மற்றும் கண்காணிப்பு

### 4. மேலும் மாதிரிகள் ஆராய்க
```bash
# வகை வாரியாக மாதிரிகளை உலாவவும்
azd template list --filter web
azd template list --filter api
azd template list --filter database

# பல்வேறு தொழில்நுட்ப ஸ்டாக்களை முயற்சி செய்யவும்
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## கூடுதல் வளங்கள்

### கற்கும் பொருட்கள்
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### சமுதாயம் & ஆதரவு
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### மாதிரிகள் & உதாரணங்கள்
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**உங்கள் முதல் azd திட்டத்தை முடித்ததற்கு வாழ்த்துக்கள்!** நீங்கள் இனி आत्मநம்பிக்கையுடன் Azure இல் அற்புதமான பயன்பாடுகளை கட்டி தள்ளிப்பரிமாற்ற தயாராக இருக்கிறீர்கள்.

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் & விரைவு துவக்கம்
- **⬅️ முந்தையது**: [Installation & Setup](installation.md)
- **➡️ அடுத்தது**: [Configuration](configuration.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **அடுத்த பாடம்**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்கிறோம்; இருப்பினும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான பொருள் விளக்கங்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனிக்கவும். ஆவணத்தின் அசல் மொழியில் உள்ள பதிப்பே அதிகாரப்பூர்வ மூலமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பின் பயன்பாட்டால் ஏற்படும் எந்த தவறான புரிதல்களுக்கோ அல்லது தவறான பொருள் விளக்கங்களுக்கோ நாங்கள் பொறுப்பேற்க மாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->