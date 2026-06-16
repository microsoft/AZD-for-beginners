# Tạo mẫu azd của riêng bạn

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD cho Người Mới](../../README.md)
- **📖 Chương hiện tại**: Chương 4 - Hạ tầng dưới dạng mã & Triển khai
- **⬅️ Trước**: [Hướng dẫn Triển khai](deployment-guide.md)
- **🚀 Chương tiếp theo**: [Chương 5: Giải pháp đa tác nhân](../chapter-05-multi-agent/README.md)

> Đã xác thực trên `azd 1.25.6` vào tháng 6 năm 2026.

## Giới thiệu

Cho đến nay bạn đã *tiêu thụ* các mẫu bằng `azd init --template <name>`. Nhưng khi bạn có một bố cục dự án mà nhóm thích—ví dụ, một Container App với một Cosmos DB và giám sát phù hợp—bạn sẽ muốn biến nó thành một mẫu có thể tái sử dụng của riêng mình. Một mẫu chỉ đơn giản là một Git repository với cấu trúc có thể đoán trước mà azd biết cách đọc. Bài học này sẽ hướng dẫn bạn cách xây dựng một mẫu từ đầu, kiểm thử nó, và (tùy chọn) xuất bản nó lên thư viện cộng đồng.

## Mục tiêu học tập

By the end of this lesson, you will:
- Hiểu những gì làm cho một thư mục trở thành "mẫu azd"
- Biết các tệp và cấu trúc thư mục cần thiết
- Thêm `azure.yaml` và `infra/` để người khác có thể tái sử dụng
- Kiểm thử mẫu cục bộ trước khi chia sẻ
- Xuất bản nó và (tùy chọn) gửi nó tới Awesome AZD

## Kết quả học tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Khởi tạo một repository mẫu mới
- Tham số hóa hạ tầng để nó hoạt động trong bất kỳ subscription nào
- Xác thực một mẫu bằng `azd init` và `azd up`
- Thêm metadata mà gallery cộng đồng yêu cầu

---

## Mẫu thực sự là gì?

Một mẫu azd là **một repository Git** chứa, tối thiểu:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | Mô tả các dịch vụ, host và nhà cung cấp hạ tầng | ✅ Yes |
| `infra/` | Bicep, Terraform hoặc Pulumi để cấp phát tài nguyên | ✅ Yes |
| `src/` (or your code) | Mã ứng dụng mà azd triển khai | ✅ Yes |
| `README.md` | Cách sử dụng mẫu | ✅ Rất được khuyến nghị |
| `.azdo/` or `.github/` | Định nghĩa pipeline CI/CD | Optional |
| `.devcontainer/` | Môi trường phát triển có thể tái tạo | Optional |
| `azure.yaml` `metadata` | Thông tin gallery + telemetry | Optional (required to publish) |

Không có gì huyền bí ở đây: khi bạn chạy `azd init --template you/your-repo`, azd sẽ clone repo và đọc `azure.yaml`.

---

## Bước 1: Khởi tạo Repository

Tạo cấu trúc thư mục bằng tay hoặc bắt đầu từ một mẫu tối thiểu và chỉnh sửa nó:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Tạo bố cục tiêu chuẩn
mkdir -p src infra
```

Một bố cục hoàn chỉnh điển hình trông như sau:

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

Đây là trái tim của mẫu. Nó cho azd biết sẽ triển khai gì và như thế nào:

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

> Trường `metadata.template` là thứ telemetry của gallery dùng để đếm lượt sử dụng. Sử dụng quy ước `name@version`.

---

## Bước 3: Tham số hóa Hạ tầng

Quy tắc quan trọng nhất cho một mẫu *có thể tái sử dụng*: **không bao giờ viết cứng tên, vùng, hoặc các giá trị đặc thù subscription.** Sử dụng tham số và mẫu token tài nguyên để cùng một mẫu hoạt động trong subscription của bất kỳ ai.

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

Hai điều làm cho mẫu dễ sử dụng:

1. **`azd-env-name` tag** — azd dùng nó để theo dõi và dọn dẹp tài nguyên theo từng môi trường.
2. **`uniqueString(...)` resource token** — tạo hậu tố ổn định, duy nhất trên toàn cầu để tên không bị trùng.

Cung cấp một tệp tham số tương ứng đọc các giá trị azd chèn từ môi trường:

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

## Bước 4: Kiểm thử Mẫu Cục bộ

Trước khi chia sẻ, hãy chứng minh mẫu hoạt động từ trạng thái sạch.

**Kiểm thử từ thư mục cục bộ** (không cần đẩy lên Git):

```bash
# Từ một thư mục trống, khởi tạo bằng cách sử dụng đường dẫn mẫu cục bộ của bạn
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Cấu hình và triển khai từ đầu đến cuối
azd auth login
azd up
```

**Sau đó thử dọn dẹp (teardown)**—một mẫu tốt sẽ dọn sạch hoàn toàn:

```bash
azd down --force --purge
```

Nếu `azd down` để lại tài nguyên, có lẽ bạn đã bỏ quên thẻ `azd-env-name` trên một tài nguyên.

> **Mẹo:** chạy `azd provision --preview` trước. Nó thực hiện một what-if và hiển thị lỗi mẫu trước khi bất kỳ tài nguyên nào được tạo.

---

## Bước 5: Xuất bản Mẫu

Đẩy repository lên GitHub (public nếu bạn muốn người khác sử dụng):

```bash
gh repo create my-azd-template --public --source=. --push
```

Bất kỳ ai giờ có thể sử dụng nó:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Bước 6 (Tùy chọn): Gửi tới Awesome AZD

Thư viện [Awesome AZD gallery](https://azure.github.io/awesome-azd/) liệt kê các mẫu cộng đồng. Để được liệt kê, repo của bạn nên bao gồm:

- ✅ Một `README.md` rõ ràng với các yêu cầu trước, sơ đồ kiến trúc và ghi chú chi phí
- ✅ Một `azure.yaml` hoạt động kèm `metadata.template`
- ✅ Hạ tầng triển khai một cách sạch sẽ trong một subscription mới
- ✅ Một tệp `LICENSE`
- ✅ (Được khuyến nghị) Một `.devcontainer/` để mở Codespaces với một cú nhấp chuột

Gửi bằng cách mở một pull request thêm mẫu của bạn vào tệp dữ liệu của gallery, tuân theo hướng dẫn đóng góp tại [kho lưu trữ Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Những lỗi thường gặp

| Pitfall | Fix |
|---------|-----|
| Tên tài nguyên viết cứng | Sử dụng token tài nguyên `uniqueString()` |
| `azd down` để lại tài nguyên | Gắn thẻ mọi tài nguyên (hoặc nhóm tài nguyên) bằng `azd-env-name` |
| Mẫu hoạt động với bạn, thất bại với người khác | Loại bỏ subscription IDs, tenant IDs, và các giả định về vùng |
| Outputs not wired into the app | Export `SERVICE_<NAME>_ENDPOINT_URL` and other `AZURE_*` outputs |
| Gallery submission rejected | Thêm `README.md`, `LICENSE`, và `metadata.template` |

---

## Tóm tắt

- Mẫu chỉ là một repo Git với `azure.yaml`, `infra/`, và mã của bạn.
- Tham số hóa mọi thứ—tên, vùng, và ID—để chạy được ở bất cứ đâu.
- Luôn gắn thẻ tài nguyên bằng `azd-env-name` để `azd down` hoạt động.
- Kiểm thử cục bộ với `azd init --template <local-path>` trước khi xuất bản.
- Thêm metadata và một README để gửi lên Awesome AZD.

---

## 🔗 Điều hướng

| Hướng | Tài nguyên |
|-----------|----------|
| **Trước** | [Hướng dẫn Triển khai](deployment-guide.md) |
| **Trang chương** | [Chương 4: Hạ tầng dưới dạng mã](README.md) |
| **Chương tiếp theo** | [Chương 5: Giải pháp đa tác nhân](../chapter-05-multi-agent/README.md) |

## 📖 Tài nguyên liên quan

- [Cấp phát tài nguyên](provisioning.md)
- [Thư viện Awesome AZD](https://azure.github.io/awesome-azd/)
- [Tài liệu chính thức về mẫu azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->