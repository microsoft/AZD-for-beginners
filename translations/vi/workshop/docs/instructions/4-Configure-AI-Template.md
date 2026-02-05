# 4. Cấu hình một Template

!!! tip "KẾT THÚC MODULE NÀY BẠN SẼ CÓ THỂ"

    - [ ] Hiểu mục đích của `azure.yaml`
    - [ ] Hiểu cấu trúc của `azure.yaml`
    - [ ] Hiểu giá trị của các `hooks` trong vòng đời azd
    - [ ] **Lab 3:** 

---

!!! prompt "Tệp `azure.yaml` dùng để làm gì? Sử dụng codefence và giải thích từng dòng"

      Tệp `azure.yaml` là **tệp cấu hình cho Azure Developer CLI (azd)**. Nó định nghĩa cách ứng dụng của bạn được triển khai lên Azure, bao gồm cơ sở hạ tầng, dịch vụ, hooks triển khai, và các biến môi trường.

---

## 1. Mục đích và Chức năng

Tệp `azure.yaml` này đóng vai trò như **bản thiết kế triển khai** cho một ứng dụng AI agent:

1. **Xác thực môi trường** trước khi triển khai
2. **Cung cấp các dịch vụ Azure AI** (AI Hub, AI Project, Search, v.v.)
3. **Triển khai ứng dụng Python** lên Azure Container Apps
4. **Cấu hình các mô hình AI** cho cả chức năng chat và embedding
5. **Thiết lập giám sát và theo dõi** cho ứng dụng AI
6. **Xử lý cả các dự án Azure AI mới và hiện có**

Tệp này cho phép **triển khai chỉ với một lệnh** (`azd up`) cho một giải pháp AI agent hoàn chỉnh với xác thực, cung cấp, và cấu hình sau triển khai.

??? info "Mở rộng để xem: `azure.yaml`"

      Tệp `azure.yaml` định nghĩa cách Azure Developer CLI triển khai và quản lý ứng dụng AI Agent này trên Azure. Hãy cùng phân tích từng dòng.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: chúng ta có cần hooks không? 
      # TODO: chúng ta có cần tất cả các biến không?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. Phân tích tệp

Hãy cùng đi qua từng phần của tệp để hiểu nó làm gì - và tại sao.

### 2.1 **Header và Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Dòng 1**: Cung cấp xác thực schema của YAML language server để hỗ trợ IDE và IntelliSense

### 2.2 Metadata của Dự án (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Dòng 5**: Định nghĩa tên dự án được sử dụng bởi Azure Developer CLI
- **Dòng 6-7**: Chỉ định dự án này dựa trên phiên bản template 1.0.2
- **Dòng 8-9**: Yêu cầu phiên bản Azure Developer CLI từ 1.14.0 trở lên

### 2.3 Deploy Hooks (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **Dòng 11-20**: **Hook trước triển khai** - chạy trước khi thực hiện `azd up`

      - Trên Unix/Linux: Làm cho script xác thực có thể thực thi và chạy nó
      - Trên Windows: Chạy script xác thực PowerShell
      - Cả hai đều tương tác và sẽ dừng triển khai nếu thất bại

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **Dòng 21-30**: **Hook sau cung cấp** - chạy sau khi các tài nguyên Azure được tạo

  - Thực thi các script ghi biến môi trường
  - Tiếp tục triển khai ngay cả khi các script này thất bại (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **Dòng 31-40**: **Hook sau triển khai** - chạy sau khi ứng dụng được triển khai

  - Thực thi các script thiết lập cuối cùng
  - Tiếp tục ngay cả khi các script thất bại

### 2.4 Cấu hình Dịch vụ (41-48)

Phần này cấu hình dịch vụ ứng dụng mà bạn đang triển khai.

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **Dòng 42**: Định nghĩa một dịch vụ tên là "api_and_frontend"
- **Dòng 43**: Trỏ đến thư mục `./src` cho mã nguồn
- **Dòng 44**: Chỉ định Python là ngôn ngữ lập trình
- **Dòng 45**: Sử dụng Azure Container Apps làm nền tảng lưu trữ
- **Dòng 46-48**: Cấu hình Docker

      - Sử dụng "api_and_frontend" làm tên hình ảnh
      - Xây dựng hình ảnh Docker từ xa trên Azure (không phải cục bộ)

### 2.5 Biến Pipeline (49-76)

Đây là các biến giúp bạn chạy `azd` trong các pipeline CI/CD để tự động hóa

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

Phần này định nghĩa các biến môi trường được sử dụng **trong quá trình triển khai**, được tổ chức theo danh mục:

- **Tên tài nguyên Azure (Dòng 51-60)**:
      - Tên các dịch vụ cốt lõi của Azure, ví dụ: Resource Group, AI Hub, AI Project, v.v.
- **Cờ tính năng (Dòng 61-63)**:
      - Các biến Boolean để bật/tắt các dịch vụ Azure cụ thể
- **Cấu hình AI Agent (Dòng 64-71)**:
      - Cấu hình cho AI agent chính bao gồm tên, ID, cài đặt triển khai, chi tiết mô hình
- **Cấu hình AI Embedding (Dòng 72-79)**:
      - Cấu hình cho mô hình embedding được sử dụng cho tìm kiếm vector
- **Tìm kiếm và Giám sát (Dòng 80-84)**:
      - Tên chỉ mục tìm kiếm, ID tài nguyên hiện có, và cài đặt giám sát/theo dõi

---

## 3. Tìm hiểu các Biến Môi trường
Các biến môi trường sau đây kiểm soát cấu hình và hành vi của việc triển khai của bạn, được tổ chức theo mục đích chính của chúng. Hầu hết các biến có giá trị mặc định hợp lý, nhưng bạn có thể tùy chỉnh chúng để phù hợp với yêu cầu cụ thể hoặc tài nguyên Azure hiện có.

### 3.1 Biến Bắt Buộc 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 Cấu hình Mô hình 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 Bật/Tắt Tính năng
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 Cấu hình Dự án AI 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Kiểm tra Biến của Bạn

Sử dụng Azure Developer CLI để xem và quản lý các biến môi trường:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

