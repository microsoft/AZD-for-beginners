# 5. టెంప్లేట్‌ను అనుకూలీకరించండి

!!! tip "ఈ మాడ్యూల్ చివరిలో మీరు చేయగలరు"

    - [ ] డిఫాల్ట్ AI ఏజెంట్ సామర్థ్యాలను పరిశీలించారు
    - [ ] మీ స్వంత ఇండెక్స్‌తో AI సెర్చ్‌ను జోడించారు
    - [ ] ట్రేసింగ్ మేట్రిక్స్‌ను యాక్టివేట్ చేసి విశ్లేషించారు
    - [ ] ఒక ارزల్యుయేషన్ రన్‌ను నడిపించారు
    - [ ] రెడ్-టీమింగ్ స్కాన్‌ను నిర్వహించారు
    - [ ] **ల్యాబ్ 5: అనుకూలీకరణ ప్రణాళిక ను రూపొందించారు** 

---

## 5.1 AI ఏజెంట్ సామర్థ్యాలు

!!! success "మనం ఇది ల్యాబ్ 01లో పూర్తి చేసాము"

- **ఫైల్ సెర్చ్**: జ్ఞాన రిట్రీవల్ కోసం OpenAI యొక్క బిల్ట్-ఇన్ ఫైల్ సెర్చ్
- **సైటేషన్లు**: ప్రతిస్పందనల్లో ఆటోమేటిక్ మూలం అట్రిబ్యూషన్
- **అనుకూలీకరించుకునే సూచనలు**: ఏజెంట్ ప్రవర్తన మరియు వ్యక్తిత్వాన్ని మార్చండి
- **టూల్ ఇంటిగ్రేషన్**: అనుకూల సామర్థ్యాల కోసం విస్తరించదగిన టూల్ సిస్టమ్

---

## 5.2 జ్ఞాన రిట్రీవల్ ఎంపికలు

!!! task "ఇది పూర్తి చేయడానికి మనకు మార్పులు చేసి మళ్లీ డిప్లాయ్ చేయాల్సి ఉంటుంది"    
    
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

**OpenAI ఫైల్ సెర్చ్ (డిఫాల్ట్):**

- Foundry ఏజెంట్స్‌లో నిర్మించబడినది
- ఆటోమేటిక్ డాక్యుమెంట్ ప్రాసెసింగ్ మరియు ఇండెక్సింగ్
- అదనపు కాన్ఫిగరేషన్ అవసరం లేదు

**Azure AI సెర్చ్ (ఎంపిక):**

- హైబ్రిడ్ సేమాంటిక్ మరియు వెక్టర్ సెర్చ్
- కస్టమ్ ఇండెక్స్ నిర్వహణ
- అధునాతన సెర్చ్ సామర్థ్యాలు
- అవసరం: `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ట్రేసింగ్ & మానిటరింగ్](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "ఇది పూర్తి చేయడానికి మనకు మార్పులు చేసి మళ్లీ డిప్లాయ్ చేయాల్సి ఉంటుంది"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ట్రేసింగ్:**

- OpenTelemetry ఇంటిగ్రేషన్
- రిక్వెస్ట్/రెస్పాన్సు ట్రాకింగ్
- పర్ఫార్మెన్స్ మేట్రిక్స్
- Microsoft Foundry పోర్టల్‌లో అందుబాటులో ఉంది

**లాగింగ్:**

- Container Apps‌లో అప్లికేషన్ లాగ్స్
- కారెలేషన్ IDలతో నిర్మాణాబద్ధ లాగింగ్
- రియల్-టైమ్ మరియు చారిత్రక లాగ్ వీక్షణ

---

## 5.4 [ఏజెంట్ మూల్యాంకనం](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**లోకల్ మూల్యాంకనం:**

- నాణ్యత అంచనా కోసం బిల్ట్-ఇన్ ఎవాల్యుయేటర్లు
- కస్టమ్ ఎవాల్యుయేషన్ స్క్రిప్టులు
- పర్ఫార్మెన్స్ బెంచ్‌మార్కింగ్

**నిరంతర మానిటరింగ్:**

- లైవ్ ఇంటరాక్షన్ల ఆటోమేటిక్ మూల్యాంకనం
- నాణ్యత మేట్రిక్స్ ట్రాకింగ్
- పర్ఫార్మెన్స్ రిగ్రెషన్ గుర్తింపు

**CI/CD ఇంటిగ్రేషన్:**

- GitHub Actions వర్క్‌ఫ్లో
- ఆటోమేటెడ్ టెస్టింగ్ మరియు ఎవాల్యుయేషన్
- సాంఖ్యిక తులనా పరీక్షలు

---

## 5.5 [AI రెడ్-టీమింగ్ ఏజెంట్](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI రెడ్-టీమింగ్:**

- ఆటోమేటెడ్ సెక్యూరిటీ స్కానింగ్
- AI వ్యవస్థల కోసం రిస్క్ అంచనా
- వివిధ వర్గాలపై భద్రతా మూల్యాంకనం

**ప్రామాణీకరణ:**

- Azure సేవల కోసం Managed Identity
- ఐచ్ఛిక Azure App Service ప్రామాణీకరణ
- డెవలప్‌మెంట్ కోసం బేసిక్ ఆథ్ ఫాల్బ్యాక్



!!! quote "ఈ ల్యాబ్ చివరికి మీరు కలిగి ఉండాలి"
    - [ ] మీ సన్నివేశ అవసరాలను నిర్వచించండి
    - [ ] env వేరియబుల్స్ (config) అనుకూలీకరించారు
    - [ ] ఏజెంట్ సూచనలను (టాస్క్) అనుకూలీకరించారు
    - [ ] అనుకూలీకరించిన టెంప్లేట్ (app) ను డిప్లాయ్ చేశారు
    - [ ] పోస్ట్-డిప్లాయ్‌మెంట్ పనులను (మ్యాన్యువల్) పూర్తిచేశారు
    - [ ] ఒక టెస్ట్ ఎవాల్యుయేషన్ నడిపించారు

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 మీ కోసం దీన్ని అనుకూలీకరించండి!

### 5.6.1. సన్నివేశ అవసరాలు

#### **ఏజెంట్ డిప్లాయ్‌మెంట్‌లు:** 

   - Shopper Agent: కస్టమర్లకు ఉత్పత్తులను కనుగొనడంలో మరియు పోల్చడంలో సహాయపడుతుంది
   - Loyalty Agent: కస్టమర్ రివార్డ్స్ మరియు ప్రమోషన్లు నిర్వహిస్తుంది

#### **మోడల్ డిప్లాయ్‌మెంట్‌లు:**

   - `gpt-4.1`: ప్రధాన చాట్ మోడల్
   - `o3`: క్లిష్ట ప్రశ్నలకు రీజనింగ్ మోడల్
   - `gpt-4.1-nano`: సులభ పరస్పర చర్యల కోసం లైట్‌వెయిట్ మోడల్
   - `text-embedding-3-large`: సెర్చ్ కోసం అధిక-నాణ్యత ఎంబెడ్డింగ్స్

#### **ఫీచర్స్:**

   - ట్రేసింగ్ మరియు మానిటరింగ్ ఎనేబుల్ చేయబడ్డాయి
   - ఉత్పత్తుల కేటలాగ్ కోసం AI సెర్చ్
   - నాణ్యత భరోసా కోసం ఎవాల్యుయేషన్ ఫ్రేమ్‌వర్క్
   - భద్రతా ధృవీకరణ కోసం రెడ్-టీమింగ్

---

### 5.6.2 సన్నివేశ అమలు


#### 5.6.2.1. ప్రీ-డిప్లాయ్‌మెంట్ కాన్ఫిగ్

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# పర్యావరణం పేరు సెట్ చేయండి
azd env set AZURE_ENV_NAME "retail-ai-agents"

# ప్రాంతాన్ని కాన్ఫిగర్ చేయండి (మోడల్ అందుబాటుపై ఆధారపడి ఎంచుకోండి)
azd env set AZURE_LOCATION "eastus2"

# అన్ని ఐచ్ఛిక సేవలను ప్రారంభించండి
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# ప్రధాన చాట్ మోడల్‌ను కాన్ఫిగర్ చేయండి (gpt-4.1 కు అత్యంత సమీపంగా లభించేదిగా gpt-4o)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# మెరుగైన శోధన కోసం ఎంబెడ్డింగ్ మోడల్‌ను కాన్ఫిగర్ చేయండి
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ఏజెంట్ పేరును సెట్ చేయండి (ఇది మొదటి ఏజెంట్‌ను సృష్టిస్తుంది)
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

#### 5.6.2.3: డిప్లాయ్‌మెంట్ స్క్రిప్ట్

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

# పర్యావరణాన్ని అమర్చండి
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# ఎంచుకున్న ప్రాంతంలో క్వోటాను తనిఖీ చేయండి
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

# మౌలిక సదుపాయాలు మరియు అప్లికేషన్‌ను అమలు చేయండి
echo "🏗️  Deploying Azure infrastructure..."
azd up

# డిప్లాయ్‌మెంట్ ఫలితాలను సంగ్రహించండి
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# వెబ్ యాప్ యొక్క URL ను పొందండి
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

#### 5.6.2.4: పోస్ట్-డిప్లాయ్‌మెంట్ కాన్ఫిగ్

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# డిప్లాయ్‌మెంట్ సమాచారాన్ని 얻ండి
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

### 5.6.3: టెస్టింగ్ మరియు ధృవీకరణ

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# పర్యావరణ చరాలు సెట్ చేయబడ్డాయా అని నిర్దారించండి
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# వెబ్ అప్లికేషన్ లభ్యతను పరీక్షించండి
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

# స్థాపించబడ్డట్లయితే మూల్యాంకనాన్ని నడపండి
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

### 5.6.4 ఆశించదగిన ఫలితాలు

After following this implementation guide, you will have:

1. **డిప్లాయ్ చేయబడిన ఇన్‌ఫ్రాస్ట్రక్చర్:**

      - Microsoft Foundry ప్రాజెక్ట్ మోడల్ డిప్లాయ్‌మెంట్‌లతో
      - వెబ్ అప్లికేషన్‌ను హోస్ట్ చేస్తున్న Container Apps
      - ఉత్పత్తుల కేటలాగ్ కోసం AI Search సర్వీస్
      - మానిటరింగ్ కోసం Application Insights

2. **ప్రాథమిక ఏజెంట్:**

      - Shopper Agent ప్రాథమిక సూచనలతో కాన్ఫిగర్ చేయబడింది
      - ఫైల్ సెర్చ్ సామర్థ్యం ఎనేబుల్ చేయబడింది
      - ట్రేసింగ్ మరియు మానిటరింగ్ కాన్ఫిగర్ చేయబడ్డాయి

3. **అనుకూలీకరణకు సిద్ధం:**

      - Loyalty Agent చేర్చడానికి ఫ్రేమ్‌వర్క్
      - కస్టమ్ సూచన టెంప్లేట్లు
      - పరీక్ష మరియు ధృవీకరణ స్క్రిప్టులు
      - మానిటరింగ్ మరియు ఎవాల్యుయేషన్ సెటప్

4. **ప్రొడక్షన్ సిద్ధత:**

      - రెడ్-టీమింగ్‌తో భద్రతా స్కానింగ్
      - పర్ఫార్మెన్స్ మానిటరింగ్
      - నాణ్యత ఎవాల్యుయేషన్ ఫ్రేమ్‌వర్క్
      - స్కేలబుల్ ఆర్కిటెక్చర్

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో తప్పులు లేదా లోపాలు ఉండే అవకాశం ఉందని గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలో ఉన్న సంచికను అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారం కోసం నిపుణుల చేతి మానవ అనువాదం సూచించబడుతుంది. ఈ అనువాదం ఉపయోగంతో కలిగే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడానికి మేము బాధ్యులు కాదని తెలియజేస్తాము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->