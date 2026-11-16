# การปรับใช้โมเดล AI ด้วย Azure Developer CLI

**การนำทางบทเรียน:**
- **📚 หน้าแรกหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI-First
- **⬅️ ก่อนหน้า**: [AI Agents](agents.md)
- **➡️ ถัดไป**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 บทถัดไป**: [บทที่ 3: การตั้งค่า](../chapter-03-configuration/configuration.md)

คู่มือนี้ให้คำแนะนำที่ครอบคลุมสำหรับการปรับใช้โมเดล AI โดยใช้เทมเพลต AZD ครอบคลุมตั้งแต่การเลือกโมเดลจนถึงรูปแบบการปรับใช้ในสภาพแวดล้อมจริง

> **การทบทวนการเปิดตัว (2026-11-04):** การเปลี่ยนแปลง CLI ที่เกี่ยวข้องได้รับการทบทวนตาม `azd` `1.37.2`; การมีอยู่ของโมเดล รุ่น และโควต้ายังคงขึ้นอยู่กับภูมิภาคและการสมัครใช้บริการ `azd deploy --timeout <seconds>` ควบคุมช่วงเวลาการปรับใช้บริการ ไม่ใช่การรับประกันการเปิดใช้งานตัวแทน ดู [บันทึกการเปิดตัวปัจจุบันและคู่มือการย้าย AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## สารบัญ

- [กลยุทธ์การเลือกโมเดล](#model-selection-strategy)
- [การกำหนดค่า AZD สำหรับโมเดล AI](#azd-configuration-for-ai-models)
- [รูปแบบการปรับใช้](#deployment-patterns)
- [การจัดการโมเดล](#model-management)
- [ข้อพิจารณาในสภาพแวดล้อมการผลิต](#production-considerations)
- [การตรวจสอบและความสามารถในการสังเกตการณ์](#monitoring-and-observability)

## กลยุทธ์การเลือกโมเดล

### โมเดล Azure OpenAI ใน Microsoft Foundry

เลือกโมเดลที่เหมาะสมกับกรณีการใช้งานของคุณ:

ประกาศการปรับใช้โมเดลใน Bicep (ด้านล่าง) ไม่ใช่ในการตั้งค่า `services.*.config.AZURE_OPENAI_MODELS` แบบสุ่ม AZD จะไม่ตีความการตั้งค่านั้นเป็นรายการของทรัพยากรโมเดล `project` ของบริการจะชี้ไปยังแหล่งที่มาของแอปพลิเคชัน ไม่ใช่ไดเรกทอรี `infra/`

ตัวอย่างใช้รุ่น `gpt-4.1-mini` ที่เผยแพร่ **`2025-04-14`** และรุ่น embedding **`1`** ยืนยันว่ารุ่นโมเดลและ SKU การปรับใช้ได้รับการสนับสนุนในภูมิภาค/บัญชีเป้าหมายของคุณก่อนเพิ่มทรัพยากร

### การวางแผนความจุของโมเดล

| ประเภทโมเดล | กรณีการใช้งาน | ความต้องการโทเค็นโดยประมาณ | ข้อพิจารณาด้านต้นทุน |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | แชท, ถาม-ตอบ | 10,000-50,000 TPM | ทดสอบต้นทุนและคุณภาพสำหรับภาระงานของคุณ |
| gpt-4.1 | งานซับซ้อน | 20,000-100,000 TPM | ประเมินการเพิ่มคุณภาพเทียบกับต้นทุนโทเค็น |
| text-embedding-3-large | การค้นหา, RAG | 30,000-120,000 TPM | คำนึงถึงการรับข้อมูลเข้าและการรับส่งคำค้น |
| Whisper | การแปลงเสียงเป็นข้อความ | วางแผนโดยใช้ระยะเวลาของเสียงและขีดจำกัดคำขอ | ห้ามใช้สูตรคำนวณความจุ TPM ของโมเดลข้อความ |

TPM หมายถึงโทเค็นต่อนาที สำหรับการปรับใช้ข้อความมาตรฐานเหล่านี้ ARM `sku.capacity` อยู่ในหน่วย **1,000 TPM** ไม่ใช่ TPM เดี่ยว (ความจุ `10` หมายถึง 10,000 TPM) อัตราส่วน RPM ต่อ TPM แตกต่างกันไปตามประเภทโมเดล/การปรับใช้; ตรวจสอบขีดจำกัดทั้งสองกับ [เอกสารโควต้า](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic) ช่วงตัวเลขเหล่านี้เป็นตัวอย่าง ไม่ใช่คำแนะนำในการกำหนดขนาด

## การกำหนดค่า AZD สำหรับโมเดล AI

### การกำหนดค่าเทมเพลต Bicep

สร้างการปรับใช้โมเดลผ่านเทมเพลต Bicep:

```bicep
// infra/main.bicep
param openAiAccountName string
param location string = resourceGroup().location

@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-3-large'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
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
    disableLocalAuth: true
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

นี่คือตัวอย่าง **โครงสร้างพื้นฐานสำหรับการพัฒนา** ที่มีขอบเขตเฉพาะในกลุ่มทรัพยากร ไม่ใช่แม่แบบแอปพลิเคชัน AZD แบบสมบูรณ์ บัญชีนี้อนุญาตให้เข้าถึงเครือข่ายสาธารณะและต้องการการตรวจสอบสิทธิ์ Entra ID/RBAC (`Cognitive Services OpenAI User` สำหรับผู้เรียกใช้งาน) การใช้งานจริงจำเป็นต้องมี private endpoint, DNS และการเชื่อมต่อแอปพลิเคชันที่อธิบายในบทที่ 8 AZD ยังต้องการแม่แบบหลัก/การแมปพารามิเตอร์และทรัพยากรโฮสต์แอปพลิเคชัน; ใช้ตัวอย่างที่ใช้งานได้สำหรับการปรับใช้งานเต็มรูปแบบ

### ตัวแปรสภาพแวดล้อม

กำหนดค่าสภาพแวดล้อมแอปพลิเคชันของคุณ:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

เหล่านี้เป็นชื่อที่กำหนดโดยแอปพลิเคชัน; ต่อสายเข้ากับการกำหนดค่าของโฮสต์ของคุณ จุดสิ้นสุด Azure OpenAI v1 ที่ใช้โดยการตรวจสอบสถานะด้านล่างไม่ต้องการพารามิเตอร์ `api-version` ที่มีวันที่; `AzureOpenAI` ลูกค้าเก่าต้องใช้ ดังนั้นจึงควรปฏิบัติตามการสร้าง API ที่แอปพลิเคชันของคุณใช้

## รูปแบบการปรับใช้

### รูปแบบ 1: การปรับใช้ในภูมิภาคเดียว

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

เหมาะสำหรับ:
- การพัฒนาและทดสอบ
- แอปพลิเคชันตลาดเดี่ยว
- การปรับค่าใช้จ่ายให้เหมาะสม

### รูปแบบ 2: การปรับใช้หลายภูมิภาค

```bicep
// Illustrative fragment: extend the complete account declaration above.
// Each region must support the selected model/SKU and have quota.
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

คุณสมบัติ/SKU บัญชีที่ละเว้นต้องถูกจัดเตรียม; ชิ้นส่วนนี้ไม่สามารถปรับใช้ได้ตามที่เขียนไว้ ปรับใช้โมเดลในบัญชีแต่ละบัญชีและดำเนินการกำหนดเส้นทาง/การเปลี่ยนไปใช้สำรองและการควบคุมถิ่นที่อยู่ของข้อมูลแยกกัน

เหมาะสำหรับ:
- แอปพลิเคชันทั่วโลก
- ความต้องการความพร้อมใช้งานสูง
- การกระจายโหลด

### รูปแบบ 3: การปรับใช้งานแบบไฮบริด

ผสมผสาน Microsoft Foundry Models กับบริการ AI อื่นๆ:

ชิ้นส่วนต่อไปนี้สมมติว่าชื่อและ `location` ถูกจัดเตรียมโดยแม่แบบที่บรรจุ

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

ติดตามเวอร์ชันของโมเดลในกำหนดค่าของแอปพลิเคชันหรือ IaC JSON นี้เป็น **ตัวอย่างที่กำหนดโดยแอปพลิเคชัน** ไม่ใช่สคีม่าโมเดล AZD ในตัว; ต้องมีการใช้งานสำรองและปรับใช้ชัดเจน:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2025-04-14",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### การอัปเดตโมเดล

ใช้ฮุก AZD สำหรับการตรวจสอบการมีอยู่แบบอ่านอย่างเดียว แล้วอัปเดต IaC และจัดเตรียม:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

เรียก `azd up` **นอก** ฮุกเพื่อใช้โครงสร้างพื้นฐานโมเดลที่เปลี่ยนแปลงและปรับใช้โค้ด อย่าเรียก `azd deploy` จากฮุก `predeploy`: จะกระตุ้นฮุกเดียวกันแบบวนซ้ำ `azd deploy --timeout 1800` ขยายเวลาโหมดปรับใช้แอปพลิเคชัน; ไม่ได้อัปเดตทรัพยากร Bicep

### การทดสอบ A/B

ทรัพยากรตัวอย่างด้านล่างเลือกชื่อปรับใช้และความจุ; สร้างการปรับใช้ **หนึ่งครั้ง** ไม่ใช่การทดสอบ A/B สำหรับการทดลองจริง ให้จัดเตรียมทรัพยากรปรับใช้สองชุดแยกกัน จัดเส้นทางคำขอตามสัดส่วนที่ควบคุมไปยังแต่ละชุด และเปรียบเทียบคุณภาพ ความหน่วง และค่าใช้จ่าย สมมติ `openAi` จากตัวอย่างบัญชี:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## การพิจารณาผลิต

### การวางแผนความจุ

คำนวณความจุที่ต้องการตามรูปแบบการใช้งาน:

```python
# Capacity calculation example
import math
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return math.ceil(total_tpm * (1 + safety_margin))

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

ผลลัพธ์ที่คาดหวัง: `Required capacity: 9100 TPM` ด้วยความจุ 1,000-TPM ให้วงกลมขึ้นเป็นอย่างน้อย `10` แล้วตรวจสอบการประมาณ RPM เฉพาะโมเดลและอัตราจำกัดบริการ (รวมถึงงบประมาณผลลัพธ์ที่ร้องขอ) การประมาณความต้องการโทเค็นนี้ไม่ใช่การรับประกันว่าจะไม่มีการจำกัด

### การกำหนดค่า Auto-scaling

กำหนดค่า auto-scaling สำหรับ Container Apps:

**ทรัพยากรบางส่วน:** รวมการตั้งค่า `template.scale` เข้ากับ Container App ที่สมบูรณ์พร้อมตำแหน่ง สภาพแวดล้อมที่จัดการ ภาพคอนเทนเนอร์ ทรัพยากร และการเข้าถึง การขยายจำนวนสำเนาไม่เพิ่มโควต้าโมเดล

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

### การปรับค่าใช้จ่ายให้เหมาะสม

ดำเนินการควบคุมค่าใช้จ่าย:

**ทรัพยากรงบประมาณตัวอย่าง:** กำหนด `budgetStartDate` เป็นวันแรกของเดือนปัจจุบันใน UTC (เช่น `2026-11-01T00:00:00Z` สำหรับการทบทวนนี้) และเปลี่ยนที่อยู่อีเมลที่ติดต่อ เริ่มต้นต้องตรงกับข้อจำกัดวันที่ปัจจุบันของบริการ งบประมาณจะแจ้งเตือนเมื่อข้อมูลใบแจ้งหนี้ล่าช้า; แต่ไม่หยุดการใช้จ่าย

```bicep
param budgetStartDate string

@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2024-08-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

## การตรวจสอบและการสังเกต

### การรวม Application Insights

กำหนดค่าการตรวจสอบสำหรับภาระงาน AI:

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

```

ส่วนทรัพยากรนี้สมมติว่า`applicationInsightsName`, `location` และ `logAnalyticsWorkspace` ที่มีอยู่แล้ว มันจัดเตรียมการตรวจสอบสถานะ แต่ไม่ได้ดำเนินการติดตั้งแอปหรือสร้างเมตริกที่กำหนดเอง

### เมตริกที่กำหนดเอง

ติดตามเมตริกเฉพาะ AI:

ใช้ [Azure Monitor OpenTelemetry distribution](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python) ที่รองรับ แทน SDK Python รุ่นเก่า `applicationinsights` ติดตั้ง `azure-monitor-opentelemetry` กำหนดค่า `APPLICATIONINSIGHTS_CONNECTION_STRING` และเริ่มต้นเพียงครั้งเดียวในตอนเริ่มต้น:

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

configure_azure_monitor()
tracer = trace.get_tracer(__name__)

def record_request(model: str, tokens: int, latency_ms: int, success: bool):
    with tracer.start_as_current_span("AI_Model_Request") as span:
        span.set_attribute("ai.model", model)
        span.set_attribute("ai.tokens", tokens)
        span.set_attribute("ai.latency_ms", latency_ms)
        span.set_attribute("ai.success", success)
```

นี่แสดงถึงการส่งออกแอตทริบิวต์ ไม่ใช่การติดตั้งการโทรแบบโมเดลจริง ห่อหุ้มคำขอจริงในสแปนเพื่อวัดระยะเวลา; ตรวจสอบ `dependencies`/`traces` ใน Application Insights ห้ามส่งคำสั่ง, การตอบสนอง, คีย์ หรืข้อความข้อยกเว้นดิบที่มีข้อมูลที่ละเอียดอ่อน

### การตรวจสอบสุขภาพ

ดำเนินการตรวจสอบสุขภาพบริการ AI:

ติดตั้ง `fastapi`, `uvicorn`, `httpx` และ `azure-identity` กำหนดค่าตัวแปร endpoint/deployment ข้างต้นและมอบ `Cognitive Services OpenAI User` ให้กับผู้เรียก โปรบ **readiness** นี้ใช้ Azure OpenAI v1 data plane กับ Entra ID; มันเป็นการโทรโมเดลที่มีค่าใช้จ่าย ใช้ `uvicorn health:app` หลังบันทึกเป็น `health.py` ใช้การตรวจสอบ liveness ที่เบาแยกต่างหาก จำกัดอัตรา/แคชผล readiness และอย่าเปิดเผยเส้นทางนี้สู่สาธารณะโดยไม่มีการควบคุมการเข้าถึง

```python
# health.py
import os
from fastapi import FastAPI, HTTPException
import httpx
from azure.identity.aio import DefaultAzureCredential

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        async with DefaultAzureCredential() as credential:
            token = await credential.get_token("https://ai.azure.com/.default")
        endpoint = os.environ["AZURE_OPENAI_ENDPOINT"].rstrip("/")
        async with httpx.AsyncClient(timeout=20.0) as client:
            response = await client.post(
                f"{endpoint}/openai/v1/chat/completions",
                headers={"Authorization": f"Bearer {token.token}"},
                json={
                    "model": os.environ["AZURE_OPENAI_CHAT_DEPLOYMENT"],
                    "messages": [{"role": "user", "content": "Reply OK."}],
                    "max_completion_tokens": 8,
                },
            )
        response.raise_for_status()
        return {"status": "healthy"}
    except Exception:
        # Record sanitized internal diagnostics, not service responses/tokens.
        raise HTTPException(status_code=503, detail="AI readiness check failed") from None
```

คาดว่า: `GET /health/ai-models` จะส่งคืน `200 {"status":"healthy"}` เมื่อติดตั้งแชทที่กำหนดค่าใช้งานได้ หรือ `503` โดยไม่เปิดเผยรายละเอียด upstream การแสดงรายการ deployment เป็นการดำเนินการใน management-plane และไม่ใช่โปรบสุขภาพ data-plane ที่ถูกต้อง

## ขั้นตอนถัดไป

1. **ตรวจสอบ [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** สำหรับรูปแบบการรวมบริการ
2. **ทำ [AI Workshop Lab](ai-workshop-lab.md)** สำหรับประสบการณ์ใช้งานจริง
3. **ใช้งาน [Production AI Practices](../chapter-08-production/production-ai-practices.md)** สำหรับการปรับใช้ในองค์กร
4. **สำรวจ [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** สำหรับปัญหาทั่วไป

## แหล่งข้อมูล

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**การนำทางบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI-First
- **⬅️ ก่อนหน้า**: [AI Agents](agents.md)
- **➡️ ถัดไป**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->