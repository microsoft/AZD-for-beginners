# 5. Customize a Template

!!! tip "NA KONCI TOHOTO MODULU BUDETE UMĚT"

    - [ ] Prozkoumali výchozí schopnosti AI agenta
    - [ ] Přidali AI Search s vlastním indexem
    - [ ] Aktivovali a analyzovali metriky trasování
    - [ ] Provedli vyhodnocovací běh
    - [ ] Provedli red-teamingový sken
    - [ ] **Lab 5: Vytvořili plán přizpůsobení** 

---

## 5.1 AI Agent Capabilities

!!! success "Dokončeno v Labu 01"

- **File Search**: Vestavěné vyhledávání souborů OpenAI pro získávání znalostí
- **Citations**: Automatické přiřazování zdrojů v odpovědích
- **Customizable Instructions**: Upravte chování a osobnost agenta
- **Tool Integration**: Rozšiřitelný systém nástrojů pro vlastní funkce

---

## 5.2 Knowledge Retrieval Options

!!! task "Pro dokončení musíme provést změny a znovu nasadit"    
    
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

**OpenAI File Search (Výchozí):**

- Vestavěné v Foundry Agents
- Automatické zpracování dokumentů a indexování
- Není potřeba žádná další konfigurace

**Azure AI Search (Volitelné):**

- Hybridní sémantické a vektorové vyhledávání
- Vlastní správa indexů
- Pokročilé vyhledávací funkce
- Vyžaduje `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Trasování & monitorování](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Pro dokončení musíme provést změny a znovu nasadit"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- Integrace OpenTelemetry
- Sledování požadavků/odpovědí
- Metriky výkonu
- Dostupné v portálu Microsoft Foundry

**Logging:**

- Aplikační protokoly v Container Apps
- Strukturované logování s identifikátory korelace
- Zobrazení logů v reálném čase i historických

---

## 5.4 [Hodnocení agentů](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokální hodnocení:**

- Vestavěné hodnoticí nástroje pro posouzení kvality
- Vlastní skripty pro hodnocení
- Výkonnostní benchmarky

**Kontinuální monitorování:**

- Automatické hodnocení živých interakcí
- Sledování metrik kvality
- Detekce regresí výkonu

**Integrace CI/CD:**

- Workflow GitHub Actions
- Automatizované testování a hodnocení
- Statistické porovnávací testování

---

## 5.5 [Agent pro AI red teaming](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatizované bezpečnostní skenování
- Posouzení rizik pro AI systémy
- Hodnocení bezpečnosti napříč více kategoriemi

**Autentizace:**

- Spravovaná identita pro služby Azure
- Volitelná autentizace Azure App Service
- Záložní základní autentizace pro vývoj



!!! quote "NA KONCI TOHOTO LABU BYSTE MĚLI MÍT"
    - [ ] Definovali požadavky svého scénáře
    - [ ] Přizpůsobili proměnné prostředí (config)
    - [ ] Přizpůsobili instrukce agenta (task)
    - [ ] Nasadili přizpůsobenou šablonu (app)
    - [ ] Dokončili úkoly po nasazení (manuální)
    - [ ] Spustili testovací hodnocení

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Customize It For You!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: Pomáhá zákazníkům najít a porovnat produkty
   - Loyalty Agent: Spravuje zákaznické odměny a promo akce

#### **Model Deployments:**

   - `gpt-4.1`: Primární chatovací model
   - `o3`: Model pro zpracování složitých dotazů
   - `gpt-4.1-nano`: Lehký model pro jednoduché interakce
   - `text-embedding-3-large`: Vysoce kvalitní embeddingy pro vyhledávání

#### **Features:**

   - Povoleno trasování a monitorování
   - AI Search pro katalog produktů
   - Rámec hodnocení pro zajištění kvality
   - Red teaming pro ověření bezpečnosti

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Nastavte název prostředí
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Konfigurujte region (vyberte podle dostupnosti modelu)
azd env set AZURE_LOCATION "eastus2"

# Povolte všechny volitelné služby
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfigurujte primární chatovací model (gpt-4.1 jako nejbližší dostupný)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfigurujte embeddingový model pro vylepšené vyhledávání
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Nastavte jméno agenta (vytvoří se první agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Konfigurujte vyhledávací index
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agent Instructions

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

#### 5.6.2.3: Deployment Script

Create `deploy-retail.sh`:

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

# Zkontrolovat kvótu v vybrané oblasti
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

### 5.6.3: Testing and Validation

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Ověřte, že jsou nastaveny proměnné prostředí
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Otestujte dostupnost webové aplikace
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

### 5.6.4 Expected Outcomes

After following this implementation guide, you will have:

1. **Deployed Infrastructure:**

      - Microsoft Foundry project with model deployments
      - Container Apps hosting the web application
      - AI Search service for product catalog
      - Application Insights for monitoring

2. **Initial Agent:**

      - Shopper Agent configured with basic instructions
      - File search capability enabled
      - Tracing and monitoring configured

3. **Ready for Customization:**

      - Framework for adding Loyalty Agent
      - Custom instruction templates
      - Testing and validation scripts
      - Monitoring and evaluation setup

4. **Production Readiness:**

      - Security scanning with red teaming
      - Performance monitoring
      - Quality evaluation framework
      - Scalable architecture

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné výklady vzniklé v souvislosti s použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->