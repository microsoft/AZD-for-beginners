# ตัวอย่าง – แม่แบบและการกำหนดค่า AZD ที่ใช้งานได้จริง

**เรียนรู้จากตัวอย่าง – จัดระเบียบตามบทเรียน**  
- **📚 หน้าแรกหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../README.md)  
- **📖 แผนผังบทเรียน**: ตัวอย่างจัดตามความซับซ้อนการเรียนรู้  
- **🚀 ตัวอย่างท้องถิ่น**: [โซลูชันหลายเอเย่นต์ค้าปลีก](retail-scenario.md)  
- **🤖 ตัวอย่าง AI ภายนอก**: ลิงก์ไปยังคลังตัวอย่าง Azure Samples  

> **📍 สำคัญ: ตัวอย่างท้องถิ่น vs ตัวอย่างภายนอก**  
> ที่เก็บนี้ประกอบด้วย **ตัวอย่างท้องถิ่นครบถ้วน 4 ตัวอย่าง** พร้อมการใช้งานเต็มรูปแบบ:  
> - **Azure OpenAI Chat** (นำ GPT-4 ไปใช้งานพร้อมอินเทอร์เฟซแชท)  
> - **Container Apps** (API Flask ง่ายๆ + ไมโครเซอร์วิส)  
> - **แอปฐานข้อมูล** (เว็บ + ฐานข้อมูล SQL)  
> - **โซลูชันค้าปลีกหลายเอเย่นต์** (โซลูชัน AI สำหรับองค์กร)  
>  
> ตัวอย่างเพิ่มเติมเป็น **การอ้างอิงภายนอก** ไปยังคลัง Azure-Samples ที่คุณสามารถโคลนได้  

## บทนำ

ไดเรกทอรีนี้มีตัวอย่างปฏิบัติและการอ้างอิงเพื่อช่วยให้คุณเรียนรู้ Azure Developer CLI ผ่านการใช้งานจริง สถานการณ์ค้าปลีกหลายเอเย่นต์เป็นการใช้งานจริงที่พร้อมใช้งานซึ่งอยู่ในที่เก็บนี้ ตัวอย่างเพิ่มเติมเป็นการอ้างอิงจาก Azure Samples อย่างเป็นทางการที่แสดงรูปแบบ AZD ต่างๆ  

### ระดับความซับซ้อน

- ⭐ **ผู้เริ่มต้น** – แนวคิดพื้นฐาน บริการเดียว 15-30 นาที  
- ⭐⭐ **ระดับกลาง** – หลายบริการ รวมฐานข้อมูล 30-60 นาที  
- ⭐⭐⭐ **ขั้นสูง** – สถาปัตยกรรมซับซ้อน รวม AI 1-2 ชั่วโมง  
- ⭐⭐⭐⭐ **ผู้เชี่ยวชาญ** – พร้อมใช้งานจริง รูปแบบองค์กร 2+ ชั่วโมง  

## 🎯 สิ่งที่อยู่ในที่เก็บนี้จริงๆ

### ✅ การใช้งานท้องถิ่น (พร้อมใช้)

#### [แอปแชท Azure OpenAI](azure-openai-chat/README.md) 🆕  
**การนำ GPT-4 ไปใช้งานครบถ้วน พร้อมอินเทอร์เฟซแชทรวมอยู่ในที่เก็บนี้**

- **ตำแหน่ง:** `examples/azure-openai-chat/`  
- **ระดับความซับซ้อน:** ⭐⭐ (ระดับกลาง)  
- **สิ่งที่รวมอยู่:**  
  - การนำ Azure OpenAI ไปใช้งานครบถ้วน (GPT-4)  
  - อินเทอร์เฟซแชทผ่านคอมมานด์ไลน์ Python  
  - การผสานรวม Key Vault สำหรับคีย์ API ที่ปลอดภัย  
  - แม่แบบโครงสร้างพื้นฐาน Bicep  
  - การติดตามการใช้โทเค็นและค่าใช้จ่าย  
  - การจำกัดอัตราและการจัดการข้อผิดพลาด  

**เริ่มต้นอย่างรวดเร็ว:**  
```bash
# ไปที่ตัวอย่าง
cd examples/azure-openai-chat

# ติดตั้งทุกอย่าง
azd up

# ติดตั้ง dependencies และเริ่มแชท
pip install -r src/requirements.txt
python src/chat.py
```
  
**เทคโนโลยี:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep  

#### [ตัวอย่าง Container App](container-app/README.md) 🆕  
**ตัวอย่างการปรับใช้ container ครบถ้วนรวมในที่เก็บนี้**

- **ตำแหน่ง:** `examples/container-app/`  
- **ระดับความซับซ้อน:** ⭐-⭐⭐⭐⭐ (ตั้งแต่ผู้เริ่มต้นถึงขั้นสูง)  
- **สิ่งที่รวมอยู่:**  
  - [คู่มือหลัก](container-app/README.md) – ภาพรวมการปรับใช้ container ครบถ้วน  
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) – ตัวอย่าง REST API พื้นฐาน  
  - [สถาปัตยกรรมไมโครเซอร์วิส](../../../examples/container-app/microservices) – ปรับใช้หลายบริการพร้อมใช้งานจริง  
  - รูปแบบเริ่มต้น, การผลิต, และขั้นสูง  
  - การตรวจสอบความปลอดภัย และการเพิ่มประสิทธิภาพค่าใช้จ่าย  

**เริ่มต้นอย่างรวดเร็ว:**  
```bash
# ดูคู่มือหลัก
cd examples/container-app

# ปล่อยใช้งาน API Flask ง่ายๆ
cd simple-flask-api
azd up

# ปล่อยใช้งานตัวอย่างไมโครเซอร์วิส
cd ../microservices
azd up
```
  
**เทคโนโลยี:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [โซลูชันค้าปลีกหลายเอเย่นต์](retail-scenario.md) 🆕  
**การใช้งานพร้อมผลิตจริงครบถ้วนรวมในที่เก็บนี้**

- **ตำแหน่ง:** `examples/retail-multiagent-arm-template/`  
- **ระดับความซับซ้อน:** ⭐⭐⭐⭐ (ขั้นสูง)  
- **สิ่งที่รวมอยู่:**  
  - แม่แบบการปรับใช้ ARM ครบถ้วน  
  - สถาปัตยกรรมหลายเอเย่นต์ (ลูกค้า + สินค้าคงคลัง)  
  - การผสานรวม Azure OpenAI  
  - การค้นหา AI ด้วย RAG  
  - การตรวจสอบอย่างครบถ้วน  
  - สคริปต์ปรับใช้ด้วยคลิกเดียว  

**เริ่มต้นอย่างรวดเร็ว:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**เทคโนโลยี:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 ตัวอย่าง Azure ภายนอก (โคลนเพื่อใช้งาน)

ตัวอย่างต่อไปนี้ถูกดูแลในคลัง Azure-Samples อย่างเป็นทางการ โคลนเพื่อสำรวจรูปแบบ AZD ต่างๆ:

### แอปพลิเคชันง่ายๆ (บทที่ 1-2)

| แม่แบบ | ที่เก็บ | ระดับความซับซ้อน | บริการ |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [ท้องถิ่น: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **ไมโครเซอร์วิส** | [ท้องถิ่น: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | หลายบริการ, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**วิธีใช้:**  
```bash
# ทำสำเนาตัวอย่างใดก็ได้
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ปฏิบัติการเผยแพร่
azd up
```
  
### ตัวอย่างแอปพลิเคชัน AI (บทที่ 2, 5, 8)

| แม่แบบ | ที่เก็บ | ระดับความซับซ้อน | เน้น |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [ท้องถิ่น: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | การนำ GPT-4 ไปใช้งาน |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | แชท AI เบื้องต้น |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | เฟรมเวิร์กเอเย่นต์ |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | รูปแบบ RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI สำหรับองค์กร |

### ฐานข้อมูล & รูปแบบขั้นสูง (บทที่ 3-8)

| แม่แบบ | ที่เก็บ | ระดับความซับซ้อน | เน้น |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | การรวมฐานข้อมูล |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL แบบไม่มีเซิร์ฟเวอร์ |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | หลายบริการ |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## เป้าหมายการเรียนรู้

ผ่านการทำตามตัวอย่างเหล่านี้ คุณจะ:  
- ฝึกการใช้ Azure Developer CLI กับสถานการณ์แอปพลิเคชันสมจริง  
- เข้าใจสถาปัตยกรรมแอปพลิเคชันต่างๆ และการใช้งาน azd  
- เชี่ยวชาญรูปแบบ Infrastructure as Code สำหรับบริการ Azure ต่างๆ  
- นำกลยุทธ์การจัดการการตั้งค่าและการปรับใช้เฉพาะสภาพแวดล้อมไปใช้  
- ใช้รูปแบบการตรวจสอบความปลอดภัยและการปรับขนาดในบริบทปฏิบัติ  
- สร้างประสบการณ์กับการแก้ปัญหาและดีบักสถานการณ์ปรับใช้จริง  

## ผลลัพธ์การเรียนรู้

เมื่อทำตัวอย่างเหล่านี้เสร็จ คุณจะสามารถ:  
- ปรับใช้แอปพลิเคชันประเภทต่างๆ ด้วย Azure Developer CLI อย่างมั่นใจ  
- ปรับแม่แบบที่ให้มาให้เหมาะกับความต้องการแอปของคุณเอง  
- ออกแบบและใช้งานรูปแบบโครงสร้างพื้นฐานแบบกำหนดเองด้วย Bicep  
- กำหนดค่าแอปหลายบริการซับซ้อนพร้อมการจัดการความสัมพันธ์อย่างถูกต้อง  
- ใช้แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย การตรวจสอบ และประสิทธิภาพในสถานการณ์จริง  
- แก้ไขปัญหาและเพิ่มประสิทธิภาพการปรับใช้ตามประสบการณ์จริง  

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

> **💡 ใหม่กับ AZD?** เริ่มที่ตัวอย่าง #1 (Flask API) – ใช้เวลาประมาณ 20 นาทีและสอนแนวคิดหลัก  

### สำหรับผู้เริ่มต้น  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ท้องถิ่น) ⭐  
   ปรับใช้ REST API ง่ายที่สเกลเป็นศูนย์ได้  
   **เวลา:** 20-25 นาที | **ค่าใช้จ่าย:** $0-5/เดือน  
   **สิ่งที่เรียนรู้:** การทำงาน azd ขั้นพื้นฐาน การใช้งาน container การตรวจสอบสถานะ  
   **ผลลัพธ์ที่คาดหวัง:** API ทำงานส่งคืน "Hello, World!" พร้อมการตรวจสอบ  

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   ปรับใช้เว็บแอป Node.js Express พร้อม MongoDB  
   **เวลา:** 25-35 นาที | **ค่าใช้จ่าย:** $10-30/เดือน  
   **สิ่งที่เรียนรู้:** การรวมฐานข้อมูล, ตัวแปรสภาพแวดล้อม, สายการเชื่อมต่อ  
   **ผลลัพธ์ที่คาดหวัง:** แอปรายการงานพร้อมฟังก์ชันสร้าง/อ่าน/แก้ไข/ลบ  

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   โฮสต์เว็บ React แบบ static ด้วย Azure Static Web Apps  
   **เวลา:** 20-30 นาที | **ค่าใช้จ่าย:** $0-10/เดือน  
   **สิ่งที่เรียนรู้:** โฮสต์แบบ static, ฟังก์ชัน serverless, การปรับใช้ CDN  
   **ผลลัพธ์ที่คาดหวัง:** UI React พร้อม backend API, SSL อัตโนมัติ, CDN ทั่วโลก  

### สำหรับผู้ใช้ระดับกลาง  
4. **[แอปแชท Azure OpenAI](../../../examples/azure-openai-chat)** (ท้องถิ่น) ⭐⭐  
   ปรับใช้ GPT-4 พร้อมอินเทอร์เฟซแชทและการจัดการคีย์ API อย่างปลอดภัย  
   **เวลา:** 35-45 นาที | **ค่าใช้จ่าย:** $50-200/เดือน  
   **สิ่งที่เรียนรู้:** การนำ Azure OpenAI ไปใช้, การผสานรวม Key Vault, การติดตามโทเค็น  
   **ผลลัพธ์ที่คาดหวัง:** แอปแชทใช้งานร่วมกับ GPT-4 พร้อมติดตามค่าใช้จ่าย  

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (ท้องถิ่น) ⭐⭐⭐⭐  
   สถาปัตยกรรมหลายบริการพร้อมผลิตใช้งานจริง  
   **เวลา:** 45-60 นาที | **ค่าใช้จ่าย:** $50-150/เดือน  
   **สิ่งที่เรียนรู้:** การสื่อสารบริการ, คิวข้อความ, การติดตามแบบกระจาย  
   **ผลลัพธ์ที่คาดหวัง:** ระบบ 2 บริการ (API Gateway + Product Service) พร้อมการตรวจสอบ  

6. **[แอปฐานข้อมูล - C# กับ Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   เว็บแอป C# API พร้อมฐานข้อมูล Azure SQL  
   **เวลา:** 30-45 นาที | **ค่าใช้จ่าย:** $20-80/เดือน  
   **สิ่งที่เรียนรู้:** Entity Framework, การย้ายฐานข้อมูล, ความปลอดภัยการเชื่อมต่อ  
   **ผลลัพธ์ที่คาดหวัง:** C# API พร้อม backend Azure SQL พร้อมปรับใช้สคีมาโดยอัตโนมัติ  

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Azure Functions ด้วย Python พร้อมทริกเกอร์ HTTP และ Cosmos DB  
   **เวลา:** 30-40 นาที | **ค่าใช้จ่าย:** $10-40/เดือน  
   **สิ่งที่เรียนรู้:** สถาปัตยกรรม event-driven, การสเกลแบบ serverless, การรวม NoSQL  
   **ผลลัพธ์ที่คาดหวัง:** แอปฟังก์ชันตอบสนอง HTTP พร้อมจัดเก็บข้อมูลใน Cosmos DB  

8. **[ไมโครเซอร์วิส - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   แอป Java หลายบริการพร้อม Container Apps และ API gateway  
   **เวลา:** 60-90 นาที | **ค่าใช้จ่าย:** $80-200/เดือน  
   **สิ่งที่เรียนรู้:** การนำ Spring Boot ไปใช้, service mesh, การบาลานซ์โหลด  
   **ผลลัพธ์ที่คาดหวัง:** ระบบ Java หลายบริการพร้อมการค้นหาและจัดเส้นทาง  

### แม่แบบ Microsoft Foundry

1. **[Azure OpenAI Chat App - ตัวอย่างท้องถิ่น](../../../examples/azure-openai-chat)** ⭐⭐  
   การนำ GPT-4 ไปใช้งานครบถ้วนพร้อมอินเทอร์เฟซแชท  
   **เวลา:** 35-45 นาที | **ค่าใช้จ่าย:** $50-200/เดือน  
   **ผลลัพธ์ที่คาดหวัง:** แอปแชทพร้อมติดตามโทเค็นและค่าใช้จ่าย  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   แอปแชทอัจฉริยะด้วยสถาปัตยกรรม RAG  
   **เวลา:** 60-90 นาที | **ค่าใช้จ่าย:** $100-300/เดือน  
   **ผลลัพธ์ที่คาดหวัง:** อินเทอร์เฟซแชทใช้ RAG พร้อมการค้นหาเอกสารและอ้างอิง  

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   วิเคราะห์เอกสารโดยใช้บริการ AI ของ Azure  
   **เวลา:** 40-60 นาที | **ค่าใช้จ่าย:** $20-80/เดือน  
   **ผลลัพธ์ที่คาดหวัง:** API ที่ดึงข้อความ ตาราง และ entity จากเอกสารที่อัปโหลด  

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   เวิร์กโฟลว์ MLOps กับ Azure Machine Learning  
   **เวลา:** 2-3 ชั่วโมง | **ค่าใช้จ่าย:** $150-500/เดือน  
   **ผลลัพธ์ที่คาดหวัง:** สายงาน ML อัตโนมัติพร้อมการฝึกสอน ปรับใช้ และตรวจสอบ  

### สถานการณ์ในโลกจริง

#### **โซลูชันค้าปลีกหลายเอเย่นต์** 🆕  
**[คู่มือการใช้งานครบถ้วน](./retail-scenario.md)**

โซลูชันสนับสนุนลูกค้าหลายเอเย่นต์ที่มีความพร้อมใช้งานจริง ซึ่งแสดงการปรับใช้แอปพลิเคชัน AI ระดับองค์กรด้วย AZD สถานการณ์นี้ประกอบด้วย:

- **สถาปัตยกรรมครบถ้วน:** ระบบหลายเอเย่นต์พร้อมเอเย่นต์บริการลูกค้าและการจัดการสินค้าคงคลังเฉพาะทาง
- **โครงสร้างพื้นฐานการผลิต**: การติดตั้ง Azure OpenAI หลายภูมิภาค, AI Search, Container Apps และการตรวจสอบอย่างครบถ้วน  
- **ARM Template พร้อมใช้งานทันที**: ติดตั้งด้วยคลิกเดียวพร้อมโหมดการตั้งค่าหลายแบบ (Minimal/Standard/Premium)  
- **ฟีเจอร์ขั้นสูง**: การตรวจสอบความปลอดภัย red teaming, กรอบการประเมิน agent, การปรับปรุงค่าใช้จ่าย และคำแนะนำการแก้ไขปัญหา  
- **บริบทธุรกิจจริง**: กรณีการใช้งานการสนับสนุนลูกค้าร้านค้าปลีกที่มีการอัปโหลดไฟล์, การรวมการค้นหา และการปรับขนาดแบบไดนามิก  

**เทคโนโลยี**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**ความซับซ้อน**: ⭐⭐⭐⭐ (ขั้นสูง - พร้อมใช้งานในระดับองค์กร)  

**เหมาะสำหรับ**: นักพัฒนา AI, สถาปนิกโซลูชัน และทีมที่สร้างระบบ multi-agent สำหรับการผลิต  

**เริ่มต้นอย่างรวดเร็ว**: ติดตั้งโซลูชันครบถ้วนภายใน 30 นาทีโดยใช้ ARM template ที่ให้มาโดยคำสั่ง `./deploy.sh -g myResourceGroup`  

## 📋 คำแนะนำการใช้งาน

### ข้อกำหนดเบื้องต้น

ก่อนรันตัวอย่างใดๆ:  
- ✅ บัญชี Azure ที่มีการเข้าถึงระดับ Owner หรือ Contributor  
- ✅ ติดตั้ง Azure Developer CLI ([คู่มือการติดตั้ง](../docs/chapter-01-foundation/installation.md))  
- ✅ รัน Docker Desktop (สำหรับตัวอย่าง container)  
- ✅ โควต้าของ Azure ที่เหมาะสม (ตรวจสอบความต้องการเฉพาะแต่ละตัวอย่าง)  

> **💰 คำเตือนค่าใช้จ่าย:** ตัวอย่างทั้งหมดจะสร้างทรัพยากรจริงใน Azure ซึ่งมีค่าใช้จ่าย โปรดดูไฟล์ README ของแต่ละตัวอย่างเพื่อประมาณค่าใช้จ่าย และอย่าลืมรัน `azd down` หลังใช้งานเสร็จเพื่อหลีกเลี่ยงค่าใช้จ่ายต่อเนื่อง  

### การรันตัวอย่างในเครื่อง

1. **โคลนหรือคัดลอกตัวอย่าง**  
   ```bash
   # ไปยังตัวอย่างที่ต้องการ
   cd examples/simple-web-app
   ```
  
2. **เริ่มต้นสภาพแวดล้อม AZD**  
   ```bash
   # เริ่มต้นด้วยแม่แบบที่มีอยู่
   azd init
   
   # หรือสร้างสภาพแวดล้อมใหม่
   azd env new my-environment
   ```
  
3. **ตั้งค่าสภาพแวดล้อม**  
   ```bash
   # ตั้งค่าตัวแปรที่จำเป็น
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **ติดตั้ง**  
   ```bash
   # ติดตั้งโครงสร้างพื้นฐานและแอปพลิเคชัน
   azd up
   ```
  
5. **ตรวจสอบการติดตั้ง**  
   ```bash
   # รับจุดสิ้นสุดของบริการ
   azd env get-values
   
   # ทดสอบจุดสิ้นสุด (ตัวอย่าง)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **ตัวชี้วัดความสำเร็จที่คาดหวัง:**  
   - ✅ `azd up` ทำงานสำเร็จไม่มีข้อผิดพลาด  
   - ✅ บริการเอ็นด์พอยต์ตอบ HTTP 200  
   - ✅ Azure Portal แสดงสถานะ "Running"  
   - ✅ Application Insights รับข้อมูลเทเลเมทรี  

> **⚠️ เกิดปัญหาใช่ไหม?** ดูที่ [ปัญหาทั่วไป](../docs/chapter-07-troubleshooting/common-issues.md) สำหรับวิธีแก้ไขการติดตั้ง  

### การปรับแต่งตัวอย่าง

ตัวอย่างแต่ละตัวประกอบด้วย:  
- **README.md** – คำแนะนำการตั้งค่าและปรับแต่งอย่างละเอียด  
- **azure.yaml** – การตั้งค่า AZD พร้อมคำอธิบาย  
- **infra/** – เทมเพลต Bicep พร้อมอธิบายพารามิเตอร์  
- **src/** – โค้ดตัวอย่างแอปพลิเคชัน  
- **scripts/** – สคริปต์ช่วยเหลืองานทั่วไป  

## 🎯 วัตถุประสงค์การเรียนรู้

### หมวดหมู่ตัวอย่าง

#### **การติดตั้งพื้นฐาน**  
- แอปบริการเดี่ยว  
- รูปแบบโครงสร้างพื้นฐานง่ายๆ  
- การจัดการการตั้งค่าพื้นฐาน  
- การตั้งค่าการพัฒนาประหยัดค่าใช้จ่าย  

#### **สถานการณ์ขั้นสูง**  
- สถาปัตยกรรมหลายบริการ  
- การตั้งค่าเครือข่ายซับซ้อน  
- รูปแบบการรวมฐานข้อมูล  
- การใช้งานด้านความปลอดภัยและการปฏิบัติตามกฎ  

#### **รูปแบบพร้อมใช้งานการผลิต**  
- การตั้งค่าความพร้อมใช้งานสูง  
- การตรวจสอบและมองเห็นภาพ  
- การรวม CI/CD  
- การตั้งค่าการกู้คืนภัยพิบัติ  

## 📖 คำอธิบายตัวอย่าง

### แอปเว็บง่ายๆ - Node.js Express  
**เทคโนโลยี**: Node.js, Express, MongoDB, Container Apps  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: การติดตั้งพื้นฐาน, REST API, การรวมฐานข้อมูล NoSQL  

### เว็บไซต์สแตติก - React SPA  
**เทคโนโลยี**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: โฮสติ้งสแตติก, เซิร์ฟเวอร์เลสแบ็คเอนด์, การพัฒนาเว็บสมัยใหม่  

### Container App - Python Flask  
**เทคโนโลยี**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: การใช้คอนเทนเนอร์, REST API, ปรับสเกลเป็นศูนย์, การตรวจสอบสุขภาพ, การมอนิเตอร์  
**ที่ตั้ง**: [ตัวอย่างในเครื่อง](../../../examples/container-app/simple-flask-api)  

### Container App - สถาปัตยกรรมไมโครเซอร์วิส  
**เทคโนโลยี**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**ความซับซ้อน**: ขั้นสูง  
**แนวคิด**: สถาปัตยกรรมหลายบริการ, การสื่อสารระหว่างบริการ, คิวข้อความ, การติดตามแบบกระจาย  
**ที่ตั้ง**: [ตัวอย่างในเครื่อง](../../../examples/container-app/microservices)  

### แอปฐานข้อมูล - C# กับ Azure SQL  
**เทคโนโลยี**: C# ASP.NET Core, Azure SQL Database, App Service  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: Entity Framework, การเชื่อมต่อฐานข้อมูล, การพัฒนาเว็บ API  

### ฟังก์ชันแบบไร้เซิร์ฟเวอร์ - Python Azure Functions  
**เทคโนโลยี**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: สถาปัตยกรรมขับเคลื่อนด้วยเหตุการณ์, คอมพิวติ้งแบบเซิร์ฟเวอร์เลส, การพัฒนาแบบฟูลสแตก  

### ไมโครเซอร์วิส - Java Spring Boot  
**เทคโนโลยี**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: การสื่อสารไมโครเซอร์วิส, ระบบแบบกระจาย, รูปแบบองค์กร  

### ตัวอย่าง Microsoft Foundry

#### Azure OpenAI Chat App  
**เทคโนโลยี**: Azure OpenAI, Cognitive Search, App Service  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: สถาปัตยกรรม RAG, การค้นหาเวกเตอร์, การรวม LLM  

#### การประมวลผลเอกสาร AI  
**เทคโนโลยี**: Azure AI Document Intelligence, Storage, Functions  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: การวิเคราะห์เอกสาร, OCR, การสกัดข้อมูล  

#### Pipeline Machine Learning  
**เทคโนโลยี**: Azure ML, MLOps, Container Registry  
**ความซับซ้อน**: ขั้นสูง  
**แนวคิด**: การฝึกโมเดล, pipeline การสั่งเปิดใช้งาน, การมอนิเตอร์  

## 🛠 ตัวอย่างการตั้งค่า

โฟลเดอร์ `configurations/` ประกอบด้วยส่วนประกอบที่นำกลับมาใช้ใหม่ได้:  

### การตั้งค่าสภาพแวดล้อม  
- การตั้งค่าสภาพแวดล้อมการพัฒนา  
- การตั้งค่าสภาพแวดล้อมการสเตจ  
- การตั้งค่าพร้อมใช้งานในระดับผลิต  
- การตั้งค่าการติดตั้งหลายภูมิภาค  

### โมดูล Bicep  
- ส่วนประกอบโครงสร้างพื้นฐานที่นำกลับมาใช้ใหม่ได้  
- รูปแบบทรัพยากรทั่วไป  
- เทมเพลตที่เสริมความปลอดภัย  
- การตั้งค่าที่ประหยัดค่าใช้จ่าย  

### สคริปต์ช่วยเหลือ  
- อัตโนมัติการตั้งค่าสภาพแวดล้อม  
- สคริปต์การย้ายฐานข้อมูล  
- เครื่องมือการตรวจสอบการติดตั้ง  
- ยูทิลิตี้การตรวจสอบค่าใช้จ่าย  

## 🔧 คู่มือการปรับแต่ง

### การปรับตัวอย่างให้เหมาะกับกรณีการใช้งานของคุณ

1. **ตรวจสอบข้อกำหนดเบื้องต้น**  
   - ตรวจสอบบริการของ Azure ที่ต้องใช้  
   - ตรวจสอบขีดจำกัดบัญชี  
   - เข้าใจผลกระทบค่าใช้จ่าย  

2. **แก้ไขการตั้งค่า**  
   - อัปเดตการกำหนดบริการใน `azure.yaml`  
   - ปรับแต่งเทมเพลต Bicep  
   - ปรับตัวแปรสภาพแวดล้อม  

3. **ทดสอบอย่างละเอียด**  
   - ติดตั้งไปยังสภาพแวดล้อมการพัฒนาก่อน  
   - ตรวจสอบฟังก์ชันการทำงาน  
   - ทดสอบการปรับขนาดและประสิทธิภาพ  

4. **ตรวจสอบความปลอดภัย**  
   - ทบทวนการควบคุมการเข้าถึง  
   - ใช้งานการจัดการความลับ  
   - เปิดใช้งานการมอนิเตอร์และแจ้งเตือน  

## 📊 ตารางเปรียบเทียบ

| ตัวอย่าง | บริการ | ฐานข้อมูล | การยืนยันตัวตน | การมอนิเตอร์ | ความซับซ้อน |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (ในเครื่อง) | 2 | ❌ | Key Vault | ครบถ้วน | ⭐⭐ |
| **Python Flask API** (ในเครื่อง) | 1 | ❌ | พื้นฐาน | ครบถ้วน | ⭐ |
| **Microservices** (ในเครื่อง) | 5+ | ✅ | ระดับองค์กร | ขั้นสูง | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | พื้นฐาน | พื้นฐาน | ⭐ |
| React SPA + Functions | 3 | ✅ | พื้นฐาน | ครบถ้วน | ⭐ |
| Python Flask Container | 2 | ❌ | พื้นฐาน | ครบถ้วน | ⭐ |
| C# Web API + SQL | 2 | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐ |
| Java Microservices | 5+ | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | พื้นฐาน | ครบถ้วน | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (ในเครื่อง) | **8+** | **✅** | **ระดับองค์กร** | **ขั้นสูง** | **⭐⭐⭐⭐** |

## 🎓 เส้นทางการเรียนรู้

### ลำดับแนะนำ

1. **เริ่มจากแอปเว็บง่ายๆ**  
   - เรียนรู้แนวคิด AZD พื้นฐาน  
   - เข้าใจเวิร์กโฟลว์การติดตั้ง  
   - ฝึกจัดการสภาพแวดล้อม  

2. **ลองเว็บไซต์สแตติก**  
   - สำรวจตัวเลือกโฮสติ้งต่างๆ  
   - เรียนรู้การรวม CDN  
   - เข้าใจการตั้งค่า DNS  

3. **ก้าวสู่ Container App**  
   - เรียนรู้พื้นฐานการใช้งานคอนเทนเนอร์  
   - เข้าใจแนวคิดการปรับสเกล  
   - ฝึกใช้งาน Docker  

4. **เพิ่มการรวมฐานข้อมูล**  
   - เรียนรู้การจัดเตรียมฐานข้อมูล  
   - เข้าใจสตริงการเชื่อมต่อ  
   - ฝึกการจัดการความลับ  

5. **สำรวจเซิร์ฟเวอร์เลส**  
   - เข้าใจสถาปัตยกรรมขับเคลื่อนด้วยเหตุการณ์  
   - เรียนรู้เกี่ยวกับทริกเกอร์และบิงดิ้ง  
   - ฝึกใช้งานกับ API  

6. **สร้างไมโครเซอร์วิส**  
   - เรียนรู้การสื่อสารบริการ  
   - เข้าใจระบบแบบกระจาย  
   - ฝึกติดตั้งที่ซับซ้อน  

## 🔍 การค้นหาตัวอย่างที่เหมาะสม

### ตามชุดเทคโนโลยี

- **Container Apps**: [Python Flask API (ในเครื่อง)](../../../examples/container-app/simple-flask-api), [Microservices (ในเครื่อง)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (ในเครื่อง)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (ในเครื่อง)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (ในเครื่อง)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (ในเครื่อง)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Microservices User Service (ในเครื่อง)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (ในเครื่อง)](../../../examples/container-app/simple-flask-api), [Microservices (ในเครื่อง)](../../../examples/container-app/microservices), Java Microservices  
- **Databases**: [Microservices (ในเครื่อง)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (ในเครื่อง)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**  
- **OpenAI Integration**: **[Azure OpenAI Chat (ในเครื่อง)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Enterprise Production**: [Microservices (ในเครื่อง)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### ตามรูปแบบสถาปัตยกรรม

- **REST API ง่ายๆ**: [Python Flask API (ในเครื่อง)](../../../examples/container-app/simple-flask-api)  
- **แบบโมโนลิทิก**: Node.js Express Todo, C# Web API + SQL  
- **สแตติก + เซิร์ฟเวอร์เลส**: React SPA + Functions, Python Functions + SPA  
- **ไมโครเซอร์วิส**: [Production Microservices (ในเครื่อง)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **บนคอนเทนเนอร์**: [Python Flask (ในเครื่อง)](../../../examples/container-app/simple-flask-api), [Microservices (ในเครื่อง)](../../../examples/container-app/microservices)  
- **ระบบ AI**: **[Azure OpenAI Chat (ในเครื่อง)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **สถาปัตยกรรม Multi-Agent**: **Retail Multi-Agent Solution**  
- **ระบบองค์กรหลายบริการ**: [Microservices (ในเครื่อง)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### ตามระดับความซับซ้อน

- **ผู้เริ่มต้น**: [Python Flask API (ในเครื่อง)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **ระดับกลาง**: **[Azure OpenAI Chat (ในเครื่อง)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing  
- **ขั้นสูง**: ML Pipeline  
- **พร้อมใช้งานในระดับองค์กร**: [Microservices (ในเครื่อง)](../../../examples/container-app/microservices) (หลายบริการพร้อมคิวข้อความ), **Retail Multi-Agent Solution** (ระบบ multi-agent สมบูรณ์พร้อม template ARM สำหรับติดตั้ง)  

## 📚 แหล่งข้อมูลเพิ่มเติม

### ลิงก์เอกสาร  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [เอกสาร Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### ตัวอย่างจากชุมชน  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [แกลเลอรี Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Todo App ด้วย C# และ Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App ด้วย Python และ MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [แอป Todo ด้วย Node.js และ PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [แอปเว็บ React พร้อม C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [งาน Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions ด้วย Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### แนวทางปฏิบัติที่ดีที่สุด
- [กรอบการทำงาน Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [กรอบการนำคลาวด์มาใช้ (Cloud Adoption Framework)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 การมีส่วนร่วมในตัวอย่าง

มีตัวอย่างที่มีประโยชน์อยากแบ่งปันไหม? เรายินดีต้อนรับการมีส่วนร่วม!

### แนวทางการส่งตัวอย่าง
1. ปฏิบัติตามโครงสร้างไดเรกทอรีที่กำหนดไว้
2. รวมไฟล์ README.md อย่างครบถ้วน
3. เพิ่มคำอธิบายในไฟล์กำหนดค่า
4. ทดสอบอย่างละเอียดก่อนส่ง
5. รวมการประเมินค่าใช้จ่ายและข้อกำหนดเบื้องต้น

### โครงสร้างเทมเพลตตัวอย่าง
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

**เคล็ดลับพิเศษ**: เริ่มต้นด้วยตัวอย่างที่ง่ายที่สุดซึ่งตรงกับสแต็กเทคโนโลยีของคุณ จากนั้นค่อยๆ พัฒนาตัวอย่างไปสู่สถานการณ์ที่ซับซ้อนมากขึ้น! ตัวอย่างแต่ละชิ้นจะสร้างบนแนวคิดจากตัวอย่างก่อนหน้า!

## 🚀 พร้อมเริ่มต้นหรือยัง?

### เส้นทางการเรียนรู้ของคุณ

1. **ผู้เริ่มต้นโดยสมบูรณ์?** → เริ่มด้วย [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 นาที)
2. **มีความรู้พื้นฐานเกี่ยวกับ AZD?** → ลอง [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 นาที)
3. **กำลังสร้างแอป AI?** → เริ่มด้วย [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 นาที) หรือสำรวจ [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, มากกว่า 2 ชั่วโมง)
4. **ต้องการสแต็กเทคโนโลยีเฉพาะ?** → ใช้ส่วน [การค้นหาตัวอย่างที่ใช่](../../../examples) ข้างต้น

### ขั้นตอนต่อไป

- ✅ ตรวจสอบ [ข้อกำหนดเบื้องต้น](../../../examples) ข้างต้น
- ✅ เลือกตัวอย่างที่ตรงกับระดับความสามารถของคุณ (ดู [ตารางระดับความซับซ้อน](../../../examples))
- ✅ อ่าน README ของตัวอย่างอย่างละเอียดก่อนการปรับใช้
- ✅ ตั้งค่าการแจ้งเตือนให้รันคำสั่ง `azd down` หลังการทดสอบ
- ✅ แชร์ประสบการณ์ของคุณผ่าน GitHub Issues หรือ Discussions

### ต้องการความช่วยเหลือ?

- 📖 [คำถามที่พบบ่อย (FAQ)](../resources/faq.md) - คำถามทั่วไปที่ได้รับคำตอบ
- 🐛 [คู่มือแก้ปัญหา](../docs/chapter-07-troubleshooting/common-issues.md) - แก้ไขปัญหาการปรับใช้
- 💬 [การพูดคุย GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - ถามชุมชน
- 📚 [คู่มือการศึกษา](../resources/study-guide.md) - เสริมความรู้ของคุณ

---

**การนำทาง**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../README.md)
- **📖 เอกสารการศึกษา**: [คู่มือการศึกษา](../resources/study-guide.md) | [ชีทช่วยจำ](../resources/cheat-sheet.md) | [พจนานุกรมศัพท์](../resources/glossary.md)
- **🔧 ทรัพยากร**: [คำถามที่พบบ่อย](../resources/faq.md) | [การแก้ไขปัญหา](../docs/chapter-07-troubleshooting/common-issues.md)

---

*อัปเดตล่าสุด: พฤศจิกายน 2025 | [รายงานปัญหา](https://github.com/microsoft/AZD-for-beginners/issues) | [ส่งตัวอย่างเพื่อร่วมพัฒนา](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารฉบับนี้ได้ถูกแปลโดยใช้บริการแปลภาษาด้วยปัญญาประดิษฐ์ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้การแปลมีความถูกต้อง โปรดทราบว่าการแปลแบบอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อนได้ เอกสารต้นฉบับในภาษาต้นทางควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลสำคัญ ควรใช้บริการแปลโดยผู้เชี่ยวชาญที่เป็นมนุษย์ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->