<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-09T21:38:10+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "th"
}
-->
# คู่มือการปรับใช้ - การปรับใช้ AZD อย่างเชี่ยวชาญ

## บทนำ

คู่มือฉบับสมบูรณ์นี้ครอบคลุมทุกสิ่งที่คุณจำเป็นต้องรู้เกี่ยวกับการปรับใช้แอปพลิเคชันด้วย Azure Developer CLI ตั้งแต่การปรับใช้ด้วยคำสั่งเดียวไปจนถึงสถานการณ์การผลิตขั้นสูงที่มีการตั้งค่าแบบกำหนดเอง สภาพแวดล้อมหลายแบบ และการผสานรวม CI/CD เรียนรู้วงจรการปรับใช้อย่างครบถ้วนด้วยตัวอย่างที่ใช้งานได้จริงและแนวทางปฏิบัติที่ดีที่สุด

## เป้าหมายการเรียนรู้

เมื่อจบคู่มือนี้ คุณจะ:
- เชี่ยวชาญคำสั่งและเวิร์กโฟลว์การปรับใช้ของ Azure Developer CLI ทั้งหมด
- เข้าใจวงจรการปรับใช้อย่างครบถ้วนตั้งแต่การจัดเตรียมไปจนถึงการตรวจสอบ
- ใช้การตั้งค่าการปรับใช้แบบกำหนดเองสำหรับการทำงานอัตโนมัติก่อนและหลังการปรับใช้
- กำหนดค่าหลายสภาพแวดล้อมด้วยพารามิเตอร์เฉพาะของแต่ละสภาพแวดล้อม
- ตั้งค่ากลยุทธ์การปรับใช้ขั้นสูง เช่น การปรับใช้แบบ Blue-Green และ Canary
- ผสานรวมการปรับใช้ azd กับ CI/CD และเวิร์กโฟลว์ DevOps

## ผลลัพธ์การเรียนรู้

เมื่อจบคู่มือนี้ คุณจะสามารถ:
- ดำเนินการและแก้ไขปัญหาเวิร์กโฟลว์การปรับใช้ azd ได้อย่างอิสระ
- ออกแบบและใช้การตั้งค่าการปรับใช้อัตโนมัติแบบกำหนดเองด้วย Hooks
- กำหนดค่าการปรับใช้ที่พร้อมสำหรับการผลิตด้วยความปลอดภัยและการตรวจสอบที่เหมาะสม
- จัดการสถานการณ์การปรับใช้ที่ซับซ้อนในหลายสภาพแวดล้อม
- ปรับปรุงประสิทธิภาพการปรับใช้และใช้กลยุทธ์การย้อนกลับ
- ผสานรวมการปรับใช้ azd เข้ากับแนวทางปฏิบัติ DevOps ในองค์กร

## ภาพรวมการปรับใช้

Azure Developer CLI มีคำสั่งการปรับใช้หลายแบบ:
- `azd up` - เวิร์กโฟลว์ครบวงจร (จัดเตรียม + ปรับใช้)
- `azd provision` - สร้าง/อัปเดตทรัพยากร Azure เท่านั้น
- `azd deploy` - ปรับใช้โค้ดแอปพลิเคชันเท่านั้น
- `azd package` - สร้างและแพ็กเกจแอปพลิเคชัน

## เวิร์กโฟลว์การปรับใช้พื้นฐาน

### การปรับใช้อย่างสมบูรณ์ (azd up)
เวิร์กโฟลว์ที่ใช้บ่อยที่สุดสำหรับโปรเจกต์ใหม่:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### การปรับใช้เฉพาะโครงสร้างพื้นฐาน
เมื่อคุณต้องการอัปเดตทรัพยากร Azure เท่านั้น:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### การปรับใช้เฉพาะโค้ด
สำหรับการอัปเดตแอปพลิเคชันอย่างรวดเร็ว:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ การทำความเข้าใจกระบวนการปรับใช้

### เฟส 1: Pre-Provision Hooks
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

### เฟส 3: Post-Provision Hooks
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

### เฟส 4: การแพ็กเกจแอปพลิเคชัน
- สร้างโค้ดแอปพลิเคชัน
- สร้างอาร์ติแฟกต์การปรับใช้
- แพ็กเกจสำหรับแพลตฟอร์มเป้าหมาย (คอนเทนเนอร์, ไฟล์ ZIP ฯลฯ)

### เฟส 5: Pre-Deploy Hooks
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
- ปรับใช้แอปพลิเคชันที่แพ็กเกจแล้วไปยังบริการ Azure
- อัปเดตการตั้งค่าคอนฟิก
- เริ่ม/รีสตาร์ทบริการ

### เฟส 7: Post-Deploy Hooks
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

### การกำหนดค่าที่เฉพาะเจาะจงสำหรับแต่ละสภาพแวดล้อม
```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
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

### การปรับใช้แบบขั้นตอน
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

## ⚡ การปรับปรุงประสิทธิภาพ

### การปรับใช้แบบขนาน
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### การแคชการสร้าง
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### การปรับใช้แบบเพิ่มทีละส่วน
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 การตรวจสอบการปรับใช้

### การตรวจสอบการปรับใช้แบบเรียลไทม์
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
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

# Check application health
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

## 🔐 การพิจารณาด้านความปลอดภัย

### การจัดการความลับ
```bash
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
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

### ความปลอดภัยของเครือข่าย
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
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### การย้อนกลับโครงสร้างพื้นฐาน
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
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

## 📊 เมตริกการปรับใช้

### การติดตามประสิทธิภาพการปรับใช้
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### การรวบรวมเมตริกแบบกำหนดเอง
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

### 1. ความสม่ำเสมอของสภาพแวดล้อม
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
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
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

### 4. การจัดทำเอกสารและการบันทึก
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ขั้นตอนถัดไป

- [การจัดเตรียมทรัพยากร](provisioning.md) - เจาะลึกการจัดการโครงสร้างพื้นฐาน
- [การวางแผนก่อนการปรับใช้](../pre-deployment/capacity-planning.md) - วางแผนกลยุทธ์การปรับใช้ของคุณ
- [ปัญหาทั่วไป](../troubleshooting/common-issues.md) - แก้ไขปัญหาการปรับใช้
- [แนวทางปฏิบัติที่ดีที่สุด](../troubleshooting/debugging.md) - กลยุทธ์การปรับใช้ที่พร้อมสำหรับการผลิต

## แหล่งข้อมูลเพิ่มเติม

- [เอกสารอ้างอิงการปรับใช้ Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [การปรับใช้ Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [การปรับใช้ Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [การปรับใช้ Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [โปรเจกต์แรกของคุณ](../getting-started/first-project.md)
- **บทเรียนถัดไป**: [การจัดเตรียมทรัพยากร](provisioning.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้องมากที่สุด แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้