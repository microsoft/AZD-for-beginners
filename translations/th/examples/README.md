<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:16:27+00:00",
  "source_file": "examples/README.md",
  "language_code": "th"
}
-->
# ตัวอย่าง - เทมเพลตและการตั้งค่าของ AZD ที่ใช้งานได้จริง

## บทนำ

ไดเรกทอรีนี้ประกอบด้วยตัวอย่างที่ใช้งานได้จริง เทมเพลต และสถานการณ์ในโลกจริง เพื่อช่วยให้คุณเรียนรู้ Azure Developer CLI ผ่านการฝึกปฏิบัติ ตัวอย่างแต่ละตัวมีโค้ดที่ทำงานได้จริง เทมเพลตโครงสร้างพื้นฐาน และคำแนะนำโดยละเอียดสำหรับสถาปัตยกรรมแอปพลิเคชันและรูปแบบการปรับใช้ที่แตกต่างกัน

## เป้าหมายการเรียนรู้

เมื่อทำงานผ่านตัวอย่างเหล่านี้ คุณจะ:
- ฝึกการทำงานของ Azure Developer CLI กับสถานการณ์แอปพลิเคชันที่สมจริง
- เข้าใจสถาปัตยกรรมแอปพลิเคชันที่แตกต่างกันและการใช้งาน azd ของพวกมัน
- เชี่ยวชาญรูปแบบ Infrastructure as Code สำหรับบริการ Azure ต่างๆ
- ใช้กลยุทธ์การจัดการการตั้งค่าและการปรับใช้เฉพาะสภาพแวดล้อม
- นำรูปแบบการตรวจสอบ ความปลอดภัย และการปรับขนาดไปใช้ในบริบทที่ใช้งานได้จริง
- สร้างประสบการณ์ในการแก้ไขปัญหาและดีบักสถานการณ์การปรับใช้จริง

## ผลลัพธ์การเรียนรู้

เมื่อเสร็จสิ้นตัวอย่างเหล่านี้ คุณจะสามารถ:
- ปรับใช้แอปพลิเคชันประเภทต่างๆ โดยใช้ Azure Developer CLI ได้อย่างมั่นใจ
- ปรับเทมเพลตที่ให้มาให้เหมาะกับความต้องการของแอปพลิเคชันของคุณเอง
- ออกแบบและใช้งานรูปแบบโครงสร้างพื้นฐานที่กำหนดเองโดยใช้ Bicep
- ตั้งค่าแอปพลิเคชันหลายบริการที่ซับซ้อนพร้อมการพึ่งพาที่เหมาะสม
- ใช้แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย การตรวจสอบ และประสิทธิภาพในสถานการณ์จริง
- แก้ไขปัญหาและปรับปรุงการปรับใช้ตามประสบการณ์จริง

## โครงสร้างไดเรกทอรี

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## ตัวอย่างเริ่มต้นอย่างรวดเร็ว

### สำหรับผู้เริ่มต้น
1. **[Simple Web App](../../../examples/simple-web-app)** - ปรับใช้แอปพลิเคชันเว็บ Node.js พื้นฐาน
2. **[Static Website](../../../examples/static-website)** - โฮสต์เว็บไซต์แบบสแตติกบน Azure Storage
3. **[Container App](../../../examples/container-app)** - ปรับใช้แอปพลิเคชันที่อยู่ในคอนเทนเนอร์

### สำหรับผู้ใช้ระดับกลาง
4. **[Database App](../../../examples/database-app)** - แอปพลิเคชันเว็บพร้อมฐานข้อมูล PostgreSQL
5. **[Serverless Function](../../../examples/serverless-function)** - Azure Functions พร้อม HTTP triggers
6. **[Microservices](../../../examples/microservices)** - แอปพลิเคชันหลายบริการพร้อม API gateway

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

#### **การปรับใช้พื้นฐาน**
- แอปพลิเคชันบริการเดียว
- รูปแบบโครงสร้างพื้นฐานง่ายๆ
- การจัดการการตั้งค่าพื้นฐาน
- การตั้งค่าการพัฒนาที่คุ้มค่า

#### **สถานการณ์ขั้นสูง**
- สถาปัตยกรรมหลายบริการ
- การตั้งค่าเครือข่ายที่ซับซ้อน
- รูปแบบการรวมฐานข้อมูล
- การใช้งานด้านความปลอดภัยและการปฏิบัติตามข้อกำหนด

#### **รูปแบบพร้อมใช้งานในระดับการผลิต**
- การตั้งค่าความพร้อมใช้งานสูง
- การตรวจสอบและการสังเกตการณ์
- การรวม CI/CD
- การตั้งค่าการกู้คืนจากภัยพิบัติ

## 📖 คำอธิบายตัวอย่าง

### Simple Web App
**เทคโนโลยี**: Node.js, App Service, Application Insights  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: การปรับใช้พื้นฐาน ตัวแปรสภาพแวดล้อม การตรวจสอบสุขภาพ

### Static Website
**เทคโนโลยี**: HTML/CSS/JS, Storage Account, CDN  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: การโฮสต์แบบสแตติก การรวม CDN โดเมนที่กำหนดเอง

### Container App
**เทคโนโลยี**: Docker, Container Apps, Container Registry  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: การคอนเทนเนอร์ การปรับขนาด การตั้งค่าการเข้าถึง

### Database App
**เทคโนโลยี**: Python Flask, PostgreSQL, App Service  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: การเชื่อมต่อฐานข้อมูล การจัดการความลับ การย้ายข้อมูล

### Serverless Function
**เทคโนโลยี**: Azure Functions, Cosmos DB, API Management  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: สถาปัตยกรรมที่ขับเคลื่อนด้วยเหตุการณ์ การเชื่อมโยง การจัดการ API

### Microservices
**เทคโนโลยี**: บริการหลายตัว, Service Bus, API Gateway  
**ความซับซ้อน**: ขั้นสูง  
**แนวคิด**: การสื่อสารระหว่างบริการ การจัดคิวข้อความ การปรับสมดุลโหลด

## 🛠 ตัวอย่างการตั้งค่า

ไดเรกทอรี `configurations/` ประกอบด้วยส่วนประกอบที่นำกลับมาใช้ใหม่ได้:

### การตั้งค่าสภาพแวดล้อม
- การตั้งค่าสภาพแวดล้อมการพัฒนา
- การตั้งค่าสภาพแวดล้อมการทดสอบ
- การตั้งค่าพร้อมใช้งานในระดับการผลิต
- การตั้งค่าการปรับใช้หลายภูมิภาค

### โมดูล Bicep
- ส่วนประกอบโครงสร้างพื้นฐานที่นำกลับมาใช้ใหม่ได้
- รูปแบบทรัพยากรทั่วไป
- เทมเพลตที่มีความปลอดภัยสูง
- การตั้งค่าที่คุ้มค่า

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

| ตัวอย่าง | บริการ | ฐานข้อมูล | การรับรองตัวตน | การตรวจสอบ | ความซับซ้อน |
|----------|--------|------------|----------------|-------------|--------------|
| Simple Web App | 1 | ❌ | พื้นฐาน | พื้นฐาน | ⭐ |
| Static Website | 1 | ❌ | ❌ | พื้นฐาน | ⭐ |
| Container App | 1 | ❌ | พื้นฐาน | เต็มรูปแบบ | ⭐⭐ |
| Database App | 2 | ✅ | เต็มรูปแบบ | เต็มรูปแบบ | ⭐⭐⭐ |
| Serverless Function | 3 | ✅ | เต็มรูปแบบ | เต็มรูปแบบ | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | เต็มรูปแบบ | เต็มรูปแบบ | ⭐⭐⭐⭐ |

## 🎓 เส้นทางการเรียนรู้

### ลำดับที่แนะนำ

1. **เริ่มต้นด้วย Simple Web App**
   - เรียนรู้แนวคิด AZD พื้นฐาน
   - เข้าใจขั้นตอนการปรับใช้
   - ฝึกการจัดการสภาพแวดล้อม

2. **ลอง Static Website**
   - สำรวจตัวเลือกการโฮสต์ที่แตกต่างกัน
   - เรียนรู้เกี่ยวกับการรวม CDN
   - เข้าใจการตั้งค่า DNS

3. **ไปที่ Container App**
   - เรียนรู้พื้นฐานการคอนเทนเนอร์
   - เข้าใจแนวคิดการปรับขนาด
   - ฝึกการใช้งาน Docker

4. **เพิ่มการรวมฐานข้อมูล**
   - เรียนรู้การจัดเตรียมฐานข้อมูล
   - เข้าใจสตริงการเชื่อมต่อ
   - ฝึกการจัดการความลับ

5. **สำรวจ Serverless**
   - เข้าใจสถาปัตยกรรมที่ขับเคลื่อนด้วยเหตุการณ์
   - เรียนรู้เกี่ยวกับ triggers และ bindings
   - ฝึกการใช้งาน API

6. **สร้าง Microservices**
   - เรียนรู้การสื่อสารระหว่างบริการ
   - เข้าใจระบบกระจาย
   - ฝึกการปรับใช้ที่ซับซ้อน

## 🔍 การค้นหาตัวอย่างที่เหมาะสม

### ตามเทคโนโลยี
- **Node.js**: Simple Web App, Microservices
- **Python**: Database App, Serverless Function
- **เว็บไซต์แบบสแตติก**: Static Website
- **คอนเทนเนอร์**: Container App, Microservices
- **ฐานข้อมูล**: Database App, Serverless Function

### ตามรูปแบบสถาปัตยกรรม
- **Monolithic**: Simple Web App, Database App
- **Static**: Static Website
- **Microservices**: ตัวอย่าง Microservices
- **Serverless**: Serverless Function
- **Hybrid**: Container App

### ตามระดับความซับซ้อน
- **ผู้เริ่มต้น**: Simple Web App, Static Website
- **ระดับกลาง**: Container App, Database App, Serverless Function  
- **ขั้นสูง**: Microservices

## 📚 แหล่งข้อมูลเพิ่มเติม

### ลิงก์เอกสาร
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### ตัวอย่างจากชุมชน
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)

### แนวทางปฏิบัติที่ดีที่สุด
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 การมีส่วนร่วมในตัวอย่าง

มีตัวอย่างที่มีประโยชน์ที่จะแบ่งปัน? เรายินดีต้อนรับการมีส่วนร่วม!

### แนวทางการส่ง
1. ปฏิบัติตามโครงสร้างไดเรกทอรีที่กำหนดไว้
2. รวม README.md ที่ครอบคลุม
3. เพิ่มความคิดเห็นในไฟล์การตั้งค่า
4. ทดสอบอย่างละเอียดก่อนส่ง
5. รวมการประมาณต้นทุนและข้อกำหนดเบื้องต้น

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

**เคล็ดลับ**: เริ่มต้นด้วยตัวอย่างที่ง่ายที่สุดที่ตรงกับเทคโนโลยีของคุณ จากนั้นค่อยๆ ทำงานไปยังสถานการณ์ที่ซับซ้อนมากขึ้น ตัวอย่างแต่ละตัวสร้างขึ้นจากแนวคิดของตัวอย่างก่อนหน้า!

**ขั้นตอนถัดไป**: 
- เลือกตัวอย่างที่ตรงกับระดับทักษะของคุณ
- ปฏิบัติตามคำแนะนำการตั้งค่าใน README ของตัวอย่าง
- ทดลองปรับแต่ง
- แบ่งปันสิ่งที่คุณเรียนรู้กับชุมชน

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [Study Guide](../resources/study-guide.md)
- **กลับไปที่**: [Main README](../README.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้