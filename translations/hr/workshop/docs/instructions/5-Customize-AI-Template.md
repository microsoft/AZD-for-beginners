# 5. Prilagodite predložak

!!! tip "NA KRAJU OVOG MODULA BIT ĆETE U MOGUĆNOSTI"

    - [ ] Istražene zadane sposobnosti AI agenta
    - [ ] Dodan AI pretraživanje s vlastitim indeksom
    - [ ] Aktivirani i analizirani Tracing metrički podaci
    - [ ] Izvršen evaluacijski tijek rada
    - [ ] Izvršen red-teaming skeniranje
    - [ ] **Laboratorij 5: Izgrađen plan prilagodbe** 

---

## 5.1 Sposobnosti AI agenta

!!! success "Ovo smo završili u Laboratoriju 01"

- **Pretraživanje datoteka**: Ugrađeno OpenAI pretraživanje datoteka za dohvat znanja
- **Citati**: Automatsko navođenje izvora u odgovorima
- **Prilagodive upute**: Modificirajte ponašanje i osobnost agenta
- **Integracija alata**: Proširivi sustav alata za prilagođene mogućnosti

---

## 5.2 Opcije dohvaćanja znanja

!!! task "Za dovršetak trebamo napraviti promjene i ponovno implementirati"    
    
    ```bash title=""
    # Postavi varijable okoline
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Učitaj podatke i kreiraj svoj indeks

    ```

---

**OpenAI pretraživanje datoteka (zadano):**

- Ugrađeno u Foundry Agente
- Automatska obrada i indeksiranje dokumenata
- Nije potrebna dodatna konfiguracija

**Azure AI pretraživanje (opcionalno):**

- Hibridno semantičko i vektorsko pretraživanje
- Upravljanje prilagođenim indeksima
- Napredne mogućnosti pretraživanja
- Zahtijeva `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Praćenje i nadzor](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Za dovršetak trebamo napraviti promjene i ponovno implementirati"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Praćenje:**

- Integracija OpenTelemetry
- Praćenje zahtjeva/odgovora
- Metrički podaci o izvedbi
- Dostupno u Microsoft Foundry portalu

**Zapisivanje:**

- Zapisi aplikacije u Container Apps
- Strukturirano zapisivanje sa korelacijskim ID-ovima
- Pregled zapisa u realnom vremenu i povijesno

---

## 5.4 [Evaluacija agenta](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokalna evaluacija:**

- Ugrađeni evaluatori za procjenu kvalitete
- Prilagođeni evaluacijski skripti
- Benchmarking izvedbe

**Kontinuirani nadzor:**

- Automatska evaluacija živih interakcija
- Praćenje metrika kvalitete
- Detekcija regresije u izvedbi

**Integracija CI/CD:**

- GitHub Actions tijek rada
- Automatizirano testiranje i evaluacija
- Statističko usporedno testiranje

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatizirano sigurnosno skeniranje
- Procjena rizika za AI sustave
- Sigurnosna evaluacija kroz više kategorija

**Autentikacija:**

- Upravljani identitet za Azure servise
- Opcionalna Azure App Service autentikacija
- Basic auth rezervna opcija za razvoj

!!! quote "NA KRAJU OVOG LABORATORIJA TREBALI BISTE IMATI"
    - [ ] Definirane zahtjeve vašeg scenarija
    - [ ] Prilagođene env varijable (konfiguracija)
    - [ ] Prilagođene upute za agenta (zadaci)
    - [ ] Implementiran prilagođeni predložak (aplikacija)
    - [ ] Dovršene aktivnosti nakon implementacije (ručno)
    - [ ] Pokrenutu test evaluaciju

Ovaj primjer demonstrira prilagodbu predloška za poslovni maloprodajni slučaj s dva specijalizirana agenta i višestrukim implementacijama modela.

---

## 5.6 Prilagodite ga za sebe!

### 5.6.1. Zahtjevi scenarija

#### **Implementacije agenata:** 

   - Shopper Agent: Pomaže kupcima pronaći i usporediti proizvode
   - Loyalty Agent: Upravljanje nagradama i promocijama za kupce

#### **Implementacije modela:**

   - `gpt-4.1`: Primarni model za chat
   - `o3`: Model rezoniranja za složene upite
   - `gpt-4.1-nano`: Lagan model za jednostavne interakcije
   - `text-embedding-3-large`: Kvalitetne ugradnje za pretraživanje

#### **Značajke:**

   - Omogućeno praćenje i nadzor
   - AI pretraživanje kataloga proizvoda
   - Okvir za evaluaciju kvalitete
   - Red teaming za sigurnosnu validaciju

---

### 5.6.2 Implementacija scenarija


#### 5.6.2.1. Konfiguracija prije implementacije

Napravite skriptu za postavljanje (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Postavi ime okruženja
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Konfiguriraj regiju (izaberi na temelju dostupnosti modela)
azd env set AZURE_LOCATION "eastus2"

# Omogući sve opcionalne usluge
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfiguriraj primarni chat model (gpt-4.1 kao najbliži dostupni model gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfiguriraj model za ugradnju za poboljšanu pretragu
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Postavi ime agenta (kreirat će prvog agenta)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Konfiguriraj indeks pretraživanja
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Upute za agente

Napravite `custom-agents/shopper-agent-instructions.md`:

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

Napravite `custom-agents/loyalty-agent-instructions.md`:

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

Napravite `deploy-retail.sh`:

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
echo "   - gpt-4.1: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# Postavi infrastrukturu i aplikaciju
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Zabilježi izlaze postave
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

Napravite `configure-retail-agents.sh`:

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

Napravite `test-retail-deployment.sh`:

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

# Pokrenite evaluaciju ako je konfigurirana
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

### 5.6.4 Očekivani rezultati

Nakon praćenja ovog vodiča za implementaciju, imat ćete:

1. **Implementiranu infrastrukturu:**

      - Microsoft Foundry projekt s implementacijama modela
      - Container Apps za hosting web aplikacije
      - AI Search servis za katalog proizvoda
      - Application Insights za nadzor

2. **Početnog agenta:**

      - Shopper Agent konfiguriran s osnovnim uputama
      - Omogućena mogućnost pretraživanja datoteka
      - Konfigurirano praćenje i nadzor

3. **Spremno za prilagodbu:**

      - Okvir za dodavanje Loyalty Agenta
      - Predlošci za prilagođene upute
      - Skripte za testiranje i validaciju
      - Postavke nadzora i evaluacije

4. **Spremnost za produkciju:**

      - Sigurnosno skeniranje s red teamingom
      - Praćenje izvedbe
      - Okvir za evaluaciju kvalitete
      - Skalabilna arhitektura

Ovaj primjer demonstrira kako se AZD predložak može proširiti i prilagoditi za specifične poslovne scenarije, uz održavanje najboljih praksi za sigurnost, nadzor i skalabilnost.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden korištenjem AI prevoditeljske usluge [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo biti točni, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazumevanja ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->