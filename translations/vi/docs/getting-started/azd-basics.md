<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T21:36:38+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "vi"
}
-->
# AZD Cơ Bản - Hiểu Azure Developer CLI

## Giới thiệu

Bài học này giới thiệu bạn về Azure Developer CLI (azd), một công cụ dòng lệnh mạnh mẽ giúp tăng tốc hành trình từ phát triển cục bộ đến triển khai trên Azure. Bạn sẽ học các khái niệm cơ bản, tính năng chính, và hiểu cách azd đơn giản hóa việc triển khai ứng dụng cloud-native.

## Mục tiêu học tập

Sau bài học này, bạn sẽ:
- Hiểu Azure Developer CLI là gì và mục đích chính của nó
- Tìm hiểu các khái niệm cốt lõi về mẫu, môi trường, và dịch vụ
- Khám phá các tính năng chính bao gồm phát triển dựa trên mẫu và Infrastructure as Code
- Hiểu cấu trúc dự án và quy trình làm việc của azd
- Sẵn sàng cài đặt và cấu hình azd cho môi trường phát triển của bạn

## Kết quả học tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Giải thích vai trò của azd trong quy trình phát triển cloud hiện đại
- Xác định các thành phần của cấu trúc dự án azd
- Mô tả cách mẫu, môi trường, và dịch vụ hoạt động cùng nhau
- Hiểu lợi ích của Infrastructure as Code với azd
- Nhận biết các lệnh azd khác nhau và mục đích của chúng

## Azure Developer CLI (azd) là gì?

Azure Developer CLI (azd) là một công cụ dòng lệnh được thiết kế để tăng tốc hành trình từ phát triển cục bộ đến triển khai trên Azure. Nó đơn giản hóa quy trình xây dựng, triển khai, và quản lý các ứng dụng cloud-native trên Azure.

## Các khái niệm cốt lõi

### Mẫu
Mẫu là nền tảng của azd. Chúng bao gồm:
- **Mã ứng dụng** - Mã nguồn và các phụ thuộc của bạn
- **Định nghĩa hạ tầng** - Tài nguyên Azure được định nghĩa bằng Bicep hoặc Terraform
- **Tệp cấu hình** - Cài đặt và biến môi trường
- **Script triển khai** - Quy trình triển khai tự động

### Môi trường
Môi trường đại diện cho các mục tiêu triển khai khác nhau:
- **Phát triển** - Dành cho thử nghiệm và phát triển
- **Staging** - Môi trường tiền sản xuất
- **Sản xuất** - Môi trường sản xuất trực tiếp

Mỗi môi trường duy trì riêng:
- Nhóm tài nguyên Azure
- Cài đặt cấu hình
- Trạng thái triển khai

### Dịch vụ
Dịch vụ là các khối xây dựng của ứng dụng của bạn:
- **Frontend** - Ứng dụng web, SPAs
- **Backend** - APIs, microservices
- **Cơ sở dữ liệu** - Giải pháp lưu trữ dữ liệu
- **Lưu trữ** - Lưu trữ tệp và blob

## Các tính năng chính

### 1. Phát triển dựa trên mẫu
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Ngôn ngữ chuyên biệt của Azure
- **Terraform** - Công cụ hạ tầng đa đám mây
- **ARM Templates** - Mẫu Azure Resource Manager

### 3. Quy trình tích hợp
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Quản lý môi trường
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Cấu trúc dự án

Cấu trúc dự án azd điển hình:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Tệp cấu hình

### azure.yaml
Tệp cấu hình chính của dự án:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Cấu hình dành riêng cho môi trường:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Quy trình làm việc phổ biến

### Bắt đầu một dự án mới
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Chu kỳ phát triển
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### Quản lý nhiều môi trường
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Các lệnh điều hướng

### Khám phá
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Quản lý dự án
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Giám sát
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Các thực hành tốt nhất

### 1. Sử dụng tên có ý nghĩa
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Tận dụng mẫu
- Bắt đầu với các mẫu có sẵn
- Tùy chỉnh theo nhu cầu của bạn
- Tạo mẫu tái sử dụng cho tổ chức của bạn

### 3. Cách ly môi trường
- Sử dụng các môi trường riêng biệt cho dev/staging/prod
- Không bao giờ triển khai trực tiếp lên sản xuất từ máy cục bộ
- Sử dụng pipeline CI/CD cho triển khai sản xuất

### 4. Quản lý cấu hình
- Sử dụng biến môi trường cho dữ liệu nhạy cảm
- Lưu cấu hình trong hệ thống kiểm soát phiên bản
- Tài liệu hóa các cài đặt dành riêng cho môi trường

## Lộ trình học tập

### Người mới bắt đầu (Tuần 1-2)
1. Cài đặt azd và xác thực
2. Triển khai một mẫu đơn giản
3. Hiểu cấu trúc dự án
4. Học các lệnh cơ bản (up, down, deploy)

### Trung cấp (Tuần 3-4)
1. Tùy chỉnh mẫu
2. Quản lý nhiều môi trường
3. Hiểu mã hạ tầng
4. Thiết lập pipeline CI/CD

### Nâng cao (Tuần 5+)
1. Tạo mẫu tùy chỉnh
2. Mẫu hạ tầng nâng cao
3. Triển khai đa vùng
4. Cấu hình cấp doanh nghiệp

## Bước tiếp theo

- [Cài đặt & Thiết lập](installation.md) - Cài đặt và cấu hình azd
- [Dự án đầu tiên của bạn](first-project.md) - Hướng dẫn thực hành
- [Hướng dẫn cấu hình](configuration.md) - Tùy chọn cấu hình nâng cao

## Tài nguyên bổ sung

- [Tổng quan về Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Thư viện mẫu](https://azure.github.io/awesome-azd/)
- [Mẫu cộng đồng](https://github.com/Azure-Samples)

---

**Điều hướng**
- **Bài học trước**: [README](../../README.md)
- **Bài học tiếp theo**: [Cài đặt & Thiết lập](installation.md)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.