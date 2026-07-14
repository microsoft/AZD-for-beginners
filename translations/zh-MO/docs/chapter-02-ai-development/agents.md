# 使用 Azure Developer CLI 的 AI 代理

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 本章節**: 第 2 章 - AI 優先開發
- **⬅️ 上一章**: [Microsoft Foundry 整合](microsoft-foundry-integration.md)
- **➡️ 下一章**: [AI 模型部署](ai-model-deployment.md)
- **🚀 高階**: [多代理解決方案](../../examples/retail-scenario.md)

---

## 介紹

AI 代理是可以感知環境、做決策並採取行動以達成特定目標的自主程式。與僅回應提示的簡單聊天機器人不同，代理可以：

- <strong>使用工具</strong>—調用 API、搜尋資料庫、執行程式碼
- <strong>規劃與推理</strong>—將複雜任務拆解成步驟
- <strong>從上下文學習</strong>—維持記憶並調整行為
- <strong>協作</strong>—與其他代理協同工作（多代理系統）

本指南將指導您如何使用 Azure Developer CLI (azd) 將 AI 代理部署到 Azure。

> **驗證說明 (2026-07-13)：** 本指南針對 `azd` `1.27.1` 與 `azure.ai.agents` `1.0.0-beta.5` 進行審查。`azd ai` 體驗仍處於預覽階段，若您安裝的旗標不同，請查看擴充說明。

## 學習目標

完成本指南後，您將能：
- 了解 AI 代理是什麼及其與聊天機器人的區別
- 使用 AZD 部署預建 AI 代理範本
- 為自定義代理設定 Foundry 代理
- 實作基礎代理模式（工具使用、RAG、多代理）
- 監控及除錯已部署的代理

## 學習成果

完成後，您將能夠：
- 以單一指令將 AI 代理應用部署至 Azure
- 設定代理工具與能力
- 與代理實現檢索增強生成（RAG）
- 設計多代理架構以處理複雜工作流程
- 疑難排解常見的代理部署問題

---

## 🤖 代理與聊天機器人的差異

| 特性 | 聊天機器人 | AI 代理 |
|---------|---------|----------|
| <strong>行為</strong> | 回應提示 | 採取自主行動 |
| <strong>工具</strong> | 無 | 可調用 API、搜尋、執行程式碼 |
| <strong>記憶</strong> | 僅限會話 | 跨會話保存記憶 |
| <strong>規劃</strong> | 單次回應 | 多步驟推理 |
| <strong>協作</strong> | 單一實體 | 可與其他代理協作 |

### 簡單比喻

- <strong>聊天機器人</strong> = 資訊櫃台回答問題的助理
- **AI 代理** = 能為您打電話、預約和完成任務的個人助理

---

## 🚀 快速開始：部署您的第一個代理

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
- ✅ Azure AI Search（用於 RAG）
- ✅ Azure Container Apps（網頁介面）
- ✅ Application Insights（監控）

**時間：** 約 15-20 分鐘
**費用：** 約 100-150 美元/月（開發階段）

### 選項 2：結合 Prompty 的 OpenAI 代理

```bash
# 初始化基於Prompty的代理範本
azd init --template agent-openai-python-prompty

# 部署到Azure
azd up
```

**部署內容：**
- ✅ Azure Functions（無伺服器代理執行）
- ✅ Microsoft Foundry 模型
- ✅ Prompty 配置檔
- ✅ 範例代理實作

**時間：** 約 10-15 分鐘
**費用：** 約 50-100 美元/月（開發階段）

### 選項 3：RAG 聊天代理

```bash
# 初始化 RAG 聊天模板
azd init --template azure-search-openai-demo

# 部署至 Azure
azd up
```

**部署內容：**
- ✅ Microsoft Foundry 模型
- ✅ 使用範例資料的 Azure AI Search
- ✅ 文件處理流程
- ✅ 附有引註的聊天介面

**時間：** 約 15-25 分鐘
**費用：** 約 80-150 美元/月（開發階段）

### 選項 4：AZD AI Agent Init（基於清單或範本的預覽）

如果您有代理清單檔案，可以使用 `azd ai` 命令直接建構 Foundry 代理服務專案。近期的預覽版本亦新增基於範本的初始化支援，故依您安裝的擴充版本，提示流程可能略有不同。

```bash
# 安裝 AI 代理擴展
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

| 方法 | 適用情境 | 運作方式 |
|----------|----------|------|
| `azd init --template` | 從可用的範例應用開始 | 複製完整範本倉庫含程式碼與基礎架構 |
| `azd ai agent init -m` | 從您自己的代理清單建置 | 從代理定義腳手架專案結構 |

> **提示：** 學習時（以上選項 1-3）使用 `azd init --template`。建立生產代理且有自定義清單時使用 `azd ai agent init`。

執行 `azd up` 後，擴充將帶您完成代理生命週期的其餘步驟：使用 `azd ai agent invoke` 測試，`azd ai agent eval generate` 與 `azd ai agent optimize` 來評估和改進品質，`azd ai agent delete` 進行清理。完整參考請見 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

---

## 🏗️ 代理架構模式

### 模式 1：單代理搭配工具

最簡單的代理模式 - 一個代理可使用多個工具。

```mermaid
graph TD
    UI[使用者介面] --> Agent[人工智能代理<br/>gpt-4.1]
    Agent --> Search[搜尋工具]
    Agent --> Database[資料庫工具]
    Agent --> API[API 工具]
```

**適合：**
- 客服機器人
- 研究助理
- 資料分析代理

**AZD 範本：** `azure-search-openai-demo`

### 模式 2：RAG 代理（檢索增強生成）

一個在生成回答前先檢索相關文件的代理。

```mermaid
graph TD
    Query[用戶查詢] --> RAG[RAG 代理]
    RAG --> Vector[向量搜尋]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Documents --> LLM
    LLM --> Response[帶引用的回應]
```

**適合：**
- 企業知識庫
- 文件問答系統
- 合規與法律研究

**AZD 範本：** `azure-search-openai-demo`

### 模式 3：多代理系統

多個專業代理協同處理複雜任務。

```mermaid
graph TD
    Orchestrator[協調者代理] --> Research[研究代理<br/>gpt-4.1]
    Orchestrator --> Writer[撰寫者代理<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[審閱者代理<br/>gpt-4.1]
```

**適合：**
- 複雜內容生成
- 多步工作流程
- 需不同專長的任務

**深入了解：** [多代理協調模式](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 代理工具配置

代理具備工具使用能力時更強大。以下為常見工具的配置方法：

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

# 使用工具建立智能代理
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### 環境配置

```bash
# 設定代理特定的環境變數
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 使用更新的配置進行部署
azd deploy
```

---

## 📊 代理監控

### 應用程式洞察整合

所有 AZD 代理範本都包含應用程式洞察用於監控：

```bash
# 開啟監控儀表板
azd monitor --overview

# 查看即時日誌
azd monitor --logs

# 查看即時指標
azd monitor --live
```

### 主要指標追蹤

| 指標 | 描述 | 目標 |
|--------|-------------|--------|
| 回應延遲 | 生成回答時間 | < 5 秒 |
| 代幣使用量 | 每次請求代幣數 | 監控費用 |
| 工具調用成功率 | 成功執行工具的比率 | > 95% |
| 錯誤率 | 代理請求失敗比例 | < 1% |
| 用戶滿意度 | 反饋評分 | > 4.0 /5.0 |

### 代理的自訂記錄

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

> **注意:** 請安裝必要套件：`pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 成本考量

### 按模式估計月費

| 模式 | 開發環境 | 生產環境 |
|---------|-----------------|------------|
| 單一代理 | $50-100 | $200-500 |
| RAG 代理 | $80-150 | $300-800 |
| 多代理（2-3 代理） | $150-300 | $500-1,500 |
| 企業多代理 | $300-500 | $1,500-5,000+ |

### 成本優化建議

1. **對簡單任務使用 gpt-4.1-mini**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. <strong>實作重複查詢快取</strong>
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. <strong>設定每次執行的代幣限制</strong>
   ```python
   # 在運行代理時設置 max_completion_tokens，而非在創建時設置
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # 限制回應長度
   )
   ```

4. <strong>閒置時縮減至零規模</strong>
   ```bash
   # 容器應用程式會自動調整至零
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 代理故障排除

### 常見問題與解決方案

<details>
<summary><strong>❌ 代理未回應工具調用</strong></summary>

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
<summary><strong>❌ 代理回傳錯誤或產生幻覺訊息</strong></summary>

```python
# 使用更好的系統提示來改進
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 新增用於基礎支援的檢索
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # 將回應基於文件內容
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

### 練習 1：部署基礎代理（20 分鐘）

**目標：** 使用 AZD 部署您的第一個 AI 代理

```bash
# 第一步：初始化範本
azd init --template get-started-with-ai-agents

# 第二步：登入 Azure
azd auth login
# 如果您跨租戶工作，請加上 --tenant-id <tenant-id>

# 第三步：部署
azd up

# 第四步：測試代理
# 部署後預期輸出：
#   部署完成！
#   端點：https://<app-name>.<region>.azurecontainerapps.io
# 開啟輸出中顯示的網址，嘗試問問題

# 第五步：檢視監控
azd monitor --overview

# 第六步：清理
azd down --force --purge
```

**完成標準：**
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
2. 在代理程式中建立新工具函式：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 調用天氣服務的 API
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
4. 重新部署並測試：
   ```bash
   azd deploy
   # 問：「西雅圖嘅天氣點呀？」
   # 預期：代理人會調用 get_weather("西雅圖") 並返回天氣資訊
   ```

**完成標準：**
- [ ] 代理識別天氣相關查詢
- [ ] 正確調用工具
- [ ] 回應中包含天氣資訊

### 練習 3：建立 RAG 代理（45 分鐘）

**目標：** 建立可從文件中回答問題的代理

```bash
# 第一步：部署 RAG 範本
azd init --template azure-search-openai-demo
azd up

# 第二步：上傳你的文件
# 將 PDF/TXT 檔案放入 data/ 目錄，然後執行：
python scripts/prepdocs.py

# 第三步：用特定領域問題測試
# 從 azd up 輸出中打開網頁應用程式網址
# 提出關於你已上傳文件的問題
# 回應應包含如 [doc.pdf] 的引用參考
```

**完成標準：**
- [ ] 代理可從上傳文件回答
- [ ] 回應包含引註
- [ ] 對範圍外問題不產生幻覺

---

## 📚 後續步驟

既然您已了解 AI 代理，接下來探索以下進階主題：

| 主題 | 說明 | 連結 |
|-------|-------------|------|
| <strong>多代理系統</strong> | 建立多個代理協同工作的系統 | [零售多代理範例](../../examples/retail-scenario.md) |
| <strong>協調模式</strong> | 學習編排與通訊模式 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) |
| <strong>生產部署</strong> | 企業級代理部署策略 | [生產 AI 實務](../chapter-08-production/production-ai-practices.md) |
| <strong>代理評估</strong> | 測試並評估代理效能 | [AI 疑難排除](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI 工作坊實驗室** | 實作練習：讓 AI 解決方案符合 AZD | [AI 工作坊實驗室](ai-workshop-lab.md) |

---

## 📖 額外資源

### 官方文件
- [Microsoft Foundry 代理服務](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry 代理服務快速入門](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel 代理框架](https://learn.microsoft.com/semantic-kernel/)

### AI 代理的 AZD 範本
- [開始使用 AI 代理](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI 範例](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社群資源
- [Awesome AZD - 代理範本合集](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### 編輯器專用代理技能
- [**Microsoft Azure 代理技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 在 GitHub Copilot、Cursor 或任何支援代理安裝可重用 AI 代理技能，適用於 Azure 開發。包含 [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai)、[Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry)、[部署](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy)，以及 [診斷](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) 等技能：
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
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->