# คู่มือการปรับใช้ - เชี่ยวชาญการปรับใช้ AZD

**การนำทางบท:**
- **📚 หน้าแรกหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 4 - โครงสร้างพื้นฐานในรูปแบบโค้ด & การปรับใช้
- **⬅️ บทก่อนหน้า**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)
- **➡️ ถัดไป**: [การจัดหาทรัพยากร](provisioning.md)
- **🧩 ยังอยู่ในบทนี้**: [การสร้างแม่แบบของคุณเอง](custom-templates.md)
- **🚀 บทถัดไป**: [บทที่ 5: โซลูชัน AI หลายตัวแทน](../../examples/retail-scenario.md)

## บทนำ

> ตรวจสอบกับ `azd 1.37.2` (พฤศจิกายน 2026) คำสั่งใช้ Bash; ตัวอย่าง JSON ต้องการ `jq` ยกเว้นการฝึกฝน todo ที่ระบุการเริ่มต้นอย่างชัดเจน ตัวอย่างขั้นสูงเป็น **ชิ้นส่วนการผสานรวม**: ต้องจัดหาซอร์สของคุณเอง โครงสร้างพื้นฐาน การทดสอบ และสคริปต์ ไม่มีการปรับใช้ Azure จริงในรีวิวนี้

คู่มือที่ครอบคลุมนี้ครอบคลุมทุกสิ่งที่คุณจำเป็นต้องรู้เกี่ยวกับการปรับใช้แอปพลิเคชันโดยใช้ Azure Developer CLI ตั้งแต่การปรับใช้คำสั่งเดียวพื้นฐานไปจนถึงสถานการณ์การผลิตขั้นสูงที่มีฮุคแบบกำหนดเอง สภาพแวดล้อมหลายตัว และการผสานรวม CI/CD เรียนรู้วงจรชีวิตการปรับใช้ทั้งหมดด้วยตัวอย่างการปฏิบัติและแนวทางปฏิบัติที่ดีที่สุด

## เป้าหมายการเรียนรู้

เมื่อทำคู่มือนี้เสร็จสิ้น คุณจะสามารถ:
- เชี่ยวชาญคำสั่งและเวิร์กโฟลว์การปรับใช้ Azure Developer CLI ทั้งหมด
- เข้าใจวงจรชีวิตการปรับใช้ทั้งหมดตั้งแต่การจัดหาจนถึงการตรวจสอบ
- ใช้ฮุคการปรับใช้แบบกำหนดเองสำหรับการทำงานอัตโนมัติก่อนและหลังการปรับใช้
- กำหนดค่าสภาพแวดล้อมหลายตัวด้วยพารามิเตอร์เฉพาะสภาพแวดล้อม
- ตั้งค่ายุทธศาสตร์การปรับใช้ขั้นสูงรวมถึงการปรับใช้แบบ blue-green และ canary
- ผสานรวมการปรับใช้ azd กับ pipeline CI/CD และเวิร์กโฟลว์ DevOps

## ผลลัพธ์การเรียนรู้

หลังจากเสร็จสิ้น คุณจะสามารถ:
- รันและแก้ไขปัญหาเวิร์กโฟลว์การปรับใช้ azd ได้ด้วยตัวเองทั้งหมด
- ออกแบบและใช้งานออโตเมชันการปรับใช้แบบกำหนดเองโดยใช้ฮุค
- กำหนดค่าการปรับใช้ที่พร้อมใช้งานในสภาพแวดล้อมจริงพร้อมความปลอดภัยและการตรวจสอบ
- จัดการสถานการณ์การปรับใช้แบบสภาพแวดล้อมหลายตัวที่ซับซ้อน
- ปรับแต่งประสิทธิภาพการปรับใช้และใช้นโยบายการย้อนกลับ
- ผสานรวมการปรับใช้ azd เข้ากับแนวทางปฏิบัติ DevOps ระดับองค์กร

## ภาพรวมการปรับใช้

Azure Developer CLI มีคำสั่งปรับใช้หลายคำสั่ง:
- `azd up` - เวิร์กโฟลว์ครบถ้วน (จัดหา + ปรับใช้)
- `azd provision` - สร้าง/อัปเดตทรัพยากร Azure เท่านั้น
- `azd deploy` - ปรับใช้โค้ดแอปพลิเคชันเท่านั้น
- `azd package` - สร้างและบรรจุแอปพลิเคชัน

## เวิร์กโฟลว์การปรับใช้พื้นฐาน

### การปรับใช้ครบถ้วน (azd up)
เวิร์กโฟลว์ที่พบบ่อยที่สุดสำหรับโปรเจกต์ใหม่:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### การปรับใช้เฉพาะโครงสร้างพื้นฐาน
เมื่อคุณต้องการอัปเดตทรัพยากร Azure เท่านั้น:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### การปรับใช้เฉพาะโค้ด
สำหรับการอัปเดตแอปพลิเคชันอย่างรวดเร็ว:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ การตรวจสอบการปรับใช้

หลังการปรับใช้ทุกครั้ง ตรวจสอบความสำเร็จ:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**เกณฑ์ความสำเร็จ:**
- ✅ `azd show` แก้เป้าหมายบริการ/URL ที่คาดไว้ได้
- ✅ คำขอไปยังเส้นทางแอปพลิเคชันจริงส่งคืนสถานะและเนื้อหาที่คาดไว้
- ✅ ไม่มีบันทึกข้อผิดพลาดใน 5 นาทีที่ผ่านมา
- ✅ แอปพลิเคชันตอบสนองต่อคำขอทดสอบ

## 🏗️ ความเข้าใจกระบวนการปรับใช้

### เพิ่งเริ่มใช้ฮุค? เริ่มที่นี่

**ฮุค** คือคำสั่งที่ azd รันโดยอัตโนมัติในช่วงเวลาหนึ่งของกระบวนการปรับใช้ — ก่อนหรือหลังการจัดหา และก่อนหรือหลังการปรับใช้โค้ด ช่วยให้คุณอัตโนมัติงานเล็ก ๆ ที่มักเกิดรอบตัวการปรับใช้ เช่น การเติมข้อมูลฐานข้อมูล การรันการโยกย้าย สร้างแอสเซ็ต หรือทดสอบเบื้องต้นแอปสด

| ฮุค | รันเมื่อ… | การใช้งานทั่วไป |
|------|-------|------------|
| `preprovision` | ก่อนสร้างทรัพยากร | ตรวจสอบความพร้อม, ลงชื่อเข้าใช้ registry |
| `postprovision` | หลังทรัพยากรมีอยู่ | กำหนดค่าทรัพยากร, ตั้งค่าฐานข้อมูล |
| `predeploy` | ก่อนปรับใช้โค้ด | สร้างแอสเซ็ตส่วนหน้าของแอป, รันยูนิตเทสต์ |
| `postdeploy` | หลังโค้ดอยู่ใช้งาน | รันการโยกย้าย DB, ทดสอบเบื้องต้น endpoint |

ฮุคอยู่ใน `azure.yaml` ของคุณ นี่คือตัวอย่างเล็กที่สุด — แสดงข้อความหลังการปรับใช้:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

เท่านี้แหละ — ครั้งถัดไปที่คุณรัน `azd up` ข้อความจะแสดงโดยอัตโนมัติ คุณยังสามารถรันฮุคเดี่ยวโดยไม่ต้องปรับใช้เต็ม ซึ่งดีสำหรับการทดสอบ:

```bash
azd hooks run postdeploy
```

ขั้นตอนด้านล่างแสดงฮุคในโลกจริง (การโยกย้าย, การทดสอบ, การตรวจสอบ) สำหรับแต่ละขั้นตอน

### ขั้นตอน 1: ฮุคก่อนจัดหา
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### ขั้นตอน 2: การจัดหาโครงสร้างพื้นฐาน
- อ่านแม่แบบโครงสร้างพื้นฐาน (Bicep/Terraform)
- สร้างหรืออัปเดตทรัพยากร Azure
- กำหนดค่าเครือข่ายและความปลอดภัย
- ตั้งค่าการตรวจสอบและบันทึก

### ขั้นตอน 3: ฮุคหลังจัดหา
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### ขั้นตอน 4: บรรจุแอปพลิเคชัน
- สร้างโค้ดแอปพลิเคชัน
- สร้างอาร์ติแฟกต์สำหรับปรับใช้
- บรรจุแพ็กเกจสำหรับแพลตฟอร์มเป้าหมาย (คอนเทนเนอร์, ไฟล์ ZIP ฯลฯ)

### ขั้นตอน 5: ฮุคก่อนปรับใช้
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### ขั้นตอน 6: การปรับใช้แอปพลิเคชัน
- ปรับใช้แอปพลิเคชันที่บรรจุลงบริการ Azure
- อัปเดตการตั้งค่าการกำหนดค่า
- เริ่ม/รีสตาร์ทบริการ

### ขั้นตอน 7: ฮุคหลังปรับใช้
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### การจัดการข้อผิดพลาดของฮุค

โดยค่าเริ่มต้น, **หากคำสั่งฮุคจบด้วยรหัสออกที่ไม่ใช่ศูนย์ azd จะหยุดการทำงานทั้งหมดทันที** ซึ่งโดยทั่วไปเป็นสิ่งที่คุณต้องการ — การโยกย้ายที่ล้มเหลวควรหยุดการปรับใช้ ไม่ควรส่งแอปที่มีข้อผิดพลาด แต่หมายความว่าฮุคต้องเขียนอย่างระมัดระวัง

**1. ทำให้ข้อผิดพลาดเด่นชัดและตั้งใจ.** ฮุคล้มเหลวเมื่อคำสั่งสุดท้ายคืนค่ารหัสออกไม่ใช่ศูนย์ ในสคริปต์เชลล์ ให้เพิ่ม `set -e` เพื่อให้ฮุคหยุดเมื่อคำสั่งใดล้มเหลวแทนที่จะดำเนินการต่อโดยเงียบๆ:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. อนุญาตให้ฮุคล้มเหลวโดยไม่หยุด azd.** สำหรับขั้นตอนที่ไม่สำคัญ (การอุ่นแคชแบบเลือกทำ, การแจ้งเตือนแบบพยายามดีที่สุด) ตั้งค่า `continueOnError: true` azd จะบันทึกข้อผิดพลาดแต่ดำเนินการต่อ:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. ทดสอบฮุคแยกกันก่อนรันเต็ม.** คุณไม่จำเป็นต้องรัน `azd up` เพื่อดีบักฮุค — รันมันเองแล้วปรับปรุงอย่างรวดเร็ว:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. ระวังเชลล์เฉพาะระบบปฏิบัติการ.** ฮุคที่ใช้ `shell: pwsh` ต้องติดตั้ง PowerShell ในเครื่องที่รัน (รวมถึงเอเจนต์ CI) ใช้ `shell: sh` เพื่อความเข้ากันได้กว้างที่สุด หรือให้ทั้งตัวเลือก `windows` และ `posix`:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **เคล็ดลับดีบัก:** รันคำสั่ง azd ใดก็ได้กับ `--debug` เพื่อดูคำสั่งฮุคแบบแม่นยำและข้อมูลผลลัพธ์เต็ม ๆ — มีประโยชน์มากเมื่อฮุคทำงานในเครื่องแต่ล้มเหลวใน CI

## 🎛️ การกำหนดค่าการปรับใช้

### การตั้งค่าการปรับใช้เฉพาะบริการ
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### การกำหนดค่าสภาพแวดล้อมเฉพาะตัว

เหล่านี้เป็นค่าท้องถิ่นของ azd เท่านั้น โปรดแม็ปอย่างชัดเจนไปยังการกำหนดค่าโครงสร้างพื้นฐาน/รันไทม์ `NODE_ENV` มักเป็น `production` สำหรับแอป Node ที่ปรับใช้ รวมถึงการปรับใช้แบบ staging; ใช้ตัวแปรเฉพาะแอปเพื่อแยกแยะขั้นตอนการปรับใช้

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 สถานการณ์การปรับใช้ขั้นสูง

### แอปพลิเคชันหลายบริการ
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### การปรับใช้แบบ Blue-Green

**ภาพร่างการดำเนินงานประกอบ:** คุณต้องจัดหาทั้งสองสภาพแวดล้อม เลเยอร์การกำหนดเส้นทางการจราจรร่วม และสคริปต์สองตัวนี้ azd ไม่สลับการจราจรหรือตรวจสอบความพร้อมในการย้อนกลับโดยอัตโนมัติ ให้คงสีเขียวไว้จนกว่าสีน้ำเงินจะผ่านการทดสอบและไม่จำเป็นต้องย้อนกลับอีกต่อไป

```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### การปรับใช้แบบ Canary
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

การแยกการจราจรเป็นการตั้งค่าของ Container Apps (Bicep หรือ Azure CLI) ไม่ใช่คุณสมบัติของ `azure.yaml` `trafficSplit` การพรีวิว/การจัดหาและการปรับใช้ต่อมาจะต้องรักษาโหมดรีวิชันและกฎการกำหนดเส้นทางที่คุณเลือกไว้

### การปรับใช้แบบเป็นขั้นตอน
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 การปรับใช้คอนเทนเนอร์

### การปรับใช้แอปคอนเทนเนอร์
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

กำหนดความลับรันไทม์ด้วย `configuration.secrets`/`secretRef` (หรือการอ้างอิง Key Vault) และการปรับขนาดด้วย `template.scale` ในโครงสร้างพื้นฐาน Container App อย่าสร้างคุณสมบัติ `secrets` หรือ `scale` ในระดับบริการใน `azure.yaml`

### การเพิ่มประสิทธิภาพ Dockerfile แบบหลายขั้นตอน
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ การปรับปรุงประสิทธิภาพ

### การปรับใช้เฉพาะบริการ
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### แคชการสร้าง
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

เวิร์กโฟลว์ Node มาตรฐานใช้สคริปต์แพ็กเกจ; ฮุค `prepackage` ของบริการสามารถเพิ่มขั้นตอนที่จำเป็นได้ แคชเลเยอร์ Docker แยกจากการกำหนดคำสั่งสร้างบริการ

### การปรับใช้โค้ดอย่างมีประสิทธิภาพ
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 การตรวจสอบการปรับใช้

### การตรวจสอบการปรับใช้แบบเรียลไทม์
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### การตรวจสุขภาพ
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

แอปของคุณต้องใช้งาน `/health`; azd ไม่ได้จัดเตรียมให้อัตโนมัติ ไม่มีคุณสมบัติบริการ `azure.yaml` `healthCheck` ทั่วไป

### การตรวจสอบหลังการปรับใช้
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 ข้อควรพิจารณาด้านความปลอดภัย

### การจัดการความลับ
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` ไม่ถูกต้อง ค่าสภาพแวดล้อมธรรมดาคือข้อความล้วนท้องถิ่น; อย่าสมมติว่าคำสั่งอ่านจะลบข้อมูลลับ คำสั่งข้างต้นบันทึกการอ้างอิง Key Vault แต่องค์ประกอบโครงสร้างพื้นฐาน/แอปของคุณยังต้องใช้ความลับและให้สิทธิการเข้าถึงระบุรันไทม์

### ความปลอดภัยเครือข่าย
ประกาศและใช้พารามิเตอร์เครือข่ายใน Bicep และแม็ปใน `infra/main.parameters.json` ไม่มีเลเยอร์ `infra.parameters` ทั่วไปใน `azure.yaml` เอกสารตัวอย่างช่วง `203.0.113.0/24` และ `198.51.100.0/24` ไม่ใช่เครือข่ายออฟฟิศ/VPN จริง; แทนที่ด้วยช่วงเครือข่ายที่ได้รับอนุญาต

### การจัดการตัวตนและการเข้าถึง
เปิดใช้งาน `identity` ของ Container App ใน Bicep และกำหนดบทบาท data-plane ของ Key Vault ที่จำเป็นในระดับ vault กำหนดค่า secrets แบบสนับสนุน Key Vault ที่มีชื่อและการอ้างอิงในเวลารันไทม์ในทรัพยากรนั้น; `identity` และ `keyVault` ไม่ใช่คุณสมบัติของบริการ azd ทั่วไป ดูที่ [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 กลยุทธ์การย้อนกลับ

### การย้อนกลับอย่างรวดเร็ว
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### การย้อนกลับโครงสร้างพื้นฐาน
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### การย้อนกลับการโยกย้ายฐานข้อมูล
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ตัวชี้วัดการปรับใช้

### ติดตามประสิทธิภาพการปรับใช้
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### การเก็บรวบรวมเมตริกที่กำหนดเอง
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 แนวทางปฏิบัติที่ดีที่สุด

### 1. ความสอดคล้องของสภาพแวดล้อม
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. การตรวจสอบโครงสร้างพื้นฐาน
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. การทดสอบการผสานรวม
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. เอกสารและการบันทึก
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ขั้นตอนถัดไป

- [การจัดเตรียมทรัพยากร](provisioning.md) - เจาะลึกการจัดการโครงสร้างพื้นฐาน
- [การวางแผนก่อนการปรับใช้](../chapter-06-pre-deployment/capacity-planning.md) - วางแผนกลยุทธ์การปรับใช้ของคุณ
- [ปัญหาทั่วไป](../chapter-07-troubleshooting/common-issues.md) - แก้ไขปัญหาการปรับใช้
- [แนวปฏิบัติที่ดีที่สุด](../chapter-07-troubleshooting/debugging.md) - กลยุทธ์การปรับใช้ที่พร้อมสำหรับการผลิต

## 🎯 แบบฝึกหัดการปรับใช้ด้วยตนเอง

### แบบฝึกหัด 1: กระบวนการปรับใช้อย่างค่อยเป็นค่อยไป (20 นาที)
**เป้าหมาย**: เชี่ยวชาญความแตกต่างระหว่างการปรับใช้แบบเต็มและแบบเพิ่มขึ้น

**จุดเริ่มต้น:** Bash, Node.js 22, Git, การลงชื่อเข้าใช้ azd, และการสมัครใช้ Azure ที่มีสิทธิ์ในการปรับใช้ รันในไดเรกทอรีใหม่; คาดว่าจะมีทรัพยากร App Service/Cosmos DB ที่มีค่าใช้จ่าย เวลาในการดำเนินการขึ้นอยู่กับภูมิภาคและเทมเพลต

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] บันทึกเวลาที่ใช้สำหรับทั้งสองคำสั่ง (ไม่มีเวลาที่รับประกัน)
- [ ] ทั้งสองคำสั่งทำงานเสร็จสมบูรณ์
- [ ] API ยังคงทำงานได้; การแก้ไขที่มีเพียงคอมเมนต์ไม่ใช่การเปลี่ยนแปลงที่มองเห็นใน UI
- [ ] โครงสร้างพื้นฐานไม่มีการเปลี่ยนแปลงหลังจาก `azd deploy`

**ผลลัพธ์การเรียนรู้**: `azd deploy` ข้ามการจัดเตรียมโครงสร้างพื้นฐาน เปรียบเทียบเวลาที่วัดได้แทนการสมมติการเร่งความเร็วเป็นเปอร์เซ็นต์ที่กำหนด

### แบบฝึกหัด 2: Custom Deployment Hooks (30 นาที)
**เป้าหมาย:** ทำการอัตโนมัติก่อนและหลังการปรับใช้

**จุดเริ่มต้น:** โครงการ `deployment-practice` ที่เริ่มต้นไว้ข้างต้น หากคุณล้างข้อมูล ให้รัน `azd up` อีกครั้งก่อนทดสอบการปรับใช้ที่แก้ไขโค้ดเท่านั้น การตรวจสอบต่อไปนี้ใช้สคริปต์การสร้างจริงของ API ไม่ใช่สคริปต์ `test:unit` ที่ไม่มีอยู่จริงในโฟลเดอร์หลัก การทดสอบ API ของเทมเพลตต้องการการเข้าถึงฐานข้อมูลที่ตั้งค่าไว้; ไม่ใช่การทดสอบหน่วยที่แยกกัน

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**เกณฑ์ความสำเร็จ:**
- [ ] สคริปต์ก่อนปรับใช้ทำงานก่อนการปรับใช้
- [ ] การปรับใช้ถูกยกเลิกหากการตรวจสอบการสร้างล้มเหลว
- [ ] การทดสอบเบื้องต้นหลังปรับใช้ยืนยันสุขภาพ
- [ ] ฮุคทำงานตามลำดับที่ถูกต้อง

### แบบฝึกหัด 3: กลยุทธ์การปรับใช้หลายสภาพแวดล้อม (45 นาที)
**เป้าหมาย:** ทำเวิร์กโฟลว์การปรับใช้งานแบบแบ่งขั้นตอน (dev → staging → production)

**จุดเริ่มต้น:** โปรเจกต์ todo ที่เริ่มต้นเดียวกับ `jq` สร้างสภาพแวดล้อมด้านล่างด้วยค่าสมาชิก/ตำแหน่งที่ตั้งจริง (หรือกำหนด `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` ในแต่ละอัน) **ก่อน** เรียกใช้งานโฟลว์แบบไม่ต้องมีพรอมต์ โดยระบบจะล้มเหลวโดยเจตนาแทนที่จะสมมุติค่าที่ขาดหาย ใช้เฉพาะสภาพแวดล้อมการฝึกอบรมแบบใช้แล้วทิ้งเท่านั้น ไม่ใช่สมาชิกการผลิตจริง

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**เกณฑ์ความสำเร็จ:**
- [ ] การปรับใช้งานสภาพแวดล้อม Dev สำเร็จ
- [ ] การปรับใช้งานสภาพแวดล้อม Staging สำเร็จ
- [ ] ต้องการการอนุมัติโดยผู้ใช้สำหรับการผลิต
- [ ] ทุกสภาพแวดล้อมมีการตรวจสุขภาพที่ทำงานได้
- [ ] สามารถย้อนกลับได้หากจำเป็น

### แบบฝึกหัด 4: กลยุทธ์การย้อนกลับ (25 นาที)
**เป้าหมาย**: ใช้งานและทดสอบการย้อนกลับการปรับใช้งานโดยใช้ Git

**จุดเริ่มต้น:** การเช็คเอาต์สำหรับฝึกอบรมแบบแยกส่วนของแม่แบบ todo ที่มีซอร์สพื้นฐานทั้งหมดจะถูกคอมมิตแล้ว ต้นไม้ทำงาน Git สะอาด และสภาพแวดล้อมที่ตั้งค่าแบบใช้แล้วทิ้ง ไม่ควรสร้างความล้มเหลวโดยตั้งใจในโปรเจกต์การผลิตจริง `APP_VERSION` ด้านล่างเป็นการจดบันทึกเท่านั้น เว้นแต่คุณจะเชื่อมต่ออย่างชัดเจนในแอปพลิเคชัน

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**เกณฑ์ความสำเร็จ:**
- [ ] สามารถตรวจจับความล้มเหลวในการปรับใช้งาน
- [ ] สคริปต์การย้อนกลับทำงานโดยอัตโนมัติ
- [ ] แอปพลิเคชันกลับสู่สถานะที่ทำงานได้
- [ ] การตรวจสุขภาพผ่านหลังจากย้อนกลับ

## 📊 การติดตามเมตริกการปรับใช้งาน

### ติดตามประสิทธิภาพการปรับใช้งานของคุณ

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**วิเคราะห์เมตริกของคุณ:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## แหล่งข้อมูลเพิ่มเติม

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [โปรเจกต์แรกของคุณ](../chapter-01-foundation/first-project.md)
- **บทเรียนถัดไป**: [การจัดสรรทรัพยากร](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->