# Nhật ký thay đổi - AZD For Beginners

## Giới thiệu

Nhật ký thay đổi này ghi lại tất cả các thay đổi, cập nhật và cải tiến đáng chú ý đối với kho mã AZD For Beginners. Chúng tôi tuân theo các nguyên tắc phiên bản có ý nghĩa (semantic versioning) và duy trì nhật ký này để giúp người dùng hiểu những gì đã thay đổi giữa các phiên bản.

## Mục tiêu học tập

Khi xem xét nhật ký thay đổi này, bạn sẽ:
- Được thông báo về các tính năng mới và nội dung được thêm vào
- Hiểu các cải tiến đã thực hiện trên tài liệu hiện có
- Theo dõi các sửa lỗi và chỉnh sửa để đảm bảo tính chính xác
- Theo dõi sự phát triển của tài liệu học theo thời gian

## Kết quả học tập

Sau khi xem các mục nhật ký thay đổi, bạn sẽ có thể:
- Xác định nội dung và nguồn tài nguyên mới có sẵn để học
- Hiểu những phần nào đã được cập nhật hoặc cải thiện
- Lên kế hoạch học tập dựa trên tài liệu mới nhất
- Đóng góp phản hồi và đề xuất cho các cải tiến trong tương lai

## Lịch sử phiên bản

### [v3.18.0] - 2026-03-16

#### Lệnh AZD AI CLI, Xác thực nội dung & Mở rộng mẫu
**Phiên bản này bổ sung phạm vi lệnh `azd ai`, `azd extension`, và `azd mcp` trên tất cả các chương liên quan đến AI, sửa các liên kết hỏng và mã đã bị khử sử dụng trong agents.md, cập nhật bảng tóm tắt, và đại tu phần Mẫu Ví dụ với các mô tả đã được xác thực và các mẫu AZD Azure AI mới.**

#### Đã thêm
- **🤖 Phạm vi AZD AI CLI** trên 7 tệp (trước đây chỉ trong Chương 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Mục mới "Extensions and AI Commands" giới thiệu `azd extension`, `azd ai agent init`, và `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Tùy chọn 4: `azd ai agent init` với bảng so sánh (phương pháp template so với manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Các phân mục "AZD Extensions for Foundry" và "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Bắt đầu nhanh giờ hiển thị cả hai đường dẫn triển khai dựa trên template và manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Phần Deploy giờ bao gồm tùy chọn `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Phân mục "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Mục mới "AI & Extensions Commands" với `azd extension`, `azd ai agent init`, `azd mcp`, và `azd infra generate`
- **📦 Mẫu ví dụ AZD AI mới** trong `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat với Blazor WebAssembly, Semantic Kernel, và hỗ trợ chat bằng giọng nói
  - **azure-search-openai-demo-java** — Java RAG chat sử dụng Langchain4J với tùy chọn triển khai ACA/AKS
  - **contoso-creative-writer** — Ứng dụng viết sáng tạo đa tác nhân sử dụng Azure AI Agent Service, Bing Grounding, và Prompty
  - **serverless-chat-langchainjs** — RAG serverless sử dụng Azure Functions + LangChain.js + Cosmos DB với hỗ trợ phát triển cục bộ bằng Ollama
  - **chat-with-your-data-solution-accelerator** — Bộ tăng tốc RAG doanh nghiệp với cổng quản trị, tích hợp Teams, và tùy chọn PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Ứng dụng tham chiếu điều phối MCP đa tác nhân với máy chủ bằng .NET, Python, Java, và TypeScript
  - **azd-ai-starter** — Mẫu khởi tạo Bicep hạ tầng Azure AI tối giản
  - **🔗 Liên kết Thư viện awesome-azd AI** — Tham chiếu đến [thư viện awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ mẫu)

#### Đã sửa
- **🔗 Điều hướng agents.md**: Các liên kết Trước/Sau giờ khớp với thứ tự bài học trong README Chương 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Liên kết hỏng trong agents.md**: `production-ai-practices.md` đã được sửa thành `../chapter-08-production/production-ai-practices.md` (3 vị trí)
- **📦 agents.md mã bị khử sử dụng**: Thay `opencensus` bằng `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md API không hợp lệ**: Di chuyển `max_tokens` từ `create_agent()` sang `create_run()` dưới tên `max_completion_tokens`
- **🔢 agents.md đếm token**: Thay ước lượng thô `len//4` bằng `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Đã sửa dịch vụ từ "Cognitive Search + App Service" sang "Azure AI Search + Azure Container Apps" (máy chủ mặc định thay đổi Tháng 10 2024)
- **contoso-chat**: Cập nhật mô tả để tham chiếu Azure AI Foundry + Prompty, khớp với tiêu đề repo và ngăn xếp kỹ thuật thực tế

#### Đã xóa
- **ai-document-processing**: Loại bỏ tham chiếu mẫu không hoạt động (repo không truy cập công khai như một mẫu AZD)

#### Cải thiện
- **📝 Bài tập trong agents.md**: Bài tập 1 giờ hiển thị kết quả mong đợi và bước `azd monitor`; Bài tập 2 bao gồm mã đăng ký đầy đủ `FunctionTool`; Bài tập 3 thay hướng dẫn mơ hồ bằng các lệnh `prepdocs.py` cụ thể
- **📚 Tài nguyên trong agents.md**: Cập nhật các liên kết tài liệu tới tài liệu Azure AI Agent Service và quickstart hiện hành
- **📋 Bảng Bước tiếp theo trong agents.md**: Thêm liên kết AI Workshop Lab cho bao phủ chương hoàn chỉnh

#### Tệp đã cập nhật
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Cải tiến điều hướng khóa học
**Phiên bản này cải thiện điều hướng README.md chương với định dạng bảng được nâng cao.**

#### Đã thay đổi
- **Bảng Sơ đồ Khóa học**: Nâng cấp với liên kết bài học trực tiếp, ước lượng thời lượng và đánh giá độ phức tạp
- **Dọn dẹp thư mục**: Xóa các thư mục cũ dư thừa (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Xác thực liên kết**: Tất cả 21+ liên kết nội bộ trong bảng Sơ đồ Khóa học đã được xác minh

### [v3.16.0] - 2026-02-05

#### Cập nhật tên sản phẩm
**Phiên bản này cập nhật các tham chiếu sản phẩm theo nhãn hiệu hiện tại của Microsoft.**

#### Đã thay đổi
- **Microsoft Foundry → Microsoft Foundry**: Tất cả tham chiếu đã được cập nhật trên các tệp không phải bản dịch
- **Azure AI Agent Service → Foundry Agents**: Tên dịch vụ đã được cập nhật để phản ánh nhãn hiệu hiện tại

#### Tệp đã cập nhật
- `README.md` - Trang đích chính của khóa học
- `changelog.md` - Lịch sử phiên bản
- `course-outline.md` - Cấu trúc khóa học
- `docs/chapter-02-ai-development/agents.md` - Hướng dẫn AI agents
- `examples/README.md` - Tài liệu ví dụ
- `workshop/README.md` - Trang đích workshop
- `workshop/docs/index.md` - Mục lục workshop
- `workshop/docs/instructions/*.md` - Tất cả tệp hướng dẫn workshop

---

### [v3.15.0] - 2026-02-05

#### Tái cấu trúc kho chính: Đổi tên thư mục theo chương
**Phiên bản này tái cấu trúc tài liệu thành các thư mục chương riêng biệt để điều hướng rõ ràng hơn.**

#### Đổi tên thư mục
Các thư mục cũ đã được thay thế bằng các thư mục đánh số chương:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Thêm mới: `docs/chapter-05-multi-agent/`

#### Di chuyển tệp
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

#### Đã thêm
- **📚 Tệp README cho từng chương**: Tạo README.md trong mỗi thư mục chương với:
  - Mục tiêu học tập và thời lượng
  - Bảng bài học kèm mô tả
  - Các lệnh bắt đầu nhanh
  - Điều hướng tới các chương khác

#### Đã thay đổi
- **🔗 Cập nhật tất cả liên kết nội bộ**: Hơn 78 đường dẫn đã được cập nhật trên toàn bộ tệp tài liệu
- **🗺️ README.md chính**: Cập nhật Sơ đồ Khóa học với cấu trúc chương mới
- **📝 examples/README.md**: Cập nhật các tham chiếu chéo tới thư mục chương

#### Đã xóa
- Cấu trúc thư mục cũ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Tái cấu trúc kho: Điều hướng theo chương
**Phiên bản này thêm các tệp README điều hướng chương (sau này bị thay thế bởi v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Hướng dẫn AI Agents mới
**Phiên bản này thêm một hướng dẫn toàn diện cho việc triển khai AI agents với Azure Developer CLI.**

#### Đã thêm
- **🤖 docs/microsoft-foundry/agents.md**: Hướng dẫn đầy đủ bao gồm:
  - AI agents là gì và khác biệt thế nào so với chatbots
  - Ba mẫu khởi động nhanh cho agents (Foundry Agents, Prompty, RAG)
  - Mô hình kiến trúc agent (single agent, RAG, multi-agent)
  - Cấu hình và tùy chỉnh công cụ
  - Giám sát và theo dõi chỉ số
  - Cân nhắc chi phí và tối ưu hóa
  - Các tình huống khắc phục sự cố thường gặp
  - Ba bài tập thực hành với tiêu chí thành công

#### Cấu trúc nội dung
- **Giới thiệu**: Khái niệm về agent cho người mới bắt đầu
- **Bắt đầu nhanh**: Triển khai agents với `azd init --template get-started-with-ai-agents`
- **Mẫu kiến trúc**: Hình ảnh minh họa các mô hình agent
- **Cấu hình**: Thiết lập công cụ và biến môi trường
- **Giám sát**: Tích hợp Application Insights
- **Bài tập**: Học thực hành theo trình tự (20-45 phút mỗi bài)

---

### [v3.12.0] - 2026-02-05

#### Cập nhật môi trường DevContainer
**Phiên bản này cập nhật cấu hình container phát triển với các công cụ hiện đại và mặc định tốt hơn cho trải nghiệm học AZD.**

#### Đã thay đổi
- **🐳 Ảnh nền**: Cập nhật từ `python:3.12-bullseye` sang `python:3.12-bookworm` (Debian stable mới nhất)
- **📛 Tên container**: Đổi từ "Python 3" thành "AZD for Beginners" để rõ ràng hơn

#### Đã thêm
- **🔧 Tính năng Dev Container mới**:
  - `azure-cli` với hỗ trợ Bicep được bật
  - `node:20` (phiên bản LTS cho các mẫu AZD)
  - `github-cli` cho quản lý mẫu
  - `docker-in-docker` cho triển khai ứng dụng container

- **🔌 Chuyển tiếp cổng**: Các cổng được cấu hình sẵn cho phát triển thông dụng:
  - 8000 (xem trước MkDocs)
  - 3000 (ứng dụng web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Tiện ích mở rộng VS Code mới**:
  - `ms-python.vscode-pylance` - IntelliSense Python nâng cao
  - `ms-azuretools.vscode-azurefunctions` - hỗ trợ Azure Functions
  - `ms-azuretools.vscode-docker` - hỗ trợ Docker
  - `ms-azuretools.vscode-bicep` - hỗ trợ ngôn ngữ Bicep
  - `ms-azure-devtools.azure-resource-groups` - quản lý tài nguyên Azure
  - `yzhang.markdown-all-in-one` - chỉnh sửa Markdown
  - `DavidAnson.vscode-markdownlint` - kiểm tra lint cho Markdown
  - `bierner.markdown-mermaid` - hỗ trợ sơ đồ Mermaid
  - `redhat.vscode-yaml` - hỗ trợ YAML (cho azure.yaml)
  - `eamodio.gitlens` - trực quan hóa Git
  - `mhutchie.git-graph` - lịch sử Git

- **⚙️ Cài đặt VS Code**: Đã thêm cài đặt mặc định cho trình thông dịch Python, định dạng khi lưu và loại bỏ khoảng trắng thừa

- **📦 Đã cập nhật requirements-dev.txt**:
  - Đã thêm plugin MkDocs minify
  - Đã thêm pre-commit để cải thiện chất lượng mã
  - Đã thêm các gói Azure SDK (azure-identity, azure-mgmt-resource)

#### Đã sửa
- **Lệnh Post-Create**: Bây giờ xác minh việc cài đặt AZD và Azure CLI khi container khởi động

---

### [v3.11.0] - 2026-02-05

#### Cải tổ README thân thiện với người mới bắt đầu
**Phiên bản này cải thiện đáng kể README.md để dễ tiếp cận hơn với người mới và bổ sung các tài nguyên thiết yếu cho nhà phát triển AI.**

#### Đã thêm
- **🆚 So sánh Azure CLI vs AZD**: Giải thích rõ khi nào nên dùng mỗi công cụ kèm ví dụ thực tế
- **🌟 Các liên kết Awesome AZD**: Liên kết trực tiếp đến bộ sưu tập mẫu cộng đồng và tài nguyên đóng góp:
  - [Bộ sưu tập Awesome AZD](https://azure.github.io/awesome-azd/) - hơn 200 mẫu sẵn sàng triển khai
  - [Gửi một Mẫu](https://github.com/Azure/awesome-azd/issues) - đóng góp từ cộng đồng
- **🎯 Hướng dẫn Bắt đầu Nhanh**: Phần bắt đầu đơn giản 3 bước (Cài đặt → Đăng nhập → Triển khai)
- **📊 Bảng điều hướng theo kinh nghiệm**: Hướng dẫn rõ ràng về nơi nên bắt đầu dựa trên kinh nghiệm của nhà phát triển

#### Đã thay đổi
- **Cấu trúc README**: Tổ chức lại để tiết lộ thông tin theo mức độ - thông tin chính trước
- **Phần Giới thiệu**: Viết lại để giải thích "Sự kỳ diệu của `azd up`" cho người mới hoàn toàn
- **Loại bỏ nội dung trùng lặp**: Đã loại bỏ phần xử lý sự cố bị trùng
- **Lệnh xử lý sự cố**: Sửa tham chiếu `azd logs` để sử dụng `azd monitor --logs` hợp lệ

#### Đã sửa
- **🔐 Lệnh Xác thực**: Đã thêm `azd auth login` và `azd auth logout` vào cheat-sheet.md
- **Tham chiếu Lệnh Không hợp lệ**: Đã loại bỏ các `azd logs` còn lại khỏi phần xử lý sự cố trong README

#### Ghi chú
- **Phạm vi**: Các thay đổi áp dụng cho README.md chính và resources/cheat-sheet.md
- **Đối tượng mục tiêu**: Cải tiến nhằm vào các nhà phát triển mới với AZD

---

### [v3.10.0] - 2026-02-05

#### Cập nhật độ chính xác lệnh Azure Developer CLI
**Phiên bản này sửa các lệnh AZD không tồn tại trong toàn bộ tài liệu, đảm bảo tất cả ví dụ mã sử dụng cú pháp Azure Developer CLI hợp lệ.**

#### Đã sửa
- **🔧 Loại bỏ các lệnh AZD không tồn tại**: Kiểm toán toàn diện và chỉnh sửa các lệnh không hợp lệ:
  - `azd logs` (không tồn tại) → được thay thế bằng `azd monitor --logs` hoặc các lựa chọn thay thế của Azure CLI
  - `azd service` subcommands (không tồn tại) → được thay thế bằng `azd show` và Azure CLI
  - `azd infra import/export/validate` (không tồn tại) → đã bị loại bỏ hoặc thay bằng các phương án hợp lệ
  - các cờ `azd deploy --rollback/--incremental/--parallel/--detect-changes` (không tồn tại) → đã bị loại bỏ
  - các cờ `azd provision --what-if/--rollback` (không tồn tại) → được cập nhật để sử dụng `--preview`
  - `azd config validate` (không tồn tại) → được thay bằng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (không tồn tại) → đã bị loại bỏ

- **📚 Tệp đã cập nhật với sửa lệnh**:
  - `resources/cheat-sheet.md`: Tái cấu trúc lớn phần tham chiếu lệnh
  - `docs/deployment/deployment-guide.md`: Sửa các chiến lược rollback và triển khai
  - `docs/troubleshooting/debugging.md`: Sửa các phần phân tích nhật ký
  - `docs/troubleshooting/common-issues.md`: Cập nhật các lệnh xử lý sự cố
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa phần gỡ lỗi AZD
  - `docs/getting-started/azd-basics.md`: Sửa các lệnh giám sát
  - `docs/getting-started/first-project.md`: Cập nhật ví dụ giám sát và gỡ lỗi
  - `docs/getting-started/installation.md`: Sửa ví dụ trợ giúp và phiên bản
  - `docs/pre-deployment/application-insights.md`: Sửa các lệnh xem nhật ký
  - `docs/pre-deployment/coordination-patterns.md`: Sửa lệnh gỡ lỗi agent

- **📝 Cập nhật Tham chiếu Phiên bản**:
  - `docs/getting-started/installation.md`: Thay phiên bản cố định `1.5.0` bằng `1.x.x` chung với liên kết đến releases

#### Đã thay đổi
- **Chiến lược Rollback**: Cập nhật tài liệu để sử dụng rollback dựa trên Git (AZD không có rollback bản địa)
- **Xem nhật ký**: Thay các tham chiếu `azd logs` bằng `azd monitor --logs`, `azd monitor --live`, và các lệnh Azure CLI
- **Phần Hiệu năng**: Loại bỏ các cờ triển khai song song/gián đoạn không tồn tại, cung cấp các phương án hợp lệ

#### Chi tiết Kỹ thuật
- **Các lệnh AZD hợp lệ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Các cờ hợp lệ của azd monitor**: `--live`, `--logs`, `--overview`
- **Các tính năng bị loại bỏ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Ghi chú
- **Xác minh**: Các lệnh được kiểm chứng dựa trên Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Hoàn thành Workshop và Cập nhật Chất lượng Tài liệu
**Phiên bản này hoàn thành các mô-đun workshop tương tác, sửa tất cả liên kết tài liệu hỏng, và cải thiện chất lượng nội dung cho nhà phát triển AI sử dụng Microsoft AZD.**

#### Đã thêm
- **📝 CONTRIBUTING.md**: Tài liệu hướng dẫn đóng góp mới với:
  - Hướng dẫn rõ ràng để báo cáo vấn đề và đề xuất thay đổi
  - Tiêu chuẩn tài liệu cho nội dung mới
  - Hướng dẫn ví dụ mã và quy ước thông điệp commit
  - Thông tin tương tác cộng đồng

#### Hoàn thành
- **🎯 Mô-đun Workshop 7 (Kết thúc)**: Hoàn thành đầy đủ mô-đun wrap-up với:
  - Tóm tắt toàn diện các thành tựu của workshop
  - Phần các khái niệm chính đã nắm vững bao gồm AZD, mẫu, và Microsoft Foundry
  - Đề xuất tiếp tục hành trình học tập
  - Bài tập thử thách workshop với xếp hạng độ khó
  - Liên kết phản hồi và hỗ trợ cộng đồng

- **📚 Mô-đun Workshop 3 (Phân tích)**: Cập nhật mục tiêu học tập với:
  - Hướng dẫn kích hoạt GitHub Copilot với máy chủ MCP
  - Hiểu cấu trúc thư mục mẫu AZD
  - Các mẫu tổ chức Infrastructure-as-code (Bicep)
  - Hướng dẫn lab thực hành

- **🔧 Mô-đun Workshop 6 (Dọn dẹp)**: Hoàn thành với:
  - Mục tiêu dọn dẹp tài nguyên và quản lý chi phí
  - Sử dụng `azd down` để gỡ bỏ hạ tầng an toàn
  - Hướng dẫn khôi phục dịch vụ nhận thức bị xóa mềm
  - Các gợi ý khám phá bổ sung cho GitHub Copilot và Azure Portal

#### Đã sửa
- **🔗 Sửa các Liên kết Hỏng**: Đã khắc phục hơn 15 liên kết nội bộ trong tài liệu:
  - `docs/ai-foundry/ai-model-deployment.md`: Sửa đường dẫn tới microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa đường dẫn ai-model-deployment.md và production-ai-practices.md
  - `docs/getting-started/first-project.md`: Thay cicd-integration.md không tồn tại bằng deployment-guide.md
  - `examples/retail-scenario.md`: Sửa đường dẫn FAQ và hướng dẫn xử lý sự cố
  - `examples/container-app/microservices/README.md`: Sửa đường dẫn trang khóa học và hướng dẫn triển khai
  - `resources/faq.md` và `resources/glossary.md`: Cập nhật tham chiếu chương AI
  - `course-outline.md`: Sửa đường dẫn hướng dẫn giảng viên và lab workshop AI

- **📅 Banner Trạng thái Workshop**: Cập nhật từ "Under Construction" sang trạng thái workshop hoạt động với ngày tháng Tháng 2 2026
- **🔗 Điều hướng Workshop**: Sửa liên kết điều hướng hỏng trong workshop README.md trỏ tới thư mục lab-1-azd-basics không tồn tại

#### Đã thay đổi
- **Trình bày Workshop**: Loại bỏ cảnh báo "under construction", workshop giờ đã hoàn thiện và sẵn sàng sử dụng
- **Tính nhất quán Điều hướng**: Đảm bảo tất cả mô-đun workshop có điều hướng liên chương đúng
- **Tham chiếu Lộ trình Học tập**: Cập nhật liên kết chương chéo để sử dụng đúng đường dẫn microsoft-foundry

#### Đã xác thực
- ✅ Tất cả các tệp markdown tiếng Anh có liên kết nội bộ hợp lệ
- ✅ Các mô-đun workshop 0-7 hoàn chỉnh với mục tiêu học tập
- ✅ Điều hướng giữa các chương và mô-đun hoạt động đúng
- ✅ Nội dung phù hợp cho nhà phát triển AI sử dụng Microsoft AZD
- ✅ Ngôn ngữ và cấu trúc thân thiện với người mới được duy trì xuyên suốt
- ✅ CONTRIBUTING.md cung cấp hướng dẫn rõ ràng cho cộng đồng đóng góp

#### Triển khai Kỹ thuật
- **Xác thực liên kết**: Script PowerShell tự động đã kiểm tra tất cả các liên kết .md nội bộ
- **Kiểm toán Nội dung**: Đã rà soát thủ công độ hoàn chỉnh của workshop và tính phù hợp cho người mới
- **Hệ thống Điều hướng**: Áp dụng các mẫu điều hướng chương và mô-đun nhất quán

#### Ghi chú
- **Phạm vi**: Các thay đổi áp dụng cho tài liệu tiếng Anh
- **Bản dịch**: Các thư mục dịch chưa được cập nhật trong phiên bản này (bản dịch tự động sẽ đồng bộ sau)
- **Thời lượng Workshop**: Workshop hoàn chỉnh cung cấp 3-4 giờ học thực hành

---

### [v3.8.0] - 2025-11-19

#### Tài liệu nâng cao: Giám sát, Bảo mật và Mô hình Điều phối Đa-agent
**Phiên bản này bổ sung các bài học A-grade toàn diện về tích hợp Application Insights, mô hình xác thực và điều phối đa-agent cho triển khai sản xuất.**

#### Đã thêm
- **📊 Bài học Tích hợp Application Insights**: trong `docs/pre-deployment/application-insights.md`:
  - Triển khai tập trung AZD với provisioning tự động
  - Mẫu Bicep hoàn chỉnh cho Application Insights + Log Analytics
  - Ứng dụng Python hoạt động với telemetry tùy chỉnh (hơn 1.200 dòng)
  - Mô hình giám sát AI/LLM (theo dõi token/chi phí Microsoft Foundry Models)
  - 6 sơ đồ Mermaid (kiến trúc, tracing phân tán, luồng telemetry)
  - 3 bài tập thực hành (cảnh báo, bảng điều khiển, giám sát AI)
  - Ví dụ truy vấn Kusto và chiến lược tối ưu hóa chi phí
  - Streaming số liệu trực tiếp và gỡ lỗi thời gian thực
  - Thời gian học 40-50 phút với các mẫu sẵn sàng cho sản xuất

- **🔐 Bài học Xác thực & Bảo mật**: trong `docs/getting-started/authsecurity.md`:
  - 3 mô hình xác thực (connection strings, Key Vault, managed identity)
  - Mẫu hạ tầng Bicep hoàn chỉnh cho triển khai an toàn
  - Mã ứng dụng Node.js với tích hợp Azure SDK
  - 3 bài tập hoàn chỉnh (kích hoạt managed identity, user-assigned identity, xoay Key Vault)
  - Thực hành tốt nhất về bảo mật và cấu hình RBAC
  - Hướng dẫn xử lý sự cố và phân tích chi phí
  - Mô hình xác thực không mật khẩu sẵn sàng cho sản xuất

- **🤖 Bài học Mô hình Điều phối Đa-Agent**: trong `docs/pre-deployment/coordination-patterns.md`:
  - 5 mô hình điều phối (tuần tự, song song, phân cấp, sự kiện-kích hoạt, đồng thuận)
  - Triển khai dịch vụ orchestrator hoàn chỉnh (Python/Flask, hơn 1.500 dòng)
  - 3 triển khai agent chuyên biệt (Research, Writer, Editor)
  - Tích hợp Service Bus cho hàng đợi tin nhắn
  - Quản lý trạng thái trên Cosmos DB cho hệ phân tán
  - 6 sơ đồ Mermaid hiển thị tương tác giữa các agent
  - 3 bài tập nâng cao (xử lý timeout, logic retry, circuit breaker)
  - Phân tích chi phí ($240-565/tháng) với chiến lược tối ưu hóa
  - Tích hợp Application Insights để giám sát

#### Được cải thiện
- **Chương Pre-deployment**: Giờ bao gồm đầy đủ giám sát và các mô hình điều phối
- **Chương Getting Started**: Nâng cấp với các mô hình xác thực chuyên nghiệp
- **Sẵn sàng cho sản xuất**: Bao phủ toàn diện từ bảo mật đến khả năng quan sát
- **Đề cương khóa học**: Cập nhật để tham chiếu các bài học mới ở Chương 3 và 6

#### Đã thay đổi
- **Tiến trình học**: Tích hợp tốt hơn các chủ đề bảo mật và giám sát xuyên suốt khóa
- **Chất lượng Tài liệu**: Tiêu chuẩn A-grade nhất quán (95-97%) trên các bài học mới
- **Mô hình cho sản xuất**: Bao phủ end-to-end cho triển khai doanh nghiệp

#### Đã cải thiện
- **Trải nghiệm nhà phát triển**: Lộ trình rõ ràng từ phát triển đến giám sát môi trường sản xuất
- **Tiêu chuẩn bảo mật**: Các mẫu chuyên nghiệp cho xác thực và quản lý bí mật
- **Khả năng quan sát**: Tích hợp đầy đủ Application Insights với AZD
- **Tải công việc AI**: Giám sát chuyên biệt cho Microsoft Foundry Models và hệ thống đa tác nhân

#### Đã xác nhận
- ✅ Tất cả bài học bao gồm mã nguồn hoạt động hoàn chỉnh (không phải đoạn mã)
- ✅ Biểu đồ Mermaid cho học trực quan (19 tổng cộng trong 3 bài học)
- ✅ Bài tập thực hành kèm các bước kiểm tra (9 tổng cộng)
- ✅ Mẫu Bicep sẵn sàng cho môi trường sản xuất có thể triển khai bằng `azd up`
- ✅ Phân tích chi phí và chiến lược tối ưu hóa
- ✅ Hướng dẫn khắc phục sự cố và các thực hành tốt nhất
- ✅ Các điểm kiểm tra kiến thức kèm lệnh xác minh

#### Kết quả chấm điểm tài liệu
- **docs/pre-deployment/application-insights.md**: - Hướng dẫn giám sát toàn diện
- **docs/getting-started/authsecurity.md**: - Các mẫu bảo mật chuyên nghiệp
- **docs/pre-deployment/coordination-patterns.md**: - Kiến trúc đa tác nhân nâng cao
- **Nội dung mới tổng thể**: - Tiêu chuẩn chất lượng cao đồng đều

#### Triển khai kỹ thuật
- **Application Insights**: Log Analytics + telemetry tùy chỉnh + theo dõi phân tán
- **Xác thực**: Managed Identity + Key Vault + mẫu RBAC
- **Đa tác nhân**: Service Bus + Cosmos DB + Container Apps + điều phối
- **Giám sát**: số liệu trực tiếp + truy vấn Kusto + cảnh báo + bảng điều khiển
- **Quản lý chi phí**: Chiến lược lấy mẫu, chính sách giữ dữ liệu, kiểm soát ngân sách

### [v3.7.0] - 2025-11-19

#### Cải tiến chất lượng tài liệu và ví dụ mới Microsoft Foundry Models
**Phiên bản này cải thiện chất lượng tài liệu trên toàn kho lưu trữ và thêm ví dụ triển khai Microsoft Foundry Models hoàn chỉnh với giao diện chat gpt-4.1.**

#### Đã thêm
- **🤖 Ví dụ Chat Microsoft Foundry Models**: Triển khai gpt-4.1 hoàn chỉnh với triển khai hoạt động trong `examples/azure-openai-chat/`:
  - Cơ sở hạ tầng Microsoft Foundry Models hoàn chỉnh (triển khai mô hình gpt-4.1)
  - Giao diện chat dòng lệnh Python kèm lịch sử cuộc hội thoại
  - Tích hợp Key Vault để lưu trữ khóa API an toàn
  - Theo dõi sử dụng token và ước tính chi phí
  - Giới hạn tốc độ và xử lý lỗi
  - README toàn diện với hướng dẫn triển khai 35-45 phút
  - 11 tệp sẵn sàng cho sản xuất (mẫu Bicep, ứng dụng Python, cấu hình)
- **📚 Bài tập thực hành trong tài liệu**: Đã thêm bài tập thực hành vào hướng dẫn cấu hình:
  - Bài tập 1: Cấu hình đa môi trường (15 phút)
  - Bài tập 2: Thực hành quản lý bí mật (10 phút)
  - Tiêu chí thành công rõ ràng và các bước xác minh
- **✅ Xác minh triển khai**: Đã thêm phần xác minh vào hướng dẫn triển khai:
  - Thủ tục kiểm tra sức khỏe
  - Danh sách kiểm tra tiêu chí thành công
  - Kết quả mong đợi cho tất cả lệnh triển khai
  - Tham chiếu nhanh khắc phục sự cố

#### Nâng cao
- **examples/README.md**: Đã cập nhật lên chất lượng hạng A (93%):
  - Đã thêm azure-openai-chat vào tất cả các phần liên quan
  - Đã cập nhật số lượng ví dụ cục bộ từ 3 lên 4
  - Đã thêm vào bảng Ví dụ ứng dụng AI
  - Đã tích hợp vào Hướng dẫn bắt đầu nhanh cho người dùng trung cấp
  - Đã thêm vào phần Mẫu Microsoft Foundry
  - Đã cập nhật Ma trận so sánh và các phần phát hiện công nghệ
- **Chất lượng tài liệu**: Cải thiện B+ (87%) → A- (92%) trên thư mục docs:
  - Đã thêm kết quả mong đợi cho các ví dụ lệnh quan trọng
  - Bao gồm các bước xác minh cho thay đổi cấu hình
  - Tăng cường học tập thực hành với các bài tập thực tế

#### Đã thay đổi
- **Tiến trình học**: Tích hợp tốt hơn các ví dụ AI cho người học trung cấp
- **Cấu trúc tài liệu**: Nhiều bài tập mang tính hành động hơn với kết quả rõ ràng
- **Quy trình xác minh**: Thêm tiêu chí thành công rõ ràng vào các quy trình chính

#### Cải thiện
- **Trải nghiệm nhà phát triển**: Triển khai Microsoft Foundry Models hiện mất 35-45 phút (so với 60-90 cho các phương án phức tạp)
- **Minh bạch chi phí**: Ước tính chi phí rõ ràng ($50-200/tháng) cho ví dụ Microsoft Foundry Models
- **Lộ trình học**: Các nhà phát triển AI có điểm bắt đầu rõ ràng với azure-openai-chat
- **Tiêu chuẩn tài liệu**: Kết quả mong đợi và các bước xác minh đồng nhất

#### Đã xác nhận
- ✅ Ví dụ Microsoft Foundry Models hoạt động đầy đủ với `azd up`
- ✅ Tất cả 11 tệp triển khai đúng cú pháp
- ✅ Hướng dẫn README khớp với trải nghiệm triển khai thực tế
- ✅ Liên kết tài liệu được cập nhật trên hơn 8 vị trí
- ✅ Mục lục ví dụ phản ánh chính xác 4 ví dụ cục bộ
- ✅ Không có liên kết bên ngoài trùng lặp trong các bảng
- ✅ Tất cả tham chiếu điều hướng chính xác

#### Triển khai kỹ thuật
- **Kiến trúc Microsoft Foundry Models**: gpt-4.1 + Key Vault + mẫu Container Apps
- **Bảo mật**: Managed Identity đã sẵn sàng, bí mật trong Key Vault
- **Giám sát**: Tích hợp Application Insights
- **Quản lý chi phí**: Theo dõi token và tối ưu hóa sử dụng
- **Triển khai**: Một lệnh `azd up` để thiết lập hoàn chỉnh

### [v3.6.0] - 2025-11-19

#### Cập nhật lớn: Ví dụ triển khai Container App
**Phiên bản này giới thiệu các ví dụ triển khai ứng dụng container toàn diện, sẵn sàng cho sản xuất sử dụng Azure Developer CLI (AZD), với tài liệu đầy đủ và tích hợp vào lộ trình học.**

#### Đã thêm
- **🚀 Ví dụ Container App**: Các ví dụ cục bộ mới trong `examples/container-app/`:
  - [Hướng dẫn chính](examples/container-app/README.md): Tổng quan hoàn chỉnh về các triển khai container, bắt đầu nhanh, môi trường sản xuất và các mẫu nâng cao
  - [API Flask đơn giản](../../examples/container-app/simple-flask-api): REST API thân thiện cho người mới với scale-to-zero, kiểm tra sức khỏe, giám sát và khắc phục sự cố
  - [Kiến trúc Microservices](../../examples/container-app/microservices): Triển khai đa dịch vụ sẵn sàng cho sản xuất (API Gateway, Product, Order, User, Notification), nhắn tin bất đồng bộ, Service Bus, Cosmos DB, Azure SQL, theo dõi phân tán, triển khai blue-green/canary
- **Thực hành tốt nhất**: Bảo mật, giám sát, tối ưu chi phí và hướng dẫn CI/CD cho các tác vụ chạy trong container
- **Ví dụ mã**: Hoàn chỉnh `azure.yaml`, mẫu Bicep, và triển khai dịch vụ đa ngôn ngữ (Python, Node.js, C#, Go)
- **Kiểm thử & Khắc phục sự cố**: Các kịch bản kiểm thử đầu-cuối, lệnh giám sát, hướng dẫn khắc phục sự cố

#### Đã thay đổi
- **README.md**: Đã cập nhật để giới thiệu và liên kết các ví dụ ứng dụng container mới trong "Local Examples - Container Applications"
- **examples/README.md**: Đã cập nhật để làm nổi bật các ví dụ ứng dụng container, thêm mục ma trận so sánh, và cập nhật các tham chiếu công nghệ/kiến trúc
- **Dàn bài khóa học & Hướng dẫn học**: Đã cập nhật để tham chiếu các ví dụ ứng dụng container mới và các mẫu triển khai trong các chương liên quan

#### Đã xác nhận
- ✅ Tất cả các ví dụ mới có thể triển khai bằng `azd up` và tuân theo các thực hành tốt nhất
- ✅ Các liên kết chéo tài liệu và điều hướng đã được cập nhật
- ✅ Các ví dụ bao phủ các kịch bản từ cơ bản đến nâng cao, bao gồm microservices sản xuất

#### Ghi chú
- **Phạm vi**: Chỉ tài liệu và ví dụ bằng tiếng Anh
- **Bước tiếp theo**: Mở rộng với các mẫu container nâng cao bổ sung và tự động hóa CI/CD trong các phát hành tương lai

### [v3.5.0] - 2025-11-19

#### Đổi tên sản phẩm: Microsoft Foundry
**Phiên bản này thực hiện thay đổi tên sản phẩm toàn diện từ "Microsoft Foundry" sang "Microsoft Foundry" trên toàn bộ tài liệu tiếng Anh, phản ánh việc đổi tên chính thức của Microsoft.**

#### Đã thay đổi
- **🔄 Cập nhật tên sản phẩm**: Thay đổi thương hiệu hoàn toàn từ "Microsoft Foundry" sang "Microsoft Foundry"
  - Đã cập nhật tất cả các tham chiếu trong tài liệu tiếng Anh trong thư mục `docs/`
  - Đổi tên thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Đổi tên tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tổng cộng: 23 tham chiếu nội dung được cập nhật trên 7 tệp tài liệu

  - **📁 Thay đổi cấu trúc thư mục**:
  - `docs/ai-foundry/` được đổi tên thành `docs/microsoft-foundry/`
  - Tất cả tham chiếu chéo được cập nhật để phản ánh cấu trúc thư mục mới
  - Các liên kết điều hướng đã được kiểm tra trên toàn bộ tài liệu

  - **📄 Đổi tên tệp**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tất cả liên kết nội bộ đã được cập nhật để tham chiếu tên tệp mới

#### Các tệp đã cập nhật
- **Tài liệu chương** (7 tệp):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 cập nhật liên kết điều hướng
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tham chiếu tên sản phẩm được cập nhật
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Đã sử dụng Microsoft Foundry (từ các cập nhật trước)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 tham chiếu được cập nhật (tổng quan, phản hồi cộng đồng, tài liệu)
  - `docs/getting-started/azd-basics.md` - 4 liên kết tham chiếu chéo được cập nhật
  - `docs/getting-started/first-project.md` - 2 liên kết điều hướng chương được cập nhật
  - `docs/getting-started/installation.md` - 2 liên kết chương tiếp theo được cập nhật
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 tham chiếu được cập nhật (điều hướng, cộng đồng Discord)
  - `docs/troubleshooting/common-issues.md` - 1 liên kết điều hướng được cập nhật
  - `docs/troubleshooting/debugging.md` - 1 liên kết điều hướng được cập nhật

- **Tệp cấu trúc khóa học** (2 tệp):
  - `README.md` - 17 tham chiếu được cập nhật (tổng quan khóa học, tiêu đề chương, phần mẫu, thông tin cộng đồng)
  - `course-outline.md` - 14 tham chiếu được cập nhật (tổng quan, mục tiêu học tập, tài nguyên chương)

#### Đã xác nhận
- ✅ Không còn tham chiếu đường dẫn thư mục "ai-foundry" trong tài liệu tiếng Anh
- ✅ Không còn tham chiếu tên sản phẩm "Microsoft Foundry" trong tài liệu tiếng Anh
- ✅ Tất cả liên kết điều hướng hoạt động với cấu trúc thư mục mới
- ✅ Việc đổi tên tệp và thư mục đã hoàn tất thành công
- ✅ Các tham chiếu chéo giữa các chương đã được kiểm tra

#### Ghi chú
- **Phạm vi**: Các thay đổi áp dụng cho tài liệu tiếng Anh trong thư mục `docs/` thôi
- **Dịch thuật**: Thư mục dịch (`translations/`) không được cập nhật trong phiên bản này
- **Workshop**: Tài liệu workshop (`workshop/`) không được cập nhật trong phiên bản này
- **Ví dụ**: Các tệp ví dụ có thể vẫn tham chiếu tên cũ (sẽ được xử lý trong bản cập nhật tương lai)
- **Liên kết bên ngoài**: URL bên ngoài và các tham chiếu kho lưu trữ GitHub giữ nguyên

#### Hướng dẫn di chuyển cho người đóng góp
1. Cập nhật tham chiếu thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Cập nhật tham chiếu tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Thay thế tên sản phẩm: "Microsoft Foundry" → "Microsoft Foundry"
4. Xác nhận tất cả liên kết nội bộ trong tài liệu vẫn hoạt động

---

### [v3.4.0] - 2025-10-24

#### Cải tiến tính năng xem trước hạ tầng và xác thực
**Phiên bản này giới thiệu hỗ trợ toàn diện cho tính năng xem trước Azure Developer CLI mới và nâng cao trải nghiệm người dùng workshop.**

#### Đã thêm
- **🧪 Tài liệu tính năng azd provision --preview**: Phần bao phủ toàn diện về khả năng xem trước hạ tầng mới
  - Tham chiếu lệnh và ví dụ sử dụng trong cheat sheet
  - Tích hợp chi tiết trong hướng dẫn cung cấp tài nguyên với các trường hợp sử dụng và lợi ích
  - Tích hợp kiểm tra trước khi thực thi để xác thực triển khai an toàn hơn
  - Cập nhật hướng dẫn bắt đầu với các thực hành triển khai ưu tiên an toàn
- **🚧 Thanh trạng thái Workshop**: Biểu ngữ HTML chuyên nghiệp cho biết trạng thái phát triển workshop
  - Thiết kế gradient kèm chỉ báo đang xây dựng để giao tiếp rõ ràng với người dùng
  - Dấu thời gian cập nhật cuối cùng để minh bạch
  - Thiết kế tương thích di động cho mọi loại thiết bị

#### Nâng cao
- **An toàn hạ tầng**: Chức năng xem trước được tích hợp xuyên suốt tài liệu triển khai
- **Xác thực trước triển khai**: Các script tự động hiện bao gồm kiểm thử xem trước hạ tầng
- **Quy trình làm việc của nhà phát triển**: Cập nhật chuỗi lệnh để bao gồm xem trước như thực hành tốt nhất
- **Trải nghiệm Workshop**: Thiết lập kỳ vọng rõ ràng cho người dùng về trạng thái phát triển nội dung

#### Đã thay đổi
- **Thực hành triển khai tốt nhất**: Quy trình làm việc ưu tiên xem trước nay là phương pháp được khuyến nghị
- **Luồng tài liệu**: Xác thực hạ tầng được đưa lên sớm hơn trong quá trình học
- **Trình bày Workshop**: Truyền đạt trạng thái chuyên nghiệp với dòng thời gian phát triển rõ ràng

#### Cải thiện
- **Phương pháp ưu tiên an toàn**: Các thay đổi hạ tầng giờ có thể được xác thực trước khi triển khai
- **Hợp tác nhóm**: Kết quả xem trước có thể được chia sẻ để xem xét và phê duyệt
- **Nhận thức chi phí**: Hiểu rõ hơn chi phí tài nguyên trước khi cấp phát
- **Giảm thiểu rủi ro**: Giảm lỗi triển khai thông qua xác thực trước

#### Triển khai kỹ thuật
- **Tích hợp đa tài liệu**: Tính năng xem trước được ghi chép qua 4 tệp chính
- **Mẫu lệnh**: Cú pháp và ví dụ nhất quán trong toàn bộ tài liệu
- **Tích hợp thực hành tốt nhất**: Xem trước được bao gồm trong quy trình xác thực và các script
- **Chỉ báo trực quan**: Đánh dấu tính năng MỚI rõ ràng để dễ tìm

#### Hạ tầng Workshop
- **Truyền đạt trạng thái**: Biểu ngữ HTML chuyên nghiệp với kiểu gradient
- **Trải nghiệm người dùng**: Trạng thái phát triển rõ ràng giúp tránh nhầm lẫn
- **Trình bày chuyên nghiệp**: Duy trì uy tín kho lưu trữ đồng thời thiết lập kỳ vọng
- **Minh bạch lịch trình**: Dấu thời gian cập nhật cuối là tháng 10 năm 2025 để đảm bảo trách nhiệm

### [v3.3.0] - 2025-09-24

#### Nâng cao tài liệu workshop và trải nghiệm học tương tác
**Phiên bản này giới thiệu tài liệu workshop toàn diện với hướng dẫn tương tác dựa trên trình duyệt và lộ trình học có cấu trúc.**

#### Đã thêm
- **🎥 Hướng dẫn Workshop Tương tác**: Trải nghiệm workshop trên trình duyệt với khả năng xem trước MkDocs
- **📝 Hướng dẫn Workshop Có cấu trúc**: Lộ trình học 7 bước có hướng dẫn từ khám phá đến tùy chỉnh
  - 0-Introduction: Workshop overview and setup
  - 1-Select-AI-Template: Template discovery and selection process
  - 2-Validate-AI-Template: Deployment and validation procedures
  - 3-Deconstruct-AI-Template: Understanding template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modifications and iterations
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and next steps
- **🛠️ Công cụ Workshop**: Cấu hình MkDocs với theme Material để nâng cao trải nghiệm học tập
- **🎯 Lộ trình Học Thực hành**: Phương pháp 3 bước (Khám phá → Triển khai → Tùy chỉnh)
- **📱 Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển liền mạch

#### Nâng cao
- **AI Workshop Lab**: Mở rộng với trải nghiệm học có cấu trúc toàn diện kéo dài 2-3 giờ
- **Tài liệu Workshop**: Trình bày chuyên nghiệp với điều hướng và hỗ trợ hình ảnh
- **Tiến trình Học tập**: Hướng dẫn từng bước rõ ràng từ chọn mẫu đến triển khai sản xuất
- **Trải nghiệm Nhà phát triển**: Công cụ tích hợp cho quy trình phát triển tinh gọn

#### Cải tiến
- **Khả năng truy cập**: Giao diện trên trình duyệt với chức năng tìm kiếm, sao chép và chuyển đổi giao diện
- **Học tự tiến độ**: Cấu trúc workshop linh hoạt phù hợp với tốc độ học khác nhau
- **Ứng dụng thực tiễn**: Các kịch bản triển khai mẫu AI trong thực tế
- **Tích hợp Cộng đồng**: Tích hợp Discord cho hỗ trợ và hợp tác trong workshop

#### Tính năng Workshop
- **Tìm kiếm tích hợp**: Tìm nhanh từ khóa và bài học
- **Sao chép khối mã**: Chức năng di chuột để sao chép cho tất cả ví dụ mã
- **Chuyển đổi Giao diện**: Hỗ trợ chế độ tối/sáng cho các tùy chọn khác nhau
- **Tài nguyên Hình ảnh**: Ảnh chụp màn hình và sơ đồ để tăng hiểu biết
- **Tích hợp Trợ giúp**: Truy cập trực tiếp Discord cho hỗ trợ cộng đồng

### [v3.2.0] - 2025-09-17

#### Tái cấu trúc Điều hướng chính và Hệ thống Học theo Chương
**Phiên bản này giới thiệu cấu trúc học theo chương toàn diện với điều hướng được cải thiện trên toàn bộ kho lưu trữ.**

#### Đã thêm
- **📚 Hệ thống Học theo Chương**: Tổ chức lại toàn bộ khóa học thành 8 chương học tiến trình
  - Chương 1: Nền tảng & Bắt đầu Nhanh (⭐ - 30-45 phút)
  - Chương 2: Phát triển Ưu tiên AI (⭐⭐ - 1-2 giờ)
  - Chương 3: Cấu hình & Xác thực (⭐⭐ - 45-60 phút)
  - Chương 4: Hạ tầng như Mã & Triển khai (⭐⭐⭐ - 1-1.5 giờ)
  - Chương 5: Giải pháp AI Đa Tác nhân (⭐⭐⭐⭐ - 2-3 giờ)
  - Chương 6: Xác thực & Lập kế hoạch Trước Triển khai (⭐⭐ - 1 giờ)
  - Chương 7: Khắc phục sự cố & Gỡ lỗi (⭐⭐ - 1-1.5 giờ)
  - Chương 8: Mẫu Sản xuất & Doanh nghiệp (⭐⭐⭐⭐ - 2-3 giờ)
- **📚 Hệ thống Điều hướng Toàn diện**: Tiêu đề và chân trang điều hướng nhất quán trên toàn bộ tài liệu
- **🎯 Theo dõi Tiến trình**: Danh sách kiểm tra hoàn thành khóa học và hệ thống xác minh học tập
- **🗺️ Hướng dẫn Lộ trình Học**: Điểm bắt đầu rõ ràng cho các cấp độ kinh nghiệm và mục tiêu khác nhau
- **🔗 Điều hướng Tham chiếu chéo**: Các chương liên quan và điều kiện tiên quyết được liên kết rõ ràng

#### Nâng cao
- **Cấu trúc README**: Chuyển thành nền tảng học có cấu trúc với tổ chức theo chương
- **Điều hướng Tài liệu**: Mỗi trang bây giờ bao gồm bối cảnh chương và hướng dẫn tiến trình
- **Tổ chức Mẫu**: Ví dụ và mẫu được ánh xạ tới các chương học phù hợp
- **Tích hợp Tài nguyên**: Bảng cheat, Câu hỏi thường gặp và hướng dẫn học liên kết tới các chương liên quan
- **Tích hợp Workshop**: Các phòng thí nghiệm thực hành được ánh xạ tới nhiều mục tiêu học tập chương

#### Đã thay đổi
- **Tiến trình Học tập**: Chuyển từ tài liệu tuyến tính sang học linh hoạt theo chương
- **Vị trí Cấu hình**: Đặt lại hướng dẫn cấu hình thành Chương 3 để luồng học tốt hơn
- **Tích hợp Nội dung AI**: Tích hợp tốt hơn nội dung đặc thù AI xuyên suốt hành trình học
- **Nội dung Sản xuất**: Các mẫu nâng cao được hợp nhất trong Chương 8 cho học viên doanh nghiệp

#### Cải thiện
- **Trải nghiệm Người dùng**: Dấu đường dẫn điều hướng rõ ràng và chỉ báo tiến trình chương
- **Khả năng Truy cập**: Mẫu điều hướng nhất quán giúp dễ duyệt khóa học hơn
- **Trình bày Chuyên nghiệp**: Cấu trúc khóa học theo phong cách đại học phù hợp cho đào tạo học thuật và doanh nghiệp
- **Hiệu quả Học tập**: Giảm thời gian tìm nội dung liên quan thông qua tổ chức được cải thiện

#### Triển khai Kỹ thuật
- **Tiêu đề Điều hướng**: Chuẩn hóa điều hướng chương trên hơn 40+ tệp tài liệu
- **Điều hướng Chân trang**: Hướng dẫn tiến trình nhất quán và chỉ báo hoàn thành chương
- **Liên kết chéo**: Hệ thống liên kết nội bộ toàn diện kết nối các khái niệm liên quan
- **Ánh xạ Chương**: Mẫu và ví dụ được liên kết rõ ràng với các mục tiêu học tập

#### Cải tiến Hướng dẫn Học tập
- **📚 Mục tiêu Học tập Toàn diện**: Tái cấu trúc hướng dẫn học để phù hợp với hệ thống 8 chương
- **🎯 Đánh giá theo Chương**: Mỗi chương bao gồm mục tiêu học cụ thể và bài tập thực hành
- **📋 Theo dõi Tiến độ**: Lịch học hàng tuần với kết quả đo lường được và danh sách kiểm tra hoàn thành
- **❓ Câu hỏi Đánh giá**: Câu hỏi xác thực kiến thức cho mỗi chương với kết quả chuyên nghiệp
- **🛠️ Bài tập Thực hành**: Hoạt động thực hành với các kịch bản triển khai thực tế và khắc phục sự cố
- **📊 Tiến trình Kỹ năng**: Sự tiến bộ rõ ràng từ khái niệm cơ bản đến các mẫu doanh nghiệp với trọng tâm phát triển nghề nghiệp
- **🎓 Khung Chứng nhận**: Kết quả phát triển chuyên môn và hệ thống công nhận cộng đồng
- **⏱️ Quản lý Thời gian**: Kế hoạch học có cấu trúc 10 tuần với xác thực các mốc

### [v3.1.0] - 2025-09-17

#### Cải tiến Giải pháp AI Đa Tác nhân
**Phiên bản này cải thiện giải pháp bán lẻ đa tác nhân với đặt tên tác nhân tốt hơn và tài liệu được nâng cao.**

#### Đã thay đổi
- **Thuật ngữ Đa Tác nhân**: Thay "Cora agent" bằng "Customer agent" trong toàn bộ giải pháp bán lẻ đa tác nhân để hiểu rõ hơn
- **Kiến trúc Tác nhân**: Cập nhật tất cả tài liệu, ARM templates, và ví dụ mã để sử dụng đặt tên "Customer agent" nhất quán
- **Ví dụ Cấu hình**: Hiện đại hóa các mẫu cấu hình tác nhân với quy ước đặt tên được cập nhật
- **Tính Nhất quán Tài liệu**: Đảm bảo tất cả tham chiếu sử dụng tên tác nhân mô tả, chuyên nghiệp

#### Nâng cao
- **Gói ARM Template**: Cập nhật retail-multiagent-arm-template với tham chiếu Customer agent
- **Sơ đồ Kiến trúc**: Làm mới sơ đồ Mermaid với đặt tên tác nhân cập nhật
- **Ví dụ Mã**: Các lớp Python và ví dụ triển khai giờ sử dụng đặt tên CustomerAgent
- **Biến Môi trường**: Cập nhật tất cả script triển khai để sử dụng quy ước CUSTOMER_AGENT_NAME

#### Cải thiện
- **Trải nghiệm Nhà phát triển**: Vai trò và trách nhiệm tác nhân rõ ràng hơn trong tài liệu
- **Sẵn sàng Sản xuất**: Căn chỉnh tốt hơn với quy ước đặt tên doanh nghiệp
- **Tài liệu Học tập**: Tên tác nhân trực quan hơn cho mục đích giáo dục
- **Khả dụng Mẫu**: Giúp hiểu đơn giản hơn về chức năng tác nhân và mẫu triển khai

#### Chi tiết Kỹ thuật
- Đã cập nhật sơ đồ kiến trúc Mermaid với tham chiếu CustomerAgent
- Đã thay thế tên lớp CoraAgent bằng CustomerAgent trong các ví dụ Python
- Đã sửa đổi cấu hình JSON ARM template để sử dụng loại tác nhân "customer"
- Đã cập nhật biến môi trường từ CORA_AGENT_* sang mẫu CUSTOMER_AGENT_*
- Làm mới tất cả lệnh triển khai và cấu hình container

### [v3.0.0] - 2025-09-12

#### Thay đổi Lớn - Tập trung Nhà phát triển AI và Tích hợp Microsoft Foundry
**Phiên bản này biến kho lưu trữ thành một tài nguyên học tập toàn diện tập trung vào AI với tích hợp Microsoft Foundry.**

#### Đã thêm
- **🤖 Lộ trình Học Ưu tiên AI**: Tái cấu trúc hoàn chỉnh ưu tiên cho nhà phát triển và kỹ sư AI
- **Hướng dẫn Tích hợp Microsoft Foundry**: Tài liệu toàn diện để kết nối AZD với dịch vụ Microsoft Foundry
- **Mẫu Triển khai Mô hình AI**: Hướng dẫn chi tiết bao gồm lựa chọn mô hình, cấu hình và chiến lược triển khai sản xuất
- **AI Workshop Lab**: Workshop thực hành 2-3 giờ để chuyển ứng dụng AI thành các giải pháp có thể triển khai bằng AZD
- **Thực hành Tốt nhất cho AI Sản xuất**: Các mẫu sẵn sàng cho doanh nghiệp để mở rộng, giám sát và bảo mật khối lượng công việc AI
- **Hướng dẫn Khắc phục Sự cố Riêng cho AI**: Khắc phục sự cố toàn diện cho Microsoft Foundry Models, Cognitive Services và các vấn đề triển khai AI
- **Thư viện Mẫu AI**: Bộ sưu tập nổi bật các mẫu Microsoft Foundry với đánh giá độ phức tạp
- **Tài liệu Workshop**: Cấu trúc workshop hoàn chỉnh với các phòng thí nghiệm thực hành và tài liệu tham khảo

#### Nâng cao
- **Cấu trúc README**: Tập trung cho nhà phát triển AI với dữ liệu 45% quan tâm cộng đồng từ Microsoft Foundry Discord
- **Lộ trình Học**: Hành trình dành riêng cho nhà phát triển AI bên cạnh các lộ trình truyền thống cho sinh viên và kỹ sư DevOps
- **Khuyến nghị Mẫu**: Các mẫu AI nổi bật bao gồm azure-search-openai-demo, contoso-chat, và openai-chat-app-quickstart
- **Tích hợp Cộng đồng**: Hỗ trợ cộng đồng Discord được cải thiện với các kênh và thảo luận chuyên biệt cho AI

#### Tập trung về Bảo mật & Sản xuất
- **Mẫu Managed Identity**: Cấu hình xác thực và bảo mật đặc thù cho AI
- **Tối ưu hóa Chi phí**: Theo dõi sử dụng token và kiểm soát ngân sách cho khối lượng công việc AI
- **Triển khai đa vùng**: Chiến lược cho triển khai ứng dụng AI trên toàn cầu
- **Giám sát Hiệu suất**: Các chỉ số đặc thù AI và tích hợp Application Insights

#### Chất lượng Tài liệu
- **Cấu trúc Khóa học Tuyến tính**: Tiến trình logic từ người mới đến các mẫu triển khai AI nâng cao
- **URL đã xác thực**: Tất cả liên kết kho bên ngoài đã được kiểm tra và có thể truy cập
- **Tham khảo Đầy đủ**: Tất cả liên kết tài liệu nội bộ đã được xác thực và hoạt động
- **Sẵn sàng Sản xuất**: Các mẫu triển khai doanh nghiệp với ví dụ thực tế

### [v2.0.0] - 2025-09-09

#### Thay đổi Lớn - Tái cấu trúc Kho lưu trữ và Nâng cấp Chuyên nghiệp
**Phiên bản này đại diện cho một cải tổ đáng kể về cấu trúc kho lưu trữ và cách trình bày nội dung.**

#### Đã thêm
- **Khung Học Tập Cấu trúc**: Tất cả trang tài liệu hiện bao gồm các phần Giới thiệu, Mục tiêu Học tập và Kết quả Học tập
- **Hệ thống Điều hướng**: Thêm liên kết Bài trước/Bài sau trên toàn bộ tài liệu để hướng dẫn tiến trình học
- **Hướng dẫn Học tập**: study-guide.md toàn diện với mục tiêu học tập, bài tập thực hành và tài liệu đánh giá
- **Trình bày Chuyên nghiệp**: Loại bỏ tất cả biểu tượng emoji để cải thiện khả năng truy cập và diện mạo chuyên nghiệp
- **Cấu trúc Nội dung được Cải thiện**: Tổ chức và luồng nội dung học được cải thiện

#### Đã thay đổi
- **Định dạng Tài liệu**: Chuẩn hóa tất cả tài liệu với cấu trúc tập trung vào học tập nhất quán
- **Luồng Điều hướng**: Thực hiện tiến trình logic qua tất cả tài liệu học
- **Trình bày Nội dung**: Loại bỏ các yếu tố trang trí để ủng hộ định dạng rõ ràng, chuyên nghiệp
- **Cấu trúc Liên kết**: Cập nhật tất cả liên kết nội bộ để hỗ trợ hệ thống điều hướng mới

#### Cải thiện
- **Khả năng Truy cập**: Loại bỏ phụ thuộc emoji để tương thích tốt hơn với trình đọc màn hình
- **Diện mạo Chuyên nghiệp**: Trình bày gọn gàng theo phong cách học thuật phù hợp cho đào tạo doanh nghiệp
- **Trải nghiệm Học tập**: Phương pháp có cấu trúc với mục tiêu và kết quả rõ ràng cho mỗi bài học
- **Tổ chức Nội dung**: Luồng logic tốt hơn và kết nối giữa các chủ đề liên quan

### [v1.0.0] - 2025-09-09

#### Phát hành Ban đầu - Kho học AZD Toàn diện

#### Đã thêm
- **Cấu trúc Tài liệu Cốt lõi**
  - Chuỗi hướng dẫn bắt đầu toàn diện
  - Tài liệu triển khai và cung cấp toàn diện
  - Tài nguyên khắc phục sự cố chi tiết và hướng dẫn gỡ lỗi
  - Công cụ và quy trình xác thực trước khi triển khai

- **Mô-đun Bắt đầu**
  - AZD Basics: Các khái niệm cốt lõi và thuật ngữ
  - Hướng dẫn Cài đặt: Hướng dẫn thiết lập theo nền tảng
  - Hướng dẫn Cấu hình: Thiết lập môi trường và xác thực
  - Hướng dẫn Dự án Đầu tiên: Học thực hành từng bước

- **Mô-đun Triển khai và Cung cấp**
  - Hướng dẫn Triển khai: Tài liệu quy trình làm việc hoàn chỉnh
  - Hướng dẫn Cung cấp: Hạ tầng như Mã với Bicep
  - Thực hành tốt nhất cho triển khai sản xuất
  - Các mẫu kiến trúc đa dịch vụ

- **Mô-đun Xác thực Trước Triển khai**
  - Lập Kế hoạch Công suất: Xác thực tính sẵn có của tài nguyên Azure
  - Lựa chọn SKU: Hướng dẫn chi tiết về cấp dịch vụ
  - Kiểm tra Trước Triển khai: Script xác thực tự động (PowerShell và Bash)
  - Công cụ ước lượng chi phí và lập kế hoạch ngân sách

- **Mô-đun Khắc phục sự cố**
  - Vấn đề Phổ biến: Các vấn đề thường gặp và giải pháp
  - Hướng dẫn Gỡ lỗi: Phương pháp khắc phục sự cố có hệ thống
  - Kỹ thuật và công cụ chẩn đoán nâng cao
  - Giám sát hiệu suất và tối ưu hóa

- **Tài nguyên và Tham khảo**
  - Bảng tóm tắt Lệnh: Tham khảo nhanh cho các lệnh thiết yếu
  - Thuật ngữ: Định nghĩa thuật ngữ và chữ viết tắt toàn diện
  - Câu hỏi thường gặp: Câu trả lời chi tiết cho các câu hỏi phổ biến
  - Liên kết tài nguyên bên ngoài và kết nối cộng đồng

- **Ví dụ và Mẫu**
  - Ví dụ Ứng dụng Web đơn giản
  - Mẫu triển khai Website Tĩnh
  - Cấu hình Ứng dụng Container
  - Mẫu tích hợp Cơ sở dữ liệu
  - Ví dụ kiến trúc Microservices
  - Triển khai hàm Serverless

#### Tính năng
- **Hỗ trợ Đa nền tảng**: Hướng dẫn cài đặt và cấu hình cho Windows, macOS và Linux
- **Nhiều Cấp độ Kỹ năng**: Nội dung thiết kế cho sinh viên đến nhà phát triển chuyên nghiệp
- **Tập trung Thực tiễn**: Ví dụ thực hành và kịch bản thực tế
- **Phủ sóng Toàn diện**: Từ khái niệm cơ bản đến các mẫu doanh nghiệp nâng cao
- **Tiếp cận Ưu tiên Bảo mật**: Thực hành tốt nhất về bảo mật tích hợp xuyên suốt
- **Tối ưu hóa Chi phí**: Hướng dẫn triển khai tiết kiệm chi phí và quản lý tài nguyên

#### Chất lượng Tài liệu
- **Ví dụ Mã Chi tiết**: Mẫu mã thực tế, đã được kiểm thử
- **Hướng dẫn Từng bước**: Hướng dẫn rõ ràng, có thể thực hiện được
- **Xử lý Lỗi Toàn diện**: Khắc phục sự cố cho các vấn đề phổ biến
- **Tích hợp Thực hành Tốt nhất**: Tiêu chuẩn ngành và khuyến nghị
- **Tương thích Phiên bản**: Cập nhật với dịch vụ Azure mới nhất và tính năng azd

## Các Nâng cấp Dự kiến trong Tương lai

### Phiên bản 3.1.0 (Dự kiến)
#### Mở rộng Nền tảng AI
- **Hỗ trợ đa mô hình**: Mẫu tích hợp cho Hugging Face, Azure Machine Learning và các mô hình tùy chỉnh
- **Khung tác nhân AI**: Mẫu triển khai cho LangChain, Semantic Kernel và AutoGen
- **Mẫu RAG nâng cao**: Các lựa chọn cơ sở dữ liệu vector ngoài Azure AI Search (Pinecone, Weaviate, v.v.)
- **Khả năng quan sát AI**: Giám sát nâng cao cho hiệu suất mô hình, sử dụng token và chất lượng phản hồi

#### Trải nghiệm nhà phát triển
- **Tiện ích mở rộng VS Code**: Trải nghiệm phát triển tích hợp AZD + Microsoft Foundry
- **Tích hợp GitHub Copilot**: Tạo mẫu AZD được hỗ trợ bởi AI
- **Hướng dẫn tương tác**: Bài tập mã hóa thực hành với xác thực tự động cho các kịch bản AI
- **Nội dung video**: Hướng dẫn video bổ sung cho người học trực quan tập trung vào triển khai AI

### Phiên bản 4.0.0 (Dự kiến)
#### Mẫu AI cho Doanh nghiệp
- **Khung quản trị**: Quản trị mô hình AI, tuân thủ và dấu vết kiểm toán
- **AI đa khách hàng**: Mẫu phục vụ nhiều khách hàng với dịch vụ AI tách biệt
- **Triển khai Edge AI**: Tích hợp với Azure IoT Edge và các instance container
- **AI đám mây lai**: Mẫu triển khai đa đám mây và lai cho khối lượng công việc AI

#### Tính năng nâng cao
- **Tự động hóa pipeline AI**: Tích hợp MLOps với pipeline của Azure Machine Learning
- **Bảo mật nâng cao**: Mẫu zero-trust, endpoint riêng tư và bảo vệ chống mối đe dọa nâng cao
- **Tối ưu hiệu năng**: Điều chỉnh và chiến lược scale nâng cao cho ứng dụng AI có thông lượng cao
- **Phân phối toàn cầu**: Mẫu phân phối nội dung và caching ở edge cho ứng dụng AI

### Phiên bản 3.0.0 (Dự kiến) - Đã được thay thế bởi bản phát hành hiện tại
#### Các bổ sung đề xuất - Hiện đã được triển khai trong v3.0.0
- ✅ **Nội dung tập trung vào AI**: Tích hợp Microsoft Foundry toàn diện (Đã hoàn thành)
- ✅ **Hướng dẫn tương tác**: Phòng thí nghiệm workshop AI thực hành (Đã hoàn thành)
- ✅ **Mô-đun bảo mật nâng cao**: Mẫu bảo mật dành riêng cho AI (Đã hoàn thành)
- ✅ **Tối ưu hiệu năng**: Chiến lược điều chỉnh khối lượng công việc AI (Đã hoàn thành)

### Phiên bản 2.1.0 (Dự kiến) - Được triển khai một phần trong v3.0.0
#### Cải tiến nhỏ - Một số đã hoàn thành trong bản phát hành hiện tại
- ✅ **Ví dụ bổ sung**: Các kịch bản triển khai tập trung vào AI (Đã hoàn thành)
- ✅ **FAQ mở rộng**: Câu hỏi và khắc phục sự cố dành cho AI (Đã hoàn thành)
- **Tích hợp công cụ**: Hướng dẫn tích hợp IDE và trình soạn thảo được cải thiện
- ✅ **Mở rộng giám sát**: Mẫu giám sát và cảnh báo dành cho AI (Đã hoàn thành)

#### Vẫn được lên kế hoạch cho bản phát hành tương lai
- **Tài liệu thân thiện với di động**: Thiết kế phản hồi cho việc học trên thiết bị di động
- **Truy cập ngoại tuyến**: Gói tài liệu có thể tải xuống
- **Tăng cường tích hợp IDE**: Tiện ích mở rộng VS Code cho luồng công việc AZD + AI
- **Bảng điều khiển cộng đồng**: Số liệu cộng đồng theo thời gian thực và theo dõi đóng góp

## Đóng góp vào Changelog

### Báo cáo thay đổi
Khi đóng góp vào kho lưu trữ này, vui lòng đảm bảo mục trong changelog bao gồm:

1. **Số phiên bản**: Tuân theo semantic versioning (major.minor.patch)
2. **Ngày**: Ngày phát hành hoặc cập nhật theo định dạng YYYY-MM-DD
3. **Hạng mục**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Mô tả rõ ràng**: Mô tả ngắn gọn về những gì đã thay đổi
5. **Đánh giá tác động**: Những thay đổi ảnh hưởng như thế nào đến người dùng hiện tại

### Các hạng mục thay đổi

#### Đã thêm
- Tính năng mới, các phần tài liệu hoặc khả năng mới
- Ví dụ mới, mẫu hoặc tài nguyên học tập
- Công cụ bổ sung, script hoặc tiện ích

#### Đã thay đổi
- Các chỉnh sửa đối với chức năng hoặc tài liệu hiện có
- Cập nhật để cải thiện rõ ràng hoặc độ chính xác
- Tổ chức lại nội dung hoặc cơ cấu

#### Ngưng sử dụng
- Các tính năng hoặc phương pháp đang được loại dần
- Các phần tài liệu dự kiến sẽ xóa
- Các phương pháp có lựa chọn thay thế tốt hơn

#### Đã loại bỏ
- Các tính năng, tài liệu hoặc ví dụ không còn phù hợp
- Thông tin lỗi thời hoặc các phương pháp đã ngưng sử dụng
- Nội dung thừa hoặc được hợp nhất

#### Đã sửa
- Sửa lỗi trong tài liệu hoặc mã
- Khắc phục các vấn đề hoặc lỗi được báo cáo
- Cải thiện độ chính xác hoặc chức năng

#### Bảo mật
- Các cải tiến hoặc sửa lỗi liên quan đến bảo mật
- Cập nhật các thực hành tốt nhất về bảo mật
- Khắc phục lỗ hổng bảo mật

### Hướng dẫn về Semantic Versioning

#### Phiên bản chính (X.0.0)
- Các thay đổi phá vỡ cần hành động của người dùng
- Tái cấu trúc đáng kể nội dung hoặc tổ chức
- Các thay đổi làm thay đổi phương pháp hoặc cách tiếp cận cơ bản

#### Phiên bản phụ (X.Y.0)
- Tính năng mới hoặc bổ sung nội dung
- Cải tiến giữ tương thích ngược
- Ví dụ, công cụ hoặc tài nguyên bổ sung

#### Phiên bản sửa lỗi (X.Y.Z)
- Sửa lỗi và hiệu chỉnh
- Cải tiến nhỏ cho nội dung hiện có
- Làm rõ và cải tiến nhỏ

## Phản hồi và đề xuất từ cộng đồng

Chúng tôi chủ động khuyến khích phản hồi từ cộng đồng để cải thiện tài nguyên học tập này:

### Cách gửi phản hồi
- **GitHub Issues**: Báo cáo vấn đề hoặc đề xuất cải tiến (chào đón các vấn đề liên quan đến AI)
- **Discord Discussions**: Chia sẻ ý tưởng và tham gia cùng cộng đồng Microsoft Foundry
- **Pull Requests**: Góp các cải tiến trực tiếp cho nội dung, đặc biệt là mẫu và hướng dẫn về AI
- **Microsoft Foundry Discord**: Tham gia kênh #Azure để thảo luận về AZD + AI
- **Community Forums**: Tham gia thảo luận rộng hơn cho nhà phát triển Azure

### Các hạng mục phản hồi
- **Độ chính xác nội dung AI**: Sửa lỗi về tích hợp dịch vụ AI và thông tin triển khai
- **Trải nghiệm học tập**: Đề xuất cải thiện luồng học cho nhà phát triển AI
- **Thiếu nội dung AI**: Yêu cầu thêm mẫu, mô hình hoặc ví dụ về AI
- **Khả năng truy cập**: Cải tiến cho nhu cầu học đa dạng
- **Tích hợp công cụ AI**: Đề xuất cải thiện tích hợp luồng công việc phát triển AI
- **Mẫu AI cho môi trường sản xuất**: Yêu cầu mẫu triển khai AI cho doanh nghiệp

### Cam kết phản hồi
- **Phản hồi vấn đề**: Trong vòng 48 giờ cho các vấn đề được báo cáo
- **Yêu cầu tính năng**: Đánh giá trong vòng một tuần
- **Đóng góp cộng đồng**: Xem xét trong vòng một tuần
- **Vấn đề bảo mật**: Ưu tiên ngay lập tức với phản hồi nhanh

## Lịch bảo trì

### Cập nhật định kỳ
- **Đánh giá hàng tháng**: Độ chính xác nội dung và xác thực liên kết
- **Cập nhật theo quý**: Bổ sung và cải tiến nội dung lớn
- **Đánh giá bán niên**: Tái cấu trúc và nâng cấp toàn diện
- **Phát hành hàng năm**: Cập nhật phiên bản lớn với các cải tiến đáng kể

### Giám sát và đảm bảo chất lượng
- **Kiểm thử tự động**: Xác thực định kỳ các ví dụ mã và liên kết
- **Tích hợp phản hồi cộng đồng**: Thường xuyên kết hợp đề xuất của người dùng
- **Cập nhật công nghệ**: Đồng bộ với các dịch vụ Azure mới nhất và các bản phát hành azd
- **Kiểm toán khả năng truy cập**: Xem xét định kỳ theo các nguyên tắc thiết kế bao quát

## Chính sách hỗ trợ phiên bản

### Hỗ trợ phiên bản hiện tại
- **Phiên bản chính mới nhất**: Hỗ trợ đầy đủ với các cập nhật định kỳ
- **Phiên bản chính trước đó**: Cập nhật bảo mật và sửa lỗi quan trọng trong 12 tháng
- **Phiên bản cũ**: Chỉ hỗ trợ cộng đồng, không có cập nhật chính thức

### Hướng dẫn di chuyển
Khi các phiên bản lớn được phát hành, chúng tôi cung cấp:
- **Hướng dẫn di chuyển**: Hướng dẫn chuyển đổi từng bước
- **Ghi chú tương thích**: Chi tiết về các thay đổi phá vỡ
- **Hỗ trợ công cụ**: Script hoặc tiện ích để hỗ trợ di chuyển
- **Hỗ trợ cộng đồng**: Diễn đàn chuyên dụng cho các câu hỏi về di chuyển

---

**Điều hướng**
- **Bài học trước**: [Hướng dẫn học](resources/study-guide.md)
- **Bài học tiếp theo**: Quay lại [README chính](README.md)

**Luôn cập nhật**: Theo dõi kho lưu trữ này để nhận thông báo về các bản phát hành mới và các cập nhật quan trọng cho tài liệu học tập.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn có thẩm quyền. Đối với các thông tin quan trọng, nên sử dụng bản dịch do chuyên gia dịch thuật con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu nhầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->