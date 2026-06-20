# Changelog - AZD สำหรับผู้เริ่มต้น

## บทนำ

ไฟล์ changelog นี้บันทึกการเปลี่ยนแปลงที่สำคัญทั้งหมด การอัปเดต และการปรับปรุงในที่เก็บ AZD สำหรับผู้เริ่มต้น เราปฏิบัติตามหลักเวอร์ชันเชิงความหมายและดูแลบันทึกนี้เพื่อช่วยให้ผู้ใช้เข้าใจถึงสิ่งที่เปลี่ยนแปลงระหว่างเวอร์ชันต่าง ๆ

## เป้าหมายการเรียนรู้

โดยการทบทวน changelog นี้ คุณจะได้:
- รับทราบข้อมูลเกี่ยวกับฟีเจอร์ใหม่และการเพิ่มเนื้อหา
- เข้าใจการปรับปรุงที่ทำกับเอกสารที่มีอยู่
- ติดตามการแก้ไขข้อบกพร่องและการแก้ไขเพื่อความถูกต้อง
- ติดตามพัฒนาการของวัสดุการเรียนรู้ตามเวลา

## ผลลัพธ์การเรียนรู้

หลังจากทบทวนรายการ changelog คุณจะสามารถ:
- ระบุเนื้อหาและทรัพยากรใหม่ที่มีให้สำหรับการเรียนรู้
- เข้าใจว่าส่วนใดที่ได้รับการอัปเดตหรือปรับปรุง
- วางแผนเส้นทางการเรียนรู้ของคุณโดยอิงจากวัสดุล่าสุด
- ให้ข้อเสนอแนะและคำแนะนำสำหรับการปรับปรุงในอนาคต

## ประวัติเวอร์ชัน

### [v3.22.0] - 2026-06-16

#### เติมช่องว่างผู้เริ่มต้น #2: การสร้างแม่แบบ, Dev Containers, Pulumi, Azure DevOps, Service Principals และอื่น ๆ
**เวอร์ชันนี้ปิดช่องว่างระดับกลางที่เหลือที่พบโดยการวิเคราะห์ azd-coverage: วิธีสร้างและเผยแพร่แม่แบบของคุณเอง, สภาพแวดล้อม dev-container/Codespaces ที่ทำซ้ำได้, ผู้ให้บริการโครงสร้างพื้นฐาน Pulumi, การสาธิต CI/CD ของ Azure DevOps, การพิสูจน์ตัวตนของ service-principal, คำแนะนำการเลือกโฮสต์ (AKS/Spring Apps), คำอธิบาย `azd restore`/`azd package`, การจัดการข้อผิดพลาดของ hook และแนวปฏิบัติทีม/สภาพแวดล้อมที่ใช้ร่วมกัน**

#### เพิ่มเติม
- **🧱 บทเรียนบทที่ 4 ใหม่** `docs/chapter-04-infrastructure/custom-templates.md` — การสร้างแม่แบบ azd ของคุณเอง: โครงสร้างที่ต้องการ (`azure.yaml`, `infra/`, `src/`), ฟิลด์ `metadata.template`, การพารามิเตอร์โครงสร้างพื้นฐานด้วย token ทรัพยากร `uniqueString()` และแท็ก `azd-env-name`, การทดสอบภายในเครื่องด้วย `azd init --template <local-path>`, การเผยแพร่ไปยัง GitHub และการส่งเข้าแกลลอรี Awesome AZD
- **📦 บทเรียนบทที่ 1 ใหม่** `docs/chapter-01-foundation/dev-containers.md` — สภาพแวดล้อม azd ที่ทำซ้ำได้ด้วย Dev Containers และ GitHub Codespaces: ไฟล์ `.devcontainer/devcontainer.json` ขั้นต่ำที่ใช้ฟีเจอร์อย่างเป็นทางการ `ghcr.io/azure/azure-dev/azd`, ฟีเจอร์เฉพาะภาษาการเขียนโปรแกรม, `docker-in-docker` สำหรับโฮสต์คอนเทนเนอร์ และ `azd auth login --use-device-code` สำหรับเข้าสู่ระบบระยะไกล
- **🧩 Pulumi กับ azd** ในหัวข้อ `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, กำหนดโครงสร้างโฟลเดอร์ Pulumi, สแต็กที่แมปกับสภาพแวดล้อม azd, ผลลัพธ์/แท็กที่จำเป็น และเวิร์กโฟลว์ `azd up` / `azd down` ที่เหมือนกัน
- **🎯 คำแนะนำการเลือกโฮสต์** ใน `docs/chapter-04-infrastructure/provisioning.md` — การเปรียบเทียบเบื้องต้นที่เป็นมิตรกับผู้เริ่มต้นของ `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` และ `springapp` พร้อมคำแนะนำว่าเมื่อใดควรเลือก AKS หรือ Azure Spring Apps
- **🛠️ สาธิต Azure DevOps CI/CD** ใน `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, การเชื่อมต่อบริการด้วย federation workload identity (OIDC), ไฟล์ `azure-dev.yml` ที่สร้างขึ้น และการตั้งค่า variable-group
- **🔑 Service Principals (รูปแบบที่ 4)** เพิ่มใน `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, การเข้าสู่ระบบ `azd auth login` แบบไม่โต้ตอบโดยใช้ client secret เทียบกับข้อมูลประจำตัว federated/OIDC, เมื่อใดควรใช้ และการเก็บข้อมูลรับรองอย่างปลอดภัย
- **🪝 การจัดการข้อผิดพลาด hook** ในบทย่อย `docs/chapter-04-infrastructure/deployment-guide.md` — รหัสออกและ `set -e`, `continueOnError`, การทดสอบ hook แยกด้วย `azd hooks run`, shell เฉพาะ OS, และ `--debug`
- **👥 ทีม / สภาพแวดล้อมที่ใช้ร่วมกัน** ใน `docs/chapter-03-configuration/configuration.md` — สิ่งที่อยู่ใน `.azure/`, สิ่งที่ต้องจัด gitignore, สภาพแวดล้อมต่อผู้พัฒนา, คำสั่ง `azd env list`/`select` และการมอบค่าสภาพแวดล้อมใน CI/CD
- **🧰 คำอธิบาย `azd restore` และการขยาย `azd package`** ใน `resources/cheat-sheet.md` — การกู้คืน dependencies และการสร้างอาร์ติเฟกต์สำหรับการปรับใช้โดยไม่ต้องปรับใช้จริง

#### เปลี่ยนแปลง
- **🧭 ตารางบทเรียนบทที่ 4** อัปเดตเพื่อรวมบทเรียนใหม่ "การสร้างแม่แบบของคุณเอง" (บทเรียนที่ 3)
- **🧭 ตารางบทเรียนบทที่ 1** อัปเดตเพื่อรวมบทเรียนใหม่ "Dev Containers & Codespaces" (บทเรียนที่ 5); เชื่อมโยงส่วนท้ายการนำทางระหว่าง `bring-your-own-app.md` และ `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### เติมช่องว่างผู้เริ่มต้น: บทเรียน Multi-Agent ปฏิบัติจริง, "นำแอปของคุณมาเอง," Terraform และสาธิต CI/CD
**เวอร์ชันนี้ปิดช่องว่างที่ใหญ่ที่สุดสำหรับคู่มือผู้เริ่มต้นอย่างครบถ้วนโดยเพิ่มบทเรียนปฏิบัติสองบท (การสาธิต multi-agent deployable และการเพิ่ม azd ลงในแอปที่มีอยู่), บทนำเกี่ยวกับ hooks ที่เป็นมิตรกับผู้เริ่มต้น, ส่วน Terraform กับ azd, การสาธิต pipeline GitHub Actions ทีละขั้นตอน, คำอธิบายสำหรับส่วนขยายพรีวิวใหม่ และรายการตรวจสอบการยืนยันการปรับใช้ที่ชัดเจน**

#### เพิ่มเติม
- **🤝 บทเรียนบทที่ 5 ใหม่** `docs/chapter-05-multi-agent/multi-agent-basics.md` — การสาธิตสอง-agent แบบเต็มที่ปฏิบัติได้จริง (orchestrator + specialists) โดยใช้แม่แบบจริง (`contoso-creative-writer`), ครอบคลุมเมื่อใดควรใช้ multi-agent, เวิร์กโฟลว์ `azd up`, การเข้าใจทรัพยากรที่ถูก deploy, การติดตามข้าม agent, การปรับแต่ง และการล้างข้อมูล
- **📦 บทเรียนบทที่ 1 ใหม่** `docs/chapter-01-foundation/bring-your-own-app.md` — วิธีเพิ่ม azd ลงในโปรเจ็กต์ที่มีอยู่ด้วย `azd init` ("ใช้โค้ดในไดเรกทอรีปัจจุบัน"), การเข้าใจ `azure.yaml` และ `infra/`, `azd infra generate`, การตรวจจับโฮสต์ และการ deploy ด้วย `azd up`
- **🌐 Terraform กับ azd** เพิ่มในส่วน `docs/chapter-04-infrastructure/provisioning.md` — การกำหนดค่า `infra.provider: terraform`, โครงสร้างโฟลเดอร์ `.tf`, การส่งออก `AZURE_*` ที่จำเป็นและแท็ก `azd-env-name`, และเวิร์กโฟลว์ `azd up` / `azd down` ที่เหมือนกัน (ปิดช่องว่างที่เคยอ้างว่ารองรับ Terraform แต่แสดงแค่ Bicep เท่านั้น)
- **⚙️ สาธิต GitHub Actions ทีละขั้นตอน** ใน `docs/chapter-08-production/production-ai-practices.md` — จาก repo GitHub ถึงการ deploy อัตโนมัติ: `azd pipeline config`, ข้อมูลประจำตัว federated OIDC (ไม่เก็บความลับ), ไฟล์ `azure-dev.yml` ที่สร้างขึ้น และคำแนะนำเกี่ยวกับความลับเทียบกับตัวแปร
- **🪝 บทนำสำหรับผู้เริ่มต้น "ใหม่กับ hooks?"** ใน `docs/chapter-04-infrastructure/deployment-guide.md` — hook คืออะไร, ตารางขั้น hook, hook แรกที่เรียบง่าย, และการรัน hook ด้วยตนเองโดยใช้ `azd hooks run`
- **✅ รายการตรวจสอบ "ยืนยันการปรับใช้"** เพิ่มในขั้นตอนที่ 5 ของ `docs/chapter-01-foundation/first-project.md` — การทดสอบ Smoke, ตรวจสอบ endpoint สุขภาพ และเกณฑ์ความสำเร็จที่ชัดเจน
- **🧩 คำอธิบายสำหรับส่วนขยายพรีวิวใหม่** `azure.ai.skills` และ `azure.ai.connections` (คืออะไรและเมื่อใดควรใช้) ใน `docs/chapter-08-production/production-ai-practices.md`

#### เปลี่ยนแปลง
- **🧭 ตารางบทเรียนบทที่ 5** แก้ไข: `multi-agent-basics.md` เป็นบทเรียนที่ 1 (บทเรียนปฏิบัติเดียวที่ครบถ้วน), มีการติดป้ายบอกอย่างตรงไปตรงมาว่าบทเรียนที่ 2 อยู่ในบทที่ 6 และสถานการณ์ Retail คือแบบแผนสถาปัตยกรรม ไม่ใช่แม่แบบคำสั่งเดียว
- **🧭 ตารางบทเรียนบทที่ 1** รวมบทเรียนใหม่ "นำแอปของคุณมาเอง" (บทเรียนที่ 4)
- **🔗 ส่วนท้ายการนำทาง** อัปเดต: `first-project.md` ตอนนี้ลิงก์ไปยัง `bring-your-own-app.md`

#### แก้ไขแล้ว
- **🧱 ปิดช่องว่าง Terraform ที่เคยอ้างแต่ขาด** — คอร์สเคยอ้างถึงการรองรับ Terraform แต่ไม่แสดง
- **🔀 แก้ไขลิงก์ข้ามบทที่ 5 ที่ทำให้เข้าใจผิด** ว่ามีการใช้งาน multi-agent ครบถ้วนเมื่อจริง ๆ เป็นแค่แบบแผนสถาปัตยกรรมเท่านั้น

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

#### AZD 1.25.6 รีเฟรช, คำสั่งวงจรชีวิตเอเจนต์เต็มรูปแบบ & การตั้งชื่อ Aspire ใหม่
**เวอร์ชันนี้ตรวจสอบความถูกต้องของคอร์สกับ `azd` `1.25.6` (มิถุนายน 2026) และส่วนขยาย `azure.ai.agents` `0.1.40-preview` ขยายคำแนะนำ AI จาก "สร้างเอเจนต์ร่าง" ไปจนถึงวงจรชีวิตเอเจนต์ครบถ้วน (ทดสอบ → ประเมิน → ปรับปรุง → ตรวจสอบ → ลบ), นำเสนอส่วนขยายพรีวิวใหม่ `azure.ai.skills` และ `azure.ai.connections` และบันทึกการตั้งชื่อผลิตภัณฑ์ ".NET Aspire" → "Aspire" ใหม่**

#### เพิ่มเติม
- **🔁 ครอบคลุมวงจรชีวิตเอเจนต์เต็มรูปแบบ** สำหรับผู้เริ่มต้นและวิศวกร AI ทั่วเอกสาร:
  - `docs/chapter-01-foundation/azd-basics.md` — ตารางวงจรชีวิต (สร้างร่าง → ทดสอบ → วัดผล → ปรับปรุง → ตรวจสอบ → ทำความสะอาด) เพิ่มในส่วน Extensions และคำสั่ง AI
  - `docs/chapter-08-production/production-ai-practices.md` — หัวข้อใหม่ "การจัดการวงจรชีวิตเอเจนต์" ครอบคลุมคำสั่ง `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` และ `delete --force`
  - `resources/cheat-sheet.md` — ขยายคำสั่ง AI Agent ด้วย `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, และ `delete --force`
- **🧩 ส่วนขยายพรีวิวใหม่** ที่บันทึกไว้: `azure.ai.skills` (ทักษะเอเจนต์ที่ใช้ซ้ำได้) และ `azure.ai.connections` (การเชื่อมต่อ Foundry) เพิ่มในตารางส่วนขยายและ cheat sheet
- **⏱️ คำแนะนำเวลาตอบสนอง** — ตัวอย่าง `azd ai agent invoke` แสดงค่า latency รวมและเวลาไปยังไบต์แรก
- **📌 แบนเนอร์เวอร์ชัน** ใน README หลักชี้ผู้เรียนไปที่ `azd version` และ `azd upgrade`

#### เปลี่ยนแปลง
- **✅ อัปเดตพื้นฐานการตรวจสอบ** จาก `azd 1.23.12` (มีนาคม 2026) เป็น `azd 1.25.6` (มิถุนายน 2026) ใน README ของทุกบทและเอกสารเวิร์กช็อป
- **🤖 หมายเหตุส่วนขยายบทที่ 2** อัปเดตจาก `azure.ai.agents` `0.1.18-preview` เป็น `0.1.40-preview`
- **🧪 ตัวอย่างการตรวจสอบเวิร์กช็อป** (`azd version` output) อัปเดตเป็น `1.25.6`
- **🧭 README "อะไรใหม่ใน azd วันนี้"** รีเฟรชเพื่อเน้นวงจรชีวิตเอเจนต์ครบถ้วน, ส่วนขยาย AI ใหม่ และการแก้ไขคุณภาพชีวิตล่าสุด (`azd init` idempotency, การเคลียร์โทเค็นหมดอายุใน `azd auth login`, พร้อมคำแนะนำที่รันครั้งแรกของ `azd tool`)
- **📖 Chapter 2 agents.md (ตัวเลือก 4)** ชี้ผู้เรียนไปที่คำสั่งวงจรชีวิตหลังการปรับใช้แทนการหยุดที่ `azd up`

#### แก้ไขแล้ว
- **🏷️ การตั้งชื่อผลิตภัณฑ์** — เพิ่มบันทึกการตั้งชื่อ Aspire ใหม่ (".NET Aspire" เปลี่ยนเป็น "Aspire" เท่านั้น); การรองรับ Aspire ของ azd ไม่เปลี่ยนแปลง
- **🔎 ตรวจสอบการ released สด** ยืนยันกับฟีด release Azure Developer CLI: CLI เสถียร `1.25.6` (2026-06-12) และ `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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
#### การชี้แจงการเริ่มต้นใช้งานสำหรับผู้เริ่มต้น, การตรวจสอบการตั้งค่า & การทำความสะอาดคำสั่ง AZD สุดท้าย
**เวอร์ชันนี้ติดตามการตรวจสอบ AZD 1.23 ด้วยการปรับปรุงเอกสารสำหรับผู้เริ่มต้น: ชี้แจงคำแนะนำการรับรองความถูกต้องแบบ AZD-first, เพิ่มสคริปต์ตรวจสอบการตั้งค่าในเครื่อง, ยืนยันคำสั่งสำคัญกับ CLI AZD เวอร์ชันสด และลบการอ้างอิงคำสั่งภาษาอังกฤษที่ล้าสมัยออกนอกบันทึกการเปลี่ยนแปลงสุดท้าย**

#### เพิ่มเติม
- **🧪 สคริปต์ตรวจสอบการตั้งค่าสำหรับผู้เริ่มต้น** ด้วย `validate-setup.ps1` และ `validate-setup.sh` เพื่อให้ผู้เรียนยืนยันเครื่องมือที่จำเป็นก่อนเริ่มบทที่ 1
- **✅ ขั้นตอนตรวจสอบการตั้งค่าล่วงหน้า** ใน README หลักและ README บทที่ 1 เพื่อจับข้อกำหนดที่ขาดหายไปก่อนใช้คำสั่ง `azd up`

#### เปลี่ยนแปลง
- **🔐 คำแนะนำการรับรองความถูกต้องสำหรับผู้เริ่มต้น** ปรับให้สอดคล้องกับการใช้ `azd auth login` เป็นเส้นทางหลักสำหรับเวิร์กโฟลว์ AZD โดยเรียกใช้ `az login` เป็นแบบเลือกได้เว้นแต่จะใช้คำสั่ง Azure CLI โดยตรง
- **📚 กระบวนการเริ่มต้นบทที่ 1** แนะนำให้ผู้เรียนตรวจสอบการตั้งค่าในเครื่องก่อนการติดตั้ง การรับรองความถูกต้อง และขั้นตอนการสั่งใช้งานครั้งแรก
- **🛠️ ข้อความของผู้ตรวจสอบ** แยกความชัดเจนระหว่างความต้องการที่บล็อกกับคำเตือน Azure CLI แบบเลือกได้สำหรับเส้นทางผู้เริ่มต้นที่ใช้ AZD เท่านั้น
- **📖 เอกสารการกำหนดค่า, การแก้ไขปัญหา, และตัวอย่าง** แยกความแตกต่างระหว่างการรับรองความถูกต้อง AZD ที่จำเป็นกับการลงชื่อเข้าใช้ Azure CLI แบบเลือกได้ในกรณีที่ทั้งสองเคยนำเสนอโดยไม่มีบริบท

#### แก้ไข
- **📋 การอ้างอิงคำสั่งภาษาอังกฤษที่เหลือ** อัปเดตเป็นรูปแบบ AZD ปัจจุบัน รวมถึง `azd config show` ในชีทช่วยจำ และ `azd monitor --overview` เมื่อมีความตั้งใจแนะนำภาพรวมบน Azure Portal
- **🧭 คำกล่าวอ้างของผู้เริ่มต้นในบทที่ 1** ปรับให้นุ่มนวลขึ้นเพื่อหลีกเลี่ยงการสัญญาว่าจะไม่มีข้อผิดพลาดหรือมีการย้อนกลับที่รับประกันสำหรับเทมเพลตและทรัพยากร Azure ทุกชนิด
- **🔎 การตรวจสอบ CLI เวอร์ชันสด** ยืนยันว่ายังคงรองรับ `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` และ `azd down --force --purge`

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

#### การตรวจสอบ AZD 1.23.12, การขยายสภาพแวดล้อมเวิร์กชอป & การรีเฟรชโมเดล AI
**เวอร์ชันนี้ดำเนินการตรวจสอบเอกสารกับ `azd` `1.23.12` อัปเดตตัวอย่างคำสั่ง AZD ที่ล้าสมัย รีเฟรชคำแนะนำโมเดล AI เป็นค่าเริ่มต้นปัจจุบัน และขยายคำแนะนำเวิร์กชอปเกิน GitHub Codespaces เพื่อรองรับ dev containers และโลคอลโคลนด้วย**

#### เพิ่มเติม
- **✅ หมายเหตุการตรวจสอบในบทหลักและเอกสารเวิร์กชอป** เพื่อชี้แจงฐาน AZD ที่ทดสอบสำหรับผู้เรียนที่ใช้ CLI เวอร์ชันใหม่กว่าหรือเก่ากว่า
- **⏱️ คำแนะนำการหมดเวลาการปรับใช้** สำหรับการปรับใช้แอป AI ที่ใช้เวลานานด้วยคำสั่ง `azd deploy --timeout 1800`
- **🔎 ขั้นตอนการตรวจสอบส่วนขยาย** ด้วย `azd extension show azure.ai.agents` ในเอกสารเวิร์กโฟลว์ AI
- **🌐 คำแนะนำสภาพแวดล้อมเวิร์กชอปที่กว้างขึ้น** ครอบคลุม GitHub Codespaces, dev containers และโลคอลโคลนโดยใช้ MkDocs

#### เปลี่ยนแปลง
- **📚 README บทนำของบทต่างๆ** แสดงอย่างสม่ำเสมอว่ามีการตรวจสอบกับ `azd 1.23.12` ในส่วน foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting และ production
- **🛠️ การอ้างอิงคำสั่ง AZD** ปรับเป็นรูปแบบปัจจุบันทั่วทั้งเอกสาร:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` หรือ `azd env get-value(s)` ขึ้นอยู่กับบริบท
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` เมื่อมีเจตนาแสดงภาพรวม Application Insights
- **🧪 ตัวอย่าง Provision preview** ง่ายขึ้นเป็นการใช้งานที่รองรับปัจจุบันเช่น `azd provision --preview` และ `azd provision --preview -e production`
- **🧭 กระบวนการเวิร์กชอป** อัปเดตเพื่อให้ผู้เรียนทำแลบได้ใน Codespaces, dev container หรือโลคอลโคลน แทนที่จะสมมติว่าทำได้แค่ใน Codespaces เท่านั้น
- **🔐 คำแนะนำการรับรองความถูกต้อง** ชอบใช้ `azd auth login` สำหรับเวิร์กโฟลว์ AZD โดยมี `az login` เป็นแบบเลือกได้เมื่อใช้คำสั่ง Azure CLI โดยตรง

#### แก้ไข
- **🪟 คำสั่งติดตั้ง Windows** ปรับเป็นการใช้ casing แพ็กเกจ `winget` ปัจจุบันในคู่มือการติดตั้ง
- **🐧 คำแนะนำการติดตั้ง Linux** แก้ไขเพื่อหลีกเลี่ยงคำแนะนำตัวจัดการแพ็กเกจ `azd` เฉพาะดิสโทรที่ไม่รองรับ และเปลี่ยนไปใช้อ้างอิง release assets เมื่อเหมาะสม
- **📦 ตัวอย่างโมเดล AI** รีเฟรชจากค่าเริ่มต้นเก่าเช่น `gpt-35-turbo` และ `text-embedding-ada-002` เป็นตัวอย่างปัจจุบันเช่น `gpt-4.1-mini`, `gpt-4.1`, และ `text-embedding-3-large`
- **📋 ตัวอย่างการปรับใช้และการวินิจฉัย** แก้ไขให้ใช้คำสั่งสภาพแวดล้อมและสถานะปัจจุบันในบันทึก, สคริปต์, และขั้นตอนแก้ไขปัญหา
- **⚙️ คำแนะนำ GitHub Actions** อัปเดตจาก `Azure/setup-azd@v1.0.0` เป็น `Azure/setup-azd@v2`
- **🤖 คำแนะนำ MCP/Copilot consent** ปรับจาก `azd mcp consent` เป็น `azd copilot consent list`

#### ปรับปรุง
- **🧠 คำแนะนำในบท AI** อธิบายพฤติกรรม `azd ai` ที่มีผลกับเวอร์ชันพรีวิว การเข้าสู่ระบบแบบ tenant-specific การใช้ส่วนขยายปัจจุบัน และคำแนะนำการปรับใช้โมเดลที่อัปเดต
- **🧪 คำแนะนำเวิร์กชอป** ใช้ตัวอย่างเวอร์ชันที่สมจริงขึ้นและภาษาการตั้งค่าสภาพแวดล้อมที่ชัดเจนขึ้นสำหรับแลบบนมือ
- **📈 เอกสารผลิตภัณฑ์และการแก้ไขปัญหา** ปรับให้สอดคล้องดียิ่งขึ้นกับการตรวจสอบปัจจุบัน โมเดลสำรอง และตัวอย่างระดับค่าใช้จ่าย

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

#### คำสั่ง AZD AI CLI, การตรวจสอบเนื้อหา & การขยายเทมเพลต
**เวอร์ชันนี้เพิ่มการรองรับคำสั่ง `azd ai`, `azd extension`, และ `azd mcp` ในทุกบทเกี่ยวกับ AI, แก้ไขลิงก์เสียและโค้ดเลิกใช้ใน agents.md, อัปเดตชีทช่วยจำ และปรับปรุงส่วนเทมเพลตตัวอย่างด้วยคำอธิบายที่ผ่านการตรวจสอบและเทมเพลต Azure AI AZD ใหม่**

#### เพิ่มเติม
- **🤖 การรองรับคำสั่ง AZD AI CLI** ครอบคลุม 7 ไฟล์ (ก่อนหน้านี้เฉพาะในบท 8 เท่านั้น):
  - `docs/chapter-01-foundation/azd-basics.md` — ส่วนใหม่ "คำสั่ง Extensions และ AI" แนะนำ `azd extension`, `azd ai agent init`, และ `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — ตัวเลือก 4: `azd ai agent init` พร้อมตารางเปรียบเทียบ (เทมเพลตกับวิธี manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — ส่วน "AZD Extensions สำหรับ Foundry" และ "การปรับใช้ Agent-First"
  - `docs/chapter-05-multi-agent/README.md` — การเริ่มต้นใช้งานอย่างรวดเร็วแสดงทั้งเส้นทางปรับใช้แบบเทมเพลตและแบบ manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — ส่วน Deploy เพิ่มตัวเลือก `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — ส่วน "คำสั่ง AZD AI Extension สำหรับการวินิจฉัย"
  - `resources/cheat-sheet.md` — ส่วนใหม่ "คำสั่ง AI & Extensions" พร้อม `azd extension`, `azd ai agent init`, `azd mcp`, และ `azd infra generate`
- **📦 เทมเพลตตัวอย่าง AZD AI ใหม่** ใน `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — แชท RAG .NET ด้วย Blazor WebAssembly, Semantic Kernel, และรองรับแชทเสียง
  - **azure-search-openai-demo-java** — แชท RAG Java ใช้ Langchain4J พร้อมตัวเลือกปรับใช้งาน ACA/AKS
  - **contoso-creative-writer** — แอปเขียนสร้างสรรค์หลายตัวแทนโดยใช้ Azure AI Agent Service, Bing Grounding, และ Prompty
  - **serverless-chat-langchainjs** — RAG แบบไม่มีเซิร์ฟเวอร์ด้วย Azure Functions + LangChain.js + Cosmos DB พร้อมรองรับการพัฒนาในเครื่อง Ollama
  - **chat-with-your-data-solution-accelerator** — ตัวเร่งความเร็ว RAG สำหรับองค์กรพร้อมพอร์ทัลแอดมิน, การรวมทีม Teams, และตัวเลือก PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — แอปรองรับ MCP หลายตัวแทนพร้อมเซิร์ฟเวอร์ใน .NET, Python, Java และ TypeScript
  - **azd-ai-starter** — เทมเพลตเริ่มต้นโครงสร้างพื้นฐาน Azure AI Bicep ขั้นพื้นฐาน
  - **🔗 ลิงก์แกลเลอรี AZD AI ที่ยอดเยี่ยม** — อ้างอิงถึง [แกลเลอรี awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ เทมเพลต)

#### แก้ไข
- **🔗 การนำทาง agents.md**: ลิงก์ก่อนหน้า/ถัดไปสอดคล้องกับลำดับบทเรียนใน README บทที่ 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 ลิงก์เสียใน agents.md**: แก้ไข `production-ai-practices.md` เป็น `../chapter-08-production/production-ai-practices.md` (3 ครั้ง)
- **📦 โค้ดที่เลิกใช้ใน agents.md**: แทนที่ `opencensus` ด้วย `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API ไม่ถูกต้องใน agents.md**: ย้าย `max_tokens` จาก `create_agent()` ไปยัง `create_run()` เป็น `max_completion_tokens`
- **🔢 การนับโทเค็นใน agents.md**: แทนที่การประมาณค่าแบบหยาบด้วย `len//4` ด้วย `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: แก้ไขบริการจาก "Cognitive Search + App Service" เป็น "Azure AI Search + Azure Container Apps" (โฮสต์เริ่มต้นเปลี่ยน ต.ค. 2024)
- **contoso-chat**: ปรับคำอธิบายเพื่ออ้างอิง Azure AI Foundry + Prompty ให้ตรงกับชื่อและเทคโนโลยีของ repo จริง

#### ลบ
- **ai-document-processing**: ลบการอ้างอิงเทมเพลตที่ไม่ทำงาน (repo ไม่เปิดสาธารณะเป็นเทมเพลต AZD)

#### ปรับปรุง
- **📝 แบบฝึกหัดใน agents.md**: แบบฝึกหัด 1 แสดงผลลัพธ์ที่คาดหวังและขั้นตอน `azd monitor`; แบบฝึกหัด 2 มีโค้ดลงทะเบียน `FunctionTool` ครบถ้วน; แบบฝึกหัด 3 แทนคำแนะนำคลุมเครือด้วยคำสั่ง `prepdocs.py` ที่ชัดเจน
- **📚 ทรัพยากรใน agents.md**: อัปเดตลิงก์เอกสารเป็น Azure AI Agent Service docs และ quickstart เวอร์ชันปัจจุบัน
- **📋 ตารางขั้นตอนถัดไปใน agents.md**: เพิ่มลิงก์แลบเวิร์กชอป AI เพื่อความครอบคลุมบทเรียนทั้งหมด

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
#### การปรับปรุงนำทางหลักสูตร  
**เวอร์ชันนี้ปรับปรุงการนำทางบทใน README.md ด้วยรูปแบบตารางที่พัฒนาขึ้น**

#### การเปลี่ยนแปลง  
- **ตารางแผนที่หลักสูตร**: ปรับปรุงด้วยลิงก์บทเรียนโดยตรง, ประมาณเวลาจัดการเรียน และการประเมินความซับซ้อน  
- **การลบโฟลเดอร์**: เอาโฟลเดอร์เก่าที่ซ้ำซ้อนออก (deployment/, getting-started/, pre-deployment/, troubleshooting/)  
- **การตรวจสอบลิงก์**: ตรวจสอบความถูกต้องลิงก์ภายในในตารางแผนที่หลักสูตรทั้งหมด 21+ รายการแล้ว  

### [v3.16.0] - 2026-02-05

#### การอัปเดตชื่อผลิตภัณฑ์  
**เวอร์ชันนี้อัปเดตรายการชื่อผลิตภัณฑ์ให้ตรงกับแบรนด์ Microsoft ปัจจุบัน**

#### การเปลี่ยนแปลง  
- **Microsoft Foundry → Microsoft Foundry**: อัปเดตการอ้างอิงทั้งหมดในไฟล์ที่ไม่ใช่ไฟล์แปลภาษา  
- **Azure AI Agent Service → Foundry Agents**: เปลี่ยนชื่อบริการเพื่อสะท้อนแบรนด์ใหม่  

#### ไฟล์ที่อัปเดต  
- `README.md` - หน้าแลนด์ดิ้งหลักสูตรหลัก  
- `changelog.md` - ประวัติรุ่น  
- `course-outline.md` - โครงสร้างหลักสูตร  
- `docs/chapter-02-ai-development/agents.md` - คู่มือ AI agents  
- `examples/README.md` - เอกสารตัวอย่าง  
- `workshop/README.md` - หน้าแลนด์ดิ้งเวิร์กช็อป  
- `workshop/docs/index.md` - ดรรชนีเวิร์กช็อป  
- `workshop/docs/instructions/*.md` - ทุกไฟล์คำแนะนำเวิร์กช็อป  

---

### [v3.15.0] - 2026-02-05

#### การปรับโครงสร้างที่เก็บหลัก : ใช้ชื่อโฟลเดอร์ตามบท  
**เวอร์ชันนี้ปรับโครงสร้างเอกสารเป็นโฟลเดอร์บทเฉพาะเพื่อการนำทางที่ชัดเจนขึ้น**

#### การเปลี่ยนชื่อโฟลเดอร์  
โฟลเดอร์เก่าถูกแทนที่ด้วยโฟลเดอร์เรียงลำดับบท:  
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`  
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`  
- `docs/deployment/` → `docs/chapter-04-infrastructure/`  
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`  
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`  
- เพิ่ม: `docs/chapter-05-multi-agent/`  

#### การย้ายไฟล์  
| ไฟล์ | จาก | เป็น |  
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
| ไฟล์ทั้งหมดใน pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |  
| ไฟล์ทั้งหมดใน troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |  

#### เพิ่มเติม  
- **📚 ไฟล์ README ของแต่ละบท**: สร้าง README.md ในแต่ละโฟลเดอร์บทพร้อม:  
  - วัตถุประสงค์การเรียนรู้และระยะเวลา  
  - ตารางบทเรียนพร้อมคำอธิบาย  
  - คำสั่งเริ่มต้นอย่างรวดเร็ว  
  - การนำทางไปบทอื่นๆ  

#### การเปลี่ยนแปลง  
- **🔗 ปรับปรุงลิงก์ภายในทั้งหมด**: อัปเดตเส้นทางกว่า 78+ รายการในไฟล์เอกสารทั้งหมด  
- **🗺️ README.md หลัก**: ปรับปรุงแผนที่หลักสูตรด้วยโครงสร้างบทใหม่  
- **📝 examples/README.md**: อัปเดตอ้างอิงข้ามไปยังโฟลเดอร์บท  

#### ลบออก  
- โครงสร้างโฟลเดอร์เก่า (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)  

---

### [v3.14.0] - 2026-02-05

#### ปรับโครงสร้างที่เก็บ: การนำทางบท  
**เวอร์ชันนี้เพิ่มไฟล์ README การนำทางบท (ถูกแทนที่โดย v3.15.0)**  

---

### [v3.13.0] - 2026-02-05

#### คู่มือ AI Agents ใหม่  
**เวอร์ชันนี้เพิ่มคู่มือที่ครอบคลุมสำหรับการปรับใช้ AI agents ด้วย Azure Developer CLI**

#### เพิ่มเติม  
- **🤖 docs/microsoft-foundry/agents.md**: คู่มือครบถ้วนประกอบด้วย:  
  - AI agents คืออะไร และแตกต่างจากแชทบอทอย่างไร  
  - แม่แบบ agent เริ่มต้น 3 แบบ (Foundry Agents, Prompty, RAG)  
  - รูปแบบสถาปัตยกรรม agent (ตัวเดียว, RAG, หลาย agent)  
  - การตั้งค่าและปรับแต่งเครื่องมือ  
  - การติดตามและมอนิเตอร์  
  - การพิจารณาค่าใช้จ่ายและการปรับปรุงประสิทธิภาพ  
  - การแก้ไขปัญหาทั่วไป  
  - แบบฝึกหัด 3 ชุดพร้อมเกณฑ์ความสำเร็จ  

#### โครงสร้างเนื้อหา  
- **บทนำ**: แนวคิด agent สำหรับผู้เริ่มต้น  
- **เริ่มต้นอย่างรวดเร็ว**: ปรับใช้ agent ด้วย `azd init --template get-started-with-ai-agents`  
- **รูปแบบสถาปัตยกรรม**: แผนภาพรูปแบบ agent  
- **การตั้งค่า**: การตั้งค่าเครื่องมือและตัวแปรสภาพแวดล้อม  
- **การมอนิเตอร์**: การผสาน Application Insights  
- **แบบฝึกหัด**: การเรียนรู้แบบลงมือทำขั้นตอน (20-45 นาทีต่อชุด)  

---

### [v3.12.0] - 2026-02-05

#### การอัปเดตสภาพแวดล้อม DevContainer  
**เวอร์ชันนี้อัปเดตการตั้งค่าสภาพแวดล้อม container สำหรับการพัฒนา ด้วยเครื่องมือสมัยใหม่และค่าเริ่มต้นที่ดีขึ้นสำหรับประสบการณ์การเรียนรู้ AZD**

#### การเปลี่ยนแปลง  
- **🐳 ภาพฐาน**: เปลี่ยนจาก `python:3.12-bullseye` เป็น `python:3.12-bookworm` (Debian stable เวอร์ชันล่าสุด)  
- **📛 ชื่อคอนเทนเนอร์**: เปลี่ยนจาก "Python 3" เป็น "AZD for Beginners" ให้เข้าใจง่ายกว่า  

#### เพิ่มเติม  
- **🔧 ฟีเจอร์ใหม่ของ Dev Container**:  
  - `azure-cli` พร้อมเปิดใช้งาน Bicep  
  - `node:20` (เวอร์ชัน LTS สำหรับแม่แบบ AZD)  
  - `github-cli` สำหรับจัดการแม่แบบ  
  - `docker-in-docker` สำหรับการปรับใช้ container app  

- **🔌 การส่งต่อพอร์ต**: ตั้งค่าพอร์ตล่วงหน้าสำหรับการพัฒนาทั่วไป:  
  - 8000 (ดูตัวอย่าง MkDocs)  
  - 3000 (เว็บแอป)  
  - 5000 (Python Flask)  
  - 8080 (API)  

- **🧩 ส่วนขยาย VS Code ใหม่**:  
  - `ms-python.vscode-pylance` - IntelliSense Python ขั้นสูง  
  - `ms-azuretools.vscode-azurefunctions` - รองรับ Azure Functions  
  - `ms-azuretools.vscode-docker` - รองรับ Docker  
  - `ms-azuretools.vscode-bicep` - รองรับภาษา Bicep  
  - `ms-azure-devtools.azure-resource-groups` - การจัดการทรัพยากร Azure  
  - `yzhang.markdown-all-in-one` - แก้ไข Markdown  
  - `DavidAnson.vscode-markdownlint` - ตรวจสอบ Markdown  
  - `bierner.markdown-mermaid` - รองรับไดอะแกรม Mermaid  
  - `redhat.vscode-yaml` - รองรับ YAML (สำหรับ azure.yaml)  
  - `eamodio.gitlens` - การแสดงผล Git  
  - `mhutchie.git-graph` - ประวัติ Git  

- **⚙️ การตั้งค่า VS Code**: เพิ่มค่าตั้งต้นสำหรับตัวแปลภาษา Python, ฟอร์แมตไฟล์อัตโนมัติ, และตัดช่องว่างขาวเกิน  

- **📦 อัปเดต requirements-dev.txt**:  
  - เพิ่มปลั๊กอิน minify สำหรับ MkDocs  
  - เพิ่ม pre-commit สำหรับคุณภาพโค้ด  
  - เพิ่มแพ็กเกจ Azure SDK (azure-identity, azure-mgmt-resource)  

#### แก้ไข  
- **คำสั่งหลังสร้างคอนเทนเนอร์**: ตรวจสอบการติดตั้ง AZD และ Azure CLI ตอนสตาร์ทคอนเทนเนอร์  

---

### [v3.11.0] - 2026-02-05

#### ปรับปรุง README สำหรับผู้เริ่มต้น  
**เวอร์ชันนี้ปรับปรุง README.md ให้เข้าถึงง่ายขึ้นสำหรับผู้เริ่มต้นและเพิ่มทรัพยากรสำคัญสำหรับนักพัฒนา AI**

#### เพิ่มเติม  
- **🆚 เปรียบเทียบ Azure CLI กับ AZD**: อธิบายชัดเจนว่าเมื่อไหร่ควรใช้เครื่องมือแต่ละตัว พร้อมตัวอย่างใช้งานจริง  
- **🌟 ลิงก์ AZD ที่ยอดเยี่ยม**: ลิงก์ตรงไปยังแกลเลอรีแม่แบบและแหล่งอ้างอิงชุมชน:  
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - แม่แบบพร้อมใช้งานกว่า 200 แบบ  
  - [ส่งแม่แบบ](https://github.com/Azure/awesome-azd/issues) - การมีส่วนร่วมของชุมชน  
- **🎯 คู่มือเริ่มต้นอย่างรวดเร็ว**: ส่วนเริ่มต้น 3 ขั้นตอนง่าย (ติดตั้ง → ลงชื่อเข้าใช้ → ปรับใช้)  
- **📊 ตารางนำทางตามประสบการณ์**: คำแนะนำชัดเจนว่าจะเริ่มต้นจากส่วนใดตามประสบการณ์ของนักพัฒนา  

#### การเปลี่ยนแปลง  
- **โครงสร้าง README**: จัดเรียงใหม่เพื่อเปิดเผยข้อมูลสำคัญก่อน  
- **ส่วนแนะนำ**: เขียนใหม่เพื่ออธิบาย “ความมหัศจรรย์ของ `azd up`” สำหรับผู้เริ่มต้นโดยสมบูรณ์  
- **ลบเนื้อหาซ้ำซ้อน**: เอาส่วนแก้ไขปัญหาซ้ำออก  
- **คำสั่งแก้ไขปัญหา**: แก้ไขการอ้างอิง `azd logs` เป็น `azd monitor --logs`  

#### แก้ไข  
- **🔐 คำสั่งตรวจสอบสิทธิ์**: เพิ่ม `azd auth login` และ `azd auth logout` ใน cheat-sheet.md  
- **คำสั่งไม่ถูกต้อง**: ลบ `azd logs` ที่เหลือในส่วนแก้ไขปัญหา README  

#### หมายเหตุ  
- **ขอบเขต**: การเปลี่ยนแปลงใช้กับ README.md หลัก และ resources/cheat-sheet.md  
- **กลุ่มเป้าหมาย**: ปรับปรุงสำหรับนักพัฒนาที่เพิ่งเริ่มใช้ AZD  

---

### [v3.10.0] - 2026-02-05

#### อัปเดตความถูกต้องคำสั่ง Azure Developer CLI  
**เวอร์ชันนี้แก้ไขคำสั่ง AZD ที่ไม่ถูกต้องในเอกสารทั้งหมด เพื่อให้ตัวอย่างโค้ดทุกอันใช้ไวยากรณ์ Azure Developer CLI ที่ถูกต้อง**

#### แก้ไข  
- **🔧 ลบคำสั่ง AZD ที่ไม่มีอยู่จริง**: ตรวจสอบและแก้ไขคำสั่งผิดพลาดอย่างครอบคลุม:  
  - `azd logs` (ไม่มีจริง) → แทนที่ด้วย `azd monitor --logs` หรือ Azure CLI ทางเลือก  
  - คำสั่งย่อย `azd service` (ไม่มีจริง) → แทนที่ด้วย `azd show` และ Azure CLI  
  - `azd infra import/export/validate` (ไม่มีจริง) → ลบหรือแทนที่ด้วยตัวเลือกที่ถูกต้อง  
  - ธง `azd deploy --rollback/--incremental/--parallel/--detect-changes` (ไม่มีจริง) → ลบออก  
  - ธง `azd provision --what-if/--rollback` (ไม่มีจริง) → เปลี่ยนใช้ `--preview`  
  - `azd config validate` (ไม่มีจริง) → แทนที่ด้วย `azd config list`  
  - `azd info`, `azd history`, `azd metrics` (ไม่มีจริง) → ลบออก  

- **📚 ไฟล์ที่อัปเดตด้วยการแก้ไขคำสั่ง**:  
  - `resources/cheat-sheet.md`: ปรับปรุงคำสั่งทั้งหมดใหม่  
  - `docs/deployment/deployment-guide.md`: แก้ไขกลยุทธ์การ rollback และการปรับใช้  
  - `docs/troubleshooting/debugging.md`: แก้ไขส่วนวิเคราะห์บันทึก  
  - `docs/troubleshooting/common-issues.md`: อัปเดตคำสั่งแก้ไขปัญหา  
  - `docs/troubleshooting/ai-troubleshooting.md`: แก้ไขส่วนการแก้จุดบกพร่อง AZD  
  - `docs/getting-started/azd-basics.md`: แก้ไขคำสั่งมอนิเตอร์  
  - `docs/getting-started/first-project.md`: อัปเดตตัวอย่างมอนิเตอร์และแก้ไขปัญหา  
  - `docs/getting-started/installation.md`: แก้ไขตัวอย่างคำสั่ง help และ version  
  - `docs/pre-deployment/application-insights.md`: แก้ไขคำสั่งดูบันทึก  
  - `docs/pre-deployment/coordination-patterns.md`: แก้ไขคำสั่งดีบัก agent  

- **📝 อัปเดตการอ้างอิงเวอร์ชัน**:  
  - `docs/getting-started/installation.md`: เปลี่ยนเวอร์ชันที่กำหนดตายตัวจาก `1.5.0` เป็น `1.x.x` พร้อมลิงก์ไปยัง release  

#### การเปลี่ยนแปลง  
- **กลยุทธ์ Rollback**: อัปเดตเอกสารให้ใช้ rollback ผ่าน Git (AZD ไม่มี rollback ในตัว)  
- **การดูบันทึก**: เปลี่ยนจาก `azd logs` เป็น `azd monitor --logs`, `azd monitor --live` และคำสั่ง Azure CLI  
- **ส่วนประสิทธิภาพ**: ลบธงปรับใช้แบบขนาน/เพิ่มทีละน้อยที่ไม่มีจริง และให้แนวทางที่ถูกต้อง  

#### รายละเอียดทางเทคนิค  
- **คำสั่ง AZD ที่ถูกต้อง**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`  
- **ธง `azd monitor` ที่ถูกต้อง**: `--live`, `--logs`, `--overview`  
- **ฟีเจอร์ถูกลบ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`  

#### หมายเหตุ  
- **การตรวจสอบ**: คำสั่งได้รับการตรวจสอบกับ Azure Developer CLI v1.23.x  

---

### [v3.9.0] - 2026-02-05

#### การเสร็จสมบูรณ์เวิร์กช็อปและปรับปรุงคุณภาพเอกสาร  
**เวอร์ชันนี้เสร็จสมบูรณ์โมดูลเวิร์กช็อปแบบโต้ตอบ, แก้ไขลิงก์เอกสารเสียทั้งหมด และปรับปรุงคุณภาพเนื้อหารวมถึงสำหรับนักพัฒนา AI ที่ใช้ Microsoft AZD**

#### เพิ่มเติม  
- **📝 CONTRIBUTING.md**: เอกสารแนวทางการร่วมพัฒนาใหม่ พร้อม:  
  - คำแนะนำชัดเจนสำหรับการรายงานปัญหาและเสนอเปลี่ยนแปลง  
  - มาตรฐานการเขียนเอกสารสำหรับเนื้อหาใหม่  
  - แนวทางตัวอย่างโค้ดและข้อกำหนดการเขียนข้อความคอมมิต
  - ข้อมูลการมีส่วนร่วมของชุมชน

#### เสร็จสมบูรณ์
- **🎯 โมดูลเวิร์กช็อป 7 (สรุป)**: เสร็จสิ้นโมดูลสรุปอย่างครบถ้วนด้วย:
  - สรุปผลงานเวิร์กช็อปอย่างครอบคลุม
  - ส่วนแนวคิดสำคัญที่ครอบคลุม AZD, เทมเพลต และ Microsoft Foundry
  - คำแนะนำสำหรับการต่อเนื่องการเรียนรู้
  - แบบฝึกหัดความท้าทายเวิร์กช็อปพร้อมระดับความยาก
  - ลิงก์ข้อเสนอแนะและการสนับสนุนชุมชน

- **📚 โมดูลเวิร์กช็อป 3 (การแยกส่วน)**: ปรับปรุงวัตถุประสงค์การเรียนรู้ด้วย:
  - คำแนะนำการเปิดใช้งาน GitHub Copilot กับ MCP servers
  - ความเข้าใจโครงสร้างโฟลเดอร์เทมเพลต AZD
  - รูปแบบการจัดระเบียบ Infrastructure-as-code (Bicep)
  - คำแนะนำการทำแล็บลงมือทำ

- **🔧 โมดูลเวิร์กช็อป 6 (การรื้อถอน)**: เสร็จสมบูรณ์ด้วย:
  - วัตถุประสงค์การล้างทรัพยากรและการจัดการค่าใช้จ่าย
  - การใช้ `azd down` สำหรับการยกเลิกโครงสร้างพื้นฐานอย่างปลอดภัย
  - คำแนะนำการกู้คืนบริการ cognitive แบบลบแบบนุ่มนวล
  - คำแนะนำเพิ่มพิเศษสำหรับ GitHub Copilot และ Azure Portal

#### แก้ไขแล้ว
- **🔗 แก้ไขลิงก์เสีย**: แก้ไขลิงก์เอกสารภายในเสียกว่า 15 ลิงก์:
  - `docs/ai-foundry/ai-model-deployment.md`: แก้ไขเส้นทางไปยัง microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: แก้ไขเส้นทาง ai-model-deployment.md และ production-ai-practices.md
  - `docs/getting-started/first-project.md`: แทนที่ cicd-integration.md ที่ไม่มีด้วย deployment-guide.md
  - `examples/retail-scenario.md`: แก้ไขเส้นทาง FAQ และคู่มือแก้ปัญหา
  - `examples/container-app/microservices/README.md`: แก้ไขเส้นทางหน้าหลักคอร์สและคู่มือการปรับใช้
  - `resources/faq.md` และ `resources/glossary.md`: ปรับปรุงการอ้างอิงบท AI
  - `course-outline.md`: แก้ไขคู่มือผู้สอนและแล็บเวิร์กช็อป AI

- **📅 แบนเนอร์สถานะเวิร์กช็อป**: อัปเดตจาก "อยู่ระหว่างการก่อสร้าง" เป็นสถานะเวิร์กช็อปที่ดำเนินการแล้ว วันที่กุมภาพันธ์ 2026

- **🔗 การนำทางเวิร์กช็อป**: แก้ไขลิงก์นำทางเสียใน README.md ของเวิร์กช็อปที่ชี้ไปยังโฟลเดอร์ lab-1-azd-basics ที่ไม่มี

#### เปลี่ยนแปลง
- **การนำเสนอเวิร์กช็อป**: ลบคำเตือน "อยู่ระหว่างการก่อสร้าง" เวิร์กช็อปเสร็จสมบูรณ์และพร้อมใช้งานแล้ว
- **ความสอดคล้องของการนำทาง**: รับรองว่าโมดูลเวิร์กช็อปทั้งหมดมีการนำทางระหว่างโมดูลอย่างเหมาะสม
- **การอ้างอิงเส้นทางการเรียนรู้**: ปรับปรุงการอ้างอิงข้ามบทให้ใช้เส้นทาง microsoft-foundry ที่ถูกต้อง

#### ตรวจสอบแล้ว
- ✅ ไฟล์ markdown ภาษาอังกฤษทั้งหมดมีลิงก์ภายในถูกต้อง
- ✅ โมดูลเวิร์กช็อป 0-7 เสร็จสมบูรณ์พร้อมวัตถุประสงค์การเรียนรู้
- ✅ การนำทางระหว่างบทและโมดูลทำงานอย่างถูกต้อง
- ✅ เนื้อหานี้เหมาะสำหรับนักพัฒนา AI ที่ใช้ Microsoft AZD
- ✅ ใช้ภาษาที่เหมาะสำหรับผู้เริ่มต้นและโครงสร้างที่ชัดเจน
- ✅ CONTRIBUTING.md ให้คำแนะนำชัดเจนสำหรับผู้ร่วมชุมชน

#### การดำเนินการด้านเทคนิค
- **การตรวจสอบลิงก์**: ใช้สคริปต์ PowerShell อัตโนมัติเพื่อตรวจสอบลิงก์ภายใน .md ทั้งหมด
- **การตรวจสอบเนื้อหา**: ตรวจสอบด้วยมือถึงความสมบูรณ์ของเวิร์กช็อปและความเหมาะสมสำหรับผู้เริ่มต้น
- **ระบบนำทาง**: ใช้รูปแบบการนำทางระหว่างบทและโมดูลที่สอดคล้องกัน

#### หมายเหตุ
- **ขอบเขต**: การเปลี่ยนแปลงนี้ใช้กับเอกสารภาษาอังกฤษเท่านั้น
- **การแปล**: โฟลเดอร์แปลภาษาไม่ได้อัปเดตในเวอร์ชันนี้ (การแปลอัตโนมัติจะซิงค์ภายหลัง)
- **ระยะเวลาเวิร์กช็อป**: เวิร์กช็อปสมบูรณ์ตอนนี้ให้เวลาเรียน 3-4 ชั่วโมงแบบลงมือทำ

---

### [v3.8.0] - 2025-11-19

#### เอกสารขั้นสูง: การตรวจสอบ ความปลอดภัย และรูปแบบผู้แทนหลายคน
**เวอร์ชันนี้เพิ่มบทเรียนระดับ A ครบถ้วนเกี่ยวกับการรวม Application Insights, รูปแบบการรับรองตัวตน และการประสานงานผู้แทนหลายคนสำหรับการปรับใช้ในสภาพแวดล้อมจริง**

#### เพิ่มเติม
- **📊 บทเรียนการรวม Application Insights**: ใน `docs/pre-deployment/application-insights.md`:
  - การปรับใช้โฟกัส AZD พร้อมการจัดสรรอัตโนมัติ
  - เทมเพลต Bicep ครบถ้วนสำหรับ Application Insights + Log Analytics
  - แอป Python ทำงานพร้อมเทเลเมตรีที่กำหนดเอง (มากกว่า 1,200 บรรทัด)
  - รูปแบบการตรวจสอบ AI/LLM (ติดตามโทเค็น/ค่าใช้จ่ายของ Microsoft Foundry Models)
  - ไดอะแกรม Mermaid 6 ภาพ (สถาปัตยกรรม, การติดตามแบบกระจาย, การไหลของเทเลเมตรี)
  - แบบฝึกหัดลงมือทำ 3 แบบ (แจ้งเตือน, แดชบอร์ด, การตรวจสอบ AI)
  - ตัวอย่างคำสืบค้น Kusto และกลยุทธ์ปรับค่าใช้จ่าย
  - สตรีมเมตริกแบบเรียลไทม์และดีบักแบบเรียลไทม์
  - เวลาเรียน 40-50 นาทีพร้อมรูปแบบพร้อมผลิต

- **🔐 บทเรียนรูปแบบการรับรองและความปลอดภัย**: ใน `docs/getting-started/authsecurity.md`:
  - รูปแบบการรับรองตัวตน 3 แบบ (connection strings, Key Vault, managed identity)
  - เทมเพลตโครงสร้างพื้นฐาน Bicep ครบถ้วนสำหรับการปรับใช้ที่ปลอดภัย
  - โค้ดแอป Node.js พร้อมการรวม Azure SDK
  - แบบฝึกหัดครบ 3 แบบ (เปิดใช้งาน managed identity, user-assigned identity, การหมุน Key Vault)
  - แนวปฏิบัติด้านความปลอดภัยที่ดีที่สุดและการตั้งค่า RBAC
  - คู่มือการแก้ปัญหาและการวิเคราะห์ค่าใช้จ่าย
  - รูปแบบการรับรองตัวตนแบบไม่ใช้รหัสผ่านพร้อมใช้งานในสภาพผลิต

- **🤖 บทเรียนรูปแบบการประสานงานผู้แทนหลายคน**: ใน `docs/pre-deployment/coordination-patterns.md`:
  - รูปแบบการประสานงาน 5 แบบ (ตามลำดับ, พร้อมกัน, เป็นลำดับชั้น, ขับเคลื่อนด้วยเหตุการณ์, การเห็นด้วยกัน)
  - การทำงานของบริการออร์เคสเตรเตอร์ครบถ้วน (Python/Flask, มากกว่า 1,500 บรรทัด)
  - การใช้งานผู้แทนเฉพาะ 3 แบบ (วิจัย, นักเขียน, บรรณาธิการ)
  - การรวม Service Bus สำหรับคิวข้อความ
  - การจัดการสถานะ Cosmos DB สำหรับระบบกระจาย
  - ไดอะแกรม Mermaid 6 ภาพ แสดงปฏิสัมพันธ์ผู้แทน
  - แบบฝึกหัดขั้นสูง 3 แบบ (การจัดการหมดเวลารอ, ตรรกะการลองใหม่, เบรกเกอร์วงจร)
  - การแจกแจงค่าใช้จ่าย ($240-565/เดือน) พร้อมกลยุทธ์ปรับค่าใช้จ่าย
  - การรวม Application Insights สำหรับการตรวจสอบ

#### ปรับปรุง
- **บทก่อนการปรับใช้**: ปัจจุบันรวมรูปแบบการตรวจสอบและการประสานงานอย่างครบถ้วน
- **บทเริ่มต้น**: ปรับปรุงด้วยรูปแบบการรับรองตัวตนระดับมืออาชีพ
- **ความพร้อมสำหรับการผลิต**: ครอบคลุมตั้งแต่ความปลอดภัยจนถึงการสังเกตการณ์
- **เค้าโครงคอร์ส**: ปรับปรุงให้อ้างอิงบทเรียนใหม่ในบทที่ 3 และ 6

#### เปลี่ยนแปลง
- **ลำดับการเรียนรู้**: การบูรณาการความปลอดภัยและการตรวจสอบได้ดีขึ้นตลอดหลักสูตร
- **คุณภาพเอกสาร**: มาตรฐานระดับ A ที่สม่ำเสมอ (95-97%) ในบทเรียนใหม่
- **รูปแบบสำหรับการผลิต**: ครอบคลุมตั้งแต่ต้นจนจบสำหรับการปรับใช้ในองค์กร

#### ปรับปรุง
- **ประสบการณ์นักพัฒนา**: เส้นทางชัดเจนจากการพัฒนาไปสู่การตรวจสอบการผลิต
- **มาตรฐานความปลอดภัย**: รูปแบบมืออาชีพสำหรับการรับรองและการจัดการความลับ
- **การสังเกตการณ์**: การรวม Application Insights ครบถ้วนกับ AZD
- **งาน AI**: การตรวจสอบเฉพาะสำหรับ Microsoft Foundry Models และระบบผู้แทนหลายคน

#### ตรวจสอบแล้ว
- ✅ บทเรียนทั้งหมดรวมโค้ดใช้งานจริงครบถ้วน (ไม่ใช่เพียงตัวอย่างโค้ดย่อ)
- ✅ ไดอะแกรม Mermaid สำหรับการเรียนรู้ด้วยภาพ (19 ภาพใน 3 บทเรียน)
- ✅ แบบฝึกหัดลงมือทำพร้อมขั้นตอนการตรวจสอบ (9 แบบ)
- ✅ เทมเพลต Bicep พร้อมสำหรับการปรับใช้ผ่าน `azd up`
- ✅ การวิเคราะห์ค่าใช้จ่ายและกลยุทธ์ปรับปรุง
- ✅ คู่มือการแก้ปัญหาและแนวปฏิบัติที่ดีที่สุด
- ✅ จุดตรวจสอบความรู้พร้อมคำสั่งตรวจสอบ

#### ผลการให้คะแนนเอกสาร
- **docs/pre-deployment/application-insights.md**: - คู่มือการตรวจสอบครบถ้วน
- **docs/getting-started/authsecurity.md**: - รูปแบบความปลอดภัยระดับมืออาชีพ
- **docs/pre-deployment/coordination-patterns.md**: - สถาปัตยกรรมผู้แทนหลายคนขั้นสูง
- **เนื้อหาใหม่โดยรวม**: - มาตรฐานคุณภาพสูงที่สม่ำเสมอ

#### การดำเนินการด้านเทคนิค
- **Application Insights**: Log Analytics + เทเลเมตรีที่กำหนดเอง + การติดตามแบบกระจาย
- **การรับรองตัวตน**: Managed Identity + Key Vault + รูปแบบ RBAC
- **ผู้แทนหลายคน**: Service Bus + Cosmos DB + Container Apps + ออร์เคสเตรชัน
- **การตรวจสอบ**: เมตริกสด + คำสืบค้น Kusto + แจ้งเตือน + แดชบอร์ด
- **การจัดการค่าใช้จ่าย**: กลยุทธ์การสุ่มตัวอย่าง, นโยบายการเก็บรักษา, การควบคุมงบประมาณ

### [v3.7.0] - 2025-11-19

#### การปรับปรุงคุณภาพเอกสารและตัวอย่าง Microsoft Foundry Models ใหม่
**เวอร์ชันนี้ปรับปรุงคุณภาพเอกสารทั่วทั้ง repository และเพิ่มตัวอย่างการปรับใช้ Microsoft Foundry Models ที่สมบูรณ์พร้อมกับส่วนต่อประสานแชท gpt-4.1**

#### เพิ่มเติม
- **🤖 ตัวอย่างแชท Microsoft Foundry Models**: การปรับใช้ gpt-4.1 สมบูรณ์พร้อมใช้งานใน `examples/azure-openai-chat/`:
  - โครงสร้างพื้นฐาน Microsoft Foundry Models ครบถ้วน (การปรับใช้โมเดล gpt-4.1)
  - อินเทอร์เฟซแชทบนคำสั่ง Python พร้อมประวัติการสนทนา
  - การรวม Key Vault สำหรับจัดเก็บคีย์ API อย่างปลอดภัย
  - การติดตามการใช้โทเค็นและประมาณค่าใช้จ่าย
  - การจำกัดอัตราและการจัดการข้อผิดพลาด
  - README ครบถ้วนพร้อมคำแนะนำปรับใช้ 35-45 นาที
  - ไฟล์พร้อมใช้งาน 11 ไฟล์ (เทมเพลต Bicep, แอป Python, การกำหนดค่า)
- **📚 แบบฝึกหัดเอกสาร**: เพิ่มแบบฝึกหัดลงมือทำในคู่มือการกำหนดค่า:
  - แบบฝึกหัด 1: การกำหนดค่าหลายสภาพแวดล้อม (15 นาที)
  - แบบฝึกหัด 2: การฝึกจัดการความลับ (10 นาที)
  - เกณฑ์ความสำเร็จชัดเจนและขั้นตอนตรวจสอบ
- **✅ การตรวจสอบการปรับใช้**: เพิ่มส่วนตรวจสอบในคู่มือการปรับใช้:
  - ขั้นตอนตรวจสอบสุขภาพระบบ
  - รายการตรวจสอบเกณฑ์ความสำเร็จ
  - ผลลัพธ์ที่คาดหวังสำหรับคำสั่งปรับใช้ทั้งหมด
  - การอ้างอิงแก้ไขปัญหาอย่างรวดเร็ว

#### ปรับปรุง
- **examples/README.md**: ปรับปรุงเป็นคุณภาพระดับ A (93%):
  - เพิ่ม azure-openai-chat ในทุกส่วนที่เกี่ยวข้อง
  - ปรับจำนวนตัวอย่างท้องถิ่นจาก 3 เป็น 4
  - เพิ่มในตารางตัวอย่างแอป AI
  - ผนวกเข้ากับ Quick Start สำหรับผู้ใช้ระดับกลาง
  - เพิ่มในส่วนเทมเพลต Microsoft Foundry
  - ปรับปรุงตารางเปรียบเทียบและส่วนการหาข้อมูลเทคโนโลยี
- **คุณภาพเอกสาร**: ปรับปรุงจาก B+ (87%) เป็น A- (92%) ทั่วโฟลเดอร์ docs:
  - เพิ่มผลลัพธ์ที่คาดหวังในตัวอย่างคำสั่งสำคัญ
  - รวมขั้นตอนการตรวจสอบสำหรับการเปลี่ยนแปลงการกำหนดค่า
  - เสริมการเรียนรู้ด้วยมือด้วยแบบฝึกหัดที่ใช้งานจริง

#### เปลี่ยนแปลง
- **ลำดับการเรียนรู้**: การผสมผสานตัวอย่าง AI สำหรับผู้เรียนระดับกลางดีขึ้น
- **โครงสร้างเอกสาร**: แบบฝึกหัดที่ใช้ได้จริงมากขึ้นพร้อมผลลัพธ์ชัดเจน
- **กระบวนการตรวจสอบ**: เพิ่มเกณฑ์ความสำเร็จชัดเจนในขั้นตอนงานสำคัญ

#### ปรับปรุง
- **ประสบการณ์นักพัฒนา**: การปรับใช้ Microsoft Foundry Models ตอนนี้ใช้เวลา 35-45 นาที (เทียบกับ 60-90 นาทีสำหรับทางเลือกที่ซับซ้อน)
- **ความโปร่งใสด้านค่าใช้จ่าย**: ประมาณค่าใช้จ่ายชัดเจน ($50-200/เดือน) สำหรับตัวอย่าง Microsoft Foundry Models
- **เส้นทางการเรียนรู้**: นักพัฒนา AI มีจุดเริ่มต้นชัดเจนด้วย azure-openai-chat
- **มาตรฐานเอกสาร**: ผลลัพธ์ที่คาดหวังและขั้นตอนตรวจสอบที่สอดคล้องกัน

#### ตรวจสอบแล้ว
- ✅ ตัวอย่าง Microsoft Foundry Models ทำงานได้สมบูรณ์ด้วย `azd up`
- ✅ ไฟล์การใช้งานทั้ง 11 ไฟล์ถูกต้องตามไวยากรณ์
- ✅ คำแนะนำใน README ตรงกับประสบการณ์การปรับใช้จริง
- ✅ อัปเดตลิงก์เอกสารในมากกว่า 8 แห่ง
- ✅ ดัชนีตัวอย่างสะท้อนตัวอย่างท้องถิ่น 4 ตัวอย่างอย่างถูกต้อง
- ✅ ไม่มีลิงก์ภายนอกซ้ำในตาราง
- ✅ การอ้างอิงการนำทางทั้งหมดถูกต้อง

#### การดำเนินการด้านเทคนิค
- **สถาปัตยกรรม Microsoft Foundry Models**: gpt-4.1 + Key Vault + รูปแบบ Container Apps
- **ความปลอดภัย**: พร้อม Managed Identity, ความลับใน Key Vault
- **การตรวจสอบ**: การรวม Application Insights
- **การจัดการค่าใช้จ่าย**: การติดตามโทเค็นและการปรับค่าใช้จ่าย
- **การปรับใช้**: คำสั่ง `azd up` เดียวสำหรับการติดตั้งครบถ้วน

### [v3.6.0] - 2025-11-19

#### อัปเดตใหญ่: ตัวอย่างการปรับใช้ Container App
**เวอร์ชันนี้นำเสนอ ตัวอย่างการปรับใช้แอปคอนเทนเนอร์ที่สมบูรณ์พร้อมใช้งานในสภาพผลิตโดยใช้ Azure Developer CLI (AZD) พร้อมเอกสารครบและการรวมเข้าเส้นทางการเรียนรู้**

#### เพิ่มเติม
- **🚀 ตัวอย่าง Container App**: ตัวอย่างใหม่ในท้องถิ่นที่ `examples/container-app/`:
  - [คู่มือหลัก](examples/container-app/README.md): ภาพรวมครบถ้วนของการปรับใช้แบบคอนเทนเนอร์, เริ่มต้นเร็ว, สภาพผลิต, และรูปแบบขั้นสูง
  - [Flask API ง่ายๆ](../../examples/container-app/simple-flask-api): REST API เหมาะสำหรับผู้เริ่มต้นพร้อม scale-to-zero, probes สุขภาพ, การตรวจสอบ, และการแก้ปัญหา
  - [สถาปัตยกรรมไมโครเซอร์วิส](../../examples/container-app/microservices): ปรับใช้หลายบริการพร้อมสภาพผลิต (API Gateway, Product, Order, User, Notification), การส่งข้อความแบบอะซิงโครนัส, Service Bus, Cosmos DB, Azure SQL, การติดตามแบบกระจาย, blue-green/canary deployment
- **แนวปฏิบัติที่ดีที่สุด**: ความปลอดภัย, การตรวจสอบ, การปรับค่าใช้จ่าย, และคำแนะนำ CI/CD สำหรับงานคอนเทนเนอร์
- **ตัวอย่างโค้ด**: `azure.yaml` ครบถ้วน, เทมเพลต Bicep, และบริการหลายภาษา (Python, Node.js, C#, Go)
- **การทดสอบและแก้ปัญหา**: สถานการณ์ทดสอบครบชุด, คำสั่งตรวจสอบ, คู่มือแก้ปัญหา

#### เปลี่ยนแปลง
- **README.md**: อัปเดตให้แสดงและลิงก์ตัวอย่างแอปคอนเทนเนอร์ใหม่ ภายใต้ "Local Examples - Container Applications"
- **examples/README.md**: อัปเดตเพื่อเน้นตัวอย่างแอปคอนเทนเนอร์, เพิ่มรายการในตารางเปรียบเทียบ, และปรับปรุงการอ้างอิงเทคโนโลยี/สถาปัตยกรรม
- **เค้าโครงคอร์ส & คู่มือศึกษา**: อัปเดตให้อ้างอิงตัวอย่างแอปคอนเทนเนอร์และรูปแบบการปรับใช้ในบทที่เกี่ยวข้อง

#### ตรวจสอบแล้ว
- ✅ ตัวอย่างใหม่ทั้งหมดปรับใช้ได้ด้วย `azd up` และเป็นไปตามแนวปฏิบัติที่ดีที่สุด
- ✅ อัปเดตลิงก์ภายในเอกสารและระบบนำทางแล้ว
- ✅ ตัวอย่างครอบคลุมตั้งแต่ระดับเริ่มต้นจนถึงขั้นสูง รวมไมโครเซอร์วิสในสภาพผลิต

#### หมายเหตุ
- **ขอบเขต**: เอกสารและตัวอย่างภาษาอังกฤษเท่านั้น
- **ขั้นตอนถัดไป**: ขยายรูปแบบคอนเทนเนอร์ขั้นสูงและอัตโนมัติ CI/CD ในรุ่นถัดไป

### [v3.5.0] - 2025-11-19

#### การรีแบรนด์ผลิตภัณฑ์: Microsoft Foundry
**เวอร์ชันนี้ดำเนินการเปลี่ยนชื่อผลิตภัณฑ์อย่างครบถ้วนจาก "Microsoft Foundry" เป็น "Microsoft Foundry" ในเอกสารภาษาอังกฤษทั้งหมด สะท้อนการรีแบรนด์อย่างเป็นทางการของ Microsoft**

#### เปลี่ยนแปลง
- **🔄 อัปเดตชื่อผลิตภัณฑ์**: รีแบรนด์ครบถ้วนจาก "Microsoft Foundry" เป็น "Microsoft Foundry"
  - อัปเดตการอ้างอิงทั้งหมดในเอกสารภาษาอังกฤษในโฟลเดอร์ `docs/`
  - เปลี่ยนชื่อโฟลเดอร์: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - เปลี่ยนชื่อไฟล์: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - รวมทั้งหมด: อัปเดตการอ้างอิงเนื้อหา 23 รายการใน 7 ไฟล์เอกสาร

- **📁 การเปลี่ยนแปลงโครงสร้างโฟลเดอร์**:
  - `docs/ai-foundry/` เปลี่ยนชื่อเป็น `docs/microsoft-foundry/`
  - อัปเดตการอ้างอิงข้ามทั้งหมดให้สะท้อนโครงสร้างโฟลเดอร์ใหม่
  - ตรวจสอบลิงก์การนำทางในเอกสารทั้งหมด

- **📄 การเปลี่ยนชื่อไฟล์**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - อัปเดตลิงก์ภายในทั้งหมดให้ชี้ไปยังชื่อไฟล์ใหม่

#### ไฟล์ที่อัปเดต
- **เอกสารบทเรียน** (7 ไฟล์):
  - `docs/microsoft-foundry/ai-model-deployment.md` - อัปเดต 3 ลิงก์การนำทาง
  - `docs/microsoft-foundry/ai-workshop-lab.md` - อัปเดตชื่อผลิตภัณฑ์ 4 รายการ
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ใช้ Microsoft Foundry อยู่แล้ว (จากการอัปเดตก่อนหน้า)
  - `docs/microsoft-foundry/production-ai-practices.md` - อัปเดต 3 รายการ (ภาพรวม, ความคิดเห็นชุมชน, เอกสาร)
  - `docs/getting-started/azd-basics.md` - อัปเดตลิงก์อ้างอิงข้าม 4 รายการ
  - `docs/getting-started/first-project.md` - อัปเดตลิงก์การนำทางบทเรียน 2 รายการ
  - `docs/getting-started/installation.md` - อัปเดตลิงก์บทเรียนถัดไป 2 รายการ
  - `docs/troubleshooting/ai-troubleshooting.md` - อัปเดต 3 รายการ (การนำทาง, ชุมชน Discord)
  - `docs/troubleshooting/common-issues.md` - อัปเดตลิงก์การนำทาง 1 รายการ
  - `docs/troubleshooting/debugging.md` - อัปเดตลิงก์การนำทาง 1 รายการ

- **ไฟล์โครงสร้างหลักสูตร** (2 ไฟล์):
  - `README.md` - อัปเดตการอ้างอิง 17 รายการ (ภาพรวมหลักสูตร, ชื่อบท, ส่วนแม่แบบ, ความเห็นชุมชน)
  - `course-outline.md` - อัปเดตการอ้างอิง 14 รายการ (ภาพรวม, วัตถุประสงค์การเรียนรู้, แหล่งข้อมูลบทเรียน)

#### ได้รับการตรวจสอบ
- ✅ ไม่มีการอ้างอิงเส้นทางโฟลเดอร์ "ai-foundry" ที่เหลือในเอกสารภาษาอังกฤษ
- ✅ ไม่มีการอ้างอิงชื่อผลิตภัณฑ์ "Microsoft Foundry" ที่เหลือในเอกสารภาษาอังกฤษ
- ✅ ลิงก์การนำทางทั้งหมดทำงานได้ตามโครงสร้างโฟลเดอร์ใหม่
- ✅ การเปลี่ยนชื่อไฟล์และโฟลเดอร์เสร็จสมบูรณ์เรียบร้อย
- ✅ ตรวจสอบการอ้างอิงข้ามบทเรียนสำเร็จ

#### หมายเหตุ
- **ขอบเขต**: การเปลี่ยนแปลงนี้ใช้กับเอกสารภาษาอังกฤษในโฟลเดอร์ `docs/` เท่านั้น
- **การแปล**: โฟลเดอร์การแปล (`translations/`) ยังไม่ได้รับการอัปเดตในเวอร์ชันนี้
- **เวิร์กช็อป**: วัสดุเวิร์กช็อป (`workshop/`) ยังไม่ได้รับการอัปเดตในเวอร์ชันนี้
- **ตัวอย่าง**: ไฟล์ตัวอย่างอาจยังอ้างอิงชื่อเดิมอยู่ (จะดำเนินการในอัปเดตถัดไป)
- **ลิงก์ภายนอก**: URL ภายนอกและการอ้างอิง GitHub ยังคงเหมือนเดิม

#### คู่มือการย้ายข้อมูลสำหรับผู้ร่วมพัฒนา
หากคุณมีสาขาท้องถิ่นหรือเอกสารที่อ้างอิงโครงสร้างเดิม:
1. อัปเดตการอ้างอิงโฟลเดอร์: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. อัปเดตการอ้างอิงไฟล์: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. แทนที่ชื่อผลิตภัณฑ์: "Microsoft Foundry" → "Microsoft Foundry"
4. ตรวจสอบว่าลิงก์ภายในเอกสารทั้งหมดยังใช้งานได้ตามปกติ

---

### [v3.4.0] - 2025-10-24

#### การปรับปรุงการพรีวิวโครงสร้างพื้นฐานและการตรวจสอบ
**เวอร์ชันนี้แนะนำการสนับสนุนครบถ้วนสำหรับฟีเจอร์พรีวิวตัวใหม่ของ Azure Developer CLI และพัฒนาประสบการณ์ผู้ใช้ในเวิร์กช็อป**

#### เพิ่มเติม
- **🧪 เอกสารฟีเจอร์ azd provision --preview**: ครอบคลุมการใช้งานความสามารถพรีวิวโครงสร้างพื้นฐานใหม่
  - อ้างอิงคำสั่งและตัวอย่างใช้ใน cheat sheet
  - การบูรณาการอย่างละเอียดในคู่มือ provisioning พร้อมกรณีใช้งานและข้อดี
  - การผสานการตรวจสอบก่อนใช้งานเพื่อความปลอดภัยในการดีพลอย
  - อัปเดตคู่มือเริ่มต้นด้วยแนวทางการดีพลอยแบบปลอดภัย
- **🚧 แบนเนอร์สถานะเวิร์กช็อป**: แบนเนอร์ HTML มืออาชีพแสดงสถานะการพัฒนาเวิร์กช็อป
  - ออกแบบด้วยกราเดียนต์และไอคอนแสดงสถานะก่อสร้างชัดเจน
  - แสดงเวลาการอัปเดตล่าสุดเพื่อความโปร่งใส
  - รองรับการใช้งานบนอุปกรณ์เคลื่อนที่ทุกรูปแบบ

#### ปรับปรุง
- **ความปลอดภัยโครงสร้างพื้นฐาน**: ฟังก์ชันพรีวิวถูกรวมในเอกสารการดีพลอยทั้งหมด
- **การตรวจสอบก่อนดีพลอย**: สคริปต์อัตโนมัติรวมการทดสอบพรีวิวโครงสร้างพื้นฐาน
- **เวิร์กโฟลว์สำหรับนักพัฒนา**: อัปเดตลำดับคำสั่งให้รวมพรีวิวเป็นแนวปฏิบัติที่ดีที่สุด
- **ประสบการณ์เวิร์กช็อป**: แจ้งความชัดเจนเกี่ยวกับสถานะพัฒนาเนื้อหาให้ผู้ใช้ทราบ

#### เปลี่ยนแปลง
- **แนวทางปฏิบัติที่ดีที่สุดในการดีพลอย**: ใช้วิถีทางพรีวิวก่อนดีพลอยเป็นหลัก
- **โฟลว์เอกสาร**: ย้ายขั้นตอนตรวจสอบโครงสร้างพื้นฐานให้มาก่อนในกระบวนการเรียนรู้
- **การนำเสนอเวิร์กช็อป**: สื่อสารสถานะอย่างมืออาชีพพร้อมไทม์ไลน์การพัฒนา

#### ปรับปรุงเพิ่มเติม
- **แนวทางปลอดภัยเป็นหลัก**: สามารถตรวจสอบการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนดีพลอยจริงได้
- **การทำงานร่วมกันในทีม**: แชร์ผลลัพธ์พรีวิวเพื่อตรวจสอบและอนุมัติได้
- **ความตระหนักถึงต้นทุน**: เข้าใจค่าใช้จ่ายทรัพยากรก่อน provisioning
- **ลดความเสี่ยง**: ลดปัญหาการดีพลอยล้มเหลวด้วยการตรวจสอบล่วงหน้า

#### การดำเนินการทางเทคนิค
- **การบูรณาการหลายเอกสาร**: เอกสารฟีเจอร์พรีวิวใน 4 ไฟล์หลัก
- **รูปแบบคำสั่ง**: ความสอดคล้องในไวยากรณ์และตัวอย่างในเอกสารทั้งหมด
- **แนวทางปฏิบัติที่ดีที่สุด**: รวมพรีวิวในเวิร์กโฟลว์ตรวจสอบและสคริปต์
- **สัญลักษณ์แสดงภาพ**: ทำเครื่องหมายฟีเจอร์ใหม่อย่างชัดเจนเพื่อค้นพบง่าย

#### โครงสร้างเวิร์กช็อป
- **การสื่อสถานะ**: แบนเนอร์ HTML มืออาชีพพร้อมสไตล์กราเดียนต์
- **ประสบการณ์ผู้ใช้**: แจ้งสถานะพัฒนาเนื้อหาอย่างชัดเจนเพื่อป้องกันความสับสน
- **การนำเสนออย่างมืออาชีพ**: รักษาความน่าเชื่อถือของที่เก็บข้อมูลพร้อมตั้งความคาดหวัง
- **ความโปร่งใสของไทม์ไลน์**: แสดงเวลาปรับปรุงล่าสุดเป็นตุลาคม 2025 เพื่อความรับผิดชอบ

### [v3.3.0] - 2025-09-24

#### วัสดุเวิร์กช็อปและประสบการณ์การเรียนรู้เชิงโต้ตอบที่พัฒนาแล้ว
**เวอร์ชันนี้แนะนำวัสดุเวิร์กช็อปครบถ้วนด้วยการแนะนำแบบโต้ตอบบนเบราว์เซอร์และเส้นทางการเรียนรู้ที่มีโครงสร้าง**

#### เพิ่มเติม
- **🎥 คู่มือเวิร์กช็อปเชิงโต้ตอบ**: ประสบการณ์เวิร์กช็อปบนเบราว์เซอร์ด้วยความสามารถพรีวิว MkDocs
- **📝 คำแนะนำเวิร์กช็อปแบบมีโครงสร้าง**: เส้นทางเรียนรู้ 7 ขั้นตอนตั้งแต่การค้นพบถึงการปรับแต่ง
  - 0-แนะนำ: ภาพรวมเวิร์กช็อปและการติดตั้ง
  - 1-เลือกแม่แบบ AI: ขั้นตอนการค้นหาและเลือกแม่แบบ
  - 2-ตรวจสอบแม่แบบ AI: การดีพลอยและการตรวจสอบ
  - 3-แยกส่วนแม่แบบ AI: ทำความเข้าใจโครงสร้างแม่แบบ
  - 4-กำหนดค่าแม่แบบ AI: การกำหนดค่าและปรับแต่ง
  - 5-ปรับแต่งแม่แบบ AI: การแก้ไขขั้นสูงและทำซ้ำ
  - 6-รื้อถอนโครงสร้างพื้นฐาน: การเคลียร์และจัดการทรัพยากร
  - 7-สรุป: บทสรุปและขั้นตอนถัดไป
- **🛠️ เครื่องมือเวิร์กช็อป**: การตั้งค่า MkDocs พร้อมธีม Material เพื่อประสบการณ์เรียนรู้ที่ดีขึ้น
- **🎯 เส้นทางเรียนรู้แบบลงมือทำ**: วิธีการ 3 ขั้นตอน (ค้นพบ → ดีพลอย → ปรับแต่ง)
- **📱 การบูรณาการ GitHub Codespaces**: การตั้งค่าสภาพแวดล้อมพัฒนาอย่างลื่นไหล

#### ปรับปรุง
- **ห้องปฏิบัติการเวิร์กช็อป AI**: ขยายเวลาการเรียนรู้ที่มีโครงสร้าง 2-3 ชั่วโมงครบถ้วน
- **เอกสารเวิร์กช็อป**: การนำเสนอแบบมืออาชีพพร้อมการนำทางและสื่อภาพ
- **ลำดับการเรียนรู้**: แนะแนวทีละขั้นตอนจากการเลือกแม่แบบถึงการดีพลอยจริง
- **ประสบการณ์นักพัฒนา**: การรวมเครื่องมือสำหรับเวิร์กโฟลว์พัฒนาอย่างราบรื่น

#### ปรับปรุงเพิ่มเติม
- **การเข้าถึง**: อินเทอร์เฟซบนเบราว์เซอร์พร้อมฟังก์ชันค้นหา, คัดลอก, และสลับธีม
- **การเรียนรู้ตามจังหวะตนเอง**: โครงสร้างเวิร์กช็อปยืดหยุ่นรองรับความเร็วการเรียนรู้ต่างกัน
- **การใช้งานจริง**: กรณีดีพลอยแม่แบบ AI ในโลกจริง
- **การรวมชุมชน**: การเชื่อมต่อ Discord สำหรับสนับสนุนเวิร์กช็อปและความร่วมมือ

#### คุณสมบัติเวิร์กช็อป
- **ระบบค้นหาในตัว**: ค้นหาคีย์เวิร์ดและบทเรียนอย่างรวดเร็ว
- **คัดลอกโค้ดบล็อก**: ฟังก์ชันชี้เพื่อคัดลอกทุกตัวอย่างโค้ด
- **สลับธีม**: รองรับโหมดมืด/สว่างตามความชอบ
- **สื่อภาพ**: ภาพหน้าจอและไดอะแกรมช่วยให้เข้าใจดีขึ้น
- **การช่วยเหลือแบบบูรณาการ**: เข้าถึง Discord ชุมชนได้โดยตรง

### [v3.2.0] - 2025-09-17

#### การปรับโครงสร้างการนำทางครั้งใหญ่และระบบการเรียนรู้แบบแบ่งบท
**เวอร์ชันนี้แนะนำโครงสร้างการเรียนรู้แบบแบ่งบทที่ครบวงจรพร้อมระบบนำทางที่พัฒนาไปทั่วคลังข้อมูล**

#### เพิ่มเติม
- **📚 ระบบการเรียนรู้แบบแบ่งบท**: จัดโครงสร้างหลักสูตรทั้งหมดเป็น 8 บทเรียนเรียนเรียงลำดับความก้าวหน้า
  - บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว (⭐ - 30-45 นาที)
  - บทที่ 2: การพัฒนาแบบ AI-First (⭐⭐ - 1-2 ชั่วโมง)
  - บทที่ 3: การกำหนดค่า & การยืนยันตัวตน (⭐⭐ - 45-60 นาที)
  - บทที่ 4: โครงสร้างพื้นฐานเป็นโค้ด & การดีพลอย (⭐⭐⭐ - 1-1.5 ชั่วโมง)
  - บทที่ 5: โซลูชัน AI หลายเอเจนต์ (⭐⭐⭐⭐ - 2-3 ชั่วโมง)
  - บทที่ 6: การตรวจสอบก่อนดีพลอย & การวางแผน (⭐⭐ - 1 ชั่วโมง)
  - บทที่ 7: การแก้ปัญหา & การดีบัก (⭐⭐ - 1-1.5 ชั่วโมง)
  - บทที่ 8: รูปแบบการผลิต & องค์กร (⭐⭐⭐⭐ - 2-3 ชั่วโมง)
- **📚 ระบบนำทางครบถ้วน**: หัวข้อและท้ายหน้าการนำทางสม่ำเสมอในเอกสารทั้งหมด
- **🎯 การติดตามความก้าวหน้า**: รายการตรวจสอบการเรียนจบและระบบยืนยันการเรียนรู้
- **🗺️ แนวทางเส้นทางการเรียนรู้**: ทางเข้าชัดเจนสำหรับผู้เรียนตามระดับประสบการณ์และเป้าหมาย
- **🔗 นำทางอ้างอิงข้าม**: เชื่อมโยงบทเรียนที่เกี่ยวข้องและบทเรียนพื้นฐานอย่างชัดเจน

#### ปรับปรุง
- **โครงสร้าง README**: เปลี่ยนเป็นแพลตฟอร์มการเรียนรู้ที่มีโครงสร้างแบ่งบท
- **การนำทางเอกสาร**: ทุกหน้ามีบริบทบทเรียนและแนะแนวความก้าวหน้า
- **การจัดระเบียบแม่แบบ**: แม่แบบและตัวอย่างแมปเข้าบทเรียนที่เหมาะสม
- **การบูรณาการแหล่งข้อมูล**: cheat sheets, FAQs, และคู่มือศึกษาผูกกับบทเรียนที่เกี่ยวข้อง
- **การรวมเวิร์กช็อป**: ห้องปฏิบัติการแบบลงมือทำแมปเข้ากับเป้าหมายการเรียนรู้หลายบท

#### เปลี่ยนแปลง
- **ลำดับการเรียนรู้**: จากเอกสารเชิงเส้นเป็นระบบเรียนแบบแบ่งบทที่ยืดหยุ่น
- **ตำแหน่งคู่มือกำหนดค่า**: ย้ายเป็น บทที่ 3 เพื่อการเรียนรู้ที่ลื่นไหลขึ้น
- **รวมเนื้อหา AI**: เนื้อหาเฉพาะ AI รวมอย่างเหมาะสมทั่วเส้นทางเรียนรู้
- **เนื้อหาเกี่ยวกับการผลิต**: รวมรูปแบบขั้นสูงในบทที่ 8 สำหรับผู้เรียนระดับองค์กร

#### ปรับปรุงเพิ่มเติม
- **ประสบการณ์ผู้ใช้**: มี breadcrumb การนำทางและตัวบ่งชี้ความก้าวหน้าชัดเจน
- **การเข้าถึง**: รูปแบบการนำทางสม่ำเสมอช่วยให้เรียนรู้ได้ง่ายขึ้น
- **การนำเสนออย่างมืออาชีพ**: โครงสร้างหลักสูตรแบบมหาวิทยาลัย เหมาะสำหรับการฝึกอบรมทั้งทางวิชาการและธุรกิจ
- **ประสิทธิภาพการเรียนรู้**: ลดเวลาค้นหาเนื้อหาที่เกี่ยวข้องด้วยการจัดระเบียบดีขึ้น

#### การดำเนินการทางเทคนิค
- **หัวเรื่องนำทาง**: นำทางบทเรียนเป็นมาตรฐานในเอกสารกว่า 40 ไฟล์
- **ส่วนท้ายการนำทาง**: แนะแนวความก้าวหน้าและตัวบ่งชี้การจบบทสม่ำเสมอ
- **การเชื่อมโยงข้าม**: ระบบเชื่อมโยงภายในครอบคลุมเชื่อมโยงความคิดที่เกี่ยวข้อง
- **การแมปบทเรียน**: แม่แบบและตัวอย่างเชื่อมโยงอย่างชัดเจนกับเป้าหมายการเรียนรู้

#### ปรับปรุงคู่มือการศึกษา
- **📚 วัตถุประสงค์การเรียนรู้ครบถ้วน**: รีโครงสร้างคู่มือศึกษาตามระบบ 8 บท
- **🎯 การประเมินแบบแบ่งบท**: แต่ละบทมีวัตถุประสงค์เฉพาะและแบบฝึกหัดปฏิบัติ
- **📋 การติดตามความก้าวหน้า**: ตารางเรียนรายสัปดาห์พร้อมผลลัพธ์ที่วัดได้และรายการตรวจสอบการจบ
- **❓ คำถามประเมิน**: ตรวจสอบความรู้ในแต่ละบทพร้อมผลลัพธ์เชิงมืออาชีพ
- **🛠️ แบบฝึกหัดปฏิบัติ**: กิจกรรมลงมือทำพร้อมสถานการณ์ดีพลอยจริงและแก้ไขปัญหา
- **📊 การก้าวหน้าทักษะ**: ก้าวจากแนวคิดพื้นฐานสู่รูปแบบองค์กรอย่างชัดเจน พร้อมเน้นพัฒนาการทางอาชีพ
- **🎓 กรอบใบรับรอง**: ผลลัพธ์พัฒนาวิชาชีพและระบบยอมรับในชุมชน
- **⏱️ การจัดการไทม์ไลน์**: แผนเรียน 10 สัปดาห์ที่มีการตรวจสอบตามเป้าหมาย

### [v3.1.0] - 2025-09-17

#### ปรับปรุงโซลูชัน AI หลายเอเจนต์
**เวอร์ชันนี้พัฒนาโซลูชันร้านค้าปลีกหลายเอเจนต์ด้วยการตั้งชื่อเอเจนต์ที่ชัดเจนและเอกสารที่ดียิ่งขึ้น**

#### เปลี่ยนแปลง
- **คำศัพท์หลายเอเจนต์**: แทนที่ "เอเจนต์ Cora" ด้วย "เอเจนต์ลูกค้า" ในโซลูชันร้านค้าปลีกหลายเอเจนต์ทั้งหมดเพื่อความเข้าใจที่ชัดเจนขึ้น
- **สถาปัตยกรรมเอเจนต์**: อัปเดตเอกสารทั้งหมด, แม่แบบ ARM และตัวอย่างโค้ดให้ใช้ชื่อ "เอเจนต์ลูกค้า" อย่างสม่ำเสมอ
- **ตัวอย่างกำหนดค่า**: ปรับปรุงรูปแบบกำหนดค่าเอเจนต์ด้วยการตั้งชื่อที่ทันสมัย
- **ความสอดคล้องเอกสาร**: ตรวจสอบว่าอ้างอิงทั้งหมดใช้ชื่อเอเจนต์ที่มืออาชีพและอธิบายความหมายได้

#### ปรับปรุง
- **แพ็คเกจแม่แบบ ARM**: อัปเดต retail-multiagent-arm-template ด้วยอ้างอิงเอเจนต์ลูกค้า
- **ไดอะแกรมสถาปัตยกรรม**: รีเฟรชไดอะแกรม Mermaid ด้วยการตั้งชื่อเอเจนต์ใหม่
- **ตัวอย่างโค้ด**: คลาส Python และตัวอย่างการใช้งานใช้ชื่อ CustomerAgent แล้ว
- **ตัวแปรสภาพแวดล้อม**: อัปเดตสคริปต์การดีพลอยทั้งหมดให้ใช้แบบแผน CUSTOMER_AGENT_NAME

#### ปรับปรุงเพิ่มเติม
- **ประสบการณ์นักพัฒนา**: บทบาทและความรับผิดชอบของเอเจนต์ชัดเจนขึ้นในเอกสาร
- **ความพร้อมในการผลิต**: สอดคล้องดีกับคอนเวนชันชื่อขององค์กร
- **วัสดุการเรียนรู้**: การตั้งชื่อเอเจนต์เป็นมิตรกว่าเพื่อการศึกษา
- **การใช้งานแม่แบบ**: เข้าใจง่ายขึ้นเกี่ยวกับฟังก์ชันและรูปแบบการดีพลอยเอเจนต์

#### รายละเอียดทางเทคนิค
- อัปเดตไดอะแกรม Mermaid ด้วยการอ้างอิง CustomerAgent
- แทนที่ชื่อคลาส CoraAgent ด้วย CustomerAgent ในตัวอย่าง Python
- แก้ไขการตั้งค่า JSON ของแม่แบบ ARM ให้ใช้ประเภทเอเจนต์ "customer"
- อัปเดตตัวแปรสภาพแวดล้อมจาก CORA_AGENT_* เป็น CUSTOMER_AGENT_*
- รีเฟรชคำสั่งดีพลอยและการตั้งค่าคอนเทนเนอร์ทั้งหมด

### [v3.0.0] - 2025-09-12

#### การเปลี่ยนแปลงครั้งใหญ่ - เน้นนักพัฒนา AI และการรวม Microsoft Foundry
**เวอร์ชันนี้เปลี่ยนคลังข้อมูลเป็นแหล่งเรียนรู้ที่มุ่งเน้น AI อย่างครบวงจรพร้อมการรวม Microsoft Foundry**

#### เพิ่มเติม
- **🤖 เส้นทางการเรียนรู้ AI-First**: รีโครงสร้างทั้งหมดเน้นนักพัฒนาและวิศวกร AI
- **คู่มือการรวม Microsoft Foundry**: เอกสารครบถ้วนสำหรับการเชื่อมต่อ AZD กับบริการ Microsoft Foundry
- **รูปแบบการดีพลอยโมเดล AI**: คู่มืออย่างละเอียดครอบคลุมการเลือกโมเดล, กำหนดค่า และกลยุทธ์การดีพลอยในสภาพแวดล้อมผลิตจริง
- **ห้องปฏิบัติการเวิร์กช็อป AI**: เวิร์กช็อปเชิงปฏิบัติการ 2-3 ชั่วโมงสำหรับการแปลงแอปพลิเคชัน AI เป็นโซลูชันที่สามารถนำไปใช้งานได้ด้วย AZD  
- **แนวทางปฏิบัติที่ดีที่สุดสำหรับ AI ในการผลิต**: แบบแผนสำหรับองค์กรที่พร้อมสำหรับการขยายขนาด การตรวจสอบ และการรักษาความปลอดภัยเวิร์กโหลด AI  
- **คู่มือแก้ไขปัญหาเฉพาะ AI**: การแก้ไขปัญหาอย่างครอบคลุมสำหรับ Microsoft Foundry Models, Cognitive Services, และปัญหาการปรับใช้ AI  
- **แกลเลอรีเทมเพลต AI**: คอลเล็คชันเทมเพลต Microsoft Foundry ที่คัดสรรพร้อมคำจำกัดความความซับซ้อน  
- **วัสดุสำหรับเวิร์กช็อป**: โครงสร้างเวิร์กช็อปครบถ้วนพร้อมห้องปฏิบัติการเชิงปฏิบัติการและวัสดุอ้างอิง  

#### ปรับปรุงเพิ่มเติม  
- **โครงสร้าง README**: มุ่งเน้นนักพัฒนา AI พร้อมข้อมูลความสนใจจากชุมชน 45% จาก Microsoft Foundry Discord  
- **เส้นทางการเรียนรู้**: เส้นทางสำหรับนักพัฒนา AI เฉพาะทางควบคู่กับเส้นทางปกติสำหรับนักเรียนและวิศวกร DevOps  
- **คำแนะนำเทมเพลต**: เทมเพลต AI ที่โดดเด่น รวมถึง azure-search-openai-demo, contoso-chat, และ openai-chat-app-quickstart  
- **การรวมชุมชน**: การสนับสนุนชุมชน Discord ที่ดีขึ้นพร้อมช่องทางและการสนทนาเฉพาะ AI  

#### การมุ่งเน้นด้านความปลอดภัยและการผลิต  
- **รูปแบบการจัดการตัวตน**: การรับรองความถูกต้องและการตั้งค่าความปลอดภัยเฉพาะ AI  
- **การปรับค่าใช้จ่ายให้เหมาะสม**: การติดตามการใช้โทเค็นและการควบคุมงบประมาณสำหรับเวิร์กโหลด AI  
- **การปรับใช้หลายภูมิภาค**: กลยุทธ์สำหรับการปรับใช้แอปพลิเคชัน AI ทั่วโลก  
- **การตรวจสอบประสิทธิภาพ**: ตัวชี้วัดเฉพาะ AI และการรวม Application Insights  

#### คุณภาพเอกสาร  
- **โครงสร้างหลักสูตรเชิงเส้น**: ความก้าวหน้าตามตรรกะจากแบบแผนการปรับใช้ AI ระดับเริ่มต้นถึงขั้นสูง  
- **URL ที่ผ่านการตรวจสอบ**: ลิงก์ไปยังแหล่งที่มาภายนอกทั้งหมดได้รับการตรวจสอบและเข้าใช้งานได้  
- **ข้อมูลอ้างอิงครบถ้วน**: ลิงก์เอกสารภายในทั้งหมดได้รับการตรวจสอบและใช้งานได้  
- **พร้อมสำหรับการผลิต**: แบบแผนการปรับใช้ระดับองค์กรพร้อมตัวอย่างโลกจริง  

### [v2.0.0] - 2025-09-09

#### การเปลี่ยนแปลงหลัก - โครงสร้างใหม่ของที่เก็บและการปรับปรุงระดับมืออาชีพ  
**เวอร์ชันนี้แสดงถึงการปรับโครงสร้างและการนำเสนอเนื้อหาของที่เก็บอย่างมีนัยสำคัญ**  

#### เพิ่มเติม  
- **กรอบการเรียนรู้ที่มีโครงสร้าง**: หน้าทุกหน้าของเอกสารประกอบด้วยบทนำ, เป้าหมายการเรียนรู้, และผลลัพธ์การเรียนรู้  
- **ระบบการนำทาง**: เพิ่มลิงก์บทเรียนก่อนหน้า/ถัดไปทั่วเอกสารเพื่อความก้าวหน้าที่มีการแนะนำ  
- **คู่มือการศึกษา**: study-guide.md ครอบคลุมวัตถุประสงค์การเรียนรู้, แบบฝึกหัดปฏิบัติ, และวัสดุการประเมิน  
- **การนำเสนอแบบมืออาชีพ**: ลบไอคอนอีโมจิทั้งหมดเพื่อปรับปรุงการเข้าถึงและความเป็นมืออาชีพ  
- **โครงสร้างเนื้อหาที่ดีขึ้น**: การจัดระเบียบและลำดับการไหลของวัสดุการเรียนรู้ที่ดีขึ้น  

#### การเปลี่ยนแปลง  
- **รูปแบบเอกสาร**: มาตรฐานเอกสารทั้งหมดด้วยโครงสร้างเน้นการเรียนรู้อย่างสอดคล้อง  
- **ลำดับการนำทาง**: นำทางตามความก้าวหน้าแบบตรรกะผ่านเนื้อหาการเรียนรู้ทั้งหมด  
- **การนำเสนอเนื้อหา**: ลบองค์ประกอบตกแต่งเพื่อความชัดเจนและการจัดรูปแบบแบบมืออาชีพ  
- **โครงสร้างลิงก์**: อัปเดตลิงก์ภายในทั้งหมดเพื่อรองรับระบบนำทางใหม่  

#### ปรับปรุง  
- **การเข้าถึง**: ลบการพึ่งพาอีโมจิเพื่อรองรับการอ่านด้วยหน้าจอได้ดีขึ้น  
- **ภาพลักษณ์มืออาชีพ**: การนำเสนอที่สะอาดและในสไตล์เชิงวิชาการเหมาะกับการเรียนรู้ระดับองค์กร  
- **ประสบการณ์การเรียนรู้**: วิธีการมีโครงสร้างพร้อมวัตถุประสงค์และผลลัพธ์ชัดเจนสำหรับแต่ละบทเรียน  
- **การจัดการเนื้อหา**: ลำดับการไหลและความเชื่อมโยงของหัวข้อที่เกี่ยวข้องดีขึ้น  

### [v1.0.0] - 2025-09-09

#### การเปิดตัวครั้งแรก - ที่เก็บการเรียนรู้ AZD ครบวงจร  

#### เพิ่มเติม  
- **โครงสร้างเอกสารหลัก**  
  - ชุดคำแนะนำการเริ่มต้นใช้งานครบถ้วน  
  - เอกสารการปรับใช้และจัดเตรียมอย่างละเอียด  
  - แหล่งข้อมูลแก้ไขปัญหาและคู่มือดีบัก  
  - เครื่องมือและขั้นตอนการตรวจสอบก่อนปรับใช้  

- **โมดูลเริ่มต้นใช้งาน**  
  - พื้นฐาน AZD: แนวคิดและคำศัพท์หลัก  
  - คู่มือการติดตั้ง: คำแนะนำการตั้งค่าเฉพาะแพลตฟอร์ม  
  - คู่มือการตั้งค่า: การตั้งค่าสภาพแวดล้อมและการรับรองความถูกต้อง  
  - แบบฝึกหัดโครงการแรก: เรียนรู้แบบก้าวต่อก้าวด้วยมือ  

- **โมดูลการปรับใช้และการจัดเตรียม**  
  - คู่มือการปรับใช้: เอกสารกระบวนการทำงานครบถ้วน  
  - คู่มือการจัดเตรียม: Infrastructure as Code ด้วย Bicep  
  - แนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้ในระดับการผลิต  
  - แบบแผนสถาปัตยกรรมหลายบริการ  

- **โมดูลการตรวจสอบก่อนปรับใช้**  
  - การวางแผนความจุ: การตรวจสอบความพร้อมของทรัพยากร Azure  
  - การเลือก SKU: คำแนะนำระดับบริการที่ครบถ้วน  
  - การตรวจสอบก่อนบิน: สคริปต์ตรวจสอบอัตโนมัติ (PowerShell และ Bash)  
  - เครื่องมือประมาณการค่าใช้จ่ายและวางแผนงบประมาณ  

- **โมดูลการแก้ไขปัญหา**  
  - ปัญหาทั่วไป: ปัญหาที่พบบ่อยและวิธีแก้ไข  
  - คู่มือดีบัก: วิธีการแก้ไขปัญหาอย่างมีระบบ  
  - เทคนิคและเครื่องมือวินิจฉัยขั้นสูง  
  - การตรวจสอบและปรับปรุงประสิทธิภาพ  

- **ทรัพยากรและข้อมูลอ้างอิง**  
  - ชีทคำสั่งลัด: อ้างอิงคำสั่งสำคัญอย่างรวดเร็ว  
  - พจนานุกรม: คำจำกัดความคำศัพท์และตัวย่อครบถ้วน  
  - คำถามที่พบบ่อย: คำตอบโดยละเอียดสำหรับคำถามทั่วไป  
  - ลิงก์ทรัพยากรภายนอกและการเชื่อมต่อชุมชน  

- **ตัวอย่างและเทมเพลต**  
  - ตัวอย่างแอปพลิเคชันเว็บเรียบง่าย  
  - เทมเพลตการปรับใช้เว็บไซต์แบบสแตติก  
  - การตั้งค่าแอปคอนเทนเนอร์  
  - แบบแผนการผสานฐานข้อมูล  
  - ตัวอย่างสถาปัตยกรรมไมโครเซอร์วิส  
  - การใช้งานฟังก์ชันเซิร์ฟเวอร์เลส  

#### ฟีเจอร์  
- **รองรับหลายแพลตฟอร์ม**: คู่มือการติดตั้งและตั้งค่าสำหรับ Windows, macOS, และ Linux  
- **หลายระดับทักษะ**: เนื้อหาที่ออกแบบสำหรับนักเรียนถึงนักพัฒนามืออาชีพ  
- **เน้นปฏิบัติจริง**: ตัวอย่างเชิงปฏิบัติและสถานการณ์จริง  
- **ครอบคลุมครบถ้วน**: ตั้งแต่แนวคิดพื้นฐานจนถึงแบบแผนองค์กรขั้นสูง  
- **เน้นความปลอดภัยเป็นหลัก**: แนวทางปฏิบัติความปลอดภัยทั่วทั้งเนื้อหา  
- **การปรับค่าใช้จ่ายให้เหมาะสม**: คำแนะนำสำหรับการปรับใช้ต้นทุนต่ำและการจัดการทรัพยากร  

#### คุณภาพเอกสาร  
- **ตัวอย่างโค้ดละเอียด**: ตัวอย่างโค้ดที่ใช้งานจริงและทดสอบแล้ว  
- **คำแนะนำทีละขั้นตอน**: คำแนะนำที่ชัดเจนและสามารถปฏิบัติตามได้  
- **การจัดการข้อผิดพลาดครบถ้วน**: การแก้ไขปัญหาสำหรับปัญหาทั่วไป  
- **การรวมแนวทางปฏิบัติที่ดีที่สุด**: มาตรฐานอุตสาหกรรมและคำแนะนำ  
- **ความเข้ากันได้ของเวอร์ชัน**: เป็นปัจจุบันกับบริการ Azure ล่าสุดและฟีเจอร์ azd  

## การปรับปรุงในอนาคตที่วางแผนไว้  

### เวอร์ชัน 3.1.0 (วางแผนไว้)  
#### ขยายแพลตฟอร์ม AI  
- **รองรับหลายโมเดล**: แบบแผนการผสานสำหรับ Hugging Face, Azure Machine Learning, และโมเดลแบบกำหนดเอง  
- **กรอบงานตัวแทน AI**: เทมเพลตสำหรับ LangChain, Semantic Kernel, และ AutoGen การปรับใช้  
- **แบบแผน RAG ขั้นสูง**: ตัวเลือกฐานข้อมูลเวกเตอร์นอกเหนือจาก Azure AI Search (Pinecone, Weaviate ฯลฯ)  
- **การสามารถสังเกต AI**: การตรวจสอบที่ดีขึ้นสำหรับประสิทธิภาพโมเดล, การใช้โทเค็น, และคุณภาพการตอบสนอง  

#### ประสบการณ์นักพัฒนา  
- **ส่วนขยาย VS Code**: ประสบการณ์การพัฒนาเชื่อมโยง AZD + Microsoft Foundry  
- **การผสาน GitHub Copilot**: การสร้างเทมเพลต AZD ด้วย AI  
- **บทเรียนเชิงโต้ตอบ**: แบบฝึกหัดเขียนโค้ดพร้อมการตรวจสอบอัตโนมัติสำหรับสถานการณ์ AI  
- **เนื้อหาวิดีโอ**: วิดีโอเสริมสำหรับผู้เรียนแบบเห็นภาพเน้นการปรับใช้ AI  

### เวอร์ชัน 4.0.0 (วางแผนไว้)  
#### แบบแผน AI สำหรับองค์กร  
- **กรอบการกำกับดูแล**: การกำกับดูแลโมเดล AI, การปฏิบัติตามข้อกำหนด, และบันทึกการตรวจสอบ  
- **AI หลายผู้เช่า**: แบบแผนการให้บริการแก่ลูกค้าหลายรายด้วยบริการ AI แยกส่วน  
- **การปรับใช้ AI ที่ Edge**: การผสานกับ Azure IoT Edge และอินสแตนซ์คอนเทนเนอร์  
- **AI คลาวด์ไฮบริด**: แบบแผนการปรับใช้หลายคลาวด์และไฮบริดสำหรับเวิร์กโหลด AI  

#### ฟีเจอร์ขั้นสูง  
- **ระบบอัตโนมัติในสายงาน AI**: การผสาน MLOps กับ Azure Machine Learning pipelines  
- **ความปลอดภัยขั้นสูง**: แบบแผน Zero-trust, จุดสิ้นสุดส่วนตัว, และการป้องกันภัยคุกคามขั้นสูง  
- **การปรับปรุงประสิทธิภาพ**: การปรับจูนและขยายขนาดขั้นสูงสำหรับแอป AI ที่มี Throughput สูง  
- **การกระจายทั่วโลก**: แบบแผนการส่งเนื้อหาและแคชชิ่ง edge สำหรับแอป AI  

### เวอร์ชัน 3.0.0 (วางแผนไว้) - ถูกแทนที่ด้วยเวอร์ชันปัจจุบัน  
#### การเพิ่มที่เสนอ - ได้ดำเนินการใน v3.0.0 แล้ว  
- ✅ **เนื้อหาเน้น AI**: การผสาน Microsoft Foundry ครบถ้วน (เสร็จสมบูรณ์)  
- ✅ **บทเรียนเชิงโต้ตอบ**: ห้องปฏิบัติการเวิร์กช็อป AI (เสร็จสมบูรณ์)  
- ✅ **โมดูลความปลอดภัยขั้นสูง**: แบบแผนความปลอดภัยเฉพาะ AI (เสร็จสมบูรณ์)  
- ✅ **การปรับปรุงประสิทธิภาพ**: กลยุทธ์ปรับแต่งเวิร์กโหลด AI (เสร็จสมบูรณ์)  

### เวอร์ชัน 2.1.0 (วางแผนไว้) - ดำเนินการบางส่วนใน v3.0.0  
#### การปรับปรุงเล็กน้อย - บางส่วนเสร็จในเวอร์ชันปัจจุบัน  
- ✅ **ตัวอย่างเพิ่มเติม**: สถานการณ์การปรับใช้ AI (เสร็จสมบูรณ์)  
- ✅ **คำถามที่พบบ่อยขยาย**: คำถามและแก้ไขปัญหาเฉพาะ AI (เสร็จสมบูรณ์)  
- **การผสานเครื่องมือ**: คู่มือการบูรณาการ IDE และตัวแก้ไขที่ดีขึ้น  
- ✅ **การขยายการตรวจสอบ**: แบบแผนการตรวจสอบและแจ้งเตือนเฉพาะ AI (เสร็จสมบูรณ์)  

#### ยังวางแผนสำหรับเวอร์ชันอนาคต  
- **เอกสารเหมาะกับมือถือ**: การออกแบบตอบสนองสำหรับการเรียนรู้บนมือถือ  
- **เข้าถึงแบบออฟไลน์**: การดาวน์โหลดแพ็กเกจเอกสาร  
- **การผสาน IDE ที่ดีขึ้น**: ส่วนขยาย VS Code สำหรับ AZD + เวิร์กโฟลว์ AI  
- **แดชบอร์ดชุมชน**: เมตริกชุมชนเรียลไทม์และการติดตามการมีส่วนร่วม  

## การมีส่วนร่วมในบันทึกการเปลี่ยนแปลง

### การรายงานการเปลี่ยนแปลง  
เมื่อมีการมีส่วนร่วมในที่เก็บนี้ กรุณาให้รายการบันทึกการเปลี่ยนแปลงรวมถึง:

1. **หมายเลขเวอร์ชัน**: ตามการตั้งเลขเวอร์ชันแบบ Semantic (major.minor.patch)  
2. **วันที่**: วันที่ออกหรืออัปเดตในรูปแบบ YYYY-MM-DD  
3. **หมวดหมู่**: เพิ่ม, เปลี่ยนแปลง, เลิกใช้, ลบ, แก้ไข, ความปลอดภัย  
4. **คำอธิบายชัดเจน**: คำอธิบายสั้น ๆ ของสิ่งที่เปลี่ยนแปลง  
5. **การประเมินผลกระทบ**: ผลกระทบต่อผู้ใช้เดิมอย่างไร  

### หมวดหมู่การเปลี่ยนแปลง  

#### เพิ่ม  
- ฟีเจอร์ใหม่, ส่วนของเอกสาร, หรือความสามารถ  
- ตัวอย่าง, เทมเพลต, หรือทรัพยากรการเรียนรู้ใหม่  
- เครื่องมือ, สคริปต์, หรือยูทิลิตี้เพิ่มเติม  

#### เปลี่ยนแปลง  
- การแก้ไขฟังก์ชันหรือเอกสารที่มีอยู่  
- การปรับปรุงเพื่อความชัดเจนหรือความถูกต้อง  
- การจัดโครงสร้างเนื้อหาหรือการจัดระเบียบใหม่  

#### เลิกใช้  
- ฟีเจอร์หรือวิธีการที่จะเลิกใช้งาน  
- ส่วนเอกสารที่กำหนดให้ถูกลบออกในอนาคต  
- วิธีการที่มีทางเลือกที่ดีกว่า  

#### ลบ  
- ฟีเจอร์, เอกสาร, หรือ ตัวอย่างที่ไม่เกี่ยวข้องแล้ว  
- ข้อมูลล้าสมัยหรือวิธีการเลิกใช้  
- เนื้อหาซ้ำซ้อนหรือต่อเนื่อง  

#### แก้ไข  
- การแก้ไขข้อผิดพลาดในเอกสารหรือโค้ด  
- การแก้ไขปัญหาที่ได้รายงาน  
- การปรับปรุงความถูกต้องหรือฟังก์ชันการทำงาน  

#### ความปลอดภัย  
- การปรับปรุงหรือแก้ไขด้านความปลอดภัย  
- การอัปเดตแนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย  
- การแก้ไขช่องโหว่ด้านความปลอดภัย  

### แนวทางการตั้งเลขเวอร์ชันแบบ Semantic  

#### เวอร์ชันหลัก (X.0.0)  
- การเปลี่ยนแปลงใหญ่ที่ต้องการการดำเนินการจากผู้ใช้  
- การปรับโครงสร้างเนื้อหาหรือองค์กรอย่างมีนัยสำคัญ  
- การเปลี่ยนแปลงวิธีการหรือแนวทางพื้นฐาน  

#### เวอร์ชันย่อย (X.Y.0)  
- ฟีเจอร์หรือเนื้อหาใหม่เพิ่มเติม  
- การปรับปรุงที่รักษาความเข้ากันได้ย้อนหลัง  
- ตัวอย่าง, เครื่องมือ, หรือทรัพยากรเพิ่มเติม  

#### เวอร์ชันแก้ไข (X.Y.Z)  
- การแก้ไขข้อผิดพลาดและแก้ไข  
- การปรับปรุงเล็กน้อยของเนื้อหาที่มีอยู่  
- การชี้แจงและการปรับปรุงเล็กน้อย  

## ข้อเสนอแนะและคำติชมจากชุมชน  

เราส่งเสริมให้ชุมชนแสดงความคิดเห็นเพื่อปรับปรุงแหล่งการเรียนรู้นี้อย่างจริงจัง:  

### วิธีให้ข้อเสนอแนะ  
- **GitHub Issues**: รายงานปัญหาหรือแนะนำการปรับปรุง (ปัญหาเฉพาะ AI ยินดีต้อนรับ)  
- **Discord Discussions**: แบ่งปันไอเดียและร่วมสนทนากับชุมชน Microsoft Foundry  
- **Pull Requests**: มีส่วนร่วมในการปรับปรุงเนื้อหาโดยตรง โดยเฉพาะเทมเพลตและคู่มือ AI  
- **Microsoft Foundry Discord**: เข้าร่วมช่อง #Azure สำหรับการสนทนา AZD + AI  
- **ฟอรัมชุมชน**: เข้าร่วมการสนทนานักพัฒนา Azure ในวงกว้าง  

### หมวดหมู่ข้อเสนอแนะ  
- **ความถูกต้องของเนื้อหา AI**: การแก้ไขข้อมูลการผสานบริการ AI และการปรับใช้  
- **ประสบการณ์การเรียนรู้**: ข้อเสนอแนะสำหรับการพัฒนาการเรียนรู้สำหรับนักพัฒนา AI  
- **เนื้อหา AI ที่ขาดหาย**: คำขอสำหรับเทมเพลต, แบบแผน, หรือตัวอย่าง AI เพิ่มเติม  
- **การเข้าถึง**: การปรับปรุงให้เหมาะกับความต้องการการเรียนรู้ที่หลากหลาย  
- **การผสานเครื่องมือ AI**: ข้อเสนอสำหรับการปรับปรุงเวิร์กโฟลว์การพัฒนา AI  
- **แบบแผน AI สำหรับการผลิต**: คำขอแบบแผนการปรับใช้ AI ระดับองค์กร  

### ความมุ่งมั่นในการตอบรับ  
- **การตอบปัญหา**: ภายใน 48 ชั่วโมงสำหรับปัญหาที่รายงาน  
- **คำขอฟีเจอร์**: การประเมินภายในหนึ่งสัปดาห์  
- **การมีส่วนร่วมของชุมชน**: การตรวจสอบภายในหนึ่งสัปดาห์  
- **ปัญหาด้านความปลอดภัย**: ให้ความสำคัญทันทีโดยตอบกลับอย่างรวดเร็ว  

## ตารางเวลาการบำรุงรักษา  

### การอัปเดตปกติ  
- **การทบทวนรายเดือน**: ความถูกต้องเนื้อหาและการตรวจสอบลิงก์  
- **การอัปเดตรายไตรมาส**: การเพิ่มเนื้อหาหลักและปรับปรุง  
- **การทบทวนครึ่งปี**: การปรับโครงสร้างและปรับปรุงครบถ้วน  
- **การปล่อยเวอร์ชันรายปี**: การอัปเดตเวอร์ชันหลักพร้อมการปรับปรุงสำคัญ  

### การตรวจสอบและประกันคุณภาพ  
- **การทดสอบอัตโนมัติ**: การตรวจสอบตัวอย่างโค้ดและลิงก์เป็นประจำ  
- **การรวมคำติชมจากชุมชน**: นำข้อเสนอแนะผู้ใช้เข้าสู่การทบทวนประจำ  
- **การอัปเดตเทคโนโลยี**: สอดคล้องกับบริการ Azure ล่าสุดและอัปเดต azd  
- **การตรวจสอบการเข้าถึง**: ทบทวนเป็นระยะเพื่อหลักการออกแบบที่รวมทุกคน  

## นโยบายการสนับสนุนเวอร์ชัน  

### การสนับสนุนเวอร์ชันปัจจุบัน  
- **เวอร์ชันหลักล่าสุด**: สนับสนุนเต็มรูปแบบพร้อมอัปเดตปกติ  
- **เวอร์ชันหลักก่อนหน้า**: อัปเดตความปลอดภัยและแก้ไขสำคัญเป็นเวลา 12 เดือน  
- **เวอร์ชันเก่า**: สนับสนุนโดยชุมชนเท่านั้น ไม่มีอัปเดตอย่างเป็นทางการ  

### คำแนะนำการย้ายข้อมูล  
เมื่อมีการปล่อยเวอร์ชันหลักใหม่ เราจะจัดเตรียม:  
- **คู่มือการย้ายข้อมูล**: คำแนะนำการเปลี่ยนถ่ายทีละขั้นตอน  
- **บันทึกความเข้ากันได้**: รายละเอียดเกี่ยวกับการเปลี่ยนแปลงที่ทำลายความเข้ากันได้  
- **เครื่องมือสนับสนุน**: สคริปต์หรือยูทิลิตี้ช่วยการย้ายข้อมูล  
- **การสนับสนุนชุมชน**: ฟอรัมเฉพาะสำหรับคำถามเกี่ยวกับการย้าย  

---

**การนำทาง**  
- **บทเรียนก่อนหน้า**: [Study Guide](resources/study-guide.md)  
- **บทเรียนถัดไป**: กลับไปที่ [Main README](README.md)  

**ติดตามข่าวสาร**: ติดตามที่เก็บนี้สำหรับการแจ้งเตือนเกี่ยวกับการออกเวอร์ชันใหม่และการอัปเดตสำคัญของวัสดุการเรียนรู้.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->