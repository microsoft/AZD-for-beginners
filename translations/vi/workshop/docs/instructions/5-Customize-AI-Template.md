# 5. Tùy chỉnh một Mẫu

!!! tip "ĐẾN CUỐI MODULE NÀY BẠN SẼ CÓ THỂ"

    - [ ] Khám phá các khả năng mặc định của đại lý AI
    - [ ] Thêm AI Search với chỉ mục của bạn
    - [ ] Kích hoạt và phân tích các chỉ số Tracing
    - [ ] Thực hiện một lần chạy đánh giá
    - [ ] Thực hiện một lần quét red-teaming
    - [ ] **Lab 5: Xây dựng Kế hoạch Tùy chỉnh** 

---

## 5.1 Khả năng của Đại lý AI

!!! success "Chúng tôi đã hoàn thành điều này trong Lab 01"

- **File Search**: OpenAI's built-in file search for knowledge retrieval
- **Citations**: Tự động ghi nhãn nguồn trong phản hồi
- **Customizable Instructions**: Chỉnh sửa hành vi và tính cách của đại lý
- **Tool Integration**: Hệ thống công cụ mở rộng cho các khả năng tùy chỉnh

---

## 5.2 Tùy chọn Truy xuất Kiến thức

!!! task "Để hoàn thành điều này, chúng ta cần thực hiện thay đổi và triển khai lại"    
    
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

**OpenAI File Search (Mặc định):**

- Built-in to Foundry Agents
- Automatic document processing and indexing
- No additional configuration required

**Azure AI Search (Tùy chọn):**

- Hybrid semantic and vector search
- Custom index management
- Advanced search capabilities
- Requires `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Theo dõi & Giám sát](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Để hoàn thành điều này, chúng ta cần thực hiện thay đổi và triển khai lại"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Theo dõi:**

- OpenTelemetry integration
- Request/response tracking
- Performance metrics
- Available in Microsoft Foundry portal

**Ghi nhật ký:**

- Application logs in Container Apps
- Structured logging with correlation IDs
- Real-time and historical log viewing

---

## 5.4 [Đánh giá Đại lý](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Đánh giá Cục bộ:**

- Built-in evaluators for quality assessment
- Custom evaluation scripts
- Performance benchmarking

**Giám sát Liên tục:**

- Automatic evaluation of live interactions
- Quality metrics tracking
- Performance regression detection

**Tích hợp CI/CD:**

- GitHub Actions workflow
- Automated testing and evaluation
- Statistical comparison testing

---

## 5.5 [Đại lý Red Teaming AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red Teaming AI:**

- Automated security scanning
- Risk assessment for AI systems
- Safety evaluation across multiple categories

**Xác thực:**

- Managed Identity for Azure services
- Optional Azure App Service authentication
- Basic auth fallback for development



!!! quote "ĐẾN CUỐI LAB NÀY BẠN NÊN CÓ"
    - [ ] Xác định yêu cầu kịch bản của bạn
    - [ ] Tùy chỉnh biến môi trường (config)
    - [ ] Tùy chỉnh hướng dẫn đại lý (task)
    - [ ] Triển khai mẫu đã tùy chỉnh (app)
    - [ ] Hoàn thành các tác vụ sau triển khai (thủ công)
    - [ ] Chạy một bài đánh giá thử nghiệm

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Tùy chỉnh Cho Bạn!

### 5.6.1. Yêu cầu Kịch bản

#### **Triển khai Đại lý:** 

   - Shopper Agent: Giúp khách hàng tìm và so sánh sản phẩm
   - Loyalty Agent: Quản lý phần thưởng và chương trình khuyến mãi cho khách hàng

#### **Triển khai Mô hình:**

   - `gpt-4.1`: Mô hình chat chính
   - `o3`: Mô hình suy luận cho các truy vấn phức tạp
   - `gpt-4.1-nano`: Mô hình nhẹ cho các tương tác đơn giản
   - `text-embedding-3-large`: Embedding chất lượng cao cho tìm kiếm

#### **Tính năng:**

   - Tracing và giám sát được kích hoạt
   - AI Search cho danh mục sản phẩm
   - Khung đánh giá để đảm bảo chất lượng
   - Red teaming để xác thực bảo mật

---

### 5.6.2 Triển khai Kịch bản


#### 5.6.2.1. Cấu hình Trước Triển khai

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Đặt tên môi trường
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Cấu hình vùng (chọn dựa trên khả dụng của mô hình)
azd env set AZURE_LOCATION "eastus2"

# Bật tất cả dịch vụ tùy chọn
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Cấu hình mô hình chat chính (gpt-4.1 là mô hình có sẵn gần nhất)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Cấu hình mô hình embedding để nâng cao tìm kiếm
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Đặt tên agent (sẽ tạo agent đầu tiên)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Cấu hình chỉ mục tìm kiếm
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Hướng dẫn Đại lý

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

#### 5.6.2.3: Script Triển khai

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Xác minh các yêu cầu tiên quyết
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Thiết lập môi trường
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Kiểm tra hạn mức ở vùng được chọn
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

# Triển khai hạ tầng và ứng dụng
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Ghi lại kết quả triển khai
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Lấy URL ứng dụng web
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

#### 5.6.2.4: Cấu hình Sau Triển khai

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Lấy thông tin triển khai
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Hướng dẫn cấu hình thủ công
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

### 5.6.3: Kiểm thử và Xác thực

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Xác minh các biến môi trường đã được thiết lập
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Kiểm tra tính khả dụng của ứng dụng web
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

# Chạy đánh giá nếu được cấu hình
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

### 5.6.4 Kết quả Mong đợi

After following this implementation guide, you will have:

1. **Hạ tầng Đã Triển khai:**

      - Dự án Microsoft Foundry với các triển khai mô hình
      - Container Apps lưu trữ ứng dụng web
      - AI Search service for product catalog
      - Application Insights cho việc giám sát

2. **Đại lý Ban đầu:**

      - Shopper Agent được cấu hình với hướng dẫn cơ bản
      - File search capability enabled
      - Tracing and monitoring configured

3. **Sẵn sàng để Tùy chỉnh:**

      - Framework for adding Loyalty Agent
      - Custom instruction templates
      - Testing and validation scripts
      - Monitoring and evaluation setup

4. **Sẵn sàng Cho Sản xuất:**

      - Security scanning with red teaming
      - Performance monitoring
      - Quality evaluation framework
      - Scalable architecture

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn chính thức. Đối với thông tin quan trọng, khuyến nghị sử dụng bản dịch do người dịch chuyên nghiệp thực hiện. Chúng tôi không chịu trách nhiệm đối với bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->