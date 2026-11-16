# Tự Tạo Mẫu azd Cho Riêng Bạn

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 4 - Cơ Sở Hạ Tầng như Mã & Triển Khai
- **⬅️ Trước Đó**: [Hướng Dẫn Triển Khai](deployment-guide.md)
- **🚀 Chương Tiếp Theo**: [Chương 5: Giải Pháp Đa Tác Nhân](../chapter-05-multi-agent/README.md)

> Đã xem xét đối chiếu với `azd 1.37.2` (Tháng 11 năm 2026). Đây là **hướng dẫn tạo mẫu với các tập tin một phần**, không phải một mẫu hoàn chỉnh: bạn phải cung cấp mã ứng dụng và `modules/web.bicep` với môi trường, registry, Container App, và outputs trước khi triển khai. Việc cung cấp Azure không được thực hiện trong lần xem xét này.

## Giới Thiệu

Cho đến nay, bạn đã *tiêu thụ* các mẫu với `azd init --template <name>`. Nhưng một khi bạn có bố cục dự án mà nhóm bạn thích — ví dụ như một Container App với Cosmos DB và giám sát phù hợp — bạn sẽ muốn chuyển nó thành một mẫu có thể tái sử dụng của riêng bạn. Một mẫu chỉ là một kho Git với cấu trúc dễ đoán mà azd biết cách đọc. Bài học này sẽ chỉ cho bạn cách xây dựng một mẫu từ đầu, kiểm tra nó, và (tùy chọn) xuất bản nó lên thư viện cộng đồng.

## Mục Tiêu Học Tập

Tới cuối bài học này, bạn sẽ:
- Hiểu mẫu thư mục nào được gọi là "mẫu azd"
- Biết các tập tin và cấu trúc thư mục cần thiết
- Thêm một `azure.yaml` và `infra/` mà người khác có thể tái sử dụng
- Kiểm tra mẫu của bạn trên máy trước khi chia sẻ
- Xuất bản và (tùy chọn) gửi đến Awesome AZD

## Kết Quả Học Tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Tạo dựng một kho mẫu mới
- Tham số hóa hạ tầng để nó hoạt động trong bất kỳ subscription nào
- Xác thực mẫu với `azd init` và `azd up`
- Thêm dữ liệu siêu thông tin mà thư viện cộng đồng yêu cầu

---

## Mẫu Là Gì Thực Sự?

Một mẫu azd là **một kho Git** chứa, ít nhất:

| Tập tin / thư mục | Mục đích | Bắt buộc? |
|---------------|---------|-----------|
| `azure.yaml` | Mô tả dịch vụ, máy chủ, và nhà cung cấp hạ tầng | ✅ Có |
| `infra/` | Định nghĩa cung cấp bằng Bicep hoặc Terraform | Bắt buộc cho ví dụ IaC rõ ràng này; các dự án cơ sở hạ tầng sinh tự động có thể bỏ qua |
| `src/` (hoặc mã của bạn) | Mã ứng dụng azd triển khai | Bắt buộc cho dịch vụ dựa trên mã nguồn; không phải tất cả mẫu đều có mã ứng dụng |
| `README.md` | Cách sử dụng mẫu | ✅ Khuyến nghị mạnh mẽ |
| `.azdo/` hoặc `.github/` | Định nghĩa pipeline CI/CD | Tùy chọn |
| `.devcontainer/` | Môi trường phát triển có thể tái tạo | Tùy chọn |
| `azure.yaml` `metadata` | Thông tin nhận dạng/giám sát mẫu | Khuyến nghị; việc đăng Git repo không bắt buộc có |

Không có gì huyền bí ở đây: khi bạn chạy `azd init --template you/your-repo`, azd sao chép repo và đọc `azure.yaml`.

---

## Bước 1: Tạo Cấu Trúc Kho

Tạo cấu trúc thư mục bằng tay hoặc bắt đầu từ một mẫu tối giản và chỉnh sửa nó:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Một bố cục điển hình hoàn chỉnh trông như sau:

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

Đây là phần trọng tâm của mẫu. Nó nói azd phải triển khai gì và như thế nào:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Trường `metadata.template` là điều mà giám sát thư viện dùng để đếm số lần sử dụng. Sử dụng quy ước `name@version`.

---

## Bước 3: Tham Số Hóa Hạ Tầng

Quy tắc quan trọng nhất cho một mẫu *có thể tái sử dụng*: **không bao giờ cứng mã hóa tên, vùng, hoặc giá trị riêng theo subscription.** Dùng tham số và mẫu token tài nguyên để cùng một mẫu làm việc trong subscription của bất kỳ ai.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Hai thứ làm mẫu này thân thiện:

1. **Nhãn `azd-env-name`** — azd dùng để theo dõi và dọn dẹp tài nguyên theo môi trường.
2. **Token tài nguyên `uniqueString(...)`** — tạo hậu tố băm ổn định giảm va chạm; không đảm bảo duy nhất toàn cầu.

`modules/web.bicep` bị thiếu phải nhận `name`, `location`, và `tags`, cung cấp môi trường/registry Container Apps và app, gán nhãn app với `azd-service-name: web`, và xuất `uri`. Nó cũng phải lộ ra các giá trị của registry cần thiết cho luồng build/deploy đã chọn (ví dụ `AZURE_CONTAINER_REGISTRY_ENDPOINT` từ module gốc). Một output endpoint đơn lẻ không liên kết dịch vụ khám phá, cấu hình app, hay xác thực registry.

Cung cấp một tập tin tham số tương ứng đọc giá trị azd tiêm từ môi trường:

Lưu như sau thành `infra/main.parameters.json`:

```json
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

## Bước 4: Kiểm Tra Mẫu Trên Máy

Trước khi chia sẻ, chứng minh mẫu hoạt động từ trạng thái sạch.

**Kiểm tra từ thư mục cục bộ** (không cần đẩy Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Sau đó kiểm tra tháo dỡ** — một mẫu tốt sẽ dọn sạch hoàn toàn:

```bash
azd down --force --purge
```

Nếu `azd down` để lại tài nguyên, kiểm tra việc phát hiện môi trường/nhóm tài nguyên, tài nguyên ngoài/chia sẻ, quyền, khóa, và bảo vệ xóa. `--purge` không xóa trạng thái `.azure/` cục bộ.

> **Mẹo:** sau khi cung cấp đầy đủ các tập tin thiếu, chạy `azd provision --preview` trước. Kiểm tra các hook trước khi xem trước vì chúng có thể thực thi các lệnh gây tác động phụ. Xem trước không phải là ước lượng giá hay đảm bảo quá trình cung cấp sẽ thành công.

---

## Bước 5: Xuất Bản Mẫu

Đẩy kho lên GitHub (công khai nếu bạn muốn người khác sử dụng):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Bất kỳ ai cũng có thể dùng nó:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Bước 6 (Tùy Chọn): Gửi Đến Awesome AZD

Thư viện [Awesome AZD](https://azure.github.io/awesome-azd/) liệt kê các mẫu cộng đồng. Để được liệt kê, kho của bạn nên bao gồm:

- ✅ Một `README.md` rõ ràng với các điều kiện tiên quyết, sơ đồ kiến trúc, và ghi chú chi phí
- ✅ Một `azure.yaml` hoạt động với `metadata.template`
- ✅ Hạ tầng có thể cung cấp sạch trong một subscription mới
- ✅ Một tập tin `LICENSE`
- ✅ (Khuyến nghị) Một `.devcontainer/` cho Codespaces 1-click

Gửi bằng cách mở pull request thêm mẫu của bạn vào tập tin dữ liệu của thư viện, theo hướng dẫn đóng góp tại kho [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Các Sai Lầm Phổ Biến

| Sai Lầm | Sửa |
|---------|-----|
| Tên tài nguyên viết cứng | Dùng token tài nguyên `uniqueString()` |
| `azd down` để lại tài nguyên | Gán nhãn tất cả tài nguyên (hoặc nhóm tài nguyên) bằng `azd-env-name` |
| Mẫu chạy cho bạn, lỗi với người khác | Xóa ID subscription, ID tenant, và giả định vùng miền |
| Output không kết nối với app | Khớp `azd-service-name`/`resourceName` cho deployment và map rõ ràng output vào cài đặt app |
| Nộp mẫu cho thư viện bị từ chối | Thêm `README.md`, `LICENSE`, và `metadata.template` |

---

## Tóm Tắt

- Một mẫu đơn giản là một kho Git với `azure.yaml`, `infra/`, và mã của bạn.
- Tham số hóa mọi thứ — tên, vùng, và ID — để chạy được bất cứ đâu.
- Luôn gán nhãn tài nguyên với `azd-env-name` để `azd down` hoạt động.
- Kiểm tra trên máy với `azd init --template <local-path>` trước khi xuất bản.
- Thêm dữ liệu siêu thông tin và README để gửi cho Awesome AZD.

---

## 🔗 Điều Hướng

| Hướng | Tài Nguyên |
|-----------|----------|
| **Trước** | [Hướng Dẫn Triển Khai](deployment-guide.md) |
| **Trang Chủ Chương** | [Chương 4: Cơ Sở Hạ Tầng như Mã](README.md) |
| **Chương Tiếp Theo** | [Chương 5: Giải Pháp Đa Tác Nhân](../chapter-05-multi-agent/README.md) |

## 📖 Tài Nguyên Liên Quan

- [Cung Cấp Tài Nguyên](provisioning.md)
- [Thư viện Awesome AZD](https://azure.github.io/awesome-azd/)
- [Tài liệu chính thức mẫu azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->