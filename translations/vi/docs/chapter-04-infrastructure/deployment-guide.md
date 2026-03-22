# Hướng dẫn Triển khai - Thành thạo triển khai AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD cho Người mới bắt đầu](../../README.md)
- **📖 Current Chapter**: Chương 4 - Hạ tầng như mã & Triển khai
- **⬅️ Previous Chapter**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Cấp phát Tài nguyên](provisioning.md)
- **🚀 Next Chapter**: [Chương 5: Giải pháp AI đa tác nhân](../../examples/retail-scenario.md)

## Giới thiệu

Hướng dẫn toàn diện này bao phủ mọi thứ bạn cần biết về triển khai ứng dụng bằng Azure Developer CLI, từ triển khai bằng một lệnh cơ bản đến các kịch bản sản xuất nâng cao với hook tùy chỉnh, nhiều môi trường và tích hợp CI/CD. Nắm vững toàn bộ vòng đời triển khai với các ví dụ thực tế và các phương pháp hay nhất.

## Mục tiêu học tập

Hoàn thành hướng dẫn này, bạn sẽ:
- Thành thạo tất cả các lệnh và quy trình triển khai của Azure Developer CLI
- Hiểu toàn bộ vòng đời triển khai từ cấp phát đến giám sát
- Thực hiện hook triển khai tùy chỉnh cho tự động hóa trước và sau triển khai
- Cấu hình nhiều môi trường với tham số theo từng môi trường
- Thiết lập các chiến lược triển khai nâng cao bao gồm blue-green và canary
- Tích hợp các triển khai azd với pipeline CI/CD và quy trình DevOps

## Kết quả học tập

Sau khi hoàn thành, bạn sẽ có thể:
- Thực thi và khắc phục sự cố tất cả các quy trình triển khai azd một cách độc lập
- Thiết kế và triển khai tự động hóa triển khai tùy chỉnh bằng hook
- Cấu hình các triển khai sẵn sàng cho sản xuất với bảo mật và giám sát phù hợp
- Quản lý các kịch bản triển khai phức tạp nhiều môi trường
- Tối ưu hóa hiệu suất triển khai và triển khai các chiến lược khôi phục
- Tích hợp các triển khai azd vào thực hành DevOps doanh nghiệp

## Tổng quan về triển khai

Azure Developer CLI cung cấp một số lệnh triển khai:
- `azd up` - Quy trình hoàn chỉnh (provision + deploy)
- `azd provision` - Chỉ tạo/cập nhật tài nguyên Azure
- `azd deploy` - Chỉ triển khai mã ứng dụng
- `azd package` - Xây dựng và đóng gói ứng dụng

## Các quy trình triển khai cơ bản

### Triển khai toàn bộ (azd up)
Quy trình phổ biến nhất cho các dự án mới:
```bash
# Triển khai mọi thứ từ đầu
azd up

# Triển khai với môi trường cụ thể
azd up --environment production

# Triển khai với các tham số tùy chỉnh
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Triển khai chỉ Hạ tầng
Khi bạn chỉ cần cập nhật tài nguyên Azure:
```bash
# Triển khai/cập nhật cơ sở hạ tầng
azd provision

# Triển khai ở chế độ chạy thử (dry-run) để xem trước các thay đổi
azd provision --preview

# Triển khai các dịch vụ cụ thể
azd provision --service database
```

### Triển khai chỉ Mã nguồn
Cho các cập nhật ứng dụng nhanh:
```bash
# Triển khai tất cả dịch vụ
azd deploy

# Đầu ra dự kiến:
# Đang triển khai các dịch vụ (azd deploy)
# - web: Đang triển khai... Xong
# - api: Đang triển khai... Xong
# THÀNH CÔNG: Việc triển khai của bạn hoàn tất trong 2 phút 15 giây

# Triển khai dịch vụ cụ thể
azd deploy --service web
azd deploy --service api

# Triển khai với tham số xây dựng tùy chỉnh
azd deploy --service api --build-arg NODE_ENV=production

# Xác minh việc triển khai
azd show --output json | jq '.services'
```

### ✅ Xác minh Triển khai

Sau mỗi lần triển khai, xác minh thành công:

```bash
# Kiểm tra tất cả các dịch vụ đang chạy
azd show

# Kiểm tra các điểm cuối sức khỏe
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Giám sát lỗi (mở trong trình duyệt theo mặc định)
azd monitor --logs
```

**Tiêu chí thành công:**
- ✅ Tất cả dịch vụ hiển thị trạng thái "Running"
- ✅ Các endpoint kiểm tra sức khỏe trả về HTTP 200
- ✅ Không có nhật ký lỗi trong 5 phút gần nhất
- ✅ Ứng dụng phản hồi các yêu cầu kiểm tra

## 🏗️ Hiểu quy trình triển khai

### Giai đoạn 1: Hooks trước khi cấp phát
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

### Giai đoạn 2: Cấp phát Hạ tầng
- Đọc các mẫu hạ tầng (Bicep/Terraform)
- Tạo hoặc cập nhật tài nguyên Azure
- Cấu hình mạng và bảo mật
- Thiết lập giám sát và ghi log

### Giai đoạn 3: Hooks sau cấp phát
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

### Giai đoạn 4: Đóng gói Ứng dụng
- Xây dựng mã ứng dụng
- Tạo artifact triển khai
- Đóng gói cho nền tảng đích (containers, ZIP files, etc.)

### Giai đoạn 5: Hooks trước triển khai
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

### Giai đoạn 6: Triển khai Ứng dụng
- Triển khai ứng dụng đã đóng gói tới các dịch vụ Azure
- Cập nhật thiết lập cấu hình
- Khởi động/khởi động lại dịch vụ

### Giai đoạn 7: Hooks sau triển khai
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

## 🎛️ Cấu hình Triển khai

### Cài đặt Triển khai theo Dịch vụ
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

### Cấu hình theo Môi trường
```bash
# Môi trường phát triển
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Môi trường kiểm thử
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

## 🔧 Các kịch bản Triển khai nâng cao

### Ứng dụng đa dịch vụ
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

### Triển khai Blue-Green
```bash
# Tạo môi trường màu xanh dương
azd env new production-blue
azd up --environment production-blue

# Kiểm tra môi trường màu xanh dương
./scripts/test-environment.sh production-blue

# Chuyển lưu lượng sang môi trường màu xanh dương (cập nhật DNS/bộ cân bằng tải thủ công)
./scripts/switch-traffic.sh production-blue

# Dọn dẹp môi trường màu xanh lá
azd env select production-green
azd down --force
```

### Triển khai Canary
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

### Triển khai theo giai đoạn
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

## 🐳 Triển khai Container

### Triển khai Ứng dụng Container
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

### Tối ưu Dockerfile đa giai đoạn
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

## ⚡ Tối ưu Hiệu năng

### Triển khai theo Dịch vụ
```bash
# Triển khai một dịch vụ cụ thể để lặp nhanh hơn
azd deploy --service web
azd deploy --service api

# Triển khai tất cả các dịch vụ
azd deploy
```

### Bộ nhớ đệm build
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Triển khai mã hiệu quả
```bash
# Sử dụng azd deploy (không phải azd up) cho các thay đổi chỉ về mã
# Điều này bỏ qua bước cung cấp hạ tầng và nhanh hơn nhiều
azd deploy

# Triển khai dịch vụ cụ thể để lặp nhanh nhất
azd deploy --service api
```

## 🔍 Giám sát Triển khai

### Giám sát Triển khai thời gian thực
```bash
# Giám sát ứng dụng theo thời gian thực
azd monitor --live

# Xem nhật ký ứng dụng
azd monitor --logs

# Kiểm tra trạng thái triển khai
azd show
```

### Kiểm tra sức khỏe
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

### Xác nhận sau triển khai
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Kiểm tra tình trạng hoạt động của ứng dụng
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

## 🔐 Các cân nhắc về Bảo mật

### Quản lý Bí mật
```bash
# Lưu trữ các bí mật một cách an toàn
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Tham chiếu các bí mật trong azure.yaml
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

### Bảo mật Mạng
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Quản lý Danh tính và Truy cập
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

## 🚨 Chiến lược Khôi phục (Rollback)

### Khôi phục nhanh
```bash
# AZD không có tính năng khôi phục (rollback) tích hợp. Các cách tiếp cận được khuyến nghị:

# Option 1: Triển khai lại từ Git (khuyến nghị)
git revert HEAD  # Hoàn tác commit gặp sự cố
git push
azd deploy

# Option 2: Triển khai lại commit cụ thể
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Khôi phục Hạ tầng
```bash
# Xem trước các thay đổi hạ tầng trước khi áp dụng
azd provision --preview

# Để hoàn nguyên hạ tầng, sử dụng hệ thống quản lý phiên bản:
git revert HEAD  # Hoàn nguyên các thay đổi hạ tầng
azd provision    # Áp dụng trạng thái hạ tầng trước đó
```

### Khôi phục Di chuyển Cơ sở dữ liệu
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Số liệu Triển khai

### Theo dõi Hiệu suất Triển khai
```bash
# Xem trạng thái triển khai hiện tại
azd show

# Giám sát ứng dụng bằng Application Insights
azd monitor --overview

# Xem số liệu thời gian thực
azd monitor --live
```

### Thu thập Số liệu Tùy chỉnh
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

## 🎯 Thực hành Tốt nhất

### 1. Độ nhất quán của Môi trường
```bash
# Sử dụng cách đặt tên nhất quán
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Duy trì tính nhất quán giữa các môi trường
./scripts/sync-environments.sh
```

### 2. Xác thực Hạ tầng
```bash
# Xem trước các thay đổi hạ tầng trước khi triển khai
azd provision --preview

# Sử dụng linting ARM/Bicep
az bicep lint --file infra/main.bicep

# Xác thực cú pháp Bicep
az bicep build --file infra/main.bicep
```

### 3. Tích hợp Kiểm thử
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

### 4. Tài liệu và Ghi log
```bash
# Tài liệu hóa quy trình triển khai
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Bước tiếp theo

- [Cấp phát Tài nguyên](provisioning.md) - Tìm hiểu sâu về quản lý hạ tầng
- [Lập kế hoạch Trước Triển khai](../chapter-06-pre-deployment/capacity-planning.md) - Lên kế hoạch chiến lược triển khai của bạn
- [Các Vấn đề Thường gặp](../chapter-07-troubleshooting/common-issues.md) - Giải quyết các sự cố triển khai
- [Thực hành Tốt nhất](../chapter-07-troubleshooting/debugging.md) - Các chiến lược triển khai sẵn sàng cho sản xuất

## 🎯 Bài tập Thực hành Triển khai

### Bài tập 1: Quy trình Triển khai Tăng dần (20 phút)
**Mục tiêu**: Nắm vững sự khác biệt giữa triển khai toàn bộ và triển khai tăng dần

```bash
# Triển khai ban đầu
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Ghi lại thời gian triển khai ban đầu
echo "Full deployment: $(date)" > deployment-log.txt

# Thay đổi mã
echo "// Updated $(date)" >> src/api/src/server.js

# Chỉ triển khai mã (nhanh)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# So sánh thời gian
cat deployment-log.txt

# Dọn dẹp
azd down --force --purge
```

**Tiêu chí thành công:**
- [ ] Triển khai toàn bộ mất 5-15 phút
- [ ] Triển khai chỉ mã nguồn mất 2-5 phút
- [ ] Các thay đổi mã được phản ánh trong ứng dụng đã triển khai
- [ ] Hạ tầng không thay đổi sau `azd deploy`

**Kết quả học tập**: `azd deploy` nhanh hơn 50-70% so với `azd up` đối với thay đổi mã

### Bài tập 2: Hooks Triển khai Tùy chỉnh (30 phút)
**Mục tiêu**: Triển khai tự động hóa trước và sau triển khai

```bash
# Tạo tập lệnh xác thực trước khi triển khai
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Kiểm tra xem các bài kiểm tra có vượt qua hay không
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Kiểm tra các thay đổi chưa được cam kết
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Tạo bài kiểm thử khói sau khi triển khai
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

# Thêm các hook vào azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Kiểm tra việc triển khai với các hook
azd deploy
```

**Tiêu chí thành công:**
- [ ] Kịch bản trước triển khai chạy trước khi triển khai
- [ ] Việc triển khai bị hủy nếu kiểm thử thất bại
- [ ] Kiểm tra nhanh sau triển khai xác nhận tình trạng
- [ ] Hooks thực thi theo đúng thứ tự

### Bài tập 3: Chiến lược Triển khai Đa Môi trường (45 phút)
**Mục tiêu**: Triển khai quy trình theo giai đoạn (dev → staging → production)

```bash
# Tạo tập lệnh triển khai
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Bước 1: Triển khai tới môi trường dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Bước 2: Triển khai tới môi trường staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Bước 3: Phê duyệt thủ công cho môi trường sản xuất
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

# Tạo các môi trường
azd env new dev
azd env new staging
azd env new production

# Chạy triển khai theo giai đoạn
./deploy-staged.sh
```

**Tiêu chí thành công:**
- [ ] Môi trường dev triển khai thành công
- [ ] Môi trường staging triển khai thành công
- [ ] Yêu cầu phê duyệt thủ công cho production
- [ ] Tất cả môi trường có kiểm tra sức khỏe hoạt động
- [ ] Có thể khôi phục nếu cần

### Bài tập 4: Chiến lược Khôi phục (25 phút)
**Mục tiêu**: Triển khai và kiểm thử khôi phục triển khai sử dụng Git

```bash
# Triển khai v1
azd env set APP_VERSION "1.0.0"
azd up

# Lưu hash commit của v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Triển khai v2 với thay đổi phá vỡ tương thích
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Phát hiện lỗi và quay lùi
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Quay lùi bằng git
    git revert HEAD --no-edit
    
    # Quay lùi môi trường
    azd env set APP_VERSION "1.0.0"
    
    # Triển khai lại v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Tiêu chí thành công:**
- [ ] Có thể phát hiện lỗi triển khai
- [ ] Kịch bản khôi phục thực thi tự động
- [ ] Ứng dụng trở về trạng thái hoạt động
- [ ] Kiểm tra sức khỏe thành công sau khôi phục

## 📊 Theo dõi Số liệu Triển khai

### Theo dõi Hiệu suất Triển khai của bạn

```bash
# Tạo script đo lường triển khai
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

**Phân tích số liệu của bạn:**
```bash
# Xem lịch sử triển khai
cat deployment-metrics.csv

# Tính thời gian triển khai trung bình
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Tài nguyên Bổ sung

- [Tài liệu tham khảo Triển khai Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Triển khai Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Triển khai Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Triển khai Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Điều hướng**
- **Bài học trước**: [Dự án Đầu tiên của bạn](../chapter-01-foundation/first-project.md)
- **Bài học tiếp theo**: [Cấp phát Tài nguyên](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->