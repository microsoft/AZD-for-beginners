# Multi-agent coördinatiepatronen

⏱️ **Geschatte tijd**: 60-75 minuten | 💰 **Geschatte kosten**: ~$100-300/maand | ⭐ **Complexiteit**: Geavanceerd

**📚 Leerlijn:**
- ← Vorige: [Capaciteitsplanning](capacity-planning.md) - Capaciteitsbepaling en schaalstrategieën
- 🎯 **Je bent hier**: Multi-agent coördinatiepatronen (Orchestratie, communicatie, statusbeheer)
- → Volgende: [SKU-selectie](sku-selection.md) - Het kiezen van de juiste Azure-services
- 🏠 [Cursus Start](../../README.md)

---

## Wat je leert

Door deze les te voltooien, zul je:
- Begrijpen van **multi-agent architectuur** patronen en wanneer ze te gebruiken
- Implementeren van **orchestratiepatronen** (gecentraliseerd, gedecentraliseerd, hiërarchisch)
- Ontwerpen van **agentcommunicatiestrategieën** (synchroon, asynchroon, event-driven)
- Beheren van **gedeelde staat** over gedistribueerde agents
- Deployen van **multi-agent systemen** op Azure met AZD
- Toepassen van **coördinatiepatronen** voor real-world AI-scenario's
- Monitoren en debuggen van gedistribueerde agentensystemen

## Waarom multi-agent coördinatie belangrijk is

### De evolutie: van enkele agent naar multi-agent

**Enkele agent (Eenvoudig):**
```
User → Agent → Response
```
- ✅ Gemakkelijk te begrijpen en te implementeren
- ✅ Snel voor eenvoudige taken
- ❌ Beperkt door de capaciteiten van één model
- ❌ Kan complexe taken niet paralleliseren
- ❌ Geen specialisatie

**Multi-agent systeem (Geavanceerd):**
```mermaid
graph TD
    Orchestrator[Orkestrator] --> Agent1[Agent1<br/>Plannen]
    Orchestrator --> Agent2[Agent2<br/>Coderen]
    Orchestrator --> Agent3[Agent3<br/>Beoordelen]
```- ✅ Gespecialiseerde agents voor specifieke taken
- ✅ Parallelle uitvoering voor snelheid
- ✅ Modulair en onderhoudbaar
- ✅ Beter bij complexe workflows
- ⚠️ Vereist coördinatielogica

**Analogie**: Een enkele agent is als één persoon die alle taken doet. Multi-agent is als een team waarin elk lid gespecialiseerde vaardigheden heeft (onderzoeker, programmeur, beoordelaar, schrijver) die samenwerken.

---

## Kerncoördinatiepatronen

### Patroon 1: Sequentiële coördinatie (Chain of Responsibility)

**Wanneer te gebruiken**: Taken moeten in een specifieke volgorde worden voltooid; elke agent bouwt voort op de output van de vorige.

```mermaid
sequenceDiagram
    participant User as Gebruiker
    participant Orchestrator as Orkestrator
    participant Agent1 as Onderzoeksagent
    participant Agent2 as Schrijversagent
    participant Agent3 as Redacteuragent
    
    User->>Orchestrator: "Schrijf een artikel over AI"
    Orchestrator->>Agent1: Onderzoek onderwerp
    Agent1-->>Orchestrator: Onderzoeksresultaten
    Orchestrator->>Agent2: Schrijf concept (met gebruik van onderzoek)
    Agent2-->>Orchestrator: Conceptartikel
    Orchestrator->>Agent3: Redigeer en verbeter
    Agent3-->>Orchestrator: Eindartikel
    Orchestrator-->>User: Verfijnd artikel
    
    Note over User,Agent3: Sequentieel: Elke stap wacht op de vorige
```

**Voordelen:**
- ✅ Duidelijke gegevensstroom
- ✅ Gemakkelijk te debuggen
- ✅ Voorspelbare uitvoeringsvolgorde

**Beperkingen:**
- ❌ Langzamer (geen parallelisme)
- ❌ Eén fout blokkeert de hele keten
- ❌ Kan geen onderlinge afhankelijkheden afhandelen

**Voorbeelden van gebruik:**
- Contentcreatie-pijplijn (onderzoek → schrijven → redigeren → publiceren)
- Codegeneratie (plan → implementatie → testen → uitrollen)
- Rapportagegeneratie (dataverzameling → analyse → visualisatie → samenvatting)

---

### Patroon 2: Parallelle coördinatie (Fan-Out/Fan-In)

**Wanneer te gebruiken**: Onafhankelijke taken kunnen gelijktijdig worden uitgevoerd, resultaten worden aan het einde gecombineerd.

```mermaid
graph TB
    User[Gebruikersverzoek]
    Orchestrator[Orkestrator]
    Agent1[Analyse Agent]
    Agent2[Onderzoek Agent]
    Agent3[Data Agent]
    Aggregator[Resultaat Aggregator]
    Response[Gecombineerd Antwoord]
    
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
**Voordelen:**
- ✅ Snel (parallelle uitvoering)
- ✅ Fouttolerant (gedeeltelijke resultaten zijn acceptabel)
- ✅ Schaalbaar horizontaal

**Beperkingen:**
- ⚠️ Resultaten kunnen buiten volgorde aankomen
- ⚠️ Aggregatielogica nodig
- ⚠️ Complex statusbeheer

**Voorbeelden van gebruik:**
- Gegevensverzameling uit meerdere bronnen (API's + databases + webscraping)
- Competitieve analyse (meerdere modellen genereren oplossingen, beste geselecteerd)
- Vertaalservices (gelijktijdig vertalen naar meerdere talen)

---

### Patroon 3: Hiërarchische coördinatie (Manager-Worker)

**Wanneer te gebruiken**: Complexe workflows met subtaken, delegatie vereist.

```mermaid
graph TB
    Master[Hoofdcoördinator]
    Manager1[Onderzoeksmanager]
    Manager2[Contentmanager]
    W1[Webscraper]
    W2[Artikelanalist]
    W3[Schrijver]
    W4[Redacteur]
    
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
**Voordelen:**
- ✅ Handelt complexe workflows af
- ✅ Modulair en onderhoudbaar
- ✅ Duidelijke verantwoordelijkheidsgrenzen

**Beperkingen:**
- ⚠️ Complexere architectuur
- ⚠️ Hogere latency (meerdere coördinatielagen)
- ⚠️ Vereist geavanceerde orchestratie

**Voorbeelden van gebruik:**
- Enterprise documentverwerking (classificeer → routeer → verwerk → archiveer)
- Meertraps datapielines (ingestie → opschonen → transformeren → analyseren → rapporteren)
- Complexe automatiseringsworkflows (planning → resourceallocatie → uitvoering → monitoring)

---

### Patroon 4: Event-driven coördinatie (Publish-Subscribe)

**Wanneer te gebruiken**: Agents moeten reageren op events, losse koppeling gewenst.

```mermaid
sequenceDiagram
    participant Agent1 as Gegevensverzamelaar
    participant EventBus as Azure Service Bus
    participant Agent2 as Analysator
    participant Agent3 as Melder
    participant Agent4 as Archiveringscomponent
    
    Agent1->>EventBus: Publiceer "GegevensOntvangen" evenement
    EventBus->>Agent2: Abonneer: Gegevens analyseren
    EventBus->>Agent3: Abonneer: Verstuur melding
    EventBus->>Agent4: Abonneer: Archiveer gegevens
    
    Note over Agent1,Agent4: Alle abonnees verwerken onafhankelijk van elkaar
    
    Agent2->>EventBus: Publiceer "AnalyseVoltooid" evenement
    EventBus->>Agent3: Abonneer: Verstuur analyserapport
```
**Voordelen:**
- ✅ Losse koppeling tussen agents
- ✅ Gemakkelijk om nieuwe agents toe te voegen (gewoon abonneren)
- ✅ Asynchrone verwerking
- ✅ Veerkrachtig (berichtpersistentie)

**Beperkingen:**
- ⚠️ Eventual consistency
- ⚠️ Moeilijk te debuggen
- ⚠️ Uitdagingen met berichtvolgorde

**Voorbeelden van gebruik:**
- Real-time monitoringsystemen (alerts, dashboards, logs)
- Multi-channel notificaties (e-mail, SMS, push, Slack)
- Dataverwerkingspijplijnen (meerdere consumenten van dezelfde data)

---

### Patroon 5: Consensus-gebaseerde coördinatie (Voting/Quorum)

**Wanneer te gebruiken**: Er is overeenstemming van meerdere agents nodig voordat er wordt doorgegaan.

```mermaid
graph TB
    Input[Invoertaak]
    Agent1[Agent 1: gpt-4.1]
    Agent2[Agent 2: Claude]
    Agent3[Agent 3: Gemini]
    Voter[Consensusstemmer]
    Output[Overeengekomen uitvoer]
    
    Input --> Agent1
    Input --> Agent2
    Input --> Agent3
    Agent1 --> Voter
    Agent2 --> Voter
    Agent3 --> Voter
    Voter --> Output
    
    style Voter fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
```
**Voordelen:**
- ✅ Hogere nauwkeurigheid (meerdere meningen)
- ✅ Fouttolerant (minderheidsfouten acceptabel)
- ✅ Kwaliteitsborging ingebouwd

**Beperkingen:**
- ❌ Duur (meerdere model-aanroepen)
- ❌ Langzamer (wachten op meerdere agents)
- ⚠️ Conflictoplossing nodig

**Voorbeelden van gebruik:**
- Contentmoderatie (meerdere modellen beoordelen content)
- Code review (meerdere linters/analyzers)
- Medische diagnose (meerdere AI-modellen, expertvalidatie)

---

## Architectuuroverzicht

### Volledig multi-agent systeem op Azure

```mermaid
graph TB
    User[Gebruiker/API-client]
    APIM[Azure API-beheer]
    Orchestrator[Orchestrator-service<br/>Container-app]
    ServiceBus[Azure Service Bus<br/>Evenementenhub]
    
    Agent1[Onderzoeksagent<br/>Container-app]
    Agent2[Schrijversagent<br/>Container-app]
    Agent3[Analist-agent<br/>Container-app]
    Agent4[Beoordelaar-agent<br/>Container-app]
    
    CosmosDB[(Cosmos DB<br/>Gedeelde status)]
    Storage[Azure Storage<br/>Artefacten]
    AppInsights[Application Insights<br/>Bewaking]
    
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
**Belangrijke componenten:**

| Component | Doel | Azure Service |
|-----------|---------|---------------|
| **API Gateway** | Toegangspunt, verkeersbeperking, authenticatie | API Management |
| **Orchestrator** | Coördineert agentworkflows | Container Apps |
| **Message Queue** | Asynchrone communicatie | Service Bus / Event Hubs |
| **Agents** | Gespecialiseerde AI-werkers | Container Apps / Functions |
| **State Store** | Gedeelde status, taaktracking | Cosmos DB |
| **Artifact Storage** | Documenten, resultaten, logs | Blob Storage |
| **Monitoring** | Gedistribueerde tracing, logs | Application Insights |

---

## Vereisten

### Benodigde tools

```bash
# Controleer Azure Developer CLI
azd version
# ✅ Verwacht: azd versie 1.0.0 of hoger

# Controleer Azure CLI
az --version
# ✅ Verwacht: azure-cli 2.50.0 of hoger

# Controleer Docker (voor lokaal testen)
docker --version
# ✅ Verwacht: Docker versie 20.10 of hoger
```

### Azure-vereisten

- Actief Azure-abonnement
- Machtigingen om te maken:
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB-accounts
  - Storage-accounts
  - Application Insights

### Vereiste voorkennis

Je zou de volgende benodigde kennis moeten hebben afgerond:
- [Configuratiebeheer](../chapter-03-configuration/configuration.md)
- [Authenticatie & Beveiliging](../chapter-03-configuration/authsecurity.md)
- [Microservices Voorbeeld](../../../../examples/microservices)

---

## Implementatiehandleiding

### Projectstructuur

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

## Les 1: Sequentieel coördinatiepatroon

### Implementatie: Contentcreatie-pijplijn

Laten we een sequentiële pijplijn bouwen: Onderzoek → Schrijven → Redigeren → Publiceren

### 1. AZD-configuratie

**Bestand: `azure.yaml`**

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

### 2. Infrastructuur: Service Bus voor coördinatie

**Bestand: `infra/core/servicebus.bicep`**

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

### 3. Gedeelde statusbeheerder

**Bestand: `src/shared/state_manager.py`**

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

### 4. Orchestrator-service

**Bestand: `src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# Service Bus-verbinding
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
    
    # Taak aanmaken in de statusopslag
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # Stuur bericht naar onderzoeksagent (eerste stap)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # Waar resultaten naartoe te sturen
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

### 5. Onderzoeksagent

**Bestand: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# Initialiseer cliënten
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
    
    # Roep Microsoft Foundry-modellen aan voor onderzoek
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # Werk status bij
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # Stuur naar de volgende agent (schrijver)
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

### 6. Schrijveragent

**Bestand: `src/agents/writer/app.py`**

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
    
    # Microsoft Foundry Models aanroepen om een artikel te schrijven
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # Status bijwerken
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # Naar de redacteur sturen
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

### 7. Redacteuragent

**Bestand: `src/agents/editor/app.py`**

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
    
    # Roep Microsoft Foundry-modellen aan om te bewerken
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # Markeer taak als voltooid
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

### 8. Implementeren en testen

```bash
# Optie A: Sjabloongebaseerde implementatie
azd init
azd up

# Optie B: Implementatie van agentmanifest (vereist extensie)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> Zie [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) voor alle `azd ai` flags en opties.

```bash
# Haal de orchestrator-URL op
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Maak inhoud aan
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ Verwachte output:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**Controleer taakvoortgang:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Verwachte output (voltooid):**
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

## Les 2: Parallel coördinatiepatroon

### Implementatie: Onderzoeksaggregator voor meerdere bronnen

Laten we een parallel systeem bouwen dat informatie gelijktijdig uit meerdere bronnen verzamelt.

### Parallelle Orchestrator

**Bestand: `src/orchestrator/parallel_workflow.py`**

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
    
    # Fan-out: Tegelijk naar alle agenten verzenden
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

### Aggregatielogica

**Bestand: `src/agents/aggregator/app.py`**

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

# Resultaten per taak bijhouden
task_results = defaultdict(list)
expected_agents = 4  # web, academisch, nieuws, sociaal

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # Resultaat opslaan
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # Controleren of alle agenten klaar zijn (fan-in)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # Resultaten combineren
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # Markeren als voltooid
        state_manager.complete_task(task_id, aggregated)
        
        # Opruimen
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

**Voordelen van het parallelle patroon:**
- ⚡ **4x sneller** (agents draaien gelijktijdig)
- 🔄 **Fouttolerant** (gedeeltelijke resultaten zijn acceptabel)
- 📈 **Schaalbaar** (voeg eenvoudig meer agents toe)

---

## Praktische oefeningen

### Oefening 1: Time-out afhandeling toevoegen ⭐⭐ (Middel)

**Doel**: Implementeer timeout-logica zodat de aggregator niet eeuwig wacht op trage agents.

**Stappen**:

1. **Voeg timeout-tracking toe aan de aggregator:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> vervaldatum

def process_result(message_data):
    task_id = message_data['task_id']
    
    # Stel time-out in voor het eerste resultaat
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # Controleer of voltooid OF verlopen
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
        
        # Opruimen
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **Test met kunstmatige vertragingen:**

```python
# Voeg bij een agent vertraging toe om trage verwerking te simuleren
import time
time.sleep(35)  # Overschrijdt de time-out van 30 seconden
```

3. **Implementeer en verifieer:**

```bash
azd deploy aggregator

# Taak indienen
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Controleer de resultaten na 30 seconden
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Succescriteria:**
- ✅ Taak voltooit na 30 seconden, zelfs als agents niet klaar zijn
- ✅ Respons geeft gedeeltelijke resultaten aan (`"timed_out": true`)
- ✅ Beschikbare resultaten worden teruggegeven (3 van de 4 agents)

**Tijd**: 20-25 minuten

---

### Oefening 2: Retry-logica implementeren ⭐⭐⭐ (Geavanceerd)

**Doel**: Faalde agenttaken automatisch opnieuw proberen voordat ze worden opgegeven.

**Stappen**:

1. **Voeg retry-tracking toe aan de orchestrator:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # bericht_id -> aantal_pogingen

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

2. **Voeg retry-handler toe aan agents:**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # Verwerk het bericht
        process_func(message_data)
        
        # Succes - voltooid
        receiver.complete_message(message)
        
    except Exception as e:
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # Opnieuw proberen: afbreken en opnieuw in de wachtrij plaatsen met verhoogde teller
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # Terugsturen naar dezelfde wachtrij met vertraging
            time.sleep(5 * (retry_count + 1))  # Exponentiële backoff
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # Verwijder origineel
        else:
            # Maximaal aantal pogingen overschreden - verplaats naar dead-letter queue
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **Monitor de dead letter queue:**

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

**✅ Succescriteria:**
- ✅ Mislukte taken worden automatisch opnieuw geprobeerd (tot 3 keer)
- ✅ Exponentiële backoff tussen retries (5s, 10s, 15s)
- ✅ Na maximum retries gaan berichten naar de dead letter queue
- ✅ Dead letter queue kan gemonitord en opnieuw afgespeeld worden

**Tijd**: 30-40 minuten

---

### Oefening 3: Circuit Breaker implementeren ⭐⭐⭐ (Geavanceerd)

**Doel**: Voorkom kettingreacties van fouten door verzoeken naar falende agents te stoppen.

**Stappen**:

1. **Maak een circuit breaker-klasse:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # Normale werking
    OPEN = "open"          # Faalt, verzoeken afwijzen
    HALF_OPEN = "half_open"  # Testen of het is hersteld

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
            # Controleren of de time-out is verlopen
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # Succes
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

2. **Pas toe op agent-aanroepen:**

```python
# In de orchestrator
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
        # Ga door met andere agenten
```

3. **Test de circuit breaker:**

```bash
# Simuleer herhaalde fouten (stop één agent)
az containerapp stop --name web-research-agent --resource-group rg-agents

# Stuur meerdere verzoeken
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# Controleer de logs - je zou moeten zien dat het circuit open gaat na 5 fouten
# Gebruik de Azure CLI voor Container App-logs:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ Succescriteria:**
- ✅ Na 5 fouten opent het circuit (verwerpt verzoeken)
- ✅ Na 60 seconden gaat het circuit half-open (test herstel)
- ✅ Andere agents blijven normaal werken
- ✅ Circuit sluit automatisch wanneer agent herstelt

**Tijd**: 40-50 minuten

---

## Monitoring en debuggen

### Gedistribueerde tracing met Application Insights

**Bestand: `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# Tracing configureren
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# Maak een tracer
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# Logging configureren
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

### Application Insights-query's

**Volg multi-agent workflows:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**Vergelijking van agentprestaties:**

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

**Foutanalyse:**

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

## Kostenanalyse

### Kosten van een multi-agent systeem (maandelijkse schattingen)

| Component | Configuratie | Kosten |
|-----------|--------------|------|
| **Orchestrator** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 Agents** | 4 Container Apps (0.5 vCPU, 1GB each) | $60-120 |
| **Service Bus** | Standard tier, 10M messages | $10-20 |
| **Cosmos DB** | Serverless, 5GB storage, 1M RUs | $25-50 |
| **Blob Storage** | 10GB storage, 100K operations | $5-10 |
| **Application Insights** | 5GB ingestion | $10-15 |
| **Microsoft Foundry Models** | gpt-4.1, 10M tokens | $100-300 |
| **Totaal** | | **$240-565/month** |

### Strategieën voor kostenoptimalisatie

1. **Gebruik serverless waar mogelijk:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Schaal agents naar nul wanneer idle:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Gebruik batching voor Service Bus:**
   ```python
   # Stuur berichten in batches (goedkoper)
   sender.send_messages([message1, message2, message3])
   ```

4. **Cache veelgebruikte resultaten:**
   ```python
   # Gebruik Azure Cache voor Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Beste praktijken

### ✅ DOEN:

1. **Gebruik idempotente operaties**
   ```python
   # Agent kan hetzelfde bericht veilig meerdere keren verwerken
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # Taak verwerken...
   ```

2. **Implementeer uitgebreide logging**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Gebruik correlatie-ID's**
   ```python
   # Geef task_id door in de hele workflow
   message_data = {
       'task_id': task_id,  # Correlatie-ID
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Stel message TTL (time-to-live) in**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Controleer dead letter-queues**
   ```python
   # Regelmatige controle van mislukte berichten
   monitor_dead_letters()
   ```

### ❌ NIET DOEN:

1. **Maak geen circulaire afhankelijkheden**
   ```python
   # ❌ SLECHT: Agent A → Agent B → Agent A (oneindige lus)
   # ✅ GOED: Definieer een duidelijke gerichte acyclische graaf (DAG)
   ```

2. **Blokkeer geen agent-threads**
   ```python
   # ❌ SLECHT: Synchroon wachten
   while not task_complete:
       time.sleep(1)
   
   # ✅ GOED: Gebruik callbacks van de berichtwachtrij
   ```

3. **Negeer geen gedeeltelijke fouten**
   ```python
   # ❌ SLECHT: Laat de volledige workflow falen als één agent faalt
   # ✅ GOED: Geef gedeeltelijke resultaten terug met foutindicatoren
   ```

4. **Gebruik geen oneindige herhalingspogingen**
   ```python
   # ❌ SLECHT: oneindig opnieuw proberen
   # ✅ GOED: max_retries = 3, daarna naar de dead-letter
   ```

---

## Troubleshooting Guide

### Problem: Messages stuck in queue

**Symptoms:**
- Berichten stapelen zich op in de wachtrij
- Agenten verwerken niets
- Taakstatus blijft "pending"

**Diagnosis:**
```bash
# Controleer de wachtrijdiepte
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Controleer de agentlogs met de Azure CLI
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**Solutions:**

1. **Verhoog het aantal agentreplica's:**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Controleer de dead-letterwachtrij:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problem: Task timeout/never completes

**Symptoms:**
- Taakstatus blijft "in_progress"
- Sommige agenten voltooien hun taak, anderen niet
- Geen foutmeldingen

**Diagnosis:**
```bash
# Controleer taakstatus
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Controleer Application Insights
# Voer query uit: traces | where customDimensions.task_id == "..."
```

**Solutions:**

1. **Implementeer time-out in aggregator (Oefening 1)**

2. **Controleer op agentfouten met Azure Monitor:**
   ```bash
   # Bekijk logs via azd monitor
   azd monitor --logs
   
   # Of gebruik de Azure CLI om de logs van een specifieke container-app te bekijken
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Controleer of alle agenten draaien:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## Learn More

### Official Documentation
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### Next Steps in This Course
- ← Vorige: [Capaciteitsplanning](capacity-planning.md)
- → Volgende: [SKU-selectie](sku-selection.md)
- 🏠 [Cursusoverzicht](../../README.md)

### Related Examples
- [Microservices Example](../../../../examples/microservices) - Patronen voor servicecommunicatie
- [Microsoft Foundry Models Example](../../../../examples/azure-openai-chat) - AI-integratie

---

## Summary

**Je hebt geleerd:**
- ✅ Vijf coördinatiepatronen (sequentieel, parallel, hiërarchisch, gebeurtenisgestuurd, consensus)
- ✅ Multi-agentarchitectuur op Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Toestandbeheer over gedistribueerde agenten
- ✅ Time-outafhandeling, herhalingen en circuit breakers
- ✅ Bewaking en debuggen van gedistribueerde systemen
- ✅ Strategieën voor kostenoptimalisatie

**Belangrijkste conclusies:**
1. **Kies het juiste patroon** - Sequentieel voor geordende workflows, parallel voor snelheid, gebeurtenisgestuurd voor flexibiliteit
2. **Beheer toestand zorgvuldig** - Gebruik Cosmos DB of vergelijkbaar voor gedeelde toestand
3. **Ga soepel om met fouten** - Time-outs, herhalingen, circuit breakers, dead-letterqueues
4. **Monitor alles** - Gedistribueerde tracing is essentieel voor debuggen
5. **Optimaliseer kosten** - Schaal naar nul, gebruik serverless, implementeer caching

**Volgende stappen:**
1. Voltooi de praktische oefeningen
2. Bouw een multi-agent systeem voor jouw use-case
3. Bestudeer [SKU-selectie](sku-selection.md) om prestaties en kosten te optimaliseren

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onjuistheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->