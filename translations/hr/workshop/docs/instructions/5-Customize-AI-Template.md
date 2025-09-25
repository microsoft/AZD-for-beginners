<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "60caadc3b57dccb9e6c413b5ccace90b",
  "translation_date": "2025-09-25T02:22:57+00:00",
  "source_file": "workshop/docs/instructions/5-Customize-AI-Template.md",
  "language_code": "hr"
}
-->
# 5. Prilagodba predloška

!!! tip "NA KRAJU OVOG MODULA BIT ĆETE SPOSOBNI"

    - [ ] Istražiti zadane sposobnosti AI agenta
    - [ ] Dodati AI pretraživanje s vlastitim indeksom
    - [ ] Aktivirati i analizirati metrike praćenja
    - [ ] Izvršiti evaluacijsko testiranje
    - [ ] Izvršiti sigurnosno skeniranje (red-teaming)
    - [ ] **Laboratorij 5: Izraditi plan prilagodbe**

---

## 5.1 Sposobnosti AI agenta

!!! success "Ovo smo završili u Laboratoriju 01"

- **Pretraživanje datoteka**: Ugrađeno pretraživanje datoteka OpenAI-a za dohvat znanja
- **Citati**: Automatsko navođenje izvora u odgovorima
- **Prilagodljive upute**: Modifikacija ponašanja i osobnosti agenta
- **Integracija alata**: Proširiv sustav alata za prilagođene funkcionalnosti

---

## 5.2 Opcije dohvaćanja znanja

!!! task "Za dovršetak ovoga potrebno je napraviti promjene i ponovno implementirati"    
    
    ```bash title=""
    # Postavljanje varijabli okruženja
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Učitaj podatke i kreiraj moj indeks

    ```

---

**OpenAI pretraživanje datoteka (zadano):**

- Ugrađeno u Azure AI Agent uslugu
- Automatska obrada i indeksiranje dokumenata
- Nije potrebna dodatna konfiguracija

**Azure AI pretraživanje (opcionalno):**

- Hibridno semantičko i vektorsko pretraživanje
- Upravljanje prilagođenim indeksima
- Napredne mogućnosti pretraživanja
- Zahtijeva `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Praćenje i nadzor](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Za dovršetak ovoga potrebno je napraviti promjene i ponovno implementirati"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Praćenje:**

- Integracija s OpenTelemetry
- Praćenje zahtjeva i odgovora
- Metrike performansi
- Dostupno u AI Foundry portalu

**Logiranje:**

- Logovi aplikacije u Container Apps
- Strukturirano logiranje s ID-ovima za korelaciju
- Pregled logova u stvarnom vremenu i povijesnih logova

---

## 5.4 [Evaluacija agenta](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokalna evaluacija:**

- Ugrađeni evaluatori za procjenu kvalitete
- Prilagođeni evaluacijski skripti
- Benchmarking performansi

**Kontinuirani nadzor:**

- Automatska evaluacija interakcija uživo
- Praćenje metrika kvalitete
- Otkrivanje regresije performansi

**Integracija CI/CD:**

- GitHub Actions workflow
- Automatizirano testiranje i evaluacija
- Statističko usporedno testiranje

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatizirano sigurnosno skeniranje
- Procjena rizika za AI sustave
- Sigurnosna evaluacija u više kategorija

**Autentifikacija:**

- Upravljani identitet za Azure usluge
- Opcionalna autentifikacija putem Azure App Service
- Osnovna autentifikacija za razvojne svrhe

!!! quote "NA KRAJU OVOG LABORATORIJA TREBALI BISTE IMATI"
    - [ ] Definirane zahtjeve scenarija
    - [ ] Prilagođene varijable okruženja (konfiguracija)
    - [ ] Prilagođene upute za agenta (zadaci)
    - [ ] Implementiran prilagođeni predložak (aplikacija)
    - [ ] Dovršene zadatke nakon implementacije (ručno)
    - [ ] Provedeno testiranje evaluacije

Ovaj primjer pokazuje kako prilagoditi predložak za poslovni slučaj u maloprodaji s dva specijalizirana agenta i više modela implementacije.

---

## 5.6 Prilagodite ga za sebe!

### 5.6.1. Zahtjevi scenarija

#### **Implementacija agenata:** 

   - Agent za kupce: Pomaže korisnicima u pronalaženju i usporedbi proizvoda
   - Agent za lojalnost: Upravljanje nagradama i promocijama za korisnike

#### **Implementacija modela:**

   - `gpt-4.1`: Primarni model za razgovore
   - `o3`: Model za složene upite
   - `gpt-4.1-nano`: Lagani model za jednostavne interakcije
   - `text-embedding-3-large`: Visokokvalitetni vektori za pretraživanje

#### **Značajke:**

   - Omogućeno praćenje i nadzor
   - AI pretraživanje za katalog proizvoda
   - Okvir za evaluaciju kvalitete
   - Red-teaming za sigurnosnu provjeru

---

### 5.6.2 Implementacija scenarija

#### 5.6.2.1. Konfiguracija prije implementacije

Kreirajte skriptu za postavljanje (`setup-retail.sh`)

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

#### 5.6.2.2: Upute za agenta

Kreirajte `custom-agents/shopper-agent-instructions.md`:

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

Kreirajte `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Skripta za implementaciju

Kreirajte `deploy-retail.sh`:

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

#### 5.6.2.4: Konfiguracija nakon implementacije

Kreirajte `configure-retail-agents.sh`:

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

### 5.6.3: Testiranje i validacija

Kreirajte `test-retail-deployment.sh`:

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

### 5.6.4 Očekivani rezultati

Nakon što slijedite ovaj vodič za implementaciju, imat ćete:

1. **Implementiranu infrastrukturu:**

      - AI Foundry projekt s implementacijom modela
      - Container Apps koji hostiraju web aplikaciju
      - AI pretraživačku uslugu za katalog proizvoda
      - Application Insights za nadzor

2. **Početni agent:**

      - Agent za kupce konfiguriran s osnovnim uputama
      - Omogućena funkcionalnost pretraživanja datoteka
      - Konfigurirano praćenje i nadzor

3. **Spremno za prilagodbu:**

      - Okvir za dodavanje agenta za lojalnost
      - Predlošci za prilagođene upute
      - Skripti za testiranje i validaciju
      - Postavke za nadzor i evaluaciju

4. **Spremno za produkciju:**

      - Sigurnosno skeniranje s red-teamingom
      - Praćenje performansi
      - Okvir za evaluaciju kvalitete
      - Skalabilna arhitektura

Ovaj primjer pokazuje kako AZD predložak može biti proširen i prilagođen za specifične poslovne scenarije, uz održavanje najboljih praksi za sigurnost, nadzor i skalabilnost.

---

