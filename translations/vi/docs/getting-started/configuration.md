<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-22T08:41:07+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "vi"
}
-->
# Hướng Dẫn Cấu Hình

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Dành Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 3 - Cấu Hình & Xác Thực
- **⬅️ Trước**: [Dự Án Đầu Tiên Của Bạn](first-project.md)
- **➡️ Tiếp Theo**: [Hướng Dẫn Triển Khai](../deployment/deployment-guide.md)
- **🚀 Chương Tiếp Theo**: [Chương 4: Hạ Tầng dưới dạng Mã](../deployment/deployment-guide.md)

## Giới Thiệu

Hướng dẫn toàn diện này bao gồm tất cả các khía cạnh của việc cấu hình Azure Developer CLI để tối ưu hóa quy trình phát triển và triển khai. Bạn sẽ tìm hiểu về hệ thống cấu hình, quản lý môi trường, phương pháp xác thực, và các mẫu cấu hình nâng cao giúp triển khai Azure hiệu quả và an toàn.

## Mục Tiêu Học Tập

Kết thúc bài học này, bạn sẽ:
- Nắm vững hệ thống cấu hình azd và hiểu cách ưu tiên các thiết lập
- Cấu hình hiệu quả các thiết lập toàn cầu và cụ thể cho dự án
- Quản lý nhiều môi trường với các cấu hình khác nhau
- Áp dụng các mẫu xác thực và ủy quyền an toàn
- Hiểu các mẫu cấu hình nâng cao cho các tình huống phức tạp

## Kết Quả Học Tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Cấu hình azd để tối ưu hóa quy trình phát triển
- Thiết lập và quản lý nhiều môi trường triển khai
- Áp dụng các thực hành quản lý cấu hình an toàn
- Khắc phục sự cố liên quan đến cấu hình
- Tùy chỉnh hành vi của azd theo yêu cầu của tổ chức

Hướng dẫn toàn diện này bao gồm tất cả các khía cạnh của việc cấu hình Azure Developer CLI để tối ưu hóa quy trình phát triển và triển khai.

## Hệ Thống Cấu Hình

azd sử dụng một hệ thống cấu hình theo thứ tự ưu tiên:
1. **Cờ dòng lệnh** (ưu tiên cao nhất)
2. **Biến môi trường**
3. **Cấu hình dự án cục bộ** (`.azd/config.json`)
4. **Cấu hình người dùng toàn cầu** (`~/.azd/config.json`)
5. **Giá trị mặc định** (ưu tiên thấp nhất)

## Cấu Hình Toàn Cầu

### Thiết Lập Giá Trị Mặc Định Toàn Cầu
```bash
# Đặt đăng ký mặc định
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Đặt vị trí mặc định
azd config set defaults.location "eastus2"

# Đặt quy ước đặt tên nhóm tài nguyên mặc định
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Xem tất cả cấu hình toàn cầu
azd config list

# Xóa một cấu hình
azd config unset defaults.location
```

### Các Thiết Lập Toàn Cầu Thông Dụng
```bash
# Tùy chọn phát triển
azd config set alpha.enable true                    # Bật các tính năng alpha
azd config set telemetry.enabled false             # Tắt thu thập dữ liệu
azd config set output.format json                  # Đặt định dạng đầu ra

# Cài đặt bảo mật
azd config set auth.useAzureCliCredential true     # Sử dụng Azure CLI để xác thực
azd config set tls.insecure false                  # Bắt buộc xác minh TLS

# Tinh chỉnh hiệu suất
azd config set provision.parallelism 5             # Tạo tài nguyên song song
azd config set deploy.timeout 30m                  # Thời gian chờ triển khai
```

## 🏗️ Cấu Hình Dự Án

### Cấu Trúc azure.yaml
Tệp `azure.yaml` là trung tâm của dự án azd của bạn:

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

### Tùy Chọn Cấu Hình Dịch Vụ

#### Loại Máy Chủ
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

#### Cài Đặt Theo Ngôn Ngữ
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

## 🌟 Quản Lý Môi Trường

### Tạo Môi Trường
```bash
# Tạo một môi trường mới
azd env new development

# Tạo với vị trí cụ thể
azd env new staging --location "westus2"

# Tạo từ mẫu
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Cấu Hình Môi Trường
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

### Biến Môi Trường
```bash
# Đặt các biến môi trường cụ thể
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
# (nên không trả về gì)
```

### Mẫu Môi Trường
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

## 🔐 Cấu Hình Xác Thực

### Tích Hợp Azure CLI
```bash
# Sử dụng thông tin xác thực Azure CLI (mặc định)
azd config set auth.useAzureCliCredential true

# Đăng nhập với tenant cụ thể
az login --tenant <tenant-id>

# Đặt đăng ký mặc định
az account set --subscription <subscription-id>
```

### Xác Thực Service Principal
Dành cho các pipeline CI/CD:
```bash
# Đặt các biến môi trường
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Hoặc cấu hình trực tiếp
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Dành cho các môi trường được lưu trữ trên Azure:
```bash
# Bật xác thực danh tính được quản lý
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Cấu Hình Hạ Tầng

### Tham Số Bicep
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

### Cấu Hình Terraform
Dành cho các dự án Terraform, cấu hình trong `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Cấu Hình Triển Khai

### Cấu Hình Build
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

### Cấu Hình Docker
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

## 🔧 Cấu Hình Nâng Cao

### Tùy Chỉnh Tên Tài Nguyên
```bash
# Đặt quy ước đặt tên
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Cấu Hình Mạng
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Cấu Hình Giám Sát
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

## 🎯 Cấu Hình Theo Môi Trường

### Môi Trường Phát Triển
```bash
# .azure/phát_triển/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Môi Trường Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Môi Trường Sản Xuất
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Xác Thực Cấu Hình

### Xác Thực Cấu Hình
```bash
# Kiểm tra cú pháp cấu hình
azd config validate

# Kiểm tra các biến môi trường
azd env get-values

# Xác minh cơ sở hạ tầng
azd provision --dry-run
```

### Script Cấu Hình
Tạo script xác thực trong `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Kiểm tra các biến môi trường cần thiết
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Xác thực cú pháp azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Thực Hành Tốt Nhất

### 1. Sử Dụng Biến Môi Trường
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Tổ Chức Tệp Cấu Hình
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

### 3. Cân Nhắc Khi Sử Dụng Quản Lý Phiên Bản
```bash
# .gitignore
.azure/*/config.json         # Cấu hình môi trường (chứa ID tài nguyên)
.azure/*/.env               # Biến môi trường (có thể chứa thông tin bí mật)
.env                        # Tệp môi trường cục bộ
```

### 4. Tài Liệu Cấu Hình
Ghi lại cấu hình của bạn trong `CONFIG.md`:
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

## 🎯 Bài Tập Thực Hành

### Bài Tập 1: Cấu Hình Đa Môi Trường (15 phút)

**Mục Tiêu**: Tạo và cấu hình ba môi trường với các thiết lập khác nhau

```bash
# Tạo môi trường phát triển
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Tạo môi trường dàn dựng
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

**Tiêu Chí Thành Công:**
- [ ] Ba môi trường được tạo thành công
- [ ] Mỗi môi trường có cấu hình riêng biệt
- [ ] Có thể chuyển đổi giữa các môi trường mà không gặp lỗi
- [ ] `azd env list` hiển thị cả ba môi trường

### Bài Tập 2: Quản Lý Bí Mật (10 phút)

**Mục Tiêu**: Thực hành cấu hình an toàn với dữ liệu nhạy cảm

```bash
# Đặt bí mật (không hiển thị trong đầu ra)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Đặt cấu hình không bí mật
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Xem môi trường (các bí mật nên được che giấu)
azd env get-values

# Xác minh các bí mật được lưu trữ
azd env get DB_PASSWORD  # Nên hiển thị giá trị thực tế
```

**Tiêu Chí Thành Công:**
- [ ] Bí mật được lưu trữ mà không hiển thị trên terminal
- [ ] `azd env get-values` hiển thị bí mật đã được che giấu
- [ ] Lệnh riêng lẻ `azd env get <SECRET_NAME>` lấy giá trị thực tế

## Bước Tiếp Theo

- [Dự Án Đầu Tiên Của Bạn](first-project.md) - Áp dụng cấu hình vào thực tế
- [Hướng Dẫn Triển Khai](../deployment/deployment-guide.md) - Sử dụng cấu hình để triển khai
- [Cung Cấp Tài Nguyên](../deployment/provisioning.md) - Cấu hình sẵn sàng cho sản xuất

## Tài Liệu Tham Khảo

- [Tài Liệu Tham Khảo Cấu Hình azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Biến Môi Trường](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Dành Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 3 - Cấu Hình & Xác Thực
- **⬅️ Trước**: [Dự Án Đầu Tiên Của Bạn](first-project.md)
- **➡️ Chương Tiếp Theo**: [Chương 4: Hạ Tầng dưới dạng Mã](../deployment/deployment-guide.md)
- **Bài Học Tiếp Theo**: [Dự Án Đầu Tiên Của Bạn](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->