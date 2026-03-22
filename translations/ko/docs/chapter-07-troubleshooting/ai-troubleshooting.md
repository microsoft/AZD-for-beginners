# AI 전용 문제 해결 가이드

**챕터 내비게이션:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 7장 - 문제 해결 및 디버깅
- **⬅️ 이전**: [디버깅 가이드](debugging.md)
- **➡️ 다음 챕터**: [8장: 프로덕션 및 엔터프라이즈 패턴](../chapter-08-production/production-ai-practices.md)
- **🤖 관련**: [2장: AI-우선 개발](../chapter-02-ai-development/microsoft-foundry-integration.md)

이 포괄적인 문제 해결 가이드는 AZD로 AI 솔루션을 배포할 때 발생하는 일반적인 문제에 대해 다루며, Azure AI 서비스에 특화된 솔루션과 디버깅 기술을 제공합니다.

## 목차

- [Microsoft Foundry 모델 서비스 문제](#azure-openai-service-issues)
- [Azure AI 검색 문제](#azure-ai-검색-문제)
- [컨테이너 앱 배포 문제](#컨테이너-앱-배포-문제)
- [인증 및 권한 오류](#인증-및-권한-오류)
- [모델 배포 실패](#모델-배포-실패)
- [성능 및 확장 문제](#성능-및-확장-문제)
- [비용 및 쿼터 관리](#비용-및-쿼터-관리)
- [디버깅 도구 및 기법](#디버깅-도구-및-기법)

## Microsoft Foundry 모델 서비스 문제

### 문제: 지역에서 OpenAI 서비스 사용 불가

**증상:**
```
Error: The requested resource type is not available in the location 'westus'
```

**원인:**
- 선택한 지역에 Microsoft Foundry 모델이 제공되지 않음
- 선호 지역에서 쿼터 초과
- 지역별 용량 제약

**해결책:**

1. **지역 가용성 확인:**
```bash
# OpenAI에서 사용할 수 있는 지역 목록
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

### 문제: 모델 배포 쿼터 초과

**증상:**
```
Error: Deployment failed due to insufficient quota
```

**해결책:**

1. **현재 쿼터 확인:**
```bash
# 할당량 사용량 확인
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **쿼터 증가 요청:**
```bash
# 할당량 증대 요청 제출
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

### 문제: 유효하지 않은 API 버전

**증상:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**해결책:**

1. **지원되는 API 버전 사용:**
```python
# 최신 지원 버전을 사용하세요
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API 버전 호환성 확인:**
```bash
# 지원되는 API 버전 목록
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI 검색 문제

### 문제: 검색 서비스 가격 책정 등급 부족

**증상:**
```
Error: Semantic search requires Basic tier or higher
```

**해결책:**

1. **가격 책정 등급 업그레이드:**
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

2. **의미 기반 검색 비활성화(개발용):**
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
# 검색 서비스 관리자 키 가져오기
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **인덱스 스키마 확인:**
```python
# 인덱스 스키마 유효성 검사
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

3. **관리되는 ID 사용:**
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

1. **Dockerfile 문법 확인:**
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

2. **종속성 검증:**
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
# main.py - 상태 확인 엔드포인트 추가
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
# 시작 시간을 줄이기 위해 모델을 지연 로드합니다
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
        # 여기에서 AI 클라이언트를 초기화합니다
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # 시작
    app.state.model_manager = ModelManager()
    yield
    # 종료
    pass

app = FastAPI(lifespan=lifespan)
```

## 인증 및 권한 오류

### 문제: 관리되는 ID 권한 거부

**증상:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**해결책:**

1. **역할 할당 확인:**
```bash
# 현재 역할 할당을 확인하세요
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
# 관리 ID 인증 테스트
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

### 문제: 키 볼트 접근 거부

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
# 사용 가능한 모델 목록
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **모델 폴백 사용:**
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

3. **배포 전 모델 검증:**
```python
# 배포 전 모델 검증
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

### 문제: 높은 지연 응답

**증상:**
- 응답 시간 > 30초
- 타임아웃 오류
- 좋지 않은 사용자 경험

**해결책:**

1. **요청 타임아웃 구현:**
```python
# 적절한 타임아웃 구성
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
# 응답을 위한 Redis 캐시
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
# 메모리 효율적인 모델 처리
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # 처리 전에 메모리 사용량 확인
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # 강제 가비지 수집
            
        result = await self._process_ai_request(request)
        
        # 처리 후 정리 작업
        gc.collect()
        return result
```

## 비용 및 쿼터 관리

### 문제: 예상치 못한 높은 비용

**증상:**
- 예상보다 높은 Azure 청구서
- 추산치를 초과하는 토큰 사용량
- 예산 알림 발생

**해결책:**

1. **비용 통제 구현:**
```python
# 토큰 사용 추적
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
# 비용 인지 모델 선택
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # 1,000 토큰당
    'gpt-4.1': 0.03,          # 1,000 토큰당
    'gpt-35-turbo': 0.0015  # 1,000 토큰당
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

## 디버깅 도구 및 기법

### AZD 디버깅 명령어

```bash
# 상세 로깅 활성화
azd up --debug

# 배포 상태 확인
azd show

# 애플리케이션 로그 보기 (모니터링 대시보드 열기)
azd monitor --logs

# 실시간 지표 보기
azd monitor --live

# 환경 변수 확인
azd env get-values
```

### 진단용 AZD AI 확장 명령어

`azd ai agent init`로 에이전트를 배포한 경우, 추가 도구를 사용할 수 있습니다:

```bash
# 에이전트 확장 프로그램이 설치되어 있는지 확인하십시오
azd extension install azure.ai.agents

# 매니페스트에서 에이전트를 재초기화하거나 업데이트하십시오
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# MCP 서버를 사용하여 AI 도구가 프로젝트 상태를 조회하도록 하십시오
azd mcp start

# 검토 및 감사를 위한 인프라 파일을 생성하십시오
azd infra generate
```

> **팁:** `azd infra generate`를 사용하여 IaC를 디스크에 기록하여 어떤 리소스가 프로비전되었는지 정확히 확인할 수 있습니다. 이는 리소스 구성 문제를 디버깅할 때 매우 유용합니다. 자세한 내용은 [AZD AI CLI 참조](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)를 참조하세요.

### 애플리케이션 디버깅

1. **구조화된 로깅:**
```python
import logging
import json

# AI 애플리케이션을 위한 구조화된 로깅 구성
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
    
    # OpenAI 연결 상태 확인
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # 검색 서비스 확인
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

## 일반 오류 코드 및 해결책

| 오류 코드 | 설명 | 해결책 |
|------------|-------------|----------|
| 401 | 인증되지 않음 | API 키 및 관리되는 ID 구성 확인 |
| 403 | 금지됨 | RBAC 역할 할당 확인 |
| 429 | 속도 제한됨 | 지수 백오프를 사용하는 재시도 로직 구현 |
| 500 | 내부 서버 오류 | 모델 배포 상태 및 로그 확인 |
| 503 | 서비스 사용 불가 | 서비스 상태 및 지역 가용성 확인 |

## 다음 단계

1. <strong>[AI 모델 배포 가이드](../chapter-02-ai-development/ai-model-deployment.md)</strong>에서 배포 모범 사례 검토
2. **[프로덕션 AI 실무](../chapter-08-production/production-ai-practices.md)** 완료하여 엔터프라이즈 준비 솔루션 습득
3. <strong>[Microsoft Foundry Discord](https://aka.ms/foundry/discord)</strong>에 가입하여 커뮤니티 지원 받기
4. <strong>[AZD GitHub 저장소](https://github.com/Azure/azure-dev)</strong>에 AZD 관련 문제 제기

## 리소스

- [Microsoft Foundry 모델 서비스 문제 해결](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [컨테이너 앱 문제 해결](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI 검색 문제 해결](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - 편집기에 Azure 문제 해결 기능 설치: `npx skills add microsoft/github-copilot-for-azure`

---

**챕터 내비게이션:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 7장 - 문제 해결 및 디버깅
- **⬅️ 이전**: [디버깅 가이드](debugging.md)
- **➡️ 다음 챕터**: [8장: 프로덕션 및 엔터프라이즈 패턴](../chapter-08-production/production-ai-practices.md)
- **🤖 관련**: [2장: AI-우선 개발](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 참조**: [Azure 개발자 CLI 문제 해결](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역은 오류나 부정확성을 포함할 수 있음을 유의하시기 바랍니다. 원본 문서는 해당 언어로 된 원문이 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우, 전문적인 사람 번역을 권장합니다. 본 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->