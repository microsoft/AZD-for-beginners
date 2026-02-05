# 5. Sablon testreszabása

!!! tip "A MODUL VÉGÉRE KÉPES LESZ"

    - [ ] Felfedezni az alapértelmezett AI ügynök képességeit
    - [ ] Saját indexszel AI keresést hozzáadni
    - [ ] Aktiválni és elemezni a nyomkövetési metrikákat
    - [ ] Végrehajtani egy értékelési futtatást
    - [ ] Végrehajtani egy red-teaming vizsgálatot
    - [ ] **5. labor: Testreszabási terv készítése**

---

## 5.1 AI ügynök képességei

!!! success "Ezt az 1. laborban teljesítettük"

- **Fájlkeresés**: Az OpenAI beépített fájlkeresése tudásvisszakereséshez
- **Hivatkozások**: Automatikus forrásmegjelölés a válaszokban
- **Testreszabható utasítások**: Az ügynök viselkedésének és személyiségének módosítása
- **Eszközintegráció**: Bővíthető eszközrendszer egyedi képességekhez

---

## 5.2 Tudásvisszakeresési lehetőségek

!!! task "Ehhez módosításokat kell végeznünk és újra kell telepítenünk"    
    
    ```bash title=""
    # Környezeti változók beállítása
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Adatok feltöltése és saját index létrehozása

    ```

---

**OpenAI fájlkeresés (alapértelmezett):**

- Beépítve az Azure AI ügynök szolgáltatásba
- Automatikus dokumentumfeldolgozás és indexelés
- Nincs szükség további konfigurációra

**Azure AI keresés (opcionális):**

- Hibrid szemantikai és vektorkeresés
- Egyedi indexkezelés
- Fejlett keresési képességek
- Szükséges: `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Nyomkövetés és monitorozás](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Ehhez módosításokat kell végeznünk és újra kell telepítenünk"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Nyomkövetés:**

- OpenTelemetry integráció
- Kérés/válasz nyomon követése
- Teljesítménymérő adatok
- Elérhető az AI Foundry portálon

**Naplózás:**

- Alkalmazásnaplók a Container Apps-ben
- Strukturált naplózás korrelációs azonosítókkal
- Valós idejű és történeti naplómegtekintés

---

## 5.4 [Ügynök értékelése](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Helyi értékelés:**

- Beépített értékelők a minőség felméréséhez
- Egyedi értékelési szkriptek
- Teljesítmény benchmarking

**Folyamatos monitorozás:**

- Élő interakciók automatikus értékelése
- Minőségi metrikák nyomon követése
- Teljesítményregresszió észlelése

**CI/CD integráció:**

- GitHub Actions munkafolyamat
- Automatikus tesztelés és értékelés
- Statisztikai összehasonlító tesztelés

---

## 5.5 [AI Red Teaming ügynök](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatikus biztonsági vizsgálat
- Kockázatértékelés AI rendszerekhez
- Biztonsági értékelés több kategóriában

**Hitelesítés:**

- Kezelt identitás az Azure szolgáltatásokhoz
- Opcionális Azure App Service hitelesítés
- Alapvető hitelesítés fejlesztéshez

!!! quote "A LABOR VÉGÉRE EL KELL ÉRNIE"
    - [ ] Meghatározni a forgatókönyv követelményeit
    - [ ] Testreszabni a környezeti változókat (konfiguráció)
    - [ ] Testreszabni az ügynök utasításait (feladat)
    - [ ] Telepíteni a testreszabott sablont (alkalmazás)
    - [ ] Teljesíteni az utótelepítési feladatokat (kézi)
    - [ ] Tesztértékelést futtatni

Ez a példa bemutatja, hogyan lehet testreszabni a sablont egy vállalati kiskereskedelmi felhasználási esethez, két specializált ügynökkel és több modell telepítéssel.

---

## 5.6 Testreszabás Önnek!

### 5.6.1. Forgatókönyv követelmények

#### **Ügynök telepítések:** 

   - Vásárlói ügynök: Segít az ügyfeleknek termékeket keresni és összehasonlítani
   - Hűség ügynök: Kezeli az ügyféljutalmakat és promóciókat

#### **Modell telepítések:**

   - `gpt-4.1`: Elsődleges chat modell
   - `o3`: Érvelési modell összetett kérdésekhez
   - `gpt-4.1-nano`: Könnyű modell egyszerű interakciókhoz
   - `text-embedding-3-large`: Kiváló minőségű beágyazások kereséshez

#### **Funkciók:**

   - Nyomkövetés és monitorozás engedélyezve
   - AI keresés a termékkatalógushoz
   - Értékelési keretrendszer a minőségbiztosításhoz
   - Red teaming a biztonsági validációhoz

---

### 5.6.2 Forgatókönyv megvalósítása


#### 5.6.2.1. Előtelepítési konfiguráció

Hozzon létre egy beállítási szkriptet (`setup-retail.sh`)

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

#### 5.6.2.2: Ügynök utasítások

Hozzon létre `custom-agents/shopper-agent-instructions.md`:

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

Hozzon létre `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Telepítési szkript

Hozzon létre `deploy-retail.sh`:

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

#### 5.6.2.4: Utótelepítési konfiguráció

Hozzon létre `configure-retail-agents.sh`:

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

### 5.6.3: Tesztelés és validáció

Hozzon létre `test-retail-deployment.sh`:

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

### 5.6.4 Várható eredmények

Az útmutató követése után a következőket érheti el:

1. **Telepített infrastruktúra:**

      - AI Foundry projekt modell telepítésekkel
      - Container Apps a webalkalmazás hosztolásához
      - AI keresési szolgáltatás a termékkatalógushoz
      - Application Insights a monitorozáshoz

2. **Kezdeti ügynök:**

      - Vásárlói ügynök alapvető utasításokkal konfigurálva
      - Fájlkeresési képesség engedélyezve
      - Nyomkövetés és monitorozás konfigurálva

3. **Testreszabásra kész:**

      - Keretrendszer a Hűség ügynök hozzáadásához
      - Egyedi utasítássablonok
      - Tesztelési és validációs szkriptek
      - Monitorozási és értékelési beállítások

4. **Gyártási készenlét:**

      - Biztonsági vizsgálat red teaming segítségével
      - Teljesítmény monitorozás
      - Minőségértékelési keretrendszer
      - Skálázható architektúra

Ez a példa bemutatja, hogyan lehet az AZD sablont kiterjeszteni és testreszabni specifikus vállalati forgatókönyvekhez, miközben betartja a biztonság, monitorozás és skálázhatóság legjobb gyakorlatait.

---

