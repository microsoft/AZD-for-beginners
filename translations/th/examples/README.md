<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T23:03:12+00:00",
  "source_file": "examples/README.md",
  "language_code": "th"
}
-->
# ตัวอย่าง - เทมเพลตและการตั้งค่าของ AZD ที่ใช้งานได้จริง

**เรียนรู้จากตัวอย่าง - จัดเรียงตามบทเรียน**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../README.md)
- **📖 การจัดหมวดหมู่บทเรียน**: ตัวอย่างที่จัดเรียงตามความซับซ้อนของการเรียนรู้
- **🚀 เริ่มต้นง่ายๆ**: [ตัวอย่างบทที่ 1](../../../examples)
- **🤖 ตัวอย่าง AI**: [ตัวอย่างบทที่ 2 และ 5](../../../examples)

## บทนำ

ไดเรกทอรีนี้ประกอบด้วยตัวอย่างที่ใช้งานได้จริง เทมเพลต และสถานการณ์ในโลกจริง เพื่อช่วยให้คุณเรียนรู้ Azure Developer CLI ผ่านการฝึกปฏิบัติ ตัวอย่างแต่ละตัวมีโค้ดที่ทำงานได้จริง เทมเพลตโครงสร้างพื้นฐาน และคำแนะนำโดยละเอียดสำหรับสถาปัตยกรรมแอปพลิเคชันและรูปแบบการปรับใช้ที่แตกต่างกัน

## เป้าหมายการเรียนรู้

เมื่อคุณทำงานผ่านตัวอย่างเหล่านี้ คุณจะ:
- ฝึกการทำงานของ Azure Developer CLI กับสถานการณ์แอปพลิเคชันที่สมจริง
- เข้าใจสถาปัตยกรรมแอปพลิเคชันที่แตกต่างกันและการใช้งาน azd
- เชี่ยวชาญรูปแบบ Infrastructure as Code สำหรับบริการ Azure ต่างๆ
- ใช้กลยุทธ์การจัดการการตั้งค่าและการปรับใช้เฉพาะสภาพแวดล้อม
- นำรูปแบบการตรวจสอบ ความปลอดภัย และการปรับขนาดไปใช้ในบริบทที่ใช้งานได้จริง
- สร้างประสบการณ์ในการแก้ไขปัญหาและดีบักสถานการณ์การปรับใช้จริง

## ผลลัพธ์การเรียนรู้

เมื่อคุณทำตัวอย่างเหล่านี้เสร็จ คุณจะสามารถ:
- ปรับใช้แอปพลิเคชันประเภทต่างๆ โดยใช้ Azure Developer CLI ได้อย่างมั่นใจ
- ปรับเทมเพลตที่ให้มาให้เหมาะกับความต้องการของแอปพลิเคชันของคุณเอง
- ออกแบบและใช้งานรูปแบบโครงสร้างพื้นฐานที่กำหนดเองโดยใช้ Bicep
- ตั้งค่าแอปพลิเคชันหลายบริการที่ซับซ้อนพร้อมการพึ่งพาที่เหมาะสม
- ใช้แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย การตรวจสอบ และประสิทธิภาพในสถานการณ์จริง
- แก้ไขปัญหาและปรับปรุงการปรับใช้ตามประสบการณ์จริง

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

### สำหรับผู้เริ่มต้น
1. **[แอปเว็บง่ายๆ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - ปรับใช้แอปพลิเคชันเว็บ Node.js Express พร้อม MongoDB
2. **[เว็บไซต์แบบ Static - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - โฮสต์เว็บไซต์ React แบบ Static ด้วย Azure Static Web Apps
3. **[แอป Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - ปรับใช้แอปพลิเคชัน Python Flask แบบ Containerized

### สำหรับผู้ใช้ระดับกลาง
4. **[แอปฐานข้อมูล - C# พร้อม Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - แอปพลิเคชันเว็บพร้อม API C# และฐานข้อมูล Azure SQL
5. **[ฟังก์ชัน Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions พร้อม HTTP triggers และ Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - แอปพลิเคชัน Java หลายบริการพร้อม Container Apps และ API gateway

### เทมเพลต Azure AI Foundry

1. **[แอปแชท Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - แอปพลิเคชันแชทอัจฉริยะด้วย Azure OpenAI
2. **[การประมวลผลเอกสาร AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - การวิเคราะห์เอกสารโดยใช้บริการ Azure AI
3. **[Pipeline การเรียนรู้ของเครื่อง](https://github.com/Azure-Samples/mlops-v2)** - Workflow MLOps ด้วย Azure Machine Learning

### สถานการณ์ในโลกจริง

#### **โซลูชัน Multi-Agent สำหรับการค้าปลีก** 🆕
**[คู่มือการใช้งานแบบสมบูรณ์](./retail-scenario.md)**

โซลูชันการสนับสนุนลูกค้าแบบ Multi-Agent ที่พร้อมใช้งานในระดับการผลิต ซึ่งแสดงการปรับใช้แอปพลิเคชัน AI ระดับองค์กรด้วย AZD สถานการณ์นี้ประกอบด้วย:

- **สถาปัตยกรรมสมบูรณ์**: ระบบ Multi-Agent พร้อมตัวแทนเฉพาะด้านการบริการลูกค้าและการจัดการสินค้าคงคลัง
- **โครงสร้างพื้นฐานระดับการผลิต**: การปรับใช้ Azure OpenAI หลายภูมิภาค การค้นหา AI แอป Container และการตรวจสอบที่ครอบคลุม
- **เทมเพลต ARM พร้อมปรับใช้**: การปรับใช้แบบคลิกเดียวพร้อมโหมดการตั้งค่าหลายแบบ (Minimal/Standard/Premium)
- **ฟีเจอร์ขั้นสูง**: การตรวจสอบความปลอดภัยแบบ Red teaming กรอบการประเมินตัวแทน การปรับต้นทุน และคู่มือการแก้ไขปัญหา
- **บริบทธุรกิจจริง**: กรณีการใช้งานการสนับสนุนลูกค้าของผู้ค้าปลีกพร้อมการอัปโหลดไฟล์ การรวมการค้นหา และการปรับขนาดแบบไดนามิก

**เทคโนโลยี**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**ความซับซ้อน**: ⭐⭐⭐⭐ (ขั้นสูง - พร้อมใช้งานในระดับองค์กร)

**เหมาะสำหรับ**: นักพัฒนา AI สถาปนิกโซลูชัน และทีมที่สร้างระบบ Multi-Agent ในระดับการผลิต

**เริ่มต้นอย่างรวดเร็ว**: ปรับใช้โซลูชันสมบูรณ์ในเวลาไม่ถึง 30 นาทีโดยใช้เทมเพลต ARM ที่รวมอยู่ด้วย `./deploy.sh -g myResourceGroup`

## 📋 คำแนะนำการใช้งาน

### การรันตัวอย่างในเครื่อง

1. **โคลนหรือคัดลอกตัวอย่าง**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **เริ่มต้นสภาพแวดล้อม AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **ตั้งค่าสภาพแวดล้อม**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **ปรับใช้**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### การปรับตัวอย่าง

ตัวอย่างแต่ละตัวประกอบด้วย:
- **README.md** - คำแนะนำการตั้งค่าและการปรับแต่งโดยละเอียด
- **azure.yaml** - การตั้งค่า AZD พร้อมคำอธิบาย
- **infra/** - เทมเพลต Bicep พร้อมคำอธิบายพารามิเตอร์
- **src/** - โค้ดแอปพลิเคชันตัวอย่าง
- **scripts/** - สคริปต์ช่วยเหลือสำหรับงานทั่วไป

## 🎯 วัตถุประสงค์การเรียนรู้

### หมวดหมู่ตัวอย่าง

#### **การปรับใช้งานพื้นฐาน**
- แอปพลิเคชันบริการเดียว
- รูปแบบโครงสร้างพื้นฐานง่ายๆ
- การจัดการการตั้งค่าพื้นฐาน
- การตั้งค่าการพัฒนาที่คุ้มค่า

#### **สถานการณ์ขั้นสูง**
- สถาปัตยกรรมหลายบริการ
- การตั้งค่าเครือข่ายที่ซับซ้อน
- รูปแบบการรวมฐานข้อมูล
- การใช้งานด้านความปลอดภัยและการปฏิบัติตามข้อกำหนด

#### **รูปแบบที่พร้อมใช้งานในระดับการผลิต**
- การตั้งค่าความพร้อมใช้งานสูง
- การตรวจสอบและการสังเกตการณ์
- การรวม CI/CD
- การตั้งค่าการกู้คืนจากภัยพิบัติ

## 📖 คำอธิบายตัวอย่าง

### แอปเว็บง่ายๆ - Node.js Express
**เทคโนโลยี**: Node.js, Express, MongoDB, Container Apps  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: การปรับใช้งานพื้นฐาน REST API การรวมฐานข้อมูล NoSQL

### เว็บไซต์แบบ Static - React SPA
**เทคโนโลยี**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: การโฮสต์แบบ Static แบ็กเอนด์แบบ Serverless การพัฒนาเว็บสมัยใหม่

### แอป Container - Python Flask
**เทคโนโลยี**: Python Flask, Docker, Container Apps, Container Registry  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: การทำ Containerization สถาปัตยกรรม Microservices การพัฒนา API

### แอปฐานข้อมูล - C# พร้อม Azure SQL
**เทคโนโลยี**: C# ASP.NET Core, Azure SQL Database, App Service  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: Entity Framework การเชื่อมต่อฐานข้อมูล การพัฒนาเว็บ API

### ฟังก์ชัน Serverless - Python Azure Functions
**เทคโนโลยี**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: สถาปัตยกรรม Event-driven การประมวลผลแบบ Serverless การพัฒนา Full-stack

### Microservices - Java Spring Boot
**เทคโนโลยี**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: การสื่อสารระหว่างบริการ ระบบกระจาย รูปแบบองค์กร

### ตัวอย่าง Azure AI Foundry

#### แอปแชท Azure OpenAI
**เทคโนโลยี**: Azure OpenAI, Cognitive Search, App Service  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: สถาปัตยกรรม RAG การค้นหาแบบเวกเตอร์ การรวม LLM

#### การประมวลผลเอกสาร AI
**เทคโนโลยี**: Azure AI Document Intelligence, Storage, Functions  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: การวิเคราะห์เอกสาร OCR การดึงข้อมูล

#### Pipeline การเรียนรู้ของเครื่อง
**เทคโนโลยี**: Azure ML, MLOps, Container Registry  
**ความซับซ้อน**: ขั้นสูง  
**แนวคิด**: การฝึกโมเดล การปรับใช้ Pipeline การตรวจสอบ

## 🛠 ตัวอย่างการตั้งค่า

ไดเรกทอรี `configurations/` ประกอบด้วยส่วนประกอบที่นำกลับมาใช้ใหม่ได้:

### การตั้งค่าสภาพแวดล้อม
- การตั้งค่าสภาพแวดล้อมการพัฒนา
- การตั้งค่าสภาพแวดล้อม Staging
- การตั้งค่าที่พร้อมใช้งานในระดับการผลิต
- การตั้งค่าการปรับใช้หลายภูมิภาค

### โมดูล Bicep
- ส่วนประกอบโครงสร้างพื้นฐานที่นำกลับมาใช้ใหม่ได้
- รูปแบบทรัพยากรทั่วไป
- เทมเพลตที่มีความปลอดภัยสูง
- การตั้งค่าที่คุ้มค่าต้นทุน

### สคริปต์ช่วยเหลือ
- ระบบอัตโนมัติการตั้งค่าสภาพแวดล้อม
- สคริปต์การย้ายฐานข้อมูล
- เครื่องมือการตรวจสอบการปรับใช้
- เครื่องมือการตรวจสอบต้นทุน

## 🔧 คู่มือการปรับแต่ง

### การปรับตัวอย่างให้เหมาะกับกรณีการใช้งานของคุณ

1. **ตรวจสอบข้อกำหนดเบื้องต้น**
   - ตรวจสอบข้อกำหนดบริการ Azure
   - ตรวจสอบข้อจำกัดการสมัครสมาชิก
   - เข้าใจผลกระทบด้านต้นทุน

2. **ปรับเปลี่ยนการตั้งค่า**
   - อัปเดตการกำหนดบริการใน `azure.yaml`
   - ปรับแต่งเทมเพลต Bicep
   - ปรับเปลี่ยนตัวแปรสภาพแวดล้อม

3. **ทดสอบอย่างละเอียด**
   - ปรับใช้ในสภาพแวดล้อมการพัฒนาก่อน
   - ตรวจสอบการทำงาน
   - ทดสอบการปรับขนาดและประสิทธิภาพ

4. **ตรวจสอบความปลอดภัย**
   - ตรวจสอบการควบคุมการเข้าถึง
   - ใช้การจัดการความลับ
   - เปิดใช้งานการตรวจสอบและการแจ้งเตือน

## 📊 ตารางเปรียบเทียบ

| ตัวอย่าง | บริการ | ฐานข้อมูล | การยืนยันตัวตน | การตรวจสอบ | ความซับซ้อน |
|----------|--------|------------|----------------|-------------|--------------|
| Node.js Express Todo | 2 | ✅ | พื้นฐาน | พื้นฐาน | ⭐ |
| React SPA + Functions | 3 | ✅ | พื้นฐาน | เต็มรูปแบบ | ⭐ |
| Python Flask Container | 2 | ❌ | พื้นฐาน | เต็มรูปแบบ | ⭐ |
| C# Web API + SQL | 2 | ✅ | เต็มรูปแบบ | เต็มรูปแบบ | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | เต็มรูปแบบ | เต็มรูปแบบ | ⭐⭐ |
| Java Microservices | 5+ | ✅ | เต็มรูปแบบ | เต็มรูปแบบ | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | เต็มรูปแบบ | เต็มรูปแบบ | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | พื้นฐาน | เต็มรูปแบบ | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | เต็มรูปแบบ | เต็มรูปแบบ | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **ระดับองค์กร** | **ขั้นสูง** | **⭐⭐⭐⭐** |

## 🎓 เส้นทางการเรียนรู้

### ลำดับที่แนะนำ

1. **เริ่มต้นด้วยแอปเว็บง่ายๆ**
   - เรียนรู้แนวคิด AZD พื้นฐาน
   - เข้าใจ Workflow การปรับใช้
   - ฝึกการจัดการสภาพแวดล้อม

2. **ลองเว็บไซต์แบบ Static**
   - สำรวจตัวเลือกการโฮสต์ที่แตกต่างกัน
   - เรียนรู้เกี่ยวกับการรวม CDN
   - เข้าใจการตั้งค่า DNS

3. **ไปยังแอป Container**
   - เรียนรู้พื้นฐานการทำ Containerization
   - เข้าใจแนวคิดการปรับขนาด
   - ฝึกการใช้งาน Docker

4. **เพิ่มการรวมฐานข้อมูล**
   - เรียนรู้การจัดเตรียมฐานข้อมูล
   - เข้าใจ Connection Strings
   - ฝึกการจัดการความลับ

5. **สำรวจ Serverless**
   - เข้าใจสถาปัตยกรรม Event-driven
   - เรียนรู้เกี่ยวกับ Triggers และ Bindings
   - ฝึกการใช้งาน API

6. **สร้าง Microservices**
   - เรียนรู้การสื่อสารระหว่างบริการ
   - เข้าใจระบบกระจาย
   - ฝึกการปรับใช้ที่ซับซ้อน

## 🔍 การค้นหาตัวอย่างที่เหมาะสม

### ตามเทคโนโลยี
- **Node.js**: แอป Node.js Express Todo
- **Python**: แอป Python Flask Container, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: แอป Python Flask Container, Java Microservices
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **Enterprise Production**: **Retail Multi-Agent Solution**

### ตามรูปแบบสถาปัตยกรรม
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: แอป Python Flask Container
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: **Retail Multi-Agent Solution**

### ตามระดับความซับซ้อน
- **ผู้เริ่มต้น**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **ระดับกลาง**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **ขั้นสูง**: ML Pipeline
- **พร้อมใช้งานในระดับองค์กร**: **Retail Multi-Agent Solution** (ระบบ Multi-Agent สมบูรณ์พร้อมการปรับใช้เทมเพลต ARM)

## 📚 แหล่งข้อมูลเพิ่มเติม

### ลิงก์เอกสาร
-
- [แอป Todo ด้วย C# และ Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [แอป Todo ด้วย Python และ MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [แอป Todo ด้วย Node.js และ PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [แอปเว็บ React พร้อม API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [งานใน Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions ด้วย Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### แนวทางปฏิบัติที่ดีที่สุด
- [กรอบการออกแบบระบบ Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [กรอบการนำระบบคลาวด์มาใช้](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 การมีส่วนร่วมในตัวอย่าง

มีตัวอย่างที่เป็นประโยชน์ที่อยากแบ่งปัน? เรายินดีรับการมีส่วนร่วม!

### แนวทางการส่งตัวอย่าง
1. ปฏิบัติตามโครงสร้างไดเรกทอรีที่กำหนดไว้
2. รวม README.md ที่ครอบคลุม
3. เพิ่มความคิดเห็นในไฟล์การตั้งค่า
4. ทดสอบอย่างละเอียดก่อนส่ง
5. รวมการประมาณค่าใช้จ่ายและข้อกำหนดเบื้องต้น

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

**เคล็ดลับ**: เริ่มต้นด้วยตัวอย่างที่ง่ายที่สุดที่ตรงกับเทคโนโลยีที่คุณใช้ แล้วค่อยๆ พัฒนาไปสู่สถานการณ์ที่ซับซ้อนมากขึ้น ตัวอย่างแต่ละตัวจะสร้างบนแนวคิดจากตัวอย่างก่อนหน้า!

**ขั้นตอนถัดไป**: 
- เลือกตัวอย่างที่ตรงกับระดับทักษะของคุณ
- ปฏิบัติตามคำแนะนำการตั้งค่าใน README ของตัวอย่าง
- ทดลองปรับแต่ง
- แบ่งปันสิ่งที่คุณเรียนรู้กับชุมชน

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [คู่มือการศึกษา](../resources/study-guide.md)
- **กลับไปที่**: [README หลัก](../README.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้