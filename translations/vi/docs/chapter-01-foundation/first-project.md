# Dự án Đầu tiên của Bạn - Hướng dẫn Thực hành

**Điều hướng Chương:**
- **📚 Trang Khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện tại**: Chương 1 - Nền tảng & Bắt đầu Nhanh
- **⬅️ Trước**: [Cài đặt & Thiết lập](installation.md)
- **➡️ Tiếp theo**: [Cấu hình](configuration.md)
- **🚀 Chương tiếp theo**: [Chương 2: Phát triển Ưu tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giới thiệu

Chào mừng bạn đến với dự án Azure Developer CLI đầu tiên! Hướng dẫn thực hành toàn diện này cung cấp một hướng dẫn chi tiết về cách tạo, triển khai và quản lý một ứng dụng full-stack trên Azure bằng azd. Bạn sẽ làm việc với một ứng dụng todo thực tế bao gồm frontend React, backend API Node.js, và cơ sở dữ liệu MongoDB.

## Mục tiêu Học tập

Bằng cách hoàn thành hướng dẫn này, bạn sẽ:
- Thành thạo quy trình khởi tạo dự án azd sử dụng mẫu
- Hiểu cấu trúc dự án Azure Developer CLI và các tệp cấu hình
- Thực hiện triển khai toàn bộ ứng dụng lên Azure cùng với việc cấp phát hạ tầng
- Triển khai các chiến lược cập nhật ứng dụng và triển khai lại
- Quản lý nhiều môi trường cho phát triển và kiểm thử (staging)
- Áp dụng các thực hành dọn dẹp tài nguyên và quản lý chi phí

## Kết quả Học tập

Sau khi hoàn thành, bạn sẽ có thể:
- Khởi tạo và cấu hình dự án azd từ mẫu một cách độc lập
- Điều hướng và chỉnh sửa cấu trúc dự án azd hiệu quả
- Triển khai ứng dụng full-stack lên Azure chỉ bằng một lệnh
- Khắc phục các vấn đề triển khai phổ biến và lỗi xác thực
- Quản lý nhiều môi trường Azure cho các giai đoạn triển khai khác nhau
- Triển khai các luồng công việc triển khai liên tục cho các bản cập nhật ứng dụng

## Bắt đầu

### Danh sách kiểm tra Yêu cầu tiên quyết
- ✅ Azure Developer CLI đã được cài đặt ([Hướng dẫn cài đặt](installation.md))
- ✅ Azure CLI đã được cài đặt và xác thực
- ✅ Git đã được cài đặt trên hệ thống của bạn
- ✅ Node.js 16+ (cho hướng dẫn này)
- ✅ Visual Studio Code (khuyến nghị)

### Xác minh Cài đặt của Bạn
```bash
# Kiểm tra cài đặt azd
azd version
```
### Xác minh xác thực Azure

```bash
az account show
```

### Kiểm tra phiên bản Node.js
```bash
node --version
```

## Bước 1: Chọn và Khởi tạo một Mẫu

Hãy bắt đầu với một mẫu ứng dụng todo phổ biến bao gồm frontend React và backend API Node.js.

```bash
# Duyệt các mẫu có sẵn
azd template list

# Khởi tạo mẫu ứng dụng todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Làm theo các lời nhắc:
# - Nhập tên môi trường: "dev"
# - Chọn một đăng ký (nếu bạn có nhiều)
# - Chọn khu vực: "East US 2" (hoặc khu vực bạn ưa thích)
```

### Điều gì vừa xảy ra?
- Đã tải mã mẫu về thư mục cục bộ của bạn
- Đã tạo tệp `azure.yaml` với các định nghĩa dịch vụ
- Thiết lập mã hạ tầng trong thư mục `infra/`
- Đã tạo cấu hình môi trường

## Bước 2: Khám phá Cấu trúc Dự án

Hãy xem azd đã tạo gì cho chúng ta:

```bash
# Xem cấu trúc dự án
tree /f   # Windows
# hoặc
find . -type f | head -20   # macOS/Linux
```

Bạn nên thấy:
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

### Các Tệp Quan trọng cần Hiểu

**azure.yaml** - Trái tim của dự án azd của bạn:
```bash
# Xem cấu hình dự án
cat azure.yaml
```

**infra/main.bicep** - Định nghĩa hạ tầng:
```bash
# Xem mã hạ tầng
head -30 infra/main.bicep
```

## Bước 3: Tùy chỉnh Dự án của Bạn (Tùy chọn)

Trước khi triển khai, bạn có thể tùy chỉnh ứng dụng:

### Chỉnh sửa Frontend
```bash
# Mở thành phần ứng dụng React
code src/web/src/App.tsx
```

Thực hiện một thay đổi đơn giản:
```typescript
// Tìm tiêu đề và thay đổi nó
<h1>My Awesome Todo App</h1>
```

### Cấu hình Biến Môi trường
```bash
# Đặt biến môi trường tùy chỉnh
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Xem tất cả các biến môi trường
azd env get-values
```

## Bước 4: Triển khai lên Azure

Bây giờ đến phần thú vị - triển khai mọi thứ lên Azure!

```bash
# Triển khai cơ sở hạ tầng và ứng dụng
azd up

# Lệnh này sẽ:
# 1. Cấp phát tài nguyên Azure (App Service, Cosmos DB, v.v.)
# 2. Xây dựng ứng dụng của bạn
# 3. Triển khai lên các tài nguyên đã được cấp phát
# 4. Hiển thị URL của ứng dụng
```

### Điều gì đang xảy ra trong quá trình triển khai?

Lệnh `azd up` thực hiện các bước sau:
1. **Cấp phát** (`azd provision`) - Tạo các tài nguyên Azure
2. **Đóng gói** - Xây dựng mã ứng dụng của bạn
3. **Triển khai** (`azd deploy`) - Triển khai mã lên các tài nguyên Azure

### Kết quả Mong đợi
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Bước 5: Kiểm tra Ứng dụng của Bạn

### Truy cập Ứng dụng của Bạn
Nhấp vào URL được cung cấp trong kết quả triển khai, hoặc lấy nó bất cứ lúc nào:
```bash
# Lấy các điểm cuối của ứng dụng
azd show

# Mở ứng dụng trong trình duyệt của bạn
azd show --output json | jq -r '.services.web.endpoint'
```

### Kiểm tra Ứng dụng Todo
1. **Thêm một mục todo** - Nhấp vào "Add Todo" và nhập một nhiệm vụ
2. **Đánh dấu hoàn thành** - Đánh dấu các mục đã hoàn thành
3. **Xóa mục** - Loại bỏ các todo mà bạn không còn cần

### Giám sát Ứng dụng của Bạn
```bash
# Mở cổng Azure cho các tài nguyên của bạn
azd monitor

# Xem nhật ký ứng dụng
azd monitor --logs

# Xem số liệu thời gian thực
azd monitor --live
```

## Bước 6: Thực hiện Thay đổi và Triển khai lại

Hãy thực hiện một thay đổi và xem việc cập nhật dễ dàng ra sao:

### Chỉnh sửa API
```bash
# Chỉnh sửa mã API
code src/api/src/routes/lists.js
```

Thêm một header phản hồi tùy chỉnh:
```javascript
// Tìm một bộ xử lý tuyến đường và thêm:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Chỉ Triển khai các Thay đổi Mã
```bash
# Chỉ triển khai mã ứng dụng (bỏ qua hạ tầng)
azd deploy

# Điều này nhanh hơn nhiều so với 'azd up' vì hạ tầng đã tồn tại
```

## Bước 7: Quản lý Nhiều Môi trường

Tạo một môi trường staging để kiểm tra các thay đổi trước khi đưa vào sản xuất:

```bash
# Tạo môi trường staging mới
azd env new staging

# Triển khai lên staging
azd up

# Chuyển trở lại môi trường dev
azd env select dev

# Liệt kê tất cả các môi trường
azd env list
```

### So sánh Môi trường
```bash
# Xem môi trường phát triển
azd env select dev
azd show

# Xem môi trường staging
azd env select staging
azd show
```

## Bước 8: Dọn dẹp Tài nguyên

Khi bạn hoàn tất thử nghiệm, hãy dọn dẹp để tránh phát sinh chi phí liên tục:

```bash
# Xóa tất cả các tài nguyên Azure cho môi trường hiện tại
azd down

# Buộc xóa mà không cần xác nhận và dọn sạch các tài nguyên bị xóa tạm thời
azd down --force --purge

# Xóa môi trường cụ thể
azd env select staging
azd down --force --purge
```

## Những gì bạn đã học

Chúc mừng! Bạn đã thành công:
- ✅ Đã khởi tạo dự án azd từ một mẫu
- ✅ Đã khám phá cấu trúc dự án và các tệp chính
- ✅ Đã triển khai một ứng dụng full-stack lên Azure
- ✅ Đã thực hiện thay đổi mã và triển khai lại
- ✅ Đã quản lý nhiều môi trường
- ✅ Đã dọn dẹp tài nguyên

## 🎯 Bài tập Xác thực Kỹ năng

### Bài tập 1: Triển khai một Mẫu Khác (15 phút)
**Mục tiêu**: Minh chứng sự thành thạo quy trình azd init và luồng triển khai

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

**Tiêu chí Thành công:**
- [ ] Ứng dụng triển khai không gặp lỗi
- [ ] Có thể truy cập URL ứng dụng trong trình duyệt
- [ ] Ứng dụng hoạt động đúng (thêm/xóa todos)
- [ ] Đã dọn dẹp tất cả tài nguyên thành công

### Bài tập 2: Tùy chỉnh Cấu hình (20 phút)
**Mục tiêu**: Thực hành cấu hình biến môi trường

```bash
cd my-first-azd-app

# Tạo môi trường tùy chỉnh
azd env new custom-config

# Thiết lập các biến tùy chỉnh
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Xác minh các biến
azd env get-values | grep APP_TITLE

# Triển khai với cấu hình tùy chỉnh
azd up
```

**Tiêu chí Thành công:**
- [ ] Môi trường tùy chỉnh được tạo thành công
- [ ] Các biến môi trường được thiết lập và có thể truy xuất
- [ ] Ứng dụng triển khai với cấu hình tùy chỉnh
- [ ] Có thể xác minh các thiết lập tùy chỉnh trong ứng dụng đã triển khai

### Bài tập 3: Luồng Công việc Đa Môi trường (25 phút)
**Mục tiêu**: Thành thạo quản lý môi trường và chiến lược triển khai

```bash
# Tạo môi trường phát triển
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Ghi lại URL môi trường phát triển
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Tạo môi trường staging
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Ghi lại URL môi trường staging
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# So sánh các môi trường
azd env list

# Kiểm thử cả hai môi trường
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Dọn dẹp cả hai môi trường
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Tiêu chí Thành công:**
- [ ] Hai môi trường được tạo với các cấu hình khác nhau
- [ ] Cả hai môi trường triển khai thành công
- [ ] Có thể chuyển đổi giữa các môi trường bằng `azd env select`
- [ ] Biến môi trường khác nhau giữa các môi trường
- [ ] Đã dọn dẹp thành công cả hai môi trường

## 📊 Tiến độ của Bạn

**Thời gian Đầu tư**: ~60-90 phút  
**Kỹ năng Đạt được**:
- ✅ Khởi tạo dự án dựa trên mẫu
- ✅ Cấp phát tài nguyên Azure
- ✅ Luồng công việc triển khai ứng dụng
- ✅ Quản lý môi trường
- ✅ Quản lý cấu hình
- ✅ Dọn dẹp tài nguyên và quản lý chi phí

**Cấp độ tiếp theo**: Bạn đã sẵn sàng cho [Hướng dẫn Cấu hình](configuration.md) để học các mẫu cấu hình nâng cao!

## Khắc phục Sự cố Thông thường

### Lỗi Xác thực
```bash
# Xác thực lại với Azure
az login

# Xác minh quyền truy cập vào đăng ký
az account show
```

### Lỗi Triển khai
```bash
# Bật ghi nhật ký gỡ lỗi
export AZD_DEBUG=true
azd up --debug

# Xem nhật ký ứng dụng trong Azure
azd monitor --logs

# Đối với Container Apps, sử dụng Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Xung đột Tên Tài nguyên
```bash
# Sử dụng một tên môi trường duy nhất
azd env new dev-$(whoami)-$(date +%s)
```

### Vấn đề Cổng/Mạng
```bash
# Kiểm tra xem các cổng có sẵn hay không
netstat -an | grep :3000
netstat -an | grep :3100
```

## Bước tiếp theo

Bây giờ bạn đã hoàn thành dự án đầu tiên, hãy khám phá các chủ đề nâng cao sau:

### 1. Tùy chỉnh Hạ tầng
- [Hạ tầng như Mã](../chapter-04-infrastructure/provisioning.md)
- [Thêm cơ sở dữ liệu, lưu trữ và các dịch vụ khác](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Thiết lập CI/CD
- [Hướng dẫn Triển khai](../chapter-04-infrastructure/deployment-guide.md) - Các luồng công việc CI/CD hoàn chỉnh
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Cấu hình pipeline

### 3. Thực hành Tốt nhất cho Sản xuất
- [Hướng dẫn Triển khai](../chapter-04-infrastructure/deployment-guide.md) - Bảo mật, hiệu năng và giám sát

### 4. Khám phá Thêm Mẫu
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

## Tài nguyên Bổ sung

### Tài liệu Học tập
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Khung Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Cộng đồng & Hỗ trợ
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Cộng đồng Nhà phát triển Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mẫu & Ví dụ
- [Thư viện Mẫu Chính thức](https://azure.github.io/awesome-azd/)
- [Mẫu Cộng đồng](https://github.com/Azure-Samples/azd-templates)
- [Mẫu Doanh nghiệp](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Chúc mừng bạn đã hoàn thành dự án azd đầu tiên của mình!** Bây giờ bạn đã sẵn sàng để xây dựng và triển khai các ứng dụng tuyệt vời trên Azure với sự tự tin.

---

**Điều hướng Chương:**
- **📚 Trang Khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện tại**: Chương 1 - Nền tảng & Bắt đầu Nhanh
- **⬅️ Trước**: [Cài đặt & Thiết lập](installation.md)
- **➡️ Tiếp theo**: [Cấu hình](configuration.md)
- **🚀 Chương tiếp theo**: [Chương 2: Phát triển Ưu tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Bài học tiếp theo**: [Hướng dẫn Triển khai](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ ban đầu của tài liệu nên được coi là nguồn chính thức. Đối với những thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->