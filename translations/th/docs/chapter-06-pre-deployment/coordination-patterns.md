# รูปแบบการประสานงานของตัวแทนหลายตัว

⏱️ **เวลาประมาณ**: 60-75 นาที | 💰 **ค่าใช้จ่ายประมาณ**: ~$100-300/เดือน | ⭐ **ความซับซ้อน**: ขั้นสูง

**📚 เส้นทางการเรียนรู้:**
- ← ก่อนหน้า: [Capacity Planning](capacity-planning.md) - การวางแผนขนาดทรัพยากรและกลยุทธ์การปรับขนาด
- 🎯 **คุณอยู่ที่นี่**: รูปแบบการประสานงานของตัวแทนหลายตัว (การจัดการ, การสื่อสาร, การจัดการสถานะ)
- → ต่อไป: [SKU Selection](sku-selection.md) - การเลือกบริการ Azure ที่เหมาะสม
- 🏠 [หน้าแรกหลักสูตร](../../README.md)

---

## สิ่งที่คุณจะได้เรียนรู้

โดยการทำบทเรียนนี้ให้เสร็จสิ้น คุณจะ:
- เข้าใจรูปแบบ **สถาปัตยกรรมตัวแทนหลายตัว** และเมื่อใดควรใช้
- นำ **รูปแบบการจัดการแบบออร์เคสเตรชัน** มาใช้ (แบบรวมศูนย์, แบบกระจาย, แบบลำดับชั้น)
- ออกแบบกลยุทธ์ **การสื่อสารตัวแทน** (แบบซิงโครนัส, แบบอะซิงโครนัส, กำกับด้วยเหตุการณ์)
- จัดการ **สถานะที่ใช้ร่วมกัน** ในตัวแทนที่กระจายตัว
- ติดตั้ง **ระบบตัวแทนหลายตัว** บน Azure ด้วย AZD
- ประยุกต์ใช้ **รูปแบบการประสานงาน** ในสถานการณ์ AI จริง
- ตรวจสอบและแก้ไขปัญหาระบบตัวแทนที่กระจายตัว

## ทำไมการประสานงานของตัวแทนหลายตัวจึงสำคัญ

### การวิวัฒนาการ: จากตัวแทนเดี่ยวสู่ตัวแทนหลายตัว

**ตัวแทนเดี่ยว (ง่าย):**
```
User → Agent → Response
```
- ✅ เข้าใจและนำไปใช้ได้ง่าย
- ✅ รวดเร็วสำหรับงานง่ายๆ
- ❌ จำกัดด้วยความสามารถของโมเดลเดี่ยว
- ❌ ไม่สามารถประมวลผลแบบขนานในงานซับซ้อนได้
- ❌ ไม่มีความเชี่ยวชาญเฉพาะทาง

**ระบบตัวแทนหลายตัว (ขั้นสูง):**
```mermaid
graph TD
    Orchestrator[Orchestrator] --> Agent1[Agent1<br/>วางแผน]
    Orchestrator --> Agent2[Agent2<br/>โค้ด]
    Orchestrator --> Agent3[Agent3<br/>ตรวจสอบ]
```- ✅ ตัวแทนเฉพาะสำหรับงานเฉพาะ
- ✅ การทำงานแบบขนานเพื่อความรวดเร็ว
- ✅ มีความยืดหยุ่นและบำรุงรักษาได้
- ✅ ดีขึ้นสำหรับเวิร์กโฟลว์ซับซ้อน
- ⚠️ ต้องมีตรรกะการประสานงาน

**เปรียบเทียบ**: ตัวแทนเดี่ยวเหมือนคนคนเดียวทำทุกงาน ตัวแทนหลายตัวเหมือนทีมที่สมาชิกแต่ละคนมีความเชี่ยวชาญเฉพาะด้าน (นักวิจัย, นักเขียนโค้ด, ผู้ตรวจสอบ, นักเขียน) ทำงานร่วมกัน

---

## รูปแบบการประสานงานหลัก

### รูปแบบที่ 1: การประสานงานแบบลำดับ (ห่วงโซ่ความรับผิดชอบ)

**เมื่อใดควรใช้**: งานต้องทำให้เสร็จตามลำดับที่กำหนด โดยตัวแทนแต่ละตัวสร้างต่อจากผลลัพธ์ก่อนหน้า

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as ตัวแทนวิจัย
    participant Agent2 as ตัวแทนเขียน
    participant Agent3 as ตัวแทนบรรณาธิการ
    
    User->>Orchestrator: "เขียนบทความเกี่ยวกับ AI"
    Orchestrator->>Agent1: ค้นคว้าหัวข้อ
    Agent1-->>Orchestrator: ผลการค้นคว้า
    Orchestrator->>Agent2: เขียนร่าง (ใช้การค้นคว้า)
    Agent2-->>Orchestrator: ร่างบทความ
    Orchestrator->>Agent3: แก้ไขและปรับปรุง
    Agent3-->>Orchestrator: บทความขั้นสุดท้าย
    Orchestrator-->>User: บทความที่ขัดเกลาแล้ว
    
    Note over User,Agent3: ลำดับขั้น: แต่ละขั้นตอนรอขั้นตอนก่อนหน้า
```
**ประโยชน์:**
- ✅ การไหลของข้อมูลชัดเจน
- ✅ ง่ายต่อการดีบัก
- ✅ การทำงานมีลำดับที่คาดเดาได้

**ข้อจำกัด:**
- ❌ ช้ากว่า (ไม่มีการทำงานแบบขนาน)
- ❌ ความล้มเหลวหนึ่งครั้งบล็อกทั้งห่วงโซ่
- ❌ ไม่สามารถจัดการงานที่พึ่งพาอาศัยกันได้

**ตัวอย่างการใช้งาน:**
- กระบวนการสร้างเนื้อหา (ค้นคว้า → เขียน → แก้ไข → เผยแพร่)
- การสร้างโค้ด (วางแผน → ทำโค้ด → ทดสอบ → ติดตั้ง)
- การสร้างรายงาน (เก็บข้อมูล → วิเคราะห์ → แสดงผล → สรุป)

---

### รูปแบบที่ 2: การประสานงานแบบขนาน (Fan-Out/Fan-In)

**เมื่อใดควรใช้**: งานอิสระสามารถทำงานพร้อมกันได้ ผลลัพธ์ถูกรวมกันในที่สุด

```mermaid
graph TB
    User[คำขอผู้ใช้]
    Orchestrator[ผู้ควบคุม]
    Agent1[ตัวแทนวิเคราะห์]
    Agent2[ตัวแทนวิจัย]
    Agent3[ตัวแทนข้อมูล]
    Aggregator[ผู้รวบรวมผลลัพธ์]
    Response[การตอบกลับรวม]
    
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
**ประโยชน์:**
- ✅ รวดเร็ว (ทำงานแบบขนาน)
- ✅ ทนทานต่อความล้มเหลว (รับผลลัพธ์บางส่วนได้)
- ✅ ขยายขนาดได้ในแนวนอน

**ข้อจำกัด:**
- ⚠️ ผลลัพธ์อาจมาถึงไม่ตามลำดับ
- ⚠️ ต้องมีตรรกะการรวบรวมผลลัพธ์
- ⚠️ การจัดการสถานะซับซ้อน

**ตัวอย่างการใช้งาน:**
- การรวบรวมข้อมูลจากหลายแหล่ง (API + ฐานข้อมูล + การเก็บข้อมูลเว็บ)
- การวิเคราะห์การแข่งขัน (หลายโมเดลสร้างทางแก้, เลือกดีที่สุด)
- บริการแปลภาษา (แปลพร้อมกันหลายภาษา)

---

### รูปแบบที่ 3: การประสานงานแบบลำดับชั้น (ผู้จัดการ-ผู้ปฏิบัติงาน)

**เมื่อใดควรใช้**: เวิร์กโฟลว์ซับซ้อนที่มีงานย่อย ต้องการการมอบหมายงาน

```mermaid
graph TB
    Master[โปรแกรมจัดการหลัก]
    Manager1[ผู้จัดการวิจัย]
    Manager2[ผู้จัดการเนื้อหา]
    W1[เว็บสแครปเปอร์]
    W2[เครื่องวิเคราะห์บทความ]
    W3[นักเขียน]
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
**ประโยชน์:**
- ✅ จัดการเวิร์กโฟลว์ซับซ้อนได้
- ✅ มีความยืดหยุ่นและบำรุงรักษาได้
- ✅ ขอบเขตความรับผิดชอบชัดเจน

**ข้อจำกัด:**
- ⚠️ สถาปัตยกรรมซับซ้อนขึ้น
- ⚠️ ความหน่วงสูงขึ้น (หลายชั้นการประสานงาน)
- ⚠️ ต้องการการจัดการออร์เคสเตรชันที่ซับซ้อน

**ตัวอย่างการใช้งาน:**
- การประมวลผลเอกสารองค์กร (จัดหมวดหมู่ → ส่งต่อ → ประมวลผล → เก็บถาวร)
- ท่อข้อมูลหลายขั้นตอน (นำเข้า → ทำความสะอาด → แปลงรูป → วิเคราะห์ → รายงาน)
- เวิร์กโฟลว์อัตโนมัติที่ซับซ้อน (วางแผน → จัดสรรทรัพยากร → ดำเนินการ → ตรวจสอบ)

---

### รูปแบบที่ 4: การประสานงานกำกับด้วยเหตุการณ์ (Publish-Subscribe)

**เมื่อใดควรใช้**: ตัวแทนต้องตอบสนองต่อเหตุการณ์ ต้องการการเชื่อมโยงแบบหลวม

```mermaid
sequenceDiagram
    participant Agent1 as ตัวเก็บข้อมูล
    participant EventBus as Azure Service Bus
    participant Agent2 as นักวิเคราะห์
    participant Agent3 as ผู้แจ้งเตือน
    participant Agent4 as ผู้จัดเก็บถาวร
    
    Agent1->>EventBus: Publish "DataReceived" event
    EventBus->>Agent2: Subscribe: วิเคราะห์ข้อมูล
    EventBus->>Agent3: Subscribe: ส่งการแจ้งเตือน
    EventBus->>Agent4: Subscribe: จัดเก็บข้อมูล
    
    Note over Agent1,Agent4: ผู้สมัครทั้งหมดประมวลผลอย่างอิสระ
    
    Agent2->>EventBus: Publish "AnalysisComplete" event
    EventBus->>Agent3: Subscribe: ส่งรายงานวิเคราะห์
```
**ประโยชน์:**
- ✅ การเชื่อมโยงแบบหลวมระหว่างตัวแทน
- ✅ เพิ่มตัวแทนใหม่ได้ง่าย (แค่สมัครรับข้อมูล)
- ✅ การประมวลผลแบบอะซิงโครนัส
- ✅ มีความทนทาน (เก็บข้อความ)

**ข้อจำกัด:**
- ⚠️ ความสอดคล้องในที่สุด
- ⚠️ การดีบักซับซ้อน
- ⚠️ ความท้าทายในการเรียงลำดับข้อความ

**ตัวอย่างการใช้งาน:**
- ระบบตรวจสอบแบบเรียลไทม์ (แจ้งเตือน, แดชบอร์ด, บันทึก)
- การแจ้งเตือนหลายช่องทาง (อีเมล, SMS, push, Slack)
- ท่อการประมวลผลข้อมูล (ผู้บริโภคหลายตัวของข้อมูลชุดเดียวกัน)

---

### รูปแบบที่ 5: การประสานงานแบบจับมือ (Voting/Quorum)

**เมื่อใดควรใช้**: ต้องการการตกลงจากตัวแทนหลายตัวก่อนดำเนินการ

```mermaid
graph TB
    Input[งานนำเข้า]
    Agent1[ตัวแทน 1: gpt-4.1]
    Agent2[ตัวแทน 2: Claude]
    Agent3[ตัวแทน 3: Gemini]
    Voter[ผู้ลงคะแนนเห็นชอบ]
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
**ประโยชน์:**
- ✅ ความแม่นยำสูงขึ้น (หลายความเห็น)
- ✅ ทนทานต่อความล้มเหลว (ยอมรับความล้มเหลวของส่วนน้อยได้)
- ✅ มีระบบประกันคุณภาพในตัว

**ข้อจำกัด:**
- ❌ มีค่าใช้จ่ายสูง (เรียกใช้โมเดลหลายตัว)
- ❌ ช้ากว่า (รอตัวแทนทุกตัว)
- ⚠️ ต้องมีการแก้ไขข้อขัดแย้ง

**ตัวอย่างการใช้งาน:**
- การดูแลเนื้อหา (หลายโมเดลตรวจสอบเนื้อหา)
- การตรวจสอบโค้ด (หลายตัวตรวจสอบ/วิเคราะห์)
- การวินิจฉัยทางการแพทย์ (หลายโมเดล AI, ผู้เชี่ยวชาญตรวจสอบ)

---

## ภาพรวมสถาปัตยกรรม

### ระบบตัวแทนหลายตัวครบวงจรบน Azure

```mermaid
graph TB
    User[ผู้ใช้/ไคลเอนต์ API]
    APIM[การจัดการ API ของ Azure]
    Orchestrator[บริการ Orchestrator<br/>แอป Container]
    ServiceBus[Azure Service Bus<br/>Event Hub]
    
    Agent1[ตัวแทนวิจัย<br/>แอป Container]
    Agent2[ตัวแทนผู้เขียน<br/>แอป Container]
    Agent3[ตัวแทนนักวิเคราะห์<br/>แอป Container]
    Agent4[ตัวแทนผู้ตรวจสอบ<br/>แอป Container]
    
    CosmosDB[(Cosmos DB<br/>สถานะที่ใช้ร่วมกัน)]
    Storage[Azure Storage<br/>ชิ้นงาน]
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
**ส่วนประกอบหลัก:**

| ส่วนประกอบ | จุดประสงค์ | บริการ Azure |
|-----------|---------|---------------|
| **API Gateway** | จุดเข้าระบบ, จำกัดอัตราการใช้งาน, การรับรองสิทธิ์ | API Management |
| **Orchestrator** | จัดการเวิร์กโฟลว์ตัวแทน | Container Apps |
| **Message Queue** | การสื่อสารแบบอะซิงโครนัส | Service Bus / Event Hubs |
| **Agents** | ตัวแทน AI เฉพาะทาง | Container Apps / Functions |
| **State Store** | สถานะที่ใช้ร่วมกัน, การติดตามงาน | Cosmos DB |
| **Artifact Storage** | เอกสาร, ผลลัพธ์, บันทึก | Blob Storage |
| **Monitoring** | การติดตามแบบกระจาย, บันทึก | Application Insights |

---

## ข้อกำหนดเบื้องต้น

### เครื่องมือที่ต้องใช้

```bash
# ตรวจสอบ Azure Developer CLI
azd version
# ✅ ที่คาดไว้: azd เวอร์ชัน 1.0.0 หรือสูงกว่า

# ตรวจสอบ Azure CLI
az --version
# ✅ ที่คาดไว้: azure-cli 2.50.0 หรือสูงกว่า

# ตรวจสอบ Docker (สำหรับการทดสอบในเครื่อง)
docker --version
# ✅ ที่คาดไว้: Docker เวอร์ชัน 20.10 หรือสูงกว่า
```

### ข้อกำหนดบน Azure

- ต้องมีการสมัครใช้งาน Azure
- สิทธิ์ในการสร้าง:
  - Container Apps
  - เนมสเปซ Service Bus
  - บัญชี Cosmos DB
  - บัญชี Storage
  - Application Insights

### ความรู้พื้นฐาน

คุณควรทำเสร็จแล้ว:
- [Configuration Management](../chapter-03-configuration/configuration.md)
- [Authentication & Security](../chapter-03-configuration/authsecurity.md)
- [Microservices Example](../../../../examples/microservices)

---

## คู่มือการดำเนินการ

### โครงสร้างโปรเจกต์

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

## บทเรียน 1: รูปแบบการประสานงานแบบลำดับ

### การใช้งาน: ท่อการสร้างเนื้อหา

เราจะสร้างท่อประสานงานแบบลำดับ: ค้นคว้า → เขียน → แก้ไข → เผยแพร่

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
    
    # สร้างงานใน state store
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
            'next_queue': 'writer-tasks'  # ส่งผลลัพธ์ไปที่ใด
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

### 5. ตัวแทนค้นคว้า

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
    
    # เรียกใช้ Microsoft Foundry Models สำหรับการวิจัย
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
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
    
    # ส่งต่อไปยังตัวแทนถัดไป (ผู้เขียน)
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
    
    # เรียกใช้ Microsoft Foundry Models เพื่อเขียนบทความ
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
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
    
    # เรียกใช้ Microsoft Foundry Models เพื่อแก้ไข
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
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

### 8. การติดตั้งและทดสอบ

```bash
# ตัวเลือก ก: การปรับใช้แบบใช้แม่แบบ
azd init
azd up

# ตัวเลือก ข: การปรับใช้แบบเอกสารเอเจนต์ (ต้องใช้ส่วนขยาย)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> ดู [คำสั่ง AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) สำหรับตัวเลือกและธงทั้งหมดของ `azd ai`

```bash
# รับ URL ตัวควบคุม
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

## บทเรียน 2: รูปแบบการประสานงานแบบขนาน

### การใช้งาน: ตัวรวบรวมข้อมูลค้นคว้าจากหลายแหล่ง

เราจะสร้างระบบแบบขนานที่รวบรวมข้อมูลจากหลายแหล่งพร้อมกัน

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
    
    # ส่งออกพร้อมกัน: ส่งไปยังตัวแทนทั้งหมดพร้อมกัน
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

### ตรรกะการรวบรวมผลลัพธ์

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
expected_agents = 4  # เว็บ, วิชาการ, ข่าว, สังคม

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
    
    # ตรวจสอบว่าเอเจนต์ทั้งหมดเสร็จสิ้นแล้วหรือไม่ (fan-in)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # รวมผลลัพธ์
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # ทำเครื่องหมายว่าสมบูรณ์
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

**ประโยชน์ของรูปแบบแบบขนาน:**
- ⚡ **เร็วขึ้น 4 เท่า** (ตัวแทนทำงานพร้อมกัน)
- 🔄 **ทนทานต่อความล้มเหลว** (รับผลบางส่วนได้)
- 📈 **ขยายขนาดได้** (เพิ่มตัวแทนได้ง่าย)

---

## แบบฝึกหัดจริง

### แบบฝึกหัด 1: เพิ่มการจัดการหมดเวลา ⭐⭐ (ระดับกลาง)

**เป้าหมาย**: นำตรรกะหมดเวลาไปใช้ เพื่อไม่ให้ตัวรวบรวมรอช้าตัวแทนที่ช้าเกินไป

**ขั้นตอน**:

1. **เพิ่มการติดตามหมดเวลาในตัวรวบรวม:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> เวลา หมดอายุ

def process_result(message_data):
    task_id = message_data['task_id']
    
    # ตั้งเวลาหมดเวลาเมื่อได้รับผลลัพธ์แรก
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # ตรวจสอบว่าสมบูรณ์หรือเวลาหมดอายุแล้ว
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

2. **ทดสอบกับการหน่วงเวลาเทียม:**

```python
# ในตัวแทนหนึ่งตัว เพิ่มความล่าช้าเพื่อจำลองการประมวลผลช้า
import time
time.sleep(35)  # เกินเวลาหมดอายุ 30 วินาที
```

3. **ติดตั้งและตรวจสอบ:**

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
- ✅ งานเสร็จภายใน 30 วินาที แม้ว่าตัวแทนบางตัวจะไม่เสร็จ
- ✅ การตอบกลับแสดงผลลัพธ์บางส่วน (`"timed_out": true`)
- ✅ คืนค่าผลลัพธ์ที่มี (3 จาก 4 ตัวแทน)

**เวลา**: 20-25 นาที

---

### แบบฝึกหัด 2: นำตรรกะลองใหม่มาใช้ ⭐⭐⭐ (ขั้นสูง)

**เป้าหมาย**: ลองงานตัวแทนที่ล้มเหลวใหม่โดยอัตโนมัติก่อนยอมแพ้

**ขั้นตอน**:

1. **เพิ่มการติดตามลองใหม่ใน orchestrator:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # message_id -> จำนวนครั้งที่ลองใหม่

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

2. **เพิ่มตัวจัดการลองใหม่ในตัวแทน:**

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
            # ลองใหม่: เลิกและใส่คิวใหม่พร้อมนับเพิ่ม
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # ส่งกลับไปยังคิวเดิมพร้อมหน่วงเวลา
            time.sleep(5 * (retry_count + 1))  # การหน่วงเวลาทวีคูณ
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # ลบต้นฉบับ
        else:
            # เกินจำนวนลองใหม่สูงสุด - ย้ายไปยังคิวจดหมายตาย
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **ตรวจสอบคิวจดหมายตาย:**

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
- ✅ งานล้มเหลวลองใหม่อัตโนมัติ (สูงสุด 3 ครั้ง)
- ✅ การหน่วงเวลาขึ้นเป็นทวีคูณระหว่างการลองใหม่ (5s, 10s, 15s)
- ✅ หลังลองใหม่ครบ จะส่งข้อความไปคิวจดหมายตาย
- ✅ สามารถตรวจสอบและเล่นซ้ำข้อความในคิวจดหมายตายได้

**เวลา**: 30-40 นาที

---

### แบบฝึกหัด 3: นำวงจรเบรกเกอร์มาใช้ ⭐⭐⭐ (ขั้นสูง)

**เป้าหมาย**: ป้องกันความล้มเหลวลามโดยการหยุดคำขอไปยังตัวแทนที่ล้มเหลว

**ขั้นตอน**:

1. **สร้างคลาสวงจรเบรกเกอร์:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # การทำงานปกติ
    OPEN = "open"          # ล้มเหลว ปฏิเสธคำขอ
    HALF_OPEN = "half_open"  # ทดสอบว่าฟื้นตัวหรือไม่

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

2. **ประยุกต์ใช้กับการเรียกตัวแทน:**

```python
# ในออร์เคสตราเตอร์
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
        # ดำเนินการต่อกับเอเจนต์อื่น ๆ
```

3. **ทดสอบวงจรเบรกเกอร์:**

```bash
# จำลองความล้มเหลวซ้ำๆ (หยุดเอเจนต์หนึ่งตัว)
az containerapp stop --name web-research-agent --resource-group rg-agents

# ส่งคำขอหลายรายการ
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# ตรวจสอบบันทึก — ควรเห็นวงจรเปิดหลังจากล้มเหลว 5 ครั้ง
# ใช้ Azure CLI สำหรับบันทึกแอปคอนเทนเนอร์:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ เกณฑ์ความสำเร็จ:**
- ✅ หลังล้มเหลว 5 ครั้ง วงจรเปิด (ปฏิเสธคำขอ)
- ✅ หลัง 60 วินาที วงจรเปิดครึ่งหนึ่ง (ทดสอบการกู้คืน)
- ✅ ตัวแทนอื่่นทำงานต่อไปได้ตามปกติ
- ✅ วงจรปิดเองเมื่อเกิดการกู้คืน

**เวลา**: 40-50 นาที

---

## การตรวจสอบและแก้ไขปัญหา

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

# กำหนดค่าการบันทึกข้อมูล
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

### คำสั่งสอบถาม Application Insights

**ติดตามเวิร์กโฟลว์ตัวแทนหลายตัว:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**เปรียบเทียบประสิทธิภาพตัวแทน:**

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

## การวิเคราะห์ค่าใช้จ่าย

### ค่าใช้จ่ายระบบตัวแทนหลายตัว (ประมาณรายเดือน)

| ส่วนประกอบ | การตั้งค่า | ค่าใช้จ่าย |
|-----------|--------------|------|
| **Orchestrator** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 ตัวแทน** | 4 Container Apps (0.5 vCPU, 1GB แต่ละตัว) | $60-120 |
| **Service Bus** | ระดับมาตรฐาน, 10 ล้านข้อความ | $10-20 |
| **Cosmos DB** | Serverless, พื้นที่ 5GB, 1 ล้าน RUs | $25-50 |
| **Blob Storage** | พื้นที่ 10GB, 100,000 การดำเนินการ | $5-10 |
| **Application Insights** | การดึงข้อมูล 5GB | $10-15 |
| **Microsoft Foundry Models** | gpt-4.1, 10 ล้านโทเคน | $100-300 |
| **รวม** | | **$240-565/เดือน** |

### กลยุทธ์การปรับค่าใช้จ่าย

1. **ใช้ serverless เมื่อทำได้:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **ลดขนาดตัวแทนเป็นศูนย์เมื่อว่างงาน:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **ใช้การทำงานแบบแบตช์สำหรับ Service Bus:**
   ```python
   # ส่งข้อความเป็นชุด (ถูกกว่า)
   sender.send_messages([message1, message2, message3])
   ```

4. **เก็บแคชผลลัพธ์ที่ใช้บ่อย:**
   ```python
   # ใช้ Azure Cache สำหรับ Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## แนวทางปฏิบัติที่ดีที่สุด

### ✅ ควรทำ:

1. **ใช้การทำงานแบบเอื้อผลลัพธ์ซ้ำได้ (idempotent)**
   ```python
   # ตัวแทนสามารถประมวลผลข้อความเดียวกันได้หลายครั้งอย่างปลอดภัย
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # กำลังประมวลผลงาน...
   ```

2. **บันทึกเหตุการณ์อย่างครบถ้วน**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **ใช้รหัสเชื่อมโยง (correlation IDs)**
   ```python
   # ส่งต่อ task_id ผ่านกระบวนการทั้งหมด
   message_data = {
       'task_id': task_id,  # รหัสความสัมพันธ์
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **ตั้งค่าเวลาหมดอายุของข้อความ (TTL)**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **ตรวจสอบคิวจดหมายตาย (dead letter queues)**
   ```python
   # การตรวจสอบข้อความที่ล้มเหลวอย่างสม่ำเสมอ
   monitor_dead_letters()
   ```

### ❌ หลีกเลี่ยง:

1. **อย่าสร้างการขึ้นต่อกันแบบวงกลม**
   ```python
   # ❌ ไม่ดี: ตัวแทน A → ตัวแทน B → ตัวแทน A (ลูปไม่สิ้นสุด)
   # ✅ ดี: กำหนดกราฟมีทิศทางไม่มีวงจร (DAG) ที่ชัดเจน
   ```

2. **อย่าบล็อกเธรดของตัวแทน**
   ```python
   # ❌ แย่: การรอแบบซิงโครนัส
   while not task_complete:
       time.sleep(1)
   
   # ✅ ดี: ใช้ callback จากคิวข้อความ
   ```

3. **อย่ามองข้ามความล้มเหลวบางส่วน**
   ```python
   # ❌ ไม่ดี: ถ้างานตัวแทนตัวใดตัวหนึ่งล้มเหลวให้ล้มเหลวทั้งกระบวนการทำงาน
   # ✅ ดี: คืนผลลัพธ์บางส่วนพร้อมตัวชี้วัดข้อผิดพลาด
   ```

4. **อย่าใช้การลองซ้ำแบบไม่จำกัด**
   ```python
   # ❌ ไม่ดี: พยายามใหม่ตลอดไป
   # ✅ ดี: max_retries = 3, จากนั้นส่งไปที่ dead letter
   ```

---

## คู่มือแก้ไขปัญหา

### ปัญหา: ข้อความค้างในคิว

**อาการ:**
- ข้อความสะสมอยู่ในคิว
- ตัวแทนไม่ประมวลผล
- สถานะงานติดที่ "รอดำเนินการ"

**การวินิจฉัย:**
```bash
# ตรวจสอบความลึกของคิว
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# ตรวจสอบบันทึกของเอเย่นต์โดยใช้ Azure CLI
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**วิธีแก้ไข:**

1. **เพิ่มจำนวนตัวแทน:**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **ตรวจสอบคิวจดหมายตาย:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### ปัญหา: งานหมดเวลาหรือไม่เสร็จสมบูรณ์

**อาการ:**
- สถานะงานค้างที่ "กำลังดำเนินการ"
- ตัวแทนบางตัวเสร็จ บางตัวไม่เสร็จ
- ไม่มีข้อความแสดงข้อผิดพลาด

**การวินิจฉัย:**
```bash
# ตรวจสอบสถานะงาน
curl $ORCHESTRATOR_URL/task/$TASK_ID

# ตรวจสอบ Application Insights
# เรียกใช้คำสั่งค้นหา: traces | where customDimensions.task_id == "..."
```

**วิธีแก้ไข:**

1. **เพิ่มการหมดเวลาในตัวรวบรวมข้อมูล (แบบฝึกหัด 1)**

2. **ตรวจสอบความล้มเหลวของตัวแทนโดยใช้ Azure Monitor:**
   ```bash
   # ดูบันทึกผ่าน azd monitor
   azd monitor --logs
   
   # หรือใช้ Azure CLI เพื่อตรวจสอบบันทึกของแอปคอนเทนเนอร์เฉพาะ
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **ยืนยันว่าตัวแทนทั้งหมดกำลังทำงาน:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## เรียนรู้เพิ่มเติม

### เอกสารอย่างเป็นทางการ
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [รูปแบบการออกแบบ Multi-Agent](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### ขั้นตอนถัดไปในหลักสูตรนี้
- ← ก่อนหน้า: [การวางแผนความจุ](capacity-planning.md)
- → ถัดไป: [การเลือก SKU](sku-selection.md)
- 🏠 [หน้าหลักของหลักสูตร](../../README.md)

### ตัวอย่างที่เกี่ยวข้อง
- [ตัวอย่างไมโครเซอร์วิส](../../../../examples/microservices) - รูปแบบการสื่อสารบริการ
- [ตัวอย่างโมเดล Microsoft Foundry](../../../../examples/azure-openai-chat) - การรวม AI

---

## สรุป

**คุณได้เรียนรู้:**
- ✅ รูปแบบการประสานงาน 5 แบบ (เรียงลำดับ, พร้อมกัน, เป็นลำดับชั้น, ขับเคลื่อนด้วยเหตุการณ์, ฉันทามติ)
- ✅ สถาปัตยกรรม multi-agent บน Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ การจัดการสถานะข้ามตัวแทนกระจาย
- ✅ การจัดการหมดเวลา, การลองซ้ำ, และสวิตช์วงจร
- ✅ การตรวจสอบและแก้ไขระบบกระจาย
- ✅ กลยุทธ์การปรับแต่งค่าใช้จ่าย

**ข้อคิดสำคัญ:**
1. **เลือกแบบแผนที่เหมาะสม** - เรียงลำดับสำหรับเวิร์กโฟลว์ที่ต้องการความถูกต้อง, พร้อมกันเพื่อความเร็ว, ขับเคลื่อนด้วยเหตุการณ์เพื่อความยืดหยุ่น
2. **จัดการสถานะอย่างระมัดระวัง** - ใช้ Cosmos DB หรือระบบที่คล้ายกันสำหรับสถานะร่วม
3. **จัดการความล้มเหลวอย่างมีประสิทธิภาพ** - หมดเวลา, การลองซ้ำ, สวิตช์วงจร, คิวจดหมายตาย
4. **ตรวจสอบทุกอย่าง** - การติดตามแบบกระจายจำเป็นสำหรับการแก้ไขข้อผิดพลาด
5. **ปรับแต่งค่าใช้จ่าย** - ขยายไปเป็นศูนย์, ใช้เซิร์ฟเวอร์เลส, ใช้แคช

**ขั้นตอนถัดไป:**
1. ทำแบบฝึกหัดปฏิบัติให้เสร็จ
2. สร้างระบบ multi-agent สำหรับกรณีการใช้งานของคุณ
3. ศึกษา [การเลือก SKU](sku-selection.md) เพื่อปรับแต่งประสิทธิภาพและค่าใช้จ่าย

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้คำแปลมีความถูกต้อง โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่แม่นยำ เอกสารต้นฉบับในภาษาต้นทางถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลสำคัญแนะนำให้ใช้บริการแปลโดยนักแปลมืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดใดๆ ที่เกิดจากการใช้คำแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->