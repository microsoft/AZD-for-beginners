# บันทึกการเปลี่ยนแปลง - AZD สำหรับผู้เริ่มต้น

## บทนำ

บันทึกการเปลี่ยนแปลงนี้เป็นการบันทึกการเปลี่ยนแปลงที่สำคัญทั้งหมด อัปเดต และปรับปรุงสำหรับที่เก็บ AZD สำหรับผู้เริ่มต้น เราปฏิบัติตามหลักการ versioning ตามความหมายและดูแลบันทึกนี้เพื่อช่วยให้ผู้ใช้เข้าใจว่ามีการเปลี่ยนแปลงอะไรบ้างระหว่างเวอร์ชัน

## เป้าหมายการเรียนรู้

เมื่อทบทวนบันทึกการเปลี่ยนแปลงนี้แล้ว คุณจะ:
- ติดตามข่าวสารเกี่ยวกับฟีเจอร์ใหม่และการเพิ่มเนื้อหา
- เข้าใจการปรับปรุงในเอกสารที่มีอยู่
- ติดตามการแก้ไขบั๊กและการแก้ไขเพื่อให้แน่ใจในความถูกต้อง
- ติดตามการพัฒนาของวัสดุการเรียนรู้ตลอดเวลา

## ผลลัพธ์การเรียนรู้

หลังจากทบทวนรายการบันทึกการเปลี่ยนแปลงแล้ว คุณจะสามารถ:
- ระบุเนื้อหาและทรัพยากรใหม่ที่พร้อมใช้งานสำหรับการเรียนรู้
- เข้าใจว่าส่วนใดได้รับการปรับปรุงหรืออัปเดต
- วางแผนเส้นทางการเรียนรู้ของคุณตามวัสดุที่เป็นปัจจุบันที่สุด
- ให้ข้อเสนอแนะและข้อเสนอแนะสำหรับการปรับปรุงในอนาคต

## ประวัติรุ่น

### [v3.24.0]- 2026-11-04

#### แก้ไข
- ซ่อมแซมการนำทางคอร์สภาษาอังกฤษ, เส้นทางหน้าที่ย้าย, ตำแหน่งสมอที่ขาดหาย, และการอ้างอิงภายนอกที่ล้าสมัย รวมถึงลิงก์บทที่ 2 ไปยังคู่มือ AI Production
- ทบทวนคำแนะนำปัจจุบันตาม AZD 1.37.2, agents 1.0.0-beta.23, และ evaluations 1.0.0-beta.2 ที่เผยแพร่ บันทึกการแยกเวิร์กโฟลว์ `azd ai eval` และการโยกย้ายการกำหนดค่าการเพิ่มประสิทธิภาพ
- แก้ไขป้าย CLI ที่ไม่รองรับ, ขอบเขตการยืนยันตัวตน, คำแนะนำสภาพแวดล้อม/ความลับแบบข้อความธรรมดา, การปรับปรุงโครงสร้างพื้นฐาน, การกำหนดโมเดล และตัวอย่างการกู้คืนที่ทำลายล้าง
- ปรับปรุงเวิร์กชอปตามตัวอย่าง AI Agents ปัจจุบัน รวมถึงตะขอจริง, การป้อนข้อมูลการกำหนดค่า, การทดสอบการประเมิน, จุดเข้าทำ red-teaming, และการสังเกตการณ์
- แก้ไขคำกล่าวอ้างตัวอย่างการนำไปใช้และซ่อมแซมปัญหาเกี่ยวกับแอป/โครงสร้างพื้นฐาน/การกำหนดค่าที่เกี่ยวข้อง วัสดุสถาปัตยกรรมค้าปลีกจะแยกอย่างชัดเจนจากแอปพลิเคชันที่ทำงานสมบูรณ์
- คืนค่าเมทริกซ์ภาษา CodeQL, เลือกใช้ Node.js 24 ที่รองรับสำหรับ dev container, และทำให้ตัวตรวจสอบการตั้งค่ารายงานคำสั่งเวอร์ชันที่ล้มเหลว

#### เพิ่มเติม
- เครื่องมือตรวจสอบลิงก์/สมอแบบออฟไลน์สำหรับภาษาอังกฤษเท่านั้น, การทดสอบถดถอย, และเวิร์กโฟลว์เอกสารที่สร้างเวิร์กชอปในโหมดเข้มงวด แปลอัตโนมัติและรูปภาพที่แปลแล้วจะไม่รวมอยู่

#### ขอบเขตการตรวจสอบ
- ตรวจสอบซอร์ส, ไวยากรณ์, การกำหนดค่า, พฤติกรรมท้องถิ่น, และลิงก์เครือข่ายไม่ได้ระบุความสามารถในการปรับใช้ Azure แบบสด, โควต้า, RBAC, ความพร้อมใช้งานโมเดลในภูมิภาค, บิลลิ่ง, การปฏิบัติตามความปลอดภัย หรือความพร้อมใช้งานสำหรับการผลิต
- รายการเก่าด้านล่างเป็นบันทึกประวัติศาสตร์ ไม่ใช่คำสั่งคำสั่งหรือคำแนะนำการปล่อยปัจจุบัน

### [v3.23.0] - 2026-07-13

#### การรีเฟรช AZD 1.27.1: การอัปเดตสถานะเวอร์ชัน
**เวอร์ชันนี้ทำการตรวจสอบคอร์สใหม่กับ `azd` `1.27.1` (กรกฎาคม 2026, เวอร์ชันเสถียรล่าสุด) และส่วนขยาย AI agent รุ่นพรีวิวปัจจุบัน `azure.ai.agents` `1.0.0-beta.5` เพื่อให้งาน "validated against" ทุกชิ้นเป็นปัจจุบันหลังการปล่อย 1.26.0, 1.27.0, และ 1.27.1**

#### เปลี่ยนแปลง
- **✅ ปรับปรุงเส้นฐานการตรวจสอบ** จาก `azd 1.25.6` (มิถุนายน 2026) เป็น `azd 1.27.1` (กรกฎาคม 2026) ใน README หลัก, README ของทุกบท, บทเรียน dev-container บทที่ 1 (รวมตัวอย่างเวอร์ชันที่ตรึงไว้), บทเรียนเทมเพลตแบบกำหนดเองบทที่ 4, บทเรียน multi-agent บทที่ 5, และเอกสารเวิร์กชอป
- **🤖 รีเฟรชเส้นฐานบทที่ 2** จาก `azd 1.23.12` (มีนาคม 2026) เป็น `azd 1.27.1` ใน `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, และ `microsoft-foundry-integration.md`; ปรับปรุงวันที่บันทึกในหมายเหตุการตรวจสอบเป็น 2026-07-13
- **🧩 อัปเดตส่วนขยาย AI agent** จาก `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` เป็นรุ่นปัจจุบัน `1.0.0-beta.5` ใน README บทที่ 2 และ `agents.md`
- **🧪 อัปเดตตัวอย่างการตรวจสอบเวิร์กชอป** (เอาต์พุต `azd version`) เป็น `1.27.1`

#### หมายเหตุเกี่ยวกับการปล่อย azd ที่เกี่ยวข้อง (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** รองรับ Go สำหรับ Azure Functions บน Flex Consumption, ตัวกรองสมัครสมาชิก `azd config sub-filter` ต่อผู้เช่า, แพ็กเกจส่วนขยายแบบบันเดิลแท้ (`azd x pack --bundle`), และ `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** โมเดล Azure AI Foundry projects/agents ใน `azure.yaml` โดยตรง (เริ่มต้นแบบไม่ใช้ Bicep/Terraform), รองรับการปรับใช้คอนเทนเนอร์สำหรับ App Service (`host: appservice` + `language: docker`), `-s/--source` โดยตรงสำหรับคำสั่ง `azd extension`, และ `azd tool uninstall`
- **1.27.1 (2026-07-09):** ธง `--no-dependencies` สำหรับ `azd extension install`, โมเดลที่หยุดใช้งานจะถูกแยกออกจากคำแนะนำแคตตาล็อก/โควต้าตามค่าเริ่มต้น, และแก้ไขบั๊กหลายรายการ

#### ไฟล์ที่อัปเดต
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### การเติมช่องว่างสำหรับผู้เริ่มต้น #2: การสร้างเทมเพลต, Dev Containers, Pulumi, Azure DevOps, Service Principals และอื่นๆ
**เวอร์ชันนี้ปิดช่องว่างปานกลางที่เหลือจากการวิเคราะห์ azd-coverage: วิธีการสร้างและเผยแพร่เทมเพลตของคุณเอง, สภาพแวดล้อม dev-container/Codespaces ที่ทำซ้ำได้, ผู้ให้บริการโครงสร้างพื้นฐาน Pulumi, การแนะนำ Azure DevOps CI/CD, การยืนยัน Service Principal, คำแนะนำการเลือกโฮสต์ (AKS/Spring Apps), คำอธิบาย `azd restore`/`azd package`, การจัดการข้อผิดพลาดตะขอ, และแนวทางปฏิบัติในทีม/สภาพแวดล้อมที่ใช้ร่วมกัน**

#### เพิ่มเติม
- **🧱 บทเรียนใหม่ บทที่ 4** `docs/chapter-04-infrastructure/custom-templates.md` — การสร้างเทมเพลต azd ของคุณเอง: โครงสร้างที่จำเป็น (`azure.yaml`, `infra/`, `src/`), ฟิลด์ `metadata.template`, การพารามิเตอร์โครงสร้างพื้นฐานด้วยโทเค็นทรัพยากร `uniqueString()` และแท็ก `azd-env-name`, การทดสอบในเครื่องด้วย `azd init --template <local-path>`, การเผยแพร่สู่ GitHub และการส่งไปที่ Awesome AZD gallery
- **📦 บทเรียนใหม่ บทที่ 1** `docs/chapter-01-foundation/dev-containers.md` — สภาพแวดล้อม azd ที่ทำซ้ำได้ด้วย Dev Containers และ GitHub Codespaces: ตัวอย่าง `.devcontainer/devcontainer.json` ที่เรียบง่ายใช้ฟีเจอร์อย่างเป็นทางการ `ghcr.io/azure/azure-dev/azd`, ฟีเจอร์เฉพาะภาษา, `docker-in-docker` สำหรับโฮสต์คอนเทนเนอร์ และ `azd auth login --use-device-code` สำหรับการเข้าสู่ระบบระยะไกล
- **🧩 Pulumi กับ azd** ใน `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, การจัดวางโฟลเดอร์ Pulumi, สแต็คแมปกับสภาพแวดล้อม azd, เอาต์พุต/การแท็กที่จำเป็น และเวิร์กโฟลว์ `azd up` / `azd down` ที่เหมือนกัน
- **🎯 คำแนะนำการเลือกโฮสต์** ใน `docs/chapter-04-infrastructure/provisioning.md` — การเปรียบเทียบที่เหมาะสำหรับผู้เริ่มต้นของ `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, และ `springapp` พร้อมคำแนะนำว่าเมื่อใดควรเลือก AKS หรือ Azure Spring Apps
- **🛠️ การแนะนำ Azure DevOps CI/CD** ใน `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, การเชื่อมต่อบริการด้วย workload identity federation (OIDC), `azure-dev.yml` ที่สร้างขึ้น และการตั้งค่ากลุ่มตัวแปร
- **🔑 Service Principals (Pattern 4)** เพิ่มใน `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` แบบไม่โต้ตอบกับความลับของลูกค้า เทียบกับข้อมูลรับรอง federated/OIDC, เมื่อใช้ และการเก็บรักษาข้อมูลรับรองอย่างปลอดภัย
- **🪝 การจัดการข้อผิดพลาดตะขอ** ใน `docs/chapter-04-infrastructure/deployment-guide.md` — รหัสออกและ `set -e`, `continueOnError`, ทดสอบตะขอแยกด้วย `azd hooks run`, shell ตาม OS, และ `--debug`
- **👥 ทีม/สภาพแวดล้อมที่ใช้ร่วมกัน** ใน `docs/chapter-03-configuration/configuration.md` — สิ่งที่อยู่ใน `.azure/`, สิ่งที่ต้อง gitignore, สภาพแวดล้อมต่อผู้พัฒนา, `azd env list`/`select`, และการให้ค่าพารามิเตอร์ใน CI/CD
- **🧰 การอธิบาย `azd restore` และการขยาย `azd package`** ใน `resources/cheat-sheet.md` — คืนค่าการขึ้นต่อกันและสร้างอาร์ติแฟกต์ที่ปรับใช้ได้โดยไม่ต้องปรับใช้จริง

#### เปลี่ยนแปลง
- **🧭 ตารางบทเรียนบทที่ 4** อัปเดตรวมบทเรียนใหม่ "การสร้างเทมเพลตของคุณเอง" (บทเรียน 3)
- **🧭 ตารางบทเรียนบทที่ 1** อัปเดตรวมบทเรียนใหม่ "Dev Containers & Codespaces" (บทเรียน 5); ส่วนท้ายการนำทางเชื่อมโยงระหว่าง `bring-your-own-app.md` และ `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### การเติมช่องว่างสำหรับผู้เริ่มต้น: บทเรียนมัลติเอเยนต์แบบปฏิบัติ, "นำแอปของคุณมาเอง," Terraform และ CI/CD
**เวอร์ชันนี้ปิดช่องว่างที่ใหญ่ที่สุดสำหรับคู่มือผู้เริ่มต้นที่สมบูรณ์ด้วยการเพิ่มบทเรียนปฏิบัติใหม่สองบท (การเดินทางด้วยมัลติเอเยนต์ที่ปรับใช้ได้และการเพิ่ม azd ลงในแอปที่มีอยู่), การแนะนำ hooks สำหรับผู้เริ่มต้น, ส่วน Terraform กับ azd, การแนะนำ pipeline GitHub Actions ทีละขั้นตอน, การอธิบายส่วนขยายรุ่นพรีวิวใหม่ และรายการตรวจสอบการยืนยันการปรับใช้ที่ชัดเจน**

#### เพิ่มเติม
- **🤝 บทเรียนใหม่บทที่ 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — การเดินทางแบบมือสองเอเยนต์ที่ปรับใช้ได้เต็มรูปแบบ (orchestrator + specialists) ใช้เทมเพลตจริง (`contoso-creative-writer`), ครอบคลุมเมื่อใช้มัลติเอเยนต์, เวิร์กโฟลว์ `azd up`, การเข้าใจทรัพยากรที่ปรับใช้, การติดตามข้ามเอเยนต์, การปรับแต่ง และการล้างข้อมูล
- **📦 บทเรียนใหม่บทที่ 1** `docs/chapter-01-foundation/bring-your-own-app.md` — วิธีเพิ่ม azd ลงในโปรเจ็กต์ที่มีอยู่ด้วย `azd init` ("ใช้โค้ดในไดเรกทอรีปัจจุบัน"), เข้าใจ `azure.yaml` และ `infra/`, `azd infra generate`, การตรวจจับโฮสต์, และการปรับใช้ด้วย `azd up`
- **🌐 ส่วน Terraform กับ azd** เพิ่มใน `docs/chapter-04-infrastructure/provisioning.md` — การกำหนดค่า `infra.provider: terraform`, การจัดวางโฟลเดอร์ `.tf`, เอาต์พุต `AZURE_*` ที่ต้องการและการแท็ก `azd-env-name`, และเวิร์กโฟลว์ `azd up` / `azd down` ที่เหมือนกัน (ปิดช่องว่างที่อ้างว่ารองรับ Terraform แต่แสดงแค่ Bicep)
- **⚙️ การแนะนำ GitHub Actions ทีละขั้นตอน** ใน `docs/chapter-08-production/production-ai-practices.md` — จากรีโป GitHub ถึงการปรับใช้อัตโนมัติ: `azd pipeline config`, ข้อมูลรับรอง federated OIDC (ไม่มีการเก็บความลับ), `azure-dev.yml` ที่สร้างขึ้น และคำแนะนำความแตกต่างระหว่างความลับและตัวแปร
- **🪝 การแนะนำสำหรับผู้เริ่มต้น "ใหม่กับ hooks?"** ใน `docs/chapter-04-infrastructure/deployment-guide.md` — ตะขอคืออะไร ตารางขั้นตอนตะขอ ตะขอแรกที่เรียบง่าย และการรันตะขอด้วยมือกับ `azd hooks run`
- **✅ รายการตรวจสอบ "ยืนยันการปรับใช้ของคุณ"** เพิ่มในขั้นตอนที่ 5 ของ `docs/chapter-01-foundation/first-project.md` — การทดสอบเบื้องต้น, การตรวจสอบจุดสิ้นสุดสภาพสมบูรณ์ และเกณฑ์ความสำเร็จที่ชัดเจน
- **🧩 การอธิบายส่วนขยายพรีวิวใหม่** `azure.ai.skills` และ `azure.ai.connections` (คืออะไรและเมื่อใดควรใช้) ใน `docs/chapter-08-production/production-ai-practices.md`

#### เปลี่ยนแปลง
- **🧭 ตารางบทเรียนบทที่ 5** แก้ไขแล้ว: `multi-agent-basics.md` เป็นบทเรียน 1 (บทเรียนปฏิบัติเต็มรูปแบบเพียงบทเดียว), แสดงอย่างตรงไปตรงมาว่าบทเรียน 2 อยู่ในบทที่ 6 และสถานการณ์ค้าปลีกเป็นแบบร่างสถาปัตยกรรมไม่ใช่เทมเพลตคำสั่งเดียว
- **🧭 ตารางบทเรียนบทที่ 1** รวมบทเรียนใหม่ "Bring Your Own App" (บทเรียน 4)
- **🔗 ส่วนท้ายการนำทาง** อัปเดต: `first-project.md` ลิงก์ไปยัง `bring-your-own-app.md`

#### แก้ไข
- **🧱 ปิดช่องว่าง Terraform ที่อ้างแต่ขาดหาย** — คอร์สเคยอ้างถึงการรองรับ Terraform แต่ไม่ได้แสดง
- **🔀 แก้ไขลิงก์ข้ามบทที่ 5 ที่เข้าใจผิด** ซึ่งเป็นการบอกเป็นนัยว่ามีการนำมัลติเอเยนต์ไปใช้งานเต็มที่ในขณะที่มีแค่แบบร่างสถาปัตยกรรมเท่านั้น

#### ไฟล์ที่อัปเดต
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(ใหม่)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(ใหม่)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### รีเฟรช AZD 1.25.6, คำสั่งวงจรชีวิตเอเย่นต์เต็มรูปแบบ & รีแบรนด์ Aspire
**เวอร์ชันนี้ทำการตรวจสอบหลักสูตรอีกครั้งกับ `azd` `1.25.6` (มิถุนายน 2026) และ `azure.ai.agents` `0.1.40-preview` ส่วนขยาย, ขยายคำแนะนำ AI จาก "โครงสร้างเอเย่นต์" สู่วงจรชีวิตเอเย่นต์ครบถ้วน (ทดสอบ → ประเมิน → ปรับแต่ง → ตรวจสอบ → ลบ), แสดงส่วนขยายตัวอย่างใหม่ `azure.ai.skills` และ `azure.ai.connections`, และสังเกตการรีแบรนด์ผลิตภัณฑ์จาก ".NET Aspire" เป็น "Aspire"**

#### เพิ่มเติม
- **🔁 ครอบคลุมวงจรชีวิตเอเย่นต์เต็มรูปแบบ** สำหรับผู้เริ่มต้นและวิศวกร AI ทั่วเอกสาร:
  - `docs/chapter-01-foundation/azd-basics.md` — ตารางวงจรชีวิต (โครงสร้าง → ทดสอบ → วัดผล → ปรับปรุง → ตรวจสอบ → ทำความสะอาด) เพิ่มในส่วนขยายและคำสั่ง AI
  - `docs/chapter-08-production/production-ai-practices.md` — ส่วนใหม่ "การจัดการวงจรชีวิตเอเย่นต์" ครอบคลุม `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, และ `delete --force`
  - `resources/cheat-sheet.md` — ขยายคำสั่ง AI Agent ด้วย `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, และ `delete --force`
- **🧩 ส่วนขยายตัวอย่างใหม่** ได้รับการบันทึก: `azure.ai.skills` (ทักษะเอเย่นต์ที่นำกลับมาใช้ใหม่ได้) และ `azure.ai.connections` (การเชื่อมต่อ Foundry) เพิ่มในตารางส่วนขยายและชีทช่วยจำ
- **⏱️ คำแนะนำการตอบสนองตามเวลา** — ตัวอย่าง `azd ai agent invoke` ตอนนี้แจ้งว่าพิมพ์ค่าความหน่วงรวมและเวลาถึงไบต์แรก
- **📌 แบนเนอร์เวอร์ชัน** ใน README รากชี้นำผู้เรียนไปยัง `azd version` และ `azd upgrade`

#### เปลี่ยนแปลง
- **✅ อัปเดตฐานข้อมูลการตรวจสอบ** จาก `azd 1.23.12` (มีนาคม 2026) เป็น `azd 1.25.6` (มิถุนายน 2026) ทั่ว README ของทุกบทและเอกสารการประชุมเชิงปฏิบัติการ
- **🤖 หมายเหตุส่วนขยายบทที่ 2** อัปเดตจาก `azure.ai.agents` `0.1.18-preview` เป็น `0.1.40-preview`
- **🧪 ตัวอย่างการตรวจสอบในเวิร์กช็อป** (`azd version` เอาต์พุต) อัปเดตเป็น `1.25.6`
- **🧭 README "อะไรใหม่ใน azd วันนี้"** รีเฟรชเพื่อเน้นวงจรชีวิตเอเย่นต์แบบครบวงจร, ส่วนขยาย AI ใหม่, และการแก้ไขคุณภาพชีวิตล่าสุด (`azd init` ความสามารถในการทำซ้ำ, `azd auth login` การล้างโทเค็นหมดอายุ, `azd tool` คำแนะนำการรันครั้งแรก)
- **📖 agents.md บทที่ 2 (ตัวเลือกที่ 4)** ชี้นำผู้เรียนไปยังคำสั่งวงจรชีวิตหลังการปรับใช้แทนที่จะหยุดที่ `azd up`

#### แก้ไข
- **🏷️ การตั้งชื่อผลิตภัณฑ์** — เพิ่มบันทึกรีแบรนด์ Aspire (".NET Aspire" ตอนนี้เป็นเพียง "Aspire"); การสนับสนุน Aspire ของ azd ไม่เปลี่ยนแปลง
- **🔎 การตรวจสอบการปล่อยสด** ยืนยันกับฟีดการปล่อย Azure Developer CLI: CLI สเถียร `1.25.6` (2026-06-12) และ `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### ไฟล์ที่อัปเดต
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### ชี้แจงการเริ่มต้นสำหรับผู้เริ่มต้น, การตรวจสอบการตั้งค่า & การล้างคำสั่ง AZD ขั้นสุดท้าย
**เวอร์ชันนี้ตามด้วยการตรวจสอบ AZD 1.23 ด้วยการทบทวนเอกสารสำหรับผู้เริ่มต้น: ชี้แจงคำแนะนำการยืนยันตัวตนแบบ AZD ก่อน, เพิ่มสคริปต์ตรวจสอบการติดตั้งในเครื่อง, ยืนยันคำสั่งสำคัญกับ AZD CLI ที่ใช้งานจริง, และลบการอ้างอิงคำสั่งจากแหล่งภาษาอังกฤษที่ล้าสมัยออกนอกบันทึกการเปลี่ยนแปลง**

#### เพิ่มเติม
- **🧪 สคริปต์ตรวจสอบการตั้งค่าสำหรับผู้เริ่มต้น** พร้อม `validate-setup.ps1` และ `validate-setup.sh` เพื่อให้ผู้เรียนยืนยันว่าเครื่องมือที่จำเป็นมีครบก่อนเริ่มบทที่ 1
- **✅ ขั้นตอนตรวจสอบการตั้งค่าล่วงหน้า** ใน README รากและ README บทที่ 1 เพื่อจับข้อกำหนดที่ขาดหายก่อน `azd up`

#### เปลี่ยนแปลง
- **🔐 คำแนะนำการยืนยันตัวตนสำหรับผู้เริ่มต้น** ตอนนี้ปฏิบัติต่อ `azd auth login` เป็นเส้นทางหลักสำหรับเวิร์กโฟลว์ AZD โดย `az login` ถูกเน้นว่าเป็นตัวเลือกถ้าไม่ใช้คำสั่ง Azure CLI โดยตรง
- **📚 โฟลว์การเริ่มต้นในบทที่ 1** ชี้นำผู้เรียนให้ตรวจสอบการติดตั้งในเครื่องก่อนการติดตั้ง, การยืนยันตัวตน, และขั้นตอนการปรับใช้ครั้งแรก
- **🛠️ ข้อความตัวตรวจสอบ** ตอนนี้แยกความต้องการที่บล็อกการใช้งานออกจากคำเตือน Azure CLI ที่ไม่บังคับสำหรับเส้นทางผู้เริ่มต้นที่ใช้เฉพาะ AZD
- **📖 เอกสารการตั้งค่า, การแก้ปัญหา, และตัวอย่าง** ตอนนี้แยกความแตกต่างระหว่างการยืนยันตัวตน AZD ที่จำเป็นและการเข้าสู่ระบบ Azure CLI ที่ไม่บังคับในบริบทที่ทั้งสองถูกแสดงก่อนหน้านี้โดยไม่มีบริบท

#### แก้ไข
- **📋 การอ้างอิงคำสั่งจากแหล่งภาษาอังกฤษที่เหลือ** อัปเดตเป็นฟอร์ม AZD ปัจจุบัน รวมถึง `azd config show` ในชีทช่วยจำและ `azd monitor --overview` ในบริบทที่ต้องการคำแนะนำภาพรวมของ Azure Portal
- **🧭 ข้อกล่าวอ้างสำหรับผู้เริ่มต้นในบทที่ 1** ปรับให้ไม่เกินจริงเพื่อหลีกเลี่ยงการรับประกันพฤติกรรมไม่มีข้อผิดพลาดหรือการย้อนกลับอัตโนมัติในทุกเทมเพลตและทรัพยากร Azure
- **🔎 การตรวจสอบ CLI สด** ยืนยันการสนับสนุนปัจจุบันสำหรับ `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, และ `azd down --force --purge`

#### ไฟล์ที่อัปเดต
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### การตรวจสอบ AZD 1.23.12, การขยายสภาพแวดล้อมเวิร์กช็อป & การรีเฟรชโมเดล AI
**เวอร์ชันนี้ดำเนินการตรวจสอบเอกสารกับ `azd` `1.23.12`, อัปเดตตัวอย่างคำสั่ง AZD ที่ล้าสมัย, รีเฟรชคำแนะนำโมเดล AI เป็นค่าดีฟอลต์ปัจจุบัน, และขยายคำแนะนำเวิร์กช็อปเกินกว่า GitHub Codespaces เพื่อสนับสนุน dev containers และโคลนในเครื่อง**

#### เพิ่มเติม
- **✅ หมายเหตุการตรวจสอบทั่วบทหลักและเอกสารเวิร์กช็อป** เพื่อชี้แจงฐาน AZD ที่ทดสอบสำหรับผู้เรียนที่ใช้ CLI รุ่นใหม่หรือเก่า
- **⏱️ คำแนะนำเวลา timeout การปรับใช้** สำหรับการปรับใช้แอป AI ที่ใช้เวลานานด้วย `azd deploy --timeout 1800`
- **🔎 ขั้นตอนการตรวจสอบส่วนขยาย** ด้วย `azd extension show azure.ai.agents` ในเอกสารเวิร์กโฟลว์ AI
- **🌐 คำแนะนำสภาพแวดล้อมเวิร์กช็อปที่กว้างขึ้น** ครอบคลุม GitHub Codespaces, dev containers, และโคลนในเครื่องด้วย MkDocs

#### เปลี่ยนแปลง
- **📚 README แนะนำบท** ตอนนี้บ่งชี้การตรวจสอบกับ `azd 1.23.12` ในส่วนพื้นฐาน, การตั้งค่า, โครงสร้างพื้นฐาน, หลายเอเย่นต์, ก่อนการปรับใช้, การแก้ปัญหา, และส่วนการผลิต
- **🛠️ การอ้างอิงคำสั่ง AZD** ปรับเป็นรูปแบบปัจจุบันทั่วเอกสาร:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` หรือ `azd env get-value(s)` ขึ้นกับบริบท
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` เมื่อมีการกล่าวถึงภาพรวม Application Insights
- **🧪 ตัวอย่างการจัดเตรียมตัวอย่าง** ที่เรียบง่ายขึ้นเป็นการใช้งานที่รองรับปัจจุบัน เช่น `azd provision --preview` และ `azd provision --preview -e production`
- **🧭 โฟลว์เวิร์กช็อป** ปรับเพื่อให้ผู้เรียนทำแลปใน Codespaces, dev container, หรือโคลนในเครื่องแทนการสมมติว่าทำได้เฉพาะ Codespaces เท่านั้น
- **🔐 คำแนะนำการยืนยันตัวตน** ตอนนี้เลือกใช้ `azd auth login` สำหรับเวิร์กโฟลว์ AZD โดยมี `az login` เป็นตัวเลือกเมื่อใช้งานคำสั่ง Azure CLI โดยตรง

#### แก้ไข
- **🪟 คำสั่งติดตั้ง Windows** ทำให้เป็นมาตรฐานกับเคสของแพ็กเกจ `winget` ในคู่มือการติดตั้ง
- **🐧 คำแนะนำติดตั้ง Linux** แก้ไขเพื่อหลีกเลี่ยงคำแนะนำของผู้จัดการแพ็กเกจเฉพาะดิสโทรที่ไม่รองรับ `azd` และชี้ไปยังแอสเซ็ตการปล่อยที่เหมาะสมแทน
- **📦 ตัวอย่างโมเดล AI** รีเฟรชจากค่าดีฟอลต์เก่าอย่าง `gpt-35-turbo` และ `text-embedding-ada-002` เป็นตัวอย่างปัจจุบันเช่น `gpt-4.1-mini`, `gpt-4.1`, และ `text-embedding-3-large`
- **📋 สคริปต์ปรับใช้และวินิจฉัย** แก้ไขเพื่อใช้คำสั่งสภาพแวดล้อมและสถานะปัจจุบันในบันทึก, สคริปต์, และขั้นตอนแก้ปัญหา
- **⚙️ คำแนะนำ GitHub Actions** อัปเดตจาก `Azure/setup-azd@v1.0.0` เป็น `Azure/setup-azd@v2`
- **🤖 คำแนะนำการยินยอม MCP/Copilot** อัปเดตจาก `azd mcp consent` เป็น `azd copilot consent list`

#### ปรับปรุง
- **🧠 คำแนะนำบท AI** ตอนนี้อธิบายพฤติกรรม `azd ai` ที่ไวต่อสถานะตัวอย่าง, การเข้าสู่ระบบเฉพาะเช่า, การใช้ส่วนขยายปัจจุบัน, และคำแนะนำการปรับใช้โมเดลที่อัปเดตได้ดีขึ้น
- **🧪 คำแนะนำเวิร์กช็อป** ใช้ตัวอย่างเวอร์ชันที่สมจริงมากขึ้นและภาษาการตั้งค่าสภาพแวดล้อมที่ชัดเจนสำหรับแลปลงมือปฏิบัติ
- **📈 เอกสารการผลิตและแก้ปัญหา** ตอนนี้สอดคล้องดีกับตัวอย่างการตรวจสอบล่าสุด, โมเดลสำรอง, และระดับค่าใช้จ่าย

#### ไฟล์ที่อัปเดต
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### คำสั่ง CLI AI ของ AZD, การตรวจสอบเนื้อหา & การขยายเทมเพลต
**เวอร์ชันนี้เพิ่มการครอบคลุมคำสั่ง `azd ai`, `azd extension`, และ `azd mcp` ทั่วบทที่เกี่ยวข้องกับ AI ทั้งหมด, แก้ไขลิงก์ที่เสียและโค้ดที่เลิกใช้งานใน agents.md, อัปเดตชีทช่วยจำ, และปรับปรุงส่วนเทมเพลตตัวอย่างด้วยคำอธิบายที่ตรวจสอบแล้วและเทมเพลต Azure AI AZD ใหม่**

#### เพิ่มเติม
- **🤖 การครอบคลุม CLI AI ของ AZD** ใน 7 ไฟล์ (ก่อนหน้านี้มีเฉพาะในบทที่ 8):
  - `docs/chapter-01-foundation/azd-basics.md` — ส่วนใหม่ "ส่วนขยายและคำสั่ง AI" แนะนำ `azd extension`, `azd ai agent init`, และ `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — ตัวเลือกที่ 4: `azd ai agent init` พร้อมตารางเปรียบเทียบ (แนวทางเทมเพลต กับ แนวทาง manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — ส่วนย่อย "ส่วนขยาย AZD สำหรับ Foundry" และ "การปรับใช้เอเย่นต์ก่อน"
  - `docs/chapter-05-multi-agent/README.md` — เริ่มต้นอย่างรวดเร็วตอนนี้แสดงเส้นทางการปรับใช้ทั้งแบบเทมเพลตและแบบ manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — ส่วนปรับใช้ตอนนี้รวมตัวเลือก `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — ส่วนย่อย "คำสั่งส่วนขยาย AI AZD สำหรับการวินิจฉัย"
  - `resources/cheat-sheet.md` — ส่วนใหม่ "คำสั่ง AI และส่วนขยาย" พร้อม `azd extension`, `azd ai agent init`, `azd mcp`, และ `azd infra generate`
- **📦 เทมเพลตตัวอย่าง AI AZD ใหม่** ใน `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — แชท RAG .NET กับ Blazor WebAssembly, Semantic Kernel, และสนับสนุนแชทเสียง
  - **azure-search-openai-demo-java** — แชท RAG Java ใช้ Langchain4J พร้อมตัวเลือกปรับใช้ ACA/AKS
  - **contoso-creative-writer** — แอปเขียนสร้างสรรค์มัลติเอเย่นต์ใช้ Azure AI Agent Service, Bing Grounding, และ Prompty
  - **serverless-chat-langchainjs** — RAG แบบ serverless ใช้ Azure Functions + LangChain.js + Cosmos DB พร้อมสนับสนุนการพัฒนาในเครื่องแบบ Ollama
  - **chat-with-your-data-solution-accelerator** — ตัวเร่งความเร็ว RAG สำหรับองค์กรพร้อมพอร์ทัลผู้ดูแลระบบ การรวมกับ Teams และตัวเลือก PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — แอปอ้างอิงการจัดการ MCP หลายเอเย่นต์พร้อมเซิร์ฟเวอร์ใน .NET, Python, Java และ TypeScript
  - **azd-ai-starter** — เทมเพลตเริ่มต้น Bicep โครงสร้างพื้นฐาน Azure AI ที่เรียบง่าย
  - **🔗 ลิงก์ Awesome AZD AI Gallery** — อ้างอิงไปยัง [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ เทมเพลต)

#### แก้ไขแล้ว
- **🔗 agents.md การนำทาง**: ลิงก์ก่อนหน้า/ถัดไปตอนนี้ตรงกับลำดับบทเรียนใน README บทที่ 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ลิงก์เสีย**: `production-ai-practices.md` แก้ไขเป็น `../chapter-08-production/production-ai-practices.md` (3 ครั้ง)
- **📦 agents.md โค้ดเลิกใช้**: แทนที่ `opencensus` ด้วย `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md API ไม่ถูกต้อง**: ย้าย `max_tokens` จาก `create_agent()` ไปยัง `create_run()` เป็น `max_completion_tokens`
- **🔢 agents.md การนับโทเค็น**: แทนที่การประมาณคร่าวๆ `len//4` ด้วย `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: แก้ไขบริการจาก "Cognitive Search + App Service" เป็น "Azure AI Search + Azure Container Apps" (โฮสต์เริ่มต้นเปลี่ยนใน ต.ค. 2024)
- **contoso-chat**: อัปเดตคำอธิบายโดยอ้างอิงถึง Azure AI Foundry + Prompty ให้ตรงกับชื่อรีโปและสแต็กเทคโนโลยีจริง

#### ลบแล้ว
- **ai-document-processing**: ลบการอ้างอิงเทมเพลตก์ที่ไม่ทำงาน (รีโปไม่สามารถเข้าถึงสาธารณะได้ในฐานะเทมเพลต AZD)

#### ปรับปรุง
- **📝 agents.md แบบฝึกหัด**: แบบฝึกหัด 1 แสดงผลลัพธ์ที่คาดหวังและ `azd monitor` ขั้นตอน; แบบฝึกหัด 2 รวมโค้ดลงทะเบียน `FunctionTool` แบบเต็ม; แบบฝึกหัด 3 แทนคำแนะนำที่คลุมเครือด้วยคำสั่ง `prepdocs.py` ที่ชัดเจน
- **📚 agents.md แหล่งข้อมูล**: อัปเดตลิงก์เอกสารสู่เอกสารบริการตัวแทน Azure AI Agent ปัจจุบันและการเริ่มต้นรวดเร็ว
- **📋 agents.md ตารางขั้นตอนถัดไป**: เพิ่มลิงก์ AI Workshop Lab เพื่อความครอบคลุมบทเรียนทั้งหมด

#### ไฟล์ที่อัปเดต
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### การปรับปรุงการนำทางหลักสูตร
**เวอร์ชันนี้ปรับปรุงการนำทางบทใน README.md ด้วยรูปแบบตารางที่ปรับปรุงใหม่**

#### เปลี่ยนแปลง
- **ตารางแผนที่หลักสูตร**: ปรับปรุงด้วยลิงก์บทเรียนโดยตรงประมาณระยะเวลา และระดับความซับซ้อน
- **การลบโฟลเดอร์เก่า**: ลบโฟลเดอร์เก่าที่ซ้ำซ้อน (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **การตรวจสอบลิงก์**: ตรวจสอบความถูกต้องลิงก์ภายในกว่า 21 รายการในตารางแผนที่หลักสูตร

### [v3.16.0] - 2026-02-05

#### การอัพเดตรายชื่อผลิตภัณฑ์
**เวอร์ชันนี้อัปเดตการอ้างอิงชื่อผลิตภัณฑ์ให้เป็นแบรนด์ปัจจุบันของ Microsoft**

#### เปลี่ยนแปลง
- **Microsoft Foundry → Microsoft Foundry**: อัปเดตการอ้างอิงทั้งหมดในไฟล์ที่ไม่ใช่ไฟล์แปลภาษา
- **Azure AI Agent Service → Foundry Agents**: อัปเดตชื่อบริการให้สะท้อนแบรนด์ปัจจุบัน

#### ไฟล์ที่อัปเดต
- `README.md` - หน้าเข้าสู่หลักสูตรหลัก
- `changelog.md` - ประวัติรุ่น
- `course-outline.md` - โครงสร้างหลักสูตร
- `docs/chapter-02-ai-development/agents.md` - คู่มือ AI agents
- `examples/README.md` - เอกสารตัวอย่าง
- `workshop/README.md` - หน้าเข้าสู่เวิร์กช็อป
- `workshop/docs/index.md` - ดัชนีเวิร์กช็อป
- `workshop/docs/instructions/*.md` - ไฟล์คำแนะนำเวิร์กช็อปทั้งหมด

---

### [v3.15.0] - 2026-02-05

#### การปรับโครงสร้างรีโปหลัก: ชื่อโฟลเดอร์ตามบท
**เวอร์ชันนี้จัดโครงสร้างเอกสารเป็นโฟลเดอร์บทเรียนที่แยกต่างหาก เพื่อการนำทางที่ชัดเจนยิ่งขึ้น**

#### เปลี่ยนชื่อโฟลเดอร์
โฟลเดอร์เก่าถูกแทนที่ด้วยโฟลเดอร์ที่ตั้งชื่อตามหมายเลขบท:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- เพิ่มใหม่: `docs/chapter-05-multi-agent/`

#### การย้ายไฟล์
| ไฟล์ | จาก | ไปยัง |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| ไฟล์ pre-deployment ทั้งหมด | pre-deployment/ | chapter-06-pre-deployment/ |
| ไฟล์ troubleshooting ทั้งหมด | troubleshooting/ | chapter-07-troubleshooting/ |

#### เพิ่ม
- **📚 ไฟล์ README ในแต่ละบท**: สร้าง README.md ในแต่ละโฟลเดอร์บทพร้อม:
  - วัตถุประสงค์การเรียนรู้และระยะเวลา
  - ตารางบทเรียนพร้อมคำอธิบาย
  - คำสั่งเริ่มต้นอย่างรวดเร็ว
  - การนำทางไปยังบทเรียนอื่น

#### เปลี่ยนแปลง
- **🔗 อัปเดตลิงก์ภายในทั้งหมด**: อัปเดตเส้นทางมากกว่า 78 เส้นทางในไฟล์เอกสารทั้งหมด
- **🗺️ README.md หลักของหลักสูตร**: อัปเดตแผนที่หลักสูตรด้วยโครงสร้างบทเรียนใหม่
- **📝 examples/README.md**: อัปเดตการอ้างอิงข้ามไปยังโฟลเดอร์บทเรียน

#### ลบ
- โครงสร้างโฟลเดอร์เก่า (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### การปรับโครงสร้างรีโป: การนำทางบทเรียน
**เวอร์ชันนี้เพิ่มไฟล์ README สำหรับการนำทางบทเรียน (ถูกแทนที่โดย v3.15.0)**

---

### [v3.13.0] - 2026-02-05

#### คู่มือ AI Agents ใหม่
**เวอร์ชันนี้เพิ่มคู่มือฉบับสมบูรณ์สำหรับการปรับใช้ AI agents ด้วย Azure Developer CLI**

#### เพิ่ม
- **🤖 docs/microsoft-foundry/agents.md**: คู่มือครบถ้วนครอบคลุม:
  - AI agents คืออะไร และต่างจากแชทบอทอย่างไร
  - เทมเพลตตัวแทนเริ่มต้น 3 แบบ (Foundry Agents, Prompty, RAG)
  - รูปแบบสถาปัตยกรรมตัวแทน (ตัวแทนเดี่ยว, RAG, หลายตัวแทน)
  - การตั้งค่าเครื่องมือและการปรับแต่ง
  - การติดตามและวัดผล
  - การพิจารณาต้นทุนและการปรับปรุงประสิทธิภาพ
  - สถานการณ์แก้ไขปัญหาทั่วไป
  - แบบฝึกหัดปฏิบัติ 3 แบบพร้อมเกณฑ์ความสำเร็จ

#### โครงสร้างเนื้อหา
- **บทนำ**: แนวคิดตัวแทนสำหรับผู้เริ่มต้น
- **เริ่มต้นอย่างรวดเร็ว**: ปรับใช้ตัวแทนด้วย `azd init --template get-started-with-ai-agents`
- **รูปแบบสถาปัตยกรรม**: แผนภาพสถาปัตยกรรมตัวแทน
- **การตั้งค่า**: การตั้งค่าเครื่องมือและตัวแปรแวดล้อม
- **การติดตาม**: การรวม Application Insights
- **แบบฝึกหัด**: การเรียนรู้แบบปฏิบัติแบบก้าวหน้า (20-45 นาทีต่อแบบฝึกหัด)

---

### [v3.12.0] - 2026-02-05

#### อัปเดตสภาพแวดล้อม DevContainer
**เวอร์ชันนี้อัปเดตการตั้งค่าสภาพแวดล้อมคอนเทนเนอร์พัฒนาด้วยเครื่องมือสมัยใหม่และค่าเริ่มต้นที่ดีกว่าสำหรับประสบการณ์เรียนรู้ AZD**

#### เปลี่ยนแปลง
- **🐳 ภาพฐาน**: อัปเดตจาก `python:3.12-bullseye` เป็น `python:3.12-bookworm` (Debian stable ล่าสุด)
- **📛 ชื่อคอนเทนเนอร์**: เปลี่ยนชื่อจาก "Python 3" เป็น "AZD for Beginners" เพื่อความชัดเจน

#### เพิ่ม
- **🔧 คุณสมบัติ Dev Container ใหม่**:
  - `azure-cli` พร้อมเปิดใช้งาน Bicep
  - `node:20` (เวอร์ชัน LTS สำหรับเทมเพลต AZD)
  - `github-cli` สำหรับการจัดการเทมเพลต
  - `docker-in-docker` สำหรับการปรับใช้แอปคอนเทนเนอร์

- **🔌 การส่งต่อพอร์ต**: กำหนดพอร์ตล่วงหน้าสำหรับการพัฒนาทั่วไป:
  - 8000 (ดูตัวอย่าง MkDocs)
  - 3000 (เว็บแอป)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 ส่วนขยาย VS Code ใหม่**:
  - `ms-python.vscode-pylance` - ปรับปรุง Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - รองรับ Azure Functions
  - `ms-azuretools.vscode-docker` - รองรับ Docker
  - `ms-azuretools.vscode-bicep` - รองรับภาษา Bicep
  - `ms-azure-devtools.azure-resource-groups` - จัดการทรัพยากร Azure
  - `yzhang.markdown-all-in-one` - แก้ไข Markdown
  - `DavidAnson.vscode-markdownlint` - ตรวจสอบ Markdown
  - `bierner.markdown-mermaid` - รองรับแผนภูมิ Mermaid
  - `redhat.vscode-yaml` - รองรับ YAML (สำหรับ azure.yaml)
  - `eamodio.gitlens` - แสดงภาพ Git
  - `mhutchie.git-graph` - ประวัติ Git

- **⚙️ การตั้งค่า VS Code**: เพิ่มการตั้งค่าเริ่มต้นสำหรับ Python interpreter, การจัดรูปแบบเมื่อบันทึก และการลบช่องว่างส่วนเกิน

- **📦 อัปเดต requirements-dev.txt**:
  - เพิ่มปลั๊กอิน MkDocs minify
  - เพิ่ม pre-commit สำหรับคุณภาพโค้ด
  - เพิ่มแพ็กเกจ Azure SDK (azure-identity, azure-mgmt-resource)

#### แก้ไขแล้ว
- **คำสั่งหลังสร้าง**: ตรวจสอบการติดตั้ง AZD และ Azure CLI เมื่อเริ่มคอนเทนเนอร์

---

### [v3.11.0] - 2026-02-05

#### ปรับปรุง README สำหรับผู้เริ่มต้น
**เวอร์ชันนี้พัฒนา README.md อย่างมากเพื่อให้ง่ายต่อการเข้าถึงสำหรับผู้เริ่มต้น และเพิ่มแหล่งข้อมูลสำคัญสำหรับนักพัฒนา AI**

#### เพิ่ม
- **🆚 การเปรียบเทียบ Azure CLI กับ AZD**: อธิบายอย่างชัดเจนว่าใช้เครื่องมือใดเมื่อใด พร้อมตัวอย่างปฏิบัติ
- **🌟 ลิงก์ Awesome AZD**: ลิงก์ตรงสู่แกลเลอรีเทมเพลตชุมชนและทรัพยากรการมีส่วนร่วม:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - เทมเพลตใช้งานได้กว่า 200 แบบ
  - [ส่งเทมเพลต](https://github.com/Azure/awesome-azd/issues) - การมีส่วนร่วมของชุมชน
- **🎯 คู่มือเริ่มต้นอย่างรวดเร็ว**: ส่วนเริ่มต้น 3 ขั้นตอนที่ง่ายขึ้น (ติดตั้ง → เข้าสู่ระบบ → ปรับใช้)
- **📊 ตารางนำทางตามประสบการณ์**: คำแนะนำชัดเจนว่าจะเริ่มจากตรงไหนตามประสบการณ์ผู้พัฒนา

#### เปลี่ยนแปลง
- **โครงสร้าง README**: จัดระเบียบใหม่แบบเปิดเผยข้อมูลอย่างก้าวหน้า - ข้อมูลสำคัญอยู่ก่อน
- **ส่วนบทนำ**: เขียนใหม่เพื่ออธิบาย "เวทย์มนตร์ของ `azd up`" สำหรับผู้เริ่มต้นอย่างสมบูรณ์
- **ลบเนื้อหาซ้ำซ้อน**: กำจัดส่วนแก้ไขปัญหาซ้ำซ้อน
- **คำสั่งแก้ปัญหา**: แก้ไขการอ้างอิง `azd logs` ให้ใช้ `azd monitor --logs` ที่ถูกต้อง

#### แก้ไขแล้ว
- **🔐 คำสั่งการตรวจสอบสิทธิ์**: เพิ่ม `azd auth login` และ `azd auth logout` ใน cheat-sheet.md
- **การอ้างอิงคำสั่งไม่ถูกต้อง**: ลบ `azd logs` ที่เหลือในส่วนแก้ไขปัญหา README

#### หมายเหตุ
- **ขอบเขต**: การเปลี่ยนแปลงใช้กับ README.md หลักและ resources/cheat-sheet.md
- **กลุ่มเป้าหมาย**: การปรับปรุงเน้นที่นักพัฒนาที่เริ่มใช้ AZD

---

### [v3.10.0] - 2026-02-05

#### การอัปเดตความถูกต้องของคำสั่ง Azure Developer CLI
**เวอร์ชันนี้แก้ไขคำสั่ง AZD ที่ไม่มีอยู่ในเอกสารให้ถูกต้อง เพื่อให้ตัวอย่างโค้ดทั้งหมดใช้ไวยากรณ์ Azure Developer CLI ที่ถูกต้อง**

#### แก้ไขแล้ว
- **🔧 ลบคำสั่ง AZD ที่ไม่มีอยู่**: ตรวจสอบและแก้ไขคำสั่งที่ไม่ถูกต้องอย่างครอบคลุม:
  - `azd logs` (ไม่มีอยู่จริง) → แทนที่ด้วย `azd monitor --logs` หรือทางเลือก Azure CLI
  - คำสั่งย่อย `azd service` (ไม่มี) → แทนที่ด้วย `azd show` และ Azure CLI
  - `azd infra import/export/validate` (ไม่มี) → ลบหรือแทนที่ด้วยคำสั่งที่ถูกต้อง
  - ธง `azd deploy --rollback/--incremental/--parallel/--detect-changes` (ไม่มี) → ลบ
  - ธง `azd provision --what-if/--rollback` (ไม่มี) → อัปเดตใช้ `--preview`
  - `azd config validate` (ไม่มี) → แทนที่ด้วย `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ไม่มี) → ลบ

- **📚 ไฟล์ที่อัปเดตพร้อมการแก้ไขคำสั่ง**:
  - `resources/cheat-sheet.md`: ปรับปรุงแก้ไขคำสั่งรอบด้าน
  - `docs/deployment/deployment-guide.md`: แก้ไขยุทธศาสตร์การย้อนกลับและการปรับใช้
  - `docs/troubleshooting/debugging.md`: แก้ไขส่วนวิเคราะห์บันทึก
  - `docs/troubleshooting/common-issues.md`: อัปเดตคำสั่งแก้ไขปัญหา
  - `docs/troubleshooting/ai-troubleshooting.md`: แก้ไขส่วนดีบัก AZD
  - `docs/getting-started/azd-basics.md`: แก้ไขคำสั่งการตรวจสอบ
  - `docs/getting-started/first-project.md`: อัปเดตตัวอย่างการตรวจสอบและดีบัก
  - `docs/getting-started/installation.md`: แก้ไขตัวอย่างความช่วยเหลือและเวอร์ชัน
  - `docs/pre-deployment/application-insights.md`: แก้ไขคำสั่งดูบันทึก
  - `docs/pre-deployment/coordination-patterns.md`: แก้ไขคำสั่งดีบักตัวแทน

- **📝 อัปเดตการอ้างอิงเวอร์ชัน**: 
  - `docs/getting-started/installation.md`: เปลี่ยนเวอร์ชัน `1.5.0` ที่เขียนตายตัวเป็น `1.x.x` แบบทั่วไปพร้อมลิงก์ไปยังเวอร์ชันที่ปล่อย

#### เปลี่ยนแปลง
- **กลยุทธ์การย้อนกลับ**: อัปเดตเอกสารเพื่อใช้การย้อนกลับแบบ Git (AZD ไม่มีฟีเจอร์ย้อนกลับในตัว)
- **การดูบันทึก**: แทนที่การอ้างอิง `azd logs` ด้วย `azd monitor --logs`, `azd monitor --live` และคำสั่ง Azure CLI
- **ส่วนประสิทธิภาพ**: ลบแฟลกการปรับใช้แบบขนาน/เพิ่มทีละน้อยที่ไม่มีอยู่จริง และให้ทางเลือกที่ถูกต้อง

#### รายละเอียดทางเทคนิค
- **คำสั่ง AZD ที่ถูกต้อง**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **แฟลก azd monitor ที่ถูกต้อง**: `--live`, `--logs`, `--overview`
- **ฟีเจอร์ที่ถูกลบ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### หมายเหตุ
- **การตรวจสอบ**: คำสั่งที่ตรวจสอบแล้วกับ Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### อัปเดตความสมบูรณ์ของเวิร์กช็อปและคุณภาพเอกสาร
**เวอร์ชันนี้เสร็จสมบูรณ์โมดูลเวิร์กช็อปแบบโต้ตอบ แก้ไขลิงก์เอกสารที่เสียทั้งหมด และปรับปรุงคุณภาพเนื้อหาโดยรวมสำหรับนักพัฒนา AI ที่ใช้ Microsoft AZD**

#### เพิ่มเติม
- **📝 CONTRIBUTING.md**: เอกสารแนวทางการมีส่วนร่วมใหม่ที่มี:
  - คำแนะนำที่ชัดเจนสำหรับการรายงานปัญหาและเสนอการเปลี่ยนแปลง
  - มาตรฐานเอกสารสำหรับเนื้อหาใหม่
  - แนวทางตัวอย่างโค้ดและข้อกำหนดข้อความคอมมิต
  - ข้อมูลการมีส่วนร่วมของชุมชน

#### เสร็จสมบูรณ์
- **🎯 โมดูลเวิร์กช็อป 7 (สรุป)**: เสร็จสมบูรณ์โมดูลสรุปด้วย:
  - สรุปรายละเอียดความสำเร็จของเวิร์กช็อปอย่างครอบคลุม
  - ส่วนแนวคิดสำคัญที่เรียนรู้ครอบคลุม AZD, เทมเพลต และ Microsoft Foundry
  - คำแนะนำสำหรับการเรียนรู้ต่อเนื่อง
  - แบบฝึกหัดท้าทายในเวิร์กช็อปพร้อมคะแนนความยาก
  - ฟีดแบ็กชุมชนและลิงก์สนับสนุน

- **📚 โมดูลเวิร์กช็อป 3 (การแยกส่วน)**: อัปเดตวัตถุประสงค์การเรียนรู้ด้วย:
  - คำแนะนำการเปิดใช้งาน GitHub Copilot กับเซิร์ฟเวอร์ MCP
  - ความเข้าใจโครงสร้างโฟลเดอร์เทมเพลต AZD
  - รูปแบบการจัดการ Infrastructure-as-code (Bicep)
  - คำสั่งปฏิบัติในห้องปฏิบัติการ

- **🔧 โมดูลเวิร์กช็อป 6 (ล้างข้อมูล)**: เสร็จสมบูรณ์ด้วย:
  - วัตถุประสงค์การทำความสะอาดทรัพยากรและจัดการค่าใช้จ่าย
  - การใช้ `azd down` เพื่อถอนการติดตั้งโครงสร้างพื้นฐานอย่างปลอดภัย
  - คำแนะนำการกู้คืนบริการปัญญาประดิษฐ์ที่ถูกลบแบบนุ่มนวล
  - เควสต์เพิ่มเติมสำหรับการสำรวจ GitHub Copilot และ Azure Portal

#### แก้ไข
- **🔗 แก้ไขลิงก์เสีย**: แก้ไขลิงก์เอกสารภายในที่เสียกว่า 15 รายการ:
  - `docs/ai-foundry/ai-model-deployment.md`: แก้ไขเส้นทางไปยัง microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: แก้ไขเส้นทาง ai-model-deployment.md และ production-ai-practices.md
  - `docs/getting-started/first-project.md`: แทน cicd-integration.md ที่ไม่มีด้วย deployment-guide.md
  - `examples/retail-scenario.md`: แก้ไขเส้นทาง FAQ และคู่มือแก้ไขปัญหา
  - `examples/container-app/microservices/README.md`: แก้ไขเส้นทางหน้าแรกหลักสูตรและคู่มือการปรับใช้
  - `resources/faq.md` และ `resources/glossary.md`: อัปเดตการอ้างอิงบท AI
  - `course-outline.md`: แก้ไขคู่มือผู้สอนและการอ้างอิงแล็บเวิร์กช็อป AI

- **📅 แบนเนอร์สถานะเวิร์กช็อป**: อัปเดตจาก "กำลังสร้าง" เป็นสถานะเวิร์กช็อปที่เปิดใช้งานพร้อมวันที่กุมภาพันธ์ 2026

- **🔗 การนำทางเวิร์กช็อป**: แก้ไขลิงก์นำทางใน README.md ของเวิร์กช็อปที่ชี้ไปยังโฟลเดอร์ lab-1-azd-basics ที่ไม่มีอยู่จริง

#### เปลี่ยนแปลง
- **การนำเสนอเวิร์กช็อป**: เอาคำเตือน "กำลังสร้าง" ออก เวิร์กช็อปเสร็จสมบูรณ์พร้อมใช้แล้ว
- **ความสอดคล้องในการนำทาง**: ตรวจสอบว่าโมดูลเวิร์กช็อปทั้งหมดมีการนำทางระหว่างโมดูลที่เหมาะสม
- **การอ้างอิงเส้นทางการเรียนรู้**: อัปเดตการอ้างอิงบทเรียนเพื่อใช้เส้นทาง microsoft-foundry ที่ถูกต้อง

#### การตรวจสอบ
- ✅ ไฟล์ markdown ภาษาอังกฤษทั้งหมดมีลิงก์ภายในที่ถูกต้อง
- ✅ โมดูลเวิร์กช็อป 0-7 เสร็จสมบูรณ์พร้อมวัตถุประสงค์การเรียนรู้
- ✅ การนำทางระหว่างบทและโมดูลทำงานถูกต้อง
- ✅ เนื้อหาเหมาะสำหรับนักพัฒนา AI ที่ใช้ Microsoft AZD
- ✅ ใช้ภาษาที่เหมาะสำหรับผู้เริ่มต้นและโครงสร้างที่ดีตลอด
- ✅ CONTRIBUTING.md ให้คำแนะนำชัดเจนสำหรับผู้ร่วมชุมชน

#### การดำเนินการทางเทคนิค
- **การตรวจสอบลิงก์**: สคริปต์ PowerShell อัตโนมัติยืนยันลิงก์ภายใน .md ทั้งหมด
- **การตรวจสอบเนื้อหา**: การตรวจสอบด้วยตนเองความสมบูรณ์ของเวิร์กช็อปและความเหมาะสมสำหรับผู้เริ่มต้น
- **ระบบนำทาง**: ใช้รูปแบบการนำทางบทและโมดูลที่สอดคล้องกัน

#### หมายเหตุ
- **ขอบเขต**: การเปลี่ยนแปลงใช้กับเอกสารภาษาอังกฤษเท่านั้น
- **การแปล**: โฟลเดอร์แปลภาษาไม่มีการอัปเดตในเวอร์ชันนี้ (การแปลอัตโนมัติจะซิงค์ภายหลัง)
- **ระยะเวลาเวิร์กช็อป**: เวิร์กช็อปที่สมบูรณ์ตอนนี้ให้เวลาการเรียนรู้ปฏิบัติ 3-4 ชั่วโมง

---

### [v3.8.0] - 2025-11-19

#### เอกสารขั้นสูง: การตรวจสอบ ความปลอดภัย และรูปแบบผู้แทนหลายตัว
**เวอร์ชันนี้เพิ่มบทเรียนระดับ A ครบถ้วนเกี่ยวกับการรวม Application Insights รูปแบบการตรวจสอบสิทธิ์ และการประสานงานผู้แทนหลายตัวสำหรับการปรับใช้ในสภาพแวดล้อมจริง**

#### เพิ่มเติม
- **📊 บทเรียนการรวม Application Insights**: ใน `docs/pre-deployment/application-insights.md`:
  - การปรับใช้โฟกัส AZD พร้อมการจัดเตรียมอัตโนมัติ
  - เทมเพลต Bicep ครบถ้วนสำหรับ Application Insights + Log Analytics
  - แอป Python ที่ใช้งานได้พร้อมเทเลเมทรีส์แบบกำหนดเอง (มากกว่า 1,200 บรรทัด)
  - รูปแบบการตรวจสอบ AI/LLM (การติดตามโทเค็น/ค่าใช้จ่าย Microsoft Foundry Models)
  - แผนภาพ Mermaid 6 แผนภาพ (สถาปัตยกรรม, การติดตามแบบกระจาย, โฟลว์เทเลเมทรีส์)
  - 3 แบบฝึกหัดปฏิบัติ (การแจ้งเตือน, แดชบอร์ด, การตรวจสอบ AI)
  - ตัวอย่างการสืบค้น Kusto และกลยุทธ์การเพิ่มประสิทธิภาพค่าใช้จ่าย
  - การสตรีมเมตริกแบบเรียลไทม์และการดีบัก
  - เวลาเรียนรู้ 40-50 นาทีพร้อมรูปแบบที่พร้อมสำหรับการผลิต

- **🔐 บทเรียนรูปแบบการตรวจสอบสิทธิ์และความปลอดภัย**: ใน `docs/getting-started/authsecurity.md`:
  - รูปแบบการตรวจสอบสิทธิ์ 3 แบบ (สายการเชื่อมต่อ, Key Vault, managed identity)
  - เทมเพลตโครงสร้างพื้นฐาน Bicep ครบถ้วนสำหรับการปรับใช้อย่างปลอดภัย
  - โค้ดแอป Node.js พร้อมการบูรณาการ Azure SDK
  - แบบฝึกหัดครบถ้วน 3 ชุด (เปิดใช้งาน managed identity, user-assigned identity, การหมุน Key Vault)
  - แนวทางปฏิบัติด้านความปลอดภัยและการกำหนดค่า RBAC
  - คู่มือการแก้ไขปัญหาและวิเคราะห์ค่าใช้จ่าย
  - รูปแบบการตรวจสอบแบบไม่ใช้รหัสผ่านที่พร้อมใช้งานในสภาพแวดล้อมจริง

- **🤖 บทเรียนรูปแบบการประสานงานผู้แทนหลายตัว**: ใน `docs/pre-deployment/coordination-patterns.md`:
  - รูปแบบการประสานงาน 5 แบบ (เรียงลำดับ, ขนาน, ตามลำดับชั้น, ขับเคลื่อนด้วยเหตุการณ์, ฉันทามติ)
  - การดำเนินการบริการออร์เคสเตรเตอร์ครบถ้วน (Python/Flask, มากกว่า 1,500 บรรทัด)
  - การดำเนินการตัวแทนเฉพาะทาง 3 ตัว (Research, Writer, Editor)
  - การรวม Service Bus สำหรับคิวข้อความ
  - การจัดการสถานะ Cosmos DB สำหรับระบบกระจาย
  - แผนภาพ Mermaid 6 แผนภาพแสดงปฏิสัมพันธ์ผู้แทน
  - 3 แบบฝึกหัดขั้นสูง (การจัดการ timeout, การลองใหม่, ตัวตัดวงจร)
  - การแยกรายจ่าย ($240-565/เดือน) พร้อมกลยุทธ์การเพิ่มประสิทธิภาพ
  - การรวม Application Insights สำหรับการตรวจสอบ

#### ปรับปรุง
- **บทก่อนการปรับใช้**: ตอนนี้รวมรูปแบบการตรวจสอบและการประสานงานอย่างครอบคลุม
- **บทเริ่มต้นใช้งาน**: ปรับปรุงด้วยรูปแบบการตรวจสอบสิทธิ์ระดับมืออาชีพ
- **ความพร้อมสำหรับการผลิต**: ครอบคลุมครบตั้งแต่ความปลอดภัยถึงการสังเกตการณ์
- **โครงร่างหลักสูตร**: อัปเดตการอ้างอิงบทเรียนใหม่ในบทที่ 3 และ 6

#### เปลี่ยนแปลง
- **ความก้าวหน้าในการเรียนรู้**: การผสานกลยุทธ์ความปลอดภัยและการตรวจสอบที่ดีขึ้นตลอดหลักสูตร
- **คุณภาพเอกสาร**: มาตรฐานระดับ A อย่างต่อเนื่อง (95-97%) ในบทเรียนใหม่
- **รูปแบบผลิต**: ครอบคลุมครบวงจรสำหรับการปรับใช้ในองค์กร

#### ปรับปรุง
- **ประสบการณ์นักพัฒนา**: เส้นทางที่ชัดเจนจากการพัฒนาไปยังการตรวจสอบในสภาพแวดล้อมจริง
- **มาตรฐานความปลอดภัย**: รูปแบบมืออาชีพสำหรับการตรวจสอบสิทธิ์และการจัดการความลับ
- **การสังเกตการณ์**: การรวม Application Insights ครบถ้วนกับ AZD
- **งาน AI**: การตรวจสอบเฉพาะทางสำหรับ Microsoft Foundry Models และระบบผู้แทนหลายตัว

#### ตรวจสอบแล้ว
- ✅ บทเรียนทั้งหมดรวมโค้ดที่ทำงานได้ครบถ้วน (ไม่ใช่เพียงโค้ดย่อ)
- ✅ แผนภาพ Mermaid สำหรับการเรียนรู้ด้วยภาพ (19 แผนภาพรวม 3 บทเรียน)
- ✅ แบบฝึกหัดปฏิบัติพร้อมขั้นตอนยืนยัน (9 ชุด)
- ✅ เทมเพลต Bicep พร้อมสำหรับการผลิต สามารถปรับใช้ผ่าน `azd up`
- ✅ การวิเคราะห์ค่าใช้จ่ายและกลยุทธ์เพิ่มประสิทธิภาพ
- ✅ คู่มือแก้ไขปัญหาและแนวทางปฏิบัติที่ดีที่สุด
- ✅ จุดตรวจสอบความรู้พร้อมคำสั่งยืนยัน

#### ผลลัพธ์การให้คะแนนเอกสาร
- **docs/pre-deployment/application-insights.md**: - คู่มือการตรวจสอบครบถ้วน
- **docs/getting-started/authsecurity.md**: - รูปแบบความปลอดภัยระดับมืออาชีพ
- **docs/pre-deployment/coordination-patterns.md**: - สถาปัตยกรรมผู้แทนหลายตัวขั้นสูง
- **เนื้อหาใหม่โดยรวม**: - มาตรฐานคุณภาพสูงอย่างต่อเนื่อง

#### การดำเนินการทางเทคนิค
- **Application Insights**: Log Analytics + เทเลเมทรีส์แบบกำหนดเอง + การติดตามแบบกระจาย
- **การตรวจสอบสิทธิ์**: Managed Identity + Key Vault + รูปแบบ RBAC
- **ผู้แทนหลายตัว**: Service Bus + Cosmos DB + Container Apps + ออร์เคสเตรชัน
- **การตรวจสอบ**: เมตริกสด + การสืบค้น Kusto + การแจ้งเตือน + แดชบอร์ด
- **การจัดการค่าใช้จ่าย**: กลยุทธ์การสุ่มตัวอย่าง, นโยบายการเก็บรักษา, การควบคุมงบประมาณ

### [v3.7.0] - 2025-11-19

#### การปรับปรุงคุณภาพเอกสารและตัวอย่าง Microsoft Foundry Models ใหม่
**เวอร์ชันนี้ปรับปรุงคุณภาพเอกสารทั่วทั้งที่เก็บ และเพิ่มตัวอย่างการปรับใช้ Microsoft Foundry Models เบ็ดเสร็จพร้อมอินเทอร์เฟซสนทนา gpt-4.1**

#### เพิ่มเติม
- **🤖 ตัวอย่างแชท Microsoft Foundry Models**: การปรับใช้ gpt-4.1 ครบถ้วนพร้อมการดำเนินการใน `examples/azure-openai-chat/`:
  - โครงสร้างพื้นฐาน Microsoft Foundry Models ครบถ้วน (การปรับใช้โมเดล gpt-4.1)
  - อินเทอร์เฟซแชทบรรทัดคำสั่ง Python พร้อมประวัติการสนทนา
  - การรวม Key Vault เพื่อจัดเก็บคีย์ API อย่างปลอดภัย
  - การติดตามการใช้โทเค็นและการประเมินค่าใช้จ่าย
  - การจำกัดอัตราและการจัดการข้อผิดพลาด
  - README ครอบคลุมพร้อมคู่มือการปรับใช้ 35-45 นาที
  - ไฟล์พร้อมใช้งานในสภาพแวดล้อมจริงจำนวน 11 ไฟล์ (เทมเพลต Bicep, แอป Python, การกำหนดค่า)
- **📚 แบบฝึกหัดเอกสาร**: เพิ่มแบบฝึกหัดปฏิบัติในคู่มือการกำหนดค่า:
  - แบบฝึกหัด 1: การกำหนดค่าหลายสภาพแวดล้อม (15 นาที)
  - แบบฝึกหัด 2: การฝึกจัดการความลับ (10 นาที)
  - เกณฑ์ความสำเร็จและขั้นตอนยืนยันที่ชัดเจน
- **✅ การตรวจสอบการปรับใช้**: เพิ่มส่วนตรวจสอบในคู่มือการปรับใช้:
  - ขั้นตอนการตรวจสอบสุขภาพ
  - รายการเกณฑ์ความสำเร็จ
  - ผลลัพธ์ที่คาดหวังสำหรับคำสั่งปรับใช้ทั้งหมด
  - การอ้างอิงการแก้ไขปัญหาอย่างรวดเร็ว

#### ปรับปรุง
- **examples/README.md**: ปรับปรุงเป็นคุณภาพระดับ A (93%):
  - เพิ่ม azure-openai-chat ในส่วนที่เกี่ยวข้องทั้งหมด
  - อัปเดตจำนวนตัวอย่างท้องถิ่นจาก 3 เป็น 4
  - เพิ่มในตารางตัวอย่างแอป AI
  - รวมเข้ากับ Quick Start สำหรับผู้ใช้ระดับกลาง
  - เพิ่มในส่วนเทมเพลต Microsoft Foundry
  - อัปเดตแมทริกซ์เปรียบเทียบและส่วนการค้นพบเทคโนโลยี
- **คุณภาพเอกสาร**: ปรับปรุงจาก B+ (87%) → A- (92%) ในโฟลเดอร์ docs:
  - เพิ่มผลลัพธ์ที่คาดหวังในตัวอย่างคำสั่งสำคัญ
  - รวมขั้นตอนยืนยันสำหรับการเปลี่ยนแปลงการกำหนดค่า
  - ปรับปรุงการเรียนรู้ปฏิบัติด้วยแบบฝึกหัดที่ใช้ได้จริง

#### เปลี่ยนแปลง
- **ความก้าวหน้าในการเรียนรู้**: การผสานตัวอย่าง AI สำหรับผู้เรียนระดับกลางที่ดีขึ้น
- **โครงสร้างเอกสาร**: แบบฝึกหัดที่ทำได้จริงมากขึ้นพร้อมผลลัพธ์ที่ชัดเจน
- **กระบวนการตรวจสอบ**: เพิ่มเกณฑ์ความสำเร็จให้ชัดเจนในเวิร์กโฟลว์สำคัญ

#### ปรับปรุง
- **ประสบการณ์นักพัฒนา**: การปรับใช้ Microsoft Foundry Models ใช้เวลา 35-45 นาที (เทียบกับ 60-90 นาทีสำหรับตัวเลือกที่ซับซ้อน)
- **ความโปร่งใสของค่าใช้จ่าย**: การประเมินค่าใช้จ่ายที่ชัดเจน ($50-200/เดือน) สำหรับตัวอย่าง Microsoft Foundry Models
- **เส้นทางการเรียนรู้**: นักพัฒนา AI มีจุดเริ่มต้นที่ชัดเจนกับ azure-openai-chat
- **มาตรฐานเอกสาร**: ผลลัพธ์ที่คาดหวังและขั้นตอนตรวจสอบที่สอดคล้องกัน

#### ตรวจสอบแล้ว
- ✅ ตัวอย่าง Microsoft Foundry Models ทำงานได้สมบูรณ์ด้วย `azd up`
- ✅ ไฟล์การดำเนินการทั้ง 11 ไฟล์ถูกต้องทางไวยากรณ์
- ✅ คำแนะนำใน README ตรงกับประสบการณ์การปรับใช้จริง
- ✅ ลิงก์เอกสารอัปเดตในกว่า 8 แห่ง
- ✅ ดัชนีตัวอย่างสะท้อนตัวอย่างท้องถิ่น 4 รายการอย่างถูกต้อง
- ✅ ไม่มีลิงก์ภายนอกซ้ำซ้อนในตาราง
- ✅ การอ้างอิงการนำทางทั้งหมดถูกต้อง

#### การดำเนินการทางเทคนิค
- **สถาปัตยกรรม Microsoft Foundry Models**: gpt-4.1 + Key Vault + รูปแบบ Container Apps
- **ความปลอดภัย**: พร้อม Managed Identity, เก็บความลับใน Key Vault
- **การตรวจสอบ**: การรวม Application Insights
- **การจัดการค่าใช้จ่าย**: การติดตามโทเค็นและการเพิ่มประสิทธิภาพการใช้งาน
- **การปรับใช้**: คำสั่ง `azd up` เดียวสำหรับการตั้งค่าครบถ้วน

### [v3.6.0] - 2025-11-19

#### การอัปเดตใหญ่: ตัวอย่างการปรับใช้ Container App
**เวอร์ชันนี้แนะนำตัวอย่างการปรับใช้แอปคอนเทนเนอร์ที่พร้อมสำหรับการผลิตอย่างครบถ้วนโดยใช้ Azure Developer CLI (AZD) พร้อมเอกสารครบถ้วนและผนวกเข้าเส้นทางการเรียนรู้**

#### เพิ่มเติม
- **🚀 ตัวอย่าง Container App**: ตัวอย่างท้องถิ่นใหม่ใน `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): ภาพรวมครบถ้วนของการปรับใช้คอนเทนเนอร์, เริ่มต้นอย่างรวดเร็ว, ผลิตภัณฑ์, และรูปแบบขั้นสูง
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API ที่เหมาะสำหรับผู้เริ่มต้น พร้อมฟีเจอร์ scale-to-zero, ตรวจสอบสุขภาพ, การตรวจสอบ และการแก้ไขปัญหา
  - [Microservices Architecture](../../examples/container-app/microservices): การปรับใช้หลายบริการพร้อมใช้งานจริง (API Gateway, Product, Order, User, Notification), การส่งข้อความแบบอะซิงค์, Service Bus, Cosmos DB, Azure SQL, การสืบสวนแบบกระจาย, การปรับใช้แบบ blue-green/canary
- **Best Practices**: ความปลอดภัย, การตรวจสอบ, การเพิ่มประสิทธิภาพต้นทุน, และคำแนะนำ CI/CD สำหรับภาระงานคอนเทนเนอร์
- **Code Samples**: ตัวอย่าง `azure.yaml` แบบครบถ้วน, เทมเพลต Bicep, และการดำเนินการบริการหลายภาษา (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: สถานการณ์ทดสอบแบบปลายถึงปลาย, คำสั่งตรวจสอบ, คำแนะนำการแก้ไขปัญหา

#### Changed
- **README.md**: อัปเดตเพื่อแสดงฟีเจอร์และลิงก์ตัวอย่างแอปคอนเทนเนอร์ใหม่ภายใต้ "Local Examples - Container Applications"
- **examples/README.md**: อัปเดตเพื่อเน้นตัวอย่างแอปคอนเทนเนอร์, เพิ่มรายการในเมทริกซ์เปรียบเทียบ, และอัปเดตการอ้างอิงเทคโนโลยี/สถาปัตยกรรม
- **Course Outline & Study Guide**: อัปเดตเพื่ออ้างอิงตัวอย่างแอปคอนเทนเนอร์และรูปแบบการปรับใช้ในบทที่เกี่ยวข้อง

#### Validated
- ✅ ตัวอย่างใหม่ทั้งหมดสามารถปรับใช้ด้วย `azd up` และปฏิบัติตามแนวทางที่ดีที่สุด
- ✅ การเชื่อมโยงข้ามและการนำทางในเอกสารได้รับการอัปเดต
- ✅ ตัวอย่างครอบคลุมตั้งแต่สถานการณ์สำหรับผู้เริ่มต้นจนถึงขั้นสูง รวมถึงไมโครเซอร์วิสในผลิตภัณฑ์

#### Notes
- **Scope**: เอกสารและตัวอย่างภาษาอังกฤษเท่านั้น
- **Next Steps**: ขยายด้วยรูปแบบคอนเทนเนอร์ขั้นสูงเพิ่มเติมและการทำงานอัตโนมัติ CI/CD ในการเปิดตัวในอนาคต

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**เวอร์ชันนี้ดำเนินการเปลี่ยนชื่อผลิตภัณฑ์อย่างครอบคลุมจาก "Microsoft Foundry" เป็น "Microsoft Foundry" ทั่วทั้งเอกสารภาษาอังกฤษ เพื่อสะท้อนการเปลี่ยนแบรนด์อย่างเป็นทางการของ Microsoft**

#### Changed
- **🔄 Product Name Update**: เปลี่ยนแบรนด์อย่างครบถ้วนจาก "Microsoft Foundry" เป็น "Microsoft Foundry"
  - อัปเดตการอ้างอิงทั้งหมดในเอกสารภาษาอังกฤษในโฟลเดอร์ `docs/`
  - เปลี่ยนชื่อโฟลเดอร์: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - เปลี่ยนชื่อไฟล์: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - รวมทั้งหมด: อัปเดตการอ้างอิงในเนื้อหา 23 รายการใน 7 ไฟล์เอกสาร

- **📁 Folder Structure Changes**:
  - เปลี่ยนชื่อ `docs/ai-foundry/` เป็น `docs/microsoft-foundry/`
  - อัปเดตการอ้างอิงข้ามทั้งหมดเพื่อสะท้อนโครงสร้างโฟลเดอร์ใหม่
  - ตรวจสอบความถูกต้องของลิงก์นำทางทั่วทั้งเอกสาร

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - อัปเดตลิงก์ภายในทั้งหมดเพื่ออ้างถึงชื่อไฟล์ใหม่

#### Updated Files
- **Chapter Documentation** (7 ไฟล์):
  - `docs/microsoft-foundry/ai-model-deployment.md` - อัปเดตลิงก์นำทาง 3 รายการ
  - `docs/microsoft-foundry/ai-workshop-lab.md` - อัปเดตการอ้างอิงชื่อผลิตภัณฑ์ 4 รายการ
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ใช้ Microsoft Foundry แล้ว (จากการอัปเดตก่อนหน้า)
  - `docs/microsoft-foundry/production-ai-practices.md` - อัปเดตการอ้างอิง 3 รายการ (ภาพรวม, ข้อเสนอแนะชุมชน, เอกสาร)
  - `docs/getting-started/azd-basics.md` - อัปเดตลิงก์เชื่อมโยงข้าม 4 รายการ
  - `docs/getting-started/first-project.md` - อัปเดตลิงก์นำทางบท 2 รายการ
  - `docs/getting-started/installation.md` - อัปเดตลิงก์บทถัดไป 2 รายการ
  - `docs/troubleshooting/ai-troubleshooting.md` - อัปเดตการอ้างอิง 3 รายการ (การนำทาง, ชุมชน Discord)
  - `docs/troubleshooting/common-issues.md` - อัปเดตลิงก์นำทาง 1 รายการ
  - `docs/troubleshooting/debugging.md` - อัปเดตลิงก์นำทาง 1 รายการ

- **Course Structure Files** (2 ไฟล์):
  - `README.md` - อัปเดตการอ้างอิง 17 รายการ (ภาพรวมหลักสูตร, ชื่อบท, ส่วนเทมเพลต, ข้อมูลจากชุมชน)
  - `course-outline.md` - อัปเดตการอ้างอิง 14 รายการ (ภาพรวม, วัตถุประสงค์การเรียนรู้, ทรัพยากรบทเรียน)

#### Validated
- ✅ ไม่มีการอ้างอิงโฟลเดอร์ "ai-foundry" เหลือในเอกสารภาษาอังกฤษ
- ✅ ไม่มีการอ้างอิงชื่อผลิตภัณฑ์ "Microsoft Foundry" เหลือในเอกสารภาษาอังกฤษ
- ✅ ลิงก์นำทางทั้งหมดทำงานได้ด้วยโครงสร้างโฟลเดอร์ใหม่
- ✅ การเปลี่ยนชื่อไฟล์และโฟลเดอร์เสร็จสมบูรณ์
- ✅ ตรวจสอบความถูกต้องของการเชื่อมโยงข้ามระหว่างบท

#### Notes
- **Scope**: การเปลี่ยนแปลงนี้ใช้กับเอกสารภาษาอังกฤษในโฟลเดอร์ `docs/` เท่านั้น
- **Translations**: โฟลเดอร์แปลภาษา (`translations/`) ยังไม่อัปเดตในเวอร์ชันนี้
- **Workshop**: ชุดวัสดุเวิร์กช็อป (`workshop/`) ยังไม่อัปเดตในเวอร์ชันนี้
- **Examples**: ไฟล์ตัวอย่างยังอาจอ้างอิงชื่อเก่า (ซึ่งจะได้รับการแก้ไขในการอัปเดตอนาคต)
- **External Links**: ลิงก์ภายนอกและการอ้างอิงที่เก็บ GitHub ยังคงเหมือนเดิม

#### Migration Guide for Contributors
หากคุณมีสาขาในเครื่องหรือเอกสารที่อ้างอิงโครงสร้างเก่า:
1. อัปเดตการอ้างอิงโฟลเดอร์: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. อัปเดตการอ้างอิงไฟล์: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. แทนที่ชื่อผลิตภัณฑ์: "Microsoft Foundry" → "Microsoft Foundry"
4. ตรวจสอบให้แน่ใจว่าลิงก์ภายในเอกสารทั้งหมดยังทำงานได้

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**เวอร์ชันนี้แนะนำการสนับสนุนอย่างครอบคลุมสำหรับฟีเจอร์พรีวิวใหม่ของ Azure Developer CLI และปรับปรุงประสบการณ์ผู้ใช้เวิร์กช็อป**

#### Added
- **🧪 azd provision --preview Feature Documentation**: ครอบคลุมฟีเจอร์พรีวิวโครงสร้างพื้นฐานใหม่อย่างครบถ้วน
  - อ้างอิงคำสั่งและตัวอย่างการใช้งานในชีทช่วยจำ
  - การผนวกรวมอย่างละเอียดในคู่มือการจัดเตรียมพร้อมกรณีการใช้งานและประโยชน์
  - การผนวกรวมการตรวจสอบก่อนบินเพื่อการตรวจสอบการปรับใช้ที่ปลอดภัยยิ่งขึ้น
  - อัปเดตคู่มือเริ่มต้นด้วยแนวทางการปรับใช้ที่ปลอดภัยเป็นอันดับแรก
- **🚧 Workshop Status Banner**: แบนเนอร์ HTML มืออาชีพแสดงสถานะการพัฒนาเวิร์กช็อป
  - การออกแบบแบบไล่ระดับสีพร้อมสัญลักษณ์การก่อสร้างเพื่อการสื่อสารที่ชัดเจน
  - ตราประทับเวลาการอัปเดตล่าสุดเพื่อความโปร่งใส
  - การออกแบบตอบสนองสำหรับมือถือทุกประเภทอุปกรณ์

#### Enhanced
- **Infrastructure Safety**: การทำงานพรีวิวผนวกรวมในเอกสารการปรับใช้ทั้งหมด
- **Pre-deployment Validation**: สคริปต์อัตโนมัติรวมการทดสอบพรีวิวโครงสร้างพื้นฐาน
- **Developer Workflow**: ลำดับคำสั่งอัปเดตให้รวมพรีวิวเป็นแนวทางปฏิบัติที่ดีที่สุด
- **Workshop Experience**: กำหนดความคาดหวังที่ชัดเจนสำหรับผู้ใช้เกี่ยวกับสถานะการพัฒนาเนื้อหา

#### Changed
- **Deployment Best Practices**: ลำดับการทำงานแบบพรีวิว-เฟิร์สแนะนำให้ใช้ตอนนี้
- **Documentation Flow**: การย้ายการตรวจสอบความถูกต้องของโครงสร้างพื้นฐานให้มาอยู่ในขั้นตอนต้นของกระบวนการเรียนรู้
- **Workshop Presentation**: การสื่อสารสถานะระดับมืออาชีพพร้อมกับเวลาการพัฒนาที่ชัดเจน

#### Improved
- **Safety-First Approach**: การเปลี่ยนแปลงโครงสร้างพื้นฐานสามารถตรวจสอบล่วงหน้าก่อนได้ปรับใช้
- **Team Collaboration**: ผลลัพธ์พรีวิวสามารถแชร์เพื่อทบทวนและอนุมัติได้
- **Cost Awareness**: เข้าใจต้นทุนทรัพยากรดีก่อนดำเนินการจัดเตรียม
- **Risk Mitigation**: ลดความล้มเหลวในการปรับใช้ผ่านการตรวจสอบล่วงหน้า

#### Technical Implementation
- **Multi-document Integration**: ฟีเจอร์พรีวิวอธิบายไว้ใน 4 ไฟล์สำคัญ
- **Command Patterns**: ไวยากรณ์และตัวอย่างสม่ำเสมอทั่วทั้งเอกสาร
- **Best Practice Integration**: รวมพรีวิวในเวิร์กโฟลว์และสคริปต์ตรวจสอบ
- **Visual Indicators**: เครื่องหมายฟีเจอร์ใหม่ชัดเจนสำหรับการค้นพบ

#### Workshop Infrastructure
- **Status Communication**: แบนเนอร์ HTML มืออาชีพกับการจัดวางไล่ระดับสี
- **User Experience**: การแจ้งสถานะการพัฒนาชัดเจนป้องกันความสับสน
- **Professional Presentation**: รักษาความน่าเชื่อถือของที่เก็บพร้อมตั้งความคาดหวัง
- **Timeline Transparency**: ตราประทับเวลาการอัปเดตล่าสุดเดือนตุลาคม 2025 เพื่อความรับผิดชอบ

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**เวอร์ชันนี้แนะนำวัสดุเวิร์กช็อปที่ครอบคลุมพร้อมไกด์การเรียนรู้เชิงโต้ตอบบนเบราว์เซอร์และเส้นทางการเรียนรู้ที่มีโครงสร้าง**

#### Added
- **🎥 Interactive Workshop Guide**: ประสบการณ์เวิร์กช็อปบนเบราว์เซอร์พร้อมความสามารถพรีวิว MkDocs
- **📝 Structured Workshop Instructions**: เส้นทางการเรียนรู้ไกด์ 7 ขั้นตอนตั้งแต่การค้นพบจนถึงการปรับแต่ง
  - 0-Introduction: ภาพรวมเวิร์กช็อปและการตั้งค่า
  - 1-Select-AI-Template: การค้นหาและกระบวนการเลือกเทมเพลต
  - 2-Validate-AI-Template: การปรับใช้และกระบวนการตรวจสอบ
  - 3-Deconstruct-AI-Template: การทำความเข้าใจสถาปัตยกรรมเทมเพลต
  - 4-Configure-AI-Template: การกำหนดค่าและการปรับแต่ง
  - 5-Customize-AI-Template: การแก้ไขขั้นสูงและการวนซ้ำ
  - 6-Teardown-Infrastructure: การทำความสะอาดและการจัดการทรัพยากร
  - 7-Wrap-up: สรุปและขั้นตอนต่อไป
- **🛠️ Workshop Tooling**: การตั้งค่า MkDocs พร้อมธีม Material เพื่อประสบการณ์การเรียนรู้ที่ดีขึ้น
- **🎯 Hands-On Learning Path**: วิธีการ 3 ขั้นตอน (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: การตั้งค่าสภาพแวดล้อมการพัฒนาอย่างราบรื่น

#### Enhanced
- **AI Workshop Lab**: ขยายด้วยประสบการณ์การเรียนรู้แบบมีโครงสร้าง 2-3 ชั่วโมงอย่างครบถ้วน
- **Workshop Documentation**: การนำเสนออย่างมืออาชีพพร้อมการนำทางและสื่อประกอบ
- **Learning Progression**: คู่มือทีละขั้นตอนชัดเจนตั้งแต่การเลือกเทมเพลตถึงการปรับใช้ในผลิตภัณฑ์
- **Developer Experience**: เครื่องมือที่ผนวกรวมสำหรับเวิร์กโฟลว์การพัฒนาที่ราบรื่น

#### Improved
- **Accessibility**: อินเตอร์เฟซบนเบราว์เซอร์พร้อมการค้นหา, ฟังก์ชันคัดลอก, และสลับธีม
- **Self-Paced Learning**: โครงสร้างเวิร์กช็อปยืดหยุ่นรองรับความเร็วการเรียนรู้ต่าง ๆ
- **Practical Application**: สถานการณ์การปรับใช้เทมเพลต AI ในโลกจริง
- **Community Integration**: การผนวกรวม Discord สำหรับการสนับสนุนและความร่วมมือในเวิร์กช็อป

#### Workshop Features
- **Built-in Search**: ค้นหาคีย์เวิร์ดและบทเรียนอย่างรวดเร็ว
- **Copy Code Blocks**: ฟังก์ชันเลื่อนเม้าส์เพื่อคัดลอกสำหรับตัวอย่างโค้ดทั้งหมด
- **Theme Toggle**: รองรับโหมดมืด/สว่างสำหรับความชอบที่ต่างกัน
- **Visual Assets**: ภาพหน้าจอและแผนภาพเพื่อความเข้าใจที่ดีขึ้น
- **Help Integration**: เข้าถึง Discord สำหรับการสนับสนุนชุมชนโดยตรง

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**เวอร์ชันนี้แนะนำโครงสร้างการเรียนรู้แบบบทเรียนที่ครอบคลุมพร้อมการปรับโครงสร้างการนำทางทั่วทั้งที่เก็บเอกสาร**

#### Added
- **📚 Chapter-Based Learning System**: การจัดโครงสร้างหลักสูตรใหม่เป็น 8 บทเรียนที่ก้าวหน้า
  - บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว (⭐ - 30-45 นาที)
  - บทที่ 2: การพัฒนา AI-First (⭐⭐ - 1-2 ชั่วโมง)
  - บทที่ 3: การกำหนดค่า & การยืนยันตัวตน (⭐⭐ - 45-60 นาที)
  - บทที่ 4: โครงสร้างพื้นฐานเป็นโค้ด & การปรับใช้ (⭐⭐⭐ - 1-1.5 ชั่วโมง)
  - บทที่ 5: โซลูชัน AI หลายตัวแทน (⭐⭐⭐⭐ - 2-3 ชั่วโมง)
  - บทที่ 6: การตรวจสอบและวางแผนก่อนปรับใช้ (⭐⭐ - 1 ชั่วโมง)
  - บทที่ 7: การแก้ไขปัญหา & การดีบัก (⭐⭐ - 1-1.5 ชั่วโมง)
  - บทที่ 8: รูปแบบการผลิต & องค์กร (⭐⭐⭐⭐ - 2-3 ชั่วโมง)
- **📚 Comprehensive Navigation System**: หัวข้อและท้ายหน้าการนำทางที่สม่ำเสมอทั่วทั้งเอกสาร
- **🎯 Progress Tracking**: ระบบตรวจสอบการเสร็จสิ้นหลักสูตรและการยืนยันการเรียนรู้
- **🗺️ Learning Path Guidance**: จุดเข้าชัดเจนสำหรับระดับประสบการณ์และเป้าหมายต่าง ๆ
- **🔗 Cross-Reference Navigation**: การเชื่อมโยงบทที่เกี่ยวข้องและข้อกำหนดล่วงหน้าอย่างชัดเจน

#### Enhanced
- **README Structure**: เปลี่ยนเป็นแพลตฟอร์มการเรียนรู้ที่มีโครงสร้างแบบบทเรียน
- **Documentation Navigation**: ทุกหน้ารวมบริบทบทเรียนและคำแนะนำความก้าวหน้า
- **Template Organization**: ตัวอย่างและเทมเพลตแมปไปยังบทเรียนที่เหมาะสม
- **Resource Integration**: เชื่อมโยงชีทช่วยจำ, คำถามที่พบบ่อย, และคู่มือการศึกษาเข้ากับบทที่เกี่ยวข้อง
- **Workshop Integration**: ห้องปฏิบัติการแบบลงมือทำแมปสู่เป้าหมายการเรียนรู้หลายบท

#### Changed
- **Learning Progression**: ย้ายจากเอกสารเชิงเส้นไปสู่การเรียนรู้แบบบทเรียนที่ยืดหยุ่น
- **Configuration Placement**: ย้ายคู่มือกำหนดค่าเป็นบทที่ 3 เพื่อการไหลของการเรียนรู้ที่ดีขึ้น
- **AI Content Integration**: ผนวกเนื้อหาเฉพาะ AI ให้ดีขึ้นตลอดเส้นทางการเรียนรู้
- **Production Content**: รูปแบบขั้นสูงรวบรวมในบทที่ 8 สำหรับผู้เรียนระดับองค์กร

#### Improved
- **User Experience**: เส้นทางนำทางและตัวชี้วัดความก้าวหน้าบทที่ชัดเจน
- **Accessibility**: แบบแผนการนำทางสม่ำเสมอ ง่ายต่อการใช้หลักสูตร
- **Professional Presentation**: โครงสร้างหลักสูตรสไตล์มหาวิทยาลัย เหมาะสำหรับการฝึกอบรมทางวิชาการและองค์กร
- **Learning Efficiency**: ลดเวลาค้นหาเนื้อหาที่เกี่ยวข้องด้วยการจัดองค์กรที่ดีขึ้น

#### Technical Implementation
- **Navigation Headers**: มาตรฐานการนำทางบทเรียนในเอกสารกว่า 40 ไฟล์
- **Footer Navigation**: คำแนะนำความก้าวหน้าและตัวชี้วัดการเสร็จสิ้นบทเรียนสม่ำเสมอ
- **Cross-Linking**: ระบบเชื่อมโยงภายในครบถ้วนเชื่อมโยงแนวคิดที่เกี่ยวข้อง
- **Chapter Mapping**: เทมเพลตและตัวอย่างสัมพันธ์กับวัตถุประสงค์การเรียนรู้อย่างชัดเจน

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: ปรับโครงสร้างคู่มือการศึกษาตามระบบ 8 บท
- **🎯 Chapter-Based Assessment**: แต่ละบทประกอบด้วยวัตถุประสงค์การเรียนรู้และแบบฝึกหัดปฏิบัติ
- **📋 Progress Tracking**: ตารางเรียนรายสัปดาห์พร้อมผลลัพธ์ที่วัดได้และรายการตรวจสอบการเสร็จสิ้น
- **❓ Assessment Questions**: คำถามตรวจสอบความรู้สำหรับแต่ละบทพร้อมผลลัพธ์ทางวิชาชีพ
- **🛠️ Practical Exercises**: กิจกรรมลงมือทำพร้อมสถานการณ์จริงของการปรับใช้และการแก้ไขปัญหา
- **📊 Skill Progression**: ความก้าวหน้าชัดเจนจากแนวคิดพื้นฐานถึงรูปแบบองค์กรพร้อมโฟกัสพัฒนาการอาชีพ
- **🎓 Certification Framework**: ผลลัพธ์การพัฒนาวิชาชีพและระบบการรับรองชุมชน
- **⏱️ Timeline Management**: แผนการเรียนรู้ 10 สัปดาห์แบบมีโครงสร้างพร้อมการตรวจสอบขั้นตอนสำคัญ

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**เวอร์ชันนี้ปรับปรุงโซลูชันขายปลีกหลายตัวแทนด้วยการตั้งชื่อเอเย่นต์ที่ดีกว่าและเอกสารที่ปรับปรุง**

#### Changed
- **คำศัพท์ผู้แทนหลายตัวแทน**: แทนที่ "Cora agent" ด้วย "Customer agent" ในโซลูชันผู้แทนหลายตัวแทนสำหรับค้าปลีกทั่วทั้งระบบเพื่อความเข้าใจที่ชัดเจนขึ้น
- **สถาปัตยกรรมผู้แทน**: อัปเดตเอกสารทั้งหมด, แม่แบบ ARM และตัวอย่างโค้ดให้ใช้ชื่อ "Customer agent" อย่างสม่ำเสมอ
- **ตัวอย่างการตั้งค่า**: ปรับปรุงรูปแบบการตั้งค่าผู้แทนพร้อมการตั้งชื่อที่ทันสมัย
- **ความสอดคล้องของเอกสาร**: รับรองว่าการอ้างอิงทั้งหมดใช้ชื่อผู้แทนที่มืออาชีพและบรรยายชัดเจน

#### ปรับปรุง
- **แพ็กเกจแม่แบบ ARM**: อัปเดตร้านค้าปลีก-multiagent-arm-template ด้วยการอ้างอิง Customer agent
- **แผนผังสถาปัตยกรรม**: รีเฟรชแผนผัง Mermaid ด้วยการตั้งชื่อผู้แทนอัปเดต
- **ตัวอย่างโค้ด**: คลาส Python และตัวอย่างการใช้งานตอนนี้ใช้ชื่อ CustomerAgent
- **ตัวแปรสภาพแวดล้อม**: อัปเดตสคริปต์ปรับใช้ทั้งหมดให้ใช้รูปแบบ CUSTOMER_AGENT_NAME

#### ปรับปรุง
- **ประสบการณ์นักพัฒนา**: บทบาทและความรับผิดชอบของผู้แทนชัดเจนขึ้นในเอกสาร
- **ความพร้อมสำหรับผลิต**: การจัดชื่อตามองค์กรที่ดีขึ้น
- **สื่อการเรียนรู้**: การตั้งชื่อผู้แทนที่เข้าใจง่ายขึ้นเพื่อการศึกษาที่ดีขึ้น
- **การใช้งานแม่แบบ**: ทำให้เข้าใจฟังก์ชันของผู้แทนและรูปแบบการปรับใช้ได้ง่ายขึ้น

#### รายละเอียดทางเทคนิค
- อัปเดตแผนผังสถาปัตยกรรม Mermaid โดยใช้การอ้างอิง CustomerAgent
- แทนที่ชื่อคลาส CoraAgent ด้วย CustomerAgent ในตัวอย่าง Python
- ปรับแต่งการกำหนดค่า JSON แม่แบบ ARM ให้ใช้ประเภท "customer" สำหรับผู้แทน
- อัปเดตตัวแปรสภาพแวดล้อมจาก CORA_AGENT_* เป็น CUSTOMER_AGENT_*
- รีเฟรชคำสั่งปรับใช้และการกำหนดค่าคอนเทนเนอร์ทั้งหมด

### [v3.0.0] - 2025-09-12

#### การเปลี่ยนแปลงครั้งใหญ่ - เน้นนักพัฒนา AI และการผสานรวม Microsoft Foundry
**เวอร์ชันนี้เปลี่ยนแปลงที่เก็บข้อมูลเป็นแหล่งเรียนรู้เน้น AI แบบครบวงจรพร้อมการผสานรวม Microsoft Foundry**

#### เพิ่มเติม
- **🤖 เส้นทางการเรียนรู้ AI-First**: การจัดโครงสร้างใหม่โดยเน้นนักพัฒนาและวิศวกร AI
- **คู่มือผสานรวม Microsoft Foundry**: เอกสารครบถ้วนสำหรับการเชื่อมต่อ AZD กับบริการ Microsoft Foundry
- **รูปแบบการปรับใช้โมเดล AI**: คู่มือละเอียดครอบคลุมการเลือกโมเดล การตั้งค่า และกลยุทธ์ปรับใช้ในผลิต
- **ห้องปฏิบัติการเวิร์กช็อป AI**: เวิร์กช็อปฝึกปฏิบัติ 2-3 ชั่วโมงสำหรับแปลงแอป AI เป็นโซลูชันปรับใช้ด้วย AZD
- **แนวทางปฏิบัติที่ดีที่สุด AI สำหรับผลิต**: รูปแบบสำหรับองค์กรพร้อมสำหรับการปรับขนาด, การตรวจสอบ, และรักษาความปลอดภัยงาน AI
- **คู่มือแก้ไขปัญหาเฉพาะ AI**: คู่มือแก้ไขปัญหาครบถ้วนสำหรับ Microsoft Foundry Models, Cognitive Services และปัญหาการปรับใช้ AI
- **แกลเลอรีแม่แบบ AI**: คอลเลกชันแม่แบบ Microsoft Foundry ที่มีการจัดอันดับความซับซ้อน
- **สื่อเวิร์กช็อป**: โครงสร้างเวิร์กช็อปครบถ้วนพร้อมห้องปฏิบัติการฝึกปฏิบัติและสื่ออ้างอิง

#### ปรับปรุง
- **โครงสร้าง README**: เน้นนักพัฒนา AI พร้อมข้อมูลความสนใจจากชุมชน 45% จาก Microsoft Foundry Discord
- **เส้นทางการเรียนรู้**: เส้นทางนักพัฒนา AI โดยเฉพาะควบคู่กับเส้นทางสำหรับนักศึกษาและวิศวกร DevOps
- **คำแนะนำแม่แบบ**: แม่แบบ AI ที่โดดเด่นรวมถึง azure-search-openai-demo, contoso-chat และ openai-chat-app-quickstart
- **การผสานรวมชุมชน**: รองรับชุมชน Discord ด้วยช่องและการสนทนาเฉพาะ AI

#### ความปลอดภัยและเน้นผลิต
- **รูปแบบ Managed Identity**: การรับรองตัวตนและการตั้งค่าความปลอดภัยเฉพาะ AI
- **การเพิ่มประสิทธิภาพต้นทุน**: การติดตามการใช้โทเค็นและการควบคุมงบประมาณสำหรับงาน AI
- **การปรับใช้หลายภูมิภาค**: กลยุทธ์สำหรับการปรับใช้แอป AI ทั่วโลก
- **การตรวจสอบประสิทธิภาพ**: เมตริกเฉพาะ AI และการผสานรวม Application Insights

#### คุณภาพเอกสาร
- **โครงสร้างหลักสูตรเชิงเส้น**: การก้าวหน้าอย่างมีเหตุผลจากผู้เริ่มต้นถึงรูปแบบการปรับใช้ AI ขั้นสูง
- **URL ที่ตรวจสอบแล้ว**: ลิงก์ที่เก็บภายนอกทั้งหมดตรวจสอบและเข้าถึงได้
- **อ้างอิงครบถ้วน**: ลิงก์เอกสารภายในทั้งหมดตรวจสอบแล้วและใช้งานได้
- **พร้อมผลิต**: รูปแบบการปรับใช้องค์กรพร้อมตัวอย่างในโลกจริง

### [v2.0.0] - 2025-09-09

#### การเปลี่ยนแปลงครั้งใหญ่ - การปรับโครงสร้างที่เก็บและยกระดับความเป็นมืออาชีพ
**เวอร์ชันนี้เป็นการปรับโครงสร้างและนำเสนอเนื้อหาของที่เก็บข้อมูลอย่างมีนัยสำคัญ**

#### เพิ่มเติม
- **กรอบการเรียนรู้ที่มีโครงสร้าง**: หน้าเอกสารทั้งหมดมีส่วนบทนำ, เป้าหมายการเรียนรู้ และผลลัพธ์การเรียนรู้
- **ระบบนำทาง**: เพิ่มลิงก์บทเรียนก่อนหน้า/ถัดไปทั่วทั้งเอกสารสำหรับการเรียนรู้อย่างเป็นขั้นตอน
- **คู่มือการศึกษา**: study-guide.md ครบสมบูรณ์พร้อมวัตถุประสงค์การเรียนรู้, แบบฝึกหัด และวัสดุประเมินผล
- **การนำเสนอแบบมืออาชีพ**: ลบไอคอนอีโมจิทั้งหมดเพื่อความเข้าถึงและภาพลักษณ์มืออาชีพที่ดีขึ้น
- **โครงสร้างเนื้อหาที่ปรับปรุง**: ปรับการจัดระเบียบและการไหลของสื่อการเรียนรู้ให้ดีขึ้น

#### เปลี่ยนแปลง
- **รูปแบบเอกสาร**: มาตรฐานเอกสารทั้งหมดโดยใช้โครงสร้างเน้นการเรียนรู้อย่างสม่ำเสมอ
- **การไหลของการนำทาง**: ดำเนินการก้าวหน้าที่มีเหตุผลผ่านสื่อการเรียนรู้ทั้งหมด
- **การนำเสนอเนื้อหา**: ลบองค์ประกอบตกแต่งเพื่อให้มีการจัดรูปแบบชัดเจนและเป็นมืออาชีพ
- **โครงสร้างลิงก์**: อัปเดตลิงก์ภายในทั้งหมดเพื่อรองรับระบบนำทางใหม่

#### ปรับปรุง
- **การเข้าถึง**: ลบความขึ้นอยู่กับอีโมจิเพื่อความเข้ากันได้กับโปรแกรมอ่านหน้าจอที่ดีขึ้น
- **ภาพลักษณ์มืออาชีพ**: การนำเสนอแบบสไตล์วิชาการสะอาดเหมาะสำหรับการเรียนรู้องค์กร
- **ประสบการณ์การเรียนรู้**: แนวทางโครงสร้างพร้อมวัตถุประสงค์และผลลัพธ์ชัดเจนในแต่ละบทเรียน
- **การจัดระเบยบเนื้อหา**: การไหลและการเชื่อมโยงที่ดีขึ้นระหว่างหัวข้อที่เกี่ยวข้อง

### [v1.0.0] - 2025-09-09

#### เปิดตัวครั้งแรก - ที่เก็บเรียนรู้ AZD แบบครบวงจร

#### เพิ่มเติม
- **โครงสร้างเอกสารหลัก**
  - ชุดคำแนะนำเริ่มต้นครบถ้วน
  - เอกสารการปรับใช้และการเตรียมพร้อมอย่างครบถ้วน
  - ทรัพยากรแก้ไขปัญหาและคู่มือดีบักโดยละเอียด
  - เครื่องมือและกระบวนการตรวจสอบก่อนการปรับใช้

- **โมดูลเริ่มต้นใช้งาน**
  - พื้นฐาน AZD: แนวคิดและคำศัพท์หลัก
  - คู่มือการติดตั้ง: คำแนะนำการตั้งค่าแพลตฟอร์มเฉพาะ
  - คู่มือการกำหนดค่า: ตั้งค่าสภาพแวดล้อมและการรับรองตัวตน
  - แบบฝึกหัดโครงการแรก: เรียนรู้โดยทำทีละขั้นตอน

- **โมดูลปรับใช้และเตรียมพร้อม**
  - คู่มือการปรับใช้: เอกสารเวิร์กโฟลว์ครบถ้วน
  - คู่มือการเตรียมพร้อม: โครงสร้างพื้นฐานเป็นโค้ดด้วย Bicep
  - แนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้ในผลิต
  - รูปแบบสถาปัตยกรรมหลายบริการ

- **โมดูลตรวจสอบก่อนปรับใช้**
  - การวางแผนความจุ: การตรวจสอบความพร้อมทรัพยากร Azure
  - การเลือก SKU: คำแนะนำชั้นบริการครบถ้วน
  - การตรวจสอบก่อนบิน: สคริปต์ตรวจสอบอัตโนมัติ (PowerShell และ Bash)
  - เครื่องมือตีราคาค่าใช้จ่ายและวางแผนงบประมาณ

- **โมดูลแก้ไขปัญหา**
  - ปัญหาทั่วไป: ปัญหาที่พบและวิธีแก้ไขบ่อย
  - คู่มือดีบัก: วิธีการแก้ไขปัญหาอย่างเป็นระบบ
  - เทคนิคและเครื่องมือวินิจฉัยขั้นสูง
  - การตรวจสอบประสิทธิภาพและการเพิ่มประสิทธิภาพ

- **ทรัพยากรและการอ้างอิง**
  - แผ่นโกงคำสั่ง: อ้างอิงด่วนสำหรับคำสั่งสำคัญ
  - พจนานุกรม: คำศัพท์และตัวย่อครบถ้วน
  - คำถามที่พบบ่อย: คำตอบละเอียดสำหรับคำถามทั่วไป
  - ลิงก์ทรัพยากรภายนอกและการเชื่อมต่อชุมชน

- **ตัวอย่างและแม่แบบ**
  - ตัวอย่างแอปเว็บง่ายๆ
  - แม่แบบปรับใช้เว็บไซต์สแตติก
  - การกำหนดค่าแอปคอนเทนเนอร์
  - รูปแบบการรวมฐานข้อมูล
  - ตัวอย่างสถาปัตยกรรมไมโครเซอร์วิส
  - การใช้งานฟังก์ชันแบบไม่มีเซิร์ฟเวอร์

#### คุณสมบัติ
- **รองรับหลายแพลตฟอร์ม**: คู่มือการติดตั้งและกำหนดค่าสำหรับ Windows, macOS, และ Linux
- **ระดับทักษะหลากหลาย**: เนื้อหาออกแบบสำหรับนักเรียนจนถึงนักพัฒนามืออาชีพ
- **เน้นการใช้งานจริง**: ตัวอย่างปฏิบัติและสถานการณ์จริง
- **ครอบคลุมครบถ้วน**: ตั้งแต่แนวคิดพื้นฐานถึงรูปแบบองค์กรขั้นสูง
- **แนวทางความปลอดภัยเป็นอันดับแรก**: แนวทางปฏิบัติความปลอดภัยผสานอยู่ทั่วทั้งเนื้อหา
- **การเพิ่มประสิทธิภาพต้นทุน**: คำแนะนำสำหรับการปรับใช้และการจัดการทรัพยากรอย่างประหยัด

#### คุณภาพเอกสาร
- **ตัวอย่างโค้ดรายละเอียด**: ตัวอย่างโค้ดที่ปฏิบัติได้และผ่านการทดสอบ
- **คำแนะนำทีละขั้นตอน**: คำแนะนำที่ชัดเจนและปฏิบัติได้
- **การจัดการข้อผิดพลาดครบถ้วน**: การแก้ไขปัญหาสำหรับปัญหาทั่วไป
- **ผสานรวมแนวทางปฏิบัติที่ดีที่สุด**: มาตรฐานอุตสาหกรรมและคำแนะนำ
- **ความเข้ากันได้เวอร์ชัน**: ปรับปรุงล่าสุดด้วยบริการ Azure และฟีเจอร์ azd

## การพัฒนาปรับปรุงในอนาคตที่วางแผนไว้

### เวอร์ชัน 3.1.0 (วางแผน)
#### การขยายแพลตฟอร์ม AI
- **รองรับหลายโมเดล**: รูปแบบผสานรวมสำหรับ Hugging Face, Azure Machine Learning และโมเดลตามสั่ง
- **กรอบงาน AI Agent**: แม่แบบสำหรับการปรับใช้ LangChain, Semantic Kernel และ AutoGen
- **รูปแบบ RAG ขั้นสูง**: ตัวเลือกฐานข้อมูลเวกเตอร์นอกเหนือจาก Azure AI Search (Pinecone, Weaviate ฯลฯ)
- **การสังเกตการณ์ AI**: การตรวจสอบประสิทธิภาพโมเดล, การใช้โทเค็น, และคุณภาพการตอบสนองที่ปรับปรุง

#### ประสบการณ์นักพัฒนา
- **ส่วนขยาย VS Code**: ประสบการณ์การพัฒนารวม AZD + Microsoft Foundry
- **ผสานรวม GitHub Copilot**: การสร้างแม่แบบ AZD โดย AI ช่วย
- **บทเรียนเชิงโต้ตอบ**: แบบฝึกหัดเขียนโค้ดพร้อมการตรวจสอบอัตโนมัติสำหรับสถานการณ์ AI
- **สื่อวิดีโอ**: วิดีโอสอนเสริมสำหรับผู้เรียนแบบเห็นภาพเน้นการปรับใช้ AI

### เวอร์ชัน 4.0.0 (วางแผน)
#### รูปแบบ AI สำหรับองค์กร
- **กรอบการกำกับดูแล**: การกำกับดูแลโมเดล AI, การปฏิบัติตามกฎระเบียบ, และร่องรอยการตรวจสอบ
- **AI หลายผู้เช่า**: รูปแบบสำหรับการให้บริการลูกค้าหลายรายด้วยบริการ AI แยกเป็นสัดส่วน
- **การปรับใช้ AI ที่ Edge**: การผสานรวมกับ Azure IoT Edge และอินสแตนซ์คอนเทนเนอร์
- **AI แบบคลาวด์ไฮบริด**: รูปแบบการปรับใช้หลายคลาวด์และไฮบริดสำหรับงาน AI

#### ฟีเจอร์ขั้นสูง
- **ระบบอัตโนมัติ AI Pipeline**: การผสานรวม MLOps กับ Azure Machine Learning pipelines
- **ความปลอดภัยขั้นสูง**: รูปแบบ zero-trust, จุดสิ้นสุดส่วนตัว, และการป้องกันภัยคุกคามขั้นสูง
- **การปรับแต่งประสิทธิภาพ**: การปรับจูนและขยายขั้นสูงสำหรับแอป AI ที่มีปริมาณงานสูง
- **การกระจายระดับโลก**: รูปแบบการจัดส่งเนื้อหาและแคชที่ Edge สำหรับแอป AI

### เวอร์ชัน 3.0.0 (วางแผน) - ถูกแทนที่ด้วยเวอร์ชันปัจจุบัน
#### การเพิ่มเติมที่เสนอ - ดำเนินการแล้วใน v3.0.0
- ✅ **เนื้อหาเน้น AI**: การผสาน Microsoft Foundry แบบครบถ้วน (เสร็จสมบูรณ์)
- ✅ **บทเรียนเชิงโต้ตอบ**: เวิร์กช็อป AI ฝึกปฏิบัติ (เสร็จสมบูรณ์)
- ✅ **โมดูลความปลอดภัยขั้นสูง**: รูปแบบความปลอดภัยเฉพาะ AI (เสร็จสมบูรณ์)
- ✅ **การปรับแต่งประสิทธิภาพ**: กลยุทธ์ปรับจูนงาน AI (เสร็จสมบูรณ์)

### เวอร์ชัน 2.1.0 (วางแผน) - ดำเนินการบางส่วนใน v3.0.0
#### การปรับแต่งเล็กน้อย - บางส่วนเสร็จสมบูรณ์ในเวอร์ชันปัจจุบัน
- ✅ **ตัวอย่างเพิ่มเติม**: สถานการณ์ปรับใช้เน้น AI (เสร็จสมบูรณ์)
- ✅ **ขยาย FAQ**: คำถามและแก้ไขปัญหาเฉพาะ AI (เสร็จสมบูรณ์)
- **การผสานเครื่องมือ**: คู่มือการผสาน IDE และตัวแก้ไขที่ปรับปรุง
- ✅ **ขยายการตรวจสอบ**: รูปแบบการตรวจสอบและแจ้งเตือนเฉพาะ AI (เสร็จสมบูรณ์)

#### ยังวางแผนในเวอร์ชันอนาคต
- **เอกสารเหมาะสำหรับมือถือ**: การออกแบบตอบสนองสำหรับการเรียนรู้บนมือถือ
- **การเข้าถึงแบบออฟไลน์**: แพ็กเกจเอกสารดาวน์โหลดได้
- **การผสาน IDE ที่ปรับปรุง**: ส่วนขยาย VS Code สำหรับ AZD + เวิร์กโฟลว์ AI
- **แดชบอร์ดชุมชน**: ตัวชี้วัดชุมชนเรียลไทม์และการติดตามการมีส่วนร่วม

## วิธีการมีส่วนร่วมในบันทึกการเปลี่ยนแปลง

### การรายงานการเปลี่ยนแปลง
เมื่อมีส่วนร่วมกับที่เก็บนี้ โปรดตรวจสอบให้แน่ใจว่ารายการบันทึกการเปลี่ยนแปลงรวมถึง:

1. **หมายเลขเวอร์ชัน**: ตามระบบเวอร์ชันเชิงความหมาย (major.minor.patch)
2. **วันที่**: วันที่ออกหรืออัปเดตในรูปแบบ YYYY-MM-DD
3. **หมวดหมู่**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **คำอธิบายชัดเจน**: คำอธิบายสั้น ๆ ว่ามีการเปลี่ยนแปลงอะไร
5. **การประเมินผลกระทบ**: ผลกระทบของการเปลี่ยนแปลงต่อผู้ใช้เดิม

### หมวดหมู่การเปลี่ยนแปลง

#### เพิ่มเติม
- ฟีเจอร์ใหม่, ส่วนเอกสาร หรือความสามารถเพิ่มเติม
- ตัวอย่างใหม่, แม่แบบ หรือแหล่งเรียนรู้เพิ่มเติม
- เครื่องมือ, สคริปต์ หรือยูทิลิตี้เพิ่มเติม

#### เปลี่ยนแปลง
- การแก้ไขฟังก์ชันหรือเอกสารที่มีอยู่
- การอัปเดตเพื่อปรับปรุงความชัดเจนหรือความถูกต้อง
- การปรับโครงสร้างเนื้อหาหรือการจัดระเบียบ

#### เลิกใช้
- ฟีเจอร์หรือแนวทางที่กำลังจะเลิกใช้
- ส่วนเอกสารที่กำหนดตารางเวลาการลบ
- วิธีการที่มีทางเลือกดีกว่า

#### ลบออก
- ฟีเจอร์, เอกสาร หรือ ตัวอย่างที่ไม่เกี่ยวข้องอีกต่อไป
- ข้อมูลล้าสมัยหรือแนวทางเลิกใช้
- เนื้อหาที่ซ้ำซ้อนหรือลดทอน

#### แก้ไข
- การแก้ไขข้อผิดพลาดในเอกสารหรือโค้ด
- การแก้ไขปัญหาที่รายงาน
- การปรับปรุงความถูกต้องหรือฟังก์ชันการทำงาน

#### ความปลอดภัย
- การปรับปรุงหรือแก้ไขด้านความปลอดภัย
- การอัปเดตแนวทางปฏิบัติความปลอดภัยที่ดีที่สุด
- การแก้ไขช่องโหว่ด้านความปลอดภัย

### แนวทางการใช้ Semantic Versioning

#### เวอร์ชันหลัก (X.0.0)
- การเปลี่ยนแปลงที่ขัดแย้งซึ่งต้องการการดำเนินการจากผู้ใช้
- การปรับโครงสร้างเนื้อหาหรือองค์กรอย่างมีนัยสำคัญ
- การเปลี่ยนแปลงที่เปลี่ยนแนวทางหรือวิธีการพื้นฐาน

#### เวอร์ชันรอง (X.Y.0)
- ฟีเจอร์หรือเนื้อหาใหม่
- การปรับปรุงที่คงความเข้ากันได้ย้อนหลัง
- ตัวอย่าง, เครื่องมือ หรือแหล่งข้อมูลเพิ่มเติม

#### เวอร์ชันแปะ (X.Y.Z)
- การแก้ไขบั๊กและการแก้ไข
- การปรับปรุงเนื้อหาที่มีอยู่เล็กน้อย
- การชี้แจงและการปรับปรุงเล็กน้อย

## ความคิดเห็นและข้อเสนอแนะจากชุมชน

เราสนับสนุนอย่างเต็มที่ให้ชุมชนเสนอแนะเพื่อพัฒนาทรัพยากรการเรียนรู้นี้:

### วิธีการให้ข้อเสนอแนะ
- **GitHub Issues**: รายงานปัญหาหรือแนะนำการปรับปรุง (ยินดีรับปัญหาเฉพาะ AI)
- **การสนทนา Discord**: แบ่งปันไอเดียและมีส่วนร่วมกับชุมชน Microsoft Foundry
- **Pull Requests**: มีส่วนร่วมปรับปรุงเนื้อหาโดยตรง โดยเฉพาะแม่แบบและคู่มือ AI
- **Microsoft Foundry Discord**: เข้าร่วมช่อง #Azure สำหรับการสนทนา AZD + AI
- **ฟอรัมชุมชน**: เข้าร่วมการสนทนาเกี่ยวกับนักพัฒนา Azure ในวงกว้าง

### หมวดหมู่ข้อเสนอแนะ
- **ความถูกต้องของเนื้อหา AI**: การแก้ไขข้อมูลการผสานรวมและการปรับใช้บริการ AI
- **ประสบการณ์การเรียนรู้**: ข้อเสนอแนะสำหรับการไหลของการเรียนรู้ของนักพัฒนา AI ที่ดีขึ้น
- **ขาดเนื้อหา AI**: คำร้องขอแม่แบบ รูปแบบ หรือ ตัวอย่าง AI เพิ่มเติม
- **การเข้าถึง**: การปรับปรุงเพื่อความต้องการเรียนรู้ที่หลากหลาย
- **การผสานเครื่องมือ AI**: ข้อเสนอแนะสำหรับการผสานเวิร์กโฟลว์การพัฒนา AI ที่ดีขึ้น
- **รูปแบบ AI สำหรับผลิต**: คำร้องขอรูปแบบการปรับใช้องค์กร AI

### คำมั่นสัญญาตอบกลับ
- **การตอบกลับปัญหา**: ภายใน 48 ชั่วโมงสำหรับปัญหาที่รายงาน
- **คำร้องขอฟีเจอร์**: ประเมินภายในหนึ่งสัปดาห์
- **การมีส่วนร่วมชุมชน**: ตรวจสอบภายในหนึ่งสัปดาห์
- **ปัญหาด้านความปลอดภัย**: ให้ความสำคัญทันทีพร้อมการตอบกลับที่รวดเร็ว

## ตารางเวลาการบำรุงรักษา

### การอัปเดตเป็นประจำ
- **การตรวจสอบรายเดือน**: ความถูกต้องของเนื้อหาและการตรวจสอบลิงก์
- **การอัปเดตรายไตรมาส**: การเพิ่มและปรับปรุงเนื้อหาหลัก
- **การตรวจสอบครึ่งปี**: การปรับโครงสร้างและการพัฒนาครบถ้วน
- **การออกประจำปี**: อัปเดตเวอร์ชันหลักพร้อมการปรับปรุงใหญ่

### การตรวจสอบและประกันคุณภาพ
- **การทดสอบอัตโนมัติ**: การตรวจสอบความถูกต้องของตัวอย่างโค้ดและลิงก์อย่างสม่ำเสมอ
- **การผนวกข้อเสนอแนะจากชุมชน**: การนำเสนอข้อเสนอแนะของผู้ใช้มาใช้เป็นประจำ
- **การอัปเดตเทคโนโลยี**: การปรับให้สอดคล้องกับบริการ Azure ใหม่ล่าสุดและการปล่อยตัว azd
- **การตรวจสอบการเข้าถึง**: การทบทวนตามหลักการออกแบบที่ครอบคลุมอย่างสม่ำเสมอ

## นโยบายการสนับสนุนเวอร์ชัน

### การสนับสนุนเวอร์ชันปัจจุบัน
- **เวอร์ชันหลักล่าสุด**: สนับสนุนเต็มที่พร้อมกับการอัปเดตอย่างสม่ำเสมอ
- **เวอร์ชันหลักก่อนหน้า**: การอัปเดตความปลอดภัยและการแก้ไขที่สำคัญเป็นเวลานาน 12 เดือน
- **เวอร์ชันเก่า**: สนับสนุนโดยชุมชนเท่านั้น ไม่มีการอัปเดตทางการ

### คำแนะนำการย้ายข้อมูล
เมื่อมีการปล่อยเวอร์ชันหลักใหม่ เราจะจัดเตรียม:
- **คู่มือการย้ายข้อมูล**: คำแนะนำทีละขั้นตอนสำหรับการย้ายข้อมูล
- **หมายเหตุความเข้ากันได้**: รายละเอียดเกี่ยวกับการเปลี่ยนแปลงที่ทำให้ไม่เข้ากัน
- **เครื่องมือสนับสนุน**: สคริปต์หรือยูทิลิตี้ที่ช่วยในการย้ายข้อมูล
- **การสนับสนุนจากชุมชน**: ฟอรัมเฉพาะสำหรับคำถามเกี่ยวกับการย้ายข้อมูล

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [Study Guide](resources/study-guide.md)
- **บทเรียนถัดไป**: กลับไปที่ [Main README](README.md)

**ติดตามข่าวสาร**: เฝ้าดูรีโพสิโทรี่นี้เพื่อรับการแจ้งเตือนเกี่ยวกับการปล่อยตัวใหม่และการอัปเดตที่สำคัญต่อเนื้อหาการเรียนรู้

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->