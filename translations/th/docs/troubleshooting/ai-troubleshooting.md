<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-21T07:44:42+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "th"
}
-->
# คู่มือการแก้ปัญหาเฉพาะทาง AI

**การนำทางบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 7 - การแก้ปัญหาและการดีบัก
- **⬅️ ก่อนหน้า**: [คู่มือการดีบัก](debugging.md)
- **➡️ บทถัดไป**: [บทที่ 8: รูปแบบการใช้งานในระดับองค์กร](../microsoft-foundry/production-ai-practices.md)
- **🤖 ที่เกี่ยวข้อง**: [บทที่ 2: การพัฒนาแบบ AI-First](../microsoft-foundry/microsoft-foundry-integration.md)

**ก่อนหน้า:** [การใช้งาน AI ในระดับองค์กร](../microsoft-foundry/production-ai-practices.md) | **ถัดไป:** [เริ่มต้นใช้งาน AZD](../getting-started/README.md)

คู่มือการแก้ปัญหาฉบับสมบูรณ์นี้ครอบคลุมปัญหาที่พบบ่อยเมื่อใช้งานโซลูชัน AI กับ AZD พร้อมทั้งวิธีแก้ไขและเทคนิคการดีบักที่เกี่ยวข้องกับบริการ Azure AI

## สารบัญ

- [ปัญหาบริการ Azure OpenAI](../../../../docs/troubleshooting)
- [ปัญหา Azure AI Search](../../../../docs/troubleshooting)
- [ปัญหาการปรับใช้ Container Apps](../../../../docs/troubleshooting)
- [ข้อผิดพลาดการยืนยันตัวตนและสิทธิ์](../../../../docs/troubleshooting)
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
# แสดงรายการภูมิภาคที่มีสำหรับ OpenAI
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
# ตรวจสอบการใช้งานโควต้า
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **ขอเพิ่มโควต้า:**
```bash
# ส่งคำขอเพิ่มโควตา
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **ปรับประสิทธิภาพการใช้โมเดล:**
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

### ปัญหา: การสร้างดัชนีล้มเหลว

**อาการ:**
```
Error: Cannot create index, insufficient permissions
```

**วิธีแก้ไข:**

1. **ตรวจสอบคีย์ของบริการ Search:**
```bash
# รับคีย์ผู้ดูแลระบบบริการค้นหา
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ตรวจสอบโครงสร้างดัชนี:**
```python
# ตรวจสอบความถูกต้องของสคีมาอินเด็กซ์
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
# main.py - เพิ่มจุดตรวจสุขภาพ
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

1. **เพิ่มเวลาเริ่มต้น:**
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

2. **ปรับประสิทธิภาพการโหลดโมเดล:**
```python
# โหลดโมเดลแบบ Lazy เพื่อลดเวลาเริ่มต้น
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
    # เริ่มต้นระบบ
    app.state.model_manager = ModelManager()
    yield
    # ปิดระบบ
    pass

app = FastAPI(lifespan=lifespan)
```

## ข้อผิดพลาดการยืนยันตัวตนและสิทธิ์

### ปัญหา: Managed Identity ถูกปฏิเสธสิทธิ์

**อาการ:**
```
Error: Authentication failed for Azure OpenAI Service
```

**วิธีแก้ไข:**

1. **ตรวจสอบการกำหนดบทบาท:**
```bash
# ตรวจสอบการกำหนดบทบาทปัจจุบัน
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
# ทดสอบการตรวจสอบสิทธิ์ด้วยการจัดการตัวตน
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

### ปัญหา: ไม่มีเวอร์ชันโมเดลที่พร้อมใช้งาน

**อาการ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**วิธีแก้ไข:**

1. **ตรวจสอบโมเดลที่พร้อมใช้งาน:**
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

3. **ตรวจสอบโมเดลก่อนการปรับใช้:**
```python
# การตรวจสอบความถูกต้องของโมเดลก่อนการใช้งาน
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

1. **ตั้งค่า Request Timeout:**
```python
# กำหนดค่าเวลาหมดอายุให้เหมาะสม
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

### ปัญหา: หน่วยความจำไม่เพียงพอ

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

2. **ปรับประสิทธิภาพการใช้หน่วยความจำ:**
```python
# การจัดการโมเดลที่ประหยัดหน่วยความจำ
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # ตรวจสอบการใช้งานหน่วยความจำก่อนการประมวลผล
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # บังคับการเก็บขยะ
            
        result = await self._process_ai_request(request)
        
        # ทำความสะอาดหลังการประมวลผล
        gc.collect()
        return result
```

## การจัดการต้นทุนและโควต้า

### ปัญหา: ต้นทุนสูงเกินคาด

**อาการ:**
- ค่าใช้จ่าย Azure สูงกว่าที่คาด
- การใช้ Token เกินประมาณการ
- การแจ้งเตือนงบประมาณถูกกระตุ้น

**วิธีแก้ไข:**

1. **ตั้งค่าการควบคุมต้นทุน:**
```python
# การติดตามการใช้งานโทเค็น
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

3. **ปรับประสิทธิภาพการเลือกโมเดล:**
```python
# การเลือกโมเดลที่คำนึงถึงต้นทุน
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
# เปิดใช้งานการบันทึกแบบละเอียด
azd up --debug

# ตรวจสอบสถานะการปรับใช้
azd show

# ดูบันทึกการปรับใช้
azd logs --follow

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

2. **Endpoints ตรวจสอบสุขภาพ:**
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

## รหัสข้อผิดพลาดทั่วไปและวิธีแก้ไข

| รหัสข้อผิดพลาด | คำอธิบาย | วิธีแก้ไข |
|------------------|-----------|------------|
| 401 | ไม่ได้รับอนุญาต | ตรวจสอบคีย์ API และการตั้งค่า Managed Identity |
| 403 | ถูกปฏิเสธ | ตรวจสอบการกำหนดบทบาท RBAC |
| 429 | เกินอัตรา | ใช้ตรรกะ Retry พร้อม Exponential Backoff |
| 500 | ข้อผิดพลาดภายในเซิร์ฟเวอร์ | ตรวจสอบสถานะการปรับใช้โมเดลและบันทึก |
| 503 | บริการไม่พร้อมใช้งาน | ตรวจสอบสุขภาพบริการและความพร้อมในภูมิภาค |

## ขั้นตอนถัดไป

1. **ทบทวน [คู่มือการปรับใช้โมเดล AI](ai-model-deployment.md)** สำหรับแนวทางปฏิบัติที่ดีที่สุดในการปรับใช้
2. **ทำ [การใช้งาน AI ในระดับองค์กร](production-ai-practices.md)** ให้เสร็จสมบูรณ์สำหรับโซลูชันที่พร้อมใช้งานในองค์กร
3. **เข้าร่วม [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** เพื่อรับการสนับสนุนจากชุมชน
4. **ส่งปัญหา** ไปยัง [AZD GitHub repository](https://github.com/Azure/azure-dev) สำหรับปัญหาเฉพาะ AZD

## แหล่งข้อมูล

- [การแก้ปัญหาบริการ Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [การแก้ปัญหา Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [การแก้ปัญหา Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**การนำทางบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 7 - การแก้ปัญหาและการดีบัก
- **⬅️ ก่อนหน้า**: [คู่มือการดีบัก](debugging.md)
- **➡️ บทถัดไป**: [บทที่ 8: รูปแบบการใช้งานในระดับองค์กร](../microsoft-foundry/production-ai-practices.md)
- **🤖 ที่เกี่ยวข้อง**: [บทที่ 2: การพัฒนาแบบ AI-First](../microsoft-foundry/microsoft-foundry-integration.md)
- [การแก้ปัญหา Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->