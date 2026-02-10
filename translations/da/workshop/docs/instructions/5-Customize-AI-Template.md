# 5. Tilpas en skabelon

!!! tip "I SLUTNINGEN AF DETTE MODUL VIL DU VÆRE I STAND TIL AT"

    - [ ] Undersøgt de standard AI-agentfunktioner
    - [ ] Tilføjet AI-søgning med dit eget indeks
    - [ ] Aktiveret og analyseret tracing-metrikker
    - [ ] Udført en evalueringskørsel
    - [ ] Udført en red-teaming-scanning
    - [ ] **Lab 5: Udarbejdet en tilpasningsplan** 

---

## 5.1 AI-agentfunktioner

!!! success "Vi gennemførte dette i Lab 01"

- **File Search**: OpenAI's indbyggede filsøgning til videnshentning
- **Citations**: Automatisk kildeangivelse i svar
- **Customizable Instructions**: Ændr agentens adfærd og personlighed
- **Tool Integration**: Udvideligt værktøjssystem til brugerdefinerede funktioner

---

## 5.2 Valgmuligheder for videnshentning

!!! task "For at fuldføre dette skal vi foretage ændringer og genudrulle"    
    
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

**OpenAI File Search (Standard):**

- Indbygget i Foundry-agenterne
- Automatisk dokumentbehandling og indeksering
- Ingen yderligere konfiguration påkrævet

**Azure AI Search (Valgfri):**

- Hybrid semantisk og vektorsøgning
- Tilpasset indeksadministration
- Avancerede søgefunktioner
- Kræver `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Sporing og overvågning](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "For at fuldføre dette skal vi foretage ændringer og genudrulle"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Sporing:**

- OpenTelemetry-integration
- Sporing af forespørgsler og svar
- Ydelsesmetrikker
- Tilgængelig i Microsoft Foundry-portalen

**Logning:**

- Applikationslogs i Container Apps
- Struktureret logning med korrelations-id'er
- Visning af logs i realtid og historik

---

## 5.4 [Agentevaluering](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokal evaluering:**

- Indbyggede evaluatorer til kvalitetsvurdering
- Tilpassede evalueringsscripts
- Ydelsesbenchmarking

**Kontinuerlig overvågning:**

- Automatisk evaluering af live-interaktioner
- Sporing af kvalitetsmetrikker
- Registrering af ydelsesregressioner

**CI/CD-integration:**

- GitHub Actions-workflow
- Automatiseret test og evaluering
- Statistisk sammenligningstest

---

## 5.5 [AI Red Teaming-agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatiseret sikkerhedsscanning
- Risikovurdering af AI-systemer
- Sikkerhedsvurdering på tværs af flere kategorier

**Autentificering:**

- Managed Identity til Azure-tjenester
- Valgfri Azure App Service-autentificering
- Basic auth-fallback til udvikling



!!! quote "I SLUTNINGEN AF DETTE LAB SKAL DU HAVE"
    - [ ] Definer dine scenariekrav
    - [ ] Tilpassede miljøvariabler (konfiguration)
    - [ ] Tilpassede agentinstruktioner (opgave)
    - [ ] Udrullet den tilpassede skabelon (app)
    - [ ] Fuldført efter-implementeringsopgaver (manuel)
    - [ ] Kørt en testevaluering

Dette eksempel viser, hvordan skabelonen kan tilpasses til et detailhandels‑brugsscenario for virksomheder med to specialiserede agenter og flere modeludrulninger.

---

## 5.6 Tilpas det til dig!

### 5.6.1. Scenariekrav

#### **Agentudrulninger:** 

   - Shopper-agent: Hjælper kunder med at finde og sammenligne produkter
   - Loyalty-agent: Håndterer kunders belønninger og kampagner

#### **Modeludrulninger:**

   - `gpt-4.1`: Primær chatmodel
   - `o3`: Resoneringsmodel til komplekse forespørgsler
   - `gpt-4.1-nano`: Letvægtsmodel til simple interaktioner
   - `text-embedding-3-large`: Embeddings af høj kvalitet til søgning

#### **Funktioner:**

   - Sporings- og overvågningsfunktioner aktiveret
   - AI-søgning til produktkatalog
   - Evalueringsramme til kvalitets­sikring
   - Red teaming til sikkerhedsvalidering

---

### 5.6.2 Implementering af scenariet


#### 5.6.2.1. Forudgående konfiguration

Opret et opsætningsscript (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Angiv miljønavn
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Konfigurer region (vælg ud fra modeltilgængelighed)
azd env set AZURE_LOCATION "eastus2"

# Aktivér alle valgfrie tjenester
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfigurer primær chatmodel (gpt-4o som den nærmeste tilgængelige til gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfigurer embeddingsmodel til forbedret søgning
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Angiv agentnavn (opretter den første agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Konfigurer søgeindeks
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agentinstruktioner

Opret `custom-agents/shopper-agent-instructions.md`:

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

Opret `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Udrulningsscript

Opret `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Valider forudsætninger
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Opsæt miljø
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Kontroller kvoten i den valgte region
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

# Udrul infrastrukturen og applikationen
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Indsaml udrulningsoutput
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Hent webappens URL
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

#### 5.6.2.4: Post-implementeringskonfiguration

Opret `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Hent oplysninger om udrulning
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instruktioner til manuel konfiguration
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

### 5.6.3: Test og validering

Opret `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Bekræft, at miljøvariabler er indstillet
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Test webapplikationens tilgængelighed
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

# Kør evaluering, hvis konfigureret
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

### 5.6.4 Forventede resultater

Efter at have fulgt denne implementeringsguide vil du have:

1. **Udrullet infrastruktur:**

      - Microsoft Foundry-projekt med modeludrulninger
      - Container Apps, der hoster webapplikationen
      - AI Search-tjeneste til produktkatalog
      - Application Insights til overvågning

2. **Indledende agent:**

      - Shopper-agent konfigureret med grundlæggende instruktioner
      - Filsøgningsfunktion aktiveret
      - Sporings- og overvågningsfunktion konfigureret

3. **Klar til tilpasning:**

      - Rammeværk til at tilføje Loyalty-agent
      - Tilpassede instruktionsskabeloner
      - Test- og valideringsscripts
      - Opsætning af overvågning og evaluering

4. **Klar til produktion:**

      - Sikkerhedsscanning med red teaming
      - Ydelsesovervågning
      - Rammeværk for kvalitetsvurdering
      - Skalerbar arkitektur

Dette eksempel viser, hvordan AZD-skabelonen kan udvides og tilpasses til specifikke virksomhedsscenarier, samtidig med at bedste praksis for sikkerhed, overvågning og skalerbarhed bevares.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales en professionel, menneskelig oversættelse. Vi kan ikke gøres ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->