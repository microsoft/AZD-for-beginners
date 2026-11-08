# Phòng Thí Nghiệm AI: Biến Giải Pháp AI Của Bạn Thành AZD-Deployable

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 2 - Phát Triển AI-Đầu Tiên
- **⬅️ Trước**: [Triển Khai Mô Hình AI](ai-model-deployment.md)
- **➡️ Tiếp**: [Thực Tiễn Tốt Nhất AI Trong Sản Xuất](../chapter-08-production/production-ai-practices.md)
- **🚀 Chương Tiếp Theo**: [Chương 3: Cấu Hình](../chapter-03-configuration/configuration.md)

## Tổng Quan Phòng Thí Nghiệm

Phòng thí nghiệm thực hành này hướng dẫn các nhà phát triển qua quy trình lấy một mẫu AI hiện có và triển khai nó bằng Azure Developer CLI (AZD). Bạn sẽ học các mẫu thiết yếu để triển khai AI trong môi trường sản xuất sử dụng các dịch vụ Microsoft Foundry.

> **Đánh giá phát hành (2026-11-04):** Hướng dẫn lệnh AZD và tên cấu hình mẫu đã được kiểm tra đối chiếu với phát hành `azd` `1.37.2` và cấu hình hiện tại của mẫu liên kết. Đây là một đánh giá tài liệu, không phải xác thực triển khai trực tiếp. Phòng thí nghiệm RAG không yêu cầu phần mở rộng agent; đối với đánh giá agent, hãy sử dụng phần mở rộng `azure.ai.evaluations` riêng biệt và [quy trình đánh giá hiện tại](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), không sử dụng các lệnh đánh giá agent cũ.

**Thời lượng:** 2-3 giờ  
**Mức độ:** Trung cấp  
**Yêu cầu trước:** Kiến thức cơ bản về Azure, quen thuộc với các khái niệm AI/ML

## 🎓 Mục Tiêu Học Tập

Đến cuối khóa học này, bạn sẽ có thể:
- ✅ Khám phá mẫu AI AZD hiện có và lên kế hoạch chuyển đổi ứng dụng của riêng bạn
- ✅ Cấu hình các dịch vụ Microsoft Foundry với AZD
- ✅ Thực hiện quản lý thông tin đăng nhập an toàn cho các dịch vụ AI
- ✅ Triển khai một ứng dụng tham khảo AI cùng với giám sát
- ✅ Xử lý sự cố các vấn đề triển khai AI thông thường

## Yêu Cầu Trước

### Công Cụ Bắt Buộc
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) đã cài đặt
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) đã cài đặt
- [Git](https://git-scm.com/) đã cài đặt
- Trình soạn thảo mã (khuyến nghị VS Code)

Các khối lệnh này sử dụng cú pháp Bash (bao gồm cả tiếp nối dòng và `grep`). Trên Windows, sử dụng Git Bash/WSL hoặc chuyển đổi chúng sang PowerShell. Cũng cài đặt các công cụ ngôn ngữ, trình quản lý gói và container được liệt kê trong [cài đặt môi trường cục bộ mẫu](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Tài nguyên Azure
- Có đăng ký Azure với quyền cấp phát tài nguyên và phân quyền vai trò (Contributor một mình không thể tạo phân quyền RBAC; sử dụng quản trị viên vai trò được ủy quyền hoặc tương đương đã được ghi trong tài liệu mẫu)
- Truy cập vào dịch vụ Microsoft Foundry Models (hoặc khả năng yêu cầu truy cập)
- Quyền tạo nhóm tài nguyên

### Kiến thức Tiền đề
- Hiểu biết cơ bản về các dịch vụ Azure
- Quen thuộc với giao diện dòng lệnh
- Khái niệm cơ bản về AI/ML (API, mô hình, lời nhắc)

## Thiết lập Phòng thí nghiệm

### Bước 1: Chuẩn bị Môi trường

1. **Xác minh cài đặt công cụ:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Nếu bạn làm việc trong nhiều thuê bao hoặc đăng ký của bạn không được phát hiện tự động, hãy thử lại với `azd auth login --tenant-id <tenant-id>`.

2. **Sao chép kho lưu trữ hội thảo:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Hiểu cấu trúc AZD cho Ứng dụng AI

### Cấu tạo của mẫu AZD AI

Khám phá các tệp chính trong mẫu AZD sẵn sàng AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Mẫu kiểm tra có thể thay đổi; `.azure/` xuất hiện sau khi khởi tạo môi trường, không nhất thiết là một bản sao tươi mới. Hãy xem xét bản sao thực tế thay vì tạo thư mục thiếu để phù hợp với sơ đồ này.

### **Bài tập phòng thí nghiệm 1.1: Khám phá Cấu hình**

1. **Xem xét tệp azure.yaml:**
```bash
cat azure.yaml
```

**Cần chú ý:**
- Định nghĩa dịch vụ cho các thành phần AI
- Ánh xạ biến môi trường
- Cấu hình máy chủ

2. **Xem lại hạ tầng main.bicep:**
```bash
cat infra/main.bicep
```

**Mẫu AI chính cần nhận diện:**
- Cấp phát dịch vụ Microsoft Foundry Models
- Tích hợp Azure AI Search
- Quản lý khóa bảo mật
- Cấu hình bảo mật mạng

### **Điểm thảo luận:** Tại sao các mẫu này quan trọng với AI

- **Sự phụ thuộc dịch vụ**: Ứng dụng AI thường yêu cầu nhiều dịch vụ phối hợp
- **Bảo mật**: Khóa API và điểm cuối cần được quản lý an toàn
- **Khả năng mở rộng**: Khối lượng công việc AI có yêu cầu mở rộng đặc thù
- **Quản lý chi phí**: Dịch vụ AI có thể đắt nếu không được cấu hình đúng

## Module 2: Triển khai Ứng dụng AI Đầu tiên của bạn

### Bước 2.1: Khởi tạo Môi trường

1. **Tạo môi trường AZD mới:**
```bash
azd env new myai-workshop
```

2. **Thiết lập các tham số cần thiết:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Bước 2.2: Triển khai Hạ tầng và Ứng dụng

1. **Triển khai với AZD:**
```bash
azd up
```

**Xảy ra trong `azd up`:**
- ✅ Cấp phát dịch vụ Microsoft Foundry Models
- ✅ Tạo dịch vụ Azure AI Search
- ✅ Thiết lập Azure Container Apps cho backend và frontend đóng gói (mẫu mặc định hiện tại)
- ✅ Cấu hình mạng và bảo mật
- ✅ Triển khai mã ứng dụng
- ✅ Thiết lập giám sát và ghi log

2. **Theo dõi tiến trình triển khai** và ghi chú các tài nguyên được tạo ra.

### Bước 2.3: Xác minh Triển khai của Bạn

1. **Kiểm tra tài nguyên đã triển khai:**
```bash
azd show
```

2. **Mở ứng dụng đã triển khai:**
```bash
azd show
```

Mở điểm cuối web được hiển thị trong đầu ra `azd show`.

3. **Kiểm tra chức năng AI:**
   - Điều hướng đến ứng dụng web
   - Thử các truy vấn mẫu
   - Xác nhận phản hồi AI hoạt động

### **Bài tập phòng thí nghiệm 2.1: Thực hành Khắc phục sự cố**

**Tình huống**: Triển khai của bạn thành công nhưng AI không phản hồi.

**Các vấn đề thường gặp cần kiểm tra:**
1. **Xác thực**: Xác minh managed identity và phân quyền vai trò; chỉ kiểm tra khóa API nếu bạn đã bật xác thực dựa trên khóa
2. **Mô hình khả dụng**: Kiểm tra vùng của bạn có hỗ trợ mô hình không
3. **Kết nối mạng**: Đảm bảo các dịch vụ có thể liên lạc
4. **Quyền RBAC**: Xác minh ứng dụng có thể truy cập OpenAI

**Lệnh gỡ lỗi:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Tùy chỉnh Ứng dụng AI cho Nhu cầu của Bạn

### Bước 3.1: Sửa đổi Cấu hình AI

1. **Cập nhật mô hình OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Thêm dịch vụ AI bổ sung:**

Chỉnh sửa `infra/main.bicep` để thêm Document Intelligence:

Đoạn sau là minh họa, không phải mẫu hoàn chỉnh. Mẫu có thể đã cấp phát dịch vụ xử lý tài liệu: kiểm tra hạ tầng hiện tại trước khi thêm tài nguyên trùng lặp. Bổ sung tùy chỉnh cần đấu nối đầu ra, định danh và cấu hình ứng dụng.

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

**Thực hành tốt nhất**: Cấu hình khác nhau cho phát triển và sản xuất.

1. **Tạo môi trường sản xuất:**
```bash
azd env new myai-production
```

2. **Thiết lập tham số riêng biệt cho sản xuất:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Những tên này xuất phát từ [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) của mẫu. `azd env set` lưu giá trị nhưng không làm biến tùy ý có hiệu lực: mẫu phải tiêu thụ nó. Xem lại [hướng dẫn cô lập mạng](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) của mẫu trước khi tắt truy cập công khai, và dùng `azd up` để áp dụng thay đổi hạ tầng. SKU OpenAI `S0` đơn lẻ không quyết định thông lượng mô hình; loại và dung lượng triển khai mô hình cũng quan trọng.

### **Bài tập phòng thí nghiệm 3.1: Tối ưu hóa Chi phí**

**Thách thức**: Cấu hình mẫu để phát triển tiết kiệm chi phí.

**Nhiệm vụ:**
1. Chọn môi trường workshop có thể xoá: `azd env select myai-workshop`.
2. Ghi lại SKU Search hiện tại và dung lượng mô hình từ `infra/main.parameters.json` và môi trường đã chọn.
3. Sử dụng các đầu vào được hỗ trợ bên dưới, sau khi xác nhận hạn ngạch mô hình/vùng:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Xác minh SKU Search và dung lượng triển khai trên portal và ước tính khác biệt với máy tính giá. Không mong dữ liệu thanh toán cập nhật ngay lập tức.

**Tiêu chí thành công:** Search dùng Basic, triển khai chat có dung lượng được yêu cầu và ứng dụng vẫn trả lời câu hỏi mẫu. Dung lượng `10` là phân bổ giới hạn tốc độ, không phải giảm giá token. Thay đổi tầng Search có thể bị giới hạn hoặc yêu cầu tạo lại; không thử nghiệm trên tài nguyên sản xuất. F0 là dịch vụ cụ thể và không phải SKU mô hình Azure OpenAI.

## Module 4: Bảo mật và Thực hành Tốt nhất cho Sản xuất

### Bước 4.1: Quản lý Thông tin Đăng nhập An toàn

**Thách thức hiện tại**: Nhiều ứng dụng AI mã hóa khóa API cứng hoặc dùng lưu trữ không an toàn.

**Giải pháp AZD**: Tích hợp Managed Identity + Key Vault.

1. **Xem lại cấu hình bảo mật trong mẫu của bạn:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Xác minh Managed Identity hoạt động:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Bước 4.2: Bảo mật Mạng

1. **Kích hoạt điểm cuối riêng tư** sử dụng cấu hình mạng được mẫu hỗ trợ (nếu chưa cấu hình).

Với mẫu của bạn, đoạn minh họa này cho thấy kết nối điểm cuối OpenAI. Nó cũng cần VNet, cấu hình DNS riêng tư và kết nối ứng dụng; không dán nó nguyên trạng vào mẫu, vì mẫu đã có module điểm cuối riêng tư:
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

### Bước 4.3: Giám sát và Quan sát

1. **Cấu hình Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Kích hoạt tích hợp Application Insights của mẫu:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Việc đo chỉ số của mẫu phát ra dữ liệu telemetry; một thiết lập `OPENAI_MONITOR_ENABLED` tùy ý không kích hoạt các chỉ số AI. Xem lại các chuỗi theo dõi cuộc gọi mô hình, độ trễ, lỗi và sử dụng token, tránh ghi lại lời nhắc hay phản hồi nhạy cảm.

### **Bài tập phòng thí nghiệm 4.1: Kiểm tra Bảo mật**

**Nhiệm vụ**: Xem lại triển khai của bạn theo thực hành bảo mật tốt nhất.

**Danh sách kiểm tra:**
- [ ] Không có bí mật mã hóa cứng trong mã hoặc cấu hình
- [ ] Sử dụng Managed Identity cho xác thực dịch vụ với dịch vụ
- [ ] Key Vault lưu trữ cấu hình nhạy cảm
- [ ] Truy cập mạng được giới hạn thích hợp
- [ ] Đã kích hoạt giám sát và ghi log

## Module 5: Chuyển đổi Ứng dụng AI của Bạn

### Bước 5.1: Bảng Đánh giá

**Trước khi chuyển đổi ứng dụng**, trả lời các câu hỏi sau:

1. **Kiến trúc Ứng dụng:**
   - Ứng dụng của bạn sử dụng dịch vụ AI nào?
   - Nó cần tài nguyên tính toán gì?
   - Nó có yêu cầu cơ sở dữ liệu không?
   - Các phụ thuộc giữa các dịch vụ là gì?

2. **Yêu cầu Bảo mật:**
   - Ứng dụng của bạn xử lý dữ liệu nhạy cảm nào?
   - Bạn có yêu cầu tuân thủ nào không?
   - Bạn có cần mạng riêng không?

3. **Yêu cầu Mở rộng:**
   - Tải dự kiến của bạn là gì?
   - Bạn có cần tự động mở rộng không?
   - Có yêu cầu vùng miền không?

### Bước 5.2: Tạo Mẫu AZD của Bạn

**Theo mẫu này để chuyển đổi ứng dụng của bạn:**

**Chỉ tạo bộ khung:** Mục này không cung cấp mã nguồn API/ứng dụng web, hạ tầng máy chủ, triển khai mô hình, danh tính/RBAC, hoặc một `main.parameters.json` hoàn chỉnh. Bicep có phạm vi nhóm tài nguyên minh họa thành phần module; một điểm vào thường có phạm vi thuê bao AZD phải tạo nhóm tài nguyên và gọi nó trong phạm vi đó. Đừng mong `azd up` triển khai một ứng dụng hoàn chỉnh chỉ sau khi sao chép các đoạn này. Để có nền tảng chạy được, tiếp tục dùng mẫu RAG từ Module 1.

1. **Tạo cấu trúc cơ bản:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Bài tập phòng thí nghiệm 5.1: Thử thách Tạo Mẫu**

**Thách thức**: Tạo mẫu AZD cho ứng dụng AI xử lý tài liệu.

**Yêu cầu:**
- Microsoft Foundry Models cho phân tích nội dung
- Document Intelligence cho OCR
- Tài khoản lưu trữ cho tải tài liệu lên
- Ứng dụng Function cho logic xử lý
- Ứng dụng web cho giao diện người dùng

**Điểm thưởng:**
- Thêm xử lý lỗi đúng cách
- Bao gồm ước lượng chi phí
- Thiết lập bảng điều khiển giám sát

## Module 6: Khắc phục sự cố Thông thường

### Các Vấn đề Triển khai Thông thường

#### Vấn đề 1: Quá hạn ngạch Dịch vụ OpenAI
**Triệu chứng:** Triển khai thất bại với lỗi hạn ngạch
**Giải pháp:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Vấn đề 2: Mô hình không có sẵn tại khu vực
**Triệu chứng:** Phản hồi AI thất bại hoặc lỗi triển khai mô hình
**Giải pháp:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Vấn đề 3: Vấn đề phân quyền
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

### Vấn đề Hiệu suất

#### Vấn đề 4: Phản hồi AI chậm
**Các bước điều tra:**
1. Kiểm tra Application Insights cho chỉ số hiệu suất
2. Xem lại chỉ số dịch vụ OpenAI trong portal Azure
3. Xác minh kết nối mạng và độ trễ

**Giải pháp:**
- Triển khai bộ nhớ đệm cho các truy vấn phổ biến
- Sử dụng mô hình OpenAI phù hợp với trường hợp sử dụng của bạn
- Mở rộng số bản sao ứng dụng sau khi kiểm tra giới hạn RPM/TPM của mô hình; triển khai Azure OpenAI không bật cài đặt "bản sao đọc" theo kiểu CSDL chung

### **Bài tập phòng thí nghiệm 6.1: Thử thách Gỡ lỗi**

**Tình huống**: Triển khai của bạn thành công, nhưng ứng dụng trả về lỗi 500.

**Nhiệm vụ gỡ lỗi:**
1. Kiểm tra nhật ký ứng dụng
2. Xác minh kết nối dịch vụ
3. Kiểm tra xác thực
4. Xem lại cấu hình

**Công cụ sử dụng:**
- `azd show` để tổng quan triển khai
- Cổng thông tin Azure cho nhật ký dịch vụ chi tiết
- Application Insights cho đo lường ứng dụng

## Module 7: Giám sát và Tối ưu hóa

### Bước 7.1: Thiết lập giám sát toàn diện

1. **Tạo bảng điều khiển tùy chỉnh:**

Điều hướng tới cổng thông tin Azure và tạo bảng điều khiển với:
- Số lượng và độ trễ yêu cầu OpenAI
- Tỷ lệ lỗi ứng dụng
- Sử dụng tài nguyên
- Theo dõi chi phí

2. **Thiết lập cảnh báo:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Xác minh thành phần phát ra đo lường yêu cầu và thêm nhóm hành động nếu cần thông báo. Chỉ số là số lượng, không phải tỷ lệ lỗi; cảnh báo tỷ lệ cần truy vấn và mẫu số phù hợp.

### Bước 7.2: Tối ưu hóa chi phí

1. **Phân tích chi phí hiện tại:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Thay thế các giá trị ngày. Hỗ trợ API tiêu thụ thay đổi theo thỏa thuận thanh toán; sử dụng Quản lý Chi phí trong cổng nếu không có chi tiết sử dụng. Chi phí được cập nhật trễ, không phải bài kiểm tra thời gian thực.

2. **Thực hiện kiểm soát chi phí:**
- Thiết lập cảnh báo ngân sách
- Sử dụng chính sách tự động mở rộng
- Thực hiện bộ nhớ đệm yêu cầu
- Giám sát sử dụng token cho OpenAI

### **Bài thực hành 7.1: Tối ưu hóa hiệu suất**

**Nhiệm vụ**: Tối ưu hóa ứng dụng AI của bạn về cả hiệu suất và chi phí.

**Chỉ số cần cải thiện:**
- Giảm thời gian phản hồi trung bình 20%
- Giảm chi phí hàng tháng 15%
- Định nghĩa SLO khả dụng 99,9% và cửa sổ đo lường (bài lab ngắn không thể chứng minh thời gian hoạt động hàng tháng)

**Chiến lược thử nghiệm:**
- Thực hiện bộ nhớ đệm phản hồi
- Tối ưu hóa prompt để tiết kiệm token
- Sử dụng SKU điện toán phù hợp
- Thiết lập tự động mở rộng đúng cách

## Thử thách cuối cùng: Triển khai toàn diện

### Kịch bản thử thách

Đây là **thử thách thiết kế/kiến trúc tùy chọn**, không phải bài thực hành chạy được hoặc chứng nhận sản xuất. Đề xuất một chatbot dịch vụ khách hàng được hỗ trợ AI và ghi lại những yêu cầu cần triển khai thêm và bằng chứng:

**Yêu cầu chức năng:**
- Giao diện web cho tương tác khách hàng
- Tích hợp với Microsoft Foundry Models để phản hồi
- Khả năng tìm kiếm tài liệu bằng Azure AI Search
- Tích hợp với cơ sở dữ liệu khách hàng hiện có
- Hỗ trợ đa ngôn ngữ

**Yêu cầu phi chức năng:**
- Xử lý 1000 người dùng đồng thời
- SLA thời gian hoạt động 99,9%
- Tuân thủ SOC 2
- Chi phí dưới $500/tháng
- Triển khai trên nhiều môi trường (dev, staging, prod)

Đây là ràng buộc giả định của các bên liên quan, không chắc tạo ra kết quả đồng thời. Định nghĩa tỷ lệ yêu cầu, kích thước prompt/output, và thời gian phiên trước khi ước tính chi phí; 1.000 người dùng đồng thời không xác lập khối lượng công việc hay chứng minh ngân sách $500 khả thi. SOC 2 là kết quả đánh giá tổ chức, không phải bật tắt nhờ mẫu AZD. Xác định các đánh đổi và từ chối ràng buộc không thực tế có bằng chứng.

### Các bước triển khai

1. **Thiết kế kiến trúc**
2. **Tạo mẫu AZD**
3. **Thực hiện các giải pháp bảo mật**
4. **Thiết lập giám sát và cảnh báo**
5. **Tạo pipeline triển khai**
6. **Ghi lại giải pháp**

### Tiêu chí đánh giá

- ✅ **Chức năng**: Đã trình bày các khả năng thực hiện và các khoảng trống còn tồn tại rõ ràng?
- ✅ **Bảo mật**: Thực hiện các thực hành tốt nhất?
- ✅ **Khả năng mở rộng**: Có thể chịu tải không?
- ✅ **Dễ bảo trì**: Mã và hạ tầng được tổ chức tốt?
- ✅ **Chi phí**: Có nằm trong ngân sách không?

## Tài nguyên bổ sung

### Tài liệu Microsoft
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Tài liệu Dịch vụ Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Tài liệu Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Mẫu ví dụ
- [Ứng dụng Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Khởi động nhanh Ứng dụng Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Tài nguyên cộng đồng
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Điểm hoàn thành

Chúc mừng! Bạn đã hoàn thành Lab Hội thảo AI. Giờ bạn có thể:

- ✅ Giải thích cách điều chỉnh ứng dụng AI hiện có với mẫu AZD
- ✅ Triển khai và kiểm tra ứng dụng tham khảo AI
- ✅ Thực hiện các thực hành bảo mật tốt nhất cho khối lượng công việc AI
- ✅ Giám sát và tối ưu hóa hiệu suất ứng dụng AI
- ✅ Khắc phục sự cố triển khai phổ biến

**Dọn dẹp:** Chạy `azd env list`, chọn mỗi môi trường có thể xóa được tạo trong lab này (`myai-workshop`, và nếu đã triển khai `myai-production`/`myai-quota-test`), rồi chạy `azd down` trong từng môi trường. Xem lại kế hoạch xóa; việc chỉ xóa cấu hình local của môi trường không xóa tài nguyên Azure. Tránh `--purge` trừ khi bạn hiểu việc xóa tài nguyên đã bị soft-delete là không thể khôi phục.

### Các bước tiếp theo
1. Áp dụng các mẫu này cho dự án AI của bạn
2. Đóng góp mẫu lại cho cộng đồng
3. Tham gia Microsoft Foundry Discord để nhận hỗ trợ liên tục
4. Khám phá các chủ đề nâng cao như triển khai đa vùng

---

**Phản hồi Hội thảo**: Giúp chúng tôi cải thiện workshop này bằng cách chia sẻ trải nghiệm của bạn tại [kênh Discord Microsoft Foundry #Azure](https://discord.gg/microsoft-azure).

---

**Điều hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện Tại**: Chương 2 - Phát triển AI-First
- **⬅️ Trước**: [Triển khai Mô hình AI](ai-model-deployment.md)
- **➡️ Tiếp**: [Thực hành Tốt nhất AI Sản xuất](../chapter-08-production/production-ai-practices.md)
- **🚀 Chương Tiếp Theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

**Cần giúp đỡ?** Tham gia cộng đồng chúng tôi để nhận hỗ trợ và thảo luận về AZD và triển khai AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->