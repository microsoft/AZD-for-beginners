# Các Sự Cố Thường Gặp và Giải Pháp

**Điều hướng Chương:**
- **📚 Trang Khóa Học**: [AZD Dành Cho Người Mới](../../README.md)
- **📖 Chương hiện tại**: Chương 7 - Khắc phục sự cố & Gỡ lỗi
- **⬅️ Chương trước**: [Chương 6: Kiểm tra trước khi triển khai](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Tiếp theo**: [Hướng dẫn Gỡ lỗi](debugging.md)
- **🚀 Chương tiếp theo**: [Chương 8: Mô hình Sản xuất & Doanh nghiệp](../chapter-08-production/production-ai-practices.md)

## Giới thiệu

Hướng dẫn khắc phục sự cố toàn diện này bao gồm những vấn đề thường gặp nhất khi sử dụng Azure Developer CLI. Học cách chẩn đoán, xử lý và giải quyết các sự cố phổ biến liên quan đến xác thực, triển khai, cung cấp hạ tầng và cấu hình ứng dụng. Mỗi vấn đề bao gồm triệu chứng chi tiết, nguyên nhân gốc rễ và các bước giải quyết theo trình tự.

## Mục tiêu học tập

Sau khi hoàn thành hướng dẫn này, bạn sẽ:
- Làm chủ các kỹ thuật chẩn đoán cho các sự cố Azure Developer CLI
- Hiểu các vấn đề phổ biến về xác thực và quyền hạn cùng các giải pháp của chúng
- Giải quyết sự cố thất bại triển khai, lỗi cung cấp hạ tầng và vấn đề cấu hình
- Thực hiện các chiến lược giám sát và gỡ lỗi chủ động
- Áp dụng phương pháp khắc phục có hệ thống cho các vấn đề phức tạp
- Cấu hình ghi nhật ký và giám sát phù hợp để ngăn ngừa sự cố trong tương lai

## Thành quả học tập

Khi hoàn tất, bạn sẽ có thể:
- Chẩn đoán các sự cố Azure Developer CLI bằng các công cụ chẩn đoán tích hợp
- Giải quyết độc lập các vấn đề liên quan đến xác thực, đăng ký và quyền
- Khắc phục hiệu quả các lỗi thất bại triển khai và cung cấp hạ tầng
- Gỡ lỗi các sự cố cấu hình ứng dụng và vấn đề theo môi trường
- Triển khai hệ thống giám sát và cảnh báo để nhận diện sớm các vấn đề tiềm ẩn
- Áp dụng các thực hành tốt nhất cho ghi nhật ký, gỡ lỗi và quy trình xử lý sự cố

## Chẩn đoán Nhanh

Trước khi đi sâu vào các vấn đề cụ thể, chạy các lệnh này để thu thập thông tin chẩn đoán:

```bash
# Kiểm tra phiên bản và trạng thái của azd
azd version
azd config list

# Xác minh xác thực Azure
az account show
az account list

# Kiểm tra môi trường hiện tại
azd env show
azd env get-values

# Bật ghi nhật ký gỡ lỗi
export AZD_DEBUG=true
azd <command> --debug
```

## Vấn đề Xác thực

### Sự cố: "Failed to get access token"
**Triệu chứng:**
- `azd up` thất bại với lỗi xác thực
- Các lệnh trả về "unauthorized" hoặc "access denied"

**Giải pháp:**
```bash
# 1. Xác thực lại bằng Azure CLI
az login
az account show

# 2. Xóa các chứng thực được lưu trong bộ nhớ đệm
az account clear
az login

# 3. Sử dụng luồng mã thiết bị (cho hệ thống không có giao diện người dùng)
az login --use-device-code

# 4. Chỉ định đăng ký cụ thể
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Sự cố: "Insufficient privileges" trong quá trình triển khai
**Triệu chứng:**
- Triển khai thất bại với lỗi quyền
- Không thể tạo một số tài nguyên Azure nhất định

**Giải pháp:**
```bash
# 1. Kiểm tra gán vai trò Azure của bạn
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Đảm bảo bạn có các vai trò cần thiết
# - Contributor (để tạo tài nguyên)
# - User Access Administrator (để gán vai trò)

# 3. Liên hệ với quản trị viên Azure của bạn để được cấp quyền phù hợp
```

### Sự cố: Vấn đề xác thực đa tenancy
**Giải pháp:**
```bash
# 1. Đăng nhập với tenant cụ thể
az login --tenant "your-tenant-id"

# 2. Đặt tenant trong cấu hình
azd config set auth.tenantId "your-tenant-id"

# 3. Xóa bộ nhớ đệm của tenant nếu chuyển tenant
az account clear
```

## 🏗️ Lỗi Cung cấp Hạ tầng

### Sự cố: Xung đột tên tài nguyên
**Triệu chứng:**
- Lỗi "The resource name already exists"
- Triển khai thất bại khi tạo tài nguyên

**Giải pháp:**
```bash
# 1. Sử dụng tên tài nguyên duy nhất với các token
# Trong mẫu Bicep của bạn:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Thay đổi tên môi trường
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Dọn dẹp các tài nguyên hiện có
azd down --force --purge
```

### Sự cố: Vị trí/Khu vực không khả dụng
**Triệu chứng:**
- Lỗi "The location 'xyz' is not available for resource type"
- Một số SKU không khả dụng ở khu vực đã chọn

**Giải pháp:**
```bash
# 1. Kiểm tra các vị trí có sẵn cho các loại tài nguyên
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Sử dụng các khu vực phổ biến có sẵn
azd config set defaults.location eastus2
# hoặc
azd env set AZURE_LOCATION eastus2

# 3. Kiểm tra tính khả dụng của dịch vụ theo khu vực
# Truy cập: https://azure.microsoft.com/global-infrastructure/services/
```

### Sự cố: Vượt quá hạn mức (Quota exceeded)
**Triệu chứng:**
- Lỗi "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Giải pháp:**
```bash
# 1. Kiểm tra mức sử dụng hạn ngạch hiện tại
az vm list-usage --location eastus2 -o table

# 2. Yêu cầu tăng hạn ngạch qua cổng Azure
# Đi tới: Subscriptions > Usage + quotas

# 3. Sử dụng SKU nhỏ hơn cho phát triển
# Trong main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Dọn dẹp các tài nguyên không sử dụng
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Sự cố: Lỗi template Bicep
**Triệu chứng:**
- Xác thực template thất bại
- Lỗi cú pháp trong các tệp Bicep

**Giải pháp:**
```bash
# 1. Xác thực cú pháp Bicep
az bicep build --file infra/main.bicep

# 2. Sử dụng linter cho Bicep
az bicep lint --file infra/main.bicep

# 3. Kiểm tra cú pháp tệp tham số
cat infra/main.parameters.json | jq '.'

# 4. Xem trước các thay đổi triển khai
azd provision --preview
```

## 🚀 Thất bại Triển khai

### Sự cố: Build thất bại
**Triệu chứng:**
- Ứng dụng không thể build trong quá trình triển khai
- Lỗi khi cài đặt gói

**Giải pháp:**
```bash
# 1. Kiểm tra đầu ra bản dựng bằng cờ gỡ lỗi
azd deploy --service web --debug

# 2. Xem trạng thái dịch vụ đã triển khai
azd show

# 3. Kiểm tra bản dựng cục bộ
cd src/web
npm install
npm run build

# 3. Kiểm tra tương thích phiên bản Node.js và Python
node --version  # Nên khớp với cài đặt trong azure.yaml
python --version

# 4. Xóa bộ nhớ đệm bản dựng
rm -rf node_modules package-lock.json
npm install

# 5. Kiểm tra Dockerfile nếu sử dụng container
docker build -t test-image .
docker run --rm test-image
```

### Sự cố: Triển khai container thất bại
**Triệu chứng:**
- Ứng dụng container không khởi động được
- Lỗi kéo image

**Giải pháp:**
```bash
# 1. Kiểm tra build Docker cục bộ
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Kiểm tra nhật ký của container bằng Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Giám sát ứng dụng thông qua azd
azd monitor --logs

# 3. Xác minh quyền truy cập vào đăng ký container
az acr login --name myregistry

# 4. Kiểm tra cấu hình ứng dụng container
az containerapp show --name my-app --resource-group my-rg
```

### Sự cố: Kết nối cơ sở dữ liệu thất bại
**Triệu chứng:**
- Ứng dụng không thể kết nối với cơ sở dữ liệu
- Lỗi hết thời gian kết nối

**Giải pháp:**
```bash
# 1. Kiểm tra các quy tắc tường lửa của cơ sở dữ liệu
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Kiểm tra kết nối từ ứng dụng
# Tạm thời thêm vào ứng dụng của bạn:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Xác minh định dạng chuỗi kết nối
azd env get-values | grep DATABASE

# 4. Kiểm tra trạng thái máy chủ cơ sở dữ liệu
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Vấn đề Cấu hình

### Sự cố: Biến môi trường không hoạt động
**Triệu chứng:**
- Ứng dụng không đọc được giá trị cấu hình
- Biến môi trường hiển thị rỗng

**Giải pháp:**
```bash
# 1. Xác minh các biến môi trường đã được thiết lập
azd env get-values
azd env get DATABASE_URL

# 2. Kiểm tra tên biến trong azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Khởi động lại ứng dụng
azd deploy --service web

# 4. Kiểm tra cấu hình dịch vụ ứng dụng
az webapp config appsettings list --name myapp --resource-group myrg
```

### Sự cố: Vấn đề chứng chỉ SSL/TLS
**Triệu chứng:**
- HTTPS không hoạt động
- Lỗi xác thực chứng chỉ

**Giải pháp:**
```bash
# 1. Kiểm tra trạng thái chứng chỉ SSL
az webapp config ssl list --resource-group myrg

# 2. Chỉ cho phép HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Thêm tên miền tùy chỉnh (nếu cần)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Sự cố: Cấu hình CORS
**Triệu chứng:**
- Frontend không thể gọi API
- Yêu cầu cross-origin bị chặn

**Giải pháp:**
```bash
# 1. Cấu hình CORS cho App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Cập nhật API để xử lý CORS
# Trong Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Kiểm tra xem có đang chạy trên các URL chính xác không
azd show
```

## 🌍 Vấn đề Quản lý Môi trường

### Sự cố: Chuyển môi trường gặp vấn đề
**Triệu chứng:**
- Môi trường sai đang được sử dụng
- Cấu hình không chuyển đổi đúng

**Giải pháp:**
```bash
# 1. Liệt kê tất cả các môi trường
azd env list

# 2. Chọn môi trường một cách rõ ràng
azd env select production

# 3. Xác minh môi trường hiện tại
azd env show

# 4. Tạo môi trường mới nếu bị hỏng
azd env new production-new
azd env select production-new
```

### Sự cố: Hỏng môi trường
**Triệu chứng:**
- Môi trường hiển thị trạng thái không hợp lệ
- Tài nguyên không khớp với cấu hình

**Giải pháp:**
```bash
# 1. Làm mới trạng thái môi trường
azd env refresh

# 2. Đặt lại cấu hình môi trường
azd env new production-reset
# Sao chép các biến môi trường cần thiết
azd env set DATABASE_URL "your-value"

# 3. Nhập các tài nguyên hiện có (nếu có thể)
# Cập nhật thủ công .azure/production/config.json bằng các ID tài nguyên
```

## 🔍 Vấn đề Hiệu năng

### Sự cố: Thời gian triển khai chậm
**Triệu chứng:**
- Các lần triển khai mất quá nhiều thời gian
- Timeout trong quá trình triển khai

**Giải pháp:**
```bash
# 1. Triển khai các dịch vụ cụ thể để lặp nhanh hơn
azd deploy --service web
azd deploy --service api

# 2. Chỉ triển khai mã khi hạ tầng không thay đổi
azd deploy  # Nhanh hơn azd up

# 3. Tối ưu hóa quy trình build
# Trong package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Kiểm tra vị trí tài nguyên (sử dụng cùng một vùng)
azd config set defaults.location eastus2
```

### Sự cố: Ứng dụng chậm
**Triệu chứng:**
- Thời gian phản hồi chậm
- Sử dụng tài nguyên cao

**Giải pháp:**
```bash
# 1. Tăng quy mô tài nguyên
# Cập nhật SKU trong main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Bật giám sát Application Insights
azd monitor --overview

# 3. Kiểm tra nhật ký ứng dụng trong Azure
az webapp log tail --name myapp --resource-group myrg
# hoặc cho Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Triển khai bộ nhớ đệm
# Thêm bộ nhớ đệm Redis vào hạ tầng của bạn
```

## 🛠️ Công cụ và Lệnh Khắc phục Sự cố

### Lệnh Gỡ lỗi
```bash
# Gỡ lỗi toàn diện
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Kiểm tra phiên bản azd
azd version

# Xem cấu hình hiện tại
azd config list

# Kiểm tra kết nối
curl -v https://myapp.azurewebsites.net/health
```

### Phân tích Nhật ký
```bash
# Nhật ký ứng dụng qua Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Giám sát ứng dụng với azd
azd monitor --logs
azd monitor --live

# Nhật ký tài nguyên Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Nhật ký container (cho Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Điều tra Tài nguyên
```bash
# Liệt kê tất cả các tài nguyên
az resource list --resource-group myrg -o table

# Kiểm tra trạng thái tài nguyên
az webapp show --name myapp --resource-group myrg --query state

# Chẩn đoán mạng
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Nhận Thêm Trợ Giúp

### Khi nào cần chuyển tiếp
- Vấn đề xác thực vẫn tồn tại sau khi thử tất cả giải pháp
- Sự cố hạ tầng liên quan đến dịch vụ Azure
- Vấn đề liên quan đến thanh toán hoặc đăng ký
- Mối quan tâm hoặc sự cố bảo mật

### Kênh hỗ trợ
```bash
# 1. Kiểm tra trạng thái dịch vụ Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Tạo yêu cầu hỗ trợ Azure
# Đi tới: https://portal.azure.com -> Trợ giúp + hỗ trợ

# 3. Tài nguyên cộng đồng
# - Stack Overflow: thẻ azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Thông tin cần thu thập
Trước khi liên hệ hỗ trợ, thu thập:
- `azd version` đầu ra
- `azd config list` đầu ra
- `azd show` đầu ra (trạng thái triển khai hiện tại)
- Thông báo lỗi (toàn bộ văn bản)
- Các bước để tái tạo sự cố
- Chi tiết môi trường (`azd env show`)
- Mốc thời gian khi sự cố bắt đầu

### Script thu thập nhật ký
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Ngăn ngừa Sự cố

### Danh sách kiểm tra trước khi triển khai
```bash
# 1. Xác minh xác thực
az account show

# 2. Kiểm tra hạn ngạch và giới hạn
az vm list-usage --location eastus2

# 3. Xác minh các mẫu
az bicep build --file infra/main.bicep

# 4. Thử nghiệm cục bộ trước
npm run build
npm run test

# 5. Sử dụng triển khai chạy thử
azd provision --preview
```

### Thiết lập Giám sát
```bash
# Bật Application Insights
# Thêm vào main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Thiết lập cảnh báo
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Bảo trì định kỳ
```bash
# Kiểm tra sức khỏe hàng tuần
./scripts/health-check.sh

# Đánh giá chi phí hàng tháng
az consumption usage list --billing-period-name 202401

# Đánh giá bảo mật hàng quý
az security assessment list --resource-group myrg
```

## Tài nguyên Liên quan

- [Hướng dẫn Gỡ lỗi](debugging.md) - Kỹ thuật gỡ lỗi nâng cao
- [Cung cấp Tài nguyên](../chapter-04-infrastructure/provisioning.md) - Khắc phục sự cố hạ tầng
- [Lập kế hoạch Dung lượng](../chapter-06-pre-deployment/capacity-planning.md) - Hướng dẫn lập kế hoạch tài nguyên
- [Lựa chọn SKU](../chapter-06-pre-deployment/sku-selection.md) - Khuyến nghị cấp dịch vụ

---

**Mẹo**: Đánh dấu trang này và tham khảo khi gặp sự cố. Hầu hết các vấn đề đã từng gặp trước đây và có giải pháp đã được thiết lập!

---

**Điều hướng**
- **Bài học trước**: [Cung cấp Tài nguyên](../chapter-04-infrastructure/provisioning.md)
- **Bài học tiếp theo**: [Hướng dẫn Gỡ lỗi](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này được dịch bằng dịch vụ dịch AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc sai sót. Văn bản gốc bằng ngôn ngữ ban đầu của tài liệu nên được coi là nguồn chính thức. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->