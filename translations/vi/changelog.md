# Nhật ký thay đổi - AZD Cho Người Mới Bắt Đầu

## Giới thiệu

Nhật ký thay đổi này ghi nhận tất cả các thay đổi, cập nhật và cải tiến đáng chú ý cho kho AZD Cho Người Mới Bắt Đầu. Chúng tôi tuân theo các nguyên tắc về phiên bản ngữ nghĩa và duy trì nhật ký này để giúp người dùng hiểu những gì đã thay đổi giữa các phiên bản.

## Mục tiêu học tập

Khi xem lại nhật ký thay đổi này, bạn sẽ:
- Cập nhật thông tin về các tính năng mới và nội dung được bổ sung
- Hiểu được các cải tiến đối với tài liệu hiện có
- Theo dõi các sửa lỗi và điều chỉnh để đảm bảo tính chính xác
- Theo dõi quá trình phát triển của các tài liệu học tập theo thời gian

## Kết quả học tập

Sau khi xem xong các mục trong nhật ký thay đổi, bạn sẽ có khả năng:
- Nhận biết nội dung và tài nguyên mới có sẵn để học tập
- Hiểu được những phần nào đã được cập nhật hoặc cải tiến
- Lập kế hoạch lộ trình học dựa trên tài liệu cập nhật nhất
- Đóng góp phản hồi và gợi ý cho các cải tiến tương lai

## Lịch sử phiên bản

### [v3.24.0]- 2026-11-04

#### Đã sửa
- Sửa lỗi điều hướng khóa học tiếng Anh, các đường dẫn trang đã di chuyển, các mỏ neo bị thiếu và các tham chiếu bên ngoài lỗi thời, bao gồm liên kết Chương 2 đến hướng dẫn AI sản xuất.
- Xem xét lại hướng dẫn hiện tại so với AZD 1.37.2 đã phát hành, các tác nhân 1.0.0-beta.23, và các đánh giá 1.0.0-beta.2. Ghi lại quy trình làm việc `azd ai eval` riêng biệt và di chuyển cấu hình tối ưu hóa.
- Chỉnh sửa các cờ CLI không được hỗ trợ, ranh giới xác thực, hướng dẫn về môi trường / bí mật dạng văn bản thuần, cập nhật hạ tầng, cấu hình mô hình và các ví dụ phục hồi phá hủy.
- Cập nhật hội thảo dựa trên mẫu AI Agents hiện tại, bao gồm các hook thực tế, đầu vào cấu hình, bài kiểm tra đánh giá, các điểm nhập red-teaming và khả năng quan sát.
- Điều chỉnh các tuyên bố triển khai ví dụ và sửa các vấn đề liên quan về ứng dụng / hạ tầng / cấu hình. Tài liệu kiến trúc bán lẻ được phân biệt rõ ràng với ứng dụng làm việc hoàn chỉnh.
- Phục hồi ma trận ngôn ngữ CodeQL, chọn Node.js 24 được hỗ trợ cho container phát triển, và khiến các trình xác nhận thiết lập báo cáo các lệnh phiên bản thất bại.

#### Đã thêm
- Một trình kiểm tra liên kết/mỏ neo ngoại tuyến chỉ bằng tiếng Anh, các bài kiểm tra hồi quy, và một quy trình làm việc tài liệu cũng xây dựng hội thảo ở chế độ nghiêm ngặt. Các bản dịch đã tạo và hình ảnh dịch được loại trừ.

#### Phạm vi xác thực
- Kiểm tra nguồn, cú pháp, cấu hình, hành vi cục bộ và liên kết mạng không thiết lập khả năng triển khai Azure trực tiếp, quota, RBAC, tính sẵn có mô hình theo khu vực, thanh toán, tuân thủ bảo mật hoặc sẵn sàng sản xuất.
- Các mục cũ hơn dưới đây là hồ sơ lịch sử, không phải là hướng dẫn lệnh hoặc phát hành hiện tại.

### [v3.23.0] - 2026-07-13

#### Cập nhật AZD 1.27.1: Cập nhật phiên bản hiện tại
**Phiên bản này xác thực lại khóa học với `azd` `1.27.1` (Tháng 7 năm 2026, phát hành ổn định mới nhất) và phần mở rộng tác nhân AI xem trước hiện tại `azure.ai.agents` `1.0.0-beta.5`, cập nhật mọi banner “đã xác thực với” sau các phát hành 1.26.0, 1.27.0 và 1.27.1.**

#### Đã thay đổi
- **✅ Cơ sở xác thực cập nhật** từ `azd 1.25.6` (Tháng 6 năm 2026) sang `azd 1.27.1` (Tháng 7 năm 2026) trên README gốc, tất cả README các chương, bài học dev-container Chương 1 (bao gồm các ví dụ phiên bản cố định), bài học mẫu tùy chỉnh Chương 4, bài học đa tác nhân Chương 5, và tài liệu hội thảo
- **🤖 Cơ sở Chương 2 làm mới** từ `azd 1.23.12` (Tháng 3 năm 2026) sang `azd 1.27.1` trên `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, và `microsoft-foundry-integration.md`; ngày ghi chú xác thực cập nhật thành 2026-07-13
- **🧩 Phần mở rộng tác nhân AI tăng phiên bản** từ `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` lên phiên bản `1.0.0-beta.5` hiện tại trong README Chương 2 và `agents.md`
- **🧪 Ví dụ xác thực hội thảo** (đầu ra `azd version`) cập nhật đến `1.27.1`

#### Ghi chú về các phát hành azd liên quan (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Hỗ trợ Go cho Azure Functions trên Flex Consumption, bộ lọc đăng ký theo thuê `azd config sub-filter`, gói phần mở rộng tự chứa (`azd x pack --bundle`), và `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Mô hình dự án/tác nhân Azure AI Foundry trực tiếp trong `azure.yaml` (khởi tạo không Bicep/Terraform), hỗ trợ triển khai container cho App Service (`host: appservice` + `language: docker`), `-s/--source` trực tiếp cho các lệnh `azd extension`, và `azd tool uninstall`
- **1.27.1 (2026-07-09):** Cờ `--no-dependencies` cho `azd extension install`, loại trừ các mô hình lỗi thời khỏi các nhắc nhở danh mục/quota mặc định, và một số sửa lỗi

#### Các tập tin đã cập nhật
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

#### Bổ sung kỹ năng cho người mới #2: Tác giả mẫu, Dev Containers, Pulumi, Azure DevOps, Service Principals, và nhiều hơn nữa
**Phiên bản này khép lại các khoảng trống trung cấp còn lại được phân tích bởi azd-coverage: cách tạo và xuất bản mẫu của riêng bạn, môi trường dev-container/Codespaces có thể tái tạo, nhà cung cấp hạ tầng Pulumi, hướng dẫn CI/CD Azure DevOps, xác thực service-principal, hướng dẫn chọn máy chủ (AKS/Spring Apps), giải thích `azd restore`/`azd package`, xử lý lỗi hook, và các thực hành môi trường nhóm/chung.**

#### Đã thêm
- **🧱 Bài học mới Chương 4** `docs/chapter-04-infrastructure/custom-templates.md` — tạo mẫu azd của riêng bạn: cấu trúc bắt buộc (`azure.yaml`, `infra/`, `src/`), trường `metadata.template`, tham số hạ tầng với token tài nguyên `uniqueString()` và thẻ `azd-env-name`, kiểm thử cục bộ với `azd init --template <local-path>`, xuất bản lên GitHub, và nộp vào thư viện Awesome AZD
- **📦 Bài học mới Chương 1** `docs/chapter-01-foundation/dev-containers.md` — môi trường azd có thể tái tạo với Dev Containers và GitHub Codespaces: một `.devcontainer/devcontainer.json` tối giản sử dụng tính năng chính thức `ghcr.io/azure/azure-dev/azd`, các tính năng theo ngôn ngữ, `docker-in-docker` cho máy chủ container, và `azd auth login --use-device-code` cho đăng nhập từ xa
- **🧩 Phần Pulumi với azd** trong `docs/chapter-04-infrastructure/provisioning.md` — cấu hình `infra.provider: pulumi`, bố cục thư mục Pulumi, các ngăn xếp tương ứng với môi trường azd, đầu ra/thẻ bắt buộc `azd up`, và quy trình làm việc `azd down` giống hệt
- **🎯 Hướng dẫn chọn máy chủ** trong `docs/chapter-04-infrastructure/provisioning.md` — so sánh thân thiện cho người mới về `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, và `springapp`, với hướng dẫn khi nào chọn AKS hoặc Azure Spring Apps
- **🛠️ Hướng dẫn CI/CD Azure DevOps** trong `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, kết nối dịch vụ với hội nhập nhận dạng tải công việc (OIDC), `azure-dev.yml` tạo tự động, và thiết lập nhóm biến
- **🔑 Service Principals (Mẫu 4)** thêm vào `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` không tương tác với bí mật khách hàng so với chứng thực liên kết/OIDC, khi nào sử dụng, và lưu trữ chứng thực an toàn
- **🪝 Xử lý lỗi hook** phân mục trong `docs/chapter-04-infrastructure/deployment-guide.md` — mã thoát và `set -e`, `continueOnError`, kiểm thử hooks cô lập với `azd hooks run`, shell riêng theo HĐH, và `--debug`
- **👥 Môi trường nhóm / chia sẻ** trong `docs/chapter-03-configuration/configuration.md` — gì nằm trong `.azure/`, cái gì cần gitignore, môi trường riêng cho từng lập trình viên, `azd env list`/`select`, và cung cấp giá trị môi trường trong CI/CD
- **🧰 `azd restore` và giải thích mở rộng `azd package`** trong `resources/cheat-sheet.md` — khôi phục phụ thuộc và xây dựng một bản ứng dụng có thể triển khai mà không cần triển khai

#### Đã thay đổi
- **🧭 Bảng bài học Chương 4** cập nhật để bao gồm bài học mới "Tạo mẫu của riêng bạn" (Bài 3)
- **🧭 Bảng bài học Chương 1** cập nhật để bao gồm bài học mới "Dev Containers & Codespaces" (Bài 5); chân trang điều hướng kết nối giữa `bring-your-own-app.md` và `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Bổ sung kỹ năng cho người mới: Bài học thực hành đa tác nhân, "Mang ứng dụng của bạn", Terraform, và Hướng dẫn CI/CD
**Phiên bản này xóa bỏ các khoảng trống lớn nhất cho một hướng dẫn người mới hoàn chỉnh bằng cách thêm hai bài học thực hành (hướng dẫn hai tác nhân triển khai và thêm azd vào ứng dụng có sẵn), giới thiệu hook thân thiện với người mới, phần Terraform với azd, hướng dẫn từng bước cho pipeline GitHub Actions, giải thích các phần mở rộng xem trước mới, và danh sách kiểm tra xác minh triển khai rõ ràng.**

#### Đã thêm
- **🤝 Bài học mới Chương 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — hướng dẫn thực hành đầy đủ, triển khai hai tác nhân (trình điều phối + chuyên gia) sử dụng mẫu thực (`contoso-creative-writer`), bao gồm khi nào dùng đa tác nhân, quy trình làm việc `azd up`, hiểu các tài nguyên triển khai, truy vết chéo tác nhân, tùy chỉnh và dọn dẹp
- **📦 Bài học mới Chương 1** `docs/chapter-01-foundation/bring-your-own-app.md` — cách thêm azd vào dự án hiện có với `azd init` ("sử dụng mã trong thư mục hiện tại"), hiểu `azure.yaml` và `infra/`, `azd infra generate`, phát hiện máy chủ và triển khai với `azd up`
- **🌐 Phần Terraform với azd** thêm vào `docs/chapter-04-infrastructure/provisioning.md` — cấu hình `infra.provider: terraform`, bố cục thư mục `.tf`, các đầu ra `AZURE_*` và thẻ `azd-env-name` bắt buộc, và quy trình làm việc `azd up` / `azd down` giống hệt (đóng khoảng trống nơi Terraform được ghi nhận hỗ trợ nhưng chỉ trình bày Bicep)
- **⚙️ Hướng dẫn từng bước GitHub Actions** trong `docs/chapter-08-production/production-ai-practices.md` — từ repo GitHub đến triển khai tự động: `azd pipeline config`, chứng thực liên kết OIDC (không lưu bí mật), `azure-dev.yml` tạo tự động, và hướng dẫn về bí mật so với biến
- **🪝 Giới thiệu "Mới với hooks?" cho người mới** trong `docs/chapter-04-infrastructure/deployment-guide.md` — hook là gì, bảng các giai đoạn hook, hook đầu tiên tối giản, và chạy hook thủ công với `azd hooks run`
- **✅ Danh sách kiểm tra "Xác minh triển khai của bạn"** thêm vào Bước 5 của `docs/chapter-01-foundation/first-project.md` — kiểm tra khói, kiểm tra điểm cuối sức khỏe, và tiêu chí thành công rõ ràng
- **🧩 Giải thích cho các phần mở rộng xem trước mới** `azure.ai.skills` và `azure.ai.connections` (chúng là gì và khi nào nên dùng) trong `docs/chapter-08-production/production-ai-practices.md`

#### Đã thay đổi
- **🧭 Bảng bài học Chương 5** điều chỉnh: `multi-agent-basics.md` trở thành Bài 1 (bài học thực hành đầy đủ duy nhất), với nhãn rõ ràng rằng Bài 2 nằm trong Chương 6 và kịch bản Bán lẻ là bản thiết kế kiến trúc, không phải mẫu một lệnh
- **🧭 Bảng bài học Chương 1** hiện bao gồm bài học mới "Mang ứng dụng của bạn" (Bài 4)
- **🔗 Chân trang điều hướng** cập nhật: `first-project.md` bây giờ liên kết tới `bring-your-own-app.md`

#### Đã sửa
- **🧱 Khép lại khoảng trống Terraform tuyên bố nhưng thiếu** — khóa học trước đây đã nói về hỗ trợ Terraform mà không trình bày
- **🔀 Sửa các liên kết chéo Chương 5 gây hiểu lầm** rằng có triển khai đa tác nhân đầy đủ trong khi chỉ là bản thiết kế kiến trúc

#### Các tập tin đã cập nhật
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

#### Làm mới AZD 1.25.6, Lệnh Toàn bộ Vòng đời Đại lý & Thương hiệu Aspire
**Phiên bản này xác thực lại khóa học với `azd` `1.25.6` (Tháng 6 năm 2026) và phần mở rộng `azure.ai.agents` `0.1.40-preview`, mở rộng hướng dẫn AI từ "giàn dựng đại lý" sang toàn bộ vòng đời đại lý (kiểm tra → đánh giá → tối ưu → kiểm tra → xóa), hiển thị các phần mở rộng xem trước `azure.ai.skills` và `azure.ai.connections` mới, và ghi chú việc đổi thương hiệu sản phẩm từ ".NET Aspire" sang "Aspire".**

#### Đã thêm
- **🔁 Bao phủ toàn bộ vòng đời đại lý** cho người mới bắt đầu và kỹ sư AI trên toàn bộ tài liệu:
  - `docs/chapter-01-foundation/azd-basics.md` — Bảng vòng đời (giàn dựng → kiểm tra → đo lường → cải thiện → kiểm tra → dọn dẹp) được thêm vào phần Phần mở rộng và Lệnh AI
  - `docs/chapter-08-production/production-ai-practices.md` — Mục mới "Quản lý Vòng đời Đại lý" bao gồm `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, và `delete --force`
  - `resources/cheat-sheet.md` — Mở rộng Lệnh Đại lý AI với `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, và `delete --force`
- **🧩 Phần mở rộng xem trước mới** được ghi lại: `azure.ai.skills` (kỹ năng đại lý có thể tái sử dụng) và `azure.ai.connections` (kết nối Foundry) được thêm vào bảng phần mở rộng và cheat sheet
- **⏱️ Hướng dẫn thời gian phản hồi** — ví dụ `azd ai agent invoke` hiện nay chỉ ra rằng nó in ra độ trễ tổng và thời gian đến byte đầu tiên
- **📌 Banner phiên bản** trong README gốc chỉ dẫn học viên tới `azd version` và `azd upgrade`

#### Thay đổi
- **✅ Cập nhật cơ sở xác thực** từ `azd 1.23.12` (Tháng 3 năm 2026) sang `azd 1.25.6` (Tháng 6 năm 2026) trên tất cả các README chương và tài liệu workshop
- **🤖 Ghi chú mở rộng Chương 2** cập nhật từ `azure.ai.agents` `0.1.18-preview` sang `0.1.40-preview`
- **🧪 Ví dụ xác thực workshop** (đầu ra `azd version`) cập nhật lên `1.25.6`
- **🧭 README "Có gì mới trong azd hôm nay"** được làm mới để nhấn mạnh vòng đời đại lý từ đầu đến cuối, các phần mở rộng AI mới, và các sửa lỗi cải thiện trải nghiệm gần đây (`azd init` idempotency, `azd auth login` xóa token hết hạn, `azd tool` lời nhắc lần đầu chạy)
- **📖 agents.md Chương 2 (Tùy chọn 4)** hiện chỉ dẫn học viên tới các lệnh vòng đời sau triển khai thay vì dừng tại `azd up`

#### Đã sửa
- **🏷️ Tên sản phẩm** — thêm ghi chú đổi thương hiệu Aspire (".NET Aspire" bây giờ chỉ gọi là "Aspire"); hỗ trợ Aspire trong azd không thay đổi
- **🔎 Xác thực phát hành trực tiếp** xác nhận với feed phát hành Azure Developer CLI: CLI ổn định `1.25.6` (2026-06-12) và `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Làm rõ Hướng dẫn Người mới, Xác thực Cài đặt & Dọn dẹp Lệnh AZD cuối cùng
**Phiên bản này theo sau đợt quét xác thực AZD 1.23 với một lượt tài liệu tập trung vào người mới: làm rõ hướng dẫn xác thực AZD đầu tiên, thêm các script xác thực cài đặt cục bộ, kiểm tra các lệnh chính với CLI AZD trực tiếp và loại bỏ các tham chiếu lệnh nguồn tiếng Anh lỗi thời cuối cùng ngoài changelog.**

#### Đã thêm
- **🧪 Script xác thực cài đặt người mới** với `validate-setup.ps1` và `validate-setup.sh` để người học có thể xác nhận công cụ cần thiết trước khi bắt đầu Chương 1
- **✅ Các bước xác thực cài đặt trước** trong README gốc và README Chương 1 để bắt lỗi thiếu điều kiện tiên quyết trước `azd up`

#### Thay đổi
- **🔐 Hướng dẫn xác thực cho người mới** giờ đây nhất quán coi `azd auth login` là đường dẫn chính cho các luồng công việc AZD, với `az login` được gọi là tùy chọn trừ khi các lệnh Azure CLI được dùng trực tiếp
- **📚 Luồng onboarding Chương 1** hiện chỉ dẫn người học xác thực cài đặt cục bộ trước khi cài đặt, xác thực và các bước triển khai đầu tiên
- **🛠️ Tin nhắn trình xác thực** giờ tách rõ ràng yêu cầu bắt buộc và cảnh báo Azure CLI tùy chọn cho đường dẫn người mới chỉ dùng AZD
- **📖 Cấu hình, khắc phục sự cố và tài liệu ví dụ** hiện phân biệt xác thực AZD bắt buộc và đăng nhập Azure CLI tùy chọn, nơi mà trước đây chúng được trình bày không có ngữ cảnh

#### Đã sửa
- **📋 Các tham chiếu lệnh nguồn tiếng Anh còn lại** cập nhật thành dạng AZD hiện tại, bao gồm `azd config show` trong cheat sheet và `azd monitor --overview` nơi hướng dẫn tổng quan Azure Portal được dự định
- **🧭 Các cam kết cho người mới trong Chương 1** được làm dịu để tránh hứa hẹn quá mức về hành vi không lỗi hoặc rollback đảm bảo trên tất cả mẫu và tài nguyên Azure
- **🔎 Xác thực CLI trực tiếp** xác nhận hỗ trợ hiện tại cho `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, và `azd down --force --purge`

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

#### Xác thực AZD 1.23.12, Mở rộng Môi trường Workshop & Làm mới Mô hình AI
**Phiên bản này thực hiện quét xác thực tài liệu với `azd` `1.23.12`, cập nhật các ví dụ lệnh AZD lỗi thời, làm mới hướng dẫn mô hình AI theo mặc định hiện nay, và mở rộng hướng dẫn workshop không chỉ trong GitHub Codespaces mà còn hỗ trợ dev container và bản sao cục bộ.**

#### Đã thêm
- **✅ Ghi chú xác thực trên các chương cốt lõi và tài liệu workshop** để làm rõ cơ sở AZD đã kiểm thử cho người học dùng các bản xây dựng CLI mới hoặc cũ hơn
- **⏱️ Hướng dẫn thời gian chờ triển khai** cho các triển khai ứng dụng AI chạy lâu dùng `azd deploy --timeout 1800`
- **🔎 Các bước kiểm tra phần mở rộng** với `azd extension show azure.ai.agents` trong tài liệu quy trình AI
- **🌐 Hướng dẫn môi trường workshop rộng hơn** bao gồm GitHub Codespaces, dev containers và bản sao cục bộ với MkDocs

#### Thay đổi
- **📚 README giới thiệu chương** giờ đây nhất quán ghi chú xác thực với `azd 1.23.12` trên nền tảng, cấu hình, hạ tầng, đa đại lý, trước triển khai, khắc phục sự cố và phần sản xuất
- **🛠️ Tham chiếu lệnh AZD** cập nhật thành các hình thức hiện tại trên toàn bộ tài liệu:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` hoặc `azd env get-value(s)` phụ thuộc ngữ cảnh
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` nơi mô tả tổng quan Application Insights được dự kiến
- **🧪 Ví dụ xem trước cung cấp** đơn giản hóa để dùng các cách sử dụng được hỗ trợ hiện nay như `azd provision --preview` và `azd provision --preview -e production`
- **🧭 Quy trình workshop** cập nhật để người học có thể hoàn thành các bài tập trong Codespaces, dev container hoặc bản sao cục bộ thay vì chỉ giả sử thực thi trong Codespaces
- **🔐 Hướng dẫn xác thực** giờ ưu tiên `azd auth login` cho các luồng công việc AZD, với `az login` được đặt là tùy chọn khi dùng các lệnh Azure CLI trực tiếp

#### Đã sửa
- **🪟 Lệnh cài đặt Windows** được chuẩn hóa thành tên gói viết hoa hiện tại `winget` trong hướng dẫn cài đặt
- **🐧 Hướng dẫn cài đặt Linux** sửa thành tránh các hướng dẫn trình quản lý gói `azd` phân phối đặc thù không được hỗ trợ và thay vào đó trỏ tới các tài nguyên phát hành khi phù hợp
- **📦 Ví dụ mô hình AI** được làm mới từ các mặc định cũ như `gpt-35-turbo` và `text-embedding-ada-002` sang các ví dụ hiện tại như `gpt-4.1-mini`, `gpt-4.1`, và `text-embedding-3-large`
- **📋 Đoạn mã triển khai và chẩn đoán** sửa để dùng các lệnh môi trường và trạng thái hiện tại trong nhật ký, script và các bước khắc phục sự cố
- **⚙️ Hướng dẫn GitHub Actions** cập nhật từ `Azure/setup-azd@v1.0.0` sang `Azure/setup-azd@v2`
- **🤖 Hướng dẫn đồng ý MCP/Copilot** cập nhật từ `azd mcp consent` sang `azd copilot consent list`

#### Cải tiến
- **🧠 Hướng dẫn chương AI** giải thích rõ hơn hành vi nhạy cảm với xem trước `azd ai`, đăng nhập theo tenant, sử dụng phần mở rộng hiện tại, và đề xuất triển khai mô hình cập nhật
- **🧪 Hướng dẫn workshop** hiện dùng các ví dụ phiên bản thực tế hơn và ngôn ngữ thiết lập môi trường rõ ràng hơn cho bài tập thực hành
- **📈 Tài liệu sản xuất và khắc phục sự cố** bây giờ phù hợp hơn với các ví dụ giám sát hiện tại, mô hình dự phòng và tầng chi phí

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

#### Lệnh AZD AI CLI, Xác thực Nội dung & Mở rộng Mẫu
**Phiên bản này thêm `azd ai`, `azd extension`, và `azd mcp` bao phủ lệnh qua tất cả các chương liên quan đến AI, sửa các liên kết hỏng và mã đã lỗi thời trong agents.md, cập nhật cheat sheet, và đại tu phần Mẫu Ví dụ với mô tả đã xác thực và các mẫu Azure AI AZD mới.**

#### Đã thêm
- **🤖 Bao phủ AZD AI CLI** trên 7 tệp (trước đây chỉ trong Chương 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Mục mới "Phần mở rộng và Lệnh AI" giới thiệu `azd extension`, `azd ai agent init`, và `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Tùy chọn 4: `azd ai agent init` với bảng so sánh (mẫu so với phương pháp manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Các phân mục "Phần mở rộng AZD cho Foundry" và "Triển khai trước đại lý"
  - `docs/chapter-05-multi-agent/README.md` — Khởi đầu nhanh hiện hiển thị cả hai đường dẫn triển khai dựa trên mẫu và manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Phần triển khai giờ bao gồm tùy chọn `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Phân mục "Lệnh phần mở rộng AZD AI cho chẩn đoán"
  - `resources/cheat-sheet.md` — Mục mới "Lệnh AI & Phần mở rộng" với `azd extension`, `azd ai agent init`, `azd mcp`, và `azd infra generate`
- **📦 Mẫu ví dụ AZD AI mới** trong `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — trò chuyện RAG .NET với Blazor WebAssembly, Semantic Kernel và hỗ trợ trò chuyện bằng giọng nói
  - **azure-search-openai-demo-java** — trò chuyện RAG Java dùng Langchain4J với tùy chọn triển khai ACA/AKS
  - **contoso-creative-writer** — ứng dụng viết sáng tạo đa đại lý dùng Azure AI Agent Service, Bing Grounding, và Prompty
  - **serverless-chat-langchainjs** — RAG không máy chủ dùng Azure Functions + LangChain.js + Cosmos DB với hỗ trợ phát triển cục bộ Ollama
  - **chat-with-your-data-solution-accelerator** — Bộ tăng tốc RAG doanh nghiệp với cổng quản trị, tích hợp Teams, và tùy chọn PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Ứng dụng tham chiếu điều phối MCP đa tác nhân với server trong .NET, Python, Java, và TypeScript
  - **azd-ai-starter** — Mẫu khởi đầu Bicep hạ tầng Azure AI tối giản
  - **🔗 Liên kết Thư viện AZD AI Tuyệt vời** — Tham chiếu đến [thư viện AZD AI tuyệt vời](https://azure.github.io/awesome-azd/?tags=ai) (hơn 80 mẫu)

#### Đã sửa
- **🔗 điều hướng agents.md**: Các liên kết Trước/Sau bây giờ khớp với thứ tự bài học trong Chương 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 liên kết hỏng trong agents.md**: `production-ai-practices.md` được sửa thành `../chapter-08-production/production-ai-practices.md` (3 lần xuất hiện)
- **📦 mã lỗi trong agents.md**: Thay thế `opencensus` bằng `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API không hợp lệ trong agents.md**: Di chuyển `max_tokens` từ `create_agent()` sang `create_run()` như `max_completion_tokens`
- **🔢 đếm token trong agents.md**: Thay thế ước lượng thô `len//4` bằng `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Đã chỉnh sửa dịch vụ từ "Cognitive Search + App Service" thành "Azure AI Search + Azure Container Apps" (máy chủ mặc định thay đổi vào tháng 10 năm 2024)
- **contoso-chat**: Cập nhật mô tả để tham chiếu Azure AI Foundry + Prompty, phù hợp với tiêu đề và công nghệ thực tế của repo

#### Đã xóa
- **ai-document-processing**: Đã xóa tham chiếu mẫu không hoạt động (repo không công khai dưới dạng mẫu AZD)

#### Đã cải thiện
- **📝 bài tập agents.md**: Bài tập 1 hiện hiển thị kết quả mong đợi và bước `azd monitor`; Bài tập 2 bao gồm mã đăng ký đầy đủ `FunctionTool`; Bài tập 3 thay thế hướng dẫn mơ hồ bằng các lệnh `prepdocs.py` cụ thể
- **📚 tài nguyên agents.md**: Cập nhật liên kết tài liệu đến Azure AI Agent Service hiện tại và quickstart
- **📋 bảng Bước Tiếp Theo trong agents.md**: Thêm liên kết AI Workshop Lab cho bao quát toàn bộ chương

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
**Phiên bản này cải thiện điều hướng chương trong README.md với định dạng bảng nâng cao.**

#### Đổi thay
- **Bảng bản đồ khóa học**: Nâng cao với các liên kết bài học trực tiếp, ước lượng thời lượng, và đánh giá độ phức tạp
- **Dọn dẹp thư mục**: Xóa các thư mục cũ dư thừa (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Xác thực liên kết**: Kiểm tra tất cả hơn 21 liên kết nội bộ trong bảng Bản đồ Khóa học

### [v3.16.0] - 2026-02-05

#### Cập nhật tên sản phẩm
**Phiên bản này cập nhật các tham chiếu sản phẩm theo thương hiệu Microsoft hiện tại.**

#### Đổi thay
- **Microsoft Foundry → Microsoft Foundry**: Cập nhật tất cả các tham chiếu trong các tệp không dịch thuật
- **Azure AI Agent Service → Foundry Agents**: Cập nhật tên dịch vụ phản ánh thương hiệu hiện tại

#### Tệp đã cập nhật
- `README.md` - Trang chính của khóa học
- `changelog.md` - Lịch sử phiên bản
- `course-outline.md` - Cấu trúc khóa học
- `docs/chapter-02-ai-development/agents.md` - Hướng dẫn tác nhân AI
- `examples/README.md` - Tài liệu ví dụ
- `workshop/README.md` - Trang chính workshop
- `workshop/docs/index.md` - Chỉ mục workshop
- `workshop/docs/instructions/*.md` - Tất cả tệp hướng dẫn workshop

---

### [v3.15.0] - 2026-02-05

#### Tái cấu trúc repo quan trọng: Đổi tên thư mục theo chương
**Phiên bản này tái cấu trúc tài liệu thành các thư mục chương riêng biệt để điều hướng rõ ràng hơn.**

#### Đổi tên thư mục
Các thư mục cũ đã được thay thế bằng các thư mục theo số chương:
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
| Tất cả các tệp pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Tất cả các tệp troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Đã thêm
- **📚 Tệp README các chương**: Tạo README.md trong mỗi thư mục chương với:
  - Mục tiêu học tập và thời lượng
  - Bảng bài học với mô tả
  - Lệnh nhanh để bắt đầu
  - Điều hướng đến các chương khác

#### Đổi thay
- **🔗 Cập nhật tất cả liên kết nội bộ**: Hơn 78 đường dẫn được cập nhật trong toàn bộ tài liệu
- **🗺️ README.md chính**: Cập nhật Bản đồ Khóa học với cấu trúc chương mới
- **📝 examples/README.md**: Cập nhật tham chiếu chéo đến các thư mục chương

#### Đã xóa
- Cấu trúc thư mục cũ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Tái cấu trúc repo: Điều hướng chương
**Phiên bản này thêm các tệp README điều hướng chương (bị thay thế bởi v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Hướng dẫn AI Agents mới
**Phiên bản này bổ sung hướng dẫn toàn diện để triển khai AI agents với Azure Developer CLI.**

#### Đã thêm
- **🤖 docs/microsoft-foundry/agents.md**: Hướng dẫn đầy đủ bao gồm:
  - AI agents là gì và cách chúng khác chatbot
  - Ba mẫu agent khởi đầu nhanh (Foundry Agents, Prompty, RAG)
  - Các mẫu kiến trúc agent (agent đơn, RAG, đa tác nhân)
  - Cấu hình và tùy chỉnh công cụ
  - Giám sát và theo dõi số liệu
  - Các cân nhắc về chi phí và tối ưu hóa
  - Các tình huống xử lý sự cố phổ biến
  - Ba bài tập thực hành kèm tiêu chí thành công

#### Cấu trúc nội dung
- **Giới thiệu**: Khái niệm agent cho người mới bắt đầu
- **Khởi đầu nhanh**: Triển khai agents với `azd init --template get-started-with-ai-agents`
- **Mẫu kiến trúc**: Sơ đồ trực quan các mẫu agent
- **Cấu hình**: Thiết lập công cụ và biến môi trường
- **Giám sát**: Tích hợp Application Insights
- **Bài tập**: Học thực hành tiến độ (20-45 phút mỗi bài)

---

### [v3.12.0] - 2026-02-05

#### Cập nhật môi trường DevContainer
**Phiên bản này cập nhật cấu hình container phát triển với công cụ hiện đại và mặc định tốt hơn cho trải nghiệm học AZD.**

#### Đổi thay
- **🐳 Hình ảnh cơ sở**: Cập nhật từ `python:3.12-bullseye` thành `python:3.12-bookworm` (Debian stable mới nhất)
- **📛 Tên container**: Đổi từ "Python 3" thành "AZD for Beginners" để rõ ràng hơn

#### Đã thêm
- **🔧 Tính năng container phát triển mới**:
  - `azure-cli` với hỗ trợ Bicep được bật
  - `node:20` (phiên bản LTS cho các mẫu AZD)
  - `github-cli` cho quản lý mẫu
  - `docker-in-docker` cho triển khai container app

- **🔌 Chuyển tiếp cổng**: Các cổng được cấu hình sẵn cho phát triển phổ biến:
  - 8000 (xem trước MkDocs)
  - 3000 (ứng dụng web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Mở rộng VS Code mới**:
  - `ms-python.vscode-pylance` - Tăng cường IntelliSense Python
  - `ms-azuretools.vscode-azurefunctions` - Hỗ trợ Azure Functions
  - `ms-azuretools.vscode-docker` - Hỗ trợ Docker
  - `ms-azuretools.vscode-bicep` - Hỗ trợ ngôn ngữ Bicep
  - `ms-azure-devtools.azure-resource-groups` - Quản lý tài nguyên Azure
  - `yzhang.markdown-all-in-one` - Chỉnh sửa Markdown
  - `DavidAnson.vscode-markdownlint` - Kiểm tra lỗi Markdown
  - `bierner.markdown-mermaid` - Hỗ trợ sơ đồ Mermaid
  - `redhat.vscode-yaml` - Hỗ trợ YAML (cho azure.yaml)
  - `eamodio.gitlens` - Hiển thị Git
  - `mhutchie.git-graph` - Lịch sử Git

- **⚙️ Cài đặt VS Code**: Thêm cài đặt mặc định cho trình thông dịch Python, định dạng khi lưu, và cắt khoảng trắng

- **📦 Cập nhật requirements-dev.txt**:
  - Thêm plugin minify cho MkDocs
  - Thêm pre-commit cho chất lượng mã
  - Thêm các gói Azure SDK (azure-identity, azure-mgmt-resource)

#### Đã sửa
- **Lệnh post-create**: Bây giờ kiểm tra cài đặt AZD và Azure CLI khi container khởi động

---

### [v3.11.0] - 2026-02-05

#### Đại tu README thân thiện với người mới bắt đầu
**Phiên bản này cải thiện đáng kể README.md để dễ tiếp cận hơn cho người mới và bổ sung tài nguyên thiết yếu cho nhà phát triển AI.**

#### Đã thêm
- **🆚 So sánh Azure CLI và AZD**: Giải thích rõ ràng khi nào nên dùng mỗi công cụ với ví dụ thực tế
- **🌟 Liên kết AZD Tuyệt vời**: Liên kết trực tiếp đến thư viện mẫu cộng đồng và tài nguyên đóng góp:
  - [Thư viện AZD Tuyệt vời](https://azure.github.io/awesome-azd/) - Hơn 200 mẫu sẵn sàng triển khai
  - [Gửi Mẫu](https://github.com/Azure/awesome-azd/issues) - Đóng góp từ cộng đồng
- **🎯 Hướng dẫn Khởi đầu Nhanh**: Phần 3 bước đơn giản để bắt đầu (Cài đặt → Đăng nhập → Triển khai)
- **📊 Bảng điều hướng theo kinh nghiệm**: Hướng dẫn rõ ràng điểm bắt đầu dựa trên kinh nghiệm phát triển

#### Đổi thay
- **Cấu trúc README**: Tổ chức lại để tiết lộ thông tin tiến bộ - thông tin chính trước
- **Mục Giới thiệu**: Viết lại để giải thích "Phép màu của `azd up`" cho người mới hoàn toàn
- **Xóa nội dung trùng lặp**: Loại bỏ phần xử lý sự cố trùng lặp
- **Lệnh xử lý sự cố**: Sửa tham chiếu `azd logs` để dùng `azd monitor --logs` hợp lệ

#### Đã sửa
- **🔐 Lệnh xác thực**: Thêm `azd auth login` và `azd auth logout` vào cheat-sheet.md
- **Tham chiếu lệnh không hợp lệ**: Loại bỏ các `azd logs` còn lại khỏi phần xử lý sự cố README

#### Ghi chú
- **Phạm vi**: Thay đổi áp dụng cho README.md chính và resources/cheat-sheet.md
- **Đối tượng mục tiêu**: Cải tiến đặc biệt hướng đến nhà phát triển mới với AZD

---

### [v3.10.0] - 2026-02-05

#### Cập nhật chính xác lệnh Azure Developer CLI
**Phiên bản này sửa các lệnh AZD không tồn tại trong toàn bộ tài liệu, đảm bảo tất cả ví dụ mã sử dụng cú pháp Azure Developer CLI hợp lệ.**

#### Đã sửa
- **🔧 Loại bỏ lệnh AZD không tồn tại**: Kiểm toán và sửa chữa toàn diện các lệnh không hợp lệ:
  - `azd logs` (không tồn tại) → thay bằng `azd monitor --logs` hoặc Azure CLI thay thế
  - Các lệnh phụ `azd service` (không tồn tại) → thay bằng `azd show` và Azure CLI
  - `azd infra import/export/validate` (không tồn tại) → xóa hoặc thay thế bằng lựa chọn hợp lệ
  - Các cờ `azd deploy --rollback/--incremental/--parallel/--detect-changes` (không tồn tại) → xóa
  - Các cờ `azd provision --what-if/--rollback` (không tồn tại) → cập nhật dùng `--preview`
  - `azd config validate` (không tồn tại) → thay bằng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (không tồn tại) → xóa

- **📚 Tệp cập nhật với sửa lỗi lệnh**:
  - `resources/cheat-sheet.md`: Đại tu toàn bộ tham chiếu lệnh
  - `docs/deployment/deployment-guide.md`: Sửa lỗi chiến lược rollback và triển khai
  - `docs/troubleshooting/debugging.md`: Sửa lỗi phần phân tích log
  - `docs/troubleshooting/common-issues.md`: Cập nhật lệnh xử lý sự cố
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa phần debug AZD
  - `docs/getting-started/azd-basics.md`: Sửa lỗi các lệnh giám sát
  - `docs/getting-started/first-project.md`: Cập nhật ví dụ giám sát và gỡ lỗi
  - `docs/getting-started/installation.md`: Sửa ví dụ trợ giúp và phiên bản
  - `docs/pre-deployment/application-insights.md`: Sửa các lệnh xem nhật ký
  - `docs/pre-deployment/coordination-patterns.md`: Sửa các lệnh gỡ lỗi đại lý

- **📝 Tham khảo Phiên bản Đã cập nhật**: 
  - `docs/getting-started/installation.md`: Thay đổi phiên bản `1.5.0` mã cứng sang `1.x.x` chung với đường liên kết đến các bản phát hành

#### Đã thay đổi
- **Chiến lược Hoàn tác**: Cập nhật tài liệu để sử dụng hoàn tác dựa trên Git (AZD không có tính năng hoàn tác gốc)
- **Xem Nhật ký**: Thay thế các tham chiếu `azd logs` bằng `azd monitor --logs`, `azd monitor --live` và các lệnh Azure CLI
- **Mục Hiệu năng**: Loại bỏ các cờ triển khai song song/tăng dần không tồn tại, cung cấp các lựa chọn thay thế hợp lệ

#### Chi tiết Kỹ thuật
- **Các Lệnh AZD Hợp lệ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Các Cờ azd monitor Hợp lệ**: `--live`, `--logs`, `--overview`
- **Tính năng Đã loại bỏ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Ghi chú
- **Xác minh**: Các lệnh đã được kiểm tra với Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Hoàn thành Workshop và Cập nhật Chất lượng Tài liệu
**Phiên bản này hoàn tất các mô-đun workshop tương tác, sửa tất cả các liên kết tài liệu hỏng và cải thiện chất lượng nội dung tổng thể cho các nhà phát triển AI sử dụng Microsoft AZD.**

#### Đã thêm
- **📝 CONTRIBUTING.md**: Tài liệu hướng dẫn đóng góp mới với:
  - Hướng dẫn rõ ràng để báo cáo lỗi và đề xuất thay đổi
  - Tiêu chuẩn tài liệu cho nội dung mới
  - Hướng dẫn ví dụ mã và quy ước tin nhắn commit
  - Thông tin về sự tham gia cộng đồng

#### Đã hoàn thành
- **🎯 Mô-đun Workshop 7 (Tổng kết)**: Hoàn thành đầy đủ mô-đun tổng kết với:
  - Tóm tắt toàn diện các thành tựu của workshop
  - Phần các khái niệm chính đã nắm vững bao gồm AZD, mẫu, và Microsoft Foundry
  - Khuyến nghị tiếp tục hành trình học tập
  - Bài tập thử thách workshop với đánh giá độ khó
  - Phản hồi cộng đồng và liên kết hỗ trợ

- **📚 Mô-đun Workshop 3 (Phân tích)**: Cập nhật mục tiêu học tập với:
  - Hướng dẫn kích hoạt GitHub Copilot với MCP servers
  - Hiểu cấu trúc thư mục mẫu AZD
  - Các mẫu tổ chức hạ tầng dưới dạng code (Bicep)
  - Hướng dẫn thực hành lab

- **🔧 Mô-đun Workshop 6 (Dọn dẹp)**: Hoàn thành với:
  - Mục tiêu dọn dẹp tài nguyên và quản lý chi phí
  - Sử dụng `azd down` để ngừng cấp phát hạ tầng an toàn
  - Hướng dẫn khôi phục dịch vụ nhận thức bị xóa mềm
  - Các đề xuất khám phá thêm về GitHub Copilot và Azure Portal

#### Đã sửa
- **🔗 Sửa lỗi Liên kết Hư hỏng**: Giải quyết hơn 15 liên kết tài liệu nội bộ hỏng:
  - `docs/ai-foundry/ai-model-deployment.md`: Sửa đường dẫn đến microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa các đường dẫn ai-model-deployment.md và production-ai-practices.md
  - `docs/getting-started/first-project.md`: Thay thế cicd-integration.md không tồn tại bằng deployment-guide.md
  - `examples/retail-scenario.md`: Sửa đường dẫn FAQ và hướng dẫn khắc phục sự cố
  - `examples/container-app/microservices/README.md`: Sửa đường dẫn trang chính khóa học và hướng dẫn triển khai
  - `resources/faq.md` và `resources/glossary.md`: Cập nhật tham chiếu chương AI
  - `course-outline.md`: Sửa đường dẫn hướng dẫn giảng viên và lab workshop AI

- **📅 Biểu ngữ Trạng thái Workshop**: Cập nhật từ "Đang xây dựng" thành trạng thái workshop hoạt động với ngày tháng 2 năm 2026

- **🔗 Điều hướng Workshop**: Sửa các liên kết điều hướng hỏng trong README.md workshop trỏ đến thư mục lab-1-azd-basics không tồn tại

#### Đã thay đổi
- **Trình bày Workshop**: Loại bỏ cảnh báo "đang xây dựng", workshop hiện đã hoàn thành và sẵn sàng sử dụng
- **Đồng nhất Điều hướng**: Đảm bảo tất cả các mô-đun workshop có điều hướng đúng giữa các mô-đun
- **Tham chiếu Lộ trình Học tập**: Cập nhật tham chiếu chương chéo đúng với đường dẫn microsoft-foundry

#### Đã xác thực
- ✅ Tất cả các tệp markdown tiếng Anh có các liên kết nội bộ hợp lệ
- ✅ Các mô-đun workshop từ 0-7 đã hoàn tất với mục tiêu học tập
- ✅ Điều hướng giữa các chương và mô-đun hoạt động chính xác
- ✅ Nội dung phù hợp cho các nhà phát triển AI sử dụng Microsoft AZD
- ✅ Ngôn ngữ và cấu trúc thân thiện với người mới bắt đầu được duy trì xuyên suốt
- ✅ CONTRIBUTING.md cung cấp hướng dẫn rõ ràng cho các cộng tác viên cộng đồng

#### Triển khai Kỹ thuật
- **Kiểm tra Liên kết**: Tập lệnh PowerShell tự động xác minh tất cả các liên kết nội bộ .md
- **Kiểm toán Nội dung**: Đánh giá thủ công về sự hoàn chỉnh workshop và phù hợp với người mới bắt đầu
- **Hệ thống Điều hướng**: Áp dụng mẫu điều hướng chương và mô-đun đồng nhất

#### Ghi chú
- **Phạm vi**: Các thay đổi áp dụng chỉ cho tài liệu tiếng Anh
- **Dịch thuật**: Các thư mục dịch thuật chưa được cập nhật trong phiên bản này (dịch tự động sẽ đồng bộ sau)
- **Thời lượng Workshop**: Workshop hoàn chỉnh hiện cung cấp 3-4 giờ học thực hành

---

### [v3.8.0] - 2025-11-19

#### Tài liệu Nâng cao: Giám sát, Bảo mật và Mẫu đa Đại lý
**Phiên bản này bổ sung các bài học chất lượng A toàn diện về tích hợp Application Insights, mẫu xác thực và phối hợp đa đại lý cho các triển khai sản xuất.**

#### Đã thêm
- **📊 Bài học Tích hợp Application Insights**: trong `docs/pre-deployment/application-insights.md`:
  - Triển khai tập trung AZD với tự động cấp phát
  - Mẫu Bicep hoàn chỉnh cho Application Insights + Log Analytics
  - Ứng dụng Python hoạt động với thu thập dữ liệu tùy chỉnh (hơn 1.200 dòng)
  - Mẫu giám sát AI/LLM (theo dõi token/chi phí Microsoft Foundry Models)
  - 6 sơ đồ Mermaid (kiến trúc, truy vết phân tán, luồng dữ liệu)
  - 3 bài tập thực hành (cảnh báo, bảng điều khiển, giám sát AI)
  - Ví dụ truy vấn Kusto và chiến lược tối ưu chi phí
  - Phát trực tiếp số liệu và gỡ lỗi thời gian thực
  - Thời gian học khoảng 40-50 phút với các mẫu sẵn sàng sản xuất

- **🔐 Bài học Mẫu Xác thực & Bảo mật**: trong `docs/getting-started/authsecurity.md`:
  - 3 mẫu xác thực (chuỗi kết nối, Key Vault, managed identity)
  - Mẫu hạ tầng Bicep hoàn chỉnh cho triển khai an toàn
  - Mã ứng dụng Node.js tích hợp SDK Azure
  - 3 bài tập hoàn chỉnh (kích hoạt managed identity, user-assigned identity, xoay vòng Key Vault)
  - Thực hành tốt nhất về bảo mật và cấu hình RBAC
  - Hướng dẫn khắc phục sự cố và phân tích chi phí
  - Mẫu xác thực không mật khẩu chuẩn sản xuất

- **🤖 Bài học Mẫu Phối hợp Đa Đại lý**: trong `docs/pre-deployment/coordination-patterns.md`:
  - 5 mẫu phối hợp (tuần tự, song song, phân cấp, kích hoạt sự kiện, đồng thuận)
  - Triển khai dịch vụ điều phối hoàn chỉnh (Python/Flask, hơn 1.500 dòng)
  - 3 triển khai đại lý chuyên biệt (Nghiên cứu, Viết, Biên tập)
  - Tích hợp Service Bus cho hàng đợi tin nhắn
  - Quản lý trạng thái Cosmos DB cho hệ phân tán
  - 6 sơ đồ Mermaid thể hiện tương tác đại lý
  - 3 bài tập nâng cao (xử lý hết thời gian, logic thử lại, ngắt mạch)
  - Phân tích chi phí ($240-565/tháng) với chiến lược tối ưu
  - Tích hợp Application Insights để giám sát

#### Cải thiện
- **Chương Trước khi Triển khai**: Giờ bao gồm các mẫu giám sát và phối hợp toàn diện
- **Chương Bắt đầu**: Nâng cao với các mẫu xác thực chuyên nghiệp
- **Sẵn sàng Sản xuất**: Đầy đủ từ bảo mật đến khả năng quan sát
- **Đề cương Khóa học**: Cập nhật tham chiếu các bài học mới trong Chương 3 và 6

#### Đã thay đổi
- **Tiến trình Học tập**: Tích hợp tốt hơn bảo mật và giám sát xuyên suốt khóa học
- **Chất lượng Tài liệu**: Tiêu chuẩn chất lượng A nhất quán (95-97%) cho các bài học mới
- **Mẫu Triển khai Sản xuất**: Đầy đủ từ đầu đến cuối cho các triển khai doanh nghiệp

#### Cải thiện
- **Trải nghiệm Nhà phát triển**: Lộ trình rõ ràng từ phát triển đến giám sát sản xuất
- **Tiêu chuẩn Bảo mật**: Mẫu chuyên nghiệp cho xác thực và quản lý bí mật
- **Khả năng Quan sát**: Tích hợp Application Insights hoàn chỉnh với AZD
- **Khối lượng Công việc AI**: Giám sát chuyên biệt cho Microsoft Foundry Models và hệ thống đa đại lý

#### Đã xác thực
- ✅ Tất cả bài học bao gồm mã hoạt động hoàn chỉnh (không phải đoạn trích)
- ✅ Sơ đồ Mermaid cho học trực quan (19 tổng cộng trong 3 bài học)
- ✅ Bài tập thực hành với bước xác minh (9 tổng cộng)
- ✅ Mẫu Bicep sản xuất sẵn sàng triển khai qua `azd up`
- ✅ Phân tích chi phí và chiến lược tối ưu
- ✅ Hướng dẫn khắc phục sự cố và thực hành tốt nhất
- ✅ Điểm kiểm tra kiến thức với lệnh xác minh

#### Kết quả Đánh giá Tài liệu
- **docs/pre-deployment/application-insights.md**: - Hướng dẫn giám sát toàn diện
- **docs/getting-started/authsecurity.md**: - Mẫu bảo mật chuyên nghiệp
- **docs/pre-deployment/coordination-patterns.md**: - Kiến trúc đa đại lý nâng cao
- **Nội dung Mới Tổng thể**: - Tiêu chuẩn chất lượng cao nhất quán

#### Triển khai Kỹ thuật
- **Application Insights**: Log Analytics + thu thập dữ liệu tùy chỉnh + truy vết phân tán
- **Xác thực**: Managed Identity + Key Vault + mẫu RBAC
- **Đa Đại lý**: Service Bus + Cosmos DB + Container Apps + điều phối
- **Giám sát**: Số liệu trực tiếp + truy vấn Kusto + cảnh báo + bảng điều khiển
- **Quản lý Chi phí**: Chiến lược lấy mẫu, chính sách lưu giữ, kiểm soát ngân sách

### [v3.7.0] - 2025-11-19

#### Cải tiến Chất lượng Tài liệu và Ví dụ Microsoft Foundry Models Mới
**Phiên bản này nâng cao chất lượng tài liệu trên toàn kho và thêm ví dụ triển khai Microsoft Foundry Models hoàn chỉnh với giao diện trò chuyện gpt-4.1.**

#### Đã thêm
- **🤖 Ví dụ Trò chuyện Microsoft Foundry Models**: Triển khai gpt-4.1 hoàn chỉnh với thực thi hoạt động trong `examples/azure-openai-chat/`:
  - Hạ tầng Microsoft Foundry Models đầy đủ (triển khai mô hình gpt-4.1)
  - Giao diện trò chuyện dòng lệnh Python với lịch sử hội thoại
  - Tích hợp Key Vault để lưu trữ khóa API an toàn
  - Theo dõi sử dụng token và ước tính chi phí
  - Giới hạn tốc độ và xử lý lỗi
  - README toàn diện với hướng dẫn triển khai 35-45 phút
  - 11 tệp sản xuất sẵn (mẫu Bicep, ứng dụng Python, cấu hình)
- **📚 Bài tập Tài liệu**: Thêm bài tập thực hành vào hướng dẫn cấu hình:
  - Bài tập 1: Cấu hình đa môi trường (15 phút)
  - Bài tập 2: Thực hành quản lý bí mật (10 phút)
  - Tiêu chí thành công rõ ràng và các bước xác minh
- **✅ Xác minh Triển khai**: Thêm phần xác minh vào hướng dẫn triển khai:
  - Quy trình kiểm tra sức khỏe
  - Danh mục tiêu chí thành công
  - Kết quả mong đợi cho tất cả các lệnh triển khai
  - Tham khảo nhanh khắc phục sự cố

#### Đã cải thiện
- **examples/README.md**: Cập nhật chất lượng A (93%):
  - Thêm azure-openai-chat vào tất cả các phần liên quan
  - Cập nhật số lượng ví dụ địa phương từ 3 lên 4
  - Thêm vào bảng Ví dụ Ứng dụng AI
  - Tích hợp vào Hướng Dẫn Nhanh cho Người dùng Trung cấp
  - Thêm vào phần Mẫu Microsoft Foundry
  - Cập nhật Bảng So sánh và phần tìm kiếm công nghệ
- **Chất lượng Tài liệu**: Cải thiện từ B+ (87%) → A- (92%) trong thư mục docs:
  - Thêm kết quả mong đợi vào ví dụ lệnh quan trọng
  - Bao gồm bước xác minh cho các thay đổi cấu hình
  - Cải thiện học thực hành với bài tập thiết thực

#### Đã thay đổi
- **Tiến trình Học tập**: Tích hợp tốt hơn các ví dụ AI cho người học trung cấp
- **Cấu trúc Tài liệu**: Bài tập thực hành có tính hành động hơn với kết quả rõ ràng
- **Quy trình Xác minh**: Thêm tiêu chí thành công rõ ràng cho luồng công việc chính

#### Cải thiện
- **Trải nghiệm Nhà phát triển**: Triển khai Microsoft Foundry Models giờ mất 35-45 phút (so với 60-90 cho các phương án phức tạp)
- **Minh bạch Chi phí**: Ước tính chi phí rõ ràng ($50-200/tháng) cho ví dụ Microsoft Foundry Models
- **Lộ trình Học tập**: Nhà phát triển AI có điểm vào rõ ràng với azure-openai-chat
- **Tiêu chuẩn Tài liệu**: Kết quả mong đợi và bước xác minh đồng nhất

#### Đã xác thực
- ✅ Ví dụ Microsoft Foundry Models hoạt động đầy đủ với `azd up`
- ✅ Tất cả 11 tệp triển khai đúng cú pháp
- ✅ Hướng dẫn README phù hợp với trải nghiệm triển khai thực tế
- ✅ Các liên kết tài liệu được cập nhật ở hơn 8 vị trí
- ✅ Mục ví dụ phản ánh chính xác 4 ví dụ địa phương
- ✅ Không có liên kết bên ngoài trùng lặp trong bảng
- ✅ Tất cả tham chiếu điều hướng chính xác

#### Triển khai Kỹ thuật
- **Kiến trúc Microsoft Foundry Models**: gpt-4.1 + Key Vault + mẫu Container Apps
- **Bảo mật**: Sẵn sàng Managed Identity, bí mật trong Key Vault
- **Giám sát**: Tích hợp Application Insights
- **Quản lý Chi phí**: Theo dõi token và tối ưu sử dụng
- **Triển khai**: Lệnh duy nhất `azd up` để thiết lập hoàn chỉnh

### [v3.6.0] - 2025-11-19

#### Cập nhật lớn: Ví dụ Triển khai Container App
**Phiên bản này giới thiệu các ví dụ triển khai ứng dụng container hoàn chỉnh sẵn sàng cho sản xuất sử dụng Azure Developer CLI (AZD), với tài liệu đầy đủ và tích hợp vào lộ trình học tập.**

#### Đã thêm
- **🚀 Ví dụ Container App**: Ví dụ địa phương mới trong `examples/container-app/`:
  - [Hướng dẫn chính](examples/container-app/README.md): Tổng quan hoàn chỉnh về triển khai chứa đóng gói, khởi đầu nhanh, sản xuất và các mẫu nâng cao
  - [API Flask Đơn giản](../../examples/container-app/simple-flask-api): REST API thân thiện với người mới với khả năng mở rộng đến không, kiểm tra sức khỏe, giám sát và xử lý sự cố
  - [Kiến trúc Microservices](../../examples/container-app/microservices): Triển khai đa dịch vụ sẵn sàng cho sản xuất (API Gateway, Sản phẩm, Đơn hàng, Người dùng, Thông báo), tin nhắn không đồng bộ, Service Bus, Cosmos DB, Azure SQL, phân tích truy vết phân tán, triển khai màu xanh-lục/canary
- **Thực hành tốt nhất**: Bảo mật, giám sát, tối ưu chi phí và hướng dẫn CI/CD cho khối lượng công việc chứa đóng gói
- **Mẫu mã**: Mãn mã `azure.yaml`, mẫu Bicep, và triển khai dịch vụ đa ngôn ngữ (Python, Node.js, C#, Go)
- **Kiểm thử & Xử lý sự cố**: Kịch bản kiểm thử end-to-end, lệnh giám sát, hướng dẫn xử lý sự cố

#### Đã thay đổi
- **README.md**: Cập nhật để giới thiệu và liên kết các ví dụ ứng dụng chứa mới trong "Ví dụ địa phương - Ứng dụng chứa"
- **examples/README.md**: Cập nhật để làm nổi bật ví dụ ứng dụng chứa, thêm mục ma trận so sánh, và cập nhật tham khảo công nghệ/kiến trúc
- **Đề cương khóa học & Hướng dẫn học tập**: Cập nhật tham khảo ví dụ ứng dụng chứa mới và mẫu triển khai liên quan trong các chương thích hợp

#### Đã xác nhận
- ✅ Tất cả ví dụ mới có thể triển khai với `azd up` và tuân theo thực hành tốt nhất
- ✅ Các liên kết chéo tài liệu và điều hướng được cập nhật
- ✅ Ví dụ bao phủ từ kịch bản cho người mới đến nâng cao, bao gồm microservices sản xuất

#### Ghi chú
- **Phạm vi**: Tài liệu và ví dụ tiếng Anh chỉ
- **Bước tiếp theo**: Mở rộng thêm các mẫu chứa nâng cao và tự động hóa CI/CD trong các bản phát hành tương lai

### [v3.5.0] - 2025-11-19

#### Tái định vị thương hiệu sản phẩm: Microsoft Foundry
**Phiên bản này thực hiện thay đổi tên sản phẩm toàn diện từ "Microsoft Foundry" sang "Microsoft Foundry" trên tất cả tài liệu tiếng Anh, phản ánh sự tái định vị chính thức của Microsoft.**

#### Đã thay đổi
- **🔄 Cập nhật tên sản phẩm**: Tái định vị hoàn toàn từ "Microsoft Foundry" sang "Microsoft Foundry"
  - Cập nhật tất cả tham chiếu trong tài liệu tiếng Anh ở thư mục `docs/`
  - Đổi tên thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Đổi tên tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tổng cộng: 23 tham chiếu nội dung được cập nhật trong 7 tệp tài liệu

- **📁 Thay đổi cấu trúc thư mục**:
  - `docs/ai-foundry/` đổi tên thành `docs/microsoft-foundry/`
  - Tất cả liên kết chéo được cập nhật phản ánh cấu trúc thư mục mới
  - Đã xác thực các liên kết điều hướng trong toàn bộ tài liệu

- **📄 Đổi tên tệp**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tất cả liên kết nội bộ được cập nhật để tham chiếu tới tên tệp mới

#### Tệp được cập nhật
- **Tài liệu Chương** (7 tệp):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 cập nhật liên kết điều hướng
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 cập nhật tham chiếu tên sản phẩm
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Đã sử dụng Microsoft Foundry (từ các cập nhật trước)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 cập nhật tham chiếu (tổng quan, phản hồi cộng đồng, tài liệu)
  - `docs/getting-started/azd-basics.md` - 4 cập nhật liên kết chéo
  - `docs/getting-started/first-project.md` - 2 cập nhật liên kết điều hướng chương
  - `docs/getting-started/installation.md` - 2 cập nhật liên kết chương kế tiếp
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 cập nhật tham chiếu (điều hướng, cộng đồng Discord)
  - `docs/troubleshooting/common-issues.md` - 1 cập nhật liên kết điều hướng
  - `docs/troubleshooting/debugging.md` - 1 cập nhật liên kết điều hướng

- **Tệp cấu trúc khóa học** (2 tệp):
  - `README.md` - 17 cập nhật tham chiếu (tổng quan khóa học, tiêu đề chương, phần mẫu, thông tin cộng đồng)
  - `course-outline.md` - 14 cập nhật tham chiếu (tổng quan, mục tiêu học tập, tài nguyên chương)

#### Đã xác nhận
- ✅ Không còn tham chiếu đường dẫn thư mục "ai-foundry" trong tài liệu tiếng Anh
- ✅ Không còn tham chiếu tên sản phẩm "Microsoft Foundry" trong tài liệu tiếng Anh
- ✅ Tất cả liên kết điều hướng đều hoạt động với cấu trúc thư mục mới
- ✅ Đổi tên tệp và thư mục hoàn thành thành công
- ✅ Đã xác thực các liên kết chéo giữa các chương

#### Ghi chú
- **Phạm vi**: Thay đổi áp dụng cho tài liệu tiếng Anh trong thư mục `docs/` chỉ
- **Bản dịch**: Thư mục bản dịch (`translations/`) không được cập nhật trong phiên bản này
- **Hội thảo**: Tài liệu hội thảo (`workshop/`) không được cập nhật trong phiên bản này
- **Ví dụ**: Tệp ví dụ vẫn có thể tham chiếu tên cũ (sẽ được xử lý trong bản cập nhật tương lai)
- **Liên kết bên ngoài**: URL bên ngoài và tham chiếu kho GitHub không thay đổi

#### Hướng dẫn chuyển đổi cho người đóng góp
Nếu bạn có nhánh địa phương hoặc tài liệu tham chiếu cấu trúc cũ:
1. Cập nhật tham chiếu thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Cập nhật tham chiếu tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Thay thế tên sản phẩm: "Microsoft Foundry" → "Microsoft Foundry"
4. Xác thực tất cả liên kết nội bộ trong tài liệu vẫn hoạt động

---

### [v3.4.0] - 2025-10-24

#### Nâng cao Xem trước và Xác thực Hạ tầng
**Phiên bản này giới thiệu hỗ trợ toàn diện cho chức năng xem trước Azure Developer CLI mới và nâng cao trải nghiệm người dùng hội thảo.**

#### Đã thêm
- **🧪 Tài liệu tính năng azd provision --preview**: Bao quát toàn diện khả năng xem trước hạ tầng mới
  - Tham khảo lệnh và ví dụ sử dụng trong bảng tóm tắt
  - Tích hợp chi tiết trong hướng dẫn cấp phát với các trường hợp sử dụng và lợi ích
  - Tích hợp kiểm tra trước triển khai để xác thực an toàn hơn
  - Cập nhật hướng dẫn bắt đầu với thực hành ưu tiên an toàn
- **🚧 Biểu ngữ trạng thái hội thảo**: Biểu ngữ HTML chuyên nghiệp hiển thị trạng thái phát triển hội thảo
  - Thiết kế gradient với chỉ thị xây dựng để rõ ràng giao tiếp người dùng
  - Dấu thời gian cập nhật cuối cùng để minh bạch
  - Thiết kế đáp ứng cho tất cả loại thiết bị di động

#### Đã nâng cao
- **An toàn Hạ tầng**: Tính năng xem trước tích hợp trong tài liệu triển khai
- **Xác thực trước triển khai**: Script tự động nay bao gồm kiểm tra xem trước hạ tầng
- **Quy trình làm việc nhà phát triển**: Cập nhật chuỗi lệnh bao gồm xem trước như thực hành tốt nhất
- **Trải nghiệm hội thảo**: Kỳ vọng rõ ràng về trạng thái phát triển nội dung cho người dùng

#### Đã thay đổi
- **Thực hành triển khai tốt nhất**: Quy trình xem trước ưu tiên giờ đây được khuyến nghị
- **Luồng tài liệu**: Xác thực hạ tầng được sắp xếp sớm hơn trong quá trình học
- **Trình bày hội thảo**: Giao tiếp trạng thái chuyên nghiệp với mốc thời gian phát triển rõ ràng

#### Đã cải thiện
- **Phương pháp ưu tiên an toàn**: Có thể xác thực thay đổi hạ tầng trước khi triển khai
- **Hợp tác nhóm**: Kết quả xem trước có thể được chia sẻ để đánh giá và phê duyệt
- **Nhận thức chi phí**: Hiểu rõ hơn về chi phí tài nguyên trước khi cấp phát
- **Giảm rủi ro**: Giảm sự cố triển khai thông qua xác thực trước

#### Triển khai kỹ thuật
- **Tích hợp tài liệu đa tệp**: Tính năng xem trước được ghi chép trên 4 tệp chính
- **Mẫu lệnh**: Cú pháp và ví dụ nhất quán xuyên suốt tài liệu
- **Tích hợp thực hành tốt nhất**: Xem trước bao gồm trong các quy trình xác thực và script
- **Chỉ báo trực quan**: Đánh dấu rõ ràng tính năng MỚI để dễ nhận biết

#### Hạ tầng hội thảo
- **Giao tiếp trạng thái**: Biểu ngữ HTML chuyên nghiệp với phong cách gradient
- **Trải nghiệm người dùng**: Trạng thái phát triển rõ ràng tránh gây nhầm lẫn
- **Trình bày chuyên nghiệp**: Duy trì uy tín kho lưu trữ đồng thời đặt kỳ vọng
- **Minh bạch mốc thời gian**: Dấu thời gian cập nhật cuối tháng 10 năm 2025 cho trách nhiệm

### [v3.3.0] - 2025-09-24

#### Tài liệu hội thảo và Trải nghiệm học tập tương tác được nâng cao
**Phiên bản này giới thiệu tài liệu hội thảo toàn diện với hướng dẫn tương tác trên trình duyệt và đường dẫn học tập có cấu trúc.**

#### Đã thêm
- **🎥 Hướng dẫn hội thảo tương tác**: Trải nghiệm hội thảo trên trình duyệt với khả năng xem trước MkDocs
- **📝 Hướng dẫn hội thảo có cấu trúc**: Lộ trình học 7 bước từ khám phá tới tùy chỉnh
  - 0-Giới thiệu: Tổng quan hội thảo và cài đặt
  - 1-Chọn mẫu AI: Quy trình khám phá và lựa chọn mẫu
  - 2-Xác thực mẫu AI: Quy trình triển khai và xác thực
  - 3-Phân tích mẫu AI: Hiểu kiến trúc mẫu
  - 4-Cấu hình mẫu AI: Cấu hình và tùy chỉnh
  - 5-Tùy chỉnh mẫu AI: Sửa đổi nâng cao và lặp lại
  - 6-Dọn dẹp hạ tầng: Làm sạch và quản lý tài nguyên
  - 7-Kết luận: Tóm tắt và bước tiếp theo
- **🛠️ Công cụ hội thảo**: Cấu hình MkDocs với theme Material cho trải nghiệm học tập nâng cao
- **🎯 Đường dẫn học thực hành**: Phương pháp 3 bước (Khám phá → Triển khai → Tùy chỉnh)
- **📱 Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển liền mạch

#### Đã nâng cao
- **Phòng thí nghiệm AI hội thảo**: Mở rộng với trải nghiệm học có cấu trúc 2-3 giờ toàn diện
- **Tài liệu hội thảo**: Trình bày chuyên nghiệp với điều hướng và hỗ trợ hình ảnh
- **Tiến trình học tập**: Hướng dẫn rõ ràng từng bước từ chọn mẫu tới triển khai sản xuất
- **Trải nghiệm nhà phát triển**: Tích hợp công cụ cho quy trình phát triển ngăn nắp

#### Đã cải thiện
- **Khả năng truy cập**: Giao diện trên trình duyệt với chức năng tìm kiếm, sao chép và chuyển đổi chủ đề
- **Học tập theo tốc độ cá nhân**: Cấu trúc hội thảo linh hoạt phù hợp với tốc độ học khác nhau
- **Ứng dụng thực tiễn**: Kịch bản triển khai mẫu AI thực tế
- **Tích hợp cộng đồng**: Tích hợp Discord cho hỗ trợ và hợp tác hội thảo

#### Tính năng hội thảo
- **Tìm kiếm tích hợp**: Tìm kiếm nhanh từ khóa và bài học
- **Sao chép khối mã**: Chức năng di chuột để sao chép tất cả ví dụ mã
- **Chuyển đổi chủ đề**: Hỗ trợ chế độ tối/sáng theo sở thích
- **Tài sản hình ảnh**: Ảnh chụp màn hình và sơ đồ hỗ trợ hiểu biết
- **Tích hợp hỗ trợ**: Truy cập trực tiếp Discord cho hỗ trợ cộng đồng

### [v3.2.0] - 2025-09-17

#### Tái cấu trúc điều hướng lớn và Hệ thống học tập theo chương
**Phiên bản này giới thiệu cấu trúc học tập toàn diện dựa trên chương với điều hướng nâng cao khắp kho lưu trữ.**

#### Đã thêm
- **📚 Hệ thống học tập theo chương**: Tái cấu trúc toàn bộ khóa học thành 8 chương học tiến bộ
  - Chương 1: Nền tảng & Khởi đầu nhanh (⭐ - 30-45 phút)
  - Chương 2: Phát triển AI-First (⭐⭐ - 1-2 giờ)
  - Chương 3: Cấu hình & Xác thực (⭐⭐ - 45-60 phút)
  - Chương 4: Hạ tầng như Mã & Triển khai (⭐⭐⭐ - 1-1.5 giờ)
  - Chương 5: Giải pháp AI đa tác nhân (⭐⭐⭐⭐ - 2-3 giờ)
  - Chương 6: Xác thực & Lập kế hoạch trước triển khai (⭐⭐ - 1 giờ)
  - Chương 7: Xử lý & Gỡ lỗi (⭐⭐ - 1-1.5 giờ)
  - Chương 8: Mẫu sản xuất & Doanh nghiệp (⭐⭐⭐⭐ - 2-3 giờ)
- **📚 Hệ thống điều hướng toàn diện**: Tiêu đề điều hướng và chân trang đồng nhất trên toàn bộ tài liệu
- **🎯 Theo dõi tiến trình**: Danh sách kiểm hoàn thành khóa học và hệ thống xác minh học tập
- **🗺️ Hướng dẫn đường học**: Điểm nhập rõ ràng cho các mức kinh nghiệm và mục tiêu khác nhau
- **🔗 Điều hướng liên kết chéo**: Các chương liên quan và điều kiện tiên quyết được liên kết rõ ràng

#### Đã nâng cao
- **Cấu trúc README**: Chuyển đổi thành nền tảng học tập có cấu trúc với tổ chức theo chương
- **Điều hướng tài liệu**: Mỗi trang giờ có bối cảnh chương và hướng dẫn tiến trình
- **Tổ chức mẫu**: Ví dụ và mẫu được phân bổ vào chương học phù hợp
- **Tích hợp tài nguyên**: Bảng tóm tắt, FAQ và hướng dẫn học kết nối với các chương tương ứng
- **Tích hợp hội thảo**: Phòng thí nghiệm thực hành liên kết với nhiều mục tiêu chương học

#### Đã thay đổi
- **Tiến trình học**: Chuyển từ tài liệu tuyến tính sang học tập linh hoạt theo chương
- **Vị trí cấu hình**: Đưa hướng dẫn cấu hình thành Chương 3 để cải thiện luồng học
- **Tích hợp nội dung AI**: Tích hợp tốt hơn nội dung chuyên biệt AI trong toàn bộ hành trình học
- **Nội dung sản xuất**: Mẫu nâng cao được tập trung trong Chương 8 cho học viên doanh nghiệp

#### Đã cải thiện
- **Trải nghiệm người dùng**: Bánh mì vụn điều hướng rõ ràng và chỉ báo tiến trình theo chương
- **Khả năng truy cập**: Mẫu điều hướng nhất quán giúp dễ dàng đi qua khóa học
- **Trình bày chuyên nghiệp**: Cấu trúc khóa học kiểu đại học phù hợp đào tạo học thuật và doanh nghiệp
- **Hiệu quả học tập**: Giảm thời gian tìm kiếm nội dung phù hợp nhờ tổ chức cải tiến

#### Triển khai kỹ thuật
- **Tiêu đề điều hướng**: Chuẩn hóa điều hướng chương trên hơn 40 tệp tài liệu
- **Điều hướng chân trang**: Hướng dẫn tiến trình và chỉ báo hoàn thành chương đồng nhất
- **Liên kết chéo**: Hệ thống liên kết nội bộ toàn diện kết nối các khái niệm liên quan
- **Bản đồ chương**: Mẫu và ví dụ liên kết rõ ràng với mục tiêu học tập

#### Nâng cao Hướng dẫn học tập
- **📚 Mục tiêu học tập toàn diện**: Tái cấu trúc hướng dẫn học tập phù hợp với hệ thống 8 chương
- **🎯 Đánh giá theo chương**: Mỗi chương có mục tiêu học tập cụ thể và bài tập thực tiễn
- **📋 Theo dõi tiến trình**: Lịch học hàng tuần với kết quả đo lường và danh sách kiểm hoàn thành
- **❓ Câu hỏi đánh giá**: Câu hỏi xác thực kiến thức cho từng chương với kết quả chuyên nghiệp
- **🛠️ Bài tập thực hành**: Hoạt động thực hành với kịch bản triển khai thực tế và xử lý sự cố
- **📊 Tiến trình kỹ năng**: Tiến bộ rõ ràng từ khái niệm cơ bản đến mẫu doanh nghiệp với tập trung phát triển nghề nghiệp
- **🎓 Khung chứng nhận**: Kết quả phát triển chuyên nghiệp và hệ thống công nhận cộng đồng
- **⏱️ Quản lý mốc thời gian**: Kế hoạch học có cấu trúc 10 tuần với xác thực mốc quan trọng

### [v3.1.0] - 2025-09-17

#### Giải pháp AI đa tác nhân nâng cao
**Phiên bản này cải thiện giải pháp bán lẻ đa tác nhân với đặt tên tác nhân tốt hơn và tài liệu nâng cao.**

#### Đã thay đổi
- **Thuật ngữ Đa Tác nhân**: Thay thế "Cora agent" bằng "Customer agent" trong toàn bộ giải pháp đa tác nhân bán lẻ để hiểu rõ hơn
- **Kiến trúc Tác nhân**: Cập nhật toàn bộ tài liệu, mẫu ARM, và ví dụ mã nguồn sử dụng tên gọi "Customer agent" nhất quán
- **Ví dụ Cấu hình**: Hiện đại hóa mẫu cấu hình tác nhân với quy ước đặt tên cập nhật
- **Tính nhất quán của Tài liệu**: Đảm bảo tất cả tham chiếu sử dụng tên tác nhân chuyên nghiệp và mô tả rõ ràng

#### Nâng cấp
- **Gói Mẫu ARM**: Cập nhật retail-multiagent-arm-template với tham chiếu Customer agent
- **Sơ đồ Kiến trúc**: Làm mới sơ đồ Mermaid với tên tác nhân cập nhật
- **Ví dụ Mã nguồn**: Các lớp Python và ví dụ triển khai bây giờ sử dụng tên CustomerAgent
- **Biến Môi trường**: Cập nhật toàn bộ kịch bản triển khai sử dụng quy ước CUSTOMER_AGENT_NAME

#### Cải thiện
- **Trải nghiệm Nhà phát triển**: Vai trò và trách nhiệm của tác nhân rõ ràng hơn trong tài liệu
- **Sẵn sàng Sản xuất**: Phù hợp tốt hơn với quy ước đặt tên doanh nghiệp
- **Tài liệu Học tập**: Tên tác nhân trực quan hơn cho mục đích giáo dục
- **Tính Sử dụng Mẫu**: Giản lược hiểu biết chức năng tác nhân và mẫu triển khai

#### Chi tiết Kỹ thuật
- Cập nhật sơ đồ kiến trúc Mermaid với tham chiếu CustomerAgent
- Thay thế tên lớp CoraAgent bằng CustomerAgent trong ví dụ Python
- Chỉnh sửa các cấu hình JSON mẫu ARM để sử dụng loại tác nhân "customer"
- Cập nhật biến môi trường từ CORA_AGENT_* sang mẫu CUSTOMER_AGENT_*
- Làm mới toàn bộ câu lệnh triển khai và cấu hình container

### [v3.0.0] - 2025-09-12

#### Thay đổi Chính - Tập trung Phát triển AI và Tích hợp Microsoft Foundry
**Phiên bản này biến kho lưu trữ thành nguồn học tập toàn diện tập trung AI với tích hợp Microsoft Foundry.**

#### Thêm
- **🤖 Lộ trình Học tập AI-First**: Tái cấu trúc hoàn toàn ưu tiên người phát triển và kỹ sư AI
- **Hướng dẫn Tích hợp Microsoft Foundry**: Tài liệu đầy đủ về kết nối AZD với dịch vụ Microsoft Foundry
- **Mẫu Triển khai Mô hình AI**: Hướng dẫn chi tiết về lựa chọn mô hình, cấu hình và chiến lược triển khai sản xuất
- **Phòng Thí nghiệm Hội thảo AI**: Hội thảo thực hành 2-3 giờ chuyển đổi ứng dụng AI thành giải pháp triển khai AZD
- **Thực tiễn Sản xuất AI Tối ưu**: Mẫu doanh nghiệp cho mở rộng, giám sát và bảo mật khối lượng công việc AI
- **Hướng dẫn Xử lý Sự cố AI**: Toàn diện xử lý sự cố cho Microsoft Foundry Models, Cognitive Services và các vấn đề triển khai AI
- **Thư viện Mẫu AI**: Bộ sưu tập nổi bật các mẫu Microsoft Foundry với đánh giá độ phức tạp
- **Tài liệu Hội thảo**: Cấu trúc hội thảo hoàn chỉnh với phòng thí nghiệm thực hành và tài liệu tham khảo

#### Nâng cấp
- **Cấu trúc README**: Tập trung người phát triển AI với dữ liệu 45% quan tâm cộng đồng từ Discord Microsoft Foundry
- **Lộ trình Học tập**: Hành trình riêng dành cho nhà phát triển AI bên cạnh lộ trình cổ điển cho sinh viên và kỹ sư DevOps
- **Khuyến nghị Mẫu**: Mẫu AI nổi bật bao gồm azure-search-openai-demo, contoso-chat và openai-chat-app-quickstart
- **Tích hợp Cộng đồng**: Hỗ trợ cộng đồng Discord được cải thiện với kênh và thảo luận riêng về AI

#### An ninh & Tập trung Sản xuất
- **Mẫu Managed Identity**: Cấu hình xác thực và bảo mật riêng cho AI
- **Tối ưu Chi phí**: Theo dõi token và kiểm soát ngân sách cho khối lượng công việc AI
- **Triển khai Đa Vùng**: Chiến lược triển khai ứng dụng AI toàn cầu
- **Giám sát Hiệu suất**: Chỉ số riêng AI và tích hợp Application Insights

#### Chất lượng Tài liệu
- **Cấu trúc Khóa học Tuần tự**: Tiến trình hợp lý từ cơ bản đến mẫu triển khai AI nâng cao
- **URL Đã xác thực**: Tất cả liên kết kho lưu trữ bên ngoài được kiểm tra và truy cập được
- **Tham khảo Hoàn chỉnh**: Liên kết tài liệu nội bộ được xác nhận và hoạt động
- **Sẵn sàng Sản xuất**: Mẫu triển khai doanh nghiệp với ví dụ thực tiễn

### [v2.0.0] - 2025-09-09

#### Thay đổi Chính - Tái cấu trúc Kho lưu trữ và Nâng cao Chuyên nghiệp
**Phiên bản này thể hiện sự cải tổ lớn về cấu trúc kho lưu trữ và trình bày nội dung.**

#### Thêm
- **Khung Học tập Cấu trúc**: Tất cả trang tài liệu có phần Giới thiệu, Mục tiêu học tập và Kết quả học tập
- **Hệ Thống Điều Hướng**: Thêm liên kết Bài trước/Bài tiếp theo trên toàn bộ tài liệu để hướng dẫn học tập từng bước
- **Hướng dẫn Học tập**: study-guide.md toàn diện với mục tiêu học, bài tập thực hành và tài liệu đánh giá
- **Trình bày Chuyên nghiệp**: Loại bỏ toàn bộ biểu tượng cảm xúc để cải thiện khả năng truy cập và vẻ ngoài chuyên nghiệp
- **Cấu trúc Nội dung Nâng cao**: Cải thiện tổ chức và trình tự tài liệu học tập

#### Thay đổi
- **Định dạng Tài liệu**: Chuẩn hóa tất cả tài liệu với cấu trúc tập trung học tập nhất quán
- **Luồng Điều Hướng**: Thực hiện tiến trình logic qua toàn bộ tài liệu học tập
- **Trình bày Nội dung**: Loại bỏ các yếu tố trang trí để thay bằng định dạng rõ ràng, chuyên nghiệp
- **Cấu trúc Liên kết**: Cập nhật tất cả liên kết nội bộ hỗ trợ hệ thống điều hướng mới

#### Cải thiện
- **Khả năng truy cập**: Loại bỏ phụ thuộc biểu tượng cảm xúc để tương thích trình đọc màn hình tốt hơn
- **Vẻ Ngoài Chuyên nghiệp**: Trình bày gọn gàng theo kiểu học thuật phù hợp học doanh nghiệp
- **Trải nghiệm Học tập**: Cách tiếp cận có cấu trúc với mục tiêu và kết quả rõ cho từng bài học
- **Tổ chức Nội dung**: Luồng logic và kết nối tốt hơn giữa các chủ đề liên quan

### [v1.0.0] - 2025-09-09

#### Phát hành Ban đầu - Kho Học tập AZD Toàn diện

#### Thêm
- **Cấu trúc Tài liệu Cốt lõi**
  - Bộ hướng dẫn bắt đầu hoàn chỉnh
  - Tài liệu triển khai và cung cấp dịch vụ toàn diện
  - Tài nguyên xử lý sự cố chi tiết và hướng dẫn gỡ lỗi
  - Công cụ và quy trình xác thực trước triển khai

- **Mô-đun Bắt đầu**
  - AZD Cơ bản: Khái niệm và thuật ngữ cốt lõi
  - Hướng dẫn Cài đặt: Hướng dẫn thiết lập theo nền tảng
  - Hướng dẫn Cấu hình: Thiết lập môi trường và xác thực
  - Hướng dẫn Dự án Đầu tiên: Học thực hành từng bước

- **Mô-đun Triển khai và Cung cấp**
  - Hướng dẫn Triển khai: Tài liệu quy trình hoàn chỉnh
  - Hướng dẫn Cung cấp: Cơ sở hạ tầng như mã với Bicep
  - Thực tiễn tốt nhất cho triển khai sản xuất
  - Mẫu kiến trúc đa dịch vụ

- **Mô-đun Xác thực Trước Triển khai**
  - Lập Kế hoạch Năng lực: Xác thực khả năng tài nguyên Azure
  - Lựa chọn SKU: Hướng dẫn lớp dịch vụ toàn diện
  - Kiểm tra Trước bay: Kịch bản tự động xác thực (PowerShell và Bash)
  - Công cụ ước tính chi phí và kế hoạch ngân sách

- **Mô-đun Xử lý Sự cố**
  - Vấn đề Thường gặp: Các sự cố phổ biến và giải pháp
  - Hướng dẫn Gỡ lỗi: Phương pháp luận xử lý sự cố có hệ thống
  - Kỹ thuật và công cụ chẩn đoán nâng cao
  - Giám sát và tối ưu hiệu suất

- **Tài nguyên và Tham khảo**
  - Bảng Lệnh Nhanh: Tham khảo nhanh các lệnh thiết yếu
  - Thuật ngữ: Định nghĩa thuật ngữ và viết tắt toàn diện
  - Câu hỏi Thường gặp (FAQ): Câu trả lời chi tiết cho các câu hỏi phổ biến
  - Liên kết tài nguyên bên ngoài và kết nối cộng đồng

- **Ví dụ và Mẫu**
  - Ví dụ Ứng dụng Web Đơn giản
  - Mẫu triển khai Website Tĩnh
  - Cấu hình Ứng dụng Container
  - Mẫu tích hợp Cơ sở dữ liệu
  - Ví dụ kiến trúc Microservices
  - Triển khai hàm Serverless

#### Tính năng
- **Hỗ trợ Đa nền tảng**: Hướng dẫn cài đặt và cấu hình cho Windows, macOS và Linux
- **Nhiều Trình độ**: Nội dung thiết kế cho sinh viên đến nhà phát triển chuyên nghiệp
- **Tập trung Thực hành**: Ví dụ thực hành và kịch bản thực tế
- **Bao phủ Toàn diện**: Từ khái niệm cơ bản đến mẫu doanh nghiệp nâng cao
- **Phương pháp An ninh-Trước tiên**: Thực hành bảo mật tích hợp suốt tài liệu
- **Tối ưu Chi phí**: Hướng dẫn triển khai hiệu quả và quản lý tài nguyên

#### Chất lượng Tài liệu
- **Ví dụ Mã nguồn Chi tiết**: Các mẫu mã thực tế đã kiểm thử
- **Hướng dẫn Từng bước**: Hướng dẫn rõ ràng và có thể hành động
- **Xử lý Lỗi Toàn diện**: Xử lý sự cố cho các vấn đề phổ biến
- **Tích hợp Thực hành Tốt nhất**: Tiêu chuẩn và khuyến nghị ngành
- **Tương thích Phiên bản**: Cập nhật với dịch vụ Azure và tính năng azd mới nhất

## Các Nâng cấp Dự kiến Trong Tương lai

### Phiên bản 3.1.0 (Dự kiến)
#### Mở rộng Nền tảng AI
- **Hỗ trợ Đa Mô hình**: Mẫu tích hợp cho Hugging Face, Azure Machine Learning và mô hình tùy chỉnh
- **Khung Tác nhân AI**: Mẫu triển khai LangChain, Semantic Kernel và AutoGen
- **Mẫu RAG Nâng cao**: Tùy chọn cơ sở dữ liệu vector ngoài Azure AI Search (Pinecone, Weaviate, v.v.)
- **Quan sát AI**: Giám sát nâng cao hiệu suất mô hình, sử dụng token và chất lượng phản hồi

#### Trải nghiệm Nhà phát triển
- **Tiện ích Mở rộng VS Code**: Trải nghiệm phát triển tích hợp AZD + Microsoft Foundry
- **Tích hợp GitHub Copilot**: Tạo mẫu AZD hỗ trợ AI
- **Hướng dẫn Tương tác**: Bài tập mã hóa thực hành với xác thực tự động cho kịch bản AI
- **Nội dung Video**: Video hướng dẫn bổ sung cho người học trực quan về triển khai AI

### Phiên bản 4.0.0 (Dự kiến)
#### Mẫu AI Doanh nghiệp
- **Khung Quản trị**: Quản trị mô hình AI, tuân thủ và theo dõi kiểm toán
- **AI Đa Khách hàng**: Mẫu phục vụ nhiều khách hàng với dịch vụ AI cách ly
- **Triển khai AI trên Edge**: Tích hợp với Azure IoT Edge và các container instance
- **AI Đa đám mây và Hybrid**: Mẫu triển khai đa đám mây và lai cho khối lượng công việc AI

#### Tính năng Nâng cao
- **Tự động Hóa Pipeline AI**: Tích hợp MLOps với pipeline Azure Machine Learning
- **An ninh Nâng cao**: Mẫu zero-trust, điểm cuối riêng tư và bảo vệ nâng cao trước mối đe dọa
- **Tối ưu Hiệu suất**: Chiến lược điều chỉnh và mở rộng nâng cao cho ứng dụng AI hiệu năng cao
- **Phân phối Toàn cầu**: Mẫu phân phối nội dung và cache ở edge cho ứng dụng AI

### Phiên bản 3.0.0 (Dự kiến) - Đã bị Phiên bản Hiện tại Thay thế
#### Các Thêm Đề xuất - Đã Triển khai trong v3.0.0
- ✅ **Nội dung Tập trung AI**: Tích hợp Microsoft Foundry toàn diện (Đã hoàn thành)
- ✅ **Hướng dẫn Tương tác**: Hội thảo thực hành AI (Đã hoàn thành)
- ✅ **Mô-đun An ninh Nâng cao**: Mẫu bảo mật riêng cho AI (Đã hoàn thành)
- ✅ **Tối ưu Hiệu suất**: Chiến lược điều chỉnh khối lượng AI (Đã hoàn thành)

### Phiên bản 2.1.0 (Dự kiến) - Đã Triển khai Một phần trong v3.0.0
#### Cải tiến Nhỏ - Một số đã hoàn thành trong Phiên bản Hiện tại
- ✅ **Ví dụ Bổ sung**: Kịch bản triển khai tập trung AI (Đã hoàn thành)
- ✅ **FAQ Mở rộng**: Câu hỏi và xử lý sự cố riêng AI (Đã hoàn thành)
- **Tích hợp Công cụ**: Hướng dẫn tích hợp IDE và trình chỉnh sửa nâng cao
- ✅ **Mở rộng Giám sát**: Mẫu giám sát và cảnh báo riêng cho AI (Đã hoàn thành)

#### Vẫn Dự kiến cho Phiên bản Tương lai
- **Tài liệu Thân thiện Di động**: Thiết kế đáp ứng cho học trên thiết bị di động
- **Truy cập Ngoại tuyến**: Gói tài liệu có thể tải xuống
- **Tích hợp IDE Nâng cao**: Tiện ích mở rộng VS Code cho quy trình AZD + AI
- **Bảng điều khiển Cộng đồng**: Chỉ số cộng đồng thời gian thực và theo dõi đóng góp

## Góp phần vào Nhật ký Thay đổi

### Báo cáo Thay đổi
Khi đóng góp cho kho lưu trữ này, vui lòng đảm bảo mục nhật ký thay đổi bao gồm:

1. **Số Phiên bản**: Tuân theo phiên bản ngữ nghĩa (major.minor.patch)
2. **Ngày tháng**: Ngày phát hành hoặc cập nhật theo định dạng YYYY-MM-DD
3. **Danh mục**: Thêm, Thay đổi, Ngừng sử dụng, Xóa, Sửa, An ninh
4. **Mô tả Rõ ràng**: Mô tả ngắn gọn những gì đã thay đổi
5. **Đánh giá Tác động**: Tác động của thay đổi đối với người dùng hiện tại

### Các Danh mục Thay đổi

#### Thêm
- Các tính năng mới, mục tài liệu hoặc khả năng mới
- Ví dụ mới, mẫu hoặc tài liệu học bổ sung
- Công cụ, kịch bản hoặc tiện ích bổ sung

#### Thay đổi
- Sửa đổi chức năng hoặc tài liệu hiện có
- Cập nhật để cải thiện độ rõ ràng hoặc chính xác
- Tái cấu trúc nội dung hoặc tổ chức

#### Ngừng sử dụng
- Tính năng hoặc cách tiếp cận đang được loại bỏ dần
- Mục tài liệu dự kiến xóa bỏ
- Phương pháp có lựa chọn thay thế tốt hơn

#### Xóa
- Tính năng, tài liệu hoặc ví dụ không còn phù hợp
- Thông tin lỗi thời hoặc cách tiếp cận ngừng dùng
- Nội dung trùng lặp hoặc được hợp nhất

#### Sửa
- Sửa lỗi trong tài liệu hoặc mã nguồn
- Giải quyết các vấn đề báo cáo
- Cải thiện độ chính xác hoặc chức năng

#### An ninh
- Cải thiện hoặc sửa các vấn đề liên quan đến bảo mật
- Cập nhật thực hành bảo mật tốt nhất
- Giải quyết các điểm yếu về bảo mật

### Hướng dẫn Phiên bản Ngữ nghĩa

#### Phiên bản Chính (X.0.0)
- Thay đổi phá vỡ yêu cầu hành động của người dùng
- Tái cấu trúc lớn về nội dung hoặc tổ chức
- Thay đổi phương pháp hoặc cách tiếp cận căn bản

#### Phiên bản Phụ (X.Y.0)
- Thêm tính năng hoặc nội dung mới
- Cải tiến giữ tương thích ngược
- Ví dụ, công cụ hoặc tài nguyên bổ sung

#### Phiên bản Vá lỗi (X.Y.Z)
- Sửa lỗi và điều chỉnh
- Cải tiến nhỏ đối với nội dung hiện có
- Làm rõ và nâng cấp nhỏ

## Phản hồi và Gợi ý của Cộng đồng

Chúng tôi tích cực khuyến khích phản hồi cộng đồng để cải thiện tài nguyên học tập này:

### Cách Cung cấp Phản hồi
- **GitHub Issues**: Báo cáo sự cố hoặc đề xuất cải tiến (chào đón các vấn đề về AI)
- **Thảo luận Discord**: Chia sẻ ý tưởng và tham gia cộng đồng Microsoft Foundry
- **Pull Requests**: Góp phần cải tiến trực tiếp nội dung, đặc biệt là mẫu và hướng dẫn AI
- **Discord Microsoft Foundry**: Tham gia kênh #Azure cho thảo luận về AZD + AI
- **Diễn đàn Cộng đồng**: Tham gia thảo luận nhà phát triển Azure rộng hơn

### Danh mục Phản hồi
- **Độ chính xác Nội dung AI**: Sửa đổi về tích hợp dịch vụ AI và thông tin triển khai
- **Trải nghiệm Học tập**: Gợi ý cải thiện luồng học nhà phát triển AI
- **Thiếu Nội dung AI**: Yêu cầu thêm mẫu, mẫu thiết kế hoặc ví dụ AI
- **Khả năng truy cập**: Cải tiến cho nhu cầu học đa dạng
- **Tích hợp Công cụ AI**: Gợi ý tích hợp quy trình phát triển AI tốt hơn
- **Mẫu Triển khai AI Sản xuất**: Yêu cầu mẫu triển khai AI doanh nghiệp

### Cam kết Phản hồi
- **Phản hồi Sự cố**: Trong vòng 48 giờ cho các vấn đề báo cáo
- **Yêu cầu Tính năng**: Đánh giá trong vòng một tuần
- **Góp phần của Cộng đồng**: Xem xét trong vòng một tuần
- **Vấn đề An ninh**: Ưu tiên xử lý ngay với phản hồi nhanh chóng

## Lịch Trình Bảo trì

### Cập nhật Định kỳ
- **Đánh giá Hàng tháng**: Độ chính xác nội dung và xác thực liên kết
- **Cập nhật Hàng Quý**: Bổ sung và cải tiến nội dung lớn
- **Đánh giá Nửa Năm**: Tái cấu trúc và nâng cao toàn diện
- **Phát hành Hàng năm**: Phiên bản chính với cải tiến đáng kể

### Giám sát và Đảm bảo Chất lượng
- **Kiểm thử Tự động**: Xác thực định kỳ các ví dụ mã và liên kết  
- **Tích hợp Phản hồi Cộng đồng**: Thường xuyên tiếp nhận đề xuất của người dùng  
- **Cập nhật Công nghệ**: Đồng bộ với các dịch vụ Azure mới nhất và các bản phát hành azd  
- **Kiểm tra Khả năng Truy cập**: Đánh giá định kỳ về các nguyên tắc thiết kế bao gồm  

## Chính sách Hỗ trợ Phiên bản  

### Hỗ trợ Phiên bản Hiện tại  
- **Phiên bản Chính mới nhất**: Hỗ trợ đầy đủ với các bản cập nhật định kỳ  
- **Phiên bản Chính trước đó**: Cập nhật bảo mật và sửa lỗi quan trọng trong 12 tháng  
- **Phiên bản Cũ**: Chỉ hỗ trợ cộng đồng, không có cập nhật chính thức  

### Hướng dẫn Di cư  
Khi phát hành các phiên bản chính, chúng tôi cung cấp:  
- **Hướng dẫn Di cư**: Các bước chuyển đổi chi tiết  
- **Ghi chú Tương thích**: Chi tiết về các thay đổi không tương thích  
- **Hỗ trợ Công cụ**: Các script hoặc tiện ích hỗ trợ việc di cư  
- **Hỗ trợ Cộng đồng**: Diễn đàn riêng dành cho các câu hỏi về di cư  

---  

**Điều hướng**  
- **Bài học trước**: [Hướng dẫn học](resources/study-guide.md)  
- **Bài học tiếp theo**: Quay lại [README chính](README.md)  

**Cập nhật Thông tin**: Theo dõi kho lưu trữ này để nhận thông báo về các bản phát hành mới và cập nhật quan trọng đối với tài liệu học tập.  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->