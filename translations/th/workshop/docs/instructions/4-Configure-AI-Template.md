# 4. กำหนดค่าเทมเพลต

!!! tip "เมื่อจบโมดูลนี้ คุณจะสามารถ"

    - [ ] เข้าใจวัตถุประสงค์ของ `azure.yaml`
    - [ ] เข้าใจโครงสร้างของ `azure.yaml`
    - [ ] เข้าใจคุณค่าของ `hooks` ในวงจรชีวิตของ azd
    - [ ] **Lab 3:** 

---

!!! prompt "ไฟล์ `azure.yaml` ทำหน้าที่อะไร? ใช้ codefence และอธิบายทีละบรรทัด"

      ไฟล์ `azure.yaml` คือ **ไฟล์การตั้งค่าของ Azure Developer CLI (azd)** ซึ่งกำหนดวิธีการที่แอปพลิเคชันของคุณจะถูกปรับใช้ใน Azure รวมถึงโครงสร้างพื้นฐาน บริการ hooks การปรับใช้ และตัวแปรสภาพแวดล้อม

---

## 1. วัตถุประสงค์และการทำงาน

ไฟล์ `azure.yaml` นี้ทำหน้าที่เป็น **แผนการปรับใช้** สำหรับแอปพลิเคชัน AI agent ที่:

1. **ตรวจสอบสภาพแวดล้อม** ก่อนการปรับใช้
2. **จัดเตรียมบริการ Azure AI** (AI Hub, AI Project, Search ฯลฯ)
3. **ปรับใช้แอปพลิเคชัน Python** ไปยัง Azure Container Apps
4. **ตั้งค่าโมเดล AI** สำหรับการใช้งานทั้งการสนทนาและการฝังข้อมูล
5. **ตั้งค่าการตรวจสอบและการติดตาม** สำหรับแอปพลิเคชัน AI
6. **รองรับทั้งโครงการ Azure AI ใหม่และที่มีอยู่**

ไฟล์นี้ช่วยให้สามารถปรับใช้โซลูชัน AI agent ได้ด้วย **คำสั่งเดียว** (`azd up`) พร้อมการตรวจสอบ การจัดเตรียม และการตั้งค่าหลังการปรับใช้อย่างเหมาะสม

??? info "คลิกเพื่อดู: `azure.yaml`"

      ไฟล์ `azure.yaml` กำหนดวิธีที่ Azure Developer CLI จะปรับใช้และจัดการแอปพลิเคชัน AI Agent นี้ใน Azure มาดูรายละเอียดทีละบรรทัดกัน

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

## 2. การวิเคราะห์ไฟล์

มาดูไฟล์นี้ทีละส่วนเพื่อทำความเข้าใจว่ามันทำอะไรและทำไม

### 2.1 **ส่วนหัวและ Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **บรรทัดที่ 1**: ให้การตรวจสอบ schema ของ YAML language server เพื่อรองรับ IDE และ IntelliSense

### 2.2 ข้อมูลเมตาของโปรเจกต์ (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **บรรทัดที่ 5**: กำหนดชื่อโปรเจกต์ที่ใช้โดย Azure Developer CLI
- **บรรทัดที่ 6-7**: ระบุว่าใช้เทมเพลตเวอร์ชัน 1.0.2
- **บรรทัดที่ 8-9**: ต้องการ Azure Developer CLI เวอร์ชัน 1.14.0 หรือสูงกว่า

### 2.3 Deploy Hooks (11-40)

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

- **บรรทัดที่ 11-20**: **Pre-deployment hook** - รันก่อน `azd up`

      - บน Unix/Linux: ทำให้สคริปต์การตรวจสอบสามารถรันได้และรันสคริปต์นั้น
      - บน Windows: รันสคริปต์ PowerShell สำหรับการตรวจสอบ
      - ทั้งสองแบบเป็นแบบ interactive และจะหยุดการปรับใช้หากล้มเหลว

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
- **บรรทัดที่ 21-30**: **Post-provision hook** - รันหลังจากสร้างทรัพยากร Azure

  - รันสคริปต์การเขียนตัวแปรสภาพแวดล้อม
  - ดำเนินการปรับใช้ต่อแม้ว่าสคริปต์จะล้มเหลว (`continueOnError: true`)

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
- **บรรทัดที่ 31-40**: **Post-deploy hook** - รันหลังจากปรับใช้แอปพลิเคชัน

  - รันสคริปต์การตั้งค่าขั้นสุดท้าย
  - ดำเนินการต่อแม้ว่าสคริปต์จะล้มเหลว

### 2.4 การตั้งค่าบริการ (41-48)

ส่วนนี้กำหนดค่าบริการแอปพลิเคชันที่คุณกำลังปรับใช้

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
- **บรรทัดที่ 43**: ชี้ไปที่ไดเรกทอรี `./src` สำหรับซอร์สโค้ด
- **บรรทัดที่ 44**: ระบุว่าใช้ Python เป็นภาษาการเขียนโปรแกรม
- **บรรทัดที่ 45**: ใช้ Azure Container Apps เป็นแพลตฟอร์มโฮสต์
- **บรรทัดที่ 46-48**: การตั้งค่า Docker

      - ใช้ "api_and_frontend" เป็นชื่อภาพ
      - สร้างภาพ Docker ใน Azure (ไม่ใช่ในเครื่อง)

### 2.5 ตัวแปร Pipeline (49-76)

ตัวแปรเหล่านี้ช่วยให้คุณรัน `azd` ใน CI/CD pipelines เพื่อการทำงานอัตโนมัติ

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

ส่วนนี้กำหนดตัวแปรสภาพแวดล้อมที่ใช้ **ระหว่างการปรับใช้** โดยจัดหมวดหมู่ดังนี้:

- **ชื่อทรัพยากร Azure (บรรทัดที่ 51-60)**:
      - ชื่อทรัพยากรบริการหลักของ Azure เช่น Resource Group, AI Hub, AI Project ฯลฯ
- **Feature Flags (บรรทัดที่ 61-63)**:
      - ตัวแปร Boolean เพื่อเปิด/ปิดบริการ Azure เฉพาะ
- **การตั้งค่า AI Agent (บรรทัดที่ 64-71)**:
      - การตั้งค่าสำหรับ AI agent หลัก รวมถึงชื่อ, ID, การตั้งค่าการปรับใช้, รายละเอียดโมเดล
- **การตั้งค่า AI Embedding (บรรทัดที่ 72-79)**:
      - การตั้งค่าสำหรับโมเดล embedding ที่ใช้สำหรับการค้นหาแบบเวกเตอร์
- **การค้นหาและการตรวจสอบ (บรรทัดที่ 80-84)**:
      - ชื่อดัชนีการค้นหา, ID ทรัพยากรที่มีอยู่, และการตั้งค่าการตรวจสอบ/การติดตาม

---

## 3. รู้จักตัวแปรสภาพแวดล้อม
ตัวแปรสภาพแวดล้อมต่อไปนี้ควบคุมการตั้งค่าและพฤติกรรมของการปรับใช้ของคุณ โดยจัดหมวดหมู่ตามวัตถุประสงค์หลัก ตัวแปรส่วนใหญ่มีค่าเริ่มต้นที่เหมาะสม แต่คุณสามารถปรับแต่งให้ตรงกับความต้องการเฉพาะหรือทรัพยากร Azure ที่มีอยู่

### 3.1 ตัวแปรที่จำเป็น

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 การตั้งค่าโมเดล
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 การเปิด/ปิดฟีเจอร์
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 การตั้งค่าโครงการ AI
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 ตรวจสอบตัวแปรของคุณ

ใช้ Azure Developer CLI เพื่อดูและจัดการตัวแปรสภาพแวดล้อมของคุณ:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

