<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-22T11:37:16+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "vi"
}
-->
# Tích hợp Microsoft Foundry với AZD

**Điều hướng chương:**
- **📚 Trang chủ khóa học**: [AZD Dành cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển ưu tiên AI
- **⬅️ Chương trước**: [Chương 1: Dự án đầu tiên của bạn](../getting-started/first-project.md)
- **➡️ Tiếp theo**: [Triển khai mô hình AI](ai-model-deployment.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../getting-started/configuration.md)

## Tổng quan

Hướng dẫn này trình bày cách tích hợp các dịch vụ Microsoft Foundry với Azure Developer CLI (AZD) để triển khai ứng dụng AI một cách hiệu quả. Microsoft Foundry cung cấp một nền tảng toàn diện để xây dựng, triển khai và quản lý các ứng dụng AI, trong khi AZD đơn giản hóa quy trình hạ tầng và triển khai.

## Microsoft Foundry là gì?

Microsoft Foundry là nền tảng hợp nhất của Microsoft dành cho phát triển AI, bao gồm:

- **Danh mục mô hình**: Truy cập các mô hình AI tiên tiến
- **Dòng lệnh gợi ý**: Công cụ thiết kế trực quan cho quy trình AI
- **Cổng AI Foundry**: Môi trường phát triển tích hợp cho các ứng dụng AI
- **Tùy chọn triển khai**: Nhiều tùy chọn lưu trữ và mở rộng
- **An toàn và bảo mật**: Tích hợp các tính năng AI có trách nhiệm

## AZD + Microsoft Foundry: Kết hợp hoàn hảo

| Tính năng | Microsoft Foundry | Lợi ích tích hợp AZD |
|-----------|-------------------|----------------------|
| **Triển khai mô hình** | Triển khai thủ công qua cổng | Triển khai tự động, có thể lặp lại |
| **Hạ tầng** | Cấp phát qua giao diện | Hạ tầng dưới dạng mã (Bicep) |
| **Quản lý môi trường** | Tập trung vào một môi trường | Nhiều môi trường (dev/staging/prod) |
| **Tích hợp CI/CD** | Hạn chế | Hỗ trợ GitHub Actions gốc |
| **Quản lý chi phí** | Giám sát cơ bản | Tối ưu hóa chi phí theo môi trường |

## Yêu cầu trước

- Đăng ký Azure với quyền phù hợp
- Đã cài đặt Azure Developer CLI
- Truy cập vào dịch vụ Azure OpenAI
- Hiểu biết cơ bản về Microsoft Foundry

## Các mẫu tích hợp cốt lõi

### Mẫu 1: Tích hợp Azure OpenAI

**Trường hợp sử dụng**: Triển khai ứng dụng trò chuyện với các mô hình Azure OpenAI

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

**Trường hợp sử dụng**: Triển khai các ứng dụng tạo nội dung tăng cường truy xuất (RAG)

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

## 🔧 Các mẫu cấu hình

### Thiết lập biến môi trường

**Cấu hình sản xuất:**
```bash
# Dịch vụ AI cốt lõi
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

**Cấu hình phát triển:**
```bash
# Cài đặt tối ưu chi phí cho phát triển
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Tầng miễn phí
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
# Triển khai mọi thứ với một lệnh
azd up

# Hoặc triển khai từng bước
azd provision  # Chỉ cơ sở hạ tầng
azd deploy     # Chỉ ứng dụng
```

### Triển khai theo môi trường cụ thể

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

## Khắc phục sự cố phổ biến

### Sự cố 1: Vượt quá hạn mức OpenAI

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

# Giảm tạm thời công suất
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Sự cố 2: Lỗi xác thực

**Triệu chứng:**
- Lỗi 401/403 khi gọi các dịch vụ AI
- Thông báo "Truy cập bị từ chối"

**Giải pháp:**
```bash
# Xác minh phân công vai trò
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kiểm tra cấu hình danh tính được quản lý
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Xác thực quyền truy cập Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Sự cố 3: Vấn đề triển khai mô hình

**Triệu chứng:**
- Các mô hình không khả dụng trong triển khai
- Các phiên bản mô hình cụ thể bị lỗi

**Giải pháp:**
```bash
# Liệt kê các mô hình có sẵn theo khu vực
az cognitiveservices model list --location eastus

# Cập nhật phiên bản mô hình trong mẫu bicep
# Kiểm tra yêu cầu dung lượng của mô hình
```

## Mẫu ví dụ

### Ứng dụng trò chuyện cơ bản

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

### Trò chuyện doanh nghiệp với RAG

**Kho lưu trữ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Dịch vụ**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Bắt đầu nhanh**:
```bash
azd init --template contoso-chat
azd up
```

## Các bước tiếp theo

1. **Thử các ví dụ**: Bắt đầu với một mẫu dựng sẵn phù hợp với trường hợp sử dụng của bạn
2. **Tùy chỉnh theo nhu cầu**: Sửa đổi hạ tầng và mã ứng dụng
3. **Thêm giám sát**: Triển khai quan sát toàn diện
4. **Tối ưu hóa chi phí**: Tinh chỉnh cấu hình phù hợp với ngân sách của bạn
5. **Bảo mật triển khai của bạn**: Áp dụng các mẫu bảo mật doanh nghiệp
6. **Mở rộng quy mô sản xuất**: Thêm tính năng đa vùng và khả năng sẵn sàng cao

## 🎯 Bài tập thực hành

### Bài tập 1: Triển khai ứng dụng trò chuyện Azure OpenAI (30 phút)
**Mục tiêu**: Triển khai và kiểm tra một ứng dụng trò chuyện AI sẵn sàng sản xuất

```bash
# Khởi tạo mẫu
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Đặt các biến môi trường
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

**Tiêu chí thành công:**
- [ ] Triển khai hoàn tất mà không gặp lỗi hạn mức
- [ ] Có thể truy cập giao diện trò chuyện trên trình duyệt
- [ ] Có thể đặt câu hỏi và nhận phản hồi từ AI
- [ ] Application Insights hiển thị dữ liệu giám sát
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

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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

**Tiêu chí thành công:**
- [ ] Nhiều mô hình được triển khai thành công
- [ ] Áp dụng các cài đặt dung lượng khác nhau
- [ ] Các mô hình có thể truy cập qua API
- [ ] Có thể gọi cả hai mô hình từ ứng dụng

### Bài tập 3: Triển khai giám sát chi phí (20 phút)
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
- [ ] Đã tạo cảnh báo ngân sách trong Azure
- [ ] Đã cấu hình thông báo qua email
- [ ] Có thể xem dữ liệu chi phí trên Azure Portal
- [ ] Đặt ngưỡng ngân sách phù hợp

## 💡 Câu hỏi thường gặp

<details>
<summary><strong>Làm thế nào để giảm chi phí Azure OpenAI trong quá trình phát triển?</strong></summary>

1. **Sử dụng gói miễn phí**: Azure OpenAI cung cấp 50.000 token/tháng miễn phí
2. **Giảm dung lượng**: Đặt dung lượng ở mức 10 TPM thay vì 30+ cho phát triển
3. **Sử dụng azd down**: Giải phóng tài nguyên khi không phát triển
4. **Bộ nhớ đệm phản hồi**: Triển khai Redis cache cho các truy vấn lặp lại
5. **Kỹ thuật gợi ý**: Giảm sử dụng token với các gợi ý hiệu quả

```bash
# Cấu hình phát triển
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Sự khác biệt giữa Azure OpenAI và OpenAI API là gì?</strong></summary>

**Azure OpenAI**:
- Bảo mật và tuân thủ doanh nghiệp
- Tích hợp mạng riêng
- Đảm bảo SLA
- Xác thực bằng Managed Identity
- Hạn mức cao hơn

**OpenAI API**:
- Truy cập nhanh hơn vào các mô hình mới
- Thiết lập đơn giản hơn
- Rào cản gia nhập thấp hơn
- Chỉ sử dụng internet công cộng

Đối với các ứng dụng sản xuất, **Azure OpenAI được khuyến nghị**.
</details>

<details>
<summary><strong>Làm thế nào để xử lý lỗi vượt quá hạn mức Azure OpenAI?</strong></summary>

```bash
# Kiểm tra hạn ngạch hiện tại
az cognitiveservices usage list --location eastus2

# Thử khu vực khác
azd env set AZURE_LOCATION westus2
azd up

# Giảm tạm thời công suất
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Yêu cầu tăng hạn ngạch
# Đi tới Azure Portal > Hạn ngạch > Yêu cầu tăng
```
</details>

<details>
<summary><strong>Tôi có thể sử dụng dữ liệu của mình với Azure OpenAI không?</strong></summary>

Có! Sử dụng **Azure AI Search** cho RAG (Tạo nội dung tăng cường truy xuất):

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

**Thực hành tốt nhất**:
1. Sử dụng Managed Identity (không dùng API keys)
2. Kích hoạt Private Endpoints
3. Cấu hình nhóm bảo mật mạng
4. Triển khai giới hạn tốc độ
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

## Cộng đồng và hỗ trợ

- **Microsoft Foundry Discord**: [Kênh #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Vấn đề và thảo luận](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Tài liệu chính thức](https://learn.microsoft.com/azure/ai-studio/)

---

**Điều hướng chương:**
- **📚 Trang chủ khóa học**: [AZD Dành cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát triển ưu tiên AI
- **⬅️ Chương trước**: [Chương 1: Dự án đầu tiên của bạn](../getting-started/first-project.md)
- **➡️ Tiếp theo**: [Triển khai mô hình AI](ai-model-deployment.md)
- **🚀 Chương tiếp theo**: [Chương 3: Cấu hình](../getting-started/configuration.md)

**Cần hỗ trợ?** Tham gia thảo luận cộng đồng hoặc mở một vấn đề trong kho lưu trữ. Cộng đồng Azure AI + AZD luôn sẵn sàng giúp bạn thành công!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->