# 5. Sablon testreszabása

!!! tip "A MODUL VÉGÉRE KÉPES LESZ"

    - [ ] Az alapértelmezett AI Agent képességek felfedezése
    - [ ] AI Keresés hozzáadása a saját indexével
    - [ ] Tracing metrikák aktiválása és elemzése
    - [ ] Értékelési futtatás végrehajtása
    - [ ] Red-teaming szkennelés végrehajtása
    - [ ] **Lab 5: Testreszabási terv elkészítése**

---

## 5.1 AI ügynök képességei

!!! success "Ezt a Lab 01-ben már befejeztük"

- **Fájlkeresés**: OpenAI beépített fájlkereső tudáslekéréshez
- **Hivatkozások**: Automatikus forrásmegjelölés a válaszokban
- **Testreszabható utasítások**: Az ügynök viselkedésének és személyiségének módosítása
- **Eszközintegráció**: Kibővíthető eszközrendszer egyedi képességekhez

---

## 5.2 Tudáslekérési lehetőségek

!!! task "A befejezéshez változtatásokat kell végezni és újradeploy-olni"    
    
    ```bash title=""
    # Környezeti változók beállítása
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Adatok feltöltése és az index létrehozása

    ```

---

**OpenAI Fájlkeresés (Alapértelmezett):**

- Beépítve a Foundry ügynökökbe
- Automatikus dokumentum feldolgozás és indexelés
- További konfiguráció nem szükséges

**Azure AI Keresés (Opcionális):**

- Hibrid szemantikus és vektoralapú keresés
- Egyedi indexkezelés
- Fejlett keresési képességek
- Szükséges: `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing és monitorozás](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "A befejezéshez változtatásokat kell végezni és újradeploy-olni"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry integráció
- Kérések és válaszok követése
- Teljesítménymutatók
- Elérhető a Microsoft Foundry portálon

**Naplózás:**

- Alkalmazásnaplók Container Apps-ben
- Strukturált naplózás összefüggési azonosítókkal
- Valós idejű és történeti naplómegtekintés

---

## 5.4 [Ügynök értékelés](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Helyi értékelés:**

- Beépített értékelők minőségügyi felméréshez
- Egyedi értékelő szkriptek
- Teljesítmény összehasonlítás

**Folyamatos monitorozás:**

- Élő interakciók automatikus értékelése
- Minőségi mutatók követése
- Teljesítmény regresszió észlelése

**CI/CD integráció:**

- GitHub Actions munkafolyamat
- Automatikus tesztelés és értékelés
- Statisztikai összehasonlító tesztek

---

## 5.5 [AI Red Teaming ügynök](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatikus biztonsági szkennelés
- AI rendszerek kockázatértékelése
- Biztonsági értékelés több kategóriában

**Hitelesítés:**

- Kezelt identitás Azure szolgáltatásokhoz
- Opcionális Azure App Service hitelesítés
- Basic auth visszaesés fejlesztéshez

!!! quote "ENNEK A LABORNAK A VÉGÉRE KÉRJÜK, HOGY"
    - [ ] Szenáriókövetelmények meghatározása
    - [ ] Környezeti változók testreszabása (config)
    - [ ] Ügynök utasítások testreszabása (task)
    - [ ] Testreszabott sablon telepítése (app)
    - [ ] Telepítés utáni feladatok elvégzése (manual)
    - [ ] Tesztértékelés futtatása

Ez a példa egy vállalati kiskereskedelmi eset testreszabását mutatja be két specializált ügynökkel és több modell telepítéssel.

---

## 5.6 Testreszabás az Ön számára!

### 5.6.1. Szenáriókövetelmények

#### **Ügynök telepítések:**

   - Vásárlói ügynök: Segít a vásárlóknak termékeket találni és összehasonlítani
   - Hűség ügynök: Kezeli az ügyfél jutalmakat és promóciókat

#### **Modell telepítések:**

   - `gpt-4.1`: Elsődleges chat modell
   - `o3`: Érvelő modell összetett lekérdezésekhez
   - `gpt-4.1-nano`: Könnyű súlyú modell egyszerű interakciókhoz
   - `text-embedding-3-large`: Magas minőségű beágyazások kereséshez

#### **Funkciók:**

   - Tracing és monitorozás engedélyezve
   - AI Keresés a termékkatalógushoz
   - Értékelési keretrendszer minőségbiztosításhoz
   - Red teaming biztonsági érvényesítéshez

---

### 5.6.2 Szenárió megvalósítása

#### 5.6.2.1. Telepítés előtti konfiguráció

Készítsen egy beállító szkriptet (`setup-retail.sh`):

```bash title="" linenums="0"
#!/bin/bash

# Állítsa be a környezet nevét
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Régió beállítása (a modell elérhetősége alapján válasszon)
azd env set AZURE_LOCATION "eastus2"

# Minden opcionális szolgáltatás engedélyezése
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Elsődleges csevegőmodell beállítása (gpt-4.1, a gpt-4.1-hez legközelebb álló elérhető modell)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Beágyazó modell konfigurálása a fejlettebb kereséshez
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Ügynök név megadása (az első ügynök létrehozásához)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Keresési index konfigurálása
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Ügynök utasítások

Hozza létre a `custom-agents/shopper-agent-instructions.md` fájlt:

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

Hozza létre a `custom-agents/loyalty-agent-instructions.md` fájlt:

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

Hozza létre a `deploy-retail.sh` fájlt:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Az előfeltételek ellenőrzése
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Környezet beállítása
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Kvóta ellenőrzése a kiválasztott régióban
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

# Infrastruktúra és alkalmazás telepítése
echo "🏗️  Deploying Azure infrastructure..."
azd up

# A telepítés eredményeinek rögzítése
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# A webalkalmazás URL-címének lekérése
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

#### 5.6.2.4: Telepítés utáni konfiguráció

Hozza létre a `configure-retail-agents.sh` fájlt:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Telepítési információk lekérése
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Útmutató a kézi konfigurációhoz
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

### 5.6.3: Tesztelés és validáció

Hozza létre a `test-retail-deployment.sh` fájlt:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Ellenőrizze, hogy a környezeti változók be vannak-e állítva
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# A webalkalmazás elérhetőségének tesztelése
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

# Értékelés futtatása, ha konfigurálva van
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

### 5.6.4 Várt eredmények

A megvalósítási útmutató követése után a következőkkel rendelkezik:

1. **Telepített infrastruktúra:**

      - Microsoft Foundry projekt a modell telepítésekkel
      - Container Apps a webalkalmazás hosztolására
      - AI Keresés szolgáltatás a termékkatalógushoz
      - Application Insights a monitorozáshoz

2. **Kezdeti ügynök:**

      - Vásárlói ügynök alapvető utasításokkal konfigurálva
      - Fájlkeresési képesség engedélyezve
      - Tracing és monitorozás beállítva

3. **Testreszabásra kész:**

      - Keretrendszer a Hűség ügynök hozzáadásához
      - Egyedi utasítás sablonok
      - Tesztelési és validációs szkriptek
      - Monitorozás és értékelés konfiguráció

4. **Éles használatra kész:**

      - Biztonsági szkennelés red teaming-gel
      - Teljesítmény monitorozás
      - Minőségértékelési keretrendszer
      - Méretezhető architektúra

Ez a példa bemutatja, hogyan bővíthető és testreszabható az AZD sablon specifikus vállalati esetekhez, miközben megőrzi a biztonság, monitorozás és méretezhetőség legjobb gyakorlatait.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ez a dokumentum az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) használatával készült. Bár igyekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvű változata tekintendő hiteles forrásnak. Kritikus információk esetén szakmai emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->