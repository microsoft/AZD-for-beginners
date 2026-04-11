# 5. Přizpůsobení šablony

!!! tip "NA KONCI TOHOTO MODULU BUDETE SCHOPNI"

    - [ ] Prozkoumat výchozí schopnosti AI agenta
    - [ ] Přidat AI vyhledávání s vlastním indexem
    - [ ] Aktivovat a analyzovat měření sledování
    - [ ] Spustit hodnoticí běh
    - [ ] Spustit red-teamové skenování
    - [ ] **Lab 5: Vytvořit plán přizpůsobení** 

---

## 5.1 Schopnosti AI agenta

!!! success "Dokončeno v Lab 01"

- **Vyhledávání v souborech**: Vestavěné vyhledávání OpenAI pro získávání znalostí
- **Citace**: Automatické přiřazení zdrojů v odpovědích
- **Přizpůsobitelné instrukce**: Úprava chování a osobnosti agenta
- **Integrace nástrojů**: Rozšiřitelný systém nástrojů pro vlastní schopnosti

---

## 5.2 Možnosti získávání znalostí

!!! task "Pro dokončení je třeba provést změny a znovu nasadit"    
    
    ```bash title=""
    # Nastavení proměnných prostředí
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Nahrání dat a vytvoření indexu

    ```

---

**Vyhledávání v souborech OpenAI (výchozí):**

- Vestavěné v agentech Foundry
- Automatické zpracování dokumentů a indexování
- Není potřeba žádná další konfigurace

**Azure AI Search (volitelné):**

- Hybridní sémantické a vektorové vyhledávání
- Správa vlastního indexu
- Pokročilé funkce vyhledávání
- Vyžaduje `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Sledování a monitorování](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Pro dokončení je třeba provést změny a znovu nasadit"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Sledování:**

- Integrace OpenTelemetry
- Sledování požadavků a odpovědí
- Výkonové metriky
- Dostupné v portálu Microsoft Foundry

**Logování:**

- Aplikační logy v Container Apps
- Strukturované logování s ID korelace
- Zobrazení logů v reálném čase i historicky

---

## 5.4 [Hodnocení agenta](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokální hodnocení:**

- Vestavěné hodnoticí nástroje pro posouzení kvality
- Vlastní hodnoticí skripty
- Benchmarking výkonu

**Kontinuální monitorování:**

- Automatické hodnocení živých interakcí
- Sledování metrik kvality
- Detekce regresí ve výkonu

**CI/CD integrace:**

- GitHub Actions workflow
- Automatizované testování a hodnocení
- Statistické srovnávací testování

---

## 5.5 [AI Red Teaming agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatizované bezpečnostní skenování
- Hodnocení rizik AI systémů
- Bezpečnostní hodnocení ve více kategoriích

**Autentizace:**

- Spravovaná identita pro Azure služby
- Volitelná autentizace Azure App Service
- Záložní základní autentizace pro vývoj

!!! quote "NA KONCI TOHOTO LABU BYSTE MĚLI MÍT"
    - [ ] Definované požadavky scénáře
    - [ ] Přizpůsobené proměnné prostředí (config)
    - [ ] Přizpůsobené instrukce agenta (úkol)
    - [ ] Nasazenou přizpůsobenou šablonu (app)
    - [ ] Dokončené úkoly po nasazení (manuálně)
    - [ ] Spuštěné testovací hodnocení

Tento příklad ukazuje přizpůsobení šablony pro podnikový maloobchodní scénář se dvěma specializovanými agenty a více nasazeními modelů.

---

## 5.6 Přizpůsobte si to pro sebe!

### 5.6.1 Požadavky scénáře

#### **Nasazení agentů:** 

   - Shopper Agent: Pomáhá zákazníkům najít a porovnat produkty
   - Loyalty Agent: Spravuje zákaznické odměny a promoakce

#### **Nasazení modelů:**

   - `gpt-4.1`: Hlavní chatovací model
   - `o3`: Dedukční model pro složité dotazy
   - `gpt-4.1-nano`: Lehký model pro jednoduché interakce
   - `text-embedding-3-large`: Vysoce kvalitní embeddings pro vyhledávání

#### **Funkce:**

   - Povolené sledování a monitorování
   - AI vyhledávání pro katalog produktů
   - Rámec pro hodnocení kvality
   - Red teaming pro bezpečnostní ověření

---

### 5.6.2 Implementace scénáře


#### 5.6.2.1. Konfigurace před nasazením

Vytvořte skript nastavení (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Nastavit název prostředí
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Nakonfigurovat region (vyberte podle dostupnosti modelu)
azd env set AZURE_LOCATION "eastus2"

# Povolit všechny volitelné služby
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Nakonfigurovat primární chatovací model (gpt-4.1 jako nejbližší dostupný k gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Nakonfigurovat model vkládání pro vylepšené vyhledávání
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Nastavit název agenta (vytvoří prvního agenta)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Nakonfigurovat vyhledávací index
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Instrukce agenta

Vytvořte `custom-agents/shopper-agent-instructions.md`:

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

Vytvořte `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Skript pro nasazení

Vytvořte `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Ověřit předpoklady
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Nastavit prostředí
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Zkontrolovat kvótu ve vybrané oblasti
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

# Nasadit infrastrukturu a aplikaci
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Zachytit výstupy nasazení
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Získat URL webové aplikace
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

#### 5.6.2.4: Konfigurace po nasazení

Vytvořte `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Získat informace o nasazení
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Pokyny pro ruční konfiguraci
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

### 5.6.3: Testování a ověření

Vytvořte `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Ověřte, zda jsou nastaveny proměnné prostředí
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Otestujte dostupnost webové aplikace
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

# Spusťte vyhodnocení, pokud je nakonfigurováno
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

### 5.6.4 Očekávané výsledky

Po dodržení tohoto návodu budete mít:

1. **Nasazenou infrastrukturu:**

      - Projekt Microsoft Foundry s nasazením modelů
      - Container Apps hostující webovou aplikaci
      - AI Search službu pro katalog produktů
      - Application Insights pro monitorování

2. **Počátečního agenta:**

      - Shopper Agent nakonfigurovaný se základními instrukcemi
      - Povolené vyhledávání v souborech
      - Nakonfigurované sledování a monitorování

3. **Připraveno pro přizpůsobení:**

      - Rámec pro přidání Loyalty Agenta
      - Šablony vlastních instrukcí
      - Skripty pro testování a validaci
      - Nastavení monitorování a hodnocení

4. **Připraveno do produkce:**

      - Bezpečnostní skenování s red teamingem
      - Monitorování výkonu
      - Rámec pro hodnocení kvality
      - Škálovatelná architektura

Tento příklad ukazuje, jak lze šablonu AZD rozšířit a přizpůsobit pro konkrétní podnikové scénáře při zachování osvědčených postupů v oblasti bezpečnosti, monitorování a škálovatelnosti.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:  
Tento dokument byl přeložen pomocí služby automatického překladu AI [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoliv nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->