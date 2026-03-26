# 5. Vorlage anpassen

!!! tip "AM ENDE DIESES MODULS KÖNNEN SIE"

    - [ ] Die Standardfähigkeiten des KI-Agenten erkundet
    - [ ] AI Search mit Ihrem eigenen Index hinzugefügt
    - [ ] Tracing-Metriken aktiviert und analysiert
    - [ ] Einen Evaluierungslauf durchgeführt
    - [ ] Einen Red-Teaming-Scan durchgeführt
    - [ ] **Labor 5: Einen Anpassungsplan erstellt** 

---

## 5.1 KI-Agenten-Fähigkeiten

!!! success "Wir haben dies in Labor 01 abgeschlossen"

- **File Search**: OpenAI's built-in file search for knowledge retrieval
- **Citations**: Automatische Quellenangabe in Antworten
- **Customizable Instructions**: Das Verhalten und die Persönlichkeit des Agenten anpassen
- **Tool Integration**: Erweiterbares Toolsystem für benutzerdefinierte Fähigkeiten

---

## 5.2 Optionen zur Wissensabrufung

!!! task "Um dies abzuschließen, müssen wir Änderungen vornehmen und neu bereitstellen"    
    
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

**OpenAI File Search (Standard):**

- In Foundry Agents integriert
- Automatische Dokumentenverarbeitung und Indexierung
- Keine zusätzliche Konfiguration erforderlich

**Azure AI Search (Optional):**

- Hybride semantische und Vektorsuche
- Benutzerdefinierte Indexverwaltung
- Erweiterte Suchfunktionen
- Erfordert `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing & Überwachung](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Um dies abzuschließen, müssen wir Änderungen vornehmen und neu bereitstellen"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry-Integration
- Anfrage-/Antwortverfolgung
- Leistungsmetriken
- Im Microsoft Foundry-Portal verfügbar

**Protokollierung:**

- Anwendungsprotokolle in Container Apps
- Strukturierte Protokollierung mit Korrelations-IDs
- Echtzeit- und historische Protokollanzeige

---

## 5.4 [Agentenbewertung](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokale Evaluation:**

- Eingebaute Evaluatoren zur Qualitätsbewertung
- Benutzerdefinierte Evaluierungsskripte
- Leistungs-Benchmarking

**Kontinuierliche Überwachung:**

- Automatische Bewertung von Live-Interaktionen
- Verfolgung von Qualitätsmetriken
- Erkennung von Performanceregressionen

**CI/CD-Integration:**

- GitHub Actions-Workflow
- Automatisierte Tests und Evaluierung
- Statistische Vergleichstests

---

## 5.5 [KI-Red-Teaming-Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**KI-Red-Teaming:**

- Automatisierte Sicherheitsüberprüfung
- Risikobewertung für KI-Systeme
- Sicherheitsbewertung in mehreren Kategorien

**Authentifizierung:**

- Managed Identity für Azure-Dienste
- Optionale Authentifizierung des Azure App Service
- Basic-Auth-Fallback für die Entwicklung



!!! quote "AM ENDE DIESES LABS SOLLTEN SIE FOLGENDES HABEN"
    - [ ] Definieren Sie Ihre Szenarioanforderungen
    - [ ] Angepasste Umgebungsvariablen (Konfiguration)
    - [ ] Angepasste Agenteninstruktionen (Aufgabe)
    - [ ] Die angepasste Vorlage bereitgestellt (App)
    - [ ] Post-Deployment-Aufgaben abgeschlossen (manuell)
    - [ ] Eine Testauswertung durchgeführt

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Für Sie anpassen!

### 5.6.1. Szenarioanforderungen

#### **Agentenbereitstellungen:** 

   - Shopper Agent: Hilft Kunden, Produkte zu finden und zu vergleichen
   - Loyalty Agent: Verwaltet Kundenprämien und Aktionen

#### **Modellbereitstellungen:**

   - `gpt-4.1`: Primäres Chatmodell
   - `o3`: Reasoning-Modell für komplexe Anfragen
   - `gpt-4.1-nano`: Leichtgewichtiges Modell für einfache Interaktionen
   - `text-embedding-3-large`: Hochwertige Embeddings für die Suche

#### **Funktionen:**

   - Tracing und Monitoring aktiviert
   - AI Search für Produktkatalog
   - Evaluierungs-Framework für Qualitätssicherung
   - Red Teaming zur Sicherheitsvalidierung

---

### 5.6.2 Szenarioimplementierung


#### 5.6.2.1. Vorbereitende Konfiguration

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Umgebungsname festlegen
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Region konfigurieren (nach Modellverfügbarkeit auswählen)
azd env set AZURE_LOCATION "eastus2"

# Alle optionalen Dienste aktivieren
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Primäres Chatmodell konfigurieren (gpt-4.1 als nächstverfügbares Modell zu gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Embedding-Modell für verbesserte Suche konfigurieren
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Agentennamen festlegen (erstellt den ersten Agenten)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Suchindex konfigurieren
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agentenanweisungen

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

#### 5.6.2.3: Bereitstellungsskript

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Voraussetzungen prüfen
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Umgebung einrichten
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Kontingent in der ausgewählten Region prüfen
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

# Infrastruktur und Anwendung bereitstellen
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Bereitstellungsergebnisse erfassen
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# URL der Webanwendung abrufen
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

#### 5.6.2.4: Konfiguration nach der Bereitstellung

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Bereitstellungsinformationen abrufen
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Anweisungen für die manuelle Konfiguration
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

### 5.6.3: Test und Validierung

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Überprüfe, ob Umgebungsvariablen gesetzt sind
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Teste die Verfügbarkeit der Webanwendung
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

# Führe die Auswertung aus, falls konfiguriert
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

### 5.6.4 Erwartete Ergebnisse

After following this implementation guide, you will have:

1. **Bereitgestellte Infrastruktur:**

      - Microsoft Foundry-Projekt mit Modellbereitstellungen
      - Container Apps, die die Webanwendung hosten
      - AI Search-Service für den Produktkatalog
      - Application Insights für die Überwachung

2. **Erster Agent:**

      - Shopper Agent mit grundlegenden Anweisungen konfiguriert
      - Dateisuche-Funktion aktiviert
      - Tracing und Monitoring konfiguriert

3. **Bereit zur Anpassung:**

      - Framework zum Hinzufügen des Loyalty Agent
      - Vorlagen für benutzerdefinierte Anweisungen
      - Test- und Validierungsskripte
      - Überwachungs- und Evaluierungs-Setup

4. **Produktionsbereitschaft:**

      - Sicherheitsprüfung mit Red Teaming
      - Performance-Überwachung
      - Qualitätsevaluierungs-Framework
      - Skalierbare Architektur

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle zu betrachten. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für etwaige Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->