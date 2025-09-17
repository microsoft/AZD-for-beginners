<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c8ab8fd8ed338b3ec17484b453dcda68",
  "translation_date": "2025-09-17T14:35:37+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "ko"
}
-->
# AI-특화 문제 해결 가이드

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 7 - 문제 해결 및 디버깅
- **⬅️ 이전**: [디버깅 가이드](debugging.md)
- **➡️ 다음 챕터**: [챕터 8: 프로덕션 및 엔터프라이즈 패턴](../ai-foundry/production-ai-practices.md)
- **🤖 관련**: [챕터 2: AI-우선 개발](../ai-foundry/azure-ai-foundry-integration.md)

**이전:** [프로덕션 AI 실습](../ai-foundry/production-ai-practices.md) | **다음:** [AZD 시작하기](../getting-started/README.md)

이 포괄적인 문제 해결 가이드는 AZD를 사용하여 AI 솔루션을 배포할 때 발생할 수 있는 일반적인 문제를 다루며, Azure AI 서비스에 특화된 해결책과 디버깅 기술을 제공합니다.

## 목차

- [Azure OpenAI 서비스 문제](../../../../docs/troubleshooting)
- [Azure AI 검색 문제](../../../../docs/troubleshooting)
- [컨테이너 앱 배포 문제](../../../../docs/troubleshooting)
- [인증 및 권한 오류](../../../../docs/troubleshooting)
- [모델 배포 실패](../../../../docs/troubleshooting)
- [성능 및 확장 문제](../../../../docs/troubleshooting)
- [비용 및 할당량 관리](../../../../docs/troubleshooting)
- [디버깅 도구 및 기술](../../../../docs/troubleshooting)

## Azure OpenAI 서비스 문제

### 문제: OpenAI 서비스가 지역에서 사용 불가

**증상:**
```
Error: The requested resource type is not available in the location 'westus'
```

**원인:**
- 선택한 지역에서 Azure OpenAI 사용 불가
- 선호 지역에서 할당량 소진
- 지역 용량 제한

**해결책:**

1. **지역 가용성 확인:**
```bash
# List available regions for OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD 구성 업데이트:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **대체 지역 사용:**
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

### 문제: 모델 배포 할당량 초과

**증상:**
```
Error: Deployment failed due to insufficient quota
```

**해결책:**

1. **현재 할당량 확인:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **할당량 증가 요청:**
```bash
# Submit quota increase request
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **모델 용량 최적화:**
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

### 문제: 잘못된 API 버전

**증상:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**해결책:**

1. **지원되는 API 버전 사용:**
```python
# Use latest supported version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API 버전 호환성 확인:**
```bash
# List supported API versions
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI 검색 문제

### 문제: 검색 서비스 가격 책정 계층 부족

**증상:**
```
Error: Semantic search requires Basic tier or higher
```

**해결책:**

1. **가격 책정 계층 업그레이드:**
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

2. **시맨틱 검색 비활성화 (개발용):**
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

### 문제: 인덱스 생성 실패

**증상:**
```
Error: Cannot create index, insufficient permissions
```

**해결책:**

1. **검색 서비스 키 확인:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **인덱스 스키마 확인:**
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

3. **관리 ID 사용:**
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

## 컨테이너 앱 배포 문제

### 문제: 컨테이너 빌드 실패

**증상:**
```
Error: Failed to build container image
```

**해결책:**

1. **Dockerfile 구문 확인:**
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

2. **종속성 유효성 검사:**
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

3. **헬스 체크 추가:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### 문제: 컨테이너 앱 시작 실패

**증상:**
```
Error: Container failed to start within timeout period
```

**해결책:**

1. **시작 시간 초과 증가:**
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

2. **모델 로딩 최적화:**
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

## 인증 및 권한 오류

### 문제: 관리 ID 권한 거부

**증상:**
```
Error: Authentication failed for Azure OpenAI Service
```

**해결책:**

1. **역할 할당 확인:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **필요한 역할 할당:**
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

3. **인증 테스트:**
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

### 문제: 키 볼트 액세스 거부

**증상:**
```
Error: The user, group or application does not have secrets get permission
```

**해결책:**

1. **키 볼트 권한 부여:**
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

2. **액세스 정책 대신 RBAC 사용:**
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

## 모델 배포 실패

### 문제: 모델 버전 사용 불가

**증상:**
```
Error: Model version 'gpt-4-32k' is not available
```

**해결책:**

1. **사용 가능한 모델 확인:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **모델 대체 사용:**
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

3. **배포 전 모델 유효성 검사:**
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

## 성능 및 확장 문제

### 문제: 높은 응답 지연

**증상:**
- 응답 시간 > 30초
- 타임아웃 오류
- 사용자 경험 저하

**해결책:**

1. **요청 타임아웃 구현:**
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

2. **응답 캐싱 추가:**
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

3. **자동 확장 구성:**
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

### 문제: 메모리 부족 오류

**증상:**
```
Error: Container killed due to memory limit exceeded
```

**해결책:**

1. **메모리 할당 증가:**
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

2. **메모리 사용 최적화:**
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

## 비용 및 할당량 관리

### 문제: 예상치 못한 높은 비용

**증상:**
- Azure 청구서 예상보다 높음
- 토큰 사용량이 추정치를 초과
- 예산 알림 발생

**해결책:**

1. **비용 제어 구현:**
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

2. **비용 알림 설정:**
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

3. **모델 선택 최적화:**
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

## 디버깅 도구 및 기술

### AZD 디버깅 명령어

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

### 애플리케이션 디버깅

1. **구조화된 로깅:**
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

2. **헬스 체크 엔드포인트:**
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

3. **성능 모니터링:**
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

## 일반적인 오류 코드 및 해결책

| 오류 코드 | 설명 | 해결책 |
|------------|-------------|----------|
| 401 | 인증 실패 | API 키 및 관리 ID 구성 확인 |
| 403 | 접근 금지 | RBAC 역할 할당 확인 |
| 429 | 속도 제한 | 지수 백오프를 사용한 재시도 로직 구현 |
| 500 | 내부 서버 오류 | 모델 배포 상태 및 로그 확인 |
| 503 | 서비스 사용 불가 | 서비스 상태 및 지역 가용성 확인 |

## 다음 단계

1. **[AI 모델 배포 가이드](ai-model-deployment.md)**를 검토하여 배포 모범 사례 확인
2. **[프로덕션 AI 실습](production-ai-practices.md)**을 완료하여 엔터프라이즈 준비 솔루션 확보
3. **[Azure AI Foundry Discord](https://aka.ms/foundry/discord)**에 참여하여 커뮤니티 지원 받기
4. **문제 제출**: [AZD GitHub 리포지토리](https://github.com/Azure/azure-dev)에 AZD 관련 문제 보고

## 리소스

- [Azure OpenAI 서비스 문제 해결](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [컨테이너 앱 문제 해결](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI 검색 문제 해결](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 7 - 문제 해결 및 디버깅
- **⬅️ 이전**: [디버깅 가이드](debugging.md)
- **➡️ 다음 챕터**: [챕터 8: 프로덕션 및 엔터프라이즈 패턴](../ai-foundry/production-ai-practices.md)
- **🤖 관련**: [챕터 2: AI-우선 개발](../ai-foundry/azure-ai-foundry-integration.md)
- [Azure Developer CLI 문제 해결](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전이 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.