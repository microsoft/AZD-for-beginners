# Mang Ứng Dụng Riêng Vào - Thêm azd vào Dự Án Hiện Có

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Nền Tảng & Bắt Đầu Nhanh
- **⬅️ Trước**: [Dự Án Đầu Tiên Của Bạn](first-project.md)
- **➡️ Tiếp Theo**: [Dev Containers & Codespaces](dev-containers.md)

> Mục tiêu xem xét lệnh và cấu hình: `azd 1.37.2` (Tháng 11/2026). Các tệp tạo ra phụ thuộc vào ứng dụng được phát hiện; việc triển khai Azure không được thực hiện trong bài kiểm tra này.

## Giới Thiệu

Trong [Dự Án Đầu Tiên Của Bạn](first-project.md) bạn đã triển khai một ứng dụng bằng cách bắt đầu từ một mẫu. Nhưng hầu hết thời gian bạn đã *có* một ứng dụng—một API Node.js, một dịch vụ Python Flask, một ứng dụng web .NET—nằm trong một thư mục trên máy bạn. Bài học này sẽ hướng dẫn bạn cách thêm azd vào mã nguồn hiện có đó để bạn có thể triển khai nó với `azd up`, không cần mẫu.

## Mục Tiêu Học Tập

Sau khi kết thúc bài học này, bạn sẽ:
- Hiểu ba cách để khởi tạo một dự án azd
- Chạy `azd init` bên trong mã nguồn hiện có
- Hiểu `azure.yaml` và thư mục `infra/` làm gì cho ứng dụng của bạn
- Biết khi nào nên để azd tạo cơ sở hạ tầng vs. tự viết
- Triển khai ứng dụng hiện có lên Azure bằng `azd up`

## Kết Quả Học Tập

Sau khi hoàn thành bài học, bạn sẽ có thể:
- Khởi tạo azd trong dự án bạn đã có
- Đọc và chỉnh sửa tệp `azure.yaml` cơ bản
- Tạo cơ sở hạ tầng khởi đầu với `azd infra generate`
- Chọn host Azure phù hợp cho ứng dụng của bạn
- Triển khai và dọn dẹp ứng dụng của bạn

---

## Ba Cách Khởi Đầu Một Dự Án azd

| Điểm khởi đầu | Lệnh | Khi nào dùng |
|----------------|---------|-------------|
| **Từ một mẫu** | `azd init --template <name> .` (thư mục trống) | Học tập, hoặc bắt đầu ứng dụng mới từ mẫu đã chứng minh |
| **Từ mã nguồn hiện có** | `azd init` (trong thư mục dự án của bạn) | Bạn đã có ứng dụng và muốn triển khai nó |
| **Từ repo Git** | `azd init --from-code` (trong repo đã clone) | Áp dụng azd cho repo hiện có |

Bạn đã thực hành tùy chọn đầu tiên. Bài học này sẽ bao phủ tùy chọn thứ hai—kịch bản thực tế phổ biến nhất.

---

## Bước 1: Chạy `azd init` Trong Dự Án Của Bạn

Mở terminal **bên trong thư mục dự án hiện có của bạn** và chạy:

```bash
cd my-existing-app
azd init
```

azd sẽ hỏi bạn muốn khởi tạo thế nào. Chọn:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Chọn **"Sử dụng mã trong thư mục hiện tại."** azd sau đó sẽ quét thư mục, phát hiện ngôn ngữ và framework của bạn, và đề xuất một host.

### Những gì azd phát hiện

azd tìm kiếm các dấu hiệu ứng dụng như `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, hoặc một `Dockerfile`. Quy trình từ mã nguồn không phải là trình hướng dẫn chọn host chung cho mọi mục tiêu triển khai được hỗ trợ:

| Ứng dụng của bạn | Host được phát hiện có thể là |
|----------|----------------------|
| Ứng dụng web Node.js / Python / .NET được hỗ trợ | Thường là Azure Container Apps; kiểm tra định nghĩa được tạo ra |
| Ứng dụng containerized (`Dockerfile`) | Azure Container Apps |
| Ứng dụng Function hoặc dự án Static Web Apps | Dùng mẫu tương ứng hoặc viết `azure.yaml` và cơ sở hạ tầng nếu từ mã nguồn không hỗ trợ cấu trúc của bạn |

Xác nhận dịch vụ được phát hiện, và azd tạo các tệp bạn cần.

---

## Bước 2: Hiểu Những Gì azd Tạo Ra

Sau khi khởi tạo, kiểm tra `azure.yaml`. Quy trình tạo cơ sở hạ tầng có thể giữ cơ sở hạ tầng ngầm định cho đến khi bạn chạy `azd infra generate`; đừng cho rằng `infra/` đã tồn tại:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — định nghĩa dự án

Đây là trái tim của dự án azd. Định nghĩa **App Service minh họa** sau đây yêu cầu cơ sở hạ tầng App Service tương ứng; không phải lý do để thay đổi host Container Apps được tạo ra mà không thay đổi cơ sở hạ tầng:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Khối `services` là phần quan trọng: mỗi mục ánh xạ một thư mục mã của bạn tới một host Azure. Nếu ứng dụng của bạn có cả giao diện frontend và API, bạn sẽ có hai dịch vụ.

### `infra/` — tài nguyên Azure của bạn dưới dạng mã

Thư mục `infra/` chứa các tệp Bicep định nghĩa các tài nguyên Azure mà ứng dụng của bạn cần (App Service, cơ sở dữ liệu, v.v.). Bạn không cần viết tay—azd tạo ra điểm khởi đầu hoạt động. Bạn *có thể* chỉnh sửa chúng sau để thêm tài nguyên hoặc tăng cường bảo mật (được đề cập trong [Chương 4](../chapter-04-infrastructure/README.md)).

> **Mẹo:** Muốn xem hoặc tùy chỉnh cơ sở hạ tầng tạo ra trước khi triển khai? Chạy `azd infra generate` (cũng có dưới dạng `azd infra synth`) để ghi IaC ra đĩa, giúp bạn xem xét và kiểm soát phiên bản.

---

## Bước 3: Cài Đặt Cấu Hình Cần Thiết

Nếu ứng dụng bạn cần các cài đặt hoặc bí mật (chuỗi kết nối, khóa API), đừng mã hóa cứng chúng. Dùng giá trị môi trường:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Điều này chỉ lưu giá trị cục bộ. Để ảnh hưởng đến ứng dụng, phải sử dụng rõ ràng trong tham số cơ sở hạ tầng, cài đặt dịch vụ được hỗ trợ, hoặc hook; thiết lập biến tùy ý không cấu hình thời gian chạy đã triển khai.

Với bí mật thật sự, hãy lưu trong Key Vault và tham chiếu trong cơ sở hạ tầng của bạn—xem [Chương 3: Cấu Hình & Xác Thực](../chapter-03-configuration/authsecurity.md).

---

## Bước 4: Triển Khai

Bây giờ sử dụng quy trình bạn đã biết:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Khi hoàn thành, azd hiển thị URL ứng dụng của bạn. Kiểm tra nó như bất kỳ ứng dụng azd nào:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Các Vấn Đề Thường Gặp Lần Đầu

| Triệu chứng | Nguyên nhân có thể | Cách sửa |
|---------|--------------|-----|
| azd không phát hiện ứng dụng của tôi | Thiếu manifest (ví dụ, `package.json`) | Thêm manifest, hoặc chọn host thủ công khi chạy `azd init` |
| Xây dựng lỗi trong lúc `azd up` | Ứng dụng cần bước xây dựng | Cấu hình script gói của ứng dụng hoặc hook dịch vụ `prepackage`; dùng `dist` cho đầu ra deploy, không dùng `buildCommand`/`outputPath` |
| Ứng dụng khởi động nhưng trả lỗi | Thiếu cấu hình/bí mật | Kết nối giá trị vào cài đặt ứng dụng thời gian chạy hoặc tham chiếu Key Vault; chỉ `azd env set` không đủ |
| Chọn sai host | Phát hiện tự động không phù hợp nhu cầu | Thay đổi cả `host:` và cơ sở hạ tầng tương ứng, hoặc chọn mẫu phù hợp |

Chi tiết hơn, xem [Chương 7: Khắc Phục Sự Cố](../chapter-07-troubleshooting/README.md).

---

## Dọn Dẹp

```bash
azd down --force --purge
```

---

## Tóm Tắt

- `azd init` → **"Sử dụng mã trong thư mục hiện tại"** thêm azd vào ứng dụng bạn đã có.
- `azure.yaml` ánh xạ các thư mục mã của bạn tới các host Azure; `infra/` định nghĩa tài nguyên dưới dạng Bicep.
- `azd infra generate` cho phép bạn xem lại hoặc tùy chỉnh cơ sở hạ tầng tạo ra.
- Sau khi khởi tạo, ứng dụng hiện có của bạn sử dụng chính xác quy trình `azd up` / `azd down` như ứng dụng dựa trên mẫu.

---

## 🔗 Điều Hướng

| Hướng đi | Bài học |
|-----------|--------|
| **Trước** | [Dự Án Đầu Tiên Của Bạn](first-project.md) |
| **Tiếp Theo** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Tài Nguyên Liên Quan

- [Kiến Thức Cơ Bản AZD](azd-basics.md)
- [Chương 4: Cơ Sở Hạ Tầng dưới dạng Mã](../chapter-04-infrastructure/README.md)
- [Cấu Hình & Xác Thực](../chapter-03-configuration/authsecurity.md)
- [Bảng Tóm Tắt Lệnh](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->