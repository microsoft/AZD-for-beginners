# 3. แยกองค์ประกอบของเทมเพลต

!!! tip "เมื่อสิ้นสุดโมดูลนี้ คุณจะสามารถ"

    - [ ] เปิดใช้งาน GitHub Copilot กับ MCP servers สำหรับช่วยเหลือ Azure
    - [ ] เข้าใจโครงสร้างโฟลเดอร์และส่วนประกอบของเทมเพลต AZD
    - [ ] สำรวจรูปแบบการจัดการโครงสร้างพื้นฐานด้วยโค้ด (Bicep)
    - [ ] **แลป 3:** ใช้ GitHub Copilot เพื่อสำรวจและเข้าใจสถาปัตยกรรมของรีโพสิตอรี

---


ด้วยเทมเพลต AZD และ Azure Developer CLI (`azd`) เราสามารถเริ่มต้นการพัฒนาปัญญาประดิษฐ์ได้อย่างรวดเร็วด้วยรีโพสิตอรีมาตรฐานที่มีโค้ดตัวอย่าง โครงสร้างพื้นฐาน และไฟล์กำหนดค่าต่าง ๆ — ในรูปแบบของโปรเจกต์ _starter_ พร้อมใช้งานสำหรับการปรับใช้ทันที

**แต่ตอนนี้ เราต้องเข้าใจโครงสร้างโปรเจกต์และฐานโค้ด — และสามารถปรับแต่งเทมเพลต AZD ได้ — โดยไม่จำเป็นต้องมีประสบการณ์หรือเข้าใจ AZD มาก่อน!**

---

## 1. เปิดใช้งาน GitHub Copilot

### 1.1 ติดตั้ง GitHub Copilot Chat

ถึงเวลาสำรวจ [GitHub Copilot กับ Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) แล้ว ตอนนี้เราสามารถใช้ภาษาธรรมชาติอธิบายงานในระดับสูง แล้วรับความช่วยเหลือในการดำเนินการ สำหรับแลปนี้ เราจะใช้ [แผน Copilot Free](https://github.com/github-copilot/signup) ซึ่งมีขีดจำกัดรายเดือนสำหรับการระบุคำตอบและแชท

ส่วนขยายนี้สามารถติดตั้งจาก Marketplace และมักจะมีให้ใน Codespaces หรือสภาพแวดล้อม dev container อยู่แล้ว _คลิก `Open Chat` จากเมนูไอคอน Copilot แล้วพิมพ์ข้อความ เช่น `What can you do?`_ — อาจมีการแจ้งให้เข้าสู่ระบบ **GitHub Copilot Chat พร้อมใช้งานแล้ว**

### 1.2 ติดตั้ง MCP Servers

เพื่อให้ Agent mode มีประสิทธิภาพ มันจำเป็นต้องเข้าถึงเครื่องมือที่เหมาะสมเพื่อช่วยดึงความรู้ หรือดำเนินการต่าง ๆ นี่คือจุดที่ MCP servers มีประโยชน์ เราจะตั้งค่าเซิร์ฟเวอร์ดังนี้:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

วิธีเปิดใช้งาน:

1. สร้างไฟล์ชื่อ `.vscode/mcp.json` ถ้าไม่มีอยู่
1. คัดลอกเนื้อหาต่อไปนี้ลงในไฟล์นั้น แล้วเริ่มเซิร์ฟเวอร์!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "คุณอาจพบข้อผิดพลาดว่าคำสั่ง `npx` ยังไม่ถูกติดตั้ง (คลิกเพื่อขยายวิธีแก้ไข)"

      ในการแก้ไข ให้เปิดไฟล์ `.devcontainer/devcontainer.json` และเพิ่มบรรทัดนี้ในส่วน features แล้วสร้างคอนเทนเนอร์ใหม่ คุณจะมี `npx` ติดตั้งแล้ว

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 ทดสอบ GitHub Copilot Chat

**ใช้คำสั่ง `azd auth login` เพื่อยืนยันตัวตนกับ Azure ผ่านบรรทัดคำสั่ง VS Code ก่อน ใช้ `az login` ด้วยหากคุณต้องการเรียกใช้คำสั่ง Azure CLI โดยตรง**

ตอนนี้คุณควรสามารถตรวจสอบสถานะการสมัครใช้งาน Azure ได้ และถามคำถามเกี่ยวกับทรัพยากรหรือการกำหนดค่าที่ถูกปรับใช้ ลองใช้คำสั่งเหล่านี้:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

คุณยังสามารถถามเกี่ยวกับเอกสาร Azure และรับคำตอบจาก Microsoft Docs MCP server ดังนี้:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

หรือขอโค้ดตัวอย่างเพื่อทำงาน ลองใช้คำสั่งนี้ดู

1. `Give me a Python code example that uses AAD for an interactive chat client`

ในโหมด `Ask` จะให้โค้ดที่คุณสามารถคัดลอกและลองใช้ ในโหมด `Agent` อาจก้าวไปไกลกว่าโดยสร้างทรัพยากรที่เกี่ยวข้องให้คุณ — รวมสคริปต์ติดตั้งและเอกสาร — เพื่อช่วยการดำเนินงานนั้น

**ตอนนี้คุณพร้อมเริ่มสำรวจเทมเพลตรีโพสิตอรีแล้ว**

---

## 2. วิเคราะห์สถาปัตยกรรม

??? prompt "ถาม: อธิบายสถาปัตยกรรมแอปพลิเคชันใน docs/images/architecture.png ในย่อหน้าเดียว"

      แอปพลิเคชันนี้เป็นแอปแชทที่ขับเคลื่อนด้วยปัญญาประดิษฐ์บน Azure ซึ่งแสดงตัวอย่างสถาปัตยกรรมแบบ agent-based ที่ทันสมัย โซลูชันนี้เน้นที่ Azure Container App ซึ่งโฮสต์โค้ดแอปหลักที่ประมวลผลอินพุตของผู้ใช้และสร้างคำตอบอัจฉริยะผ่านเอเย่นต์ AI
      
      สถาปัตยกรรมนี้ใช้ Microsoft Foundry Project เป็นฐานสำหรับความสามารถ AI เชื่อมต่อกับ Azure AI Services ที่ให้โมเดลภาษาเบื้องหลัง (เช่น gpt-4.1-mini) และฟังก์ชันการทำงานของเอเย่นต์ การโต้ตอบของผู้ใช้ไหลผ่าน frontend ที่สร้างด้วย React ไปยัง backend FastAPI ที่สื่อสารกับบริการเอเย่นต์ AI เพื่อสร้างคำตอบตามบริบท
      
      ระบบมีความสามารถในการดึงความรู้ผ่านการค้นหาไฟล์หรือบริการ Azure AI Search เพื่อให้เอเย่นต์เข้าถึงและอ้างอิงข้อมูลจากเอกสารที่อัปโหลด สำหรับความเป็นเลิศในการปฏิบัติงาน สถาปัตยกรรมรวมการตรวจสอบอย่างละเอียดผ่าน Application Insights และ Log Analytics Workspace สำหรับติดตาม บันทึก และปรับปรุงประสิทธิภาพ
      
      Azure Storage ให้ blob storage สำหรับข้อมูลแอปและการอัปโหลดไฟล์ ในขณะที่ Managed Identity ช่วยรักษาความปลอดภัยการเข้าถึงระหว่างทรัพยากร Azure โดยไม่ต้องเก็บข้อมูลรับรอง โซลูชันทั้งหมดออกแบบเพื่อความสามารถในการปรับขนาดและการบำรุงรักษา โดยแอปในคอนเทนเนอร์จะปรับขนาดอัตโนมัติตามความต้องการ พร้อมความปลอดภัย การตรวจสอบ และ CI/CD ผ่านระบบบริการบริหารของ Azure

![Architecture](../../../../../translated_images/th/architecture.48d94861e6e6cdc0.webp)

---

## 3. โครงสร้างรีโพสิตอรี

!!! prompt "ถาม: อธิบายโครงสร้างโฟลเดอร์เทมเพลต เริ่มด้วยแผนภาพลำดับชั้น"

??? info "คำตอบ: แผนภาพลำดับชั้น"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # การกำหนดค่า Azure Developer CLI
      │   ├── docker-compose.yaml           # คอนเทนเนอร์สำหรับพัฒนาท้องถิ่น
      │   ├── pyproject.toml                # การกำหนดค่าโปรเจกต์ Python
      │   ├── requirements-dev.txt          # ไลบรารีสำหรับพัฒนาซอฟต์แวร์
      │   └── .devcontainer/                # การตั้งค่า dev container สำหรับ VS Code
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # เทมเพลตโครงสร้างพื้นฐานหลัก
      │   ├── api.bicep                     # ทรัพยากรเฉพาะ API
      │   ├── main.parameters.json          # พารามิเตอร์โครงสร้างพื้นฐาน
      │   └── core/                         # โมดูลส่วนประกอบโครงสร้างพื้นฐาน
      │       ├── ai/                       # การกำหนดค่าบริการ AI
      │       ├── host/                     # โครงสร้างพื้นฐานสำหรับโฮสต์
      │       ├── monitor/                  # การตรวจสอบและบันทึก
      │       ├── search/                   # การตั้งค่า Azure AI Search
      │       ├── security/                 # การรักษาความปลอดภัยและตัวตน
      │       └── storage/                  # การกำหนดค่าบัญชีที่เก็บข้อมูล
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # จุดเข้าแอป FastAPI
      │   │   ├── routes.py                 # กำหนดเส้นทาง API
      │   │   ├── search_index_manager.py   # ฟังก์ชันการค้นหา
      │   │   ├── data/                     # การจัดการข้อมูล API
      │   │   ├── static/                   # ไฟล์เว็บสเตติก
      │   │   └── templates/                # เทมเพลต HTML
      │   ├── frontend/                     # frontend React/TypeScript
      │   │   ├── package.json              # ไลบรารี Node.js
      │   │   ├── vite.config.ts            # กำหนดค่าการ build ด้วย Vite
      │   │   └── src/                      # โค้ดต้นทาง frontend
      │   ├── data/                         # ไฟล์ข้อมูลตัวอย่าง
      │   │   └── embeddings.csv            # ข้อมูล embeddings ที่คำนวณไว้ล่วงหน้า
      │   ├── files/                        # ไฟล์ฐานความรู้
      │   │   ├── customer_info_*.json      # ตัวอย่างข้อมูลลูกค้า
      │   │   └── product_info_*.md         # เอกสารผลิตภัณฑ์
      │   ├── Dockerfile                    # การกำหนดค่าคอนเทนเนอร์
      │   └── requirements.txt              # ไลบรารี Python
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # การตั้งค่าหลังจากปรับใช้
      │   ├── setup_credential.sh/.ps1     # การตั้งค่าความเชื่อถือ
      │   ├── validate_env_vars.sh/.ps1    # การตรวจสอบตัวแปรสิ่งแวดล้อม
      │   └── resolve_model_quota.sh/.ps1  # การจัดการโควต้ารุ่นโมเดล
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # การทดสอบหน่วยและรวม
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # เฟรมเวิร์กประเมินเอเย่นต์
      │   │   ├── evaluate.py               # ตัวรันการประเมินผล
      │   │   ├── eval-queries.json         # คำถามทดสอบ
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # สนามทดลองพัฒนา
      │   │   ├── 1-quickstart.py           # ตัวอย่างเริ่มต้น
      │   │   └── aad-interactive-chat.py   # ตัวอย่างการยืนยันตัวตน
      │   └── airedteaming/                 # การประเมินความปลอดภัย AI
      │       └── ai_redteaming.py          # การทดสอบทีมแดง
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # คู่มือการปรับใช้
      │   ├── local_development.md          # คำแนะนำตั้งค่าในเครื่อง
      │   ├── troubleshooting.md            # ปัญหาทั่วไป & วิธีแก้ไข
      │   ├── azure_account_setup.md        # ความต้องการ Azure
      │   └── images/                       # สินทรัพย์เอกสาร
      │
      └── 📄 Project Metadata
         ├── README.md                     # ภาพรวมโปรเจกต์
         ├── CODE_OF_CONDUCT.md           # กฎเกณฑ์ชุมชน
         ├── CONTRIBUTING.md              # คู่มือร่วมพัฒนา
         ├── LICENSE                      # ข้อตกลงใบอนุญาต
         └── next-steps.md                # คำแนะนำหลังปรับใช้
      ```

### 3.1 สถาปัตยกรรมแอปหลัก

เทมเพลตนี้ใช้รูปแบบ **แอปพลิเคชันเว็บแบบ full-stack** โดยมี:

- **Backend**: Python FastAPI ผสานกับ Azure AI
- **Frontend**: TypeScript/React ใช้ระบบ build Vite
- **โครงสร้างพื้นฐาน**: เทมเพลต Azure Bicep สำหรับทรัพยากรคลาวด์
- **คอนเทนเนอร์**: Docker เพื่อการปรับใช้ที่สอดคล้อง

### 3.2 โครงสร้างพื้นฐานด้วยโค้ด (bicep)

ชั้นโครงสร้างพื้นฐานใช้เทมเพลต **Azure Bicep** ที่จัดระเบียบแบบโมดูลาร์:

   - **`main.bicep`**: ประสานงานทรัพยากร Azure ทั้งหมด
   - **โมดูล `core/`**: ส่วนประกอบซ้ำได้ของบริการต่าง ๆ
      - บริการ AI (Microsoft Foundry Models, AI Search)
      - โฮสต์คอนเทนเนอร์ (Azure Container Apps)
      - การตรวจสอบ (Application Insights, Log Analytics)
      - ความปลอดภัย (Key Vault, Managed Identity)

### 3.3 โค้ดต้นทางแอป (`src/`)

**Backend API (`src/api/`)**:

- REST API บน FastAPI
- ผสาน Foundry Agents
- จัดการดัชนีการค้นหาเพื่อดึงความรู้
- รองรับการอัปโหลดและประมวลผลไฟล์

**Frontend (`src/frontend/`)**:

- SPA ด้วย React/TypeScript สมัยใหม่
- ใช้ Vite สำหรับพัฒนาและ build เร็ว
- อินเทอร์เฟซแชทสำหรับโต้ตอบกับเอเย่นต์

**ฐานความรู้ (`src/files/`)**:

- ตัวอย่างข้อมูลลูกค้าและผลิตภัณฑ์
- แสดงการเรียกใช้ความรู้จากไฟล์
- ตัวอย่างในรูปแบบ JSON และ Markdown


### 3.4 DevOps & อัตโนมัติ

**สคริปต์ (`scripts/`)**:

- สคริปต์ PowerShell และ Bash ข้ามแพลตฟอร์ม
- ตรวจสอบและตั้งค่าสิ่งแวดล้อม
- การตั้งค่าหลังปรับใช้
- การจัดการโควต้ารุ่นโมเดล

**บูรณาการกับ Azure Developer CLI**:

- กำหนดค่า `azure.yaml` สำหรับเวิร์กโฟลว์ `azd`
- จัดหาและปรับใช้โดยอัตโนมัติ
- จัดการตัวแปรสิ่งแวดล้อม

### 3.5 ทดสอบ & ประกันคุณภาพ

**เฟรมเวิร์กประเมินผล (`evals/`)**:

- ประเมินประสิทธิภาพเอเย่นต์
- ทดสอบคุณภาพการตอบคำถาม
- ท่อประเมินผลอัตโนมัติ

**ความปลอดภัย AI (`airedteaming/`)**:

- ทดสอบทีมแดงเพื่อความปลอดภัย AI
- สแกนหาช่องโหว่ด้านความปลอดภัย
- ปฏิบัติการ AI ที่รับผิดชอบ

---

## 4. ขอแสดงความยินดี 🏆

คุณใช้ GitHub Copilot Chat กับ MCP servers เพื่อสำรวจรีโพสิตอรีสำเร็จแล้ว

- [X] เปิดใช้งาน GitHub Copilot สำหรับ Azure สำเร็จ
- [X] เข้าใจสถาปัตยกรรมแอปพลิเคชัน
- [X] สำรวจโครงสร้างเทมเพลต AZD

นี่ทำให้คุณเห็นภาพของทรัพยากร _infrastructure as code_ สำหรับเทมเพลตนี้ ขั้นตอนต่อไปเราจะดูไฟล์กำหนดค่าสำหรับ AZD กัน

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้ถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้การแปลโดยผู้เชี่ยวชาญที่เป็นมนุษย์ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->