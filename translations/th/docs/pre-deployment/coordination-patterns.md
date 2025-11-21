<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "bcefbd5d0107691ef3e6e33ba694d6f4",
  "translation_date": "2025-11-21T10:48:20+00:00",
  "source_file": "docs/pre-deployment/coordination-patterns.md",
  "language_code": "th"
}
-->
# รูปแบบการประสานงานของหลายตัวแทน

⏱️ **เวลาที่คาดการณ์**: 60-75 นาที | 💰 **ค่าใช้จ่ายที่คาดการณ์**: ~$100-300/เดือน | ⭐ **ความซับซ้อน**: ขั้นสูง

**📚 เส้นทางการเรียนรู้:**
- ← ก่อนหน้า: [การวางแผนความจุ](capacity-planning.md) - กลยุทธ์การกำหนดขนาดและการปรับขยายทรัพยากร
- 🎯 **คุณอยู่ที่นี่**: รูปแบบการประสานงานของหลายตัวแทน (การจัดการ, การสื่อสาร, การจัดการสถานะ)
- → ถัดไป: [การเลือก SKU](sku-selection.md) - การเลือกบริการ Azure ที่เหมาะสม
- 🏠 [หน้าแรกของคอร์ส](../../README.md)

---

## สิ่งที่คุณจะได้เรียนรู้

เมื่อจบบทเรียนนี้ คุณจะ:
- เข้าใจ **รูปแบบสถาปัตยกรรมหลายตัวแทน** และเวลาที่ควรใช้งาน
- ใช้ **รูปแบบการจัดการ** (แบบรวมศูนย์, แบบกระจาย, แบบลำดับชั้น)
- ออกแบบ **กลยุทธ์การสื่อสารของตัวแทน** (แบบซิงโครนัส, แบบอะซิงโครนัส, แบบขับเคลื่อนด้วยเหตุการณ์)
- จัดการ **สถานะที่ใช้ร่วมกัน** ระหว่างตัวแทนที่กระจายตัว
- ปรับใช้ **ระบบหลายตัวแทน** บน Azure ด้วย AZD
- ใช้ **รูปแบบการประสานงาน** สำหรับสถานการณ์ AI ในโลกจริง
- ตรวจสอบและแก้ไขข้อผิดพลาดในระบบตัวแทนที่กระจายตัว

## ทำไมการประสานงานของหลายตัวแทนถึงสำคัญ

### การพัฒนา: จากตัวแทนเดี่ยวสู่หลายตัวแทน

**ตัวแทนเดี่ยว (ง่าย):**
```
User → Agent → Response
```
- ✅ เข้าใจและใช้งานง่าย
- ✅ เร็วสำหรับงานง่ายๆ
- ❌ ถูกจำกัดด้วยความสามารถของโมเดลเดียว
- ❌ ไม่สามารถทำงานที่ซับซ้อนแบบขนานได้
- ❌ ไม่มีความเชี่ยวชาญเฉพาะด้าน

**ระบบหลายตัวแทน (ขั้นสูง):**
```
           ┌─────────────┐
           │ Orchestrator│
           └──────┬──────┘
        ┌─────────┼─────────┐
        │         │         │
    ┌───▼──┐  ┌──▼───┐  ┌──▼────┐
    │Agent1│  │Agent2│  │Agent3 │
    │(Plan)│  │(Code)│  │(Review)│
    └──────┘  └──────┘  └───────┘
```
- ✅ ตัวแทนที่เชี่ยวชาญเฉพาะด้านสำหรับงานเฉพาะ
- ✅ การดำเนินการแบบขนานเพื่อความเร็ว
- ✅ มีความเป็นโมดูลและดูแลรักษาได้ง่าย
- ✅ เหมาะกับกระบวนการทำงานที่ซับซ้อน
- ⚠️ ต้องการตรรกะการประสานงาน

**เปรียบเทียบ**: ตัวแทนเดี่ยวเหมือนคนคนเดียวที่ทำทุกงาน ระบบหลายตัวแทนเหมือนทีมที่แต่ละคนมีทักษะเฉพาะด้าน (นักวิจัย, นักเขียนโค้ด, ผู้ตรวจสอบ, นักเขียน) ทำงานร่วมกัน

---

## รูปแบบการประสานงานหลัก

### รูปแบบที่ 1: การประสานงานแบบลำดับ (Chain of Responsibility)

**เมื่อควรใช้**: งานต้องดำเนินการตามลำดับที่เฉพาะเจาะจง โดยแต่ละตัวแทนสร้างผลลัพธ์จากตัวแทนก่อนหน้า

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as ตัวแทนวิจัย
    participant Agent2 as ตัวแทนเขียน
    participant Agent3 as ตัวแทนบรรณาธิการ
    
    User->>Orchestrator: "เขียนบทความเกี่ยวกับ AI"
    Orchestrator->>Agent1: วิจัยหัวข้อ
    Agent1-->>Orchestrator: ผลการวิจัย
    Orchestrator->>Agent2: เขียนร่าง (ใช้ผลการวิจัย)
    Agent2-->>Orchestrator: ร่างบทความ
    Orchestrator->>Agent3: แก้ไขและปรับปรุง
    Agent3-->>Orchestrator: บทความสุดท้าย
    Orchestrator-->>User: บทความที่ปรับปรุงแล้ว
    
    Note over User,Agent3: ลำดับ: แต่ละขั้นตอนรอขั้นตอนก่อนหน้า
```
**ข้อดี:**
- ✅ การไหลของข้อมูลชัดเจน
- ✅ แก้ไขข้อผิดพลาดได้ง่าย
- ✅ ลำดับการดำเนินการที่คาดการณ์ได้

**ข้อจำกัด:**
- ❌ ช้ากว่า (ไม่มีการดำเนินการแบบขนาน)
- ❌ ความล้มเหลวหนึ่งครั้งทำให้ทั้งลำดับหยุด
- ❌ ไม่สามารถจัดการงานที่มีการพึ่งพากันได้

**ตัวอย่างการใช้งาน:**
- กระบวนการสร้างเนื้อหา (วิจัย → เขียน → แก้ไข → เผยแพร่)
- การสร้างโค้ด (วางแผน → ดำเนินการ → ทดสอบ → ปรับใช้)
- การสร้างรายงาน (รวบรวมข้อมูล → วิเคราะห์ → สร้างภาพ → สรุป)

---

### รูปแบบที่ 2: การประสานงานแบบขนาน (Fan-Out/Fan-In)

**เมื่อควรใช้**: งานที่เป็นอิสระสามารถดำเนินการพร้อมกันได้ และผลลัพธ์รวมกันในตอนท้าย

```mermaid
graph TB
    User[คำขอของผู้ใช้]
    Orchestrator[ตัวประสานงาน]
    Agent1[ตัวแทนวิเคราะห์]
    Agent2[ตัวแทนวิจัย]
    Agent3[ตัวแทนข้อมูล]
    Aggregator[ตัวรวมผลลัพธ์]
    Response[การตอบสนองที่รวมกัน]
    
    User --> Orchestrator
    Orchestrator --> Agent1
    Orchestrator --> Agent2
    Orchestrator --> Agent3
    Agent1 --> Aggregator
    Agent2 --> Aggregator
    Agent3 --> Aggregator
    Aggregator --> Response
    
    style Orchestrator fill:#2196F3,stroke:#1976D2,stroke-width:3px,color:#fff
    style Aggregator fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
**ข้อดี:**
- ✅ เร็ว (การดำเนินการแบบขนาน)
- ✅ ทนต่อความล้มเหลว (ยอมรับผลลัพธ์บางส่วนได้)
- ✅ ขยายได้ในแนวนอน

**ข้อจำกัด:**
- ⚠️ ผลลัพธ์อาจมาถึงไม่เรียงลำดับ
- ⚠️ ต้องมีตรรกะการรวมผลลัพธ์
- ⚠️ การจัดการสถานะที่ซับซ้อน

**ตัวอย่างการใช้งาน:**
- การรวบรวมข้อมูลจากหลายแหล่ง (API + ฐานข้อมูล + การดึงข้อมูลจากเว็บ)
- การวิเคราะห์เชิงแข่งขัน (โมเดลหลายตัวสร้างทางแก้ไข เลือกสิ่งที่ดีที่สุด)
- บริการแปลภาษา (แปลเป็นหลายภาษาในเวลาเดียวกัน)

---

### รูปแบบที่ 3: การประสานงานแบบลำดับชั้น (Manager-Worker)

**เมื่อควรใช้**: กระบวนการทำงานที่ซับซ้อนพร้อมงานย่อย ต้องการการมอบหมายงาน

```mermaid
graph TB
    Master[ผู้ควบคุมหลัก]
    Manager1[ผู้จัดการฝ่ายวิจัย]
    Manager2[ผู้จัดการฝ่ายเนื้อหา]
    W1[ตัวดึงข้อมูลเว็บ]
    W2[ตัววิเคราะห์เอกสาร]
    W3[ผู้เขียน]
    W4[บรรณาธิการ]
    
    Master --> Manager1
    Master --> Manager2
    Manager1 --> W1
    Manager1 --> W2
    Manager2 --> W3
    Manager2 --> W4
    
    style Master fill:#FF9800,stroke:#F57C00,stroke-width:3px,color:#fff
    style Manager1 fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style Manager2 fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
```
**ข้อดี:**
- ✅ จัดการกระบวนการทำงานที่ซับซ้อนได้
- ✅ มีความเป็นโมดูลและดูแลรักษาได้ง่าย
- ✅ ขอบเขตความรับผิดชอบชัดเจน

**ข้อจำกัด:**
- ⚠️ สถาปัตยกรรมที่ซับซ้อนกว่า
- ⚠️ ความล่าช้าสูงขึ้น (มีหลายชั้นของการประสานงาน)
- ⚠️ ต้องการการจัดการที่ซับซ้อน

**ตัวอย่างการใช้งาน:**
- การประมวลผลเอกสารในองค์กร (จัดหมวดหมู่ → ส่งต่อ → ประมวลผล → เก็บถาวร)
- ท่อข้อมูลหลายขั้นตอน (นำเข้า → ทำความสะอาด → แปลง → วิเคราะห์ → รายงาน)
- กระบวนการอัตโนมัติที่ซับซ้อน (วางแผน → จัดสรรทรัพยากร → ดำเนินการ → ตรวจสอบ)

---

### รูปแบบที่ 4: การประสานงานแบบขับเคลื่อนด้วยเหตุการณ์ (Publish-Subscribe)

**เมื่อควรใช้**: ตัวแทนต้องตอบสนองต่อเหตุการณ์ ต้องการการเชื่อมต่อที่หลวม

```mermaid
sequenceDiagram
    participant Agent1 as ผู้รวบรวมข้อมูล
    participant EventBus as Azure Service Bus
    participant Agent2 as ผู้วิเคราะห์
    participant Agent3 as ผู้แจ้งเตือน
    participant Agent4 as ผู้จัดเก็บ
    
    Agent1->>EventBus: เผยแพร่เหตุการณ์ "DataReceived"
    EventBus->>Agent2: สมัครสมาชิก: วิเคราะห์ข้อมูล
    EventBus->>Agent3: สมัครสมาชิก: ส่งการแจ้งเตือน
    EventBus->>Agent4: สมัครสมาชิก: จัดเก็บข้อมูล
    
    Note over Agent1,Agent4: ผู้สมัครสมาชิกทั้งหมดดำเนินการอย่างอิสระ
    
    Agent2->>EventBus: เผยแพร่เหตุการณ์ "AnalysisComplete"
    EventBus->>Agent3: สมัครสมาชิก: ส่งรายงานการวิเคราะห์
```
**ข้อดี:**
- ✅ การเชื่อมต่อที่หลวมระหว่างตัวแทน
- ✅ เพิ่มตัวแทนใหม่ได้ง่าย (แค่สมัครรับข้อมูล)
- ✅ การประมวลผลแบบอะซิงโครนัส
- ✅ ทนทาน (การเก็บข้อความ)

**ข้อจำกัด:**
- ⚠️ ความสอดคล้องในที่สุด
- ⚠️ การแก้ไขข้อผิดพลาดที่ซับซ้อน
- ⚠️ ความท้าทายในการเรียงลำดับข้อความ

**ตัวอย่างการใช้งาน:**
- ระบบตรวจสอบแบบเรียลไทม์ (การแจ้งเตือน, แดชบอร์ด, บันทึก)
- การแจ้งเตือนหลายช่องทาง (อีเมล, SMS, การแจ้งเตือน, Slack)
- ท่อการประมวลผลข้อมูล (ผู้บริโภคหลายรายของข้อมูลเดียวกัน)

---

### รูปแบบที่ 5: การประสานงานแบบฉันทามติ (Voting/Quorum)

**เมื่อควรใช้**: ต้องการความเห็นชอบจากตัวแทนหลายตัวก่อนดำเนินการต่อ

```mermaid
graph TB
    Input[งานที่ป้อนเข้า]
    Agent1[ตัวแทน 1: GPT-4]
    Agent2[ตัวแทน 2: Claude]
    Agent3[ตัวแทน 3: Gemini]
    Voter[ผู้ลงคะแนนเสียงร่วมกัน]
    Output[ผลลัพธ์ที่ตกลงกัน]

    Input --> Agent1
    Input --> Agent2
    Input --> Agent3
    Agent1 --> Voter
    Agent2 --> Voter
    Agent3 --> Voter
    Voter --> Output

    style Voter fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
```
**ข้อดี:**
- ✅ ความแม่นยำสูงขึ้น (หลายความคิดเห็น)
- ✅ ทนต่อความล้มเหลว (ยอมรับความล้มเหลวของส่วนน้อยได้)
- ✅ มีการประกันคุณภาพในตัว

**ข้อจำกัด:**
- ❌ ค่าใช้จ่ายสูง (การเรียกโมเดลหลายครั้ง)
- ❌ ช้ากว่า (รอทุกตัวแทน)
- ⚠️ ต้องมีการแก้ไขความขัดแย้ง

**ตัวอย่างการใช้งาน:**
- การตรวจสอบเนื้อหา (โมเดลหลายตัวตรวจสอบเนื้อหา)
- การตรวจสอบโค้ด (ตัวตรวจสอบหลายตัว/ตัววิเคราะห์)
- การวินิจฉัยทางการแพทย์ (โมเดล AI หลายตัว, การตรวจสอบจากผู้เชี่ยวชาญ)

---

## ภาพรวมสถาปัตยกรรม

### ระบบหลายตัวแทนที่สมบูรณ์บน Azure

```mermaid
graph TB
    User[ผู้ใช้/ลูกค้า API]
    APIM[Azure API Management]
    Orchestrator[บริการ Orchestrator<br/>Container App]
    ServiceBus[Azure Service Bus<br/>Event Hub]
    
    Agent1[ตัวแทนวิจัย<br/>Container App]
    Agent2[ตัวแทนเขียน<br/>Container App]
    Agent3[ตัวแทนวิเคราะห์<br/>Container App]
    Agent4[ตัวแทนตรวจสอบ<br/>Container App]
    
    CosmosDB[(Cosmos DB<br/>สถานะที่ใช้ร่วมกัน)]
    Storage[Azure Storage<br/>สิ่งประดิษฐ์]
    AppInsights[Application Insights<br/>การตรวจสอบ]
    
    User --> APIM
    APIM --> Orchestrator
    
    Orchestrator --> ServiceBus
    ServiceBus --> Agent1
    ServiceBus --> Agent2
    ServiceBus --> Agent3
    ServiceBus --> Agent4
    
    Agent1 --> CosmosDB
    Agent2 --> CosmosDB
    Agent3 --> CosmosDB
    Agent4 --> CosmosDB
    
    Agent1 --> Storage
    Agent2 --> Storage
    Agent3 --> Storage
    Agent4 --> Storage
    
    Orchestrator -.-> AppInsights
    Agent1 -.-> AppInsights
    Agent2 -.-> AppInsights
    Agent3 -.-> AppInsights
    Agent4 -.-> AppInsights
    
    style Orchestrator fill:#FF9800,stroke:#F57C00,stroke-width:3px,color:#fff
    style ServiceBus fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style CosmosDB fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
**องค์ประกอบสำคัญ:**

| องค์ประกอบ | วัตถุประสงค์ | บริการ Azure |
|-----------|---------|---------------|
| **API Gateway** | จุดเริ่มต้น, การจำกัดอัตรา, การตรวจสอบสิทธิ์ | API Management |
| **Orchestrator** | ประสานงานกระบวนการทำงานของตัวแทน | Container Apps |
| **Message Queue** | การสื่อสารแบบอะซิงโครนัส | Service Bus / Event Hubs |
| **Agents** | ตัวแทน AI เฉพาะด้าน | Container Apps / Functions |
| **State Store** | สถานะที่ใช้ร่วมกัน, การติดตามงาน | Cosmos DB |
| **Artifact Storage** | เอกสาร, ผลลัพธ์, บันทึก | Blob Storage |
| **Monitoring** | การติดตามแบบกระจาย, บันทึก | Application Insights |

---

## ข้อกำหนดเบื้องต้น

### เครื่องมือที่จำเป็น

```bash
# ตรวจสอบ Azure Developer CLI
azd version
# ✅ ที่คาดไว้: azd เวอร์ชัน 1.0.0 หรือสูงกว่า

# ตรวจสอบ Azure CLI
az --version
# ✅ ที่คาดไว้: azure-cli เวอร์ชัน 2.50.0 หรือสูงกว่า

# ตรวจสอบ Docker (สำหรับการทดสอบในเครื่อง)
docker --version
# ✅ ที่คาดไว้: Docker เวอร์ชัน 20.10 หรือสูงกว่า
```

### ข้อกำหนด Azure

- การสมัครใช้งาน Azure ที่ใช้งานอยู่
- สิทธิ์ในการสร้าง:
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB accounts
  - Storage accounts
  - Application Insights

### ความรู้ที่จำเป็น

คุณควรได้เรียนรู้:
- [การจัดการการตั้งค่า](../getting-started/configuration.md)
- [การตรวจสอบสิทธิ์และความปลอดภัย](../getting-started/authsecurity.md)
- [ตัวอย่างไมโครเซอร์วิส](../../../../examples/microservices)

---

## คู่มือการดำเนินการ

### โครงสร้างโครงการ

```
multi-agent-system/
├── azure.yaml                    # AZD configuration
├── infra/
│   ├── main.bicep               # Main infrastructure
│   ├── core/
│   │   ├── servicebus.bicep     # Message queue
│   │   ├── cosmos.bicep         # State store
│   │   ├── storage.bicep        # Artifact storage
│   │   └── monitoring.bicep     # Application Insights
│   └── app/
│       ├── orchestrator.bicep   # Orchestrator service
│       └── agent.bicep          # Agent template
└── src/
    ├── orchestrator/            # Orchestration logic
    │   ├── app.py
    │   ├── workflows.py
    │   └── Dockerfile
    ├── agents/
    │   ├── research/            # Research agent
    │   ├── writer/              # Writer agent
    │   ├── analyst/             # Analyst agent
    │   └── reviewer/            # Reviewer agent
    └── shared/
        ├── state_manager.py     # Shared state logic
        └── message_handler.py   # Message handling
```

---

## บทเรียนที่ 1: รูปแบบการประสานงานแบบลำดับ

### การดำเนินการ: ท่อการสร้างเนื้อหา

มาสร้างท่อลำดับ: วิจัย → เขียน → แก้ไข → เผยแพร่

### 1. การตั้งค่า AZD

**ไฟล์: `azure.yaml`**

```yaml
name: content-pipeline
metadata:
  template: multi-agent-sequential@1.0.0

services:
  orchestrator:
    project: ./src/orchestrator
    language: python
    host: containerapp
  
  research-agent:
    project: ./src/agents/research
    language: python
    host: containerapp
  
  writer-agent:
    project: ./src/agents/writer
    language: python
    host: containerapp
  
  editor-agent:
    project: ./src/agents/editor
    language: python
    host: containerapp
```

### 2. โครงสร้างพื้นฐาน: Service Bus สำหรับการประสานงาน

**ไฟล์: `infra/core/servicebus.bicep`**

```bicep
param name string
param location string
param tags object = {}

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: name
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
  properties: {
    minimumTlsVersion: '1.2'
  }
}

// Queue for orchestrator → research agent
resource researchQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'research-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
    deadLetteringOnMessageExpiration: true
  }
}

// Queue for research agent → writer agent
resource writerQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'writer-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
  }
}

// Queue for writer agent → editor agent
resource editorQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'editor-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
  }
}

output namespace string = serviceBusNamespace.name
output connectionString string = listKeys('${serviceBusNamespace.id}/AuthorizationRules/RootManageSharedAccessKey', serviceBusNamespace.apiVersion).primaryConnectionString
```

### 3. ตัวจัดการสถานะที่ใช้ร่วมกัน

**ไฟล์: `src/shared/state_manager.py`**

```python
from azure.cosmos import CosmosClient, PartitionKey
from datetime import datetime
import os

class StateManager:
    """Manages shared state across agents using Cosmos DB"""
    
    def __init__(self):
        endpoint = os.environ['COSMOS_ENDPOINT']
        key = os.environ['COSMOS_KEY']
        
        self.client = CosmosClient(endpoint, key)
        self.database = self.client.get_database_client('agent-state')
        self.container = self.database.get_container_client('tasks')
    
    def create_task(self, task_id: str, task_type: str, input_data: dict):
        """Create a new task"""
        task = {
            'id': task_id,
            'type': task_type,
            'status': 'pending',
            'input': input_data,
            'created_at': datetime.utcnow().isoformat(),
            'steps': []
        }
        self.container.create_item(task)
        return task
    
    def update_task_step(self, task_id: str, step_name: str, result: dict):
        """Update task with completed step"""
        task = self.container.read_item(task_id, partition_key=task_id)
        
        task['steps'].append({
            'name': step_name,
            'completed_at': datetime.utcnow().isoformat(),
            'result': result
        })
        
        self.container.replace_item(task_id, task)
        return task
    
    def complete_task(self, task_id: str, final_result: dict):
        """Mark task as complete"""
        task = self.container.read_item(task_id, partition_key=task_id)
        task['status'] = 'completed'
        task['result'] = final_result
        task['completed_at'] = datetime.utcnow().isoformat()
        self.container.replace_item(task_id, task)
        return task
    
    def get_task(self, task_id: str):
        """Retrieve task state"""
        return self.container.read_item(task_id, partition_key=task_id)
```

### 4. บริการ Orchestrator

**ไฟล์: `src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# การเชื่อมต่อ Service Bus
servicebus_connection_str = os.environ['SERVICEBUS_CONNECTION_STRING']
servicebus_client = ServiceBusClient.from_connection_string(servicebus_connection_str)

@app.route('/health', methods=['GET'])
def health():
    return jsonify({'status': 'healthy', 'service': 'orchestrator'})

@app.route('/create-content', methods=['POST'])
def create_content():
    """
    Sequential workflow: Research → Write → Edit → Publish
    """
    data = request.json
    topic = data.get('topic')
    
    if not topic:
        return jsonify({'error': 'Topic required'}), 400
    
    # สร้างงานในที่เก็บสถานะ
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # ส่งข้อความไปยังตัวแทนวิจัย (ขั้นตอนแรก)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # ที่ที่จะส่งผลลัพธ์
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    return jsonify({
        'task_id': task_id,
        'status': 'started',
        'workflow': 'sequential',
        'steps': ['research', 'write', 'edit', 'publish'],
        'message': 'Content creation pipeline initiated'
    }), 202

@app.route('/task/<task_id>', methods=['GET'])
def get_task_status(task_id):
    """Check task status"""
    try:
        task = state_manager.get_task(task_id)
        return jsonify(task)
    except Exception as e:
        return jsonify({'error': str(e)}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

### 5. ตัวแทนวิจัย

**ไฟล์: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# เริ่มต้นไคลเอนต์
state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_research_task(message_data):
    """Process research request and pass to writer"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    next_queue = message_data['next_queue']
    
    print(f"🔬 Researching: {topic}")
    
    # เรียกใช้ Azure OpenAI เพื่อการวิจัย
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # อัปเดตสถานะ
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # ส่งไปยังตัวแทนถัดไป (ผู้เขียน)
    sender = servicebus_client.get_queue_sender(next_queue)
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'research': research_results,
            'next_queue': 'editor-tasks'
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    print(f"✅ Research complete for task {task_id}")

def main():
    """Listen to research queue"""
    receiver = servicebus_client.get_queue_receiver('research-tasks')
    
    print("🔬 Research Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_research_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error processing message: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 6. ตัวแทนเขียน

**ไฟล์: `src/agents/writer/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_writing_task(message_data):
    """Write article based on research"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    research = message_data['research']
    next_queue = message_data['next_queue']
    
    print(f"✍️ Writing article: {topic}")
    
    # เรียกใช้ Azure OpenAI เพื่อเขียนบทความ
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # อัปเดตสถานะ
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # ส่งไปยังบรรณาธิการ
    sender = servicebus_client.get_queue_sender(next_queue)
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'draft': article_draft
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    print(f"✅ Article draft complete for task {task_id}")

def main():
    """Listen to writer queue"""
    receiver = servicebus_client.get_queue_receiver('writer-tasks')
    
    print("✍️ Writer Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_writing_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 7. ตัวแทนแก้ไข

**ไฟล์: `src/agents/editor/app.py`**

```python
from azure.servicebus import ServiceBusClient
from openai import AzureOpenAI
import json
import os
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_editing_task(message_data):
    """Edit and finalize article"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    draft = message_data['draft']
    
    print(f"📝 Editing article: {topic}")
    
    # เรียกใช้ Azure OpenAI เพื่อแก้ไข
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # ทำเครื่องหมายงานว่าเสร็จสมบูรณ์
    state_manager.complete_task(
        task_id=task_id,
        final_result={
            'topic': topic,
            'final_article': final_article,
            'word_count': len(final_article.split())
        }
    )
    
    print(f"✅ Article finalized for task {task_id}")

def main():
    """Listen to editor queue"""
    receiver = servicebus_client.get_queue_receiver('editor-tasks')
    
    print("📝 Editor Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_editing_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 8. การปรับใช้และทดสอบ

```bash
# เริ่มต้นและปรับใช้
azd init
azd up

# รับ URL ของผู้จัดการ
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# สร้างเนื้อหา
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ ผลลัพธ์ที่คาดหวัง:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**ตรวจสอบความคืบหน้าของงาน:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ ผลลัพธ์ที่คาดหวัง (เสร็จสมบูรณ์):**
```json
{
  "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "type": "content_creation",
  "status": "completed",
  "steps": [
    {
      "name": "research",
      "completed_at": "2025-11-19T10:30:00Z",
      "result": {"research": "..."}
    },
    {
      "name": "writing",
      "completed_at": "2025-11-19T10:32:00Z",
      "result": {"draft": "..."}
    }
  ],
  "result": {
    "topic": "The Future of AI in Healthcare",
    "final_article": "...",
    "word_count": 1500
  }
}
```

---

## บทเรียนที่ 2: รูปแบบการประสานงานแบบขนาน

### การดำเนินการ: ตัวรวบรวมการวิจัยจากหลายแหล่ง

มาสร้างระบบขนานที่รวบรวมข้อมูลจากหลายแหล่งพร้อมกัน

### Orchestrator แบบขนาน

**ไฟล์: `src/orchestrator/parallel_workflow.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

@app.route('/research-parallel', methods=['POST'])
def research_parallel():
    """
    Parallel workflow: Multiple agents work simultaneously
    """
    data = request.json
    query = data.get('query')
    
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='parallel_research',
        input_data={
            'query': query,
            'agents': ['web', 'academic', 'news', 'social']
        }
    )
    
    # การกระจาย: ส่งไปยังตัวแทนทั้งหมดพร้อมกัน
    agents = [
        ('web-research-queue', 'web'),
        ('academic-research-queue', 'academic'),
        ('news-research-queue', 'news'),
        ('social-research-queue', 'social')
    ]
    
    for queue_name, agent_type in agents:
        sender = servicebus_client.get_queue_sender(queue_name)
        message = ServiceBusMessage(
            body=json.dumps({
                'task_id': task_id,
                'query': query,
                'agent_type': agent_type,
                'result_queue': 'aggregation-queue'
            }),
            content_type='application/json'
        )
        
        with sender:
            sender.send_messages(message)
    
    return jsonify({
        'task_id': task_id,
        'status': 'started',
        'workflow': 'parallel',
        'agents_dispatched': 4,
        'message': 'Parallel research initiated'
    }), 202

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

### ตรรกะการรวมผลลัพธ์

**ไฟล์: `src/agents/aggregator/app.py`**

```python
from azure.servicebus import ServiceBusClient
import json
import os
from collections import defaultdict
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

# ติดตามผลลัพธ์ต่อภารกิจ
task_results = defaultdict(list)
expected_agents = 4  # เว็บ, วิชาการ, ข่าว, โซเชียล

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # เก็บผลลัพธ์
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # ตรวจสอบว่าเอเจนต์ทั้งหมดเสร็จสิ้น (fan-in)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # รวมผลลัพธ์
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # ทำเครื่องหมายว่าเสร็จสิ้น
        state_manager.complete_task(task_id, aggregated)
        
        # ทำความสะอาด
        del task_results[task_id]
        
        print(f"✅ Aggregation complete for task {task_id}")

def generate_summary(results):
    """Generate summary from all sources"""
    summaries = [r['data'].get('summary', '') for r in results]
    return '\n\n'.join(summaries)

def main():
    """Listen to aggregation queue"""
    receiver = servicebus_client.get_queue_receiver('aggregation-queue')
    
    print("📊 Aggregator started, listening for results...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_result(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

**ข้อดีของรูปแบบขนาน:**
- ⚡ **เร็วขึ้น 4 เท่า** (ตัวแทนทำงานพร้อมกัน)
- 🔄 **ทนต่อความล้มเหลว** (ยอมรับผลลัพธ์บางส่วนได้)
- 📈 **ขยายได้** (เพิ่มตัวแทนได้ง่าย)

---

## แบบฝึกหัดปฏิบัติ

### แบบฝึกหัด 1: เพิ่มการจัดการ Timeout ⭐⭐ (ปานกลาง)

**เป้าหมาย**: เพิ่มตรรกะ timeout เพื่อให้ตัวรวบรวมไม่รอเอเย่นต์ที่ช้าเกินไป

**ขั้นตอน**:

1. **เพิ่มการติดตาม timeout ในตัวรวบรวม:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> expiration_time

def process_result(message_data):
    task_id = message_data['task_id']
    
    # ตั้งค่าการหมดเวลาสำหรับผลลัพธ์แรก
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # ตรวจสอบว่าทำเสร็จแล้วหรือหมดเวลา
    if len(task_results[task_id]) == expected_agents or \
       datetime.utcnow() > task_timeouts[task_id]:
        
        print(f"📊 Aggregating with {len(task_results[task_id])}/{expected_agents} results")
        
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'completed_agents': len(task_results[task_id]),
            'timed_out': len(task_results[task_id]) < expected_agents
        }
        
        state_manager.complete_task(task_id, aggregated)
        
        # ทำความสะอาด
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **ทดสอบด้วยการหน่วงเวลาเทียม:**

```python
# ในตัวแทนหนึ่ง เพิ่มการหน่วงเวลาเพื่อจำลองการประมวลผลที่ช้า
import time
time.sleep(35)  # เกินเวลารอ 30 วินาที
```

3. **ปรับใช้และตรวจสอบ:**

```bash
azd deploy aggregator

# ส่งงาน
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# ตรวจสอบผลลัพธ์หลังจาก 30 วินาที
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ เกณฑ์ความสำเร็จ:**
- ✅ งานเสร็จสิ้นหลัง 30 วินาที แม้ตัวแทนบางตัวไม่เสร็จ
- ✅ การตอบสนองระบุผลลัพธ์บางส่วน (`"timed_out": true`)
- ✅ ผลลัพธ์ที่มีอยู่ถูกส่งกลับ (3 จาก 4 ตัวแทน)

**เวลา**: 20-25 นาที

---

### แบบฝึกหัด 2: เพิ่มตรรกะ Retry ⭐⭐⭐ (ขั้นสูง)

**เป้าหมาย**: ลองทำงานที่ล้มเหลวใหม่โดยอัตโนมัติก่อนยอมแพ้

**ขั้นตอน**:

1. **เพิ่มการติดตาม retry ใน Orchestrator:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # message_id -> retry_count

def send_with_retry(queue_name: str, message_data: dict, retry_config: RetryConfig):
    """Send message with retry metadata"""
    message_id = message_data.get('message_id', str(uuid.uuid4()))
    message_data['message_id'] = message_id
    message_data['retry_count'] = retry_counts.get(message_id, 0)
    message_data['max_retries'] = retry_config.max_retries
    
    sender = servicebus_client.get_queue_sender(queue_name)
    message = ServiceBusMessage(
        body=json.dumps(message_data),
        content_type='application/json',
        message_id=message_id
    )
    
    with sender:
        sender.send_messages(message)
```

2. **เพิ่มตัวจัดการ retry ในตัวแทน:**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # ประมวลผลข้อความ
        process_func(message_data)
        
        # สำเร็จ - เสร็จสมบูรณ์
        receiver.complete_message(message)
        
    except Exception as e:
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # ลองใหม่: ละทิ้งและจัดคิวใหม่พร้อมจำนวนที่เพิ่มขึ้น
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # ส่งกลับไปยังคิวเดิมพร้อมการหน่วงเวลา
            time.sleep(5 * (retry_count + 1))  # การหน่วงเวลาแบบทวีคูณ
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # ลบต้นฉบับ
        else:
            # เกินจำนวนครั้งที่ลองใหม่สูงสุด - ย้ายไปยังคิวจดหมายที่ตายแล้ว
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **ตรวจสอบคิวข้อความที่ล้มเหลว:**

```python
def monitor_dead_letters():
    """Check dead letter queue for failed messages"""
    receiver = servicebus_client.get_queue_receiver(
        'research-queue',
        sub_queue='deadletter'
    )
    
    with receiver:
        messages = receiver.receive_messages(max_wait_time=5)
        for message in messages:
            print(f"☠️ Dead letter: {message.message_id}")
            print(f"Reason: {message.dead_letter_reason}")
            print(f"Description: {message.dead_letter_error_description}")
```

**✅ เกณฑ์ความสำเร็จ:**
- ✅ งานที่ล้มเหลวลองใหม่โดยอัตโนมัติ (สูงสุด 3 ครั้ง)
- ✅ มีการหน่วงเวลาเพิ่มขึ้นระหว่าง retry (5s, 10s, 15s)
- ✅ หลัง retry สูงสุด ข้อความไปยังคิวข้อความที่ล้มเหลว
- ✅ คิวข้อความที่ล้มเหลวสามารถตรวจสอบและเล่นซ้ำได้

**เวลา**: 30-40 นาที

---

### แบบฝึกหัด 3: เพิ่ม Circuit Breaker ⭐⭐⭐ (ขั้นสูง)

**เป้าหมาย**: ป้องกันความล้มเหลวที่ลุกลามโดยหยุดคำขอไปยังตัวแทนที่ล้มเหลว

**ขั้นตอน**:

1. **สร้างคลาส Circuit Breaker:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # การทำงานปกติ
    OPEN = "open"          # ล้มเหลว, ปฏิเสธคำขอ
    HALF_OPEN = "half_open"  # ทดสอบว่าฟื้นตัวหรือยัง

class CircuitBreaker:
    def __init__(self, failure_threshold=5, timeout_seconds=60):
        self.failure_threshold = failure_threshold
        self.timeout_seconds = timeout_seconds
        self.failure_count = 0
        self.last_failure_time = None
        self.state = CircuitState.CLOSED
    
    def call(self, func):
        """Execute function with circuit breaker protection"""
        if self.state == CircuitState.OPEN:
            # ตรวจสอบว่าหมดเวลาหรือยัง
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # สำเร็จ
            if self.state == CircuitState.HALF_OPEN:
                self.state = CircuitState.CLOSED
                self.failure_count = 0
                print("✅ Circuit breaker: CLOSED (recovered)")
            
            return result
            
        except Exception as e:
            self.failure_count += 1
            self.last_failure_time = datetime.utcnow()
            
            if self.failure_count >= self.failure_threshold:
                self.state = CircuitState.OPEN
                print(f"🔴 Circuit breaker: OPEN (too many failures)")
            
            raise e
```

2. **ใช้กับการเรียกตัวแทน:**

```python
# ในตัวจัดการ
agent_circuits = {
    'web': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'academic': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'news': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'social': CircuitBreaker(failure_threshold=5, timeout_seconds=60)
}

def send_to_agent(agent_type, message_data):
    """Send with circuit breaker protection"""
    circuit = agent_circuits[agent_type]
    
    try:
        circuit.call(lambda: send_message(agent_type, message_data))
    except Exception as e:
        print(f"⚠️ Skipping {agent_type} agent: {e}")
        # ดำเนินการต่อกับตัวแทนอื่นๆ
```

3. **ทดสอบ Circuit Breaker:**

```bash
# จำลองความล้มเหลวซ้ำ (หยุดตัวแทนหนึ่งตัว)
az containerapp stop --name web-research-agent --resource-group rg-agents

# ส่งคำขอหลายครั้ง
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# ตรวจสอบบันทึก - ควรเห็นวงจรเปิดหลังจากล้มเหลว 5 ครั้ง
azd logs orchestrator --tail 50
```

**✅ เกณฑ์ความสำเร็จ:**
- ✅ หลังจากล้มเหลว 5 ครั้ง Circuit เปิด (ปฏิเสธคำขอ)
- ✅ หลังจาก 60 วินาที Circuit ไปที่สถานะครึ่งเปิด (ทดสอบการกู้คืน)
- ✅ ตัวแทนอื่นทำงานต่อไปตามปกติ
- ✅ Circuit ปิดโดยอัตโนมัติเมื่อตัวแทนกู้คืน

**เวลา**: 40-50 นาที

---

## การตรวจสอบและแก้ไขข้อผิดพลาด

### การติดตามแบบกระจายด้วย Application Insights

**ไฟล์: `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# กำหนดค่าการติดตาม
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# สร้างตัวติดตาม
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# กำหนดค่าการบันทึก
logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(connection_string=connection_string))
logger.setLevel(logging.INFO)

def trace_agent_call(agent_name, task_id, operation):
    """Trace agent operations"""
    with tracer.span(name=f'{agent_name}.{operation}') as span:
        span.add_attribute('agent', agent_name)
        span.add_attribute('task_id', task_id)
        span.add_attribute('operation', operation)
        
        try:
            result = operation()
            span.add_attribute('status', 'success')
            return result
        except Exception as e:
            span.add_attribute('status', 'error')
            span.add_attribute('error', str(e))
            raise
```

### คำค้นหาใน Application Insights

**ติดตามกระบวนการทำงานของหลายตัวแทน:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**เปรียบเทียบประสิทธิภาพของตัวแทน:**

```kusto
// Compare agent execution times
dependencies
| where name contains "agent"
| summarize 
    avg_duration = avg(duration),
    p95_duration = percentile(duration, 95),
    count = count()
  by agent = tostring(customDimensions.agent)
| order by avg_duration desc
```

**วิเคราะห์ความล้มเหลว:**

```kusto
// Find which agents fail most
exceptions
| where customDimensions.agent != ""
| summarize 
    failure_count = count(),
    unique_errors = dcount(outerMessage)
  by agent = tostring(customDimensions.agent)
| order by failure_count desc
```

---

## การวิเคราะห์ต้นทุน

### ค่าใช้จ่ายระบบหลายตัวแทน (ประมาณการรายเดือน)

| องค์ประกอบ | การตั้งค่า | ค่าใช้จ่าย |
|-----------|--------------|------|
| **Orchestrator** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 Agents** | 4 Container Apps (0.5 vCPU, 1GB each) | $60-120 |
| **Service Bus** | Standard tier, 10M messages | $10-20 |
| **Cosmos DB** | Serverless, 5GB storage, 1M RUs | $25-50 |
| **Blob Storage** | 10GB storage, 100K operations | $5-10 |
| **Application Insights** | 5GB ingestion | $10-15 |
| **Azure OpenAI** | GPT-4, 10M tokens | $100-300 |
| **รวม** | | **$240-565/เดือน** |

### กลยุทธ์การลดต้นทุน

1. **ใช้ serverless เมื่อเป็นไปได้:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **ปรับขนาดตัวแทนเป็นศูนย์เมื่อไม่ได้ใช้งาน:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **ใช้การจัดกลุ่มสำหรับ Service Bus:**
@@
## คู่มือการแก้ปัญหา

### ปัญหา: ข้อความค้างในคิว

**อาการ:**
- ข้อความสะสมในคิว
- ตัวแทนไม่ได้ประมวลผล
- สถานะงานค้างที่ "pending"

**การวินิจฉัย:**
```bash
# ตรวจสอบความลึกของคิว
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# ตรวจสอบสุขภาพของตัวแทน
azd logs research-agent --tail 50
```

**วิธีแก้ไข:**

1. **เพิ่มจำนวนตัวแทน (agent replicas):**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **ตรวจสอบ dead letter queue:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### ปัญหา: งานหมดเวลา/ไม่เสร็จสิ้น

**อาการ:**
- สถานะงานค้างที่ "in_progress"
- ตัวแทนบางตัวเสร็จสิ้น แต่บางตัวไม่
- ไม่มีข้อความแสดงข้อผิดพลาด

**การวินิจฉัย:**
```bash
# ตรวจสอบสถานะงาน
curl $ORCHESTRATOR_URL/task/$TASK_ID

# ตรวจสอบ Application Insights
# รันคำสั่ง: traces | where customDimensions.task_id == "..."
```

**วิธีแก้ไข:**

1. **ตั้งค่า timeout ใน aggregator (Exercise 1)**

2. **ตรวจสอบความล้มเหลวของตัวแทน:**
   ```bash
   azd logs --follow | grep "ERROR\|FAIL"
   ```

3. **ยืนยันว่าตัวแทนทั้งหมดกำลังทำงาน:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## เรียนรู้เพิ่มเติม

### เอกสารทางการ
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### ขั้นตอนถัดไปในคอร์สนี้
- ← ก่อนหน้า: [การวางแผนความจุ](capacity-planning.md)
- → ถัดไป: [การเลือก SKU](sku-selection.md)
- 🏠 [หน้าแรกของคอร์ส](../../README.md)

### ตัวอย่างที่เกี่ยวข้อง
- [ตัวอย่าง Microservices](../../../../examples/microservices) - รูปแบบการสื่อสารของบริการ
- [ตัวอย่าง Azure OpenAI](../../../../examples/azure-openai-chat) - การผสานรวม AI

---

## สรุป

**คุณได้เรียนรู้:**
- ✅ รูปแบบการประสานงาน 5 แบบ (ลำดับ, ขนาน, ลำดับชั้น, ขับเคลื่อนด้วยเหตุการณ์, ฉันทามติ)
- ✅ สถาปัตยกรรมหลายตัวแทนบน Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ การจัดการสถานะในระบบตัวแทนแบบกระจาย
- ✅ การจัดการ timeout, การลองใหม่, และ circuit breakers
- ✅ การตรวจสอบและแก้ไขข้อบกพร่องในระบบกระจาย
- ✅ กลยุทธ์การเพิ่มประสิทธิภาพค่าใช้จ่าย

**ข้อคิดสำคัญ:**
1. **เลือกรูปแบบที่เหมาะสม** - ลำดับสำหรับงานที่ต้องการลำดับ, ขนานสำหรับความเร็ว, ขับเคลื่อนด้วยเหตุการณ์สำหรับความยืดหยุ่น
2. **จัดการสถานะอย่างระมัดระวัง** - ใช้ Cosmos DB หรือเครื่องมือที่คล้ายกันสำหรับสถานะแชร์
3. **จัดการความล้มเหลวอย่างมีประสิทธิภาพ** - Timeout, การลองใหม่, circuit breakers, dead letter queues
4. **ตรวจสอบทุกอย่าง** - การติดตามแบบกระจายเป็นสิ่งสำคัญสำหรับการแก้ไขข้อบกพร่อง
5. **เพิ่มประสิทธิภาพค่าใช้จ่าย** - ปรับขนาดเป็นศูนย์, ใช้ serverless, ใช้ caching

**ขั้นตอนถัดไป:**
1. ทำแบบฝึกหัดปฏิบัติให้เสร็จสิ้น
2. สร้างระบบหลายตัวแทนสำหรับกรณีการใช้งานของคุณ
3. ศึกษา [การเลือก SKU](sku-selection.md) เพื่อเพิ่มประสิทธิภาพและลดค่าใช้จ่าย

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->