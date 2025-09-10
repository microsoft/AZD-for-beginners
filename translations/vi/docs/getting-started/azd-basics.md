<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b0f9bb7d2efce4196ceab8e3269080d3",
  "translation_date": "2025-09-10T13:27:54+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "vi"
}
-->
# AZD Cơ Bản - Tìm Hiểu Azure Developer CLI

## Giới Thiệu

Bài học này giới thiệu bạn về Azure Developer CLI (azd), một công cụ dòng lệnh mạnh mẽ giúp tăng tốc hành trình từ phát triển cục bộ đến triển khai trên Azure. Bạn sẽ học các khái niệm cơ bản, tính năng chính, và hiểu cách azd đơn giản hóa việc triển khai ứng dụng cloud-native.

## Mục Tiêu Học Tập

Sau khi hoàn thành bài học này, bạn sẽ:
- Hiểu Azure Developer CLI là gì và mục đích chính của nó
- Tìm hiểu các khái niệm cốt lõi về mẫu, môi trường, và dịch vụ
- Khám phá các tính năng chính bao gồm phát triển dựa trên mẫu và Infrastructure as Code
- Hiểu cấu trúc dự án và quy trình làm việc của azd
- Sẵn sàng cài đặt và cấu hình azd cho môi trường phát triển của bạn

## Kết Quả Học Tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Giải thích vai trò của azd trong quy trình phát triển cloud hiện đại
- Xác định các thành phần của cấu trúc dự án azd
- Mô tả cách mẫu, môi trường, và dịch vụ hoạt động cùng nhau
- Hiểu lợi ích của Infrastructure as Code với azd
- Nhận biết các lệnh azd khác nhau và mục đích của chúng

## Azure Developer CLI (azd) là gì?

Azure Developer CLI (azd) là một công cụ dòng lệnh được thiết kế để tăng tốc hành trình từ phát triển cục bộ đến triển khai trên Azure. Nó đơn giản hóa quy trình xây dựng, triển khai, và quản lý các ứng dụng cloud-native trên Azure.

## Các Khái Niệm Cốt Lõi

### Mẫu
Mẫu là nền tảng của azd. Chúng bao gồm:
- **Mã ứng dụng** - Mã nguồn và các phụ thuộc của bạn
- **Định nghĩa hạ tầng** - Tài nguyên Azure được định nghĩa bằng Bicep hoặc Terraform
- **Tệp cấu hình** - Cài đặt và biến môi trường
- **Script triển khai** - Quy trình triển khai tự động

### Môi Trường
Môi trường đại diện cho các mục tiêu triển khai khác nhau:
- **Phát triển** - Dành cho thử nghiệm và phát triển
- **Staging** - Môi trường tiền sản xuất
- **Sản xuất** - Môi trường sản xuất trực tiếp

Mỗi môi trường duy trì riêng:
- Nhóm tài nguyên Azure
- Cài đặt cấu hình
- Trạng thái triển khai

### Dịch Vụ
Dịch vụ là các khối xây dựng của ứng dụng của bạn:
- **Frontend** - Ứng dụng web, SPAs
- **Backend** - APIs, microservices
- **Database** - Giải pháp lưu trữ dữ liệu
- **Storage** - Lưu trữ file và blob

## Các Tính Năng Chính

### 1. Phát Triển Dựa Trên Mẫu
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

### 3. Quy Trình Tích Hợp
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Quản Lý Môi Trường
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Cấu Trúc Dự Án

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

## 🔧 Tệp Cấu Hình

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

## 🎪 Quy Trình Thông Dụng

### Bắt Đầu Một Dự Án Mới
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Chu Kỳ Phát Triển
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
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Hiểu `azd down --force --purge`
Lệnh `azd down --force --purge` là cách mạnh mẽ để hoàn toàn xóa bỏ môi trường azd và tất cả các tài nguyên liên quan. Đây là phân tích về từng cờ:
```
--force
```
- Bỏ qua các lời nhắc xác nhận.
- Hữu ích cho tự động hóa hoặc scripting khi không thể nhập thủ công.
- Đảm bảo quá trình xóa diễn ra mà không bị gián đoạn, ngay cả khi CLI phát hiện sự không nhất quán.

```
--purge
```
Xóa **tất cả metadata liên quan**, bao gồm:
Trạng thái môi trường
Thư mục `.azure` cục bộ
Thông tin triển khai được lưu trữ
Ngăn azd "ghi nhớ" các triển khai trước đó, điều này có thể gây ra các vấn đề như nhóm tài nguyên không khớp hoặc tham chiếu registry cũ.

### Tại Sao Sử Dụng Cả Hai?
Khi bạn gặp khó khăn với `azd up` do trạng thái còn sót lại hoặc triển khai một phần, sự kết hợp này đảm bảo một **khởi đầu sạch sẽ**.

Nó đặc biệt hữu ích sau khi xóa tài nguyên thủ công trong Azure portal hoặc khi chuyển đổi mẫu, môi trường, hoặc quy ước đặt tên nhóm tài nguyên.

### Quản Lý Nhiều Môi Trường
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

## 🧭 Các Lệnh Điều Hướng

### Khám Phá
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Quản Lý Dự Án
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Giám Sát
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Các Thực Hành Tốt Nhất

### 1. Sử Dụng Tên Có Ý Nghĩa
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Tận Dụng Mẫu
- Bắt đầu với các mẫu có sẵn
- Tùy chỉnh theo nhu cầu của bạn
- Tạo các mẫu có thể tái sử dụng cho tổ chức của bạn

### 3. Cách Ly Môi Trường
- Sử dụng các môi trường riêng biệt cho dev/staging/prod
- Không bao giờ triển khai trực tiếp lên sản xuất từ máy cục bộ
- Sử dụng các pipeline CI/CD cho triển khai sản xuất

### 4. Quản Lý Cấu Hình
- Sử dụng biến môi trường cho dữ liệu nhạy cảm
- Lưu cấu hình trong kiểm soát phiên bản
- Tài liệu hóa các cài đặt dành riêng cho môi trường

## Lộ Trình Học Tập

### Người Mới (Tuần 1-2)
1. Cài đặt azd và xác thực
2. Triển khai một mẫu đơn giản
3. Hiểu cấu trúc dự án
4. Học các lệnh cơ bản (up, down, deploy)

### Trung Cấp (Tuần 3-4)
1. Tùy chỉnh mẫu
2. Quản lý nhiều môi trường
3. Hiểu mã hạ tầng
4. Thiết lập các pipeline CI/CD

### Nâng Cao (Tuần 5+)
1. Tạo mẫu tùy chỉnh
2. Các mẫu hạ tầng nâng cao
3. Triển khai đa vùng
4. Cấu hình cấp doanh nghiệp

## Bước Tiếp Theo

- [Cài Đặt & Cấu Hình](installation.md) - Cài đặt và cấu hình azd
- [Dự Án Đầu Tiên Của Bạn](first-project.md) - Hướng dẫn thực hành
- [Hướng Dẫn Cấu Hình](configuration.md) - Các tùy chọn cấu hình nâng cao

## Tài Nguyên Bổ Sung

- [Tổng Quan Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Thư Viện Mẫu](https://azure.github.io/awesome-azd/)
- [Mẫu Cộng Đồng](https://github.com/Azure-Samples)

---

**Điều Hướng**
- **Bài Học Trước**: [README](../../README.md)
- **Bài Học Tiếp Theo**: [Cài Đặt & Cấu Hình](installation.md)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn tham khảo chính thức. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp từ con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.