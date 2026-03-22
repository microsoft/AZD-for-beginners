# 5. Dostosuj szablon

!!! tip "NA KONIEC TEGO MODUŁU BĘDZIESZ MIAŁ MOŻLIWOŚĆ"

    - [ ] Zapoznania się z domyślnymi możliwościami agenta AI
    - [ ] Dodania wyszukiwania AI z własnym indeksem
    - [ ] Aktywowania i analizowania metryk śledzenia
    - [ ] Wykonania uruchomienia ewaluacji
    - [ ] Przeprowadzenia skanowania red-teaming
    - [ ] **Laboratorium 5: Stworzenia planu dostosowania**

---

## 5.1 Możliwości agenta AI

!!! success "Ukończyliśmy to w Laboratorium 01"

- **Wyszukiwanie plików**: Wbudowane wyszukiwanie plików OpenAI do pozyskiwania wiedzy
- **Cytowania**: Automatyczne przypisywanie źródeł w odpowiedziach
- **Dostosowywalne instrukcje**: Modyfikacja zachowania i osobowości agenta
- **Integracja narzędzi**: Rozszerzalny system narzędzi dla niestandardowych funkcji

---

## 5.2 Opcje pozyskiwania wiedzy

!!! task "Aby to ukończyć, musimy wprowadzić zmiany i ponownie wdrożyć"    
    
    ```bash title=""
    # Ustaw zmienne środowiskowe
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Prześlij dane i utwórz mój indeks

    ```

---

**Wbudowane wyszukiwanie plików OpenAI (domyślne):**

- Wbudowane w Foundry Agents
- Automatyczne przetwarzanie i indeksowanie dokumentów
- Nie wymaga dodatkowej konfiguracji

**Azure AI Search (opcjonalne):**

- Hybrydowe wyszukiwanie semantyczne i wektorowe
- Zarządzanie własnym indeksem
- Zaawansowane możliwości wyszukiwania
- Wymaga `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Śledzenie i monitorowanie](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Aby to ukończyć, musimy wprowadzić zmiany i ponownie wdrożyć"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Śledzenie:**

- Integracja z OpenTelemetry
- Śledzenie żądań/odpowiedzi
- Metryki wydajności
- Dostępne w portalu Microsoft Foundry

**Logowanie:**

- Logi aplikacji w Container Apps
- Strukturyzowane logowanie z identyfikatorami korelacji
- Podgląd logów w czasie rzeczywistym i historycznych

---

## 5.4 [Ocena agenta](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Ocena lokalna:**

- Wbudowane narzędzia oceniające jakość
- Niestandardowe skrypty oceny
- Benchmark wydajności

**Ciągłe monitorowanie:**

- Automatyczna ocena interakcji na żywo
- Śledzenie metryk jakości
- Wykrywanie regresji wydajności

**Integracja CI/CD:**

- Workflow w GitHub Actions
- Automatyczne testowanie i ocena
- Testy porównawcze statystyczne

---

## 5.5 [Agent do testów bezpieczeństwa AI (red teaming)](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Testy bezpieczeństwa AI (red teaming):**

- Automatyczne skanowanie bezpieczeństwa
- Ocena ryzyka dla systemów AI
- Ocena bezpieczeństwa w wielu kategoriach

**Uwierzytelnianie:**

- Managed Identity dla usług Azure
- Opcjonalne uwierzytelnianie Azure App Service
- Fallback podstawowego uwierzytelniania dla środowiska developerskiego

!!!

quote "NA KONIEC TEGO LABORATORIUM POWINIENEŚ MIEĆ"

    - [ ] Zdefiniowane wymagania scenariusza
    - [ ] Dostosowane zmienne środowiskowe (config)
    - [ ] Dostosowane instrukcje agenta (zadanie)
    - [ ] Wdrożony dostosowany szablon (aplikacja)
    - [ ] Wykonane zadania po wdrożeniu (manualne)
    - [ ] Przeprowadzona testowa ewaluacja

Ten przykład pokazuje, jak dostosować szablon dla zastosowania w przedsiębiorstwie z dwoma wyspecjalizowanymi agentami i wieloma wdrożeniami modeli.

---

## 5.6 Dostosuj go dla siebie!

### 5.6.1. Wymagania scenariusza

#### **Wdrożenia agentów:** 

   - Agent kupującego: Pomaga klientom znajdować i porównywać produkty
   - Agent lojalnościowy: Zarządza nagrodami i promocjami klientów

#### **Wdrożenia modeli:**

   - `gpt-4.1`: Podstawowy model czatu
   - `o3`: Model rozumowania do skomplikowanych zapytań
   - `gpt-4.1-nano`: Lekki model do prostych interakcji
   - `text-embedding-3-large`: Wysokiej jakości osadzenia do wyszukiwania

#### **Funkcje:**

   - Włączone śledzenie i monitorowanie
   - AI Search dla katalogu produktów
   - System oceny dla zapewnienia jakości
   - Red teaming do walidacji bezpieczeństwa

---

### 5.6.2 Implementacja scenariusza


#### 5.6.2.1. Konfiguracja przed wdrożeniem

Utwórz skrypt konfiguracji (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Ustaw nazwę środowiska
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Skonfiguruj region (wybierz na podstawie dostępności modelu)
azd env set AZURE_LOCATION "eastus2"

# Włącz wszystkie opcjonalne usługi
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Skonfiguruj główny model czatu (gpt-4.1 jako najbliższy dostępny model do gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Skonfiguruj model osadzania dla ulepszonego wyszukiwania
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Ustaw nazwę agenta (utworzy pierwszego agenta)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Skonfiguruj indeks wyszukiwania
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Instrukcje dla agentów

Utwórz `custom-agents/shopper-agent-instructions.md`:

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

Utwórz `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Skrypt wdrożeniowy

Utwórz `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Sprawdź wymagania wstępne
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Skonfiguruj środowisko
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Sprawdź limit zasobów w wybranym regionie
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

# Wdróż infrastrukturę i aplikację
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Zbierz wyniki wdrożenia
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Pobierz adres URL aplikacji webowej
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

#### 5.6.2.4: Konfiguracja po wdrożeniu

Utwórz `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Pobierz informacje o wdrożeniu
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instrukcje dotyczące ręcznej konfiguracji
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

### 5.6.3: Testowanie i walidacja

Utwórz `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Sprawdź, czy zmienne środowiskowe są ustawione
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Przetestuj dostępność aplikacji internetowej
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

# Uruchom ocenę, jeśli jest skonfigurowana
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

### 5.6.4 Oczekiwane rezultaty

Po wykonaniu tego przewodnika implementacji będziesz miał:

1. **Wdrożoną infrastrukturę:**

      - Projekt Microsoft Foundry z wdrożeniami modeli
      - Container Apps hostujące aplikację webową
      - Usługa AI Search dla katalogu produktów
      - Application Insights do monitorowania

2. **Wstępnego agenta:**

      - Agenta kupującego skonfigurowanego z podstawowymi instrukcjami
      - Włączoną możliwość wyszukiwania plików
      - Skonfigurowane śledzenie i monitorowanie

3. **Gotowość do dostosowania:**

      - Framework do dodania agenta lojalnościowego
      - Szablony niestandardowych instrukcji
      - Skrypty testowe i walidacyjne
      - Konfiguracja monitorowania i oceny

4. **Gotowość produkcyjna:**

      - Skanowanie bezpieczeństwa za pomocą red teaming
      - Monitorowanie wydajności
      - System oceny jakości
      - Skalowalna architektura

Ten przykład pokazuje, jak szablon AZD może być rozszerzony i dostosowany do specyficznych scenariuszy korporacyjnych przy zachowaniu najlepszych praktyk w zakresie bezpieczeństwa, monitorowania i skalowalności.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uważany za źródło wiarygodne. W przypadku informacji istotnych zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->