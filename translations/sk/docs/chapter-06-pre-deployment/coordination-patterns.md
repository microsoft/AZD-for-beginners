# Vzory koordinácie viacerých agentov

⏱️ **Odhadovaný čas**: 60-75 minút čítania; niekoľko hodín na implementáciu | 💰 **Odhadované náklady**: závisí od pracovnej záťaže | ⭐ **Zložitosť**: Pokročilá

**📚 Učebná cesta:**
- ← Predchádzajúce: [Plánovanie kapacity](capacity-planning.md) - stratégie veľkosti a škálovania zdrojov
- 🎯 **Nachádzate sa tu**: Vzory koordinácie viacerých agentov (orchestrácia, komunikácia, správa stavu)
- → Ďalšie: [Výber SKU](sku-selection.md) - Výber správnych služieb Azure
- 🏠 [Domov kurzu](../../README.md)

---

## Čo sa naučíte

Dokončením tejto lekcie budete:
- Rozumieť vzorom **architektúry viacerých agentov** a kedy ich použiť
- Implementovať **orchestrátorské vzory** (centralizované, decentralizované, hierarchické)
- Navrhnúť stratégie **komunikácie agentov** (synchrónne, asynchrónne, riadené udalosťami)
- Spravovať **zdieľaný stav** medzi distribuovanými agentmi
- Nasadiť **systémy viacerých agentov** na Azure pomocou AZD
- Aplikovať **vzory koordinácie** pre reálne scenáre AI
- Monitorovať a ladenie distribuovaných systémov agentov

## Prečo je koordinácia viacerých agentov dôležitá

### Vývoj: od jedného agenta k viacerým agentom

**Jeden agent (jednoduché):**
```
User → Agent → Response
```
- ✅ Ľahké na pochopenie a implementáciu
- ✅ Rýchle pre jednoduché úlohy
- ❌ Obmedzené schopnosťami jediného modelu
- ❌ Nemožno paralelne spracovať zložité úlohy
- ❌ Žiadna špecializácia

**Systém viacerých agentov (pokročilé):**
```mermaid
graph TD
    Orchestrator[Orchestrator] --> Agent1[Agent1<br/>Plan]
    Orchestrator --> Agent2[Agent2<br/>Code]
    Orchestrator --> Agent3[Agent3<br/>Review]
```
- ✅ Špecializovaní agenti pre konkrétne úlohy
- ✅ Paralelné vykonávanie pre rýchlosť
- ✅ Modularita a udržateľnosť
- ✅ Lepšie na zložité pracovné postupy
- ⚠️ Vyžaduje koordináciu logiky

**Analógia**: Jeden agent je ako jedna osoba robí všetky úlohy. Viac agentov je ako tím, kde každý člen má špecializované schopnosti (výskumník, programátor, recenzent, spisovateľ), ktorí pracujú spolu.

---

## Základné vzory koordinácie

### Vzory 1: Sekvenčná koordinácia (Reťaz zodpovednosti)

**Kedy použiť**: Úlohy musí byť dokončené v konkrétnom poradí, každý agent nadväzuje na výstup predchádzajúceho.

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

**Výhody:**
- ✅ Jasný tok dát
- ✅ Ľahké na ladenie
- ✅ Predvídateľné poradie vykonávania

**Obmedzenia:**
- ❌ Pomalšie (žiadna paralelizácia)
- ❌ Jedna chyba zablokuje celý reťazec
- ❌ Nevhodné pre vzájomne závislé úlohy

**Príklady použitia:**
- Pracovný postup tvorby obsahu (výskum → písanie → úprava → publikovanie)
- Generovanie kódu (plánovanie → implementácia → testovanie → nasadenie)
- Vytváranie reportov (zber dát → analýza → vizualizácia → súhrn)

---

### Vzory 2: Paralelná koordinácia (Fan-Out/Fan-In)

**Kedy použiť**: Nezávislé úlohy môžu bežať súčasne, výsledky sa na konci spoja.

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

**Výhody:**
- ✅ Rýchle (paralelné vykonávanie)
- ✅ Odolné voči chybám (čiastočné výsledky sú prijateľné)
- ✅ Horizontálne škálovateľné

**Obmedzenia:**
- ⚠️ Výsledky môžu prísť mimo poradia
- ⚠️ Potrebná agregačná logika
- ⚠️ Zložité riadenie stavu

**Príklady použitia:**
- Zber dát z viacerých zdrojov (API + databázy + web scraping)
- Konkurenčná analýza (viaceré modely generujú riešenia, vyberie sa najlepšie)
- Prekladateľské služby (súbežný preklad do viacerých jazykov)

---

### Vzory 3: Hierarchická koordinácia (Manažér - pracovník)

**Kedy použiť**: Zložité pracovné postupy so sub-úlohami, potrebná delegácia.

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

**Výhody:**
- ✅ Rieši zložité pracovné postupy
- ✅ Modularita a udržateľnosť
- ✅ Jasné vyhradenie zodpovedností

**Obmedzenia:**
- ⚠️ Zložitejšia architektúra
- ⚠️ Vyššia latencia (viac vrstiev koordinácie)
- ⚠️ Vyžaduje sofistikovanú orchestráciu

**Príklady použitia:**
- Podnikové spracovanie dokumentov (klasifikácia → smerovanie → spracovanie → archivácia)
- Viacfázové dátové pipeliny (vstup → čistenie → transformácia → analýza → report)
- Zložité automatizačné pracovné postupy (plánovanie → prideľovanie zdrojov → vykonávanie → monitorovanie)

---

### Vzory 4: Koordinácia riadená udalosťami (Publikovanie-Prihlásenie)

**Kedy použiť**: Agenti potrebujú reagovať na udalosti, želané voľné prepojenie.

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

**Výhody:**
- ✅ Voľné prepojenie medzi agentmi
- ✅ Jednoduché pridávanie nových agentov (len sa prihlásiť)
- ✅ Asynchrónne spracovanie
- ✅ Odolné (trvalosť správ)

**Obmedzenia:**
- ⚠️ Prípadná konzistencia
- ⚠️ Zložité ladenie
- ⚠️ Výzvy pri poradia správ

**Príklady použitia:**
- Systémy monitorovania v reálnom čase (upozornenia, dashboardy, logy)
- Viac-kanálové notifikácie (e-mail, SMS, push, Slack)
- Dátové pipeliny (viacerí spotrebitelia rovnakých dát)

---

### Vzory 5: Koordinácia založená na konsenze (Hlasovanie/Quórum)

**Kedy použiť**: Potrebná dohoda viacerých agentov pred pokračovaním.

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

**Výhody:**
- ✅ Vyššia presnosť (viaceré názory)
- ✅ Odolné voči poruchám (akceptovateľné zlyhanie menšiny)
- ✅ Zahrnutá kontrola kvality

**Obmedzenia:**
- ❌ Nákladné (viaceré volania modelov)
- ❌ Pomalšie (čakanie na všetkých agentov)
- ⚠️ Potrebné riešenie konfliktov

**Príklady použitia:**
- Moderovanie obsahu (recenzia obsahu viacerými modelmi)
- Kontrola kódu (viaceré linters/analyzátory)
- Lekárska diagnostika (viaceré AI modely, experté potvrdenie)

---

## Prehľad architektúry

### Kompletný systém viacerých agentov na Azure

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

**Kľúčové komponenty:**

| Komponent | Účel | Azure služba |
|-----------|---------|---------------|
| **API brána** | Vstupný bod, obmedzenie rýchlosti, autorizácia | API Management |
| **Orchestrátor** | Koordinuje pracovné postupy agentov | Container Apps |
| **Fronta správ** | Asynchrónna komunikácia | Service Bus / Event Hubs |
| **Agenti** | Špecializovaní AI pracovníci | Container Apps / Functions |
| **Úložisko stavu** | Zdieľaný stav, sledovanie úloh | Cosmos DB |
| **Úložisko artefaktov** | Dokumenty, výsledky, logy | Blob Storage |
| **Monitorovanie** | Distribuované sledovanie, logy | Application Insights |

Fronty a topicy Service Bus a Event Hubs sú rôzne služby s rôznymi modelmi doručovania a spotreby; Event Hubs nie je náhradou za kód pracovníka Service Bus nižšie. Paralelizmus, trvalosť správ a hlasovanie modelov samé osebe nezaručujú odolnosť voči chybám alebo vyššiu presnosť.

---

## Predpoklady

### Požadované nástroje

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

### Požiadavky Azure

- Aktívne predplatné Azure
- Povolenia na vytvorenie:
  - Container Apps
  - Mená priestorov Service Bus
  - Účty Cosmos DB
  - Účty úložísk
  - Application Insights

### Predchádzajúce vedomosti

Mali by ste mať dokončené:
- [Správa konfigurácie](../chapter-03-configuration/configuration.md)
- [Autentifikácia a bezpečnosť](../chapter-03-configuration/authsecurity.md)
- [Príklad mikroservisnej architektúry](../../../../examples/microservices)

---

## Návod na implementáciu

> **Fragments dizajnu, nie nasaditeľná laboratórium:** Strom projektu a značky `File:` nižšie popisujú súbory, ktoré treba vytvoriť vo vašom vlastnom projekte; tento repozitár neobsahuje kompletnú aplikáciu `multi-agent-system`. Chýbajúce časti zahŕňajú hlavné/parametrické šablóny, prostredie/registry Container Apps, Dockerfile a zámky závislostí, nastavenie databázy/kontajnera Cosmos, nasadenie modelov, konfiguráciu identity/rolí, škálovacie pravidlá a paralelné pracovníky/fronty. Neočakávajte, že `azd init` vygeneruje tieto súbory alebo `azd up` nasadí úryvky nezmenené. Pre spustiteľný štart si dokončite [Základy viacerých agentov](../chapter-05-multi-agent/multi-agent-basics.md).

**Runtime predpoklady:** Python 3.10+, `azure-servicebus`, `azure-cosmos`, `openai`, Flask a (pre monitorovanie) `azure-monitor-opentelemetry`; umiestnite `shared` do import cesty Pythonu v každom obraze služby. Kontajner Cosmos `agent-state/tasks` musí už existovať s partition key `/id`. Pripojenia založené na kľúčoch zjednodušujú tieto fragments, nie sú odporúčané do produkcie: preferujte manažované identity s obmedzenými rolami pre Service Bus/Cosmos/OpenAI na úrovni dátovej roviny. Nevystavujte kľúče vo výstupoch alebo logoch.

Doručovanie Service Bus je **minimálne raz**. Zachovajte idempotenciu pre každú úlohu **a krok**, používajte optimistickú konkurenciu (ETags) pre čítanie/upravenie/zápis stavu a obnovujte zámky správ počas dlhého spracovania. Jednoduchý správca stavu nižšie je sekvenčný a neimplementuje tieto produkčné záruky.

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

## Lekcia 1: Sekvenčný vzor koordinácie

### Implementácia: Potrubie tvorby obsahu

Navrhnime sekvenčné potrubie: Výskum → Písanie → Úprava. Publikovanie je mimo tento príklad.

### 1. AZD konfigurácia

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

### 2. Infraštruktúra: Service Bus pre koordináciu

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
// Do not output RootManageSharedAccessKey. Resolve scoped credentials
// securely or use managed identity in the application and scale rules.
```

### 3. Správca zdieľaného stavu

**Súbor: `src/shared/state_manager.py`**

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

### 5. Agent pre výskum

**Súbor: `src/agents/research/app.py`**

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

### 7. Agent pre úpravu

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

### 8. Nasadenie a testovanie

Tieto príkazy platia **len po implementácii chýbajúcich súborov projektu**. Interaktívna inicializácia agenta Foundry je samostatný pracovný postup; negeneruje tento dizajn Service Bus.

```bash
# In your completed custom project
azd up

# Alternative in a SEPARATE empty folder (GA bundle workflow requires azd >= 1.37.0)
azd ext install microsoft.foundry
azd ai agent init
azd up
```

> Pozrite si [Príkazy AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pre všetky príznaky a možnosti `azd ai`.

```bash
# Get orchestrator URL
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Create content
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
  "steps": ["research", "write", "edit"],
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

## Lekcia 2: Paralelný vzor koordinácie

### Implementácia: Zbierka výskumu z viacerých zdrojov

Postavme paralelný systém, ktorý zhromažďuje informácie z viacerých zdrojov naraz.

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

**Výhody paralelného vzoru:**
- ⚡ **Potenciálne nižšia latencia** (viazaná na najpomalšieho pracovníka plus režijné náklady koordinácie)
- 🔄 **Môže podporovať čiastočné výsledky** s explicitnými termínmi a politikou zlyhania (základný agregátor to neimplementuje)
- 📈 **Škálovateľný** (jednoduché pridanie ďalších agentov)

---

## Praktické cvičenia

### Cvičenie 1: Pridať správu časového limitu ⭐⭐ (Stredne náročné)

**Cieľ**: Implementovať logiku časového limitu, aby agregátor nečakal večne na pomalých agentov.

**Začiatočný bod:** Spustite túto lokálnu simuláciu termínu pred integráciou do pracovníka fronty. Časový limit, ktorý sa kontroluje iba pri príchode inej správy, sa nikdy nevykoná, ak chýbajúci pracovník nepošle nič.

**Kroky**:

1. **Pridajte sledovanie časového limitu do agregátora:**

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

2. **Očakávaný výstup:**

```text
{'completed_agents': 3, 'timed_out': True}
```

3. **Integrácia do systému fronty (dizajn úlohy):** Uchovávajte termín odoslania a očakávaných agentov pri vytváraní úlohy, vykonávajte periodické prechádzanie termínov nezávisle od prichádzajúcich výsledkov, atómovo dokončite čiastočné výsledky a ignorujte neskoré/duplicitné správy pre dokončené úlohy. Lokálny časový limit nezruší vzdialených pracovníkov.

Iba pre váš implementovaný projekt:

```bash
azd deploy aggregator

# Submit task
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Check results after 30 seconds
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Kritériá úspechu:**
- ✅ Lokálny test sa skončí po jednosekundovom limitnom čase, aj keď agent nie je dokončený
- ✅ Odpoveď indikuje čiastočné výsledky (`"timed_out": true`)
- ✅ Dostupné výsledky sú vrátené (3 z 4 agentov)

**Čas**: 20-25 minút

---

### Cvičenie 2: Implementovať logiku opakovaných pokusov ⭐⭐⭐ (Pokročilé)

**Cieľ**: Automaticky znova spustiť zlyhané úlohy agentov pred vzdávaním sa.

**Kroky**:

1. **Použite počty doručení Service Bus namiesto vlastných počítadiel opakovaných pokusov:**

```python
import json
import time
# Integration fragment: use a live peek-lock ServiceBusReceiver.
# Set queue maxDeliveryCount to 4 for one attempt + up to three retries.
```

2. **Pridajte správcu opakovaných pokusov agentom:**

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

3. **Monitorujte dead letter frontu:**

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

**✅ Kritériá úspechu:**
- ✅ Zlyhané úlohy sa automaticky opakujú (až 3x)
- ✅ Exponenciálne oddialenie medzi opakovaniami (5s, 10s, 20s), s obnovením zámku správy kde treba
- ✅ Po maximálnych opakovaniach správ sa odosielajú do dead letter fronty
- ✅ Správy v dead letter frontu sa dajú prehliadať; opätovné prehrávanie vyžaduje samostatný idempotentný obnovovací pracovný postup

**Čas**: 30-40 minút

---

### Cvičenie 3: Implementovať Circuit Breaker ⭐⭐⭐ (Pokročilé)

**Cieľ**: Zabrániť kaskádovým zlyhaniam zastavením požiadaviek na zlyhávajúce agenty.

**Kroky**:

1. **Vytvorte triedu circuit breaker:**

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

2. **Použite pri volaniach agentov:**

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

Tento obvod chráni **odosielaciu operáciu**, nie dokončenie na diaľku vykonávaným pracovníkom: úspešné zaradenie správy do frontu nič nehovorí o tom, či je agent aktívny. `send_message` je funkcia odosielateľa vo vašej aplikácii. Pre vykonávacie obvody privádzajte pozorované chyby/timeouty úloh do trvalého koordinátora. Táto trieda v pamäti je jednoduchou ukážkou pre jeden vláknový režim, nie distribuovaným circuit breakerom.

3. **Testujte circuit breaker lokálne:**

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

**✅ Kritériá úspechu:**
- ✅ Po 5 neúspechoch sa obvod otvorí (odmieta požiadavky)
- ✅ Po 60 sekundách sa obvod polootevára (testuje zotavenie)
- ✅ Ostatní agenti pokračujú v normálnej práci
- ✅ Obvod sa automaticky zatvorí, keď sa agent zotaví

**Čas**: 40-50 minút

---

## Monitorovanie a ladenie

### Distribuované sledovanie s Application Insights

**Súbor: `src/shared/tracing.py`**

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

### Dopyty v Application Insights

**Sledovanie interakcie viacerých agentov:**

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

### Náklady na systém s viacerými agentmi (mesačné odhady)

Ilustračné plánovacie čísla, nie cenové ponuky: súčet nižšie je **240-565 $/mesačne**. Overte aktuálne regionálne sadzby, aktívne/neaktívne hodiny replík, mix vstupných/výstupných tokenov, úložisko a telemetriu. Serverless nemá minimálny garantovaný priepustnosť ale fakturuje požiadavky a úložisko.

| Komponent | Konfigurácia | Náklady |
|-----------|--------------|------|
| **Orchestrátor** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 Agenti** | 4 Container Apps (0.5 vCPU, 1GB každý) | $60-120 |
| **Service Bus** | Štandardná úroveň, 10M správ | $10-20 |
| **Cosmos DB** | Serverless, 5GB úložisko, 1M RU | $25-50 |
| **Blob Storage** | 10GB úložisko, 100K operácií | $5-10 |
| **Application Insights** | 5GB ingestovanie | $10-15 |
| **Microsoft Foundry Models** | gpt-4.1, 10M tokenov | $100-300 |
| **Spolu** | | **240-565 $/mesačne** |

### Stratégie optimalizácie nákladov

1. **Používajte serverless kde je to možné:**
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
     minReplicas: 0  // Requires a Service Bus/KEDA scale rule to wake workers
     maxReplicas: 10
   }
   ```

3. **Používajte dávkovanie pre Service Bus:**
   ```python
   # Send messages in batches (cheaper)
   sender.send_messages([message1, message2, message3])
   ```

4. **Cacheujte často používané výsledky:**
   ```python
   # Use Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Najlepšie postupy

### ✅ ROBTE:

1. **Používajte idempotentné operácie**
   ```python
   # Pseudocode: implement a durable, atomic per-step deduplication claim.
   def process_task(task_id):
       raise NotImplementedError("Claim (task_id, step) atomically, execute, persist outcome")
   ```

2. **Implementujte komplexné logovanie**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Používajte ID korelácie**
   ```python
   # Pass task_id through entire workflow
   message_data = {
       'task_id': task_id,  # Correlation ID
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Nastavte TTL správ (time-to-live)**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Monitorujte dead letter queue**
   ```python
   # Regular monitoring of failed messages
   monitor_dead_letters()
   ```

### ❌ NEROBTE:

1. **Nevytvárajte kruhové závislosti**
   ```python
   # ❌ BAD: Agent A → Agent B → Agent A (infinite loop)
   # ✅ GOOD: Define clear directed acyclic graph (DAG)
   ```

2. **Nezablokujte vlákna agentov**
   ```python
   # ❌ BAD: Synchronous wait
   while not task_complete:
       time.sleep(1)
   
   # ✅ GOOD: Use message queue callbacks
   ```

3. **Nemenejte čiastočné zlyhania**
   ```python
   # ❌ BAD: Fail entire workflow if one agent fails
   # ✅ GOOD: Return partial results with error indicators
   ```

4. **Nepoužívajte nekonečné opakovania**
   ```python
   # ❌ BAD: retry forever
   # ✅ GOOD: max_retries = 3, then dead letter
   ```

---

## Riešenie problémov - Príručka

### Problém: Správy uviaznuté vo fronte

**Príznaky:**
- Správy sa hromadia vo fronte
- Agenti nepracujú
- Stav úlohy uviazol na "čaká sa"

**Diagnóza:**
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

**Riešenia:**

1. **Zvýšte počet replík agentov:**
   ```bash
   az containerapp update \
     --resource-group "$RG_NAME" \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Skontrolujte dead letter queue:**
   ```bash
   az servicebus queue show \
     --resource-group "$RG_NAME" \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problém: Úloha timeout/neukončí sa

**Príznaky:**
- Stav úlohy zostáva "v priebehu"
- Niektoré agenti dokončia, iní nie
- Žiadne chybové správy

**Diagnóza:**
```bash
# Check task state
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Check Application Insights
# Run query: traces | where customDimensions.task_id == "..."
```

**Riešenia:**

1. **Implementujte timeout v agregátore (Cvičenie 1)**

2. **Skontrolujte zlyhania agentov pomocou Azure Monitor:**
   ```bash
   # View logs via azd monitor
   azd monitor --logs
   
   # Or use Azure CLI to check specific container app logs
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Overte, či všetci agenti bežia:**
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
- [AI Agent Orchestration Patterns](https://learn.microsoft.com/azure/architecture/ai-ml/guide/ai-agent-design-patterns)

### Ďalšie kroky v tomto kurze
- ← Predchádzajúce: [Plánovanie kapacity](capacity-planning.md)
- → Nasledujúce: [Výber SKU](sku-selection.md)
- 🏠 [Domovská stránka kurzu](../../README.md)

### Súvisiace príklady
- [Príklad mikroservisov](../../../../examples/microservices) - Vzory komunikácie služieb
- [Príklad Microsoft Foundry Models](../../../../examples/azure-openai-chat) - Integrácia AI

---

## Zhrnutie

**Naučili ste sa:**
- ✅ Päť vzorov koordinácie (sekvenčný, paralelný, hierarchický, na udalosti, konsenzus)
- ✅ Architektúra viacerých agentov na Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Správa stavu medzi distribuovanými agentmi
- ✅ Spracovanie timeoutov, opakovaní a circuit breakerov
- ✅ Monitorovanie a ladenie distribuovaných systémov
- ✅ Stratégie optimalizácie nákladov

**Kľúčové závery:**
1. **Vyberte správny vzor** - sekvenčný pre usporiadané workflow, paralelný pre rýchlosť, na udalosti pre flexibilitu
2. **Starostlivo spravujte stav** - používajte Cosmos DB alebo podobné pre zdieľaný stav
3. **Ovládajte zlyhania elegantne** - timeouty, opakovania, circuit breaker, dead letter queue
4. **Monitorujte všetko** - distribuované sledovanie je nevyhnutné na ladenie
5. **Optimalizujte náklady** - škálujte na nulu, používajte serverless, implementujte cache

**Ďalšie kroky:**
1. Dokončite praktické cvičenia
2. Postavte systém s viacerými agentmi pre váš prípad použitia
3. Študujte [Výber SKU](sku-selection.md) pre optimalizáciu výkonu a nákladov

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->