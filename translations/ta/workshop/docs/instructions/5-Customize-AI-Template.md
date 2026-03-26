# 5. Customize a Template

!!! tip "இந்த தொகுதியின் முடிவில் நீங்கள் இதைச் செய்யக் கூடியவராக இருப்பீர்கள்"

    - [ ] இயல்புநிலை AI ஏஜென்ட் திறன்களை ஆராய்ந்தது
    - [ ] உங்கள் சொந்த இன்டெக்சுடன் AI தேடலை இணைத்தது
    - [ ] டிரேசிங் அளவுகோல்களை இயக்கி பகுப்பாய்வு செய்தது
    - [ ] ஒரு மதிப்பீட்டு ஓட்டத்தை இயக்கியது
    - [ ] ஒரு ரெட்-டீமிங் ஸ்கேன் ஒன்றை செயல்படுத்தியது
    - [ ] **லேப் 5: தனிப்பயனாக்கல் திட்டத்தை உருவாக்கியது** 

---

## 5.1 AI Agent Capabilities

!!! success "இதை நாம் லேப் 01-ல் முடித்துவிட்டோம்"

- **கோப்பு தேடல்**: அறிவு மீட்டெடுப்பிற்கான OpenAI இன் உட்பொதிக்கப்பட்ட கோப்பு தேடல்
- **மூல குறிப்புகள்**: பதில்களில் தானாகத்தான் மூல ஆதாரக் குறிப்பிட்டு வழங்குதல்
- **தனிப்பயனாக்கக்கூடிய வழிமுறைகள்**: ஏஜெண்டின் நடந்துகொள்ளுதல் மற்றும் தனிமைக்குணத்தை மாற்றக்கூடியவை
- **கருவி ஒருங்கிணைப்பு**: தனிப்பயன் திறன்களுக்கு விரிவாக்கக்கூடிய கருவி அமைப்பு

---

## 5.2 Knowledge Retrieval Options

!!! task "இதை முடிக்க மாற்றங்கள் செய்து மீண்டும் வெளியிட வேண்டும்"    
    
    ```bash title=""
    # Set environment variables
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Upload data and create my index

    ```

---

**OpenAI File Search (Default):**

- Foundry Agents-இல் உட்பொதுக்கப்பட்டவை
- ஆவணத்தை தானாக செயலாக்கி இன்டெக்சிங் செய்கிறது
- மேலும் கட்டமைப்பு தேவையில்லை

**Azure AI Search (Optional):**

- ஹைபிரிட் செமாண்டிக் மற்றும் வெக்டர் தேடல்
- தனிப்பயன் இன்டெக்ஸ் மேலாண்மை
- மேம்பட்ட தேடல் திறன்கள்
- இதற்கு `USE_AZURE_AI_SEARCH_SERVICE=true` தேவை

---

## 5.3 [டிரேசிங் மற்றும் கண்காணிப்பு](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "இதை முடிக்க மாற்றங்கள் செய்து மீண்டும் வெளியிட வேண்டும்"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**டிரேசிங்:**

- OpenTelemetry ஒருங்கிணைப்பு
- கோரிக்கை/பதில் கண்காணிப்பு
- செயல்திறன் அளவுகோல்கள்
- Microsoft Foundry போர்டலில் கிடைக்கும்

**பதிவுகள்:**

- Container Apps இல் பயன்பாட்டு பதிவுகள்
- தொடர்பு அடையாளங்களுடன் கட்டமைக்கப்பட்ட பதிவு
- நேரலை மற்றும் வரலாற்றப் பதிவுகள் பார்வை

---

## 5.4 [ஏஜெண்ட் மதிப்பீடு](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**உள்ளூர் மதிப்பீடு:**

- தர மதிப்பீட்டிற்கான உட்பொதுக்கப்பட்ட மதிப்பீட்டிகள்
- தனிப்பயன் மதிப்பீடு ஸ்கிரிப்டுகள்
- செயல்திறன் மீட்டெடுக்கும் ஒப்பீடு

**தொடர்ச்சியான கண்காணிப்பு:**

- நேரடி தொடர்புகளின் தானியங்கி மதிப்பீடு
- தர அளவுகோல்கள் கண்காணிப்பு
- செயல்திறன் பின்னடைவு கண்டறிதல்

**CI/CD ஒருங்கிணைப்பு:**

- GitHub Actions வேலைவழி
- தானியங்கி சோதனை மற்றும் மதிப்பீடு
- புள்ளியியல் ஒப்பிடுதல் சோதனை

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ரெட்-டீமிங்:**

- தானியங்கி பாதுகாப்பு ஸ்கேனிங்
- AI அமைப்புகளுக்கான அபாய மதிப்பீடு
- பல பிரிவுகளில் பாதுகாப்பு மதிப்பீடு

**அங்கீகாரம்:**

- Azure சேவைகளுக்கான Managed Identity
- விருப்பமான Azure App Service அங்கீகாரம்
- வளர்ச்சிக்காக அடிப்படை அங்கீகாரம் fallback

!!! quote "இந்த லேப்பின் முடிவில் நீங்கள் இவற்றை பெற்றிருப்பீர்கள்"
    - [ ] உங்கள் சூழ்நிலைக் தேவைகளை வரையறுத்து
    - [ ] செயல்படுத்தப்பட்ட env மாறிலிகளை (config) தனிப்பயனாக்கியுள்ளீர்கள்
    - [ ] ஏஜெண்ட் வழிமுறைகளை (task) தனிப்பயனாக்கியுள்ளீர்கள்
    - [ ] தனிப்பயனாக்கிய மாதிரியை (app) வெளியிட்டுவிட்டீர்கள்
    - [ ] பின்-வெளியீட்டு பணிகள் (manual) முடிக்கப்பட்டுள்ளன
    - [ ] ஒரு சோதனை மதிப்பீட்டை இயக்கியுள்ளீர்கள்

இந்த எடுத்துக்காட்டு இரண்டு சிறப்பான ஏஜெண்ட்கள் மற்றும் பல மாதிரி வெளியீடுகளுடன் நிறுவன சில்லறை பயன்பாட்டிற்கு மாதிரியை தனிப்பயனாக்குவதைக் காட்டுகிறது.

---

## 5.6 Customize It For You!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: வாடிக்கையாளர்களுக்கு தயாரிப்புகளை கண்டறிந்து ஒப்பிட உதவுகிறது
   - Loyalty Agent: வாடிக்கையாளர் வெகுமதிகள் மற்றும் ப்ரொமோஷன்களை நிர்வகிக்கிறது

#### **Model Deployments:**

   - `gpt-4.1`: Primary chat model
   - `o3`: Reasoning model for complex queries
   - `gpt-4.1-nano`: Lightweight model for simple interactions
   - `text-embedding-3-large`: High-quality embeddings for search

#### **Features:**

   - டிரேசிங் மற்றும் கண்காணிப்பு இயக்கு நிலையில் உள்ளது
   - தயாரிப்பு குறியிடத்துக்கான AI Search
   - தர நன்மைக்கான மதிப்பீட்டு கட்டமைப்பு
   - பாதுகாப்பு சரிபார்ப்பிற்கான ரெட்-டீமிங்

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# சூழ்நிலை பெயரை அமைக்கவும்
azd env set AZURE_ENV_NAME "retail-ai-agents"

# பிராந்தியத்தை அமைக்கவும் (மாதிரி கிடைக்கும் அடிப்படையில் தேர்ந்தெடுக்கவும்)
azd env set AZURE_LOCATION "eastus2"

# அனைத்து விருப்ப சேவைகளையும் இயக்கவும்
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# முதன்மை உரையாடல் மாதிரியை அமைக்கவும் (gpt-4.1 என்பது gpt-4.1க்கு கிடைக்கும் மிக அருகிலுள்ள மாதிரி)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# மேம்படுத்தப்பட்ட தேடலுக்காக எம்பெடிங் மாதிரியை அமைக்கவும்
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ஏஜென்ட் பெயரை அமைக்கவும் (முதல் ஏஜென்டை உருவாக்கும்)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# தேடல் இண்டெக்ஸை அமைக்கவும்
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agent Instructions

Create `custom-agents/shopper-agent-instructions.md`:

```markdown
# Shopper Agent Instructions

You are a helpful shopping assistant for an enterprise retail company. Your role is to:

1. **Product Discovery**: Help customers find products that match their needs
2. **Comparison**: Provide detailed product comparisons with pros/cons
3. **Recommendations**: Suggest complementary products and alternatives
4. **Inventory**: Check product availability and delivery options

## Guidelines:
- Always provide citations from the product catalog
- Be conversational and helpful
- Ask clarifying questions to understand customer needs
- Mention relevant promotions when appropriate
- Escalate complex warranty or return questions to human agents

## Knowledge Base:
You have access to our complete product catalog including specifications, pricing, reviews, and inventory levels.
```

Create `custom-agents/loyalty-agent-instructions.md`:

```markdown
# Loyalty Agent Instructions

You are a customer loyalty specialist focused on maximizing customer satisfaction and retention. Your responsibilities include:

1. **Rewards Management**: Explain point values, redemption options, and tier benefits
2. **Promotions**: Identify applicable discounts and special offers
3. **Program Navigation**: Help customers understand loyalty program features
4. **Account Support**: Assist with account-related questions and updates

## Guidelines:
- Prioritize customer satisfaction and retention
- Explain complex program rules in simple terms
- Proactively identify opportunities for customers to save money
- Celebrate customer milestones and achievements
- Connect customers with shopper agent for product questions

## Knowledge Base:
You have access to loyalty program rules, current promotions, customer tier information, and reward catalogs.
```

---

#### 5.6.2.3: Deployment Script

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# முன் நிபந்தனைகளை சரிபார்க்கவும்
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# சுற்றுச்சூழலை அமைக்கவும்
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# தேர்ந்தெடுக்கப்பட்ட பிராந்தியத்தில் ஒதுக்கீடுகளை சரிபார்க்கவும்
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4.1: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# அடித்தள கட்டமைப்பையும் பயன்பாட்டையும் வினியோகிக்கவும்
echo "🏗️  Deploying Azure infrastructure..."
azd up

# வினியோகிப்பு வெளியீடுகளை சேமிக்கவும்
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# வலை பயன்பாட்டின் URL ஐப் பெறவும்
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 Microsoft Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in Microsoft Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4: Post-Deployment Config

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# பதிவேற்றல் தொடர்பான தகவல்களைப் பெறவும்
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# கைமுறையில் உள்ளமைப்பிற்கான வழிமுறைகள்
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to Microsoft Foundry portal: https://ai.azure.com
   - Navigate to your project
   - Select Agents tab
   - Edit the existing agent
   - Update instructions with content from custom-agents/shopper-agent-instructions.md

2. **Create Loyalty Agent:**
   - In Agents tab, click 'Create Agent'
   - Name: 'loyalty-agent'
   - Model: Use same deployment as shopper agent
   - Instructions: Use content from custom-agents/loyalty-agent-instructions.md
   - Enable file search tool
   - Save and note the Agent ID

3. **Upload Knowledge Base:**
   - Prepare product catalog files (JSON/CSV format)
   - Upload to both agents' file search
   - Or configure Azure AI Search index

4. **Test Configuration:**
   - Test shopper agent with product queries
   - Test loyalty agent with rewards questions
   - Verify citations and search functionality

📊 Monitoring Setup:
- Tracing: Available in Microsoft Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3: Testing and Validation

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# சுற்றுச்சூழல் மாறிலிகள் அமைக்கப்பட்டுள்ளனவாக இருப்பதை உறுதிசெய்யவும்
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# வெப் பயன்பாட்டின் கிடைப்பை சோதிக்கவும்
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')
if [ ! -z "$APP_URL" ]; then
    echo "🌐 Testing web application at: $APP_URL"
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "✅ Web application is responding"
    else
        echo "❌ Web application returned status: $HTTP_STATUS"
    fi
else
    echo "❌ Could not retrieve web application URL"
fi

# அமைக்கப்பட்டிருந்தால் மதிப்பீட்டை இயக்கவும்
if [ -f "evals/evaluate.py" ]; then
    echo "📊 Running agent evaluation..."
    cd evals
    python -m pip install -r ../src/requirements.txt
    python -m pip install azure-ai-evaluation
    python evaluate.py
    cd ..
fi

echo "
🎯 Deployment validation complete!

Next steps:
1. Access the web application and test basic functionality
2. Create the second agent (Loyalty Agent) in Microsoft Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 Expected Outcomes

After following this implementation guide, you will have:

1. **வெளியிடப்பட்ட கட்டமைப்பு:**

      - மாதிரி வெளியீடுகளுடன் Microsoft Foundry திட்டம்
      - வலை பயன்பாட்டை ஹோஸ்ட் செய்யும் Container Apps
      - தயாரிப்பு குறியிடத்துக்கான AI Search சேவை
      - கண்காணிப்புக்கான Application Insights

2. **ஆரம்ப ஏஜென்ட்:**

      - எளிய வழிமுறைகளுடன் கட்டமைக்கப்பட்ட Shopper Agent
      - கோப்பு தேடல் திறன் இயக்கு
      - டிரேசிங் மற்றும் கண்காணிப்பு கட்டமைக்கப்பட்டுள்ளது

3. **தனிப்பயனாக்கத்திற்காக தயார்:**

      - Loyalty Agent சேர்க்கும் கட்டமைப்பு
      - தனிப்பயன் வழிமுறை வார்ப்புருக்கள்
      - சோதனை மற்றும் செல்லுபயமை ஸ்கிரிப்டுகள்
      - கண்காணிப்பு மற்றும் மதிப்பீடு அமைப்பு

4. **உற்பத்திக்கான தயார் நிலை:**

      - ரெட்-டீமிங்குடன் பாதுகாப்பு ஸ்கேனிங்
      - செயல்திறன் கண்காணிப்பு
      - தர மதிப்பீட்டு கட்டமைப்பு
      - விரிவூட்டக்கூடிய கட்டமைப்பு

இந்த எடுத்துக்காட்டு AZD மாதிரியை குறிப்பிட்ட நிறுவன சூழ்நிலைகளுக்காக எப்படி நீட்டி தனிப்பயனாக்க முடியும் என்பதையும் பாதுகாப்பு, கண்காணிப்பு மற்றும் விரிவாக்கத் தகுதிகளை பராமரிக்கும் சிறந்த நடைமுறைகளை எவ்வாறு காப்பாற்றலாம் என்பதையும் விளக்குகிறது.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிமாற்றம் செய்யப்பட்டதுதான். நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். மூல ஆவணம் அதன் சொந்த மொழியிலே அதிகாரபூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, ஒரு தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பின் பயன்பாட்டினால் ஏற்பட்ட எந்தவொரு தவறான புரிதலுக்கும் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பானவர்கள் அல்ல.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->