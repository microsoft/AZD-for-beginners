# 5. Tilpas en skabelon

!!! tip "VED SLUTNINGEN AF DETTE MODUL VIL DU KUNNE"

    - [ ] Undersøgt de forudindstillede AI-agentfunktioner
    - [ ] Tilføjet AI Search med dit eget indeks
    - [ ] Aktiveret og analyseret sporingsmetrikker
    - [ ] Udført en evalueringskørsel
    - [ ] Udført et red-teaming-scan
    - [ ] **Lab 5: Udarbejdet en tilpasningsplan** 

---

## 5.1 AI-agentfunktioner

!!! success "Vi gennemførte dette i Lab 01"

- **Fil-søgning**: OpenAI's indbyggede filsøgning til videnindhentning
- **Kildehenvisninger**: Automatisk kildeangivelse i svar
- **Tilpasselige instruktioner**: Ændr agentens adfærd og personlighed
- **Værktøjsintegration**: Udvideligt værktøjssystem til brugerdefinerede funktioner

---

## 5.2 Muligheder for vidensøgning

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

**OpenAI Filsøgning (Standard):**

- Indbygget i Foundry Agents
- Automatisk dokumentbehandling og indeksering
- Ingen yderligere konfiguration nødvendig

**Azure AI Search (Valgfrit):**

- Hybrid semantisk- og vektorsøgning
- Brugerdefineret indeksstyring
- Avancerede søgefunktioner
- Requires `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Sporing & Overvågning](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "For at fuldføre dette skal vi foretage ændringer og genudrulle"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Sporing:**

- OpenTelemetry-integration
- Anmodnings-/svarsporing
- Ydelsesmetrikker
- Tilgængelig i Microsoft Foundry-portalen

**Logning:**

- Applikationslogfiler i Container Apps
- Struktureret logning med korrelations-ID'er
- Visning af realtids- og historiske logs

---

## 5.4 [Agent-evaluering](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokal evaluering:**

- Indbyggede evaluatorer til kvalitetsvurdering
- Brugerdefinerede evalueringsscripts
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
- Sikkerhedsevaluering på tværs af flere kategorier

**Autentificering:**

- Administreret identitet til Azure-tjenester
- Valgfri Azure App Service-autentificering
- Basic auth-faldtilbage til udvikling



!!! quote "VED SLUTNINGEN AF DETTE LAB BØR DU HAVE"
    - [ ] Definer dine scenariekrav
    - [ ] Tilpassede miljøvariabler (konfiguration)
    - [ ] Tilpassede agentinstruktioner (opgave)
    - [ ] Udrullet den tilpassede skabelon (app)
    - [ ] Udført efter-udrulningsopgaver (manuelt)
    - [ ] Kørt en testevaluering

Dette eksempel viser, hvordan skabelonen kan tilpasses til et enterprise-scenarie inden for detailhandel med to specialiserede agenter og flere modeludrulninger.

---

## 5.6 Tilpas det til dig!

### 5.6.1. Scenariekrav

#### **Agentudrulninger:** 

   - Shopper-agent: Hjælper kunder med at finde og sammenligne produkter
   - Loyalty-agent: Håndterer kundernes belønninger og kampagner

#### **Modeludrulninger:**

   - `gpt-4.1`: Primær chatmodel
   - `o3`: Resonneringsmodel til komplekse forespørgsler
   - `gpt-4.1-nano`: Letvægtsmodel til simple interaktioner
   - `text-embedding-3-large`: Højkvalitets-embeddings til søgning

#### **Funktioner:**

   - Sporing og overvågning aktiveret
   - AI Search for produktkatalog
   - Evalueringsramme til kvalitetssikring
   - Red teaming til sikkerhedsvalidering

---

### 5.6.2 Implementering af scenarie


#### 5.6.2.1. Forud-udrulningskonfiguration

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Angiv miljønavn
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Konfigurer region (vælg baseret på modeltilgængelighed)
azd env set AZURE_LOCATION "eastus2"

# Aktivér alle valgfrie tjenester
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfigurer primær chatmodel (gpt-4.1 som den nærmeste tilgængelige til gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfigurer embeddingsmodel til forbedret søgning
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Angiv agentnavn (vil oprette den første agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Konfigurer søgeindeks
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

#### 5.6.2.3: Udrulningsscript

Create `deploy-retail.sh`:

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

# Kontroller kvote i den valgte region
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

# Udrul infrastruktur og applikation
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Indsaml udrulningsoutput
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Hent webappens URL
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

#### 5.6.2.4: Efter-udrulningskonfiguration

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Hent udrulningsoplysninger
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

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Kontroller, at miljøvariabler er indstillet
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Test webapplikationens tilgængelighed
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

# Kør evaluering, hvis det er konfigureret
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
      - Sporing og overvågning konfigureret

3. **Klar til tilpasning:**

      - Framework til at tilføje Loyalty-agent
      - Skabeloner til brugerdefinerede instruktioner
      - Test- og valideringsscripts
      - Opsætning til overvågning og evaluering

4. **Klar til produktion:**

      - Sikkerhedsscanning med red teaming
      - Ydelsesovervågning
      - Ramme for kvalitetsvurdering
      - Skalerbar arkitektur

Dette eksempel viser, hvordan AZD-skabelonen kan udvides og tilpasses specifikke enterprise-scenarier, samtidig med at bedste praksis for sikkerhed, overvågning og skalerbarhed opretholdes.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets modersmål bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->