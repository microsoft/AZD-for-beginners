<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-18T07:39:44+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "vi"
}
-->
# Hướng Dẫn Triển Khai - Làm Chủ Các Triển Khai AZD

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 4 - Hạ Tầng dưới dạng Mã & Triển Khai
- **⬅️ Chương Trước**: [Chương 3: Cấu Hình](../getting-started/configuration.md)
- **➡️ Tiếp Theo**: [Cấp Phát Tài Nguyên](provisioning.md)
- **🚀 Chương Tiếp Theo**: [Chương 5: Giải Pháp AI Đa Tác Nhân](../../examples/retail-scenario.md)

## Giới Thiệu

Hướng dẫn toàn diện này bao gồm mọi thứ bạn cần biết về việc triển khai ứng dụng bằng Azure Developer CLI, từ các triển khai cơ bản chỉ với một lệnh đến các kịch bản sản xuất nâng cao với các hook tùy chỉnh, nhiều môi trường, và tích hợp CI/CD. Làm chủ toàn bộ vòng đời triển khai với các ví dụ thực tế và các phương pháp tốt nhất.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Làm chủ tất cả các lệnh và quy trình triển khai của Azure Developer CLI
- Hiểu toàn bộ vòng đời triển khai từ cấp phát đến giám sát
- Thực hiện các hook triển khai tùy chỉnh cho tự động hóa trước và sau triển khai
- Cấu hình nhiều môi trường với các tham số riêng biệt cho từng môi trường
- Thiết lập các chiến lược triển khai nâng cao bao gồm triển khai blue-green và canary
- Tích hợp các triển khai azd với các pipeline CI/CD và quy trình DevOps

## Kết Quả Học Tập

Sau khi hoàn thành, bạn sẽ có khả năng:
- Thực hiện và khắc phục sự cố tất cả các quy trình triển khai azd một cách độc lập
- Thiết kế và thực hiện tự động hóa triển khai tùy chỉnh bằng các hook
- Cấu hình các triển khai sẵn sàng cho sản xuất với bảo mật và giám sát phù hợp
- Quản lý các kịch bản triển khai phức tạp với nhiều môi trường
- Tối ưu hóa hiệu suất triển khai và thực hiện các chiến lược rollback
- Tích hợp các triển khai azd vào các thực tiễn DevOps doanh nghiệp

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
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Triển Khai Chỉ Hạ Tầng
Khi bạn chỉ cần cập nhật tài nguyên Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Triển Khai Chỉ Mã
Dành cho các cập nhật ứng dụng nhanh:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

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
- Tạo các tài liệu triển khai
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
- Cập nhật các cài đặt cấu hình
- Bắt đầu/khởi động lại các dịch vụ

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

### Cài Đặt Triển Khai Theo Dịch Vụ
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

### Cấu Hình Theo Môi Trường
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

### Triển Khai Blue-Green
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
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Bộ Nhớ Đệm Xây Dựng
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

### Triển Khai Tăng Dần
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Giám Sát Triển Khai

### Giám Sát Triển Khai Theo Thời Gian Thực
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
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

### Xác Thực Sau Triển Khai
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

## 🔐 Cân Nhắc Về Bảo Mật

### Quản Lý Bí Mật
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

## 🚨 Chiến Lược Rollback

### Rollback Nhanh
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Rollback Hạ Tầng
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Rollback Di Chuyển Cơ Sở Dữ Liệu
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Các Chỉ Số Triển Khai

### Theo Dõi Hiệu Suất Triển Khai
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### Thu Thập Chỉ Số Tùy Chỉnh
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

### 1. Tính Nhất Quán Môi Trường
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Xác Thực Hạ Tầng
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Các Bước Tiếp Theo

- [Cấp Phát Tài Nguyên](provisioning.md) - Tìm hiểu sâu về quản lý hạ tầng
- [Lập Kế Hoạch Trước Triển Khai](../pre-deployment/capacity-planning.md) - Lập kế hoạch chiến lược triển khai của bạn
- [Các Vấn Đề Thường Gặp](../troubleshooting/common-issues.md) - Giải quyết các vấn đề triển khai
- [Các Phương Pháp Tốt Nhất](../troubleshooting/debugging.md) - Chiến lược triển khai sẵn sàng cho sản xuất

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

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.