# ตัวอย่าง - เทมเพลตและการตั้งค่า AZD เชิงปฏิบัติ

**เรียนรู้จากตัวอย่าง - จัดเรียงตามบทเรียน**  
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../README.md)  
- **📖 การจัดเรียงบทเรียน**: ตัวอย่างจัดเรียงตามความซับซ้อนของการเรียนรู้  
- **🚀 ตัวอย่างในเครื่อง**: [โซลูชันหลายตัวแทนค้าปลีก](retail-scenario.md)  
- **🤖 ตัวอย่าง AI ภายนอก**: ลิงก์ไปยังที่เก็บ Azure Samples  

> **📍 สำคัญ: ตัวอย่างในเครื่อง vs ตัวอย่างภายนอก**  
> ที่เก็บนี้ประกอบด้วย **ตัวอย่างในเครื่องครบถ้วน 4 ตัวอย่าง** พร้อมการใช้งานเต็มรูปแบบ:  
> - **Microsoft Foundry Models Chat** (ดีพลอย gpt-4.1 พร้อมอินเทอร์เฟซแชท)  
> - **Container Apps** (API Flask ง่าย + ไมโครเซอร์วิส)  
> - **แอปฐานข้อมูล** (เว็บ + ฐานข้อมูล SQL)  
> - **Retail Multi-Agent** (โซลูชัน AI สำหรับองค์กร)  
>  
> ตัวอย่างเพิ่มเติมเป็น **การอ้างอิงภายนอก** ไปยังที่เก็บ Azure-Samples ที่คุณสามารถโคลนได้

## บทนำ

ไดเรกทอรีนี้มีตัวอย่างเชิงปฏิบัติและการอ้างอิงเพื่อช่วยให้คุณเรียนรู้ Azure Developer CLI ผ่านการฝึกปฏิบัติ โครงเรื่อง Retail Multi-Agent เป็นการใช้งานครบถ้วนพร้อมใช้งานจริงที่รวมอยู่ในที่เก็บนี้ ตัวอย่างเพิ่มเติมเป็นการอ้างอิงถึง Azure Samples อย่างเป็นทางการที่แสดงรูปแบบ AZD ต่างๆ

### คำอธิบายระดับความซับซ้อน

- ⭐ **ผู้เริ่มต้น** - แนวคิดพื้นฐาน บริการเดี่ยว ใช้เวลา 15-30 นาที  
- ⭐⭐ **ระดับกลาง** - บริการหลายอย่าง การผนวกรวมฐานข้อมูล 30-60 นาที  
- ⭐⭐⭐ **ขั้นสูง** - สถาปัตยกรรมซับซ้อน การผนวกรวม AI 1-2 ชั่วโมง  
- ⭐⭐⭐⭐ **ผู้เชี่ยวชาญ** - พร้อมใช้งานจริง รูปแบบองค์กร 2 ชั่วโมงขึ้นไป

## 🎯 สิ่งที่มีในที่เก็บนี้

### ✅ การใช้งานในเครื่อง (พร้อมใช้งาน)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕  
**ดีพลอย gpt-4.1 ครบถ้วน พร้อมอินเทอร์เฟซแชทรวมในที่เก็บนี้**

- **ตำแหน่ง:** `examples/azure-openai-chat/`  
- **ความซับซ้อน:** ⭐⭐ (ระดับกลาง)  
- **ประกอบด้วย:**
  - การดีพลอย Microsoft Foundry Models ครบถ้วน (gpt-4.1)  
  - อินเทอร์เฟซแชทแบบคอมมานด์ไลน์ใน Python  
  - การผนวกรวม Key Vault สำหรับคีย์ API ที่ปลอดภัย  
  - เทมเพลตโครงสร้างพื้นฐาน Bicep  
  - การติดตามการใช้โทเค็นและค่าใช้จ่าย  
  - การจำกัดอัตราและการจัดการข้อผิดพลาด  

**เริ่มต้นอย่างรวดเร็ว:**  
```bash
# ไปที่ตัวอย่าง
cd examples/azure-openai-chat

# นำส่งทุกอย่าง
azd up

# ติดตั้ง dependencies และเริ่มแชท
pip install -r src/requirements.txt
python src/chat.py
```
  
**เทคโนโลยี:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [ตัวอย่าง Container App](container-app/README.md) 🆕  
**ตัวอย่างการดีพลอยคอนเทนเนอร์ครบถ้วนรวมในที่เก็บนี้**

- **ตำแหน่ง:** `examples/container-app/`  
- **ความซับซ้อน:** ⭐-⭐⭐⭐⭐ (ตั้งแต่ผู้เริ่มต้นถึงขั้นสูง)  
- **ประกอบด้วย:**
  - [คู่มือหลัก](container-app/README.md) - ภาพรวมการดีพลอยคอนเทนเนอร์ครบถ้วน  
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - ตัวอย่าง REST API พื้นฐาน  
  - [สถาปัตยกรรมไมโครเซอร์วิส](../../../examples/container-app/microservices) - การดีพลอยบริการหลายอย่างพร้อมใช้ในผลิต  
  - รูปแบบการเริ่มต้นอย่างรวดเร็ว, การผลิต และขั้นสูง  
  - การเฝ้าติดตาม, ความปลอดภัย, และการเพิ่มประสิทธิภาพค่าใช้จ่าย  

**เริ่มต้นอย่างรวดเร็ว:**  
```bash
# ดูคู่มือหลัก
cd examples/container-app

# ติดตั้งใช้งาน Flask API แบบง่าย
cd simple-flask-api
azd up

# ติดตั้งตัวอย่างไมโครเซอร์วิส
cd ../microservices
azd up
```
  
**เทคโนโลยี:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [โซลูชัน Retail Multi-Agent](retail-scenario.md) 🆕  
**การใช้งานครบถ้วนพร้อมใช้งานจริงรวมในที่เก็บนี้**

- **ตำแหน่ง:** `examples/retail-multiagent-arm-template/`  
- **ความซับซ้อน:** ⭐⭐⭐⭐ (ขั้นสูง)  
- **ประกอบด้วย:**
  - เทมเพลตการดีพลอย ARM ครบถ้วน  
  - สถาปัตยกรรมหลายตัวแทน (ลูกค้า + สต็อกสินค้า)  
  - การผนวกรวม Microsoft Foundry Models  
  - การค้นหา AI ด้วย RAG  
  - การเฝ้าติดตามครบวงจร  
  - สคริปต์ดีพลอยหนึ่งคลิก  

**เริ่มต้นอย่างรวดเร็ว:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**เทคโนโลยี:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 ตัวอย่าง Azure ภายนอก (โคลนเพื่อนำไปใช้)

ตัวอย่างดังต่อไปนี้ถูกดูแลในที่เก็บ Azure-Samples อย่างเป็นทางการ คุณสามารถโคลนเพื่อสำรวจรูปแบบ AZD ต่างๆ:

### แอปพลิเคชันง่าย ๆ (บท 1-2)

| เทมเพลต  | ที่เก็บ | ความซับซ้อน | บริการ |
|:---------|:--------|:------------|:-------|
| **Python Flask API** | [ในเครื่อง: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **ไมโครเซอร์วิส** | [ในเครื่อง: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | บริการหลายอย่าง, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**วิธีใช้:**  
```bash
# โคลนตัวอย่างใดก็ได้
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ปล่อยใช้งาน
azd up
```
  
### ตัวอย่างแอป AI (บท 2, 5, 8)

| เทมเพลต | ที่เก็บ | ความซับซ้อน | จุดเน้น |
|:---------|:--------|:------------|:--------|
| **Microsoft Foundry Models Chat** | [ในเครื่อง: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | ดีพลอย gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | แชท AI พื้นฐาน |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | เฟรมเวิร์กตัวแทน |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | รูปแบบ RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI องค์กร |

### Database & รูปแบบขั้นสูง (บท 3-8)

| เทมเพลต | ที่เก็บ | ความซับซ้อน | จุดเน้น |
|:---------|:--------|:------------|:--------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | การผนวกรวมฐานข้อมูล |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | บริการหลายอย่าง |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## เป้าหมายการเรียนรู้

โดยการทำงานผ่านตัวอย่างเหล่านี้ คุณจะได้:  
- ฝึกเวิร์กโฟลว์ Azure Developer CLI กับสถานการณ์แอปจริง  
- เข้าใจสถาปัตยกรรมแอปต่างๆ และการใช้งาน azd  
- เชี่ยวชาญรูปแบบ Infrastructure as Code สำหรับบริการ Azure ต่างๆ  
- นำกลยุทธ์การจัดการการตั้งค่าและการดีพลอยที่เหมาะกับสภาพแวดล้อมไปใช้  
- ใช้รูปแบบการเฝ้าติดตาม ความปลอดภัย และการปรับขนาดในบริบทปฏิบัติ  
- สร้างประสบการณ์การแก้ไขปัญหาและดีบักสถานการณ์ดีพลอยจริง

## ผลลัพธ์การเรียนรู้

หลังจากทำตัวอย่างเหล่านี้เสร็จสิ้น คุณจะสามารถ:  
- ดีพลอยแอปพลิเคชันต่างๆ โดยใช้ Azure Developer CLI อย่างมั่นใจ  
- ปรับเทมเพลตที่ให้มาให้เหมาะกับความต้องการแอปของคุณเอง  
- ออกแบบและใช้งานรูปแบบโครงสร้างพื้นฐานเฉพาะด้วย Bicep  
- กำหนดค่าแอปหลายบริการที่ซับซ้อนพร้อมจัดการการพึ่งพาอย่างถูกต้อง  
- ใช้แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย เฝ้าติดตาม และประสิทธิภาพในสถานการณ์จริง  
- แก้ไขปัญหาและเพิ่มประสิทธิภาพการดีพลอยตามประสบการณ์จริง

## โครงสร้างไดเรกทอรี

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```
  
## ตัวอย่างเริ่มต้นอย่างรวดเร็ว

> **💡 ใหม่กับ AZD?** เริ่มจากตัวอย่าง #1 (Flask API) - ใช้เวลาประมาณ 20 นาทีและสอนแนวคิดหลัก

### สำหรับผู้เริ่มต้น  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ในเครื่อง) ⭐  
   ดีพลอย REST API ง่ายพร้อมสเกลเป็นศูนย์  
   **เวลา:** 20-25 นาที | **ค่าใช้จ่าย:** $0-5/เดือน  
   **สิ่งที่จะได้เรียนรู้:** เวิร์กโฟลว์พื้นฐาน azd, การคอนเทนเนอร์, การตรวจสอบสุขภาพ  
   **ผลลัพธ์ที่คาดหวัง:** จุดสิ้นสุด API ที่ใช้งานได้ แสดงข้อความ "Hello, World!" พร้อมการเฝ้าติดตาม

2. **[เว็บแอปง่ายๆ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   ดีพลอยเว็บแอป Node.js Express พร้อมฐานข้อมูล MongoDB  
   **เวลา:** 25-35 นาที | **ค่าใช้จ่าย:** $10-30/เดือน  
   **สิ่งที่จะได้เรียนรู้:** การผนวกรวมฐานข้อมูล, ตัวแปรสภาพแวดล้อม, สตริงการเชื่อมต่อ  
   **ผลลัพธ์ที่คาดหวัง:** แอปรายชื่อสิ่งที่ต้องทำ พร้อมฟังก์ชันสร้าง/อ่าน/แก้ไข/ลบ

3. **[เว็บไซต์สแตติก - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   โฮสต์เว็บไซต์ React สแตติกด้วย Azure Static Web Apps  
   **เวลา:** 20-30 นาที | **ค่าใช้จ่าย:** $0-10/เดือน  
   **สิ่งที่จะได้เรียนรู้:** โฮสติ้งสแตติก, ฟังก์ชันแบบไม่มีเซิร์ฟเวอร์, ดีพลอยผ่าน CDN  
   **ผลลัพธ์ที่คาดหวัง:** UI React พร้อมแบ็กเอนด์ API, SSL อัตโนมัติ, CDN ทั่วโลก

### สำหรับผู้ใช้ระดับกลาง  
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (ในเครื่อง) ⭐⭐  
   ดีพลอย gpt-4.1 พร้อมอินเทอร์เฟซแชทและจัดการคีย์ API อย่างปลอดภัย  
   **เวลา:** 35-45 นาที | **ค่าใช้จ่าย:** $50-200/เดือน  
   **สิ่งที่จะได้เรียนรู้:** การดีพลอย Microsoft Foundry Models, การผนวกรวม Key Vault, การติดตามโทเค็น  
   **ผลลัพธ์ที่คาดหวัง:** แอปแชทใช้งานได้ด้วย gpt-4.1 และการเฝ้าติดตามค่าใช้จ่าย

5. **[Container App - ไมโครเซอร์วิส](../../../examples/container-app/microservices)** (ในเครื่อง) ⭐⭐⭐⭐  
   สถาปัตยกรรมบริการหลายตัวพร้อมใช้งานจริง  
   **เวลา:** 45-60 นาที | **ค่าใช้จ่าย:** $50-150/เดือน  
   **สิ่งที่จะได้เรียนรู้:** การสื่อสารบริการ, คิวข้อความ, การติดตามแบบกระจาย  
   **ผลลัพธ์ที่คาดหวัง:** ระบบสองบริการ (API Gateway + Product Service) พร้อมการเฝ้าติดตาม

6. **[แอปฐานข้อมูล - C# กับ Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   เว็บแอปด้วย C# API และ Azure SQL Database  
   **เวลา:** 30-45 นาที | **ค่าใช้จ่าย:** $20-80/เดือน  
   **สิ่งที่จะได้เรียนรู้:** Entity Framework, การย้ายฐานข้อมูล, ความปลอดภัยการเชื่อมต่อ  
   **ผลลัพธ์ที่คาดหวัง:** C# API พร้อมแบ็กเอนด์ Azure SQL และดีพลอยสคีมาอัตโนมัติ

7. **[ฟังก์ชันแบบไม่มีเซิร์ฟเวอร์ - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions พร้อมทริกเกอร์ HTTP และ Cosmos DB  
   **เวลา:** 30-40 นาที | **ค่าใช้จ่าย:** $10-40/เดือน  
   **สิ่งที่จะได้เรียนรู้:** สถาปัตยกรรมอีเวนต์, สเกลแบบไม่มีเซิร์ฟเวอร์, การผนวกรวม NoSQL  
   **ผลลัพธ์ที่คาดหวัง:** แอปฟังก์ชันตอบสนองคำขอ HTTP พร้อมการจัดเก็บบน Cosmos DB

8. **[ไมโครเซอร์วิส - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   แอป Java หลายบริการพร้อม Container Apps และ API gateway  
   **เวลา:** 60-90 นาที | **ค่าใช้จ่าย:** $80-200/เดือน  
   **สิ่งที่จะได้เรียนรู้:** การดีพลอย Spring Boot, service mesh, โหลดบาลานซ์  
   **ผลลัพธ์ที่คาดหวัง:** ระบบ Java หลายบริการพร้อมค้นหาบริการและการกำหนดเส้นทาง

### เทมเพลต Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - ตัวอย่างในเครื่อง](../../../examples/azure-openai-chat)** ⭐⭐  
   ดีพลอย gpt-4.1 ครบถ้วน พร้อมอินเทอร์เฟซแชท  
   **เวลา:** 35-45 นาที | **ค่าใช้จ่าย:** $50-200/เดือน  
   **ผลลัพธ์ที่คาดหวัง:** แอปแชทใช้งานได้ พร้อมติดตามโทเค็นและค่าใช้จ่าย

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   แอปแชทอัจฉริยะด้วยสถาปัตยกรรม RAG  
   **เวลา:** 60-90 นาที | **ค่าใช้จ่าย:** $100-300/เดือน  
   **ผลลัพธ์ที่คาดหวัง:** อินเทอร์เฟซแชทที่ขับเคลื่อนด้วย RAG พร้อมค้นหาเอกสารและการอ้างอิง

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   การวิเคราะห์เอกสารโดยใช้บริการ AI ของ Azure  
   **เวลา:** 40-60 นาที | **ค่าใช้จ่าย:** $20-80/เดือน  
   **ผลลัพธ์ที่คาดหวัง:** API ดึงข้อความ ตาราง และเอนทิตีจากเอกสารที่อัปโหลด

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   เวิร์กโฟลว์ MLOps กับ Azure Machine Learning  
   **เวลา:** 2-3 ชั่วโมง | **ค่าใช้จ่าย:** $150-500/เดือน  
   **ผลลัพธ์ที่คาดหวัง:** สายงาน ML อัตโนมัติพร้อมการฝึก การดีพลอย และการเฝ้าติดตาม

### สถานการณ์จริง

#### **โซลูชัน Retail Multi-Agent** 🆕  
**[คู่มือการใช้งานครบถ้วน](./retail-scenario.md)**

โซลูชันการสนับสนุนลูกค้าหลายตัวแทนพร้อมใช้งานจริงอย่างครอบคลุมซึ่งแสดงถึงการดีพลอยแอป AI ระดับองค์กรด้วย AZD โครงเรื่องนี้ให้:
- **สถาปัตยกรรมครบถ้วน**: ระบบตัวแทนหลายตัวพร้อมตัวแทนบริการลูกค้าและการจัดการสินค้าคงคลังเฉพาะทาง  
- **โครงสร้างพื้นฐานสำหรับการผลิต**: การปรับใช้ Microsoft Foundry Models หลายภูมิภาค, AI Search, Container Apps และการตรวจสอบอย่างครอบคลุม  
- **ARM Template พร้อมใช้งานทันที**: การปรับใช้ด้วยคลิกเดียวพร้อมโหมดการกำหนดค่าหลายแบบ (Minimal/Standard/Premium)  
- **ฟีเจอร์ขั้นสูง**: การทดสอบความปลอดภัยแบบ Red teaming, กรอบการประเมินตัวแทน, การเพิ่มประสิทธิภาพค่าใช้จ่าย และคู่มือแก้ไขปัญหา  
- **บริบททางธุรกิจจริง**: กรณีการใช้งานบริการลูกค้าในค้าปลีกพร้อมการอัปโหลดไฟล์, การผสานรวมการค้นหา และการปรับขนาดแบบไดนามิก  

**เทคโนโลยี**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**ความซับซ้อน**: ⭐⭐⭐⭐ (ระดับสูง - พร้อมสำหรับการผลิตในองค์กร)  

**เหมาะสำหรับ**: นักพัฒนา AI, สถาปนิกโซลูชัน และทีมที่สร้างระบบตัวแทนหลายตัวสำหรับการผลิต  

**เริ่มต้นอย่างรวดเร็ว**: ปรับใช้โซลูชันครบวงจรภายใน 30 นาทีโดยใช้ ARM template ที่แนบมาพร้อมคำสั่ง `./deploy.sh -g myResourceGroup`  

## 📋 คำแนะนำการใช้งาน  

### ความต้องการเบื้องต้น  

ก่อนรันตัวอย่างใด ๆ:  
- ✅ บัญชีผู้ใช้ Azure ที่มีสิทธิ์ Owner หรือ Contributor  
- ✅ ติดตั้ง Azure Developer CLI ([คู่มือการติดตั้ง](../docs/chapter-01-foundation/installation.md))  
- ✅ รัน Docker Desktop (สำหรับตัวอย่างคอนเทนเนอร์)  
- ✅ โควต้า Azure ที่เหมาะสม (ตรวจสอบข้อกำหนดเฉพาะของแต่ละตัวอย่าง)  

> **💰 คำเตือนค่าใช้จ่าย:** ตัวอย่างทั้งหมดสร้างทรัพยากร Azure จริงซึ่งอาจมีค่าใช้จ่าย โปรดดูไฟล์ README แต่ละตัวสำหรับประมาณค่าใช้จ่าย อย่าลืมรัน `azd down` หลังใช้งานเสร็จเพื่อหลีกเลี่ยงค่าใช้จ่ายที่ต่อเนื่อง  

### การรันตัวอย่างแบบท้องถิ่น  

1. **โคลนหรือคัดลอกตัวอย่าง**  
   ```bash
   # ไปยังตัวอย่างที่ต้องการ
   cd examples/simple-web-app
   ```
  
2. **เริ่มต้นสภาพแวดล้อม AZD**  
   ```bash
   # เริ่มต้นด้วยเทมเพลตที่มีอยู่
   azd init
   
   # หรือสร้างสภาพแวดล้อมใหม่
   azd env new my-environment
   ```
  
3. **กำหนดค่าสภาพแวดล้อม**  
   ```bash
   # ตั้งค่าตัวแปรที่จำเป็น
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **ปรับใช้**  
   ```bash
   # ประกอบโครงสร้างพื้นฐานและแอปพลิเคชัน
   azd up
   ```
  
5. **ตรวจสอบการปรับใช้**  
   ```bash
   # รับจุดเชื่อมต่อของบริการ
   azd env get-values
   
   # ทดสอบจุดเชื่อมต่อ (ตัวอย่าง)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **สัญญาณแสดงความสำเร็จที่คาดหวัง:**  
   - ✅ `azd up` สำเร็จโดยไม่มีข้อผิดพลาด  
   - ✅ เซอร์วิสเอนด์พอยต์ส่งคืน HTTP 200  
   - ✅ Azure Portal แสดงสถานะ "Running"  
   - ✅ Application Insights รับข้อมูล telemetry  

> **⚠️ พบปัญหา?** ดู [ปัญหาทั่วไป](../docs/chapter-07-troubleshooting/common-issues.md) สำหรับการแก้ไขปัญหาการปรับใช้  

### การปรับแต่งตัวอย่าง  

แต่ละตัวอย่างประกอบด้วย:  
- **README.md** - คำแนะนำการตั้งค่าและปรับแต่งอย่างละเอียด  
- **azure.yaml** - การกำหนดค่า AZD พร้อมคอมเมนต์  
- **infra/** - แบบแผน Bicep พร้อมคำอธิบายพารามิเตอร์  
- **src/** - ตัวอย่างโค้ดแอปพลิเคชัน  
- **scripts/** - สคริปต์ช่วยเหลือสำหรับงานทั่วไป  

## 🎯 วัตถุประสงค์การเรียนรู้  

### หมวดหมู่ตัวอย่าง  

#### **การปรับใช้พื้นฐาน**  
- แอปบริการเดี่ยว  
- แบบแผนโครงสร้างพื้นฐานง่าย ๆ  
- การจัดการการกำหนดค่าพื้นฐาน  
- การตั้งค่าเพื่อการพัฒนาที่คุ้มค่า  

#### **สถานการณ์ขั้นสูง**  
- สถาปัตยกรรมหลายเซอร์วิส  
- การกำหนดค่าเครือข่ายซับซ้อน  
- แบบแผนการผสานฐานข้อมูล  
- การใช้งานด้านความปลอดภัยและความสอดคล้องตามข้อกำหนด  

#### **แบบแผนพร้อมใช้งานสำหรับการผลิต**  
- การกำหนดค่าความพร้อมใช้งานสูง  
- การตรวจสอบและการสังเกตการณ์  
- การผสาน CI/CD  
- การตั้งค่าการกู้คืนจากภัยพิบัติ  

## 📖 คำอธิบายตัวอย่าง  

### แอปเว็บง่าย ๆ - Node.js Express  
**เทคโนโลยี**: Node.js, Express, MongoDB, Container Apps  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: การปรับใช้พื้นฐาน, REST API, การผสานฐานข้อมูล NoSQL  

### เว็บไซต์สแตติก - React SPA  
**เทคโนโลยี**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: โฮสติ้งแบบสแตติก, แบ็กเอนด์แบบ serverless, การพัฒนาเว็บสมัยใหม่  

### Container App - Python Flask  
**เทคโนโลยี**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: การคอนเทนเนอร์, REST API, scale-to-zero, health probes, การตรวจสอบ  
**ตำแหน่งที่ตั้ง**: [ตัวอย่างท้องถิ่น](../../../examples/container-app/simple-flask-api)  

### Container App - สถาปัตยกรรมไมโครเซอร์วิส  
**เทคโนโลยี**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**ความซับซ้อน**: ขั้นสูง  
**แนวคิด**: สถาปัตยกรรมหลายเซอร์วิส, การสื่อสารเซอร์วิส, คิวข้อความ, การติดตามแบบกระจาย  
**ตำแหน่งที่ตั้ง**: [ตัวอย่างท้องถิ่น](../../../examples/container-app/microservices)  

### แอปฐานข้อมูล - C# กับ Azure SQL  
**เทคโนโลยี**: C# ASP.NET Core, Azure SQL Database, App Service  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: Entity Framework, การเชื่อมต่อฐานข้อมูล, การพัฒนาเว็บ API  

### เซิร์ฟเวอร์เลสฟังก์ชัน - Python Azure Functions  
**เทคโนโลยี**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: สถาปัตยกรรมแบบ event-driven, การประมวลผลแบบ serverless, การพัฒนาครบวงจร  

### ไมโครเซอร์วิส - Java Spring Boot  
**เทคโนโลยี**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: การสื่อสารไมโครเซอร์วิส, ระบบแบบกระจาย, แบบแผนองค์กร  

### ตัวอย่าง Microsoft Foundry  

#### แอปแชท Microsoft Foundry Models  
**เทคโนโลยี**: Microsoft Foundry Models, Cognitive Search, App Service  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: สถาปัตยกรรม RAG, การค้นหาเวกเตอร์, การผสาน LLM  

#### การประมวลผลเอกสาร AI  
**เทคโนโลยี**: Azure AI Document Intelligence, Storage, Functions  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: การวิเคราะห์เอกสาร, OCR, การสกัดข้อมูล  

#### ท่อข้อมูล Machine Learning  
**เทคโนโลยี**: Azure ML, MLOps, Container Registry  
**ความซับซ้อน**: ขั้นสูง  
**แนวคิด**: การฝึกโมเดล, ท่อข้อมูลปรับใช้, การตรวจสอบ  

## 🛠 ตัวอย่างการกำหนดค่า  

ไดเรกทอรี `configurations/` มีองค์ประกอบที่ใช้ซ้ำได้:  

### การกำหนดค่าสภาพแวดล้อม  
- การตั้งค่าสภาพแวดล้อมสำหรับการพัฒนา  
- การกำหนดค่าสภาพแวดล้อม staging  
- การกำหนดค่าสำหรับการผลิต  
- การปรับใช้หลายภูมิภาค  

### โมดูล Bicep  
- องค์ประกอบโครงสร้างพื้นฐานที่ใช้ซ้ำได้  
- แบบแผนทรัพยากรทั่วไป  
- เทมเพลตแบบเข้มงวดด้านความปลอดภัย  
- การกำหนดค่าประหยัดค่าใช้จ่าย  

### สคริปต์ช่วยเหลือ  
- อัตโนมัติการตั้งค่าสภาพแวดล้อม  
- สคริปต์ย้ายฐานข้อมูล  
- เครื่องมือวาลิเดตการปรับใช้  
- ยูทิลิตี้ตรวจสอบค่าใช้จ่าย  

## 🔧 คู่มือการปรับแต่ง  

### การปรับตัวอย่างสำหรับกรณีการใช้งานของคุณ  

1. **ตรวจสอบความต้องการเบื้องต้น**  
   - ตรวจสอบข้อกำหนดบริการ Azure  
   - ตรวจสอบข้อจำกัดบัญชีผู้ใช้  
   - เข้าใจผลกระทบด้านค่าใช้จ่าย  

2. **แก้ไขการกำหนดค่า**  
   - อัปเดตคำจำกัดความเซอร์วิสใน `azure.yaml`  
   - ปรับเทมเพลต Bicep  
   - ปรับตัวแปรสภาพแวดล้อม  

3. **ทดสอบอย่างละเอียด**  
   - ปรับใช้ในสภาพแวดล้อมพัฒนาก่อน  
   - ตรวจสอบความถูกต้องของฟังก์ชัน  
   - ทดสอบการปรับขนาดและประสิทธิภาพ  

4. **ตรวจสอบด้านความปลอดภัย**  
   - ตรวจสอบการควบคุมการเข้าถึง  
   - ใช้งานการจัดการความลับ  
   - เปิดใช้งานการตรวจสอบและแจ้งเตือน  

## 📊 ตารางเปรียบเทียบ  

| ตัวอย่าง | เซอร์วิส | ฐานข้อมูล | การรับรอง | การตรวจสอบ | ความซับซ้อน |  
|---------|----------|----------|------|------------|------------|  
| **Microsoft Foundry Models Chat** (ท้องถิ่น) | 2 | ❌ | Key Vault | ครบถ้วน | ⭐⭐ |  
| **Python Flask API** (ท้องถิ่น) | 1 | ❌ | พื้นฐาน | ครบถ้วน | ⭐ |  
| **ไมโครเซอร์วิส** (ท้องถิ่น) | 5+ | ✅ | องค์กร | ขั้นสูง | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | พื้นฐาน | พื้นฐาน | ⭐ |  
| React SPA + Functions | 3 | ✅ | พื้นฐาน | ครบถ้วน | ⭐ |  
| Python Flask Container | 2 | ❌ | พื้นฐาน | ครบถ้วน | ⭐ |  
| C# Web API + SQL | 2 | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐ |  
| Microsoft Foundry Models Chat | 3 | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | พื้นฐาน | ครบถ้วน | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (ท้องถิ่น) | **8+** | **✅** | **องค์กร** | **ขั้นสูง** | **⭐⭐⭐⭐** |  

## 🎓 เส้นทางการเรียนรู้  

### ลำดับแนะนำ  

1. **เริ่มจากแอปเว็บง่าย ๆ**  
   - เรียนรู้แนวคิดพื้นฐานของ AZD  
   - เข้าใจกระบวนการปรับใช้  
   - ฝึกการจัดการสภาพแวดล้อม  

2. **ลองเว็บไซต์สแตติก**  
   - สำรวจตัวเลือกโฮสติ้งต่าง ๆ  
   - เรียนรู้การผสาน CDN  
   - เข้าใจการกำหนดค่า DNS  

3. **ไปที่ Container App**  
   - เรียนรู้พื้นฐานการคอนเทนเนอร์  
   - เข้าใจแนวคิดการปรับขนาด  
   - ฝึกใช้งาน Docker  

4. **เพิ่มการผสานฐานข้อมูล**  
   - เรียนรู้การเตรียมฐานข้อมูล  
   - เข้าใจสตริงการเชื่อมต่อ  
   - ฝึกการจัดการความลับ  

5. **สำรวจ Serverless**  
   - เข้าใจสถาปัตยกรรม event-driven  
   - เรียนรู้เกี่ยวกับทริกเกอร์และไบน์ดิ้ง  
   - ฝึกใช้ API  

6. **สร้างไมโครเซอร์วิส**  
   - เรียนรู้การสื่อสารเซอร์วิส  
   - เข้าใจระบบแบบกระจาย  
   - ฝึกปรับใช้ที่ซับซ้อน  

## 🔍 การค้นหาตัวอย่างที่เหมาะสม  

### ตามชุดเทคโนโลยี  
- **Container Apps**: [Python Flask API (ท้องถิ่น)](../../../examples/container-app/simple-flask-api), [ไมโครเซอร์วิส (ท้องถิ่น)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [ไมโครเซอร์วิส API Gateway (ท้องถิ่น)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (ท้องถิ่น)](../../../examples/container-app/simple-flask-api), [ไมโครเซอร์วิส Product Service (ท้องถิ่น)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [ไมโครเซอร์วิส Order Service (ท้องถิ่น)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [ไมโครเซอร์วิส User Service (ท้องถิ่น)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (ท้องถิ่น)](../../../examples/container-app/simple-flask-api), [ไมโครเซอร์วิส (ท้องถิ่น)](../../../examples/container-app/microservices), Java Microservices  
- **ฐานข้อมูล**: [ไมโครเซอร์วิส (ท้องถิ่น)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (ท้องถิ่น)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **ระบบตัวแทนหลายตัว**: **Retail Multi-Agent Solution**  
- **การผสาน OpenAI**: **[Microsoft Foundry Models Chat (ท้องถิ่น)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **ผลิตภัณฑ์สำหรับองค์กร**: [ไมโครเซอร์วิส (ท้องถิ่น)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### ตามแบบแผนสถาปัตยกรรม  
- **REST API ง่าย ๆ**: [Python Flask API (ท้องถิ่น)](../../../examples/container-app/simple-flask-api)  
- **โมโนลิธิค**: Node.js Express Todo, C# Web API + SQL  
- **สแตติก + Serverless**: React SPA + Functions, Python Functions + SPA  
- **ไมโครเซอร์วิส**: [ไมโครเซอร์วิสสำหรับการผลิต (ท้องถิ่น)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **คอนเทนเนอร์**: [Python Flask (ท้องถิ่น)](../../../examples/container-app/simple-flask-api), [ไมโครเซอร์วิส (ท้องถิ่น)](../../../examples/container-app/microservices)  
- **ขับเคลื่อนด้วย AI**: **[Microsoft Foundry Models Chat (ท้องถิ่น)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **สถาปัตยกรรมตัวแทนหลายตัว**: **Retail Multi-Agent Solution**  
- **งานหลายเซอร์วิสสำหรับองค์กร**: [ไมโครเซอร์วิส (ท้องถิ่น)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### ตามระดับความซับซ้อน  
- **ผู้เริ่มต้น**: [Python Flask API (ท้องถิ่น)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **ระดับกลาง**: **[Microsoft Foundry Models Chat (ท้องถิ่น)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing  
- **ขั้นสูง**: ML Pipeline  
- **พร้อมสำหรับองค์กรสำหรับใช้ผลิตจริง**: [ไมโครเซอร์วิส (ท้องถิ่น)](../../../examples/container-app/microservices) (หลายเซอร์วิสพร้อมคิวข้อความ), **Retail Multi-Agent Solution** (ระบบตัวแทนหลายตัวครบถ้วนพร้อมสคริปต์ ARM)  

## 📚 แหล่งข้อมูลเพิ่มเติม  

### ลิงก์เอกสาร  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [เอกสาร Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### ตัวอย่างจากชุมชน  
- [ต้นแบบ Azure Samples AZD](https://github.com/Azure-Samples/azd-templates)
- [ต้นแบบ Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [แอป Todo ด้วย C# และ Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [แอป Todo ด้วย Python และ MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [แอป Todo ด้วย Node.js และ PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [แอปเว็บ React พร้อม C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions ด้วย Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### แนวปฏิบัติที่ดีที่สุด
- [กรอบงาน Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [กรอบงานการนำระบบคลาวด์มาใช้](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 การมีส่วนร่วมกับตัวอย่าง

มีตัวอย่างที่เป็นประโยชน์จะแบ่งปันหรือไม่? เรายินดีต้อนรับการมีส่วนร่วม!

### แนวทางการส่ง
1. ปฏิบัติตามโครงสร้างไดเร็กทอรีที่กำหนดไว้
2. รวม README.md ที่ครอบคลุม
3. เพิ่มคอมเมนต์ในไฟล์การตั้งค่า
4. ทดสอบอย่างละเอียดก่อนส่ง
5. รวมประมาณการค่าใช้จ่ายและข้อกำหนดเบื้องต้น

### โครงสร้างตัวอย่างต้นแบบ
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**เคล็ดลับมือโปร**: เริ่มต้นด้วยตัวอย่างที่ง่ายที่สุดที่ตรงกับชุดเทคโนโลยีของคุณ จากนั้นค่อย ๆ เพิ่มระดับความซับซ้อน ตัวอย่างแต่ละอันจะต่อยอดจากแนวคิดของตัวอย่างก่อนหน้า!

## 🚀 พร้อมเริ่มหรือยัง?

### เส้นทางการเรียนรู้ของคุณ

1. **ผู้เริ่มต้นเต็มตัว?** → เริ่มที่ [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 นาที)
2. **มีความรู้ AZD พื้นฐาน?** → ลอง [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 นาที)
3. **สร้างแอป AI?** → เริ่มที่ [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 นาที) หรือสำรวจ [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, มากกว่า 2 ชั่วโมง)
4. **ต้องการชุดเทคโนโลยีเฉพาะ?** → ใช้ส่วน [การค้นหาตัวอย่างที่เหมาะสม](../../../examples) ข้างบน

### ขั้นตอนต่อไป

- ✅ ตรวจสอบ [ข้อกำหนดเบื้องต้น](../../../examples) ข้างบน
- ✅ เลือกตัวอย่างที่ตรงกับระดับทักษะของคุณ (ดู [ตารางระดับความซับซ้อน](../../../examples))
- ✅ อ่าน README ของตัวอย่างอย่างละเอียดก่อนนำไปใช้งาน
- ✅ ตั้งค่าการเตือนให้รัน `azd down` หลังจากทดสอบเสร็จ
- ✅ แบ่งปันประสบการณ์ของคุณผ่าน GitHub Issues หรือ Discussions

### ต้องการความช่วยเหลือ?

- 📖 [คำถามที่พบบ่อย](../resources/faq.md) - คำถามทั่วไปตอบไว้แล้ว
- 🐛 [คู่มือแก้ไขปัญหา](../docs/chapter-07-troubleshooting/common-issues.md) - แก้ไขปัญหาการ deploy
- 💬 [อภิปรายใน GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - ถามชุมชน
- 📚 [คู่มือเรียนรู้](../resources/study-guide.md) - เสริมความรู้ของคุณ

---

**การนำทาง**
- **📚 หน้าหลักคอร์ส**: [AZD For Beginners](../README.md)
- **📖 เอกสารการเรียนรู้**: [คู่มือการศึกษา](../resources/study-guide.md) | [ชีทสรุป](../resources/cheat-sheet.md) | [พจนานุกรม](../resources/glossary.md)
- **🔧 แหล่งข้อมูล**: [คำถามที่พบบ่อย](../resources/faq.md) | [แก้ไขปัญหา](../docs/chapter-07-troubleshooting/common-issues.md)

---

*อัปเดตล่าสุด: พฤศจิกายน 2025 | [รายงานปัญหา](https://github.com/microsoft/AZD-for-beginners/issues) | [ร่วมส่งตัวอย่าง](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้ความถูกต้องสูงสุด แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อน เอกสารต้นฉบับในภาษาต้นทางถือเป็นแหล่งข้อมูลที่ถูกต้องสำหรับการอ้างอิง สำหรับข้อมูลที่มีความสำคัญ ควรใช้บริการแปลโดยผู้เชี่ยวชาญมนุษย์ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใดๆ ที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->