# ตัวแทน AI ด้วย Azure Developer CLI

**การนำทางบทเรียน:**
- **📚 หน้าหลักคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนาแบบ AI-First
- **⬅️ ก่อนหน้า**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **➡️ ถัดไป**: [แนวทางปฏิบัติ AI สำหรับโปรดักชัน](production-ai-practices.md)
- **🚀 ขั้นสูง**: [โซลูชันหลายตัวแทน](../../examples/retail-scenario.md)

---

## บทนำ

ตัวแทน AI คือโปรแกรมอิสระที่สามารถรับรู้สภาพแวดล้อม ตัดสินใจ และดำเนินการเพื่อบรรลุเป้าหมายที่กำหนด แตกต่างจากแชทบอทที่ตอบสนองต่อพรอมต์เพียงอย่างเดียว ตัวแทนสามารถ:

- **ใช้เครื่องมือ** - เรียกใช้ API, ค้นหาฐานข้อมูล, รันโค้ด
- **วางแผนและให้เหตุผล** - แบ่งงานที่ซับซ้อนเป็นขั้นตอน
- **เรียนรู้จากบริบท** - รักษาหน่วยความจำและปรับพฤติกรรม
- **ทำงานร่วมกัน** - ทำงานกับตัวแทนอื่น ๆ (ระบบหลายตัวแทน)

คู่มือนี้จะแสดงวิธีปรับใช้ตัวแทน AI ไปยัง Azure โดยใช้ Azure Developer CLI (azd)

## เป้าหมายการเรียนรู้

เมื่อทำคู่มือนี้จบ คุณจะ:
- เข้าใจว่าตัวแทน AI คืออะไรและต่างจากแชทบอทอย่างไร
- ปรับใช้เทมเพลตตัวแทนที่สร้างไว้ล่วงหน้าโดยใช้ AZD
- กำหนดค่า Foundry Agents สำหรับตัวแทนที่กำหนดเอง
- นำรูปแบบตัวแทนพื้นฐานไปใช้ (การใช้เครื่องมือ, RAG, หลายตัวแทน)
- ติดตามและดีบักตัวแทนที่ปรับใช้

## ผลลัพธ์การเรียนรู้

เมื่อเสร็จสิ้น คุณจะสามารถ:
- ปรับใช้แอปพลิเคชันตัวแทน AI ไปยัง Azure ด้วยคำสั่งเดียว
- กำหนดค่าเครื่องมือและความสามารถของตัวแทน
- นำการสร้างแบบเสริมการดึงข้อมูล (RAG) มาประยุกต์กับตัวแทน
- ออกแบบสถาปัตยกรรมหลายตัวแทนสำหรับเวิร์กโฟลว์ที่ซับซ้อน
- แก้ไขปัญหาการปรับใช้ตัวแทนที่พบบ่อย

---

## 🤖 อะไรที่ทำให้ตัวแทนต่างจากแชทบอท?

| คุณสมบัติ | แชทบอท | ตัวแทน AI |
|---------|---------|----------|
| **พฤติกรรม** | ตอบกลับตามพรอมต์ | ดำเนินการอย่างอิสระ |
| **เครื่องมือ** | ไม่มี | สามารถเรียกใช้งาน API, ค้นหา, รันโค้ด |
| **หน่วยความจำ** | เฉพาะแบบในเซสชัน | หน่วยความจำถาวรข้ามเซสชัน |
| **การวางแผน** | ตอบครั้งเดียว | การใช้เหตุผลหลายขั้นตอน |
| **การทำงานร่วมกัน** | เอนทิตีเดียว | สามารถทำงานร่วมกับตัวแทนอื่นๆ |

### อุปมาง่ายๆ

- **แชทบอท** = คนที่ช่วยตอบคำถามที่โต๊ะข้อมูล
- **ตัวแทน AI** = ผู้ช่วยส่วนตัวที่สามารถโทร นัดหมาย และทำงานแทนคุณ

---

## 🚀 เริ่มด่วน: ปรับใช้ตัวแทนตัวแรกของคุณ

### ตัวเลือก 1: เทมเพลต Foundry Agents (แนะนำ)

```bash
# เริ่มต้นเทมเพลตตัวแทน AI
azd init --template get-started-with-ai-agents

# ปรับใช้ไปยัง Azure
azd up
```

**สิ่งที่จะถูกปรับใช้:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (for RAG)
- ✅ Azure Container Apps (web interface)
- ✅ Application Insights (monitoring)

**เวลา:** ~15-20 นาที
**ค่าใช้จ่าย:** ~$100-150/เดือน (สำหรับการพัฒนา)

### ตัวเลือก 2: ตัวแทน OpenAI ด้วย Prompty

```bash
# เริ่มต้นแม่แบบตัวแทนที่ใช้ Prompty
azd init --template agent-openai-python-prompty

# ปรับใช้ไปยัง Azure
azd up
```

**สิ่งที่จะถูกปรับใช้:**
- ✅ Azure Functions (serverless agent execution)
- ✅ Azure OpenAI
- ✅ Prompty configuration files
- ✅ Sample agent implementation

**เวลา:** ~10-15 นาที
**ค่าใช้จ่าย:** ~$50-100/เดือน (สำหรับการพัฒนา)

### ตัวเลือก 3: ตัวแทนแชทแบบ RAG

```bash
# เริ่มต้นเทมเพลตการสนทนาแบบ RAG
azd init --template azure-search-openai-demo

# ปรับใช้ไปยัง Azure
azd up
```

**สิ่งที่จะถูกปรับใช้:**
- ✅ Azure OpenAI
- ✅ Azure AI Search with sample data
- ✅ Document processing pipeline
- ✅ Chat interface with citations

**เวลา:** ~15-25 นาที
**ค่าใช้จ่าย:** ~$80-150/เดือน (สำหรับการพัฒนา)

---

## 🏗️ รูปแบบสถาปัตยกรรมของตัวแทน

### รูปแบบ 1: ตัวแทนเดี่ยวพร้อมเครื่องมือ

รูปแบบตัวแทนที่ง่ายที่สุด - ตัวแทนหนึ่งตัวที่สามารถใช้เครื่องมือต่าง ๆ ได้

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**เหมาะสำหรับ:**
- บอทสนับสนุนลูกค้า
- ผู้ช่วยค้นคว้า
- ตัวแทนวิเคราะห์ข้อมูล

**AZD Template:** `azure-search-openai-demo`

### รูปแบบ 2: ตัวแทน RAG (Retrieval-Augmented Generation)

ตัวแทนที่ดึงเอกสารที่เกี่ยวข้องมาก่อนแล้วจึงสร้างคำตอบ

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**เหมาะสำหรับ:**
- ฐานความรู้ระดับองค์กร
- ระบบถามตอบเอกสาร
- งานวิจัยด้านกฎระเบียบและกฎหมาย

**AZD Template:** `azure-search-openai-demo`

### รูปแบบ 3: ระบบหลายตัวแทน

ตัวแทนเฉพาะทางหลายตัวทำงานร่วมกันในงานที่ซับซ้อน

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**เหมาะสำหรับ:**
- การสร้างเนื้อหาซับซ้อน
- เวิร์กโฟลว์หลายขั้นตอน
- งานที่ต้องการความเชี่ยวชาญต่างกัน

**เรียนรู้เพิ่มเติม:** [รูปแบบการประสานงานหลายตัวแทน](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ การกำหนดค่าเครื่องมือของตัวแทน

ตัวแทนจะทรงพลังเมื่อสามารถใช้เครื่องมือได้ ต่อไปนี้คือวิธีการกำหนดค่าเครื่องมือทั่วไป:

### การกำหนดค่าเครื่องมือใน Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# กำหนดเครื่องมือที่กำหนดเอง
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# สร้างเอเจนต์พร้อมเครื่องมือ
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### การกำหนดค่าสภาพแวดล้อม

```bash
# ตั้งค่าตัวแปรสภาพแวดล้อมเฉพาะสำหรับเอเจนต์
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# ปรับใช้ด้วยการกำหนดค่าที่อัปเดต
azd deploy
```

---

## 📊 การติดตามตัวแทน

### การรวม Application Insights

เทมเพลตตัวแทน AZD ทั้งหมดรวม Application Insights สำหรับการติดตาม:

```bash
# เปิดแดชบอร์ดการตรวจสอบ
azd monitor --overview

# ดูบันทึกแบบเรียลไทม์
azd monitor --logs

# ดูตัวชี้วัดแบบเรียลไทม์
azd monitor --live
```

### ตัวชี้วัดสำคัญที่ต้องติดตาม

| เมตริก | คำอธิบาย | ค่าเป้าหมาย |
|--------|-------------|--------|
| ความหน่วงในการตอบกลับ | เวลาที่ใช้ในการสร้างคำตอบ | < 5 วินาที |
| การใช้โทเค็น | โทเค็นต่อคำขอ | ติดตามค่าใช้จ่าย |
| อัตราความสำเร็จของการเรียกเครื่องมือ | % ของการเรียกเครื่องมือที่สำเร็จ | > 95% |
| อัตราความผิดพลาด | คำขอของตัวแทนที่ล้มเหลว | < 1% |
| ความพึงพอใจของผู้ใช้ | คะแนนตอบรับ | > 4.0/5.0 |

### การบันทึกแบบกำหนดเองสำหรับตัวแทน

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 ข้อควรพิจารณาด้านค่าใช้จ่าย

### ค่าใช้จ่ายโดยประมาณต่อเดือนตามรูปแบบ

| รูปแบบ | สภาพแวดล้อมการพัฒนา | โปรดักชัน |
|---------|-----------------|------------|
| ตัวแทนเดี่ยว | $50-100 | $200-500 |
| ตัวแทน RAG | $80-150 | $300-800 |
| หลายตัวแทน (2-3 ตัว) | $150-300 | $500-1,500 |
| หลายตัวแทนระดับองค์กร | $300-500 | $1,500-5,000+ |

### เคล็ดลับการปรับลดค่าใช้จ่าย

1. **ใช้ GPT-4o-mini สำหรับงานง่ายๆ**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **ใช้งานแคชชิ่งสำหรับคำถามที่ซ้ำกัน**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **ตั้งขีดจำกัดโทเค็น**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # จำกัดความยาวของการตอบ
   )
   ```

4. **สเกลเป็นศูนย์เมื่อไม่ได้ใช้งาน**
   ```bash
   # Container Apps ปรับขนาดลงเป็นศูนย์โดยอัตโนมัติ
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 การแก้ไขปัญหาตัวแทน

### ปัญหาทั่วไปและวิธีแก้ไข

<details>
<summary><strong>❌ ตัวแทนไม่ตอบสนองต่อการเรียกใช้งานเครื่องมือ</strong></summary>

```bash
# ตรวจสอบว่าเครื่องมือได้รับการลงทะเบียนอย่างถูกต้อง
azd show

# ยืนยันการปรับใช้ของ OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# ตรวจสอบบันทึกของเอเจนต์
azd monitor --logs
```

**สาเหตุทั่วไป:**
- ลายเซ็นฟังก์ชันของเครื่องมือไม่ตรงกัน
- สิทธิ์ที่จำเป็นหายไป
- ไม่สามารถเข้าถึงจุดสิ้นสุด API
</details>

<details>
<summary><strong>❌ ความหน่วงสูงในการตอบของตัวแทน</strong></summary>

```bash
# ตรวจสอบ Application Insights เพื่อหาคอขวด
azd monitor --live

# พิจารณาใช้โมเดลที่เร็วขึ้น
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**คำแนะนำการปรับแต่ง:**
- ใช้การตอบกลับแบบสตรีมมิง
- ใช้งานแคชสำหรับการตอบ
- ลดขนาดหน้าต่างบริบท
</details>

<details>
<summary><strong>❌ ตัวแทนให้ข้อมูลไม่ถูกต้องหรือเป็นการหลอกลวง (hallucination)</strong></summary>

```python
# ปรับปรุงด้วยพรอมต์ระบบที่ดีกว่า
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# เพิ่มการดึงข้อมูลเพื่อการอ้างอิง
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # ทำให้คำตอบอิงตามเอกสาร
)
```
</details>

<details>
<summary><strong>❌ ข้อผิดพลาด: เกินขีดจำกัดโทเค็น</strong></summary>

```python
# จัดการหน้าต่างบริบท
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # ประมาณการคร่าวๆ
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 แบบฝึกหัดเชิงปฏิบัติ

### แบบฝึกหัด 1: ปรับใช้ตัวแทนพื้นฐาน (20 นาที)

**เป้าหมาย:** ปรับใช้ตัวแทน AI ตัวแรกของคุณโดยใช้ AZD

```bash
# ขั้นตอนที่ 1: เริ่มต้นแม่แบบ
azd init --template get-started-with-ai-agents

# ขั้นตอนที่ 2: เข้าสู่ระบบ Azure
azd auth login

# ขั้นตอนที่ 3: ปรับใช้
azd up

# ขั้นตอนที่ 4: ทดสอบเอเจนต์
# เปิด URL ที่แสดงในผลลัพธ์

# ขั้นตอนที่ 5: ทำความสะอาด
azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] ตัวแทนตอบคำถามได้
- [ ] สามารถเข้าถึงแดชบอร์ดการติดตาม
- [ ] ลบทรัพยากรเรียบร้อย

### แบบฝึกหัด 2: เพิ่มเครื่องมือที่กำหนดเอง (30 นาที)

**เป้าหมาย:** ขยายตัวแทนด้วยเครื่องมือที่กำหนดเอง

1. ปรับใช้เทมเพลตตัวแทน
2. สร้างฟังก์ชันเครื่องมือใหม่:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # เรียก API ไปยังบริการสภาพอากาศ
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. ลงทะเบียนเครื่องมือกับตัวแทน
4. ทดสอบว่าตัวแทนใช้เครื่องมือใหม่หรือไม่

**เกณฑ์ความสำเร็จ:**
- [ ] ตัวแทนรู้จักคำถามที่เกี่ยวกับสภาพอากาศ
- [ ] เครื่องมือถูกเรียกใช้อย่างถูกต้อง
- [ ] คำตอบมีข้อมูลสภาพอากาศ

### แบบฝึกหัด 3: สร้างตัวแทน RAG (45 นาที)

**เป้าหมาย:** สร้างตัวแทนที่ตอบคำถามจากเอกสารของคุณ

```bash
# ปรับใช้เทมเพลต RAG
azd init --template azure-search-openai-demo
azd up

# อัปโหลดเอกสารของคุณ
# (ปฏิบัติตามคำแนะนำการนำเข้าข้อมูลของเทมเพลต)

# ทดสอบด้วยคำถามเฉพาะด้าน
```

**เกณฑ์ความสำเร็จ:**
- [ ] ตัวแทนตอบจากเอกสารที่อัปโหลด
- [ ] คำตอบมีการอ้างอิง
- [ ] ไม่มีการหลอกลวงเมื่อถามนอกขอบเขต

---

## 📚 ขั้นตอนถัดไป

ตอนนี้ที่คุณเข้าใจตัวแทน AI แล้ว ให้สำรวจหัวข้อขั้นสูงเหล่านี้:

| หัวข้อ | คำอธิบาย | ลิงก์ |
|-------|-------------|------|
| **ระบบหลายตัวแทน** | สร้างระบบที่มีตัวแทนหลายตัวทำงานร่วมกัน | [ตัวอย่างระบบหลายตัวแทนค้าปลีก](../../examples/retail-scenario.md) |
| **รูปแบบการประสานงาน** | เรียนรู้รูปแบบการจัดการและการสื่อสาร | [รูปแบบการประสานงาน](../chapter-06-pre-deployment/coordination-patterns.md) |
| **การปรับใช้ในโปรดักชัน** | การปรับใช้ตัวแทนพร้อมใช้งานในองค์กร | [แนวทางปฏิบัติ AI สำหรับโปรดักชัน](production-ai-practices.md) |
| **การประเมินตัวแทน** | ทดสอบและประเมินประสิทธิภาพของตัวแทน | [การแก้ปัญหา AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 แหล่งข้อมูลเพิ่มเติม

### เอกสารอย่างเป็นทางการ
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### เทมเพลต AZD สำหรับตัวแทน
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### แหล่งชุมชน
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**การนำทาง**
- **บทก่อนหน้า**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **บทถัดไป**: [แนวทางปฏิบัติ AI สำหรับโปรดักชัน](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ข้อจำกัดความรับผิดชอบ:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะมุ่งมั่นให้ผลการแปลมีความถูกต้อง โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อนได้ เอกสารต้นฉบับในภาษาต้นฉบับควรถูกพิจารณาเป็นแหล่งอ้างอิงหลัก สำหรับข้อมูลที่มีความสำคัญ แนะนำให้ใช้การแปลโดยผู้เชี่ยวชาญเป็นคนทำการแปล เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่อาจเกิดขึ้นจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->