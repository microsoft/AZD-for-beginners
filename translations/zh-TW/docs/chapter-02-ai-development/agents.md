# 使用 Azure Developer CLI 的 AI 代理

**章節導覽:**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 本章節**: Chapter 2 - AI-First Development
- **⬅️ 上一節**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ 下一節**: [Production AI Practices](production-ai-practices.md)
- **🚀 進階**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## 介紹

AI 代理是能夠感知環境、做出決策並採取行動以達成特定目標的自主程式。不同於只回應提示的簡單聊天機器人，代理可以：

- **使用工具** - 調用 API、搜尋資料庫、執行程式碼
- **規劃與推理** - 將複雜任務拆解為步驟
- **從上下文學習** - 維持記憶並調整行為
- **協作** - 與其他代理合作（多代理系統）

本指南示範如何使用 Azure Developer CLI (azd) 在 Azure 上部署 AI 代理。

## 學習目標

完成本指南後，你將能：
- 了解什麼是 AI 代理以及它們與聊天機器人的差異
- 使用 AZD 部署預建的 AI 代理範本
- 為自訂代理設定 Foundry Agents
- 實作基本代理模式（工具使用、RAG、多代理）
- 監控與除錯已部署的代理

## 學習成果

完成後，你將能夠：
- 使用單一指令將 AI 代理應用部署到 Azure
- 設定代理工具和能力
- 與代理一起實作檢索增強生成（RAG）
- 為複雜工作流程設計多代理架構
- 排除常見的代理部署問題

---

## 🤖 什麼讓代理與聊天機器人不同？

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Behavior** | 回應提示 | 採取自主行動 |
| **Tools** | 無 | 能調用 APIs、搜尋、執行程式碼 |
| **Memory** | 僅限於會話 | 跨會話的持久記憶 |
| **Planning** | 單一回應 | 多步驟推理 |
| **Collaboration** | 單一實體 | 可與其他代理協作 |

### 簡單類比

- **聊天機器人** = 在服務台回答問題的熱心人員
- **AI 代理** = 可替你打電話、安排預約並完成任務的個人助理

---

## 🚀 快速開始：部署你的第一個代理

### 選項 1：Foundry Agents 範本（建議）

```bash
# 初始化 AI 代理範本
azd init --template get-started-with-ai-agents

# 部署到 Azure
azd up
```

**部署內容：**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search（用於 RAG）
- ✅ Azure Container Apps（Web 介面）
- ✅ Application Insights（監控）

**時間：** 約 15-20 分鐘
**費用：** 約 $100-150/月（開發）

### 選項 2：使用 Prompty 的 OpenAI 代理

```bash
# 初始化基於 Prompty 的代理範本
azd init --template agent-openai-python-prompty

# 部署到 Azure
azd up
```

**部署內容：**
- ✅ Azure Functions（無伺服器代理執行）
- ✅ Azure OpenAI
- ✅ Prompty 設定檔
- ✅ 範例代理實作

**時間：** 約 10-15 分鐘
**費用：** 約 $50-100/月（開發）

### 選項 3：RAG 聊天代理

```bash
# 初始化 RAG 聊天範本
azd init --template azure-search-openai-demo

# 部署到 Azure
azd up
```

**部署內容：**
- ✅ Azure OpenAI
- ✅ 含範例資料的 Azure AI Search
- ✅ 文件處理管線
- ✅ 含引用的聊天介面

**時間：** 約 15-25 分鐘
**費用：** 約 $80-150/月（開發）

---

## 🏗️ 代理架構模式

### 模式 1：具工具的單一代理

最簡單的代理模式 — 一個可以使用多種工具的代理。

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**適用於：**
- 客戶支援機器人
- 研究助理
- 資料分析代理

**AZD 範本：** `azure-search-openai-demo`

### 模式 2：RAG 代理（檢索增強生成）

在生成回應前會檢索相關文件的代理。

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**適用於：**
- 企業知識庫
- 文件問答系統
- 合規與法律研究

**AZD 範本：** `azure-search-openai-demo`

### 模式 3：多代理系統

多個專門化代理共同協作處理複雜任務。

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**適用於：**
- 複雜內容生成
- 多步驟工作流程
- 需要不同專業知識的任務

**了解更多：** [多代理協調模式](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 設定代理工具

代理能使用工具時會更強大。以下是如何設定常見工具：

### 在 Foundry Agents 中設定工具

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# 定義自訂工具
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# 使用工具建立代理
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### 環境設定

```bash
# 為代理程式設定專屬的環境變數
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 使用更新後的設定進行部署
azd deploy
```

---

## 📊 監控代理

### Application Insights 整合

所有 AZD 代理範本都包含 Application Insights 以進行監控：

```bash
# 開啟監控儀表板
azd monitor --overview

# 檢視即時日誌
azd monitor --logs

# 檢視即時指標
azd monitor --live
```

### 要追蹤的關鍵指標

| Metric | Description | Target |
|--------|-------------|--------|
| Response Latency | 生成回應所需時間 | < 5 秒 |
| Token Usage | 每次請求的 token 數量 | 監控以控制成本 |
| Tool Call Success Rate | 工具執行成功率百分比 | > 95% |
| Error Rate | 代理請求失敗率 | < 1% |
| User Satisfaction | 使用者回饋分數 | > 4.0/5.0 |

### 代理的自訂日誌記錄

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 成本考量

### 各模式預估每月成本

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| 單一代理 | $50-100 | $200-500 |
| RAG 代理 | $80-150 | $300-800 |
| 多代理（2-3 個代理） | $150-300 | $500-1,500 |
| 企業級多代理 | $300-500 | $1,500-5,000+ |

### 成本優化建議

1. **對於簡單任務使用 GPT-4o-mini**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **為重複查詢實作快取**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **設定 token 限制**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # 限制回應長度
   )
   ```

4. **在不使用時縮放至零**
   ```bash
   # Container Apps 會自動縮減為零
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 代理疑難排解

### 常見問題與解法

<details>
<summary><strong>❌ 代理未回應工具呼叫</strong></summary>

```bash
# 檢查工具是否已正確註冊
azd show

# 驗證 OpenAI 部署
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# 檢查代理程式日誌
azd monitor --logs
```

**常見原因：**
- 工具函式簽名不匹配
- 缺少必要權限
- API 端點無法存取
</details>

<details>
<summary><strong>❌ 代理回應延遲過高</strong></summary>

```bash
# 檢查 Application Insights 以找出瓶頸
azd monitor --live

# 考慮使用較快的模型
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**優化建議：**
- 使用串流回應
- 實作回應快取
- 減少上下文視窗大小
</details>

<details>
<summary><strong>❌ 代理回傳不正確或虛構（幻覺）資訊</strong></summary>

```python
# 透過更好的系統提示改善
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 新增檢索以提供依據
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # 讓回應以文件為依據
)
```
</details>

<details>
<summary><strong>❌ 超過 Token 限制的錯誤</strong></summary>

```python
# 實作上下文視窗管理
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # 粗略估計
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 實作練習

### 練習 1：部署基本代理（20 分鐘）

**目標：** 使用 AZD 部署你的第一個 AI 代理

```bash
# 步驟 1：初始化範本
azd init --template get-started-with-ai-agents

# 步驟 2：登入 Azure
azd auth login

# 步驟 3：部署
azd up

# 步驟 4：測試代理程式
# 開啟輸出中顯示的 URL

# 步驟 5：清理
azd down --force --purge
```

**成功標準：**
- [ ] 代理能回應問題
- [ ] 能存取監控儀表板
- [ ] 成功清除資源

### 練習 2：新增自訂工具（30 分鐘）

**目標：** 用自訂工具擴充代理

1. 部署代理範本
2. 建立新的工具函式：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 對氣象服務的 API 呼叫
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. 在代理中註冊該工具
4. 測試代理是否使用該新工具

**成功標準：**
- [ ] 代理能識別天氣相關查詢
- [ ] 工具被正確呼叫
- [ ] 回應包含天氣資訊

### 練習 3：建立 RAG 代理（45 分鐘）

**目標：** 建立能從你的文件回答問題的代理

```bash
# 部署 RAG 範本
azd init --template azure-search-openai-demo
azd up

# 上傳您的文件
# (依照範本的資料匯入指南)

# 使用領域特定的問題進行測試
```

**成功標準：**
- [ ] 代理從已上傳文件中回答
- [ ] 回應包含引用
- [ ] 對於範圍外問題不產生幻覺

---

## 📚 下一步

現在你已了解 AI 代理，探索這些進階主題：

| Topic | Description | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | 建立多個協作代理的系統 | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | 學習編排與通訊模式 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | 適合企業的代理部署 | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | 測試與評估代理效能 | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 其他資源

### 官方文件
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD 代理範本
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社群資源
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**導覽**
- **上一課**: [AI Model Deployment](ai-model-deployment.md)
- **下一課**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 Co-op Translator (https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所造成的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->