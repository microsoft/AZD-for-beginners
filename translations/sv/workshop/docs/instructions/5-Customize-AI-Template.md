<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "60caadc3b57dccb9e6c413b5ccace90b",
  "translation_date": "2025-09-24T21:28:42+00:00",
  "source_file": "workshop/docs/instructions/5-Customize-AI-Template.md",
  "language_code": "sv"
}
-->
# 5. Anpassa en Mall

!!! tip "VID SLUTET AV DENNA MODUL KOMMER DU ATT KUNNA"

    - [ ] Utforskat standardfunktionerna för AI-agenten
    - [ ] Lagt till AI-sökning med din egen index
    - [ ] Aktiverat och analyserat spårningsmetrik
    - [ ] Genomfört en utvärderingskörning
    - [ ] Genomfört en red-teaming-skanning
    - [ ] **Lab 5: Skapat en anpassningsplan** 

---

## 5.1 Funktioner hos AI-agenten

!!! success "Detta slutförde vi i Lab 01"

- **Fil-sökning**: OpenAI:s inbyggda fil-sökning för kunskapsinhämtning
- **Källhänvisningar**: Automatisk källattribution i svar
- **Anpassningsbara instruktioner**: Ändra agentens beteende och personlighet
- **Verktygsintegration**: Utbyggbart verktygssystem för anpassade funktioner

---

## 5.2 Alternativ för kunskapsinhämtning

!!! task "För att slutföra detta behöver vi göra ändringar och återimplementera"    
    
    ```bash title=""
    # Ställ in miljövariabler
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Ladda upp data och skapa mitt index

    ```

---

**OpenAI Fil-sökning (Standard):**

- Inbyggt i Azure AI Agent-tjänsten
- Automatisk dokumentbearbetning och indexering
- Ingen ytterligare konfiguration krävs

**Azure AI Sökning (Valfritt):**

- Hybrid semantisk och vektorsökning
- Anpassad indexhantering
- Avancerade sökfunktioner
- Kräver `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Spårning & Övervakning](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "För att slutföra detta behöver vi göra ändringar och återimplementera"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Spårning:**

- OpenTelemetry-integration
- Spårning av förfrågningar och svar
- Prestandametrik
- Tillgängligt i AI Foundry-portalen

**Loggning:**

- Applikationsloggar i Container Apps
- Strukturerad loggning med korrelations-ID
- Realtids- och historisk loggvisning

---

## 5.4 [Agentutvärdering](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokal utvärdering:**

- Inbyggda utvärderare för kvalitetsbedömning
- Anpassade utvärderingsskript
- Prestandabenchmarking

**Kontinuerlig övervakning:**

- Automatisk utvärdering av liveinteraktioner
- Spårning av kvalitetsmetrik
- Upptäckt av prestandaregression

**CI/CD Integration:**

- GitHub Actions-arbetsflöde
- Automatiserad testning och utvärdering
- Statistisk jämförelsetestning

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatisk säkerhetsskanning
- Riskbedömning för AI-system
- Säkerhetsutvärdering över flera kategorier

**Autentisering:**

- Hanterad identitet för Azure-tjänster
- Valfri autentisering via Azure App Service
- Grundläggande autentisering som reserv för utveckling

!!! quote "VID SLUTET AV DETTA LABB BÖR DU HA"
    - [ ] Definierat dina scenariokrav
    - [ ] Anpassat miljövariabler (konfiguration)
    - [ ] Anpassat agentinstruktioner (uppgift)
    - [ ] Implementerat den anpassade mallen (app)
    - [ ] Slutfört efterimplementeringsuppgifter (manuellt)
    - [ ] Genomfört en testutvärdering

Detta exempel visar hur man anpassar mallen för ett företagsdetaljhandelsfall med två specialiserade agenter och flera modellimplementeringar.

---

## 5.6 Anpassa det för dig!

### 5.6.1. Scenariokrav

#### **Agentimplementeringar:** 

   - Shopper Agent: Hjälper kunder att hitta och jämföra produkter
   - Loyalty Agent: Hanterar kundbelöningar och kampanjer

#### **Modellimplementeringar:**

   - `gpt-4.1`: Primär chattmodell
   - `o3`: Resoneringsmodell för komplexa frågor
   - `gpt-4.1-nano`: Lättviktsmodell för enkla interaktioner
   - `text-embedding-3-large`: Högkvalitativa inbäddningar för sökning

#### **Funktioner:**

   - Spårning och övervakning aktiverat
   - AI-sökning för produktkatalog
   - Utvärderingsramverk för kvalitetskontroll
   - Red teaming för säkerhetsvalidering

---

### 5.6.2 Scenarieimplementering


#### 5.6.2.1. Förimplementeringskonfiguration

Skapa ett installationsskript (`setup-retail.sh`)

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

#### 5.6.2.2: Agentinstruktioner

Skapa `custom-agents/shopper-agent-instructions.md`:

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

Skapa `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Implementeringsskript

Skapa `deploy-retail.sh`:

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

#### 5.6.2.4: Efterimplementeringskonfiguration

Skapa `configure-retail-agents.sh`:

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

### 5.6.3: Testning och validering

Skapa `test-retail-deployment.sh`:

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

### 5.6.4 Förväntade resultat

Efter att ha följt denna implementeringsguide kommer du att ha:

1. **Implementerad Infrastruktur:**

      - AI Foundry-projekt med modellimplementeringar
      - Container Apps som hostar webbapplikationen
      - AI-söktjänst för produktkatalog
      - Application Insights för övervakning

2. **Initial Agent:**

      - Shopper Agent konfigurerad med grundläggande instruktioner
      - Fil-sökningsfunktion aktiverad
      - Spårning och övervakning konfigurerad

3. **Redo för Anpassning:**

      - Ramverk för att lägga till Loyalty Agent
      - Anpassade instruktionstemplates
      - Test- och valideringsskript
      - Övervaknings- och utvärderingsinställningar

4. **Produktionsberedskap:**

      - Säkerhetsskanning med red teaming
      - Prestandaövervakning
      - Kvalitetsutvärderingsramverk
      - Skalbar arkitektur

Detta exempel visar hur AZD-mallen kan utökas och anpassas för specifika företagsfall samtidigt som bästa praxis för säkerhet, övervakning och skalbarhet bibehålls.

---

