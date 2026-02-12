# 5. ஒரு வார்ப்புருவை தனிப்பயனாக்கு

!!! tip "இந்த மாடியூலின் முடிவில் நீங்கள் இதைச் செய்ய முடியும்"

    - [ ] இயல்புநிலையான AI முகவர் திறன்களை ஆராய்ந்தது
    - [ ] உங்கள் சொந்த index உடன் AI Search ஐச் சேர்த்தது
    - [ ] Tracing மெட்ரிக்ஸை இயக்கு மற்றும் பகுப்பாய்வு செய்தது
    - [ ] ஒரு மதிப்பீட்டு ஓட்டத்தை செயல்படுத்தியது
    - [ ] ஒரு ரெட்-டீமிங் ஸ்கேனை நடத்தியது
    - [ ] **லேப் 5: தனிப்பயனாக்கத் திட்டம் உருவாக்கப்பட்டது** 

---

## 5.1 AI Agent Capabilities

!!! success "நாம் இதை லேப் 01ல் முடித்தோம்"

- **கோப்பு தேடல்**: அறிவு பெறுவதற்கான OpenAI இன் உள்ளமைக்கப்பட்ட கோப்பு தேடல்
- **மூலக் குறிப்புகள்**: பதில்களில் தானாக மூலத்தொடர்புகளை கொடுக்கும்
- **தனிப்பயனாக்கக்கூடிய வழிமுறைகள்**: முகவரின் நடத்தை மற்றும் தனிப்பட்ட தன்மையை மாற்றவும்
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

- Foundry முகவரிகளுக்கு உள்ளமைக்கப்பட்டவை
- ஆவணங்களை தானாக செயலாக்குதல் மற்றும் குறியிடுதல்
- மேலும் எந்த அமைப்பும் தேவையில்லை

**Azure AI Search (Optional):**

- இணைமுறை அர்த்தவியல் மற்றும் வெக்டர் தேடல்
- தனிப்பயன் index மேலாண்மை
- மேம்பட்ட தேடல்திறன்கள்
- Requires `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [பின்தொடர்தலும் கண்காணிப்பும்](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "இதை நிறைவேற்ற, மாற்றங்கள் செய்த பின்னர் மீண்டும் வெளியிட வேண்டும்"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry ஒருங்கிணைப்பு
- கோரிக்கை/பதில்களின் பின்தொடர்தல்
- செயல்திறன் மெட்ரிக்ஸ்
- Microsoft Foundry போர்டலில் கிடைக்கிறது

**Logging:**

- Container Apps-இல் செயலி பதிவுகள்
- correlation ID-களுடன் கட்டமைக்கப்பட்ட பதிவு
- நேரடி மற்றும் வரலாற்றப் பதிவுகளின் பார்வை

---

## 5.4 [முகவர் மதிப்பீடு](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**உள்ளூர் மதிப்பீடு:**

- தர மதிப்பீட்டிற்கான உள்ளமைக்கப்பட்ட மதிப்பீட்டிகள்
- தனிப்பயன் மதிப்பீட்டு ஸ்கிரிப்டுகள்
- செயல்திறன் பேஞ்ச்மார்கிங்

**தொடர்ந்த கண்காணிப்பு:**

- நேரடி தொடர்புகளின் தானியங்கி மதிப்பீடு
- தர மெட்ரிக்ஸ் கண்காணித்தல்
- செயல்திறன் பின்னடைவு கண்டறிதல்

**CI/CD ஒருங்கிணைப்பு:**

- GitHub Actions வேலைப்பாடு
- தானியங்கி சோதனை மற்றும் மதிப்பீடு
- புள்ளியியல் ஒப்பிடும் சோதனைகள்

---

## 5.5 [AI ரெட்-டீமிங் முகவர்](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ரெட்-டீமிங்:**

- தானியங்கி பாதுகாப்பு ஸ்கேனிங்
- AI அமைப்புகளுக்கான அபாய மதிப்பீடு
- பல வகைகளில் பாதுகாப்பு மதிப்பீடு

**அங்கீகாரம்:**

- Azure சேவைகளுக்கான Managed Identity
- விருப்பமான Azure App Service அங்கீகாரம்
- வளர்ச்சிக்காக அடிப்படை அங்கீகாரம் (fallback)



!!! quote "இந்த லேபின் முடிவில் நீங்கள் பின்வருமமை இருக்க வேண்டும்"
    - [ ] உங்கள் சூழ்நிலை தேவைகளை வரையறுக்கவும்
    - [ ] தனிப்பயன் செய்யப்பட்ட சுற்றுச்சூழல் மாறிலிகள் (config)
    - [ ] தனிப்பயன் முகவர் வழிமுறைகள் (task)
    - [ ] தனிப்பயனாக்கப்பட்ட வார்ப்புருவை (app) நிறுவியிருத்தல்
    - [ ] பதிலாக நடைபெறும் பணிகளை முடித்தல் (manual)
    - [ ] ஒரு சோதனை மதிப்பீட்டை நடத்தவும்

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Customize It For You!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: வாடிக்கையாளர்கள் பொருட்களை கண்டுபிடிக்கவும் ஒப்பிடவும் உதவுகிறது
   - Loyalty Agent: வாடிக்கையாளர் பரிசுகள் மற்றும் சலுகைகளை நிர்வகிக்கிறது

#### **Model Deployments:**

   - `gpt-4.1`: பிரதான கலந்துரையாடல் மாடல்
   - `o3`: சிக்கலான கேள்விகளுக்கான தார்க்க மாடல்
   - `gpt-4.1-nano`: எளிய தொடர்புகளுக்கான எளிய மாடல்
   - `text-embedding-3-large`: தேடலுக்கான உயர் தர embedding-கள்

#### **Features:**

   - பின்தொடர்தலும் கண்காணிப்பும் இயக்கப்பட்டுள்ளது
   - தயாரிப்பு கதவுக்கான AI Search
   - தர உறுதிப்பத்திரத்திற்கான மதிப்பீடு கட்டமைப்பு
   - பாதுகாப்பு சரிபார்க்க ரெட்-டீமிங்

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# சூழ்நிலை பெயரை அமைக்கவும்
azd env set AZURE_ENV_NAME "retail-ai-agents"

# பிராந்தியத்தை அமைக்கவும் (மாதிரி கிடைப்பின் அடிப்படையில் தேர்வு செய்யவும்)
azd env set AZURE_LOCATION "eastus2"

# அனைத்து விருப்ப சேவைகளையும் செயல்படுத்தவும்
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# முக்கிய அரட்டை மாதிரியை அமைக்கவும் (gpt-4.1-க்கு மிக அருகில் கிடைக்கும் gpt-4o)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# மேம்பட்ட தேடலுக்காக எம்பெடிங் மாதிரியை அமைக்கவும்
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ஏஜென்ட் பெயரை அமைக்கவும் (முதல் ஏஜென்டை உருவாக்கும்)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# தேடல் இன்டெக்ஸை அமைக்கவும்
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

# முன் நிபந்தனைகளைச் சரிபார்க்கவும்
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# சூழ்நிலையை அமைக்கவும்
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# தேர்ந்த பிராந்தியத்திலுள்ள ஒதுக்கீடுகளை சரிபார்க்கவும்
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4o: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# அடித்தளத்தையும் பயன்பாட்டையும் நிலைநிறுத்தவும்
echo "🏗️  Deploying Azure infrastructure..."
azd up

# நிலைநிறுத்தலின் வெளியீடுகளை பதிவு செய்யவும்
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

# வெளியீட்டு தகவல்களைப் பெறவும்
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# கைமுறை கட்டமைப்பிற்கான அறிவுறுத்தல்கள்
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

# சூழல் மாறிலிகள் அமைக்கப்பட்டுள்ளன என்பதை சரிபார்க்கவும்
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# வலை பயன்பாட்டின் கிடைப்பை சோதிக்கவும்
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

# கட்டமைக்கப்பட்டால் மதிப்பீட்டை இயக்கவும்
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

1. **நிறுவப்பட்ட உட்கட்டமைப்பு:**

      - Microsoft Foundry திட்டம் மாடல் பதிவேற்றங்களுடன்
      - Container Apps மூலம் வலை பயன்பாடு ஹோஸ்ட்டாடாகும்
      - தயாரிப்பு பட்டியலுக்கான AI Search சேவை
      - கண்காணிப்பிற்கு Application Insights

2. **ஆரம்ப முகவர்:**

      - Shopper Agent அடிப்படை வழிமுறைகளுடன் கட்டமைக்கப்பட்டுள்ளது
      - கோப்பு தேடல் திறன் இயக்கப்பட்டுள்ளது
      - பின்தொடர்தலும் கண்காணிப்பும் அமைக்கப்பட்டன

3. **தனிப்பயனாக்கத்திற்கு தயாராக:**

      - Loyalty Agent சேர்க்கும் கட்டமைப்பு
      - தனிப்பயன் வழிமுறை வார்ப்புருக்கள்
      - சோதனை மற்றும் சரிபார்ப்பு ஸ்கிரிப்டுகள்
      - கண்காணிப்பு மற்றும் மதிப்பீடு அமைப்பு

4. **தயாரிப்பு தயார் நிலை:**

      - ரெட்-டீமிங் உடன் பாதுகாப்பு ஸ்கேனிங்
      - செயல்திறன் கண்காணித்தல்
      - தர மதிப்பீட்டு கட்டமைப்பு
      - விரிவாக்கக்கூடிய கட்டமைப்பு

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிக்கை:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டது. நாங்கள் துல்லியத்துக்காக முயற்சி செய்கிறோம் என்றாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது சிக்கல்கள் இருக்கக் கூடும் என்பதை தயவுசெய்து கவனிக்கவும். மூல மொழியில் உள்ள அசல் ஆவணம் தகுதியான அதிகாரப்பூர்வ மூலமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதிலா ஏற்படும் எந்தவொரு தவறான புரிதலுக்கும் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பாளர்கள் அல்லாம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->