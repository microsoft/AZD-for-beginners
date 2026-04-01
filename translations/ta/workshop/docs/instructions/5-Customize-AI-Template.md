# 5. ஒரு வார்ப்புருவை தனிப்பயனாக்கவும்

!!! tip "இந்த பகுதியின் இறுதியில் நீங்கள் இந்தக் காரியங்களைச் செய்யக்கூடுவீர்கள்"

    - [ ] பொது AI முகவர் திறன்களை ஆராய்ந்தது
    - [ ] உங்கள் சொந்த index உடன் AI தேடலைச் சேர்த்தது
    - [ ] டிரேசிங் அளவுகோல்களை செயல்படுத்தி பகுப்பாய்வு செய்தது
    - [ ] ஒரு மதிப்பீட்டு ஓட்டத்தை நடத்தினீர்கள்
    - [ ] ரெட்-டீமிங் ஸ்கேனை இயக்கினீர்கள்
    - [ ] **Lab 5: தனிப்பயனாக்க திட்டத்தை உருவாக்கியது** 

---

## 5.1 AI முகவர் திறன்கள்

!!! success "நாங்கள் இதனை லேப் 01 இல் முடித்தோம்"

- **கோப்பு தேடல்**: அறிவு மீட்டெடுப்பிற்கான OpenAI இன் உள்ளமைக்கப்பட்ட கோப்பு தேடல்
- **சுட்டுகள்**: பதில்களில் மூலத்தின் தானியங்கி ஒதுக்கீடு
- **தனிப்பயன் வழிமுறைகள்**: முகவரின் நடத்தை மற்றும் பண்பத்தை மாற்றவும்
- **கருவி ஒருங்கிணைப்பு**: தனிப்பயன் திறன்களுக்கான விரிவாக்கக்கூடிய கருவி அமைப்பு

---

## 5.2 அறிவு மீட்டெடுப்பின் விருப்பங்கள்

!!! task "இதனை முடிக்க மாற்றங்கள் செய்து மீண்டும் வெளியிட வேண்டும்"    
    
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

**OpenAI கோப்பு தேடல் (இயல்புநிலை):**

- Foundry Agents-க்கு உள்ளமைக்கப்பட்டுள்ளது
- ஆவண செயலாக்கம் மற்றும் குறியீட்டாக்கம் தானாக நிகழும்
- மேலும் எந்த கட்டமைப்பும் தேவையில்லை

**Azure AI Search (விருப்பமான):**

- இணைமுறை அர்த்தம் மற்றும் வெக்டர் தேடல்
- தனிப்பயன் குறியீட்டு மேலாண்மை
- மேம்பட்ட தேடல் திறன்கள்
- தேவைப்படுகிறது `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [டிரேசிங் மற்றும் கண்காணிப்பு](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "இதனை முடிக்க மாற்றங்கள் செய்து மீண்டும் வெளியிட வேண்டும்"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**டிரேசிங்:**

- OpenTelemetry ஒருங்கிணைப்பு
- கோரிக்கை/பதிலின் கண்காணிப்பு
- செயல்திறன் அளவுகோல்கள்
- Microsoft Foundry போர்டலில் கிடைக்கும்

**லாகிங்:**

- Container Apps இல் செயலி பதிவுகள்
- Correlation ID-களுடன் கட்டமைக்கப்பட்ட பதிவு
- நேரடி மற்றும் வரலாற்று பதிவுகளின் பார்வை

---

## 5.4 [முகவர் மதிப்பீடு](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**உள்ளூர் மதிப்பீடு:**

- தரம் மதிப்பீட்டிற்கான உள்ளமைக்கப்பட்ட மதிப்பாளர்கள்
- தனிப்பயன் மதிப்பீடு ஸ்கிரிப்ட்கள்
- செயல்திறன் பேன்ச்மார்க்கிங்

**தொடர்ச்சியான கண்காணிப்பு:**

- நேரடி தொடர்புகளின் தானியங்கி மதிப்பீடு
- தரம் அளவுகோல்கள் கண்காணிப்பு
- செயல்திறன் பின்னடைவு கண்டறிதல்

**CI/CD ஒருங்கிணைப்பு:**

- GitHub Actions வேலைநடை
- தானியங்கி சோதனை மற்றும் மதிப்பீடு
- புள்ளியியல் ஒப்பீட்டு சோதனை

---

## 5.5 [AI ரெட்-டீமிங் முகவர்](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ரெட்-டீமிங்:**

- தானியங்கி பாதுகாப்பு ஸ்கேனிங்
- AI அமைப்புகளுக்கான அபாய மதிப்பீடு
- பல வகை பிரிவுகளில் பாதுகாப்பு மதிப்பீடு

**அங்கீகாரம்:**

- Azure சேவைகளுக்கான Managed Identity
- விருப்பமான Azure App Service அங்கீகாரம்
- வளர்ச்சிக்கான அடிப்படை அங்கீகாரம் (basic auth) fallback



!!! quote "இந்த ஆய்வின் முடிவில் உங்களிடம் கீழ்க்காணும் விஷயங்கள் இருக்க வேண்டும்"
    - [ ] உங்கள் காட்சி தேவைகளை வரையறுக்கவும்
    - [ ] சூழல் மாறிலிகளை (config) தனிப்பயனாக்கியிருத்தல்
    - [ ] முகவர் வழிமுறைகளை (task) தனிப்பயனாக்குதல்
    - [ ] தனிப்பயனாக்கிய வார்ப்புருவை (app) பிரசாரம் செய்திருத்தல்
    - [ ] பதிவேற்றத்துக்குப்பின் பணிகளை (manual) முடித்தல்
    - [ ] ஒரு சோதனை மதிப்பீட்டை இயக்குதல்

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 அதை உங்களுக்காக தனிப்பயனாக்குங்கள்!

### 5.6.1. காட்சி தேவைகள்

#### **முகவர் பிரசாரங்கள்:** 

   - Shopper Agent: வாடிக்கையாளர்களுக்கு பொருட்களை கண்டுபிடிக்கவும் மற்றும் ஒப்பிடவும் உதவுகிறது
   - Loyalty Agent: வாடிக்கையாளர் பரிசுகள் மற்றும் பிரமோஷன்களை நிர்வகிக்கிறது

#### **மாடல் பிரசாரங்கள்:**

   - `gpt-4.1`: முதன்மை பேசு மாடல்
   - `o3`: சிக்கலான கேள்விகளுக்கான தார்க்க மாடல்
   - `gpt-4.1-nano`: எளிய தொடர்புகளுக்கான லைட்வேட் மாடல்
   - `text-embedding-3-large`: தேடலுக்கு உயர்தர எம்பெடிங்குகள்

#### **அம்சங்கள்:**

   - டிரேசிங் மற்றும் கண்காணிப்பு செயல்படுத்தப்பட்டன
   - பொருள் கேட்டலாக்கிற்காக AI தேடல்
   - தர உத்தரவாதத்திற்கான மதிப்பீட்டு வடிவமைப்பு
   - பாதுகாப்பு சரிபார்க்கவரையில் ரெட்-டீமிங்

---

### 5.6.2 காட்சி அமலாக்கம்


#### 5.6.2.1. பிரசாரம்வரை முன் கட்டமைப்பு

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# சூழல் பெயரை அமைக்கவும்
azd env set AZURE_ENV_NAME "retail-ai-agents"

# மண்டலத்தை அமைக்கவும் (மாடல்களின் கிடைப்பின்படி தேர்வு செய்யவும்)
azd env set AZURE_LOCATION "eastus2"

# எல்லா விருப்ப சேவைகளையும் செயல்படுத்தவும்
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# முதன்மை உரையாடல் மாதிரியை அமைக்கவும் (gpt-4.1 என்பது gpt-4.1க்கு மிக அருகிலுள்ள கிடைக்கும் மாதிரி)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# மேம்படுத்தப்பட்ட தேடலுக்காக எம்பெடிங் மாதிரியை அமைக்கவும்
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ஏஜென்ட் பெயரை அமைக்கவும் (முதல் ஏஜெண்டை உருவாக்கும்)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# தேடல் குறியீட்டை அமைக்கவும்
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: முகவர் வழிமுறைகள்

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

#### 5.6.2.3: பதிப்பீடு ஸ்கிரிப்ட்

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# முன்நிபந்தனைகளைச் சரிபார்க்கவும்
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

# தேர்ந்தெடுத்த பிராந்தியத்தில் ஒதுக்கீட்டைச் சரிபார்க்கவும்
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

# அடித்தளத்தையும் பயன்பாட்டையும் வெளியிடவும்
echo "🏗️  Deploying Azure infrastructure..."
azd up

# வெளியீட்டு முடிவுகளை பதிவு செய்யவும்
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# வலைப் பயன்பாட்டின் URL ஐப் பெறவும்
APP_URL=$(azd env get-values | grep '^APP_URL=' | cut -d'=' -f2- | tr -d '"')

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

#### 5.6.2.4: பதிப்பேற்றத்திற்குப் பின்னர் கட்டமைப்பு

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# டெப்லாய்மென்ட் தகவல்களைப் பெறவும்
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# கைமுறை அமைப்புக்கான வழிமுறைகள்
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

### 5.6.3: சோதனை மற்றும் உறுதிப்படுத்தல்

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# சுற்றுச்சூழல் மாறிலிகள் அமைக்கப்பட்டுள்ளன என்பதை சரிபார்க்கவும்
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# வலை பயன்பாட்டின் கிடைக்கும் நிலையை சோதிக்கவும்
APP_URL=$(azd env get-values | grep '^APP_URL=' | cut -d'=' -f2- | tr -d '"')
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

# கட்டமைக்கப்பட்டிருந்தால் மதிப்பீட்டை இயக்கவும்
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

### 5.6.4 எதிர்பார்க்கப்படும் விளைவுகள்

After following this implementation guide, you will have:

1. **பதிவேற்றப்பட்ட உட்கட்டமைப்பு:**

      - மாடல் பிரசாரங்களுடன் Microsoft Foundry திட்டம்
      - வலை பயன்பாட்டை ஹோஸ்ட் செய்யும் Container Apps
      - பொருள் கத்தலாக்குக்கான AI Search சேவை
      - கண்காணிப்பதற்கான Application Insights

2. **துவக்க முகவர்:**

      - மூல வழிமுறைகளுடன் Shopper Agent கட்டமைக்கப்பட்டுள்ளது
      - கோப்பு தேடல் திறன் இயக்கு செய்யப்பட்டுள்ளது
      - டிரேசிங் மற்றும் கண்காணிப்பு கட்டமைக்கப்பட்டவை

3. **தனிப்பயனாக்கத்திற்கு தயாராக:**

      - Loyalty Agent ஐ சேர்க்கும் கட்டமைப்பு
      - தனிப்பயன் வழிமுறை வார்ப்புருக்கள்
      - சோதனை மற்றும் உறுதிப்படுத்தல் ஸ்கிரிப்ட்கள்
      - கண்காணிப்பு மற்றும் மதிப்பீட்டு நிறுவல்

4. **உற்பத்தி தயாரமைவு:**

      - ரெட்-டீமிங் மூலம் பாதுகாப்பு ஸ்கேனிங்
      - செயல்திறன் கண்காணிப்பு
      - தர மதிப்பீட்டு வடிவமைப்பு
      - அளவிறுத்தக்கூடிய கட்டமைப்பு

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**பொறுப்பு மறுத்தல்**:
இந்த ஆவணம் செயற்கை நுண்ணறிவு மொழிபெயர்ப்பு சேவை olan [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இடம்பெறலாம் என்பதைக் கவனமாகக் கொள்ளவும். அதன் சொந்த மொழியில் உள்ள அசல் ஆவணத்தை அதிகாரப்பூர்வமான மூலமாகக் கருத வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பின் பயன்பாட்டால் ஏற்படக்கூடிய எந்த தவறுகள் அல்லது தவறான புரிதலிற்காகவோ நாங்கள் பொறுப்பில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->