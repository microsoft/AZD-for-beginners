# 5. Customize a Template

!!! tip "MWISHO WA MODULI HII UTAWEZA"

    - [ ] Umechunguza Uwezo wa Wakala wa AI uliowekwa kwa chaguo-msingi
    - [ ] Umeongeza Utafutaji wa AI kwa index yako mwenyewe
    - [ ] Umewezeshwa na kuchambua vipimo vya Ufuatiliaji
    - [ ] Umeendesha mtihani wa tathmini
    - [ ] Umeendesha skani ya red-teaming
    - [ ] **Lab 5: Umejenga Mpango wa Ubinafsishaji** 

---

## 5.1 AI Agent Capabilities

!!! success "Tumeikamilisha hii katika Lab 01"

- **File Search**: Utafutaji wa faili uliowekwa wa OpenAI kwa urejesho wa maarifa
- **Citations**: Utoaji wa vyanzo kwa majibu moja kwa moja
- **Customizable Instructions**: Badilisha tabia na utu wa wakala
- **Tool Integration**: Mfumo unaoweza kupanuliwa wa zana kwa uwezo maalum

---

## 5.2 Knowledge Retrieval Options

!!! task "Ili kumaliza hii tunahitaji kufanya mabadiliko na kupeleka tena"    
    
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

- Imejumuishwa ndani ya Foundry Agents
- Usindikaji wa nyaraka na uorodheshaji moja kwa moja
- Hakuna usanidi wa ziada unaohitajika

**Azure AI Search (Optional):**

- Utafutaji mseto wa kitaalamu na vector
- Usimamizi wa index iliyobinafsishwa
- Uwezo wa utafutaji wa hali ya juu
- Inahitaji `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Ili kumaliza hii tunahitaji kufanya mabadiliko na kupeleka tena"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- Uunganisho wa OpenTelemetry
- Ufuatiliaji wa maombi/jawabu
- Vipimo vya utendaji
- Inapatikana kwenye portal ya Microsoft Foundry

**Logging:**

- Rejista za programu katika Container Apps
- Uandishi wa kumbukumbu uliopangwa na vitambulisho vya uhusiano
- Kuangalia rejista kwa wakati halisi na za kihistoria

---

## 5.4 [Agent Evaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Local Evaluation:**

- Watafiti waliyojengwa kwa tathmini ya ubora
- Skripti za tathmini zilizobinafsishwa
- Kulinganisha utendaji

**Continuous Monitoring:**

- Tathmini ya moja kwa moja ya mwingiliano hai
- Ufuatiliaji wa vipimo vya ubora
- Ugundaji wa regression ya utendaji

**CI/CD Integration:**

- Mtiririko wa kazi wa GitHub Actions
- Upimaji na tathmini otomatiki
- Mtihani wa kulinganisha takwimu

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Skanning ya usalama otomatiki
- Tathmini ya hatari kwa mifumo ya AI
- Tathmini ya usalama katika makundi mbalimbali

**Authentication:**

- Managed Identity kwa huduma za Azure
- Uthibitishaji wa hiari wa Azure App Service
- Kushuka kwa uthibitishaji wa msingi kwa maendeleo



!!! quote "MWISHO WA MAABIRI HII UNGEWAWEZEKANA KUWA NA"
    - [ ] Fafanua mahitaji ya senario yako
    - [ ] Vigezo vya mazingira vilivyobinafsishwa (config)
    - [ ] Maelekezo ya wakala yaliyobinafsishwa (task)
    - [ ] Umepeleka kiolezo kilichobinafsishwa (app)
    - [ ] Umekamilisha kazi baada ya uanzishaji (manual)
    - [ ] Endesha tathmini ya jaribio

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Customize It For You!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: Husaidia wateja kupata na kulinganisha bidhaa
   - Loyalty Agent: Inasimamia zawadi na matangazo ya wateja

#### **Model Deployments:**

   - `gpt-4.1`: Modeli ya gumzo ya msingi
   - `o3`: Modeli ya mantiki kwa maswali magumu
   - `gpt-4.1-nano`: Modeli nyepesi kwa mwingiliano rahisi
   - `text-embedding-3-large`: Embeddings za ubora wa juu kwa utafutaji

#### **Features:**

   - Ufuatiliaji na uangalizi vimewezeshwa
   - Utafutaji wa AI kwa katalogi ya bidhaa
   - Mfumo wa tathmini kwa uhakikisho wa ubora
   - Red teaming kwa uthibitishaji wa usalama

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Weka jina la mazingira
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Sanidi eneo (chagua kulingana na upatikana wa modeli)
azd env set AZURE_LOCATION "eastus2"

# Washa huduma zote za hiari
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Sanidi modeli kuu ya mazungumzo (gpt-4.1 kama iliyo karibu zaidi inayopatikana kwa gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Sanidi modeli ya embedding kwa ajili ya utafutaji ulioboreshwa
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Weka jina la wakala (itaunda wakala wa kwanza)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Sanidi faharasa ya utafutaji
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

# Thibitisha mahitaji ya awali
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Sanidi mazingira
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Kagua kvota katika eneo lililochaguliwa
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

# Sambaza miundombinu na programu
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Kusanya matokeo ya uwekaji
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Pata URL ya programu ya wavuti
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

#### 5.6.2.4: Post-Deployment Config

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Pata taarifa za utekelezaji
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Maelekezo ya usanidi kwa mkono
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

# Hakikisha vigezo vya mazingira vimewekwa
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Jaribu upatikanaji wa programu ya wavuti
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

# Endesha tathmini ikiwa imewekwa
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

1. **Deployed Infrastructure:**

      - Mradi wa Microsoft Foundry unaowuka na utekelezaji wa modeli
      - Container Apps zinazoendesha programu ya wavuti
      - Huduma ya AI Search kwa katalogi ya bidhaa
      - Application Insights kwa ufuatiliaji

2. **Initial Agent:**

      - Shopper Agent imewekwa na maelekezo ya msingi
      - Uwezo wa utafutaji wa faili umewezeshwa
      - Ufuatiliaji na uangalizi vimewekwa

3. **Ready for Customization:**

      - Mfumo wa kuongeza Loyalty Agent
      - Violezo vya maelekezo vilivyobinafsishwa
      - Skripti za upimaji na uthibitisho
      - Uanzishaji wa ufuatiliaji na tathmini

4. **Production Readiness:**

      - Skanning ya usalama na red teaming
      - Ufuatiliaji wa utendaji
      - Mfumo wa tathmini ya ubora
      - Miundombinu inayoweza kupanuka

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Angalizo**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au zisizokuwa sahihi. Nyaraka ya asili katika lugha yake ya mama inapaswa kuzingatiwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatuwajibiki kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->