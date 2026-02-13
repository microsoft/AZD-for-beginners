# AI 特定故障排除指南

**章节导航：**
- **📚 课程首页**: [AZD 入门](../../README.md)
- **📖 当前章节**: 第7章 - 故障排除与调试
- **⬅️ 上一章**: [调试指南](debugging.md)
- **➡️ 下一章**: [第8章：生产与企业模式](../chapter-08-production/production-ai-practices.md)
- **🤖 相关**: [第2章：以AI为先的开发](../chapter-02-ai-development/microsoft-foundry-integration.md)

**上一节：** [生产 AI 实践](../chapter-08-production/production-ai-practices.md) | **下一节：** [AZD 基础](../chapter-01-foundation/azd-basics.md)

本综合故障排除指南解决在使用 AZD 部署 AI 解决方案时的常见问题，提供针对 Azure AI 服务的解决方案和调试技术。

## 目录

- [Azure OpenAI 服务问题](../../../../docs/chapter-07-troubleshooting)
- [Azure AI 搜索问题](../../../../docs/chapter-07-troubleshooting)
- [容器应用部署问题](../../../../docs/chapter-07-troubleshooting)
- [身份验证与权限错误](../../../../docs/chapter-07-troubleshooting)
- [模型部署失败](../../../../docs/chapter-07-troubleshooting)
- [性能与扩展问题](../../../../docs/chapter-07-troubleshooting)
- [成本与配额管理](../../../../docs/chapter-07-troubleshooting)
- [调试工具与技术](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI 服务问题

### 问题：OpenAI 服务在该区域不可用

**症状：**
```
Error: The requested resource type is not available in the location 'westus'
```

**原因：**
- Azure OpenAI 在所选区域不可用
- 首选区域配额已用尽
- 区域容量限制

**解决方案：**

1. **检查区域可用性：**
```bash
# 列出可用的 OpenAI 区域
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **更新 AZD 配置：**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **使用替代区域：**
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

### 问题：模型部署配额超限

**症状：**
```
Error: Deployment failed due to insufficient quota
```

**解决方案：**

1. **检查当前配额：**
```bash
# 检查配额使用情况
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **请求配额增加：**
```bash
# 提交配额增加请求
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **优化模型容量：**
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

### 问题：无效的 API 版本

**症状：**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**解决方案：**

1. **使用受支持的 API 版本：**
```python
# 使用最新受支持的版本
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **检查 API 版本兼容性：**
```bash
# 列出受支持的 API 版本
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI 搜索问题

### 问题：搜索服务定价层级不足

**症状：**
```
Error: Semantic search requires Basic tier or higher
```

**解决方案：**

1. **升级定价层级：**
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

2. **禁用语义搜索（开发环境）：**
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

### 问题：索引创建失败

**症状：**
```
Error: Cannot create index, insufficient permissions
```

**解决方案：**

1. **验证搜索服务密钥：**
```bash
# 获取搜索服务管理员密钥
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **检查索引模式：**
```python
# 验证索引模式
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

3. **使用托管身份：**
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

## 容器应用部署问题

### 问题：容器构建失败

**症状：**
```
Error: Failed to build container image
```

**解决方案：**

1. **检查 Dockerfile 语法：**
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

2. **验证依赖项：**
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

3. **添加健康检查：**
```python
# main.py - 添加健康检查端点
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### 问题：容器应用启动失败

**症状：**
```
Error: Container failed to start within timeout period
```

**解决方案：**

1. **增加启动超时：**
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

2. **优化模型加载：**
```python
# 延迟加载模型以减少启动时间
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
        # 在此初始化 AI 客户端
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # 启动
    app.state.model_manager = ModelManager()
    yield
    # 关闭
    pass

app = FastAPI(lifespan=lifespan)
```

## 身份验证与权限错误

### 问题：托管身份权限被拒绝

**症状：**
```
Error: Authentication failed for Azure OpenAI Service
```

**解决方案：**

1. **验证角色分配：**
```bash
# 检查当前角色分配
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **分配所需角色：**
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

3. **测试身份验证：**
```python
# 测试托管标识身份验证
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

### 问题：Key Vault 访问被拒绝

**症状：**
```
Error: The user, group or application does not have secrets get permission
```

**解决方案：**

1. **授予 Key Vault 权限：**
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

2. **使用 RBAC 而非访问策略：**
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

## 模型部署失败

### 问题：模型版本不可用

**症状：**
```
Error: Model version 'gpt-4-32k' is not available
```

**解决方案：**

1. **检查可用模型：**
```bash
# 列出可用的模型
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **使用模型回退：**
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

3. **在部署前验证模型：**
```python
# 部署前模型验证
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

## 性能与扩展问题

### 问题：响应延迟高

**症状：**
- 响应时间 > 30 秒
- 超时错误
- 用户体验差

**解决方案：**

1. **实现请求超时：**
```python
# 配置适当的超时
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

2. **添加响应缓存：**
```python
# 用于响应的 Redis 缓存
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

3. **配置自动伸缩：**
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

### 问题：内存不足错误

**症状：**
```
Error: Container killed due to memory limit exceeded
```

**解决方案：**

1. **增加内存分配：**
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

2. **优化内存使用：**
```python
# 内存高效的模型处理
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # 在处理前检查内存使用情况
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # 强制进行垃圾回收
            
        result = await self._process_ai_request(request)
        
        # 处理后清理
        gc.collect()
        return result
```

## 成本与配额管理

### 问题：意外的高成本

**症状：**
- Azure 账单高于预期
- 令牌使用超出估算
- 触发预算警报

**解决方案：**

1. **实施成本控制：**
```python
# 令牌使用情况跟踪
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

2. **设置成本警报：**
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

3. **优化模型选择：**
```python
# 成本感知的模型选择
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # 每千个令牌
    'gpt-4': 0.03,          # 每千个令牌
    'gpt-35-turbo': 0.0015  # 每千个令牌
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

## 调试工具与技术

### AZD 调试命令

```bash
# 启用详细日志记录
azd up --debug

# 检查部署状态
azd show

# 查看应用日志（打开监控仪表板）
azd monitor --logs

# 查看实时指标
azd monitor --live

# 检查环境变量
azd env get-values
```

### 应用调试

1. **结构化日志：**
```python
import logging
import json

# 为 AI 应用配置结构化日志记录
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

2. **健康检查端点：**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # 检查与 OpenAI 的连接
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # 检查搜索服务
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

3. **性能监控：**
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

## 常见错误代码与解决方法

| 错误代码 | 描述 | 解决方案 |
|------------|-------------|----------|
| 401 | 未授权 | 检查 API 密钥和托管身份配置 |
| 403 | 禁止访问 | 验证 RBAC 角色分配 |
| 429 | 被限流 | 实现带指数退避的重试逻辑 |
| 500 | 内部服务器错误 | 检查模型部署状态和日志 |
| 503 | 服务不可用 | 验证服务健康状况和区域可用性 |

## 后续步骤

1. **查看 [AI 模型部署指南](../chapter-02-ai-development/ai-model-deployment.md)** 以获取部署最佳实践
2. **完成 [生产 AI 实践](../chapter-08-production/production-ai-practices.md)** 以获得企业级解决方案
3. **加入 [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** 获取社区支持
4. **向 [AZD GitHub 存储库](https://github.com/Azure/azure-dev) 提交问题** 以报告 AZD 特定问题

## 资源

- [Azure OpenAI 服务故障排除](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [容器应用故障排除](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI 搜索故障排除](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**章节导航：**
- **📚 课程首页**: [AZD 入门](../../README.md)
- **📖 当前章节**: 第7章 - 故障排除与调试
- **⬅️ 上一章**: [调试指南](debugging.md)
- **➡️ 下一章**: [第8章：生产与企业模式](../chapter-08-production/production-ai-practices.md)
- **🤖 相关**: [第2章：以AI为先的开发](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Azure Developer CLI 故障排除](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件使用 AI 翻译服务 Co-op Translator（https://github.com/Azure/co-op-translator）进行翻译。尽管我们力求准确，但请注意，自动翻译可能存在错误或不准确之处。应以原始语言的原文为准。对于重要信息，建议使用专业人工翻译。我们不对因使用本翻译而产生的任何误解或曲解承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->