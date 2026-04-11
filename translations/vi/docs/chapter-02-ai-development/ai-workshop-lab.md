# AI Workshop Lab: Làm cho Giải pháp AI của Bạn Có Thể Triển Khai Bằng AZD

**Chapter Navigation:**
- **📚 Trang Khóa Học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện Tại**: Chương 2 - Phát Triển Ưu Tiên AI
- **⬅️ Trước**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Tiếp**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Chương Tiếp Theo**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Tổng Quan Workshop

Phòng thí nghiệm thực hành này hướng dẫn các nhà phát triển qua quy trình lấy một mẫu AI hiện có và triển khai nó bằng Azure Developer CLI (AZD). Bạn sẽ học các mẫu thiết yếu cho các triển khai AI trong môi trường production sử dụng các dịch vụ Microsoft Foundry.

> **Ghi chú xác thực (2026-03-25):** Workshop này đã được rà soát với `azd` `1.23.12`. Nếu cài đặt AZD cục bộ của bạn cũ hơn, hãy cập nhật AZD trước khi bắt đầu để quy trình xác thực, mẫu và triển khai khớp với các bước dưới đây.

**Thời lượng:** 2-3 giờ  
**Cấp độ:** Trung cấp  
**Yêu cầu trước:** Kiến thức cơ bản về Azure, quen thuộc với các khái niệm AI/ML

## 🎓 Mục Tiêu Học Tập

Kết thúc workshop này, bạn sẽ có khả năng:
- ✅ Chuyển một ứng dụng AI hiện có sang sử dụng các mẫu AZD
- ✅ Cấu hình dịch vụ Microsoft Foundry bằng AZD
- ✅ Thực hiện quản lý thông tin đăng nhập an toàn cho các dịch vụ AI
- ✅ Triển khai ứng dụng AI sẵn sàng cho production với giám sát
- ✅ Khắc phục sự cố triển khai AI phổ biến

## Yêu Cầu Trước

### Công Cụ Cần Thiết
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) đã cài đặt
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) đã cài đặt
- [Git](https://git-scm.com/) đã cài đặt
- Trình soạn thảo mã (khuyến nghị VS Code)

### Tài Nguyên Azure
- Subscription Azure với quyền contributor
- Truy cập dịch vụ Microsoft Foundry Models (hoặc khả năng yêu cầu truy cập)
- Quyền tạo resource group

### Kiến Thức Yêu Cầu
- Hiểu biết cơ bản về các dịch vụ Azure
- Quen thuộc với giao diện dòng lệnh
- Khái niệm AI/ML cơ bản (APIs, mô hình, prompts)

## Thiết Lập Lab

### Bước 1: Chuẩn Bị Môi Trường

1. **Xác minh cài đặt công cụ:**
```bash
# Kiểm tra cài đặt AZD
azd version

# Kiểm tra Azure CLI
az --version

# Đăng nhập vào Azure cho các workflow AZD
azd auth login

# Chỉ đăng nhập vào Azure CLI nếu bạn dự định chạy các lệnh az trong quá trình chẩn đoán
az login
```

Nếu bạn làm việc trên nhiều tenant hoặc subscription của bạn không được phát hiện tự động, thử lại với `azd auth login --tenant-id <tenant-id>`.

2. **Clone kho lưu trữ workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Hiểu Cấu Trúc AZD cho Ứng dụng AI

### Cấu Trúc của một Mẫu AZD cho AI

Khám phá các tệp chính trong một mẫu AZD sẵn sàng cho AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Bài Tập Lab 1.1: Khám Phá Cấu Hình**

1. **Xem xét tệp azure.yaml:**
```bash
cat azure.yaml
```

**Những điều cần chú ý:**
- Định nghĩa dịch vụ cho các thành phần AI
- Bản đồ biến môi trường
- Cấu hình host

2. **Xem lại main.bicep cho hạ tầng:**
```bash
cat infra/main.bicep
```

**Các mẫu AI chính cần xác định:**
- Cung cấp dịch vụ Microsoft Foundry Models
- Tích hợp Cognitive Search
- Quản lý khóa an toàn
- Cấu hình bảo mật mạng

### **Điểm Thảo Luận:** Tại Sao Các Mẫu Này Quan Trọng Cho AI

- **Phụ thuộc dịch vụ**: Ứng dụng AI thường yêu cầu nhiều dịch vụ phối hợp
- **Bảo mật**: API keys và endpoints cần được quản lý an toàn
- **Khả năng mở rộng**: Workload AI có yêu cầu scale riêng
- **Quản lý chi phí**: Dịch vụ AI có thể tốn kém nếu không cấu hình đúng

## Module 2: Triển Khai Ứng Dụng AI Đầu Tiên của Bạn

### Bước 2.1: Khởi Tạo Môi Trường

1. **Tạo một môi trường AZD mới:**
```bash
azd env new myai-workshop
```

2. **Đặt các tham số cần thiết:**
```bash
# Đặt vùng Azure ưa thích của bạn
azd env set AZURE_LOCATION eastus

# Tùy chọn: Chọn mô hình OpenAI cụ thể
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Bước 2.2: Triển Khai Hạ Tầng và Ứng Dụng

1. **Triển khai với AZD:**
```bash
azd up
```

**Điều gì xảy ra trong quá trình `azd up`:**
- ✅ Cung cấp dịch vụ Microsoft Foundry Models
- ✅ Tạo dịch vụ Cognitive Search
- ✅ Thiết lập App Service cho ứng dụng web
- ✅ Cấu hình mạng và bảo mật
- ✅ Triển khai mã ứng dụng
- ✅ Thiết lập giám sát và logging

2. **Theo dõi tiến trình triển khai** và ghi lại các tài nguyên đang được tạo.

### Bước 2.3: Xác Minh Triển Khai

1. **Kiểm tra các tài nguyên đã triển khai:**
```bash
azd show
```

2. **Mở ứng dụng đã triển khai:**
```bash
azd show
```

Mở endpoint web được hiển thị trong đầu ra của `azd show`.

3. **Kiểm tra chức năng AI:**
   - Điều hướng đến ứng dụng web
   - Thử các truy vấn mẫu
   - Xác nhận phản hồi AI hoạt động

### **Bài Tập Lab 2.1: Thực Hành Khắc Phục Sự Cố**

**Kịch bản**: Việc triển khai của bạn thành công nhưng AI không phản hồi.

**Các vấn đề phổ biến cần kiểm tra:**
1. **OpenAI API keys**: Xác minh chúng được thiết lập đúng
2. **Tính khả dụng của mô hình**: Kiểm tra xem vùng của bạn có hỗ trợ mô hình hay không
3. **Kết nối mạng**: Đảm bảo các dịch vụ có thể giao tiếp
4. **Quyền RBAC**: Xác minh ứng dụng có thể truy cập OpenAI

**Lệnh gỡ rối:**
```bash
# Kiểm tra biến môi trường
azd env get-values

# Xem nhật ký triển khai
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kiểm tra trạng thái triển khai OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Tùy Chỉnh Ứng Dụng AI cho Nhu Cầu của Bạn

### Bước 3.1: Thay Đổi Cấu Hình AI

1. **Cập nhật mô hình OpenAI:**
```bash
# Chuyển sang một mô hình khác (nếu có sẵn ở khu vực của bạn)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Triển khai lại với cấu hình mới
azd deploy
```

2. **Thêm các dịch vụ AI bổ sung:**

Chỉnh sửa `infra/main.bicep` để thêm Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Bước 3.2: Cấu Hình Theo Môi Trường

**Thực hành tốt nhất**: Các cấu hình khác nhau cho development và production.

1. **Tạo một môi trường production:**
```bash
azd env new myai-production
```

2. **Đặt các tham số riêng cho production:**
```bash
# Môi trường sản xuất thường sử dụng SKU cao hơn
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Kích hoạt các tính năng bảo mật bổ sung
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Bài Tập Lab 3.1: Tối Ưu Chi Phí**

**Thử thách**: Cấu hình mẫu để tiết kiệm chi phí cho môi trường phát triển.

**Nhiệm vụ:**
1. Xác định SKU nào có thể đặt ở mức miễn phí/cơ bản
2. Cấu hình biến môi trường để tối thiểu chi phí
3. Triển khai và so sánh chi phí với cấu hình production

**Gợi ý giải pháp:**
- Sử dụng tier F0 (miễn phí) cho Cognitive Services khi có thể
- Sử dụng tier Basic cho Search Service trong phát triển
- Xem xét sử dụng Consumption plan cho Functions

## Module 4: Bảo Mật và Thực Hành Tốt Nhất Cho Production

### Bước 4.1: Quản Lý Thông Tin Đăng Nhập An Toàn

**Vấn đề hiện tại**: Nhiều ứng dụng AI hardcode API keys hoặc sử dụng lưu trữ không an toàn.

**Giải pháp AZD**: Managed Identity + tích hợp Key Vault.

1. **Xem lại cấu hình bảo mật trong mẫu của bạn:**
```bash
# Tìm cấu hình Key Vault và Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Xác minh Managed Identity hoạt động:**
```bash
# Kiểm tra xem ứng dụng web có cấu hình danh tính chính xác hay không
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Bước 4.2: Bảo Mật Mạng

1. **Kích hoạt private endpoints** (nếu chưa được cấu hình):

Thêm vào mẫu bicep của bạn:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Bước 4.3: Giám Sát và Khả Năng Quan Sát

1. **Cấu hình Application Insights:**
```bash
# Application Insights nên được cấu hình tự động
# Kiểm tra cấu hình:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Thiết lập giám sát chuyên biệt cho AI:**

Thêm các metric tùy chỉnh cho các hoạt động AI:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Bài Tập Lab 4.1: Kiểm Toán Bảo Mật**

**Nhiệm vụ**: Xem xét triển khai của bạn theo các thực hành bảo mật tốt nhất.

**Danh sách kiểm tra:**
- [ ] Không có bí mật được hardcode trong mã hoặc cấu hình
- [ ] Sử dụng Managed Identity cho xác thực giữa các dịch vụ
- [ ] Key Vault lưu trữ cấu hình nhạy cảm
- [ ] Truy cập mạng được hạn chế đúng cách
- [ ] Giám sát và logging được bật

## Module 5: Chuyển Đổi Ứng Dụng AI Của Bạn

### Bước 5.1: Bảng Đánh Giá

**Trước khi chuyển đổi ứng dụng của bạn**, trả lời các câu hỏi sau:

1. **Kiến trúc ứng dụng:**
   - Ứng dụng của bạn sử dụng những dịch vụ AI nào?
   - Nó cần tài nguyên compute nào?
   - Có cần cơ sở dữ liệu không?
   - Các phụ thuộc giữa các dịch vụ là gì?

2. **Yêu cầu bảo mật:**
   - Ứng dụng của bạn xử lý dữ liệu nhạy cảm nào?
   - Bạn có yêu cầu tuân thủ nào không?
   - Có cần mạng riêng tư không?

3. **Yêu cầu scale:**
   - Tải dự kiến của bạn là bao nhiêu?
   - Có cần auto-scaling không?
   - Có yêu cầu vùng (region) nào không?

### Bước 5.2: Tạo Mẫu AZD cho Bạn

**Làm theo mẫu này để chuyển đổi ứng dụng của bạn:**

1. **Tạo cấu trúc cơ bản:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Khởi tạo mẫu AZD
azd init --template minimal
```

2. **Tạo azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Tạo template hạ tầng:**

**infra/main.bicep** - Template chính:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - Module OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Bài Tập Lab 5.1: Thử Thách Tạo Mẫu**

**Thử thách**: Tạo một mẫu AZD cho một ứng dụng AI xử lý tài liệu.

**Yêu cầu:**
- Microsoft Foundry Models cho phân tích nội dung
- Document Intelligence cho OCR
- Storage Account cho tải lên tài liệu
- Function App cho logic xử lý
- Web app cho giao diện người dùng

**Điểm thưởng:**
- Thêm xử lý lỗi hợp lý
- Bao gồm ước tính chi phí
- Thiết lập dashboard giám sát

## Module 6: Khắc Phục Sự Cố Thường Gặp

### Các Vấn Đề Triển Khai Thường Gặp

#### Vấn Đề 1: Vượt Quota Dịch Vụ OpenAI
**Triệu chứng:** Triển khai thất bại với lỗi quota
**Giải pháp:**
```bash
# Kiểm tra hạn mức hiện tại
az cognitiveservices usage list --location eastus

# Yêu cầu tăng hạn mức hoặc thử khu vực khác
azd env set AZURE_LOCATION westus2
azd up
```

#### Vấn Đề 2: Mô Hình Không Có Sẵn ở Vùng
**Triệu chứng:** Phản hồi AI thất bại hoặc lỗi triển khai mô hình
**Giải pháp:**
```bash
# Kiểm tra tính khả dụng của mô hình theo khu vực
az cognitiveservices model list --location eastus

# Cập nhật lên mô hình có sẵn
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Vấn Đề 3: Vấn Đề Quyền
**Triệu chứng:** Lỗi 403 Forbidden khi gọi dịch vụ AI
**Giải pháp:**
```bash
# Kiểm tra phân công vai trò
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Thêm các vai trò còn thiếu
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Vấn Đề Hiệu Năng

#### Vấn Đề 4: Phản Hồi AI Chậm
**Các bước điều tra:**
1. Kiểm tra Application Insights cho các metric hiệu năng
2. Xem lại metrics dịch vụ OpenAI trong Azure portal
3. Xác minh kết nối mạng và độ trễ

**Giải pháp:**
- Triển khai caching cho các truy vấn thường gặp
- Sử dụng mô hình OpenAI phù hợp với trường hợp sử dụng
- Xem xét read replicas cho các kịch bản tải cao

### **Bài Tập Lab 6.1: Thử Thách Gỡ Rối**

**Kịch bản**: Việc triển khai của bạn thành công, nhưng ứng dụng trả về lỗi 500.

**Nhiệm vụ gỡ rối:**
1. Kiểm tra logs ứng dụng
2. Xác minh kết nối giữa các dịch vụ
3. Kiểm tra xác thực
4. Xem lại cấu hình

**Công cụ sử dụng:**
- `azd show` để xem tổng quan triển khai
- Azure portal để xem logs chi tiết của dịch vụ
- Application Insights cho telemetry ứng dụng

## Module 7: Giám Sát và Tối Ưu

### Bước 7.1: Thiết Lập Giám Sát Toàn Diện

1. **Tạo dashboard tùy chỉnh:**

Đi đến Azure portal và tạo một dashboard với:
- Số lượng và độ trễ yêu cầu OpenAI
- Tỷ lệ lỗi ứng dụng
- Sử dụng tài nguyên
- Theo dõi chi phí

2. **Thiết lập cảnh báo:**
```bash
# Cảnh báo về tỷ lệ lỗi cao
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Bước 7.2: Tối Ưu Chi Phí

1. **Phân tích chi phí hiện tại:**
```bash
# Sử dụng Azure CLI để lấy dữ liệu chi phí
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Thực hiện kiểm soát chi phí:**
- Thiết lập cảnh báo ngân sách
- Sử dụng chính sách autoscaling
- Triển khai caching cho các yêu cầu
- Giám sát sử dụng token cho OpenAI

### **Bài Tập Lab 7.1: Tối Ưu Hiệu Năng**

**Nhiệm vụ**: Tối ưu ứng dụng AI của bạn cho cả hiệu năng và chi phí.

**Các chỉ số cần cải thiện:**
- Giảm thời gian phản hồi trung bình 20%
- Giảm chi phí hàng tháng 15%
- Duy trì 99.9% thời gian hoạt động

**Chiến lược để thử:**
- Triển khai caching phản hồi
- Tối ưu prompts để tiết kiệm token
- Sử dụng SKU compute phù hợp
- Thiết lập autoscaling hợp lý

## Thử Thách Cuối: Triển Khai End-to-End

### Kịch Bản Thử Thách

Bạn được giao nhiệm vụ tạo một chatbot dịch vụ khách hàng sẵn sàng cho production với các yêu cầu sau:

**Yêu cầu chức năng:**
- Giao diện web cho tương tác khách hàng
- Tích hợp với Microsoft Foundry Models cho phản hồi
- Khả năng tìm kiếm tài liệu bằng Cognitive Search
- Tích hợp với cơ sở dữ liệu khách hàng hiện có
- Hỗ trợ đa ngôn ngữ

**Yêu cầu phi chức năng:**
- Xử lý 1000 người dùng đồng thời
- SLA 99.9% uptime
- Tuân thủ SOC 2
- Chi phí dưới $500/tháng
- Triển khai tới nhiều môi trường (dev, staging, prod)

### Các Bước Triển Khai

1. **Thiết kế kiến trúc**
2. **Tạo mẫu AZD**
3. **Thực hiện các biện pháp bảo mật**
4. **Thiết lập giám sát và cảnh báo**
5. **Tạo pipeline triển khai**
6. **Tài liệu hóa giải pháp**

### Tiêu Chí Đánh Giá

- ✅ **Chức năng**: Có đáp ứng tất cả yêu cầu không?
- ✅ **Bảo mật**: Có thực hiện các thực hành tốt không?
- ✅ **Khả năng mở rộng**: Có chịu được tải không?
- ✅ **Dễ bảo trì**: Mã và hạ tầng có tổ chức tốt không?
- ✅ **Chi phí**: Có nằm trong ngân sách không?

## Tài Nguyên Bổ Sung

### Tài Liệu Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Mẫu Ví Dụ
- [Ứng dụng Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Hướng dẫn nhanh Ứng dụng Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Tài nguyên cộng đồng
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI trên GitHub](https://github.com/Azure/azure-dev)
- [Mẫu AZD tuyệt vời](https://azure.github.io/awesome-azd/)

## 🎓 Chứng nhận hoàn thành

Chúc mừng! Bạn đã hoàn thành Lab Hội thảo AI. Bây giờ bạn nên có khả năng:

- ✅ Chuyển đổi các ứng dụng AI hiện có thành các mẫu AZD
- ✅ Triển khai các ứng dụng AI sẵn sàng cho môi trường sản xuất
- ✅ Thực hiện các thực hành bảo mật tốt nhất cho khối lượng công việc AI
- ✅ Giám sát và tối ưu hóa hiệu suất ứng dụng AI
- ✅ Khắc phục các sự cố triển khai thường gặp

### Bước tiếp theo
1. Áp dụng các mẫu này cho các dự án AI của bạn
2. Đóng góp các mẫu trở lại cho cộng đồng
3. Tham gia Microsoft Foundry Discord để được hỗ trợ liên tục
4. Khám phá các chủ đề nâng cao như triển khai đa vùng

---

**Phản hồi về Hội thảo**: Giúp chúng tôi cải thiện hội thảo này bằng cách chia sẻ trải nghiệm của bạn trong [kênh #Azure của Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển ưu tiên AI
- **⬅️ Trước đó**: [Triển khai mô hình AI](ai-model-deployment.md)
- **➡️ Tiếp theo**: [Thực hành tốt nhất cho AI trong sản xuất](production-ai-practices.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

**Cần trợ giúp?** Tham gia cộng đồng của chúng tôi để được hỗ trợ và thảo luận về AZD và việc triển khai AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ ban đầu của nó nên được coi là nguồn tham khảo có thẩm quyền. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->