# 使用 Azure Developer CLI 的 AI 代理

**章節導覽：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 本章節**：第 2 章 - AI 優先開發
- **⬅️ 上一章**：[Microsoft Foundry 整合](microsoft-foundry-integration.md)
- **➡️ 下一章**：[AI 模型部署](ai-model-deployment.md)
- **🚀 進階章節**：[多代理解決方案](../../examples/retail-scenario.md)

---

## 介紹

AI 代理是能夠感知環境、自主決策並採取行動以完成特定目標的自主程式。與僅對提示做出回應的簡單聊天機器人不同，代理可以：

- <strong>使用工具</strong> — 呼叫 API、搜尋資料庫、執行程式碼
- <strong>規劃與推理</strong> — 將複雜任務拆分成多步驟
- <strong>從上下文中學習</strong> — 維持記憶並調整行為
- <strong>協同合作</strong> — 與其他代理（多代理系統）協作

本指南將示範如何使用 Azure Developer CLI (azd) 部署 AI 代理到 Azure。

> **驗證說明（2026-03-25）：** 本指南已針對 `azd` `1.23.12` 版本與 `azure.ai.agents` `0.1.18-preview` 版本進行審查。`azd ai` 體驗仍處於預覽階段，若您安裝的標誌與此不同，請查看擴充功能說明。

## 學習目標

完成本指南後，您將能夠：
- 了解 AI 代理是什麼以及它們如何區別於聊天機器人
- 使用 AZD 部署預建的 AI 代理範本
- 為自訂代理設定 Foundry Agents
- 實作基本代理模式（工具使用、RAG、多代理）
- 監控及偵錯已部署的代理

## 學習成果

完成後，您將能夠：
- 使用單一指令部署 AI 代理應用程式至 Azure
- 配置代理的工具及能力
- 與代理一起實現檢索增強生成（RAG）
- 設計多代理架構以處理複雜工作流程
- 解決常見代理部署問題

---

## 🤖 代理與聊天機器人的差異？

| 特性 | 聊天機器人 | AI 代理 |
|---------|---------|----------|
| <strong>行為</strong> | 對提示回應 | 採取自主行動 |
| <strong>工具</strong> | 無 | 可呼叫 API、搜尋、執行程式碼 |
| <strong>記憶</strong> | 只限會話記憶 | 跨會話的持久記憶 |
| <strong>規劃</strong> | 單一步回應 | 多步驟推理 |
| <strong>協作</strong> | 單一實體 | 可與其他代理協作 |

### 簡單比喻

- <strong>聊天機器人</strong> = 一位在資訊台回答問題的熱心人員
- **AI 代理** = 一位能撥電話、預約與完成任務的私人助理

---

## 🚀 快速開始：部署你的第一個代理

### 選項 1：Foundry Agents 範本（推薦）

```bash
# 初始化 AI 代理範本
azd init --template get-started-with-ai-agents

# 部署至 Azure
azd up
```

**部署內容：**
- ✅ Foundry Agents
- ✅ Microsoft Foundry 模型 (gpt-4.1)
- ✅ Azure AI Search（用於 RAG）
- ✅ Azure Container Apps（網頁介面）
- ✅ Application Insights（監控）

**時間：** 約 15-20 分鐘  
**費用：** 約 $100-150/月（開發）

### 選項 2：搭配 Prompty 的 OpenAI 代理

```bash
# 初始化基於 Prompty 的代理範本
azd init --template agent-openai-python-prompty

# 部署到 Azure
azd up
```

**部署內容：**
- ✅ Azure Functions（無伺服器代理執行）
- ✅ Microsoft Foundry 模型
- ✅ Prompty 配置檔案
- ✅ 範例代理實作

**時間：** 約 10-15 分鐘  
**費用：** 約 $50-100/月（開發）

### 選項 3：RAG 聊天代理

```bash
# 初始化 RAG 聊天範本
azd init --template azure-search-openai-demo

# 部署至 Azure
azd up
```

**部署內容：**
- ✅ Microsoft Foundry 模型
- ✅ 含範例資料的 Azure AI Search
- ✅ 文件處理管線
- ✅ 帶引用的聊天介面

**時間：** 約 15-25 分鐘  
**費用：** 約 $80-150/月（開發）

### 選項 4：AZD AI 代理初始化（基於清單或範本的預覽）

如果您有代理清單檔案，可以使用 `azd ai` 指令直接生成 Foundry Agent Service 專案。近期預覽版本也新增了基於範本的初始化支援，根據您安裝的擴充版本，提示流程可能略有不同。

```bash
# 安裝 AI 代理擴充功能
azd extension install azure.ai.agents

# 選用：驗證已安裝的預覽版本
azd extension show azure.ai.agents

# 從代理清單初始化
azd ai agent init -m agent-manifest.yaml

# 部署到 Azure
azd up
```

**何時使用 `azd ai agent init` 與 `azd init --template`：**

| 方法 | 適用情境 | 運作方式 |
|----------|----------|------|
| `azd init --template` | 從可用範例應用程式開始 | 複製包含程式碼和基礎架構的完整範本儲存庫 |
| `azd ai agent init -m` | 從自己的代理清單建置 | 從代理定義生成專案結構 |

> **提示：** 學習時推薦使用 `azd init --template`（上述選項 1-3）。打造正式代理且有清單時請使用 `azd ai agent init`。完整參考見 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

---

## 🏗️ 代理架構模式

### 模式 1：具有工具的單一代理

最簡單的代理模式 — 一個代理可使用多種工具。

```mermaid
graph TD
    UI[使用者介面] --> Agent[AI代理人<br/>gpt-4.1]
    Agent --> Search[搜尋工具]
    Agent --> Database[資料庫工具]
    Agent --> API[API工具]
```
**適用於：**
- 客戶支援機器人
- 研究助理
- 數據分析代理

**AZD 範本：** `azure-search-openai-demo`

### 模式 2：RAG 代理（檢索增強生成）

先檢索相關文件，再生成回應的代理。

```mermaid
graph TD
    Query[使用者查詢] --> RAG[RAG 代理]
    RAG --> Vector[向量檢索]
    RAG --> LLM[大型語言模型<br/>gpt-4.1]
    Vector -- 文件 --> LLM
    LLM --> Response[帶有引用的回應]
```
**適用於：**
- 企業知識庫
- 文件問答系統
- 合規及法律研究

**AZD 範本：** `azure-search-openai-demo`

### 模式 3：多代理系統

多個專業代理協同處理複雜任務。

```mermaid
graph TD
    Orchestrator[調度代理] --> Research[研究代理<br/>gpt-4.1]
    Orchestrator --> Writer[撰寫代理<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[審閱代理<br/>gpt-4.1]
```
**適用於：**
- 複雜內容產生
- 多步驟工作流程
- 需不同專業知識的任務

**深入了解：** [多代理協調模式](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 配置代理工具

代理若能使用工具會更強大。以下介紹常用配置方法：

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

# 使用工具建立代理人
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### 環境設定

```bash
# 設定代理專屬的環境變數
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 使用更新的配置進行部署
azd deploy
```

---

## 📊 監控代理

### Application Insights 整合

所有 AZD 代理範本皆包含 Application Insights 用於監控：

```bash
# 開啟監控儀表板
azd monitor --overview

# 查看即時日誌
azd monitor --logs

# 查看即時指標
azd monitor --live
```

### 主要監控指標

| 指標 | 說明 | 目標 |
|--------|-------------|--------|
| 回應延遲 | 產生回應所需時間 | < 5 秒 |
| 令牌使用 | 每次請求的令牌數 | 監控成本 |
| 工具呼叫成功率 | 工具執行成功佔比 | > 95% |
| 錯誤率 | 代理請求失敗比例 | < 1% |
| 使用者滿意度 | 反饋評分 | > 4.0/5.0 |

### 代理自訂紀錄

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

> **注意：** 安裝必要套件：`pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 成本考量

### 按模式估算每月成本

| 模式 | 開發環境 | 生產環境 |
|---------|-----------------|------------|
| 單一代理 | $50-100 | $200-500 |
| RAG 代理 | $80-150 | $300-800 |
| 多代理（2-3 個代理） | $150-300 | $500-1,500 |
| 企業多代理 | $300-500 | $1,500-5,000+ |

### 成本優化建議

1. **對於簡單任務使用 gpt-4.1-mini**
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

3. <strong>設定每次執行的令牌上限</strong>
   ```python
   # 在運行代理時設定 max_completion_tokens，而不是在創建時設定
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # 限制回應長度
   )
   ```

4. <strong>無使用時歸零擴充</strong>
   ```bash
   # 容器應用程式會自動縮放至零
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 代理疑難排解

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
# 檢查應用程式洞察以找出瓶頸
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
<summary><strong>❌ 代理回傳錯誤或幻覺式資訊</strong></summary>

```python
# 使用更好的系統提示來改進
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 新增檢索以做為依據
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # 讓回答基於文件內容
)
```
</details>

<details>
<summary><strong>❌ 超過令牌限制錯誤</strong></summary>

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

### 練習 1：部署基礎代理（20 分鐘）

**目標：** 使用 AZD 部署您的第一個 AI 代理

```bash
# 第一步：初始化範本
azd init --template get-started-with-ai-agents

# 第二步：登入 Azure
azd auth login
# 如果您跨租用戶操作，請加入 --tenant-id <tenant-id>

# 第三步：部署
azd up

# 第四步：測試代理程式
# 部署後預期輸出：
#   部署完成！
#   端點：https://<app-name>.<region>.azurecontainerapps.io
# 開啟輸出中顯示的網址並嘗試提問

# 第五步：查看監控
azd monitor --overview

# 第六步：清理
azd down --force --purge
```

**成功標準：**
- [ ] 代理能回答問題
- [ ] 能透過 `azd monitor` 訪問監控儀表板
- [ ] 資源成功清除

### 練習 2：新增自訂工具（30 分鐘）

**目標：** 擴充代理以加入自訂工具

1. 部署代理範本：  
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
  
2. 在代理程式碼中建立新工具函式：  
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 呼叫天氣服務的 API
       return f"Weather in {location}: Sunny, 72°F"
   ```
  
3. 註冊該工具至代理：  
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
  
4. 重新部署與測試：  
   ```bash
   azd deploy
   # 問：＂西雅圖的天氣如何？＂
   # 預期：代理呼叫 get_weather("Seattle") 並返回天氣資訊
   ```

**成功標準：**
- [ ] 代理識別天氣相關查詢
- [ ] 能正確呼叫工具
- [ ] 回應包含天氣資訊

### 練習 3：建置 RAG 代理（45 分鐘）

**目標：** 建立可從文件中回答問題的代理

```bash
# 步驟 1：部署 RAG 範本
azd init --template azure-search-openai-demo
azd up

# 步驟 2：上傳您的文件
# 將 PDF/TXT 檔案放入 data/ 目錄，然後執行：
python scripts/prepdocs.py

# 步驟 3：使用特定領域的問題進行測試
# 從 azd up 輸出中開啟網頁應用程式網址
# 詢問有關您上傳文件的問題
# 回答應包含類似 [doc.pdf] 的引用參考文獻
```

**成功標準：**
- [ ] 代理從上傳的文件中回答
- [ ] 回應包含引用資訊
- [ ] 對範圍外問題不產生幻覺

---

## 📚 後續步驟

既然您已了解 AI 代理，探索下列進階主題：

| 主題 | 說明 | 連結 |
|-------|-------------|------|
| <strong>多代理系統</strong> | 建立多個協作代理系統 | [零售多代理範例](../../examples/retail-scenario.md) |
| <strong>協調模式</strong> | 學習編排與通訊模式 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) |
| <strong>生產環境部署</strong> | 企業級代理部署 | [生產 AI 實務](../chapter-08-production/production-ai-practices.md) |
| <strong>代理評估</strong> | 測試與評估代理效能 | [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI 工作坊實驗室** | 實作：使您的 AI 解決方案支持 AZD | [AI 工作坊實驗室](ai-workshop-lab.md) |

---

## 📖 額外資源

### 官方文件
- [Azure AI Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure AI Foundry Agent Service 快速開始](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### 代理用 AZD 範本
- [開始使用 AI 代理](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty 範例](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI 範例](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社群資源
- [Awesome AZD - 代理範本集](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### 適用於您編輯器的代理技能
- [**Microsoft Azure 代理技能**](https://skills.sh/microsoft/github-copilot-for-azure) — 在 GitHub Copilot、Cursor 或任何支援的代理中安裝可重複使用的 Azure AI 代理技能。包含 [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai)、[Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry)、[部署](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy)及[診斷](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) 的技能：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

<strong>導覽</strong>  
- <strong>上課內容</strong>：[Microsoft Foundry 整合](microsoft-foundry-integration.md)  
- <strong>下一課程</strong>：[AI 模型部署](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的原文版本應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->