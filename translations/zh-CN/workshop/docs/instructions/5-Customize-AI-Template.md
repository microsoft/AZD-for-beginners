# 5. 定制模板

!!! tip "完成本模块后，您将能够"

    - [ ] 探索默认的 AI Agent 功能
    - [ ] 使用自己的索引添加 AI 搜索
    - [ ] 激活并分析追踪指标
    - [ ] 执行评估运行
    - [ ] 执行红队扫描
    - [ ] **实验 5：制定定制计划**

---

## 5.1 AI Agent 功能

!!! success "我们在实验 01 中已完成"

- **文件搜索**：OpenAI 内置的文件搜索功能，用于知识检索
- **引用**：响应中的自动来源归属
- **可定制指令**：修改代理行为和个性
- **工具集成**：可扩展的工具系统，用于自定义功能

---

## 5.2 知识检索选项

!!! task "完成此任务需要进行更改并重新部署"    
    
    ```bash title=""
    # 设置环境变量
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # 上传数据并创建我的索引

    ```

---

**OpenAI 文件搜索（默认）：**

- 内置于 Azure AI Agent 服务
- 自动文档处理和索引
- 无需额外配置

**Azure AI 搜索（可选）：**

- 混合语义和向量搜索
- 自定义索引管理
- 高级搜索功能
- 需要设置 `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [追踪与监控](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "完成此任务需要进行更改并重新部署"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**追踪：**

- OpenTelemetry 集成
- 请求/响应追踪
- 性能指标
- 可在 AI Foundry 门户中查看

**日志记录：**

- 容器应用中的应用日志
- 带有关联 ID 的结构化日志
- 实时和历史日志查看

---

## 5.4 [代理评估](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**本地评估：**

- 内置评估器用于质量评估
- 自定义评估脚本
- 性能基准测试

**持续监控：**

- 自动评估实时交互
- 质量指标追踪
- 性能回归检测

**CI/CD 集成：**

- GitHub Actions 工作流
- 自动化测试和评估
- 统计比较测试

---

## 5.5 [AI 红队代理](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI 红队：**

- 自动化安全扫描
- AI 系统的风险评估
- 多类别的安全性评估

**认证：**

- Azure 服务的托管身份
- 可选的 Azure 应用服务认证
- 开发环境的基本认证备用选项

!!! quote "完成本实验后，您应该已经"
    - [ ] 定义了场景需求
    - [ ] 定制了环境变量（配置）
    - [ ] 定制了代理指令（任务）
    - [ ] 部署了定制模板（应用）
    - [ ] 完成了部署后的任务（手动）
    - [ ] 运行了测试评估

此示例展示了如何为企业零售场景定制模板，使用两个专用代理和多个模型部署。

---

## 5.6 为您定制！

### 5.6.1 场景需求

#### **代理部署：**

   - Shopper Agent：帮助客户查找和比较产品
   - Loyalty Agent：管理客户奖励和促销活动

#### **模型部署：**

   - `gpt-4.1`：主要聊天模型
   - `o3`：用于复杂查询的推理模型
   - `gpt-4.1-nano`：用于简单交互的轻量模型
   - `text-embedding-3-large`：用于搜索的高质量嵌入模型

#### **功能：**

   - 启用追踪和监控
   - AI 搜索产品目录
   - 质量保证的评估框架
   - 安全验证的红队测试

---

### 5.6.2 场景实施

#### 5.6.2.1 部署前配置

创建设置脚本 (`setup-retail.sh`)

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

创建 `custom-agents/shopper-agent-instructions.md`：

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

创建 `custom-agents/loyalty-agent-instructions.md`：

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

#### 5.6.2.3 部署脚本

创建 `deploy-retail.sh`：

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

#### 5.6.2.4 部署后配置

创建 `configure-retail-agents.sh`：

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

### 5.6.3 测试与验证

创建 `test-retail-deployment.sh`：

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

### 5.6.4 预期结果

按照此实施指南操作后，您将拥有：

1. **已部署的基础设施：**

      - 带有模型部署的 AI Foundry 项目
      - 托管 Web 应用的容器应用
      - 用于产品目录的 AI 搜索服务
      - 用于监控的 Application Insights

2. **初始代理：**

      - 配置了基本指令的 Shopper Agent
      - 启用了文件搜索功能
      - 配置了追踪和监控

3. **准备定制：**

      - 添加 Loyalty Agent 的框架
      - 自定义指令模板
      - 测试和验证脚本
      - 监控和评估设置

4. **生产就绪：**

      - 使用红队进行安全扫描
      - 性能监控
      - 质量评估框架
      - 可扩展的架构

此示例展示了如何扩展和定制 AZD 模板以适应特定企业场景，同时保持安全性、监控和可扩展性的最佳实践。

---

