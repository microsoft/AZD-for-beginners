# คู่มือการแก้ไขปัญหาเฉพาะ AI

**การนำทางบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 7 - การแก้ปัญหาและการดีบัก
- **⬅️ ก่อนหน้า**: [Debugging Guide](debugging.md)
- **➡️ บทถัดไป**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ที่เกี่ยวข้อง**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**ก่อนหน้า:** [Production AI Practices](../chapter-08-production/production-ai-practices.md) | **ถัดไป:** [AZD Basics](../chapter-01-foundation/azd-basics.md)

คำแนะนำการแก้ไขปัญหาเชิงครอบคลุมนี้ครอบคลุมปัญหาทั่วไปเมื่อปรับใช้โซลูชัน AI ด้วย AZD โดยให้แนวทางแก้ไขและเทคนิคการดีบักที่เฉพาะเจาะจงกับบริการ Azure AI

## สารบัญ

- [ปัญหาบริการ Azure OpenAI](../../../../docs/chapter-07-troubleshooting)
- [ปัญหา Azure AI Search](../../../../docs/chapter-07-troubleshooting)
- [ปัญหาการปรับใช้ Container Apps](../../../../docs/chapter-07-troubleshooting)
- [ข้อผิดพลาดการยืนยันตัวตนและสิทธิ์](../../../../docs/chapter-07-troubleshooting)
- [ข้อผิดพลาดการปรับใช้โมเดล](../../../../docs/chapter-07-troubleshooting)
- [ปัญหาด้านประสิทธิภาพและการปรับขนาด](../../../../docs/chapter-07-troubleshooting)
- [การจัดการค่าใช้จ่ายและโควต้า](../../../../docs/chapter-07-troubleshooting)
- [เครื่องมือและเทคนิคการดีบัก](../../../../docs/chapter-07-troubleshooting)

## ปัญหาบริการ Azure OpenAI

### ปัญหา: บริการ OpenAI ไม่พร้อมใช้งานในภูมิภาค

**อาการ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**สาเหตุ:**
- Azure OpenAI ไม่พร้อมใช้งานในภูมิภาคที่เลือก
- โควต้าในภูมิภาคที่ต้องการถูกใช้งานครบแล้ว
- ข้อจำกัดความจุในภูมิภาค

**แนวทางแก้ไข:**

1. **ตรวจสอบความพร้อมใช้งานของภูมิภาค:**
```bash
# แสดงรายการภูมิภาคที่มีสำหรับ OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **อัปเดตการกำหนดค่า AZD:**
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

**แนวทางแก้ไข:**

1. **ตรวจสอบโควต้าปัจจุบัน:**
```bash
# ตรวจสอบการใช้โควต้า
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ขอเพิ่มโควต้า:**
```bash
# ยื่นคำขอเพิ่มโควต้า
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **ปรับแต่งความจุของโมเดล:**
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

**แนวทางแก้ไข:**

1. **ใช้เวอร์ชัน API ที่รองรับ:**
```python
# ใช้เวอร์ชันที่รองรับล่าสุด
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **ตรวจสอบความเข้ากันได้ของเวอร์ชัน API:**
```bash
# แสดงรายการเวอร์ชัน API ที่รองรับ
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## ปัญหา Azure AI Search

### ปัญหา: ระดับราคาของบริการค้นหาไม่เพียงพอ

**อาการ:**
```
Error: Semantic search requires Basic tier or higher
```

**แนวทางแก้ไข:**

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

2. **ปิดการค้นหาเชิงความหมาย (สำหรับการพัฒนา):**
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

### ปัญหา: การสร้างดัชนีล้มเหลว

**อาการ:**
```
Error: Cannot create index, insufficient permissions
```

**แนวทางแก้ไข:**

1. **ตรวจสอบคีย์ของบริการค้นหา:**
```bash
# รับคีย์ผู้ดูแลระบบของบริการค้นหา
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ตรวจสอบสกีมาของดัชนี:**
```python
# ตรวจสอบสคีมาของดัชนี
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

### ปัญหา: การสร้างคอนเทนเนอร์ล้มเหลว

**อาการ:**
```
Error: Failed to build container image
```

**แนวทางแก้ไข:**

1. **ตรวจสอบไวยากรณ์ของ Dockerfile:**
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

2. **ตรวจสอบ dependencies:**
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

3. **เพิ่มการตรวจสอบสุขภาพ:**
```python
# main.py - เพิ่ม endpoint ตรวจสอบสถานะ
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### ปัญหา: การเริ่มต้นคอนเทนเนอร์แอปล้มเหลว

**อาการ:**
```
Error: Container failed to start within timeout period
```

**แนวทางแก้ไข:**

1. **เพิ่มเวลา timeout ในการเริ่มต้น:**
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
# โหลดโมเดลแบบเมื่อจำเป็นเพื่อลดเวลาเริ่มต้น
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
        # เริ่มต้นไคลเอนต์ AI ที่นี่
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # การเริ่มต้น
    app.state.model_manager = ModelManager()
    yield
    # การปิดระบบ
    pass

app = FastAPI(lifespan=lifespan)
```

## ข้อผิดพลาดการยืนยันตัวตนและสิทธิ์

### ปัญหา: สิทธิ์ถูกปฏิเสธสำหรับ Managed Identity

**อาการ:**
```
Error: Authentication failed for Azure OpenAI Service
```

**แนวทางแก้ไข:**

1. **ตรวจสอบการมอบหมายบทบาท:**
```bash
# ตรวจสอบการมอบหมายบทบาทปัจจุบัน
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **มอบหมายบทบาทที่จำเป็น:**
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
# ทดสอบการตรวจสอบสิทธิ์ด้วย Managed Identity
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

**แนวทางแก้ไข:**

1. **ให้สิทธิ์ Key Vault:**
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

## ข้อผิดพลาดการปรับใช้โมเดล

### ปัญหา: เวอร์ชันของโมเดลไม่พร้อมใช้งาน

**อาการ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**แนวทางแก้ไข:**

1. **ตรวจสอบโมเดลที่มีอยู่:**
```bash
# แสดงรายการโมเดลที่มีอยู่
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

3. **ยืนยันความถูกต้องของโมเดลก่อนการปรับใช้:**
```python
# การตรวจสอบความถูกต้องของโมเดลก่อนการปรับใช้
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

### ปัญหา: การตอบสนองหน่วงสูง

**อาการ:**
- เวลาตอบสนอง > 30 วินาที
- ข้อผิดพลาดหมดเวลา
- ประสบการณ์ผู้ใช้ไม่ดี

**แนวทางแก้ไข:**

1. **ใช้งานการหมดเวลาในการร้องขอ:**
```python
# ตั้งค่า timeout ให้เหมาะสม
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

2. **เพิ่มการแคชการตอบกลับ:**
```python
# แคช Redis สำหรับการตอบกลับ
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

3. **กำหนดค่าออโต้สเกล:**
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

**แนวทางแก้ไข:**

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

2. **ปรับให้การใช้หน่วยความจำมีประสิทธิภาพ:**
```python
# การจัดการโมเดลที่ประหยัดหน่วยความจำ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # ตรวจสอบการใช้หน่วยความจำก่อนการประมวลผล
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # บังคับให้เรียกการเก็บขยะ
            
        result = await self._process_ai_request(request)
        
        # ทำความสะอาดหลังการประมวลผล
        gc.collect()
        return result
```

## การจัดการค่าใช้จ่ายและโควต้า

### ปัญหา: ค่าใช้จ่ายสูงเกินคาด

**อาการ:**
- บิล Azure สูงกว่าที่คาด
- การใช้โทเค็นเกินการประเมิน
- แจ้งเตือนงบประมาณทำงาน

**แนวทางแก้ไข:**

1. **นำการควบคุมค่าใช้จ่ายมาใช้:**
```python
# การติดตามการใช้โทเค็น
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

2. **ตั้งค่าการแจ้งเตือนค่าใช้จ่าย:**
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

3. **ปรับแต่งการเลือกโมเดล:**
```python
# การเลือกโมเดลโดยคำนึงถึงค่าใช้จ่าย
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # ต่อ 1K โทเค็น
    'gpt-4': 0.03,          # ต่อ 1K โทเค็น
    'gpt-35-turbo': 0.0015  # ต่อ 1K โทเค็น
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
# เปิดการบันทึกอย่างละเอียด
azd up --debug

# ตรวจสอบสถานะการปรับใช้
azd show

# ดูบันทึกของแอปพลิเคชัน (จะเปิดแดชบอร์ดการตรวจสอบ)
azd monitor --logs

# ดูเมตริกแบบเรียลไทม์
azd monitor --live

# ตรวจสอบตัวแปรสภาพแวดล้อม
azd env get-values
```

### การดีบักแอปพลิเคชัน

1. **การบันทึกแบบมีโครงสร้าง:**
```python
import logging
import json

# กำหนดค่าการบันทึกแบบมีโครงสร้างสำหรับแอปพลิเคชัน AI
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

2. **จุดปลายตรวจสอบสุขภาพ:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # ตรวจสอบการเชื่อมต่อกับ OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # ตรวจสอบบริการค้นหา
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

## รหัสข้อผิดพลาดทั่วไปและแนวทางแก้ไข

| รหัสข้อผิดพลาด | คำอธิบาย | แนวทางแก้ไข |
|----------------|-----------|--------------|
| 401 | ไม่ได้รับอนุญาต | ตรวจสอบคีย์ API และการกำหนดค่า managed identity |
| 403 | การเข้าถึงถูกปฏิเสธ | ตรวจสอบการกำหนดบทบาท RBAC |
| 429 | ถูกจำกัดอัตรา | นำตรรกะการลองใหม่มาทำงานพร้อมการหน่วงแบบทวีคูณ |
| 500 | ข้อผิดพลาดภายในเซิร์ฟเวอร์ | ตรวจสอบสถานะการปรับใช้โมเดลและบันทึก |
| 503 | บริการไม่พร้อมใช้งาน | ตรวจสอบสุขภาพของบริการและความพร้อมใช้งานในภูมิภาค |

## ขั้นตอนถัดไป

1. **ทบทวน [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** สำหรับแนวทางปฏิบัติที่ดีที่สุดในการปรับใช้
2. **ทำให้เสร็จ [Production AI Practices](../chapter-08-production/production-ai-practices.md)** สำหรับโซลูชันที่พร้อมใช้งานระดับองค์กร
3. **เข้าร่วม [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** เพื่อขอการสนับสนุนจากชุมชน
4. **ส่งปัญหา** ไปยัง [AZD GitHub repository](https://github.com/Azure/azure-dev) สำหรับปัญหาเฉพาะ AZD

## ทรัพยากร

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**การนำทางบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 7 - การแก้ปัญหาและการดีบัก
- **⬅️ ก่อนหน้า**: [Debugging Guide](debugging.md)
- **➡️ บทถัดไป**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 ที่เกี่ยวข้อง**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [การแก้ไขปัญหา Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ข้อจำกัดความรับผิด:
เอกสารฉบับนี้ถูกแปลโดยใช้บริการแปลด้วยปัญญาประดิษฐ์ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้การแปลแม่นยำ โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อนได้ เอกสารต้นฉบับควรถือว่าเป็นแหล่งข้อมูลที่เป็นหลัก สำหรับข้อมูลที่มีความสำคัญ แนะนำให้ใช้การแปลโดยนักแปลมืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดใด ๆ ที่เกิดจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->