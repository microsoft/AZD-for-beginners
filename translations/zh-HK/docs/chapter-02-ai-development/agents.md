# 使用 Azure Developer CLI 的 AI 代理

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第 2 章 - AI 優先開發
- **⬅️ 上一章**: [Microsoft Foundry 整合](microsoft-foundry-integration.md)
- **➡️ 下一章**: [AI 模型部署](ai-model-deployment.md)
- **🚀 進階**: [多代理方案](../../examples/retail-scenario.md)

---

## 介紹

AI 代理是能夠自主感知環境、做出決策並採取行動以達成特定目標的程式。與僅回應提示的簡單聊天機器人不同，代理能夠：

- <strong>使用工具</strong> — 呼叫 API、搜尋資料庫、執行程式碼
- <strong>規劃和推理</strong> — 將複雜任務拆解成多個步驟
- <strong>從上下文學習</strong> — 保持記憶並調整行為
- <strong>協作</strong> — 與其他代理協同工作（多代理系統）

本指南示範如何使用 Azure Developer CLI (azd) 將 AI 代理部署到 Azure。

> **驗證備註 (2026-03-25)：** 本指南基於 `azd` `1.23.12` 及 `azure.ai.agents` `0.1.18-preview` 版本檢視。`azd ai` 功能仍屬預覽階段，請檢查擴充功能說明以了解您安裝的旗標版本。

## 學習目標

完成本指南後，您將能夠：
- 了解什麼是 AI 代理及其與聊天機器人的差異
- 使用 AZD 部署預建的 AI 代理範本
- 配置 Foundry 代理以建立自訂代理
- 實作基本代理模式（工具使用、RAG、多代理）
- 監控並除錯已部署的代理

## 學習成果

完成後，您將能夠：
- 使用單一指令將 AI 代理應用部署至 Azure
- 配置代理的工具與功能
- 實現檢索增強生成 (RAG) 代理
- 設計多代理架構以處理複雜流程
- 排解常見的代理部署問題

---

## 🤖 代理與聊天機器人的差異？

| 特性 | 聊天機器人 | AI 代理 |
|----------|-------------|----------|
| <strong>行為</strong> | 回應提示 | 自主採取行動 |
| <strong>工具</strong> | 無 | 能呼叫 API、搜尋、執行程式碼 |
| <strong>記憶</strong> | 僅限會話 | 跨會話持續記憶 |
| <strong>規劃</strong> | 單一回應 | 多步推理 |
| <strong>協作</strong> | 單一實體 | 可與其他代理合作 |

### 簡單比喻

- <strong>聊天機器人</strong> = 資訊櫃檯中回答問題的服務人員
- **AI 代理** = 能代為撥打電話、預約、完成任務的個人助理

---

## 🚀 快速開始：部署您的第一個代理

### 選項 1：Foundry 代理範本（推薦）

```bash
# 初始化 AI 代理範本
azd init --template get-started-with-ai-agents

# 部署到 Azure
azd up
```

**部署項目：**
- ✅ Foundry 代理
- ✅ Microsoft Foundry 模型（gpt-4.1）
- ✅ Azure AI 搜尋（用於 RAG）
- ✅ Azure 容器應用程式（網頁介面）
- ✅ 應用程式洞察（監控）

**所需時間：** 約 15-20 分鐘
**費用：** 約 $100-150/月（開發）

### 選項 2：使用 Prompty 的 OpenAI 代理

```bash
# 初始化基於 Prompty 的代理模板
azd init --template agent-openai-python-prompty

# 部署到 Azure
azd up
```

**部署項目：**
- ✅ Azure Functions（無伺服器代理執行）
- ✅ Microsoft Foundry 模型
- ✅ Prompty 配置檔
- ✅ 範例代理實作

**所需時間：** 約 10-15 分鐘
**費用：** 約 $50-100/月（開發）

### 選項 3：RAG 聊天代理

```bash
# 初始化 RAG 聊天模板
azd init --template azure-search-openai-demo

# 部署到 Azure
azd up
```

**部署項目：**
- ✅ Microsoft Foundry 模型
- ✅ Azure AI 搜尋與範例資料
- ✅ 文件處理管線
- ✅ 帶引文的聊天介面

**所需時間：** 約 15-25 分鐘
**費用：** 約 $80-150/月（開發）

### 選項 4：AZD AI 代理初始化（基於宣告檔或範本的預覽功能）

若您已有代理宣告檔，可使用 `azd ai` 指令直接產生 Foundry 代理服務專案。近期的預覽版本也加入了基於範本的初始化支援，根據您安裝的擴充版本，提示流程可能略有差異。

```bash
# 安裝 AI 代理擴充功能
azd extension install azure.ai.agents

# 選擇性：驗證已安裝的預覽版本
azd extension show azure.ai.agents

# 從代理清單初始化
azd ai agent init -m agent-manifest.yaml

# 部署到 Azure
azd up

# 測試已部署的代理（顯示延遲 + 首字節時間）
azd ai agent invoke
```

**何時使用 `azd ai agent init` 與 `azd init --template`：**

| 方式 | 適用場景 | 運作方式 |
|----------|----------|-------------|
| `azd init --template` | 從已有範例應用開始 | 複製完整範本庫含程式碼與基礎架構 |
| `azd ai agent init -m` | 根據自己的代理宣告檔建立 | 根據代理定義腳手架專案結構 |

> **提示：** 學習時使用 `azd init --template`（上面選項 1-3）。建置生產代理時使用自訂宣告檔搭配 `azd ai agent init`。

`azd up` 完成後，擴充功能會引導您完成代理生命週期的後續操作：使用 `azd ai agent invoke` 測試，`azd ai agent eval generate` 與 `azd ai agent optimize` 進行品質衡量與優化，`azd ai agent delete` 清理。完整指令參考請見 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

---

## 🏗️ 代理架構模式

### 模式 1：具備工具的單一代理

最簡單的代理模式 — 一個代理可使用多個工具。

```mermaid
graph TD
    UI[用戶介面] --> Agent[AI 代理人<br/>gpt-4.1]
    Agent --> Search[搜尋工具]
    Agent --> Database[資料庫工具]
    Agent --> API[API 工具]
```

**適用：**
- 客戶支持聊天機器人
- 研究助理
- 數據分析代理

**AZD 範本：** `azure-search-openai-demo`

### 模式 2：RAG 代理（檢索增強生成）

代理先檢索相關文件，再生成回應。

```mermaid
graph TD
    Query[用戶查詢] --> RAG[RAG 代理]
    RAG --> Vector[向量搜尋]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- 文件 --> LLM
    LLM --> Response[附帶引用的回應]
```

**適用：**
- 企業知識庫
- 文件問答系統
- 合規與法律研究

**AZD 範本：** `azure-search-openai-demo`

### 模式 3：多代理系統

多個專門代理協同處理複雜任務。

```mermaid
graph TD
    Orchestrator[統籌代理] --> Research[研究代理<br/>gpt-4.1]
    Orchestrator --> Writer[撰寫代理<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[審閱代理<br/>gpt-4.1]
```

**適用：**
- 複雜內容生成
- 多步工作流程
- 需要多種專業知識的任務

**深入了解：** [多代理協調模式](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 配置代理工具

代理能使用工具時更具威力。以下介紹如何配置常見工具：

### Foundry 代理中的工具配置

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

# 使用工具創建代理程式
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### 環境配置

```bash
# 設定特定代理的環境變數
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 以更新後的配置進行部署
azd deploy
```

---

## 📊 監控代理

### 應用程式洞察整合

所有 AZD 代理範本都含有應用程式洞察作為監控：

```bash
# 開啟監控儀表板
azd monitor --overview

# 查看即時日誌
azd monitor --logs

# 查看即時指標
azd monitor --live
```

### 需追蹤的關鍵指標

| 指標 | 說明 | 目標值 |
|------|-------|--------|
| 回應延遲 | 產生回應所需時間 | < 5 秒 |
| 令牌使用量 | 每次請求使用的令牌數 | 監控成本 |
| 工具呼叫成功率 | 工具執行成功百分比 | > 95% |
| 錯誤率 | 代理請求失敗率 | < 1% |
| 使用者滿意度 | 回饋分數 | > 4.0/5.0 |

### 代理自訂日誌

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# 使用 OpenTelemetry 配置 Azure Monitor
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

> **備註：** 請安裝必要套件：`pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 成本考量

### 各模式估算月費用

| 模式 | 開發環境 | 生產環境 |
|---------|---------|-----------|
| 單一代理 | $50-100 | $200-500 |
| RAG 代理 | $80-150 | $300-800 |
| 多代理（2-3 代理） | $150-300 | $500-1500 |
| 企業多代理 | $300-500 | $1,500-5,000+ |

### 成本優化建議

1. **簡單任務使用 gpt-4.1-mini**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. <strong>對重複查詢實作快取</strong>
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. <strong>設定每次執行的令牌限制</strong>
   ```python
   # 於運行代理時設定 max_completion_tokens，而非於創建時設定
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # 限制回應長度
   )
   ```

4. <strong>閒置時縮減至零規模</strong>
   ```bash
   # 容器應用程式自動縮放至零
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 代理故障排除

### 常見問題及解決方法

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
- 工具函式簽章不匹配
- 缺少必要權限
- API 端點無法存取
</details>

<details>
<summary><strong>❌ 代理回應延遲高</strong></summary>

```bash
# 檢查 Application Insights 以找出瓶頸
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
<summary><strong>❌ 代理回傳錯誤或幻覺資訊</strong></summary>

```python
# 通過更好的系統提示進行改進
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 新增檢索以作為依據
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # 讓回答以文件為依據
)
```
</details>

<details>
<summary><strong>❌ 超過令牌限制錯誤</strong></summary>

```python
# 實現上下文視窗管理
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

**目標：** 使用 AZD 部署第一個 AI 代理

```bash
# 第一步：初始化範本
azd init --template get-started-with-ai-agents

# 第二步：登入 Azure
azd auth login
# 如果你在多個租戶中操作，請加上 --tenant-id <tenant-id>

# 第三步：部署
azd up

# 第四步：測試代理
# 部署後預期輸出：
#   部署完成！
#   端點：https://<app-name>.<region>.azurecontainerapps.io
# 開啟輸出中顯示的網址，嘗試提出問題

# 第五步：查看監控
azd monitor --overview

# 第六步：清理
azd down --force --purge
```

**成功標準：**
- [ ] 代理能回答問題
- [ ] 可透過 `azd monitor` 存取監控儀表板
- [ ] 成功清理資源

### 練習 2：新增自訂工具（30 分鐘）

**目標：** 為代理擴充自訂工具

1. 部署代理範本：
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. 在代理程式碼中建立新的工具函式：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 向天氣服務的 API 請求
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
   # 問：「西雅圖的天氣如何？」
   # 預期：代理人呼叫 get_weather("Seattle") 並回傳天氣資訊
   ```

**成功標準：**
- [ ] 代理識別天氣相關查詢
- [ ] 工具正確被呼叫
- [ ] 回應包含天氣資訊

### 練習 3：打造 RAG 代理（45 分鐘）

**目標：** 創建一個可從文件回答問題的代理

```bash
# 第一步：部署 RAG 模板
azd init --template azure-search-openai-demo
azd up

# 第二步：上傳你的文件
# 將 PDF/TXT 檔案放入 data/ 目錄，然後執行：
python scripts/prepdocs.py

# 第三步：使用特定領域問題進行測試
# 從 azd up 輸出中打開網頁應用程式 URL
# 問關於你上傳文件的問題
# 回答應包含如 [doc.pdf] 的引用參考
```

**成功標準：**
- [ ] 代理能基於已上傳文件回答
- [ ] 回應含引用資料
- [ ] 對範圍外問題不產生幻覺

---

## 📚 後續進階

了解 AI 代理後，探索以下主題：

| 主題 | 說明 | 連結 |
|-------|--------|-------|
| <strong>多代理系統</strong> | 建立多代理協同系統 | [零售多代理範例](../../examples/retail-scenario.md) |
| <strong>協調模式</strong> | 學習編排與通訊模式 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) |
| <strong>生產部署</strong> | 企業等級的代理部署 | [生產 AI 實務](../chapter-08-production/production-ai-practices.md) |
| <strong>代理評估</strong> | 測試及評估代理效能 | [AI 故障排除](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI 實務工作坊** | 動手：使您的 AI 解決方案適用 AZD | [AI 實務工作坊](ai-workshop-lab.md) |

---

## 📖 附加資源

### 官方文件
- [Microsoft Foundry 代理服務](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry 代理服務快速入門](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent 框架](https://learn.microsoft.com/semantic-kernel/)

### AZD 代理範本
- [開始使用 AI 代理](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社群資源
- [Awesome AZD - 代理範本](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### 編輯器用代理技能
- [**Microsoft Azure 代理技能**](https://skills.sh/microsoft/github-copilot-for-azure) — 安裝可重用的 Azure AI 代理技能，支援 GitHub Copilot、Cursor 或其他代理。包含 [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai)、[Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry)、[部署](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) 及 [診斷](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) 等技能：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

<strong>導覽</strong>
- <strong>上一課程</strong>: [Microsoft Foundry 整合](microsoft-foundry-integration.md)
- <strong>下一課程</strong>: [AI 模型部署](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->