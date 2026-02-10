# Hướng dẫn khắc phục sự cố dành cho AI

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD Dành cho Người mới](../../README.md)
- **📖 Chương hiện tại**: Chương 7 - Khắc phục sự cố & Gỡ lỗi
- **⬅️ Trước**: [Hướng dẫn gỡ lỗi](debugging.md)
- **➡️ Chương tiếp theo**: [Chương 8: Mẫu Sản xuất & Doanh nghiệp](../chapter-08-production/production-ai-practices.md)
- **🤖 Liên quan**: [Chương 2: Phát triển theo hướng AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Trước:** [Production AI Practices](../chapter-08-production/production-ai-practices.md) | **Tiếp theo:** [AZD Cơ bản](../chapter-01-foundation/azd-basics.md)

Hướng dẫn khắc phục sự cố toàn diện này giải quyết các vấn đề phổ biến khi triển khai giải pháp AI với AZD, cung cấp các giải pháp và kỹ thuật gỡ lỗi cụ thể cho các dịch vụ AI của Azure.

## Mục lục

- [Các sự cố dịch vụ Azure OpenAI](../../../../docs/chapter-07-troubleshooting)
- [Vấn đề Azure AI Search](../../../../docs/chapter-07-troubleshooting)
- [Sự cố triển khai Container Apps](../../../../docs/chapter-07-troubleshooting)
- [Lỗi xác thực và quyền](../../../../docs/chapter-07-troubleshooting)
- [Lỗi triển khai mô hình](../../../../docs/chapter-07-troubleshooting)
- [Vấn đề hiệu năng và mở rộng](../../../../docs/chapter-07-troubleshooting)
- [Quản lý chi phí và hạn ngạch](../../../../docs/chapter-07-troubleshooting)
- [Công cụ và kỹ thuật gỡ lỗi](../../../../docs/chapter-07-troubleshooting)

## Các sự cố dịch vụ Azure OpenAI

### Vấn đề: Dịch vụ OpenAI không khả dụng trong khu vực

**Triệu chứng:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Nguyên nhân:**
- Azure OpenAI không có mặt ở khu vực được chọn
- Hạn mức bị sử dụng hết ở các khu vực ưu tiên
- Hạn chế năng lực theo khu vực

**Giải pháp:**

1. **Kiểm tra khả dụng của khu vực:**
```bash
# Liệt kê các vùng khả dụng cho OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Cập nhật cấu hình AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Sử dụng các khu vực thay thế:**
```bicep
// infra/main.bicep - Multi-region fallback
@allowed([
  'eastus2'
  'francecentral'
  'canadaeast'
  'swedencentral'
])
param openAiLocation string = 'eastus2'
```

### Vấn đề: Vượt hạn mức triển khai mô hình

**Triệu chứng:**
```
Error: Deployment failed due to insufficient quota
```

**Giải pháp:**

1. **Kiểm tra hạn mức hiện tại:**
```bash
# Kiểm tra mức sử dụng hạn ngạch
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Yêu cầu tăng hạn mức:**
```bash
# Gửi yêu cầu tăng hạn ngạch
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Tối ưu hóa dung lượng mô hình:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 1  // Start with minimal capacity
  }
}
```

### Vấn đề: Phiên bản API không hợp lệ

**Triệu chứng:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Giải pháp:**

1. **Sử dụng phiên bản API được hỗ trợ:**
```python
# Sử dụng phiên bản mới nhất được hỗ trợ
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Kiểm tra tương thích phiên bản API:**
```bash
# Liệt kê các phiên bản API được hỗ trợ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Vấn đề Azure AI Search

### Vấn đề: Cấp giá dịch vụ Search không đủ

**Triệu chứng:**
```
Error: Semantic search requires Basic tier or higher
```

**Giải pháp:**

1. **Nâng cấp cấp giá:**
```bicep
// infra/main.bicep - Use Basic tier
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
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

2. **Tắt Semantic Search (Môi trường phát triển):**
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

### Vấn đề: Tạo chỉ mục thất bại

**Triệu chứng:**
```
Error: Cannot create index, insufficient permissions
```

**Giải pháp:**

1. **Xác minh khóa dịch vụ Search:**
```bash
# Lấy khóa quản trị của dịch vụ tìm kiếm
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Kiểm tra sơ đồ chỉ mục:**
```python
# Xác thực sơ đồ chỉ mục
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex

def validate_index_schema(index_definition):
    """Validate index schema before creation."""
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **Sử dụng Managed Identity:**
```bicep
// Grant search permissions to managed identity
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: searchService
  name: guid(searchService.id, containerApp.id, searchIndexDataContributorRole)
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')
    principalType: 'ServicePrincipal'
  }
}
```

## Sự cố triển khai Container Apps

### Vấn đề: Xây dựng container thất bại

**Triệu chứng:**
```
Error: Failed to build container image
```

**Giải pháp:**

1. **Kiểm tra cú pháp Dockerfile:**
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

2. **Xác thực các phụ thuộc:**
```txt
# requirements.txt - Pin versions for stability
fastapi==0.104.1
uvicorn==0.24.0
openai==1.3.7
azure-identity==1.14.1
azure-keyvault-secrets==4.7.0
azure-search-documents==11.4.0
azure-cosmos==4.5.1
```

3. **Thêm kiểm tra trạng thái (health check):**
```python
# main.py - Thêm endpoint kiểm tra sức khỏe
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Vấn đề: Container App khởi động thất bại

**Triệu chứng:**
```
Error: Container failed to start within timeout period
```

**Giải pháp:**

1. **Tăng thời gian chờ khởi động:**
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
              type: 'startup'
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

2. **Tối ưu hóa việc tải mô hình:**
```python
# Tải mô hình khi cần để giảm thời gian khởi động
import asyncio
from contextlib import asynccontextmanager

class ModelManager:
    def __init__(self):
        self._client = None
        
    async def get_client(self):
        if self._client is None:
            self._client = await self._initialize_client()
        return self._client
        
    async def _initialize_client(self):
        # Khởi tạo client AI tại đây
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Khởi động
    app.state.model_manager = ModelManager()
    yield
    # Tắt
    pass

app = FastAPI(lifespan=lifespan)
```

## Lỗi xác thực và quyền

### Vấn đề: Managed Identity bị từ chối quyền

**Triệu chứng:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Giải pháp:**

1. **Xác minh gán vai trò:**
```bash
# Kiểm tra các vai trò được gán hiện tại
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Gán các vai trò cần thiết:**
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

3. **Kiểm tra xác thực:**
```python
# Kiểm tra xác thực định danh được quản lý
from azure.identity import DefaultAzureCredential
from azure.core.exceptions import ClientAuthenticationError

async def test_authentication():
    try:
        credential = DefaultAzureCredential()
        token = await credential.get_token("https://cognitiveservices.azure.com/.default")
        print(f"Authentication successful: {token.token[:10]}...")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")
```

### Vấn đề: Truy cập Key Vault bị từ chối

**Triệu chứng:**
```
Error: The user, group or application does not have secrets get permission
```

**Giải pháp:**

1. **Cấp quyền cho Key Vault:**
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

2. **Sử dụng RBAC thay vì Access Policies:**
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

## Lỗi triển khai mô hình

### Vấn đề: Phiên bản mô hình không có sẵn

**Triệu chứng:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Giải pháp:**

1. **Kiểm tra các mô hình khả dụng:**
```bash
# Liệt kê các mô hình có sẵn
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Sử dụng mô hình dự phòng:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4o-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-35-turbo'
  version: '0125'
}

// Try primary model first, fallback if unavailable
resource primaryDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'chat-model'
  properties: {
    model: primaryModel
  }
  sku: {
    name: 'Standard'
    capacity: 10
  }
}
```

3. **Xác thực mô hình trước khi triển khai:**
```python
# Xác thực mô hình trước khi triển khai
import httpx

async def validate_model_availability(model_name: str, version: str) -> bool:
    """Check if model is available before deployment."""
    try:
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/models",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            models = response.json()
            return any(
                model["id"] == f"{model_name}-{version}"
                for model in models.get("data", [])
            )
    except Exception:
        return False
```

## Vấn đề hiệu năng và mở rộng

### Vấn đề: Độ trễ cao khi phản hồi

**Triệu chứng:**
- Thời gian phản hồi > 30 giây
- Lỗi hết thời gian chờ
- Trải nghiệm người dùng kém

**Giải pháp:**

1. **Thiết lập thời gian chờ cho yêu cầu:**
```python
# Cấu hình thời gian chờ phù hợp
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

2. **Thêm bộ nhớ đệm phản hồi:**
```python
# Bộ nhớ đệm Redis cho các phản hồi
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

3. **Cấu hình tự động mở rộng:**
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

### Vấn đề: Lỗi hết bộ nhớ

**Triệu chứng:**
```
Error: Container killed due to memory limit exceeded
```

**Giải pháp:**

1. **Tăng cấp phát bộ nhớ:**
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

2. **Tối ưu hóa sử dụng bộ nhớ:**
```python
# Xử lý mô hình tiết kiệm bộ nhớ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Kiểm tra mức sử dụng bộ nhớ trước khi xử lý
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Buộc thu gom rác
            
        result = await self._process_ai_request(request)
        
        # Dọn dẹp sau khi xử lý
        gc.collect()
        return result
```

## Quản lý chi phí và hạn ngạch

### Vấn đề: Chi phí cao bất ngờ

**Triệu chứng:**
- Hóa đơn Azure cao hơn mong đợi
- Sử dụng token vượt quá ước tính
- Cảnh báo ngân sách được kích hoạt

**Giải pháp:**

1. **Thực hiện kiểm soát chi phí:**
```python
# Theo dõi sử dụng token
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

2. **Thiết lập cảnh báo chi phí:**
```bicep
resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500  // $500 monthly limit
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['admin@company.com']
        contactRoles: ['Owner']
      }
    }
  }
}
```

3. **Tối ưu lựa chọn mô hình:**
```python
# Lựa chọn mô hình theo chi phí
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # cho mỗi 1K token
    'gpt-4': 0.03,          # cho mỗi 1K token
    'gpt-35-turbo': 0.0015  # cho mỗi 1K token
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4o-mini'
    elif complexity == 'medium':
        return 'gpt-35-turbo'
    else:
        return 'gpt-4'
```

## Công cụ và kỹ thuật gỡ lỗi

### Các lệnh gỡ lỗi AZD

```bash
# Bật ghi nhật ký chi tiết
azd up --debug

# Kiểm tra trạng thái triển khai
azd show

# Xem nhật ký ứng dụng (mở bảng điều khiển giám sát)
azd monitor --logs

# Xem số liệu thời gian thực
azd monitor --live

# Kiểm tra biến môi trường
azd env get-values
```

### Gỡ lỗi ứng dụng

1. **Ghi nhật ký có cấu trúc:**
```python
import logging
import json

# Cấu hình ghi nhật ký có cấu trúc cho các ứng dụng AI
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

2. **Các endpoint kiểm tra sức khỏe:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Kiểm tra kết nối OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Kiểm tra dịch vụ tìm kiếm
    try:
        search_client = SearchIndexClient(
            endpoint=AZURE_SEARCH_ENDPOINT,
            credential=DefaultAzureCredential()
        )
        indexes = await search_client.list_index_names()
        checks['search'] = {'status': 'healthy', 'indexes': list(indexes)}
    except Exception as e:
        checks['search'] = {'status': 'unhealthy', 'error': str(e)}
    
    return checks
```

3. **Giám sát hiệu năng:**
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

## Mã lỗi phổ biến và giải pháp

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | Không được ủy quyền | Kiểm tra khóa API và cấu hình managed identity |
| 403 | Bị cấm | Xác minh gán vai trò RBAC |
| 429 | Bị giới hạn tốc độ | Thực hiện logic thử lại với khoảng lùi mũ |
| 500 | Lỗi máy chủ nội bộ | Kiểm tra trạng thái triển khai mô hình và nhật ký |
| 503 | Dịch vụ không khả dụng | Xác minh tình trạng dịch vụ và khả dụng theo khu vực |

## Bước tiếp theo

1. **Xem lại [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** để biết các thực hành tốt nhất khi triển khai
2. **Hoàn thành [Production AI Practices](../chapter-08-production/production-ai-practices.md)** để có các giải pháp sẵn sàng cho doanh nghiệp
3. **Tham gia [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** để được hỗ trợ cộng đồng
4. **Báo cáo sự cố** đến [kho lưu trữ AZD trên GitHub](https://github.com/Azure/azure-dev) cho các vấn đề liên quan đến AZD

## Tài nguyên

- [Khắc phục sự cố dịch vụ Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Khắc phục sự cố Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Khắc phục sự cố Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD Dành cho Người mới](../../README.md)
- **📖 Chương hiện tại**: Chương 7 - Khắc phục sự cố & Gỡ lỗi
- **⬅️ Trước**: [Hướng dẫn gỡ lỗi](debugging.md)
- **➡️ Chương tiếp theo**: [Chương 8: Mẫu Sản xuất & Doanh nghiệp](../chapter-08-production/production-ai-practices.md)
- **🤖 Liên quan**: [Chương 2: Phát triển theo hướng AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Khắc phục sự cố Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn chính thức. Đối với những thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm đối với bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->