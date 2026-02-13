# Moniagenttien koordinointimallit

⏱️ **Arvioitu aika**: 60-75 minuuttia | 💰 **Arvioidut kustannukset**: ~$100-300/kk | ⭐ **Vaativuus**: Edistynyt

**📚 Oppimispolku:**
- ← Previous: [Kapasiteetin suunnittelu](capacity-planning.md) - Resurssien mitoittaminen ja skaalautumisstrategiat
- 🎯 **Olet täällä**: Moniagenttien koordinointimallit (orkestrointi, viestintä, tilanhallinta)
- → Seuraava: [SKU-valinta](sku-selection.md) - Oikeiden Azure-palveluiden valinta
- 🏠 [Kurssin etusivu](../../README.md)

---

## Mitä opit

Suorittamalla tämän oppitunnin opit:
- Ymmärtämään **moniagenttiarkkitehtuurin** malleja ja milloin käyttää niitä
- Toteuttamaan **orkestrointimalleja** (keskitetty, hajautettu, hierarkkinen)
- Suunnittelemaan **agenttien viestintästrategioita** (synkroninen, asynkroninen, tapahtumapohjainen)
- Hallitsemaan **jaettua tilaa** hajautettujen agenttien välillä
- Ottamaan käyttöön **moniagenttijärjestelmiä** Azureen AZD:n avulla
- Soveltamaan **koordinaatiomalleja** todellisiin AI-skenaarioihin
- Valvomaan ja virheenkorjaamaan hajautettuja agenttijärjestelmiä

## Miksi moniagenttikoordinaatio on tärkeää

### Evoluutio: yhdestä agentista moniagenttiin

**Yksittäinen agentti (yksinkertainen):**
```
User → Agent → Response
```
- ✅ Helppo ymmärtää ja toteuttaa
- ✅ Nopea yksinkertaisissa tehtävissä
- ❌ Rajoittunut yksittäisen mallin kykyihin
- ❌ Ei pysty rinnakkaistamaan monimutkaisia tehtäviä
- ❌ Ei erikoistumista

**Moniagenttijärjestelmä (edistynyt):**
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
- ✅ Erikoistuneet agentit tiettyihin tehtäviin
- ✅ Rinnakkaisuus nopeuttaa
- ✅ Modulaarinen ja ylläpidettävä
- ✅ Parempi monimutkaisissa työnkuluissa
- ⚠️ Vaatii koordinointilogiikkaa

**Analogia**: Yksittäinen agentti on kuin yksi henkilö, joka tekee kaikki tehtävät. Moniagenttijärjestelmä on kuin tiimi, jossa jokaisella jäsenellä on erikoistuneet taidot (tutkija, koodari, tarkastaja, kirjoittaja), jotka työskentelevät yhdessä.

---

## Keskeiset koordinointimallit

### Malli 1: Sekventiaalinen koordinointi (vastuun ketju)

**Milloin käyttää**: Tehtävät on suoritettava tietyssä järjestyksessä, kukin agentti rakentaa edellisen tuottaman tiedon päälle.

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as Tutkimusagentti
    participant Agent2 as Kirjoittaja-agentti
    participant Agent3 as Toimittaja-agentti
    
    User->>Orchestrator: "Kirjoita artikkeli tekoälystä"
    Orchestrator->>Agent1: Tutki aihetta
    Agent1-->>Orchestrator: Tutkimustulokset
    Orchestrator->>Agent2: Kirjoita luonnos (käyttäen tutkimusta)
    Agent2-->>Orchestrator: Artikkelin luonnos
    Orchestrator->>Agent3: Muokkaa ja paranna
    Agent3-->>Orchestrator: Lopullinen artikkeli
    Orchestrator-->>User: Viimeistelty artikkeli
    
    Note over User,Agent3: Peräkkäinen: Jokainen vaihe odottaa edellistä
```
**Hyödyt:**
- ✅ Selkeä tietovirta
- ✅ Helppo virheenkorjata
- ✅ Ennustettava suorituksen järjestys

**Rajoitukset:**
- ❌ Hitaampi (ei rinnakkaisuutta)
- ❌ Yksi virhe estää koko ketjun
- ❌ Ei kykene käsittelemään toisiinsa liittyviä tehtäviä

**Esimerkkikäyttötapaukset:**
- Sisällönluontiputki (tutkimus → kirjoita → muokkaa → julkaise)
- Koodin generointi (suunnittele → toteuta → testaa → ota käyttöön)
- Raportin luonti (datan keruu → analyysi → visualisointi → yhteenveto)

---

### Malli 2: Rinnakkainen koordinointi (Fan-Out/Fan-In)

**Milloin käyttää**: Riippumattomat tehtävät voivat käynnistyä samanaikaisesti, tulokset yhdistetään lopussa.

```mermaid
graph TB
    User[Käyttäjän pyyntö]
    Orchestrator[Orkestroija]
    Agent1[Analyysiagentti]
    Agent2[Tutkimusagentti]
    Agent3[Tietoagentti]
    Aggregator[Tulosten yhdistäjä]
    Response[Yhdistetty vastaus]
    
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
**Hyödyt:**
- ✅ Nopea (rinnakkaissuoritus)
- ✅ Vikasietoinen (osittaiset tulokset hyväksyttäviä)
- ✅ Skaalautuu horisontaalisesti

**Rajoitukset:**
- ⚠️ Tulokset saattavat saapua eri järjestyksessä
- ⚠️ Tarvitsee yhdistämislogiikkaa
- ⚠️ Monimutkainen tilanhallinta

**Esimerkkikäyttötapaukset:**
- Monilähteinen tiedonkeruu (API:t + tietokannat + web-scraping)
- Kilpailullinen analyysi (useat mallit tuottavat ratkaisuja, paras valitaan)
- Käännöspalvelut (käännä useille kielille samanaikaisesti)

---

### Malli 3: Hierarkkinen koordinointi (esimies–työntekijä)

**Milloin käyttää**: Monimutkaiset työnkulut, joissa tarvitaan tehtävien delegointia.

```mermaid
graph TB
    Master[Pääorkestroija]
    Manager1[Tutkimuspäällikkö]
    Manager2[Sisällönpäällikkö]
    W1[Verkkokaavin]
    W2[Artikkelin analysoija]
    W3[Kirjoittaja]
    W4[Toimittaja]
    
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
**Hyödyt:**
- ✅ Käsittelee monimutkaisia työnkulkuja
- ✅ Modulaarinen ja ylläpidettävä
- ✅ Selkeät vastuualueet

**Rajoitukset:**
- ⚠️ Monimutkaisempi arkkitehtuuri
- ⚠️ Korkeampi latenssi (useita koordinointikerroksia)
- ⚠️ Vaatii kehittynyttä orkestrointia

**Esimerkkikäyttötapaukset:**
- Yritysdokumenttien käsittely (luokittele → reititä → käsittele → arkistoi)
- Monivaiheiset tietoputket (ingest → puhdista → transformoi → analysoi → raportoi)
- Monimutkaiset automaatiotyönkulut (suunnittelu → resurssien jakaminen → suoritus → valvonta)

---

### Malli 4: Tapahtumapohjainen koordinointi (Publish-Subscribe)

**Milloin käyttää**: Agenttien täytyy reagoida tapahtumiin, löysä kytkentä on toivottavaa.

```mermaid
sequenceDiagram
    participant Agent1 as Tietojen kerääjä
    participant EventBus as Azure Service Bus
    participant Agent2 as Analysoija
    participant Agent3 as Ilmoittaja
    participant Agent4 as Arkistoija
    
    Agent1->>EventBus: Julkaise "Tiedot vastaanotettu" tapahtuma
    EventBus->>Agent2: Tilaa: Analysoi tiedot
    EventBus->>Agent3: Tilaa: Lähetä ilmoitus
    EventBus->>Agent4: Tilaa: Arkistoi tiedot
    
    Note over Agent1,Agent4: Kaikki tilaajat käsittelevät itsenäisesti
    
    Agent2->>EventBus: Julkaise "Analyysi valmis" tapahtuma
    EventBus->>Agent3: Tilaa: Lähetä analyysiraportti
```
**Hyödyt:**
- ✅ Löysä kytkentä agenttien välillä
- ✅ Helppo lisätä uusia agenteja (tilaa vain tilattava)
- ✅ Asynkroninen käsittely
- ✅ Resilientti (viestien pysyvyys)

**Rajoitukset:**
- ⚠️ Lopullinen yhdenmukaisuus (eventual consistency)
- ⚠️ Vaikea virheenkorjaus
- ⚠️ Viestien järjestyksen haasteet

**Esimerkkikäyttötapaukset:**
- Reaaliaikaisen valvonnan järjestelmät (hälytykset, kojelaudat, lokit)
- Monikanavaiset ilmoitukset (sähköposti, SMS, push, Slack)
- Tietoputket (useat kuluttajat samasta datasta)

---

### Malli 5: Konsensuspohjainen koordinointi (Voting/Quorum)

**Milloin käyttää**: Tarvitaan useiden agenttien hyväksyntä ennen etenemistä.

```mermaid
graph TB
    Input[Syötteen tehtävä]
    Agent1[Agentti 1: GPT-4]
    Agent2[Agentti 2: Claude]
    Agent3[Agentti 3: Gemini]
    Voter[Konsensusääntäjä]
    Output[Sovittu tulos]
    
    Input --> Agent1
    Input --> Agent2
    Input --> Agent3
    Agent1 --> Voter
    Agent2 --> Voter
    Agent3 --> Voter
    Voter --> Output
    
    style Voter fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
```
**Hyödyt:**
- ✅ Korkeampi tarkkuus (useita mielipiteitä)
- ✅ Vikasietoinen (vähemmistön viat hyväksyttäviä)
- ✅ Laatuvarmennus sisäänrakennettuna

**Rajoitukset:**
- ❌ Kallis (useita mallikutsuja)
- ❌ Hitaampi (odottaa kaikkia agentteja)
- ⚠️ Konfliktinratkaisua tarvitaan

**Esimerkkikäyttötapaukset:**
- Sisällön moderointi (useat mallit arvioivat sisältöä)
- Koodikatselmointi (useat linterit/analysoijat)
- Lääketieteellinen diagnostiikka (useita AI-malleja, asiantuntijan validointi)

---

## Arkkitehtuurikatsaus

### Täydellinen moniagenttijärjestelmä Azurella

```mermaid
graph TB
    User[Käyttäjä/API-asiakas]
    APIM[Azure API-hallinta]
    Orchestrator[Orchestrator-palvelu<br/>Container App]
    ServiceBus[Azure Service Bus<br/>Event Hub]
    
    Agent1[Tutkimusagentti<br/>Container App]
    Agent2[Kirjoittaja-agentti<br/>Container App]
    Agent3[Analyytikko-agentti<br/>Container App]
    Agent4[Arvioija-agentti<br/>Container App]
    
    CosmosDB[(Cosmos DB<br/>Jaettu tila)]
    Storage[Azure Storage<br/>Artefaktit]
    AppInsights[Application Insights<br/>Valvonta]
    
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
**Keskeiset komponentit:**

| Komponentti | Tarkoitus | Azure-palvelu |
|-----------|---------|---------------|
| **API Gateway** | Sisäänkäyntipiste, nopeudenrajoitus, autentikointi | API Management |
| **Orchestrator** | Koordinoi agenttien työnkulkuja | Container Apps |
| **Message Queue** | Asynkroninen viestintä | Service Bus / Event Hubs |
| **Agents** | Erikoistuneet AI-työntekijät | Container Apps / Functions |
| **State Store** | Jaettu tila, tehtävien seuranta | Cosmos DB |
| **Artifact Storage** | Dokumentit, tulokset, lokit | Blob Storage |
| **Monitoring** | Hajautettu jäljitys, lokit | Application Insights |

---

## Esivaatimukset

### Vaaditut työkalut

```bash
# Tarkista Azure Developer CLI
azd version
# ✅ Odotettu: azd-versio 1.0.0 tai uudempi

# Tarkista Azure CLI
az --version
# ✅ Odotettu: azure-cli 2.50.0 tai uudempi

# Tarkista Docker (paikallista testausta varten)
docker --version
# ✅ Odotettu: Docker-versio 20.10 tai uudempi
```

### Azure-vaatimukset

- Aktiivinen Azure-tilaus
- Oikeudet luoda:
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB accounts
  - Storage accounts
  - Application Insights

### Ennakkotiedot

Sinun tulisi olla suorittanut:
- [Konfiguraation hallinta](../chapter-03-configuration/configuration.md)
- [Autentikointi & turvallisuus](../chapter-03-configuration/authsecurity.md)
- [Mikropalveluesimerkki](../../../../examples/microservices)

---

## Toteutusopas

### Projektin rakenne

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

## Oppitunti 1: Sekventiaalisen koordinoinnin malli

### Toteutus: Sisällönluontiputki

Rakennetaan sekventiaalinen putki: tutkimus → kirjoita → muokkaa → julkaise

### 1. AZD-määritys

**Tiedosto: `azure.yaml`**

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

### 2. Infrastruktuuri: Service Bus koordinointia varten

**Tiedosto: `infra/core/servicebus.bicep`**

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

### 3. Jaetun tilan hallinta

**Tiedosto: `src/shared/state_manager.py`**

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

### 4. Orkestrointipalvelu

**Tiedosto: `src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# Service Bus -yhteys
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
    
    # Luo tehtävä tilatallennukseen
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # Lähetä viesti tutkimusagentille (ensimmäinen vaihe)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # Mihin lähettää tulokset
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

### 5. Tutkimusagentti

**Tiedosto: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# Alusta asiakkaat
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
    
    # Kutsu Azure OpenAI -palvelua tutkimusta varten
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # Päivitä tila
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # Lähetä seuraavalle agentille (kirjoittaja)
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

### 6. Kirjoittaja-agentti

**Tiedosto: `src/agents/writer/app.py`**

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
    
    # Kutsu Azure OpenAI kirjoittamaan artikkeli
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # Päivitä tila
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # Lähetä toimittajalle
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

### 7. Editori-agentti

**Tiedosto: `src/agents/editor/app.py`**

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
    
    # Kutsu Azure OpenAI -palvelua muokkausta varten
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # Merkitse tehtävä valmiiksi
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

### 8. Ota käyttöön ja testaa

```bash
# Alusta ja ota käyttöön
azd init
azd up

# Hae orkestroijan URL-osoite
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Luo sisältö
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ Odotettu tulos:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**Tarkista tehtävän eteneminen:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Odotettu tulos (valmis):**
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

## Oppitunti 2: Rinnakkaisen koordinoinnin malli

### Toteutus: Monilähteinen tutkimuksen yhdistäjä

Rakennetaan rinnakkainen järjestelmä, joka kerää tietoa useista lähteistä samanaikaisesti.

### Rinnakkainen orkestroija

**Tiedosto: `src/orchestrator/parallel_workflow.py`**

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
    
    # Fan-out: Lähetä kaikille agenteille samanaikaisesti
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

### Yhdistämislogiikka

**Tiedosto: `src/agents/aggregator/app.py`**

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

# Seuraa tehtäväkohtaisia tuloksia
task_results = defaultdict(list)
expected_agents = 4  # verkko, akateeminen, uutiset, sosiaalinen

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # Tallenna tulos
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # Tarkista, ovatko kaikki agentit suorittaneet tehtävänsä (fan-in)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # Yhdistä tulokset
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # Merkitse valmiiksi
        state_manager.complete_task(task_id, aggregated)
        
        # Siivoa
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

**Rinnakkaismallin hyödyt:**
- ⚡ **4x nopeampi** (agentit suorittavat samanaikaisesti)
- 🔄 **Vikasietoinen** (osittaiset tulokset hyväksyttäviä)
- 📈 **Skaalautuva** (lisää agentteja helposti)

---

## Käytännön harjoitukset

### Harjoitus 1: Lisää aikakatkaisukäsittely ⭐⭐ (Keskitaso)

**Tavoite**: Toteuta aikakatkaisulogiikka, jotta yhdistäjä ei odota ikuisesti hitaita agentteja.

**Vaiheet**:

1. **Lisää aikakatkaisuseuranta yhdistäjään:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> expiration_time

def process_result(message_data):
    task_id = message_data['task_id']
    
    # Aseta aikakatkaisu ensimmäiselle tulokselle
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # Tarkista, onko valmis tai aikakatkaistu
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
        
        # Siivous
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **Testaa keinotekoisilla viiveillä:**

```python
# Lisää yhteen agenttiin viive simuloidaksesi hidasta käsittelyä
import time
time.sleep(35)  # Ylittää 30 sekunnin aikakatkaisun
```

3. **Ota käyttöön ja varmista:**

```bash
azd deploy aggregator

# Lähetä tehtävä
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Tarkista tulokset 30 sekunnin kuluttua
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Onnistumiskriteerit:**
- ✅ Tehtävä valmistuu 30 sekunnin jälkeen, vaikka agentit eivät olisi valmiita
- ✅ Vastaus osoittaa osittaiset tulokset (`"timed_out": true`)
- ✅ Saatavilla olevat tulokset palautetaan (3/4 agentista)

**Aika**: 20-25 minuuttia

---

### Harjoitus 2: Toteuta uudelleenyrityslogiikka ⭐⭐⭐ (Edistynyt)

**Tavoite**: Yritä epäonnistuneita agenttitehtäviä automaattisesti uudelleen ennen luopumista.

**Vaiheet**:

1. **Lisää uudelleenyritysten seuranta orkestroijaan:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # viestin tunnus -> uudelleenyritysten lukumäärä

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

2. **Lisää uudelleenyrityskäsittelijä agenteille:**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # Käsittele viesti
        process_func(message_data)
        
        # Onnistui - valmis
        receiver.complete_message(message)
        
    except Exception as e:
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # Yritä uudelleen: hylkää ja laita takaisin jonoon kasvatetulla yrityskerralla
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # Lähetä takaisin samaan jonoon viiveellä
            time.sleep(5 * (retry_count + 1))  # Eksponentiaalinen viive
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # Poista alkuperäinen
        else:
            # Maksimiyritykset ylittyneet - siirrä kuolleiden viestien jonoon
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **Valvo dead-letter -jonoa:**

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

**✅ Onnistumiskriteerit:**
- ✅ Epäonnistuneet tehtävät yritetään automaattisesti uudelleen (enintään 3 kertaa)
- ✅ Eksponentiaalinen viive uudelleenyrittojen välillä (5s, 10s, 15s)
- ✅ Maksimiyritysten jälkeen viestit siirtyvät dead-letter -jonoon
- ✅ Dead-letter -jonoa voidaan valvoa ja toistaa

**Aika**: 30-40 minuuttia

---

### Harjoitus 3: Toteuta piirikytkin ⭐⭐⭐ (Edistynyt)

**Tavoite**: Estää ketjureaktio-virheitä pysäyttämällä pyyntöjä epäonnistuviin agenteihin.

**Vaiheet**:

1. **Luo piirikytkinluokka:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # Normaali toiminta
    OPEN = "open"          # Epäonnistuu, hylkää pyynnöt
    HALF_OPEN = "half_open"  # Testataan, onko palautunut

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
            # Tarkista, onko aikakatkaisu umpeutunut
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # Onnistuminen
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

2. **Käytä agenttikutsuissa:**

```python
# Orkestroijassa
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
        # Jatka muiden agenttien kanssa
```

3. **Testaa piirikytkin:**

```bash
# Simuloi toistuvia vikoja (lopeta yksi agentti)
az containerapp stop --name web-research-agent --resource-group rg-agents

# Lähetä useita pyyntöjä
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# Tarkista lokit - pitäisi näkyä, että piiri avautuu viiden epäonnistumisen jälkeen
# Käytä Azure CLI:tä Container App -lokien tarkasteluun:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ Onnistumiskriteerit:**
- ✅ 5 epäonnistumisen jälkeen piiri aukeaa (hylkää pyynnöt)
- ✅ 60 sekunnin jälkeen piiri menee puoliksi auki (testaa palautumista)
- ✅ Muut agentit jatkavat normaalia toimintaa
- ✅ Piiri sulkeutuu automaattisesti, kun agentti toipuu

**Aika**: 40-50 minuuttia

---

## Monitorointi ja virheenkorjaus

### Hajautettu jäljitys Application Insightsilla

**Tiedosto: `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# Konfiguroi jäljitys
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# Luo jäljitin
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# Konfiguroi lokitus
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

### Application Insights -kyselyt

**Seuraa moniagenttien työnkulkuja:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**Agenttien suorituskyvyn vertailu:**

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

**Virheanalyysi:**

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

## Kustannusanalyysi

### Moniagenttijärjestelmän kustannukset (kuukausiarviot)

| Komponentti | Konfiguraatio | Kustannus |
|-----------|--------------|------|
| **Orchestrator** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 agenttia** | 4 Container Apps (0.5 vCPU, 1GB each) | $60-120 |
| **Service Bus** | Standard-taso, 10M viestiä | $10-20 |
| **Cosmos DB** | Serverless, 5GB tallennustila, 1M RUs | $25-50 |
| **Blob Storage** | 10GB tallennustila, 100K operaatiota | $5-10 |
| **Application Insights** | 5GB tiedon sisäänotto | $10-15 |
| **Azure OpenAI** | GPT-4, 10M tokens | $100-300 |
| **Yhteensä** | | **$240-565/month** |

### Kustannusten optimointistrategiat

1. **Käytä serverittömiä palveluja aina kun mahdollista:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Skaalaa agentit nollaan ollessaan vapaina:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Käytä eräkäsittelyä Service Busille:**
   ```python
   # Lähetä viestit erissä (edullisemmin)
   sender.send_messages([message1, message2, message3])
   ```

4. **Välimuistita usein käytetyt tulokset:**
   ```python
   # Käytä Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Parhaat käytännöt

### ✅ TEE:

1. **Käytä idempotentteja operaatioita**
   ```python
   # Agentti voi käsitellä samaa viestiä turvallisesti useita kertoja.
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # Käsittele tehtävää...
   ```

2. **Ota käyttöön kattava lokitus**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Käytä korrelaatio-ID:itä**
   ```python
   # Välitä task_id koko työnkulun läpi
   message_data = {
       'task_id': task_id,  # Korrelointi-ID
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Aseta viestien TTL (time-to-live)**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Valvo dead-letter -jonoja**
   ```python
   # Epäonnistuneiden viestien säännöllinen seuranta
   monitor_dead_letters()
   ```

### ❌ ÄLÄ:

1. **Älä luo syklisiä riippuvuuksia**
   ```python
   # ❌ HUONO: Agentti A → Agentti B → Agentti A (ääretön silmukka)
   # ✅ HYVÄ: Määrittele selkeä suunnattu syklitön graafi (DAG)
   ```

2. **Älä estä agenttien säikeitä**
   ```python
   # ❌ HUONO: Synkroninen odotus
   while not task_complete:
       time.sleep(1)
   
   # ✅ HYVÄ: Käytä viestijonon takaisinkutsuja
   ```

3. **Älä sivuuta osittaisia virheitä**
   ```python
   # ❌ HUONO: Keskeytä koko työnkulku, jos yksi agentti epäonnistuu
   # ✅ HYVÄ: Palauta osittaiset tulokset virheiden osoittimilla
   ```

4. **Älä käytä loputtomia uudelleenyrityksiä**
   ```python
   # ❌ HUONO: yritä uudelleen ikuisesti
   # ✅ HYVÄ: max_retries = 3, sitten dead-letter-jonoon
   ```

---
## Vianetsintäopas

### Ongelma: Viestit jumissa jonossa

**Oireet:**
- Viestit kertyvät jonoon
- Agentit eivät käsittele
- Tehtävän tila jumissa "odottava"

**Diagnoosi:**
```bash
# Tarkista jonon syvyys
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Tarkista agentin lokit Azure CLI:llä
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**Ratkaisut:**

1. **Lisää agenttien replikoja:**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Tarkista dead-letter-jono:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Ongelma: Tehtävän aikakatkaisu/ei koskaan valmistu

**Oireet:**
- Tehtävän tila pysyy "käynnissä"
- Jotkut agentit suorittavat tehtävän loppuun, toiset eivät
- Ei virheilmoituksia

**Diagnoosi:**
```bash
# Tarkista tehtävän tila
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Tarkista Application Insights
# Suorita kysely: traces | where customDimensions.task_id == "..."
```

**Ratkaisut:**

1. **Toteuta aikakatkaisu agregaattoriin (Harjoitus 1)**

2. **Tarkista agenttien virheet Azure Monitorin avulla:**
   ```bash
   # Näytä lokit azd monitor -komennolla
   azd monitor --logs
   
   # Tai käytä Azure CLI:tä tarkistaaksesi tietyn Container Appin lokit
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Varmista, että kaikki agentit ovat käynnissä:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## Lisätietoja

### Virallinen dokumentaatio
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### Seuraavat askeleet tässä kurssissa
- ← Edellinen: [Kapasiteettisuunnittelu](capacity-planning.md)
- → Seuraava: [SKU-valinta](sku-selection.md)
- 🏠 [Kurssin etusivu](../../README.md)

### Aiheeseen liittyvät esimerkit
- [Mikropalveluesimerkki](../../../../examples/microservices) - Palvelujen viestintämallit
- [Azure OpenAI -esimerkki](../../../../examples/azure-openai-chat) - AI-integraatio

---

## Yhteenveto

**Olet oppinut:**
- ✅ Viisi koordinointimallia (sekventiaalinen, rinnakkainen, hierarkkinen, tapahtumapohjainen, konsensus)
- ✅ Moni-agenttinen arkkitehtuuri Azurella (Service Bus, Cosmos DB, Container Apps)
- ✅ Tilanhallinta hajautettujen agenttien kesken
- ✅ Aikakatkaisujen käsittely, uudelleenyrittämiset ja circuit breaker -mallit
- ✅ Hajautettujen järjestelmien valvonta ja virheenkorjaus
- ✅ Kustannusten optimointistrategiat

**Keskeiset opit:**
1. **Valitse oikea malli** - Sekventiaalinen järjestykseen perustuville työnkulkuille, rinnakkainen nopeutta varten, tapahtumapohjainen joustavuuteen
2. **Hallitse tilaa huolellisesti** - Käytä Cosmos DB:tä tai vastaavaa jaetun tilan hallintaan
3. **Käsittele virheitä huolellisesti** - Aikakatkaisut, uudelleenyrittämiset, circuit breaker -mallit, dead-letter-jonot
4. **Valvo kaikkea** - Hajautettu jäljitys on välttämätöntä virheenkorjaukseen
5. **Optimoi kustannukset** - Skaalaa nollaan, käytä serverlessiä, ota käyttöön välimuisti

**Seuraavat askeleet:**
1. Suorita käytännön harjoitukset
2. Rakenna moni-agenttinen järjestelmä omaan käyttötapaustasi varten
3. Tutki [SKU-valintaa](sku-selection.md) optimoidaksesi suorituskyvyn ja kustannukset

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattikäännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää määräävänä lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä johtuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->