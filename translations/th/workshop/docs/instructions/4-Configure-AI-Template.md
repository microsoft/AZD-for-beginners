# 4. กำหนดค่าเทมเพลต

!!! tip "เมื่อสิ้นสุดโมดูลนี้คุณจะสามารถ"

    - [ ] เข้าใจวัตถุประสงค์ของ `azure.yaml`
    - [ ] เข้าใจโครงสร้างของ `azure.yaml`
    - [ ] เข้าใจคุณค่าของ azd lifecycle `hooks`
    - [ ] **แลป 4:** สำรวจและแก้ไขตัวแปรสภาพแวดล้อม

---

!!! prompt "ไฟล์ `azure.yaml` ทำหน้าที่อะไร? ใช้โค้ดเฟ้นซ์และอธิบายบรรทัดต่อบรรทัด"

      ไฟล์ `azure.yaml` คือ **ไฟล์กำหนดค่าสำหรับ Azure Developer CLI (azd)** ซึ่งกำหนดวิธีการที่แอปพลิเคชันของคุณควรถูกปรับใช้ไปยัง Azure รวมถึงโครงสร้างพื้นฐาน บริการ กฎล็อคการปรับใช้ และตัวแปรสภาพแวดล้อม

---

## 1. วัตถุประสงค์และฟังก์ชันการทำงาน

ไฟล์ `azure.yaml` นี้ทำหน้าที่เป็น **แผนผังการปรับใช้** สำหรับแอปพลิเคชันตัวแทน AI ที่:

1. **ตรวจสอบสภาพแวดล้อม** ก่อนการปรับใช้
2. **จัดเตรียมบริการ AI ของ Azure** (AI Hub, AI Project, Search ฯลฯ)
3. **ปรับใช้แอปพลิเคชัน Python** ลงใน Azure Container Apps
4. **กำหนดค่าโมเดล AI** สำหรับทั้งฟังก์ชันการแชทและฝังตัว
5. **ตั้งค่าการติดตามและตรวจสอบ** สำหรับแอป AI
6. **รองรับสถานการณ์โปรเจ็กต์ AI ของ Azure ทั้งใหม่และที่มีอยู่**

ไฟล์นี้ช่วยให้การปรับใช้โซลูชันตัวแทน AI อย่างครบถ้วนด้วยคำสั่งเดียว (`azd up`) ด้วยการตรวจสอบ จัดเตรียม และตั้งค่าหลังการปรับใช้อย่างเหมาะสม

??? info "ขยายเพื่อดู: `azure.yaml`"

      ไฟล์ `azure.yaml` กำหนดวิธีที่ Azure Developer CLI ควรปรับใช้และจัดการแอปตัวแทน AI นี้ใน Azure มาลงรายละเอียดทีละบรรทัดกัน

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

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

มาดูไฟล์เป็นส่วนๆ เพื่อทำความเข้าใจว่าทำอะไร และเพราะเหตุใด

### 2.1 **ส่วนหัวและสคีมา (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **บรรทัดที่ 1**: ให้ YAML language server ใช้ตรวจสอบสคีมาสำหรับสนับสนุน IDE และ IntelliSense

### 2.2 ข้อมูลเมทาดาท้าของโปรเจ็กต์ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **บรรทัดที่ 5**: กำหนดชื่อโปรเจ็กต์ที่ Azure Developer CLI ใช้
- **บรรทัดที่ 6-7**: กำหนดว่าใช้เทมเพลตเวอร์ชัน 1.0.2
- **บรรทัดที่ 8-9**: ต้องการ Azure Developer CLI เวอร์ชัน 1.14.0 หรือสูงกว่า

### 2.3 ตะขอปรับใช้ (11-40)

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

- **บรรทัดที่ 11-20**: **ตะขอก่อนปรับใช้** - ทำงานก่อน `azd up`

      - บน Unix/Linux: ทำให้สคริปต์ตรวจสอบตัวแปรสภาพแวดล้อมสามารถรันได้แล้วรันมัน
      - บน Windows: รันสคริปต์ PowerShell เพื่อตรวจสอบ
      - ทั้งคู่เป็นแบบโต้ตอบ และจะหยุดกระบวนการถ้าล้มเหลว

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
- **บรรทัดที่ 21-30**: **ตะขอหลังจัดเตรียม** - ทำงานหลังจากสร้างทรัพยากร Azure เสร็จ

  - รันสคริปต์เขียนตัวแปรสภาพแวดล้อม
  - ยังคงดำเนินการต่อแม้ว่าสคริปต์เหล่านี้จะล้มเหลว (`continueOnError: true`)

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
- **บรรทัดที่ 31-40**: **ตะขอหลังปรับใช้** - ทำงานหลังปรับใช้แอปพลิเคชันเสร็จ

  - รันสคริปต์ตั้งค่าสุดท้าย
  - ดำเนินการต่อแม้ว่าสคริปต์ล้มเหลว

### 2.4 ตั้งค่าบริการ (41-48)

ส่วนนี้กำหนดการตั้งค่าบริการแอปพลิเคชันที่คุณจะปรับใช้

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
- **บรรทัดที่ 43**: ชี้ไปยังไดเรกทอรี `./src` สำหรับซอร์สโค้ด
- **บรรทัดที่ 44**: ระบุภาษาโปรแกรมเป็น Python
- **บรรทัดที่ 45**: ใช้ Azure Container Apps เป็นโฮสต์
- **บรรทัดที่ 46-48**: ตั้งค่า Docker

      - ใช้ชื่ออิมเมจ "api_and_frontend"
      - สร้างอิมเมจ Docker จากระยะไกลบน Azure (ไม่ใช่ท้องถิ่น)

### 2.5 ตัวแปร Pipeline (49-76)

ตัวแปรเหล่านี้ช่วยให้คุณใช้ `azd` ใน pipeline CI/CD เพื่อทำให้เป็นอัตโนมัติ

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

ส่วนนี้กำหนดตัวแปรสภาพแวดล้อมที่ใช้ **ระหว่างการปรับใช้** แบ่งตามประเภท:

- **ชื่อทรัพยากร Azure (บรรทัดที่ 51-60)**:
      - ชื่อทรัพยากรบริการหลักของ Azure เช่น Resource Group, AI Hub, AI Project ฯลฯ
- **ตัวควบคุมฟีเจอร์ (บรรทัดที่ 61-63)**:
      - ตัวแปรบูลีนเพื่อเปิด/ปิดบริการ Azure เฉพาะ
- **การตั้งค่าตัวแทน AI (บรรทัดที่ 64-71)**:
      - การตั้งค่าสำหรับตัวแทน AI หลัก เช่น ชื่อ, ID, การตั้งค่าปรับใช้, รายละเอียดโมเดล
- **การตั้งค่าฝังตัว AI (บรรทัดที่ 72-79)**:
      - การตั้งค่าสำหรับโมเดลฝังตัวที่ใช้ในการค้นหาด้วยเวกเตอร์
- **การค้นหาและการตรวจสอบ (บรรทัดที่ 80-84)**:
      - ชื่อดัชนีการค้นหา, ID ทรัพยากรที่มีอยู่, และการตั้งค่าการติดตาม/ตรวจสอบ

---

## 3. ตัวแปรสภาพแวดล้อมที่ควรรู้
ตัวแปรสภาพแวดล้อมต่อไปนี้ควบคุมการกำหนดค่าและพฤติกรรมการปรับใช้ของคุณ โดยจัดกลุ่มตามวัตถุประสงค์หลัก ตัวแปรส่วนใหญ่มีค่าเริ่มต้นที่สมเหตุสมผล แต่คุณสามารถปรับแต่งให้ตรงกับความต้องการเฉพาะหรือทรัพยากร Azure ที่มีอยู่

### 3.1 ตัวแปรที่จำเป็น

```bash title="" linenums="0"
# การกำหนดค่า Azure หลัก
AZURE_ENV_NAME                    # ชื่อสภาพแวดล้อม (ใช้ในการตั้งชื่อทรัพยากร)
AZURE_LOCATION                    # ภูมิภาคสำหรับการปรับใช้
AZURE_SUBSCRIPTION_ID             # การสมัครสมาชิกเป้าหมาย
AZURE_RESOURCE_GROUP              # ชื่อกลุ่มทรัพยากร
AZURE_PRINCIPAL_ID                # ผู้ใช้หลักสำหรับ RBAC

# ชื่อทรัพยากร (สร้างโดยอัตโนมัติถ้าไม่ได้ระบุ)
AZURE_AIHUB_NAME                  # ชื่อฮับ Microsoft Foundry
AZURE_AIPROJECT_NAME              # ชื่อโครงการ AI
AZURE_AISERVICES_NAME             # ชื่อบัญชีบริการ AI
AZURE_STORAGE_ACCOUNT_NAME        # ชื่อบัญชีที่เก็บข้อมูล
AZURE_CONTAINER_REGISTRY_NAME     # ชื่อรีจิสตรีคอนเทนเนอร์
AZURE_KEYVAULT_NAME               # ชื่อ Key Vault (ถ้าใช้)
```

### 3.2 การตั้งค่าโมเดล
```bash title="" linenums="0"
# การกำหนดค่ารูปแบบแชท
AZURE_AI_AGENT_MODEL_NAME         # ค่าเริ่มต้น: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ค่าเริ่มต้น: OpenAI (หรือ Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ค่าเริ่มต้น: เวอร์ชันล่าสุดที่มี
AZURE_AI_AGENT_DEPLOYMENT_NAME    # ชื่อการติดตั้งสำหรับรูปแบบแชท
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ค่าเริ่มต้น: มาตรฐาน
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ค่าเริ่มต้น: 80 (พัน TPM)

# การกำหนดค่ารูปแบบฝัง
AZURE_AI_EMBED_MODEL_NAME         # ค่าเริ่มต้น: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ค่าเริ่มต้น: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ค่าเริ่มต้น: เวอร์ชันล่าสุดที่มี
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ชื่อการติดตั้งสำหรับการฝัง
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ค่าเริ่มต้น: มาตรฐาน
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ค่าเริ่มต้น: 50 (พัน TPM)

# การกำหนดค่าตัวแทน
AZURE_AI_AGENT_NAME               # ชื่อแสดงตัวแทน
AZURE_EXISTING_AGENT_ID           # ใช้ตัวแทนที่มีอยู่แล้ว (ไม่บังคับ)
```

### 3.3 การสลับฟีเจอร์
```bash title="" linenums="0"
# บริการเพิ่มเติม
USE_APPLICATION_INSIGHTS         # ค่าเริ่มต้น: จริง
USE_AZURE_AI_SEARCH_SERVICE      # ค่าเริ่มต้น: เท็จ
USE_CONTAINER_REGISTRY           # ค่าเริ่มต้น: จริง

# การติดตามและตรวจสอบ
ENABLE_AZURE_MONITOR_TRACING     # ค่าเริ่มต้น: เท็จ
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ค่าเริ่มต้น: เท็จ

# การตั้งค่าการค้นหา
AZURE_AI_SEARCH_INDEX_NAME       # ชื่อดัชนีการค้นหา
AZURE_SEARCH_SERVICE_NAME        # ชื่อบริการค้นหา
```

### 3.4 การตั้งค่าโปรเจ็กต์ AI
```bash title="" linenums="0"
# ใช้ทรัพยากรที่มีอยู่แล้ว
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # รหัสทรัพยากรเต็มของโครงการ AI ที่มีอยู่
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL จุดเชื่อมต่อของโครงการที่มีอยู่
```

### 3.5 ตรวจสอบตัวแปรของคุณ

ใช้ Azure Developer CLI เพื่อตรวจดูและจัดการตัวแปรสภาพแวดล้อมของคุณ:

```bash title="" linenums="0"
# ดูตัวแปรสภาพแวดล้อมทั้งหมดสำหรับสภาพแวดล้อมปัจจุบัน
azd env get-values

# รับค่าตัวแปรสภาพแวดล้อมเฉพาะ
azd env get-value AZURE_ENV_NAME

# ตั้งค่าตัวแปรสภาพแวดล้อม
azd env set AZURE_LOCATION eastus

# ตั้งค่าตัวแปรหลายตัวจากไฟล์ .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้ความแม่นยำสูงสุด กรุณาทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อน เอกสารต้นฉบับในภาษาต้นฉบับถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลสำคัญแนะนำให้ใช้บริการแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->