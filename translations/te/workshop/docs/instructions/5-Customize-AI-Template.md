# 5. టెంప్లేట్‌ను అనుకూలీకరించండి

!!! tip "ఈ మాడ్యూల్ ముగిసే వరకు మీరు చేయగలిగే అంశాలు"

    - [ ] డిఫాల్ట్ AI ఏజెంట్ సామర్థ్యాలను పరిశీలించారు
    - [ ] మీ స్వంత సూచికతో AI Search ను జోడించారు
    - [ ] ట్రేసింగ్ మెట్రిక్స్‌ను సక్రియం చేసి విశ్లేషించారు
    - [ ] మూల్యాంకన రన్‌ను అమలు చేశారు
    - [ ] రెడ్-టీమింగ్ స్కాన్‌ను అమలు చేశారు
    - [ ] **ల్యాబ్ 5: అనుకూలీకరణ ప్రణాళికను రూపొందించారు** 

---

## 5.1 AI ఏజెంట్ సామర్థ్యాలు

!!! success "మనం దీన్ని ల్యాబ్ 01లో పూర్తి చేసుకున్నాం"

- **ఫైల్ సెర్చ్**: జ్ఞానం పొందడానికి OpenAI యొక్క బిల్ట్-ఇన్ ఫైల్ సెర్చ్
- **ఉద్ధరణలు**: ప్రతిస్పందనలలో స్వయంచాలక మూల సూచన
- **అనుకూలీకరించగల సూచనలు**: ఏజెంట్ ప్రవర్తన మరియు వ్యక్తిత్వాన్ని మార్చండి
- **టూల్ సంయోజన**: అనుకూల సామర్థ్యాల కోసం విస్తరించదగిన టూల్ సిస్టమ్

---

## 5.2 జ్ఞానం పొందే ఎంపికలు

!!! task "ఇదిని పూర్తి చేయడానికి మార్పులు చేసి మళ్లీ డిప్లాయ్ చేయాల్సి ఉంటుంది"    
    
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

- Foundry Agents లో బిల్ట్-ఇన్
- డాక్యుమెంట్ల స్వయంచాలక ప్రాసెసింగ్ మరియు ఇండెక్సింగ్
- అదనపు కాన్ఫిగరేషన్ అవసరం లేదు

**Azure AI Search (ఐచ్ఛిక):**

- హైబ్రిడ్ సెమాంటిక్ మరియు వెక్టర్ సెర్చ్
- కస్టమ్ ఇండెక్స్ నిర్వహణ
- అధునాతన సెర్చ్ సామర్థ్యాలు
- అవసరం: `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ట్రేసింగ్ & మానిటరింగ్](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ఇదిని పూర్తి చేయడానికి మార్పులు చేసి మళ్లీ డిప్లాయ్ చేయాల్సి ఉంటుంది"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ట్రేసింగ్:**

- OpenTelemetry సమీకరణ
- రిక్వెస్ట్/రెస్పాన్స్ ట్రాకింగ్
- పనితీరు మెట్రిక్స్
- Microsoft Foundry పోర్టల్‌లో అందుబాటులో ఉంది

**లాగింగ్:**

- Container Apps లో అప్లికేషన్ లాగ్స్
- కోరిలేషన్ IDs తో నిర్మాణాత్మక లాగింగ్
- రియల్-టైమ్ మరియు చారిత్రక లాగ్ వీక్షణ

---

## 5.4 [ఏజెంట్ మూల్యాంకనం](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**లోకల్ మూల్యాంకనం:**

- నాణ్యత మూల్యాంకనానికి బిల్ట్-ఇన్ ఎవాల్యూయేటర్లు
- కస్టమ్ ఎవాల్యుయేషన్ స్క్రిప్ట్‌లు
- పనితీరు బेंచ్మార్కింగ్

**కొనసాగుతున్న మానిటరింగ్:**

- లైవ్ ఇంటరాక్షన్ల స్వయంచాలక మూల్యాంకనం
- నాణ్యత మెట్రిక్స్ ట్రాకింగ్
- పనితీరు వెనుదిరుగు గుర్తింపు

**CI/CD సమీకరణ:**

- GitHub Actions వర్క్‌ఫ్లో
- ఆటోమేటెడ్ టెస్టింగ్ మరియు మూల్యాంకనం
- గణాంక పరంగా తులనాత్మక పరీక్షలు

---

## 5.5 [AI రెడ్-టీమింగ్ ఏజెంట్](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI రెడ్-టీమింగ్:**

- ఆటోమేటెడ్ భద్రతా స్కానింగ్
- AI వ్యవస్థల కోసం ప్రమాద మదింపు
- అనేక వర్గాల్లో సేఫ్టీ మూల్యాంకనం

**ప్రామాణీకరణ:**

- Azure సేవల కొరకు Managed Identity
- ఐచ్ఛిక Azure App Service ప్రామాణీకరణ
- డెవలప్‌మెంట్ కోసం బేసిక్ auth ఫాల్బ్యాక్



!!! quote "ఈ ప్రయోగశాల ముగిసే సమయానికి మీ వద్ద ఉండవలసినవి"
    - [ ] మీ సన్నివేశ అవసరాలను నిర్వచించండి
    - [ ] అనుకూలీకరించిన env వేరియబుల్స్ (config)
    - [ ] అనుకూలీకరించిన ఏజెంట్ సూచనలు (task)
    - [ ] అనుకూలీకరించిన టెంప్లేట్‌ను డిప్లాయ్ చేశారు (app)
    - [ ] పోస్ట్-డిప్లాయ్‌మెంట్ పనులను పూర్తి చేశారు (manual)
    - [ ] పరీక్షా మూల్యాంకనాన్ని అమలు చేయండి

ఈ ఉదాహరణ రెండు ప్రత్యేక ఏజెంట్లు మరియు బహుళ మోడల్ డిప్లాయ్‌మెంట్‌లతో ఎంటర్ప్రైజ్ రీటైల్ వినియోగ కేస్ కోసం టెంప్లేట్‌ను అనుకూలీకరించడం ఎలా చేయాలో చూపిస్తుంది.

---

## 5.6 మీ కోసం దీనిని అనుకూలీకరించండి!

### 5.6.1. సన్నివేశ అవసరాలు

#### **ఏజెంట్ డిప్లాయ్‌మెంట్స్:** 

   - Shopper Agent: వినియోగదారులకు ఉత్పత్తులను కనుగొనడంలో మరియు సరిపోల్చడంలో సహాయపడుతుంది
   - Loyalty Agent: కస్టమర్ రివార్డులు మరియు ప్రమోషన్లను నిర్వహిస్తుంది

#### **మోడల్ డిప్లాయ్‌మెంట్లు:**

   - `gpt-4.1`: ప్రధాన చాట్ మోడల్
   - `o3`: సంక్లిష్ట ప్రశ్నల కోసం నియమనాత్మక razonనింగ్ మోడల్
   - `gpt-4.1-nano`: సరళమైన ఇంటరాక్షన్‌ల కోసం లైట్వెయిట్ మోడల్
   - `text-embedding-3-large`: సెర్చ్ కోసం అధిక నాణ్యత ఎంబెడింగ్‌లు

#### **ఫీచర్లు:**

   - ట్రేసింగ్ మరియు మానిటరింగ్ సక్రియం
   - ఉత్పత్తుల క్యాటలాగ్ కోసం AI Search
   - నాణ్యత హామీ కోసం ఎవాల్యుయేషన్ ఫ్రేమ్‌వర్క్
   - భద్రత ధ్రువీకరణ కోసం రెడ్-టీమింగ్

---

### 5.6.2 సన్నివేశ అమలు


#### 5.6.2.1. ప్రీ-డిప్లాయ్‌మెంట్ కాన్ఫిగ్

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# పర్యావరణం పేరు సెట్ చేయండి
azd env set AZURE_ENV_NAME "retail-ai-agents"

# ప్రాంతాన్ని (మోడల్ లభ్యత ఆధారంగా) కాన్ఫిగర్ చేయండి
azd env set AZURE_LOCATION "eastus2"

# అన్ని ఐచ్ఛిక సేవలను ప్రారంభించండి
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# ప్రధాన చాట్ మోడల్‌ను కాన్ఫిగర్ చేయండి (gpt-4.1 — gpt-4.1కి అత్యంత సమీపంగా అందుబాటులో ఉన్నది)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# ఉన్నత శోధన కోసం ఎంబెడ్డింగ్ మోడల్‌ను కాన్ఫిగర్ చేయండి
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ఏజెంట్ పేరును సెట్ చేయండి (మొదటి ఏజెంట్ సృష్టించబడుతుంది)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# శోధన సూచికను కాన్ఫిగర్ చేయండి
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: ఏజెంట్ సూచనలు

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

#### 5.6.2.3: డిప్లాయ్‌మెంట్ స్క్రిప్టు

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# ముందస్తు అవసరాలను ధృవీకరించండి
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# పర్యావరణాన్ని ఏర్పాటు చేయండి
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# ఎంచుకున్న ప్రాంతంలో కోటాను తనిఖీ చేయండి
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

# ఇన్ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను డిప్లాయ్ చేయండి
echo "🏗️  Deploying Azure infrastructure..."
azd up

# డిప్లాయ్‌మెంట్ అవుట్‌పుట్‌లను సేకరించండి
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# వెబ్ యాప్ URL పొందండి
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

#### 5.6.2.4: పోస్ట్-డిప్లాయ్‌మెంట్ కాన్ఫిగ్

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# డిప్లాయ్‌మెంట్ సమాచారం పొందండి
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# మాన్యువల్ కాన్ఫిగరేషన్ కోసం సూచనలు
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

### 5.6.3: పరీక్ష మరియు ధృవీకరణ

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# పర్యావరణ వేరియబుల్స్ సెట్ అయ్యాయా అని నిర్ధారించండి
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# వెబ్ అప్లికేషన్ అందుబాటులో ఉందో పరీక్షించండి
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

# కాన్ఫిగర్ చేయబడినట్లయితే మూల్యాంకనాన్ని నడపండి
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

### 5.6.4 ఆశించిన ఫలితాలు

ఈ అమలు గైడ్‌ను అనుసరించిన తర్వాత, మీ వద్ద ఇవి ఉంటాయి:

1. **డిప్లాయ్ చేసిన ఇన్ఫ్రాస్ట్రక్చర్:**

      - మోడల్ డిప్లాయ్‌మెంట్స్‌తో Microsoft Foundry ప్రాజెక్ట్
      - వెబ్ అప్లికేషన్‌ను హోస్ట్ చేసేందుకుగా Container Apps
      - ఉత్పత్తుల క్యాటలాగ్ కోసం AI Search సేవ
      - మానిటరింగ్ కోసం Application Insights

2. **ప్రారంభ ఏజెంట్:**

      - బేసిక్ సూచనలతో Shopper Agent కాన్ఫిగర్ చేయబడింది
      - ఫైల్ సెర్చ్ సామర్థ్యం ఎనేబుల్ చేయబడింది
      - ట్రేసింగ్ మరియు మానిటరింగ్ కాన్ఫిగర్ చేయబడ్డాయి

3. **అనుకూలీకరణకు సిద్ధం:**

      - Loyalty Agent ను జోడించడానికి ఫ్రేమ్‌వర్క్
      - కస్టమ్ సూచన టెంప్లేట్లు
      - పరీక్ష మరియు ధృవీకరణ స్క్రిప్ట్‌లు
      - మానిటరింగ్ మరియు ఎవాల్యుయేషన్ అమరిక

4. **ప్రొడక్షన్ సిద్ధత:**

      - రెడ్-టీమింగ్ ద్వారా భద్రతా స్కానింగ్
      - పనితీరు మానిటరింగ్
      - నాణ్యత మూల్యాంకన ఫ్రేమ్‌వర్క్
      - విస్తరించదగిన ఆర్కిటెక్చర్

ఈ ఉదాహరణ AZD టెంప్లేట్‌ను నిర్దిష్ట ఎంటర్ప్రైజ్ სცెనారియోల కోసం ఎలా విస్తరించి అనుకూలీకరించవచ్చో, అలాగే భద్రత, మానిటరింగ్, మరియు స్కేలబిలిటీకి సంబంధించిన ఉత్తమ పద్ధతులను నియమిస్తూ చూపిస్తుంది.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**స్పష్టీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా అసమర్థతలు ఉండవచ్చు అని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలోని సంచికను అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి, వృత్తిపరమైన మానవ అనువాదాన్ని సూచిస్తాము. ఈ అనువాదం వాడకముచే కలిగే ఏవైనా అపార్థాలు లేదా తప్పుడు అర్థనిర్వచనల కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->