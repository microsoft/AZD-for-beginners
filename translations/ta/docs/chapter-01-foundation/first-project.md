# உங்கள் முதல் திட்டம் - நடைமுறை கையேடு

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பக்காரர்களுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் & துவக்கம்
- **⬅️ முந்தையது**: [நிறுவுதல் மற்றும் அமைப்பு](installation.md)
- **➡️ அடுத்தது**: [உங்கள் சொந்த பயன்பாட்டை கொண்டு வாருங்கள்](bring-your-own-app.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 2: AI-முதன்மை மேம்பாடு](../chapter-02-ai-development/microsoft-foundry-integration.md)

## அறிமுகம்

உங்கள் முதல் Azure Developer CLI திட்டத்திற்கு வரவேற்கிறோம்! நீங்கள் React முன்னணி, Node.js API மற்றும் Azure Cosmos DB கொண்ட todo பயன்பாட்டை வெளியிடப்போகிறீர்கள். இந்த வடிவமைப்பு வரலாற்று பெயரான `todo-nodejs-mongo` ஐப் பாதுகாத்துள்ளது; அதன் தற்போதைய கட்டமைப்பில் Cosmos DB NoSQL ஆக உள்ளது, ஆகவே பதிவிறக்கிய README மற்றும் `infra/` ஐ பரிசீலித்து பெயரிலிருந்து தரவுத்தள API யை ஊகிக்க வேண்டாம்.

> 2026 நவംബரில் `azd 1.37.2` மற்றும் பொதுமக்கள் வடிவமைப்புடன் மதிப்பாய்வு செய்யப்பட்டு உள்ளது. கீழே உள்ள உதாரணங்கள் Bash பயன்படுத்துகிறது; JSON அகற்றலும் `jq` தேவை. Azure வெளியீடுகளுக்கு கட்டணங்கள் உண்டு, இந்த மதிப்பாய்வில் செயல்படுத்தப்படவில்லை.

## கற்றல் இலக்குகள்

இந்த கையேட்டை முடிப்பதன் மூலம் நீங்கள்:
- azd திட்டம் துவக்க முறையை வடிவமைப்புகளை பயன்படுத்தி ஆற்றல் பெறுவீர்கள்
- Azure Developer CLI திட்ட அமைப்பு மற்றும் கட்டமைப்பு கோப்புகளை புரிந்து கொள்வீர்கள்
- முழுமையான பயன்பாட்டை Azureக்கு முழுமையாக்கி வெளியீடு செய்வீர்கள்
- பயன்பாட்டு புதுப்பிப்புகள் மற்றும் மீண்டும் வெளியீட்டு தந்திரங்களை செயல்படுத்துவீர்கள்
- பல பருவங்களுக்கு மேம்பாட்டிற்கும் சோதனைக்கும் மேலாண்மை செய்வீர்கள்
- வளங்கள் சுத்தம் செய்யல் மற்றும் செலவு மேலாண்மை முறைகளைப்பயன்படுத்துவீர்கள்

## கற்றல் முடிவுகள்

முடிவில், நீங்கள் செய்யக்கூடியவை:
- வடிவமைப்புகளில் இருந்து azd திட்டங்களை தனியாக துவக்கி கட்டமைக்கும்
- azd திட்ட அமைப்புகளை திறனாக வழிசென்று திருத்தும்
- ஒரே கட்டளைகளுடன் முழு மடக்கு பயன்பாடுகளை Azureக்கு வெளியீடு செய்வது
- பொதுவான வெளியீட்டு பிரச்சனைகளை மற்றும் ஆதரவு பிரச்சனைகளை பரிசீலனை செய்யும்
- வெவ்வேறு வெளியீட்டு நிலைகளுக்கான பல Azure பருவங்களை மேலாண்மை செய்வது
- பயன்பாட்டு புதுப்பிப்புகளுக்கான தொடர்ந்த வெளியீட்டு பணிகளை செயல்படுத்துவது

## துவக்கம்

### முன் தேவைகளின் சரிபார்ப்பு பட்டியல்
- ✅ Azure Developer CLI நிறுவப்பட்டது ([நிறுவல் வழிகாட்டி](installation.md))
- ✅ AZD அங்கீகாரம் முடிந்தது `azd auth login` உடன்
- ✅ உங்கள் கணினியில் Git நிறுவப்பட்டுள்ளது
- ✅ Node.js 22 LTS (அல்லது பதிவிறக்கும் வடிவமைப்புக்கு தேவையான ஆதரவு பதிப்பு)
- ✅ Visual Studio Code (பரிந்துரைக்கப்படுகிறது)

தொடருவதற்கு முன், தொளுநிரல் வேரில் இருந்து அமைப்பு சரிபார்ப்பாளரை இயக்கவும்:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### உங்கள் அமைப்பை சரிபார்க்கவும்
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### விருப்பமான Azure CLI அங்கீகாரத்தை சரிபார்க்கவும்

```bash
az account show
```

### Node.js பதிப்பை பரிசீலனை செய்யவும்
```bash
node --version
```

## படி 1: ஒரு வடிவமைப்பை தேர்வு செய்து துவக்கவும்

React முன்னணி மற்றும் Node.js API பின்புறம் கொண்ட பிரபல todo பயன்பாட்டு வடிவமைப்புடன் தொடங்குவோம்.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### என்ன நடந்தது?
- உங்கள் உள்ளூர் அடைவிற்கு வடிவமைப்புக் கோடு பதிவிறக்கம் செய்யப்பட்டது
- சேவை வரையறைகளுடன் `azure.yaml` கோப்பு உருவாக்கப்பட்டது
- கட்டமைப்பு கோடு `infra/` அடைவில் அமைக்கப்பட்டது
- ஒரு சூழல் அமைப்பு உருவாக்கப்பட்டது

## படி 2: திட்ட அமைப்பைக் கண்டறிக

azd எங்களுக்கு உருவாக்கியது என்ன என்று பார்ப்போமாக்கள்:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

நீங்கள் காண்பீர்கள்:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### புரிந்து கொள்ள முக்கிய கோப்புகள்

**azure.yaml** - உங்கள் azd திட்டத்தின் மையம்:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - கட்டமைப்பு வரையறை:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## படி 3: உங்கள் திட்டத்தை தனிப்பயனாக்குங்கள் (விருப்பம்)

வெளியிடுவதுக்கு முன், நீங்கள் பயன்பாட்டை தனிப்பயனாக்கலாம்:

### முன்னணி மாற்றங்கள் செய்யவும்
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

ஒரு எளிய மாற்றம் செய்யவும்:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### சூழல் மாறிலிகளை அமைக்கவும்
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

இந்த இரண்டு தனிப்பட்ட மதிப்புகள் உள்ளூர் சேமிப்பை மட்டுமே காட்டுகின்றன. ஸ்டாக் வடிவமைப்பு `WEBSITE_TITLE` அல்லது `API_VERSION` ஐப் பயன்படுத்தாது, எனவே அவை பயன்பாட்டை மாற்றுவதில்லை. மேலேயுள்ள தெளிவான மூல திருத்தம் காட்டப்படும் தலைப்பை மாற்றுகிறது.

## படி 4: Azureக்கு வெளியிடு

இப்போது சாகசமான பகுதி - எல்லாவற்றையும் Azureக்கு வெளியிடுங்கள்!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### வெளியீட்டின் போது என்ன நடக்கிறது?

பணிப்புழு கட்டமைப்பைக் கொடுக்கிறது மற்றும் கோடை தொகுத்து/வெளியிடுகிறது. துல்லியமான வரிசையை `workflows.up` மூலம் `azure.yaml` இல் தனிப்பயனாக்கலாம்; இந்த வடிவமைப்பு வழங்கிய பின் வெளியிடு என குறிப்பிடுகிறது. ஒவ்வொரு வடிவமைப்புக்கும் ஒன்றான பொதுவான கட்டம் வரிசையில் நம்ப வேண்டாம்.

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

### உங்கள் பயன்பாட்டை அணுகவும்
வெளியீட்டு வெளியீட்டில் வழங்கப்பட்ட URL ஐ கிளிக் செய்யவும் அல்லது எப்போதும் பெறவும்:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Todo பயன்பாட்டை சோதிக்கவும்
1. **ஒரு todo உருப்படியை சேர்க்கவும்** - "Add Todo" கிளிக் செய்து செயலை உள்ளிடவும்
2. **முடிந்ததாக குறிகள்** - முடிந்த உருப்படிகளை சரிபார்க்கவும்
3. **உருப்படிகளை நீக்கவும்** - தேவையில்லாத todo களை அகற்றவும்

### உங்கள் பயன்பாட்டை கண்காணிக்கவும்
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ உங்கள் வெளியீட்டை சரிபார்க்கவும்

தொடரும் முன், இதோ ஒரு விரைவு சரிபார்ப்புப் பட்டியலை இயக்கி எல்லாம் செயல்படுவதை உறுதிப்படுத்துங்கள் — "வெளியீடு வெற்றி" என்று நினைத்துக்கொள்ளாதீர்கள் "பயன்பாடு சரியாக வருகிறது" என்று பொருளாகாது:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**வெளியீடு சரிபார்க்கப்படும் போது:**
- ✅ `azd show` தொடர்பு கொள்ளக்கூடிய முடிவு URL ஐ பட்டியலிடுகிறது
- ✅ அந்த URL உங்கள் உலாவியில் பிழையின்றி திறக்கிறது
- ✅ முக்கிய அம்சங்கள் செயல்படுகின்றன (சேர்க்க/முடிக்க/நீக்க)
- ✅ `azd monitor --logs` எந்த எதிர்பாராத பிழைகளும் இல்லாமல் கோரிக்கைகளை காட்டுகிறது

எதையும் தவற விட்டால் [அத்தியாயம் 7: பிரச்சனை தீர்வு](../chapter-07-troubleshooting/README.md) செல்லவும்.

## படி 6: மாற்றங்கள் செய்து மீண்டும் வெளியிடு

ஒரு மாற்றம் செய்து எப்படிப் புதுப்பிப்பது எளிது என்று காண்போம்:

### API ஐ மாற்றவும்
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

ஒரு தனிப்பட்ட பதில் தலைப்பைச் சேர்க்கவும்:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### கோடு மாற்றங்களையே வெளியிடவும்
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## படி 7: பல பருவங்களை நிர்வகிக்கவும்

உற்பத்திக்குமுன் மாற்றங்களை சோதிக்க ஒரு சோதனை பருவத்தை உருவாக்கவும்:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### பருவ ஒப்பீடு
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## படி 8: வளங்களை சுத்தம் செய்க

சோதனை முடிந்தவுடன், தொடர்ச்சியான கட்டணங்களைத் தவிர்க்க சுத்தப்படுத்துங்கள்:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## பாரம்பரிய பயன்பாடு vs. AI அரசு பயன்பாடு: ஒரே பணிப்புழு

நீங்கள் இ刚部署了一个传统的网页应用程序。但是如果您想部署一个由微软Foundry模型支持的聊天AI应用程序呢？

நல்ல செய்தி: **பணிப்புழு ஒரே மாதிரியானது.**

| படி | பாரம்பரிய Todo பயன்பாடு | AI அரட்டை பயன்பாடு |
|------|-----------------|-------------|
| துவக்கம் (காலி அடைவு) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| அங்கீகாரம் | `azd auth login` | `azd auth login` |
| வெளியீடு | `azd up` | `azd up` |
| கண்காணிப்பு | `azd monitor` | `azd monitor` |
| சுத்தம் செய்தல் | `azd down --force --purge` | `azd down --force --purge` |

வாழ்க்கை சுழற்சி கட்டளைகள் ஒன்றே, ஆனால் முன் தேவைகள் வித்தியாசம். ஒரு AI வடிவமைப்பு மாதிரி அணுகல், பிராந்திய அளவுகோல், தரவு நுட்பம் மற்றும் கூடுதல் கட்டமைப்பு தேவைப்படலாம். வெளியீட்டு முன் README ஐ படியுங்கள்; `azd up` இல் கேட்கப்படாத அனுமதிகள் அல்லது அளவுகோல் கிடைக்காது.

azd  இன் முக்கியக் கொள்கை: **ஒரே பணிப்புழு, வேறு வேறு பணி.** இந்த பயிற்சியில் நீங்கள் திருமாதித்த திறன்கள் — துவக்கம், வெளியீடு, கண்காணிப்பு, மீண்டும் வெளியீடு மற்றும் சுத்தப்படுத்துதல் — AI பயன்பாடுகளுக்கும் குறிகள் மற்றும் முகவர்களுக்கும் பிரமாதமாக பொருந்தும்.

---

## நீங்கள் கற்றுக்கொண்டீர்கள்

வாழ்த்துக்கள்! நீங்கள் வெற்றிகரமாக:
- ✅ ஒரு azd திட்டத்தை வடிவமைப்பிலிருந்து துவக்கியீர்கள்
- ✅ திட்ட அமைப்பையும் முக்கிய கோப்புகளையும் கண்டறிந்தீர்கள்
- ✅ Azureக்கு முழு மேடை பயன்பாட்டை வெளியீடு செய்தீர்கள்
- ✅ கோடு மாற்றங்கள் செய்து மீண்டும் வெளியீடு செய்தீர்கள்
- ✅ பல பருவங்களை நிர்வகித்தீர்கள்
- ✅ வளங்களை சுத்தம் செய்தீர்கள்

## 🎯 திறன் சரிபார்ப்பு பயிற்சிகள்

### பயிற்சி 1: வேறு வடிவமைப்பை வெளியிடுக (15 நிமிடங்கள்)
**இலக்கு**: azd init மற்றும் வெளியீட்டு பணியுறையை நுட்பமாக கையாள்வது

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] பயன்பாடு பிழைகள் இல்லாமல் வெளியிடப்படுகிறது
- [ ] உலாவியில் பயன்பாட்டு URL ஐ அணுக முடியும்
- [ ] பயன்பாடு சரி செயல்படுகிறது (சேர்க்க/நீக்கு todo)
- [ ] அனைத்து வளங்களும் வெற்றிகரமாக சுத்தம் செய்யப்பெற்றது

### பயிற்சி 2: கட்டமைப்பை தனிப்பயனாக்கவும் (20 நிமிடங்கள்)
**இலக்கு**: இயங்கும் சூழலில் தவறிக்கொள்ளாமல் உள்ளூர் மதிப்பு சேமிப்பைப் பழகுதல்

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**வெற்றி அளவுகோல்கள்:**
- [ ] தனிப்பயன் சூழல் வெற்றிகரமாக உருவாக்கப்பட்டது
- [ ] சூழல் மாறிலிகள் அமைக்கப்பட்டு பெறக்கூடியவை
- [ ] `azd env get-value APP_TITLE` `My Custom Todo App` ஐ அச்சிடுகிறது
- [ ] இந்த மதிப்புகள் ஸ்டாக் பயன்பாட்டை மாற்றுவதில்லை என விளக்கலாம், சொருகோடு/கட்டமைப்பு பயன்படுத்தவில்லை என்பதால்

### பயிற்சி 3: பல் சூழல் பணியுறை (25 நிமிடங்கள்)
**இலக்கு**: சூழல் மேலாண்மையும் வெளியீட்டு திட்டங்களும் நுட்பமாக கையாளல்

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**வெற்றி அளவுகோல்கள்:**
- [ ] இரண்டு சூழல்கள் வெவ்வேறு கட்டமைப்புகளுடன் உருவாக்கப்பட்டன
- [ ] இரு சூழல்களும் வெற்றிகரமாக வெளியிடப்பட்டன
- [ ] `azd env select` பயன்படுத்தி சூழல்கள் மாறிக்கொள்வது இயலும்
- [ ] இரண்டு சூழல்களுக்கும் மாறிலிகள் வேறுபடுகின்றன
- [ ] இரு சூழல்களும் வெற்றிகரமாக சுத்தம் செய்யப்பட்டன

## 📊 உங்கள் முன்னேற்றம்

**கட்டணம் செலுத்திய நேரம்**: ~60-90 நிமிடங்கள்  
**நேர்ந்திருக்கும் திறன்கள்**:
- ✅ வடிவமைப்பின் அடிப்படையில் திட்டத் துவக்கம்
- ✅ Azure வளங்களின் செயலாக்கம்
- ✅ பயன்பாட்டு வெளியீட்டு பணியுறைகள்
- ✅ சூழல் மேலாண்மை
- ✅ கட்டமைப்பு மேலாண்மை
- ✅ வளம் சுத்தம்செய்தல் மற்றும் செலவு மேலாண்மை

**அடுத்த கட்டம்**: முன்னேற்றமான கட்டமைப்பு வடிவமைப்புகளை கற்றுக்கொள்ள [Configuration Guide](../chapter-03-configuration/configuration.md) தயாராக இருக்கிறீர்கள்!

## சாதாரண பிரச்சனைகள்

### அங்கீகார பிழைகள்
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### வெளியீடு தோல்விகள்
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### வளப் பெயர் முரண்பாடுகள்
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### போர்ட்/நெட்வொர்க் பிரச்சனைகள்
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## அடுத்த படிகள்

உங்கள் முதல் திட்டத்தை முடித்துள்ளதால், இந்த மேம்பட்ட தலைப்புகளை ஆராயவும்:

### 1. கட்டமைப்பை தனிப்பயனாக்கு
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [தரவுத்தள கட்டமைப்பைச் சேர்க்கவும்](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD அமைக்கவும்
- [வெளியீட்டு வழிகாட்டி](../chapter-04-infrastructure/deployment-guide.md) - முழு CI/CD பணியுறைகள்
- [Azure Developer CLI ஆவணங்கள்](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - குழாய் அமைப்பு

### 3. உற்பத்தி சிறந்த நடைமுறைகள்
- [வெளியீட்டு வழிகாட்டி](../chapter-04-infrastructure/deployment-guide.md) - பாதுகாப்பு, செயல்திறன் மற்றும் கண்காணிப்பு

### 4. கூடுதல் வடிவமைப்புகளை ஆராயவும்
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## கூடுதல் வளங்கள்

### கற்றல் பொருட்கள்
- [Azure Developer CLI ஆவணங்கள்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure கட்டமைப்பு மையம்](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure நன்கு கட்டமைக்கப்பட்ட கட்டமைப்பு](https://learn.microsoft.com/en-us/azure/well-architected/)

### சமூகமும் ஆதரவும்
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer சமூக](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### வடிவமைப்புகள் & உதாரணங்கள்
- [அதிகாரப்பூர்வ வடிவமைப்பு அருங்காட்சியகம்](https://azure.github.io/awesome-azd/)
- [சமூக வடிவமைப்பு பங்களிப்புகள்](https://github.com/Azure/awesome-azd)
- [Todo வடிவமைப்பு மூல கோப்பு](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**உங்கள் முதல் azd திட்டத்தை முடித்ததற்கு வாழ்த்துக்கள்!** நீங்கள் இப்போது Azure இல் அற்புதமான பயன்பாடுகளை நம்பிக்கையுடன் உருவாக்கி வெளியிட தயாராக இருக்கிறீர்கள்.

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பக்காரர்களுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் & துவக்கம்
- **⬅️ முந்தையது**: [நிறுவுதல் மற்றும் அமைப்பு](installation.md)
- **➡️ அடுத்தது**: [உங்கள் சொந்த பயன்பாட்டை கொண்டு வாருங்கள்](bring-your-own-app.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 2: AI-முதன்மை மேம்பாடு](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->