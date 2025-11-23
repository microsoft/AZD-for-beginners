<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-22T08:27:55+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "vi"
}
-->
# Hướng Dẫn Triển Khai - Làm Chủ Các Triển Khai AZD

**Mục Lục Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Dành Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 4 - Hạ Tầng dưới dạng Mã & Triển Khai
- **⬅️ Chương Trước**: [Chương 3: Cấu Hình](../getting-started/configuration.md)
- **➡️ Tiếp Theo**: [Cấp Phát Tài Nguyên](provisioning.md)
- **🚀 Chương Tiếp Theo**: [Chương 5: Giải Pháp AI Đa Tác Nhân](../../examples/retail-scenario.md)

## Giới Thiệu

Hướng dẫn toàn diện này bao gồm mọi thứ bạn cần biết về triển khai ứng dụng bằng Azure Developer CLI, từ các triển khai cơ bản chỉ với một lệnh đến các kịch bản sản xuất nâng cao với các hook tùy chỉnh, nhiều môi trường và tích hợp CI/CD. Làm chủ toàn bộ vòng đời triển khai với các ví dụ thực tế và các phương pháp tốt nhất.

## Mục Tiêu Học Tập

Sau khi hoàn thành hướng dẫn này, bạn sẽ:
- Làm chủ tất cả các lệnh và quy trình triển khai của Azure Developer CLI
- Hiểu toàn bộ vòng đời triển khai từ cấp phát đến giám sát
- Triển khai các hook tùy chỉnh cho tự động hóa trước và sau triển khai
- Cấu hình nhiều môi trường với các tham số riêng cho từng môi trường
- Thiết lập các chiến lược triển khai nâng cao bao gồm triển khai xanh-lam và canary
- Tích hợp triển khai azd với các pipeline CI/CD và quy trình DevOps

## Kết Quả Học Tập

Sau khi hoàn thành, bạn sẽ có thể:
- Thực hiện và khắc phục sự cố tất cả các quy trình triển khai azd một cách độc lập
- Thiết kế và triển khai tự động hóa triển khai tùy chỉnh bằng các hook
- Cấu hình các triển khai sẵn sàng cho sản xuất với bảo mật và giám sát phù hợp
- Quản lý các kịch bản triển khai phức tạp với nhiều môi trường
- Tối ưu hóa hiệu suất triển khai và triển khai chiến lược hoàn tác
- Tích hợp triển khai azd vào các thực hành DevOps doanh nghiệp

## Tổng Quan Về Triển Khai

Azure Developer CLI cung cấp một số lệnh triển khai:
- `azd up` - Quy trình hoàn chỉnh (cấp phát + triển khai)
- `azd provision` - Chỉ tạo/cập nhật tài nguyên Azure
- `azd deploy` - Chỉ triển khai mã ứng dụng
- `azd package` - Xây dựng và đóng gói ứng dụng

## Quy Trình Triển Khai Cơ Bản

### Triển Khai Hoàn Chỉnh (azd up)
Quy trình phổ biến nhất cho các dự án mới:
```bash
# Triển khai mọi thứ từ đầu
azd up

# Triển khai với môi trường cụ thể
azd up --environment production

# Triển khai với các tham số tùy chỉnh
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Chỉ Cấp Phát Hạ Tầng
Khi bạn chỉ cần cập nhật tài nguyên Azure:
```bash
# Cung cấp/cập nhật cơ sở hạ tầng
azd provision

# Cung cấp với chế độ thử nghiệm để xem trước các thay đổi
azd provision --preview

# Cung cấp các dịch vụ cụ thể
azd provision --service database
```

### Chỉ Triển Khai Mã
Dành cho các cập nhật ứng dụng nhanh:
```bash
# Triển khai tất cả các dịch vụ
azd deploy

# Kết quả mong đợi:
# Đang triển khai các dịch vụ (azd deploy)
# - web: Đang triển khai... Hoàn thành
# - api: Đang triển khai... Hoàn thành
# THÀNH CÔNG: Việc triển khai của bạn đã hoàn thành trong 2 phút 15 giây

# Triển khai dịch vụ cụ thể
azd deploy --service web
azd deploy --service api

# Triển khai với các tham số xây dựng tùy chỉnh
azd deploy --service api --build-arg NODE_ENV=production

# Xác minh triển khai
azd show --output json | jq '.services'
```

### ✅ Xác Minh Triển Khai

Sau bất kỳ triển khai nào, hãy xác minh thành công:

```bash
# Kiểm tra tất cả các dịch vụ đang chạy
azd show

# Kiểm tra các điểm cuối sức khỏe
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Kiểm tra nhật ký để tìm lỗi
azd logs --service api --since 5m | grep -i error
```

**Tiêu Chí Thành Công:**
- ✅ Tất cả các dịch vụ hiển thị trạng thái "Running"
- ✅ Các endpoint kiểm tra sức khỏe trả về HTTP 200
- ✅ Không có lỗi trong nhật ký trong 5 phút gần nhất
- ✅ Ứng dụng phản hồi các yêu cầu kiểm tra

## 🏗️ Hiểu Quy Trình Triển Khai

### Giai Đoạn 1: Hook Trước Cấp Phát
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

### Giai Đoạn 2: Cấp Phát Hạ Tầng
- Đọc các mẫu hạ tầng (Bicep/Terraform)
- Tạo hoặc cập nhật tài nguyên Azure
- Cấu hình mạng và bảo mật
- Thiết lập giám sát và ghi nhật ký

### Giai Đoạn 3: Hook Sau Cấp Phát
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

### Giai Đoạn 4: Đóng Gói Ứng Dụng
- Xây dựng mã ứng dụng
- Tạo các artifact triển khai
- Đóng gói cho nền tảng mục tiêu (container, tệp ZIP, v.v.)

### Giai Đoạn 5: Hook Trước Triển Khai
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

### Giai Đoạn 6: Triển Khai Ứng Dụng
- Triển khai các ứng dụng đã đóng gói lên các dịch vụ Azure
- Cập nhật các thiết lập cấu hình
- Khởi động/làm mới các dịch vụ

### Giai Đoạn 7: Hook Sau Triển Khai
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

## 🎛️ Cấu Hình Triển Khai

### Cài Đặt Triển Khai Cụ Thể Theo Dịch Vụ
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

### Cấu Hình Cụ Thể Theo Môi Trường
```bash
# Môi trường phát triển
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Môi trường dàn dựng
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Môi trường sản xuất
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Kịch Bản Triển Khai Nâng Cao

### Ứng Dụng Nhiều Dịch Vụ
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

### Triển Khai Xanh-Lam
```bash
# Tạo môi trường màu xanh dương
azd env new production-blue
azd up --environment production-blue

# Kiểm tra môi trường màu xanh dương
./scripts/test-environment.sh production-blue

# Chuyển lưu lượng truy cập sang màu xanh dương (cập nhật DNS/cân bằng tải thủ công)
./scripts/switch-traffic.sh production-blue

# Dọn dẹp môi trường màu xanh lá
azd env select production-green
azd down --force
```

### Triển Khai Canary
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

### Triển Khai Theo Giai Đoạn
```bash
#!/bin/bash
# triển khai-staged.sh

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

## 🐳 Triển Khai Container

### Triển Khai Ứng Dụng Container
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

### Tối Ưu Hóa Dockerfile Nhiều Giai Đoạn
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

## ⚡ Tối Ưu Hóa Hiệu Suất

### Triển Khai Song Song
```bash
# Cấu hình triển khai song song
azd config set deploy.parallelism 5

# Triển khai các dịch vụ song song
azd deploy --parallel
```

### Lưu Trữ Cache Xây Dựng
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

### Triển Khai Gia Tăng
```bash
# Triển khai chỉ các dịch vụ đã thay đổi
azd deploy --incremental

# Triển khai với phát hiện thay đổi
azd deploy --detect-changes
```

## 🔍 Giám Sát Triển Khai

### Giám Sát Triển Khai Theo Thời Gian Thực
```bash
# Giám sát tiến trình triển khai
azd deploy --follow

# Xem nhật ký triển khai
azd logs --follow --service api

# Kiểm tra trạng thái triển khai
azd show --service api
```

### Kiểm Tra Sức Khỏe
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

### Xác Minh Sau Triển Khai
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Kiểm tra trạng thái hoạt động của ứng dụng
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

## 🔐 Cân Nhắc Về Bảo Mật

### Quản Lý Bí Mật
```bash
# Lưu trữ bí mật một cách an toàn
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Tham chiếu bí mật trong azure.yaml
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

### Bảo Mật Mạng
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Quản Lý Danh Tính và Quyền Truy Cập
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

## 🚨 Chiến Lược Hoàn Tác

### Hoàn Tác Nhanh
```bash
# Quay lại triển khai trước đó
azd deploy --rollback

# Quay lại dịch vụ cụ thể
azd deploy --service api --rollback

# Quay lại phiên bản cụ thể
azd deploy --service api --version v1.2.3
```

### Hoàn Tác Hạ Tầng
```bash
# Hoàn tác các thay đổi cơ sở hạ tầng
azd provision --rollback

# Xem trước các thay đổi hoàn tác
azd provision --rollback --preview
```

### Hoàn Tác Di Chuyển Cơ Sở Dữ Liệu
```bash
#!/bin/bash
# scripts/khôi-phục-cơ-sở-dữ-liệu.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Số Liệu Triển Khai

### Theo Dõi Hiệu Suất Triển Khai
```bash
# Bật số liệu triển khai
azd config set telemetry.deployment.enabled true

# Xem lịch sử triển khai
azd history

# Lấy thống kê triển khai
azd metrics --type deployment
```

### Thu Thập Số Liệu Tùy Chỉnh
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

## 🎯 Các Phương Pháp Tốt Nhất

### 1. Tính Nhất Quán Giữa Các Môi Trường
```bash
# Sử dụng cách đặt tên nhất quán
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Duy trì sự đồng nhất của môi trường
./scripts/sync-environments.sh
```

### 2. Xác Minh Hạ Tầng
```bash
# Xác minh trước khi triển khai
azd provision --preview
azd provision --what-if

# Sử dụng linting ARM/Bicep
az bicep lint --file infra/main.bicep
```

### 3. Tích Hợp Kiểm Tra
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

### 4. Tài Liệu và Ghi Nhật Ký
```bash
# Tài liệu quy trình triển khai
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Bước Tiếp Theo

- [Cấp Phát Tài Nguyên](provisioning.md) - Tìm hiểu sâu về quản lý hạ tầng
- [Lập Kế Hoạch Trước Triển Khai](../pre-deployment/capacity-planning.md) - Lập kế hoạch chiến lược triển khai
- [Các Vấn Đề Thường Gặp](../troubleshooting/common-issues.md) - Giải quyết các vấn đề triển khai
- [Các Phương Pháp Tốt Nhất](../troubleshooting/debugging.md) - Chiến lược triển khai sẵn sàng cho sản xuất

## 🎯 Bài Tập Thực Hành Triển Khai

### Bài Tập 1: Quy Trình Triển Khai Gia Tăng (20 phút)
**Mục Tiêu**: Làm chủ sự khác biệt giữa triển khai đầy đủ và triển khai gia tăng

```bash
# Triển khai ban đầu
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Ghi lại thời gian triển khai ban đầu
echo "Full deployment: $(date)" > deployment-log.txt

# Thực hiện thay đổi mã
echo "// Updated $(date)" >> src/api/src/server.js

# Chỉ triển khai mã (nhanh)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# So sánh thời gian
cat deployment-log.txt

# Dọn dẹp
azd down --force --purge
```

**Tiêu Chí Thành Công:**
- [ ] Triển khai đầy đủ mất 5-15 phút
- [ ] Triển khai chỉ mã mất 2-5 phút
- [ ] Các thay đổi mã được phản ánh trong ứng dụng đã triển khai
- [ ] Hạ tầng không thay đổi sau `azd deploy`

**Kết Quả Học Tập**: `azd deploy` nhanh hơn 50-70% so với `azd up` cho các thay đổi mã

### Bài Tập 2: Hook Triển Khai Tùy Chỉnh (30 phút)
**Mục Tiêu**: Triển khai tự động hóa trước và sau triển khai

```bash
# Tạo script xác thực trước khi triển khai
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Kiểm tra nếu các bài kiểm tra thành công
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Kiểm tra các thay đổi chưa được commit
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Tạo bài kiểm tra nhanh sau khi triển khai
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

# Thêm hooks vào azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Kiểm tra triển khai với hooks
azd deploy
```

**Tiêu Chí Thành Công:**
- [ ] Script trước triển khai chạy trước khi triển khai
- [ ] Triển khai bị hủy nếu kiểm tra thất bại
- [ ] Kiểm tra nhanh sau triển khai xác minh sức khỏe
- [ ] Các hook thực thi theo đúng thứ tự

### Bài Tập 3: Chiến Lược Triển Khai Nhiều Môi Trường (45 phút)
**Mục Tiêu**: Triển khai quy trình triển khai theo giai đoạn (dev → staging → production)

```bash
# Tạo kịch bản triển khai
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Bước 1: Triển khai đến dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Bước 2: Triển khai đến staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Bước 3: Phê duyệt thủ công cho sản xuất
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

# Tạo môi trường
azd env new dev
azd env new staging
azd env new production

# Chạy triển khai theo giai đoạn
./deploy-staged.sh
```

**Tiêu Chí Thành Công:**
- [ ] Môi trường dev triển khai thành công
- [ ] Môi trường staging triển khai thành công
- [ ] Yêu cầu phê duyệt thủ công cho production
- [ ] Tất cả các môi trường có kiểm tra sức khỏe hoạt động
- [ ] Có thể hoàn tác nếu cần

### Bài Tập 4: Chiến Lược Hoàn Tác (25 phút)
**Mục Tiêu**: Triển khai và kiểm tra hoàn tác triển khai

```bash
# Triển khai v1
azd env set APP_VERSION "1.0.0"
azd up

# Lưu cấu hình v1
cp -r .azure/production .azure/production-v1-backup

# Triển khai v2 với thay đổi phá vỡ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Phát hiện lỗi
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Hoàn tác mã
    git checkout src/api/src/server.js
    
    # Hoàn tác môi trường
    azd env set APP_VERSION "1.0.0"
    
    # Triển khai lại v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Tiêu Chí Thành Công:**
- [ ] Có thể phát hiện lỗi triển khai
- [ ] Script hoàn tác thực thi tự động
- [ ] Ứng dụng trở lại trạng thái hoạt động
- [ ] Kiểm tra sức khỏe thành công sau hoàn tác

## 📊 Theo Dõi Số Liệu Triển Khai

### Theo Dõi Hiệu Suất Triển Khai Của Bạn

```bash
# Tạo kịch bản số liệu triển khai
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

# Ghi nhật ký vào tệp
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Sử dụng nó
./track-deployment.sh
```

**Phân Tích Số Liệu Của Bạn:**
```bash
# Xem lịch sử triển khai
cat deployment-metrics.csv

# Tính thời gian triển khai trung bình
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Tài Nguyên Bổ Sung

- [Tham Khảo Triển Khai Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Triển Khai Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Triển Khai Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Triển Khai Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Điều Hướng**
- **Bài Học Trước**: [Dự Án Đầu Tiên Của Bạn](../getting-started/first-project.md)
- **Bài Học Tiếp Theo**: [Cấp Phát Tài Nguyên](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->