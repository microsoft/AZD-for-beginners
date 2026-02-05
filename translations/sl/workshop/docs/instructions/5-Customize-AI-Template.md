# 5. Prilagoditev predloge

!!! tip "DO KONCA TEGA MODULA BOSTE ZMOGLI"

    - [ ] Raziskali privzete zmožnosti AI agenta
    - [ ] Dodali AI iskanje z lastnim indeksom
    - [ ] Aktivirali in analizirali metrike sledenja
    - [ ] Izvedli evalvacijski preizkus
    - [ ] Izvedli varnostni pregled (red-teaming)
    - [ ] **Laboratorij 5: Izdelali načrt prilagoditve**

---

## 5.1 Zmožnosti AI agenta

!!! success "To smo zaključili v Laboratoriju 01"

- **Iskanje datotek**: Vgrajeno iskanje datotek OpenAI za pridobivanje znanja
- **Navedbe virov**: Samodejno pripisovanje virov v odgovorih
- **Prilagodljiva navodila**: Spreminjanje vedenja in osebnosti agenta
- **Integracija orodij**: Razširljiv sistem orodij za prilagojene zmožnosti

---

## 5.2 Možnosti pridobivanja znanja

!!! task "Za dokončanje tega moramo narediti spremembe in ponovno namestiti"    
    
    ```bash title=""
    # Nastavite okoljske spremenljivke
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Naložite podatke in ustvarite svoj indeks

    ```

---

**Privzeto iskanje datotek OpenAI:**

- Vgrajeno v storitev Azure AI Agent
- Samodejna obdelava in indeksiranje dokumentov
- Brez dodatne konfiguracije

**Azure AI Search (neobvezno):**

- Hibridno semantično in vektorsko iskanje
- Upravljanje prilagojenih indeksov
- Napredne zmožnosti iskanja
- Zahteva `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Sledenje in spremljanje](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Za dokončanje tega moramo narediti spremembe in ponovno namestiti"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Sledenje:**

- Integracija OpenTelemetry
- Sledenje zahtevkom in odgovorom
- Metrike zmogljivosti
- Na voljo v portalu AI Foundry

**Beleženje:**

- Dnevniški zapisi aplikacij v Container Apps
- Strukturirano beleženje z ID-ji za korelacijo
- Ogled dnevnikov v realnem času in zgodovinskih zapisov

---

## 5.4 [Evalvacija agenta](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokalna evalvacija:**

- Vgrajeni evalvatorji za oceno kakovosti
- Prilagojeni evalvacijski skripti
- Primerjava zmogljivosti

**Neprekinjeno spremljanje:**

- Samodejna evalvacija interakcij v živo
- Sledenje metrikam kakovosti
- Odkrivanje regresij zmogljivosti

**Integracija CI/CD:**

- Delovni tok GitHub Actions
- Samodejno testiranje in evalvacija
- Statistična primerjava testov

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Samodejno varnostno skeniranje
- Ocena tveganja za AI sisteme
- Varnostna evalvacija v več kategorijah

**Avtentikacija:**

- Upravljana identiteta za Azure storitve
- Neobvezna avtentikacija Azure App Service
- Osnovna avtentikacija za razvoj

!!! quote "DO KONCA TEGA LABORATORIJA BOSTE IMELI"
    - [ ] Določene zahteve scenarija
    - [ ] Prilagojene okoljske spremenljivke (konfiguracija)
    - [ ] Prilagojena navodila agenta (naloga)
    - [ ] Nameščeno prilagojeno predlogo (aplikacija)
    - [ ] Zaključene naloge po namestitvi (ročno)
    - [ ] Izveden test evalvacije

Ta primer prikazuje prilagoditev predloge za poslovni primer v maloprodaji z dvema specializiranima agentoma in več modeli.

---

## 5.6 Prilagodite za vas!

### 5.6.1 Zahteve scenarija

#### **Namestitve agentov:** 

   - Agent za nakupovalce: Pomaga strankam pri iskanju in primerjavi izdelkov
   - Agent za zvestobo: Upravljanje nagrad in promocij za stranke

#### **Namestitve modelov:**

   - `gpt-4.1`: Primarni model za klepet
   - `o3`: Model za razmišljanje pri kompleksnih vprašanjih
   - `gpt-4.1-nano`: Lahek model za enostavne interakcije
   - `text-embedding-3-large`: Visokokakovostni vektorji za iskanje

#### **Funkcije:**

   - Omogočeno sledenje in spremljanje
   - AI iskanje za katalog izdelkov
   - Evalvacijski okvir za zagotavljanje kakovosti
   - Red-teaming za varnostno preverjanje

---

### 5.6.2 Implementacija scenarija


#### 5.6.2.1 Prednamestitvena konfiguracija

Ustvarite skript za nastavitev (`setup-retail.sh`)

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

#### 5.6.2.2 Navodila za agente

Ustvarite `custom-agents/shopper-agent-instructions.md`:

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

Ustvarite `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3 Skript za namestitev

Ustvarite `deploy-retail.sh`:

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

#### 5.6.2.4 Konfiguracija po namestitvi

Ustvarite `configure-retail-agents.sh`:

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

### 5.6.3 Testiranje in validacija

Ustvarite `test-retail-deployment.sh`:

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

### 5.6.4 Pričakovani rezultati

Po upoštevanju tega vodnika za implementacijo boste imeli:

1. **Nameščeno infrastrukturo:**

      - Projekt AI Foundry z nameščenimi modeli
      - Container Apps za gostovanje spletne aplikacije
      - AI Search storitev za katalog izdelkov
      - Application Insights za spremljanje

2. **Začetni agent:**

      - Agent za nakupovalce konfiguriran z osnovnimi navodili
      - Omogočena funkcija iskanja datotek
      - Konfigurirano sledenje in spremljanje

3. **Pripravljeno za prilagoditev:**

      - Okvir za dodajanje agenta za zvestobo
      - Predloge za prilagojena navodila
      - Skripti za testiranje in validacijo
      - Nastavitev spremljanja in evalvacije

4. **Pripravljenost za produkcijo:**

      - Varnostno skeniranje z red-teamingom
      - Spremljanje zmogljivosti
      - Okvir za evalvacijo kakovosti
      - Razširljiva arhitektura

Ta primer prikazuje, kako je mogoče predlogo AZD razširiti in prilagoditi za specifične poslovne scenarije, hkrati pa ohranjati najboljše prakse za varnost, spremljanje in razširljivost.

---

