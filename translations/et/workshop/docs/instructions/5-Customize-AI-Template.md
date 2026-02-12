# 5. Kohanda Malle

!!! tip "SELLE MÕÕDUKA LÕPUS ÕPITE"

    - [ ] Uuritud vaikimisi AI Agendi Võimekusi
    - [ ] Lisatud AI Otsing oma indeksi abil
    - [ ] Aktiveeritud ja analüüsitud jälgimise mõõdikuid
    - [ ] Läbitud hindamisjärg
    - [ ] Läbitud red-teami skaneerimine
    - [ ] **Lab 5: Ehitatud kohandamisplaan** 

---

## 5.1 AI Agendi Võimekused

!!! success "Selle tegime valmis Lab 01-s"

- **Faili otsing:** OpenAI sisseehitatud failiotsing teadmiste hankimiseks
- **Viited:** Automaatne allikaviitamine vastustes
- **Kohandatavad juhised:** Muutke agendi käitumist ja isikupära
- **Tööriistade integreerimine:** Laiendatav tööriistade süsteem kohandatud võimekuste jaoks

---

## 5.2 Teadmiste hankimise valikud

!!! task "Selle täitmiseks peame tegema muudatusi ja taasväljastama"    
    
    ```bash title=""
    # Määra keskkonnamuutujad
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Laadi andmed üles ja loo minu indeks

    ```

---

**OpenAI Failiotsing (Vaikimisi):**

- Sisseehitatud Foundry Agentidesse
- Automaatne dokumendi töötlemine ja indekseerimine
- Lisakonfiguratsiooni pole vaja

**Azure AI Otsing (Valikuline):**

- Hübriidsemantiline ja vektorotsing
- Kohandatud indeksi haldus
- Täiustatud otsinguvõimalused
- Vajab `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Jälgimine ja monitooring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Selle täitmiseks peame tegema muudatusi ja taasväljastama"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Jälgimine:**

- OpenTelemetry integreerimine
- Päringu/vastuse jälgimine
- Tulemuslikkuse mõõdikud
- Saadaval Microsoft Foundry portaalis

**Logimine:**

- Rakenduse logid Container Apps-is
- Struktureeritud logimine korrelatsioonituvastitega
- Reaalajas ja ajalooline logide vaatamine

---

## 5.4 [Agendi hindamine](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Kohalik hindamine:**

- Sisseehitatud hindajad kvaliteedi mõõtmiseks
- Kohandatavad hindamisskriptid
- Tulemuslikkuse võrdlustestid

**Jätkuv monitooring:**

- Automaatne elavate interaktsioonide hindamine
- Kvaliteedimõõdikute jälgimine
- Tulemuslikkuse regressiooni tuvastamine

**CI/CD integratsioon:**

- GitHub Actions töövoog
- Automatiseeritud testimine ja hindamine
- Statistiline võrdlustestimine

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatiseeritud turvaskaneerimine
- AI süsteemide riskihindamine
- Ohutuse hindamine mitmes kategoorias

**Autentimine:**

- Hallatav identiteet Azure teenuste jaoks
- Valikuline Azure App Service autentimine
- Põhiline autentimine arenduseks

!!! quote "SELLE LABI LÕPUS PEAKSID OLEMA"
    - [ ] Määratlenud oma stsenaariumi nõuded
    - [ ] Kohandanud keskkonnamuutujad (konfig)
    - [ ] Kohandanud agendi juhised (ülesanne)
    - [ ] Välja pannud kohandatud malli (rakendus)
    - [ ] Täitnud järeltöötlusülesanded (käsitsi)
    - [ ] Käivitanud testhindamise

See näide demonstreerib malli kohandamist ettevõtte jaekaubanduse kasutusjuhtumiks kahe spetsialiseeritud agendi ja mitme mudeli juurutusega.

---

## 5.6 Kohanda seda enda jaoks!

### 5.6.1 Stsenaariumi nõuded

#### **Agendi juurutused:** 

   - Ostja Agent: Aitab klientidel tooteid leida ja võrrelda
   - Lojaalsus Agent: Haldb klientide preemiaid ja kampaaniaid

#### **Mudeli juurutused:**

   - `gpt-4.1`: Primaarsed vestluse mudel
   - `o3`: Loogikamudel keerukate päringute jaoks
   - `gpt-4.1-nano`: Kerge mudel lihtsate interaktsioonide jaoks
   - `text-embedding-3-large`: Kõrgekvaliteedilised upitused otsinguks

#### **Funktsioonid:**

   - Jälgimine ja monitooring lubatud
   - AI Otsing tootekataloogi jaoks
   - Hindamisraamistik kvaliteedi tagamiseks
   - Red teaming turvakontrolliks

---

### 5.6.2 Stsenaariumi realiseerimine


#### 5.6.2.1 Juht seadistus enne juurutust

Loo seadistus skript (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Määra keskkonna nimi
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Sea regioon (vali mudeli kättesaadavuse alusel)
azd env set AZURE_LOCATION "eastus2"

# Luba kõik valikulised teenused
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Sea põhivestluse mudel (gpt-4o kui gpt-4.1-lähedane saadaval olev mudel)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Sea manustamise mudel täiustatud otsingu jaoks
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Määra agendi nimi (loob esimese agendi)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Sea otsingu indeks
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agendi juhised

Loo `custom-agents/shopper-agent-instructions.md`:

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

Loo `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Juurutusskript

Loo `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Kontrolli tingimuste täitmist
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Keskkonna seadistamine
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Kontrolli kvota valitud piirkonnas
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

# Infrastruktuuri ja rakenduse juurutamine
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Juurutamise väljundite kogumine
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Hangi veebiäpi URL
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

#### 5.6.2.4: Järeltöötlus seadistus

Loo `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Hankige juurutusteave
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Juhised käsitsi konfigureerimiseks
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

### 5.6.3: Testimine ja valideerimine

Loo `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Kontrolli, et keskkonnamuutujad oleksid määratud
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Testi veebirakenduse saadavust
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

# Käivita hindamine, kui see on seadistatud
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

### 5.6.4 Oodatavad tulemused

Pärast selle juhendi järgimist on sul olemas:

1. **Juurutatud infrastruktuur:**

      - Microsoft Foundry projekt mudeli juurutustega
      - Container Apps, mis majutavad veebirakendust
      - AI Otsingu teenus tootekataloogi jaoks
      - Application Insights monitoorimiseks

2. **Esialgne agent:**

      - Ostja agent seadistatud baaspõhiste juhistega
      - Failiotsing lubatud
      - Jälgimise ja monitooringu seadistus

3. **Valmis kohandamiseks:**

      - Raamistik Lojaalsus Agendi lisamiseks
      - Kohandatud juhendite mallid
      - Testimise ja valideerimise skriptid
      - Monitooringu ja hindamise seadistus

4. **Tootmise valmidus:**

      - Turvaskaneerimine red teaminguga
      - Tulemuslikkuse jälgimine
      - Kvaliteedi hindamise raamistik
      - Schaaleeritav arhitektuur

See näide demonstreerib, kuidas AZD malli saab laiendada ja kohandada konkreetseteks ettevõtte stsenaariumiteks, säilitades parimad tavad turvalisuse, jälgimise ja skaleeritavuse jaoks.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palun pange tähele, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma emakeeles tuleks lugeda autoriteetseks allikaks. Olulise teabe puhul on soovitatav kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või väär-tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->