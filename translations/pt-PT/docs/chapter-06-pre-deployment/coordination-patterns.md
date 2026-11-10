# Padrões de Coordenação Multi-Agente

⏱️ **Tempo Estimado**: 60-75 minutos de leitura; várias horas para implementar | 💰 **Custo Estimado**: dependente da carga de trabalho | ⭐ **Complexidade**: Avançado

**📚 Caminho de Aprendizagem:**
- ← Anterior: [Capacity Planning](capacity-planning.md) - Estratégias de dimensionamento e escalonamento de recursos
- 🎯 **Você Está Aqui**: Padrões de Coordenação Multi-Agente (Orquestração, comunicação, gestão de estado)
- → Seguinte: [SKU Selection](sku-selection.md) - Escolha dos serviços Azure adequados
- 🏠 [Início do Curso](../../README.md)

---

## O Que Irá Aprender

Ao completar esta lição, irá:
- Compreender padrões de **arquitetura multi-agente** e quando os usar
- Implementar **padrões de orquestração** (centralizado, descentralizado, hierárquico)
- Projetar estratégias de **comunicação entre agentes** (síncrona, assíncrona, orientada por eventos)
- Gerir **estado partilhado** entre agentes distribuídos
- Implementar **sistemas multi-agente** na Azure com AZD
- Aplicar **padrões de coordenação** para cenários reais de IA
- Monitorizar e depurar sistemas de agentes distribuídos

## Por Que a Coordenação Multi-Agente é Importante

### A Evolução: De Agente Único para Multi-Agente

**Agente Único (Simples):**
```
User → Agent → Response
```
- ✅ Fácil de entender e implementar
- ✅ Rápido para tarefas simples
- ❌ Limitado pelas capacidades do único modelo
- ❌ Não permite paralelizar tarefas complexas
- ❌ Sem especialização

**Sistema Multi-Agente (Avançado):**
```mermaid
graph TD
    Orchestrator[Orchestrator] --> Agent1[Agent1<br/>Plan]
    Orchestrator --> Agent2[Agent2<br/>Code]
    Orchestrator --> Agent3[Agent3<br/>Review]
```
- ✅ Agentes especializados para tarefas específicas
- ✅ Execução paralela para maior velocidade
- ✅ Modular e fácil de manter
- ✅ Melhor em fluxos de trabalho complexos
- ⚠️ Requer lógica de coordenação

**Analogia**: Um agente único é como uma pessoa a fazer todas as tarefas. O multi-agente é como uma equipa onde cada membro tem competências especializadas (investigador, programador, revisor, escritor) a trabalhar em conjunto.

---

## Padrões Centrais de Coordenação

### Padrão 1: Coordenação Sequencial (Cadeia de Responsabilidade)

**Quando usar**: Tarefas devem ser completadas numa ordem específica, cada agente baseia-se na saída anterior.

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

**Benefícios:**
- ✅ Fluxo de dados claro
- ✅ Fácil de depurar
- ✅ Ordem de execução previsível

**Limitações:**
- ❌ Mais lento (sem paralelismo)
- ❌ Uma falha bloqueia toda a cadeia
- ❌ Incapaz de gerir tarefas interdependentes

**Exemplos de Uso:**
- Pipeline de criação de conteúdo (investigar → escrever → editar → publicar)
- Geração de código (planeamento → implementação → testes → deploy)
- Geração de relatórios (coleta de dados → análise → visualização → resumo)

---

### Padrão 2: Coordenação Paralela (Fan-Out/Fan-In)

**Quando usar**: Tarefas independentes podem correr simultaneamente, resultados combinados no final.

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

**Benefícios:**
- ✅ Rápido (execução paralela)
- ✅ Tolerante a falhas (resultados parciais aceitáveis)
- ✅ Escalabilidade horizontal

**Limitações:**
- ⚠️ Os resultados podem chegar fora de ordem
- ⚠️ Necessidade de lógica de agregação
- ⚠️ Gestão de estado complexa

**Exemplos de Uso:**
- Coleta de dados multi-fonte (APIs + bases de dados + web scraping)
- Análise competitiva (vários modelos geram soluções, seleciona-se a melhor)
- Serviços de tradução (traduz para várias línguas ao mesmo tempo)

---

### Padrão 3: Coordenação Hierárquica (Gestor-Trabalhador)

**Quando usar**: Fluxos de trabalho complexos com subtarefas, delegação necessária.

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

**Benefícios:**
- ✅ Gere fluxos complexos
- ✅ Modular e de fácil manutenção
- ✅ Limites claros de responsabilidade

**Limitações:**
- ⚠️ Arquitetura mais complexa
- ⚠️ Maior latência (várias camadas de coordenação)
- ⚠️ Requer orquestração sofisticada

**Exemplos de Uso:**
- Processamento empresarial de documentos (classificar → encaminhar → processar → arquivar)
- Pipelines de dados multi-etapas (ingestão → limpeza → transformação → análise → relatório)
- Workflows de automação complexos (planeamento → alocação de recursos → execução → monitorização)

---

### Padrão 4: Coordenação Orientada por Eventos (Publicar-Assinar)

**Quando usar**: Agentes precisam reagir a eventos, acoplamento frouxo desejado.

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

**Benefícios:**
- ✅ Acoplamento frouxo entre agentes
- ✅ Fácil adicionar novos agentes (basta assinar)
- ✅ Processamento assíncrono
- ✅ Resiliente (persistência de mensagens)

**Limitações:**
- ⚠️ Consistência eventual
- ⚠️ Depuração complexa
- ⚠️ Desafios na ordenação de mensagens

**Exemplos de Uso:**
- Sistemas de monitorização em tempo real (alertas, painéis, logs)
- Notificações multi-canal (email, SMS, push, Slack)
- Pipelines de processamento de dados (múltiplos consumidores dos mesmos dados)

---

### Padrão 5: Coordenação Baseada em Consenso (Votação/Quórum)

**Quando usar**: Necessita-se de acordo de múltiplos agentes antes de avançar.

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

**Benefícios:**
- ✅ Maior precisão (múltiplas opiniões)
- ✅ Tolerante a falhas (falhas minoritárias aceitáveis)
- ✅ Garantia de qualidade incorporada

**Limitações:**
- ❌ Dispendioso (múltiplas chamadas a modelos)
- ❌ Mais lento (espera por todos os agentes)
- ⚠️ Necessidade de resolução de conflitos

**Exemplos de Uso:**
- Moderação de conteúdos (vários modelos revêm o conteúdo)
- Revisão de código (vários linters/analisadores)
- Diagnóstico médico (vários modelos IA, validação por especialistas)

---

## Visão Geral da Arquitetura

### Sistema Multi-Agente Completo na Azure

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

**Componentes-Chave:**

| Componente | Propósito | Serviço Azure |
|-----------|----------|---------------|
| **API Gateway** | Ponto de entrada, limitação de taxa, autenticação | API Management |
| **Orquestrador** | Coordena fluxos de trabalho dos agentes | Container Apps |
| **Fila de Mensagens** | Comunicação assíncrona | Service Bus / Event Hubs |
| **Agentes** | Trabalhadores IA especializados | Container Apps / Functions |
| **Armazenamento de Estado** | Estado partilhado, rastreamento de tarefas | Cosmos DB |
| **Armazenamento de Artefactos** | Documentos, resultados, logs | Blob Storage |
| **Monitorização** | Rastreamento distribuído, logs | Application Insights |

As filas/tópicos do Service Bus e os Event Hubs são serviços diferentes com modelos diferentes de entrega/consumo; Event Hubs não é um substituto direto para o código worker do Service Bus abaixo. Paralelismo, mensagens persistentes e votação de modelos não garantem por si só tolerância a falhas ou maior precisão.

---

## Pré-Requisitos

### Ferramentas Necessárias

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

### Requisitos Azure

- Subscrição ativa na Azure
- Permissões para criar:
  - Container Apps
  - Namespaces do Service Bus
  - Contas Cosmos DB
  - Contas de armazenamento
  - Application Insights

### Conhecimentos Pré-Requisitos

Deve ter concluído:
- [Gestão de Configuração](../chapter-03-configuration/configuration.md)
- [Autenticação & Segurança](../chapter-03-configuration/authsecurity.md)
- [Exemplo de Microserviços](../../../../examples/microservices)

---

## Guia de Implementação

> **Fragmentos de design, não um laboratório implantável:** A árvore do projeto e os rótulos `File:` abaixo descrevem ficheiros a criar no seu próprio projeto; este repositório não contém uma aplicação `multi-agent-system` completa. Faltam peças como templates main/parameter, ambiente/registo Container Apps, Dockerfiles e bloqueios de dependências, configuração de base de dados/container Cosmos, implementações de modelos, configuração de identidade/papel, regras de escalonamento, e workers/filas paralelos. Não espere que `azd init` gere estes ficheiros ou que `azd up` implemente os fragmentos sem alterações. Para um ponto de partida executável, complete [Fundamentos Multi-Agente](../chapter-05-multi-agent/multi-agent-basics.md).

**Suposições de runtime:** Python 3.10+, `azure-servicebus`, `azure-cosmos`, `openai`, Flask, e (para monitorização) `azure-monitor-opentelemetry`; coloque `shared` no caminho de importação Python em cada imagem de serviço. O contentor Cosmos `agent-state/tasks` deve já existir com a chave de partição `/id`. Conexões baseadas em chave simplificam estes fragmentos, não são recomendadas para produção: prefira identidades geridas com papéis Service Bus/Cosmos/OpenAI no data-plane. Não exponha chaves em outputs ou logs.

A entrega do Service Bus é **pelo menos uma vez**. Persista idempotência por tarefa **e passo**, use concorrência otimista (ETags) para estado de leitura/modificação/escrita, e renove bloqueios de mensagem durante processamento longo. O gestor de estado simples abaixo é apenas sequencial e não implementa estas garantias de produção.

### Estrutura do Projeto

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

## Lição 1: Padrão de Coordenação Sequencial

### Implementação: Pipeline de Criação de Conteúdo

Vamos desenhar um pipeline sequencial: Pesquisar → Escrever → Editar. A publicação fica fora deste exemplo.

### 1. Configuração AZD

**Ficheiro: `azure.yaml`**

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

### 2. Infraestrutura: Service Bus para Coordenação

**Ficheiro: `infra/core/servicebus.bicep`**

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

### 3. Gestor de Estado Partilhado

**Ficheiro: `src/shared/state_manager.py`**

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

### 4. Serviço Orquestrador

**Ficheiro: `src/orchestrator/app.py`**

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

### 5. Agente de Pesquisa

**Ficheiro: `src/agents/research/app.py`**

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

### 6. Agente Escritor

**Ficheiro: `src/agents/writer/app.py`**

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

### 7. Agente Editor

**Ficheiro: `src/agents/editor/app.py`**

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

### 8. Deploy e Teste

Estes comandos aplicam-se **apenas após implementar os ficheiros do projeto em falta**. A inicialização do agente Foundry interativo é um fluxo de trabalho separado; não gera este design de Service Bus.

```bash
# In your completed custom project
azd up

# Alternative in a SEPARATE empty folder (agents beta.23 requires azd >= 1.37)
azd extension install azure.ai.agents
azd ai agent init
azd up
```

> Veja [Comandos AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para todas as flags e opções `azd ai`.

```bash
# Get orchestrator URL
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Create content
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ Saída esperada:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit"],
  "message": "Content creation pipeline initiated"
}
```

**Verifique o progresso da tarefa:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Saída esperada (completo):**
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

## Lição 2: Padrão de Coordenação Paralela

### Implementação: Agregador de Pesquisa Multi-Fonte

Vamos construir um sistema paralelo que recolhe informação de múltiplas fontes simultaneamente.

### Orquestrador Paralelo

**Ficheiro: `src/orchestrator/parallel_workflow.py`**

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

### Lógica de Agregação

**Ficheiro: `src/agents/aggregator/app.py`**

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

**Benefícios do Padrão Paralelo:**
- ⚡ **Potencialmente menor latência** (limitada pelo trabalhador mais lento mais overhead de coordenação)
- 🔄 **Suporta resultados parciais** com deadlines explícitos e política de falhas (não implementada pelo agregador básico)
- 📈 **Escalável** (adicione mais agentes facilmente)

---

## Exercícios Práticos

### Exercício 1: Adicionar Gestão de Timeout ⭐⭐ (Médio)

**Objetivo**: Implementar lógica de timeout para o agregador não esperar eternamente pelos agentes lentos.

**Ponto de partida:** Execute esta simulação local de deadline antes de integrar num worker de fila. Um timeout verificado apenas quando chega outra mensagem nunca dispara se o trabalhador em falta não enviar nada.

**Passos**:

1. **Adicionar rastreamento de timeout ao agregador:**

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

2. **Saída esperada:**

```text
{'completed_agents': 3, 'timed_out': True}
```

3. **Integração do sistema de filas (tarefa de design):** Persists o deadline do despacho e agentes esperados ao criar a tarefa, execute uma varredura periódica de deadlines independente dos resultados recebidos, finalize atomicamente resultados parciais e ignore mensagens atrasadas/duplicadas para tarefas finalizadas. Um timeout local não cancela trabalhadores remotos.

Para o seu projeto implementado apenas:

```bash
azd deploy aggregator

# Submit task
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Check results after 30 seconds
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Critérios de Sucesso:**
- ✅ O teste local termina após o seu deadline de um segundo mesmo que um agente esteja incompleto
- ✅ A resposta indica resultados parciais (`"timed_out": true`)
- ✅ São retornados os resultados disponíveis (3 de 4 agentes)

**Tempo**: 20-25 minutos

---

### Exercício 2: Implementar Lógica de Repetição ⭐⭐⭐ (Avançado)

**Objetivo**: Repetir automaticamente tarefas de agentes falhadas antes de desistir.

**Passos**:

1. **Usar contagens de entregas do Service Bus em vez de contadores personalizados de tentativas:**

```python
import json
import time
# Integration fragment: use a live peek-lock ServiceBusReceiver.
# Set queue maxDeliveryCount to 4 for one attempt + up to three retries.
```

2. **Adicionar manipulador de repetição aos agentes:**

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

3. **Monitorizar fila dead letter:**

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

**✅ Critérios de Sucesso:**
- ✅ Tarefas falhadas são repetidas automaticamente (até 3 vezes)
- ✅ Backoff exponencial entre tentativas (5s, 10s, 20s), com renovação do bloqueio da mensagem onde necessário
- ✅ Após tentativas máximas, mensagens vão para dead letter queue
- ✅ Mensagens dead letter podem ser inspecionadas; reprodução precisa de workflow idempotente separado para recuperação

**Tempo**: 30-40 minutos

---

### Exercício 3: Implementar Circuit Breaker ⭐⭐⭐ (Avançado)

**Objetivo**: Prevenir falhas em cascata ao parar pedidos a agentes em falha.

**Passos**:

1. **Criar classe circuit breaker:**

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

2. **Aplicar às chamadas aos agentes:**

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

Este circuito protege a **operação de envio**, não a conclusão pelo trabalhador remoto: enfileirar uma mensagem com sucesso não diz nada sobre se um agente está ativo. `send_message` é a função de envio da sua aplicação. Para circuitos de execução, alimente falhas/timeouts de tarefas observadas num coordenador durável. Esta classe em memória é uma demonstração a um único thread, não um circuit breaker distribuído.

3. **Testar o circuit breaker localmente:**

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

**✅ Critérios de Sucesso:**
- ✅ Após 5 falhas, o circuito abre (rejeita pedidos)
- ✅ Após 60 segundos, o circuito fica meio aberto (testa recuperação)
- ✅ Outros agentes continuam a trabalhar normalmente
- ✅ O circuito fecha automaticamente quando o agente recupera

**Tempo**: 40-50 minutos

---

## Monitorização e Depuração

### Rastreio Distribuído com Application Insights

**Ficheiro: `src/shared/tracing.py`**

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

### Queries no Application Insights

**Acompanhar fluxos de trabalho multi-agente:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**Comparação de desempenho dos agentes:**

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

**Análise de falhas:**

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

## Análise de Custos

### Custos do Sistema Multi-Agente (Estimativas Mensais)

Números ilustrativos para planeamento apenas, não orçamentos: o total abaixo é **$240-565/mês**. Verifique as tarifas regionais atuais, horas ativas/inativas das réplicas, mistura de tokens de entrada/saída, armazenamento e telemetria. Serverless não tem throughput mínimo provisionado mas ainda cobra por pedidos e armazenamento.

| Componente | Configuração | Custo |
|-----------|--------------|------|
| **Orquestrador** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 Agentes** | 4 Container Apps (0.5 vCPU, 1GB cada) | $60-120 |
| **Service Bus** | nível Standard, 10M mensagens | $10-20 |
| **Cosmos DB** | Serverless, 5GB armazenamento, 1M RUs | $25-50 |
| **Blob Storage** | 10GB armazenamento, 100K operações | $5-10 |
| **Application Insights** | 5GB ingestão | $10-15 |
| **Modelos Microsoft Foundry** | gpt-4.1, 10M tokens | $100-300 |
| **Total** | | **$240-565/mês** |

### Estratégias de Otimização de Custos

1. **Use serverless sempre que possível:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Escale os agentes para zero quando inativos:**
   ```bicep
   scale: {
     minReplicas: 0  // Requires a Service Bus/KEDA scale rule to wake workers
     maxReplicas: 10
   }
   ```

3. **Use lotes para o Service Bus:**
   ```python
   # Send messages in batches (cheaper)
   sender.send_messages([message1, message2, message3])
   ```

4. **Cache de resultados frequentemente usados:**
   ```python
   # Use Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Boas Práticas

### ✅ FAÇA:

1. **Use operações idempotentes**
   ```python
   # Pseudocode: implement a durable, atomic per-step deduplication claim.
   def process_task(task_id):
       raise NotImplementedError("Claim (task_id, step) atomically, execute, persist outcome")
   ```

2. **Implemente logging abrangente**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Use IDs de correlação**
   ```python
   # Pass task_id through entire workflow
   message_data = {
       'task_id': task_id,  # Correlation ID
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Defina TTL (time-to-live) da mensagem**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Monitorize as filas de dead letter**
   ```python
   # Regular monitoring of failed messages
   monitor_dead_letters()
   ```

### ❌ NÃO FAÇA:

1. **Não crie dependências circulares**
   ```python
   # ❌ BAD: Agent A → Agent B → Agent A (infinite loop)
   # ✅ GOOD: Define clear directed acyclic graph (DAG)
   ```

2. **Não bloqueie threads de agentes**
   ```python
   # ❌ BAD: Synchronous wait
   while not task_complete:
       time.sleep(1)
   
   # ✅ GOOD: Use message queue callbacks
   ```

3. **Não ignore falhas parciais**
   ```python
   # ❌ BAD: Fail entire workflow if one agent fails
   # ✅ GOOD: Return partial results with error indicators
   ```

4. **Não use tentativas infinitas**
   ```python
   # ❌ BAD: retry forever
   # ✅ GOOD: max_retries = 3, then dead letter
   ```

---

## Guia de Resolução de Problemas

### Problema: Mensagens presas na fila

**Sintomas:**
- Mensagens acumulam na fila
- Agentes não processam
- Estado da tarefa fica em "pendente"

**Diagnóstico:**
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

**Soluções:**

1. **Aumentar réplicas do agente:**
   ```bash
   az containerapp update \
     --resource-group "$RG_NAME" \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Verificar fila de dead letter:**
   ```bash
   az servicebus queue show \
     --resource-group "$RG_NAME" \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problema: Timeout na tarefa/nunca conclui

**Sintomas:**
- Estado da tarefa mantém-se "em progresso"
- Alguns agentes concluem, outros não
- Nenhuma mensagem de erro

**Diagnóstico:**
```bash
# Check task state
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Check Application Insights
# Run query: traces | where customDimensions.task_id == "..."
```

**Soluções:**

1. **Implementar timeout no agregador (Exercício 1)**

2. **Verificar falhas dos agentes com Azure Monitor:**
   ```bash
   # View logs via azd monitor
   azd monitor --logs
   
   # Or use Azure CLI to check specific container app logs
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Confirmar que todos os agentes estão a correr:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## Saiba Mais

### Documentação Oficial
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [AI Agent Orchestration Patterns](https://learn.microsoft.com/azure/architecture/ai-ml/guide/ai-agent-design-patterns)

### Próximos Passos neste Curso
- ← Anterior: [Capacity Planning](capacity-planning.md)
- → Seguinte: [SKU Selection](sku-selection.md)
- 🏠 [Curso Principal](../../README.md)

### Exemplos Relacionados
- [Exemplo Microserviços](../../../../examples/microservices) - Padrões de comunicação de serviço
- [Exemplo Microsoft Foundry Models](../../../../examples/azure-openai-chat) - Integração AI

---

## Resumo

**Você aprendeu:**
- ✅ Cinco padrões de coordenação (sequencial, paralelo, hierárquico, orientado a eventos, consenso)
- ✅ Arquitetura multi-agente na Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Gestão de estado entre agentes distribuídos
- ✅ Gestão de timeout, tentativas, e circuit breakers
- ✅ Monitorização e depuração de sistemas distribuídos
- ✅ Estratégias de otimização de custos

**Pontos-Chave:**
1. **Escolha o padrão certo** - Sequencial para fluxos ordenados, paralelo para velocidade, orientado a eventos para flexibilidade
2. **Gestão cuidadosa do estado** - Use Cosmos DB ou similar para estado partilhado
3. **Trate falhas com elegância** - Timeouts, tentativas, circuit breakers, filas dead letter
4. **Monitorize tudo** - Rastreio distribuído é essencial para depurar
5. **Otimize custos** - Escale para zero, use serverless, implemente cache

**Próximos Passos:**
1. Complete os exercícios práticos
2. Construa um sistema multi-agente para o seu caso de uso
3. Estude [SKU Selection](sku-selection.md) para otimizar desempenho e custo

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->