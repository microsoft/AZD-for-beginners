# คู่มือนำไปใช้งาน - เชี่ยวชาญการปรับใช้งาน AZD

**การนำทางบทเรียน:**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 4 - โครงสร้างพื้นฐานเป็นโค้ด & การปรับใช้
- **⬅️ บทก่อนหน้า**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)
- **➡️ ถัดไป**: [Provisioning Resources](provisioning.md)
- **🚀 บทถัดไป**: [บทที่ 5: โซลูชัน AI แบบหลายเอเยนต์](../../examples/retail-scenario.md)

## บทนำ

เอกสารฉบับนี้## ทำความเข้าใจกระบวนการปรับใช้ครอบคลุมทุกสิ่งที่คุณจำเป็นต้องรู้เกี่ยวกับการปรับใช้แอปพลิเคชันโดยใช้ Azure Developer CLI, ตั้งแต่การปรับใช้แบบคำสั่งเดียวพื้นฐานไปจนถึงสถานการณ์การใช้งานจริงขั้นสูงด้วย hooks ที่กำหนดเอง, สภาพแวดล้อมหลายแบบ และการผนวกรวม CI/CD. เชี่ยวชาญวงจรชีวิตการปรับใช้อย่างครบถ้วนด้วยตัวอย่างเชิงปฏิบัติและแนวปฏิบัติที่ดีที่สุด.

## เป้าหมายการเรียนรู้

เมื่อทำคู่มือนี้จบ คุณจะ:
- เชี่ยวชาญคำสั่งและเวิร์กโฟลว์การปรับใช้ของ Azure Developer CLI ทั้งหมด
- เข้าใจวงจรชีวิตการปรับใช้อย่างครบถ้วนตั้งแต่การจัดเตรียมทรัพยากรจนถึงการติดตาม
- ใช้งาน hooks การปรับใช้ที่กำหนดเองสำหรับการทำงานอัตโนมัติก่อนและหลังการปรับใช้
- กำหนดค่าสภาพแวดล้อมหลายแบบพร้อมพารามิเตอร์เฉพาะของแต่ละสภาพแวดล้อม
- ตั้งค่านโยบายการปรับใช้ขั้นสูงรวมถึงการปรับใช้แบบ blue-green และ canary
- ผสานการปรับใช้ azd เข้ากับท่อ CI/CD และเวิร์กโฟลว์ DevOps

## ผลลัพธ์การเรียนรู้

เมื่อสำเร็จ คุณจะสามารถ:
- ดำเนินการและแก้ไขปัญหาเวิร์กโฟลว์การปรับใช้ azd ทั้งหมดได้ด้วยตัวเอง
- ออกแบบและใช้งานระบบอัตโนมัติการปรับใช้แบบกำหนดเองโดยใช้ hooks
- กำหนดค่าการปรับใช้ที่พร้อมสำหรับการใช้งานจริงพร้อมการรักษาความปลอดภัยและการติดตามที่เหมาะสม
- จัดการสถานการณ์การปรับใช้ที่ซับซ้อนหลายสภาพแวดล้อม
- ปรับปรุงประสิทธิภาพการปรับใช้และใช้นโยบายการย้อนกลับ
- ผสานการปรับใช้ azd เข้ากับแนวปฏิบัติ DevOps ระดับองค์กร

## ภาพรวมการปรับใช้

Azure Developer CLI มีคำสั่งการปรับใช้หลายคำสั่ง:
- `azd up` - เวิร์กโฟลว์ครบถ้วน (จัดเตรียม + ปรับใช้)
- `azd provision` - สร้าง/อัปเดตทรัพยากร Azure เท่านั้น
- `azd deploy` - ปรับใช้โค้ดแอปพลิเคชันเท่านั้น
- `azd package` - สร้างและบรรจุแอปพลิเคชัน

## เวิร์กโฟลว์การปรับใช้พื้นฐาน

### การปรับใช้ครบถ้วน (azd up)
เวิร์กโฟลว์ที่พบบ่อยที่สุดสำหรับโปรเจกต์ใหม่:
```bash
# ปรับใช้ทุกอย่างตั้งแต่เริ่มต้น
azd up

# ปรับใช้กับสภาพแวดล้อมเฉพาะ
azd up --environment production

# ปรับใช้ด้วยพารามิเตอร์ที่กำหนดเอง
azd up --parameter location=westus2 --parameter sku=P1v2
```

### การปรับใช้เฉพาะโครงสร้างพื้นฐาน
เมื่อคุณต้องการอัปเดตเฉพาะทรัพยากร Azure:
```bash
# จัดเตรียม/อัปเดตโครงสร้างพื้นฐาน
azd provision

# จัดเตรียมแบบจำลอง (dry-run) เพื่อดูตัวอย่างการเปลี่ยนแปลง
azd provision --preview

# จัดเตรียมบริการเฉพาะ
azd provision --service database
```

### การปรับใช้เฉพาะโค้ด
สำหรับการอัปเดตแอปพลิเคชันอย่างรวดเร็ว:
```bash
# ปรับใช้บริการทั้งหมด
azd deploy

# ผลลัพธ์ที่คาดหวัง:
# กำลังปรับใช้บริการ (azd deploy)
# - web: กำลังปรับใช้... เสร็จแล้ว
# - api: กำลังปรับใช้... เสร็จแล้ว
# สำเร็จ: การปรับใช้ของคุณเสร็จสมบูรณ์ใน 2 นาที 15 วินาที

# ปรับใช้บริการเฉพาะ
azd deploy --service web
azd deploy --service api

# ปรับใช้พร้อมอาร์กิวเมนต์การสร้างที่กำหนดเอง
azd deploy --service api --build-arg NODE_ENV=production

# ตรวจสอบการปรับใช้
azd show --output json | jq '.services'
```

### ✅ การตรวจสอบการปรับใช้

หลังการปรับใช้ทุกครั้ง ให้ตรวจสอบความสำเร็จ:

```bash
# ตรวจสอบว่าบริการทั้งหมดกำลังทำงานอยู่
azd show

# ทดสอบจุดเชื่อมต่อสำหรับตรวจสอบสถานะ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ตรวจสอบข้อผิดพลาด (เปิดในเบราว์เซอร์โดยค่าเริ่มต้น)
azd monitor --logs
```

**เกณฑ์ความสำเร็จ:**
- ✅ บริการทั้งหมดแสดงสถานะ "Running"
- ✅ จุดเช็คสุขภาพตอบกลับ HTTP 200
- ✅ ไม่มีบันทึกข้อผิดพลาดใน 5 นาทีล่าสุด
- ✅ แอปพลิเคชันตอบสนองต่อคำขอทดสอบ

## 🏗️ ทำความเข้าใจกระบวนการปรับใช้

### เฟสที่ 1: Hooks ก่อนการจัดเตรียม
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

### เฟสที่ 2: การจัดเตรียมโครงสร้างพื้นฐาน
- อ่านเทมเพลตโครงสร้างพื้นฐาน (Bicep/Terraform)
- สร้างหรืออัปเดตทรัพยากร Azure
- กำหนดค่าเครือข่ายและความปลอดภัย
- ตั้งค่าการตรวจสอบและการบันทึก

### เฟสที่ 3: Hooks หลังการจัดเตรียม
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

### เฟสที่ 4: การบรรจุแอปพลิเคชัน
- สร้างโค้ดแอปพลิเคชัน
- สร้าง artifacts สำหรับการปรับใช้
- บรรจุสำหรับแพลตฟอร์มเป้าหมาย (คอนเทนเนอร์, ไฟล์ ZIP เป็นต้น)

### เฟสที่ 5: Hooks ก่อนการปรับใช้
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

### เฟสที่ 6: การปรับใช้แอปพลิเคชัน
- ปรับใช้แอปพลิเคชันที่บรรจุแล้วไปยังบริการ Azure
- อัปเดตการตั้งค่าคอนฟิก
- เริ่ม/รีสตาร์ทบริการ

### เฟสที่ 7: Hooks หลังการปรับใช้
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

### การกำหนดค่าเฉพาะสภาพแวดล้อม
```bash
# สภาพแวดล้อมการพัฒนา
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# สภาพแวดล้อมสำหรับทดสอบก่อนปล่อย
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# สภาพแวดล้อมการใช้งานจริง
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
# สร้างสภาพแวดล้อมสีฟ้า
azd env new production-blue
azd up --environment production-blue

# ทดสอบสภาพแวดล้อมสีฟ้า
./scripts/test-environment.sh production-blue

# สลับทราฟฟิกไปยังสีฟ้า (อัปเดต DNS/โหลดบาลานเซอร์ด้วยตนเอง)
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

### การปรับใช้แบบเป็นขั้นตอน
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

### การปรับใช้แอปบนคอนเทนเนอร์
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

### การปรับแต่ง Dockerfile แบบหลายขั้นตอน
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

## ⚡ การปรับแต่งประสิทธิภาพ

### การปรับใช้เฉพาะบริการ
```bash
# ปรับใช้บริการเฉพาะเพื่อการพัฒนาและทดสอบที่รวดเร็วยิ่งขึ้น
azd deploy --service web
azd deploy --service api

# ปรับใช้บริการทั้งหมด
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
# วิธีนี้ข้ามการจัดเตรียมโครงสร้างพื้นฐาน และเร็วกว่ามาก
azd deploy

# ปรับใช้บริการเฉพาะเพื่อการทำซ้ำที่เร็วที่สุด
azd deploy --service api
```

## 🔍 การตรวจสอบการปรับใช้

### การตรวจสอบการปรับใช้แบบเรียลไทม์
```bash
# ตรวจสอบแอปพลิเคชันแบบเรียลไทม์
azd monitor --live

# ดูบันทึกของแอปพลิเคชัน
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

# ตรวจสอบสถานะการทำงานของแอปพลิเคชัน
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
# จัดเก็บความลับอย่างปลอดภัย
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# อ้างอิงความลับในไฟล์ azure.yaml
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

### การย้อนกลับอย่างรวดเร็ว
```bash
# AZD ไม่มีฟีเจอร์ rollback ในตัว แนะนำแนวทางดังต่อไปนี้:

# ตัวเลือก 1: ปรับใช้ใหม่จาก Git (แนะนำ)
git revert HEAD  # ย้อนการ commit ที่มีปัญหา
git push
azd deploy

# ตัวเลือก 2: ปรับใช้ commit เฉพาะ
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### การย้อนกลับโครงสร้างพื้นฐาน
```bash
# ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนนำไปใช้
azd provision --preview

# สำหรับการย้อนกลับโครงสร้างพื้นฐาน ให้ใช้การควบคุมเวอร์ชัน:
git revert HEAD  # ย้อนกลับการเปลี่ยนแปลงโครงสร้างพื้นฐาน
azd provision    # นำสถานะโครงสร้างพื้นฐานก่อนหน้านี้ไปใช้
```

### การย้อนกลับการโยกย้ายฐานข้อมูล
```bash
#!/bin/แบช
# สคริปต์/ย้อนกลับ-ฐานข้อมูล.sh

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

# ดูเมตริกแบบเรียลไทม์
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

## 🎯 แนวปฏิบัติที่ดีที่สุด

### 1. ความสอดคล้องของสภาพแวดล้อม
```bash
# ใช้การตั้งชื่อที่สอดคล้องกัน
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# รักษาความสอดคล้องของสภาพแวดล้อม
./scripts/sync-environments.sh
```

### 2. การตรวจสอบความถูกต้องของโครงสร้างพื้นฐาน
```bash
# ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนการปรับใช้
azd provision --preview

# ใช้การลินต์สำหรับ ARM/Bicep
az bicep lint --file infra/main.bicep

# ตรวจสอบไวยากรณ์ของ Bicep
az bicep build --file infra/main.bicep
```

### 3. การผสานการทดสอบ
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
# จัดทำเอกสารขั้นตอนการปรับใช้
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ขั้นตอนถัดไป

- [การจัดเตรียมทรัพยากร](provisioning.md) - เจาะลึกการจัดการโครงสร้างพื้นฐาน
- [การวางแผนก่อนการปรับใช้](../chapter-06-pre-deployment/capacity-planning.md) - วางแผนกลยุทธ์การปรับใช้ของคุณ
- [ปัญหาทั่วไป](../chapter-07-troubleshooting/common-issues.md) - แก้ไขปัญหาการปรับใช้
- [แนวปฏิบัติที่ดีที่สุด](../chapter-07-troubleshooting/debugging.md) - กลยุทธ์การปรับใช้ที่พร้อมใช้งานจริง

## 🎯 แบบฝึกหัดการปรับใช้เชิงปฏิบัติ

### แบบฝึกหัด 1: เวิร์กโฟลว์การปรับใช้อย่างค่อยเป็นค่อยไป (20 นาที)
**เป้าหมาย**: เชี่ยวชาญความแตกต่างระหว่างการปรับใช้แบบเต็มและแบบเพิ่มทีละส่วน

```bash
# การปรับใช้เริ่มต้น
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# บันทึกเวลาในการปรับใช้เริ่มต้น
echo "Full deployment: $(date)" > deployment-log.txt

# ทำการเปลี่ยนแปลงโค้ด
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
- [ ] การปรับใช้เต็มใช้เวลา 5-15 นาที
- [ ] การปรับใช้เฉพาะโค้ดใช้เวลา 2-5 นาที
- [ ] การเปลี่ยนแปลงโค้ดถูกสะท้อนในแอปที่ปรับใช้
- [ ] โครงสร้างพื้นฐานไม่เปลี่ยนแปลงหลังจาก `azd deploy`

**ผลการเรียนรู้**: `azd deploy` เร็วกว่า `azd up` 50-70% สำหรับการเปลี่ยนแปลงโค้ด

### แบบฝึกหัด 2: Hooks การปรับใช้แบบกำหนดเอง (30 นาที)
**เป้าหมาย**: นำระบบอัตโนมัติก่อนและหลังการปรับใช้ไปใช้งาน

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

# ตรวจสอบว่ามีการเปลี่ยนแปลงที่ยังไม่ได้ commit
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# สร้างการทดสอบเบื้องต้นหลังการปรับใช้
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

# เพิ่ม hooks ลงในไฟล์ azure.yaml
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
- [ ] สคริปต์ก่อนการปรับใช้รันก่อนการปรับใช้
- [ ] การปรับใช้ยกเลิกหากการทดสอบล้มเหลว
- [ ] การทดสอบ smoke หลังการปรับใช้ยืนยันสถานะสุขภาพ
- [ ] Hooks ทำงานตามลำดับที่ถูกต้อง

### แบบฝึกหัด 3: กลยุทธ์การปรับใช้หลายสภาพแวดล้อม (45 นาที)
**เป้าหมาย**: นำเวิร์กโฟลว์การปรับใช้แบบเป็นขั้นตอนไปใช้งาน (dev → staging → production)

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

# ขั้นตอนที่ 3: อนุมัติด้วยตนเองสำหรับ production
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

# เรียกใช้การปรับใช้แบบเป็นขั้นตอน
./deploy-staged.sh
```

**เกณฑ์ความสำเร็จ:**
- [ ] สภาพแวดล้อม Dev ปรับใช้สำเร็จ
- [ ] สภาพแวดล้อม Staging ปรับใช้สำเร็จ
- [ ] ต้องการการอนุมัติด้วยตนเองสำหรับ production
- [ ] ทุกสภาพแวดล้อมมีการตรวจสอบสุขภาพที่ทำงานได้
- [ ] สามารถย้อนกลับได้เมื่อจำเป็น

### แบบฝึกหัด 4: กลยุทธ์การย้อนกลับ (25 นาที)
**เป้าหมาย**: นำและทดสอบการย้อนกลับการปรับใช้โดยใช้ Git

```bash
# ปรับใช้ v1
azd env set APP_VERSION "1.0.0"
azd up

# บันทึกแฮชคอมมิตของ v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ปรับใช้ v2 พร้อมการเปลี่ยนแปลงที่ไม่เข้ากัน
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ตรวจพบความล้มเหลวและทำการย้อนกลับ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # ย้อนกลับโดยใช้ git
    git revert HEAD --no-edit
    
    # ย้อนกลับสภาพแวดล้อม
    azd env set APP_VERSION "1.0.0"
    
    # ปรับใช้ v1 ใหม่
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**เกณฑ์ความสำเร็จ:**
- [ ] สามารถตรวจจับความล้มเหลวของการปรับใช้
- [ ] สคริปต์ย้อนกลับทำงานโดยอัตโนมัติ
- [ ] แอปพลิเคชันกลับสู่สถานะที่ใช้งานได้
- [ ] การตรวจสอบสุขภาพผ่านหลังการย้อนกลับ

## 📊 การติดตามเมตริกการปรับใช้

### ติดตามประสิทธิภาพการปรับใช้ของคุณ

```bash
# สร้างสคริปต์สำหรับตัวชี้วัดการปรับใช้
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

# คำนวณเวลาเฉลี่ยในการปรับใช้
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## แหล่งข้อมูลเพิ่มเติม

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**การนำทาง**
- **บทก่อนหน้า**: [โปรเจกต์แรกของคุณ](../chapter-01-foundation/first-project.md)
- **บทถัดไป**: [การจัดเตรียมทรัพยากร](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ข้อจำกัดความรับผิด:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator). แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อนได้ เอกสารต้นฉบับในภาษาดั้งเดิมควรถูกยึดถือเป็นแหล่งข้อมูลที่มีอำนาจ สำหรับข้อมูลที่มีความสำคัญ ขอแนะนำให้ใช้การแปลโดยนักแปลมืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->