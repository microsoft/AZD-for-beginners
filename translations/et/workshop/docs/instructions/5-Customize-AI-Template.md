# 5. Kohanda malli

!!! tip "SELLE MUIDUVALDUSE LÕPUS SUUDAD SA"

    - [ ] Avastada vaikimisi AI-agendi võimekused
    - [ ] Lisada AI-otsing oma indeksi abil
    - [ ] Aktiveerida ja analüüsida jälgimismõõdikuid
    - [ ] Teostada hindamisjooks
    - [ ] Teostada red-teaming skann
    - [ ] **Labor 5: Koostada kohandamiskava** 

---

## 5.1 AI-agendi võimekused

!!! success "Seda tegime Labor 01-s"

- **Failiotsing**: OpenAI sisseehitatud failiotsing teadmiste hankimiseks
- **Viited**: Automaatne allikaviitamine vastustes
- **Kohandatavad juhised**: Agendi käitumise ja isiksuse muutmine
- **Tööriistade integreerimine**: Laiendatav tööriistasüsteem kohandatud võimekuste jaoks

---

## 5.2 Teadmiste hankimise võimalused

!!! task "Selle lõpetamiseks tuleb teha muudatusi ja uuesti juurutada"    
    
    ```bash title=""
    # Keskkonnamuutujate seadistamine
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Andmete üleslaadimine ja indeksi loomine

    ```

---

**OpenAI failiotsing (vaikeväärtus):**

- Sisseehitatud Foundry agentidesse
- Automaatne dokumendi töötlemine ja indekseerimine
- Täiendavat konfiguratsiooni ei nõuta

**Azure AI otsing (valikuline):**

- Hübriidne semantiline ja vektorotsing
- Kohandatud indeksi haldus
- Täiustatud otsinguvõimalused
- Nõuab `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Jälgimine ja monitooring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Selle lõpetamiseks tuleb teha muudatusi ja uuesti juurutada"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Jälgimine:**

- OpenTelemetry integratsioon
- Päringu/vastuse jälgimine
- Töökindluse mõõdikud
- Saadaval Microsoft Foundry portaalis

**Logimine:**

- Rakenduse logid Container Appsis
- Struktureeritud logimine koostoime ID-dega
- Reaalaja ja ajalooliste logide vaade

---

## 5.4 [Agendi hindamine](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Kohalik hindamine:**

- Sisseehitatud hinnangu andjad kvaliteedi hindamiseks
- Kohandatud hindamisskriptid
- Töökindluse võrreldavus

**Pidev jälgimine:**

- Automaatne elava suhtluse hindamine
- Kvaliteedimõõdikute jälgimine
- Jõudluse regressiooni tuvastamine

**CI/CD integratsioon:**

- GitHub Actions töövoog
- Automaatne testimine ja hindamine
- Statistiline võrdlev testimine

---

## 5.5 [AI red-teaming agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI red-teaming:**

- Automaatne turvakontroll
- AI süsteemide riskihinnang
- Ohutuse hindamine mitmetes kategooriates

**Autentimine:**

- Hallatud identiteet Azure teenuste jaoks
- Valikuline Azure App Service autentimine
- Põhiline auth arenguks

!!! quote "SEDE LÕPP LABORIL PEAKSID SA OLEMA"
    - [ ] Määratlenud oma stsenaariumi nõuded
    - [ ] Kohandanud keskkonnamuutujad (config)
    - [ ] Kohandanud agentide juhised (task)
    - [ ] Juurutanud kohandatud malli (app)
    - [ ] Läbinud post-juurutamise toimingud (käsitsi)
    - [ ] Teostanud hindamistesti

See näide demonstreerib malli kohandamist suurettevõtte jaekaubanduse kasutusjuhtumi jaoks kahe spetsialiseeritud agendiga ja mitme mudelijuurutusega.

---

## 5.6 Kohanda seda enda jaoks!

### 5.6.1. Stsenaariumi nõuded

#### **Agendi juurutused:** 

   - Ostja agent: aitab klientidel tooteid leida ja võrrelda
   - Lojaalsusagent: haldab klientide preemiaid ja kampaaniaid

#### **Mudeli juurutused:**

   - `gpt-4.1`: Peamine vestlusmudel
   - `o3`: Põhjendamise mudel keerukate päringute jaoks
   - `gpt-4.1-nano`: Kergem moodul lihtsate suhtluste jaoks
   - `text-embedding-3-large`: Kõrgekvaliteedilised embedid otsinguks

#### **Funktsioonid:**

   - Jälgimine ja monitooring lubatud
   - AI otsing tootekataloogile
   - Hindamisraamistik kvaliteedikontrolliks
   - Red-teaming turvakontrolliks

---

### 5.6.2 Stsenaariumi rakendamine


#### 5.6.2.1. Eeljuurutuskonfiguratsioon

Loo seadistusskript (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Määra keskkonna nimi
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Sea piirkond (vali vastavalt mudeli kättesaadavusele)
azd env set AZURE_LOCATION "eastus2"

# Luba kõik valikulised teenused
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfigureeri peamine vestlusmudel (gpt-4.1 kui lähim saadaval olev gpt-4.1-le)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfigureeri manustamismudel täiustatud otsingu jaoks
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Määra agendi nimi (loodakse esimene agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Konfigureeri otsinguindeks
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

# Kontrolli eeltingimuste olemasolu
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

# Kontrolli kvooti valitud piirkonnas
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

# Infrastruktuuri ja rakenduse juurutamine
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Juurutuse väljundite salvestamine
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Saa veebirakenduse URL
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

#### 5.6.2.4: Post-juurutuskonfiguratsioon

Loo `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Hangi juurutusteavet
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

# Kontrolli, kas keskkonnamuutujad on määratud
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Testi veebi rakenduse saadavust
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

# Käivita hindamine, kui see on konfigureeritud
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

Pärast selle rakendusjuhendi järgimist on sul:

1. **Juurutatud infrastruktuur:**

      - Microsoft Foundry projekt mudelijuurutustega
      - Container Apps veebirakenduse hostimiseks
      - AI otsing tootekataloogile
      - Application Insights monitooringuks

2. **Algne agent:**

      - Ostja agent, konfigureeritud põhijuhistega
      - Failide otsingu võimalus aktiveeritud
      - Jälgimise ja monitooringu seadistus

3. **Kohandamiseks valmis:**

      - Raamistik Lojaalsusagendi lisamiseks
      - Kohandatud juhiste mallid
      - Testimise ja valideerimise skriptid
      - Monitooringu ja hindamise seadistus

4. **Tootmiskõlblikkus:**

      - Turvaskaneerimine red-teaminguga
      - Jõudluse monitooring
      - Kvaliteedia hindamise raamistik
      - Skaalautuv arhitektuur

See näide demonstreerib, kuidas AZD mall saab laiendada ja kohandada konkreetsete ettevõtte stsenaariumide jaoks, hoides samal ajal parimaid tavasid turvalisuse, monitooringu ja skaleeritavuse osas.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud kasutades tehisintellektil põhinevat tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüame täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma algses keeles tuleks pidada autoriteetseks allikaks. Olulise info puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->