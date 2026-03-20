# Hướng Dẫn Cài Đặt & Thiết Lập

**Chapter Navigation:**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới](../../README.md)
- **📖 Chương Hiện Tại**: Chapter 1 - Foundation & Quick Start
- **⬅️ Trước**: [AZD Cơ bản](azd-basics.md)
- **➡️ Tiếp theo**: [Dự Án Đầu Tiên Của Bạn](first-project.md)
- **🚀 Chương tiếp theo**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giới thiệu

Hướng dẫn toàn diện này sẽ hướng dẫn bạn cách cài đặt và cấu hình Azure Developer CLI (azd) trên hệ thống của bạn. Bạn sẽ học nhiều phương thức cài đặt cho các hệ điều hành khác nhau, thiết lập xác thực và cấu hình ban đầu để chuẩn bị môi trường phát triển cho việc triển khai lên Azure.

## Mục Tiêu Học Tập

Khi kết thúc bài học này, bạn sẽ:
- Cài đặt thành công Azure Developer CLI trên hệ điều hành của bạn
- Cấu hình xác thực với Azure bằng nhiều phương thức
- Thiết lập môi trường phát triển với các yêu cầu cần thiết
- Hiểu các tùy chọn cài đặt khác nhau và khi nào nên dùng mỗi cách
- Khắc phục các sự cố cài đặt và thiết lập phổ biến

## Kết Quả Học Tập

Sau khi hoàn thành bài học này, bạn sẽ có khả năng:
- Cài đặt azd bằng phương pháp phù hợp cho nền tảng của bạn
- Xác thực với Azure bằng azd auth login
- Xác minh cài đặt và kiểm tra các lệnh azd cơ bản
- Cấu hình môi trường phát triển để sử dụng azd một cách tối ưu
- Tự giải quyết các vấn đề cài đặt phổ biến

Hướng dẫn này sẽ giúp bạn cài đặt và cấu hình Azure Developer CLI trên hệ thống của mình, bất kể hệ điều hành hoặc môi trường phát triển bạn đang sử dụng.

## Yêu Cầu Tiên Quyết

Trước khi cài đặt azd, đảm bảo bạn có:
- **Đăng ký Azure** - [Tạo tài khoản miễn phí](https://azure.microsoft.com/free/)
- **Azure CLI** - Dùng cho xác thực và quản lý tài nguyên
- **Git** - Dùng để clone mẫu và quản lý phiên bản
- **Docker** (tùy chọn) - Cho các ứng dụng container

## Phương Pháp Cài Đặt

### Windows

#### Tùy chọn 1: PowerShell (Khuyến nghị)
```powershell
# Chạy với quyền quản trị viên hoặc với quyền nâng cao
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
# Thêm kho lưu trữ gói của Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Cài đặt azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Thêm kho lưu trữ gói của Microsoft
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

**Lưu ý**: Số phiên bản thực tế sẽ khác nhau. Kiểm tra [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) để biết phiên bản mới nhất.

**✅ Danh sách kiểm tra cài đặt thành công:**
- [ ] `azd version` hiển thị số phiên bản không có lỗi
- [ ] `azd --help` hiển thị tài liệu lệnh
- [ ] `azd template list` hiển thị các mẫu có sẵn
- [ ] `az account show` hiển thị đăng ký Azure của bạn
- [ ] Bạn có thể tạo một thư mục thử nghiệm và chạy `azd init` thành công

**Nếu tất cả kiểm tra đều đạt, bạn đã sẵn sàng chuyển sang [Dự Án Đầu Tiên Của Bạn](first-project.md)!**

## Thiết Lập Xác Thực

### Xác thực bằng Azure CLI (Khuyến nghị)
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
Nếu bạn đang dùng hệ thống không có giao diện đồ họa hoặc gặp sự cố trình duyệt:
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

# Xem tất cả cấu hình
azd config list
```

### Biến môi trường
Thêm vào cấu hình shell của bạn (`.bashrc`, `.zshrc`, `.profile`):
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
1. Cài đặt plugin Azure
2. Cấu hình thông tin xác thực Azure
3. Sử dụng terminal tích hợp để chạy các lệnh azd

## 🐛 Khắc phục Sự cố Cài đặt

### Các Sự cố Thường gặp

#### Không có quyền (Windows)
```powershell
# Chạy PowerShell với quyền quản trị viên
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Sự cố PATH
Thêm azd vào PATH thủ công:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Sự cố Mạng/Proxy
```bash
# Cấu hình proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Bỏ qua kiểm tra SSL (không được khuyến nghị cho môi trường sản xuất)
azd config set http.insecure true
```

#### Xung đột Phiên bản
```bash
# Gỡ bỏ cài đặt cũ
# Windows: chạy winget uninstall Microsoft.Azd
# macOS: chạy brew uninstall azd
# Linux: chạy sudo apt remove azd

# Dọn dẹp cấu hình
rm -rf ~/.azd
```

### Tìm trợ giúp thêm
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

### Cập nhật Tự động
azd sẽ thông báo khi có bản cập nhật:
```bash
azd version --check-for-updates
```

### Cập nhật Thủ công

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

## 💡 Câu Hỏi Thường Gặp

<details>
<summary><strong>Sự khác biệt giữa azd và az CLI là gì?</strong></summary>

**Azure CLI (az)**: Công cụ mức thấp để quản lý từng tài nguyên Azure
- `az webapp create`, `az storage account create`
- Một tài nguyên tại một thời điểm
- Tập trung vào quản lý hạ tầng

**Azure Developer CLI (azd)**: Công cụ mức cao để triển khai ứng dụng hoàn chỉnh
- `azd up` triển khai toàn bộ ứng dụng cùng tất cả tài nguyên
- Quy trình làm việc dựa trên mẫu
- Tập trung vào năng suất cho nhà phát triển

**Bạn cần cả hai**: azd sử dụng az CLI cho xác thực
</details>

<details>
<summary><strong>Tôi có thể dùng azd với các tài nguyên Azure hiện có không?</strong></summary>

Có! Bạn có thể:
1. Nhập các tài nguyên hiện có vào môi trường azd
2. Tham chiếu các tài nguyên hiện có trong các template Bicep của bạn
3. Sử dụng azd cho các triển khai mới cùng với hạ tầng hiện có

Xem [Hướng dẫn Cấu hình](configuration.md) để biết chi tiết.
</details>

<details>
<summary><strong>azd có làm việc với Azure Government hoặc Azure China không?</strong></summary>

Có, cấu hình cloud:
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
<summary><strong>Tôi có thể dùng azd trong pipeline CI/CD không?</strong></summary>

Chắc chắn! azd được thiết kế cho tự động hóa:
- Tích hợp với GitHub Actions
- Hỗ trợ Azure DevOps
- Xác thực bằng service principal
- Chế độ không tương tác

Xem [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) để biết các mẫu CI/CD.
</details>

<details>
<summary><strong>Chi phí khi dùng azd là bao nhiêu?</strong></summary>

azd tự nó là **hoàn toàn miễn phí** và mã nguồn mở. Bạn chỉ phải trả cho:
- Các tài nguyên Azure bạn triển khai
- Chi phí tiêu thụ Azure (compute, storage, v.v.)

Sử dụng `azd provision --preview` để ước tính chi phí trước khi triển khai.
</details>

## Bước tiếp theo

1. **Hoàn tất xác thực**: Đảm bảo bạn có thể truy cập đăng ký Azure của mình
2. **Thử triển khai đầu tiên**: Làm theo [First Project Guide](first-project.md)
3. **Khám phá các mẫu**: Duyệt các mẫu có sẵn bằng `azd template list`
4. **Cấu hình IDE của bạn**: Thiết lập môi trường phát triển

## Hỗ trợ

Nếu bạn gặp vấn đề:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Nhận hướng dẫn các lệnh Azure trực tiếp trong trình soạn thảo của bạn với `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới](../../README.md)
- **📖 Chương Hiện Tại**: Chapter 1 - Foundation & Quick Start
- **⬅️ Trước**: [AZD Cơ bản](azd-basics.md) 
- **➡️ Tiếp theo**: [Dự Án Đầu Tiên Của Bạn](first-project.md)
- **🚀 Chương tiếp theo**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Cài đặt hoàn tất!** Tiếp tục đến [Dự Án Đầu Tiên Của Bạn](first-project.md) để bắt đầu xây dựng với azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->