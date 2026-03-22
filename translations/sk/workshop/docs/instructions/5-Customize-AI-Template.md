# 5. Prispôsobiť šablónu

!!! tip "NA KONCI TOHTO MODULU BUDETE SCHOPNÍ"

    - [ ] Preskúmali predvolené schopnosti AI agenta
    - [ ] Pridali AI Search s vlastným indexom
    - [ ] Aktivovali a analyzovali metriky trasovania
    - [ ] Spustili hodnotiaci beh
    - [ ] Spustili red-teamingové skenovanie
    - [ ] **Laboratórium 5: Vytvorili plán prispôsobenia** 

---

## 5.1 Schopnosti AI agenta

!!! success "Dokončili sme to v laboratóriu 01"

- **File Search**: Vstavané vyhľadávanie súborov OpenAI na získavanie znalostí
- **Citations**: Automatické priraďovanie zdrojov v odpovediach
- **Customizable Instructions**: Upraviť správanie a osobnosť agenta
- **Tool Integration**: Rozšíriteľný systém nástrojov pre vlastné schopnosti

---

## 5.2 Možnosti získavania znalostí

!!! task "Aby sme to dokončili, musíme vykonať zmeny a znovu nasadiť"    
    
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

- Vstavané v Foundry agentech
- Automatické spracovanie a indexovanie dokumentov
- Nie je potrebná žiadna ďalšia konfigurácia

**Azure AI Search (Optional):**

- Hybridné sémantické a vektorové vyhľadávanie
- Správa vlastných indexov
- Pokročilé schopnosti vyhľadávania
- Vyžaduje `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Trasovanie & Monitorovanie](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Aby sme to dokončili, musíme vykonať zmeny a znovu nasadiť"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Trasovanie:**

- Integrácia OpenTelemetry
- Sledovanie požiadaviek/odpovedí
- Výkonové metriky
- Dostupné v portáli Microsoft Foundry

**Logovanie:**

- Aplikačné logy v Container Apps
- Štruktúrované logovanie s koreláčnými ID
- Prezeranie logov v reálnom čase a historických záznamov

---

## 5.4 [Hodnotenie agenta](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokálne hodnotenie:**

- Vstavaní hodnotitelia pre posúdenie kvality
- Vlastné hodnotiace skripty
- Meranie výkonu

**Kontinuálne monitorovanie:**

- Automatické hodnotenie živých interakcií
- Sledovanie metrík kvality
- Detekcia regresie výkonu

**Integrácia CI/CD:**

- Workflow GitHub Actions
- Automatizované testovanie a hodnotenie
- Štatistické porovnávacie testovanie

---

## 5.5 [Agent pre red-teaming AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI red-teaming:**

- Automatizované bezpečnostné skenovanie
- Posúdenie rizík pre AI systémy
- Hodnotenie bezpečnosti v rôznych kategóriách

**Autentifikácia:**

- Managed Identity pre služby Azure
- Voliteľná autentifikácia Azure App Service
- Záložná základná autentifikácia pre vývoj



!!! quote "NA KONCI TOHTO LABORATÓRIA BY STE MALI MAŤ"
    - [ ] Definujte požiadavky scenára
    - [ ] Prispôsobili env premenné (konfigurácia)
    - [ ] Prispôsobili inštrukcie agenta (úloha)
    - [ ] Nasadili prispôsobenú šablónu (aplikácia)
    - [ ] Dokončili post-deployment úlohy (manuálne)
    - [ ] Spustili testovacie hodnotenie

Tento príklad ukazuje prispôsobenie šablóny pre podnikový maloobchodný scenár s dvoma špecializovanými agentmi a viacerými nasadeniami modelov.

---

## 5.6 Prispôsobte si to!

### 5.6.1. Požiadavky scenára

#### **Nasadenia agentov:** 

   - Shopper Agent: Pomáha zákazníkom nájsť a porovnať produkty
   - Loyalty Agent: Spravuje odmeny a promo akcie pre zákazníkov

#### **Nasadenia modelov:**

   - `gpt-4.1`: Hlavný chatovací model
   - `o3`: Model uvažovania pre zložité dotazy
   - `gpt-4.1-nano`: Ľahký model pre jednoduché interakcie
   - `text-embedding-3-large`: Vysokokvalitné embeddingy pre vyhľadávanie

#### **Funkcie:**

   - Povolené trasovanie a monitorovanie
   - AI Search pre katalóg produktov
   - Evaluačný rámec pre zabezpečenie kvality
   - Red teaming pre overenie bezpečnosti

---

### 5.6.2 Implementácia scenára


#### 5.6.2.1. Prednasadzovacia konfigurácia

Vytvorte skript na nastavenie (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Nastavte názov prostredia
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Nastavte región (vyberte podľa dostupnosti modelu)
azd env set AZURE_LOCATION "eastus2"

# Povoľte všetky voliteľné služby
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Nastavte primárny chatovací model (gpt-4.1 ako najbližší dostupný k gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Nastavte embeddingový model pre vylepšené vyhľadávanie
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Nastavte názov agenta (vytvorí prvého agenta)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Nastavte vyhľadávací index
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Inštrukcie pre agentov

Vytvorte `custom-agents/shopper-agent-instructions.md`:

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

Vytvorte `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Nasadzovací skript

Vytvorte `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Overiť predpoklady
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Nastaviť prostredie
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Skontrolovať kvótu v zvolenom regióne
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

# Nasadiť infraštruktúru a aplikáciu
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Zaznamenať výstupy nasadenia
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Získať URL webovej aplikácie
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

#### 5.6.2.4: Konfigurácia po nasadení

Vytvorte `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Získajte informácie o nasadení
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Pokyny na manuálnu konfiguráciu
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

### 5.6.3: Testovanie a validácia

Vytvorte `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Skontrolovať, či sú nastavené premenné prostredia
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Otestovať dostupnosť webovej aplikácie
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

# Spustiť vyhodnotenie, ak je nakonfigurované
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

### 5.6.4 Očakávané výsledky

Po dodržaní tohto implementačného návodu budete mať:

1. **Nasadená infraštruktúra:**

      - Microsoft Foundry projekt s nasadeniami modelov
      - Container Apps hosťujúce webovú aplikáciu
      - Služba AI Search pre katalóg produktov
      - Application Insights pre monitorovanie

2. **Počiatočný agent:**

      - Shopper Agent nakonfigurovaný so základnými inštrukciami
      - Povolená schopnosť vyhľadávania súborov
      - Konfigurované trasovanie a monitorovanie

3. **Pripravené na prispôsobenie:**

      - Rámec na pridanie Loyalty Agenta
      - Šablóny vlastných inštrukcií
      - Skripty na testovanie a validáciu
      - Nastavenie monitorovania a hodnotenia

4. **Pripravenosť na produkciu:**

      - Bezpečnostné skenovanie s red-teamingom
      - Monitorovanie výkonu
      - Rámec na hodnotenie kvality
      - Škálovateľná architektúra

Tento príklad ukazuje, ako možno šablónu AZD rozšíriť a prispôsobiť pre konkrétne podnikové scenáre pri zachovaní osvedčených postupov pre bezpečnosť, monitorovanie a škálovateľnosť.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladovej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa usilujeme o presnosť, vezmite, prosím, na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->