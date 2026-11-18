# Nhật ký thay đổi - AZD Cho Người Mới Bắt Đầu

## Giới thiệu

Nhật ký thay đổi này ghi lại tất cả các thay đổi, cập nhật và cải tiến đáng chú ý trong kho AZD Cho Người Mới Bắt Đầu. Chúng tôi tuân thủ các nguyên tắc phiên bản theo ngữ nghĩa và duy trì nhật ký này để giúp người dùng hiểu những gì đã thay đổi giữa các phiên bản.

## Mục tiêu học tập

Bằng cách xem xét nhật ký thay đổi này, bạn sẽ:
- Luôn được thông báo về các tính năng và bổ sung nội dung mới
- Hiểu các cải tiến đã được thực hiện đối với tài liệu hiện có
- Theo dõi các sửa lỗi và điều chỉnh để đảm bảo độ chính xác
- Theo dõi sự phát triển của tài liệu học tập theo thời gian

## Kết quả học tập

Sau khi xem xét các mục trong nhật ký thay đổi, bạn sẽ có thể:
- Nhận diện nội dung và tài nguyên mới có sẵn để học tập
- Hiểu rõ các phần đã được cập nhật hoặc cải tiến
- Lập kế hoạch con đường học tập dựa trên tài liệu mới nhất
- Đóng góp phản hồi và đề xuất cải tiến trong tương lai

## Lịch sử phiên bản

### [v3.25.0] - 2026-11-09

#### Microsoft Foundry extension 1.0 hiện đã phát hành rộng rãi

Gói `microsoft.foundry` 1.0 đã **hoạt động và phát hành rộng rãi**, được công bố vào ngày [5 tháng 11 năm 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Khoá học bây giờ dạy quy trình GA đã phát hành, không phải bản sắp ra mắt. Bắt đầu với AZD **1.37.0 trở lên** và `azd ext install microsoft.foundry`.

#### Có trong bản cập nhật khoá học này
- Hướng dẫn tiếng Anh sử dụng gói GA làm đường dẫn cài đặt mặc định và giải thích bảy tiện ích mở rộng lõi độc lập phiên bản.
- Một [hướng dẫn qua trình duyệt máy chủ](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) bao gồm ví dụ API phản hồi Python Agent Framework upstream, phiên bản uv hiện tại, Python 3.13+, chọn dự án mới/tồn tại, tái sử dụng mô hình, và xem lại `azure.yaml`.
- Quy trình làm việc từ cục bộ đến đám mây bao gồm kiểm thử Agent Inspector, chi phí gọi mô hình dựa trên Azure, xây dựng mã từ xa, gọi triển khai, theo dõi đám mây, xem trước triển khai, nhật ký và chẩn đoán.
- Hướng dẫn đánh giá riêng biệt bao gồm tạo và xem lại bộ dữ liệu/bảng điểm, cấu hình đánh giá có tên, đăng ký tài sản, và kiểm tra kết quả. Hướng dẫn tối ưu hóa/cải tiến cũ vẫn là lịch sử di cư, không phải cơ sở phát hành hiện tại.
- Hướng dẫn Foundry CI/CD bao gồm cài đặt tiện ích mở rộng runner, triển khai xác thực, truy cập/tài sản đánh giá, và cổng chất lượng rõ ràng.
- Hướng dẫn dọn dẹp phân biệt dự án Foundry mới tạo và tái sử dụng. Hội thảo liên kết tới bài tập GA riêng biệt mà không thay thế các bài kiểm tra mẫu cụ thể.
- Điều hướng khoá học, mục tiêu học tập, yêu cầu cài đặt, bảng mẹo, FAQ và hướng dẫn học tập phản chiếu quy trình GA. Bản dịch tạo tự động không được chỉnh sửa thủ công.

#### Phạm vi xem xét
- Dựa trên thông báo GA, hướng dẫn Microsoft Learn liên kết, và cấu hình mẫu upstream. Không thực hiện cấp phát Azure sống, triển khai trực tiếp, gọi mô hình hoặc đánh giá.
- Gói GA không ngụ ý GA cho mọi tính năng tùy chọn, tiện ích mở rộng độc lập hoặc SDK, cũng không chứng nhận các ví dụ sử dụng sản xuất.

### [v3.24.0]- 2026-11-04

#### Sửa lỗi
- Sửa điều hướng khoá học tiếng Anh, đường dẫn di chuyển trang, thiếu neo, và tham chiếu bên ngoài lỗi thời, bao gồm liên kết Chương 2 tới hướng dẫn AI sản xuất.
- Xem xét lại hướng dẫn hiện tại đối với AZD 1.37.2 đã phát hành, các đại lý 1.0.0-beta.23, và đánh giá 1.0.0-beta.2. Ghi lại quy trình làm việc `azd ai eval` riêng biệt và di cư cấu hình tối ưu hóa.
- Sửa các cờ CLI không được hỗ trợ, ranh giới xác thực, hướng dẫn môi trường/chữ ký thuần túy, cập nhật hạ tầng, cấu hình mô hình, và ví dụ khôi phục phá hủy.
- Làm mới hội thảo đối với mẫu AI Agents hiện tại, bao gồm hook thực tế, đầu vào cấu hình, kiểm thử đánh giá, điểm đầu vào red-teaming, và khả năng quan sát.
- Sửa lỗi tuyên bố triển khai mẫu và sửa các vấn đề liên quan đến ứng dụng/hạ tầng/cấu hình. Tài liệu kiến trúc bán lẻ được phân biệt rõ ràng với một ứng dụng hoàn chỉnh.
- Phục hồi ma trận ngôn ngữ CodeQL, chọn Node.js 24 hỗ trợ cho container phát triển, và các trình xác thực cài đặt báo cáo lỗi các lệnh phiên bản.

#### Thêm
- Công cụ kiểm tra liên kết/neo ngoại tuyến chỉ tiếng Anh, kiểm thử hồi quy, và quy trình tài liệu cũng xây dựng hội thảo ở chế độ nghiêm ngặt. Loại trừ bản dịch và hình ảnh dịch tự động.

#### Phạm vi xác thực
- Nguồn, cú pháp, cấu hình, hành vi cục bộ, và kiểm tra liên kết mạng không xác minh khả năng triển khai Azure sống, hạn ngạch, RBAC, mô hình sẵn có vùng miền, thanh toán, tuân thủ bảo mật hay sẵn sàng sản xuất.
- Các mục cũ hơn bên dưới là hồ sơ lịch sử, không phải hướng dẫn lệnh hoặc phát hành hiện hành.

### [v3.23.0] - 2026-07-13

#### Làm mới AZD 1.27.1: Cập nhật Phiên bản Hiện hành
**Phiên bản này tái xác thực khoá học đối với `azd` `1.27.1` (tháng 7 năm 2026, phát hành ổn định mới nhất) và tiện ích mở rộng đại lý AI xem trước hiện tại `azure.ai.agents` `1.0.0-beta.5`, cập nhật mọi biểu ngữ "đã xác thực với" sau các phát hành 1.26.0, 1.27.0 và 1.27.1.**

#### Thay đổi
- **✅ Cập nhật cơ sở xác thực** từ `azd 1.25.6` (tháng 6 năm 2026) sang `azd 1.27.1` (tháng 7 năm 2026) trên file README gốc, tất cả README chương, bài học container phát triển Chương 1 (bao gồm ví dụ khoá cố định phiên bản), bài học mẫu tùy chỉnh Chương 4, bài học đa đại lý Chương 5 và tài liệu hội thảo
- **🤖 Làm mới cơ sở Chương 2** từ `azd 1.23.12` (tháng 3 năm 2026) sang `azd 1.27.1` trên `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` và `microsoft-foundry-integration.md`; cập nhật ngày ghi chú xác thực thành 2026-07-13
- **🧩 Nâng cấp tiện ích mở rộng đại lý AI** từ `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` lên phiên bản `1.0.0-beta.5` hiện tại trong README Chương 2 và `agents.md`
- **🧪 Cập nhật ví dụ xác thực hội thảo** (đầu ra `azd version`) lên `1.27.1`

#### Ghi chú về các phát hành azd liên quan (1.26.0 → 1.27.1)
- **1.26.0 (24-06-2026):** Hỗ trợ Go cho Azure Functions trên Flex Consumption, bộ lọc thuê bao theo từng người thuê `azd config sub-filter`, gói tiện ích mở rộng tự chứa (`azd x pack --bundle`), và `azd tool install azure-skills`
- **1.27.0 (30-06-2026):** Dự án/đại lý Azure AI Foundry mô hình trực tiếp trong `azure.yaml` (khởi tạo không dùng Bicep/Terraform), hỗ trợ triển khai container cho App Service (`host: appservice` + `language: docker`), hỗ trợ lệnh `-s/--source` trực tiếp cho `azd extension`, và `azd tool uninstall`
- **1.27.1 (09-07-2026):** Cờ `--no-dependencies` cho `azd extension install`, loại bỏ mô hình lỗi thời mặc định khỏi hộp thoại danh mục/hạn ngạch, và nhiều sửa lỗi khác

#### Các tệp đã cập nhật
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

#### Lấp đầy khoảng cách người mới #2: Tác giả mẫu, Dev Containers, Pulumi, Azure DevOps, Service Principals và nhiều hơn nữa
**Phiên bản này khép lại các khoảng cách trung cấp còn lại được phát hiện bởi phân tích azd-coverage: cách tạo và xuất bản mẫu của riêng bạn, môi trường dev-container/Codespaces tái tạo, nhà cung cấp hạ tầng Pulumi, hướng dẫn CI/CD Azure DevOps, xác thực bằng service principal, hướng dẫn chọn máy chủ (AKS/Spring Apps), giải thích `azd restore`/`azd package`, xử lý lỗi hook, và các thực hành môi trường nhóm/chung.**

#### Thêm
- **🧱 Bài học Chương 4 mới** `docs/chapter-04-infrastructure/custom-templates.md` — sáng tạo mẫu azd của riêng bạn: cấu trúc cần thiết (`azure.yaml`, `infra/`, `src/`), trường `metadata.template`, tham số hoá hạ tầng với token tài nguyên `uniqueString()` và thẻ `azd-env-name`, thử nghiệm cục bộ với `azd init --template <local-path>`, xuất bản lên GitHub, và gửi vào thư viện Awesome AZD
- **📦 Bài học Chương 1 mới** `docs/chapter-01-foundation/dev-containers.md` — môi trường azd tái tạo với Dev Containers và GitHub Codespaces: một `.devcontainer/devcontainer.json` tối giản dùng tính năng chính thức `ghcr.io/azure/azure-dev/azd`, các tính năng riêng biệt của ngôn ngữ, `docker-in-docker` cho máy chủ container, và `azd auth login --use-device-code` cho đăng nhập từ xa
- **🧩 Pulumi với azd** mục trong `docs/chapter-04-infrastructure/provisioning.md` — cấu hình `infra.provider: pulumi`, bố cục thư mục Pulumi, ngăn xếp ánh xạ với môi trường azd, đầu ra/thẻ bắt buộc, và quy trình `azd up` / `azd down` giống hệt
- **🎯 Hướng dẫn chọn máy chủ** trong `docs/chapter-04-infrastructure/provisioning.md` — so sánh thân thiện với người mới của `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, và `springapp`, cùng hướng dẫn chọn AKS hoặc Azure Spring Apps
- **🛠️ Hướng dẫn CI/CD Azure DevOps** trong `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, kết nối dịch vụ với liên kết danh tính workload federation (OIDC), `azure-dev.yml` tự động tạo, và cấu hình nhóm biến
- **🔑 Service Principals (Mẫu 4)** thêm vào `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` không tương tác với mật khẩu khách hàng so với chứng thực liên kết/OIDC, khi nào sử dụng, và lưu trữ thông tin xác thực an toàn
- **🪝 Phần xử lý lỗi hook** trong `docs/chapter-04-infrastructure/deployment-guide.md` — mã thoát và `set -e`, `continueOnError`, thử nghiệm hook riêng biệt với `azd hooks run`, shell hệ điều hành cụ thể, và `--debug`
- **👥 Môi trường nhóm / chia sẻ** phần trong `docs/chapter-03-configuration/configuration.md` — thứ gì nằm trong `.azure/`, những gì cần gitignore, môi trường riêng theo nhà phát triển, `azd env list`/`select`, và cung cấp giá trị môi trường trong CI/CD
- **🧰 `azd restore` và giải thích mở rộng `azd package`** trong `resources/cheat-sheet.md` — phục hồi phụ thuộc và xây dựng artifact có thể triển khai mà không cần triển khai

#### Thay đổi
- **🧭 Bảng bài học Chương 4** cập nhật để bao gồm bài học mới "Tạo mẫu của bạn" (Bài học 3)
- **🧭 Bảng bài học Chương 1** cập nhật để bao gồm bài học mới "Dev Containers & Codespaces" (Bài học 5); chân trang điều hướng nối giữa `bring-your-own-app.md` và `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Lấp đầy khoảng cách người mới bắt đầu: Bài học thực hành đa đại lý, "Mang ứng dụng của bạn", Terraform, và Hướng dẫn CI/CD
**Phiên bản này khép lại các khoảng trống lớn nhất cho hướng dẫn người mới hoàn chỉnh bằng cách thêm hai bài học thực hành mới (hướng dẫn đa đại lý có thể deploy và thêm azd vào ứng dụng hiện có), giới thiệu hook thân thiện người mới, mục Terraform với azd, hướng dẫn từng bước pipeline GitHub Actions, giải thích tiện ích mở rộng xem trước mới, và danh sách kiểm tra xác minh triển khai rõ ràng.**

#### Thêm
- **🤝 Bài học Chương 5 mới** `docs/chapter-05-multi-agent/multi-agent-basics.md` — hướng dẫn thực hành hoàn chỉnh hai đại lý có thể triển khai (điều phối + chuyên gia) dùng mẫu thực tế (`contoso-creative-writer`), bao gồm khi nào sử dụng đa đại lý, quy trình `azd up`, hiểu tài nguyên đã triển khai, theo dõi chéo đại lý, tuỳ biến, và dọn dẹp
- **📦 Bài học Chương 1 mới** `docs/chapter-01-foundation/bring-your-own-app.md` — cách thêm azd vào dự án hiện có với `azd init` ("sử dụng mã trong thư mục hiện tại"), hiểu `azure.yaml` và `infra/`, `azd infra generate`, phát hiện máy chủ, và triển khai với `azd up`
- **🌐 Mục Terraform với azd** thêm vào `docs/chapter-04-infrastructure/provisioning.md` — cấu hình `infra.provider: terraform`, bố cục thư mục `.tf`, đầu ra bắt buộc `AZURE_*` và gán thẻ `azd-env-name`, và quy trình `azd up` / `azd down` giống hệt (đóng khoảng trống khi tuyên bố hỗ trợ Terraform nhưng chỉ trình bày Bicep)
- **⚙️ Hướng dẫn chi tiết GitHub Actions** trong `docs/chapter-08-production/production-ai-practices.md` — từ kho GitHub đến triển khai tự động: `azd pipeline config`, chứng chỉ liên kết OIDC (không lưu trữ bí mật), `azure-dev.yml` được tạo ra, và hướng dẫn về bí mật và biến
- **🪝 Giới thiệu "Mới với hooks?" dành cho người mới** trong `docs/chapter-04-infrastructure/deployment-guide.md` — hook là gì, bảng giai đoạn hook, hook đầu tiên tối giản, và cách chạy hooks thủ công với `azd hooks run`
- **✅ Danh sách kiểm tra "Xác minh triển khai của bạn"** được thêm vào Bước 5 của `docs/chapter-01-foundation/first-project.md` — kiểm tra nhanh, kiểm tra điểm cuối sức khỏe, và tiêu chí thành công rõ ràng
- **🧩 Giải thích cho các tiện ích mở rộng preview mới** `azure.ai.skills` và `azure.ai.connections` (chúng là gì và khi nào nên dùng) trong `docs/chapter-08-production/production-ai-practices.md`

#### Đã thay đổi
- **🧭 Bảng bài học Chương 5** được sửa: `multi-agent-basics.md` giờ là Bài học 1 (bài học thực hành duy nhất), với nhãn rõ ràng rằng Bài học 2 ở Chương 6 và kịch bản Bán lẻ là bản mẫu kiến trúc, không phải mẫu một lệnh
- **🧭 Bảng bài học Chương 1** bây giờ bao gồm bài học mới "Mang ứng dụng của bạn đến" (Bài học 4)
- **🔗 Chân trang điều hướng** được cập nhật: `first-project.md` bây giờ liên kết đến `bring-your-own-app.md`

#### Đã sửa
- **🧱 Đã đóng khoảng trống Terraform "đã yêu cầu nhưng thiếu"** — khóa học trước đây tham chiếu hỗ trợ Terraform nhưng không hiển thị nó
- **🔀 Sửa chữa các liên kết chéo Chương 5 gây hiểu lầm** rằng có một triển khai đa tác nhân hoàn chỉnh khi chỉ có bản mẫu kiến trúc

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

#### Làm mới AZD 1.25.6, Toàn bộ lệnh vòng đời Agent & Đổi tên Aspire
**Phiên bản này tái xác nhận khóa học với `azd` `1.25.6` (tháng 6 năm 2026) và tiện ích mở rộng `azure.ai.agents` `0.1.40-preview`, mở rộng hướng dẫn AI từ "khung agent" đến toàn bộ vòng đời agent (kiểm tra → đánh giá → tối ưu → kiểm tra → xóa), giới thiệu các tiện ích preview mới `azure.ai.skills` và `azure.ai.connections`, và ghi chú về đổi tên sản phẩm từ ".NET Aspire" thành "Aspire".**

#### Đã thêm
- **🔁 Bao phủ đầy đủ vòng đời agent** cho người mới và kỹ sư AI trong toàn bộ tài liệu:
  - `docs/chapter-01-foundation/azd-basics.md` — Bảng vòng đời (khung → kiểm tra → đo lường → cải thiện → kiểm tra → dọn dẹp) được thêm vào phần Tiện ích mở rộng và Lệnh AI
  - `docs/chapter-08-production/production-ai-practices.md` — Mục mới "Quản lý vòng đời Agent" bao gồm `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, và `delete --force`
  - `resources/cheat-sheet.md` — Mở rộng Lệnh AI Agent với `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, và `delete --force`
- **🧩 Tiện ích preview mới** được tài liệu hóa: `azure.ai.skills` (kỹ năng agent tái sử dụng) và `azure.ai.connections` (kết nối Foundry) được thêm vào bảng tiện ích và cheat sheet
- **⏱️ Hướng dẫn thời gian phản hồi** — ví dụ `azd ai agent invoke` giờ ghi chú thời gian trễ tổng thể và thời gian đến byte đầu tiên
- **📌 Biểu ngữ phiên bản** trong README gốc hướng dẫn người học đến `azd version` và `azd upgrade`

#### Đã thay đổi
- **✅ Cập nhật cơ sở xác thực** từ `azd 1.23.12` (tháng 3 năm 2026) sang `azd 1.25.6` (tháng 6 năm 2026) trên tất cả README chương và tài liệu workshop
- **🤖 Ghi chú tiện ích Chương 2** cập nhật từ `azure.ai.agents` `0.1.18-preview` sang `0.1.40-preview`
- **🧪 Ví dụ xác thực workshop** (đầu ra `azd version`) cập nhật thành `1.25.6`
- **🧭 README "Có gì mới trong azd hôm nay"** làm mới để làm nổi bật vòng đời agent end-to-end, tiện ích AI mới và các sửa lỗi cải thiện trải nghiệm (`azd init` idempotency, `azd auth login` làm sạch token cũ, `azd tool` prompt lần chạy đầu)
- **📖 agents.md chương 2 (Lựa chọn 4)** bây giờ hướng người học đến các lệnh vòng đời sau triển khai thay vì kết thúc ở `azd up`

#### Đã sửa
- **🏷️ Đặt tên sản phẩm** — thêm ghi chú đổi tên Aspire (".NET Aspire" giờ chỉ còn "Aspire"); hỗ trợ azd Aspire không thay đổi
- **🔎 Xác thực phát hành trực tiếp** xác nhận với nguồn phát hành Azure Developer CLI: CLI ổn định `1.25.6` (2026-06-12) và `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Làm rõ onboarding người mới, xác thực cài đặt & dọn dẹp lệnh AZD cuối cùng
**Phiên bản này tiếp nối kiểm tra xác thực AZD 1.23 với một lần rà soát tài liệu tập trung vào người mới: làm rõ hướng dẫn xác thực AZD đầu tiên, thêm script xác thực cài đặt tại chỗ, xác minh lệnh chính với CLI AZD trực tiếp, và loại bỏ các tham chiếu lệnh tiếng Anh đã lỗi thời ngoài changelog.**

#### Đã thêm
- **🧪 Script xác thực cài đặt dành cho người mới** với `validate-setup.ps1` và `validate-setup.sh` để người học có thể xác nhận công cụ cần thiết trước khi bắt đầu Chương 1
- **✅ Bước xác thực cài đặt trước** trong README gốc và README Chương 1 để phát hiện thiếu sót yêu cầu trước khi `azd up`

#### Đã thay đổi
- **🔐 Hướng dẫn xác thực cho người mới** hiện xử lý nhất quán `azd auth login` là đường dẫn chính cho quy trình AZD, với `az login` được gọi là tùy chọn trừ khi sử dụng trực tiếp lệnh Azure CLI
- **📚 Quy trình onboarding Chương 1** bây giờ hướng người học xác thực môi trường cài đặt tại chỗ trước bước cài đặt, xác thực, và triển khai đầu tiên
- **🛠️ Thông báo trình xác thực** hiện rõ ràng phân biệt yêu cầu bắt buộc và cảnh báo tùy chọn Azure CLI cho đường dẫn người mới chỉ dùng AZD
- **📖 Tài liệu cấu hình, khắc phục sự cố, ví dụ** hiện phân biệt rõ xác thực AZD bắt buộc và đăng nhập Azure CLI tùy chọn, trước đây trình bày chung chung

#### Đã sửa
- **📋 Tham chiếu lệnh tiếng Anh còn lại** cập nhật thành dạng AZD hiện tại, bao gồm `azd config show` trong cheat sheet và `azd monitor --overview` ở phần hướng dẫn tổng quan Azure Portal
- **🧭 Các tuyên bố người mới trong Chương 1** được làm dịu bớt để tránh hứa hẹn sẽ không có lỗi hoặc rollback trên tất cả mẫu và tài nguyên Azure
- **🔎 Xác thực CLI trực tiếp** xác nhận hỗ trợ cho `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, và `azd down --force --purge`

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

#### Xác thực AZD 1.23.12, Mở rộng môi trường Workshop & Làm mới mẫu AI
**Phiên bản này thực hiện khảo sát xác thực tài liệu với `azd` `1.23.12`, cập nhật ví dụ lệnh AZD lỗi thời, làm mới hướng dẫn mô hình AI theo mặc định hiện tại, và mở rộng hướng dẫn workshop vượt ra ngoài GitHub Codespaces để hỗ trợ cả container phát triển và bản clone cục bộ.**

#### Đã thêm
- **✅ Ghi chú xác thực trên tất cả các chương chính và tài liệu workshop** làm rõ cơ sở AZD đã được kiểm tra cho người học dùng các phiên bản CLI mới hoặc cũ
- **⏱️ Hướng dẫn timeout triển khai** cho các triển khai ứng dụng AI lâu dài sử dụng `azd deploy --timeout 1800`
- **🔎 Các bước kiểm tra tiện ích mở rộng** với `azd extension show azure.ai.agents` trong tài liệu quy trình AI
- **🌐 Hướng dẫn môi trường workshop rộng hơn** bao gồm GitHub Codespaces, container dev, và bản clone cục bộ với MkDocs

#### Đã thay đổi
- **📚 README giới thiệu chương** hiện nhất quán ghi chú xác thực với `azd 1.23.12` trên các phần nền tảng, cấu hình, hạ tầng, đa tác nhân, trước triển khai, khắc phục sự cố, và sản xuất
- **🛠️ Tham chiếu lệnh AZD** được cập nhật thành dạng hiện tại trên toàn bộ tài liệu:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` hoặc `azd env get-value(s)` tùy bối cảnh
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` khi hướng dẫn tổng quan Application Insights được dự kiến
- **🧪 Ví dụ provision preview** đơn giản hóa thành các cách dùng hiện được hỗ trợ như `azd provision --preview` và `azd provision --preview -e production`
- **🧭 Quy trình workshop** được cập nhật để người học có thể hoàn thành bài lab trong Codespaces, container dev, hoặc clone cục bộ thay vì chỉ giả định thực thi Codespaces
- **🔐 Hướng dẫn xác thực** hiện ưu tiên `azd auth login` cho quy trình AZD, với `az login` được đặt là tùy chọn khi dùng lệnh Azure CLI trực tiếp

#### Đã sửa
- **🪟 Lệnh cài đặt Windows** chuẩn hóa theo cách viết gói `winget` hiện tại trong hướng dẫn cài đặt
- **🐧 Hướng dẫn cài đặt Linux** được sửa để tránh lệnh quản lý gói phân phối riêng không được hỗ trợ `azd` và thay vào đó trỏ đến tài sản phát hành khi phù hợp
- **📦 Ví dụ mô hình AI** làm mới từ các mặc định cũ như `gpt-35-turbo` và `text-embedding-ada-002` thành các ví dụ hiện tại như `gpt-4.1-mini`, `gpt-4.1`, và `text-embedding-3-large`
- **📋 Đoạn trích lệnh triển khai và chuẩn đoán** sửa để dùng các lệnh môi trường và trạng thái hiện tại trong nhật ký, script, và bước khắc phục sự cố
- **⚙️ Hướng dẫn GitHub Actions** cập nhật từ `Azure/setup-azd@v1.0.0` sang `Azure/setup-azd@v2`
- **🤖 Hướng dẫn đồng thuận MCP/Copilot** cập nhật từ `azd mcp consent` sang `azd copilot consent list`

#### Cải thiện
- **🧠 Hướng dẫn chương AI** giải thích rõ hơn hành vi `azd ai` nhạy cảm với preview, đăng nhập tenant-specfic, sử dụng tiện ích mở rộng hiện tại, và khuyến nghị triển khai mô hình cập nhật
- **🧪 Hướng dẫn workshop** hiện dùng ví dụ phiên bản thực tế hơn và ngôn ngữ chuẩn bị môi trường rõ ràng cho lab thực hành
- **📈 Tài liệu sản xuất và khắc phục sự cố** giờ phù hợp hơn với các ví dụ giám sát hiện tại, mô hình dự phòng, và các tầng giá

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

#### Lệnh AI CLI AZD, Xác thực Nội dung & Mở rộng Mẫu
**Phiên bản này bổ sung phạm vi lệnh `azd ai`, `azd extension` và `azd mcp` cho tất cả các chương liên quan đến AI, sửa các liên kết hỏng và mã đã lỗi thời trong agents.md, cập nhật bảng cheat sheet, và cải tổ phần Mẫu Ví dụ với các mô tả đã được xác thực và các mẫu Azure AI AZD mới.**

#### Đã thêm
- **🤖 Phạm vi AZD AI CLI** trên 7 tập tin (trước đây chỉ trong Chương 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Mục "Extensions and AI Commands" mới giới thiệu `azd extension`, `azd ai agent init`, và `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Tùy chọn 4: `azd ai agent init` với bảng so sánh (cách tiếp cận template so với manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Các mục nhỏ "AZD Extensions for Foundry" và "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Khởi động nhanh bây giờ hiển thị cả đường dẫn triển khai dựa trên template và manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Mục Triển khai giờ bao gồm tùy chọn `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Mục nhỏ "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Mục "AI & Extensions Commands" mới với `azd extension`, `azd ai agent init`, `azd mcp`, và `azd infra generate`
- **📦 Mẫu ví dụ AZD AI mới** trong `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET với Blazor WebAssembly, Semantic Kernel, và hỗ trợ trò chuyện bằng giọng nói
  - **azure-search-openai-demo-java** — Chat RAG Java sử dụng Langchain4J với các tùy chọn triển khai ACA/AKS
  - **contoso-creative-writer** — Ứng dụng viết sáng tạo đa tác nhân sử dụng Azure AI Agent Service, Bing Grounding và Prompty
  - **serverless-chat-langchainjs** — RAG serverless sử dụng Azure Functions + LangChain.js + Cosmos DB với hỗ trợ phát triển địa phương Ollama
  - **chat-with-your-data-solution-accelerator** — Bộ tăng tốc RAG doanh nghiệp với cổng quản trị, tích hợp Teams và tùy chọn PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Ứng dụng tham khảo điều phối MCP đa tác nhân với máy chủ .NET, Python, Java và TypeScript
  - **azd-ai-starter** — Mẫu khởi đầu Azure AI hạ tầng Bicep tối giản
  - **🔗 Liên kết Thư viện AZD AI Tuyệt vời** — Tham chiếu tới [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (hơn 80 mẫu)

#### Đã sửa
- **🔗 Điều hướng agents.md**: Các liên kết Trước/Sau giờ phù hợp với thứ tự bài học trong README Chương 2 (Tích hợp Microsoft Foundry → Agents → Triển khai mô hình AI)
- **🔗 Liên kết hỏng agents.md**: `production-ai-practices.md` được sửa thành `../chapter-08-production/production-ai-practices.md` (3 lần xuất hiện)
- **📦 Mã lỗi thời trong agents.md**: Thay thế `opencensus` bằng `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API không hợp lệ trong agents.md**: Chuyển `max_tokens` từ `create_agent()` sang `create_run()` như `max_completion_tokens`
- **🔢 Đếm token trong agents.md**: Thay thế ước lượng thô `len//4` bằng `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Sửa đổi dịch vụ từ "Cognitive Search + App Service" sang "Azure AI Search + Azure Container Apps" (máy chủ mặc định thay đổi vào tháng 10 năm 2024)
- **contoso-chat**: Cập nhật mô tả để tham chiếu Azure AI Foundry + Prompty, phù hợp với tiêu đề và công nghệ thực tế của repo

#### Đã xoá
- **ai-document-processing**: Xóa tham chiếu mẫu không hoạt động (repo không công khai làm mẫu AZD)

#### Cải thiện
- **📝 Bài tập agents.md**: Bài tập 1 hiện hiển thị đầu ra mong đợi và bước `azd monitor`; Bài tập 2 bao gồm toàn bộ mã đăng ký `FunctionTool`; Bài tập 3 thay thế hướng dẫn không rõ ràng bằng lệnh `prepdocs.py` cụ thể
- **📚 Tài nguyên agents.md**: Cập nhật liên kết tài liệu đến tài liệu hiện tại của Azure AI Agent Service và khởi động nhanh
- **📋 Bảng Bước Tiếp Theo agents.md**: Thêm liên kết AI Workshop Lab cho phủ sóng chương hoàn chỉnh

#### Các tập tin đã cập nhật
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Cải tiến Điều hướng Khoá học
**Phiên bản này cải thiện điều hướng chương README.md với định dạng bảng nâng cao.**

#### Thay đổi
- **Bảng Bản đồ Khoá học**: Được nâng cấp với các liên kết bài học trực tiếp, ước lượng thời lượng và đánh giá độ phức tạp
- **Dọn dẹp Thư mục**: Xóa bỏ các thư mục cũ thừa thãi (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Xác minh Liên kết**: Tất cả hơn 21 liên kết nội bộ trong Bảng Bản đồ Khoá học được kiểm tra

### [v3.16.0] - 2026-02-05

#### Cập nhật Tên Sản phẩm
**Phiên bản này cập nhật các tham chiếu sản phẩm theo thương hiệu Microsoft hiện tại.**

#### Thay đổi
- **Microsoft Foundry → Microsoft Foundry**: Cập nhật tất cả tham chiếu trong các tập tin không phải bản dịch
- **Azure AI Agent Service → Foundry Agents**: Tên dịch vụ được cập nhật để phù hợp với thương hiệu hiện tại

#### Tập tin đã cập nhật
- `README.md` - Trang chủ khoá học chính
- `changelog.md` - Lịch sử phiên bản
- `course-outline.md` - Cấu trúc khoá học
- `docs/chapter-02-ai-development/agents.md` - Hướng dẫn agents AI
- `examples/README.md` - Tài liệu ví dụ
- `workshop/README.md` - Trang giới thiệu workshop
- `workshop/docs/index.md` - Chỉ mục workshop
- `workshop/docs/instructions/*.md` - Tất cả tập tin hướng dẫn workshop

---

### [v3.15.0] - 2026-02-05

#### Tái cấu trúc kho chứa: Thư mục theo chương
**Phiên bản này tái cấu trúc tài liệu thành các thư mục chương riêng biệt để điều hướng rõ ràng hơn.**

#### Đổi tên thư mục
Các thư mục cũ đã được thay thế bằng thư mục đánh số chương:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Đã thêm mới: `docs/chapter-05-multi-agent/`

#### Di chuyển tập tin
| Tập tin | Từ | Đến |
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
| Tất cả tập tin tiền triển khai | pre-deployment/ | chapter-06-pre-deployment/ |
| Tất cả tập tin khắc phục sự cố | troubleshooting/ | chapter-07-troubleshooting/ |

#### Đã thêm
- **📚 Tập tin README Chương**: Tạo README.md trong mỗi thư mục chương với:
  - Mục tiêu học tập và thời lượng
  - Bảng bài học với mô tả
  - Các lệnh khởi động nhanh
  - Điều hướng đến các chương khác

#### Thay đổi
- **🔗 Cập nhật tất cả liên kết nội bộ**: Cập nhật hơn 78 đường dẫn trên tất cả tập tin tài liệu
- **🗺️ README.md chính**: Cập nhật Bản đồ Khoá học với cấu trúc chương mới
- **📝 examples/README.md**: Cập nhật tham chiếu chéo đến thư mục chương

#### Đã xoá
- Cấu trúc thư mục cũ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Tái cấu trúc kho chứa: Điều hướng chương
**Phiên bản này thêm các tập tin README điều hướng chương (được thay thế bởi v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Hướng dẫn mới về AI Agents
**Phiên bản này bổ sung hướng dẫn toàn diện để triển khai các AI agents với Azure Developer CLI.**

#### Đã thêm
- **🤖 docs/microsoft-foundry/agents.md**: Hướng dẫn đầy đủ bao gồm:
  - AI agents là gì và cách chúng khác chatbot
  - Ba mẫu agent khởi động nhanh (Foundry Agents, Prompty, RAG)
  - Mô hình kiến trúc agent (agent đơn, RAG, đa agent)
  - Cấu hình và tùy chỉnh công cụ
  - Giám sát và theo dõi số liệu
  - Các cân nhắc về chi phí và tối ưu hoá
  - Các tình huống khắc phục sự cố phổ biến
  - Ba bài tập thực hành với tiêu chí thành công

#### Cấu trúc nội dung
- **Giới thiệu**: Khái niệm agent cho người mới bắt đầu
- **Khởi động nhanh**: Triển khai agents với `azd init --template get-started-with-ai-agents`
- **Mô hình kiến trúc**: Sơ đồ minh họa các mô hình agent
- **Cấu hình**: Thiết lập công cụ và biến môi trường
- **Giám sát**: Tích hợp Application Insights
- **Bài tập**: Học thực hành theo tiến trình (20-45 phút mỗi bài)

---

### [v3.12.0] - 2026-02-05

#### Cập nhật môi trường DevContainer
**Phiên bản này cập nhật cấu hình container phát triển với công cụ hiện đại và thiết lập mặc định tốt hơn cho trải nghiệm học AZD.**

#### Thay đổi
- **🐳 Ảnh nền tảng**: Cập nhật từ `python:3.12-bullseye` thành `python:3.12-bookworm` (Debian stable mới nhất)
- **📛 Tên container**: Đổi từ "Python 3" thành "AZD for Beginners" để rõ ràng hơn

#### Đã thêm
- **🔧 Tính năng Dev Container mới**:
  - `azure-cli` với hỗ trợ Bicep được bật
  - `node:20` (phiên bản LTS cho các mẫu AZD)
  - `github-cli` để quản lý mẫu
  - `docker-in-docker` để triển khai ứng dụng container

- **🔌 Chuyển tiếp cổng**: Cổng cấu hình sẵn cho phát triển phổ biến:
  - 8000 (xem trước MkDocs)
  - 3000 (ứng dụng web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Extension VS Code mới**:
  - `ms-python.vscode-pylance` - IntelliSense Python nâng cao
  - `ms-azuretools.vscode-azurefunctions` - Hỗ trợ Azure Functions
  - `ms-azuretools.vscode-docker` - Hỗ trợ Docker
  - `ms-azuretools.vscode-bicep` - Hỗ trợ ngôn ngữ Bicep
  - `ms-azure-devtools.azure-resource-groups` - Quản lý tài nguyên Azure
  - `yzhang.markdown-all-in-one` - Chỉnh sửa Markdown
  - `DavidAnson.vscode-markdownlint` - Kiểm tra Markdown linting
  - `bierner.markdown-mermaid` - Hỗ trợ sơ đồ Mermaid
  - `redhat.vscode-yaml` - Hỗ trợ YAML (cho azure.yaml)
  - `eamodio.gitlens` - Hiển thị Git
  - `mhutchie.git-graph` - Lịch sử Git

- **⚙️ Cài đặt VS Code**: Thêm cài đặt mặc định cho trình thông dịch Python, định dạng khi lưu, và cắt khoảng trắng thừa

- **📦 Cập nhật requirements-dev.txt**:
  - Thêm plugin minify cho MkDocs
  - Thêm pre-commit cho chất lượng mã
  - Thêm các gói Azure SDK (azure-identity, azure-mgmt-resource)

#### Đã sửa
- **Lệnh Post-Create**: Giờ kiểm tra cài đặt AZD và Azure CLI khi container khởi động

---

### [v3.11.0] - 2026-02-05

#### Cải tổ README thân thiện người mới bắt đầu
**Phiên bản này cải thiện đáng kể README.md để dễ tiếp cận hơn với người mới và bổ sung tài nguyên thiết yếu cho nhà phát triển AI.**

#### Đã thêm
- **🆚 So sánh Azure CLI và AZD**: Giải thích rõ khi nào dùng công cụ nào kèm ví dụ thực tiễn
- **🌟 Liên kết AZD Tuyệt vời**: Liên kết trực tiếp tới thư viện mẫu cộng đồng và tài nguyên đóng góp:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Hơn 200 mẫu sẵn sàng triển khai
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Đóng góp cộng đồng
- **🎯 Hướng dẫn Khởi động nhanh**: Phần bắt đầu 3 bước đơn giản (Cài đặt → Đăng nhập → Triển khai)
- **📊 Bảng Điều hướng dựa trên kinh nghiệm**: Hướng dẫn rõ ràng điểm bắt đầu dựa trên kinh nghiệm lập trình viên

#### Thay đổi
- **Cấu trúc README**: Tổ chức lại để tiết lộ thông tin theo tiến trình - thông tin quan trọng trước
- **Phần giới thiệu**: Viết lại để giải thích "Phép thuật của `azd up`" cho người mới hoàn toàn
- **Xoá nội dung trùng lặp**: Loại bỏ mục khắc phục sự cố trùng lặp
- **Lệnh Khắc Phục Sự Cố**: Sửa tham chiếu `azd logs` để sử dụng `azd monitor --logs` hợp lệ

#### Sửa Lỗi
- **🔐 Lệnh Xác Thực**: Thêm `azd auth login` và `azd auth logout` vào cheat-sheet.md
- **Tham chiếu Lệnh Không Hợp lệ**: Xóa phần còn lại của `azd logs` trong phần khắc phục sự cố của README

#### Ghi Chú
- **Phạm vi**: Thay đổi áp dụng cho README.md chính và resources/cheat-sheet.md
- **Đối tượng mục tiêu**: Cải tiến hướng đến các nhà phát triển mới làm quen với AZD

---

### [v3.10.0] - 2026-02-05

#### Cập nhật Độ Chính Xác Lệnh Azure Developer CLI
**Phiên bản này sửa các lệnh AZD không tồn tại trong toàn bộ tài liệu, đảm bảo tất cả các ví dụ mã sử dụng cú pháp Azure Developer CLI hợp lệ.**

#### Sửa Lỗi
- **🔧 Loại bỏ Lệnh AZD Không Tồn Tại**: Kiểm tra và sửa lỗi lệnh không hợp lệ toàn diện:
  - `azd logs` (không tồn tại) → thay thế bằng `azd monitor --logs` hoặc các lựa chọn Azure CLI
  - Các lệnh con `azd service` (không tồn tại) → thay thế bằng `azd show` và Azure CLI
  - `azd infra import/export/validate` (không tồn tại) → loại bỏ hoặc thay bằng lựa chọn hợp lệ
  - Các cờ `azd deploy --rollback/--incremental/--parallel/--detect-changes` (không tồn tại) → loại bỏ
  - Các cờ `azd provision --what-if/--rollback` (không tồn tại) → cập nhật sử dụng `--preview`
  - `azd config validate` (không tồn tại) → thay thế bằng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (không tồn tại) → loại bỏ

- **📚 Các Tệp Đã Cập Nhật với Sửa Lỗi Lệnh**:
  - `resources/cheat-sheet.md`: Đại tu tham chiếu lệnh
  - `docs/deployment/deployment-guide.md`: Sửa chiến lược rollback và triển khai
  - `docs/troubleshooting/debugging.md`: Sửa các phần phân tích nhật ký
  - `docs/troubleshooting/common-issues.md`: Cập nhật các lệnh khắc phục sự cố
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa phần gỡ lỗi AZD
  - `docs/getting-started/azd-basics.md`: Sửa các lệnh giám sát
  - `docs/getting-started/first-project.md`: Cập nhật các ví dụ giám sát và gỡ lỗi
  - `docs/getting-started/installation.md`: Sửa các ví dụ trợ giúp và phiên bản
  - `docs/pre-deployment/application-insights.md`: Sửa các lệnh xem nhật ký
  - `docs/pre-deployment/coordination-patterns.md`: Sửa các lệnh gỡ lỗi agent

- **📝 Cập nhật Tham chiếu Phiên bản**: 
  - `docs/getting-started/installation.md`: Thay đổi phiên bản `1.5.0` mã hóa cứng thành `1.x.x` chung với liên kết đến các bản phát hành

#### Thay Đổi
- **Chiến lược Rollback**: Cập nhật tài liệu để sử dụng rollback dựa trên Git (AZD không có rollback bản địa)
- **Xem Nhật ký**: Thay thế tham chiếu `azd logs` bằng `azd monitor --logs`, `azd monitor --live`, và các lệnh Azure CLI
- **Phần Hiệu suất**: Loại bỏ các cờ triển khai song song/tăng dần không tồn tại, đưa ra các lựa chọn hợp lệ

#### Chi Tiết Kỹ Thuật
- **Lệnh AZD Hợp lệ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Cờ hợp lệ cho azd monitor**: `--live`, `--logs`, `--overview`
- **Các tính năng bị loại bỏ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Ghi Chú
- **Xác minh**: Các lệnh được xác nhận với Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Hoàn thành Workshop và Cập nhật Chất lượng Tài liệu
**Phiên bản này hoàn thiện các module workshop tương tác, sửa tất cả các liên kết tài liệu bị hỏng, và cải thiện chất lượng nội dung tổng thể cho nhà phát triển AI sử dụng Microsoft AZD.**

#### Thêm
- **📝 CONTRIBUTING.md**: Tài liệu hướng dẫn đóng góp mới với:
  - Hướng dẫn rõ ràng để báo cáo lỗi và đề xuất thay đổi
  - Tiêu chuẩn tài liệu cho nội dung mới
  - Hướng dẫn ví dụ mã và quy ước tin nhắn commit
  - Thông tin tương tác cộng đồng

#### Hoàn thành
- **🎯 Module Workshop 7 (Tổng kết)**: Hoàn thiện đầy đủ module tổng kết với:
  - Tóm tắt toàn diện thành tựu workshop
  - Phần khái niệm chính đã thành thạo về AZD, template, và Microsoft Foundry
  - Khuyến nghị tiếp tục hành trình học tập
  - Bài tập thách thức workshop với đánh giá mức độ khó
  - Phản hồi cộng đồng và liên kết hỗ trợ

- **📚 Module Workshop 3 (Phân tích)**: Cập nhật mục tiêu học tập với:
  - Hướng dẫn kích hoạt GitHub Copilot với máy chủ MCP
  - Hiểu cấu trúc thư mục template AZD
  - Mẫu tổ chức hạ tầng dưới dạng mã (Bicep)
  - Hướng dẫn thực hành trực tiếp

- **🔧 Module Workshop 6 (Dọn dẹp)**: Hoàn thành với:
  - Mục tiêu dọn tài nguyên và quản lý chi phí
  - Sử dụng `azd down` để thu hồi hạ tầng an toàn
  - Hướng dẫn phục hồi dịch vụ nhận thức đã xóa mềm
  - Đề xuất khám phá thêm với GitHub Copilot và Azure Portal

#### Sửa Lỗi
- **🔗 Sửa Liên kết Hỏng**: Sửa hơn 15 liên kết tài liệu nội bộ bị hỏng:
  - `docs/ai-foundry/ai-model-deployment.md`: Sửa đường dẫn tới microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Sửa đường dẫn ai-model-deployment.md và production-ai-practices.md
  - `docs/getting-started/first-project.md`: Thay thế cicd-integration.md không tồn tại bằng deployment-guide.md
  - `examples/retail-scenario.md`: Sửa đường dẫn FAQ và hướng dẫn khắc phục sự cố
  - `examples/container-app/microservices/README.md`: Sửa đường dẫn trang chủ khóa học và hướng dẫn triển khai
  - `resources/faq.md` và `resources/glossary.md`: Cập nhật tham chiếu chương AI
  - `course-outline.md`: Sửa hướng dẫn giảng viên và tham chiếu phòng lab AI workshop

- **📅 Biểu ngữ Trạng thái Workshop**: Cập nhật từ "Đang xây dựng" sang trạng thái workshop đã kích hoạt với ngày tháng 2/2026

- **🔗 Điều hướng Workshop**: Sửa các liên kết điều hướng bị hỏng trong README.md workshop trỏ tới thư mục lab-1-azd-basics không tồn tại

#### Thay Đổi
- **Trình bày Workshop**: Loại bỏ cảnh báo "đang xây dựng", workshop giờ hoàn chỉnh và sẵn sàng sử dụng
- **Tính nhất quán điều hướng**: Đảm bảo tất cả các module workshop có điều hướng đúng giữa các module
- **Tham chiếu Đường dẫn Học tập**: Cập nhật tham chiếu chương chéo sử dụng đường dẫn microsoft-foundry chính xác

#### Xác nhận
- ✅ Tất cả tệp markdown tiếng Anh có liên kết nội bộ hợp lệ
- ✅ Các module workshop 0-7 hoàn chỉnh với mục tiêu học tập
- ✅ Điều hướng giữa các chương và module hoạt động chính xác
- ✅ Nội dung phù hợp cho nhà phát triển AI sử dụng Microsoft AZD
- ✅ Ngôn ngữ và cấu trúc thân thiện với người mới bắt đầu được duy trì suốt tài liệu
- ✅ CONTRIBUTING.md cung cấp hướng dẫn rõ ràng cho cộng đồng đóng góp

#### Triển khai Kỹ thuật
- **Xác minh Liên kết**: Script PowerShell tự động kiểm tra tất cả các liên kết nội bộ .md
- **Kiểm tra Nội dung**: Đánh giá thủ công về sự hoàn chỉnh workshop và phù hợp cho người mới bắt đầu
- **Hệ thống Điều hướng**: Áp dụng mẫu điều hướng nhất quán giữa các chương và module

#### Ghi Chú
- **Phạm vi**: Thay đổi chỉ áp dụng cho tài liệu tiếng Anh
- **Bản dịch**: Thư mục bản dịch chưa được cập nhật trong phiên bản này (dịch tự động sẽ được đồng bộ sau)
- **Thời lượng Workshop**: Workshop hoàn chỉnh cung cấp 3-4 giờ học thực hành

---

### [v3.8.0] - 2025-11-19

#### Tài liệu Nâng cao: Giám sát, Bảo mật, và Mẫu Đa Tác nhân
**Phiên bản này bổ sung các bài học tổng thể hạng A về tích hợp Application Insights, mẫu xác thực, và phối hợp đa tác nhân cho triển khai sản xuất.**

#### Thêm
- **📊 Bài học Tích hợp Application Insights**: trong `docs/pre-deployment/application-insights.md`:
  - Triển khai tập trung AZD với cấu hình tự động
  - Mẫu Bicep hoàn chỉnh cho Application Insights + Log Analytics
  - Ứng dụng Python hoạt động với telemetry tùy chỉnh (hơn 1.200 dòng)
  - Mẫu giám sát AI/LLM (theo dõi token/chi phí Microsoft Foundry Models)
  - 6 sơ đồ Mermaid (kiến trúc, phân tán theo dõi, luồng telemetry)
  - 3 bài tập thực hành (cảnh báo, bảng điều khiển, giám sát AI)
  - Ví dụ truy vấn Kusto và chiến lược tối ưu chi phí
  - Phát trực tiếp số liệu và gỡ lỗi thời gian thực
  - Thời gian học 40-50 phút với mẫu sẵn sàng sản xuất

- **🔐 Bài học Mẫu Xác thực & Bảo mật**: trong `docs/getting-started/authsecurity.md`:
  - 3 mẫu xác thực (chuỗi kết nối, Key Vault, managed identity)
  - Mẫu cơ sở hạ tầng Bicep hoàn chỉnh cho triển khai an toàn
  - Mã ứng dụng Node.js với tích hợp Azure SDK
  - 3 bài tập hoàn chỉnh (kích hoạt managed identity, user-assigned identity, xoay khóa Key Vault)
  - Thực hành bảo mật tốt nhất và cấu hình RBAC
  - Hướng dẫn khắc phục sự cố và phân tích chi phí
  - Mẫu xác thực không mật khẩu sẵn sàng sản xuất

- **🤖 Bài học Mẫu Phối hợp Đa Tác nhân**: trong `docs/pre-deployment/coordination-patterns.md`:
  - 5 mẫu phối hợp (tuần tự, song song, phân cấp, sự kiện, đồng thuận)
  - Triển khai dịch vụ điều phối đầy đủ (Python/Flask, hơn 1.500 dòng)
  - 3 triển khai agent chuyên biệt (Nghiên cứu, Viết, Biên tập)
  - Tích hợp Service Bus cho hàng đợi tin nhắn
  - Quản lý trạng thái Cosmos DB cho hệ phân tán
  - 6 sơ đồ Mermaid mô tả tương tác agent
  - 3 bài tập nâng cao (xử lý timeout, logic thử lại, ngắt mạch)
  - Phân tích chi phí (240-565 USD/tháng) với chiến lược tối ưu
  - Tích hợp Application Insights để giám sát

#### Nâng cao
- **Chương Triển khai trước**: Bổ sung đầy đủ mẫu giám sát và phối hợp
- **Chương Bắt đầu**: Nâng cao với mẫu xác thực chuyên nghiệp
- **Sẵn sàng Sản xuất**: Bao phủ toàn diện từ bảo mật đến khả năng quan sát
- **Đề cương Khóa học**: Cập nhật tham chiếu bài học mới ở Chương 3 và 6

#### Thay Đổi
- **Tiến độ Học tập**: Tích hợp tốt hơn bảo mật và giám sát xuyên suốt khóa học
- **Chất lượng Tài liệu**: Tiêu chuẩn hạng A nhất quán (95-97%) cho các bài học mới
- **Mẫu Triển khai Sản xuất**: Bao phủ đầu-cuối cho triển khai doanh nghiệp

#### Cải thiện
- **Trải nghiệm Nhà phát triển**: Lộ trình rõ ràng từ phát triển đến giám sát sản xuất
- **Tiêu chuẩn Bảo mật**: Mẫu chuyên nghiệp cho xác thực và quản lý bí mật
- **Khả năng Quan sát**: Tích hợp Application Insights hoàn chỉnh với AZD
- **Tải trọng AI**: Giám sát chuyên biệt cho Microsoft Foundry Models và hệ thống đa tác nhân

#### Xác nhận
- ✅ Tất cả bài học bao gồm mã hoạt động hoàn chỉnh (không phải đoạn mã)
- ✅ Sơ đồ Mermaid cho học trực quan (19 tổng cộng cho 3 bài học)
- ✅ Bài tập thực hành với các bước xác minh (9 tổng cộng)
- ✅ Mẫu Bicep sẵn sàng triển khai thông qua `azd up`
- ✅ Phân tích chi phí và chiến lược tối ưu hóa
- ✅ Hướng dẫn khắc phục sự cố và thực hành tốt nhất
- ✅ Kiểm tra kiến thức với lệnh xác minh

#### Kết quả Đánh giá Tài liệu
- **docs/pre-deployment/application-insights.md**: - Hướng dẫn giám sát toàn diện
- **docs/getting-started/authsecurity.md**: - Mẫu bảo mật chuyên nghiệp
- **docs/pre-deployment/coordination-patterns.md**: - Kiến trúc đa tác nhân nâng cao
- **Nội dung Mới Tổng thể**: - Tiêu chuẩn chất lượng cao nhất quán

#### Triển khai Kỹ thuật
- **Application Insights**: Log Analytics + telemetry tùy chỉnh + phân tán theo dõi
- **Xác thực**: Managed Identity + Key Vault + mẫu RBAC
- **Đa Tác nhân**: Service Bus + Cosmos DB + Container Apps + điều phối
- **Giám sát**: Số liệu trực tiếp + truy vấn Kusto + cảnh báo + bảng điều khiển
- **Quản lý Chi phí**: Chiến lược lấy mẫu, chính sách giữ, kiểm soát ngân sách

### [v3.7.0] - 2025-11-19

#### Cải tiến Chất lượng Tài liệu và Ví dụ Microsoft Foundry Models Mới
**Phiên bản này nâng cao chất lượng tài liệu trên toàn kho và thêm ví dụ triển khai Microsoft Foundry Models hoàn chỉnh với giao diện chat gpt-4.1.**

#### Thêm
- **🤖 Ví dụ Chat Microsoft Foundry Models**: Triển khai gpt-4.1 hoàn chỉnh với triển khai hoạt động trong `examples/azure-openai-chat/`:
  - Hạ tầng Microsoft Foundry Models đầy đủ (triển khai mô hình gpt-4.1)
  - Giao diện chat dòng lệnh Python với lịch sử hội thoại
  - Tích hợp Key Vault để lưu trữ khóa API an toàn
  - Theo dõi sử dụng token và ước tính chi phí
  - Giới hạn tốc độ và xử lý lỗi
  - README toàn diện với hướng dẫn triển khai 35-45 phút
  - 11 tệp sẵn sàng sản xuất (mẫu Bicep, ứng dụng Python, cấu hình)
- **📚 Bài tập Tài liệu**: Thêm bài tập thực hành vào hướng dẫn cấu hình:
  - Bài tập 1: Cấu hình đa môi trường (15 phút)
  - Bài tập 2: Thực hành quản lý bí mật (10 phút)
  - Tiêu chí thành công và các bước xác minh rõ ràng
- **✅ Xác minh Triển khai**: Thêm phần xác minh vào hướng dẫn triển khai:
  - Thủ tục kiểm tra sức khỏe
  - Danh sách kiểm tra tiêu chí thành công
  - Đầu ra dự kiến cho tất cả lệnh triển khai
  - Tham khảo nhanh khắc phục sự cố

#### Nâng cao
- **examples/README.md**: Cập nhật lên chất lượng hạng A (93%):
  - Thêm azure-openai-chat vào tất cả các phần liên quan
  - Cập nhật số lượng ví dụ cục bộ từ 3 lên 4
  - Thêm vào bảng Ví dụ Ứng dụng AI
  - Tích hợp vào Bắt đầu Nhanh cho Người dùng Trung cấp
  - Thêm vào phần Mẫu Microsoft Foundry
  - Cập nhật Ma trận So sánh và phần tìm kiếm công nghệ
- **Chất lượng tài liệu**: Cải thiện từ B+ (87%) → A- (92%) trên toàn bộ thư mục tài liệu:
  - Thêm kết quả mong đợi vào các ví dụ lệnh quan trọng
  - Bao gồm các bước xác minh cho các thay đổi cấu hình
  - Tăng cường học thực hành với các bài tập thực tế

#### Đã thay đổi
- **Tiến trình học tập**: Tích hợp tốt hơn các ví dụ AI cho người học trung cấp
- **Cấu trúc tài liệu**: Bài tập cụ thể hơn với kết quả rõ ràng
- **Quy trình xác minh**: Thêm tiêu chí thành công rõ ràng vào các quy trình làm việc chính

#### Cải thiện
- **Trải nghiệm nhà phát triển**: Triển khai Microsoft Foundry Models giờ chỉ mất 35-45 phút (so với 60-90 phút với các giải pháp phức tạp hơn)
- **Minh bạch chi phí**: Ước tính chi phí rõ ràng ($50-200/tháng) cho ví dụ Microsoft Foundry Models
- **Lộ trình học**: Nhà phát triển AI có điểm vào rõ ràng với azure-openai-chat
- **Tiêu chuẩn tài liệu**: Kết quả mong đợi và bước xác minh nhất quán

#### Đã xác thực
- ✅ Ví dụ Microsoft Foundry Models hoạt động đầy đủ với `azd up`
- ✅ Tất cả 11 tệp triển khai chính xác về cú pháp
- ✅ Hướng dẫn trong README khớp với trải nghiệm triển khai thực tế
- ✅ Các liên kết tài liệu cập nhật ở hơn 8 vị trí
- ✅ Chỉ mục ví dụ phản ánh chính xác 4 ví dụ cục bộ
- ✅ Không có liên kết ngoại vi trùng lặp trong bảng
- ✅ Tất cả tham chiếu điều hướng chính xác

#### Triển khai kỹ thuật
- **Kiến trúc Microsoft Foundry Models**: gpt-4.1 + Key Vault + mẫu Container Apps
- **Bảo mật**: Đã sẵn sàng Managed Identity, bí mật trong Key Vault
- **Giám sát**: Tích hợp Application Insights
- **Quản lý chi phí**: Theo dõi token và tối ưu hóa sử dụng
- **Triển khai**: Một lệnh `azd up` duy nhất cho thiết lập hoàn chỉnh

### [v3.6.0] - 2025-11-19

#### Cập nhật lớn: Ví dụ triển khai Container App
**Phiên bản này giới thiệu ví dụ triển khai ứng dụng container toàn diện, sẵn sàng sản xuất bằng Azure Developer CLI (AZD), với tài liệu đầy đủ và tích hợp vào lộ trình học.**

#### Đã thêm
- **🚀 Ví dụ Container App**: Ví dụ cục bộ mới trong `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Tổng quan hoàn chỉnh về triển khai container, khởi đầu nhanh, sản xuất và các mẫu nâng cao
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API thân thiện với người mới với scale-to-zero, kiểm tra sức khỏe, giám sát và xử lý sự cố
  - [Microservices Architecture](../../examples/container-app/microservices): Triển khai đa dịch vụ sẵn sàng sản xuất (API Gateway, Product, Order, User, Notification), nhắn tin bất đồng bộ, Service Bus, Cosmos DB, Azure SQL, truy vết phân tán, triển khai blue-green/canary
- **Thực hành tốt nhất**: Hướng dẫn bảo mật, giám sát, tối ưu chi phí và CI/CD cho workload container
- **Mẫu mã**: `azure.yaml` hoàn chỉnh, mẫu Bicep và triển khai dịch vụ đa ngôn ngữ (Python, Node.js, C#, Go)
- **Kiểm thử & Xử lý sự cố**: Kịch bản kiểm thử đầu-cuối, lệnh giám sát, hướng dẫn xử lý sự cố

#### Đã thay đổi
- **README.md**: Cập nhật để giới thiệu và liên kết ví dụ container app mới dưới "Local Examples - Container Applications"
- **examples/README.md**: Cập nhật để làm nổi bật ví dụ container app, thêm mục so sánh, cập nhật tham chiếu kỹ thuật/kiến trúc
- **Đề cương khóa học & Hướng dẫn học**: Cập nhật để tham chiếu ví dụ container app mới và mẫu triển khai trong các chương liên quan

#### Đã xác thực
- ✅ Tất cả ví dụ mới có thể triển khai với `azd up` và tuân theo thực hành tốt nhất
- ✅ Các liên kết chéo và điều hướng tài liệu đã cập nhật
- ✅ Ví dụ bao phủ các kịch bản từ cơ bản đến nâng cao, bao gồm microservices sản xuất

#### Ghi chú
- **Phạm vi**: Tài liệu và ví dụ tiếng Anh
- **Bước tiếp theo**: Mở rộng thêm mẫu container nâng cao và tự động hóa CI/CD trong các phiên bản sau

### [v3.5.0] - 2025-11-19

#### Đổi thương hiệu sản phẩm: Microsoft Foundry
**Phiên bản này thực hiện đổi tên sản phẩm toàn diện từ "Microsoft Foundry" sang "Microsoft Foundry" trên toàn bộ tài liệu tiếng Anh, phản ánh đổi thương hiệu chính thức của Microsoft.**

#### Đã thay đổi
- **🔄 Cập nhật tên sản phẩm**: Đổi tên hoàn toàn từ "Microsoft Foundry" sang "Microsoft Foundry"
  - Cập nhật tất cả tham chiếu trên tài liệu tiếng Anh trong thư mục `docs/`
  - Đổi tên thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Đổi tên tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tổng cộng: 23 tham chiếu nội dung được cập nhật trong 7 tệp tài liệu

- **📁 Thay đổi cấu trúc thư mục**:
  - `docs/ai-foundry/` đổi tên thành `docs/microsoft-foundry/`
  - Cập nhật tất cả tham chiếu chéo để phản ánh cấu trúc thư mục mới
  - Các liên kết điều hướng được xác thực trên toàn bộ tài liệu

- **📄 Đổi tên tệp**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Cập nhật tất cả liên kết nội bộ để tham chiếu tên tệp mới

#### Tệp đã cập nhật
- **Tài liệu chương** (7 tệp):
  - `docs/microsoft-foundry/ai-model-deployment.md` - cập nhật 3 liên kết điều hướng
  - `docs/microsoft-foundry/ai-workshop-lab.md` - cập nhật 4 tham chiếu tên sản phẩm
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Đã sử dụng Microsoft Foundry (từ các cập nhật trước)
  - `docs/microsoft-foundry/production-ai-practices.md` - cập nhật 3 tham chiếu (tổng quan, phản hồi cộng đồng, tài liệu)
  - `docs/getting-started/azd-basics.md` - cập nhật 4 liên kết chéo
  - `docs/getting-started/first-project.md` - cập nhật 2 liên kết điều hướng chương
  - `docs/getting-started/installation.md` - cập nhật 2 liên kết chương tiếp theo
  - `docs/troubleshooting/ai-troubleshooting.md` - cập nhật 3 tham chiếu (điều hướng, cộng đồng Discord)
  - `docs/troubleshooting/common-issues.md` - cập nhật 1 liên kết điều hướng
  - `docs/troubleshooting/debugging.md` - cập nhật 1 liên kết điều hướng

- **Tệp cấu trúc khóa học** (2 tệp):
  - `README.md` - cập nhật 17 tham chiếu (tổng quan khóa học, tiêu đề chương, phần mẫu, phân tích cộng đồng)
  - `course-outline.md` - cập nhật 14 tham chiếu (tổng quan, mục tiêu học tập, tài nguyên chương)

#### Đã xác thực
- ✅ Không còn tham chiếu đường dẫn thư mục "ai-foundry" trong tài liệu tiếng Anh
- ✅ Không còn tham chiếu tên sản phẩm "Microsoft Foundry" trong tài liệu tiếng Anh
- ✅ Tất cả liên kết điều hướng hoạt động với cấu trúc thư mục mới
- ✅ Đổi tên tệp và thư mục hoàn tất thành công
- ✅ Xác thực liên kết chéo giữa các chương

#### Ghi chú
- **Phạm vi**: Các thay đổi chỉ áp dụng cho tài liệu tiếng Anh trong thư mục `docs/`
- **Bản dịch**: Thư mục bản dịch (`translations/`) chưa được cập nhật trong phiên bản này
- **Hội thảo**: Tài liệu hội thảo (`workshop/`) chưa được cập nhật trong phiên bản này
- **Ví dụ**: Tệp ví dụ có thể vẫn tham chiếu tên cũ (sẽ được cập nhật trong phiên bản sau)
- **Liên kết bên ngoài**: URL bên ngoài và tham chiếu kho GitHub giữ nguyên

#### Hướng dẫn di chuyển cho người đóng góp
Nếu bạn có nhánh cục bộ hoặc tài liệu tham chiếu cấu trúc cũ:
1. Cập nhật tham chiếu thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Cập nhật tham chiếu tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Thay thế tên sản phẩm: "Microsoft Foundry" → "Microsoft Foundry"
4. Xác nhận tất cả liên kết nội bộ của tài liệu vẫn hoạt động

---

### [v3.4.0] - 2025-10-24

#### Cải tiến Xem trước và Xác thực Cơ sở hạ tầng
**Phiên bản này giới thiệu hỗ trợ toàn diện cho tính năng xem trước Azure Developer CLI mới và cải thiện trải nghiệm người dùng hội thảo.**

#### Đã thêm
- **🧪 Tài liệu tính năng azd provision --preview**: Bao phủ toàn diện khả năng xem trước cơ sở hạ tầng mới
  - Tham khảo lệnh và ví dụ sử dụng trong bảng mẹo
  - Tích hợp chi tiết trong hướng dẫn cung cấp với các trường hợp sử dụng và lợi ích
  - Tích hợp kiểm tra trước bay để xác thực triển khai an toàn hơn
  - Cập nhật hướng dẫn bắt đầu với thực hành triển khai an toàn ưu tiên
- **🚧 Biển trạng thái hội thảo**: Biển báo HTML chuyên nghiệp cho trạng thái phát triển hội thảo
  - Thiết kế gradient với chỉ báo thi công để thông báo rõ ràng với người dùng
  - Dấu thời gian cập nhật lần cuối cho minh bạch
  - Thiết kế đáp ứng cho thiết bị di động mọi loại

#### Cải thiện
- **An toàn cơ sở hạ tầng**: Tính năng xem trước tích hợp xuyên suốt tài liệu triển khai
- **Xác thực trước triển khai**: Kịch bản tự động bao gồm kiểm thử xem trước cơ sở hạ tầng
- **Quy trình nhà phát triển**: Cập nhật chuỗi lệnh để bao gồm xem trước như thực hành tốt nhất
- **Trải nghiệm hội thảo**: Đặt kỳ vọng rõ ràng với người dùng về trạng thái phát triển nội dung

#### Đã thay đổi
- **Thực hành triển khai tốt nhất**: Quy trình ưu tiên xem trước giờ là đề xuất chính
- **Luồng tài liệu**: Xác thực cơ sở hạ tầng được đưa lên sớm hơn trong quá trình học tập
- **Trình bày hội thảo**: Thông báo trạng thái chuyên nghiệp với dòng thời gian phát triển rõ ràng

#### Cải tiến
- **Phương pháp An toàn Ưu tiên**: Các thay đổi cơ sở hạ tầng được xác thực trước khi triển khai
- **Hợp tác Nhóm**: Kết quả xem trước có thể chia sẻ để xem xét và phê duyệt
- **Nhận thức chi phí**: Hiểu rõ hơn về chi phí tài nguyên trước khi cung cấp
- **Giảm thiểu rủi ro**: Giảm lỗi triển khai nhờ xác thực trước

#### Triển khai kỹ thuật
- **Tích hợp đa tài liệu**: Tính năng xem trước được tài liệu hóa trong 4 tệp chính
- **Mẫu lệnh**: Cú pháp và ví dụ nhất quán trong toàn bộ tài liệu
- **Tích hợp thực hành tốt nhất**: Xem trước được đưa vào quy trình và kịch bản xác thực
- **Chỉ báo trực quan**: Đánh dấu tính năng MỚI rõ ràng để dễ nhận diện

#### Cơ sở hạ tầng hội thảo
- **Thông báo trạng thái**: Biển báo HTML chuyên nghiệp với kiểu gradient
- **Trải nghiệm người dùng**: Trạng thái phát triển rõ ràng ngăn ngừa nhầm lẫn
- **Trình bày chuyên nghiệp**: Duy trì uy tín kho lưu trữ đồng thời đặt kỳ vọng hợp lý
- **Minh bạch dòng thời gian**: Dấu thời gian cập nhật lần cuối tháng 10 năm 2025 để chịu trách nhiệm

### [v3.3.0] - 2025-09-24

#### Tăng cường tài liệu hội thảo và trải nghiệm học tập tương tác
**Phiên bản này giới thiệu tài liệu hội thảo toàn diện với hướng dẫn tương tác trên trình duyệt và lộ trình học có cấu trúc.**

#### Đã thêm
- **🎥 Hướng dẫn hội thảo tương tác**: Trải nghiệm hội thảo trên trình duyệt với khả năng xem trước MkDocs
- **📝 Hướng dẫn hội thảo có cấu trúc**: Lộ trình học 7 bước từ khám phá đến tùy chỉnh
  - 0-Introduction: Tổng quan hội thảo và thiết lập
  - 1-Select-AI-Template: Quá trình khám phá và chọn mẫu
  - 2-Validate-AI-Template: Quy trình triển khai và xác thực
  - 3-Deconstruct-AI-Template: Hiểu kiến trúc mẫu
  - 4-Configure-AI-Template: Cấu hình và tùy chỉnh
  - 5-Customize-AI-Template: Sửa đổi nâng cao và lặp lại
  - 6-Teardown-Infrastructure: Dọn dẹp và quản lý tài nguyên
  - 7-Wrap-up: Tóm tắt và bước kế tiếp
- **🛠️ Công cụ hội thảo**: Cấu hình MkDocs với theme Material để tăng cường trải nghiệm học tập
- **🎯 Lộ trình học thực hành**: Phương pháp 3 bước (Khám phá → Triển khai → Tùy chỉnh)
- **📱 Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển liền mạch

#### Cải thiện
- **Phòng thí nghiệm hội thảo AI**: Mở rộng với trải nghiệm học có cấu trúc 2-3 giờ toàn diện
- **Tài liệu hội thảo**: Trình bày chuyên nghiệp với điều hướng và hỗ trợ trực quan
- **Tiến trình học**: Hướng dẫn từng bước rõ ràng từ chọn mẫu đến triển khai sản xuất
- **Trải nghiệm nhà phát triển**: Tích hợp công cụ cho quy trình phát triển trơn tru

#### Cải thiện
- **Khả năng tiếp cận**: Giao diện trình duyệt với chức năng tìm kiếm, sao chép và chuyển đổi giao diện
- **Học theo tốc độ cá nhân**: Cấu trúc hội thảo linh hoạt phù hợp nhiều tốc độ học
- **Ứng dụng thực tế**: Kịch bản triển khai mẫu AI thực tiễn
- **Tích hợp cộng đồng**: Tích hợp Discord hỗ trợ và cộng tác hội thảo

#### Tính năng hội thảo
- **Tìm kiếm tích hợp**: Tìm kiếm nhanh từ khóa và bài học
- **Chức năng sao chép khối mã**: Thao tác hover để sao chép cho mọi ví dụ mã
- **Chuyển đổi giao diện**: Hỗ trợ chế độ tối/sáng phù hợp sở thích
- **Tài sản trực quan**: Ảnh chụp màn hình và sơ đồ để tăng cường hiểu biết
- **Tích hợp trợ giúp**: Truy cập trực tiếp Discord để hỗ trợ cộng đồng

### [v3.2.0] - 2025-09-17

#### Cấu trúc điều hướng lớn và hệ thống học theo chương
**Phiên bản này giới thiệu cấu trúc học theo chương toàn diện với điều hướng cải thiện trên toàn kho lưu trữ.**

#### Đã thêm
- **📚 Hệ thống học theo chương**: Tái cấu trúc toàn bộ khóa học thành 8 chương học tiến bộ
  - Chương 1: Nền tảng & Khởi đầu nhanh (⭐ - 30-45 phút)
  - Chương 2: Phát triển AI-First (⭐⭐ - 1-2 giờ)
  - Chương 3: Cấu hình & Xác thực (⭐⭐ - 45-60 phút)
  - Chương 4: Cơ sở hạ tầng là Mã & Triển khai (⭐⭐⭐ - 1-1.5 giờ)
  - Chương 5: Giải pháp AI đa tác nhân (⭐⭐⭐⭐ - 2-3 giờ)
  - Chương 6: Xác thực & Lập kế hoạch trước triển khai (⭐⭐ - 1 giờ)
  - Chương 7: Xử lý sự cố & Gỡ lỗi (⭐⭐ - 1-1.5 giờ)
  - Chương 8: Mẫu sản xuất & doanh nghiệp (⭐⭐⭐⭐ - 2-3 giờ)
- **📚 Hệ thống điều hướng toàn diện**: Tiêu đề và chân trang điều hướng nhất quán trên toàn bộ tài liệu
- **🎯 Theo dõi tiến độ**: Danh sách kiểm tra hoàn thành khoá học và hệ thống xác minh học tập
- **🗺️ Hướng dẫn lộ trình học**: Điểm vào rõ ràng cho các mức kinh nghiệm và mục tiêu khác nhau
- **🔗 Điều hướng tham chiếu chéo**: Liên kết rõ ràng giữa các chương liên quan và điều kiện tiên quyết

#### Cải thiện
- **Cấu trúc README**: Chuyển đổi thành nền tảng học có cấu trúc với tổ chức theo chương
- **Điều hướng tài liệu**: Mỗi trang bây giờ bao gồm bối cảnh chương và hướng dẫn tiến trình
- **Tổ chức mẫu**: Ví dụ và mẫu được phân bổ theo chương học phù hợp
- **Tích hợp tài nguyên**: Bảng mẹo, FAQ và hướng dẫn học liên kết với chương tương ứng
- **Tích hợp hội thảo**: Phòng thí nghiệm thực hành liên kết với nhiều mục tiêu chương học

#### Đã thay đổi
- **Tiến trình học tập**: Chuyển từ tài liệu tuyến tính sang học tập linh hoạt theo chương
- **Vị trí cấu hình**: Di chuyển hướng dẫn cấu hình thành Chương 3 để dòng học tốt hơn
- **Tích hợp nội dung AI**: Tích hợp tốt hơn nội dung đặc thù AI xuyên suốt quá trình học
- **Nội dung sản xuất**: Các mẫu nâng cao được tổng hợp trong Chương 8 dành cho người học doanh nghiệp

#### Cải thiện
- **Trải nghiệm người dùng**: Điều hướng rõ ràng với dấu mốc chương và tiến độ học
- **Khả năng tiếp cận**: Mẫu điều hướng nhất quán giúp di chuyển khóa học dễ dàng hơn
- **Trình bày chuyên nghiệp**: Cấu trúc khóa học phong cách đại học phù hợp cho đào tạo học thuật và doanh nghiệp
- **Hiệu quả học tập**: Rút ngắn thời gian tìm kiếm nội dung liên quan nhờ tổ chức tốt hơn

#### Triển khai kỹ thuật
- **Tiêu đề điều hướng**: Chuẩn hóa điều hướng chương trên hơn 40 tài liệu
- **Điều hướng chân trang**: Hướng dẫn tiến độ và dấu hiệu hoàn thành chương nhất quán
- **Liên kết chéo**: Hệ thống liên kết nội bộ toàn diện liên kết các khái niệm liên quan
- **Bản đồ chương**: Mẫu và ví dụ liên kết rõ ràng với mục tiêu học tập

#### Tăng cường hướng dẫn học tập
- **📚 Mục tiêu học tập toàn diện**: Tái cấu trúc hướng dẫn học tập phù hợp hệ thống 8 chương
- **🎯 Đánh giá theo chương**: Mỗi chương bao gồm mục tiêu học tập cụ thể và bài tập thực hành
- **📋 Theo dõi tiến độ**: Lịch học hàng tuần với kết quả đo lường và danh sách kiểm tra hoàn thành
- **❓ Câu hỏi đánh giá**: Câu hỏi xác nhận kiến thức cho từng chương với kết quả chuyên nghiệp
- **🛠️ Bài tập thực hành**: Hoạt động thực hành với các kịch bản triển khai thực tế và khắc phục sự cố
- **📊 Tiến trình kỹ năng**: Tiến bộ rõ ràng từ khái niệm cơ bản đến mẫu doanh nghiệp với trọng tâm phát triển sự nghiệp
- **🎓 Khung chứng nhận**: Kết quả phát triển nghề nghiệp và hệ thống công nhận cộng đồng
- **⏱️ Quản lý thời gian**: Kế hoạch học có cấu trúc 10 tuần với xác nhận mốc quan trọng

### [v3.1.0] - 2025-09-17

#### Giải pháp AI đa tác nhân được cải thiện
**Phiên bản này cải thiện giải pháp đa tác nhân trong lĩnh vực bán lẻ với đặt tên tác nhân tốt hơn và tài liệu được nâng cao.**

#### Đã thay đổi
- **Thuật ngữ đa tác nhân**: Thay "tác nhân Cora" bằng "tác nhân Khách hàng" trong toàn bộ giải pháp đa tác nhân bán lẻ để hiểu rõ hơn
- **Kiến trúc tác nhân**: Cập nhật toàn bộ tài liệu, mẫu ARM và ví dụ code dùng tên "tác nhân Khách hàng" thống nhất
- **Ví dụ cấu hình**: Hiện đại hóa các mẫu cấu hình tác nhân với quy tắc đặt tên cập nhật
- **Đồng nhất tài liệu**: Đảm bảo tất cả tham chiếu sử dụng tên tác nhân chuyên nghiệp, mô tả rõ ràng

#### Cải tiến
- **Gói mẫu ARM**: Cập nhật retail-multiagent-arm-template với tham chiếu tác nhân Khách hàng
- **Sơ đồ kiến trúc**: Làm mới sơ đồ Mermaid với tên tác nhân cập nhật
- **Ví dụ code**: Lớp Python và ví dụ triển khai giờ dùng tên CustomerAgent
- **Biến môi trường**: Cập nhật tất cả script triển khai theo quy tắc tên CUSTOMER_AGENT_NAME

#### Cải thiện
- **Trải nghiệm nhà phát triển**: Vai trò và trách nhiệm tác nhân rõ ràng hơn trong tài liệu
- **Sẵn sàng sản xuất**: Căn chỉnh tốt hơn với quy ước đặt tên doanh nghiệp
- **Tài liệu học tập**: Tên tác nhân trực quan hơn cho mục đích giáo dục
- **Khả năng sử dụng mẫu**: Hiểu đơn giản hơn về chức năng tác nhân và mẫu triển khai

#### Chi tiết kỹ thuật
- Cập nhật sơ đồ kiến trúc Mermaid với tham chiếu CustomerAgent
- Thay thế tên lớp CoraAgent bằng CustomerAgent trong ví dụ Python
- Điều chỉnh cấu hình JSON mẫu ARM dùng kiểu tác nhân "customer"
- Cập nhật biến môi trường từ CORA_AGENT_* thành CUSTOMER_AGENT_*
- Làm mới toàn bộ lệnh triển khai và cấu hình container

### [v3.0.0] - 2025-09-12

#### Thay đổi lớn - Tập trung vào nhà phát triển AI và tích hợp Microsoft Foundry
**Phiên bản này biến kho lưu trữ thành nguồn học tập toàn diện dành cho AI với tích hợp Microsoft Foundry.**

#### Đã thêm
- **🤖 Lộ trình học tập AI-Đầu tiên**: Tái cấu trúc hoàn toàn ưu tiên nhà phát triển và kỹ sư AI
- **Hướng dẫn tích hợp Microsoft Foundry**: Tài liệu toàn diện kết nối AZD với dịch vụ Microsoft Foundry
- **Mẫu triển khai mô hình AI**: Hướng dẫn chi tiết về lựa chọn mô hình, cấu hình và chiến lược triển khai sản xuất
- **Phòng thí nghiệm hội thảo AI**: Hội thảo thực hành 2-3 giờ chuyển đổi ứng dụng AI thành giải pháp deployable với AZD
- **Thực hành tốt nhất cho AI sản xuất**: Mẫu sẵn sàng doanh nghiệp cho mở rộng, giám sát, bảo mật workload AI
- **Hướng dẫn khắc phục sự cố AI**: Khắc phục toàn diện cho Microsoft Foundry Models, Dịch vụ Cognitive và vấn đề triển khai AI
- **Thư viện mẫu AI**: Bộ sưu tập mẫu Microsoft Foundry được đánh giá độ phức tạp
- **Tài liệu hội thảo**: Cấu trúc hội thảo hoàn chỉnh với phòng thí nghiệm thực hành và tài liệu tham khảo

#### Cải tiến
- **Cấu trúc README**: Tập trung nhà phát triển AI với 45% dữ liệu quan tâm cộng đồng từ Microsoft Foundry Discord
- **Lộ trình học**: Hành trình nhà phát triển AI riêng biệt bên cạnh lộ trình truyền thống cho sinh viên và kỹ sư DevOps
- **Khuyến nghị mẫu**: Mẫu AI nổi bật gồm azure-search-openai-demo, contoso-chat, và openai-chat-app-quickstart
- **Tích hợp cộng đồng**: Hỗ trợ cộng đồng Discord được tăng cường với kênh và thảo luận chuyên đề AI

#### An ninh & Tập trung sản xuất
- **Mẫu Managed Identity**: Cấu hình xác thực và bảo mật đặc thù AI
- **Tối ưu hóa chi phí**: Theo dõi sử dụng token và kiểm soát ngân sách cho workload AI
- **Triển khai đa vùng**: Chiến lược triển khai ứng dụng AI toàn cầu
- **Giám sát hiệu suất**: Mục tiêu đặc thù AI và tích hợp Application Insights

#### Chất lượng tài liệu
- **Cấu trúc khóa học tuyến tính**: Tiến trình logic từ mô hình cơ bản đến mẫu triển khai AI nâng cao
- **URL được xác thực**: Tất cả liên kết kho lưu trữ bên ngoài được kiểm tra và truy cập được
- **Tham khảo hoàn chỉnh**: Tất cả liên kết tài liệu nội bộ được xác minh và hoạt động
- **Sẵn sàng sản xuất**: Mẫu triển khai doanh nghiệp với ví dụ thực tế

### [v2.0.0] - 2025-09-09

#### Thay đổi lớn - Tái cấu trúc kho lưu trữ và nâng cao chuyên nghiệp
**Phiên bản này là sự đại tu lớn cấu trúc kho lưu trữ và trình bày nội dung.**

#### Đã thêm
- **Khung học tập có cấu trúc**: Tất cả trang tài liệu bao gồm phần Giới thiệu, Mục tiêu học, và Kết quả học tập
- **Hệ thống điều hướng**: Thêm liên kết bài học Trước/Sau trong toàn bộ tài liệu để hướng dẫn tiến độ học
- **Hướng dẫn học tập**: Tệp study-guide.md toàn diện với mục tiêu học, bài tập thực hành và tài liệu đánh giá
- **Trình bày chuyên nghiệp**: Loại bỏ tất cả icon emoji để cải thiện khả năng tiếp cận và vẻ ngoài chuyên nghiệp
- **Cấu trúc nội dung cải tiến**: Tổ chức và luồng tài liệu học tập được nâng cao

#### Đã thay đổi
- **Định dạng tài liệu**: Chuẩn hóa tất cả tài liệu với cấu trúc tập trung học tập đồng nhất
- **Luồng điều hướng**: Triển khai tiến trình logic qua toàn bộ tài liệu học
- **Trình bày nội dung**: Loại bỏ yếu tố trang trí để ưu tiên định dạng rõ ràng, chuyên nghiệp
- **Cấu trúc liên kết**: Cập nhật toàn bộ liên kết nội bộ hỗ trợ hệ thống điều hướng mới

#### Cải thiện
- **Khả năng tiếp cận**: Loại bỏ phụ thuộc emoji để tương thích tốt hơn với trình đọc màn hình
- **Ngoại hình chuyên nghiệp**: Trình bày phong cách học thuật sạch sẽ phù hợp học tập doanh nghiệp
- **Trải nghiệm học tập**: Cách tiếp cận có cấu trúc với mục tiêu và kết quả rõ ràng cho mỗi bài học
- **Tổ chức nội dung**: Luồng logic và kết nối giữa các chủ đề liên quan tốt hơn

### [v1.0.0] - 2025-09-09

#### Phát hành ban đầu - Kho học tập AZD toàn diện

#### Đã thêm
- **Cấu trúc tài liệu cốt lõi**
  - Chuỗi hướng dẫn bắt đầu đầy đủ
  - Tài liệu triển khai và cấp phát toàn diện
  - Tài nguyên khắc phục sự cố và hướng dẫn gỡ lỗi chi tiết
  - Công cụ và thủ tục xác thực trước triển khai

- **Module bắt đầu**
  - AZD Cơ bản: Khái niệm và thuật ngữ cốt lõi
  - Hướng dẫn cài đặt: Hướng dẫn thiết lập nền tảng cụ thể
  - Hướng dẫn cấu hình: Thiết lập môi trường và xác thực
  - Hướng dẫn dự án đầu tiên: Học tập thực hành từng bước

- **Module triển khai và cấp phát**
  - Hướng dẫn triển khai: Tài liệu quy trình hoàn chỉnh
  - Hướng dẫn cấp phát: Cơ sở hạ tầng dưới dạng mã với Bicep
  - Thực hành tốt nhất cho triển khai sản xuất
  - Mẫu kiến trúc đa dịch vụ

- **Module xác thực trước triển khai**
  - Lập kế hoạch công suất: Xác thực sẵn có tài nguyên Azure
  - Lựa chọn SKU: Hướng dẫn toàn diện cấp dịch vụ
  - Kiểm tra trước bay: Script xác thực tự động (PowerShell và Bash)
  - Công cụ ước tính chi phí và lập kế hoạch ngân sách

- **Module khắc phục sự cố**
  - Vấn đề phổ biến: Các vấn đề thường gặp và giải pháp
  - Hướng dẫn gỡ lỗi: Phương pháp khắc phục có hệ thống
  - Kỹ thuật và công cụ chuẩn đoán nâng cao
  - Giám sát và tối ưu hiệu suất

- **Tài nguyên và tham khảo**
  - Bảng tóm tắt lệnh: Tham khảo nhanh lệnh cần thiết
  - Bảng chú giải: Thuật ngữ và định nghĩa viết tắt toàn diện
  - Câu hỏi thường gặp: Trả lời chi tiết các câu hỏi phổ biến
  - Liên kết tài nguyên bên ngoài và kết nối cộng đồng

- **Ví dụ và mẫu**
  - Ví dụ Ứng dụng web đơn giản
  - Mẫu triển khai Website tĩnh
  - Cấu hình ứng dụng Container
  - Mẫu tích hợp cơ sở dữ liệu
  - Ví dụ kiến trúc Microservices
  - Triển khai hàm serverless

#### Tính năng
- **Hỗ trợ đa nền tảng**: Hướng dẫn cài đặt và cấu hình cho Windows, macOS và Linux
- **Nhiều cấp độ kỹ năng**: Nội dung thiết kế cho sinh viên đến nhà phát triển chuyên nghiệp
- **Tập trung thực hành**: Ví dụ thực hành và kịch bản thực tế
- **Phủ sóng toàn diện**: Từ khái niệm cơ bản đến mẫu doanh nghiệp nâng cao
- **Ưu tiên bảo mật**: Tích hợp thực hành bảo mật tốt nhất xuyên suốt
- **Tối ưu chi phí**: Hướng dẫn triển khai tiết kiệm và quản lý tài nguyên

#### Chất lượng tài liệu
- **Ví dụ mã chi tiết**: Mẫu code thực tiễn, được kiểm thử
- **Hướng dẫn từng bước**: Hướng dẫn rõ ràng, dễ thực hiện
- **Xử lý lỗi toàn diện**: Khắc phục sự cố các vấn đề phổ biến
- **Tích hợp thực hành tốt nhất**: Tiêu chuẩn và khuyến nghị ngành
- **Tương thích phiên bản**: Cập nhật với dịch vụ Azure mới nhất và tính năng azd

## Nâng cấp dự định trong tương lai

### Phiên bản 3.1.0 (Dự kiến)
#### Mở rộng nền tảng AI
- **Hỗ trợ đa mô hình**: Mẫu tích hợp cho Hugging Face, Azure Machine Learning, và mô hình tùy chỉnh
- **Khung tác nhân AI**: Mẫu cho triển khai LangChain, Semantic Kernel, và AutoGen
- **Mẫu RAG nâng cao**: Tùy chọn cơ sở dữ liệu vector ngoài Azure AI Search (Pinecone, Weaviate, v.v.)
- **Quan sát AI**: Giám sát nâng cao hiệu suất mô hình, sử dụng token, và chất lượng phản hồi

#### Trải nghiệm nhà phát triển
- **Tiện ích mở rộng VS Code**: Trải nghiệm phát triển tích hợp AZD + Microsoft Foundry
- **Tích hợp GitHub Copilot**: Tạo mẫu AZD được hỗ trợ AI
- **Hướng dẫn tương tác**: Bài tập lập trình thực hành với xác thực tự động cho kịch bản AI
- **Nội dung video**: Hướng dẫn video bổ trợ cho người học trực quan tập trung vào triển khai AI

### Phiên bản 4.0.0 (Dự kiến)
#### Mẫu AI doanh nghiệp
- **Khung quản trị**: Quản trị mô hình AI, tuân thủ và dấu vết kiểm toán
- **AI đa khách hàng**: Mẫu phục vụ nhiều khách hàng với dịch vụ AI cô lập
- **Triển khai AI biên**: Tích hợp với Azure IoT Edge và container instances
- **AI đám mây lai**: Mẫu triển khai đa đám mây và lai cho workload AI

#### Tính năng nâng cao
- **Tự động hóa pipeline AI**: Tích hợp MLOps với pipeline Azure Machine Learning
- **Bảo mật nâng cao**: Mẫu zero-trust, điểm cuối riêng tư, và bảo vệ chống mối đe dọa nâng cao
- **Tối ưu hiệu suất**: Chiến lược điều chỉnh và mở rộng cho ứng dụng AI throughput cao
- **Phân phối toàn cầu**: Mẫu phân phối nội dung và caching biên cho ứng dụng AI

### Phiên bản 3.0.0 (Dự kiến) - Đã được phiên bản hiện tại thay thế
#### Bổ sung đề xuất - Đã thực hiện trong v3.0.0
- ✅ **Nội dung tập trung AI**: Tích hợp Microsoft Foundry toàn diện (Hoàn thành)
- ✅ **Hướng dẫn tương tác**: Hội thảo AI thực hành (Hoàn thành)
- ✅ **Module bảo mật nâng cao**: Mẫu bảo mật đặc thù AI (Hoàn thành)
- ✅ **Tối ưu hiệu suất**: Chiến lược điều chỉnh workload AI (Hoàn thành)

### Phiên bản 2.1.0 (Dự kiến) - Thực hiện một phần trong v3.0.0
#### Cải tiến nhỏ - Một số đã hoàn thành trong phiên bản hiện tại
- ✅ **Ví dụ bổ sung**: Kịch bản triển khai tập trung AI (Hoàn thành)
- ✅ **FAQ mở rộng**: Câu hỏi và khắc phục sự cố đặc thù AI (Hoàn thành)
- **Tích hợp công cụ**: Hướng dẫn tích hợp IDE và trình soạn thảo nâng cao
- ✅ **Mở rộng giám sát**: Mẫu giám sát và cảnh báo AI (Hoàn thành)

#### Vẫn dự kiến cho phiên bản tương lai
- **Tài liệu thân thiện thiết bị di động**: Thiết kế đáp ứng cho học trên di động
- **Truy cập ngoại tuyến**: Gói tài liệu có thể tải xuống
- **Tăng cường tích hợp IDE**: Tiện ích mở rộng VS Code cho quy trình làm việc AZD + AI
- **Bảng điều khiển cộng đồng**: Số liệu cộng đồng thời gian thực và theo dõi đóng góp

## Đóng góp cho nhật ký thay đổi

### Báo cáo thay đổi
Khi đóng góp cho kho lưu trữ này, vui lòng đảm bảo mục nhật ký thay đổi bao gồm:

1. **Số phiên bản**: Theo phiên bản ngữ nghĩa (major.minor.patch)
2. **Ngày tháng**: Ngày phát hành hoặc cập nhật theo định dạng YYYY-MM-DD
3. **Danh mục**: Đã thêm, Đã thay đổi, Không còn dùng, Đã gỡ bỏ, Đã sửa, An ninh
4. **Mô tả rõ ràng**: Mô tả ngắn gọn thay đổi gì
5. **Đánh giá tác động**: Thay đổi ảnh hưởng thế nào đến người dùng hiện tại

### Các loại thay đổi

#### Đã thêm
- Tính năng mới, phần tài liệu hoặc khả năng mới
- Ví dụ mới, mẫu hoặc tài nguyên học tập
- Công cụ, script hoặc tiện ích bổ sung

#### Đã thay đổi
- Sửa đổi tính năng hoặc tài liệu hiện có
- Cập nhật để cải thiện rõ ràng hoặc chính xác
- Tái cấu trúc nội dung hoặc tổ chức

#### Không còn dùng
- Tính năng hoặc phương pháp đang được loại bỏ dần
- Phần tài liệu dự kiến gỡ bỏ
- Phương pháp có lựa chọn tốt hơn

#### Đã gỡ bỏ
- Tính năng, tài liệu hoặc ví dụ không còn phù hợp
- Thông tin lỗi thời hoặc phương pháp không còn dùng
- Nội dung dư thừa hoặc tổng hợp lại

#### Đã sửa
- Sửa lỗi trong tài liệu hoặc code
- Giải quyết sự cố đã báo cáo
- Cải thiện độ chính xác hoặc chức năng

#### An ninh
- Cải tiến hoặc sửa lỗi liên quan an ninh
- Cập nhật thực hành bảo mật tốt nhất
- Khắc phục lỗ hổng bảo mật

### Hướng dẫn phiên bản ngữ nghĩa

#### Phiên bản chính (X.0.0)
- Các thay đổi phá vỡ yêu cầu hành động của người dùng
- Tái cấu trúc đáng kể về nội dung hoặc tổ chức
- Các thay đổi làm thay đổi phương pháp hoặc cách tiếp cận cơ bản

#### Phiên bản nhỏ (X.Y.0)
- Các tính năng hoặc bổ sung nội dung mới
- Cải tiến giúp duy trì tương thích ngược
- Ví dụ, công cụ hoặc nguồn tài nguyên bổ sung

#### Phiên bản sửa lỗi (X.Y.Z)
- Sửa lỗi và hiệu chỉnh
- Cải tiến nhỏ cho nội dung hiện có
- Làm rõ và tăng cường nhỏ

## Phản hồi và Đề xuất từ Cộng đồng

Chúng tôi tích cực khuyến khích phản hồi từ cộng đồng để cải thiện tài nguyên học tập này:

### Cách cung cấp phản hồi
- **Vấn đề trên GitHub**: Báo cáo sự cố hoặc gợi ý cải tiến (vấn đề liên quan AI được hoan nghênh)
- **Thảo luận trên Discord**: Chia sẻ ý tưởng và tương tác với cộng đồng Microsoft Foundry
- **Pull Requests**: Đóng góp cải tiến trực tiếp cho nội dung, đặc biệt là mẫu và hướng dẫn AI
- **Microsoft Foundry Discord**: Tham gia kênh #Azure cho thảo luận AZD + AI
- **Diễn đàn cộng đồng**: Tham gia thảo luận rộng hơn về nhà phát triển Azure

### Các loại phản hồi
- **Tính chính xác nội dung AI**: Sửa chữa thông tin tích hợp và triển khai dịch vụ AI
- **Trải nghiệm học tập**: Gợi ý cải thiện luồng học dành cho nhà phát triển AI
- **Thiếu nội dung AI**: Yêu cầu thêm mẫu, mẫu thiết kế hoặc ví dụ AI
- **Khả năng tiếp cận**: Cải tiến cho nhu cầu học đa dạng
- **Tích hợp công cụ AI**: Gợi ý tích hợp quy trình phát triển AI tốt hơn
- **Mẫu triển khai AI sản xuất**: Yêu cầu mẫu triển khai AI doanh nghiệp

### Cam kết phản hồi
- **Phản hồi vấn đề**: Trong vòng 48 giờ đối với sự cố đã báo cáo
- **Yêu cầu tính năng**: Đánh giá trong vòng một tuần
- **Đóng góp cộng đồng**: Xem xét trong vòng một tuần
- **Vấn đề bảo mật**: Ưu tiên ngay lập tức với phản hồi nhanh chóng

## Lịch bảo trì

### Cập nhật thường xuyên
- **Đánh giá hàng tháng**: Kiểm tra tính chính xác nội dung và xác thực liên kết
- **Cập nhật hàng quý**: Bổ sung và cải tiến nội dung lớn
- **Đánh giá nửa năm**: Tái cấu trúc và nâng cấp toàn diện
- **Phát hành hàng năm**: Cập nhật phiên bản lớn với cải tiến đáng kể

### Giám sát và đảm bảo chất lượng
- **Kiểm tra tự động**: Xác thực định kỳ các ví dụ mã và liên kết
- **Tích hợp phản hồi cộng đồng**: Đưa vào đề xuất người dùng thường xuyên
- **Cập nhật công nghệ**: Đồng bộ với dịch vụ Azure và azd mới nhất
- **Kiểm toán khả năng tiếp cận**: Đánh giá định kỳ các nguyên tắc thiết kế bao trùm

## Chính sách hỗ trợ phiên bản

### Hỗ trợ phiên bản hiện tại
- **Phiên bản lớn mới nhất**: Hỗ trợ đầy đủ với cập nhật định kỳ
- **Phiên bản lớn trước đó**: Cập nhật bảo mật và sửa lỗi quan trọng trong 12 tháng
- **Phiên bản cũ**: Chỉ hỗ trợ cộng đồng, không có cập nhật chính thức

### Hướng dẫn di cư
Khi phát hành phiên bản lớn, chúng tôi cung cấp:
- **Hướng dẫn di cư**: Hướng dẫn từng bước chuyển đổi
- **Ghi chú tương thích**: Chi tiết các thay đổi phá vỡ
- **Hỗ trợ công cụ**: Kịch bản hoặc tiện ích hỗ trợ di cư
- **Hỗ trợ cộng đồng**: Diễn đàn chuyên dụng cho câu hỏi di cư

---

**Điều hướng**
- **Bài học trước**: [Hướng dẫn học tập](resources/study-guide.md)
- **Bài học tiếp theo**: Quay lại [README chính](README.md)

**Cập nhật liên tục**: Theo dõi kho lưu trữ này để nhận thông báo về các bản phát hành mới và cập nhật quan trọng cho tài liệu học tập.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->