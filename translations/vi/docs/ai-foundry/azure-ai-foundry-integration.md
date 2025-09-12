<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T21:45:13+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "vi"
}
-->
# Tích hợp Azure AI Foundry với AZD

**Trước:** [Dự án đầu tiên](../getting-started/first-project.md) | **Tiếp theo:** [Triển khai mô hình AI](ai-model-deployment.md)

## Tổng quan

Hướng dẫn này trình bày cách tích hợp các dịch vụ Azure AI Foundry với Azure Developer CLI (AZD) để triển khai ứng dụng AI một cách hiệu quả. Azure AI Foundry cung cấp một nền tảng toàn diện để xây dựng, triển khai và quản lý các ứng dụng AI, trong khi AZD đơn giản hóa quy trình hạ tầng và triển khai.

## Azure AI Foundry là gì?

Azure AI Foundry là nền tảng thống nhất của Microsoft dành cho phát triển AI, bao gồm:

- **Model Catalog**: Truy cập các mô hình AI tiên tiến
- **Prompt Flow**: Công cụ thiết kế trực quan cho quy trình AI
- **AI Foundry Portal**: Môi trường phát triển tích hợp cho ứng dụng AI
- **Deployment Options**: Nhiều tùy chọn lưu trữ và mở rộng
- **Safety and Security**: Các tính năng AI có trách nhiệm được tích hợp sẵn

## AZD + Azure AI Foundry: Kết hợp tốt hơn

| Tính năng | Azure AI Foundry | Lợi ích từ tích hợp AZD |
|-----------|------------------|-------------------------|
| **Triển khai mô hình** | Triển khai thủ công qua portal | Triển khai tự động, có thể lặp lại |
| **Hạ tầng** | Cấu hình qua giao diện | Hạ tầng dưới dạng mã (Bicep) |
| **Quản lý môi trường** | Tập trung vào một môi trường | Đa môi trường (dev/staging/prod) |
| **Tích hợp CI/CD** | Hạn chế | Hỗ trợ GitHub Actions tích hợp sẵn |
| **Quản lý chi phí** | Giám sát cơ bản | Tối ưu hóa chi phí theo môi trường |

## Yêu cầu trước

- Đăng ký Azure với quyền phù hợp
- Đã cài đặt Azure Developer CLI
- Truy cập vào dịch vụ Azure OpenAI
- Kiến thức cơ bản về Azure AI Foundry

## Mẫu tích hợp cốt lõi

### Mẫu 1: Tích hợp Azure OpenAI

**Trường hợp sử dụng**: Triển khai ứng dụng chat với các mô hình Azure OpenAI

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
// Azure OpenAI Account
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

**Trường hợp sử dụng**: Triển khai ứng dụng tạo nội dung dựa trên truy xuất (RAG)

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

## 🔧 Mẫu cấu hình

### Thiết lập biến môi trường

**Cấu hình sản xuất:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

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

## Quy trình triển khai

### Triển khai bằng một lệnh duy nhất

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Triển khai theo môi trường cụ thể

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

## Giám sát và quan sát

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

## Tối ưu hóa hiệu suất

### Chiến lược bộ nhớ đệm

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

## Xử lý sự cố thường gặp

### Vấn đề 1: Vượt hạn mức OpenAI

**Triệu chứng:**
- Triển khai thất bại với lỗi hạn mức
- Lỗi 429 trong nhật ký ứng dụng

**Giải pháp:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Vấn đề 2: Lỗi xác thực

**Triệu chứng:**
- Lỗi 401/403 khi gọi dịch vụ AI
- Thông báo "Truy cập bị từ chối"

**Giải pháp:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Vấn đề 3: Lỗi triển khai mô hình

**Triệu chứng:**
- Mô hình không khả dụng trong triển khai
- Phiên bản mô hình cụ thể gặp lỗi

**Giải pháp:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Mẫu ví dụ

### Ứng dụng chat cơ bản

**Kho lưu trữ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Dịch vụ**: Azure OpenAI + Cognitive Search + App Service

**Bắt đầu nhanh**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Quy trình xử lý tài liệu

**Kho lưu trữ**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Dịch vụ**: Document Intelligence + Storage + Functions

**Bắt đầu nhanh**:
```bash
azd init --template ai-document-processing
azd up
```

### Chat doanh nghiệp với RAG

**Kho lưu trữ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Dịch vụ**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Bắt đầu nhanh**:
```bash
azd init --template contoso-chat
azd up
```

## Bước tiếp theo

1. **Thử các ví dụ**: Bắt đầu với một mẫu dựng sẵn phù hợp với trường hợp sử dụng của bạn
2. **Tùy chỉnh theo nhu cầu**: Sửa đổi hạ tầng và mã ứng dụng
3. **Thêm giám sát**: Triển khai khả năng quan sát toàn diện
4. **Tối ưu hóa chi phí**: Tinh chỉnh cấu hình phù hợp với ngân sách của bạn
5. **Bảo mật triển khai**: Áp dụng các mẫu bảo mật doanh nghiệp
6. **Mở rộng đến sản xuất**: Thêm tính năng đa vùng và khả năng sẵn sàng cao

## Cộng đồng và hỗ trợ

- **Discord Azure AI Foundry**: [Kênh #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Vấn đề và thảo luận](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Tài liệu chính thức](https://learn.microsoft.com/azure/ai-studio/)

---

**Trước:** [Dự án đầu tiên](../getting-started/first-project.md) | **Tiếp theo:** [Triển khai mô hình AI](ai-model-deployment.md)

**Cần hỗ trợ?** Tham gia thảo luận cộng đồng hoặc mở một vấn đề trong kho lưu trữ. Cộng đồng Azure AI + AZD luôn sẵn sàng giúp bạn thành công!

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.