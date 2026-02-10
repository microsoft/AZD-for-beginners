# 4. Configure a Template

!!! tip "ĐẾN CUỐI MODULE NÀY BẠN SẼ CÓ THỂ"

    - [ ] Hiểu mục đích của `azure.yaml`
    - [ ] Hiểu cấu trúc của `azure.yaml`
    - [ ] Hiểu giá trị của chu kỳ sống azd `hooks`
    - [ ] **Lab 4:** Khám phá và sửa đổi các biến môi trường

---

!!! prompt "Tệp `azure.yaml` làm gì? Sử dụng khung mã và giải thích nó từng dòng một"

      Tệp `azure.yaml` là **tệp cấu hình cho Azure Developer CLI (azd)**. Nó định nghĩa cách ứng dụng của bạn nên được triển khai lên Azure, bao gồm hạ tầng, dịch vụ, hooks triển khai và biến môi trường.

---

## 1. Mục đích và Chức năng

Tệp `azure.yaml` này đóng vai trò như **bản thiết kế triển khai** cho một ứng dụng tác nhân AI mà:

1. **Xác thực môi trường** trước khi triển khai
2. **Cấp phát dịch vụ AI Azure** (AI Hub, AI Project, Search, v.v.)
3. **Triển khai một ứng dụng Python** lên Azure Container Apps
4. **Cấu hình các mô hình AI** cho cả chức năng chat và embedding
5. **Thiết lập giám sát và theo dõi** cho ứng dụng AI
6. **Xử lý cả kịch bản dự án AI mới và dự án AI đã tồn tại**

Tệp cho phép **triển khai bằng một lệnh** (`azd up`) cho một giải pháp tác nhân AI hoàn chỉnh với xác thực, cấp phát và cấu hình sau triển khai phù hợp.

??? info "Mở để xem: `azure.yaml`"

      Tệp `azure.yaml` định nghĩa cách Azure Developer CLI nên triển khai và quản lý ứng dụng Tác nhân AI này trên Azure. Hãy phân tích nó từng dòng một.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: chúng ta có cần hooks không? 
      # TODO: chúng ta có cần tất cả các biến này không?

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

## 2. Phân tích Tệp

Hãy đi qua tệp từng phần một, để hiểu nó làm gì - và tại sao.

### 2.1 **Tiêu đề và Lược đồ (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Dòng 1**: Cung cấp xác thực lược đồ cho YAML language server để hỗ trợ IDE và IntelliSense

### 2.2 Siêu dữ liệu Dự án (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Dòng 5**: Định nghĩa tên dự án được Azure Developer CLI sử dụng
- **Dòng 6-7**: Chỉ rõ rằng đây dựa trên một mẫu phiên bản 1.0.2
- **Dòng 8-9**: Yêu cầu phiên bản Azure Developer CLI 1.14.0 hoặc cao hơn

### 2.3 Hooks Triển khai (11-40)

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

- **Dòng 11-20**: **Hook trước triển khai** - chạy trước `azd up`

      - Trên Unix/Linux: Làm cho script xác thực có thể thực thi và chạy nó
      - Trên Windows: Chạy script xác thực PowerShell
      - Cả hai đều tương tác và sẽ dừng triển khai nếu chúng thất bại

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
- **Dòng 21-30**: **Hook sau khi cung cấp** - chạy sau khi các tài nguyên Azure được tạo

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

Cấu hình này thiết lập dịch vụ ứng dụng mà bạn đang triển khai.

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
- **Dòng 45**: Sử dụng Azure Container Apps làm nền tảng hosting
- **Dòng 46-48**: Cấu hình Docker

      - Sử dụng "api_and_frontend" làm tên image
      - Xây dựng image Docker từ xa trên Azure (không phải cục bộ)

### 2.5 Biến pipeline (49-76)

Đây là các biến giúp bạn chạy `azd` trong CI/CD pipelines để tự động hóa

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
      - Tên các tài nguyên dịch vụ cốt lõi của Azure, ví dụ: Resource Group, AI Hub, AI Project, v.v.- 
- **Cờ tính năng (Dòng 61-63)**:
      - Các biến boolean để bật/tắt các dịch vụ Azure cụ thể
- **Cấu hình Tác nhân AI (Dòng 64-71)**:
      - Cấu hình cho tác nhân AI chính bao gồm tên, ID, cài đặt triển khai, chi tiết mô hình- 
- **Cấu hình Embedding AI (Dòng 72-79)**:
      - Cấu hình cho mô hình embedding dùng cho tìm kiếm vector
- **Tìm kiếm và Giám sát (Dòng 80-84)**:
      - Tên chỉ mục tìm kiếm, ID tài nguyên hiện có, và cài đặt giám sát/theo dõi

---

## 3. Biết về Biến Môi trường
Các biến môi trường sau điều khiển cấu hình và hành vi triển khai của bạn, được tổ chức theo mục đích chính của chúng. Hầu hết các biến có giá trị mặc định hợp lý, nhưng bạn có thể tùy chỉnh chúng để phù hợp với yêu cầu cụ thể hoặc các tài nguyên Azure tồn tại của bạn.

### 3.1 Các biến bắt buộc 

```bash title="" linenums="0"
# Cấu hình cốt lõi của Azure
AZURE_ENV_NAME                    # Tên môi trường (sử dụng trong đặt tên tài nguyên)
AZURE_LOCATION                    # Khu vực triển khai
AZURE_SUBSCRIPTION_ID             # Đăng ký đích
AZURE_RESOURCE_GROUP              # Tên nhóm tài nguyên
AZURE_PRINCIPAL_ID                # Định danh người dùng cho RBAC

# Tên tài nguyên (Tự động tạo nếu không được chỉ định)
AZURE_AIHUB_NAME                  # Tên hub Microsoft Foundry
AZURE_AIPROJECT_NAME              # Tên dự án AI
AZURE_AISERVICES_NAME             # Tên tài khoản dịch vụ AI
AZURE_STORAGE_ACCOUNT_NAME        # Tên tài khoản lưu trữ
AZURE_CONTAINER_REGISTRY_NAME     # Tên đăng ký container
AZURE_KEYVAULT_NAME               # Tên Key Vault (nếu được sử dụng)
```

### 3.2 Cấu hình Mô hình 
```bash title="" linenums="0"
# Cấu hình mô hình chat
AZURE_AI_AGENT_MODEL_NAME         # Mặc định: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Mặc định: OpenAI (hoặc Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Mặc định: mới nhất có sẵn
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Tên triển khai cho mô hình chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Mặc định: Tiêu chuẩn
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Mặc định: 80 (nghìn TPM)

# Cấu hình mô hình embedding
AZURE_AI_EMBED_MODEL_NAME         # Mặc định: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Mặc định: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Mặc định: mới nhất có sẵn
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Tên triển khai cho embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Mặc định: Tiêu chuẩn
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Mặc định: 50 (nghìn TPM)

# Cấu hình agent
AZURE_AI_AGENT_NAME               # Tên hiển thị của agent
AZURE_EXISTING_AGENT_ID           # Sử dụng agent hiện có (tùy chọn)
```

### 3.3 Chuyển đổi Tính năng
```bash title="" linenums="0"
# Dịch vụ tùy chọn
USE_APPLICATION_INSIGHTS         # Mặc định: true
USE_AZURE_AI_SEARCH_SERVICE      # Mặc định: false
USE_CONTAINER_REGISTRY           # Mặc định: true

# Giám sát và theo dõi
ENABLE_AZURE_MONITOR_TRACING     # Mặc định: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Mặc định: false

# Cấu hình tìm kiếm
AZURE_AI_SEARCH_INDEX_NAME       # Tên chỉ mục tìm kiếm
AZURE_SEARCH_SERVICE_NAME        # Tên dịch vụ tìm kiếm
```

### 3.4 Cấu hình Dự án AI 
```bash title="" linenums="0"
# Sử dụng tài nguyên hiện có
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID tài nguyên đầy đủ của dự án AI hiện có
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL điểm cuối của dự án hiện có
```

### 3.5 Kiểm tra các biến của bạn

Sử dụng Azure Developer CLI để xem và quản lý các biến môi trường của bạn:

```bash title="" linenums="0"
# Xem tất cả các biến môi trường của môi trường hiện tại
azd env get-values

# Lấy một biến môi trường cụ thể
azd env get-value AZURE_ENV_NAME

# Đặt một biến môi trường
azd env set AZURE_LOCATION eastus

# Đặt nhiều biến từ một tệp .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn chính thức. Đối với thông tin quan trọng, nên sử dụng bản dịch do chuyên gia dịch thuật thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu nhầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->