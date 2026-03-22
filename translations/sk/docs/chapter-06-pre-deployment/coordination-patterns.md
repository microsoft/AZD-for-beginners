# Vzory koordinácie viacerých agentov

⏱️ **Odhadovaný čas**: 60-75 minút | 💰 **Odhadované náklady**: ~$100-300/mesiac | ⭐ **Zložitosť**: Pokročilá

**📚 Učebná cesta:**
- ← Predchádzajúce: [Plánovanie kapacity](capacity-planning.md) - Veľkosť zdrojov a stratégie škálovania
- 🎯 **Ste tu**: Vzory koordinácie viacerých agentov (orchestration, komunikácia, správa stavu)
- → Ďalej: [Výber SKU](sku-selection.md) - Výber vhodných služieb Azure
- 🏠 [Domov kurzu](../../README.md)

---

## Čo sa naučíte

Po absolvovaní tejto lekcie budete:
- Rozumieť **vzory architektúry viacerých agentov** a kedy ich použiť
- Implementovať **vzory orchestrácie** (centralizovaná, decentralizovaná, hierarchická)
- Navrhovať **spôsoby komunikácie agentov** (synchronné, asynchronné, riadené udalosťami)
- Spravovať **zdieľaný stav** medzi rozptýlenými agentmi
- Nasadiť **systémy viacerých agentov** na Azure s AZD
- Aplikovať **vzory koordinácie** pre reálne AI scenáre
- Monitorovať a ladiť distribuované systémy agentov

## Prečo je koordinácia viacerých agentov dôležitá

### Vývoj: Od jedného agenta k viacerým agentom

**Jeden agent (jednoduché):**
```
User → Agent → Response
```
- ✅ Jednoduché na pochopenie a implementáciu
- ✅ Rýchle pre jednoduché úlohy
- ❌ Obmedzené schopnosťami jediného modelu
- ❌ Nedokáže paralelizovať zložité úlohy
- ❌ Žiadna špecializácia

**Systém viacerých agentov (pokročilý):**
```mermaid
graph TD
    Orchestrator[Orchestrátor] --> Agent1[Agent1<br/>Plán]
    Orchestrator --> Agent2[Agent2<br/>Kód]
    Orchestrator --> Agent3[Agent3<br/>Revízia]
```- ✅ Špecializovaní agenti pre konkrétne úlohy
- ✅ Paralelné vykonávanie pre rýchlosť
- ✅ Modulárny a udržiavateľný
- ✅ Lepší pri zložitých pracovných postupoch
- ⚠️ Vyžaduje logiku koordinácie

**Analógia**: Jeden agent je ako jedna osoba, ktorá vykonáva všetky úlohy. Viacagentový systém je ako tím, kde má každý člen špecializované zručnosti (výskumník, programátor, recenzent, autor) pracujúci spolu.

---

## Základné vzory koordinácie

### Vzor 1: Sekvenčná koordinácia (Chain of Responsibility)

**Kedy použiť**: Úlohy sa musia vykonať v konkrétnom poradí, každý agent stavia na výstupe predchádzajúceho.

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as Výskumný agent
    participant Agent2 as Písací agent
    participant Agent3 as Redakčný agent
    
    User->>Orchestrator: "Napíš článok o umelej inteligencii"
    Orchestrator->>Agent1: Preskúmaj tému
    Agent1-->>Orchestrator: Výsledky výskumu
    Orchestrator->>Agent2: Napíš návrh (s využitím výskumu)
    Agent2-->>Orchestrator: Návrh článku
    Orchestrator->>Agent3: Uprav a vylepši
    Agent3-->>Orchestrator: Finálny článok
    Orchestrator-->>User: Upravený článok
    
    Note over User,Agent3: Sekvenčné: Každý krok čaká na predchádzajúci
```
**Výhody:**
- ✅ Jasný tok dát
- ✅ Ľahké ladenie
- ✅ Predvídateľné poradie vykonávania

**Obmedzenia:**
- ❌ Pomalšie (bez paralelizácie)
- ❌ Jedna chyba zablokuje celý reťazec
- ❌ Nedokáže zvládnuť vzájomne závislé úlohy

**Príklady použitia:**
- Potrubie tvorby obsahu (výskum → písanie → editovanie → publikovanie)
- Generovanie kódu (plán → implementácia → testovanie → nasadenie)
- Generovanie správ (zber dát → analýza → vizualizácia → zhrnutie)

---

### Vzor 2: Paralelná koordinácia (Fan-Out/Fan-In)

**Kedy použiť**: Nezávislé úlohy môžu bežať súčasne, výsledky sa kombinujú na konci.

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
- ⚠️ Vyžaduje logiku agregácie
- ⚠️ Zložité spravovanie stavu

**Príklady použitia:**
- Zhromažďovanie údajov z viacerých zdrojov (API + databázy + web scraping)
- Konkurenčná analýza (viac modelov generuje riešenia, vyberie sa najlepší)
- Prekladateľské služby (súbežný preklad do viacerých jazykov)

---

### Vzor 3: Hierarchická koordinácia (Manager-Worker)

**Kedy použiť**: Zložité pracovné postupy so sub-úlohami, potreba delegovania.

```mermaid
graph TB
    Master[Hlavný orchestrátor]
    Manager1[Manažér výskumu]
    Manager2[Manažér obsahu]
    W1[Webový scraper]
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
- ✅ Modulárny a udržiavateľný
- ✅ Jasné hranice zodpovednosti

**Obmedzenia:**
- ⚠️ Zložitejšia architektúra
- ⚠️ Vyššia latencia (viac vrstiev koordinácie)
- ⚠️ Vyžaduje sofistikovanú orchestráciu

**Príklady použitia:**
- Podnikové spracovanie dokumentov (klasifikovať → smerovať → spracovať → archivovať)
- Viacstupňové dátové potrubia (ingest → čistenie → transformácia → analýza → report)
- Zložité automatizačné pracovné postupy (plánovanie → prideľovanie zdrojov → vykonávanie → monitorovanie)

---

### Vzor 4: Koordinácia riadená udalosťami (Publish-Subscribe)

**Kedy použiť**: Agenti potrebujú reagovať na udalosti, žiaduce je voľné prepojenie.

```mermaid
sequenceDiagram
    participant Agent1 as Zberač údajov
    participant EventBus as Azure Service Bus
    participant Agent2 as Analyzátor
    participant Agent3 as Oznamovateľ
    participant Agent4 as Archivátor
    
    Agent1->>EventBus: Publikovať "ÚdajePrijaté" udalosť
    EventBus->>Agent2: Prihlásiť sa: Analyzovať údaje
    EventBus->>Agent3: Prihlásiť sa: Odoslať oznámenie
    EventBus->>Agent4: Prihlásiť sa: Archivovať údaje
    
    Note over Agent1,Agent4: Všetci odberatelia spracúvajú nezávisle
    
    Agent2->>EventBus: Publikovať "AnalýzaDokončená" udalosť
    EventBus->>Agent3: Prihlásiť sa: Odoslať správu o analýze
```
**Výhody:**
- ✅ Voľné prepojenie medzi agentmi
- ✅ Jednoduché pridávanie nových agentov (stačí sa prihlásiť)
- ✅ Asynchrónne spracovanie
- ✅ Odolné (trvalosť správ)

**Obmedzenia:**
- ⚠️ Eventuálna konzistencia
- ⚠️ Zložité ladenie
- ⚠️ Problémy s poradím správ

**Príklady použitia:**
- Systémy monitorovania v reálnom čase (alerty, panely, logy)
- Viackanálové notifikácie (email, SMS, push, Slack)
- Dátové potrubia (viacerí spotrebitelia rovnakých dát)

---

### Vzor 5: Koordinácia založená na konsenze (Voting/Quorum)

**Kedy použiť**: Potrebné je získanie dohody od viacerých agentov pred postupovaním ďalej.

```mermaid
graph TB
    Input[Vstupná úloha]
    Agent1[Agent 1: gpt-4.1]
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
- ✅ Odolné voči chybám (zlyhanie menšiny je akceptovateľné)
- ✅ Zabudovaná kontrola kvality

**Obmedzenia:**
- ❌ Nákladné (viaceré volania modelov)
- ❌ Pomalšie (čakanie na viacerých agentov)
- ⚠️ Potrebné riešenie konfliktov

**Príklady použitia:**
- Moderovanie obsahu (viac modelov kontroluje obsah)
- Kontrola kódu (viac linterov/analyzátorov)
- Lekárska diagnostika (viaceré AI modely, overenie expertom)

---

## Prehľad architektúry

### Kompletný systém viacerých agentov na Azure

```mermaid
graph TB
    User[Používateľ/API klient]
    APIM[Azure správa API]
    Orchestrator[Služba orchestrátora<br/>Kontajnerová aplikácia]
    ServiceBus[Azure Service Bus<br/>Event Hub]
    
    Agent1[Agent pre výskum<br/>Kontajnerová aplikácia]
    Agent2[Agent pre písanie<br/>Kontajnerová aplikácia]
    Agent3[Analytický agent<br/>Kontajnerová aplikácia]
    Agent4[Agent pre recenziu<br/>Kontajnerová aplikácia]
    
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

| Komponent | Účel | Služba Azure |
|-----------|---------|---------------|
| **API Gateway** | Vstupný bod, obmedzovanie rýchlosti, autentifikácia | API Management |
| **Orchestrator** | Koordinuje pracovné postupy agentov | Container Apps |
| **Message Queue** | Asynchrónna komunikácia | Service Bus / Event Hubs |
| **Agents** | Špecializovaní AI pracovníci | Container Apps / Functions |
| **State Store** | Zdieľaný stav, sledovanie úloh | Cosmos DB |
| **Artifact Storage** | Dokumenty, výsledky, logy | Blob Storage |
| **Monitoring** | Distribuované trasovanie, logy | Application Insights |

---

## Predpoklady

### Povinné nástroje

```bash
# Overiť Azure Developer CLI
azd version
# ✅ Očakávané: azd verzia 1.0.0 alebo novšia

# Overiť Azure CLI
az --version
# ✅ Očakávané: azure-cli verzia 2.50.0 alebo novšia

# Overiť Docker (pre lokálne testovanie)
docker --version
# ✅ Očakávané: Docker verzia 20.10 alebo novšia
```

### Požiadavky na Azure

- Aktívne predplatné Azure
- Oprávnenia na vytváranie:
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB accounts
  - Storage accounts
  - Application Insights

### Požadované znalosti

Mali by ste mať dokončené:
- [Správa konfigurácie](../chapter-03-configuration/configuration.md)
- [Autentifikácia a bezpečnosť](../chapter-03-configuration/authsecurity.md)
- [Príklad mikroslužieb](../../../../examples/microservices)

---

## Sprievodca implementáciou

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

## Lekcia 1: Vzor sekvenčnej koordinácie

### Implementácia: Potrubie tvorby obsahu

Postavme sekvenčné potrubie: Výskum → Písanie → Editovanie → Publikovanie

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

### 2. Infrastruktúra: Service Bus pre koordináciu

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

### 3. Správca zdieľaného stavu

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

### 4. Služba orchestrátora

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

# Pripojenie k Service Busu
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
    
    # Zavolať modely Microsoft Foundry pre výskum
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
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
    
    # Poslať nasledujúcemu agentovi (autorovi)
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

### 6. Agent pre písanie

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
    
    # Zavolať Microsoft Foundry Models, aby napísal článok
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
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
    
    # Poslať redaktorovi
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

### 7. Editorský agent

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
    
    # Zavolať Microsoft Foundry Models na úpravu
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
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
# Možnosť A: nasadenie založené na šablóne
azd init
azd up

# Možnosť B: nasadenie pomocou manifestu agenta (vyžaduje rozšírenie)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> Pozri [Príkazy AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pre všetky `azd ai` flagy a možnosti.

```bash
# Získajte URL orchestrátora
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Vytvorte obsah
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

**Skontrolovať priebeh úlohy:**
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

## Lekcia 2: Vzor paralelnej koordinácie

### Implementácia: Agregátor výskumu z viacerých zdrojov

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
    
    # Fan-out: Poslať všetkým agentom súčasne
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

### Logika agregácie

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
        
        # Zlúčiť výsledky
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
- ⚡ **4x rýchlejší** (agenti bežia súčasne)
- 🔄 **Odolné voči chybám** (čiastočné výsledky sú prijateľné)
- 📈 **Škálovateľné** (ľahé pridanie ďalších agentov)

---

## Praktické cvičenia

### Cvičenie 1: Pridať spracovanie časového limitu ⭐⭐ (Stredne náročné)

**Cieľ**: Implementovať logiku timeoutu tak, aby agregátor nečakal večne na pomalých agentov.

**Kroky**:

1. **Pridať sledovanie timeoutu do agregátora:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> čas vypršania

def process_result(message_data):
    task_id = message_data['task_id']
    
    # Nastaviť časový limit pre prvý výsledok
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # Skontrolovať, či je dokončené alebo či čas vypršal
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

2. **Otestovať s umelými oneskoreniami:**

```python
# U jedného agenta pridajte oneskorenie na simulovanie pomalého spracovania
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
- ✅ Odpoveď indikuje čiastočné výsledky ("timed_out": true)
- ✅ Dostupné výsledky sú vrátené (3 zo 4 agentov)

**Čas**: 20-25 minút

---

### Cvičenie 2: Implementovať logiku opakovaní (retry) ⭐⭐⭐ (Pokročilé)

**Cieľ**: Automaticky opakovať zlyhané úlohy agentov pred ukončením.

**Kroky**:

1. **Pridať sledovanie retry do orchestrátora:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # id_správy -> počet_opakovaní

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

2. **Pridať retry handler do agentov:**

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
            # Opakovať: opustiť a znovu zaradiť do fronty so zvýšeným počtom pokusov
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # Poslať späť do tej istej fronty s oneskorením
            time.sleep(5 * (retry_count + 1))  # Exponenciálne zvyšovanie oneskorenia
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # Odstrániť originál
        else:
            # Maximálny počet pokusov prekročený - presunúť do fronty nedoručiteľných správ
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
- ✅ Zlyhané úlohy sa automaticky opakujú (až 3x)
- ✅ Exponenciálny backoff medzi opakovaniami (5s, 10s, 15s)
- ✅ Po maximálnom počte opakovaní idú správy do dead letter queue
- ✅ Dead letter queue je možné monitorovať a znovu prehrávať

**Čas**: 30-40 minút

---

### Cvičenie 3: Implementovať circuit breaker ⭐⭐⭐ (Pokročilé)

**Cieľ**: Zabrániť kaskádovým zlyhaniam tým, že sa zastavia požiadavky na zlyhávajúce agentov.

**Kroky**:

1. **Vytvoriť triedu circuit breaker:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # Normálna prevádzka
    OPEN = "open"          # Zlyháva, odmieta požiadavky
    HALF_OPEN = "half_open"  # Testovanie, či sa zotavil

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

# Skontrolujte logy - mali by ste vidieť, že obvod je otvorený po 5 zlyhaniach
# Použite Azure CLI pre logy Container App:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ Kritériá úspechu:**
- ✅ Po 5 zlyhaniach sa obvod otvorí (odmieta požiadavky)
- ✅ Po 60 sekundách sa obvod prejde do half-open (testuje zotavenie)
- ✅ Ostatní agenti pokračujú v práci normálne
- ✅ Obvod sa automaticky zavrie, keď sa agent zotaví

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

### Dotazy v Application Insights

**Sledovať pracovné postupy viacerých agentov:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**Porovnanie výkonu agentov:**

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

### Náklady systému viacerých agentov (mesačné odhady)

| Komponent | Konfigurácia | Náklady |
|-----------|--------------|------|
| **Orchestrator** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 Agents** | 4 Container Apps (0.5 vCPU, 1GB každý) | $60-120 |
| **Service Bus** | Standard tier, 10M messages | $10-20 |
| **Cosmos DB** | Serverless, 5GB storage, 1M RUs | $25-50 |
| **Blob Storage** | 10GB storage, 100K operations | $5-10 |
| **Application Insights** | 5GB ingestion | $10-15 |
| **Microsoft Foundry Models** | gpt-4.1, 10M tokens | $100-300 |
| **Celkom** | | **$240-565/month** |

### Stratégie optimalizácie nákladov

1. **Použite serverless kde je to možné:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Škálujte agentov na nulu, keď sú nečinní:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Použite dávkovanie pre Service Bus:**
   ```python
   # Posielať správy v dávkach (lacnejšie)
   sender.send_messages([message1, message2, message3])
   ```

4. **Ukladajte často používané výsledky do medzipamäti:**
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
   # Agent môže bezpečne spracovať tú istú správu viackrát
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
   # Preneste task_id cez celý pracovný tok
   message_data = {
       'task_id': task_id,  # ID korelácie
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Nastavte TTL (čas života) správ**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Sledujte dead-letter fronty**
   ```python
   # Pravidelné sledovanie zlyhaných správ
   monitor_dead_letters()
   ```

### ❌ NEROBIŤ:

1. **Nevytvárajte kruhové závislosti**
   ```python
   # ❌ ZLÉ: Agent A → Agent B → Agent A (nekonečná slučka)
   # ✅ DOBRÉ: Definujte jasný orientovaný acyklický graf (DAG)
   ```

2. **Nezablokujte vlákna agentov**
   ```python
   # ❌ ZLÉ: Synchronné čakanie
   while not task_complete:
       time.sleep(1)
   
   # ✅ DOBRÉ: Použite spätné volania fronty správ
   ```

3. **Neignorujte čiastočné zlyhania**
   ```python
   # ❌ ZLÉ: Spôsobiť zlyhanie celého pracovného postupu, ak jeden agent zlyhá
   # ✅ DOBRÉ: Vrátiť čiastočné výsledky s indikátormi chýb
   ```

4. **Nepoužívajte nekonečné opakovania**
   ```python
   # ❌ ZLÉ: opakovať navždy
   # ✅ DOBRÉ: max_retries = 3, potom do fronty mŕtvych správ
   ```

---

## Príručka riešenia problémov

### Problém: Správy uviaznuté vo fronte

**Príznaky:**
- Správy sa hromadia vo fronte
- Agenti nespracúvajú správy
- Stav úlohy uviazol na "čakajúci"

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

2. **Skontrolujte dead-letter queue:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problém: Vypršanie časového limitu úlohy / nikdy sa nedokončí

**Príznaky:**
- Stav úlohy zostáva "prebieha"
- Niektorí agenti dokončia, iní nie
- Žiadne chybové hlásenia

**Diagnóza:**
```bash
# Skontrolujte stav úlohy
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Skontrolujte Application Insights
# Spustite dotaz: traces | where customDimensions.task_id == "..."
```

**Riešenia:**

1. **Implementujte časový limit v agregátore (Cvičenie 1)**

2. **Skontrolujte zlyhania agentov pomocou Azure Monitor:**
   ```bash
   # Zobraziť protokoly pomocou azd monitor
   azd monitor --logs
   
   # Alebo použite Azure CLI na kontrolu protokolov konkrétnej kontajnerovej aplikácie
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Overte, že všetci agenti bežia:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## Dozvedieť sa viac

### Oficiálna dokumentácia
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### Ďalšie kroky v tomto kurze
- ← Predchádzajúce: [Plánovanie kapacity](capacity-planning.md)
- → Nasledujúce: [Výber SKU](sku-selection.md)
- 🏠 [Domov kurzu](../../README.md)

### Súvisiace príklady
- [Príklad mikroslužieb](../../../../examples/microservices) - Vzory komunikácie služieb
- [Príklad Microsoft Foundry Models](../../../../examples/azure-openai-chat) - Integrácia AI

---

## Zhrnutie

**Naučili ste sa:**
- ✅ Päť vzorov koordinácie (sekvenčný, paralelný, hierarchický, riadený udalosťami, konsenzus)
- ✅ Viacagentová architektúra v Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Správa stavu medzi distribuovanými agentmi
- ✅ Riešenie časových limitov, opakovaní a circuit-breakerov
- ✅ Monitorovanie a ladenie distribuovaných systémov
- ✅ Stratégie optimalizácie nákladov

**Kľúčové poznatky:**
1. **Vyberte správny vzor** - Sekvenčný pre usporiadané pracovné postupy, paralelný pre rýchlosť, riadený udalosťami pre flexibilitu
2. **Opatrne spravujte stav** - Použite Cosmos DB alebo podobné riešenie pre zdieľaný stav
3. **Riešte zlyhania elegantne** - Časové limity, opakovania, circuit-breakery, dead-letter fronty
4. **Monitorujte všetko** - Distribuované trasovanie je nevyhnutné pre ladenie
5. **Optimalizujte náklady** - Skalujte na nulu, používajte serverless, implementujte cachovanie

**Ďalšie kroky:**
1. Dokončite praktické cvičenia
2. Vytvorte viacagentový systém pre váš prípad použitia
3. Preštudujte si [Výber SKU](sku-selection.md) pre optimalizáciu výkonu a nákladov

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa usilujeme o presnosť, berte prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->