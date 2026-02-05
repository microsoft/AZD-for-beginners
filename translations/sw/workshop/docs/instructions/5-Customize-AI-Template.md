# 5. Kubina Mwelekeo wa Kiolezo

!!! tip "MWISHO WA MODULI HII UTAWEZA"

    - [ ] Kuchunguza uwezo wa wakala wa AI wa chaguo-msingi
    - [ ] Kuongeza Utafutaji wa AI kwa kutumia faharasa yako mwenyewe
    - [ ] Kuwasha na kuchambua vipimo vya Ufuatiliaji
    - [ ] Kutekeleza tathmini ya utendaji
    - [ ] Kutekeleza uchunguzi wa usalama (red-teaming)
    - [ ] **Maabara ya 5: Kujenga Mpango wa Kubinafsisha** 

---

## 5.1 Uwezo wa Wakala wa AI

!!! success "Tumekamilisha hili katika Maabara ya 01"

- **Utafutaji wa Faili**: Utafutaji wa faili wa OpenAI kwa upatikanaji wa maarifa
- **Marejeleo**: Utoaji wa vyanzo kiotomatiki katika majibu
- **Maelekezo Yanayoweza Kubadilishwa**: Badilisha tabia na utu wa wakala
- **Ujumuishaji wa Zana**: Mfumo unaoweza kupanuliwa kwa uwezo maalum

---

## 5.2 Chaguo za Upatikanaji wa Maarifa

!!! task "Ili kukamilisha hili tunahitaji kufanya mabadiliko na kupeleka tena"    
    
    ```bash title=""
    # Weka vigezo vya mazingira
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Pakia data na unda faharasa yangu

    ```

---

**Utafutaji wa Faili wa OpenAI (Chaguo-msingi):**

- Imejumuishwa katika huduma ya wakala wa Azure AI
- Usindikaji wa hati na faharasa kiotomatiki
- Hakuna usanidi wa ziada unaohitajika

**Utafutaji wa Azure AI (Hiari):**

- Utafutaji wa mseto wa semantiki na vekta
- Usimamizi wa faharasa maalum
- Uwezo wa utafutaji wa hali ya juu
- Inahitaji `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Ufuatiliaji na Ufuatiliaji](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Ili kukamilisha hili tunahitaji kufanya mabadiliko na kupeleka tena"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Ufuatiliaji:**

- Ujumuishaji wa OpenTelemetry
- Ufuatiliaji wa maombi/majibu
- Vipimo vya utendaji
- Inapatikana katika portal ya AI Foundry

**Kumbukumbu:**

- Kumbukumbu za programu katika Container Apps
- Kumbukumbu zilizopangwa na vitambulisho vya uhusiano
- Kutazama kumbukumbu za wakati halisi na za kihistoria

---

## 5.4 [Tathmini ya Wakala](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Tathmini ya Ndani:**

- Tathmini zilizojengwa ndani kwa ajili ya kupima ubora
- Hati za tathmini maalum
- Upimaji wa utendaji

**Ufuatiliaji Endelevu:**

- Tathmini ya kiotomatiki ya mwingiliano wa moja kwa moja
- Ufuatiliaji wa vipimo vya ubora
- Kugundua kupungua kwa utendaji

**Ujumuishaji wa CI/CD:**

- Mtiririko wa kazi wa GitHub Actions
- Upimaji na tathmini kiotomatiki
- Upimaji wa kulinganisha takwimu

---

## 5.5 [Wakala wa AI Red Teaming](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Uchunguzi wa usalama kiotomatiki
- Tathmini ya hatari kwa mifumo ya AI
- Ukaguzi wa usalama katika kategoria mbalimbali

**Uthibitishaji:**

- Utambulisho unaosimamiwa kwa huduma za Azure
- Uthibitishaji wa hiari wa Azure App Service
- Njia mbadala ya uthibitishaji wa msingi kwa maendeleo

!!! quote "MWISHO WA MAABARA HII UNAPASWA KUWA NA"
    - [ ] Kuelezea mahitaji ya hali yako
    - [ ] Kubinafsisha vigezo vya mazingira (usanidi)
    - [ ] Kubinafsisha maelekezo ya wakala (kazi)
    - [ ] Kupeleka kiolezo kilichobinafsishwa (programu)
    - [ ] Kukamilisha kazi za baada ya kupeleka (mwongozo)
    - [ ] Kuendesha tathmini ya majaribio

Mfano huu unaonyesha kubinafsisha kiolezo kwa matumizi ya rejareja ya biashara na mawakala maalum wawili na miundombinu mingi ya modeli.

---

## 5.6 Kibinafsishe Kwa Ajili Yako!

### 5.6.1. Mahitaji ya Hali

#### **Upelekwaji wa Mawakala:** 

   - Wakala wa Shopper: Husaidia wateja kupata na kulinganisha bidhaa
   - Wakala wa Loyalty: Husimamia zawadi na matangazo ya wateja

#### **Upelekwaji wa Modeli:**

   - `gpt-4.1`: Modeli kuu ya mazungumzo
   - `o3`: Modeli ya kufikiri kwa maswali magumu
   - `gpt-4.1-nano`: Modeli nyepesi kwa mwingiliano rahisi
   - `text-embedding-3-large`: Ubora wa juu wa embeddings kwa utafutaji

#### **Vipengele:**

   - Ufuatiliaji na ufuatiliaji vimewezeshwa
   - Utafutaji wa AI kwa katalogi ya bidhaa
   - Mfumo wa tathmini kwa uhakikisho wa ubora
   - Red teaming kwa uthibitishaji wa usalama

---

### 5.6.2 Utekelezaji wa Hali


#### 5.6.2.1. Usanidi Kabla ya Upelekwaji

Unda hati ya usanidi (`setup-retail.sh`)

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

#### 5.6.2.2: Maelekezo ya Mawakala

Unda `custom-agents/shopper-agent-instructions.md`:

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

Unda `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Hati ya Upelekwaji

Unda `deploy-retail.sh`:

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

#### 5.6.2.4: Usanidi Baada ya Upelekwaji

Unda `configure-retail-agents.sh`:

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

### 5.6.3: Upimaji na Uthibitishaji

Unda `test-retail-deployment.sh`:

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

### 5.6.4 Matokeo Yanayotarajiwa

Baada ya kufuata mwongozo huu wa utekelezaji, utakuwa na:

1. **Miundombinu Iliyowekwa:**

      - Mradi wa AI Foundry na upelekwaji wa modeli
      - Container Apps zinazohifadhi programu ya wavuti
      - Huduma ya Utafutaji wa AI kwa katalogi ya bidhaa
      - Application Insights kwa ufuatiliaji

2. **Wakala wa Awali:**

      - Wakala wa Shopper aliyesanidiwa na maelekezo ya msingi
      - Uwezo wa utafutaji wa faili umewezeshwa
      - Ufuatiliaji na ufuatiliaji vimewezeshwa

3. **Tayari kwa Kubinafsisha:**

      - Mfumo wa kuongeza Wakala wa Loyalty
      - Violezo vya maelekezo maalum
      - Hati za upimaji na uthibitishaji
      - Usanidi wa ufuatiliaji na tathmini

4. **Uwezo wa Uzalishaji:**

      - Uchunguzi wa usalama na red teaming
      - Ufuatiliaji wa utendaji
      - Mfumo wa tathmini ya ubora
      - Miundombinu inayoweza kupanuka

Mfano huu unaonyesha jinsi kiolezo cha AZD kinaweza kupanuliwa na kubinafsishwa kwa hali maalum za biashara huku ukizingatia mbinu bora za usalama, ufuatiliaji, na upanuzi.

---

