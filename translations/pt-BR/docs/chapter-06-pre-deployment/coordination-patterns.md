# Padrões de Coordenação Multiagente

⏱️ **Tempo Estimado**: 60-75 minutos | 💰 **Custo Estimado**: ~$100-300/mês | ⭐ **Complexidade**: Avançado

**📚 Roteiro de Aprendizagem:**
- ← Anterior: [Planejamento de Capacidade](capacity-planning.md) - Dimensionamento de recursos e estratégias de escalonamento
- 🎯 **Você Está Aqui**: Padrões de Coordenação Multiagente (Orquestração, comunicação, gerenciamento de estado)
- → Próximo: [Seleção de SKU](sku-selection.md) - Escolhendo os serviços Azure corretos
- 🏠 [Página do Curso](../../README.md)

---

## O que Você Vai Aprender

Ao concluir esta lição, você irá:
- Entender **padrões de arquitetura multiagente** e quando usá-los
- Implementar **padrões de orquestração** (centralizada, descentralizada, hierárquica)
- Projetar **estratégias de comunicação entre agentes** (síncrona, assíncrona, orientada a eventos)
- Gerenciar **estado compartilhado** entre agentes distribuídos
- Implantar **sistemas multiagente** no Azure com AZD
- Aplicar **padrões de coordenação** para cenários reais de IA
- Monitorar e depurar sistemas distribuídos de agentes

## Por que a Coordenação Multiagente Importa

### A Evolução: De Agente Único para Multiagente

**Agente Único (Simples):**
```
User → Agent → Response
```
- ✅ Fácil de entender e implementar
- ✅ Rápido para tarefas simples
- ❌ Limitado pelas capacidades de um único modelo
- ❌ Não pode paralelizar tarefas complexas
- ❌ Sem especialização

**Sistema Multiagente (Avançado):**
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
- ✅ Agentes especializados para tarefas específicas
- ✅ Execução paralela para velocidade
- ✅ Modular e fácil de manter
- ✅ Melhor para fluxos de trabalho complexos
- ⚠️ Requer lógica de coordenação

**Analogia**: Um agente único é como uma pessoa fazendo todas as tarefas. Multiagente é como uma equipe onde cada membro tem habilidades especializadas (pesquisador, programador, revisor, redator) trabalhando juntos.

---

## Principais Padrões de Coordenação

### Padrão 1: Coordenação Sequencial (Cadeia de Responsabilidade)

**Quando usar**: As tarefas precisam ser concluídas em uma ordem específica, cada agente baseia-se na saída anterior.

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as Agente de Pesquisa
    participant Agent2 as Agente Escritor
    participant Agent3 as Agente Editor
    
    User->>Orchestrator: "Escreva um artigo sobre IA"
    Orchestrator->>Agent1: Pesquisar tópico
    Agent1-->>Orchestrator: Resultados da pesquisa
    Orchestrator->>Agent2: Escrever rascunho (usando a pesquisa)
    Agent2-->>Orchestrator: Rascunho do artigo
    Orchestrator->>Agent3: Editar e melhorar
    Agent3-->>Orchestrator: Artigo final
    Orchestrator-->>User: Artigo polido
    
    Note over User,Agent3: Sequencial: Cada etapa aguarda a anterior
```
**Benefícios:**
- ✅ Fluxo de dados claro
- ✅ Fácil de depurar
- ✅ Ordem de execução previsível

**Limitações:**
- ❌ Mais lento (sem paralelismo)
- ❌ Uma falha bloqueia toda a cadeia
- ❌ Não consegue lidar com tarefas interdependentes

**Exemplos de Uso:**
- Pipeline de criação de conteúdo (pesquisa → escrever → editar → publicar)
- Geração de código (planejar → implementar → testar → implantar)
- Geração de relatórios (coleta de dados → análise → visualização → resumo)

---

### Padrão 2: Coordenação Paralela (Fan-Out/Fan-In)

**Quando usar**: Tarefas independentes podem rodar simultaneamente, resultados combinados ao final.

```mermaid
graph TB
    User[Solicitação do Usuário]
    Orchestrator[Orquestrador]
    Agent1[Agente de Análise]
    Agent2[Agente de Pesquisa]
    Agent3[Agente de Dados]
    Aggregator[Agregador de Resultados]
    Response[Resposta Combinada]
    
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
- ✅ Escala horizontalmente

**Limitações:**
- ⚠️ Resultados podem chegar fora de ordem
- ⚠️ Necessita de lógica de agregação
- ⚠️ Gerenciamento de estado complexo

**Exemplos de Uso:**
- Coleta de dados de múltiplas fontes (APIs + bancos de dados + web scraping)
- Análise competitiva (múltiplos modelos geram soluções, a melhor é selecionada)
- Serviços de tradução (traduzir para múltiplos idiomas simultaneamente)

---

### Padrão 3: Coordenação Hierárquica (Gerente-Trabalhador)

**Quando usar**: Fluxos de trabalho complexos com sub-tarefas, quando há necessidade de delegação.

```mermaid
graph TB
    Master[Orquestrador Mestre]
    Manager1[Gerente de Pesquisa]
    Manager2[Gerente de Conteúdo]
    W1[Raspador Web]
    W2[Analisador de Artigos]
    W3[Redator]
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
- ✅ Lida com fluxos de trabalho complexos
- ✅ Modular e fácil de manter
- ✅ Limites claros de responsabilidade

**Limitações:**
- ⚠️ Arquitetura mais complexa
- ⚠️ Maior latência (múltiplas camadas de coordenação)
- ⚠️ Requer orquestração sofisticada

**Exemplos de Uso:**
- Processamento empresarial de documentos (classificar → roteirizar → processar → arquivar)
- Pipelines de dados em múltiplas etapas (ingestão → limpeza → transformação → análise → relatório)
- Workflows de automação complexos (planejamento → alocação de recursos → execução → monitoramento)

---

### Padrão 4: Coordenação Orientada a Eventos (Publish-Subscribe)

**Quando usar**: Agentes precisam reagir a eventos, desejando baixo acoplamento.

```mermaid
sequenceDiagram
    participant Agent1 as Coletor de Dados
    participant EventBus as Azure Service Bus
    participant Agent2 as Analisador
    participant Agent3 as Notificador
    participant Agent4 as Arquivador
    
    Agent1->>EventBus: Publicar evento "DadosRecebidos"
    EventBus->>Agent2: Assinar: Analisar dados
    EventBus->>Agent3: Assinar: Enviar notificação
    EventBus->>Agent4: Assinar: Arquivar dados
    
    Note over Agent1,Agent4: Todos os assinantes processam de forma independente
    
    Agent2->>EventBus: Publicar evento "AnaliseConcluida"
    EventBus->>Agent3: Assinar: Enviar relatório de análise
```
**Benefícios:**
- ✅ Baixo acoplamento entre agentes
- ✅ Fácil adicionar novos agentes (basta se inscrever)
- ✅ Processamento assíncrono
- ✅ Resiliente (persistência de mensagens)

**Limitações:**
- ⚠️ Consistência eventual
- ⚠️ Depuração complexa
- ⚠️ Desafios de ordenação de mensagens

**Exemplos de Uso:**
- Sistemas de monitoramento em tempo real (alertas, painéis, logs)
- Notificações multicanal (email, SMS, push, Slack)
- Pipelines de processamento de dados (múltiplos consumidores dos mesmos dados)

---

### Padrão 5: Coordenação Baseada em Consenso (Votação/Quórum)

**Quando usar**: É necessário acordo de múltiplos agentes antes de prosseguir.

```mermaid
graph TB
    Input[Tarefa de Entrada]
    Agent1[Agente 1: GPT-4]
    Agent2[Agente 2: Claude]
    Agent3[Agente 3: Gemini]
    Voter[Votador de Consenso]
    Output[Saída Acordada]
    
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
- ✅ Maior acurácia (múltiplas opiniões)
- ✅ Tolerante a falhas (falhas da minoria aceitáveis)
- ✅ Garantia de qualidade incorporada

**Limitações:**
- ❌ Caro (várias chamadas aos modelos)
- ❌ Mais lento (esperando por todos os agentes)
- ⚠️ Necessária resolução de conflitos

**Exemplos de Uso:**
- Moderação de conteúdo (múltiplos modelos revisam o conteúdo)
- Revisão de código (múltiplos linters/analisadores)
- Diagnóstico médico (múltiplos modelos de IA, validação por especialistas)

---

## Visão Geral da Arquitetura

### Sistema Multiagente Completo no Azure

```mermaid
graph TB
    User[Usuário/Cliente de API]
    APIM[Gerenciamento de API do Azure]
    Orchestrator[Serviço Orquestrador<br/>Aplicativo em Contêiner]
    ServiceBus[Service Bus do Azure<br/>Hub de Eventos]
    
    Agent1[Agente de Pesquisa<br/>Aplicativo em Contêiner]
    Agent2[Agente Escritor<br/>Aplicativo em Contêiner]
    Agent3[Agente Analista<br/>Aplicativo em Contêiner]
    Agent4[Agente Revisor<br/>Aplicativo em Contêiner]
    
    CosmosDB[(Cosmos DB<br/>Estado Compartilhado)]
    Storage[Armazenamento do Azure<br/>Artefatos]
    AppInsights[Application Insights<br/>Monitoramento]
    
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
**Componentes Chave:**

| Componente | Propósito | Serviço Azure |
|-----------|---------|---------------|
| **API Gateway** | Ponto de entrada, limitação de taxa, autenticação | API Management |
| **Orquestrador** | Coordena fluxos de trabalho dos agentes | Container Apps |
| **Fila de Mensagens** | Comunicação assíncrona | Service Bus / Event Hubs |
| **Agentes** | Trabalhadores de IA especializados | Container Apps / Functions |
| **Armazenamento de Estado** | Estado compartilhado, rastreamento de tarefas | Cosmos DB |
| **Armazenamento de Artefatos** | Documentos, resultados, logs | Blob Storage |
| **Monitoramento** | Rastreio distribuído, logs | Application Insights |

---

## Pré-requisitos

### Ferramentas Requeridas

```bash
# Verificar Azure Developer CLI
azd version
# ✅ Esperado: azd versão 1.0.0 ou superior

# Verificar Azure CLI
az --version
# ✅ Esperado: azure-cli 2.50.0 ou superior

# Verificar Docker (para testes locais)
docker --version
# ✅ Esperado: versão do Docker 20.10 ou superior
```

### Requisitos do Azure

- Assinatura ativa do Azure
- Permissões para criar:
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB accounts
  - Storage accounts
  - Application Insights

### Conhecimentos Pré-requisitos

Você deve ter concluído:
- [Gerenciamento de Configuração](../chapter-03-configuration/configuration.md)
- [Autenticação & Segurança](../chapter-03-configuration/authsecurity.md)
- [Exemplo de Microsserviços](../../../../examples/microservices)

---

## Guia de Implementação

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

## Aula 1: Padrão de Coordenação Sequencial

### Implementação: Pipeline de Criação de Conteúdo

Vamos construir um pipeline sequencial: Pesquisa → Escrever → Editar → Publicar

### 1. Configuração AZD

**File: `azure.yaml`**

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

**File: `infra/core/servicebus.bicep`**

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

### 3. Gerenciador de Estado Compartilhado

**File: `src/shared/state_manager.py`**

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

### 4. Serviço Orquestrador

**File: `src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# Conexão com o Service Bus
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
    
    # Criar tarefa no armazenamento de estado
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # Enviar mensagem para o agente de pesquisa (primeira etapa)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # Onde enviar os resultados
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

### 5. Agente de Pesquisa

**File: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# Inicializar clientes
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
    
    # Chamar o Azure OpenAI para pesquisa
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # Atualizar estado
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # Enviar para o próximo agente (escritor)
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

**File: `src/agents/writer/app.py`**

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
    
    # Chamar o Azure OpenAI para escrever o artigo
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # Atualizar estado
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # Enviar ao editor
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

**File: `src/agents/editor/app.py`**

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
    
    # Chamar o Azure OpenAI para editar
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # Marcar a tarefa como concluída
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

### 8. Implantar e Testar

```bash
# Inicializar e implantar
azd init
azd up

# Obter URL do orquestrador
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Criar conteúdo
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
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**Verificar progresso da tarefa:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Saída esperada (concluído):**
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

## Aula 2: Padrão de Coordenação Paralela

### Implementação: Agregador de Pesquisa Multi-Fonte

Vamos construir um sistema paralelo que coleta informações de múltiplas fontes simultaneamente.

### Orquestrador Paralelo

**File: `src/orchestrator/parallel_workflow.py`**

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
    
    # Fan-out: Enviar para todos os agentes simultaneamente
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

**File: `src/agents/aggregator/app.py`**

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

# Acompanhar resultados por tarefa
task_results = defaultdict(list)
expected_agents = 4  # web, acadêmico, notícias, social

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # Armazenar resultado
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # Verificar se todos os agentes concluíram (fan-in)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # Combinar resultados
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # Marcar como concluído
        state_manager.complete_task(task_id, aggregated)
        
        # Limpar
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
- ⚡ **4x mais rápido** (agentes rodam simultaneamente)
- 🔄 **Tolerante a falhas** (resultados parciais aceitáveis)
- 📈 **Escalável** (adicione mais agentes facilmente)

---

## Exercícios Práticos

### Exercício 1: Adicionar Tratamento de Timeout ⭐⭐ (Médio)

**Objetivo**: Implementar lógica de timeout para que o agregador não espere para sempre por agentes lentos.

**Passos**:

1. **Adicionar rastreamento de timeout ao agregador:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> expiration_time

def process_result(message_data):
    task_id = message_data['task_id']
    
    # Definir tempo limite no primeiro resultado
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # Verificar se concluído OU expirou
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
        
        # Limpeza
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **Testar com atrasos artificiais:**

```python
# Em um agente, adicione um atraso para simular processamento lento
import time
time.sleep(35)  # Excede o tempo limite de 30 segundos
```

3. **Implantar e verificar:**

```bash
azd deploy aggregator

# Enviar tarefa
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Verifique os resultados após 30 segundos
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Critérios de Sucesso:**
- ✅ A tarefa é concluída após 30 segundos mesmo que agentes estejam incompletos
- ✅ A resposta indica resultados parciais (`"timed_out": true`)
- ✅ Resultados disponíveis são retornados (3 de 4 agentes)

**Tempo**: 20-25 minutos

---

### Exercício 2: Implementar Lógica de Retentativa ⭐⭐⭐ (Avançado)

**Objetivo**: Repetir automaticamente tarefas de agentes que falharam antes de desistir.

**Passos**:

1. **Adicionar rastreamento de retentativas ao orquestrador:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # id_da_mensagem -> contador_de_retentativas

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

2. **Adicionar manipulador de retentativa aos agentes:**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # Processar a mensagem
        process_func(message_data)
        
        # Sucesso - concluído
        receiver.complete_message(message)
        
    except Exception as e:
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # Tentar novamente: abandonar e recolocar na fila com contador incrementado
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # Enviar de volta para a mesma fila com atraso
            time.sleep(5 * (retry_count + 1))  # Recuo exponencial
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # Remover o original
        else:
            # Máximo de tentativas excedido - mover para a fila de mensagens mortas
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **Monitorar a fila de mensagens mortas:**

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

**✅ Critérios de Sucesso:**
- ✅ Tarefas com falha são retentadas automaticamente (até 3 vezes)
- ✅ Backoff exponencial entre retentativas (5s, 10s, 15s)
- ✅ Após o máximo de retentativas, mensagens vão para a fila de mensagens mortas
- ✅ A fila de mensagens mortas pode ser monitorada e reenfileirada

**Tempo**: 30-40 minutos

---

### Exercício 3: Implementar Circuit Breaker ⭐⭐⭐ (Avançado)

**Objetivo**: Prevenir falhas em cascata interrompendo requisições para agentes com falha.

**Passos**:

1. **Criar classe de circuit breaker:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # Operação normal
    OPEN = "open"          # Falhando, rejeitar solicitações
    HALF_OPEN = "half_open"  # Testando se recuperou

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
            # Verificar se o tempo limite expirou
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # Sucesso
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

2. **Aplicar às chamadas dos agentes:**

```python
# No orquestrador
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
        # Continue com outros agentes
```

3. **Testar o circuit breaker:**

```bash
# Simular falhas repetidas (parar um agente)
az containerapp stop --name web-research-agent --resource-group rg-agents

# Enviar várias requisições
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# Verificar logs - deve ver o circuito aberto após 5 falhas
# Use o Azure CLI para logs do Container App:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ Critérios de Sucesso:**
- ✅ Após 5 falhas, o circuito abre (rejeita requisições)
- ✅ Após 60 segundos, o circuito fica meio-aberto (testa recuperação)
- ✅ Outros agentes continuam funcionando normalmente
- ✅ O circuito fecha automaticamente quando o agente se recupera

**Tempo**: 40-50 minutos

---

## Monitoramento e Depuração

### Rastreamento Distribuído com Application Insights

**File: `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# Configurar rastreamento
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# Criar rastreador
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# Configurar registro de logs
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

### Consultas do Application Insights

**Rastrear fluxos de trabalho multiagente:**

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

### Custos do Sistema Multiagente (Estimativas Mensais)

| Componente | Configuração | Custo |
|-----------|--------------|------|
| **Orquestrador** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 Agentes** | 4 Container Apps (0.5 vCPU, 1GB cada) | $60-120 |
| **Service Bus** | Standard tier, 10M messages | $10-20 |
| **Cosmos DB** | Serverless, 5GB storage, 1M RUs | $25-50 |
| **Blob Storage** | 10GB storage, 100K operations | $5-10 |
| **Application Insights** | 5GB ingestion | $10-15 |
| **Azure OpenAI** | GPT-4, 10M tokens | $100-300 |
| **Total** | | **$240-565/mês** |

### Estratégias de Otimização de Custos

1. **Use serverless onde possível:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Escale agentes para zero quando ociosos:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Use batch para o Service Bus:**
   ```python
   # Enviar mensagens em lotes (mais barato)
   sender.send_messages([message1, message2, message3])
   ```

4. **Cacheie resultados usados com frequência:**
   ```python
   # Use o Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Melhores Práticas

### ✅ FAÇA:

1. **Use operações idempotentes**
   ```python
   # O agente pode processar com segurança a mesma mensagem várias vezes
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # Processando tarefa...
   ```

2. **Implemente logging abrangente**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Use IDs de correlação**
   ```python
   # Propagar task_id por todo o fluxo de trabalho
   message_data = {
       'task_id': task_id,  # ID de correlação
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Defina TTL (time-to-live) das mensagens**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Monitore filas de mensagens mortas**
   ```python
   # Monitoramento regular de mensagens com falha
   monitor_dead_letters()
   ```

### ❌ NÃO FAÇA:

1. **Não crie dependências circulares**
   ```python
   # ❌ RUIM: Agente A → Agente B → Agente A (loop infinito)
   # ✅ BOM: Defina claramente um grafo direcionado acíclico (DAG)
   ```

2. **Não bloqueie threads dos agentes**
   ```python
   # ❌ RUIM: Espera síncrona
   while not task_complete:
       time.sleep(1)
   
   # ✅ BOM: Use callbacks da fila de mensagens
   ```

3. **Não ignore falhas parciais**
   ```python
   # ❌ RUIM: Fazer com que todo o fluxo de trabalho falhe se um agente falhar
   # ✅ BOM: Retornar resultados parciais com indicadores de erro
   ```

4. **Não use retentativas infinitas**
   ```python
   # ❌ RUIM: tentar indefinidamente
   # ✅ BOM: max_retries = 3, então enviar para a dead letter
   ```

---

## Guia de Solução de Problemas

### Problema: Mensagens presas na fila

**Sintomas:**
- Mensagens se acumulam na fila
- Agentes não estão processando
- Status da tarefa travado em "pending"

**Diagnóstico:**
```bash
# Verificar a profundidade da fila
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Verificar os logs do agente usando o Azure CLI
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**Soluções:**

1. **Aumentar réplicas do agente:**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Verificar dead letter queue:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problema: Tempo limite da tarefa/nunca conclui

**Sintomas:**
- Status da tarefa permanece "in_progress"
- Alguns agentes concluem, outros não
- Sem mensagens de erro

**Diagnóstico:**
```bash
# Verificar estado da tarefa
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Verificar o Application Insights
# Executar consulta: traces | where customDimensions.task_id == "..."
```

**Soluções:**

1. **Implemente timeout no agregador (Exercício 1)**

2. **Verifique falhas de agentes usando o Azure Monitor:**
   ```bash
   # Veja os logs com o azd monitor
   azd monitor --logs
   
   # Ou use o Azure CLI para verificar os logs de um Container App específico
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Verifique se todos os agentes estão em execução:**
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
- [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### Próximos Passos Neste Curso
- ← Anterior: [Capacity Planning](capacity-planning.md)
- → Próximo: [SKU Selection](sku-selection.md)
- 🏠 [Início do Curso](../../README.md)

### Exemplos Relacionados
- [Microservices Example](../../../../examples/microservices) - Padrões de comunicação entre serviços
- [Azure OpenAI Example](../../../../examples/azure-openai-chat) - Integração de IA

---

## Resumo

**Você aprendeu:**
- ✅ Cinco padrões de coordenação (sequencial, paralelo, hierárquico, orientado a eventos, por consenso)
- ✅ Arquitetura multi-agente no Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Gerenciamento de estado entre agentes distribuídos
- ✅ Tratamento de timeouts, tentativas e circuit breakers
- ✅ Monitoramento e depuração de sistemas distribuídos
- ✅ Estratégias de otimização de custos

**Principais Conclusões:**
1. **Escolha o padrão certo** - Sequencial para fluxos ordenados, paralelo para velocidade, orientado a eventos para flexibilidade
2. **Gerencie o estado com cuidado** - Use Cosmos DB ou similar para estado compartilhado
3. **Trate falhas de forma adequada** - Timeouts, tentativas, circuit breakers, filas de dead-letter
4. **Monitore tudo** - O rastreamento distribuído é essencial para depuração
5. **Otimize custos** - Escale para zero, use serverless, implemente cache

**Próximos Passos:**
1. Complete os exercícios práticos
2. Construa um sistema multi-agente para seu caso de uso
3. Estude [SKU Selection](sku-selection.md) para otimizar desempenho e custos

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Aviso de isenção de responsabilidade:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se uma tradução profissional realizada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->