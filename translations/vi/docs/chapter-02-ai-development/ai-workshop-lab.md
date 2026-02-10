# Phòng Thí Nghiệm Workshop AI: Đưa Giải pháp AI của Bạn Đến Trạng Thái Có Thể Triển Khai bằng AZD

**Điều Hướng Chương:**
- **📚 Trang Khóa Học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện Tại**: Chương 2 - Phát Triển Ưu Tiên AI
- **⬅️ Trước**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Tiếp theo**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Chương Tiếp Theo**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Tổng Quan Workshop

Phòng thí nghiệm thực hành này hướng dẫn các nhà phát triển qua quy trình lấy một mẫu AI hiện có và triển khai nó bằng Azure Developer CLI (AZD). Bạn sẽ học các mẫu thiết yếu cho triển khai AI trong môi trường production sử dụng dịch vụ Microsoft Foundry.

**Thời lượng:** 2-3 giờ  
**Cấp độ:** Trung cấp  
**Yêu cầu tiên quyết:** Kiến thức cơ bản về Azure, quen thuộc với khái niệm AI/ML

## 🎓 Mục Tiêu Học Tập

Cuối khóa, bạn sẽ có khả năng:
- ✅ Chuyển đổi một ứng dụng AI hiện có để sử dụng mẫu AZD
- ✅ Cấu hình dịch vụ Microsoft Foundry bằng AZD
- ✅ Thực hiện quản lý chứng thực an toàn cho các dịch vụ AI
- ✅ Triển khai ứng dụng AI sẵn sàng cho production kèm giám sát
- ✅ Khắc phục các sự cố triển khai AI phổ biến

## Yêu Cầu Tiên Quyết

### Công cụ yêu cầu
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) đã được cài đặt
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) đã được cài đặt
- [Git](https://git-scm.com/) đã được cài đặt
- Trình chỉnh sửa mã (khuyến nghị VS Code)

### Tài nguyên Azure
- Subscription Azure với quyền contributor
- Quyền truy cập dịch vụ Azure OpenAI (hoặc khả năng yêu cầu truy cập)
- Quyền tạo resource group

### Yêu cầu kiến thức
- Hiểu biết cơ bản về dịch vụ Azure
- Quen thuộc với giao diện dòng lệnh
- Khái niệm cơ bản về AI/ML (API, mô hình, prompt)

## Thiết lập Lab

### Bước 1: Chuẩn bị Môi trường

1. **Xác nhận cài đặt các công cụ:**
```bash
# Kiểm tra cài đặt AZD
azd version

# Kiểm tra Azure CLI
az --version

# Đăng nhập vào Azure
az login
azd auth login
```

2. **Clone kho chứa workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Hiểu Cấu Trúc AZD cho Ứng dụng AI

### Cấu trúc của một mẫu AZD dành cho AI

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

1. **Xem xét tệp azure.yaml:**
```bash
cat azure.yaml
```

**Những điều cần chú ý:**
- Định nghĩa dịch vụ cho các thành phần AI
- Ánh xạ biến môi trường
- Cấu hình host

2. **Xem lại hạ tầng main.bicep:**
```bash
cat infra/main.bicep
```

**Các mẫu AI chính cần xác định:**
- Cấp phát dịch vụ Azure OpenAI
- Tích hợp Cognitive Search
- Quản lý khóa an toàn
- Cấu hình bảo mật mạng

### **Điểm Thảo luận:** Tại sao Những Mẫu Này Quan Trọng đối với AI

- **Phụ thuộc dịch vụ**: Ứng dụng AI thường yêu cầu nhiều dịch vụ phối hợp
- **Bảo mật**: Khóa API và endpoints cần được quản lý an toàn
- **Khả năng mở rộng**: Tải AI có các yêu cầu scaling riêng
- **Quản lý chi phí**: Dịch vụ AI có thể tốn kém nếu không được cấu hình đúng

## Module 2: Triển khai Ứng dụng AI Đầu tiên của Bạn

### Bước 2.1: Khởi tạo Môi trường

1. **Tạo một môi trường AZD mới:**
```bash
azd env new myai-workshop
```

2. **Đặt các tham số cần thiết:**
```bash
# Chọn vùng Azure ưa thích của bạn
azd env set AZURE_LOCATION eastus

# Tùy chọn: Đặt mô hình OpenAI cụ thể
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Bước 2.2: Triển khai Hạ tầng và Ứng dụng

1. **Triển khai bằng AZD:**
```bash
azd up
```

**Điều gì xảy ra trong quá trình `azd up`:**
- ✅ Cấp phát dịch vụ Azure OpenAI
- ✅ Tạo dịch vụ Cognitive Search
- ✅ Thiết lập App Service cho ứng dụng web
- ✅ Cấu hình mạng và bảo mật
- ✅ Triển khai mã ứng dụng
- ✅ Thiết lập giám sát và logging

2. **Theo dõi tiến trình triển khai** và ghi chú các tài nguyên đang được tạo.

### Bước 2.3: Xác minh Việc Triển khai của Bạn

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
   - Xác nhận phản hồi AI hoạt động

### **Bài tập Lab 2.1: Thực hành Khắc phục Sự cố**

**Kịch bản**: Việc triển khai của bạn đã thành công nhưng AI không phản hồi.

**Các vấn đề phổ biến cần kiểm tra:**
1. **OpenAI API keys**: Xác minh chúng được thiết lập đúng
2. **Model availability**: Kiểm tra vùng của bạn có hỗ trợ mô hình không
3. **Network connectivity**: Đảm bảo các dịch vụ có thể giao tiếp
4. **RBAC permissions**: Xác minh ứng dụng có thể truy cập OpenAI

**Các lệnh gỡ lỗi:**
```bash
# Kiểm tra biến môi trường
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
# Chuyển sang mô hình khác (nếu có sẵn trong khu vực của bạn)
azd env set AZURE_OPENAI_MODEL gpt-4

# Triển khai lại với cấu hình mới
azd deploy
```

2. **Thêm dịch vụ AI bổ sung:**

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

### Bước 3.2: Cấu hình theo Môi trường

**Thực hành tốt nhất**: Cấu hình khác nhau cho môi trường phát triển (development) và sản xuất (production).

1. **Tạo môi trường production:**
```bash
azd env new myai-production
```

2. **Đặt tham số riêng cho production:**
```bash
# Môi trường sản xuất thường sử dụng các SKU cao hơn
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Kích hoạt các tính năng bảo mật bổ sung
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Bài tập Lab 3.1: Tối ưu Hóa Chi Phí**

**Thử thách**: Cấu hình mẫu để tiết kiệm chi phí trong môi trường phát triển.

**Nhiệm vụ:**
1. Xác định SKU nào có thể đặt ở mức free/basic
2. Cấu hình biến môi trường để giảm thiểu chi phí
3. Triển khai và so sánh chi phí với cấu hình production

**Gợi ý giải pháp:**
- Sử dụng tier F0 (miễn phí) cho Cognitive Services khi có thể
- Sử dụng tier Basic cho Search Service trong phát triển
- Cân nhắc dùng Consumption plan cho Functions

## Module 4: Bảo mật và Thực hành Tốt nhất cho Production

### Bước 4.1: Quản lý Chứng thực An toàn

**Thách thức hiện tại**: Nhiều ứng dụng AI ghi cứng khóa API hoặc lưu trữ không an toàn.

**Giải pháp AZD**: Tích hợp Managed Identity + Key Vault.

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

### Bước 4.2: Bảo mật Mạng

1. **Kích hoạt private endpoints** (nếu chưa cấu hình):

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
# Application Insights nên được cấu hình tự động
# Kiểm tra cấu hình:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Thiết lập giám sát riêng cho AI:**

Thêm các metric tuỳ chỉnh cho các hoạt động AI:
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

### **Bài tập Lab 4.1: Kiểm toán Bảo mật**

**Nhiệm vụ**: Xem xét triển khai của bạn theo các thực hành bảo mật tốt nhất.

**Danh sách kiểm tra:**
- [ ] Không có secrets được hardcode trong mã hoặc cấu hình
- [ ] Sử dụng Managed Identity cho xác thực dịch vụ giữa các dịch vụ
- [ ] Key Vault lưu trữ cấu hình nhạy cảm
- [ ] Truy cập mạng được hạn chế đúng cách
- [ ] Giám sát và logging được bật

## Module 5: Chuyển đổi Ứng dụng AI của Bạn

### Bước 5.1: Bảng Đánh giá

**Trước khi chuyển đổi ứng dụng của bạn**, hãy trả lời những câu hỏi sau:

1. **Kiến trúc ứng dụng:**
   - Ứng dụng của bạn sử dụng dịch vụ AI nào?
   - Nó cần tài nguyên compute ra sao?
   - Có cần cơ sở dữ liệu không?
   - Những phụ thuộc giữa các dịch vụ là gì?

2. **Yêu cầu bảo mật:**
   - Ứng dụng của bạn xử lý dữ liệu nhạy cảm nào?
   - Có yêu cầu tuân thủ nào không?
   - Có cần mạng riêng (private networking) không?

3. **Yêu cầu về khả năng mở rộng:**
   - Tải dự kiến là gì?
   - Có cần autoscaling không?
   - Có yêu cầu vùng (region) không?

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

3. **Tạo mẫu hạ tầng:**

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
- Azure OpenAI cho phân tích nội dung
- Document Intelligence cho OCR
- Storage Account cho tải lên tài liệu
- Function App cho logic xử lý
- Web app cho giao diện người dùng

**Điểm cộng thêm:**
- Thêm xử lý lỗi phù hợp
- Bao gồm ước tính chi phí
- Thiết lập dashboard giám sát

## Module 6: Khắc phục Các Vấn đề Thường gặp

### Các Sự cố Triển khai Thường gặp

#### Vấn đề 1: Vượt Quota Dịch vụ OpenAI
**Triệu chứng:** Triển khai thất bại với lỗi quota  
**Giải pháp:**
```bash
# Kiểm tra hạn mức hiện tại
az cognitiveservices usage list --location eastus

# Yêu cầu tăng hạn mức hoặc thử vùng khác
azd env set AZURE_LOCATION westus2
azd up
```

#### Vấn đề 2: Mô hình không có sẵn trong vùng
**Triệu chứng:** Phản hồi AI thất bại hoặc lỗi triển khai mô hình  
**Giải pháp:**
```bash
# Kiểm tra khả dụng của mô hình theo khu vực
az cognitiveservices model list --location eastus

# Cập nhật lên mô hình có sẵn
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Vấn đề 3: Vấn đề quyền truy cập
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

### Vấn đề Hiệu năng

#### Vấn đề 4: Phản hồi AI chậm
**Các bước điều tra:**
1. Kiểm tra Application Insights để lấy metric hiệu năng
2. Xem xét metric dịch vụ OpenAI trong Azure portal
3. Xác minh kết nối mạng và độ trễ

**Giải pháp:**
- Triển khai caching cho các truy vấn phổ biến
- Sử dụng mô hình OpenAI phù hợp với trường hợp sử dụng
- Cân nhắc replica đọc cho các kịch bản tải cao

### **Bài tập Lab 6.1: Thử thách Gỡ lỗi**

**Kịch bản**: Việc triển khai của bạn đã thành công, nhưng ứng dụng trả về lỗi 500.

**Nhiệm vụ gỡ lỗi:**
1. Kiểm tra logs ứng dụng
2. Xác minh kết nối giữa các dịch vụ
3. Kiểm tra xác thực
4. Xem lại cấu hình

**Công cụ để sử dụng:**
- `azd show` để xem tổng quan triển khai
- Azure portal để xem logs chi tiết của dịch vụ
- Application Insights để lấy telemetry ứng dụng

## Module 7: Giám sát và Tối ưu hóa

### Bước 7.1: Thiết lập Giám sát Toàn diện

1. **Tạo dashboard tuỳ chỉnh:**

Đi tới Azure portal và tạo dashboard với:
- Số lượng và độ trễ request OpenAI
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

### Bước 7.2: Tối ưu Hoá Chi Phí

1. **Phân tích chi phí hiện tại:**
```bash
# Sử dụng Azure CLI để lấy dữ liệu chi phí
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Thực hiện kiểm soát chi phí:**
- Thiết lập cảnh báo ngân sách
- Sử dụng chính sách autoscaling
- Triển khai caching cho các request
- Giám sát lượng token sử dụng cho OpenAI

### **Bài tập Lab 7.1: Tối ưu hiệu năng**

**Nhiệm vụ**: Tối ưu ứng dụng AI của bạn cho cả hiệu năng và chi phí.

**Các chỉ số cần cải thiện:**
- Giảm thời gian phản hồi trung bình 20%
- Giảm chi phí hàng tháng 15%
- Duy trì 99.9% thời gian hoạt động

**Chiến lược thử:**
- Triển khai caching phản hồi
- Tối ưu prompt để tiết kiệm token
- Sử dụng SKU compute phù hợp
- Thiết lập autoscaling phù hợp

## Thử thách Cuối cùng: Triển khai Từ Đầu Đến Cuối

### Kịch bản Thử thách

Bạn được giao nhiệm vụ tạo một chatbot dịch vụ khách hàng sẵn sàng cho production sử dụng AI với các yêu cầu sau:

**Yêu cầu chức năng:**
- Giao diện web cho tương tác với khách hàng
- Tích hợp với Azure OpenAI để trả lời
- Khả năng tìm kiếm tài liệu bằng Cognitive Search
- Tích hợp với cơ sở dữ liệu khách hàng hiện có
- Hỗ trợ đa ngôn ngữ

**Yêu cầu phi chức năng:**
- Xử lý 1000 người dùng đồng thời
- SLA 99.9% uptime
- Tuân thủ SOC 2
- Chi phí dưới $500/tháng
- Triển khai tới nhiều môi trường (dev, staging, prod)

### Các bước Triển khai

1. **Thiết kế kiến trúc**
2. **Tạo mẫu AZD**
3. **Thực hiện các biện pháp bảo mật**
4. **Thiết lập giám sát và cảnh báo**
5. **Tạo pipeline triển khai**
6. **Tài liệu hoá giải pháp**

### Tiêu chí Đánh giá

- ✅ **Chức năng**: Có đáp ứng tất cả yêu cầu không?
- ✅ **Bảo mật**: Có áp dụng các thực hành tốt nhất không?
- ✅ **Khả năng mở rộng**: Có thể chịu được tải không?
- ✅ **Dễ bảo trì**: Mã và hạ tầng có tổ chức tốt không?
- ✅ **Chi phí**: Có nằm trong ngân sách không?

## Tài nguyên Bổ sung

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Chứng chỉ Hoàn thành
Chúc mừng! Bạn đã hoàn thành AI Workshop Lab. Bây giờ bạn nên có khả năng:

- ✅ Chuyển đổi các ứng dụng AI hiện có thành các mẫu AZD
- ✅ Triển khai các ứng dụng AI sẵn sàng cho sản xuất
- ✅ Triển khai các thực hành bảo mật tốt nhất cho khối lượng công việc AI
- ✅ Giám sát và tối ưu hiệu suất ứng dụng AI
- ✅ Khắc phục sự cố triển khai thường gặp

### Bước tiếp theo
1. Áp dụng các mẫu này cho các dự án AI của bạn
2. Đóng góp các mẫu trở lại cho cộng đồng
3. Tham gia Microsoft Foundry Discord để được hỗ trợ liên tục
4. Khám phá các chủ đề nâng cao như triển khai đa vùng

---

**Phản hồi Hội thảo**: Hãy giúp chúng tôi cải thiện hội thảo này bằng cách chia sẻ trải nghiệm của bạn trong [kênh #Azure của Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD Dành cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển ưu tiên AI
- **⬅️ Trước**: [Triển khai Mô hình AI](ai-model-deployment.md)
- **➡️ Tiếp theo**: [Thực hành tốt nhất cho AI trong môi trường sản xuất](production-ai-practices.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

**Cần trợ giúp?** Tham gia cộng đồng của chúng tôi để được hỗ trợ và thảo luận về AZD và các triển khai AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ nguồn nên được coi là nguồn có thẩm quyền. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do người dịch thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->