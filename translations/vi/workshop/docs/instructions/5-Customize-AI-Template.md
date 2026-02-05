# 5. Tùy chỉnh một Mẫu

!!! tip "SAU KHI HOÀN THÀNH MODULE NÀY BẠN SẼ CÓ THỂ"

    - [ ] Khám phá các khả năng mặc định của AI Agent
    - [ ] Thêm AI Search với chỉ mục của riêng bạn
    - [ ] Kích hoạt và phân tích các chỉ số Tracing
    - [ ] Thực hiện một lần đánh giá
    - [ ] Thực hiện quét red-teaming
    - [ ] **Lab 5: Xây dựng Kế hoạch Tùy chỉnh**

---

## 5.1 Khả năng của AI Agent

!!! success "Chúng tôi đã hoàn thành điều này trong Lab 01"

- **File Search**: Tìm kiếm tệp tích hợp của OpenAI để truy xuất kiến thức
- **Citations**: Tự động gán nguồn trong các phản hồi
- **Customizable Instructions**: Tùy chỉnh hành vi và tính cách của agent
- **Tool Integration**: Hệ thống công cụ mở rộng cho các khả năng tùy chỉnh

---

## 5.2 Các tùy chọn truy xuất kiến thức

!!! task "Để hoàn thành điều này, chúng ta cần thực hiện thay đổi và triển khai lại"    
    
    ```bash title=""
    # Đặt các biến môi trường
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Tải dữ liệu lên và tạo chỉ mục của tôi

    ```

---

**OpenAI File Search (Mặc định):**

- Tích hợp sẵn trong dịch vụ Azure AI Agent
- Xử lý và lập chỉ mục tài liệu tự động
- Không cần cấu hình bổ sung

**Azure AI Search (Tùy chọn):**

- Tìm kiếm kết hợp ngữ nghĩa và vector
- Quản lý chỉ mục tùy chỉnh
- Khả năng tìm kiếm nâng cao
- Yêu cầu `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Để hoàn thành điều này, chúng ta cần thực hiện thay đổi và triển khai lại"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- Tích hợp OpenTelemetry
- Theo dõi yêu cầu/phản hồi
- Các chỉ số hiệu suất
- Có sẵn trong cổng AI Foundry

**Logging:**

- Nhật ký ứng dụng trong Container Apps
- Nhật ký có cấu trúc với ID tương quan
- Xem nhật ký theo thời gian thực và lịch sử

---

## 5.4 [Đánh giá Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Đánh giá cục bộ:**

- Các công cụ đánh giá tích hợp để đánh giá chất lượng
- Các script đánh giá tùy chỉnh
- Đánh giá hiệu suất

**Giám sát liên tục:**

- Đánh giá tự động các tương tác trực tiếp
- Theo dõi các chỉ số chất lượng
- Phát hiện suy giảm hiệu suất

**Tích hợp CI/CD:**

- Quy trình làm việc GitHub Actions
- Kiểm tra và đánh giá tự động
- Kiểm tra so sánh thống kê

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Quét bảo mật tự động
- Đánh giá rủi ro cho các hệ thống AI
- Đánh giá an toàn trên nhiều danh mục

**Xác thực:**

- Managed Identity cho các dịch vụ Azure
- Tùy chọn xác thực Azure App Service
- Xác thực cơ bản cho phát triển

!!! quote "SAU KHI HOÀN THÀNH LAB NÀY BẠN NÊN CÓ"
    - [ ] Xác định yêu cầu kịch bản của bạn
    - [ ] Tùy chỉnh các biến môi trường (config)
    - [ ] Tùy chỉnh hướng dẫn cho agent (task)
    - [ ] Triển khai mẫu tùy chỉnh (app)
    - [ ] Hoàn thành các nhiệm vụ sau triển khai (manual)
    - [ ] Thực hiện một lần đánh giá thử nghiệm

Ví dụ này minh họa cách tùy chỉnh mẫu cho một trường hợp sử dụng bán lẻ doanh nghiệp với hai agent chuyên biệt và nhiều triển khai mô hình.

---

## 5.6 Tùy chỉnh theo cách của bạn!

### 5.6.1. Yêu cầu Kịch bản

#### **Triển khai Agent:** 

   - Shopper Agent: Giúp khách hàng tìm kiếm và so sánh sản phẩm
   - Loyalty Agent: Quản lý phần thưởng và khuyến mãi cho khách hàng

#### **Triển khai Mô hình:**

   - `gpt-4.1`: Mô hình chat chính
   - `o3`: Mô hình suy luận cho các truy vấn phức tạp
   - `gpt-4.1-nano`: Mô hình nhẹ cho các tương tác đơn giản
   - `text-embedding-3-large`: Embedding chất lượng cao cho tìm kiếm

#### **Tính năng:**

   - Kích hoạt tracing và monitoring
   - AI Search cho danh mục sản phẩm
   - Khung đánh giá để đảm bảo chất lượng
   - Red teaming để xác thực bảo mật

---

### 5.6.2 Triển khai Kịch bản


#### 5.6.2.1. Cấu hình trước triển khai

Tạo script thiết lập (`setup-retail.sh`)

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

#### 5.6.2.2: Hướng dẫn cho Agent

Tạo `custom-agents/shopper-agent-instructions.md`:

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

Tạo `custom-agents/loyalty-agent-instructions.md`:

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

Tạo `deploy-retail.sh`:

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

#### 5.6.2.4: Cấu hình sau triển khai

Tạo `configure-retail-agents.sh`:

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

### 5.6.3: Kiểm tra và Xác thực

Tạo `test-retail-deployment.sh`:

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

### 5.6.4 Kết quả mong đợi

Sau khi làm theo hướng dẫn triển khai này, bạn sẽ có:

1. **Hạ tầng đã triển khai:**

      - Dự án AI Foundry với các triển khai mô hình
      - Container Apps lưu trữ ứng dụng web
      - Dịch vụ AI Search cho danh mục sản phẩm
      - Application Insights để giám sát

2. **Agent ban đầu:**

      - Shopper Agent được cấu hình với hướng dẫn cơ bản
      - Khả năng tìm kiếm tệp được kích hoạt
      - Tracing và monitoring được cấu hình

3. **Sẵn sàng tùy chỉnh:**

      - Khung để thêm Loyalty Agent
      - Mẫu hướng dẫn tùy chỉnh
      - Script kiểm tra và xác thực
      - Cài đặt giám sát và đánh giá

4. **Sẵn sàng cho sản xuất:**

      - Quét bảo mật với red teaming
      - Giám sát hiệu suất
      - Khung đánh giá chất lượng
      - Kiến trúc có khả năng mở rộng

Ví dụ này minh họa cách mẫu AZD có thể được mở rộng và tùy chỉnh cho các kịch bản doanh nghiệp cụ thể trong khi duy trì các thực tiễn tốt nhất về bảo mật, giám sát và khả năng mở rộng.

---

