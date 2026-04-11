# 5. Tilpass en mal

!!! tip "PÅ SLUTTEN AV DETTE MODULEN VIL DU KUNNE"

    - [ ] Utforsket standard AI-agentkapasiteter
    - [ ] Lagt til AI-søk med din egen indeks
    - [ ] Aktivert og analysert sporing-metrikker
    - [ ] Utført en evalueringskjøring
    - [ ] Utført en red-teaming-skanning
    - [ ] **Lab 5: Laget en tilpasningsplan**

---

## 5.1 AI-agentkapasiteter

!!! success "Vi fullførte dette i Lab 01"

- **Fil-søk**: OpenAIs innebygde fil-søk for kunnskapsinnhenting
- **Siteringer**: Automatisk kildeangivelse i svar
- **Tilpassbare instruksjoner**: Endre agentens oppførsel og personlighet
- **Verktøyintegrasjon**: Utvidbart verktøysystem for egne kapasiteter

---

## 5.2 Alternativer for kunnskapsinnhenting

!!! task "For å fullføre dette må vi gjøre endringer og deployere på nytt"    
    
    ```bash title=""
    # Sett miljøvariabler
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Last opp data og opprett min indeks

    ```

---

**OpenAI File Search (standard):**

- Innebygd i Foundry-agenter
- Automatisk dokumentprosessering og indeksering
- Ingen ekstra konfigurasjon nødvendig

**Azure AI Search (valgfritt):**

- Hybrid semantisk og vektorsøk
- Egendefinert indeksadministrasjon
- Avanserte søkefunksjoner
- Krever `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Sporing og overvåking](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "For å fullføre dette må vi gjøre endringer og deployere på nytt"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Sporing:**

- OpenTelemetry-integrasjon
- Sporing av forespørsler/svar
- Ytelsesmetrikker
- Tilgjengelig i Microsoft Foundry-portalen

**Logging:**

- Applikasjonslogger i Container Apps
- Strukturert logging med korrelasjons-IDer
- Sanntids- og historisk loggvisning

---

## 5.4 [Agentevaluering](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokal evaluering:**

- Innebygde evaluatorer for kvalitetsvurdering
- Egne evalueringsskript
- Ytelsesmåling

**Kontinuerlig overvåking:**

- Automatisk evaluering av live-interaksjoner
- Sporing av kvalitetsmetrikker
- Oppdagelse av ytelsesregresjoner

**CI/CD-integrasjon:**

- GitHub Actions workflow
- Automatisert testing og evaluering
- Statistisk sammenligningstesting

---

## 5.5 [AI Red Teaming-agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatisert sikkerhetsskanning
- Risikoanalyse for AI-systemer
- Sikkerhetsevaluering på tvers av flere kategorier

**Autentisering:**

- Administrert identitet for Azure-tjenester
- Valgfri autentisering via Azure App Service
- Basic auth som fallback under utvikling

!!! quote "PÅ SLUTTEN AV DENNE LABBEN BØR DU HA"
    - [ ] Definert dine scenario-krav
    - [ ] Tilpasset miljøvariabler (konfig)
    - [ ] Tilpasset agentinstruksjoner (oppgave)
    - [ ] Deployert den tilpassede malen (app)
    - [ ] Fullført oppgaver etter deployering (manuell)
    - [ ] Kjørt en test-evaluering

Dette eksemplet demonstrerer tilpasning av malen for en bedriftsløsning innen detaljhandel med to spesialiserte agenter og flere modell-distribusjoner.

---

## 5.6 Tilpass det for deg!

### 5.6.1 Scenario-krav

#### **Agentdistribusjoner:**

   - Shopper Agent: Hjelper kunder å finne og sammenligne produkter
   - Loyalty Agent: Håndterer kundelojalitet og kampanjer

#### **Modelldistribusjoner:**

   - `gpt-4.1`: Primær chatmodell
   - `o3`: Resonneringsmodell for komplekse spørsmål
   - `gpt-4.1-nano`: Lettvektsmodell for enkle interaksjoner
   - `text-embedding-3-large`: Høy-kvalitets embeddings for søk

#### **Funksjoner:**

   - Sporing og overvåking aktivert
   - AI Search for produktkatalog
   - Evalueringsrammeverk for kvalitetskontroll
   - Red teaming for sikkerhetsvalidering

---

### 5.6.2 Scenario-implementering


#### 5.6.2.1. Forhåndskonfigurasjon før deployering

Lag et oppsettskript (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Sett miljønavn
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Konfigurer region (velg basert på modelltilgjengelighet)
azd env set AZURE_LOCATION "eastus2"

# Aktiver alle valgfrie tjenester
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfigurer primær chatmodell (gpt-4.1 som nærmeste tilgjengelige til gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfigurer innebyggingsmodell for forbedret søk
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Sett agentnavn (vil opprette første agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Konfigurer søkeindeks
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agentinstruksjoner

Lag `custom-agents/shopper-agent-instructions.md`:

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

Lag `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Deployeringsskript

Lag `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Valider forutsetninger
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Konfigurer miljø
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Sjekk kvote i valgt region
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

# Distribuer infrastruktur og applikasjon
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Fang distribusjonsutdata
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Hent URL for nettappen
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

#### 5.6.2.4: Konfigurasjon etter deployering

Lag `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Hent distribusjonsinformasjon
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instruksjoner for manuell konfigurasjon
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

### 5.6.3: Testing og validering

Lag `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Verifiser at miljøvariabler er satt
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Test tilgjengeligheten til nettapplikasjonen
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

# Kjør evaluering dersom konfigurert
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

Etter å ha fulgt denne implementeringsveiledningen vil du ha:

1. **Deployert infrastruktur:**

      - Microsoft Foundry-prosjekt med modelldistribusjoner
      - Container Apps som hoster webapplikasjonen
      - AI Search-tjeneste for produktkatalog
      - Application Insights for overvåking

2. **Initial agent:**

      - Shopper Agent konfigurert med grunnleggende instruksjoner
      - Fil-søk aktivert
      - Sporing og overvåking konfigurert

3. **Klar for tilpasning:**

      - Rammeverk for å legge til Loyalty Agent
      - Maler for tilpassede instruksjoner
      - Tester- og valideringsskript
      - Oppsett for overvåking og evaluering

4. **Klar for produksjon:**

      - Sikkerhetsskanning med red teaming
      - Ytelsesovervåking
      - Evalueringsrammeverk for kvalitet
      - Skalerbar arkitektur

Dette eksemplet viser hvordan AZD-malen kan utvides og tilpasses spesifikke bedrifts-scenarier samtidig som beste praksis for sikkerhet, overvåking og skalerbarhet opprettholdes.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi etterstreber nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->