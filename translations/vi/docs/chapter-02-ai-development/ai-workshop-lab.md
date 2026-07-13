# Phòng Thí Nghiệm Workshop AI: Làm Cho Giải Pháp AI của Bạn Có Thể Triển Khai AZD

**Điều Hướng Chương:**
- **📚 Trang Khóa Học**: [AZD Dành Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 2 - Phát Triển AI Đầu Tiên
- **⬅️ Trước Đó**: [Triển Khai Mô Hình AI](ai-model-deployment.md)
- **➡️ Tiếp Theo**: [Thực Hành Tốt Nhất AI Trong Sản Xuất](production-ai-practices.md)
- **🚀 Chương Tiếp Theo**: [Chương 3: Cấu Hình](../chapter-03-configuration/configuration.md)

## Tổng Quan Workshop

Phòng thí nghiệm thực hành này hướng dẫn các nhà phát triển qua quy trình lấy một mẫu AI hiện có và triển khai nó bằng Azure Developer CLI (AZD). Bạn sẽ học các mẫu thiết yếu cho triển khai AI trong sản xuất sử dụng dịch vụ Microsoft Foundry.

> **Ghi chú xác thực (2026-07-13):** Workshop này đã được kiểm tra với `azd` phiên bản `1.27.1`. Nếu cài đặt cục bộ của bạn cũ hơn, hãy cập nhật AZD trước khi bắt đầu để quy trình xác thực, mẫu, và triển khai khớp với các bước dưới đây.

**Thời lượng:** 2-3 giờ  
**Cấp độ:** Trung cấp  
**Yêu cầu trước:** Kiến thức cơ bản về Azure, quen thuộc với các khái niệm AI/ML

## 🎓 Mục Tiêu Học Tập

Đến cuối workshop này, bạn sẽ có thể:
- ✅ Chuyển đổi ứng dụng AI hiện có sử dụng các mẫu AZD
- ✅ Cấu hình dịch vụ Microsoft Foundry với AZD
- ✅ Triển khai quản lý thông tin xác thực an toàn cho dịch vụ AI
- ✅ Triển khai ứng dụng AI sẵn sàng cho sản xuất với giám sát
- ✅ Khắc phục sự cố thường gặp khi triển khai AI

## Yêu Cầu Trước

### Công Cụ Cần Thiết
- Đã cài đặt [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Đã cài đặt [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Đã cài đặt [Git](https://git-scm.com/)
- Trình soạn thảo mã (khuyến nghị VS Code)

### Tài Nguyên Azure
- Đăng ký Azure với quyền đóng góp
- Quyền truy cập dịch vụ Microsoft Foundry Models (hoặc khả năng yêu cầu truy cập)
- Quyền tạo nhóm tài nguyên

### Kiến Thức Yêu Cầu
- Hiểu biết cơ bản về dịch vụ Azure
- Quen thuộc với giao diện dòng lệnh
- Kiến thức cơ bản về AI/ML (API, mô hình, câu lệnh)

## Thiết Lập Phòng Thí Nghiệm

### Bước 1: Chuẩn Bị Môi Trường

1. **Xác minh cài đặt công cụ:**
```bash
# Kiểm tra cài đặt AZD
azd version

# Kiểm tra Azure CLI
az --version

# Đăng nhập vào Azure cho các quy trình làm việc AZD
azd auth login

# Đăng nhập vào Azure CLI chỉ nếu bạn dự định chạy các lệnh az trong quá trình chẩn đoán
az login
```

Nếu bạn làm việc với nhiều tenant hoặc đăng ký của bạn không được tự động phát hiện, hãy thử lại với `azd auth login --tenant-id <tenant-id>`.

2. **Sao chép kho lưu trữ workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Mô-đun 1: Hiểu Cấu Trúc AZD Cho Ứng Dụng AI

### Cấu Trúc Mẫu AZD Cho AI

Khám phá các tập tin chính trong một mẫu AZD sẵn sàng AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Bài Tập Thí Nghiệm 1.1: Khám Phá Cấu Hình**

1. **Xem xét tập tin azure.yaml:**
```bash
cat azure.yaml
```

**Điều cần chú ý:**
- Định nghĩa dịch vụ cho các thành phần AI
- Ánh xạ biến môi trường
- Cấu hình host

2. **Xem lại hạ tầng main.bicep chính:**
```bash
cat infra/main.bicep
```

**Các mẫu AI chính để nhận diện:**
- Cung cấp dịch vụ Microsoft Foundry Models
- Tích hợp Azure AI Search
- Quản lý khóa bảo mật
- Cấu hình bảo mật mạng

### **Điểm Thảo Luận:** Tại Sao Những Mẫu Này Quan Trọng Với AI

- **Phụ Thuộc Dịch Vụ**: Ứng dụng AI thường yêu cầu nhiều dịch vụ phối hợp
- **Bảo Mật**: Khóa API và điểm cuối cần quản lý an toàn
- **Khả Năng Mở Rộng**: Khối lượng công việc AI có yêu cầu mở rộng riêng biệt
- **Quản Lý Chi Phí**: Dịch vụ AI có thể tốn kém nếu không được cấu hình đúng

## Mô-đun 2: Triển Khai Ứng Dụng AI Đầu Tiên Của Bạn

### Bước 2.1: Khởi Tạo Môi Trường

1. **Tạo môi trường AZD mới:**
```bash
azd env new myai-workshop
```

2. **Đặt các tham số cần thiết:**
```bash
# Đặt khu vực Azure bạn ưu tiên
azd env set AZURE_LOCATION eastus

# Tùy chọn: Đặt mô hình OpenAI cụ thể
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Bước 2.2: Triển Khai Hạ Tầng và Ứng Dụng

1. **Triển khai với AZD:**
```bash
azd up
```

**Các hoạt động xảy ra trong `azd up`:**
- ✅ Cung cấp dịch vụ Microsoft Foundry Models
- ✅ Tạo dịch vụ Azure AI Search
- ✅ Thiết lập App Service cho ứng dụng web
- ✅ Cấu hình mạng và bảo mật
- ✅ Triển khai mã ứng dụng
- ✅ Thiết lập giám sát và ghi nhật ký

2. **Theo dõi tiến trình triển khai** và ghi chú các tài nguyên đang được tạo.

### Bước 2.3: Xác Minh Triển Khai

1. **Kiểm tra các tài nguyên đã triển khai:**
```bash
azd show
```

2. **Mở ứng dụng đã triển khai:**
```bash
azd show
```

Mở điểm cuối web được hiển thị trong kết quả `azd show`.

3. **Kiểm tra chức năng AI:**
   - Truy cập ứng dụng web
   - Thử các truy vấn mẫu
   - Xác nhận câu trả lời AI hoạt động

### **Bài Tập Thí Nghiệm 2.1: Thực Hành Khắc Phục Sự Cố**

**Tình huống**: Triển khai thành công nhưng AI không phản hồi.

**Vấn đề phổ biến cần kiểm tra:**
1. **Khóa API OpenAI**: Kiểm tra đã được thiết lập chính xác chưa
2. **Mô hình khả dụng**: Kiểm tra khu vực của bạn có hỗ trợ mô hình không
3. **Kết nối mạng**: Đảm bảo các dịch vụ có thể liên lạc được với nhau
4. **Quyền RBAC**: Xác nhận ứng dụng có quyền truy cập OpenAI

**Lệnh gỡ lỗi:**
```bash
# Kiểm tra biến môi trường
azd env get-values

# Xem nhật ký triển khai
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kiểm tra trạng thái triển khai OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Mô-đun 3: Tùy Chỉnh Ứng Dụng AI Cho Nhu Cầu Của Bạn

### Bước 3.1: Sửa Đổi Cấu Hình AI

1. **Cập nhật mô hình OpenAI:**
```bash
# Thay đổi sang mô hình khác (nếu có trong khu vực của bạn)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Triển khai lại với cấu hình mới
azd deploy
```

2. **Thêm dịch vụ AI bổ sung:**

Sửa `infra/main.bicep` để thêm Document Intelligence:

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

**Thực hành tốt nhất**: Cấu hình khác nhau cho phát triển so với sản xuất.

1. **Tạo môi trường sản xuất:**
```bash
azd env new myai-production
```

2. **Đặt tham số riêng cho sản xuất:**
```bash
# Sản xuất thường sử dụng SKU cao hơn
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Kích hoạt các tính năng bảo mật bổ sung
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Bài Tập Thí Nghiệm 3.1: Tối Ưu Chi Phí**

**Thử thách**: Cấu hình mẫu cho phát triển với chi phí hiệu quả.

**Nhiệm vụ:**
1. Xác định SKU nào có thể đặt ở cấp miễn phí/cơ bản
2. Cấu hình biến môi trường cho chi phí tối thiểu
3. Triển khai và so sánh chi phí với cấu hình sản xuất

**Gợi ý giải pháp:**
- Sử dụng tầng F0 (miễn phí) cho Dịch vụ Azure AI khi có thể
- Sử dụng tầng Cơ bản cho Dịch vụ Tìm kiếm trong phát triển
- Xem xét dùng kế hoạch Tiêu thụ cho Functions

## Mô-đun 4: Bảo Mật và Thực Hành Tốt Nhất Trong Sản Xuất

### Bước 4.1: Quản Lý Thông Tin Xác Thực An Toàn

**Thách thức hiện tại**: Nhiều ứng dụng AI mã hóa cứng khóa API hoặc lưu trữ không an toàn.

**Giải pháp AZD**: Kết hợp Managed Identity + Key Vault.

1. **Xem lại cấu hình bảo mật trong mẫu của bạn:**
```bash
# Tìm kiếm cấu hình Key Vault và Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Xác nhận Managed Identity hoạt động:**
```bash
# Kiểm tra xem ứng dụng web có cấu hình nhận dạng chính xác hay không
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Bước 4.2: Bảo Mật Mạng

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

### Bước 4.3: Giám Sát và Quan Sát

1. **Cấu hình Application Insights:**
```bash
# Application Insights nên được cấu hình tự động
# Kiểm tra cấu hình:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Thiết lập giám sát riêng cho AI:**

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

### **Bài Tập Thí Nghiệm 4.1: Kiểm Tra Bảo Mật**

**Nhiệm vụ**: Xem xét triển khai của bạn theo thực hành bảo mật tốt nhất.

**Danh sách kiểm tra:**
- [ ] Không có bí mật mã hóa cứng trong mã hoặc cấu hình
- [ ] Sử dụng Managed Identity cho xác thực dịch vụ với dịch vụ
- [ ] Key Vault lưu trữ cấu hình nhạy cảm
- [ ] Truy cập mạng được hạn chế đúng cách
- [ ] Giám sát và ghi nhật ký được bật

## Mô-đun 5: Chuyển Đổi Ứng Dụng AI Của Bạn

### Bước 5.1: Bảng Đánh Giá

**Trước khi chuyển đổi ứng dụng của bạn**, hãy trả lời các câu hỏi sau:

1. **Kiến trúc ứng dụng:**
   - Ứng dụng của bạn sử dụng dịch vụ AI nào?
   - Nhu cầu tài nguyên tính toán là gì?
   - Có cần cơ sở dữ liệu không?
   - Các phụ thuộc giữa các dịch vụ là gì?

2. **Yêu cầu bảo mật:**
   - Ứng dụng xử lý dữ liệu nhạy cảm nào?
   - Có yêu cầu tuân thủ nào không?
   - Cần mạng riêng tư không?

3. **Yêu cầu mở rộng:**
   - Lượng tải dự kiến là bao nhiêu?
   - Cần tự động mở rộng không?
   - Có yêu cầu vùng miền không?

### Bước 5.2: Tạo Mẫu AZD Của Bạn

**Theo mẫu này để chuyển đổi ứng dụng của bạn:**

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

3. **Tạo các mẫu hạ tầng:**

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

**infra/modules/openai.bicep** - Mô-đun OpenAI:
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

### **Bài Tập Thí Nghiệm 5.1: Thử Thách Tạo Mẫu**

**Thử thách**: Tạo mẫu AZD cho ứng dụng AI xử lý tài liệu.

**Yêu cầu:**
- Microsoft Foundry Models dùng để phân tích nội dung
- Document Intelligence cho OCR
- Tài khoản lưu trữ cho tải lên tài liệu
- Ứng dụng Function cho logic xử lý
- Ứng dụng web cho giao diện người dùng

**Điểm thưởng:**
- Thêm xử lý lỗi hợp lý
- Bao gồm ước lượng chi phí
- Thiết lập bảng điều khiển giám sát

## Mô-đun 6: Khắc Phục Sự Cố Thường Gặp

### Các Vấn Đề Triển Khai Phổ Biến

#### Vấn đề 1: Vượt Quota Dịch Vụ OpenAI
**Triệu chứng:** Triển khai thất bại do lỗi quota
**Giải pháp:**
```bash
# Kiểm tra hạn mức hiện tại
az cognitiveservices usage list --location eastus

# Yêu cầu tăng hạn mức hoặc thử khu vực khác
azd env set AZURE_LOCATION westus2
azd up
```

#### Vấn đề 2: Mô Hình Không Có Sẵn Ở Vùng
**Triệu chứng:** Câu trả lời AI lỗi hoặc lỗi triển khai mô hình
**Giải pháp:**
```bash
# Kiểm tra tính khả dụng của mô hình theo vùng
az cognitiveservices model list --location eastus

# Cập nhật sang mô hình khả dụng
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Vấn đề 3: Vấn Đề Quyền Truy Cập
**Triệu chứng:** Lỗi 403 Forbidden khi gọi dịch vụ AI
**Giải pháp:**
```bash
# Kiểm tra các phân công vai trò
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Thêm các vai trò còn thiếu
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Vấn Đề Hiệu Suất

#### Vấn đề 4: Phản Hồi AI Chậm
**Các bước điều tra:**
1. Kiểm tra Application Insights cho chỉ số hiệu suất
2. Xem lại chỉ số dịch vụ OpenAI trong cổng Azure
3. Xác nhận kết nối mạng và độ trễ

**Giải pháp:**
- Triển khai bộ nhớ đệm cho các truy vấn phổ biến
- Sử dụng mô hình OpenAI phù hợp với trường hợp của bạn
- Xem xét bản sao đọc cho kịch bản tải cao

### **Bài Tập Thí Nghiệm 6.1: Thử Thách Gỡ Lỗi**

**Tình huống**: Triển khai thành công, nhưng ứng dụng trả về lỗi 500.

**Nhiệm vụ gỡ lỗi:**
1. Kiểm tra nhật ký ứng dụng
2. Xác nhận kết nối dịch vụ
3. Kiểm thử xác thực
4. Xem lại cấu hình

**Công cụ sử dụng:**
- `azd show` cho tổng quan triển khai
- Cổng Azure cho nhật ký dịch vụ chi tiết
- Application Insights cho số liệu ứng dụng

## Mô-đun 7: Giám Sát và Tối Ưu Hóa

### Bước 7.1: Thiết Lập Giám Sát Toàn Diện

1. **Tạo bảng điều khiển tùy chỉnh:**

Truy cập cổng Azure và tạo bảng điều khiển với:
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

2. **Triển khai kiểm soát chi phí:**
- Thiết lập cảnh báo ngân sách
- Sử dụng chính sách tự động mở rộng
- Triển khai bộ nhớ đệm yêu cầu
- Giám sát sử dụng token cho OpenAI

### **Bài Tập Thí Nghiệm 7.1: Tối Ưu Hiệu Suất**

**Nhiệm vụ**: Tối ưu ứng dụng AI của bạn cả về hiệu suất và chi phí.

**Chỉ số cần cải thiện:**
- Giảm thời gian phản hồi trung bình 20%
- Giảm chi phí hàng tháng 15%
- Duy trì thời gian hoạt động 99.9%

**Chiến lược thử nghiệm:**
- Triển khai bộ nhớ đệm phản hồi
- Tối ưu câu lệnh cho hiệu quả token
- Sử dụng các SKU tính toán phù hợp
- Thiết lập tự động mở rộng hợp lý

## Thử Thách Cuối: Triển Khai Toàn Diện

### Kịch Bản Thử Thách

Bạn được giao nhiệm vụ tạo chatbot dịch vụ khách hàng AI sẵn sàng cho sản xuất với các yêu cầu sau:

**Yêu cầu chức năng:**
- Giao diện web cho tương tác khách hàng
- Tích hợp Microsoft Foundry Models để phản hồi
- Tính năng tìm kiếm tài liệu qua Azure AI Search
- Tích hợp với cơ sở dữ liệu khách hàng hiện có
- Hỗ trợ đa ngôn ngữ

**Yêu cầu phi chức năng:**
- Xử lý 1000 người dùng đồng thời
- SLA thời gian hoạt động 99.9%
- Tuân thủ SOC 2
- Chi phí dưới 500 đô la/tháng
- Triển khai trên nhiều môi trường (phát triển, thử nghiệm, sản xuất)

### Các Bước Triển Khai

1. **Thiết kế kiến trúc**
2. **Tạo mẫu AZD**
3. **Thực hiện các biện pháp bảo mật**
4. **Thiết lập giám sát và cảnh báo**
5. **Tạo các pipeline triển khai**
6. **Tài liệu hóa giải pháp**

### Tiêu Chí Đánh Giá

- ✅ **Chức năng**: Có đáp ứng tất cả yêu cầu không?
- ✅ **Bảo mật**: Thực hiện tốt hơn các thực hành bảo mật chưa?
- ✅ **Khả năng mở rộng**: Có thể xử lý tải không?
- ✅ **Dễ bảo trì**: Mã và hạ tầng có được tổ chức tốt không?
- ✅ **Chi phí**: Có nằm trong ngân sách không?

## Tài Nguyên Tham Khảo Bổ Sung

### Tài Liệu Microsoft
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Tài liệu Dịch vụ Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Tài liệu Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Mẫu Ví Dụ
- [Ứng Dụng Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Khởi Đầu Ứng Dụng Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Tài nguyên cộng đồng
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Chứng chỉ hoàn thành

Chúc mừng! Bạn đã hoàn thành phòng thí nghiệm AI Workshop. Bây giờ bạn nên có thể:

- ✅ Chuyển đổi các ứng dụng AI hiện có thành các mẫu AZD
- ✅ Triển khai các ứng dụng AI sẵn sàng cho môi trường sản xuất
- ✅ Thực hiện các thực tiễn bảo mật tốt nhất cho khối lượng công việc AI
- ✅ Giám sát và tối ưu hiệu suất ứng dụng AI
- ✅ Xử lý sự cố các vấn đề triển khai phổ biến

### Các bước tiếp theo
1. Áp dụng các mẫu này vào dự án AI của riêng bạn
2. Đóng góp lại các mẫu cho cộng đồng
3. Tham gia Microsoft Foundry Discord để được hỗ trợ liên tục
4. Khám phá các chủ đề nâng cao như triển khai đa vùng

---

**Phản hồi hội thảo**: Giúp chúng tôi cải thiện hội thảo này bằng cách chia sẻ trải nghiệm của bạn trong [kênh #Azure của Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển AI ưu tiên
- **⬅️ Trước**: [Triển khai mô hình AI](ai-model-deployment.md)
- **➡️ Tiếp theo**: [Thực tiễn tốt nhất AI trong sản xuất](production-ai-practices.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

**Cần giúp đỡ?** Tham gia cộng đồng của chúng tôi để được hỗ trợ và thảo luận về AZD và triển khai AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->