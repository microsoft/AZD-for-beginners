# Nhật ký thay đổi - AZD Cho Người Mới Bắt Đầu

## Giới thiệu

Nhật ký thay đổi này ghi lại tất cả các thay đổi đáng chú ý, cập nhật và cải tiến đối với kho lưu trữ AZD Cho Người Mới Bắt Đầu. Chúng tôi tuân theo các nguyên tắc phiên bản ngữ nghĩa và duy trì nhật ký này để giúp người dùng hiểu những gì đã thay đổi giữa các phiên bản.

## Mục tiêu học tập

Bằng cách xem xét nhật ký thay đổi này, bạn sẽ:
- Giữ thông tin về các tính năng mới và những bổ sung nội dung
- Hiểu các cải tiến đã thực hiện đối với tài liệu hiện có
- Theo dõi các lỗi đã được khắc phục và sửa chữa để đảm bảo độ chính xác
- Theo dõi sự phát triển của tài liệu học tập theo thời gian

## Kết quả học tập

Sau khi xem qua các mục nhật ký thay đổi, bạn sẽ có thể:
- Nhận biết nội dung và tài nguyên mới có sẵn cho việc học tập
- Hiểu được những phần nào đã được cập nhật hoặc cải tiến
- Lập kế hoạch con đường học tập dựa trên tài liệu hiện tại nhất
- Đóng góp phản hồi và đề xuất cho các cải tiến trong tương lai

## Lịch sử phiên bản

### [v3.23.0] - 2026-07-13

#### Làm mới AZD 1.27.1: Cập nhật phiên bản hiện hành
**Phiên bản này xác nhận lại khóa học với `azd` `1.27.1` (tháng 7 năm 2026, bản phát hành ổn định mới nhất) và phần mở rộng đại lý AI xem trước hiện tại `azure.ai.agents` `1.0.0-beta.5`, cập nhật mọi biểu ngữ "xác nhận với" lên ngày mới sau các bản phát hành 1.26.0, 1.27.0 và 1.27.1.**

#### Thay đổi
- **✅ Cập nhật cơ sở xác nhận** từ `azd 1.25.6` (tháng 6 năm 2026) lên `azd 1.27.1` (tháng 7 năm 2026) trên toàn bộ README gốc, tất cả README các chương, bài học dev-container chương 1 (bao gồm ví dụ phiên bản cố định), bài học mẫu tùy chỉnh chương 4, bài học đa đại lý chương 5, và tài liệu hội thảo
- **🤖 Cập nhật cơ sở chương 2** từ `azd 1.23.12` (tháng 3 năm 2026) lên `azd 1.27.1` trên `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, và `microsoft-foundry-integration.md`; ngày ghi chú xác nhận cập nhật thành 2026-07-13
- **🧩 Nâng cấp phần mở rộng đại lý AI** từ `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` lên bản phát hành hiện tại `1.0.0-beta.5` trong README chương 2 và `agents.md`
- **🧪 Ví dụ xác thực hội thảo** (`azd version` đầu ra) cập nhật lên `1.27.1`

#### Ghi chú về các bản phát hành azd liên quan (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Hỗ trợ Go cho Azure Functions trên Flex Consumption, `azd config sub-filter` bộ lọc đăng ký theo tenant, gói mở rộng tự chứa (`azd x pack --bundle`), và `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Mô hình dự án/đại lý Azure AI Foundry trực tiếp trong `azure.yaml` (khởi tạo không cần Bicep/Terraform), hỗ trợ triển khai container cho App Service (`host: appservice` + `language: docker`), tùy chọn `-s/--source` trực tiếp cho lệnh `azd extension`, và `azd tool uninstall`
- **1.27.1 (2026-07-09):** Cờ `--no-dependencies` cho `azd extension install`, loại trừ các mô hình bị ngừng sử dụng khỏi catalog/hỏi hạn mức mặc định, và sửa nhiều lỗi

#### Tệp đã cập nhật
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Sửa lỗ hổng cho người mới #2: Soạn thảo mẫu, Dev Containers, Pulumi, Azure DevOps, Service Principals, và nhiều hơn nữa
**Phiên bản này khép lại các lỗ hổng còn lại về mức trung cấp mà phân tích azd-coverage đã chỉ ra: cách soạn thảo và xuất bản mẫu của bạn, môi trường dev-container/Codespaces có thể tái tạo, nhà cung cấp hạ tầng Pulumi, hướng dẫn CI/CD Azure DevOps, xác thực service-principal, hướng dẫn chọn host (AKS/Spring Apps), giải thích `azd restore`/`azd package`, xử lý lỗi trong hook, và thực hành môi trường nhóm / dùng chung.**

#### Thêm
- **🧱 Bài học chương 4 mới** `docs/chapter-04-infrastructure/custom-templates.md` — soạn thảo mẫu azd của riêng bạn: cấu trúc bắt buộc (`azure.yaml`, `infra/`, `src/`), trường `metadata.template`, tham số hóa hạ tầng với token tài nguyên `uniqueString()` và thẻ `azd-env-name`, thử nghiệm cục bộ với `azd init --template <local-path>`, xuất bản lên GitHub, và gửi vào bộ sưu tập Awesome AZD
- **📦 Bài học chương 1 mới** `docs/chapter-01-foundation/dev-containers.md` — môi trường azd có thể tái tạo với Dev Containers và GitHub Codespaces: `.devcontainer/devcontainer.json` tối giản dùng tính năng chính thức `ghcr.io/azure/azure-dev/azd`, tính năng riêng cho từng ngôn ngữ, `docker-in-docker` cho máy chủ container, và `azd auth login --use-device-code` để đăng nhập từ xa
- **🧩 Phần Pulumi với azd** trong `docs/chapter-04-infrastructure/provisioning.md` — cấu hình `infra.provider: pulumi`, bố cục thư mục Pulumi, các stack khớp môi trường azd, đầu ra/ gán thẻ cần thiết, và quy trình `azd up` / `azd down` giống hệt
- **🎯 Hướng dẫn chọn host** trong `docs/chapter-04-infrastructure/provisioning.md` — so sánh thân thiện với người mới về `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, và `springapp`, cùng hướng dẫn khi nào chọn AKS hay Azure Spring Apps
- **🛠️ Hướng dẫn CI/CD Azure DevOps** trong `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, kết nối dịch vụ với federation nhận dạng công việc (OIDC), file cấu hình tạo sẵn `azure-dev.yml`, và thiết lập nhóm biến
- **🔑 Service Principals (Mẫu 4)** thêm vào `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` không tương tác với client secret so với xác thực liên kết/OIDC, khi nào sử dụng, và lưu trữ thông tin đăng nhập an toàn
- **🪝 Xử lý lỗi hook** phần con trong `docs/chapter-04-infrastructure/deployment-guide.md` — mã thoát và `set -e`, `continueOnError`, thử hook riêng lẻ với `azd hooks run`, shell theo hệ điều hành, và `--debug`
- **👥 Môi trường nhóm / dùng chung** phần trong `docs/chapter-03-configuration/configuration.md` — những gì nằm trong `.azure/`, loại ra gitignore, môi trường cho từng nhà phát triển, `azd env list`/`select`, và cung cấp giá trị môi trường trong CI/CD
- **🧰 Giải thích `azd restore` và mở rộng `azd package`** trong `resources/cheat-sheet.md` — phục hồi phụ thuộc và xây dựng artefact có thể triển khai mà không cần triển khai ngay

#### Thay đổi
- **🧭 Bảng bài học chương 4** cập nhật để bao gồm bài mới "Soạn thảo Mẫu của Bạn" (Bài 3)
- **🧭 Bảng bài học chương 1** cập nhật để thêm bài "Dev Containers & Codespaces" mới (Bài 5); chân trang điều hướng nối giữa `bring-your-own-app.md` và `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Sửa lỗ hổng cho người mới: Bài học đa đại lý thực hành, "Mang Ứng Dụng Riêng," Terraform và Hướng dẫn CI/CD
**Phiên bản này khép lại các khoảng trống lớn nhất cho hướng dẫn người mới hoàn chỉnh bằng cách thêm hai bài học thực hành mới (hướng dẫn triển khai đa đại lý và thêm azd vào một app hiện có), phần giới thiệu hook thân thiện với người mới, phần Terraform với azd, hướng dẫn từng bước pipeline GitHub Actions, giải thích các phần mở rộng xem trước mới, và danh sách kiểm tra xác minh triển khai rõ ràng.**

#### Thêm
- **🤝 Bài học chương 5 mới** `docs/chapter-05-multi-agent/multi-agent-basics.md` — hướng dẫn thực hành triển khai hai đại lý đầy đủ (điều phối viên + chuyên gia) dùng mẫu thật (`contoso-creative-writer`), bao gồm khi nào nên dùng đa đại lý, quy trình `azd up`, hiểu các tài nguyên triển khai, theo dõi liên đại lý, tùy chỉnh, và dọn dẹp
- **📦 Bài học chương 1 mới** `docs/chapter-01-foundation/bring-your-own-app.md` — cách thêm azd vào dự án hiện có với `azd init` ("dùng code trong thư mục hiện tại"), hiểu `azure.yaml` và `infra/`, `azd infra generate`, phát hiện host, và triển khai với `azd up`
- **🌐 Phần Terraform với azd** thêm vào `docs/chapter-04-infrastructure/provisioning.md` — cấu hình `infra.provider: terraform`, bố cục thư mục `.tf`, đầu ra `AZURE_*` cần thiết và gán thẻ `azd-env-name`, cùng quy trình `azd up` / `azd down` giống hệt (khép lại lỗ hổng tuyên bố hỗ trợ Terraform nhưng trước đó chỉ chỉ ra Bicep)
- **⚙️ Hướng dẫn từng bước GitHub Actions** trong `docs/chapter-08-production/production-ai-practices.md` — từ repo GitHub tới tự động triển khai: `azd pipeline config`, chứng thực liên kết OIDC (không lưu bí mật), file tạo sẵn `azure-dev.yml`, và hướng dẫn bí mật so với biến
- **🪝 Giới thiệu Hook cho người mới "Mới với hook?"** trong `docs/chapter-04-infrastructure/deployment-guide.md` — hook là gì, bảng giai đoạn hook, hook đầu tiên tối giản, và chạy hook thủ công với `azd hooks run`
- **✅ Thêm danh sách kiểm tra "Xác minh Triển khai"** vào bước 5 `docs/chapter-01-foundation/first-project.md` — kiểm tra sơ khởi, kiểm tra điểm cuối sức khỏe, và tiêu chí thành công rõ ràng
- **🧩 Giải thích phần mở rộng xem trước mới** `azure.ai.skills` và `azure.ai.connections` (chúng là gì và khi nào dùng) trong `docs/chapter-08-production/production-ai-practices.md`

#### Thay đổi
- **🧭 Sửa bảng bài học chương 5**: `multi-agent-basics.md` giờ là Bài 1 (bài duy nhất hoàn toàn thực hành), rõ ràng rằng Bài 2 nằm trong chương 6 và kịch bản Bán lẻ chỉ là bản thiết kế kiến trúc, không phải mẫu một lệnh
- **🧭 Bảng bài học chương 1** giờ bao gồm bài "Mang Ứng Dụng Riêng" mới (Bài 4)
- **🔗 Cập nhật chân trang điều hướng**: `first-project.md` hiện liên kết đến `bring-your-own-app.md`

#### Sửa lỗi
- **🧱 Khép lại lỗ hổng Terraform "đã nói nhưng không có"** — khóa học trước đó đề cập tới hỗ trợ Terraform mà không minh họa
- **🔀 Sửa lại liên kết chéo chương 5 gây hiểu nhầm** rằng đã có triển khai đa đại lý đầy đủ trong khi thực tế chỉ là bản thiết kế kiến trúc

#### Tệp đã cập nhật
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

#### Làm mới AZD 1.25.6, Các lệnh Vòng đời Đại lý đầy đủ & Thay đổi thương hiệu Aspire

**Phiên bản này tái xác nhận khóa học với `azd` `1.25.6` (tháng 6 năm 2026) và phần mở rộng xem trước `azure.ai.agents` `0.1.40-preview`, mở rộng hướng dẫn AI từ "giáo án tạo agent" đến toàn bộ vòng đời của agent (kiểm thử → đánh giá → tối ưu → kiểm tra → xóa), giới thiệu các phần mở rộng xem trước mới `azure.ai.skills` và `azure.ai.connections`, đồng thời ghi chú việc đổi tên sản phẩm ".NET Aspire" → "Aspire".**

#### Đã thêm
- **🔁 Bao phủ toàn bộ vòng đời agent** cho người mới bắt đầu và kỹ sư AI trên toàn bộ tài liệu:
  - `docs/chapter-01-foundation/azd-basics.md` — Bảng vòng đời (tạo → kiểm thử → đo lường → cải thiện → kiểm tra → dọn dẹp) được thêm vào phần Phần mở rộng và Lệnh AI
  - `docs/chapter-08-production/production-ai-practices.md` — Mục mới "Quản lý Vòng đời Agent" bao gồm `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` và `delete --force`
  - `resources/cheat-sheet.md` — Mở rộng Các Lệnh Agent AI với `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` và `delete --force`
- **🧩 Các phần mở rộng xem trước mới** được ghi lại: `azure.ai.skills` (kỹ năng agent tái sử dụng được) và `azure.ai.connections` (kết nối Foundry) được thêm vào bảng phần mở rộng và tài liệu tham khảo nhanh
- **⏱️ Hướng dẫn thời gian phản hồi** — các ví dụ `azd ai agent invoke` giờ đây lưu ý in ra tổng độ trễ và thời gian nhận byte đầu tiên
- **📌 Thanh thông báo phiên bản** trong README gốc hướng người học đến `azd version` và `azd upgrade`

#### Đã thay đổi
- **✅ Cập nhật cơ sở xác nhận** từ `azd 1.23.12` (tháng 3 năm 2026) lên `azd 1.25.6` (tháng 6 năm 2026) trên tất cả README của các chương và tài liệu workshop
- **🤖 Ghi chú phần mở rộng Chương 2** cập nhật từ `azure.ai.agents` `0.1.18-preview` lên `0.1.40-preview`
- **🧪 Ví dụ xác minh workshop** (kết quả `azd version`) cập nhật lên `1.25.6`
- **🧭 README "Có gì mới trong azd hôm nay"** được làm mới để nổi bật vòng đời agent toàn diện, phần mở rộng AI mới và các cải tiến chất lượng gần đây (`azd init` idempotency, `azd auth login` xóa token lỗi thời, nhắc khi chạy `azd tool` lần đầu)
- **📖 Chương 2 agents.md (Lựa chọn 4)** giờ đây hướng người học đến các lệnh vòng đời sau triển khai thay vì chỉ dừng ở `azd up`

#### Đã sửa
- **🏷️ Tên sản phẩm** — thêm ghi chú đổi tên Aspire (".NET Aspire" giờ chỉ là "Aspire"); hỗ trợ azd cho Aspire không thay đổi
- **🔎 Xác nhận phát hành trực tiếp** với nguồn cấp phát hành Azure Developer CLI: CLI ổn định `1.25.6` (2026-06-12) và `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Tệp đã cập nhật
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

#### Làm rõ onboarding cho người mới bắt đầu, xác minh thiết lập và dọn dẹp lệnh AZD cuối cùng
**Phiên bản này tiếp nối việc xác nhận AZD 1.23 bằng một lần rà soát tài liệu tập trung cho người mới: làm rõ hướng dẫn xác thực AZD đầu tiên, thêm các kịch bản xác minh thiết lập cục bộ, kiểm tra các lệnh chính với AZD CLI thực tế, và loại bỏ các tham chiếu lệnh nguồn tiếng Anh lỗi thời còn sót ngoài changelog.**

#### Đã thêm
- **🧪 Kịch bản xác minh thiết lập cho người mới** với `validate-setup.ps1` và `validate-setup.sh` để người học xác nhận công cụ cần thiết trước khi bắt đầu Chương 1
- **✅ Các bước xác minh thiết lập đầu vào** trong README gốc và README Chương 1 để bắt lỗi yêu cầu thiếu trước khi chạy `azd up`

#### Đã thay đổi
- **🔐 Hướng dẫn xác thực cho người mới** bây giờ nhất quán coi `azd auth login` là con đường chính cho các workflow AZD, với `az login` được đề cập là tùy chọn trừ khi dùng trực tiếp các lệnh Azure CLI
- **📚 Luồng onboarding Chương 1** giờ hướng người học xác nhận thiết lập cục bộ trước khi cài đặt, xác thực và bước triển khai đầu tiên
- **🛠️ Thông báo của trình xác minh** bây giờ phân biệt rõ giữa các yêu cầu gây chặn và cảnh báo tùy chọn Azure CLI cho đường đi dành riêng người mới dùng AZD
- **📖 Tài liệu cấu hình, xử lý sự cố và ví dụ** giờ đây phân biệt giữa xác thực AZD bắt buộc và đăng nhập Azure CLI tùy chọn khi cả hai trước đây trình bày cùng nhau mà không có ngữ cảnh

#### Đã sửa
- **📋 Các tham chiếu lệnh nguồn tiếng Anh còn lại** được cập nhật sang hình thức AZD hiện tại, bao gồm `azd config show` trong tài liệu nhanh và `azd monitor --overview` khi hướng dẫn xem tổng quan Azure Portal được dự kiến
- **🧭 Các thông tin cho người mới trong Chương 1** được giảm bớt để tránh hứa hẹn quá mức về bảo đảm không lỗi hoặc hành động rollback trên tất cả mẫu và tài nguyên Azure
- **🔎 Xác nhận CLI trực tiếp** ghi nhận hỗ trợ hiện tại cho `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, và `azd down --force --purge`

#### Tệp đã cập nhật
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

#### Xác nhận AZD 1.23.12, Mở rộng môi trường workshop & Làm mới mô hình AI
**Phiên bản này thực hiện rà soát xác nhận tài liệu với `azd` `1.23.12`, cập nhật ví dụ lệnh AZD lỗi thời, làm mới hướng dẫn mô hình AI với giá trị mặc định hiện hành, và mở rộng hướng dẫn workshop vượt ra ngoài GitHub Codespaces để hỗ trợ dev container và bản sao cục bộ.**

#### Đã thêm
- **✅ Ghi chú xác nhận trên các chương cốt lõi và tài liệu workshop** làm rõ cơ sở AZD đã kiểm thử cho người học dùng các bản CLI mới hơn hoặc cũ hơn
- **⏱️ Hướng dẫn thời gian chờ triển khai** cho các triển khai ứng dụng AI dài sử dụng `azd deploy --timeout 1800`
- **🔎 Bước kiểm tra phần mở rộng** với `azd extension show azure.ai.agents` trong tài liệu quy trình AI
- **🌐 Hướng dẫn môi trường workshop rộng hơn** bao gồm GitHub Codespaces, dev container và bản sao cục bộ với MkDocs

#### Đã thay đổi
- **📚 README giới thiệu các chương** giờ nhất quán ghi chú xác nhận với `azd 1.23.12` trên các phần nền tảng, cấu hình, hạ tầng, đa agent, tiền triển khai, xử lý sự cố, và sản xuất
- **🛠️ Tham chiếu lệnh AZD** được cập nhật sang dạng hiện tại trên toàn bộ tài liệu:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` hoặc `azd env get-value(s)` tùy ngữ cảnh
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` khi hướng dẫn tổng quan Application Insights được mong muốn
- **🧪 Ví dụ provision xem trước** đơn giản hóa sang các cách dùng được hỗ trợ hiện hành như `azd provision --preview` và `azd provision --preview -e production`
- **🧭 Luồng workshop** được cập nhật để người học có thể hoàn thành bài lab trong Codespaces, dev container hoặc bản clone địa phương thay vì giả định chỉ chạy trong Codespaces
- **🔐 Hướng dẫn xác thực** ưu tiên `azd auth login` cho workflow AZD, với `az login` được xem như tùy chọn khi dùng trực tiếp lệnh Azure CLI

#### Đã sửa
- **🪟 Lệnh cài đặt Windows** được chuẩn hóa theo cách viết package `winget` hiện tại trong hướng dẫn cài đặt
- **🐧 Hướng dẫn cài đặt Linux** được sửa để tránh chỉ dẫn quản lý gói `azd` không hỗ trợ theo từng bản phân phối và thay vào đó hướng đến tài sản phát hành khi phù hợp
- **📦 Ví dụ mô hình AI** được làm mới từ các mặc định cũ như `gpt-35-turbo` và `text-embedding-ada-002` sang các ví dụ hiện hành như `gpt-4.1-mini`, `gpt-4.1`, và `text-embedding-3-large`
- **📋 Mẫu mã triển khai và xử lý sự cố** sửa để dùng các lệnh môi trường và trạng thái hiện tại trong nhật ký, kịch bản và bước xử lý sự cố
- **⚙️ Hướng dẫn GitHub Actions** cập nhật từ `Azure/setup-azd@v1.0.0` lên `Azure/setup-azd@v2`
- **🤖 Hướng dẫn cấp phép MCP/Copilot** cập nhật từ `azd mcp consent` sang `azd copilot consent list`

#### Cải thiện
- **🧠 Hướng dẫn chương AI** bây giờ giải thích tốt hơn hành vi `azd ai` nhạy cảm với xem trước, đăng nhập theo tenant, sử dụng phần mở rộng hiện tại và khuyến nghị triển khai mô hình được cập nhật
- **🧪 Hướng dẫn workshop** giờ sử dụng ví dụ phiên bản thực tế hơn và ngôn ngữ thiết lập môi trường rõ ràng cho các bài lab thực hành
- **📈 Tài liệu sản xuất và xử lý sự cố** giờ phù hợp hơn với ví dụ giám sát hiện tại, mô hình dự phòng và cấp độ chi phí

#### Tệp đã cập nhật
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

#### Lệnh AZD AI CLI, Xác nhận nội dung & Mở rộng mẫu
**Phiên bản này bổ sung phạm vi lệnh `azd ai`, `azd extension`, và `azd mcp` trên tất cả các chương liên quan đến AI, sửa các liên kết hỏng và mã lỗi thời trong agents.md, cập nhật tài liệu tham khảo nhanh, và đại tu phần Ví dụ Mẫu với mô tả đã xác nhận và các mẫu Azure AI AZD mới.**

#### Đã thêm
- **🤖 Bao phủ lệnh AZD AI** trên 7 tệp (trước đây chỉ trong Chương 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Mục mới "Phần mở rộng và Lệnh AI" giới thiệu `azd extension`, `azd ai agent init`, và `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Lựa chọn 4: `azd ai agent init` với bảng so sánh (mẫu so với cách tiếp cận manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Các tiểu mục "Phần mở rộng AZD cho Foundry" và "Triển khai ưu tiên Agent"

  - `docs/chapter-05-multi-agent/README.md` — Bắt đầu nhanh bây giờ hiển thị cả hai đường triển khai dựa trên mẫu và manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Phần Triển khai giờ bao gồm tùy chọn `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Phần "Lệnh mở rộng AZD AI cho Chẩn đoán"
  - `resources/cheat-sheet.md` — Phần mới "Lệnh AI & Mở rộng" với `azd extension`, `azd ai agent init`, `azd mcp`, và `azd infra generate`
- **📦 Mẫu ví dụ AZD AI mới** trong `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Trò chuyện RAG .NET với Blazor WebAssembly, Semantic Kernel, và hỗ trợ trò chuyện bằng giọng nói
  - **azure-search-openai-demo-java** — Trò chuyện RAG Java sử dụng Langchain4J với các tùy chọn triển khai ACA/AKS
  - **contoso-creative-writer** — Ứng dụng viết sáng tạo đa tác nhân sử dụng Azure AI Agent Service, Bing Grounding và Prompty
  - **serverless-chat-langchainjs** — RAG serverless sử dụng Azure Functions + LangChain.js + Cosmos DB với hỗ trợ phát triển cục bộ Ollama
  - **chat-with-your-data-solution-accelerator** — Bộ tăng tốc RAG cho doanh nghiệp với cổng quản trị, tích hợp Teams, và các tùy chọn PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Ứng dụng tham khảo MCP đa tác nhân với các máy chủ trong .NET, Python, Java và TypeScript
  - **azd-ai-starter** — Mẫu khởi đầu Bicep hạ tầng Azure AI tối giản
  - **🔗 Liên kết AZD AI Gallery tuyệt vời** — Tham khảo [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (hơn 80 mẫu)

#### Đã Sửa
- **🔗 Điều hướng agents.md**: Liên kết Trước/Sau giờ phù hợp với thứ tự bài học trong README Chương 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Liên kết hỏng trong agents.md**: Đã sửa `production-ai-practices.md` thành `../chapter-08-production/production-ai-practices.md` (3 lần)
- **📦 Mã deprecated trong agents.md**: Thay `opencensus` bằng `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API không hợp lệ trong agents.md**: Đã chuyển `max_tokens` từ `create_agent()` sang `create_run()` như `max_completion_tokens`
- **🔢 Đếm token trong agents.md**: Thay ước tính thô `len//4` bằng `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Đã chỉnh sửa dịch vụ từ "Cognitive Search + App Service" thành "Azure AI Search + Azure Container Apps" (máy chủ mặc định đổi sang tháng 10/2024)
- **contoso-chat**: Cập nhật mô tả tham chiếu Azure AI Foundry + Prompty, phù hợp với tiêu đề và stack công nghệ trong repo

#### Đã Xóa
- **ai-document-processing**: Đã xóa tham chiếu mẫu không hoạt động (repo không công khai như mẫu AZD)

#### Đã Cải Thiện
- **📝 Bài tập agents.md**: Bài tập 1 giờ hiển thị đầu ra mong đợi và bước `azd monitor`; Bài tập 2 bao gồm toàn bộ mã đăng ký `FunctionTool`; Bài tập 3 thay hướng dẫn mơ hồ bằng các lệnh `prepdocs.py` cụ thể
- **📚 Tài nguyên agents.md**: Cập nhật liên kết tài liệu đến docs Azure AI Agent Service và quickstart hiện tại
- **📋 Bảng bước tiếp theo agents.md**: Thêm liên kết AI Workshop Lab cho bao phủ chương hoàn chỉnh

#### Các Tệp Đã Cập Nhật
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Cải Thiện Điều Hướng Khóa Học
**Phiên bản này cải thiện việc điều hướng README.md chương bằng định dạng bảng được nâng cấp.**

#### Đã Thay Đổi
- **Bảng Sơ Đồ Khóa Học**: Nâng cấp với liên kết bài học trực tiếp, ước lượng thời lượng, và đánh giá độ phức tạp
- **Dọn Dẹp Thư Mục**: Loại bỏ các thư mục cũ thừa (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Kiểm Tra Liên Kết**: Tất cả hơn 21 liên kết nội bộ trong bảng Sơ Đồ Khóa Học được xác minh

### [v3.16.0] - 2026-02-05

#### Cập Nhật Tên Sản Phẩm
**Phiên bản này cập nhật tham chiếu sản phẩm theo thương hiệu Microsoft hiện tại.**

#### Đã Thay Đổi
- **Microsoft Foundry → Microsoft Foundry**: Tất cả tham chiếu được cập nhật trên các tệp không dịch
- **Azure AI Agent Service → Foundry Agents**: Tên dịch vụ cập nhật để phản ánh thương hiệu hiện tại

#### Các Tệp Đã Cập Nhật
- `README.md` - Trang chính khóa học
- `changelog.md` - Lịch sử phiên bản
- `course-outline.md` - Cấu trúc khóa học
- `docs/chapter-02-ai-development/agents.md` - Hướng dẫn tác nhân AI
- `examples/README.md` - Tài liệu ví dụ
- `workshop/README.md` - Trang giới thiệu workshop
- `workshop/docs/index.md` - Mục lục workshop
- `workshop/docs/instructions/*.md` - Tất cả các tệp hướng dẫn workshop

---

### [v3.15.0] - 2026-02-05

#### Tái Cấu Trúc Repository Lớn: Tên Thư Mục Theo Chương
**Phiên bản này tái cấu trúc tài liệu thành các thư mục chương riêng để điều hướng rõ ràng hơn.**

#### Đổi Tên Thư Mục
Các thư mục cũ đã được thay thế bằng các thư mục đánh số chương:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Thêm mới: `docs/chapter-05-multi-agent/`

#### Di Chuyển Tệp
| Tệp | Từ | Thành |
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
| Tất cả tệp tiền triển khai | pre-deployment/ | chapter-06-pre-deployment/ |
| Tất cả tệp xử lý sự cố | troubleshooting/ | chapter-07-troubleshooting/ |

#### Thêm Mới
- **📚 Tệp README mỗi chương**: Tạo README.md trong mỗi thư mục chương với:
  - Mục tiêu học tập và thời lượng
  - Bảng bài học kèm mô tả
  - Lệnh bắt đầu nhanh
  - Điều hướng đến các chương khác

#### Đã Thay Đổi
- **🔗 Cập nhật tất cả liên kết nội bộ**: Cập nhật hơn 78 đường dẫn trên tất cả tài liệu
- **🗺️ README.md chính**: Cập nhật Bản đồ Khóa Học với cấu trúc chương mới
- **📝 examples/README.md**: Cập nhật tham chiếu chéo đến thư mục chương

#### Đã Xóa
- Cấu trúc thư mục cũ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Tái Cấu Trúc Repository: Điều Hướng Chương
**Phiên bản này thêm các tệp README điều hướng chương (bị thay thế bởi v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Hướng Dẫn Tác Nhân AI Mới
**Phiên bản này thêm hướng dẫn toàn diện cho triển khai tác nhân AI với Azure Developer CLI.**

#### Thêm Mới
- **🤖 docs/microsoft-foundry/agents.md**: Hướng dẫn đầy đủ bao gồm:
  - Tác nhân AI là gì và khác biệt với chatbot thế nào
  - Ba mẫu tác nhân bắt đầu nhanh (Foundry Agents, Prompty, RAG)
  - Mô hình kiến trúc tác nhân (tác nhân đơn, RAG, đa tác nhân)
  - Cấu hình và tùy chỉnh công cụ
  - Giám sát và theo dõi chỉ số
  - Cân nhắc chi phí và tối ưu hóa
  - Các kịch bản xử lý sự cố phổ biến
  - Ba bài tập thực hành với tiêu chí thành công

#### Cấu Trúc Nội Dung
- **Giới thiệu**: Khái niệm tác nhân dành cho người mới
- **Bắt đầu nhanh**: Triển khai tác nhân với `azd init --template get-started-with-ai-agents`
- **Mô hình Kiến trúc**: Sơ đồ trực quan các mô hình tác nhân
- **Cấu hình**: Thiết lập công cụ và biến môi trường
- **Giám sát**: Tích hợp Application Insights
- **Bài tập**: Học qua thực hành từng bước (20-45 phút mỗi bài)

---

### [v3.12.0] - 2026-02-05

#### Cập Nhật Môi Trường DevContainer
**Phiên bản này cập nhật cấu hình container phát triển với công cụ hiện đại và thiết lập mặc định tốt hơn cho trải nghiệm học AZD.**

#### Đã Thay Đổi
- **🐳 Ảnh Nền**: Cập nhật từ `python:3.12-bullseye` sang `python:3.12-bookworm` (phiên bản ổn định Debian mới nhất)
- **📛 Tên Container**: Đổi từ "Python 3" thành "AZD for Beginners" để rõ ràng hơn

#### Thêm Mới
- **🔧 Tính Năng Container Dev Mới**:
  - `azure-cli` với hỗ trợ Bicep được kích hoạt
  - `node:20` (phiên bản LTS cho mẫu AZD)
  - `github-cli` để quản lý mẫu
  - `docker-in-docker` cho triển khai container app

- **🔌 Chuyển tiếp cổng**: Cổng mặc định cho phát triển phổ biến:
  - 8000 (xem trước MkDocs)
  - 3000 (ứng dụng Web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Mở rộng VS Code Mới**:
  - `ms-python.vscode-pylance` - IntelliSense Python nâng cao
  - `ms-azuretools.vscode-azurefunctions` - Hỗ trợ Azure Functions
  - `ms-azuretools.vscode-docker` - Hỗ trợ Docker
  - `ms-azuretools.vscode-bicep` - Hỗ trợ ngôn ngữ Bicep
  - `ms-azure-devtools.azure-resource-groups` - Quản lý tài nguyên Azure
  - `yzhang.markdown-all-in-one` - Chỉnh sửa Markdown
  - `DavidAnson.vscode-markdownlint` - Kiểm tra Markdown
  - `bierner.markdown-mermaid` - Hỗ trợ sơ đồ Mermaid
  - `redhat.vscode-yaml` - Hỗ trợ YAML (cho azure.yaml)
  - `eamodio.gitlens` - Trực quan hóa Git
  - `mhutchie.git-graph` - Lịch sử Git

- **⚙️ Cài đặt VS Code**: Thêm cài đặt mặc định cho trình thông dịch Python, định dạng khi lưu, và cắt khoảng trắng

- **📦 Cập nhật requirements-dev.txt**:
  - Thêm plugin MkDocs minify
  - Thêm pre-commit cho chất lượng mã
  - Thêm gói Azure SDK (azure-identity, azure-mgmt-resource)

#### Đã Sửa
- **Lệnh sau tạo**: Giờ xác minh cài đặt AZD và Azure CLI khi khởi động container

---

### [v3.11.0] - 2026-02-05

#### Cải Thiện README Thân Thiện Với Người Mới Bắt Đầu
**Phiên bản này cải thiện đáng kể README.md để dễ tiếp cận hơn cho người mới và bổ sung tài nguyên thiết yếu cho nhà phát triển AI.**

#### Thêm Mới
- **🆚 So sánh Azure CLI và AZD**: Giải thích rõ khi nào dùng mỗi công cụ với ví dụ thực tế
- **🌟 Liên kết AZD tuyệt vời**: Liên kết trực tiếp đến gallery mẫu cộng đồng và tài nguyên đóng góp:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - hơn 200 mẫu sẵn sàng triển khai
  - [Nộp Mẫu](https://github.com/Azure/awesome-azd/issues) - Đóng góp của cộng đồng
- **🎯 Hướng dẫn Bắt đầu Nhanh**: Phần đơn giản hóa 3 bước (Cài đặt → Đăng nhập → Triển khai)
- **📊 Bảng Điều hướng Dựa trên Kinh nghiệm**: Hướng dẫn rõ ràng nơi bắt đầu tùy theo kinh nghiệm nhà phát triển

#### Đã Thay Đổi
- **Cấu trúc README**: Tổ chức lại theo dạng tiết lộ trình tự - thông tin chính trước
- **Phần Giới thiệu**: Viết lại để giải thích "Phép thuật của `azd up`" dành cho người mới hoàn toàn
- **Xóa Nội dung Trùng lặp**: Loại bỏ phần xử lý sự cố trùng lặp
- **Lệnh Xử lý sự cố**: Sửa tham chiếu `azd logs` thành lệnh hợp lệ `azd monitor --logs`

#### Đã Sửa

- **🔐 Lệnh Xác Thực**: Thêm `azd auth login` và `azd auth logout` vào cheat-sheet.md
- **Tham Chiếu Lệnh Không Hợp Lệ**: Loại bỏ các lệnh `azd logs` còn lại trong phần xử lý sự cố của README

#### Ghi chú
- **Phạm vi**: Thay đổi áp dụng cho README.md chính và resources/cheat-sheet.md
- **Đối tượng hướng đến**: Cải tiến dành riêng cho các nhà phát triển mới với AZD

---

### [v3.10.0] - 2026-02-05

#### Cập nhật độ chính xác lệnh Azure Developer CLI
**Phiên bản này chỉnh sửa các lệnh AZD không tồn tại trong toàn bộ tài liệu, đảm bảo tất cả ví dụ mã nguồn đều sử dụng cú pháp hợp lệ của Azure Developer CLI.**

#### Đã sửa
- **🔧 Loại bỏ các lệnh AZD không tồn tại**: Kiểm tra và sửa chữa toàn diện các lệnh không hợp lệ:
  - `azd logs` (không tồn tại) → thay bằng `azd monitor --logs` hoặc các lựa chọn Azure CLI
  - Các lệnh con của `azd service` (không tồn tại) → thay bằng `azd show` và Azure CLI
  - `azd infra import/export/validate` (không tồn tại) → bị loại bỏ hoặc thay bằng lựa chọn hợp lệ
  - Các cờ `azd deploy --rollback/--incremental/--parallel/--detect-changes` (không tồn tại) → bị loại bỏ
  - Các cờ `azd provision --what-if/--rollback` (không tồn tại) → cập nhật thành `--preview`
  - `azd config validate` (không tồn tại) → thay bằng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (không tồn tại) → bị loại bỏ

- **📚 Các tệp được cập nhật với chỉnh sửa lệnh**:
  - `resources/cheat-sheet.md`: Sửa đổi lớn tham chiếu lệnh
  - `docs/deployment/deployment-guide.md`: Sửa chiến lược rollback và triển khai
  - `docs/troubleshooting/debugging.md`: Sửa các phần phân tích nhật ký
  - `docs/troubleshooting/common-issues.md`: Cập nhật các lệnh xử lý sự cố
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa phần gỡ lỗi AZD
  - `docs/getting-started/azd-basics.md`: Chỉnh sửa lệnh giám sát
  - `docs/getting-started/first-project.md`: Cập nhật ví dụ giám sát và gỡ lỗi
  - `docs/getting-started/installation.md`: Sửa ví dụ về trợ giúp và phiên bản
  - `docs/pre-deployment/application-insights.md`: Sửa lệnh xem nhật ký
  - `docs/pre-deployment/coordination-patterns.md`: Sửa các lệnh gỡ lỗi tác nhân

- **📝 Cập nhật Tham chiếu Phiên bản**: 
  - `docs/getting-started/installation.md`: Thay `1.5.0` phiên bản cố định bằng `1.x.x` chung với liên kết đến các bản phát hành

#### Thay đổi
- **Chiến lược Rollback**: Cập nhật tài liệu sang rollback dựa trên Git (AZD không có rollback gốc)
- **Xem nhật ký**: Thay thế tham chiếu `azd logs` bằng `azd monitor --logs`, `azd monitor --live` và lệnh Azure CLI
- **Phần Hiệu năng**: Loại bỏ các cờ triển khai song song/tăng dần không tồn tại, cung cấp lựa chọn hợp lệ

#### Chi tiết kỹ thuật
- **Các lệnh AZD hợp lệ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Các cờ azd monitor hợp lệ**: `--live`, `--logs`, `--overview`
- **Tính năng bị loại bỏ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Ghi chú
- **Xác thực**: Lệnh được kiểm tra với Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Hoàn thành Workshop và Cập nhật Chất lượng Tài liệu
**Phiên bản này hoàn thành các mô-đun workshop tương tác, sửa tất cả liên kết tài liệu bị hỏng và cải thiện chất lượng nội dung tổng thể cho các nhà phát triển AI sử dụng Microsoft AZD.**

#### Đã thêm
- **📝 CONTRIBUTING.md**: Tài liệu hướng dẫn đóng góp mới với:
  - Hướng dẫn rõ ràng để báo cáo sự cố và đề xuất thay đổi
  - Tiêu chuẩn tài liệu cho nội dung mới
  - Hướng dẫn ví dụ mã và quy ước thông điệp commit
  - Thông tin tương tác cộng đồng

#### Hoàn thành
- **🎯 Mô-đun Workshop 7 (Tổng kết)**: Hoàn thành đầy đủ mô-đun tổng kết với:
  - Tóm tắt toàn diện các thành tựu workshop
  - Phần các khái niệm chính đã làm chủ như AZD, mẫu và Microsoft Foundry
  - Khuyến nghị tiếp tục hành trình học tập
  - Các bài tập thử thách workshop với đánh giá độ khó
  - Phản hồi cộng đồng và các liên kết hỗ trợ

- **📚 Mô-đun Workshop 3 (Phân tích)**: Cập nhật mục tiêu học tập với:
  - Hướng dẫn kích hoạt GitHub Copilot với máy chủ MCP
  - Hiểu cấu trúc thư mục mẫu AZD
  - Các mẫu tổ chức hạ tầng dạng mã (Bicep)
  - Hướng dẫn lab thực hành

- **🔧 Mô-đun Workshop 6 (Dọn dẹp)**: Hoàn thành với:
  - Mục tiêu quản lý chi phí và làm sạch tài nguyên
  - Sử dụng `azd down` để tắt hạ tầng an toàn
  - Hướng dẫn khôi phục dịch vụ nhận thức đã xóa mềm
  - Các đề xuất khám phá bổ sung cho GitHub Copilot và Azure Portal

#### Đã sửa
- **🔗 Sửa Liên Kết Hỏng**: Giải quyết hơn 15 liên kết tài liệu nội bộ bị hỏng:
  - `docs/ai-foundry/ai-model-deployment.md`: Sửa đường dẫn tới microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa đường dẫn ai-model-deployment.md và production-ai-practices.md
  - `docs/getting-started/first-project.md`: Thay thế cicd-integration.md không tồn tại bằng deployment-guide.md
  - `examples/retail-scenario.md`: Sửa đường dẫn phần FAQ và hướng dẫn khắc phục sự cố
  - `examples/container-app/microservices/README.md`: Sửa đường dẫn trang chủ khóa học và hướng dẫn triển khai
  - `resources/faq.md` và `resources/glossary.md`: Cập nhật tham chiếu chương AI
  - `course-outline.md`: Sửa tham chiếu hướng dẫn giảng viên và lab workshop AI

- **📅 Biểu ngữ Trạng thái Workshop**: Cập nhật từ "Đang xây dựng" thành trạng thái workshop đang hoạt động với ngày tháng 02/2026

- **🔗 Điều hướng Workshop**: Sửa các liên kết điều hướng bị hỏng trong README.md workshop hướng tới thư mục lab-1-azd-basics không tồn tại

#### Thay đổi
- **Trình bày Workshop**: Loại bỏ cảnh báo "đang xây dựng", workshop giờ đây hoàn chỉnh và sẵn sàng sử dụng
- **Đồng bộ điều hướng**: Đảm bảo tất cả mô-đun workshop có điều hướng giữa các mô-đun đúng đắn
- **Tham chiếu Con đường Học tập**: Cập nhật tham chiếu chéo chương đúng đường dẫn microsoft-foundry

#### Đã kiểm tra
- ✅ Tất cả tệp markdown tiếng Anh có liên kết nội bộ hợp lệ
- ✅ Các mô-đun workshop 0-7 hoàn chỉnh với mục tiêu học tập
- ✅ Điều hướng giữa các chương và mô-đun hoạt động tốt
- ✅ Nội dung phù hợp cho nhà phát triển AI sử dụng Microsoft AZD
- ✅ Ngôn ngữ thân thiện với người mới và cấu trúc được duy trì xuyên suốt
- ✅ CONTRIBUTING.md cung cấp hướng dẫn rõ ràng cho người đóng góp cộng đồng

#### Triển khai kỹ thuật
- **Xác thực Liên kết**: Script PowerShell tự động kiểm tra tất cả liên kết nội bộ .md
- **Kiểm tra Nội dung**: Đánh giá thủ công về tính hoàn chỉnh workshop và phù hợp người mới
- **Hệ thống Điều hướng**: Áp dụng mẫu điều hướng chương và mô-đun nhất quán

#### Ghi chú
- **Phạm vi**: Thay đổi áp dụng chỉ cho tài liệu tiếng Anh
- **Bản dịch**: Thư mục bản dịch chưa được cập nhật trong phiên bản này (dịch tự động sẽ đồng bộ sau)
- **Thời lượng Workshop**: Workshop hoàn chỉnh giờ cung cấp 3-4 giờ học thực hành

---

### [v3.8.0] - 2025-11-19

#### Tài liệu nâng cao: Giám sát, Bảo mật và Mẫu đa tác nhân
**Phiên bản này bổ sung bài học cấp A toàn diện về tích hợp Application Insights, mẫu xác thực và phối hợp đa tác nhân cho các triển khai sản xuất.**

#### Đã thêm
- **📊 Bài học Tích hợp Application Insights**: trong `docs/pre-deployment/application-insights.md`:
  - Triển khai tập trung AZD với tự động cung cấp
  - Mẫu Bicep hoàn chỉnh cho Application Insights + Log Analytics
  - Ứng dụng Python hoạt động với telemetry tùy chỉnh (hơn 1.200 dòng)
  - Mẫu giám sát AI/LLM (theo dõi token/chi phí Microsoft Foundry Models)
  - 6 sơ đồ Mermaid (kiến trúc, phân tán truy vết, luồng telemetry)
  - 3 bài tập thực hành (cảnh báo, bảng điều khiển, giám sát AI)
  - Ví dụ truy vấn Kusto và chiến lược tối ưu chi phí
  - Truyền dữ liệu số liệu trực tiếp và gỡ lỗi thời gian thực
  - Thời gian học 40-50 phút với mẫu sẵn sàng sản xuất

- **🔐 Bài học Mẫu Xác thực & Bảo mật**: trong `docs/getting-started/authsecurity.md`:
  - 3 mẫu xác thực (chuỗi kết nối, Key Vault, quản lý danh tính)
  - Mẫu hạ tầng Bicep hoàn chỉnh cho triển khai an toàn
  - Mã ứng dụng Node.js tích hợp Azure SDK
  - 3 bài tập hoàn chỉnh (kích hoạt managed identity, user-assigned identity, xoay Key Vault)
  - Thực hành bảo mật tốt nhất và cấu hình RBAC
  - Hướng dẫn xử lý sự cố và phân tích chi phí
  - Mẫu xác thực không dùng mật khẩu sẵn sàng sản xuất

- **🤖 Bài học Mẫu Phối hợp Đa Tác nhân**: trong `docs/pre-deployment/coordination-patterns.md`:
  - 5 mẫu phối hợp (tuần tự, song song, phân cấp, sự kiện, đồng thuận)
  - Triển khai dịch vụ điều phối hoàn chỉnh (Python/Flask, hơn 1.500 dòng)
  - 3 triển khai đại lý chuyên biệt (Nghiên cứu, Viết, Biên tập)
  - Tích hợp Service Bus cho hàng đợi tin nhắn
  - Quản lý trạng thái Cosmos DB cho hệ phân tán
  - 6 sơ đồ Mermaid thể hiện tương tác đại lý
  - 3 bài tập nâng cao (xử lý timeout, logic thử lại, circuit breaker)
  - Phân tích chi phí ($240-565/tháng) kèm chiến lược tối ưu
  - Tích hợp Application Insights để giám sát

#### Nâng cao
- **Chương Trước Triển khai**: Bổ sung đầy đủ mẫu giám sát và phối hợp
- **Chương Làm Quen**: Nâng cao với mẫu xác thực chuyên nghiệp
- **Sẵn sàng Sản xuất**: Bao phủ toàn diện từ bảo mật đến khả năng quan sát
- **Đề cương Khóa học**: Cập nhật để tham chiếu bài học mới trong Chương 3 và 6

#### Thay đổi
- **Tiến trình Học tập**: Tích hợp tốt hơn bảo mật và giám sát trong toàn bộ khóa học
- **Chất lượng Tài liệu**: Chuẩn cấp A nhất quán (95-97%) trong bài học mới
- **Mẫu Sản xuất**: Bao phủ đầy đủ end-to-end cho triển khai doanh nghiệp

#### Cải thiện
- **Trải nghiệm Nhà phát triển**: Lộ trình rõ ràng từ phát triển đến giám sát sản xuất
- **Tiêu chuẩn Bảo mật**: Mẫu chuyên nghiệp cho xác thực và quản lý bí mật
- **Khả năng Quan sát**: Tích hợp đầy đủ Application Insights với AZD
- **Khối lượng công việc AI**: Giám sát chuyên biệt cho Microsoft Foundry Models và hệ đa tác nhân

#### Đã kiểm tra
- ✅ Tất cả bài học bao gồm mã nguồn đầy đủ hoạt động (không phải mã mẫu)
- ✅ Sơ đồ Mermaid cho học trực quan (19 sơ đồ tổng cộng trong 3 bài học)
- ✅ Bài tập thực hành với các bước xác thực (9 bài tập tổng cộng)
- ✅ Mẫu Bicep sẵn sàng sản xuất có thể triển khai qua `azd up`
- ✅ Phân tích chi phí và chiến lược tối ưu
- ✅ Hướng dẫn xử lý sự cố và thực hành tốt nhất
- ✅ Kiểm tra kiến thức với lệnh xác thực

#### Kết quả Đánh giá Tài liệu
- **docs/pre-deployment/application-insights.md**: - Hướng dẫn giám sát toàn diện
- **docs/getting-started/authsecurity.md**: - Mẫu bảo mật chuyên nghiệp
- **docs/pre-deployment/coordination-patterns.md**: - Kiến trúc đa tác nhân nâng cao
- **Tổng thể Nội dung mới**: - Chuẩn chất lượng cao đồng nhất

#### Triển khai kỹ thuật
- **Application Insights**: Log Analytics + telemetry tùy chỉnh + phân tán truy vết
- **Xác thực**: Managed Identity + Key Vault + mẫu RBAC
- **Đa tác nhân**: Service Bus + Cosmos DB + Container Apps + điều phối
- **Giám sát**: Dữ liệu số liệu trực tiếp + truy vấn Kusto + cảnh báo + bảng điều khiển
- **Quản lý Chi phí**: Chiến lược lấy mẫu, chính sách lưu trữ, kiểm soát ngân sách

### [v3.7.0] - 2025-11-19

#### Cải tiến Chất lượng Tài liệu và Ví dụ Microsoft Foundry Models Mới
**Phiên bản này cải thiện chất lượng tài liệu trên toàn bộ kho lưu trữ và thêm ví dụ triển khai Microsoft Foundry Models hoàn chỉnh với giao diện trò chuyện gpt-4.1.**

#### Đã thêm
- **🤖 Ví dụ Trò chuyện Microsoft Foundry Models**: Triển khai gpt-4.1 hoàn chỉnh với thực hiện làm việc trong `examples/azure-openai-chat/`:
  - Hạ tầng Microsoft Foundry Models hoàn chỉnh (triển khai mô hình gpt-4.1)
  - Giao diện trò chuyện dòng lệnh Python có lịch sử hội thoại
  - Tích hợp Key Vault để lưu trữ khóa API bảo mật
  - Theo dõi mức tiêu thụ token và ước tính chi phí
  - Giới hạn tốc độ và xử lý lỗi
  - README toàn diện với hướng dẫn triển khai 35-45 phút
  - 11 tệp sẵn sàng sản xuất (mẫu Bicep, ứng dụng Python, cấu hình)
- **📚 Bài tập Tài liệu**: Thêm bài tập thực hành vào hướng dẫn cấu hình:
  - Bài tập 1: Cấu hình đa môi trường (15 phút)
  - Bài tập 2: Thực hành quản lý bí mật (10 phút)
  - Tiêu chí thành công rõ ràng và các bước xác thực
- **✅ Xác thực Triển khai**: Thêm phần xác thực vào hướng dẫn triển khai:
  - Quy trình kiểm tra sức khỏe
  - Danh sách kiểm tra tiêu chí thành công
  - Đầu ra dự kiến cho tất cả lệnh triển khai
  - Tham khảo nhanh khắc phục sự cố

#### Nâng cao
- **examples/README.md**: Cập nhật chất lượng A (93%):
  - Thêm azure-openai-chat vào tất cả phần liên quan
  - Cập nhật số lượng ví dụ cục bộ từ 3 lên 4
  - Thêm vào bảng Ví dụ Ứng dụng AI
  - Tích hợp vào Bắt đầu Nhanh cho Người dùng Trung cấp
  - Thêm vào phần Mẫu Microsoft Foundry
  - Cập nhật Ma trận So sánh và phần tìm công nghệ
- **Chất lượng Tài liệu**: Cải thiện từ B+ (87%) lên A- (92%) trong thư mục docs

  - Đã thêm kết quả mong đợi cho các ví dụ lệnh quan trọng
  - Bao gồm các bước xác minh cho các thay đổi cấu hình
  - Cải thiện học thực hành với các bài tập thực tế

#### Đã thay đổi
- **Tiến trình học tập**: Tích hợp tốt hơn các ví dụ AI cho người học trung cấp
- **Cấu trúc tài liệu**: Thêm nhiều bài tập có thể hành động với kết quả rõ ràng
- **Quy trình xác minh**: Thêm tiêu chí thành công rõ ràng cho các quy trình chính

#### Đã cải thiện
- **Trải nghiệm nhà phát triển**: Triển khai Microsoft Foundry Models giờ mất 35-45 phút (so với 60-90 cho các lựa chọn phức tạp hơn)
- **Minh bạch chi phí**: Ước tính chi phí rõ ràng ($50-200/tháng) cho ví dụ Microsoft Foundry Models
- **Lộ trình học**: Nhà phát triển AI có điểm vào rõ ràng với azure-openai-chat
- **Tiêu chuẩn tài liệu**: Kết quả mong đợi và các bước xác minh đồng nhất

#### Đã xác thực
- ✅ Ví dụ Microsoft Foundry Models hoạt động đầy đủ với `azd up`
- ✅ Tất cả 11 tệp triển khai đúng cú pháp
- ✅ Hướng dẫn README phù hợp với trải nghiệm triển khai thực tế
- ✅ Các liên kết tài liệu được cập nhật trên hơn 8 vị trí
- ✅ Chỉ mục ví dụ phản ánh chính xác 4 ví dụ địa phương
- ✅ Không có liên kết bên ngoài trùng lặp trong bảng
- ✅ Tất cả tham chiếu điều hướng chính xác

#### Triển khai kỹ thuật
- **Kiến trúc Microsoft Foundry Models**: gpt-4.1 + Key Vault + mẫu Container Apps
- **Bảo mật**: Sẵn sàng Managed Identity, bí mật trong Key Vault
- **Giám sát**: Tích hợp Application Insights
- **Quản lý chi phí**: Theo dõi token và tối ưu hóa sử dụng
- **Triển khai**: Lệnh `azd up` duy nhất cho thiết lập hoàn chỉnh

### [v3.6.0] - 2025-11-19

#### Cập nhật chính: Ví dụ triển khai Container App
**Phiên bản này giới thiệu các ví dụ triển khai ứng dụng container đầy đủ, sẵn sàng cho sản xuất bằng Azure Developer CLI (AZD), với tài liệu đầy đủ và tích hợp vào lộ trình học.**

#### Đã thêm
- **🚀 Ví dụ Container App**: Ví dụ mới tại chỗ trong `examples/container-app/`:
  - [Hướng dẫn chính](examples/container-app/README.md): Tổng quan đầy đủ về triển khai container, bắt đầu nhanh, sản xuất và mẫu nâng cao
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST thân thiện cho người mới với khả năng scale-to-zero, kiểm tra sức khỏe, giám sát và xử lý sự cố
  - [Kiến trúc Microservices](../../examples/container-app/microservices): Triển khai đa dịch vụ sẵn sàng sản xuất (API Gateway, Product, Order, User, Notification), nhắn tin bất đồng bộ, Service Bus, Cosmos DB, Azure SQL, theo dõi phân tán, triển khai blue-green/canary
- **Thực hành tốt nhất**: Bảo mật, giám sát, tối ưu chi phí và hướng dẫn CI/CD cho các workload container hóa
- **Mẫu mã**: Cấu hình `azure.yaml` hoàn chỉnh, mẫu Bicep và triển khai đa ngôn ngữ dịch vụ (Python, Node.js, C#, Go)
- **Kiểm tra & Xử lý sự cố**: Kịch bản kiểm tra đầu-cuối, lệnh giám sát, hướng dẫn xử lý sự cố

#### Đã thay đổi
- **README.md**: Cập nhật để có tính năng và liên kết các ví dụ container app mới trong phần "Local Examples - Container Applications"
- **examples/README.md**: Cập nhật để làm nổi bật các ví dụ container app, thêm các mục ma trận so sánh và cập nhật tham chiếu công nghệ/kiến trúc
- **Đề cương khóa học & Hướng dẫn học tập**: Cập nhật để tham chiếu các ví dụ container app mới và mẫu triển khai trong các chương liên quan

#### Đã xác thực
- ✅ Tất cả ví dụ mới có thể triển khai bằng `azd up` và theo best practices
- ✅ Các liên kết tài liệu chéo và điều hướng được cập nhật
- ✅ Ví dụ bao phủ từ cơ bản đến nâng cao, bao gồm microservices sản xuất

#### Ghi chú
- **Phạm vi**: Chỉ tài liệu và ví dụ bằng tiếng Anh
- **Bước tiếp theo**: Mở rộng với các mẫu container nâng cao và tự động hóa CI/CD trong các phiên bản tương lai

### [v3.5.0] - 2025-11-19

#### Đổi tên sản phẩm: Microsoft Foundry
**Phiên bản này thực hiện thay đổi tên sản phẩm toàn diện từ "Microsoft Foundry" sang "Microsoft Foundry" trên toàn bộ tài liệu tiếng Anh, phản ánh tái thương hiệu chính thức của Microsoft.**

#### Đã thay đổi
- **🔄 Cập nhật tên sản phẩm**: Tái thương hiệu hoàn chỉnh từ "Microsoft Foundry" thành "Microsoft Foundry"
  - Cập nhật tất cả tham chiếu trong tài liệu tiếng Anh trong thư mục `docs/`
  - Đổi tên thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Đổi tên tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tổng cộng: 23 tham chiếu nội dung được cập nhật trên 7 tệp tài liệu

- **📁 Thay đổi cấu trúc thư mục**:
  - `docs/ai-foundry/` được đổi tên thành `docs/microsoft-foundry/`
  - Tất cả tham chiếu chéo cập nhật để phản ánh cấu trúc thư mục mới
  - Liên kết điều hướng xác thực trên toàn bộ tài liệu

- **📄 Đổi tên tệp**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tất cả liên kết nội bộ cập nhật để tham chiếu tên tệp mới

#### Tệp đã cập nhật
- **Tài liệu các chương** (7 tệp):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 cập nhật liên kết điều hướng
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tham chiếu tên sản phẩm được cập nhật
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Đã sử dụng Microsoft Foundry (từ các cập nhật trước)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 tham chiếu được cập nhật (tổng quan, phản hồi cộng đồng, tài liệu)
  - `docs/getting-started/azd-basics.md` - 4 liên kết chéo cập nhật
  - `docs/getting-started/first-project.md` - 2 liên kết điều hướng chương cập nhật
  - `docs/getting-started/installation.md` - 2 liên kết chương kế tiếp cập nhật
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 tham chiếu cập nhật (điều hướng, cộng đồng Discord)
  - `docs/troubleshooting/common-issues.md` - 1 liên kết điều hướng cập nhật
  - `docs/troubleshooting/debugging.md` - 1 liên kết điều hướng cập nhật

- **Tệp cấu trúc khóa học** (2 tệp):
  - `README.md` - 17 tham chiếu được cập nhật (tổng quan khóa học, tiêu đề chương, phần mẫu, thông tin cộng đồng)
  - `course-outline.md` - 14 tham chiếu được cập nhật (tổng quan, mục tiêu học tập, tài nguyên chương)

#### Đã xác thực
- ✅ Không còn tham chiếu đường dẫn thư mục "ai-foundry" trong tài liệu tiếng Anh
- ✅ Không còn tham chiếu tên sản phẩm "Microsoft Foundry" trong tài liệu tiếng Anh
- ✅ Tất cả liên kết điều hướng hoạt động với cấu trúc thư mục mới
- ✅ Hoàn thành đổi tên tệp và thư mục thành công
- ✅ Xác thực tham chiếu chéo giữa các chương

#### Ghi chú
- **Phạm vi**: Thay đổi chỉ áp dụng cho tài liệu tiếng Anh trong thư mục `docs/`
- **Bản dịch**: Thư mục dịch (`translations/`) không được cập nhật trong phiên bản này
- **Workshop**: Tài liệu workshop (`workshop/`) không được cập nhật trong phiên bản này
- **Ví dụ**: Tệp ví dụ có thể vẫn tham chiếu tên cũ (sẽ được xử lý trong cập nhật tương lai)
- **Liên kết bên ngoài**: URL bên ngoài và tham chiếu kho lưu trữ GitHub không thay đổi

#### Hướng dẫn di chuyển cho người đóng góp
Nếu bạn có nhánh hoặc tài liệu tham chiếu cấu trúc cũ:
1. Cập nhật tham chiếu thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Cập nhật tham chiếu tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Thay thế tên sản phẩm: "Microsoft Foundry" → "Microsoft Foundry"
4. Xác thực tất cả liên kết nội bộ trong tài liệu vẫn hoạt động

---

### [v3.4.0] - 2025-10-24

#### Cải tiến xem trước hạ tầng và xác thực
**Phiên bản này giới thiệu hỗ trợ toàn diện cho tính năng xem trước mới của Azure Developer CLI và nâng cao trải nghiệm người dùng trong workshop.**

#### Đã thêm
- **🧪 Tài liệu tính năng azd provision --preview**: Bao phủ đầy đủ năng lực xem trước hạ tầng mới
  - Tham khảo lệnh và ví dụ sử dụng trong cheat sheet
  - Tích hợp chi tiết trong hướng dẫn provision với các trường hợp sử dụng và lợi ích
  - Tích hợp kiểm tra trước bay để xác thực triển khai an toàn hơn
  - Cập nhật hướng dẫn bắt đầu với các thực hành triển khai ưu tiên an toàn
- **🚧 Biểu ngữ trạng thái Workshop**: Biểu ngữ HTML chuyên nghiệp chỉ trạng thái phát triển của workshop
  - Thiết kế gradient với các chỉ báo đang xây dựng để truyền đạt rõ ràng cho người dùng
  - Mốc thời gian cập nhật cuối cùng để minh bạch
  - Thiết kế đáp ứng trên di động cho mọi loại thiết bị

#### Đã nâng cao
- **An toàn hạ tầng**: Tính năng xem trước tích hợp xuyên suốt tài liệu triển khai
- **Xác thực trước triển khai**: Các script tự động giờ bao gồm kiểm tra xem trước hạ tầng
- **Quy trình nhà phát triển**: Cập nhật chuỗi lệnh bao gồm xem trước như best practice
- **Trải nghiệm Workshop**: Thiết lập kỳ vọng rõ ràng cho người dùng về trạng thái phát triển nội dung

#### Đã thay đổi
- **Thực hành triển khai tốt nhất**: Quy trình ưu tiên xem trước giờ là cách tiếp cận được đề xuất
- **Luồng tài liệu**: Xác thực hạ tầng được đẩy lên sớm hơn trong quá trình học tập
- **Trình bày Workshop**: Truyền đạt chuyên nghiệp trạng thái phát triển với lịch trình rõ ràng

#### Đã cải thiện
- **Cách tiếp cận ưu tiên an toàn**: Các thay đổi hạ tầng có thể được xác thực trước khi triển khai
- **Hợp tác nhóm**: Kết quả xem trước có thể chia sẻ để xem xét và phê duyệt
- **Đánh giá chi phí**: Hiểu rõ chi phí tài nguyên trước khi provision
- **Giảm thiểu rủi ro**: Giảm thất bại triển khai nhờ xác thực trước

#### Triển khai kỹ thuật
- **Tích hợp đa tài liệu**: Tính năng xem trước được ghi chép trong 4 tệp chính
- **Mẫu lệnh**: Cú pháp và ví dụ đồng nhất xuyên suốt tài liệu
- **Tích hợp thực hành tốt nhất**: Xem trước được thêm vào các quy trình và script xác thực
- **Chỉ báo hình ảnh**: Đánh dấu tính năng MỚI rõ ràng để dễ nhận biết

#### Hạ tầng Workshop
- **Truyền đạt trạng thái**: Biểu ngữ HTML chuyên nghiệp với phong cách gradient
- **Trải nghiệm người dùng**: Trạng thái phát triển rõ ràng giúp tránh nhầm lẫn
- **Trình bày chuyên nghiệp**: Duy trì uy tín kho lưu trữ đồng thời đặt kỳ vọng
- **Minh bạch lịch trình**: Mốc thời gian cập nhật cuối tháng 10 năm 2025 để chịu trách nhiệm

### [v3.3.0] - 2025-09-24

#### Hỗ trợ workshop và trải nghiệm học tương tác được nâng cao
**Phiên bản này giới thiệu tài liệu workshop đầy đủ với hướng dẫn tương tác trên trình duyệt và lộ trình học có cấu trúc.**

#### Đã thêm
- **🎥 Hướng dẫn Workshop tương tác**: Trải nghiệm workshop trên trình duyệt với khả năng xem trước MkDocs
- **📝 Hướng dẫn workshop có cấu trúc**: Lộ trình học 7 bước từ khám phá đến tùy chỉnh
  - 0-Giới thiệu: Tổng quan workshop và thiết lập
  - 1-Chọn mẫu AI: Quá trình khám phá và lựa chọn mẫu
  - 2-Xác thực mẫu AI: Các thủ tục triển khai và xác thực
  - 3-Phân tích mẫu AI: Hiểu kiến trúc mẫu
  - 4-Cấu hình mẫu AI: Cấu hình và tùy chỉnh
  - 5-Tùy chỉnh mẫu AI: Sửa đổi nâng cao và các vòng lặp
  - 6-Dọn dẹp hạ tầng: Quản lý tài nguyên và dọn dẹp
  - 7-Kết thúc: Tóm tắt và các bước tiếp theo
- **🛠️ Công cụ workshop**: Cấu hình MkDocs với theme Material cho trải nghiệm học nâng cao
- **🎯 Lộ trình học thực hành**: Phương pháp 3 bước (Khám phá → Triển khai → Tùy chỉnh)
- **📱 Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển liền mạch

#### Đã nâng cao
- **Phòng thí nghiệm AI Workshop**: Mở rộng với trải nghiệm học có cấu trúc 2-3 giờ đầy đủ
- **Tài liệu Workshop**: Trình bày chuyên nghiệp với điều hướng và hỗ trợ trực quan
- **Tiến trình học**: Hướng dẫn rõ ràng từng bước từ chọn mẫu tới triển khai sản xuất
- **Trải nghiệm nhà phát triển**: Tích hợp công cụ cho quy trình làm việc phát triển trơn tru

#### Đã cải thiện
- **Khả năng truy cập**: Giao diện trình duyệt có chức năng tìm kiếm, sao chép và chuyển đổi theme
- **Học tự điều chỉnh**: Cấu trúc workshop linh hoạt phù hợp tốc độ học khác nhau
- **Ứng dụng thực tế**: Kịch bản triển khai mẫu AI thực tế
- **Tích hợp cộng đồng**: Tích hợp Discord để hỗ trợ và hợp tác trong workshop

#### Tính năng workshop
- **Tìm kiếm tích hợp**: Tìm nhanh từ khóa và bài học
- **Sao chép khối mã**: Chức năng rê chuột để sao chép mọi ví dụ mã
- **Chuyển đổi theme**: Hỗ trợ chế độ sáng/tối theo sở thích
- **Tài sản hình ảnh**: Ảnh chụp màn hình và sơ đồ để tăng cường hiểu biết
- **Tích hợp trợ giúp**: Truy cập trực tiếp Discord cho hỗ trợ cộng đồng

### [v3.2.0] - 2025-09-17

#### Tái cấu trúc điều hướng lớn và hệ thống học theo chương
**Phiên bản này giới thiệu cấu trúc học theo chương toàn diện với điều hướng nâng cao trên toàn bộ kho lưu trữ.**

#### Đã thêm
- **📚 Hệ thống học theo chương**: Tái cấu trúc toàn bộ khóa học thành 8 chương học tiến triển
  - Chương 1: Nền tảng & Bắt đầu nhanh (⭐ - 30-45 phút)
  - Chương 2: Phát triển AI-First (⭐⭐ - 1-2 giờ)
  - Chương 3: Cấu hình & Xác thực (⭐⭐ - 45-60 phút)
  - Chương 4: Hạ tầng dưới dạng mã & Triển khai (⭐⭐⭐ - 1-1.5 giờ)
  - Chương 5: Giải pháp AI đa tác nhân (⭐⭐⭐⭐ - 2-3 giờ)
  - Chương 6: Xác thực & Lập kế hoạch trước triển khai (⭐⭐ - 1 giờ)
  - Chương 7: Xử lý sự cố & Gỡ lỗi (⭐⭐ - 1-1.5 giờ)
  - Chương 8: Mẫu sản xuất & doanh nghiệp (⭐⭐⭐⭐ - 2-3 giờ)
- **📚 Hệ thống điều hướng toàn diện**: Tiêu đề và chân trang điều hướng đồng nhất trên toàn bộ tài liệu
- **🎯 Theo dõi tiến trình**: Danh sách kiểm tra hoàn thành khóa học và hệ thống xác minh học tập
- **🗺️ Hướng dẫn lộ trình học**: Điểm vào rõ ràng cho các cấp độ kinh nghiệm và mục tiêu khác nhau
- **🔗 Điều hướng tham chiếu chéo**: Các chương liên quan và điều kiện tiền đề được liên kết rõ ràng

#### Đã nâng cao
- **Cấu trúc README**: Biến thành nền tảng học tập có cấu trúc tổ chức theo chương
- **Điều hướng tài liệu**: Mọi trang nay bao gồm bối cảnh chương và hướng dẫn tiến trình
- **Tổ chức mẫu**: Ví dụ và mẫu được phân loại theo chương học phù hợp

- **Tích hợp tài nguyên**: Bảng mẹo, Câu hỏi thường gặp và hướng dẫn học tập liên kết với các chương liên quan
- **Tích hợp hội thảo**: Các phòng thí nghiệm thực hành được liên kết với nhiều mục tiêu học tập chương

#### Đã thay đổi
- **Tiến trình học tập**: Chuyển từ tài liệu tuyến tính sang học tập linh hoạt dựa trên từng chương
- **Vị trí cấu hình**: Di chuyển hướng dẫn cấu hình thành Chương 3 để luồng học tập tốt hơn
- **Tích hợp nội dung AI**: Tích hợp nội dung đặc thù AI tốt hơn xuyên suốt quá trình học
- **Nội dung sản xuất**: Các mẫu nâng cao được tập trung trong Chương 8 cho người học doanh nghiệp

#### Cải thiện
- **Trải nghiệm người dùng**: Đường dẫn điều hướng rõ ràng và chỉ báo tiến trình chương
- **Khả năng truy cập**: Mẫu điều hướng nhất quán để dễ dàng di chuyển trong khóa học
- **Trình bày chuyên nghiệp**: Cấu trúc khóa học kiểu đại học phù hợp cho đào tạo học thuật và doanh nghiệp
- **Hiệu quả học tập**: Giảm thời gian tìm kiếm nội dung liên quan nhờ tổ chức cải tiến

#### Triển khai kỹ thuật
- **Tiêu đề điều hướng**: Chuẩn hóa điều hướng chương trên hơn 40 tập tài liệu
- **Điều hướng chân trang**: Hướng dẫn tiến trình nhất quán và chỉ báo hoàn thành chương
- **Liên kết chéo**: Hệ thống liên kết nội bộ toàn diện kết nối các khái niệm liên quan
- **Sơ đồ chương**: Mẫu và ví dụ liên kết rõ ràng với mục tiêu học tập

#### Nâng cấp hướng dẫn học tập
- **📚 Mục tiêu học tập toàn diện**: Tái cấu trúc hướng dẫn học tập để phù hợp với hệ thống 8 chương
- **🎯 Đánh giá theo chương**: Mỗi chương bao gồm mục tiêu học tập cụ thể và bài tập thực hành
- **📋 Theo dõi tiến trình**: Lịch học hàng tuần với kết quả có thể đo lường và danh sách kiểm hoàn thành
- **❓ Câu hỏi đánh giá**: Các câu hỏi xác thực kiến thức cho từng chương với kết quả chuyên nghiệp
- **🛠️ Bài tập thực hành**: Hoạt động thực tế với kịch bản triển khai và khắc phục sự cố thật
- **📊 Tiến trình kỹ năng**: Tiến trình rõ ràng từ khái niệm cơ bản đến mẫu doanh nghiệp với trọng tâm phát triển nghề nghiệp
- **🎓 Khung chứng nhận**: Kết quả phát triển chuyên môn và hệ thống công nhận cộng đồng
- **⏱️ Quản lý thời gian**: Kế hoạch học tập có cấu trúc 10 tuần với xác thực các mốc quan trọng

### [v3.1.0] - 2025-09-17

#### Giải pháp AI đa tác nhân nâng cao
**Phiên bản này cải thiện giải pháp bán lẻ đa tác nhân với đặt tên tác nhân tốt hơn và tài liệu được nâng cấp.**

#### Đã thay đổi
- **Thuật ngữ đa tác nhân**: Thay thế "tác nhân Cora" bằng "tác nhân Khách hàng" trong giải pháp bán lẻ đa tác nhân để dễ hiểu hơn
- **Kiến trúc tác nhân**: Cập nhật toàn bộ tài liệu, mẫu ARM và ví dụ mã với tên gọi "tác nhân Khách hàng" nhất quán
- **Ví dụ cấu hình**: Hiện đại hóa các mẫu cấu hình tác nhân với quy ước đặt tên mới
- **Tính nhất quán tài liệu**: Đảm bảo tất cả tham chiếu sử dụng tên tác nhân mô tả và chuyên nghiệp

#### Nâng cao
- **Gói mẫu ARM**: Cập nhật retail-multiagent-arm-template với tham chiếu tác nhân Khách hàng
- **Sơ đồ kiến trúc**: Làm mới sơ đồ Mermaid với đặt tên tác nhân được cập nhật
- **Ví dụ mã**: Lớp Python và ví dụ triển khai hiện sử dụng tên CustomerAgent
- **Biến môi trường**: Cập nhật tất cả script triển khai dùng quy ước CUSTOMER_AGENT_NAME

#### Cải thiện
- **Trải nghiệm nhà phát triển**: Vai trò và trách nhiệm tác nhân rõ ràng hơn trong tài liệu
- **Sẵn sàng sản xuất**: Đồng nhất tốt hơn với quy ước đặt tên doanh nghiệp
- **Tài liệu học tập**: Đặt tên tác nhân trực quan hơn cho mục đích giáo dục
- **Khả năng sử dụng mẫu**: Đơn giản hóa hiểu biết về chức năng tác nhân và mẫu triển khai

#### Chi tiết kỹ thuật
- Cập nhật sơ đồ kiến trúc Mermaid với tham chiếu CustomerAgent
- Thay thế tên lớp CoraAgent bằng CustomerAgent trong ví dụ Python
- Sửa đổi cấu hình JSON mẫu ARM để sử dụng loại tác nhân "customer"
- Cập nhật biến môi trường từ CORA_AGENT_* sang CUSTOMER_AGENT_*
- Làm mới tất cả lệnh triển khai và cấu hình container

### [v3.0.0] - 2025-09-12

#### Thay đổi lớn - Tập trung nhà phát triển AI và tích hợp Microsoft Foundry
**Phiên bản này biến kho lưu trữ thành nguồn tài nguyên học tập toàn diện dành cho AI với tích hợp Microsoft Foundry.**

#### Đã thêm
- **🤖 Lộ trình học tập AI-First**: Tái cấu trúc hoàn chỉnh ưu tiên nhà phát triển và kỹ sư AI
- **Hướng dẫn tích hợp Microsoft Foundry**: Tài liệu chi tiết kết nối AZD với dịch vụ Microsoft Foundry
- **Mẫu triển khai mô hình AI**: Hướng dẫn chi tiết lựa chọn mô hình, cấu hình, và chiến lược triển khai sản xuất
- **Phòng thí nghiệm hội thảo AI**: Hội thảo thực hành 2-3 giờ chuyển đổi ứng dụng AI thành giải pháp triển khai AZD
- **Thực hành tốt nhất AI trong sản xuất**: Mẫu doanh nghiệp sẵn sàng cho mở rộng, giám sát, và bảo mật khối lượng công việc AI
- **Hướng dẫn khắc phục sự cố đặc thù AI**: Hướng dẫn toàn diện xử lý sự cố với Microsoft Foundry Models, Cognitive Services và triển khai AI
- **Bộ sưu tập mẫu AI**: Tập hợp mẫu Microsoft Foundry nổi bật với đánh giá mức độ phức tạp
- **Tài liệu hội thảo**: Cấu trúc hội thảo hoàn chỉnh với phòng thí nghiệm thực hành và tài liệu tham khảo

#### Nâng cao
- **Cấu trúc README**: Tập trung nhà phát triển AI với dữ liệu quan tâm cộng đồng 45% từ Discord Microsoft Foundry
- **Lộ trình học tập**: Hành trình dành riêng cho nhà phát triển AI song song với hành trình truyền thống cho sinh viên và kỹ sư DevOps
- **Đề xuất mẫu**: Bộ mẫu AI nổi bật như azure-search-openai-demo, contoso-chat, và openai-chat-app-quickstart
- **Tích hợp cộng đồng**: Hỗ trợ cộng đồng Discord nâng cao với kênh và thảo luận chuyên biệt AI

#### Tập trung bảo mật & sản xuất
- **Mẫu Managed Identity**: Cấu hình xác thực và bảo mật đặc thù AI
- **Tối ưu chi phí**: Theo dõi sử dụng token và kiểm soát ngân sách cho khối lượng AI
- **Triển khai đa vùng**: Chiến lược triển khai ứng dụng AI toàn cầu
- **Giám sát hiệu suất**: Chỉ số đặc thù AI và tích hợp Application Insights

#### Chất lượng tài liệu
- **Cấu trúc khóa học tuyến tính**: Tiến trình hợp lý từ mẫu cơ bản đến nâng cao triển khai AI
- **URL đã kiểm tra**: Tất cả liên kết kho lưu trữ bên ngoài được xác thực và truy cập được
- **Tài liệu tham khảo đầy đủ**: Liên kết tài liệu nội bộ được xác minh và hoạt động
- **Sẵn sàng sản xuất**: Mẫu triển khai doanh nghiệp với ví dụ thực tế

### [v2.0.0] - 2025-09-09

#### Thay đổi lớn - Tái cấu trúc kho lưu trữ và nâng cao chuyên nghiệp
**Phiên bản này đại diện cho sự đại tu lớn về cấu trúc kho lưu trữ và cách trình bày nội dung.**

#### Đã thêm
- **Khung học tập có cấu trúc**: Tất cả trang tài liệu bao gồm phần Giới thiệu, Mục tiêu học tập, và Kết quả học tập
- **Hệ thống điều hướng**: Thêm liên kết bài học Trước/Sau trong toàn bộ tài liệu để hướng dẫn tiến trình học
- **Hướng dẫn học tập**: Tập tin study-guide.md toàn diện với mục tiêu học tập, bài tập thực hành, và tài liệu đánh giá
- **Trình bày chuyên nghiệp**: Bỏ tất cả biểu tượng emoji để cải thiện khả năng truy cập và giao diện chuyên nghiệp
- **Cấu trúc nội dung nâng cao**: Tổ chức và luồng tài liệu học tập được cải thiện

#### Đã thay đổi
- **Định dạng tài liệu**: Chuẩn hóa toàn bộ tài liệu với cấu trúc tập trung vào học tập nhất quán
- **Luồng điều hướng**: Triển khai tiến trình logic qua toàn bộ tài liệu học
- **Trình bày nội dung**: Loại bỏ các yếu tố trang trí để thay bằng định dạng rõ ràng, chuyên nghiệp
- **Cấu trúc liên kết**: Cập nhật toàn bộ liên kết nội bộ hỗ trợ hệ thống điều hướng mới

#### Cải thiện
- **Khả năng truy cập**: Loại bỏ phụ thuộc emoji để tương thích tốt hơn với trình đọc màn hình
- **Giao diện chuyên nghiệp**: Trình bày gọn gàng, kiểu học thuật phù hợp học tập doanh nghiệp
- **Trải nghiệm học tập**: Phương pháp có cấu trúc với mục tiêu và kết quả rõ ràng cho mỗi bài học
- **Tổ chức nội dung**: Luồng logic và kết nối chủ đề liên quan tốt hơn

### [v1.0.0] - 2025-09-09

#### Phát hành ban đầu - Kho học tập AZD toàn diện

#### Đã thêm
- **Cấu trúc tài liệu cốt lõi**
  - Bộ hướng dẫn bắt đầu đầy đủ
  - Tài liệu triển khai và cung cấp toàn diện
  - Tài nguyên khắc phục sự cố và hướng dẫn gỡ lỗi chi tiết
  - Công cụ và quy trình xác thực trước triển khai

- **Mô-đun Bắt đầu**
  - Những kiến thức cơ bản AZD: Khái niệm và thuật ngữ cốt lõi
  - Hướng dẫn cài đặt: Hướng dẫn thiết lập theo nền tảng
  - Hướng dẫn cấu hình: Thiết lập môi trường và xác thực
  - Hướng dẫn dự án đầu tiên: Học thực hành từng bước

- **Mô-đun Triển khai và Cung cấp**
  - Hướng dẫn triển khai: Tài liệu quy trình làm việc đầy đủ
  - Hướng dẫn cung cấp hạ tầng as Code với Bicep
  - Thực hành tốt nhất cho triển khai sản xuất
  - Mẫu kiến trúc đa dịch vụ

- **Mô-đun Xác thực trước triển khai**
  - Dự báo năng lực: Xác thực khả năng tài nguyên Azure
  - Lựa chọn SKU: Hướng dẫn cấp độ dịch vụ toàn diện
  - Kiểm tra trước bay: Script xác thực tự động (PowerShell và Bash)
  - Công cụ ước tính chi phí và lập kế hoạch ngân sách

- **Mô-đun Khắc phục sự cố**
  - Vấn đề thường gặp: Các sự cố và giải pháp phổ biến
  - Hướng dẫn gỡ lỗi: Phương pháp luận giải quyết vấn đề có hệ thống
  - Kỹ thuật và công cụ chẩn đoán nâng cao
  - Giám sát hiệu năng và tối ưu hóa

- **Tài nguyên và Tham khảo**
  - Bảng mẹo lệnh: Tham khảo nhanh các lệnh thiết yếu
  - Thuật ngữ: Định nghĩa thuật ngữ và từ viết tắt toàn diện
  - Câu hỏi thường gặp: Câu trả lời chi tiết cho các câu hỏi phổ biến
  - Liên kết tài nguyên bên ngoài và kết nối cộng đồng

- **Ví dụ và Mẫu**
  - Ví dụ ứng dụng web đơn giản
  - Mẫu triển khai website tĩnh
  - Cấu hình ứng dụng container
  - Mẫu tích hợp cơ sở dữ liệu
  - Ví dụ kiến trúc dịch vụ vi mô
  - Triển khai hàm không máy chủ

#### Tính năng
- **Hỗ trợ đa nền tảng**: Hướng dẫn cài đặt và cấu hình cho Windows, macOS và Linux
- **Nhiều cấp độ kỹ năng**: Nội dung thiết kế cho sinh viên đến nhà phát triển chuyên nghiệp
- **Tập trung thực hành**: Ví dụ thực hành và kịch bản thực tế
- **Bao phủ toàn diện**: Từ khái niệm cơ bản đến mẫu doanh nghiệp nâng cao
- **Tiếp cận ưu tiên bảo mật**: Thực hành bảo mật tích hợp xuyên suốt
- **Tối ưu chi phí**: Hướng dẫn triển khai hiệu quả và quản lý tài nguyên

#### Chất lượng tài liệu
- **Ví dụ mã chi tiết**: Mẫu mã thực tế, đã được kiểm tra
- **Hướng dẫn từng bước**: Chỉ dẫn rõ ràng và có thể hành động
- **Xử lý lỗi toàn diện**: Khắc phục sự cố cho các vấn đề phổ biến
- **Tích hợp thực hành tốt nhất**: Tiêu chuẩn ngành và đề xuất
- **Tương thích phiên bản**: Cập nhật với những dịch vụ Azure và tính năng azd mới nhất

## Các cải tiến dự kiến trong tương lai

### Phiên bản 3.1.0 (Dự kiến)
#### Mở rộng nền tảng AI
- **Hỗ trợ đa mô hình**: Mẫu tích hợp cho Hugging Face, Azure Machine Learning, và mô hình tùy chỉnh
- **Khung tác nhân AI**: Mẫu triển khai LangChain, Semantic Kernel, và AutoGen
- **Mẫu RAG nâng cao**: Tùy chọn cơ sở dữ liệu vector ngoài Azure AI Search (Pinecone, Weaviate, v.v.)
- **Khả năng quan sát AI**: Giám sát nâng cao hiệu suất mô hình, sử dụng token, và chất lượng phản hồi

#### Trải nghiệm nhà phát triển
- **Tiện ích mở rộng VS Code**: Trải nghiệm phát triển tích hợp AZD + Microsoft Foundry
- **Tích hợp GitHub Copilot**: Tạo mẫu AZD có trợ giúp AI
- **Hướng dẫn tương tác**: Bài tập mã thực hành với xác thực tự động cho các kịch bản AI
- **Nội dung video**: Hướng dẫn video bổ sung cho học viên thị giác tập trung vào triển khai AI

### Phiên bản 4.0.0 (Dự kiến)
#### Mẫu AI Doanh nghiệp
- **Khung quản trị**: Quản trị mô hình AI, tuân thủ và dấu vết kiểm toán
- **AI đa khách hàng**: Mẫu phục vụ nhiều khách với dịch vụ AI riêng biệt
- **Triển khai AI Edge**: Tích hợp với Azure IoT Edge và các phiên bản container
- **AI Đám mây lai**: Mẫu triển khai đa đám mây và lai cho khối lượng AI

#### Tính năng nâng cao
- **Tự động hóa pipeline AI**: Tích hợp MLOps với pipeline Azure Machine Learning
- **Bảo mật nâng cao**: Mẫu zero-trust, endpoint riêng tư và bảo vệ mối đe dọa nâng cao
- **Tối ưu hiệu suất**: Chiến lược tinh chỉnh và mở rộng nâng cao cho ứng dụng AI tải cao
- **Phân phối toàn cầu**: Mẫu phân phối nội dung và lưu vào bộ nhớ đệm edge cho AI

### Phiên bản 3.0.0 (Dự kiến) - Đã được thay thế bởi bản phát hành hiện tại
#### Các bổ sung đề xuất - Đã thực hiện trong v3.0.0
- ✅ **Nội dung tập trung AI**: Tích hợp Microsoft Foundry toàn diện (Hoàn thành)
- ✅ **Hướng dẫn tương tác**: Hội thảo thực hành AI (Hoàn thành)
- ✅ **Mô-đun bảo mật nâng cao**: Mẫu bảo mật AI (Hoàn thành)
- ✅ **Tối ưu hiệu suất**: Chiến lược tinh chỉnh khối lượng AI (Hoàn thành)

### Phiên bản 2.1.0 (Dự kiến) - Triển khai một phần trong v3.0.0
#### Cải tiến nhỏ - Một số hoàn thành trong bản phát hành hiện tại
- ✅ **Ví dụ bổ sung**: Kịch bản triển khai tập trung AI (Hoàn thành)
- ✅ **FAQ mở rộng**: Câu hỏi và khắc phục sự cố đặc thù AI (Hoàn thành)
- **Tích hợp công cụ**: Hướng dẫn tích hợp IDE và trình soạn thảo nâng cao
- ✅ **Mở rộng giám sát**: Mẫu giám sát và cảnh báo đặc thù AI (Hoàn thành)

#### Vẫn dự kiến cho bản phát hành tương lai
- **Tài liệu thân thiện di động**: Thiết kế đáp ứng cho học tập trên thiết bị di động
- **Truy cập ngoại tuyến**: Gói tài liệu có thể tải về
- **Tích hợp IDE nâng cao**: Tiện ích mở rộng VS Code cho luồng công việc AZD + AI
- **Bảng điều khiển cộng đồng**: Chỉ số cộng đồng thời gian thực và theo dõi đóng góp

## Góp phần vào nhật ký thay đổi

### Báo cáo thay đổi
Khi đóng góp vào kho lưu trữ này, vui lòng đảm bảo mục nhật ký thay đổi bao gồm:

1. **Số phiên bản**: Theo quy ước phiên bản ngữ nghĩa (major.minor.patch)
2. **Ngày**: Ngày phát hành hoặc cập nhật định dạng YYYY-MM-DD
3. **Danh mục**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Mô tả rõ ràng**: Mô tả ngắn gọn về những gì đã thay đổi
5. **Đánh giá tác động**: Cách thay đổi ảnh hưởng đến người dùng hiện tại

### Các danh mục thay đổi

#### Đã thêm
- Các tính năng mới, phần tài liệu hoặc năng lực mới
- Ví dụ mới, mẫu hoặc tài nguyên học tập mới
- Công cụ, script, hoặc tiện ích bổ sung

#### Đã thay đổi
- Sửa đổi chức năng hoặc tài liệu hiện có
- Cập nhật nâng cao tính rõ ràng hoặc chính xác
- Tái cấu trúc nội dung hoặc tổ chức

#### Ngưng sử dụng
- Tính năng hoặc cách tiếp cận đang được loại bỏ dần
- Phần tài liệu dự kiến xóa bỏ
- Phương pháp có lựa chọn thay thế tốt hơn

#### Đã xóa
- Tính năng, tài liệu hoặc ví dụ không còn phù hợp
- Thông tin lỗi thời hoặc cách tiếp cận ngưng sử dụng
- Nội dung trùng lặp hoặc hợp nhất

#### Đã sửa
- Chỉnh sửa lỗi trong tài liệu hoặc mã
- Giải quyết các vấn đề hoặc lỗi đã báo cáo
- Cải thiện tính chính xác hoặc chức năng


#### Bảo mật
- Cải tiến hoặc sửa lỗi liên quan đến bảo mật
- Cập nhật các thực hành bảo mật tốt nhất
- Khắc phục các lỗ hổng bảo mật

### Hướng dẫn Phiên bản Ngữ nghĩa

#### Phiên bản Chính (X.0.0)
- Thay đổi phá vỡ yêu cầu người dùng hành động
- Tái cấu trúc đáng kể về nội dung hoặc tổ chức
- Thay đổi làm thay đổi cách tiếp cận hoặc phương pháp cơ bản

#### Phiên bản Phụ (X.Y.0)
- Tính năng mới hoặc bổ sung nội dung
- Cải tiến duy trì tương thích ngược
- Thêm ví dụ, công cụ hoặc nguồn tài nguyên

#### Phiên bản Vá lỗi (X.Y.Z)
- Sửa lỗi và chỉnh sửa
- Cải tiến nhỏ cho nội dung hiện có
- Làm rõ và các cải tiến nhỏ

## Phản hồi và Đề xuất từ Cộng đồng

Chúng tôi tích cực khuyến khích phản hồi từ cộng đồng để cải thiện tài nguyên học tập này:

### Cách cung cấp phản hồi
- **GitHub Issues**: Báo cáo vấn đề hoặc đề xuất cải tiến (vấn đề liên quan AI rất hoan nghênh)
- **Discord Discussions**: Chia sẻ ý tưởng và tham gia cộng đồng Microsoft Foundry
- **Pull Requests**: Đóng góp cải tiến trực tiếp cho nội dung, đặc biệt mẫu và hướng dẫn AI
- **Microsoft Foundry Discord**: Tham gia kênh #Azure cho thảo luận AZD + AI
- **Diễn đàn Cộng đồng**: Tham gia các cuộc thảo luận rộng hơn cho nhà phát triển Azure

### Các loại phản hồi
- **Độ chính xác Nội dung AI**: Sửa thông tin tích hợp và triển khai dịch vụ AI
- **Trải nghiệm Học tập**: Đề xuất cải thiện luồng học AI cho nhà phát triển
- **Nội dung AI Thiếu**: Yêu cầu thêm mẫu, mẫu thiết kế hoặc ví dụ AI
- **Khả năng tiếp cận**: Cải tiến đáp ứng nhu cầu học tập đa dạng
- **Tích hợp Công cụ AI**: Đề xuất tích hợp luồng phát triển AI tốt hơn
- **Mẫu triển khai AI sản xuất**: Yêu cầu mẫu triển khai AI doanh nghiệp

### Cam kết Phản hồi
- **Phản hồi Vấn đề**: Trong vòng 48 giờ đối với các sự cố đã báo cáo
- **Yêu cầu Tính năng**: Đánh giá trong vòng một tuần
- **Đóng góp Cộng đồng**: Xem xét trong vòng một tuần
- **Vấn đề Bảo mật**: Ưu tiên hàng đầu với phản hồi nhanh chóng

## Lịch trình Bảo trì

### Cập nhật Định kỳ
- **Xem xét Hàng tháng**: Kiểm tra độ chính xác nội dung và liên kết
- **Cập nhật Hàng quý**: Bổ sung và cải tiến nội dung lớn
- **Xem xét Nửa năm**: Tái cấu trúc và nâng cao tổng thể
- **Phát hành Hàng năm**: Cập nhật phiên bản chính với cải tiến lớn

### Giám sát và Đảm bảo Chất lượng
- **Kiểm thử Tự động**: Kiểm tra định kỳ ví dụ mã và liên kết
- **Tích hợp Phản hồi Cộng đồng**: Thường xuyên đưa các đề xuất người dùng vào
- **Cập nhật Công nghệ**: Đồng bộ với dịch vụ Azure mới nhất và phiên bản azd
- **Kiểm tra Khả năng tiếp cận**: Đánh giá thường xuyên về nguyên tắc thiết kế bao trùm

## Chính sách Hỗ trợ Phiên bản

### Hỗ trợ Phiên bản Hiện tại
- **Phiên bản Chính mới nhất**: Hỗ trợ đầy đủ với cập nhật định kỳ
- **Phiên bản Chính trước đó**: Cập nhật bảo mật và sửa lỗi quan trọng trong 12 tháng
- **Phiên bản Cũ**: Chỉ hỗ trợ cộng đồng, không cập nhật chính thức

### Hướng dẫn Di cư
Khi phiên bản chính được phát hành, chúng tôi cung cấp:
- **Hướng dẫn Di cư**: Hướng dẫn chuyển đổi từng bước
- **Ghi chú Tương thích**: Chi tiết về các thay đổi phá vỡ
- **Hỗ trợ Công cụ**: Các tập lệnh hoặc tiện ích hỗ trợ di cư
- **Hỗ trợ Cộng đồng**: Diễn đàn chuyên biệt cho câu hỏi di cư

---

**Điều hướng**
- **Bài học Trước**: [Hướng dẫn Học tập](resources/study-guide.md)
- **Bài học Kế tiếp**: Quay lại [README Chính](README.md)

**Luôn cập nhật**: Theo dõi kho lưu trữ này để nhận thông báo về các bản phát hành mới và cập nhật quan trọng cho tài liệu học tập.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->