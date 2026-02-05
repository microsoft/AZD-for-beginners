# 5. ஒரு டெம்ப்ளேட்டை தனிப்பயனாக்கவும்

!!! tip "இந்த மாட்யூலை முடிக்கும்போது நீங்கள் செய்ய முடியும்"

    - [ ] இயல்புநிலை AI Agent திறன்களை ஆராய்ந்தது
    - [ ] உங்கள் சொந்த குறியீட்டுடன் AI தேடலைச் சேர்த்தது
    - [ ] டிரேசிங் அளவுகோள்களை செயல்படுத்தி பகுப்பாய்வு செய்தது
    - [ ] ஒரு மதிப்பீட்டு இயக்கத்தைச் செயல்படுத்தியது
    - [ ] ஒரு ரெட்-டீமிங் ஸ்கேன் இயக்கப்பட்டது
    - [ ] **Lab 5: தனிப்பயனாக்கல் திட்டத்தை உருவாக்கியது**

---

## 5.1 AI Agent திறன்கள்

!!! success "இதை Lab 01 இல் முடித்தோம்"

- **கோப்பு தேடல்**: OpenAI இன் உள்ளமைக்கப்பட்ட கோப்பு தேடல் அறிவு மீட்புக்காக
- **மேற்கோள்கள்**: பதில்களில் தானியங்கி மூல அடையாளம்
- **தனிப்பயனாக்கக்கூடிய வழிமுறைகள்**: முகவர் நடத்தை மற்றும் தன்மையை மாற்றவும்
- **கருவி ஒருங்கிணைப்பு**: தனிப்பயனாக்கப்பட்ட திறன்களுக்கான விரிவாக்கக்கூடிய கருவி அமைப்பு

---

## 5.2 அறிவு மீட்பு விருப்பங்கள்

!!! task "இதை முடிக்க நாம் மாற்றங்களைச் செய்ய வேண்டும் மற்றும் மீண்டும் வெளியிட வேண்டும்"    
    
    ```bash title=""
    # சூழல் மாறிகள் அமைக்கவும்
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # தரவைப் பதிவேற்றவும் மற்றும் என் குறியீட்டை உருவாக்கவும்

    ```

---

**OpenAI கோப்பு தேடல் (இயல்புநிலை):**

- Azure AI Agent சேவையில் உள்ளமைக்கப்பட்டுள்ளது
- தானியங்கி ஆவண செயலாக்கம் மற்றும் குறியீட்டாக்கம்
- கூடுதல் கட்டமைப்பு தேவையில்லை

**Azure AI தேடல் (விருப்பம்):**

- ஹைபிரிட் செமாண்டிக் மற்றும் வெக்டர் தேடல்
- தனிப்பயனாக்கப்பட்ட குறியீட்டு மேலாண்மை
- மேம்பட்ட தேடல் திறன்கள்
- `USE_AZURE_AI_SEARCH_SERVICE=true` தேவை

---

## 5.3 [டிரேசிங் மற்றும் கண்காணிப்பு](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "இதை முடிக்க நாம் மாற்றங்களைச் செய்ய வேண்டும் மற்றும் மீண்டும் வெளியிட வேண்டும்"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**டிரேசிங்:**

- OpenTelemetry ஒருங்கிணைப்பு
- கோரிக்கை/பதில் கண்காணிப்பு
- செயல்திறன் அளவுகோல்கள்
- AI Foundry போர்ட்டலில் கிடைக்கிறது

**பதிவேற்றம்:**

- Container Apps இல் பயன்பாட்டு பதிவுகள்
- தொடர்பு ஐடிகளுடன் அமைக்கப்பட்ட பதிவேற்றம்
- நேரடி மற்றும் வரலாற்று பதிவுகளைப் பார்வையிடுதல்

---

## 5.4 [Agent மதிப்பீடு](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**உள்ளூர் மதிப்பீடு:**

- தர மதிப்பீட்டுக்கான உள்ளமைக்கப்பட்ட மதிப்பீட்டாளர்கள்
- தனிப்பயனாக்கப்பட்ட மதிப்பீட்டு ஸ்கிரிப்ட்கள்
- செயல்திறன் அளவீடு

**தொடர்ச்சியான கண்காணிப்பு:**

- நேரடி தொடர்புகளின் தானியங்கி மதிப்பீடு
- தர அளவுகோல் கண்காணிப்பு
- செயல்திறன் பின்தங்கல் கண்டறிதல்

**CI/CD ஒருங்கிணைப்பு:**

- GitHub Actions வேலைநடப்பு
- தானியங்கி சோதனை மற்றும் மதிப்பீடு
- புள்ளியியல் ஒப்பீட்டு சோதனை

---

## 5.5 [AI ரெட்-டீமிங் முகவர்](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI ரெட்-டீமிங்:**

- தானியங்கி பாதுகாப்பு ஸ்கேனிங்
- AI அமைப்புகளுக்கான அபாய மதிப்பீடு
- பல பிரிவுகளில் பாதுகாப்பு மதிப்பீடு

**அங்கீகாரம்:**

- Azure சேவைகளுக்கான மேலாண்மை அடையாளம்
- விருப்ப Azure App Service அங்கீகாரம்
- மேம்பாட்டு அடிப்படையிலான அங்கீகாரம்

!!! quote "இந்த Lab முடிவில் நீங்கள் செய்ய வேண்டும்"
    - [ ] உங்கள் காட்சித் தேவைகளை வரையறுத்தது
    - [ ] சூழல் மாறிகளை தனிப்பயனாக்கியது (config)
    - [ ] முகவர் வழிமுறைகளை தனிப்பயனாக்கியது (task)
    - [ ] தனிப்பயனாக்கப்பட்ட டெம்ப்ளேட்டை வெளியிட்டது (app)
    - [ ] வெளியீட்டு பிந்தைய பணிகளை முடித்தது (manual)
    - [ ] ஒரு சோதனை மதிப்பீட்டை இயக்கியது

இந்த உதாரணம் இரண்டு சிறப்பு முகவர்களுடன் மற்றும் பல மாடல் வெளியீடுகளுடன் ஒரு நிறுவன சில்லறை பயன்பாட்டிற்கான டெம்ப்ளேட்டை தனிப்பயனாக்குவதைக் காட்டுகிறது.

---

## 5.6 இதை உங்களுக்காக தனிப்பயனாக்குங்கள்!

### 5.6.1. காட்சி தேவைகள்

#### **முகவர் வெளியீடுகள்:** 

   - Shopper Agent: வாடிக்கையாளர்களுக்கு பொருட்களை கண்டறியவும் ஒப்பிடவும் உதவுகிறது
   - Loyalty Agent: வாடிக்கையாளர் பரிசுகள் மற்றும் விளம்பரங்களை நிர்வகிக்கிறது

#### **மாடல் வெளியீடுகள்:**

   - `gpt-4.1`: முதன்மை உரையாடல் மாடல்
   - `o3`: சிக்கலான கேள்விகளுக்கான காரண மாடல்
   - `gpt-4.1-nano`: எளிய தொடர்புகளுக்கான இலகு மாடல்
   - `text-embedding-3-large`: தேடலுக்கான உயர்தர எம்பெடிங்குகள்

#### **அம்சங்கள்:**

   - டிரேசிங் மற்றும் கண்காணிப்பு செயல்படுத்தப்பட்டது
   - பொருட்களின் பட்டியலுக்கான AI தேடல்
   - தர உறுதிப்பாட்டுக்கான மதிப்பீட்டு அமைப்பு
   - பாதுகாப்பு சரிபார்ப்புக்கான ரெட்-டீமிங்

---

### 5.6.2 காட்சி செயல்படுத்தல்


#### 5.6.2.1. வெளியீட்டுக்கு முன் அமைப்பு

ஒரு அமைப்பு ஸ்கிரிப்ட்டை உருவாக்கவும் (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Set environment name
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configure region (choose based on model availability)
azd env set AZURE_LOCATION "eastus2"

# Enable all optional services
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configure primary chat model (gpt-4o as closest available to gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configure embedding model for enhanced search
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Set agent name (will create first agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configure search index
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: முகவர் வழிமுறைகள்

`custom-agents/shopper-agent-instructions.md` உருவாக்கவும்:

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

`custom-agents/loyalty-agent-instructions.md` உருவாக்கவும்:

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

#### 5.6.2.3: வெளியீட்டு ஸ்கிரிப்ட்

`deploy-retail.sh` உருவாக்கவும்:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Validate prerequisites
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Set up environment
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Check quota in selected region
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

# Deploy infrastructure and application
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Capture deployment outputs
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Get the web app URL
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 AI Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in AI Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4: வெளியீட்டு பிந்தைய அமைப்பு

`configure-retail-agents.sh` உருவாக்கவும்:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Get deployment information
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instructions for manual configuration
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to AI Foundry portal: https://ai.azure.com
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
- Tracing: Available in AI Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3: சோதனை மற்றும் சரிபார்ப்பு

`test-retail-deployment.sh` உருவாக்கவும்:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Verify environment variables are set
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Test web application availability
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

# Run evaluation if configured
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
2. Create the second agent (Loyalty Agent) in AI Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 எதிர்பார்க்கப்படும் முடிவுகள்

இந்த செயல்படுத்தல் வழிகாட்டியைப் பின்பற்றிய பிறகு, நீங்கள் பெறுவீர்கள்:

1. **வள அமைப்பு:**

      - மாடல் வெளியீடுகளுடன் AI Foundry திட்டம்
      - வலை பயன்பாட்டை ஹோஸ்ட் செய்யும் Container Apps
      - பொருட்களின் பட்டியலுக்கான AI தேடல் சேவை
      - கண்காணிப்புக்கான Application Insights

2. **ஆரம்ப முகவர்:**

      - Shopper Agent அடிப்படை வழிமுறைகளுடன் அமைக்கப்பட்டது
      - கோப்பு தேடல் திறன் செயல்படுத்தப்பட்டது
      - டிரேசிங் மற்றும் கண்காணிப்பு அமைக்கப்பட்டது

3. **தனிப்பயனாக்கத்துக்கு தயாராக:**

      - Loyalty Agent ஐச் சேர்க்கும் அமைப்பு
      - தனிப்பயனாக்கப்பட்ட வழிமுறைகள் டெம்ப்ளேட்கள்
      - சோதனை மற்றும் சரிபார்ப்பு ஸ்கிரிப்ட்கள்
      - கண்காணிப்பு மற்றும் மதிப்பீட்டு அமைப்பு

4. **உற்பத்தி தயார்நிலை:**

      - ரெட்-டீமிங் மூலம் பாதுகாப்பு ஸ்கேனிங்
      - செயல்திறன் கண்காணிப்பு
      - தர மதிப்பீட்டு அமைப்பு
      - அளவீட்டுக்குரிய கட்டமைப்பு

இந்த உதாரணம் AZD டெம்ப்ளேட்டை குறிப்பிட்ட நிறுவன காட்சிகளுக்காக விரிவாக்கி மற்றும் தனிப்பயனாக்குவது எப்படி என்பதை, பாதுகாப்பு, கண்காணிப்பு மற்றும் அளவீட்டு சிறந்த நடைமுறைகளைப் பின்பற்றுவதுடன், விளக்குகிறது.

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கின்றோம், ஆனால் தானியக்க மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.