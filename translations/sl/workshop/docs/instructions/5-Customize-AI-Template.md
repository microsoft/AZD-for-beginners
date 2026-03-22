# 5. Prilagodite predlogo

!!! tip "NA KONCU TEGA MODULA BOSTE ZMOGLI"

    - [ ] Raziskali privzete zmogljivosti AI agenta
    - [ ] Dodali AI Search z vašim indeksom
    - [ ] Aktivirali in analizirali metrike sledenja
    - [ ] Izvedli zagon ocenjevanja
    - [ ] Izvedli red-teaming pregled
    - [ ] **Laboratorij 5: Sestavili načrt prilagoditve** 

---

## 5.1 Zmogljivosti AI agenta

!!! success "To smo zaključili v laboratoriju 01"

- **Iskanje datotek**: OpenAI vgrajeno iskanje datotek za pridobivanje znanja
- **Citiranje**: Samodejna navedba virov v odgovorih
- **Prilagodljiva navodila**: Spreminjanje vedenja in osebnosti agenta
- **Integracija orodij**: Razširljiv sistem orodij za prilagojene zmožnosti

---

## 5.2 Možnosti pridobivanja znanja

!!! task "Za dokončanje tega moramo narediti spremembe in ponovno razmestiti"    
    
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

**Iskanje datotek OpenAI (privzeto):**

- Vgrajeno v Foundry agentih
- Samodejna obdelava dokumentov in indeksiranje
- Ni potrebna dodatna konfiguracija

**Azure AI Search (neobvezno):**

- Hibridno semantično in vektorsko iskanje
- Upravljanje lastnih indeksov
- Napredne funkcije iskanja
- Zahteva `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Sledenje in nadzor](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Za dokončanje tega moramo narediti spremembe in ponovno razmestiti"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Sledenje:**

- Integracija OpenTelemetry
- Sledenje zahtevam/odgovorom
- Metrike zmogljivosti
- Na voljo v portalu Microsoft Foundry

**Dnevniško beleženje:**

- Dnevniki aplikacij v Container Apps
- Strukturirano beleženje z identifikatorji korelacije
- Ogled dnevnikov v realnem času in zgodovinskih

---

## 5.4 [Ocenjevanje agentov](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokalno ocenjevanje:**

- Vgrajeni ocenjevalniki za oceno kakovosti
- Prilagojeni skripti za ocenjevanje
- Primerjalno merjenje zmogljivosti

**Neprekinjeno spremljanje:**

- Samodejno ocenjevanje živih interakcij
- Sledenje metrikam kakovosti
- Zaznavanje regresij zmogljivosti

**Integracija CI/CD:**

- Delovni tok GitHub Actions
- Avtomatizirano testiranje in ocenjevanje
- Statistično primerjalno testiranje

---

## 5.5 [Agent za red-teaming AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI red-teamiranje:**

- Avtomatizirano varnostno skeniranje
- Ocenjevanje tveganj za AI sisteme
- Varnostno ocenjevanje v več kategorijah

**Avtentikacija:**

- Upravljana identiteta za storitve Azure
- Izbirna avtentikacija Azure App Service
- Nadomestna osnovna avtentikacija za razvoj



!!! quote "NA KONCU TEGA LABORATORIJA BI MORALI IMETI"
    - [ ] Opredelite zahteve vašega scenarija
    - [ ] Prilagodili spremenljivke okolja (konfiguracija)
    - [ ] Prilagodili navodila agentu (naloga)
    - [ ] Razmestili prilagojeno predlogo (aplikacija)
    - [ ] Izpolnili naloge po razmestitvi (ročni)
    - [ ] Zagnali preskusno ocenjevanje

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Prilagodite jo za vas!

### 5.6.1. Zahteve scenarija

#### **Namestitve agentov:** 

   - Agent za kupce: Pomoč strankam pri iskanju in primerjanju izdelkov
   - Agent za zvestobo: Upravljanje nagrad in promocij za stranke

#### **Namestitve modelov:**

   - `gpt-4.1`: Primarni klepetalni model
   - `o3`: Model za sklepanje pri zapletenih poizvedbah
   - `gpt-4.1-nano`: Lahki model za preproste interakcije
   - `text-embedding-3-large`: Visokokakovostne vdelave za iskanje

#### **Funkcije:**

   - Omogočeno sledenje in nadzor
   - AI Search za katalog izdelkov
   - Okvir ocenjevanja za zagotavljanje kakovosti
   - Red teaming za preverjanje varnosti

---

### 5.6.2 Izvedba scenarija


#### 5.6.2.1. Konfiguracija pred razmestitvijo

Ustvarite skript za namestitev (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Nastavi ime okolja
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Konfiguriraj regijo (izberi glede na razpoložljivost modela)
azd env set AZURE_LOCATION "eastus2"

# Omogoči vse izbirne storitve
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfiguriraj primarni klepetalni model (gpt-4.1 kot najbližji razpoložljivi gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfiguriraj model vdelav za izboljšano iskanje
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Nastavi ime agenta (to bo ustvarilo prvega agenta)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Konfiguriraj indeks iskanja
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Navodila za agente

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

#### 5.6.2.3: Skript za razmestitev

Ustvarite `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Preveri predpogoje
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Nastavi okolje
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Preveri kvoto v izbrani regiji
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

# Namesti infrastrukturo in aplikacijo
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Zajemi izhode razmestitve
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Pridobi URL spletne aplikacije
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

#### 5.6.2.4: Konfiguracija po razmestitvi

Ustvarite `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Pridobite informacije o uvajanju
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Navodila za ročno konfiguracijo
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

### 5.6.3: Testiranje in preverjanje

Ustvarite `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Preveri, ali so nastavljene spremenljivke okolja
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Preizkusi razpoložljivost spletne aplikacije
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

# Zaženi ocenjevanje, če je konfigurirano
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

### 5.6.4 Pričakovani rezultati

Po upoštevanju tega vodnika za izvedbo boste imeli:

1. **Razmeščena infrastruktura:**

      - Microsoft Foundry projekt z namestitvami modelov
      - Container Apps, ki gostijo spletno aplikacijo
      - Storitev AI Search za katalog izdelkov
      - Application Insights za spremljanje

2. **Začetni agent:**

      - Agent za kupce konfiguriran z osnovnimi navodili
      - Omogočena sposobnost iskanja po datotekah
      - Sledenje in nadzor konfigurirana

3. **Pripravljen za prilagoditev:**

      - Okvir za dodajanje agenta za zvestobo
      - Predloge prilagojenih navodil
      - Skripte za testiranje in preverjanje
      - Nastavitve za spremljanje in ocenjevanje

4. **Pripravljenost za produkcijo:**

      - Varnostno skeniranje z red-teamom
      - Spremljanje zmogljivosti
      - Okvir za ocenjevanje kakovosti
      - Skalabilna arhitektura

Ta primer prikazuje, kako je mogoče predlogo AZD razširiti in prilagoditi za specifične podjetniške scenarije, ob tem pa ohraniti najboljše prakse za varnost, spremljanje in skalabilnost.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokoven človeški prevod. Za morebitne nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda, ne odgovarjamo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->