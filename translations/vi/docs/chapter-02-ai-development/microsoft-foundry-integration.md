# Tích hợp Microsoft Foundry với AZD

**Điều hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Dành Cho Người Mới](../../README.md)
- **📖 Chương Hiện Tại**: Chương 2 - Phát Triển Ưu Tiên AI
- **⬅️ Chương Trước**: [Chương 1: Dự Án Đầu Tiên của Bạn](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp Theo**: [Triển Khai Mô Hình AI](ai-model-deployment.md)
- **🚀 Chương Tiếp Theo**: [Chương 3: Cấu Hình](../chapter-03-configuration/configuration.md)

## Tổng Quan

Hướng dẫn này minh họa cách tích hợp dịch vụ Microsoft Foundry với Azure Developer CLI (AZD) để triển khai ứng dụng AI một cách hiệu quả. Microsoft Foundry cung cấp một nền tảng toàn diện để xây dựng, triển khai và quản lý các ứng dụng AI, trong khi AZD đơn giản hóa quy trình hạ tầng và triển khai.

## Microsoft Foundry là gì?

Microsoft Foundry là nền tảng thống nhất của Microsoft dành cho phát triển AI bao gồm:

- **Danh mục Mô hình**: Truy cập các mô hình AI tiên tiến nhất
- **Dòng Dẫn Đầu (Prompt Flow)**: Trình thiết kế trực quan cho các luồng công việc AI
- **Cổng Thông Tin Microsoft Foundry**: Môi trường phát triển tích hợp cho ứng dụng AI
- **Tùy chọn Triển khai**: Nhiều lựa chọn lưu trữ và mở rộng quy mô
- **An toàn và Bảo mật**: Tính năng AI có trách nhiệm tích hợp sẵn

## AZD + Microsoft Foundry: Cùng nhau Tốt hơn

| Tính năng | Microsoft Foundry | Lợi Ích Tích Hợp AZD |
|---------|-----------------|------------------------|
| **Triển khai Mô hình** | Triển khai thủ công qua cổng | Triển khai tự động, có thể lặp lại |
| **Hạ tầng** | Cấp phát qua giao diện click | Hạ tầng dưới dạng Mã (Bicep) |
| **Quản lý Môi trường** | Tập trung một môi trường duy nhất | Nhiều môi trường (dev/staging/prod) |
| **Tích hợp CI/CD** | Hạn chế | Hỗ trợ GitHub Actions bản địa |
| **Quản lý Chi phí** | Giám sát cơ bản | Tối ưu chi phí theo môi trường |

## Yêu cầu trước

- Đăng ký Azure có quyền thích hợp
- Đã cài đặt Azure Developer CLI
- Truy cập dịch vụ Microsoft Foundry Models
- Có kiến thức cơ bản về Microsoft Foundry

> **Phiên bản AZD hiện tại:** Các ví dụ này được kiểm tra với `azd` `1.27.1`. Đối với luồng công việc tác nhân AI, sử dụng bản mở rộng xem trước hiện tại và kiểm tra phiên bản đã cài trước khi bắt đầu.

## Các Mẫu Tích Hợp Chính

### Mẫu 1: Tích hợp Microsoft Foundry Models

**Trường hợp sử dụng**: Triển khai ứng dụng chat với mô hình Microsoft Foundry Models

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
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
    disableLocalAuth: false
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
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Mẫu 2: Tích hợp Tìm kiếm AI + RAG

**Trường hợp sử dụng**: Triển khai ứng dụng tạo nội dung tăng cường truy xuất (RAG)

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

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### Mẫu 3: Tích hợp Trí tuệ Tài liệu

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

## 🔧 Mẫu Cấu Hình

### Thiết lập Biến Môi trường

**Cấu hình Sản xuất:**
```bash
# Dịch vụ AI cốt lõi
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Cấu hình mô hình
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Cài đặt hiệu suất
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Cấu hình Phát triển:**
```bash
# Cài đặt tối ưu chi phí cho phát triển
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Hạng miễn phí
```

### Cấu hình Bảo mật với Key Vault

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
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

### Tiện ích Mở rộng AZD cho Foundry

AZD cung cấp các tiện ích mở rộng bổ sung khả năng AI đặc thù cho làm việc với dịch vụ Microsoft Foundry:

```bash
# Cài đặt tiện ích mở rộng đại lý Foundry
azd extension install azure.ai.agents

# Cài đặt tiện ích mở rộng tinh chỉnh
azd extension install azure.ai.finetune

# Cài đặt tiện ích mở rộng mô hình tùy chỉnh
azd extension install azure.ai.models

# Liệt kê các tiện ích mở rộng đã cài đặt
azd extension list --installed

# Kiểm tra phiên bản tiện ích mở rộng đại lý hiện tại đã cài đặt
azd extension show azure.ai.agents
```

Các tiện ích AI vẫn đang phát triển nhanh trong bản xem trước. Nếu lệnh hoạt động khác với mô tả ở đây, hãy nâng cấp tiện ích liên quan trước khi xử lý sự cố dự án.

### Triển khai Ưu tiên Tác nhân với `azd ai`

Nếu bạn có manifiest tác nhân, dùng `azd ai agent init` để tạo khuôn khổ dự án kết nối với Dịch vụ Tác nhân Foundry:

```bash
# Khởi tạo từ một tập tin khai báo tác nhân
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Triển khai lên Azure
azd up
```

Các bản xem trước gần đây của `azure.ai.agents` cũng thêm hỗ trợ khởi tạo dựa trên mẫu cho `azd ai agent init`. Nếu bạn theo dõi các mẫu tác nhân mới, kiểm tra trợ giúp mở rộng để biết chính xác các cờ có trong phiên bản đã cài.

Xem [Lệnh CLI AI AZD](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) để tham khảo đầy đủ lệnh và cờ.

### Triển khai Chỉ với Một Lệnh

```bash
# Triển khai mọi thứ với một lệnh
azd up

# Hoặc triển khai từng phần
azd provision  # Chỉ hạ tầng
azd deploy     # Chỉ ứng dụng

# Dành cho triển khai ứng dụng AI chạy lâu trong azd 1.23.11+
azd deploy --timeout 1800
```

### Triển khai Theo Môi trường

```bash
# Môi trường phát triển
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Môi trường sản xuất
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
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### Giám sát Chi phí

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
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

## 🔐 Thực hành Bảo mật Tốt nhất

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
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
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

### Cấu hình Tự động mở rộng

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

## Xử lý Sự cố Thường gặp

### Vấn đề 1: Hết Hạn mức OpenAI

**Triệu chứng:**
- Triển khai thất bại với lỗi hạn mức
- Lỗi 429 trong nhật ký ứng dụng

**Giải pháp:**
```bash
# Kiểm tra mức sử dụng hạn ngạch hiện tại
az cognitiveservices usage list --location eastus

# Thử khu vực khác
azd env set AZURE_LOCATION westus2
azd up

# Giảm dung lượng tạm thời
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Vấn đề 2: Lỗi Xác thực

**Triệu chứng:**
- Lỗi 401/403 khi gọi dịch vụ AI
- Thông báo "Truy cập bị từ chối"

**Giải pháp:**
```bash
# Xác minh phân công vai trò
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kiểm tra cấu hình danh tính được quản lý
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Xác thực truy cập Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Vấn đề 3: Sự cố Triển khai Mô hình

**Triệu chứng:**
- Mô hình không có sẵn trong triển khai
- Phiên bản mô hình cụ thể bị lỗi

**Giải pháp:**
```bash
# Liệt kê các mô hình có sẵn theo khu vực
az cognitiveservices model list --location eastus

# Cập nhật phiên bản mô hình trong mẫu bicep
# Kiểm tra yêu cầu về dung lượng mô hình
```

## Mẫu Ví dụ

### Ứng dụng Chat RAG (Python)

**Kho lưu trữ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Dịch vụ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Mô tả**: Mẫu Azure AI phổ biến nhất — ứng dụng chat RAG sẵn sàng sản xuất cho phép bạn đặt câu hỏi trên tài liệu của chính bạn. Sử dụng GPT-4.1-mini cho chat, text-embedding-3-large cho embedding, và Azure AI Search để truy xuất. Hỗ trợ tài liệu đa phương tiện, nhập/xuất giọng nói, xác thực Microsoft Entra, và theo dõi Application Insights.

**Bắt đầu Nhanh**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Ứng dụng Chat RAG (.NET)

**Kho lưu trữ**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Dịch vụ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Mô tả**: Phiên bản .NET/C# tương đương của mẫu chat RAG Python. Xây dựng với ASP.NET Core Minimal API và frontend Blazor WebAssembly. Bao gồm chat giọng nói, hỗ trợ hình ảnh GPT-4o-mini, và client desktop/mobile .NET MAUI Blazor Hybrid đi kèm.

**Bắt đầu Nhanh**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Ứng dụng Chat RAG (Java)

**Kho lưu trữ**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Dịch vụ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Mô tả**: Phiên bản Java của mẫu chat RAG sử dụng Langchain4J cho điều phối AI. Hỗ trợ kiến trúc sự kiện vi dịch vụ, nhiều chiến lược tìm kiếm (văn bản, vector, kết hợp), tải tài liệu với Azure Document Intelligence, và triển khai trên Azure Container Apps hoặc Azure Kubernetes Service.

**Bắt đầu Nhanh**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilot Bán lẻ Doanh nghiệp với Microsoft Foundry

**Kho lưu trữ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Dịch vụ**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Mô tả**: Copilot RAG bán lẻ toàn diện sử dụng Microsoft Foundry và Prompty. Chatbot bán lẻ Contoso Outdoor dựa trên dữ liệu danh mục sản phẩm và đơn hàng khách hàng. Minh họa toàn bộ quy trình GenAIOps — tạo mẫu với Prompty, đánh giá với trình đánh giá AI hỗ trợ, và triển khai qua AZD lên Container Apps.

**Bắt đầu Nhanh**:
```bash
azd init --template contoso-chat
azd up
```

### Ứng dụng Viết Sáng tạo Đa Tác nhân

**Kho lưu trữ**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Dịch vụ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Mô tả**: Mẫu đa tác nhân minh họa điều phối tác nhân AI với Prompty. Sử dụng tác nhân nghiên cứu (Bing Grounding trong Azure AI Agent Service), tác nhân sản phẩm (Azure AI Search), tác nhân viết và tác nhân chỉnh sửa để cùng nhau tạo ra bài viết nghiên cứu kỹ. Bao gồm CI/CD với đánh giá trong GitHub Actions.

**Bắt đầu Nhanh**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Kho lưu trữ**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Dịch vụ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Mô tả**: Chatbot RAG hoàn toàn serverless sử dụng LangChain.js với Azure Functions cho API và Azure Static Web Apps để lưu trữ. Dùng Azure Cosmos DB làm kho vector và cơ sở dữ liệu lịch sử chat. Hỗ trợ phát triển cục bộ với Ollama để thử nghiệm miễn phí.

**Bắt đầu Nhanh**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Bộ Tăng tốc Giải pháp Chat với Dữ liệu của Bạn

**Kho lưu trữ**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Dịch vụ**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Mô tả**: Bộ tăng tốc giải pháp RAG chuẩn doanh nghiệp với cổng quản trị để tải lên/quản lý tài liệu, nhiều tùy chọn điều phối (Semantic Kernel, LangChain, Prompt Flow), chuyển giọng nói thành văn bản, tích hợp Microsoft Teams, và lựa chọn backend PostgreSQL hoặc Cosmos DB. Được thiết kế làm điểm khởi đầu tùy chỉnh cho kịch bản RAG sản xuất.

**Bắt đầu Nhanh**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Tác nhân Du lịch AI — Điều phối MCP Đa Tác nhân

**Kho lưu trữ**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Dịch vụ**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Mô tả**: Ứng dụng tham khảo điều phối đa tác nhân AI sử dụng ba framework (LangChain.js, LlamaIndex.TS, và Microsoft Agent Framework). Bao gồm MCP (Model Context Protocol) server trong bốn ngôn ngữ triển khai dạng serverless trên Azure Container Apps với giám sát OpenTelemetry.

**Bắt đầu Nhanh**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Kho lưu trữ**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Dịch vụ**: Dịch vụ Azure AI + Azure OpenAI

**Mô tả**: Mẫu Bicep tối giản triển khai dịch vụ AI Azure với mô hình học máy đã cấu hình. Điểm khởi đầu nhẹ nhàng khi bạn chỉ cần triển khai hạ tầng Azure AI mà không cần toàn bộ ngăn xếp ứng dụng.

**Bắt đầu Nhanh**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Xem thêm mẫu**: Ghé thăm [Bộ Sưu Tập Mẫu AZD AI Tuyệt vời](https://azure.github.io/awesome-azd/?tags=ai) với hơn 80 mẫu AZD chuyên biệt cho AI trên nhiều ngôn ngữ và kịch bản.

## Bước Tiếp theo

1. **Thử các Ví dụ**: Bắt đầu với mẫu dựng sẵn phù hợp với trường hợp sử dụng của bạn
2. **Tùy chỉnh theo Nhu cầu**: Chỉnh sửa hạ tầng và mã ứng dụng
3. **Thêm Giám sát**: Triển khai quan sát toàn diện
4. **Tối ưu Chi phí**: Điều chỉnh cấu hình theo ngân sách
5. **Bảo mật Triển khai**: Áp dụng các mẫu bảo mật doanh nghiệp
6. **Mở rộng đến Sản xuất**: Thêm tính năng đa vùng và khả năng sẵn sàng cao

## 🎯 Bài Tập Thực hành

### Bài tập 1: Triển khai Ứng dụng Chat Microsoft Foundry Models (30 phút)
**Mục tiêu**: Triển khai và kiểm thử ứng dụng chat AI sẵn sàng sản xuất

```bash
# Khởi tạo mẫu
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Thiết lập biến môi trường
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Triển khai
azd up

# Kiểm tra ứng dụng
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Giám sát hoạt động AI
azd monitor

# Dọn dẹp
azd down --force --purge
```

**Tiêu chí Thành công:**
- [ ] Triển khai hoàn tất không lỗi hạn mức
- [ ] Có thể truy cập giao diện chat trên trình duyệt
- [ ] Có thể đặt câu hỏi và nhận phản hồi AI
- [ ] Application Insights hiển thị dữ liệu telemety
- [ ] Đã dọn dẹp tài nguyên thành công

**Chi phí Ước tính**: 5-10 đô la cho 30 phút thử nghiệm

### Bài tập 2: Cấu hình Triển khai Đa Mô hình (45 phút)
**Mục tiêu**: Triển khai nhiều mô hình AI với cấu hình khác nhau

```bash
# Tạo cấu hình Bicep tùy chỉnh
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

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
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
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
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Triển khai và xác minh
azd provision
azd show
```

**Tiêu chí Thành công:**
- [ ] Nhiều mô hình được triển khai thành công
- [ ] Áp dụng các cài đặt năng lực khác nhau
- [ ] Mô hình có thể truy cập qua API
- [ ] Có thể gọi cả hai mô hình từ ứng dụng

### Bài tập 3: Thực hiện Giám sát Chi phí (20 phút)
**Mục tiêu**: Thiết lập cảnh báo ngân sách và theo dõi chi phí

```bash
# Thêm cảnh báo ngân sách vào Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
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
EOF

# Triển khai cảnh báo ngân sách
azd provision

# Kiểm tra chi phí hiện tại
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Tiêu chí Thành công:**
- [ ] Cảnh báo ngân sách được tạo trong Azure
- [ ] Đã cấu hình thông báo email
- [ ] Có thể xem dữ liệu chi phí trong Azure Portal
- [ ] Đã thiết lập ngưỡng ngân sách phù hợp

## 💡 Câu hỏi Thường Gặp

<details>
<summary><strong>Làm thế nào để giảm chi phí Microsoft Foundry Models trong quá trình phát triển?</strong></summary>

1. **Dùng tầng Miễn phí**: Microsoft Foundry Models cung cấp 50.000 token/tháng miễn phí
2. **Giảm năng lực**: Đặt năng lực xuống 10 TPM thay vì hơn 30 cho môi trường dev
3. **Dùng azd down**: Giải phóng tài nguyên khi không phát triển tích cực
4. **Bộ nhớ đệm Phản hồi**: Triển khai Redis cache cho các truy vấn lặp lại
5. **Dùng Kỹ thuật Prompt**: Giảm sử dụng token với các prompt hiệu quả


```bash
# Cấu hình phát triển
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Sự khác biệt giữa Microsoft Foundry Models và OpenAI API là gì?</strong></summary>

**Microsoft Foundry Models**:
- Bảo mật doanh nghiệp và tuân thủ
- Tích hợp mạng riêng
- Cam kết SLA
- Xác thực danh tính được quản lý
- Hạn mức cao hơn được cung cấp

**OpenAI API**:
- Truy cập nhanh hơn đến các mô hình mới
- Thiết lập đơn giản hơn
- Ngưỡng vào thấp hơn
- Chỉ sử dụng internet công cộng

Đối với các ứng dụng sản xuất, **khuyến nghị sử dụng Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Làm thế nào để xử lý lỗi vượt quá hạn mức của Microsoft Foundry Models?</strong></summary>

```bash
# Kiểm tra hạn mức hiện tại
az cognitiveservices usage list --location eastus2

# Thử khu vực khác
azd env set AZURE_LOCATION westus2
azd up

# Giảm công suất tạm thời
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Yêu cầu tăng hạn mức
# Vào Azure Portal > Quotas > Yêu cầu tăng hạn mức
```
</details>

<details>
<summary><strong>Tôi có thể sử dụng dữ liệu của riêng tôi với Microsoft Foundry Models không?</strong></summary>

Có! Sử dụng **Azure AI Search** cho RAG (Tạo tăng cường truy xuất):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Xem mẫu [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Làm thế nào để bảo mật các điểm cuối mô hình AI?</strong></summary>

**Thực tiễn tốt nhất**:
1. Sử dụng Managed Identity (không cần khóa API)
2. Kích hoạt Private Endpoints
3. Cấu hình nhóm bảo mật mạng
4. Thực hiện giới hạn tốc độ
5. Sử dụng Azure Key Vault để lưu trữ bí mật

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
- **Agent Skills**: [Kỹ năng Microsoft Foundry trên skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Cài đặt kỹ năng agent Azure + Foundry trong trình soạn thảo của bạn với lệnh `npx skills add microsoft/github-copilot-for-azure`

---

**Điều hướng Chương:**
- **📚 Trang Khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện tại**: Chương 2 - Phát triển AI-First
- **⬅️ Chương Trước**: [Chương 1: Dự án Đầu tiên của bạn](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp theo**: [Triển khai Mô hình AI](ai-model-deployment.md)
- **🚀 Chương Tiếp theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

**Cần giúp đỡ?** Tham gia thảo luận cộng đồng hoặc tạo một issue trong kho lưu trữ. Cộng đồng Azure AI + AZD luôn sẵn sàng giúp bạn thành công!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->