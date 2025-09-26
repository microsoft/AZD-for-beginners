<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "60caadc3b57dccb9e6c413b5ccace90b",
  "translation_date": "2025-09-24T22:43:32+00:00",
  "source_file": "workshop/docs/instructions/5-Customize-AI-Template.md",
  "language_code": "fi"
}
-->
# 5. Mukauta mallia

!!! tip "TÄMÄN OSION LOPUSSA OSAAAT"

    - [ ] Tutkia AI-agentin oletusominaisuuksia
    - [ ] Lisätä AI-haun omalla indeksilläsi
    - [ ] Aktivoida ja analysoida jäljityksen mittareita
    - [ ] Suorittaa arviointikierroksen
    - [ ] Suorittaa red-teaming-skannauksen
    - [ ] **Lab 5: Laatia mukauttamissuunnitelma** 

---

## 5.1 AI-agentin ominaisuudet

!!! success "Tämä tehtiin Lab 01:ssa"

- **Tiedostohaku**: OpenAI:n sisäänrakennettu tiedostohaku tiedon hakemiseen
- **Viittaukset**: Lähteiden automaattinen merkitseminen vastauksissa
- **Mukautettavat ohjeet**: Agentin käyttäytymisen ja persoonallisuuden muokkaaminen
- **Työkalujen integrointi**: Laajennettava työkalujärjestelmä mukautettaville ominaisuuksille

---

## 5.2 Tiedonhakuvaihtoehdot

!!! task "Tämän suorittamiseksi meidän täytyy tehdä muutoksia ja ottaa käyttöön uudelleen"    
    
    ```bash title=""
    # Aseta ympäristömuuttujat
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Lataa data ja luo oma indeksi

    ```

---

**OpenAI-tiedostohaku (oletus):**

- Sisäänrakennettu Azure AI Agent -palveluun
- Automaattinen dokumenttien käsittely ja indeksointi
- Ei vaadi lisäasetuksia

**Azure AI-haku (valinnainen):**

- Hybridi semanttinen ja vektorihaun yhdistelmä
- Mukautettu indeksinhallinta
- Edistyneet hakutoiminnot
- Vaatii `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Jäljitys ja seuranta](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Tämän suorittamiseksi meidän täytyy tehdä muutoksia ja ottaa käyttöön uudelleen"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Jäljitys:**

- OpenTelemetry-integraatio
- Pyyntöjen ja vastausten seuranta
- Suorituskykymittarit
- Saatavilla AI Foundry -portaalissa

**Lokit:**

- Sovelluslokit Container Apps -palvelussa
- Rakenteellinen lokitus korrelaatio-ID:illä
- Reaaliaikainen ja historiallinen lokien tarkastelu

---

## 5.4 [Agentin arviointi](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Paikallinen arviointi:**

- Sisäänrakennetut arviointityökalut laadun arviointiin
- Mukautetut arviointiskriptit
- Suorituskyvyn vertailu

**Jatkuva seuranta:**

- Automaattinen arviointi reaaliaikaisista vuorovaikutuksista
- Laatumittareiden seuranta
- Suorituskyvyn regressioiden havaitseminen

**CI/CD-integraatio:**

- GitHub Actions -työnkulku
- Automatisoitu testaus ja arviointi
- Tilastollinen vertailutestaus

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automaattinen tietoturvaskannaus
- Riskien arviointi AI-järjestelmille
- Turvallisuuden arviointi useissa kategorioissa

**Autentikointi:**

- Hallittu identiteetti Azure-palveluille
- Valinnainen Azure App Service -autentikointi
- Perusautentikointi kehitystä varten

!!! quote "TÄMÄN LABIN LOPUSSA SINUN TULISI OLLA"
    - [ ] Määritellyt skenaarion vaatimukset
    - [ ] Mukauttanut ympäristömuuttujat (konfiguraatio)
    - [ ] Mukauttanut agentin ohjeet (tehtävä)
    - [ ] Ottanut käyttöön mukautetun mallin (sovellus)
    - [ ] Suorittanut käyttöönoton jälkeiset tehtävät (manuaaliset)
    - [ ] Suorittanut testiarvioinnin

Tämä esimerkki näyttää, kuinka mukauttaa mallia yrityksen vähittäiskaupan käyttötapaukseen kahdella erikoistuneella agentilla ja useilla mallin käyttöönottoilla.

---

## 5.6 Mukauta se sinulle!

### 5.6.1. Skenaarion vaatimukset

#### **Agenttien käyttöönotot:** 

   - Shopper Agent: Auttaa asiakkaita löytämään ja vertailemaan tuotteita
   - Loyalty Agent: Hallinnoi asiakasetuja ja kampanjoita

#### **Mallin käyttöönotot:**

   - `gpt-4.1`: Ensisijainen keskustelumalli
   - `o3`: Päättelymalli monimutkaisille kyselyille
   - `gpt-4.1-nano`: Kevyt malli yksinkertaisille vuorovaikutuksille
   - `text-embedding-3-large`: Korkealaatuiset upotukset hakua varten

#### **Ominaisuudet:**

   - Jäljitys ja seuranta käytössä
   - AI-haku tuoteluetteloa varten
   - Arviointikehys laadun varmistamiseksi
   - Red-teaming tietoturvan validointiin

---

### 5.6.2 Skenaarion toteutus


#### 5.6.2.1. Ennen käyttöönottoa tehtävä konfiguraatio

Luo asennusskripti (`setup-retail.sh`)

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

#### 5.6.2.2: Agentin ohjeet

Luo `custom-agents/shopper-agent-instructions.md`:

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

Luo `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Käyttöönoton skripti

Luo `deploy-retail.sh`:

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

#### 5.6.2.4: Käyttöönoton jälkeinen konfiguraatio

Luo `configure-retail-agents.sh`:

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

### 5.6.3: Testaus ja validointi

Luo `test-retail-deployment.sh`:

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

### 5.6.4 Odotetut tulokset

Kun olet seurannut tätä toteutusohjetta, sinulla on:

1. **Käyttöönotettu infrastruktuuri:**

      - AI Foundry -projekti mallin käyttöönottoineen
      - Container Apps -sovellukset, jotka isännöivät verkkosovellusta
      - AI-hakupalvelu tuoteluetteloa varten
      - Application Insights -seuranta

2. **Alkuperäinen agentti:**

      - Shopper Agent perusohjeilla
      - Tiedostohakuominaisuus käytössä
      - Jäljitys ja seuranta konfiguroitu

3. **Valmis mukauttamiseen:**

      - Kehys Loyalty Agentin lisäämiseen
      - Mukautetut ohjepohjat
      - Testaus- ja validointiskriptit
      - Seuranta- ja arviointiasetukset

4. **Valmius tuotantoon:**

      - Tietoturvaskannaus red-teamingillä
      - Suorituskyvyn seuranta
      - Laadun arviointikehys
      - Skaalautuva arkkitehtuuri

Tämä esimerkki näyttää, kuinka AZD-mallia voidaan laajentaa ja mukauttaa erityisiin yritysskenaarioihin samalla, kun noudatetaan parhaita käytäntöjä tietoturvan, seurannan ja skaalautuvuuden osalta.

---

