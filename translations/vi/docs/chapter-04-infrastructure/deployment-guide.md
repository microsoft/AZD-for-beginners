# Hướng Dẫn Triển Khai - Thành Thạo Triển Khai AZD

**Điều hướng chương:**
- **📚 Trang chủ khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 4 - Cơ sở hạ tầng dưới dạng Mã & Triển khai
- **⬅️ Chương trước**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)
- **➡️ Tiếp theo**: [Cung cấp Tài nguyên](provisioning.md)
- **🧩 Cũng trong chương này**: [Tạo mẫu riêng của bạn](custom-templates.md)
- **🚀 Chương tiếp theo**: [Chương 5: Các giải pháp AI đa tác nhân](../../examples/retail-scenario.md)

## Giới thiệu

> Được xem xét so với `azd 1.37.2` (Tháng 11 năm 2026). Các lệnh sử dụng Bash; ví dụ JSON yêu cầu `jq`. Ngoại trừ bài tập todo được khởi tạo rõ ràng, các ví dụ nâng cao là **đoạn tích hợp**: bạn cung cấp nguồn, cơ sở hạ tầng, kiểm thử và kịch bản của riêng bạn. Không có triển khai Azure nào được thực hiện trong đợt xem xét này.

Hướng dẫn toàn diện này bao gồm mọi thứ bạn cần biết về triển khai ứng dụng sử dụng Azure Developer CLI, từ các triển khai đơn giản chỉ một lệnh đến các kịch bản sản xuất nâng cao với các hook tùy chỉnh, nhiều môi trường và tích hợp CI/CD. Thành thạo toàn bộ chu trình triển khai với các ví dụ thực tiễn và các thực hành tốt nhất.

## Mục tiêu học tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Thành thạo tất cả các lệnh và quy trình làm việc triển khai Azure Developer CLI
- Hiểu chu trình triển khai đầy đủ từ cung cấp đến giám sát
- Thực hiện các hook triển khai tùy chỉnh để tự động hóa trước và sau triển khai
- Cấu hình nhiều môi trường với các tham số riêng biệt theo môi trường
- Triển khai các chiến lược nâng cao bao gồm triển khai xanh-lá và canary
- Tích hợp các triển khai azd với pipeline CI/CD và quy trình DevOps

## Kết quả học tập

Khi hoàn thành, bạn sẽ có thể:
- Thực thi và xử lý sự cố tất cả quy trình làm việc triển khai azd độc lập
- Thiết kế và thực hiện tự động hóa triển khai tùy chỉnh dùng hook
- Cấu hình các triển khai sẵn sàng sản xuất với bảo mật và giám sát phù hợp
- Quản lý các kịch bản triển khai đa môi trường phức tạp
- Tối ưu hiệu suất triển khai và thực hiện các chiến lược rollback
- Tích hợp các triển khai azd vào các thực hành DevOps doanh nghiệp

## Tổng quan triển khai

Azure Developer CLI cung cấp một số lệnh triển khai:
- `azd up` - Quy trình làm việc hoàn chỉnh (cung cấp + triển khai)
- `azd provision` - Chỉ tạo/cập nhật tài nguyên Azure
- `azd deploy` - Chỉ triển khai mã ứng dụng
- `azd package` - Xây dựng và đóng gói ứng dụng

## Quy trình triển khai cơ bản

### Triển khai hoàn chỉnh (azd up)
Quy trình làm việc phổ biến nhất cho các dự án mới:
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

### Triển khai chỉ hạ tầng
Khi bạn chỉ cần cập nhật tài nguyên Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Triển khai chỉ mã
Để cập nhật ứng dụng nhanh:
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

### ✅ Xác minh triển khai

Sau bất kỳ triển khai nào, xác minh thành công:

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

**Tiêu chí thành công:**
- ✅ `azd show` trả về các dịch vụ/URL mục tiêu như mong đợi
- ✅ Các yêu cầu đến các tuyến ứng dụng thực tế trả về trạng thái và nội dung như dự kiến
- ✅ Không có nhật ký lỗi trong 5 phút gần nhất
- ✅ Ứng dụng phản hồi các yêu cầu kiểm tra

## 🏗️ Hiểu quy trình triển khai

### Mới với hook? Bắt đầu ở đây

Một **hook** là một lệnh azd chạy tự động ở một thời điểm cụ thể trong quá trình triển khai — trước hoặc sau khi cung cấp, và trước hoặc sau khi triển khai mã của bạn. Chúng cho phép bạn tự động hóa các công việc nhỏ luôn đi kèm với việc triển khai: khởi tạo cơ sở dữ liệu, chạy migration, xây dựng tài nguyên, hoặc kiểm tra nhanh ứng dụng đang chạy.

| Hook | Chạy… | Sử dụng phổ biến |
|------|-------|------------|
| `preprovision` | Trước khi tài nguyên được tạo | Kiểm tra điều kiện cần, đăng nhập vào registry |
| `postprovision` | Sau khi tài nguyên tồn tại | Cấu hình tài nguyên, thiết lập cơ sở dữ liệu |
| `predeploy` | Trước khi mã được triển khai | Xây dựng tài nguyên frontend, chạy unit test |
| `postdeploy` | Sau khi mã hoạt động | Chạy migration DB, kiểm tra nhanh endpoint |

Hooks tồn tại trong `azure.yaml` của bạn. Đây là ví dụ nhỏ nhất — chỉ in một thông báo sau khi triển khai:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Chỉ vậy thôi — lần tới khi bạn chạy `azd up`, thông báo sẽ tự động được in. Bạn cũng có thể chạy một hook riêng lẻ, không cần triển khai đầy đủ, rất thuận tiện để test:

```bash
azd hooks run postdeploy
```

Các giai đoạn dưới đây cho thấy các hook trong thực tế (migration, kiểm thử, xác thực) cho từng bước.

### Giai đoạn 1: Hook trước khi cung cấp
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

### Giai đoạn 2: Cung cấp hạ tầng
- Đọc mẫu cơ sở hạ tầng (Bicep/Terraform)
- Tạo hoặc cập nhật tài nguyên Azure
- Cấu hình mạng và bảo mật
- Thiết lập giám sát và ghi log

### Giai đoạn 3: Hook sau khi cung cấp
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

### Giai đoạn 4: Đóng gói ứng dụng
- Xây dựng mã ứng dụng
- Tạo các artefact cho triển khai
- Đóng gói cho nền tảng mục tiêu (container, file ZIP, v.v.)

### Giai đoạn 5: Hook trước triển khai
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

### Giai đoạn 6: Triển khai ứng dụng
- Triển khai ứng dụng đã đóng gói lên dịch vụ Azure
- Cập nhật cấu hình
- Khởi động/lại dịch vụ

### Giai đoạn 7: Hook sau khi triển khai
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

### Xử lý lỗi hook

Theo mặc định, **nếu một lệnh hook thoát với mã khác 0, azd sẽ dừng toàn bộ thao tác.** Điều này thường đúng — một migration lỗi phải dừng triển khai, không để xuất bản ứng dụng lỗi. Nhưng điều đó có nghĩa hook cần được viết cẩn thận.

**1. Làm lỗi trở nên rõ ràng và có chủ đích.** Một hook lỗi khi câu lệnh cuối cùng trả về mã thoát khác 0. Trong shell script, thêm `set -e` để hook dừng ngay câu lệnh đầu tiên lỗi thay vì tiếp tục lặng lẽ:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Cho phép hook lỗi mà không dừng azd.** Với bước không quan trọng (ví dụ như làm ấm cache tùy chọn, thông báo cố gắng tốt), đặt `continueOnError: true`. azd ghi lại lỗi nhưng tiếp tục thực hiện:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Test hook riêng biệt trước khi chạy toàn bộ.** Bạn không cần chạy `azd up` để gỡ lỗi hook — chạy nó riêng và lặp lại nhanh:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Chú ý đến shell đặc thù hệ điều hành.** Hook dùng `shell: pwsh` cần PowerShell được cài trên máy chạy (bao gồm cả agent CI). Dùng `shell: sh` để có độ tương thích rộng nhất, hoặc cung cấp cả hai phiên bản `windows` và `posix`:

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

> **Mẹo gỡ lỗi:** chạy bất kỳ lệnh azd nào với `--debug` để thấy chính xác dòng lệnh hook và toàn bộ đầu ra — cực kỳ có ích khi hook chạy được trên máy cục bộ nhưng lỗi trên CI.

## 🎛️ Cấu hình Triển khai

### Cài đặt triển khai đặc thù dịch vụ
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

### Cấu hình theo môi trường

Đây là các giá trị azd cục bộ thôi. Cần ánh xạ rõ ràng sang cấu hình hạ tầng/thời gian chạy. `NODE_ENV` thường là `production` cho app Node được triển khai, bao gồm cả triển khai staging; dùng biến riêng cho app để phân biệt giai đoạn triển khai.

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

## 🔧 Kịch bản triển khai nâng cao

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

### Triển khai xanh-lá

**Minh họa hoạt động:** bạn phải cung cấp cả hai môi trường, lớp điều hướng traffic chung, và hai kịch bản bên dưới. azd không tự chuyển traffic hay xác thực sẵn sàng rollback. Giữ trạng thái xanh cho đến khi xanh vượt qua kiểm thử và rollback không còn cần.

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

### Triển khai Canary
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Chia traffic thuộc về cấu hình Container Apps (Bicep hoặc Azure CLI), không phải thuộc tính `azure.yaml` `trafficSplit` của azd. Xem trước/cung cấp và các lần triển khai sau phải giữ nguyên chế độ revision và luật điều hướng bạn chọn.

### Triển khai theo giai đoạn
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

## 🐳 Triển khai Container

### Triển khai Container App
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

Cấu hình bí mật runtime với `configuration.secrets`/`secretRef` (hoặc tham chiếu Key Vault) và scaling với `template.scale` trong hạ tầng Container App. Không tự tạo các thuộc tính `secrets` hoặc `scale` cấp dịch vụ trong `azure.yaml`.

### Tối ưu Dockerfile đa giai đoạn
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

## ⚡ Tối ưu hiệu suất

### Triển khai đặc thù dịch vụ
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Bộ nhớ đệm build
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Quy trình chuẩn Node sử dụng script package; hook `prepackage` của dịch vụ có thể thêm các bước cần thiết. Bộ nhớ đệm lớp Docker riêng biệt với định nghĩa lệnh build dịch vụ.

### Triển khai mã hiệu quả
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Giám sát triển khai

### Giám sát triển khai thời gian thực
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Kiểm tra sức khỏe
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

Ứng dụng của bạn phải triển khai `/health`; azd không cung cấp tự động. Không có thuộc tính dịch vụ `azure.yaml` `healthCheck` chung.

### Xác thực sau triển khai
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

## 🔐 Cân nhắc về bảo mật

### Quản lý bí mật
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` không hợp lệ. Giá trị môi trường thông thường là văn bản thuần cục bộ; đừng nghĩ các lệnh đọc sẽ che dấu chúng. Các lệnh trên lưu tham chiếu Key Vault, nhưng hạ tầng/ứng dụng của bạn vẫn phải tiêu thụ bí mật và cấp quyền truy cập danh tính runtime.

### Bảo mật mạng
Khai báo và tiêu thụ tham số mạng trong Bicep, ánh xạ chúng trong `infra/main.parameters.json`. Không có lớp phủ `infra.parameters` chung trong `azure.yaml`. Ví dụ tài liệu về dải mạng `203.0.113.0/24` và `198.51.100.0/24` không phải mạng văn phòng/VPN thật; thay thế bằng dải mạng được phép.

### Quản lý danh tính và truy cập
Bật `identity` của Container App trong Bicep và gán vai trò data-plane Key Vault cần thiết tại phạm vi kho bí mật. Cấu hình bí mật được hỗ trợ bằng Key Vault và tham chiếu runtime trong tài nguyên đó; `identity` và `keyVault` không phải thuộc tính dịch vụ azd chung. Tham khảo [Xác thực & Danh tính được quản lý](../chapter-03-configuration/authsecurity.md).

## 🚨 Chiến lược Rollback

### Rollback nhanh
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

### Rollback hạ tầng
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Rollback migration cơ sở dữ liệu
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Chỉ số triển khai

### Theo dõi hiệu suất triển khai
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Thu thập chỉ số tùy chỉnh
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

### 1. Tính nhất quán môi trường
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Xác thực hạ tầng
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Tích hợp kiểm thử
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

### 4. Tài liệu và ghi log
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Bước tiếp theo

- [Cung cấp tài nguyên](provisioning.md) - Đi sâu quản lý hạ tầng
- [Lập kế hoạch trước triển khai](../chapter-06-pre-deployment/capacity-planning.md) - Lên kế hoạch chiến lược triển khai
- [Vấn đề thường gặp](../chapter-07-troubleshooting/common-issues.md) - Giải quyết sự cố triển khai
- [Thực hành tốt nhất](../chapter-07-troubleshooting/debugging.md) - Chiến lược triển khai sẵn sàng sản xuất

## 🎯 Bài tập triển khai thực hành

### Bài tập 1: Quy trình triển khai tăng dần (20 phút)
**Mục tiêu**: Thành thạo sự khác biệt giữa triển khai đầy đủ và tăng dần

**Điểm khởi đầu:** Bash, Node.js 22, Git, đăng nhập azd, và tài khoản Azure có quyền triển khai. Chạy trong thư mục mới; dự kiến có tài nguyên App Service/Cosmos DB trả phí. Thời gian phụ thuộc vùng và mẫu.

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

**Tiêu chí thành công:**
- [ ] Ghi lại thời gian đã trôi qua cho cả hai lệnh (không có thời gian cố định)
- [ ] Cả hai lệnh đều thực thi thành công
- [ ] API vẫn hoạt động; chỉnh sửa chỉ ghi chú không thay đổi giao diện người dùng hiển thị
- [ ] Hạ tầng không thay đổi sau `azd deploy`

**Kết quả học tập**: `azd deploy` bỏ qua cung cấp hạ tầng. So sánh thời gian đo được thay vì giả định tăng tốc cố định.

### Bài tập 2: Hook triển khai tùy chỉnh (30 phút)
**Mục tiêu**: Thực hiện tự động hóa trước và sau triển khai

**Điểm khởi đầu:** dự án `deployment-practice` đã khởi tạo bên trên. Nếu bạn đã dọn sạch, hãy chạy `azd up` lại trước khi thử triển khai chỉ mã. Xác thực dưới đây dùng script build thực của API, không phải script gốc `test:unit` không tồn tại. Test API trong mẫu cần quyền truy cập database; không phải đơn vị kiểm thử độc lập.

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

**Tiêu chí thành công:**
- [ ] Script trước triển khai chạy trước khi triển khai
- [ ] Triển khai dừng nếu kiểm tra build thất bại
- [ ] Kiểm tra nhanh sau triển khai xác nhận trạng thái sức khỏe
- [ ] Các hook chạy đúng thứ tự

### Bài tập 3: Chiến lược triển khai đa môi trường (45 phút)
**Mục tiêu**: Thực hiện quy trình triển khai theo giai đoạn (dev → staging → production)

**Điểm khởi đầu:** dự án todo đã được khởi tạo giống như `jq`. Tạo các môi trường bên dưới với các giá trị đăng ký/vị trí thực (hoặc đặt `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` trong mỗi môi trường) **trước khi** gọi quy trình không cần nhắc nhở. Nó cố tình thất bại thay vì tạo ra các giá trị bị thiếu. Chỉ sử dụng các môi trường đào tạo có thể dùng một lần, không dùng đăng ký sản xuất thực tế.

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

**Tiêu chí thành công:**
- [ ] Môi trường Dev triển khai thành công
- [ ] Môi trường Staging triển khai thành công
- [ ] Cần sự phê duyệt thủ công cho sản xuất
- [ ] Tất cả các môi trường có kiểm tra trạng thái hoạt động
- [ ] Có thể quay lại nếu cần

### Bài tập 4: Chiến lược Quay lại (25 phút)
**Mục tiêu**: Thực hiện và kiểm thử việc quay lại triển khai dùng Git

**Điểm khởi đầu:** một bản sao độc lập dùng để đào tạo của mẫu todo với tất cả mã nguồn cơ bản đã cam kết, cây làm việc Git sạch, và môi trường cấu hình dùng một lần. Không bao giờ cố tình gây lỗi trong dự án sản xuất thực tế. `APP_VERSION` bên dưới chỉ dùng để quản lý sổ sách trừ khi bạn kết nối rõ ràng vào ứng dụng.

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

**Tiêu chí thành công:**
- [ ] Có thể phát hiện lỗi triển khai
- [ ] Script quay lại chạy tự động
- [ ] Ứng dụng trở lại trạng thái hoạt động
- [ ] Kiểm tra trạng thái hoạt động thành công sau khi quay lại

## 📊 Theo dõi Chỉ số Triển khai

### Theo dõi Hiệu suất Triển khai của bạn

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

**Phân tích chỉ số của bạn:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Tài nguyên Bổ sung

- [Tham khảo Triển khai Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Triển khai Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Triển khai Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Triển khai Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Điều hướng**
- **Bài học trước**: [Dự án đầu tiên của bạn](../chapter-01-foundation/first-project.md)
- **Bài học tiếp theo**: [Cấp phát Tài nguyên](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->