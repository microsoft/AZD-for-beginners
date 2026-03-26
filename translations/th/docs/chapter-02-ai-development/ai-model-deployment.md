# การติดตั้งโมเดล AI ด้วย Azure Developer CLI

**การนำทางบทเรียน:**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI-First
- **⬅️ ก่อนหน้า**: [การรวม Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ ถัดไป**: [ห้องปฏิบัติการเวิร์กช็อป AI](ai-workshop-lab.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

คำแนะนำนี้ให้ข้อมูลอย่างครบถ้วนสำหรับการติดตั้งโมเดล AI โดยใช้เทมเพลต AZD ครอบคลุมตั้งแต่การเลือกโมเดลจนถึงรูปแบบการติดตั้งสู่สภาพแวดล้อมการผลิต

## สารบัญ

- [กลยุทธ์การเลือกโมเดล](../../../../docs/chapter-02-ai-development)
- [การกำหนดค่า AZD สำหรับโมเดล AI](../../../../docs/chapter-02-ai-development)
- [รูปแบบการติดตั้ง](../../../../docs/chapter-02-ai-development)
- [การจัดการโมเดล](../../../../docs/chapter-02-ai-development)
- [พิจารณาสำหรับการผลิต](../../../../docs/chapter-02-ai-development)
- [การตรวจสอบและการสังเกตการณ์](../../../../docs/chapter-02-ai-development)

## กลยุทธ์การเลือกโมเดล

### โมเดล Microsoft Foundry

เลือกโมเดลที่เหมาะสมกับกรณีการใช้งานของคุณ:

```yaml
# azure.yaml - Model configuration
services:
  ai-service:
    project: ./infra
    host: containerapp
    config:
      AZURE_OPENAI_MODELS: |
        [
          {
            "name": "gpt-4.1-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4.1-mini",
            "capacity": 10,
            "format": "OpenAI"
          },
          {
            "name": "text-embedding-ada-002",
            "version": "2",
            "deployment": "text-embedding-ada-002", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### การวางแผนความจุของโมเดล

| ประเภทโมเดล | กรณีการใช้งาน | ความจุที่แนะนำ | การพิจารณาค่าใช้จ่าย |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | การแชท, ถาม-ตอบ | 10-50 TPM | ประหยัดสำหรับงานส่วนใหญ่ |
| gpt-4.1 | การให้เหตุผลซับซ้อน | 20-100 TPM | ค่าใช้จ่ายสูงกว่า ใช้สำหรับฟีเจอร์พรีเมียม |
| Text-embedding-ada-002 | การค้นหา, RAG | 30-120 TPM | สำคัญสำหรับการค้นหาความหมาย |
| Whisper | การแปลงเสียงเป็นข้อความ | 10-50 TPM | งานประมวลผลเสียง |

## การกำหนดค่า AZD สำหรับโมเดล AI

### การกำหนดค่าเทมเพลต Bicep

สร้างการติดตั้งโมเดลผ่านเทมเพลต Bicep:

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-ada-002'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    sku: {
      name: 'Standard'
      capacity: 30
    }
  }
]

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAiAccountName
  location: location
  kind: 'OpenAI'
  properties: {
    customSubDomainName: openAiAccountName
    networkAcls: {
      defaultAction: 'Allow'
    }
    publicNetworkAccess: 'Enabled'
  }
  sku: {
    name: 'S0'
  }
}

@batchSize(1)
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = [for deployment in openAiModelDeployments: {
  parent: openAi
  name: deployment.name
  properties: {
    model: deployment.model
  }
  sku: deployment.sku
}]
```

### ตัวแปรสภาพแวดล้อม

กำหนดค่าสภาพแวดล้อมของแอปพลิเคชันของคุณ:

```bash
# การกำหนดค่า .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## รูปแบบการติดตั้ง

### รูปแบบที่ 1: การติดตั้งในภูมิภาคเดียว

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

เหมาะสำหรับ:
- การพัฒนาและทดสอบ
- แอปพลิเคชันตลาดเดียว
- การประหยัดต้นทุน

### รูปแบบที่ 2: การติดตั้งหลายภูมิภาค

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

เหมาะสำหรับ:
- แอปพลิเคชันระดับโลก
- ความต้องการความพร้อมใช้งานสูง
- การกระจายโหลด

### รูปแบบที่ 3: การติดตั้งแบบผสมผสาน

รวมโมเดล Microsoft Foundry กับบริการ AI อื่นๆ:

```bicep
// Hybrid AI services
resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: cognitiveServicesName
  location: location
  kind: 'CognitiveServices'
  properties: {
    customSubDomainName: cognitiveServicesName
  }
  sku: {
    name: 'S0'
  }
}

resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  properties: {
    customSubDomainName: documentIntelligenceName
  }
  sku: {
    name: 'S0'
  }
}
```

## การจัดการโมเดล

### การควบคุมเวอร์ชัน

ติดตามเวอร์ชันโมเดลในกำหนดค่า AZD ของคุณ:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2024-07-18",
      "fallback": "gpt-35-turbo"
    },
    "embedding": {
      "name": "text-embedding-ada-002",
      "version": "2"
    }
  }
}
```

### การอัปเดตโมเดล

ใช้ hooks ของ AZD สำหรับการอัปเดตโมเดล:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### การทดสอบ A/B

ติดตั้งเวอร์ชันโมเดลหลายเวอร์ชัน:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## พิจารณาสำหรับการผลิต

### การวางแผนความจุ

คำนวณความจุที่ต้องการตามรูปแบบการใช้งาน:

```python
# ตัวอย่างการคำนวณความจุ
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return int(total_tpm * (1 + safety_margin))

# ตัวอย่างการใช้งาน
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### การกำหนดค่าอัตโนมัติการปรับขนาด

กำหนดค่าอัตโนมัติการปรับขนาดสำหรับ Container Apps:

```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  name: containerAppName
  properties: {
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-rule'
            http: {
              metadata: {
                concurrentRequests: '10'
              }
            }
          }
          {
            name: 'cpu-rule'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'
              }
            }
          }
        ]
      }
    }
  }
}
```

### การเพิ่มประสิทธิภาพค่าใช้จ่าย

ดำเนินมาตรการควบคุมค่าใช้จ่าย:

```bicep
@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 1000
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@yourcompany.com'
        ]
      }
    }
  }
}
```

## การตรวจสอบและการสังเกตการณ์

### การบูรณาการ Application Insights

กำหนดค่าการตรวจสอบสำหรับงาน AI:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI models
resource aiMetrics 'Microsoft.Insights/components/analyticsItems@2020-02-02' = {
  parent: applicationInsights
  name: 'ai-model-metrics'
  properties: {
    content: '''
      customEvents
      | where name == "AI_Model_Request"
      | extend model = tostring(customDimensions.model)
      | extend tokens = toint(customDimensions.tokens)
      | extend latency = toint(customDimensions.latency_ms)
      | summarize 
          requests = count(),
          avg_tokens = avg(tokens),
          avg_latency = avg(latency)
        by model, bin(timestamp, 5m)
    '''
    type: 'query'
    scope: 'shared'
  }
}
```

### เมตริกแบบกำหนดเอง

ติดตามเมตริกเฉพาะ AI:

```python
# เทเลเมทรีที่กำหนดเองสำหรับโมเดล AI
import logging
from applicationinsights import TelemetryClient

class AITelemetry:
    def __init__(self, instrumentation_key: str):
        self.client = TelemetryClient(instrumentation_key)
    
    def track_model_request(self, model: str, tokens: int, latency_ms: int, success: bool):
        """Track AI model request metrics."""
        self.client.track_event(
            'AI_Model_Request',
            {
                'model': model,
                'tokens': str(tokens),
                'latency_ms': str(latency_ms),
                'success': str(success)
            }
        )
        
    def track_model_error(self, model: str, error_type: str, error_message: str):
        """Track AI model errors."""
        self.client.track_exception(
            type=error_type,
            value=error_message,
            properties={
                'model': model,
                'component': 'ai_model'
            }
        )
```

### การตรวจสอบสุขภาพบริการ

ดำเนินการตรวจสอบสุขภาพของบริการ AI:

```python
# จุดตรวจสอบสุขภาพ
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # ทดสอบการเชื่อมต่อ OpenAI
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/deployments",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            
        if response.status_code == 200:
            return {"status": "healthy", "models": response.json()}
        else:
            raise HTTPException(status_code=503, detail="AI models unavailable")
            
    except Exception as e:
        raise HTTPException(status_code=503, detail=f"Health check failed: {str(e)}")
```

## ขั้นตอนถัดไป

1. **ทบทวน [คู่มือการรวม Microsoft Foundry](microsoft-foundry-integration.md)** สำหรับรูปแบบการรวมบริการ
2. **ทำ [ห้องปฏิบัติการเวิร์กช็อป AI](ai-workshop-lab.md)** เพื่อประสบการณ์ปฏิบัติจริง
3. **ดำเนินการ [แนวทางปฏิบัติ AI ในการผลิต](production-ai-practices.md)** สำหรับการติดตั้งในองค์กร
4. **สำรวจ [คู่มือแก้ไขปัญหา AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** สำหรับปัญหาที่พบบ่อย

## แหล่งข้อมูล

- [ความพร้อมใช้งานโมเดล Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [การปรับขนาด Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [การเพิ่มประสิทธิภาพค่าใช้จ่ายโมเดล AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**การนำทางบทเรียน:**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI-First
- **⬅️ ก่อนหน้า**: [การรวม Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ ถัดไป**: [ห้องปฏิบัติการเวิร์กช็อป AI](ai-workshop-lab.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้ความถูกต้อง โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลสำคัญ ขอแนะนำให้ใช้บริการแปลโดยมนุษย์มืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->