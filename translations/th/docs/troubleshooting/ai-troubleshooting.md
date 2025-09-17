<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c8ab8fd8ed338b3ec17484b453dcda68",
  "translation_date": "2025-09-17T23:01:04+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "th"
}
-->
# คู่มือแก้ไขปัญหาเฉพาะด้าน AI

**การนำทางบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 7 - การแก้ไขปัญหาและการดีบัก
- **⬅️ ก่อนหน้า**: [คู่มือการดีบัก](debugging.md)
- **➡️ บทถัดไป**: [บทที่ 8: รูปแบบการใช้งานในระดับผลิตและองค์กร](../ai-foundry/production-ai-practices.md)
- **🤖 ที่เกี่ยวข้อง**: [บทที่ 2: การพัฒนาแบบ AI-First](../ai-foundry/azure-ai-foundry-integration.md)

**ก่อนหน้า:** [การใช้งาน AI ในระดับผลิต](../ai-foundry/production-ai-practices.md) | **ถัดไป:** [เริ่มต้นใช้งาน AZD](../getting-started/README.md)

คู่มือการแก้ไขปัญหาฉบับสมบูรณ์นี้ครอบคลุมปัญหาทั่วไปที่เกิดขึ้นเมื่อปรับใช้โซลูชัน AI ด้วย AZD พร้อมทั้งวิธีแก้ไขและเทคนิคการดีบักที่เฉพาะเจาะจงสำหรับบริการ Azure AI

## สารบัญ

- [ปัญหาบริการ Azure OpenAI](../../../../docs/troubleshooting)
- [ปัญหา Azure AI Search](../../../../docs/troubleshooting)
- [ปัญหาการปรับใช้ Container Apps](../../../../docs/troubleshooting)
- [ข้อผิดพลาดด้านการยืนยันตัวตนและสิทธิ์](../../../../docs/troubleshooting)
- [ความล้มเหลวในการปรับใช้โมเดล](../../../../docs/troubleshooting)
- [ปัญหาด้านประสิทธิภาพและการปรับขนาด](../../../../docs/troubleshooting)
- [การจัดการต้นทุนและโควต้า](../../../../docs/troubleshooting)
- [เครื่องมือและเทคนิคการดีบัก](../../../../docs/troubleshooting)

## ปัญหาบริการ Azure OpenAI

### ปัญหา: บริการ OpenAI ไม่พร้อมใช้งานในภูมิภาค

**อาการ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**สาเหตุ:**
- Azure OpenAI ไม่พร้อมใช้งานในภูมิภาคที่เลือก
- โควต้าถูกใช้หมดในภูมิภาคที่ต้องการ
- ข้อจำกัดด้านความจุในภูมิภาค

**วิธีแก้ไข:**

1. **ตรวจสอบความพร้อมใช้งานในภูมิภาค:**
```bash
# List available regions for OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **อัปเดตการตั้งค่า AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **ใช้ภูมิภาคทางเลือก:**
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

### ปัญหา: โควต้าการปรับใช้โมเดลเกิน

**อาการ:**
```
Error: Deployment failed due to insufficient quota
```

**วิธีแก้ไข:**

1. **ตรวจสอบโควต้าปัจจุบัน:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ขอเพิ่มโควต้า:**
```bash
# Submit quota increase request
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **ปรับประสิทธิภาพการใช้ความจุของโมเดล:**
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

### ปัญหา: เวอร์ชัน API ไม่ถูกต้อง

**อาการ:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**วิธีแก้ไข:**

1. **ใช้เวอร์ชัน API ที่รองรับ:**
```python
# Use latest supported version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **ตรวจสอบความเข้ากันได้ของเวอร์ชัน API:**
```bash
# List supported API versions
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## ปัญหา Azure AI Search

### ปัญหา: ระดับราคาของบริการ Search ไม่เพียงพอ

**อาการ:**
```
Error: Semantic search requires Basic tier or higher
```

**วิธีแก้ไข:**

1. **อัปเกรดระดับราคา:**
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

2. **ปิดการใช้งาน Semantic Search (สำหรับการพัฒนา):**
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

### ปัญหา: การสร้าง Index ล้มเหลว

**อาการ:**
```
Error: Cannot create index, insufficient permissions
```

**วิธีแก้ไข:**

1. **ตรวจสอบคีย์ของบริการ Search:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ตรวจสอบโครงสร้าง Index:**
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

3. **ใช้ Managed Identity:**
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

## ปัญหาการปรับใช้ Container Apps

### ปัญหา: การสร้าง Container ล้มเหลว

**อาการ:**
```
Error: Failed to build container image
```

**วิธีแก้ไข:**

1. **ตรวจสอบไวยากรณ์ Dockerfile:**
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

2. **ตรวจสอบความถูกต้องของ Dependencies:**
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

3. **เพิ่ม Health Check:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### ปัญหา: การเริ่มต้น Container App ล้มเหลว

**อาการ:**
```
Error: Container failed to start within timeout period
```

**วิธีแก้ไข:**

1. **เพิ่มระยะเวลาการเริ่มต้น:**
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

2. **ปรับปรุงการโหลดโมเดล:**
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

## ข้อผิดพลาดด้านการยืนยันตัวตนและสิทธิ์

### ปัญหา: Managed Identity ถูกปฏิเสธสิทธิ์

**อาการ:**
```
Error: Authentication failed for Azure OpenAI Service
```

**วิธีแก้ไข:**

1. **ตรวจสอบการกำหนดบทบาท:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **กำหนดบทบาทที่จำเป็น:**
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

3. **ทดสอบการยืนยันตัวตน:**
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

### ปัญหา: การเข้าถึง Key Vault ถูกปฏิเสธ

**อาการ:**
```
Error: The user, group or application does not have secrets get permission
```

**วิธีแก้ไข:**

1. **ให้สิทธิ์การเข้าถึง Key Vault:**
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

2. **ใช้ RBAC แทนนโยบายการเข้าถึง:**
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

## ความล้มเหลวในการปรับใช้โมเดล

### ปัญหา: เวอร์ชันโมเดลไม่พร้อมใช้งาน

**อาการ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**วิธีแก้ไข:**

1. **ตรวจสอบโมเดลที่พร้อมใช้งาน:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **ใช้โมเดลสำรอง:**
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

3. **ตรวจสอบความถูกต้องของโมเดลก่อนปรับใช้:**
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

## ปัญหาด้านประสิทธิภาพและการปรับขนาด

### ปัญหา: การตอบสนองล่าช้า

**อาการ:**
- เวลาตอบสนอง > 30 วินาที
- ข้อผิดพลาด Timeout
- ประสบการณ์ผู้ใช้ไม่ดี

**วิธีแก้ไข:**

1. **ตั้งค่าการหมดเวลาของคำขอ:**
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

2. **เพิ่มการแคชการตอบสนอง:**
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

3. **ตั้งค่าการปรับขนาดอัตโนมัติ:**
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

### ปัญหา: ข้อผิดพลาดหน่วยความจำหมด

**อาการ:**
```
Error: Container killed due to memory limit exceeded
```

**วิธีแก้ไข:**

1. **เพิ่มการจัดสรรหน่วยความจำ:**
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

2. **ปรับปรุงการใช้หน่วยความจำ:**
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

## การจัดการต้นทุนและโควต้า

### ปัญหา: ค่าใช้จ่ายสูงเกินคาด

**อาการ:**
- ค่าใช้จ่าย Azure สูงกว่าที่คาด
- การใช้โทเค็นเกินประมาณการ
- การแจ้งเตือนงบประมาณถูกเรียกใช้งาน

**วิธีแก้ไข:**

1. **ตั้งค่าการควบคุมต้นทุน:**
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

2. **ตั้งค่าการแจ้งเตือนต้นทุน:**
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

3. **ปรับปรุงการเลือกโมเดล:**
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

## เครื่องมือและเทคนิคการดีบัก

### คำสั่งดีบัก AZD

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

### การดีบักแอปพลิเคชัน

1. **การบันทึกแบบมีโครงสร้าง:**
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

2. **Endpoints ตรวจสอบสุขภาพ:**
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

3. **การตรวจสอบประสิทธิภาพ:**
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

## รหัสข้อผิดพลาดทั่วไปและวิธีแก้ไข

| รหัสข้อผิดพลาด | คำอธิบาย | วิธีแก้ไข |
|-----------------|-----------|------------|
| 401 | ไม่ได้รับอนุญาต | ตรวจสอบคีย์ API และการตั้งค่า Managed Identity |
| 403 | ถูกปฏิเสธ | ตรวจสอบการกำหนดบทบาท RBAC |
| 429 | ถูกจำกัดอัตรา | ใช้ตรรกะการลองใหม่พร้อมการเพิ่มเวลารอ |
| 500 | ข้อผิดพลาดภายในเซิร์ฟเวอร์ | ตรวจสอบสถานะการปรับใช้โมเดลและบันทึก |
| 503 | บริการไม่พร้อมใช้งาน | ตรวจสอบสุขภาพบริการและความพร้อมใช้งานในภูมิภาค |

## ขั้นตอนถัดไป

1. **ทบทวน [คู่มือการปรับใช้โมเดล AI](ai-model-deployment.md)** สำหรับแนวทางปฏิบัติที่ดีที่สุดในการปรับใช้
2. **ทำให้เสร็จสิ้น [การใช้งาน AI ในระดับผลิต](production-ai-practices.md)** สำหรับโซลูชันที่พร้อมใช้งานในองค์กร
3. **เข้าร่วม [Azure AI Foundry Discord](https://aka.ms/foundry/discord)** เพื่อรับการสนับสนุนจากชุมชน
4. **ส่งปัญหา** ไปยัง [AZD GitHub repository](https://github.com/Azure/azure-dev) สำหรับปัญหาเฉพาะ AZD

## แหล่งข้อมูล

- [การแก้ไขปัญหาบริการ Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [การแก้ไขปัญหา Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [การแก้ไขปัญหา Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**การนำทางบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 7 - การแก้ไขปัญหาและการดีบัก
- **⬅️ ก่อนหน้า**: [คู่มือการดีบัก](debugging.md)
- **➡️ บทถัดไป**: [บทที่ 8: รูปแบบการใช้งานในระดับผลิตและองค์กร](../ai-foundry/production-ai-practices.md)
- **🤖 ที่เกี่ยวข้อง**: [บทที่ 2: การพัฒนาแบบ AI-First](../ai-foundry/azure-ai-foundry-integration.md)
- [การแก้ไขปัญหา Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาที่เป็นต้นฉบับควรถือว่าเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้