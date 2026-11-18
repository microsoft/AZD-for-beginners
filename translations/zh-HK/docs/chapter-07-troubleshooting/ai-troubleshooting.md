# AI 專用故障排除指南

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 當前章節**：第 7 章 - 故障排除與除錯
- **⬅️ 上一章**：[除錯指南](debugging.md)
- **➡️ 下一章**：[第 8 章：生產與企業模式](../chapter-08-production/production-ai-practices.md)
- **🤖 相關章節**：[第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)

本綜合故障排除指南針對使用 AZD 部署 AI 解決方案時的常見問題，提供特定於 Azure AI 服務的解決方案和除錯技巧。

> **範圍：** 命令使用範例資源名稱；請替換並選擇正確訂閱。Bicep 區塊為合併到現有模板的片段，非獨立部署。Python 範例需要宣稱的 SDK 及應用程式配置。此審查未執行任何 Azure 實際部署。

## 目錄

- [Microsoft Foundry 模型服務問題](#microsoft-foundry-models-service-issues)
- [Azure AI 搜尋問題](#azure-ai-search-problems)
- [容器應用部署問題](#container-apps-deployment-issues)
- [身份驗證和權限錯誤](#authentication-and-permission-errors)
- [模型部署失敗](#model-deployment-failures)
- [效能與擴充問題](#performance-and-scaling-issues)
- [成本與配額管理](#cost-and-quota-management)
- [除錯工具與技巧](#debugging-tools-and-techniques)

## Microsoft Foundry 模型服務問題

### 問題：區域內 OpenAI 服務不可用

**症狀：**
```
Error: The requested resource type is not available in the location 'westus'
```

**原因：**
- Microsoft Foundry 模型在選擇的區域不可用
- 首選區域配額用盡
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

1. **檢查當前配額：**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **申請配額提升：**
使用 Foundry 入口網站的配額管理工作流程，針對受影響的訂閱、區域、模型和部署類型。參考[官方配額指引](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)。虛擬機配額申請不會增加模型配額。

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

1. **使用支援的 API 版本：**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **檢查 API 版本相容性：**
查看[Azure OpenAI API 生命週期參考](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle)。ARM 資源提供者 API 版本<strong>不</strong>列出推論/數據平面 API 版本。新版 v1 用戶端使用 `/openai/v1/`，無日期 `api-version`；請勿混用兩種客戶端設定。

## Azure AI 搜尋問題

### 問題：搜尋服務定價層不足

**症狀：**
```
Error: Semantic search requires Basic tier or higher
```

**解決方案：**

1. **使用受支援的定價層：**

語意排序器需 Basic 或更高層級。從 Free/Basic 轉為其他層級可能需新建搜尋服務並重建索引；編輯 SKU 不保證原地升級。
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

2. **停用語意搜尋（開發用）：**
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

1. **確認搜尋服務金鑰：**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **檢查索引結構：**
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

3. **使用託管身份：**
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

## 容器應用部署問題

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

2. **驗證依賴項：**
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

### 問題：容器應用啟動失敗

**症狀：**
```
Error: Container failed to start within timeout period
```

**解決方案：**

1. **增加啟動逾時：**
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

## 身份驗證和權限錯誤

### 問題：託管身份權限被拒

**症狀：**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**解決方案：**

1. **驗證角色指派：**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **指派所需角色：**
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

3. **測試身份驗證：**
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

令牌取得證明身份驗證成功，但不代表有權限調用模型。請另行測試預期操作。於本機 `DefaultAzureCredential` 可能使用開發者憑證；於 Azure，請確認選取的託管身份正確。

### 問題：Key Vault 訪問被拒

**症狀：**
```
Error: The user, group or application does not have secrets get permission
```

**解決方案：**

1. **授予 Key Vault 權限：**

僅針對具有 `enableRbacAuthorization: false` 的保管庫使用以下存取策略片段。對於啟用 RBAC 的保管庫，請使用方案 2；在 RBAC 模式下新增存取策略不會授予數據平面存取權。
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

2. **使用 RBAC 而非存取策略：**

保管庫必須有 `enableRbacAuthorization: true`；改變權限模型需規劃現有權限的遷移。
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

2. **明確選取可用模型：**
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

## 效能與擴充問題

### 問題：高延遲回應

**症狀：**
- 回應時間超過 30 秒
- 逾時錯誤
- 使用者體驗差

**解決方案：**

1. **實施請求逾時設定：**
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

3. **設定自動擴充：**
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

1. **提高記憶體配置：**
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

### 問題：意外高額成本

**症狀：**
- Azure 帳單高於預期
- 令牌用量超出預估
- 觸發預算警報

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

這個記憶體中的計數器僅為示範，非月度花費控制：重啟時重置，不跨複本共享，僅於呼叫後檢查用量。真實限制需要耐久計費、請求前並發安全預留及每月重置策略。容器記憶體指標亦需考慮 cgroup 限制；`psutil.virtual_memory()` 不是可靠的容器限制測量，垃圾回收不強制記憶體上限。

2. **設置成本警報：**
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

在你的模板中宣告 `budgetStartDate` 和 `budgetEndDate`。預算會通知，但不會停止資源或強制執行硬性支出上限。

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

### AZD 除錯命令

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

### AZD AI 擴充命令進行診斷

若已使用 `azd ai agent init` 部署代理，亦可使用以下進階工具：

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

> **提示：** 使用 `azd infra generate` 將 IaC 寫入磁碟，方便檢視實際佈建的資源。這對除錯資源配置問題非常重要。完整細節參見 [AZD AI CLI 參考](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

**GA 工作流程診斷 (2026-11-09)：** 確認 `azd version` 至少為 1.37.0 並檢查 `azd ext list --installed`。先使用 `azd update` 或其安裝程式更新核心 CLI，再用 `azd ext upgrade microsoft.foundry` 更新套件。對於本機失敗，檢查目前的 uv、Python 3.13+（用於基本範例）、服務配置中的 `PYTHONNOUSERSITE: "1"` 以及 `DefaultAzureCredential` 使用的 Azure 凭据。保持 `azd ai agent run` 運行，並從專案目錄的第二個終端機調用 `--local`。

配置成功並不代表開發者擁有資料平面存取權。請檢查 RBAC 警告及[託管代理權限矩陣](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions)。逾時不代表部署失敗：請檢查嘗試的版本與日誌後再重試。早期代理 beta.23 改善了這些警告和 A2A 輸出；這些歷史修正詳述於[發行說明](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes)，非必須安裝該 beta。

如果 `azd ai eval` 不可用，請分別安裝 `azure.ai.evaluations`；GA 套件不包含它。若舊教學的 agent-evaluation 指令僅顯示遷移指引，請改用單獨的 `azd ai eval` 工作流程。優化的 `--config` 不再接受舊版評估檔案。參見[評估遷移](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks)和[優化遷移](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration)。

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

3. **效能監控:**
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

## 常見錯誤代碼及解決方案

| 錯誤代碼 | 描述 | 解決方案 |
|------------|-------------|----------|
| 401 | 未經授權 | 檢查 API 密鑰及託管身份設定 |
| 403 | 禁止訪問 | 驗證 RBAC 角色分配 |
| 429 | 請求速率限制 | 實施帶指數退避的重試邏輯 |
| 500 | 內部伺服器錯誤 | 檢查模型部署狀態及日誌 |
| 503 | 服務不可用 | 驗證服務狀況及區域可用性 |

## 後續步驟

1. **檢閱 [AI 模型部署指南](../chapter-02-ai-development/ai-model-deployment.md)** 以了解部署最佳實踐
2. **完成 [生產 AI 實務](../chapter-08-production/production-ai-practices.md)** 以獲取企業級解決方案
3. **加入 [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** 參與社群支援
4. <strong>提交問題</strong> 至 [AZD GitHub 倉庫](https://github.com/Azure/azure-dev) 探討 AZD 相關問題

## 資源

- [Azure OpenAI 配額與節流疑難排解](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Container Apps 疑難排解](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI 搜尋疑難排解](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure 診斷代理技能**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - 在您的編輯器中安裝 Azure 疑難排解技能：`npx skills add microsoft/github-copilot-for-azure`

---

**章節導航:**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 當前章節**：第 7 章 - 疑難排解與除錯
- **⬅️ 上一章**：[除錯指南](debugging.md)
- **➡️ 下一章**：[第 8 章：生產及企業方案](../chapter-08-production/production-ai-practices.md)
- **🤖 相關章節**：[第 2 章：AI 優先開發](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 參考資料**：[Azure Developer CLI 疑難排解](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->