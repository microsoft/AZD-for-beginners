# Microsoft Foundry Integration with AZD

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển ưu tiên AI
- **⬅️ Chương trước**: [Chương 1: Dự án đầu tiên của bạn](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp theo**: [Triển khai mô hình AI](ai-model-deployment.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

## Tổng quan

Hướng dẫn này trình bày cách tích hợp dịch vụ Microsoft Foundry với Azure Developer CLI (AZD) để triển khai ứng dụng AI một cách đơn giản hóa. Microsoft Foundry cung cấp một nền tảng toàn diện để xây dựng, triển khai và quản lý ứng dụng AI, trong khi AZD đơn giản hóa quy trình hạ tầng và triển khai.

## Microsoft Foundry là gì?

Microsoft Foundry là nền tảng hợp nhất của Microsoft cho phát triển AI, bao gồm:

- **Model Catalog**: Truy cập các mô hình AI hiện đại
- **Prompt Flow**: Trình thiết kế trực quan cho các luồng công việc AI
- **Microsoft Foundry Portal**: Môi trường phát triển tích hợp cho các ứng dụng AI
- **Deployment Options**: Nhiều tùy chọn lưu trữ và mở rộng
- **Safety and Security**: Các tính năng AI có trách nhiệm tích hợp sẵn

## AZD + Microsoft Foundry: Tốt hơn khi kết hợp

| Tính năng | Microsoft Foundry | Lợi ích tích hợp với AZD |
|---------|-----------------|------------------------|
| **Model Deployment** | Triển khai thủ công qua cổng | Triển khai tự động, có thể lặp lại |
| **Infrastructure** | Cấp phát qua giao diện nhấp chuột | Hạ tầng như mã (Bicep) |
| **Environment Management** | Tập trung một môi trường | Nhiều môi trường (dev/staging/prod) |
| **CI/CD Integration** | Hạn chế | Hỗ trợ GitHub Actions nguyên bản |
| **Cost Management** | Giám sát cơ bản | Tối ưu chi phí theo môi trường |

## Yêu cầu

- Azure subscription với quyền phù hợp
- Đã cài đặt Azure Developer CLI
- Quyền truy cập dịch vụ Microsoft Foundry Models
- Hiểu biết cơ bản về Microsoft Foundry

> **Cơ sở AZD hiện tại:** Những ví dụ này được kiểm tra với `azd` `1.23.12`. Đối với luồng công việc agent AI, hãy sử dụng phiên bản mở rộng xem trước hiện tại và kiểm tra phiên bản bạn đã cài trước khi bắt đầu.

## Các mẫu tích hợp chính

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

**Trường hợp sử dụng**: Triển khai ứng dụng retrieval-augmented generation (RAG)

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

## 🔧 Các mẫu cấu hình

### Thiết lập biến môi trường

**Cấu hình Production:**
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

**Cấu hình Development:**
```bash
# Cài đặt tối ưu chi phí cho phát triển
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Gói miễn phí
```

### Cấu hình bảo mật với Key Vault

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

## Luồng triển khai

### Tiện ích mở rộng AZD cho Foundry

AZD cung cấp các tiện ích mở rộng bổ sung khả năng chuyên biệt cho AI để làm việc với dịch vụ Microsoft Foundry:

```bash
# Cài đặt tiện ích mở rộng Foundry agents
azd extension install azure.ai.agents

# Cài đặt tiện ích mở rộng tinh chỉnh
azd extension install azure.ai.finetune

# Cài đặt tiện ích mở rộng mô hình tùy chỉnh
azd extension install azure.ai.models

# Liệt kê các tiện ích mở rộng đã cài đặt
azd extension list --installed

# Kiểm tra phiên bản của tiện ích mở rộng tác nhân đang được cài đặt
azd extension show azure.ai.agents
```

Các tiện ích mở rộng AI vẫn đang phát triển nhanh trong giai đoạn xem trước. Nếu một lệnh hoạt động khác so với mô tả ở đây, hãy nâng cấp tiện ích mở rộng tương ứng trước khi khắc phục sự cố dự án.

### Triển khai theo Agent với `azd ai`

Nếu bạn có manifest agent, sử dụng `azd ai agent init` để tạo khung dự án được kết nối với Foundry Agent Service:

```bash
# Khởi tạo từ manifest của tác nhân
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Triển khai lên Azure
azd up
```

Các bản xem trước gần đây của `azure.ai.agents` cũng đã thêm hỗ trợ khởi tạo theo mẫu cho `azd ai agent init`. Nếu bạn đang theo các mẫu agent mới hơn, hãy kiểm tra trợ giúp của tiện ích mở rộng để biết các cờ chính xác có trong phiên bản bạn đã cài.

Xem [Các lệnh AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) để biết tham chiếu đầy đủ về lệnh và cờ.

### Triển khai bằng một lệnh duy nhất

```bash
# Triển khai mọi thứ bằng một lệnh
azd up

# Hoặc triển khai theo từng bước
azd provision  # Chỉ cơ sở hạ tầng
azd deploy     # Chỉ ứng dụng

# Dành cho các triển khai ứng dụng AI chạy trong thời gian dài trong azd 1.23.11+
azd deploy --timeout 1800
```

### Triển khai theo môi trường

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

## Giám sát và khả năng quan sát

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

### Giám sát chi phí

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

## 🔐 Các thực hành bảo mật tốt nhất

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

### Bảo mật mạng

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

### Chiến lược lưu đệm

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

### Cấu hình tự động mở rộng

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

## Khắc phục sự cố thường gặp

### Vấn đề 1: Vượt quá hạn mức OpenAI

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

# Giảm công suất tạm thời
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Vấn đề 2: Lỗi xác thực

**Triệu chứng:**
- Lỗi 401/403 khi gọi dịch vụ AI
- Thông báo "Access denied"

**Giải pháp:**
```bash
# Xác minh gán vai trò
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kiểm tra cấu hình danh tính được quản lý
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Xác minh quyền truy cập Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Vấn đề 3: Sự cố triển khai mô hình

**Triệu chứng:**
- Mô hình không khả dụng trong triển khai
- Các phiên bản mô hình cụ thể thất bại

**Giải pháp:**
```bash
# Liệt kê các mô hình có sẵn theo khu vực
az cognitiveservices model list --location eastus

# Cập nhật phiên bản mô hình trong mẫu bicep
# Kiểm tra yêu cầu dung lượng của mô hình
```

## Mẫu ví dụ

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: Mẫu Azure AI phổ biến nhất — một ứng dụng chat RAG sẵn sàng cho sản xuất cho phép bạn đặt câu hỏi trên chính tài liệu của mình. Sử dụng GPT-4.1-mini cho chat, text-embedding-3-large cho embeddings, và Azure AI Search để truy hồi. Hỗ trợ tài liệu đa phương thức, nhập/xuất âm thanh, xác thực Microsoft Entra và theo dõi Application Insights.

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Phiên bản .NET/C# tương đương của mẫu RAG chat bằng Python. Xây dựng với ASP.NET Core Minimal API và front-end Blazor WebAssembly. Bao gồm chat bằng giọng nói, hỗ trợ GPT-4o-mini vision và ứng dụng desktop/mobile .NET MAUI Blazor Hybrid kèm theo.

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Phiên bản Java của mẫu RAG chat sử dụng Langchain4J cho điều phối AI. Hỗ trợ kiến trúc microservice theo sự kiện, nhiều chiến lược tìm kiếm (text, vector, hybrid), tải tài liệu với Azure Document Intelligence và triển khai trên Azure Container Apps hoặc Azure Kubernetes Service.

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: Copilot bán lẻ RAG đầu cuối sử dụng Azure AI Foundry và Prompty. Một chatbot cho Contoso Outdoor hỗ trợ trả lời dựa trên danh mục sản phẩm và dữ liệu đơn hàng khách hàng. Minh họa toàn bộ luồng GenAIOps — nguyên mẫu với Prompty, đánh giá với các bộ đánh giá hỗ trợ AI, và triển khai qua AZD tới Container Apps.

**Bắt đầu nhanh**:
```bash
azd init --template contoso-chat
azd up
```

### Ứng dụng đa-agent viết sáng tạo

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Mẫu đa-agent minh họa điều phối agent AI với Prompty. Sử dụng một agent nghiên cứu (Bing Grounding trong Azure AI Agent Service), một agent sản phẩm (Azure AI Search), một agent viết và một agent biên tập để phối hợp tạo ra các bài viết nghiên cứu kỹ lưỡng. Bao gồm CI/CD với đánh giá trong GitHub Actions.

**Bắt đầu nhanh**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: Chatbot RAG hoàn toàn serverless sử dụng LangChain.js với Azure Functions cho API và Azure Static Web Apps để lưu trữ. Sử dụng Azure Cosmos DB vừa làm vector store vừa làm cơ sở dữ liệu lịch sử chat. Hỗ trợ phát triển cục bộ với Ollama để thử nghiệm không tốn chi phí.

**Bắt đầu nhanh**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: Bộ tăng tốc giải pháp RAG cấp doanh nghiệp với cổng quản trị để tải/quản lý tài liệu, nhiều tùy chọn điều phối (Semantic Kernel, LangChain, Prompt Flow), chuyển giọng nói sang văn bản, tích hợp Microsoft Teams và lựa chọn backend PostgreSQL hoặc Cosmos DB. Thiết kế như điểm khởi đầu có thể tùy chỉnh cho các kịch bản RAG sản xuất.

**Bắt đầu nhanh**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: Ứng dụng tham chiếu cho điều phối đa-agent AI sử dụng ba framework (LangChain.js, LlamaIndex.TS, và Microsoft Agent Framework). Có các server MCP (Model Context Protocol) bằng bốn ngôn ngữ được triển khai như Azure Container Apps serverless với giám sát OpenTelemetry.

**Bắt đầu nhanh**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: Mẫu Bicep tối thiểu triển khai dịch vụ Azure AI với các mô hình máy học đã cấu hình. Điểm khởi đầu nhẹ khi bạn chỉ cần provision hạ tầng Azure AI mà không cần toàn bộ ngăn xếp ứng dụng.

**Bắt đầu nhanh**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Duyệt thêm mẫu**: Truy cập [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) để xem hơn 80 mẫu AZD chuyên cho AI trên nhiều ngôn ngữ và kịch bản.

## Bước tiếp theo

1. **Thử các ví dụ**: Bắt đầu với một mẫu có sẵn phù hợp với trường hợp sử dụng của bạn
2. **Tùy chỉnh theo nhu cầu**: Sửa đổi hạ tầng và mã ứng dụng
3. **Thêm giám sát**: Triển khai khả năng quan sát toàn diện
4. **Tối ưu chi phí**: Tinh chỉnh cấu hình theo ngân sách của bạn
5. **Bảo mật triển khai**: Áp dụng các mô hình bảo mật doanh nghiệp
6. **Mở rộng tới sản xuất**: Thêm tính năng đa vùng và khả năng sẵn sàng cao

## 🎯 Bài tập thực hành

### Bài tập 1: Triển khai ứng dụng chat với Microsoft Foundry Models (30 phút)
**Mục tiêu**: Triển khai và kiểm thử ứng dụng chat AI sẵn sàng cho sản xuất

```bash
# Khởi tạo mẫu
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Đặt biến môi trường
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Triển khai
azd up

# Kiểm thử ứng dụng
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Giám sát hoạt động AI
azd monitor

# Dọn dẹp
azd down --force --purge
```

**Tiêu chí thành công:**
- [ ] Triển khai hoàn tất mà không gặp lỗi hạn mức
- [ ] Có thể truy cập giao diện chat trên trình duyệt
- [ ] Có thể đặt câu hỏi và nhận phản hồi do AI cung cấp
- [ ] Application Insights hiển thị dữ liệu telemetri
- [ ] Đã dọn dẹp tài nguyên thành công

**Chi phí ước tính**: $5-10 cho 30 phút thử nghiệm

### Bài tập 2: Cấu hình triển khai đa mô hình (45 phút)
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

**Tiêu chí thành công:**
- [ ] Nhiều mô hình được triển khai thành công
- [ ] Áp dụng các thiết lập công suất khác nhau
- [ ] Mô hình có thể truy cập qua API
- [ ] Có thể gọi cả hai mô hình từ ứng dụng

### Bài tập 3: Thiết lập giám sát chi phí (20 phút)
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

**Tiêu chí thành công:**
- [ ] Cảnh báo ngân sách được tạo trong Azure
- [ ] Cấu hình nhận thông báo qua email
- [ ] Có thể xem dữ liệu chi phí trong Azure Portal
- [ ] Ngưỡng ngân sách được đặt phù hợp

## 💡 Câu hỏi thường gặp

<details>
<summary><strong>Làm thế nào để giảm chi phí Microsoft Foundry Models trong quá trình phát triển?</strong></summary>

1. **Sử dụng tầng miễn phí**: Microsoft Foundry Models cung cấp 50,000 token/tháng miễn phí
2. **Giảm công suất**: Đặt công suất thành 10 TPM thay vì 30+ cho môi trường phát triển
3. **Sử dụng azd down**: Giải phóng tài nguyên khi không phát triển tích cực
4. **Lưu cache phản hồi**: Triển khai Redis cache cho các truy vấn lặp lại
5. **Sử dụng kỹ thuật thiết kế prompt**: Giảm sử dụng token bằng các prompt hiệu quả


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
- Xác thực Managed Identity
- Hạn mức cao hơn

**OpenAI API**:
- Truy cập nhanh hơn vào các mô hình mới
- Thiết lập đơn giản hơn
- Ngưỡng gia nhập thấp hơn
- Chỉ qua Internet công cộng

Đối với ứng dụng sản xuất, **Microsoft Foundry Models được khuyến nghị**.
</details>

<details>
<summary><strong>Làm thế nào để xử lý lỗi vượt hạn mức của Microsoft Foundry Models?</strong></summary>

```bash
# Kiểm tra hạn mức hiện tại
az cognitiveservices usage list --location eastus2

# Thử khu vực khác
azd env set AZURE_LOCATION westus2
azd up

# Giảm dung lượng tạm thời
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Yêu cầu tăng hạn mức
# Đi tới Azure Portal > Hạn mức > Yêu cầu tăng
```
</details>

<details>
<summary><strong>Tôi có thể sử dụng dữ liệu riêng của mình với Microsoft Foundry Models không?</strong></summary>

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
<summary><strong>Làm thế nào để bảo mật các endpoint của mô hình AI?</strong></summary>

**Thực hành tốt nhất**:
1. Sử dụng Managed Identity (không dùng API keys)
2. Bật Private Endpoints
3. Cấu hình network security groups
4. Áp dụng giới hạn tần suất (rate limiting)
5. Sử dụng Azure Key Vault để quản lý bí mật

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
- **Agent Skills**: [Kỹ năng Microsoft Foundry trên skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Cài đặt kỹ năng agent Azure + Foundry trong trình soạn thảo của bạn bằng `npx skills add microsoft/github-copilot-for-azure`

---

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển lấy AI làm trung tâm
- **⬅️ Chương trước**: [Chương 1: Dự án đầu tiên của bạn](../chapter-01-foundation/first-project.md)
- **➡️ Tiếp theo**: [Triển khai mô hình AI](ai-model-deployment.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../chapter-03-configuration/configuration.md)

**Cần giúp đỡ?** Tham gia thảo luận cộng đồng của chúng tôi hoặc mở một issue trong kho lưu trữ. Cộng đồng Azure AI + AZD ở đây để giúp bạn thành công!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->