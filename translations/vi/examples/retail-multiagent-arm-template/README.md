<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T08:43:41+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "vi"
}
-->
# Giải pháp Đa Tác Nhân Bán Lẻ - Triển khai ARM Template

**Chương 5: Gói Triển khai Sản xuất**
- **📚 Trang chủ khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương liên quan**: [Chương 5: Giải pháp AI Đa Tác Nhân](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Hướng dẫn kịch bản**: [Triển khai hoàn chỉnh](../retail-scenario.md)
- **🎯 Triển khai nhanh**: [Triển khai một lần nhấp chuột](../../../../examples/retail-multiagent-arm-template)

Thư mục này chứa một mẫu Azure Resource Manager (ARM) hoàn chỉnh để triển khai Giải pháp Hỗ trợ Khách hàng Đa Tác Nhân Bán Lẻ, cung cấp cơ sở hạ tầng dưới dạng mã cho toàn bộ kiến trúc.

## 🎯 Những gì được triển khai

### Cơ sở hạ tầng cốt lõi
- **Azure OpenAI Services** (đa vùng để đảm bảo tính khả dụng cao)
  - Vùng chính: GPT-4o cho tác nhân khách hàng
  - Vùng phụ: GPT-4o-mini cho tác nhân kiểm kê  
  - Vùng thứ ba: Mô hình nhúng văn bản
  - Vùng đánh giá: Mô hình đánh giá GPT-4o
- **Azure AI Search** với khả năng tìm kiếm vector
- **Azure Storage Account** với các container blob cho tài liệu và tải lên
- **Azure Container Apps Environment** với khả năng tự động mở rộng
- **Container Apps** cho bộ định tuyến tác nhân và giao diện người dùng
- **Azure Cosmos DB** để lưu trữ lịch sử trò chuyện
- **Azure Key Vault** để quản lý bí mật (tùy chọn)
- **Application Insights** và Log Analytics để giám sát (tùy chọn)
- **Document Intelligence** để xử lý tài liệu
- **Bing Search API** để cung cấp thông tin thời gian thực

### Các chế độ triển khai

| Chế độ | Mô tả | Trường hợp sử dụng | Tài nguyên |
|-------|-------|--------------------|------------|
| **Tối thiểu** | Triển khai cơ bản tối ưu chi phí | Phát triển, thử nghiệm | SKUs cơ bản, một vùng, dung lượng giảm |
| **Tiêu chuẩn** | Triển khai cân bằng cho khối lượng công việc sản xuất | Sản xuất, quy mô vừa | SKUs tiêu chuẩn, đa vùng, dung lượng tiêu chuẩn |
| **Cao cấp** | Triển khai hiệu suất cao, cấp doanh nghiệp | Doanh nghiệp, quy mô lớn | SKUs cao cấp, đa vùng, dung lượng cao |

## 📋 Yêu cầu trước

1. **Azure CLI** đã được cài đặt và cấu hình
2. **Đăng ký Azure đang hoạt động** với hạn mức đủ
3. **Quyền phù hợp** để tạo tài nguyên trong đăng ký mục tiêu
4. **Hạn mức tài nguyên** cho:
   - Azure OpenAI (kiểm tra tính khả dụng theo vùng)
   - Container Apps (thay đổi theo vùng)
   - AI Search (khuyến nghị cấp tiêu chuẩn hoặc cao hơn)

## 🚀 Triển khai nhanh

### Tùy chọn 1: Sử dụng Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Tùy chọn 2: Sử dụng Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Tùy chọn 3: Sử dụng trực tiếp Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Tùy chọn cấu hình

### Tham số mẫu

| Tham số | Loại | Mặc định | Mô tả |
|---------|------|---------|-------|
| `projectName` | string | "retail" | Tiền tố cho tất cả tên tài nguyên |
| `location` | string | Vị trí nhóm tài nguyên | Vùng triển khai chính |
| `secondaryLocation` | string | "westus2" | Vùng phụ cho triển khai đa vùng |
| `tertiaryLocation` | string | "francecentral" | Vùng cho mô hình nhúng |
| `environmentName` | string | "dev" | Định danh môi trường (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Cấu hình triển khai (tối thiểu/tiêu chuẩn/cao cấp) |
| `enableMultiRegion` | bool | true | Bật triển khai đa vùng |
| `enableMonitoring` | bool | true | Bật Application Insights và ghi nhật ký |
| `enableSecurity` | bool | true | Bật Key Vault và bảo mật nâng cao |

### Tùy chỉnh tham số

Chỉnh sửa `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Tổng quan kiến trúc

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Sử dụng script triển khai

Script `deploy.sh` cung cấp trải nghiệm triển khai tương tác:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Tính năng của script

- ✅ **Xác thực yêu cầu trước** (Azure CLI, trạng thái đăng nhập, tệp mẫu)
- ✅ **Quản lý nhóm tài nguyên** (tạo nếu chưa tồn tại)
- ✅ **Xác thực mẫu** trước khi triển khai
- ✅ **Theo dõi tiến trình** với đầu ra có màu sắc
- ✅ **Hiển thị kết quả triển khai**
- ✅ **Hướng dẫn sau triển khai**

## 📊 Giám sát triển khai

### Kiểm tra trạng thái triển khai

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Kết quả triển khai

Sau khi triển khai thành công, các kết quả sau sẽ có sẵn:

- **URL giao diện người dùng**: Điểm cuối công khai cho giao diện web
- **URL bộ định tuyến**: Điểm cuối API cho bộ định tuyến tác nhân
- **Điểm cuối OpenAI**: Điểm cuối dịch vụ OpenAI chính và phụ
- **Dịch vụ tìm kiếm**: Điểm cuối dịch vụ Azure AI Search
- **Tài khoản lưu trữ**: Tên tài khoản lưu trữ cho tài liệu
- **Key Vault**: Tên Key Vault (nếu được bật)
- **Application Insights**: Tên dịch vụ giám sát (nếu được bật)

## 🔧 Cấu hình sau triển khai

### 1. Cấu hình chỉ mục tìm kiếm

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. Tải lên dữ liệu ban đầu

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Kiểm tra điểm cuối tác nhân

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Cấu hình Container Apps

ARM template triển khai hình ảnh container mẫu. Để triển khai mã tác nhân thực tế:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Xử lý sự cố

### Các vấn đề thường gặp

#### 1. Vượt hạn mức Azure OpenAI

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Triển khai Container Apps thất bại

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Khởi tạo dịch vụ tìm kiếm

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Xác thực triển khai

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Cân nhắc về bảo mật

### Quản lý khóa
- Tất cả bí mật được lưu trữ trong Azure Key Vault (khi được bật)
- Container apps sử dụng danh tính được quản lý để xác thực
- Tài khoản lưu trữ có mặc định bảo mật (chỉ HTTPS, không truy cập blob công khai)

### Bảo mật mạng
- Container apps sử dụng mạng nội bộ khi có thể
- Dịch vụ tìm kiếm được cấu hình với tùy chọn điểm cuối riêng
- Cosmos DB được cấu hình với quyền tối thiểu cần thiết

### Cấu hình RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Tối ưu hóa chi phí

### Ước tính chi phí (hàng tháng, USD)

| Chế độ | OpenAI | Container Apps | Tìm kiếm | Lưu trữ | Tổng ước tính |
|-------|--------|----------------|----------|---------|--------------|
| Tối thiểu | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Tiêu chuẩn | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Cao cấp | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Giám sát chi phí

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Cập nhật và bảo trì

### Cập nhật mẫu
- Quản lý phiên bản các tệp ARM template
- Kiểm tra thay đổi trong môi trường phát triển trước
- Sử dụng chế độ triển khai gia tăng cho các bản cập nhật

### Cập nhật tài nguyên
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Sao lưu và khôi phục
- Sao lưu tự động Cosmos DB được bật
- Key Vault có tính năng xóa mềm được bật
- Các phiên bản ứng dụng container được duy trì để quay lại

## 📞 Hỗ trợ

- **Vấn đề về mẫu**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Hỗ trợ Azure**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Cộng đồng**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Sẵn sàng triển khai giải pháp đa tác nhân của bạn?**

Bắt đầu với: `./deploy.sh -g myResourceGroup`

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.