# 5. Prilagodite Predložak

!!! tip "NA KRAJU OVOG MODULA BIT ĆETE U MOGUĆNOSTI"

    - [ ] Istražene zadane mogućnosti AI agenta
    - [ ] Dodan AI Search s vašim vlastitim indeksom
    - [ ] Aktivirane i analizirane Tracing metrike
    - [ ] Izvršeno evaluacijsko izvođenje
    - [ ] Izvršeno red-teaming skeniranje
    - [ ] **Laboratorij 5: Izgrađen plan prilagodbe** 

---

## 5.1 Mogućnosti AI agenta

!!! success "Ovo smo završili u Laboratoriju 01"

- **Pretraživanje datoteka**: OpenAI ugrađeno pretraživanje datoteka za dohvat znanja
- **Citati**: Automatsko navođenje izvora u odgovorima
- **Prilagodljive upute**: Mijenjanje ponašanja i osobnosti agenta
- **Integracija alata**: Proširivi sustav alata za prilagođene mogućnosti

---

## 5.2 Opcije za dohvat znanja

!!! task "Za dovršetak trebamo napraviti promjene i ponovo implementirati"    
    
    ```bash title=""
    # Postavi varijable okoline
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Učitaj podatke i kreiraj moj indeks

    ```

---

**OpenAI Pretraživanje datoteka (zadano):**

- Ugrađeno u Foundry agente
- Automatska obrada i indeksiranje dokumenata
- Nije potrebna dodatna konfiguracija

**Azure AI Search (opcionalno):**

- Hibridno semantičko i vektorsko pretraživanje
- Upravljanje prilagođenim indeksima
- Napredne mogućnosti pretraživanja
- Zahtijeva `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Praćenje i nadzor](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Za dovršetak trebamo napraviti promjene i ponovo implementirati"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- Integracija OpenTelemetrya
- Praćenje zahtjeva/odgovora
- Metrike performansi
- Dostupno u Microsoft Foundry portalu

**Logiranje:**

- Dnevnici aplikacije u Container Apps
- Strukturirano logiranje s ID-evima korelacije
- Pregled logova u stvarnom vremenu i povijesno

---

## 5.4 [Evaluacija agenta](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokalna evaluacija:**

- Ugrađeni evaluatori za procjenu kvalitete
- Prilagođeni evaluacijski skripti
- Benchmarking performansi

**Kontinuirani nadzor:**

- Automatska evaluacija živih interakcija
- Praćenje kvalitetnih metrika
- Detekcija regresije u performansama

**Integracija CI/CD:**

- GitHub Actions radni tijek
- Automatsko testiranje i evaluacija
- Statističko usporedno testiranje

---

## 5.5 [AI Red Teaming agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatizirano sigurnosno skeniranje
- Procjena rizika za AI sustave
- Sigurnosna evaluacija kroz više kategorija

**Autentikacija:**

- Managed Identity za Azure usluge
- Opcionalna autentikacija Azure App Service
- Povratak na osnovnu autentikaciju za razvoj



!!! quote "NA KRAJU OVOG LABORATORIJA TREBALI BISTE IMATI"
    - [ ] Definirane zahtjeve scenarija
    - [ ] Prilagođene varijable okoline (config)
    - [ ] Prilagođene upute agenta (task)
    - [ ] Implementiran prilagođeni predložak (app)
    - [ ] Završene zadatke nakon implementacije (manual)
    - [ ] Pokrenutu testnu evaluaciju

Ovaj primjer pokazuje prilagodbu predloška za korporativni maloprodajni slučaj s dva specijalizirana agenta i više implementacija modela.

---

## 5.6 Prilagodite ga za sebe!

### 5.6.1 Zahtjevi scenarija

#### **Implementacije agenata:** 

   - Shopper Agent: Pomaže kupcima pronaći i usporediti proizvode
   - Loyalty Agent: Upravljanje korisničkim nagradama i promocijama

#### **Implementacije modela:**

   - `gpt-4.1`: Primarni chat model
   - `o3`: Model zaključivanja za složene upite
   - `gpt-4.1-nano`: Lagani model za jednostavne interakcije
   - `text-embedding-3-large`: Vrhunske ugradnje za pretraživanje

#### **Značajke:**

   - Omogućeno praćenje i nadzor
   - AI Search za katalog proizvoda
   - Okvir za evaluaciju osiguravanja kvalitete
   - Red teaming za sigurnosnu validaciju

---

### 5.6.2 Implementacija scenarija


#### 5.6.2.1. Konfiguracija prije implementacije

Kreirajte skriptu za postavljanje (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Postavi ime okoline
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Konfiguriraj regiju (izaberi prema dostupnosti modela)
azd env set AZURE_LOCATION "eastus2"

# Omogući sve opcionalne usluge
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfiguriraj primarni chat model (gpt-4o kao najbliži dostupni model gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfiguriraj model ugradnje za poboljšano pretraživanje
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Postavi ime agenta (stvorit će prvog agenta)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Konfiguriraj indeks pretraživanja
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Upute za agente

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

# Provjeri preduvjete
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Postavi okruženje
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Provjeri kvotu u odabranoj regiji
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

# Implementiraj infrastrukturu i aplikaciju
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Zabilježi rezultate implementacije
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Dohvati URL web aplikacije
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

#### 5.6.2.4: Konfiguracija nakon implementacije

Kreirajte `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Dohvati informacije o implementaciji
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Upute za ručnu konfiguraciju
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

### 5.6.3: Testiranje i validacija

Kreirajte `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Provjerite jesu li varijable okoline postavljene
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Testirajte dostupnost web aplikacije
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

# Pokrenite procjenu ako je konfigurirana
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

### 5.6.4 Očekivani ishodi

Nakon što slijedite ovaj vodič za implementaciju, imat ćete:

1. **Implementiranu infrastrukturu:**

      - Microsoft Foundry projekt s implementacijama modela
      - Container Apps koji hostaju web aplikaciju
      - AI Search servis za katalog proizvoda
      - Application Insights za nadzor

2. **Početnog agenta:**

      - Shopper Agent konfiguriran s osnovnim uputama
      - Omogućena funkcija pretraživanja datoteka
      - Konfigurirano praćenje i nadzor

3. **Spremno za prilagodbu:**

      - Okvir za dodavanje Loyalty Agenta
      - Prilagođeni predlošci uputa
      - Skripte za testiranje i validaciju
      - Postavke nadzora i evaluacije

4. **Spremnost za produkciju:**

      - Sigurnosno skeniranje uz red teaming
      - Praćenje performansi
      - Okvir za evaluaciju kvalitete
      - Skalabilna arhitektura

Ovaj primjer pokazuje kako se AZD predložak može proširiti i prilagoditi za specifične korporativne scenarije uz održavanje najboljih praksi za sigurnost, nadzor i skalabilnost.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj je dokument preveden korištenjem AI usluge za prijevod [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatizirani prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati službenim i autoritativnim izvorom. Za važne informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili kriva tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->