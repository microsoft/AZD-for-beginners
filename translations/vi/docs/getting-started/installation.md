# Hướng dẫn cài đặt & thiết lập

**Điều hướng chương:**
- **📚 Trang chủ khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương hiện tại**: Chương 1 - Nền tảng & Bắt đầu nhanh
- **⬅️ Trước đó**: [AZD Basics](azd-basics.md)
- **➡️ Tiếp theo**: [Dự án đầu tiên của bạn](first-project.md)
- **🚀 Chương tiếp theo**: [Chương 2: Phát triển ưu tiên AI](../microsoft-foundry/microsoft-foundry-integration.md)

## Giới thiệu

Hướng dẫn toàn diện này sẽ giúp bạn cài đặt và cấu hình Azure Developer CLI (azd) trên hệ thống của mình. Bạn sẽ học các phương pháp cài đặt khác nhau cho các hệ điều hành, thiết lập xác thực và cấu hình ban đầu để chuẩn bị môi trường phát triển cho việc triển khai Azure.

## Mục tiêu học tập

Sau khi hoàn thành bài học này, bạn sẽ:
- Cài đặt thành công Azure Developer CLI trên hệ điều hành của mình
- Cấu hình xác thực với Azure bằng nhiều phương pháp
- Thiết lập môi trường phát triển với các yêu cầu cần thiết
- Hiểu các tùy chọn cài đặt khác nhau và khi nào nên sử dụng từng tùy chọn
- Khắc phục các vấn đề thường gặp trong quá trình cài đặt và thiết lập

## Kết quả học tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Cài đặt azd bằng phương pháp phù hợp với nền tảng của bạn
- Xác thực với Azure bằng lệnh `azd auth login`
- Kiểm tra cài đặt và thử các lệnh cơ bản của azd
- Cấu hình môi trường phát triển để sử dụng azd hiệu quả
- Tự giải quyết các vấn đề cài đặt phổ biến

Hướng dẫn này sẽ giúp bạn cài đặt và cấu hình Azure Developer CLI trên hệ thống của mình, bất kể hệ điều hành hay môi trường phát triển của bạn.

## Yêu cầu trước

Trước khi cài đặt azd, hãy đảm bảo bạn có:
- **Đăng ký Azure** - [Tạo tài khoản miễn phí](https://azure.microsoft.com/free/)
- **Azure CLI** - Dùng để xác thực và quản lý tài nguyên
- **Git** - Dùng để sao chép mẫu và kiểm soát phiên bản
- **Docker** (tùy chọn) - Dùng cho các ứng dụng container hóa

## Phương pháp cài đặt

### Windows

#### Tùy chọn 1: PowerShell (Khuyến nghị)
```powershell
# Chạy với quyền Quản trị viên hoặc quyền nâng cao
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Tùy chọn 2: Trình quản lý gói Windows (winget)
```cmd
winget install Microsoft.Azd
```

#### Tùy chọn 3: Chocolatey
```cmd
choco install azd
```

#### Tùy chọn 4: Cài đặt thủ công
1. Tải xuống phiên bản mới nhất từ [GitHub](https://github.com/Azure/azure-dev/releases)
2. Giải nén vào `C:\Program Files\azd\`
3. Thêm vào biến môi trường PATH

### macOS

#### Tùy chọn 1: Homebrew (Khuyến nghị)
```bash
brew tap azure/azd
brew install azd
```

#### Tùy chọn 2: Script cài đặt
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Tùy chọn 3: Cài đặt thủ công
```bash
# Tải xuống và cài đặt
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Tùy chọn 1: Script cài đặt (Khuyến nghị)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Tùy chọn 2: Trình quản lý gói

**Ubuntu/Debian:**
```bash
# Thêm kho lưu trữ gói Microsoft
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

azd được cài đặt sẵn trong GitHub Codespaces. Chỉ cần tạo một codespace và bắt đầu sử dụng azd ngay lập tức.

### Docker

```bash
# Chạy azd trong một container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Tạo một bí danh để sử dụng dễ dàng hơn
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Xác minh cài đặt

Sau khi cài đặt, hãy kiểm tra azd hoạt động đúng:

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
azd version 1.5.0 (commit abc123)
```

**✅ Danh sách kiểm tra thành công cài đặt:**
- [ ] `azd version` hiển thị số phiên bản mà không có lỗi
- [ ] `azd --help` hiển thị tài liệu lệnh
- [ ] `azd template list` hiển thị các mẫu có sẵn
- [ ] `az account show` hiển thị đăng ký Azure của bạn
- [ ] Bạn có thể tạo một thư mục thử nghiệm và chạy `azd init` thành công

**Nếu tất cả các kiểm tra đều đạt, bạn đã sẵn sàng tiếp tục đến [Dự án đầu tiên của bạn](first-project.md)!**

## Thiết lập xác thực

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
Nếu bạn đang sử dụng hệ thống không có giao diện hoặc gặp vấn đề với trình duyệt:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Dành cho môi trường tự động:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Cấu hình

### Cấu hình toàn cầu
```bash
# Đặt đăng ký mặc định
azd config set defaults.subscription <subscription-id>

# Đặt vị trí mặc định
azd config set defaults.location eastus2

# Xem tất cả cấu hình
azd config list
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
Cài đặt tiện ích mở rộng Azure Developer CLI:
1. Mở VS Code
2. Đi đến Extensions (Ctrl+Shift+X)
3. Tìm kiếm "Azure Developer CLI"
4. Cài đặt tiện ích mở rộng

Tính năng:
- IntelliSense cho azure.yaml
- Lệnh tích hợp trong terminal
- Duyệt mẫu
- Theo dõi triển khai

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

#### Quyền bị từ chối (Windows)
```powershell
# Chạy PowerShell với quyền Quản trị viên
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Vấn đề PATH
Thêm azd vào PATH một cách thủ công:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Vấn đề mạng/Proxy
```bash
# Cấu hình proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Bỏ qua xác minh SSL (không khuyến nghị cho môi trường sản xuất)
azd config set http.insecure true
```

#### Xung đột phiên bản
```bash
# Gỡ cài đặt cũ
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Dọn dẹp cấu hình
rm -rf ~/.azd
```

### Nhận thêm trợ giúp
```bash
# Bật ghi nhật ký gỡ lỗi
export AZD_DEBUG=true
azd <command> --debug

# Xem nhật ký chi tiết
azd logs

# Kiểm tra thông tin hệ thống
azd info
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
- Tập trung vào quản lý hạ tầng

**Azure Developer CLI (azd)**: Công cụ cấp cao để triển khai toàn bộ ứng dụng
- `azd up` triển khai toàn bộ ứng dụng với tất cả tài nguyên
- Quy trình dựa trên mẫu
- Tập trung vào năng suất của nhà phát triển

**Bạn cần cả hai**: azd sử dụng az CLI để xác thực
</details>

<details>
<summary><strong>Tôi có thể sử dụng azd với các tài nguyên Azure hiện có không?</strong></summary>

Có! Bạn có thể:
1. Nhập các tài nguyên hiện có vào môi trường azd
2. Tham chiếu các tài nguyên hiện có trong mẫu Bicep của bạn
3. Sử dụng azd cho các triển khai mới cùng với hạ tầng hiện có

Xem [Hướng dẫn cấu hình](configuration.md) để biết chi tiết.
</details>

<details>
<summary><strong>azd có hoạt động với Azure Government hoặc Azure China không?</strong></summary>

Có, cấu hình đám mây:
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
<summary><strong>Tôi có thể sử dụng azd trong các pipeline CI/CD không?</strong></summary>

Chắc chắn! azd được thiết kế cho tự động hóa:
- Tích hợp GitHub Actions
- Hỗ trợ Azure DevOps
- Xác thực bằng service principal
- Chế độ không tương tác

Xem [Hướng dẫn triển khai](../deployment/deployment-guide.md) để biết các mẫu CI/CD.
</details>

<details>
<summary><strong>Chi phí sử dụng azd là bao nhiêu?</strong></summary>

azd bản thân nó **hoàn toàn miễn phí** và mã nguồn mở. Bạn chỉ phải trả cho:
- Tài nguyên Azure bạn triển khai
- Chi phí tiêu thụ Azure (tính toán, lưu trữ, v.v.)

Sử dụng `azd provision --preview` để ước tính chi phí trước khi triển khai.
</details>

## Bước tiếp theo

1. **Hoàn thành xác thực**: Đảm bảo bạn có thể truy cập đăng ký Azure của mình
2. **Thử triển khai đầu tiên**: Làm theo [Hướng dẫn dự án đầu tiên](first-project.md)
3. **Khám phá mẫu**: Duyệt các mẫu có sẵn với `azd template list`
4. **Cấu hình IDE của bạn**: Thiết lập môi trường phát triển

## Hỗ trợ

Nếu bạn gặp vấn đề:
- [Tài liệu chính thức](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Báo cáo vấn đề](https://github.com/Azure/azure-dev/issues)
- [Thảo luận cộng đồng](https://github.com/Azure/azure-dev/discussions)
- [Hỗ trợ Azure](https://azure.microsoft.com/support/)

---

**Điều hướng chương:**
- **📚 Trang chủ khóa học**: [AZD For Beginners](../../README.md)
- **📖 Chương hiện tại**: Chương 1 - Nền tảng & Bắt đầu nhanh
- **⬅️ Trước đó**: [AZD Basics](azd-basics.md) 
- **➡️ Tiếp theo**: [Dự án đầu tiên của bạn](first-project.md)
- **🚀 Chương tiếp theo**: [Chương 2: Phát triển ưu tiên AI](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Cài đặt hoàn tất!** Tiếp tục đến [Dự án đầu tiên của bạn](first-project.md) để bắt đầu xây dựng với azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->