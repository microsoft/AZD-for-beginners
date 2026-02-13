# 5. Customize a Template

!!! tip "MWISHO WA MODULI HII UTAWEZA"

    - [ ] Umechunguza uwezo wa wakala wa AI kwa chaguo-msingi
    - [ ] Umeongeza Utafutaji wa AI kwa faharasa yako
    - [ ] Umewezeshwa na kuchambua vigezo vya ufuatiliaji
    - [ ] Umeendesha mtihani wa tathmini
    - [ ] Umeendesha skani ya red-teaming
    - [ ] **Maabara 5: Imejengwa Mpango wa Ubinafsishaji** 

---

## 5.1 AI Agent Capabilities

!!! success "Tumekamilisha hili katika Maabara 01"

- **File Search**: Utafutaji wa faili uliowekwa ndani wa OpenAI kwa kupata maarifa
- **Citations**: Utoaji wa marejeo ya vyanzo kiotomatiki katika majibu
- **Customizable Instructions**: Badilisha tabia na utu wa wakala
- **Tool Integration**: Mfumo wa zana unaoweza kupanuka kwa uwezo maalum

---

## 5.2 Knowledge Retrieval Options

!!! task "Ili kukamilisha hili tunahitaji kufanya mabadiliko na kuzindua upya"    
    
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

- Imejengwa ndani ya Foundry Agents
- Usindikaji wa nyaraka na uorodheshaji kiotomatiki
- Hakuna usanidi wa ziada unaohitajika

**Azure AI Search (Optional):**

- Utafutaji mseto wa semantiki na vector
- Usimamizi wa faharasa maalum
- Uwezo wa utafutaji wa hali ya juu
- Inahitaji `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Ufuatiliaji & Uangalizi](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Ili kukamilisha hili tunahitaji kufanya mabadiliko na kuzindua upya"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Ufuatiliaji:**

- Uunganisho wa OpenTelemetry
- Ufuatiliaji wa ombi/jawabu
- Vipimo vya utendaji
- Inapatikana kwenye lango la Microsoft Foundry

**Logging:**

- Kumbukumbu za programu katika Container Apps
- Uandishi wa kumbukumbu uliopangwa kwa vitambulisho vya uhusiano
- Kutazama kumbukumbu kwa wakati halisi na za kihistoria

---

## 5.4 [Tathmini ya Wakala](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Tathmini ya Ndani:**

- Vitathmini vilivyojengwa kwa ajili ya tathmini ya ubora
- Skripti za tathmini zilizobinafsishwa
- Ulinganishaji wa utendaji

**Ufuatiliaji Endelevu:**

- Tathmini ya otomatiki ya mwingiliano wa moja kwa moja
- Ufuatiliaji wa vigezo vya ubora
- Ugundaji wa mnyororo wa utendaji

**Uunganisho wa CI/CD:**

- Mtiririko wa kazi wa GitHub Actions
- Upimaji na tathmini vilivyooautomatishwa
- Upimaji wa kulinganisha kwa takwimu

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Skanning ya usalama kiotomatiki
- Tathmini ya hatari kwa mifumo ya AI
- Tathmini ya usalama katika makundi mbalimbali

**Authentication:**

- Utambulisho uliosimamiwa kwa huduma za Azure
- Uthibitishaji wa Azure App Service (hiari)
- Uthibitishaji wa msingi kama njia mbadala kwa maendeleo



!!! quote "MWISHO WA MAABARA HII UNAPASWA KUWA NA"
    - [ ] Bainisha mahitaji ya matukio yako
    - [ ] Vigezo vya mazingira vilivyobinafsishwa (usanidi)
    - [ ] Maelekezo ya wakala yaliyobinafsishwa (kazi)
    - [ ] Umezindua kiolezo kilichobinafsishwa (app)
    - [ ] Umekamilisha kazi za baada ya uenezaji (kwa mkono)
    - [ ] Endesha tathmini ya majaribio

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Customize It For You!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: Husaidia wateja kupata na kulinganisha bidhaa
   - Loyalty Agent: Husimamia zawadi na matangazo kwa wateja

#### **Model Deployments:**

   - `gpt-4.1`: Mfano mkuu wa mazungumzo
   - `o3`: Mfano wa mantiki kwa maswali magumu
   - `gpt-4.1-nano`: Mfano mwepesi kwa mwingiliano rahisi
   - `text-embedding-3-large`: Embedding za ubora wa juu kwa utafutaji

#### **Features:**

   - Ufuatiliaji na uangalizi vimewezeshwa
   - Utafutaji wa AI kwa katalogi ya bidhaa
   - Mfumo wa tathmini kwa uhakikisho wa ubora
   - Red teaming kwa uhakiki wa usalama

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Weka jina la mazingira
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Sanidi eneo (chagua kulingana na upatikanaji wa modeli)
azd env set AZURE_LOCATION "eastus2"

# Wezesha huduma zote za hiari
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Sanidi modeli kuu ya mazungumzo (gpt-4o kama inayokaribia zaidi inayopatikana kwa gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
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

# Kagua kikomo (quota) katika eneo lililochaguliwa
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

# Sambaza miundombinu na programu
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Chukua matokeo za uwekaji
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Pata URL ya programu ya wavuti
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

# Pata taarifa za utoaji
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

# Thibitisha vigezo vya mazingira vimewekwa
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Jaribu upatikanaji wa programu ya wavuti
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

      - Mradi wa Microsoft Foundry wenye ueneaji wa mifano
      - Container Apps zinazohudumia programu ya wavuti
      - Huduma ya AI Search kwa katalogi ya bidhaa
      - Application Insights kwa ufuatiliaji

2. **Initial Agent:**

      - Wakala wa Mnunuzi amewekwa na maelekezo ya msingi
      - Uwezo wa utafutaji wa faili umewezeshwa
      - Ufuatiliaji na uangalizi vimewekwa

3. **Ready for Customization:**

      - Mfumo wa kuongeza Wakala wa Uaminifu
      - Mifano ya maelekezo iliyobinafsishwa
      - Skripti za upimaji na uthibitishaji
      - Usanidi wa ufuatiliaji na tathmini

4. **Production Readiness:**

      - Skanning ya usalama kwa red teaming
      - Ufuatiliaji wa utendaji
      - Mfumo wa tathmini ya ubora
      - Usanifu unaoweza kupanuka

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutokuwajibika:
Nyaraka hii imetatuliwa/imetafsiriwa kwa kutumia huduma ya tafsiri ya AI Co-op Translator (https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya asili kwa lugha yake ya asili inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya kitaalamu iliyoonyeshwa na mtaalamu wa binadamu. Hatuwajibiki kwa uelewa potofu, tafsiri isiyo sahihi, au maelezo yoyote yasiyoeleweka yanayotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->