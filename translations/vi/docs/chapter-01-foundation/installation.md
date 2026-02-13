# Hướng dẫn Cài đặt & Thiết lập

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD cho người mới](../../README.md)
- **📖 Chương hiện tại**: Chương 1 - Nền tảng & Bắt đầu nhanh
- **⬅️ Trước**: [AZD Basics](azd-basics.md)
- **➡️ Tiếp theo**: [Dự án đầu tiên của bạn](first-project.md)
- **🚀 Chương tiếp theo**: [Chương 2: Phát triển ưu tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giới thiệu

Hướng dẫn toàn diện này sẽ hướng dẫn bạn cài đặt và cấu hình Azure Developer CLI (azd) trên hệ thống của bạn. Bạn sẽ học nhiều phương pháp cài đặt cho các hệ điều hành khác nhau, thiết lập xác thực, và cấu hình ban đầu để chuẩn bị môi trường phát triển của bạn cho việc triển khai lên Azure.

## Mục tiêu học tập

Kết thúc bài học này, bạn sẽ:
- Cài đặt thành công Azure Developer CLI trên hệ điều hành của bạn
- Cấu hình xác thực với Azure bằng nhiều phương thức
- Thiết lập môi trường phát triển với các tiền đề cần thiết
- Hiểu các tùy chọn cài đặt khác nhau và khi nào nên sử dụng từng phương pháp
- Khắc phục các sự cố cài đặt và thiết lập phổ biến

## Kết quả học tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Cài đặt azd bằng phương pháp phù hợp cho nền tảng của bạn
- Xác thực với Azure bằng `azd auth login`
- Xác minh cài đặt và kiểm tra các lệnh azd cơ bản
- Cấu hình môi trường phát triển của bạn để sử dụng azd một cách tối ưu
- Tự giải quyết các vấn đề cài đặt thường gặp

Hướng dẫn này sẽ giúp bạn cài đặt và cấu hình Azure Developer CLI trên hệ thống của bạn, bất kể hệ điều hành hay môi trường phát triển của bạn là gì.

## Yêu cầu trước

Trước khi cài đặt azd, đảm bảo bạn có:
- **Đăng ký Azure** - [Tạo tài khoản miễn phí](https://azure.microsoft.com/free/)
- **Azure CLI** - Dành cho xác thực và quản lý tài nguyên
- **Git** - Dành cho việc clone mẫu và quản lý phiên bản
- **Docker** (tùy chọn) - Dành cho các ứng dụng đóng gói trong container

## Phương pháp cài đặt

### Windows

#### Tùy chọn 1: PowerShell (Khuyến nghị)
```powershell
# Chạy dưới quyền quản trị viên hoặc với quyền nâng cao
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Tùy chọn 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Tùy chọn 3: Chocolatey
```cmd
choco install azd
```

#### Tùy chọn 4: Cài đặt thủ công
1. Tải xuống bản phát hành mới nhất từ [GitHub](https://github.com/Azure/azure-dev/releases)
2. Giải nén vào `C:\Program Files\azd\`
3. Thêm vào biến môi trường PATH

### macOS

#### Tùy chọn 1: Homebrew (Khuyến nghị)
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

#### Tùy chọn 1: Install Script (Khuyến nghị)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Tùy chọn 2: Package Managers

**Ubuntu/Debian:**
```bash
# Thêm kho lưu trữ gói của Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Cài đặt azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Thêm kho lưu trữ gói Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd được cài sẵn trong GitHub Codespaces. Chỉ cần tạo một codespace và bắt đầu sử dụng azd ngay lập tức.

### Docker

```bash
# Chạy azd trong một container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Tạo một bí danh để sử dụng dễ dàng hơn
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Xác minh Cài đặt

Sau khi cài đặt, xác minh azd hoạt động chính xác:

```bash
# Kiểm tra phiên bản
azd version

# Xem trợ giúp
azd --help

# Liệt kê các mẫu có sẵn
azd template list
```

Đầu ra mong đợi:
```
azd version 1.x.x (commit xxxxxx)
```

**Ghi chú**: Số phiên bản thực tế sẽ khác nhau. Kiểm tra [Phiên bản phát hành Azure Developer CLI](https://github.com/Azure/azure-dev/releases) để biết phiên bản mới nhất.

**✅ Danh sách kiểm tra cài đặt thành công:**
- [ ] `azd version` hiển thị số phiên bản mà không có lỗi
- [ ] `azd --help` hiển thị tài liệu lệnh
- [ ] `azd template list` hiển thị các mẫu có sẵn
- [ ] `az account show` hiển thị đăng ký Azure của bạn
- [ ] Bạn có thể tạo một thư mục thử nghiệm và chạy `azd init` thành công

**Nếu tất cả kiểm tra đều thành công, bạn đã sẵn sàng tiến tới [Dự án đầu tiên của bạn](first-project.md)!**

## Thiết lập Xác thực

### Xác thực Azure CLI (Khuyến nghị)
```bash
# Cài đặt Azure CLI nếu chưa được cài đặt
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Đăng nhập vào Azure
az login

# Xác minh xác thực
az account show
```

### Xác thực bằng mã thiết bị
Nếu bạn đang sử dụng hệ thống không có giao diện đồ họa hoặc gặp sự cố trình duyệt:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Cho các môi trường tự động:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Cấu hình

### Cấu hình Toàn cục
```bash
# Đặt đăng ký mặc định
azd config set defaults.subscription <subscription-id>

# Đặt vị trí mặc định
azd config set defaults.location eastus2

# Xem toàn bộ cấu hình
azd config list
```

### Biến môi trường
Thêm vào hồ sơ shell của bạn (`.bashrc`, `.zshrc`, `.profile`):
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
Cài đặt tiện ích mở rộng Azure Developer CLI:
1. Mở VS Code
2. Vào Extensions (Ctrl+Shift+X)
3. Tìm kiếm "Azure Developer CLI"
4. Cài đặt tiện ích mở rộng

Tính năng:
- IntelliSense cho azure.yaml
- Lệnh tích hợp trong terminal
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
1. Cài đặt plugin Azure
2. Cấu hình thông tin xác thực Azure
3. Sử dụng terminal tích hợp để chạy các lệnh azd

## 🐛 Khắc phục sự cố cài đặt

### Các vấn đề thường gặp

#### Không có quyền (Windows)
```powershell
# Chạy PowerShell với quyền quản trị viên
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Vấn đề PATH
Thêm azd vào PATH của bạn bằng tay:

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

#### Xung đột Phiên bản
```bash
# Gỡ bỏ các cài đặt cũ
# Windows: dùng lệnh winget uninstall Microsoft.Azd
# macOS: dùng lệnh brew uninstall azd
# Linux: dùng lệnh sudo apt remove azd

# Dọn dẹp cấu hình
rm -rf ~/.azd
```

### Tìm thêm trợ giúp
```bash
# Bật ghi nhật ký gỡ lỗi
export AZD_DEBUG=true
azd <command> --debug

# Xem cấu hình hiện tại
azd config list

# Xem trạng thái triển khai hiện tại
azd show
```

## Cập nhật azd

### Cập nhật tự động
azd sẽ thông báo cho bạn khi có bản cập nhật:
```bash
azd version --check-for-updates
```

### Cập nhật thủ công

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
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

**Azure Developer CLI (azd)**: Công cụ cấp cao để triển khai ứng dụng hoàn chỉnh
- `azd up` triển khai toàn bộ ứng dụng cùng tất cả tài nguyên
- Quy trình làm việc dựa trên mẫu
- Tập trung vào năng suất nhà phát triển

**Bạn cần cả hai**: azd sử dụng az CLI để xác thực
</details>

<details>
<summary><strong>Tôi có thể sử dụng azd với các tài nguyên Azure hiện có không?</strong></summary>

Có! Bạn có thể:
1. Nhập các tài nguyên hiện có vào môi trường azd
2. Tham chiếu các tài nguyên hiện có trong các mẫu Bicep của bạn
3. Sử dụng azd cho các triển khai mới cùng hạ tầng hiện có

Xem [Hướng dẫn Cấu hình](configuration.md) để biết chi tiết.
</details>

<details>
<summary><strong>Azd có hoạt động với Azure Government hoặc Azure China không?</strong></summary>

Có, cấu hình cloud:
```bash
# Azure dành cho chính phủ
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

Xem [Hướng dẫn Triển khai](../chapter-04-infrastructure/deployment-guide.md) để biết các mẫu CI/CD.
</details>

<details>
<summary><strong>Chi phí khi sử dụng azd là bao nhiêu?</strong></summary>

azd tự nó **hoàn toàn miễn phí** và mã nguồn mở. Bạn chỉ phải trả cho:
- Các tài nguyên Azure mà bạn triển khai
- Chi phí tiêu thụ Azure (tính toán, lưu trữ, v.v.)

Sử dụng `azd provision --preview` để ước tính chi phí trước khi triển khai.
</details>

## Bước tiếp theo

1. **Hoàn tất xác thực**: Đảm bảo bạn có thể truy cập đăng ký Azure của mình
2. **Thử triển khai đầu tiên của bạn**: Làm theo [Hướng dẫn Dự án Đầu tiên](first-project.md)
3. **Khám phá các mẫu**: Duyệt các mẫu có sẵn bằng `azd template list`
4. **Cấu hình IDE của bạn**: Thiết lập môi trường phát triển

## Hỗ trợ

Nếu bạn gặp sự cố:
- [Tài liệu chính thức](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Báo cáo sự cố](https://github.com/Azure/azure-dev/issues)
- [Thảo luận cộng đồng](https://github.com/Azure/azure-dev/discussions)
- [Hỗ trợ Azure](https://azure.microsoft.com/support/)

---

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD cho người mới](../../README.md)
- **📖 Chương hiện tại**: Chương 1 - Nền tảng & Bắt đầu nhanh
- **⬅️ Trước**: [AZD Basics](azd-basics.md) 
- **➡️ Tiếp theo**: [Dự án đầu tiên của bạn](first-project.md)
- **🚀 Chương tiếp theo**: [Chương 2: Phát triển ưu tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Hoàn tất cài đặt!** Tiếp tục đến [Dự án đầu tiên của bạn](first-project.md) để bắt đầu xây dựng với azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn có thẩm quyền. Đối với những thông tin quan trọng, nên sử dụng bản dịch chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->