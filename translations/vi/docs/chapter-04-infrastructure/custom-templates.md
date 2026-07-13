# Tạo Mẫu azd Của Riêng Bạn

**Điều Hướng Chương:**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 4 - Cơ Sở Hạ Tầng Dưới Dạng Mã & Triển Khai
- **⬅️ Trước**: [Hướng Dẫn Triển Khai](deployment-guide.md)
- **🚀 Chương Tiếp Theo**: [Chương 5: Giải Pháp Đa Tác Nhân](../chapter-05-multi-agent/README.md)

> Đã xác thực với `azd 1.27.1` vào tháng 7 năm 2026.

## Giới Thiệu

Cho đến nay bạn đã *tiêu thụ* các mẫu với `azd init --template <name>`. Nhưng khi bạn có một bố cục dự án mà nhóm bạn thích—ví dụ như một Ứng Dụng Container với Cosmos DB và giám sát đúng—bạn sẽ muốn biến nó thành một mẫu tái sử dụng của riêng bạn. Mẫu chỉ là một kho Git với cấu trúc có thể đoán được mà azd biết cách đọc. Bài học này sẽ chỉ cho bạn cách tự tạo một mẫu từ đầu, kiểm thử nó, và (tùy chọn) công bố nó lên bộ sưu tập cộng đồng.

## Mục Tiêu Học Tập

Cuối bài học này, bạn sẽ:
- Hiểu rõ những gì tạo thành một "mẫu azd"
- Biết các tệp và cấu trúc thư mục cần thiết
- Thêm `azure.yaml` và thư mục `infra/` mà người khác có thể tái sử dụng
- Kiểm thử mẫu cục bộ trước khi chia sẻ
- Công bố nó và (tùy chọn) gửi vào Awesome AZD

## Kết Quả Học Tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Tạo scaffold kho mẫu mới
- Tham số hóa cơ sở hạ tầng để nó hoạt động trong bất kỳ đăng ký nào
- Xác thực mẫu bằng `azd init` và `azd up`
- Thêm metadata mà bộ sưu tập cộng đồng yêu cầu

---

## Mẫu Là Gì, Thực Sự Là Gì?

Một mẫu azd là **một kho Git** chứa, tối thiểu:

| Tệp / thư mục | Mục đích | Bắt Buộc? |
|---------------|---------|-----------|
| `azure.yaml` | Mô tả dịch vụ, host, và nhà cung cấp cơ sở hạ tầng | ✅ Có |
| `infra/` | Bicep, Terraform, hoặc Pulumi dùng để cung cấp tài nguyên | ✅ Có |
| `src/` (hoặc mã của bạn) | Mã ứng dụng mà azd triển khai | ✅ Có |
| `README.md` | Hướng dẫn sử dụng mẫu | ✅ Rất khuyến nghị |
| `.azdo/` hoặc `.github/` | Định nghĩa pipeline CI/CD | Tùy chọn |
| `.devcontainer/` | Môi trường phát triển tái tạo được | Tùy chọn |
| `azure.yaml` `metadata` | Thông tin gallery + thu thập dữ liệu | Tùy chọn (bắt buộc để công bố) |

Không có gì là phép thuật ở đây: khi bạn chạy `azd init --template you/your-repo`, azd sao chép kho và đọc `azure.yaml`.

---

## Bước 1: Tạo Scaffold Kho

Tạo cấu trúc thư mục bằng tay hoặc bắt đầu từ một mẫu tối giản và chỉnh sửa nó:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Tạo bố cục tiêu chuẩn
mkdir -p src infra
```

Một bố cục điển hình hoàn chỉnh trông như thế này:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Bước 2: Viết `azure.yaml`

Đây là phần cốt lõi của mẫu. Nó nói cho azd biết phải triển khai gì và như thế nào:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Trường `metadata.template` là thứ thu thập dữ liệu gallery dùng để đếm lượt sử dụng. Dùng quy ước `name@version`.

---

## Bước 3: Tham Số Hóa Cơ Sở Hạ Tầng

Quy tắc quan trọng nhất cho một mẫu *tái sử dụng được*: **không bao giờ hardcode tên, vùng, hoặc giá trị đặc thù đăng ký.** Dùng tham số và mẫu token tài nguyên để cùng một mẫu có thể chạy trong bất kỳ đăng ký nào.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Hai điều làm cho mẫu này thân thiện:

1. **Thẻ `azd-env-name`** — azd dùng nó để theo dõi và dọn dẹp tài nguyên theo môi trường.
2. **Token tài nguyên `uniqueString(...)`** — tạo hậu tố ổn định và duy nhất toàn cầu để tên không bị trùng.

Cung cấp tệp tham số tương ứng đọc các giá trị azd chèn từ môi trường:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd tự động thay thế `${AZURE_ENV_NAME}` và `${AZURE_LOCATION}` từ môi trường hiện tại.

---

## Bước 4: Kiểm Thử Mẫu Cục Bộ

Trước khi chia sẻ, hãy chứng minh mẫu hoạt động từ trạng thái sạch.

**Kiểm thử từ thư mục cục bộ** (không cần đẩy Git):

```bash
# Từ một thư mục trống, khởi tạo bằng cách sử dụng đường dẫn mẫu cục bộ của bạn
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Cấp phát + triển khai từ đầu đến cuối
azd auth login
azd up
```

**Sau đó kiểm thử dọn dẹp**—một mẫu tốt phải dọn dẹp hoàn toàn:

```bash
azd down --force --purge
```

Nếu `azd down` còn để lại tài nguyên, có thể bạn đã quên thẻ `azd-env-name` trên một tài nguyên.

> **Mẹo:** chạy `azd provision --preview` trước. Nó thực hiện tình huống giả định và hiển thị lỗi mẫu trước khi tạo tài nguyên.

---

## Bước 5: Công Bố Mẫu

Đẩy kho lên GitHub (công khai nếu bạn muốn người khác dùng):

```bash
gh repo create my-azd-template --public --source=. --push
```

Bây giờ ai cũng có thể sử dụng:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Bước 6 (Tùy Chọn): Gửi Vào Awesome AZD

[Awesome AZD gallery](https://azure.github.io/awesome-azd/) liệt kê các mẫu cộng đồng. Để được liệt kê, kho bạn nên bao gồm:

- ✅ `README.md` rõ ràng với điều kiện tiên quyết, sơ đồ kiến trúc, và ghi chú chi phí
- ✅ `azure.yaml` hoạt động với `metadata.template`
- ✅ Cơ sở hạ tầng triển khai sạch sẽ trên một đăng ký mới
- ✅ Tệp `LICENSE`
- ✅ (Khuyến nghị) Thư mục `.devcontainer/` cho Codespaces một cú click

Gửi bằng cách mở pull request thêm mẫu của bạn vào tệp dữ liệu gallery theo hướng dẫn đóng góp tại [kho Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Những Sai Lầm Thường Gặp

| Sai Lầm | Cách Sửa |
|---------|-----|
| Tên tài nguyên hardcoded | Dùng token tài nguyên `uniqueString()` |
| `azd down` còn để lại tài nguyên | Đánh thẻ mọi tài nguyên (hoặc nhóm tài nguyên) với `azd-env-name` |
| Mẫu chạy được với bạn, thất bại với người khác | Loại bỏ ID đăng ký, ID thuê, và giả định vùng |
| Outputs không liên kết vào app | Xuất `SERVICE_<NAME>_ENDPOINT_URL` và các output `AZURE_*` khác |
| Gửi gallery bị từ chối | Thêm `README.md`, `LICENSE`, và `metadata.template` |

---

## Tóm Tắt

- Mẫu chỉ là một kho Git với `azure.yaml`, `infra/`, và mã của bạn.
- Tham số hóa mọi thứ—tên, vùng, và ID—để chạy được ở bất kỳ đâu.
- Luôn đánh thẻ tài nguyên với `azd-env-name` để `azd down` hoạt động tốt.
- Kiểm thử cục bộ với `azd init --template <local-path>` trước khi công bố.
- Thêm metadata và README để gửi vào Awesome AZD.

---

## 🔗 Điều Hướng

| Hướng | Tài Nguyên |
|-----------|----------|
| **Trước** | [Hướng Dẫn Triển Khai](deployment-guide.md) |
| **Trang Chủ Chương** | [Chương 4: Cơ Sở Hạ Tầng Dưới Dạng Mã](README.md) |
| **Chương Tiếp Theo** | [Chương 5: Giải Pháp Đa Tác Nhân](../chapter-05-multi-agent/README.md) |

## 📖 Tài Nguyên Liên Quan

- [Cung Cấp Tài Nguyên](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Tài liệu mẫu azd chính thức](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->