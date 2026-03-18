# Obrasci koordinacije više agenata

⏱️ **Procijenjeno vrijeme**: 60-75 minuta | 💰 **Procijenjeni trošak**: ~$100-300/mjesec | ⭐ **Složenost**: Napredno

**📚 Put učenja:**
- ← Prethodno: [Planiranje kapaciteta](capacity-planning.md) - Strategije dimenzioniranja i skaliranja resursa
- 🎯 **Nalazite se ovdje**: Obrasci koordinacije više agenata (orkestracija, komunikacija, upravljanje stanjem)
- → Sljedeće: [Izbor SKU-a](sku-selection.md) - Odabir pravih Azure usluga
- 🏠 [Početna stranica tečaja](../../README.md)

---

## Što ćete naučiti

Kroz ovaj lekciju ćete:
- Razumjeti obrasce **arhitekture više agenata** i kada ih koristiti
- Implementirati **orkestracijske obrasce** (centralizirane, decentralizirane, hijerarhijske)
- Dizajnirati strategije **komunikacije agenata** (sinkrono, asinkrono, na događaje)
- Upravljati **zajedničkim stanjem** među distribuiranim agentima
- Implementirati **sustave više agenata** na Azure s AZD-om
- Primijeniti **koordinacijske obrasce** u stvarnim AI scenarijima
- Nadzirati i otklanjati pogreške u distribuiranim sustavima agenata

## Zašto je koordinacija više agenata važna

### Evolucija: od jednog agenta do više agenata

**Jedan agent (jednostavno):**
```
User → Agent → Response
```
- ✅ Jednostavno za razumjeti i implementirati
- ✅ Brzo za jednostavne zadatke
- ❌ Ograničeno mogućnostima jednog modela
- ❌ Ne može paralelizirati složene zadatke
- ❌ Nema specijalizacije

**Sustav više agenata (napredno):**
```mermaid
graph TD
    Orchestrator[Orkestrator] --> Agent1[Agent1<br/>Plan]
    Orchestrator --> Agent2[Agent2<br/>Kod]
    Orchestrator --> Agent3[Agent3<br/>Pregled]
```- ✅ Specijalizirani agenti za određene zadatke
- ✅ Paralelno izvršavanje radi brzine
- ✅ Modularno i održivo
- ✅ Bolje za složene radne tokove
- ⚠️ Zahtijeva logiku koordinacije

**Analogija**: Jedan agent je kao jedna osoba koja radi sve zadatke. Više agenata je kao tim gdje svaki član ima specijalizirane vještine (istraživač, programer, recenzent, pisac) koji rade zajedno.

---

## Temeljni obrasci koordinacije

### Obrazac 1: Sekvencijalna koordinacija (lanac odgovornosti)

**Kada koristiti**: Zadatci se moraju izvršavati točno redoslijedom, svaki agent se nadograđuje na prethodni ishod.

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as Agent za istraživanje
    participant Agent2 as Agent za pisanje
    participant Agent3 as Agent za uređivanje
    
    User->>Orchestrator: "Napiši članak o AI"
    Orchestrator->>Agent1: Istraži temu
    Agent1-->>Orchestrator: Rezultati istraživanja
    Orchestrator->>Agent2: Napiši nacrt (koristeći istraživanje)
    Agent2-->>Orchestrator: Nacrt članka
    Orchestrator->>Agent3: Uredi i poboljšaj
    Agent3-->>Orchestrator: Završni članak
    Orchestrator-->>User: Ispravljeni članak
    
    Note over User,Agent3: Sekvencijalno: Svaki korak čeka prethodni
```
**Prednosti:**
- ✅ Jasan tok podataka
- ✅ Jednostavno za otklanjanje pogrešaka
- ✅ Predvidljiv redoslijed izvršavanja

**Ograničenja:**
- ❌ Sporije (nema paralelizma)
- ❌ Jedna greška blokira cijeli lanac
- ❌ Ne može rukovati međuzavisnim zadacima

**Primjeri upotrebe:**
- Proces stvaranja sadržaja (istraživanje → pisanje → uređivanje → objava)
- Generiranje koda (planiranje → implementacija → testiranje → implementacija)
- Izrada izvještaja (prikupljanje podataka → analiza → vizualizacija → sažetak)

---

### Obrazac 2: Paralelna koordinacija (fan-out/fan-in)

**Kada koristiti**: Nezavisni zadaci koji se mogu izvoditi istovremeno, rezultati se kombiniraju na kraju.

```mermaid
graph TB
    User[Zahtjev korisnika]
    Orchestrator[Orkestrator]
    Agent1[Analitički agent]
    Agent2[Istraživački agent]
    Agent3[Agent za podatke]
    Aggregator[Agregator rezultata]
    Response[Zajednički odgovor]
    
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
- ✅ Brzo (paralelno izvođenje)
- ✅ Otpornost na greške (djelomični rezultati prihvatljivi)
- ✅ Horizontalna skalabilnost

**Ograničenja:**
- ⚠️ Rezultati mogu stizati izvan reda
- ⚠️ Potrebna logika agregacije
- ⚠️ Kompleksno upravljanje stanjem

**Primjeri upotrebe:**
- Prikupljanje podataka iz više izvora (API-ji + baze podataka + web scraping)
- Konkurentska analiza (više modela generira rješenja, odabire se najbolje)
- Prevodičke usluge (istovremeni prijevod na više jezika)

---

### Obrazac 3: Hijerarhijska koordinacija (menadžer-radnik)

**Kada koristiti**: Složeni radni tijekovi sa podzadatcima i potrebom za delegiranjem.

```mermaid
graph TB
    Master[Glavni Orkestrator]
    Manager1[Upravitelj Istraživanja]
    Manager2[Upravitelj Sadržaja]
    W1[Web Skidač]
    W2[Analizator Radova]
    W3[Pisac]
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
- ✅ Rukuje složenim radnim tijekovima
- ✅ Modularno i održivo
- ✅ Jasne granice odgovornosti

**Ograničenja:**
- ⚠️ Složenija arhitektura
- ⚠️ Veća latencija (više slojeva koordinacije)
- ⚠️ Zahtijeva sofisticiranu orkestraciju

**Primjeri upotrebe:**
- Obrada dokumenata u tvrtki (klasificirati → usmjeriti → obraditi → arhivirati)
- Višestupanjski podatkovni tokovi (unos → čišćenje → transformacija → analiza → izvještavanje)
- Složeni automatizirani radni tijekovi (planiranje → raspodjela resursa → izvršenje → nadzor)

---

### Obrazac 4: Koordinacija potaknuta događajima (publish-subscribe)

**Kada koristiti**: Agentima je potrebno reagirati na događaje, želi se labava povezanost.

```mermaid
sequenceDiagram
    participant Agent1 as Prikupljač podataka
    participant EventBus as Azure Service Bus
    participant Agent2 as Analizator
    participant Agent3 as Obavijestitelj
    participant Agent4 as Arhivar
    
    Agent1->>EventBus: Objavi događaj "DataReceived"
    EventBus->>Agent2: Pretplati se: Analiziraj podatke
    EventBus->>Agent3: Pretplati se: Pošalji obavijest
    EventBus->>Agent4: Pretplati se: Arhiviraj podatke
    
    Note over Agent1,Agent4: Svi pretplatnici obrađuju neovisno
    
    Agent2->>EventBus: Objavi događaj "AnalysisComplete"
    EventBus->>Agent3: Pretplati se: Pošalji izvještaj analize
```
**Prednosti:**
- ✅ Labava povezanost između agenata
- ✅ Jednostavno dodavanje novih agenata (prijavom)
- ✅ Asinkrono procesiranje
- ✅ Otpornost (perzistentnost poruka)

**Ograničenja:**
- ⚠️ Konačna dosljednost
- ⚠️ Kompleksno otklanjanje pogrešaka
- ⚠️ Izazovi s redoslijedom poruka

**Primjeri upotrebe:**
- Sustavi za nadzor u stvarnom vremenu (alarme, nadzorne ploče, zapisnici)
- Višekanalne obavijesti (e-mail, SMS, push, Slack)
- Podatkovni tokovi s više potrošača istih podataka

---

### Obrazac 5: Koordinacija zasnovana na konsenzusu (glasanje/kvorum)

**Kada koristiti**: Potreban je dogovor više agenata prije nastavka.

```mermaid
graph TB
    Input[Ulazni zadatak]
    Agent1[Agent 1: gpt-4.1]
    Agent2[Agent 2: Claude]
    Agent3[Agent 3: Gemini]
    Voter[Glasač za konsenzus]
    Output[Složeni izlaz]
    
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
- ✅ Veća točnost (više mišljenja)
- ✅ Otpornost na greške (manjinske greške prihvatljive)
- ✅ Ugrađena kontrola kvalitete

**Ograničenja:**
- ❌ Skupo (više poziva modela)
- ❌ Sporije (čekanje na sve agente)
- ⚠️ Potrebno rješavanje sukoba

**Primjeri upotrebe:**
- Moderacija sadržaja (više modela pregledava sadržaj)
- Recenzija koda (više analiza/lintera)
- Medicinska dijagnoza (više AI modela, potvrda stručnjaka)

---

## Pregled arhitekture

### Potpuni sustav više agenata na Azureu

```mermaid
graph TB
    User[Korisnik/API Klijent]
    APIM[Azure API Upravljanje]
    Orchestrator[Orkestrator Usluga<br/>Container App]
    ServiceBus[Azure Service Bus<br/>Event Hub]
    
    Agent1[Istraživački Agent<br/>Container App]
    Agent2[Pisac Agent<br/>Container App]
    Agent3[Analitičar Agent<br/>Container App]
    Agent4[Recenzent Agent<br/>Container App]
    
    CosmosDB[(Cosmos DB<br/>Zajedničko Stanje)]
    Storage[Azure Pohrana<br/>Artefakti]
    AppInsights[Application Insights<br/>Nadzor]
    
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

| Komponenta | Namjena | Azure usluga |
|-----------|---------|--------------|
| **API Gateway** | Ulazna točka, ograničenje brzine, autorizacija | API Management |
| **Orkestrator** | Koordinira radne tokove agenata | Container Apps |
| **Message Queue** | Asinkrona komunikacija | Service Bus / Event Hubs |
| **Agenti** | Specijalizirani AI radnici | Container Apps / Functions |
| **Spremište stanja** | Dijeljeno stanje, praćenje zadataka | Cosmos DB |
| **Spremište artefakata** | Dokumenti, rezultati, zapisnici | Blob Storage |
| **Nadzor** | Distribuirano praćenje, zapisnici | Application Insights |

---

## Preduvjeti

### Potrebni alati

```bash
# Provjerite Azure Developer CLI
azd version
# ✅ Očekivano: azd verzija 1.0.0 ili novija

# Provjerite Azure CLI
az --version
# ✅ Očekivano: azure-cli 2.50.0 ili novija

# Provjerite Docker (za lokalno testiranje)
docker --version
# ✅ Očekivano: Docker verzija 20.10 ili novija
```

### Zahtjevi za Azure

- Aktivna Azure pretplata
- Dozvole za kreiranje:
  - Container Apps
  - Service Bus imenskih prostora
  - Cosmos DB računa
  - Spremišnih računa
  - Application Insights

### Potrebno znanje

Trebali biste imati dovršeno:
- [Upravljanje konfiguracijom](../chapter-03-configuration/configuration.md)
- [Autentikaciju i sigurnost](../chapter-03-configuration/authsecurity.md)
- [Primjer mikroservisa](../../../../examples/microservices)

---

## Vodič za implementaciju

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

## Lekcija 1: Sekvencijalni obrazac koordinacije

### Implementacija: Proces stvaranja sadržaja

Izgradimo sekvencijalni tok: Istraživanje → Pisanje → Uređivanje → Objavljivanje

### 1. Konfiguracija AZD-a

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

### 2. Infrastruktura: Service Bus za koordinaciju

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

### 3. Upravitelj zajedničkog stanja

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

### 4. Orkestrator servis

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

# Veza s Service Busom
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
    
    # Stvori zadatak u spremištu stanja
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # Pošalji poruku istraživačkom agentu (prvi korak)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # Gdje poslati rezultate
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

### 5. Agent za istraživanje

**Datoteka: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# Inicijalizirajte klijente
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
    
    # Pozovite Microsoft Foundry modele za istraživanje
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # Ažurirajte stanje
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # Pošaljite sljedećem agentu (pisac)
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

### 6. Agent pisac

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
    
    # Pozovite Microsoft Foundry modele za pisanje članka
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # Ažuriraj stanje
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # Pošalji uredniku
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

### 7. Agent urednik

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
    
    # Pozovi Microsoft Foundry modele za uređivanje
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # Označi zadatak kao dovršen
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

### 8. Deploy i testiranje

```bash
# Opcija A: Implementacija temeljena na predlošku
azd init
azd up

# Opcija B: Implementacija manifesta agenta (zahtijeva proširenje)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> Pogledajte [AZD AI CLI naredbe](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za sve `azd ai` zastavice i opcije.

```bash
# Dohvati URL orkestratora
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Kreiraj sadržaj
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ Očekivani ispis:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**Provjera napretka zadatka:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Očekivani ispis (dovršeno):**
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

## Lekcija 2: Paralelni obrazac koordinacije

### Implementacija: Agregator istraživanja iz više izvora

Izgradimo paralelni sustav koji prikuplja informacije sa više izvora istovremeno.

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
    
    # Fan-out: Pošalji svima agentima istovremeno
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

### Logika agregacije

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

# Prati rezultate po zadatku
task_results = defaultdict(list)
expected_agents = 4  # web, akademski, vijesti, društveni

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # Spremi rezultat
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # Provjeri jesu li svi agenti dovršili (spajanje)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # Kombiniraj rezultate
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # Označi kao dovršeno
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

**Prednosti paralelnog obrasca:**
- ⚡ **4x brže** (agenti rade istovremeno)
- 🔄 **Otpornost na greške** (djelomični rezultati prihvatljivi)
- 📈 **Skalabilnost** (lako dodavanje agenata)

---

## Praktične vježbe

### Vježba 1: Dodajte rukovanje timeoutom ⭐⭐ (Srednje)

**Cilj**: Implementirati logiku timeouta kako agregator ne bi čekao beskonačno na spore agente.

**Koraci**:

1. **Dodajte praćenje timeouta agregatoru:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> vrijeme_isteka

def process_result(message_data):
    task_id = message_data['task_id']
    
    # Postavi vremensko ograničenje na prvi rezultat
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # Provjeri je li dovršeno ILI je vrijeme isteklo
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
        
        # Čišćenje
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **Testiranje sa umjetnim zakašnjenjima:**

```python
# U jednom agentu dodajte kašnjenje za simulaciju sporog procesiranja
import time
time.sleep(35)  # Prekoračen vremenski limit od 30 sekundi
```

3. **Deploy i provjera:**

```bash
azd deploy aggregator

# Pošalji zadatak
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Provjeri rezultate nakon 30 sekundi
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Kriteriji uspjeha:**
- ✅ Zadatak se završava nakon 30 sekundi čak i ako neki agenti nisu završili
- ✅ Odgovor označava djelomične rezultate (`"timed_out": true`)
- ✅ Vraćaju se dostupni rezultati (3 od 4 agenta)

**Vrijeme**: 20-25 minuta

---

### Vježba 2: Implementirajte logiku ponovnog pokušaja ⭐⭐⭐ (Napredno)

**Cilj**: Automatski ponovo pokušati neuspjele zadatke agenata prije odustajanja.

**Koraci**:

1. **Dodajte praćenje ponovnih pokušaja u orkestrator:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # message_id -> broj_pokušaja

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

2. **Dodajte rukovatelja ponavljanja agentima:**

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
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # Retry: abandon and re-queue with incremented count
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # Send back to same queue with delay
            time.sleep(5 * (retry_count + 1))  # Exponential backoff
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # Remove original
        else:
            # Max retries exceeded - move to dead letter queue
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

**✅ Kriteriji uspjeha:**
- ✅ Neuspjeli zadaci se automatski ponovo pokušavaju (do 3 puta)
- ✅ Eksponencijalni backoff između pokušaja (5s, 10s, 15s)
- ✅ Nakon maksimalnog broja pokušaja, poruke idu u dead letter queue
- ✅ Dead letter queue može se nadzirati i ponovno reproducirati

**Vrijeme**: 30-40 minuta

---

### Vježba 3: Implementirajte prekidač kola (Circuit Breaker) ⭐⭐⭐ (Napredno)

**Cilj**: Spriječiti kaskadne greške zaustavljanjem zahtjeva prema neispravnim agentima.

**Koraci**:

1. **Kreirajte klasu prekidača kola:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # Normalan rad
    OPEN = "open"          # Neuspjeh, odbaci zahtjeve
    HALF_OPEN = "half_open"  # Testiranje je li oporavljen

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
            # Provjeri je li vrijeme isteklo
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # Uspjeh
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

2. **Primijenite na pozive agenta:**

```python
# U orkestratoru
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
        # Nastavi s drugim agentima
```

3. **Testirajte prekidač kola:**

```bash
# Simulirajte ponovljene kvarove (zaustavite jednog agenta)
az containerapp stop --name web-research-agent --resource-group rg-agents

# Pošaljite više zahtjeva
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# Provjerite dnevnike - trebali biste vidjeti da je krug otvoren nakon 5 kvarova
# Koristite Azure CLI za dnevnike Container App:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ Kriteriji uspjeha:**
- ✅ Nakon 5 neuspjeha prekidač se otvara (odbijaju se zahtjevi)
- ✅ Nakon 60 sekundi prekidač prelazi u polu-otvoreno stanje (test oporavka)
- ✅ Ostali agenti nastavljaju normalno raditi
- ✅ Prekidač se automatski zatvara kad se agent oporavi

**Vrijeme**: 40-50 minuta

---

## Nadzor i otklanjanje pogrešaka

### Distribuirano praćenje uz Application Insights

**Datoteka: `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# Konfigurirajte praćenje
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# Kreirajte tragač
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# Konfigurirajte zapisivanje logova
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

### Upiti za Application Insights

**Praćenje radnih tokova više agenata:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**Usporedba performansi agenata:**

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

**Analiza neuspjeha:**

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

## Analiza troškova

### Troškovi sustava više agenata (mjesečne procjene)

| Komponenta | Konfiguracija | Trošak |
|------------|---------------|--------|
| **Orkestrator** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 Agenta** | 4 Container Apps (0.5 vCPU, 1GB svaki) | $60-120 |
| **Service Bus** | Standardna razina, 10M poruka | $10-20 |
| **Cosmos DB** | Serverless, 5GB prostora, 1M RUs | $25-50 |
| **Blob Storage** | 10GB prostora, 100K operacija | $5-10 |
| **Application Insights** | 5GB unosa | $10-15 |
| **Microsoft Foundry modeli** | gpt-4.1, 10M tokena | $100-300 |
| **Ukupno** | | **$240-565/mjesečno** |

### Strategije optimizacije troškova

1. **Koristite serverless gdje god je moguće:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Smanjite agente na nulu kad su neaktivni:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Koristite grupiranje poruka za Service Bus:**
   ```python
   # Pošaljite poruke u serijama (jeftinije)
   sender.send_messages([message1, message2, message3])
   ```

4. **Keširajte često korištene rezultate:**
   ```python
   # Koristite Azure Cache za Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Najbolje prakse

### ✅ ČINITE:

1. **Koristite idempotentne operacije**
   ```python
   # Agent može sigurno obrađivati istu poruku više puta
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # Obrada zadatka...
   ```

2. **Implementirajte opsežno vođenje zapisa**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Koristite korelacijske ID-eve**
   ```python
   # Proslijedite task_id kroz cijeli tijek rada
   message_data = {
       'task_id': task_id,  # ID korelacije
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Postavite TTL (vrijeme života) poruka**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Nadzirajte dead letter queue**
   ```python
   # Redovito praćenje neuspjelih poruka
   monitor_dead_letters()
   ```

### ❌ NEMOJTE:

1. **Nemojte stvarati kružne ovisnosti**
   ```python
   # ❌ LOŠE: Agent A → Agent B → Agent A (beskonačna petlja)
   # ✅ DOBRO: Definirajte jasan usmjereni aciklični graf (DAG)
   ```

2. **Nemojte blokirati niti agenata**
   ```python
   # ❌ LOŠE: Sinkrono čekanje
   while not task_complete:
       time.sleep(1)
   
   # ✅ DOBRO: Koristite povratne pozive redova poruka
   ```

3. **Nemojte ignorirati djelomične neuspjehe**
   ```python
   # ❌ LOŠE: Ne uspije cijeli radni tijek ako jedan agent ne uspije
   # ✅ DOBRO: Vrati djelomične rezultate s pokazateljima pogrešaka
   ```

4. **Ne koristite beskonačne pokušaje ponovnog slanja**
   ```python
   # ❌ LOŠE: pokušavaj ponovno zauvijek
   # ✅ DOBRO: max_retries = 3, zatim mrtvo slovo
   ```

---

## Vodič za rješavanje problema

### Problem: Poruke zapete u redu

**Simptomi:**
- Poruke se gomilaju u redu
- Agent ne obrađuju
- Status zadatka zapne na "pending"

**Dijagnoza:**
```bash
# Provjerite dubinu reda
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Provjerite dnevnike agenta pomoću Azure CLI-ja
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**Rješenja:**

1. **Povećajte broj replika agenta:**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Provjerite red mrtvih pisama (dead letter queue):**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problem: Zadatak ističe rok/nikada ne završava

**Simptomi:**
- Status zadatka ostaje "in_progress"
- Neki agenti završe, drugi ne
- Nema poruka o grešci

**Dijagnoza:**
```bash
# Provjeri stanje zadatka
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Provjeri Application Insights
# Pokreni upit: traces | where customDimensions.task_id == "..."
```

**Rješenja:**

1. **Implementirajte timeout u agregatoru (Vježba 1)**

2. **Provjerite neuspjehe agenata koristeći Azure Monitor:**
   ```bash
   # Pogledajte zapise putem azd monitor
   azd monitor --logs
   
   # Ili koristite Azure CLI za provjeru zapisa određenih kontejnerskih aplikacija
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Potvrdite da svi agenti rade:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## Saznajte više

### Službena dokumentacija
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Dizajnerski obrasci za višestruke agente](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### Sljedeći koraci u ovom tečaju
- ← Prethodno: [Planiranje kapaciteta](capacity-planning.md)
- → Sljedeće: [Odabir SKU-a](sku-selection.md)
- 🏠 [Početna stranica tečaja](../../README.md)

### Povezani primjeri
- [Primjer mikroservisa](../../../../examples/microservices) - Obrasci komunikacije servisa
- [Primjer Microsoft Foundry modela](../../../../examples/azure-openai-chat) - AI integracija

---

## Sažetak

**Naučili ste:**
- ✅ Pet obrazaca koordinacije (sekvencijalni, paralelni, hijerarhijski, vođeni događajima, konsenzus)
- ✅ Višestruka arhitektura agenata na Azureu (Service Bus, Cosmos DB, Container Apps)
- ✅ Upravljanje stanjem preko distribuiranih agenata
- ✅ Rukovanje timeout-ovima, ponovnim pokušajima i prekidačima struja
- ✅ Praćenje i ispravljanje grešaka u distribuiranim sustavima
- ✅ Strategije optimizacije troškova

**Ključne lekcije:**
1. **Odaberite pravi obrazac** - Sekvencijalni za uređene tijekove rada, paralelni za brzinu, vođeni događajima za fleksibilnost
2. **Pažljivo upravljajte stanjem** - Koristite Cosmos DB ili slično za zajedničko stanje
3. **Graceful rješavajte pogreške** - Timeout-i, ponovni pokušaji, prekidači struja, redovi mrtvih pisama
4. **Sve pratite** - Distribuirano praćenje je ključno za otklanjanje grešaka
5. **Optimizirajte troškove** - Skalirajte na nulu, koristite serverless, implementirajte keširanje

**Sljedeći koraci:**
1. Završi praktične vježbe
2. Izgradi sustav s višestrukim agentima za svoj slučaj upotrebe
3. Prouči [Odabir SKU-a](sku-selection.md) za optimizaciju performansi i troškova

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatizirani prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->