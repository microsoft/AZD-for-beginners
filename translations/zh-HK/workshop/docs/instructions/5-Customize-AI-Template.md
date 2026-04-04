# 5. 自訂範本

!!! tip "完成此模組後你將能夠"

    - [ ] 已探索預設的 AI 代理功能
    - [ ] 已新增 AI 搜尋並使用您自己的索引
    - [ ] 已啟用並分析追蹤 (Tracing) 指標
    - [ ] 已執行一次評估
    - [ ] 已執行紅隊掃描
    - [ ] **Lab 5：建立自訂化計劃** 

---

## 5.1 AI 代理功能

!!! success "我們在 Lab 01 已完成此部分"

- <strong>檔案搜尋</strong>：OpenAI 內建的檔案搜尋，用於知識檢索
- <strong>引用來源</strong>：回應中的自動來源標註
- <strong>可自訂指示</strong>：修改代理的行為與個性
- <strong>工具整合</strong>：可擴充的工具系統以提供自訂功能

---

## 5.2 知識檢索選項

!!! task "要完成此項，我們需要進行變更並重新部署"    
    
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

**OpenAI 檔案搜尋（預設）：**

- 內建在 Foundry Agents 中
- 自動文件處理與索引
- 無需額外設定

**Azure AI Search（選用）：**

- 語意與向量混合搜尋
- 自訂索引管理
- 進階搜尋功能
- 需要 `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [追蹤與監控](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "To complete this we need to make changes and redeploy"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**追蹤（Tracing）：**

- 整合 OpenTelemetry
- 請求/回應追蹤
- 效能指標
- 可在 Microsoft Foundry 入口網站取得

**日誌：**

- Container Apps 的應用程式日誌
- 使用關聯 ID 的結構化日誌
- 即時與歷史日誌檢視

---

## 5.4 [代理評估](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**本地評估：**

- 內建評估工具以進行品質評估
- 自訂評估腳本
- 效能基準測試

**持續監控：**

- 自動評估即時互動
- 品質指標追蹤
- 效能回歸偵測

**CI/CD 整合：**

- GitHub Actions 工作流程
- 自動化測試與評估
- 統計比較測試

---

## 5.5 [AI 紅隊代理](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI 紅隊測試：**

- 自動化安全掃描
- AI 系統風險評估
- 跨多個類別的安全性評估

**認證：**

- 用於 Azure 服務的受管身分 (Managed Identity)
- 可選的 Azure App Service 認證
- 開發時的基本認證備援



!!! quote "在本實驗結束時，你應該已經完成"
    - [ ] 已定義您的場景需求
    - [ ] 自訂環境變數（設定）
    - [ ] 自訂代理指示（任務）
    - [ ] 已部署自訂範本（應用程式）
    - [ ] 完成部署後的手動工作
    - [ ] 執行測試評估

此範例示範如何為企業零售使用案例自訂範本，包含兩個專門化代理與多個模型部署。

---

## 5.6 為你自訂！

### 5.6.1. 情境需求

#### **代理部署：** 

   - Shopper Agent：協助顧客尋找與比較產品
   - Loyalty Agent：管理顧客獎勵與促銷

#### **模型部署：**

   - `gpt-4.1`：主要聊天模型
   - `o3`：用於複雜查詢的推理模型
   - `gpt-4.1-nano`：用於簡單互動的輕量模型
   - `text-embedding-3-large`：用於搜尋的高品質嵌入模型

#### **功能：**

   - 已啟用追蹤與監控
   - 用於產品目錄的 AI 搜尋
   - 用於品質保證的評估框架
   - 用於安全驗證的紅隊測試

---

### 5.6.2 情境實作


#### 5.6.2.1. 部署前設定

建立一個設定腳本（`setup-retail.sh`）

```bash title="" linenums="0"
#!/bin/bash

# 設定環境名稱
azd env set AZURE_ENV_NAME "retail-ai-agents"

# 配置地區（按模型可用性選擇）
azd env set AZURE_LOCATION "eastus2"

# 啟用所有可選服務
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# 配置主要聊天模型（gpt-4.1，作為最接近 gpt-4.1 的可用模型）
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# 配置用於增強搜尋的向量嵌入模型
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# 設定代理名稱（會建立第一個代理）
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# 配置搜尋索引
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2：代理指示

建立 `custom-agents/shopper-agent-instructions.md`：

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

建立 `custom-agents/loyalty-agent-instructions.md`：

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

#### 5.6.2.3：部署腳本

建立 `deploy-retail.sh`：

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

# 檢查所選區域的配額
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

# 部署基礎架構和應用程式
echo "🏗️  Deploying Azure infrastructure..."
azd up

# 擷取部署輸出
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# 取得 Web 應用程式的 URL
APP_URL=$(azd env get-values | grep '^APP_URL=' | cut -d'=' -f2- | tr -d '"')

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

#### 5.6.2.4：部署後設定

建立 `configure-retail-agents.sh`：

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

### 5.6.3：測試與驗證

建立 `test-retail-deployment.sh`：

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# 確認環境變數已設定
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# 測試 Web 應用程式是否可用
APP_URL=$(azd env get-values | grep '^APP_URL=' | cut -d'=' -f2- | tr -d '"')
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

# 如有配置則執行評估
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

### 5.6.4 預期結果

依循此實作指南後，您將會擁有：

1. **已部署的基礎設施：**

      - Microsoft Foundry 專案，含模型部署
      - 承載 Web 應用程式的 Container Apps
      - 用於產品目錄的 AI Search 服務
      - 用於監控的 Application Insights

2. **初始代理：**

      - Shopper Agent 已配置基本指示
      - 已啟用檔案搜尋功能
      - 已設定追蹤與監控

3. **準備自訂：**

      - 可用於加入 Loyalty Agent 的框架
      - 自訂指示範本
      - 測試與驗證腳本
      - 監控與評估設定

4. **上線準備：**

      - 以紅隊測試進行的安全掃描
      - 效能監控
      - 品質評估框架
      - 可擴充的架構

此範例展示了如何在維持安全性、監控與可擴充性最佳實務的同時，擴充並自訂 AZD 範本以符合特定的企業情境。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。我們對因使用本翻譯而引致的任何誤解或錯誤詮釋概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->