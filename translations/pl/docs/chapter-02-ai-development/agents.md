# Agentki AI z Azure Developer CLI

**Nawigacja po rozdziałach:**
- **📚 Strona kursu**: [AZD For Beginners](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 2 - Rozwój zorientowany na AI
- **⬅️ Poprzedni**: [Wdrażanie modeli AI](ai-model-deployment.md)
- **➡️ Następny**: [Praktyki AI w produkcji](production-ai-practices.md)
- **🚀 Zaawansowane**: [Rozwiązania wieloagentowe](../../examples/retail-scenario.md)

---

## Wprowadzenie

Agentki AI to autonomiczne programy, które potrafią postrzegać swoje otoczenie, podejmować decyzje i wykonywać działania w celu osiągnięcia określonych celów. W przeciwieństwie do prostych chatbotów odpowiadających na polecenia, agentki mogą:

- **Używać narzędzi** - Wywoływać API, przeszukiwać bazy danych, wykonywać kod
- **Planować i rozumować** - Dzielić złożone zadania na kroki
- **Uczyć się z kontekstu** - Utrzymywać pamięć i dostosowywać zachowanie
- **Współpracować** - Pracować z innymi agentami (systemy wieloagentowe)

Ten przewodnik pokazuje, jak wdrożyć agentki AI w Azure przy użyciu Azure Developer CLI (azd).

## Cele nauki

Po ukończeniu tego przewodnika będziesz:
- Rozumieć, czym są agentki AI i jak różnią się od chatbotów
- Wdrażać gotowe szablony agentów przy użyciu AZD
- Konfigurować Foundry Agents dla niestandardowych agentów
- Implementować podstawowe wzorce agentów (użycie narzędzi, RAG, multi-agent)
- Monitorować i debugować wdrożone agentki

## Efekty nauczania

Po ukończeniu będziesz potrafił:
- Wdrożyć aplikacje agentów AI do Azure jednym poleceniem
- Konfigurować narzędzia i możliwości agentów
- Zaimplementować retrieval-augmented generation (RAG) z agentami
- Projektować architektury wieloagentowe dla złożonych przepływów pracy
- Rozwiązywać typowe problemy z wdrożeniem agentów

---

## 🤖 Czym agent różni się od chatbota?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Zachowanie** | Odpowiada na polecenia | Podejmuje autonomiczne działania |
| **Narzędzia** | Brak | Może wywoływać API, przeszukiwać, wykonywać kod |
| **Pamięć** | Tylko sesyjna | Trwała pamięć między sesjami |
| **Planowanie** | Pojedyncza odpowiedź | Wieloetapowe rozumowanie |
| **Współpraca** | Pojedynczy podmiot | Może współpracować z innymi agentami |

### Prosta analogia

- **Chatbot** = Osoba przy punkcie informacyjnym odpowiadająca na pytania
- **Agent AI** = Asystent osobisty, który może dzwonić, umawiać spotkania i wykonywać zadania za ciebie

---

## 🚀 Szybki start: Wdróż swoją pierwszą agentkę

### Opcja 1: Szablon Foundry Agents (zalecane)

```bash
# Inicjalizuj szablon agentów AI
azd init --template get-started-with-ai-agents

# Wdróż do Azure
azd up
```

**Co zostanie wdrożone:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (dla RAG)
- ✅ Azure Container Apps (interfejs webowy)
- ✅ Application Insights (monitorowanie)

**Czas:** ~15-20 minut
**Koszt:** ~$100-150/miesiąc (środowisko deweloperskie)

### Opcja 2: Agent OpenAI z Prompty

```bash
# Zainicjuj szablon agenta oparty na Prompty
azd init --template agent-openai-python-prompty

# Wdróż do Azure
azd up
```

**Co zostanie wdrożone:**
- ✅ Azure Functions (bezserwerowe uruchamianie agenta)
- ✅ Azure OpenAI
- ✅ Pliki konfiguracyjne Prompty
- ✅ Przykładowa implementacja agenta

**Czas:** ~10-15 minut
**Koszt:** ~$50-100/miesiąc (środowisko deweloperskie)

### Opcja 3: RAG Chat Agent

```bash
# Zainicjalizuj szablon czatu RAG
azd init --template azure-search-openai-demo

# Wdróż na platformę Azure
azd up
```

**Co zostanie wdrożone:**
- ✅ Azure OpenAI
- ✅ Azure AI Search z przykładowymi danymi
- ✅ Potok przetwarzania dokumentów
- ✅ Interfejs czatu z cytowaniami

**Czas:** ~15-25 minut
**Koszt:** ~$80-150/miesiąc (środowisko deweloperskie)

---

## 🏗️ Wzorce architektury agentów

### Wzorzec 1: Pojedynczy agent z narzędziami

Najprostszy wzorzec agenta - jeden agent, który może korzystać z wielu narzędzi.

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**Najlepsze zastosowania:**
- Boty obsługi klienta
- Asystenci badawczy
- Agenci analizy danych

**Szablon AZD:** `azure-search-openai-demo`

### Wzorzec 2: Agent RAG (Retrieval-Augmented Generation)

Agent, który najpierw pobiera istotne dokumenty przed wygenerowaniem odpowiedzi.

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**Najlepsze zastosowania:**
- Bazy wiedzy przedsiębiorstwa
- Systemy Q&A dla dokumentów
- Badania prawne i zgodności

**Szablon AZD:** `azure-search-openai-demo`

### Wzorzec 3: System wieloagentowy

Wiele wyspecjalizowanych agentów współpracujących nad złożonymi zadaniami.

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**Najlepsze zastosowania:**
- Złożone generowanie treści
- Wieloetapowe przepływy pracy
- Zadania wymagające różnych specjalizacji

**Dowiedz się więcej:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Konfigurowanie narzędzi agenta

Agentki stają się potężne, gdy mogą używać narzędzi. Oto jak skonfigurować typowe narzędzia:

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
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Konfiguracja środowiska

```bash
# Skonfiguruj zmienne środowiskowe specyficzne dla agenta
azd env set AZURE_OPENAI_MODEL "gpt-4o"
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

# Wyświetl logi na żywo
azd monitor --logs

# Wyświetl metryki na żywo
azd monitor --live
```

### Kluczowe metryki do śledzenia

| Metryka | Opis | Cel |
|--------|-------------|--------|
| Opóźnienie odpowiedzi | Czas generowania odpowiedzi | < 5 sekund |
| Użycie tokenów | Tokeny na żądanie | Monitorować koszty |
| Wskaźnik powodzenia wywołań narzędzi | % pomyślnych wykonanych wywołań narzędzi | > 95% |
| Wskaźnik błędów | Nieudane żądania agentów | < 1% |
| Satysfakcja użytkownika | Oceny zwrotne | > 4.0/5.0 |

### Niestandardowe logowanie dla agentów

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 Rozważania dotyczące kosztów

### Szacowane miesięczne koszty według wzorca

| Wzorzec | Środowisko deweloperskie | Produkcja |
|---------|-----------------|------------|
| Pojedynczy agent | $50-100 | $200-500 |
| Agent RAG | $80-150 | $300-800 |
| Wieloagentowy (2-3 agentów) | $150-300 | $500-1,500 |
| Wieloagentowy dla przedsiębiorstw | $300-500 | $1,500-5,000+ |

### Wskazówki optymalizacji kosztów

1. **Używaj GPT-4o-mini do prostych zadań**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Zaimplementuj buforowanie dla powtarzających się zapytań**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Ustaw limity tokenów**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Ogranicz długość odpowiedzi
   )
   ```

4. **Skaluj do zera, gdy nie jest używane**
   ```bash
   # Container Apps automatycznie skalują się do zera
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
- Niezgodność sygnatury funkcji narzędzia
- Brak wymaganych uprawnień
- Punkt końcowy API niedostępny
</details>

<details>
<summary><strong>❌ Wysokie opóźnienia w odpowiedziach agenta</strong></summary>

```bash
# Sprawdź Application Insights pod kątem wąskich gardeł
azd monitor --live

# Rozważ użycie szybszego modelu
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Wskazówki optymalizacyjne:**
- Używaj strumieniowanych odpowiedzi
- Wdróż buforowanie odpowiedzi
- Zmniejsz rozmiar okna kontekstu
</details>

<details>
<summary><strong>❌ Agent zwraca niepoprawne lub zmyślone informacje</strong></summary>

```python
# Ulepsz za pomocą lepszych promptów systemowych
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Dodaj mechanizm wyszukiwania do osadzenia w źródłach
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Osadź odpowiedzi w dokumentach
)
```
</details>

<details>
<summary><strong>❌ Błędy przekroczenia limitu tokenów</strong></summary>

```python
# Zaimplementuj zarządzanie oknem kontekstu
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Orientacyjne oszacowanie
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Ćwiczenia praktyczne

### Ćwiczenie 1: Wdróż podstawowego agenta (20 minut)

**Cel:** Wdróż swoją pierwszą agentkę AI używając AZD

```bash
# Krok 1: Zainicjalizuj szablon
azd init --template get-started-with-ai-agents

# Krok 2: Zaloguj się do Azure
azd auth login

# Krok 3: Wdróż
azd up

# Krok 4: Przetestuj agenta
# Otwórz adres URL pokazany w wyjściu

# Krok 5: Posprzątaj
azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Agent odpowiada na pytania
- [ ] Ma dostęp do panelu monitoringu
- [ ] Zasoby zostały poprawnie posprzątane

### Ćwiczenie 2: Dodaj niestandardowe narzędzie (30 minut)

**Cel:** Rozszerz agenta o niestandardowe narzędzie

1. Wdróż szablon agenta
2. Utwórz nową funkcję narzędzia:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Wywołanie API usługi pogodowej
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Zarejestruj narzędzie z agentem
4. Przetestuj, czy agent używa nowego narzędzia

**Kryteria sukcesu:**
- [ ] Agent rozpoznaje zapytania dotyczące pogody
- [ ] Narzędzie jest wywoływane prawidłowo
- [ ] Odpowiedź zawiera informacje o pogodzie

### Ćwiczenie 3: Zbuduj agenta RAG (45 minut)

**Cel:** Stwórz agenta, który odpowiada na pytania z twoich dokumentów

```bash
# Wdróż szablon RAG
azd init --template azure-search-openai-demo
azd up

# Prześlij swoje dokumenty
# (Postępuj zgodnie z przewodnikiem szablonu dotyczącym importowania danych)

# Przetestuj za pomocą pytań specyficznych dla domeny
```

**Kryteria sukcesu:**
- [ ] Agent odpowiada na podstawie przesłanych dokumentów
- [ ] Odpowiedzi zawierają cytowania
- [ ] Brak zmyśleń w pytaniach poza zakresem

---

## 📚 Kolejne kroki

Teraz, gdy rozumiesz agentki AI, zbadaj te zaawansowane tematy:

| Temat | Opis | Link |
|-------|-------------|------|
| **Systemy wieloagentowe** | Buduj systemy z wieloma współpracującymi agentami | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Wzorce koordynacji** | Poznaj wzorce orkiestracji i komunikacji | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Wdrażanie produkcyjne** | Wdrażanie agentów gotowych do użytku przedsiębiorstwa | [Praktyki AI w produkcji](production-ai-practices.md) |
| **Ocena agentów** | Testuj i oceniaj wydajność agentów | [Rozwiązywanie problemów z AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Dodatkowe zasoby

### Oficjalna dokumentacja
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Szablony AZD dla agentów
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Zasoby społeczności
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Nawigacja**
- **Poprzednia lekcja**: [Wdrażanie modeli AI](ai-model-deployment.md)
- **Następna lekcja**: [Praktyki AI w produkcji](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Ten dokument został przetłumaczony przy użyciu usługi tłumaczeń wspomaganej sztuczną inteligencją [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dokładamy wszelkich starań, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku powinien być uznany za źródło autorytatywne. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->