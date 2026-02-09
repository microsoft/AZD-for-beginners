# 5. Personalizzare un Modello

!!! tip "AL TERMINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Esplorato le capacità predefinite dell'agente AI
    - [ ] Aggiunta la ricerca AI con il proprio indice
    - [ ] Attivate e analizzate le metriche di tracciamento
    - [ ] Eseguito un ciclo di valutazione
    - [ ] Eseguita una scansione di red-teaming
    - [ ] **Lab 5: Creato un piano di personalizzazione** 

---

## 5.1 Capacità degli agenti AI

!!! success "Abbiamo completato questo nel Lab 01"

- **Ricerca File**: ricerca file integrata di OpenAI per il recupero della conoscenza
- **Citazioni**: attribuzione automatica delle fonti nelle risposte
- **Istruzioni Personalizzabili**: modifica il comportamento e la personalità dell'agente
- **Integrazione di Strumenti**: sistema di strumenti estendibile per funzionalità personalizzate

---

## 5.2 Opzioni di Recupero della Conoscenza

!!! task "Per completare questo dobbiamo apportare modifiche e ridistribuire"    
    
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

**OpenAI File Search (Predefinita):**

- Integrato negli agenti Foundry
- Elaborazione e indicizzazione automatica dei documenti
- Nessuna configurazione aggiuntiva richiesta

**Azure AI Search (Opzionale):**

- Ricerca semantica e vettoriale ibrida
- Gestione di indici personalizzati
- Funzionalità di ricerca avanzate
- Richiede `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracciamento e Monitoraggio](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Per completare questo dobbiamo apportare modifiche e ridistribuire"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracciamento:**

- Integrazione OpenTelemetry
- Tracciamento delle richieste/risposte
- Metriche di prestazione
- Disponibile nel portale Microsoft Foundry

**Registrazione:**

- Log dell'applicazione in Container Apps
- Registrazione strutturata con ID di correlazione
- Visualizzazione dei log in tempo reale e storici

---

## 5.4 [Valutazione dell'Agente](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Valutazione Locale:**

- Valutatori integrati per la valutazione della qualità
- Script di valutazione personalizzati
- Benchmark delle prestazioni

**Monitoraggio Continuo:**

- Valutazione automatica delle interazioni in tempo reale
- Monitoraggio delle metriche di qualità
- Rilevamento delle regressioni delle prestazioni

**Integrazione CI/CD:**

- Workflow GitHub Actions
- Test e valutazioni automatizzate
- Test di confronto statistico

---

## 5.5 [Agente di Red Teaming AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red Teaming AI:**

- Scansione di sicurezza automatizzata
- Valutazione del rischio per i sistemi AI
- Valutazione della sicurezza su più categorie

**Autenticazione:**

- Managed Identity per i servizi Azure
- Autenticazione opzionale di Azure App Service
- Fallback con autenticazione base per lo sviluppo



!!! quote "AL TERMINE DI QUESTO LAB DOVRESTI AVERE"
    - [ ] Definisci i requisiti del tuo scenario
    - [ ] Variabili d'ambiente personalizzate (config)
    - [ ] Istruzioni dell'agente personalizzate (task)
    - [ ] Template personalizzato distribuito (app)
    - [ ] Attività post-distribuzione completate (manuale)
    - [ ] Eseguito un test di valutazione

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Personalizzalo per te!

### 5.6.1. Requisiti dello scenario

#### **Distribuzioni degli agenti:** 

   - Agente Shopper: Aiuta i clienti a trovare e confrontare i prodotti
   - Agente Loyalty: Gestisce premi e promozioni per i clienti

#### **Distribuzioni dei modelli:**

   - `gpt-4.1`: Modello di chat primario
   - `o3`: Modello di ragionamento per query complesse
   - `gpt-4.1-nano`: Modello leggero per interazioni semplici
   - `text-embedding-3-large`: Embedding di alta qualità per la ricerca

#### **Funzionalità:**

   - Tracciamento e monitoraggio abilitati
   - AI Search per il catalogo prodotti
   - Framework di valutazione per assicurazione della qualità
   - Red teaming per la validazione della sicurezza

---

### 5.6.2 Implementazione dello scenario


#### 5.6.2.1. Configurazione pre-distribuzione

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Imposta il nome dell'ambiente
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configura la regione (scegli in base alla disponibilità dei modelli)
azd env set AZURE_LOCATION "eastus2"

# Abilita tutti i servizi opzionali
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configura il modello di chat principale (gpt-4o come il più vicino disponibile a gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configura il modello di embedding per una ricerca migliorata
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Imposta il nome dell'agente (creerà il primo agente)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configura l'indice di ricerca
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Istruzioni per gli agenti

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

#### 5.6.2.3: Script di distribuzione

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Verificare i prerequisiti
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Configurare l'ambiente
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Verificare la quota nella regione selezionata
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

# Distribuire l'infrastruttura e l'applicazione
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Raccogliere gli output della distribuzione
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Ottenere l'URL dell'applicazione web
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

#### 5.6.2.4: Configurazione post-distribuzione

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Ottieni informazioni sul deployment
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Istruzioni per la configurazione manuale
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

### 5.6.3: Test e convalida

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Verificare che le variabili d'ambiente siano impostate
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Verificare la disponibilità dell'applicazione web
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

# Eseguire la valutazione se configurata
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

### 5.6.4 Risultati attesi

Dopo aver seguito questa guida all'implementazione, avrai:

1. **Infrastruttura distribuita:**

      - Progetto Microsoft Foundry con distribuzioni di modelli
      - Container Apps che ospitano l'applicazione web
      - Servizio AI Search per il catalogo prodotti
      - Application Insights per il monitoraggio

2. **Agente iniziale:**

      - Agente Shopper configurato con istruzioni di base
      - Capacità di ricerca file abilitata
      - Tracciamento e monitoraggio configurati

3. **Pronto per la personalizzazione:**

      - Framework per aggiungere l'Agente Loyalty
      - Template di istruzioni personalizzate
      - Script per test e convalida
      - Configurazione per monitoraggio e valutazione

4. **Prontezza alla produzione:**

      - Scansione di sicurezza con red teaming
      - Monitoraggio delle prestazioni
      - Framework per la valutazione della qualità
      - Architettura scalabile

Questo esempio dimostra come il template AZD possa essere esteso e personalizzato per scenari aziendali specifici, mantenendo le migliori pratiche per sicurezza, monitoraggio e scalabilità.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Esclusione di responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica Co-op Translator (https://github.com/Azure/co-op-translator). Sebbene ci sforziamo di garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->