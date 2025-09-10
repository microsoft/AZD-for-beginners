<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T22:17:39+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "th"
}
-->
# คู่มือการศึกษา - AZD สำหรับผู้เริ่มต้น

## บทนำ

คู่มือการศึกษาฉบับนี้ให้เป้าหมายการเรียนรู้ที่มีโครงสร้าง แนวคิดสำคัญ แบบฝึกหัด และวัสดุการประเมิน เพื่อช่วยให้คุณเชี่ยวชาญ Azure Developer CLI (azd) ใช้คู่มือนี้เพื่อติดตามความก้าวหน้าและตรวจสอบว่าคุณได้ครอบคลุมหัวข้อสำคัญทั้งหมดแล้ว

## เป้าหมายการเรียนรู้

เมื่อคุณทำคู่มือการศึกษานี้เสร็จสิ้น คุณจะ:
- เชี่ยวชาญแนวคิดพื้นฐานและขั้นสูงทั้งหมดของ Azure Developer CLI
- พัฒนาทักษะการใช้งานจริงในการปรับใช้และจัดการแอปพลิเคชัน Azure
- สร้างความมั่นใจในการแก้ไขปัญหาและปรับปรุงการปรับใช้
- เข้าใจแนวทางการปรับใช้ที่พร้อมใช้งานในระดับผลิตและข้อควรพิจารณาด้านความปลอดภัย

## ผลลัพธ์การเรียนรู้

หลังจากทำทุกส่วนของคู่มือการศึกษานี้เสร็จสิ้น คุณจะสามารถ:
- ออกแบบ ปรับใช้ และจัดการสถาปัตยกรรมแอปพลิเคชันครบวงจรโดยใช้ azd
- ใช้กลยุทธ์การตรวจสอบ ความปลอดภัย และการปรับค่าใช้จ่ายอย่างครอบคลุม
- แก้ไขปัญหาการปรับใช้ที่ซับซ้อนได้ด้วยตัวเอง
- สร้างเทมเพลตที่กำหนดเองและมีส่วนร่วมในชุมชน azd

## โครงสร้างหลักสูตร

### โมดูล 1: เริ่มต้นใช้งาน (สัปดาห์ที่ 1-2)

#### วัตถุประสงค์การเรียนรู้
- เข้าใจพื้นฐานและแนวคิดหลักของ Azure Developer CLI
- ติดตั้งและกำหนดค่า azd ในสภาพแวดล้อมการพัฒนาของคุณได้สำเร็จ
- ทำการปรับใช้ครั้งแรกโดยใช้เทมเพลตที่มีอยู่
- สำรวจโครงสร้างโปรเจกต์ azd และเข้าใจองค์ประกอบสำคัญ

#### แนวคิดสำคัญที่ต้องเชี่ยวชาญ
- เทมเพลต สภาพแวดล้อม และบริการ
- โครงสร้างการกำหนดค่า azure.yaml
- คำสั่งพื้นฐานของ azd (init, up, down, deploy)
- หลักการ Infrastructure as Code
- การตรวจสอบสิทธิ์และการอนุญาตของ Azure

#### แบบฝึกหัด

**แบบฝึกหัด 1.1: การติดตั้งและตั้งค่า**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**แบบฝึกหัด 1.2: การปรับใช้ครั้งแรก**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**แบบฝึกหัด 1.3: การวิเคราะห์โครงสร้างโปรเจกต์**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### คำถามประเมินตนเอง
1. แนวคิดหลักสามประการของสถาปัตยกรรม azd คืออะไร?
2. ไฟล์ azure.yaml มีวัตถุประสงค์อะไร?
3. สภาพแวดล้อมช่วยจัดการเป้าหมายการปรับใช้อย่างไร?
4. วิธีการตรวจสอบสิทธิ์ที่สามารถใช้กับ azd มีอะไรบ้าง?
5. เกิดอะไรขึ้นเมื่อคุณรัน `azd up` เป็นครั้งแรก?

### โมดูล 2: การกำหนดค่าและสภาพแวดล้อม (สัปดาห์ที่ 3)

#### วัตถุประสงค์การเรียนรู้
- เชี่ยวชาญการจัดการและการกำหนดค่าสภาพแวดล้อม
- เข้าใจการกำหนดค่า azure.yaml ขั้นสูง
- ใช้การตั้งค่าและตัวแปรเฉพาะสภาพแวดล้อม
- กำหนดค่าการตรวจสอบสิทธิ์สำหรับสถานการณ์ต่าง ๆ

#### แนวคิดสำคัญที่ต้องเชี่ยวชาญ
- ลำดับชั้นของสภาพแวดล้อมและลำดับความสำคัญของตัวแปร
- การกำหนดค่าบริการและพารามิเตอร์
- Hooks และเหตุการณ์ในวงจรการทำงาน
- วิธีการตรวจสอบสิทธิ์ (ผู้ใช้, service principal, managed identity)
- การจัดการไฟล์การกำหนดค่า

#### แบบฝึกหัด

**แบบฝึกหัด 2.1: การตั้งค่าสภาพแวดล้อมหลายตัว**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**แบบฝึกหัด 2.2: การกำหนดค่าขั้นสูง**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**แบบฝึกหัด 2.3: การกำหนดค่าความปลอดภัย**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### คำถามประเมินตนเอง
1. azd จัดการลำดับความสำคัญของตัวแปรสภาพแวดล้อมอย่างไร?
2. Deployment hooks คืออะไร และควรใช้งานเมื่อใด?
3. คุณกำหนดค่า SKUs ต่าง ๆ สำหรับสภาพแวดล้อมต่าง ๆ อย่างไร?
4. ผลกระทบด้านความปลอดภัยของวิธีการตรวจสอบสิทธิ์ต่าง ๆ มีอะไรบ้าง?
5. คุณจัดการความลับและข้อมูลการกำหนดค่าที่ละเอียดอ่อนอย่างไร?

### โมดูล 3: การปรับใช้และการจัดเตรียม (สัปดาห์ที่ 4)

#### วัตถุประสงค์การเรียนรู้
- เชี่ยวชาญกระบวนการปรับใช้และแนวทางปฏิบัติที่ดีที่สุด
- เข้าใจ Infrastructure as Code ด้วยเทมเพลต Bicep
- ใช้สถาปัตยกรรมบริการหลายตัวที่ซับซ้อน
- ปรับปรุงประสิทธิภาพและความน่าเชื่อถือของการปรับใช้

#### แนวคิดสำคัญที่ต้องเชี่ยวชาญ
- โครงสร้างและโมดูลของเทมเพลต Bicep
- การพึ่งพาทรัพยากรและลำดับการทำงาน
- กลยุทธ์การปรับใช้ (blue-green, rolling updates)
- การปรับใช้หลายภูมิภาค
- การโยกย้ายฐานข้อมูลและการจัดการข้อมูล

#### แบบฝึกหัด

**แบบฝึกหัด 3.1: โครงสร้างพื้นฐานที่กำหนดเอง**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**แบบฝึกหัด 3.2: แอปพลิเคชันหลายบริการ**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**แบบฝึกหัด 3.3: การรวมฐานข้อมูล**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### คำถามประเมินตนเอง
1. ข้อดีของการใช้ Bicep แทน ARM templates คืออะไร?
2. คุณจัดการการโยกย้ายฐานข้อมูลใน azd deployments อย่างไร?
3. มีกลยุทธ์อะไรบ้างสำหรับการปรับใช้แบบไม่มี downtime?
4. คุณจัดการการพึ่งพาระหว่างบริการอย่างไร?
5. มีข้อควรพิจารณาอะไรบ้างสำหรับการปรับใช้หลายภูมิภาค?

### โมดูล 4: การตรวจสอบก่อนการปรับใช้ (สัปดาห์ที่ 5)

#### วัตถุประสงค์การเรียนรู้
- ใช้การตรวจสอบก่อนการปรับใช้อย่างครอบคลุม
- เชี่ยวชาญการวางแผนความจุและการตรวจสอบทรัพยากร
- เข้าใจการเลือก SKU และการปรับค่าใช้จ่าย
- สร้างกระบวนการตรวจสอบอัตโนมัติ

#### แนวคิดสำคัญที่ต้องเชี่ยวชาญ
- โควต้าและข้อจำกัดของทรัพยากร Azure
- เกณฑ์การเลือก SKU และผลกระทบด้านค่าใช้จ่าย
- สคริปต์และเครื่องมือการตรวจสอบอัตโนมัติ
- วิธีการวางแผนความจุ
- การทดสอบประสิทธิภาพและการปรับปรุง

#### แบบฝึกหัด

**แบบฝึกหัด 4.1: การวางแผนความจุ**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**แบบฝึกหัด 4.2: การตรวจสอบก่อนการปรับใช้**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**แบบฝึกหัด 4.3: การปรับ SKU**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### คำถามประเมินตนเอง
1. ปัจจัยใดที่ควรมีผลต่อการตัดสินใจเลือก SKU?
2. คุณตรวจสอบความพร้อมของทรัพยากร Azure ก่อนการปรับใช้อย่างไร?
3. องค์ประกอบสำคัญของระบบตรวจสอบก่อนการปรับใช้คืออะไร?
4. คุณประมาณการและควบคุมค่าใช้จ่ายในการปรับใช้อย่างไร?
5. การตรวจสอบใดที่จำเป็นสำหรับการวางแผนความจุ?

### โมดูล 5: การแก้ไขปัญหาและการดีบัก (สัปดาห์ที่ 6)

#### วัตถุประสงค์การเรียนรู้
- เชี่ยวชาญวิธีการแก้ไขปัญหาอย่างเป็นระบบ
- พัฒนาความเชี่ยวชาญในการดีบักปัญหาการปรับใช้ที่ซับซ้อน
- ใช้การตรวจสอบและการแจ้งเตือนอย่างครอบคลุม
- สร้างกระบวนการตอบสนองและกู้คืนเหตุการณ์

#### แนวคิดสำคัญที่ต้องเชี่ยวชาญ
- รูปแบบความล้มเหลวของการปรับใช้ทั่วไป
- เทคนิคการวิเคราะห์และเชื่อมโยงบันทึก
- การตรวจสอบประสิทธิภาพและการปรับปรุง
- การตรวจจับและตอบสนองต่อเหตุการณ์ด้านความปลอดภัย
- การกู้คืนจากภัยพิบัติและความต่อเนื่องทางธุรกิจ

#### แบบฝึกหัด

**แบบฝึกหัด 5.1: สถานการณ์การแก้ไขปัญหา**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**แบบฝึกหัด 5.2: การใช้งานการตรวจสอบ**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**แบบฝึกหัด 5.3: การตอบสนองต่อเหตุการณ์**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### คำถามประเมินตนเอง
1. วิธีการแก้ไขปัญหา azd deployments อย่างเป็นระบบคืออะไร?
2. คุณเชื่อมโยงบันทึกระหว่างบริการและทรัพยากรหลายตัวอย่างไร?
3. เมตริกการตรวจสอบใดที่สำคัญที่สุดสำหรับการตรวจจับปัญหาในระยะแรก?
4. คุณใช้กระบวนการกู้คืนจากภัยพิบัติอย่างมีประสิทธิภาพอย่างไร?
5. องค์ประกอบสำคัญของแผนตอบสนองต่อเหตุการณ์คืออะไร?

### โมดูล 6: หัวข้อขั้นสูงและแนวทางปฏิบัติที่ดีที่สุด (สัปดาห์ที่ 7-8)

#### วัตถุประสงค์การเรียนรู้
- ใช้รูปแบบการปรับใช้ระดับองค์กร
- เชี่ยวชาญการรวมและการทำงานอัตโนมัติของ CI/CD
- พัฒนาเทมเพลตที่กำหนดเองและมีส่วนร่วมในชุมชน
- เข้าใจข้อกำหนดด้านความปลอดภัยและการปฏิบัติตามขั้นสูง

#### แนวคิดสำคัญที่ต้องเชี่ยวชาญ
- รูปแบบการรวม CI/CD pipeline
- การพัฒนาและการแจกจ่ายเทมเพลตที่กำหนดเอง
- การกำกับดูแลและการปฏิบัติตามระดับองค์กร
- การกำหนดค่าเครือข่ายและความปลอดภัยขั้นสูง
- การปรับปรุงประสิทธิภาพและการจัดการค่าใช้จ่าย

#### แบบฝึกหัด

**แบบฝึกหัด 6.1: การรวม CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**แบบฝึกหัด 6.2: การพัฒนาเทมเพลตที่กำหนดเอง**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**แบบฝึกหัด 6.3: การใช้งานระดับองค์กร**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### คำถามประเมินตนเอง
1. คุณรวม azd เข้ากับ workflows CI/CD ที่มีอยู่ได้อย่างไร?
2. ข้อควรพิจารณาสำคัญสำหรับการพัฒนาเทมเพลตที่กำหนดเองคืออะไร?
3. คุณใช้การกำกับดูแลและการปฏิบัติตามใน azd deployments อย่างไร?
4. แนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้ในระดับองค์กรคืออะไร?
5. คุณมีส่วนร่วมในชุมชน azd อย่างมีประสิทธิภาพได้อย่างไร?

## โครงการปฏิบัติ

### โครงการ 1: เว็บไซต์พอร์ตโฟลิโอส่วนตัว
**ความซับซ้อน**: ผู้เริ่มต้น  
**ระยะเวลา**: 1-2 สัปดาห์

สร้างและปรับใช้เว็บไซต์พอร์ตโฟลิโอส่วนตัวโดยใช้:
- การโฮสต์เว็บไซต์แบบสแตติกบน Azure Storage
- การกำหนดค่าชื่อโดเมนที่กำหนดเอง
- การรวม CDN เพื่อประสิทธิภาพทั่วโลก
- กระบวนการปรับใช้อัตโนมัติ

**ผลลัพธ์**:
- เว็บไซต์ที่ทำงานได้ปรับใช้บน Azure
- เทมเพลต azd ที่กำหนดเองสำหรับการปรับใช้พอร์ตโฟลิโอ
- เอกสารประกอบกระบวนการปรับใช้
- คำแนะนำการวิเคราะห์และการปรับปรุงค่าใช้จ่าย

### โครงการ 2: แอปพลิเคชันจัดการงาน
**ความซับซ้อน**: ระดับกลาง  
**ระยะเวลา**: 2-3 สัปดาห์

สร้างแอปพลิเคชันจัดการงานแบบ full-stack โดยมี:
- ส่วนหน้า React ปรับใช้กับ App Service
- ส่วนหลัง API Node.js พร้อมการตรวจสอบสิทธิ์
- ฐานข้อมูล PostgreSQL พร้อมการโยกย้าย
- การตรวจสอบ Application Insights

**ผลลัพธ์**:
- แอปพลิเคชันครบวงจรพร้อมการตรวจสอบสิทธิ์ผู้ใช้
- สคริปต์การโยกย้ายและโครงสร้างฐานข้อมูล
- แดชบอร์ดการตรวจสอบและกฎการแจ้งเตือน
- การกำหนดค่าการปรับใช้หลายสภาพแวดล้อม

### โครงการ 3: แพลตฟอร์มอีคอมเมิร์ซแบบไมโครเซอร์วิส
**ความซับซ้อน**: ขั้นสูง  
**ระยะเวลา**: 4-6 สัปดาห์

ออกแบบและใช้งานแพลตฟอร์มอีคอมเมิร์ซแบบไมโครเซอร์วิส:
- บริการ API หลายตัว (แคตตาล็อก, คำสั่งซื้อ, การชำระเงิน, ผู้ใช้)
- การรวมคิวข้อความด้วย Service Bus
- แคช Redis เพื่อปรับปรุงประสิทธิภาพ
- การบันทึกและการตรวจสอบอย่างครอบคลุม

**ผลลัพธ์**:
- สถาปัตยกรรมไมโครเซอร์วิสครบวงจร
- รูปแบบการสื่อสารระหว่างบริการ
- การทดสอบและการปรับปรุงประสิทธิภาพ
- การใช้งานความปลอดภัยที่พร้อมใช้งานในระดับผลิต

## การประเมินและการรับรอง

### การตรวจสอบความรู้

ทำการประเมินเหล่านี้หลังจากแต่ละโมดูล:

**การประเมินโมดูล 1**: แนวคิดพื้นฐานและการติดตั้ง
- คำถามแบบปรนัยเกี่ยวกับแนวคิดหลัก
- งานการติดตั้งและการกำหนดค่าที่ใช้งานได้จริง
- แบบฝึกหัดการปรับใช้ง่าย ๆ

**การประเมินโมดูล 2**: การกำหนดค่าและสภาพแวดล้อม
- สถานการณ์การจัดการสภาพแวดล้อม
- แบบฝึกหัดการแก้ไขปัญหาการกำหนดค่า
- การใช้งานการกำหนดค่าความปลอดภัย

**การประเมินโมดูล 3**: การปรับใช้และการจัดเตรียม
- ความท้าทายในการออกแบบโครงสร้างพื้นฐาน
- สถานการณ์การปรับใช้หลายบริการ
- แบบฝึกหัดการปรับปรุงประสิทธิภาพ

**การประเมินโมดูล 4**: การตรวจสอบก่อนการปรับใช้
- กรณีศึกษาการวางแผนความจุ
- สถานการณ์การปรับค่าใช้จ่าย
- การใช้งานกระบวนการตรวจสอบ

**การประเมินโมดูล 5**: การแก้ไขปัญหาและการดีบัก
- แบบฝึกหัดการวินิจฉัยปัญหา
- งานการใช้งานการตรวจสอบ
- การจำลองการตอบสนองต่อเหตุการณ์

**การประเมินโมดูล 6**: หัวข้อขั้นสูง
- การออกแบบ CI/CD pipeline
- การพัฒนาเทมเพลตที่กำหนดเอง
- สถานการณ์สถาปัตยกรรมระดับองค์กร

### โครงการสุดท้าย

ออกแบบและใช้งานโซลูชันครบวงจรที่แสดงให้เห็นถึงความเชี่ยวชาญในทุกแนวคิด:

**ข้อกำหนด**:
- สถาปัตยกรรมแอปพลิเคชันหลายชั้น
- สภาพแวดล้อมการปรับใช้หลายตัว
- การตรวจสอบและการแจ้งเตือนอย่างครอบคลุม
- การใช้งานความปลอดภัยและการปฏิบัติตาม
- การปรับปรุงค่าใช้จ่ายและประสิทธิภาพ
- เอกสารประกอบและ runbooks ครบถ้วน

**
3. **มีส่วนร่วมในโอเพ่นซอร์ส**: แบ่งปันเทมเพลตและวิธีแก้ปัญหาของคุณกับชุมชน  
4. **สอนผู้อื่น**: การอธิบายแนวคิดให้ผู้อื่นช่วยเสริมสร้างความเข้าใจของคุณเอง  
5. **อย่าหยุดสงสัย**: สำรวจบริการ Azure ใหม่ๆ และรูปแบบการผสานรวมอย่างต่อเนื่อง  

---

**การนำทาง**  
- **บทเรียนก่อนหน้า**: [FAQ](faq.md)  
- **บทเรียนถัดไป**: [Changelog](../changelog.md)  

**การติดตามความก้าวหน้าในการศึกษา**: ใช้คู่มือนี้เพื่อติดตามเส้นทางการเรียนรู้ของคุณและเพื่อให้ครอบคลุมแนวคิดและแนวปฏิบัติทั้งหมดของ Azure Developer CLI อย่างครบถ้วน

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้องมากที่สุด แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้