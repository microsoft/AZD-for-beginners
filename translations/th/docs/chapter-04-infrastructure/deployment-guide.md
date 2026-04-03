# Deployment Guide - การทำความเชี่ยวชาญในการปรับใช้ AZD

**การนำทางบทเรียน:**
- **📚 หน้าแรกหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทเรียนปัจจุบัน**: บทที่ 4 - โครงสร้างพื้นฐานเป็นโค้ด & การปรับใช้
- **⬅️ บทก่อนหน้า**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)
- **➡️ ถัดไป**: [การจัดเตรียมทรัพยากร](provisioning.md)
- **🚀 บทถัดไป**: [บทที่ 5: โซลูชัน AI หลายตัวแทน](../../examples/retail-scenario.md)

## บทนำ

คู่มือครอบคลุมนี้กล่าวถึงทุกสิ่งที่คุณต้องรู้เกี่ยวกับการปรับใช้แอปพลิเคชันโดยใช้ Azure Developer CLI ตั้งแต่การปรับใช้ด้วยคำสั่งเดียวแบบพื้นฐานไปจนถึงสถานการณ์การผลิตขั้นสูงด้วยการติดตั้งฮุคส์แบบกำหนดเอง หลายสภาพแวดล้อม และการผสานรวม CI/CD จัดการวงจรชีวิตการปรับใช้ทั้งหมดด้วยตัวอย่างที่ใช้งานได้จริงและแนวทางปฏิบัติที่ดีที่สุด

## เป้าหมายการเรียนรู้

เมื่อสำเร็จคู่มือนี้ คุณจะ:
- เชี่ยวชาญคำสั่งและเวิร์กโฟลว์การปรับใช้ทั้งหมดของ Azure Developer CLI
- เข้าใจวงจรชีวิตการปรับใช้ทั้งหมดตั้งแต่การจัดเตรียมจนถึงการตรวจสอบ
- นำฮุคส์การปรับใช้ที่กำหนดเองไปใช้สำหรับการทำงานอัตโนมัติก่อนและหลังการปรับใช้
- กำหนดค่าหลายสภาพแวดล้อมด้วยพารามิเตอร์เฉพาะสภาพแวดล้อม
- ตั้งค่ากลยุทธ์การปรับใช้ขั้นสูงรวมถึงการปรับใช้แบบ blue-green และ canary
- ผสานรวมการปรับใช้ azd กับ CI/CD pipeline และเวิร์กโฟลว์ DevOps

## ผลลัพธ์การเรียนรู้

หลังจากเสร็จสิ้น คุณจะสามารถ:
- รันและแก้ไขปัญหาเวิร์กโฟลว์การปรับใช้งาน azd ทั้งหมดได้อย่างอิสระ
- ออกแบบและนำระบบอัตโนมัติการปรับใช้ด้วยฮุคส์แบบกำหนดเองไปใช้
- กำหนดค่าการปรับใช้สำหรับสภาพแวดล้อมการผลิตด้วยความปลอดภัยและการตรวจสอบที่เหมาะสม
- จัดการสถานการณ์การปรับใช้หลายสภาพแวดล้อมที่ซับซ้อน
- ปรับประสิทธิภาพการปรับใช้และนำกลยุทธ์การย้อนกลับมาใช้
- ผสานรวมการปรับใช้ azd เข้ากับแนวทางปฏิบัติ DevOps ขององค์กร

## ภาพรวมการปรับใช้

Azure Developer CLI มีคำสั่งปรับใช้หลายคำสั่ง:
- `azd up` - เวิร์กโฟลว์สมบูรณ์ (จัดเตรียม + ปรับใช้)
- `azd provision` - สร้าง/อัปเดตทรัพยากร Azure เท่านั้น
- `azd deploy` - ปรับใช้โค้ดแอปพลิเคชันเท่านั้น
- `azd package` - สร้างและแพ็กเกจแอปพลิเคชัน

## เวิร์กโฟลว์การปรับใช้พื้นฐาน

### การปรับใช้สมบูรณ์ (azd up)
เวิร์กโฟลว์ที่ใช้บ่อยที่สุดสำหรับโครงการใหม่:
```bash
# ติดตั้งทุกอย่างจากศูนย์
azd up

# ติดตั้งโดยใช้สภาพแวดล้อมเฉพาะ
azd up --environment production

# ติดตั้งด้วยพารามิเตอร์ที่กำหนดเอง
azd up --parameter location=westus2 --parameter sku=P1v2
```

### การปรับใช้เฉพาะโครงสร้างพื้นฐาน
เมื่อคุณต้องการอัปเดตทรัพยากร Azure เท่านั้น:
```bash
# จัดเตรียม/อัปเดตโครงสร้างพื้นฐาน
azd provision

# จัดเตรียมด้วย dry-run เพื่อดูตัวอย่างการเปลี่ยนแปลง
azd provision --preview

# จัดเตรียมบริการเฉพาะเจาะจง
azd provision --service database
```

### การปรับใช้เฉพาะโค้ด
สำหรับการอัปเดตแอปพลิเคชันอย่างรวดเร็ว:
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

# ปรับใช้ด้วยอาร์กิวเมนต์การสร้างแบบกำหนดเอง
azd deploy --service api --build-arg NODE_ENV=production

# ตรวจสอบการปรับใช้
azd show --output json | jq '.services'
```

### ✅ การตรวจสอบการปรับใช้

หลังจากการปรับใช้ใดๆ ให้ตรวจสอบความสำเร็จ:

```bash
# ตรวจสอบว่าบริการทั้งหมดกำลังทำงานอยู่
azd show

# ทดสอบจุดเชื่อมต่อสุขภาพ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ตรวจสอบความผิดพลาด (เปิดในเบราว์เซอร์โดยค่าเริ่มต้น)
azd monitor --logs
```

**เกณฑ์ความสำเร็จ:**
- ✅ บริการทั้งหมดแสดงสถานะ "Running"
- ✅ จุดตรวจสุขภาพส่งคืน HTTP 200
- ✅ ไม่มีบันทึกข้อผิดพลาดใน 5 นาทีที่ผ่านมา
- ✅ แอปพลิเคชันตอบสนองคำขอทดสอบ

## 🏗️ ความเข้าใจกระบวนการปรับใช้

### ระยะที่ 1: ฮุคส์ก่อนจัดเตรียม
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

### ระยะที่ 2: การจัดเตรียมโครงสร้างพื้นฐาน
- อ่านแม่แบบโครงสร้างพื้นฐาน (Bicep/Terraform)
- สร้างหรืออัปเดตทรัพยากร Azure
- กำหนดค่าเครือข่ายและความปลอดภัย
- ตั้งค่าการตรวจสอบและบันทึกข้อมูล

### ระยะที่ 3: ฮุคส์หลังจัดเตรียม
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

### ระยะที่ 4: การแพ็กเกจแอปพลิเคชัน
- สร้างโค้ดแอปพลิเคชัน
- สร้าง artifacts สำหรับการปรับใช้
- แพ็กเกจสำหรับแพลตฟอร์มเป้าหมาย (คอนเทนเนอร์, ไฟล์ ZIP ฯลฯ)

### ระยะที่ 5: ฮุคส์ก่อนปรับใช้
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

### ระยะที่ 6: การปรับใช้แอปพลิเคชัน
- ปรับใช้แอปพลิเคชันที่แพ็กเกจไปยังบริการ Azure
- อัปเดตการตั้งค่าการกำหนดค่า
- เริ่ม/รีสตาร์ทบริการ

### ระยะที่ 7: ฮุคส์หลังปรับใช้
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

# สภาพแวดล้อมการทดสอบ
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

# สลับการรับส่งข้อมูลไปยังสีน้ำเงิน (อัปเดต DNS/load balancer ด้วยตนเอง)
./scripts/switch-traffic.sh production-blue

# ล้างสภาพแวดล้อมสีเขียว
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

### การปรับใช้แบบหลายขั้นตอน
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

### การเพิ่มประสิทธิภาพ Dockerfile หลายขั้นตอน
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

## ⚡ การปรับปรุงประสิทธิภาพ

### การปรับใช้เฉพาะบริการ
```bash
# ติดตั้งบริการเฉพาะเพื่อการทำซ้ำที่รวดเร็วขึ้น
azd deploy --service web
azd deploy --service api

# ติดตั้งบริการทั้งหมด
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
# ใช้ azd deploy (ไม่ใช่ azd up) สำหรับการเปลี่ยนแปลงโค้ดเท่านั้น
# วิธีนี้จะข้ามการจัดเตรียมโครงสร้างพื้นฐานและรวดเร็วกว่าอย่างมาก
azd deploy

# ดีพลอยบริการเฉพาะสำหรับการทดลองทำซ้ำที่รวดเร็วที่สุด
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

## 🔐 ข้อพิจารณาด้านความปลอดภัย

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

# ตัวเลือก 1: ติดตั้งใหม่จาก Git (แนะนำ)
git revert HEAD  # ยกเลิกการคอมมิตที่มีปัญหา
git push
azd deploy

# ตัวเลือก 2: ติดตั้งใหม่เฉพาะคอมมิตที่ต้องการ
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### การย้อนกลับโครงสร้างพื้นฐาน
```bash
# ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนใช้งาน
azd provision --preview

# สำหรับการย้อนกลับของโครงสร้างพื้นฐาน ให้ใช้การควบคุมเวอร์ชัน:
git revert HEAD  # ยกเลิกการเปลี่ยนแปลงโครงสร้างพื้นฐาน
azd provision    # ใช้งานสถานะโครงสร้างพื้นฐานก่อนหน้า
```

### การย้อนกลับการย้ายฐานข้อมูล
```bash
#!/bin/bash
# สคริปต์/ย้อนกลับฐานข้อมูล.sh

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

### การเก็บรวบรวมเมตริกแบบกำหนดเอง
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
# ใช้การตั้งชื่อที่สอดคล้อง
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

# ใช้การตรวจสอบความถูกต้องของ ARM/Bicep
az bicep lint --file infra/main.bicep

# ตรวจสอบไวยากรณ์ของ Bicep
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
- [การวางแผนก่อนปรับใช้](../chapter-06-pre-deployment/capacity-planning.md) - วางแผนกลยุทธ์การปรับใช้ของคุณ
- [ปัญหาพบบ่อย](../chapter-07-troubleshooting/common-issues.md) - แก้ไขปัญหาการปรับใช้
- [แนวปฏิบัติที่ดีที่สุด](../chapter-07-troubleshooting/debugging.md) - กลยุทธ์การปรับใช้สำหรับการผลิต

## 🎯 แบบฝึกหัดการปรับใช้แบบปฏิบัติ

### แบบฝึกหัดที่ 1: เวิร์กโฟลว์การปรับใช้อย่างเพิ่มทีละน้อย (20 นาที)
**เป้าหมาย**: เชี่ยวชาญความแตกต่างระหว่างการปรับใช้เต็มรูปแบบและแบบเพิ่มทีละน้อย

```bash
# การปรับใช้งานครั้งแรก
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# บันทึกเวลาการปรับใช้งานครั้งแรก
echo "Full deployment: $(date)" > deployment-log.txt

# ทำการเปลี่ยนแปลงโค้ด
echo "// Updated $(date)" >> src/api/src/server.js

# ปรับใช้โค้ดเท่านั้น (เร็ว)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# เปรียบเทียบเวลา
cat deployment-log.txt

# ทำความสะอาด
azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] การปรับใช้เต็มรูปแบบใช้เวลา 5-15 นาที
- [ ] การปรับใช้เฉพาะโค้ดใช้เวลา 2-5 นาที
- [ ] การเปลี่ยนแปลงโค้ดสะท้อนในแอปที่ปรับใช้
- [ ] โครงสร้างพื้นฐานไม่เปลี่ยนแปลงหลัง `azd deploy`

**ผลลัพธ์การเรียนรู้**: `azd deploy` เร็วกว่า `azd up` 50-70% สำหรับการเปลี่ยนแปลงโค้ด

### แบบฝึกหัดที่ 2: ฮุคส์การปรับใช้แบบกำหนดเอง (30 นาที)
**เป้าหมาย**: นำระบบอัตโนมัติก่อนและหลังการปรับใช้ไปใช้

```bash
# สร้างสคริปต์การตรวจสอบก่อนการปรับใช้
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ตรวจสอบว่าการทดสอบผ่านหรือไม่
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

# เพิ่ม hooks ในไฟล์ azure.yaml
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
- [ ] สคริปต์ก่อนปรับใช้ทำงานก่อนการปรับใช้
- [ ] การปรับใช้หยุดหากทดสอบล้มเหลว
- [ ] การทดสอบ smoke test หลังปรับใช้ยืนยันสุขภาพ
- [ ] ฮุคส์ทำงานตามลำดับที่ถูกต้อง

### แบบฝึกหัดที่ 3: กลยุทธ์การปรับใช้หลายสภาพแวดล้อม (45 นาที)
**เป้าหมาย**: นำเวิร์กโฟลว์การปรับใช้แบบหลายขั้นตอนไปใช้ (dev → staging → production)

```bash
# สร้างสคริปต์การนำไปใช้งาน
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ขั้นตอนที่ 1: นำไปใช้ในระบบพัฒนา
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ขั้นตอนที่ 2: นำไปใช้ในระบบสเตจ
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

# รันการนำไปใช้แบบแบ่งระยะ
./deploy-staged.sh
```

**เกณฑ์ความสำเร็จ:**
- [ ] สภาพแวดล้อม dev ปรับใช้สำเร็จ
- [ ] สภาพแวดล้อม staging ปรับใช้สำเร็จ
- [ ] ต้องมีการอนุมัติด้วยตนเองสำหรับ production
- [ ] ทุกสภาพแวดล้อมมีการตรวจสุขภาพที่ใช้งานได้
- [ ] สามารถย้อนกลับได้หากจำเป็น

### แบบฝึกหัดที่ 4: กลยุทธ์การย้อนกลับ (25 นาที)
**เป้าหมาย**: นำและทดสอบการย้อนกลับการปรับใช้โดยใช้ Git

```bash
# ปล่อยใช้งาน v1
azd env set APP_VERSION "1.0.0"
azd up

# บันทึกแฮชคอมมิต v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ปล่อยใช้งาน v2 ที่มีการเปลี่ยนแปลงที่แตกต่าง
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
    
    # ปล่อยใช้งาน v1 ใหม่
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**เกณฑ์ความสำเร็จ:**
- [ ] สามารถตรวจจับความล้มเหลวของการปรับใช้
- [ ] สคริปต์ย้อนกลับรันโดยอัตโนมัติ
- [ ] แอปพลิเคชันกลับสู่สถานะใช้งานได้
- [ ] การตรวจสุขภาพผ่านหลังการย้อนกลับ

## 📊 การติดตามเมตริกการปรับใช้

### ติดตามประสิทธิภาพการปรับใช้ของคุณ

```bash
# สร้างสคริปต์วัดผลการใช้งานการปรับใช้
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

**วิเคราะห์เมตริกของคุณ:**
```bash
# ดูประวัติการปรับใช้
cat deployment-metrics.csv

# คำนวณเวลาปรับใช้เฉลี่ย
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## แหล่งข้อมูลเพิ่มเติม

- [คู่มืออ้างอิงการปรับใช้ Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [การปรับใช้ Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [การปรับใช้ Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [การปรับใช้ Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [โปรเจกต์แรกของคุณ](../chapter-01-foundation/first-project.md)
- **บทเรียนถัดไป**: [การจัดเตรียมทรัพยากร](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษาด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามเพื่อความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดใด ๆ ที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->