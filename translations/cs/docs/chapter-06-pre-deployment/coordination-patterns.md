# Vzory koordinace více agentů

⏱️ **Odhadovaný čas**: 60–75 minut | 💰 **Odhadované náklady**: ~$100-300/měsíc | ⭐ **Komplexita**: Pokročilé

**📚 Cesta učení:**
- ← Předchozí: [Plánování kapacity](capacity-planning.md) - Dimenzování zdrojů a strategie škálování
- 🎯 **Jste zde**: Vzory koordinace více agentů (orchestrace, komunikace, správa stavu)
- → Další: [Výběr SKU](sku-selection.md) - Výběr správných služeb Azure
- 🏠 [Domov kurzu](../../README.md)

---

## Co se naučíte

Po dokončení této lekce:
- Porozumíte vzorům architektury více agentů a kdy je je použít
- Implementujete **vzor orchestrace** (centralizovaná, decentralizovaná, hierarchická)
- Navrhnete strategie **komunikace mezi agenty** (synchronní, asynchronní, událostmi řízená)
- Budete spravovat **sdílený stav** napříč distribuovanými agenty
- Nasadíte **systémy více agentů** na Azure pomocí AZD
- Aplikujete **koordinanční vzory** pro reálné AI scénáře
- Monitorujete a ladíte distribuované systémy agentů

## Proč je koordinace více agentů důležitá

### Vývoj: od jednoho agenta k více agentům

**Jednotný agent (Jednoduché):**
```
User → Agent → Response
```
- ✅ Snadné pochopit a implementovat
- ✅ Rychlé pro jednoduché úkoly
- ❌ Omezené schopnostmi jediného modelu
- ❌ Nelze paralelizovat složité úkoly
- ❌ Bez specializace

**Systém více agentů (Pokročilé):**
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
- ✅ Specializovaní agenti pro konkrétní úkoly
- ✅ Paralelní vykonávání pro rychlost
- ✅ Modulární a udržovatelné
- ✅ Lepší pro složité pracovní toky
- ⚠️ Vyžaduje koordinační logiku

**Analogie**: Jediný agent je jako jedna osoba dělající všechny úkoly. Více agentů je jako tým, kde má každý člen specializované dovednosti (výzkumník, kodér, recenzent, spisovatel) a spolupracují.

---

## Hlavní koordinační vzory

### Vzor 1: Sekvenční koordinace (Řetězec odpovědnosti)

**Kdy použít**: Úkoly musí být dokončeny v konkrétním pořadí, každý agent staví na výstupu předchozího.

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as Výzkumný agent
    participant Agent2 as Autorský agent
    participant Agent3 as Redakční agent
    
    User->>Orchestrator: "Napiš článek o AI"
    Orchestrator->>Agent1: Proveď výzkum tématu
    Agent1-->>Orchestrator: Výsledky výzkumu
    Orchestrator->>Agent2: Napiš koncept (s využitím výzkumu)
    Agent2-->>Orchestrator: Koncept článku
    Orchestrator->>Agent3: Uprav a vylepši
    Agent3-->>Orchestrator: Konečný článek
    Orchestrator-->>User: Vyleštěný článek
    
    Note over User,Agent3: Sekvenční: Každý krok čeká na předchozí
```
**Výhody:**
- ✅ Jasný tok dat
- ✅ Snadné ladění
- ✅ Předvídatelné pořadí vykonávání

**Omezení:**
- ❌ Pomalejší (bez paralelismu)
- ❌ Jedna chyba zablokuje celý řetězec
- ❌ Nedokáže zpracovat vzájemně závislé úkoly

**Příklady použití:**
- Pipeline tvorby obsahu (výzkum → psaní → editace → publikace)
- Generování kódu (plán → implementace → test → nasazení)
- Generování reportů (sběr dat → analýza → vizualizace → shrnutí)

---

### Vzor 2: Paralelní koordinace (Fan-Out/Fan-In)

**Kdy použít**: Nezávislé úkoly mohou běžet současně, výsledky se na konci kombinují.

```mermaid
graph TB
    User[Uživatelský požadavek]
    Orchestrator[Orchestrátor]
    Agent1[Analytický agent]
    Agent2[Výzkumný agent]
    Agent3[Datový agent]
    Aggregator[Agregátor výsledků]
    Response[Kombinovaná odpověď]
    
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
- ✅ Rychlé (paralelní vykonávání)
- ✅ Odolné vůči chybám (částečné výsledky přijatelné)
- ✅ Škálovatelné horizontálně

**Omezení:**
- ⚠️ Výsledky mohou dorazit mimo pořadí
- ⚠️ Potřeba agregační logiky
- ⚠️ Složité řízení stavu

**Příklady použití:**
- Sběr dat z více zdrojů (API + databáze + web scraping)
- Konkurenční analýza (více modelů generuje řešení, vybere se nejlepší)
- Překladové služby (překlad do více jazyků současně)

---

### Vzor 3: Hierarchická koordinace (Manažer-Pracovník)

**Kdy použít**: Složité pracovní toky s podúkoly, potřeba delegace.

```mermaid
graph TB
    Master[Hlavní orchestrátor]
    Manager1[Manažer výzkumu]
    Manager2[Manažer obsahu]
    W1[Webový scraper]
    W2[Analyzátor článků]
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
- ✅ Zvládá složité pracovní toky
- ✅ Modulární a udržovatelné
- ✅ Jasné hranice odpovědnosti

**Omezení:**
- ⚠️ Složitější architektura
- ⚠️ Vyšší latence (více koordinačních vrstev)
- ⚠️ Vyžaduje sofistikovanou orchestraci

**Příklady použití:**
- Zpracování podnikových dokumentů (klasifikace → směrování → zpracování → archivace)
- Víceúrovňové datové pipeline (ingest → čištění → transformace → analýza → report)
- Složité automatizační workflowy (plánování → alokace zdrojů → provedení → monitorování)

---

### Vzor 4: Událostmi řízená koordinace (Publish-Subscribe)

**Kdy použít**: Agenti musí reagovat na události, požadováno volné propojení.

```mermaid
sequenceDiagram
    participant Agent1 as Sběrač dat
    participant EventBus as Služba Azure Service Bus
    participant Agent2 as Analyzátor
    participant Agent3 as Oznamovatel
    participant Agent4 as Archivátor
    
    Agent1->>EventBus: Publikovat událost "DataPřijata"
    EventBus->>Agent2: Odběr: Analyzovat data
    EventBus->>Agent3: Odběr: Odeslat oznámení
    EventBus->>Agent4: Odběr: Archivovat data
    
    Note over Agent1,Agent4: Všichni odběratelé zpracovávají nezávisle
    
    Agent2->>EventBus: Publikovat událost "AnalýzaDokončena"
    EventBus->>Agent3: Odběr: Odeslat zprávu o analýze
```
**Výhody:**
- ✅ Volné propojení mezi agenty
- ✅ Snadné přidat nové agenty (stačí se přihlásit k odběru)
- ✅ Asynchronní zpracování
- ✅ Odolné (perzistence zpráv)

**Omezení:**
- ⚠️ Eventuální konzistence
- ⚠️ Složité ladění
- ⚠️ Výzvy s pořadím zpráv

**Příklady použití:**
- Systémy pro monitorování v reálném čase (upozornění, dashboardy, protokoly)
- Notifikace na více kanálech (e-mail, SMS, push, Slack)
- Datové pipeline (více spotřebitelů stejných dat)

---

### Vzor 5: Konsenzuální koordinace (Hlasování/Kvorum)

**Kdy použít**: Potřeba dohody od více agentů před pokračováním.

```mermaid
graph TB
    Input[Vstupní úkol]
    Agent1[Agent 1: GPT-4]
    Agent2[Agent 2: Claude]
    Agent3[Agent 3: Gemini]
    Voter[Konsenzusní hlasovač]
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
- ✅ Vyšší přesnost (více názorů)
- ✅ Odolné vůči chybám (menšinové selhání přijatelné)
- ✅ Vestavěné zajištění kvality

**Omezení:**
- ❌ Nákladné (více volání modelu)
- ❌ Pomalejší (čekání na všechny agenty)
- ⚠️ Nutné řešení konfliktů

**Příklady použití:**
- Moderace obsahu (více modelů kontroluje obsah)
- Revize kódu (více linterů/analyzátorů)
- Lékařská diagnostika (více AI modelů, validace odborníkem)

---

## Přehled architektury

### Kompletní systém více agentů na Azure

```mermaid
graph TB
    User[Uživatel/API klient]
    APIM[Správa rozhraní API Azure]
    Orchestrator[Orchestrační služba<br/>Aplikace kontejneru]
    ServiceBus[Azure Service Bus<br/>Event Hub]
    
    Agent1[Výzkumný agent<br/>Aplikace kontejneru]
    Agent2[Agent pro psaní<br/>Aplikace kontejneru]
    Agent3[Analytický agent<br/>Aplikace kontejneru]
    Agent4[Agent recenzent<br/>Aplikace kontejneru]
    
    CosmosDB[(Cosmos DB<br/>Sdílený stav)]
    Storage[Azure Storage<br/>Artefakty]
    AppInsights[Application Insights<br/>Monitorování]
    
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
**Klíčové komponenty:**

| Component | Purpose | Azure Service |
|-----------|---------|---------------|
| **API Gateway** | Vstupní bod, omezení rychlosti, autentizace | API Management |
| **Orchestrator** | Koordinuje pracovní toky agentů | Container Apps |
| **Message Queue** | Asynchronní komunikace | Service Bus / Event Hubs |
| **Agents** | Specializovaní AI pracovníci | Container Apps / Functions |
| **State Store** | Sdílený stav, sledování úkolů | Cosmos DB |
| **Artifact Storage** | Dokumenty, výsledky, protokoly | Blob Storage |
| **Monitoring** | Distribuované trasování, protokoly | Application Insights |

---

## Předpoklady

### Požadované nástroje

```bash
# Ověřte Azure Developer CLI
azd version
# ✅ Očekáváno: azd verze 1.0.0 nebo vyšší

# Ověřte Azure CLI
az --version
# ✅ Očekáváno: azure-cli 2.50.0 nebo vyšší

# Ověřte Docker (pro lokální testování)
docker --version
# ✅ Očekáváno: Docker verze 20.10 nebo vyšší
```

### Požadavky Azure

- Aktivní předplatné Azure
- Oprávnění k vytvoření:
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB účtů
  - Storage účtů
  - Application Insights

### Požadované znalosti

Měli byste mít dokončeno:
- [Správa konfigurace](../chapter-03-configuration/configuration.md)
- [Autentizace a zabezpečení](../chapter-03-configuration/authsecurity.md)
- [Příklad mikroslužeb](../../../../examples/microservices)

---

## Průvodce implementací

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

## Lekce 1: Sekvenční koordinační vzor

### Implementace: Pipeline tvorby obsahu

Vytvoříme sekvenční pipeline: Výzkum → Psaní → Editace → Publikace

### 1. Konfigurace AZD

**Soubor: `azure.yaml`**

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

### 2. Infrastruktura: Service Bus pro koordinaci

**Soubor: `infra/core/servicebus.bicep`**

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

### 3. Správce sdíleného stavu

**Soubor: `src/shared/state_manager.py`**

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

**Soubor: `src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# Připojení k Service Bus
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
    
    # Vytvořit úlohu ve stavovém úložišti
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # Odeslat zprávu výzkumnému agentovi (první krok)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # Kam poslat výsledky
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

### 5. Výzkumný agent

**Soubor: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# Inicializovat klienty
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
    
    # Zavolat Azure OpenAI pro výzkum
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # Aktualizovat stav
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # Poslat dalšímu agentovi (spisovateli)
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

### 6. Píšící agent

**Soubor: `src/agents/writer/app.py`**

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
    
    # Zavolat Azure OpenAI, aby napsal článek
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # Aktualizovat stav
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # Odeslat editorovi
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

**Soubor: `src/agents/editor/app.py`**

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
    
    # Zavolat Azure OpenAI k úpravě
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # Označit úkol jako dokončený
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

### 8. Nasazení a testování

```bash
# Inicializovat a nasadit
azd init
azd up

# Získat URL orchestrátoru
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Vytvořit obsah
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ Očekávaný výstup:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**Zkontrolujte průběh úkolu:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Očekávaný výstup (dokončeno):**
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

## Lekce 2: Paralelní koordinační vzor

### Implementace: Agregátor multi-zdrojového výzkumu

Vytvoříme paralelní systém, který shromažďuje informace z více zdrojů současně.

### Paralelní orchestrátor

**Soubor: `src/orchestrator/parallel_workflow.py`**

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
    
    # Rozvětvení: Odeslat všem agentům současně
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

### Agregační logika

**Soubor: `src/agents/aggregator/app.py`**

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

# Sledovat výsledky pro jednotlivé úkoly
task_results = defaultdict(list)
expected_agents = 4  # web, akademické, zpravodajské, sociální

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # Uložit výsledek
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # Zkontrolovat, zda všichni agenti dokončili (fan-in)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # Sloučit výsledky
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # Označit jako dokončené
        state_manager.complete_task(task_id, aggregated)
        
        # Vyčistit
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

**Výhody paralelního vzoru:**
- ⚡ **4x rychleji** (agenti běží současně)
- 🔄 **Odolné vůči chybám** (částečné výsledky přijatelné)
- 📈 **Škálovatelné** (snadné přidání dalších agentů)

---

## Praktická cvičení

### Cvičení 1: Přidat zpracování timeoutu ⭐⭐ (Střední)

**Cíl**: Implementovat logiku timeoutu, aby agregátor nečekal nekonečně na pomalé agenty.

**Kroky**:

1. **Přidat sledování timeoutu do agregátoru:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> expiration_time

def process_result(message_data):
    task_id = message_data['task_id']
    
    # Nastavit časový limit pro první výsledek
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # Zkontrolovat, zda je dokončeno nebo vypršel čas
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
        
        # Vyčištění
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **Otestovat s umělými zpožděními:**

```python
# U jednoho agenta přidejte prodlevu, aby se simulovalo pomalé zpracování
import time
time.sleep(35)  # Překračuje časový limit 30 sekund
```

3. **Nasadit a ověřit:**

```bash
azd deploy aggregator

# Odeslat úlohu
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Zkontrolujte výsledky za 30 sekund
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Kritéria úspěchu:**
- ✅ Úkol se dokončí po 30 sekundách i když agenti nebudou dokončeni
- ✅ Odezva indikuje částečné výsledky (`"timed_out": true`)
- ✅ Vráceny jsou dostupné výsledky (3 ze 4 agentů)

**Čas**: 20–25 minut

---

### Cvičení 2: Implementovat logiku retry ⭐⭐⭐ (Pokročilé)

**Cíl**: Automaticky opakovat neúspěšné úkoly agentů před vzdáním se.

**Kroky**:

1. **Přidat sledování retry do orchestrátoru:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # ID zprávy -> počet pokusů

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

2. **Přidat retry handler do agentů:**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # Zpracovat zprávu
        process_func(message_data)
        
        # Úspěch - dokončeno
        receiver.complete_message(message)
        
    except Exception as e:
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # Opakovat: opustit a znovu vložit do fronty se zvýšeným počtem
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # Odeslat zpět do stejné fronty se zpožděním
            time.sleep(5 * (retry_count + 1))  # Exponenciální prodleva
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # Odstranit původní
        else:
            # Maximální počet pokusů překročen - přesunout do fronty mrtvých zpráv
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **Monitorovat dead letter queue:**

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

**✅ Kritéria úspěchu:**
- ✅ Neúspěšné úkoly se automaticky opakují (až 3x)
- ✅ Exponenciální zpětné odsazení mezi retry (5s, 10s, 15s)
- ✅ Po max. retry zprávy přecházejí do dead letter queue
- ✅ Dead letter queue lze monitorovat a přehrát

**Čas**: 30–40 minut

---

### Cvičení 3: Implementovat Circuit Breaker ⭐⭐⭐ (Pokročilé)

**Cíl**: Zabránit kaskádovým selháním zastavením požadavků na selhávající agenty.

**Kroky**:

1. **Vytvořit třídu circuit breaker:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # Normální provoz
    OPEN = "open"          # Selhává, odmítá požadavky
    HALF_OPEN = "half_open"  # Testuje, zda se zotavil

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
            # Zkontrolujte, zda vypršel časový limit
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # Úspěch
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

2. **Aplikovat na volání agentů:**

```python
# V orchestrátoru
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
        # Pokračujte s ostatními agenty
```

3. **Otestovat circuit breaker:**

```bash
# Simulujte opakovaná selhání (zastavte jednoho agenta)
az containerapp stop --name web-research-agent --resource-group rg-agents

# Odeslat více požadavků
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# Zkontrolujte logy - mělo by být vidět otevření obvodu po 5 selháních
# Použijte Azure CLI pro logy Container App:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ Kritéria úspěchu:**
- ✅ Po 5 selháních se obvod otevře (požadavky jsou odmítnuty)
- ✅ Po 60 sekundách přejde obvod do stavu half-open (test obnovy)
- ✅ Ostatní agenti pokračují normálně v práci
- ✅ Obvod se automaticky uzavře, když se agent zotaví

**Čas**: 40–50 minut

---

## Monitorování a ladění

### Distribuované trasování s Application Insights

**Soubor: `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# Konfigurujte trasování
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# Vytvořte trasovač
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# Konfigurujte protokolování
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

### Dotazy Application Insights

**Sledování pracovních toků více agentů:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**Porovnání výkonu agentů:**

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

**Analýza selhání:**

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

## Analýza nákladů

### Náklady systému více agentů (měsíční odhady)

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

### Strategie optimalizace nákladů

1. **Používejte serverless tam, kde je to možné:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Škálujte agenty na nulu, když jsou nečinní:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Používejte batchování pro Service Bus:**
   ```python
   # Posílejte zprávy po dávkách (levnější)
   sender.send_messages([message1, message2, message3])
   ```

4. **Cacheujte často používané výsledky:**
   ```python
   # Použijte Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Best Practices

### ✅ DĚLEJTE:

1. **Používejte idempotentní operace**
   ```python
   # Agent může bezpečně zpracovat stejnou zprávu vícekrát
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # Zpracovávám úlohu...
   ```

2. **Implementujte komplexní logování**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Používejte correlation ID**
   ```python
   # Přeneste task_id napříč celým pracovním tokem
   message_data = {
       'task_id': task_id,  # Korelační ID
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Nastavte TTL zpráv (time-to-live)**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Monitorujte dead letter queues**
   ```python
   # Pravidelné sledování neúspěšných zpráv
   monitor_dead_letters()
   ```

### ❌ NEDĚLEJTE:

1. **Nevytvářejte kruhové závislosti**
   ```python
   # ❌ ŠPATNÉ: Agent A → Agent B → Agent A (nekonečná smyčka)
   # ✅ DOBRÉ: Definujte jasný orientovaný acyklický graf (DAG)
   ```

2. **Nezablokovávejte vlákna agentů**
   ```python
   # ❌ ŠPATNĚ: Synchronní čekání
   while not task_complete:
       time.sleep(1)
   
   # ✅ DOBRÉ: Použijte zpětná volání fronty zpráv
   ```

3. **Nechoďte ignorovat částečná selhání**
   ```python
   # ❌ ŠPATNÉ: Zastavit celý pracovní postup, pokud jeden agent selže
   # ✅ DOBRÉ: Vrátit částečné výsledky s indikátory chyb
   ```

4. **Nepoužívejte nekonečné retry**
   ```python
   # ❌ ŠPATNÉ: opakovat donekonečna
   # ✅ DOBRÉ: max_retries = 3, pak do dead-letter fronty
   ```

---

## Průvodce řešením problémů

### Problém: Zprávy uvízlé ve frontě

**Příznaky:**
- Zprávy se hromadí ve frontě
- Agenti je nezpracovávají
- Stav úkolu uvízl na "pending"

**Diagnóza:**
```bash
# Zkontrolujte hloubku fronty
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Zkontrolujte protokoly agenta pomocí Azure CLI
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**Řešení:**

1. **Zvyšte počet replik agentů:**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Zkontrolujte dead letter frontu:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problém: Vypršení časového limitu úkolu / nikdy se nedokončí

**Příznaky:**
- Stav úkolu zůstává "in_progress"
- Někteří agenti dokončí, jiní ne
- Žádné chybové zprávy

**Diagnóza:**
```bash
# Zkontrolovat stav úlohy
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Zkontrolovat Application Insights
# Spustit dotaz: traces | where customDimensions.task_id == "..."
```

**Řešení:**

1. **Implementujte časový limit v agregátoru (Cvičení 1)**

2. **Zkontrolujte chyby agentů pomocí Azure Monitoru:**
   ```bash
   # Zobrazit protokoly pomocí azd monitor
   azd monitor --logs
   
   # Nebo použijte Azure CLI ke kontrole protokolů konkrétní kontejnerové aplikace
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Ověřte, že všichni agenti běží:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## Další informace

### Oficiální dokumentace
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### Další kroky v tomto kurzu
- ← Předchozí: [Plánování kapacity](capacity-planning.md)
- → Další: [Výběr SKU](sku-selection.md)
- 🏠 [Domov kurzu](../../README.md)

### Související příklady
- [Příklad mikroservis](../../../../examples/microservices) - Vzory komunikace mezi službami
- [Příklad Azure OpenAI](../../../../examples/azure-openai-chat) - Integrace AI

---

## Shrnutí

**Naučili jste se:**
- ✅ Pět vzorů koordinace (sekvenční, paralelní, hierarchický, řízený událostmi, konsensus)
- ✅ Architektura multi-agentního systému na Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Řízení stavu napříč distribuovanými agenty
- ✅ Zpracování časových limitů, opakování a obvodových jističů
- ✅ Monitorování a ladění distribuovaných systémů
- ✅ Strategie optimalizace nákladů

**Hlavní poznatky:**
1. **Zvolte správný vzor** - sekvenční pro uspořádané workflow, paralelní pro rychlost, řízený událostmi pro flexibilitu
2. **Pečlivě spravujte stav** - Použijte Cosmos DB nebo podobné řešení pro sdílený stav
3. **Zacházejte s chybami elegantně** - časové limity, opakování, obvodové jističe, dead letter fronty
4. **Monitorujte vše** - Distribuované trasování je nezbytné pro ladění
5. **Optimalizujte náklady** - škálujte na nulu, používejte serverless, implementujte cachování

**Další kroky:**
1. Dokončete praktická cvičení
2. Vybudujte multi-agentní systém pro váš případ použití
3. Prostudujte [Výběr SKU](sku-selection.md) pro optimalizaci výkonu a nákladů

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Prohlášení o vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro zásadní informace doporučujeme využít profesionální lidský překlad. Nejsme odpovědni za žádná nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->