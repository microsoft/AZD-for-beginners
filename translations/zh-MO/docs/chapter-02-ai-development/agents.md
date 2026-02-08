# 使用 Azure Developer CLI 的 AI 代理

**章節導覽:**
- **📚 課程首頁**: [AZD 新手指南](../../README.md)
- **📖 目前章節**: 第2章 - 以 AI 為先的開發
- **⬅️ 上一節**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一節**: [生產環境 AI 實務](production-ai-practices.md)
- **🚀 進階**: [多代理解決方案](../../examples/retail-scenario.md)

---

## 介紹

AI 代理是能感知其環境、做出決策並採取行動以達成特定目標的自動程式。與僅回應提示的簡單聊天機器人不同，代理可以：

- **使用工具** - 呼叫 API、搜尋資料庫、執行程式碼
- **規劃與推理** - 將複雜任務分解為步驟
- **從上下文學習** - 維持記憶並調整行為
- **協作** - 與其他代理合作（多代理系統）

本指南示範如何使用 Azure Developer CLI (azd) 將 AI 代理部署到 Azure。

## 學習目標

完成本指南後，你將會：
- 了解什麼是 AI 代理以及它們與聊天機器人的不同之處
- 使用 AZD 部署預建的 AI 代理範本
- 為自訂代理設定 Foundry Agents
- 實作基本代理模式（工具使用、RAG、多人代理）
- 監控並除錯已部署的代理

## 學習成果

完成後，你能：
- 用一條指令將 AI 代理應用程式部署到 Azure
- 設定代理的工具與功能
- 用代理實作檢索增強生成（RAG）
- 為複雜工作流程設計多代理架構
- 排解常見的代理部署問題

---

## 🤖 代理與聊天機器人的差異？

| 特性 | 聊天機器人 | AI 代理 |
|---------|---------|----------|
| **行為** | 回應提示 | 採取自主行動 |
| **工具** | 無 | 可以呼叫 API、搜尋、執行程式碼 |
| **記憶** | 僅基於會話 | 跨會話的持久記憶 |
| **規劃** | 單一回應 | 多步驟推理 |
| **協作** | 單一實體 | 可以與其他代理合作 |

### 簡單類比

- **聊天機器人** = 在服務台回答問題的有幫助的人
- **AI 代理** = 能打電話、預約並為你完成任務的私人助理

---

## 🚀 快速上手：部署你的第一個代理

### 選項 1：Foundry Agents 範本（推薦）

```bash
# 初始化 AI 代理範本
azd init --template get-started-with-ai-agents

# 部署至 Azure
azd up
```

**部署內容：**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (for RAG)
- ✅ Azure Container Apps (web interface)
- ✅ Application Insights (monitoring)

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
- ✅ Azure Functions (serverless agent execution)
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
- ✅ Azure AI Search with sample data
- ✅ 文件處理流程
- ✅ 帶出處引用的聊天介面

**時間：** 約 15-25 分鐘
**費用：** 約 $80-150/月（開發）

---

## 🏗️ 代理架構模式

### 模式 1：單一代理使用工具

最簡單的代理模式 — 一個代理可以使用多種工具。

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

**適合：**
- 客服機器人
- 研究助理
- 資料分析代理

**AZD 範本：** `azure-search-openai-demo`

### 模式 2：RAG 代理（檢索增強生成）

在生成回應之前檢索相關文件的代理。

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

**適合：**
- 企業知識庫
- 文件問答系統
- 合規與法律研究

**AZD 範本：** `azure-search-openai-demo`

### 模式 3：多代理系統

多個專門化代理共同處理複雜任務。

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

**適合：**
- 複雜內容生成
- 多步驟工作流程
- 需要不同專業技能的任務

**了解更多：** [多代理協調模式](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 設定代理工具

當代理能使用工具時會更強大。以下說明如何設定常見工具：

### 在 Foundry Agents 中的工具設定

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
# 設定代理專用的環境變數
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 使用已更新的設定進行部署
azd deploy
```

---

## 📊 監控代理

### Application Insights 整合

所有 AZD 代理範本都包含 Application Insights 用於監控：

```bash
# 開啟監控儀表板
azd monitor --overview

# 查看即時日誌
azd monitor --logs

# 查看即時指標
azd monitor --live
```

### 關鍵監控指標

| 指標 | 說明 | 目標 |
|--------|-------------|--------|
| 回應延遲 | 產生回應的時間 | < 5 秒 |
| Token 使用量 | 每次請求的 Token 數量 | 監控以控制成本 |
| 工具呼叫成功率 | 成功執行工具的百分比 | > 95% |
| 錯誤率 | 代理請求失敗比例 | < 1% |
| 使用者滿意度 | 反饋評分 | > 4.0/5.0 |

### 代理的自訂日誌紀錄

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

### 各模式估計每月成本

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

2. **對於重複查詢實作快取**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **設定 Token 上限**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # 限制回應長度
   )
   ```

4. **閒置時縮減到零（scale to zero）**
   ```bash
   # 容器應用程式會自動縮減至零
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 代理疑難排解

### 常見問題與解決方案

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
<summary><strong>❌ 代理回傳不正確或虛構資訊</strong></summary>

```python
# 透過更佳的系統提示進行改進
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 加入檢索以作為依據
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # 將回應以文件為依據
)
```
</details>

<details>
<summary><strong>❌ 超出 Token 上限錯誤</strong></summary>

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
# 開啟輸出中顯示的網址

# 步驟 5：清理
azd down --force --purge
```

**成功標準：**
- [ ] 代理能回應問題
- [ ] 能存取監控儀表板
- [ ] 成功清理資源

### 練習 2：加入自訂工具（30 分鐘）

**目標：** 為代理擴充自訂工具

1. 部署代理範本
2. 建立一個新的工具函式：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 對天氣服務的 API 呼叫
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. 註冊該工具到代理
4. 測試代理是否使用新的工具

**成功標準：**
- [ ] 代理能識別與天氣相關的查詢
- [ ] 工具被正確呼叫
- [ ] 回應包含天氣資訊

### 練習 3：建立 RAG 代理（45 分鐘）

**目標：** 建立一個可以從你的文件中回答問題的代理

```bash
# 部署 RAG 範本
azd init --template azure-search-openai-demo
azd up

# 上載你的文件
# (依照範本的資料導入指南)

# 以特定領域的問題進行測試
```

**成功標準：**
- [ ] 代理從上傳的文件中回答問題
- [ ] 回應包含引用來源
- [ ] 對範圍外問題沒有虛構回應

---

## 📚 下一步

既然你已了解 AI 代理，可繼續探索以下進階主題：

| 主題 | 說明 | 連結 |
|-------|-------------|------|
| **多代理系統** | 建立由多個協同代理組成的系統 | [零售多代理範例](../../examples/retail-scenario.md) |
| **協調模式** | 學習編排與通訊模式 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) |
| **生產部署** | 企業級代理部署 | [生產環境 AI 實務](production-ai-practices.md) |
| **代理評估** | 測試並評估代理效能 | [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 額外資源

### 官方文件
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (代理框架)](https://learn.microsoft.com/semantic-kernel/)

### 用於代理的 AZD 範本
- [開始使用 AI 代理](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社群資源
- [Awesome AZD - 代理範本](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**導覽**
- **上一課**: [AI 模型部署](ai-model-deployment.md)
- **下一課**: [生產環境 AI 實務](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的原文應被視為具權威性的版本。對於關鍵資訊，建議採用專業人工翻譯。我們對因使用本翻譯而引起的任何誤解或曲解不承擔任何責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->