# Wzorce koordynacji wieloagentowej

⏱️ **Szacowany czas**: 60-75 minut | 💰 **Szacowany koszt**: ~$100-300/month | ⭐ **Złożoność**: Zaawansowana

**📚 Ścieżka nauki:**
- ← Poprzedni: [Planowanie pojemności](capacity-planning.md) - Dobór zasobów i strategie skalowania
- 🎯 **Jesteś tutaj**: Wzorce koordynacji wieloagentowej (Orkiestracja, komunikacja, zarządzanie stanem)
- → Następny: [Wybór SKU](sku-selection.md) - Wybór odpowiednich usług Azure
- 🏠 [Strona kursu](../../README.md)

---

## Czego się nauczysz

Po ukończeniu tej lekcji:
- Zrozumiesz **wzorce architektury wieloagentowej** i kiedy je stosować
- Zaimplementujesz **wzorce orkiestracji** (centralna, zdecentralizowana, hierarchiczna)
- Zaprojektujesz **strategie komunikacji agentów** (synchronizowana, asynchroniczna, zdarzeniowa)
- Zarządzisz **wspólnym stanem** w rozproszonych agentach
- Wdrożysz **systemy wieloagentowe** na Azure za pomocą AZD
- Zastosujesz **wzorce koordynacji** w rzeczywistych scenariuszach AI
- Monitorujesz i debugujesz rozproszone systemy agentów

## Dlaczego koordynacja wieloagentowa ma znaczenie

### Ewolucja: Od pojedynczego agenta do systemu wieloagentowego

**Pojedynczy agent (Prosty):**
```
User → Agent → Response
```
- ✅ Łatwy do zrozumienia i wdrożenia
- ✅ Szybki dla prostych zadań
- ❌ Ograniczony możliwościami jednego modelu
- ❌ Nie można równolegle wykonywać złożonych zadań
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
- ✅ Agenci wyspecjalizowani w konkretnych zadaniach
- ✅ Wykonanie równoległe dla szybkości
- ✅ Modułowy i łatwy w utrzymaniu
- ✅ Lepszy do złożonych przepływów pracy
- ⚠️ Wymaga logiki koordynacji

**Analogia**: Pojedynczy agent jest jak jedna osoba wykonująca wszystkie zadania. System wieloagentowy jest jak zespół, w którym każdy członek ma wyspecjalizowane umiejętności (badacz, programista, recenzent, pisarz) pracujący razem.

---

## Główne wzorce koordynacji

### Wzorzec 1: Koordynacja sekwencyjna (Łańcuch odpowiedzialności)

**Kiedy używać**: Zadania muszą być wykonywane w określonej kolejności, każdy agent opiera się na wyniku poprzedniego.

```mermaid
sequenceDiagram
    participant User as Użytkownik
    participant Orchestrator as Orkiestrator
    participant Agent1 as Agent badawczy
    participant Agent2 as Agent piszący
    participant Agent3 as Agent redagujący
    
    User->>Orchestrator: "Napisz artykuł o sztucznej inteligencji"
    Orchestrator->>Agent1: Zbadaj temat
    Agent1-->>Orchestrator: Wyniki badań
    Orchestrator->>Agent2: Napisz szkic (wykorzystując badania)
    Agent2-->>Orchestrator: Szkic artykułu
    Orchestrator->>Agent3: Edytuj i ulepsz
    Agent3-->>Orchestrator: Ostateczny artykuł
    Orchestrator-->>User: Dopracowany artykuł
    
    Note over User,Agent3: Sekwencyjnie: każdy krok czeka na poprzedni
```
**Korzyści:**
- ✅ Jasny przepływ danych
- ✅ Łatwy do debugowania
- ✅ Przewidywalna kolejność wykonywania

**Ograniczenia:**
- ❌ Wolniejszy (brak równoległości)
- ❌ Jedna awaria blokuje cały łańcuch
- ❌ Nie radzi sobie z zadaniami współzależnymi

**Przykłady zastosowań:**
- Pipeline tworzenia treści (badania → pisanie → redakcja → publikacja)
- Generowanie kodu (planowanie → implementacja → testy → wdrożenie)
- Generowanie raportów (gromadzenie danych → analiza → wizualizacja → podsumowanie)

---

### Wzorzec 2: Koordynacja równoległa (Fan-Out/Fan-In)

**Kiedy używać**: Niezależne zadania można uruchomić jednocześnie, wyniki są łączone na końcu.

```mermaid
graph TB
    User[Żądanie użytkownika]
    Orchestrator[Orkiestrator]
    Agent1[Agent analizy]
    Agent2[Agent badawczy]
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
- ✅ Szybko (wykonywanie równoległe)
- ✅ Odporność na błędy (częściowe wyniki akceptowalne)
- ✅ Skaluje się poziomo

**Ograniczenia:**
- ⚠️ Wyniki mogą przychodzić nie w kolejności
- ⚠️ Wymagana logika agregacji
- ⚠️ Złożone zarządzanie stanem

**Przykłady zastosowań:**
- Gromadzenie danych z wielu źródeł (API + bazy danych + web scraping)
- Analiza konkurencji (wiele modeli generuje rozwiązania, wybierane najlepsze)
- Usługi tłumaczeń (tłumaczenie na wiele języków jednocześnie)

---

### Wzorzec 3: Koordynacja hierarchiczna (Manager-Worker)

**Kiedy używać**: Złożone przepływy pracy z podzadaniami wymagające delegowania.

```mermaid
graph TB
    Master[Główny Orkiestrator]
    Manager1[Kierownik ds. badań]
    Manager2[Kierownik ds. treści]
    W1[Skrobak sieciowy]
    W2[Analizator artykułów]
    W3[Autor]
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
- ✅ Radzi sobie ze złożonymi przepływami pracy
- ✅ Modułowy i łatwy w utrzymaniu
- ✅ Jasne granice odpowiedzialności

**Ograniczenia:**
- ⚠️ Bardziej złożona architektura
- ⚠️ Wyższa latencja (wiele warstw koordynacji)
- ⚠️ Wymaga zaawansowanej orkiestracji

**Przykłady zastosowań:**
- Przetwarzanie dokumentów w przedsiębiorstwie (klasyfikacja → kierowanie → przetwarzanie → archiwizacja)
- Wieloetapowe pipeline'y danych (ingest → czyszczenie → transformacja → analiza → raport)
- Złożone przepływy automatyzacji (planowanie → alokacja zasobów → wykonanie → monitorowanie)

---

### Wzorzec 4: Koordynacja zdarzeniowa (Publish-Subscribe)

**Kiedy używać**: Agenci muszą reagować na zdarzenia, pożądane jest luźne powiązanie.

```mermaid
sequenceDiagram
    participant Agent1 as Zbieracz danych
    participant EventBus as Azure Service Bus
    participant Agent2 as Analizator
    participant Agent3 as Powiadamiacz
    participant Agent4 as Archiwizator
    
    Agent1->>EventBus: Opublikuj zdarzenie "DaneOdebrane"
    EventBus->>Agent2: Subskrybuj: Analizuj dane
    EventBus->>Agent3: Subskrybuj: Wyślij powiadomienie
    EventBus->>Agent4: Subskrybuj: Archiwizuj dane
    
    Note over Agent1,Agent4: Wszyscy subskrybenci przetwarzają niezależnie
    
    Agent2->>EventBus: Opublikuj zdarzenie "AnalizaZakończona"
    EventBus->>Agent3: Subskrybuj: Wyślij raport z analizy
```
**Korzyści:**
- ✅ Luźne powiązanie między agentami
- ✅ Łatwe dodawanie nowych agentów (wystarczy subskrybować)
- ✅ Przetwarzanie asynchroniczne
- ✅ Odporność (trwałość wiadomości)

**Ograniczenia:**
- ⚠️ Ostateczna spójność
- ⚠️ Trudne debugowanie
- ⚠️ Problemy z kolejnością wiadomości

**Przykłady zastosowań:**
- Systemy monitorowania w czasie rzeczywistym (alerty, pulpity, logi)
- Powiadomienia wielokanałowe (email, SMS, push, Slack)
- Pipeline'y przetwarzania danych (wielu konsumentów tych samych danych)

---

### Wzorzec 5: Koordynacja oparta na konsensusie (Głosowanie/Kworum)

**Kiedy używać**: Potrzebna zgoda od wielu agentów przed kontynuowaniem.

```mermaid
graph TB
    Input[Zadanie wejściowe]
    Agent1[Agent 1: GPT-4]
    Agent2[Agent 2: Claude]
    Agent3[Agent 3: Gemini]
    Voter[Głosujący konsensusu]
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
- ✅ Odporność na błędy (akceptowalne awarie mniejszości)
- ✅ Wbudowane zapewnianie jakości

**Ograniczenia:**
- ❌ Kosztowne (wiele wywołań modeli)
- ❌ Wolniejsze (oczekiwanie na wszystkich agentów)
- ⚠️ Wymagana rozwiązywanie konfliktów

**Przykłady zastosowań:**
- Moderacja treści (wiele modeli ocenia treść)
- Przegląd kodu (wiele linterów/analityków)
- Diagnostyka medyczna (wiele modeli AI, walidacja ekspertów)

---

## Przegląd architektury

### Kompletny system wieloagentowy na Azure

```mermaid
graph TB
    User[Użytkownik/Klient API]
    APIM[Zarządzanie API Azure]
    Orchestrator[Usługa Orkiestratora<br/>Aplikacja kontenerowa]
    ServiceBus[Azure Service Bus<br/>Hub zdarzeń]
    
    Agent1[Agent badawczy<br/>Aplikacja kontenerowa]
    Agent2[Agent piszący<br/>Aplikacja kontenerowa]
    Agent3[Agent analityczny<br/>Aplikacja kontenerowa]
    Agent4[Agent recenzent<br/>Aplikacja kontenerowa]
    
    CosmosDB[(Cosmos DB<br/>Stan współdzielony)]
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
|-----------|---------|---------------|
| **Bramka API** | Punkt wejścia, ograniczanie szybkości, auth | API Management |
| **Orkiestrator** | Koordynuje przepływy agentów | Container Apps |
| **Kolejka komunikatów** | Komunikacja asynchroniczna | Service Bus / Event Hubs |
| **Agenci** | Wyspecjalizowani pracownicy AI | Container Apps / Functions |
| **Magazyn stanu** | Wspólny stan, śledzenie zadań | Cosmos DB |
| **Magazyn artefaktów** | Dokumenty, wyniki, logi | Blob Storage |
| **Monitorowanie** | Śledzenie rozproszone, logi | Application Insights |

---

## Wymagania wstępne

### Wymagane narzędzia

```bash
# Zweryfikuj Azure Developer CLI
azd version
# ✅ Oczekiwane: azd w wersji 1.0.0 lub wyższej

# Zweryfikuj Azure CLI
az --version
# ✅ Oczekiwane: azure-cli w wersji 2.50.0 lub wyższej

# Zweryfikuj Docker (do testów lokalnych)
docker --version
# ✅ Oczekiwane: Docker w wersji 20.10 lub wyższej
```

### Wymagania dotyczące Azure

- Aktywna subskrypcja Azure
- Uprawnienia do utworzenia:
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB accounts
  - Storage accounts
  - Application Insights

### Wymagana wiedza

Powinieneś ukończyć:
- [Zarządzanie konfiguracją](../chapter-03-configuration/configuration.md)
- [Uwierzytelnianie i bezpieczeństwo](../chapter-03-configuration/authsecurity.md)
- [Przykład mikrousług](../../../../examples/microservices)

---

## Przewodnik implementacji

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

Zbudujmy sekwencyjny pipeline: Badania → Pisanie → Redakcja → Publikacja

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

### 3. Menedżer stanu współdzielonego

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

# Połączenie Service Bus
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
    
    # Utwórz zadanie w magazynie stanu
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

# Zainicjalizuj klientów
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
    
    # Wywołaj Azure OpenAI w celach badawczych
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
    
    # Wyślij do następnego agenta (piszącego)
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

### 6. Agent piszący

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
    
    # Wywołaj Azure OpenAI, aby napisać artykuł
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

### 7. Agent redakcyjny

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
    
    # Wywołaj Azure OpenAI w celu edycji
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

### 8. Wdróż i przetestuj

```bash
# Zainicjalizuj i wdroż
azd init
azd up

# Pobierz adres URL orkiestratora
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

**✅ Oczekiwany wynik (zakończone):**
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

Zbudujmy system równoległy, który zbiera informacje z wielu źródeł jednocześnie.

### Orkiestrator równoległy

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
    
    # Fan-out: Wyślij do wszystkich agentów jednocześnie
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
expected_agents = 4  # sieć, akademickie, wiadomości, społecznościowe

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
        
        # Oznacz jako ukończone
        state_manager.complete_task(task_id, aggregated)
        
        # Posprzątaj
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
- ⚡ **4x szybciej** (agenci działają jednocześnie)
- 🔄 **Odporność na błędy** (częściowe wyniki akceptowalne)
- 📈 **Skalowalność** (łatwe dodawanie kolejnych agentów)

---

## Ćwiczenia praktyczne

### Ćwiczenie 1: Dodaj obsługę limitu czasu ⭐⭐ (Średnie)

**Cel**: Zaimplementować logikę timeout, aby agregator nie czekał wiecznie na wolne agenty.

**Kroki**:

1. **Dodaj śledzenie limitów czasu do agregatora:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> expiration_time

def process_result(message_data):
    task_id = message_data['task_id']
    
    # Ustaw limit czasu dla pierwszego wyniku
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # Sprawdź, czy zakończono lub czy upłynął czas
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

2. **Przetestuj z sztucznymi opóźnieniami:**

```python
# W jednym agencie dodaj opóźnienie, aby zasymulować wolne przetwarzanie
import time
time.sleep(35)  # Przekracza 30-sekundowy limit czasu
```

3. **Wdróż i zweryfikuj:**

```bash
azd deploy aggregator

# Wyślij zadanie
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Sprawdź wyniki po 30 sekundach
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Kryteria sukcesu:**
- ✅ Zadanie kończy się po 30 sekundach nawet jeśli agenci nie są kompletni
- ✅ Odpowiedź wskazuje częściowe wyniki (`"timed_out": true`)
- ✅ Zwrócone są dostępne wyniki (3 z 4 agentów)

**Czas**: 20-25 minut

---

### Ćwiczenie 2: Zaimplementuj logikę ponawiania ⭐⭐⭐ (Zaawansowane)

**Cel**: Automatyczne ponawianie nieudanych zadań agentów przed poddaniem się.

**Kroki**:

1. **Dodaj śledzenie retry w orkiestratorze:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # message_id -> retry_count

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

2. **Dodaj handler ponowień do agentów:**

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
            # Ponów: porzuć i włóż ponownie do kolejki ze zwiększonym licznikiem
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # Wyślij z powrotem do tej samej kolejki z opóźnieniem
            time.sleep(5 * (retry_count + 1))  # Wykładnicze opóźnienie
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # Usuń oryginał
        else:
            # Przekroczono maksymalną liczbę prób - przenieś do kolejki martwych wiadomości
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **Monitoruj dead letter queue:**

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
- ✅ Wykładniczy backoff między ponowieniami (5s, 10s, 15s)
- ✅ Po maksymalnych ponowieniach wiadomości trafiają do dead letter queue
- ✅ Dead letter queue można monitorować i odtwarzać

**Czas**: 30-40 minut

---

### Ćwiczenie 3: Zaimplementuj Circuit Breaker ⭐⭐⭐ (Zaawansowane)

**Cel**: Zapobiec kaskadowym awariom poprzez zatrzymanie żądań do awaryjnych agentów.

**Kroki**:

1. **Utwórz klasę circuit breaker:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # Normalne działanie
    OPEN = "open"          # Awaria, odrzuca żądania
    HALF_OPEN = "half_open"  # Sprawdzanie, czy odzyskał sprawność

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
            # Sprawdzenie, czy limit czasu wygasł
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

3. **Przetestuj circuit breaker:**

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

# Sprawdź logi - powinieneś zobaczyć otwarcie obwodu po 5 awariach
# Użyj Azure CLI do logów aplikacji kontenerowej:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ Kryteria sukcesu:**
- ✅ Po 5 awariach obwód się otwiera (odrzuca żądania)
- ✅ Po 60 sekundach obwód przechodzi w stan half-open (testuje odzyskanie)
- ✅ Inni agenci działają normalnie
- ✅ Obwód zamyka się automatycznie, gdy agent wraca do zdrowia

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

# Utwórz tracer
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# Skonfiguruj rejestrowanie
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

**Śledź przepływy pracy wieloagentowe:**

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

**Analiza błędów:**

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

### Koszty systemu wieloagentowego (szacunki miesięczne)

| Komponent | Konfiguracja | Koszt |
|-----------|--------------|------|
| **Orkiestrator** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 agentów** | 4 Container Apps (0.5 vCPU, 1GB każdy) | $60-120 |
| **Service Bus** | Standard tier, 10M messages | $10-20 |
| **Cosmos DB** | Serverless, 5GB storage, 1M RUs | $25-50 |
| **Blob Storage** | 10GB storage, 100K operations | $5-10 |
| **Application Insights** | 5GB ingestion | $10-15 |
| **Azure OpenAI** | GPT-4, 10M tokens | $100-300 |
| **Łącznie** | | **$240-565/month** |

### Strategie optymalizacji kosztów

1. **Używaj serverless tam, gdzie to możliwe:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Skaluj agentów do zera, gdy są nieaktywne:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Używaj batchingu dla Service Bus:**
   ```python
   # Wysyłaj wiadomości partiami (taniej)
   sender.send_messages([message1, message2, message3])
   ```

4. **Buforuj często używane wyniki:**
   ```python
   # Użyj Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Najlepsze praktyki

### ✅ Rób:

1. **Używaj operacji idempotentnych**
   ```python
   # Agent może bezpiecznie przetwarzać tę samą wiadomość wiele razy
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # Przetwarzanie zadania...
   ```

2. **Zaimplementuj kompleksowe logowanie**
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

4. **Ustaw TTL wiadomości (time-to-live)**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Monitoruj dead letter queues**
   ```python
   # Regularne monitorowanie nieudanych wiadomości
   monitor_dead_letters()
   ```

### ❌ Nie rób:

1. **Nie twórz cyklicznych zależności**
   ```python
   # ❌ ZŁE: Agent A → Agent B → Agent A (nieskończona pętla)
   # ✅ DOBRE: Zdefiniuj wyraźny skierowany graf acykliczny (DAG)
   ```

2. **Nie blokuj wątków agentów**
   ```python
   # ❌ ZŁE: Oczekiwanie synchroniczne
   while not task_complete:
       time.sleep(1)
   
   # ✅ DOBRE: Używaj wywołań zwrotnych kolejki komunikatów
   ```

3. **Nie ignoruj częściowych awarii**
   ```python
   # ❌ ZŁE: Zakończ cały przepływ pracy, jeśli jeden agent zawiedzie
   # ✅ DOBRE: Zwróć częściowe wyniki z wskaźnikami błędów
   ```

4. **Nie używaj nieskończonych ponowień**
   ```python
   # ❌ ZŁE: ponawiaj w nieskończoność
   # ✅ DOBRE: max_retries = 3, potem do kolejki martwych wiadomości
   ```

---

## Przewodnik rozwiązywania problemów

### Problem: Wiadomości utknęły w kolejce

**Objawy:**
- Wiadomości gromadzą się w kolejce
- Agenci nie przetwarzają
- Status zadania utknął na "pending"

**Diagnoza:**
```bash
# Sprawdź głębokość kolejki
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Sprawdź logi agenta za pomocą Azure CLI
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**Rozwiązania:**

1. **Zwiększ liczbę replik agentów:**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Sprawdź kolejkę dead-letter:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problem: Zadanie przekracza limit czasu/nie kończy się

**Objawy:**
- Status zadania pozostaje "in_progress"
- Niektórzy agenci kończą pracę, inni nie
- Brak komunikatów o błędach

**Diagnoza:**
```bash
# Sprawdź stan zadania
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Sprawdź Application Insights
# Uruchom zapytanie: traces | where customDimensions.task_id == "..."
```

**Rozwiązania:**

1. **Wprowadź limit czasu w agregatorze (Ćwiczenie 1)**

2. **Sprawdź awarie agentów za pomocą Azure Monitor:**
   ```bash
   # Wyświetl logi za pomocą azd monitor
   azd monitor --logs
   
   # Albo użyj Azure CLI, aby sprawdzić logi konkretnej aplikacji kontenerowej
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Zweryfikuj, czy wszystkie agenty działają:**
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
- [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### Kolejne kroki w tym kursie
- ← Poprzedni: [Planowanie pojemności](capacity-planning.md)
- → Następny: [Wybór SKU](sku-selection.md)
- 🏠 [Strona główna kursu](../../README.md)

### Powiązane przykłady
- [Przykład mikroserwisów](../../../../examples/microservices) - Wzorce komunikacji usług
- [Przykład Azure OpenAI](../../../../examples/azure-openai-chat) - Integracja AI

---

## Podsumowanie

**Nauczyłeś się:**
- ✅ Pięć wzorców koordynacji (sekwencyjny, równoległy, hierarchiczny, zdarzeniowy, konsensusowy)
- ✅ Architektura wieloagentowa na platformie Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Zarządzanie stanem w rozproszonych agentach
- ✅ Obsługa limitów czasu, ponowień i mechanizmów circuit breaker
- ✅ Monitorowanie i debugowanie systemów rozproszonych
- ✅ Strategie optymalizacji kosztów

**Kluczowe wnioski:**
1. **Wybierz odpowiedni wzorzec** - sekwencyjny dla uporządkowanych przepływów pracy, równoległy dla szybkości, zdarzeniowy dla elastyczności
2. **Starannie zarządzaj stanem** - użyj Cosmos DB lub podobnego do stanu współdzielonego
3. **Obsłuż awarie w sposób kontrolowany** - limity czasu, ponowienia, mechanizmy circuit breaker, kolejki dead-letter
4. **Monitoruj wszystko** - Śledzenie rozproszone jest niezbędne do debugowania
5. **Optymalizuj koszty** - skaluj do zera, używaj serverless, implementuj buforowanie

**Kolejne kroki:**
1. Ukończ ćwiczenia praktyczne
2. Zbuduj system wieloagentowy dla swojego przypadku użycia
3. Przestudiuj [Wybór SKU](sku-selection.md), aby zoptymalizować wydajność i koszt

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Zastrzeżenie:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczeń opartych na sztucznej inteligencji Co-op Translator (https://github.com/Azure/co-op-translator). Choć dokładamy starań, aby tłumaczenie było jak najdokładniejsze, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy uznać za wersję autorytatywną. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego, ludzkiego tłumaczenia. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->