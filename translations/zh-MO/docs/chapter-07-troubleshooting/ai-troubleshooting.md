# AI 專屬疑難排解指南

**章節導覽：**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 本章節**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ 上章**: [Debugging Guide](debugging.md)
- **➡️ 下一章**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 相關章節**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

本綜合疑難排解指南處理使用 AZD 部署 AI 解決方案時常見的問題，並提供針對 Azure AI 服務的解決方法與偵錯技巧。

## 目錄

- [Microsoft Foundry Models Service Issues](#azure-openai-service-issues)
- [Azure AI Search Problems](#azure-ai-search-問題)
- [Container Apps Deployment Issues](#container-apps-部署問題)
- [Authentication and Permission Errors](#認證與權限錯誤)
- [Model Deployment Failures](#模型部署失敗)
- [Performance and Scaling Issues](#效能與擴充問題)
- [Cost and Quota Management](#成本與配額管理)
- [Debugging Tools and Techniques](#偵錯工具與技巧)

## Microsoft Foundry Models Service Issues

### 問題：在該區域無法使用 OpenAI 服務

**症狀：**
```
Error: The requested resource type is not available in the location 'westus'
```

**原因：**
- Microsoft Foundry Models 在所選區域不可用
- 偏好區域的配額已耗盡
- 區域容量限制

**解決方法：**

1. **檢查區域可用性：**
```bash
# 列出 OpenAI 可用的地區
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **更新 AZD 設定：**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **使用替代區域：**
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

### 問題：模型部署配額超出

**症狀：**
```
Error: Deployment failed due to insufficient quota
```

**解決方法：**

1. **檢查當前配額：**
```bash
# 檢查配額使用情況
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **申請增加配額：**
```bash
# 提交配額增加申請
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **優化模型容量：**
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

### 問題：API 版本無效

**症狀：**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**解決方法：**

1. **使用受支援的 API 版本：**
```python
# 使用最新支援的版本
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **檢查 API 版本相容性：**
```bash
# 列出支援的 API 版本
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search 問題

### 問題：Search Service 定價層級不足

**症狀：**
```
Error: Semantic search requires Basic tier or higher
```

**解決方法：**

1. **升級定價層級：**
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

2. **停用語意搜尋（開發時）：**
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

### 問題：索引建立失敗

**症狀：**
```
Error: Cannot create index, insufficient permissions
```

**解決方法：**

1. **驗證 Search Service 金鑰：**
```bash
# 取得搜尋服務管理金鑰
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **檢查索引結構：**
```python
# 驗證索引結構
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

3. **使用受管理身分識別（Managed Identity）：**
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

## Container Apps 部署問題

### 問題：容器建置失敗

**症狀：**
```
Error: Failed to build container image
```

**解決方法：**

1. **檢查 Dockerfile 語法：**
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

2. **驗證相依性：**
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

3. **加入健康檢查：**
```python
# main.py - 新增健康檢查端點
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### 問題：Container App 啟動失敗

**症狀：**
```
Error: Container failed to start within timeout period
```

**解決方法：**

1. **增加啟動逾時時間：**
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

2. **優化模型載入：**
```python
# 延遲載入模型以減少啟動時間
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
        # 在此初始化 AI 客戶端
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # 啟動
    app.state.model_manager = ModelManager()
    yield
    # 關閉
    pass

app = FastAPI(lifespan=lifespan)
```

## 認證與權限錯誤

### 問題：受管理身分（Managed Identity）權限被拒

**症狀：**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**解決方法：**

1. **驗證角色指派：**
```bash
# 檢查目前的角色分配
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **指派必要的角色：**
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

3. **測試認證：**
```python
# 測試受管理的身分識別驗證
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

### 問題：Key Vault 存取被拒

**症狀：**
```
Error: The user, group or application does not have secrets get permission
```

**解決方法：**

1. **授予 Key Vault 權限：**
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

2. **使用 RBAC 而非存取原則：**
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

## 模型部署失敗

### 問題：模型版本不可用

**症狀：**
```
Error: Model version 'gpt-4-32k' is not available
```

**解決方法：**

1. **檢查可用模型：**
```bash
# 列出可用模型
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **使用模型回退選項：**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
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

3. **在部署前驗證模型：**
```python
# 部署前的模型驗證
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

## 效能與擴充問題

### 問題：回應延遲高

**症狀：**
- 回應時間 > 30 秒
- 逾時錯誤
- 使用者體驗差

**解決方法：**

1. **實作請求逾時：**
```python
# 設定適當的逾時時間
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

2. **加入回應快取：**
```python
# 用於回應的 Redis 快取
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

3. **設定自動縮放：**
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

### 問題：記憶體不足錯誤

**症狀：**
```
Error: Container killed due to memory limit exceeded
```

**解決方法：**

1. **增加記憶體配置：**
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

2. **優化記憶體使用：**
```python
# 節省記憶體的模型處理
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # 在處理前檢查記憶體使用情況
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # 強制執行垃圾回收
            
        result = await self._process_ai_request(request)
        
        # 處理後清理
        gc.collect()
        return result
```

## 成本與配額管理

### 問題：意外的高額費用

**症狀：**
- Azure 帳單高於預期
- 代幣使用量超出估計
- 觸發預算警示

**解決方法：**

1. **實作成本控制：**
```python
# 代幣使用追蹤
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

2. **設定成本警示：**
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

3. **優化模型選擇：**
```python
# 考慮成本的模型選擇
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # 每1千個詞元
    'gpt-4.1': 0.03,          # 每1千個詞元
    'gpt-35-turbo': 0.0015  # 每1千個詞元
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4.1-mini'
    elif complexity == 'medium':
        return 'gpt-35-turbo'
    else:
        return 'gpt-4.1'
```

## 偵錯工具與技巧

### AZD 偵錯指令

```bash
# 啟用詳細日誌記錄
azd up --debug

# 檢查部署狀態
azd show

# 檢視應用程式日誌（會開啟監控儀表板）
azd monitor --logs

# 檢視即時指標
azd monitor --live

# 檢查環境變數
azd env get-values
```

### 用於診斷的 AZD AI 擴充指令

如果你是使用 `azd ai agent init` 部署 agents，則可使用以下額外工具：

```bash
# 確保已安裝 agents 擴充套件
azd extension install azure.ai.agents

# 從 manifest 重新初始化或更新 agent
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 使用 MCP 伺服器讓 AI 工具查詢專案狀態
azd mcp start

# 產生基礎架構檔案以供審查與稽核
azd infra generate
```

> **提示：** 使用 `azd infra generate` 將 IaC 寫入磁碟，這樣你就能檢視實際佈建了哪些資源。這在偵錯資源設定問題時非常有價值。完整細節請參閱 [AZD AI CLI 參考](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

### 應用程式偵錯

1. **結構化日誌：**
```python
import logging
import json

# 為 AI 應用程式設定結構化日誌記錄
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

2. **健康檢查端點：**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # 檢查與 OpenAI 的連線
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # 檢查搜尋服務
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

3. **效能監控：**
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

## 常見錯誤代碼與解決方法

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | Unauthorized | Check API keys and managed identity configuration |
| 403 | Forbidden | Verify RBAC role assignments |
| 429 | Rate Limited | Implement retry logic with exponential backoff |
| 500 | Internal Server Error | Check model deployment status and logs |
| 503 | Service Unavailable | Verify service health and regional availability |

## 後續步驟

1. **檢視 [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** 以取得部署最佳實務
2. **完成 [Production AI Practices](../chapter-08-production/production-ai-practices.md)** 以建立企業級解決方案
3. **加入 [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** 以獲得社群支援
4. <strong>提交問題</strong> 到 [AZD GitHub repository](https://github.com/Azure/azure-dev) 以反映 AZD 特定問題

## 資源

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - 在你的編輯器安裝 Azure 疑難排解技能：`npx skills add microsoft/github-copilot-for-azure`

---

**章節導覽：**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 本章節**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ 上章**: [Debugging Guide](debugging.md)
- **➡️ 下一章**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 相關章節**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 參考**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件經由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但自動翻譯可能包含錯誤或不準確之處。原始語言版本應視為具權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們不會對因使用本翻譯而產生的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->