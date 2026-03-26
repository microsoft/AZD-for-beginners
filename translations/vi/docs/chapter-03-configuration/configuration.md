# Hướng Dẫn Cấu Hình

**Điều hướng chương:**
- **📚 Course Home**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Current Chapter**: Chương 3 - Cấu hình & Xác thực
- **⬅️ Previous**: [Dự án đầu tiên của bạn](first-project.md)
- **➡️ Next**: [Hướng dẫn Triển khai](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chương 4: Hạ tầng như mã](../chapter-04-infrastructure/deployment-guide.md)

## Giới thiệu

Hướng dẫn toàn diện này bao quát mọi khía cạnh của việc cấu hình Azure Developer CLI cho các luồng làm việc phát triển và triển khai tối ưu. Bạn sẽ học về hệ thống phân cấp cấu hình, quản lý môi trường, các phương pháp xác thực, và các mô hình cấu hình nâng cao giúp triển khai Azure hiệu quả và an toàn hơn.

## Mục tiêu học tập

Khi kết thúc bài học này, bạn sẽ:
- Thành thạo hệ thống phân cấp cấu hình azd và hiểu cách ưu tiên các thiết lập
- Cấu hình thiết lập toàn cục và theo dự án một cách hiệu quả
- Quản lý nhiều môi trường với các cấu hình khác nhau
- Triển khai các mẫu xác thực và ủy quyền an toàn
- Hiểu các mẫu cấu hình nâng cao cho các tình huống phức tạp

## Kết quả học tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Cấu hình azd cho các luồng làm việc phát triển tối ưu
- Thiết lập và quản lý nhiều môi trường triển khai
- Áp dụng các thực hành quản lý cấu hình an toàn
- Khắc phục sự cố liên quan đến cấu hình
- Tùy chỉnh hành vi azd cho các yêu cầu tổ chức cụ thể

Hướng dẫn toàn diện này bao quát mọi khía cạnh của việc cấu hình Azure Developer CLI cho các luồng làm việc phát triển và triển khai tối ưu.

## Hiểu về tác nhân AI trong một dự án azd

Nếu bạn mới với các tác nhân AI, đây là một cách đơn giản để nghĩ về chúng trong thế giới azd.

### Tác nhân là gì?

Một tác nhân là một phần mềm có thể nhận một yêu cầu, suy luận về nó, và thực hiện các hành động — thường bằng cách gọi một mô hình AI, tra cứu dữ liệu, hoặc gọi các dịch vụ khác. Trong một dự án azd, một tác nhân chỉ là một **dịch vụ** khác bên cạnh frontend web hoặc backend API của bạn.

### Tác nhân phù hợp như thế nào trong cấu trúc dự án azd

Một dự án azd được tạo thành từ ba lớp: **cơ sở hạ tầng**, **mã nguồn**, và **cấu hình**. Tác nhân kết nối vào các lớp này giống như bất kỳ dịch vụ nào khác:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Cơ sở hạ tầng** (`infra/`) | Cấp phát một ứng dụng web và cơ sở dữ liệu | Cấp phát một endpoint mô hình AI, chỉ mục tìm kiếm, hoặc host cho tác nhân |
| **Mã nguồn** (`src/`) | Chứa mã nguồn frontend và API của bạn | Chứa logic tác nhân và định nghĩa prompt |
| **Cấu hình** (`azure.yaml`) | Liệt kê các dịch vụ và nơi lưu trữ của chúng | Liệt kê tác nhân của bạn như một dịch vụ, trỏ tới mã nguồn và host của nó |

### Vai trò của `azure.yaml`

Bạn không cần phải ghi nhớ cú pháp ngay bây giờ. Về mặt khái niệm, `azure.yaml` là tệp nơi bạn nói với azd: *"Đây là các dịch vụ tạo nên ứng dụng của tôi, và đây là nơi tìm mã nguồn của chúng."*

Khi dự án của bạn bao gồm một tác nhân AI, `azure.yaml` đơn giản liệt kê tác nhân đó như một trong các dịch vụ. azd sau đó biết cách cấp phát hạ tầng thích hợp (như một Microsoft Foundry Models endpoint hoặc một Container App để host tác nhân) và triển khai mã tác nhân của bạn — giống như với một ứng dụng web hoặc API.

Điều này có nghĩa là không có gì hoàn toàn mới để học. Nếu bạn hiểu cách azd quản lý một dịch vụ web, bạn đã hiểu cách nó quản lý một tác nhân.

## Hệ thống phân cấp cấu hình

azd sử dụng một hệ thống cấu hình phân cấp:
1. **Command-line flags** (ưu tiên cao nhất)
2. **Biến môi trường**
3. **Cấu hình dự án cục bộ** (`.azd/config.json`)
4. **Cấu hình người dùng toàn cục** (`~/.azd/config.json`)
5. **Giá trị mặc định** (ưu tiên thấp nhất)

## Cấu hình toàn cục

### Setting Global Defaults
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

### Cài đặt toàn cục phổ biến
```bash
# Tùy chọn phát triển
azd config set alpha.enable true                    # Bật các tính năng alpha
azd config set telemetry.enabled false             # Vô hiệu hóa telemetri
azd config set output.format json                  # Đặt định dạng đầu ra

# Cài đặt bảo mật
azd config set auth.useAzureCliCredential true     # Sử dụng Azure CLI để xác thực
azd config set tls.insecure false                  # Bắt buộc xác minh TLS

# Tối ưu hiệu suất
azd config set provision.parallelism 5             # Tạo tài nguyên song song
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

### Tùy chọn cấu hình dịch vụ

#### Loại host
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

#### Cài đặt riêng theo ngôn ngữ
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

### Tạo môi trường
```bash
# Tạo một môi trường mới
azd env new development

# Tạo với vị trí cụ thể
azd env new staging --location "westus2"

# Tạo từ mẫu
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Cấu hình môi trường
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

### Biến môi trường
```bash
# Thiết lập các biến cụ thể cho môi trường
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

### Mẫu môi trường
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
# Sử dụng thông tin đăng nhập Azure CLI (mặc định)
azd config set auth.useAzureCliCredential true

# Đăng nhập với tenant cụ thể
az login --tenant <tenant-id>

# Đặt đăng ký mặc định
az account set --subscription <subscription-id>
```

### Xác thực Service Principal
Cho pipeline CI/CD:
```bash
# Đặt biến môi trường
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Hoặc cấu hình trực tiếp
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Danh tính được quản lý
Cho các môi trường được host trên Azure:
```bash
# Bật xác thực danh tính được quản lý
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
Đối với các dự án Terraform, cấu hình trong `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Cấu hình Triển khai

### Cấu hình Xây dựng
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

### Đặt tên tài nguyên tuỳ chỉnh
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

## 🎯 Cấu hình theo môi trường

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

## 🔍 Kiểm tra Cấu hình

### Xác thực Cấu hình
```bash
# Kiểm tra cú pháp cấu hình
azd config validate

# Kiểm tra các biến môi trường
azd env get-values

# Xác thực hạ tầng
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

## 🎓 Những thực hành tốt nhất

### 1. Sử dụng biến môi trường
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Sắp xếp các tệp cấu hình
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

### 3. Cân nhắc về Quản lý Phiên bản
```bash
# .gitignore
.azure/*/config.json         # Cấu hình môi trường (chứa các ID tài nguyên)
.azure/*/.env               # Biến môi trường (có thể chứa thông tin bí mật)
.env                        # Tập tin môi trường cục bộ
```

### 4. Tài liệu Cấu hình
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

## 🎯 Bài tập Thực hành

### Bài tập 1: Cấu hình đa môi trường (15 phút)

**Mục tiêu**: Tạo và cấu hình ba môi trường với các thiết lập khác nhau

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

**Tiêu chí Thành công:**
- [ ] Tạo thành công ba môi trường
- [ ] Mỗi môi trường có cấu hình riêng biệt
- [ ] Có thể chuyển đổi giữa các môi trường mà không gặp lỗi
- [ ] `azd env list` hiển thị cả ba môi trường

### Bài tập 2: Quản lý bí mật (10 phút)

**Mục tiêu**: Thực hành cấu hình an toàn với dữ liệu nhạy cảm

```bash
# Đặt bí mật (không hiển thị trong đầu ra)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Đặt cấu hình không bí mật
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Xem môi trường (các bí mật nên được ẩn)
azd env get-values

# Xác minh các bí mật đã được lưu trữ
azd env get DB_PASSWORD  # Nên hiển thị giá trị thực tế
```

**Tiêu chí Thành công:**
- [ ] Bí mật được lưu mà không hiển thị trong terminal
- [ ] `azd env get-values` hiển thị các bí mật đã được che mờ
- [ ] `azd env get <SECRET_NAME>` truy xuất giá trị thực tế của từng bí mật

## Bước tiếp theo

- [Dự án đầu tiên của bạn](first-project.md) - Áp dụng cấu hình vào thực tiễn
- [Hướng dẫn Triển khai](../chapter-04-infrastructure/deployment-guide.md) - Sử dụng cấu hình cho việc triển khai
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Cấu hình sẵn sàng cho sản xuất

## Tham khảo

- [Tài liệu tham khảo Cấu hình azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Lược đồ azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Biến môi trường](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Điều hướng chương:**
- **📚 Course Home**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Current Chapter**: Chương 3 - Cấu hình & Xác thực
- **⬅️ Previous**: [Dự án đầu tiên của bạn](first-project.md)
- **➡️ Next Chapter**: [Chương 4: Hạ tầng như mã](../chapter-04-infrastructure/deployment-guide.md)
- **Bài học tiếp theo**: [Dự án đầu tiên của bạn](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->