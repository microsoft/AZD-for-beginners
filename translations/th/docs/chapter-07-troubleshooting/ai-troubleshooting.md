# คู่มือแก้ไขปัญหาเฉพาะ AI

**การนำทางบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 7 - การแก้ไขปัญหาและการดีบั๊ก
- **⬅️ ก่อนหน้า**: [คู่มือดีบั๊ก](debugging.md)
- **➡️ บทถัดไป**: [บทที่ 8: รูปแบบการผลิตและองค์กร](../chapter-08-production/production-ai-practices.md)
- **🤖 ที่เกี่ยวข้อง**: [บทที่ 2: การพัฒนา AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

คู่มือการแก้ไขปัญหาครอบคลุมนี้ครอบคลุมปัญหาทั่วไปเมื่อปรับใช้โซลูชัน AI ด้วย AZD โดยให้วิธีแก้ไขและเทคนิคการดีบั๊กเฉพาะบริการ Azure AI

## สารบัญ

- [ปัญหาบริการ Microsoft Foundry Models](#azure-openai-service-issues)
- [ปัญหา Azure AI Search](#ปัญหา-azure-ai-search)
- [ปัญหาการปรับใช้ Container Apps](#ปัญหาการปรับใช้-container-apps)
- [ข้อผิดพลาดการตรวจสอบสิทธิ์และสิทธิ์](#ข้อผิดพลาดการตรวจสอบสิทธิ์และสิทธิ์)
- [ข้อผิดพลาดการปรับใช้โมเดล](#ข้อผิดพลาดการปรับใช้โมเดล)
- [ปัญหาด้านประสิทธิภาพและการปรับขนาด](#ปัญหาด้านประสิทธิภาพและการปรับขนาด)
- [การจัดการค่าใช้จ่ายและโควต้า](#การจัดการค่าใช้จ่ายและโควต้า)
- [เครื่องมือและเทคนิคการดีบั๊ก](#เครื่องมือและเทคนิคการดีบั๊ก)

## ปัญหาบริการ Microsoft Foundry Models

### ปัญหา: บริการ OpenAI ไม่พร้อมใช้งานในภูมิภาค

**อาการ:**
```
Error: The requested resource type is not available in the location 'westus'
```

**สาเหตุ:**
- Microsoft Foundry Models ไม่พร้อมใช้งานในภูมิภาคที่เลือก
- โควต้าใช้หมดในภูมิภาคที่ต้องการ
- ข้อจำกัดความจุในภูมิภาค

**วิธีแก้ไข:**

1. **ตรวจสอบความพร้อมใช้งานของภูมิภาค:**
```bash
# แสดงรายการภูมิภาคที่มีให้สำหรับ OpenAI
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

### ปัญหา: โควต้าการปรับใช้โมเดลเกินขีดจำกัด

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
# ส่งคำขอเพิ่มโควต้า
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

### ปัญหา: ระดับราคาบริการค้นหาไม่เพียงพอ

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

1. **ตรวจสอบคีย์บริการค้นหา:**
```bash
# รับคีย์ผู้ดูแลระบบบริการค้นหา
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **ตรวจสอบสคีมาดัชนี:**
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

2. **ตรวจสอบความถูกต้องของ dependencies:**
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
# main.py - เพิ่มจุดเช็คสุขภาพ (health check endpoint)
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### ปัญหา: Container App เริ่มต้นล้มเหลว

**อาการ:**
```
Error: Container failed to start within timeout period
```

**วิธีแก้ไข:**

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

2. **ปรับแต่งการโหลดโมเดล:**
```python
# โหลดโมเดลแบบขี้เกียจเพื่อลดเวลาการเริ่มต้น
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

## ข้อผิดพลาดการตรวจสอบสิทธิ์และสิทธิ์

### ปัญหา: สิทธิ์ Managed Identity ถูกปฏิเสธ

**อาการ:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**วิธีแก้ไข:**

1. **ตรวจสอบการมอบหมายบทบาท:**
```bash
# ตรวจสอบการมอบหมายบทบาทในปัจจุบัน
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

3. **ทดสอบการตรวจสอบสิทธิ์:**
```python
# ทดสอบการตรวจสอบสิทธิ์ด้วย managed identity
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

### ปัญหา: เวอร์ชันโมเดลไม่พร้อมใช้งาน

**อาการ:**
```
Error: Model version 'gpt-4-32k' is not available
```

**วิธีแก้ไข:**

1. **ตรวจสอบโมเดลที่มีอยู่:**
```bash
# แสดงรายชื่อโมเดลที่มีอยู่
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **ใช้ fallback ของโมเดล:**
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

3. **ตรวจสอบโมเดลก่อนปรับใช้:**
```python
# การตรวจสอบความถูกต้องของโมเดลก่อนการใช้งานจริง
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

### ปัญหา: การตอบสนองมีความล่าช้าสูง

**อาการ:**
- เวลาตอบสนอง > 30 วินาที
- เกิดข้อผิดพลาด timeout
- ประสบการณ์ผู้ใช้ไม่ดี

**วิธีแก้ไข:**

1. **กำหนดระยะเวลา timeout สำหรับคำขอ:**
```python
# กำหนดเวลาหมดอายุที่เหมาะสม
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

3. **ตั้งค่า auto-scaling:**
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

### ปัญหา: ข้อผิดพลาด Memory Out of Errors

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

2. **ปรับแต่งการใช้งานหน่วยความจำ:**
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
            gc.collect()  # บังคับการเก็บขยะ
            
        result = await self._process_ai_request(request)
        
        # ทำความสะอาดหลังการประมวลผล
        gc.collect()
        return result
```

## การจัดการค่าใช้จ่ายและโควต้า

### ปัญหา: ค่าใช้จ่ายสูงเกินคาด

**อาการ:**
- บิล Azure สูงกว่าที่คาดไว้
- การใช้โทเค็นเกินประมาณการณ์
- แจ้งเตือนงบประมาณเกิดขึ้น

**วิธีแก้ไข:**

1. **ตั้งค่าควบคุมค่าใช้จ่าย:**
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

## เครื่องมือและเทคนิคการดีบั๊ก

### คำสั่งดีบั๊ก AZD

```bash
# เปิดใช้งานการบันทึกแบบละเอียด
azd up --debug

# ตรวจสอบสถานะการปรับใช้
azd show

# ดูบันทึกแอปพลิเคชัน (เปิดแผงควบคุมการตรวจสอบ)
azd monitor --logs

# ดูเมตริกแบบเรียลไทม์
azd monitor --live

# ตรวจสอบตัวแปรแวดล้อม
azd env get-values
```

### คำสั่ง AZD AI Extension สำหรับการวินิจฉัย

ถ้าคุณได้ปรับใช้ agents โดยใช้ `azd ai agent init` เครื่องมือเพิ่มเติมเหล่านี้จะพร้อมใช้งาน:

```bash
# ตรวจสอบให้แน่ใจว่าได้ติดตั้งส่วนขยาย agents แล้ว
azd extension install azure.ai.agents

# เริ่มต้นใหม่หรื่ออัปเดตเอเจนต์จากไฟล์ manifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ใช้เซิร์ฟเวอร์ MCP เพื่อให้เครื่องมือ AI สามารถสอบถามสถานะโครงการได้
azd mcp start

# สร้างไฟล์โครงสร้างพื้นฐานสำหรับการตรวจสอบและการตรวจสอบย้อนหลัง
azd infra generate
```

> **เคล็ดลับ:** ใช้ `azd infra generate` เพื่อเขียน IaC ลงดิสก์ เพื่อให้คุณตรวจสอบได้ชัดเจนว่าได้จัดเตรียมทรัพยากรอะไรบ้าง ซึ่งมีประโยชน์มากเมื่อดีบั๊กปัญหาการกำหนดค่าทรัพยากร ดูรายละเอียดเพิ่มเติมได้ที่ [การอ้างอิง AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)

### การดีบั๊กแอปพลิเคชัน

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

2. **จุดสิ้นสุดตรวจสอบสุขภาพ:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # ตรวจสอบการเชื่อมต่อ OpenAI
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
|------------|-------------|----------|
| 401 | ไม่ได้รับอนุญาต | ตรวจสอบคีย์ API และการตั้งค่า managed identity |
| 403 | ถูกปฏิเสธ | ยืนยันการมอบหมายบทบาท RBAC |
| 429 | ถูกจำกัดอัตรา | ใช้ตรรกะ retry พร้อม backoff แบบ exponential |
| 500 | ข้อผิดพลาดภายในเซิร์ฟเวอร์ | ตรวจสอบสถานะและบันทึกการปรับใช้โมเดล |
| 503 | บริการไม่พร้อมใช้งาน | ตรวจสอบสุขภาพบริการและความพร้อมใช้งานภูมิภาค |

## ขั้นตอนถัดไป

1. **ทบทวน [คู่มือการปรับใช้โมเดล AI](../chapter-02-ai-development/ai-model-deployment.md)** สำหรับแนวทางปฏิบัติที่ดีในการปรับใช้
2. **ทำความเข้าใจ [แนวทางปฏิบัติ AI ในการผลิต](../chapter-08-production/production-ai-practices.md)** สำหรับโซลูชันพร้อมใช้งานองค์กร
3. **เข้าร่วม [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** เพื่อรับการสนับสนุนจากชุมชน
4. **ส่งปัญหา** ไปยัง [ที่เก็บโค้ด AZD บน GitHub](https://github.com/Azure/azure-dev) สำหรับปัญหาเฉพาะ AZD

## แหล่งข้อมูล

- [การแก้ไขปัญหาบริการ Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [การแก้ไขปัญหา Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [การแก้ไขปัญหา Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**ทักษะตัวแทนวินิจฉัย Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - ติดตั้งทักษะการแก้ไขปัญหา Azure ใน editor ของคุณ: `npx skills add microsoft/github-copilot-for-azure`

---

**การนำทางบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 7 - การแก้ไขปัญหาและการดีบั๊ก
- **⬅️ ก่อนหน้า**: [คู่มือดีบั๊ก](debugging.md)
- **➡️ บทถัดไป**: [บทที่ 8: รูปแบบการผลิตและองค์กร](../chapter-08-production/production-ai-practices.md)
- **🤖 ที่เกี่ยวข้อง**: [บทที่ 2: การพัฒนา AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 อ้างอิง**: [การแก้ไขปัญหา Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**คำปฏิเสธความรับผิดชอบ**:  
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้ความถูกต้องสูงสุด โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางถือเป็นแหล่งข้อมูลที่ถูกต้องและน่าเชื่อถือ สำหรับข้อมูลที่สำคัญควรใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->