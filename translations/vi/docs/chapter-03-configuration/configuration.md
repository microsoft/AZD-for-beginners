# Hướng dẫn Cấu hình

**Điều hướng Chương:**
- **📚 Trang Khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương hiện tại**: Chapter 3 - Configuration & Authentication
- **⬅️ Trước**: [Dự án Đầu tiên](first-project.md)
- **➡️ Tiếp theo**: [Hướng dẫn Triển khai](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Chương tiếp theo**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Giới thiệu

Hướng dẫn toàn diện này đề cập đến tất cả các khía cạnh của việc cấu hình Azure Developer CLI để tối ưu hóa quy trình phát triển và triển khai. Bạn sẽ tìm hiểu về hệ thống phân cấp cấu hình, quản lý môi trường, các phương thức xác thực và các mẫu cấu hình nâng cao giúp triển khai Azure hiệu quả và an toàn.

## Mục tiêu học tập

Kết thúc bài học này, bạn sẽ:
- Nắm vững phân cấp cấu hình azd và hiểu cách ưu tiên các thiết lập
- Cấu hình các thiết lập toàn cục và theo dự án một cách hiệu quả
- Quản lý nhiều môi trường với các cấu hình khác nhau
- Thực hiện các mẫu xác thực và ủy quyền an toàn
- Hiểu các mẫu cấu hình nâng cao cho các kịch bản phức tạp

## Kết quả học tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Cấu hình azd cho các quy trình phát triển tối ưu
- Thiết lập và quản lý nhiều môi trường triển khai
- Thực hiện các thực hành quản lý cấu hình an toàn
- Khắc phục các sự cố liên quan đến cấu hình
- Tùy chỉnh hành vi azd cho các yêu cầu cụ thể của tổ chức

Hướng dẫn toàn diện này đề cập đến tất cả các khía cạnh của việc cấu hình Azure Developer CLI để tối ưu hóa quy trình phát triển và triển khai.

## Phân cấp Cấu hình

azd sử dụng hệ thống phân cấp cấu hình:
1. **Cờ dòng lệnh** (ưu tiên cao nhất)
2. **Biến môi trường**
3. **Cấu hình dự án cục bộ** (`.azd/config.json`)
4. **Cấu hình người dùng toàn cục** (`~/.azd/config.json`)
5. **Giá trị mặc định** (ưu tiên thấp nhất)

## Cấu hình Toàn cục

### Đặt Mặc định Toàn cục
```bash
# Đặt đăng ký mặc định
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Đặt vị trí mặc định
azd config set defaults.location "eastus2"

# Đặt quy ước đặt tên mặc định cho nhóm tài nguyên
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Xem tất cả cấu hình toàn cục
azd config list

# Xóa một cấu hình
azd config unset defaults.location
```

### Các cài đặt Toàn cục Thông dụng
```bash
# Tùy chọn phát triển
azd config set alpha.enable true                    # Bật các tính năng alpha
azd config set telemetry.enabled false             # Vô hiệu hóa thu thập số liệu
azd config set output.format json                  # Đặt định dạng đầu ra

# Cài đặt bảo mật
azd config set auth.useAzureCliCredential true     # Sử dụng Azure CLI để xác thực
azd config set tls.insecure false                  # Bắt buộc xác minh TLS

# Tinh chỉnh hiệu suất
azd config set provision.parallelism 5             # Tạo tài nguyên đồng thời
azd config set deploy.timeout 30m                  # Thời gian chờ triển khai
```

## 🏗️ Cấu hình Dự án

### Cấu trúc azure.yaml
Tệp `azure.yaml` là trái tim của dự án azd của bạn:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### Tùy chọn Cấu hình Dịch vụ

#### Loại Host
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Cài đặt theo Ngôn ngữ
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Quản lý Môi trường

### Tạo Môi trường
```bash
# Tạo một môi trường mới
azd env new development

# Tạo với vị trí cụ thể
azd env new staging --location "westus2"

# Tạo từ mẫu
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Cấu hình Môi trường
Mỗi môi trường có cấu hình riêng trong `.azure/<env-name>/config.json`:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Biến Môi trường
```bash
# Thiết lập biến môi trường cụ thể
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Xem các biến môi trường
azd env get-values

# Kết quả mong đợi:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Xóa biến môi trường
azd env unset DEBUG

# Xác minh việc xóa
azd env get-values | grep DEBUG
# (không nên trả về gì)
```

### Mẫu Môi trường
Tạo `.azure/env.template` để thiết lập môi trường nhất quán:
```bash
# Các biến bắt buộc
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Cài đặt ứng dụng
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Cài đặt phát triển tùy chọn
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Cấu hình Xác thực

### Tích hợp Azure CLI
```bash
# Sử dụng thông tin xác thực Azure CLI (mặc định)
azd config set auth.useAzureCliCredential true

# Đăng nhập với tenant cụ thể
az login --tenant <tenant-id>

# Đặt đăng ký mặc định
az account set --subscription <subscription-id>
```

### Xác thực Service Principal
Cho các pipeline CI/CD:
```bash
# Đặt biến môi trường
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Hoặc cấu hình trực tiếp
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Định danh được quản lý
Cho các môi trường được lưu trữ trên Azure:
```bash
# Bật xác thực bằng danh tính được quản lý
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Cấu hình Hạ tầng

### Tham số Bicep
Cấu hình tham số hạ tầng trong `infra/main.parameters.json`:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Cấu hình Terraform
Đối với dự án Terraform, cấu hình trong `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Cấu hình Triển khai

### Cấu hình Build
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Cấu hình Docker
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
        NODE_ENV: production
        API_VERSION: v1.0.0
```
Ví dụ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Cấu hình Nâng cao

### Đặt tên Tài nguyên Tùy chỉnh
```bash
# Thiết lập quy ước đặt tên
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Cấu hình Mạng
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Cấu hình Giám sát
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 Cấu hình theo Môi trường

### Môi trường Phát triển
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Môi trường Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Môi trường Sản xuất
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Xác thực Cấu hình

### Xác thực Cấu hình
```bash
# Kiểm tra cú pháp cấu hình
azd config validate

# Kiểm tra biến môi trường
azd env get-values

# Xác minh hạ tầng
azd provision --dry-run
```

### Script Cấu hình
Tạo các script xác thực trong `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Kiểm tra các biến môi trường bắt buộc
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Xác thực cú pháp của azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Thực tiễn Tốt nhất

### 1. Sử dụng Biến Môi trường
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Sắp xếp Tệp Cấu hình
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Lưu ý Kiểm soát Phiên bản
```bash
# .gitignore
.azure/*/config.json         # Cấu hình môi trường (chứa các ID tài nguyên)
.azure/*/.env               # Biến môi trường (có thể chứa thông tin nhạy cảm)
.env                        # Tệp môi trường cục bộ
```

### 4. Tài liệu Cấu hình
Ghi tài liệu cấu hình của bạn trong `CONFIG.md`:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 Bài tập Thực hành

### Bài tập 1: Cấu hình Đa Môi trường (15 phút)

**Mục tiêu**: Tạo và cấu hình ba môi trường với các thiết lập khác nhau

```bash
# Tạo môi trường phát triển
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Tạo môi trường tiền sản xuất
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Tạo môi trường sản xuất
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Xác minh từng môi trường
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Tiêu chí Thành công:**
- [ ] Đã tạo thành công ba môi trường
- [ ] Mỗi môi trường có cấu hình riêng biệt
- [ ] Có thể chuyển đổi giữa các môi trường mà không gặp lỗi
- [ ] `azd env list` hiển thị cả ba môi trường

### Bài tập 2: Quản lý Bí mật (10 phút)

**Mục tiêu**: Thực hành cấu hình an toàn với dữ liệu nhạy cảm

```bash
# Đặt bí mật (không hiển thị trong đầu ra)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Đặt cấu hình không bí mật
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Xem môi trường (các bí mật nên được che mờ)
azd env get-values

# Xác minh rằng các bí mật được lưu trữ
azd env get DB_PASSWORD  # Nên hiển thị giá trị thực tế
```

**Tiêu chí Thành công:**
- [ ] Bí mật được lưu mà không hiển thị trong terminal
- [ ] `azd env get-values` hiển thị các bí mật đã được ẩn
- [ ] Lệnh `azd env get <SECRET_NAME>` riêng lẻ truy xuất giá trị thực

## Bước tiếp theo

- [Dự án Đầu tiên](first-project.md) - Áp dụng cấu hình trong thực tế
- [Hướng dẫn Triển khai](../chapter-04-infrastructure/deployment-guide.md) - Sử dụng cấu hình cho triển khai
- [Cấp phát Tài nguyên](../chapter-04-infrastructure/provisioning.md) - Các cấu hình sẵn sàng cho sản xuất

## Tài liệu tham khảo

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Điều hướng Chương:**
- **📚 Trang Khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương hiện tại**: Chapter 3 - Configuration & Authentication
- **⬅️ Trước**: [Dự án Đầu tiên](first-project.md)
- **➡️ Tiếp theo**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Bài học tiếp theo**: [Dự án Đầu tiên](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Văn bản này đã được dịch bằng dịch vụ dịch thuật AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ gốc nên được coi là nguồn tham khảo chính thức. Đối với các thông tin quan trọng, nên sử dụng bản dịch do chuyên gia dịch thuật thực hiện. Chúng tôi không chịu trách nhiệm đối với bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->