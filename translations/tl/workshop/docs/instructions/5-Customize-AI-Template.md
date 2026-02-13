# 5. I-customize ang isang Template

!!! tip "SA PAGTATAPOS NG MODULONG ITO, MAGAGAWA MO"

    - [ ] Naisaliksik ang default na mga kakayahan ng AI Agent
    - [ ] Nagdagdag ng AI Search gamit ang sariling index
    - [ ] Na-activate at nasuri ang mga sukatan ng Tracing
    - [ ] Isinagawa ang isang evaluation run
    - [ ] Isinagawa ang isang red-teaming scan
    - [ ] **Lab 5: Nilikha ang Plano ng Pagpapasadya** 

---

## 5.1 Mga Kakayahan ng AI Agent

!!! success "Natapos namin ito sa Lab 01"

- **File Search**: Built-in na paghahanap ng file ng OpenAI para sa pagkuha ng kaalaman
- **Citations**: Awtomatikong pagbanggit ng pinagmulan sa mga tugon
- **Customizable Instructions**: Baguhin ang ugali at personalidad ng agent
- **Tool Integration**: Pinapalawak na sistema ng mga tool para sa pasadyang kakayahan

---

## 5.2 Mga Opsyon para sa Pagkuha ng Kaalaman

!!! task "Upang makumpleto ito, kailangan nating gumawa ng mga pagbabago at muling i-deploy"    
    
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

- Nakalakip sa Foundry Agents
- Awtomatikong pagproseso at pag-index ng mga dokumento
- Walang karagdagang konfigurasyon na kinakailangan

**Azure AI Search (Optional):**

- Hybrid na semantic at vector na paghahanap
- Pasadyang pamamahala ng index
- Mga advanced na kakayahan sa paghahanap
- Nangangailangan ng `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Pagsubaybay at Pagmamanman](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Upang makumpleto ito, kailangan nating gumawa ng mga pagbabago at muling i-deploy"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- Integrasyon ng OpenTelemetry
- Pagsubaybay sa kahilingan/tugon
- Mga sukatan ng pagganap
- Magagamit sa Microsoft Foundry portal

**Logging:**

- Mga logs ng aplikasyon sa Container Apps
- Istrakturadong logging na may correlation IDs
- Tingnan ang mga log nang real-time at historikal

---

## 5.4 [Pagsusuri ng Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokal na Pagsusuri:**

- May built-in na evaluators para sa pagtatasa ng kalidad
- Mga pasadyang script ng pagsusuri
- Benchmarking ng pagganap

**Tuloy-tuloy na Pagmamanman:**

- Awtomatikong pagsusuri ng mga live na interaksyon
- Pagsubaybay ng mga sukatan ng kalidad
- Pagtuklas ng regression sa pagganap

**Pagsasama sa CI/CD:**

- Workflow ng GitHub Actions
- Awtomatikong pagsubok at pagsusuri
- Pagsusulit gamit ang estadistikal na paghahambing

---

## 5.5 [Ahente ng AI Red Teaming](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Awtomatikong pag-scan para sa seguridad
- Pagtatasa ng panganib para sa mga sistema ng AI
- Pagsusuri ng kaligtasan sa iba't ibang kategorya

**Pagpapatotoo:**

- Managed Identity para sa mga serbisyo ng Azure
- Opsyonal na pagpapatotoo ng Azure App Service
- Basic auth bilang fallback para sa development



!!! quote "SA PAGTATAPOS NG LAB NA ITO, DAPAT MERON KA NG"
    - [ ] Tukuyin ang iyong mga kinakailangan sa senaryo
    - [ ] Na-customize ang mga env variables (config)
    - [ ] Na-customize ang mga instruksyon ng agent (task)
    - [ ] Na-deploy ang na-customize na template (app)
    - [ ] Natapos ang mga post-deployment na gawain (manual)
    - [ ] Napatakbo ang isang test evaluation

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 I-customize Ito Para sa Iyo!

### 5.6.1. Mga Kinakailangan ng Senaryo

#### **Mga Deployment ng Ahente:** 

   - Shopper Agent: Tinutulungan ang mga customer na maghanap at maghambing ng mga produkto
   - Loyalty Agent: Namamahala ng mga gantimpala at promosyon para sa customer

#### **Mga Deployment ng Modelo:**

   - `gpt-4.1`: Pangunahing chat na modelo
   - `o3`: Modelo para sa pangangatwiran para sa mga kumplikadong query
   - `gpt-4.1-nano`: Magaan na modelo para sa mga simpleng interaksyon
   - `text-embedding-3-large`: Mataas na kalidad na embeddings para sa paghahanap

#### **Mga Tampok:**

   - Pinapagana ang tracing at pagmo-monitor
   - AI Search para sa katalogo ng produkto
   - Framework ng pagsusuri para sa kalidad na katiyakan
   - Red teaming para sa pagpapatunay ng seguridad

---

### 5.6.2 Pagpapatupad ng Senaryo


#### 5.6.2.1. Paunang Konfigurasyon bago ang Deployment

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Itakda ang pangalan ng kapaligiran
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Isaayos ang rehiyon (pumili batay sa pagkakaroon ng modelo)
azd env set AZURE_LOCATION "eastus2"

# Paganahin ang lahat ng opsyonal na serbisyo
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Isaayos ang pangunahing modelo ng chat (gpt-4o bilang pinakamalapit na magagamit sa gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Isaayos ang modelo ng embedding para sa pinahusay na paghahanap
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Itakda ang pangalan ng ahente (lilikhain ang unang ahente)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Isaayos ang indeks ng paghahanap
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Mga Instruksyon ng Ahente

Gumawa ng `custom-agents/shopper-agent-instructions.md`:

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

Gumawa ng `custom-agents/loyalty-agent-instructions.md`:

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

Gumawa ng `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Suriin ang mga paunang kinakailangan
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

# Suriin ang quota sa napiling rehiyon
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

# I-deploy ang imprastruktura at ang aplikasyon
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Kunin ang mga output ng deployment
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

#### 5.6.2.4: Post-Deployment Konfig

Gumawa ng `configure-retail-agents.sh`:

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

### 5.6.3: Pagsusuri at Pagpapatunay

Gumawa ng `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Tiyakin na nakatakda ang mga environment variable
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

Pagkatapos sundin ang gabay na pagpapatupad na ito, magkakaroon ka ng:

1. **Na-deploy na Imprastruktura:**

      - Proyekto ng Microsoft Foundry na may mga deployment ng modelo
      - Container Apps na nagho-host ng web application
      - Serbisyo ng AI Search para sa katalogo ng produkto
      - Application Insights para sa pagmo-monitor

2. **Paunang Ahente:**

      - Shopper Agent na naka-configure na may mga pangunahing instruksyon
      - Nakapagana ang kakayahan sa paghahanap ng file
      - Naka-configure ang tracing at pagmo-monitor

3. **Handa para sa Pagpapasadya:**

      - Framework para sa pagdagdag ng Loyalty Agent
      - Mga template ng pasadyang instruksyon
      - Mga script para sa pagsusuri at pagpapatunay
      - Set-up para sa pagmo-monitor at ebalwasyon

4. **Kahandaan para sa Produksyon:**

      - Pag-scan ng seguridad gamit ang red teaming
      - Pagmo-monitor ng pagganap
      - Framework ng pagsusuri ng kalidad
      - Arkitekturang nasusukat

Ipinapakita ng halimbawa na ito kung paano mapapalawig at maipapasadya ang AZD template para sa mga partikular na enterprise na senaryo habang pinananatili ang pinakamahusay na praktis para sa seguridad, pagmo-monitor, at kakayahang mag-scale.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang serbisyo ng AI na pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong salin ay maaaring maglaman ng mga pagkakamali o di-katumpakan. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong pinagmulan. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng salin na ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->