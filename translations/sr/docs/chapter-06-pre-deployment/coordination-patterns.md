# Обрасци координације више агената

⏱️ **Процењено време**: 60-75 минута читања; неколико сати за имплементацију | 💰 **Процењени трошкови**: зависно од оптерећења | ⭐ **Комплексност**: Напредно

**📚 Пут учења:**
- ← Претходно: [Capacity Planning](capacity-planning.md) - Стратегије димензионисања и скалирања ресурса
- 🎯 **Ту сте**: Обрасци координације више агената (Оркестрација, комуникација, управљање стањем)
- → Следеће: [SKU Selection](sku-selection.md) - Избор правих Azure услуга
- 🏠 [Почетна страна курса](../../README.md)

---

## Шта ћете научити

Завршетком овог часа ћете:
- Разумети обрасце **архитектуре више агената** и када их користити
- Имплементирати **образце оркестрације** (централизована, децентрализована, хијерархијска)
- Дизајнирати стратегије **комуникације агената** (синхрона, асинхрона, на догађаје)
- Управљати **заједничким стањем** између расподељених агената
- Деплојовати **системе са више агената** на Azure са AZD
- Примени те **образце координације** за реалне сценарије везане за вештачку интелигенцију
- Пратити и дебаговати расподељене системе агената

## Зашто је координација више агената важна

### Еволуција: од појединачног агента до више агената

**Појединачни агент (једноставан):**
```
User → Agent → Response
```
- ✅ Лако разумевање и имплементација
- ✅ Брз за једноставне задатке
- ❌ Ограничен могућностима појединачног модела
- ❌ Не може да паралелизује сложене задатке
- ❌ Нема специјализацију

**Систем са више агената (напредан):**
```mermaid
graph TD
    Orchestrator[Orchestrator] --> Agent1[Agent1<br/>Plan]
    Orchestrator --> Agent2[Agent2<br/>Code]
    Orchestrator --> Agent3[Agent3<br/>Review]
```
- ✅ Специјализовани агенти за специфичне задатке
- ✅ Паралелна извршења ради веће брзине
- ✅ Модуларно и одрживо
- ✅ Бољи код сложених радних токова
- ⚠️ Захтева логику координације

**Аналогија**: Појединачни агент је као једна особа која ради све задатке. Више агената је као тим у којем сваки члан има специјализоване вештине (истраживач, програмер, рецензент, писац) и заједно раде.

---

## Основни обрасци координације

### Образац 1: Секвенцијална координација (Ланац одговорности)

**Када користити**: Задатке треба извршавати у одређеном редоследу, сваки агент гради на резултату претходног.

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

**Предности:**
- ✅ Јасан ток података
- ✅ Лако за дебагање
- ✅ Предвидив редослед извршења

**Ограничења:**
- ❌ Спорије (нема паралелизма)
- ❌ Један неуспех блокира цео ланац
- ❌ Не може обрадити међузависне задатке

**Примери употребе:**
- Производни ланац садржаја (истраживање → писање → уређивање → објава)
- Генерисање кода (планирање → имплементација → тестирање → деплој)
- Генерисање извештаја (прикупљање података → анализа → визуелизација → резиме)

---

### Образац 2: Паралелна координација (Фен-аут/Фен-ин)

**Када користити**: Независни задаци могу да се извршавају паралелно, а резултати се на крају комбинују.

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

**Предности:**
- ✅ Брзо (паралелно извршење)
- ✅ Отпоран на грешке (делимични резултати прихватљиви)
- ✅ Хоризонтално скалабилно

**Ограничења:**
- ⚠️ Резултати могу стизати ван реда
- ⚠️ Потребна логика агрегације
- ⚠️ Комплексно управљање стањем

**Примери употребе:**
- Прикупљање података из више извора (АПИ-ји + базе података + web scraping)
- Конкурентна анализа (више модела генерише решења, најбоље се одабира)
- Преводилачке услуге (превод на више језика истовремено)

---

### Образац 3: Хијерархијска координација (Менаџер-Радник)

**Када користити**: Сложени радни токови са подзадацима, потребна је делегација.

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

**Предности:**
- ✅ Обрађује сложене радне токове
- ✅ Модуларно и одрживо
- ✅ Јасне границе одговорности

**Ограничења:**
- ⚠️ Комплекснија архитектура
- ⚠️ Већа латенција (више слојева координације)
- ⚠️ Захтева софистицирану оркестрацију

**Примери употребе:**
- Обрада докумената у предузећу (класификуј → усмери → обради → архивирај)
- Вишестепени подаци токови (прихвати → очисти → трансформиши → анализирај → извештај)
- Сложени аутоматизацијски процеси (планирање → расподела ресурса → извршење → надзор)

---

### Образац 4: Координација на бази догађаја (Објави-Претплати се)

**Када користити**: Агенти треба да реагују на догађаје, жељена је лабава повезаност.

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

**Предности:**
- ✅ Лабава повезаност између агената
- ✅ Лако додавање нових агената (само се претплатите)
- ✅ Асинхрона обрада
- ✅ Отпоран (перзистенција порука)

**Ограничења:**
- ⚠️ Коначна конзистентност
- ⚠️ Комплексно дебање
- ⚠️ Изазови у поретку порука

**Примери употребе:**
- Системи за праћење у реалном времену (аларми, контролне табле, логови)
- Вишеканалне нотификације (е-пошта, СМС, пуш, Слак)
- Подаци токови обраде (више конзумила истих података)

---

### Образац 5: Координација заснована на консензусу (Гласање/Кворум)

**Када користити**: Потребан је договор више агената пре наставка рада.

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

**Предности:**
- ✅ Већа прецизност (више мишљења)
- ✅ Отпоран на грешке (прихватљиви мањински неуспеси)
- ✅ Уграђена контрола квалитета

**Ограничења:**
- ❌ Скупо (вишеструки позиви модела)
- ❌ Спорије (чекање свих агената)
- ⚠️ Потребно решавање сукоба

**Примери употребе:**
- Модерација садржаја (више модела рецензира садржај)
- Ревизија кода (више лентера/анализатора)
- Медицинска дијагноза (више AI модела, стручна валидизација)

---

## Преглед архитектуре

### Комплетан систем са више агената на Azure

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

**Кључне компоненте:**

| Компонента | Намена | Azure услуга |
|-----------|---------|---------------|
| **API Gateway** | Улазна тачка, ограничење брзине, аутентификација | API Management |
| **Оркестратор** | Координира радне токове агената | Container Apps |
| **Message Queue** | Асинхрона комуникација | Service Bus / Event Hubs |
| **Агенти** | Специјализовани AI радници | Container Apps / Functions |
| **Store стања** | Заједничко стање, праћење задатака | Cosmos DB |
| **Чување артефаката** | Документи, резултати, логови | Blob Storage |
| **Monitoring (надзор)** | Расподељено праћење, логови | Application Insights |

Service Bus редови/теме и Event Hubs су различите услуге са различитим моделима доставе/конзумирања; Event Hubs није замена која се може „убацити“ у постојећи Service Bus код радника испод. Паралелизам, перзистиране поруке и гласање модела сами по себи не гарантују толеранцију на грешке или већу тачност.

---

## Претпоставке

### Потребни алати

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

### Захтеви Azure-а

- Активна Azure претплата
- Дозволе за креирање:
  - Container Apps
  - Service Bus namespace-ови
  - Cosmos DB налози
  - Storage налози
  - Application Insights

### Претходно знање

Требало би да сте завршили:
- [Configuration Management](../chapter-03-configuration/configuration.md)
- [Authentication & Security](../chapter-03-configuration/authsecurity.md)
- [Microservices Example](../../../../examples/microservices)

---

## Водич за имплементацију

> **Фрагменти дизајна, не препознатљива лабораторија:** Дрво пројекта и `File:` етикете испод описују датотеке које треба креирати у вашем пројекту; овај репозиторјум не садржи комплетну `multi-agent-system` апликацију. Недостају шаблони главног/параметарског кода, окружење/регистар Container Apps, Docker датотеке и закључавање зависности, подешавање Cosmos базе/канте, деплој модела, конфигурација идентитета/улога, правила скалирања и паралелни радници/редови. Не очекујте да `azd init` генерише ове датотеке или да `azd up` деплојује сегменте неизмењене. За извршну полазну тачку, завршите [Multi-Agent Basics](../chapter-05-multi-agent/multi-agent-basics.md).

**Претпоставке за извршавање:** Python 3.10+, `azure-servicebus`, `azure-cosmos`, `openai`, Flask и (за мониторинг) `azure-monitor-opentelemetry`; ставите `shared` на Python пут увоза у свакој слици услуге. Cosmos `agent-state/tasks` канте већ морају постојати са партиционом кључем `/id`. Конекције засноване на кључевима поједностављују ове фрагменте, али се не препоручују за продукцију: предност дајте управљаним идентитетима са ограниченим улогама Service Bus/Cosmos/OpenAI у нивоу података. Не излажите кључеве у излазима или логовима.

Испорука Service Bus је **најмање једном**. Перзистирајте идемпотентност по задацима **и корацима**, користите оптимистичку конкурентност (ETags) за читање/модификацију/писање стања и обнављајте закључавање порука током дугог процеса. Испод једноставни менаџер стања је само секвенцијалан и не имплементира ове гаранције за продукцију.

### Структура пројекта

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

## Час 1: Секвенцијални образац координације

### Имплементација: Поступак креирања садржаја

Дизајнирајмо секвенцијални ланац: Истраживање → Писање → Уређивање. Објава је изван овог примера.

### 1. AZD конфигурација

**Датотека: `azure.yaml`**

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

### 2. Инфраструктура: Service Bus за координацију

**Датотека: `infra/core/servicebus.bicep`**

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

### 3. Менаџер заједничког стања

**Датотека: `src/shared/state_manager.py`**

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

### 4. Оркестратор услуга

**Датотека: `src/orchestrator/app.py`**

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

### 5. Истраживачки агент

**Датотека: `src/agents/research/app.py`**

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

### 6. Писачки агент

**Датотека: `src/agents/writer/app.py`**

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

### 7. Уреднички агент

**Датотека: `src/agents/editor/app.py`**

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

### 8. Деплој и тестирање

Ове команде важe **само након што имплементирате нестале пројектне датотеке**. Интерактивна иницијација Foundry агента је посебан радни ток; не генерише овај дизајн Service Bus.

```bash
# In your completed custom project
azd up

# Alternative in a SEPARATE empty folder (GA bundle workflow requires azd >= 1.37.0)
azd ext install microsoft.foundry
azd ai agent init
azd up
```

> Погледајте [AZD AI CLI команде](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за све `azd ai` заставице и опције.

```bash
# Get orchestrator URL
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Create content
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ Очекивани излаз:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit"],
  "message": "Content creation pipeline initiated"
}
```

**Провера напретка задатка:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Очекивани излаз (завршено):**
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

## Час 2: Паралелни образац координације

### Имплементација: Агрегатор истраживања из више извора

Изградимо паралелни систем који истовремено прикупља информације из више извора.

### Паралелни оркестратор

**Датотека: `src/orchestrator/parallel_workflow.py`**

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

### Логика агрегације

**Датотека: `src/agents/aggregator/app.py`**

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

**Предности паралелног обрасца:**
- ⚡ **Потенцијално мања латенција** (ограничена најспоријим радником уз додатак трошкова координације)
- 🔄 **Може подржати делимичне резултате** са експлицитним роковима и политиком неуспеха (није имплементирано основним агрегатором)
- 📈 **Скалабилно** (лакше додавање више агената)

---

## Практичне вежбе

### Вежба 1: Додајте руковање таймаутом ⭐⭐ (Средњи ниво)

**Циљ**: Имплементирати логику тајмаута како агрегатор не би чекао вечно споре агенте.

**Почетна тачка:** Покрените ову локалну симулацију рока пре него што је интегришете у радника реда. Тајмаут који се проверава само када стигне друга порука никада неће бити активиран ако недостајући радник ништа не пошаље.

**Кораци:**

1. **Додајте праћење тајмаута у агрегатор:**

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

2. **Очекивани излаз:**

```text
{'completed_agents': 3, 'timed_out': True}
```

3. **Интеграција са системом редова (задаци дизајна):** Перзистирајте рок слања и очекиване агенте приликом креирања задатка, покрените периодично прегледавање рока независно од долазних резултата, атомски финализујте делимичне резултате и игноришите касне/дуплиране поруке за финализиране задатке. Локални тајмаут не отказује удаљене раднике.

Само за ваш имплементирани пројекат:

```bash
azd deploy aggregator

# Submit task
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Check results after 30 seconds
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Критеријуми успеха:**
- ✅ Локални тест враћа контролу после свог једносекундног рока чак и ако агент није завршен
- ✅ Одговор показује делимичне резултате (`"timed_out": true`)
- ✅ Враћају се доступни резултати (3 од 4 агента)

**Време**: 20-25 минута

---

### Вежба 2: Имплементирајте логику поновног покушаја ⭐⭐⭐ (Напредни ниво)

**Циљ**: Аутоматски поново покушати неуспеле агентске задатке пре одустајања.

**Кораци:**

1. **Користите бројаче испорука Service Bus уместо аутоматских поновних ставки:**

```python
import json
import time
# Integration fragment: use a live peek-lock ServiceBusReceiver.
# Set queue maxDeliveryCount to 4 for one attempt + up to three retries.
```

2. **Додајте обработник поновних покушаја агентима:**

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

3. **Пратите ред за погрешке (dead letter queue):**

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

**✅ Критеријуми успеха:**
- ✅ Неуспели задаци аутоматски се поново покрећу (до 3 пута)
- ✅ Експоненцијално одлагање између покушаја (5с, 10с, 20с), уз обнављање закључавања порука где је потребно
- ✅ Након максималног броја покушаја, поруке иду у ред за погрешке
- ✅ Поруке из реда за погрешке могу се прегледати; репродукција захтева посебан идемпотентан радни ток опоравка

**Време**: 30-40 минута

---

### Вежба 3: Имплементирајте прекидач кола (Circuit Breaker) ⭐⭐⭐ (Напредни ниво)

**Циљ**: Спријечити каскадне неуспехе заустављањем захтева на неуспеле агенте.

**Кораци:**

1. **Креирајте класу прекидача кола:**

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

2. **Примјените је на позиве агената:**

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

Овај коло штити **пошаљи операцију**, а не завршетак од стране удаљеног радника: успешно стављање поруке у ред ништа не говори о томе да ли агент ради. `send_message` је функција вашег апликационог слања. За извршне кола, унесите посматране неуспехе/прекорачења задатака у издржљиви координатор. Ова класа у меморији је демонстрација са једним нитима, а не дистрибуирани прекидач кола.

3. **Тестирајте прекидач кола локално:**

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

**✅ Критеријуми успеха:**
- ✅ Након 5 неуспеха, коло се отвара (одбија захтеве)
- ✅ Након 60 секунди, коло иде у половично отворено стање (тестира опоравак)
- ✅ Други агенти настављају нормално радити
- ✅ Коло се аутоматски затвара када се агент опорави

**Време**: 40-50 минута

---

## Надгледање и отклањање грешака

### Дистрибуирано праћење са Application Insights

**Датотека: `src/shared/tracing.py`**

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

### Application Insights упити

**Пратите више агената у радним токовима:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**Поређење перформанси агената:**

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

**Анализа неуспеха:**

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

## Анализа трошкова

### Трошкови више агентног система (месечне процене)

Иллустративне планиране вредности само, не понуде: укупно испод је **$240-565/месечно**. Потврдите тренутне регионалне тарифе, сате активних/пасивних реплика, улазни/излазни микс токена, складиштење и телеметрију. Serverless нема минимум због повећаног капацитета, али ипак наплаћује за захтеве и складиштење.

| Компонента | Конфигурација | Трошак |
|-----------|--------------|------|
| **Оркестратор** | 1 Контейнер Апликација (1 vCPU, 2GB) | $30-50 |
| **4 Агента** | 4 Контейнер Апликације (0.5 vCPU, 1GB сваки) | $60-120 |
| **Service Bus** | Стандардни слој, 10М порука | $10-20 |
| **Cosmos DB** | Serverless, 5GB складиште, 1М RUs | $25-50 |
| **Blob Storage** | 10GB складиште, 100К операција | $5-10 |
| **Application Insights** | 5GB унос | $10-15 |
| **Microsoft Foundry Models** | gpt-4.1, 10М токена | $100-300 |
| **Укупно** | | **$240-565/месечно** |

### Стратегије оптимизације трошкова

1. **Користите serverless где је могуће:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Маскирајте агенте на нулу кад су неактивни:**
   ```bicep
   scale: {
     minReplicas: 0  // Requires a Service Bus/KEDA scale rule to wake workers
     maxReplicas: 10
   }
   ```

3. **Користите серијско слање за Service Bus:**
   ```python
   # Send messages in batches (cheaper)
   sender.send_messages([message1, message2, message3])
   ```

4. **Кеширајте често коришћење резултате:**
   ```python
   # Use Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Најбоље праксе

### ✅ РАДИТЕ:

1. **Користите идемпотентне операције**
   ```python
   # Pseudocode: implement a durable, atomic per-step deduplication claim.
   def process_task(task_id):
       raise NotImplementedError("Claim (task_id, step) atomically, execute, persist outcome")
   ```

2. **Имплементирајте обимно логирање**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Користите ИД корелације**
   ```python
   # Pass task_id through entire workflow
   message_data = {
       'task_id': task_id,  # Correlation ID
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Поставите TTL поруке (време живота)**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Надгледајте редове за "dead letter"**
   ```python
   # Regular monitoring of failed messages
   monitor_dead_letters()
   ```

### ❌ НЕ РАДИТЕ:

1. **Не правите кружне зависности**
   ```python
   # ❌ BAD: Agent A → Agent B → Agent A (infinite loop)
   # ✅ GOOD: Define clear directed acyclic graph (DAG)
   ```

2. **Не блокирајте нити агената**
   ```python
   # ❌ BAD: Synchronous wait
   while not task_complete:
       time.sleep(1)
   
   # ✅ GOOD: Use message queue callbacks
   ```

3. **Не игноришите делимичне неуспехе**
   ```python
   # ❌ BAD: Fail entire workflow if one agent fails
   # ✅ GOOD: Return partial results with error indicators
   ```

4. **Не користите бескрајне поновне покушаје**
   ```python
   # ❌ BAD: retry forever
   # ✅ GOOD: max_retries = 3, then dead letter
   ```

---

## Водич за решавање проблема

### Проблем: Поруке заглављене у реду

**Симптоми:**
- Поруке се акумулирају у реду
- Агенти не обрађују
- Статус задатка заглављен на "пендинг"

**Дијагноза:**
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

**Решења:**

1. **Повећање реплика агената:**
   ```bash
   az containerapp update \
     --resource-group "$RG_NAME" \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Провера реда за "dead letter":**
   ```bash
   az servicebus queue show \
     --resource-group "$RG_NAME" \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Проблем: Рок задатка/никда се не завршава

**Симптоми:**
- Статус задатка остаје "у раду"
- Неки агенти завршавају, други не
- Ниједна порука о грешци

**Дијагноза:**
```bash
# Check task state
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Check Application Insights
# Run query: traces | where customDimensions.task_id == "..."
```

**Решења:**

1. **Имплементирајте таймаут у агрегатор (Вежба 1)**

2. **Проверите неуспехе агената користећи Azure Monitor:**
   ```bash
   # View logs via azd monitor
   azd monitor --logs
   
   # Or use Azure CLI to check specific container app logs
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Потврдите да сви агенти раде:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## Сазнајте више

### Званична документација
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [AI Agent Orchestration Patterns](https://learn.microsoft.com/azure/architecture/ai-ml/guide/ai-agent-design-patterns)

### Следећи кораци у овом курсу
- ← Претходно: [Планирање капацитета](capacity-planning.md)
- → Следеће: [Избор SKU](sku-selection.md)
- 🏠 [Почетак курса](../../README.md)

### Повезани примери
- [Пример микросервиса](../../../../examples/microservices) - Обрасци комуникације сервиса
- [Пример Microsoft Foundry модела](../../../../examples/azure-openai-chat) - AI интеграција

---

## Резиме

**Нauчили сте:**
- ✅ Пет образаца координације (секвенцијални, паралелни, хијерархијски, догађајно вођени, консензус)
- ✅ Архитектура више агената на Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Управљање стањем у дистрибуираном систему агената
- ✅ Руковање временским ограничењима, покушајима и прекидачима кола
- ✅ Надгледање и отклањање грешака у дистрибуираном систему
- ✅ Стратегије оптимизације трошкова

**Кључне поуке:**
1. **Изаберите прави образац** - Секвенцијални за наручене токове, паралелни за брзину, догађајно вођени за флексибилност
2. **Пажљиво управљајте стањем** - Користите Cosmos DB или слично за заједничко стање
3. **Руковати неуспесима на елегантан начин** - временска ограничења, поновни покушаји, прекидачи кола, редови за "dead letter"
4. **Надгледајте све** - Дистрибуирано праћење је од суштинског значаја за отклањање грешака
5. **Оптимизујте трошкове** - Маскирајте на нулу, користите serverless, имплементирајте кеширање

**Следећи кораци:**
1. Завршите практичне вежбе
2. Изградите систем са више агената за вашу примену
3. Проучите [Избор SKU](sku-selection.md) за оптимизацију перформанси и трошкова

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->