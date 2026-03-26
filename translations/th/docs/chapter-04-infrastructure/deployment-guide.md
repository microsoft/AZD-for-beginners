# Deployment Guide - การทำความเชี่ยวชาญในการปรับใช้ AZD

**การนำทางบท:**
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 4 - โครงสร้างพื้นฐานในรูปแบบโค้ด & การปรับใช้
- **⬅️ บทก่อนหน้า**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)
- **➡️ ถัดไป**: [การจัดสรรทรัพยากร](provisioning.md)
- **🚀 บทถัดไป**: [บทที่ 5: โซลูชัน AI หลายตัวแทน](../../examples/retail-scenario.md)

## บทนำ

คู่มือที่ครอบคลุมนี้ครอบคลุมทุกอย่างที่คุณต้องรู้เกี่ยวกับการปรับใช้แอปพลิเคชันโดยใช้ Azure Developer CLI ตั้งแต่การปรับใช้แบบคำสั่งเดียวพื้นฐานไปจนถึงสถานการณ์ใช้งานจริงขั้นสูงที่มี hooks แบบกำหนดเอง สภาพแวดล้อมหลายแห่ง และการผสานรวม CI/CD เชี่ยวชาญวงจรชีวิตการปรับใช้ทั้งหมดด้วยตัวอย่างที่ใช้งานได้จริงและแนวทางปฏิบัติที่ดีที่สุด

## เป้าหมายการเรียนรู้

โดยการทำบทเรียนนี้ให้สำเร็จ คุณจะสามารถ:
- เชี่ยวชาญคำสั่งและเวิร์กโฟลว์การปรับใช้ของ Azure Developer CLI ทั้งหมด
- เข้าใจวงจรชีวิตการปรับใช้ทั้งหมดตั้งแต่การจัดสรรทรัพยากรจนถึงการตรวจสอบ
- ใช้งาน hooks การปรับใช้ที่กำหนดเองสำหรับระบบอัตโนมัติก่อนและหลังการปรับใช้
- กำหนดค่าสภาพแวดล้อมหลายแห่งด้วยพารามิเตอร์เฉพาะของแต่ละสภาพแวดล้อม
- ตั้งค่ายุทธศาสตร์การปรับใช้ขั้นสูงรวมถึง blue-green และ canary deployments
- ผสานรวมการปรับใช้ azd กับ pipeline CI/CD และเวิร์กโฟลว์ DevOps

## ผลลัพธ์การเรียนรู้

เมื่อสำเร็จแล้ว คุณจะสามารถ:
- รันและแก้ไขปัญหาเวิร์กโฟลว์การปรับใช้ azd ทั้งหมดได้อย่างอิสระ
- ออกแบบและใช้ออโตเมชันการปรับใช้ที่กำหนดเองโดยใช้ hooks
- กำหนดค่าการปรับใช้ที่พร้อมใช้งานจริงด้วยความปลอดภัยและการตรวจสอบที่เหมาะสม
- จัดการสถานการณ์การปรับใช้แบบหลายสภาพแวดล้อมที่ซับซ้อน
- ปรับปรุงประสิทธิภาพการปรับใช้และใช้นโยบายย้อนกลับ
- ผสานรวมการปรับใช้ azd เข้ากับแนวปฏิบัติ DevOps ในองค์กร

## ภาพรวมการปรับใช้

Azure Developer CLI มีคำสั่งปรับใช้หลายคำสั่ง:
- `azd up` - เวิร์กโฟลว์ครบถ้วน (สร้าง + ปรับใช้)
- `azd provision` - สร้าง/อัปเดตทรัพยากร Azure เท่านั้น
- `azd deploy` - ปรับใช้โค้ดแอปพลิเคชันเท่านั้น
- `azd package` - สร้างและจัดแพ็กแอปพลิเคชัน

## เวิร์กโฟลว์การปรับใช้พื้นฐาน

### การปรับใช้ครบถ้วน (azd up)
เวิร์กโฟลว์ที่ใช้บ่อยที่สุดสำหรับโปรเจกต์ใหม่:
```bash
# ติดตั้งทุกอย่างตั้งแต่เริ่มต้น
azd up

# ติดตั้งพร้อมสภาพแวดล้อมเฉพาะ
azd up --environment production

# ติดตั้งด้วยพารามิเตอร์ที่กำหนดเอง
azd up --parameter location=westus2 --parameter sku=P1v2
```

### การปรับใช้เฉพาะโครงสร้างพื้นฐาน
เมื่อคุณต้องการแค่ปรับปรุงทรัพยากร Azure:
```bash
# จัดเตรียม/อัปเดตโครงสร้างพื้นฐาน
azd provision

# จัดเตรียมด้วย dry-run เพื่อดูตัวอย่างการเปลี่ยนแปลง
azd provision --preview

# จัดเตรียมบริการเฉพาะ
azd provision --service database
```

### การปรับใช้เฉพาะโค้ด
สำหรับการอัปเดตแอปพลิเคชันอย่างรวดเร็ว:
```bash
# ติดตั้งบริการทั้งหมด
azd deploy

# ผลลัพธ์ที่คาดหวัง:
# กำลังติดตั้งบริการ (azd deploy)
# - เว็บ: กำลังติดตั้ง... เสร็จแล้ว
# - api: กำลังติดตั้ง... เสร็จแล้ว
# สำเร็จ: การติดตั้งของคุณเสร็จสมบูรณ์ใน 2 นาที 15 วินาที

# ติดตั้งบริการเฉพาะ
azd deploy --service web
azd deploy --service api

# ติดตั้งด้วยอาร์กิวเมนต์การสร้างแบบกำหนดเอง
azd deploy --service api --build-arg NODE_ENV=production

# ตรวจสอบการติดตั้ง
azd show --output json | jq '.services'
```

### ✅ การตรวจสอบความสำเร็จในการปรับใช้

หลังจากการปรับใช้ใด ๆ ให้ตรวจสอบความสำเร็จ:

```bash
# ตรวจสอบว่าบริการทั้งหมดกำลังทำงาน
azd show

# ทดสอบจุดเชื่อมต่อสุขภาพ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# เฝ้าระวังข้อผิดพลาด (เปิดในเบราว์เซอร์โดยค่าเริ่มต้น)
azd monitor --logs
```

**เกณฑ์ความสำเร็จ:**
- ✅ บริการทั้งหมดแสดงสถานะ "Running"
- ✅ จุดตรวจสุขภาพส่งคืน HTTP 200
- ✅ ไม่มีบันทึกข้อผิดพลาดใน 5 นาทีที่ผ่านมา
- ✅ แอปพลิเคชันตอบสนองต่อคำขอทดสอบ

## 🏗️ การเข้าใจกระบวนการปรับใช้

### ขั้นตอนที่ 1: Pre-Provision Hooks
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

### ขั้นตอนที่ 2: การจัดสรรโครงสร้างพื้นฐาน
- อ่านแม่แบบโครงสร้างพื้นฐาน (Bicep/Terraform)
- สร้างหรืออัปเดตทรัพยากร Azure
- กำหนดค่าการเชื่อมต่อเครือข่ายและความปลอดภัย
- ตั้งค่าการตรวจสอบและบันทึกข้อมูล

### ขั้นตอนที่ 3: Post-Provision Hooks
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

### ขั้นตอนที่ 4: การจัดแพ็กแอปพลิเคชัน
- สร้างโค้ดแอปพลิเคชัน
- สร้างอาร์ติแฟกต์สำหรับการปรับใช้
- จัดแพ็กสำหรับแพลตฟอร์มเป้าหมาย (คอนเทนเนอร์, ไฟล์ ZIP ฯลฯ)

### ขั้นตอนที่ 5: Pre-Deploy Hooks
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

### ขั้นตอนที่ 6: การปรับใช้แอปพลิเคชัน
- ปรับใช้แอปพลิเคชันที่จัดแพ็กไปยังบริการ Azure
- อัปเดตการตั้งค่าการกำหนดค่า
- เริ่มหรือรีสตาร์ทบริการ

### ขั้นตอนที่ 7: Post-Deploy Hooks
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

# สภาพแวดล้อมสำหรับการทดสอบ
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

### การปรับใช้แบบ Blue-Green
```bash
# สร้างสภาพแวดล้อมสีน้ำเงิน
azd env new production-blue
azd up --environment production-blue

# ทดสอบสภาพแวดล้อมสีน้ำเงิน
./scripts/test-environment.sh production-blue

# สลับทราฟฟิกไปยังสีน้ำเงิน (อัปเดต DNS/load balancer ด้วยตนเอง)
./scripts/switch-traffic.sh production-blue

# ทำความสะอาดสภาพแวดล้อมสีเขียว
azd env select production-green
azd down --force
```

### การปรับใช้แบบ Canary
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

### การปรับใช้แบบ Staged
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

### การปรับใช้แอปคอนเทนเนอร์
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

### การปรับแต่ง Dockerfile หลายขั้นตอน
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

## ⚡ การเพิ่มประสิทธิภาพ

### การปรับใช้เฉพาะบริการ
```bash
# เปิดใช้งานบริการเฉพาะเพื่อการวนซ้ำที่รวดเร็วขึ้น
azd deploy --service web
azd deploy --service api

# เปิดใช้งานทุกบริการ
azd deploy
```

### การแคชการสร้าง (Build Caching)
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
# วิธีนี้ข้ามขั้นตอนการจัดเตรียมโครงสร้างพื้นฐานและเร็วกว่าอย่างมาก
azd deploy

# นำไปใช้กับบริการเฉพาะเพื่อการทำซ้ำที่รวดเร็วที่สุด
azd deploy --service api
```

## 🔍 การตรวจสอบการปรับใช้

### การตรวจสอบการปรับใช้แบบเรียลไทม์
```bash
# ตรวจสอบแอปพลิเคชันแบบเรียลไทม์
azd monitor --live

# ดูบันทึกแอปพลิเคชัน
azd monitor --logs

# ตรวจสอบสถานะการปรับใช้
azd show
```

### การตรวจสอบสุขภาพ
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

## 🔐 การพิจารณาความปลอดภัย

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

## 🚨 ยุทธศาสตร์การย้อนกลับ (Rollback)

### การย้อนกลับอย่างรวดเร็ว
```bash
# AZD ไม่มีฟีเจอร์ rollback ในตัว วิธีที่แนะนำ:

# ตัวเลือกที่ 1: ทำการ redeploy จาก Git (แนะนำ)
git revert HEAD  # ย้อนกลับ commit ที่มีปัญหา
git push
azd deploy

# ตัวเลือกที่ 2: ทำการ redeploy commit เฉพาะเจาะจง
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### การย้อนกลับโครงสร้างพื้นฐาน
```bash
# ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนที่จะนำไปใช้
azd provision --preview

# สำหรับการย้อนกลับโครงสร้างพื้นฐาน ให้ใช้ระบบควบคุมเวอร์ชัน:
git revert HEAD  # ย้อนกลับการเปลี่ยนแปลงโครงสร้างพื้นฐาน
azd provision    # ใช้สถานะโครงสร้างพื้นฐานก่อนหน้า
```

### การย้อนกลับการโยกย้ายฐานข้อมูล
```bash
#!/bin/bash
# สคริปต์/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 เมตริกการปรับใช้

### ติดตามประสิทธิภาพการปรับใช้
```bash
# ดูสถานะการปรับใช้ปัจจุบัน
azd show

# ตรวจสอบแอปพลิเคชันด้วย Application Insights
azd monitor --overview

# ดูเมตริกสด
azd monitor --live
```

### การเก็บเมตริกแบบกำหนดเอง
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
# ใช้การตั้งชื่อแบบสอดคล้องกัน
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# รักษาความเหมือนกันของสภาพแวดล้อม
./scripts/sync-environments.sh
```

### 2. การตรวจสอบความถูกต้องของโครงสร้างพื้นฐาน
```bash
# ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนการปรับใช้
azd provision --preview

# ใช้การตรวจสอบโค้ด ARM/Bicep
az bicep lint --file infra/main.bicep

# ตรวจสอบไวยากรณ์ Bicep
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

### 4. การจัดทำเอกสารและบันทึก
```bash
# บันทึกขั้นตอนการปรับใช้
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ก้าวต่อไป

- [การจัดสรรทรัพยากร](provisioning.md) - เจาะลึกการจัดการโครงสร้างพื้นฐาน
- [การวางแผนก่อนการปรับใช้](../chapter-06-pre-deployment/capacity-planning.md) - วางแผนยุทธศาสตร์การปรับใช้ของคุณ
- [ปัญหาที่พบบ่อย](../chapter-07-troubleshooting/common-issues.md) - แก้ไขปัญหาการปรับใช้
- [แนวทางปฏิบัติที่ดีที่สุด](../chapter-07-troubleshooting/debugging.md) - ยุทธศาสตร์การปรับใช้ที่พร้อมใช้งานจริง

## 🎯 แบบฝึกหัดการปรับใช้เชิงปฏิบัติ

### แบบฝึกหัด 1: เวิร์กโฟลว์การปรับใช้แบบเพิ่มทีละน้อย (20 นาที)
**เป้าหมาย**: เชี่ยวชาญความแตกต่างระหว่างการปรับใช้เต็มและแบบเพิ่มทีละน้อย

```bash
# การปรับใช้ครั้งแรก
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# บันทึกเวลาการปรับใช้ครั้งแรก
echo "Full deployment: $(date)" > deployment-log.txt

# แก้ไขโค้ด
echo "// Updated $(date)" >> src/api/src/server.js

# ปรับใช้เฉพาะโค้ด (เร็ว)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# เปรียบเทียบเวลา
cat deployment-log.txt

# ทำความสะอาด
azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] การปรับใช้เต็มใช้เวลาระหว่าง 5-15 นาที
- [ ] การปรับใช้เฉพาะโค้ดใช้เวลาระหว่าง 2-5 นาที
- [ ] การเปลี่ยนแปลงโค้ดสะท้อนในแอปที่ปรับใช้แล้ว
- [ ] โครงสร้างพื้นฐานไม่เปลี่ยนแปลงหลัง `azd deploy`

**ผลลัพธ์การเรียนรู้**: `azd deploy` เร็วกว่า `azd up` 50-70% สำหรับการเปลี่ยนแปลงโค้ด

### แบบฝึกหัด 2: Hooks การปรับใช้แบบกำหนดเอง (30 นาที)
**เป้าหมาย**: นำระบบอัตโนมัติ pre และ post deployment มาใช้

```bash
# สร้างสคริปต์ตรวจสอบก่อนการปรับใช้
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ตรวจสอบว่าการทดสอบผ่านหรือไม่
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ตรวจสอบการเปลี่ยนแปลงที่ยังไม่ถูกคอมมิต
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# สร้างสคริปต์ทดสอบเบื้องต้นหลังการปรับใช้
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

# เพิ่มฮุกไปยังไฟล์ azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ทดสอบการปรับใช้ด้วยฮุก
azd deploy
```

**เกณฑ์ความสำเร็จ:**
- [ ] สคริปต์ pre-deploy ทำงานก่อนการปรับใช้
- [ ] การปรับใช้ยกเลิกถ้าทดสอบล้มเหลว
- [ ] การทดสอบ smoke test post-deploy ตรวจสอบสุขภาพ
- [ ] Hooks ทำงานตามลำดับที่ถูกต้อง

### แบบฝึกหัด 3: ยุทธศาสตร์การปรับใช้หลายสภาพแวดล้อม (45 นาที)
**เป้าหมาย**: นำเวิร์กโฟลว์การปรับใช้แบบผ่านขั้นตอนมาปฏิบัติ (dev → staging → production)

```bash
# สร้างสคริปต์การปรับใช้
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ขั้นตอนที่ 1: ปรับใช้ไปยัง dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ขั้นตอนที่ 2: ปรับใช้ไปยัง staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ขั้นตอนที่ 3: อนุมัติด้วยตนเองสำหรับการผลิต
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

# รันการปรับใช้แบบมีขั้นตอน
./deploy-staged.sh
```

**เกณฑ์ความสำเร็จ:**
- [ ] ปรับใช้ในสภาพแวดล้อม dev สำเร็จ
- [ ] ปรับใช้ในสภาพแวดล้อม staging สำเร็จ
- [ ] ต้องการการอนุมัติด้วยมือสำหรับ production
- [ ] ทุกสภาพแวดล้อมมีการตรวจสอบสุขภาพที่ใช้งานได้
- [ ] สามารถย้อนกลับได้หากจำเป็น

### แบบฝึกหัด 4: ยุทธศาสตร์การย้อนกลับ (25 นาที)
**เป้าหมาย**: นำยุทธศาสตร์ย้อนกลับและทดสอบโดยใช้ Git

```bash
# เปิดใช้งาน v1
azd env set APP_VERSION "1.0.0"
azd up

# บันทึกแฮชคอมมิต v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# เปิดใช้งาน v2 พร้อมการเปลี่ยนแปลงที่ทำให้เกิดปัญหา
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
    
    # เปิดใช้งาน v1 ซ้ำ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**เกณฑ์ความสำเร็จ:**
- [ ] สามารถตรวจจับความล้มเหลวในการปรับใช้ได้
- [ ] สคริปต์ rollback ทำงานโดยอัตโนมัติ
- [ ] แอปพลิเคชันกลับไปในสถานะใช้งานได้
- [ ] การตรวจสอบสุขภาพผ่านหลังย้อนกลับ

## 📊 การติดตามเมตริกการปรับใช้

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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# บันทึกลงไฟล์
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ใช้มัน
./track-deployment.sh
```

**วิเคราะห์เมตริกของคุณ:**
```bash
# ดูประวัติการปรับใช้
cat deployment-metrics.csv

# คำนวณเวลาการปรับใช้เฉลี่ย
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
- **บทเรียนถัดไป**: [การจัดสรรทรัพยากร](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้ความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลสำคัญแนะนำให้ใช้บริการแปลโดยมนุษย์มืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->