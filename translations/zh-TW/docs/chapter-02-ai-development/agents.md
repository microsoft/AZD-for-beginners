# 使用 Azure Developer CLI 的 AI 代理

**章節導覽：**
- **📚 課程首頁**：[AZD初學者指南](../../README.md)
- **📖 目前章節**：第 2 章 - AI 為先的開發
- **⬅️ 上一章**：[Microsoft Foundry 整合](microsoft-foundry-integration.md)
- **➡️ 下一章**：[AI 模型部署](ai-model-deployment.md)
- **🚀 進階章節**：[多代理方案](../../examples/retail-scenario.md)

---

## 介紹

AI 代理是能夠感知環境、做決策並採取行動以達成特定目標的自主程式。與只回應提示的簡易聊天機器人不同，代理能夠：

- <strong>使用工具</strong> - 呼叫 API、搜尋資料庫、執行程式碼
- <strong>規劃與推理</strong> - 將複雜任務拆解為步驟
- <strong>從上下文學習</strong> - 保持記憶並調整行為
- <strong>協同合作</strong> - 與其他代理（多代理系統）合作

本指南示範如何使用 Azure Developer CLI (azd) 部署 AI 代理到 Azure。

> **驗證說明 (2026-07-13)：** 本指南已依 `azd` `1.27.1` 及 `azure.ai.agents` `1.0.0-beta.5` 版本進行審核。`azd ai` 功能仍以預覽為主，如安裝標誌有異，請參閱擴充功能說明。

## 學習目標

完成本指南後，您將能：
- 了解 AI 代理是什麼，以及它們與聊天機器人的差異
- 使用 AZD 部署預建 AI 代理範本
- 為自訂代理配置 Foundry Agents
- 實作基本代理模式（工具使用、RAG、多代理）
- 監控並除錯已部署的代理

## 學習成果

完成後您將能：
- 使用單一指令將 AI 代理應用程式部署到 Azure
- 配置代理工具與功能
- 以代理實作檢索增強生成 (RAG)
- 設計多代理架構以完成複雜工作流程
- 排解代理部署常見問題

---

## 🤖 代理與聊天機器人的差異

| 特性 | 聊天機器人 | AI 代理 |
|---------|---------|----------|
| <strong>行為</strong> | 回應提示 | 主動採取行動 |
| <strong>工具</strong> | 無 | 能呼叫 API、搜尋、執行程式碼 |
| <strong>記憶</strong> | 僅依賴會話 | 跨會話持續記憶 |
| <strong>規劃</strong> | 單次回應 | 多步推理 |
| <strong>協作</strong> | 單一實體 | 能與其他代理合作 |

### 簡單比喻

- <strong>聊天機器人</strong> = 一位在資訊櫃檯回答問題的助人員
- **AI 代理** = 個人助理，可以打電話、安排預約並完成任務

---

## 🚀 快速開始：部署你的第一個代理

### 選項 1：Foundry Agents 範本（推薦）

```bash
# 初始化 AI 代理範本
azd init --template get-started-with-ai-agents

# 部署到 Azure
azd up
```

**部署內容：**
- ✅ Foundry Agents
- ✅ Microsoft Foundry 模型（gpt-4.1）
- ✅ Azure AI 搜尋（用於 RAG）
- ✅ Azure Container Apps（網頁介面）
- ✅ Application Insights（監控）

**時間：** 約 15-20 分鐘
**費用：** 約 $100-150/月（開發用）

### 選項 2：OpenAI Agent 搭配 Prompty

```bash
# 初始化基於 Prompty 的代理範本
azd init --template agent-openai-python-prompty

# 部署到 Azure
azd up
```

**部署內容：**
- ✅ Azure Functions（無伺服器代理執行）
- ✅ Microsoft Foundry 模型
- ✅ Prompty 配置檔
- ✅ 範例代理實作

**時間：** 約 10-15 分鐘
**費用：** 約 $50-100/月（開發用）

### 選項 3：RAG 聊天代理

```bash
# 初始化 RAG 聊天範本
azd init --template azure-search-openai-demo

# 部署到 Azure
azd up
```

**部署內容：**
- ✅ Microsoft Foundry 模型
- ✅ 內含範例資料的 Azure AI 搜尋
- ✅ 文件處理流程
- ✅ 帶引用的聊天介面

**時間：** 約 15-25 分鐘
**費用：** 約 $80-150/月（開發用）

### 選項 4：AZD AI 代理初始化（基於清單或範本的預覽）

如果您有代理清單檔，可以使用 `azd ai` 指令直接腳手架 Foundry Agent 服務專案。近期預覽版本也加入了範本初始化支援，實際提示流程可能會依您安裝的擴充版本略有不同。

```bash
# 安裝 AI 代理擴充功能
azd extension install azure.ai.agents

# 選用：驗證已安裝的預覽版本
azd extension show azure.ai.agents

# 從代理清單初始化
azd ai agent init -m agent-manifest.yaml

# 部署到 Azure
azd up

# 測試已部署的代理（顯示延遲＋首字節時間）
azd ai agent invoke
```

**何時使用 `azd ai agent init` 與 `azd init --template`：**

| 方法 | 適用情境 | 運作方式 |
|----------|----------|------|
| `azd init --template` | 從可工作的範例應用開始 | 複製包含程式碼與基礎架構的完整範本儲存庫 |
| `azd ai agent init -m` | 從自己的代理清單建構 | 根據代理定義腳手架專案結構 |

> **提示：** 學習時請使用 `azd init --template`（上方選項 1-3）。建立生產代理且有自訂清單時使用 `azd ai agent init`。

執行 `azd up` 後，同一擴充會引導您完成代理生命周期剩餘階段：使用 `azd ai agent invoke` 測試，`azd ai agent eval generate` 和 `azd ai agent optimize` 進行品質測試與改進，`azd ai agent delete` 做清理。完整指令參考請見 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

---

## 🏗️ 代理架構模式

### 模式 1：單一具工具代理

最簡單的代理模式 — 單一代理使用多種工具。

```mermaid
graph TD
    UI[使用者介面] --> Agent[AI 代理<br/>gpt-4.1]
    Agent --> Search[搜尋工具]
    Agent --> Database[資料庫工具]
    Agent --> API[API 工具]
```

**適用於：**
- 客戶支援機器人
- 研究助理
- 資料分析代理

**AZD 範本：** `azure-search-openai-demo`

### 模式 2：RAG 代理（檢索增強式生成）

在生成回應前先檢索相關文件的代理。

```mermaid
graph TD
    Query[使用者查詢] --> RAG[RAG 代理]
    RAG --> Vector[向量搜尋]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Documents --> LLM
    LLM --> Response[含引文的回應]
```

**適用於：**
- 企業知識庫
- 文件問答系統
- 合規及法律研究

**AZD 範本：** `azure-search-openai-demo`

### 模式 3：多代理系統

多個專門代理協同合作完成複雜任務。

```mermaid
graph TD
    Orchestrator[編排代理人] --> Research[研究代理人<br/>gpt-4.1]
    Orchestrator --> Writer[撰寫代理人<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[審閱代理人<br/>gpt-4.1]
```

**適用於：**
- 複雜內容生成
- 多步驟工作流程
- 需要不同專長的任務

**了解更多：** [多代理協作模式](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 配置代理工具

代理變得強大是因為它們能使用工具。以下是常用工具配置方法：

### Foundry Agents 中的工具配置

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

# 使用工具創建代理
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### 環境配置

```bash
# 設定代理專屬的環境變數
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 使用更新的設定進行部署
azd deploy
```

---

## 📊 監控代理

### Application Insights 整合

所有 AZD 代理範本皆包含 Application Insights 用於監控：

```bash
# 開啟監控儀錶板
azd monitor --overview

# 查看即時日誌
azd monitor --logs

# 查看即時指標
azd monitor --live
```

### 主要追蹤指標

| 指標 | 說明 | 目標 |
|--------|-------------|--------|
| 回應延遲 | 產生回應的時間 | < 5 秒 |
| 代幣使用量 | 每次請求使用的代幣數 | 監控成本 |
| 工具呼叫成功率 | 工具執行成功的百分比 | > 95% |
| 錯誤率 | 代理請求失敗率 | < 1% |
| 用戶滿意度 | 反饋分數 | > 4.0/5.0 |

### 自訂代理日誌紀錄

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# 使用 OpenTelemetry 配置 Azure 監控
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

### 按模式估算每月成本

| 模式 | 開發環境 | 生產環境 |
|---------|-----------------|------------|
| 單一代理 | $50-100 | $200-500 |
| RAG 代理 | $80-150 | $300-800 |
| 多代理 (2-3 代理) | $150-300 | $500-1,500 |
| 企業多代理 | $300-500 | $1,500-5,000+ |

### 成本優化建議

1. **簡單任務使用 gpt-4.1-mini**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. <strong>對重複查詢實施快取</strong>
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. <strong>設定每次執行的代幣上限</strong>
   ```python
   # 在執行代理時設定 max_completion_tokens，而非在建立期間設定
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # 限制回應長度
   )
   ```

4. <strong>不使用時縮放至零</strong>
   ```bash
   # 容器應用會自動縮減至零
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 排除代理故障

### 常見問題與解決方案

<details>
<summary><strong>❌ 代理無法回應工具呼叫</strong></summary>

```bash
# 檢查工具是否正確註冊
azd show

# 驗證 OpenAI 部署
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# 檢查代理日誌
azd monitor --logs
```

**常見原因：**
- 工具函數簽名不匹配
- 缺少必要權限
- API 端點無法訪問
</details>

<details>
<summary><strong>❌ 代理回應延遲過高</strong></summary>

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
<summary><strong>❌ 代理回應錯誤或幻覺資訊</strong></summary>

```python
# 使用更好的系統提示進行改進
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 添加檢索以進行基礎設置
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # 讓回應根據文件為依據
)
```
</details>

<details>
<summary><strong>❌ 代幣限制超出錯誤</strong></summary>

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

**目標：** 使用 AZD 部署你的第一個 AI 代理

```bash
# 第一步：初始化範本
azd init --template get-started-with-ai-agents

# 第二步：登入 Azure
azd auth login
# 如果您跨租戶工作，請新增 --tenant-id <tenant-id>

# 第三步：部署
azd up

# 第四步：測試代理程式
# 部署後預期輸出：
#   部署完成！
#   端點：https://<app-name>.<region>.azurecontainerapps.io
# 開啟輸出中顯示的 URL 並嘗試提出問題

# 第五步：查看監控
azd monitor --overview

# 第六步：清理
azd down --force --purge
```

**成功標準：**
- [ ] 代理能回應問題
- [ ] 可透過 `azd monitor` 存取監控儀表板
- [ ] 資源成功清理

### 練習 2：添加自訂工具（30 分鐘）

**目標：** 擴展代理，新增自訂工具

1. 部署代理範本：
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. 在代理程式碼中建立新工具函數：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 呼叫天氣服務的 API
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
   # 問：「西雅圖的天氣如何？」
   # 預期：代理呼叫 get_weather("Seattle") 並返回天氣資訊
   ```

**成功標準：**
- [ ] 代理識別天氣相關查詢
- [ ] 工具被正確呼叫
- [ ] 回應包含天氣資訊

### 練習 3：建立 RAG 代理（45 分鐘）

**目標：** 建立一個可從文件中回答問題的代理

```bash
# 第一步驟：部署 RAG 範本
azd init --template azure-search-openai-demo
azd up

# 第二步驟：上傳您的文件
# 將 PDF/TXT 檔案放入 data/ 目錄，然後執行：
python scripts/prepdocs.py

# 第三步驟：使用特定領域的問題進行測試
# 從 azd up 輸出中打開網頁應用程式網址
# 問關於您上傳文件的問題
# 回應應包含如 [doc.pdf] 的引用參考
```

**成功標準：**
- [ ] 代理能從上傳文件回答問題
- [ ] 回應包含引用來源
- [ ] 對範圍外問題無幻覺回應

---

## 📚 下一步

既然您已了解 AI 代理，請探索以下進階主題：

| 主題 | 說明 | 連結 |
|-------|-------------|------|
| <strong>多代理系統</strong> | 建立多個合作代理系統 | [零售多代理範例](../../examples/retail-scenario.md) |
| <strong>協調模式</strong> | 學習編排與通訊模式 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) |
| <strong>生產部署</strong> | 企業級代理部署 | [生產AI實務](../chapter-08-production/production-ai-practices.md) |
| <strong>代理評估</strong> | 測試與評估代理表現 | [AI疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI 實作工坊** | 實作：讓您的 AI 解決方案符合 AZD | [AI 實作工坊](ai-workshop-lab.md) |

---

## 📖 其他資源

### 官方文件
- [Microsoft Foundry Agent 服務](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry Agent 服務快速入門](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel 代理框架](https://learn.microsoft.com/semantic-kernel/)

### AI 代理的 AZD 範本
- [開始使用 AI 代理](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社群資源
- [Awesome AZD - 代理範本](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### 編輯器的代理技能
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - 安裝可重用的 Azure 開發 AI 代理技能於 GitHub Copilot、Cursor 或任何支援的代理中。包含 [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai)、[Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry)、[部署](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) 與 [診斷](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) 的技能：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

<strong>導覽</strong>
- <strong>上一課</strong>：[Microsoft Foundry 整合](microsoft-foundry-integration.md)
- <strong>下一課</strong>：[AI 模型部署](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->