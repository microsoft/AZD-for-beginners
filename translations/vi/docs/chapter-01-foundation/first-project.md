# Dự Án Đầu Tiên Của Bạn - Hướng Dẫn Thực Hành

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Nền Tảng & Bắt Đầu Nhanh
- **⬅️ Trước đó**: [Cài Đặt & Thiết Lập](installation.md)
- **➡️ Tiếp theo**: [Mang Ứng Dụng Của Bạn](bring-your-own-app.md)
- **🚀 Chương Kế Tiếp**: [Chương 2: Phát Triển Ưu Tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giới Thiệu

Chào mừng bạn đến với dự án Azure Developer CLI đầu tiên! Bạn sẽ triển khai một ứng dụng todo với giao diện React, API Node.js và Azure Cosmos DB. Mẫu giữ lại tên lịch sử `todo-nodejs-mongo`; hạ tầng hiện tại sử dụng Cosmos DB cho NoSQL, vì vậy hãy kiểm tra README và `infra/` đã tải về thay vì suy luận API cơ sở dữ liệu từ tên.

> Được xem xét dựa trên `azd 1.37.2` và mẫu công khai vào tháng 11 năm 2026. Các ví dụ dưới đây sử dụng Bash; trích xuất JSON cũng cần `jq`. Việc triển khai Azure phải trả phí và không được thực hiện trong quá trình xem xét này.

## Mục Tiêu Học Tập

Hoàn thành hướng dẫn này, bạn sẽ:
- Thành thạo quy trình khởi tạo dự án azd bằng cách sử dụng các mẫu
- Hiểu cấu trúc dự án Azure Developer CLI và các file cấu hình
- Thực hiện triển khai ứng dụng đầy đủ lên Azure với việc cung cấp hạ tầng
- Thực thi cập nhật ứng dụng và chiến lược triển khai lại
- Quản lý nhiều môi trường cho phát triển và thử nghiệm
- Áp dụng thực hành dọn dẹp tài nguyên và quản lý chi phí

## Kết Quả Học Tập

Khi hoàn thành, bạn sẽ có khả năng:
- Khởi tạo và cấu hình dự án azd từ mẫu một cách độc lập
- Dẫn dắt và chỉnh sửa cấu trúc dự án azd hiệu quả
- Triển khai ứng dụng full-stack lên Azure bằng các lệnh đơn
- Xử lý các vấn đề phổ biến khi triển khai và xác thực
- Quản lý nhiều môi trường Azure cho các giai đoạn triển khai khác nhau
- Triển khai quy trình liên tục cho các bản cập nhật ứng dụng

## Bắt Đầu

### Danh Sách Kiểm Tra Điều Kiện Cần Thiết
- ✅ Đã cài đặt Azure Developer CLI ([Hướng Dẫn Cài Đặt](installation.md))
- ✅ Đã thực hiện xác thực AZD với `azd auth login`
- ✅ Đã cài đặt Git trên hệ thống của bạn
- ✅ Node.js 22 LTS (hoặc phiên bản được mẫu tải về yêu cầu)
- ✅ Có Visual Studio Code (khuyến nghị)

Trước khi tiếp tục, hãy chạy trình kiểm tra thiết lập từ thư mục gốc kho lưu trữ:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Xác Minh Thiết Lập
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Xác Minh xác thực Azure CLI tùy chọn

```bash
az account show
```

### Kiểm tra phiên bản Node.js
```bash
node --version
```

## Bước 1: Chọn và Khởi Tạo Mẫu

Hãy bắt đầu với mẫu ứng dụng todo phổ biến bao gồm frontend React và backend API Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Điều Gì Vừa Xảy Ra?
- Đã tải mã mẫu về thư mục cục bộ
- Tạo file `azure.yaml` với các định nghĩa dịch vụ
- Thiết lập mã hạ tầng trong thư mục `infra/`
- Tạo cấu hình môi trường

## Bước 2: Khám Phá Cấu Trúc Dự Án

Hãy xem azd đã tạo gì cho chúng ta:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Bạn sẽ thấy:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Các File Quan Trọng Cần Hiểu

**azure.yaml** - Trung tâm của dự án azd của bạn:
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

### Chỉnh Sửa Giao Diện Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Thực hiện một thay đổi đơn giản:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Cấu Hình Biến Môi Trường
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Hai giá trị tùy chỉnh này chỉ minh họa lưu trữ cục bộ. Mẫu gốc không sử dụng `WEBSITE_TITLE` hay `API_VERSION`, nên không thay đổi ứng dụng. Việc chỉnh sửa nguồn rõ ràng phía trên làm thay đổi tiêu đề hiển thị.

## Bước 4: Triển Khai Lên Azure

Giờ là phần thú vị - triển khai mọi thứ lên Azure!

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

Quy trình cung cấp hạ tầng và đóng gói/triển khai mã. Thứ tự chính xác có thể tùy chỉnh qua `workflows.up` trong `azure.yaml`; mẫu này quy định provision trước, deploy sau. Đừng phụ thuộc vào một thứ tự giai đoạn chung cho mọi mẫu.

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

### Truy Cập Ứng Dụng
Nhấp vào URL được cung cấp trong kết quả triển khai, hoặc lấy bất cứ lúc nào:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Kiểm Tra Ứng Dụng Todo
1. **Thêm một mục todo** - Nhấn "Add Todo" và nhập công việc
2. **Đánh dấu hoàn thành** - Đánh dấu các mục đã xong
3. **Xóa các mục** - Loại bỏ các todo không cần nữa

### Theo Dõi Ứng Dụng Của Bạn
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Xác Minh Triển Khai

Trước khi tiếp tục, hãy thực hiện danh sách kiểm tra nhanh này để xác nhận mọi thứ thực sự hoạt động — đừng nghĩ "triển khai thành công" nghĩa là "ứng dụng chạy tốt":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Triển khai được xác minh khi:**
- ✅ `azd show` liệt kê URL endpoint có thể truy cập
- ✅ URL mở được trong trình duyệt mà không lỗi
- ✅ Các tính năng chính hoạt động (thêm/hoàn thành/xóa todo)
- ✅ `azd monitor --logs` hiển thị các yêu cầu đến mà không có lỗi không mong muốn

Nếu bất kỳ kiểm tra nào thất bại, hãy chuyển đến [Chương 7: Xử Lý Sự Cố](../chapter-07-troubleshooting/README.md).

## Bước 6: Thay Đổi và Triển Khai Lại

Hãy cùng thay đổi một chút và xem việc cập nhật dễ dàng thế nào:

### Chỉnh sửa API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Thêm một header phản hồi tùy chỉnh:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Triển khai Chỉ Các Thay Đổi Mã
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Bước 7: Quản Lý Nhiều Môi Trường

Tạo một môi trường staging để kiểm tra thay đổi trước khi đưa lên production:

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

### So Sánh Các Môi Trường
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Bước 8: Dọn Dẹp Tài Nguyên

Sau khi thử nghiệm xong, dọn dẹp để tránh phát sinh chi phí:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Ứng Dụng Cổ Điển vs. Ứng Dụng AI: Cùng Quy Trình

Bạn vừa triển khai một ứng dụng web truyền thống. Nhưng nếu bạn muốn triển khai một ứng dụng AI — ví dụ, ứng dụng chat với Microsoft Foundry Models?

Tin vui là: **quy trình hoàn toàn giống nhau.**

| Bước | Ứng Dụng Todo Cổ Điển | Ứng Dụng Chat AI |
|------|-----------------|-------------|
| Khởi tạo (thư mục rỗng) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Xác thực | `azd auth login` | `azd auth login` |
| Triển khai | `azd up` | `azd up` |
| Theo dõi | `azd monitor` | `azd monitor` |
| Dọn dẹp | `azd down --force --purge` | `azd down --force --purge` |

Các lệnh vòng đời giống nhau, nhưng điều kiện tiên quyết khác nhau. Mẫu AI có thể đòi hỏi quyền truy cập mô hình, hạn ngạch vùng, nhập dữ liệu, và cấu hình thêm. Đọc README trước khi triển khai; `azd up` không thể cung cấp quyền hạn hoặc hạn ngạch còn thiếu.

Đây là nguyên tắc cốt lõi của azd: **một quy trình, mọi loại workload.** Kỹ năng bạn luyện tập trong hướng dẫn này — khởi tạo, triển khai, theo dõi, triển khai lại, và dọn dẹp — áp dụng tương đương cho ứng dụng và tác nhân AI.

---

## Những Gì Bạn Đã Học

Chúc mừng! Bạn đã thành công:
- ✅ Khởi tạo dự án azd từ mẫu
- ✅ Khám phá cấu trúc dự án và các file quan trọng
- ✅ Triển khai ứng dụng full-stack lên Azure
- ✅ Thực hiện thay đổi mã và triển khai lại
- ✅ Quản lý nhiều môi trường
- ✅ Dọn dẹp tài nguyên

## 🎯 Bài Tập Kiểm Tra Kỹ Năng

### Bài Tập 1: Triển Khai Mẫu Khác (15 phút)
**Mục Tiêu**: Chứng minh thành thạo azd init và quy trình triển khai

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Tiêu Chí Thành Công:**
- [ ] Ứng dụng triển khai không lỗi
- [ ] Có thể truy cập URL ứng dụng trên trình duyệt
- [ ] Ứng dụng hoạt động đúng (thêm/xóa todo)
- [ ] Đã dọn sạch toàn bộ tài nguyên thành công

### Bài Tập 2: Tùy Chỉnh Cấu Hình (20 phút)
**Mục Tiêu**: Thực hành lưu trữ giá trị môi trường cục bộ mà không nhầm thành cấu hình chạy

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Tiêu Chí Thành Công:**
- [ ] Môi trường tùy chỉnh tạo thành công
- [ ] Biến môi trường được thiết lập và lấy ra
- [ ] `azd env get-value APP_TITLE` in ra `My Custom Todo App`
- [ ] Có thể giải thích vì sao các giá trị này không thay đổi ứng dụng mặc định trừ khi mã/hạ tầng sử dụng chúng

### Bài Tập 3: Quy Trình Nhiều Môi Trường (25 phút)
**Mục Tiêu**: Thành thạo quản lý môi trường và chiến lược triển khai

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Tiêu Chí Thành Công:**
- [ ] Tạo 2 môi trường với cấu hình khác nhau
- [ ] Cả hai môi trường được triển khai thành công
- [ ] Có thể chuyển đổi giữa các môi trường bằng `azd env select`
- [ ] Các biến môi trường khác nhau ở mỗi môi trường
- [ ] Đã dọn dẹp thành công cả hai môi trường

## 📊 Tiến Trình Của Bạn

**Thời Gian Đã Đầu Tư**: ~60-90 phút  
**Kỹ Năng Đạt Được**:
- ✅ Khởi tạo dự án dựa trên mẫu
- ✅ Cung cấp tài nguyên Azure
- ✅ Quy trình triển khai ứng dụng
- ✅ Quản lý môi trường
- ✅ Quản lý cấu hình
- ✅ Dọn dẹp tài nguyên và quản lý chi phí

**Cấp Độ Tiếp Theo**: Bạn đã sẵn sàng cho [Hướng Dẫn Cấu Hình](../chapter-03-configuration/configuration.md) học các mẫu cấu hình nâng cao!

## Xử Lý Các Vấn Đề Phổ Biến

### Lỗi Xác Thực
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Triển Khai Thất Bại
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Trùng Tên Tài Nguyên
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Lỗi Cổng/Mạng
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Bước Tiếp Theo

Bây giờ bạn đã hoàn thành dự án đầu tiên, hãy khám phá các chủ đề nâng cao sau:

### 1. Tùy Chỉnh Hạ Tầng
- [Hạ Tầng Dưới Dạng Mã](../chapter-04-infrastructure/provisioning.md)
- [Thêm hạ tầng cơ sở dữ liệu](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Thiết Lập CI/CD
- [Hướng Dẫn Triển Khai](../chapter-04-infrastructure/deployment-guide.md) - Quy trình CI/CD hoàn chỉnh
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Cấu hình pipeline

### 3. Thực Hành Tốt Nhất Cho Production
- [Hướng Dẫn Triển Khai](../chapter-04-infrastructure/deployment-guide.md) - Bảo mật, hiệu năng, và giám sát

### 4. Khám Phá Các Mẫu Khác
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Tài Nguyên Bổ Sung

### Tài Liệu Học Tập
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Trung Tâm Kiến Trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Khung Kiến Trúc Tốt Nhất Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Cộng Đồng & Hỗ Trợ
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Cộng Đồng Người Phát Triển Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mẫu & Ví Dụ
- [Thư Viện Mẫu Chính Thức](https://azure.github.io/awesome-azd/)
- [Đóng Góp Mẫu Cộng Đồng](https://github.com/Azure/awesome-azd)
- [Nguồn Mẫu Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Chúc mừng bạn đã hoàn thành dự án azd đầu tiên!** Giờ bạn đã sẵn sàng xây dựng và triển khai các ứng dụng tuyệt vời trên Azure với sự tự tin.

---

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Nền Tảng & Bắt Đầu Nhanh
- **⬅️ Trước đó**: [Cài Đặt & Thiết Lập](installation.md)
- **➡️ Tiếp theo**: [Mang Ứng Dụng Của Bạn](bring-your-own-app.md)
- **🚀 Chương Kế Tiếp**: [Chương 2: Phát Triển Ưu Tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->