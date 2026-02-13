# 5. Tinkinkite šabloną

!!! tip "ŠIO MODULIO PABAIGOJE GALĖSITE"

    - [ ] Išnagrinėjote numatytąsias AI agento galimybes
    - [ ] Pridėjote AI paiešką su savo indeksu
    - [ ] Įjungėte ir analizavote sekimo metrikas
    - [ ] Paleidote vertinimą
    - [ ] Atlikote red-teaming skenavimą
    - [ ] **Laboratorija 5: Sukurtas pritaikymo planas** 

---

## 5.1 AI agento galimybės

!!! success "Mes tai užbaigėme 01 laboratorijoje"

- **Failų paieška**: OpenAI įmontuota failų paieška žinių gavimui
- **Cituotės**: Automatinis šaltinių nurodymas atsakymuose
- **Konfigūruojamos instrukcijos**: Modifikuokite agento elgesį ir asmenybę
- **Įrankių integracija**: Išplečiama įrankių sistema pritaikytoms galimybėms

---

## 5.2 Žinių gavimo parinktys

!!! task "Norint tai atlikti, turime padaryti pakeitimus ir iš naujo diegti"    
    
    ```bash title=""
    # Nustatyti aplinkos kintamuosius
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Įkelti duomenis ir sukurti mano indeksą

    ```

---

**OpenAI failų paieška (numatytoji):**

- Įdiegta Foundry agentuose
- Automatinis dokumentų apdorojimas ir indeksavimas
- Nereikia papildomos konfigūracijos

**Azure AI Search (pasirinktinai):**

- Hibridinė semantinė ir vektorinė paieška
- Individualus indeksų valdymas
- Pažangios paieškos galimybės
- Reikalauja `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Sekimas ir stebėsena](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Norint tai atlikti, turime padaryti pakeitimus ir iš naujo diegti"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Sekimas:**

- OpenTelemetry integracija
- Užklausų/atsakymų sekimas
- Veikimo metrikos
- Prieinama Microsoft Foundry portale

**Žurnalavimas:**

- Programos žurnalai Container Apps aplinkoje
- Struktūruotas žurnalavimas su koreliacijos ID
- Realaus laiko ir istorinių žurnalų peržiūra

---

## 5.4 [Agentų vertinimas](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Vietinis vertinimas:**

- Įmontuoti vertintojai kokybės įvertinimui
- Individualūs vertinimo skriptai
- Veikimo našumo etalonavimas

**Nuolatinė stebėsena:**

- Automatinis gyvų sąveikų vertinimas
- Kokybės metrų sekimas
- Veikimo regresijos aptikimas

**CI/CD integracija:**

- GitHub Actions darbo eiga
- Automatizuotas testavimas ir vertinimas
- Statistinio palyginimo testavimas

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatizuotas saugumo skanavimas
- Rizikos vertinimas AI sistemoms
- Saugumo vertinimas keliomis kategorijomis

**Autentifikacija:**

- Valdomoji tapatybė Azure paslaugoms
- Neprivaloma Azure App Service autentifikacija
- Paprastas autentifikacijos (basic auth) atsarginis variantas plėtojant



!!! quote "ŠIOS LABORATORIJOS PABAIGOJE TURĖTUMĖTE"
    - [ ] Apibrėžėte savo scenarijaus reikalavimus
    - [ ] Pritaikėte aplinkos kintamuosius (konfigūracija)
    - [ ] Pritaikėte agento instrukcijas (užduotis)
    - [ ] Išdiegėte pritaikytą šabloną (programa)
    - [ ] Atlikote po diegimo užduotis (rankiniu būdu)
    - [ ] Paleidote testinį vertinimą

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Pritaikykite tai savo poreikiams!

### 5.6.1. Scenarijaus reikalavimai

#### **Agent Deployments:** 

   - Shopper Agent: Padeda klientams rasti ir palyginti produktus
   - Loyalty Agent: Tvarko klientų atlygius ir akcijas

#### **Model Deployments:**

   - `gpt-4.1`: Pagrindinis pokalbių modelis
   - `o3`: Samprotavimo modelis sudėtingoms užklausoms
   - `gpt-4.1-nano`: Lengvas modelis paprastoms sąveikoms
   - `text-embedding-3-large`: Aukštos kokybės įterpimai paieškai

#### **Features:**

   - Sekimas ir stebėsena įjungti
   - AI Search produktų katalogui
   - Vertinimo sistema kokybės užtikrinimui
   - Red teaming saugumo patikrai

---

### 5.6.2 Scenarijaus įgyvendinimas


#### 5.6.2.1. Priešdiegiama konfigūracija

Sukurkite parengimo skriptą (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Nustatyti aplinkos pavadinimą
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Konfigūruokite regioną (rinkitės pagal modelio prieinamumą)
azd env set AZURE_LOCATION "eastus2"

# Įjungti visas neprivalomas paslaugas
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfigūruoti pagrindinį pokalbių modelį (gpt-4o yra artimiausias prieinamas gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfigūruoti įterpimų modelį geresnei paieškai
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Nustatyti agento pavadinimą (sukurs pirmąjį agentą)
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

# Patikrinti išankstines sąlygas
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

# Patikrinti kvotą pasirinktame regione
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

# Diegti infrastruktūrą ir programą
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Užfiksuoti diegimo išvestis
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Gauti žiniatinklio programos URL
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

#### 5.6.2.4: Po diegimo konfigūracija

Sukurkite `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Gauti informacijos apie diegimą
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Nurodymai rankiniam konfigūravimui
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

### 5.6.3: Testavimas ir patikra

Sukurkite `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Patikrinti, ar aplinkos kintamieji nustatyti
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Patikrinti žiniatinklio programos prieinamumą
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

# Paleisti įvertinimą, jei sukonfigūruota
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

Įgyvendinę šį vadovą, turėsite:

1. **Išdiegta infrastruktūra:**

      - Microsoft Foundry projektas su modelių diegimais
      - Container Apps, talpinančios žiniatinklio programą
      - AI Search paslauga produktų katalogui
      - Application Insights stebėjimui

2. **Pradinis agentas:**

      - Shopper Agent sukonfigūruotas su pagrindinėmis instrukcijomis
      - Įjungta failų paieškos galimybė
      - Konfigūruotas sekimas ir stebėsena

3. **Paruošta pritaikymui:**

      - Pagrindas Loyalty Agent pridėjimui
      - Pritaikomų instrukcijų šablonai
      - Testavimo ir patikros skriptai
      - Stebėjimo ir vertinimo nustatymai

4. **Paruošta gamybai:**

      - Saugumo skenavimas su red teaming
      - Veikimo stebėjimas
      - Kokybės vertinimo sistema
      - Skalės palaikanti architektūra

Šis pavyzdys parodo, kaip AZD šablonas gali būti išplėstas ir pritaikytas konkretiems įmonės scenarijams, laikantis geriausių saugumo, stebėjimo ir skalavimo praktikų.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas gimtąja kalba turėtų būti laikomas pagrindiniu šaltiniu. Esant kritinei informacijai, rekomenduojame kreiptis į profesionalų vertėją. Mes neatsakome už bet kokius nesusipratimus ar neteisingus aiškinimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->