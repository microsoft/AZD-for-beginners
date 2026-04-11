# Dự án Đầu tiên của Bạn - Hướng Dẫn Thực Hành

**Điều Hướng Chương:**
- **📚 Trang Khóa Học**: [AZD cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Nền Tảng & Bắt Đầu Nhanh
- **⬅️ Trước**: [Cài Đặt & Thiết Lập](installation.md)
- **➡️ Tiếp theo**: [Cấu Hình](configuration.md)
- **🚀 Chương Tiếp Theo**: [Chương 2: Phát Triển Ưu Tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giới Thiệu

Chào mừng bạn đến với dự án Azure Developer CLI đầu tiên! Hướng dẫn thực hành toàn diện này cung cấp hướng dẫn chi tiết tạo, triển khai và quản lý một ứng dụng full-stack trên Azure bằng azd. Bạn sẽ làm việc với một ứng dụng todo thực tế bao gồm frontend React, backend API Node.js và cơ sở dữ liệu MongoDB.

## Mục tiêu Học tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Nắm vững quy trình khởi tạo dự án azd bằng cách sử dụng mẫu
- Hiểu cấu trúc dự án Azure Developer CLI và các tệp cấu hình
- Thực hiện triển khai toàn bộ ứng dụng lên Azure cùng với việc cung cấp hạ tầng
- Triển khai các chiến lược cập nhật ứng dụng và triển khai lại
- Quản lý nhiều môi trường cho phát triển và staging
- Áp dụng thực hành dọn dẹp tài nguyên và quản lý chi phí

## Kết quả Học tập

Sau khi hoàn thành, bạn sẽ có khả năng:
- Khởi tạo và cấu hình dự án azd từ mẫu một cách độc lập
- Duyệt và chỉnh sửa cấu trúc dự án azd hiệu quả
- Triển khai ứng dụng full-stack lên Azure chỉ với một vài lệnh
- Khắc phục các sự cố triển khai phổ biến và vấn đề xác thực
- Quản lý nhiều môi trường Azure cho các giai đoạn triển khai khác nhau
- Triển khai quy trình triển khai liên tục cho các cập nhật ứng dụng

## Bắt Đầu

### Danh sách Yêu cầu Trước
- ✅ Azure Developer CLI đã được cài đặt ([Installation Guide](installation.md))
- ✅ Đã xác thực AZD với `azd auth login`
- ✅ Git đã được cài trên hệ thống của bạn
- ✅ Node.js 16+ (cho hướng dẫn này)
- ✅ Visual Studio Code (khuyến nghị)

Trước khi tiếp tục, chạy trình kiểm tra thiết lập từ thư mục gốc của kho:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Xác minh Thiết lập của Bạn
```bash
# Kiểm tra cài đặt azd
azd version

# Kiểm tra xác thực AZD
azd auth login --check-status
```

### Xác minh xác thực Azure CLI tùy chọn

```bash
az account show
```

### Kiểm tra phiên bản Node.js
```bash
node --version
```

## Bước 1: Chọn và Khởi tạo Một Mẫu

Hãy bắt đầu với một mẫu ứng dụng todo phổ biến bao gồm frontend React và backend API Node.js.

```bash
# Duyệt các mẫu có sẵn
azd template list

# Khởi tạo mẫu ứng dụng todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Làm theo các hướng dẫn:
# - Nhập tên môi trường: "dev"
# - Chọn một đăng ký (nếu bạn có nhiều)
# - Chọn một khu vực: "East US 2" (hoặc khu vực bạn ưu tiên)
```

### Vừa Xảy Ra Điều Gì?
- Đã tải mã mẫu về thư mục cục bộ của bạn
- Đã tạo tệp `azure.yaml` với các định nghĩa dịch vụ
- Đã thiết lập mã hạ tầng trong thư mục `infra/`
- Đã tạo cấu hình môi trường

## Bước 2: Khám Phá Cấu Trúc Dự Án

Hãy kiểm tra những gì azd đã tạo cho chúng ta:

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

### Các Tệp Quan Trọng Cần Hiểu

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

## Bước 3: Tùy Chỉnh Dự Án của Bạn (Tùy Chọn)

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

### Cấu hình Biến Môi Trường
```bash
# Đặt biến môi trường tùy chỉnh
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Xem tất cả các biến môi trường
azd env get-values
```

## Bước 4: Triển Khai lên Azure

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

### Điều gì xảy ra trong khi triển khai?

Lệnh `azd up` thực hiện các bước sau:
1. **Cung cấp** (`azd provision`) - Tạo các tài nguyên Azure
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

## Bước 5: Kiểm Tra Ứng Dụng của Bạn

### Truy cập Ứng dụng của Bạn
Nhấp vào URL được cung cấp trong đầu ra triển khai, hoặc lấy bất kỳ lúc nào:
```bash
# Lấy các điểm cuối của ứng dụng
azd show

# Mở ứng dụng trong trình duyệt của bạn
azd show --output json | jq -r '.services.web.endpoint'
```

### Kiểm tra Ứng dụng Todo
1. **Thêm một mục todo** - Nhấp "Add Todo" và nhập một nhiệm vụ
2. **Đánh dấu hoàn thành** - Đánh dấu các mục đã hoàn thành
3. **Xóa mục** - Loại bỏ những todo bạn không cần nữa

### Giám sát Ứng dụng của Bạn
```bash
# Mở cổng Azure cho các tài nguyên của bạn
azd monitor

# Xem nhật ký ứng dụng
azd monitor --logs

# Xem số liệu trực tiếp
azd monitor --live
```

## Bước 6: Thực Hiện Thay Đổi và Triển Khai Lại

Hãy thực hiện một thay đổi và xem việc cập nhật dễ dàng như thế nào:

### Chỉnh sửa API
```bash
# Chỉnh sửa mã API
code src/api/src/routes/lists.js
```

Thêm một header phản hồi tùy chỉnh:
```javascript
// Tìm một trình xử lý route và thêm:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Chỉ Triển Khai Các Thay Đổi Mã
```bash
# Chỉ triển khai mã ứng dụng (bỏ qua hạ tầng)
azd deploy

# Việc này nhanh hơn nhiều so với 'azd up' vì hạ tầng đã tồn tại
```

## Bước 7: Quản Lý Nhiều Môi Trường

Tạo một môi trường staging để kiểm tra thay đổi trước khi lên production:

```bash
# Tạo một môi trường staging mới
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

# Xem môi trường dàn dựng
azd env select staging
azd show
```

## Bước 8: Dọn Dẹp Tài Nguyên

Khi bạn hoàn tất thử nghiệm, hãy dọn dẹp để tránh phát sinh phí liên tục:

```bash
# Xóa tất cả tài nguyên Azure cho môi trường hiện tại
azd down

# Buộc xóa mà không cần xác nhận và xóa vĩnh viễn các tài nguyên đã bị xóa mềm
azd down --force --purge

# Xóa môi trường cụ thể
azd env select staging
azd down --force --purge
```

## Ứng Dụng Cổ Điển so với Ứng Dụng Sử Dụng AI: Cùng Quy Trình Làm Việc

Bạn vừa triển khai một ứng dụng web truyền thống. Nhưng nếu bạn muốn triển khai một ứng dụng được hỗ trợ bởi AI — ví dụ, một ứng dụng chat dùng Microsoft Foundry Models?

Tin tốt là: **quy trình làm việc hoàn toàn giống nhau.**

| Bước | Ứng Dụng Todo Cổ Điển | Ứng Dụng Chat AI |
|------|-----------------|-------------|
| Khởi tạo | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Xác thực | `azd auth login` | `azd auth login` |
| Triển khai | `azd up` | `azd up` |
| Giám sát | `azd monitor` | `azd monitor` |
| Dọn dẹp | `azd down --force --purge` | `azd down --force --purge` |

Điểm khác duy nhất là **mẫu** bạn bắt đầu. Một mẫu AI bao gồm hạ tầng bổ sung (như tài nguyên Microsoft Foundry Models hoặc một chỉ mục AI Search), nhưng azd sẽ xử lý tất cả cho bạn. Bạn không cần học lệnh mới, chuyển sang công cụ khác, hay thay đổi cách nghĩ về triển khai.

Đây là nguyên tắc cốt lõi của azd: **một quy trình làm việc, mọi loại khối lượng công việc.** Những kỹ năng bạn đã thực hành trong hướng dẫn này — khởi tạo, triển khai, giám sát, triển khai lại, và dọn dẹp — áp dụng tương tự cho các ứng dụng AI và agent.

---

## Những Gì Bạn Đã Học

Chúc mừng! Bạn đã thành công:
- ✅ Khởi tạo dự án azd từ một mẫu
- ✅ Khám phá cấu trúc dự án và các tệp quan trọng
- ✅ Triển khai một ứng dụng full-stack lên Azure
- ✅ Thực hiện thay đổi mã và triển khai lại
- ✅ Quản lý nhiều môi trường
- ✅ Dọn dẹp tài nguyên

## 🎯 Bài Tập Xác Thực Kỹ Năng

### Bài Tập 1: Triển khai Một Mẫu Khác (15 phút)
**Mục tiêu**: Chứng minh thành thạo quy trình `azd init` và triển khai

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
- [ ] Ứng dụng triển khai không lỗi
- [ ] Có thể truy cập URL ứng dụng trên trình duyệt
- [ ] Ứng dụng hoạt động chính xác (thêm/xóa todos)
- [ ] Đã dọn dẹp thành công tất cả tài nguyên

### Bài Tập 2: Tùy Chỉnh Cấu Hình (20 phút)
**Mục tiêu**: Thực hành cấu hình biến môi trường

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

**Tiêu chí Thành công:**
- [ ] Môi trường tùy chỉnh được tạo thành công
- [ ] Biến môi trường được đặt và có thể truy xuất
- [ ] Ứng dụng triển khai với cấu hình tùy chỉnh
- [ ] Có thể xác minh cài đặt tùy chỉnh trong ứng dụng đã triển khai

### Bài Tập 3: Quy Trình Làm Việc Nhiều Môi Trường (25 phút)
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

# Kiểm tra cả hai môi trường
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Dọn dẹp cả hai môi trường
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Tiêu chí Thành công:**
- [ ] Hai môi trường được tạo với cấu hình khác nhau
- [ ] Cả hai môi trường triển khai thành công
- [ ] Có thể chuyển đổi giữa các môi trường bằng `azd env select`
- [ ] Biến môi trường khác nhau giữa các môi trường
- [ ] Đã dọn dẹp thành công cả hai môi trường

## 📊 Tiến Độ của Bạn

**Thời gian Đã Đầu tư**: ~60-90 phút  
**Kỹ năng Đạt được**:
- ✅ Khởi tạo dự án dựa trên mẫu
- ✅ Cung cấp tài nguyên Azure
- ✅ Quy trình triển khai ứng dụng
- ✅ Quản lý môi trường
- ✅ Quản lý cấu hình
- ✅ Dọn dẹp tài nguyên và quản lý chi phí

**Cấp tiếp theo**: Bạn đã sẵn sàng cho [Hướng Dẫn Cấu Hình](configuration.md) để học các mẫu cấu hình nâng cao!

## Khắc Phục Sự Cố Thường Gặp

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

# Xem nhật ký ứng dụng trong Azure
azd monitor --logs

# Đối với Container Apps, hãy sử dụng Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Xung Đột Tên Tài Nguyên
```bash
# Sử dụng tên môi trường duy nhất
azd env new dev-$(whoami)-$(date +%s)
```

### Vấn Đề Cổng/Mạng
```bash
# Kiểm tra xem các cổng có sẵn hay không
netstat -an | grep :3000
netstat -an | grep :3100
```

## Bước Tiếp Theo

Bây giờ bạn đã hoàn thành dự án đầu tiên, hãy khám phá các chủ đề nâng cao sau:

### 1. Tùy Chỉnh Hạ Tầng
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Thêm cơ sở dữ liệu, lưu trữ và các dịch vụ khác](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Thiết Lập CI/CD
- [Hướng Dẫn Triển Khai](../chapter-04-infrastructure/deployment-guide.md) - Quy trình CI/CD hoàn chỉnh
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Cấu hình pipeline

### 3. Thực Hành Tốt Nhất Cho Production
- [Hướng Dẫn Triển Khai](../chapter-04-infrastructure/deployment-guide.md) - Bảo mật, hiệu năng và giám sát

### 4. Khám Phá Thêm Các Mẫu
```bash
# Duyệt các mẫu theo danh mục
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Thử các stack công nghệ khác nhau
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Tài Nguyên Bổ Sung

### Tài liệu Học tập
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Cộng đồng & Hỗ trợ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mẫu & Ví dụ
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Chúc mừng bạn đã hoàn thành dự án azd đầu tiên!** Bây giờ bạn đã sẵn sàng xây dựng và triển khai các ứng dụng tuyệt vời trên Azure với sự tự tin.

---

**Điều Hướng Chương:**
- **📚 Trang Khóa Học**: [AZD cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Nền Tảng & Bắt Đầu Nhanh
- **⬅️ Trước**: [Cài Đặt & Thiết Lập](installation.md)
- **➡️ Tiếp theo**: [Cấu Hình](configuration.md)
- **🚀 Chương Tiếp Theo**: [Chương 2: Phát Triển Ưu Tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Bài Học Tiếp Theo**: [Hướng Dẫn Triển Khai](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc những điểm không chính xác. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn tham khảo chính thức. Đối với những thông tin quan trọng, khuyến nghị sử dụng bản dịch do chuyên gia dịch thuật thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->