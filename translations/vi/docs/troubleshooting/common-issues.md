<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T21:48:10+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "vi"
}
-->
# Các Vấn Đề Thường Gặp & Giải Pháp

## Giới Thiệu

Hướng dẫn khắc phục sự cố toàn diện này bao gồm các vấn đề thường gặp nhất khi sử dụng Azure Developer CLI. Học cách chẩn đoán, khắc phục và giải quyết các vấn đề phổ biến liên quan đến xác thực, triển khai, cung cấp hạ tầng, và cấu hình ứng dụng. Mỗi vấn đề đều có các triệu chứng chi tiết, nguyên nhân gốc rễ, và quy trình giải quyết từng bước.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Thành thạo các kỹ thuật chẩn đoán vấn đề với Azure Developer CLI
- Hiểu các vấn đề phổ biến về xác thực và quyền hạn cùng giải pháp của chúng
- Giải quyết các lỗi triển khai, lỗi cung cấp hạ tầng, và vấn đề cấu hình
- Áp dụng chiến lược giám sát và gỡ lỗi chủ động
- Thực hiện phương pháp khắc phục sự cố có hệ thống cho các vấn đề phức tạp
- Cấu hình ghi nhật ký và giám sát đúng cách để ngăn ngừa các vấn đề trong tương lai

## Kết Quả Học Tập

Sau khi hoàn thành, bạn sẽ có khả năng:
- Chẩn đoán các vấn đề Azure Developer CLI bằng các công cụ chẩn đoán tích hợp
- Tự giải quyết các vấn đề liên quan đến xác thực, đăng ký, và quyền hạn
- Khắc phục hiệu quả các lỗi triển khai và cung cấp hạ tầng
- Gỡ lỗi các vấn đề cấu hình ứng dụng và các vấn đề đặc thù môi trường
- Triển khai giám sát và cảnh báo để nhận diện các vấn đề tiềm năng một cách chủ động
- Áp dụng các phương pháp tốt nhất cho quy trình ghi nhật ký, gỡ lỗi, và giải quyết vấn đề

## Chẩn Đoán Nhanh

Trước khi đi sâu vào các vấn đề cụ thể, hãy chạy các lệnh sau để thu thập thông tin chẩn đoán:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Vấn Đề Xác Thực

### Vấn Đề: "Không thể lấy mã thông báo truy cập"
**Triệu Chứng:**
- `azd up` gặp lỗi xác thực
- Các lệnh trả về "unauthorized" hoặc "access denied"

**Giải Pháp:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Vấn Đề: "Không đủ quyền" trong quá trình triển khai
**Triệu Chứng:**
- Triển khai thất bại với lỗi quyền hạn
- Không thể tạo một số tài nguyên Azure

**Giải Pháp:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Vấn Đề: Các vấn đề xác thực đa tenant
**Giải Pháp:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Lỗi Cung Cấp Hạ Tầng

### Vấn Đề: Xung đột tên tài nguyên
**Triệu Chứng:**
- Lỗi "Tên tài nguyên đã tồn tại"
- Triển khai thất bại trong quá trình tạo tài nguyên

**Giải Pháp:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Vấn Đề: Vị trí/Khu vực không khả dụng
**Triệu Chứng:**
- Lỗi "Vị trí 'xyz' không khả dụng cho loại tài nguyên"
- Một số SKUs không khả dụng trong khu vực đã chọn

**Giải Pháp:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Vấn Đề: Lỗi vượt quá hạn mức
**Triệu Chứng:**
- Lỗi "Quota exceeded for resource type"
- "Số lượng tài nguyên tối đa đã đạt"

**Giải Pháp:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Vấn Đề: Lỗi mẫu Bicep
**Triệu Chứng:**
- Lỗi xác thực mẫu
- Lỗi cú pháp trong các tệp Bicep

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
- Ứng dụng không thể xây dựng trong quá trình triển khai
- Lỗi cài đặt gói

**Giải Pháp:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Vấn Đề: Lỗi triển khai container
**Triệu Chứng:**
- Ứng dụng container không thể khởi động
- Lỗi kéo hình ảnh

**Giải Pháp:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Vấn Đề: Lỗi kết nối cơ sở dữ liệu
**Triệu Chứng:**
- Ứng dụng không thể kết nối với cơ sở dữ liệu
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

## 🔧 Vấn Đề Cấu Hình

### Vấn Đề: Biến môi trường không hoạt động
**Triệu Chứng:**
- Ứng dụng không thể đọc giá trị cấu hình
- Biến môi trường hiển thị trống

**Giải Pháp:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Vấn Đề: Vấn đề chứng chỉ SSL/TLS
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
- Frontend không thể gọi API
- Yêu cầu cross-origin bị chặn

**Giải Pháp:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Vấn Đề Quản Lý Môi Trường

### Vấn Đề: Vấn đề chuyển đổi môi trường
**Triệu Chứng:**
- Sử dụng sai môi trường
- Cấu hình không chuyển đổi đúng cách

**Giải Pháp:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Vấn Đề: Hỏng môi trường
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

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Vấn Đề Hiệu Suất

### Vấn Đề: Thời gian triển khai chậm
**Triệu Chứng:**
- Triển khai mất quá nhiều thời gian
- Lỗi hết thời gian trong quá trình triển khai

**Giải Pháp:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Vấn Đề: Vấn đề hiệu suất ứng dụng
**Triệu Chứng:**
- Thời gian phản hồi chậm
- Sử dụng tài nguyên cao

**Giải Pháp:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Công Cụ và Lệnh Khắc Phục Sự Cố

### Lệnh Gỡ Lỗi
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Phân Tích Nhật Ký
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Điều Tra Tài Nguyên
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Nhận Hỗ Trợ Thêm

### Khi Nào Cần Nâng Cấp Vấn Đề
- Vấn đề xác thực vẫn tồn tại sau khi thử tất cả các giải pháp
- Vấn đề hạ tầng với các dịch vụ Azure
- Vấn đề liên quan đến thanh toán hoặc đăng ký
- Các mối lo ngại hoặc sự cố về bảo mật

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
- Kết quả `azd info`
- Các thông báo lỗi (toàn bộ nội dung)
- Các bước để tái hiện vấn đề
- Chi tiết môi trường (`azd env show`)
- Dòng thời gian khi vấn đề bắt đầu

### Script Thu Thập Nhật Ký
```bash
#!/bin/bash
# collect-debug-info.sh

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
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Bảo Trì Định Kỳ
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Tài Nguyên Liên Quan

- [Hướng Dẫn Gỡ Lỗi](debugging.md) - Kỹ thuật gỡ lỗi nâng cao
- [Cung Cấp Tài Nguyên](../deployment/provisioning.md) - Khắc phục sự cố hạ tầng
- [Lập Kế Hoạch Năng Lực](../pre-deployment/capacity-planning.md) - Hướng dẫn lập kế hoạch tài nguyên
- [Lựa Chọn SKU](../pre-deployment/sku-selection.md) - Khuyến nghị về cấp dịch vụ

---

**Mẹo**: Hãy đánh dấu hướng dẫn này và tham khảo bất cứ khi nào bạn gặp vấn đề. Hầu hết các vấn đề đã từng xảy ra trước đây và đều có giải pháp được thiết lập!

---

**Điều Hướng**
- **Bài Học Trước**: [Cung Cấp Tài Nguyên](../deployment/provisioning.md)
- **Bài Học Tiếp Theo**: [Hướng Dẫn Gỡ Lỗi](debugging.md)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.