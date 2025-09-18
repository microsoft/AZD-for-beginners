<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c8ab8fd8ed338b3ec17484b453dcda68",
  "translation_date": "2025-09-18T07:42:03+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "vi"
}
-->
# Hướng Dẫn Khắc Phục Sự Cố Dành Riêng Cho AI

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện Tại**: Chương 7 - Khắc Phục Sự Cố & Gỡ Lỗi
- **⬅️ Trước**: [Hướng Dẫn Gỡ Lỗi](debugging.md)
- **➡️ Chương Tiếp Theo**: [Chương 8: Mô Hình Sản Xuất & Doanh Nghiệp](../ai-foundry/production-ai-practices.md)
- **🤖 Liên Quan**: [Chương 2: Phát Triển AI-First](../ai-foundry/azure-ai-foundry-integration.md)

**Trước:** [Mô Hình AI Sản Xuất](../ai-foundry/production-ai-practices.md) | **Tiếp Theo:** [Bắt Đầu Với AZD](../getting-started/README.md)

Hướng dẫn khắc phục sự cố toàn diện này giải quyết các vấn đề phổ biến khi triển khai giải pháp AI với AZD, cung cấp các giải pháp và kỹ thuật gỡ lỗi dành riêng cho dịch vụ Azure AI.

## Mục Lục

- [Vấn Đề Dịch Vụ Azure OpenAI](../../../../docs/troubleshooting)
- [Vấn Đề Tìm Kiếm Azure AI](../../../../docs/troubleshooting)
- [Vấn Đề Triển Khai Ứng Dụng Container](../../../../docs/troubleshooting)
- [Lỗi Xác Thực và Quyền](../../../../docs/troubleshooting)
- [Thất Bại Triển Khai Mô Hình](../../../../docs/troubleshooting)
- [Vấn Đề Hiệu Suất và Mở Rộng](../../../../docs/troubleshooting)
- [Quản Lý Chi Phí và Hạn Ngạch](../../../../docs/troubleshooting)
- [Công Cụ và Kỹ Thuật Gỡ Lỗi](../../../../docs/troubleshooting)

## Vấn Đề Dịch Vụ Azure OpenAI

### Vấn Đề: Dịch Vụ OpenAI Không Có Sẵn Trong Khu Vực

**Triệu Chứng:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Nguyên Nhân:**
- Azure OpenAI không có sẵn trong khu vực đã chọn
- Hạn ngạch bị hết trong các khu vực ưu tiên
- Giới hạn năng lực khu vực

**Giải Pháp:**

1. **Kiểm Tra Khả Dụng Khu Vực:**
```bash
# List available regions for OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Cập Nhật Cấu Hình AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Sử Dụng Khu Vực Thay Thế:**
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

### Vấn Đề: Vượt Quá Hạn Ngạch Triển Khai Mô Hình

**Triệu Chứng:**
```
Error: Deployment failed due to insufficient quota
```

**Giải Pháp:**

1. **Kiểm Tra Hạn Ngạch Hiện Tại:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Yêu Cầu Tăng Hạn Ngạch:**
```bash
# Submit quota increase request
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Tối Ưu Hóa Năng Lực Mô Hình:**
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

### Vấn Đề: Phiên Bản API Không Hợp Lệ

**Triệu Chứng:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Giải Pháp:**

1. **Sử Dụng Phiên Bản API Được Hỗ Trợ:**
```python
# Use latest supported version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Kiểm Tra Tương Thích Phiên Bản API:**
```bash
# List supported API versions
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Vấn Đề Tìm Kiếm Azure AI

### Vấn Đề: Cấp Giá Dịch Vụ Tìm Kiếm Không Đủ

**Triệu Chứng:**
```
Error: Semantic search requires Basic tier or higher
```

**Giải Pháp:**

1. **Nâng Cấp Cấp Giá:**
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

2. **Tắt Tìm Kiếm Ngữ Nghĩa (Phát Triển):**
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

### Vấn Đề: Thất Bại Tạo Chỉ Mục

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
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **Sử Dụng Danh Tính Quản Lý:**
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

## Vấn Đề Triển Khai Ứng Dụng Container

### Vấn Đề: Thất Bại Xây Dựng Container

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

2. **Xác Minh Phụ Thuộc:**
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

3. **Thêm Kiểm Tra Sức Khỏe:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Vấn Đề: Thất Bại Khởi Động Ứng Dụng Container

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

2. **Tối Ưu Hóa Tải Mô Hình:**
```python
# Lazy load models to reduce startup time
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

## Lỗi Xác Thực và Quyền

### Vấn Đề: Quyền Danh Tính Quản Lý Bị Từ Chối

**Triệu Chứng:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Giải Pháp:**

1. **Xác Minh Phân Quyền Vai Trò:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Gán Vai Trò Cần Thiết:**
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

async def test_authentication():
    try:
        credential = DefaultAzureCredential()
        token = await credential.get_token("https://cognitiveservices.azure.com/.default")
        print(f"Authentication successful: {token.token[:10]}...")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")
```

### Vấn Đề: Truy Cập Key Vault Bị Từ Chối

**Triệu Chứng:**
```
Error: The user, group or application does not have secrets get permission
```

**Giải Pháp:**

1. **Cấp Quyền Key Vault:**
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

2. **Sử Dụng RBAC Thay Vì Chính Sách Truy Cập:**
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

## Thất Bại Triển Khai Mô Hình

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
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Sử Dụng Mô Hình Dự Phòng:**
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

3. **Xác Minh Mô Hình Trước Khi Triển Khai:**
```python
# Pre-deployment model validation
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

## Vấn Đề Hiệu Suất và Mở Rộng

### Vấn Đề: Phản Hồi Độ Trễ Cao

**Triệu Chứng:**
- Thời gian phản hồi > 30 giây
- Lỗi hết thời gian chờ
- Trải nghiệm người dùng kém

**Giải Pháp:**

1. **Thực Hiện Thời Gian Chờ Yêu Cầu:**
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

1. **Tăng Phân Bổ Bộ Nhớ:**
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

2. **Tối Ưu Hóa Sử Dụng Bộ Nhớ:**
```python
# Memory-efficient model handling
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
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

## Quản Lý Chi Phí và Hạn Ngạch

### Vấn Đề: Chi Phí Cao Không Mong Đợi

**Triệu Chứng:**
- Hóa đơn Azure cao hơn dự kiến
- Sử dụng token vượt quá ước tính
- Cảnh báo ngân sách được kích hoạt

**Giải Pháp:**

1. **Thực Hiện Kiểm Soát Chi Phí:**
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

2. **Thiết Lập Cảnh Báo Chi Phí:**
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

3. **Tối Ưu Hóa Lựa Chọn Mô Hình:**
```python
# Cost-aware model selection
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # per 1K tokens
    'gpt-4': 0.03,          # per 1K tokens
    'gpt-35-turbo': 0.0015  # per 1K tokens
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

## Công Cụ và Kỹ Thuật Gỡ Lỗi

### Lệnh Gỡ Lỗi AZD

```bash
# Enable verbose logging
azd up --debug

# Check deployment status
azd show

# View deployment logs
azd logs --follow

# Check environment variables
azd env get-values
```

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

2. **Điểm Kết Thúc Kiểm Tra Sức Khỏe:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Check OpenAI connectivity
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Check Search service
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

3. **Giám Sát Hiệu Suất:**
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

## Mã Lỗi Phổ Biến và Giải Pháp

| Mã Lỗi | Mô Tả | Giải Pháp |
|--------|-------|-----------|
| 401 | Không Được Phép | Kiểm tra khóa API và cấu hình danh tính quản lý |
| 403 | Bị Cấm | Xác minh phân quyền vai trò RBAC |
| 429 | Bị Giới Hạn Tốc Độ | Thực hiện logic thử lại với backoff lũy thừa |
| 500 | Lỗi Máy Chủ Nội Bộ | Kiểm tra trạng thái triển khai mô hình và nhật ký |
| 503 | Dịch Vụ Không Có Sẵn | Xác minh sức khỏe dịch vụ và khả dụng khu vực |

## Bước Tiếp Theo

1. **Xem lại [Hướng Dẫn Triển Khai Mô Hình AI](ai-model-deployment.md)** để biết các thực hành triển khai tốt nhất
2. **Hoàn Thành [Mô Hình AI Sản Xuất](production-ai-practices.md)** để có giải pháp sẵn sàng cho doanh nghiệp
3. **Tham Gia [Discord Azure AI Foundry](https://aka.ms/foundry/discord)** để nhận hỗ trợ từ cộng đồng
4. **Gửi vấn đề** đến [Kho GitHub AZD](https://github.com/Azure/azure-dev) cho các vấn đề cụ thể về AZD

## Tài Nguyên

- [Khắc Phục Sự Cố Dịch Vụ Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Khắc Phục Sự Cố Ứng Dụng Container](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Khắc Phục Sự Cố Tìm Kiếm Azure AI](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện Tại**: Chương 7 - Khắc Phục Sự Cố & Gỡ Lỗi
- **⬅️ Trước**: [Hướng Dẫn Gỡ Lỗi](debugging.md)
- **➡️ Chương Tiếp Theo**: [Chương 8: Mô Hình Sản Xuất & Doanh Nghiệp](../ai-foundry/production-ai-practices.md)
- **🤖 Liên Quan**: [Chương 2: Phát Triển AI-First](../ai-foundry/azure-ai-foundry-integration.md)
- [Khắc Phục Sự Cố Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.