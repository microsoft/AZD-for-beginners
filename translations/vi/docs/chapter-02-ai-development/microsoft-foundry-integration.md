# Tích hợp Microsoft Foundry với AZD

**Chapter Navigation:**
- **📚 Trang Khóa Học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện Tại**: Chương 2 - Phát triển ưu tiên AI
- **⬅️ Chương Trước**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp theo**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Chương Tiếp Theo**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Tổng quan

Hướng dẫn này trình bày cách tích hợp dịch vụ Microsoft Foundry với Azure Developer CLI (AZD) để đơn giản hóa việc triển khai ứng dụng AI. Microsoft Foundry cung cấp một nền tảng toàn diện để xây dựng, triển khai và quản lý các ứng dụng AI, trong khi AZD đơn giản hóa quy trình hạ tầng và triển khai.

## Microsoft Foundry là gì?

Microsoft Foundry là nền tảng hợp nhất của Microsoft cho phát triển AI, bao gồm:

- **Model Catalog**: Truy cập các mô hình AI tiên tiến
- **Prompt Flow**: Trình thiết kế trực quan cho luồng công việc AI
- **Microsoft Foundry Portal**: Môi trường phát triển tích hợp cho ứng dụng AI
- **Deployment Options**: Nhiều tùy chọn lưu trữ và mở rộng
- **Safety and Security**: Các tính năng AI có trách nhiệm được tích hợp sẵn

## AZD + Microsoft Foundry: Tốt hơn khi kết hợp

| Tính năng | Microsoft Foundry | Lợi ích khi tích hợp với AZD |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Hạ tầng dưới dạng mã (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Yêu cầu tiên quyết

- Azure subscription với quyền phù hợp
- Đã cài Azure Developer CLI
- Quyền truy cập dịch vụ Microsoft Foundry Models
- Hiểu biết cơ bản về Microsoft Foundry

> **Mức cơ sở AZD hiện tại:** Các ví dụ này đã được kiểm tra với `azd` `1.23.12`. Đối với quy trình công việc đại lý AI, hãy dùng phiên bản extension xem trước hiện tại và kiểm tra phiên bản bạn đã cài trước khi bắt đầu.

## Các Mẫu Tích hợp Cốt lõi

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

### Mẫu 2: AI Search + RAG Integration

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

### Mẫu 3: Document Intelligence Integration

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

## 🔧 Các Mẫu Cấu hình

### Thiết lập Biến Môi trường

**Cấu hình Môi trường Sản xuất:**
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

**Cấu hình Môi trường Phát triển:**
```bash
# Cài đặt tối ưu chi phí cho phát triển
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Gói miễn phí
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

### Các tiện ích mở rộng AZD cho Foundry

AZD cung cấp các tiện ích mở rộng bổ sung khả năng chuyên biệt cho AI khi làm việc với dịch vụ Microsoft Foundry:

```bash
# Cài đặt tiện ích mở rộng Foundry agents
azd extension install azure.ai.agents

# Cài đặt tiện ích mở rộng tinh chỉnh
azd extension install azure.ai.finetune

# Cài đặt tiện ích mở rộng mô hình tùy chỉnh
azd extension install azure.ai.models

# Liệt kê các tiện ích mở rộng đã cài đặt
azd extension list --installed

# Kiểm tra phiên bản tiện ích mở rộng agent hiện đang được cài đặt
azd extension show azure.ai.agents
```

Các tiện ích mở rộng AI vẫn đang phát triển nhanh ở trạng thái xem trước. Nếu một lệnh hoạt động khác với mô tả ở đây, hãy nâng cấp extension liên quan trước khi khắc phục sự cố cho chính dự án.

### Triển khai ưu tiên đại lý với `azd ai`

Nếu bạn có manifest đại lý, sử dụng `azd ai agent init` để dựng khung một dự án kết nối với Foundry Agent Service:

```bash
# Khởi tạo từ manifest của agent
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Triển khai lên Azure
azd up
```

Các bản xem trước gần đây của `azure.ai.agents` cũng đã thêm hỗ trợ khởi tạo dựa trên mẫu cho `azd ai agent init`. Nếu bạn đang theo dõi các mẫu đại lý mới hơn, kiểm tra trợ giúp extension để biết các cờ chính xác có trong phiên bản đã cài của bạn.

Xem [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) để biết tham chiếu đầy đủ các lệnh và cờ.

### Triển khai bằng một lệnh

```bash
# Triển khai mọi thứ chỉ với một lệnh
azd up

# Hoặc triển khai từng bước
azd provision  # Chỉ cơ sở hạ tầng
azd deploy     # Chỉ ứng dụng

# Dành cho triển khai ứng dụng AI chạy lâu dài trên azd 1.23.11+
azd deploy --timeout 1800
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

## Tối ưu hiệu năng

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

## Khắc phục Sự cố Thường gặp

### Vấn đề 1: Vượt hạn mức OpenAI

**Triệu chứng:**
- Triển khai thất bại với lỗi quota
- Lỗi 429 trong nhật ký ứng dụng

**Giải pháp:**
```bash
# Kiểm tra mức sử dụng hạn ngạch hiện tại
az cognitiveservices usage list --location eastus

# Thử vùng khác
azd env set AZURE_LOCATION westus2
azd up

# Giảm dung lượng tạm thời
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Vấn đề 2: Lỗi xác thực

**Triệu chứng:**
- Lỗi 401/403 khi gọi dịch vụ AI
- Thông báo "Access denied"

**Giải pháp:**
```bash
# Xác minh phân công vai trò
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kiểm tra cấu hình danh tính được quản lý
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Xác minh truy cập Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Vấn đề 3: Sự cố Triển khai Mô hình

**Triệu chứng:**
- Mô hình không có trong triển khai
- Phiên bản mô hình cụ thể bị lỗi

**Giải pháp:**
```bash
# Liệt kê các mô hình có sẵn theo khu vực
az cognitiveservices model list --location eastus

# Cập nhật phiên bản mô hình trong mẫu bicep
# Kiểm tra yêu cầu về dung lượng của mô hình
```

## Mẫu Ví dụ

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: Mẫu Azure AI phổ biến nhất — một ứng dụng chat RAG sẵn sàng cho sản xuất cho phép bạn đặt câu hỏi trên các tài liệu của riêng bạn. Sử dụng GPT-4.1-mini cho chat, text-embedding-3-large cho embedding, và Azure AI Search cho truy hồi. Hỗ trợ tài liệu đa phương thức, nhập/xuất giọng nói, xác thực Microsoft Entra và theo dõi với Application Insights.

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Phiên bản .NET/C# tương đương của mẫu chat RAG Python. Xây dựng bằng ASP.NET Core Minimal API và frontend Blazor WebAssembly. Bao gồm chat bằng giọng nói, hỗ trợ GPT-4o-mini vision, và client .NET MAUI Blazor Hybrid cho desktop/mobile.

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Phiên bản Java của mẫu chat RAG sử dụng Langchain4J để điều phối AI. Hỗ trợ kiến trúc microservice hướng sự kiện, nhiều chiến lược tìm kiếm (text, vector, hybrid), tải lên tài liệu với Azure Document Intelligence, và triển khai trên Azure Container Apps hoặc Azure Kubernetes Service.

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: Copilot RAG bán lẻ đầu-cuối sử dụng Microsoft Foundry và Prompty. Một chatbot cho Contoso Outdoor giới thiệu câu trả lời dựa trên danh mục sản phẩm và dữ liệu đơn hàng của khách hàng. Minh họa quy trình GenAIOps đầy đủ — nguyên mẫu với Prompty, đánh giá với bộ đánh giá hỗ trợ AI, và triển khai qua AZD tới Container Apps.

**Bắt đầu nhanh**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Mẫu đa đại lý minh họa điều phối đại lý AI với Prompty. Sử dụng một đại lý nghiên cứu (Bing Grounding trong Azure AI Agent Service), một đại lý sản phẩm (Azure AI Search), một đại lý viết và một đại lý biên tập để cùng nhau tạo ra các bài báo được nghiên cứu kỹ lưỡng. Bao gồm CI/CD với đánh giá trong GitHub Actions.

**Bắt đầu nhanh**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: Chatbot RAG hoàn toàn serverless sử dụng LangChain.js với Azure Functions cho API và Azure Static Web Apps để lưu trữ. Sử dụng Azure Cosmos DB làm cả vector store và cơ sở dữ liệu lịch sử chat. Hỗ trợ phát triển cục bộ với Ollama để thử nghiệm miễn phí.

**Bắt đầu nhanh**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: Giải pháp RAG chuẩn doanh nghiệp với cổng quản trị cho tải lên/quản lý tài liệu, nhiều tùy chọn điều phối (Semantic Kernel, LangChain, Prompt Flow), chuyển giọng nói thành văn bản, tích hợp Microsoft Teams, và lựa chọn backend là PostgreSQL hoặc Cosmos DB. Thiết kế như điểm khởi đầu có thể tùy chỉnh cho các kịch bản RAG sản xuất.

**Bắt đầu nhanh**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: Ứng dụng tham khảo cho điều phối đa đại lý AI sử dụng ba framework (LangChain.js, LlamaIndex.TS, và Microsoft Agent Framework). Có các máy chủ MCP (Model Context Protocol) bằng bốn ngôn ngữ triển khai dưới dạng Azure Container Apps serverless với giám sát OpenTelemetry.

**Bắt đầu nhanh**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: Mẫu Bicep tối giản triển khai dịch vụ Azure AI với các mô hình máy học được cấu hình. Điểm khởi đầu nhẹ khi bạn chỉ cần cấp phát hạ tầng Azure AI mà không cần toàn bộ stack ứng dụng.

**Bắt đầu nhanh**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Duyệt thêm mẫu**: Truy cập [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) để xem hơn 80+ mẫu AZD chuyên cho AI theo ngôn ngữ và kịch bản.

## Bước tiếp theo

1. **Thử các ví dụ**: Bắt đầu với một mẫu có sẵn phù hợp với trường hợp sử dụng của bạn
2. **Tùy chỉnh theo nhu cầu của bạn**: Chỉnh sửa hạ tầng và mã ứng dụng
3. **Thêm Giám sát**: Triển khai khả năng quan sát toàn diện
4. **Tối ưu chi phí**: Tinh chỉnh cấu hình theo ngân sách của bạn
5. **Bảo mật Triển khai của bạn**: Áp dụng các mẫu bảo mật doanh nghiệp
6. **Mở rộng lên Production**: Thêm tính năng đa vùng và khả năng sẵn sàng cao

## 🎯 Bài tập Thực hành

### Bài tập 1: Triển khai Ứng dụng Chat Microsoft Foundry Models (30 phút)
**Mục tiêu**: Triển khai và kiểm thử ứng dụng chat AI sẵn sàng cho sản xuất

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
- [ ] Triển khai hoàn tất mà không lỗi quota
- [ ] Có thể truy cập giao diện chat trên trình duyệt
- [ ] Có thể đặt câu hỏi và nhận phản hồi do AI hỗ trợ
- [ ] Application Insights hiển thị dữ liệu đo đạc
- [ ] Đã dọn dẹp tài nguyên thành công

**Chi phí Ước tính**: $5-10 cho 30 phút thử nghiệm

### Bài tập 2: Cấu hình Triển khai Nhiều Mô hình (45 phút)
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
- [ ] Áp dụng các thiết lập công suất khác nhau
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

## 💡 Câu hỏi Thường gặp

<details>
<summary><strong>Làm thế nào để giảm chi phí Microsoft Foundry Models trong quá trình phát triển?</strong></summary>

1. **Sử dụng gói miễn phí**: Microsoft Foundry Models cung cấp 50,000 tokens/tháng miễn phí
2. **Giảm công suất**: Đặt công suất về 10 TPM thay vì 30+ cho môi trường phát triển
3. **Sử dụng azd down**: Giải phóng tài nguyên khi không phát triển tích cực
4. **Lưu cache Phản hồi**: Triển khai cache Redis cho các truy vấn lặp lại
5. **Sử dụng Kỹ thuật Prompt**: Giảm lượng token sử dụng bằng các prompt hiệu quả


```bash
# Cấu hình phát triển
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Sự khác biệt giữa Microsoft Foundry Models và OpenAI API là gì?</strong></summary>

**Microsoft Foundry Models**:
- Bảo mật và tuân thủ doanh nghiệp
- Tích hợp mạng riêng
- Cam kết SLA
- Xác thực bằng Managed Identity
- Hạn mức cao hơn có sẵn

**OpenAI API**:
- Truy cập nhanh hơn tới các mô hình mới
- Thiết lập đơn giản hơn
- Rào cản gia nhập thấp hơn
- Chỉ qua internet công cộng

Đối với ứng dụng sản xuất, **khuyến nghị sử dụng Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Làm thế nào tôi xử lý lỗi vượt hạn mức (quota) của Microsoft Foundry Models?</strong></summary>

```bash
# Kiểm tra hạn mức hiện tại
az cognitiveservices usage list --location eastus2

# Thử vùng khác
azd env set AZURE_LOCATION westus2
azd up

# Giảm công suất tạm thời
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Yêu cầu tăng hạn mức
# Đi tới Azure Portal > Hạn mức > Yêu cầu tăng
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
<summary><strong>Làm thế nào để tôi bảo mật các endpoint mô hình AI?</strong></summary>

**Thực hành tốt nhất**:
1. Sử dụng Managed Identity (không dùng API keys)
2. Bật Private Endpoints
3. Cấu hình network security groups
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

- **Microsoft Foundry Discord**: [#kênh Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Tài liệu chính thức](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Cài đặt các kỹ năng tác nhân Azure + Foundry trong trình soạn thảo của bạn bằng `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chương 2 - Phát triển ưu tiên AI
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Need Help?** Tham gia thảo luận cộng đồng của chúng tôi hoặc mở một issue trong kho lưu trữ. Cộng đồng Azure AI + AZD ở đây để giúp bạn thành công!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->