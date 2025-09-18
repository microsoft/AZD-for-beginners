<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-18T07:37:31+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "vi"
}
-->
# Dự Án Đầu Tiên Của Bạn - Hướng Dẫn Thực Hành

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Nền Tảng & Bắt Đầu Nhanh
- **⬅️ Trước**: [Cài Đặt & Thiết Lập](installation.md)
- **➡️ Tiếp Theo**: [Cấu Hình](configuration.md)
- **🚀 Chương Tiếp Theo**: [Chương 2: Phát Triển Ưu Tiên AI](../ai-foundry/azure-ai-foundry-integration.md)

## Giới Thiệu

Chào mừng bạn đến với dự án đầu tiên sử dụng Azure Developer CLI! Hướng dẫn thực hành toàn diện này sẽ cung cấp cho bạn một quy trình chi tiết để tạo, triển khai và quản lý một ứng dụng full-stack trên Azure bằng azd. Bạn sẽ làm việc với một ứng dụng todo thực tế bao gồm giao diện React, API backend Node.js, và cơ sở dữ liệu MongoDB.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Thành thạo quy trình khởi tạo dự án azd bằng các mẫu
- Hiểu cấu trúc dự án và các tệp cấu hình của Azure Developer CLI
- Thực hiện triển khai ứng dụng hoàn chỉnh lên Azure với việc cung cấp hạ tầng
- Áp dụng các chiến lược cập nhật và triển khai lại ứng dụng
- Quản lý nhiều môi trường cho phát triển và thử nghiệm
- Thực hiện các biện pháp dọn dẹp tài nguyên và quản lý chi phí

## Kết Quả Học Tập

Sau khi hoàn thành, bạn sẽ có khả năng:
- Tự khởi tạo và cấu hình dự án azd từ các mẫu
- Điều hướng và chỉnh sửa cấu trúc dự án azd một cách hiệu quả
- Triển khai ứng dụng full-stack lên Azure chỉ với một lệnh
- Khắc phục các vấn đề triển khai phổ biến và lỗi xác thực
- Quản lý nhiều môi trường Azure cho các giai đoạn triển khai khác nhau
- Thực hiện quy trình triển khai liên tục cho các bản cập nhật ứng dụng

## Bắt Đầu

### Danh Sách Kiểm Tra Yêu Cầu
- ✅ Đã cài đặt Azure Developer CLI ([Hướng Dẫn Cài Đặt](installation.md))
- ✅ Đã cài đặt và xác thực Azure CLI
- ✅ Đã cài đặt Git trên hệ thống của bạn
- ✅ Node.js 16+ (cho hướng dẫn này)
- ✅ Visual Studio Code (khuyến nghị)

### Xác Minh Thiết Lập
```bash
# Check azd installation
azd version
```
### Xác Minh Xác Thực Azure

```bash
az account show
```

### Kiểm Tra Phiên Bản Node.js
```bash
node --version
```

## Bước 1: Chọn và Khởi Tạo Một Mẫu

Hãy bắt đầu với mẫu ứng dụng todo phổ biến bao gồm giao diện React và API backend Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Điều Gì Vừa Xảy Ra?
- Đã tải xuống mã mẫu vào thư mục cục bộ của bạn
- Đã tạo tệp `azure.yaml` với các định nghĩa dịch vụ
- Đã thiết lập mã hạ tầng trong thư mục `infra/`
- Đã tạo cấu hình môi trường

## Bước 2: Khám Phá Cấu Trúc Dự Án

Hãy kiểm tra những gì azd đã tạo cho chúng ta:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Bạn sẽ thấy:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Các Tệp Quan Trọng Cần Hiểu

**azure.yaml** - Trái tim của dự án azd của bạn:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Định nghĩa hạ tầng:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Bước 3: Tùy Chỉnh Dự Án Của Bạn (Tùy Chọn)

Trước khi triển khai, bạn có thể tùy chỉnh ứng dụng:

### Chỉnh Sửa Giao Diện
```bash
# Open the React app component
code src/web/src/App.tsx
```

Thực hiện một thay đổi đơn giản:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Cấu Hình Biến Môi Trường
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Bước 4: Triển Khai Lên Azure

Bây giờ là phần thú vị - triển khai mọi thứ lên Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Điều Gì Xảy Ra Trong Quá Trình Triển Khai?

Lệnh `azd up` thực hiện các bước sau:
1. **Cung Cấp** (`azd provision`) - Tạo tài nguyên Azure
2. **Đóng Gói** - Xây dựng mã ứng dụng của bạn
3. **Triển Khai** (`azd deploy`) - Triển khai mã lên tài nguyên Azure

### Kết Quả Dự Kiến
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Bước 5: Kiểm Tra Ứng Dụng Của Bạn

### Truy Cập Ứng Dụng Của Bạn
Nhấp vào URL được cung cấp trong kết quả triển khai, hoặc lấy nó bất cứ lúc nào:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Kiểm Tra Ứng Dụng Todo
1. **Thêm một mục todo** - Nhấp vào "Add Todo" và nhập một nhiệm vụ
2. **Đánh dấu hoàn thành** - Tích vào các mục đã hoàn thành
3. **Xóa mục** - Loại bỏ các mục không cần thiết

### Giám Sát Ứng Dụng Của Bạn
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Bước 6: Thực Hiện Thay Đổi và Triển Khai Lại

Hãy thực hiện một thay đổi và xem việc cập nhật dễ dàng như thế nào:

### Chỉnh Sửa API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Thêm một header phản hồi tùy chỉnh:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Chỉ Triển Khai Thay Đổi Mã
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Bước 7: Quản Lý Nhiều Môi Trường

Tạo một môi trường thử nghiệm để kiểm tra thay đổi trước khi đưa vào sản xuất:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### So Sánh Môi Trường
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Bước 8: Dọn Dẹp Tài Nguyên

Khi bạn đã hoàn tất thử nghiệm, hãy dọn dẹp để tránh các chi phí phát sinh:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Những Gì Bạn Đã Học Được

Chúc mừng! Bạn đã thành công:
- Khởi tạo một dự án azd từ mẫu
- Khám phá cấu trúc dự án và các tệp quan trọng
- Triển khai một ứng dụng full-stack lên Azure
- Thực hiện thay đổi mã và triển khai lại
- Quản lý nhiều môi trường
- Dọn dẹp tài nguyên

## Khắc Phục Các Vấn Đề Phổ Biến

### Lỗi Xác Thực
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Lỗi Triển Khai
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Xung Đột Tên Tài Nguyên
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Vấn Đề Cổng/Mạng
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Bước Tiếp Theo

Bây giờ bạn đã hoàn thành dự án đầu tiên, hãy khám phá các chủ đề nâng cao sau:

### 1. Tùy Chỉnh Hạ Tầng
- [Hạ Tầng dưới dạng Mã](../deployment/provisioning.md)
- [Thêm cơ sở dữ liệu, lưu trữ, và các dịch vụ khác](../deployment/provisioning.md#adding-services)

### 2. Thiết Lập CI/CD
- [Tích Hợp GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Thực Hành Tốt Nhất Cho Sản Xuất
- [Cấu hình bảo mật](../deployment/best-practices.md#security)
- [Tối ưu hóa hiệu suất](../deployment/best-practices.md#performance)
- [Giám sát và ghi nhật ký](../deployment/best-practices.md#monitoring)

### 4. Khám Phá Thêm Các Mẫu
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Tài Nguyên Bổ Sung

### Tài Liệu Học Tập
- [Tài Liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Trung Tâm Kiến Trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Khung Kiến Trúc Tốt của Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Cộng Đồng & Hỗ Trợ
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Cộng Đồng Nhà Phát Triển Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mẫu & Ví Dụ
- [Thư Viện Mẫu Chính Thức](https://azure.github.io/awesome-azd/)
- [Mẫu Cộng Đồng](https://github.com/Azure-Samples/azd-templates)
- [Mẫu Doanh Nghiệp](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Chúc mừng bạn đã hoàn thành dự án azd đầu tiên của mình!** Bây giờ bạn đã sẵn sàng xây dựng và triển khai các ứng dụng tuyệt vời trên Azure với sự tự tin.

---

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Nền Tảng & Bắt Đầu Nhanh
- **⬅️ Trước**: [Cài Đặt & Thiết Lập](installation.md)
- **➡️ Tiếp Theo**: [Cấu Hình](configuration.md)
- **🚀 Chương Tiếp Theo**: [Chương 2: Phát Triển Ưu Tiên AI](../ai-foundry/azure-ai-foundry-integration.md)
- **Bài Học Tiếp Theo**: [Hướng Dẫn Triển Khai](../deployment/deployment-guide.md)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.