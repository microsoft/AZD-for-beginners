# 5. Customize a Template

!!! tip "完成本模組後，您將能夠"

    - [ ] 探索預設的 AI 代理功能
    - [ ] 使用您自己的索引新增 AI 搜尋
    - [ ] 啟用並分析追蹤指標
    - [ ] 執行評估運行
    - [ ] 執行紅隊掃描
    - [ ] **實驗 5：建立自訂計劃**

---

## 5.1 AI Agent Capabilities

!!! success "我們在實驗室 01 中已完成此部分"

- **檔案搜尋**：OpenAI 內建的檔案搜尋以進行知識檢索
- **引用**：回應中自動附加來源
- **可自訂指令**：調整代理行為與個性
- **工具整合**：可擴充的工具系統以增加自訂功能

---

## 5.2 Knowledge Retrieval Options

!!! task "為完成此步驟，我們需要進行修改並重新部署"    
    
    ```bash title=""
    # 設定環境變數
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # 上傳資料並建立索引

    ```

---

**OpenAI 檔案搜尋（預設）：**

- 內建於 Foundry 代理
- 自動檔案處理與建立索引
- 無需額外設定

**Azure AI 搜尋（選用）：**

- 混合語意與向量搜尋
- 自訂索引管理
- 進階搜尋功能
- 需要設定 `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "為完成此步驟，我們需要進行修改並重新部署"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing：**

- OpenTelemetry 整合
- 請求/回應追蹤
- 效能指標
- 可在 Microsoft Foundry 入口網站中使用

**Logging：**

- Container Apps 中的應用程式日誌
- 結構化日誌與關聯 ID
- 即時及歷史日誌檢視

---

## 5.4 [Agent Evaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**本地評估：**

- 內建評估工具以評量品質
- 自訂評估腳本
- 效能基準測試

**持續監控：**

- 自動評估實時互動
- 品質指標追蹤
- 偵測效能回歸

**CI/CD 整合：**

- GitHub Actions 工作流程
- 自動測試與評估
- 統計比較測試

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI 紅隊：**

- 自動化安全掃描
- AI 系統風險評估
- 多面向安全性評估

**驗證：**

- Azure 服務的受管身分識別
- 選用 Azure App Service 認證
- 開發階段可使用基本認證備援

!!! quote "完成本實驗後，您應該已經"
    - [ ] 定義您的情境需求
    - [ ] 自訂環境變數（設定）
    - [ ] 自訂代理指令（任務）
    - [ ] 部署自訂模板（應用程式）
    - [ ] 完成部署後任務（手動）
    - [ ] 執行測試評估

此範例示範為企業零售用例自訂模板，包含兩個專用代理與多個模型部署。

---

## 5.6 為您量身打造！

### 5.6.1. 情境需求

#### **代理部署：** 

   - Shopper Agent：協助顧客尋找及比較產品
   - Loyalty Agent：管理顧客獎勵與促銷活動

#### **模型部署：**

   - `gpt-4.1`：主要對話模型
   - `o3`：用於複雜查詢的推理模型
   - `gpt-4.1-nano`：簡易互動專用輕量模型
   - `text-embedding-3-large`：高品質檢索嵌入向量模型

#### **功能：**

   - 啟用追蹤及監控
   - 產品目錄使用 AI 搜尋
   - 品質保證的評估框架
   - 用於安全驗證的紅隊測試

---

### 5.6.2 情境實作


#### 5.6.2.1. 部署前設定

建立設定腳本 (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# 設定環境名稱
azd env set AZURE_ENV_NAME "retail-ai-agents"

# 配置地區（根據模型可用性選擇）
azd env set AZURE_LOCATION "eastus2"

# 啟用所有可選服務
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# 配置主要聊天模型（gpt-4o 為最接近 gpt-4.1 的可用模型）
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# 配置嵌入模型以增強搜尋效果
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# 設定代理名稱（將創建第一個代理）
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# 配置搜尋索引
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: 代理指令

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

#### 5.6.2.3: 部署腳本

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

# 檢查所選地區的配額
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

# 部署基礎設施及應用程式
echo "🏗️  Deploying Azure infrastructure..."
azd up

# 捕捉部署輸出
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# 取得網頁應用程式網址
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

建立 `configure-retail-agents.sh`：

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# 獲取部署資訊
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# 手動配置指示
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

建立 `test-retail-deployment.sh`：

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# 驗證環境變數是否已設定
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# 測試網頁應用程式可用性
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

# 如有設定則執行評估
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

### 5.6.4 預期成果

依照此實作指南，您將擁有：

1. **已部署基礎設施：**

      - 帶有模型部署的 Microsoft Foundry 專案
      - 托管 Web 應用的 Container Apps
      - 產品目錄用的 AI 搜尋服務
      - 監控用的 Application Insights

2. **初始代理：**

      - 配置基礎指令的 Shopper Agent
      - 啟用檔案搜尋功能
      - 設定追蹤與監控

3. **準備進行自訂：**

      - 加入 Loyalty Agent 的框架
      - 自訂指令範本
      - 測試與驗證腳本
      - 監控與評估設定

4. **生產準備：**

      - 使用紅隊進行安全掃描
      - 性能監控
      - 品質評估框架
      - 可擴展架構

此範例展示了如何延伸與自訂 AZD 模板，以符合特定企業情境，同時維持安全性、監控及可擴充性最佳實務。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件乃使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->