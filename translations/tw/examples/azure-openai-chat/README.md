<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-19T14:56:12+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "tw"
}
-->
# Azure OpenAI 聊天應用程式

**學習路徑：** 中級 ⭐⭐ | **時間：** 35-45 分鐘 | **成本：** 每月 $50-200

使用 Azure Developer CLI (azd) 部署完整的 Azure OpenAI 聊天應用程式。本範例展示了 GPT-4 部署、安全的 API 存取以及簡單的聊天介面。

## 🎯 學習目標

- 部署 Azure OpenAI Service 並使用 GPT-4 模型
- 使用 Key Vault 保護 OpenAI API 金鑰
- 使用 Python 建立簡單的聊天介面
- 監控 Token 使用量及成本
- 實現速率限制及錯誤處理

## 📦 包含內容

✅ **Azure OpenAI Service** - GPT-4 模型部署  
✅ **Python 聊天應用程式** - 簡單的命令列聊天介面  
✅ **Key Vault 整合** - 安全的 API 金鑰存儲  
✅ **ARM Templates** - 完整的基礎架構程式碼  
✅ **成本監控** - Token 使用量追蹤  
✅ **速率限制** - 防止配額耗盡  

## 架構

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## 先決條件

### 必須具備

- **Azure Developer CLI (azd)** - [安裝指南](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **具有 OpenAI 存取權的 Azure 訂閱** - [申請存取權](https://aka.ms/oai/access)
- **Python 3.9+** - [安裝 Python](https://www.python.org/downloads/)

### 驗證先決條件

```bash
# 檢查 azd 版本（需要 1.5.0 或更高版本）
azd version

# 驗證 Azure 登入
azd auth login

# 檢查 Python 版本
python --version  # 或 python3 --version

# 驗證 OpenAI 存取權（在 Azure Portal 中檢查）
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ 重要：** Azure OpenAI 需要申請批准。如果尚未申請，請造訪 [aka.ms/oai/access](https://aka.ms/oai/access)。批准通常需要 1-2 個工作日。

## ⏱️ 部署時間表

| 階段 | 時間 | 發生的事情 |
|------|------|------------|
| 驗證先決條件 | 2-3 分鐘 | 確認 OpenAI 配額可用性 |
| 部署基礎架構 | 8-12 分鐘 | 建立 OpenAI、Key Vault、模型部署 |
| 配置應用程式 | 2-3 分鐘 | 設定環境及依賴項 |
| **總計** | **12-18 分鐘** | 準備好與 GPT-4 聊天 |

**注意：** 第一次部署 OpenAI 可能需要更長時間，因為模型需要配置。

## 快速開始

```bash
# 導航至範例
cd examples/azure-openai-chat

# 初始化環境
azd env new myopenai

# 部署所有內容（基礎設施 + 配置）
azd up
# 您將被提示：
# 1. 選擇 Azure 訂閱
# 2. 選擇具有 OpenAI 可用性的地點（例如，eastus、eastus2、westus）
# 3. 等待 12-18 分鐘完成部署

# 安裝 Python 依賴項
pip install -r requirements.txt

# 開始聊天！
python chat.py
```

**預期輸出：**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ 驗證部署

### 步驟 1：檢查 Azure 資源

```bash
# 查看已部署的資源
azd show

# 預期輸出顯示：
# - OpenAI 服務: (資源名稱)
# - 金鑰保管庫: (資源名稱)
# - 部署: gpt-4
# - 位置: eastus (或您選擇的地區)
```

### 步驟 2：測試 OpenAI API

```bash
# 獲取 OpenAI 端點和密鑰
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# 測試 API 呼叫
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**預期回應：**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### 步驟 3：驗證 Key Vault 存取

```bash
# 列出 Key Vault 中的秘密
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**預期的秘密：**
- `openai-api-key`
- `openai-endpoint`

**成功標準：**
- ✅ 使用 GPT-4 部署的 OpenAI 服務
- ✅ API 呼叫返回有效的完成結果
- ✅ 秘密存儲於 Key Vault
- ✅ Token 使用量追蹤正常運作

## 專案結構

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## 應用程式功能

### 聊天介面 (`chat.py`)

聊天應用程式包含：

- **對話歷史記錄** - 保持訊息間的上下文
- **Token 計數** - 追蹤使用量並估算成本
- **錯誤處理** - 優雅地處理速率限制及 API 錯誤
- **成本估算** - 每則訊息的即時成本計算
- **串流支援** - 可選的串流回應

### 指令

在聊天過程中，您可以使用：
- `quit` 或 `exit` - 結束會話
- `clear` - 清除對話歷史記錄
- `tokens` - 顯示總 Token 使用量
- `cost` - 顯示估算的總成本

### 配置 (`config.py`)

從環境變數載入配置：
```python
AZURE_OPENAI_ENDPOINT  # 從金鑰保管庫
AZURE_OPENAI_API_KEY   # 從金鑰保管庫
AZURE_OPENAI_MODEL     # 預設值：gpt-4
AZURE_OPENAI_MAX_TOKENS # 預設值：800
```

## 使用範例

### 基本聊天

```bash
python chat.py
```

### 使用自訂模型聊天

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### 使用串流聊天

```bash
python chat.py --stream
```

### 範例對話

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## 成本管理

### Token 價格 (GPT-4)

| 模型 | 輸入 (每 1K tokens) | 輸出 (每 1K tokens) |
|------|---------------------|---------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### 每月成本估算

基於使用模式：

| 使用級別 | 每日訊息數 | 每日 Token 數 | 每月成本 |
|----------|------------|---------------|----------|
| **輕量** | 20 則訊息 | 3,000 tokens | $3-5 |
| **中度** | 100 則訊息 | 15,000 tokens | $15-25 |
| **重度** | 500 則訊息 | 75,000 tokens | $75-125 |

**基礎架構成本：** 每月 $1-2 (Key Vault + 最低計算資源)

### 成本優化提示

```bash
# 1. 使用 GPT-3.5-Turbo 處理較簡單的任務（便宜 20 倍）
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. 減少最大 token 數以獲得較短的回應
export AZURE_OPENAI_MAX_TOKENS=400

# 3. 監控 token 使用情況
python chat.py --show-tokens

# 4. 設定預算警示
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## 監控

### 查看 Token 使用量

```bash
# 在 Azure Portal 中：
# OpenAI 資源 → 指標 → 選擇「Token Transaction」

# 或透過 Azure CLI：
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### 查看 API 日誌

```bash
# 流式診斷日誌
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# 查詢日誌
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## 疑難排解

### 問題："存取被拒" 錯誤

**症狀：** 呼叫 API 時出現 403 Forbidden

**解決方案：**
```bash
# 1. 確認 OpenAI 訪問已獲批准
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. 檢查 API 金鑰是否正確
azd env get-value AZURE_OPENAI_API_KEY

# 3. 確認端點 URL 格式
azd env get-value AZURE_OPENAI_ENDPOINT
# 應為: https://[name].openai.azure.com/
```

### 問題："超出速率限制"

**症狀：** 出現 429 Too Many Requests

**解決方案：**
```bash
# 1. 檢查目前配額
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. 申請增加配額（如果需要）
# 前往 Azure Portal → OpenAI 資源 → 配額 → 申請增加

# 3. 實現重試邏輯（已在 chat.py 中）
# 應用程式會自動使用指數回退進行重試
```

### 問題："找不到模型"

**症狀：** 部署時出現 404 錯誤

**解決方案：**
```bash
# 1. 列出可用的部署
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. 驗證環境中的模型名稱
echo $AZURE_OPENAI_MODEL

# 3. 更新為正確的部署名稱
export AZURE_OPENAI_MODEL=gpt-4  # 或 gpt-35-turbo
```

### 問題：高延遲

**症狀：** 回應時間過慢 (>5 秒)

**解決方案：**
```bash
# 1. 檢查區域延遲
# 部署到最接近使用者的區域

# 2. 減少 max_tokens 以加快回應速度
export AZURE_OPENAI_MAX_TOKENS=400

# 3. 使用串流以改善使用者體驗
python chat.py --stream
```

## 安全最佳實踐

### 1. 保護 API 金鑰

```bash
# 切勿將密鑰提交到版本控制
# 使用密鑰保管庫（已配置）

# 定期輪替密鑰
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. 實施內容過濾

```python
# Azure OpenAI 包含內建的內容過濾功能
# 在 Azure Portal 中設定：
# OpenAI 資源 → 內容過濾器 → 建立自訂過濾器

# 類別：仇恨、性、暴力、自我傷害
# 等級：低、中、高過濾
```

### 3. 使用受管理的身份 (生產環境)

```bash
# 對於生產部署，使用受管理的身份
# 而不是 API 金鑰（需要在 Azure 上託管應用程式）

# 更新 infra/openai.bicep 以包含：
# identity: { type: 'SystemAssigned' }
```

## 開發

### 本地執行

```bash
# 安裝依賴項
pip install -r src/requirements.txt

# 設定環境變數
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# 執行應用程式
python src/chat.py
```

### 執行測試

```bash
# 安裝測試依賴項
pip install pytest pytest-cov

# 執行測試
pytest tests/ -v

# 包含覆蓋率
pytest tests/ --cov=src --cov-report=html
```

### 更新模型部署

```bash
# 部署不同的模型版本
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## 清理

```bash
# 刪除所有 Azure 資源
azd down --force --purge

# 這將移除：
# - OpenAI 服務
# - 金鑰保存庫（具有 90 天軟刪除）
# - 資源群組
# - 所有部署和配置
```

## 下一步

### 擴展此範例

1. **新增網頁介面** - 建立 React/Vue 前端
   ```bash
   # 將前端服務添加到 azure.yaml
   # 部署到 Azure 靜態網頁應用
   ```

2. **實現 RAG** - 使用 Azure AI Search 增加文件搜尋功能
   ```python
   # 整合 Azure 認知搜尋
   # 上傳文件並建立向量索引
   ```

3. **新增功能呼叫** - 啟用工具使用
   ```python
   # 定義函數於 chat.py
   # 讓 GPT-4 呼叫外部 API
   ```

4. **多模型支援** - 部署多個模型
   ```bash
   # 添加 gpt-35-turbo，嵌入模型
   # 實現模型路由邏輯
   ```

### 相關範例

- **[零售多代理](../retail-scenario.md)** - 高級多代理架構
- **[資料庫應用程式](../../../../examples/database-app)** - 增加持久存儲
- **[容器應用程式](../../../../examples/container-app)** - 部署為容器化服務

### 學習資源

- 📚 [AZD 初學者課程](../../README.md) - 主課程首頁
- 📚 [Azure OpenAI 文件](https://learn.microsoft.com/azure/ai-services/openai/) - 官方文件
- 📚 [OpenAI API 參考](https://platform.openai.com/docs/api-reference) - API 詳細資訊
- 📚 [負責任的 AI](https://www.microsoft.com/ai/responsible-ai) - 最佳實踐

## 其他資源

### 文件
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - 完整指南
- **[GPT-4 模型](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - 模型功能
- **[內容過濾](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - 安全功能
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd 參考

### 教程
- **[OpenAI 快速入門](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - 第一次部署
- **[聊天完成](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - 建立聊天應用程式
- **[功能呼叫](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - 高級功能

### 工具
- **[Azure OpenAI Studio](https://oai.azure.com/)** - 基於網頁的操作平台
- **[提示工程指南](https://platform.openai.com/docs/guides/prompt-engineering)** - 撰寫更好的提示
- **[Token 計算器](https://platform.openai.com/tokenizer)** - 預估 Token 使用量

### 社群
- **[Azure AI Discord](https://discord.gg/azure)** - 從社群獲得幫助
- **[GitHub 討論](https://github.com/Azure-Samples/openai/discussions)** - 問答論壇
- **[Azure 部落格](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - 最新更新

---

**🎉 成功！** 您已部署 Azure OpenAI 並建立了一個可運作的聊天應用程式。開始探索 GPT-4 的功能並嘗試不同的提示及使用案例。

**有問題嗎？** [提出問題](https://github.com/microsoft/AZD-for-beginners/issues) 或查看 [FAQ](../../resources/faq.md)

**成本提醒：** 測試完成後記得執行 `azd down` 以避免持續費用（活躍使用約 $50-100/月）。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->