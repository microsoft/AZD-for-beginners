# 5. Pas een sjabloon aan

!!! tip "AAN HET EINDE VAN DEZE MODULE KUNT U"

    - [ ] De standaard AI Agent-mogelijkheden onderzocht
    - [ ] AI Search toegevoegd met uw eigen index
    - [ ] Tracing-metrics geactiveerd en geanalyseerd
    - [ ] Een evaluatieronde uitgevoerd
    - [ ] Een red-teaming scan uitgevoerd
    - [ ] **Lab 5: Een aanpassingsplan gemaakt** 

---

## 5.1 AI Agent-mogelijkheden

!!! success "We hebben dit voltooid in Lab 01"

- **File Search**: OpenAI's ingebouwde bestandszoekfunctie voor kennisopvraging
- **Citations**: Automatische bronvermelding in antwoorden
- **Customizable Instructions**: Pas het gedrag en de persoonlijkheid van de agent aan
- **Tool Integration**: Uitbreidbaar toolsysteem voor aangepaste functionaliteit

---

## 5.2 Opties voor kennisopvraging

!!! task "Om dit te voltooien moeten we wijzigingen aanbrengen en opnieuw implementeren"    
    
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

**OpenAI File Search (Standaard):**

- Ingebouwd in Foundry Agents
- Automatische documentverwerking en indexering
- Geen extra configuratie vereist

**Azure AI Search (Optioneel):**

- Hybride semantische en vectorzoekopdrachten
- Aangepast indexbeheer
- Geavanceerde zoekmogelijkheden
- Vereist `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Om dit te voltooien moeten we wijzigingen aanbrengen en opnieuw implementeren"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry-integratie
- Volgen van verzoeken/antwoorden
- Prestatiemaatstaven
- Beschikbaar in het Microsoft Foundry-portaal

**Logging:**

- Applicatielogboeken in Container Apps
- Gestructureerde logging met correlatie-ID's
- Realtime en historische logweergave

---

## 5.4 [Agent Evaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokale evaluatie:**

- Ingebouwde beoordelaars voor kwaliteitsbeoordeling
- Aangepaste evaluatiescripts
- Prestatiebenchmarks

**Continue monitoring:**

- Automatische evaluatie van live-interacties
- Bijhouden van kwaliteitsmetriek
- Detectie van prestatieverslechtering

**CI/CD-integratie:**

- GitHub Actions-workflow
- Geautomatiseerd testen en evaluatie
- Statistische vergelijkende tests

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Geautomatiseerde beveiligingsscans
- Risicobeoordeling voor AI-systemen
- Veiligheidsevaluatie over meerdere categorieën

**Authenticatie:**

- Managed Identity voor Azure-services
- Optionele Azure App Service-authenticatie
- Basic-auth fallback voor ontwikkeling



!!! quote "AAN HET EINDE VAN DIT LAB ZOU U MOETEN HEBBEN"
    - [ ] Definieer uw scenariovereisten
    - [ ] Aangepaste omgevingsvariabelen (config)
    - [ ] Aangepaste agentinstructies (taak)
    - [ ] Het aangepaste sjabloon uitgerold (app)
    - [ ] Voltooide post-deployment taken (handmatig)
    - [ ] Voer een testevaluatie uit

Dit voorbeeld toont hoe het sjabloon kan worden aangepast voor een enterprise retail-usecase met twee gespecialiseerde agenten en meerdere modelimplementaties.

---

## 5.6 Pas het aan voor jou!

### 5.6.1. Scenariovereisten

#### **Agentimplementaties:** 

   - Shopper-agent: Helpt klanten producten te vinden en te vergelijken
   - Loyalty-agent: Beheert klantbeloningen en promoties

#### **Modelimplementaties:**

   - `gpt-4.1`: Primair chatmodel
   - `o3`: Redeneermodel voor complexe queries
   - `gpt-4.1-nano`: Lichtgewicht model voor eenvoudige interacties
   - `text-embedding-3-large`: Hoogwaardige embeddings voor zoekopdrachten

#### **Functies:**

   - Tracing en monitoring ingeschakeld
   - AI Search voor productcatalogus
   - Evaluatiekader voor kwaliteitsborging
   - Red-teaming voor veiligheidsvalidatie

---

### 5.6.2 Scenario-implementatie


#### 5.6.2.1. Pre-deploy-configuratie

Maak een setup-script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Stel de omgevingsnaam in
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configureer regio (kies op basis van modelbeschikbaarheid)
azd env set AZURE_LOCATION "eastus2"

# Schakel alle optionele diensten in
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configureer het primaire chatmodel (gpt-4o als dichtstbijzijnde beschikbare optie tot gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configureer het embeddingmodel voor verbeterde zoekresultaten
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Stel de agentnaam in (maakt de eerste agent aan)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configureer de zoekindex
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agentinstructies

Maak `custom-agents/shopper-agent-instructions.md`:

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

Maak `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Deploymentscript

Maak `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Controleer vereisten
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Stel de omgeving in
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Controleer quota in geselecteerde regio
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

# Implementeer infrastructuur en applicatie
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Leg de uitvoer van de implementatie vast
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Haal de URL van de webapp op
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

#### 5.6.2.4: Post-deploymentconfiguratie

Maak `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Haal informatie over de implementatie op
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instructies voor handmatige configuratie
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

### 5.6.3: Testen en validatie

Maak `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Controleer of omgevingsvariabelen zijn ingesteld
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Test de beschikbaarheid van de webapplicatie
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

# Voer evaluatie uit indien geconfigureerd
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

### 5.6.4 Verwachte uitkomsten

Na het volgen van deze implementatiegids heb je:

1. **Uitgerolde infrastructuur:**

      - Microsoft Foundry-project met modelimplementaties
      - Container Apps die de webapp hosten
      - AI Search-service voor de productcatalogus
      - Application Insights voor monitoring

2. **Initiële agent:**

      - Shopper-agent geconfigureerd met basisinstructies
      - Bestandszoekfunctie ingeschakeld
      - Tracing en monitoring geconfigureerd

3. **Klaar voor aanpassing:**

      - Framework voor het toevoegen van de Loyalty-agent
      - Aangepaste instructiesjablonen
      - Test- en validatiescripts
      - Monitoring- en evaluatieconfiguratie

4. **Productieklaarheid:**

      - Beveiligingsscans met red teaming
      - Prestatiemonitoring
      - Kwaliteitsevaluatiekader
      - Schaalbare architectuur

Dit voorbeeld toont aan hoe het AZD-sjabloon kan worden uitgebreid en aangepast voor specifieke enterprise-scenario's, terwijl best practices voor beveiliging, monitoring en schaalbaarheid behouden blijven.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal geldt als de gezaghebbende bron. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerd geïnterpreteerde informatie die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->