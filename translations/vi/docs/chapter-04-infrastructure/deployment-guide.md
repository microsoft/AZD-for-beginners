# Deployment Guide - Mastering AZD Deployments

**Chapter Navigation:**
- **📚 Course Home**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Current Chapter**: Chương 4 - Hạ tầng như Mã & Triển khai
- **⬅️ Previous Chapter**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🧩 Also in this chapter**: [Tạo Mẫu Tùy Chỉnh Của Bạn](custom-templates.md)
- **🚀 Next Chapter**: [Chương 5: Giải pháp AI đa tác nhân](../../examples/retail-scenario.md)

## Giới thiệu

Hướng dẫn toàn diện này bao gồm mọi thứ bạn cần biết về việc triển khai ứng dụng bằng Azure Developer CLI, từ việc triển khai bằng một lệnh cơ bản đến các kịch bản production nâng cao với hook tùy chỉnh, nhiều môi trường và tích hợp CI/CD. Làm chủ toàn bộ vòng đời triển khai với các ví dụ thực tế và các thực hành tốt nhất.

## Mục tiêu học tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Thành thạo tất cả các lệnh và luồng công việc triển khai của Azure Developer CLI
- Hiểu toàn bộ vòng đời triển khai từ việc cấp phát đến giám sát
- Triển khai hook triển khai tùy chỉnh cho tự động hóa trước và sau khi triển khai
- Cấu hình nhiều môi trường với các tham số theo môi trường
- Thiết lập các chiến lược triển khai nâng cao bao gồm blue-green và canary
- Tích hợp các triển khai azd với pipeline CI/CD và quy trình DevOps

## Kết quả học tập

Sau khi hoàn thành, bạn sẽ có thể:
- Thực thi và khắc phục sự cố tất cả các luồng công việc triển khai azd một cách độc lập
- Thiết kế và triển khai tự động hóa triển khai tùy chỉnh bằng cách sử dụng hooks
- Cấu hình các triển khai sẵn sàng cho production với bảo mật và giám sát phù hợp
- Quản lý các kịch bản triển khai phức tạp nhiều môi trường
- Tối ưu hóa hiệu năng triển khai và triển khai chiến lược rollback
- Tích hợp các triển khai azd vào thực tiễn DevOps doanh nghiệp

## Tổng quan về Triển khai

Azure Developer CLI cung cấp một số lệnh triển khai:
- `azd up` - Quy trình hoàn chỉnh (provision + deploy)
- `azd provision` - Chỉ tạo/cập nhật tài nguyên Azure
- `azd deploy` - Chỉ triển khai mã ứng dụng
- `azd package` - Xây dựng và đóng gói ứng dụng

## Các luồng triển khai cơ bản

### Triển khai hoàn chỉnh (azd up)
Luồng phổ biến nhất cho các dự án mới:
```bash
# Triển khai mọi thứ từ đầu
azd up

# Triển khai với môi trường cụ thể
azd up --environment production

# Triển khai với các tham số tùy chỉnh
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Triển khai chỉ hạ tầng
Khi bạn chỉ cần cập nhật tài nguyên Azure:
```bash
# Triển khai/cập nhật hạ tầng
azd provision

# Triển khai với chạy thử (dry-run) để xem trước các thay đổi
azd provision --preview

# Triển khai các dịch vụ cụ thể
azd provision --service database
```

### Triển khai chỉ mã
Cho các cập nhật ứng dụng nhanh:
```bash
# Triển khai tất cả dịch vụ
azd deploy

# Kết quả mong đợi:
# Đang triển khai các dịch vụ (azd deploy)
# - web: Đang triển khai... Hoàn tất
# - api: Đang triển khai... Hoàn tất
# THÀNH CÔNG: Việc triển khai của bạn hoàn tất trong 2 phút 15 giây

# Triển khai dịch vụ cụ thể
azd deploy --service web
azd deploy --service api

# Triển khai với các tham số build tùy chỉnh
azd deploy --service api --build-arg NODE_ENV=production

# Xác minh triển khai
azd show --output json | jq '.services'
```

### ✅ Xác minh triển khai

Sau bất kỳ triển khai nào, xác minh thành công:

```bash
# Kiểm tra tất cả các dịch vụ đang chạy
azd show

# Kiểm tra các điểm cuối về tình trạng sức khỏe
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
- ✅ Không có log lỗi trong 5 phút gần nhất
- ✅ Ứng dụng phản hồi các yêu cầu thử nghiệm

## 🏗️ Hiểu về Quy trình Triển khai

### Mới với hooks? Bắt đầu ở đây

Một **hook** là một lệnh mà azd chạy tự động tại một thời điểm cụ thể trong quá trình triển khai — trước hoặc sau khi provisioning, và trước hoặc sau khi triển khai mã của bạn. Chúng cho phép bạn tự động hóa các công việc nhỏ luôn đi kèm với một triển khai: khởi tạo dữ liệu cho cơ sở dữ liệu, chạy migration, xây dựng tài sản, hoặc chạy kiểm tra nhanh ứng dụng đang chạy.

| Hook | Runs… | Mục đích phổ biến |
|------|-------|-------------------|
| `preprovision` | Trước khi tài nguyên được tạo | Xác thực các tiền điều kiện, đăng nhập vào registry |
| `postprovision` | Sau khi tài nguyên tồn tại | Cấu hình tài nguyên, thiết lập cơ sở dữ liệu |
| `predeploy` | Trước khi mã được triển khai | Xây dựng tài sản front-end, chạy unit test |
| `postdeploy` | Sau khi mã đã live | Chạy migration DB, kiểm tra nhanh endpoint |

Hooks nằm trong `azure.yaml` của bạn. Đây là ví dụ nhỏ nhất có thể — nó chỉ in một thông báo sau khi triển khai:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Xong — lần sau khi bạn chạy `azd up`, thông điệp sẽ được in tự động. Bạn cũng có thể chạy một hook riêng lẻ, không cần chạy toàn bộ deploy, điều này rất hữu ích cho việc kiểm thử:

```bash
azd hooks run postdeploy
```

Các pha bên dưới hiển thị các hook thực tế trong thế giới thực (migrations, test, xác thực) cho mỗi giai đoạn.

### Pha 1: Hook trước Provision
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

### Pha 2: Provision Hạ tầng
- Đọc các mẫu hạ tầng (Bicep/Terraform)
- Tạo hoặc cập nhật tài nguyên Azure
- Cấu hình mạng và bảo mật
- Thiết lập giám sát và logging

### Pha 3: Hook sau Provision
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

### Pha 4: Đóng gói Ứng dụng
- Xây dựng mã ứng dụng
- Tạo artifact triển khai
- Đóng gói cho nền tảng mục tiêu (container, tệp ZIP, v.v.)

### Pha 5: Hook trước Triển khai
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

### Pha 6: Triển khai Ứng dụng
- Triển khai các ứng dụng đã đóng gói lên dịch vụ Azure
- Cập nhật cài đặt cấu hình
- Khởi động/khởi động lại dịch vụ

### Pha 7: Hook sau Triển khai
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

### Xử lý lỗi Hook

Mặc định, **nếu một lệnh hook kết thúc với mã khác 0, azd sẽ dừng toàn bộ thao tác.** Đây thường là điều bạn muốn — một migration thất bại nên dừng deploy, không nên đưa một ứng dụng lỗi vào production. Nhưng điều đó có nghĩa là các hook cần được viết cẩn thận.

**1. Làm cho lỗi rõ ràng và có chủ đích.** Một hook thất bại khi lệnh cuối cùng của nó trả về mã khác 0. Trong các script shell, thêm `set -e` để hook dừng ngay khi gặp lệnh lỗi thay vì tiếp tục im lặng:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Cho phép một hook thất bại mà không dừng azd.** Với các bước không quan trọng (khởi động cache tùy chọn, thông báo nỗ lực tốt nhất), đặt `continueOnError: true`. azd sẽ ghi log lỗi nhưng tiếp tục thực hiện:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Kiểm tra hook riêng lẻ trước khi chạy toàn bộ.** Bạn không cần chạy `azd up` để gỡ lỗi một hook — chạy riêng hook đó và lặp nhanh:

```bash
azd hooks run predeploy          # chỉ chạy hook predeploy
azd hooks run postdeploy --service api
```

**4. Chú ý shell phụ thuộc OS.** Một hook sử dụng `shell: pwsh` cần PowerShell được cài trên máy chạy hook (bao gồm cả agent CI). Dùng `shell: sh` để tương thích rộng nhất, hoặc cung cấp cả biến thể `windows` và `posix`:

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

> **Mẹo gỡ lỗi:** chạy bất kỳ lệnh azd nào với `--debug` để xem dòng lệnh hook chính xác và toàn bộ output — rất hữu ích khi một hook chạy được cục bộ nhưng thất bại trong CI.

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

## 🔧 Các kịch bản Triển khai Nâng cao

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
# Tạo môi trường xanh dương
azd env new production-blue
azd up --environment production-blue

# Kiểm tra môi trường xanh dương
./scripts/test-environment.sh production-blue

# Chuyển lưu lượng sang môi trường xanh dương (cập nhật DNS/cân bằng tải thủ công)
./scripts/switch-traffic.sh production-blue

# Dọn dẹp môi trường xanh lá cây
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

### Triển khai Container App
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

### Tối ưu Dockerfile nhiều giai đoạn
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

## ⚡ Tối ưu hiệu năng

### Triển khai theo Dịch vụ
```bash
# Triển khai một dịch vụ cụ thể để lặp nhanh hơn
azd deploy --service web
azd deploy --service api

# Triển khai tất cả các dịch vụ
azd deploy
```

### Cache khi xây dựng
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
# Sử dụng azd deploy (không phải azd up) cho các thay đổi chỉ về mã nguồn
# Điều này bỏ qua việc thiết lập hạ tầng và nhanh hơn nhiều
azd deploy

# Triển khai dịch vụ cụ thể để lặp nhanh nhất
azd deploy --service api
```

## 🔍 Giám sát Triển khai

### Giám sát triển khai theo thời gian thực
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

### Xác thực sau triển khai
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Kiểm tra sức khỏe ứng dụng
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

### Quản lý Secrets
```bash
# Lưu trữ bí mật một cách an toàn
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

## 🚨 Chiến lược Rollback

### Rollback Nhanh
```bash
# AZD không có tính năng rollback tích hợp. Các cách tiếp cận được khuyến nghị:

# Lựa chọn 1: Triển khai lại từ Git (khuyến nghị)
git revert HEAD  # Hoàn tác commit gây sự cố
git push
azd deploy

# Lựa chọn 2: Triển khai lại commit cụ thể
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback Hạ tầng
```bash
# Xem trước các thay đổi hạ tầng trước khi áp dụng
azd provision --preview

# Để khôi phục hạ tầng, hãy sử dụng hệ thống kiểm soát phiên bản:
git revert HEAD  # Hoàn tác các thay đổi hạ tầng
azd provision    # Áp dụng trạng thái hạ tầng trước đó
```

### Rollback Migration Cơ sở dữ liệu
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

### Theo dõi hiệu suất triển khai
```bash
# Xem trạng thái triển khai hiện tại
azd show

# Giám sát ứng dụng bằng Application Insights
azd monitor --overview

# Xem số liệu thời gian thực
azd monitor --live
```

### Thu thập số liệu tùy chỉnh
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

## 🎯 Thực hành tốt nhất

### 1. Đảm bảo nhất quán giữa các môi trường
```bash
# Sử dụng quy tắc đặt tên nhất quán
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Duy trì tính nhất quán giữa các môi trường
./scripts/sync-environments.sh
```

### 2. Xác thực Hạ tầng
```bash
# Xem trước các thay đổi cơ sở hạ tầng trước khi triển khai
azd provision --preview

# Sử dụng linting cho ARM/Bicep
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

### 4. Tài liệu và Logging
```bash
# Tài liệu hóa quy trình triển khai
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Bước tiếp theo

- [Provisioning Resources](provisioning.md) - Khám phá sâu về quản lý hạ tầng
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Lên kế hoạch chiến lược triển khai của bạn
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Giải quyết các vấn đề triển khai
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Chiến lược triển khai sẵn sàng cho production

## 🎯 Bài tập Triển khai thực hành

### Bài tập 1: Luồng Triển khai Tăng dần (20 phút)
**Mục tiêu**: Nắm vững sự khác biệt giữa triển khai đầy đủ và triển khai tăng dần

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

**Tiêu chí thành công:**
- [ ] Triển khai đầy đủ mất 5-15 phút
- [ ] Triển khai chỉ mã mất 2-5 phút
- [ ] Thay đổi mã được phản ánh trong ứng dụng đã triển khai
- [ ] Hạ tầng không thay đổi sau `azd deploy`

**Kết quả học tập**: `azd deploy` nhanh hơn `azd up` 50-70% cho các thay đổi mã

### Bài tập 2: Hooks Triển khai Tùy chỉnh (30 phút)
**Mục tiêu**: Triển khai tự động hóa trước và sau khi triển khai

```bash
# Tạo script xác thực trước khi triển khai
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Kiểm tra xem các bài kiểm tra có chạy thành công hay không
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

# Tạo bài kiểm tra smoke sau khi triển khai
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

# Kiểm tra việc triển khai với các hooks
azd deploy
```

**Tiêu chí thành công:**
- [ ] Script pre-deploy chạy trước khi triển khai
- [ ] Triển khai bị hủy nếu tests thất bại
- [ ] Kiểm tra nhanh post-deploy xác nhận sức khỏe
- [ ] Hooks chạy theo thứ tự đúng

### Bài tập 3: Chiến lược Triển khai Nhiều Môi trường (45 phút)
**Mục tiêu**: Triển khai luồng theo giai đoạn (dev → staging → production)

```bash
# Tạo script triển khai
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Bước 1: Triển khai lên môi trường dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Bước 2: Triển khai lên môi trường staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Bước 3: Phê duyệt thủ công cho môi trường production
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
- [ ] Môi trường Dev triển khai thành công
- [ ] Môi trường Staging triển khai thành công
- [ ] Yêu cầu phê duyệt thủ công cho production
- [ ] Tất cả môi trường có kiểm tra sức khỏe hoạt động
- [ ] Có thể rollback nếu cần

### Bài tập 4: Chiến lược Rollback (25 phút)
**Mục tiêu**: Triển khai và kiểm tra rollback bằng Git

```bash
# Triển khai v1
azd env set APP_VERSION "1.0.0"
azd up

# Lưu hash commit của v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Triển khai v2 với thay đổi không tương thích
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Phát hiện sự cố và quay lui
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Quay lui bằng git
    git revert HEAD --no-edit
    
    # Quay lui môi trường
    azd env set APP_VERSION "1.0.0"
    
    # Triển khai lại v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Tiêu chí thành công:**
- [ ] Có thể phát hiện lỗi triển khai
- [ ] Script rollback chạy tự động
- [ ] Ứng dụng trở về trạng thái hoạt động
- [ ] Kiểm tra sức khỏe vượt sau khi rollback

## 📊 Theo dõi Số liệu Triển khai

### Theo dõi hiệu suất triển khai của bạn

```bash
# Tạo tập lệnh thu thập số liệu triển khai
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

# Ghi vào tệp nhật ký
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
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

## Tài nguyên bổ sung

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Previous Lesson**: [Dự án đầu tiên của bạn](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->