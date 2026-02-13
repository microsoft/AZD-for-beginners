# 3. Phân tích một Mẫu

!!! tip "KHI KẾT THÚC MÔ-ĐUN NÀY BẠN SẼ CÓ THỂ"

    - [ ] Kích hoạt GitHub Copilot với máy chủ MCP để hỗ trợ Azure
    - [ ] Hiểu cấu trúc thư mục và các thành phần của mẫu AZD
    - [ ] Khám phá các mẫu tổ chức hạ tầng-dưới-dạng-mã (Bicep)
    - [ ] **Lab 3:** Sử dụng GitHub Copilot để khám phá và hiểu cấu trúc kho mã 

---


Với các mẫu AZD và Azure Developer CLI (`azd`) chúng ta có thể nhanh chóng khởi động hành trình phát triển AI với các kho mẫu chuẩn hóa cung cấp mã ví dụ, hạ tầng và tệp cấu hình - dưới dạng một dự án _starter_ sẵn sàng để triển khai.

**Nhưng giờ đây, chúng ta cần hiểu cấu trúc dự án và mã nguồn - và có thể tùy chỉnh mẫu AZD - mà không cần bất kỳ kinh nghiệm hay hiểu biết trước về AZD!**

---

## 1. Kích hoạt GitHub Copilot

### 1.1 Cài đặt GitHub Copilot Chat

Đã đến lúc khám phá [GitHub Copilot với Chế độ Agent](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Bây giờ, chúng ta có thể dùng ngôn ngữ tự nhiên để mô tả nhiệm vụ ở mức cao và nhận trợ giúp trong thực thi. Trong bài lab này, chúng ta sẽ sử dụng [gói Copilot Free](https://github.com/github-copilot/signup) có giới hạn hàng tháng cho các hoàn thành và tương tác chat.

Phần mở rộng có thể được cài từ marketplace, nhưng thường đã có sẵn trong môi trường Codespaces của bạn. _Nhấp `Open Chat` từ menu thả xuống biểu tượng Copilot - và gõ một lời nhắc như `What can you do?`_ - bạn có thể được yêu cầu đăng nhập. **GitHub Copilot Chat đã sẵn sàng**.

### 1.2. Cài đặt máy chủ MCP

Để Chế độ Agent hoạt động hiệu quả, nó cần truy cập các công cụ phù hợp để giúp lấy kiến thức hoặc thực hiện hành động. Đây là nơi máy chủ MCP có thể hữu ích. Chúng ta sẽ cấu hình các máy chủ sau:

1. [Máy chủ Azure MCP](../../../../../workshop/docs/instructions)
1. [Máy chủ Microsoft Docs MCP](../../../../../workshop/docs/instructions)

Để kích hoạt các máy chủ này:

1. Tạo một tệp có tên `.vscode/mcp.json` nếu nó chưa tồn tại
1. Sao chép nội dung sau vào tệp đó - và khởi động các máy chủ!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "Bạn có thể gặp lỗi cho biết `npx` chưa được cài đặt (bấm để mở rộng để sửa)"

      Để khắc phục, hãy mở tệp `.devcontainer/devcontainer.json` và thêm dòng này vào phần features. Sau đó xây dựng lại container. Bây giờ bạn sẽ có `npx` được cài đặt.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Kiểm tra GitHub Copilot Chat

**Trước tiên sử dụng `az login` để xác thực với Azure từ dòng lệnh VS Code.**

Bạn bây giờ nên có thể truy vấn trạng thái đăng ký Azure của mình, và hỏi các câu về tài nguyên đã triển khai hoặc cấu hình. Hãy thử các lời nhắc sau:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Bạn cũng có thể hỏi về tài liệu Azure và nhận phản hồi dựa trên máy chủ Microsoft Docs MCP. Thử các lời nhắc sau:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Hoặc bạn có thể yêu cầu đoạn mã để hoàn thành một nhiệm vụ. Thử lời nhắc này.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Ở chế độ `Ask`, điều này sẽ cung cấp mã mà bạn có thể sao chép-dán và thử. Ở chế độ `Agent`, điều này có thể tiến thêm một bước và tạo các tài nguyên liên quan cho bạn - bao gồm script thiết lập và tài liệu - để giúp bạn thực hiện nhiệm vụ đó.

**Bạn hiện đã được trang bị để bắt đầu khám phá kho mẫu**

---

## 2. Phân tích Kiến trúc

??? prompt "HỎI: Giải thích kiến trúc ứng dụng trong docs/images/architecture.png trong 1 đoạn"

      Ứng dụng này là một ứng dụng chat được hỗ trợ bởi AI triển khai trên Azure, thể hiện một kiến trúc hiện đại dựa trên agent. Giải pháp tập trung quanh một Azure Container App lưu trữ mã ứng dụng chính, xử lý đầu vào của người dùng và tạo phản hồi thông minh thông qua một agent AI.
      
      Kiến trúc tận dụng Microsoft Foundry Project làm nền tảng cho các khả năng AI, kết nối tới Azure AI Services cung cấp các mô hình ngôn ngữ nền tảng (như GPT-4o-mini) và chức năng agent. Tương tác người dùng được điều hướng qua frontend dựa trên React đến backend FastAPI, nơi giao tiếp với dịch vụ agent AI để tạo ra các phản hồi ngữ cảnh.
      
      Hệ thống kết hợp khả năng truy xuất kiến thức thông qua tìm kiếm tệp hoặc dịch vụ Azure AI Search, cho phép agent truy cập và trích dẫn thông tin từ tài liệu đã tải lên. Vì mục tiêu vận hành xuất sắc, kiến trúc bao gồm giám sát toàn diện qua Application Insights và Log Analytics Workspace để theo dõi, ghi log và tối ưu hiệu năng.
      
      Azure Storage cung cấp blob storage cho dữ liệu ứng dụng và tệp tải lên, trong khi Managed Identity đảm bảo truy cập an toàn giữa các tài nguyên Azure mà không lưu trữ thông tin xác thực. Toàn bộ giải pháp được thiết kế để có khả năng mở rộng và dễ bảo trì, với ứng dụng container hóa tự động mở rộng theo nhu cầu đồng thời cung cấp bảo mật, giám sát và khả năng CI/CD tích hợp thông qua hệ sinh thái dịch vụ được quản lý của Azure.

![Kiến trúc](../../../../../translated_images/vi/architecture.48d94861e6e6cdc0.webp)

---

## 3. Cấu trúc Kho mã

!!! prompt "HỎI: Giải thích cấu trúc thư mục mẫu. Bắt đầu với sơ đồ phân cấp trực quan."

??? info "TRẢ LỜI: Sơ đồ phân cấp trực quan"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure Developer CLI configuration
      │   ├── docker-compose.yaml           # Local development containers
      │   ├── pyproject.toml                # Python project configuration
      │   ├── requirements-dev.txt          # Development dependencies
      │   └── .devcontainer/                # VS Code dev container setup
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Main infrastructure template
      │   ├── api.bicep                     # API-specific resources
      │   ├── main.parameters.json          # Infrastructure parameters
      │   └── core/                         # Modular infrastructure components
      │       ├── ai/                       # AI service configurations
      │       ├── host/                     # Hosting infrastructure
      │       ├── monitor/                  # Monitoring and logging
      │       ├── search/                   # Azure AI Search setup
      │       ├── security/                 # Security and identity
      │       └── storage/                  # Storage account configs
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI application entry
      │   │   ├── routes.py                 # API route definitions
      │   │   ├── search_index_manager.py   # Search functionality
      │   │   ├── data/                     # API data handling
      │   │   ├── static/                   # Static web assets
      │   │   └── templates/                # HTML templates
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js dependencies
      │   │   ├── vite.config.ts            # Vite build configuration
      │   │   └── src/                      # Frontend source code
      │   ├── data/                         # Sample data files
      │   │   └── embeddings.csv            # Pre-computed embeddings
      │   ├── files/                        # Knowledge base files
      │   │   ├── customer_info_*.json      # Customer data samples
      │   │   └── product_info_*.md         # Product documentation
      │   ├── Dockerfile                    # Container configuration
      │   └── requirements.txt              # Python dependencies
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Post-deployment setup
      │   ├── setup_credential.sh/.ps1     # Credential configuration
      │   ├── validate_env_vars.sh/.ps1    # Environment validation
      │   └── resolve_model_quota.sh/.ps1  # Model quota management
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Unit and integration tests
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent evaluation framework
      │   │   ├── evaluate.py               # Evaluation runner
      │   │   ├── eval-queries.json         # Test queries
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Development playground
      │   │   ├── 1-quickstart.py           # Getting started examples
      │   │   └── aad-interactive-chat.py   # Authentication examples
      │   └── airedteaming/                 # AI safety evaluation
      │       └── ai_redteaming.py          # Red team testing
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Deployment guide
      │   ├── local_development.md          # Local setup instructions
      │   ├── troubleshooting.md            # Common issues & fixes
      │   ├── azure_account_setup.md        # Azure prerequisites
      │   └── images/                       # Documentation assets
      │
      └── 📄 Project Metadata
         ├── README.md                     # Project overview
         ├── CODE_OF_CONDUCT.md           # Community guidelines
         ├── CONTRIBUTING.md              # Contribution guide
         ├── LICENSE                      # License terms
         └── next-steps.md                # Post-deployment guidance
      ```

### 3.1. Kiến trúc Ứng dụng Chính

Mẫu này theo một mô hình **ứng dụng web full-stack** với:

- **Backend**: REST API dựa trên Python FastAPI với tích hợp Azure AI
- **Frontend**: TypeScript/React với hệ thống build Vite
- **Infrastructure**: các mẫu Azure Bicep cho tài nguyên đám mây
- **Containerization**: Docker cho việc triển khai nhất quán

### 3.2 Hạ tầng dưới dạng mã (bicep)

Lớp hạ tầng sử dụng các mẫu **Azure Bicep** được tổ chức theo mô-đun:

   - **`main.bicep`**: Điều phối tất cả tài nguyên Azure
   - **`core/` modules**: Các thành phần có thể tái sử dụng cho các dịch vụ khác nhau
      - AI services (Azure OpenAI, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 Nguồn Ứng dụng (`src/`)

**Backend API (`src/api/`)**:

- REST API dựa trên FastAPI
- Tích hợp Foundry Agents
- Quản lý chỉ mục tìm kiếm cho truy xuất kiến thức
- Khả năng tải lên và xử lý tệp

**Frontend (`src/frontend/`)**:

- Ứng dụng SPA hiện đại React/TypeScript
- Vite cho phát triển nhanh và build tối ưu
- Giao diện chat cho tương tác với agent

**Knowledge Base (`src/files/`)**:

- Mẫu dữ liệu khách hàng và sản phẩm
- Minh họa truy xuất kiến thức dựa trên tệp
- Ví dụ định dạng JSON và Markdown


### 3.4 DevOps & Tự động hóa

**Scripts (`scripts/`)**:

- Script PowerShell và Bash đa nền tảng
- Kiểm tra và thiết lập môi trường
- Cấu hình sau khi triển khai
- Quản lý hạn mức mô hình

**Tích hợp Azure Developer CLI**:

- Cấu hình `azure.yaml` cho workflow `azd`
- Cấp phát và triển khai tự động
- Quản lý biến môi trường

### 3.5 Kiểm thử & Đảm bảo Chất lượng

**Evaluation Framework (`evals/`)**:

- Đánh giá hiệu năng agent
- Kiểm thử chất lượng phản hồi truy vấn
- Pipeline đánh giá tự động

**AI Safety (`airedteaming/`)**:

- Kiểm thử red team cho an toàn AI
- Quét lỗ hổng bảo mật
- Thực hành AI có trách nhiệm

---

## 4. Chúc mừng 🏆

Bạn đã sử dụng thành công GitHub Copilot Chat với các máy chủ MCP để khám phá kho mã.

- [X] Đã kích hoạt GitHub Copilot cho Azure
- [X] Hiểu Kiến trúc Ứng dụng
- [X] Đã khám phá cấu trúc mẫu AZD

Điều này giúp bạn hiểu các tài sản _hạ tầng dưới dạng mã_ cho mẫu này. Tiếp theo, chúng ta sẽ xem tệp cấu hình cho AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa sai sót hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn chính thức. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm đối với bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->