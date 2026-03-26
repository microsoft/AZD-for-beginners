# 多代理協調模式

⏱️ <strong>預計時間</strong>：60-75 分鐘 | 💰 <strong>預計費用</strong>：約$100-300/月 | ⭐ <strong>複雜度</strong>：進階

**📚 學習路徑：**
- ← 上一課： [容量規劃](capacity-planning.md) - 資源大小與擴展策略
- 🎯 <strong>當前位置</strong>：多代理協調模式（編排、通訊、狀態管理）
- → 下一課： [SKU 選擇](sku-selection.md) - 選擇合適的 Azure 服務
- 🏠 [課程首頁](../../README.md)

---

## 學習內容

完成此課程後，您將：
- 了解 <strong>多代理架構</strong> 模式及其應用時機
- 實作 <strong>編排模式</strong>（集中式、分散式、階層式）
- 設計 <strong>代理通訊</strong> 策略（同步、非同步、事件驅動）
- 管理分散代理間的 <strong>共享狀態</strong>
- 在 Azure 上使用 AZD 部署 <strong>多代理系統</strong>
- 應用 <strong>協調模式</strong> 在真實世界 AI 場景中
- 監控並除錯分布式代理系統

## 為何多代理協調重要

### 演進：從單一代理到多代理

**單一代理（簡單）：**
```
User → Agent → Response
```
- ✅ 易於理解與實作
- ✅ 簡單任務執行快速
- ❌ 受限於單一模型能力
- ❌ 複雜任務無法並行處理
- ❌ 無專門化

**多代理系統（進階）：**
```mermaid
graph TD
    Orchestrator[統籌者] --> Agent1[代理1<br/>計劃]
    Orchestrator --> Agent2[代理2<br/>編碼]
    Orchestrator --> Agent3[代理3<br/>審查]
```- ✅ 針對特定任務的專門化代理
- ✅ 並行執行以提高速度
- ✅ 模組化且易於維護
- ✅ 更擅長複雜工作流程
- ⚠️ 需要協調邏輯

<strong>類比</strong>：單一代理就像一個人做所有事情。多代理是像團隊，每位成員有專長（研究員、程式設計師、審閱者、寫手）共同合作。

---

## 核心協調模式

### 模式 1：序列協調（責任鏈）

<strong>使用時機</strong>：任務須依特定順序完成，每個代理基於前一個輸出運作。

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as 研究代理人
    participant Agent2 as 撰寫代理人
    participant Agent3 as 編輯代理人
    
    User->>Orchestrator: "撰寫關於人工智能的文章"
    Orchestrator->>Agent1: 研究主題
    Agent1-->>Orchestrator: 研究結果
    Orchestrator->>Agent2: 撰寫草稿（使用研究）
    Agent2-->>Orchestrator: 文章草稿
    Orchestrator->>Agent3: 編輯及改進
    Agent3-->>Orchestrator: 最終文章
    Orchestrator-->>User: 精修文章
    
    Note over User,Agent3: 順序執行：每步等待前一步完成
```
**優點：**
- ✅ 資料流清晰
- ✅ 易於除錯
- ✅ 執行順序可預測

**限制：**
- ❌ 較慢（無並行）
- ❌ 一個失敗阻斷整條鏈
- ❌ 無法處理相互依賴任務

**示例案例：**
- 內容製作流程（研究 → 撰寫 → 編輯 → 發布）
- 程式碼生成（規劃 → 實作 → 測試 → 部署）
- 報告製作（資料收集 → 分析 → 視覺化 → 摘要）

---

### 模式 2：並行協調（扇出/扇入）

<strong>使用時機</strong>：獨立任務可同時執行，結果最後彙整。

```mermaid
graph TB
    User[用戶請求]
    Orchestrator[協調者]
    Agent1[分析代理]
    Agent2[研究代理]
    Agent3[數據代理]
    Aggregator[結果彙總器]
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
**優點：**
- ✅ 快速（並行執行）
- ✅ 容錯（可接受部分結果）
- ✅ 橫向擴展

**限制：**
- ⚠️ 結果可能非順序到達
- ⚠️ 需彙整邏輯
- ⚠️ 複雜的狀態管理

**示例案例：**
- 多來源資料收集（API + DB + 網頁爬蟲）
- 競爭分析（多模型產出方案，選最優）
- 翻譯服務（多語言同時翻譯）

---

### 模式 3：階層協調（管理者-工作者）

<strong>使用時機</strong>：複雜工作流程有多重子任務，需要委派。

```mermaid
graph TB
    Master[主控協調器]
    Manager1[研究經理]
    Manager2[內容經理]
    W1[網頁爬蟲]
    W2[論文分析器]
    W3[撰稿人]
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
**優點：**
- ✅ 處理複雜工作流程
- ✅ 模組化且易維護
- ✅ 責任分界明確

**限制：**
- ⚠️ 架構較複雜
- ⚠️ 延遲較高（多層協調）
- ⚠️ 需要精密編排

**示例案例：**
- 企業文件處理（分類 → 路由 → 處理 → 歸檔）
- 多階段資料管線（攝取 → 清理 → 轉換 → 分析 → 報告）
- 複雜自動化流程（規劃 → 資源分配 → 執行 → 監控）

---

### 模式 4：事件驅動協調（發布-訂閱）

<strong>使用時機</strong>：代理需對事件反應，並且希望鬆耦合。

```mermaid
sequenceDiagram
    participant Agent1 as 數據收集器
    participant EventBus as Azure 服務總線
    participant Agent2 as 分析器
    participant Agent3 as 通知器
    participant Agent4 as 歸檔器
    
    Agent1->>EventBus: 發佈 "數據已接收" 事件
    EventBus->>Agent2: 訂閱：分析數據
    EventBus->>Agent3: 訂閱：發送通知
    EventBus->>Agent4: 訂閱：歸檔數據
    
    Note over Agent1,Agent4: 所有訂閱者獨立處理
    
    Agent2->>EventBus: 發佈 "分析完成" 事件
    EventBus->>Agent3: 訂閱：發送分析報告
```
**優點：**
- ✅ 代理間鬆耦合
- ✅ 新代理易於添加（只要訂閱）
- ✅ 非同步處理
- ✅ 高韌性（訊息持久化）

**限制：**
- ⚠️ 最終一致性
- ⚠️ 除錯較複雜
- ⚠️ 訊息排序挑戰

**示例案例：**
- 即時監控系統（警報、儀表板、日誌）
- 多通道通知（電子郵件、簡訊、推播、Slack）
- 資料處理管線（多使用者消費相同資料）

---

### 模式 5：共識型協調（投票/法定人數）

<strong>使用時機</strong>：需多代理共識後才能進行。

```mermaid
graph TB
    Input[輸入任務]
    Agent1[代理 1：gpt-4.1]
    Agent2[代理 2：Claude]
    Agent3[代理 3：Gemini]
    Voter[共識投票者]
    Output[一致輸出]
    
    Input --> Agent1
    Input --> Agent2
    Input --> Agent3
    Agent1 --> Voter
    Agent2 --> Voter
    Agent3 --> Voter
    Voter --> Output
    
    style Voter fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
```
**優點：**
- ✅ 精準度更高（多意見綜合）
- ✅ 容錯能力強（少部分失敗不影響）
- ✅ 內建品質保障

**限制：**
- ❌ 成本高（多模型呼叫）
- ❌ 較慢（需等待所有代理）
- ⚠️ 需衝突解決機制

**示例案例：**
- 內容審核（多模型審查內容）
- 程式碼審查（多 linters/分析器）
- 醫療診斷（多 AI 模型與專家驗證）

---

## 架構概覽

### 完整 Azure 多代理系統

```mermaid
graph TB
    User[用戶/API 客戶端]
    APIM[Azure API 管理]
    Orchestrator[協調器服務<br/>容器應用程式]
    ServiceBus[Azure 服務匯流排<br/>事件中心]
    
    Agent1[研究代理<br/>容器應用程式]
    Agent2[寫作代理<br/>容器應用程式]
    Agent3[分析代理<br/>容器應用程式]
    Agent4[審閱代理<br/>容器應用程式]
    
    CosmosDB[(Cosmos DB<br/>共享狀態)]
    Storage[Azure 儲存體<br/>產物]
    AppInsights[應用程式洞察<br/>監控]
    
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
**主要元件：**

| 元件 | 目的 | Azure 服務 |
|-----------|---------|---------------|
| **API 閘道** | 入口點，流量限制，認證 | API Management |
| <strong>編排者</strong> | 協調代理工作流程 | Container Apps |
| <strong>訊息佇列</strong> | 非同步通訊 | Service Bus / Event Hubs |
| <strong>代理</strong> | 專門化 AI 工作者 | Container Apps / Functions |
| <strong>狀態存儲</strong> | 共享狀態，任務追蹤 | Cosmos DB |
| <strong>產物存儲</strong> | 文件、結果、日誌 | Blob Storage |
| <strong>監控</strong> | 分散式追蹤、日誌 | Application Insights |

---

## 先決條件

### 必備工具

```bash
# 驗證 Azure Developer CLI
azd version
# ✅ 預期：azd 版本 1.0.0 或以上

# 驗證 Azure CLI
az --version
# ✅ 預期：azure-cli 2.50.0 或以上

# 驗證 Docker（用於本地測試）
docker --version
# ✅ 預期：Docker 版本 20.10 或以上
```

### Azure 要求

- 具有效的 Azure 訂閱
- 有權限建立：
  - Container Apps
  - Service Bus 命名空間
  - Cosmos DB 帳號
  - 儲存帳號
  - Application Insights

### 知識先備

應已完成：
- [設定管理](../chapter-03-configuration/configuration.md)
- [認證與安全](../chapter-03-configuration/authsecurity.md)
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

### 實作：內容製作管線

建立一個序列管線：研究 → 撰寫 → 編輯 → 發布

### 1. AZD 設定

**檔案：`azure.yaml`**

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

### 2. 基礎設施：用於協調的 Service Bus

**檔案：`infra/core/servicebus.bicep`**

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

**檔案：`src/shared/state_manager.py`**

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

**檔案：`src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# 服務總線連接
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
    
    # 在狀態儲存中建立任務
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # 發送訊息到研究代理（第一步）
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # 發送結果的位置
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

**檔案：`src/agents/research/app.py`**

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
    
    # 呼叫 Microsoft Foundry 模型進行研究
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
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
    
    # 發送到下一個代理（寫手）
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

**檔案：`src/agents/writer/app.py`**

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
    
    # 調用 Microsoft Foundry 模型來撰寫文章
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
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
    
    # 發送給編輯器
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

**檔案：`src/agents/editor/app.py`**

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
    
    # 呼叫 Microsoft Foundry 模型進行編輯
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # 標記任務為完成
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
# 選項 A：基於模板的部署
azd init
azd up

# 選項 B：代理程序清單部署（需要擴展）
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> 請參閱 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 了解所有 `azd ai` 旗標與選項。

```bash
# 獲取協調器網址
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

**✅ 預期輸出（完成）：**
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

建立一個並行系統，能同時從多個來源蒐集資訊。

### 並行編排器

**檔案：`src/orchestrator/parallel_workflow.py`**

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
    
    # 傳送給所有代理，同步發送
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

### 彙整邏輯

**檔案：`src/agents/aggregator/app.py`**

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

# 跟蹤每個任務的結果
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
    
    # 檢查所有代理是否完成（扇入）
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # 合併結果
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # 標記完成
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

**並行模式優勢：**
- ⚡ **快4倍**（代理同時運行）
- 🔄 <strong>容錯</strong>（可接受部分結果）
- 📈 <strong>可擴展</strong>（輕鬆增加代理）

---

## 實戰練習

### 練習 1：新增超時處理 ⭐⭐（中階）

<strong>目標</strong>：實作超時邏輯，避免費時代理導致彙整器無限等待。

<strong>步驟</strong>：

1. **新增超時追蹤至彙整器：**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # 任務ID -> 到期時間

def process_result(message_data):
    task_id = message_data['task_id']
    
    # 在第一個結果上設定超時
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # 檢查是否完成或已超時
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
# 喺一個代理中，加插延遲以模擬慢速處理
import time
time.sleep(35)  # 超過30秒超時限制
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

**✅ 完成標準：**
- ✅ 即使代理未全完成，30秒後任務完成
- ✅ 回應指示部分結果（`"timed_out": true`）
- ✅ 回傳可用結果（4個代理中3個）

<strong>時間</strong>：20-25 分鐘

---

### 練習 2：實作重試機制 ⭐⭐⭐（進階）

<strong>目標</strong>：對失敗的代理任務自動重試，直到放棄。

<strong>步驟</strong>：

1. **新增重試追蹤至編排器：**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # 訊息 ID -> 重試次數

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

2. **新增代理重試處理器：**

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
            # 重試：放棄並重新加入隊列，次數增加
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # 延遲後發回相同隊列
            time.sleep(5 * (retry_count + 1))  # 指數退避
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # 刪除原始項目
        else:
            # 超過最大重試次數 - 移至死信隊列
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

**✅ 完成標準：**
- ✅ 失敗任務自動重試（最多3次）
- ✅ 重試採用指數退避（5秒、10秒、15秒）
- ✅ 達最大重試後，訊息發送至死信佇列
- ✅ 可監控死信佇列並重播

<strong>時間</strong>：30-40 分鐘

---

### 練習 3：實作斷路器 ⭐⭐⭐（進階）

<strong>目標</strong>：避免系統連鎖失效，暫停向失敗代理發送請求。

<strong>步驟</strong>：

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
            # 檢查是否逾時
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

2. **套用在代理呼叫：**

```python
# 在協調器中
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
        # 繼續與其他代理程式進行
```

3. **測試斷路器：**

```bash
# 模擬重複失敗（停止一個代理）
az containerapp stop --name web-research-agent --resource-group rg-agents

# 發送多個請求
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# 檢查日誌 - 5 次失敗後應顯示電路已斷開
# 使用 Azure CLI 查看容器應用日誌：
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ 完成標準：**
- ✅ 5次失敗後斷路器開啟（拒絕請求）
- ✅ 60秒後斷路器半開（測試恢復）
- ✅ 其他代理正常運作
- ✅ 代理恢復後斷路器自動關閉

<strong>時間</strong>：40-50 分鐘

---

## 監控與除錯

### 使用 Application Insights 的分散式追蹤

**檔案：`src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# 配置追蹤
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# 建立追蹤器
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# 配置日誌記錄
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

### 多代理系統費用（月估算）

| 元件 | 配置 | 費用 |
|-----------|--------------|------|
| <strong>編排者</strong> | 1 個 Container App（1 vCPU，2GB） | $30-50 |
| **4 個代理** | 4 個 Container Apps（各 0.5 vCPU，1GB） | $60-120 |
| **Service Bus** | 標準層，1000 萬訊息 | $10-20 |
| **Cosmos DB** | 無伺服器，5GB 儲存，100 萬 RUs | $25-50 |
| **Blob Storage** | 10GB 儲存，10 萬操作 | $5-10 |
| **Application Insights** | 5GB 資料擷取 | $10-15 |
| **Microsoft Foundry Models** | gpt-4.1，1000 萬字元 | $100-300 |
| <strong>合計</strong> | | **$240-565/月** |

### 成本優化策略

1. **可能時使用無伺服器：**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **閒置時調整代理至零：**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Service Bus 使用批次處理：**
   ```python
   # 以批次發送訊息（較便宜）
   sender.send_messages([message1, message2, message3])
   ```

4. **快取常用結果：**
   ```python
   # 使用 Azure Cache for Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## 最佳實踐

### ✅ 建議做：

1. <strong>使用冪等操作</strong>
   ```python
   # 代理可以安全地多次處理相同訊息
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # 處理任務...
   ```

2. <strong>實作完整日誌紀錄</strong>
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **使用相關性 ID**
   ```python
   # 在整個工作流程中傳遞 task_id
   message_data = {
       'task_id': task_id,  # 關聯 ID
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **設定訊息存活時間（TTL）**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. <strong>監控死信佇列</strong>
   ```python
   # 定期監察失敗訊息
   monitor_dead_letters()
   ```

### ❌ 避免做：

1. <strong>避免循環依賴</strong>
   ```python
   # ❌ 差劣：代理 A → 代理 B → 代理 A（無限循環）
   # ✅ 良好：定義清晰的有向無環圖（DAG）
   ```

2. <strong>避免阻塞代理執行緒</strong>
   ```python
   # ❌ 不好：同步等待
   while not task_complete:
       time.sleep(1)
   
   # ✅ 好：使用消息隊列回調
   ```

3. <strong>不可忽視部分失敗</strong>
   ```python
   # ❌ 不好：如果一個代理失敗，整個工作流程都失敗
   # ✅ 好：返回部分結果並帶有錯誤指示器
   ```

4. <strong>不要使用無限重試</strong>
   ```python
   # ❌ 唔好：無限重試
   # ✅ 好：max_retries = 3，然後死信處理
   ```

---

## 疑難排解指南

### 問題：訊息停留在佇列中

**症狀：**
- 訊息在佇列中堆積
- 代理未處理訊息
- 工作狀態停留在「等待中」

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

**解決方案：**

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

### 問題：工作逾時／永不完成

**症狀：**
- 工作狀態保持「進行中」
- 部分代理完成，其他未完成
- 無錯誤訊息

**診斷：**
```bash
# 檢查任務狀態
curl $ORCHESTRATOR_URL/task/$TASK_ID

# 檢查 Application Insights
# 執行查詢：traces | where customDimensions.task_id == "..."
```

**解決方案：**

1. **在聚合器實作逾時機制（練習1）**

2. **使用 Azure 監控檢查代理故障：**
   ```bash
   # 透過 azd monitor 檢視日誌
   azd monitor --logs
   
   # 或使用 Azure CLI 檢查特定容器應用程式的日誌
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **確認所有代理均正常執行：**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## 進一步了解

### 官方文件
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [多代理設計模式](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### 本課程後續步驟
- ← 上一節：[容量規劃](capacity-planning.md)
- → 下一節：[SKU 選擇](sku-selection.md)
- 🏠 [課程首頁](../../README.md)

### 相關範例
- [微服務範例](../../../../examples/microservices) - 服務間通訊模式
- [Microsoft Foundry 模型範例](../../../../examples/azure-openai-chat) - AI 整合

---

## 總結

**你已學會：**
- ✅ 五種協調模式（順序、平行、階層、事件驅動、共識）
- ✅ Azure 上的多代理架構（Service Bus、Cosmos DB、Container Apps）
- ✅ 分散式代理的狀態管理
- ✅ 逾時處理、重試及斷路器
- ✅ 分散式系統的監控與除錯
- ✅ 成本優化策略

**關鍵重點：**
1. <strong>選擇合適模式</strong> — 順序用於有順序需求的工作流，平行加速處理，事件驅動提升彈性
2. <strong>謹慎管理狀態</strong> — 使用 Cosmos DB 或類似工具共享狀態
3. <strong>優雅處理故障</strong> — 逾時機制、重試、斷路器、死信佇列
4. <strong>全面監控</strong> — 分散式追蹤是除錯必備
5. <strong>成本優化</strong> — 零擴展、無伺服器方案、快取實作

**後續行動：**
1. 完成實作練習
2. 為你的應用場景建置多代理系統
3. 研讀 [SKU 選擇](sku-selection.md) 以優化效能與成本

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們對因使用本翻譯而產生的任何誤解或誤釋不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->