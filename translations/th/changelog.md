# ประวัติการเปลี่ยนแปลง - AZD สำหรับผู้เริ่มต้น

## บทนำ

ประวัติการเปลี่ยนแปลงนี้บันทึกการเปลี่ยนแปลงที่สำคัญทั้งหมด การอัปเดต และการปรับปรุงในที่เก็บ AZD สำหรับผู้เริ่มต้น เราปฏิบัติตามหลักการเวอร์ชันแบบมีความหมายและรักษาบันทึกนี้ไว้เพื่อช่วยให้ผู้ใช้เข้าใจว่ามีอะไรเปลี่ยนแปลงระหว่างเวอร์ชันบ้าง

## เป้าหมายการเรียนรู้

โดยการตรวจสอบประวัติการเปลี่ยนแปลงนี้ คุณจะ:
- รับข้อมูลอัปเดตเกี่ยวกับฟีเจอร์ใหม่และเนื้อหาที่เพิ่มขึ้น
- เข้าใจการปรับปรุงที่ทำกับเอกสารที่มีอยู่
- ติดตามการแก้ไขบั๊กและการแก้ไขเพื่อให้มั่นใจถึงความแม่นยำ
- ติดตามพัฒนาการของสื่อการเรียนรู้ตามช่วงเวลา

## ผลลัพธ์การเรียนรู้

หลังจากตรวจสอบรายการในประวัติการเปลี่ยนแปลงแล้ว คุณจะสามารถ:
- ระบุเนื้อหาและทรัพยากรใหม่ที่พร้อมสำหรับการเรียนรู้
- เข้าใจว่ามีส่วนใดบ้างที่ได้รับการอัปเดตหรือปรับปรุง
- วางแผนเส้นทางการเรียนรู้ของคุณตามวัสดุที่ทันสมัยที่สุด
- มีส่วนร่วมในการให้ข้อเสนอแนะและข้อแนะนำเพื่อการปรับปรุงในอนาคต

## ประวัติการเวอร์ชัน

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Refresh: การอัปเดตเวอร์ชันให้ทันสมัย
**เวอร์ชันนี้ทำการตรวจสอบความถูกต้องของหลักสูตรกับ `azd` `1.27.1` (กรกฎาคม 2026, รุ่นเสถียรล่าสุด) และส่วนขยาย AI agent รุ่นพรีวิวปัจจุบัน `azure.ai.agents` `1.0.0-beta.5` ทำให้แบนเนอร์ "validated against" ทุกอันเป็นปัจจุบันหลังจากการปล่อย 1.26.0, 1.27.0, และ 1.27.1**

#### เปลี่ยนแปลง
- **✅ อัปเดตฐานการตรวจสอบความถูกต้อง** จาก `azd 1.25.6` (มิถุนายน 2026) เป็น `azd 1.27.1` (กรกฎาคม 2026) ใน README หลัก, README ของทุกบท, บทเรียน dev-container บทที่ 1 (รวมตัวอย่างที่ระบุเวอร์ชัน), บทเรียน custom-templates ในบทที่ 4, บทเรียน multi-agent ในบทที่ 5, และเอกสารเวิร์กช็อป
- **🤖 รีเฟรชฐานของบทที่ 2** จาก `azd 1.23.12` (มีนาคม 2026) เป็น `azd 1.27.1` ใน `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` และ `microsoft-foundry-integration.md`; อัปเดตวันที่ในบันทึกตรวจสอบเป็น 2026-07-13
- **🧩 ยกเครื่องเวอร์ชัน AI agent extension** จาก `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` เป็นรุ่นปัจจุบัน `1.0.0-beta.5` ใน README และ `agents.md` ของบทที่ 2
- **🧪 ตัวอย่างการตรวจสอบในเวิร์กช็อป** (ผลลัพธ์คำสั่ง `azd version`) อัปเดตเป็น `1.27.1`

#### หมายเหตุเกี่ยวกับการปล่อย azd ที่เกี่ยวข้อง (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** สนับสนุน Go สำหรับ Azure Functions บน Flex Consumption, ตัวกรองการสมัครสมาชิกต่อผู้เช่าด้วยคำสั่ง `azd config sub-filter`, แพ็กส่วนขยายแบบรวมตัว (`azd x pack --bundle`), และคำสั่ง `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** โมเดลโครงการ/เอเจนต์ Azure AI Foundry โดยตรงใน `azure.yaml` (เริ่มต้นแบบไม่ใช้ Bicep/Terraform), สนับสนุนการติดตั้งคอนเทนเนอร์สำหรับ App Service (`host: appservice` + `language: docker`), ตัวเลือก `-s/--source` โดยตรงสำหรับคำสั่ง `azd extension`, และคำสั่ง `azd tool uninstall`
- **1.27.1 (2026-07-09):** ตัวเลือก `--no-dependencies` สำหรับการติดตั้งส่วนขยาย `azd extension install`, การแยกโมเดลที่ถูกเลิกใช้จากคำขอแคตตาล็อก/โควต้าโดยค่าเริ่มต้น และการแก้ไขบั๊กหลายรายการ

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

#### เติมช่องว่างสำหรับผู้เริ่มต้น #2: การเขียนเทมเพลต, Dev Containers, Pulumi, Azure DevOps, Service Principals และอื่น ๆ
**เวอร์ชันนี้ปิดช่องว่างระดับกลางที่เหลือทั้งหมดที่ถูกเปิดเผยโดยการวิเคราะห์ azd-coverage: วิธีเขียนและเผยแพร่เทมเพลตของคุณเอง, สภาพแวดล้อม dev-container/Codespaces ที่สามารถทำซ้ำได้, ผู้ให้บริการโครงสร้างพื้นฐาน Pulumi, การเดินหน้าผ่าน Azure DevOps CI/CD, การตรวจสอบสิทธิ์ service-principal, คำแนะนำการเลือกโฮสต์ (AKS/Spring Apps), คำอธิบาย `azd restore`/`azd package`, การจัดการข้อผิดพลาดของ hook และแนวทางปฏิบัติสำหรับทีม/สภาพแวดล้อมที่ใช้ร่วมกัน**

#### เพิ่มเติม
- **🧱 บทเรียนใหม่บทที่ 4** `docs/chapter-04-infrastructure/custom-templates.md` — การเขียนเทมเพลต azd ของคุณเอง: โครงสร้างที่จำเป็น (`azure.yaml`, `infra/`, `src/`), ฟิลด์ `metadata.template`, การปรับโครงสร้างพื้นฐานด้วย token `uniqueString()` และแท็ก `azd-env-name`, การทดสอบในเครื่องด้วย `azd init --template <local-path>`, การเผยแพร่ไปยัง GitHub และการส่งไปยังแกลเลอรี Awesome AZD
- **📦 บทเรียนใหม่บทที่ 1** `docs/chapter-01-foundation/dev-containers.md` — สภาพแวดล้อม azd ที่ทำซ้ำได้ด้วย Dev Containers และ GitHub Codespaces: ไฟล์ `.devcontainer/devcontainer.json` แบบขั้นต่ำโดยใช้ฟีเจอร์อย่างเป็นทางการ `ghcr.io/azure/azure-dev/azd`, ฟีเจอร์เฉพาะภาษา, `docker-in-docker` สำหรับโฮสต์คอนเทนเนอร์ และ `azd auth login --use-device-code` สำหรับลงชื่อเข้าใช้ระยะไกล
- **🧩 Pulumi กับ azd** ส่วนใน `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, การจัดวางโฟลเดอร์ Pulumi, stacks ที่แม็ปกับ azd environments, ผลลัพธ์ที่จำเป็น/การติดแท็ก และเวิร์กโฟลว์ `azd up` / `azd down` ที่เหมือนกัน
- **🎯 คำแนะนำการเลือกโฮสต์** ใน `docs/chapter-04-infrastructure/provisioning.md` — การเปรียบเทียบที่เป็นมิตรสำหรับผู้เริ่มต้นของ `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` และ `springapp` พร้อมคำแนะนำเกี่ยวกับเมื่อใดควรเลือก AKS หรือ Azure Spring Apps
- **🛠️ การเดินหน้าผ่าน Azure DevOps CI/CD** ใน `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, การเชื่อมต่อบริการด้วย work load identity federation (OIDC), ไฟล์ `azure-dev.yml` ที่ถูกสร้าง และการตั้งค่ากลุ่มตัวแปร
- **🔑 Service Principals (รูปแบบที่ 4)** เพิ่มใน `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` แบบไม่โต้ตอบด้วย client secret กับข้อมูลรับรอง federated/OIDC, เมื่อใดควรใช้ และการเก็บข้อมูลรับรองอย่างปลอดภัย
- **🪝 การจัดการข้อผิดพลาดของ hook** ย่อยใน `docs/chapter-04-infrastructure/deployment-guide.md` — รหัสออกและ `set -e`, `continueOnError`, การทดสอบ hooks อย่างแยกส่วนด้วย `azd hooks run`, shell เฉพาะระบบปฏิบัติการ และ `--debug`
- **👥 ทีม / สภาพแวดล้อมที่ใช้ร่วมกัน** ส่วนใน `docs/chapter-03-configuration/configuration.md` — ไฟล์ที่อยู่ใน `.azure/`, สิ่งที่ต้อง gitignore, สภาพแวดล้อมต่อโปรแกรมเมอร์, `azd env list`/`select` และการมอบค่าตัวแปรสภาพแวดล้อมใน CI/CD
- **🧰 คำอธิบาย `azd restore` และ `azd package` ที่ขยายความ** ใน `resources/cheat-sheet.md` — การคืนค่าการพึ่งพาและการสร้างอาร์ติแฟกต์ที่พร้อมติดตั้งโดยไม่ต้องติดตั้งจริง

#### เปลี่ยนแปลง
- **🧭 ตารางบทเรียนบทที่ 4** อัปเดตเพื่อรวมบทเรียนใหม่ "การเขียนเทมเพลตของคุณเอง" (บทเรียนที่ 3)
- **🧭 ตารางบทเรียนบทที่ 1** อัปเดตเพื่อรวมบทเรียนใหม่ "Dev Containers & Codespaces" (บทเรียนที่ 5); ส่วนท้ายของการนำทางเชื่อมโยงระหว่าง `bring-your-own-app.md` กับ `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### เติมช่องว่างสำหรับผู้เริ่มต้น: บทเรียน Multi-Agent แบบลงมือทำ, "Bring Your Own App", Terraform และการเดินหน้าผ่าน CI/CD
**เวอร์ชันนี้ปิดช่องว่างที่ใหญ่ที่สุดสำหรับคู่มือผู้เริ่มต้นโดยเพิ่มบทเรียนใหม่สองบทแบบลงมือทำ (การเดินหน้าติดตั้ง multi-agent และการเพิ่ม azd ลงในแอปที่มีอยู่), การแนะนำ hooks สำหรับผู้เริ่มต้น, ส่วนการใช้ Terraform กับ azd, การเดินหน้าผ่าน GitHub Actions แบบทีละขั้นตอน, คำอธิบายสำหรับส่วนขยายพรีวิวใหม่ และรายการตรวจสอบเพื่อยืนยันการติดตั้งอย่างชัดเจน**

#### เพิ่มเติม
- **🤝 บทเรียนใหม่บทที่ 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — การเดินหน้าสองเอเจนต์ที่ลงมือทำจริงและพร้อมติดตั้ง (orchestrator + specialists) โดยใช้เทมเพลตจริง (`contoso-creative-writer`), ครอบคลุมเมื่อใดควรใช้ multi-agent, เวิร์กโฟลว์ `azd up`, การเข้าใจทรัพยากรที่ติดตั้ง, การติดตามข้ามเอเจนต์, การปรับแต่ง และการทำความสะอาด
- **📦 บทเรียนใหม่บทที่ 1** `docs/chapter-01-foundation/bring-your-own-app.md` — วิธีเพิ่ม azd ลงในโปรเจกต์ที่มีอยู่ด้วยคำสั่ง `azd init` ("ใช้โค้ดในไดเรกทอรีปัจจุบัน"), การเข้าใจ `azure.yaml` และ `infra/`, คำสั่ง `azd infra generate`, การตรวจจับโฮสต์ และการติดตั้งด้วย `azd up`
- **🌐 ส่วน Terraform กับ azd** ใน `docs/chapter-04-infrastructure/provisioning.md` — การกำหนดค่า `infra.provider: terraform`, การจัดวางโฟลเดอร์ `.tf`, ผลลัพธ์ `AZURE_*` ที่จำเป็นและการติดแท็ก `azd-env-name`, และเวิร์กโฟลว์ `azd up` / `azd down` ที่เหมือนกัน (ปิดช่องว่างที่อ้างว่ามีการสนับสนุน Terraform แต่แสดงแค่ Bicep เท่านั้น)
- **⚙️ การเดินหน้าผ่าน GitHub Actions แบบทีละขั้นตอน** ใน `docs/chapter-08-production/production-ai-practices.md` — จากรีโป GitHub สู่การติดตั้งอัตโนมัติ: `azd pipeline config`, ข้อมูลรับรอง federated OIDC (ไม่มีการเก็บความลับ), ไฟล์ `azure-dev.yml` ที่สร้างขึ้น และคำแนะนำการใช้ความลับเทียบกับตัวแปร
- **🪝 บทนำ "ใหม่กับ hooks?" สำหรับผู้เริ่มต้น** ใน `docs/chapter-04-infrastructure/deployment-guide.md` — hook คืออะไร, ตาราง hook-stage, hook แรกแบบขั้นต่ำ และการรัน hook ด้วยตนเองผ่าน `azd hooks run`
- **✅ รายการตรวจสอบ "ยืนยันการติดตั้ง"** เพิ่มในขั้นตอนที่ 5 ของ `docs/chapter-01-foundation/first-project.md` — ทดสอบเบื้องต้น, ตรวจสอบจุดสิ้นสุดสุขภาพ และเกณฑ์ความสำเร็จอย่างชัดเจน
- **🧩 คำอธิบายสำหรับส่วนขยายพรีวิวใหม่** `azure.ai.skills` และ `azure.ai.connections` (คืออะไรและเมื่อใดควรใช้) ใน `docs/chapter-08-production/production-ai-practices.md`

#### เปลี่ยนแปลง
- **🧭 ตารางบทเรียนบทที่ 5** แก้ไข: ไฟล์ `multi-agent-basics.md` เป็นบทเรียนที่ 1 (บทเรียนเดียวแบบลงมือทำเต็มรูปแบบ) พร้อมคำอธิบายอย่างจริงใจว่าบทที่ 2 อยู่ในบทที่ 6 และสถานการณ์ Retail เป็นเพียงแผนผังสถาปัตยกรรม ไม่ใช่เทมเพลตคำสั่งเดียว
- **🧭 ตารางบทเรียนบทที่ 1** รวมบทเรียนใหม่ "Bring Your Own App" (บทเรียนที่ 4)
- **🔗 ส่วนท้ายของการนำทาง** อัปเดต: `first-project.md` ลิงก์ไปยัง `bring-your-own-app.md`

#### แก้ไขแล้ว
- **🧱 ปิดช่องว่าง Terraform ที่เคยอ้างแต่ไม่แสดง** — หลักสูตรนี้เคยอ้างถึงการสนับสนุน Terraform แต่ไม่ได้แสดงตัวอย่าง
- **🔀 แก้ไขลิงก์ข้ามบทที่ 5 ที่ทำให้เข้าใจผิด** ที่บ่งบอกว่ามีการใช้งาน multi-agent เต็มรูปแบบ ในขณะที่มีแค่แผนผังสถาปัตยกรรม

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

#### รีเฟรช AZD 1.25.6, คำสั่งเต็มวงจรเอเจนต์ & การเปลี่ยนแบรนด์ Aspire

**เวอร์ชันนี้ทำการตรวจสอบความถูกต้องของคอร์สกับ `azd` `1.25.6` (มิถุนายน 2026) และส่วนขยาย `azure.ai.agents` `0.1.40-preview` ขยายคำแนะนำ AI จาก "สร้างโครงร่างเอเจนท์" ไปยังวงจรชีวิตของเอเจนท์ทั้งหมด (ทดสอบ → ประเมินผล → ปรับแต่ง → ตรวจสอบ → ลบ) นำเสนอสส่วนขยายรุ่นพรีวิวใหม่ `azure.ai.skills` และ `azure.ai.connections` และบันทึกการเปลี่ยนชื่อผลิตภัณฑ์จาก ".NET Aspire" → "Aspire"**

#### เพิ่มเติม
- **🔁 ครอบคลุมวงจรชีวิตเอเจนท์เต็มรูปแบบ** สำหรับผู้เริ่มต้นและวิศวกร AI ทั่วเอกสาร:
  - `docs/chapter-01-foundation/azd-basics.md` — ตารางวงจรชีวิต (สร้างโครงร่าง → ทดสอบ → วัดผล → ปรับปรุง → ตรวจสอบ → ทำความสะอาด) เพิ่มในส่วน Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — ส่วนใหม่ "การจัดการวงจรชีวิตเอเจนท์" ครอบคลุมคำสั่ง `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, และ `delete --force`
  - `resources/cheat-sheet.md` — ขยายคำสั่ง AI Agent ด้วย `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, และ `delete --force`
- **🧩 เอกสารส่วนขยายรุ่นพรีวิวใหม่**: `azure.ai.skills` (ทักษะเอเจนท์ที่ใช้ซ้ำได้) และ `azure.ai.connections` (การเชื่อมต่อ Foundry) ถูกเพิ่มในตารางส่วนขยายและ cheat sheet
- **⏱️ คำแนะนำการวัดเวลาในการตอบสนอง** — ตัวอย่าง `azd ai agent invoke` ตอนนี้ระบุว่าจะแสดงเวลาหน่วงรวมและเวลาถึงไบต์แรก
- **📌 แบนเนอร์เวอร์ชัน** ใน README หลัก ชี้ให้ผู้เรียนไปที่คำสั่ง `azd version` และ `azd upgrade`

#### เปลี่ยนแปลง
- **✅ ปรับปรุงฐานการตรวจสอบความถูกต้อง** จาก `azd 1.23.12` (มีนาคม 2026) เป็น `azd 1.25.6` (มิถุนายน 2026) ใน README ทุกบทและเอกสาร workshop
- **🤖 อัปเดตหมายเหตุส่วนขยายบทที่ 2** จาก `azure.ai.agents` `0.1.18-preview` เป็น `0.1.40-preview`
- **🧪 อัปเดตตัวอย่างการตรวจสอบเวิร์กช็อป** (ผลลัพธ์ `azd version`) เป็น `1.25.6`
- **🧭 ปรับปรุง README "อะไรใหม่ใน azd วันนี้"** เน้นวงจรชีวิตเอเจนท์ตั้งแต่ต้นจนจบ ส่วนขยาย AI ใหม่ และการแก้ไขคุณภาพชีวิตล่าสุด (`azd init` idempotency, การเคลียร์โทเค็นหมดอายุของ `azd auth login`, คำแนะนำรันครั้งแรกของ `azd tool`)
- **📖 บทที่ 2 agents.md (ตัวเลือก 4)** ตอนนี้ชี้ให้ผู้เรียนไปที่คำสั่งวงจรชีวิตหลังการปรับใช้ แทนที่จะหยุดที่ `azd up`

#### แก้ไขแล้ว
- **🏷️ การตั้งชื่อผลิตภัณฑ์** — เพิ่มบันทึกการเปลี่ยนชื่อ Aspire (".NET Aspire" เปลี่ยนเป็น "Aspire" อย่างเดียว); การรองรับ Aspire ของ azd ไม่เปลี่ยนแปลง
- **🔎 ยืนยันการตรวจสอบการปล่อยสด** กับฟีดการปล่อย Azure Developer CLI: CLI สเถียร `1.25.6` (2026-06-12) และ `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### ชี้แจงการเริ่มต้นสำหรับผู้เริ่มต้น, ตรวจสอบการตั้งค่า & ล้างคำสั่ง AZD สุดท้าย
**เวอร์ชันนี้ทำการตรวจสอบการตรวจสอบความถูกต้อง AZD 1.23 อีกครั้งด้วยเอกสารที่เน้นผู้เริ่มต้น: ชี้แจงคำแนะนำการตรวจสอบสิทธิ์ก่อน, เพิ่มสคริปต์ตรวจสอบการตั้งค่าท้องถิ่น, ยืนยันคำสั่งสำคัญกับ AZD CLI จริง และลบการอ้างอิงคำสั่งที่ล้าสุดท้ายที่มาจากแหล่งภาษาอังกฤษนอก changelog**

#### เพิ่มเติม
- **🧪 สคริปต์ตรวจสอบการตั้งค่าสำหรับผู้เริ่มต้น** ด้วย `validate-setup.ps1` และ `validate-setup.sh` เพื่อให้ผู้เรียนสามารถยืนยันเครื่องมือจำเป็นก่อนเริ่มบทที่ 1
- **✅ ขั้นตอนตรวจสอบการตั้งค่าล่วงหน้า** ใน README หลักและ README บทที่ 1 เพื่อจับข้อกำหนดที่ขาดก่อน `azd up`

#### เปลี่ยนแปลง
- **🔐 คำแนะนำการตรวจสอบสิทธิ์สำหรับผู้เริ่มต้น** ตอนนี้จัดการ `azd auth login` เป็นเส้นทางหลักสำหรับเวิร์กโฟลว์ AZD โดยชี้ให้ `az login` เป็นทางเลือกถ้าไม่ได้ใช้คำสั่ง Azure CLI โดยตรง
- **📚 โฟลว์การเริ่มต้นบทที่ 1** ตอนนี้ชี้ให้ผู้เรียนตรวจสอบการตั้งค่าท้องถิ่นก่อนติดตั้ง, ตรวจสอบสิทธิ์, และขั้นตอนการปรับใช้ครั้งแรก
- **🛠️ ข้อความจากตัวตรวจสอบ** ตอนนี้แยกความชัดเจนระหว่างข้อกำหนดที่บล็อกกับคำเตือน Azure CLI ที่เป็นทางเลือกสำหรับเส้นทางผู้เริ่มต้นเฉพาะ AZD
- **📖 เอกสารการกำหนดค่า, แก้ปัญหา, และตัวอย่าง** ตอนนี้แยกความแตกต่างระหว่างการตรวจสอบสิทธิ์ AZD ที่จำเป็นกับการเซ็นชื่อเข้าใช้ Azure CLI ที่เป็นทางเลือกซึ่งก่อนหน้านี้นำเสนอโดยไม่มีบริบท

#### แก้ไขแล้ว
- **📋 การอ้างอิงคำสั่งจากแหล่งภาษาอังกฤษที่เหลืออยู่** อัปเดตเป็นฟอร์ม AZD ปัจจุบัน รวมถึง `azd config show` ใน cheat sheet และ `azd monitor --overview` ที่ตั้งใจจะให้คำแนะนำ Application Insights overview
- **🧭 คำกล่าวอ้างสำหรับผู้เริ่มต้นในบทที่ 1** ถูกผ่อนคลายเพื่อหลีกเลี่ยงการสัญญาที่เกินจริงว่าปราศจากข้อผิดพลาดหรือการย้อนกลับในทุกเทมเพลตและทรัพยากร Azure
- **🔎 ยืนยันการตรวจสอบ CLI สด** ยืนยันการรองรับคำสั่ง `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, และ `azd down --force --purge`

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

#### การตรวจสอบ AZD 1.23.12, ขยายสภาพแวดล้อมเวิร์กช็อป & รีเฟรชโมเดล AI
**เวอร์ชันนี้ทำการตรวจสอบเอกสารกับ `azd` `1.23.12` อัปเดตตัวอย่างคำสั่ง AZD ที่ล้าสมัย รีเฟรชคำแนะนำโมเดล AI เป็นค่าเริ่มต้นปัจจุบัน และขยายคำแนะนำเวิร์กช็อปเกินกว่า GitHub Codespaces เพื่อรองรับ dev containers และโคลนในเครื่อง**

#### เพิ่มเติม
- **✅ หมายเหตุการตรวจสอบในบทหลักและเอกสารเวิร์กช็อป** เพื่อแสดงฐาน AZD ที่ทดสอบอย่างชัดเจนแก่ผู้เรียนที่ใช้ CLI รุ่นใหม่หรือเก่า
- **⏱️ คำแนะนำเวลา timeout สำหรับการปรับใช้แอป AI ที่ใช้เวลานาน** ด้วย `azd deploy --timeout 1800`
- **🔎 ขั้นตอนการตรวจสอบส่วนขยาย** ด้วย `azd extension show azure.ai.agents` ในเอกสารเวิร์กโฟลว์ AI
- **🌐 คำแนะนำสภาพแวดล้อมเวิร์กช็อปที่กว้างขึ้น** ครอบคลุม GitHub Codespaces, dev containers, และโคลนในเครื่องด้วย MkDocs

#### เปลี่ยนแปลง
- **📚 README แนะนำบทเรียน** ตอนนี้ระบุการตรวจสอบความถูกต้องกับ `azd 1.23.12` อย่างสม่ำเสมอในส่วนฐานราก, การกำหนดค่า, โครงสร้างพื้นฐาน, หลายเอเจนท์, ก่อนการปรับใช้, แก้ไขปัญหา, และการผลิต
- **🛠️ อ้างอิงคำสั่ง AZD** อัปเดตเป็นฟอร์มปัจจุบันทั่วเอกสาร:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` หรือ `azd env get-value(s)` ขึ้นกับบริบท
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` เมื่อมีเจตนาแสดงภาพรวม Application Insights
- **🧪 ตัวอย่าง provision รุ่นพรีวิว** ทำให้ง่ายขึ้นเป็นการใช้งานปัจจุบัน เช่น `azd provision --preview` และ `azd provision --preview -e production`
- **🧭 โฟลว์เวิร์กช็อป** อัปเดตเพื่อให้ผู้เรียนทำแลปใน Codespaces, dev container หรือโคลนในเครื่องได้แทนการสมมุติฐานว่าใช้งานได้เฉพาะ Codespaces เท่านั้น
- **🔐 คำแนะนำการตรวจสอบสิทธิ์** ตอนนี้แนะนำให้ใช้ `azd auth login` สำหรับเวิร์กโฟลว์ AZD โดยให้ `az login` เป็นทางเลือกเมื่อใช้คำสั่ง Azure CLI โดยตรง

#### แก้ไขแล้ว
- **🪟 คำสั่งติดตั้งบน Windows** ปรับให้เป็น casing แพ็กเกจ `winget` ปัจจุบันในคู่มือการติดตั้ง
- **🐧 คำแนะนำการติดตั้งบน Linux** แก้ไขไม่ให้ใช้คำสั่งจัดการแพ็กเกจ `azd` ที่ไม่รองรับเฉพาะ distro และชี้ไปยัง release assets ตามความเหมาะสม
- **📦 ตัวอย่างโมเดล AI** รีเฟรชจากค่าปริยายเก่าเช่น `gpt-35-turbo` และ `text-embedding-ada-002` เป็นตัวอย่างปัจจุบัน เช่น `gpt-4.1-mini`, `gpt-4.1`, และ `text-embedding-3-large`
- **📋 โค้ดตัวอย่างการปรับใช้และวิเคราะห์** แก้ไขใช้คำสั่งสภาพแวดล้อมและสถานะปัจจุบันในบันทึก, สคริปต์, และขั้นตอนแก้ปัญหา
- **⚙️ คำแนะนำ GitHub Actions** อัปเดตจาก `Azure/setup-azd@v1.0.0` เป็น `Azure/setup-azd@v2`
- **🤖 คำแนะนำการยินยอม MCP/Copilot** อัปเดตจาก `azd mcp consent` เป็น `azd copilot consent list`

#### ปรับปรุง
- **🧠 คำแนะนำบท AI** อธิบายพฤติกรรม `azd ai` ที่ละเอียดอ่อนช่วงพรีวิว การเข้าสู่ระบบเฉพาะ tenant, การใช้งานส่วนขยายปัจจุบัน, และคำแนะนำการปรับใช้โมเดลที่อัปเดต
- **🧪 คำแนะนำเวิร์กช็อป** ใช้ตัวอย่างเวอร์ชันที่สมจริงขึ้นและภาษาการตั้งค่าสภาพแวดล้อมที่ชัดเจนสำหรับแลปปฏิบัติ
- **📈 เอกสารการผลิตและแก้ปัญหา** สอดคล้องกับตัวอย่างการตรวจสอบ, โมเดล fallback, และระดับค่าใช้จ่ายปัจจุบันดียิ่งขึ้น

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

#### คำสั่ง AZD AI CLI, การตรวจสอบเนื้อหา & ขยายเทมเพลต
**เวอร์ชันนี้เพิ่มการครอบคลุมคำสั่ง `azd ai`, `azd extension` และ `azd mcp` ในบท AI ทั้งหมด แก้ไขลิงก์เสียและโค้ดล้าสมัยใน agents.md อัปเดต cheat sheet และปรับปรุงส่วน Example Templates ด้วยคำอธิบายที่ได้รับการตรวจสอบและเทมเพลต Azure AI AZD ใหม่**

#### เพิ่มเติม
- **🤖 การครอบคลุม AZD AI CLI** ใน 7 ไฟล์ (ก่อนหน้านี้มีเพียงในบทที่ 8):
  - `docs/chapter-01-foundation/azd-basics.md` — ส่วนใหม่ "Extensions and AI Commands" แนะนำ `azd extension`, `azd ai agent init`, และ `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — ตัวเลือก 4: `azd ai agent init` พร้อมตารางเปรียบเทียบ (เทมเพลต vs แนวทาง manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — ส่วนย่อย "AZD Extensions for Foundry" และ "Agent-First Deployment"

  - `docs/chapter-05-multi-agent/README.md` — การเริ่มต้นอย่างรวดเร็วแสดงเส้นทางการปรับใช้ทั้งแบบเทมเพลตและแบบแมนนิเฟสต์แล้ว  
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — ส่วนการปรับใช้เพิ่มตัวเลือก `azd ai agent init` แล้ว  
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — หมวด "คำสั่งขยาย AZD AI สำหรับการวินิจฉัยปัญหา"  
  - `resources/cheat-sheet.md` — หมวดใหม่ "คำสั่ง AI & Extensions" พร้อมคำสั่ง `azd extension`, `azd ai agent init`, `azd mcp` และ `azd infra generate`  
- **📦 เทมเพลตตัวอย่าง AZD AI ใหม่** ใน `microsoft-foundry-integration.md`:  
  - **azure-search-openai-demo-csharp** — แชท RAG .NET กับ Blazor WebAssembly, Semantic Kernel และรองรับแชทเสียง  
  - **azure-search-openai-demo-java** — แชท RAG ด้วย Java ใช้ Langchain4J พร้อมตัวเลือกการปรับใช้ ACA/AKS  
  - **contoso-creative-writer** — แอปเขียนสร้างสรรค์หลายเอเจนต์โดยใช้ Azure AI Agent Service, Bing Grounding และ Prompty  
  - **serverless-chat-langchainjs** — RAG เซิร์ฟเวอร์เลสใช้ Azure Functions + LangChain.js + Cosmos DB พร้อมรองรับการพัฒนา Ollama ในเครื่อง  
  - **chat-with-your-data-solution-accelerator** — ตัวเร่ง RAG สำหรับองค์กร พร้อมพอร์ทัลผู้ดูแลระบบ, การผสาน Teams และตัวเลือก PostgreSQL/Cosmos DB  
  - **azure-ai-travel-agents** — แอปอ้างอิงการประสานงาน MCP หลายเอเจนต์ พร้อมเซิร์ฟเวอร์ใน .NET, Python, Java และ TypeScript  
  - **azd-ai-starter** — เทมเพลตเริ่มต้นโครงสร้างพื้นฐาน Azure AI แบบ Bicep ขั้นต่ำ  
  - **🔗 ลิงก์แกลเลอรี Awesome AZD AI** — อ้างอิงไปยัง [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ เทมเพลต)  

#### แก้ไขแล้ว  
- **🔗 agents.md การนำทาง**: ลิงก์ก่อนหน้า/ถัดไปตรงกับลำดับบทเรียนใน README บทที่ 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)  
- **🔗 agents.md ลิงก์เสีย**: แก้ไข `production-ai-practices.md` เป็น `../chapter-08-production/production-ai-practices.md` (3 จุด)  
- **📦 agents.md โค้ดที่เลิกใช้**: แทนที่ `opencensus` ด้วย `azure-monitor-opentelemetry` + OpenTelemetry SDK  
- **🐛 agents.md API ไม่ถูกต้อง**: ย้าย `max_tokens` จาก `create_agent()` ไป `create_run()` ในชื่อ `max_completion_tokens`  
- **🔢 agents.md การนับโทเค็น**: แทนที่ประมาณการแบบหยาบ `len//4` ด้วย `tiktoken.encoding_for_model()`  
- **azure-search-openai-demo**: แก้ไขบริการจาก "Cognitive Search + App Service" เป็น "Azure AI Search + Azure Container Apps" (ค่าโฮสต์เริ่มใช้ใหม่ ต.ค. 2024)  
- **contoso-chat**: อัปเดตคำอธิบายให้ตรงกับ Azure AI Foundry + Prompty ตรงกับชื่อและเทคโนโลยีจริงในรีโพ  

#### ลบออก  
- **ai-document-processing**: ลบการอ้างอิงเทมเพลตที่ไม่ทำงาน (รีโพไม่เปิดเผยสู่สาธารณะในฐานะเทมเพลต AZD)  

#### ปรับปรุง  
- **📝 บทเรียน agents.md**: แบบฝึกหัด 1 แสดงผลลัพธ์ที่คาดหวังและขั้นตอน `azd monitor`; แบบฝึกหัด 2 เพิ่มโค้ดลงทะเบียน `FunctionTool` เต็มรูปแบบ; แบบฝึกหัด 3 แทนคำแนะนำคลุมเครือด้วยคำสั่ง `prepdocs.py` ที่เป็นรูปธรรม  
- **📚 แหล่งข้อมูล agents.md**: อัปเดตลิงก์เอกสารไปยังเอกสาร Azure AI Agent Service และ quickstart เวอร์ชันล่าสุด  
- **📋 ตารางขั้นตอนถัดไป agents.md**: เพิ่มลิงก์ AI Workshop Lab ครอบคลุมบทเรียนทั้งหมด  

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

#### ปรับปรุงการนำทางหลักสูตร  
**เวอร์ชันนี้ปรับปรุงการนำทาง README.md บทเรียนด้วยรูปแบบตารางที่ดียิ่งขึ้น**  

#### เปลี่ยนแปลง  
- **ตารางแผนที่หลักสูตร**: ปรับปรุงด้วยลิงก์บทเรียนโดยตรง, ประมาณเวลาการเรียน และการจัดอันดับความซับซ้อน  
- **ลบโฟลเดอร์เก่า**: ลบโฟลเดอร์ซ้ำซ้อนเก่า ๆ (deployment/, getting-started/, pre-deployment/, troubleshooting/)  
- **ตรวจสอบลิงก์**: ยืนยันลิงก์ภายในทั้งหมด 21+ รายการในตารางแผนที่หลักสูตร  

### [v3.16.0] - 2026-02-05  

#### อัปเดตชื่อผลิตภัณฑ์  
**เวอร์ชันนี้อัปเดตการอ้างอิงผลิตภัณฑ์ให้เป็นแบรนด์ Microsoft ปัจจุบัน**  

#### เปลี่ยนแปลง  
- **Microsoft Foundry → Microsoft Foundry**: อัปเดตการอ้างอิงทั้งหมดในไฟล์ที่ไม่ใช่การแปล  
- **Azure AI Agent Service → Foundry Agents**: เปลี่ยนชื่อบริการให้สอดคล้องกับแบรนด์ปัจจุบัน  

#### ไฟล์ที่อัปเดต  
- `README.md` - หน้าแรกหลักสูตร  
- `changelog.md` - ประวัติรุ่น  
- `course-outline.md` - โครงสร้างหลักสูตร  
- `docs/chapter-02-ai-development/agents.md` - คู่มือ AI agents  
- `examples/README.md` - เอกสารตัวอย่าง  
- `workshop/README.md` - หน้าแรก workshop  
- `workshop/docs/index.md` - ดัชนี workshop  
- `workshop/docs/instructions/*.md` - ไฟล์คำสั่ง workshop ทั้งหมด  

---

### [v3.15.0] - 2026-02-05  

#### การปรับโครงสร้างรีโพครั้งใหญ่: โฟลเดอร์ตามบทเรียน  
**เวอร์ชันนี้ปรับโครงสร้างเอกสารเป็นโฟลเดอร์แยกบทเรียนเพื่อการนำทางที่ชัดเจนขึ้น**  

#### เปลี่ยนชื่อโฟลเดอร์  
โฟลเดอร์เก่าถูกแทนที่ด้วยโฟลเดอร์หมายเลขบทเรียน:  
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`  
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`  
- `docs/deployment/` → `docs/chapter-04-infrastructure/`  
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`  
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`  
- เพิ่มใหม่: `docs/chapter-05-multi-agent/`  

#### ย้ายไฟล์  
| ไฟล์ | จาก | ไปที่ |  
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

#### เพิ่มเติม  
- **📚 ไฟล์ README ของแต่ละบท**: สร้าง README.md ในแต่ละโฟลเดอร์บทเรียน พร้อม:  
  - วัตถุประสงค์การเรียนรู้และระยะเวลา  
  - ตารางบทเรียนพร้อมคำอธิบาย  
  - คำสั่งเริ่มต้นด่วน  
  - การนำทางไปยังบทเรียนอื่น  

#### เปลี่ยนแปลง  
- **🔗 อัปเดตลิงก์ภายในทั้งหมด**: อัปเดตเส้นทางกว่า 78+ รายการทั่วเอกสารทั้งหมด  
- **🗺️ README.md หลัก**: อัปเดตแผนที่หลักสูตรด้วยโครงสร้างบทเรียนใหม่  
- **📝 examples/README.md**: อัปเดตการอ้างอิงข้ามไปยังโฟลเดอร์บทเรียน  

#### ลบออก  
- โครงสร้างโฟลเดอร์เก่า (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)  

---

### [v3.14.0] - 2026-02-05  

#### ปรับโครงสร้างรีโพ: การนำทางบทเรียน  
**เวอร์ชันนี้เพิ่มไฟล์ README สำหรับนำทางบทเรียน (ถูกแทนด้วย v3.15.0)**  

---

### [v3.13.0] - 2026-02-05  

#### คู่มือ AI Agents ใหม่  
**เวอร์ชันนี้เพิ่มคู่มือครบถ้วนสำหรับการปรับใช้ AI agents ด้วย Azure Developer CLI**  

#### เพิ่ม  
- **🤖 docs/microsoft-foundry/agents.md**: คู่มือครบถ้วนครอบคลุม:  
  - AI agents คืออะไรและแตกต่างจากแชทบอทอย่างไร  
  - 3 เทมเพลตเริ่มต้นสำหรับเอเจนต์ (Foundry Agents, Prompty, RAG)  
  - แพตเทิร์นสถาปัตยกรรมเอเจนต์ (เอเจนต์เดียว, RAG, หลายเอเจนต์)  
  - การกำหนดค่าเครื่องมือและปรับแต่ง  
  - การตรวจสอบและติดตามเมตริก  
  - การพิจารณาค่าใช้จ่ายและการเพิ่มประสิทธิภาพ  
  - กรณีแก้ปัญหาทั่วไป  
  - แบบฝึกหัด 3 แบบพร้อมเกณฑ์ความสำเร็จ  

#### โครงสร้างเนื้อหา  
- **บทนำ**: แนวคิดเอเจนต์สำหรับผู้เริ่มต้น  
- **เริ่มต้นอย่างรวดเร็ว**: การปรับใช้เอเจนต์ด้วย `azd init --template get-started-with-ai-agents`  
- **แพตเทิร์นสถาปัตยกรรม**: แผนภาพแสดงรูปแบบเอเจนต์  
- **การกำหนดค่า**: การตั้งค่าเครื่องมือและตัวแปรสภาพแวดล้อม  
- **การติดตาม**: บูรณาการ Application Insights  
- **แบบฝึกหัด**: การเรียนรู้ปฏิบัติทีละขั้น (20-45 นาทีแต่ละแบบ)  

---

### [v3.12.0] - 2026-02-05  

#### อัปเดตสภาพแวดล้อม DevContainer  
**เวอร์ชันนี้อัปเดตคอนฟิกคอนเทนเนอร์พัฒนาให้ใช้เครื่องมือใหม่ ๆ และค่าดีฟอลต์ที่ดีขึ้นสำหรับประสบการณ์การเรียนรู้ AZD**  

#### เปลี่ยนแปลง  
- **🐳 เบสอิมเมจ**: อัปเดตจาก `python:3.12-bullseye` เป็น `python:3.12-bookworm` (Debian stable ล่าสุด)  
- **📛 ชื่อคอนเทนเนอร์**: เปลี่ยนจาก "Python 3" เป็น "AZD for Beginners" เพื่อความชัดเจน  

#### เพิ่ม  
- **🔧 ฟีเจอร์ใหม่ Dev Container**:  
  - เปิดใช้ `azure-cli` พร้อมรองรับ Bicep  
  - `node:20` (เวอร์ชัน LTS สำหรับเทมเพลต AZD)  
  - `github-cli` สำหรับจัดการเทมเพลต  
  - `docker-in-docker` สำหรับปรับใช้ container app  

- **🔌 การส่งต่อพอร์ต**: ตั้งค่าพอร์ตล่วงหน้าสำหรับการพัฒนาทั่วไป:  
  - 8000 (ดูตัวอย่าง MkDocs)  
  - 3000 (เว็บแอป)  
  - 5000 (Python Flask)  
  - 8080 (API)  

- **🧩 ส่วนขยาย VS Code ใหม่**:  
  - `ms-python.vscode-pylance` - IntelliSense Python ที่ดีขึ้น  
  - `ms-azuretools.vscode-azurefunctions` - รองรับ Azure Functions  
  - `ms-azuretools.vscode-docker` - รองรับ Docker  
  - `ms-azuretools.vscode-bicep` - รองรับภาษา Bicep  
  - `ms-azure-devtools.azure-resource-groups` - การจัดการทรัพยากร Azure  
  - `yzhang.markdown-all-in-one` - แก้ไข Markdown  
  - `DavidAnson.vscode-markdownlint` - ตรวจสอบ Markdown  
  - `bierner.markdown-mermaid` - รองรับแผนภาพ Mermaid  
  - `redhat.vscode-yaml` - รองรับ YAML (สำหรับ azure.yaml)  
  - `eamodio.gitlens` - แสดงภาพ Git  
  - `mhutchie.git-graph` - ประวัติ Git  

- **⚙️ การตั้งค่า VS Code**: เพิ่มการตั้งค่าเริ่มต้นสำหรับ Python interpreter, จัดรูปแบบตอนบันทึก, และตัดช่องว่าง  

- **📦 อัปเดต requirements-dev.txt**:  
  - เพิ่มปลั๊กอิน minify สำหรับ MkDocs  
  - เพิ่ม pre-commit สำหรับคุณภาพโค้ด  
  - เพิ่มแพ็กเกจ Azure SDK (azure-identity, azure-mgmt-resource)  

#### แก้ไขแล้ว  
- **คำสั่งหลังสร้าง**: ตอนนี้ตรวจสอบการติดตั้ง AZD และ Azure CLI เมื่อเริ่มคอนเทนเนอร์  

---

### [v3.11.0] - 2026-02-05  

#### ปรับปรุง README ให้เหมาะกับมือใหม่  
**เวอร์ชันนี้ปรับปรุง README.md อย่างมากเพื่อให้ง่ายขึ้นสำหรับมือใหม่และเพิ่มแหล่งข้อมูลสำคัญสำหรับนักพัฒนา AI**  

#### เพิ่ม  
- **🆚 เปรียบเทียบ Azure CLI กับ AZD**: อธิบายอย่างชัดเจนว่าเมื่อไรควรใช้เครื่องมือแต่ละอย่าง พร้อมตัวอย่างใช้งานจริง  
- **🌟 ลิงก์ Awesome AZD**: ลิงก์ตรงไปยังแกลเลอรีเทมเพลตของชุมชน และทรัพยากรการร่วมสร้าง:  
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - เทมเพลตพร้อมใช้งานกว่า 200 รายการ  
  - [ส่งเทมเพลต](https://github.com/Azure/awesome-azd/issues) - การร่วมสร้างจากชุมชน  
- **🎯 คู่มือเริ่มต้นด่วน**: ส่วนเริ่มต้น 3 ขั้นตอนง่ายๆ (ติดตั้ง → เข้าสู่ระบบ → ปรับใช้)  
- **📊 ตารางนำทางตามประสบการณ์**: แนะนำชัดเจนว่าควรเริ่มจากตรงไหนตามระดับประสบการณ์นักพัฒนา  

#### เปลี่ยนแปลง  
- **โครงสร้าง README**: จัดเรียงใหม่เพื่อเปิดเผยข้อมูลสำคัญก่อน  
- **ส่วนบทนำ**: เขียนใหม่อธิบาย "เวทมนตร์ของ `azd up`" สำหรับมือใหม่  
- **ลบเนื้อหาซ้ำ**: ลบส่วนแก้ไขปัญหาที่ซ้ำกัน  
- **คำสั่งแก้ปัญหา**: แก้ไขการอ้างอิง `azd logs` เป็น `azd monitor --logs` ที่ถูกต้อง  

#### แก้ไขแล้ว  

- **🔐 คำสั่งการพิสูจน์ตัวตน**: เพิ่ม `azd auth login` และ `azd auth logout` ใน cheat-sheet.md
- **การอ้างอิงคำสั่งที่ไม่ถูกต้อง**: ลบคำสั่ง `azd logs` ที่เหลืออยู่จากส่วนแก้ไขปัญหาใน README

#### หมายเหตุ
- **ขอบเขต**: การเปลี่ยนแปลงถูกนำไปใช้กับ README.md หลักและ resources/cheat-sheet.md
- **กลุ่มเป้าหมาย**: การปรับปรุงที่มุ่งเน้นนักพัฒนาที่ใหม่กับ AZD โดยเฉพาะ

---

### [v3.10.0] - 2026-02-05

#### การอัพเดตความถูกต้องของคำสั่ง Azure Developer CLI
**เวอร์ชันนี้แก้ไขคำสั่ง AZD ที่ไม่มีอยู่ในเอกสารทั้งหมด เพื่อให้ตัวอย่างโค้ดทั้งหมดใช้ไวยากรณ์ Azure Developer CLI ที่ถูกต้อง**

#### แก้ไขแล้ว
- **🔧 ลบคำสั่ง AZD ที่ไม่มีอยู่**: ตรวจสอบและแก้ไขคำสั่งที่ไม่ถูกต้องอย่างครอบคลุม:
  - `azd logs` (ไม่มีอยู่จริง) → แทนที่ด้วย `azd monitor --logs` หรือทางเลือก Azure CLI
  - คำสั่งย่อย `azd service` (ไม่มีอยู่จริง) → แทนที่ด้วย `azd show` และ Azure CLI
  - คำสั่ง `azd infra import/export/validate` (ไม่มีอยู่จริง) → ลบหรือแทนที่ด้วยทางเลือกที่ถูกต้อง
  - แฟล็ก `azd deploy --rollback/--incremental/--parallel/--detect-changes` (ไม่มีอยู่จริง) → ลบออก
  - แฟล็ก `azd provision --what-if/--rollback` (ไม่มีอยู่จริง) → อัพเดตใช้ `--preview`
  - `azd config validate` (ไม่มีอยู่จริง) → แทนที่ด้วย `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ไม่มีอยู่จริง) → ลบออก

- **📚 ไฟล์ที่อัพเดตด้วยการแก้ไขคำสั่ง**:
  - `resources/cheat-sheet.md`: ปรับปรุงการอ้างอิงคำสั่งครั้งใหญ่
  - `docs/deployment/deployment-guide.md`: แก้ไขกลยุทธ์ rollback และ deployment
  - `docs/troubleshooting/debugging.md`: แก้ไขส่วนวิเคราะห์ล็อก
  - `docs/troubleshooting/common-issues.md`: อัพเดตคำสั่งแก้ไขปัญหา
  - `docs/troubleshooting/ai-troubleshooting.md`: แก้ไขส่วนดีบัก AZD
  - `docs/getting-started/azd-basics.md`: แก้ไขคำสั่งมอนิเตอร์
  - `docs/getting-started/first-project.md`: อัพเดตตัวอย่างมอนิเตอร์และดีบัก
  - `docs/getting-started/installation.md`: แก้ไขตัวอย่างช่วยเหลือและเวอร์ชัน
  - `docs/pre-deployment/application-insights.md`: แก้ไขคำสั่งดูล็อก
  - `docs/pre-deployment/coordination-patterns.md`: แก้ไขคำสั่งดีบักของเอเย่นต์

- **📝 อัพเดตการอ้างอิงเวอร์ชัน**: 
  - `docs/getting-started/installation.md`: เปลี่ยนเลขเวอร์ชันตายตัว `1.5.0` เป็น `1.x.x` พร้อมลิงก์ไปยังเวอร์ชันต่างๆ

#### เปลี่ยนแปลง
- **กลยุทธ์ Rollback**: อัพเดตเอกสารให้ใช้ rollback ผ่าน Git (AZD ไม่มี rollback ในตัว)
- **การดูล็อก**: แทนที่การอ้างอิง `azd logs` ด้วย `azd monitor --logs`, `azd monitor --live` และคำสั่ง Azure CLI
- **ส่วนประสิทธิภาพ**: ลบแฟล็ก deployment แบบขนาน/เพิ่มทีละน้อยที่ไม่มีอยู่ และเพิ่มทางเลือกที่ถูกต้อง

#### รายละเอียดทางเทคนิค
- **คำสั่ง AZD ที่ถูกต้อง**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **แฟล็ก `azd monitor` ที่ถูกต้อง**: `--live`, `--logs`, `--overview`
- **ฟีเจอร์ที่ถูกลบ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### หมายเหตุ
- **การตรวจสอบความถูกต้อง**: คำสั่งได้รับการตรวจสอบกับ Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### อัพเดตความสมบูรณ์ของเวิร์กชอปและคุณภาพเอกสาร
**เวอร์ชันนี้เสร็จสมบูรณ์โมดูลเวิร์กชอปเชิงโต้ตอบ แก้ไขลิงก์เอกสารที่เสียทั้งหมด และปรับปรุงคุณภาพเนื้อหาโดยรวมสำหรับนักพัฒนาปัญญาประดิษฐ์ที่ใช้ Microsoft AZD**

#### เพิ่มเติม
- **📝 CONTRIBUTING.md**: เอกสารแนวทางการมีส่วนร่วมใหม่ พร้อม:
  - คำแนะนำชัดเจนสำหรับการรายงานปัญหาและเสนอการเปลี่ยนแปลง
  - มาตรฐานเอกสารสำหรับเนื้อหาใหม่
  - แนวทางตัวอย่างโค้ดและรูปแบบข้อความ commit
  - ข้อมูลการมีส่วนร่วมของชุมชน

#### เสร็จสมบูรณ์
- **🎯 เวิร์กชอปโมดูล 7 (สรุป)**: เสร็จสมบูรณ์โมดูลสรุป พร้อม:
  - สรุปผลงานเวิร์กชอปอย่างครอบคลุม
  - ส่วนแนวคิดหลักที่เชี่ยวชาญเกี่ยวกับ AZD, เทมเพลต และ Microsoft Foundry
  - คำแนะนำการเรียนรู้ต่อเนื่อง
  - แบบฝึกหัดความท้าทายในเวิร์กชอปพร้อมระดับความยาก
  - ลิงก์คำติชมและสนับสนุนจากชุมชน

- **📚 เวิร์กชอปโมดูล 3 (การแยกส่วน)**: อัพเดตวัตถุประสงค์การเรียนรู้ พร้อม:
  - คำแนะนำการเปิดใช้งาน GitHub Copilot กับเซิร์ฟเวอร์ MCP
  - ความเข้าใจโครงสร้างโฟลเดอร์เทมเพลต AZD
  - รูปแบบการจัดการ Infrastructure-as-code (Bicep)
  - คำแนะนำการฝึกปฏิบัติในห้องแล็บ

- **🔧 เวิร์กชอปโมดูล 6 (การรื้อถอน)**: เสร็จสมบูรณ์ พร้อม:
  - วัตถุประสงค์การทำความสะอาดทรัพยากรและการจัดการค่าใช้จ่าย
  - การใช้ `azd down` เพื่อถอนการจัดเตรียมโครงสร้างพื้นฐานอย่างปลอดภัย
  - คำแนะนำการกู้คืนบริการปัญญาประดิษฐ์ที่ถูกลบแบบอ่อน
  - คำแนะนำเสริมสำหรับ GitHub Copilot และ Azure Portal

#### แก้ไขแล้ว
- **🔗 แก้ไขลิงก์เสีย**: แก้ไขลิงก์ภายในเอกสารที่เสียกว่า 15 แห่ง:
  - `docs/ai-foundry/ai-model-deployment.md`: แก้ไขเส้นทางไปยัง microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: แก้ไขเส้นทาง ai-model-deployment.md และ production-ai-practices.md
  - `docs/getting-started/first-project.md`: แทนที่ cicd-integration.md ที่ไม่มีด้วย deployment-guide.md
  - `examples/retail-scenario.md`: แก้ไขเส้นทาง FAQ และคำแนะนำแก้ปัญหา
  - `examples/container-app/microservices/README.md`: แก้ไขเส้นทางหลักสูตรและ deployment guide
  - `resources/faq.md` และ `resources/glossary.md`: อัพเดตการอ้างอิงบท AI
  - `course-outline.md`: แก้ไขการอ้างอิงคู่มือผู้สอนและห้องแล็บเวิร์กชอป AI

- **📅 ป้ายสถานะเวิร์กชอป**: อัพเดตจาก "กำลังก่อสร้าง" เป็นสถานะเวิร์กชอปที่ใช้งานได้พร้อมวันที่กุมภาพันธ์ 2026

- **🔗 การนำทางเวิร์กชอป**: แก้ไขลิงก์การนำทางเสียใน README.md ของเวิร์กชอปที่ชี้ไปยังโฟลเดอร์ lab-1-azd-basics ที่ไม่มีอยู่จริง

#### เปลี่ยนแปลง
- **การแสดงผลเวิร์กชอป**: ลบคำเตือน "กำลังก่อสร้าง" เวิร์กชอปเสร็จสมบูรณ์และพร้อมใช้งานแล้ว
- **ความสอดคล้องของการนำทาง**: ตรวจสอบให้แน่ใจว่าโมดูลเวิร์กชอปทั้งหมดมีการนำทางข้ามโมดูลอย่างถูกต้อง
- **อ้างอิงเส้นทางการเรียนรู้**: อัพเดตการอ้างอิงบทให้ใช้เส้นทาง microsoft-foundry ที่ถูกต้อง

#### ผ่านการตรวจสอบ
- ✅ ไฟล์ markdown ภาษาอังกฤษทั้งหมดมีลิงก์ภายในที่ถูกต้อง
- ✅ โมดูลเวิร์กชอป 0-7 เสร็จสมบูรณ์พร้อมวัตถุประสงค์การเรียนรู้
- ✅ การนำทางระหว่างบทและโมดูลทำงานได้อย่างถูกต้อง
- ✅ เนื้อหาเหมาะสำหรับนักพัฒนาปัญญาประดิษฐ์ที่ใช้ Microsoft AZD
- ✅ ใช้ภาษาที่เป็นมิตรกับผู้เริ่มต้นและโครงสร้างที่เหมาะสมตลอด
- ✅ CONTRIBUTING.md มีคำแนะนำที่ชัดเจนสำหรับผู้ที่มีส่วนร่วมในชุมชน

#### การนำไปใช้งานทางเทคนิค
- **การตรวจสอบลิงก์**: สคริปต์ PowerShell อัตโนมัติยืนยันลิงก์ .md ภายในทั้งหมด
- **การตรวจสอบเนื้อหา**: ตรวจทานด้วยมือเพื่อประเมินความสมบูรณ์ของเวิร์กชอปและความเหมาะสมกับผู้เริ่มต้น
- **ระบบการนำทาง**: ใช้รูปแบบการนำทางระหว่างบทและโมดูลอย่างสม่ำเสมอ

#### หมายเหตุ
- **ขอบเขต**: การเปลี่ยนแปลงถูกใช้กับเอกสารภาษาอังกฤษเท่านั้น
- **การแปล**: โฟลเดอร์แปลยังไม่อัพเดตในเวอร์ชันนี้ (การแปลอัตโนมัติจะซิงค์ภายหลัง)
- **ระยะเวลาเวิร์กชอป**: เวิร์กชอปสมบูรณ์ตอนนี้ใช้เวลาฝึกปฏิบัติ 3-4 ชั่วโมง

---

### [v3.8.0] - 2025-11-19

#### เอกสารขั้นสูง: การมอนิเตอร์ ความปลอดภัย และรูปแบบหลายเอเย่นต์
**เวอร์ชันนี้เพิ่มบทเรียนระดับ A ครบถ้วนเกี่ยวกับการรวม Application Insights รูปแบบการพิสูจน์ตัวตน และการประสานงานหลายเอเย่นต์สำหรับการดีพลอยในสภาพแวดล้อมการผลิต**

#### เพิ่มเติม
- **📊 บทเรียนการรวม Application Insights**: ใน `docs/pre-deployment/application-insights.md`:
  - การดีพลอยโฟกัส AZD พร้อมการจัดเตรียมอัตโนมัติ
  - เทมเพลต Bicep ครบชุดสำหรับ Application Insights + Log Analytics
  - แอป Python ที่ทำงานได้พร้อมเทเลเมทรีกำหนดเอง (กว่า 1,200 บรรทัด)
  - รูปแบบมอนิเตอร์ AI/LLM (ติดตามโทเค็น/ค่าใช้จ่ายของโมเดล Microsoft Foundry)
  - แผนภาพ Mermaid 6 แผนภาพ (สถาปัตยกรรม, การติดตามแบบกระจาย, กระแสเทเลเมทรี)
  - แบบฝึกหัด 3 ชุด (แจ้งเตือน, แดชบอร์ด, มอนิเตอร์ AI)
  - ตัวอย่างการสืบค้น Kusto และกลยุทธ์การเพิ่มประสิทธิภาพค่าใช้จ่าย
  - การสตรีมมิงเมตริกซ์สดและดีบักแบบเรียลไทม์
  - เวลาเรียนรู้ 40-50 นาทีพร้อมรูปแบบที่พร้อมใช้ในสภาพแวดล้อมผลิต

- **🔐 บทเรียนรูปแบบการพิสูจน์ตัวตน & ความปลอดภัย**: ใน `docs/getting-started/authsecurity.md`:
  - รูปแบบการพิสูจน์ตัวตน 3 แบบ (สายการเชื่อมต่อ, Key Vault, managed identity)
  - เทมเพลตโครงสร้างพื้นฐาน Bicep ครบชุดสำหรับการดีพลอยที่ปลอดภัย
  - โค้ดแอป Node.js รวมกับ Azure SDK
  - แบบฝึกหัดครบ 3 ชุด (เปิดใช้งาน managed identity, user-assigned identity, การหมุน Key Vault)
  - แนวทางปฏิบัติด้านความปลอดภัยและการตั้งค่า RBAC
  - คู่มือแก้ไขปัญหาและการวิเคราะห์ค่าใช้จ่าย
  - รูปแบบการพิสูจน์ตัวตนแบบไม่ใช้รหัสผ่านพร้อมใช้งานสำหรับสภาพแวดล้อมผลิต

- **🤖 บทเรียนรูปแบบการประสานงานหลายเอเย่นต์**: ใน `docs/pre-deployment/coordination-patterns.md`:
  - รูปแบบการประสานงาน 5 แบบ (ลำดับ, ขนาน, ลำดับชั้น, เหตุการณ์ขับเคลื่อน, ฉันทามติ)
  - การใช้งานเซอร์วิส orchestration ครบชุด (Python/Flask, กว่า 1,500 บรรทัด)
  - การใช้งานเอเย่นต์เฉพาะทาง 3 ตัว (Research, Writer, Editor)
  - การผสานรวม Service Bus สำหรับคิวข้อความ
  - การจัดการสถานะ Cosmos DB สำหรับระบบกระจาย
  - แผนภาพ Mermaid 6 แผนภาพแสดงการปฏิสัมพันธ์ของเอเย่นต์
  - แบบฝึกหัดขั้นสูง 3 ชุด (การจัดการเวลาหมด, การลองใหม่, ตัวตัดวงจร)
  - การแบ่งแยกค่าใช้จ่าย ($240-565/เดือน) พร้อมกลยุทธ์การเพิ่มประสิทธิภาพ
  - การรวม Application Insights สำหรับการมอนิเตอร์

#### ปรับปรุง
- **บทก่อนการดีพลอย**: ตอนนี้รวมรูปแบบการมอนิเตอร์และประสานงานแบบครบถ้วน
- **บทเริ่มต้น**: ปรับปรุงด้วยรูปแบบการพิสูจน์ตัวตนแบบมืออาชีพ
- **ความพร้อมใช้งานในสภาพแวดล้อมผลิต**: ครอบคลุมตั้งแต่ความปลอดภัยถึงการสังเกตการณ์
- **โครงร่างหลักสูตร**: อัพเดตการอ้างอิงบทเรียนใหม่ในบทที่ 3 และ 6

#### เปลี่ยนแปลง
- **ลำดับการเรียนรู้**: การผสานรูปแบบความปลอดภัยและการมอนิเตอร์ที่ดีขึ้นตลอดหลักสูตร
- **คุณภาพเอกสาร**: มาตรฐานระดับ A ที่สม่ำเสมอ (95-97%) ในบทเรียนใหม่ทั้งหมด
- **รูปแบบการผลิต**: ครอบคลุมครบทุกขั้นตอนการดีพลอยระดับองค์กร

#### ปรับปรุงเพิ่มเติม
- **ประสบการณ์นักพัฒนา**: เส้นทางชัดเจนจากการพัฒนาถึงการมอนิเตอร์ในสภาพแวดล้อมผลิต
- **มาตรฐานความปลอดภัย**: รูปแบบมืออาชีพสำหรับการพิสูจน์ตัวตนและการจัดการความลับ
- **การสังเกตการณ์**: การรวม Application Insights แบบครบถ้วนกับ AZD
- **งาน AI**: การมอนิเตอร์เฉพาะทางสำหรับ Microsoft Foundry Models และระบบหลายเอเย่นต์

#### ผ่านการตรวจสอบ
- ✅ บทเรียนทั้งหมดมีโค้ดทำงานครบถ้วน (ไม่ใช่แค่ตัวอย่างโค้ด)
- ✅ แผนภาพ Mermaid สำหรับการเรียนรู้เชิงภาพ (ทั้งหมด 19 แผนภาพใน 3 บทเรียน)
- ✅ แบบฝึกหัดเชิงปฏิบัติมีขั้นตอนตรวจสอบ (ทั้งหมด 9 แบบฝึกหัด)
- ✅ เทมเพลต Bicep พร้อมใช้ในสภาพแวดล้อมผลิตสามารถดีพลอยผ่าน `azd up`
- ✅ การวิเคราะห์ค่าใช้จ่ายและกลยุทธ์การเพิ่มประสิทธิภาพ
- ✅ คู่มือแก้ไขปัญหาและแนวทางปฏิบัติที่ดีที่สุด
- ✅ จุดตรวจสอบความรู้พร้อมคำสั่งยืนยัน

#### ผลการให้คะแนนเอกสาร
- **docs/pre-deployment/application-insights.md**: - คู่มือมอนิเตอร์ครบถ้วน
- **docs/getting-started/authsecurity.md**: - รูปแบบความปลอดภัยมืออาชีพ
- **docs/pre-deployment/coordination-patterns.md**: - สถาปัตยกรรมหลายเอเย่นต์ขั้นสูง
- **เนื้อหาใหม่ทั้งหมด**: - มาตรฐานคุณภาพสูงอย่างสม่ำเสมอ

#### การนำไปใช้งานทางเทคนิค
- **Application Insights**: Log Analytics + เทเลเมทรีกำหนดเอง + การติดตามแบบกระจาย
- **การพิสูจน์ตัวตน**: Managed Identity + Key Vault + รูปแบบ RBAC
- **หลายเอเย่นต์**: Service Bus + Cosmos DB + Container Apps + การออร์เคสตรา
- **การมอนิเตอร์**: เมตริกซ์สด + การสืบค้น Kusto + แจ้งเตือน + แดชบอร์ด
- **การจัดการค่าใช้จ่าย**: กลยุทธ์สุ่มตัวอย่าง, นโยบายการเก็บรักษา, การควบคุมงบประมาณ

### [v3.7.0] - 2025-11-19

#### การปรับปรุงคุณภาพเอกสารและตัวอย่าง Microsoft Foundry Models ใหม่
**เวอร์ชันนี้ปรับปรุงคุณภาพเอกสารทั่วทั้งที่เก็บและเพิ่มตัวอย่างการดีพลอย Microsoft Foundry Models ที่สมบูรณ์พร้อมอินเทอร์เฟซแชท gpt-4.1**

#### เพิ่มเติม
- **🤖 ตัวอย่าง Microsoft Foundry Models แชท**: การดีพลอย gpt-4.1 ครบถ้วนพร้อมการใช้งานใน `examples/azure-openai-chat/`:
  - โครงสร้างพื้นฐาน Microsoft Foundry Models ครบถ้วน (ดีพลอยโมเดล gpt-4.1)
  - อินเทอร์เฟซแชทบรรทัดคำสั่ง Python พร้อมประวัติการสนทนา
  - ผสานรวม Key Vault สำหรับเก็บคีย์ API อย่างปลอดภัย
  - การติดตามการใช้โทเค็นและการประเมินค่าใช้จ่าย
  - การจำกัดอัตราและการจัดการข้อผิดพลาด
  - README ครบถ้วนพร้อมคู่มือการดีพลอย 35-45 นาที
  - ไฟล์พร้อมใช้งานในสภาพแวดล้อมผลิต 11 ไฟล์ (เทมเพลต Bicep, แอป Python, การตั้งค่า)
- **📚 แบบฝึกหัดเอกสาร**: เพิ่มแบบฝึกหัดปฏิบัติในคู่มือการตั้งค่า:
  - แบบฝึกหัด 1: การตั้งค่าหลายสภาพแวดล้อม (15 นาที)
  - แบบฝึกหัด 2: การจัดการความลับ (10 นาที)
  - เกณฑ์ความสำเร็จและขั้นตอนตรวจสอบที่ชัดเจน
- **✅ การยืนยันการดีพลอย**: เพิ่มส่วนตรวจสอบในคู่มือการดีพลอย:
  - ขั้นตอนตรวจสุขภาพ
  - รายการตรวจสอบเกณฑ์ความสำเร็จ
  - ผลลัพธ์ที่คาดหวังสำหรับคำสั่งดีพลอยทั้งหมด
  - อ้างอิงด่วนแก้ไขปัญหา

#### ปรับปรุง
- **examples/README.md**: อัพเดตคุณภาพเป็นระดับ A (93%):
  - เพิ่ม azure-openai-chat ในทุกส่วนที่เกี่ยวข้อง
  - อัพเดตจำนวนตัวอย่างในเครื่องจาก 3 เป็น 4
  - เพิ่มในตารางตัวอย่างแอป AI
  - รวมเข้ากับ Quick Start สำหรับผู้ใช้ระดับกลาง
  - เพิ่มในส่วน Microsoft Foundry Templates
  - อัพเดต Comparison Matrix และส่วนการค้นหาเทคโนโลยี
- **คุณภาพเอกสาร**: ปรับปรุงจาก B+ (87%) → A- (92%) ทั่วโฟลเดอร์ docs:

  - เพิ่มผลลัพธ์ที่คาดหวังไปยังตัวอย่างคำสั่งที่สำคัญ
  - รวมขั้นตอนการตรวจสอบสำหรับการเปลี่ยนแปลงการกำหนดค่า
  - ปรับปรุงการเรียนรู้แบบลงมือทำด้วยแบบฝึกหัดเชิงปฏิบัติ

#### เปลี่ยนแปลง
- **ความก้าวหน้าในการเรียนรู้**: การผสมผสานตัวอย่าง AI สำหรับผู้เรียนระดับกลางดีขึ้น
- **โครงสร้างเอกสาร**: แบบฝึกหัดที่สามารถปฏิบัติได้มากขึ้นพร้อมผลลัพธ์ที่ชัดเจน
- **กระบวนการตรวจสอบ**: เพิ่มเกณฑ์ความสำเร็จที่ชัดเจนในเวิร์กโฟลว์สำคัญ

#### ปรับปรุง
- **ประสบการณ์นักพัฒนา**: การปรับใช้ Microsoft Foundry Models ใช้เวลา 35-45 นาที (เทียบกับ 60-90 สำหรับทางเลือกที่ซับซ้อน)
- **ความโปร่งใสของค่าใช้จ่าย**: การประมาณค่าใช้จ่ายชัดเจน ($50-200/เดือน) สำหรับตัวอย่าง Microsoft Foundry Models
- **เส้นทางการเรียนรู้**: นักพัฒนา AI มีจุดเริ่มต้นที่ชัดเจนด้วย azure-openai-chat
- **มาตรฐานเอกสาร**: ผลลัพธ์ที่คาดหวังและขั้นตอนการตรวจสอบที่สอดคล้องกัน

#### ตรวจสอบแล้ว
- ✅ ตัวอย่าง Microsoft Foundry Models ทำงานได้สมบูรณ์ด้วย `azd up`
- ✅ ไฟล์การทำงาน 11 ไฟล์ทั้งหมดถูกต้องตามหลักไวยากรณ์
- ✅ คำแนะนำใน README ตรงกับประสบการณ์การปรับใช้จริง
- ✅ ลิงก์เอกสารอัปเดตในมากกว่า 8 แห่ง
- ✅ ดรรชนีตัวอย่างสะท้อนตัวอย่าง 4 ตัวอย่างในเครื่องอย่างถูกต้อง
- ✅ ไม่มีลิงก์ภายนอกซ้ำซ้อนในตาราง
- ✅ อ้างอิงการนำทางทั้งหมดถูกต้อง

#### การดำเนินการทางเทคนิค
- **สถาปัตยกรรม Microsoft Foundry Models**: gpt-4.1 + Key Vault + รูปแบบ Container Apps
- **ความปลอดภัย**: พร้อมใช้ Managed Identity, เก็บความลับใน Key Vault
- **การตรวจสอบ**: การผสาน Application Insights
- **การจัดการค่าใช้จ่าย**: การติดตามโทเค็นและการปรับแต่งการใช้
- **การปรับใช้**: คำสั่ง `azd up` เดียวสำหรับการตั้งค่าครบถ้วน

### [v3.6.0] - 2025-11-19

#### การอัปเดตหลัก: ตัวอย่างการปรับใช้ Container App
**เวอร์ชันนี้นำเสนอตัวอย่างการปรับใช้แอปคอนเทนเนอร์แบบครบวงจรพร้อมใช้งานจริงโดยใช้ Azure Developer CLI (AZD) พร้อมเอกสารครบถ้วนและผสานเข้ากับเส้นทางการเรียนรู้**

#### เพิ่มเติม
- **🚀 ตัวอย่าง Container App**: ตัวอย่างในเครื่องใหม่ที่ `examples/container-app/`:
  - [แนวทางหลัก](examples/container-app/README.md): ภาพรวมสมบูรณ์ของการปรับใช้แบบคอนเทนเนอร์, การเริ่มต้นรวดเร็ว, การผลิต, และรูปแบบขั้นสูง
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API ที่เหมาะสำหรับผู้เริ่มต้น พร้อมฟีเจอร์ scale-to-zero, ตรวจสุขภาพ, การตรวจสอบ และการแก้ไขปัญหา
  - [สถาปัตยกรรมไมโครเซอร์วิส](../../examples/container-app/microservices): การปรับใช้ระบบบริการหลายตัวพร้อมใช้งานจริง (API Gateway, Product, Order, User, Notification), การส่งข้อความแบบอะซิงค์, Service Bus, Cosmos DB, Azure SQL, การติดตามแบบกระจาย, การปรับใช้แบบ blue-green/canary
- **แนวปฏิบัติที่ดีที่สุด**: ความปลอดภัย, การตรวจสอบ, การปรับแต่งค่าใช้จ่าย, และคำแนะนำ CI/CD สำหรับเวิร์กโหลดแบบคอนเทนเนอร์
- **ตัวอย่างโค้ด**: `azure.yaml` สมบูรณ์, เทมเพลต Bicep, และการใช้งานบริการหลายภาษา (Python, Node.js, C#, Go)
- **การทดสอบ & การแก้ไขปัญหา**: สถานการณ์ทดสอบจากต้นทางถึงปลายทาง, คำสั่งตรวจสอบ, คำแนะนำแก้ไขปัญหา

#### เปลี่ยนแปลง
- **README.md**: อัปเดตให้แสดงและลิงก์ตัวอย่างแอปคอนเทนเนอร์ใหม่ภายใต้ "ตัวอย่างในเครื่อง - แอปคอนเทนเนอร์"
- **examples/README.md**: อัปเดตเน้นตัวอย่างแอปคอนเทนเนอร์, เพิ่มรายการเมทริกซ์เปรียบเทียบ, และอัปเดตการอ้างอิงเทคโนโลยี/สถาปัตยกรรม
- **โครงร่างหลักสูตร & คู่มือการศึกษา**: อัปเดตเพื่ออ้างอิงตัวอย่างแอปคอนเทนเนอร์และรูปแบบการปรับใช้ในบทที่เกี่ยวข้อง

#### ตรวจสอบแล้ว
- ✅ ตัวอย่างใหม่ทั้งหมดสามารถปรับใช้ได้ด้วย `azd up` และปฏิบัติตามแนวปฏิบัติที่ดีที่สุด
- ✅ อัปเดตลิงก์ข้ามเอกสารและการนำทาง
- ✅ ตัวอย่างครอบคลุมสถานการณ์ตั้งแต่ผู้เริ่มต้นถึงขั้นสูง รวมถึงไมโครเซอร์วิสในสภาพแวดล้อมผลิต

#### หมายเหตุ
- **ขอบเขต**: เอกสารและตัวอย่างเป็นภาษาอังกฤษเท่านั้น
- **ขั้นตอนถัดไป**: ขยายด้วยรูปแบบคอนเทนเนอร์ขั้นสูงเพิ่มเติมและระบบอัตโนมัติ CI/CD ในการอัปเดตในอนาคต

### [v3.5.0] - 2025-11-19

#### การรีแบรนด์ผลิตภัณฑ์: Microsoft Foundry
**เวอร์ชันนี้ดำเนินการเปลี่ยนชื่อผลิตภัณฑ์จาก "Microsoft Foundry" เป็น "Microsoft Foundry" ในเอกสารภาษาอังกฤษทั้งหมด สะท้อนถึงการรีแบรนด์อย่างเป็นทางการของไมโครซอฟท์**

#### เปลี่ยนแปลง
- **🔄 การอัปเดตชื่อผลิตภัณฑ์**: รีแบรนด์ครบถ้วนจาก "Microsoft Foundry" เป็น "Microsoft Foundry"
  - อัปเดตการอ้างอิงทั้งหมดในเอกสารภาษาอังกฤษในโฟลเดอร์ `docs/`
  - เปลี่ยนชื่อโฟลเดอร์: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - เปลี่ยนชื่อไฟล์: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - รวมทั้งหมด: อัปเดตการอ้างอิงเนื้อหา 23 รายการใน 7 ไฟล์เอกสาร

- **📁 การเปลี่ยนแปลงโครงสร้างโฟลเดอร์**:
  - เปลี่ยนชื่อ `docs/ai-foundry/` เป็น `docs/microsoft-foundry/`
  - อัปเดตการอ้างอิงข้ามทั้งหมดให้สอดคล้องกับโครงสร้างโฟลเดอร์ใหม่
  - ตรวจสอบลิงก์การนำทางทั่วทั้งเอกสาร

- **📄 การเปลี่ยนชื่อไฟล์**:
  - เปลี่ยนชื่อ `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - อัปเดตลิงก์ภายในทั้งหมดให้ชี้ไปยังชื่อไฟล์ใหม่

#### ไฟล์ที่อัปเดต
- **เอกสารบทเรียน** (7 ไฟล์):
  - `docs/microsoft-foundry/ai-model-deployment.md` - อัปเดตลิงก์การนำทาง 3 รายการ
  - `docs/microsoft-foundry/ai-workshop-lab.md` - อัปเดตการอ้างอิงชื่อผลิตภัณฑ์ 4 รายการ
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ใช้ Microsoft Foundry แล้ว (จากการอัปเดตก่อนหน้า)
  - `docs/microsoft-foundry/production-ai-practices.md` - อัปเดตอ้างอิง 3 รายการ (ภาพรวม, ฟีดแบ็คชุมชน, เอกสาร)
  - `docs/getting-started/azd-basics.md` - อัปเดตลิงก์ข้ามแหล่งข้อมูล 4 รายการ
  - `docs/getting-started/first-project.md` - อัปเดตลิงก์การนำทางบทที่ 2 รายการ
  - `docs/getting-started/installation.md` - อัปเดตลิงก์ไปยังบทถัดไป 2 รายการ
  - `docs/troubleshooting/ai-troubleshooting.md` - อัปเดตอ้างอิง 3 รายการ (การนำทาง, ชุมชน Discord)
  - `docs/troubleshooting/common-issues.md` - อัปเดตลิงก์การนำทาง 1 รายการ
  - `docs/troubleshooting/debugging.md` - อัปเดตลิงก์การนำทาง 1 รายการ

- **ไฟล์โครงสร้างหลักสูตร** (2 ไฟล์):
  - `README.md` - อัปเดตอ้างอิง 17 รายการ (ภาพรวมหลักสูตร, ชื่อบท, ส่วนเทมเพลต, ความคิดเห็นชุมชน)
  - `course-outline.md` - อัปเดตอ้างอิง 14 รายการ (ภาพรวม, วัตถุประสงค์การเรียนรู้, แหล่งข้อมูลบท)

#### ตรวจสอบแล้ว
- ✅ ไม่มีการอ้างอิงเส้นทางโฟลเดอร์ "ai-foundry" เหลือในเอกสารภาษาอังกฤษ
- ✅ ไม่มีรายการอ้างอิงชื่อผลิตภัณฑ์ "Microsoft Foundry" ที่เหลือในเอกสารภาษาอังกฤษ
- ✅ ลิงก์การนำทางทั้งหมดทำงานได้ตามโครงสร้างโฟลเดอร์ใหม่
- ✅ การเปลี่ยนชื่อไฟล์และโฟลเดอร์สำเร็จเรียบร้อย
- ✅ ตรวจสอบการอ้างอิงข้ามระหว่างบทเรียบร้อยแล้ว

#### หมายเหตุ
- **ขอบเขต**: การเปลี่ยนแปลงใช้กับเอกสารภาษาอังกฤษในโฟลเดอร์ `docs/` เท่านั้น
- **การแปล**: โฟลเดอร์การแปล (`translations/`) ยังไม่ได้รับการอัปเดตในเวอร์ชันนี้
- **เวิร์กช็อป**: วัสดุเวิร์กช็อป (`workshop/`) ยังไม่ได้รับการอัปเดตในเวอร์ชันนี้
- **ตัวอย่าง**: ไฟล์ตัวอย่างอาจยังคงมีการอ้างอิงชื่อแบบเก่า (จะอัปเดตในอนาคต)
- **ลิงก์ภายนอก**: URL ภายนอกและการอ้างอิงรีโพสิทอรี GitHub ยังคงเดิม

#### คู่มือการย้ายข้อมูลสำหรับผู้ร่วมพัฒนา
หากคุณมีสาขาในเครื่องหรือเอกสารที่อ้างอิงโครงสร้างเก่า:
1. อัปเดตการอ้างอิงโฟลเดอร์: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. อัปเดตการอ้างอิงไฟล์: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. แทนที่ชื่อผลิตภัณฑ์: "Microsoft Foundry" → "Microsoft Foundry"
4. ตรวจสอบลิงก์เอกสารภายในทั้งหมดว่ายังคงใช้งานได้

---

### [v3.4.0] - 2025-10-24

#### การพรีวิวโครงสร้างพื้นฐานและการปรับปรุงการตรวจสอบ
**เวอร์ชันนี้นำเสนอการสนับสนุนครอบคลุมสำหรับฟีเจอร์พรีวิว Azure Developer CLI ใหม่ และเพิ่มประสบการณ์ผู้ใช้ในเวิร์กช็อป**

#### เพิ่มเติม
- **🧪 เอกสารฟีเจอร์ azd provision --preview**: ครอบคลุมความสามารถพรีวิวโครงสร้างพื้นฐานใหม่อย่างละเอียด
  - การอ้างอิงคำสั่งและตัวอย่างการใช้งานในแผ่นชีท
  - การผสานในคู่มือ provisioning พร้อมกรณีใช้งานและข้อดี
  - การผสานการตรวจสอบก่อนบินสำหรับการตรวจสอบการปรับใช้ที่ปลอดภัยขึ้น
  - อัปเดตคู่มือเริ่มต้นด้วยแนวทางการปรับใช้ที่เน้นความปลอดภัยเป็นหลัก
- **🚧 แบนเนอร์สถานะเวิร์กช็อป**: แบนเนอร์ HTML มืออาชีพแสดงสถานะการพัฒนาเวิร์กช็อป
  - การออกแบบแบบไล่เฉดสีพร้อมสัญลักษณ์การก่อสร้างเพื่อการสื่อสารที่ชัดเจนกับผู้ใช้
  - ป้ายเวลาปรับปรุงล่าสุดเพื่อความโปร่งใส
  - การออกแบบตอบสนองสำหรับอุปกรณ์ทุกประเภท

#### ปรับปรุง
- **ความปลอดภัยโครงสร้างพื้นฐาน**: ฟังก์ชันการทำงานพรีวิวถูกรวมในเอกสารการปรับใช้ทั้งหมด
- **การตรวจสอบก่อนปรับใช้**: สคริปต์อัตโนมัติรวมการทดสอบพรีวิวโครงสร้างพื้นฐาน
- **เวิร์กโฟลว์นักพัฒนา**: อัปเดตลำดับคำสั่งให้รวมพรีวิวเป็นแนวปฏิบัติที่ดีที่สุด
- **ประสบการณ์เวิร์กช็อป**: กำหนดความคาดหวังที่ชัดเจนสำหรับผู้ใช้เกี่ยวกับสถานะการพัฒนาเนื้อหา

#### เปลี่ยนแปลง
- **แนวทางปฏิบัติที่ดีที่สุดในการปรับใช้**: แนะนำให้ใช้เวิร์กโฟลว์แบบพรีวิวเป็นอันดับแรก
- **การไหลของเอกสาร**: การตรวจสอบโครงสร้างพื้นฐานเลื่อนไปก่อนหน้านี้ในกระบวนการเรียนรู้
- **การนำเสนอเวิร์กช็อป**: การสื่อสารสถานะระดับมืออาชีพพร้อมไทม์ไลน์การพัฒนาที่ชัดเจน

#### ปรับปรุง
- **แนวทางเน้นความปลอดภัย**: สามารถตรวจสอบการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนการปรับใช้ได้
- **การทำงานร่วมกันของทีม**: สามารถแชร์ผลลัพธ์พรีวิวเพื่อการตรวจสอบและอนุมัติ
- **การรับรู้ค่าใช้จ่าย**: เข้าใจต้นทุนทรัพยากรก่อน provisioning ดีขึ้น
- **การลดความเสี่ยง**: ลดความล้มเหลวในการปรับใช้ด้วยการตรวจสอบล่วงหน้า

#### การดำเนินการทางเทคนิค
- **การผสานหลายเอกสาร**: ฟีเจอร์พรีวิวถูกบันทึกใน 4 ไฟล์สำคัญ
- **รูปแบบคำสั่ง**: ไวยากรณ์และตัวอย่างสอดคล้องทั่วเอกสาร
- **การผสมผสานแนวทางปฏิบัติที่ดีที่สุด**: พรีววิวถูกรวมในเวิร์กโฟลว์และสคริปต์ตรวจสอบ
- **ตัวบ่งชี้เชิงภาพ**: เครื่องหมายฟีเจอร์ใหม่ชัดเจนสำหรับการค้นพบ

#### โครงสร้างพื้นฐานเวิร์กช็อป
- **การสื่อสารสถานะ**: แบนเนอร์ HTML มืออาชีพพร้อมสไตล์ไล่เฉดสี
- **ประสบการณ์ผู้ใช้**: สถานะการพัฒนาชัดเจนป้องกันความสับสน
- **การนำเสนอระดับมืออาชีพ**: รักษาความน่าเชื่อถือของรีโพสิทอรีพร้อมกำหนดความคาดหวัง
- **ความโปร่งใสของไทม์ไลน์**: ป้ายเวลาปรับปรุงล่าสุด ต.ค. 2025 เพื่อความรับผิดชอบ

### [v3.3.0] - 2025-09-24

#### วัสดุเวิร์กช็อปที่ขยายและประสบการณ์การเรียนรู้เชิงปฏิสัมพันธ์
**เวอร์ชันนี้นำเสนอวัสดุเวิร์กช็อปครอบคลุมพร้อมคู่มือเชิงโต้ตอบบนเบราว์เซอร์และเส้นทางเรียนรู้ที่มีโครงสร้าง**

#### เพิ่มเติม
- **🎥 คู่มือเวิร์กช็อปเชิงโต้ตอบ**: ประสบการณ์เวิร์กช็อปบนเบราว์เซอร์พร้อมความสามารถพรีวิว MkDocs
- **📝 คำแนะนำเวิร์กช็อปที่มีโครงสร้าง**: เส้นทางเรียนรู้ 7 ขั้นตอนจากการค้นพบถึงการปรับแต่ง
  - 0-แนะนำ: ภาพรวมเวิร์กช็อปและการตั้งค่า
  - 1-เลือกเทมเพลต AI: กระบวนการค้นหาและเลือกเทมเพลต
  - 2-ตรวจสอบเทมเพลต AI: ขั้นตอนการปรับใช้และตรวจสอบ
  - 3-แยกส่วนเทมเพลต AI: ทำความเข้าใจสถาปัตยกรรมเทมเพลต
  - 4-กำหนดค่าเทมเพลต AI: การกำหนดค่าและปรับแต่ง
  - 5-ปรับแต่งเทมเพลต AI: การแก้ไขและปรับแต่งขั้นสูง
  - 6-รื้อถอนโครงสร้างพื้นฐาน: การทำความสะอาดและการจัดการทรัพยากร
  - 7-สรุป: บทสรุปและขั้นตอนถัดไป
- **🛠️ เครื่องมือเวิร์กช็อป**: การตั้งค่า MkDocs พร้อมธีม Material เพื่อประสบการณ์การเรียนรู้ที่ดีขึ้น
- **🎯 เส้นทางการเรียนรู้แบบลงมือทำ**: วิธี 3 ขั้นตอน (ค้นพบ → ปรับใช้ → ปรับแต่ง)
- **📱 การผสาน GitHub Codespaces**: การตั้งค่าสภาพแวดล้อมการพัฒนาอย่างราบรื่น

#### ปรับปรุง
- **ห้องทดลอง AI เวิร์กช็อป**: ขยายด้วยประสบการณ์การเรียนรู้ที่มีโครงสร้าง 2-3 ชั่วโมง
- **เอกสารเวิร์กช็อป**: การนำเสนออย่างมืออาชีพพร้อมการนำทางและสื่อภาพ
- **ความก้าวหน้าในการเรียนรู้**: คำแนะนำทีละขั้นตอนชัดเจนจากการเลือกเทมเพลตถึงการปรับใช้ในสภาพแวดล้อมผลิต
- **ประสบการณ์นักพัฒนา**: การผสมผสานเครื่องมือสำหรับเวิร์กโฟลว์การพัฒนาที่มีประสิทธิภาพ

#### ปรับปรุง
- **การเข้าถึง**: อินเทอร์เฟซบนเบราว์เซอร์พร้อมการค้นหา, คัดลอก, และสลับธีม
- **การเรียนรู้ตามจังหวะตัวเอง**: โครงสร้างเวิร์กช็อปรองรับความเร็วการเรียนรู้ที่แตกต่าง
- **การประยุกต์ใช้จริง**: สถานการณ์การปรับใช้เทมเพลต AI ในโลกจริง
- **การผสานชุมชน**: การผสาน Discord สำหรับการสนับสนุนและความร่วมมือในเวิร์กช็อป

#### ฟีเจอร์เวิร์กช็อป
- **การค้นหาในตัว**: ค้นหาคีย์เวิร์ดและบทเรียนอย่างรวดเร็ว
- **คัดลอกบล็อกโค้ด**: ฟังก์ชันเลื่อนเมาส์เพื่อคัดลอกสำหรับตัวอย่างโค้ดทั้งหมด
- **สลับธีม**: รองรับโหมดกลางคืน/กลางวันสำหรับความชอบต่างๆ
- **สื่อภาพ**: ภาพหน้าจอและไดอะแกรมเพื่อความเข้าใจที่ดีขึ้น
- **การผสานความช่วยเหลือ**: เข้าถึง Discord โดยตรงสำหรับการสนับสนุนชุมชน

### [v3.2.0] - 2025-09-17

#### การปรับโครงสร้างการนำทางครั้งใหญ่และระบบการเรียนรู้แบบแบ่งบท
**เวอร์ชันนี้แนะนำโครงสร้างการเรียนรู้แบบแบ่งบทที่ครอบคลุมพร้อมการนำทางที่ดีขึ้นตลอดทั้งรีโพสิทอรี**

#### เพิ่มเติม
- **📚 ระบบการเรียนรู้แบบแบ่งบท**: ปรับโครงสร้างหลักสูตรทั้งหมดเป็น 8 บทเรียนก้าวหน้า
  - บทที่ 1: พื้นฐานและเริ่มต้นอย่างรวดเร็ว (⭐ - 30-45 นาที)
  - บทที่ 2: การพัฒนา AI-First (⭐⭐ - 1-2 ชั่วโมง)
  - บทที่ 3: การกำหนดค่าและการพิสูจน์ตัวตน (⭐⭐ - 45-60 นาที)
  - บทที่ 4: โครงสร้างพื้นฐานเป็นรหัสและการปรับใช้ (⭐⭐⭐ - 1-1.5 ชั่วโมง)
  - บทที่ 5: โซลูชัน AI หลายตัวแทน (⭐⭐⭐⭐ - 2-3 ชั่วโมง)
  - บทที่ 6: การตรวจสอบและวางแผนก่อนปรับใช้ (⭐⭐ - 1 ชั่วโมง)
  - บทที่ 7: การแก้ไขปัญหาและดีบัก (⭐⭐ - 1-1.5 ชั่วโมง)
  - บทที่ 8: รูปแบบการผลิตและองค์กร (⭐⭐⭐⭐ - 2-3 ชั่วโมง)
- **📚 ระบบการนำทางครบวงจร**: หัวข้อและท้ายหน้าการนำทางสอดคล้องกันทั่วเอกสารทั้งหมด
- **🎯 การติดตามความก้าวหน้า**: รายการตรวจสอบการทำหลักสูตรให้เสร็จและระบบการตรวจสอบการเรียนรู้
- **🗺️ แนวทางเส้นทางการเรียนรู้**: จุดเข้าที่ชัดเจนสำหรับระดับประสบการณ์และเป้าหมายต่างๆ
- **🔗 การนำทางอ้างอิงข้าม**: การเชื่อมโยงบทเรียนที่เกี่ยวข้องและเงื่อนไขเบื้องต้นอย่างชัดเจน

#### ปรับปรุง
- **โครงสร้าง README**: ปรับเป็นแพลตฟอร์มการเรียนรู้ที่มีการจัดระเบียบตามบทเรียน
- **การนำทางเอกสาร**: ทุกหน้าประกอบด้วยบริบทบทเรียนและคำแนะนำความก้าวหน้า
- **การจัดระเบียบเทมเพลต**: ตัวอย่างและเทมเพลตแมปไปยังบทเรียนที่เหมาะสม

- **การบูรณาการทรัพยากร**: เอกสารช่วยจำ คำถามที่พบบ่อย และคู่มือการศึกษาเชื่อมโยงกับบทที่เกี่ยวข้อง
- **การบูรณาการเวิร์กช็อป**: ห้องปฏิบัติการเชิงปฏิบัติที่เชื่อมโยงกับเป้าหมายการเรียนรู้หลายบท

#### ได้เปลี่ยนแปลง
- **ลำดับการเรียนรู้**: ย้ายจากเอกสารเชิงเส้นไปสู่การเรียนรู้ที่ยืดหยุ่นโดยใช้บทเป็นฐาน
- **การวางตำแหน่งการกำหนดค่า**: ย้ายคู่มือการกำหนดค่าเป็นบทที่ 3 เพื่อให้การเรียนรู้เป็นไปอย่างราบรื่นยิ่งขึ้น
- **การบูรณาการเนื้อหา AI**: การรวมเนื้อหาเฉพาะ AI ที่ดีขึ้นตลอดการเดินทางการเรียนรู้
- **เนื้อหาการผลิต**: รูปแบบขั้นสูงถูกรวมในบทที่ 8 สำหรับผู้เรียนระดับองค์กร

#### ได้รับการปรับปรุง
- **ประสบการณ์ผู้ใช้**: เส้นทางนำทางที่ชัดเจนและตัวบ่งชี้ความก้าวหน้าของบท
- **การเข้าถึง**: รูปแบบการนำทางที่สม่ำเสมอเพื่อให้ง่ายต่อการเรียนหลักสูตร
- **การนำเสนอระดับมืออาชีพ**: โครงสร้างหลักสูตรสไตล์มหาวิทยาลัย เหมาะสำหรับการฝึกอบรมทั้งในเชิงวิชาการและองค์กร
- **ประสิทธิภาพการเรียนรู้**: ลดเวลาการค้นหาเนื้อหาที่เกี่ยวข้องผ่านการจัดระเบียบที่ดีขึ้น

#### การดำเนินการเชิงเทคนิค
- **หัวเรื่องการนำทาง**: มาตรฐานการนำทางบทในเอกสารกว่า 40 ไฟล์
- **ส่วนท้ายการนำทาง**: คำแนะนำการก้าวหน้าและตัวบ่งชี้การเสร็จสิ้นบทที่สม่ำเสมอ
- **การเชื่อมโยงข้าม**: ระบบลิงก์ภายในอย่างครบถ้วนที่เชื่อมโยงแนวคิดที่เกี่ยวข้อง
- **การทำแผนที่บท**: แม่แบบและตัวอย่างที่เชื่อมโยงอย่างชัดเจนกับเป้าหมายการเรียนรู้

#### การปรับปรุงคู่มือการศึกษา
- **📚 เป้าหมายการเรียนรู้อย่างครบถ้วน**: ปรับโครงสร้างคู่มือการศึกษาให้สอดคล้องกับระบบ 8 บท
- **🎯 การประเมินผลแบบบทเป็นฐาน**: แต่ละบทประกอบด้วยเป้าหมายการเรียนรู้เฉพาะและแบบฝึกหัดเชิงปฏิบัติ
- **📋 การติดตามความก้าวหน้า**: กำหนดการเรียนรู้รายสัปดาห์พร้อมผลลัพธ์ที่วัดได้และรายการตรวจสอบการเสร็จสิ้น
- **❓ คำถามการประเมินผล**: คำถามยืนยันความรู้สำหรับแต่ละบทพร้อมผลลัพธ์ระดับมืออาชีพ
- **🛠️ แบบฝึกหัดเชิงปฏิบัติ**: กิจกรรมปฏิบัติพร้อมสถานการณ์การปรับใช้จริงและการแก้ไขปัญหา
- **📊 ความก้าวหน้าทักษะ**: ความก้าวหน้าชัดเจนจากแนวคิดพื้นฐานสู่รูปแบบองค์กรพร้อมโฟกัสการพัฒนาอาชีพ
- **🎓 กรอบการรับรอง**: ผลลัพธ์การพัฒนาวิชาชีพและระบบการยอมรับในชุมชน
- **⏱️ การจัดการไทม์ไลน์**: แผนการเรียนรู้ระยะเวลา 10 สัปดาห์ พร้อมการตรวจสอบจุดสำคัญ

### [v3.1.0] - 2025-09-17

#### การปรับปรุงโซลูชัน AI หลายตัวแทน
**เวอร์ชันนี้ปรับปรุงโซลูชันค้าปลีกหลายตัวแทนด้วยการตั้งชื่อตัวแทนที่ดีขึ้นและเอกสารที่ได้รับการปรับปรุง**

#### ได้เปลี่ยนแปลง
- **คำศัพท์หลายตัวแทน**: แทนที่ "ตัวแทนโคระ" ด้วย "ตัวแทนลูกค้า" ในโซลูชันค้าปลีกหลายตัวแทนเพื่อความเข้าใจที่ชัดเจนขึ้น
- **สถาปัตยกรรมตัวแทน**: อัปเดตเอกสาร แม่แบบ ARM และตัวอย่างโค้ดให้ใช้ชื่อตัวแทน "Customer agent" อย่างสม่ำเสมอ
- **ตัวอย่างการกำหนดค่า**: ปรับปรุงรูปแบบการกำหนดค่าตัวแทนด้วยการตั้งชื่อที่ทันสมัย
- **ความสอดคล้องของเอกสาร**: รับรองว่าอ้างอิงทั้งหมดใช้ชื่อตัวแทนที่เป็นมืออาชีพและมีคำอธิบาย

#### ได้รับการปรับปรุง
- **แพ็คเกจแม่แบบ ARM**: อัปเดต retail-multiagent-arm-template พร้อมการอ้างอิง Customer agent
- **แผนภาพสถาปัตยกรรม**: ปรับปรุงแผนภาพ Mermaid พร้อมชื่อทตัวแทนอัปเดต
- **ตัวอย่างโค้ด**: คลาส Python และตัวอย่างการนำไปใช้ใช้ชื่อ CustomerAgent
- **ตัวแปรสภาพแวดล้อม**: ปรับสคริปต์การปรับใช้ทั้งหมดใช้รูปแบบ CUSTOMER_AGENT_NAME

#### ได้รับการปรับปรุง
- **ประสบการณ์นักพัฒนา**: บทบาทและความรับผิดชอบของตัวแทนชัดเจนในเอกสาร
- **ความพร้อมใช้งานในผลิต**: การตั้งชื่อที่สอดคล้องกับองค์กรดีขึ้น
- **วัสดุการเรียนรู้**: การตั้งชื่อตัวแทนที่เข้าใจง่ายขึ้นเพื่อการศึกษา
- **การใช้งานแม่แบบ**: ความเข้าใจง่ายขึ้นเกี่ยวกับหน้าที่ตัวแทนและรูปแบบการปรับใช้

#### รายละเอียดเชิงเทคนิค
- อัปเดตแผนภาพสถาปัตยกรรม Mermaid พร้อมการอ้างอิง CustomerAgent
- แทนที่ชื่อคลาส CoraAgent ด้วย CustomerAgent ในตัวอย่าง Python
- ปรับแต่งการกำหนดค่า ARM template JSON ให้ใช้ประเภทตัวแทน "customer"
- อัปเดตตัวแปรสภาพแวดล้อมจาก CORA_AGENT_* เป็น CUSTOMER_AGENT_*
- ปรับปรุงคำสั่งการปรับใช้และการกำหนดค่าคอนเทนเนอร์ทั้งหมด

### [v3.0.0] - 2025-09-12

#### การเปลี่ยนแปลงครั้งใหญ่ - โฟกัสนักพัฒนา AI และการบูรณาการ Microsoft Foundry
**เวอร์ชันนี้เปลี่ยนที่เก็บข้อมูลให้เป็นแหล่งเรียนรู้ AI ครบวงจรพร้อมการบูรณาการ Microsoft Foundry**

#### เพิ่มเติม
- **🤖 เส้นทางการเรียนรู้ AI-First**: ปรับโครงสร้างใหม่ทั้งหมดโดยเน้นนักพัฒนาและวิศวกร AI
- **คู่มือการบูรณาการ Microsoft Foundry**: เอกสารครบถ้วนสำหรับการเชื่อมต่อ AZD กับบริการ Microsoft Foundry
- **รูปแบบการปรับใช้โมเดล AI**: คู่มือโดยละเอียดครอบคลุมการเลือกโมเดล การกำหนดค่า และกลยุทธ์การปรับใช้ในสภาพแวดล้อมจริง
- **ห้องปฏิบัติการเวิร์กช็อป AI**: เวิร์กช็อปเชิงปฏิบัติ 2-3 ชั่วโมงสำหรับการแปลงแอป AI เป็นโซลูชันที่ปรับใช้ด้วย AZD
- **แนวทางปฏิบัติที่ดีที่สุดสำหรับผลิต AI**: รูปแบบที่พร้อมใช้งานระดับองค์กรสำหรับการปรับขนาด การเฝ้าติดตาม และการรักษาความปลอดภัยงาน AI
- **คู่มือการแก้ไขปัญหา AI เฉพาะ**: การแก้ไขปัญหาอย่างครบถ้วนสำหรับ Microsoft Foundry Models, Cognitive Services, และปัญหาการปรับใช้ AI
- **แกลเลอรีแม่แบบ AI**: คอลเลกชันแม่แบบ Microsoft Foundry พร้อมการจัดอันดับความซับซ้อน
- **วัสดุเวิร์กช็อป**: โครงสร้างเวิร์กช็อปครบถ้วนพร้อมห้องปฏิบัติการเชิงปฏิบัติและเอกสารอ้างอิง

#### ได้รับการปรับปรุง
- **โครงสร้าง README**: โฟกัสนักพัฒนา AI โดยมีข้อมูลความสนใจในชุมชน 45% จาก Discord Microsoft Foundry
- **เส้นทางการเรียนรู้**: เส้นทางนักพัฒนา AI แยกเฉพาะควบคู่ไปกับเส้นทางแบบดั้งเดิมสำหรับนักศึกษาและวิศวกร DevOps
- **คำแนะนำแม่แบบ**: แม่แบบ AI ที่โดดเด่นได้แก่ azure-search-openai-demo, contoso-chat, และ openai-chat-app-quickstart
- **การบูรณาการชุมชน**: การสนับสนุนชุมชน Discord ที่ดีขึ้น พร้อมช่องและการอภิปรายเฉพาะ AI

#### มุ่งเน้นความปลอดภัยและผลิต
- **รูปแบบการจัดการตัวตน**: การยืนยันตัวตนและการตั้งค่าความปลอดภัยเฉพาะ AI
- **การปรับใช้ต้นทุนให้เหมาะสม**: การติดตามการใช้โทเคนและควบคุมงบประมาณสำหรับงาน AI
- **การปรับใช้หลายภูมิภาค**: กลยุทธ์สำหรับการปรับใช้แอป AI ทั่วโลก
- **การเฝ้าติดตามประสิทธิภาพ**: เมตริกเฉพาะ AI และการบูรณาการ Application Insights

#### คุณภาพเอกสาร
- **โครงสร้างหลักสูตรเชิงเส้น**: ลำดับตรรกะจากมือใหม่สู่รูปแบบการปรับใช้ AI ขั้นสูง
- **URL ที่ตรวจสอบแล้ว**: ลิงก์ภายนอกทั้งหมดได้รับการยืนยันและเข้าถึงได้
- **เอกสารอ้างอิงครบถ้วน**: ลิงก์ภายในทั้งหมดได้รับการตรวจสอบและใช้งานได้
- **พร้อมใช้งานในผลิต**: รูปแบบการปรับใช้ระดับองค์กรพร้อมตัวอย่างจากโลกจริง

### [v2.0.0] - 2025-09-09

#### การเปลี่ยนแปลงครั้งใหญ่ - การปรับโครงสร้างที่เก็บและการยกระดับมืออาชีพ
**เวอร์ชันนี้เป็นการปรับโครงสร้างที่เก็บและการนำเสนอเนื้อหาอย่างมีนัยสำคัญ**

#### เพิ่มเติม
- **กรอบการเรียนรู้ที่มีโครงสร้าง**: หน้าเอกสารทั้งหมดมีบทนำ เป้าหมายการเรียนรู้ และผลลัพธ์การเรียนรู้
- **ระบบนำทาง**: เพิ่มลิงก์บทเรียนก่อนหน้า/ถัดไปในเอกสารทั้งหมดเพื่อการเรียนรู้อย่างมีขั้นตอน
- **คู่มือการศึกษา**: study-guide.md ครบถ้วนพร้อมเป้าหมายการเรียนรู้ แบบฝึกหัด และวัสดุประเมินผล
- **การนำเสนอแบบมืออาชีพ**: ลบไอคอนอีโมจิทั้งหมดเพื่อการเข้าถึงและรูปลักษณ์มืออาชีพที่ดีขึ้น
- **โครงสร้างเนื้อหาปรับปรุง**: การจัดระเบียบและการไหลของวัสดุการเรียนรู้ที่ดีขึ้น

#### ได้เปลี่ยนแปลง
- **รูปแบบเอกสาร**: มาตรฐานเอกสารทั้งหมดด้วยโครงสร้างเน้นการเรียนรู้ที่สม่ำเสมอ
- **การไหลของการนำทาง**: ดำเนินการลำดับตรรกะผ่านวัสดุการเรียนรู้ทั้งหมด
- **การนำเสนอเนื้อหา**: ลบองค์ประกอบตกแต่งเพื่อความชัดเจนและการจัดรูปแบบมืออาชีพ
- **โครงสร้างลิงก์**: ปรับลิงก์ภายในทั้งหมดเพื่อรองรับระบบนำทางใหม่

#### ได้รับการปรับปรุง
- **การเข้าถึง**: ลบการพึ่งพาอีโมจิเพื่อรองรับเครื่องอ่านหน้าจอดีขึ้น
- **รูปลักษณ์มืออาชีพ**: การนำเสนอสไตล์วิชาการที่เหมาะสมสำหรับการเรียนรู้ในองค์กร
- **ประสบการณ์การเรียนรู้**: แนวทางมีโครงสร้างพร้อมเป้าหมายและผลลัพธ์ที่ชัดเจนในแต่ละบทเรียน
- **การจัดระเบียบเนื้อหา**: การไหลที่ดีขึ้นและการเชื่อมโยงระหว่างหัวข้อที่เกี่ยวข้อง

### [v1.0.0] - 2025-09-09

#### การเปิดตัวครั้งแรก - ที่เก็บการเรียนรู้ AZD ครบวงจร

#### เพิ่มเติม
- **โครงสร้างเอกสารหลัก**
  - ชุดคู่มือเริ่มต้นใช้งานครบถ้วน
  - เอกสารการปรับใช้และจัดเตรียมครบถ้วน
  - แหล่งข้อมูลแก้ไขปัญหาและคู่มือดีบักละเอียด
  - เครื่องมือและขั้นตอนการตรวจสอบล่วงหน้าก่อนปรับใช้

- **โมดูลเริ่มต้นใช้งาน**
  - พื้นฐาน AZD: แนวคิดหลักและคำศัพท์
  - คู่มือการติดตั้ง: คำแนะนำการตั้งค่าตามแพลตฟอร์ม
  - คู่มือการกำหนดค่า: การตั้งค่าสภาพแวดล้อมและการยืนยันตัวตน
  - บทเรียนโครงการแรก: เรียนรู้แบบทำตามขั้นตอน

- **โมดูลการปรับใช้และจัดเตรียม**
  - คู่มือการปรับใช้: เอกสารขั้นตอนงานครบถ้วน
  - คู่มือการจัดเตรียม: โครงสร้างพื้นฐานเป็นโค้ดด้วย Bicep
  - แนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้ในผลิต
  - รูปแบบสถาปัตยกรรมหลายบริการ

- **โมดูลตรวจสอบล่วงหน้าก่อนปรับใช้**
  - การวางแผนความจุ: ตรวจสอบความพร้อมใช้งานทรัพยากร Azure
  - การเลือก SKU: คำแนะนำระดับบริการครบถ้วน
  - การตรวจสอบก่อนบิน: สคริปต์ตรวจสอบอัตโนมัติ (PowerShell และ Bash)
  - เครื่องมือประมาณต้นทุนและวางแผนงบประมาณ

- **โมดูลแก้ไขปัญหา**
  - ปัญหาทั่วไป: ปัญหาที่พบบ่อยและวิธีแก้ไข
  - คู่มือดีบัก: วิธีการแก้ไขปัญหาอย่างมีระบบ
  - เทคนิคและเครื่องมือวินิจฉัยขั้นสูง
  - การเฝ้าติดตามและปรับปรุงประสิทธิภาพ

- **ทรัพยากรและเอกสารอ้างอิง**
  - เอกสารช่วยจำคำสั่ง: เอกสารย่อสำหรับคำสั่งสำคัญ
  - พจนานุกรม: คำศัพท์และคำย่อครบถ้วน
  - คำถามที่พบบ่อย: คำตอบโดยละเอียดสำหรับคำถามทั่วไป
  - ลิงก์แหล่งข้อมูลภายนอกและการเชื่อมโยงชุมชน

- **ตัวอย่างและแม่แบบ**
  - ตัวอย่างเว็บแอปพลิเคชันง่ายๆ
  - แม่แบบการปรับใช้เว็บไซต์แบบคงที่
  - การกำหนดค่าแอปพลิเคชันคอนเทนเนอร์
  - รูปแบบการรวมฐานข้อมูล
  - ตัวอย่างสถาปัตยกรรมไมโครเซอร์วิส
  - การนำไปใช้ฟังก์ชันแบบไม่ใช้เซิร์ฟเวอร์

#### คุณสมบัติ
- **รองรับหลายแพลตฟอร์ม**: คู่มือการติดตั้งและกำหนดค่าสำหรับ Windows, macOS, และ Linux
- **หลายระดับทักษะ**: เนื้อหาออกแบบสำหรับนักเรียนถึงนักพัฒนามืออาชีพ
- **โฟกัสเชิงปฏิบัติ**: ตัวอย่างเชิงปฏิบัติและสถานการณ์โลกจริง
- **ครอบคลุมครบถ้วน**: ตั้งแต่แนวคิดพื้นฐานถึงรูปแบบองค์กรขั้นสูง
- **แนวทางรักษาความปลอดภัยเป็นอันดับแรก**: แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัยครอบคลุมทั่วทั้งเนื้อหา
- **การปรับใช้ต้นทุนคุ้มค่า**: คำแนะนำสำหรับการปรับใช้และการจัดการทรัพยากรอย่างมีประสิทธิภาพ

#### คุณภาพเอกสาร
- **ตัวอย่างโค้ดละเอียด**: ตัวอย่างโค้ดที่ผ่านการทดสอบเชิงปฏิบัติ
- **คำแนะนำทีละขั้นตอน**: คำแนะนำที่ชัดเจนและปฏิบัติได้
- **การจัดการข้อผิดพลาดครบถ้วน**: การแก้ไขปัญหาสำหรับปัญหาทั่วไป
- **การรวมแนวทางปฏิบัติที่ดีที่สุด**: มาตรฐานอุตสาหกรรมและคำแนะนำ
- **ความเข้ากันได้ของเวอร์ชัน**: อัปเดตทันสมัยกับบริการ Azure และฟีเจอร์ azd ล่าสุด

## การปรับปรุงในอนาคตที่วางแผนไว้

### เวอร์ชัน 3.1.0 (กำหนดไว้)
#### การขยายแพลตฟอร์ม AI
- **รองรับหลายโมเดล**: รูปแบบการรวมสำหรับ Hugging Face, Azure Machine Learning, และโมเดลกำหนดเอง
- **กรอบงานเอเจนต์ AI**: แม่แบบสำหรับการปรับใช้ LangChain, Semantic Kernel, และ AutoGen
- **รูปแบบ RAG ขั้นสูง**: ตัวเลือกฐานข้อมูลเวกเตอร์นอกเหนือจาก Azure AI Search (Pinecone, Weaviate ฯลฯ)
- **การสังเกตการณ์ AI**: การเฝ้าติดตามประสิทธิภาพโมเดล การใช้โทเคน และคุณภาพการตอบสนองที่ได้รับการปรับปรุง

#### ประสบการณ์นักพัฒนา
- **ส่วนขยาย VS Code**: ประสบการณ์การพัฒนา AZD + Microsoft Foundry แบบบูรณาการ
- **การบูรณาการ GitHub Copilot**: การสร้างแม่แบบ AZD ด้วย AI
- **บทช่วยสอนแบบโต้ตอบ**: แบบฝึกหัดเขียนโค้ดเชิงปฏิบัติพร้อมการตรวจสอบอัตโนมัติสำหรับสถานการณ์ AI
- **เนื้อหาวิดีโอ**: บทช่วยสอนวิดีโอเสริมสำหรับผู้เรียนที่ชอบการเรียนรู้ด้วยภาพ มุ่งเน้นที่การปรับใช้ AI

### เวอร์ชัน 4.0.0 (กำหนดไว้)
#### รูปแบบ AI สำหรับองค์กร
- **กรอบกำกับดูแล**: การกำกับดูแลโมเดล AI การปฏิบัติตาม และร่องรอยการตรวจสอบ
- **AI สำหรับหลายผู้เช่า**: รูปแบบสำหรับให้บริการลูกค้าหลายรายพร้อมบริการ AI ที่แยกจากกัน
- **การปรับใช้ Edge AI**: การรวมกับ Azure IoT Edge และอินสแตนซ์คอนเทนเนอร์
- **AI คลาวด์แบบไฮบริด**: รูปแบบการปรับใช้หลายคลาวด์และแบบไฮบริดสำหรับงาน AI

#### ฟีเจอร์ขั้นสูง
- **ระบบอัตโนมัติ AI Pipeline**: การผสานงาน MLOps กับ Azure Machine Learning pipelines
- **ความปลอดภัยขั้นสูง**: รูปแบบ zero-trust, private endpoints, และการป้องกันภัยคุกคามขั้นสูง
- **การปรับแต่งประสิทธิภาพ**: การปรับจูนและปรับขนาดขั้นสูงสำหรับแอป AI ที่มีปริมาณข้อมูลสูง
- **การแจกจ่ายทั่วโลก**: รูปแบบการจัดส่งเนื้อหาและการแคชที่ edge สำหรับแอป AI

### เวอร์ชัน 3.0.0 (กำหนดไว้) - ถูกแทนที่ด้วยการปล่อยปัจจุบัน
#### การเพิ่มที่เสนอ - ดำเนินการแล้วใน v3.0.0
- ✅ **เนื้อหาเน้น AI**: การบูรณาการ Microsoft Foundry อย่างครบถ้วน (เสร็จสิ้น)
- ✅ **บทช่วยสอนแบบโต้ตอบ**: ห้องปฏิบัติการเวิร์กช็อป AI เชิงปฏิบัติ (เสร็จสิ้น)
- ✅ **โมดูลความปลอดภัยขั้นสูง**: รูปแบบความปลอดภัยเฉพาะ AI (เสร็จสิ้น)
- ✅ **การปรับแต่งประสิทธิภาพ**: กลยุทธ์การปรับแต่งงาน AI (เสร็จสิ้น)

### เวอร์ชัน 2.1.0 (กำหนดไว้) - ดำเนินการบางส่วนใน v3.0.0
#### การปรับปรุงเล็กน้อย - บางส่วนเสร็จสิ้นในเวอร์ชันปัจจุบัน
- ✅ **ตัวอย่างเพิ่มเติม**: สถานการณ์การปรับใช้เน้น AI (เสร็จสิ้น)
- ✅ **คำถามที่พบบ่อยขยาย**: คำถามและการแก้ไขปัญหาเฉพาะ AI (เสร็จสิ้น)
- **การบูรณาการเครื่องมือ**: คู่มือการบูรณาการ IDE และเครื่องมือ
- ✅ **การขยายการเฝ้าติดตาม**: รูปแบบการเฝ้าติดตามและแจ้งเตือนเฉพาะ AI (เสร็จสิ้น)

#### ยังคงวางแผนสำหรับการปล่อยในอนาคต
- **เอกสารที่เหมาะสำหรับอุปกรณ์เคลื่อนที่**: การออกแบบตอบสนองสำหรับการเรียนรู้บนมือถือ
- **การเข้าถึงแบบออฟไลน์**: แพ็คเกจเอกสารที่ดาวน์โหลดได้
- **การรวม IDE ที่เพิ่มประสิทธิภาพ**: ส่วนขยาย VS Code สำหรับ AZD + เวิร์กโฟลว์ AI
- **แดชบอร์ดชุมชน**: ตัวชี้วัดชุมชนแบบเรียลไทม์และการติดตามการมีส่วนร่วม

## การมีส่วนร่วมในบันทึกการเปลี่ยนแปลง

### การรายงานการเปลี่ยนแปลง
เมื่อมีส่วนร่วมกับที่เก็บนี้ กรุณาให้แน่ใจว่ารายการบันทึกการเปลี่ยนแปลงประกอบด้วย:

1. **หมายเลขเวอร์ชัน**: ตามการเวอร์ชันแบบ semantic (major.minor.patch)
2. **วันที่**: วันที่ปล่อยหรืออัปเดตในรูปแบบ YYYY-MM-DD
3. **หมวดหมู่**: เพิ่ม, เปลี่ยนแปลง, เลิกใช้, ลบ, แก้ไข, ความปลอดภัย
4. **คำอธิบายชัดเจน**: คำอธิบายสั้นๆ ว่ามีการเปลี่ยนแปลงอะไรบ้าง
5. **การประเมินผลกระทบ**: การเปลี่ยนแปลงมีผลกระทบต่อผู้ใช้ที่มีอยู่หรือไม่อย่างไร

### หมวดหมู่การเปลี่ยนแปลง

#### เพิ่มเติม
- ฟีเจอร์ใหม่ ส่วนเอกสาร หรือความสามารถใหม่
- ตัวอย่างใหม่ แม่แบบ หรือแหล่งเรียนรู้
- เครื่องมือ สคริปต์ หรือยูทิลิตี้เพิ่มเติม

#### เปลี่ยนแปลง
- การแก้ไขฟังก์ชันหรือเอกสารที่มีอยู่
- อัปเดตเพื่อปรับปรุงความชัดเจนหรือความถูกต้อง
- การปรับโครงสร้างเนื้อหาหรือการจัดองค์กรใหม่

#### เลิกใช้
- ฟีเจอร์หรือวิธีการที่กำลังถูกยกเลิก
- ส่วนเอกสารที่กำหนดเวลาจะถูกลบ
- วิธีการที่มีทางเลือกที่ดีกว่า

#### ลบ
- ฟีเจอร์ เอกสาร หรือ ตัวอย่างที่ไม่เกี่ยวข้องอีกต่อไป
- ข้อมูลล้าสมัยหรือวิธีการเลิกใช้
- เนื้อหาที่ซ้ำซ้อนหรือต้องรวมกัน

#### แก้ไข
- การแก้ไขข้อผิดพลาดในเอกสารหรือโค้ด
- การแก้ปัญหาที่รายงาน
- การปรับปรุงความถูกต้องหรือฟังก์ชัน


#### ความปลอดภัย
- การปรับปรุงหรือแก้ไขที่เกี่ยวข้องกับความปลอดภัย
- การอัปเดตแนวปฏิบัติที่ดีที่สุดด้านความปลอดภัย
- การแก้ไขช่องโหว่ด้านความปลอดภัย

### แนวทางการเวอร์ชันทางความหมาย

#### เวอร์ชันใหญ่ (X.0.0)
- การเปลี่ยนแปลงที่ส่งผลกระทบและต้องการการดำเนินการจากผู้ใช้
- การปรับโครงสร้างเนื้อหาหรือองค์กรครั้งใหญ่
- การเปลี่ยนแปลงที่เปลี่ยนแนวทางหรือวิธีการพื้นฐาน

#### เวอร์ชันรอง (X.Y.0)
- ฟีเจอร์ใหม่หรือการเพิ่มเนื้อหา
- การปรับปรุงที่คงความเข้ากันได้ย้อนหลัง
- ตัวอย่าง เครื่องมือ หรือทรัพยากรเพิ่มเติม

#### เวอร์ชันแก้ไข (X.Y.Z)
- การแก้ไขข้อบกพร่องและการแก้ไข
- การปรับปรุงเล็กน้อยกับเนื้อหาที่มีอยู่
- การชี้แจงและการปรับปรุงเล็กน้อย

## ข้อเสนอแนะและคำแนะนำจากชุมชน

เราสนับสนุนอย่างแข็งขันให้ชุมชนส่งข้อเสนอแนะเพื่อปรับปรุงแหล่งเรียนรู้นี้:

### วิธีการเสนอข้อเสนอแนะ
- **GitHub Issues**: รายงานปัญหาหรือแนะนำการปรับปรุง (รับเรื่องปัญหาเฉพาะ AI ด้วย)
- **Discord Discussions**: แชร์ไอเดียและมีส่วนร่วมกับชุมชน Microsoft Foundry
- **Pull Requests**: มีส่วนร่วมในการปรับปรุงเนื้อหาอย่างตรงไปตรงมา โดยเฉพาะเทมเพลตและคำแนะนำ AI
- **Microsoft Foundry Discord**: เข้าร่วมช่อง #Azure สำหรับการสนทนาเกี่ยวกับ AZD + AI
- **Community Forums**: มีส่วนร่วมในการสนทนานักพัฒนา Azure ในวงกว้าง

### หมวดหมู่ข้อเสนอแนะ
- **ความถูกต้องของเนื้อหา AI**: การแก้ไขข้อมูลการรวมและการปรับใช้บริการ AI
- **ประสบการณ์การเรียนรู้**: ข้อเสนอแนะสำหรับการปรับปรุงกระบวนการเรียนรู้สำหรับนักพัฒนา AI
- **เนื้อหา AI ที่ขาดหาย**: คำร้องขอเทมเพลต แพตเทิร์น หรือ ตัวอย่าง AI เพิ่มเติม
- **การเข้าถึง**: การปรับปรุงเพื่อตอบสนองความต้องการการเรียนรู้ที่หลากหลาย
- **การรวมเครื่องมือ AI**: ข้อเสนอแนะสำหรับการผสานรวมกระบวนการพัฒนา AI ที่ดีขึ้น
- **แพตเทิร์น AI สำหรับการผลิต**: คำร้องขอแพตเทิร์นการปรับใช้ AI ในองค์กร

### การตอบสนองที่รับประกัน
- **การตอบปัญหา**: ภายใน 48 ชั่วโมงสำหรับปัญหาที่รายงาน
- **คำร้องขอฟีเจอร์**: ประเมินภายในหนึ่งสัปดาห์
- **การมีส่วนร่วมของชุมชน**: ตรวจสอบภายในหนึ่งสัปดาห์
- **ปัญหาด้านความปลอดภัย**: ดำเนินการอย่างเร่งด่วนและให้ความสำคัญโดยทันที

## ตารางเวลาการบำรุงรักษา

### การอัปเดตตามปกติ
- **การตรวจสอบรายเดือน**: ความถูกต้องของเนื้อหาและการตรวจสอบลิงก์
- **การอัปเดตทุกไตรมาส**: การเพิ่มและปรับปรุงเนื้อหาครั้งใหญ่
- **การตรวจสอบทุกหกเดือน**: การปรับโครงสร้างและปรับปรุงอย่างครอบคลุม
- **การปล่อยรายปี**: การอัปเดตเวอร์ชันใหญ่พร้อมการปรับปรุงที่สำคัญ

### การตรวจสอบและประกันคุณภาพ
- **การทดสอบอัตโนมัติ**: การตรวจสอบตัวอย่างโค้ดและลิงก์อย่างสม่ำเสมอ
- **การผสมผสานข้อเสนอแนะจากชุมชน**: การนำข้อเสนอแนะของผู้ใช้เข้ามาใช้อย่างสม่ำเสมอ
- **การอัปเดตเทคโนโลยี**: การสอดคล้องกับบริการ Azure ล่าสุดและการปล่อย azd
- **การตรวจสอบการเข้าถึง**: การตรวจสอบตามปกติสำหรับหลักการออกแบบที่ครอบคลุม

## นโยบายการสนับสนุนเวอร์ชัน

### การสนับสนุนเวอร์ชันปัจจุบัน
- **เวอร์ชันใหญ่ล่าสุด**: สนับสนุนเต็มรูปแบบพร้อมการอัปเดตตามปกติ
- **เวอร์ชันใหญ่ก่อนหน้า**: อัปเดตความปลอดภัยและแก้ไขสำคัญเป็นเวลา 12 เดือน
- **เวอร์ชันเก่า**: มีเพียงการสนับสนุนจากชุมชนเท่านั้น ไม่มีการอัปเดตอย่างเป็นทางการ

### แนวทางการย้ายข้อมูล
เมื่อมีการปล่อยเวอร์ชันใหญ่ เราจะให้:
- **คำแนะนำการย้ายข้อมูล**: คำแนะนำขั้นตอนการเปลี่ยนผ่าน
- **บันทึกความเข้ากันได้**: รายละเอียดเกี่ยวกับการเปลี่ยนแปลงที่ส่งผลกระทบ
- **เครื่องมือสนับสนุน**: สคริปต์หรือยูทิลิตี้ช่วยในการย้ายข้อมูล
- **การสนับสนุนจากชุมชน**: ฟอรัมเฉพาะสำหรับคำถามเกี่ยวกับการย้ายข้อมูล

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [Study Guide](resources/study-guide.md)
- **บทเรียนถัดไป**: กลับไปที่ [Main README](README.md)

**ติดตามข้อมูลล่าสุด**: ติดตามคลังนี้เพื่อรับการแจ้งเตือนเกี่ยวกับการปล่อยเวอร์ชันใหม่และการอัปเดตสำคัญของสื่อการเรียนรู้

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->