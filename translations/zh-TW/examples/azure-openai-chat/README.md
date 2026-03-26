# Microsoft Foundry Models Chat Application

**Learning Path:** Intermediate ⭐⭐ | **Time:** 35-45 minutes | **Cost:** $50-200/month

一個完整的 Microsoft Foundry Models 聊天應用程式，使用 Azure Developer CLI (azd) 部署。此範例示範 gpt-4.1 部署、API 安全存取，以及一個簡單的聊天介面。

## 🎯 你將學到的內容

- 部署 Microsoft Foundry Models Service 與 gpt-4.1 模型
- 使用 Key Vault 保護 OpenAI API 金鑰
- 使用 Python 建立簡單聊天介面
- 監控 token 使用量與成本
- 實作速率限制與錯誤處理

## 📦 內容包括

✅ **Microsoft Foundry Models Service** - gpt-4.1 模型部署  
✅ **Python Chat App** - 簡單命令列聊天介面  
✅ **Key Vault Integration** - 安全的 API 金鑰儲存  
✅ **ARM Templates** - 完整的基礎架構即程式碼  
✅ **Cost Monitoring** - 追蹤 token 使用量  
✅ **Rate Limiting** - 防止配額耗盡  

## Architecture

```mermaid
graph TD
    App[Python 聊天應用程式<br/>本地/雲端<br/>命令列介面<br/>對話紀錄<br/>Token 使用追蹤] -- "HTTPS（API 金鑰）" --> Foundry[Microsoft Foundry 模型服務<br/>gpt-4.1 模型<br/>每分鐘 20K tokens 容量<br/>多區域故障轉移]
    Foundry --> KV[Azure 金鑰保管庫<br/>OpenAI API 金鑰<br/>端點 URL]
    Foundry -. 託管身分識別 .-> KV
```
## Prerequisites

### Required

- **Azure Developer CLI (azd)** - [安裝指南](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** with OpenAI access - [Request access](https://aka.ms/oai/access)
- **Python 3.9+** - [Install Python](https://www.python.org/downloads/)

### Verify Prerequisites

```bash
# 檢查 azd 版本（需要 1.5.0 或更高）
azd version

# 確認 Azure 登入
azd auth login

# 檢查 Python 版本
python --version  # 或 python3 --version

# 驗證 OpenAI 存取權（在 Azure 入口網站檢查）
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Important:** Microsoft Foundry Models requires application approval. If you haven't applied, visit [aka.ms/oai/access](https://aka.ms/oai/access). Approval typically takes 1-2 business days.

## ⏱️ 部署時程

| Phase | Duration | What Happens |
|-------|----------|--------------|
| Prerequisites check | 2-3 minutes | Verify OpenAI quota availability |
| Deploy infrastructure | 8-12 minutes | Create OpenAI, Key Vault, model deployment |
| Configure application | 2-3 minutes | Set up environment and dependencies |
| **Total** | **12-18 minutes** | Ready to chat with gpt-4.1 |

**注意：** 第一次部署 OpenAI 服務可能因模型佈建而需要更長時間。

## 快速開始

```bash
# 導覽至範例
cd examples/azure-openai-chat

# 初始化環境
azd env new myopenai

# 部署所有（基礎架構 + 設定）
azd up
# 系統會提示您：
# 1. 選擇 Azure 訂閱
# 2. 選擇有 OpenAI 可用性的地區（例如：eastus、eastus2、westus）
# 3. 等待部署約 12-18 分鐘

# 安裝 Python 相依套件
pip install -r requirements.txt

# 開始聊天！
python chat.py
```

**預期輸出：**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ 驗證部署

### 步驟 1：檢查 Azure 資源

```bash
# 檢視已部署的資源
azd show

# 預期輸出顯示：
# - OpenAI 服務：（資源名稱）
# - 金鑰保管庫：（資源名稱）
# - 部署：gpt-4.1
# - 位置：eastus（或您選擇的區域）
```

### 步驟 2：測試 OpenAI API

```bash
# 取得 OpenAI 端點與金鑰
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# 測試 API 呼叫
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
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
# 列出 Key Vault 中的機密
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**預期的 Secrets:**
- `openai-api-key`
- `openai-endpoint`

**成功標準：**
- ✅ 已部署包含 gpt-4.1 的 OpenAI 服務
- ✅ API 呼叫回傳有效的完成結果
- ✅ Secrets 已儲存在 Key Vault
- ✅ Token 使用追蹤運作正常

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

### Chat Interface (`chat.py`)

聊天應用包含：

- **Conversation History** - 在訊息之間維持上下文
- **Token Counting** - 追蹤使用量並估算成本
- **Error Handling** - 優雅處理速率限制與 API 錯誤
- **Cost Estimation** - 每則訊息的即時成本計算
- **Streaming Support** - 選用的串流回應支援

### 指令

聊天時，你可以使用：
- `quit` or `exit` - 結束會話
- `clear` - 清除對話記錄
- `tokens` - 顯示總 token 使用量
- `cost` - 顯示估算總成本

### Configuration (`config.py`)

從環境變數載入設定：
```python
AZURE_OPENAI_ENDPOINT  # 來自金鑰保管庫
AZURE_OPENAI_API_KEY   # 來自金鑰保管庫
AZURE_OPENAI_MODEL     # 預設值: gpt-4.1
AZURE_OPENAI_MAX_TOKENS # 預設值: 800
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

### 串流聊天

```bash
python chat.py --stream
```

### 範例對話

```
You: Explain Microsoft Foundry Models Service in 3 sentences.
Assistant: Microsoft Foundry Models Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like gpt-4.1 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Microsoft Foundry Models Service offers several model families including gpt-4.1 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## 成本管理

### Token 價格 (gpt-4.1)

| Model | Input (per 1K tokens) | Output (per 1K tokens) |
|-------|----------------------|------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### 估算的每月成本

根據使用模式：

| Usage Level | Messages/Day | Tokens/Day | Monthly Cost |
|-------------|--------------|------------|--------------|
| **Light** | 20 messages | 3,000 tokens | $3-5 |
| **Moderate** | 100 messages | 15,000 tokens | $15-25 |
| **Heavy** | 500 messages | 75,000 tokens | $75-125 |

**基礎基礎設施成本：** $1-2/month (Key Vault + minimal compute)

### 成本優化建議

```bash
# 1. 對於較簡單的任務，使用 GPT-3.5-Turbo（便宜 20 倍）
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. 減少最大 token 數以縮短回應
export AZURE_OPENAI_MAX_TOKENS=400

# 3. 監控 token 使用量
python chat.py --show-tokens

# 4. 設定預算提醒
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## 監控

### 檢視 Token 使用量

```bash
# 在 Azure 入口網站：
# OpenAI 資源 → 指標 → 選擇「Token Transaction」

# 或透過 Azure CLI：
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### 檢視 API 日誌

```bash
# 串流診斷日誌
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

### 問題：出現 "Access Denied" 錯誤

**症狀：** 呼叫 API 時回傳 403 Forbidden

**解決方法：**
```bash
# 1. 驗證 OpenAI 存取權限是否已獲批准
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. 檢查 API 金鑰是否正確
azd env get-value AZURE_OPENAI_API_KEY

# 3. 驗證端點 URL 格式
azd env get-value AZURE_OPENAI_ENDPOINT
# 應該是： https://[name].openai.azure.com/
```

### 問題：出現 "Rate Limit Exceeded"

**症狀：** 429 Too Many Requests

**解決方法：**
```bash
# 1. 檢查目前配額
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4.1

# 2. 申請提高配額（如有需要）
# 前往 Azure 入口網站 → OpenAI 資源 → 配額 → 申請增加

# 3. 實作重試邏輯（已在 chat.py 中實作）
# 應用程式會自動以指數退避重試
```

### 問題：出現 "Model Not Found"

**症狀：** 部署回傳 404 錯誤

**解決方法：**
```bash
# 1. 列出可用的部署
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. 驗證環境中的模型名稱
echo $AZURE_OPENAI_MODEL

# 3. 更新為正確的部署名稱
export AZURE_OPENAI_MODEL=gpt-4.1  # 或 gpt-35-turbo
```

### 問題：高延遲

**症狀：** 回應時間過慢（>5 秒）

**解決方法：**
```bash
# 1. 檢查區域延遲
# 部署到最接近使用者的區域

# 2. 減少 max_tokens 以加快回應速度
export AZURE_OPENAI_MAX_TOKENS=400

# 3. 使用串流以提升使用者體驗
python chat.py --stream
```

## 安全最佳實務

### 1. 保護 API 金鑰

```bash
# 切勿將金鑰提交到原始碼版本控制系統
# 使用 Key Vault (已配置)

# 定期輪換金鑰
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. 實作內容過濾

```python
# Microsoft Foundry Models 包含內建的內容過濾功能
# 在 Azure 入口網站設定：
# OpenAI 資源 → 內容篩選 → 建立自訂篩選器

# 類別：仇恨、性相關、暴力、自我傷害
# 過濾等級：低、中、高
```

### 3. 在生產環境使用 Managed Identity

```bash
# 在生產環境部署時，請使用受管身分識別
# 而非使用 API 金鑰（需要將應用程式託管於 Azure）

# 更新 infra/openai.bicep 以包含：
# identity: { type: 'SystemAssigned' }
```

## 開發

### 本機執行

```bash
# 安裝相依套件
pip install -r src/requirements.txt

# 設定環境變數
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# 執行應用程式
python src/chat.py
```

### 執行測試

```bash
# 安裝測試相依套件
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

## 清理資源

```bash
# 刪除所有 Azure 資源
azd down --force --purge

# 這會移除：
# - OpenAI 服務
# - 金鑰保管庫（含 90 天軟刪除）
# - 資源群組
# - 所有部署與設定
```

## 下一步

### 擴充此範例

1. **Add Web Interface** - 建立 React/Vue 前端
   ```bash
   # 在 azure.yaml 中新增前端服務
   # 部署到 Azure Static Web Apps
   ```

2. **Implement RAG** - 加入 Azure AI Search 的文件搜尋
   ```python
   # 整合 Azure 認知搜尋
   # 上傳文件並建立向量索引
   ```

3. **Add Function Calling** - 啟用工具使用
   ```python
   # 在 chat.py 中定義函式
   # 讓 gpt-4.1 呼叫外部 API
   ```

4. **Multi-Model Support** - 部署多個模型
   ```bash
   # 新增 gpt-35-turbo 與 embeddings 模型
   # 實作模型路由邏輯
   ```

### 相關範例

- **[Retail Multi-Agent](../retail-scenario.md)** - 進階多代理架構
- **[Database App](../../../../examples/database-app)** - 新增持久化儲存
- **[Container Apps](../../../../examples/container-app)** - 部署為容器化服務

### 學習資源

- 📚 [AZD For Beginners Course](../../README.md) - 主課程首頁
- 📚 [Microsoft Foundry Models Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - 官方文件
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API 詳細資料
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - 最佳實務

## 附加資源

### 文件
- **[Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/)** - 完整指南
- **[gpt-4.1 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - 模型能力
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - 安全功能
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd 參考

### 教學
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - 第一次部署
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - 建置聊天應用
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - 進階功能

### 工具
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - 基於網頁的 playground
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - 編寫更好提示的指南
- **[Token Calculator](https://platform.openai.com/tokenizer)** - 估算 token 使用量

### 社群
- **[Azure AI Discord](https://discord.gg/azure)** - 向社群尋求協助
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - 問答討論區
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - 最新更新

---

**🎉 成功！** 你已部署 Microsoft Foundry Models 並建立了一個可運作的聊天應用程式。開始探索 gpt-4.1 的能力，並嘗試不同的提示與使用情境。

**有問題嗎？** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) 或查看 [FAQ](../../resources/faq.md)

**成本提醒：** 測試完成後記得執行 `azd down` 以避免持續費用（活躍使用約 $50-100/month）。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤譯負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->