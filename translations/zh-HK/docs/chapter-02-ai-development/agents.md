# 使用 Azure Developer CLI 的 AI 代理

**章節導航：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 當前章節**: 第 2 章 - AI 優先開發
- **⬅️ 上一章**: [Microsoft Foundry 整合](microsoft-foundry-integration.md)
- **➡️ 下一章**: [AI 模型部署](ai-model-deployment.md)
- **🚀 進階**: [多代理解決方案](../../examples/retail-scenario.md)

---

## 介紹

AI 代理是能感知其環境、自主做決策並採取行動以達成特定目標的自動化程式。與只是回應提示的簡單聊天機器人不同，代理可以：

- <strong>使用工具</strong> — 呼叫 API、搜尋資料庫、執行程式碼
- <strong>規劃與推理</strong> — 將複雜任務拆解成步驟
- <strong>從上下文學習</strong> — 保持記憶並調節行為
- <strong>協作</strong> — 與其他代理合作（多代理系統）

本指南展示如何使用 Azure Developer CLI (azd) 部署 AI 代理至 Azure。

> **驗證註記 (2026-07-13)：** 本指南已依 `azd` `1.27.1` 及 `azure.ai.agents` `1.0.0-beta.5` 版本審核。`azd ai` 功能仍屬預覽階段，若您安裝的旗標有所不同，請查閱擴充說明。

## 學習目標

完成本指南後，您將能：
- 了解什麼是 AI 代理及其與聊天機器人的差異
- 使用 AZD 部署預建的 AI 代理範本
- 配置 Foundry 代理作為自訂代理
- 實作基礎代理範式（工具使用、RAG、多代理）
- 監控及除錯已部署的代理

## 學習成果

完成後，您將能：
- 以單一命令部署 AI 代理應用至 Azure
- 配置代理工具和功能
- 實作帶有代理的檢索式增強生成 (RAG)
- 設計多代理架構以應對複雜工作流程
- 疑難排解常見的代理部署問題

---

## 🤖 代理與聊天機器人的差異？

| 特性 | 聊天機器人 | AI 代理 |
|---------|---------|----------|
| <strong>行為</strong> | 回應提示 | 採取自主行動 |
| <strong>工具</strong> | 無 | 可呼叫 API、搜尋及執行程式碼 |
| <strong>記憶</strong> | 僅限制於會話 | 跨會話持久記憶 |
| <strong>規劃</strong> | 單次回應 | 多步推理 |
| <strong>協作</strong> | 單一實體 | 可與其他代理合作 |

### 簡單比喻

- <strong>聊天機器人</strong> = 資訊櫃檯的助人員，回答問題
- **AI 代理** = 個人助理，可以打電話、預約和完成任務

---

## 🚀 快速開始：部署您的第一個代理

### 選項 1：Foundry 代理範本 (推薦)

```bash
# 初始化 AI 代理範本
azd init --template get-started-with-ai-agents

# 部署到 Azure
azd up
```

**部署內容：**
- ✅ Foundry 代理
- ✅ Microsoft Foundry 模型 (gpt-4.1)
- ✅ Azure AI Search（用於 RAG）
- ✅ Azure Container Apps（網頁介面）
- ✅ Application Insights (監控)

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
- ✅ Prompty 配置檔
- ✅ 範例代理實作

**時間：** 約 10-15 分鐘
**費用：** 約 $50-100/月（開發）

### 選項 3：RAG 聊天代理

```bash
# 初始化 RAG 聊天模板
azd init --template azure-search-openai-demo

# 部署到 Azure
azd up
```

**部署內容：**
- ✅ Microsoft Foundry 模型
- ✅ Azure AI Search 及範例資料
- ✅ 文件處理流程
- ✅ 具備來源引證的聊天介面

**時間：** 約 15-25 分鐘
**費用：** 約 $80-150/月（開發）

### 選項 4：AZD AI 代理初始化（基於 Manifest 或範本的預覽版）

如果您有代理 manifest 檔案，可以使用 `azd ai` 指令直接產生 Foundry 代理服務專案。近期的預覽版本也加入了基於範本的初始化支援，因此具體的提示流程可能依您安裝的擴充版本略有不同。

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

**何時使用 `azd ai agent init` vs `azd init --template`：**

| 方式 | 適合對象 | 運作方式 |
|----------|----------|------|
| `azd init --template` | 從可運行的範例應用開始 | 複製完整範本 repo 含程式碼與基礎建設 |
| `azd ai agent init -m` | 使用您自己的代理 manifest 建置 | 從代理定義產生專案結構 |

> **提示：** 學習時使用 `azd init --template`（以上選項 1-3）。生產時使用您自定義 manifest 的 `azd ai agent init`。

執行完 `azd up` 後，該擴充將引導您完成代理生命週期：使用 `azd ai agent invoke` 測試，使用 `azd ai agent eval generate` 和 `azd ai agent optimize` 進行品質衡量與改善，最後以 `azd ai agent delete` 清理。詳細參考[AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

---

## 🏗️ 代理架構範式

### 範式 1：具工具的單一代理

最簡單的代理範式 — 單一代理可使用多個工具。

```mermaid
graph TD
    UI[用戶介面] --> Agent[AI 代理<br/>gpt-4.1]
    Agent --> Search[搜尋工具]
    Agent --> Database[資料庫工具]
    Agent --> API[API 工具]
```

**適合：**
- 客服機器人
- 研究助理
- 資料分析代理

**AZD 範本：** `azure-search-openai-demo`

### 範式 2：RAG 代理（檢索增強生成）

在產生回應前先檢索相關文件的代理。

```mermaid
graph TD
    Query[用戶查詢] --> RAG[RAG 代理]
    RAG --> Vector[向量搜尋]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Documents --> LLM
    LLM --> Response[附帶引用的回應]
```

**適合：**
- 企業知識庫
- 文件問答系統
- 合規與法律調查

**AZD 範本：** `azure-search-openai-demo`

### 範式 3：多代理系統

多個專門代理共同合作處理複雜任務。

```mermaid
graph TD
    Orchestrator[協調者代理] --> Research[研究代理<br/>gpt-4.1]
    Orchestrator --> Writer[寫作代理<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[審閱代理<br/>gpt-4.1]
```

**適合：**
- 複雜內容生成
- 多步流程
- 需不同專業的任務

**深入了解：** [多代理協調模式](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 配置代理工具

代理具備工具使用能力會更強大。以下說明如何配置常用工具：

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
# 設定代理專用的環境變數
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 使用更新的配置進行部署
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

### 主要指標追蹤

| 指標 | 說明 | 目標 |
|--------|-------------|--------|
| 回應延遲 | 產生回應所需時間 | < 5 秒 |
| 令牌使用量 | 每次請求使用的令牌數 | 監控費用 |
| 工具呼叫成功率 | 工具成功執行比例 | > 95% |
| 錯誤率 | 代理請求失敗率 | < 1% |
| 用戶滿意度 | 反饋評分 | > 4.0/5.0 |

### 自訂代理日誌

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# 配置 Azure Monitor 與 OpenTelemetry
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

> **注意：** 安裝必要套件：`pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 成本考量

### 各範式估計每月成本

| 範式 | 開發環境 | 生產環境 |
|---------|-----------------|------------|
| 單一代理 | $50-100 | $200-500 |
| RAG 代理 | $80-150 | $300-800 |
| 多代理 (2-3 個代理) | $150-300 | $500-1,500 |
| 企業多代理 | $300-500 | $1,500-5,000+ |

### 成本優化建議

1. **對簡單任務使用 gpt-4.1-mini**
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

3. <strong>設定每次執行的令牌上限</strong>
   ```python
   # 設定 max_completion_tokens 時應於執行代理時，而非建立期間
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # 限制回應長度
   )
   ```

4. <strong>閒置時縮減規模至零</strong>
   ```bash
   # 容器應用會自動擴展至零
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
- 工具函式簽名不符
- 缺少必要權限
- API 端點無法訪問
</details>

<details>
<summary><strong>❌ 代理回應延遲高</strong></summary>

```bash
# 檢查 Application Insights 以尋找瓶頸
azd monitor --live

# 考慮使用更快的模型
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**優化建議：**
- 使用串流回應
- 實施回應快取
- 減少上下文視窗大小
</details>

<details>
<summary><strong>❌ 代理回傳錯誤或幻覺資訊</strong></summary>

```python
# 透過更好的系統提示改進
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 增加檢索以作為依據
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # 以文件作為回應依據
)
```
</details>

<details>
<summary><strong>❌ 超過令牌限制錯誤</strong></summary>

```python
# 實現上下文窗口管理
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

**目標：** 使用 AZD 部署您的第一個 AI 代理

```bash
# 第一步：初始化範本
azd init --template get-started-with-ai-agents

# 第二步：登入 Azure
azd auth login
# 如果跨多個租戶工作，請加上 --tenant-id <tenant-id>

# 第三步：部署
azd up

# 第四步：測試代理程式
# 部署後預期輸出：
#   部署完成！
#   端點：https://<app-name>.<region>.azurecontainerapps.io
# 開啟輸出顯示的網址並嘗試提問

# 第五步：檢視監控
azd monitor --overview

# 第六步：清理環境
azd down --force --purge
```

**成功標準：**
- [ ] 代理能回應問題
- [ ] 能透過 `azd monitor` 存取監控儀表板
- [ ] 成功清理資源

### 練習 2：新增自訂工具（30 分鐘）

**目標：** 擴展代理以包含自訂工具

1. 部署代理範本：
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. 在您的代理程式碼中建立新的工具函式：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API 呼叫天氣服務
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. 向代理註冊此工具：
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
   # 預期：代理會呼叫 get_weather("Seattle") 並返回天氣資訊
   ```

**成功標準：**
- [ ] 代理識別天氣相關查詢
- [ ] 工具被正確呼叫
- [ ] 回應包含天氣資訊

### 練習 3：建立 RAG 代理（45 分鐘）

**目標：** 建立一個能從您的文件中回答問題的代理

```bash
# 第一步：部署 RAG 模板
azd init --template azure-search-openai-demo
azd up

# 第二步：上傳你的文件
# 將 PDF/TXT 檔案放入 data/ 目錄，然後運行：
python scripts/prepdocs.py

# 第三步：使用特定領域問題進行測試
# 從 azd up 輸出中打開網頁應用程式網址
# 詢問有關你已上傳文件的問題
# 回答應包括像 [doc.pdf] 這樣的引用參考
```

**成功標準：**
- [ ] 代理能從上傳的文件回答問題
- [ ] 回應包含引用來源
- [ ] 對範圍外問題無幻覺

---

## 📚 下一步

了解 AI 代理後，探索這些進階主題：

| 主題 | 說明 | 連結 |
|-------|-------------|------|
| <strong>多代理系統</strong> | 建立多個協作代理系統 | [零售多代理範例](../../examples/retail-scenario.md) |
| <strong>協調模式</strong> | 學習編排與通訊模式 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) |
| <strong>生產部署</strong> | 企業級代理部署 | [生產 AI 實務](../chapter-08-production/production-ai-practices.md) |
| <strong>代理評估</strong> | 測試與評估代理績效 | [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI 實務工作坊** | 實作：讓您的 AI 解決方案符合 AZD | [AI 實務工作坊](ai-workshop-lab.md) |

---

## 📖 附加資源

### 官方文件
- [Microsoft Foundry 代理服務](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry 代理服務快速入門](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel 代理框架](https://learn.microsoft.com/semantic-kernel/)

### AZD 代理範本
- [開始使用 AI 代理](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI 示範](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社群資源
- [Awesome AZD - 代理範本](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### 編輯器用代理技能
- [**Microsoft Azure 代理技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 在 GitHub Copilot、Cursor 或任何支援的代理中安裝可重用的 Azure 開發 AI 代理技能。包含 [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai)、[Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry)、[部署](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) 和 [診斷](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) 的技能：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

<strong>導航</strong>
- <strong>上一課</strong>: [Microsoft Foundry 整合](microsoft-foundry-integration.md)
- <strong>下一課</strong>: [AI 模型部署](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->