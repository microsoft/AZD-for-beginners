# 5. Testreszabás egy sablonhoz

!!! tip "A MODUL VÉGÉRE KÉPES LESZ"

    - [ ] Felfedezte az alapértelmezett AI ügynök képességeket
    - [ ] Hozzáadta az AI keresést a saját indexszel
    - [ ] Aktiválta és elemezte a Tracing metrikákat
    - [ ] Lefuttatott egy értékelési futást
    - [ ] Lefuttatott egy red-teaming vizsgálatot
    - [ ] **5. Labor: Elkészítette a Testreszabási Tervet**

---

## 5.1 AI Ügynök Képességek

!!! success "Ezt befejeztük az 01-es laborban"

- **Fájlkeresés**: OpenAI beépített fájlkeresése tudáslekéréshez
- **Hivatkozások**: Automatikus forrásmegjelölés a válaszokban
- **Testreszabható utasítások**: Módosítható az ügynök viselkedése és személyisége
- **Eszközintegráció**: Bővíthető eszközrendszer egyedi képességekhez

---

## 5.2 Tudáslekérési lehetőségek

!!! task "A befejezéshez módosításokra és újratelepítésre van szükség"    
    
    ```bash title=""
    # Környezeti változók beállítása
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Adatok feltöltése és index létrehozása

    ```

---

**OpenAI Fájlkeresés (Alapértelmezett):**

- Beépített a Foundry ügynökökben
- Automatikus dokumentumfeldolgozás és indexelés
- További konfiguráció nem szükséges

**Azure AI Search (opcionális):**

- Hibrid szemantikus és vektoros keresés
- Egyedi indexkezelés
- Fejlett keresési képességek
- Szükséges a `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing és Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "A befejezéshez módosításokra és újratelepítésre van szükség"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry integráció
- Lekérések/válaszok nyomon követése
- Teljesítménymutatók
- Elérhető a Microsoft Foundry portálban

**Naplózás:**

- Alkalmazásnaplók Container Apps-ben
- Strukturált naplózás összefüggésazonosítókkal
- Valós idejű és történelmi naplómegjelenítés

---

## 5.4 [Ügynök Értékelés](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Helyi értékelés:**

- Beépített értékelők minőségértékeléshez
- Egyedi értékelő szkriptek
- Teljesítmény-összehasonlítás

**Folyamatos monitoring:**

- Élő interakciók automatikus értékelése
- Minőségi mérőszámok követése
- Teljesítmény regresszió észlelése

**CI/CD integráció:**

- GitHub Actions folyamat
- Automatizált tesztelés és értékelés
- Statisztikai összehasonlító tesztek

---

## 5.5 [AI Red Teaming Ügynök](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatikus biztonsági vizsgálat
- Kockázatértékelés AI rendszerekhez
- Biztonsági értékelés több kategóriában

**Hitelesítés:**

- Kezelt identitás Azure szolgáltatásokhoz
- Opcionális Azure App Service hitelesítés
- Alapvető hitelesítés fejlesztéshez tartalék lehetőségként



!!! quote "ENNEK A LABORNÁL A VÉGREHAJTÁS UTÁN RENDELKEZNED KELL"
    - [ ] Meghatározta a forgatókönyv követelményeit
    - [ ] Testreszabta a környezeti változókat (konfig)
    - [ ] Testreszabta az ügynök utasításokat (feladat)
    - [ ] Telepítette a testreszabott sablont (alkalmazás)
    - [ ] Elvégezte az utólagos telepítési feladatokat (kézi)
    - [ ] Lefuttatott egy tesztértékelést

Ez a példa bemutatja a sablon testreszabását egy vállalati kiskereskedelmi felhasználási esethez két specializált ügynökkel és több modelltelepítéssel.

---

## 5.6 Testreszabás Önnek!

### 5.6.1. Forgatókönyv követelmények

#### **Ügynök telepítések:** 

   - Vásárlói ügynök: Segíti az ügyfeleket a termékek megtalálásában és összehasonlításában
   - Hűség ügynök: Kezeli az ügyféljutalmakat és promóciókat

#### **Modell telepítések:**

   - `gpt-4.1`: Elsődleges csevegő modell
   - `o3`: Összetett lekérdezésekhez gondolkodási modell
   - `gpt-4.1-nano`: Könnyűsúlyú modell egyszerű interakciókhoz
   - `text-embedding-3-large`: Kiváló minőségű beágyazások kereséshez

#### **Funkciók:**

   - Tracing és monitorozás engedélyezve
   - AI Keresés a termékkatalógushoz
   - Értékelési keretrendszer minőségbiztosításhoz
   - Red teaming a biztonság validálásához

---

### 5.6.2 Forgatókönyv megvalósítás


#### 5.6.2.1. Telepítés előtti konfiguráció

Készítsen egy telepítőszkriptet (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Környezet név beállítása
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Régió beállítása (a modell elérhetősége alapján válasszon)
azd env set AZURE_LOCATION "eastus2"

# Minden opcionális szolgáltatás engedélyezése
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Elsődleges chat modell konfigurálása (gpt-4o, mint a gpt-4.1-hez legközelebb álló elérhető)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Beágyazási modell konfigurálása a fejlettebb kereséshez
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Ügynök neve beállítása (első ügynök létrehozásra kerül)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Keresési index konfigurálása
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Ügynök utasítások

Készítse el a `custom-agents/shopper-agent-instructions.md` fájlt:

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

Készítse el a `custom-agents/loyalty-agent-instructions.md` fájlt:

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

Készítse el a `deploy-retail.sh` fájlt:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Előfeltételek ellenőrzése
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
echo "   - gpt-4o: 150,000 TPM"
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

# Telepítési eredmények rögzítése
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Webalkalmazás URL-jének lekérése
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

#### 5.6.2.4: Utólagos konfiguráció

Készítse el a `configure-retail-agents.sh` fájlt:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Telepítési információk lekérése
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Utasítások a kézi beállításhoz
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

Készítse el a `test-retail-deployment.sh` fájlt:

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

# Futtassa az értékelést, ha konfigurálva van
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

A megvalósítási útmutató követése után a következőkkel fog rendelkezni:

1. **Telepített infrastruktúra:**

      - Microsoft Foundry projekt modelltelepítésekkel
      - Container Apps, mely hosztolja a webalkalmazást
      - AI Keresési szolgáltatás a termékkatalógushoz
      - Application Insights a monitorozáshoz

2. **Kezdeti ügynök:**

      - Vásárlói ügynök alapvető utasításokkal konfigurálva
      - Fájlkeresési képesség engedélyezve
      - Tracing és monitorozás beállítva

3. **Készen a testreszabásra:**

      - Keretrendszer a Hűség ügynök hozzáadásához
      - Egyedi utasítás sablonok
      - Tesztelési és validációs szkriptek
      - Monitorozási és értékelési beállítás

4. **Termelési érettség:**

      - Biztonsági vizsgálat red teaminggel
      - Teljesítmény monitorozás
      - Minőségértékelési keretrendszer
      - Skálázható architektúra

Ez a példa bemutatja, hogyan bővíthető és szabható testre az AZD sablon specifikus vállalati forgatókönyvekhez, miközben megőrzik a legjobb gyakorlatokat a biztonság, monitorozás és skálázhatóság terén.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi Nyilatkozat**:
Ezt a dokumentumot az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) használatával fordítottuk. Bár törekszünk a pontos fordításra, kérjük, vegye figyelembe, hogy az automatikus fordítások tartalmazhatnak hibákat vagy pontatlanságokat. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus információk esetén professzionális, emberi fordítást javaslunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ezen fordítás használatából ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->