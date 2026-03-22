# 5. Anpassa en mall

!!! tip "I SLUTET AV DENNA MODUL KOMMER DU ATT KUNNA"

    - [ ] Utforskat standardfunktionerna för AI-agenter
    - [ ] Lagt till AI-sökning med ditt eget index
    - [ ] Aktiverat och analyserat spårningsmätvärden
    - [ ] Kört en utvärderingskörning
    - [ ] Kört en red‑teaming-skanning
    - [ ] **Lab 5: Skapat en anpassningsplan** 

---

## 5.1 AI-agentfunktioner

!!! success "Vi slutförde detta i Lab 01"

- **Filsökning**: OpenAI:s inbyggda filsökning för kunskapsinhämtning
- **Källhänvisningar**: Automatisk källangivelse i svaren
- **Anpassningsbara instruktioner**: Modifiera agentens beteende och personlighet
- **Verktygsintegration**: Utbyggbart verktygssystem för egna funktioner

---

## 5.2 Alternativ för kunskapsinhämtning

!!! task "För att slutföra detta måste vi göra ändringar och distribuera igen"    
    
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

**OpenAI Filsökning (standard):**

- Inbyggt i Foundry Agents
- Automatisk dokumentbearbetning och indexering
- Ingen ytterligare konfiguration krävs

**Azure AI Search (valfritt):**

- Hybrid semantisk och vektorsökning
- Anpassad indexhantering
- Avancerade sökfunktioner
- Kräver `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Spårning och övervakning](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "För att slutföra detta måste vi göra ändringar och distribuera igen"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Spårning:**

- Integration med OpenTelemetry
- Spårning av förfrågningar/svar
- Prestandamätvärden
- Tillgängligt i Microsoft Foundry-portalen

**Loggning:**

- Applikationsloggar i Container Apps
- Strukturerad loggning med korrelations-ID:n
- Realtids- och historisk loggvisning

---

## 5.4 [Agentutvärdering](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokal utvärdering:**

- Inbyggda utvärderare för kvalitetsbedömning
- Anpassade utvärderingsskript
- Prestandamätning

**Kontinuerlig övervakning:**

- Automatisk utvärdering av live-interaktioner
- Spårning av kvalitetsmetrik
- Detektion av prestandaregessioner

**CI/CD-integration:**

- GitHub Actions-arbetsflöde
- Automatiserad testning och utvärdering
- Statistisk jämförande testning

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatiska säkerhetsskanningar
- Riskbedömning för AI-system
- Säkerhetsutvärdering över flera kategorier

**Autentisering:**

- Managed Identity för Azure-tjänster
- Valfri Azure App Service-autentisering
- Basic-auth som reserv för utveckling



!!! quote "I SLUTET AV DENNA LABB SKA DU HA"
    - [ ] Definiera dina scenariokrav
    - [ ] Anpassade miljövariabler (konfig)
    - [ ] Anpassade agentinstruktioner (uppgift)
    - [ ] Distribuerat den anpassade mallen (app)
    - [ ] Slutfört efter-distributionsuppgifter (manuella)
    - [ ] Kör en testutvärdering

Detta exempel visar hur mallen kan anpassas för ett företagsinriktat detaljhandelsfall med två specialiserade agenter och flera modelldistributioner.

---

## 5.6 Anpassa det för dig!

### 5.6.1. Scenariokrav

#### **Agentdistributioner:** 

   - Shopper Agent: Hjälper kunder att hitta och jämföra produkter
   - Loyalty Agent: Hanterar kundbelöningar och kampanjer

#### **Modelldistributioner:**

   - `gpt-4.1`: Primär chattmodell
   - `o3`: Resonemangsmodell för komplexa frågor
   - `gpt-4.1-nano`: Lättviktsmodell för enkla interaktioner
   - `text-embedding-3-large`: Högkvalitativa embeddingar för sökning

#### **Funktioner:**

   - Spårning och övervakning aktiverade
   - AI-sökning för produktkatalog
   - Utvärderingsramverk för kvalitetssäkring
   - Red teaming för säkerhetsvalidering

---

### 5.6.2 Implementering av scenariot


#### 5.6.2.1. Konfiguration före distribution

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Ange miljönamn
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Konfigurera region (välj baserat på modellens tillgänglighet)
azd env set AZURE_LOCATION "eastus2"

# Aktivera alla valfria tjänster
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfigurera primär chattmodell (gpt-4.1 som närmast tillgänglig till gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfigurera inbäddningsmodell för förbättrad sökning
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Ange agentnamn (kommer att skapa den första agenten)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Konfigurera sökindex
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agentinstruktioner

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

#### 5.6.2.3: Distributionsskript

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Verifiera förutsättningar
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Sätt upp miljön
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Kontrollera kvot i vald region
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

# Distribuera infrastruktur och applikation
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Hämta distributionsutdata
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Hämta webbappens URL
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

#### 5.6.2.4: Konfiguration efter distribution

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Hämta distributionsinformation
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instruktioner för manuell konfiguration
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

### 5.6.3: Testning och validering

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Kontrollera att miljövariablerna är inställda
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Testa webbapplikationens tillgänglighet
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

# Kör utvärdering om det är konfigurerat
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

### 5.6.4 Förväntade resultat

Efter att ha följt denna implementeringsguide kommer du att ha:

1. **Distribuerad infrastruktur:**

      - Microsoft Foundry-projekt med modelldistributioner
      - Container Apps som hostar webbapplikationen
      - AI Search-tjänst för produktkatalog
      - Application Insights för övervakning

2. **Initialagent:**

      - Shopper Agent konfigurerad med grundläggande instruktioner
      - Filsökfunktion aktiverad
      - Spårning och övervakning konfigurerade

3. **Redo för anpassning:**

      - Ramverk för att lägga till Loyalty Agent
      - Mallar för anpassade instruktioner
      - Test- och valideringsskript
      - Uppställning för övervakning och utvärdering

4. **Klar för produktion:**

      - Säkerhetsskanning med red teaming
      - Prestandaövervakning
      - Ramverk för kvalitetsutvärdering
      - Skalbar arkitektur

Detta exempel visar hur AZD-mallen kan utvidgas och anpassas för specifika företags­scenarier samtidigt som bästa praxis för säkerhet, övervakning och skalbarhet bibehålls.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Friskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Vi strävar efter noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet i sitt originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->