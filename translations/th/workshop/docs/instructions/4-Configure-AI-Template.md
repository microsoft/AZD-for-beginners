# 4. กำหนดค่าแบบแม่แบบ

!!! tip "เมื่อจบโมดูลนี้ คุณจะสามารถ"

    - [ ] เข้าใจวัตถุประสงค์ของ `azure.yaml`
    - [ ] เข้าใจโครงสร้างของ `azure.yaml`
    - [ ] เข้าใจคุณค่าของ azd lifecycle `hooks`
    - [ ] **แลป 4:** สำรวจและแก้ไขตัวแปรสภาพแวดล้อม

---

!!! prompt "ไฟล์ `azure.yaml` ทำหน้าที่อะไร? ใช้ codefence และอธิบายทีละบรรทัด"

      ไฟล์ `azure.yaml` คือ **ไฟล์กำหนดค่าของ Azure Developer CLI (azd)** ซึ่งกำหนดวิธีที่แอปพลิเคชันของคุณจะถูกปรับใช้บน Azure รวมถึงโครงสร้างพื้นฐาน บริการ hook การปรับใช้ และตัวแปรสภาพแวดล้อม

---

## 1. วัตถุประสงค์และการทำงาน

ไฟล์ `azure.yaml` นี้ทำหน้าที่เป็น **แผนผังการปรับใช้** สำหรับแอปพลิเคชันเอเย่นต์ AI ที่:

1. **ตรวจสอบสภาพแวดล้อม** ก่อนการปรับใช้
2. **จัดเตรียมบริการ Azure AI** (AI Hub, AI Project, Search เป็นต้น)
3. **ปรับใช้แอปพลิเคชัน Python** ไปยัง Azure Container Apps
4. **กำหนดค่าโมเดล AI** สำหรับทั้งการแชทและฟังก์ชันการฝัง
5. **ตั้งค่าการตรวจสอบและติดตาม** สำหรับแอปพลิเคชัน AI
6. **รองรับทั้งสถานการณ์โครงการ AI ใหม่และเดิม** ใน Azure

ไฟล์นี้ช่วยให้สามารถ **ปรับใช้ด้วยคำสั่งเดียว** (`azd up`) สำหรับโซลูชันเอเย่นต์ AI แบบครบถ้วนด้วยการตรวจสอบ จัดเตรียม และการกำหนดค่าหลังปรับใช้ที่เหมาะสม

??? info "ขยายเพื่อดู: `azure.yaml`"

      ไฟล์ `azure.yaml` กำหนดวิธีที่ Azure Developer CLI ควรปรับใช้และจัดการแอปพลิเคชัน AI Agent นี้บน Azure มาเจาะลึกกันทีละบรรทัด

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: เราต้องการ hooks หรือไม่? 
      # TODO: เราต้องการตัวแปรทั้งหมดหรือไม่?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. การแยกวิเคราะห์ไฟล์

เรามาดูไฟล์นี้ทีละส่วน เพื่อเข้าใจว่ามันทำอะไร และเพราะเหตุใด

### 2.1 **หัวเรื่องและสคีมา (บรรทัด 1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **บรรทัดที่ 1**: ให้การตรวจสอบสคีมาของ YAML language server เพื่อสนับสนุน IDE และ IntelliSense

### 2.2 ข้อมูลเมตาโปรเจกต์ (บรรทัด 5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **บรรทัดที่ 5**: กำหนดชื่อโปรเจกต์ที่ใช้โดย Azure Developer CLI
- **บรรทัดที่ 6-7**: ระบุว่าโปรเจกต์นี้ใช้แม่แบบเวอร์ชัน 1.0.2
- **บรรทัดที่ 8-9**: ต้องใช้ Azure Developer CLI เวอร์ชัน 1.14.0 ขึ้นไป

### 2.3 การตั้งค่า Hook การปรับใช้ (บรรทัด 11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **บรรทัดที่ 11-20**: **Hook ก่อนปรับใช้** - รันก่อน `azd up`

      - บน Unix/Linux: ให้สคริปต์ตรวจสอบมีสิทธิ์รันและรันมัน
      - บน Windows: รันสคริปต์ PowerShell สำหรับการตรวจสอบ
      - ทั้งคู่เป็นแบบโต้ตอบและจะหยุดการปรับใช้ถ้าล้มเหลว

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **บรรทัดที่ 21-30**: **Hook หลังการจัดเตรียม** - รันหลังจากสร้างทรัพยากร Azure

  - รันสคริปต์เขียนตัวแปรสภาพแวดล้อม
  - ดำเนินการปรับใช้ต่อแม้ว่าจะล้มเหลว (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **บรรทัดที่ 31-40**: **Hook หลังปรับใช้** - รันหลังจากปรับใช้แอปพลิเคชันเสร็จ

  - รันสคริปต์ติดตั้งขั้นสุดท้าย
  - ดำเนินการต่อแม้ว่าสคริปต์จะล้มเหลว

### 2.4 การตั้งค่าบริการ (บรรทัด 41-48)

ส่วนนี้กำหนดการตั้งค่าของบริการแอปพลิเคชันที่คุณกำลังปรับใช้

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **บรรทัดที่ 42**: กำหนดบริการชื่อ "api_and_frontend"
- **บรรทัดที่ 43**: ชี้ไปยังไดเรกทอรีโค้ดต้นทาง `./src`
- **บรรทัดที่ 44**: ระบุภาษาโปรแกรมเป็น Python
- **บรรทัดที่ 45**: ใช้ Azure Container Apps เป็นแพลตฟอร์มโฮสต์
- **บรรทัดที่ 46-48**: การตั้งค่า Docker

      - ใช้ชื่ออิมเมจ "api_and_frontend"
      - สร้างอิมเมจ Docker จากระยะไกลใน Azure (ไม่บนเครื่อง)

### 2.5 ตัวแปร Pipeline (บรรทัด 49-76)

ตัวแปรเหล่านี้ช่วยให้คุณรัน `azd` ใน CI/CD pipelines สำหรับการทำงานอัตโนมัติ

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

ส่วนนี้กำหนดตัวแปรสภาพแวดล้อมที่ใช้ **ในระหว่างการปรับใช้** และจัดกลุ่มตามหมวดหมู่:

- **ชื่อทรัพยากร Azure (บรรทัด 51-60)**:
      - ชื่อทรัพยากรของบริการ Azure หลัก เช่น Resource Group, AI Hub, AI Project เป็นต้น
- **แฟล็กฟีเจอร์ (บรรทัด 61-63)**:
      - ตัวแปรบูลีนสำหรับเปิด/ปิดใช้งานบริการ Azure ที่เจาะจง
- **การตั้งค่า AI Agent (บรรทัด 64-71)**:
      - การตั้งค่าสำหรับเอเย่นต์ AI หลัก รวมถึงชื่อ รหัส การปรับใช้ รายละเอียดโมเดล
- **การตั้งค่า AI Embedding (บรรทัด 72-79)**:
      - การตั้งค่าสำหรับโมเดลฝังที่ใช้สำหรับการค้นหาเวกเตอร์
- **การค้นหาและการมอนิเตอร์ (บรรทัด 80-84)**:
      - ชื่อดัชนีค้นหา, รหัสทรัพยากรเดิม, และการตั้งค่าการตรวจสอบ/ติดตาม

---

## 3. รู้จักตัวแปรสภาพแวดล้อม
ตัวแปรสภาพแวดล้อมด้านล่างเป็นตัวควบคุมการตั้งค่าและพฤติกรรมของการปรับใช้ของคุณ แบ่งตามวัตถุประสงค์หลัก ตัวแปรส่วนมากมีค่าเริ่มต้นที่เหมาะสม แต่คุณสามารถปรับแต่งเพื่อให้ตรงกับความต้องการเฉพาะหรือทรัพยากร Azure ที่มีอยู่แล้วของคุณ

### 3.1 ตัวแปรที่จำเป็น

```bash title="" linenums="0"
# การตั้งค่าหลักของ Azure
AZURE_ENV_NAME                    # ชื่อสภาพแวดล้อม (ใช้ในการตั้งชื่อทรัพยากร)
AZURE_LOCATION                    # ภูมิภาคการปรับใช้
AZURE_SUBSCRIPTION_ID             # การสมัครเป้าหมาย
AZURE_RESOURCE_GROUP              # ชื่อกลุ่มทรัพยากร
AZURE_PRINCIPAL_ID                # ผู้ใช้หลักสำหรับ RBAC

# ชื่อทรัพยากร (สร้างอัตโนมัติหากไม่ได้ระบุ)
AZURE_AIHUB_NAME                  # ชื่อฮับ Microsoft Foundry
AZURE_AIPROJECT_NAME              # ชื่อโครงการ AI
AZURE_AISERVICES_NAME             # ชื่อบัญชีบริการ AI
AZURE_STORAGE_ACCOUNT_NAME        # ชื่อบัญชีจัดเก็บข้อมูล
AZURE_CONTAINER_REGISTRY_NAME     # ชื่อรีจิสทรีคอนเทนเนอร์
AZURE_KEYVAULT_NAME               # ชื่อ Key Vault (ถ้าใช้)
```

### 3.2 การตั้งค่าโมเดล
```bash title="" linenums="0"
# การกำหนดค่ารูปแบบแชท
AZURE_AI_AGENT_MODEL_NAME         # ค่าเริ่มต้น: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ค่าเริ่มต้น: OpenAI (หรืิอ Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ค่าเริ่มต้น: เวอร์ชันล่าสุดที่มีอยู่
AZURE_AI_AGENT_DEPLOYMENT_NAME    # ชื่อการปรับใช้สำหรับรูปแบบแชท
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ค่าเริ่มต้น: มาตรฐาน
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ค่าเริ่มต้น: 80 (พัน TPM)

# การกำหนดค่ารูปแบบการฝัง
AZURE_AI_EMBED_MODEL_NAME         # ค่าเริ่มต้น: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ค่าเริ่มต้น: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ค่าเริ่มต้น: เวอร์ชันล่าสุดที่มีอยู่
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ชื่อการปรับใช้สำหรับการฝัง
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ค่าเริ่มต้น: มาตรฐาน
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ค่าเริ่มต้น: 50 (พัน TPM)

# การกำหนดค่าเอเจนต์
AZURE_AI_AGENT_NAME               # ชื่อที่แสดงของเอเจนต์
AZURE_EXISTING_AGENT_ID           # ใช้เอเจนต์ที่มีอยู่ (เลือกได้)
```

### 3.3 การสลับฟีเจอร์
```bash title="" linenums="0"
# บริการเสริม
USE_APPLICATION_INSIGHTS         # ค่าเริ่มต้น: จริง
USE_AZURE_AI_SEARCH_SERVICE      # ค่าเริ่มต้น: เท็จ
USE_CONTAINER_REGISTRY           # ค่าเริ่มต้น: จริง

# การตรวจสอบและการติดตาม
ENABLE_AZURE_MONITOR_TRACING     # ค่าเริ่มต้น: เท็จ
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ค่าเริ่มต้น: เท็จ

# การกำหนดค่าการค้นหา
AZURE_AI_SEARCH_INDEX_NAME       # ชื่อดัชนีการค้นหา
AZURE_SEARCH_SERVICE_NAME        # ชื่อบริการค้นหา
```

### 3.4 การตั้งค่าโครงการ AI
```bash title="" linenums="0"
# ใช้ทรัพยากรที่มีอยู่
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # รหัสทรัพยากรเต็มของโครงการ AI ที่มีอยู่
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL ของจุดเชื่อมต่อของโครงการที่มีอยู่
```

### 3.5 ตรวจสอบตัวแปรของคุณ

ใช้ Azure Developer CLI เพื่อดูและจัดการตัวแปรสภาพแวดล้อมของคุณ:

```bash title="" linenums="0"
# ดูตัวแปรแวดล้อมทั้งหมดสำหรับสภาพแวดล้อมปัจจุบัน
azd env get-values

# รับค่าตัวแปรแวดล้อมเฉพาะ
azd env get-value AZURE_ENV_NAME

# ตั้งค่าตัวแปรแวดล้อม
azd env set AZURE_LOCATION eastus

# ตั้งค่าตัวแปรหลายตัวจากไฟล์ .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้มีความถูกต้องสูงสุด แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลสำคัญควรใช้บริการแปลโดยผู้เชี่ยวชาญมนุษย์ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->