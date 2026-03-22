# 5. Personalizează un Șablon

!!! tip "LA SFÂRȘITUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Explorezi Capabilitățile implicite ale Agentului AI
    - [ ] Adaugi AI Search cu propriul tău index
    - [ ] Activezi și analizezi metricile de Urmărire
    - [ ] Execuți o rulare de evaluare
    - [ ] Execuți o scanare de tip red-teaming
    - [ ] **Laboratorul 5: Ai construit un Plan de Personalizare**

---

## 5.1 Capabilitățile Agentului AI

!!! success "Am terminat acest lucru în Laboratorul 01"

- **Căutare în Fișiere**: Căutare în fișiere integrată OpenAI pentru recuperarea informațiilor
- **Citații**: Atribuire automată a surselor în răspunsuri
- **Instrucțiuni Personalizabile**: Modifică comportamentul și personalitatea agentului
- **Integrare Unelte**: Sistem extensibil de unelte pentru capabilități personalizate

---

## 5.2 Opțiuni de Recuperare a Cunoștințelor

!!! task "Pentru a finaliza trebuie să facem modificări și să redeployăm"    
    
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

**OpenAI File Search (Implicit):**

- Integrată în Foundry Agents
- Procesare și indexare automată a documentelor
- Nu necesită configurare suplimentară

**Azure AI Search (Opțional):**

- Căutare hibrid semantică și vectorială
- Gestionarea indexului personalizat
- Capabilități avansate de căutare
- Necesită `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Urmărire și Monitorizare](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Pentru a finaliza trebuie să facem modificări și să redeployăm"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Urmărire (Tracing):**

- Integrare OpenTelemetry
- Urmărire cerere/răspuns
- Metrici de performanță
- Disponibil în portalul Microsoft Foundry

**Logging:**

- Jurnale aplicație în Container Apps
- Logging structurat cu ID-uri de corelare
- Vizualizare în timp real și istorică a jurnalelor

---

## 5.4 [Evaluarea Agentului](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Evaluare Locală:**

- Evaluatori încorporați pentru evaluarea calității
- Scripturi personalizate de evaluare
- Benchmarking de performanță

**Monitorizare Continuă:**

- Evaluarea automată a interacțiunilor live
- Monitorizarea metricilor de calitate
- Detectarea regresiilor de performanță

**Integrare CI/CD:**

- Workflow GitHub Actions
- Testare și evaluare automate
- Testare statistică de comparație

---

## 5.5 [Agent AI pentru Red Teaming](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red Teaming AI:**

- Scanare automată de securitate
- Evaluare a riscurilor pentru sistemele AI
- Evaluare a siguranței pe mai multe categorii

**Autentificare:**

- Identitate gestionată pentru serviciile Azure
- Autentificare opțională Azure App Service
- Autentificare bazică fallback pentru dezvoltare

!!! quote "LA SFÂRȘITUL ACESTUI LABORATOR AR TREBUI SĂ FIȚI"
    - [ ] Definit cerințele scenariului tău
    - [ ] Personalizat variabilele de mediu (config)
    - [ ] Personalizat instrucțiunile agentului (task)
    - [ ] Deployat șablonul personalizat (app)
    - [ ] Finalizat sarcinile post-deployment (manual)
    - [ ] Rulat o evaluare de testare

Acest exemplu demonstrează personalizarea șablonului pentru un caz de utilizare enterprise în retail cu doi agenți specializați și multiple implementări de modele.

---

## 5.6 Personalizează-l Pentru Tine!

### 5.6.1. Cerințele Scenariului

#### **Implementările Agentului:** 

   - Agent Shopper: Ajută clienții să găsească și să compare produse
   - Agent Loyalty: Gestionează recompensele și promoțiile clienților

#### **Implementările Modelului:**

   - `gpt-4.1`: Model principal de chat
   - `o3`: Model de raționament pentru întrebări complexe
   - `gpt-4.1-nano`: Model ușor pentru interacțiuni simple
   - `text-embedding-3-large`: Embeddinguri de înaltă calitate pentru căutare

#### **Caracteristici:**

   - Urmărire și monitorizare activate
   - AI Search pentru catalogul de produse
   - Cadru de evaluare pentru asigurarea calității
   - Red teaming pentru validare de securitate

---

### 5.6.2 Implementarea Scenariului


#### 5.6.2.1. Configurare Pre-Deploy

Creează un script de setup (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Setează numele mediului
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configurează regiunea (alege în funcție de disponibilitatea modelului)
azd env set AZURE_LOCATION "eastus2"

# Activează toate serviciile opționale
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configurează modelul principal de chat (gpt-4.1 ca cel mai apropiat disponibil de gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configurează modelul de încorporare pentru căutare îmbunătățită
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Setează numele agentului (va crea primul agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configurează indicele de căutare
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Instrucțiuni Agent

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

#### 5.6.2.3: Script de Deploy

Creează `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Validează prerechizitele
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Configurează mediul
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Verifică cota în regiunea selectată
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

# Implementează infrastructura și aplicația
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Capturează rezultatele implementării
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Obține URL-ul aplicației web
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

#### 5.6.2.4: Configurare Post-Deploy

Creează `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Obține informații despre implementare
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instrucțiuni pentru configurare manuală
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

### 5.6.3: Testare și Validare

Creează `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Verifică dacă variabilele de mediu sunt setate
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Testează disponibilitatea aplicației web
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

# Rulează evaluarea dacă este configurată
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

### 5.6.4 Rezultate Așteptate

După urmarea acestui ghid de implementare, vei avea:

1. **Infrastructură Deployată:**

      - Proiect Microsoft Foundry cu implementări de modele
      - Container Apps care găzduiesc aplicația web
      - Serviciu AI Search pentru catalogul de produse
      - Application Insights pentru monitorizare

2. **Agent Inițial:**

      - Agent Shopper configurat cu instrucțiuni de bază
      - Capacitate de căutare în fișiere activată
      - Monitorizare și urmărire configurate

3. **Pregătit pentru Personalizare:**

      - Cadru pentru adăugarea Agentului Loyalty
      - Șabloane personalizate de instrucțiuni
      - Scripturi de testare și validare
      - Configurare pentru monitorizare și evaluare

4. **Pregătit pentru Producție:**

      - Scanare de securitate cu red teaming
      - Monitorizare a performanței
      - Cadru de evaluare a calității
      - Arhitectură scalabilă

Acest exemplu demonstrează cum șablonul AZD poate fi extins și personalizat pentru scenarii enterprise specifice, menținând cele mai bune practici pentru securitate, monitorizare și scalabilitate.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, este recomandată traducerea profesională realizată de un traducător uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->