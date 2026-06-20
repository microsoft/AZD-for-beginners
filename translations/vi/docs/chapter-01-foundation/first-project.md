# Dự Án Đầu Tiên Của Bạn - Hướng Dẫn Thực Hành

**Điều Hướng Chương:**
- **📚 Course Home**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Current Chapter**: Chương 1 - Cơ Sở & Bắt Đầu Nhanh
- **⬅️ Previous**: [Cài Đặt & Thiết Lập](installation.md)
- **➡️ Next**: [Cấu Hình](configuration.md)
- **🚀 Next Chapter**: [Chương 2: Phát Triển Ưu Tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giới Thiệu

Chào mừng bạn đến với dự án Azure Developer CLI đầu tiên của bạn! Hướng dẫn thực hành toàn diện này cung cấp một hướng dẫn chi tiết về cách tạo, triển khai, và quản lý một ứng dụng full-stack trên Azure bằng azd. Bạn sẽ làm việc với một ứng dụng todo thực tế bao gồm frontend React, backend API Node.js, và cơ sở dữ liệu MongoDB.

## Mục Tiêu Học Tập

Bằng cách hoàn thành hướng dẫn này, bạn sẽ:
- Làm chủ quy trình khởi tạo dự án azd bằng cách sử dụng các mẫu
- Hiểu cấu trúc dự án và các tệp cấu hình của Azure Developer CLI
- Thực thi triển khai toàn bộ ứng dụng lên Azure kèm theo việc cung cấp hạ tầng
- Thực hiện cập nhật ứng dụng và chiến lược triển khai lại
- Quản lý nhiều môi trường cho phát triển và staging
- Áp dụng các thực hành dọn dẹp tài nguyên và quản lý chi phí

## Kết Quả Học Tập

Sau khi hoàn thành, bạn sẽ có thể:
- Khởi tạo và cấu hình dự án azd từ các mẫu một cách độc lập
- Điều hướng và chỉnh sửa cấu trúc dự án azd một cách hiệu quả
- Triển khai ứng dụng full-stack lên Azure bằng một lệnh duy nhất
- Xử lý sự cố triển khai phổ biến và các vấn đề xác thực
- Quản lý nhiều môi trường Azure cho các giai đoạn triển khai khác nhau
- Triển khai các workflow triển khai liên tục cho việc cập nhật ứng dụng

## Bắt Đầu

### Danh Sách Kiểm Tra Yêu Cầu Trước
- ✅ Azure Developer CLI được cài đặt ([Hướng Dẫn Cài Đặt](installation.md))
- ✅ Đã hoàn tất xác thực AZD bằng `azd auth login`
- ✅ Git đã được cài trên hệ thống của bạn
- ✅ Node.js 16+ (cho hướng dẫn này)
- ✅ Visual Studio Code (khuyến nghị)

Trước khi tiếp tục, hãy chạy bộ kiểm tra thiết lập từ thư mục gốc của kho lưu trữ:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Xác Minh Thiết Lập Của Bạn
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

## Bước 1: Chọn và Khởi Tạo Mẫu

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
# - Chọn khu vực: "East US 2" (hoặc khu vực bạn ưu tiên)
```

### Điều Gì Vừa Xảy Ra?
- Đã tải mã mẫu về thư mục cục bộ của bạn
- Đã tạo tệp `azure.yaml` với định nghĩa dịch vụ
- Đã thiết lập mã hạ tầng trong thư mục `infra/`
- Đã tạo cấu hình môi trường

## Bước 2: Khám Phá Cấu Trúc Dự Án

Hãy xem azd đã tạo gì cho chúng ta:

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

**azure.yaml** - Trung tâm của dự án azd của bạn:
```bash
# Xem cấu hình dự án
cat azure.yaml
```

**infra/main.bicep** - Định nghĩa hạ tầng:
```bash
# Xem mã hạ tầng
head -30 infra/main.bicep
```

## Bước 3: Tùy Chỉnh Dự Án Của Bạn (Tùy Chọn)

Trước khi triển khai, bạn có thể tùy chỉnh ứng dụng:

### Chỉnh Sửa Frontend
```bash
# Mở component ứng dụng React
code src/web/src/App.tsx
```

Thực hiện một thay đổi đơn giản:
```typescript
// Tìm tiêu đề và thay đổi nó
<h1>My Awesome Todo App</h1>
```

### Cấu Hình Biến Môi Trường
```bash
# Thiết lập các biến môi trường tùy chỉnh
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Xem tất cả các biến môi trường
azd env get-values
```

## Bước 4: Triển Khai Lên Azure

Bây giờ đến phần thú vị — triển khai mọi thứ lên Azure!

```bash
# Triển khai cơ sở hạ tầng và ứng dụng
azd up

# Lệnh này sẽ:
# 1. Cấp phát tài nguyên Azure (App Service, Cosmos DB, v.v.)
# 2. Xây dựng ứng dụng của bạn
# 3. Triển khai lên các tài nguyên đã được cấp phát
# 4. Hiển thị URL của ứng dụng
```

### Điều Gì Đang Xảy Ra Trong Quá Trình Triển Khai?

Lệnh `azd up` thực hiện các bước sau:
1. **Provision** (`azd provision`) - Tạo các tài nguyên Azure
2. **Package** - Xây dựng mã ứng dụng của bạn
3. **Deploy** (`azd deploy`) - Triển khai mã lên các tài nguyên Azure

### Kết Quả Mong Đợi
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
1. **Thêm một mục todo** - Nhấp "Thêm Todo" và nhập một nhiệm vụ
2. **Đánh dấu hoàn thành** - Đánh dấu các mục đã hoàn thành
3. **Xóa mục** - Xóa những todo mà bạn không còn cần

### Giám Sát Ứng Dụng Của Bạn
```bash
# Mở cổng Azure cho các tài nguyên của bạn
azd monitor

# Xem nhật ký ứng dụng
azd monitor --logs

# Xem số liệu theo thời gian thực
azd monitor --live
```

### ✅ Xác Minh Triển Khai Của Bạn

Trước khi tiếp tục, hãy thực hiện nhanh danh sách kiểm tra này để xác nhận mọi thứ thực sự hoạt động — đừng cho rằng "triển khai thành công" có nghĩa là "ứng dụng hoạt động":

```bash
# 1. Xác nhận điểm cuối tồn tại và có thể truy cập được
azd show

# 2. Kiểm tra sơ bộ điểm cuối (mong đợi HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Kiểm tra điểm cuối sức khỏe nếu ứng dụng của bạn có cung cấp
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Triển khai được xác minh khi:**
- ✅ `azd show` liệt kê một URL endpoint có thể truy cập được
- ✅ URL mở được trong trình duyệt của bạn mà không có lỗi
- ✅ Các chức năng chính hoạt động (thêm/hoàn thành/xóa một todo)
- ✅ `azd monitor --logs` hiển thị các yêu cầu đến mà không có lỗi bất ngờ

Nếu bất kỳ kiểm tra nào thất bại, hãy xem [Chương 7: Khắc Phục Sự Cố](../chapter-07-troubleshooting/README.md).

## Bước 6: Thay Đổi Và Triển Khai Lại

Hãy thực hiện một thay đổi và xem việc cập nhật dễ dàng như thế nào:

### Chỉnh Sửa API
```bash
# Chỉnh sửa mã API
code src/api/src/routes/lists.js
```

Thêm một header phản hồi tùy chỉnh:
```javascript
// Tìm một trình xử lý route và thêm:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Chỉ Triển Khai Những Thay Đổi Mã
```bash
# Chỉ triển khai mã ứng dụng (bỏ qua phần hạ tầng)
azd deploy

# Điều này nhanh hơn nhiều so với 'azd up' vì hạ tầng đã tồn tại
```

## Bước 7: Quản Lý Nhiều Môi Trường

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

Khi bạn đã hoàn tất thử nghiệm, hãy dọn dẹp để tránh phát sinh phí liên tục:

```bash
# Xóa tất cả các tài nguyên Azure của môi trường hiện tại
azd down

# Buộc xóa mà không cần xác nhận và xóa vĩnh viễn các tài nguyên bị xóa mềm
azd down --force --purge

# Xóa môi trường cụ thể
azd env select staging
azd down --force --purge
```

## Ứng Dụng Cổ Điển vs Ứng Dụng Có AI: Cùng Một Quy Trình Làm Việc

Bạn vừa triển khai một ứng dụng web truyền thống. Nhưng nếu bạn muốn triển khai một ứng dụng được hỗ trợ bởi AI — ví dụ, một ứng dụng chat dùng Microsoft Foundry Models?

Tin tốt là: **quy trình làm việc là giống hệt.**

| Bước | Ứng Dụng Todo Cổ Điển | Ứng Dụng Chat AI |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Điểm khác duy nhất là **mẫu** bạn bắt đầu. Một mẫu AI bao gồm thêm hạ tầng (như một tài nguyên Microsoft Foundry Models hoặc một chỉ mục AI Search), nhưng azd xử lý tất cả điều đó cho bạn. Bạn không cần học lệnh mới, dùng một công cụ khác, hay thay đổi cách bạn nghĩ về triển khai.

Đây là nguyên tắc cốt lõi của azd: **một quy trình, mọi khối lượng công việc.** Những kỹ năng bạn thực hành trong hướng dẫn này — khởi tạo, triển khai, giám sát, triển khai lại, và dọn dẹp — áp dụng tương đương cho các ứng dụng và agent AI.

---

## Những Gì Bạn Đã Học Được

Chúc mừng! Bạn đã thành công:
- ✅ Đã khởi tạo dự án azd từ một mẫu
- ✅ Đã khám phá cấu trúc dự án và các tệp chính
- ✅ Đã triển khai một ứng dụng full-stack lên Azure
- ✅ Đã thay đổi mã và triển khai lại
- ✅ Đã quản lý nhiều môi trường
- ✅ Đã dọn dẹp tài nguyên

## 🎯 Bài Tập Xác Thực Kỹ Năng

### Bài Tập 1: Triển Khai Một Mẫu Khác (15 phút)
**Mục Tiêu**: Chứng minh khả năng làm chủ azd init và quy trình triển khai

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

**Tiêu Chuẩn Thành Công:**
- [ ] Ứng dụng triển khai mà không có lỗi
- [ ] Có thể truy cập URL ứng dụng trong trình duyệt
- [ ] Ứng dụng hoạt động chính xác (thêm/xóa todo)
- [ ] Đã dọn dẹp tất cả tài nguyên thành công

### Bài Tập 2: Tùy Chỉnh Cấu Hình (20 phút)
**Mục Tiêu**: Thực hành cấu hình biến môi trường

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

**Tiêu Chuẩn Thành Công:**
- [ ] Môi trường tùy chỉnh được tạo thành công
- [ ] Biến môi trường được thiết lập và có thể truy xuất
- [ ] Ứng dụng triển khai với cấu hình tùy chỉnh
- [ ] Có thể xác minh các cài đặt tùy chỉnh trong ứng dụng đã triển khai

### Bài Tập 3: Quy Trình Nhiều Môi Trường (25 phút)
**Mục Tiêu**: Làm chủ quản lý môi trường và chiến lược triển khai

```bash
# Tạo môi trường phát triển
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Ghi lại URL của môi trường phát triển
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Tạo môi trường dàn dựng
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Ghi lại URL của môi trường dàn dựng
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

**Tiêu Chuẩn Thành Công:**
- [ ] Hai môi trường được tạo với các cấu hình khác nhau
- [ ] Cả hai môi trường đều triển khai thành công
- [ ] Có thể chuyển giữa các môi trường bằng `azd env select`
- [ ] Biến môi trường khác nhau giữa các môi trường
- [ ] Đã dọn dẹp cả hai môi trường thành công

## 📊 Tiến Trình Của Bạn

**Thời Gian Đã Đầu Tư**: ~60-90 phút  
**Kỹ Năng Thu Được**:
- ✅ Khởi tạo dự án theo mẫu
- ✅ Cung cấp tài nguyên Azure
- ✅ Quy trình triển khai ứng dụng
- ✅ Quản lý môi trường
- ✅ Quản lý cấu hình
- ✅ Dọn dẹp tài nguyên và quản lý chi phí

**Tiếp theo**: Bạn đã sẵn sàng cho [Hướng Dẫn Cấu Hình](configuration.md) để học các mẫu cấu hình nâng cao!

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

# Đối với Container Apps, sử dụng Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Xung Đột Tên Tài Nguyên
```bash
# Sử dụng một tên môi trường duy nhất
azd env new dev-$(whoami)-$(date +%s)
```

### Vấn Đề Cổng/Mạng
```bash
# Kiểm tra xem các cổng có sẵn hay không
netstat -an | grep :3000
netstat -an | grep :3100
```

## Bước Tiếp Theo

Sau khi bạn đã hoàn thành dự án đầu tiên, hãy khám phá những chủ đề nâng cao sau:

### 1. Tùy Chỉnh Hạ Tầng
- [Hạ Tầng như Mã](../chapter-04-infrastructure/provisioning.md)
- [Thêm cơ sở dữ liệu, lưu trữ và các dịch vụ khác](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Thiết Lập CI/CD
- [Hướng Dẫn Triển Khai](../chapter-04-infrastructure/deployment-guide.md) - Các workflow CI/CD đầy đủ
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Cấu hình pipeline

### 3. Thực Hành Tốt Nhất Cho Sản Xuất
- [Hướng Dẫn Triển Khai](../chapter-04-infrastructure/deployment-guide.md) - Bảo mật, hiệu năng, và giám sát

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
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Trung Tâm Kiến Trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Khuôn khổ Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Cộng Đồng & Hỗ Trợ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Cộng Đồng Nhà Phát Triển Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mẫu & Ví Dụ
- [Thư viện Mẫu Chính Thức](https://azure.github.io/awesome-azd/)
- [Mẫu Cộng Đồng](https://github.com/Azure-Samples/azd-templates)
- [Mẫu Doanh Nghiệp](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Chúc mừng bạn đã hoàn thành dự án azd đầu tiên của mình!** Bạn giờ đã sẵn sàng xây dựng và triển khai các ứng dụng tuyệt vời trên Azure với sự tự tin.

---

**Điều Hướng Chương:**
- **📚 Course Home**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Current Chapter**: Chương 1 - Cơ Sở & Bắt Đầu Nhanh
- **⬅️ Previous**: [Cài Đặt & Thiết Lập](installation.md)
- **➡️ Next**: [Mang Ứng Dụng Của Bạn](bring-your-own-app.md)
- **🚀 Next Chapter**: [Chương 2: Phát Triển Ưu Tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->