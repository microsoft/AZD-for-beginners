# Nhật ký thay đổi - AZD For Beginners

## Giới thiệu

Nhật ký thay đổi này ghi lại tất cả các thay đổi, cập nhật và cải tiến đáng chú ý cho kho lưu trữ AZD For Beginners. Chúng tôi tuân theo các nguyên tắc phân loại phiên bản ngữ nghĩa và duy trì nhật ký này để giúp người dùng hiểu những gì đã thay đổi giữa các phiên bản.

## Mục tiêu học tập

Bằng cách xem lại nhật ký thay đổi này, bạn sẽ:
- Giữ được thông tin về các tính năng mới và nội dung được thêm vào
- Hiểu các cải tiến thực hiện trên tài liệu hiện có
- Theo dõi các sửa lỗi và chỉnh sửa để đảm bảo tính chính xác
- Theo dõi tiến trình phát triển của tài liệu học tập theo thời gian

## Kết quả học tập

Sau khi xem các mục trong nhật ký thay đổi, bạn sẽ có thể:
- Xác định nội dung và tài nguyên mới có sẵn để học
- Hiểu những phần nào đã được cập nhật hoặc cải tiến
- Lên kế hoạch con đường học tập của bạn dựa trên tài liệu mới nhất
- Đóng góp phản hồi và đề xuất cho các cải tiến tương lai

## Lịch sử phiên bản

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Phiên bản này đóng các khoảng trống trung cấp còn lại được phát hiện bởi phân tích azd-coverage: cách soạn thảo và xuất bản template của riêng bạn, môi trường dev-container/Codespaces có thể tái tạo, provider hạ tầng Pulumi, hướng dẫn Azure DevOps CI/CD, xác thực service-principal, hướng dẫn chọn host (AKS/Spring Apps), giải thích `azd restore`/`azd package`, xử lý lỗi hook, và các thực hành cho nhóm/môi trường dùng chung.**

#### Đã thêm
- **🧱 Bài học Chương 4 mới** `docs/chapter-04-infrastructure/custom-templates.md` — soạn thảo template azd của riêng bạn: cấu trúc bắt buộc (`azure.yaml`, `infra/`, `src/`), trường `metadata.template`, tham số hóa hạ tầng với token tài nguyên `uniqueString()` và thẻ `azd-env-name`, kiểm thử cục bộ với `azd init --template <local-path>`, xuất bản lên GitHub, và gửi vào bộ sưu tập Awesome AZD
- **📦 Bài học Chương 1 mới** `docs/chapter-01-foundation/dev-containers.md` — môi trường azd có thể tái tạo với Dev Containers và GitHub Codespaces: một `.devcontainer/devcontainer.json` tối thiểu sử dụng feature chính thức `ghcr.io/azure/azure-dev/azd`, các feature theo ngôn ngữ, `docker-in-docker` cho host container, và `azd auth login --use-device-code` để đăng nhập từ xa
- **🧩 Pulumi với azd** phần trong `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, bố cục thư mục Pulumi, stacks ánh xạ tới environment của azd, outputs/đánh tag bắt buộc, và workflow `azd up` / `azd down` giống hệt
- **🎯 Hướng dẫn chọn host** trong `docs/chapter-04-infrastructure/provisioning.md` — so sánh thân thiện cho người mới của `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, và `springapp`, với hướng dẫn khi nào nên chọn AKS hoặc Azure Spring Apps
- **🛠️ Hướng dẫn Azure DevOps CI/CD** trong `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, kết nối service với workload identity federation (OIDC), `azure-dev.yml` được tạo, và thiết lập variable-group
- **🔑 Service Principals (Pattern 4)** thêm vào `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` không tương tác với client secret so với thông tin đăng nhập được liên kết/federated (OIDC), khi nào nên sử dụng, và lưu trữ thông tin đăng nhập an toàn
- **🪝 Xử lý lỗi hook** mục phụ trong `docs/chapter-04-infrastructure/deployment-guide.md` — mã thoát và `set -e`, `continueOnError`, kiểm thử hook riêng lẻ với `azd hooks run`, shell theo hệ điều hành, và `--debug`
- **👥 Nhóm / môi trường dùng chung** phần trong `docs/chapter-03-configuration/configuration.md` — những gì nằm trong `.azure/`, những gì nên gitignore, môi trường theo từng developer, `azd env list`/`select`, và cung cấp giá trị môi trường trong CI/CD
- **🧰 Giải thích `azd restore` và mở rộng `azd package`** trong `resources/cheat-sheet.md` — khôi phục phụ thuộc và xây dựng một artifact có thể triển khai mà không triển khai

#### Đã thay đổi
- **🧭 Bảng bài học Chương 4** được cập nhật để bao gồm bài học mới "Authoring Your Own Template" (Bài 3)
- **🧭 Bảng bài học Chương 1** được cập nhật để bao gồm bài học mới "Dev Containers & Codespaces" (Bài 5); chân điều hướng được kết nối giữa `bring-your-own-app.md` và `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Phiên bản này lấp đầy các khoảng trống lớn nhất cho một hướng dẫn dành cho người mới bằng cách thêm hai bài học thực hành mới (một walkthrough multi-agent có thể triển khai và thêm azd vào một ứng dụng hiện có), một phần giới thiệu hooks thân thiện với người mới, một phần Terraform với azd, một hướng dẫn từng bước pipeline GitHub Actions, một giải thích cho các extension preview mới, và một danh sách kiểm tra xác minh triển khai rõ ràng.**

#### Đã thêm
- **🤝 Bài học Chương 5 mới** `docs/chapter-05-multi-agent/multi-agent-basics.md` — một walkthrough hai agent hoàn toàn thực hành có thể triển khai (orchestrator + specialists) sử dụng một template thực tế (`contoso-creative-writer`), bao gồm khi nào sử dụng multi-agent, workflow `azd up`, hiểu các tài nguyên đã triển khai, tracing giữa các agent, tùy chỉnh, và dọn dẹp
- **📦 Bài học Chương 1 mới** `docs/chapter-01-foundation/bring-your-own-app.md` — cách thêm azd vào một dự án hiện có với `azd init` ("use code in the current directory"), hiểu `azure.yaml` và `infra/`, `azd infra generate`, phát hiện host, và triển khai với `azd up`
- **🌐 Terraform với azd** phần thêm vào `docs/chapter-04-infrastructure/provisioning.md` — cấu hình `infra.provider: terraform`, bố cục thư mục `.tf`, các outputs `AZURE_*` bắt buộc và đánh tag `azd-env-name`, và workflow `azd up` / `azd down` giống hệt (đóng khoảng trống nơi trước đó chỉ minh họa Bicep)
- **⚙️ Hướng dẫn từng bước GitHub Actions** trong `docs/chapter-08-production/production-ai-practices.md` — từ repo GitHub đến triển khai tự động: `azd pipeline config`, thông tin đăng nhập liên kết OIDC (không lưu secrets), `azure-dev.yml` được tạo, và hướng dẫn secrets so với variables
- **🪝 Giới thiệu "Mới với hooks?" cho người mới** trong `docs/chapter-04-infrastructure/deployment-guide.md` — hook là gì, bảng các giai đoạn hook, một hook tối thiểu đầu tiên, và chạy hook thủ công với `azd hooks run`
- **✅ Danh sách kiểm tra "Xác minh Triển khai của Bạn"** thêm vào Bước 5 của `docs/chapter-01-foundation/first-project.md` — kiểm tra smoke, kiểm tra endpoint sức khỏe, và tiêu chí thành công rõ ràng
- **🧩 Giải thích cho các extension preview mới** `azure.ai.skills` và `azure.ai.connections` (chúng là gì và khi nào nên sử dụng) trong `docs/chapter-08-production/production-ai-practices.md`

#### Đã thay đổi
- **🧭 Bảng bài học Chương 5** được sửa: `multi-agent-basics.md` hiện là Bài 1 (bài duy nhất hoàn toàn thực hành), với ghi nhãn chính xác rằng Bài 2 nằm ở Chương 6 và kịch bản Retail là một blueprint kiến trúc, không phải một template một lệnh
- **🧭 Bảng bài học Chương 1** giờ bao gồm bài học mới "Bring Your Own App" (Bài 4)
- **🔗 Chân điều hướng** được cập nhật: `first-project.md` bây giờ liên kết tới `bring-your-own-app.md`

#### Đã sửa
- **🧱 Đóng khoảng trống Terraform "đã được đề cập nhưng thiếu"** — khóa học trước đây tham chiếu hỗ trợ Terraform mà không trình bày nó
- **🔀 Sửa các liên kết chéo Chương 5 gây hiểu lầm** đã ngụ ý rằng một triển khai multi-agent đầy đủ tồn tại khi thực tế chỉ có một blueprint kiến trúc

#### Các tệp đã cập nhật
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(mới)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(mới)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Phiên bản này xác nhận lại khóa học với `azd` `1.25.6` (June 2026) và extension `azure.ai.agents` `0.1.40-preview`, mở rộng hướng dẫn AI từ "scaffold an agent" đến toàn bộ vòng đời agent (test → evaluate → optimize → inspect → delete), nêu bật các extension preview mới `azure.ai.skills` và `azure.ai.connections`, và ghi chú việc đổi tên sản phẩm ".NET Aspire" → "Aspire".**

#### Đã thêm
- **🔁 Mô tả đầy đủ vòng đời agent** cho người mới và kỹ sư AI trên khắp tài liệu:
  - `docs/chapter-01-foundation/azd-basics.md` — Bảng vòng đời (scaffold → test → measure → improve → inspect → clean up) thêm vào phần Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — Mục mới "Managing the Agent Lifecycle" bao gồm `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, và `delete --force`
  - `resources/cheat-sheet.md` — Mở rộng các Lệnh AI Agent với `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, và `delete --force`
- **🧩 Các extension preview mới** được tài liệu hóa: `azure.ai.skills` (kỹ năng agent có thể tái sử dụng) và `azure.ai.connections` (kết nối Foundry) thêm vào bảng extension và cheat sheet
- **⏱️ Hướng dẫn thời gian phản hồi** — ví dụ `azd ai agent invoke` giờ ghi chú rằng nó in tổng độ trễ và time-to-first-byte
- **📌 Thanh banner phiên bản** trong README gốc hướng người học đến `azd version` và `azd upgrade`

#### Đã thay đổi
- **✅ Cập nhật baseline xác thực** từ `azd 1.23.12` (March 2026) lên `azd 1.25.6` (June 2026) trên tất cả README chương và tài liệu workshop
- **🤖 Ghi chú extension Chương 2** cập nhật từ `azure.ai.agents` `0.1.18-preview` lên `0.1.40-preview`
- **🧪 Ví dụ xác thực workshop** (đầu ra `azd version`) cập nhật thành `1.25.6`
- **🧭 README "What's New in azd Today"** làm mới để làm nổi bật vòng đời agent end-to-end, các extension AI mới, và các sửa lỗi cải thiện trải nghiệm (`azd init` idempotency, `azd auth login` xoá token cũ, prompt lần chạy đầu cho `azd tool`)
- **📖 Chương 2 agents.md (Option 4)** giờ hướng người học tới các lệnh vòng đời sau deploy thay vì dừng lại ở `azd up`

#### Đã sửa
- **🏷️ Đặt tên sản phẩm** — thêm ghi chú đổi tên Aspire (".NET Aspire" giờ chỉ còn là "Aspire"); hỗ trợ Aspire trong azd không thay đổi
- **🔎 Xác thực phát hành trực tiếp** xác nhận với nguồn phát hành Azure Developer CLI: CLI ổn định `1.25.6` (2026-06-12) và `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Các tệp đã cập nhật
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Làm rõ việc Onboarding cho Người mới, Xác thực Cài đặt & Dọn dẹp Lệnh AZD Cuối cùng
**Phiên bản này theo sau đợt kiểm tra xác thực AZD 1.23 với một lần rà soát tài liệu hướng tới người mới: nó làm rõ hướng dẫn xác thực theo lộ trình AZD-first, bổ sung các script xác thực cài đặt cục bộ, xác minh các lệnh quan trọng với AZD CLI thực tế, và loại bỏ những tham chiếu lệnh nguồn tiếng Anh lỗi thời cuối cùng bên ngoài changelog.**

#### Added
- **🧪 Các script xác thực cài đặt cho người mới** với `validate-setup.ps1` và `validate-setup.sh` để người học có thể xác nhận các công cụ cần thiết trước khi bắt đầu Chương 1
- **✅ Các bước xác thực cài đặt ban đầu** trong README gốc và README Chương 1 để các yêu cầu trước cần thiết bị phát hiện trước khi `azd up`

#### Changed
- **🔐 Hướng dẫn xác thực cho người mới** hiện nhất quán coi `azd auth login` là con đường chính cho workflow AZD, với `az login` được nêu là tùy chọn trừ khi trực tiếp dùng các lệnh Azure CLI
- **📚 Luồng onboarding Chương 1** giờ hướng người học xác thực cài đặt cục bộ trước khi cài đặt, xác thực và các bước triển khai đầu tiên
- **🛠️ Thông điệp của bộ xác thực** giờ phân tách rõ các yêu cầu gây trở ngại với các cảnh báo Azure CLI tùy chọn cho lộ trình người mới chỉ dùng AZD
- **📖 Tài liệu cấu hình, khắc phục sự cố và ví dụ** giờ phân biệt giữa việc xác thực AZD bắt buộc và đăng nhập Azure CLI tùy chọn nơi cả hai trước đây được trình bày mà không có bối cảnh

#### Fixed
- **📋 Các tham chiếu lệnh nguồn tiếng Anh còn lại** được cập nhật thành các dạng AZD hiện tại, bao gồm `azd config show` trong cheat sheet và `azd monitor --overview` nơi hướng dẫn tổng quan Azure Portal là ý định
- **🧭 Các khẳng định dành cho người mới trong Chương 1** được làm nhẹ để tránh hứa hẹn quá mức về việc đảm bảo không lỗi hoặc rollback trên mọi mẫu và tài nguyên Azure
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

#### Xác thực AZD 1.23.12, Mở rộng Môi trường Workshop & Làm mới Mô hình AI
**Phiên bản này thực hiện một đợt rà soát xác thực tài liệu đối chiếu với `azd` `1.23.12`, cập nhật các ví dụ lệnh AZD lỗi thời, làm mới hướng dẫn mô hình AI theo mặc định hiện tại, và mở rộng hướng dẫn workshop vượt ra ngoài GitHub Codespaces để hỗ trợ cả dev container và clone cục bộ.**

#### Added
- **✅ Ghi chú xác thực trên các chương cốt lõi và tài liệu workshop** để làm rõ baseline AZD đã được kiểm thử cho người học sử dụng các build CLI mới hơn hoặc cũ hơn
- **⏱️ Hướng dẫn timeout triển khai** cho các triển khai ứng dụng AI chạy lâu dùng `azd deploy --timeout 1800`
- **🔎 Các bước kiểm tra extension** với `azd extension show azure.ai.agents` trong tài liệu workflow AI
- **🌐 Hướng dẫn môi trường workshop rộng hơn** bao gồm GitHub Codespaces, dev container và clone cục bộ với MkDocs

#### Changed
- **📚 README giới thiệu chương** giờ nhất quán ghi chú đã xác thực đối với `azd 1.23.12` trên các phần foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting và production
- **🛠️ Tham chiếu lệnh AZD** được cập nhật thành dạng hiện tại khắp tài liệu:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` hoặc `azd env get-value(s)` tùy ngữ cảnh
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` nơi cần tổng quan Application Insights
- **🧪 Ví dụ xem trước provisioning** được đơn giản hóa phù hợp với cách dùng hiện được hỗ trợ như `azd provision --preview` và `azd provision --preview -e production`
- **🧭 Luồng workshop** được cập nhật để người học có thể hoàn thành lab trong Codespaces, dev container, hoặc clone cục bộ thay vì giả định chỉ chạy trên Codespaces
- **🔐 Hướng dẫn xác thực** giờ ưu tiên `azd auth login` cho workflow AZD, với `az login` được đặt làm tùy chọn khi trực tiếp sử dụng lệnh Azure CLI

#### Fixed
- **🪟 Lệnh cài đặt Windows** chuẩn hóa lại theo kiểu viết hoa package `winget` hiện tại trong hướng dẫn cài đặt
- **🐧 Hướng dẫn cài đặt Linux** được sửa để tránh các hướng dẫn quản lý gói `azd` theo distro không được hỗ trợ và thay vào đó hướng tới assets release khi phù hợp
- **📦 Ví dụ mô hình AI** được cập nhật từ các mặc định cũ như `gpt-35-turbo` và `text-embedding-ada-002` thành các ví dụ hiện tại như `gpt-4.1-mini`, `gpt-4.1`, và `text-embedding-3-large`
- **📋 Đoạn mã triển khai và chẩn đoán** được sửa để dùng các lệnh môi trường và trạng thái hiện tại trong logs, script và bước khắc phục sự cố
- **⚙️ Hướng dẫn GitHub Actions** cập nhật từ `Azure/setup-azd@v1.0.0` sang `Azure/setup-azd@v2`
- **🤖 Hướng dẫn MCP/Copilot consent** cập nhật từ `azd mcp consent` sang `azd copilot consent list`

#### Improved
- **🧠 Hướng dẫn chương AI** giờ giải thích tốt hơn hành vi `azd ai` nhạy cảm với preview, đăng nhập theo tenant, cách dùng extension hiện tại, và khuyến nghị triển khai mô hình cập nhật
- **🧪 Hướng dẫn workshop** giờ dùng ví dụ phiên bản thực tế hơn và ngôn ngữ thiết lập môi trường rõ ràng hơn cho các lab thực hành
- **📈 Tài liệu production và khắc phục sự cố** giờ tương thích tốt hơn với các ví dụ giám sát, mô hình dự phòng và các tier chi phí hiện hành

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

#### Các lệnh AZD AI CLI, Xác thực Nội dung & Mở rộng Template
**Phiên bản này bổ sung phạm vi cho `azd ai`, `azd extension`, và `azd mcp` trên tất cả các chương liên quan đến AI, sửa các liên kết hỏng và mã bị deprecate trong agents.md, cập nhật cheat sheet, và đại tu phần Example Templates với các mô tả đã được xác thực và các template Azure AI AZD mới.**

#### Added
- **🤖 Phạm vi lệnh AZD AI CLI** trên 7 file (trước đây chỉ ở Chương 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Mục mới "Extensions and AI Commands" giới thiệu `azd extension`, `azd ai agent init`, và `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Lựa chọn 4: `azd ai agent init` với bảng so sánh (template vs manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Các phần con "AZD Extensions for Foundry" và "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start giờ hiển thị cả đường dẫn triển khai dựa trên template và manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Phần Deploy giờ bao gồm tùy chọn `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Phần con "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Mục mới "AI & Extensions Commands" với `azd extension`, `azd ai agent init`, `azd mcp`, và `azd infra generate`
- **📦 Các template ví dụ AZD AI mới** trong `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat với Blazor WebAssembly, Semantic Kernel, và hỗ trợ trò chuyện bằng giọng nói
  - **azure-search-openai-demo-java** — Java RAG chat dùng Langchain4J với các tùy chọn triển khai ACA/AKS
  - **contoso-creative-writer** — Ứng dụng nhiều agent cho sáng tác sáng tạo sử dụng Azure AI Agent Service, Bing Grounding, và Prompty
  - **serverless-chat-langchainjs** — RAG serverless dùng Azure Functions + LangChain.js + Cosmos DB với hỗ trợ phát triển cục bộ Ollama
  - **chat-with-your-data-solution-accelerator** — Accelerator RAG doanh nghiệp với portal quản trị, tích hợp Teams, và tùy chọn PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Ứng dụng tham chiếu điều phối MCP đa-agent với server bằng .NET, Python, Java, và TypeScript
  - **azd-ai-starter** — Template khởi đầu Bicep cơ bản cho hạ tầng Azure AI
  - **🔗 Liên kết Thư viện awesome-azd AI** — Tham chiếu tới [Thư viện awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 Điều hướng agents.md**: các liên kết Previous/Next giờ khớp thứ tự bài học trong README Chương 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Liên kết hỏng agents.md**: `production-ai-practices.md` sửa thành `../chapter-08-production/production-ai-practices.md` (3 lần)
- **📦 Mã bị deprecate trong agents.md**: Thay `opencensus` bằng `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API không hợp lệ trong agents.md**: Di chuyển `max_tokens` từ `create_agent()` sang `create_run()` dưới tên `max_completion_tokens`
- **🔢 Đếm token trong agents.md**: Thay ước lượng thô `len//4` bằng `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Sửa dịch vụ từ "Cognitive Search + App Service" thành "Azure AI Search + Azure Container Apps" (host mặc định thay đổi Oct 2024)
- **contoso-chat**: Cập nhật mô tả để tham chiếu Azure AI Foundry + Prompty, khớp với tiêu đề repo và stack công nghệ thực tế

#### Removed
- **ai-document-processing**: Loại bỏ tham chiếu template không hoạt động (repo không công khai truy cập như một template AZD)

#### Improved
- **📝 Bài tập trong agents.md**: Bài tập 1 giờ hiển thị đầu ra mong đợi và bước `azd monitor`; Bài tập 2 bao gồm đầy đủ mã đăng ký `FunctionTool`; Bài tập 3 thay hướng dẫn mơ hồ bằng các lệnh cụ thể `prepdocs.py`
- **📚 Tài nguyên agents.md**: Cập nhật liên kết tài liệu tới docs và quickstart hiện tại của Azure AI Agent Service
- **📋 Bảng Next Steps trong agents.md**: Thêm liên kết AI Workshop Lab để bao phủ đầy đủ chương

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
#### Cải thiện Điều hướng Khóa học
**Phiên bản này cải thiện điều hướng chương trong README.md bằng một định dạng bảng được nâng cao.**

#### Đã thay đổi
- **Bảng Bản đồ Khóa học**: Đã được cải thiện với liên kết trực tiếp tới bài học, ước tính thời lượng và xếp hạng độ phức tạp
- **Dọn dẹp thư mục**: Đã xóa các thư mục cũ dư thừa (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Kiểm tra liên kết**: Tất cả 21+ liên kết nội bộ trong bảng Bản đồ Khóa học đã được xác minh

### [v3.16.0] - 2026-02-05

#### Cập nhật Tên Sản phẩm
**Phiên bản này cập nhật các tham chiếu sản phẩm theo thương hiệu Microsoft hiện tại.**

#### Đã thay đổi
- **Microsoft Foundry → Microsoft Foundry**: Tất cả các tham chiếu được cập nhật ở các tệp không thuộc phần dịch
- **Azure AI Agent Service → Foundry Agents**: Tên dịch vụ được cập nhật để phản ánh thương hiệu hiện tại

#### Các tệp đã cập nhật
- `README.md` - Trang chính của khóa học
- `changelog.md` - Lịch sử phiên bản
- `course-outline.md` - Cấu trúc khóa học
- `docs/chapter-02-ai-development/agents.md` - Hướng dẫn tác nhân AI
- `examples/README.md` - Tài liệu ví dụ
- `workshop/README.md` - Trang chính workshop
- `workshop/docs/index.md` - Mục lục workshop
- `workshop/docs/instructions/*.md` - Tất cả các tệp hướng dẫn workshop

---

### [v3.15.0] - 2026-02-05

#### Tái cấu trúc lớn kho lưu trữ: Tên thư mục theo chương
**Phiên bản này tái cấu trúc tài liệu thành các thư mục chương chuyên dụng để điều hướng rõ ràng hơn.**

#### Đổi tên thư mục
Các thư mục cũ đã được thay thế bằng các thư mục đánh số chương:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

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
- **📚 Các tệp README chương**: Đã tạo README.md trong mỗi thư mục chương với:
  - Mục tiêu học tập và thời lượng
  - Bảng bài học kèm mô tả
  - Các lệnh bắt đầu nhanh
  - Điều hướng đến các chương khác

#### Đã thay đổi
- **🔗 Đã cập nhật tất cả liên kết nội bộ**: Hơn 78 đường dẫn đã được cập nhật trong tất cả các tệp tài liệu
- **🗺️ README.md chính**: Đã cập nhật Bản đồ Khóa học với cấu trúc chương mới
- **📝 examples/README.md**: Đã cập nhật các tham chiếu chéo đến các thư mục chương

#### Đã xóa
- Cấu trúc thư mục cũ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Tái cấu trúc Kho lưu trữ: Điều hướng theo Chương
**Phiên bản này thêm các tệp README điều hướng theo chương (bị thay thế bởi v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Hướng dẫn Tác nhân AI Mới
**Phiên bản này thêm một hướng dẫn toàn diện để triển khai tác nhân AI với Azure Developer CLI.**

#### Đã thêm
- **🤖 docs/microsoft-foundry/agents.md**: Hướng dẫn đầy đủ bao gồm:
  - Tác nhân AI là gì và sự khác biệt giữa chúng với chatbot
  - Ba mẫu tác nhân bắt đầu nhanh (Foundry Agents, Prompty, RAG)
  - Các mô hình kiến trúc tác nhân (tác nhân đơn, RAG, đa tác nhân)
  - Cấu hình công cụ và tuỳ chỉnh
  - Giám sát và theo dõi số liệu
  - Các cân nhắc về chi phí và tối ưu hóa
  - Các kịch bản khắc phục sự cố thường gặp
  - Ba bài tập thực hành kèm tiêu chí thành công

#### Cấu trúc Nội dung
- **Giới thiệu**: Khái niệm về tác nhân cho người mới bắt đầu
- **Bắt đầu nhanh**: Triển khai tác nhân với `azd init --template get-started-with-ai-agents`
- **Mô hình Kiến trúc**: Sơ đồ trực quan của các mô hình tác nhân
- **Cấu hình**: Thiết lập công cụ và biến môi trường
- **Giám sát**: Tích hợp Application Insights
- **Bài tập**: Học thực hành theo tiến trình (20-45 phút mỗi bài)

---

### [v3.12.0] - 2026-02-05

#### Cập nhật Môi trường DevContainer
**Phiên bản này cập nhật cấu hình container phát triển với các công cụ hiện đại và các mặc định tốt hơn cho trải nghiệm học AZD.**

#### Đã thay đổi
- **🐳 Ảnh cơ sở**: Đã cập nhật từ `python:3.12-bullseye` sang `python:3.12-bookworm` (Debian stable mới nhất)
- **📛 Tên Container**: Đã đổi tên từ "Python 3" sang "AZD for Beginners" để rõ ràng

#### Đã thêm
- **🔧 Tính năng mới của Dev Container**:
  - `azure-cli` với hỗ trợ Bicep được bật
  - `node:20` (phiên bản LTS cho các mẫu AZD)
  - `github-cli` để quản lý mẫu
  - `docker-in-docker` cho triển khai ứng dụng container

- **🔌 Chuyển tiếp Cổng**: Các cổng được cấu hình sẵn cho phát triển phổ biến:
  - 8000 (xem trước MkDocs)
  - 3000 (ứng dụng Web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Các tiện ích mở rộng VS Code mới**:
  - `ms-python.vscode-pylance` - Tăng cường IntelliSense cho Python
  - `ms-azuretools.vscode-azurefunctions` - Hỗ trợ Azure Functions
  - `ms-azuretools.vscode-docker` - Hỗ trợ Docker
  - `ms-azuretools.vscode-bicep` - Hỗ trợ ngôn ngữ Bicep
  - `ms-azure-devtools.azure-resource-groups` - Quản lý tài nguyên Azure
  - `yzhang.markdown-all-in-one` - Chỉnh sửa Markdown
  - `DavidAnson.vscode-markdownlint` - Kiểm tra chuẩn Markdown
  - `bierner.markdown-mermaid` - Hỗ trợ sơ đồ Mermaid
  - `redhat.vscode-yaml` - Hỗ trợ YAML (cho azure.yaml)
  - `eamodio.gitlens` - Trực quan hóa Git
  - `mhutchie.git-graph` - Lịch sử Git

- **⚙️ Cài đặt VS Code**: Đã thêm cài đặt mặc định cho trình thông dịch Python, định dạng khi lưu, và loại bỏ khoảng trắng

- **📦 Đã cập nhật requirements-dev.txt**:
  - Đã thêm plugin minify cho MkDocs
  - Đã thêm pre-commit để cải thiện chất lượng mã
  - Đã thêm các gói Azure SDK (azure-identity, azure-mgmt-resource)

#### Đã sửa
- **Lệnh Sau khi Tạo**: Bây giờ xác minh cài đặt AZD và Azure CLI khi container khởi động

---

### [v3.11.0] - 2026-02-05

#### Cải tổ README thân thiện với người mới
**Phiên bản này cải thiện đáng kể README.md để thân thiện hơn với người mới và thêm các tài nguyên thiết yếu cho nhà phát triển AI.**

#### Đã thêm
- **🆚 So sánh Azure CLI vs AZD**: Giải thích rõ khi nào nên dùng mỗi công cụ kèm ví dụ thực tiễn
- **🌟 Bộ sưu tập Awesome AZD**: Các liên kết trực tiếp tới thư viện mẫu cộng đồng và tài nguyên đóng góp:
  - [Bộ sưu tập Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ mẫu sẵn sàng triển khai
  - [Gửi Mẫu](https://github.com/Azure/awesome-azd/issues) - Đóng góp cộng đồng
- **🎯 Hướng dẫn Bắt đầu Nhanh**: Mục bắt đầu đơn giản 3 bước (Cài đặt → Đăng nhập → Triển khai)
- **📊 Bảng Điều hướng theo Kinh nghiệm**: Hướng dẫn rõ ràng nơi nên bắt đầu dựa trên kinh nghiệm của nhà phát triển

#### Đã thay đổi
- **Cấu trúc README**: Tổ chức lại để hiển thị dần dần - thông tin chính ở đầu
- **Phần Giới thiệu**: Viết lại để giải thích "The Magic of `azd up`" cho người mới hoàn toàn
- **Đã loại bỏ Nội dung trùng lặp**: Loại bỏ phần khắc phục sự cố trùng lặp
- **Lệnh Khắc phục sự cố**: Đã sửa tham chiếu `azd logs` để dùng `azd monitor --logs` hợp lệ

#### Đã sửa
- **🔐 Lệnh Xác thực**: Đã thêm `azd auth login` và `azd auth logout` vào cheat-sheet.md
- **Tham chiếu Lệnh không hợp lệ**: Đã xóa `azd logs` còn sót lại khỏi phần khắc phục sự cố trong README

#### Ghi chú
- **Phạm vi**: Các thay đổi áp dụng cho README.md chính và resources/cheat-sheet.md
- **Đối tượng hướng tới**: Các cải tiến nhắm đến nhà phát triển mới với AZD

---

### [v3.10.0] - 2026-02-05

#### Cập nhật Độ chính xác Lệnh Azure Developer CLI
**Phiên bản này sửa các lệnh AZD không tồn tại trong toàn bộ tài liệu, đảm bảo tất cả ví dụ mã sử dụng cú pháp Azure Developer CLI hợp lệ.**

#### Đã sửa
- **🔧 Các Lệnh AZD không tồn tại đã bị loại bỏ**: Kiểm toán toàn diện và sửa các lệnh không hợp lệ:
  - `azd logs` (không tồn tại) → được thay thế bằng `azd monitor --logs` hoặc các lệnh thay thế của Azure CLI
  - `azd service` subcommands (không tồn tại) → được thay thế bằng `azd show` và Azure CLI
  - `azd infra import/export/validate` (không tồn tại) → bị xóa hoặc thay thế bằng các phương án hợp lệ
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (không tồn tại) → bị loại bỏ
  - `azd provision --what-if/--rollback` flags (không tồn tại) → được cập nhật để sử dụng `--preview`
  - `azd config validate` (không tồn tại) → được thay thế bằng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (không tồn tại) → bị loại bỏ

- **📚 Các tệp được cập nhật với Sửa Lỗi Lệnh**:
  - `resources/cheat-sheet.md`: Đại tu toàn diện phần tham khảo lệnh
  - `docs/deployment/deployment-guide.md`: Sửa các chiến lược rollback và triển khai
  - `docs/troubleshooting/debugging.md`: Sửa phần phân tích nhật ký
  - `docs/troubleshooting/common-issues.md`: Cập nhật các lệnh khắc phục sự cố
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa phần gỡ lỗi AZD
  - `docs/getting-started/azd-basics.md`: Sửa các lệnh giám sát
  - `docs/getting-started/first-project.md`: Cập nhật ví dụ giám sát và gỡ lỗi
  - `docs/getting-started/installation.md`: Sửa ví dụ trợ giúp và phiên bản
  - `docs/pre-deployment/application-insights.md`: Sửa lệnh xem nhật ký
  - `docs/pre-deployment/coordination-patterns.md`: Sửa lệnh gỡ lỗi tác nhân

- **📝 Tham chiếu Phiên bản đã cập nhật**: 
  - `docs/getting-started/installation.md`: Đã thay `1.5.0` cố định bằng `1.x.x` với liên kết tới releases

#### Đã thay đổi
- **Chiến lược Rollback**: Cập nhật tài liệu để sử dụng rollback dựa trên Git (AZD không có rollback nội bộ)
- **Xem nhật ký**: Thay các tham chiếu `azd logs` bằng `azd monitor --logs`, `azd monitor --live`, và các lệnh Azure CLI
- **Phần Hiệu năng**: Loại bỏ các flag triển khai song song/tăng dần không tồn tại, cung cấp các phương án hợp lệ

#### Chi tiết Kỹ thuật
- **Các Lệnh AZD Hợp lệ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Các Flag hợp lệ của azd monitor**: `--live`, `--logs`, `--overview`
- **Tính năng đã loại bỏ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Ghi chú
- **Xác minh**: Các lệnh đã được xác thực theo Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Hoàn thành Workshop và Cập nhật Chất lượng Tài liệu
**Phiên bản này hoàn thành các mô-đun workshop tương tác, sửa tất cả các liên kết tài liệu hỏng, và cải thiện chất lượng nội dung tổng thể cho nhà phát triển AI sử dụng Microsoft AZD.**

#### Đã thêm
- **📝 CONTRIBUTING.md**: Tài liệu hướng dẫn đóng góp mới với:
  - Hướng dẫn rõ ràng để báo cáo vấn đề và đề xuất thay đổi
  - Tiêu chuẩn tài liệu cho nội dung mới
  - Hướng dẫn ví dụ mã và quy ước thông điệp commit
  - Thông tin về tương tác cộng đồng

#### Hoàn thành
- **🎯 Mô-đun Workshop 7 (Tổng kết)**: Đã hoàn thành đầy đủ mô-đun tổng kết với:
  - Tóm tắt toàn diện các thành tựu của workshop
  - Phần các khái niệm chính đã nắm vững bao gồm AZD, mẫu và Microsoft Foundry
  - Khuyến nghị tiếp tục hành trình học
  - Bài tập thách thức workshop kèm mức độ khó
  - Các liên kết phản hồi cộng đồng và hỗ trợ

- **📚 Mô-đun Workshop 3 (Phân tích)**: Đã cập nhật mục tiêu học tập với:
  - Hướng dẫn kích hoạt GitHub Copilot với MCP servers
  - Hiểu cấu trúc thư mục mẫu của AZD
  - Các mô hình tổ chức Infrastructure-as-code (Bicep)
  - Hướng dẫn lab thực hành

- **🔧 Mô-đun Workshop 6 (Dỡ bỏ)**: Đã hoàn thành với:
  - Mục tiêu dọn dẹp tài nguyên và quản lý chi phí
  - Sử dụng `azd down` để dỡ bỏ hạ tầng một cách an toàn
  - Hướng dẫn khôi phục dịch vụ Cognitive bị xóa mềm
  - Gợi ý khám phá thêm cho GitHub Copilot và Azure Portal

#### Đã sửa
- **🔗 Sửa liên kết hỏng**: Đã giải quyết 15+ liên kết nội bộ bị hỏng:
  - `docs/ai-foundry/ai-model-deployment.md`: Đã sửa các đường dẫn tới microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Đã chỉnh sửa đường dẫn ai-model-deployment.md và production-ai-practices.md
  - `docs/getting-started/first-project.md`: Đã thay thế cicd-integration.md không tồn tại bằng deployment-guide.md
  - `examples/retail-scenario.md`: Đã sửa đường dẫn FAQ và hướng dẫn khắc phục sự cố
  - `examples/container-app/microservices/README.md`: Đã chỉnh sửa đường dẫn trang chính của khóa học và hướng dẫn triển khai
  - `resources/faq.md` và `resources/glossary.md`: Đã cập nhật các tham chiếu chương AI
  - `course-outline.md`: Đã sửa các tham chiếu tới hướng dẫn giảng viên và lab workshop AI

- **📅 Banner Trạng thái Workshop**: Đã cập nhật từ "Under Construction" sang trạng thái workshop đang hoạt động với ngày tháng February 2026

- **🔗 Điều hướng Workshop**: Đã sửa các liên kết điều hướng hỏng trong workshop README.md trỏ tới thư mục lab-1-azd-basics không tồn tại

#### Đã thay đổi
- **Trình bày Workshop**: Đã loại cảnh báo "under construction", workshop hiện đã hoàn thiện và sẵn sàng sử dụng
- **Tính nhất quán điều hướng**: Đảm bảo tất cả các mô-đun workshop có điều hướng giữa các mô-đun đúng
- **Tham chiếu Lộ trình Học**: Đã cập nhật các tham chiếu chéo chương để sử dụng đường dẫn microsoft-foundry đúng

#### Đã xác thực
- ✅ Tất cả các tệp markdown tiếng Anh có các liên kết nội bộ hợp lệ
- ✅ Các mô-đun workshop 0-7 đã hoàn thành với mục tiêu học tập
- ✅ Điều hướng giữa các chương và mô-đun hoạt động chính xác
- ✅ Nội dung phù hợp cho các nhà phát triển AI sử dụng Microsoft AZD
- ✅ Ngôn ngữ và cấu trúc thân thiện với người mới vẫn được duy trì
- ✅ CONTRIBUTING.md cung cấp hướng dẫn rõ ràng cho những người đóng góp cộng đồng

#### Triển khai kỹ thuật
- **Xác thực liên kết**: Script PowerShell tự động đã kiểm tra tất cả các liên kết nội bộ .md
- **Kiểm toán nội dung**: Đánh giá thủ công về độ hoàn chỉnh của workshop và tính phù hợp cho người mới bắt đầu
- **Hệ thống điều hướng**: Áp dụng các mẫu điều hướng chương và mô-đun nhất quán

#### Ghi chú
- **Phạm vi**: Các thay đổi chỉ áp dụng cho tài liệu tiếng Anh
- **Bản dịch**: Thư mục bản dịch chưa được cập nhật trong phiên bản này (bản dịch tự động sẽ đồng bộ sau)
- **Thời lượng Workshop**: Workshop hoàn chỉnh hiện cung cấp 3-4 giờ học thực hành

---

### [v3.8.0] - 2025-11-19

#### Tài liệu Nâng cao: Giám sát, Bảo mật, và Mô hình Đa-tác nhân
**Phiên bản này thêm các bài học toàn diện đạt hạng A về tích hợp Application Insights, các mẫu xác thực, và phối hợp đa-tác nhân cho triển khai sản xuất.**

#### Đã thêm
- **📊 Bài học Tích hợp Application Insights**: trong `docs/pre-deployment/application-insights.md`:
  - Triển khai tập trung vào AZD với cấp phát tự động
  - Các mẫu Bicep hoàn chỉnh cho Application Insights + Log Analytics
  - Ứng dụng Python hoạt động với telemetry tùy chỉnh (1,200+ dòng)
  - Các mô hình giám sát AI/LLM (theo dõi token/chi phí Microsoft Foundry Models)
  - 6 sơ đồ Mermaid (kiến trúc, theo dõi phân tán, luồng telemetry)
  - 3 bài tập thực hành (cảnh báo, bảng điều khiển, giám sát AI)
  - Ví dụ truy vấn Kusto và chiến lược tối ưu chi phí
  - Phát luồng chỉ số trực tiếp và gỡ lỗi theo thời gian thực
  - Thời gian học 40-50 phút với các mẫu sẵn sàng cho sản xuất

- **🔐 Bài học Mẫu Xác thực & Bảo mật**: trong `docs/getting-started/authsecurity.md`:
  - 3 mẫu xác thực (connection strings, Key Vault, managed identity)
  - Các mẫu hạ tầng Bicep hoàn chỉnh cho triển khai an toàn
  - Mã ứng dụng Node.js với tích hợp Azure SDK
  - 3 bài tập hoàn chỉnh (kích hoạt managed identity, user-assigned identity, xoay vòng Key Vault)
  - Các thực hành tốt nhất về bảo mật và cấu hình RBAC
  - Hướng dẫn khắc phục sự cố và phân tích chi phí
  - Các mẫu xác thực không mật khẩu sẵn sàng cho môi trường sản xuất

- **🤖 Bài học Mô hình Phối hợp Đa-tác nhân**: trong `docs/pre-deployment/coordination-patterns.md`:
  - 5 mô hình phối hợp (tuần tự, song song, phân cấp, theo sự kiện, đồng thuận)
  - Triển khai dịch vụ điều phối hoàn chỉnh (Python/Flask, 1,500+ dòng)
  - 3 triển khai tác nhân chuyên dụng (Research, Writer, Editor)
  - Tích hợp Service Bus cho hàng đợi tin nhắn
  - Quản lý trạng thái Cosmos DB cho hệ phân tán
  - 6 sơ đồ Mermaid thể hiện tương tác giữa các tác nhân
  - 3 bài tập nâng cao (xử lý timeout, logic thử lại, circuit breaker)
  - Phân tích chi phí ($240-565/month) kèm chiến lược tối ưu hóa
  - Tích hợp Application Insights để giám sát

#### Được nâng cao
- **Chương Trước triển khai**: Hiện bao gồm các mô hình giám sát và phối hợp toàn diện
- **Chương Bắt đầu**: Được nâng cấp với các mẫu xác thực chuyên nghiệp
- **Sẵn sàng cho sản xuất**: Bao phủ hoàn chỉnh từ bảo mật đến quan sát
- **Đề cương Khóa học**: Đã cập nhật để tham chiếu các bài học mới ở Chương 3 và 6

#### Đã thay đổi
- **Tiến trình học**: Tích hợp bảo mật và giám sát tốt hơn xuyên suốt khóa học
- **Chất lượng Tài liệu**: Tiêu chuẩn hạng A nhất quán (95-97%) cho các bài học mới
- **Mô hình sản xuất**: Bao phủ end-to-end hoàn chỉnh cho triển khai doanh nghiệp

#### Cải thiện
- **Trải nghiệm nhà phát triển**: Lộ trình rõ ràng từ phát triển đến giám sát sản xuất
- **Tiêu chuẩn Bảo mật**: Các mẫu chuyên nghiệp cho xác thực và quản lý bí mật
- **Khả năng quan sát**: Tích hợp Application Insights hoàn chỉnh với AZD
- **Tải công việc AI**: Giám sát chuyên biệt cho Microsoft Foundry Models và hệ thống đa-tác nhân

#### Đã xác thực
- ✅ Tất cả bài học bao gồm mã hoạt động hoàn chỉnh (không phải đoạn mã)
- ✅ Sơ đồ Mermaid cho học trực quan (19 tổng cộng trên 3 bài học)
- ✅ Bài tập thực hành kèm các bước xác minh (tổng 9)
- ✅ Mẫu Bicep sẵn sàng cho sản xuất có thể triển khai bằng `azd up`
- ✅ Phân tích chi phí và chiến lược tối ưu hóa
- ✅ Hướng dẫn khắc phục sự cố và các thực hành tốt nhất
- ✅ Các điểm kiểm tra kiến thức kèm lệnh xác minh

#### Kết quả Đánh giá Tài liệu
- **docs/pre-deployment/application-insights.md**: - Hướng dẫn giám sát toàn diện
- **docs/getting-started/authsecurity.md**: - Các mẫu bảo mật chuyên nghiệp
- **docs/pre-deployment/coordination-patterns.md**: - Kiến trúc đa-tác nhân nâng cao
- **Nội dung Mới Tổng thể**: - Tiêu chuẩn chất lượng cao nhất quán

#### Triển khai Kỹ thuật
- **Application Insights**: Log Analytics + telemetry tùy chỉnh + theo dõi phân tán
- **Xác thực**: Managed Identity + Key Vault + mẫu RBAC
- **Đa-tác nhân**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Giám sát**: Live metrics + truy vấn Kusto + alerts + dashboards
- **Quản lý Chi phí**: Chiến lược lấy mẫu, chính sách lưu trữ, kiểm soát ngân sách

### [v3.7.0] - 2025-11-19

#### Cải thiện Chất lượng Tài liệu và Ví dụ Microsoft Foundry Models Mới
**Phiên bản này nâng cao chất lượng tài liệu trên toàn kho và thêm một ví dụ triển khai Microsoft Foundry Models hoàn chỉnh với giao diện chat gpt-4.1.**

#### Đã thêm
- **🤖 Ví dụ Chat Microsoft Foundry Models**: Triển khai gpt-4.1 hoàn chỉnh với triển khai hoạt động trong `examples/azure-openai-chat/`:
  - Hạ tầng Microsoft Foundry Models hoàn chỉnh (triển khai mô hình gpt-4.1)
  - Giao diện chat dòng lệnh Python với lịch sử hội thoại
  - Tích hợp Key Vault để lưu trữ khóa API an toàn
  - Theo dõi sử dụng token và ước tính chi phí
  - Giới hạn tần suất và xử lý lỗi
  - README toàn diện với hướng dẫn triển khai 35-45 phút
  - 11 tệp sẵn sàng cho sản xuất (Bicep templates, ứng dụng Python, cấu hình)
- **📚 Bài tập Tài liệu**: Thêm bài tập thực hành vào hướng dẫn cấu hình:
  - Bài tập 1: Cấu hình đa-môi trường (15 phút)
  - Bài tập 2: Thực hành quản lý bí mật (10 phút)
  - Tiêu chí thành công rõ ràng và các bước xác minh
- **✅ Xác minh Triển khai**: Thêm phần xác minh vào hướng dẫn triển khai:
  - Quy trình kiểm tra sức khỏe
  - Danh sách kiểm tra tiêu chí thành công
  - Đầu ra mong đợi cho tất cả các lệnh triển khai
  - Tài liệu tham khảo nhanh khắc phục sự cố

#### Được nâng cao
- **examples/README.md**: Đã cập nhật lên chất lượng hạng A (93%):
  - Đã thêm azure-openai-chat vào tất cả các phần liên quan
  - Cập nhật số lượng ví dụ cục bộ từ 3 lên 4
  - Đã thêm vào bảng Ví dụ Ứng dụng AI
  - Được tích hợp vào Quick Start cho Người dùng Trung cấp
  - Đã thêm vào phần Microsoft Foundry Templates
  - Cập nhật Ma trận So sánh và các phần tìm kiếm công nghệ
- **Chất lượng Tài liệu**: Cải thiện B+ (87%) → A- (92%) trên toàn thư mục docs:
  - Đã thêm các đầu ra mong đợi cho ví dụ lệnh quan trọng
  - Bao gồm các bước xác minh cho các thay đổi cấu hình
  - Nâng cao học thực hành với các bài tập thực tế

#### Đã thay đổi
- **Tiến trình học**: Tích hợp ví dụ AI tốt hơn cho người học trình độ trung cấp
- **Cấu trúc Tài liệu**: Nhiều bài tập thực tế hơn với kết quả rõ ràng
- **Quy trình Xác minh**: Thêm tiêu chí thành công rõ ràng vào các luồng công việc chính

#### Cải thiện
- **Trải nghiệm Nhà phát triển**: Triển khai Microsoft Foundry Models hiện mất 35-45 phút (so với 60-90 phút cho các phương án phức tạp)
- **Minh bạch Chi phí**: Ước tính chi phí rõ ràng ($50-200/month) cho ví dụ Microsoft Foundry Models
- **Lộ trình Học**: Các nhà phát triển AI có điểm khởi đầu rõ ràng với azure-openai-chat
- **Tiêu chuẩn Tài liệu**: Đầu ra mong đợi và bước xác minh nhất quán

#### Đã xác thực
- ✅ Ví dụ Microsoft Foundry Models hoạt động đầy đủ với `azd up`
- ✅ Tất cả 11 tệp triển khai đúng cú pháp
- ✅ Hướng dẫn README khớp với trải nghiệm triển khai thực tế
- ✅ Các liên kết tài liệu được cập nhật trên 8+ vị trí
- ✅ Mục lục ví dụ phản ánh chính xác 4 ví dụ cục bộ
- ✅ Không có liên kết ngoài trùng lặp trong các bảng
- ✅ Tất cả các tham chiếu điều hướng chính xác

#### Triển khai Kỹ thuật
- **Kiến trúc Microsoft Foundry Models**: gpt-4.1 + Key Vault + mô hình Container Apps
- **Bảo mật**: Sẵn sàng Managed Identity, bí mật trong Key Vault
- **Giám sát**: Tích hợp Application Insights
- **Quản lý Chi phí**: Theo dõi token và tối ưu sử dụng
- **Triển khai**: Một lệnh `azd up` cho thiết lập hoàn chỉnh

### [v3.6.0] - 2025-11-19

#### Cập nhật lớn: Ví dụ Triển khai Container App
**Phiên bản này giới thiệu các ví dụ triển khai ứng dụng container toàn diện, sẵn sàng cho sản xuất bằng Azure Developer CLI (AZD), kèm đầy đủ tài liệu và tích hợp vào lộ trình học.**

#### Đã thêm
- **🚀 Ví dụ Container App**: Các ví dụ cục bộ mới trong `examples/container-app/`:
  - [Hướng dẫn chính](examples/container-app/README.md): Tổng quan hoàn chỉnh về triển khai container, quick start, sản xuất và các mẫu nâng cao
  - [API Flask đơn giản](../../examples/container-app/simple-flask-api): REST API thân thiện cho người mới với scale-to-zero, health probes, giám sát và khắc phục sự cố
  - [Kiến trúc Microservices](../../examples/container-app/microservices): Triển khai đa dịch vụ sẵn sàng cho sản xuất (API Gateway, Product, Order, User, Notification), messaging bất đồng bộ, Service Bus, Cosmos DB, Azure SQL, theo dõi phân tán, blue-green/canary deployment
- **Thực hành tốt nhất**: Bảo mật, giám sát, tối ưu chi phí và hướng dẫn CI/CD cho khối lượng công việc container
- **Ví dụ mã**: Hoàn chỉnh `azure.yaml`, Bicep templates, và triển khai dịch vụ đa ngôn ngữ (Python, Node.js, C#, Go)
- **Kiểm thử & Khắc phục sự cố**: Kịch bản kiểm thử end-to-end, lệnh giám sát, hướng dẫn khắc phục sự cố

#### Đã thay đổi
- **README.md**: Đã cập nhật để giới thiệu và liên kết các ví dụ container app mới dưới "Local Examples - Container Applications"
- **examples/README.md**: Đã cập nhật để làm nổi bật ví dụ container app, thêm mục ma trận so sánh, và cập nhật tham chiếu công nghệ/kiến trúc
- **Đề cương Khóa học & Hướng dẫn Học tập**: Đã cập nhật để tham chiếu các ví dụ container app mới và các mẫu triển khai trong các chương liên quan

#### Đã xác thực
- ✅ Tất cả ví dụ mới có thể triển khai bằng `azd up` và tuân theo thực hành tốt nhất
- ✅ Các liên kết chéo tài liệu và điều hướng đã được cập nhật
- ✅ Ví dụ bao phủ từ kịch bản cho người mới đến nâng cao, bao gồm microservices sản xuất

#### Ghi chú
- **Phạm vi**: Chỉ tài liệu và ví dụ tiếng Anh
- **Bước tiếp theo**: Mở rộng với các mẫu container nâng cao bổ sung và tự động hóa CI/CD trong các phiên bản sau

### [v3.5.0] - 2025-11-19

#### Đổi thương hiệu Sản phẩm: Microsoft Foundry
**Phiên bản này thực hiện thay đổi tên sản phẩm toàn diện từ "Microsoft Foundry" sang "Microsoft Foundry" trên toàn bộ tài liệu tiếng Anh, phản ánh việc đổi thương hiệu chính thức của Microsoft.**

#### Đã thay đổi
- **🔄 Cập nhật Tên Sản phẩm**: Thay đổi thương hiệu toàn diện từ "Microsoft Foundry" sang "Microsoft Foundry"
  - Đã cập nhật tất cả các tham chiếu trong tài liệu tiếng Anh trong thư mục `docs/`
  - Đã đổi tên thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Đổi tên tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tổng cộng: 23 tham chiếu nội dung được cập nhật trên 7 tệp tài liệu

- **📁 Thay đổi cấu trúc thư mục**:
  - `docs/ai-foundry/` được đổi tên thành `docs/microsoft-foundry/`
  - Tất cả các tham chiếu chéo đã được cập nhật để phản ánh cấu trúc thư mục mới
  - Các liên kết điều hướng đã được xác thực trên toàn bộ tài liệu

- **📄 Đổi tên tệp**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tất cả các liên kết nội bộ đã được cập nhật để tham chiếu tên tệp mới

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

- **Tệp cấu trúc khoá học** (2 tệp):
  - `README.md` - 17 tham chiếu được cập nhật (tổng quan khoá học, tiêu đề chương, phần mẫu, thông tin cộng đồng)
  - `course-outline.md` - 14 tham chiếu được cập nhật (tổng quan, mục tiêu học tập, tài nguyên chương)

#### Đã xác thực
- ✅ Không còn tham chiếu đường dẫn thư mục "ai-foundry" trong tài liệu tiếng Anh
- ✅ Không còn tham chiếu tên sản phẩm "Microsoft Foundry" trong tài liệu tiếng Anh
- ✅ Tất cả liên kết điều hướng hoạt động với cấu trúc thư mục mới
- ✅ Việc đổi tên tệp và thư mục đã hoàn tất thành công
- ✅ Các tham chiếu chéo giữa các chương đã được xác thực

#### Ghi chú
- **Phạm vi**: Các thay đổi được áp dụng chỉ cho tài liệu tiếng Anh trong thư mục `docs/`
- **Bản dịch**: Các thư mục dịch (`translations/`) chưa được cập nhật trong phiên bản này
- **Workshop**: Tài liệu workshop (`workshop/`) chưa được cập nhật trong phiên bản này
- **Ví dụ**: Các tệp ví dụ có thể vẫn tham chiếu tên cũ (sẽ được xử lý trong cập nhật sau)
- **Liên kết bên ngoài**: Các URL bên ngoài và tham chiếu kho lưu trữ GitHub vẫn không thay đổi

#### Hướng dẫn di chuyển cho người đóng góp
Nếu bạn có các nhánh cục bộ hoặc tài liệu tham chiếu cấu trúc cũ:
1. Cập nhật tham chiếu thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Cập nhật tham chiếu tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Thay thế tên sản phẩm: "Microsoft Foundry" → "Microsoft Foundry"
4. Xác thực rằng tất cả các liên kết nội bộ vẫn hoạt động

---

### [v3.4.0] - 2025-10-24

#### Tăng cường Xem trước Hạ tầng và Xác thực
**Phiên bản này giới thiệu hỗ trợ toàn diện cho tính năng xem trước mới của Azure Developer CLI và nâng cao trải nghiệm người dùng workshop.**

#### Đã thêm
- **🧪 Tài liệu tính năng azd provision --preview**: Bao quát toàn diện khả năng xem trước hạ tầng mới
  - Tham chiếu lệnh và ví dụ sử dụng trong cheat sheet
  - Tích hợp chi tiết vào hướng dẫn provisioning với các trường hợp sử dụng và lợi ích
  - Tích hợp kiểm tra trước khi bay để xác thực triển khai an toàn hơn
  - Cập nhật hướng dẫn bắt đầu với thực hành triển khai an toàn làm ưu tiên
- **🚧 Thanh trạng thái Workshop**: Biểu ngữ HTML chuyên nghiệp chỉ trạng thái phát triển của workshop
  - Thiết kế gradient với chỉ báo đang xây dựng để truyền thông rõ ràng đến người dùng
  - Dấu thời gian cập nhật lần cuối để minh bạch
  - Thiết kế đáp ứng cho thiết bị di động

#### Được cải tiến
- **An toàn Hạ tầng**: Chức năng xem trước được tích hợp khắp tài liệu triển khai
- **Xác thực trước triển khai**: Các script tự động hiện bao gồm kiểm tra xem trước hạ tầng
- **Luồng công việc cho nhà phát triển**: Cập nhật chuỗi lệnh để bao gồm preview như thực hành tốt nhất
- **Trải nghiệm Workshop**: Thiết lập kỳ vọng rõ ràng cho người dùng về trạng thái phát triển nội dung

#### Thay đổi
- **Thực hành tốt khi triển khai**: Khuyến nghị luồng làm việc ưu tiên xem trước
- **Luồng tài liệu**: Xác thực hạ tầng được đưa lên sớm hơn trong quy trình học
- **Trình bày Workshop**: Giao tiếp trạng thái chuyên nghiệp với dòng thời gian phát triển rõ ràng

#### Cải thiện
- **Tiếp cận theo nguyên tắc an toàn**: Các thay đổi hạ tầng giờ có thể được xác thực trước khi triển khai
- **Hợp tác đội ngũ**: Kết quả xem trước có thể chia sẻ để xem xét và phê duyệt
- **Nhận thức chi phí**: Hiểu rõ chi phí tài nguyên trước khi provision
- **Giảm rủi ro**: Giảm lỗi triển khai thông qua xác thực trước

#### Triển khai Kỹ thuật
- **Tích hợp nhiều tài liệu**: Tính năng xem trước được ghi chép trong 4 tệp chính
- **Mẫu lệnh**: Cú pháp và ví dụ nhất quán khắp tài liệu
- **Tích hợp thực hành tốt nhất**: Preview được đưa vào quy trình xác thực và script
- **Chỉ báo trực quan**: Đánh dấu tính năng MỚI rõ ràng để dễ khám phá

#### Hạ tầng Workshop
- **Truyền thông trạng thái**: Biểu ngữ HTML chuyên nghiệp với kiểu gradient
- **Trải nghiệm người dùng**: Trạng thái phát triển rõ ràng tránh gây nhầm lẫn
- **Trình bày chuyên nghiệp**: Duy trì độ tin cậy của kho lưu trữ đồng thời đặt kỳ vọng
- **Minh bạch dòng thời gian**: Dấu thời gian cập nhật lần cuối tháng Mười 2025 để chịu trách nhiệm

### [v3.3.0] - 2025-09-24

#### Tài liệu Workshop được cải tiến và Trải nghiệm học tương tác
**Phiên bản này giới thiệu tài liệu workshop toàn diện với hướng dẫn tương tác trên trình duyệt và lộ trình học có cấu trúc.**

#### Đã thêm
- **🎥 Hướng dẫn Workshop tương tác**: Trải nghiệm workshop trên trình duyệt với khả năng xem trước MkDocs
- **📝 Hướng dẫn Workshop có cấu trúc**: Lộ trình học 7 bước có hướng dẫn từ khám phá đến tuỳ chỉnh
  - 0-Introduction: Tổng quan workshop và thiết lập
  - 1-Select-AI-Template: Quy trình khám phá và lựa chọn mẫu
  - 2-Validate-AI-Template: Quy trình triển khai và xác thực
  - 3-Deconstruct-AI-Template: Hiểu kiến trúc mẫu
  - 4-Configure-AI-Template: Cấu hình và tuỳ chỉnh
  - 5-Customize-AI-Template: Điều chỉnh nâng cao và lặp lại
  - 6-Teardown-Infrastructure: Dọn dẹp và quản lý tài nguyên
  - 7-Wrap-up: Tóm tắt và các bước tiếp theo
- **🛠️ Công cụ Workshop**: Cấu hình MkDocs với theme Material để nâng cao trải nghiệm học
- **🎯 Lộ trình học thực hành**: Phương pháp 3 bước (Khám phá → Triển khai → Tuỳ chỉnh)
- **📱 Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển liền mạch

#### Được cải tiến
- **AI Workshop Lab**: Mở rộng với trải nghiệm học có cấu trúc 2-3 giờ toàn diện
- **Tài liệu Workshop**: Trình bày chuyên nghiệp với điều hướng và hỗ trợ trực quan
- **Tiến trình học**: Hướng dẫn từng bước rõ ràng từ chọn mẫu đến triển khai sản xuất
- **Trải nghiệm nhà phát triển**: Công cụ tích hợp cho quy trình phát triển trơn tru

#### Cải thiện
- **Khả năng tiếp cận**: Giao diện trình duyệt với tìm kiếm, chức năng sao chép và chuyển đổi giao diện
- **Học tự định tốc độ**: Cấu trúc workshop linh hoạt phù hợp nhiều tốc độ học khác nhau
- **Ứng dụng thực tế**: Tình huống triển khai mẫu AI trong thế giới thực
- **Tích hợp cộng đồng**: Tích hợp Discord để hỗ trợ và hợp tác workshop

#### Tính năng Workshop
- **Tìm kiếm tích hợp**: Tìm kiếm nhanh qua từ khoá và bài học
- **Sao chép khối mã**: Chức năng hover-to-copy cho tất cả ví dụ mã
- **Chuyển đổi giao diện**: Hỗ trợ chế độ tối/sáng
- **Tài sản trực quan**: Ảnh chụp màn hình và sơ đồ để tăng hiểu biết
- **Tích hợp trợ giúp**: Truy cập Discord trực tiếp để hỗ trợ cộng đồng

### [v3.2.0] - 2025-09-17

#### Tái cấu trúc điều hướng lớn và Hệ thống học theo chương
**Phiên bản này giới thiệu cấu trúc học theo chương toàn diện cùng với điều hướng được cải tiến khắp kho lưu trữ.**

#### Đã thêm
- **📚 Hệ thống học theo chương**: Tổ chức lại toàn bộ khoá học thành 8 chương học tiến bộ
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Hệ thống điều hướng toàn diện**: Header và footer điều hướng nhất quán khắp tài liệu
- **🎯 Theo dõi tiến độ**: Danh sách kiểm tra hoàn thành khoá học và hệ thống xác minh học tập
- **🗺️ Hướng dẫn lộ trình học**: Điểm vào rõ ràng cho các cấp độ và mục tiêu khác nhau
- **🔗 Điều hướng tham chiếu chéo**: Các chương liên quan và tiền đề được liên kết rõ ràng

#### Được cải tiến
- **Cấu trúc README**: Chuyển đổi thành nền tảng học có cấu trúc theo chương
- **Điều hướng tài liệu**: Mỗi trang giờ bao gồm ngữ cảnh chương và hướng dẫn tiến trình
- **Tổ chức mẫu**: Ví dụ và mẫu được ánh xạ vào chương học phù hợp
- **Tích hợp tài nguyên**: Cheat sheets, FAQ và hướng dẫn học liên kết tới chương tương ứng
- **Tích hợp Workshop**: Lab thực hành được gán cho nhiều mục tiêu học chương

#### Thay đổi
- **Tiến trình học**: Chuyển từ tài liệu tuyến tính sang học theo chương linh hoạt
- **Vị trí hướng dẫn cấu hình**: Di chuyển hướng dẫn cấu hình thành Chapter 3 để phù hợp luồng học
- **Tích hợp nội dung AI**: Tích hợp tốt hơn nội dung chuyên về AI suốt quá trình học
- **Nội dung sản xuất**: Các mẫu nâng cao được tập trung trong Chapter 8 cho người học doanh nghiệp

#### Cải thiện
- **Trải nghiệm người dùng**: Breadcrumbs điều hướng rõ ràng và chỉ báo tiến trình chương
- **Khả năng tiếp cận**: Mẫu điều hướng nhất quán giúp dễ dàng duyệt khoá học
- **Trình bày chuyên nghiệp**: Cấu trúc khoá học theo phong cách đại học phù hợp đào tạo học thuật và doanh nghiệp
- **Hiệu quả học tập**: Rút ngắn thời gian tìm nội dung liên quan nhờ tổ chức tốt hơn

#### Triển khai Kỹ thuật
- **Header điều hướng**: Chuẩn hóa điều hướng chương trên 40+ tệp tài liệu
- **Footer điều hướng**: Hướng dẫn tiến trình và chỉ báo hoàn thành chương nhất quán
- **Liên kết chéo**: Hệ thống liên kết nội bộ toàn diện kết nối các khái niệm liên quan
- **Ánh xạ chương**: Mẫu và ví dụ được liên kết rõ ràng với mục tiêu học

#### Nâng cấp Hướng dẫn học
- **📚 Mục tiêu học toàn diện**: Tái cấu trúc hướng dẫn học cho phù hợp hệ thống 8 chương
- **🎯 Đánh giá theo chương**: Mỗi chương bao gồm mục tiêu học cụ thể và bài tập thực hành
- **📋 Theo dõi tiến độ**: Lịch học tuần với kết quả đo lường và danh sách kiểm tra hoàn thành
- **❓ Câu hỏi đánh giá**: Câu hỏi kiểm tra kiến thức cho mỗi chương với kết quả chuyên nghiệp
- **🛠️ Bài tập thực hành**: Hoạt động thực hành với kịch bản triển khai thực tế và gỡ rối
- **📊 Tiến trình kỹ năng**: Tiến bộ rõ ràng từ khái niệm cơ bản đến mẫu doanh nghiệp với trọng tâm phát triển nghề nghiệp
- **🎓 Khung chứng nhận**: Kết quả phát triển chuyên môn và hệ thống công nhận cộng đồng
- **⏱️ Quản lý thời gian**: Kế hoạch học 10 tuần có cấu trúc với xác thực mốc

### [v3.1.0] - 2025-09-17

#### Cải tiến Multi-Agent AI Solutions
**Phiên bản này cải thiện giải pháp bán lẻ đa tác nhân với đặt tên tác nhân tốt hơn và tài liệu được nâng cao.**

#### Thay đổi
- **Thuật ngữ Multi-Agent**: Thay thế "Cora agent" bằng "Customer agent" trong toàn bộ giải pháp đa tác nhân bán lẻ để dễ hiểu hơn
- **Kiến trúc tác nhân**: Cập nhật tất cả tài liệu, ARM templates và ví dụ mã để dùng tên "Customer agent" nhất quán
- **Ví dụ cấu hình**: Hiện đại hoá mẫu cấu hình tác nhân với quy ước đặt tên cập nhật
- **Tính nhất quán tài liệu**: Đảm bảo tất cả tham chiếu sử dụng tên tác nhân mô tả và chuyên nghiệp

#### Được cải tiến
- **Gói ARM Template**: Cập nhật retail-multiagent-arm-template với tham chiếu Customer agent
- **Sơ đồ kiến trúc**: Làm mới sơ đồ Mermaid với tên tác nhân cập nhật
- **Ví dụ mã**: Các lớp Python và ví dụ triển khai giờ dùng CustomerAgent naming
- **Biến môi trường**: Cập nhật tất cả script triển khai để sử dụng CUSTOMER_AGENT_NAME conventions

#### Cải thiện
- **Trải nghiệm nhà phát triển**: Vai trò và trách nhiệm tác nhân rõ ràng hơn trong tài liệu
- **Sẵn sàng sản xuất**: Phù hợp hơn với quy ước đặt tên doanh nghiệp
- **Tài liệu học**: Đặt tên tác nhân trực quan hơn cho mục đích giáo dục
- **Tính khả dụng mẫu**: Hiểu các chức năng tác nhân và mẫu triển khai đơn giản hơn

#### Chi tiết kỹ thuật
- Cập nhật sơ đồ kiến trúc Mermaid với tham chiếu CustomerAgent
- Thay thế tên lớp CoraAgent bằng CustomerAgent trong ví dụ Python
- Sửa cấu hình JSON trong ARM template để dùng loại tác nhân "customer"
- Cập nhật biến môi trường từ CORA_AGENT_* sang CUSTOMER_AGENT_* patterns
- Làm mới tất cả lệnh triển khai và cấu hình container

### [v3.0.0] - 2025-09-12

#### Thay đổi lớn - Tập trung cho nhà phát triển AI và tích hợp Microsoft Foundry
**Phiên bản này biến kho lưu trữ thành tài nguyên học tập toàn diện tập trung vào AI với hướng dẫn tích hợp Microsoft Foundry.**

#### Đã thêm
- **🤖 Lộ trình học AI-First**: Tái cấu trúc hoàn chỉnh ưu tiên cho nhà phát triển và kỹ sư AI
- **Hướng dẫn tích hợp Microsoft Foundry**: Tài liệu toàn diện để kết nối AZD với dịch vụ Microsoft Foundry
- **Mẫu triển khai mô hình AI**: Hướng dẫn chi tiết bao gồm lựa chọn mô hình, cấu hình và chiến lược triển khai sản xuất
- **AI Workshop Lab**: Hội thảo thực hành 2-3 giờ để chuyển đổi các ứng dụng AI thành các giải pháp có thể triển khai bằng AZD
- **Production AI Best Practices**: Các mẫu sẵn sàng cho doanh nghiệp để mở rộng, giám sát và bảo mật khối lượng công việc AI
- **AI-Specific Troubleshooting Guide**: Hướng dẫn khắc phục sự cố toàn diện cho Microsoft Foundry Models, Cognitive Services và các vấn đề triển khai AI
- **AI Template Gallery**: Bộ sưu tập mẫu Microsoft Foundry nổi bật kèm đánh giá mức độ phức tạp
- **Workshop Materials**: Cấu trúc hội thảo hoàn chỉnh với các bài lab thực hành và tài liệu tham khảo

#### Nâng cao
- **README Structure**: Tập trung vào nhà phát triển AI với dữ liệu quan tâm cộng đồng 45% từ Microsoft Foundry Discord
- **Learning Paths**: Lộ trình học dành riêng cho nhà phát triển AI bên cạnh các lộ trình truyền thống cho sinh viên và kỹ sư DevOps
- **Template Recommendations**: Các mẫu AI nổi bật bao gồm azure-search-openai-demo, contoso-chat, và openai-chat-app-quickstart
- **Community Integration**: Hỗ trợ cộng đồng Discord nâng cao với các kênh và thảo luận chuyên về AI

#### Bảo mật & Tập trung vào Sản xuất
- **Managed Identity Patterns**: Cấu hình xác thực và bảo mật chuyên cho AI
- **Cost Optimization**: Theo dõi sử dụng token và kiểm soát ngân sách cho khối lượng công việc AI
- **Multi-Region Deployment**: Chiến lược triển khai ứng dụng AI trên toàn cầu
- **Performance Monitoring**: Các chỉ số chuyên cho AI và tích hợp Application Insights

#### Chất lượng Tài liệu
- **Linear Course Structure**: Tiến trình logic từ các mẫu triển khai AI cho người mới đến nâng cao
- **Validated URLs**: Tất cả liên kết kho bên ngoài đã được xác minh và có thể truy cập
- **Complete Reference**: Tất cả liên kết tài liệu nội bộ đã được xác thực và hoạt động
- **Production Ready**: Các mẫu triển khai doanh nghiệp với ví dụ thực tế

### [v2.0.0] - 2025-09-09

#### Thay đổi chính - Tái cấu trúc kho và Nâng cấp chuyên nghiệp
**Phiên bản này đại diện cho một thay đổi lớn về cấu trúc kho và cách trình bày nội dung.**

#### Đã thêm
- **Structured Learning Framework**: Tất cả các trang tài liệu hiện bao gồm phần Giới thiệu, Mục tiêu học tập và Kết quả học tập
- **Navigation System**: Thêm liên kết bài học Trước/Sau trên toàn bộ tài liệu để hướng dẫn tiến trình học
- **Study Guide**: study-guide.md toàn diện với mục tiêu học tập, bài tập thực hành và tài liệu đánh giá
- **Professional Presentation**: Loại bỏ tất cả biểu tượng emoji để cải thiện khả năng truy cập và giao diện chuyên nghiệp
- **Enhanced Content Structure**: Cải thiện tổ chức và luồng nội dung học tập

#### Đã thay đổi
- **Documentation Format**: Chuẩn hóa tất cả tài liệu với cấu trúc tập trung vào học tập nhất quán
- **Navigation Flow**: Triển khai tiến trình logic xuyên suốt các tài liệu học
- **Content Presentation**: Loại bỏ các yếu tố trang trí để ưu tiên định dạng rõ ràng, chuyên nghiệp
- **Link Structure**: Cập nhật tất cả liên kết nội bộ để hỗ trợ hệ thống điều hướng mới

#### Đã cải thiện
- **Accessibility**: Loại bỏ phụ thuộc emoji để tương thích tốt hơn với trình đọc màn hình
- **Professional Appearance**: Trình bày gọn, phong cách học thuật phù hợp cho đào tạo doanh nghiệp
- **Learning Experience**: Phương pháp có cấu trúc với mục tiêu và kết quả rõ ràng cho mỗi bài học
- **Content Organization**: Luồng logic và kết nối tốt hơn giữa các chủ đề liên quan

### [v1.0.0] - 2025-09-09

#### Phát hành ban đầu - Kho học tập AZD toàn diện

#### Đã thêm
- **Core Documentation Structure**
  - Chuỗi hướng dẫn getting-started hoàn chỉnh
  - Tài liệu triển khai và cung cấp đầy đủ
  - Tài nguyên khắc phục sự cố và hướng dẫn gỡ lỗi chi tiết
  - Công cụ và quy trình xác thực trước khi triển khai

- **Getting Started Module**
  - AZD Basics: Các khái niệm và thuật ngữ cốt lõi
  - Installation Guide: Hướng dẫn cài đặt theo nền tảng
  - Configuration Guide: Thiết lập môi trường và xác thực
  - First Project Tutorial: Hướng dẫn tạo dự án đầu tiên theo từng bước

- **Deployment and Provisioning Module**
  - Deployment Guide: Tài liệu quy trình làm việc hoàn chỉnh
  - Provisioning Guide: Hạ tầng như mã với Bicep
  - Các thực hành tốt nhất cho triển khai sản xuất
  - Các mẫu kiến trúc nhiều dịch vụ

- **Pre-deployment Validation Module**
  - Capacity Planning: Xác thực khả năng sẵn có tài nguyên Azure
  - SKU Selection: Hướng dẫn toàn diện về cấp dịch vụ
  - Pre-flight Checks: Script xác thực tự động (PowerShell và Bash)
  - Công cụ ước tính chi phí và lập kế hoạch ngân sách

- **Troubleshooting Module**
  - Common Issues: Các vấn đề thường gặp và giải pháp
  - Debugging Guide: Phương pháp khắc phục sự cố có hệ thống
  - Kỹ thuật chẩn đoán nâng cao và công cụ
  - Giám sát hiệu năng và tối ưu hóa

- **Resources and References**
  - Command Cheat Sheet: Tham khảo nhanh các lệnh thiết yếu
  - Glossary: Định nghĩa thuật ngữ và viết tắt toàn diện
  - FAQ: Câu trả lời chi tiết cho các câu hỏi thường gặp
  - Liên kết tài nguyên bên ngoài và kết nối cộng đồng

- **Examples and Templates**
  - Ví dụ Ứng dụng Web đơn giản
  - Mẫu triển khai Website tĩnh
  - Cấu hình Ứng dụng Container
  - Mẫu tích hợp cơ sở dữ liệu
  - Ví dụ kiến trúc Microservices
  - Triển khai hàm serverless

#### Tính năng
- **Multi-Platform Support**: Hướng dẫn cài đặt và cấu hình cho Windows, macOS và Linux
- **Multiple Skill Levels**: Nội dung thiết kế cho từ sinh viên đến nhà phát triển chuyên nghiệp
- **Practical Focus**: Ví dụ thực hành và các kịch bản thực tế
- **Comprehensive Coverage**: Từ khái niệm cơ bản đến các mẫu doanh nghiệp nâng cao
- **Security-First Approach**: Các thực hành bảo mật tích hợp xuyên suốt
- **Cost Optimization**: Hướng dẫn triển khai tiết kiệm chi phí và quản lý tài nguyên

#### Chất lượng Tài liệu
- **Detailed Code Examples**: Ví dụ mã thực tế, đã kiểm thử
- **Step-by-Step Instructions**: Hướng dẫn rõ ràng, có thể hành động
- **Comprehensive Error Handling**: Khắc phục lỗi cho các vấn đề thường gặp
- **Best Practices Integration**: Tiêu chuẩn ngành và khuyến nghị
- **Version Compatibility**: Cập nhật với các dịch vụ Azure mới nhất và tính năng azd

## Các cải tiến dự kiến trong tương lai

### Version 3.1.0 (Dự kiến)
#### Mở rộng nền tảng AI
- **Multi-Model Support**: Các mẫu tích hợp cho Hugging Face, Azure Machine Learning và các mô hình tùy chỉnh
- **AI Agent Frameworks**: Mẫu cho LangChain, Semantic Kernel và AutoGen
- **Advanced RAG Patterns**: Lựa chọn cơ sở dữ liệu vector ngoài Azure AI Search (Pinecone, Weaviate, v.v.)
- **AI Observability**: Giám sát nâng cao cho hiệu suất mô hình, sử dụng token và chất lượng phản hồi

#### Trải nghiệm nhà phát triển
- **VS Code Extension**: Trải nghiệm phát triển tích hợp AZD + Microsoft Foundry trong VS Code
- **GitHub Copilot Integration**: Trợ giúp tạo mẫu AZD bằng AI
- **Interactive Tutorials**: Bài tập mã thực hành với xác thực tự động cho các kịch bản AI
- **Video Content**: Nội dung video bổ sung cho người học trực quan tập trung vào triển khai AI

### Version 4.0.0 (Dự kiến)
#### Mẫu AI cho doanh nghiệp
- **Governance Framework**: Quản trị mô hình AI, tuân thủ và theo dõi kiểm toán
- **Multi-Tenant AI**: Mẫu phục vụ nhiều khách hàng với dịch vụ AI được cô lập
- **Edge AI Deployment**: Tích hợp với Azure IoT Edge và các instance container
- **Hybrid Cloud AI**: Mẫu triển khai đa đám mây và hybrid cho khối lượng công việc AI

#### Tính năng nâng cao
- **AI Pipeline Automation**: Tích hợp MLOps với pipeline của Azure Machine Learning
- **Advanced Security**: Mô hình zero-trust, private endpoints và bảo vệ nâng cao chống mối đe dọa
- **Performance Optimization**: Tối ưu và điều chỉnh nâng cao cho các ứng dụng AI có throughput cao
- **Global Distribution**: Mẫu phân phối nội dung và cache tại edge cho ứng dụng AI

### Version 3.0.0 (Dự kiến) - Đã bị thay thế bởi Bản phát hành hiện tại
#### Các bổ sung đề xuất - Hiện đã triển khai trong v3.0.0
- ✅ **AI-Focused Content**: Tích hợp Microsoft Foundry toàn diện (Hoàn thành)
- ✅ **Interactive Tutorials**: Phòng thí nghiệm hội thảo AI thực hành (Hoàn thành)
- ✅ **Advanced Security Module**: Mẫu bảo mật chuyên cho AI (Hoàn thành)
- ✅ **Performance Optimization**: Chiến lược tinh chỉnh khối lượng công việc AI (Hoàn thành)

### Version 2.1.0 (Dự kiến) - Một phần đã triển khai trong v3.0.0
#### Cải tiến nhỏ - Một số đã hoàn thành trong bản phát hành hiện tại
- ✅ **Additional Examples**: Kịch bản triển khai tập trung vào AI (Hoàn thành)
- ✅ **Extended FAQ**: Câu hỏi và khắc phục sự cố chuyên cho AI (Hoàn thành)
- **Tool Integration**: Hướng dẫn tích hợp IDE và trình soạn thảo nâng cao
- ✅ **Monitoring Expansion**: Mở rộng giám sát và cảnh báo chuyên cho AI (Hoàn thành)

#### Vẫn dự kiến cho bản phát hành tương lai
- **Mobile-Friendly Documentation**: Thiết kế đáp ứng cho học trên di động
- **Offline Access**: Gói tài liệu có thể tải về để sử dụng ngoại tuyến
- **Enhanced IDE Integration**: Tiện ích mở rộng VS Code cho luồng công việc AZD + AI
- **Community Dashboard**: Thông số cộng đồng theo thời gian thực và theo dõi đóng góp

## Đóng góp vào Changelog

### Báo cáo Thay đổi
Khi đóng góp vào kho này, vui lòng đảm bảo mục trong changelog bao gồm:

1. **Version Number**: Theo Semantic Versioning (major.minor.patch)
2. **Date**: Ngày phát hành hoặc cập nhật theo định dạng YYYY-MM-DD
3. **Category**: Đã thêm, Đã thay đổi, Bị ngừng hỗ trợ, Đã xóa, Sửa lỗi, Bảo mật
4. **Clear Description**: Mô tả ngắn gọn về những gì đã thay đổi
5. **Impact Assessment**: Ảnh hưởng của thay đổi đối với người dùng hiện tại

### Các danh mục thay đổi

#### Đã thêm
- Tính năng mới, phần tài liệu hoặc khả năng mới
- Ví dụ, mẫu hoặc tài nguyên học tập mới
- Công cụ, script hoặc tiện ích bổ sung

#### Đã thay đổi
- Sửa đổi chức năng hoặc tài liệu hiện có
- Cập nhật để cải thiện độ rõ ràng hoặc tính chính xác
- Tái cấu trúc nội dung hoặc tổ chức

#### Bị ngừng hỗ trợ
- Các tính năng hoặc phương pháp đang được loại bỏ dần
- Phần tài liệu dự kiến bị xóa
- Các phương pháp có lựa chọn thay thế tốt hơn

#### Đã xóa
- Tính năng, tài liệu hoặc ví dụ không còn phù hợp
- Thông tin lỗi thời hoặc phương pháp đã bị ngừng
- Nội dung dư thừa hoặc đã được hợp nhất

#### Sửa lỗi
- Sửa lỗi trong tài liệu hoặc mã
- Giải quyết các vấn đề đã báo cáo
- Cải thiện tính chính xác hoặc chức năng

#### Bảo mật
- Cải tiến hoặc sửa lỗi liên quan đến bảo mật
- Cập nhật thực hành bảo mật tốt nhất
- Khắc phục lỗ hổng bảo mật

### Hướng dẫn Semantic Versioning

#### Major Version (X.0.0)
- Các thay đổi phá vỡ tương thích cần hành động từ người dùng
- Tái cấu trúc lớn về nội dung hoặc tổ chức
- Thay đổi làm biến đổi phương pháp tiếp cận nền tảng

#### Minor Version (X.Y.0)
- Tính năng mới hoặc bổ sung nội dung
- Nâng cấp giữ tương thích ngược
- Ví dụ, công cụ hoặc tài nguyên bổ sung

#### Patch Version (X.Y.Z)
- Sửa lỗi và hiệu chỉnh
- Cải tiến nhỏ cho nội dung hiện có
- Làm rõ và nâng cấp nhỏ

## Phản hồi và đề xuất từ cộng đồng

Chúng tôi khuyến khích tích cực phản hồi từ cộng đồng để cải thiện nguồn học này:

### Cách gửi phản hồi
- **GitHub Issues**: Báo cáo vấn đề hoặc đề xuất cải tiến (vấn đề chuyên về AI được hoan nghênh)
- **Discord Discussions**: Chia sẻ ý tưởng và tham gia cộng đồng Microsoft Foundry
- **Pull Requests**: Đóng góp cải tiến trực tiếp cho nội dung, đặc biệt là mẫu và hướng dẫn AI
- **Microsoft Foundry Discord**: Tham gia kênh #Azure để thảo luận về AZD + AI
- **Community Forums**: Tham gia thảo luận rộng hơn cho nhà phát triển Azure

### Các loại phản hồi
- **AI Content Accuracy**: Sửa lỗi cho tích hợp dịch vụ AI và thông tin triển khai
- **Learning Experience**: Đề xuất cải thiện luồng học cho nhà phát triển AI
- **Missing AI Content**: Yêu cầu thêm mẫu, mẫu thiết kế hoặc ví dụ AI
- **Accessibility**: Cải tiến cho nhu cầu học đa dạng
- **AI Tool Integration**: Đề xuất tích hợp luồng công việc phát triển AI tốt hơn
- **Production AI Patterns**: Yêu cầu mẫu triển khai AI cho doanh nghiệp

### Cam kết phản hồi
- **Issue Response**: Trong vòng 48 giờ cho các vấn đề được báo cáo
- **Feature Requests**: Đánh giá trong vòng một tuần
- **Community Contributions**: Xem xét trong vòng một tuần
- **Security Issues**: Ưu tiên ngay lập tức với phản hồi khẩn trương

## Lịch bảo trì

### Cập nhật định kỳ
- **Monthly Reviews**: Đánh giá độ chính xác nội dung và xác thực liên kết hàng tháng
- **Quarterly Updates**: Bổ sung và cải tiến nội dung lớn hàng quý
- **Semi-Annual Reviews**: Tái cấu trúc và nâng cao toàn diện nửa năm
- **Annual Releases**: Phát hành phiên bản chính hàng năm với cải tiến đáng kể

### Giám sát và Đảm bảo chất lượng
- **Automated Testing**: Xác thực định kỳ các ví dụ mã và liên kết
- **Community Feedback Integration**: Tích hợp định kỳ phản hồi người dùng
- **Technology Updates**: Đồng bộ với các dịch vụ Azure mới nhất và bản phát hành azd
- **Accessibility Audits**: Xem xét thường xuyên theo các nguyên tắc thiết kế bao trùm

## Chính sách Hỗ trợ Phiên bản

### Hỗ trợ phiên bản hiện tại
- **Latest Major Version**: Hỗ trợ đầy đủ với các cập nhật định kỳ
- **Previous Major Version**: Cập nhật bảo mật và sửa lỗi quan trọng trong 12 tháng
- **Legacy Versions**: Chỉ hỗ trợ cộng đồng, không có cập nhật chính thức

### Hướng dẫn di chuyển
Khi phát hành các phiên bản lớn, chúng tôi cung cấp:
- **Migration Guides**: Hướng dẫn chuyển đổi từng bước
- **Compatibility Notes**: Chi tiết về các thay đổi phá vỡ tương thích
- **Tool Support**: Script hoặc tiện ích hỗ trợ di chuyển
- **Community Support**: Diễn đàn dành riêng cho câu hỏi về di chuyển

---

**Điều hướng**
- **Bài học trước**: [Hướng dẫn học](resources/study-guide.md)
- **Bài học tiếp theo**: Quay lại [README chính](README.md)

**Luôn cập nhật**: Theo dõi kho lưu trữ này để nhận thông báo về các bản phát hành mới và các cập nhật quan trọng cho tài liệu học.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->