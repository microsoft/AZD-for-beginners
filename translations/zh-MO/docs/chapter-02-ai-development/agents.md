# 使用 Azure Developer CLI 的 AI 代理

**章節導覽:**
- **📚 課程主頁**: [AZD 入門](../../README.md)
- **📖 目前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 上一節**: [Microsoft Foundry 整合](microsoft-foundry-integration.md)
- **➡️ 下一節**: [AI 模型部署](ai-model-deployment.md)
- **🚀 進階**: [多代理方案](../../examples/retail-scenario.md)

---

## 介紹

AI 代理是能夠感知其環境、做出決策並採取行動以達成特定目標的自主程式。不同於僅回應提示的簡單聊天機器人，代理可以：

- <strong>使用工具</strong> - 呼叫 API、搜尋資料庫、執行程式碼
- <strong>規劃與推理</strong> - 將複雜任務拆解為步驟
- <strong>從情境中學習</strong> - 維持記憶並調整行為
- <strong>協作</strong> - 與其他代理一起工作（多代理系統）

本指南示範如何使用 Azure Developer CLI (azd) 將 AI 代理部署到 Azure。

## 學習目標

完成本指南後，您將能：
- 了解 AI 代理是什麼以及它們與聊天機器人的差異
- 使用 AZD 部署預建的 AI 代理範本
- 為自訂代理設定 Foundry Agents
- 實作基本代理模式（工具使用、RAG、多代理）
- 監控並偵錯已部署的代理

## 學習成果

完成後，您將能夠：
- 使用單一指令將 AI 代理應用部署到 Azure
- 設定代理工具和功能
- 與代理一起實作檢索增強生成（RAG）
- 為複雜工作流程設計多代理架構
- 排解常見的代理部署問題

---

## 🤖 代理與聊天機器人的差異？

| 功能 | 聊天機器人 | AI 代理 |
|---------|---------|----------|
| <strong>行為</strong> | 回應提示 | 採取自主行動 |
| <strong>工具</strong> | 無 | 可呼叫 API、搜尋、執行程式碼 |
| <strong>記憶</strong> | 只限於工作階段 | 在不同工作階段間保留持久記憶 |
| <strong>規劃</strong> | 單次回應 | 多步驟推理 |
| <strong>協作</strong> | 單一實體 | 可與其他代理協同工作 |

### 簡單類比

- <strong>聊天機器人</strong> = 在服務台回答問題的助人員
- **AI 代理** = 可為您打電話、預約並完成任務的個人助理

---

## 🚀 快速開始：部署您的第一個代理

### 選項 1：Foundry Agents 範本（推薦）

```bash
# 初始化 AI 代理範本
azd init --template get-started-with-ai-agents

# 部署到 Azure
azd up
```

**部署項目包括：**
- ✅ Foundry Agents
- ✅ Microsoft Foundry Models (gpt-4.1)
- ✅ Azure AI Search（用於 RAG）
- ✅ Azure Container Apps（Web 介面）
- ✅ Application Insights（監控）

**所需時間：** 約 15-20 分鐘
**成本：** 約 $100-150/月（開發）

### 選項 2：使用 Prompty 的 OpenAI 代理

```bash
# 初始化基於 Prompty 的代理範本
azd init --template agent-openai-python-prompty

# 部署到 Azure
azd up
```

**部署項目包括：**
- ✅ Azure Functions（無伺服器代理執行）
- ✅ Microsoft Foundry Models
- ✅ Prompty 設定檔
- ✅ 範例代理實作

**所需時間：** 約 10-15 分鐘
**成本：** 約 $50-100/月（開發）

### 選項 3：RAG 聊天代理

```bash
# 初始化 RAG 聊天範本
azd init --template azure-search-openai-demo

# 部署到 Azure
azd up
```

**部署項目包括：**
- ✅ Microsoft Foundry Models
- ✅ 含範例資料的 Azure AI Search
- ✅ 文件處理管線
- ✅ 含引用來源的聊天介面

**所需時間：** 約 15-25 分鐘
**成本：** 約 $80-150/月（開發）

### 選項 4：AZD AI Agent Init（基於清單）

如果您已有代理 manifest 檔案，您可以使用 `azd ai` 指令直接產生 Foundry Agent Service 專案：

```bash
# 安裝 AI 代理擴充套件
azd extension install azure.ai.agents

# 從代理宣告檔初始化
azd ai agent init -m agent-manifest.yaml

# 部署到 Azure
azd up
```

**何時使用 `azd ai agent init` 與 `azd init --template`：**

| 方法 | 適用情境 | 運作方式 |
|----------|----------|------|
| `azd init --template` | 從可運作的範例應用開始 | 將包含程式碼與基礎架構的完整範本倉儲複製下來 |
| `azd ai agent init -m` | 從您自己的代理 manifest 建置 | 根據代理定義從樣板產生專案結構 |

> **提示：** 學習時建議使用 `azd init --template`（上述選項 1-3）。當以自有 manifest 建置生產代理時，請使用 `azd ai agent init`。完整參考請參閱 [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

---

## 🏗️ 代理架構模式

### 模式 1：具工具的單一代理

最簡單的代理模式—一個代理可以使用多種工具。

```mermaid
graph TD
    UI[用戶介面] --> Agent[AI 代理<br/>gpt-4.1]
    Agent --> Search[搜尋工具]
    Agent --> Database[資料庫工具]
    Agent --> API[API 工具]
```
**適用於：**
- 客服機器人
- 研究助理
- 資料分析代理

**AZD 範本：** `azure-search-openai-demo`

### 模式 2：RAG 代理（檢索增強生成）

在生成回應前先檢索相關文件的代理。

```mermaid
graph TD
    Query[使用者查詢] --> RAG[RAG 代理人]
    RAG --> Vector[向量搜尋]
    RAG --> LLM[大型語言模型<br/>gpt-4.1]
    Vector -- 文件 --> LLM
    LLM --> Response[包含引註的回應]
```
**適用於：**
- 企業知識庫
- 文件問答系統
- 合規與法律研究

**AZD 範本：** `azure-search-openai-demo`

### 模式 3：多代理系統

多個專精代理共同處理複雜任務。

```mermaid
graph TD
    Orchestrator[協調者代理人] --> Research[研究代理人<br/>gpt-4.1]
    Orchestrator --> Writer[寫作代理人<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[審閱代理人<br/>gpt-4.1]
```
**適用於：**
- 複雜內容生成
- 多步驟工作流程
- 需要不同專長的任務

**進一步了解：** [多代理協調模式](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 設定代理工具

當代理能使用工具時會更強大。以下說明如何設定常見工具：

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
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### 環境設定

```bash
# 設定代理程式專用的環境變數
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 以更新後的設定進行部署
azd deploy
```

---

## 📊 監控代理

### Application Insights 整合

所有 AZD 代理範本都包含 Application Insights 以便監控：

```bash
# 開啟監控儀表板
azd monitor --overview

# 檢視即時日誌
azd monitor --logs

# 檢視即時指標
azd monitor --live
```

### 追蹤的關鍵指標

| 指標 | 描述 | 目標 |
|--------|-------------|--------|
| 回應延遲 | 產生回應所需時間 | < 5 秒 |
| 代幣使用量 | 每次請求的代幣數 | 監控以控制成本 |
| 工具呼叫成功率 | 工具執行成功的比例 | > 95% |
| 錯誤率 | 代理請求失敗率 | < 1% |
| 使用者滿意度 | 反饋分數 | > 4.0/5.0 |

### 代理的自訂日誌

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# 使用 OpenTelemetry 設定 Azure Monitor
configure_azure_monitor(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
)

tracer = trace.get_tracer(__name__)

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    with tracer.start_as_current_span("agent_interaction") as span:
        span.set_attributes({
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        })
```

> **注意：** 安裝所需套件：`pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 成本考量

### 各模式估計每月成本

| 模式 | 開發環境 | 生產環境 |
|---------|-----------------|------------|
| 單一代理 | $50-100 | $200-500 |
| RAG 代理 | $80-150 | $300-800 |
| 多代理（2-3 個代理） | $150-300 | $500-1,500 |
| 企業級多代理 | $300-500 | $1,500-5,000+ |

### 成本優化建議

1. **對於簡單任務，使用 gpt-4.1-mini**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. <strong>為重複查詢實作快取</strong>
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. <strong>為每次執行設定代幣上限</strong>
   ```python
   # 在執行代理時設定 max_completion_tokens，而非在建立時設定
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # 限制回應長度
   )
   ```

4. <strong>閒置時縮減至零</strong>
   ```bash
   # 容器應用程式會自動縮放至零
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 代理故障排除

### 常見問題與解決方案

<details>
<summary><strong>❌ 代理未回應工具呼叫</strong></summary>

```bash
# 檢查工具是否已正確註冊
azd show

# 驗證 OpenAI 的部署
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# 檢查代理日誌
azd monitor --logs
```

**常見原因：**
- 工具函式簽章不匹配
- 缺少必要的權限
- API 端點無法存取
</details>

<details>
<summary><strong>❌ 代理回應延遲過高</strong></summary>

```bash
# 檢查 Application Insights 是否有瓶頸
azd monitor --live

# 考慮使用較快的模型
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**優化建議：**
- 使用串流回應
- 實作回應快取
- 減少上下文視窗大小
</details>

<details>
<summary><strong>❌ 代理回傳不正確或虛構的資訊</strong></summary>

```python
# 透過更好的系統提示來改進
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 加入檢索以作為依據
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # 以文件作為回應的依據
)
```
</details>

<details>
<summary><strong>❌ 超出代幣限制錯誤</strong></summary>

```python
# 實作上下文視窗管理
def truncate_context(messages, max_tokens=8000, model="gpt-4.1"):
    """Keep only recent messages within token limit."""
    import tiktoken
    encoding = tiktoken.encoding_for_model(model)
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(encoding.encode(msg.content))
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

**目標：** 使用 AZD 部署您的第一個 AI 代理

```bash
# 第1步：初始化範本
azd init --template get-started-with-ai-agents

# 第2步：登入 Azure
azd auth login

# 第3步：部署
azd up

# 第4步：測試代理程式
# 部署後的預期輸出：
#   部署完成！
#   端點： https://<app-name>.<region>.azurecontainerapps.io
# 開啟輸出中顯示的 URL，然後嘗試提出問題

# 第5步：檢視監控
azd monitor --overview

# 第6步：清理資源
azd down --force --purge
```

**成功標準：**
- [ ] 代理能回應問題
- [ ] 可透過 `azd monitor` 存取監控儀表板
- [ ] 成功清理資源

### 練習 2：新增自訂工具（30 分鐘）

**目標：** 為代理擴充自訂工具

1. 部署代理範本：
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. 在代理程式中建立新的工具函式：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 向天氣服務發出 API 呼叫
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. 向代理註冊該工具：
   ```python
   from azure.ai.projects.models import FunctionTool

   weather_tool = FunctionTool(
       name="get_weather",
       description="Get current weather for a location",
       parameters={
           "type": "object",
           "properties": {
               "location": {"type": "string", "description": "City name"}
           },
           "required": ["location"]
       }
   )

   agent = project_client.agents.create_agent(
       model="gpt-4.1",
       name="Weather Agent",
       tools=[weather_tool]
   )
   ```
4. 重新部署並測試：
   ```bash
   azd deploy
   # 詢問：「西雅圖的天氣如何？」
   # 預期：代理會呼叫 get_weather("Seattle") 並返回天氣資訊
   ```

**成功標準：**
- [ ] 代理能辨識與天氣相關的查詢
- [ ] 工具被正確呼叫
- [ ] 回應包含天氣資訊

### 練習 3：建置 RAG 代理（45 分鐘）

**目標：** 建立能從文件回答問題的代理

```bash
# 步驟 1：部署 RAG 範本
azd init --template azure-search-openai-demo
azd up

# 步驟 2：上載你的文件
# 將 PDF/TXT 檔案放入 data/ 目錄，然後執行：
python scripts/prepdocs.py

# 步驟 3：使用特定領域的問題進行測試
# 從 azd up 的輸出中開啟網頁應用程式的 URL
# 就你上載的文件提出問題
# 回應應包含像 [doc.pdf] 這樣的引用參考
```

**成功標準：**
- [ ] 代理能從上傳的文件中回答問題
- [ ] 回應包含引用來源
- [ ] 對於範圍外的問題不出現虛構資訊

---

## 📚 後續步驟

既然您已了解 AI 代理，請探索這些進階主題：

| 主題 | 描述 | 連結 |
|-------|-------------|------|
| <strong>多代理系統</strong> | 建構具有多個協同代理的系統 | [零售多代理範例](../../examples/retail-scenario.md) |
| <strong>協調模式</strong> | 學習編排與通訊模式 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) |
| <strong>生產部署</strong> | 企業等級的代理部署 | [生產 AI 實務](../chapter-08-production/production-ai-practices.md) |
| <strong>代理評估</strong> | 測試與評估代理效能 | [AI 故障排除](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI 工作坊實作** | 實作：讓您的 AI 解決方案適用於 AZD | [AI 工作坊實作](ai-workshop-lab.md) |

---

## 📖 額外資源

### 官方文件
- [Azure AI Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure AI Foundry Agent Service 快速入門](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### AZD 代理範本
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社群資源
- [Awesome AZD - 代理範本](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### 為您的編輯器安裝代理技能
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - 安裝可重用的 AI 代理技能以用於 Azure 開發，支援 GitHub Copilot、Cursor 或任何支援的代理。包含 [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai)、[Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry)、[部署](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) 與 [診斷](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) 的技能：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

<strong>導覽</strong>
- <strong>上一節課程</strong>: [Microsoft Foundry 整合](microsoft-foundry-integration.md)
- <strong>下一節課程</strong>: [AI 模型部署](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為具權威性的來源。對於重要資訊，建議使用專業人工翻譯。我們不會對因使用本翻譯而導致的任何誤解或錯誤詮釋承擔法律責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->