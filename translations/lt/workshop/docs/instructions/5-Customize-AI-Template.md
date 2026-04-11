# 5. Tinkinkite šabloną

!!! tip "ŠIO MODULIO PABAIGOJE GALĖSITE"

    - [ ] Išnagrinėjote numatytąsias AI agentų galimybes
    - [ ] Pridėjote AI paiešką su savo indeksu
    - [ ] Aktyvavote ir analizavote Tracing metrikas
    - [ ] Atlikote vertinimo vykdymą
    - [ ] Atlikote red-teaming nuskaitymą
    - [ ] **Laboratorija 5: Parengėte pritaikymo planą** 

---

## 5.1 AI agentų galimybės

!!! success "Tai atlikome laboratorijoje 01"

- **Failų paieška**: OpenAI įmontuota failų paieška žinių gavimui
- **Citavimas**: Automatinis šaltinių nurodymas atsakymuose
- **Pritaikomos instrukcijos**: Keiskite agente elgesį ir asmenybę
- **Įrankių integracija**: Išplečiama įrankių sistema pritaikytoms funkcijoms

---

## 5.2 Žinių gavimo parinktys

!!! task "Norint užbaigti, turime atlikti pakeitimus ir iš naujo diegti"    
    
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

**OpenAI failų paieška (numatytoji):**

- Įmontuota Foundry agentuose
- Automatinis dokumentų apdorojimas ir indeksavimas
- Nereikia papildomos konfigūracijos

**Azure AI Search (pasirenkama):**

- Hibridinė semantinė ir vektorinė paieška
- Individualus indekso valdymas
- Išplėstinės paieškos galimybės
- Reikalauja `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Sekimas ir stebėsena](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Norint užbaigti, turime atlikti pakeitimus ir iš naujo diegti"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Sekimas:**

- OpenTelemetry integracija
- Užklausų/atsakymų sekimas
- Našumo metrikos
- Prieinama Microsoft Foundry portale

**Žurnalavimas:**

- Programos žurnalai Container Apps
- Struktūruotas žurnalas su koreliacijos ID
- Realaus laiko ir istorinė žurnalų peržiūra

---

## 5.4 [Agentų vertinimas](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Vietinis vertinimas:**

- Įmontuoti vertintojai kokybės įvertinimui
- Tinkinti vertinimo skriptai
- Našumo etalonavimas

**Nuolatinė stebėsena:**

- Automatinis tiesioginių sąveikų vertinimas
- Kokybės metrikų sekimas
- Našumo regresijos aptikimas

**CI/CD integracija:**

- GitHub Actions darbo eiga
- Automatizuotas testavimas ir vertinimas
- Statistiniai palyginamieji testai

---

## 5.5 [AI Red Teaming agentas](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatizuotas saugumo skenavimas
- Rizikos vertinimas AI sistemoms
- Saugumo vertinimas keliomis kategorijomis

**Autentifikacija:**

- Valdoma tapatybė (Managed Identity) Azure paslaugoms
- Pasirenkama Azure App Service autentifikacija
- Basic auth kaip atsarginė galimybė vystymui



!!! quote "LABORATORIJOS PABAIGOJE TURĖTUMĖTE"
    - [ ] Nustatėte savo scenarijaus reikalavimus
    - [ ] Pritaikėte aplinkos kintamuosius (konfigūracija)
    - [ ] Pritaikėte agentų instrukcijas (užduotis)
    - [ ] Išdiegėte pritaikytą šabloną (programa)
    - [ ] Atlikote poįdiegimo užduotis (rankiniu būdu)
    - [ ] Paleidote testinį vertinimą

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Pritaikykite tai sau!

### 5.6.1. Scenarijaus reikalavimai

#### **Agentų diegimai:** 

   - Pirkėjo agentas: Padeda klientams rasti ir palyginti produktus
   - Lojalumo agentas: Valdo klientų atlygius ir akcijas

#### **Modelių diegimai:**

   - `gpt-4.1`: Pagrindinis pokalbių modelis
   - `o3`: Samprotavimo modelis sudėtingoms užklausoms
   - `gpt-4.1-nano`: Lengvas modelis paprastoms sąveikoms
   - `text-embedding-3-large`: Aukštos kokybės embedding'ai paieškai

#### **Funkcijos:**

   - Sekimas (Tracing) ir stebėsena įjungti
   - AI paieška produktų katalogui
   - Vertinimo sistema kokybės užtikrinimui
   - Red teaming saugumo patikrai

---

### 5.6.2 Scenarijaus įgyvendinimas


#### 5.6.2.1. Priešdiegiminė konfigūracija

Sukurkite nustatymo skriptą (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Nustatyti aplinkos pavadinimą
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Konfigūruoti regioną (pasirinkite pagal modelio prieinamumą)
azd env set AZURE_LOCATION "eastus2"

# Įjungti visas pasirenkamas paslaugas
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfigūruoti pagrindinį pokalbio modelį (gpt-4.1 kaip artimiausias prieinamas gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfigūruoti įterpimo modelį geresnei paieškai
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Nustatyti agento vardą (sukurs pirmą agentą)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Konfigūruoti paieškos indeksą
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agentų instrukcijos

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

#### 5.6.2.3: Diegimo skriptas

Sukurkite `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Patikrinti išankstinius reikalavimus
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Paruošti aplinką
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Patikrinti kvotą pasirinktoje regione
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

# Diegti infrastruktūrą ir programą
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Užfiksuoti diegimo išvestis
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Gauti žiniatinklio programos URL
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

#### 5.6.2.4: Po diegimo konfigūracija

Sukurkite `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Gauti diegimo informaciją
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instrukcijos rankiniam konfigūravimui
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

### 5.6.3: Testavimas ir patvirtinimas

Sukurkite `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Patikrinkite, ar aplinkos kintamieji yra nustatyti
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Patikrinkite žiniatinklio programos prieinamumą
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

# Vykdykite vertinimą, jei sukonfigūruota
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

### 5.6.4 Tikėtini rezultatai

Laikydamiesi šio diegimo vadovo, jūs turėsite:

1. **Išdiegta infrastruktūra:**

      - Microsoft Foundry projektas su modelių diegimais
      - Container Apps, talpinantis žiniatinklio programą
      - AI Search paslauga produktų katalogui
      - Application Insights stebėsenai

2. **Pradinis agentas:**

      - Pirkėjo agentas sukonfigūruotas su pagrindinėmis instrukcijomis
      - Įjungta failų paieškos galimybė
      - Sekimas (Tracing) ir stebėsena sukonfigūruoti

3. **Pasiruošta pritaikymui:**

      - Sistema Lojalumo agento pridėjimui
      - Pritaikytų instrukcijų šablonai
      - Testavimo ir patikros skriptai
      - Stebėsenos ir vertinimo nustatymai

4. **Parengta gamybai:**

      - Saugumo skenavimas su red teaming
      - Veikimo stebėsena
      - Kokybės vertinimo sistema
      - Išplečiama architektūra

Šis pavyzdys parodo, kaip AZD šabloną galima išplėsti ir pritaikyti konkretiems įmonių scenarijams, tuo pačiu išlaikant geriausias saugumo, stebėsenos ir skalavimo praktikas.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalų dokumentą jo gimtąja kalba reikėtų laikyti autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->