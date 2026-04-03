# Hướng dẫn Cài đặt & Thiết lập

**Điều hướng Chương:**
- **📚 Trang khóa học**: [AZD cho Người Mới](../../README.md)
- **📖 Chương hiện tại**: Chương 1 - Nền tảng & Bắt đầu Nhanh
- **⬅️ Trước**: [AZD Basics](azd-basics.md)
- **➡️ Tiếp theo**: [Dự án đầu tiên của bạn](first-project.md)
- **🚀 Chương tiếp theo**: [Chương 2: Phát triển ưu tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giới thiệu

Hướng dẫn toàn diện này sẽ hướng dẫn bạn cách cài đặt và cấu hình Azure Developer CLI (azd) trên hệ thống của bạn. Bạn sẽ học nhiều phương pháp cài đặt cho các hệ điều hành khác nhau, thiết lập xác thực và cấu hình ban đầu để chuẩn bị môi trường phát triển cho việc triển khai lên Azure.

## Mục tiêu học tập

Kết thúc bài học này, bạn sẽ:
- Cài đặt thành công Azure Developer CLI trên hệ điều hành của bạn
- Cấu hình xác thực với Azure bằng nhiều phương pháp
- Thiết lập môi trường phát triển với các tiền đề cần thiết
- Hiểu các tùy chọn cài đặt khác nhau và khi nào nên dùng mỗi tùy chọn
- Gỡ lỗi các vấn đề cài đặt và thiết lập phổ biến

## Kết quả học tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Cài đặt azd bằng phương pháp phù hợp với nền tảng của bạn
- Xác thực với Azure bằng `azd auth login`
- Xác minh cài đặt và kiểm tra các lệnh azd cơ bản
- Cấu hình môi trường phát triển để sử dụng azd tối ưu
- Tự giải quyết các vấn đề cài đặt phổ biến

Hướng dẫn này sẽ giúp bạn cài đặt và cấu hình Azure Developer CLI trên hệ thống của bạn, bất kể hệ điều hành hoặc môi trường phát triển.

## Yêu cầu trước

Trước khi cài đặt azd, đảm bảo bạn có:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Để xác thực và quản lý tài nguyên
- **Git** - Để clone mẫu và quản lý phiên bản
- **Docker** (tùy chọn) - Cho ứng dụng đóng gói container

## Các phương thức cài đặt

### Windows

#### Tùy chọn 1: Windows Package Manager (Được khuyến nghị)
```cmd
winget install microsoft.azd
```

#### Tùy chọn 2: PowerShell Install Script
```powershell
# Hữu ích khi winget không khả dụng
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Tùy chọn 3: Chocolatey
```cmd
choco install azd
```

#### Tùy chọn 4: Cài đặt thủ công
1. Tải bản phát hành mới nhất từ [GitHub](https://github.com/Azure/azure-dev/releases)
2. Giải nén vào `C:\Program Files\azd\`
3. Thêm vào biến môi trường PATH

### macOS

#### Tùy chọn 1: Homebrew (Được khuyến nghị)
```bash
brew tap azure/azd
brew install azd
```

#### Tùy chọn 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Tùy chọn 3: Cài đặt thủ công
```bash
# Tải xuống và cài đặt
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Tùy chọn 1: Install Script (Được khuyến nghị)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Tùy chọn 2: Package Managers

**Cài đặt thủ công từ release assets:**
```bash
# Tải xuống tệp lưu trữ mới nhất cho kiến trúc Linux của bạn từ:
# https://github.com/Azure/azure-dev/releases
# Sau đó giải nén nó và thêm tệp nhị phân azd vào PATH của bạn.
```

### GitHub Codespaces

Một số Codespaces và môi trường dev container đã bao gồm `azd`, nhưng bạn nên kiểm tra thay vì giả định:

```bash
azd version
```

Nếu `azd` thiếu, hãy cài đặt nó bằng script chuẩn cho môi trường.

### Docker

```bash
# Chạy azd trong một container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Tạo bí danh để sử dụng dễ dàng hơn
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Xác minh cài đặt

Sau khi cài đặt, xác minh azd hoạt động đúng:

```bash
# Kiểm tra phiên bản
azd version

# Xem trợ giúp
azd --help

# Liệt kê các mẫu có sẵn
azd template list
```

Kết quả mong đợi:
```
azd version 1.x.x (commit xxxxxx)
```

**Lưu ý**: Số phiên bản thực tế sẽ khác nhau. Kiểm tra [Các bản phát hành Azure Developer CLI](https://github.com/Azure/azure-dev/releases) để biết phiên bản mới nhất.

**✅ Danh sách kiểm tra cài đặt thành công:**
- [ ] `azd version` hiển thị số phiên bản mà không báo lỗi
- [ ] `azd --help` hiển thị tài liệu lệnh
- [ ] `azd template list` hiển thị các mẫu có sẵn
- [ ] Bạn có thể tạo một thư mục thử nghiệm và chạy `azd init` thành công

**Nếu tất cả kiểm tra đều thành công, bạn đã sẵn sàng chuyển sang [Dự án đầu tiên của bạn](first-project.md)!**

## Cài đặt xác thực

### Cấu hình đề xuất cho người mới

Đối với luồng công việc ưu tiên AZD, đăng nhập bằng `azd auth login`.

```bash
# Cần thiết cho các lệnh AZD như azd up
azd auth login

# Xác minh trạng thái xác thực AZD
azd auth login --check-status
```

Chỉ sử dụng đăng nhập Azure CLI khi bạn dự định chạy các lệnh `az` trong khóa học.

### Xác thực bằng Azure CLI (Tùy chọn)
```bash
# Cài đặt Azure CLI nếu chưa được cài đặt
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: xem tài liệu cài đặt Azure CLI cho bản phân phối của bạn

# Đăng nhập vào Azure
az login

# Xác minh xác thực
az account show
```

### Bạn nên sử dụng luồng đăng nhập nào?

- Sử dụng `azd auth login` nếu bạn đang theo lộ trình AZD cho người mới và chủ yếu chạy các lệnh `azd`.
- Cũng sử dụng `az login` khi bạn muốn chạy các lệnh Azure CLI như `az account show` hoặc kiểm tra tài nguyên trực tiếp.
- Nếu một bài tập bao gồm cả lệnh `azd` và `az`, hãy chạy cả hai lệnh đăng nhập một lần ở đầu buổi.

### Xác thực bằng Device Code
Nếu bạn đang ở trên hệ thống không có giao diện đồ họa hoặc gặp sự cố trình duyệt:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Cho môi trường tự động:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Xác thực cấu hình hoàn chỉnh của bạn

Nếu bạn muốn kiểm tra nhanh trước khi bắt đầu Chương 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Cấu hình

### Cấu hình toàn cục
```bash
# Đặt đăng ký mặc định
azd config set defaults.subscription <subscription-id>

# Đặt vị trí mặc định
azd config set defaults.location eastus2

# Xem tất cả cấu hình
azd config show
```

### Biến môi trường
Thêm vào profile shell của bạn (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Cấu hình Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Cấu hình azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Bật ghi nhật ký gỡ lỗi
```

## Tích hợp IDE

### Visual Studio Code
Cài tiện ích mở rộng Azure Developer CLI:
1. Mở VS Code
2. Vào Extensions (Ctrl+Shift+X)
3. Tìm "Azure Developer CLI"
4. Cài tiện ích mở rộng

Tính năng:
- IntelliSense cho azure.yaml
- Lệnh terminal tích hợp
- Duyệt mẫu
- Giám sát triển khai

### GitHub Codespaces
Tạo một `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Cài plugin Azure
2. Cấu hình thông tin xác thực Azure
3. Sử dụng terminal tích hợp cho các lệnh azd

## 🐛 Gỡ lỗi cài đặt

### Các lỗi phổ biến

#### Quyền bị từ chối (Windows)
```powershell
# Chạy PowerShell với quyền quản trị viên
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Vấn đề PATH
Thêm azd vào PATH của bạn thủ công:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Vấn đề Mạng/Proxy
```bash
# Cấu hình proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Bỏ qua xác thực SSL (không khuyến nghị cho môi trường sản xuất)
azd config set http.insecure true
```

#### Xung đột phiên bản
```bash
# Gỡ bỏ các cài đặt cũ
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: xóa tệp nhị phân azd cũ hoặc liên kết tượng trưng trước khi cài lại

# Dọn dẹp cấu hình
rm -rf ~/.azd
```

### Tìm thêm trợ giúp
```bash
# Bật ghi nhật ký gỡ lỗi
export AZD_DEBUG=true
azd <command> --debug

# Xem cấu hình hiện tại
azd config show

# Xem trạng thái triển khai hiện tại
azd show
```

## Cập nhật azd

### Kiểm tra cập nhật
azd cảnh báo khi có bản phát hành mới hơn, và bạn có thể xác nhận build hiện tại với:
```bash
azd version
```

### Cập nhật thủ công

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Câu hỏi thường gặp

<details>
<summary><strong>Sự khác biệt giữa azd và az CLI là gì?</strong></summary>

**Azure CLI (az)**: Công cụ cấp thấp để quản lý từng tài nguyên Azure
- `az webapp create`, `az storage account create`
- Một tài nguyên tại một thời điểm
- Tập trung quản lý hạ tầng

**Azure Developer CLI (azd)**: Công cụ cấp cao cho triển khai toàn bộ ứng dụng
- `azd up` triển khai toàn bộ ứng dụng với tất cả tài nguyên
- Quy trình dựa trên mẫu
- Tập trung vào năng suất cho nhà phát triển

**Bạn cần cả hai**: azd sử dụng az CLI cho xác thực
</details>

<details>
<summary><strong>Tôi có thể sử dụng azd với các tài nguyên Azure hiện có không?</strong></summary>

Có! Bạn có thể:
1. Nhập các tài nguyên hiện có vào các môi trường azd
2. Tham chiếu tài nguyên hiện có trong các mẫu Bicep của bạn
3. Sử dụng azd để triển khai mới cùng với hạ tầng hiện có

Xem [Hướng dẫn Cấu hình](configuration.md) để biết chi tiết.
</details>

<details>
<summary><strong>azd có hoạt động với Azure Government hoặc Azure China không?</strong></summary>

Có — cấu hình cloud:
```bash
# Azure Chính phủ
az cloud set --name AzureUSGovernment
az login

# Azure Trung Quốc
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Tôi có thể sử dụng azd trong pipeline CI/CD không?</strong></summary>

Chắc chắn! azd được thiết kế cho tự động hóa:
- Tích hợp GitHub Actions
- Hỗ trợ Azure DevOps
- Xác thực bằng service principal
- Chế độ không tương tác

Xem [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) để biết các mẫu CI/CD.
</details>

<details>
<summary><strong>Chi phí khi sử dụng azd là bao nhiêu?</strong></summary>

azd tự nó là **hoàn toàn miễn phí** và mã nguồn mở. Bạn chỉ trả cho:
- Các tài nguyên Azure bạn triển khai
- Chi phí sử dụng Azure (compute, storage, v.v.)

Sử dụng `azd provision --preview` để ước tính chi phí trước khi triển khai.
</details>

## Bước tiếp theo

1. **Hoàn thành xác thực**: Đảm bảo bạn có thể truy cập subscription Azure của mình
2. **Thử triển khai đầu tiên**: Làm theo [Hướng dẫn Dự án Đầu tiên](first-project.md)
3. **Khám phá mẫu**: Duyệt các mẫu có sẵn với `azd template list`
4. **Cấu hình IDE của bạn**: Thiết lập môi trường phát triển

## Hỗ trợ

Nếu bạn gặp sự cố:
- [Tài liệu chính thức](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Báo cáo sự cố](https://github.com/Azure/azure-dev/issues)
- [Thảo luận cộng đồng](https://github.com/Azure/azure-dev/discussions)
- [Hỗ trợ Azure](https://azure.microsoft.com/support/)
- [**Kỹ năng Azure Agent**](https://skills.sh/microsoft/github-copilot-for-azure) - Nhận hướng dẫn lệnh Azure trực tiếp trong trình soạn thảo của bạn với `npx skills add microsoft/github-copilot-for-azure`

---

**Điều hướng Chương:**
- **📚 Trang khóa học**: [AZD cho Người Mới](../../README.md)
- **📖 Chương hiện tại**: Chương 1 - Nền tảng & Bắt đầu Nhanh
- **⬅️ Trước**: [AZD Basics](azd-basics.md) 
- **➡️ Tiếp theo**: [Dự án đầu tiên của bạn](first-project.md)
- **🚀 Chương tiếp theo**: [Chương 2: Phát triển ưu tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Cài đặt hoàn tất!** Tiếp tục đến [Dự án đầu tiên của bạn](first-project.md) để bắt đầu xây dựng với azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Văn bản này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ ban đầu nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, khuyên bạn nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->