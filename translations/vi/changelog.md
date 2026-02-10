# Nhật ký thay đổi - AZD For Beginners

## Giới thiệu

Nhật ký thay đổi này ghi lại tất cả những thay đổi, cập nhật và cải tiến đáng chú ý cho kho lưu trữ AZD For Beginners. Chúng tôi theo các nguyên tắc phân loại phiên bản có ý nghĩa và duy trì nhật ký này để giúp người dùng hiểu những gì đã thay đổi giữa các phiên bản.

## Mục tiêu học tập

Bằng cách xem xét nhật ký thay đổi này, bạn sẽ:
- Luôn nắm được các tính năng mới và nội dung được thêm vào
- Hiểu các cải tiến đã thực hiện cho tài liệu hiện có
- Theo dõi các sửa lỗi và chỉnh sửa để đảm bảo độ chính xác
- Theo dõi sự phát triển của tài liệu học tập theo thời gian

## Kết quả học tập

Sau khi xem xét các mục trong nhật ký thay đổi, bạn sẽ có thể:
- Xác định nội dung và tài nguyên mới có sẵn để học
- Hiểu những phần nào đã được cập nhật hoặc cải thiện
- Lập kế hoạch con đường học tập dựa trên tài liệu mới nhất
- Đóng góp phản hồi và đề xuất cho các cải tiến trong tương lai

## Lịch sử phiên bản

### [v3.17.0] - 2026-02-05

#### Cải tiến điều hướng khóa học
**Phiên bản này cải thiện điều hướng chương trong README.md với định dạng bảng nâng cao.**

#### Đã thay đổi
- **Bảng Sơ đồ Khóa học**: Nâng cấp với liên kết bài học trực tiếp, ước lượng thời lượng và đánh giá độ phức tạp
- **Dọn dẹp thư mục**: Loại bỏ các thư mục cũ trùng lặp (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Xác thực liên kết**: Tất cả hơn 21 liên kết nội bộ trong bảng Sơ đồ Khóa học đã được xác minh

### [v3.16.0] - 2026-02-05

#### Cập nhật tên sản phẩm
**Phiên bản này cập nhật tham chiếu sản phẩm theo thương hiệu Microsoft hiện tại.**

#### Đã thay đổi
- **Azure AI Foundry → Microsoft Foundry**: Tất cả các tham chiếu đã được cập nhật trên các tệp không phải bản dịch
- **Azure AI Agent Service → Foundry Agents**: Tên dịch vụ được cập nhật để phản ánh thương hiệu hiện tại

#### Các tệp đã cập nhật
- `README.md` - Trang chính của khóa học
- `changelog.md` - Lịch sử phiên bản
- `course-outline.md` - Cấu trúc khóa học
- `docs/chapter-02-ai-development/agents.md` - Hướng dẫn agents AI
- `examples/README.md` - Tài liệu ví dụ
- `workshop/README.md` - Trang chính workshop
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
- Added new: `docs/chapter-05-multi-agent/`

#### Di chuyển tệp
| File | From | To |
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
- **📚 Tệp README chương**: Tạo README.md trong mỗi thư mục chương với:
  - Mục tiêu học tập và thời lượng
  - Bảng bài học kèm mô tả
  - Các lệnh bắt đầu nhanh
  - Điều hướng đến các chương khác

#### Đã thay đổi
- **🔗 Cập nhật tất cả liên kết nội bộ**: Hơn 78 đường dẫn đã được cập nhật trên tất cả các tệp tài liệu
- **🗺️ README.md chính**: Cập nhật Sơ đồ Khóa học với cấu trúc chương mới
- **📝 examples/README.md**: Cập nhật tham chiếu chéo tới các thư mục chương

#### Đã xóa
- Cấu trúc thư mục cũ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Tái cấu trúc kho: Điều hướng theo chương
**Phiên bản này thêm các tệp README điều hướng chương (được thay thế bởi v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Hướng dẫn AI Agents mới
**Phiên bản này thêm một hướng dẫn toàn diện để triển khai AI agents với Azure Developer CLI.**

#### Đã thêm
- **🤖 docs/microsoft-foundry/agents.md**: Hướng dẫn hoàn chỉnh bao gồm:
  - AI agents là gì và khác với chatbots như thế nào
  - Ba mẫu khởi động nhanh cho agents (Foundry Agents, Prompty, RAG)
  - Các mẫu kiến trúc agent (single agent, RAG, multi-agent)
  - Cấu hình và tùy chỉnh công cụ
  - Giám sát và theo dõi chỉ số
  - Cân nhắc về chi phí và tối ưu hóa
  - Các kịch bản khắc phục sự cố thường gặp
  - Ba bài tập thực hành với tiêu chí thành công

#### Cấu trúc nội dung
- **Giới thiệu**: Khái niệm về agents cho người mới bắt đầu
- **Bắt đầu nhanh**: Triển khai agents với `azd init --template get-started-with-ai-agents`
- **Mẫu Kiến trúc**: Sơ đồ trực quan của các mẫu agent
- **Cấu hình**: Thiết lập công cụ và biến môi trường
- **Giám sát**: Tích hợp Application Insights
- **Bài tập**: Học thực hành theo trình tự (mỗi bài 20-45 phút)

---

### [v3.12.0] - 2026-02-05

#### Cập nhật môi trường DevContainer
**Phiên bản này cập nhật cấu hình container phát triển với các công cụ hiện đại và mặc định tốt hơn cho trải nghiệm học AZD.**

#### Đã thay đổi
- **🐳 Ảnh cơ sở**: Cập nhật từ `python:3.12-bullseye` sang `python:3.12-bookworm` (Debian stable mới nhất)
- **📛 Tên container**: Đổi từ "Python 3" sang "AZD for Beginners" để rõ ràng hơn

#### Đã thêm
- **🔧 Tính năng Dev Container mới**:
  - `azure-cli` với hỗ trợ Bicep được bật
  - `node:20` (phiên bản LTS cho các mẫu AZD)
  - `github-cli` cho quản lý mẫu
  - `docker-in-docker` cho triển khai ứng dụng container

- **🔌 Chuyển tiếp cổng**: Cấu hình sẵn các cổng cho phát triển thông dụng:
  - 8000 (Xem trước MkDocs)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Tiện ích mở rộng VS Code mới**:
  - `ms-python.vscode-pylance` - Cải thiện IntelliSense cho Python
  - `ms-azuretools.vscode-azurefunctions` - Hỗ trợ Azure Functions
  - `ms-azuretools.vscode-docker` - Hỗ trợ Docker
  - `ms-azuretools.vscode-bicep` - Hỗ trợ ngôn ngữ Bicep
  - `ms-azure-devtools.azure-resource-groups` - Quản lý tài nguyên Azure
  - `yzhang.markdown-all-in-one` - Chỉnh sửa Markdown
  - `DavidAnson.vscode-markdownlint` - Kiểm tra lint Markdown
  - `bierner.markdown-mermaid` - Hỗ trợ sơ đồ Mermaid
  - `redhat.vscode-yaml` - Hỗ trợ YAML (cho azure.yaml)
  - `eamodio.gitlens` - Hiển thị trực quan Git
  - `mhutchie.git-graph` - Lịch sử Git

- **⚙️ Cài đặt VS Code**: Thêm cài đặt mặc định cho trình thông dịch Python, định dạng khi lưu, và loại bỏ khoảng trắng thừa

- **📦 Cập nhật requirements-dev.txt**:
  - Thêm plugin minify cho MkDocs
  - Thêm pre-commit cho chất lượng mã
  - Thêm các gói Azure SDK (azure-identity, azure-mgmt-resource)

#### Đã sửa
- **Lệnh Post-Create**: Bây giờ kiểm tra cài đặt AZD và Azure CLI khi container khởi động

---

### [v3.11.0] - 2026-02-05

#### Cải tiến README thân thiện với người mới
**Phiên bản này cải thiện đáng kể README.md để dễ tiếp cận hơn cho người mới và thêm các tài nguyên thiết yếu cho nhà phát triển AI.**

#### Đã thêm
- **🆚 So sánh Azure CLI vs AZD**: Giải thích rõ khi nào nên dùng từng công cụ kèm ví dụ thực tế
- **🌟 Liên kết Awesome AZD**: Liên kết trực tiếp tới thư viện mẫu cộng đồng và tài nguyên đóng góp:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ mẫu sẵn sàng triển khai
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Đóng góp mẫu từ cộng đồng
- **🎯 Hướng dẫn Bắt đầu Nhanh**: Mục bắt đầu đơn giản hóa 3 bước (Cài đặt → Đăng nhập → Triển khai)
- **📊 Bảng điều hướng theo kinh nghiệm**: Hướng dẫn rõ ràng nơi nên bắt đầu dựa trên kinh nghiệm của nhà phát triển

#### Đã thay đổi
- **Cấu trúc README**: Sắp xếp lại để hiển thị dần dần thông tin - thông tin chính trước
- **Phần Giới thiệu**: Viết lại để giải thích "Phép màu của `azd up`" cho người hoàn toàn mới
- **Xóa nội dung trùng lặp**: Loại bỏ phần khắc phục sự cố trùng lặp
- **Lệnh khắc phục sự cố**: Sửa tham chiếu `azd logs` để sử dụng `azd monitor --logs` hợp lệ

#### Đã sửa
- **🔐 Lệnh xác thực**: Thêm `azd auth login` và `azd auth logout` vào cheat-sheet.md
- **Tham chiếu lệnh không hợp lệ**: Loại bỏ các tham chiếu `azd logs` còn sót lại khỏi phần khắc phục sự cố trong README

#### Ghi chú
- **Phạm vi**: Các thay đổi áp dụng cho README.md chính và resources/cheat-sheet.md
- **Đối tượng mục tiêu**: Cải tiến nhằm vào nhà phát triển mới với AZD

---

### [v3.10.0] - 2026-02-05

#### Cập nhật độ chính xác lệnh Azure Developer CLI
**Phiên bản này sửa các lệnh AZD không tồn tại trong toàn bộ tài liệu, đảm bảo tất cả ví dụ mã sử dụng cú pháp Azure Developer CLI hợp lệ.**

#### Đã sửa
- **🔧 Loại bỏ các lệnh AZD không tồn tại**: Kiểm tra và sửa toàn diện các lệnh không hợp lệ:
  - `azd logs` (không tồn tại) → được thay bằng `azd monitor --logs` hoặc các lựa chọn Azure CLI
  - `azd service` subcommands (không tồn tại) → được thay bằng `azd show` và Azure CLI
  - `azd infra import/export/validate` (không tồn tại) → bị loại bỏ hoặc thay bằng các phương án hợp lệ
  - Các cờ `azd deploy --rollback/--incremental/--parallel/--detect-changes` (không tồn tại) → bị loại bỏ
  - Các cờ `azd provision --what-if/--rollback` (không tồn tại) → được cập nhật để sử dụng `--preview`
  - `azd config validate` (không tồn tại) → được thay bằng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (không tồn tại) → bị loại bỏ

- **📚 Các tệp đã cập nhật với sửa lệnh**:
  - `resources/cheat-sheet.md`: Đại tu tham chiếu lệnh
  - `docs/deployment/deployment-guide.md`: Sửa các chiến lược rollback và triển khai
  - `docs/troubleshooting/debugging.md`: Sửa phần phân tích nhật ký
  - `docs/troubleshooting/common-issues.md`: Cập nhật lệnh khắc phục sự cố
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa phần gỡ lỗi AZD
  - `docs/getting-started/azd-basics.md`: Sửa lệnh giám sát
  - `docs/getting-started/first-project.md`: Cập nhật ví dụ giám sát và gỡ lỗi
  - `docs/getting-started/installation.md`: Sửa ví dụ trợ giúp và phiên bản
  - `docs/pre-deployment/application-insights.md`: Sửa lệnh xem nhật ký
  - `docs/pre-deployment/coordination-patterns.md`: Sửa lệnh gỡ lỗi agent

- **📝 Cập nhật tham chiếu phiên bản**: 
  - `docs/getting-started/installation.md`: Thay phiên bản cố định `1.5.0` bằng `1.x.x` với liên kết tới trang phát hành

#### Đã thay đổi
- **Chiến lược Rollback**: Cập nhật tài liệu để sử dụng rollback dựa trên Git (AZD không có rollback gốc)
- **Xem nhật ký**: Thay các tham chiếu `azd logs` bằng `azd monitor --logs`, `azd monitor --live`, và các lệnh Azure CLI
- **Phần hiệu suất**: Loại bỏ các cờ triển khai song song/tăng dần không tồn tại, cung cấp các lựa chọn hợp lệ

#### Chi tiết kỹ thuật
- **Các lệnh AZD hợp lệ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Các flag azd monitor hợp lệ**: `--live`, `--logs`, `--overview`
- **Tính năng đã bị loại bỏ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Ghi chú
- **Xác thực**: Các lệnh đã được xác thực với Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Hoàn thành Workshop và Cập nhật Chất lượng Tài liệu
**Phiên bản này hoàn tất các mô-đun workshop tương tác, sửa tất cả các liên kết tài liệu bị hỏng và cải thiện chất lượng nội dung tổng thể cho các nhà phát triển AI sử dụng Microsoft AZD.**

#### Đã thêm
- **📝 CONTRIBUTING.md**: Tài liệu hướng dẫn đóng góp mới bao gồm:
  - Hướng dẫn rõ ràng để báo cáo sự cố và đề xuất thay đổi
  - Tiêu chuẩn tài liệu cho nội dung mới
  - Hướng dẫn ví dụ mã và quy ước thông điệp commit
  - Thông tin tương tác cộng đồng

#### Hoàn thành
- **🎯 Mô-đun Workshop 7 (Kết thúc)**: Hoàn tất mô-đun tổng kết với:
  - Tóm tắt toàn diện các thành tựu của workshop
  - Phần các khái niệm chính đã làm chủ bao gồm AZD, các mẫu, và AI Foundry
  - Khuyến nghị tiếp tục hành trình học tập
  - Bài tập thử thách workshop với mức độ khó
  - Liên kết phản hồi và hỗ trợ cộng đồng

- **📚 Mô-đun Workshop 3 (Phân tích)**: Cập nhật mục tiêu học tập với:
  - Hướng dẫn kích hoạt GitHub Copilot với máy chủ MCP
  - Hiểu cấu trúc thư mục mẫu AZD
  - Mô hình tổ chức hạ tầng như mã (Bicep)
  - Hướng dẫn phòng lab thực hành

- **🔧 Mô-đun Workshop 6 (Dọn dẹp)**: Hoàn thành với:
  - Mục tiêu dọn tài nguyên và quản lý chi phí
  - Sử dụng `azd down` để gỡ bỏ hạ tầng một cách an toàn
  - Hướng dẫn khôi phục dịch vụ cognitive bị xóa mềm
  - Gợi ý khám phá bổ sung cho GitHub Copilot và Azure Portal

#### Sửa lỗi
- **🔗 Sửa liên kết bị hỏng**: Đã khắc phục hơn 15 liên kết nội bộ bị hỏng trong tài liệu:
  - `docs/ai-foundry/ai-model-deployment.md`: Sửa đường dẫn tới microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa đường dẫn ai-model-deployment.md và production-ai-practices.md
  - `docs/getting-started/first-project.md`: Thay cicd-integration.md không tồn tại bằng deployment-guide.md
  - `examples/retail-scenario.md`: Sửa các đường dẫn FAQ và hướng dẫn khắc phục sự cố
  - `examples/container-app/microservices/README.md`: Sửa đường dẫn trang khoá học và hướng dẫn triển khai
  - `resources/faq.md` và `resources/glossary.md`: Cập nhật tham chiếu chương AI
  - `course-outline.md`: Sửa hướng dẫn giảng viên và tham chiếu lab workshop AI

- **📅 Thanh trạng thái Workshop**: Cập nhật từ "Under Construction" sang trạng thái workshop hoạt động với ngày tháng February 2026

- **🔗 Điều hướng Workshop**: Sửa các liên kết điều hướng bị hỏng trong README.md của workshop trỏ tới thư mục lab-1-azd-basics không tồn tại

#### Đã thay đổi
- **Trình bày Workshop**: Loại bỏ cảnh báo "under construction", workshop hiện đã hoàn chỉnh và sẵn sàng sử dụng
- **Tính nhất quán điều hướng**: Đảm bảo tất cả mô-đun workshop có điều hướng giữa các mô-đun đúng
- **Tham chiếu lộ trình học**: Cập nhật tham chiếu chương để sử dụng đúng đường dẫn microsoft-foundry

#### Đã xác thực
- ✅ Tất cả các tệp markdown tiếng Anh có liên kết nội bộ hợp lệ
- ✅ Các mô-đun workshop 0-7 đã hoàn thành với mục tiêu học tập
- ✅ Điều hướng giữa các chương và mô-đun hoạt động đúng
- ✅ Nội dung phù hợp cho các nhà phát triển AI sử dụng Microsoft AZD
- ✅ Ngôn ngữ và cấu trúc thân thiện với người mới bắt đầu được duy trì xuyên suốt
- ✅ CONTRIBUTING.md cung cấp hướng dẫn rõ ràng cho cộng đồng đóng góp

#### Triển khai kỹ thuật
- **Xác thực liên kết**: Script PowerShell tự động đã xác minh tất cả các liên kết .md nội bộ
- **Kiểm toán nội dung**: Đánh giá thủ công tính hoàn chỉnh của workshop và mức độ phù hợp cho người mới
- **Hệ thống điều hướng**: Áp dụng các mẫu điều hướng chương và mô-đun nhất quán

#### Ghi chú
- **Phạm vi**: Các thay đổi áp dụng cho tài liệu tiếng Anh
- **Bản dịch**: Các thư mục dịch thuật không được cập nhật trong phiên bản này (bản dịch tự động sẽ đồng bộ sau)
- **Thời lượng Workshop**: Workshop hoàn chỉnh hiện cung cấp 3-4 giờ học thực hành

---

### [v3.8.0] - 2025-11-19

#### Tài liệu Nâng cao: Giám sát, Bảo mật và Mô hình Đa Tác nhân
**Phiên bản này bổ sung các bài học chất lượng A toàn diện về tích hợp Application Insights, các mẫu xác thực, và phối hợp đa tác nhân cho các triển khai sản xuất.**

#### Đã thêm
- **📊 Bài học Tích hợp Application Insights**: trong `docs/pre-deployment/application-insights.md`:
  - Triển khai tập trung vào AZD với provisioning tự động
  - Các template Bicep hoàn chỉnh cho Application Insights + Log Analytics
  - Ứng dụng Python hoạt động với telemety tùy chỉnh (hơn 1.200 dòng)
  - Mô hình giám sát AI/LLM (theo dõi token/chi phí Azure OpenAI)
  - 6 sơ đồ Mermaid (kiến trúc, truy vết phân tán, luồng telemety)
  - 3 bài tập thực hành (cảnh báo, dashboard, giám sát AI)
  - Ví dụ truy vấn Kusto và chiến lược tối ưu chi phí
  - Streaming số liệu trực tiếp và gỡ lỗi thời gian thực
  - Thời gian học 40-50 phút với các mẫu sẵn sàng cho sản xuất

- **🔐 Bài học Mẫu Xác thực & Bảo mật**: trong `docs/getting-started/authsecurity.md`:
  - 3 mẫu xác thực (connection strings, Key Vault, managed identity)
  - Các template hạ tầng Bicep hoàn chỉnh cho triển khai an toàn
  - Mã ứng dụng Node.js tích hợp Azure SDK
  - 3 bài tập hoàn chỉnh (kích hoạt managed identity, user-assigned identity, xoay Key Vault)
  - Thực hành tốt nhất về bảo mật và cấu hình RBAC
  - Hướng dẫn khắc phục sự cố và phân tích chi phí
  - Mẫu xác thực không mật khẩu sẵn sàng cho sản xuất

- **🤖 Bài học Mô hình Phối hợp Đa Tác nhân**: trong `docs/pre-deployment/coordination-patterns.md`:
  - 5 mẫu phối hợp (tuần tự, song song, phân cấp, điều khiển theo sự kiện, đồng thuận)
  - Triển khai dịch vụ điều phối hoàn chỉnh (Python/Flask, hơn 1.500 dòng)
  - 3 triển khai tác nhân chuyên biệt (Research, Writer, Editor)
  - Tích hợp Service Bus cho hàng đợi tin nhắn
  - Quản lý trạng thái bằng Cosmos DB cho hệ phân tán
  - 6 sơ đồ Mermaid thể hiện tương tác giữa các tác nhân
  - 3 bài tập nâng cao (xử lý timeout, logic retry, circuit breaker)
  - Phân tích chi phí ($240-565/month) cùng chiến lược tối ưu
  - Tích hợp Application Insights cho giám sát

#### Nâng cấp
- **Chương Pre-deployment**: Bây giờ bao gồm các mẫu giám sát và phối hợp toàn diện
- **Chương Getting Started**: Được tăng cường với các mẫu xác thực chuyên nghiệp
- **Sẵn sàng cho sản xuất**: Bao phủ toàn diện từ bảo mật đến khả năng quan sát
- **Đề cương Khóa học**: Cập nhật để tham chiếu các bài học mới ở Chương 3 và 6

#### Đã thay đổi
- **Tiến trình học tập**: Tích hợp tốt hơn giữa bảo mật và giám sát xuyên suốt khóa học
- **Chất lượng tài liệu**: Tiêu chuẩn A-grade nhất quán (95-97%) trên các bài học mới
- **Mẫu cho môi trường sản xuất**: Bao phủ end-to-end cho triển khai doanh nghiệp

#### Cải thiện
- **Trải nghiệm nhà phát triển**: Lộ trình rõ ràng từ phát triển đến giám sát sản xuất
- **Tiêu chuẩn bảo mật**: Mẫu chuyên nghiệp cho xác thực và quản lý bí mật
- **Khả năng quan sát**: Tích hợp Application Insights hoàn chỉnh với AZD
- **Tải công việc AI**: Giám sát chuyên biệt cho Azure OpenAI và hệ thống đa tác nhân

#### Đã xác thực
- ✅ Tất cả bài học bao gồm mã hoạt động hoàn chỉnh (không phải đoạn mã)
- ✅ Sơ đồ Mermaid cho học trực quan (19 tổng across 3 bài học)
- ✅ Bài tập thực hành với bước xác minh (9 tổng)
- ✅ Template Bicep sẵn sàng cho sản xuất có thể triển khai qua `azd up`
- ✅ Phân tích chi phí và chiến lược tối ưu
- ✅ Hướng dẫn khắc phục sự cố và thực hành tốt nhất
- ✅ Các điểm kiểm tra kiến thức với lệnh xác minh

#### Kết quả Đánh giá Tài liệu
- **docs/pre-deployment/application-insights.md**: - Hướng dẫn giám sát toàn diện
- **docs/getting-started/authsecurity.md**: - Mẫu bảo mật chuyên nghiệp
- **docs/pre-deployment/coordination-patterns.md**: - Kiến trúc đa tác nhân nâng cao
- **Nội dung Mới Tổng thể**: - Tiêu chuẩn chất lượng cao nhất quán

#### Triển khai kỹ thuật
- **Application Insights**: Log Analytics + telemety tùy chỉnh + truy vết phân tán
- **Xác thực**: Managed Identity + Key Vault + mẫu RBAC
- **Đa Tác nhân**: Service Bus + Cosmos DB + Container Apps + điều phối
- **Giám sát**: Số liệu trực tiếp + truy vấn Kusto + cảnh báo + dashboard
- **Quản lý chi phí**: Chiến lược sampling, chính sách lưu trữ, kiểm soát ngân sách

### [v3.7.0] - 2025-11-19

#### Cải thiện Chất lượng Tài liệu và Ví dụ Azure OpenAI Mới
**Phiên bản này nâng cao chất lượng tài liệu trong toàn bộ kho và thêm ví dụ triển khai Azure OpenAI hoàn chỉnh với giao diện chat GPT-4.**

#### Đã thêm
- **🤖 Ví dụ Chat Azure OpenAI**: Triển khai GPT-4 hoàn chỉnh với hiện thực hoạt động trong `examples/azure-openai-chat/`:
  - Hạ tầng Azure OpenAI hoàn chỉnh (triển khai mô hình GPT-4)
  - Giao diện chat dòng lệnh Python với lịch sử hội thoại
  - Tích hợp Key Vault để lưu trữ khoá API an toàn
  - Theo dõi sử dụng token và ước tính chi phí
  - Giới hạn tốc độ và xử lý lỗi
  - README toàn diện với hướng dẫn triển khai 35-45 phút
  - 11 tệp sẵn sàng cho sản xuất (template Bicep, app Python, cấu hình)
- **📚 Bài tập Tài liệu**: Thêm bài tập thực hành vào hướng dẫn cấu hình:
  - Bài tập 1: Cấu hình đa môi trường (15 phút)
  - Bài tập 2: Thực hành quản lý bí mật (10 phút)
  - Tiêu chí thành công rõ ràng và bước xác minh
- **✅ Xác minh Triển khai**: Thêm phần xác minh vào hướng dẫn triển khai:
  - Thủ tục kiểm tra sức khoẻ
  - Bảng kiểm tiêu chí thành công
  - Kết quả mong đợi cho tất cả lệnh triển khai
  - Tham chiếu khắc phục sự cố nhanh

#### Nâng cao
- **examples/README.md**: Cập nhật đạt chất lượng A-grade (93%):
  - Thêm azure-openai-chat vào tất cả các phần liên quan
  - Cập nhật số lượng ví dụ cục bộ từ 3 lên 4
  - Thêm vào bảng Ví dụ Ứng dụng AI
  - Tích hợp vào Quick Start cho Người dùng Trung cấp
  - Thêm vào phần Mẫu Microsoft Foundry
  - Cập nhật Ma trận So sánh và phần tìm công nghệ
- **Chất lượng Tài liệu**: Cải thiện B+ (87%) → A- (92%) trong thư mục docs:
  - Thêm kết quả mong đợi cho các ví dụ lệnh quan trọng
  - Bao gồm bước xác minh cho thay đổi cấu hình
  - Tăng cường học thực hành với bài tập mang tính ứng dụng

#### Đã thay đổi
- **Tiến trình học**: Tích hợp ví dụ AI tốt hơn cho người học trung cấp
- **Cấu trúc Tài liệu**: Nhiều bài tập thực hành hơn với kết quả rõ ràng
- **Quy trình Xác minh**: Thêm tiêu chí thành công rõ ràng vào các luồng công việc chính

#### Cải thiện
- **Trải nghiệm nhà phát triển**: Triển khai Azure OpenAI giờ mất 35-45 phút (so với 60-90 cho các lựa chọn phức tạp)
- **Minh bạch chi phí**: Ước tính chi phí rõ ràng ($50-200/month) cho ví dụ Azure OpenAI
- **Lộ trình học**: Nhà phát triển AI có điểm vào rõ ràng với azure-openai-chat
- **Tiêu chuẩn Tài liệu**: Kết quả mong đợi và bước xác minh nhất quán

#### Đã xác thực
- ✅ Ví dụ Azure OpenAI hoạt động đầy đủ với `azd up`
- ✅ Tất cả 11 tệp triển khai đúng cú pháp
- ✅ Hướng dẫn README khớp với trải nghiệm triển khai thực tế
- ✅ Các liên kết tài liệu được cập nhật ở hơn 8 vị trí
- ✅ Mục lục ví dụ phản ánh chính xác 4 ví dụ cục bộ
- ✅ Không có liên kết ngoài trùng lặp trong bảng
- ✅ Tất cả tham chiếu điều hướng chính xác

#### Triển khai kỹ thuật
- **Kiến trúc Azure OpenAI**: GPT-4 + Key Vault + mẫu Container Apps
- **Bảo mật**: Sẵn sàng Managed Identity, bí mật trong Key Vault
- **Giám sát**: Tích hợp Application Insights
- **Quản lý chi phí**: Theo dõi token và tối ưu sử dụng
- **Triển khai**: Một lệnh `azd up` cho thiết lập hoàn chỉnh

### [v3.6.0] - 2025-11-19

#### Cập nhật lớn: Ví dụ Triển khai Container App
**Phiên bản này giới thiệu các ví dụ triển khai ứng dụng container toàn diện, sẵn sàng cho sản xuất, sử dụng Azure Developer CLI (AZD), với tài liệu đầy đủ và tích hợp vào lộ trình học.**

#### Đã thêm
- **🚀 Ví dụ Container App**: Ví dụ cục bộ mới trong `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Tổng quan hoàn chỉnh về triển khai container hoá, quick start, sản xuất và các mẫu nâng cao
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API thân thiện cho người mới với scale-to-zero, health probes, giám sát và khắc phục sự cố
  - [Microservices Architecture](../../examples/container-app/microservices): Triển khai đa dịch vụ sẵn sàng cho sản xuất (API Gateway, Product, Order, User, Notification), messaging bất đồng bộ, Service Bus, Cosmos DB, Azure SQL, truy vết phân tán, triển khai blue-green/canary
- **Thực hành tốt nhất**: Bảo mật, giám sát, tối ưu chi phí, và hướng dẫn CI/CD cho khối lượng công việc container
- **Ví dụ mã**: `azure.yaml`, template Bicep hoàn chỉnh, và các triển khai dịch vụ đa ngôn ngữ (Python, Node.js, C#, Go)
- **Kiểm thử & Khắc phục sự cố**: Kịch bản kiểm thử end-to-end, lệnh giám sát, hướng dẫn khắc phục sự cố

#### Đã thay đổi
- **README.md**: Cập nhật để giới thiệu và liên kết các ví dụ container app mới trong "Local Examples - Container Applications"
- **examples/README.md**: Cập nhật để làm nổi bật các ví dụ container app, thêm mục ma trận so sánh, và cập nhật tham chiếu công nghệ/kiến trúc
- **Phác thảo Khóa học & Hướng dẫn Học tập**: Đã cập nhật để tham chiếu các ví dụ ứng dụng container mới và các mẫu triển khai trong các chương liên quan

#### Đã xác thực
- ✅ Tất cả ví dụ mới có thể triển khai bằng `azd up` và tuân theo các thực hành tốt nhất
- ✅ Đã cập nhật liên kết chéo tài liệu và điều hướng
- ✅ Các ví dụ bao phủ từ kịch bản cho người mới đến nâng cao, bao gồm cả microservices trong môi trường sản xuất

#### Ghi chú
- **Phạm vi**: Chỉ tài liệu và ví dụ bằng tiếng Anh
- **Bước Tiếp Theo**: Mở rộng với các mẫu container nâng cao bổ sung và tự động hóa CI/CD trong các bản phát hành tương lai

### [v3.5.0] - 2025-11-19

#### Tái thương hiệu Sản phẩm: Microsoft Foundry
**Phiên bản này thực hiện thay đổi tên sản phẩm toàn diện từ "Microsoft Foundry" sang "Microsoft Foundry" trên tất cả tài liệu tiếng Anh, phản ánh việc tái thương hiệu chính thức của Microsoft.**

#### Đã thay đổi
- **🔄 Cập nhật Tên Sản phẩm**: Tái thương hiệu hoàn chỉnh từ "Microsoft Foundry" sang "Microsoft Foundry"
  - Đã cập nhật tất cả các tham chiếu trong tài liệu tiếng Anh trong thư mục `docs/`
  - Đổi tên thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Đổi tên tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tổng cộng: 23 tham chiếu nội dung đã được cập nhật trên 7 tệp tài liệu

- **📁 Thay đổi Cấu trúc Thư mục**:
  - `docs/ai-foundry/` được đổi tên thành `docs/microsoft-foundry/`
  - Tất cả các tham chiếu chéo được cập nhật để phản ánh cấu trúc thư mục mới
  - Các liên kết điều hướng đã được xác thực trên toàn bộ tài liệu

- **📄 Đổi tên Tệp**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tất cả các liên kết nội bộ đã được cập nhật để tham chiếu tới tên tệp mới

#### Các Tệp Đã Cập Nhật
- **Tài liệu Chương** (7 tệp):
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

- **Tệp Cấu trúc Khóa học** (2 tệp):
  - `README.md` - 17 tham chiếu được cập nhật (tổng quan khóa học, tiêu đề chương, phần mẫu, thông tin cộng đồng)
  - `course-outline.md` - 14 tham chiếu được cập nhật (tổng quan, mục tiêu học tập, tài nguyên chương)

#### Đã xác thực
- ✅ Không còn tham chiếu đường dẫn thư mục "ai-foundry" trong tài liệu tiếng Anh
- ✅ Không còn tham chiếu tên sản phẩm "Microsoft Foundry" trong tài liệu tiếng Anh
- ✅ Tất cả liên kết điều hướng hoạt động với cấu trúc thư mục mới
- ✅ Việc đổi tên tệp và thư mục đã hoàn tất thành công
- ✅ Các tham chiếu chéo giữa các chương đã được xác thực

#### Ghi chú
- **Phạm vi**: Thay đổi chỉ áp dụng cho tài liệu tiếng Anh trong thư mục `docs/`
- **Bản dịch**: Thư mục dịch (`translations/`) chưa được cập nhật trong phiên bản này
- **Workshop**: Tài liệu hội thảo (`workshop/`) chưa được cập nhật trong phiên bản này
- **Ví dụ**: Các tệp ví dụ có thể vẫn tham chiếu tên gọi cũ (sẽ được xử lý trong bản cập nhật tương lai)
- **Liên kết Ngoại**: Các URL bên ngoài và tham chiếu kho GitHub giữ nguyên

#### Hướng dẫn Di chuyển cho Người đóng góp
Nếu bạn có các nhánh cục bộ hoặc tài liệu tham chiếu cấu trúc cũ:
1. Cập nhật tham chiếu thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Cập nhật tham chiếu tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Thay thế tên sản phẩm: "Microsoft Foundry" → "Microsoft Foundry"
4. Xác thực rằng tất cả liên kết nội bộ trong tài liệu vẫn hoạt động

---

### [v3.4.0] - 2025-10-24

#### Cải tiến Xem trước Hạ tầng và Xác thực
**Phiên bản này giới thiệu hỗ trợ toàn diện cho tính năng xem trước mới của Azure Developer CLI và nâng cao trải nghiệm người dùng của workshop.**

#### Đã thêm
- **🧪 Tài liệu tính năng azd provision --preview**: Bao quát toàn diện khả năng xem trước hạ tầng mới
  - Tham chiếu lệnh và ví dụ sử dụng trong cheat sheet
  - Tích hợp chi tiết trong hướng dẫn provision với các trường hợp sử dụng và lợi ích
  - Tích hợp kiểm tra tiền triển khai để xác thực triển khai an toàn hơn
  - Cập nhật hướng dẫn bắt đầu với các thực hành triển khai ưu tiên an toàn
- **🚧 Biểu ngữ Trạng thái Workshop**: Biểu ngữ HTML chuyên nghiệp chỉ ra trạng thái phát triển workshop
  - Thiết kế gradient với chỉ báo đang xây dựng để truyền đạt rõ ràng cho người dùng
  - Dấu thời gian cập nhật lần cuối để minh bạch
  - Thiết kế phản hồi cho thiết bị di động cho tất cả các loại thiết bị

#### Được cải tiến
- **An toàn Hạ tầng**: Chức năng xem trước được tích hợp xuyên suốt tài liệu triển khai
- **Xác thực Trước Triển khai**: Các script tự động hiện bao gồm kiểm tra xem trước hạ tầng
- **Luồng Công việc Nhà phát triển**: Cập nhật chuỗi lệnh để bao gồm xem trước như thực hành tốt nhất
- **Trải nghiệm Workshop**: Thiết lập kỳ vọng rõ ràng cho người dùng về trạng thái phát triển nội dung

#### Đã thay đổi
- **Thực hành Tốt nhất Triển khai**: Luồng công việc ưu tiên xem trước hiện là phương pháp đề xuất
- **Luồng Tài liệu**: Xác thực hạ tầng được đưa lên sớm hơn trong quá trình học
- **Trình bày Workshop**: Thông báo trạng thái chuyên nghiệp với lịch trình phát triển rõ ràng

#### Cải thiện
- **Phương pháp Ưu tiên An toàn**: Các thay đổi hạ tầng giờ có thể xác thực trước khi triển khai
- **Hợp tác Nhóm**: Kết quả xem trước có thể chia sẻ để xem xét và phê duyệt
- **Nhận thức Chi phí**: Hiểu rõ hơn về chi phí tài nguyên trước khi provision
- **Giảm Thiểu Rủi ro**: Giảm thất bại triển khai thông qua xác thực trước

#### Triển khai Kỹ thuật
- **Tích hợp Đa-tài liệu**: Tính năng xem trước được ghi chép trên 4 tệp chính
- **Mẫu Lệnh**: Cú pháp và ví dụ nhất quán xuyên suốt tài liệu
- **Tích hợp Thực hành Tốt nhất**: Xem trước được đưa vào quy trình xác thực và script
- **Chỉ báo Trực quan**: Đánh dấu tính năng MỚI rõ ràng để dễ tìm

#### Hạ tầng Workshop
- **Truyền đạt Trạng thái**: Biểu ngữ HTML chuyên nghiệp với kiểu gradient
- **Trải nghiệm Người dùng**: Trạng thái phát triển rõ ràng giúp tránh nhầm lẫn
- **Trình bày Chuyên nghiệp**: Duy trì độ tin cậy kho mã trong khi đặt kỳ vọng
- **Minh bạch Lịch trình**: Dấu thời gian cập nhật lần cuối vào tháng 10 năm 2025 cho trách nhiệm giải trình

### [v3.3.0] - 2025-09-24

#### Tài liệu Workshop nâng cao và Trải nghiệm Học tương tác
**Phiên bản này giới thiệu tài liệu workshop toàn diện với hướng dẫn tương tác trên trình duyệt và lộ trình học có cấu trúc.**

#### Đã thêm
- **🎥 Hướng dẫn Workshop Tương tác**: Trải nghiệm workshop trên nền tảng trình duyệt với khả năng xem trước MkDocs
- **📝 Hướng dẫn Workshop có cấu trúc**: Lộ trình học có hướng dẫn 7 bước từ khám phá đến tùy chỉnh
  - 0-Introduction: Tổng quan workshop và thiết lập
  - 1-Select-AI-Template: Quá trình khám phá và chọn mẫu
  - 2-Validate-AI-Template: Quy trình triển khai và xác thực
  - 3-Deconstruct-AI-Template: Hiểu kiến trúc mẫu
  - 4-Configure-AI-Template: Cấu hình và tùy chỉnh
  - 5-Customize-AI-Template: Sửa đổi nâng cao và lặp lại
  - 6-Teardown-Infrastructure: Dọn dẹp và quản lý tài nguyên
  - 7-Wrap-up: Tóm tắt và bước tiếp theo
- **🛠️ Công cụ Workshop**: Cấu hình MkDocs với theme Material để nâng cao trải nghiệm học tập
- **🎯 Lộ trình Học Thực hành**: Phương pháp 3 bước (Khám phá → Triển khai → Tùy chỉnh)
- **📱 Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển liền mạch

#### Được cải tiến
- **Phòng thí nghiệm Workshop AI**: Mở rộng với trải nghiệm học có cấu trúc kéo dài 2-3 giờ
- **Tài liệu Workshop**: Trình bày chuyên nghiệp với điều hướng và trợ giúp thị giác
- **Tiến trình Học**: Hướng dẫn từng bước rõ ràng từ chọn mẫu đến triển khai sản xuất
- **Trải nghiệm Nhà phát triển**: Tích hợp công cụ cho luồng công việc phát triển hiệu quả

#### Cải thiện
- **Khả năng Truy cập**: Giao diện trên trình duyệt với chức năng tìm kiếm, sao chép và chuyển chủ đề
- **Học Tự tốc độ**: Cấu trúc workshop linh hoạt phù hợp với nhiều tốc độ học khác nhau
- **Ứng dụng Thực tế**: Kịch bản triển khai mẫu AI thực tế
- **Tích hợp Cộng đồng**: Tích hợp Discord cho hỗ trợ và hợp tác workshop

#### Tính năng Workshop
- **Tìm kiếm tích hợp**: Tìm nhanh từ khóa và bài học
- **Sao chép Khối mã**: Chức năng hover-to-copy cho tất cả ví dụ mã
- **Chuyển chủ đề**: Hỗ trợ chế độ tối/sáng cho sở thích khác nhau
- **Tài sản Trực quan**: Ảnh chụp màn hình và sơ đồ hỗ trợ hiểu biết
- **Tích hợp Trợ giúp**: Truy cập trực tiếp Discord cho hỗ trợ cộng đồng

### [v3.2.0] - 2025-09-17

#### Tái cấu trúc Điều hướng chính và Hệ thống Học theo Chương
**Phiên bản này giới thiệu cấu trúc học theo chương toàn diện với điều hướng được cải thiện trên toàn bộ kho mã.**

#### Đã thêm
- **📚 Hệ thống Học theo Chương**: Tái cấu trúc toàn bộ khóa học thành 8 chương học tiến bộ
  - Chapter 1: Nền tảng & Bắt đầu Nhanh (⭐ - 30-45 mins)
  - Chapter 2: Phát triển Ưu tiên AI (⭐⭐ - 1-2 hours)
  - Chapter 3: Cấu hình & Xác thực (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Triển khai (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Giải pháp AI Đa Tác nhân (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Xác thực & Lập kế hoạch Trước Triển khai (⭐⭐ - 1 hour)
  - Chapter 7: Xử lý sự cố & Gỡ lỗi (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Mẫu Sản xuất & Doanh nghiệp (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Hệ thống Điều hướng Toàn diện**: Tiêu đề điều hướng và chân trang nhất quán trên toàn bộ tài liệu
- **🎯 Theo dõi Tiến trình**: Danh sách kiểm tra hoàn thành khóa học và hệ thống xác minh học tập
- **🗺️ Hướng dẫn Lộ trình Học**: Điểm vào rõ ràng cho các cấp độ kinh nghiệm và mục tiêu khác nhau
- **🔗 Điều hướng Tham chiếu chéo**: Các chương liên quan và điều kiện tiên quyết được liên kết rõ ràng

#### Được cải tiến
- **Cấu trúc README**: Biến đổi thành nền tảng học có cấu trúc với tổ chức theo chương
- **Điều hướng Tài liệu**: Mỗi trang giờ bao gồm ngữ cảnh chương và hướng dẫn tiến trình
- **Tổ chức Mẫu**: Ví dụ và mẫu được gán vào các chương học phù hợp
- **Tích hợp Tài nguyên**: Cheat sheets, FAQ và hướng dẫn học liên kết tới chương liên quan
- **Tích hợp Workshop**: Các lab thực hành được gán cho nhiều mục tiêu học của chương

#### Đã thay đổi
- **Tiến trình Học**: Chuyển từ tài liệu tuyến tính sang học linh hoạt theo chương
- **Vị trí Cấu hình**: Dời hướng dẫn cấu hình thành Chapter 3 để có luồng học tốt hơn
- **Tích hợp Nội dung AI**: Nội dung đặc thù AI được tích hợp tốt hơn xuyên suốt hành trình học
- **Nội dung Sản xuất**: Các mẫu nâng cao được tập trung ở Chapter 8 cho người học doanh nghiệp

#### Cải thiện
- **Trải nghiệm Người dùng**: Dấu m breadcrumbs điều hướng rõ ràng và chỉ báo tiến trình chương
- **Khả năng Truy cập**: Mẫu điều hướng nhất quán giúp dễ dàng duyệt khóa học
- **Trình bày Chuyên nghiệp**: Cấu trúc kiểu đại học phù hợp cho đào tạo học thuật và doanh nghiệp
- **Hiệu quả Học tập**: Giảm thời gian tìm nội dung liên quan nhờ tổ chức được cải thiện

#### Triển khai Kỹ thuật
- **Tiêu đề Điều hướng**: Chuẩn hóa điều hướng chương trên 40+ tệp tài liệu
- **Chân trang Điều hướng**: Hướng dẫn tiến trình nhất quán và chỉ báo hoàn thành chương
- **Liên kết chéo**: Hệ thống liên kết nội bộ toàn diện kết nối các khái niệm liên quan
- **Bản đồ Chương**: Mẫu và ví dụ được liên kết rõ ràng với các mục tiêu học

#### Nâng cấp Hướng dẫn Học
- **📚 Mục tiêu Học tập Toàn diện**: Tái cấu trúc hướng dẫn học để phù hợp với hệ thống 8 chương
- **🎯 Đánh giá theo Chương**: Mỗi chương bao gồm mục tiêu học cụ thể và bài tập thực hành
- **📋 Theo dõi Tiến trình**: Lịch học hàng tuần với kết quả đo lường và danh sách kiểm tra hoàn thành
- **❓ Câu hỏi Đánh giá**: Câu hỏi xác thực kiến thức cho mỗi chương với kết quả chuyên nghiệp
- **🛠️ Bài tập Thực hành**: Hoạt động thực hành với kịch bản triển khai thực tế và xử lý sự cố
- **📊 Tiến trình Kỹ năng**: Tiến bộ rõ ràng từ khái niệm cơ bản đến mẫu doanh nghiệp với trọng tâm phát triển nghề nghiệp
- **🎓 Khung Chứng chỉ**: Kết quả phát triển chuyên môn và hệ thống công nhận cộng đồng
- **⏱️ Quản lý Thời gian**: Kế hoạch học 10 tuần có cấu trúc với xác thực cột mốc

### [v3.1.0] - 2025-09-17

#### Nâng cao Giải pháp AI Đa Tác nhân
**Phiên bản này cải thiện giải pháp bán lẻ đa tác nhân với đặt tên tác nhân rõ ràng hơn và tài liệu được cải thiện.**

#### Đã thay đổi
- **Thuật ngữ Đa Tác nhân**: Thay "Cora agent" bằng "Customer agent" trong toàn bộ giải pháp bán lẻ đa tác nhân để dễ hiểu hơn
- **Kiến trúc Tác nhân**: Cập nhật toàn bộ tài liệu, mẫu ARM và ví dụ mã để sử dụng tên "Customer agent" nhất quán
- **Ví dụ Cấu hình**: Hiện đại hóa các mẫu cấu hình tác nhân với quy ước đặt tên được cập nhật
- **Độ nhất quán Tài liệu**: Đảm bảo tất cả tham chiếu sử dụng tên tác nhân mô tả và chuyên nghiệp

#### Được cải thiện
- **Gói Mẫu ARM**: Cập nhật retail-multiagent-arm-template với tham chiếu Customer agent
- **Sơ đồ Kiến trúc**: Làm mới sơ đồ Mermaid với tên tác nhân đã cập nhật
- **Ví dụ Mã**: Các lớp Python và ví dụ triển khai hiện sử dụng tên CustomerAgent
- **Biến Môi trường**: Cập nhật tất cả script triển khai để sử dụng quy ước CUSTOMER_AGENT_NAME

#### Cải thiện
- **Trải nghiệm Nhà phát triển**: Vai trò và trách nhiệm của agent rõ ràng hơn trong tài liệu
- **Sẵn sàng cho Sản xuất**: Tăng tính phù hợp với quy ước đặt tên doanh nghiệp
- **Tài liệu Học tập**: Tên agent trực quan hơn cho mục đích giáo dục
- **Khả dụng Mẫu**: Hiểu đơn giản hơn về chức năng agent và các mô hình triển khai

#### Chi tiết kỹ thuật
- Đã cập nhật sơ đồ kiến trúc Mermaid với tham chiếu CustomerAgent
- Đã thay thế tên lớp CoraAgent bằng CustomerAgent trong các ví dụ Python
- Đã chỉnh sửa cấu hình JSON mẫu ARM để sử dụng kiểu agent "customer"
- Đã cập nhật biến môi trường từ CORA_AGENT_* sang mẫu CUSTOMER_AGENT_*
- Đã làm mới tất cả lệnh triển khai và cấu hình container

### [v3.0.0] - 2025-09-12

#### Thay đổi lớn - Tập trung vào nhà phát triển AI và tích hợp Microsoft Foundry
**Phiên bản này biến kho chứa thành một nguồn học tập toàn diện tập trung vào AI với tích hợp Microsoft Foundry.**

#### Đã thêm
- **🤖 AI-First Learning Path**: Tái cấu trúc hoàn toàn ưu tiên cho các nhà phát triển và kỹ sư AI
- **Microsoft Foundry Integration Guide**: Tài liệu toàn diện hướng dẫn kết nối AZD với dịch vụ Microsoft Foundry
- **AI Model Deployment Patterns**: Hướng dẫn chi tiết bao gồm lựa chọn mẫu, cấu hình và chiến lược triển khai sản xuất
- **AI Workshop Lab**: Hội thảo thực hành 2-3 giờ để chuyển đổi ứng dụng AI thành các giải pháp có thể triển khai bằng AZD
- **Production AI Best Practices**: Các mô hình sẵn sàng cho doanh nghiệp để mở rộng, giám sát và bảo mật khối lượng công việc AI
- **AI-Specific Troubleshooting Guide**: Hướng dẫn xử lý sự cố chuyên biệt cho Azure OpenAI, Cognitive Services và các vấn đề triển khai AI
- **AI Template Gallery**: Bộ sưu tập mẫu Microsoft Foundry nổi bật kèm đánh giá độ phức tạp
- **Workshop Materials**: Cấu trúc hội thảo đầy đủ với các phòng lab thực hành và tài liệu tham khảo

#### Đã cải tiến
- **README Structure**: Tập trung cho nhà phát triển AI với dữ liệu 45% mức quan tâm cộng đồng từ Microsoft Foundry Discord
- **Learning Paths**: Hành trình dành cho nhà phát triển AI cùng các lộ trình truyền thống cho học sinh và kỹ sư DevOps
- **Template Recommendations**: Các mẫu AI được giới thiệu bao gồm azure-search-openai-demo, contoso-chat và openai-chat-app-quickstart
- **Community Integration**: Hỗ trợ cộng đồng Discord được cải thiện với các kênh và thảo luận chuyên biệt về AI

#### Bảo mật & Tập trung vào Sản xuất
- **Managed Identity Patterns**: Cấu hình xác thực và bảo mật chuyên biệt cho AI
- **Cost Optimization**: Theo dõi sử dụng token và kiểm soát ngân sách cho khối lượng công việc AI
- **Multi-Region Deployment**: Chiến lược triển khai ứng dụng AI toàn cầu
- **Performance Monitoring**: Các chỉ số chuyên biệt cho AI và tích hợp Application Insights

#### Chất lượng Tài liệu
- **Linear Course Structure**: Trình tự logic từ cơ bản đến nâng cao về các mô hình triển khai AI
- **Validated URLs**: Tất cả các liên kết kho ngoài đã được xác minh và có thể truy cập
- **Complete Reference**: Tất cả liên kết tài liệu nội bộ đã được xác thực và hoạt động
- **Production Ready**: Các mô hình triển khai cho doanh nghiệp kèm ví dụ thực tế

### [v2.0.0] - 2025-09-09

#### Thay đổi lớn - Tái cấu trúc kho chứa và Nâng cao tính chuyên nghiệp
**Phiên bản này là một đại tu đáng kể về cấu trúc kho chứa và cách trình bày nội dung.**

#### Đã thêm
- **Structured Learning Framework**: Tất cả trang tài liệu hiện bao gồm phần Giới thiệu, Mục tiêu học tập và Kết quả học tập
- **Navigation System**: Thêm liên kết Bài trước / Bài sau trên toàn bộ tài liệu để hướng dẫn lộ trình học
- **Study Guide**: study-guide.md toàn diện với mục tiêu học tập, bài tập thực hành và tài liệu đánh giá
- **Professional Presentation**: Đã loại bỏ tất cả biểu tượng emoji để cải thiện khả năng truy cập và ngoại hình chuyên nghiệp
- **Enhanced Content Structure**: Cải thiện tổ chức và luồng nội dung học tập

#### Đã thay đổi
- **Documentation Format**: Chuẩn hóa tất cả tài liệu với cấu trúc nhất quán tập trung vào học tập
- **Navigation Flow**: Triển khai tiến trình logic qua tất cả tài liệu học tập
- **Content Presentation**: Loại bỏ các yếu tố trang trí nhằm ủng hộ định dạng rõ ràng, chuyên nghiệp
- **Link Structure**: Đã cập nhật tất cả liên kết nội bộ để hỗ trợ hệ thống điều hướng mới

#### Đã cải thiện
- **Accessibility**: Đã loại bỏ phụ thuộc emoji để tương thích tốt hơn với trình đọc màn hình
- **Professional Appearance**: Trình bày sạch, phong cách học thuật phù hợp cho học tập doanh nghiệp
- **Learning Experience**: Cách tiếp cận có cấu trúc với mục tiêu và kết quả rõ ràng cho mỗi bài học
- **Content Organization**: Luồng logic và liên kết giữa các chủ đề liên quan tốt hơn

### [v1.0.0] - 2025-09-09

#### Phát hành ban đầu - Kho học AZD toàn diện

#### Đã thêm
- **Cấu trúc Tài liệu Cốt lõi**
  - Loạt hướng dẫn bắt đầu hoàn chỉnh
  - Tài liệu triển khai và cung cấp toàn diện
  - Tài nguyên khắc phục sự cố chi tiết và hướng dẫn gỡ lỗi
  - Công cụ và quy trình xác thực trước khi triển khai

- **Getting Started Module**
  - AZD Basics: Các khái niệm cốt lõi và thuật ngữ
  - Installation Guide: Hướng dẫn thiết lập theo nền tảng
  - Configuration Guide: Thiết lập môi trường và xác thực
  - First Project Tutorial: Học thực hành từng bước

- **Deployment and Provisioning Module**
  - Deployment Guide: Tài liệu quy trình công việc hoàn chỉnh
  - Provisioning Guide: Hạ tầng như mã với Bicep
  - Các thực hành tốt nhất cho triển khai sản xuất
  - Các mô hình kiến trúc đa dịch vụ

- **Pre-deployment Validation Module**
  - Capacity Planning: Xác thực khả năng sẵn có của tài nguyên Azure
  - SKU Selection: Hướng dẫn toàn diện về cấp dịch vụ
  - Pre-flight Checks: Tập lệnh xác thực tự động (PowerShell và Bash)
  - Công cụ ước tính chi phí và lập kế hoạch ngân sách

- **Troubleshooting Module**
  - Common Issues: Các vấn đề thường gặp và giải pháp
  - Debugging Guide: Phương pháp luận khắc phục sự cố có hệ thống
  - Kỹ thuật và công cụ chẩn đoán nâng cao
  - Giám sát hiệu suất và tối ưu hóa

- **Resources and References**
  - Command Cheat Sheet: Tham khảo nhanh cho các lệnh thiết yếu
  - Glossary: Định nghĩa thuật ngữ và từ viết tắt toàn diện
  - FAQ: Câu trả lời chi tiết cho các câu hỏi thường gặp
  - Liên kết tài nguyên bên ngoài và kết nối cộng đồng

- **Examples and Templates**
  - Ví dụ Ứng dụng Web đơn giản
  - Mẫu triển khai Website Tĩnh
  - Cấu hình Ứng dụng Container
  - Các mô hình tích hợp cơ sở dữ liệu
  - Ví dụ kiến trúc Microservices
  - Triển khai hàm không máy chủ

#### Tính năng
- **Multi-Platform Support**: Hướng dẫn cài đặt và cấu hình cho Windows, macOS và Linux
- **Multiple Skill Levels**: Nội dung thiết kế cho từ sinh viên đến nhà phát triển chuyên nghiệp
- **Practical Focus**: Ví dụ thực hành và kịch bản thực tế
- **Comprehensive Coverage**: Từ khái niệm cơ bản đến các mô hình doanh nghiệp nâng cao
- **Security-First Approach**: Các thực hành bảo mật tốt nhất được tích hợp xuyên suốt
- **Cost Optimization**: Hướng dẫn triển khai tiết kiệm chi phí và quản lý tài nguyên

#### Chất lượng Tài liệu
- **Detailed Code Examples**: Ví dụ mã chi tiết, đã thử nghiệm
- **Step-by-Step Instructions**: Hướng dẫn rõ ràng, có thể thực hiện được
- **Comprehensive Error Handling**: Xử lý lỗi toàn diện, khắc phục sự cố cho các vấn đề phổ biến
- **Best Practices Integration**: Tích hợp tiêu chuẩn ngành và khuyến nghị
- **Version Compatibility**: Cập nhật với các dịch vụ Azure mới nhất và tính năng azd

## Các nâng cấp dự kiến trong tương lai

### Phiên bản 3.1.0 (Dự kiến)
#### Mở rộng Nền tảng AI
- **Multi-Model Support**: Các mẫu tích hợp cho Hugging Face, Azure Machine Learning và mô hình tùy chỉnh
- **AI Agent Frameworks**: Mẫu cho triển khai LangChain, Semantic Kernel và AutoGen
- **Advanced RAG Patterns**: Các tùy chọn cơ sở dữ liệu vector ngoài Azure AI Search (Pinecone, Weaviate, v.v.)
- **AI Observability**: Giám sát nâng cao cho hiệu suất mô hình, sử dụng token và chất lượng phản hồi

#### Trải nghiệm Nhà phát triển
- **VS Code Extension**: Trải nghiệm phát triển tích hợp AZD + AI Foundry
- **GitHub Copilot Integration**: Tạo mẫu AZD được trợ giúp bởi AI
- **Interactive Tutorials**: Bài tập mã hóa thực hành với xác thực tự động cho các kịch bản AI
- **Video Content**: Hướng dẫn video bổ sung cho người học trực quan tập trung vào triển khai AI

### Phiên bản 4.0.0 (Dự kiến)
#### Mô hình AI cho doanh nghiệp
- **Governance Framework**: Quản trị mô hình AI, tuân thủ và theo dõi kiểm toán
- **Multi-Tenant AI**: Mô hình phục vụ nhiều khách hàng với dịch vụ AI tách biệt
- **Edge AI Deployment**: Tích hợp với Azure IoT Edge và container instances
- **Hybrid Cloud AI**: Các mô hình triển khai đa đám mây và lai cho khối lượng công việc AI

#### Tính năng Nâng cao
- **AI Pipeline Automation**: Tích hợp MLOps với pipeline Azure Machine Learning
- **Advanced Security**: Mô hình zero-trust, private endpoints và bảo vệ chống mối đe dọa nâng cao
- **Performance Optimization**: Tinh chỉnh nâng cao và chiến lược mở rộng cho các ứng dụng AI có thông lượng cao
- **Global Distribution**: Các mô hình phân phối nội dung và caching tại edge cho ứng dụng AI

### Phiên bản 3.0.0 (Dự kiến) - Được thay thế bởi Phiên bản Hiện tại
#### Các mục đề xuất - Đã được triển khai trong v3.0.0
- ✅ **AI-Focused Content**: Nội dung tập trung vào AI toàn diện tích hợp Microsoft Foundry (Hoàn thành)
- ✅ **Interactive Tutorials**: Hội thảo thực hành AI (Hoàn thành)
- ✅ **Advanced Security Module**: Mô hình bảo mật chuyên biệt cho AI (Hoàn thành)
- ✅ **Performance Optimization**: Chiến lược tinh chỉnh khối lượng công việc AI (Hoàn thành)

### Phiên bản 2.1.0 (Dự kiến) - Đã được thực hiện một phần trong v3.0.0
#### Cải tiến nhỏ - Một số đã hoàn thành trong bản phát hành hiện tại
- ✅ **Additional Examples**: Các kịch bản triển khai tập trung vào AI (Hoàn thành)
- ✅ **Extended FAQ**: Các câu hỏi và xử lý sự cố chuyên biệt cho AI (Hoàn thành)
- **Tool Integration**: Hướng dẫn tích hợp IDE và trình soạn thảo được cải thiện
- ✅ **Monitoring Expansion**: Mở rộng giám sát chuyên biệt cho AI và các mẫu cảnh báo (Hoàn thành)

#### Vẫn được lên kế hoạch cho bản phát hành tương lai
- **Mobile-Friendly Documentation**: Thiết kế đáp ứng cho học trên thiết bị di động
- **Offline Access**: Gói tài liệu có thể tải xuống
- **Enhanced IDE Integration**: Tiện ích mở rộng VS Code cho luồng công việc AZD + AI
- **Community Dashboard**: Bảng điều khiển cộng đồng theo thời gian thực và theo dõi đóng góp

## Đóng góp vào Changelog

### Báo cáo Thay đổi
Khi đóng góp cho kho chứa này, vui lòng đảm bảo các mục trong changelog bao gồm:

1. **Version Number**: Tuân theo phiên bản ngữ nghĩa (major.minor.patch)
2. **Date**: Ngày phát hành hoặc cập nhật theo định dạng YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Mô tả ngắn gọn về những gì đã thay đổi
5. **Impact Assessment**: Những thay đổi ảnh hưởng đến người dùng hiện tại như thế nào

### Các Loại Thay đổi

#### Đã Thêm
- Tính năng mới, phần tài liệu hoặc khả năng mới
- Ví dụ mới, mẫu hoặc tài nguyên học tập mới
- Công cụ bổ sung, script hoặc tiện ích

#### Đã Thay đổi
- Sửa đổi chức năng hoặc tài liệu hiện có
- Cập nhật để cải thiện độ rõ ràng hoặc chính xác
- Tái cấu trúc nội dung hoặc tổ chức

#### Ngưng sử dụng
- Các tính năng hoặc phương pháp đang được loại dần
- Các phần tài liệu dự kiến sẽ bị xóa
- Các phương pháp có lựa chọn thay thế tốt hơn

#### Đã xóa
- Các tính năng, tài liệu hoặc ví dụ không còn phù hợp
- Thông tin lỗi thời hoặc phương pháp bị ngưng sử dụng
- Nội dung trùng lặp hoặc được hợp nhất

#### Đã Sửa
- Sửa lỗi trong tài liệu hoặc mã
- Giải quyết các vấn đề hoặc sự cố đã được báo cáo
- Cải thiện độ chính xác hoặc chức năng

#### Bảo mật
- Cải tiến hoặc sửa lỗi liên quan đến bảo mật
- Cập nhật các thực hành tốt nhất về bảo mật
- Khắc phục các lỗ hổng bảo mật

### Hướng dẫn Phiên bản Ngữ nghĩa

#### Phiên bản Chính (X.0.0)
- Các thay đổi phá vỡ yêu cầu tương tác của người dùng
- Tái cấu trúc đáng kể về nội dung hoặc tổ chức
- Các thay đổi làm thay đổi phương pháp tiếp cận hoặc phương pháp cơ bản

#### Phiên bản Phụ (X.Y.0)
- Tính năng mới hoặc bổ sung nội dung
- Các cải tiến vẫn giữ tương thích ngược
- Ví dụ, công cụ hoặc tài nguyên bổ sung

#### Phiên bản vá (X.Y.Z)
- Sửa lỗi và hiệu chỉnh
- Cải tiến nhỏ cho nội dung hiện có
- Làm rõ và cải tiến nhỏ

## Phản hồi và Đề xuất của Cộng đồng

Chúng tôi chủ động khuyến khích phản hồi của cộng đồng để cải thiện nguồn học này:

### Cách Gửi Phản hồi
- **GitHub Issues**: Báo cáo vấn đề hoặc đề xuất cải tiến (chào đón các vấn đề liên quan đến AI)
- **Discord Discussions**: Chia sẻ ý tưởng và tham gia cộng đồng Microsoft Foundry
- **Pull Requests**: Góp phần cải thiện trực tiếp nội dung, đặc biệt là các mẫu và hướng dẫn AI
- **Microsoft Foundry Discord**: Tham gia kênh #Azure để thảo luận AZD + AI
- **Community Forums**: Tham gia các thảo luận phát triển Azure rộng hơn

### Các Loại Phản hồi
- **AI Content Accuracy**: Sửa chữa thông tin tích hợp dịch vụ AI và triển khai
- **Learning Experience**: Gợi ý nhằm cải thiện luồng học của nhà phát triển AI
- **Missing AI Content**: Yêu cầu thêm mẫu, mô hình hoặc ví dụ AI
- **Accessibility**: Cải thiện cho các nhu cầu học đa dạng
- **AI Tool Integration**: Gợi ý để tích hợp luồng công việc phát triển AI tốt hơn
- **Production AI Patterns**: Yêu cầu mô hình triển khai AI cho doanh nghiệp

### Cam kết Phản hồi
- **Issue Response**: Trong vòng 48 giờ đối với các vấn đề được báo cáo
- **Feature Requests**: Đánh giá trong vòng một tuần
- **Community Contributions**: Xem xét trong vòng một tuần
- **Security Issues**: Ưu tiên ngay lập tức với phản hồi nhanh

## Lịch Bảo trì

### Cập nhật Định kỳ
- **Monthly Reviews**: Kiểm tra độ chính xác nội dung và xác thực liên kết
- **Quarterly Updates**: Bổ sung và cải thiện nội dung lớn
- **Semi-Annual Reviews**: Tái cấu trúc và nâng cao toàn diện
- **Annual Releases**: Cập nhật phiên bản chính với các cải tiến đáng kể

### Giám sát và Đảm bảo Chất lượng
- **Automated Testing**: Xác thực định kỳ các ví dụ mã và liên kết
- **Community Feedback Integration**: Thường xuyên kết hợp gợi ý của người dùng
- **Technology Updates**: Đồng bộ với các dịch vụ Azure mới nhất và phát hành azd
- **Accessibility Audits**: Đánh giá định kỳ theo nguyên tắc thiết kế bao gồm

## Chính sách Hỗ trợ Phiên bản

### Hỗ trợ Phiên bản Hiện tại
- **Latest Major Version**: Hỗ trợ đầy đủ với các cập nhật định kỳ
- **Previous Major Version**: Cập nhật bảo mật và sửa lỗi quan trọng trong 12 tháng
- **Legacy Versions**: Chỉ hỗ trợ cộng đồng, không có cập nhật chính thức

### Hướng dẫn Di cư
Khi các phiên bản chính được phát hành, chúng tôi cung cấp:
- **Hướng dẫn di chuyển**: Hướng dẫn chuyển đổi từng bước
- **Ghi chú tương thích**: Chi tiết về các thay đổi phá vỡ tương thích
- **Hỗ trợ công cụ**: Tập lệnh hoặc tiện ích hỗ trợ việc di chuyển
- **Hỗ trợ cộng đồng**: Diễn đàn chuyên dụng cho các câu hỏi về di chuyển

---

**Điều hướng**
- **Bài học trước**: [Hướng dẫn học tập](resources/study-guide.md)
- **Bài học tiếp theo**: Quay lại [README chính](README.md)

**Luôn cập nhật**: Theo dõi kho lưu trữ này để nhận thông báo về các bản phát hành mới và các cập nhật quan trọng cho tài liệu học tập.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu ban đầu bằng ngôn ngữ gốc nên được coi là nguồn chính thức. Đối với thông tin quan trọng, nên nhờ dịch thuật chuyên nghiệp do người thực hiện. Chúng tôi không chịu trách nhiệm đối với bất kỳ sự hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->