<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-09T21:28:53+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "vi"
}
-->
# Hướng Dẫn Cài Đặt & Thiết Lập

## Giới Thiệu

Hướng dẫn toàn diện này sẽ giúp bạn cài đặt và cấu hình Azure Developer CLI (azd) trên hệ thống của mình. Bạn sẽ học các phương pháp cài đặt khác nhau cho từng hệ điều hành, thiết lập xác thực, và cấu hình ban đầu để chuẩn bị môi trường phát triển cho việc triển khai Azure.

## Mục Tiêu Học Tập

Sau khi hoàn thành bài học này, bạn sẽ:
- Cài đặt thành công Azure Developer CLI trên hệ điều hành của mình
- Cấu hình xác thực với Azure bằng nhiều phương pháp
- Thiết lập môi trường phát triển với các yêu cầu cần thiết
- Hiểu các tùy chọn cài đặt khác nhau và khi nào nên sử dụng từng tùy chọn
- Khắc phục các vấn đề thường gặp trong quá trình cài đặt và thiết lập

## Kết Quả Học Tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Cài đặt azd bằng phương pháp phù hợp với nền tảng của bạn
- Xác thực với Azure bằng lệnh `azd auth login`
- Kiểm tra cài đặt và thử nghiệm các lệnh cơ bản của azd
- Cấu hình môi trường phát triển để sử dụng azd hiệu quả
- Tự giải quyết các vấn đề cài đặt phổ biến

Hướng dẫn này sẽ giúp bạn cài đặt và cấu hình Azure Developer CLI trên hệ thống của mình, bất kể hệ điều hành hay môi trường phát triển của bạn.

## Yêu Cầu Trước

Trước khi cài đặt azd, hãy đảm bảo bạn có:
- **Đăng ký Azure** - [Tạo tài khoản miễn phí](https://azure.microsoft.com/free/)
- **Azure CLI** - Để xác thực và quản lý tài nguyên
- **Git** - Để sao chép mẫu và kiểm soát phiên bản
- **Docker** (tùy chọn) - Dành cho các ứng dụng container hóa

## Phương Pháp Cài Đặt

### Windows

#### Tùy Chọn 1: PowerShell (Khuyến nghị)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Tùy Chọn 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Tùy Chọn 3: Chocolatey
```cmd
choco install azd
```

#### Tùy Chọn 4: Cài Đặt Thủ Công
1. Tải xuống phiên bản mới nhất từ [GitHub](https://github.com/Azure/azure-dev/releases)
2. Giải nén vào `C:\Program Files\azd\`
3. Thêm vào biến môi trường PATH

### macOS

#### Tùy Chọn 1: Homebrew (Khuyến nghị)
```bash
brew tap azure/azd
brew install azd
```

#### Tùy Chọn 2: Script Cài Đặt
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Tùy Chọn 3: Cài Đặt Thủ Công
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Tùy Chọn 1: Script Cài Đặt (Khuyến nghị)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Tùy Chọn 2: Trình Quản Lý Gói

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

## ✅ Kiểm Tra Cài Đặt

Sau khi cài đặt, kiểm tra azd hoạt động đúng cách:

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

## 🔐 Thiết Lập Xác Thực

### Xác Thực Azure CLI (Khuyến nghị)
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

### Xác Thực Bằng Mã Thiết Bị
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

## 🛠️ Cấu Hình

### Cấu Hình Toàn Cục
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Biến Môi Trường
Thêm vào profile shell của bạn (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 Tích Hợp IDE

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
Tạo file `.devcontainer/devcontainer.json`:
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
3. Sử dụng terminal tích hợp để chạy lệnh azd

## 🐛 Khắc Phục Sự Cố Cài Đặt

### Các Vấn Đề Thường Gặp

#### Quyền Bị Từ Chối (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Vấn Đề PATH
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

#### Vấn Đề Mạng/Proxy
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Xung Đột Phiên Bản
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Nhận Thêm Hỗ Trợ
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Cập Nhật azd

### Cập Nhật Tự Động
azd sẽ thông báo khi có bản cập nhật mới:
```bash
azd version --check-for-updates
```

### Cập Nhật Thủ Công

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

## Bước Tiếp Theo

1. **Hoàn thành xác thực**: Đảm bảo bạn có thể truy cập đăng ký Azure của mình
2. **Thử triển khai đầu tiên**: Làm theo [Hướng Dẫn Dự Án Đầu Tiên](first-project.md)
3. **Khám phá mẫu**: Duyệt các mẫu có sẵn với `azd template list`
4. **Cấu hình IDE của bạn**: Thiết lập môi trường phát triển

## Hỗ Trợ

Nếu bạn gặp vấn đề:
- [Tài liệu chính thức](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Báo cáo vấn đề](https://github.com/Azure/azure-dev/issues)
- [Thảo luận cộng đồng](https://github.com/Azure/azure-dev/discussions)
- [Hỗ trợ Azure](https://azure.microsoft.com/support/)

---

**Điều Hướng**
- **Bài Học Trước**: [Cơ Bản về AZD](azd-basics.md)
- **Bài Học Tiếp Theo**: [Cấu Hình](configuration.md)

**Cài Đặt Hoàn Tất!** Tiếp tục đến [Dự Án Đầu Tiên của Bạn](first-project.md) để bắt đầu xây dựng với azd.

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp từ con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.