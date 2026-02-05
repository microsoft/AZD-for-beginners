# Wzorce Koordynacji Wieloagentowej

⏱️ **Szacowany czas**: 60-75 minut | 💰 **Szacowany koszt**: ~$100-300/miesiąc | ⭐ **Złożoność**: Zaawansowana

**📚 Ścieżka nauki:**
- ← Poprzedni: [Planowanie pojemności](capacity-planning.md) - Strategie rozmiarowania i skalowania zasobów
- 🎯 **Tu jesteś**: Wzorce koordynacji wieloagentowej (Orkiestracja, komunikacja, zarządzanie stanem)
- → Następny: [Wybór SKU](sku-selection.md) - Wybór odpowiednich usług Azure
- 🏠 [Strona główna kursu](../../README.md)

---

## Czego się nauczysz

Po ukończeniu tej lekcji:
- Zrozumiesz **architekturę wieloagentową** i kiedy ją stosować
- Zaimplementujesz **wzorce orkiestracji** (scentralizowane, zdecentralizowane, hierarchiczne)
- Zaprojektujesz strategie **komunikacji agentów** (synchronizacja, asynchronizacja, sterowanie zdarzeniami)
- Zarządzisz **wspólnym stanem** w rozproszonych agentach
- Wdrożysz **systemy wieloagentowe** na Azure z AZD
- Zastosujesz **wzorce koordynacji** w rzeczywistych scenariuszach AI
- Monitorujesz i debugujesz rozproszone systemy agentów

## Dlaczego koordynacja wieloagentowa jest ważna

### Ewolucja: Od pojedynczego agenta do systemu wieloagentowego

**Pojedynczy agent (Prosty):**
```
User → Agent → Response
```
- ✅ Łatwy do zrozumienia i wdrożenia
- ✅ Szybki w prostych zadaniach
- ❌ Ograniczony możliwościami jednego modelu
- ❌ Brak możliwości równoległego wykonywania złożonych zadań
- ❌ Brak specjalizacji

**System wieloagentowy (Zaawansowany):**
```
           ┌─────────────┐
           │ Orchestrator│
           └──────┬──────┘
        ┌─────────┼─────────┐
        │         │         │
    ┌───▼──┐  ┌──▼───┐  ┌──▼────┐
    │Agent1│  │Agent2│  │Agent3 │
    │(Plan)│  │(Code)│  │(Review)│
    └──────┘  └──────┘  └───────┘
```
- ✅ Specjalizowani agenci do konkretnych zadań
- ✅ Równoległe wykonywanie dla szybkości
- ✅ Modułowy i łatwy w utrzymaniu
- ✅ Lepszy w złożonych przepływach pracy
- ⚠️ Wymaga logiki koordynacji

**Analogia**: Pojedynczy agent to jak jedna osoba wykonująca wszystkie zadania. System wieloagentowy to jak zespół, w którym każdy członek ma specjalistyczne umiejętności (badacz, programista, recenzent, pisarz) i współpracuje.

---

## Główne wzorce koordynacji

### Wzorzec 1: Koordynacja sekwencyjna (Łańcuch odpowiedzialności)

**Kiedy używać**: Zadania muszą być wykonywane w określonej kolejności, każdy agent bazuje na wynikach poprzedniego.

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as Agent Badawczy
    participant Agent2 as Agent Pisarski
    participant Agent3 as Agent Redaktor
    
    User->>Orchestrator: "Napisz artykuł o AI"
    Orchestrator->>Agent1: Zbadaj temat
    Agent1-->>Orchestrator: Wyniki badań
    Orchestrator->>Agent2: Napisz szkic (używając badań)
    Agent2-->>Orchestrator: Szkic artykułu
    Orchestrator->>Agent3: Edytuj i popraw
    Agent3-->>Orchestrator: Ostateczny artykuł
    Orchestrator-->>User: Dopracowany artykuł
    
    Note over User,Agent3: Sekwencyjnie: Każdy krok czeka na poprzedni
```
**Korzyści:**
- ✅ Jasny przepływ danych
- ✅ Łatwy do debugowania
- ✅ Przewidywalna kolejność wykonania

**Ograniczenia:**
- ❌ Wolniejszy (brak równoległości)
- ❌ Jedna awaria blokuje cały łańcuch
- ❌ Nie radzi sobie z zadaniami współzależnymi

**Przykłady użycia:**
- Pipeline tworzenia treści (badanie → pisanie → edycja → publikacja)
- Generowanie kodu (planowanie → implementacja → testowanie → wdrożenie)
- Generowanie raportów (zbieranie danych → analiza → wizualizacja → podsumowanie)

---

### Wzorzec 2: Koordynacja równoległa (Fan-Out/Fan-In)

**Kiedy używać**: Niezależne zadania mogą być wykonywane jednocześnie, wyniki są łączone na końcu.

```mermaid
graph TB
    User[Żądanie użytkownika]
    Orchestrator[Orkiestrator]
    Agent1[Agent analizy]
    Agent2[Agent badań]
    Agent3[Agent danych]
    Aggregator[Agregator wyników]
    Response[Połączona odpowiedź]
    
    User --> Orchestrator
    Orchestrator --> Agent1
    Orchestrator --> Agent2
    Orchestrator --> Agent3
    Agent1 --> Aggregator
    Agent2 --> Aggregator
    Agent3 --> Aggregator
    Aggregator --> Response
    
    style Orchestrator fill:#2196F3,stroke:#1976D2,stroke-width:3px,color:#fff
    style Aggregator fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
**Korzyści:**
- ✅ Szybkość (równoległe wykonanie)
- ✅ Odporność na awarie (akceptowalne częściowe wyniki)
- ✅ Skalowalność pozioma

**Ograniczenia:**
- ⚠️ Wyniki mogą przychodzić w nieodpowiedniej kolejności
- ⚠️ Wymagana logika agregacji
- ⚠️ Złożone zarządzanie stanem

**Przykłady użycia:**
- Zbieranie danych z wielu źródeł (API + bazy danych + web scraping)
- Analiza konkurencyjna (wiele modeli generuje rozwiązania, wybierane jest najlepsze)
- Usługi tłumaczeniowe (tłumaczenie na wiele języków jednocześnie)

---

### Wzorzec 3: Koordynacja hierarchiczna (Manager-Worker)

**Kiedy używać**: Złożone przepływy pracy z podzadaniami, wymagana delegacja.

```mermaid
graph TB
    Master[Mistrz Orkiestrator]
    Manager1[Kierownik Badań]
    Manager2[Kierownik Treści]
    W1[Skrobak Sieciowy]
    W2[Analizator Artykułów]
    W3[Pisarz]
    W4[Redaktor]
    
    Master --> Manager1
    Master --> Manager2
    Manager1 --> W1
    Manager1 --> W2
    Manager2 --> W3
    Manager2 --> W4
    
    style Master fill:#FF9800,stroke:#F57C00,stroke-width:3px,color:#fff
    style Manager1 fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style Manager2 fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
```
**Korzyści:**
- ✅ Obsługuje złożone przepływy pracy
- ✅ Modułowy i łatwy w utrzymaniu
- ✅ Jasne granice odpowiedzialności

**Ograniczenia:**
- ⚠️ Bardziej złożona architektura
- ⚠️ Wyższe opóźnienia (wiele warstw koordynacji)
- ⚠️ Wymaga zaawansowanej orkiestracji

**Przykłady użycia:**
- Przetwarzanie dokumentów w przedsiębiorstwie (klasyfikacja → przekierowanie → przetwarzanie → archiwizacja)
- Wieloetapowe pipeline'y danych (pobieranie → czyszczenie → transformacja → analiza → raportowanie)
- Złożone przepływy automatyzacji (planowanie → alokacja zasobów → wykonanie → monitorowanie)

---

### Wzorzec 4: Koordynacja sterowana zdarzeniami (Publish-Subscribe)

**Kiedy używać**: Agenci muszą reagować na zdarzenia, pożądane luźne powiązanie.

```mermaid
sequenceDiagram
    participant Agent1 as Zbieracz danych
    participant EventBus as Azure Service Bus
    participant Agent2 as Analizator
    participant Agent3 as Powiadamiacz
    participant Agent4 as Archiwizator
    
    Agent1->>EventBus: Publikuj zdarzenie "OdebranoDane"
    EventBus->>Agent2: Subskrybuj: Analizuj dane
    EventBus->>Agent3: Subskrybuj: Wyślij powiadomienie
    EventBus->>Agent4: Subskrybuj: Archiwizuj dane
    
    Note over Agent1,Agent4: Wszyscy subskrybenci przetwarzają niezależnie
    
    Agent2->>EventBus: Publikuj zdarzenie "AnalizaZakończona"
    EventBus->>Agent3: Subskrybuj: Wyślij raport z analizy
```
**Korzyści:**
- ✅ Luźne powiązanie między agentami
- ✅ Łatwo dodać nowych agentów (wystarczy subskrypcja)
- ✅ Przetwarzanie asynchroniczne
- ✅ Odporność (trwałość wiadomości)

**Ograniczenia:**
- ⚠️ Konsystencja ostateczna
- ⚠️ Złożone debugowanie
- ⚠️ Problemy z kolejnością wiadomości

**Przykłady użycia:**
- Systemy monitorowania w czasie rzeczywistym (alerty, dashboardy, logi)
- Powiadomienia wielokanałowe (email, SMS, push, Slack)
- Pipeline'y przetwarzania danych (wielu konsumentów tych samych danych)

---

### Wzorzec 5: Koordynacja oparta na konsensusie (Głosowanie/Kworum)

**Kiedy używać**: Wymagana zgoda wielu agentów przed kontynuacją.

```mermaid
graph TB
    Input[Zadanie wejściowe]
    Agent1[Agent 1: GPT-4]
    Agent2[Agent 2: Claude]
    Agent3[Agent 3: Gemini]
    Voter[Głosujący konsensusowy]
    Output[Uzgodniony wynik]
    
    Input --> Agent1
    Input --> Agent2
    Input --> Agent3
    Agent1 --> Voter
    Agent2 --> Voter
    Agent3 --> Voter
    Voter --> Output
    
    style Voter fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
```
**Korzyści:**
- ✅ Wyższa dokładność (wiele opinii)
- ✅ Odporność na awarie (akceptowalne awarie mniejszości)
- ✅ Wbudowana kontrola jakości

**Ograniczenia:**
- ❌ Kosztowne (wiele wywołań modeli)
- ❌ Wolniejsze (czekanie na wszystkich agentów)
- ⚠️ Wymagana logika rozwiązywania konfliktów

**Przykłady użycia:**
- Moderacja treści (wiele modeli recenzuje treść)
- Przegląd kodu (wiele linterów/analityków)
- Diagnoza medyczna (wiele modeli AI, walidacja ekspertów)

---

## Przegląd architektury

### Kompletny system wieloagentowy na Azure

```mermaid
graph TB
    User[Użytkownik/Klient API]
    APIM[Azure API Management]
    Orchestrator[Usługa Orkiestratora<br/>Aplikacja Kontenerowa]
    ServiceBus[Azure Service Bus<br/>Event Hub]
    
    Agent1[Agent Badawczy<br/>Aplikacja Kontenerowa]
    Agent2[Agent Pisarski<br/>Aplikacja Kontenerowa]
    Agent3[Agent Analityczny<br/>Aplikacja Kontenerowa]
    Agent4[Agent Recenzent<br/>Aplikacja Kontenerowa]
    
    CosmosDB[(Cosmos DB<br/>Wspólny Stan)]
    Storage[Azure Storage<br/>Artefakty]
    AppInsights[Application Insights<br/>Monitorowanie]
    
    User --> APIM
    APIM --> Orchestrator
    
    Orchestrator --> ServiceBus
    ServiceBus --> Agent1
    ServiceBus --> Agent2
    ServiceBus --> Agent3
    ServiceBus --> Agent4
    
    Agent1 --> CosmosDB
    Agent2 --> CosmosDB
    Agent3 --> CosmosDB
    Agent4 --> CosmosDB
    
    Agent1 --> Storage
    Agent2 --> Storage
    Agent3 --> Storage
    Agent4 --> Storage
    
    Orchestrator -.-> AppInsights
    Agent1 -.-> AppInsights
    Agent2 -.-> AppInsights
    Agent3 -.-> AppInsights
    Agent4 -.-> AppInsights
    
    style Orchestrator fill:#FF9800,stroke:#F57C00,stroke-width:3px,color:#fff
    style ServiceBus fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style CosmosDB fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
**Kluczowe komponenty:**

| Komponent | Cel | Usługa Azure |
|-----------|-----|-------------|
| **API Gateway** | Punkt wejścia, ograniczanie szybkości, uwierzytelnianie | API Management |
| **Orkiestrator** | Koordynuje przepływy pracy agentów | Container Apps |
| **Kolejka wiadomości** | Komunikacja asynchroniczna | Service Bus / Event Hubs |
| **Agenci** | Specjalizowani pracownicy AI | Container Apps / Functions |
| **Magazyn stanu** | Wspólny stan, śledzenie zadań | Cosmos DB |
| **Magazyn artefaktów** | Dokumenty, wyniki, logi | Blob Storage |
| **Monitorowanie** | Śledzenie rozproszone, logi | Application Insights |

---

## Wymagania wstępne

### Wymagane narzędzia

```bash
# Zweryfikuj Azure Developer CLI
azd version
# ✅ Oczekiwane: azd wersja 1.0.0 lub wyższa

# Zweryfikuj Azure CLI
az --version
# ✅ Oczekiwane: azure-cli 2.50.0 lub wyższa

# Zweryfikuj Docker (do testów lokalnych)
docker --version
# ✅ Oczekiwane: Docker wersja 20.10 lub wyższa
```

### Wymagania Azure

- Aktywna subskrypcja Azure
- Uprawnienia do tworzenia:
  - Container Apps
  - Przestrzeni nazw Service Bus
  - Kont Cosmos DB
  - Kont Storage
  - Application Insights

### Wymagana wiedza

Powinieneś ukończyć:
- [Zarządzanie konfiguracją](../getting-started/configuration.md)
- [Uwierzytelnianie i bezpieczeństwo](../getting-started/authsecurity.md)
- [Przykład mikroserwisów](../../../../examples/microservices)

---

## Przewodnik wdrożeniowy

### Struktura projektu

```
multi-agent-system/
├── azure.yaml                    # AZD configuration
├── infra/
│   ├── main.bicep               # Main infrastructure
│   ├── core/
│   │   ├── servicebus.bicep     # Message queue
│   │   ├── cosmos.bicep         # State store
│   │   ├── storage.bicep        # Artifact storage
│   │   └── monitoring.bicep     # Application Insights
│   └── app/
│       ├── orchestrator.bicep   # Orchestrator service
│       └── agent.bicep          # Agent template
└── src/
    ├── orchestrator/            # Orchestration logic
    │   ├── app.py
    │   ├── workflows.py
    │   └── Dockerfile
    ├── agents/
    │   ├── research/            # Research agent
    │   ├── writer/              # Writer agent
    │   ├── analyst/             # Analyst agent
    │   └── reviewer/            # Reviewer agent
    └── shared/
        ├── state_manager.py     # Shared state logic
        └── message_handler.py   # Message handling
```

---

## Lekcja 1: Wzorzec koordynacji sekwencyjnej

### Implementacja: Pipeline tworzenia treści

Zbudujmy sekwencyjny pipeline: Badanie → Pisanie → Edycja → Publikacja

### 1. Konfiguracja AZD

**Plik: `azure.yaml`**

```yaml
name: content-pipeline
metadata:
  template: multi-agent-sequential@1.0.0

services:
  orchestrator:
    project: ./src/orchestrator
    language: python
    host: containerapp
  
  research-agent:
    project: ./src/agents/research
    language: python
    host: containerapp
  
  writer-agent:
    project: ./src/agents/writer
    language: python
    host: containerapp
  
  editor-agent:
    project: ./src/agents/editor
    language: python
    host: containerapp
```

### 2. Infrastruktura: Service Bus do koordynacji

**Plik: `infra/core/servicebus.bicep`**

```bicep
param name string
param location string
param tags object = {}

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: name
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
  properties: {
    minimumTlsVersion: '1.2'
  }
}

// Queue for orchestrator → research agent
resource researchQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'research-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
    deadLetteringOnMessageExpiration: true
  }
}

// Queue for research agent → writer agent
resource writerQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'writer-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
  }
}

// Queue for writer agent → editor agent
resource editorQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'editor-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
  }
}

output namespace string = serviceBusNamespace.name
output connectionString string = listKeys('${serviceBusNamespace.id}/AuthorizationRules/RootManageSharedAccessKey', serviceBusNamespace.apiVersion).primaryConnectionString
```

### 3. Menedżer wspólnego stanu

**Plik: `src/shared/state_manager.py`**

```python
from azure.cosmos import CosmosClient, PartitionKey
from datetime import datetime
import os

class StateManager:
    """Manages shared state across agents using Cosmos DB"""
    
    def __init__(self):
        endpoint = os.environ['COSMOS_ENDPOINT']
        key = os.environ['COSMOS_KEY']
        
        self.client = CosmosClient(endpoint, key)
        self.database = self.client.get_database_client('agent-state')
        self.container = self.database.get_container_client('tasks')
    
    def create_task(self, task_id: str, task_type: str, input_data: dict):
        """Create a new task"""
        task = {
            'id': task_id,
            'type': task_type,
            'status': 'pending',
            'input': input_data,
            'created_at': datetime.utcnow().isoformat(),
            'steps': []
        }
        self.container.create_item(task)
        return task
    
    def update_task_step(self, task_id: str, step_name: str, result: dict):
        """Update task with completed step"""
        task = self.container.read_item(task_id, partition_key=task_id)
        
        task['steps'].append({
            'name': step_name,
            'completed_at': datetime.utcnow().isoformat(),
            'result': result
        })
        
        self.container.replace_item(task_id, task)
        return task
    
    def complete_task(self, task_id: str, final_result: dict):
        """Mark task as complete"""
        task = self.container.read_item(task_id, partition_key=task_id)
        task['status'] = 'completed'
        task['result'] = final_result
        task['completed_at'] = datetime.utcnow().isoformat()
        self.container.replace_item(task_id, task)
        return task
    
    def get_task(self, task_id: str):
        """Retrieve task state"""
        return self.container.read_item(task_id, partition_key=task_id)
```

### 4. Usługa orkiestratora

**Plik: `src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# Połączenie z Service Bus
servicebus_connection_str = os.environ['SERVICEBUS_CONNECTION_STRING']
servicebus_client = ServiceBusClient.from_connection_string(servicebus_connection_str)

@app.route('/health', methods=['GET'])
def health():
    return jsonify({'status': 'healthy', 'service': 'orchestrator'})

@app.route('/create-content', methods=['POST'])
def create_content():
    """
    Sequential workflow: Research → Write → Edit → Publish
    """
    data = request.json
    topic = data.get('topic')
    
    if not topic:
        return jsonify({'error': 'Topic required'}), 400
    
    # Utwórz zadanie w magazynie stanów
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # Wyślij wiadomość do agenta badawczego (pierwszy krok)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # Gdzie wysłać wyniki
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    return jsonify({
        'task_id': task_id,
        'status': 'started',
        'workflow': 'sequential',
        'steps': ['research', 'write', 'edit', 'publish'],
        'message': 'Content creation pipeline initiated'
    }), 202

@app.route('/task/<task_id>', methods=['GET'])
def get_task_status(task_id):
    """Check task status"""
    try:
        task = state_manager.get_task(task_id)
        return jsonify(task)
    except Exception as e:
        return jsonify({'error': str(e)}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

### 5. Agent badawczy

**Plik: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# Zainicjuj klientów
state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_research_task(message_data):
    """Process research request and pass to writer"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    next_queue = message_data['next_queue']
    
    print(f"🔬 Researching: {topic}")
    
    # Wywołaj Azure OpenAI do badań
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # Zaktualizuj stan
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # Wyślij do następnego agenta (pisarza)
    sender = servicebus_client.get_queue_sender(next_queue)
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'research': research_results,
            'next_queue': 'editor-tasks'
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    print(f"✅ Research complete for task {task_id}")

def main():
    """Listen to research queue"""
    receiver = servicebus_client.get_queue_receiver('research-tasks')
    
    print("🔬 Research Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_research_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error processing message: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 6. Agent pisarz

**Plik: `src/agents/writer/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_writing_task(message_data):
    """Write article based on research"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    research = message_data['research']
    next_queue = message_data['next_queue']
    
    print(f"✍️ Writing article: {topic}")
    
    # Zadzwoń do Azure OpenAI, aby napisać artykuł
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # Zaktualizuj stan
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # Wyślij do redaktora
    sender = servicebus_client.get_queue_sender(next_queue)
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'draft': article_draft
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    print(f"✅ Article draft complete for task {task_id}")

def main():
    """Listen to writer queue"""
    receiver = servicebus_client.get_queue_receiver('writer-tasks')
    
    print("✍️ Writer Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_writing_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 7. Agent edytor

**Plik: `src/agents/editor/app.py`**

```python
from azure.servicebus import ServiceBusClient
from openai import AzureOpenAI
import json
import os
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_editing_task(message_data):
    """Edit and finalize article"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    draft = message_data['draft']
    
    print(f"📝 Editing article: {topic}")
    
    # Wywołaj Azure OpenAI do edycji
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # Oznacz zadanie jako ukończone
    state_manager.complete_task(
        task_id=task_id,
        final_result={
            'topic': topic,
            'final_article': final_article,
            'word_count': len(final_article.split())
        }
    )
    
    print(f"✅ Article finalized for task {task_id}")

def main():
    """Listen to editor queue"""
    receiver = servicebus_client.get_queue_receiver('editor-tasks')
    
    print("📝 Editor Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_editing_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 8. Wdrożenie i testowanie

```bash
# Zainicjuj i wdroż
azd init
azd up

# Pobierz URL orkiestratora
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Utwórz zawartość
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ Oczekiwany wynik:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**Sprawdź postęp zadania:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Oczekiwany wynik (ukończony):**
```json
{
  "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "type": "content_creation",
  "status": "completed",
  "steps": [
    {
      "name": "research",
      "completed_at": "2025-11-19T10:30:00Z",
      "result": {"research": "..."}
    },
    {
      "name": "writing",
      "completed_at": "2025-11-19T10:32:00Z",
      "result": {"draft": "..."}
    }
  ],
  "result": {
    "topic": "The Future of AI in Healthcare",
    "final_article": "...",
    "word_count": 1500
  }
}
```

---

## Lekcja 2: Wzorzec koordynacji równoległej

### Implementacja: Agregator badań z wielu źródeł

Zbudujmy równoległy system, który jednocześnie zbiera informacje z wielu źródeł.

### Równoległy orkiestrator

**Plik: `src/orchestrator/parallel_workflow.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

@app.route('/research-parallel', methods=['POST'])
def research_parallel():
    """
    Parallel workflow: Multiple agents work simultaneously
    """
    data = request.json
    query = data.get('query')
    
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='parallel_research',
        input_data={
            'query': query,
            'agents': ['web', 'academic', 'news', 'social']
        }
    )
    
    # Rozesłanie: Wyślij do wszystkich agentów jednocześnie
    agents = [
        ('web-research-queue', 'web'),
        ('academic-research-queue', 'academic'),
        ('news-research-queue', 'news'),
        ('social-research-queue', 'social')
    ]
    
    for queue_name, agent_type in agents:
        sender = servicebus_client.get_queue_sender(queue_name)
        message = ServiceBusMessage(
            body=json.dumps({
                'task_id': task_id,
                'query': query,
                'agent_type': agent_type,
                'result_queue': 'aggregation-queue'
            }),
            content_type='application/json'
        )
        
        with sender:
            sender.send_messages(message)
    
    return jsonify({
        'task_id': task_id,
        'status': 'started',
        'workflow': 'parallel',
        'agents_dispatched': 4,
        'message': 'Parallel research initiated'
    }), 202

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

### Logika agregacji

**Plik: `src/agents/aggregator/app.py`**

```python
from azure.servicebus import ServiceBusClient
import json
import os
from collections import defaultdict
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

# Śledź wyniki dla każdego zadania
task_results = defaultdict(list)
expected_agents = 4  # web, akademickie, wiadomości, społecznościowe

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # Zapisz wynik
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # Sprawdź, czy wszyscy agenci zakończyli (fan-in)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # Połącz wyniki
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # Oznacz jako zakończone
        state_manager.complete_task(task_id, aggregated)
        
        # Wyczyść
        del task_results[task_id]
        
        print(f"✅ Aggregation complete for task {task_id}")

def generate_summary(results):
    """Generate summary from all sources"""
    summaries = [r['data'].get('summary', '') for r in results]
    return '\n\n'.join(summaries)

def main():
    """Listen to aggregation queue"""
    receiver = servicebus_client.get_queue_receiver('aggregation-queue')
    
    print("📊 Aggregator started, listening for results...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_result(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

**Korzyści wzorca równoległego:**
- ⚡ **4x szybszy** (agenci działają jednocześnie)
- 🔄 **Odporność na awarie** (akceptowalne częściowe wyniki)
- 📈 **Skalowalność** (łatwo dodać więcej agentów)

---

## Ćwiczenia praktyczne

### Ćwiczenie 1: Dodaj obsługę limitu czasu ⭐⭐ (Średni poziom)

**Cel**: Zaimplementuj logikę limitu czasu, aby agregator nie czekał w nieskończoność na wolnych agentów.

**Kroki**:

1. **Dodaj śledzenie limitu czasu do agregatora:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> czas_wygaśnięcia

def process_result(message_data):
    task_id = message_data['task_id']
    
    # Ustaw limit czasu na pierwszy wynik
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # Sprawdź, czy zakończono LUB przekroczono limit czasu
    if len(task_results[task_id]) == expected_agents or \
       datetime.utcnow() > task_timeouts[task_id]:
        
        print(f"📊 Aggregating with {len(task_results[task_id])}/{expected_agents} results")
        
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'completed_agents': len(task_results[task_id]),
            'timed_out': len(task_results[task_id]) < expected_agents
        }
        
        state_manager.complete_task(task_id, aggregated)
        
        # Sprzątanie
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **Przetestuj z opóźnieniami sztucznymi:**

```python
# W jednym agencie dodaj opóźnienie, aby zasymulować wolne przetwarzanie
import time
time.sleep(35)  # Przekracza limit czasu 30 sekund
```

3. **Wdrożenie i weryfikacja:**

```bash
azd deploy aggregator

# Prześlij zadanie
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Sprawdź wyniki po 30 sekundach
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Kryteria sukcesu:**
- ✅ Zadanie kończy się po 30 sekundach, nawet jeśli agenci nie ukończą
- ✅ Odpowiedź wskazuje częściowe wyniki (`"timed_out": true`)
- ✅ Dostępne wyniki są zwracane (3 z 4 agentów)

**Czas**: 20-25 minut

---

### Ćwiczenie 2: Zaimplementuj logikę ponawiania ⭐⭐⭐ (Zaawansowany poziom)

**Cel**: Automatyczne ponawianie zadań agentów, które zakończyły się niepowodzeniem, zanim zostaną porzucone.

**Kroki**:

1. **Dodaj śledzenie ponawiania do orkiestratora:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # message_id -> liczba_ponownych_prób

def send_with_retry(queue_name: str, message_data: dict, retry_config: RetryConfig):
    """Send message with retry metadata"""
    message_id = message_data.get('message_id', str(uuid.uuid4()))
    message_data['message_id'] = message_id
    message_data['retry_count'] = retry_counts.get(message_id, 0)
    message_data['max_retries'] = retry_config.max_retries
    
    sender = servicebus_client.get_queue_sender(queue_name)
    message = ServiceBusMessage(
        body=json.dumps(message_data),
        content_type='application/json',
        message_id=message_id
    )
    
    with sender:
        sender.send_messages(message)
```

2. **Dodaj obsługę ponawiania do agentów:**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # Przetwórz wiadomość
        process_func(message_data)
        
        # Sukces - zakończono
        receiver.complete_message(message)
        
    except Exception as e:
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # Ponów próbę: porzuć i ponownie umieść w kolejce z zwiększonym licznikiem
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # Wyślij z powrotem do tej samej kolejki z opóźnieniem
            time.sleep(5 * (retry_count + 1))  # Wykładnicze opóźnienie
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # Usuń oryginał
        else:
            # Przekroczono maksymalną liczbę prób - przenieś do kolejki martwych listów
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **Monitoruj kolejkę wiadomości odrzuconych:**

```python
def monitor_dead_letters():
    """Check dead letter queue for failed messages"""
    receiver = servicebus_client.get_queue_receiver(
        'research-queue',
        sub_queue='deadletter'
    )
    
    with receiver:
        messages = receiver.receive_messages(max_wait_time=5)
        for message in messages:
            print(f"☠️ Dead letter: {message.message_id}")
            print(f"Reason: {message.dead_letter_reason}")
            print(f"Description: {message.dead_letter_error_description}")
```

**✅ Kryteria sukcesu:**
- ✅ Nieudane zadania są automatycznie ponawiane (do 3 razy)
- ✅ Eksponencjalne opóźnienie między ponowieniami (5s, 10s, 15s)
- ✅ Po maksymalnej liczbie ponowień wiadomości trafiają do kolejki odrzuconych
- ✅ Kolejka odrzuconych może być monitorowana i odtwarzana

**Czas**: 30-40 minut

---

### Ćwiczenie 3: Zaimplementuj wyłącznik obwodu ⭐⭐⭐ (Zaawansowany poziom)

**Cel**: Zapobieganie kaskadowym awariom poprzez zatrzymanie żądań do agentów, które zawodzą.

**Kroki**:

1. **Utwórz klasę wyłącznika obwodu:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # Normalna operacja
    OPEN = "open"          # Awaria, odrzuć żądania
    HALF_OPEN = "half_open"  # Testowanie, czy odzyskano

class CircuitBreaker:
    def __init__(self, failure_threshold=5, timeout_seconds=60):
        self.failure_threshold = failure_threshold
        self.timeout_seconds = timeout_seconds
        self.failure_count = 0
        self.last_failure_time = None
        self.state = CircuitState.CLOSED
    
    def call(self, func):
        """Execute function with circuit breaker protection"""
        if self.state == CircuitState.OPEN:
            # Sprawdź, czy czas oczekiwania wygasł
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # Sukces
            if self.state == CircuitState.HALF_OPEN:
                self.state = CircuitState.CLOSED
                self.failure_count = 0
                print("✅ Circuit breaker: CLOSED (recovered)")
            
            return result
            
        except Exception as e:
            self.failure_count += 1
            self.last_failure_time = datetime.utcnow()
            
            if self.failure_count >= self.failure_threshold:
                self.state = CircuitState.OPEN
                print(f"🔴 Circuit breaker: OPEN (too many failures)")
            
            raise e
```

2. **Zastosuj do wywołań agentów:**

```python
# W orkiestratorze
agent_circuits = {
    'web': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'academic': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'news': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'social': CircuitBreaker(failure_threshold=5, timeout_seconds=60)
}

def send_to_agent(agent_type, message_data):
    """Send with circuit breaker protection"""
    circuit = agent_circuits[agent_type]
    
    try:
        circuit.call(lambda: send_message(agent_type, message_data))
    except Exception as e:
        print(f"⚠️ Skipping {agent_type} agent: {e}")
        # Kontynuuj z innymi agentami
```

3. **Przetestuj wyłącznik obwodu:**

```bash
# Symuluj powtarzające się awarie (zatrzymaj jednego agenta)
az containerapp stop --name web-research-agent --resource-group rg-agents

# Wyślij wiele żądań
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# Sprawdź logi - powinno być widać otwarty obwód po 5 awariach
azd logs orchestrator --tail 50
```

**✅ Kryteria sukcesu:**
- ✅ Po 5 awariach obwód otwiera się (odrzuca żądania)
- ✅ Po 60 sekundach obwód przechodzi w stan półotwarty (testuje odzyskanie)
- ✅ Inni agenci działają normalnie
- ✅ Obwód zamyka się automatycznie, gdy agent odzyska sprawność

**Czas**: 40-50 minut

---

## Monitorowanie i debugowanie

### Śledzenie rozproszone z Application Insights

**Plik: `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# Skonfiguruj śledzenie
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# Utwórz śledzący
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# Skonfiguruj logowanie
logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(connection_string=connection_string))
logger.setLevel(logging.INFO)

def trace_agent_call(agent_name, task_id, operation):
    """Trace agent operations"""
    with tracer.span(name=f'{agent_name}.{operation}') as span:
        span.add_attribute('agent', agent_name)
        span.add_attribute('task_id', task_id)
        span.add_attribute('operation', operation)
        
        try:
            result = operation()
            span.add_attribute('status', 'success')
            return result
        except Exception as e:
            span.add_attribute('status', 'error')
            span.add_attribute('error', str(e))
            raise
```

### Zapytania Application Insights

**Śledzenie przepływów pracy wieloagentowych:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**Porównanie wydajności agentów:**

```kusto
// Compare agent execution times
dependencies
| where name contains "agent"
| summarize 
    avg_duration = avg(duration),
    p95_duration = percentile(duration, 95),
    count = count()
  by agent = tostring(customDimensions.agent)
| order by avg_duration desc
```

**Analiza awarii:**

```kusto
// Find which agents fail most
exceptions
| where customDimensions.agent != ""
| summarize 
    failure_count = count(),
    unique_errors = dcount(outerMessage)
  by agent = tostring(customDimensions.agent)
| order by failure_count desc
```

---

## Analiza kosztów

### Koszty systemu wieloagentowego (szacunkowe miesięczne)

| Komponent | Konfiguracja | Koszt |
|-----------|--------------|------|
| **Orkiestrator** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 Agenci** | 4 Container Apps (0.5 vCPU, 1GB każdy) | $60-120 |
| **Service Bus** | Standardowy poziom, 10M wiadomości | $10-20 |
| **Cosmos DB** | Serwerless, 5GB storage, 1M RUs | $25-50 |
| **Blob Storage** | 10GB storage, 100K operacji | $5-10 |
| **Application Insights** | 5GB ingestii | $10-15 |
| **Azure OpenAI** | GPT-4, 10M tokenów | $100-300 |
| **Razem** | | **$240-565/miesiąc** |

### Strategie optymalizacji kosztów

1. **Używaj serwerless, gdzie to możliwe:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Skaluj agentów do zera, gdy są bezczynni:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Używaj batchingu dla Service Bus:**
   ```python
   # Wysyłaj wiadomości w partiach (taniej)
   sender.send_messages([message1, message2, message3])
   ```

4. **Buforuj często używane wyniki:**
   ```python
   # Użyj Azure Cache dla Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Najlepsze praktyki

### ✅ TAK:

1. **Używaj operacji idempotentnych**
   ```python
   # Agent może bezpiecznie przetwarzać tę samą wiadomość wielokrotnie
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # Przetwarzanie zadania...
   ```

2. **Implementuj kompleksowe logowanie**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Używaj identyfikatorów korelacji**
   ```python
   # Przekaż task_id przez cały przepływ pracy
   message_data = {
       'task_id': task_id,  # Identyfikator korelacji
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Ustaw TTL (czas życia) wiadomości**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Monitoruj kolejki odrzuconych wiadomości**
   ```python
   # Regularne monitorowanie nieudanych wiadomości
   monitor_dead_letters()
   ```

### ❌ NIE:

1. **Nie twórz zależności cyklicznych**
   ```python
   # ❌ ŹLE: Agent A → Agent B → Agent A (nieskończona pętla)
   # ✅ DOBRZE: Zdefiniuj przejrzysty skierowany acykliczny graf (DAG)
   ```

2. **Nie blokuj wątków agentów**
   ```python
   # ❌ ZŁE: Synchroniczne oczekiwanie
   while not task_complete:
       time.sleep(1)
   
   # ✅ DOBRE: Użyj wywołań zwrotnych kolejki wiadomości
   ```

3. **Nie ignoruj częściowych awarii**
   ```python
   # ❌ ŹLE: Zakończ cały proces, jeśli jeden agent zawiedzie
   # ✅ DOBRZE: Zwróć częściowe wyniki z wskaźnikami błędów
   ```

4. **Nie używaj nieskończonych ponowień**
   ```python
   # ❌ ŹLE: ponawiaj w nieskończoność
   # ✅ DOBRZE: max_retries = 3, potem martwa wiadomość
   ```

---
## Przewodnik rozwiązywania problemów

### Problem: Wiadomości utknęły w kolejce

**Objawy:**
- Wiadomości gromadzą się w kolejce
- Agenci nie przetwarzają
- Status zadania utknął na "oczekujące"

**Diagnoza:**
```bash
# Sprawdź głębokość kolejki
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Sprawdź stan agenta
azd logs research-agent --tail 50
```

**Rozwiązania:**

1. **Zwiększ liczbę replik agentów:**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Sprawdź kolejkę martwych listów:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problem: Przekroczenie czasu zadania/nigdy nie kończy się

**Objawy:**
- Status zadania pozostaje "w trakcie"
- Niektórzy agenci kończą, inni nie
- Brak komunikatów o błędach

**Diagnoza:**
```bash
# Sprawdź stan zadania
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Sprawdź Application Insights
# Uruchom zapytanie: traces | where customDimensions.task_id == "..."
```

**Rozwiązania:**

1. **Zaimplementuj limit czasu w agregatorze (Ćwiczenie 1)**

2. **Sprawdź awarie agentów:**
   ```bash
   azd logs --follow | grep "ERROR\|FAIL"
   ```

3. **Zweryfikuj, czy wszyscy agenci działają:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## Dowiedz się więcej

### Oficjalna dokumentacja
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Wzorce projektowe dla systemów wieloagentowych](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### Kolejne kroki w tym kursie
- ← Poprzedni: [Planowanie pojemności](capacity-planning.md)
- → Następny: [Wybór SKU](sku-selection.md)
- 🏠 [Strona główna kursu](../../README.md)

### Powiązane przykłady
- [Przykład mikroserwisów](../../../../examples/microservices) - Wzorce komunikacji między usługami
- [Przykład Azure OpenAI](../../../../examples/azure-openai-chat) - Integracja AI

---

## Podsumowanie

**Nauczyłeś się:**
- ✅ Pięciu wzorców koordynacji (sekwencyjny, równoległy, hierarchiczny, zdarzeniowy, konsensus)
- ✅ Architektury wieloagentowej na Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Zarządzania stanem w rozproszonych agentach
- ✅ Obsługi limitów czasu, ponownych prób i wyłączników obwodowych
- ✅ Monitorowania i debugowania systemów rozproszonych
- ✅ Strategii optymalizacji kosztów

**Kluczowe wnioski:**
1. **Wybierz odpowiedni wzorzec** - Sekwencyjny dla uporządkowanych przepływów pracy, równoległy dla szybkości, zdarzeniowy dla elastyczności
2. **Zarządzaj stanem ostrożnie** - Używaj Cosmos DB lub podobnych do współdzielonego stanu
3. **Obsługuj awarie z rozwagą** - Limity czasu, ponowne próby, wyłączniki obwodowe, kolejki martwych listów
4. **Monitoruj wszystko** - Śledzenie rozproszone jest kluczowe dla debugowania
5. **Optymalizuj koszty** - Skalowanie do zera, używanie serwerless, wdrażanie pamięci podręcznej

**Kolejne kroki:**
1. Ukończ ćwiczenia praktyczne
2. Zbuduj system wieloagentowy dla swojego przypadku użycia
3. Przestudiuj [Wybór SKU](sku-selection.md), aby zoptymalizować wydajność i koszty

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za autorytatywne źródło. W przypadku informacji krytycznych zaleca się profesjonalne tłumaczenie przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->