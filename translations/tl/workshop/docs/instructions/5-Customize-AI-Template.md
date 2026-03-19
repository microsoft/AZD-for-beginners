# 5. I-customize ang Template

!!! tip "SA PAGWAWAKAS NG MODULONG ITO MAAARI MO NANG:"

    - [ ] Nasuri ang default na kakayahan ng AI Agent
    - [ ] Idinagdag ang AI Search gamit ang sarili mong index
    - [ ] Na-activate at na-analisa ang mga sukatan ng tracing
    - [ ] Isinagawa ang isang evaluation run
    - [ ] Isinagawa ang isang red-teaming scan
    - [ ] **Lab 5: Nilikha ang Plano ng Pag-customize** 

---

## 5.1 Mga Kakayahan ng AI Agent

!!! success "Natapos namin ito sa Lab 01"

- **File Search**: Built-in ng OpenAI para sa pagkuha ng kaalaman mula sa mga file
- **Citations**: Awtomatikong paglalagay ng pinanggalingan sa mga tugon
- **Customizable Instructions**: Baguhin ang pag-uugali at personalidad ng agent
- **Tool Integration**: Pinalalawak na sistema ng mga tool para sa mga pasadyang kakayahan

---

## 5.2 Mga Opsyon sa Pagkuha ng Kaalaman

!!! task "Upang makumpleto ito kailangan nating gumawa ng mga pagbabago at mag-redeploy"    
    
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

- Built-in sa Foundry Agents
- Awtomatikong pagproseso at pag-index ng mga dokumento
- Walang karagdagang konfigurasiyon na kinakailangan

**Azure AI Search (Optional):**

- Hybrid na semantic at vector na paghahanap
- Pamamahala ng pasadyang index
- Mga advanced na kakayahan sa paghahanap
- Nangangailangan ng `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing at Pagsubaybay](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Upang makumpleto ito kailangan nating gumawa ng mga pagbabago at mag-redeploy"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- Integrasyon ng OpenTelemetry
- Pagsubaybay sa request/response
- Mga sukatan ng pagganap
- Magagamit sa Microsoft Foundry portal

**Logging:**

- Mga application log sa Container Apps
- Istrakturadong pag-log na may mga correlation ID
- Pagtingin ng mga log nang real-time at historikal

---

## 5.4 [Pagsusuri ng Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokal na Pagsusuri:**

- Mga built-in evaluator para sa pagtatasa ng kalidad
- Mga pasadyang script ng pagsusuri
- Pagsusukat ng pagganap

**Patuloy na Pagsubaybay:**

- Awtomatikong pagsusuri ng mga aktwal na interaksyon
- Pagsubaybay sa mga sukatan ng kalidad
- Pag-detect ng regression sa pagganap

**Integrasyon ng CI/CD:**

- GitHub Actions workflow
- Awtomatikong pagsubok at pagsusuri
- Estadistikal na paghambing na pagsusuri

---

## 5.5 [Ahente ng AI Red Teaming](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Awtomatikong pag-scan sa seguridad
- Pagtatasa ng panganib para sa mga sistema ng AI
- Pagsusuri ng kaligtasan sa iba't ibang kategorya

**Authentication:**

- Managed Identity para sa mga serbisyo ng Azure
- Opsyonal na authentication ng Azure App Service
- Basic auth fallback para sa development



!!! quote "SA PAGWAWAKAS NG LAB NA ITO DAPAT AY NAGAWA MO NA"
    - [ ] Tukuyin ang iyong mga kinakailangan sa scenario
    - [ ] Na-customize ang mga env variable (config)
    - [ ] Na-customize ang mga instruksyon ng agent (task)
    - [ ] Na-deploy ang na-customize na template (app)
    - [ ] Nakumpleto ang mga post-deployment na gawain (manwal)
    - [ ] Napatakbo ang isang test evaluation

Ang halimbawang ito ay nagpapakita ng pag-customize ng template para sa isang enterprise retail na kaso ng paggamit na may dalawang espesyal na ahente at maraming deployment ng modelo.

---

## 5.6 I-customize Ito Para sa Iyo!

### 5.6.1 Mga Kinakailangan ng Scenario

#### **Deployment ng mga Ahente:** 

   - Shopper Agent: Tinutulungan ang mga customer na maghanap at maghambing ng mga produkto
   - Loyalty Agent: Namamahala sa mga gantimpala at promosyon ng mga customer

#### **Deployment ng mga Modelo:**

   - `gpt-4.1`: Pangunahing chat na modelo
   - `o3`: Modelong pang-reasoning para sa mga kumplikadong query
   - `gpt-4.1-nano`: Magaan na modelo para sa simpleng mga interaksyon
   - `text-embedding-3-large`: Mataas na kalidad na embeddings para sa paghahanap

#### **Mga Tampok:**

   - Naka-enable ang tracing at pagsubaybay
   - AI Search para sa katalogo ng produkto
   - Framework ng pagsusuri para sa pagsiguro ng kalidad
   - Red teaming para sa pag-validate ng seguridad

---

### 5.6.2 Implementasyon ng Scenario


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Itakda ang pangalan ng environment
azd env set AZURE_ENV_NAME "retail-ai-agents"

# I-configure ang rehiyon (pumili batay sa pagkakaroon ng modelo)
azd env set AZURE_LOCATION "eastus2"

# Paganahin ang lahat ng opsyonal na serbisyo
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# I-configure ang pangunahing modelong chat (gpt-4.1 bilang pinakamalapit na magagamit sa gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# I-configure ang modelong embedding para sa pinahusay na paghahanap
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Itakda ang pangalan ng ahente (lilikha ng unang ahente)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# I-configure ang index ng paghahanap
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Mga Instruksyon ng Ahente

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

#### 5.6.2.3: Script ng Deployment

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Suriin ang mga prerekisito
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Ihanda ang kapaligiran
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Suriin ang kuota sa napiling rehiyon
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

# I-deploy ang imprastruktura at aplikasyon
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Kunin ang mga resulta ng pag-deploy
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Kunin ang URL ng web app
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

# Kunin ang impormasyon ng deployment
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Mga tagubilin para sa manu-manong pagsasaayos
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

### 5.6.3: Pagsubok at Pagpapatunay

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Tiyakin na nakatakda ang mga variable ng kapaligiran
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Subukan kung magagamit ang web application
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

# Patakbuhin ang pagsusuri kung naka-configure
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

### 5.6.4 Mga Inaasahang Kinalabasan

Pagkatapos sundin ang gabay na implementasyong ito, magkakaroon ka ng:

1. **Na-deploy na Imprastruktura:**

      - Microsoft Foundry project na may mga deployment ng modelo
      - Container Apps na nagho-host ng web application
      - AI Search service para sa katalogo ng produkto
      - Application Insights para sa pagsubaybay

2. **Paunang Ahente:**

      - Shopper Agent na naka-configure na may mga pangunahing instruksyon
      - Naka-enable ang kakayahan sa file search
      - Naka-configure ang tracing at pagsubaybay

3. **Handa para sa Pag-customize:**

      - Framework para sa pagdaragdag ng Loyalty Agent
      - Mga template ng pasadyang instruksyon
      - Mga script para sa pagsubok at pagpapatunay
      - Setup para sa pagsubaybay at pagsusuri

4. **Kahandaan para sa Produksyon:**

      - Pag-scan ng seguridad gamit ang red teaming
      - Pagsubaybay sa pagganap
      - Framework para sa pagsusuri ng kalidad
      - Skalableng arkitektura

Ipinapakita ng halimbawang ito kung paano maaaring palawakin at i-customize ang AZD template para sa mga tiyak na enterprise na scenario habang pinapanatili ang mga pinakamahusay na kasanayan para sa seguridad, pagsubaybay, at kakayahang mag-scale.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng pagsasaling AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpakan. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinagmumulan ng awtoridad. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin na ginawa ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->