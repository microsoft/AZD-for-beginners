# Các Vấn Đề Thường Gặp và Giải Pháp

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 7 - Xử Lý Sự Cố & Gỡ Lỗi
- **⬅️ Chương Trước**: [Chương 6: Kiểm Tra Trước Khi Triển Khai](../pre-deployment/preflight-checks.md)
- **➡️ Tiếp Theo**: [Hướng Dẫn Gỡ Lỗi](debugging.md)
- **🚀 Chương Tiếp Theo**: [Chương 8: Mô Hình Sản Xuất & Doanh Nghiệp](../microsoft-foundry/production-ai-practices.md)

## Giới Thiệu

Hướng dẫn xử lý sự cố toàn diện này bao gồm các vấn đề thường gặp nhất khi sử dụng Azure Developer CLI. Học cách chẩn đoán, xử lý sự cố và giải quyết các vấn đề phổ biến liên quan đến xác thực, triển khai, cung cấp hạ tầng và cấu hình ứng dụng. Mỗi vấn đề đều có các triệu chứng chi tiết, nguyên nhân gốc rễ và các bước giải quyết cụ thể.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Thành thạo các kỹ thuật chẩn đoán vấn đề với Azure Developer CLI
- Hiểu các vấn đề phổ biến về xác thực và quyền hạn cùng giải pháp của chúng
- Giải quyết các lỗi triển khai, lỗi cung cấp hạ tầng và vấn đề cấu hình
- Áp dụng các chiến lược giám sát và gỡ lỗi chủ động
- Thực hiện các phương pháp xử lý sự cố hệ thống cho các vấn đề phức tạp
- Cấu hình ghi nhật ký và giám sát đúng cách để ngăn ngừa các vấn đề trong tương lai

## Kết Quả Học Tập

Sau khi hoàn thành, bạn sẽ có thể:
- Chẩn đoán các vấn đề của Azure Developer CLI bằng các công cụ chẩn đoán tích hợp
- Tự giải quyết các vấn đề liên quan đến xác thực, đăng ký và quyền hạn
- Xử lý hiệu quả các lỗi triển khai và lỗi cung cấp hạ tầng
- Gỡ lỗi các vấn đề cấu hình ứng dụng và các vấn đề liên quan đến môi trường
- Triển khai giám sát và cảnh báo để nhận diện các vấn đề tiềm ẩn một cách chủ động
- Áp dụng các phương pháp tốt nhất cho ghi nhật ký, gỡ lỗi và quy trình giải quyết vấn đề

## Chẩn Đoán Nhanh

Trước khi đi sâu vào các vấn đề cụ thể, hãy chạy các lệnh sau để thu thập thông tin chẩn đoán:

```bash
# Kiểm tra phiên bản azd và trạng thái hoạt động
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

## Vấn Đề Xác Thực

### Vấn Đề: "Không lấy được mã truy cập"
**Triệu Chứng:**
- `azd up` thất bại với lỗi xác thực
- Các lệnh trả về "không được phép" hoặc "truy cập bị từ chối"

**Giải Pháp:**
```bash
# 1. Xác thực lại với Azure CLI
az login
az account show

# 2. Xóa thông tin xác thực được lưu trong bộ nhớ cache
az account clear
az login

# 3. Sử dụng luồng mã thiết bị (cho hệ thống không có giao diện)
az login --use-device-code

# 4. Đặt đăng ký cụ thể
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Vấn Đề: "Không đủ quyền" khi triển khai
**Triệu Chứng:**
- Triển khai thất bại với lỗi quyền hạn
- Không thể tạo một số tài nguyên Azure

**Giải Pháp:**
```bash
# 1. Kiểm tra các phân công vai trò Azure của bạn
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Đảm bảo bạn có các vai trò cần thiết
# - Người đóng góp (để tạo tài nguyên)
# - Quản trị viên truy cập người dùng (để phân công vai trò)

# 3. Liên hệ với quản trị viên Azure của bạn để có quyền phù hợp
```

### Vấn Đề: Các vấn đề xác thực đa tenant
**Giải Pháp:**
```bash
# 1. Đăng nhập với tenant cụ thể
az login --tenant "your-tenant-id"

# 2. Đặt tenant trong cấu hình
azd config set auth.tenantId "your-tenant-id"

# 3. Xóa bộ nhớ đệm của tenant nếu chuyển đổi tenant
az account clear
```

## 🏗️ Lỗi Cung Cấp Hạ Tầng

### Vấn Đề: Xung đột tên tài nguyên
**Triệu Chứng:**
- Lỗi "Tên tài nguyên đã tồn tại"
- Triển khai thất bại khi tạo tài nguyên

**Giải Pháp:**
```bash
# 1. Sử dụng tên tài nguyên duy nhất với token
# Trong mẫu Bicep của bạn:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Thay đổi tên môi trường
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Dọn dẹp các tài nguyên hiện có
azd down --force --purge
```

### Vấn Đề: Vị trí/Khu vực không khả dụng
**Triệu Chứng:**
- Lỗi "Vị trí 'xyz' không khả dụng cho loại tài nguyên"
- Một số SKU không khả dụng trong khu vực đã chọn

**Giải Pháp:**
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

### Vấn Đề: Lỗi vượt quá hạn mức
**Triệu Chứng:**
- Lỗi "Hạn mức vượt quá cho loại tài nguyên"
- "Số lượng tài nguyên tối đa đã đạt"

**Giải Pháp:**
```bash
# 1. Kiểm tra mức sử dụng hạn ngạch hiện tại
az vm list-usage --location eastus2 -o table

# 2. Yêu cầu tăng hạn ngạch thông qua cổng Azure
# Đi tới: Subscriptions > Usage + quotas

# 3. Sử dụng các SKU nhỏ hơn cho phát triển
# Trong main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Dọn dẹp các tài nguyên không sử dụng
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Vấn Đề: Lỗi mẫu Bicep
**Triệu Chứng:**
- Lỗi xác thực mẫu
- Lỗi cú pháp trong các tệp Bicep

**Giải Pháp:**
```bash
# 1. Xác thực cú pháp Bicep
az bicep build --file infra/main.bicep

# 2. Sử dụng Bicep linter
az bicep lint --file infra/main.bicep

# 3. Kiểm tra cú pháp tệp tham số
cat infra/main.parameters.json | jq '.'

# 4. Xem trước các thay đổi triển khai
azd provision --preview
```

## 🚀 Lỗi Triển Khai

### Vấn Đề: Lỗi xây dựng
**Triệu Chứng:**
- Ứng dụng không thể xây dựng trong quá trình triển khai
- Lỗi cài đặt gói

**Giải Pháp:**
```bash
# 1. Kiểm tra nhật ký xây dựng
azd logs --service web
azd deploy --service web --debug

# 2. Kiểm tra xây dựng cục bộ
cd src/web
npm install
npm run build

# 3. Kiểm tra khả năng tương thích phiên bản Node.js/Python
node --version  # Nên khớp với cài đặt azure.yaml
python --version

# 4. Xóa bộ nhớ đệm xây dựng
rm -rf node_modules package-lock.json
npm install

# 5. Kiểm tra Dockerfile nếu sử dụng container
docker build -t test-image .
docker run --rm test-image
```

### Vấn Đề: Lỗi triển khai container
**Triệu Chứng:**
- Ứng dụng container không thể khởi động
- Lỗi kéo hình ảnh

**Giải Pháp:**
```bash
# 1. Kiểm tra xây dựng Docker cục bộ
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Kiểm tra nhật ký container
azd logs --service api --follow

# 3. Xác minh quyền truy cập vào registry container
az acr login --name myregistry

# 4. Kiểm tra cấu hình ứng dụng container
az containerapp show --name my-app --resource-group my-rg
```

### Vấn Đề: Lỗi kết nối cơ sở dữ liệu
**Triệu Chứng:**
- Ứng dụng không thể kết nối với cơ sở dữ liệu
- Lỗi hết thời gian kết nối

**Giải Pháp:**
```bash
# 1. Kiểm tra quy tắc tường lửa cơ sở dữ liệu
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Kiểm tra kết nối từ ứng dụng
# Thêm vào ứng dụng của bạn tạm thời:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Xác minh định dạng chuỗi kết nối
azd env get-values | grep DATABASE

# 4. Kiểm tra trạng thái máy chủ cơ sở dữ liệu
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Vấn Đề Cấu Hình

### Vấn Đề: Biến môi trường không hoạt động
**Triệu Chứng:**
- Ứng dụng không thể đọc giá trị cấu hình
- Biến môi trường hiển thị trống

**Giải Pháp:**
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

### Vấn Đề: Vấn đề chứng chỉ SSL/TLS
**Triệu Chứng:**
- HTTPS không hoạt động
- Lỗi xác thực chứng chỉ

**Giải Pháp:**
```bash
# 1. Kiểm tra trạng thái chứng chỉ SSL
az webapp config ssl list --resource-group myrg

# 2. Chỉ bật HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Thêm tên miền tùy chỉnh (nếu cần)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Vấn Đề: Vấn đề cấu hình CORS
**Triệu Chứng:**
- Frontend không thể gọi API
- Yêu cầu cross-origin bị chặn

**Giải Pháp:**
```bash
# 1. Cấu hình CORS cho App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Cập nhật API để xử lý CORS
# Trong Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Kiểm tra xem có chạy trên đúng URL không
azd show
```

## 🌍 Vấn Đề Quản Lý Môi Trường

### Vấn Đề: Vấn đề chuyển đổi môi trường
**Triệu Chứng:**
- Môi trường sai đang được sử dụng
- Cấu hình không chuyển đổi đúng cách

**Giải Pháp:**
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

### Vấn Đề: Hỏng môi trường
**Triệu Chứng:**
- Môi trường hiển thị trạng thái không hợp lệ
- Tài nguyên không khớp với cấu hình

**Giải Pháp:**
```bash
# 1. Làm mới trạng thái môi trường
azd env refresh

# 2. Đặt lại cấu hình môi trường
azd env new production-reset
# Sao chép các biến môi trường cần thiết
azd env set DATABASE_URL "your-value"

# 3. Nhập các tài nguyên hiện có (nếu có thể)
# Cập nhật thủ công .azure/production/config.json với ID tài nguyên
```

## 🔍 Vấn Đề Hiệu Suất

### Vấn Đề: Thời gian triển khai chậm
**Triệu Chứng:**
- Triển khai mất quá nhiều thời gian
- Lỗi hết thời gian trong quá trình triển khai

**Giải Pháp:**
```bash
# 1. Bật triển khai song song
azd config set deploy.parallelism 5

# 2. Sử dụng triển khai gia tăng
azd deploy --incremental

# 3. Tối ưu hóa quy trình xây dựng
# Trong package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Kiểm tra vị trí tài nguyên (sử dụng cùng một khu vực)
azd config set defaults.location eastus2
```

### Vấn Đề: Vấn đề hiệu suất ứng dụng
**Triệu Chứng:**
- Thời gian phản hồi chậm
- Sử dụng tài nguyên cao

**Giải Pháp:**
```bash
# 1. Tăng tài nguyên
# Cập nhật SKU trong main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Bật giám sát Application Insights
azd monitor

# 3. Kiểm tra nhật ký ứng dụng để tìm các điểm nghẽn
azd logs --service api --follow

# 4. Triển khai bộ nhớ đệm
# Thêm Redis cache vào cơ sở hạ tầng của bạn
```

## 🛠️ Công Cụ và Lệnh Xử Lý Sự Cố

### Lệnh Gỡ Lỗi
```bash
# Gỡ lỗi toàn diện
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Kiểm tra thông tin hệ thống
azd info

# Xác minh cấu hình
azd config validate

# Kiểm tra kết nối
curl -v https://myapp.azurewebsites.net/health
```

### Phân Tích Nhật Ký
```bash
# Nhật ký ứng dụng
azd logs --service web --follow
azd logs --service api --since 1h

# Nhật ký tài nguyên Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Nhật ký container (cho Ứng dụng Container)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Điều Tra Tài Nguyên
```bash
# Liệt kê tất cả các tài nguyên
az resource list --resource-group myrg -o table

# Kiểm tra trạng thái tài nguyên
az webapp show --name myapp --resource-group myrg --query state

# Chẩn đoán mạng
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Nhận Hỗ Trợ Thêm

### Khi Nào Nên Nâng Cấp Vấn Đề
- Vấn đề xác thực vẫn tồn tại sau khi thử tất cả các giải pháp
- Vấn đề hạ tầng với các dịch vụ Azure
- Vấn đề liên quan đến thanh toán hoặc đăng ký
- Các mối lo ngại hoặc sự cố về bảo mật

### Kênh Hỗ Trợ
```bash
# 1. Kiểm tra Sức khỏe Dịch vụ Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Tạo phiếu hỗ trợ Azure
# Đi tới: https://portal.azure.com -> Trợ giúp + hỗ trợ

# 3. Tài nguyên cộng đồng
# - Stack Overflow: thẻ azure-developer-cli
# - Vấn đề trên GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Thông Tin Cần Thu Thập
Trước khi liên hệ hỗ trợ, hãy thu thập:
- Kết quả `azd version`
- Kết quả `azd info`
- Tin nhắn lỗi (toàn bộ văn bản)
- Các bước để tái tạo vấn đề
- Chi tiết môi trường (`azd env show`)
- Dòng thời gian khi vấn đề bắt đầu

### Script Thu Thập Nhật Ký
```bash
#!/bin/bash
# thu-thập-thông-tin-gỡ-lỗi.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Phòng Ngừa Vấn Đề

### Danh Sách Kiểm Tra Trước Khi Triển Khai
```bash
# 1. Xác thực xác thực
az account show

# 2. Kiểm tra hạn mức và giới hạn
az vm list-usage --location eastus2

# 3. Xác thực mẫu
az bicep build --file infra/main.bicep

# 4. Kiểm tra cục bộ trước
npm run build
npm run test

# 5. Sử dụng triển khai thử nghiệm
azd provision --preview
```

### Cài Đặt Giám Sát
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

### Bảo Trì Định Kỳ
```bash
# Kiểm tra sức khỏe hàng tuần
./scripts/health-check.sh

# Xem xét chi phí hàng tháng
az consumption usage list --billing-period-name 202401

# Xem xét bảo mật hàng quý
az security assessment list --resource-group myrg
```

## Tài Nguyên Liên Quan

- [Hướng Dẫn Gỡ Lỗi](debugging.md) - Kỹ thuật gỡ lỗi nâng cao
- [Cung Cấp Tài Nguyên](../deployment/provisioning.md) - Xử lý sự cố hạ tầng
- [Lập Kế Hoạch Năng Lực](../pre-deployment/capacity-planning.md) - Hướng dẫn lập kế hoạch tài nguyên
- [Lựa Chọn SKU](../pre-deployment/sku-selection.md) - Khuyến nghị về cấp dịch vụ

---

**Mẹo**: Hãy đánh dấu hướng dẫn này và tham khảo bất cứ khi nào bạn gặp vấn đề. Hầu hết các vấn đề đã từng xảy ra và có các giải pháp được thiết lập!

---

**Điều Hướng**
- **Bài Học Trước**: [Cung Cấp Tài Nguyên](../deployment/provisioning.md)
- **Bài Học Tiếp Theo**: [Hướng Dẫn Gỡ Lỗi](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp từ con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->