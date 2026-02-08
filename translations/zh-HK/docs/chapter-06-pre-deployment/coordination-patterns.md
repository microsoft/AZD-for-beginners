# 多代理協調模式

⏱️ **預計時間**: 60-75 分鐘 | 💰 **預計成本**: 約 $100-300/月 | ⭐ **複雜度**: 進階

**📚 學習路徑:**
- ← 上一節: [容量規劃](capacity-planning.md) - 資源大小與擴展策略
- 🎯 **你在這裡**: 多代理協調模式（編排、通訊、狀態管理）
- → 下一節: [SKU 選擇](sku-selection.md) - 選擇合適的 Azure 服務
- 🏠 [課程主頁](../../README.md)

---

## 你將學到的內容

完成本課程後，你將會：
- 了解 **多代理架構** 模式以及何時使用它們
- 實作 **編排模式**（集中式、去中心化、分層式）
- 設計 **代理通訊** 策略（同步、非同步、事件驅動）
- 管理分散代理之間的 **共享狀態**
- 使用 AZD 在 Azure 上部署 **多代理系統**
- 在真實 AI 情境中應用 **協調模式**
- 監控並除錯分散式代理系統

## 為何多代理協調很重要

### 演進：從單一代理到多代理

**單一代理（簡單）:**
```
User → Agent → Response
```
- ✅ 易於理解與實作
- ✅ 適合簡單任務，執行快速
- ❌ 受限於單一模型的能力
- ❌ 無法並行處理複雜任務
- ❌ 無專精分工

**多代理系統（進階）:**
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
- ✅ 每個代理專精於特定任務
- ✅ 並行執行以提升速度
- ✅ 模組化且易於維護
- ✅ 更善於處理複雜工作流程
- ⚠️ 需要協調邏輯

**類比**：單一代理像是一個人做所有事情。多代理像是一個團隊，每個成員有專門技能（研究員、程式員、審稿者、寫手）共同合作。

---

## 核心協調模式

### 模式 1：序列協調（責任鍊）

**適用時機**: 任務必須以特定順序完成，每個代理基於前一個輸出進行處理。

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as 研究代理
    participant Agent2 as 撰稿代理
    participant Agent3 as 編輯代理
    
    User->>Orchestrator: "撰寫有關人工智能的文章"
    Orchestrator->>Agent1: 研究主題
    Agent1-->>Orchestrator: 研究結果
    Orchestrator->>Agent2: 撰寫草稿 (使用研究結果)
    Agent2-->>Orchestrator: 文章草稿
    Orchestrator->>Agent3: 編輯及改進
    Agent3-->>Orchestrator: 最終文章
    Orchestrator-->>User: 潤飾後的文章
    
    Note over User,Agent3: 順序：每一步都會等候前一步完成
```
**優點:**
- ✅ 資料流程清晰
- ✅ 易於除錯
- ✅ 執行順序可預測

**限制:**
- ❌ 較慢（無並行）
- ❌ 一個失敗會阻塞整個鍊
- ❌ 無法處理相互依賴的任務

**範例使用情境:**
- 內容創作流程（研究 → 撰寫 → 編輯 → 發佈）
- 程式碼生成（規劃 → 實作 → 測試 → 部署）
- 報告生成（資料收集 → 分析 → 視覺化 → 摘要）

---

### 模式 2：並行協調（Fan-Out/Fan-In）

**適用時機**: 可以同時執行的相互獨立任務，最後將結果合併。

```mermaid
graph TB
    User[使用者請求]
    Orchestrator[協調者]
    Agent1[分析代理]
    Agent2[研究代理]
    Agent3[資料代理]
    Aggregator[結果彙整器]
    Response[綜合回應]
    
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
**優點:**
- ✅ 快速（並行執行）
- ✅ 容錯（可接受部分結果）
- ✅ 橫向擴展性佳

**限制:**
- ⚠️ 結果可能會亂序到達
- ⚠️ 需要聚合邏輯
- ⚠️ 狀態管理較複雜

**範例使用情境:**
- 多來源資料蒐集（API + 資料庫 + 網頁爬蟲）
- 競爭式分析（多個模型產生解法，選擇最佳）
- 翻譯服務（同時翻譯成多種語言）

---

### 模式 3：分層協調（Manager-Worker）

**適用時機**: 有複雜工作流程與子任務，需要委派。

```mermaid
graph TB
    Master[主控協調器]
    Manager1[研究經理]
    Manager2[內容經理]
    W1[網頁爬蟲]
    W2[論文分析器]
    W3[撰稿者]
    W4[編輯]
    
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
**優點:**
- ✅ 處理複雜工作流程
- ✅ 模組化且易於維護
- ✅ 責任界線清晰

**限制:**
- ⚠️ 架構更複雜
- ⚠️ 延遲較高（多層協調）
- ⚠️ 需要更複雜的編排

**範例使用情境:**
- 企業文件處理（分類 → 路由 → 處理 → 歸檔）
- 多階段資料管線（攝取 → 清理 → 轉換 → 分析 → 報告）
- 複雜自動化工作流程（規劃 → 資源分配 → 執行 → 監控）

---

### 模式 4：事件驅動協調（發布-訂閱）

**適用時機**: 代理需要對事件做出反應，且希望鬆耦合。

```mermaid
sequenceDiagram
    participant Agent1 as 資料收集器
    participant EventBus as Azure 服務總線
    participant Agent2 as 分析器
    participant Agent3 as 通知者
    participant Agent4 as 歸檔器
    
    Agent1->>EventBus: 發佈 "資料已接收" 事件
    EventBus->>Agent2: 訂閱: 分析資料
    EventBus->>Agent3: 訂閱: 發送通知
    EventBus->>Agent4: 訂閱: 歸檔資料
    
    Note over Agent1,Agent4: 所有訂閱者獨立處理
    
    Agent2->>EventBus: 發佈 "分析完成" 事件
    EventBus->>Agent3: 訂閱: 發送分析報告
```
**優點:**
- ✅ 代理之間鬆耦合
- ✅ 容易新增新代理（只要訂閱即可）
- ✅ 非同步處理
- ✅ 高韌性（訊息持久化）

**限制:**
- ⚠️ 最終一致性
- ⚠️ 除錯較複雜
- ⚠️ 訊息排序挑戰

**範例使用情境:**
- 即時監控系統（告警、儀表板、日誌）
- 多通道通知（Email、SMS、推播、Slack）
- 資料處理管線（多個消費者消費相同資料）

---

### 模式 5：共識式協調（投票/法定人數）

**適用時機**: 在繼續執行前需要多個代理達成共識。

```mermaid
graph TB
    Input[輸入任務]
    Agent1[代理人 1：GPT-4]
    Agent2[代理人 2：Claude]
    Agent3[代理人 3：Gemini]
    Voter[共識投票者]
    Output[已達成共識的輸出]
    
    Input --> Agent1
    Input --> Agent2
    Input --> Agent3
    Agent1 --> Voter
    Agent2 --> Voter
    Agent3 --> Voter
    Voter --> Output
    
    style Voter fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
```
**優點:**
- ✅ 更高的準確性（多方意見）
- ✅ 容錯（少數失敗可接受）
- ✅ 內建品質保證

**限制:**
- ❌ 成本較高（多次模型呼叫）
- ❌ 較慢（需等待多方回應）
- ⚠️ 需要衝突解決機制

**範例使用情境:**
- 內容審核（多個模型共同審查內容）
- 程式碼審查（多個 linter/分析器）
- 醫療診斷（多個 AI 模型與專家驗證）

---

## 架構概覽

### 完整的 Azure 多代理系統

```mermaid
graph TB
    User[使用者/API 用戶端]
    APIM[Azure API 管理]
    Orchestrator[協調服務<br/>容器應用]
    ServiceBus[Azure 服務總線<br/>事件中心]
    
    Agent1[研究代理<br/>容器應用]
    Agent2[寫作代理<br/>容器應用]
    Agent3[分析代理<br/>容器應用]
    Agent4[審閱代理<br/>容器應用]
    
    CosmosDB[(Cosmos DB<br/>共用狀態)]
    Storage[Azure 儲存體<br/>產物]
    AppInsights[Application Insights<br/>監控]
    
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
**關鍵組件:**

| Component | Purpose | Azure Service |
|-----------|---------|---------------|
| **API Gateway** | 入口點、流量限制、認證 | API Management |
| **Orchestrator** | 協調代理工作流程 | Container Apps |
| **Message Queue** | 非同步通訊 | Service Bus / Event Hubs |
| **Agents** | 專精的 AI 工作者 | Container Apps / Functions |
| **State Store** | 共享狀態、任務追蹤 | Cosmos DB |
| **Artifact Storage** | 文件、結果、日誌 | Blob Storage |
| **Monitoring** | 分散式追蹤、日誌 | Application Insights |

---

## 前置需求

### 所需工具

```bash
# 驗證 Azure Developer CLI
azd version
# ✅ 預期：azd 版本 1.0.0 或以上

# 驗證 Azure CLI
az --version
# ✅ 預期：azure-cli 2.50.0 或以上

# 驗證 Docker（供本地測試）
docker --version
# ✅ 預期：Docker 版本 20.10 或以上
```

### Azure 要求

- 有效的 Azure 訂閱
- 有權限建立以下項目：
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB accounts
  - Storage accounts
  - Application Insights

### 知識前提

你應該已完成：
- [組態管理](../chapter-03-configuration/configuration.md)
- [驗證與安全](../chapter-03-configuration/authsecurity.md)
- [微服務範例](../../../../examples/microservices)

---

## 實作指南

### 專案結構

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

## 課程 1：序列協調模式

### 實作：內容創作管線

讓我們建立一個序列管線：Research → Write → Edit → Publish

### 1. AZD 設定

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

### 2. 基礎建設：使用 Service Bus 做協調

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

### 3. 共享狀態管理器

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

### 4. 編排服務

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

# Service Bus 連線
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
    
    # 在狀態儲存庫中建立任務
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # 向研究代理發送訊息（第一步）
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # 將結果發送到哪裡
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

### 5. 研究代理

**File: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# 初始化客戶端
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
    
    # 呼叫 Azure OpenAI 進行研究
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # 更新狀態
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # 傳送到下一個代理（撰寫者）
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

### 6. 撰寫代理

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
    
    # 呼叫 Azure OpenAI 撰寫文章
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # 更新狀態
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # 發送給編輯
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

### 7. 編輯代理

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
    
    # 呼叫 Azure OpenAI 進行編輯
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # 將任務標記為已完成
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

### 8. 部署與測試

```bash
# 初始化並部署
azd init
azd up

# 取得編排器的 URL
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# 建立內容
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ 預期輸出：**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**檢查任務進度：**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ 預期輸出（已完成）：**
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

## 課程 2：並行協調模式

### 實作：多來源研究彙整器

讓我們建立一個並行系統，同時從多個來源蒐集資訊。

### 並行編排器

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
    
    # 扇出: 同時發送至所有代理程式
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

### 聚合邏輯

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

# 追蹤每項任務的結果
task_results = defaultdict(list)
expected_agents = 4  # 網頁、學術、新聞、社交

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # 儲存結果
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # 檢查是否所有代理已完成（匯聚）
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # 合併結果
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # 標記為完成
        state_manager.complete_task(task_id, aggregated)
        
        # 清理
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

**並行模式的優勢：**
- ⚡ **快 4 倍**（代理同時執行）
- 🔄 **容錯**（可接受部分結果）
- 📈 **可擴充**（輕易新增更多代理）

---

## 實作練習

### 練習 1：加入逾時處理 ⭐⭐（中等）

**目標**：實作逾時邏輯，讓 aggregator 不會無限期等待慢速代理。

**步驟**：

1. **在 aggregator 中加入逾時追蹤：**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> 到期時間

def process_result(message_data):
    task_id = message_data['task_id']
    
    # 為第一個結果設定逾時
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # 檢查是否完成或已逾時
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
        
        # 清理
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **以人工延遲測試：**

```python
# 在其中一個代理中加入延遲，以模擬處理緩慢
import time
time.sleep(35)  # 超過 30 秒的逾時限制
```

3. **部署並驗證：**

```bash
azd deploy aggregator

# 提交任務
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# 30 秒後檢查結果
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ 成功標準：**
- ✅ 即使代理未完成，任務在 30 秒後仍會完成
- ✅ 回應指出部分結果逾時（`"timed_out": true`）
- ✅ 回傳可得的結果（4 個代理中 3 個）

**時間**：20-25 分鐘

---

### 練習 2：實作重試邏輯 ⭐⭐⭐（進階）

**目標**：在放棄前，自動重試失敗的代理任務。

**步驟**：

1. **在編排器中加入重試追蹤：**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # message_id -> 重試次數

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

2. **在代理中加入重試處理：**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # 處理訊息
        process_func(message_data)
        
        # 成功 - 完成
        receiver.complete_message(message)
        
    except Exception as e:
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # 重試: 放棄並將訊息重新加入佇列，重試次數遞增
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # 延遲後發回同一佇列
            time.sleep(5 * (retry_count + 1))  # 指數退避
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # 移除原始訊息
        else:
            # 超過最大重試次數 - 移至死信佇列
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **監控死信佇列：**

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

**✅ 成功標準：**
- ✅ 失敗任務會自動重試（最多 3 次）
- ✅ 重試之間採用指數回退（5s、10s、15s）
- ✅ 超出最大重試次數後，訊息會進入死信佇列
- ✅ 可監控並重播死信佇列

**時間**：30-40 分鐘

---

### 練習 3：實作斷路器（Circuit Breaker） ⭐⭐⭐（進階）

**目標**：透過停止對失敗代理的請求，避免失敗連鎖擴散。

**步驟**：

1. **建立斷路器類別：**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # 正常運作
    OPEN = "open"          # 故障，拒絕請求
    HALF_OPEN = "half_open"  # 測試是否已恢復

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
            # 檢查是否已超時
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # 成功
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

2. **應用於代理呼叫：**

```python
# 在編排器中
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
        # 繼續處理其他代理
```

3. **測試斷路器：**

```bash
# 模擬重複失敗 (停止一個代理)
az containerapp stop --name web-research-agent --resource-group rg-agents

# 發送多個請求
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# 檢查日誌 - 在 5 次失敗後應該會看到斷路器開啟
# 使用 Azure CLI 查看 Container App 日誌:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ 成功標準：**
- ✅ 發生 5 次失敗後，斷路器打開（拒絕請求）
- ✅ 60 秒後，斷路器進入半開狀態（測試恢復）
- ✅ 其他代理可正常運作
- ✅ 當代理恢復時，斷路器會自動關閉

**時間**：40-50 分鐘

---

## 監控與除錯

### 使用 Application Insights 的分散式追蹤

**File: `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# 設定追蹤
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# 建立追蹤器
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# 設定日誌記錄
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

### Application Insights 查詢

**追蹤多代理工作流程：**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**代理效能比較：**

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

**失敗分析：**

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

## 成本分析

### 多代理系統成本（每月估算）

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

### 成本優化策略

1. **在可能的情況下使用無伺服器：**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **閒置時讓代理縮減到零：**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **對 Service Bus 使用批次處理：**
   ```python
   # 分批發送訊息（較便宜）
   sender.send_messages([message1, message2, message3])
   ```

4. **快取常用結果：**
   ```python
   # 使用 Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## 最佳實務

### ✅ 建議做的事：

1. **使用冪等（idempotent）操作**
   ```python
   # 代理可以安全地多次處理相同的訊息
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # 處理任務...
   ```

2. **實作完整的日誌記錄**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **使用關聯 ID（correlation IDs）**
   ```python
   # 在整個工作流程中傳遞 task_id
   message_data = {
       'task_id': task_id,  # 關聯 ID
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **設定訊息 TTL（存活時間）**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **監控死信佇列**
   ```python
   # 定期監察失敗的訊息
   monitor_dead_letters()
   ```

### ❌ 不建議做的事：

1. **不要建立環狀依賴**
   ```python
   # ❌ 唔好：代理 A → 代理 B → 代理 A（無限循環）
   # ✅ 好：定義清晰的有向無環圖（DAG）
   ```

2. **不要阻塞代理線程**
   ```python
   # ❌ 不建議：同步等待
   while not task_complete:
       time.sleep(1)
   
   # ✅ 建議：使用訊息佇列回呼
   ```

3. **不要忽略部分失敗**
   ```python
   # ❌ 壞做法：如果某個代理失敗就令整個工作流程失敗
   # ✅ 好做法：返回部分結果，並標示錯誤
   ```

4. **不要使用無限重試**
   ```python
   # ❌ 唔好：無限重試
   # ✅ 好：max_retries = 3，然後放入死信隊列
   ```

---

## 疑難排解指南

### 問題：訊息停留在佇列中

**症狀：**
- 訊息在佇列中累積
- 代理未處理
- 工作狀態停留在 "待處理"

**診斷：**
```bash
# 檢查佇列深度
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# 使用 Azure CLI 檢查代理日誌
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**解決方法：**

1. **增加代理副本數：**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **檢查死信佇列：**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### 問題：任務超時／永遠無法完成

**症狀：**
- 工作狀態保持在 "進行中"
- 部分代理完成，其他則未完成
- 沒有錯誤訊息

**診斷：**
```bash
# 檢查任務狀態
curl $ORCHESTRATOR_URL/task/$TASK_ID

# 檢查 Application Insights
# 執行查詢: traces | where customDimensions.task_id == "..."
```

**解決方法：**

1. **在聚合器實作超時（練習 1）**

2. **使用 Azure Monitor 檢查代理失敗：**
   ```bash
   # 透過 azd monitor 檢視日誌
   azd monitor --logs
   
   # 或者使用 Azure CLI 檢視特定 Container App 的日誌
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **確認所有代理正在執行：**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## 了解更多

### 官方文件
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### 本課程的下一步
- ← 上一步： [容量規劃](capacity-planning.md)
- → 下一步： [SKU 選擇](sku-selection.md)
- 🏠 [課程主頁](../../README.md)

### 相關範例
- [微服務範例](../../../../examples/microservices) - 服務通訊模式
- [Azure OpenAI 範例](../../../../examples/azure-openai-chat) - AI 整合

---

## 總結

**你已學會：**
- ✅ 五種協調模式（順序、平行、階層、事件驅動、共識）
- ✅ Azure 上的多代理架構（Service Bus、Cosmos DB、Container Apps）
- ✅ 跨分散式代理的狀態管理
- ✅ 超時處理、重試與斷路器
- ✅ 分散式系統的監控與除錯
- ✅ 成本優化策略

**主要重點：**
1. **選擇合適的模式** - 有序工作流使用順序模式，追求速度使用平行模式，追求彈性使用事件驅動模式
2. **謹慎管理狀態** - 使用 Cosmos DB 或類似方案作為共用狀態存放
3. **優雅處理失敗** - 超時、重試、斷路器、死信佇列
4. **監控一切** - 分散式追蹤對除錯至關重要
5. **優化成本** - 支援自動縮減至零、使用無伺服器、實作快取

**下一步：**
1. 完成實作練習
2. 為你的使用情境建立一個多代理系統
3. 研讀 [SKU 選擇](sku-selection.md) 以優化效能與成本

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已透過 AI 翻譯服務「Co-op Translator」(https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原文應被視為具權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們不會對因使用本翻譯而導致的任何誤解或誤譯負上責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->