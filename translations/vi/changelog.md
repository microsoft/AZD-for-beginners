# Nhật ký thay đổi - AZD For Beginners

## Giới thiệu

Nhật ký thay đổi này ghi lại tất cả các thay đổi, cập nhật và cải tiến đáng chú ý cho kho AZD For Beginners. Chúng tôi tuân theo các nguyên tắc phân phiên bản ngữ nghĩa và duy trì nhật ký này để giúp người dùng hiểu những gì đã thay đổi giữa các phiên bản.

## Mục tiêu học tập

Khi xem xét nhật ký thay đổi này, bạn sẽ:
- Nắm được các tính năng mới và nội dung được thêm vào
- Hiểu được các cải tiến cho tài liệu hiện có
- Theo dõi các bản sửa lỗi và hiệu chỉnh để đảm bảo tính chính xác
- Theo dõi quá trình phát triển của tài liệu học theo thời gian

## Kết quả học tập

Sau khi xem các mục trong nhật ký thay đổi, bạn sẽ có thể:
- Xác định nội dung và tài nguyên mới có sẵn cho việc học
- Hiểu được những phần nào đã được cập nhật hoặc cải thiện
- Lên kế hoạch lộ trình học dựa trên tài liệu mới nhất
- Đóng góp phản hồi và đề xuất cho các cải tiến trong tương lai

## Lịch sử phiên bản

### [v3.19.1] - 2026-03-27

#### Beginner Onboarding Clarification, Setup Validation & Final AZD Command Cleanup
**Phiên bản này theo sau đợt kiểm tra xác thực AZD 1.23 với một lượt chỉnh sửa tài liệu tập trung cho người mới: làm rõ hướng dẫn xác thực ưu tiên AZD, thêm script xác thực thiết lập cục bộ, kiểm tra các lệnh chính với AZD CLI trực tiếp, và loại bỏ các tham chiếu lệnh nguồn tiếng Anh lỗi thời cuối cùng ngoài nhật ký thay đổi.**

#### Added
- **🧪 Script xác thực thiết lập cho người mới** với `validate-setup.ps1` và `validate-setup.sh` để người học có thể xác nhận các công cụ cần thiết trước khi bắt đầu Chương 1
- **✅ Các bước xác thực thiết lập trước** trong README gốc và README Chương 1 để các tiền điều kiện thiếu được phát hiện trước khi `azd up`

#### Changed
- **🔐 Hướng dẫn xác thực cho người mới** hiện thống nhất xem `azd auth login` là con đường chính cho các luồng công việc AZD, với `az login` được nêu là tùy chọn trừ khi các lệnh Azure CLI được sử dụng trực tiếp
- **📚 Luồng onboarding Chương 1** hiện hướng dẫn người học xác thực thiết lập cục bộ trước khi cài đặt, xác thực và các bước triển khai đầu tiên
- **🛠️ Thông điệp trình xác thực** giờ tách rõ các yêu cầu chặn khỏi các cảnh báo Azure CLI tùy chọn cho lộ trình dành cho người mới chỉ dùng AZD
- **📖 Tài liệu cấu hình, khắc phục sự cố và ví dụ** giờ phân biệt giữa xác thực AZD bắt buộc và đăng nhập Azure CLI tùy chọn khi cả hai trước đây được trình bày mà không có ngữ cảnh

#### Fixed
- **📋 Các tham chiếu lệnh nguồn tiếng Anh còn lại** đã được cập nhật sang dạng AZD hiện hành, bao gồm `azd config show` trong bảng tổng hợp và `azd monitor --overview` nơi hướng dẫn tổng quan Azure Portal được dự định
- **🧭 Các khẳng định cho người mới ở Chương 1** được làm nhẹ để tránh hứa hẹn quá mức về việc đảm bảo không lỗi hoặc hành vi rollback cho tất cả mẫu và tài nguyên Azure
- **🔎 Xác thực CLI trực tiếp** đã xác nhận hỗ trợ hiện tại cho `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, và `azd down --force --purge`

#### Files Updated
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 Validation, Workshop Environment Expansion & AI Model Refresh
**Phiên bản này thực hiện một lượt kiểm tra xác thực tài liệu so với `azd` `1.23.12`, cập nhật các ví dụ lệnh AZD lỗi thời, làm mới hướng dẫn mô hình AI để về mặc định hiện tại, và mở rộng hướng dẫn workshop vượt ra ngoài GitHub Codespaces để hỗ trợ dev container và clone cục bộ.**

#### Added
- **✅ Ghi chú xác thực trong các chương cốt lõi và tài liệu workshop** để làm rõ baseline AZD đã được kiểm tra cho người học dùng các bản CLI mới hơn hoặc cũ hơn
- **⏱️ Hướng dẫn timeout triển khai** cho các triển khai ứng dụng AI chạy lâu sử dụng `azd deploy --timeout 1800`
- **🔎 Các bước kiểm tra extension** với `azd extension show azure.ai.agents` trong tài liệu luồng công việc AI
- **🌐 Hướng dẫn môi trường workshop rộng hơn** bao gồm GitHub Codespaces, dev container và clone cục bộ với MkDocs

#### Changed
- **📚 README giới thiệu chương** giờ nhất quán ghi chú đã xác thực với `azd 1.23.12` trên các phần foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting và production
- **🛠️ Tham chiếu lệnh AZD** được cập nhật sang dạng hiện tại trên toàn tài liệu:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` hoặc `azd env get-value(s)` tùy theo ngữ cảnh
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` nơi cần tổng quan Application Insights
- **🧪 Ví dụ preview provision** được đơn giản hóa sang cách dùng được hỗ trợ hiện tại như `azd provision --preview` và `azd provision --preview -e production`
- **🧭 Luồng workshop** được cập nhật để người học có thể hoàn thành lab trong Codespaces, dev container hoặc clone cục bộ thay vì giả định chỉ thực thi trong Codespaces
- **🔐 Hướng dẫn xác thực** giờ ưu tiên `azd auth login` cho các luồng công việc AZD, với `az login` được đặt là tùy chọn khi sử dụng trực tiếp các lệnh Azure CLI

#### Fixed
- **🪟 Lệnh cài đặt Windows** chuẩn hóa sang viết hoa package `winget` hiện hành trong hướng dẫn cài đặt
- **🐧 Hướng dẫn cài đặt Linux** được sửa để tránh chỉ dẫn trình quản lý gói `azd` theo distro không được hỗ trợ và thay vào đó trỏ tới release assets khi phù hợp
- **📦 Ví dụ mô hình AI** được làm mới từ các mặc định cũ như `gpt-35-turbo` và `text-embedding-ada-002` sang các ví dụ hiện tại như `gpt-4.1-mini`, `gpt-4.1`, và `text-embedding-3-large`
- **📋 Đoạn mã triển khai và chẩn đoán** được sửa để dùng các lệnh môi trường và trạng thái hiện tại trong logs, script và bước khắc phục
- **⚙️ Hướng dẫn GitHub Actions** được cập nhật từ `Azure/setup-azd@v1.0.0` lên `Azure/setup-azd@v2`
- **🤖 Hướng dẫn đồng thuận MCP/Copilot** được cập nhật từ `azd mcp consent` sang `azd copilot consent list`

#### Improved
- **🧠 Hướng dẫn chương AI** giờ giải thích rõ hơn hành vi nhạy cảm preview của `azd ai`, đăng nhập theo tenant, cách dùng extension hiện tại, và khuyến nghị triển khai mô hình đã cập nhật
- **🧪 Hướng dẫn workshop** giờ dùng các ví dụ phiên bản thực tế hơn và ngôn ngữ thiết lập môi trường rõ ràng hơn cho lab thực hành
- **📈 Tài liệu production và khắc phục sự cố** giờ phù hợp hơn với giám sát hiện tại, mô hình dự phòng và ví dụ cấp chi phí

#### Files Updated
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**Phiên bản này thêm phạm vi lệnh `azd ai`, `azd extension`, và `azd mcp` trong toàn bộ các chương liên quan đến AI, sửa các liên kết hỏng và mã lỗi thời trong agents.md, cập nhật bảng tổng hợp lệnh, và đại tu phần Mẫu Ví dụ với mô tả đã được xác thực và các mẫu Azure AI AZD mới.**

#### Added
- **🤖 Phủ lệnh AZD AI CLI** trên 7 file (trước đây chỉ có ở Chương 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Mục mới "Extensions and AI Commands" giới thiệu `azd extension`, `azd ai agent init`, và `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Tùy chọn 4: `azd ai agent init` với bảng so sánh (mẫu vs cách tiếp cận manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Các mục "AZD Extensions for Foundry" và "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start giờ hiển thị cả đường dẫn triển khai theo mẫu và theo manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Phần Deploy giờ bao gồm tùy chọn `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Mục phụ "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Mục mới "AI & Extensions Commands" với `azd extension`, `azd ai agent init`, `azd mcp`, và `azd infra generate`
- **📦 Các mẫu ví dụ AZD AI mới** trong `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — chat RAG .NET với Blazor WebAssembly, Semantic Kernel, và hỗ trợ chat bằng giọng nói
  - **azure-search-openai-demo-java** — chat RAG Java sử dụng Langchain4J với tùy chọn triển khai ACA/AKS
  - **contoso-creative-writer** — ứng dụng viết sáng tạo đa tác nhân sử dụng Azure AI Agent Service, Bing Grounding, và Prompty
  - **serverless-chat-langchainjs** — RAG serverless sử dụng Azure Functions + LangChain.js + Cosmos DB với hỗ trợ phát triển cục bộ Ollama
  - **chat-with-your-data-solution-accelerator** — bộ tăng tốc RAG doanh nghiệp với cổng quản trị, tích hợp Teams, và tùy chọn PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — ứng dụng tham chiếu điều phối MCP đa tác nhân với server bằng .NET, Python, Java, và TypeScript
  - **azd-ai-starter** — mẫu khởi tạo Bicep hạ tầng Azure AI tối giản
  - **🔗 Liên kết thư viện awesome-azd AI** — Tham chiếu tới [thư viện awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ mẫu)

#### Fixed
- **🔗 Điều hướng agents.md**: các liên kết Previous/Next giờ khớp theo thứ tự bài học trong README Chương 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Liên kết hỏng trong agents.md**: `production-ai-practices.md` được sửa thành `../chapter-08-production/production-ai-practices.md` (3 lần)
- **📦 Mã lỗi thời trong agents.md**: Thay `opencensus` bằng `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API không hợp lệ trong agents.md**: Di chuyển `max_tokens` từ `create_agent()` sang `create_run()` dưới tên `max_completion_tokens`
- **🔢 Đếm token trong agents.md**: Thay ước lượng thô `len//4` bằng `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Sửa tên dịch vụ từ "Cognitive Search + App Service" thành "Azure AI Search + Azure Container Apps" (host mặc định thay đổi Oct 2024)
- **contoso-chat**: Cập nhật mô tả để tham chiếu Azure AI Foundry + Prompty, khớp với tiêu đề và stack công nghệ thực tế của repo

#### Removed
- **ai-document-processing**: Loại bỏ tham chiếu mẫu không hoạt động (repo không công khai truy cập như một mẫu AZD)

#### Improved
- **📝 agents.md exercises**: Bài tập 1 bây giờ hiển thị kết quả mong đợi và bước `azd monitor`; Bài tập 2 bao gồm mã đăng ký đầy đủ cho `FunctionTool`; Bài tập 3 thay hướng dẫn mơ hồ bằng các lệnh cụ thể `prepdocs.py`
- **📚 agents.md resources**: Cập nhật các liên kết tài liệu đến tài liệu hiện tại của Azure AI Agent Service và quickstart
- **📋 agents.md Next Steps table**: Thêm liên kết AI Workshop Lab để bao phủ đầy đủ chương

#### Files Updated
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Course Navigation Enhancement
**Phiên bản này cải thiện điều hướng chương trong README.md với định dạng bảng được nâng cấp.**

#### Changed
- **Course Map Table**: Được nâng cấp với liên kết bài học trực tiếp, ước tính thời lượng và xếp hạng độ phức tạp
- **Folder Cleanup**: Đã loại bỏ các thư mục cũ thừa (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Tất cả 21+ liên kết nội bộ trong bảng Course Map đã được xác minh

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Phiên bản này cập nhật các tham chiếu sản phẩm theo thương hiệu Microsoft hiện tại.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: Tất cả các tham chiếu đã được cập nhật trên các tệp không phải bản dịch
- **Azure AI Agent Service → Foundry Agents**: Tên dịch vụ được cập nhật để phản ánh thương hiệu hiện tại

#### Files Updated
- `README.md` - Trang đích chính của khóa học
- `changelog.md` - Lịch sử phiên bản
- `course-outline.md` - Cấu trúc khóa học
- `docs/chapter-02-ai-development/agents.md` - Hướng dẫn về AI agents
- `examples/README.md` - Tài liệu ví dụ
- `workshop/README.md` - Trang đích workshop
- `workshop/docs/index.md` - Mục lục workshop
- `workshop/docs/instructions/*.md` - Tất cả tệp hướng dẫn workshop

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**Phiên bản này tái cấu trúc tài liệu thành các thư mục chương riêng biệt để điều hướng rõ ràng hơn.**

#### Folder Renames
Các thư mục cũ đã được thay thế bằng các thư mục được đánh số chương:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Thêm mới: `docs/chapter-05-multi-agent/`

#### File Migrations
| Tệp | Từ | Đến |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Added
- **📚 Chapter README files**: Tạo README.md trong mỗi thư mục chương với:
  - Mục tiêu học tập và thời lượng
  - Bảng bài học kèm mô tả
  - Các lệnh Quick start
  - Điều hướng đến các chương khác

#### Changed
- **🔗 Updated all internal links**: 78+ đường dẫn đã được cập nhật trên tất cả các tệp tài liệu
- **🗺️ Main README.md**: Cập nhật Course Map với cấu trúc chương mới
- **📝 examples/README.md**: Cập nhật tham chiếu chéo đến các thư mục chương

#### Removed
- Cấu trúc thư mục cũ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Phiên bản này thêm các tệp README điều hướng chương (sau đó bị thay thế bởi v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Phiên bản này thêm một hướng dẫn toàn diện để triển khai AI agents với Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Hướng dẫn đầy đủ bao gồm:
  - AI agents là gì và khác gì so với chatbots
  - Ba mẫu khởi động nhanh cho agents (Foundry Agents, Prompty, RAG)
  - Các mô hình kiến trúc agent (single agent, RAG, multi-agent)
  - Cấu hình và tùy chỉnh công cụ
  - Theo dõi và đo lường giám sát
  - Cân nhắc chi phí và tối ưu hóa
  - Các tình huống khắc phục sự cố phổ biến
  - Ba bài tập thực hành có tiêu chí thành công

#### Content Structure
- **Introduction**: Khái niệm về agent cho người mới
- **Quick Start**: Triển khai agents với `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Hình vẽ minh họa các mô hình agent
- **Configuration**: Thiết lập công cụ và biến môi trường
- **Monitoring**: Tích hợp Application Insights
- **Exercises**: Học thực hành theo tiến trình (20-45 phút mỗi bài)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Phiên bản này cập nhật cấu hình dev container với công cụ hiện đại và mặc định tốt hơn cho trải nghiệm học AZD.**

#### Changed
- **🐳 Base Image**: Cập nhật từ `python:3.12-bullseye` sang `python:3.12-bookworm` (Debian stable mới nhất)
- **📛 Container Name**: Đổi tên từ "Python 3" thành "AZD for Beginners" để rõ ràng hơn

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` với hỗ trợ Bicep được bật
  - `node:20` (phiên bản LTS cho mẫu AZD)
  - `github-cli` để quản lý template
  - `docker-in-docker` cho triển khai container app

- **🔌 Port Forwarding**: Các cổng được cấu hình sẵn cho phát triển phổ biến:
  - 8000 (Xem trước MkDocs)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 New VS Code Extensions**:
  - `ms-python.vscode-pylance` - Cải thiện IntelliSense cho Python
  - `ms-azuretools.vscode-azurefunctions` - Hỗ trợ Azure Functions
  - `ms-azuretools.vscode-docker` - Hỗ trợ Docker
  - `ms-azuretools.vscode-bicep` - Hỗ trợ ngôn ngữ Bicep
  - `ms-azure-devtools.azure-resource-groups` - Quản lý tài nguyên Azure
  - `yzhang.markdown-all-in-one` - Chỉnh sửa Markdown
  - `DavidAnson.vscode-markdownlint` - Kiểm tra lint Markdown
  - `bierner.markdown-mermaid` - Hỗ trợ biểu đồ Mermaid
  - `redhat.vscode-yaml` - Hỗ trợ YAML (cho azure.yaml)
  - `eamodio.gitlens` - Trực quan hóa Git
  - `mhutchie.git-graph` - Lịch sử Git

- **⚙️ VS Code Settings**: Thêm cài đặt mặc định cho bộ thông dịch Python, format on save và cắt bớt khoảng trắng

- **📦 Updated requirements-dev.txt**:
  - Thêm plugin MkDocs minify
  - Thêm pre-commit cho chất lượng mã
  - Thêm các gói Azure SDK (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Bây giờ kiểm tra AZD và Azure CLI khi container khởi động

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Phiên bản này cải thiện đáng kể README.md để thân thiện hơn với người mới và thêm các tài nguyên thiết yếu cho nhà phát triển AI.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Giải thích rõ khi nào nên dùng mỗi công cụ kèm ví dụ thực tế
- **🌟 Awesome AZD Links**: Liên kết trực tiếp đến thư viện template cộng đồng và tài nguyên đóng góp:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ mẫu sẵn sàng triển khai
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Đóng góp template cộng đồng
- **🎯 Quick Start Guide**: Phần bắt đầu nhanh 3 bước được đơn giản hóa (Cài đặt → Đăng nhập → Triển khai)
- **📊 Experience-Based Navigation Table**: Hướng dẫn rõ ràng về nơi để bắt đầu dựa trên kinh nghiệm của nhà phát triển

#### Changed
- **README Structure**: Tổ chức lại để hiển thị dần dần thông tin - thông tin quan trọng trước
- **Introduction Section**: Viết lại để giải thích "The Magic of `azd up`" cho người mới hoàn toàn
- **Removed Duplicate Content**: Loại bỏ phần giải quyết sự cố trùng lặp
- **Troubleshooting Commands**: Sửa tham chiếu `azd logs` để dùng lệnh hợp lệ `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: Thêm `azd auth login` và `azd auth logout` vào cheat-sheet.md
- **Invalid Command References**: Loại bỏ các tham chiếu `azd logs` còn sót trong phần xử lý sự cố của README

#### Notes
- **Scope**: Các thay đổi áp dụng cho README.md chính và resources/cheat-sheet.md
- **Target Audience**: Cải tiến nhắm tới các nhà phát triển mới làm quen với AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Phiên bản này sửa các lệnh AZD không tồn tại trong toàn bộ tài liệu, đảm bảo mọi ví dụ mã sử dụng cú pháp Azure Developer CLI hợp lệ.**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: Kiểm toán toàn diện và sửa các lệnh không hợp lệ:
  - `azd logs` (không tồn tại) → thay bằng `azd monitor --logs` hoặc các lựa chọn thay thế Azure CLI
  - Các lệnh con `azd service` (không tồn tại) → thay bằng `azd show` và Azure CLI
  - `azd infra import/export/validate` (không tồn tại) → đã loại bỏ hoặc thay bằng các lựa chọn hợp lệ
  - Các cờ `azd deploy --rollback/--incremental/--parallel/--detect-changes` (không tồn tại) → đã loại bỏ
  - Các cờ `azd provision --what-if/--rollback` (không tồn tại) → cập nhật để dùng `--preview`
  - `azd config validate` (không tồn tại) → thay bằng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (không tồn tại) → đã loại bỏ

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Cải tổ lớn phần tham khảo lệnh
  - `docs/deployment/deployment-guide.md`: Sửa chiến lược rollback và triển khai
  - `docs/troubleshooting/debugging.md`: Sửa phần phân tích log
  - `docs/troubleshooting/common-issues.md`: Cập nhật lệnh khắc phục sự cố
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa phần gỡ lỗi AZD
  - `docs/getting-started/azd-basics.md`: Sửa lệnh giám sát
  - `docs/getting-started/first-project.md`: Cập nhật ví dụ giám sát và gỡ lỗi
  - `docs/getting-started/installation.md`: Sửa ví dụ help và version
  - `docs/pre-deployment/application-insights.md`: Sửa lệnh xem log
  - `docs/pre-deployment/coordination-patterns.md`: Sửa lệnh gỡ lỗi agent

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Thay hardcoded `1.5.0` bằng `1.x.x` chung với liên kết tới releases

#### Changed
- **Rollback Strategies**: Cập nhật tài liệu để sử dụng rollback dựa trên Git (AZD không có rollback nguyên thủy)
- **Log Viewing**: Thay các tham chiếu `azd logs` bằng `azd monitor --logs`, `azd monitor --live`, và các lệnh Azure CLI
- **Performance Section**: Loại bỏ các cờ triển khai song song/tăng dần không tồn tại, cung cấp các lựa chọn hợp lệ thay thế

#### Technical Details
- **Lệnh AZD hợp lệ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Cờ hợp lệ cho azd monitor**: `--live`, `--logs`, `--overview`
- **Tính năng đã loại bỏ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Ghi chú
- **Xác minh**: Các lệnh được xác thực với Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Hoàn thành Workshop và Cập nhật Chất lượng Tài liệu
**Phiên bản này hoàn thành các module workshop tương tác, sửa tất cả các liên kết tài liệu bị hỏng và cải thiện chất lượng nội dung tổng thể cho các nhà phát triển AI sử dụng Microsoft AZD.**

#### Đã thêm
- **📝 CONTRIBUTING.md**: Tài liệu hướng dẫn đóng góp mới với:
  - Hướng dẫn rõ ràng để báo cáo sự cố và đề xuất thay đổi
  - Tiêu chuẩn tài liệu cho nội dung mới
  - Hướng dẫn ví dụ mã và quy ước tin nhắn commit
  - Thông tin tham gia cộng đồng

#### Hoàn thành
- **🎯 Workshop Module 7 (Wrap-up)**: Hoàn tất module wrap-up với:
  - Tóm tắt toàn diện những thành tựu của workshop
  - Phần các khái niệm chính đã nắm vững bao gồm AZD, templates và Microsoft Foundry
  - Khuyến nghị tiếp tục hành trình học tập
  - Bài tập thách thức workshop với xếp hạng độ khó
  - Phản hồi cộng đồng và liên kết hỗ trợ

- **📚 Workshop Module 3 (Deconstruct)**: Cập nhật mục tiêu học tập với:
  - Hướng dẫn kích hoạt GitHub Copilot với MCP servers
  - Hiểu cấu trúc thư mục template AZD
  - Mẫu tổ chức Infrastructure-as-code (Bicep)
  - Hướng dẫn lab thực hành

- **🔧 Workshop Module 6 (Teardown)**: Hoàn thành với:
  - Mục tiêu dọn dẹp tài nguyên và quản lý chi phí
  - Sử dụng `azd down` để gỡ bỏ hạ tầng an toàn
  - Hướng dẫn phục hồi các cognitive services bị xóa mềm
  - Các đề xuất khám phá bổ sung cho GitHub Copilot và Azure Portal

#### Sửa lỗi
- **🔗 Sửa các liên kết hỏng**: Đã xử lý hơn 15 liên kết nội bộ trong tài liệu:
  - `docs/ai-foundry/ai-model-deployment.md`: Sửa đường dẫn tới microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa ai-model-deployment.md và production-ai-practices.md
  - `docs/getting-started/first-project.md`: Thay cicd-integration.md không tồn tại bằng deployment-guide.md
  - `examples/retail-scenario.md`: Sửa đường dẫn FAQ và hướng dẫn khắc phục sự cố
  - `examples/container-app/microservices/README.md`: Sửa đường dẫn course home và deployment guide
  - `resources/faq.md` và `resources/glossary.md`: Cập nhật tham chiếu chương AI
  - `course-outline.md`: Sửa tham chiếu instructor guide và lab workshop AI

- **📅 Banner Trạng thái Workshop**: Cập nhật từ "Under Construction" sang trạng thái workshop hoạt động với ngày February 2026

- **🔗 Điều hướng Workshop**: Sửa các liên kết điều hướng hỏng trong workshop README.md trỏ đến thư mục lab-1-azd-basics không tồn tại

#### Đã thay đổi
- **Trình bày Workshop**: Loại bỏ cảnh báo "under construction", workshop hiện đã hoàn tất và sẵn sàng sử dụng
- **Tính nhất quán điều hướng**: Đảm bảo tất cả các module workshop có điều hướng liên-module đúng
- **Tham chiếu lộ trình học**: Cập nhật các tham chiếu chương để sử dụng đúng đường dẫn microsoft-foundry

#### Đã xác nhận
- ✅ Tất cả các tệp markdown tiếng Anh có liên kết nội bộ hợp lệ
- ✅ Các module workshop 0-7 hoàn chỉnh với mục tiêu học tập
- ✅ Điều hướng giữa các chương và module hoạt động chính xác
- ✅ Nội dung phù hợp cho các nhà phát triển AI sử dụng Microsoft AZD
- ✅ Ngôn ngữ và cấu trúc thân thiện với người mới
- ✅ CONTRIBUTING.md cung cấp hướng dẫn rõ ràng cho cộng đồng đóng góp

#### Triển khai kỹ thuật
- **Xác thực liên kết**: Script PowerShell tự động kiểm tra tất cả các liên kết .md nội bộ
- **Đánh giá nội dung**: Đánh giá thủ công về độ hoàn chỉnh của workshop và phù hợp cho người mới
- **Hệ thống điều hướng**: Áp dụng các mẫu điều hướng chương và module nhất quán

#### Ghi chú
- **Phạm vi**: Các thay đổi áp dụng cho tài liệu tiếng Anh
- **Bản dịch**: Thư mục bản dịch không được cập nhật trong phiên bản này (bản dịch tự động sẽ đồng bộ sau)
- **Thời lượng Workshop**: Workshop hoàn chỉnh hiện cung cấp 3-4 giờ học thực hành

---

### [v3.8.0] - 2025-11-19

#### Tài liệu nâng cao: Giám sát, Bảo mật và Mẫu Đa tác tử
**Phiên bản này bổ sung các bài học cấp A toàn diện về tích hợp Application Insights, các mẫu xác thực và phối hợp đa-tác tử cho triển khai sản xuất.**

#### Đã thêm
- **📊 Bài học Tích hợp Application Insights**: trong `docs/pre-deployment/application-insights.md`:
  - Triển khai tập trung AZD với việc cấp phát tự động
  - Các template Bicep hoàn chỉnh cho Application Insights + Log Analytics
  - Ứng dụng Python hoạt động với telemetry tùy chỉnh (1,200+ dòng)
  - Mẫu giám sát AI/LLM (theo dõi token/chi phí Microsoft Foundry Models)
  - 6 sơ đồ Mermaid (kiến trúc, distributed tracing, luồng telemetry)
  - 3 bài tập thực hành (alerts, dashboards, giám sát AI)
  - Ví dụ truy vấn Kusto và chiến lược tối ưu chi phí
  - Streaming chỉ số trực tiếp và gỡ lỗi thời gian thực
  - Thời lượng học 40-50 phút với các mẫu sẵn sàng cho sản xuất

- **🔐 Bài học Mẫu Xác thực & Bảo mật**: trong `docs/getting-started/authsecurity.md`:
  - 3 mẫu xác thực (connection strings, Key Vault, managed identity)
  - Template hạ tầng Bicep hoàn chỉnh cho triển khai an toàn
  - Mã ứng dụng Node.js tích hợp Azure SDK
  - 3 bài tập hoàn chỉnh (kích hoạt managed identity, user-assigned identity, quay vòng Key Vault)
  - Thực hành tốt về bảo mật và cấu hình RBAC
  - Hướng dẫn khắc phục sự cố và phân tích chi phí
  - Mẫu xác thực không mật khẩu sẵn sàng cho môi trường sản xuất

- **🤖 Bài học Mẫu Phối hợp Đa-Tác tử**: trong `docs/pre-deployment/coordination-patterns.md`:
  - 5 mẫu phối hợp (tuần tự, song song, phân cấp, kích hoạt theo sự kiện, đồng thuận)
  - Triển khai dịch vụ orchestrator hoàn chỉnh (Python/Flask, 1,500+ dòng)
  - 3 triển khai agent chuyên biệt (Research, Writer, Editor)
  - Tích hợp Service Bus cho xếp hàng tin nhắn
  - Quản lý trạng thái bằng Cosmos DB cho hệ phân tán
  - 6 sơ đồ Mermaid thể hiện tương tác giữa các agent
  - 3 bài tập nâng cao (xử lý timeout, logic retry, circuit breaker)
  - Phân tích chi phí ($240-565/month) cùng chiến lược tối ưu
  - Tích hợp Application Insights để giám sát

#### Nâng cao
- **Chương Pre-deployment**: Bổ sung đầy đủ giám sát và mẫu phối hợp
- **Chương Getting Started**: Nâng cao với các mẫu xác thực chuyên nghiệp
- **Sẵn sàng cho sản xuất**: Bao phủ toàn diện từ bảo mật đến quan sát

#### Đã thay đổi
- **Tiến trình học**: Tích hợp tốt hơn bảo mật và giám sát xuyên suốt khóa học
- **Chất lượng tài liệu**: Tiêu chuẩn A-grade nhất quán (95-97%) cho các bài học mới
- **Mẫu sản xuất**: Bao phủ end-to-end cho triển khai doanh nghiệp

#### Cải thiện
- **Trải nghiệm nhà phát triển**: Lộ trình rõ ràng từ phát triển đến giám sát khi lên sản xuất
- **Tiêu chuẩn bảo mật**: Mẫu chuyên nghiệp cho xác thực và quản lý bí mật
- **Quan sát**: Tích hợp Application Insights hoàn chỉnh với AZD
- **Tải công việc AI**: Giám sát chuyên biệt cho Microsoft Foundry Models và hệ thống đa-tác tử

#### Đã xác nhận
- ✅ Tất cả bài học bao gồm mã hoạt động hoàn chỉnh (không chỉ là đoạn mã)
- ✅ Sơ đồ Mermaid cho học trực quan (19 sơ đồ tổng cộng trong 3 bài học)
- ✅ Bài tập thực hành với bước xác minh (9 bài tổng cộng)
- ✅ Template Bicep sẵn sàng cho sản xuất có thể triển khai qua `azd up`
- ✅ Phân tích chi phí và chiến lược tối ưu
- ✅ Hướng dẫn khắc phục sự cố và thực hành tốt
- ✅ Các điểm kiểm tra kiến thức với lệnh xác minh

#### Kết quả chấm điểm Tài liệu
- **docs/pre-deployment/application-insights.md**: - Hướng dẫn giám sát toàn diện
- **docs/getting-started/authsecurity.md**: - Mẫu bảo mật chuyên nghiệp
- **docs/pre-deployment/coordination-patterns.md**: - Kiến trúc đa-tác tử nâng cao
- **Nội dung mới tổng thể**: - Tiêu chuẩn chất lượng cao đồng đều

#### Triển khai kỹ thuật
- **Application Insights**: Log Analytics + telemetry tùy chỉnh + distributed tracing
- **Xác thực**: Managed Identity + Key Vault + mẫu RBAC
- **Đa-Tác tử**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Giám sát**: Chỉ số trực tiếp + truy vấn Kusto + alerts + dashboards
- **Quản lý chi phí**: Chiến lược sampling, chính sách lưu trữ, điều khiển ngân sách

### [v3.7.0] - 2025-11-19

#### Cải thiện chất lượng tài liệu và Ví dụ Microsoft Foundry Models mới
**Phiên bản này nâng cao chất lượng tài liệu trong toàn bộ kho và thêm ví dụ triển khai Microsoft Foundry Models hoàn chỉnh với giao diện chat gpt-4.1.**

#### Đã thêm
- **🤖 Ví dụ Chat Microsoft Foundry Models**: Triển khai gpt-4.1 hoàn chỉnh với triển khai hoạt động trong `examples/azure-openai-chat/`:
  - Hạ tầng Microsoft Foundry Models đầy đủ (triển khai model gpt-4.1)
  - Giao diện chat dòng lệnh Python với lịch sử hội thoại
  - Tích hợp Key Vault để lưu khóa API an toàn
  - Theo dõi sử dụng token và ước tính chi phí
  - Giới hạn tốc độ và xử lý lỗi
  - README toàn diện với hướng dẫn triển khai 35-45 phút
  - 11 tệp sẵn sàng cho sản xuất (Bicep templates, ứng dụng Python, cấu hình)
- **📚 Bài tập trong Tài liệu**: Thêm bài tập thực hành vào hướng dẫn cấu hình:
  - Bài tập 1: Cấu hình đa môi trường (15 phút)
  - Bài tập 2: Thực hành quản lý bí mật (10 phút)
  - Tiêu chí thành công và bước xác minh rõ ràng
- **✅ Xác minh Triển khai**: Thêm phần xác minh vào hướng dẫn triển khai:
  - Quy trình kiểm tra sức khỏe
  - Danh sách kiểm tra tiêu chí thành công
  - Kết quả mong đợi cho tất cả lệnh triển khai
  - Tham chiếu khắc phục sự cố nhanh

#### Nâng cao
- **examples/README.md**: Cập nhật đạt chất lượng A-grade (93%):
  - Thêm azure-openai-chat vào tất cả các phần liên quan
  - Cập nhật số lượng ví dụ cục bộ từ 3 thành 4
  - Thêm vào bảng Ví dụ Ứng dụng AI
  - Tích hợp vào Quick Start cho Người dùng Trung cấp
  - Thêm vào phần Microsoft Foundry Templates
  - Cập nhật Ma trận So sánh và phần tìm công nghệ
- **Chất lượng Tài liệu**: Cải thiện từ B+ (87%) → A- (92%) trong thư mục docs:
  - Thêm kết quả mong đợi cho các ví dụ lệnh quan trọng
  - Bao gồm bước xác minh cho thay đổi cấu hình
  - Nâng cao học thực hành với bài tập mang tính hành động

#### Đã thay đổi
- **Tiến trình học**: Tích hợp tốt hơn ví dụ AI cho người học trung cấp
- **Cấu trúc Tài liệu**: Bài tập có tính hành động hơn với kết quả rõ ràng
- **Quy trình Xác minh**: Thêm tiêu chí thành công rõ ràng vào các luồng công việc chính

#### Cải thiện
- **Trải nghiệm nhà phát triển**: Triển khai Microsoft Foundry Models giờ chỉ mất 35-45 phút (so với 60-90 cho các phương án phức tạp)
- **Minh bạch chi phí**: Ước tính chi phí rõ ràng ($50-200/month) cho ví dụ Microsoft Foundry Models
- **Lộ trình học**: Các nhà phát triển AI có điểm vào rõ ràng với azure-openai-chat
- **Tiêu chuẩn Tài liệu**: Kết quả mong đợi và bước xác minh nhất quán

#### Đã xác nhận
- ✅ Ví dụ Microsoft Foundry Models hoạt động đầy đủ với `azd up`
- ✅ 11 tệp triển khai đều cú pháp chính xác
- ✅ Hướng dẫn README khớp với trải nghiệm triển khai thực tế
- ✅ Liên kết tài liệu được cập nhật ở hơn 8 vị trí
- ✅ Mục lục examples phản ánh chính xác 4 ví dụ cục bộ
- ✅ Không có liên kết bên ngoài trùng lặp trong các bảng
- ✅ Tất cả tham chiếu điều hướng đều chính xác

#### Triển khai kỹ thuật
- **Kiến trúc Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps pattern
- **Bảo mật**: Sẵn sàng Managed Identity, bí mật trong Key Vault
- **Giám sát**: Tích hợp Application Insights
- **Quản lý chi phí**: Theo dõi token và tối ưu hóa sử dụng
- **Triển khai**: Một lệnh `azd up` cho thiết lập hoàn chỉnh

### [v3.6.0] - 2025-11-19

#### Cập nhật lớn: Ví dụ triển khai Container App
**Phiên bản này giới thiệu các ví dụ triển khai ứng dụng container toàn diện, sẵn sàng cho sản xuất, sử dụng Azure Developer CLI (AZD), với tài liệu đầy đủ và tích hợp vào lộ trình học.**

#### Đã thêm
- **🚀 Ví dụ Container App**: Các ví dụ cục bộ mới trong `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Tổng quan hoàn chỉnh về triển khai container, quick start, mô hình sản xuất và các mẫu nâng cao
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API thân thiện cho người mới với scale-to-zero, health probes, giám sát và khắc phục sự cố
  - [Microservices Architecture](../../examples/container-app/microservices): Triển khai đa dịch vụ sẵn sàng cho sản xuất (API Gateway, Product, Order, User, Notification), messaging bất đồng bộ, Service Bus, Cosmos DB, Azure SQL, distributed tracing, triển khai blue-green/canary
- **Thực hành tốt nhất**: Bảo mật, giám sát, tối ưu chi phí và hướng dẫn CI/CD cho tải công việc container
- **Ví dụ mã**: `azure.yaml`, Bicep templates và triển khai dịch vụ đa ngôn ngữ (Python, Node.js, C#, Go)
- **Kiểm thử & Khắc phục sự cố**: Kịch bản kiểm thử end-to-end, lệnh giám sát, hướng dẫn khắc phục sự cố

#### Đã thay đổi
- **README.md**: Đã cập nhật để giới thiệu và liên kết các ví dụ ứng dụng container mới trong "Local Examples - Container Applications"
- **examples/README.md**: Đã cập nhật để nhấn mạnh các ví dụ ứng dụng container, thêm các mục vào ma trận so sánh và cập nhật tham chiếu công nghệ/kiến trúc
- **Course Outline & Study Guide**: Đã cập nhật để tham chiếu các ví dụ ứng dụng container mới và các mẫu triển khai trong các chương liên quan

#### Đã xác thực
- ✅ Tất cả các ví dụ mới có thể triển khai bằng `azd up` và tuân theo các phương pháp hay nhất
- ✅ Các liên kết chéo trong tài liệu và điều hướng đã được cập nhật
- ✅ Các ví dụ bao phủ các kịch bản từ cơ bản đến nâng cao, bao gồm microservices cho môi trường production

#### Ghi chú
- **Phạm vi**: Chỉ tài liệu và ví dụ tiếng Anh
- **Bước tiếp theo**: Mở rộng với các mẫu container nâng cao bổ sung và tự động hóa CI/CD trong các phát hành tương lai

### [v3.5.0] - 2025-11-19

#### Đổi thương hiệu sản phẩm: Microsoft Foundry
**Phiên bản này thực hiện việc thay đổi tên sản phẩm toàn diện từ "Microsoft Foundry" sang "Microsoft Foundry" trên tất cả tài liệu tiếng Anh, phản ánh việc đổi thương hiệu chính thức của Microsoft.**

#### Đã thay đổi
- **🔄 Cập nhật tên sản phẩm**: Thay đổi toàn diện tên sản phẩm từ "Microsoft Foundry" thành "Microsoft Foundry"
  - Đã cập nhật tất cả các tham chiếu trong tài liệu tiếng Anh trong thư mục `docs/`
  - Đổi tên thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Đổi tên tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tổng cộng: 23 tham chiếu nội dung được cập nhật trên 7 tệp tài liệu

- **📁 Thay đổi cấu trúc thư mục**:
  - `docs/ai-foundry/` đã được đổi tên thành `docs/microsoft-foundry/`
  - Tất cả các liên kết chéo đã được cập nhật để phản ánh cấu trúc thư mục mới
  - Các liên kết điều hướng đã được xác thực trên toàn bộ tài liệu

- **📄 Đổi tên tệp**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tất cả các liên kết nội bộ đã được cập nhật để tham chiếu tên tệp mới

#### Các tệp đã cập nhật
- **Tài liệu chương** (7 tệp):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 cập nhật liên kết điều hướng
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tham chiếu tên sản phẩm đã được cập nhật
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Đã sử dụng Microsoft Foundry (từ các cập nhật trước đó)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 tham chiếu đã được cập nhật (tổng quan, phản hồi cộng đồng, tài liệu)
  - `docs/getting-started/azd-basics.md` - 4 liên kết chéo đã được cập nhật
  - `docs/getting-started/first-project.md` - 2 liên kết điều hướng chương đã được cập nhật
  - `docs/getting-started/installation.md` - 2 liên kết chương tiếp theo đã được cập nhật
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 tham chiếu đã được cập nhật (điều hướng, cộng đồng Discord)
  - `docs/troubleshooting/common-issues.md` - 1 liên kết điều hướng đã được cập nhật
  - `docs/troubleshooting/debugging.md` - 1 liên kết điều hướng đã được cập nhật

- **Tệp cấu trúc khóa học** (2 tệp):
  - `README.md` - 17 tham chiếu đã được cập nhật (tổng quan khóa học, tiêu đề chương, phần mẫu, thông tin cộng đồng)
  - `course-outline.md` - 14 tham chiếu đã được cập nhật (tổng quan, mục tiêu học tập, tài nguyên chương)

#### Đã xác thực
- ✅ Không còn tham chiếu đường dẫn thư mục "ai-foundry" trong tài liệu tiếng Anh
- ✅ Không còn tham chiếu tên sản phẩm "Microsoft Foundry" trong tài liệu tiếng Anh
- ✅ Tất cả các liên kết điều hướng hoạt động với cấu trúc thư mục mới
- ✅ Việc đổi tên tệp và thư mục đã hoàn tất thành công
- ✅ Các liên kết chéo giữa các chương đã được xác thực

#### Ghi chú
- **Phạm vi**: Các thay đổi áp dụng chỉ cho tài liệu tiếng Anh trong thư mục `docs/`
- **Bản dịch**: Các thư mục dịch (`translations/`) không được cập nhật trong phiên bản này
- **Workshop**: Tài liệu workshop (`workshop/`) không được cập nhật trong phiên bản này
- **Ví dụ**: Các tệp ví dụ có thể vẫn tham chiếu đặt tên cũ (sẽ được xử lý trong bản cập nhật tương lai)
- **Liên kết bên ngoài**: Các URL bên ngoài và tham chiếu GitHub vẫn không thay đổi

#### Hướng dẫn di chuyển cho cộng tác viên
Nếu bạn có nhánh cục bộ hoặc tài liệu tham chiếu cấu trúc cũ:
1. Cập nhật tham chiếu thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Cập nhật tham chiếu tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Thay thế tên sản phẩm: "Microsoft Foundry" → "Microsoft Foundry"
4. Xác thực rằng tất cả các liên kết nội bộ trong tài liệu vẫn hoạt động

---

### [v3.4.0] - 2025-10-24

#### Tăng cường tính năng xem trước hạ tầng và xác thực
**Phiên bản này giới thiệu hỗ trợ toàn diện cho tính năng xem trước mới của Azure Developer CLI và cải thiện trải nghiệm người dùng trong workshop.**

#### Đã thêm
- **🧪 azd provision --preview Feature Documentation**: Bao quát toàn diện về khả năng xem trước hạ tầng mới
  - Tham chiếu lệnh và ví dụ sử dụng trong cheat sheet
  - Tích hợp chi tiết trong hướng dẫn provisioning với các trường hợp sử dụng và lợi ích
  - Tích hợp kiểm tra trước triển khai để xác thực triển khai an toàn hơn
  - Cập nhật hướng dẫn bắt đầu với thực hành triển khai ưu tiên an toàn
- **🚧 Workshop Status Banner**: Biểu ngữ HTML chuyên nghiệp cho biết trạng thái phát triển workshop
  - Thiết kế gradient với chỉ báo đang xây dựng để truyền đạt rõ ràng tới người dùng
  - Dấu thời gian cập nhật cuối để minh bạch
  - Thiết kế tương thích di động cho mọi loại thiết bị

#### Được tăng cường
- **An toàn hạ tầng**: Chức năng xem trước được tích hợp xuyên suốt tài liệu triển khai
- **Xác thực trước triển khai**: Các script tự động hiện bao gồm kiểm thử xem trước hạ tầng
- **Luồng công việc cho nhà phát triển**: Chuỗi lệnh đã cập nhật để bao gồm xem trước như thực hành tốt nhất
- **Trải nghiệm workshop**: Kỳ vọng rõ ràng cho người dùng về trạng thái phát triển nội dung

#### Đã thay đổi
- **Thực hành triển khai tốt nhất**: Luồng công việc ưu tiên xem trước hiện được khuyến nghị
- **Luồng tài liệu**: Xác thực hạ tầng được chuyển lên sớm hơn trong quá trình học
- **Trình bày workshop**: Giao tiếp trạng thái chuyên nghiệp với dòng thời gian phát triển rõ ràng

#### Cải thiện
- **Tiếp cận an toàn trước tiên**: Các thay đổi hạ tầng giờ có thể được xác thực trước khi triển khai
- **Hợp tác nhóm**: Kết quả xem trước có thể được chia sẻ để xem xét và phê duyệt
- **Nhận thức chi phí**: Hiểu rõ hơn về chi phí tài nguyên trước khi provision
- **Giảm thiểu rủi ro**: Giảm lỗi triển khai thông qua xác thực trước

#### Triển khai kỹ thuật
- **Tích hợp đa tài liệu**: Tính năng xem trước được tài liệu hóa trong 4 tệp chính
- **Mẫu lệnh**: Cú pháp và ví dụ nhất quán trên toàn bộ tài liệu
- **Tích hợp thực hành tốt nhất**: Xem trước được bao gồm trong quy trình xác thực và script
- **Chỉ báo trực quan**: Đánh dấu tính năng MỚI rõ ràng để dễ phát hiện

#### Hạ tầng Workshop
- **Truyền đạt trạng thái**: Biểu ngữ HTML chuyên nghiệp với kiểu gradient
- **Trải nghiệm người dùng**: Trạng thái phát triển rõ ràng giúp tránh nhầm lẫn
- **Trình bày chuyên nghiệp**: Duy trì uy tín kho lưu trữ trong khi đặt kỳ vọng
- **Minh bạch dòng thời gian**: Dấu thời gian cập nhật cuối tháng 10 2025 để chịu trách nhiệm

### [v3.3.0] - 2025-09-24

#### Mở rộng tài liệu workshop và trải nghiệm học tương tác
**Phiên bản này giới thiệu tài liệu workshop toàn diện với hướng dẫn tương tác trên trình duyệt và các lộ trình học có cấu trúc.**

#### Đã thêm
- **🎥 Hướng dẫn workshop tương tác**: Trải nghiệm workshop trên trình duyệt với khả năng xem trước MkDocs
- **📝 Hướng dẫn workshop có cấu trúc**: Lộ trình học 7 bước hướng dẫn từ khám phá đến tùy chỉnh
  - 0-Introduction: Tổng quan workshop và cài đặt
  - 1-Select-AI-Template: Khám phá và chọn mẫu
  - 2-Validate-AI-Template: Quy trình triển khai và xác thực
  - 3-Deconstruct-AI-Template: Hiểu kiến trúc mẫu
  - 4-Configure-AI-Template: Cấu hình và tùy chỉnh
  - 5-Customize-AI-Template: Chỉnh sửa nâng cao và lặp lại
  - 6-Teardown-Infrastructure: Dọn dẹp và quản lý tài nguyên
  - 7-Wrap-up: Tóm tắt và bước tiếp theo
- **🛠️ Công cụ cho workshop**: Cấu hình MkDocs với Material theme để nâng cao trải nghiệm học
- **🎯 Lộ trình học thực hành**: Phương pháp 3 bước (Khám phá → Triển khai → Tùy chỉnh)
- **📱 Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển liền mạch

#### Được tăng cường
- **AI Workshop Lab**: Mở rộng với trải nghiệm học có cấu trúc kéo dài 2-3 giờ
- **Tài liệu workshop**: Trình bày chuyên nghiệp với điều hướng và trợ giúp trực quan
- **Tiến trình học**: Hướng dẫn từng bước rõ ràng từ chọn mẫu đến triển khai production
- **Trải nghiệm nhà phát triển**: Tích hợp công cụ để hợp lý hóa quy trình phát triển

#### Cải thiện
- **Khả năng truy cập**: Giao diện trình duyệt với tìm kiếm, chức năng sao chép và chuyển đổi giao diện
- **Học theo tiến độ cá nhân**: Cấu trúc workshop linh hoạt phù hợp với nhiều tốc độ học khác nhau
- **Ứng dụng thực tế**: Kịch bản triển khai mẫu AI thật tế
- **Tích hợp cộng đồng**: Tích hợp Discord cho hỗ trợ và hợp tác workshop

#### Tính năng workshop
- **Tìm kiếm tích hợp**: Tìm nhanh bài học và từ khóa
- **Sao chép khối mã**: Chức năng hover-to-copy cho tất cả ví dụ mã
- **Chuyển đổi giao diện**: Hỗ trợ chế độ tối/sáng theo sở thích
- **Tài sản trực quan**: Ảnh chụp màn hình và sơ đồ để hiểu rõ hơn
- **Tích hợp trợ giúp**: Truy cập trực tiếp Discord cho hỗ trợ cộng đồng

### [v3.2.0] - 2025-09-17

#### Tái cấu trúc điều hướng lớn và hệ thống học theo chương
**Phiên bản này giới thiệu cấu trúc học theo chương toàn diện với điều hướng nâng cao trên toàn bộ kho lưu trữ.**

#### Đã thêm
- **📚 Hệ thống học theo chương**: Tái cấu trúc toàn bộ khóa học thành 8 chương học tiến bộ
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Hệ thống điều hướng toàn diện**: Đầu trang và chân trang điều hướng nhất quán trên toàn bộ tài liệu
- **🎯 Theo dõi tiến trình**: Danh sách kiểm tra hoàn thành khóa học và hệ thống xác minh học tập
- **🗺️ Hướng dẫn lộ trình học**: Điểm nhập rõ ràng cho các mức kinh nghiệm và mục tiêu khác nhau
- **🔗 Điều hướng liên kết chéo**: Các chương liên quan và tiền đề được liên kết rõ ràng

#### Được tăng cường
- **Cấu trúc README**: Chuyển thành nền tảng học có cấu trúc với tổ chức theo chương
- **Điều hướng tài liệu**: Mỗi trang giờ bao gồm ngữ cảnh chương và hướng dẫn tiến trình
- **Tổ chức mẫu**: Ví dụ và mẫu được bản đồ hóa tới các chương học tương ứng
- **Tích hợp tài nguyên**: Cheat sheet, FAQ và hướng dẫn học được liên kết tới các chương liên quan
- **Tích hợp workshop**: Lab thực hành được bản đồ hóa tới nhiều mục tiêu chương

#### Đã thay đổi
- **Tiến trình học**: Chuyển từ tài liệu tuyến tính sang học theo chương linh hoạt
- **Vị trí cấu hình**: Di chuyển hướng dẫn cấu hình thành Chapter 3 để cải thiện luồng học
- **Tích hợp nội dung AI**: Nội dung AI được tích hợp tốt hơn xuyên suốt hành trình học
- **Nội dung production**: Các mẫu nâng cao được tập trung trong Chapter 8 cho học viên doanh nghiệp

#### Cải thiện
- **Trải nghiệm người dùng**: Bánh mì vụn điều hướng và chỉ báo tiến trình chương rõ ràng
- **Khả năng tiếp cận**: Mẫu điều hướng nhất quán giúp dễ dàng di chuyển trong khóa học
- **Trình bày chuyên nghiệp**: Cấu trúc theo kiểu đại học phù hợp cho đào tạo học thuật và doanh nghiệp
- **Hiệu quả học tập**: Giảm thời gian tìm nội dung liên quan thông qua tổ chức cải thiện

#### Triển khai kỹ thuật
- **Đầu trang điều hướng**: Chuẩn hóa điều hướng chương trên hơn 40 tệp tài liệu
- **Chân trang điều hướng**: Hướng dẫn tiến trình nhất quán và chỉ báo hoàn thành chương
- **Liên kết chéo**: Hệ thống liên kết nội bộ toàn diện kết nối các khái niệm liên quan
- **Bản đồ chương**: Mẫu và ví dụ được liên kết rõ ràng với mục tiêu học tập

#### Nâng cấp hướng dẫn học
- **📚 Mục tiêu học tập toàn diện**: Tái cấu trúc hướng dẫn học phù hợp với hệ thống 8 chương
- **🎯 Đánh giá theo chương**: Mỗi chương bao gồm mục tiêu học tập cụ thể và bài tập thực hành
- **📋 Theo dõi tiến trình**: Lịch học hàng tuần với kết quả đo lường và danh sách kiểm tra hoàn thành
- **❓ Câu hỏi đánh giá**: Các câu hỏi xác thực kiến thức cho mỗi chương với kết quả chuyên nghiệp
- **🛠️ Bài tập thực hành**: Hoạt động thực hành với kịch bản triển khai thực và gỡ lỗi
- **📊 Tiến trình kỹ năng**: Tiến bộ rõ ràng từ khái niệm cơ bản đến mẫu doanh nghiệp với định hướng phát triển nghề nghiệp
- **🎓 Khung chứng chỉ**: Kết quả phát triển nghề nghiệp và hệ thống công nhận cộng đồng
- **⏱️ Quản lý thời gian**: Kế hoạch học 10 tuần có cấu trúc với xác thực mốc quan trọng

### [v3.1.0] - 2025-09-17

#### Tăng cường giải pháp AI đa tác nhân
**Phiên bản này cải thiện giải pháp bán lẻ đa tác nhân với việc đặt tên tác nhân tốt hơn và tài liệu được nâng cao.**

#### Đã thay đổi
- **Thuật ngữ đa tác nhân**: Thay "Cora agent" bằng "Customer agent" trong toàn bộ giải pháp bán lẻ đa tác nhân để dễ hiểu hơn
- **Kiến trúc tác nhân**: Cập nhật tất cả tài liệu, mẫu ARM và ví dụ mã để sử dụng tên "Customer agent" nhất quán
- **Ví dụ cấu hình**: Hiện đại hóa các mẫu cấu hình tác nhân với quy ước đặt tên cập nhật
- **Độ nhất quán tài liệu**: Đảm bảo tất cả các tham chiếu sử dụng tên tác nhân chuyên nghiệp và mô tả rõ ràng

#### Được tăng cường
- **ARM Template Package**: Cập nhật retail-multiagent-arm-template với các tham chiếu Customer agent
- **Architecture Diagrams**: Làm mới sơ đồ Mermaid với tên agent được cập nhật
- **Code Examples**: Các lớp Python và ví dụ triển khai hiện sử dụng tên CustomerAgent
- **Environment Variables**: Cập nhật tất cả script triển khai để sử dụng quy ước CUSTOMER_AGENT_NAME

#### Cải thiện
- **Developer Experience**: Vai trò và trách nhiệm của agent được làm rõ hơn trong tài liệu
- **Production Readiness**: Đồng bộ tốt hơn với quy ước đặt tên doanh nghiệp
- **Learning Materials**: Tên agent trực quan hơn cho mục đích đào tạo
- **Template Usability**: Hiểu rõ hơn về chức năng agent và mẫu triển khai

#### Chi tiết kỹ thuật
- Cập nhật sơ đồ kiến trúc Mermaid với các tham chiếu CustomerAgent
- Thay thế tên lớp CoraAgent bằng CustomerAgent trong ví dụ Python
- Sửa đổi cấu hình JSON mẫu ARM để sử dụng loại agent "customer"
- Cập nhật biến môi trường từ CORA_AGENT_* sang mẫu CUSTOMER_AGENT_*
- Làm mới tất cả lệnh triển khai và cấu hình container

### [v3.0.0] - 2025-09-12

#### Thay đổi lớn - Tập trung cho Nhà phát triển AI và Tích hợp Microsoft Foundry
**Phiên bản này biến kho chứa thành nguồn học tập toàn diện tập trung vào AI với tích hợp Microsoft Foundry.**

#### Đã thêm
- **🤖 AI-First Learning Path**: Tái cấu trúc toàn diện ưu tiên các nhà phát triển và kỹ sư AI
- **Microsoft Foundry Integration Guide**: Tài liệu toàn diện cho việc kết nối AZD với dịch vụ Microsoft Foundry
- **AI Model Deployment Patterns**: Hướng dẫn chi tiết bao gồm lựa chọn mô hình, cấu hình và chiến lược triển khai lên production
- **AI Workshop Lab**: Hội thảo thực hành 2-3 giờ để chuyển đổi ứng dụng AI thành các giải pháp có thể triển khai bằng AZD
- **Production AI Best Practices**: Các mẫu sẵn sàng cho doanh nghiệp để mở rộng, giám sát và bảo mật khối lượng công việc AI
- **AI-Specific Troubleshooting Guide**: Hướng dẫn khắc phục sự cố toàn diện cho Microsoft Foundry Models, Cognitive Services và các vấn đề triển khai AI
- **AI Template Gallery**: Bộ sưu tập mẫu Microsoft Foundry nổi bật kèm xếp hạng độ phức tạp
- **Workshop Materials**: Cấu trúc hội thảo đầy đủ với các phòng thực hành và tài liệu tham khảo

#### Cải tiến
- **README Structure**: Tập trung cho nhà phát triển AI với dữ liệu 45% mức quan tâm cộng đồng từ Microsoft Foundry Discord
- **Learning Paths**: Lộ trình dành riêng cho nhà phát triển AI bên cạnh các lộ trình truyền thống cho sinh viên và kỹ sư DevOps
- **Template Recommendations**: Các mẫu AI nổi bật bao gồm azure-search-openai-demo, contoso-chat, và openai-chat-app-quickstart
- **Community Integration**: Hỗ trợ cộng đồng Discord được tăng cường với các kênh và thảo luận chuyên về AI

#### Tập trung Bảo mật & Sản xuất
- **Managed Identity Patterns**: Cấu hình xác thực và bảo mật dành riêng cho AI
- **Cost Optimization**: Theo dõi sử dụng token và kiểm soát ngân sách cho khối lượng công việc AI
- **Multi-Region Deployment**: Chiến lược triển khai ứng dụng AI toàn cầu
- **Performance Monitoring**: Các chỉ số dành riêng cho AI và tích hợp Application Insights

#### Chất lượng Tài liệu
- **Linear Course Structure**: Tiến trình logic từ cơ bản đến nâng cao cho các mẫu triển khai AI
- **Validated URLs**: Tất cả liên kết kho ngoài đã được xác minh và có thể truy cập
- **Complete Reference**: Tất cả liên kết tài liệu nội bộ đã được xác minh và hoạt động
- **Production Ready**: Các mẫu triển khai cho doanh nghiệp kèm ví dụ thực tế

### [v2.0.0] - 2025-09-09

#### Thay đổi lớn - Tái cấu trúc kho và Nâng cao chuyên nghiệp
**Phiên bản này đại diện cho một đợt đại tu đáng kể về cấu trúc kho và cách trình bày nội dung.**

#### Đã thêm
- **Structured Learning Framework**: Tất cả các trang tài liệu hiện bao gồm các phần Giới thiệu, Mục tiêu học tập, và Kết quả học tập
- **Navigation System**: Thêm liên kết Bài trước / Bài sau trong toàn bộ tài liệu để hướng dẫn tiến trình học
- **Study Guide**: study-guide.md toàn diện với mục tiêu học tập, bài tập thực hành, và tài liệu đánh giá
- **Professional Presentation**: Loại bỏ tất cả biểu tượng cảm xúc để cải thiện khả năng truy cập và vẻ ngoài chuyên nghiệp
- **Enhanced Content Structure**: Cải thiện tổ chức và luồng nội dung học tập

#### Đã thay đổi
- **Documentation Format**: Chuẩn hóa tất cả tài liệu với cấu trúc nhất quán tập trung vào học tập
- **Navigation Flow**: Thực hiện tiến trình logic qua tất cả tài liệu học
- **Content Presentation**: Loại bỏ các yếu tố trang trí để ưu tiên định dạng rõ ràng, chuyên nghiệp
- **Link Structure**: Cập nhật tất cả liên kết nội bộ để hỗ trợ hệ thống điều hướng mới

#### Cải thiện
- **Accessibility**: Loại bỏ sự phụ thuộc vào emoji để tương thích tốt hơn với trình đọc màn hình
- **Professional Appearance**: Trình bày phong cách học thuật, sạch sẽ phù hợp cho học tập doanh nghiệp
- **Learning Experience**: Cách tiếp cận có cấu trúc với mục tiêu và kết quả rõ ràng cho mỗi bài học
- **Content Organization**: Luồng logic tốt hơn và kết nối giữa các chủ đề liên quan

### [v1.0.0] - 2025-09-09

#### Phát hành ban đầu - Kho học AZD toàn diện

#### Đã thêm
- **Core Documentation Structure**
  - Hoàn chỉnh chuỗi hướng dẫn bắt đầu
  - Tài liệu triển khai và cung cấp hạ tầng toàn diện
  - Tài nguyên khắc phục sự cố chi tiết và hướng dẫn gỡ lỗi
  - Công cụ và quy trình xác thực trước khi triển khai

- **Getting Started Module**
  - AZD Basics: Khái niệm cốt lõi và thuật ngữ
  - Installation Guide: Hướng dẫn thiết lập theo nền tảng
  - Configuration Guide: Thiết lập môi trường và xác thực
  - First Project Tutorial: Học thực hành theo từng bước

- **Deployment and Provisioning Module**
  - Deployment Guide: Tài liệu quy trình công việc đầy đủ
  - Provisioning Guide: Hạ tầng dưới dạng mã với Bicep
  - Các thực hành tốt nhất cho triển khai sản xuất
  - Mẫu kiến trúc đa dịch vụ

- **Pre-deployment Validation Module**
  - Capacity Planning: Xác thực khả năng sẵn có của tài nguyên Azure
  - SKU Selection: Hướng dẫn chi tiết về tầng dịch vụ
  - Pre-flight Checks: Script xác thực tự động (PowerShell và Bash)
  - Công cụ ước tính chi phí và lập kế hoạch ngân sách

- **Troubleshooting Module**
  - Common Issues: Vấn đề thường xuyên gặp phải và giải pháp
  - Debugging Guide: Phương pháp luận khắc phục sự cố có hệ thống
  - Kỹ thuật và công cụ chẩn đoán nâng cao
  - Giám sát và tối ưu hiệu năng

- **Resources and References**
  - Command Cheat Sheet: Tra cứu nhanh các lệnh cơ bản
  - Glossary: Định nghĩa thuật ngữ và từ viết tắt toàn diện
  - FAQ: Câu trả lời chi tiết cho các câu hỏi phổ biến
  - Liên kết tài nguyên bên ngoài và kết nối cộng đồng

- **Examples and Templates**
  - Ví dụ Ứng dụng Web đơn giản
  - Mẫu triển khai Trang web tĩnh
  - Cấu hình Ứng dụng Container
  - Mẫu tích hợp cơ sở dữ liệu
  - Ví dụ kiến trúc Microservices
  - Triển khai hàm serverless

#### Tính năng
- **Multi-Platform Support**: Hướng dẫn cài đặt và cấu hình cho Windows, macOS và Linux
- **Multiple Skill Levels**: Nội dung thiết kế cho từ sinh viên đến nhà phát triển chuyên nghiệp
- **Practical Focus**: Tập trung thực hành với các ví dụ và kịch bản thực tế
- **Comprehensive Coverage**: Từ khái niệm cơ bản đến các mẫu doanh nghiệp nâng cao
- **Security-First Approach**: Các thực hành bảo mật tốt nhất được tích hợp trong toàn bộ tài liệu
- **Cost Optimization**: Hướng dẫn cho các triển khai tiết kiệm chi phí và quản lý tài nguyên

#### Chất lượng Tài liệu
- **Detailed Code Examples**: Ví dụ mã chi tiết, thực tế và đã được kiểm tra
- **Step-by-Step Instructions**: Hướng dẫn rõ ràng, có thể hành động theo từng bước
- **Comprehensive Error Handling**: Xử lý lỗi toàn diện: Khắc phục sự cố cho các vấn đề phổ biến
- **Best Practices Integration**: Tích hợp các tiêu chuẩn ngành và khuyến nghị
- **Version Compatibility**: Cập nhật tương thích với các dịch vụ Azure mới nhất và tính năng azd

## Cải tiến Tương lai Đã lên kế hoạch

### Phiên bản 3.1.0 (Đang lên kế hoạch)
#### Mở rộng Nền tảng AI
- **Multi-Model Support**: Các mẫu tích hợp cho Hugging Face, Azure Machine Learning và mô hình tùy chỉnh
- **AI Agent Frameworks**: Mẫu cho triển khai LangChain, Semantic Kernel và AutoGen
- **Advanced RAG Patterns**: Các tùy chọn cơ sở dữ liệu vector ngoài Azure AI Search (Pinecone, Weaviate, v.v.)
- **AI Observability**: Nâng cao giám sát hiệu suất mô hình, sử dụng token và chất lượng phản hồi

#### Trải nghiệm Nhà phát triển
- **VS Code Extension**: Trải nghiệm phát triển tích hợp AZD + Microsoft Foundry
- **GitHub Copilot Integration**: Tạo mẫu AZD được trợ giúp bởi AI
- **Interactive Tutorials**: Bài tập mã hóa thực hành với xác thực tự động cho các kịch bản AI
- **Video Content**: Hướng dẫn video bổ sung cho người học trực quan tập trung vào triển khai AI

### Phiên bản 4.0.0 (Đang lên kế hoạch)
#### Mẫu AI Doanh nghiệp
- **Governance Framework**: Quản trị mô hình AI, tuân thủ và theo dõi kiểm toán
- **Multi-Tenant AI**: Mẫu phục vụ nhiều khách hàng với dịch vụ AI cô lập
- **Edge AI Deployment**: Tích hợp với Azure IoT Edge và các instance container
- **Hybrid Cloud AI**: Mẫu triển khai đa đám mây và hybrid cho khối lượng công việc AI

#### Tính năng Nâng cao
- **AI Pipeline Automation**: Tích hợp MLOps với pipeline Azure Machine Learning
- **Advanced Security**: Mẫu zero-trust, private endpoints và bảo vệ chống mối đe dọa nâng cao
- **Performance Optimization**: Tinh chỉnh nâng cao và chiến lược mở rộng cho ứng dụng AI có thông lượng cao
- **Global Distribution**: Mẫu phân phối nội dung và bộ nhớ đệm edge cho ứng dụng AI

### Phiên bản 3.0.0 (Đang lên kế hoạch) - Đã bị thay thế bởi Phát hành Hiện tại
#### Các bổ sung được đề xuất - Hiện đã được triển khai trong v3.0.0
- ✅ **AI-Focused Content**: Tích hợp Microsoft Foundry toàn diện (Hoàn thành)
- ✅ **Interactive Tutorials**: Phòng thí nghiệm hội thảo AI thực hành (Hoàn thành)
- ✅ **Advanced Security Module**: Mẫu bảo mật dành riêng cho AI (Hoàn thành)
- ✅ **Performance Optimization**: Chiến lược tinh chỉnh khối lượng công việc AI (Hoàn thành)

### Phiên bản 2.1.0 (Đang lên kế hoạch) - Đã được triển khai một phần trong v3.0.0
#### Cải tiến nhỏ - Một số đã hoàn thành trong Phát hành Hiện tại
- ✅ **Additional Examples**: Các kịch bản triển khai tập trung vào AI (Hoàn thành)
- ✅ **Extended FAQ**: Câu hỏi và khắc phục sự cố dành riêng cho AI (Hoàn thành)
- **Tool Integration**: Hướng dẫn tích hợp IDE và trình soạn thảo được cải thiện
- ✅ **Monitoring Expansion**: Mẫu giám sát và cảnh báo dành riêng cho AI (Hoàn thành)

#### Vẫn được lên kế hoạch cho Phát hành Tương lai
- **Mobile-Friendly Documentation**: Thiết kế đáp ứng cho học tập trên di động
- **Offline Access**: Gói tài liệu có thể tải xuống
- **Enhanced IDE Integration**: Extension VS Code cho luồng công việc AZD + AI
- **Community Dashboard**: Bảng điều khiển cộng đồng thời gian thực và theo dõi đóng góp

## Đóng góp vào Changelog

### Báo cáo Thay đổi
Khi đóng góp vào kho này, vui lòng đảm bảo mục nhật ký thay đổi bao gồm:

1. **Version Number**: Tuân theo semantic versioning (major.minor.patch)
2. **Date**: Ngày phát hành hoặc cập nhật ở định dạng YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Mô tả ngắn gọn về những gì đã thay đổi
5. **Impact Assessment**: Những thay đổi ảnh hưởng như thế nào đến người dùng hiện tại

### Các loại Thay đổi

#### Đã thêm
- Các tính năng mới, phần tài liệu hoặc khả năng mới
- Ví dụ mới, mẫu hoặc tài nguyên học tập
- Các công cụ, script hoặc tiện ích bổ sung

#### Đã thay đổi
- Sửa đổi chức năng hoặc tài liệu hiện có
- Cập nhật để cải thiện rõ ràng hoặc độ chính xác
- Tái cấu trúc nội dung hoặc tổ chức

#### Bị ngưng hỗ trợ
- Các tính năng hoặc phương pháp đang được loại bỏ dần
- Các phần tài liệu dự kiến sẽ bị xóa
- Các phương pháp có lựa chọn thay thế tốt hơn

#### Đã loại bỏ
- Các tính năng, tài liệu hoặc ví dụ không còn phù hợp
- Thông tin lỗi thời hoặc phương pháp đã bị ngừng
- Nội dung trùng lặp hoặc đã được hợp nhất

#### Đã sửa
- Sửa lỗi trong tài liệu hoặc mã
- Giải quyết các vấn đề được báo cáo
- Cải thiện độ chính xác hoặc chức năng

#### Bảo mật
- Các cải tiến hoặc bản sửa liên quan đến bảo mật
- Cập nhật các thực hành bảo mật tốt nhất
- Khắc phục các lỗ hổng bảo mật

### Hướng dẫn Semantic Versioning

#### Phiên bản Chính (X.0.0)
- Những thay đổi phá vỡ tương thích đòi hỏi hành động của người dùng
- Tái cấu trúc lớn về nội dung hoặc tổ chức
- Các thay đổi làm thay đổi phương pháp hoặc cách tiếp cận cơ bản

#### Phiên bản Phụ (X.Y.0)
- Tính năng mới hoặc bổ sung nội dung
- Cải tiến giữ tương thích ngược
- Ví dụ, công cụ hoặc tài nguyên bổ sung

#### Phiên bản Sửa lỗi (X.Y.Z)
- Sửa lỗi và hiệu chỉnh
- Cải tiến nhỏ cho nội dung hiện có
- Làm rõ và cải tiến nhỏ

## Phản hồi và Gợi ý của Cộng đồng

Chúng tôi tích cực khuyến khích phản hồi từ cộng đồng để cải thiện nguồn học này:

### Cách cung cấp phản hồi
- **GitHub Issues**: Báo cáo sự cố hoặc đề xuất cải tiến (chào đón các vấn đề liên quan đến AI)
- **Discord Discussions**: Chia sẻ ý tưởng và tương tác với cộng đồng Microsoft Foundry
- **Pull Requests**: Đóng góp cải tiến trực tiếp cho nội dung, đặc biệt là các mẫu và hướng dẫn AI
- **Microsoft Foundry Discord**: Tham gia kênh #Azure để thảo luận về AZD + AI
- **Community Forums**: Tham gia thảo luận nhà phát triển Azure rộng hơn

### Các loại Phản hồi
- **AI Content Accuracy**: Sửa lỗi về tích hợp dịch vụ AI và thông tin triển khai
- **Learning Experience**: Gợi ý cải thiện luồng học cho nhà phát triển AI
- **Missing AI Content**: Yêu cầu thêm mẫu AI, mẫu thiết kế hoặc ví dụ
- **Accessibility**: Cải thiện cho nhu cầu học tập đa dạng
- **AI Tool Integration**: Gợi ý để tích hợp luồng làm việc phát triển AI tốt hơn
- **Production AI Patterns**: Yêu cầu mẫu triển khai AI cho doanh nghiệp

### Cam kết Phản hồi
- **Issue Response**: Trong vòng 48 giờ cho các vấn đề được báo cáo
- **Feature Requests**: Đánh giá trong vòng một tuần
- **Community Contributions**: Xem xét trong vòng một tuần
- **Security Issues**: Ưu tiên ngay lập tức với phản hồi nhanh

## Lịch Bảo trì

### Cập nhật Định kỳ
- **Monthly Reviews**: Kiểm tra độ chính xác nội dung và xác minh liên kết
- **Quarterly Updates**: Thêm nội dung lớn và cải tiến
- **Semi-Annual Reviews**: Tái cấu trúc và nâng cấp toàn diện
- **Annual Releases**: Phát hành hàng năm với các cập nhật phiên bản lớn kèm cải tiến đáng kể

### Giám sát và Đảm bảo Chất lượng
- **Automated Testing**: Xác thực định kỳ các ví dụ mã và liên kết
- **Community Feedback Integration**: Thường xuyên kết hợp các đề xuất của người dùng
- **Technology Updates**: Đồng bộ với các dịch vụ Azure mới nhất và phát hành azd
- **Accessibility Audits**: Đánh giá định kỳ cho các nguyên tắc thiết kế hòa nhập

## Chính sách Hỗ trợ Phiên bản

### Hỗ trợ Phiên bản Hiện tại
- **Phiên bản chính mới nhất**: Hỗ trợ đầy đủ với các cập nhật định kỳ
- **Phiên bản chính trước**: Cập nhật bảo mật và sửa lỗi quan trọng trong 12 tháng
- **Các phiên bản cũ**: Chỉ hỗ trợ cộng đồng, không có cập nhật chính thức

### Hướng dẫn chuyển đổi
Khi các phiên bản chính được phát hành, chúng tôi cung cấp:
- **Hướng dẫn chuyển đổi**: Hướng dẫn từng bước để chuyển đổi
- **Ghi chú tương thích**: Chi tiết về các thay đổi không tương thích
- **Hỗ trợ công cụ**: script hoặc tiện ích để hỗ trợ việc chuyển đổi
- **Hỗ trợ cộng đồng**: Diễn đàn chuyên dụng cho các câu hỏi về chuyển đổi

---

**Điều hướng**
- **Bài học trước**: [Hướng dẫn học](resources/study-guide.md)
- **Bài học tiếp theo**: Quay lại [README chính](README.md)

**Luôn cập nhật**: Theo dõi kho lưu trữ này để nhận thông báo về các bản phát hành mới và các cập nhật quan trọng cho tài liệu học tập.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, nên sử dụng bản dịch chuyên nghiệp do người dịch thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->