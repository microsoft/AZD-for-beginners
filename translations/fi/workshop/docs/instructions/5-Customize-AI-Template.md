# 5. Customize a Template

!!! tip "OPPIMISJAKSON PÄÄTTYESSÄ OSAAT"
    
    - [ ] Tutkinut oletusarvoiset AI-agenttien ominaisuudet
    - [ ] Lisännyt AI-haun omalla indeksilläsi
    - [ ] Aktivoinut ja analysoinut jäljitysmittareita
    - [ ] Suorittanut arviointiajon
    - [ ] Suorittanut red-teaming -skannauksen
    - [ ] **Lab 5: Rakensi mukautussuunnitelman** 

---

## 5.1 AI Agent Capabilities

!!! success "Suoritettiin tämä Lab 01:ssä"

- **File Search**: OpenAI:n sisäänrakennettu tiedostohaku tiedon noutamiseen
- **Citations**: Automaattinen lähdeviitteiden lisääminen vastauksiin
- **Customizable Instructions**: Agentin käyttäytymisen ja persoonallisuuden muokkaus
- **Tool Integration**: Laajennettava työkalujärjestelmä mukautettuja toiminnallisuuksia varten

---

## 5.2 Knowledge Retrieval Options

!!! task "Tämän suorittamiseksi meidän täytyy tehdä muutoksia ja ottaa uudelleen käyttöön"    
    
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

**OpenAI File Search (Default):**

- Sisäänrakennettu Foundry-agentteihin
- Automaattinen asiakirjojen käsittely ja indeksointi
- Ei lisäkonfiguraatiota vaadittu

**Azure AI Search (Optional):**

- Hybridinen semanttinen ja vektorihaut
- Mukautetun indeksin hallinta
- Edistyneet hakutoiminnot
- Vaatii `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Tämän suorittamiseksi meidän täytyy tehdä muutoksia ja ottaa uudelleen käyttöön"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry-integraatio
- Pyyntö-/vastausseuranta
- Suorituskykymittarit
- Saatavilla Microsoft Foundry -portaalissa

**Logging:**

- Sovelluksen lokit Container Appsissa
- Rakenteellinen lokitus korrelaatio-ID:illä
- Reaaliaikainen ja historiallinen lokien tarkastelu

---

## 5.4 [Agent Evaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Local Evaluation:**

- Sisäänrakennetut arvioijat laadun arviointiin
- Mukautetut arviointiskriptit
- Suorituskyvyn vertailumittaukset

**Continuous Monitoring:**

- Automaattinen live-interaktioiden arviointi
- Laatumittareiden seuranta
- Suorituskyvyn regressioiden tunnistus

**CI/CD Integration:**

- GitHub Actions -työnkulku
- Automaattinen testaus ja arviointi
- Tilastollinen vertailutestaus

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automaattinen turvallisuusskannaus
- Riskien arviointi AI-järjestelmille
- Turvallisuusarviointi useissa kategorioissa

**Authentication:**

- Managed Identity Azure-palveluille
- Valinnainen Azure App Service -todennus
- Basic auth -varapalautus kehitystä varten



!!! quote "TÄMÄN LABIN PÄÄTTYESSÄ SINUN TULISI OLLA"
    - [ ] Määritellyt skenaariosi vaatimukset
    - [ ] Mukauttanut ympäristömuuttujia (config)
    - [ ] Mukauttanut agentin ohjeita (task)
    - [ ] Ottanut mukautetun mallin käyttöön (app)
    - [ ] Suorittanut käyttöönoton jälkeiset tehtävät (manuaalinen)
    - [ ] Suorittanut testiarvioinnin

Tässä esimerkissä näytetään, miten mallia voi mukauttaa yritystason vähittäiskaupan käyttötapaukseen, jossa on kaksi erikoistunutta agenttia ja useita mallien käyttöönottoja.

---

## 5.6 Customize It For You!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: Auttaa asiakkaita tuotteiden etsimisessä ja vertailussa
   - Loyalty Agent: Hallinnoi asiakasetuja ja kampanjoita

#### **Model Deployments:**

   - `gpt-4.1`: Ensisijainen keskustelumalli
   - `o3`: Päättelymalli monimutkaisiin kyselyihin
   - `gpt-4.1-nano`: Kevyt malli yksinkertaisiin vuorovaikutuksiin
   - `text-embedding-3-large`: Korkealaatuiset upotukset hakuun

#### **Features:**

   - Jäljitys ja valvonta otettu käyttöön
   - AI-haku tuoteluetteloa varten
   - Arviointikehys laadunvarmistukseen
   - Red teaming turvallisuuden varmistamiseen

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Aseta ympäristön nimi
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Määritä alue (valitse mallin saatavuuden mukaan)
azd env set AZURE_LOCATION "eastus2"

# Ota käyttöön kaikki valinnaiset palvelut
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Määritä ensisijainen chat-malli (gpt-4.1, lähin saatavilla oleva vaihtoehto gpt-4.1:lle)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Määritä upotusmalli parannettua hakua varten
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Aseta agentin nimi (luo ensimmäinen agentti)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Määritä hakuindeksi
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agent Instructions

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

#### 5.6.2.3: Deployment Script

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Vahvista esivaatimukset
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Valmistele ympäristö
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Tarkista kiintiö valitussa alueessa
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

# Ota infrastruktuuri ja sovellus käyttöön
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Tallenna käyttöönoton tulosteet
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Hae verkkosovelluksen URL-osoite
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

#### 5.6.2.4: Post-Deployment Config

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Hae käyttöönoton tiedot
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Ohjeet manuaaliseen määritykseen
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

### 5.6.3: Testing and Validation

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Varmista, että ympäristömuuttujat on asetettu
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Testaa verkkosovelluksen saatavuus
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

# Suorita arviointi, jos se on konfiguroitu
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

### 5.6.4 Expected Outcomes

After following this implementation guide, you will have:

1. **Deployed Infrastructure:**

      - Microsoft Foundry -projekti mallien käyttöönotoilla
      - Container Apps -sovellus isännöimässä web-sovellusta
      - AI Search -palvelu tuoteluettelolle
      - Application Insights valvontaa varten

2. **Initial Agent:**

      - Shopper Agent konfiguroitu perusohjeilla
      - Tiedostohaku-ominaisuus käytössä
      - Jäljitys ja valvonta konfiguroitu

3. **Ready for Customization:**

      - Kehys Loyalty Agentin lisäämiseen
      - Mukautetut ohjemallit
      - Testaus- ja validointiskriptit
      - Valvonta- ja arviointiasetukset

4. **Production Readiness:**

      - Turvallisuusskannaus red teamingilla
      - Suorituskyvyn seuranta
      - Laadunarviointikehys
      - Laajennettava arkkitehtuuri

Tässä esimerkissä havainnollistetaan, miten AZD-mallia voidaan laajentaa ja mukauttaa tiettyihin yritysskenaarioihin säilyttäen parhaat käytännöt turvallisuuden, valvonnan ja skaalautuvuuden osalta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää määräävänä lähteenä. Kriittisten tietojen kohdalla suositellaan ammattimaista ihmiskääntäjän tekemää käännöstä. Emme vastaa tämän käännöksen käytöstä johtuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->