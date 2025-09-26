<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "60caadc3b57dccb9e6c413b5ccace90b",
  "translation_date": "2025-09-24T10:52:27+00:00",
  "source_file": "workshop/docs/instructions/5-Customize-AI-Template.md",
  "language_code": "de"
}
-->
# 5. Anpassung einer Vorlage

!!! tip "AM ENDE DIESES MODULS WERDEN SIE IN DER LAGE SEIN"

    - [ ] Die Standardfähigkeiten des KI-Agenten erkundet
    - [ ] KI-Suche mit eigenem Index hinzugefügt
    - [ ] Tracing-Metriken aktiviert und analysiert
    - [ ] Einen Evaluationslauf durchgeführt
    - [ ] Einen Red-Teaming-Scan durchgeführt
    - [ ] **Lab 5: Einen Anpassungsplan erstellt**

---

## 5.1 Fähigkeiten des KI-Agenten

!!! success "Das haben wir in Lab 01 abgeschlossen"

- **Dateisuche**: Integrierte Dateisuche von OpenAI für Wissensabruf
- **Zitate**: Automatische Quellenangabe in Antworten
- **Anpassbare Anweisungen**: Modifikation des Verhaltens und der Persönlichkeit des Agenten
- **Tool-Integration**: Erweiterbares Tool-System für benutzerdefinierte Funktionen

---

## 5.2 Optionen für Wissensabruf

!!! task "Um dies abzuschließen, müssen wir Änderungen vornehmen und erneut bereitstellen"    
    
    ```bash title=""
    # Umgebungsvariablen festlegen
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Daten hochladen und meinen Index erstellen

    ```

---

**OpenAI-Dateisuche (Standard):**

- In den Azure AI Agent-Dienst integriert
- Automatische Dokumentenverarbeitung und Indexierung
- Keine zusätzliche Konfiguration erforderlich

**Azure AI-Suche (Optional):**

- Hybride semantische und Vektorsuche
- Verwaltung benutzerdefinierter Indizes
- Erweiterte Suchfunktionen
- Erfordert `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Um dies abzuschließen, müssen wir Änderungen vornehmen und erneut bereitstellen"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- OpenTelemetry-Integration
- Verfolgung von Anfragen und Antworten
- Leistungsmetriken
- Verfügbar im AI Foundry-Portal

**Logging:**

- Anwendungsprotokolle in Container-Apps
- Strukturierte Protokollierung mit Korrelations-IDs
- Echtzeit- und historische Protokollansicht

---

## 5.4 [Agentenbewertung](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Lokale Bewertung:**

- Integrierte Evaluatoren zur Qualitätsbewertung
- Benutzerdefinierte Bewertungsskripte
- Leistungsbenchmarking

**Kontinuierliche Überwachung:**

- Automatische Bewertung von Live-Interaktionen
- Verfolgung von Qualitätsmetriken
- Erkennung von Leistungsregressionen

**CI/CD-Integration:**

- GitHub Actions-Workflow
- Automatisierte Tests und Bewertungen
- Statistische Vergleichstests

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Automatisierte Sicherheitsüberprüfung
- Risikobewertung für KI-Systeme
- Sicherheitsbewertung in mehreren Kategorien

**Authentifizierung:**

- Verwaltete Identität für Azure-Dienste
- Optionale Azure App Service-Authentifizierung
- Basis-Authentifizierung als Fallback für die Entwicklung

!!! quote "AM ENDE DIESES LABS SOLLTEN SIE HABEN"
    - [ ] Ihre Szenarioanforderungen definiert
    - [ ] Umgebungsvariablen angepasst (Konfiguration)
    - [ ] Agentenanweisungen angepasst (Aufgabe)
    - [ ] Die angepasste Vorlage bereitgestellt (App)
    - [ ] Nachbereitungsaufgaben abgeschlossen (manuell)
    - [ ] Einen Testlauf durchgeführt

Dieses Beispiel zeigt, wie die Vorlage für einen Unternehmensfall im Einzelhandel mit zwei spezialisierten Agenten und mehreren Modellbereitstellungen angepasst werden kann.

---

## 5.6 Passen Sie es für sich an!

### 5.6.1. Szenarioanforderungen

#### **Agentenbereitstellungen:** 

   - Shopper-Agent: Hilft Kunden, Produkte zu finden und zu vergleichen
   - Loyalty-Agent: Verwalten von Kundenprämien und Aktionen

#### **Modellbereitstellungen:**

   - `gpt-4.1`: Primäres Chat-Modell
   - `o3`: Modell für komplexe Abfragen
   - `gpt-4.1-nano`: Leichtgewichtiges Modell für einfache Interaktionen
   - `text-embedding-3-large`: Hochwertige Einbettungen für die Suche

#### **Funktionen:**

   - Tracing und Monitoring aktiviert
   - KI-Suche für Produktkatalog
   - Bewertungsframework für Qualitätssicherung
   - Red Teaming für Sicherheitsvalidierung

---

### 5.6.2 Szenarioimplementierung

#### 5.6.2.1. Vorbereitungs-Konfiguration

Erstellen Sie ein Setup-Skript (`setup-retail.sh`)

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

#### 5.6.2.2: Agentenanweisungen

Erstellen Sie `custom-agents/shopper-agent-instructions.md`:

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

Erstellen Sie `custom-agents/loyalty-agent-instructions.md`:

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

Erstellen Sie `deploy-retail.sh`:

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

#### 5.6.2.4: Nachbereitungs-Konfiguration

Erstellen Sie `configure-retail-agents.sh`:

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

### 5.6.3: Testen und Validieren

Erstellen Sie `test-retail-deployment.sh`:

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

### 5.6.4 Erwartete Ergebnisse

Nach Befolgung dieser Implementierungsanleitung werden Sie Folgendes erreicht haben:

1. **Bereitgestellte Infrastruktur:**

      - AI Foundry-Projekt mit Modellbereitstellungen
      - Container-Apps, die die Webanwendung hosten
      - KI-Suchdienst für Produktkatalog
      - Application Insights für Monitoring

2. **Initialer Agent:**

      - Shopper-Agent mit grundlegenden Anweisungen konfiguriert
      - Dateisuche aktiviert
      - Tracing und Monitoring konfiguriert

3. **Bereit für Anpassungen:**

      - Framework für das Hinzufügen des Loyalty-Agenten
      - Vorlagen für benutzerdefinierte Anweisungen
      - Test- und Validierungsskripte
      - Monitoring- und Bewertungssetup

4. **Produktionsreife:**

      - Sicherheitsüberprüfung mit Red Teaming
      - Leistungsüberwachung
      - Bewertungsframework für Qualität
      - Skalierbare Architektur

Dieses Beispiel zeigt, wie die AZD-Vorlage erweitert und für spezifische Unternehmensszenarien angepasst werden kann, während bewährte Verfahren für Sicherheit, Monitoring und Skalierbarkeit eingehalten werden.

---

