# AI 專屬故障排除指南

**章節導航：**
- **📚 課程首頁**：[入門 AZD](../../README.md)
- **📖 當前章節**：第 7 章 - 故障排除與除錯
- **⬅️ 上一章節**：[除錯指南](debugging.md)
- **➡️ 下一章節**：[第 8 章：生產與企業範例](../chapter-08-production/production-ai-practices.md)
- **🤖 相關章節**：[第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

本綜合故障排除指南涵蓋使用 AZD 部署 AI 解決方案時常見的問題，提供針對 Azure AI 服務的解決方案與除錯技術。

> **範圍說明：** 指令範例中使用了範例資源名稱；請將其替換並選擇正確的訂閱。Bicep 區塊是用來合併至現有範本的片段，非獨立部署。Python 範例需安裝所述的 SDK 及應用程式配置。此檢視未執行實際 Azure 部署。

## 目錄

- [Microsoft Foundry 模型服務問題](#microsoft-foundry-models-service-issues)
- [Azure AI 搜尋問題](#azure-ai-search-problems)
- [容器應用部署問題](#container-apps-deployment-issues)
- [驗證與權限錯誤](#authentication-and-permission-errors)
- [模型部署失敗](#model-deployment-failures)
- [效能與擴充問題](#performance-and-scaling-issues)
- [成本與配額管理](#cost-and-quota-management)
- [除錯工具與技術](#debugging-tools-and-techniques)

## Microsoft Foundry 模型服務問題

### 問題：OpenAI 服務在該區域不可用

**症狀：**
```
Error: The requested resource type is not available in the location 'westus'
```

**原因：**
- Microsoft Foundry 模型在所選區域尚未提供
- 偏好區域配額已用盡
- 區域容量限制

**解決方案：**

1. **檢查區域可用性：**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **更新 AZD 配置：**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **使用替代區域：**
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

### 問題：模型部署配額超出

**症狀：**
```
Error: Deployment failed due to insufficient quota
```

**解決方案：**

1. **檢查目前配額：**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **申請配額增加：**
請使用 Foundry 入口網站的配額管理流程，針對受影響的訂閱、區域、模型與部署類型進行申請。請參考[官方配額指導](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)。VM 配額申請不會提升模型配額。

3. **優化模型容量：**
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

### 問題：API 版本無效

**症狀：**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**解決方案：**

1. **使用受支持的 API 版本：**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **檢查 API 版本相容性：**
查看 [Azure OpenAI API 生命週期參考](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle)。ARM 資源提供者 API 版本 <strong>不</strong> 列出推理/資料平面 API 版本。新的 v1 用戶端使用 `/openai/v1/`，且不帶有日期標記的 `api-version`；請勿混用這兩種用戶端設定。

## Azure AI 搜尋問題

### 問題：搜尋服務定價層不足

**症狀：**
```
Error: Semantic search requires Basic tier or higher
```

**解決方案：**

1. **使用受支援的定價層：**

語意排序器需要 Basic 或以上等級。從 Free/Basic 移動到不同的等級可能需要建立新搜尋服務並重新建置索引；編輯 SKU 不保證是現場升級。
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

2. **停用語意搜尋（開發中）：**
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

**解決方案：**

1. **驗證搜尋服務金鑰：**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **檢查索引架構：**
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

3. **使用管理身份：**
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

## 容器應用程式部署問題

### 問題：容器建置失敗

**症狀：**
```
Error: Failed to build container image
```

**解決方案：**

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

3. **新增健康檢查：**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### 問題：容器應用程式啟動失敗

**症狀：**
```
Error: Container failed to start within timeout period
```

**解決方案：**

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

2. **優化模型載入：**
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

## 認證與權限錯誤

### 問題：管理身份權限被拒

**症狀：**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**解決方案：**

1. **驗證角色分配：**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **指派必要角色：**
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

令牌取得證明認證有效，但不代表有權限調用模型。請分別測試預期的操作。在本機，`DefaultAzureCredential` 可能使用開發者憑證；在 Azure 中，請確認選擇了預期的管理身份。

### 問題：Key Vault 存取被拒

**症狀：**
```
Error: The user, group or application does not have secrets get permission
```

**解決方案：**

1. **授予 Key Vault 權限：**

下面的存取原則片段只適用於有 `enableRbacAuthorization: false` 的保險庫。對於啟用 RBAC 的保險庫，使用方案 2；在 RBAC 模式下新增存取原則不會授予資料平面存取權。
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

2. **使用 RBAC 替代存取原則：**

保險庫必須有 `enableRbacAuthorization: true`；更改權限模型需要對既有訪問進行規劃中的遷移。
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

**解決方案：**

1. **檢查可用模型：**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **明確選擇可用模型：**
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

3. **部署前驗證模型：**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## 性能與擴展問題

### 問題：高延遲回應

**症狀：**
- 回應時間超過 30 秒
- 逾時錯誤
- 不良使用者體驗

**解決方案：**

1. **實作請求逾時：**
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

2. **新增回應快取：**
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

3. **設定自動擴展：**
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

**解決方案：**

1. **增加記憶體分配：**
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

## 成本與配額管理

### 問題：意外的高成本

**症狀：**
- Azure 帳單高於預期
- 令牌使用超出估算
- 預算警示觸發

**解決方案：**

1. **實施成本控制：**
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

此記憶體內計數器僅為說明用，非每月支出控管：它會在重新啟動時重置、不跨副本共用，且只在呼叫後檢查使用量。真正的限制需有可靠記帳、請求前安全佔用，以及每月重置政策。容器記憶體指標也必須考慮 cgroup 限制；`psutil.virtual_memory()` 並非可靠的容器限制測量，垃圾回收不會強制記憶體上限。

2. **設定成本警示：**
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

在範本中宣告 `budgetStartDate` 與 `budgetEndDate`。預算會通知，不會停止資源或施加硬性支出上限。

3. **優化模型選擇：**
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

## 除錯工具與技巧

### AZD 除錯指令

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

### 用於診斷的 AZD AI 擴充指令

如果您使用 `azd ai agent init` 部署代理，則可使用這些額外工具：

```bash
# Install the GA Foundry bundle (requires azd >= 1.37.0)
azd ext install microsoft.foundry

# Check project storage permissions and agent configuration
azd ai agent doctor

# Inspect the deployed endpoint
azd ai agent endpoint show

# Stream hosted-agent logs
azd ai agent monitor --follow

# Use the MCP server to let AI tools query project state
azd mcp start

# Generate infrastructure files for review and audit
azd infra generate
```

> **提示：** 使用 `azd infra generate` 將 IaC 寫入磁碟，方便檢查實際佈建的資源。這在除錯資源設定問題時非常有用。詳情請參閱 [AZD AI CLI 參考](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

**GA 工作流程診斷 (2026-11-09):** 確認 `azd version` 至少為 1.37.0 並檢查 `azd ext list --installed`。先使用 `azd update` 或其安裝程式更新核心 CLI，然後使用 `azd ext upgrade microsoft.foundry` 更新套件。對於本地失敗，請檢查當前的 uv、Python 3.13+ 用於基本樣本、`PYTHONNOUSERSITE: "1"` 在其服務配置中，以及 `DefaultAzureCredential` 使用的 Azure 憑證。保持 `azd ai agent run` 運行，同時在專案目錄從第二個終端呼叫 `--local`。

配置成功並不代表開發人員具有資料平面存取權。請查看 RBAC 警告和 [hosted-agent 權限矩陣](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions)。逾時不一定表示部署失敗：在重試之前，請檢查嘗試的版本和日誌。早期的代理 beta.23 改善了這些警告和 A2A 輸出；這些歷史修正已在 [版本說明](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes) 中描述，但不要求安裝該 beta。

如果 `azd ai eval` 不可用，請單獨安裝 `azure.ai.evaluations`；GA 套件中不包含它。如果舊教學的 agent-evaluation 命令僅列印遷移指引，請使用獨立的 `azd ai eval` 工作流程。Optimization 的 `--config` 不再接受舊版評估檔案。請參閱 [評估遷移](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) 和 [優化遷移](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration)。

### 應用程式除錯

1. **結構化日誌：**
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

2. **健康檢查端點：**
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

## 常見錯誤代碼與解決方案

| 錯誤代碼 | 說明 | 解決方案 |
|------------|-------------|----------|
| 401 | 未授權 | 檢查 API 金鑰與受管理身份配置 |
| 403 | 禁止存取 | 驗證 RBAC 角色分配 |
| 429 | 流控限制 | 實作指數退避的重試邏輯 |
| 500 | 內部伺服器錯誤 | 檢查模型部署狀態及日誌 |
| 503 | 服務不可用 | 驗證服務健全度及區域可用性 |

## 下一步

1. **檢閱 [AI 模型部署指南](../chapter-02-ai-development/ai-model-deployment.md)** 以瞭解部署最佳實務
2. **完成 [生產 AI 實務](../chapter-08-production/production-ai-practices.md)** 取得企業級方案
3. **加入 [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** 獲取社群支援
4. <strong>提交議題</strong> 至 [AZD GitHub 倉庫](https://github.com/Azure/azure-dev) 以反映 AZD 相關問題

## 資源

- [Azure OpenAI 配額與流控故障排除](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Container Apps 故障排除](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI 搜尋故障排除](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure 診斷代理技能**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - 在您的編輯器中安裝 Azure 故障排除技能：`npx skills add microsoft/github-copilot-for-azure`

---

**章節導覽：**
- **📚 課程首頁**： [AZD 入門](../../README.md)
- **📖 目前章節**： 第七章 - 故障排除與除錯
- **⬅️ 上一章**： [除錯指南](debugging.md)
- **➡️ 下一章**： [第八章：生產與企業模式](../chapter-08-production/production-ai-practices.md)
- **🤖 相關章節**： [第二章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 參考**： [Azure 開發者 CLI 故障排除](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->