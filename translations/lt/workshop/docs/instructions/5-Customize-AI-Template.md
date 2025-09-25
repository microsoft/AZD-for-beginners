<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "60caadc3b57dccb9e6c413b5ccace90b",
  "translation_date": "2025-09-25T02:24:19+00:00",
  "source_file": "workshop/docs/instructions/5-Customize-AI-Template.md",
  "language_code": "lt"
}
-->
# 5. Pritaikyti šabloną

!!! tip "BAIGĘ ŠĮ MODULĮ GALĖSITE"

    - [ ] Išnagrinėti numatytas AI agento galimybes
    - [ ] Pridėti AI paiešką su savo indeksu
    - [ ] Aktyvuoti ir analizuoti sekimo metrikas
    - [ ] Atlikti vertinimo testą
    - [ ] Atlikti saugumo patikrinimą (red-teaming)
    - [ ] **Laboratorija 5: Sukurti pritaikymo planą**

---

## 5.1 AI agento galimybės

!!! success "Tai atlikome Laboratorijoje 01"

- **Failų paieška**: OpenAI integruota failų paieška žinių gavimui
- **Citatos**: Automatinis šaltinių nurodymas atsakymuose
- **Pritaikomos instrukcijos**: Galimybė keisti agento elgesį ir asmenybę
- **Įrankių integracija**: Išplečiama įrankių sistema papildomoms funkcijoms

---

## 5.2 Žinių gavimo parinktys

!!! task "Norėdami tai atlikti, turime atlikti pakeitimus ir iš naujo diegti"

    ```bash title=""
    # Nustatyti aplinkos kintamuosius
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Įkelti duomenis ir sukurti savo indeksą

    ```

---

**OpenAI failų paieška (numatytoji):**

- Integruota į Azure AI Agent paslaugą
- Automatinis dokumentų apdorojimas ir indeksavimas
- Papildomos konfigūracijos nereikia

**Azure AI paieška (pasirinktinė):**

- Hibridinė semantinė ir vektorinė paieška
- Individualus indeksų valdymas
- Išplėstinės paieškos galimybės
- Reikalingas `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Sekimas ir stebėjimas](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Norėdami tai atlikti, turime atlikti pakeitimus ir iš naujo diegti"

    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Sekimas:**

- OpenTelemetry integracija
- Užklausų/atsakymų sekimas
- Našumo metrikos
- Prieinama AI Foundry portale

**Žurnalai:**

- Programos žurnalai Container Apps
- Struktūrizuoti žurnalai su koreliacijos ID
- Realiojo laiko ir istorinių žurnalų peržiūra

---

## 5.4 [Agento vertinimas](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Vietinis vertinimas:**

- Integruoti vertinimo įrankiai kokybės analizei
- Individualūs vertinimo scenarijai
- Našumo palyginimas

**Nuolatinis stebėjimas:**

- Automatinis gyvų sąveikų vertinimas
- Kokybės metrikų stebėjimas
- Našumo regresijos aptikimas

**CI/CD integracija:**

- GitHub Actions darbo eiga
- Automatinis testavimas ir vertinimas
- Statistinis palyginimo testavimas

---

## 5.5 [AI saugumo patikrinimo agentas](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI saugumo patikrinimas:**

- Automatinis saugumo skenavimas
- Rizikos vertinimas AI sistemoms
- Saugumo vertinimas įvairiose kategorijose

**Autentifikacija:**

- Valdomas identitetas Azure paslaugoms
- Pasirinktinė Azure App Service autentifikacija
- Paprasta autentifikacija vystymo aplinkoje

!!! quote "BAIGĘ ŠIĄ LABORATORIJĄ TURĖTUMĖTE"

    - [ ] Apibrėžti savo scenarijaus reikalavimus
    - [ ] Pritaikyti aplinkos kintamuosius (konfigūracija)
    - [ ] Pritaikyti agento instrukcijas (užduotis)
    - [ ] Įdiegti pritaikytą šabloną (programa)
    - [ ] Atlikti po diegimo užduotis (rankiniu būdu)
    - [ ] Atlikti testavimo vertinimą

Šis pavyzdys demonstruoja, kaip pritaikyti šabloną įmonės mažmeninės prekybos scenarijui su dviem specializuotais agentais ir keliais modelių diegimais.

---

## 5.6 Pritaikykite sau!

### 5.6.1. Scenarijaus reikalavimai

#### **Agento diegimai:** 

   - Pirkėjo agentas: Padeda klientams rasti ir palyginti produktus
   - Lojalumo agentas: Valdo klientų apdovanojimus ir akcijas

#### **Modelių diegimai:**

   - `gpt-4.1`: Pagrindinis pokalbių modelis
   - `o3`: Modelis sudėtingiems užklausoms
   - `gpt-4.1-nano`: Lengvas modelis paprastoms sąveikoms
   - `text-embedding-3-large`: Aukštos kokybės įterpimai paieškai

#### **Funkcijos:**

   - Įjungtas sekimas ir stebėjimas
   - AI paieška produktų katalogui
   - Vertinimo sistema kokybės užtikrinimui
   - Saugumo patikrinimas (red-teaming)

---

### 5.6.2 Scenarijaus įgyvendinimas

#### 5.6.2.1. Prieš diegimą konfigūracija

Sukurkite nustatymo scenarijų (`setup-retail.sh`)

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

#### 5.6.2.2: Agento instrukcijos

Sukurkite `custom-agents/shopper-agent-instructions.md`:

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

Sukurkite `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Diegimo scenarijus

Sukurkite `deploy-retail.sh`:

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

#### 5.6.2.4: Po diegimo konfigūracija

Sukurkite `configure-retail-agents.sh`:

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

### 5.6.3: Testavimas ir validacija

Sukurkite `test-retail-deployment.sh`:

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

### 5.6.4 Tikėtini rezultatai

Po šio įgyvendinimo vadovo turėsite:

1. **Įdiegtą infrastruktūrą:**

      - AI Foundry projektą su modelių diegimais
      - Container Apps, talpinančias interneto programą
      - AI paieškos paslaugą produktų katalogui
      - Application Insights stebėjimui

2. **Pradinį agentą:**

      - Pirkėjo agentą su pagrindinėmis instrukcijomis
      - Įjungtą failų paieškos funkciją
      - Konfigūruotą sekimą ir stebėjimą

3. **Pasiruošimą pritaikymui:**

      - Lojalumo agento pridėjimo sistemą
      - Individualių instrukcijų šablonus
      - Testavimo ir validacijos scenarijus
      - Stebėjimo ir vertinimo nustatymus

4. **Parengimą gamybai:**

      - Saugumo skenavimą su red-teaming
      - Našumo stebėjimą
      - Kokybės vertinimo sistemą
      - Skalabilią architektūrą

Šis pavyzdys demonstruoja, kaip AZD šabloną galima išplėsti ir pritaikyti specifiniams įmonės scenarijams, laikantis geriausių saugumo, stebėjimo ir skalabilumo praktikų.

---

