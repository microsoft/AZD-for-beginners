# 5. ఒక టెంప్లేట్‌ను అనుకూలీకరించండి

!!! tip "ఈ మాడ్యూల్ ముగిసే వరకు మీరు చేయగలవు"

    - [ ] డిఫాల్ట్ AI ఏజెంట్ సామర్థ్యాలను అన్వేషించారు
    - [ ] మీ స్వంత సూచికతో AI శోధనను జోడించారు
    - [ ] ట్రేసింగ్ మేట్రిక్స్‌లను యాక్టివేట్ చేసి విశ్లేషించారు
    - [ ] ఒక మూల్యాంకన రన్‌ను అమలుించారు
    - [ ] రెడ్-టీమింగ్ స్కాన్‌ను అమలు చేశారు
    - [ ] **ల్యాబ్ 5: అనుకూలీకరణ ప్రణాళికను రూపొందించారు** 

---

## 5.1 AI ఏజెంట్ సామర్థ్యాలు

!!! success "మేము దీన్ని ల్యాబ్ 01లో పూర్తి చేశాం"

- **ఫైల్ శోధన**: జ్ఞానం పొందడానికి OpenAI యొక్క బిల్ట్-ఇన్ ఫైల్ శోధన
- **మూల సూచనలు**: స్పందనలలో స్వయంచాలిత మూల సూచన
- **అనుకూలీకరించగల సూచనలు**: ఏజెంట్ ప్రవర్తన మరియు వ్యక్తిత్వాన్ని మార్చండి
- **టూల్ ఇంటిగ్రేషన్**: అనుకూల సామర్థ్యాల కోసం విస్తరించదగిన టూల్ సిస్టమ్

---

## 5.2 జ్ఞానం పొందే ఎంపికలు

!!! task "దీన్ని పూర్తి చేయడానికి మేము మార్పులు చేసి మళ్లీ అమలు చేయాలి"    
    
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

**OpenAI ఫైల్ శోధన (డిఫాల్ట్):**

- Foundry ఏజెంట్లలో బిల్ట్-ఇన్
- డాక్యుమెంట్లను ఆటోమేటిక్‌గా ప్రాసెస్ చేసి సూచిక చేయటం
- అదనపు కాన్ఫిగరేషన్ అవసరం లేదు

**Azure AI Search (ఐచ్ఛికం):**

- హైబ్రిడ్ సేమాంటిక్ మరియు వెక్టర్ శోధన
- అనుకూల సూచిక నిర్వహణ
- అధునాతన శోధన సామర్థ్యాలు
- Requires `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ట్రేసింగ్ & మానిటరింగ్](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "దీన్ని పూర్తి చేయడానికి మేము మార్పులు చేసి మళ్లీ అమలు చేయాలి"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ట్రేసింగ్:**

- OpenTelemetry సమగ్రత
- రిక్వెస్ట్/స్పందన ట్రాకింగ్
- పనితీరు మెట్రిక్స్
- Microsoft Foundry పోర్టల్‌లో అందుబాటులో ఉంది

**లాగింగ్:**

- Container Apps‌లో అప్లికేషన్ లాగ్లు
- కోరిలేషన్ IDలతో నిర్మిత లాగింగ్
- రియల్-టైమ్ మరియు చరిత్రాత్మక లాగ్ వీక్షణ

---

## 5.4 [ఏజెంట్ మూల్యాంకనం](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**లోకల్ మూల్యాంకనం:**

- నాణ్యత అంచనా కోసం బిల్ట్-ఇన్ ఈవాల్యువేటర్లు
- అనుకూల మూల్యాంకన స్క్రిప్టులు
- పనితీరు బెంచ్‌మార్కింగ్

**నిరంతర మానిటరింగ్:**

- లైవ్ ఇంటరాక్షన్‌ల స్వయంచాలిత మూల్యాంకనం
- నాణ్యత మెట్రిక్స్ ట్రాకింగ్
- పనితీరు రిగ్రెషన్ గుర్తింపు

**CI/CD సమైక్యత:**

- GitHub Actions వర్క్‌ఫ్లో
- ఆటోమేటెడ్ టెస్టింగ్ మరియు మూల్యాంకనం
- సాంఖ్యిక సంబంధమైన సరిపోలిక పరీక్షలు

---

## 5.5 [AI రెడ్-టీమింగ్ ఏజెంట్](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI రెడ్-టీమింగ్:**

- ఆటోమేటెడ్ సెక్యూరిటీ స్కానింగ్
- AI సిస్టమ్‌లకు ప్రమాద అంచనా
- అనేక వర్గాలుగా సురక్షత మూల్యాంకనం

**ప్రామాణీకరణ:**

- Azure సేవల కోసం Managed Identity
- ఐచ్ఛిక Azure App Service ప్రామాణీకరణ
- డెవలప్‌మెంట్ కోసం బేసిక్ ఆథ్ ఫాల్‌బ్యాక్



!!! quote "ఈ ల్యాబ్ ముగిసే వరకు మీ వద్ద ఇవి ఉండవలసినవి"
    - [ ] మీ సన్నివేశ అవసరాలను నిర్వచించండి
    - [ ] కస్టమైజ్ చేసిన env వేరియబుల్స్ (config)
    - [ ] కస్టమైజ్ చేసిన ఏజెంట్ సూచనలు (task)
    - [ ] కస్టమైజ్ చేసిన టెంప్లేట్‌ను డిప్లాయ్ చేయండి (app)
    - [ ] పోస్ట్-డిప్లాయ్‌మెంట్ పనులను పూర్తి చేయండి (manual)
    - [ ] ఒక టెస్ట్ మూల్యాంకనాన్ని اجرا చేసి చూడండి

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 మీకోసం దీనిని అనుకూలీకరించండి!

### 5.6.1. సన్నివేశ అవసరాలు

#### **ఏజెంట్ డిప్లాయ్‌మెంట్లు:** 

   - Shopper Agent: కస్టమర్లకు ఉత్పత్తులను కనుగొనడంలో మరియు పోల్చుకోడంలో సహాయపడుతుంది
   - Loyalty Agent: కస్టమర్ రివార్డ్స్ మరియు ప్రమోషన్లను నిర్వహిస్తుంది

#### **మోడల్ డిప్లాయ్‌మెంట్లు:**

   - `gpt-4.1`: ప్రాథమిక చాట్ మోడల్
   - `o3`: క్లిష్టమైన ప్రశ్నల కోసం రీజనింగ్ మోడల్
   - `gpt-4.1-nano`: సులభ ఇంటరాక్షన్‌ల కోసం లైట్‌వెట్ మోడల్
   - `text-embedding-3-large`: శోధన కోసం ఉన్నత-నాణ్యత ఎంబెడ్డింగ్స్

#### **ఫీచర్లు:**

   - ట్రేసింగ్ మరియు మానిటరింగ్ ఎనేబుల్ చేయబడింది
   - ఉత్పత్తుల క్యాటలాగ్ కోసం AI శోధన
   - నాణ్యత హామీ కోసం మూల్యాంకన ఫ్రేమ్‌వర్క్
   - సెక్యూరిటీ ధృవీకరణ కోసం రెడ్-టీమింగ్

---

### 5.6.2 సన్నివేశ అమలీకరణ


#### 5.6.2.1. ముందస్తు-డిప్లాయ్‌మెంట్ కాన్ఫిగరేషన్

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# ఎన్విరాన్‌మెంట్ పేరు సెట్ చేయండి
azd env set AZURE_ENV_NAME "retail-ai-agents"

# ప్రాంతాన్ని కాన్ఫిగర్ చేయండి (మోడల్ లభ్యత ఆధారంగా ఎంచుకోండి)
azd env set AZURE_LOCATION "eastus2"

# అన్ని ఐచ్ఛిక సేవలను సక్రియం చేయండి
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# ప్రధాన చాట్ మోడల్‌ను కాన్ఫిగర్ చేయండి (gpt-4.1 — gpt-4.1కి అత్యంత సమీపంగా లభ్యమయ్యే మోడల్‌గా)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# మెరుగైన శోధన కోసం ఎంబెడ్డింగ్ మోడల్‌ను కాన్ఫిగర్ చేయండి
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ఏజెంట్ పేరు సెట్ చేయండి (మొదటి ఏజెంట్‌ను సృష్టిస్తుంది)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# శోధన సూచికను కాన్ఫిగర్ చేయండి
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: ఏజెంట్ సూచనలు

తయారుచేయండి `custom-agents/shopper-agent-instructions.md`:

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

తయారుచేయండి `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: డిప్లాయ్‌మెంట్ స్క్రిప్ట్

తయారుచేయండి `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# అవసరమైన ముందస్తు షరతులను ధృవీకరించండి
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# పరిసరాన్ని ఏర్పాటు చేయండి
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

# ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను అమలు చేయండి
echo "🏗️  Deploying Azure infrastructure..."
azd up

# డిప్లాయ్‌మెంట్ ఫలితాలను సేకరించండి
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# వెబ్ యాప్ URL‌ను పొందండి
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

#### 5.6.2.4: పోస్ట్-డిప్లాయ్‌మెంట్ కాన్ఫిగరేషన్

తయారుచేయండి `configure-retail-agents.sh`:

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

### 5.6.3: పరీక్షలు మరియు ధృవీకరణ

తయారుచేయండి `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# పర్యావరణ వేరియబుల్స్ సెట్ అయ్యాయో ధృవీకరించండి
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# వెబ్ అప్లికేషన్ అందుబాటును పరీక్షించండి
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

# కాన్ఫిగర్ చేయబడ్డట్లయితే మూల్యాంకనాన్ని నడపండి
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

ఈ అమలు గైడ్‌ను అనుసరించిన తర్వాత, మీ వద్ద ఈ క్రింది వాటి ఉంటాయి:

1. **అమలు చేసిన ఇన్ఫ్రాస్ట్రక్చర్:**

      - మోడల్ డిప్లాయ్‌మెంట్లతో Microsoft Foundry ప్రాజెక్ట్
      - వెబ్ అప్లికేషన్‌ను హోస్ట్ చేసే Container Apps
      - ఉత్పత్తుల క్యాటలాగ్ కోసం AI Search సేవ
      - మానిటరింగ్ కోసం Application Insights

2. **ప్రారంబిక ఏజెంట్:**

      - ప్రాథమిక సూచనలతో Shopper Agent కాన్ఫిగర్ చేయబడింది
      - ఫైల్ శోధన సామర్థ్యం ఎనేబుల్ చేయబడి ఉంది
      - ట్రేసింగ్ మరియు మానిటరింగ్ కాన్ఫిగర్ చేయబడ్డాయి

3. **అనుకూలీకరణ కోసం సిద్ధం:**

      - Loyalty Agent జోడించడానికి ఫ్రేమ్‌వర్క్
      - అనుకూల సూచన టెంప్లేట్లు
      - పరీక్షలు మరియు ధృవీకరణ స్క్రిప్టులు
      - మానిటరింగ్ మరియు మూల్యాంకన అమరిక

4. **ఉత్పత్తి సిద్ధత:**

      - రెడ్-టీమింగ్‌తో సెక్యూరిటీ స్కానింగ్
      - పనితీరు మానిటరింగ్
      - నాణ్యత మూల్యాంకన ఫ్రేమ్‌వర్క్
      - స్కేలబుల్ ఆర్కిటెక్చర్

ఈ ఉదాహరణ AZD టెంప్లేట్‌ను ప్రత్యేక సంస్థా సన్నివేశాలకు ఎలా విస్తరించి మరియు అనుకూలీకరించవచ్చో చూపిస్తుంది, అలాగే సెక్యూరిటీ, మానిటరింగ్ మరియు స్కేలబిలిటీ కోసం ఉత్తమ అభ్యాసాలను ఎలా పాటించాలో కూడా సూచిస్తుంది.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ డాక్యుమెంట్ AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, స్వయంచాలక అనువాదాలలో పొరపాట్లు లేదా తప్పిదాలు ఉండవచ్చని దయచేసి గమనించండి. దాని స్థానిక భాషలో ఉన్న మూల పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలక సమాచారానికి, వృత్తిపరమైన మానవ అనువాదాన్ని సిఫార్సు చేస్తాం. ఈ అనువాదాన్ని ఉపయోగించడంవల్ల ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాల కోసం మేము బాధ్యులు కాదని తెలియజేస్తున్నాము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->