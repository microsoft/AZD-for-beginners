# Microservices Architecture - Container App Example

⏱️ **Estimated Time**: 25-35 minutes | 💰 **Estimated Cost**: ~$50-100/month | ⭐ **Complexity**: Advanced

A **simplified but functional** microservices architecture deployed to Azure Container Apps using AZD CLI. This example demonstrates service-to-service communication, container orchestration, and monitoring with a practical 2-service setup.

> **📚 Learning Approach**: This example starts with a minimal 2-service architecture (API Gateway + Backend Service) that you can actually deploy and learn from. After mastering this foundation, we provide guidance for expanding to a full microservices ecosystem.

## What You'll Learn

By completing this example, you will:
- Deploy multiple containers to Azure Container Apps
- Implement service-to-service communication with internal networking
- Configure environment-based scaling and health checks
- Monitor distributed applications with Application Insights
- Understand microservices deployment patterns and best practices
- Learn progressive expansion from simple to complex architectures

## Architecture

### Phase 1: What We're Building (Included in This Example)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Why Start Simple?**
- ✅ Deploy and understand quickly (25-35 minutes)
- ✅ Learn core microservices patterns without complexity
- ✅ Working code you can modify and experiment with
- ✅ Lower cost for learning (~$50-100/month vs $300-1400/month)
- ✅ Build confidence before adding databases and message queues

**Analogy**: Think of this like learning to drive. You start with an empty parking lot (2 services), master the basics, then progress to city traffic (5+ services with databases).

### Phase 2: Future Expansion (Reference Architecture)

Once you master the 2-service architecture, you can expand to:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

See "Expansion Guide" section at the end for step-by-step instructions.

## Features Included

✅ **Service Discovery**: Automatic DNS-based discovery between containers  
✅ **Load Balancing**: Built-in load balancing across replicas  
✅ **Auto-scaling**: Independent scaling per service based on HTTP requests  
✅ **Health Monitoring**: Liveness and readiness probes for both services  
✅ **Distributed Logging**: Centralized logging with Application Insights  
✅ **Internal Networking**: Secure service-to-service communication  
✅ **Container Orchestration**: Automatic deployment and scaling  
✅ **Zero-Downtime Updates**: Rolling updates with revision management  

## Prerequisites

### Required Tools

Before starting, verify you have these tools installed:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 or higher)
   ```bash
   azd version
   # Kết quả mong đợi: azd phiên bản 1.0.0 trở lên
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 or higher)
   ```bash
   az --version
   # Kết quả mong đợi: azure-cli 2.50.0 trở lên
   ```

3. **[Docker](https://www.docker.com/get-started)** (for local development/testing - optional)
   ```bash
   docker --version
   # Kết quả mong đợi: Phiên bản Docker 20.10 trở lên
   ```

### Azure Requirements

- An active **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- Permissions to create resources in your subscription
- **Contributor** role on the subscription or resource group

### Knowledge Prerequisites

This is an **advanced-level** example. You should have:
- Completed the [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Basic understanding of microservices architecture
- Familiarity with REST APIs and HTTP
- Understanding of container concepts

**New to Container Apps?** Start with the [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) first to learn the basics.

## Quick Start (Step-by-Step)

### Step 1: Clone and Navigate

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Success Check**: Verify you see `azure.yaml`:
```bash
ls
# Dự kiến: README.md, azure.yaml, infra/, src/
```

### Step 2: Authenticate with Azure

```bash
azd auth login
```

This opens your browser for Azure authentication. Sign in with your Azure credentials.

**✓ Success Check**: You should see:
```
Logged in to Azure.
```

### Step 3: Initialize the Environment

```bash
azd init
```

**Prompts you'll see**:
- **Environment name**: Enter a short name (e.g., `microservices-dev`)
- **Azure subscription**: Select your subscription
- **Azure location**: Choose a region (e.g., `eastus`, `westeurope`)

**✓ Success Check**: You should see:
```
SUCCESS: New project initialized!
```

### Step 4: Deploy Infrastructure and Services

```bash
azd up
```

**What happens** (takes 8-12 minutes):
1. Creates Container Apps environment
2. Creates Application Insights for monitoring
3. Builds API Gateway container (Node.js)
4. Builds Product Service container (Python)
5. Deploys both containers to Azure
6. Configures networking and health checks
7. Sets up monitoring and logging

**✓ Success Check**: You should see:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Time**: 8-12 minutes

### Step 5: Test the Deployment

```bash
# Lấy điểm cuối của gateway
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Kiểm tra tình trạng hoạt động của API Gateway
curl $GATEWAY_URL/health

# Kết quả mong đợi:
# {"status":"khỏe","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Test product service through gateway**:
```bash
# Liệt kê sản phẩm
curl $GATEWAY_URL/api/products

# Kết quả mong đợi:
# [
#   {"id":1,"name":"Máy tính xách tay","price":999.99,"stock":50},
#   {"id":2,"name":"Chuột","price":29.99,"stock":200},
#   {"id":3,"name":"Bàn phím","price":79.99,"stock":150}
# ]
```

**✓ Success Check**: Both endpoints return JSON data without errors.

---

**🎉 Congratulations!** You've deployed a microservices architecture to Azure!

## Project Structure

All implementation files are included—this is a complete, working example:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**What Each Component Does:**

**Infrastructure (infra/)**:
- `main.bicep`: Orchestrates all Azure resources and their dependencies
- `core/container-apps-environment.bicep`: Creates the Container Apps environment and Azure Container Registry
- `core/monitor.bicep`: Sets up Application Insights for distributed logging
- `app/*.bicep`: Individual container app definitions with scaling and health checks

**API Gateway (src/api-gateway/)**:
- Public-facing service that routes requests to backend services
- Implements logging, error handling, and request forwarding
- Demonstrates service-to-service HTTP communication

**Product Service (src/product-service/)**:
- Internal service with product catalog (in-memory for simplicity)
- REST API with health checks
- Example of backend microservice pattern

## Services Overview

### API Gateway (Node.js/Express)

**Port**: 8080  
**Access**: Public (external ingress)  
**Purpose**: Routes incoming requests to appropriate backend services  

**Endpoints**:
- `GET /` - Service information
- `GET /health` - Health check endpoint
- `GET /api/products` - Forward to product service (list all)
- `GET /api/products/:id` - Forward to product service (get by ID)

**Key Features**:
- Request routing with axios
- Centralized logging
- Error handling and timeout management
- Service discovery via environment variables
- Application Insights integration

**Code Highlight** (`src/api-gateway/app.js`):
```javascript
// Giao tiếp dịch vụ nội bộ
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Access**: Internal only (no external ingress)  
**Purpose**: Manages product catalog with in-memory data  

**Endpoints**:
- `GET /` - Service information
- `GET /health` - Health check endpoint
- `GET /products` - List all products
- `GET /products/<id>` - Get product by ID

**Key Features**:
- RESTful API with Flask
- In-memory product store (simple, no database needed)
- Health monitoring with probes
- Structured logging
- Application Insights integration

**Data Model**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Why Internal Only?**
The product service is not exposed publicly. All requests must go through the API Gateway, which provides:
- Security: Controlled access point
- Flexibility: Can change backend without affecting clients
- Monitoring: Centralized request logging

## Understanding Service Communication

### How Services Talk to Each Other

In this example, the API Gateway communicates with the Product Service using **internal HTTP calls**:

```javascript
// Cổng API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Thực hiện yêu cầu HTTP nội bộ
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Key Points**:

1. **DNS-Based Discovery**: Container Apps automatically provides DNS for internal services
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplified as: `http://product-service` (Container Apps resolves it)

2. **No Public Exposure**: Product Service has `external: false` in Bicep
   - Only accessible within the Container Apps environment
   - Cannot be reached from the internet

3. **Environment Variables**: Service URLs are injected at deployment time
   - Bicep passes the internal FQDN to the gateway
   - No hardcoded URLs in application code

**Analogy**: Think of this like office rooms. The API Gateway is the reception desk (public-facing), and the Product Service is an office room (internal only). Visitors must go through reception to reach any office.

## Deployment Options

### Full Deployment (Recommended)

```bash
# Triển khai hạ tầng và cả hai dịch vụ
azd up
```

This deploys:
1. Container Apps environment
2. Application Insights
3. Container Registry
4. API Gateway container
5. Product Service container

**Time**: 8-12 minutes

### Deploy Individual Service

```bash
# Chỉ triển khai một dịch vụ (sau khi chạy azd up lần đầu)
azd deploy api-gateway

# Hoặc triển khai dịch vụ product
azd deploy product-service
```

**Use Case**: When you've updated code in one service and want to redeploy only that service.

### Update Configuration

```bash
# Thay đổi các tham số mở rộng
azd env set GATEWAY_MAX_REPLICAS 30

# Triển khai lại với cấu hình mới
azd up
```

## Configuration

### Scaling Configuration

Both services are configured with HTTP-based autoscaling in their Bicep files:

**API Gateway**:
- Min replicas: 2 (always at least 2 for availability)
- Max replicas: 20
- Scale trigger: 50 concurrent requests per replica

**Product Service**:
- Min replicas: 1 (can scale to zero if needed)
- Max replicas: 10
- Scale trigger: 100 concurrent requests per replica

**Customize Scaling** (in `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Resource Allocation

**API Gateway**:
- CPU: 1.0 vCPU
- Memory: 2 GiB
- Reason: Handles all external traffic

**Product Service**:
- CPU: 0.5 vCPU
- Memory: 1 GiB
- Reason: Lightweight in-memory operations

### Health Checks

Both services include liveness and readiness probes:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**What This Means**:
- **Liveness**: If health check fails, Container Apps restarts the container
- **Readiness**: If not ready, Container Apps stops routing traffic to that replica



## Monitoring & Observability

### View Service Logs

```bash
# Xem nhật ký bằng azd monitor
azd monitor --logs

# Hoặc sử dụng Azure CLI cho các Container Apps cụ thể:
# Phát trực tiếp nhật ký từ API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Xem nhật ký gần đây của dịch vụ sản phẩm
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Expected Output**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights Queries

Access Application Insights in Azure Portal, then run these queries:

**Find Slow Requests**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Track Service-to-Service Calls**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Error Rate by Service**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Request Volume Over Time**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Access Monitoring Dashboard

```bash
# Lấy chi tiết Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Mở phần giám sát trên Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live Metrics

1. Navigate to Application Insights in Azure Portal
2. Click "Live Metrics"
3. See real-time requests, failures, and performance
4. Test by running: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Practical Exercises

[Note: See full exercises above in the "Practical Exercises" section for detailed step-by-step exercises including deployment verification, data modification, autoscaling tests, error handling, and adding a third service.]

## Cost Analysis

### Estimated Monthly Costs (For This 2-Service Example)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**Cost Breakdown by Usage**:
- **Light traffic** (testing/learning): ~$60/month
- **Moderate traffic** (small production): ~$120/month
- **High traffic** (busy periods): ~$240/month

### Cost Optimization Tips

1. **Scale to Zero for Development**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Use Consumption Plan for Cosmos DB** (when you add it):
   - Pay only for what you use
   - No minimum charge

3. **Set Application Insights Sampling**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Lấy mẫu 50% các yêu cầu
   ```

4. **Clean Up When Not Needed**:
   ```bash
   azd down
   ```

### Free Tier Options
For learning/testing, consider:
- Sử dụng tín dụng miễn phí của Azure (30 ngày đầu tiên)
- Giữ số bản sao ở mức tối thiểu
- Xóa sau khi kiểm tra (không phát sinh chi phí liên tục)

---

## Dọn dẹp

Để tránh chi phí liên tục, xóa tất cả tài nguyên:

```bash
azd down --force --purge
```

**Lời nhắc Xác nhận**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Gõ `y` để xác nhận.

**Những gì sẽ được xóa**:
- Môi trường Container Apps
- Cả hai Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Nhóm tài nguyên

**✓ Xác minh việc dọn dẹp**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Nên trả về rỗng.

---

## Hướng dẫn mở rộng: Từ 2 lên 5+ dịch vụ

Khi bạn đã nắm vững kiến trúc 2 dịch vụ này, đây là cách mở rộng:

### Giai đoạn 1: Thêm khả năng lưu dữ liệu (Bước tiếp theo)

**Thêm Cosmos DB cho Dịch vụ Sản phẩm**:

1. Tạo `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Cập nhật dịch vụ sản phẩm để sử dụng Cosmos DB thay vì dữ liệu trong bộ nhớ

3. Ước tính chi phí bổ sung: ~ $25/tháng (serverless)

### Giai đoạn 2: Thêm dịch vụ thứ ba (Quản lý Đơn hàng)

**Tạo Dịch vụ Đơn hàng**:

1. Thư mục mới: `src/order-service/` (Python/Node.js/C#)
2. Bicep mới: `infra/app/order-service.bicep`
3. Cập nhật API Gateway để điều hướng tới `/api/orders`
4. Thêm Azure SQL Database cho việc lưu trữ đơn hàng

**Kiến trúc trở thành**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Giai đoạn 3: Thêm giao tiếp bất đồng bộ (Service Bus)

**Triển khai Kiến trúc hướng sự kiện**:

1. Thêm Azure Service Bus: `infra/core/servicebus.bicep`
2. Dịch vụ Sản phẩm phát hành sự kiện "ProductCreated"
3. Dịch vụ Đơn hàng đăng ký nhận các sự kiện sản phẩm
4. Thêm Dịch vụ Thông báo để xử lý các sự kiện

**Mẫu**: Yêu cầu/Phản hồi (HTTP) + Hướng sự kiện (Service Bus)

### Giai đoạn 4: Thêm Xác thực Người dùng

**Triển khai Dịch vụ Người dùng**:

1. Tạo `src/user-service/` (Go/Node.js)
2. Thêm Azure AD B2C hoặc xác thực JWT tùy chỉnh
3. API Gateway xác thực token
4. Các dịch vụ kiểm tra quyền của người dùng

### Giai đoạn 5: Sẵn sàng cho sản xuất

**Thêm các thành phần sau**:
- Azure Front Door (cân bằng tải toàn cầu)
- Azure Key Vault (quản lý bí mật)
- Azure Monitor Workbooks (bảng điều khiển tùy chỉnh)
- CI/CD Pipeline (GitHub Actions)
- Triển khai Blue-Green
- Managed Identity cho tất cả dịch vụ

**Chi phí Kiến trúc Sản xuất đầy đủ**: ~ $300-1,400/tháng

---

## Tìm hiểu thêm

### Tài liệu liên quan
- [Tài liệu Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Hướng dẫn Kiến trúc Microservices](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights cho theo dõi phân tán](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Bước tiếp theo trong Khóa học này
- ← Trước: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Ví dụ đơn giản một container cho người mới bắt đầu
- → Tiếp theo: [Hướng dẫn Tích hợp AI](../../../../../examples/docs/ai-foundry) - Thêm khả năng AI
- 🏠 [Trang chính Khóa học](../../README.md)

### So sánh: Khi nào nên dùng cái gì

**Ứng dụng một Container** (ví dụ Simple Flask API):
- ✅ Ứng dụng đơn giản
- ✅ Kiến trúc đơn khối
- ✅ Triển khai nhanh
- ❌ Khả năng mở rộng hạn chế
- **Chi phí**: ~ $15-50/tháng

**Microservices** (Ví dụ này):
- ✅ Ứng dụng phức tạp
- ✅ Mở rộng độc lập theo từng dịch vụ
- ✅ Tính tự chủ của nhóm (dịch vụ khác nhau, nhóm khác nhau)
- ❌ Phức tạp hơn để quản lý
- **Chi phí**: ~ $60-250/tháng

**Kubernetes (AKS)**:
- ✅ Kiểm soát và linh hoạt cao nhất
- ✅ Khả năng di động đa đám mây
- ✅ Mạng nâng cao
- ❌ Yêu cầu chuyên môn về Kubernetes
- **Chi phí**: ~ $150-500/tháng (tối thiểu)

**Khuyến nghị**: Bắt đầu với Container Apps (ví dụ này), chuyển sang AKS chỉ khi bạn cần các tính năng cụ thể của Kubernetes.

---

## Câu hỏi thường gặp

**Q: Tại sao chỉ 2 dịch vụ thay vì 5+?**  
A: Tiến trình giảng dạy. Nắm vững những điều cơ bản (giao tiếp dịch vụ, giám sát, mở rộng) bằng một ví dụ đơn giản trước khi thêm độ phức tạp. Các mẫu bạn học ở đây áp dụng cho kiến trúc 100 dịch vụ.

**Q: Tôi có thể tự thêm nhiều dịch vụ hơn không?**  
A: Chắc chắn! Làm theo hướng dẫn mở rộng ở trên. Mỗi dịch vụ mới theo cùng một mẫu: tạo thư mục src, tạo file Bicep, cập nhật azure.yaml, triển khai.

**Q: Có phải đây đã sẵn sàng cho môi trường sản xuất không?**  
A: Đây là nền tảng vững chắc. Để đưa vào sản xuất, hãy thêm: managed identity, Key Vault, cơ sở dữ liệu bền vững, pipeline CI/CD, cảnh báo giám sát và chiến lược sao lưu.

**Q: Tại sao không sử dụng Dapr hoặc service mesh khác?**  
A: Giữ đơn giản để học. Khi bạn hiểu mạng nội bộ của Container Apps, bạn có thể bổ sung Dapr cho các kịch bản nâng cao.

**Q: Làm sao để gỡ lỗi cục bộ?**  
A: Chạy các dịch vụ cục bộ bằng Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Tôi có thể sử dụng các ngôn ngữ lập trình khác nhau không?**  
A: Có! Ví dụ này dùng Node.js (gateway) + Python (dịch vụ sản phẩm). Bạn có thể pha trộn bất kỳ ngôn ngữ nào chạy trong container.

**Q: Nếu tôi không có tín dụng Azure thì sao?**  
A: Sử dụng gói miễn phí Azure (30 ngày đầu cho tài khoản mới) hoặc triển khai trong thời gian ngắn để kiểm tra và xóa ngay.

---

> **🎓 Tóm tắt lộ trình học**: Bạn đã học cách triển khai kiến trúc đa dịch vụ với tự động mở rộng, mạng nội bộ, giám sát tập trung và các mẫu sẵn sàng cho sản xuất. Nền tảng này chuẩn bị cho bạn để xử lý các hệ thống phân tán phức tạp và kiến trúc microservices doanh nghiệp.

**📚 Điều hướng Khóa học:**
- ← Trước: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Tiếp theo: [Ví dụ Tích hợp CSDL](../../../../../examples/database-app)
- 🏠 [Trang chính Khóa học](../../../README.md)
- 📖 [Thực hành tốt nhất cho Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ gốc của nó nên được coi là nguồn chính thức. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hay diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->