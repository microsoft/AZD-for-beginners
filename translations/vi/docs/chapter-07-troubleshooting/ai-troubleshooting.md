# Hướng Dẫn Khắc Phục Sự Cố Cụ Thể Cho AI

**Điều Hướng Chương:**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 7 - Khắc Phục Sự Cố & Gỡ Lỗi
- **⬅️ Trước**: [Hướng Dẫn Gỡ Lỗi](debugging.md)
- **➡️ Chương Tiếp Theo**: [Chương 8: Mẫu Quy Trình Sản Xuất & Doanh Nghiệp](../chapter-08-production/production-ai-practices.md)
- **🤖 Liên Quan**: [Chương 2: Phát Triển AI Là Ưu Tiên](../chapter-02-ai-development/microsoft-foundry-integration.md)

Hướng dẫn khắc phục sự cố toàn diện này giải quyết các vấn đề thường gặp khi triển khai các giải pháp AI với AZD, cung cấp các giải pháp và kỹ thuật gỡ lỗi đặc thù cho dịch vụ Azure AI.

> **Phạm vi:** Các lệnh sử dụng tên tài nguyên ví dụ; hãy thay thế và chọn đăng ký đúng. Các khối Bicep là mảnh ghép để hợp nhất vào mẫu hiện có, không phải để triển khai độc lập. Các đoạn mã Python yêu cầu SDK và cấu hình ứng dụng đã nêu. Không có triển khai Azure trực tiếp nào được thực hiện cho đánh giá này.

## Mục Lục

- [Vấn Đề Dịch Vụ Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Vấn Đề Azure AI Search](#azure-ai-search-problems)
- [Vấn Đề Triển Khai Container Apps](#container-apps-deployment-issues)
- [Lỗi Xác Thực và Quyền Truy Cập](#authentication-and-permission-errors)
- [Lỗi Triển Khai Mô Hình](#model-deployment-failures)
- [Vấn Đề Hiệu Năng và Mở Rộng](#performance-and-scaling-issues)
- [Quản Lý Chi Phí và Hạn Mức](#cost-and-quota-management)
- [Công Cụ và Kỹ Thuật Gỡ Lỗi](#debugging-tools-and-techniques)

## Vấn Đề Dịch Vụ Microsoft Foundry Models

### Vấn Đề: Dịch Vụ OpenAI Không Có Sẵn Ở Vùng

**Triệu Chứng:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Nguyên Nhân:**
- Microsoft Foundry Models không khả dụng ở vùng được chọn
- Hạn mức đã dùng hết ở vùng ưu tiên
- Hạn chế về năng lực vùng

**Giải Pháp:**

1. **Kiểm Tra Khả Dụng Vùng:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Cập Nhật Cấu Hình AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Sử Dụng Vùng Thay Thế:**
```bicep
// infra/main.bicep - Explicit location selection, NOT automatic fallback
@allowed([
  'eastus2'
  'francecentral'
  'canadaeast'
  'swedencentral'
])
param openAiLocation string = 'eastus2'
```

### Vấn Đề: Hạn Mức Triển Khai Mô Hình Bị Vượt Quá

**Triệu Chứng:**
```
Error: Deployment failed due to insufficient quota
```

**Giải Pháp:**

1. **Kiểm Tra Hạn Mức Hiện Tại:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Yêu Cầu Tăng Hạn Mức:**
Sử dụng quy trình quản lý hạn mức trên cổng Foundry cho đăng ký, vùng, mô hình và loại triển khai bị ảnh hưởng. Xem [hướng dẫn hạn mức chính thức](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Yêu cầu giới hạn VM không làm tăng hạn mức mô hình.

3. **Tối Ưu Dung Lượng Mô Hình:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi // Existing account resource declared in your template
  name: 'chat-model'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'GlobalStandard' // Verify this model/version/type in the target region
    capacity: 1  // Capacity units are model/deployment-type specific
  }
}
```

### Vấn Đề: Phiên Bản API Không Hợp Lệ

**Triệu Chứng:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Giải Pháp:**

1. **Sử Dụng Phiên Bản API Hỗ Trợ:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Kiểm Tra Tương Thích Phiên Bản API:**
Kiểm tra [tham khảo vòng đời API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Phiên bản API của nhà cung cấp tài nguyên ARM **không** liệt kê phiên bản API của inference/data-plane. Khách hàng mới v1 dùng `/openai/v1/` mà không có `api-version` đánh ngày; không trộn hai cấu hình khách hàng này.

## Vấn Đề Azure AI Search

### Vấn Đề: Cấp Giá Dịch Vụ Tìm Kiếm Không Đủ

**Triệu Chứng:**
```
Error: Semantic search requires Basic tier or higher
```

**Giải Pháp:**

1. **Sử Dụng Cấp Giá Hỗ Trợ:**

Semantic ranker yêu cầu Basic hoặc cao hơn. Việc chuyển từ Free/Basic sang cấp khác có thể yêu cầu tạo dịch vụ tìm kiếm mới và xây dựng lại chỉ mục; chỉnh sửa SKU không đảm bảo nâng cấp tại chỗ.
```bicep
// infra/main.bicep - Use Basic tier
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  location: location
  sku: {
    name: 'basic'  // Minimum for semantic search
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
    semanticSearch: 'standard'
  }
}
```

2. **Tắt Semantic Search (Phát Triển):**
```bicep
// For development environments
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  sku: {
    name: 'free'
  }
  properties: {
    semanticSearch: 'disabled'
  }
}
```

### Vấn Đề: Lỗi Tạo Chỉ Mục

**Triệu Chứng:**
```
Error: Cannot create index, insufficient permissions
```

**Giải Pháp:**

1. **Xác Minh Khóa Dịch Vụ Tìm Kiếm:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Kiểm Tra Lược Đồ Chỉ Mục:**
```python
# Validate index schema
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex

def validate_index_schema(index_definition):
    """Validate index schema before creation."""
    # These are this application's requirements, not universal Search fields.
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **Sử Dụng Managed Identity:**
```bicep
// Grant index-definition management permissions to the managed identity.
// Search Index Data Contributor manages documents, not index definitions.
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: searchService
  name: guid(searchService.id, containerApp.id, 'Search Service Contributor')
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '7ca78c08-252a-4471-8644-bb5ff32d4ba0')
    principalType: 'ServicePrincipal'
  }
}
```

## Vấn Đề Triển Khai Container Apps

### Vấn Đề: Lỗi Xây Dựng Container

**Triệu Chứng:**
```
Error: Failed to build container image
```

**Giải Pháp:**

1. **Kiểm Tra Cú Pháp Dockerfile:**
```dockerfile
# Dockerfile - Python AI app example
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

2. **Xác Thực Các Phụ Thuộc:**
```txt
# Dependency names for these snippets. Resolve supported versions in your
# project's environment, test together, then commit a lock/pinned requirements file.
fastapi
uvicorn
openai
azure-identity
azure-keyvault-secrets
azure-search-documents
azure-cosmos
```

3. **Thêm Kiểm Tra Sức Khỏe:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Vấn Đề: Lỗi Khởi Động Container App

**Triệu Chứng:**
```
Error: Container failed to start within timeout period
```

**Giải Pháp:**

1. **Tăng Thời Gian Chờ Khởi Động:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      containers: [
        {
          name: 'main'
          image: containerImage
          resources: {
            cpu: json('0.5')
            memory: '1Gi'
          }
          probes: [
            {
              type: 'Startup'
              httpGet: {
                path: '/health'
                port: 8000
              }
              initialDelaySeconds: 30
              periodSeconds: 10
              timeoutSeconds: 5
              failureThreshold: 10  // Allow more time for AI models to load
            }
          ]
        }
      ]
    }
  }
}
```

2. **Tối Ưu Tải Mô Hình:**
```python
# Lazy load models to reduce startup time
# Illustrative skeleton: implement _initialize_client and synchronize concurrent
# initialization before using this pattern in an application.
import asyncio
from contextlib import asynccontextmanager
from fastapi import FastAPI

class ModelManager:
    def __init__(self):
        self._client = None
        
    async def get_client(self):
        if self._client is None:
            self._client = await self._initialize_client()
        return self._client
        
    async def _initialize_client(self):
        # Initialize AI client here
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup
    app.state.model_manager = ModelManager()
    yield
    # Shutdown
    pass

app = FastAPI(lifespan=lifespan)
```

## Lỗi Xác Thực và Quyền Truy Cập

### Vấn Đề: Managed Identity Bị Từ Chối Quyền

**Triệu Chứng:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Giải Pháp:**

1. **Xác Minh Phân Quyền Vai Trò:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Phân Công Vai Trò Cần Thiết:**
```bicep
// Required role assignments for AI services
var cognitiveServicesOpenAIUserRole = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
var searchIndexDataContributorRole = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')

resource openAiRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAi
  name: guid(openAi.id, containerApp.id, cognitiveServicesOpenAIUserRole)
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: cognitiveServicesOpenAIUserRole
    principalType: 'ServicePrincipal'
  }
}
```

3. **Kiểm Tra Xác Thực:**
```python
# Test managed identity authentication
from azure.identity import DefaultAzureCredential
from azure.core.exceptions import ClientAuthenticationError

def test_authentication():
    try:
        with DefaultAzureCredential() as credential:
            token = credential.get_token("https://cognitiveservices.azure.com/.default")
            print(f"Token acquired; expires at Unix time {token.expires_on}")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")

test_authentication()
```

Việc lấy token chứng minh xác thực, không phải quyền gọi mô hình. Kiểm tra thao tác dự kiến riêng. Cục bộ, `DefaultAzureCredential` có thể dùng thông tin đăng nhập nhà phát triển; trên Azure, xác minh managed identity mong muốn được chọn.

### Vấn Đề: Truy Cập Key Vault Bị Từ Chối

**Triệu Chứng:**
```
Error: The user, group or application does not have secrets get permission
```

**Giải Pháp:**

1. **Cấp Quyền Key Vault:**

Chỉ dùng đoạn chính sách truy cập sau cho vault dùng `enableRbacAuthorization: false`. Với vault bật RBAC, dùng tùy chọn 2; thêm chính sách truy cập không cấp quyền quản lý dữ liệu trong chế độ RBAC.
```bicep
resource keyVaultAccessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2023-07-01' = {
  parent: keyVault
  name: 'add'
  properties: {
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: containerApp.identity.principalId
        permissions: {
          secrets: ['get', 'list']
        }
      }
    ]
  }
}
```

2. **Dùng RBAC Thay Vì Chính Sách Truy Cập:**

Vault phải có `enableRbacAuthorization: true`; thay đổi mô hình quyền yêu cầu kế hoạch di chuyển quyền truy cập hiện có.
```bicep
resource keyVaultSecretsUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: keyVault
  name: guid(keyVault.id, containerApp.id, 'Key Vault Secrets User')
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
    principalType: 'ServicePrincipal'
  }
}
```

## Lỗi Triển Khai Mô Hình

### Vấn Đề: Phiên Bản Mô Hình Không Có Sẵn

**Triệu Chứng:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Giải Pháp:**

1. **Kiểm Tra Các Mô Hình Có Sẵn:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Chọn Rõ Ràng Mô Hình Có Sẵn:**
```bicep
// Example model selection; verify version and deployment type in the catalog.
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2025-04-14'
}

// Bicep does not catch provisioning failures and retry a fallback model.
resource primaryDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'chat-model'
  properties: {
    model: {
      format: 'OpenAI'
      name: primaryModel.name
      version: primaryModel.version
    }
  }
  sku: {
    name: 'GlobalStandard'
    capacity: 10
  }
}
```

3. **Xác Thực Mô Hình Trước Khi Triển Khai:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Vấn Đề Hiệu Năng và Mở Rộng

### Vấn Đề: Phản Hồi Trễ Cao

**Triệu Chứng:**
- Thời gian phản hồi > 30 giây
- Lỗi timeout
- Trải nghiệm người dùng kém

**Giải Pháp:**

1. **Áp Dụng Thời Gian Chờ Yêu Cầu:**
```python
# Configure proper timeouts
import httpx

client = httpx.AsyncClient(
    timeout=httpx.Timeout(
        connect=5.0,
        read=30.0,
        write=10.0,
        pool=10.0
    )
)
```

2. **Thêm Bộ Nhớ Đệm Phản Hồi:**
```python
# Redis cache for responses
import redis.asyncio as redis
import json

class ResponseCache:
    def __init__(self, redis_url: str):
        self.redis = redis.from_url(redis_url)
        
    async def get_cached_response(self, query_hash: str) -> str | None:
        """Get cached response if available."""
        cached = await self.redis.get(f"ai_response:{query_hash}")
        return cached.decode() if cached else None
        
    async def cache_response(self, query_hash: str, response: str, ttl: int = 3600):
        """Cache AI response with TTL."""
        await self.redis.setex(f"ai_response:{query_hash}", ttl, response)
```

3. **Cấu Hình Tự Động Mở Rộng:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      scale: {
        minReplicas: 2
        maxReplicas: 20
        rules: [
          {
            name: 'http-requests'
            http: {
              metadata: {
                concurrentRequests: '5'  // Scale aggressively for AI workloads
              }
            }
          }
          {
            name: 'cpu-utilization'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '60'  // Lower threshold for AI apps
              }
            }
          }
        ]
      }
    }
  }
}
```

### Vấn Đề: Lỗi Hết Bộ Nhớ

**Triệu Chứng:**
```
Error: Container killed due to memory limit exceeded
```

**Giải Pháp:**

1. **Tăng Dung Lượng Bộ Nhớ:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      containers: [
        {
          name: 'main'
          resources: {
            cpu: json('1.0')
            memory: '2Gi'  // Increase for AI workloads
          }
        }
      ]
    }
  }
}
```

2. **Tối Ưu Sử Dụng Bộ Nhớ:**
```python
# Memory-efficient model handling
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def _process_ai_request(self, request):
        raise NotImplementedError("Supply the application's AI operation")

    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Check memory usage before processing
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Force garbage collection
            
        result = await self._process_ai_request(request)
        
        # Clean up after processing
        gc.collect()
        return result
```

## Quản Lý Chi Phí và Hạn Mức

### Vấn Đề: Chi Phí Cao Bất Thường

**Triệu Chứng:**
- Hoá đơn Azure cao hơn dự kiến
- Sử dụng token vượt ước tính
- Cảnh báo vượt ngân sách xuất hiện

**Giải Pháp:**

1. **Triển Khai Kiểm Soát Chi Phí:**
```python
# Token usage tracking
class TokenTracker:
    def __init__(self, monthly_limit: int = 100000):
        self.monthly_limit = monthly_limit
        self.current_usage = 0
        
    async def track_usage(self, prompt_tokens: int, completion_tokens: int):
        """Track token usage with limits."""
        total_tokens = prompt_tokens + completion_tokens
        self.current_usage += total_tokens
        
        if self.current_usage > self.monthly_limit:
            raise Exception("Monthly token limit exceeded")
            
        return total_tokens
```

Bộ đếm trong bộ nhớ này chỉ mang tính minh họa, không phải kiểm soát chi tiêu hàng tháng: nó đặt lại khi khởi động lại, không chia sẻ giữa các bản sao, và chỉ kiểm tra sau gọi. Giới hạn thực sự cần kế toán bền vững, đặt trước yêu cầu an toàn đồng thời và chính sách đặt lại hàng tháng. Chỉ số bộ nhớ container cũng phải tính đến giới hạn cgroup; `psutil.virtual_memory()` không phải phép đo giới hạn container tin cậy, và thu gom rác không thực thi giới hạn bộ nhớ.

2. **Thiết Lập Cảnh Báo Chi Phí:**
```bicep
resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate // Parameter: first day of a supported budget period
      endDate: budgetEndDate     // Parameter: a future date
    }
    timeGrain: 'Monthly'
    amount: 500  // Notification threshold in the subscription's billing currency
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        thresholdType: 'Actual'
        contactEmails: ['admin@company.com']
        contactRoles: ['Owner']
      }
    }
  }
}
```

Khai báo `budgetStartDate` và `budgetEndDate` trong mẫu của bạn. Ngân sách thông báo; không dừng tài nguyên hoặc áp giới hạn chi tiêu cứng.

3. **Tối Ưu Việc Chọn Mô Hình:**
```python
# Cost-aware model selection
MODEL_COST_TIERS = {
  'gpt-4.1-mini': 'low',
  'gpt-4.1': 'high'
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4.1-mini'
    else:
        return 'gpt-4.1'
```

## Công Cụ và Kỹ Thuật Gỡ Lỗi

### Lệnh Gỡ Lỗi AZD

```bash
# Enable verbose logging
azd up --debug

# Check deployment status
azd show

# View application logs (opens monitoring dashboard)
azd monitor --logs

# View live metrics
azd monitor --live

# Check environment variables
azd env get-values
```

### Lệnh AZD AI Extension Cho Chẩn Đoán

Nếu bạn triển khai agents dùng `azd ai agent init`, các công cụ bổ sung này có sẵn:

```bash
# Ensure the agents extension is installed
azd extension install azure.ai.agents

# Check project storage permissions and agent configuration
azd ai agent doctor

# Inspect the deployed endpoint
azd ai agent endpoint show

# Use the MCP server to let AI tools query project state
azd mcp start

# Generate infrastructure files for review and audit
azd infra generate
```

> **Mẹo:** Dùng `azd infra generate` để ghi IaC ra đĩa để bạn có thể kiểm tra chính xác tài nguyên nào đã được cung cấp. Điều này vô cùng quý giá khi gỡ lỗi lỗi cấu hình tài nguyên. Xem [tham khảo CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) để biết chi tiết.

**Chẩn đoán nhận biết phiên bản (2026-11-04):** Agents `1.0.0-beta.23` yêu cầu `azd >= 1.37.0`; nâng cấp CLI lõi trước các extension không tương thích. Phiên bản agent này giữ cảnh báo RBAC nhà phát triển trong đầu ra triển khai cuối cùng và xác định phiên bản liên quan khi kích hoạt thất bại/timeout. Timeout không chứng minh triển khai thất bại: kiểm tra phiên bản đã thử trước khi thử lại. Nó cũng sửa lỗi gọi A2A 0.3 hiển thị tin nhắn vòng đời thay vì câu trả lời hoàn tất. Core `azd 1.37.1` sửa lỗi lan truyền huỷ bỏ qua các extension; `1.37.2` cải thiện xác nhận cung cấp quan trọng và xử lý hủy.

Nếu lệnh đánh giá của hướng dẫn cũ chỉ in hướng dẫn di chuyển, hãy cài `azure.ai.evaluations` (`1.0.0-beta.2` yêu cầu `azd >= 1.33.0`) và dùng `azd ai eval init`, `generate`, và `run start`. Tối ưu hoá của `--config` không còn chấp nhận file đánh giá cũ. Xem [di chuyển đánh giá](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) và [di chuyển tối ưu hoá](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Gỡ Lỗi Ứng Dụng

1. **Ghi Nhật Ký Có Cấu Trúc:**
```python
import logging
import json

# Configure structured logging for AI applications
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

logger = logging.getLogger(__name__)

def log_ai_request(model: str, tokens: int, latency: float, success: bool):
    """Log AI request details."""
    logger.info(json.dumps({
        'event': 'ai_request',
        'model': model,
        'tokens': tokens,
        'latency_ms': latency,
        'success': success
    }))
```

2. **Điểm Kiểm Tra Sức Khỏe:**
```python
# Integration fragment: add to an existing FastAPI app, protect this diagnostic
# endpoint, and configure AZURE_SEARCH_ENDPOINT. This tests Search index-list
# authorization, not Azure OpenAI inference.
import os
from azure.identity.aio import DefaultAzureCredential
from azure.search.documents.indexes.aio import SearchIndexClient
from fastapi import Response

@app.get("/debug/health")
async def detailed_health_check(response: Response):
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Check Search service
    try:
        async with DefaultAzureCredential() as credential:
            async with SearchIndexClient(
                endpoint=os.environ['AZURE_SEARCH_ENDPOINT'],
                credential=credential
            ) as search_client:
                # AsyncItemPaged is iterated asynchronously, not awaited as a list.
                async for _ in search_client.list_index_names():
                    break
        checks['search'] = {'status': 'healthy'}
    except Exception:
        response.status_code = 503
        checks['search'] = {'status': 'unhealthy'}
    
    return checks
```

3. **Giám Sát Hiệu Năng:**
```python
import time
from functools import wraps

def monitor_performance(func):
    """Decorator to monitor function performance."""
    @wraps(func)
    async def wrapper(*args, **kwargs):
        start_time = time.time()
        try:
            result = await func(*args, **kwargs)
            success = True
        except Exception as e:
            result = None
            success = False
            raise
        finally:
            end_time = time.time()
            latency = (end_time - start_time) * 1000
            
            logger.info(json.dumps({
                'function': func.__name__,
                'latency_ms': latency,
                'success': success
            }))
        
        return result
    return wrapper
```

## Các Mã Lỗi Phổ Biến và Giải Pháp

| Mã Lỗi | Mô Tả | Giải Pháp |
|------------|-------------|----------|
| 401 | Không Có Quyền | Kiểm tra khoá API và cấu hình managed identity |
| 403 | Bị Cấm | Xác minh phân công vai trò RBAC |
| 429 | Giới Hạn Tốc Độ | Triển khai logic thử lại với lùi thời gian theo hàm mũ |
| 500 | Lỗi Máy Chủ Nội Bộ | Kiểm tra trạng thái triển khai mô hình và nhật ký |
| 503 | Dịch Vụ Không Có Sẵn | Kiểm tra tình trạng dịch vụ và khả dụng vùng |

## Bước Tiếp Theo

1. **Xem lại [Hướng Dẫn Triển Khai Mô Hình AI](../chapter-02-ai-development/ai-model-deployment.md)** cho thực hành tốt nhất triển khai
2. **Hoàn Thành [Thực Hành AI Trong Sản Xuất](../chapter-08-production/production-ai-practices.md)** cho giải pháp sẵn sàng doanh nghiệp
3. **Tham Gia [Discord Microsoft Foundry](https://aka.ms/foundry/discord)** để được hỗ trợ cộng đồng
4. **Gửi báo cáo sự cố** tới [kho AZD trên GitHub](https://github.com/Azure/azure-dev) cho các vấn đề liên quan đến AZD

## Tài Nguyên

- [Khắc Phục Sự Cố Hạn Mức và Giới Hạn Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Khắc Phục Sự Cố Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Khắc Phục Sự Cố Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Kỹ Năng Gỡ Lỗi Azure Diagnostics Agent**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Cài kỹ năng khắc phục sự cố Azure trong trình soạn thảo của bạn: `npx skills add microsoft/github-copilot-for-azure`

---

**Điều Hướng Chương:**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 7 - Khắc Phục Sự Cố & Gỡ Lỗi
- **⬅️ Trước**: [Hướng Dẫn Gỡ Lỗi](debugging.md)
- **➡️ Chương Tiếp Theo**: [Chương 8: Mẫu Quy Trình Sản Xuất & Doanh Nghiệp](../chapter-08-production/production-ai-practices.md)
- **🤖 Liên Quan**: [Chương 2: Phát Triển AI Là Ưu Tiên](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Tham Khảo**: [Khắc Phục Sự Cố Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->