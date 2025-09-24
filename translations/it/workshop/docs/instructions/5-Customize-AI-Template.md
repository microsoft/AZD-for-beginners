<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "60caadc3b57dccb9e6c413b5ccace90b",
  "translation_date": "2025-09-24T14:54:12+00:00",
  "source_file": "workshop/docs/instructions/5-Customize-AI-Template.md",
  "language_code": "it"
}
-->
# 5. Personalizzare un Template

!!! tip "ALLA FINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Esplorare le capacità predefinite dell'AI Agent
    - [ ] Aggiungere la ricerca AI con un tuo indice
    - [ ] Attivare e analizzare le metriche di Tracing
    - [ ] Eseguire un test di valutazione
    - [ ] Eseguire una scansione di red-teaming
    - [ ] **Lab 5: Creare un Piano di Personalizzazione**

---

## 5.1 Capacità dell'AI Agent

!!! success "Abbiamo completato questo nel Lab 01"

- **Ricerca File**: Ricerca file integrata di OpenAI per il recupero delle informazioni
- **Citazioni**: Attribuzione automatica delle fonti nelle risposte
- **Istruzioni Personalizzabili**: Modifica del comportamento e della personalità dell'agente
- **Integrazione di Strumenti**: Sistema di strumenti estensibile per capacità personalizzate

---

## 5.2 Opzioni di Recupero delle Informazioni

!!! task "Per completare questo passaggio, dobbiamo apportare modifiche e ridistribuire"    
    
    ```bash title=""
    # Imposta le variabili di ambiente
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Carica i dati e crea il mio indice

    ```

---

**Ricerca File di OpenAI (Predefinita):**

- Integrata nel servizio Azure AI Agent
- Elaborazione e indicizzazione automatica dei documenti
- Nessuna configurazione aggiuntiva richiesta

**Azure AI Search (Opzionale):**

- Ricerca semantica e vettoriale ibrida
- Gestione personalizzata degli indici
- Capacità di ricerca avanzate
- Richiede `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing e Monitoraggio](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Per completare questo passaggio, dobbiamo apportare modifiche e ridistribuire"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- Integrazione con OpenTelemetry
- Tracciamento delle richieste/risposte
- Metriche di performance
- Disponibile nel portale AI Foundry

**Logging:**

- Log delle applicazioni in Container Apps
- Logging strutturato con ID di correlazione
- Visualizzazione in tempo reale e storica dei log

---

## 5.4 [Valutazione dell'Agente](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Valutazione Locale:**

- Valutatori integrati per l'analisi della qualità
- Script di valutazione personalizzati
- Benchmarking delle performance

**Monitoraggio Continuo:**

- Valutazione automatica delle interazioni in tempo reale
- Monitoraggio delle metriche di qualità
- Rilevamento delle regressioni di performance

**Integrazione CI/CD:**

- Workflow GitHub Actions
- Test e valutazione automatizzati
- Test di confronto statistico

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Scansione di sicurezza automatizzata
- Valutazione dei rischi per i sistemi AI
- Analisi della sicurezza in più categorie

**Autenticazione:**

- Managed Identity per i servizi Azure
- Autenticazione opzionale con Azure App Service
- Autenticazione di base per lo sviluppo

!!! quote "ALLA FINE DI QUESTO LAB DOVRESTI AVER"
    - [ ] Definito i requisiti dello scenario
    - [ ] Personalizzato le variabili di ambiente (config)
    - [ ] Personalizzato le istruzioni dell'agente (task)
    - [ ] Distribuito il template personalizzato (app)
    - [ ] Completato le attività post-distribuzione (manuale)
    - [ ] Eseguito un test di valutazione

Questo esempio dimostra come personalizzare il template per un caso d'uso aziendale nel settore retail con due agenti specializzati e più distribuzioni di modelli.

---

## 5.6 Personalizzalo per Te!

### 5.6.1. Requisiti dello Scenario

#### **Distribuzioni degli Agenti:** 

   - Shopper Agent: Aiuta i clienti a trovare e confrontare i prodotti
   - Loyalty Agent: Gestisce i premi e le promozioni per i clienti

#### **Distribuzioni dei Modelli:**

   - `gpt-4.1`: Modello principale per le chat
   - `o3`: Modello di ragionamento per query complesse
   - `gpt-4.1-nano`: Modello leggero per interazioni semplici
   - `text-embedding-3-large`: Embedding di alta qualità per la ricerca

#### **Funzionalità:**

   - Tracing e monitoraggio abilitati
   - AI Search per il catalogo prodotti
   - Framework di valutazione per il controllo qualità
   - Red teaming per la validazione della sicurezza

---

### 5.6.2 Implementazione dello Scenario

#### 5.6.2.1. Configurazione Pre-Distribuzione

Crea uno script di configurazione (`setup-retail.sh`)

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

#### 5.6.2.2: Istruzioni per gli Agenti

Crea `custom-agents/shopper-agent-instructions.md`:

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

Crea `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Script di Distribuzione

Crea `deploy-retail.sh`:

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

#### 5.6.2.4: Configurazione Post-Distribuzione

Crea `configure-retail-agents.sh`:

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

### 5.6.3: Test e Validazione

Crea `test-retail-deployment.sh`:

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

### 5.6.4 Risultati Attesi

Seguendo questa guida all'implementazione, otterrai:

1. **Infrastruttura Distribuita:**

      - Progetto AI Foundry con distribuzioni di modelli
      - Container Apps che ospitano l'applicazione web
      - Servizio AI Search per il catalogo prodotti
      - Application Insights per il monitoraggio

2. **Agente Iniziale:**

      - Shopper Agent configurato con istruzioni di base
      - Funzionalità di ricerca file abilitata
      - Tracing e monitoraggio configurati

3. **Pronto per la Personalizzazione:**

      - Framework per aggiungere il Loyalty Agent
      - Template di istruzioni personalizzati
      - Script di test e validazione
      - Configurazione di monitoraggio e valutazione

4. **Pronto per la Produzione:**

      - Scansione di sicurezza con red teaming
      - Monitoraggio delle performance
      - Framework di valutazione della qualità
      - Architettura scalabile

Questo esempio dimostra come il template AZD possa essere esteso e personalizzato per scenari aziendali specifici, mantenendo le migliori pratiche per sicurezza, monitoraggio e scalabilità.

---

