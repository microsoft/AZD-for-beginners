# AI Workshop Lab: Làm cho Giải pháp AI của bạn có thể triển khai với AZD

**Điều hướng chương:**
- **📚 Trang chủ khóa học**: [AZD Dành cho Người mới bắt đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển AI-First
- **⬅️ Trước đó**: [Triển khai Mô hình AI](ai-model-deployment.md)
- **➡️ Tiếp theo**: [Thực hành AI Sản xuất Tốt nhất](production-ai-practices.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../getting-started/configuration.md)

## Tổng quan về Workshop

Buổi thực hành này hướng dẫn các nhà phát triển cách sử dụng một mẫu AI hiện có và triển khai nó bằng Azure Developer CLI (AZD). Bạn sẽ học các mẫu thiết yếu để triển khai AI sản xuất bằng các dịch vụ Microsoft Foundry.

**Thời lượng:** 2-3 giờ  
**Cấp độ:** Trung cấp  
**Yêu cầu trước:** Kiến thức cơ bản về Azure, quen thuộc với các khái niệm AI/ML

## 🎓 Mục tiêu học tập

Kết thúc workshop này, bạn sẽ có thể:
- ✅ Chuyển đổi một ứng dụng AI hiện có để sử dụng các mẫu AZD
- ✅ Cấu hình các dịch vụ Microsoft Foundry với AZD
- ✅ Thực hiện quản lý thông tin đăng nhập an toàn cho các dịch vụ AI
- ✅ Triển khai các ứng dụng AI sẵn sàng sản xuất với giám sát
- ✅ Khắc phục các vấn đề phổ biến khi triển khai AI

## Yêu cầu trước

### Công cụ cần thiết
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) đã cài đặt
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) đã cài đặt
- [Git](https://git-scm.com/) đã cài đặt
- Trình chỉnh sửa mã (khuyến nghị VS Code)

### Tài nguyên Azure
- Đăng ký Azure với quyền truy cập contributor
- Quyền truy cập vào dịch vụ Azure OpenAI (hoặc khả năng yêu cầu quyền truy cập)
- Quyền tạo nhóm tài nguyên

### Kiến thức yêu cầu
- Hiểu biết cơ bản về các dịch vụ Azure
- Quen thuộc với giao diện dòng lệnh
- Các khái niệm cơ bản về AI/ML (API, mô hình, lời nhắc)

## Thiết lập Lab

### Bước 1: Chuẩn bị môi trường

1. **Xác minh các công cụ đã cài đặt:**
```bash
# Kiểm tra cài đặt AZD
azd version

# Kiểm tra Azure CLI
az --version

# Đăng nhập vào Azure
az login
azd auth login
```

2. **Clone kho lưu trữ workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Hiểu cấu trúc AZD cho các ứng dụng AI

### Cấu trúc của một mẫu AZD sẵn sàng cho AI

Khám phá các tệp chính trong một mẫu AZD sẵn sàng cho AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Bài tập Lab 1.1: Khám phá Cấu hình**

1. **Kiểm tra tệp azure.yaml:**
```bash
cat azure.yaml
```

**Những điều cần tìm:**
- Định nghĩa dịch vụ cho các thành phần AI
- Ánh xạ biến môi trường
- Cấu hình máy chủ

2. **Xem lại cơ sở hạ tầng main.bicep:**
```bash
cat infra/main.bicep
```

**Các mẫu AI chính cần xác định:**
- Cung cấp dịch vụ Azure OpenAI
- Tích hợp Tìm kiếm Nhận thức
- Quản lý khóa an toàn
- Cấu hình bảo mật mạng

### **Điểm thảo luận:** Tại sao các mẫu này quan trọng đối với AI

- **Phụ thuộc dịch vụ**: Các ứng dụng AI thường yêu cầu nhiều dịch vụ phối hợp
- **Bảo mật**: Các khóa API và điểm cuối cần được quản lý an toàn
- **Khả năng mở rộng**: Khối lượng công việc AI có yêu cầu mở rộng độc đáo
- **Quản lý chi phí**: Các dịch vụ AI có thể tốn kém nếu không được cấu hình đúng cách

## Module 2: Triển khai Ứng dụng AI Đầu tiên của Bạn

### Bước 2.1: Khởi tạo Môi trường

1. **Tạo môi trường AZD mới:**
```bash
azd env new myai-workshop
```

2. **Đặt các tham số cần thiết:**
```bash
# Đặt khu vực Azure ưa thích của bạn
azd env set AZURE_LOCATION eastus

# Tùy chọn: Đặt mô hình OpenAI cụ thể
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Bước 2.2: Triển khai Cơ sở hạ tầng và Ứng dụng

1. **Triển khai với AZD:**
```bash
azd up
```

**Điều gì xảy ra trong `azd up`:**
- ✅ Cung cấp dịch vụ Azure OpenAI
- ✅ Tạo dịch vụ Tìm kiếm Nhận thức
- ✅ Thiết lập Dịch vụ Ứng dụng cho ứng dụng web
- ✅ Cấu hình mạng và bảo mật
- ✅ Triển khai mã ứng dụng
- ✅ Thiết lập giám sát và ghi nhật ký

2. **Theo dõi tiến trình triển khai** và ghi chú các tài nguyên đang được tạo.

### Bước 2.3: Xác minh Triển khai của Bạn

1. **Kiểm tra các tài nguyên đã triển khai:**
```bash
azd show
```

2. **Mở ứng dụng đã triển khai:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Kiểm tra chức năng AI:**
   - Điều hướng đến ứng dụng web
   - Thử các truy vấn mẫu
   - Xác minh các phản hồi AI đang hoạt động

### **Bài tập Lab 2.1: Thực hành Khắc phục sự cố**

**Kịch bản**: Triển khai của bạn thành công nhưng AI không phản hồi.

**Các vấn đề phổ biến cần kiểm tra:**
1. **Khóa API OpenAI**: Xác minh chúng được đặt đúng
2. **Khả dụng của mô hình**: Kiểm tra xem khu vực của bạn có hỗ trợ mô hình không
3. **Kết nối mạng**: Đảm bảo các dịch vụ có thể giao tiếp
4. **Quyền RBAC**: Xác minh ứng dụng có thể truy cập OpenAI

**Lệnh gỡ lỗi:**
```bash
# Kiểm tra các biến môi trường
azd env get-values

# Xem nhật ký triển khai
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kiểm tra trạng thái triển khai OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Tùy chỉnh Ứng dụng AI theo Nhu cầu của Bạn

### Bước 3.1: Sửa đổi Cấu hình AI

1. **Cập nhật mô hình OpenAI:**
```bash
# Thay đổi sang một mô hình khác (nếu có sẵn trong khu vực của bạn)
azd env set AZURE_OPENAI_MODEL gpt-4

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

### Bước 3.2: Cấu hình Cụ thể cho Môi trường

**Thực hành tốt nhất**: Các cấu hình khác nhau cho phát triển và sản xuất.

1. **Tạo môi trường sản xuất:**
```bash
azd env new myai-production
```

2. **Đặt các tham số cụ thể cho sản xuất:**
```bash
# Sản xuất thường sử dụng các SKU cao hơn
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Bật các tính năng bảo mật bổ sung
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Bài tập Lab 3.1: Tối ưu hóa Chi phí**

**Thử thách**: Cấu hình mẫu để phát triển hiệu quả về chi phí.

**Nhiệm vụ:**
1. Xác định các SKU có thể được đặt ở mức miễn phí/cơ bản
2. Cấu hình các biến môi trường để giảm chi phí tối thiểu
3. Triển khai và so sánh chi phí với cấu hình sản xuất

**Gợi ý giải pháp:**
- Sử dụng cấp F0 (miễn phí) cho Dịch vụ Nhận thức khi có thể
- Sử dụng cấp Cơ bản cho Dịch vụ Tìm kiếm trong phát triển
- Cân nhắc sử dụng kế hoạch Tiêu thụ cho Functions

## Module 4: Bảo mật và Thực hành Tốt nhất cho Sản xuất

### Bước 4.1: Quản lý Thông tin Đăng nhập An toàn

**Thách thức hiện tại**: Nhiều ứng dụng AI mã hóa cứng các khóa API hoặc sử dụng lưu trữ không an toàn.

**Giải pháp AZD**: Tích hợp Managed Identity + Key Vault.

1. **Xem lại cấu hình bảo mật trong mẫu của bạn:**
```bash
# Tìm kiếm cấu hình Key Vault và Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Xác minh Managed Identity đang hoạt động:**
```bash
# Kiểm tra xem ứng dụng web có cấu hình nhận dạng chính xác không
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Bước 4.2: Bảo mật Mạng

1. **Kích hoạt các điểm cuối riêng tư** (nếu chưa được cấu hình):

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

### Bước 4.3: Giám sát và Khả năng Quan sát

1. **Cấu hình Application Insights:**
```bash
# Ứng dụng Insights nên được cấu hình tự động
# Kiểm tra cấu hình:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Thiết lập giám sát cụ thể cho AI:**

Thêm các chỉ số tùy chỉnh cho các hoạt động AI:
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

### **Bài tập Lab 4.1: Kiểm tra Bảo mật**

**Nhiệm vụ**: Xem lại triển khai của bạn để tìm các thực hành bảo mật tốt nhất.

**Danh sách kiểm tra:**
- [ ] Không có bí mật mã hóa cứng trong mã hoặc cấu hình
- [ ] Managed Identity được sử dụng cho xác thực giữa các dịch vụ
- [ ] Key Vault lưu trữ cấu hình nhạy cảm
- [ ] Truy cập mạng được hạn chế đúng cách
- [ ] Giám sát và ghi nhật ký được kích hoạt

## Module 5: Chuyển đổi Ứng dụng AI của Riêng Bạn

### Bước 5.1: Bảng Đánh giá

**Trước khi chuyển đổi ứng dụng của bạn**, trả lời các câu hỏi sau:

1. **Kiến trúc Ứng dụng:**
   - Ứng dụng của bạn sử dụng những dịch vụ AI nào?
   - Nó cần những tài nguyên tính toán nào?
   - Nó có yêu cầu cơ sở dữ liệu không?
   - Các phụ thuộc giữa các dịch vụ là gì?

2. **Yêu cầu Bảo mật:**
   - Ứng dụng của bạn xử lý dữ liệu nhạy cảm nào?
   - Bạn có yêu cầu tuân thủ nào không?
   - Bạn có cần mạng riêng không?

3. **Yêu cầu Mở rộng:**
   - Tải dự kiến của bạn là gì?
   - Bạn có cần tự động mở rộng không?
   - Có yêu cầu khu vực nào không?

### Bước 5.2: Tạo Mẫu AZD của Bạn

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

3. **Tạo các mẫu cơ sở hạ tầng:**

**infra/main.bicep** - Mẫu chính:
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

### **Bài tập Lab 5.1: Thử thách Tạo Mẫu**

**Thử thách**: Tạo một mẫu AZD cho ứng dụng AI xử lý tài liệu.

**Yêu cầu:**
- Azure OpenAI để phân tích nội dung
- Document Intelligence cho OCR
- Tài khoản Lưu trữ để tải lên tài liệu
- Function App cho logic xử lý
- Ứng dụng web cho giao diện người dùng

**Điểm thưởng:**
- Thêm xử lý lỗi đúng cách
- Bao gồm ước tính chi phí
- Thiết lập bảng điều khiển giám sát

## Module 6: Khắc phục các Vấn đề Phổ biến

### Các Vấn đề Triển khai Phổ biến

#### Vấn đề 1: Vượt quá Hạn mức Dịch vụ OpenAI
**Triệu chứng:** Triển khai thất bại với lỗi hạn mức
**Giải pháp:**
```bash
# Kiểm tra hạn ngạch hiện tại
az cognitiveservices usage list --location eastus

# Yêu cầu tăng hạn ngạch hoặc thử khu vực khác
azd env set AZURE_LOCATION westus2
azd up
```

#### Vấn đề 2: Mô hình Không Có sẵn trong Khu vực
**Triệu chứng:** Phản hồi AI thất bại hoặc lỗi triển khai mô hình
**Giải pháp:**
```bash
# Kiểm tra tính khả dụng của mô hình theo khu vực
az cognitiveservices model list --location eastus

# Cập nhật mô hình khả dụng
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Vấn đề 3: Vấn đề Quyền
**Triệu chứng:** Lỗi 403 Forbidden khi gọi các dịch vụ AI
**Giải pháp:**
```bash
# Kiểm tra các vai trò được gán
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Thêm các vai trò bị thiếu
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Vấn đề Hiệu suất

#### Vấn đề 4: Phản hồi AI Chậm
**Các bước điều tra:**
1. Kiểm tra Application Insights để tìm các chỉ số hiệu suất
2. Xem lại các chỉ số dịch vụ OpenAI trong cổng Azure
3. Xác minh kết nối mạng và độ trễ

**Giải pháp:**
- Thực hiện caching cho các truy vấn phổ biến
- Sử dụng mô hình OpenAI phù hợp với trường hợp sử dụng của bạn
- Cân nhắc các bản sao đọc cho các kịch bản tải cao

### **Bài tập Lab 6.1: Thử thách Gỡ lỗi**

**Kịch bản**: Triển khai của bạn thành công, nhưng ứng dụng trả về lỗi 500.

**Nhiệm vụ gỡ lỗi:**
1. Kiểm tra nhật ký ứng dụng
2. Xác minh kết nối dịch vụ
3. Kiểm tra xác thực
4. Xem lại cấu hình

**Công cụ sử dụng:**
- `azd show` để xem tổng quan triển khai
- Cổng Azure để xem chi tiết nhật ký dịch vụ
- Application Insights để xem telemetry ứng dụng

## Module 7: Giám sát và Tối ưu hóa

### Bước 7.1: Thiết lập Giám sát Toàn diện

1. **Tạo bảng điều khiển tùy chỉnh:**

Điều hướng đến cổng Azure và tạo bảng điều khiển với:
- Số lượng yêu cầu và độ trễ của OpenAI
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

### Bước 7.2: Tối ưu hóa Chi phí

1. **Phân tích chi phí hiện tại:**
```bash
# Sử dụng Azure CLI để lấy dữ liệu chi phí
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Thực hiện kiểm soát chi phí:**
- Thiết lập cảnh báo ngân sách
- Sử dụng chính sách tự động mở rộng
- Thực hiện caching yêu cầu
- Theo dõi việc sử dụng token cho OpenAI

### **Bài tập Lab 7.1: Tối ưu hóa Hiệu suất**

**Nhiệm vụ**: Tối ưu hóa ứng dụng AI của bạn về cả hiệu suất và chi phí.

**Các chỉ số cần cải thiện:**
- Giảm thời gian phản hồi trung bình 20%
- Giảm chi phí hàng tháng 15%
- Duy trì thời gian hoạt động 99.9%

**Chiến lược thử nghiệm:**
- Thực hiện caching phản hồi
- Tối ưu hóa lời nhắc để sử dụng token hiệu quả
- Sử dụng các SKU tính toán phù hợp
- Thiết lập tự động mở rộng đúng cách

## Thử thách Cuối cùng: Triển khai Từ Đầu đến Cuối

### Kịch bản Thử thách

Bạn được giao nhiệm vụ tạo một chatbot dịch vụ khách hàng hỗ trợ AI sẵn sàng sản xuất với các yêu cầu sau:

**Yêu cầu Chức năng:**
- Giao diện web cho tương tác khách hàng
- Tích hợp với Azure OpenAI để phản hồi
- Khả năng tìm kiếm tài liệu bằng Tìm kiếm Nhận thức
- Tích hợp với cơ sở dữ liệu khách hàng hiện có
- Hỗ trợ đa ngôn ngữ

**Yêu cầu Phi chức năng:**
- Xử lý 1000 người dùng đồng thời
- SLA thời gian hoạt động 99.9%
- Tuân thủ SOC 2
- Chi phí dưới $500/tháng
- Triển khai đến nhiều môi trường (dev, staging, prod)

### Các bước Triển khai

1. **Thiết kế kiến trúc**
2. **Tạo mẫu AZD**
3. **Thực hiện các biện pháp bảo mật**
4. **Thiết lập giám sát và cảnh báo**
5. **Tạo các pipeline triển khai**
6. **Tài liệu hóa giải pháp**

### Tiêu chí Đánh giá

- ✅ **Chức năng**: Có đáp ứng tất cả các yêu cầu không?
- ✅ **Bảo mật**: Các thực hành tốt nhất có được thực hiện không?
- ✅ **Khả năng mở rộng**: Có thể xử lý tải không?
- ✅ **Khả năng bảo trì**: Mã và cơ sở hạ tầng có được tổ chức tốt không?
- ✅ **Chi phí**: Có nằm trong ngân sách không?

## Tài nguyên Bổ sung

### Tài liệu Microsoft
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Tài liệu Dịch vụ Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Tài liệu Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Mẫu Tham khảo
- [Ứng dụng Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Quickstart Ứng dụng Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Tài nguyên Cộng đồng
- [Discord Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Chứng chỉ Hoàn thành
Chúc mừng! Bạn đã hoàn thành Phòng Thí Nghiệm Hội Thảo AI. Giờ đây, bạn có thể:

- ✅ Chuyển đổi các ứng dụng AI hiện có sang mẫu AZD
- ✅ Triển khai các ứng dụng AI sẵn sàng cho sản xuất
- ✅ Thực hiện các phương pháp bảo mật tốt nhất cho khối lượng công việc AI
- ✅ Giám sát và tối ưu hóa hiệu suất ứng dụng AI
- ✅ Khắc phục các vấn đề triển khai phổ biến

### Bước Tiếp Theo
1. Áp dụng các mẫu này vào các dự án AI của riêng bạn
2. Đóng góp các mẫu trở lại cộng đồng
3. Tham gia Microsoft Foundry Discord để nhận hỗ trợ liên tục
4. Khám phá các chủ đề nâng cao như triển khai đa khu vực

---

**Phản Hồi Hội Thảo**: Giúp chúng tôi cải thiện hội thảo này bằng cách chia sẻ trải nghiệm của bạn trong [kênh #Azure trên Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Dành Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 2 - Phát Triển Ưu Tiên AI
- **⬅️ Trước**: [Triển Khai Mô Hình AI](ai-model-deployment.md)
- **➡️ Tiếp Theo**: [Thực Hành Tốt Nhất Cho AI Sản Xuất](production-ai-practices.md)
- **🚀 Chương Tiếp Theo**: [Chương 3: Cấu Hình](../getting-started/configuration.md)

**Cần Hỗ Trợ?** Tham gia cộng đồng của chúng tôi để nhận hỗ trợ và thảo luận về AZD và triển khai AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->