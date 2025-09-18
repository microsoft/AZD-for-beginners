<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-18T07:35:14+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "vi"
}
-->
# AI Workshop Lab: Làm cho Giải pháp AI của bạn có thể triển khai với AZD

**Điều hướng chương:**
- **📚 Trang chủ khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển AI-First
- **⬅️ Trước đó**: [Triển khai Mô hình AI](ai-model-deployment.md)
- **➡️ Tiếp theo**: [Thực hành AI Sản xuất Tốt nhất](production-ai-practices.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../getting-started/configuration.md)

## Tổng quan về Workshop

Buổi thực hành này hướng dẫn các nhà phát triển cách biến một ứng dụng AI hiện có thành có thể triển khai bằng Azure Developer CLI (AZD). Bạn sẽ học các mẫu thiết yếu để triển khai AI sản xuất bằng các dịch vụ Azure AI Foundry.

**Thời lượng:** 2-3 giờ  
**Cấp độ:** Trung cấp  
**Yêu cầu trước:** Kiến thức cơ bản về Azure, quen thuộc với các khái niệm AI/ML

## 🎓 Mục tiêu học tập

Kết thúc workshop này, bạn sẽ có thể:
- ✅ Chuyển đổi một ứng dụng AI hiện có để sử dụng các mẫu AZD
- ✅ Cấu hình các dịch vụ Azure AI Foundry với AZD
- ✅ Triển khai quản lý thông tin đăng nhập an toàn cho các dịch vụ AI
- ✅ Triển khai ứng dụng AI sẵn sàng sản xuất với giám sát
- ✅ Khắc phục các vấn đề phổ biến trong triển khai AI

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
- Các khái niệm cơ bản về AI/ML (API, mô hình, prompts)

## Thiết lập Lab

### Bước 1: Chuẩn bị môi trường

1. **Xác minh cài đặt công cụ:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Clone kho lưu trữ workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Hiểu cấu trúc AZD cho ứng dụng AI

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

### **Bài tập Lab 1.1: Khám phá cấu hình**

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
- Tích hợp Cognitive Search
- Quản lý khóa an toàn
- Cấu hình bảo mật mạng

### **Điểm thảo luận:** Tại sao các mẫu này quan trọng đối với AI

- **Phụ thuộc dịch vụ**: Ứng dụng AI thường yêu cầu nhiều dịch vụ phối hợp
- **Bảo mật**: API keys và endpoints cần được quản lý an toàn
- **Khả năng mở rộng**: Khối lượng công việc AI có yêu cầu mở rộng độc đáo
- **Quản lý chi phí**: Dịch vụ AI có thể tốn kém nếu không được cấu hình đúng cách

## Module 2: Triển khai ứng dụng AI đầu tiên của bạn

### Bước 2.1: Khởi tạo môi trường

1. **Tạo môi trường AZD mới:**
```bash
azd env new myai-workshop
```

2. **Đặt các tham số cần thiết:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Bước 2.2: Triển khai cơ sở hạ tầng và ứng dụng

1. **Triển khai với AZD:**
```bash
azd up
```

**Điều gì xảy ra trong `azd up`:**
- ✅ Cung cấp dịch vụ Azure OpenAI
- ✅ Tạo dịch vụ Cognitive Search
- ✅ Thiết lập App Service cho ứng dụng web
- ✅ Cấu hình mạng và bảo mật
- ✅ Triển khai mã ứng dụng
- ✅ Thiết lập giám sát và ghi nhật ký

2. **Theo dõi tiến trình triển khai** và ghi chú các tài nguyên được tạo.

### Bước 2.3: Xác minh triển khai của bạn

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
   - Xác minh các phản hồi AI hoạt động

### **Bài tập Lab 2.1: Thực hành khắc phục sự cố**

**Kịch bản**: Triển khai của bạn thành công nhưng AI không phản hồi.

**Các vấn đề phổ biến cần kiểm tra:**
1. **API keys của OpenAI**: Xác minh chúng được đặt đúng
2. **Khả dụng của mô hình**: Kiểm tra xem khu vực của bạn có hỗ trợ mô hình không
3. **Kết nối mạng**: Đảm bảo các dịch vụ có thể giao tiếp
4. **Quyền RBAC**: Xác minh ứng dụng có thể truy cập OpenAI

**Lệnh gỡ lỗi:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Tùy chỉnh ứng dụng AI cho nhu cầu của bạn

### Bước 3.1: Sửa đổi cấu hình AI

1. **Cập nhật mô hình OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
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

### Bước 3.2: Cấu hình cụ thể cho môi trường

**Thực hành tốt nhất**: Cấu hình khác nhau cho phát triển và sản xuất.

1. **Tạo môi trường sản xuất:**
```bash
azd env new myai-production
```

2. **Đặt các tham số cụ thể cho sản xuất:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Bài tập Lab 3.1: Tối ưu hóa chi phí**

**Thử thách**: Cấu hình mẫu để phát triển hiệu quả về chi phí.

**Nhiệm vụ:**
1. Xác định các SKUs có thể đặt ở mức miễn phí/cơ bản
2. Cấu hình biến môi trường để giảm chi phí
3. Triển khai và so sánh chi phí với cấu hình sản xuất

**Gợi ý giải pháp:**
- Sử dụng tier F0 (miễn phí) cho Cognitive Services khi có thể
- Sử dụng tier Basic cho Search Service trong phát triển
- Cân nhắc sử dụng Consumption plan cho Functions

## Module 4: Bảo mật và Thực hành Tốt nhất cho Sản xuất

### Bước 4.1: Quản lý thông tin đăng nhập an toàn

**Thách thức hiện tại**: Nhiều ứng dụng AI hardcode API keys hoặc sử dụng lưu trữ không an toàn.

**Giải pháp AZD**: Managed Identity + tích hợp Key Vault.

1. **Xem lại cấu hình bảo mật trong mẫu của bạn:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Xác minh Managed Identity hoạt động:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Bước 4.2: Bảo mật mạng

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

### Bước 4.3: Giám sát và khả năng quan sát

1. **Cấu hình Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Thiết lập giám sát cụ thể cho AI:**

Thêm các chỉ số tùy chỉnh cho hoạt động AI:
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

### **Bài tập Lab 4.1: Kiểm tra bảo mật**

**Nhiệm vụ**: Xem lại triển khai của bạn để đảm bảo thực hành bảo mật tốt nhất.

**Danh sách kiểm tra:**
- [ ] Không có bí mật hardcode trong mã hoặc cấu hình
- [ ] Managed Identity được sử dụng cho xác thực giữa các dịch vụ
- [ ] Key Vault lưu trữ cấu hình nhạy cảm
- [ ] Truy cập mạng được hạn chế đúng cách
- [ ] Giám sát và ghi nhật ký được kích hoạt

## Module 5: Chuyển đổi ứng dụng AI của riêng bạn

### Bước 5.1: Bảng đánh giá

**Trước khi chuyển đổi ứng dụng của bạn**, trả lời các câu hỏi sau:

1. **Kiến trúc ứng dụng:**
   - Ứng dụng của bạn sử dụng những dịch vụ AI nào?
   - Nó cần những tài nguyên tính toán nào?
   - Nó có yêu cầu cơ sở dữ liệu không?
   - Các phụ thuộc giữa các dịch vụ là gì?

2. **Yêu cầu bảo mật:**
   - Ứng dụng của bạn xử lý dữ liệu nhạy cảm nào?
   - Bạn có yêu cầu tuân thủ nào không?
   - Bạn có cần mạng riêng không?

3. **Yêu cầu mở rộng:**
   - Tải dự kiến của bạn là gì?
   - Bạn có cần tự động mở rộng không?
   - Có yêu cầu khu vực nào không?

### Bước 5.2: Tạo mẫu AZD của bạn

**Làm theo mẫu này để chuyển đổi ứng dụng của bạn:**

1. **Tạo cấu trúc cơ bản:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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

3. **Tạo mẫu cơ sở hạ tầng:**

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

### **Bài tập Lab 5.1: Thử thách tạo mẫu**

**Thử thách**: Tạo mẫu AZD cho một ứng dụng AI xử lý tài liệu.

**Yêu cầu:**
- Azure OpenAI để phân tích nội dung
- Document Intelligence cho OCR
- Storage Account để tải lên tài liệu
- Function App cho logic xử lý
- Ứng dụng web cho giao diện người dùng

**Điểm thưởng:**
- Thêm xử lý lỗi đúng cách
- Bao gồm ước tính chi phí
- Thiết lập bảng điều khiển giám sát

## Module 6: Khắc phục các vấn đề phổ biến

### Các vấn đề triển khai phổ biến

#### Vấn đề 1: Vượt quá hạn mức dịch vụ OpenAI
**Triệu chứng:** Triển khai thất bại với lỗi hạn mức
**Giải pháp:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Vấn đề 2: Mô hình không khả dụng trong khu vực
**Triệu chứng:** Phản hồi AI thất bại hoặc lỗi triển khai mô hình
**Giải pháp:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Vấn đề 3: Vấn đề quyền
**Triệu chứng:** Lỗi 403 Forbidden khi gọi dịch vụ AI
**Giải pháp:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Vấn đề hiệu suất

#### Vấn đề 4: Phản hồi AI chậm
**Các bước điều tra:**
1. Kiểm tra Application Insights để lấy chỉ số hiệu suất
2. Xem lại chỉ số dịch vụ OpenAI trong cổng Azure
3. Xác minh kết nối mạng và độ trễ

**Giải pháp:**
- Triển khai bộ nhớ đệm cho các truy vấn phổ biến
- Sử dụng mô hình OpenAI phù hợp với trường hợp sử dụng của bạn
- Cân nhắc sử dụng bản sao đọc cho các kịch bản tải cao

### **Bài tập Lab 6.1: Thử thách gỡ lỗi**

**Kịch bản**: Triển khai của bạn thành công, nhưng ứng dụng trả về lỗi 500.

**Nhiệm vụ gỡ lỗi:**
1. Kiểm tra nhật ký ứng dụng
2. Xác minh kết nối dịch vụ
3. Kiểm tra xác thực
4. Xem lại cấu hình

**Công cụ sử dụng:**
- `azd show` để xem tổng quan triển khai
- Cổng Azure để xem chi tiết nhật ký dịch vụ
- Application Insights để lấy dữ liệu ứng dụng

## Module 7: Giám sát và Tối ưu hóa

### Bước 7.1: Thiết lập giám sát toàn diện

1. **Tạo bảng điều khiển tùy chỉnh:**

Điều hướng đến cổng Azure và tạo bảng điều khiển với:
- Số lượng yêu cầu và độ trễ của OpenAI
- Tỷ lệ lỗi ứng dụng
- Sử dụng tài nguyên
- Theo dõi chi phí

2. **Thiết lập cảnh báo:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Bước 7.2: Tối ưu hóa chi phí

1. **Phân tích chi phí hiện tại:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Triển khai kiểm soát chi phí:**
- Thiết lập cảnh báo ngân sách
- Sử dụng chính sách tự động mở rộng
- Triển khai bộ nhớ đệm yêu cầu
- Theo dõi việc sử dụng token cho OpenAI

### **Bài tập Lab 7.1: Tối ưu hóa hiệu suất**

**Nhiệm vụ**: Tối ưu hóa ứng dụng AI của bạn về cả hiệu suất và chi phí.

**Chỉ số cần cải thiện:**
- Giảm thời gian phản hồi trung bình 20%
- Giảm chi phí hàng tháng 15%
- Duy trì thời gian hoạt động 99.9%

**Chiến lược thử nghiệm:**
- Triển khai bộ nhớ đệm phản hồi
- Tối ưu hóa prompts để sử dụng token hiệu quả
- Sử dụng SKUs tính toán phù hợp
- Thiết lập tự động mở rộng đúng cách

## Thử thách cuối cùng: Triển khai từ đầu đến cuối

### Kịch bản thử thách

Bạn được giao nhiệm vụ tạo một chatbot dịch vụ khách hàng hỗ trợ AI sẵn sàng sản xuất với các yêu cầu sau:

**Yêu cầu chức năng:**
- Giao diện web cho tương tác khách hàng
- Tích hợp với Azure OpenAI để phản hồi
- Khả năng tìm kiếm tài liệu bằng Cognitive Search
- Tích hợp với cơ sở dữ liệu khách hàng hiện có
- Hỗ trợ đa ngôn ngữ

**Yêu cầu phi chức năng:**
- Xử lý 1000 người dùng đồng thời
- SLA thời gian hoạt động 99.9%
- Tuân thủ SOC 2
- Chi phí dưới $500/tháng
- Triển khai đến nhiều môi trường (dev, staging, prod)

### Các bước triển khai

1. **Thiết kế kiến trúc**
2. **Tạo mẫu AZD**
3. **Triển khai các biện pháp bảo mật**
4. **Thiết lập giám sát và cảnh báo**
5. **Tạo pipeline triển khai**
6. **Tài liệu hóa giải pháp**

### Tiêu chí đánh giá

- ✅ **Chức năng**: Có đáp ứng tất cả yêu cầu không?
- ✅ **Bảo mật**: Có triển khai thực hành tốt nhất không?
- ✅ **Khả năng mở rộng**: Có thể xử lý tải không?
- ✅ **Khả năng duy trì**: Mã và cơ sở hạ tầng có được tổ chức tốt không?
- ✅ **Chi phí**: Có nằm trong ngân sách không?

## Tài nguyên bổ sung

### Tài liệu Microsoft
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Tài liệu Azure OpenAI Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Tài liệu Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Mẫu tham khảo
- [Ứng dụng Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Quickstart Ứng dụng Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Tài nguyên cộng đồng
- [Discord Azure AI Foundry](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Chứng chỉ hoàn thành

Chúc mừng! Bạn đã hoàn thành buổi thực hành AI Workshop Lab. Giờ đây bạn có thể:

- ✅ Chuyển đổi các ứng dụng AI hiện có thành mẫu AZD
- ✅ Triển khai ứng dụng AI sẵn sàng cho môi trường sản xuất
- ✅ Áp dụng các thực hành tốt nhất về bảo mật cho khối lượng công việc AI
- ✅ Giám sát và tối ưu hóa hiệu suất ứng dụng AI
- ✅ Khắc phục các vấn đề triển khai phổ biến

### Bước tiếp theo
1. Áp dụng các mẫu này vào dự án AI của riêng bạn
2. Đóng góp các mẫu trở lại cộng đồng
3. Tham gia Discord Azure AI Foundry để nhận hỗ trợ liên tục
4. Khám phá các chủ đề nâng cao như triển khai đa vùng

---

**Phản hồi về Workshop**: Giúp chúng tôi cải thiện buổi workshop này bằng cách chia sẻ trải nghiệm của bạn trong [kênh Discord Azure AI Foundry #Azure](https://discord.gg/microsoft-azure).

---

**Điều hướng chương:**
- **📚 Trang chủ khóa học**: [AZD Dành Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển ưu tiên AI
- **⬅️ Trước**: [Triển khai mô hình AI](ai-model-deployment.md)
- **➡️ Tiếp theo**: [Thực hành tốt nhất cho AI trong môi trường sản xuất](production-ai-practices.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../getting-started/configuration.md)

**Cần hỗ trợ?** Tham gia cộng đồng của chúng tôi để nhận hỗ trợ và thảo luận về AZD và triển khai AI.

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp từ con người. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.