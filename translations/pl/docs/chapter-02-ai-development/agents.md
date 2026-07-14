# Agenci AI z Azure Developer CLI

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 2 - Rozwój z podejściem AI-First
- **⬅️ Poprzedni**: [Integracja Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Następny**: [Wdrażanie modelu AI](ai-model-deployment.md)
- **🚀 Zaawansowane**: [Rozwiązania wieloagentowe](../../examples/retail-scenario.md)

---

## Wprowadzenie

Agenci AI to autonomiczne programy, które mogą postrzegać swoje otoczenie, podejmować decyzje i wykonywać działania, aby osiągnąć określone cele. W przeciwieństwie do prostych chatbotów odpowiadających na zapytania, agenci mogą:

- **Korzystać z narzędzi** - Wywoływać API, przeszukiwać bazy danych, wykonywać kod
- **Planować i rozumować** - Rozbijać złożone zadania na kroki
- **Uczyć się z kontekstu** - Utrzymywać pamięć i dostosowywać zachowanie
- **Współpracować** - Pracować z innymi agentami (systemy wieloagentowe)

Ten przewodnik pokazuje, jak wdrażać agentów AI w Azure za pomocą Azure Developer CLI (azd).

> **Notatka walidacyjna (2026-07-13):** Przewodnik został zweryfikowany z wersjami `azd` `1.27.1` i `azure.ai.agents` `1.0.0-beta.5`. Doświadczenie `azd ai` jest nadal w fazie podglądu, więc sprawdź pomoc rozszerzenia, jeśli Twoje zainstalowane flagi różnią się.

## Cele nauki

Po ukończeniu tego przewodnika będziesz:
- Rozumieć, czym są agenci AI i jak różnią się od chatbotów
- Wdrażać gotowe szablony agentów AI za pomocą AZD
- Konfigurować Foundry Agents dla agentów niestandardowych
- Implementować podstawowe wzorce agentów (użycie narzędzi, RAG, multi-agent)
- Monitorować i debugować wdrożonych agentów

## Efekty nauki

Po ukończeniu będziesz w stanie:
- Wdrażać aplikacje agentów AI do Azure za pomocą jednego polecenia
- Konfigurować narzędzia i możliwości agentów
- Implementować generowanie wspomagane wyszukiwaniem (RAG) z agentami
- Projektować architektury wieloagentowe dla złożonych przepływów pracy
- Rozwiązywać typowe problemy z wdrożeniem agentów

---

## 🤖 Co odróżnia agenta od chatbota?

| Cecha | Chatbot | Agent AI |
|---------|---------|----------|
| **Zachowanie** | Odpowiada na zapytania | Podejmuje autonomiczne działania |
| **Narzędzia** | Brak | Może wywoływać API, wyszukiwać, wykonywać kod |
| **Pamięć** | Tylko sesyjna | Trwała pamięć między sesjami |
| **Planowanie** | Pojedyncza odpowiedź | Wieloetapowe rozumowanie |
| **Współpraca** | Pojedyncza jednostka | Może współpracować z innymi agentami |

### Prosta analogia

- **Chatbot** = Pomocna osoba odpowiadająca na pytania przy punkcie informacyjnym
- **Agent AI** = Asystent osobisty, który może wykonywać telefony, rezerwować spotkania i realizować zadania za Ciebie

---

## 🚀 Szybki start: Wdróż swojego pierwszego agenta

### Opcja 1: Szablon Foundry Agents (zalecane)

```bash
# Inicjalizuj szablon agentów AI
azd init --template get-started-with-ai-agents

# Wdróż do Azure
azd up
```

**Co zostanie wdrożone:**
- ✅ Foundry Agents
- ✅ Modele Microsoft Foundry (gpt-4.1)
- ✅ Azure AI Search (dla RAG)
- ✅ Azure Container Apps (interfejs webowy)
- ✅ Application Insights (monitoring)

**Czas:** ~15-20 minut
**Koszt:** ~$100-150/miesiąc (rozwój)

### Opcja 2: Agent OpenAI z Prompty

```bash
# Zainicjuj szablon agenta opartego na Prompty
azd init --template agent-openai-python-prompty

# Wdróż do Azure
azd up
```

**Co zostanie wdrożone:**
- ✅ Azure Functions (bezserwerowe wykonanie agenta)
- ✅ Modele Microsoft Foundry
- ✅ Pliki konfiguracyjne Prompty
- ✅ Przykładowa implementacja agenta

**Czas:** ~10-15 minut
**Koszt:** ~$50-100/miesiąc (rozwój)

### Opcja 3: Agent RAG Chat

```bash
# Inicjalizuj szablon czatu RAG
azd init --template azure-search-openai-demo

# Wdróż do Azure
azd up
```

**Co zostanie wdrożone:**
- ✅ Modele Microsoft Foundry
- ✅ Azure AI Search z przykładowymi danymi
- ✅ Pipeline przetwarzania dokumentów
- ✅ Interfejs czatu z cytowaniami

**Czas:** ~15-25 minut
**Koszt:** ~$80-150/miesiąc (rozwój)

### Opcja 4: Inicjalizacja agenta AI AZD (podgląd na podstawie manifestu lub szablonu)

Jeśli posiadasz plik manifestu agenta, możesz użyć polecenia `azd ai` do bezpośredniego wygenerowania projektu Foundry Agent Service. Ostatnie wersje podglądowe dodały także obsługę inicjalizacji na podstawie szablonów, więc dokładny przebieg poleceń może się nieco różnić w zależności od wersji rozszerzenia.

```bash
# Zainstaluj rozszerzenie agentów AI
azd extension install azure.ai.agents

# Opcjonalnie: zweryfikuj zainstalowaną wersję podglądową
azd extension show azure.ai.agents

# Inicjalizuj na podstawie manifestu agenta
azd ai agent init -m agent-manifest.yaml

# Wdróż do Azure
azd up

# Przetestuj wdrożonego agenta (pokazuje opóźnienie + czas do pierwszego bajtu)
azd ai agent invoke
```

**Kiedy używać `azd ai agent init` zamiast `azd init --template`:**

| Podejście | Najlepsze dla | Jak to działa |
|----------|--------------|--------------|
| `azd init --template` | Rozpoczęcie od działającej przykładowej aplikacji | Klonuje pełne repozytorium szablonu z kodem i infrastrukturą |
| `azd ai agent init -m` | Budowanie na podstawie własnego manifestu agenta | Generuje strukturę projektu według definicji agenta |

> **Wskazówka:** Używaj `azd init --template` podczas nauki (opcje 1-3 powyżej). Używaj `azd ai agent init` podczas tworzenia agentów produkcyjnych z własnymi manifestami.

Po `azd up` to samo rozszerzenie przeprowadzi Cię przez resztę cyklu życia agenta: `azd ai agent invoke` do testowania, `azd ai agent eval generate` i `azd ai agent optimize` do pomiaru i poprawy jakości oraz `azd ai agent delete` do sprzątania. Zobacz [Polecenia AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) dla pełnej referencji.

---

## 🏗️ Wzorce architektury agentów

### Wzorzec 1: Pojedynczy agent z narzędziami

Najprostszy wzorzec agenta - jeden agent, który może korzystać z wielu narzędzi.

```mermaid
graph TD
    UI[Interfejs użytkownika] --> Agent[Agent AI<br/>gpt-4.1]
    Agent --> Search[Narzędzie wyszukiwania]
    Agent --> Database[Narzędzie bazy danych]
    Agent --> API[Narzędzie API]
```

**Najlepszy dla:**
- Botów wsparcia klienta
- Asystentów badań
- Agentów analizy danych

**Szablon AZD:** `azure-search-openai-demo`

### Wzorzec 2: Agent RAG (Generowanie wspomagane wyszukiwaniem)

Agent, który wyszukuje odpowiednie dokumenty przed generowaniem odpowiedzi.

```mermaid
graph TD
    Query[Zapytanie użytkownika] --> RAG[Agent RAG]
    RAG --> Vector[Wyszukiwanie wektorowe]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Documents --> LLM
    LLM --> Response[Odpowiedź z cytatami]
```

**Najlepszy dla:**
- Korporacyjnych baz wiedzy
- Systemów pytań i odpowiedzi na dokumenty
- Badań prawniczych i zgodności

**Szablon AZD:** `azure-search-openai-demo`

### Wzorzec 3: System wieloagentowy

Wielu wyspecjalizowanych agentów współpracujących nad złożonymi zadaniami.

```mermaid
graph TD
    Orchestrator[Agent Orkiestrator] --> Research[Agent Badawczy<br/>gpt-4.1]
    Orchestrator --> Writer[Agent Pisarza<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Agent Recenzent<br/>gpt-4.1]
```

**Najlepszy dla:**
- Złożone generowanie treści
- Wieloetapowe przepływy pracy
- Zadań wymagających różnej ekspertyzy

**Dowiedz się więcej:** [Wzorce koordynacji wieloagentowej](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfiguracja narzędzi agenta

Agenci stają się potężni, gdy mogą korzystać z narzędzi. Oto jak konfigurować najczęstsze narzędzia:

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
# Otwórz panel monitoringu
azd monitor --overview

# Wyświetl na żywo logi
azd monitor --logs

# Wyświetl na żywo metryki
azd monitor --live
```

### Kluczowe metryki do śledzenia

| Metryka | Opis | Cel |
|--------|-------------|--------|
| Opóźnienie odpowiedzi | Czas generowania odpowiedzi | < 5 sekund |
| Zużycie tokenów | Tokeny na zapytanie | Monitoruj koszty |
| Skuteczność wywołań narzędzi | % udanych wywołań narzędzi | > 95% |
| Wskaźnik błędów | Nieudane zapytania agenta | < 1% |
| Satysfakcja użytkownika | Wyniki opinii | > 4.0/5.0 |

### Niestandardowe logowanie dla agentów

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# Konfiguracja Azure Monitor z OpenTelemetry
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

> **Uwaga:** Zainstaluj potrzebne pakiety: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 Rozważania kosztowe

### Szacowane koszty miesięczne wg wzorca

| Wzorzec | Środowisko deweloperskie | Produkcja |
|---------|-------------------------|------------|
| Pojedynczy agent | $50-100 | $200-500 |
| Agent RAG | $80-150 | $300-800 |
| Multi-agent (2-3 agentów) | $150-300 | $500-1,500 |
| Enterprise Multi-agent | $300-500 | $1,500-5,000+ |

### Wskazówki optymalizacyjne kosztów

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

3. **Ustaw limity tokenów na każde wywołanie**
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
   # Aplikacje kontenerowe skalują się automatycznie do zera
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Rozwiązywanie problemów z agentami

### Typowe problemy i rozwiązania

<details>
<summary><strong>❌ Agent nie odpowiada na wywołania narzędzi</strong></summary>

```bash
# Sprawdź, czy narzędzia są poprawnie zarejestrowane
azd show

# Zweryfikuj wdrożenie OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Sprawdź logi agenta
azd monitor --logs
```

**Typowe przyczyny:**
- Niedopasowanie sygnatury funkcji narzędzia
- Brak wymaganych uprawnień
- Niedostępny endpoint API
</details>

<details>
<summary><strong>❌ Wysokie opóźnienia w odpowiedziach agenta</strong></summary>

```bash
# Sprawdź Application Insights pod kątem wąskich gardeł
azd monitor --live

# Rozważ użycie szybszego modelu
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**Wskazówki optymalizacyjne:**
- Używaj odpowiedzi strumieniowych
- Implementuj cache odpowiedzi
- Zmniejsz rozmiar okna kontekstowego
</details>

<details>
<summary><strong>❌ Agent zwraca nieprawidłowe lub halucynowane informacje</strong></summary>

```python
# Ulepsz za pomocą lepszych podpowiedzi systemowych
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
# Implementuj zarządzanie oknem kontekstu
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
# Krok 1: Inicjalizacja szablonu
azd init --template get-started-with-ai-agents

# Krok 2: Zaloguj się do Azure
azd auth login
# Jeśli pracujesz w różnych dzierżawach, dodaj --tenant-id <tenant-id>

# Krok 3: Wdróż
azd up

# Krok 4: Przetestuj agenta
# Oczekiwany wynik po wdrożeniu:
#   Wdrożenie zakończone!
#   Punkt końcowy: https://<app-name>.<region>.azurecontainerapps.io
# Otwórz URL pokazany w wyniku i spróbuj zadać pytanie

# Krok 5: Przeglądaj monitoring
azd monitor --overview

# Krok 6: Sprzątanie
azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Agent odpowiada na pytania
- [ ] Możliwość dostępu do panelu monitorowania przez `azd monitor`
- [ ] Zasoby zostały poprawnie posprzątane

### Ćwiczenie 2: Dodanie niestandardowego narzędzia (30 minut)

**Cel:** Rozszerzenie agenta o niestandardowe narzędzie

1. Wdróż szablon agenta:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Utwórz nową funkcję narzędzia w kodzie agenta:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Wywołanie API do serwisu pogodowego
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
4. Wdroż i przetestuj ponownie:
   ```bash
   azd deploy
   # Zapytaj: "Jaka jest pogoda w Seattle?"
   # Oczekiwane: Agent wywołuje get_weather("Seattle") i zwraca informacje o pogodzie
   ```

**Kryteria sukcesu:**
- [ ] Agent rozpoznaje zapytania związane z pogodą
- [ ] Narzędzie jest wywoływane prawidłowo
- [ ] Odpowiedź zawiera informacje pogodowe

### Ćwiczenie 3: Budowa agenta RAG (45 minut)

**Cel:** Stworzenie agenta odpowiadającego na pytania z twoich dokumentów

```bash
# Krok 1: Wdróż szablon RAG
azd init --template azure-search-openai-demo
azd up

# Krok 2: Prześlij swoje dokumenty
# Umieść pliki PDF/TXT w katalogu data/, następnie uruchom:
python scripts/prepdocs.py

# Krok 3: Testuj z pytaniami specyficznymi dla domeny
# Otwórz URL aplikacji webowej z wyników azd up
# Zadawaj pytania dotyczące przesłanych dokumentów
# Odpowiedzi powinny zawierać odwołania do cytowanych źródeł w formacie [doc.pdf]
```

**Kryteria sukcesu:**
- [ ] Agent odpowiada na podstawie przesłanych dokumentów
- [ ] Odpowiedzi zawierają cytaty
- [ ] Brak halucynacji przy pytaniach spoza zakresu

---

## 📚 Kolejne kroki

Teraz, gdy rozumiesz agentów AI, poznaj te zaawansowane tematy:

| Temat | Opis | Link |
|-------|-------------|------|
| **Systemy wieloagentowe** | Budowa systemów z wieloma współpracującymi agentami | [Przykład wieloagentowy w handlu detalicznym](../../examples/retail-scenario.md) |
| **Wzorce koordynacji** | Nauka wzorców orkiestracji i komunikacji | [Wzorce koordynacji](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Wdrożenie produkcyjne** | Wdrożenie agentów do użytku w przedsiębiorstwie | [Praktyki AI w produkcji](../chapter-08-production/production-ai-practices.md) |
| **Ewaluacja agentów** | Testowanie i ocena wydajności agentów | [Rozwiązywanie problemów AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **Laboratorium AI** | Praktyczne: przygotuj swoje rozwiązanie AI do AZD | [Laboratorium AI](ai-workshop-lab.md) |

---

## 📖 Dodatkowe zasoby

### Oficjalna dokumentacja
- [Microsoft Foundry Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### Szablony AZD dla agentów
- [Rozpocznij przygodę z agentami AI](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Społecznościowe zasoby
- [Awesome AZD - szablony agentów](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Umiejętności agentów dla Twojego edytora
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Zainstaluj wielokrotnie używane umiejętności agentów AI do tworzenia w Azure w GitHub Copilot, Cursor lub dowolnym obsługiwanym agencie. Zawiera umiejętności dla [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [wdrażania](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) oraz [diagnostyki](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Nawigacja**
- **Poprzednia lekcja**: [Integracja Microsoft Foundry](microsoft-foundry-integration.md)
- **Następna lekcja**: [Wdrażanie modelu AI](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->