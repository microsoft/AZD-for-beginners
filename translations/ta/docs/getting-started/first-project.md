<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-10-11T16:09:10+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ta"
}
-->
# உங்கள் முதல் திட்டம் - கையேடு

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்கட்டம்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் & விரைவான தொடக்கம்
- **⬅️ முந்தையது**: [நிறுவல் & அமைப்பு](installation.md)
- **➡️ அடுத்தது**: [கட்டமைப்பு](configuration.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

## அறிமுகம்

Azure Developer CLI (azd) பயன்படுத்தி உங்கள் முதல் முழுமையான full-stack பயன்பாட்டை உருவாக்க, வெளியிட மற்றும் நிர்வகிக்க இந்த விரிவான கையேடு உதவுகிறது. React frontend, Node.js API backend மற்றும் MongoDB தரவுத்தொகுப்பு கொண்ட ஒரு todo பயன்பாட்டுடன் நீங்கள் வேலை செய்யப் போகிறீர்கள்.

## கற்றல் இலக்குகள்

இந்த கையேட்டை முடிக்கும்போது, நீங்கள்:
- azd திட்டத்தை ஆரம்பிக்கவும், மாதிரிகளைப் பயன்படுத்தவும் கற்றுக்கொள்வீர்கள்
- Azure Developer CLI திட்ட அமைப்பு மற்றும் கட்டமைப்பு கோப்புகளைப் புரிந்துகொள்வீர்கள்
- Azure-க்கு முழுமையான பயன்பாட்டை வெளியிடவும், உள்கட்டமைப்பை உருவாக்கவும் கற்றுக்கொள்வீர்கள்
- பயன்பாட்டை புதுப்பிக்கவும், மீண்டும் வெளியிடவும் உத்திகள் செயல்படுத்துவீர்கள்
- மேம்பாடு மற்றும் staging ஆகியவற்றுக்கான பல சூழல்களை நிர்வகிக்க கற்றுக்கொள்வீர்கள்
- வளங்களை சுத்தம் செய்யவும், செலவுகளை நிர்வகிக்கவும் நடைமுறைகளைப் பயன்படுத்துவீர்கள்

## கற்றல் முடிவுகள்

முடித்தவுடன், நீங்கள்:
- மாதிரிகளைப் பயன்படுத்தி azd திட்டங்களை சுயமாக ஆரம்பிக்கவும், அமைக்கவும் முடியும்
- azd திட்ட அமைப்புகளைச் சரியாக வழிநடத்தவும், மாற்றவும் முடியும்
- ஒரே கட்டளைகளைப் பயன்படுத்தி Azure-க்கு full-stack பயன்பாடுகளை வெளியிட முடியும்
- பொதுவான வெளியீட்டு சிக்கல்களையும், அங்கீகாரப் பிரச்சினைகளையும் தீர்க்க முடியும்
- பல Azure சூழல்களை வெவ்வேறு வெளியீட்டு நிலைகளுக்கு நிர்வகிக்க முடியும்
- பயன்பாட்டை புதுப்பிக்க தொடர்ந்து வெளியீட்டு வேலைகளை செயல்படுத்த முடியும்

## தொடங்குதல்

### முன்பதிவுகள் சரிபார்ப்பு
- ✅ Azure Developer CLI நிறுவப்பட்டது ([நிறுவல் வழிகாட்டி](installation.md))
- ✅ Azure CLI நிறுவப்பட்டு அங்கீகரிக்கப்பட்டது
- ✅ Git உங்கள் கணினியில் நிறுவப்பட்டது
- ✅ Node.js 16+ (இந்த கையேடுக்கு)
- ✅ Visual Studio Code (பரிந்துரைக்கப்படுகிறது)

### உங்கள் அமைப்பை சரிபார்க்கவும்
```bash
# Check azd installation
azd version
```
### Azure அங்கீகாரத்தை சரிபார்க்கவும்

```bash
az account show
```

### Node.js பதிப்பைச் சரிபார்க்கவும்
```bash
node --version
```

## படி 1: ஒரு மாதிரியைத் தேர்ந்தெடுத்து ஆரம்பிக்கவும்

React frontend மற்றும் Node.js API backend கொண்ட பிரபலமான todo பயன்பாட்டைத் தேர்ந்தெடுத்து தொடங்குவோம்.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### என்ன நடந்தது?
- உங்கள் உள்ளூர் கோப்பகத்திற்கு மாதிரி குறியீட்டை பதிவிறக்கம் செய்தது
- சேவை வரையறைகளுடன் `azure.yaml` கோப்பை உருவாக்கியது
- `infra/` கோப்பகத்தில் உள்கட்டமைப்பு குறியீட்டை அமைத்தது
- சூழல் கட்டமைப்பை உருவாக்கியது

## படி 2: திட்ட அமைப்பை ஆராயுங்கள்

azd எங்களுக்கு என்ன உருவாக்கியது என்பதைப் பார்ப்போம்:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
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

### முக்கிய கோப்புகளைப் புரிந்துகொள்ளுங்கள்

**azure.yaml** - உங்கள் azd திட்டத்தின் மையம்:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - உள்கட்டமைப்பு வரையறை:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## படி 3: உங்கள் திட்டத்தை தனிப்பயனாக்கவும் (விருப்பம்)

வெளியிடுவதற்கு முன், நீங்கள் பயன்பாட்டை தனிப்பயனாக்கலாம்:

### Frontend மாற்றம் செய்யவும்
```bash
# Open the React app component
code src/web/src/App.tsx
```

ஒரு எளிய மாற்றம் செய்யவும்:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### சூழல் மாறிகளை அமைக்கவும்
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## படி 4: Azure-க்கு வெளியிடுங்கள்

இப்போது சுவாரஸ்யமான பகுதி - அனைத்தையும் Azure-க்கு வெளியிடுங்கள்!

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

`azd up` கட்டளை இந்த படிகளைச் செய்கிறது:
1. **Provision** (`azd provision`) - Azure வளங்களை உருவாக்குகிறது
2. **Package** - உங்கள் பயன்பாட்டு குறியீட்டை கட்டமைக்கிறது
3. **Deploy** (`azd deploy`) - Azure வளங்களுக்கு குறியீட்டை வெளியிடுகிறது

### எதிர்பார்க்கப்படும் வெளியீடு
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## படி 5: உங்கள் பயன்பாட்டைச் சோதிக்கவும்

### உங்கள் பயன்பாட்டை அணுகவும்
வெளியீட்டு வெளியீட்டில் வழங்கப்பட்ட URL-ஐ கிளிக் செய்யவும் அல்லது எப்போதும் பெறவும்:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo பயன்பாட்டைச் சோதிக்கவும்
1. **ஒரு todo உருப்படியைச் சேர்க்கவும்** - "Add Todo" கிளிக் செய்து ஒரு பணியை உள்ளிடவும்
2. **முடிந்ததாகக் குறிக்கவும்** - முடிக்கப்பட்ட உருப்படிகளைச் சரிபார்க்கவும்
3. **உருப்படிகளை நீக்கவும்** - தேவையற்ற todo-களை அகற்றவும்

### உங்கள் பயன்பாட்டை கண்காணிக்கவும்
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## படி 6: மாற்றங்களைச் செய்யவும் மற்றும் மீண்டும் வெளியிடவும்

ஒரு மாற்றத்தைச் செய்யுங்கள் மற்றும் புதுப்பிக்க எவ்வளவு எளிதாக இருக்கிறது என்பதைப் பாருங்கள்:

### API-யை மாற்றவும்
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

ஒரு தனிப்பயன் பதில் தலைப்பைச் சேர்க்கவும்:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### குறியீட்டு மாற்றங்களை மட்டும் வெளியிடுங்கள்
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## படி 7: பல சூழல்களை நிர்வகிக்கவும்

உற்பத்திக்கு முன் மாற்றங்களைச் சோதிக்க ஒரு staging சூழலை உருவாக்குங்கள்:

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

### சூழல் ஒப்பீடு
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## படி 8: வளங்களை சுத்தம் செய்யுங்கள்

சோதனை முடிந்ததும், தொடர்ச்சியான கட்டணங்களைத் தவிர்க்க சுத்தம் செய்யுங்கள்:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## நீங்கள் கற்றது

வாழ்த்துக்கள்! நீங்கள் வெற்றிகரமாக:
- ஒரு மாதிரியில் இருந்து azd திட்டத்தை ஆரம்பித்தீர்கள்
- திட்ட அமைப்பை மற்றும் முக்கிய கோப்புகளை ஆராய்ந்தீர்கள்
- Azure-க்கு ஒரு full-stack பயன்பாட்டை வெளியிட்டீர்கள்
- குறியீட்டு மாற்றங்களைச் செய்தீர்கள் மற்றும் மீண்டும் வெளியிட்டீர்கள்
- பல சூழல்களை நிர்வகித்தீர்கள்
- வளங்களை சுத்தம் செய்தீர்கள்

## பொதுவான சிக்கல்களைத் தீர்க்குதல்

### அங்கீகாரப் பிழைகள்
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### வெளியீட்டு தோல்விகள்
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### வள பெயர் மோதல்கள்
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network பிரச்சினைகள்
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## அடுத்த படிகள்

இப்போது நீங்கள் உங்கள் முதல் திட்டத்தை முடித்துள்ளீர்கள், இந்த மேம்பட்ட தலைப்புகளை ஆராயுங்கள்:

### 1. உள்கட்டமைப்பை தனிப்பயனாக்கவும்
- [Code மூலம் உள்கட்டமைப்பு](../deployment/provisioning.md)
- [தரவுத்தொகுப்புகள், சேமிப்பு மற்றும் பிற சேவைகளைச் சேர்க்கவும்](../deployment/provisioning.md#adding-services)

### 2. CI/CD அமைக்கவும்
- [GitHub Actions ஒருங்கிணைப்பு](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. உற்பத்தி சிறந்த நடைமுறைகள்
- [பாதுகாப்பு அமைப்புகள்](../deployment/best-practices.md#security)
- [செயல்திறன் மேம்பாடு](../deployment/best-practices.md#performance)
- [கண்காணிப்பு மற்றும் பதிவு](../deployment/best-practices.md#monitoring)

### 4. மேலும் மாதிரிகளை ஆராயுங்கள்
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## கூடுதல் வளங்கள்

### கற்றல் பொருட்கள்
- [Azure Developer CLI ஆவணங்கள்](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure கட்டமைப்பு மையம்](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure நன்கு வடிவமைக்கப்பட்ட கட்டமைப்பு](https://learn.microsoft.com/en-us/azure/well-architected/)

### சமூக & ஆதரவு
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### மாதிரிகள் & உதாரணங்கள்
- [அதிகாரப்பூர்வ மாதிரி கேலரி](https://azure.github.io/awesome-azd/)
- [சமூக மாதிரிகள்](https://github.com/Azure-Samples/azd-templates)
- [நிறுவன முறைமைகள்](https://github.com/Azure/azure-dev/tree/main/templates)

---

**உங்கள் முதல் azd திட்டத்தை முடித்ததற்கு வாழ்த்துக்கள்!** Azure-ல் நம்பிக்கையுடன் அற்புதமான பயன்பாடுகளை உருவாக்கவும், வெளியிடவும் நீங்கள் தயாராக உள்ளீர்கள்.

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்கட்டம்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 1 - அடித்தளம் & விரைவான தொடக்கம்
- **⬅️ முந்தையது**: [நிறுவல் & அமைப்பு](installation.md)
- **➡️ அடுத்தது**: [கட்டமைப்பு](configuration.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)
- **அடுத்த பாடம்**: [வெளியீட்டு வழிகாட்டி](../deployment/deployment-guide.md)

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கின்றோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்தவொரு தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.