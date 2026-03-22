# Vzory koordinace více agentů

⏱️ **Odhadovaný čas**: 60-75 minut | 💰 **Odhadované náklady**: ~$100-300/měsíc | ⭐ **Složitost**: Pokročilá

**📚 Studijní cesta:**
- ← Předchozí: [Plánování kapacity](capacity-planning.md) - Určení velikosti zdrojů a škálovací strategie
- 🎯 **Jste zde**: Vzory koordinace více agentů (orchestrace, komunikace, správa stavu)
- → Další: [Výběr SKU](sku-selection.md) - Výběr správných Azure služeb
- 🏠 [Domov kurzu](../../README.md)

---

## Co se naučíte

Po dokončení této lekce se naučíte:
- Porozumět vzorům **architektury více agentů** a kdy je používat
- Implementovat **vzor orchestrace** (centralizovaný, decentralizovaný, hierarchický)
- Navrhnout strategie **komunikace agentů** (synchronní, asynchronní, událostmi řízené)
- Spravovat **sdílený stav** mezi distribuovanými agenty
- Nasadit **systémy více agentů** na Azure pomocí AZD
- Aplikovat **vzory koordinace** pro reálné AI scénáře
- Monitorovat a ladit distribuované systémy agentů

## Proč je koordinace více agentů důležitá

### Evoluce: Od jednoho agenta k více agentům

**Jeden agent (Jednoduché):**
```
User → Agent → Response
```
- ✅ Snadné na pochopení a implementaci
- ✅ Rychlé pro jednoduché úkoly
- ❌ Omezené schopnostmi jednoho modelu
- ❌ Nelze paralelizovat složité úlohy
- ❌ Žádná specializace

**Systém více agentů (Pokročilé):**
```mermaid
graph TD
    Orchestrator[Orchestrátor] --> Agent1[Agent1<br/>Plán]
    Orchestrator --> Agent2[Agent2<br/>Kód]
    Orchestrator --> Agent3[Agent3<br/>Revize]
```- ✅ Specializovaní agenti pro konkrétní úkoly
- ✅ Paralelní vykonávání pro rychlost
- ✅ Modulární a udržovatelné
- ✅ Lepší při složitých pracovních postupech
- ⚠️ Vyžaduje logiku koordinace

**Analogie**: Jeden agent je jako jedna osoba dělající všechny úkoly. Systém více agentů je jako tým, kde má každý člen specializované dovednosti (výzkumník, programátor, recenzent, autor), kteří spolupracují.

---

## Základní vzory koordinace

### Vzor 1: Sekvenční koordinace (Řetězec odpovědnosti)

**Kdy použít**: Úkoly musí být dokončeny v přesném pořadí, každý agent navazuje na výstup předchozího.

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as Agent pro výzkum
    participant Agent2 as Agent pro psaní
    participant Agent3 as Redakční agent
    
    User->>Orchestrator: "Napiš článek o umělé inteligenci"
    Orchestrator->>Agent1: Proveď výzkum tématu
    Agent1-->>Orchestrator: Výsledky výzkumu
    Orchestrator->>Agent2: Napiš návrh (použij výzkum)
    Agent2-->>Orchestrator: Návrh článku
    Orchestrator->>Agent3: Uprav a vylepši
    Agent3-->>Orchestrator: Konečný článek
    Orchestrator-->>User: Upravený článek
    
    Note over User,Agent3: Sekvenční: Každý krok čeká na předchozí
```
**Výhody:**
- ✅ Jasný tok dat
- ✅ Snadné ladění
- ✅ Předvídatelné pořadí vykonávání

**Omezení:**
- ❌ Pomalejší (žádná paralelizace)
- ❌ Jedna chyba zablokuje celý řetězec
- ❌ Nedokáže zpracovat vzájemně závislé úkoly

**Příklady použití:**
- Proces tvorby obsahu (výzkum → psaní → editace → publikace)
- Generování kódu (plán → implementace → testování → nasazení)
- Generování reportů (sběr dat → analýza → vizualizace → shrnutí)

---

### Vzor 2: Paralelní koordinace (Fan-Out/Fan-In)

**Kdy použít**: Nezávislé úkoly mohou běžet současně a výsledky jsou na konci sloučeny.

```mermaid
graph TB
    User[Požadavek uživatele]
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
- ⚠️ Potřeba logiky agregace
- ⚠️ Složitá správa stavu

**Příklady použití:**
- Shromažďování dat z více zdrojů (API + databáze + web scraping)
- Konkurenční analýza (více modelů generuje řešení, vybere se nejlepší)
- Služby překladu (překlad do více jazyků současně)

---

### Vzor 3: Hierarchická koordinace (Manažer-Pracovník)

**Kdy použít**: Složité pracovní postupy s podúkoly, vyžadující delegování.

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
- ✅ Zvládá složité pracovní postupy
- ✅ Modulární a udržovatelné
- ✅ Jasné hranice odpovědnosti

**Omezení:**
- ⚠️ Složitější architektura
- ⚠️ Vyšší latence (více vrstev koordinace)
- ⚠️ Vyžaduje sofistikovanou orchestraci

**Příklady použití:**
- Zpracování podnikových dokumentů (klasifikovat → směrovat → zpracovat → archivovat)
- Vícefázové datové pipeline (ingest → clean → transform → analyze → report)
- Složité automatizační pracovní postupy (plánování → alokace zdrojů → provedení → monitorování)

---

### Vzor 4: Událostmi řízená koordinace (Publish-Subscribe)

**Kdy použít**: Agenti potřebují reagovat na události, požadováno volné propojení.

```mermaid
sequenceDiagram
    participant Agent1 as Sběrač dat
    participant EventBus as Služba Azure Service Bus
    participant Agent2 as Analyzátor
    participant Agent3 as Oznamovatel
    participant Agent4 as Archivátor
    
    Agent1->>EventBus: Publikovat událost "DataPřijata"
    EventBus->>Agent2: Přihlásit se: Analyzovat data
    EventBus->>Agent3: Přihlásit se: Odeslat oznámení
    EventBus->>Agent4: Přihlásit se: Archivovat data
    
    Note over Agent1,Agent4: Všichni odběratelé zpracovávají nezávisle
    
    Agent2->>EventBus: Publikovat událost "AnalýzaDokončena"
    EventBus->>Agent3: Přihlásit se: Odeslat zprávu z analýzy
```
**Výhody:**
- ✅ Volné propojení mezi agenty
- ✅ Snadné přidávání nových agentů (stačí se přihlásit k odběru)
- ✅ Asynchronní zpracování
- ✅ Odolné (perzistence zpráv)

**Omezení:**
- ⚠️ Eventuální konzistence
- ⚠️ Složitější ladění
- ⚠️ Problémy s pořadím zpráv

**Příklady použití:**
- Systémy pro monitoring v reálném čase (upozornění, přehledy, logy)
- Notifikace přes více kanálů (email, SMS, push, Slack)
- Datové pipeline (více konzumentů stejných dat)

---

### Vzor 5: Koordinace založená na konsensu (Voting/Quorum)

**Kdy použít**: Potřeba souhlasu od více agentů před pokračováním.

```mermaid
graph TB
    Input[Vstupní úkol]
    Agent1[Agent 1: gpt-4.1]
    Agent2[Agent 2: Claude]
    Agent3[Agent 3: Gemini]
    Voter[Konsenzuální hlasovač]
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
- ✅ Odolné vůči chybám (přijatelné selhání menšiny)
- ✅ Vestavěné zajištění kvality

**Omezení:**
- ❌ Nákladné (více volání modelů)
- ❌ Pomalejší (čekání na všechny agenty)
- ⚠️ Potřeba řešení konfliktů

**Příklady použití:**
- Moderace obsahu (více modelů hodnotí obsah)
- Kontrola kódu (více linterů/analyzátorů)
- Lékařská diagnostika (více AI modelů, ověření expertem)

---

## Přehled architektury

### Kompletní systém více agentů na Azure

```mermaid
graph TB
    User[Uživatel/API klient]
    APIM[Správa API Azure]
    Orchestrator[Služba orchestrátoru<br/>Aplikace kontejneru]
    ServiceBus[Azure Service Bus<br/>Centrum událostí]
    
    Agent1[Agent pro výzkum<br/>Aplikace kontejneru]
    Agent2[Agent pro psaní<br/>Aplikace kontejneru]
    Agent3[Analytický agent<br/>Aplikace kontejneru]
    Agent4[Agent pro revizi<br/>Aplikace kontejneru]
    
    CosmosDB[(Cosmos DB<br/>Sdílený stav)]
    Storage[Úložiště Azure<br/>Artefakty]
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
**Klíčové součásti:**

| Komponenta | Účel | Azure služba |
|-----------|---------|---------------|
| **API brána** | Vstupní bod, omezení rychlosti, autentizace | API Management |
| **Orchestrátor** | Koordinuje pracovní postupy agentů | Container Apps |
| **Fronta zpráv** | Asynchronní komunikace | Service Bus / Event Hubs |
| **Agenti** | Specializovaní AI pracovníci | Container Apps / Functions |
| **Úložiště stavu** | Sdílený stav, sledování úkolů | Cosmos DB |
| **Úložiště artefaktů** | Dokumenty, výsledky, logy | Blob Storage |
| **Monitoring** | Distribuované trasování, logy | Application Insights |

---

## Požadavky

### Požadované nástroje

```bash
# Ověřte Azure Developer CLI
azd version
# ✅ Očekává se: azd verze 1.0.0 nebo vyšší

# Ověřte Azure CLI
az --version
# ✅ Očekává se: azure-cli 2.50.0 nebo vyšší

# Ověřte Docker (pro lokální testování)
docker --version
# ✅ Očekává se: Docker verze 20.10 nebo vyšší
```

### Požadavky pro Azure

- Aktivní předplatné Azure
- Oprávnění k vytvoření:
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB accounts
  - Storage accounts
  - Application Insights

### Předpokládané znalosti

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

## Lekce 1: Sekvenční vzor koordinace

### Implementace: Pipeline tvorby obsahu

Postavme sekvenční pipeline: Výzkum → Psaní → Editace → Publikace

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

### 4. Služba orchestrátoru

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
    
    # Zavolat modely Microsoft Foundry pro výzkum
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
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
    
    # Odeslat dalšímu agentovi (autorovi)
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

### 6. Agent pro psaní

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
    
    # Zavolat Microsoft Foundry Models k napsání článku
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
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
    
    # Poslat editorovi
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

### 7. Redakční agent

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
    
    # Zavolat Microsoft Foundry Models k úpravě
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
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
# Možnost A: Nasazení založené na šabloně
azd init
azd up

# Možnost B: Nasazení pomocí manifestu agenta (vyžaduje rozšíření)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> Viz [Příkazy AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pro všechny `azd ai` přepínače a možnosti.

```bash
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

## Lekce 2: Paralelní vzor koordinace

### Implementace: Aggregátor výzkumu z více zdrojů

Postavme paralelní systém, který současně sbírá informace z více zdrojů.

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
    
    # Rozesílání: Odeslat všem agentům současně
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

### Logika agregace

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

# Sledovat výsledky pro každý úkol
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
- ⚡ **4× rychleji** (agenti běží současně)
- 🔄 **Odolné vůči chybám** (částečné výsledky přijatelné)
- 📈 **Škálovatelné** (snadné přidání více agentů)

---

## Praktická cvičení

### Cvičení 1: Přidat zpracování timeoutu ⭐⭐ (Střední)

**Cíl**: Implementovat logiku timeoutu, aby agregátor nečekal věčně na pomalé agenty.

**Kroky**:

1. **Přidejte sledování timeoutu do agregátoru:**

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
    
    # Zkontrolovat, zda je dokončeno NEBO vypršel čas
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

2. **Otestujte s umělými zpožděními:**

```python
# U jednoho agenta přidejte zpoždění pro simulaci pomalého zpracování
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
- ✅ Úkol se dokončí po 30 sekundách i když agenti nejsou dokončeni
- ✅ Odpověď indikuje částečné výsledky (`"timed_out": true`)
- ✅ Dostupné výsledky jsou vráceny (3 ze 4 agentů)

**Čas**: 20-25 minut

---

### Cvičení 2: Implementovat logiku opakování (Retry) ⭐⭐⭐ (Pokročilé)

**Cíl**: Automaticky opakovat selhané úkoly agentů před tím, než se vzdá.

**Kroky**:

1. **Přidejte sledování opakování do orchestrátoru:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # id_zprávy -> počet_pokusů

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

2. **Přidejte handler opakování do agentů:**

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
            # Opakovat: opustit a znovu zařadit do fronty se zvýšeným počtem
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # Poslat zpět do stejné fronty s prodlevou
            time.sleep(5 * (retry_count + 1))  # Exponenciální zpoždění
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

3. **Monitorujte dead-letter frontu:**

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
- ✅ Selhané úkoly se automaticky opakují (až 3x)
- ✅ Exponenciální backoff mezi pokusy (5s, 10s, 15s)
- ✅ Po dosažení maximálního počtu pokusů se zprávy přesunou do dead-letter fronty
- ✅ Dead-letter frontu lze monitorovat a znovu přehrát

**Čas**: 30-40 minut

---

### Cvičení 3: Implementovat Circuit Breaker ⭐⭐⭐ (Pokročilé)

**Cíl**: Zabránit kaskádovým selháním tím, že se zastaví požadavky na selhávající agenty.

**Kroky**:

1. **Vytvořte třídu circuit breaker:**

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
            # Zkontrolovat, zda vypršel časový limit
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

2. **Aplikujte na volání agentů:**

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

3. **Otestujte circuit breaker:**

```bash
# Simulujte opakovaná selhání (zastavte jednoho agenta)
az containerapp stop --name web-research-agent --resource-group rg-agents

# Odešlete více požadavků
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# Zkontrolujte logy - mělo by být vidět, že obvod je otevřen po 5 selháních
# Použijte Azure CLI pro logy Container App:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ Kritéria úspěchu:**
- ✅ Po 5 selháních se circuit otevře (odmítá požadavky)
- ✅ Po 60 sekundách se circuit přepne do stavu half-open (testuje obnovu)
- ✅ Ostatní agenti pokračují v normálním fungování
- ✅ Circuit se automaticky zavře, když se agent zotaví

**Čas**: 40-50 minut

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

# Nastavit trasování
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# Vytvořit tracer
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# Nastavit logování
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

**Sledovat pracovní postupy více agentů:**

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

### Náklady systému více agentů (měsíční odhad)

| Komponenta | Konfigurace | Náklady |
|-----------|--------------|------|
| **Orchestrátor** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 agenti** | 4 Container Apps (0.5 vCPU, 1GB každý) | $60-120 |
| **Service Bus** | Standardní úroveň, 10M zpráv | $10-20 |
| **Cosmos DB** | Serverless, 5GB úložiště, 1M RUs | $25-50 |
| **Blob Storage** | 10GB úložiště, 100K operací | $5-10 |
| **Application Insights** | 5GB příjmu dat | $10-15 |
| **Microsoft Foundry Models** | gpt-4.1, 10M tokenů | $100-300 |
| **Celkem** | | **$240-565/měsíc** |

### Strategie optimalizace nákladů

1. **Používejte serverless, kde je to možné:**
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

3. **Používejte dávkování (batching) pro Service Bus:**
   ```python
   # Odesílat zprávy po dávkách (levněji)
   sender.send_messages([message1, message2, message3])
   ```

4. **Kešujte často používané výsledky:**
   ```python
   # Použijte Azure Cache pro Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Doporučené postupy

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

2. **Zaveďte komplexní logování**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Používejte korelační ID**
   ```python
   # Přenést task_id celým pracovním tokem
   message_data = {
       'task_id': task_id,  # Identifikátor korelace
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Nastavte TTL (time-to-live) zpráv**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Monitorujte dead-letter fronty**
   ```python
   # Pravidelné sledování selhaných zpráv
   monitor_dead_letters()
   ```

### ❌ NEDĚLEJTE:

1. **Nevytvářejte kruhové závislosti**
   ```python
   # ❌ ŠPATNĚ: Agent A → Agent B → Agent A (nekonečná smyčka)
   # ✅ DOBŘE: Definujte jasný orientovaný acyklický graf (DAG)
   ```

2. **Nezablokovávejte vlákna agentů**
   ```python
   # ❌ ŠPATNÉ: synchronní čekání
   while not task_complete:
       time.sleep(1)
   
   # ✅ DOBRÉ: Použijte zpětná volání fronty zpráv
   ```

3. **Neignorujte částečná selhání**
   ```python
   # ❌ ŠPATNĚ: Pokud jeden agent selže, selže celý pracovní postup
   # ✅ DOBŘE: Vrátit částečné výsledky s indikátory chyb
   ```

4. **Nepoužívejte nekonečné opakování pokusů**
   ```python
   # ❌ ŠPATNĚ: opakovat donekonečna
   # ✅ DOBŘE: max_retries = 3, poté do fronty odmítnutých zpráv
   ```

---

## Průvodce řešením problémů

### Problém: Zprávy uvízlé ve frontě

**Příznaky:**
- Zprávy se hromadí ve frontě
- Agenti nezpracovávají zprávy
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

2. **Zkontrolujte Dead Letter frontu:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problém: Vypršení časového limitu úkolu / úkol se nikdy nedokončí

**Příznaky:**
- Stav úkolu zůstává "in_progress"
- Někteří agenti dokončí, jiní ne
- Žádné chybové zprávy

**Diagnóza:**
```bash
# Zkontrolujte stav úlohy
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Zkontrolujte Application Insights
# Spusťte dotaz: traces | where customDimensions.task_id == "..."
```

**Řešení:**

1. **Implementujte časový limit v agregátoru (Cvičení 1)**

2. **Zkontrolujte selhání agentů pomocí Azure Monitoru:**
   ```bash
   # Zobrazit protokoly pomocí azd monitor
   azd monitor --logs
   
   # Nebo použijte Azure CLI ke kontrole protokolů konkrétní kontejnerové aplikace
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Ověřte, že všechny agenty běží:**
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
- [Příklad mikroslužeb](../../../../examples/microservices) - Vzory komunikace mezi službami
- [Příklad Microsoft Foundry Models](../../../../examples/azure-openai-chat) - Integrace AI

---

## Shrnutí

**Naučili jste se:**
- ✅ Pět vzorů koordinace (sekvenční, paralelní, hierarchický, událostmi řízený, konsenzus)
- ✅ Více agentová architektura na Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Správa stavů napříč distribuovanými agenty
- ✅ Řešení časových limitů, opakování pokusů a circuit breakerů
- ✅ Monitorování a ladění distribuovaných systémů
- ✅ Strategie optimalizace nákladů

**Klíčové poznatky:**
1. **Zvolte správný vzor** - Sekvenční pro uspořádané pracovní postupy, paralelní pro rychlost, událostmi řízený pro flexibilitu
2. **Pečlivě spravujte stav** - Použijte Cosmos DB nebo podobné pro sdílený stav
3. **Řešte selhání elegantně** - Časové limity, opakování pokusů, circuit-breakery, dead-letter fronty
4. **Monitorujte vše** - Distribuované trasování je zásadní pro ladění
5. **Optimalizujte náklady** - Škálování na nulu, využití serverless, implementace cache

**Další kroky:**
1. Dokončete praktická cvičení
2. Postavte multiagentní systém pro váš případ použití
3. Prostudujte [Výběr SKU](sku-selection.md) , abyste optimalizovali výkon a náklady

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, vezměte prosím na vědomí, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro zásadní informace se doporučuje profesionální lidský překlad. Za žádná nedorozumění nebo chybné interpretace vyplývající z použití tohoto překladu neodpovídáme.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->