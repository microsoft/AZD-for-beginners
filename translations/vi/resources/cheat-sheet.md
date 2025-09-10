<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "04291031a6a1cc0dc4064dcb9c543584",
  "translation_date": "2025-09-09T22:46:19+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "vi"
}
-->
# Bảng Lệnh Tóm Tắt - Các Lệnh AZD Cần Thiết

## Giới Thiệu

Bảng lệnh tóm tắt toàn diện này cung cấp tham khảo nhanh cho các lệnh Azure Developer CLI được sử dụng phổ biến nhất, được tổ chức theo danh mục với các ví dụ thực tế. Hoàn hảo để tra cứu nhanh trong quá trình phát triển, khắc phục sự cố, và các hoạt động hàng ngày với các dự án azd.

## Mục Tiêu Học Tập

Khi sử dụng bảng lệnh này, bạn sẽ:
- Có quyền truy cập ngay lập tức vào các lệnh và cú pháp Azure Developer CLI cần thiết
- Hiểu cách tổ chức lệnh theo danh mục chức năng và trường hợp sử dụng
- Tham khảo các ví dụ thực tế cho các tình huống phát triển và triển khai phổ biến
- Truy cập các lệnh khắc phục sự cố để giải quyết vấn đề nhanh chóng
- Tìm kiếm các tùy chọn cấu hình và tùy chỉnh nâng cao một cách hiệu quả
- Xác định các lệnh quản lý môi trường và quy trình làm việc đa môi trường

## Kết Quả Học Tập

Với việc thường xuyên tham khảo bảng lệnh này, bạn sẽ có thể:
- Thực hiện các lệnh azd một cách tự tin mà không cần tham khảo tài liệu đầy đủ
- Nhanh chóng giải quyết các vấn đề phổ biến bằng cách sử dụng các lệnh chẩn đoán phù hợp
- Quản lý hiệu quả nhiều môi trường và các tình huống triển khai
- Áp dụng các tính năng và tùy chọn cấu hình nâng cao của azd khi cần thiết
- Khắc phục sự cố triển khai bằng cách sử dụng các chuỗi lệnh có hệ thống
- Tối ưu hóa quy trình làm việc thông qua việc sử dụng hiệu quả các phím tắt và tùy chọn của azd

## Các Lệnh Bắt Đầu

### Xác Thực
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Khởi Tạo Dự Án
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## Các Lệnh Triển Khai Cốt Lõi

### Quy Trình Triển Khai Hoàn Chỉnh
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### Chỉ Triển Khai Hạ Tầng
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Chỉ Triển Khai Ứng Dụng
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Xây Dựng và Đóng Gói
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Quản Lý Môi Trường

### Hoạt Động Môi Trường
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### Biến Môi Trường
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ Các Lệnh Cấu Hình

### Cấu Hình Toàn Cục
```bash
# List all configuration
azd config list

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### Cấu Hình Dự Án
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Giám Sát và Nhật Ký

### Nhật Ký Ứng Dụng
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### Giám Sát
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Các Lệnh Bảo Trì

### Dọn Dẹp
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### Cập Nhật
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Các Lệnh Nâng Cao

### Pipeline và CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Quản Lý Hạ Tầng
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Quản Lý Dịch Vụ
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Quy Trình Làm Việc Nhanh

### Quy Trình Phát Triển
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### Quy Trình Làm Việc Đa Môi Trường
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### Quy Trình Khắc Phục Sự Cố
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 Các Lệnh Gỡ Lỗi

### Thông Tin Gỡ Lỗi
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### Gỡ Lỗi Mẫu
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Các Lệnh Tệp và Thư Mục

### Cấu Trúc Dự Án
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Định Dạng Kết Quả

### Kết Quả JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Kết Quả Dạng Bảng
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Các Kết Hợp Lệnh Phổ Biến

### Script Kiểm Tra Sức Khỏe
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Xác Thực Triển Khai
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### So Sánh Môi Trường
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script Dọn Dẹp Tài Nguyên
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Biến Môi Trường

### Các Biến Môi Trường Phổ Biến
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Các Lệnh Khẩn Cấp

### Sửa Lỗi Nhanh
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### Các Lệnh Khôi Phục
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Mẹo Chuyên Nghiệp

### Bí Danh Cho Quy Trình Làm Việc Nhanh Hơn
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Phím Tắt Chức Năng
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Trợ Giúp và Tài Liệu

### Nhận Trợ Giúp
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### Liên Kết Tài Liệu
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Mẹo**: Đánh dấu bảng lệnh này và sử dụng `Ctrl+F` để nhanh chóng tìm các lệnh bạn cần!

---

**Điều Hướng**
- **Bài Học Trước**: [Kiểm Tra Trước Khi Triển Khai](../docs/pre-deployment/preflight-checks.md)
- **Bài Học Tiếp Theo**: [Thuật Ngữ](glossary.md)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.