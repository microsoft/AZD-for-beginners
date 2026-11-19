# Tích hợp Microsoft Foundry với AZD

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD Dành cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển AI-First
- **⬅️ Chương trước**: [Chương 1: Dự án đầu tiên của bạn](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp theo**: [AI Agents](agents.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

## Tổng quan

Hướng dẫn này trình bày cách tích hợp các dịch vụ Microsoft Foundry với Azure Developer CLI (AZD) để đơn giản hóa triển khai ứng dụng AI. Microsoft Foundry cung cấp một nền tảng toàn diện để xây dựng, triển khai, và quản lý ứng dụng AI, trong khi AZD đơn giản hoá quá trình hạ tầng và triển khai.

## Microsoft Foundry là gì?

Microsoft Foundry là nền tảng hợp nhất của Microsoft cho phát triển AI bao gồm:

- **Danh mục mô hình**: Truy cập các mô hình AI tiên tiến nhất
- **Dòng công việc Prompt**: Trình thiết kế trực quan cho luồng AI
- **Cổng Microsoft Foundry**: Môi trường phát triển tích hợp cho ứng dụng AI
- **Tùy chọn triển khai**: Nhiều lựa chọn lưu trữ và mở rộng
- **An toàn và Bảo mật**: Tính năng AI có trách nhiệm tích hợp sẵn

## AZD + Microsoft Foundry: Tốt hơn khi kết hợp

| Tính năng | Microsoft Foundry | Lợi ích Tích hợp AZD |
|---------|-----------------|------------------------|
| **Triển khai mô hình** | Triển khai thủ công qua cổng | Triển khai tự động, có thể lặp lại |
| **Hạ tầng** | Cấu hình dự án và tài nguyên | Bắt đầu từ `azure.yaml`; xuất Bicep hoặc Terraform khi cần |
| **Quản lý môi trường** | Tập trung một môi trường duy nhất | Hỗ trợ đa môi trường (dev/staging/prod) |
| **Tích hợp CI/CD** | Dịch vụ triển khai và đánh giá | Tái sử dụng cấu hình trong GitHub Actions hoặc Azure DevOps |
| **Quản lý chi phí** | Giám sát cơ bản | Tối ưu chi phí theo môi trường cụ thể |

## Yêu cầu trước

- Đăng ký Azure với quyền phù hợp
- Azure Developer CLI 1.37.0 trở lên cho luồng làm việc Foundry GA
- Truy cập dịch vụ Microsoft Foundry Models
- Hiểu biết cơ bản về Microsoft Foundry

> **Cập nhật Foundry GA (2026-11-09):** Gói mở rộng `microsoft.foundry` đã đạt phiên bản 1.0 và khả dụng chung vào ngày [05 tháng 11 năm 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Các bước hướng dẫn dưới đây dựa theo thông báo đó và tài liệu Microsoft Learn quickstart liên kết. Đây là đánh giá tài liệu, không phải xác nhận triển khai trực tiếp. Các tính năng xem trước tùy chọn và các tiện ích mở rộng phát hành độc lập giữ trạng thái phát hành riêng.

**Kết quả học tập:** Cài đặt gói GA, xem xét `azure.yaml` của agent, so sánh phản hồi trên máy và trên môi trường triển khai, và giải thích đánh giá, CI/CD, và giới hạn dọn dẹp. Để triển khai agent theo từng bước, xem [hướng dẫn hosted-agent](#hosted-agent-walkthrough-ga). Các mảnh tài nguyên bên dưới bao gồm các mẫu tích hợp khác.

## Các mẫu tích hợp chính

**Phạm vi ví dụ:** Bicep dưới đây chứa các mảnh tài nguyên minh họa, không phải mẫu triển khai đầy đủ. Mẫu chứa phải xác định tên, `location`, tài nguyên tham chiếu, nhận dạng, kết quả đầu ra và lưu trữ ứng dụng. Sử dụng mẫu liên kết để có điểm bắt đầu chạy được. Ví dụ Bash yêu cầu xác thực Azure CLI riêng biệt với `azd auth login`.

### Mẫu 1: Tích hợp Microsoft Foundry Models

**Trường hợp sử dụng**: Triển khai ứng dụng chat với mô hình Azure OpenAI trong Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**Hạ tầng (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

Người gọi cần có managed identity đính kèm và `Cognitive Services OpenAI User` ở phạm vi tài khoản; vô hiệu hóa key không cấp quyền truy cập. Xác minh khu vực/mô hình/SKU khả dụng và hạn mức trước khi triển khai.

### Mẫu 2: Tích hợp AI Search + RAG

**Trường hợp sử dụng**: Triển khai ứng dụng sinh tạo tăng cường truy xuất (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

Không có tài nguyên ARM `Microsoft.Search/searchServices/dataConnections` cho tích hợp này. Cấu hình chỉ mục Search, nguồn dữ liệu, indexer/skillset hoặc vectorizer thông qua API mặt dữ liệu Search được hỗ trợ. Nếu Search gọi mô hình nhúng, kích hoạt managed identity của nó, cấp vai trò mô hình phù hợp, và cấu hình kỹ năng nhúng/vectorizer. Xem [tích hợp vector hóa](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Mẫu 3: Tích hợp Document Intelligence

**Trường hợp sử dụng**: Quy trình xử lý và phân tích tài liệu

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Mẫu cấu hình

### Thiết lập biến môi trường

Ngoại trừ các cài đặt AZD đã được tài liệu hoá như `AZURE_LOCATION`, đây là **tên đầu vào tùy chỉnh của mẫu**. Chúng không có tác dụng trừ khi mẫu/ứng dụng sử dụng qua các tham số và ánh xạ môi trường máy chủ. Với `azure-search-openai-demo`, hãy dùng tên thực tế như `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` và `AZURE_SEARCH_SERVICE_SKU` thay thế. Dung lượng mô hình không phải là SKU tài khoản.

**Cấu hình sản xuất:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Cấu hình phát triển:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Cấu hình bảo mật với Key Vault

Ưu tiên Entra ID với xác thực key cục bộ bị vô hiệu hoá. Dưới đây chỉ là **biện pháp thay thế xác thực key cũ** cho ứng dụng cần key: yêu cầu tài khoản bật xác thực key, nhận dạng ứng dụng gắn với host, và quyền truy cập/lưới mạng Key Vault hoạt động. Không kết hợp lấy key với `disableLocalAuth: true` và mong đợi gọi dựa trên key hoạt động.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Luồng triển khai

### Tiện ích AZD cho Foundry

Đối với luồng GA, cài đặt gói `microsoft.foundry` thay vì từng tiện ích mở rộng cơ bản riêng lẻ:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Gói cài đặt các agent, kết nối, inspector, dự án, routine, kỹ năng, và bộ công cụ. Nó không thêm nhóm lệnh `microsoft.foundry`. Đánh giá, bộ dữ liệu, fine-tuning, và mô hình tùy chỉnh được cài riêng khi cần. Xem [tham khảo đóng gói tiện ích mở rộng](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Hướng dẫn Hosted-Agent (GA)

Một **hosted agent** chạy code agent của bạn trên máy tính do Foundry quản lý. Bài tập này dùng mẫu API Python Agent Framework Responses cơ bản phía trên, không phải các đoạn SDK Agent Service truyền thống trong các bài học khác.

#### 1. Chuẩn bị và khởi tạo

Dùng thư mục rỗng ngoài thư mục khoá học này. Cài đặt Python 3.13 trở lên và [phiên bản uv hiện hành](https://docs.astral.sh/uv/getting-started/installation/). Cài đặt uv độc lập có thể dùng `uv self update`. Kiểm tra [quyền hosted-agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), khả dụng mô hình, và hạn mức trong đăng ký và khu vực trước khi cung cấp. Tài nguyên Azure và cuộc gọi mô hình cục bộ sẽ tính phí.

Hoàn thành cài đặt `azd auth login` và gói trên. Mã mẫu cục bộ dùng `DefaultAzureCredential`; nếu dùng chứng thực Azure CLI, đăng nhập `az login` với cùng tài khoản và tenant như AZD. Đăng nhập AZD riêng không phải đăng nhập Azure CLI.

Chạy lệnh một dòng này trong Bash hoặc PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Chọn dự án Foundry mới hoặc hiện có và đăng ký cùng khu vực dự định. Để tái sử dụng triển khai mô hình, thêm `--model-deployment <existing-deployment-name>` vào lệnh khởi tạo **trước khi chạy**, và chọn lại dự án hiện có. Giữ thư mục chứa `azure.yaml` tạo ra cho các lệnh tiếp theo.

#### 2. Xem lại định nghĩa triển khai

Mở `azure.yaml` và tìm các cài đặt này trong [mẫu phía trên](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Cài đặt | Kiểm tra gì |
|---------|---------------|
| `host: azure.ai.project` và `deployments` | Dự án Foundry dự kiến và tên mô hình, phiên bản, SKU triển khai, và dung lượng |
| `host: azure.ai.agent` và `project` | Hosted agent và thư mục chứa mã nguồn |
| `codeConfiguration` | Runtime Python và điểm đầu vào; mẫu xem xét dùng `python_3_13` và `main.py` |
| `uses` | Phụ thuộc dịch vụ dự án Foundry |
| `container.resources` | CPU và bộ nhớ phân bổ, dù code được xây dựng từ xa |
| `env` | Bản đồ triển khai mô hình và `PYTHONNOUSERSITE: "1"` để tắt tải package người dùng |
| `infra.provider` | `microsoft.foundry`, tổng hợp hạ tầng cần thiết |

Cam kết cùng lúc `azure.yaml` đã xem xét và mã agent. Không cần hạ tầng viết tay để bắt đầu; khi cần file cung cấp có thể chỉnh sửa, theo [xuất hạ tầng](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) cho Bicep hoặc Terraform và tiếp tục dùng `azd provision`. Không cam kết thông tin xác thực hoặc trạng thái môi trường `.azure/`.

#### 3. Cung cấp và thử nghiệm cục bộ

```bash
azd provision
azd ai agent run
```

Cung cấp có thể tạo các triển khai mô hình còn thiếu **dù trong dự án tái sử dụng**. Xem lại mô hình prompt và chọn loại triển khai online có sẵn như Global Standard hoặc Data Zone Standard; hạn mức và hỗ trợ khu vực thay đổi.

Chạy cục bộ chuẩn bị phụ thuộc và mở **Agent Inspector**, nơi bạn có thể kiểm tra yêu cầu, phản hồi, và hoạt động công cụ/mô hình. Giữ nó chạy rồi mở cửa sổ terminal thứ hai ở cùng thư mục dự án:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Điểm kiểm tra:** Xác nhận bạn nhận phản hồi phù hợp và có thể xem hoạt động liên quan cục bộ. Chạy tại chỗ vẫn gọi triển khai mô hình Azure của bạn; không phải thử offline hay miễn phí. Dùng prompt tổng hợp và tránh lộ bí mật hoặc dữ liệu nhạy cảm trong đầu ra inspector.

#### 4. Triển khai và so sánh

Dừng chạy cục bộ với Ctrl+C khi hoàn thành. Trước khi gọi từ xa, cấu hình hoặc kiểm tra [kết nối Application Insights và quyền đọc trace](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) của dự án.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

Ở chế độ triển khai mã, AZD tải lên nguồn để xây dựng Foundry từ xa; bạn không cần build container cục bộ cho đường đi này. Đầu ra triển khai cung cấp liên kết playground và đầu cuối. Xác minh phản hồi từ agent đã triển khai và truy vết đám mây; chỉ sự kiện inspector cục bộ không chứng minh truy vết đám mây hoạt động.

Cho các thay đổi sau, xem cấu hình hosted-agent được hỗ trợ với `azd deploy --preview`. Phát trực tiếp log bằng `azd ai agent monitor --follow`, hoặc chẩn đoán thiết lập và truy cập với `azd ai agent doctor`. Xem trước triển khai không phải đánh giá hạ tầng hay bảo mật hoàn chỉnh.

#### 5. Thêm kiểm tra chất lượng có thể lặp lại

Cài tiện ích đánh giá phát hành độc lập, sau đó tạo tài sản thử nghiệm bản thảo:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Mô tả hành vi dự định của agent và chọn **Dataset and evaluator**, rồi **Turn**. Xem lại và chỉnh sửa các trường hợp tạo ra và bảng điểm, bao gồm trường hợp câu hỏi không được hỗ trợ, trước khi cấu hình đánh giá:

```bash
azd ai eval init --name quality
```

Chọn bộ dữ liệu và bảng điểm đã xem, xác nhận triển khai mô hình thẩm định. Kiểm tra `evals/azure.eval.yaml` và tham chiếu dịch vụ đánh giá trong `azure.yaml`, rồi đăng ký tài sản và thực thi:

```bash
azd up
azd ai eval run start --eval quality
```

Kiểm tra điểm và các trường hợp thất bại hoặc lỗi; đánh giá hoàn thành không tự động là đạt chất lượng. Sinh tạo và chấm điểm còn phát sinh phí mô hình. Cam kết cấu hình không bí mật, bộ dữ liệu, và bảng điểm để đồng đội dễ so sánh thay đổi. `azd ai agent optimize` có thể tái sử dụng đánh giá tương thích làm chuẩn, nhưng xem xét các ứng viên trước khi triển khai rõ ràng. Xem [cổng chất lượng và di chuyển](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) cho dự án và CI cũ.

#### 6. Tái sử dụng luồng làm việc trong CI/CD

Sau `azd up` thành công, chạy `azd pipeline config` và xem luồng làm việc GitHub Actions hoặc Azure DevOps tạo ra. Cài `microsoft.foundry` trên runner, thêm `azure.ai.evaluations` nếu chạy đánh giá. Giữ lại thiết lập checkout, đăng nhập, và môi trường tạo ra; chỉ cài đặt không xác thực pipeline.

Dùng môi trường AZD riêng cho từng giai đoạn, cấp quyền tài nguyên và quyền Foundry cho nhận dạng pipeline, và giữ thông tin xác thực trong bí mật pipeline hoặc dùng nhận dạng liên kết. Cam kết tài sản đánh giá và xác minh nhận dạng có thể truy cập bộ dữ liệu/đánh giá tham chiếu. Xem [ví dụ pipeline khóa học](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) và [hướng dẫn Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Dọn dẹp cẩn thận

Với **dự án mới được tạo bởi môi trường này**, xem lại tài nguyên được liệt kê bởi `azd down` trước khi xác nhận: nó sẽ xoá nhóm tài nguyên và mọi thứ bên trong.

Với **dự án tái sử dụng**, `azd down` giữ dự án, hosted agent, và các tài nguyên khác nguyên vị trí. Chỉ xoá tài nguyên không mong muốn bạn sở hữu theo [hướng dẫn dọn dẹp khởi động nhanh](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); không xoá nhóm tài nguyên chia sẻ để dọn dẹp một bài tập.

**Kiểm tra hoàn thành:** Giải thích cài đặt điều khiển hành vi cục bộ và đám mây, hiển thị phản hồi cục bộ và triển khai, xem xét kết quả đánh giá, và xác định tài nguyên còn lại sau dọn dẹp.

### Tùy chọn: Tạo khung với Microsoft Foundry Skill

Cài đặt [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) cho host agent lập trình của bạn, sau đó mở thư mục rỗng riêng biệt. Yêu cầu nó tạo khung mẫu API Python Agent Framework Responses cơ bản ở chế độ triển khai mã, giải thích `azure.yaml` tạo ra, và đề xuất đăng ký, khu vực, dự án, và triển khai mô hình. Yêu cầu phê duyệt **trước khi tạo tài nguyên Azure**, yêu cầu thử nghiệm cục bộ, và dừng trước khi triển khai. Xem lại đầu ra và chỉ tiếp tục các bước triển khai trên khi sẵn sàng.

Đối với các dự án hiện có, `--template`/`-t` thay thế cho chính tả `--manifest`/`-m` đã bị loại bỏ; việc thay đổi cờ không di chuyển các bản mẫu cũ hoặc cấu hình tác nhân lồng nhau. Xem [tài liệu tham khảo AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Triển khai Lệnh Đơn

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Triển khai Theo Môi Trường Riêng

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Giám sát và Quan sát

### Tích hợp Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

Điều này cung cấp một tài nguyên Insights, không phải cài đặt theo dõi. Khi ứng dụng của bạn phát ra khoảng gọi mô hình ra ngoài, chạy truy vấn minh họa này trong Application Insights Logs (điều chỉnh bộ lọc theo tên khoảng của bạn):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Giám sát Chi phí

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

Sử dụng người nhận thật và xác nhận quyền hạn chế phạm vi tính phí. Một ngân sách gửi cảnh báo; nó không phải là giới hạn chi tiêu.

## 🔐 Thực hành bảo mật tốt nhất

### Cấu hình Managed Identity

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Bảo mật Mạng

Mảnh điểm cuối này cũng cần một vùng DNS riêng/tập hợp, liên kết VNet, kết nối ứng dụng VNet, và chính sách truy cập công cộng rõ ràng. Tạo một điểm cuối riêng không tự động vô hiệu truy cập công cộng.

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
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

## Tối ưu hiệu suất

### Chiến lược Bộ nhớ đệm

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache for Redis Basic/Standard/Premium đang trên [đường hướng nghỉ hưu](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); sử dụng Azure Managed Redis cho các triển khai mới và theo hướng dẫn mẫu/xác thực hiện tại. Phạm vi các phản hồi AI bộ nhớ đệm bằng ủy quyền, mô hình/hướng dẫn, và phiên bản dữ liệu, với thời hạn; không bao giờ chia sẻ phản hồi riêng tư chỉ bằng văn bản truy vấn.

### Cấu hình Tự động mở rộng

**Tài nguyên một phần:** hợp nhất các thiết lập quy mô/lưu lượng này thành một Container App hoàn chỉnh với môi trường được quản lý, hình ảnh container và giới hạn tài nguyên. Nhiều bản sao hơn không làm tăng hạn mức mô hình.

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Khắc phục sự cố phổ biến

### Vấn đề 1: Vượt hạn mức OpenAI

**Triệu chứng:**
- Triển khai thất bại với lỗi hạn mức
- Lỗi 429 trong nhật ký ứng dụng

**Giải pháp:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

Biến capacity ở trên chỉ áp dụng cho mẫu tùy chỉnh được kết nối để sử dụng nó. Đối với ví dụ RAG, sử dụng `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Không thay đổi `AZURE_LOCATION` để di chuyển tài nguyên hiện có; tạo một môi trường riêng cho vùng mới và lên kế hoạch di chuyển/dọn dẹp.

### Vấn đề 2: Lỗi xác thực

**Triệu chứng:**
- Lỗi 401/403 khi gọi dịch vụ AI
- Thông báo "Access denied"

**Giải pháp:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Vấn đề 3: Lỗi Triển khai Mô hình

**Triệu chứng:**
- Mô hình không có sẵn trong triển khai
- Phiên bản mô hình cụ thể thất bại

**Giải pháp:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Mẫu Ví dụ

Đây là các lựa chọn thay thế, không phải lệnh tuần tự. Bắt đầu từng cái trong một thư mục trống riêng biệt. Đích `.` rõ ràng giữ khởi tạo trong thư mục hiện tại của bạn; nếu không AZD hiện tại có thể tạo thư mục con tên mẫu mà không thay đổi thư mục làm việc của shell của bạn.

### Ứng dụng Chat RAG (Python)

**Kho lưu trữ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Dịch vụ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Mô tả**: Ứng dụng tham khảo chat RAG cho các câu hỏi trên tài liệu của bạn, với thu hồi Azure AI Search. Xem lại các mô hình được hỗ trợ hiện tại của mẫu, các tính năng tùy chọn, hướng dẫn chi phí và tăng cường sản xuất trước khi sử dụng; triển khai một mẫu không làm cho ứng dụng sẵn sàng cho sản xuất.

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Ứng dụng Chat RAG (.NET)

**Kho lưu trữ**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Dịch vụ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Mô tả**: Bản tương đương .NET/C# của mẫu chat RAG Python. Xây dựng với API tối giản ASP.NET Core và frontend Blazor WebAssembly. Bao gồm chat thoại, hỗ trợ tầm nhìn GPT-4o-mini, và client đồng hành .NET MAUI Blazor Hybrid cho desktop/mobile.

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Ứng dụng Chat RAG (Java)

**Kho lưu trữ**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Dịch vụ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Mô tả**: Phiên bản Java của mẫu chat RAG sử dụng Langchain4J cho phối hợp AI. Hỗ trợ kiến trúc microservice sự kiện điều khiển, nhiều chiến lược tìm kiếm (văn bản, vector, lai), tải tài liệu với Azure Document Intelligence, và triển khai trên Azure Container Apps hoặc Azure Kubernetes Service.

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Hỗ trợ Bán lẻ Doanh nghiệp với Microsoft Foundry

**Kho lưu trữ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Dịch vụ**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Mô tả**: Bộ hỗ trợ bán lẻ RAG đầu-cuối sử dụng Microsoft Foundry và Prompty. Chatbot Contoso Outdoor kết nối phản hồi dựa trên danh mục sản phẩm và dữ liệu đơn hàng khách hàng. Minh họa toàn bộ quy trình GenAIOps — tạo mẫu với Prompty, đánh giá với bộ đánh giá hỗ trợ AI, và triển khai qua AZD đến Container Apps.

**Bắt đầu nhanh**:
```bash
azd init --template contoso-chat .
azd up
```

### Ứng dụng Viết Sáng tạo Nhiều Tác nhân

**Kho lưu trữ**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Dịch vụ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Mô tả**: Mẫu đa tác nhân thể hiện phối hợp tác nhân AI với Prompty. Sử dụng tác nhân nghiên cứu (Bing Grounding trong Azure AI Agent Service), tác nhân sản phẩm (Azure AI Search), tác nhân viết và tác nhân biên tập hợp tác sản xuất các bài viết nghiên cứu kỹ. Bao gồm CI/CD với đánh giá trong GitHub Actions.

**Bắt đầu nhanh**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat RAG Không máy chủ (JavaScript/TypeScript)

**Kho lưu trữ**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Dịch vụ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Mô tả**: Chatbot RAG hoàn toàn không máy chủ sử dụng LangChain.js với Azure Functions cho API và Azure Static Web Apps để lưu trữ. Sử dụng Azure Cosmos DB làm kho vector và cơ sở dữ liệu lịch sử chat. Hỗ trợ phát triển cục bộ với Ollama để thử nghiệm không tốn phí.

**Bắt đầu nhanh**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Gia tốc giải pháp Chat với dữ liệu của bạn

**Kho lưu trữ**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Dịch vụ**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search với Cosmos DB, hoặc PostgreSQL với pgvector

**Mô tả**: Bộ tăng tốc chat dựa trên tài liệu với trích dẫn. Mẫu hiện tại lưu trữ frontend React, backend FastAPI, và worker ingestion Functions trên Container Apps; tùy chọn điều phối là Agent Framework và LangGraph. Lựa chọn cơ sở dữ liệu/tìm kiếm được chọn khi triển khai. Đây là điểm bắt đầu, không phải hệ thống sản xuất hoàn chỉnh; không giả định các biến thể App Service, Semantic Kernel, hoặc Prompt Flow cũ mô tả mặc định hiện tại.

**Bắt đầu nhanh**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Các Tác nhân Du lịch AI — Phối hợp Multi-Agent MCP

**Kho lưu trữ**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Dịch vụ**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Mô tả**: Ứng dụng tham khảo phối hợp đa tác nhân AI sử dụng ba framework (LangChain.js, LlamaIndex.TS, và Microsoft Agent Framework). Có các máy chủ MCP (Model Context Protocol) bằng bốn ngôn ngữ triển khai như Azure Container Apps không máy chủ với giám sát OpenTelemetry.

**Bắt đầu nhanh**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Xem thêm mẫu khác**: Ghé thăm [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) để xem các mẫu hiện có qua các ngôn ngữ và kịch bản. Mỗi ví dụ liên kết là kho lưu trữ bên ngoài, không phải ví dụ cục bộ của khóa học; kiểm tra các yêu cầu và hướng dẫn sản xuất hiện tại trước khi triển khai.

## Bước tiếp theo

1. **Thử các ví dụ**: Bắt đầu với mẫu xây dựng sẵn phù hợp trường hợp sử dụng của bạn
2. **Tùy chỉnh theo nhu cầu**: Sửa đổi cơ sở hạ tầng và mã ứng dụng
3. **Thêm giám sát**: Triển khai khả năng quan sát toàn diện
4. **Tối ưu chi phí**: Tinh chỉnh cấu hình phù hợp ngân sách
5. **Bảo mật triển khai của bạn**: Áp dụng các mô hình bảo mật doanh nghiệp
6. **Mở rộng lên sản xuất**: Thêm các tính năng đa vùng và độ sẵn sàng cao

## 🎯 Thực hành Thực tế

### Bài tập 1: Triển khai Ứng dụng Chat Microsoft Foundry Models (30 phút)
**Mục tiêu**: Triển khai và kiểm thử ứng dụng chat AI tham khảo

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Review the listed resources and confirm cleanup
azd down
```

**Tiêu chí thành công:**
- [ ] Triển khai hoàn thành không lỗi hạn mức
- [ ] Có thể truy cập giao diện chat trên trình duyệt
- [ ] Có thể đặt câu hỏi và nhận phản hồi sử dụng AI
- [ ] Application Insights hiển thị dữ liệu theo dõi
- [ ] Đã dọn dẹp tài nguyên thành công

**Chi phí:** Xem lại hướng dẫn chi phí hiện tại và SKU đã chọn trước khi triển khai. Thanh toán tiếp tục cho đến khi xóa tài nguyên; không có ước tính cố định 30 phút áp dụng cho mọi cấu hình.

### Bài tập 2: Cấu hình Triển khai Đa Mô hình (45 phút)
**Mục tiêu**: Triển khai nhiều mô hình AI với cấu hình khác nhau

**Điểm bắt đầu:** Một tài khoản Azure OpenAI hiện có và một module nhóm tài nguyên AZD có thể gọi tệp này. Tạo `infra/ai-models.bicep` với nội dung sau bằng trình chỉnh sửa của bạn. Nó không tự động triển khai chỉ vì nằm dưới `infra/`.

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Từ module phạm vi nhóm tài nguyên sở hữu tài khoản, thêm lời gọi module (điều chỉnh tên ký hiệu cho tài khoản thực tế của bạn):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Không khai báo cùng triển khai trong cả hai module. Nếu điểm vào AZD là phạm vi đăng ký, gọi nó từ module con phạm vi nhóm tài nguyên và điều chỉnh đường dẫn tương đối. Xây dựng module chứa đó bằng `az bicep build --file <path-to-containing-module>`, sau đó:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Tiêu chí thành công:**
- [ ] Nhiều mô hình được triển khai thành công
- [ ] Các thiết lập capacity khác nhau được áp dụng
- [ ] Mô hình có thể truy cập qua API
- [ ] Có thể gọi cả hai mô hình từ ứng dụng

### Bài tập 3: Triển khai Giám sát Chi phí (20 phút)
**Mục tiêu**: Thiết lập cảnh báo ngân sách và theo dõi chi phí

**Điểm bắt đầu:** Mẫu ngân sách ở trên và một module cơ sở hạ tầng phạm vi nhóm tài nguyên. Thêm tài nguyên này bằng trình chỉnh sửa; truyền `budgetStartDate` từ ánh xạ tham số của bạn (không trùng lặp tham số nếu đã khai báo). Thay thế người nhận và xác nhận quyền ghi ngân sách.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Mong đợi: phản hồi chứa `amount: 200`, cả hai ngưỡng, và người nhận của bạn. Kiểm tra Quản lý Chi phí trong cổng để xem chi phí thực tế; dữ liệu chi phí bị trễ và cảnh báo không cần kích hoạt trong bài tập ngắn.

**Tiêu chí thành công:**
- [ ] Đã tạo cảnh báo ngân sách trong Azure
- [ ] Đã cấu hình thông báo email
- [ ] Có thể xem dữ liệu chi phí trên Cổng Azure
- [ ] Ngưỡng ngân sách được đặt phù hợp

## 💡 Các câu hỏi thường gặp

<details>
<summary><strong>Làm thế nào để giảm chi phí Microsoft Foundry Models trong quá trình phát triển?</strong></summary>

1. **Kiểm tra giá**: Không có khoản miễn phí chung 50.000 token hàng tháng cho các mô hình Azure OpenAI
2. **Chọn dung lượng phù hợp**: Capacity `10` thường tương đương 10.000 TPM cho các mô hình văn bản chuẩn này, không phải 10 TPM. Giảm giới hạn tốc độ này không làm giảm giá token
3. **Dùng azd down**: Xóa tài nguyên dùng tạm khi không phát triển (không phải gỡ tài nguyên)
4. **Bộ nhớ đệm Phản hồi**: Triển khai bộ nhớ đệm Redis cho truy vấn lặp lại
5. **Kỹ thuật Nhắc nhở**: Giảm sử dụng token với nhắc nhở hiệu quả

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Sự khác nhau giữa Microsoft Foundry Models và OpenAI API là gì?</strong></summary>

**Microsoft Foundry Models**:
- Bảo mật và tuân thủ doanh nghiệp
- Tích hợp mạng riêng
- Đảm bảo SLA
- Xác thực bằng Managed Identity
- Hạn mức cao hơn có sẵn

**OpenAI API**: Nhà cung cấp riêng/bộ API với tính sẵn có mô hình, giá cả, xác thực, và kết nối doanh nghiệp riêng. So sánh các sản phẩm hiện tại thay vì giả định chỉ trên mạng công cộng hoặc luôn cung cấp mô hình trước tiên.

Lựa chọn dựa trên yêu cầu tổ chức của bạn; các ví dụ xác thực Managed Identity và private-link dành riêng Azure trong khóa học này áp dụng cho dịch vụ Azure-hosted, không phải mọi mô hình/nhà cung cấp trong danh mục Foundry.
</details>

<details>
<summary><strong>Làm thế nào xử lý lỗi vượt hạn mức Microsoft Foundry Models?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Tôi có thể sử dụng dữ liệu riêng với Microsoft Foundry Models không?</strong></summary>

Vâng! Sử dụng **Azure AI Search** cho RAG (Tạo nâng cao thu hồi):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Xem mẫu [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Làm thế nào để tôi bảo mật các điểm cuối mô hình AI?</strong></summary>

**Thực tiễn tốt nhất**:
1. Sử dụng Managed Identity (không dùng khóa API)
2. Kích hoạt Private Endpoints
3. Cấu hình nhóm bảo mật mạng
4. Thực hiện giới hạn tốc độ
5. Sử dụng Azure Key Vault cho các bí mật

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Cộng đồng và Hỗ trợ

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Vấn đề và thảo luận](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Tài liệu chính thức](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Kỹ năng Microsoft Foundry trên skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Cài đặt kỹ năng Azure + Foundry agent trong trình chỉnh sửa của bạn bằng `npx skills add microsoft/github-copilot-for-azure`

---

**Điều hướng Chương:**
- **📚 Trang Khóa học**: [AZD cho Người mới bắt đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển AI-First
- **⬅️ Chương trước**: [Chương 1: Dự án đầu tiên của bạn](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp theo**: [AI Agents](agents.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

**Cần giúp đỡ?** Tham gia các thảo luận cộng đồng hoặc mở một vấn đề trong kho lưu trữ. Cộng đồng Azure AI + AZD luôn ở đây để giúp bạn thành công!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->