# 使用 Azure Developer CLI 的 AI 代理

**章節導覽:**
- **📚 課程主頁**: [AZD For Beginners](../../README.md)
- **📖 本章**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 上一章**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ 下一章**: [Production AI Practices](production-ai-practices.md)
- **🚀 進階**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## 簡介

AI 代理是能感知其環境、做出決策並採取行動以達成特定目標的自主程式。與僅回應提示的簡單聊天機械人不同，代理可以：

- **使用工具** - 呼叫 API、搜尋資料庫、執行程式碼
- **規劃與推理** - 將複雜任務拆解為步驟
- **從上下文學習** - 保持記憶並調整行為
- **協作** - 與其他代理合作（多代理系統）

本指南示範如何使用 Azure Developer CLI (azd) 將 AI 代理部署到 Azure。

## 學習目標

完成本指南後，你將能夠：
- 了解 AI 代理為何與聊天機械人不同
- 使用 AZD 部署預建的 AI 代理範本
- 為自訂代理設定 Foundry Agents
- 實作基本代理模式（工具使用、RAG、多代理）
- 監控與除錯已部署的代理

## 學習成果

完成後，你將能夠：
- 以單一指令將 AI 代理應用程式部署到 Azure
- 設定代理的工具與能力
- 與代理實作檢索增強生成（RAG）
- 為複雜工作流程設計多代理架構
- 排解常見的代理部署問題

---

## 🤖 代理與聊天機械人的差異是什麼？

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **行為** | 回應提示 | 採取自主行動 |
| **工具** | 無 | 可呼叫 API、搜尋、執行程式碼 |
| **記憶** | 僅限會話 | 橫跨會話的持久記憶 |
| **規劃** | 單次回應 | 多步驟推理 |
| **協作** | 單一實體 | 可與其他代理協作 |

### 簡單類比

- **聊天機械人** = 在資訊櫃台回答問題的熱心人員
- **AI 代理** = 可為你打電話、預約並完成任務的私人助理

---

## 🚀 快速開始：部署你的第一個代理

### 選項 1：Foundry Agents 範本（推薦）

```bash
# 初始化 AI 代理人範本
azd init --template get-started-with-ai-agents

# 部署到 Azure
azd up
```

**會部署的項目：**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search（用於 RAG）
- ✅ Azure Container Apps（網站介面）
- ✅ Application Insights（監控）

**所需時間：** ~15-20 分鐘
**成本：** ~$100-150/月（開發）

### 選項 2：使用 Prompty 的 OpenAI 代理

```bash
# 初始化基於 Prompty 的代理範本
azd init --template agent-openai-python-prompty

# 部署到 Azure
azd up
```

**會部署的項目：**
- ✅ Azure Functions（無伺服器代理執行）
- ✅ Azure OpenAI
- ✅ Prompty 設定檔
- ✅ 範例代理實作

**所需時間：** ~10-15 分鐘
**成本：** ~$50-100/月（開發）

### 選項 3：RAG 聊天代理

```bash
# 初始化 RAG 聊天範本
azd init --template azure-search-openai-demo

# 部署到 Azure
azd up
```

**會部署的項目：**
- ✅ Azure OpenAI
- ✅ 內含範例資料的 Azure AI Search
- ✅ 文件處理管線
- ✅ 帶引用來源的聊天介面

**所需時間：** ~15-25 分鐘
**成本：** ~$80-150/月（開發）

---

## 🏗️ 代理架構模式

### 模式 1：具工具的單一代理

最簡單的代理模式 — 一個能使用多個工具的代理。

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

**最適用於：**
- 客戶支援機械人
- 研究助理
- 資料分析代理

**AZD 範本：** `azure-search-openai-demo`

### 模式 2：RAG 代理（檢索增強生成）

一個在生成回應前會檢索相關文件的代理。

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

**最適用於：**
- 企業知識庫
- 文件問答系統
- 合規與法律研究

**AZD 範本：** `azure-search-openai-demo`

### 模式 3：多代理系統

多個專精代理共同處理複雜任務。

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

**最適用於：**
- 複雜內容生成
- 多步驟工作流程
- 需要不同專業知識的任務

**了解更多：** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 設定代理工具

當代理能使用工具時，它們會更強大。以下示範如何設定常見工具：

### Foundry Agents 的工具設定

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
# 為代理設定專屬的環境變數
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

所有 AZD 代理範本都包含 Application Insights 用於監控：

```bash
# 開啟監控儀表板
azd monitor --overview

# 檢視即時日誌
azd monitor --logs

# 檢視即時指標
azd monitor --live
```

### 需追蹤的關鍵指標

| 指標 | 描述 | 目標 |
|--------|-------------|--------|
| 回應延遲 | 生成回應所需時間 | < 5 秒 |
| Token 使用量 | 每次請求的 Token 數量 | 監控以控制成本 |
| 工具呼叫成功率 | 成功執行工具的百分比 | > 95% |
| 錯誤率 | 代理請求失敗比例 | < 1% |
| 用戶滿意度 | 回饋分數 | > 4.0/5.0 |

### 代理的自訂記錄

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

| 模式 | 開發環境 | 生產 |
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

3. **設定 Token 限制**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # 限制回應長度
   )
   ```

4. **閒置時縮減到零**
   ```bash
   # Container Apps 會自動縮減至零
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 排解代理問題

### 常見問題與解決方法

<details>
<summary><strong>❌ 代理未回應工具呼叫</strong></summary>

```bash
# 檢查工具是否已正確註冊
azd show

# 驗證 OpenAI 部署
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# 檢查代理日誌
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
<summary><strong>❌ 代理回傳不正確或產生幻覺資訊</strong></summary>

```python
# 透過更好的系統提示改善
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 新增檢索以作為依據
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # 將回應以文件為依據
)
```
</details>

<details>
<summary><strong>❌ 超出 Token 限制錯誤</strong></summary>

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

### 練習 1：部署一個基本代理（20 分鐘）

**目標：** 使用 AZD 部署你的第一個 AI 代理

```bash
# 步驟 1: 初始化範本
azd init --template get-started-with-ai-agents

# 步驟 2: 登入 Azure
azd auth login

# 步驟 3: 部署
azd up

# 步驟 4: 測試代理程式
# 開啟輸出中顯示的網址

# 步驟 5: 清理
azd down --force --purge
```

**成功標準：**
- [ ] 代理能回應問題
- [ ] 可以存取監控儀表板
- [ ] 資源已成功清理

### 練習 2：新增自訂工具（30 分鐘）

**目標：** 為代理擴充自訂工具

1. 部署代理範本
2. 建立一個新的工具函式：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 呼叫天氣服務的 API
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. 向代理註冊該工具
4. 測試代理是否使用新工具

**成功標準：**
- [ ] 代理能識別與天氣有關的查詢
- [ ] 工具被正確呼叫
- [ ] 回應包含天氣資訊

### 練習 3：建立 RAG 代理（45 分鐘）

**目標：** 建立一個能從你的文件中回答問題的代理

```bash
# 部署 RAG 範本
azd init --template azure-search-openai-demo
azd up

# 上傳你的文件
# (按照範本的資料導入指南)

# 使用特定領域的問題進行測試
```

**成功標準：**
- [ ] 代理能從上傳的文件中回答
- [ ] 回應包含引用來源
- [ ] 對於範圍外的問題不會產生幻覺

---

## 📚 下一步

現在你已了解 AI 代理，探索以下進階主題：

| 主題 | 描述 | 連結 |
|-------|-------------|------|
| **多代理系統** | 建構由多個協作代理組成的系統 | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **協調模式** | 學習編排與通訊模式 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **生產部署** | 企業級代理部署 | [Production AI Practices](production-ai-practices.md) |
| **代理評估** | 測試與評估代理效能 | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 補充資源

### 官方文件
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### 用於代理的 AZD 範本
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社群資源
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**導覽**
- **前一課**: [AI Model Deployment](ai-model-deployment.md)
- **下一課**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。請以原始語言的文件為準。對於關鍵資訊，建議使用專業人工翻譯。我們不會對因使用本翻譯而引致的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->