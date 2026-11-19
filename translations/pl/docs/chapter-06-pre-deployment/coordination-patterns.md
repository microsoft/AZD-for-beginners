# Wzorce Koordynacji Wieloagentowej

⏱️ **Szacowany czas**: 60-75 minut czytania; kilka godzin na wdrożenie | 💰 **Szacowany koszt**: zależny od nakładu pracy | ⭐ **Złożoność**: Zaawansowana

**📚 Ścieżka nauki:**
- ← Poprzedni: [Planowanie pojemności](capacity-planning.md) - Strategie doboru i skalowania zasobów
- 🎯 **Jesteś tutaj**: Wzorce Koordynacji Wieloagentowej (orkiestracja, komunikacja, zarządzanie stanem)
- → Następny: [Wybór SKU](sku-selection.md) - Dobór odpowiednich usług Azure
- 🏠 [Strona kursu](../../README.md)

---

## Czego się nauczysz

Po ukończeniu tej lekcji będziesz:
- Rozumiał wzorce **architektury wieloagentowej** oraz kiedy ich używać
- Implementował **wzorce orkiestracji** (scentralizowana, zdecentralizowana, hierarchiczna)
- Projektował strategie **komunikacji agentów** (synchronizacja, asynchronizacja, zdarzeniowe)
- Zarządzał **wspólnym stanem** wśród rozproszonych agentów
- Wdrażał **systemy wieloagentowe** na platformie Azure z użyciem AZD
- Stosował **wzorce koordynacyjne** w scenariuszach AI z prawdziwego świata
- Monitorował i debugował rozproszone systemy agentów

## Dlaczego koordynacja wieloagentowa jest ważna

### Ewolucja: od pojedynczego agenta do wieloagentowego systemu

**Pojedynczy agent (prosty):**
```
User → Agent → Response
```
- ✅ Łatwy do zrozumienia i implementacji
- ✅ Szybki dla prostych zadań
- ❌ Ograniczony możliwościami pojedynczego modelu
- ❌ Nie pozwala na równoległe przetwarzanie złożonych zadań
- ❌ Brak specjalizacji

**System wieloagentowy (zaawansowany):**
```mermaid
graph TD
    Orchestrator[Orchestrator] --> Agent1[Agent1<br/>Plan]
    Orchestrator --> Agent2[Agent2<br/>Code]
    Orchestrator --> Agent3[Agent3<br/>Review]
```
- ✅ Specjalizowani agenci do określonych zadań
- ✅ Równoległe wykonanie dla szybkości
- ✅ Modułowy i łatwy w utrzymaniu
- ✅ Lepszy przy złożonych procesach
- ⚠️ Wymaga logiki koordynacji

**Analogia**: pojedynczy agent to jak jedna osoba wykonująca wszystkie zadania. System wieloagentowy to zespół, w którym każdy członek ma specjalistyczne umiejętności (badacz, programista, recenzent, pisarz) i współpracują.

---

## Podstawowe wzorce koordynacji

### Wzorzec 1: Koordynacja sekwencyjna (łańcuch odpowiedzialności)

**Kiedy używać**: Zadania muszą być wykonane w określonym porządku, każdy agent buduje na wyjściu poprzedniego.

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as Research Agent
    participant Agent2 as Writer Agent
    participant Agent3 as Editor Agent
    
    User->>Orchestrator: "Write article about AI"
    Orchestrator->>Agent1: Research topic
    Agent1-->>Orchestrator: Research results
    Orchestrator->>Agent2: Write draft (using research)
    Agent2-->>Orchestrator: Draft article
    Orchestrator->>Agent3: Edit and improve
    Agent3-->>Orchestrator: Final article
    Orchestrator-->>User: Polished article
    
    Note over User,Agent3: Sequential: Each step waits for previous
```

**Korzyści:**
- ✅ Jasny przepływ danych
- ✅ Łatwy do debugowania
- ✅ Przewidywalna kolejność wykonania

**Ograniczenia:**
- ❌ Wolniejszy (brak równoległości)
- ❌ Jedna awaria blokuje cały łańcuch
- ❌ Nie radzi sobie z zadaniami współzależnymi

**Przykłady zastosowań:**
- Proces tworzenia treści (badania → pisanie → redakcja → publikacja)
- Generowanie kodu (planowanie → implementacja → testowanie → wdrożenie)
- Generowanie raportów (zbieranie danych → analiza → wizualizacja → podsumowanie)

---

### Wzorzec 2: Koordynacja równoległa (fan-out/fan-in)

**Kiedy używać**: Niezależne zadania mogą być wykonywane równocześnie, wyniki łączone na końcu.

```mermaid
graph TB
    User[User Request]
    Orchestrator[Orchestrator]
    Agent1[Analysis Agent]
    Agent2[Research Agent]
    Agent3[Data Agent]
    Aggregator[Result Aggregator]
    Response[Combined Response]
    
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
- ✅ Szybki (równoległe wykonanie)
- ✅ Odporność na błędy (akceptowane częściowe wyniki)
- ✅ Skalowalność horyzontalna

**Ograniczenia:**
- ⚠️ Wyniki mogą pojawić się w nieuporządkowanej kolejności
- ⚠️ Wymagana logika agregacji
- ⚠️ Złożone zarządzanie stanem

**Przykłady zastosowań:**
- Zbieranie danych z wielu źródeł (API + bazy danych + web scraping)
- Analiza konkurencji (wiele modeli generuje rozwiązania, wybierane jest najlepsze)
- Usługi tłumaczeniowe (tłumaczenie na wiele języków jednocześnie)

---

### Wzorzec 3: Koordynacja hierarchiczna (manager-pracownik)

**Kiedy używać**: Złożone przepływy pracy z podzadaniami, potrzebna delegacja.

```mermaid
graph TB
    Master[Master Orchestrator]
    Manager1[Research Manager]
    Manager2[Content Manager]
    W1[Web Scraper]
    W2[Paper Analyzer]
    W3[Writer]
    W4[Editor]
    
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
- ⚠️ Wyższe opóźnienia (wielowarstwowa koordynacja)
- ⚠️ Wymaga zaawansowanej orkiestracji

**Przykłady zastosowań:**
- Przetwarzanie dokumentów firmowych (klasyfikacja → routing → przetwarzanie → archiwizacja)
- Wieloetapowe potoki danych (pozyskiwanie → czyszczenie → transformacja → analiza → raportowanie)
- Złożone automatyzacje (planowanie → alokacja zasobów → wykonanie → monitorowanie)

---

### Wzorzec 4: Koordynacja zdarzeniowa (publish-subscribe)

**Kiedy używać**: Agenty muszą reagować na zdarzenia, oczekiwane luźne powiązania.

```mermaid
sequenceDiagram
    participant Agent1 as Data Collector
    participant EventBus as Azure Service Bus
    participant Agent2 as Analyzer
    participant Agent3 as Notifier
    participant Agent4 as Archiver
    
    Agent1->>EventBus: Publish "DataReceived" event
    EventBus->>Agent2: Subscribe: Analyze data
    EventBus->>Agent3: Subscribe: Send notification
    EventBus->>Agent4: Subscribe: Archive data
    
    Note over Agent1,Agent4: All subscribers process independently
    
    Agent2->>EventBus: Publish "AnalysisComplete" event
    EventBus->>Agent3: Subscribe: Send analysis report
```

**Korzyści:**
- ✅ Luźne powiązanie między agentami
- ✅ Łatwość dodawania nowych agentów (wystarczy subskrypcja)
- ✅ Przetwarzanie asynchroniczne
- ✅ Odporność (trwałość wiadomości)

**Ograniczenia:**
- ⚠️ Ostateczna spójność
- ⚠️ Trudności z debugowaniem
- ⚠️ Trudności z porządkiem wiadomości

**Przykłady zastosowań:**
- Systemy monitoringu w czasie rzeczywistym (alerty, panele, logi)
- Powiadomienia wielokanałowe (email, SMS, push, Slack)
- Potoki przetwarzania danych (wielu konsumentów tych samych danych)

---

### Wzorzec 5: Koordynacja oparta na konsensusie (głosowanie/kworum)

**Kiedy używać**: Potrzeba zgody wielu agentów przed kontynuacją.

```mermaid
graph TB
    Input[Input Task]
    Agent1[Agent 1: gpt-4.1]
    Agent2[Agent 2: Claude]
    Agent3[Agent 3: Gemini]
    Voter[Consensus Voter]
    Output[Agreed Output]
    
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
- ✅ Odporność na błędy (akceptowane mniejsze niepowodzenia)
- ✅ Wbudowana kontrola jakości

**Ograniczenia:**
- ❌ Kosztowny (wiele wywołań modeli)
- ❌ Wolniejszy (oczekiwanie na wszystkich agentów)
- ⚠️ Wymaga rozwiązywania konfliktów

**Przykłady zastosowań:**
- Moderacja treści (wiele modeli ocenia treść)
- Przegląd kodu (wiele linterów/analityków)
- Diagnostyka medyczna (wiele modeli AI, walidacja ekspertów)

---

## Przegląd architektury

### Kompletny system wieloagentowy na platformie Azure

```mermaid
graph TB
    User[User/API Client]
    APIM[Azure API Management]
    Orchestrator[Orchestrator Service<br/>Container App]
    ServiceBus[Azure Service Bus<br/>Queues / Topics]
    
    Agent1[Research Agent<br/>Container App]
    Agent2[Writer Agent<br/>Container App]
    Agent3[Analyst Agent<br/>Container App]
    Agent4[Reviewer Agent<br/>Container App]
    
    CosmosDB[(Cosmos DB<br/>Shared State)]
    Storage[Azure Storage<br/>Artifacts]
    AppInsights[Application Insights<br/>Monitoring]
    
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
| **API Gateway** | Punkt wejścia, limitowanie zapytań, uwierzytelnianie | API Management |
| **Orkiestrator** | Koordynuje przepływy pracy agentów | Container Apps |
| **Kolejka wiadomości** | Komunikacja asynchroniczna | Service Bus / Event Hubs |
| **Agenci** | Specjalizowani pracownicy AI | Container Apps / Functions |
| **Magazyn stanu** | Wspólny stan, śledzenie zadań | Cosmos DB |
| **Magazyn artefaktów** | Dokumenty, wyniki, logi | Blob Storage |
| **Monitoring** | Rozproszone śledzenie, logi | Application Insights |

Kolejki/tematy Service Bus oraz Event Hubs to różne usługi z różnymi modelami dostarczania/konsumpcji; Event Hubs nie jest zamiennikiem kodu roboczego Service Bus poniżej. Równoległość, utrwalone wiadomości i głosowanie modeli same w sobie nie gwarantują odporności na błędy ani większej dokładności.

---

## Wymagania wstępne

### Wymagane narzędzia

```bash
# Verify Azure Developer CLI
azd version
# Command reference baseline: azd 1.37.2

# Verify Azure CLI
az --version
# ✅ Expected: azure-cli 2.50.0 or higher

# Verify Docker (for local testing)
docker --version
# ✅ Expected: Docker version 20.10 or higher
```

### Wymagania platformy Azure

- Aktywna subskrypcja Azure
- Uprawnienia do tworzenia:
  - Container Apps
  - namespace'ów Service Bus
  - kont Cosmos DB
  - kont Storage
  - Application Insights

### Wymagane umiejętności

Powinieneś ukończyć:
- [Zarządzanie konfiguracją](../chapter-03-configuration/configuration.md)
- [Uwierzytelnianie i bezpieczeństwo](../chapter-03-configuration/authsecurity.md)
- [Przykład mikroserwisów](../../../../examples/microservices)

---

## Przewodnik implementacji

> **Fragmenty projektu, nie wdrażalne laboratorium:** Drzewo projektu i etykiety `File:` poniżej opisują pliki do utworzenia we własnym projekcie; to repozytorium nie zawiera kompletnej aplikacji `multi-agent-system`. Brakuje głównych szablonów/parametrów, środowiska/rejestru Container Apps, Dockerfiles i blokad zależności, konfiguracji bazy danych/kontenera Cosmos, wdrożeń modeli, konfiguracji tożsamości/rol, zasad skalowania oraz równoległych robotników/kolejek. Nie oczekuj, że `azd init` wygeneruje te pliki lub `azd up` wdroży skrypty bez zmian. Dla wykonalnego punktu startowego ukończ [Podstawy wieloagentowe](../chapter-05-multi-agent/multi-agent-basics.md).

**Założenia środowiskowe:** Python 3.10+, `azure-servicebus`, `azure-cosmos`, `openai`, Flask i (do monitoringu) `azure-monitor-opentelemetry`; umieść `shared` na ścieżce importu Pythona w każdym obrazie usługi. Kontener Cosmos `agent-state/tasks` musi już istnieć z kluczem partycji `/id`. Połączenia oparte na kluczach upraszczają te fragmenty, nie są produkcyjnymi rekomendacjami: preferuj zarządzane tożsamości z odpowiednio zakresowymi rolami danych Service Bus/Cosmos/OpenAI. Nie eksponuj kluczy w wynikach ani logach.

Dostarczanie w Service Bus jest **przynajmniej jednokrotne**. Wprowadź idempotencję per zadanie **i krok**, używaj optymistycznej współbieżności (ETags) do odczytu/modyfikacji/zapisu stanu oraz odnawiaj blokady wiadomości podczas długiego przetwarzania. Poniższy prosty menedżer stanu jest wyłącznie sekwencyjny i nie implementuje tych gwarancji produkcyjnych.

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

Zaprojektujmy sekwencyjny pipeline: Badania → Pisanie → Redakcja. Publikacja jest poza tym przykładem.

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
// Do not output RootManageSharedAccessKey. Resolve scoped credentials
// securely or use managed identity in the application and scale rules.
```

### 3. Menedżer wspólnego stanu

**Plik: `src/shared/state_manager.py`**

```python
from azure.cosmos import CosmosClient, PartitionKey
from datetime import datetime, timezone
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
            'created_at': datetime.now(timezone.utc).isoformat(),
            'steps': []
        }
        self.container.create_item(task)
        return task
    
    def update_task_step(self, task_id: str, step_name: str, result: dict):
        """Update task with completed step"""
        task = self.container.read_item(task_id, partition_key=task_id)
        
        task['steps'].append({
            'name': step_name,
            'completed_at': datetime.now(timezone.utc).isoformat(),
            'result': result
        })
        
        self.container.replace_item(task_id, task)
        return task
    
    def complete_task(self, task_id: str, final_result: dict):
        """Mark task as complete"""
        task = self.container.read_item(task_id, partition_key=task_id)
        task['status'] = 'completed'
        task['result'] = final_result
        task['completed_at'] = datetime.now(timezone.utc).isoformat()
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

# Service Bus connection
servicebus_connection_str = os.environ['SERVICEBUS_CONNECTION_STRING']
servicebus_client = ServiceBusClient.from_connection_string(servicebus_connection_str)

@app.route('/health', methods=['GET'])
def health():
    return jsonify({'status': 'healthy', 'service': 'orchestrator'})

@app.route('/create-content', methods=['POST'])
def create_content():
    """
    Sequential workflow: Research → Write → Edit (returns a draft; no publishing)
    """
    data = request.get_json(silent=True) or {}
    topic = data.get('topic')
    
    if not topic:
        return jsonify({'error': 'Topic required'}), 400
    
    # Create task in state store
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # Send message to research agent (first step)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # Where to send results
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    return jsonify({
        'task_id': task_id,
        'status': 'started',
        'workflow': 'sequential',
        'steps': ['research', 'write', 'edit'],
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

# Initialize clients
state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-10-21",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_research_task(message_data):
    """Process research request and pass to writer"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    next_queue = message_data['next_queue']
    
    print(f"🔬 Researching: {topic}")
    
    # Call Microsoft Foundry Models for research
    response = openai_client.chat.completions.create(
        model=os.environ['AZURE_OPENAI_DEPLOYMENT'],
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # Update state
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # Send to next agent (writer)
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
    api_version="2024-10-21",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_writing_task(message_data):
    """Write article based on research"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    research = message_data['research']
    next_queue = message_data['next_queue']
    
    print(f"✍️ Writing article: {topic}")
    
    # Call Microsoft Foundry Models to write article
    response = openai_client.chat.completions.create(
        model=os.environ['AZURE_OPENAI_DEPLOYMENT'],
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # Update state
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # Send to editor
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
    api_version="2024-10-21",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_editing_task(message_data):
    """Edit and finalize article"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    draft = message_data['draft']
    
    print(f"📝 Editing article: {topic}")
    
    # Call Microsoft Foundry Models to edit
    response = openai_client.chat.completions.create(
        model=os.environ['AZURE_OPENAI_DEPLOYMENT'],
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # Mark task as complete
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

### 8. Wdrożenie i testy

Te polecenia mają zastosowanie **dopiero po wdrożeniu brakujących plików projektu**. Inicjalizacja agenta Interactive Foundry to odrębny proces; nie generuje tej architektury Service Bus.

```bash
# In your completed custom project
azd up

# Alternative in a SEPARATE empty folder (GA bundle workflow requires azd >= 1.37.0)
azd ext install microsoft.foundry
azd ai agent init
azd up
```

> Zobacz [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) dla wszystkich flag i opcji `azd ai`.

```bash
# Get orchestrator URL
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Create content
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ Oczekiwany output:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit"],
  "message": "Content creation pipeline initiated"
}
```

**Sprawdź postęp zadania:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Oczekiwany output (ukończone):**
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

### Implementacja: Agregator badań wieloźródłowych

Zbudujmy równoległy system zbierający informacje z wielu źródeł jednocześnie.

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
    
    # Fan-out: publish sequentially; workers may process concurrently.
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

# Single-process demo only: not durable or shared across replicas.
# Production: use durable unique (task_id, agent_type) result records.
task_results = defaultdict(dict)
expected_agents = 4  # web, academic, news, social

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # Store result
    task_results[task_id][agent_type] = {
        'agent': agent_type,
        'data': result
    }
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # Check if all agents completed (fan-in)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # Combine results
        aggregated = {
            'query': message_data['query'],
            'sources': list(task_results[task_id].values()),
            'summary': generate_summary(list(task_results[task_id].values()))
        }
        
        # Mark complete
        state_manager.complete_task(task_id, aggregated)
        
        # Clean up
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
- ⚡ **Potencjalnie niższe opóźnienie** (ograniczone przez najwolniejszego pracownika plus narzut koordynacji)
- 🔄 **Obsługuje częściowe wyniki** z wyraźnymi terminami i polityką błędów (nie implementowane przez podstawowy agregator)
- 📈 **Skalowalny** (łatwe dodawanie agentów)

---

## Ćwiczenia praktyczne

### Ćwiczenie 1: Dodaj obsługę timeout ⭐⭐ (Średnie)

**Cel**: Wdróż logikę timeout, aby agregator nie czekał wiecznie na spóźnionych agentów.

**Punkt startowy:** Uruchom tę lokalną symulację deadline przed integracją z workerem kolejki. Timeout sprawdzany tylko podczas nadejścia innej wiadomości nigdy nie zadziała, jeśli brakujący pracownik nic nie wyśle.

**Kroki**:

1. **Dodaj śledzenie timeout do agregatora:**

```python
import asyncio

async def simulated_agent(name, delay):
    await asyncio.sleep(delay)
    return {'agent': name, 'result': 'done'}

async def main():
    tasks = [asyncio.create_task(simulated_agent(name, delay))
             for name, delay in [('web', 0.1), ('academic', 0.2),
                                 ('news', 0.3), ('social', 3)]]
    done, pending = await asyncio.wait(tasks, timeout=1)
    results = [task.result() for task in done]
    for task in pending:
        task.cancel()
    await asyncio.gather(*pending, return_exceptions=True)
    print({'completed_agents': len(results), 'timed_out': bool(pending)})
    assert len(results) == 3 and pending

asyncio.run(main())
```

2. **Oczekiwany output:**

```text
{'completed_agents': 3, 'timed_out': True}
```

3. **Integracja z systemem kolejek (zadanie projektowe):** Zachowaj deadline przesyłania i oczekiwanych agentów przy tworzeniu zadania, uruchamiaj okresowe czyszczenie deadline niezależne od przychodzących wyników, atomowo finalizuj częściowe wyniki i ignoruj spóźnione/duplikaty wiadomości dla zakończonych zadań. Lokalny timeout nie przerywa zdalnych workerów.

Wyłącznie dla Twojego wdrożonego projektu:

```bash
azd deploy aggregator

# Submit task
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Check results after 30 seconds
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Kryteria sukcesu:**
- ✅ Lokalny test zwraca wynik po jednym sekundowym terminie, nawet jeśli agent jest niekompletny
- ✅ Odpowiedź zawiera częściowe wyniki (`"timed_out": true`)
- ✅ Dostępne wyniki są zwracane (3 z 4 agentów)

**Czas**: 20-25 minut

---

### Ćwiczenie 2: Implementacja logiki ponawiania prób ⭐⭐⭐ (Zaawansowane)

**Cel**: Automatyczne ponawianie nieudanych zadań agentów przed poddaniem się.

**Kroki**:

1. **Użyj liczników dostarczania Service Bus zamiast własnych liczników retry:**

```python
import json
import time
# Integration fragment: use a live peek-lock ServiceBusReceiver.
# Set queue maxDeliveryCount to 4 for one attempt + up to three retries.
```

2. **Dodaj handler retry do agentów:**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # Process the message
        process_func(message_data)
        
        # Success - complete
        receiver.complete_message(message)
        
    except Exception as e:
        if message.delivery_count < 4:
            # Bounded exponential delay: 5s, 10s, 20s.
            # Renew the lock if processing + waiting can exceed its duration.
            time.sleep(5 * 2 ** (message.delivery_count - 1))
            receiver.abandon_message(message)
        else:
            # Max retries exceeded - move to dead letter queue
            print(f"❌ Max attempts exceeded for message {message.message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **Monitoruj kolejkę martwych listów:**

```python
def monitor_dead_letters():
    """Check dead letter queue for failed messages"""
    receiver = servicebus_client.get_queue_receiver(
        'research-tasks',
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
- ✅ Eksponecnjalny odstęp między retry (5s, 10s, 20s), z odnawianiem blokady wiadomości tam, gdzie trzeba
- ✅ Po maksymalnych retry wiadomości trafiają na kolejkę martwych listów
- ✅ Wiadomości w martwej kolejce można przeglądać; odtwarzanie wymaga osobnego idempotentnego procesu odzyskiwania

**Czas**: 30-40 minut

---

### Ćwiczenie 3: Implementacja wyłącznika obwodu (Circuit Breaker) ⭐⭐⭐ (Zaawansowane)

**Cel**: Zapobiec kaskadowym awariom przez zatrzymanie zapytań do zawodnych agentów.

**Kroki**:

1. **Stwórz klasę wyłącznika obwodu:**

```python
from enum import Enum
from datetime import datetime, timedelta, timezone

class CircuitState(Enum):
    CLOSED = "closed"      # Normal operation
    OPEN = "open"          # Failing, reject requests
    HALF_OPEN = "half_open"  # Testing if recovered

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
            # Check if timeout expired
            if datetime.now(timezone.utc) - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # Success
            self.failure_count = 0 # Count consecutive failures only
            if self.state == CircuitState.HALF_OPEN:
                self.state = CircuitState.CLOSED
                self.failure_count = 0
                print("✅ Circuit breaker: CLOSED (recovered)")
            
            return result
            
        except Exception as e:
            self.failure_count += 1
            self.last_failure_time = datetime.now(timezone.utc)
            
            if self.failure_count >= self.failure_threshold:
                self.state = CircuitState.OPEN
                print(f"🔴 Circuit breaker: OPEN (too many failures)")
            
            raise
```

2. **Zastosuj w wywołaniach agentów:**

```python
# In orchestrator
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
        # Continue with other agents
```

Ten układ chroni **operację wysyłania**, a nie zakończenie przez zdalnego agenta: pomyślne umieszczenie wiadomości w kolejce nic nie mówi o tym, czy agent jest aktywny. `send_message` to funkcja wysyłająca w Twojej aplikacji. Dla obwodów wykonawczych przekazuj obserwowane awarie/zakończenia z przekroczeniem czasu zadań do trwałego koordynatora. Ta klasa działająca w pamięci jest demonstracją jednowątkową, a nie rozproszonym wyłącznikiem obwodu.

3. **Testuj wyłącznik obwodu lokalnie:**

```python
# Run after the class definition; no Azure changes required.
circuit = CircuitBreaker(failure_threshold=5, timeout_seconds=0)
def fail():
    raise RuntimeError("simulated failure")
for _ in range(5):
    try:
        circuit.call(fail)
    except RuntimeError:
        pass
assert circuit.state == CircuitState.OPEN
assert circuit.call(lambda: "recovered") == "recovered"
assert circuit.state == CircuitState.CLOSED
print("Circuit breaker recovery verified")
```

**✅ Kryteria sukcesu:**
- ✅ Po 5 niepowodzeniach obwód otwiera się (odrzuca żądania)
- ✅ Po 60 sekundach obwód przechodzi w stan półotwarty (testuje odzyskanie)
- ✅ Inne agenty działają normalnie
- ✅ Obwód zamyka się automatycznie po odzyskaniu agenta

**Czas**: 40-50 minut

---

## Monitorowanie i debugowanie

### Rozproszone śledzenie za pomocą Application Insights

**Plik: `src/shared/tracing.py`**

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace
from opentelemetry.trace import SpanKind
import logging
import os

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# Configure once per process. Message send/receive trace-context propagation
# and agent attributes on exceptions need explicit instrumentation.
if connection_string:
    configure_azure_monitor(connection_string=connection_string, logger_name=__name__)
tracer = trace.get_tracer(__name__)

# Configure logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

def trace_agent_call(agent_name, task_id, operation_name, operation):
    """Trace agent operations"""
    with tracer.start_as_current_span(f'agent.{agent_name}.{operation_name}', kind=SpanKind.CLIENT) as span:
        span.set_attribute('agent', agent_name)
        span.set_attribute('task_id', task_id)
        span.set_attribute('operation', operation_name)
        
        try:
            result = operation()
            span.set_attribute('status', 'success')
            logger.info('Agent operation completed', extra={
                'agent': agent_name, 'task_id': task_id, 'operation': operation_name
            })
            return result
        except Exception as e:
            span.set_attribute('status', 'error')
            logger.exception('Agent operation failed', extra={
                'agent': agent_name, 'task_id': task_id, 'operation': operation_name
            })
            raise
```

### Zapytania w Application Insights

**Śledzenie przepływów pracy z wieloma agentami:**

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

Wyłącznie ilustracyjne dane planistyczne, nie oferty: suma poniżej to **240-565 USD/miesiąc**. Sprawdź aktualne stawki regionalne, godziny działania/niewykorzystane repliki, miks tokenów wejściowych/wyjściowych, pamięć masową i telemetrię. Serverless nie wymaga minimalnej przepustowości, ale nadal nalicza opłaty za żądania i pamięć masową.

| Komponent | Konfiguracja | Koszt |
|-----------|--------------|------|
| **Orkiestrator** | 1 Container App (1 vCPU, 2GB) | 30-50 USD |
| **4 Agenty** | 4 Container Apps (0.5 vCPU, 1GB każdy) | 60-120 USD |
| **Service Bus** | Poziom standardowy, 10 mln wiadomości | 10-20 USD |
| **Cosmos DB** | Serverless, 5GB pamięci, 1 mln RU | 25-50 USD |
| **Blob Storage** | 10GB pamięci, 100 tys. operacji | 5-10 USD |
| **Application Insights** | 5GB importu | 10-15 USD |
| **Microsoft Foundry Models** | gpt-4.1, 10 mln tokenów | 100-300 USD |
| **Razem** | | **240-565 USD/miesiąc** |

### Strategie optymalizacji kosztów

1. **Używaj serverless tam, gdzie to możliwe:**
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
     minReplicas: 0  // Requires a Service Bus/KEDA scale rule to wake workers
     maxReplicas: 10
   }
   ```

3. **Używaj grupowania dla Service Bus:**
   ```python
   # Send messages in batches (cheaper)
   sender.send_messages([message1, message2, message3])
   ```

4. **Przechowuj w pamięci wyniki często używane:**
   ```python
   # Use Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Najlepsze praktyki

### ✅ Rób:

1. **Używaj operacji idempotentnych**
   ```python
   # Pseudocode: implement a durable, atomic per-step deduplication claim.
   def process_task(task_id):
       raise NotImplementedError("Claim (task_id, step) atomically, execute, persist outcome")
   ```

2. **Wdróż kompleksowe logowanie**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Używaj identyfikatorów korelacji**
   ```python
   # Pass task_id through entire workflow
   message_data = {
       'task_id': task_id,  # Correlation ID
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Ustaw TTL (czas życia) wiadomości**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Monitoruj kolejki dead letter**
   ```python
   # Regular monitoring of failed messages
   monitor_dead_letters()
   ```

### ❌ Nie rób:

1. **Nie twórz zależności cyklicznych**
   ```python
   # ❌ BAD: Agent A → Agent B → Agent A (infinite loop)
   # ✅ GOOD: Define clear directed acyclic graph (DAG)
   ```

2. **Nie blokuj wątków agentów**
   ```python
   # ❌ BAD: Synchronous wait
   while not task_complete:
       time.sleep(1)
   
   # ✅ GOOD: Use message queue callbacks
   ```

3. **Nie ignoruj częściowych niepowodzeń**
   ```python
   # ❌ BAD: Fail entire workflow if one agent fails
   # ✅ GOOD: Return partial results with error indicators
   ```

4. **Nie używaj nieskończonych prób ponawiania**
   ```python
   # ❌ BAD: retry forever
   # ✅ GOOD: max_retries = 3, then dead letter
   ```

---

## Przewodnik rozwiązywania problemów

### Problem: Wiadomości utknięte w kolejce

**Objawy:**
- Wiadomości gromadzą się w kolejce
- Agenty nie przetwarzają
- Status zadania utknięty na „oczekujące”

**Diagnoza:**
```bash
# Check queue depth
az servicebus queue show \
  --resource-group "$RG_NAME" \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Check agent logs using Azure CLI
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**Rozwiązania:**

1. **Zwiększ liczbę replik agentów:**
   ```bash
   az containerapp update \
     --resource-group "$RG_NAME" \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Sprawdź kolejkę dead letter:**
   ```bash
   az servicebus queue show \
     --resource-group "$RG_NAME" \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problem: Przekroczenie czasu zadania / zadanie nigdy się nie kończy

**Objawy:**
- Status zadania pozostaje „w toku”
- Niektóre agenty kończą, inne nie
- Brak komunikatów o błędach

**Diagnoza:**
```bash
# Check task state
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Check Application Insights
# Run query: traces | where customDimensions.task_id == "..."
```

**Rozwiązania:**

1. **Wdróż limit czasu w agregatorze (Ćwiczenie 1)**

2. **Sprawdź awarie agentów za pomocą Azure Monitor:**
   ```bash
   # View logs via azd monitor
   azd monitor --logs
   
   # Or use Azure CLI to check specific container app logs
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
- [AI Agent Orchestration Patterns](https://learn.microsoft.com/azure/architecture/ai-ml/guide/ai-agent-design-patterns)

### Kolejne kroki w tym kursie
- ← Poprzedni: [Planowanie pojemności](capacity-planning.md)
- → Następny: [Wybór SKU](sku-selection.md)
- 🏠 [Strona główna kursu](../../README.md)

### Powiązane przykłady
- [Przykład mikroserwisów](../../../../examples/microservices) - Wzorce komunikacji usług
- [Przykład Microsoft Foundry Models](../../../../examples/azure-openai-chat) - Integracja AI

---

## Podsumowanie

**Nauczyłeś się:**
- ✅ Pięć wzorców koordynacji (sekwencyjny, równoległy, hierarchiczny, zdarzeniowy, konsensus)
- ✅ Architektura wieloagentowa na Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Zarządzanie stanem w rozproszonych agentach
- ✅ Obsługa limitów czasu, ponawianie prób i wyłączniki obwodu
- ✅ Monitorowanie i debugowanie systemów rozproszonych
- ✅ Strategie optymalizacji kosztów

**Kluczowe wnioski:**
1. **Wybierz odpowiedni wzorzec** - Sekwencyjny dla uporządkowanych przepływów, równoległy dla szybkości, zdarzeniowy dla elastyczności
2. **Dokładnie zarządzaj stanem** - Używaj Cosmos DB lub podobnego do stanu współdzielonego
3. **Łagodnie obsługuj awarie** - Limity czasu, ponowienia, wyłączniki obwodu, kolejki dead letter
4. **Monitoruj wszystko** - Rozproszone śledzenie jest niezbędne do debugowania
5. **Optymalizuj koszty** - Skaluj do zera, używaj serverless, implementuj cache

**Następne kroki:**
1. Wykonaj ćwiczenia praktyczne
2. Zbuduj system wieloagentowy dla swojego zastosowania
3. Przestudiuj [Wybór SKU](sku-selection.md), aby zoptymalizować wydajność i koszty

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->