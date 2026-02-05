# 5. Personalizează un Șablon

!!! tip "LA FINALUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Explorezi capacitățile implicite ale Agentului AI
    - [ ] Adaugi căutare AI cu propriul index
    - [ ] Activezi și analizezi metricile de Tracing
    - [ ] Execuți o rundă de evaluare
    - [ ] Realizezi o scanare de tip red-teaming
    - [ ] **Laboratorul 5: Construiește un Plan de Personalizare** 

---

## 5.1 Capacitățile Agentului AI

!!! success "Am finalizat acest lucru în Laboratorul 01"

- **Căutare în Fișiere**: Căutarea în fișiere integrată de OpenAI pentru recuperarea informațiilor
- **Citații**: Atribuirea automată a surselor în răspunsuri
- **Instrucțiuni Personalizabile**: Modificarea comportamentului și personalității agentului
- **Integrarea Instrumentelor**: Sistem extensibil de instrumente pentru capacități personalizate

---

## 5.2 Opțiuni de Recuperare a Cunoștințelor

!!! task "Pentru a finaliza acest lucru, trebuie să facem modificări și să redeployăm"    
    
    ```bash title=""
    # Setează variabilele de mediu
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Încarcă datele și creează indexul meu

    ```

---

**Căutare în Fișiere OpenAI (Implicit):**

- Integrată în serviciul Azure AI Agent
- Procesare și indexare automată a documentelor
- Nu necesită configurare suplimentară

**Căutare Azure AI (Opțional):**

- Căutare semantică și vectorială hibridă
- Gestionarea indexului personalizat
- Capacități avansate de căutare
- Necesită `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Pentru a finaliza acest lucru, trebuie să facem modificări și să redeployăm"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- Integrare OpenTelemetry
- Urmărirea cererilor/răspunsurilor
- Metrici de performanță
- Disponibil în portalul AI Foundry

**Logging:**

- Jurnale de aplicație în Container Apps
- Jurnalizare structurată cu ID-uri de corelare
- Vizualizare în timp real și istoric a jurnalelor

---

## 5.4 [Evaluarea Agentului](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Evaluare Locală:**

- Evaluatori integrați pentru evaluarea calității
- Scripturi personalizate de evaluare
- Benchmarking de performanță

**Monitorizare Continuă:**

- Evaluare automată a interacțiunilor live
- Urmărirea metricilor de calitate
- Detectarea regresiilor de performanță

**Integrare CI/CD:**

- Workflow GitHub Actions
- Testare și evaluare automată
- Testare comparativă statistică

---

## 5.5 [Agentul AI Red Teaming](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red Teaming AI:**

- Scanare automată de securitate
- Evaluarea riscurilor pentru sistemele AI
- Validarea siguranței în mai multe categorii

**Autentificare:**

- Identitate gestionată pentru serviciile Azure
- Opțional autentificare Azure App Service
- Autentificare de bază pentru dezvoltare

!!! quote "LA FINALUL ACESTUI LABORATOR AR TREBUI SĂ AI"
    - [ ] Definite cerințele scenariului
    - [ ] Personalizate variabilele de mediu (config)
    - [ ] Personalizate instrucțiunile agentului (task)
    - [ ] Deployat șablonul personalizat (app)
    - [ ] Finalizate sarcinile post-deployment (manual)
    - [ ] Rulat o evaluare de test

Acest exemplu demonstrează personalizarea șablonului pentru un caz de utilizare retail în cadrul unei întreprinderi, cu doi agenți specializați și mai multe implementări de modele.

---

## 5.6 Personalizează-l pentru Tine!

### 5.6.1. Cerințele Scenariului

#### **Implementări de Agenți:** 

   - Agentul Shopper: Ajută clienții să găsească și să compare produse
   - Agentul Loyalty: Gestionează recompensele și promoțiile clienților

#### **Implementări de Modele:**

   - `gpt-4.1`: Model principal de chat
   - `o3`: Model de raționament pentru interogări complexe
   - `gpt-4.1-nano`: Model ușor pentru interacțiuni simple
   - `text-embedding-3-large`: Embedding-uri de înaltă calitate pentru căutare

#### **Funcționalități:**

   - Tracing și monitorizare activate
   - Căutare AI pentru catalogul de produse
   - Cadru de evaluare pentru asigurarea calității
   - Red teaming pentru validarea securității

---

### 5.6.2 Implementarea Scenariului


#### 5.6.2.1. Configurare Pre-Deployment

Creează un script de configurare (`setup-retail.sh`)

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

#### 5.6.2.2: Instrucțiuni pentru Agenți

Creează `custom-agents/shopper-agent-instructions.md`:

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

Creează `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Script de Deployment

Creează `deploy-retail.sh`:

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

#### 5.6.2.4: Configurare Post-Deployment

Creează `configure-retail-agents.sh`:

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

### 5.6.3: Testare și Validare

Creează `test-retail-deployment.sh`:

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

### 5.6.4 Rezultate Așteptate

După ce urmezi acest ghid de implementare, vei avea:

1. **Infrastructură Implementată:**

      - Proiect AI Foundry cu implementări de modele
      - Container Apps care găzduiesc aplicația web
      - Serviciu AI Search pentru catalogul de produse
      - Application Insights pentru monitorizare

2. **Agent Inițial:**

      - Agentul Shopper configurat cu instrucțiuni de bază
      - Funcționalitate de căutare în fișiere activată
      - Tracing și monitorizare configurate

3. **Pregătit pentru Personalizare:**

      - Cadru pentru adăugarea Agentului Loyalty
      - Șabloane de instrucțiuni personalizate
      - Scripturi de testare și validare
      - Configurare pentru monitorizare și evaluare

4. **Pregătit pentru Producție:**

      - Scanare de securitate cu red teaming
      - Monitorizare performanță
      - Cadru de evaluare a calității
      - Arhitectură scalabilă

Acest exemplu demonstrează cum șablonul AZD poate fi extins și personalizat pentru scenarii specifice de întreprindere, menținând în același timp cele mai bune practici pentru securitate, monitorizare și scalabilitate.

---

