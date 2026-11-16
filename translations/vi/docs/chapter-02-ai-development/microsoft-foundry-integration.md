# Tích hợp Microsoft Foundry với AZD

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD cho Người mới bắt đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển Ưu tiên AI
- **⬅️ Chương trước**: [Chương 1: Dự án đầu tiên của bạn](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp theo**: [Đại lý AI](agents.md)
- **🚀 Chương kế tiếp**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

## Tổng quan

Hướng dẫn này trình bày cách tích hợp dịch vụ Microsoft Foundry với Azure Developer CLI (AZD) để triển khai ứng dụng AI hiệu quả hơn. Microsoft Foundry cung cấp nền tảng toàn diện để xây dựng, triển khai và quản lý các ứng dụng AI, trong khi AZD đơn giản hóa quy trình hạ tầng và triển khai.

## Microsoft Foundry là gì?

Microsoft Foundry là nền tảng hợp nhất của Microsoft cho phát triển AI bao gồm:

- **Danh mục Mô hình**: Truy cập các mô hình AI tiên tiến nhất
- **Dòng lệnh Prompt**: Trình thiết kế trực quan cho các luồng công việc AI
- **Cổng Microsoft Foundry**: Môi trường phát triển tích hợp cho ứng dụng AI
- **Tùy chọn Triển khai**: Nhiều lựa chọn lưu trữ và mở rộng quy mô
- **An toàn và Bảo mật**: Tính năng AI có trách nhiệm tích hợp sẵn

## AZD + Microsoft Foundry: Tốt hơn khi kết hợp

| Tính năng | Microsoft Foundry | Lợi ích khi tích hợp AZD |
|---------|-----------------|------------------------|
| **Triển khai Mô hình** | Triển khai thủ công qua cổng | Triển khai tự động, có thể lặp lại |
| **Hạ tầng** | Cấp phát qua giao diện | Hạ tầng dưới dạng Mã (Bicep) |
| **Quản lý Môi trường** | Tập trung vào một môi trường | Đa môi trường (phát triển/kiểm thử/sản xuất) |
| **Tích hợp CI/CD** | Hạn chế | Hỗ trợ GitHub Actions gốc |
| **Quản lý Chi phí** | Giám sát cơ bản | Tối ưu chi phí theo môi trường |

## Yêu cầu trước

- Đăng ký Azure với quyền truy cập phù hợp
- Cài đặt Azure Developer CLI
- Truy cập dịch vụ Microsoft Foundry Models
- Hiểu biết cơ bản về Microsoft Foundry

> **Đánh giá phát hành (2026-11-04):** Hướng dẫn AI CLI đã được kiểm tra so với tài liệu/nguon mã `azd` `1.37.2`, đại lý `1.0.0-beta.23` và đánh giá `1.0.0-beta.2`. Sử dụng `azd >= 1.37.0` cho luồng công việc kết hợp. Xem [các thay đổi và sửa lỗi phát hành](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); đánh giá này không chứng nhận mọi mẫu hay ví dụ SDK đối với triển khai thực tế.

## Các mẫu tích hợp chính

**Phạm vi ví dụ:** Mẫu Bicep dưới đây chứa các đoạn tài nguyên minh họa, không phải mẫu hoàn chỉnh có thể triển khai. Mẫu bao gồm phải định nghĩa tên, `location`, tài nguyên tham chiếu, danh tính, kết quả đầu ra, và lưu trữ ứng dụng. Sử dụng mẫu liên kết cho điểm bắt đầu có thể chạy. Ví dụ Bash yêu cầu xác thực Azure CLI riêng biệt với `azd auth login`.

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

Người gọi cần có danh tính được quản lý đính kèm và `Cognitive Services OpenAI User` ở mức tài khoản; vô hiệu hóa khóa không cấp quyền truy cập. Xác minh khu vực/mô hình/SKU khả dụng và hạn mức trước khi triển khai.

### Mẫu 2: Tích hợp AI Search + RAG

**Trường hợp sử dụng**: Triển khai ứng dụng sinh tạo hỗ trợ truy xuất (RAG)

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

Không có tài nguyên ARM `Microsoft.Search/searchServices/dataConnections` cho tích hợp này. Cấu hình chỉ mục Search, nguồn dữ liệu, indexer/skillset hoặc vectorizer qua các API mặt dữ liệu Search hỗ trợ. Nếu Search gọi mô hình nhúng, hãy bật danh tính được quản lý của nó, cấp vai trò mô hình liên quan, và cấu hình kỹ năng nhúng/vectorizer. Xem [tích hợp vector hóa](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Mẫu 3: Tích hợp Trí tuệ Văn bản

**Trường hợp sử dụng**: Quy trình xử lý và phân tích văn bản

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

## 🔧 Mẫu Cấu hình

### Thiết lập Biến Môi trường

Ngoại trừ các thiết lập AZD đã được ghi lại như `AZURE_LOCATION`, đây là **tên đầu vào mẫu tùy chỉnh**. Chúng không có tác dụng trừ khi mẫu/ứng dụng tiêu thụ qua ánh xạ tham số và môi trường chủ. Đối với `azure-search-openai-demo`, hãy dùng các tên thực tế như `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` và `AZURE_SEARCH_SERVICE_SKU` thay thế. Dung lượng mô hình không phải là SKU tài khoản.

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

### Cấu hình Bảo mật với Key Vault

Ưu tiên Entra ID với xác thực khóa cục bộ bị vô hiệu. Dưới đây là **phương án xác thực khóa cũ** chỉ dành cho ứng dụng yêu cầu khóa: cần tài khoản bật xác thực khóa, danh tính ứng dụng gắn chặt với host, và truy cập/điều phối Key Vault hoạt động. Không dùng kết hợp lấy khóa với `disableLocalAuth: true` và mong các cuộc gọi dựa trên khóa hoạt động.

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

## Quy trình Triển khai

### Phần mở rộng AZD cho Foundry

AZD cung cấp các phần mở rộng bổ sung năng lực AI cụ thể để làm việc với dịch vụ Microsoft Foundry:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

Các phần mở rộng AI vẫn phát triển nhanh trong giai đoạn xem trước. Nếu lệnh hoạt động khác với mô tả, nâng cấp phần mở rộng liên quan trước khi xử lý dự án.

### Triển khai Ưu tiên Đại lý với `azd ai`

Sử dụng `azd ai agent init` tương tác, hoặc áp dụng mẫu dự án đại lý `azure.yaml` đã được kết nối với Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` thay thế chính tả lỗi thời `--manifest`/`-m`; tệp manifest cũ và cấu hình đại lý lồng nhau vẫn cần di chuyển. Đánh giá đại lý với `azd ai eval` từ `azure.ai.evaluations`, không dùng luồng công việc cũ đã loại bỏ. Xem [di chuyển đánh giá](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) cho thiết lập, thực hiện, và kết quả.

Xem [Lệnh AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) để tham khảo đầy đủ lệnh và cờ.

### Triển khai với Một Lệnh Đơn

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Triển khai theo Môi trường

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

Điều này cấp phát tài nguyên Insights, không phải dụng cụ telemetry. Khi ứng dụng bạn phát sinh các span gọi mô hình, chạy truy vấn minh họa này trong Application Insights Logs (thay đổi bộ lọc theo tên span thực tế):

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

Sử dụng người nhận thật và xác minh quyền phạm vi thanh toán. Ngân sách gửi cảnh báo; không phải giới hạn chi tiêu.

## 🔐 Thực hành Bảo mật Tốt nhất

### Cấu hình Danh tính được Quản lý

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

Đoạn endpoint này cũng cần vùng DNS riêng/tập nhóm, liên kết VNet, kết nối ứng dụng VNet, và chính sách truy cập công khai rõ ràng. Tạo endpoint riêng chưa tắt truy cập công khai.

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

## Tối ưu Hiệu năng

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

Azure Cache cho Redis Basic/Standard/Premium đang trong quá trình [ngừng hỗ trợ](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); sử dụng Azure Managed Redis cho triển khai mới và theo dõi hướng dẫn mẫu/xác thực hiện hành. Phạm vi bộ nhớ đệm phản hồi AI theo ủy quyền, mô hình/ hướng dẫn, và phiên bản dữ liệu, có thời hạn; không bao giờ chia sẻ phản hồi riêng tư chỉ dựa trên văn bản truy vấn.

### Cấu hình Tự động mở rộng

**Tài nguyên một phần:** hợp nhất các thiết lập tỷ lệ/lưu lượng này vào Container App hoàn chỉnh với môi trường quản lý, hình ảnh container, và giới hạn tài nguyên. Thêm bản sao không tăng hạn mức mô hình.

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

## Xử lý sự cố Phổ biến

### Vấn đề 1: Vượt quá Hạn mức OpenAI

**Triệu chứng:**
- Triển khai thất bại với lỗi vượt hạn mức
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

Biến dung lượng nêu trên chỉ áp dụng cho mẫu tùy chỉnh kết nối sử dụng nó. Với ví dụ RAG, sử dụng `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Không thay đổi `AZURE_LOCATION` để di chuyển tài nguyên hiện tại; tạo môi trường riêng cho khu vực mới và lên kế hoạch di chuyển/dọn dẹp.

### Vấn đề 2: Lỗi Xác thực

**Triệu chứng:**
- Lỗi 401/403 khi gọi dịch vụ AI
- Thông báo "Truy cập bị từ chối"

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
- Mô hình không khả dụng trong triển khai
- Phiên bản mô hình cụ thể bị lỗi

**Giải pháp:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Mẫu Ví dụ

Đây là những lựa chọn thay thế, không phải lệnh tuần tự. Bắt đầu mỗi mẫu trong thư mục trống riêng biệt. Đích `.` rõ ràng giữ việc khởi tạo trong thư mục hiện tại của bạn; nếu không AZD hiện tại có thể tạo thư mục con theo tên mẫu mà không thay đổi thư mục làm việc của shell.

### Ứng dụng Chat RAG (Python)

**Kho lưu trữ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Dịch vụ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Mô tả**: Ứng dụng chat RAG mẫu tham khảo cho câu hỏi dựa trên tài liệu, với truy xuất Azure AI Search. Xem lại mô hình hỗ trợ hiện tại, tính năng tùy chọn, hướng dẫn chi phí, và tăng cường cho sản xuất trước khi sử dụng; triển khai mẫu không làm cho ứng dụng sẵn sàng sản xuất.

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Ứng dụng Chat RAG (.NET)

**Kho lưu trữ**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Dịch vụ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Mô tả**: Phiên bản .NET/C# tương đương ứng dụng chat RAG Python. Xây dựng bằng ASP.NET Core Minimal API và frontend Blazor WebAssembly. Bao gồm chat giọng nói, hỗ trợ tầm nhìn GPT-4o-mini, và ứng dụng .NET MAUI Blazor Hybrid cho desktop/mobile kèm theo.

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Ứng dụng Chat RAG (Java)

**Kho lưu trữ**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Dịch vụ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Mô tả**: Phiên bản Java của mẫu chat RAG sử dụng Langchain4J cho phối hợp AI. Hỗ trợ kiến trúc sự kiện microservice, nhiều chiến lược tìm kiếm (văn bản, vector, lai), tải tài liệu với Azure Document Intelligence, và triển khai trên Azure Container Apps hoặc Azure Kubernetes Service.

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copilot Bán lẻ Doanh nghiệp với Microsoft Foundry

**Kho lưu trữ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Dịch vụ**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Mô tả**: Copilot bán lẻ RAG đầu cuối sử dụng Microsoft Foundry và Prompty. Chatbot nhà bán lẻ Contoso Outdoor dựa trên dữ liệu danh mục sản phẩm và đơn hàng khách hàng. Minh họa toàn bộ quy trình GenAIOps — thiết kế nguyên mẫu với Prompty, đánh giá với các công cụ trợ giúp AI, và triển khai qua AZD tới Container Apps.

**Bắt đầu nhanh**:
```bash
azd init --template contoso-chat .
azd up
```

### Ứng dụng Viết Sáng tạo Multi-Agent

**Kho lưu trữ**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Dịch vụ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Mô tả**: Ví dụ multi-agent minh họa phối hợp đại lý AI với Prompty. Bao gồm đại lý nghiên cứu (Bing Grounding trong Azure AI Agent Service), đại lý sản phẩm (Azure AI Search), đại lý viết, và đại lý biên tập cùng hợp tác tạo bài báo nghiên cứu tốt. Kèm CI/CD với đánh giá trong GitHub Actions.

**Bắt đầu nhanh**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Kho lưu trữ**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Dịch vụ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB cho NoSQL + LangChain.js

**Mô tả**: Chatbot RAG hoàn toàn serverless dùng LangChain.js với Azure Functions cho API và Azure Static Web Apps để lưu trữ. Dùng Azure Cosmos DB làm kho vector và cơ sở dữ liệu lịch sử chat. Hỗ trợ phát triển cục bộ với Ollama để kiểm thử không tốn phí.

**Bắt đầu nhanh**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Bộ Tăng tốc Giải pháp Chat với Dữ liệu của Bạn

**Kho lưu trữ**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Dịch vụ**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search với Cosmos DB hoặc PostgreSQL với pgvector

**Mô tả**: Bộ tăng tốc chat dựa trên tài liệu với trích dẫn. Mẫu hiện tại lưu trữ frontend React, backend FastAPI, và worker Functions xử lý trên Container Apps; các tùy chọn phối hợp là Agent Framework và LangGraph. Lựa chọn cơ sở dữ liệu/truy xuất được chọn khi triển khai. Đây là điểm bắt đầu, không phải hệ thống sản xuất sẵn; không giả định các biến thể App Service, Semantic Kernel, hoặc Prompt Flow cũ mô tả mặc định hiện hành.

**Bắt đầu nhanh**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Đại lý Du lịch AI — Phối hợp Multi-Agent MCP

**Kho lưu trữ**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Dịch vụ**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Mô tả**: Ứng dụng tham khảo cho điều phối AI đa tác nhân sử dụng ba framework (LangChain.js, LlamaIndex.TS và Microsoft Agent Framework). Có các máy chủ MCP (Model Context Protocol) bằng bốn ngôn ngữ triển khai dưới dạng Azure Container Apps không máy chủ với giám sát OpenTelemetry.

**Bắt đầu nhanh**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Duyệt thêm mẫu**: Truy cập [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) để xem các mẫu hiện có trên các ngôn ngữ và kịch bản. Mỗi ví dụ liên kết là kho lưu trữ bên ngoài, không phải ví dụ cục bộ do khóa học cung cấp; kiểm tra yêu cầu và hướng dẫn sản xuất hiện hành trước khi triển khai.

## Các Bước Tiếp Theo

1. **Thử các Ví dụ**: Bắt đầu với mẫu đã xây dựng sẵn phù hợp với trường hợp sử dụng của bạn
2. **Tuỳ chỉnh Theo Nhu Cầu**: Điều chỉnh hạ tầng và mã ứng dụng
3. **Thêm Giám sát**: Triển khai quan sát toàn diện
4. **Tối Ưu Chi Phí**: Tinh chỉnh cấu hình phù hợp ngân sách
5. **Bảo mật Triển khai**: Áp dụng mẫu bảo mật doanh nghiệp
6. **Mở Rộng Đến Sản Xuất**: Thêm chức năng đa vùng và khả năng cao

## 🎯 Bài Tập Thực Hành

### Bài tập 1: Triển khai Ứng dụng Chat Microsoft Foundry Models (30 phút)
**Mục tiêu**: Triển khai và thử nghiệm ứng dụng chat AI tham khảo

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

# Clean up
azd down --force --purge
```

**Tiêu chí thành công:**
- [ ] Triển khai hoàn tất không lỗi hạn ngạch
- [ ] Có thể truy cập giao diện chat trên trình duyệt
- [ ] Có thể hỏi và nhận phản hồi AI
- [ ] Application Insights hiển thị dữ liệu telemetry
- [ ] Đã dọn dẹp tài nguyên thành công

**Chi phí:** Xem lại hướng dẫn chi phí và SKU đã chọn trước khi triển khai. Việc tính phí tiếp tục cho đến khi tài nguyên bị xóa; không có ước tính cố định 30 phút áp dụng cho mọi cấu hình.

### Bài tập 2: Cấu hình Triển khai Đa mô hình (45 phút)
**Mục tiêu**: Triển khai nhiều mô hình AI với các cấu hình khác nhau

**Điểm bắt đầu:** Một tài khoản Azure OpenAI hiện có và mô-đun nhóm tài nguyên AZD có thể gọi file này. Tạo `infra/ai-models.bicep` với nội dung sau bằng trình soạn thảo của bạn. Nó không tự động triển khai chỉ vì nằm dưới `infra/`.

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

Từ mô-đun phạm vi nhóm tài nguyên sở hữu tài khoản, thêm lời gọi mô-đun (điều chỉnh tên ký hiệu theo tài khoản thực tế của bạn):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Không khai báo các triển khai giống nhau trong cả hai mô-đun. Nếu điểm vào AZD phạm vi đăng ký, hãy gọi từ mô-đun con phạm vi nhóm tài nguyên và điều chỉnh đường dẫn tương đối. Xây dựng mô-đun bao gồm đó với `az bicep build --file <path-to-containing-module>`, sau đó:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Tiêu chí thành công:**
- [ ] Nhiều mô hình được triển khai thành công
- [ ] Áp dụng các cấu hình dung lượng khác nhau
- [ ] Mô hình có thể truy cập qua API
- [ ] Có thể gọi cả hai mô hình từ ứng dụng

### Bài tập 3: Triển khai Giám sát Chi phí (20 phút)
**Mục tiêu**: Thiết lập cảnh báo ngân sách và theo dõi chi phí

**Điểm bắt đầu:** Mẫu ngân sách đã mô tả và mô-đun hạ tầng phạm vi nhóm tài nguyên. Thêm tài nguyên này bằng trình soạn thảo; truyền `budgetStartDate` từ ánh xạ tham số của bạn (không sao chép tham số nếu đã khai báo). Thay thế người nhận và xác nhận bạn có quyền ghi ngân sách.

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

Mong đợi: phản hồi chứa `amount: 200`, cả hai ngưỡng và người nhận của bạn. Kiểm tra Quản lý Chi phí trong cổng để xem phí thực tế; dữ liệu chi phí có độ trễ và cảnh báo không nhất thiết bật trong bài tập ngắn.

**Tiêu chí thành công:**
- [ ] Cảnh báo ngân sách được tạo trong Azure
- [ ] Cấu hình thông báo email
- [ ] Có thể xem dữ liệu chi phí trong Azure Portal
- [ ] Ngưỡng ngân sách được thiết lập phù hợp

## 💡 Câu Hỏi Thường Gặp

<details>
<summary><strong>Làm thế nào để giảm chi phí Microsoft Foundry Models trong quá trình phát triển?</strong></summary>

1. **Kiểm tra giá**: Không có mức miễn phí toàn cục 50,000 token mỗi tháng cho các mô hình Azure OpenAI
2. **Chọn kích thước dung lượng đúng**: Dung lượng `10` thường đại diện cho 10,000 TPM cho các mô hình văn bản Chuẩn này, không phải 10 TPM. Giảm giới hạn tốc độ này không giảm giá mỗi token
3. **Sử dụng azd down**: Xoá các tài nguyên dùng tạm khi không phát triển (không phải giải phóng)
4. **Bộ nhớ đệm Phản hồi**: Triển khai Redis cache cho các truy vấn lặp lại
5. **Sử dụng Kỹ thuật Prompt**: Giảm sử dụng token bằng prompt hiệu quả

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Sự khác biệt giữa Microsoft Foundry Models và OpenAI API là gì?</strong></summary>

**Microsoft Foundry Models**:
- Bảo mật và tuân thủ doanh nghiệp
- Tích hợp mạng riêng tư
- Cam kết SLA
- Xác thực danh tính được quản lý
- Có hạn ngạch cao hơn

**OpenAI API**: Nhà cung cấp/API riêng biệt với mô hình, giá cả, xác thực và kết nối doanh nghiệp riêng. So sánh các dịch vụ hiện có thay vì giả định chỉ dành cho công cộng hoặc luôn cung cấp mô hình đầu tiên.

Chọn dựa trên yêu cầu tổ chức; ví dụ danh tính được quản lý và liên kết riêng trong Azure ở khóa học này áp dụng cho dịch vụ Azure, không với mọi mô hình/ nhà cung cấp trong catalog Foundry.
</details>

<details>
<summary><strong>Làm sao xử lý lỗi vượt hạn ngạch Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Tôi có thể dùng dữ liệu riêng với Microsoft Foundry Models không?</strong></summary>

Có! Dùng **Azure AI Search** cho RAG (Retrieval Augmented Generation):

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
<summary><strong>Làm thế nào để bảo mật điểm cuối mô hình AI?</strong></summary>

**Thực hành tốt nhất**:
1. Sử dụng Managed Identity (không dùng khóa API)
2. Bật Private Endpoints
3. Cấu hình nhóm bảo mật mạng
4. Thực hiện giới hạn tốc độ
5. Dùng Azure Key Vault để quản lý bí mật

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

- **Microsoft Foundry Discord**: [kênh #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Vấn đề và thảo luận](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Tài liệu chính thức](https://learn.microsoft.com/azure/ai-studio/)
- **Kỹ năng Agent**: [Kỹ năng Microsoft Foundry trên skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Cài đặt kỹ năng Azure + Foundry agent trong trình soạn thảo với `npx skills add microsoft/github-copilot-for-azure`

---

**Điều hướng Chương:**
- **📚 Trang Khóa học**: [AZD Dành cho Người Mới](../../README.md)
- **📖 Chương Hiện Tại**: Chương 2 - Phát triển AI-First
- **⬅️ Chương Trước**: [Chương 1: Dự án Đầu tiên của Bạn](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp theo**: [Agent AI](agents.md)
- **🚀 Chương Kế Tiếp**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

**Cần giúp đỡ?** Tham gia thảo luận cộng đồng hoặc mở vấn đề trong kho lưu trữ. Cộng đồng Azure AI + AZD luôn sẵn sàng hỗ trợ bạn thành công!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->