# Agenci AI z Azure Developer CLI

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - Rozwój w stylu AI-First
- **⬅️ Poprzedni**: [Integracja Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Następny**: [Wdrażanie modelu AI](ai-model-deployment.md)
- **🚀 Zaawansowane**: [Rozwiązania wieloagentowe](../../examples/retail-scenario.md)

---

## Wprowadzenie

Agenci AI to autonomiczne programy, które potrafią postrzegać swoje otoczenie, podejmować decyzje i wykonywać działania w celu osiągnięcia określonych celów. W przeciwieństwie do prostych chatbotów reagujących na zapytania, agenci potrafią:

- **Używać narzędzi** – wywoływać API, przeszukiwać bazy danych, wykonywać kod
- **Planować i rozumować** – rozbijać złożone zadania na kroki
- **Uczyć się na podstawie kontekstu** – utrzymywać pamięć i dostosowywać zachowanie
- **Współpracować** – działać razem z innymi agentami (systemy wieloagentowe)

Ten przewodnik pokazuje, jak wdrożyć agentów AI do Azure przy użyciu Azure Developer CLI (azd).

> **Uwaga dotycząca weryfikacji (2026-03-25):** Przewodnik został sprawdzony z wersjami `azd` `1.23.12` oraz `azure.ai.agents` `0.1.18-preview`. Doświadczenie `azd ai` jest wciąż oparte na wersjach preview, więc sprawdź pomoc rozszerzenia, jeśli Twoje flagi instalacyjne różnią się.

## Cele nauki

Po ukończeniu tego przewodnika:
- Zrozumiesz, czym są agenci AI i czym różnią się od chatbotów
- Wdrożysz gotowe szablony agentów AI za pomocą AZD
- Skonfigurujesz Agentów Foundry do własnych, niestandardowych agentów
- Zaimplementujesz podstawowe wzorce agentów (użycie narzędzi, RAG, systemy wieloagentowe)
- Będziesz monitorować i debugować wdrożonych agentów

## Rezultaty nauki

Po ukończeniu będziesz potrafić:
- Wdrożyć aplikacje agentów AI do Azure za pomocą jednego polecenia
- Konfigurować narzędzia i funkcje agentów
- Implementować retrieval-augmented generation (RAG) z agentami
- Projektować architektury wieloagentowe dla złożonych przepływów pracy
- Rozwiązywać typowe problemy przy wdrażaniu agentów

---

## 🤖 Czym agent różni się od chatbota?

| Cecha | Chatbot | Agent AI |
|-------|---------|----------|
| **Zachowanie** | Odpowiada na zapytania | Wykonuje autonomiczne działania |
| **Narzędzia** | Brak | Może wywoływać API, przeszukiwać, wykonywać kod |
| **Pamięć** | Tylko w sesji | Pamięć trwała między sesjami |
| **Planowanie** | Pojedyncza odpowiedź | Wieloetapowe rozumowanie |
| **Współpraca** | Jednostka | Może współpracować z innymi agentami |

### Proste porównanie

- **Chatbot** = pomocna osoba odpowiadająca na pytania na stanowisku informacji
- **Agent AI** = osobisty asystent, który może dzwonić, umawiać spotkania i realizować zadania za Ciebie

---

## 🚀 Szybki start: Wdroż swój pierwszy agenta

### Opcja 1: Szablon Agentów Foundry (zalecane)

```bash
# Inicjalizuj szablon agentów AI
azd init --template get-started-with-ai-agents

# Wdróż do Azure
azd up
```

**Co zostanie wdrożone:**
- ✅ Agenci Foundry
- ✅ Modele Microsoft Foundry (gpt-4.1)
- ✅ Azure AI Search (do RAG)
- ✅ Azure Container Apps (interfejs webowy)
- ✅ Application Insights (monitoring)

**Czas:** ~15-20 minut  
**Koszt:** ~$100-150/miesiąc (etap rozwoju)

### Opcja 2: Agent OpenAI z Prompty

```bash
# Zainicjuj szablon agenta opartego na Prompty
azd init --template agent-openai-python-prompty

# Wdróż do Azure
azd up
```

**Co zostanie wdrożone:**
- ✅ Azure Functions (serverless uruchamianie agenta)
- ✅ Modele Microsoft Foundry
- ✅ Pliki konfiguracyjne Prompty
- ✅ Przykładowa implementacja agenta

**Czas:** ~10-15 minut  
**Koszt:** ~$50-100/miesiąc (etap rozwoju)

### Opcja 3: Agent RAG Chat

```bash
# Inicjalizuj szablon czatu RAG
azd init --template azure-search-openai-demo

# Wdróż na Azure
azd up
```

**Co zostanie wdrożone:**
- ✅ Modele Microsoft Foundry
- ✅ Azure AI Search z przykładowymi danymi
- ✅ Pipeline przetwarzania dokumentów
- ✅ Interfejs czatu z cytatami

**Czas:** ~15-25 minut  
**Koszt:** ~$80-150/miesiąc (etap rozwoju)

### Opcja 4: AZD AI Agent Init (preview oparte na manifeście lub szablonie)

Jeśli masz plik manifestu agenta, możesz użyć polecenia `azd ai` do utworzenia projektu Foundry Agent Service bezpośrednio. Najnowsze wersje preview dodały także wsparcie inicjalizacji oparte na szablonach, więc dokładny przebieg prompta może się nieznacznie różnić w zależności od wersji rozszerzenia.

```bash
# Zainstaluj rozszerzenie agentów AI
azd extension install azure.ai.agents

# Opcjonalnie: zweryfikuj zainstalowaną wersję podglądową
azd extension show azure.ai.agents

# Zainicjuj z manifestu agenta
azd ai agent init -m agent-manifest.yaml

# Wdróż do Azure
azd up

# Przetestuj wdrożonego agenta (pokazuje opóźnienie + czas do pierwszego bajtu)
azd ai agent invoke
```

**Kiedy użyć `azd ai agent init` zamiast `azd init --template`:**

| Podejście | Najlepsze dla | Jak działa |
|-----------|---------------|------------|
| `azd init --template` | Start z działającą przykładową aplikacją | Klonuje cały repozytorium szablonu z kodem i infrastrukturą |
| `azd ai agent init -m` | Budowanie na bazie własnego manifestu agenta | Tworzy strukturę projektu na podstawie definicji agenta |

> **Wskazówka:** Używaj `azd init --template` podczas nauki (Opcje 1-3 powyżej). Używaj `azd ai agent init` do produkcyjnych agentów z własnymi manifestami.

Po `azd up` to samo rozszerzenie przeprowadzi Cię przez resztę cyklu życia agenta: `azd ai agent invoke` do testów, `azd ai agent eval generate` i `azd ai agent optimize` do mierzenia i poprawiania jakości oraz `azd ai agent delete` do usunięcia. Pełną referencję znajdziesz w [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

---

## 🏗️ Wzorce architektury agentów

### Wzorzec 1: Pojedynczy agent z narzędziami

Najprostszy wzorzec agenta — jeden agent korzystający z wielu narzędzi.

```mermaid
graph TD
    UI[Interfejs użytkownika] --> Agent[Agent SI<br/>gpt-4.1]
    Agent --> Search[Narzędzie wyszukiwania]
    Agent --> Database[Narzędzie bazy danych]
    Agent --> API[Narzędzie API]
```

**Najlepszy dla:**
- Boty obsługi klienta
- Asystentów badawczych
- Agentów analizy danych

**Szablon AZD:** `azure-search-openai-demo`

### Wzorzec 2: Agent RAG (Retrieval-Augmented Generation)

Agent, który pobiera istotne dokumenty przed wygenerowaniem odpowiedzi.

```mermaid
graph TD
    Query[Zapytanie użytkownika] --> RAG[Agent RAG]
    RAG --> Vector[Wyszukiwanie wektorowe]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Dokumenty --> LLM
    LLM --> Response[Odpowiedź z cytowaniami]
```

**Najlepszy dla:**
- Firmowych baz wiedzy
- Systemów Q&A dla dokumentów
- Badań zgodności i prawnych

**Szablon AZD:** `azure-search-openai-demo`

### Wzorzec 3: System wieloagentowy

Wiele wyspecjalizowanych agentów współpracujących nad złożonymi zadaniami.

```mermaid
graph TD
    Orchestrator[Agent Orkiestrator] --> Research[Agent Badawczy<br/>gpt-4.1]
    Orchestrator --> Writer[Agent Piszący<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Agent Recenzujący<br/>gpt-4.1]
```

**Najlepszy dla:**
- Złożonego generowania treści
- Wieloetapowych przepływów pracy
- Zadań wymagających różnej ekspertyzy

**Dowiedz się więcej:** [Wzorce koordynacji wieloagentowej](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfiguracja narzędzi agentów

Agenci stają się potężni, gdy mogą korzystać z narzędzi. Oto jak skonfigurować popularne narzędzia:

### Konfiguracja narzędzi w Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Zdefiniuj niestandardowe narzędzia
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# Utwórz agenta z narzędziami
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Konfiguracja środowiska

```bash
# Ustaw zmienne środowiskowe specyficzne dla agenta
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Wdróż z zaktualizowaną konfiguracją
azd deploy
```

---

## 📊 Monitorowanie agentów

### Integracja z Application Insights

Wszystkie szablony agentów AZD zawierają Application Insights do monitorowania:

```bash
# Otwórz panel monitorowania
azd monitor --overview

# Wyświetl na żywo logi
azd monitor --logs

# Wyświetl na żywo metryki
azd monitor --live
```

### Kluczowe metryki do śledzenia

| Metryka | Opis | Cel |
|---------|------|-----|
| Latencja odpowiedzi | Czas generowania odpowiedzi | < 5 sekund |
| Zużycie tokenów | Tokeny na zapytanie | Monitoruj pod kątem kosztów |
| Wskaźnik udanych wywołań narzędzi | % udanych wywołań narzędzi | > 95% |
| Wskaźnik błędów | Nieudane żądania agenta | < 1% |
| Satysfakcja użytkownika | Oceny i opinie | > 4.0/5.0 |

### Niestandardowe logowanie dla agentów

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# Skonfiguruj Azure Monitor z OpenTelemetry
configure_azure_monitor(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
)

tracer = trace.get_tracer(__name__)

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    with tracer.start_as_current_span("agent_interaction") as span:
        span.set_attributes({
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        })
```

> **Uwaga:** Zainstaluj wymagane pakiety: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 Rozważania kosztowe

### Szacowane miesięczne koszty wg wzorców

| Wzorzec | Środowisko dev | Produkcja |
|---------|----------------|-----------|
| Pojedynczy agent | $50-100 | $200-500 |
| Agent RAG | $80-150 | $300-800 |
| Wieloagentowy (2-3 agentów) | $150-300 | $500-1,500 |
| Enterprise multi-agent | $300-500 | $1,500-5,000+ |

### Wskazówki dotyczące optymalizacji kosztów

1. **Używaj gpt-4.1-mini do prostych zadań**  
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **Implementuj cache dla powtarzających się zapytań**  
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Ustaw limity tokenów na wykonanie**  
   ```python
   # Ustaw max_completion_tokens podczas uruchamiania agenta, nie podczas tworzenia
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Ogranicz długość odpowiedzi
   )
   ```

4. **Skaluj do zera, gdy nie jest używane**  
   ```bash
   # Aplikacje kontenerowe automatycznie skalują się do zera
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Rozwiązywanie problemów z agentami

### Najczęstsze problemy i rozwiązania

<details>
<summary><strong>❌ Agent nie odpowiada na wywołania narzędzi</strong></summary>

```bash
# Sprawdź, czy narzędzia są odpowiednio zarejestrowane
azd show

# Zweryfikuj wdrożenie OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Sprawdź logi agenta
azd monitor --logs
```

**Typowe przyczyny:**
- Niezgodność sygnatury funkcji narzędzia
- Brak wymaganych uprawnień
- Niedostępny endpoint API
</details>

<details>
<summary><strong>❌ Duża latencja odpowiedzi agenta</strong></summary>

```bash
# Sprawdź Application Insights pod kątem wąskich gardeł
azd monitor --live

# Rozważ użycie szybszego modelu
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**Wskazówki optymalizacyjne:**
- Używaj odpowiedzi strumieniowych
- Wprowadź caching odpowiedzi
- Zmniejsz rozmiar kontekstu
</details>

<details>
<summary><strong>❌ Agent zwraca niepoprawne lub halucynowane informacje</strong></summary>

```python
# Popraw za pomocą lepszych podpowiedzi systemowych
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Dodaj wyszukiwanie dla ugruntowania
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Ugruntuj odpowiedzi w dokumentach
)
```
</details>

<details>
<summary><strong>❌ Błędy przekroczenia limitu tokenów</strong></summary>

```python
# Zaimplementuj zarządzanie oknem kontekstu
def truncate_context(messages, max_tokens=8000, model="gpt-4.1"):
    """Keep only recent messages within token limit."""
    import tiktoken
    encoding = tiktoken.encoding_for_model(model)
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(encoding.encode(msg.content))
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Ćwiczenia praktyczne

### Ćwiczenie 1: Wdrożenie podstawowego agenta (20 minut)

**Cel:** Wdrożenie pierwszego agenta AI za pomocą AZD

```bash
# Krok 1: Inicjalizuj szablon
azd init --template get-started-with-ai-agents

# Krok 2: Zaloguj się do Azure
azd auth login
# Jeśli pracujesz w wielu dzierżawach, dodaj --tenant-id <tenant-id>

# Krok 3: Wdróż
azd up

# Krok 4: Przetestuj agenta
# Oczekiwany wynik po wdrożeniu:
#   Wdrożenie zakończone!
#   Punkt końcowy: https://<app-name>.<region>.azurecontainerapps.io
# Otwórz adres URL pokazany w wyniku i spróbuj zadać pytanie

# Krok 5: Przeglądaj monitoring
azd monitor --overview

# Krok 6: Sprzątanie
azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Agent odpowiada na pytania
- [ ] Dostęp do pulpitu monitoringu przez `azd monitor`
- [ ] Zasoby zostały poprawnie usunięte

### Ćwiczenie 2: Dodanie niestandardowego narzędzia (30 minut)

**Cel:** Rozszerzenie agenta o niestandardowe narzędzie

1. Wdroż szablon agenta:  
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Stwórz nową funkcję narzędzia w kodzie agenta:  
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Wywołanie API do usługi pogodowej
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Zarejestruj narzędzie w agencie:  
   ```python
   from azure.ai.projects.models import FunctionTool

   weather_tool = FunctionTool(
       name="get_weather",
       description="Get current weather for a location",
       parameters={
           "type": "object",
           "properties": {
               "location": {"type": "string", "description": "City name"}
           },
           "required": ["location"]
       }
   )

   agent = project_client.agents.create_agent(
       model="gpt-4.1",
       name="Weather Agent",
       tools=[weather_tool]
   )
   ```
4. Wdroż ponownie i przetestuj:  
   ```bash
   azd deploy
   # Zapytaj: "Jaka jest pogoda w Seattle?"
   # Oczekiwane: Agent wywołuje get_weather("Seattle") i zwraca informacje o pogodzie
   ```

**Kryteria sukcesu:**
- [ ] Agent rozpoznaje pytania związane z pogodą
- [ ] Narzędzie jest wywoływane poprawnie
- [ ] Odpowiedzi zawierają informacje o pogodzie

### Ćwiczenie 3: Budowa agenta RAG (45 minut)

**Cel:** Stworzenie agenta odpowiadającego na podstawie Twoich dokumentów

```bash
# Krok 1: Wdróż szablon RAG
azd init --template azure-search-openai-demo
azd up

# Krok 2: Prześlij swoje dokumenty
# Umieść pliki PDF/TXT w katalogu data/, a następnie uruchom:
python scripts/prepdocs.py

# Krok 3: Przetestuj za pomocą pytań specyficznych dla domeny
# Otwórz adres URL aplikacji internetowej z wyniku azd up
# Zadawaj pytania dotyczące przesłanych dokumentów
# Odpowiedzi powinny zawierać odniesienia cytatów, takie jak [doc.pdf]
```

**Kryteria sukcesu:**
- [ ] Agent odpowiada na podstawie przesłanych dokumentów
- [ ] Odpowiedzi zawierają cytaty
- [ ] Brak halucynacji dla pytań poza zakresem

---

## 📚 Kolejne kroki

Teraz, gdy znasz agentów AI, poznaj te zaawansowane tematy:

| Temat | Opis | Link |
|-------|-------|------|
| **Systemy wieloagentowe** | Buduj systemy z wieloma współpracującymi agentami | [Przykład wieloagentowy z retail](../../examples/retail-scenario.md) |
| **Wzorce koordynacji** | Poznaj wzorce orkiestracji i komunikacji | [Wzorce koordynacji](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Wdrożenie produkcyjne** | Wdrożenie agentów na poziomie enterprise | [Praktyki AI w produkcji](../chapter-08-production/production-ai-practices.md) |
| **Ocena agenta** | Testuj i oceniaj wydajność agentów | [Rozwiązywanie problemów AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **Laboratorium warsztatowe AI** | Praktyka: przygotuj swoje rozwiązanie AI do AZD | [Laboratorium AI](ai-workshop-lab.md) |

---

## 📖 Dodatkowe zasoby

### Oficjalna dokumentacja
- [Microsoft Foundry Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry Agent Service Szybki start](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### Szablony AZD dla agentów
- [Pierwsze kroki z agentami AI](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Zasoby społeczności
- [Awesome AZD - Szablony agentów](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Discord Azure AI](https://discord.gg/microsoft-azure)
- [Discord Microsoft Foundry](https://discord.gg/nTYy5BXMWG)

### Umiejętności agentów dla Twojego edytora
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) – Zainstaluj wielokrotnego użytku umiejętności agentów AI dla developmentu Azure w GitHub Copilot, Cursor lub dowolnym obsługującym agenta. Zawiera umiejętności dla [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [wdrożeń](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) oraz [diagnostyki](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):  
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Nawigacja**
- **Poprzednia lekcja:** [Integracja Microsoft Foundry](microsoft-foundry-integration.md)
- **Następna lekcja:** [Wdrażanie modelu AI](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->