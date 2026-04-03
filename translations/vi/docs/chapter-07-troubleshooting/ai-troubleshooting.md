# Hướng dẫn khắc phục sự cố dành cho AI

**Chapter Navigation:**
- **📚 Course Home**: [AZD cho Người mới bắt đầu](../../README.md)
- **📖 Current Chapter**: Chương 7 - Khắc phục sự cố & Gỡ lỗi
- **⬅️ Previous**: [Hướng dẫn gỡ lỗi](debugging.md)
- **➡️ Next Chapter**: [Chương 8: Thực hành Sản xuất & Doanh nghiệp](../chapter-08-production/production-ai-practices.md)
- **🤖 Related**: [Chương 2: Phát triển theo hướng AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

Hướng dẫn khắc phục sự cố toàn diện này giải quyết các vấn đề phổ biến khi triển khai giải pháp AI với AZD, cung cấp các giải pháp và kỹ thuật gỡ lỗi dành riêng cho các dịch vụ AI của Azure.

## Mục lục

- [Microsoft Foundry Models Service Issues](#azure-openai-service-issues)
- [Azure AI Search Problems](#azure-ai-search-problems)
- [Container Apps Deployment Issues](#container-apps-deployment-issues)
- [Authentication and Permission Errors](#authentication-and-permission-errors)
- [Model Deployment Failures](#model-deployment-failures)
- [Performance and Scaling Issues](#performance-and-scaling-issues)
- [Cost and Quota Management](#cost-and-quota-management)
- [Debugging Tools and Techniques](#debugging-tools-and-techniques)

## Microsoft Foundry Models Service Issues

### Issue: OpenAI Service Unavailable in Region

**Symptoms:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causes:**
- Microsoft Foundry Models không khả dụng ở khu vực đã chọn
- Hạn mức (quota) đã hết ở các khu vực ưa thích
- Hạn chế năng lực theo khu vực

**Solutions:**

1. **Check Region Availability:**
```bash
# Liệt kê các vùng khả dụng cho OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Update AZD Configuration:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Use Alternative Regions:**
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

### Issue: Model Deployment Quota Exceeded

**Symptoms:**
```
Error: Deployment failed due to insufficient quota
```

**Solutions:**

1. **Check Current Quota:**
```bash
# Kiểm tra mức sử dụng hạn ngạch
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Request Quota Increase:**
```bash
# Gửi yêu cầu tăng hạn mức
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimize Model Capacity:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 1  // Start with minimal capacity
  }
}
```

### Issue: Invalid API Version

**Symptoms:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Solutions:**

1. **Use Supported API Version:**
```python
# Sử dụng phiên bản mới nhất được hỗ trợ
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Check API Version Compatibility:**
```bash
# Liệt kê các phiên bản API được hỗ trợ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Issue: Search Service Pricing Tier Insufficient

**Symptoms:**
```
Error: Semantic search requires Basic tier or higher
```

**Solutions:**

1. **Upgrade Pricing Tier:**
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

2. **Disable Semantic Search (Development):**
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

### Issue: Index Creation Failures

**Symptoms:**
```
Error: Cannot create index, insufficient permissions
```

**Solutions:**

1. **Verify Search Service Keys:**
```bash
# Lấy khóa quản trị dịch vụ tìm kiếm
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Check Index Schema:**
```python
# Xác thực lược đồ chỉ mục
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

3. **Use Managed Identity:**
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

## Container Apps Deployment Issues

### Issue: Container Build Failures

**Symptoms:**
```
Error: Failed to build container image
```

**Solutions:**

1. **Check Dockerfile Syntax:**
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

2. **Validate Dependencies:**
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

3. **Add Health Check:**
```python
# main.py - Thêm endpoint kiểm tra sức khỏe
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Issue: Container App Startup Failures

**Symptoms:**
```
Error: Container failed to start within timeout period
```

**Solutions:**

1. **Increase Startup Timeout:**
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

2. **Optimize Model Loading:**
```python
# Tải mô hình theo nhu cầu để giảm thời gian khởi động
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
        # Khởi tạo client AI ở đây
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

## Authentication and Permission Errors

### Issue: Managed Identity Permission Denied

**Symptoms:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Solutions:**

1. **Verify Role Assignments:**
```bash
# Kiểm tra các vai trò được phân công hiện tại
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Assign Required Roles:**
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

3. **Test Authentication:**
```python
# Kiểm tra xác thực danh tính được quản lý
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

### Issue: Key Vault Access Denied

**Symptoms:**
```
Error: The user, group or application does not have secrets get permission
```

**Solutions:**

1. **Grant Key Vault Permissions:**
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

2. **Use RBAC Instead of Access Policies:**
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

## Model Deployment Failures

### Issue: Model Version Not Available

**Symptoms:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Solutions:**

1. **Check Available Models:**
```bash
# Liệt kê các mô hình có sẵn
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Use Model Fallbacks:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-4.1'
  version: '2024-08-06'
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

3. **Validate Model Before Deployment:**
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

## Performance and Scaling Issues

### Issue: High Latency Responses

**Symptoms:**
- Thời gian phản hồi > 30 giây
- Lỗi timeout
- Trải nghiệm người dùng kém

**Solutions:**

1. **Implement Request Timeouts:**
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

2. **Add Response Caching:**
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

3. **Configure Auto-scaling:**
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

### Issue: Memory Out of Errors

**Symptoms:**
```
Error: Container killed due to memory limit exceeded
```

**Solutions:**

1. **Increase Memory Allocation:**
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

2. **Optimize Memory Usage:**
```python
# Quản lý mô hình tiết kiệm bộ nhớ
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

## Cost and Quota Management

### Issue: Unexpected High Costs

**Symptoms:**
- Hóa đơn Azure cao hơn dự kiến
- Sử dụng token vượt ước tính
- Cảnh báo ngân sách được kích hoạt

**Solutions:**

1. **Implement Cost Controls:**
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

2. **Set up Cost Alerts:**
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

3. **Optimize Model Selection:**
```python
# Lựa chọn mô hình cân nhắc chi phí
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

## Debugging Tools and Techniques

### AZD Debugging Commands

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

### AZD AI Extension Commands for Diagnostics

If you deployed agents using `azd ai agent init`, these additional tools are available:

```bash
# Đảm bảo phần mở rộng agents đã được cài đặt
azd extension install azure.ai.agents

# Khởi tạo lại hoặc cập nhật một agent từ tệp manifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Sử dụng máy chủ MCP để các công cụ AI truy vấn trạng thái dự án
azd mcp start

# Tạo các tệp hạ tầng để xem xét và kiểm toán
azd infra generate
```

> **Mẹo:** Sử dụng `azd infra generate` để ghi IaC ra đĩa nhằm bạn có thể kiểm tra chính xác những tài nguyên nào đã được cung cấp. Điều này vô cùng giá trị khi gỡ lỗi các vấn đề cấu hình tài nguyên. Xem [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) để biết chi tiết đầy đủ.

### Application Debugging

1. **Structured Logging:**
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

2. **Health Check Endpoints:**
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

3. **Performance Monitoring:**
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

## Common Error Codes and Solutions

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | Unauthorized | Kiểm tra API keys và cấu hình managed identity |
| 403 | Forbidden | Xác minh phân quyền RBAC |
| 429 | Rate Limited | Thực hiện logic retry với exponential backoff |
| 500 | Internal Server Error | Kiểm tra trạng thái triển khai mô hình và nhật ký |
| 503 | Service Unavailable | Xác minh tình trạng dịch vụ và khả dụng theo khu vực |

## Next Steps

1. **Review [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** để biết các thực hành tốt nhất về triển khai
2. **Complete [Production AI Practices](../chapter-08-production/production-ai-practices.md)** cho các giải pháp sẵn sàng doanh nghiệp
3. **Tham gia [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** để nhận hỗ trợ cộng đồng
4. **Gửi issues** tới [kho lưu trữ GitHub AZD](https://github.com/Azure/azure-dev) cho các vấn đề cụ thể của AZD

## Resources

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Cài đặt kỹ năng gỡ lỗi Azure trong trình soạn thảo của bạn: `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD cho Người mới bắt đầu](../../README.md)
- **📖 Current Chapter**: Chương 7 - Khắc phục sự cố & Gỡ lỗi
- **⬅️ Previous**: [Hướng dẫn gỡ lỗi](debugging.md)
- **➡️ Next Chapter**: [Chương 8: Thực hành Sản xuất & Doanh nghiệp](../chapter-08-production/production-ai-practices.md)
- **🤖 Related**: [Chương 2: Phát triển theo hướng AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Reference**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->