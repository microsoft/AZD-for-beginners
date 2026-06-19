# Deployment Guide - การเชี่ยวชาญการปรับใช้ AZD

**การนำทางบทเรียน:**
- **📚 หน้าแรกคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 4 - โครงสร้างพื้นฐานในรูปแบบโค้ด & การปรับใช้
- **⬅️ บทก่อนหน้า**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)
- **➡️ ถัดไป**: [การจัดเตรียมทรัพยากร](provisioning.md)
- **🧩 ยังอยู่ในบทนี้**: [การสร้างเทมเพลตของคุณเอง](custom-templates.md)
- **🚀 บทถัดไป**: [บทที่ 5: โซลูชัน AI หลายตัวแทน](../../examples/retail-scenario.md)

## บทนำ

คู่มือฉบับสมบูรณ์นี้ครอบคลุมทุกสิ่งที่คุณต้องรู้เกี่ยวกับการปรับใช้แอปพลิเคชันโดยใช้ Azure Developer CLI ตั้งแต่การปรับใช้คำสั่งเดียวแบบพื้นฐานจนถึงสถานการณ์การผลิตขั้นสูงด้วย hook แบบกำหนดเอง สภาพแวดล้อมหลายตัว และการผสานรวม CI/CD เชี่ยวชาญวงจรชีวิตการปรับใช้ที่ครบถ้วนด้วยตัวอย่างเชิงปฏิบัติและแนวปฏิบัติที่ดีที่สุด

## เป้าหมายการเรียนรู้

เมื่อทำคู่มือนี้จนจบ คุณจะสามารถ:
- เชี่ยวชาญคำสั่งและกระบวนการปรับใช้ต่างๆ ของ Azure Developer CLI ทั้งหมด
- เข้าใจวงจรชีวิตการปรับใช้ทั้งหมดตั้งแต่การจัดเตรียมจนถึงการตรวจสอบ
- นำ hook การปรับใช้แบบกำหนดเองไปใช้เพื่ออัตโนมัติก่อนและหลังการปรับใช้
- กำหนดค่าสภาพแวดล้อมหลายตัวด้วยพารามิเตอร์เฉพาะสภาพแวดล้อม
- ตั้งค่ากลยุทธ์การปรับใช้ขั้นสูงรวมถึง blue-green และ canary deployments
- ผสานรวมการปรับใช้ azd กับ pipeline CI/CD และกระบวนงาน DevOps

## ผลลัพธ์การเรียนรู้

หลังจากจบการเรียน คุณจะสามารถ:
- รันและแก้ไขปัญหากระบวนการปรับใช้ azd ทั้งหมดได้อย่างอิสระ
- ออกแบบและนำระบบอัตโนมัติการปรับใช้แบบกำหนดเองโดยใช้ hook
- กำหนดค่าการปรับใช้พร้อมสำหรับผลิตด้วยความปลอดภัยและการตรวจสอบที่เหมาะสม
- จัดการสถานการณ์การปรับใช้ที่ซับซ้อนหลายสภาพแวดล้อม
- ปรับประสิทธิภาพการปรับใช้และใช้กลยุทธ์ rollback
- ผสานรวมการปรับใช้ azd เข้ากับแนวปฏิบัติ DevOps ขององค์กร

## ภาพรวมการปรับใช้

Azure Developer CLI ให้คำสั่งการปรับใช้หลายแบบ:
- `azd up` - กระบวนการครบถ้วน (จัดเตรียม + ปรับใช้)
- `azd provision` - สร้าง/อัปเดตทรัพยากร Azure เท่านั้น
- `azd deploy` - ปรับใช้โค้ดแอปเท่านั้น
- `azd package` - สร้างและบรรจุแอปพลิเคชัน

## กระบวนการปรับใช้พื้นฐาน

### การปรับใช้ครบวงจร (azd up)
กระบวนการที่ใช้บ่อยที่สุดสำหรับโปรเจกต์ใหม่:
```bash
# ติดตั้งทั้งหมดตั้งแต่เริ่มต้น
azd up

# ติดตั้งด้วยสภาพแวดล้อมเฉพาะ
azd up --environment production

# ติดตั้งด้วยพารามิเตอร์ที่กำหนดเอง
azd up --parameter location=westus2 --parameter sku=P1v2
```

### การปรับใช้เฉพาะโครงสร้างพื้นฐาน
เมื่อคุณต้องการอัปเดตทรัพยากร Azure เท่านั้น:
```bash
# จัดเตรียม/อัปเดตโครงสร้างพื้นฐาน
azd provision

# จัดเตรียมด้วย dry-run เพื่อตรวจสอบการเปลี่ยนแปลงล่วงหน้า
azd provision --preview

# จัดเตรียมบริการเฉพาะเจาะจง
azd provision --service database
```

### การปรับใช้เฉพาะโค้ด
สำหรับการอัปเดตแอปอย่างรวดเร็ว:
```bash
# ปรับใช้บริการทั้งหมด
azd deploy

# ผลลัพธ์ที่คาดหวัง:
# กำลังปรับใช้บริการ (azd deploy)
# - เว็บ: กำลังปรับใช้... เสร็จสิ้น
# - api: กำลังปรับใช้... เสร็จสิ้น
# สำเร็จ: การปรับใช้ของคุณเสร็จสิ้นใน 2 นาที 15 วินาที

# ปรับใช้บริการเฉพาะ
azd deploy --service web
azd deploy --service api

# ปรับใช้ด้วยอาร์กิวเมนต์การสร้างที่กำหนดเอง
azd deploy --service api --build-arg NODE_ENV=production

# ตรวจสอบการปรับใช้
azd show --output json | jq '.services'
```

### ✅ การยืนยันการปรับใช้

หลังการปรับใช้ทุกครั้ง ให้ตรวจสอบความสำเร็จ:

```bash
# ตรวจสอบให้แน่ใจว่าทุกบริการกำลังทำงาน
azd show

# ทดสอบจุดสิ้นสุดสุขภาพ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ตรวจสอบข้อผิดพลาด (เปิดในเบราว์เซอร์โดยค่าเริ่มต้น)
azd monitor --logs
```

**เกณฑ์ความสำเร็จ:**
- ✅ บริการทั้งหมดแสดงสถานะ "Running"
- ✅ จุดตรวจสอบสุขภาพตอบกลับ HTTP 200
- ✅ ไม่มีบันทึกข้อผิดพลาดใน 5 นาทีที่ผ่านมา
- ✅ แอปพลิเคชันตอบสนองต่อคำขอทดสอบ

## 🏗️ การเข้าใจกระบวนการปรับใช้

### ใหม่กับ hook? เริ่มที่นี่

**hook** คือคำสั่งที่ azd รันโดยอัตโนมัติในช่วงเวลาหนึ่งของกระบวนการปรับใช้—ก่อนหรือหลังการจัดเตรียม และก่อนหรือหลังการปรับใช้โค้ด ช่วยให้คุณอัตโนมัติการทำงานย่อยเล็กๆ ที่มักเกิดรอบๆ การปรับใช้ เช่น การเติมข้อมูลฐานข้อมูล รันการย้ายฐานข้อมูล สร้างแอสเซ็ต หรือทดสอบแอปบนสภาพแวดล้อมจริงแบบคร่าวๆ

| Hook | รันเมื่อ… | การใช้งานทั่วไป |
|------|---------|------------------|
| `preprovision` | ก่อนสร้างทรัพยากร | ตรวจสอบสิ่งที่ต้องเตรียม ล็อกอินไปยัง registry |
| `postprovision` | หลังจากทรัพยากรถูกสร้าง | กำหนดค่าทรัพยากร ตั้งค่าฐานข้อมูล |
| `predeploy` | ก่อนปรับใช้โค้ด | สร้างแอสเซ็ต front-end รัน unit test |
| `postdeploy` | หลังโค้ดพร้อมใช้งาน | รันการย้ายฐานข้อมูล ทดสอบผ่าน smoke test |

Hook อยู่ในไฟล์ `azure.yaml` นี่คือตัวอย่างที่เล็กที่สุด—แค่พิมพ์ข้อความหลังการปรับใช้:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

แค่นี้—ครั้งถัดไปที่คุณรัน `azd up` ข้อความจะพิมพ์ออกมาโดยอัตโนมัติ คุณยังสามารถรัน hook แบบเดี่ยวโดยไม่ต้องปรับใช้เต็มซึ่งดีสำหรับทดสอบ:

```bash
azd hooks run postdeploy
```

แต่ละขั้นตอนด้านล่างแสดง hook จริงในโลกการใช้งาน (เช่น การย้ายฐานข้อมูล, ทดสอบ, ตรวจสอบ) สำหรับแต่ละเฟส

### เฟส 1: pre-provision hooks
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

### เฟส 2: การจัดเตรียมโครงสร้างพื้นฐาน
- อ่านเทมเพลตโครงสร้างพื้นฐาน (Bicep/Terraform)
- สร้างหรืออัปเดตทรัพยากร Azure
- กำหนดค่าเครือข่ายและความปลอดภัย
- ตั้งค่าการตรวจสอบและการบันทึก

### เฟส 3: post-provision hooks
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

### เฟส 4: การบรรจุแอปพลิเคชัน
- สร้างโค้ดแอปพลิเคชัน
- สร้างอาร์ติแฟกต์สำหรับการปรับใช้
- บรรจุสำหรับแพลตฟอร์มเป้าหมาย (เช่น คอนเทนเนอร์, ไฟล์ ZIP)

### เฟส 5: pre-deploy hooks
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

### เฟส 6: การปรับใช้แอปพลิเคชัน
- ปรับใช้แอปที่บรรจุไปยังบริการ Azure
- อัปเดตการตั้งค่าการกำหนดค่า
- เริ่ม/รีสตาร์ทบริการ

### เฟส 7: post-deploy hooks
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

### การจัดการข้อผิดพลาดของ Hook

โดยค่าเริ่มต้น **ถ้าคำสั่ง hook ออกจากระบบด้วยรหัสไม่เท่ากับศูนย์ azd จะหยุดกระบวนการทั้งหมดทันที** ซึ่งโดยทั่วไปคือสิ่งที่ต้องการ—การย้ายฐานข้อมูลที่ล้มเหลวควรหยุดการปรับใช้ ไม่ใช่ส่งแอปที่เสียหายไปใช้งาน แต่หมายความว่าคุณต้องเขียน hook อย่างระมัดระวัง

**1. ให้ความล้มเหลวเป็นสิ่งที่ดังและตั้งใจ** hook ล้มเหลวเมื่อคำสั่งสุดท้ายส่งคืนรหัสออกที่ไม่เท่ากับศูนย์ ในสคริปต์ shell ใช้ `set -e` เพื่อให้ hook หยุดทันทีที่เจอคำสั่งล้มเหลว แทนที่จะดำเนินต่ออย่างเงียบๆ:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. อนุญาตให้ hook ล้มเหลวโดยไม่หยุด azd** สำหรับขั้นตอนที่ไม่สำคัญ (เช่น การอุ่นแคชที่เลือกทำ หรือแจ้งเตือนแบบพยายามดีที่สุด) กำหนด `continueOnError: true` azd จะบันทึกความล้มเหลวแต่ดำเนินการต่อไป:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. ทดสอบ hook เป็นการแยกก่อนการรันแบบเต็ม** คุณไม่จำเป็นต้องรัน `azd up` เพื่อดีบัก hook—รันมันแค่ตัวเดียวแล้วปรับปรุงอย่างรวดเร็ว:

```bash
azd hooks run predeploy          # รันเฉพาะ hook ก่อนการปรับใช้เท่านั้น
azd hooks run postdeploy --service api
```

**4. ระวัง shell ที่เฉพาะกับระบบปฏิบัติการ** hook ที่ใช้ `shell: pwsh` ต้องมี PowerShell ติดตั้งบนเครื่องที่รัน (รวมถึงเอเจนต์ CI) ใช้ `shell: sh` สำหรับพาหนะที่กว้างที่สุด หรือใช้ทั้งแบบ `windows` และ `posix`:

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

> **เคล็ดลับดีบัก:** รันคำสั่ง azd ใดก็ได้พร้อม `--debug` เพื่อดูบรรทัดคำสั่ง hook ที่แท้จริงและผลลัพธ์เต็ม ซึ่งมีค่าเมื่อ hook ทำงานได้ในเครื่องแต่ล้มเหลวใน CI

## 🎛️ การกำหนดค่าการปรับใช้

### การตั้งค่าการปรับใช้เฉพาะบริการ
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### การกำหนดค่าสภาพแวดล้อมเฉพาะ
```bash
# สภาพแวดล้อมการพัฒนา
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# สภาพแวดล้อมสเตจจิ้ง
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# สภาพแวดล้อมการผลิต
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

### การปรับใช้แบบ blue-green
```bash
# สร้างสภาพแวดล้อมสีน้ำเงิน
azd env new production-blue
azd up --environment production-blue

# ทดสอบสภาพแวดล้อมสีน้ำเงิน
./scripts/test-environment.sh production-blue

# สลับการจราจรไปที่สีน้ำเงิน (อัปเดต DNS/โหลดบาลานเซอร์ด้วยตนเอง)
./scripts/switch-traffic.sh production-blue

# ทำความสะอาดสภาพแวดล้อมสีเขียว
azd env select production-green
azd down --force
```

### การปรับใช้แบบ canary
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### การปรับใช้แบบแบ่งเฟส
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 การปรับใช้คอนเทนเนอร์

### การปรับใช้ Container App
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### การเพิ่มประสิทธิภาพ Dockerfile หลายเฟส
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ การเพิ่มประสิทธิภาพการทำงาน

### การปรับใช้เฉพาะบริการ
```bash
# ปล่อยใช้บริการเฉพาะสำหรับการวนรอบที่รวดเร็วขึ้น
azd deploy --service web
azd deploy --service api

# ปล่อยใช้บริการทั้งหมด
azd deploy
```

### การแคชการสร้าง
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### การปรับใช้โค้ดอย่างมีประสิทธิภาพ
```bash
# ใช้ azd deploy (ไม่ใช่ azd up) สำหรับการเปลี่ยนแปลงเฉพาะโค้ด
# วิธีนี้จะข้ามการจัดเตรียมโครงสร้างพื้นฐานและรวดเร็วกว่าอย่างมาก
azd deploy

# ดีพลอยบริการเฉพาะสำหรับการทำซ้ำที่รวดเร็วที่สุด
azd deploy --service api
```

## 🔍 การตรวจสอบการปรับใช้

### การตรวจสอบการปรับใช้เรียลไทม์
```bash
# ตรวจสอบแอปพลิเคชันแบบเรียลไทม์
azd monitor --live

# ดูบันทึกแอปพลิเคชัน
azd monitor --logs

# ตรวจสอบสถานะการปรับใช้
azd show
```

### การตรวจสุขภาพ
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### การตรวจสอบหลังการปรับใช้
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# ตรวจสอบสถานะสุขภาพของแอปพลิเคชัน
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
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
# เก็บความลับอย่างปลอดภัย
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# อ้างอิงความลับใน azure.yaml
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### ความปลอดภัยเครือข่าย
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### การจัดการตัวตนและการเข้าถึง
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 กลยุทธ์การย้อนกลับ

### การย้อนกลับด่วน
```bash
# AZD ไม่มีการย้อนกลับในตัว วิธีที่แนะนำ:

# ตัวเลือกที่ 1: ติดตั้งใหม่จาก Git (แนะนำ)
git revert HEAD  # ยกเลิกคอมมิตที่มีปัญหา
git push
azd deploy

# ตัวเลือกที่ 2: ติดตั้งใหม่เฉพาะคอมมิตที่ระบุ
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### การย้อนกลับโครงสร้างพื้นฐาน
```bash
# ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนใช้
azd provision --preview

# สำหรับการย้อนกลับโครงสร้างพื้นฐาน ให้ใช้การควบคุมเวอร์ชัน:
git revert HEAD  # ย้อนกลับการเปลี่ยนแปลงโครงสร้างพื้นฐาน
azd provision    # ใช้สถานะโครงสร้างพื้นฐานก่อนหน้า
```

### การย้อนกลับการย้ายฐานข้อมูล
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
# ดูสถานะการปรับใช้ปัจจุบัน
azd show

# ติดตามแอปพลิเคชันด้วย Application Insights
azd monitor --overview

# ดูเมตริกแบบสด
azd monitor --live
```

### การเก็บตัวชี้วัดแบบกำหนดเอง
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

## 🎯 แนวปฏิบัติที่ดีที่สุด

### 1. ความสอดคล้องของสภาพแวดล้อม
```bash
# ใช้การตั้งชื่อที่สอดคล้องกัน
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# รักษาความเท่าเทียมของสภาพแวดล้อม
./scripts/sync-environments.sh
```

### 2. การตรวจสอบโครงสร้างพื้นฐาน
```bash
# ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนการปรับใช้
azd provision --preview

# ใช้การตรวจสอบโค้ด ARM/Bicep
az bicep lint --file infra/main.bicep

# ตรวจสอบความถูกต้องของไวยากรณ์ Bicep
az bicep build --file infra/main.bicep
```

### 3. การผสานรวมการทดสอบ
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
# เอกสารขั้นตอนการปรับใช้
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ขั้นตอนถัดไป

- [การจัดเตรียมทรัพยากร](provisioning.md) - เจาะลึกการจัดการโครงสร้างพื้นฐาน
- [การวางแผนก่อนการปรับใช้](../chapter-06-pre-deployment/capacity-planning.md) - วางแผนกลยุทธ์การปรับใช้ของคุณ
- [ปัญหาที่พบบ่อย](../chapter-07-troubleshooting/common-issues.md) - แก้ไขปัญหาการปรับใช้
- [แนวปฏิบัติที่ดีที่สุด](../chapter-07-troubleshooting/debugging.md) - กลยุทธ์การปรับใช้พร้อมใช้งานจริง

## 🎯 แบบฝึกหัดการปรับใช้เชิงปฏิบัติ

### แบบฝึกหัด 1: กระบวนการปรับใช้แบบเพิ่มขั้น (20 นาที)
**เป้าหมาย**: เชี่ยวชาญความแตกต่างระหว่างการปรับใช้เต็มและแบบเพิ่มขั้น

```bash
# การติดตั้งเริ่มต้น
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# บันทึกเวลาการติดตั้งเริ่มต้น
echo "Full deployment: $(date)" > deployment-log.txt

# เปลี่ยนแปลงโค้ด
echo "// Updated $(date)" >> src/api/src/server.js

# ติดตั้งโค้ดอย่างเดียว (เร็ว)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# เปรียบเทียบเวลา
cat deployment-log.txt

# ทำความสะอาด
azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] การปรับใช้เต็มใช้เวลา 5-15 นาที
- [ ] การปรับใช้เฉพาะโค้ดใช้เวลา 2-5 นาที
- [ ] การเปลี่ยนแปลงโค้ดสะท้อนในแอปที่ปรับใช้แล้ว
- [ ] โครงสร้างพื้นฐานไม่เปลี่ยนแปลงหลัง `azd deploy`

**ผลลัพธ์การเรียนรู้**: `azd deploy` เร็วกว่า `azd up` 50-70% สำหรับการเปลี่ยนแปลงโค้ด

### แบบฝึกหัด 2: Hook การปรับใช้แบบกำหนดเอง (30 นาที)
**เป้าหมาย**: นำระบบอัตโนมัติก่อนและหลังการปรับใช้ไปใช้งาน

```bash
# สร้างสคริปต์ตรวจสอบก่อนการปรับใช้
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ตรวจสอบว่าการทดสอบผ่าน
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ตรวจสอบการเปลี่ยนแปลงที่ยังไม่ได้คอมมิต
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# สร้างการทดสอบสภาพแวดล้อมหลังการปรับใช้
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# เพิ่ม hooks ลงใน azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ทดสอบการปรับใช้ด้วย hooks
azd deploy
```

**เกณฑ์ความสำเร็จ:**
- [ ] สคริปต์ก่อนปรับใช้รันก่อนการปรับใช้
- [ ] ยกเลิกการปรับใช้ถ้าการทดสอบล้มเหลว
- [ ] ทดสอบ smoke test หลังปรับใช้ตรวจสอบสุขภาพ
- [ ] Hook รันตามลำดับที่ถูกต้อง

### แบบฝึกหัด 3: กลยุทธ์การปรับใช้หลายสภาพแวดล้อม (45 นาที)
**เป้าหมาย**: นำกระบวนการปรับใช้แบ่งเฟสไปใช้งาน (dev → staging → production)

```bash
# สร้างสคริปต์การปรับใช้
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ขั้นตอนที่ 1: ปรับใช้ไปที่ dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ขั้นตอนที่ 2: ปรับใช้ไปที่ staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ขั้นตอนที่ 3: อนุมัติโดยผู้ใช้สำหรับ production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# สร้างสภาพแวดล้อม
azd env new dev
azd env new staging
azd env new production

# รันการปรับใช้อย่างเป็นขั้นตอน
./deploy-staged.sh
```

**เกณฑ์ความสำเร็จ:**
- [ ] สภาพแวดล้อม dev ปรับใช้ได้สำเร็จ
- [ ] สภาพแวดล้อม staging ปรับใช้ได้สำเร็จ
- [ ] ต้องการการอนุมัติด้วยตนเองสำหรับ production
- [ ] ทุกสภาพแวดล้อมมีการตรวจสุขภาพทำงาน
- [ ] สามารถย้อนกลับได้หากจำเป็น

### แบบฝึกหัด 4: กลยุทธ์การย้อนกลับ (25 นาที)
**เป้าหมาย**: นำกลยุทธ์ย้อนกลับและทดสอบโดยใช้ Git

```bash
# ติดตั้งเวอร์ชัน 1
azd env set APP_VERSION "1.0.0"
azd up

# บันทึกแฮชคอมมิตของเวอร์ชัน 1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ติดตั้งเวอร์ชัน 2 ที่มีการเปลี่ยนแปลงใหญ่
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ตรวจจับความล้มเหลวและย้อนกลับ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # ย้อนกลับโดยใช้ git
    git revert HEAD --no-edit
    
    # ย้อนกลับสภาพแวดล้อม
    azd env set APP_VERSION "1.0.0"
    
    # ติดตั้งเวอร์ชัน 1 ใหม่
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**เกณฑ์ความสำเร็จ:**
- [ ] ตรวจจับความล้มเหลวการปรับใช้ได้
- [ ] สคริปต์ย้อนกลับรันโดยอัตโนมัติ
- [ ] แอปพลิเคชันกลับสู่สถานะทำงานได้
- [ ] การตรวจสุขภาพผ่านหลังย้อนกลับ

## 📊 การติดตามตัวชี้วัดการปรับใช้

### ติดตามประสิทธิภาพการปรับใช้ของคุณ

```bash
# สร้างสคริปต์เมตริกการปรับใช้
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# บันทึกลงไฟล์
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ใช้มัน
./track-deployment.sh
```

**วิเคราะห์ตัวชี้วัดของคุณ:**
```bash
# ดูประวัติการปรับใช้
cat deployment-metrics.csv

# คำนวณเวลาปรับใช้เฉลี่ย
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## แหล่งข้อมูลเพิ่มเติม

- [เอกสารอ้างอิงการปรับใช้ Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [การปรับใช้ Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [การปรับใช้ Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [การปรับใช้ Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [โปรเจกต์แรกของคุณ](../chapter-01-foundation/first-project.md)
- **บทเรียนถัดไป**: [การจัดเตรียมทรัพยากร](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->