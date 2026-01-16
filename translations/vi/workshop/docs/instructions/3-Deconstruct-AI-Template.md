<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-24T23:35:05+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "vi"
}
-->
# 3. Phân Tích Một Mẫu Template

!!! tip "KẾT THÚC MODULE NÀY BẠN SẼ CÓ THỂ"

    - [ ] Mục
    - [ ] Mục
    - [ ] Mục
    - [ ] **Lab 3:** 

---

Với các mẫu AZD và Azure Developer CLI (`azd`), chúng ta có thể nhanh chóng bắt đầu hành trình phát triển AI với các kho lưu trữ tiêu chuẩn cung cấp mã mẫu, cơ sở hạ tầng và tệp cấu hình - dưới dạng một dự án _khởi đầu_ sẵn sàng triển khai.

**Nhưng bây giờ, chúng ta cần hiểu cấu trúc dự án và mã nguồn - và có thể tùy chỉnh mẫu AZD - mà không cần kinh nghiệm hoặc hiểu biết trước về AZD!**

---

## 1. Kích Hoạt GitHub Copilot

### 1.1 Cài Đặt GitHub Copilot Chat

Đã đến lúc khám phá [GitHub Copilot với Chế Độ Agent](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Bây giờ, chúng ta có thể sử dụng ngôn ngữ tự nhiên để mô tả nhiệm vụ ở mức độ cao và nhận hỗ trợ trong việc thực hiện. Trong bài lab này, chúng ta sẽ sử dụng [gói Copilot Free](https://github.com/github-copilot/signup) có giới hạn hàng tháng cho các lần hoàn thành và tương tác chat.

Phần mở rộng có thể được cài đặt từ marketplace, nhưng nên đã có sẵn trong môi trường Codespaces của bạn. _Nhấp vào `Open Chat` từ menu thả xuống của biểu tượng Copilot - và nhập một lời nhắc như `What can you do?`_ - bạn có thể được yêu cầu đăng nhập. **GitHub Copilot Chat đã sẵn sàng**.

### 1.2. Cài Đặt MCP Servers

Để chế độ Agent hoạt động hiệu quả, nó cần truy cập vào các công cụ phù hợp để giúp truy xuất kiến thức hoặc thực hiện hành động. Đây là lúc MCP servers có thể giúp ích. Chúng ta sẽ cấu hình các server sau:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Để kích hoạt các server này:

1. Tạo một tệp có tên `.vscode/mcp.json` nếu chưa tồn tại
1. Sao chép nội dung sau vào tệp đó - và khởi động các server!
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

??? warning "Bạn có thể gặp lỗi rằng `npx` chưa được cài đặt (nhấp để mở rộng cách khắc phục)"

      Để khắc phục, hãy mở tệp `.devcontainer/devcontainer.json` và thêm dòng này vào phần features. Sau đó, xây dựng lại container. Bây giờ bạn sẽ có `npx` được cài đặt.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Kiểm Tra GitHub Copilot Chat

**Đầu tiên sử dụng `az login` để xác thực với Azure từ dòng lệnh của VS Code.**

Bây giờ bạn có thể truy vấn trạng thái đăng ký Azure của mình và đặt câu hỏi về các tài nguyên hoặc cấu hình đã triển khai. Thử các lời nhắc sau:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Bạn cũng có thể đặt câu hỏi về tài liệu Azure và nhận câu trả lời dựa trên Microsoft Docs MCP server. Thử các lời nhắc sau:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Hoặc bạn có thể yêu cầu các đoạn mã để hoàn thành một nhiệm vụ. Thử lời nhắc này.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Trong chế độ `Ask`, điều này sẽ cung cấp mã mà bạn có thể sao chép-dán và thử nghiệm. Trong chế độ `Agent`, điều này có thể tiến xa hơn và tạo các tài nguyên liên quan cho bạn - bao gồm các tập lệnh thiết lập và tài liệu - để giúp bạn thực hiện nhiệm vụ đó.

**Bây giờ bạn đã sẵn sàng để bắt đầu khám phá kho lưu trữ mẫu**

---

## 2. Phân Tích Kiến Trúc

??? prompt "ASK: Giải thích kiến trúc ứng dụng trong docs/images/architecture.png trong 1 đoạn văn"

      Ứng dụng này là một ứng dụng chat được hỗ trợ bởi AI được xây dựng trên Azure, minh họa kiến trúc hiện đại dựa trên agent. Giải pháp tập trung vào một Azure Container App lưu trữ mã ứng dụng chính, xử lý đầu vào của người dùng và tạo phản hồi thông minh thông qua một agent AI. 
      
      Kiến trúc tận dụng Dự Án Azure AI Foundry làm nền tảng cho các khả năng AI, kết nối với các Dịch Vụ AI của Azure cung cấp các mô hình ngôn ngữ cơ bản (như GPT-4o-mini) và chức năng agent. Tương tác của người dùng được truyền qua frontend dựa trên React đến backend FastAPI, nơi giao tiếp với dịch vụ agent AI để tạo phản hồi theo ngữ cảnh. 
      
      Hệ thống tích hợp khả năng truy xuất kiến thức thông qua tìm kiếm tệp hoặc dịch vụ Azure AI Search, cho phép agent truy cập và trích dẫn thông tin từ các tài liệu đã tải lên. Để đảm bảo hoạt động xuất sắc, kiến trúc bao gồm giám sát toàn diện thông qua Application Insights và Log Analytics Workspace để theo dõi, ghi nhật ký và tối ưu hóa hiệu suất. 
      
      Azure Storage cung cấp lưu trữ blob cho dữ liệu ứng dụng và tệp tải lên, trong khi Managed Identity đảm bảo truy cập an toàn giữa các tài nguyên Azure mà không cần lưu trữ thông tin đăng nhập. Toàn bộ giải pháp được thiết kế để mở rộng và duy trì, với ứng dụng container tự động mở rộng dựa trên nhu cầu đồng thời cung cấp bảo mật, giám sát và khả năng CI/CD tích hợp thông qua hệ sinh thái dịch vụ được quản lý của Azure.

![Architecture](../../../../../translated_images/vi/architecture.48d94861e6e6cdc0.png)

---

## 3. Cấu Trúc Kho Lưu Trữ

!!! prompt "ASK: Giải thích cấu trúc thư mục mẫu. Bắt đầu với sơ đồ phân cấp trực quan."

??? info "ANSWER: Sơ Đồ Phân Cấp Trực Quan"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Cấu Hình & Thiết Lập
      │   ├── azure.yaml                    # Cấu hình Azure Developer CLI
      │   ├── docker-compose.yaml           # Container phát triển cục bộ
      │   ├── pyproject.toml                # Cấu hình dự án Python
      │   ├── requirements-dev.txt          # Các phụ thuộc phát triển
      │   └── .devcontainer/                # Thiết lập container dev của VS Code
      │
      ├── 🏗️ Cơ Sở Hạ Tầng (infra/)
      │   ├── main.bicep                    # Mẫu cơ sở hạ tầng chính
      │   ├── api.bicep                     # Tài nguyên dành riêng cho API
      │   ├── main.parameters.json          # Tham số cơ sở hạ tầng
      │   └── core/                         # Các thành phần cơ sở hạ tầng mô-đun
      │       ├── ai/                       # Cấu hình dịch vụ AI
      │       ├── host/                     # Cơ sở hạ tầng lưu trữ
      │       ├── monitor/                  # Giám sát và ghi nhật ký
      │       ├── search/                   # Thiết lập Azure AI Search
      │       ├── security/                 # Bảo mật và danh tính
      │       └── storage/                  # Cấu hình tài khoản lưu trữ
      │
      ├── 💻 Mã Nguồn Ứng Dụng (src/)
      │   ├── api/                          # API backend
      │   │   ├── main.py                   # Điểm vào ứng dụng FastAPI
      │   │   ├── routes.py                 # Định nghĩa route API
      │   │   ├── search_index_manager.py   # Chức năng tìm kiếm
      │   │   ├── data/                     # Xử lý dữ liệu API
      │   │   ├── static/                   # Tài sản web tĩnh
      │   │   └── templates/                # Mẫu HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Phụ thuộc Node.js
      │   │   ├── vite.config.ts            # Cấu hình build Vite
      │   │   └── src/                      # Mã nguồn frontend
      │   ├── data/                         # Tệp dữ liệu mẫu
      │   │   └── embeddings.csv            # Embedding đã tính trước
      │   ├── files/                        # Tệp cơ sở kiến thức
      │   │   ├── customer_info_*.json      # Mẫu dữ liệu khách hàng
      │   │   └── product_info_*.md         # Tài liệu sản phẩm
      │   ├── Dockerfile                    # Cấu hình container
      │   └── requirements.txt              # Phụ thuộc Python
      │
      ├── 🔧 Tự Động Hóa & Tập Lệnh (scripts/)
      │   ├── postdeploy.sh/.ps1           # Thiết lập sau triển khai
      │   ├── setup_credential.sh/.ps1     # Cấu hình thông tin đăng nhập
      │   ├── validate_env_vars.sh/.ps1    # Xác thực môi trường
      │   └── resolve_model_quota.sh/.ps1  # Quản lý hạn mức mô hình
      │
      ├── 🧪 Kiểm Tra & Đánh Giá
      │   ├── tests/                        # Kiểm tra đơn vị và tích hợp
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Khung đánh giá agent
      │   │   ├── evaluate.py               # Trình chạy đánh giá
      │   │   ├── eval-queries.json         # Truy vấn kiểm tra
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Sân chơi phát triển
      │   │   ├── 1-quickstart.py           # Ví dụ bắt đầu nhanh
      │   │   └── aad-interactive-chat.py   # Ví dụ xác thực
      │   └── airedteaming/                 # Đánh giá an toàn AI
      │       └── ai_redteaming.py          # Kiểm tra red team
      │
      ├── 📚 Tài Liệu (docs/)
      │   ├── deployment.md                 # Hướng dẫn triển khai
      │   ├── local_development.md          # Hướng dẫn thiết lập cục bộ
      │   ├── troubleshooting.md            # Các vấn đề thường gặp & cách khắc phục
      │   ├── azure_account_setup.md        # Các yêu cầu Azure
      │   └── images/                       # Tài sản tài liệu
      │
      └── 📄 Metadata Dự Án
         ├── README.md                     # Tổng quan dự án
         ├── CODE_OF_CONDUCT.md           # Nguyên tắc cộng đồng
         ├── CONTRIBUTING.md              # Hướng dẫn đóng góp
         ├── LICENSE                      # Điều khoản giấy phép
         └── next-steps.md                # Hướng dẫn sau triển khai
      ```

### 3.1. Kiến Trúc Ứng Dụng Cốt Lõi

Mẫu này tuân theo mô hình **ứng dụng web full-stack** với:

- **Backend**: Python FastAPI tích hợp Azure AI
- **Frontend**: TypeScript/React với hệ thống build Vite
- **Cơ Sở Hạ Tầng**: Mẫu Azure Bicep cho tài nguyên đám mây
- **Container hóa**: Docker để triển khai nhất quán

### 3.2 Cơ Sở Hạ Tầng Dưới Dạng Mã (bicep)

Lớp cơ sở hạ tầng sử dụng các mẫu **Azure Bicep** được tổ chức theo mô-đun:

   - **`main.bicep`**: Điều phối tất cả tài nguyên Azure
   - **`core/` modules**: Các thành phần tái sử dụng cho các dịch vụ khác nhau
      - Dịch vụ AI (Azure OpenAI, AI Search)
      - Lưu trữ container (Azure Container Apps)
      - Giám sát (Application Insights, Log Analytics)
      - Bảo mật (Key Vault, Managed Identity)

### 3.3 Mã Nguồn Ứng Dụng (`src/`)

**API Backend (`src/api/`)**:

- REST API dựa trên FastAPI
- Tích hợp dịch vụ Agent AI của Azure
- Quản lý chỉ mục tìm kiếm để truy xuất kiến thức
- Khả năng tải lên và xử lý tệp

**Frontend (`src/frontend/`)**:

- SPA React/TypeScript hiện đại
- Vite để phát triển nhanh và build tối ưu
- Giao diện chat cho tương tác với agent

**Cơ Sở Kiến Thức (`src/files/`)**:

- Dữ liệu khách hàng và sản phẩm mẫu
- Minh họa truy xuất kiến thức dựa trên tệp
- Các ví dụ định dạng JSON và Markdown

### 3.4 DevOps & Tự Động Hóa

**Tập Lệnh (`scripts/`)**:

- Tập lệnh PowerShell và Bash đa nền tảng
- Xác thực và thiết lập môi trường
- Cấu hình sau triển khai
- Quản lý hạn mức mô hình

**Tích Hợp Azure Developer CLI**:

- Cấu hình `azure.yaml` cho các workflow `azd`
- Tự động cung cấp và triển khai
- Quản lý biến môi trường

### 3.5 Kiểm Tra & Đảm Bảo Chất Lượng

**Khung Đánh Giá (`evals/`)**:

- Đánh giá hiệu suất agent
- Kiểm tra chất lượng truy vấn-phản hồi
- Pipeline đánh giá tự động

**An Toàn AI (`airedteaming/`)**:

- Kiểm tra red team cho an toàn AI
- Quét lỗ hổng bảo mật
- Thực hành AI có trách nhiệm

---

## 4. Chúc Mừng 🏆

Bạn đã sử dụng thành công GitHub Copilot Chat với MCP servers để khám phá kho lưu trữ.

- [X] Kích hoạt GitHub Copilot cho Azure
- [X] Hiểu Kiến Trúc Ứng Dụng
- [X] Khám phá cấu trúc mẫu AZD

Điều này giúp bạn có cái nhìn về các tài sản _cơ sở hạ tầng dưới dạng mã_ cho mẫu này. Tiếp theo, chúng ta sẽ xem xét tệp cấu hình cho AZD.

---

