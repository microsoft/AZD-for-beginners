<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-22T08:44:35+00:00",
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
- **🚀 Chương Tiếp Theo**: [Chương 2: Phát Triển Ưu Tiên AI](../microsoft-foundry/microsoft-foundry-integration.md)

## Giới Thiệu

Chào mừng bạn đến với dự án đầu tiên sử dụng Azure Developer CLI! Hướng dẫn thực hành toàn diện này sẽ cung cấp cho bạn một quy trình chi tiết để tạo, triển khai và quản lý một ứng dụng full-stack trên Azure bằng azd. Bạn sẽ làm việc với một ứng dụng todo thực tế bao gồm giao diện React, API backend Node.js và cơ sở dữ liệu MongoDB.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Thành thạo quy trình khởi tạo dự án azd bằng các mẫu
- Hiểu cấu trúc dự án và các tệp cấu hình của Azure Developer CLI
- Thực hiện triển khai ứng dụng hoàn chỉnh lên Azure với việc cung cấp hạ tầng
- Áp dụng các chiến lược cập nhật và triển khai lại ứng dụng
- Quản lý nhiều môi trường cho phát triển và thử nghiệm
- Thực hiện dọn dẹp tài nguyên và quản lý chi phí

## Kết Quả Học Tập

Sau khi hoàn thành, bạn sẽ có thể:
- Tự khởi tạo và cấu hình dự án azd từ các mẫu
- Điều hướng và chỉnh sửa cấu trúc dự án azd một cách hiệu quả
- Triển khai ứng dụng full-stack lên Azure chỉ với một lệnh
- Khắc phục các vấn đề triển khai phổ biến và lỗi xác thực
- Quản lý nhiều môi trường Azure cho các giai đoạn triển khai khác nhau
- Áp dụng quy trình triển khai liên tục cho các bản cập nhật ứng dụng

## Bắt Đầu

### Danh Sách Kiểm Tra Yêu Cầu
- ✅ Đã cài đặt Azure Developer CLI ([Hướng Dẫn Cài Đặt](installation.md))
- ✅ Đã cài đặt và xác thực Azure CLI
- ✅ Đã cài đặt Git trên hệ thống của bạn
- ✅ Node.js 16+ (cho hướng dẫn này)
- ✅ Visual Studio Code (khuyến nghị)

### Xác Minh Thiết Lập
```bash
# Kiểm tra cài đặt azd
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

Hãy bắt đầu với một mẫu ứng dụng todo phổ biến bao gồm giao diện React và API backend Node.js.

```bash
# Duyệt các mẫu có sẵn
azd template list

# Khởi tạo mẫu ứng dụng todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Làm theo các hướng dẫn:
# - Nhập tên môi trường: "dev"
# - Chọn một đăng ký (nếu bạn có nhiều đăng ký)
# - Chọn một khu vực: "East US 2" (hoặc khu vực bạn ưa thích)
```

### Điều Gì Vừa Xảy Ra?
- Đã tải xuống mã mẫu vào thư mục cục bộ của bạn
- Đã tạo tệp `azure.yaml` với các định nghĩa dịch vụ
- Đã thiết lập mã hạ tầng trong thư mục `infra/`
- Đã tạo cấu hình môi trường

## Bước 2: Khám Phá Cấu Trúc Dự Án

Hãy xem xét những gì azd đã tạo cho chúng ta:

```bash
# Xem cấu trúc dự án
tree /f   # Windows
# hoặc
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

### Các Tệp Chính Cần Hiểu

**azure.yaml** - Trái tim của dự án azd của bạn:
```bash
# Xem cấu hình dự án
cat azure.yaml
```

**infra/main.bicep** - Định nghĩa hạ tầng:
```bash
# Xem mã cơ sở hạ tầng
head -30 infra/main.bicep
```

## Bước 3: Tùy Chỉnh Dự Án Của Bạn (Tùy Chọn)

Trước khi triển khai, bạn có thể tùy chỉnh ứng dụng:

### Chỉnh Sửa Giao Diện
```bash
# Mở thành phần ứng dụng React
code src/web/src/App.tsx
```

Thực hiện một thay đổi đơn giản:
```typescript
// Tìm tiêu đề và thay đổi nó
<h1>My Awesome Todo App</h1>
```

### Cấu Hình Biến Môi Trường
```bash
# Đặt các biến môi trường tùy chỉnh
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Xem tất cả các biến môi trường
azd env get-values
```

## Bước 4: Triển Khai Lên Azure

Bây giờ là phần thú vị - triển khai mọi thứ lên Azure!

```bash
# Triển khai cơ sở hạ tầng và ứng dụng
azd up

# Lệnh này sẽ:
# 1. Cung cấp tài nguyên Azure (App Service, Cosmos DB, v.v.)
# 2. Xây dựng ứng dụng của bạn
# 3. Triển khai đến các tài nguyên đã được cung cấp
# 4. Hiển thị URL của ứng dụng
```

### Điều Gì Đang Xảy Ra Trong Quá Trình Triển Khai?

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
# Lấy các điểm cuối của ứng dụng
azd show

# Mở ứng dụng trong trình duyệt của bạn
azd show --output json | jq -r '.services.web.endpoint'
```

### Kiểm Tra Ứng Dụng Todo
1. **Thêm một mục todo** - Nhấp vào "Add Todo" và nhập một nhiệm vụ
2. **Đánh dấu hoàn thành** - Đánh dấu các mục đã hoàn thành
3. **Xóa mục** - Xóa các mục bạn không cần nữa

### Giám Sát Ứng Dụng Của Bạn
```bash
# Mở cổng thông tin Azure cho tài nguyên của bạn
azd monitor

# Xem nhật ký ứng dụng
azd logs
```

## Bước 6: Thực Hiện Thay Đổi và Triển Khai Lại

Hãy thực hiện một thay đổi và xem việc cập nhật dễ dàng như thế nào:

### Chỉnh Sửa API
```bash
# Chỉnh sửa mã API
code src/api/src/routes/lists.js
```

Thêm một tiêu đề phản hồi tùy chỉnh:
```javascript
// Tìm một trình xử lý tuyến và thêm:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Chỉ Triển Khai Các Thay Đổi Mã
```bash
# Triển khai chỉ mã ứng dụng (bỏ qua cơ sở hạ tầng)
azd deploy

# Điều này nhanh hơn nhiều so với 'azd up' vì cơ sở hạ tầng đã tồn tại
```

## Bước 7: Quản Lý Nhiều Môi Trường

Tạo một môi trường thử nghiệm để kiểm tra các thay đổi trước khi đưa vào sản xuất:

```bash
# Tạo một môi trường staging mới
azd env new staging

# Triển khai lên staging
azd up

# Chuyển lại sang môi trường dev
azd env select dev

# Liệt kê tất cả các môi trường
azd env list
```

### So Sánh Môi Trường
```bash
# Xem môi trường phát triển
azd env select dev
azd show

# Xem môi trường dàn dựng
azd env select staging
azd show
```

## Bước 8: Dọn Dẹp Tài Nguyên

Khi bạn đã hoàn tất thử nghiệm, hãy dọn dẹp để tránh các chi phí phát sinh:

```bash
# Xóa tất cả tài nguyên Azure cho môi trường hiện tại
azd down

# Buộc xóa mà không cần xác nhận và xóa sạch các tài nguyên đã bị xóa mềm
azd down --force --purge

# Xóa môi trường cụ thể
azd env select staging
azd down --force --purge
```

## Những Gì Bạn Đã Học Được

Chúc mừng! Bạn đã thành công:
- ✅ Khởi tạo một dự án azd từ mẫu
- ✅ Khám phá cấu trúc dự án và các tệp chính
- ✅ Triển khai một ứng dụng full-stack lên Azure
- ✅ Thực hiện thay đổi mã và triển khai lại
- ✅ Quản lý nhiều môi trường
- ✅ Dọn dẹp tài nguyên

## 🎯 Bài Tập Xác Thực Kỹ Năng

### Bài Tập 1: Triển Khai Một Mẫu Khác (15 phút)
**Mục Tiêu**: Chứng minh sự thành thạo quy trình khởi tạo và triển khai azd

```bash
# Thử ngăn xếp Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Xác minh triển khai
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Dọn dẹp
azd down --force --purge
```

**Tiêu Chí Thành Công:**
- [ ] Ứng dụng triển khai không có lỗi
- [ ] Có thể truy cập URL ứng dụng trong trình duyệt
- [ ] Ứng dụng hoạt động chính xác (thêm/xóa todos)
- [ ] Đã dọn dẹp thành công tất cả tài nguyên

### Bài Tập 2: Tùy Chỉnh Cấu Hình (20 phút)
**Mục Tiêu**: Thực hành cấu hình biến môi trường

```bash
cd my-first-azd-app

# Tạo môi trường tùy chỉnh
azd env new custom-config

# Đặt các biến tùy chỉnh
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Xác minh các biến
azd env get-values | grep APP_TITLE

# Triển khai với cấu hình tùy chỉnh
azd up
```

**Tiêu Chí Thành Công:**
- [ ] Đã tạo môi trường tùy chỉnh thành công
- [ ] Biến môi trường được thiết lập và truy xuất
- [ ] Ứng dụng triển khai với cấu hình tùy chỉnh
- [ ] Có thể xác minh các thiết lập tùy chỉnh trong ứng dụng đã triển khai

### Bài Tập 3: Quy Trình Nhiều Môi Trường (25 phút)
**Mục Tiêu**: Thành thạo quản lý môi trường và chiến lược triển khai

```bash
# Tạo môi trường phát triển
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Ghi chú URL phát triển
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Tạo môi trường dàn dựng
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Ghi chú URL dàn dựng
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# So sánh các môi trường
azd env list

# Kiểm tra cả hai môi trường
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Dọn dẹp cả hai
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Tiêu Chí Thành Công:**
- [ ] Hai môi trường được tạo với các cấu hình khác nhau
- [ ] Cả hai môi trường triển khai thành công
- [ ] Có thể chuyển đổi giữa các môi trường bằng `azd env select`
- [ ] Biến môi trường khác nhau giữa các môi trường
- [ ] Đã dọn dẹp thành công cả hai môi trường

## 📊 Tiến Độ Của Bạn

**Thời Gian Đầu Tư**: ~60-90 phút  
**Kỹ Năng Đạt Được**:
- ✅ Khởi tạo dự án dựa trên mẫu
- ✅ Cung cấp tài nguyên Azure
- ✅ Quy trình triển khai ứng dụng
- ✅ Quản lý môi trường
- ✅ Quản lý cấu hình
- ✅ Dọn dẹp tài nguyên và quản lý chi phí

**Cấp Độ Tiếp Theo**: Bạn đã sẵn sàng cho [Hướng Dẫn Cấu Hình](configuration.md) để học các mẫu cấu hình nâng cao!

## Khắc Phục Các Vấn Đề Phổ Biến

### Lỗi Xác Thực
```bash
# Xác thực lại với Azure
az login

# Xác minh quyền truy cập đăng ký
az account show
```

### Lỗi Triển Khai
```bash
# Bật ghi nhật ký gỡ lỗi
export AZD_DEBUG=true
azd up --debug

# Xem nhật ký chi tiết
azd logs --service api
azd logs --service web
```

### Xung Đột Tên Tài Nguyên
```bash
# Sử dụng một tên môi trường duy nhất
azd env new dev-$(whoami)-$(date +%s)
```

### Vấn Đề Cổng/Mạng
```bash
# Kiểm tra xem các cổng có sẵn không
netstat -an | grep :3000
netstat -an | grep :3100
```

## Bước Tiếp Theo

Bây giờ bạn đã hoàn thành dự án đầu tiên, hãy khám phá các chủ đề nâng cao sau:

### 1. Tùy Chỉnh Hạ Tầng
- [Hạ Tầng dưới dạng Mã](../deployment/provisioning.md)
- [Thêm cơ sở dữ liệu, lưu trữ và các dịch vụ khác](../deployment/provisioning.md#adding-services)

### 2. Thiết Lập CI/CD
- [Tích Hợp GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Thực Hành Tốt Nhất Cho Sản Xuất
- [Cấu hình bảo mật](../deployment/best-practices.md#security)
- [Tối ưu hóa hiệu suất](../deployment/best-practices.md#performance)
- [Giám sát và ghi nhật ký](../deployment/best-practices.md#monitoring)

### 4. Khám Phá Thêm Các Mẫu
```bash
# Duyệt các mẫu theo danh mục
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Thử các ngăn xếp công nghệ khác nhau
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

**Chúc mừng bạn đã hoàn thành dự án azd đầu tiên của mình!** Bạn đã sẵn sàng để xây dựng và triển khai các ứng dụng tuyệt vời trên Azure với sự tự tin.

---

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Nền Tảng & Bắt Đầu Nhanh
- **⬅️ Trước**: [Cài Đặt & Thiết Lập](installation.md)
- **➡️ Tiếp Theo**: [Cấu Hình](configuration.md)
- **🚀 Chương Tiếp Theo**: [Chương 2: Phát Triển Ưu Tiên AI](../microsoft-foundry/microsoft-foundry-integration.md)
- **Bài Học Tiếp Theo**: [Hướng Dẫn Triển Khai](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->