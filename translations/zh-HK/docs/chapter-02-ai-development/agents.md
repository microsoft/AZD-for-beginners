# 使用 Azure Developer CLI 的 AI 代理

**章節導航：**
- **📚 課程首頁**: [AZD 新手入門](../../README.md)
- **📖 目前章節**: 第 2 章 - AI 優先開發
- **⬅️ 上一章**: [Microsoft Foundry 集成](microsoft-foundry-integration.md)
- **➡️ 下一章**: [AI 模型部署](ai-model-deployment.md)
- **🚀 進階篇**: [多代理解決方案](../../examples/retail-scenario.md)

---

## 介紹

AI 代理是能夠感知環境、做出決策並採取行動以達成特定目標的自主程式。與僅回應提示的簡單聊天機器人不同，代理可以：

- <strong>使用工具</strong> - 呼叫 API、搜尋資料庫、執行程式碼
- <strong>規劃與推理</strong> - 將複雜任務拆解成步驟
- <strong>從上下文學習</strong> - 保持記憶並調整行為
- <strong>協作</strong> - 與其他代理（多代理系統）合作

本指南將展示如何使用 Azure Developer CLI (azd) 將 AI 代理部署到 Azure。

## 學習目標

完成本指南後，您將能夠：
- 理解 AI 代理是什麼以及它們與聊天機器人的差異
- 使用 AZD 部署預建的 AI 代理範本
- 配置 Foundry 代理以支援自訂代理
- 實作基本的代理模式（工具使用、RAG、多代理）
- 監控並除錯已部署的代理

## 學習成果

完成後，您將能夠：
- 使用單一命令將 AI 代理應用程式部署至 Azure
- 配置代理的工具與功能
- 使用代理實作檢索增強生成 (RAG)
- 設計多代理架構以應對複雜工作流程
- 疑難排解常見代理部署問題

---

## 🤖 代理與聊天機器人的差異是什麼？

| 特性 | 聊天機器人 | AI 代理 |
|---------|---------|----------|
| <strong>行為</strong> | 回應提示 | 自主採取行動 |
| <strong>工具</strong> | 無 | 可呼叫 API、搜尋、執行程式碼 |
| <strong>記憶</strong> | 僅限會話 | 跨會話持久記憶 |
| <strong>規劃</strong> | 單次回應 | 多步推理 |
| <strong>協作</strong> | 單一實體 | 可與其他代理協同作業 |

### 簡單類比

- <strong>聊天機器人</strong> = 幫助答疑的櫃檯人員
- **AI 代理** = 個人助理，可幫你打電話、預約、完成任務

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
- ✅ Azure Container Apps（網頁介面）
- ✅ Application Insights（監控）

**時間：** 約 15-20 分鐘
**費用：** 約 100-150 美元/月（開發用）

### 選項 2：搭配 Prompty 的 OpenAI 代理

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

**時間：** 約 10-15 分鐘
**費用：** 約 50-100 美元/月（開發用）

### 選項 3：RAG 聊天代理

```bash
# 初始化 RAG 聊天模板
azd init --template azure-search-openai-demo

# 部署到 Azure
azd up
```

**部署項目：**
- ✅ Microsoft Foundry 模型
- ✅ 含範例資料的 Azure AI 搜尋
- ✅ 文件處理管線
- ✅ 附引文的聊天介面

**時間：** 約 15-25 分鐘
**費用：** 約 80-150 美元/月（開發用）

### 選項 4：AZD AI 代理初始化（基於清單）

如果您有代理清單檔案，可使用 `azd ai` 命令直接生成 Foundry 代理服務專案：

```bash
# 安裝 AI 代理擴展
azd extension install azure.ai.agents

# 從代理清單初始化
azd ai agent init -m agent-manifest.yaml

# 部署到 Azure
azd up
```

**何時使用 `azd ai agent init` 與 `azd init --template`：**

| 方法 | 適用 | 運作方式 |
|----------|----------|------|
| `azd init --template` | 從現有範例專案起步 | 複製完整範本儲存庫（程式碼 + 基礎設施） |
| `azd ai agent init -m` | 以自訂代理清單建立 | 從代理定義生成專案結構 |

> **提示：** 學習期間建議使用 `azd init --template`（以上選項 1-3）。打造正式代理時，使用 `azd ai agent init` 搭配您自己的清單。參考 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 取得完整說明。

---

## 🏗️ 代理架構模式

### 樣式 1：單一代理搭配工具

最簡單的代理樣式 - 一個代理可使用多種工具。

```mermaid
graph TD
    UI[用戶介面] --> Agent[AI 代理<br/>gpt-4.1]
    Agent --> Search[搜尋工具]
    Agent --> Database[資料庫工具]
    Agent --> API[API 工具]
```
**適合用於：**
- 客服聊天機器人
- 研究助理
- 資料分析代理

**AZD 範本：** `azure-search-openai-demo`

### 樣式 2：RAG 代理（檢索增強生成）

代理先檢索相關文件，再生成回應。

```mermaid
graph TD
    Query[用戶查詢] --> RAG[RAG 代理]
    RAG --> Vector[向量搜尋]
    RAG --> LLM[大型語言模型<br/>gpt-4.1]
    Vector -- 文件 --> LLM
    LLM --> Response[帶引用的回應]
```
**適合用於：**
- 企業知識庫
- 文件問答系統
- 合規與法律研究

**AZD 範本：** `azure-search-openai-demo`

### 樣式 3：多代理系統

多個專門代理協同處理複雜任務。

```mermaid
graph TD
    Orchestrator[調度者代理] --> Research[研究代理<br/>gpt-4.1]
    Orchestrator --> Writer[撰寫者代理<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[審閱者代理<br/>gpt-4.1]
```
**適合用於：**
- 複雜內容生成
- 多步工作流程
- 需不同專長的任務

**深入閱讀：** [多代理協調模式](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 配置代理工具

代理能使用工具時功能強大，以下說明如何設置常用工具：

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
# 設定代理專用環境變量
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

所有 AZD 代理範本均內建 Application Insights 以監控：

```bash
# 開啟監控儀表板
azd monitor --overview

# 查看即時日誌
azd monitor --logs

# 查看即時指標
azd monitor --live
```

### 重要監控指標

| 指標 | 描述 | 目標 |
|--------|-------------|--------|
| 回應延遲 | 產生回應所需時間 | < 5 秒 |
| 令牌使用量 | 每次請求令牌數 | 監控成本 |
| 工具呼叫成功率 | 成功執行工具的比例 | > 95% |
| 錯誤率 | 代理請求失敗率 | < 1% |
| 使用者滿意度 | 回饋分數 | > 4.0/5.0 |

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

> **注意：** 安裝所需套件：`pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 費用考量

### 各模式預估月費

| 模式 | 開發環境 | 產品環境 |
|---------|-----------------|------------|
| 單一代理 | $50-100 | $200-500 |
| RAG 代理 | $80-150 | $300-800 |
| 多代理（2-3 代理） | $150-300 | $500-1,500 |
| 企業級多代理 | $300-500 | $1,500-5,000+ |

### 成本優化技巧

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

3. <strong>設定每次執行的令牌限制</strong>
   ```python
   # 設定最大回應字元數於執行代理時，而非建立時
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # 限制回應長度
   )
   ```

4. <strong>空閒時縮減至零規模</strong>
   ```bash
   # 容器應用程式會自動縮放至零
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 代理疑難排解

### 常見問題與解決方案

<details>
<summary><strong>❌ 代理無法呼叫工具</strong></summary>

```bash
# 檢查工具是否已正確註冊
azd show

# 驗證 OpenAI 部署情況
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
- 減小上下文視窗大小
</details>

<details>
<summary><strong>❌ 代理回傳錯誤或幻覺資訊</strong></summary>

```python
# 用更好的系統提示改進
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 添加檢索以作為依據
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # 回應以文件為根據
)
```
</details>

<details>
<summary><strong>❌ 超出令牌限制錯誤</strong></summary>

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

### 練習 1：部署基本代理 (20 分鐘)

**目標：** 使用 AZD 部署您的第一個 AI 代理

```bash
# 第一步：初始化模板
azd init --template get-started-with-ai-agents

# 第二步：登入 Azure
azd auth login

# 第三步：部署
azd up

# 第四步：測試代理
# 部署後的預期輸出：
#   部署完成！
#   端點：https://<app-name>.<region>.azurecontainerapps.io
# 打開輸出中顯示的網址並嘗試提問

# 第五步：查看監控
azd monitor --overview

# 第六步：清理
azd down --force --purge
```

**成功標準：**
- [ ] 代理能回答問題
- [ ] 可透過 `azd monitor` 存取監控儀表板
- [ ] 資源可成功清理

### 練習 2：新增自訂工具 (30 分鐘)

**目標：** 擴充代理以支援自訂工具

1. 部署代理範本：
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. 在代理程式碼中建立新工具函式：
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 調用天氣服務的API接口
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
   # 問：「西雅圖嘅天氣係點？」
   # 預期：代理人調用 get_weather("Seattle") 並返回天氣資訊
   ```

**成功標準：**
- [ ] 代理能識別天氣相關查詢
- [ ] 工具被正確呼叫
- [ ] 回應包含天氣資訊

### 練習 3：打造 RAG 代理 (45 分鐘)

**目標：** 建立能以文件為基礎回答問題的代理

```bash
# 第一步：部署 RAG 模板
azd init --template azure-search-openai-demo
azd up

# 第二步：上載你的文件
# 將 PDF/TXT 檔案放入 data/ 目錄，然後執行：
python scripts/prepdocs.py

# 第三步：使用特定領域問題進行測試
# 打開 azd up 輸出中的網頁應用程式網址
# 提出有關你已上載文件的問題
# 回應應包含像 [doc.pdf] 的引用參考
```

**成功標準：**
- [ ] 代理可從上傳文件回答問題
- [ ] 回應帶有引文
- [ ] 對範圍外問題無幻覺回答

---

## 📚 下一步

既然您已了解 AI 代理，可以探索下列進階主題：

| 主題 | 描述 | 連結 |
|-------|-------------|------|
| <strong>多代理系統</strong> | 建立多個協作代理系統 | [零售多代理範例](../../examples/retail-scenario.md) |
| <strong>協調模式</strong> | 學習編排與通訊模式 | [協調模式](../chapter-06-pre-deployment/coordination-patterns.md) |
| <strong>生產部署</strong> | 企業級代理佈署 | [生產環境 AI 實務](../chapter-08-production/production-ai-practices.md) |
| <strong>代理評估</strong> | 測試與評估代理性能 | [AI 疑難排解](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI 工作坊實驗室** | 實作：讓您的 AI 解決方案 AZD-ready | [AI 工作坊實驗室](ai-workshop-lab.md) |

---

## 📖 附加資源

### 官方文件
- [Azure AI 代理服務](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure AI Foundry 代理服務快速入門](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel 代理框架](https://learn.microsoft.com/semantic-kernel/)

### AZD 代理範本
- [AI 代理入門指南](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### 社群資源
- [Awesome AZD - 代理範本](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### 編輯器專用代理技能
- [**Microsoft Azure 代理技能**](https://skills.sh/microsoft/github-copilot-for-azure) - 在 GitHub Copilot、Cursor 或任一支援的代理中安裝可重用的 Azure AI 代理技能。包含 [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai)、[Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry)、[部署](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) 與 [診斷](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) 等技能：
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

<strong>導航</strong>
- <strong>上一課</strong>: [Microsoft Foundry 集成](microsoft-foundry-integration.md)
- <strong>下一課</strong>: [AI 模型部署](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件是使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威資料來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯所引起的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->