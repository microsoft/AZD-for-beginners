<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T21:21:52+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "vi"
}
-->
# Hướng dẫn cài đặt & thiết lập

**Trước:** [Tài liệu chính](../../README.md) | **Tiếp theo:** [Cơ bản về AZD](azd-basics.md)

## Giới thiệu

Hướng dẫn toàn diện này sẽ giúp bạn cài đặt và cấu hình Azure Developer CLI (azd) trên hệ thống của mình. Bạn sẽ học các phương pháp cài đặt khác nhau cho từng hệ điều hành, thiết lập xác thực và cấu hình ban đầu để chuẩn bị môi trường phát triển cho việc triển khai Azure.

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
- Kiểm tra cài đặt và thử nghiệm các lệnh cơ bản của azd
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
# Run as Administrator or with elevated privileges
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
# Download and install
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
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd được cài đặt sẵn trong GitHub Codespaces. Chỉ cần tạo một codespace và bắt đầu sử dụng azd ngay lập tức.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Xác minh cài đặt

Sau khi cài đặt, hãy kiểm tra azd hoạt động đúng cách:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Kết quả mong đợi:
```
azd version 1.5.0 (commit abc123)
```

## Thiết lập xác thực

### Xác thực Azure CLI (Khuyến nghị)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Xác thực bằng mã thiết bị
Nếu bạn đang sử dụng hệ thống không có giao diện hoặc gặp vấn đề với trình duyệt:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Dành cho môi trường tự động hóa:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Cấu hình

### Cấu hình toàn cục
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Biến môi trường
Thêm vào hồ sơ shell của bạn (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
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
Tạo một tệp `.devcontainer/devcontainer.json`:
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
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Vấn đề PATH
Thêm azd vào PATH theo cách thủ công:

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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Xung đột phiên bản
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Nhận thêm trợ giúp
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
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

**Trước:** [Tài liệu chính](../../README.md) | **Tiếp theo:** [Cơ bản về AZD](azd-basics.md)

**Cài đặt hoàn tất!** Tiếp tục đến [Dự án đầu tiên của bạn](first-project.md) để bắt đầu xây dựng với azd.

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.