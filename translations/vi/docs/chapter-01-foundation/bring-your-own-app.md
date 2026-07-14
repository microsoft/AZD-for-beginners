# Mang Ứng Dụng Riêng Của Bạn - Thêm azd vào Dự Án Hiện Tại

**Điều hướng chương:**
- **📚 Trang Khóa Học**: [AZD Dành Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Nền Tảng & Khởi Đầu Nhanh
- **⬅️ Trước**: [Dự Án Đầu Tiên Của Bạn](first-project.md)
- **➡️ Tiếp**: [Dev Containers & Codespaces](dev-containers.md)

> Đã kiểm tra với `azd 1.27.1` vào tháng 7 năm 2026.

## Giới thiệu

Trong [Dự Án Đầu Tiên Của Bạn](first-project.md) bạn đã triển khai một ứng dụng bằng cách bắt đầu từ một mẫu. Nhưng hầu hết thời gian bạn đã *có* một ứng dụng—một API Node.js, một dịch vụ Python Flask, một ứng dụng web .NET—đang nằm trong một thư mục trên máy của bạn. Bài học này hướng dẫn cách thêm azd vào mã hiện tại đó để bạn có thể triển khai nó bằng `azd up`, không cần mẫu.

## Mục tiêu học tập

Sau bài học này, bạn sẽ:
- Hiểu ba cách để bắt đầu một dự án azd
- Chạy `azd init` trong một mã nguồn hiện có
- Hiểu `azure.yaml` và thư mục `infra/` làm gì cho ứng dụng của bạn
- Biết khi nào để azd tạo hạ tầng và khi nào tự viết
- Triển khai ứng dụng hiện có của bạn lên Azure với `azd up`

## Kết quả học tập

Sau khi hoàn thành bài học, bạn sẽ có thể:
- Khởi tạo azd trong một dự án bạn đã có
- Đọc và chỉnh sửa file `azure.yaml` cơ bản
- Tạo hạ tầng khởi đầu với lệnh `azd infra generate`
- Chọn dịch vụ Azure phù hợp cho ứng dụng của bạn
- Triển khai và dọn dẹp ứng dụng của chính bạn

---

## Ba Cách Bắt Đầu Dự Án azd

| Điểm bắt đầu | Lệnh | Khi sử dụng |
|----------------|---------|-------------|
| **Từ mẫu** | `azd init --template <name>` | Học tập, hoặc bắt đầu một ứng dụng mới từ mẫu có sẵn |
| **Từ mã nguồn hiện có** | `azd init` (trong thư mục dự án) | Bạn đã có ứng dụng và muốn triển khai nó |
| **Từ repo Git** | `azd init --from-code` (trong repo đã clone) | Áp dụng azd cho repo hiện có |

Bạn đã thực hành lựa chọn đầu tiên. Bài học này đề cập đến lựa chọn thứ hai—kịch bản thực tế phổ biến nhất.

---

## Bước 1: Chạy `azd init` trong dự án của bạn

Mở terminal **trong thư mục dự án hiện có của bạn** và chạy:

```bash
cd my-existing-app
azd init
```

azd sẽ hỏi bạn muốn khởi tạo như thế nào. Chọn:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Chọn **"Use code in the current directory."** azd sẽ quét thư mục, phát hiện ngôn ngữ và framework, và đề xuất máy chủ Azure.

### azd phát hiện gì

azd tìm các dấu hiệu như `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, hoặc `Dockerfile`, và gợi ý máy chủ Azure tương ứng:

| Ứng dụng của bạn | Máy chủ có thể phát hiện |
|----------|----------------------|
| Ứng dụng Node.js / Python / .NET web | Azure App Service hoặc Container Apps |
| Ứng dụng đóng gói container (`Dockerfile`) | Azure Container Apps |
| Ứng dụng Function | Azure Functions |
| Website tĩnh (kết quả build React/Vue) | Azure Static Web Apps |

Xác nhận dịch vụ được phát hiện, azd sẽ tạo các file bạn cần.

---

## Bước 2: Hiểu Những Gì azd Tạo Ra

Sau khi khởi tạo, dự án của bạn sẽ có hai thứ mới:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — định nghĩa dự án

Đây là phần trung tâm của dự án azd. Một file tối giản sẽ như sau:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Khối `services` là phần quan trọng: mỗi mục ánh xạ một thư mục mã nguồn của bạn tới một máy chủ Azure. Nếu ứng dụng bạn có frontend và API, bạn sẽ có hai dịch vụ.

### `infra/` — tài nguyên Azure dưới dạng mã

Thư mục `infra/` chứa các file Bicep định nghĩa các tài nguyên Azure cần cho ứng dụng (App Service, cơ sở dữ liệu, v.v.). Bạn không phải tự viết tay—azd sẽ tạo điểm bắt đầu làm việc. Bạn *có thể* chỉnh sửa sau để thêm tài nguyên hoặc nâng cao bảo mật (hướng dẫn trong [Chương 4](../chapter-04-infrastructure/README.md)).

> **Mẹo:** Muốn xem hoặc tùy chỉnh hạ tầng được tạo ra trước khi triển khai? Chạy `azd infra generate` (cùng với lệnh `azd infra synth`) để ghi IaC ra ổ đĩa, bạn có thể xem xét và quản lý phiên bản.

---

## Bước 3: Thiết Lập Cấu Hình Cần Thiết

Nếu ứng dụng của bạn cần cài đặt hoặc bí mật (chuỗi kết nối, khóa API), đừng nhúng cứng vào mã. Dùng biến môi trường:

```bash
# Tạo một môi trường
azd env new dev

# Đặt một giá trị không bí mật
azd env set API_VERSION 1.0.0
```

Với các bí mật thật sự, lưu trữ trong Key Vault và tham chiếu từ hạ tầng—xem [Chương 3: Cấu Hình & Xác Thực](../chapter-03-configuration/authsecurity.md).

---

## Bước 4: Triển Khai

Giờ hãy dùng quy trình bạn đã biết:

```bash
# Xác thực (bắt buộc cho azd)
azd auth login

# Xem trước các tài nguyên sẽ được tạo
azd provision --preview

# Cung cấp cơ sở hạ tầng và triển khai mã của bạn
azd up
```

Khi hoàn tất, azd sẽ in URL ứng dụng của bạn. Kiểm tra nó giống như với bất kỳ ứng dụng azd nào:

```bash
azd show           # hiển thị các điểm cuối
azd monitor --logs # kiểm tra nhật ký nếu cần thiết
```

---

## Các Vấn Đề Thường Gặp Lần Đầu

| Triệu chứng | Nguyên nhân có thể | Cách sửa |
|---------|--------------|-----|
| azd không phát hiện được ứng dụng của tôi | Thiếu file manifest (ví dụ `package.json`) | Thêm file manifest, hoặc chọn máy chủ thủ công khi `azd init` |
| Build lỗi khi chạy `azd up` | Ứng dụng cần bước build | Thêm `buildCommand`/`outputPath` dưới dịch vụ trong `azure.yaml` |
| Ứng dụng khởi chạy nhưng trả lỗi | Thiếu cấu hình/bí mật | Thiết lập bằng `azd env set` hoặc kết nối Key Vault |
| Chọn sai máy chủ | Tự động phát hiện đoán sai | Chỉnh sửa `host:` trong `azure.yaml` và chạy lại `azd up` |

Thêm chi tiết xem [Chương 7: Khắc Phục Sự Cố](../chapter-07-troubleshooting/README.md).

---

## Dọn Dẹp

```bash
azd down --force --purge
```

---

## Tóm tắt

- `azd init` → **"Use code in the current directory"** thêm azd vào dự án bạn đã có.
- `azure.yaml` ánh xạ thư mục mã của bạn tới các máy chủ Azure; `infra/` định nghĩa tài nguyên dưới dạng Bicep.
- `azd infra generate` cho phép xem lại hoặc tùy chỉnh hạ tầng đã tạo.
- Khi đã khởi tạo, ứng dụng hiện có dùng cùng quy trình `azd up` / `azd down` như ứng dụng tạo từ mẫu.

---

## 🔗 Điều hướng

| Hướng | Bài học |
|-----------|--------|
| **Trước** | [Dự Án Đầu Tiên Của Bạn](first-project.md) |
| **Tiếp** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Tài nguyên liên quan

- [Cơ bản về AZD](azd-basics.md)
- [Chương 4: Hạ tầng như Mã](../chapter-04-infrastructure/README.md)
- [Cấu hình & Xác thực](../chapter-03-configuration/authsecurity.md)
- [Tổng hợp Lệnh](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->