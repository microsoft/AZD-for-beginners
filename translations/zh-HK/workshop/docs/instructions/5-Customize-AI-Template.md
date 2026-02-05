# 5. 自訂模板

!!! tip "完成此模組後，您將能夠"

    - [ ] 探索預設的 AI Agent 功能
    - [ ] 使用自己的索引添加 AI 搜索
    - [ ] 啟用並分析追蹤指標
    - [ ] 執行評估測試
    - [ ] 執行紅隊掃描
    - [ ] **實驗室 5：制定自訂計劃**

---

## 5.1 AI Agent 功能

!!! success "我們已在實驗室 01 完成此部分"

- **文件搜索**：OpenAI 的內建文件搜索功能，用於知識檢索
- **引用**：回應中的自動來源註明
- **可自訂指令**：修改代理行為和個性
- **工具整合**：可擴展的工具系統，用於自訂功能

---

## 5.2 知識檢索選項

!!! task "完成此部分需要進行更改並重新部署"

    ```bash title=""
    # 設定環境變數
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # 上傳數據並建立索引
    ```

---

**OpenAI 文件搜索（預設）：**

- 內建於 Azure AI Agent 服務
- 自動文件處理和索引
- 無需額外配置

**Azure AI 搜索（可選）：**

- 混合語義和向量搜索
- 自訂索引管理
- 高級搜索功能
- 需要 `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [追蹤與監控](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "完成此部分需要進行更改並重新部署"

    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**追蹤：**

- OpenTelemetry 整合
- 請求/回應追蹤
- 性能指標
- 可在 AI Foundry 入口網站查看

**日誌：**

- 容器應用中的應用日誌
- 帶有關聯 ID 的結構化日誌
- 即時和歷史日誌查看

---

## 5.4 [代理評估](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**本地評估：**

- 內建評估工具，用於質量評估
- 自訂評估腳本
- 性能基準測試

**持續監控：**

- 自動評估實時交互
- 質量指標追蹤
- 性能回歸檢測

**CI/CD 整合：**

- GitHub Actions 工作流程
- 自動化測試和評估
- 統計比較測試

---

## 5.5 [AI 紅隊代理](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI 紅隊測試：**

- 自動化安全掃描
- AI 系統的風險評估
- 多類別的安全性評估

**身份驗證：**

- Azure 服務的托管身份
- 可選的 Azure App Service 身份驗證
- 開發環境的基本身份驗證備選方案

!!! quote "完成此實驗室後，您應該已完成"
    - [ ] 定義您的場景需求
    - [ ] 自訂環境變數（配置）
    - [ ] 自訂代理指令（任務）
    - [ ] 部署自訂模板（應用）
    - [ ] 完成部署後的任務（手動）
    - [ ] 執行測試評估

此示例展示了如何為企業零售場景自訂模板，使用兩個專業代理和多個模型部署。

---

## 5.6 為您量身定制！

### 5.6.1 場景需求

#### **代理部署：**

   - Shopper Agent：幫助客戶查找和比較產品
   - Loyalty Agent：管理客戶獎勵和促銷活動

#### **模型部署：**

   - `gpt-4.1`：主要聊天模型
   - `o3`：處理複雜查詢的推理模型
   - `gpt-4.1-nano`：用於簡單交互的輕量模型
   - `text-embedding-3-large`：高質量嵌入，用於搜索

#### **功能：**

   - 啟用追蹤和監控
   - AI 搜索產品目錄
   - 質量保證的評估框架
   - 安全驗證的紅隊測試

---

### 5.6.2 場景實施

#### 5.6.2.1 部署前配置

建立設定腳本 (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Set environment name
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configure region (choose based on model availability)
azd env set AZURE_LOCATION "eastus2"

# Enable all optional services
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configure primary chat model (gpt-4o as closest available to gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configure embedding model for enhanced search
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Set agent name (will create first agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configure search index
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2 代理指令

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

#### 5.6.2.3 部署腳本

建立 `deploy-retail.sh`：

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Validate prerequisites
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Set up environment
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Check quota in selected region
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4o: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# Deploy infrastructure and application
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Capture deployment outputs
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Get the web app URL
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 AI Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in AI Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4 部署後配置

建立 `configure-retail-agents.sh`：

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Get deployment information
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instructions for manual configuration
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to AI Foundry portal: https://ai.azure.com
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
- Tracing: Available in AI Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3 測試與驗證

建立 `test-retail-deployment.sh`：

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Verify environment variables are set
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Test web application availability
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

# Run evaluation if configured
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
2. Create the second agent (Loyalty Agent) in AI Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 預期結果

完成此實施指南後，您將擁有：

1. **已部署的基礎架構：**

      - AI Foundry 項目及模型部署
      - 容器應用托管的網頁應用
      - 用於產品目錄的 AI 搜索服務
      - 用於監控的 Application Insights

2. **初始代理：**

      - 配置了基本指令的 Shopper Agent
      - 啟用了文件搜索功能
      - 配置了追蹤和監控

3. **準備自訂：**

      - 添加 Loyalty Agent 的框架
      - 自訂指令模板
      - 測試和驗證腳本
      - 監控和評估設置

4. **生產準備：**

      - 紅隊測試的安全掃描
      - 性能監控
      - 質量評估框架
      - 可擴展的架構

此示例展示了如何擴展和自訂 AZD 模板以滿足特定企業場景，同時保持安全性、監控和可擴展性的最佳實踐。

---

