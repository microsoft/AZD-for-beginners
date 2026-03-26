# Tích hợp Microsoft Foundry với AZD

**Chapter Navigation:**
- **📚 Trang Khóa Học**: [AZD Dành cho Người Mới](../../README.md)
- **📖 Chương Hiện Tại**: Chương 2 - Phát triển Ưu tiên AI
- **⬅️ Chương Trước**: [Chương 1: Dự Án Đầu Tiên của Bạn](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp Theo**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Chương Tiếp Theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

## Tổng quan

Hướng dẫn này trình bày cách tích hợp dịch vụ Microsoft Foundry với Azure Developer CLI (AZD) để triển khai ứng dụng AI một cách tinh gọn. Microsoft Foundry cung cấp nền tảng toàn diện để xây dựng, triển khai và quản lý ứng dụng AI, trong khi AZD đơn giản hóa quy trình hạ tầng và triển khai.

## Microsoft Foundry là gì?

Microsoft Foundry là nền tảng hợp nhất của Microsoft cho phát triển AI, bao gồm:

- **Danh mục Mô hình**: Truy cập các mô hình AI tiên tiến
- **Prompt Flow**: Trình thiết kế trực quan cho luồng công việc AI
- **Microsoft Foundry Portal**: Môi trường phát triển tích hợp cho ứng dụng AI
- **Tùy chọn Triển khai**: Nhiều lựa chọn lưu trữ và mở rộng
- **Tính an toàn và bảo mật**: Các tính năng AI có trách nhiệm được tích hợp sẵn

## AZD + Microsoft Foundry: Tốt hơn khi dùng cùng nhau

| Tính năng | Microsoft Foundry | Lợi ích tích hợp với AZD |
|---------|-----------------|------------------------|
| **Triển khai Mô hình** | Triển khai thủ công qua portal | Triển khai tự động, dễ lặp lại |
| **Hạ tầng** | Cấp phát qua giao diện bấm chuột | Hạ tầng như Mã (Bicep) |
| **Quản lý Môi trường** | Tập trung vào một môi trường duy nhất | Đa môi trường (dev/staging/prod) |
| **Tích hợp CI/CD** | Hạn chế | Hỗ trợ GitHub Actions gốc |
| **Quản lý Chi phí** | Giám sát cơ bản | Tối ưu chi phí theo môi trường |

## Yêu cầu trước

- Đăng ký Azure với quyền phù hợp
- Cài đặt Azure Developer CLI
- Truy cập dịch vụ Microsoft Foundry Models
- Hiểu biết cơ bản về Microsoft Foundry

## Các Mẫu Tích hợp Chính

### Mẫu 1: Tích hợp Microsoft Foundry Models

**Trường hợp sử dụng**: Triển khai ứng dụng chat với các mô hình Microsoft Foundry Models

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
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Mẫu 2: Tích hợp AI Search + RAG

**Trường hợp sử dụng**: Triển khai các ứng dụng retrieval-augmented generation (RAG)

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

### Mẫu 3: Tích hợp Document Intelligence

**Trường hợp sử dụng**: Các luồng công việc xử lý và phân tích tài liệu

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

### Cấu hình Biến Môi trường

**Cấu hình Sản xuất:**
```bash
# Các dịch vụ AI cốt lõi
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Cấu hình mô hình
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

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

## Luồng Công việc Triển khai

### Tiện ích mở rộng AZD cho Foundry

AZD cung cấp các tiện ích mở rộng thêm các khả năng chuyên cho AI để làm việc với dịch vụ Microsoft Foundry:

```bash
# Cài đặt tiện ích mở rộng Foundry agents
azd extension install azure.ai.agents

# Cài đặt tiện ích mở rộng tinh chỉnh
azd extension install azure.ai.finetune

# Cài đặt tiện ích mở rộng mô hình tùy chỉnh
azd extension install azure.ai.models

# Liệt kê các tiện ích mở rộng đã cài đặt
azd extension list
```

### Triển khai theo hướng Agent với `azd ai`

Nếu bạn có một agent manifest, dùng `azd ai agent init` để tạo khung dự án kết nối tới Foundry Agent Service:

```bash
# Khởi tạo từ tệp manifest của agent
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Triển khai lên Azure
azd up
```

Xem [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) để biết tham chiếu đầy đủ về lệnh và cờ.

### Triển khai bằng Một Lệnh

```bash
# Triển khai mọi thứ bằng một lệnh
azd up

# Hoặc triển khai từng bước
azd provision  # Chỉ cơ sở hạ tầng
azd deploy     # Chỉ ứng dụng
```

### Triển khai theo Môi trường

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

## Giám sát và Khả năng quan sát

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

## 🔐 Các Thực hành Bảo mật Tốt nhất

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

### Chiến lược Caching

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

## Khắc phục Sự cố Thường gặp

### Vấn đề 1: Vượt Quota OpenAI

**Triệu chứng:**
- Triển khai thất bại với lỗi quota
- Lỗi 429 trong nhật ký ứng dụng

**Giải pháp:**
```bash
# Kiểm tra mức sử dụng hạn ngạch hiện tại
az cognitiveservices usage list --location eastus

# Thử khu vực khác
azd env set AZURE_LOCATION westus2
azd up

# Giảm công suất tạm thời
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Vấn đề 2: Lỗi Xác thực

**Triệu chứng:**
- Lỗi 401/403 khi gọi dịch vụ AI
- Thông báo "Access denied"

**Giải pháp:**
```bash
# Xác minh việc gán vai trò
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kiểm tra cấu hình định danh được quản lý
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Xác minh quyền truy cập Key Vault
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

# Cập nhật phiên bản mô hình trong mẫu Bicep
# Kiểm tra yêu cầu công suất của mô hình
```

## Mẫu Ví dụ

### Ứng dụng Chat RAG (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Mô tả**: Mẫu Azure AI phổ biến nhất — một ứng dụng chat RAG sẵn sàng sản xuất cho phép bạn hỏi câu hỏi dựa trên tài liệu của riêng bạn. Sử dụng GPT-4.1-mini cho chat, text-embedding-ada-002 cho embeddings, và Azure AI Search cho truy hồi. Hỗ trợ tài liệu đa phương thức, nhập/xuất giọng nói, xác thực Microsoft Entra, và theo dõi bằng Application Insights.

**Bắt đầu Nhanh**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Ứng dụng Chat RAG (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Mô tả**: Phiên bản .NET/C# tương đương của mẫu chat RAG Python. Xây dựng với ASP.NET Core Minimal API và frontend Blazor WebAssembly. Bao gồm chat bằng giọng nói, hỗ trợ GPT-4o-mini vision, và ứng dụng .NET MAUI Blazor Hybrid dành cho desktop/mobile đi kèm.

**Bắt đầu Nhanh**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Ứng dụng Chat RAG (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Mô tả**: Phiên bản Java của mẫu chat RAG sử dụng Langchain4J cho điều phối AI. Hỗ trợ kiến trúc microservice hướng sự kiện, nhiều chiến lược tìm kiếm (văn bản, vector, hybrid), tải lên tài liệu với Azure Document Intelligence, và triển khai trên Azure Container Apps hoặc Azure Kubernetes Service.

**Bắt đầu Nhanh**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot với Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Mô tả**: Copilot bán lẻ end-to-end dùng RAG với Azure AI Foundry và Prompty. Chatbot của Contoso Outdoor gắn câu trả lời vào catalog sản phẩm và dữ liệu đơn hàng khách hàng. Minh họa toàn bộ quy trình GenAIOps — prototype với Prompty, đánh giá bằng các bộ đánh giá trợ giúp AI, và triển khai qua AZD lên Container Apps.

**Bắt đầu Nhanh**:
```bash
azd init --template contoso-chat
azd up
```

### Ứng dụng Viết Sáng tạo Đa-Agent

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Mô tả**: Mẫu đa-agent minh họa điều phối agent AI với Prompty. Sử dụng một agent nghiên cứu (Bing Grounding trong Azure AI Agent Service), một agent sản phẩm (Azure AI Search), một agent viết, và một agent biên tập để hợp tác sản xuất các bài viết có nghiên cứu kỹ. Bao gồm CI/CD với đánh giá trong GitHub Actions.

**Bắt đầu Nhanh**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Mô tả**: Chatbot RAG hoàn toàn serverless sử dụng LangChain.js với Azure Functions cho API và Azure Static Web Apps để lưu trữ. Sử dụng Azure Cosmos DB làm cả vector store và cơ sở dữ liệu lịch sử chat. Hỗ trợ phát triển cục bộ với Ollama để thử nghiệm không tốn chi phí.

**Bắt đầu Nhanh**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Mô tả**: Bộ tăng tốc giải pháp RAG cấp doanh nghiệp với cổng quản trị tải lên/quản lý tài liệu, nhiều tùy chọn orchestrator (Semantic Kernel, LangChain, Prompt Flow), chuyển giọng nói sang văn bản, tích hợp Microsoft Teams, và lựa chọn backend PostgreSQL hoặc Cosmos DB. Thiết kế như điểm khởi đầu có thể tùy chỉnh cho các kịch bản RAG sản xuất.

**Bắt đầu Nhanh**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Điều phối MCP đa-agent

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Mô tả**: Ứng dụng tham khảo cho điều phối AI đa-agent sử dụng ba framework (LangChain.js, LlamaIndex.TS, và Microsoft Agent Framework). Có các server MCP (Model Context Protocol) bằng bốn ngôn ngữ được triển khai dưới dạng Azure Container Apps serverless với giám sát OpenTelemetry.

**Bắt đầu Nhanh**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Mô tả**: Mẫu Bicep tối giản triển khai các dịch vụ Azure AI với các mô hình máy học được cấu hình. Điểm khởi đầu nhẹ khi bạn chỉ cần hạ tầng Azure AI được provision mà không cần toàn bộ stack ứng dụng.

**Bắt đầu Nhanh**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Duyệt thêm mẫu**: Truy cập [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) để xem hơn 80 mẫu AZD chuyên cho AI trên nhiều ngôn ngữ và kịch bản.

## Bước tiếp theo

1. **Thử các ví dụ**: Bắt đầu với một mẫu đã xây dựng sẵn phù hợp với trường hợp sử dụng của bạn
2. **Tùy chỉnh theo nhu cầu**: Chỉnh sửa hạ tầng và mã ứng dụng
3. **Thêm Giám sát**: Triển khai khả năng quan sát toàn diện
4. **Tối ưu Chi phí**: Điều chỉnh cấu hình theo ngân sách
5. **Bảo mật Triển khai của bạn**: Áp dụng các mẫu bảo mật doanh nghiệp
6. **Mở rộng lên Sản xuất**: Thêm tính năng đa vùng và tính khả dụng cao

## 🎯 Bài Tập Thực hành

### Bài tập 1: Triển khai Ứng dụng Chat Microsoft Foundry Models (30 phút)
**Mục tiêu**: Triển khai và kiểm thử một ứng dụng chat AI sẵn sàng cho sản xuất

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
- [ ] Triển khai hoàn tất mà không gặp lỗi quota
- [ ] Có thể truy cập giao diện chat trên trình duyệt
- [ ] Có thể đặt câu hỏi và nhận phản hồi do AI cung cấp
- [ ] Application Insights hiển thị dữ liệu telemetry
- [ ] Đã dọn dẹp tài nguyên thành công

**Chi phí ước tính**: $5-10 cho 30 phút thử nghiệm

### Bài tập 2: Cấu hình Triển khai Đa Mô hình (45 phút)
**Mục tiêu**: Triển khai nhiều mô hình AI với các cấu hình khác nhau

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
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
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
- [ ] Áp dụng các cài đặt công suất khác nhau
- [ ] Mô hình có thể truy cập qua API
- [ ] Có thể gọi cả hai mô hình từ ứng dụng

### Bài tập 3: Triển khai Giám sát Chi phí (20 phút)
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
- [ ] Cấu hình thông báo email
- [ ] Có thể xem dữ liệu chi phí trong Azure Portal
- [ ] Ngưỡng ngân sách được đặt phù hợp

## 💡 Câu hỏi Thường Gặp

<details>
<summary><strong>Làm thế nào để giảm chi phí Microsoft Foundry Models trong quá trình phát triển?</strong></summary>

1. **Sử dụng Tầng Miễn phí**: Microsoft Foundry Models cung cấp 50.000 tokens/tháng miễn phí
2. **Giảm Công suất**: Đặt công suất về 10 TPM thay vì 30+ cho môi trường dev
3. **Sử dụng azd down**: Giải phóng tài nguyên khi không phát triển tích cực
4. **Cache Phản hồi**: Triển khai Redis cache cho các truy vấn lặp lại
5. **Sử dụng Prompt Engineering**: Giảm sử dụng token bằng các prompt hiệu quả

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
- Xác thực bằng managed identity
- Có sẵn quota cao hơn

**OpenAI API**:
- Truy cập nhanh hơn các mô hình mới
- Thiết lập đơn giản hơn
- Rào cản gia nhập thấp hơn
- Chỉ qua internet công khai

Đối với ứng dụng sản xuất, **Microsoft Foundry Models được khuyến nghị**.
</details>

<details>
<summary><strong>Làm sao để xử lý lỗi vượt quá hạn mức (quota) của Microsoft Foundry Models?</strong></summary>

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
# Đi tới Cổng thông tin Azure > Hạn mức > Yêu cầu tăng
```
</details>

<details>
<summary><strong>Tôi có thể sử dụng dữ liệu của riêng mình với Microsoft Foundry Models không?</strong></summary>

Có! Sử dụng **Azure AI Search** cho RAG (Retrieval Augmented Generation):

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
<summary><strong>Làm thế nào để bảo mật các endpoint mô hình AI?</strong></summary>

**Thực hành tốt nhất**:
1. Sử dụng Managed Identity (không dùng khóa API)
2. Kích hoạt Private Endpoints
3. Cấu hình Network Security Groups
4. Thực hiện giới hạn tốc độ (rate limiting)
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

- **Microsoft Foundry Discord**: [#Kênh Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues và thảo luận](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Tài liệu chính thức](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Kỹ năng Microsoft Foundry trên skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Cài đặt kỹ năng agent Azure + Foundry trong trình chỉnh sửa của bạn bằng `npx skills add microsoft/github-copilot-for-azure`

---

**Điều hướng chương:**
- **📚 Trang chính khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển ưu tiên AI
- **⬅️ Chương trước**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp theo**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Chương tiếp theo**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Cần trợ giúp?** Tham gia các thảo luận cộng đồng hoặc mở một issue trong kho lưu trữ. Cộng đồng Azure AI + AZD ở đây để giúp bạn thành công!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố từ chối trách nhiệm**:
Văn bản này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc thiếu sót. Văn bản gốc bằng ngôn ngữ gốc của nó nên được coi là nguồn chính xác và có thẩm quyền. Đối với những thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ hiểu lầm hay diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->