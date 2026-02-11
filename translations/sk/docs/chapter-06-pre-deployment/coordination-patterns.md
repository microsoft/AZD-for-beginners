# Vzory koordinácie viacagentových systémov

⏱️ **Odhadovaný čas**: 60-75 minút | 💰 **Odhadované náklady**: ~$100-300/mesiac | ⭐ **Zložitosť**: Pokročilé

**📚 Vzdelávacia cesta:**
- ← Predchádzajúce: [Plánovanie kapacity](capacity-planning.md) - Odporúčanie zdrojov a stratégie škálovania
- 🎯 **Nachádzate sa tu**: Vzory koordinácie viacagentových systémov (orchestrace, komunikácia, správa stavu)
- → Ďalšie: [Výber SKU](sku-selection.md) - Výber správnych Azure služieb
- 🏠 [Domov kurzu](../../README.md)

---

## Čo sa naučíte

Po dokončení tejto lekcie:
- Pochopíte **vzory viacagentnej architektúry** a kedy ich používať
- Implementujete **orchestračné vzory** (centralizované, decentralizované, hierarchické)
- Navrhnete **stratégie komunikácie agentov** (synchrónna, asynchrónna, event-driven)
- Spravujete **zdieľaný stav** medzi distribuovanými agentmi
- Nasadíte **viacagentné systémy** na Azure pomocou AZD
- Aplikujete **koordinačné vzory** pre reálne AI scenáre
- Monitorujete a debugujete distribuované systémové agenty

## Prečo je koordinácia viac agentov dôležitá

### Evolúcia: Od jedného agenta k viacagentnému systému

**Jeden agent (Jednoduché):**
```
User → Agent → Response
```
- ✅ Ľahké na pochopenie a implementáciu
- ✅ Rýchle pre jednoduché úlohy
- ❌ Limitované schopnosťami jedného modelu
- ❌ Nemožno paralelizovať zložité úlohy
- ❌ Žiadna špecializácia

**Viacagentný systém (Pokročilé):**
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
- ✅ Špecializovaní agenti pre konkrétne úlohy
- ✅ Paralelné vykonávanie pre rýchlosť
- ✅ Modulárne a udržiavateľné
- ✅ Lepšie pre zložité pracovné postupy
- ⚠️ Vyžaduje koordinačnú logiku

**Analógia**: Jeden agent je ako jedna osoba, ktorá robí všetky úlohy. Viacagentný systém je ako tím, kde má každý člen špecializované zručnosti (výskumník, programátor, recenzent, autor), ktoré spolupracujú.

---

## Hlavné koordinačné vzory

### Vzor 1: Sekvenčná koordinácia (Reťaz zodpovednosti)

**Kedy použiť**: Úlohy sa musia dokončiť v konkrétnom poradí, každý agent nadväzuje na výstup predchádzajúceho.

```mermaid
sequenceDiagram
    participant User as Používateľ
    participant Orchestrator as Orchestrátor
    participant Agent1 as Výskumný agent
    participant Agent2 as Agent pre písanie
    participant Agent3 as Redakčný agent
    
    User->>Orchestrator: "Napíš článok o AI"
    Orchestrator->>Agent1: Preskúmaj tému
    Agent1-->>Orchestrator: Výsledky výskumu
    Orchestrator->>Agent2: Napíš koncept (s využitím výskumu)
    Agent2-->>Orchestrator: Koncept článku
    Orchestrator->>Agent3: Uprav a vylepši
    Agent3-->>Orchestrator: Konečný článok
    Orchestrator-->>User: Upravený článok
    
    Note over User,Agent3: Sekvenčné: Každý krok čaká na predchádzajúci
```}
**Výhody:**
- ✅ Jasný tok dát
- ✅ Ľahké na ladenie
- ✅ Predvídateľné poradie vykonávania

**Obmedzenia:**
- ❌ Pomalšie (žiadna paralelizácia)
- ❌ Jedna chyba zablokuje celú reťaz
- ❌ Nedokáže riešiť vzájomne závislé úlohy

**Príklady použitia:**
- Pipeline tvorby obsahu (výskum → písanie → úprava → publikovanie)
- Generovanie kódu (plán → implementácia → testovanie → nasadenie)
- Generovanie správ (zber dát → analýza → vizualizácia → zhrnutie)

---

### Vzor 2: Paralelná koordinácia (Fan-Out/Fan-In)

**Kedy použiť**: Nezávislé úlohy môžu bežať súčasne, výsledky sa skombinujú na konci.

```mermaid
graph TB
    User[Požiadavka používateľa]
    Orchestrator[Orchestrátor]
    Agent1[Analytický agent]
    Agent2[Výskumný agent]
    Agent3[Dátový agent]
    Aggregator[Agregátor výsledkov]
    Response[Kombinovaná odpoveď]
    
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
**Výhody:**
- ✅ Rýchle (paralelné vykonávanie)
- ✅ Odolné voči chybám (čiastočné výsledky sú prijateľné)
- ✅ Horizontálne škálovateľné

**Obmedzenia:**
- ⚠️ Výsledky môžu prísť v nesprávnom poradí
- ⚠️ Potrebná agregačná logika
- ⚠️ Zložitejšia správa stavu

**Príklady použitia:**
- Zber dát z viacerých zdrojov (APIs + databázy + web scraping)
- Konkurenčná analýza (viac modelov generuje riešenia, vyberie sa najlepší)
- Prekladateľské služby (súčasný preklad do viacerých jazykov)

---

### Vzor 3: Hierarchická koordinácia (Manažér-Worker)

**Kedy použiť**: Zložité pracovné postupy s podúlohami, potrebná delegácia.

```mermaid
graph TB
    Master[Hlavný Orchestrátor]
    Manager1[Manažér výskumu]
    Manager2[Manažér obsahu]
    W1[Webový skraper]
    W2[Analyzátor článkov]
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
**Výhody:**
- ✅ Rieši zložité pracovné postupy
- ✅ Modulárne a udržiavateľné
- ✅ Jasné hranice zodpovednosti

**Obmedzenia:**
- ⚠️ Komplexnejšia architektúra
- ⚠️ Vyššia latencia (viac vrstiev koordinácie)
- ⚠️ Vyžaduje sofistikovanú orchestráciu

**Príklady použitia:**
- Spracovanie podnikových dokumentov (klasifikácia → smerovanie → spracovanie → archivácia)
- Viacstupňové dátové pipeline (ingest → čistenie → transformácia → analýza → report)
- Zložité automatizačné pracovné postupy (plánovanie → prideľovanie zdrojov → vykonávanie → monitorovanie)

---

### Vzor 4: Event-driven koordinácia (Publish-Subscribe)

**Kedy použiť**: Agenti potrebujú reagovať na udalosti, želaná je voľná väzba.

```mermaid
sequenceDiagram
    participant Agent1 as Zberateľ údajov
    participant EventBus as Azure Service Bus
    participant Agent2 as Analytik
    participant Agent3 as Notifikátor
    participant Agent4 as Archivátor
    
    Agent1->>EventBus: Publikovať "Údaje prijaté" udalosť
    EventBus->>Agent2: Odoberať: Analyzovať údaje
    EventBus->>Agent3: Odoberať: Odoslať upozornenie
    EventBus->>Agent4: Odoberať: Archivovať údaje
    
    Note over Agent1,Agent4: Všetci odberatelia spracovávajú nezávisle
    
    Agent2->>EventBus: Publikovať "Analýza dokončená" udalosť
    EventBus->>Agent3: Odoberať: Odoslať správu o analýze
```
**Výhody:**
- ✅ Voľné viazanie medzi agentmi
- ✅ Ľahké pridať nových agentov (stačí sa prihlásiť na odber)
- ✅ Asynchrónne spracovanie
- ✅ Odolné (perzistencia správ)

**Obmedzenia:**
- ⚠️ Eventualna konzistencia
- ⚠️ Zložité ladenie
- ⚠️ Výzvy v poradí správ

**Príklady použitia:**
- Systémy pre monitorovanie v reálnom čase (alerty, dashboardy, logy)
- Notifikácie cez viaceré kanály (email, SMS, push, Slack)
- Dátové pipeline (viacerí konzumenti rovnakých dát)

---

### Vzor 5: Konsenzusová koordinácia (Hlasovanie/Kvorum)

**Kedy použiť**: Potrebné je získať súhlas viacerých agentov pred pokračovaním.

```mermaid
graph TB
    Input[Vstupná úloha]
    Agent1[Agent 1: GPT-4]
    Agent2[Agent 2: Claude]
    Agent3[Agent 3: Gemini]
    Voter[Konsenzusný volič]
    Output[Dohodnutý výstup]
    
    Input --> Agent1
    Input --> Agent2
    Input --> Agent3
    Agent1 --> Voter
    Agent2 --> Voter
    Agent3 --> Voter
    Voter --> Output
    
    style Voter fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
```
**Výhody:**
- ✅ Vyššia presnosť (viac názorov)
- ✅ Odolné voči chybám (prijaté sú menšinové chyby)
- ✅ Zabezpečenie kvality vstavané

**Obmedzenia:**
- ❌ Nákladné (viaceré volania modelov)
- ❌ Pomalšie (čakanie na všetkých agentov)
- ⚠️ Potrebné riešenie konfliktov

**Príklady použitia:**
- Moderovanie obsahu (kontrola viacerými modelmi)
- Code review (viacero linterov/analyzátorov)
- Lekárska diagnostika (viaceré AI modely, overenie expertom)

---

## Prehľad architektúry

### Kompletný viacagentný systém na Azure

```mermaid
graph TB
    User[Používateľ/API klient]
    APIM[Azure správa API]
    Orchestrator[Orchestrátor služby<br/>Kontejnerová aplikácia]
    ServiceBus[Azure Service Bus<br/>Eventový hub]
    
    Agent1[Výskumný agent<br/>Kontejnerová aplikácia]
    Agent2[Agent pre písanie<br/>Kontejnerová aplikácia]
    Agent3[Analytický agent<br/>Kontejnerová aplikácia]
    Agent4[Agent pre kontrolu<br/>Kontejnerová aplikácia]
    
    CosmosDB[(Cosmos DB<br/>Zdieľaný stav)]
    Storage[Azure Storage<br/>Artefakty]
    AppInsights[Application Insights<br/>Monitorovanie]
    
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
**Kľúčové komponenty:**

| Component | Purpose | Azure Service |
|-----------|---------|---------------|
| **API Gateway** | Entry point, rate limiting, auth | API Management |
| **Orchestrator** | Coordinates agent workflows | Container Apps |
| **Message Queue** | Asynchronous communication | Service Bus / Event Hubs |
| **Agents** | Specialized AI workers | Container Apps / Functions |
| **State Store** | Shared state, task tracking | Cosmos DB |
| **Artifact Storage** | Documents, results, logs | Blob Storage |
| **Monitoring** | Distributed tracing, logs | Application Insights |

---

## Predpoklady

### Vyžadované nástroje

```bash
# Overiť Azure Developer CLI
azd version
# ✅ Očakávané: azd verzia 1.0.0 alebo novšia

# Overiť Azure CLI
az --version
# ✅ Očakávané: azure-cli 2.50.0 alebo novšia

# Overiť Docker (na lokálne testovanie)
docker --version
# ✅ Očakávané: Docker verzia 20.10 alebo novšia
```

### Požiadavky Azure

- Aktívne predplatné Azure
- Povolenia na vytvorenie:
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB accounts
  - Storage accounts
  - Application Insights

### Požadované znalosti

Mali by ste mať dokončené:
- [Správa konfigurácie](../chapter-03-configuration/configuration.md)
- [Overovanie & Bezpečnosť](../chapter-03-configuration/authsecurity.md)
- [Príklad mikroslužieb](../../../../examples/microservices)

---

## Implementačný návod

### Štruktúra projektu

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

## Lekcia 1: Sekvenčný koordinačný vzor

### Implementácia: Pipeline tvorby obsahu

Postavme sekvenčné potrubie: Výskum → Písanie → Úprava → Publikovanie

### 1. Konfigurácia AZD

**Súbor: `azure.yaml`**

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

### 2. Infrastuktúra: Service Bus na koordináciu

**Súbor: `infra/core/servicebus.bicep`**

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

### 3. Manažér zdieľaného stavu

**Súbor: `src/shared/state_manager.py`**

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

### 4. Orchestrátor služba

**Súbor: `src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# Pripojenie k Service Bus
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
    
    # Vytvoriť úlohu v úložisku stavov
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # Odoslať správu výskumnému agentovi (prvý krok)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # Kam poslať výsledky
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

### 5. Výskumný agent

**Súbor: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# Inicializovať klientov
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
    
    # Zavolať Azure OpenAI pre výskum
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # Aktualizovať stav
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # Odoslať ďalšiemu agentovi (autorovi)
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

### 6. Writer agent

**Súbor: `src/agents/writer/app.py`**

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
    
    # Zavolať Azure OpenAI na napísanie článku
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # Aktualizovať stav
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # Poslať editorovi
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

### 7. Editor agent

**Súbor: `src/agents/editor/app.py`**

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
    
    # Zavolať Azure OpenAI na úpravu
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # Označiť úlohu ako dokončenú
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

### 8. Nasadiť a otestovať

```bash
# Inicializovať a nasadiť
azd init
azd up

# Získať URL orchestrátora
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Vytvoriť obsah
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ Očakávaný výstup:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**Skontrolujte priebeh úlohy:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Očakávaný výstup (dokončené):**
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

## Lekcia 2: Paralelný koordinačný vzor

### Implementácia: Aggregátor výskumu z viacerých zdrojov

Postavme paralelný systém, ktorý súčasne zhromažďuje informácie z viacerých zdrojov.

### Paralelný orchestrátor

**Súbor: `src/orchestrator/parallel_workflow.py`**

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
    
    # Rozvetvenie: Odoslať všetkým agentom súčasne
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

### Agregačná logika

**Súbor: `src/agents/aggregator/app.py`**

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

# Sledovať výsledky pre každú úlohu
task_results = defaultdict(list)
expected_agents = 4  # web, akademické, správy, sociálne

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # Uložiť výsledok
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # Skontrolovať, či všetci agenti dokončili (fan-in)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # Spojiť výsledky
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # Označiť ako dokončené
        state_manager.complete_task(task_id, aggregated)
        
        # Vyčistiť
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

**Výhody paralelného vzoru:**
- ⚡ **4x rýchlejšie** (agenti bežia súčasne)
- 🔄 **Odolné voči chybám** (čiastočné výsledky sú prijateľné)
- 📈 **Škálovateľné** (ľahko pridať viac agentov)

---

## Praktické cvičenia

### Cvičenie 1: Pridať spracovanie časového limitu ⭐⭐ (Stredné)

**Cieľ**: Implementovať logiku časového limitu, aby agregátor nečakal nekonečne na pomalých agentov.

**Kroky**:

1. **Pridať sledovanie časového limitu do agregátora:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> expiration_time

def process_result(message_data):
    task_id = message_data['task_id']
    
    # Nastaviť časový limit na prvý výsledok
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # Skontrolovať, či je dokončené alebo vypršal čas
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
        
        # Vyčistenie
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **Testovať s umelými oneskoreniami:**

```python
# V jednom agente pridajte oneskorenie na simuláciu pomalého spracovania
import time
time.sleep(35)  # Presahuje 30-sekundový časový limit
```

3. **Nasadiť a overiť:**

```bash
azd deploy aggregator

# Odoslať úlohu
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Skontrolujte výsledky po 30 sekundách
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Kritériá úspechu:**
- ✅ Úloha sa dokončí po 30 sekundách aj keď agenti nie sú kompletní
- ✅ Odpoveď indikuje čiastočné výsledky (`"timed_out": true`)
- ✅ K dispozícii sú vrátené dostupné výsledky (3 z 4 agentov)

**Čas**: 20-25 minút

---

### Cvičenie 2: Implementovať logiku opakovaní (Retry) ⭐⭐⭐ (Pokročilé)

**Cieľ**: Automaticky opakovať zlyhané úlohy agentov pred vzdávaním sa.

**Kroky**:

1. **Pridať sledovanie opakovaní do orchestrátora:**

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

2. **Pridať handler opakovaní do agentov:**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # Spracovať správu
        process_func(message_data)
        
        # Úspech - dokončené
        receiver.complete_message(message)
        
    except Exception as e:
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # Opakovať: opustiť a vložiť späť do fronty so zvýšeným počtom pokusov
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # Poslať späť do tej istej fronty s oneskorením
            time.sleep(5 * (retry_count + 1))  # Exponenciálne oneskorenie
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # Odstrániť pôvodný
        else:
            # Maximálny počet opakovaní prekročený - presunúť do fronty mŕtvych správ
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **Monitorovať dead letter queue:**

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

**✅ Kritériá úspechu:**
- ✅ Zlyhané úlohy sa automaticky opakujú (až 3 krát)
- ✅ Exponenciálne spätné odporúčanie medzi opakovaniami (5s, 10s, 15s)
- ✅ Po dosiahnutí max počtu opakovaní idú správy do dead letter queue
- ✅ Dead letter queue je možné monitorovať a opätovne prehrávať

**Čas**: 30-40 minút

---

### Cvičenie 3: Implementovať Circuit Breaker ⭐⭐⭐ (Pokročilé)

**Cieľ**: Predchádzať kaskádovým zlyhaniam zastavením požiadaviek smerujúcich na zlyhávajúcich agentov.

**Kroky**:

1. **Vytvoriť triedu circuit breaker:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # Normálna prevádzka
    OPEN = "open"          # Zlyháva, odmieta požiadavky
    HALF_OPEN = "half_open"  # Testuje sa, či sa zotavil

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
            # Skontrolovať, či vypršal časový limit
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # Úspech
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

2. **Aplikovať na volania agentov:**

```python
# V orchestrátore
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
        # Pokračujte s ostatnými agentmi
```

3. **Otestovať circuit breaker:**

```bash
# Simulovať opakované zlyhania (zastaviť jedného agenta)
az containerapp stop --name web-research-agent --resource-group rg-agents

# Odoslať viacero požiadaviek
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# Skontrolovať logy - mali by ste vidieť, že obvod je otvorený po 5 zlyhaniach
# Použite Azure CLI na logy Container App:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ Kritériá úspechu:**
- ✅ Po 5 zlyhaniach sa obvod otvorí (zamieta požiadavky)
- ✅ Po 60 sekundách sa obvod prejde do polootvoreného stavu (testuje sa zotavenie)
- ✅ Ostatní agenti pokračujú normálne v práci
- ✅ Obvod sa automaticky zatvorí, keď sa agent zotaví

**Čas**: 40-50 minút

---

## Monitorovanie a ladenie

### Distribuované trasovanie s Application Insights

**Súbor: `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# Nakonfigurujte trasovanie
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# Vytvorte tracer
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# Nakonfigurujte logovanie
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

### Dopyty Application Insights

**Sledovanie multi-agentných workflowov:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**Porovnanie výkonnosti agentov:**

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

**Analýza zlyhaní:**

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

## Analýza nákladov

### Náklady na viacagentný systém (mesačné odhady)

| Component | Configuration | Cost |
|-----------|--------------|------|
| **Orchestrator** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 Agents** | 4 Container Apps (0.5 vCPU, 1GB each) | $60-120 |
| **Service Bus** | Standard tier, 10M messages | $10-20 |
| **Cosmos DB** | Serverless, 5GB storage, 1M RUs | $25-50 |
| **Blob Storage** | 10GB storage, 100K operations | $5-10 |
| **Application Insights** | 5GB ingestion | $10-15 |
| **Azure OpenAI** | GPT-4, 10M tokens | $100-300 |
| **Total** | | **$240-565/month** |

### Stratégie optimalizácie nákladov

1. **Používajte serverless kde je to možné:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Škálujte agentov na nulu keď sú nečinní:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Používajte batching pre Service Bus:**
   ```python
   # Odosielať správy po dávkach (lacnejšie)
   sender.send_messages([message1, message2, message3])
   ```

4. **Cache-ujte často používané výsledky:**
   ```python
   # Použite Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Najlepšie postupy

### ✅ ROBIŤ:

1. **Používajte idempotentné operácie**
   ```python
   # Agent môže bezpečne spracovať rovnakú správu viackrát.
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # Spracovať úlohu...
   ```

2. **Implementujte komplexné logovanie**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Používajte korelačné ID**
   ```python
   # Preniesť task_id celým pracovným tokom
   message_data = {
       'task_id': task_id,  # ID korelácie
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Nastavte TTL (time-to-live) správ**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Monitorujte dead letter queues**
   ```python
   # Pravidelné monitorovanie zlyhaných správ
   monitor_dead_letters()
   ```

### ❌ NEROBIŤ:

1. **Nevytvárajte cirkulárne závislosti**
   ```python
   # ❌ ZLÉ: Agent A → Agent B → Agent A (nekonečná slučka)
   # ✅ DOBRÉ: Definujte jasný orientovaný acyklický graf (DAG)
   ```

2. **Neblokujte vlákna agentov**
   ```python
   # ❌ ZLÉ: Synchronné čakanie
   while not task_complete:
       time.sleep(1)
   
   # ✅ DOBRÉ: Použite spätné volania fronty správ
   ```

3. **Neriešte čiastočné zlyhania ignorovaním**
   ```python
   # ❌ ZLÉ: Zlyhanie celého pracovného toku, ak zlyhá jeden agent
   # ✅ DOBRÉ: Vrátiť čiastočné výsledky s indikátormi chýb
   ```

4. **Nepoužívajte nekonečné opakovania**
   ```python
   # ❌ ZLÉ: opakovať donekonečna
   # ✅ DOBRÉ: max_retries = 3, potom do fronty mŕtvych správ
   ```

---

## Sprievodca riešením problémov

### Problém: Správy uviaznuté vo fronte

**Príznaky:**
- Správy sa hromadia vo fronte
- Agenti nepracujú
- Stav úlohy uviaznutý na "pending"

**Diagnóza:**
```bash
# Skontrolujte hĺbku fronty
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Skontrolujte protokoly agenta pomocou Azure CLI
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**Riešenia:**

1. **Zvýšte počet replík agentov:**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Skontrolujte dead-letter frontu:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problém: Vypršanie časového limitu úlohy/nikdy sa nedokončí

**Príznaky:**
- Stav úlohy zostáva "in_progress"
- Niektorí agenti dokončia, iní nie
- Žiadne chybové hlásenia

**Diagnóza:**
```bash
# Skontrolujte stav úlohy
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Skontrolujte Application Insights
# Spustite dopyt: traces | where customDimensions.task_id == "..."
```

**Riešenia:**

1. **Implementujte timeout v agregátore (Cvičenie 1)**

2. **Skontrolujte zlyhania agentov pomocou Azure Monitor:**
   ```bash
   # Zobraziť protokoly pomocou azd monitor
   azd monitor --logs
   
   # Alebo použite Azure CLI na zobrazenie protokolov konkrétnej kontajnerovej aplikácie
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Overte, že všetci agenti bežia:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## Zistite viac

### Oficiálna dokumentácia
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### Ďalšie kroky v tomto kurze
- ← Predchádzajúce: [Plánovanie kapacít](capacity-planning.md)
- → Nasledujúce: [Výber SKU](sku-selection.md)
- 🏠 [Domov kurzu](../../README.md)

### Súvisiace príklady
- [Príklad mikroslužieb](../../../../examples/microservices) - Vzory komunikácie medzi službami
- [Príklad Azure OpenAI](../../../../examples/azure-openai-chat) - Integrácia AI

---

## Zhrnutie

**Naučili ste sa:**
- ✅ Päť vzorov koordinácie (sekvenčný, paralelný, hierarchický, riadený udalosťami, konsenzus)
- ✅ Viacagentová architektúra na Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Správa stavu naprieč distribuovanými agentmi
- ✅ Riešenie vypršaní časových limitov, opakovania a circuit breakers
- ✅ Monitorovanie a ladenie distribuovaných systémov
- ✅ Stratégie optimalizácie nákladov

**Kľúčové poznatky:**
1. **Vyberte správny vzor** - Sekvenčný pre usporiadané pracovné postupy, paralelný pre rýchlosť, riadený udalosťami pre flexibilitu
2. **Starostlivo spravujte stav** - Použite Cosmos DB alebo podobné riešenie pre zdieľaný stav
3. **Riešte zlyhania elegantne** - Vypršania časových limitov, opakovania, circuit breakers, dead-letter fronty
4. **Monitorujte všetko** - Distribuované trasovanie je kľúčové pre ladenie
5. **Optimalizujte náklady** - Škálovanie na nulu, použite serverless, implementujte kešovanie

**Ďalšie kroky:**
1. Dokončite praktické cvičenia
2. Vytvorte viacagentový systém pre váš prípad použitia
3. Študujte [Výber SKU](sku-selection.md) na optimalizáciu výkonu a nákladov

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, berte prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->