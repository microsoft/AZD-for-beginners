<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d1b97c6d936e9b4f71fc2972306dfb7f",
  "translation_date": "2025-09-12T21:50:56+00:00",
  "source_file": "docs/ai-foundry/ai-model-deployment.md",
  "language_code": "th"
}
-->
# การปรับใช้โมเดล AI ด้วย Azure Developer CLI

**ก่อนหน้า:** [การผสานรวม Azure AI Foundry](azure-ai-foundry-integration.md) | **ถัดไป:** [ห้องปฏิบัติการ AI Workshop](ai-workshop-lab.md)

คู่มือนี้ให้คำแนะนำที่ครอบคลุมสำหรับการปรับใช้โมเดล AI โดยใช้เทมเพลต AZD ครอบคลุมตั้งแต่การเลือกโมเดลไปจนถึงรูปแบบการปรับใช้ในระดับการผลิต

## สารบัญ

- [กลยุทธ์การเลือกโมเดล](../../../../docs/ai-foundry)
- [การตั้งค่า AZD สำหรับโมเดล AI](../../../../docs/ai-foundry)
- [รูปแบบการปรับใช้](../../../../docs/ai-foundry)
- [การจัดการโมเดล](../../../../docs/ai-foundry)
- [ข้อควรพิจารณาสำหรับการผลิต](../../../../docs/ai-foundry)
- [การตรวจสอบและการสังเกตการณ์](../../../../docs/ai-foundry)

## กลยุทธ์การเลือกโมเดล

### โมเดล Azure OpenAI

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
            "name": "gpt-4o-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4o-mini",
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

| ประเภทโมเดล | กรณีการใช้งาน | ความจุที่แนะนำ | ข้อควรพิจารณาด้านต้นทุน |
|-------------|---------------|----------------|-----------------------|
| GPT-4o-mini | แชท, Q&A | 10-50 TPM | คุ้มค่าต่อการใช้งานส่วนใหญ่ |
| GPT-4 | การวิเคราะห์ที่ซับซ้อน | 20-100 TPM | ต้นทุนสูงกว่า ใช้สำหรับฟีเจอร์พรีเมียม |
| Text-embedding-ada-002 | การค้นหา, RAG | 30-120 TPM | จำเป็นสำหรับการค้นหาเชิงความหมาย |
| Whisper | การแปลงเสียงเป็นข้อความ | 10-50 TPM | งานประมวลผลเสียง |

## การตั้งค่า AZD สำหรับโมเดล AI

### การตั้งค่าเทมเพลต Bicep

สร้างการปรับใช้โมเดลผ่านเทมเพลต Bicep:

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4o-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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

ตั้งค่าสภาพแวดล้อมของแอปพลิเคชันของคุณ:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## รูปแบบการปรับใช้

### รูปแบบที่ 1: การปรับใช้ในภูมิภาคเดียว

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4o-mini
```

เหมาะสำหรับ:
- การพัฒนาและการทดสอบ
- แอปพลิเคชันที่มุ่งเน้นตลาดเดียว
- การเพิ่มประสิทธิภาพต้นทุน

### รูปแบบที่ 2: การปรับใช้หลายภูมิภาค

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

### รูปแบบที่ 3: การปรับใช้แบบไฮบริด

ผสาน Azure OpenAI กับบริการ AI อื่น ๆ:

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

ติดตามเวอร์ชันโมเดลในการตั้งค่า AZD ของคุณ:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4o-mini",
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

ใช้ AZD hooks สำหรับการอัปเดตโมเดล:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### การทดสอบ A/B

ปรับใช้โมเดลหลายเวอร์ชัน:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## ข้อควรพิจารณาสำหรับการผลิต

### การวางแผนความจุ

คำนวณความจุที่ต้องการตามรูปแบบการใช้งาน:

```python
# Capacity calculation example
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

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### การตั้งค่า Auto-scaling

ตั้งค่า Auto-scaling สำหรับ Container Apps:

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

### การเพิ่มประสิทธิภาพต้นทุน

ใช้การควบคุมต้นทุน:

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

### การผสานรวม Application Insights

ตั้งค่าการตรวจสอบสำหรับงาน AI:

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

ติดตามเมตริกเฉพาะสำหรับ AI:

```python
# Custom telemetry for AI models
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

### การตรวจสอบสุขภาพ

ตั้งค่าการตรวจสอบสุขภาพบริการ AI:

```python
# Health check endpoints
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Test OpenAI connection
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

1. **ทบทวน [คู่มือการผสานรวม Azure AI Foundry](azure-ai-foundry-integration.md)** สำหรับรูปแบบการผสานรวมบริการ
2. **ทำ [ห้องปฏิบัติการ AI Workshop](ai-workshop-lab.md)** เพื่อประสบการณ์การใช้งานจริง
3. **นำไปใช้ [แนวปฏิบัติ AI สำหรับการผลิต](production-ai-practices.md)** สำหรับการปรับใช้ในองค์กร
4. **สำรวจ [คู่มือการแก้ไขปัญหา AI](../troubleshooting/ai-troubleshooting.md)** สำหรับปัญหาทั่วไป

## แหล่งข้อมูล

- [ความพร้อมใช้งานของโมเดล Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [การปรับขนาด Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [การเพิ่มประสิทธิภาพต้นทุนโมเดล AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ก่อนหน้า:** [การผสานรวม Azure AI Foundry](azure-ai-foundry-integration.md) | **ถัดไป:** [ห้องปฏิบัติการ AI Workshop](ai-workshop-lab.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้องมากที่สุด แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้