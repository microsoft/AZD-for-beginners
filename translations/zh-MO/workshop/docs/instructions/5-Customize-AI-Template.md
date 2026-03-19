# 5. 自訂範本

!!! tip "在本單元結束時，您將能夠"

    - [ ] 探索預設的 AI 代理功能
    - [ ] 加入 AI 搜尋並使用您自己的索引
    - [ ] 啟用並分析追蹤指標
    - [ ] 執行評估
    - [ ] 執行紅隊掃描
    - [ ] **實驗 5：建立自訂化計劃** 

---

## 5.1 AI 代理功能

!!! success "我們在實驗 01 已完成此項"

- <strong>檔案搜尋</strong>: OpenAI 內建的檔案搜尋，用於知識擷取
- <strong>引用來源</strong>: 回應中的自動來源標註
- <strong>可自訂指示</strong>: 修改代理行為與個性
- <strong>工具整合</strong>: 可擴充的工具系統以支援自訂功能

---

## 5.2 知識擷取選項

!!! task "要完成此項我們需要做變更並重新部署"    
    
    ```bash title=""
    # Set environment variables
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Upload data and create my index

    ```

---

**OpenAI File Search (Default):**

- 內建於 Foundry 代理
- 自動文件處理與建立索引
- 不需要額外設定

**Azure AI Search (Optional):**

- 語意與向量混合搜尋
- 自訂索引管理
- 進階搜尋功能
- 需要 `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [追蹤與監控](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "要完成此項我們需要做變更並重新部署"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**追蹤:**

- 整合 OpenTelemetry
- 請求/回應追蹤
- 效能指標
- 可在 Microsoft Foundry 入口網站查看

**日誌:**

- Container Apps 中的應用程式日誌
- 帶有關聯 ID 的結構化日誌
- 即時與歷史日誌檢視

---

## 5.4 [代理評估](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**本機評估:**

- 內建評估器用於品質評估
- 自訂評估腳本
- 效能基準測試

**持續監控:**

- 對即時互動的自動評估
- 品質指標追蹤
- 效能回歸偵測

**CI/CD 整合:**

- GitHub Actions 工作流程
- 自動化測試與評估
- 統計比較測試

---

## 5.5 [AI 紅隊代理](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI 紅隊測試:**

- 自動安全掃描
- AI 系統風險評估
- 跨多個類別的安全評估

**驗證:**

- Azure 服務的 Managed Identity
- 可選的 Azure App Service 驗證
- 開發時的基本認證回退



!!! quote "在本實驗結束時，您應該會有"
    - [ ] 定義您的情境需求
    - [ ] 自訂環境變數（config）
    - [ ] 自訂代理指示（task）
    - [ ] 部署自訂範本（app）
    - [ ] 完成部署後的工作（手動）
    - [ ] 執行測試評估

本範例示範如何為企業零售使用案例自訂範本，包含兩個專門的代理及多個模型部署。

---

## 5.6 為您自訂！

### 5.6.1. 情境需求

#### **Agent Deployments:** 

   - Shopper Agent: 協助客戶尋找並比較產品
   - Loyalty Agent: 管理客戶獎勵與促銷活動

#### **Model Deployments:**

   - `gpt-4.1`: 主要交談模型
   - `o3`: 用於複雜查詢的推理模型
   - `gpt-4.1-nano`: 用於簡單互動的輕量模型
   - `text-embedding-3-large`: 用於搜尋的高品質嵌入

#### **Features:**

   - 啟用追蹤與監控
   - 用於產品目錄的 AI 搜尋
   - 用於品質保證的評估架構
   - 用於安全驗證的紅隊測試

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# 設定環境名稱
azd env set AZURE_ENV_NAME "retail-ai-agents"

# 設定地區（根據模型可用性選擇）
azd env set AZURE_LOCATION "eastus2"

# 啟用所有可選服務
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# 設定主要聊天模型（gpt-4.1 為與 gpt-4.1 最接近的可用模型）
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# 設定嵌入模型以增強搜尋
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# 設定代理名稱（將建立第一個代理）
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# 設定搜尋索引
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: 代理指示

Create `custom-agents/shopper-agent-instructions.md`:

```markdown
# Shopper Agent Instructions

You are a helpful shopping assistant for an enterprise retail company. Your role is to:

1. **Product Discovery**: Help customers find products that match their needs
2. **Comparison**: Provide detailed product comparisons with pros/cons
3. **Recommendations**: Suggest complementary products and alternatives
4. **Inventory**: Check product availability and delivery options

## Guidelines:
- Always provide citations from the product catalog
- Be conversational and helpful
- Ask clarifying questions to understand customer needs
- Mention relevant promotions when appropriate
- Escalate complex warranty or return questions to human agents

## Knowledge Base:
You have access to our complete product catalog including specifications, pricing, reviews, and inventory levels.
```

Create `custom-agents/loyalty-agent-instructions.md`:

```markdown
# Loyalty Agent Instructions

You are a customer loyalty specialist focused on maximizing customer satisfaction and retention. Your responsibilities include:

1. **Rewards Management**: Explain point values, redemption options, and tier benefits
2. **Promotions**: Identify applicable discounts and special offers
3. **Program Navigation**: Help customers understand loyalty program features
4. **Account Support**: Assist with account-related questions and updates

## Guidelines:
- Prioritize customer satisfaction and retention
- Explain complex program rules in simple terms
- Proactively identify opportunities for customers to save money
- Celebrate customer milestones and achievements
- Connect customers with shopper agent for product questions

## Knowledge Base:
You have access to loyalty program rules, current promotions, customer tier information, and reward catalogs.
```

---

#### 5.6.2.3: 部署腳本

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# 驗證先決條件
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# 設定環境
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# 檢查所選地區的配額
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4.1: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# 部署基礎設施和應用程式
echo "🏗️  Deploying Azure infrastructure..."
azd up

# 擷取部署輸出
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# 取得網頁應用程式的 URL
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 Microsoft Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in Microsoft Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4: 部署後設定

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# 取得部署資訊
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# 手動設定說明
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to Microsoft Foundry portal: https://ai.azure.com
   - Navigate to your project
   - Select Agents tab
   - Edit the existing agent
   - Update instructions with content from custom-agents/shopper-agent-instructions.md

2. **Create Loyalty Agent:**
   - In Agents tab, click 'Create Agent'
   - Name: 'loyalty-agent'
   - Model: Use same deployment as shopper agent
   - Instructions: Use content from custom-agents/loyalty-agent-instructions.md
   - Enable file search tool
   - Save and note the Agent ID

3. **Upload Knowledge Base:**
   - Prepare product catalog files (JSON/CSV format)
   - Upload to both agents' file search
   - Or configure Azure AI Search index

4. **Test Configuration:**
   - Test shopper agent with product queries
   - Test loyalty agent with rewards questions
   - Verify citations and search functionality

📊 Monitoring Setup:
- Tracing: Available in Microsoft Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3: 測試與驗證

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# 確認環境變數已設定
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# 測試 Web 應用程式的可用性
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')
if [ ! -z "$APP_URL" ]; then
    echo "🌐 Testing web application at: $APP_URL"
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "✅ Web application is responding"
    else
        echo "❌ Web application returned status: $HTTP_STATUS"
    fi
else
    echo "❌ Could not retrieve web application URL"
fi

# 若已設定則執行評估
if [ -f "evals/evaluate.py" ]; then
    echo "📊 Running agent evaluation..."
    cd evals
    python -m pip install -r ../src/requirements.txt
    python -m pip install azure-ai-evaluation
    python evaluate.py
    cd ..
fi

echo "
🎯 Deployment validation complete!

Next steps:
1. Access the web application and test basic functionality
2. Create the second agent (Loyalty Agent) in Microsoft Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 期望結果

按照此實作指南操作後，您將擁有：

1. **已部署基礎架構：**

      - Microsoft Foundry 專案與模型部署
      - Container Apps 承載的網頁應用程式
      - 用於產品目錄的 AI Search 服務
      - 用於監控的 Application Insights

2. **初始代理：**

      - Shopper Agent 配置了基本指示
      - 啟用檔案搜尋功能
      - 已設定追蹤與監控

3. **準備進行自訂：**

      - 可新增 Loyalty Agent 的框架
      - 自訂指示範本
      - 測試與驗證腳本
      - 監控與評估設定

4. **生產準備就緒：**

      - 透過紅隊進行的安全掃描
      - 效能監控
      - 品質評估架構
      - 可擴展架構

本範例示範如何在維持安全、監控與可擴展性等最佳實務的同時，擴充並自訂 AZD 範本以因應特定的企業情境。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言版本的文件應視為具權威性的來源。如涉及重要資訊，建議採用專業人工翻譯。對於因使用本翻譯而引起之任何誤解或曲解，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->