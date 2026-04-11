# 使用 Azure Developer CLI 的 AI 代理

**章節導航：**
- **📚 課程首頁**: [適合初學者的 AZD](../../README.md)
- **📖 目前章節**: 第 2 章 - AI 優先開發
- **⬅️ 上一章**: [Microsoft Foundry 整合](microsoft-foundry-integration.md)
- **➡️ 下一章**: [AI 模型部署](ai-model-deployment.md)
- **🚀 進階**: [多代理解決方案](../../examples/retail-scenario.md)

---

## 簡介

AI 代理是可以感知環境、做出決策並採取行動以實現特定目標的自主程式。不同於僅回應提示的簡單聊天機器人，代理可以：

- <strong>使用工具</strong> - 呼叫 API、搜尋資料庫、執行程式碼
- <strong>規劃及推理</strong> - 將複雜任務分解為多步驟
- <strong>從情境學習</strong> - 保持記憶並適應行為
- <strong>協作</strong> - 與其他代理協同工作（多代理系統）

本指南將示範如何使用 Azure Developer CLI (azd) 將 AI 代理部署到 Azure。

> **驗證說明 (2026-03-25)：** 本指南經 `azd` 版本 `1.23.12` 及 `azure.ai.agents` 版本 `0.1.18-preview` 審核。`azd ai` 功能仍屬預覽階段，如安裝旗標不同請參閱擴展說明。

## 學習目標

完成本指南後，您將能：
- 了解什麼是 AI 代理及其與聊天機器人的差異
- 使用 AZD 部署預建的 AI 代理範本
- 配置 Foundry 代理以自訂代理
- 實作基本代理模式（使用工具、RAG、多代理）
- 監控及排錯已部署的代理

## 學習成果

完成後，您將能：
- 以一條指令將 AI 代理應用部署至 Azure
- 配置代理的工具與功能
- 實作帶有檢索增強生成（RAG）的代理
- 設計多代理架構以支援複雜工作流程
- 解決常見的代理部署問題

---

## 🤖 代理與聊天機器人的差異？

| 功能 | 聊天機器人 | AI 代理 |
|---------|---------|----------|
| <strong>行為</strong> | 回應提示 | 自主採取行動 |
| <strong>工具</strong> | 無 | 可呼叫 API、搜尋、執行程式碼 |
| <strong>記憶</strong> | 僅限會話期間 | 跨會話持久記憶 |
| <strong>規劃</strong> | 單一回應 | 多步驟推理 |
| <strong>協作</strong> | 單一實體 | 可與其他代理協同作業 |

### 簡單類比

- <strong>聊天機器人</strong> = 資訊櫃台回答問題的助理
- **AI 代理** = 可為你打電話、預約和完成任務的個人助理

---

## 🚀 快速開始：部署你的第一個代理

### 選項 1：Foundry 代理範本（推薦）

```bash
# 初始化 AI 代理範本
azd init --template get-started-with-ai-agents

# 部署到 Azure
azd up
```

**部署內容：**
- ✅ Foundry 代理
- ✅ Microsoft Foundry 模型（gpt-4.1）
- ✅ Azure AI 搜尋（用於 RAG）
- ✅ Azure Container Apps（網頁介面）
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
- ✅ Microsoft Foundry 模型
- ✅ Prompty 設定檔
- ✅ 範例代理實作

**時間：** 約 10-15 分鐘  
**費用：** 約 $50-100/月（開發）

### 選項 3：RAG 聊天代理

```bash
# 初始化RAG聊天範本
azd init --template azure-search-openai-demo

# 部署到Azure
azd up
```

**部署內容：**
- ✅ Microsoft Foundry 模型
- ✅ Azure AI 搜尋與範例資料
- ✅ 文件處理管線
- ✅ 含引用的聊天介面

**時間：** 約 15-25 分鐘  
**費用：** 約 $80-150/月（開發）

### 選項 4：AZD AI Agent Init（基於清單或範本的預覽功能）

若已有代理清單檔，可使用 `azd ai` 指令直接生成 Foundry 代理服務專案。近期預覽版本亦新增基於範本的初始化支援，依安裝的擴展版本，提示流程可能略有不同。

```bash
# 安裝 AI 代理擴充功能
azd extension install azure.ai.agents

# 選擇性：驗證已安裝的預覽版本
azd extension show azure.ai.agents

# 從代理清單初始化
azd ai agent init -m agent-manifest.yaml

# 部署到 Azure
azd up
```

**何時使用 `azd ai agent init` 與 `azd init --template`：**

| 方式 | 適合情境 | 運作方式 |
|----------|----------|------|
| `azd init --template` | 從現成範例應用開始 | 克隆含代碼及基礎架構的完整範本倉庫 |
| `azd ai agent init -m` | 從自有代理清單建立 | 從代理定義生成專案結構 |

> **提示：** 學習時使用 `azd init --template`（上述選項 1-3）。生產建立自有代理清單則用 `azd ai agent init`。完整參考請見 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

---

## 🏗️ 代理架構模式

### 模式 1：具工具的單一代理

最簡單的代理模式 — 一個代理可以使用多種工具。

```mermaid
graph TD
    UI[用戶介面] --> Agent[AI 代理<br/>gpt-4.1]
    Agent --> Search[搜尋工具]
    Agent --> Database[數據庫工具]
    Agent --> API[API 工具]
```
**適合：**
- 客服聊天機器人
- 研究助理
- 數據分析代理

**AZD 範本：** `azure-search-openai-demo`

### 模式 2：RAG 代理（檢索增強生成）

先檢索相關文件，再生成回應的代理。

```mermaid
graph TD
    Query[用戶查詢] --> RAG[RAG 代理]
    RAG --> Vector[向量搜尋]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- 文件 --> LLM
    LLM --> Response[帶引用的回應]
```
**適合：**
- 企業知識庫
- 文件問答系統
- 合規及法務研究

**AZD 範本：** `azure-search-openai-demo`

### 模式 3：多代理系統

多個專業代理協同處理複雜任務。

```mermaid
graph TD
    Orchestrator[協調者代理] --> Research[研究代理<br/>gpt-4.1]
    Orchestrator --> Writer[作家代理<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[審閱者代理<br/>gpt-4.1]
```
**適合：**
- 複雜內容產生
- 多步驟工作流程
- 需多方專業的任務

**進一步了解：** [多代理協調模式](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 配置代理工具

代理能使用工具時更強大。以下示範如何配置常見工具：

### Foundry 代理的工具配置

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

### 環境配置

```bash
# 設定代理專用的環境變數
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 使用更新過的配置進行部署
azd deploy
```

---

## 📊 代理監控

### Application Insights 整合

所有 AZD 代理範本都包含 Application Insights 監控：

```bash
# 開啟監控儀表板
azd monitor --overview

# 查看即時日誌
azd monitor --logs

# 查看即時指標
azd monitor --live
```

### 主要追蹤指標

| 指標 | 說明 | 目標 |
|--------|-------------|--------|
| 回應延遲 | 生成回應所需時間 | < 5 秒 |
| 令牌使用量 | 每次請求令牌數 | 監控成本 |
| 工具呼叫成功率 | 成功執行工具百分比 | > 95% |
| 錯誤率 | 代理請求失敗率 | < 1% |
| 使用者滿意度 | 反饋分數 | > 4.0/5.0 |

### 代理的自訂日誌

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# 使用 OpenTelemetry 配置 Azure 監察器
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

> **注意：** 請安裝所需套件：`pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 成本考量

### 按模式估算每月成本

| 模式 | 開發環境 | 生產環境 |
|---------|-----------------|------------|
| 單一代理 | $50-100 | $200-500 |
| RAG 代理 | $80-150 | $300-800 |
| 多代理（2-3 代理） | $150-300 | $500-1,500 |
| 企業多代理 | $300-500 | $1,500-5,000+ |

### 成本優化建議

1. **簡單任務使用 gpt-4.1-mini**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. <strong>針對重複查詢實作快取</strong>
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. <strong>設定每次執行令牌限制</strong>
   ```python
   # 設定 max_completion_tokens 時於執行代理時，而非建立時
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # 限制回應長度
   )
   ```

4. <strong>閒置時調整規模至零</strong>
   ```bash
   # 容器應用程式會自動縮放至零
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 代理排錯

### 常見問題與解決方法

<details>
<summary><strong>❌ 代理不回應工具呼叫</strong></summary>

```bash
# 檢查工具是否已正確註冊
azd show

# 驗證 OpenAI 部署狀況
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# 檢查代理日誌
azd monitor --logs
```

**常見原因：**
- 工具函式簽名不符
- 缺少必要權限
- 無法存取 API 端點
</details>

<details>
<summary><strong>❌ 代理回應延遲過高</strong></summary>

```bash
# 檢查 Application Insights 以尋找瓶頸
azd monitor --live

# 考慮使用更快的模型
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**優化建議：**
- 使用串流回應
- 實作回應快取
- 減少上下文視窗大小
</details>

<details>
<summary><strong>❌ 代理回傳不正確或產生幻覺訊息</strong></summary>

```python
# 使用更好的系統提示進行改進
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 新增檢索以作基礎
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # 將回應以文件為基礎
)
```
</details>

<details>
<summary><strong>❌ 超過令牌限制錯誤</strong></summary>

```python
# 實施上下文窗口管理
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

### 練習 1：部署基礎代理（20 分鐘）

**目標：** 使用 AZD 部署你的第一個 AI 代理

```bash
# 第一步：初始化範本
azd init --template get-started-with-ai-agents

# 第二步：登入 Azure
azd auth login
# 若您跨多個租戶工作，請加上 --tenant-id <tenant-id>

# 第三步：部署
azd up

# 第四步：測試代理程式
# 部署後的預期輸出：
#   部署完成！
#   端點：https://<app-name>.<region>.azurecontainerapps.io
# 開啟輸出中顯示的網址並嘗試提出問題

# 第五步：檢視監控
azd monitor --overview

# 第六步：清理
azd down --force --purge
```

**成功標準：**
- [ ] 代理能回應問題
- [ ] 可以透過 `azd monitor` 存取監控面板
- [ ] 資源成功清除

### 練習 2：新增自訂工具（30 分鐘）

**目標：** 為代理擴充自訂工具

1. 部署代理範本：  
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. 在代理代碼中建立新工具函式：  
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 向天氣服務發出 API 調用
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. 向代理註冊工具：  
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
   # 問：「西雅圖嘅天氣點樣？」
   # 預期：代理人呼叫 get_weather("Seattle") 並回傳天氣資訊
   ```

**成功標準：**
- [ ] 代理能識別天氣相關查詢
- [ ] 正確呼叫工具
- [ ] 回覆包含天氣資訊

### 練習 3：打造 RAG 代理（45 分鐘）

**目標：** 建立從文件回答問題的代理

```bash
# 第一步：部署 RAG 模板
azd init --template azure-search-openai-demo
azd up

# 第二步：上載你的文件
# 將 PDF/TXT 文件置於 data/ 目錄，然後執行：
python scripts/prepdocs.py

# 第三步：用特定領域的問題進行測試
# 從 azd up 輸出中打開網頁應用程式 URL
# 提出關於你上載文件的問題
# 回應應包含如 [doc.pdf] 的引用參考
```

**成功標準：**
- [ ] 代理從上傳文件回答
- [ ] 回應包含引用
- [ ] 非範圍外問題無幻覺

---

## 📚 後續步驟

現在你已了解 AI 代理，探索這些進階主題：

| 主題 | 說明 | 連結 |
|-------|-------------|------|
| <strong>多代理系統</strong> | 建構多代理協作系統 | [零售多代理範例](../../examples/retail-scenario.md) |
| <strong>協調模式</strong> | 學習編排與通訊模式 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) |
| <strong>生產部署</strong> | 企業級代理部署 | [生產 AI 實務](../chapter-08-production/production-ai-practices.md) |
| <strong>代理評估</strong> | 測試及評估代理效能 | [AI 排錯](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI 工作坊實驗室** | 實作：讓你的 AI 解決方案適用於 AZD | [AI 工作坊實驗室](ai-workshop-lab.md) |

---

## 📖 其他資源

### 官方文件
- [Azure AI 代理服務](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure AI Foundry 代理服務快速入門](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [語義核心代理架構](https://learn.microsoft.com/semantic-kernel/)

### 代理 AZD 範本
- [開始使用 AI 代理](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社群資源
- [Awesome AZD - 代理範本](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### 編輯器代理技能
- [**Microsoft Azure 代理技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 在 GitHub Copilot、Cursor 或任一支援的代理內安裝可重用的 Azure 開發 AI 代理技能。包含 [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai)、[Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry)、[部署](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) 及 [診斷](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) 技能：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

<strong>導覽</strong>
- <strong>上一課</strong>: [Microsoft Foundry 整合](microsoft-foundry-integration.md)
- <strong>下一課</strong>: [AI 模型部署](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。儘管我們致力於確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件所使用之母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們對因使用此翻譯而引起之任何誤解或誤釋概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->