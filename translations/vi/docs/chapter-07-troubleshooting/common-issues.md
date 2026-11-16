# Các Vấn Đề Thường Gặp và Giải Pháp

**Điều Hướng Chương:**
- **📚 Trang Khóa Học**: [AZD Dành Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 7 - Khắc Phục Sự Cố & Gỡ Lỗi
- **⬅️ Chương Trước**: [Chương 6: Kiểm Tra Trước Khi Bay](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Tiếp Theo**: [Hướng Dẫn Gỡ Lỗi](debugging.md)
- **🚀 Chương Kế Tiếp**: [Chương 8: Mô Hình Sản Xuất & Doanh Nghiệp](../chapter-08-production/production-ai-practices.md)

## Giới Thiệu

Hướng dẫn khắc phục sự cố toàn diện này bao quát những vấn đề thường gặp nhất khi sử dụng Azure Developer CLI. Học cách chẩn đoán, khắc phục và giải quyết các vấn đề phổ biến về xác thực, triển khai, cung cấp hạ tầng và cấu hình ứng dụng. Mỗi vấn đề bao gồm các triệu chứng chi tiết, nguyên nhân gốc rễ, và các bước giải pháp từng bước.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Thành thạo kỹ thuật chẩn đoán sự cố Azure Developer CLI
- Hiểu các vấn đề phổ biến về xác thực và quyền hạn cùng với giải pháp của chúng
- Khắc phục lỗi triển khai, lỗi cung cấp hạ tầng, và vấn đề cấu hình
- Triển khai các chiến lược giám sát và gỡ lỗi chủ động
- Áp dụng phương pháp khắc phục sự cố có hệ thống cho các vấn đề phức tạp
- Cấu hình ghi nhật ký và giám sát đúng cách để ngăn ngừa sự cố trong tương lai

## Kết Quả Học Tập

Khi hoàn thành, bạn sẽ có khả năng:
- Chẩn đoán sự cố Azure Developer CLI bằng công cụ chẩn đoán tích hợp
- Tự giải quyết các vấn đề liên quan đến xác thực, đăng ký và quyền truy cập
- Khắc phục lỗi triển khai và lỗi cung cấp hạ tầng hiệu quả
- Gỡ lỗi các vấn đề cấu hình ứng dụng và các vấn đề riêng theo môi trường
- Triển khai giám sát và cảnh báo để nhận diện sớm các vấn đề tiềm năng
- Áp dụng các thực hành tốt nhất về ghi nhật ký, gỡ lỗi và quy trình giải quyết sự cố

## Chuẩn Đoán Nhanh

> Thay thế tên/ID ví dụ bằng giá trị của môi trường bạn. Các đoạn mã Bash, Bicep, JavaScript và tập tin tham số được đánh dấu riêng bên dưới; chúng không phải là một script có thể chạy trực tiếp. Xem xét các thao tác có thể gây phá hủy và xóa thông tin nhạy cảm trước khi chia sẻ chuẩn đoán. `azd monitor --logs` mở trình duyệt; nó không phát trực tiếp nhật ký terminal.

Trước khi đi vào các vấn đề cụ thể, hãy chạy các lệnh này để thu thập thông tin chuẩn đoán:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## Các Vấn Đề Xác Thực

### Vấn Đề: "Không thể lấy access token"
**Triệu Chứng:**
- `azd up` thất bại với lỗi xác thực
- Các lệnh trả về "không được phép" hoặc "truy cập bị từ chối"

**Giải Pháp:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### Vấn Đề: "Quyền hạn không đủ" trong quá trình triển khai
**Triệu Chứng:**
- Triển khai thất bại do lỗi quyền
- Không thể tạo một số tài nguyên Azure nhất định

**Giải Pháp:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Vấn Đề: Sự cố xác thực đa thuê
**Giải Pháp:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Lỗi Cung Cấp Hạ Tầng

### Vấn Đề: Xung đột tên tài nguyên
**Triệu Chứng:**
- Lỗi "Tên tài nguyên đã tồn tại"
- Triển khai thất bại khi tạo tài nguyên

**Giải Pháp:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### Vấn Đề: Vị trí/Khu vực không khả dụng
**Triệu Chứng:**
- "Vị trí 'xyz' không khả dụng cho loại tài nguyên"
- Một số SKU không khả dụng trong khu vực đã chọn

**Giải Pháp:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Thay đổi biến vị trí không di chuyển được tài nguyên hiện có. Một nhóm tài nguyên hoặc tài nguyên hiện có có thể từ chối thay đổi vị trí; hãy sử dụng môi trường riêng cho việc triển khai lại theo khu vực.

### Vấn Đề: Lỗi vượt quá hạn ngạch
**Triệu Chứng:**
- "Vượt hạn ngạch cho loại tài nguyên"
- "Số lượng tài nguyên tối đa đã đạt"

**Giải Pháp:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Đối với phát triển, chọn SKU nhỏ hơn được hỗ trợ trong `infra/main.parameters.json`:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Vấn Đề: Lỗi mẫu Bicep
**Triệu Chứng:**
- Thất bại khi xác thực mẫu
- Lỗi cú pháp trong các tập tin Bicep

**Giải Pháp:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 Lỗi Triển Khai

### Vấn Đề: Lỗi xây dựng
**Triệu Chứng:**
- Ứng dụng không xây dựng được khi triển khai
- Lỗi cài đặt gói

**Giải Pháp:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Vấn Đề: Lỗi triển khai container
**Triệu Chứng:**
- Ứng dụng container không khởi động được
- Lỗi kéo ảnh container

**Giải Pháp:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Vấn Đề: Lỗi kết nối cơ sở dữ liệu
**Triệu Chứng:**
- Ứng dụng không kết nối được với cơ sở dữ liệu
- Lỗi hết thời gian kết nối

**Giải Pháp:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Các Vấn Đề Cấu Hình

### Vấn Đề: Biến môi trường không hoạt động
**Triệu Chứng:**
- Ứng dụng không đọc được giá trị cấu hình
- Biến môi trường hiển thị trống

**Giải Pháp:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Vấn Đề: Lỗi chứng chỉ SSL/TLS
**Triệu Chứng:**
- HTTPS không hoạt động
- Lỗi xác thực chứng chỉ

**Giải Pháp:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Vấn Đề: Vấn đề cấu hình CORS
**Triệu Chứng:**
- Frontend không gọi được API
- Yêu cầu xuất xứ chéo bị chặn

**Giải Pháp:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Cập nhật ứng dụng Express hiện có của bạn (với `cors` đã nhập):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 Các Vấn Đề Quản Lý Môi Trường

### Vấn Đề: Sự cố chuyển đổi môi trường
**Triệu Chứng:**
- Sử dụng môi trường sai
- Cấu hình không chuyển đổi chính xác

**Giải Pháp:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Vấn Đề: Môi trường bị lỗi
**Triệu Chứng:**
- Môi trường hiển thị trạng thái không hợp lệ
- Tài nguyên không khớp với cấu hình

**Giải Pháp:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Các Vấn Đề Hiệu Năng

### Vấn Đề: Thời gian triển khai chậm
**Triệu Chứng:**
- Triển khai mất quá nhiều thời gian
- Hết thời gian chờ trong quá trình triển khai

**Giải Pháp:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### Vấn Đề: Vấn đề hiệu năng ứng dụng
**Triệu Chứng:**
- Thời gian phản hồi chậm
- Sử dụng tài nguyên cao

**Giải Pháp:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Công Cụ và Lệnh Khắc Phục

### Lệnh Gỡ Lỗi
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Phân Tích Nhật Ký
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Khám Phá Tài Nguyên
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Nhận Hỗ Trợ Thêm

### Khi Nào Nên Thăng Cấp
- Vấn đề xác thực vẫn tồn tại sau khi thử tất cả giải pháp
- Vấn đề hạ tầng với dịch vụ Azure
- Vấn đề liên quan đến thanh toán hoặc đăng ký
- Mối quan tâm hoặc sự cố về bảo mật

### Kênh Hỗ Trợ
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Thông Tin Cần Thu Thập
Trước khi liên hệ hỗ trợ, hãy thu thập:
- Kết quả `azd version`
- Kết quả `azd config show`
- Kết quả `azd show` (trạng thái triển khai hiện tại)
- Thông báo lỗi (toàn văn)
- Các bước để tái tạo vấn đề
- Chi tiết môi trường đã được làm mờ (không bao giờ chia sẻ `azd env get-values` thô, có thể chứa bí mật)
- Dòng thời gian khi vấn đề bắt đầu

### Script Thu Thập Nhật Ký
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Ngăn Ngừa Vấn Đề

### Danh Sách Kiểm Tra Trước Triển Khai
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### Cài Đặt Giám Sát
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### Bảo Trì Định Kỳ
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Tài Nguyên Liên Quan

- [Hướng Dẫn Gỡ Lỗi](debugging.md) - Kỹ thuật gỡ lỗi nâng cao
- [Cung Cấp Tài Nguyên](../chapter-04-infrastructure/provisioning.md) - Khắc phục sự cố hạ tầng
- [Lập Kế Hoạch Công Suất](../chapter-06-pre-deployment/capacity-planning.md) - Hướng dẫn lập kế hoạch tài nguyên
- [Chọn SKU](../chapter-06-pre-deployment/sku-selection.md) - Khuyến nghị cấp dịch vụ

---

**Mẹo**: Lưu lại hướng dẫn này và tham khảo khi bạn gặp vấn đề. Hầu hết các vấn đề đã được gặp trước đó và có giải pháp sẵn!

---

**Điều Hướng**
- **Bài Học Trước**: [Cung Cấp Tài Nguyên](../chapter-04-infrastructure/provisioning.md)
- **Bài Học Tiếp**: [Hướng Dẫn Gỡ Lỗi](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->