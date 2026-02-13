# Vzorce koordinacije več agentov

⏱️ **Ocenjen čas**: 60-75 minutes | 💰 **Ocenjeni stroški**: ~$100-300/month | ⭐ **Kompleksnost**: Napredno

**📚 Pot učenja:**
- ← Prejšnje: [Načrtovanje zmogljivosti](capacity-planning.md) - Velikost virov in strategije skaliranja
- 🎯 **Tukaj ste**: Vzorce koordinacije več agentov (orkestracija, komunikacija, upravljanje stanja)
- → Naprej: [Izbira SKU](sku-selection.md) - Izbira pravih Azure storitev
- 🏠 [Domača stran tečaja](../../README.md)

---

## Kaj se boste naučili

Z opravljenjem te lekcije boste:
- Razumeli **vzorce arhitekture več agentov** in kdaj jih uporabiti
- Implementirali **vzorce orkestracije** (centralizirano, decentralizirano, hierarhično)
- Načrtovali strategije **komunikacije med agenti** (sinhrono, asinhrono, poganjano z dogodki)
- Upravljali **deljeno stanje** med distribuiranimi agenti
- Namestili **večagentne sisteme** na Azure z AZD
- Uporabili **vzorce koordinacije** za realne AI scenarije
- Nadzorovali in odpravljali napake v distribuiranih sistemih agentov

## Zakaj je koordinacija več agentov pomembna

### Evolucija: Od enega agenta do več agentov

**En agent (preprosto):**
```
User → Agent → Response
```
- ✅ Enostavno za razumevanje in implementacijo
- ✅ Hiter za preproste naloge
- ❌ Omejeno s sposobnostmi enega modela
- ❌ Ne more paralelizirati kompleksnih nalog
- ❌ Brez specializacije

**Sistem z več agenti (napredno):**
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
- ✅ Specializirani agenti za konkretne naloge
- ✅ Paralelna izvedba za hitrost
- ✅ Modularno in enostavno za vzdrževanje
- ✅ Boljše pri kompleksnih delovnih tokovih
- ⚠️ Zahteva logiko koordinacije

**Analogija**: En agent je kot ena oseba, ki opravlja vse naloge. Sistem z več agenti je kot ekipa, kjer ima vsak član specializirane spretnosti (raziskovalec, programer, recenzent, pisec), ki sodelujejo.

---

## Osnovni vzorci koordinacije

### Vzorec 1: Zaporedna koordinacija (Veriga odgovornosti)

**Kdaj uporabiti**: Naloge se morajo dokončati v določenem vrstnem redu, vsak agent gradi na izhodu prejšnjega.

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as Raziskovalni agent
    participant Agent2 as Pisateljski agent
    participant Agent3 as Uredniški agent
    
    User->>Orchestrator: "Napiši članek o umetni inteligenci"
    Orchestrator->>Agent1: Raziskuj temo
    Agent1-->>Orchestrator: Rezultati raziskave
    Orchestrator->>Agent2: Napiši osnutek (na podlagi raziskave)
    Agent2-->>Orchestrator: Osnutek članka
    Orchestrator->>Agent3: Uredi in izboljšaj
    Agent3-->>Orchestrator: Končni članek
    Orchestrator-->>User: Dovršen članek
    
    Note over User,Agent3: Zaporedno: vsak korak počaka na prejšnjega
```
**Prednosti:**
- ✅ Jasen potek podatkov
- ✅ Enostavno za razhroščevanje
- ✅ Predvidljiv vrstni red izvrševanja

**Omejitve:**
- ❌ Počasneje (brez paralelizacije)
- ❌ En neuspeh blokira celotno verigo
- ❌ Ne more obvladovati medsebojno odvisnih nalog

**Primeri uporabe:**
- Postopek ustvarjanja vsebine (raziskava → pisanje → urejanje → objava)
- Generiranje kode (načrt → implementacija → testiranje → nameščanje)
- Generiranje poročil (zbiranje podatkov → analiza → vizualizacija → povzetek)

---

### Vzorec 2: Paralelna koordinacija (Fan-Out/Fan-In)

**Kdaj uporabiti**: Neodvisne naloge se lahko izvajajo hkrati, rezultati se združijo na koncu.

```mermaid
graph TB
    User[Uporabniška zahteva]
    Orchestrator[Orkestrator]
    Agent1[Agent za analizo]
    Agent2[Agent za raziskave]
    Agent3[Agent za podatke]
    Aggregator[Agregator rezultatov]
    Response[Združeni odgovor]
    
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
**Prednosti:**
- ✅ Hiter (paralelna izvedba)
- ✅ Odporen na napake (delni rezultati sprejemljivi)
- ✅ Lahko horizontalno skalira

**Omejitve:**
- ⚠️ Rezultati lahko prispejo izven vrstnega reda
- ⚠️ Potrebna logika združevanja
- ⚠️ Kompleksno upravljanje stanja

**Primeri uporabe:**
- Zbiranje podatkov iz več virov (API-ji + baze podatkov + spletno strganje)
- Konkurenčna analiza (več modelov generira rešitve, izbere se najboljša)
- Storitve prevajanja (prevedi v več jezikov hkrati)

---

### Vzorec 3: Hierarhična koordinacija (Manager-Worker)

**Kdaj uporabiti**: Kompleksni delovni tokovi s pod-nalogami, potrebna delegacija.

```mermaid
graph TB
    Master[Glavni orkestrator]
    Manager1[Vodja raziskav]
    Manager2[Upravitelj vsebin]
    W1[Spletni zbiralec podatkov]
    W2[Analizator člankov]
    W3[Avtor]
    W4[Urednik]
    
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
**Prednosti:**
- ✅ Obvladuje kompleksne delovne tokove
- ✅ Modularno in enostavno za vzdrževanje
- ✅ Jasne meje odgovornosti

**Omejitve:**
- ⚠️ Bolj kompleksna arhitektura
- ⚠️ Višje zakasnitve (več plasti koordinacije)
- ⚠️ Zahteva napredno orkestracijo

**Primeri uporabe:**
- Obdelava dokumentov v podjetju (razvrsti → usmeri → obdela → arhivira)
- Večstopenjski podatkovni potoki (pridelek → čiščenje → transformacija → analiza → poročanje)
- Kompleksni avtomatizirani poteki (načrtovanje → dodelitev virov → izvedba → nadzor)

---

### Vzorec 4: Dogodkovno usmerjena koordinacija (Publish-Subscribe)

**Kdaj uporabiti**: Agenti se morajo odzivati na dogodke, želena ohlapna povezanost.

```mermaid
sequenceDiagram
    participant Agent1 as Zbiralec podatkov
    participant EventBus as Azure Service Bus
    participant Agent2 as Analizator
    participant Agent3 as Obvestnik
    participant Agent4 as Arhivar
    
    Agent1->>EventBus: Objavi "PrejetiPodatki" dogodek
    EventBus->>Agent2: Naroči se: Analiziraj podatke
    EventBus->>Agent3: Naroči se: Pošlji obvestilo
    EventBus->>Agent4: Naroči se: Arhiviraj podatke
    
    Note over Agent1,Agent4: Vsi naročniki obdelujejo neodvisno
    
    Agent2->>EventBus: Objavi "AnalizaZaključena" dogodek
    EventBus->>Agent3: Naroči se: Pošlji poročilo analize
```
**Prednosti:**
- ✅ Ohlapna povezanost med agenti
- ✅ Enostavno dodajanje novih agentov (samo se naročijo)
- ✅ Asinhrono procesiranje
- ✅ Odpornost (vztrajanje sporočil)

**Omejitve:**
- ⚠️ Končna konsistentnost
- ⚠️ Zahtevno razhroščevanje
- ⚠️ Izzivi pri urejanju zaporedja sporočil

**Primeri uporabe:**
- Sistemi za nadzor v realnem času (alarme, nadzorne plošče, dnevniki)
- Obvestilni sistemi na več kanalih (email, SMS, push, Slack)
- Podatkovni potoki (več porabnikov istih podatkov)

---

### Vzorec 5: Koordinacija na podlagi konsenza (glasovanje/kvorum)

**Kdaj uporabiti**: Potrebno soglasje več agentov pred nadaljevanjem.

```mermaid
graph TB
    Input[Vhodna naloga]
    Agent1[Agent 1: GPT-4]
    Agent2[Agent 2: Claude]
    Agent3[Agent 3: Gemini]
    Voter[Glasovalec konsenza]
    Output[Dogovorjeni izhod]
    
    Input --> Agent1
    Input --> Agent2
    Input --> Agent3
    Agent1 --> Voter
    Agent2 --> Voter
    Agent3 --> Voter
    Voter --> Output
    
    style Voter fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
```
**Prednosti:**
- ✅ Večja natančnost (več mnenj)
- ✅ Odporen na napake (manjše število neuspehov sprejemljivo)
- ✅ Vgrajena kontrola kakovosti

**Omejitve:**
- ❌ Drago (več klicev modelov)
- ❌ Počasneje (čakanje na vse agente)
- ⚠️ Potrebno reševanje konfliktov

**Primeri uporabe:**
- Moderacija vsebin (več modelov pregleda vsebino)
- Pregled kode (več linterjev/analyzatorjev)
- Medicinska diagnostika (več AI modelov, strokovna validacija)

---

## Pregled arhitekture

### Celovit večagentni sistem na Azure

```mermaid
graph TB
    User[Uporabnik/API odjemalec]
    APIM[Azure upravljanje API-jev]
    Orchestrator[Storitev orkestratorja<br/>Aplikacija Container]
    ServiceBus[Azure Service Bus<br/>Dogodkovni hub]
    
    Agent1[Raziskovalni agent<br/>Aplikacija Container]
    Agent2[Pisateljski agent<br/>Aplikacija Container]
    Agent3[Analitski agent<br/>Aplikacija Container]
    Agent4[Pregledovalni agent<br/>Aplikacija Container]
    
    CosmosDB[(Cosmos DB<br/>Deljeno stanje)]
    Storage[Azure Storage<br/>Artefakti]
    AppInsights[Application Insights<br/>Spremljanje]
    
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
**Ključne komponente:**

| Komponenta | Namen | Azure storitev |
|-----------|---------|---------------|
| **API Gateway** | Vstopna točka, omejevanje hitrosti, avtentikacija | API Management |
| **Orkestrator** | Koordinira poteke dela agentov | Container Apps |
| **Message Queue** | Asinhrona komunikacija | Service Bus / Event Hubs |
| **Agents** | Specializirani AI agenti | Container Apps / Functions |
| **State Store** | Deljeno stanje, sledenje nalog | Cosmos DB |
| **Artifact Storage** | Dokumenti, rezultati, dnevniki | Blob Storage |
| **Monitoring** | Distribuirano sledenje, dnevniki | Application Insights |

---

## Predpogoji

### Potrebna orodja

```bash
# Preverite Azure Developer CLI
azd version
# ✅ Pričakovano: azd različica 1.0.0 ali novejša

# Preverite Azure CLI
az --version
# ✅ Pričakovano: azure-cli 2.50.0 ali novejša

# Preverite Docker (za lokalno testiranje)
docker --version
# ✅ Pričakovano: različica Dockera 20.10 ali novejša
```

### Zahteve za Azure

- Aktivna naročnina Azure
- Dovoljenja za ustvarjanje:
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB accounts
  - Storage accounts
  - Application Insights

### Potrebno predznanje

Morali bi imeti opravljeno:
- [Upravljanje konfiguracij](../chapter-03-configuration/configuration.md)
- [Avtentikacija & Varnost](../chapter-03-configuration/authsecurity.md)
- [Primer mikrostoritev](../../../../examples/microservices)

---

## Vodnik za implementacijo

### Struktura projekta

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

## Lekcija 1: Vzorec zaporedne koordinacije

### Implementacija: Postopek ustvarjanja vsebine

Zgradimo zaporedni potek: Raziskava → Pisanje → Urejanje → Objavljanje

### 1. Konfiguracija AZD

**Datoteka: `azure.yaml`**

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

### 2. Infrastruktura: Service Bus za koordinacijo

**Datoteka: `infra/core/servicebus.bicep`**

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

### 3. Shared State Manager

**Datoteka: `src/shared/state_manager.py`**

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

### 4. Orchestrator Service

**Datoteka: `src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# Povezava do Service Bus
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
    
    # Ustvari nalogo v shrambi stanja
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # Pošlji sporočilo raziskovalnemu agentu (prvi korak)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # Kam poslati rezultate
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

### 5. Research Agent

**Datoteka: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# Inicializirajte odjemalce
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
    
    # Pokličite Azure OpenAI za raziskave
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # Posodobite stanje
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # Pošljite naslednjemu agentu (piscu)
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

### 6. Writer Agent

**Datoteka: `src/agents/writer/app.py`**

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
    
    # Pokliči Azure OpenAI, naj napiše članek
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # Posodobi stanje
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # Pošlji uredniku
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

### 7. Editor Agent

**Datoteka: `src/agents/editor/app.py`**

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
    
    # Pokliči Azure OpenAI za urejanje
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # Označi nalogo kot dokončano
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

### 8. Deploy and Test

```bash
# Inicializiraj in razporedi
azd init
azd up

# Pridobi URL orkestratorja
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Ustvari vsebino
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ Pričakovani izhod:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**Preverite napredek naloge:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Pričakovani izhod (dokončano):**
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

## Lekcija 2: Vzorec paralelne koordinacije

### Implementacija: Zbiralnik raziskav iz več virov

Zgradimo paralelni sistem, ki hkrati zbira informacije iz več virov.

### Paralelni orkestrator

**Datoteka: `src/orchestrator/parallel_workflow.py`**

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
    
    # Razpošiljanje: Pošlji vsem agentom istočasno
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

### Logika združevanja

**Datoteka: `src/agents/aggregator/app.py`**

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

# Spremljaj rezultate po nalogi
task_results = defaultdict(list)
expected_agents = 4  # splet, akademsko, novice, družbeno

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # Shrani rezultat
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # Preveri, ali so vsi agenti končali (fan-in)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # Združi rezultate
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # Označi kot dokončano
        state_manager.complete_task(task_id, aggregated)
        
        # Očisti
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

**Prednosti paralelnega vzorca:**
- ⚡ **4x hitreje** (agenti delujejo hkrati)
- 🔄 **Odporen na napake** (delni rezultati sprejemljivi)
- 📈 **Razširljiv** (enostavno dodajte več agentov)

---

## Praktične vaje

### Vaja 1: Dodajanje obravnave časovne omejitve ⭐⭐ (Srednje)

**Cilj**: Implementirati logiko časovne omejitve, da zbiralnik ne čaka večno na počasne agente.

**Koraki**:

1. **Dodajte sledenje časovne omejitve v zbiralnik:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> expiration_time

def process_result(message_data):
    task_id = message_data['task_id']
    
    # Nastavi časovno omejitev za prvi rezultat
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # Preveri, ali je dokončano ALI je potekel čas
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
        
        # Čiščenje
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **Preizkusite z umetnimi zakasnitvami:**

```python
# V enem agentu dodajte zamik za simulacijo počasnega obdelovanja
import time
time.sleep(35)  # Presega 30-sekundno časovno omejitev
```

3. **Namestite in preverite:**

```bash
azd deploy aggregator

# Oddaj nalogo
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Preveri rezultate po 30 sekundah
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Merila uspeha:**
- ✅ Naloga se zaključi po 30 sekundah, tudi če agenti niso dokončani
- ✅ Odziv kaže delne rezultate (`"timed_out": true`)
- ✅ Na voljo so vrnjeni rezultati (3 od 4 agentov)

**Čas**: 20-25 minut

---

### Vaja 2: Implementacija logike ponovnih poskusov ⭐⭐⭐ (Napredno)

**Cilj**: Samodejno ponavljanje neuspešnih opravil agentov pred opustitvijo.

**Koraki**:

1. **Dodajte sledenje ponovnim poskusom v orkestrator:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # id_sporočila -> število_poskusov

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

2. **Dodajte upravljalnik ponovnih poskusov agentom:**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # Obdelaj sporočilo
        process_func(message_data)
        
        # Uspeh - končano
        receiver.complete_message(message)
        
    except Exception as e:
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # Ponovni poskus: opusti in ponovno uvrsti v vrsto s povečanjem števila poskusov
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # Pošlji nazaj v isto vrsto z zamikom
            time.sleep(5 * (retry_count + 1))  # Eksponentno povečanje intervala
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # Odstrani izvirnik
        else:
            # Maksimalno število ponovitev preseženo - premakni v vrsto mrtvih sporočil
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **Nadzirajte dead letter queue:**

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

**✅ Merila uspeha:**
- ✅ Neuspešna opravila se samodejno ponovijo (do 3-krat)
- ✅ Eksponentno povečevanje zamika med ponovitvami (5s, 10s, 15s)
- ✅ Po dosegu največ ponovitev sporočila gredo v dead letter queue
- ✅ Dead letter queue je mogoče nadzorovati in ponovno predvajati

**Čas**: 30-40 minut

---

### Vaja 3: Implementacija circuit breakerja ⭐⭐⭐ (Napredno)

**Cilj**: Preprečiti kaskadne napake z ustavitvijo zahtev do neuspešnih agentov.

**Koraki**:

1. **Ustvarite razred circuit breaker:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # Normalno delovanje
    OPEN = "open"          # V okvari, zavračaj zahteve
    HALF_OPEN = "half_open"  # Preverjanje, ali se je obnovil

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
            # Preveri, ali je časovna omejitev potekla
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # Uspeh
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

2. **Uporabite pri klicih agentov:**

```python
# V orkestratorju
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
        # Nadaljuj z drugimi agenti
```

3. **Preizkusite circuit breaker:**

```bash
# Simuliraj ponavljajoče se napake (ustavi enega agenta)
az containerapp stop --name web-research-agent --resource-group rg-agents

# Pošlji več zahtev
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# Preveri dnevnike - po 5 neuspehih bi moralo biti vezje odprto
# Uporabi Azure CLI za dnevnike Container App:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ Merila uspeha:**
- ✅ Po 5 neuspehih se vezje odpre (zavrača zahtevke)
- ✅ Po 60 sekundah vezje postane delno odprto (preizkuša obnovo)
- ✅ Ostali agenti nadaljujejo normalno delovanje
- ✅ Vezje se samodejno zapre, ko se agent obnovi

**Čas**: 40-50 minut

---

## Nadzor in razhroščevanje

### Distribuirano sledenje z Application Insights

**Datoteka: `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# Konfiguriraj sledenje
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# Ustvari sledilnik
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# Konfiguriraj beleženje
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

### Poizvedbe v Application Insights

**Sledi delovnim tokom več agentov:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**Primerjava zmogljivosti agentov:**

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

**Analiza napak:**

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

## Analiza stroškov

### Stroški večagentnega sistema (mesečne ocene)

| Komponenta | Konfiguracija | Strošek |
|-----------|--------------|------|
| **Orkestrator** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 agenti** | 4 Container Apps (0.5 vCPU, 1GB each) | $60-120 |
| **Service Bus** | Standard tier, 10M messages | $10-20 |
| **Cosmos DB** | Serverless, 5GB storage, 1M RUs | $25-50 |
| **Blob Storage** | 10GB storage, 100K operations | $5-10 |
| **Application Insights** | 5GB ingestion | $10-15 |
| **Azure OpenAI** | GPT-4, 10M tokens | $100-300 |
| **Skupaj** | | **$240-565/month** |

### Strategije optimizacije stroškov

1. **Uporabljajte serverless, kjer je mogoče:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Skalirajte agente na nič, ko so neaktivni:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Uporabljajte združevanje (batching) za Service Bus:**
   ```python
   # Pošiljajte sporočila v paketih (ceneje)
   sender.send_messages([message1, message2, message3])
   ```

4. **Predpomnite pogosto uporabljene rezultate:**
   ```python
   # Uporabite Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Najboljše prakse

### ✅ NAREDITE:

1. **Uporabljajte idempotentne operacije**
   ```python
   # Agent lahko varno obdela isto sporočilo večkrat
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # Obdelaj nalogo...
   ```

2. **Implementirajte obsežno beleženje**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Uporabljajte korelacijske ID-je**
   ```python
   # Posreduj task_id skozi celoten potek dela
   message_data = {
       'task_id': task_id,  # ID korelacije
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Nastavite TTL sporočil (time-to-live)**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Nadzirajte dead letter queues**
   ```python
   # Redno spremljanje neuspelih sporočil
   monitor_dead_letters()
   ```

### ❌ NE DELAJTE:

1. **Ne ustvarjajte krožnih odvisnosti**
   ```python
   # ❌ SLABO: Agent A → Agent B → Agent A (neskončna zanka)
   # ✅ DOBRO: Določite jasen usmerjen acikličen graf (DAG)
   ```

2. **Ne blokirajte niti agentov**
   ```python
   # ❌ SLABO: Sinhrono čakanje
   while not task_complete:
       time.sleep(1)
   
   # ✅ DOBRO: Uporabite povratne klice čakalne vrste sporočil
   ```

3. **Ne ignorirajte delnih napak**
   ```python
   # ❌ SLABO: Če en agent odpove, naj se celoten potek zaključi z napako
   # ✅ DOBRO: Vrnite delne rezultate z indikatorji napak
   ```

4. **Ne uporabljajte neskončnih ponovnih poskusov**
   ```python
   # ❌ SLABO: poskusi znova v nedogled
   # ✅ DOBRO: max_retries = 3, nato v vrsto mrtvih sporočil
   ```

---
## Vodnik za odpravljanje težav

### Težava: Sporočila so zataknjena v čakalni vrsti

**Simptomi:**
- Sporočila se kopičijo v čakalni vrsti
- Agenti ne obdelujejo
- Stanje naloge obtiči na "pending"

**Diagnoza:**
```bash
# Preverite globino čakalne vrste
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Preverite dnevnike agenta z uporabo Azure CLI
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**Rešitve:**

1. **Povečajte število replik agentov:**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Preverite dead letter queue:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Težava: Časovna omejitev naloge/nikoli ne zaključi

**Simptomi:**
- Stanje naloge ostane "in_progress"
- Nekateri agenti končajo, drugi ne
- Ni sporočil o napaki

**Diagnoza:**
```bash
# Preveri stanje naloge
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Preveri Application Insights
# Zaženi poizvedbo: traces | where customDimensions.task_id == "..."
```

**Rešitve:**

1. **Implementirajte časovno omejitev v agregatorju (vaja 1)**

2. **Preverite napake agentov z uporabo Azure Monitorja:**
   ```bash
   # Ogled dnevnikov prek azd monitorja
   azd monitor --logs
   
   # Ali pa uporabite Azure CLI za preverjanje dnevnikov določene aplikacije Container App
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Preverite, da so vsi agenti zagnani:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## Izvedite več

### Uradna dokumentacija
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### Naslednji koraki v tem tečaju
- ← Prejšnje: [Načrtovanje zmogljivosti](capacity-planning.md)
- → Naslednje: [Izbira SKU](sku-selection.md)
- 🏠 [Domača stran tečaja](../../README.md)

### Sorodni primeri
- [Primer mikroservisov](../../../../examples/microservices) - Vzorci komunikacije med storitvami
- [Primer Azure OpenAI](../../../../examples/azure-openai-chat) - Integracija AI

---

## Povzetek

**Naučili ste se:**
- ✅ Pet vzorcev usklajevanja (zaporedni, vzporedni, hierarhični, dogodkovno vodeni, konsenzni)
- ✅ Večagentna arhitektura na Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Upravljanje stanja med porazdeljenimi agenti
- ✅ Ravnanje s časovnimi omejitvami, ponovitvami in varovalkami (circuit breakers)
- ✅ Nadzor in odpravljanje napak v porazdeljenih sistemih
- ✅ Strategije optimizacije stroškov

**Ključne ugotovitve:**
1. **Izberite pravi vzorec** - Zaporedni za urejene poteke dela, vzporedni za hitrost, dogodkovno voden za prilagodljivost
2. **Skrbno upravljajte stanje** - Uporabite Cosmos DB ali podobno za skupno stanje
3. **Upravljajte napake na eleganten način** - Časovne omejitve, ponovitve, varovalke (circuit breakers), dead letter queues
4. **Nadzirajte vse** - Porazdeljeno sledenje je bistveno za odpravljanje napak
5. **Optimizirajte stroške** - Prilagodite na nič, uporabite serverless, implementirajte predpomnjenje

**Naslednji koraki:**
1. Dokončajte praktične vaje
2. Zgradite večagentni sistem za vaš primer uporabe
3. Preučite [Izbiro SKU](sku-selection.md) za optimizacijo zmogljivosti in stroškov

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo profesionalni prevod, opravljen s strani človeškega prevajalca. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->