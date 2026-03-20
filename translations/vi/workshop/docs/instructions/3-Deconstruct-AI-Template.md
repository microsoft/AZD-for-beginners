# 3. Phân tích một Mẫu

!!! tip "SAU KHI HOÀN THÀNH MÔ-ĐUN NÀY BẠN SẼ CÓ THỂ"

    - [ ] Kích hoạt GitHub Copilot với các máy chủ MCP để hỗ trợ Azure
    - [ ] Hiểu cấu trúc thư mục mẫu AZD và các thành phần
    - [ ] Khám phá các mô hình tổ chức cơ sở hạ tầng dưới dạng mã (Bicep)
    - [ ] **Bài lab 3:** Sử dụng GitHub Copilot để khám phá và hiểu kiến trúc kho mã 

---


Với các mẫu AZD và Azure Developer CLI (`azd`) chúng ta có thể nhanh chóng khởi động hành trình phát triển AI với những kho lưu trữ tiêu chuẩn cung cấp mã mẫu, cơ sở hạ tầng và các tệp cấu hình - dưới dạng một _dự án khởi đầu_ sẵn sàng để triển khai.

**Nhưng bây giờ, chúng ta cần hiểu cấu trúc dự án và mã nguồn - và có thể tùy chỉnh mẫu AZD - mà không cần kinh nghiệm hay hiểu biết trước về AZD!**

---

## 1. Kích hoạt GitHub Copilot

### 1.1 Cài đặt GitHub Copilot Chat

Đã đến lúc khám phá [GitHub Copilot ở Chế độ Agent](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Bây giờ, chúng ta có thể dùng ngôn ngữ tự nhiên để mô tả nhiệm vụ ở mức cao, và nhận trợ giúp trong việc thực thi. Cho lab này, chúng ta sẽ dùng [Copilot Free plan](https://github.com/github-copilot/signup) vốn có hạn mức hàng tháng cho các lần hoàn thành và tương tác chat.

Tiện ích mở rộng có thể được cài từ marketplace, nhưng thường đã có sẵn trong môi trường Codespaces của bạn. _Nhấp `Open Chat` từ menu thả xuống biểu tượng Copilot - và gõ một lời nhắc như `What can you do?`_ - bạn có thể sẽ được yêu cầu đăng nhập. **GitHub Copilot Chat đã sẵn sàng**.

### 1.2. Cài đặt MCP Servers

Để chế độ Agent hoạt động hiệu quả, nó cần truy cập các công cụ phù hợp để giúp nó truy xuất kiến thức hoặc thực hiện hành động. Đây là nơi các máy chủ MCP có thể hỗ trợ. Chúng ta sẽ cấu hình các máy chủ sau:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Để kích hoạt những thứ này:

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

??? warning "Bạn có thể gặp lỗi rằng `npx` chưa được cài (bấm để mở rộng hướng sửa)"

      Để khắc phục, hãy mở tệp `.devcontainer/devcontainer.json` và thêm dòng này vào phần features. Sau đó xây dựng lại container. Bạn sẽ có `npx` được cài đặt.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Kiểm tra GitHub Copilot Chat

**Trước tiên dùng `az login` để xác thực với Azure từ dòng lệnh VS Code.**

Bây giờ bạn nên có thể truy vấn trạng thái subscription Azure của mình, và đặt câu hỏi về các tài nguyên hoặc cấu hình đã triển khai. Thử các lời nhắc sau:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Bạn cũng có thể hỏi về tài liệu Azure và nhận các phản hồi dựa trên máy chủ Microsoft Docs MCP. Thử các lời nhắc này:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Hoặc bạn có thể yêu cầu đoạn mã để hoàn thành một nhiệm vụ. Thử lời nhắc này.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Ở chế độ `Ask`, điều này sẽ cung cấp mã mà bạn có thể sao chép-dán và thử. Ở chế độ `Agent`, điều này có thể tiến thêm một bước và tạo các tài nguyên liên quan cho bạn - bao gồm các script thiết lập và tài liệu - để giúp bạn thực thi nhiệm vụ đó.

**Bạn đã được trang bị để bắt đầu khám phá kho mẫu**

---

## 2. Phân tích Kiến trúc

??? prompt "HỎI: Giải thích kiến trúc ứng dụng trong docs/images/architecture.png trong 1 đoạn"

      Ứng dụng này là một ứng dụng chat được hỗ trợ AI xây dựng trên Azure, minh họa một kiến trúc hiện đại dựa trên tác nhân. Giải pháp tập trung xung quanh một Azure Container App lưu trữ mã ứng dụng chính, xử lý đầu vào người dùng và tạo các phản hồi thông minh thông qua một tác nhân AI.
      
      Kiến trúc tận dụng Microsoft Foundry Project làm nền tảng cho khả năng AI, kết nối với Azure AI Services cung cấp các mô hình ngôn ngữ nền tảng (chẳng hạn như gpt-4.1-mini) và chức năng tác nhân. Tương tác của người dùng chảy qua frontend dựa trên React đến backend FastAPI, nơi giao tiếp với dịch vụ tác nhân AI để tạo ra các phản hồi có ngữ cảnh.
      
      Hệ thống tích hợp khả năng truy xuất kiến thức thông qua tìm kiếm tệp hoặc dịch vụ Azure AI Search, cho phép tác nhân truy cập và trích dẫn thông tin từ các tài liệu được tải lên. Vì mục tiêu vận hành xuất sắc, kiến trúc bao gồm giám sát toàn diện thông qua Application Insights và Log Analytics Workspace để theo dõi, ghi nhật ký và tối ưu hiệu năng.
      
      Azure Storage cung cấp blob storage cho dữ liệu ứng dụng và tải lên tệp, trong khi Managed Identity đảm bảo truy cập an toàn giữa các tài nguyên Azure mà không lưu trữ thông tin xác thực. Toàn bộ giải pháp được thiết kế để có thể mở rộng và dễ bảo trì, với ứng dụng container hóa tự động mở rộng theo nhu cầu đồng thời cung cấp bảo mật, giám sát và khả năng CI/CD thông qua hệ sinh thái dịch vụ được quản lý của Azure.

![Kiến trúc](../../../../../translated_images/vi/architecture.48d94861e6e6cdc0.webp)

---

## 3. Cấu trúc Kho lưu trữ

!!! prompt "HỎI: Giải thích cấu trúc thư mục mẫu. Bắt đầu bằng một sơ đồ phân cấp trực quan."

??? info "TRẢ LỜI: Sơ đồ Phân cấp Trực quan"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Cấu hình & Thiết lập
      │   ├── azure.yaml                    # Cấu hình Azure Developer CLI
      │   ├── docker-compose.yaml           # Container phát triển cục bộ
      │   ├── pyproject.toml                # Cấu hình dự án Python
      │   ├── requirements-dev.txt          # Các phụ thuộc phát triển
      │   └── .devcontainer/                # Thiết lập dev container cho VS Code
      │
      ├── 🏗️ Hạ tầng (infra/)
      │   ├── main.bicep                    # Mẫu hạ tầng chính
      │   ├── api.bicep                     # Tài nguyên chuyên cho API
      │   ├── main.parameters.json          # Tham số hạ tầng
      │   └── core/                         # Thành phần hạ tầng mô-đun
      │       ├── ai/                       # Cấu hình dịch vụ AI
      │       ├── host/                     # Hạ tầng lưu trữ
      │       ├── monitor/                  # Giám sát và ghi nhật ký
      │       ├── search/                   # Thiết lập Azure AI Search
      │       ├── security/                 # Bảo mật và định danh
      │       └── storage/                  # Cấu hình tài khoản lưu trữ
      │
      ├── 💻 Mã Ứng dụng (src/)
      │   ├── api/                          # Backend API
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
      │   │   └── embeddings.csv            # Embeddings đã tính trước
      │   ├── files/                        # Tệp cơ sở tri thức
      │   │   ├── customer_info_*.json      # Mẫu dữ liệu khách hàng
      │   │   └── product_info_*.md         # Tài liệu sản phẩm
      │   ├── Dockerfile                    # Cấu hình container
      │   └── requirements.txt              # Phụ thuộc Python
      │
      ├── 🔧 Tự động hóa & Script (scripts/)
      │   ├── postdeploy.sh/.ps1           # Thiết lập sau triển khai
      │   ├── setup_credential.sh/.ps1     # Cấu hình thông tin xác thực
      │   ├── validate_env_vars.sh/.ps1    # Xác thực biến môi trường
      │   └── resolve_model_quota.sh/.ps1  # Quản lý hạn mức mô hình
      │
      ├── 🧪 Kiểm thử & Đánh giá
      │   ├── tests/                        # Unit và integration tests
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Khung đánh giá tác nhân
      │   │   ├── evaluate.py               # Trình chạy đánh giá
      │   │   ├── eval-queries.json         # Các truy vấn kiểm thử
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Sân chơi phát triển
      │   │   ├── 1-quickstart.py           # Ví dụ bắt đầu nhanh
      │   │   └── aad-interactive-chat.py   # Ví dụ xác thực
      │   └── airedteaming/                 # Đánh giá an toàn AI
      │       └── ai_redteaming.py          # Kiểm thử đội đỏ
      │
      ├── 📚 Tài liệu (docs/)
      │   ├── deployment.md                 # Hướng dẫn triển khai
      │   ├── local_development.md          # Hướng dẫn thiết lập cục bộ
      │   ├── troubleshooting.md            # Vấn đề thường gặp & sửa lỗi
      │   ├── azure_account_setup.md        # Yêu cầu trước với Azure
      │   └── images/                       # Tài nguyên hình ảnh cho tài liệu
      │
      └── 📄 Siêu dữ liệu Dự án
         ├── README.md                     # Tổng quan dự án
         ├── CODE_OF_CONDUCT.md           # Nguyên tắc cộng đồng
         ├── CONTRIBUTING.md              # Hướng dẫn đóng góp
         ├── LICENSE                      # Điều khoản cấp phép
         └── next-steps.md                # Hướng dẫn sau triển khai
      ```

### 3.1. Kiến trúc Ứng dụng Cốt lõi

Mẫu này tuân theo mô hình **ứng dụng web toàn diện** với:

- **Backend**: Python FastAPI tích hợp Azure AI
- **Frontend**: TypeScript/React với hệ thống build Vite
- **Hạ tầng**: Mẫu Azure Bicep cho các tài nguyên đám mây
- **Containerization**: Docker để triển khai nhất quán

### 3.2 Hạ tầng dưới dạng Mã (bicep)

Lớp hạ tầng sử dụng các mẫu **Azure Bicep** được tổ chức theo mô-đun:

   - **`main.bicep`**: Điều phối tất cả các tài nguyên Azure
   - **`core/` modules**: Các thành phần tái sử dụng cho các dịch vụ khác nhau
      - Dịch vụ AI (Microsoft Foundry Models, AI Search)
      - Lưu trữ container (Azure Container Apps)
      - Giám sát (Application Insights, Log Analytics)
      - Bảo mật (Key Vault, Managed Identity)

### 3.3 Mã Nguồn Ứng dụng (`src/`)

**Backend API (`src/api/`)**:

- REST API dựa trên FastAPI
- Tích hợp Foundry Agents
- Quản lý search index cho truy xuất tri thức
- Khả năng tải lên và xử lý tệp

**Frontend (`src/frontend/`)**:

- SPA hiện đại React/TypeScript
- Vite cho phát triển nhanh và build tối ưu
- Giao diện chat cho tương tác với tác nhân

**Cơ sở tri thức (`src/files/`)**:

- Dữ liệu mẫu khách hàng và sản phẩm
- Minh họa truy xuất tri thức dựa trên tệp
- Ví dụ định dạng JSON và Markdown


### 3.4 DevOps & Tự động hóa

**Script (`scripts/`)**:

- Script PowerShell và Bash đa nền tảng
- Xác thực và thiết lập môi trường
- Cấu hình sau triển khai
- Quản lý hạn mức mô hình

**Tích hợp Azure Developer CLI**:

- Cấu hình `azure.yaml` cho workflow `azd`
- Cấp phát và triển khai tự động
- Quản lý biến môi trường

### 3.5 Kiểm thử & Đảm bảo Chất lượng

**Khung Đánh giá (`evals/`)**:

- Đánh giá hiệu năng tác nhân
- Kiểm thử chất lượng phản hồi theo truy vấn
- Quy trình đánh giá tự động

**An toàn AI (`airedteaming/`)**:

- Kiểm thử đội đỏ cho an toàn AI
- Quét lỗ hổng bảo mật
- Thực hành AI có trách nhiệm

---

## 4. Chúc mừng 🏆

Bạn đã sử dụng GitHub Copilot Chat với các máy chủ MCP để khám phá kho lưu trữ thành công.

- [X] Đã kích hoạt GitHub Copilot cho Azure
- [X] Đã hiểu Kiến trúc Ứng dụng
- [X] Đã khám phá cấu trúc mẫu AZD

Điều này giúp bạn có cái nhìn về các tài sản _hạ tầng dưới dạng mã_ cho mẫu này. Tiếp theo, chúng ta sẽ xem tệp cấu hình cho AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch tự động AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do người dịch có chuyên môn thực hiện. Chúng tôi không chịu trách nhiệm đối với bất kỳ sự hiểu nhầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->