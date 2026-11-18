# Hướng Dẫn Cài Đặt & Thiết Lập

**Điều Hướng Chương:**
- **📚 Trang Khóa Học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Cơ Bản & Bắt Đầu Nhanh
- **⬅️ Trước**: [AZD Basics](azd-basics.md)
- **➡️ Tiếp Theo**: [Your First Project](first-project.md)
- **🚀 Chương Tiếp Theo**: [Chương 2: Phát Triển AI-Đầu Tiên](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giới Thiệu

Hướng dẫn toàn diện này sẽ hướng dẫn bạn cách cài đặt và cấu hình Azure Developer CLI (azd) trên hệ thống của bạn. Bạn sẽ học được nhiều phương pháp cài đặt cho các hệ điều hành khác nhau, thiết lập xác thực, và cấu hình ban đầu để chuẩn bị môi trường phát triển cho việc triển khai Azure.

## Mục Tiêu Học Tập

Khi kết thúc bài học này, bạn sẽ:
- Cài đặt thành công Azure Developer CLI trên hệ điều hành của bạn
- Cấu hình xác thực với Azure bằng nhiều phương pháp khác nhau
- Thiết lập môi trường phát triển với các yêu cầu cần thiết
- Hiểu các tùy chọn cài đặt khác nhau và khi nào nên sử dụng từng loại
- Khắc phục sự cố cài đặt và thiết lập phổ biến

## Kết Quả Học Tập

Sau khi hoàn thành bài học này, bạn sẽ có khả năng:
- Cài đặt azd bằng phương pháp phù hợp với nền tảng của bạn
- Xác thực với Azure bằng lệnh azd auth login
- Kiểm tra cài đặt của bạn và thử các lệnh cơ bản của azd
- Cấu hình môi trường phát triển để sử dụng azd hiệu quả nhất
- Tự giải quyết các vấn đề cài đặt phổ biến

Hướng dẫn này sẽ giúp bạn cài đặt và cấu hình Azure Developer CLI trên hệ thống của bạn, bất kể hệ điều hành hoặc môi trường phát triển của bạn.

## Yêu Cầu Trước

Trước khi cài đặt azd, hãy đảm bảo bạn có:
- **Đăng ký Azure** - [Tạo tài khoản miễn phí](https://azure.microsoft.com/free/)
- **Azure CLI** (tùy chọn) - Cho ví dụ chạy `az`; azd xác thực độc lập
- **Git** - Để sao chép mẫu và quản lý phiên bản
- **Docker** (tùy chọn) - Cho ứng dụng đóng gói trong container

**Lộ trình Foundry GA Chương 2:** Dùng AZD **1.37.0 trở lên**, cài đặt gói với `azd ext install microsoft.foundry`, và sử dụng Python **3.13+** và phiên bản **uv** hiện tại cho mẫu hosted-agent. Chế độ triển khai mã của nó xây dựng từ xa, nên không yêu cầu xây dựng Docker cục bộ. Các quyền Foundry, sẵn có mô hình theo vùng và hạn mức vẫn cần; xem [cài đặt hosted-agent](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Phương Pháp Cài Đặt

### Windows

#### Lựa chọn 1: Trình quản lý gói Windows (Khuyến nghị)
```cmd
winget install microsoft.azd
```

#### Lựa chọn 2: Script cài đặt PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Lựa chọn 3: Chocolatey
```cmd
choco install azd
```

#### Lựa chọn 4: Cài đặt thủ công
1. Tải bản phát hành mới nhất từ [GitHub](https://github.com/Azure/azure-dev/releases)
2. Giải nén vào `C:\Program Files\azd\`
3. Thêm vào biến môi trường PATH

### macOS

#### Lựa chọn 1: Homebrew (Khuyến nghị)
```bash
brew tap azure/azd
brew install azd
```

#### Lựa chọn 2: Script cài đặt
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Lựa chọn 3: Cài đặt thủ công
Tải tệp lưu trữ theo kiến trúc macOS của bạn từ [tài sản phát hành](https://github.com/Azure/azure-dev/releases), giải nén và thêm tệp thực thi `azd` vào `PATH`.

### Linux

#### Lựa chọn 1: Script cài đặt (Khuyến nghị)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Lựa chọn 2: Trình quản lý gói

**Cài đặt thủ công từ tài sản phát hành:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Một số Codespaces và môi trường dev container đã bao gồm `azd`, nhưng bạn nên xác nhận thay vì giả định:

```bash
azd version
```

Nếu thiếu `azd`, hãy cài đặt với script chuẩn cho môi trường.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Container tạm thời này không lưu trạng thái đăng nhập giữa các lần chạy. Để triển khai lặp lại, dùng [cài đặt dev container](dev-containers.md); việc xây dựng container cũng yêu cầu Docker daemon có thể truy cập từ bên trong container.

## ✅ Xác Minh Cài Đặt

Sau khi cài đặt, xác minh azd hoạt động đúng:

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
azd version 1.x.x (commit xxxxxx)
```

**Lưu ý**: Số phiên bản thực tế sẽ khác nhau. Kiểm tra [Phiên bản Azure Developer CLI](https://github.com/Azure/azure-dev/releases) để biết phiên bản mới nhất.

**✅ Danh Sách Kiểm Tra Cài Đặt Thành Công:**
- [ ] `azd version` hiển thị số phiên bản không lỗi
- [ ] `azd --help` hiển thị tài liệu lệnh
- [ ] `azd template list` hiển thị các mẫu có sẵn
- [ ] Bạn có thể tạo thư mục thử nghiệm và chạy `azd init` thành công

**Nếu tất cả kiểm tra ổn, bạn đã sẵn sàng tiếp tục tới [Your First Project](first-project.md)!**

## Thiết Lập Xác Thực

### Thiết Lập Khuyên Dùng Cho Người Mới

Với quy trình làm việc AZD-first, đăng nhập bằng `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Chỉ dùng đăng nhập Azure CLI khi bạn muốn chạy lệnh `az` trực tiếp trong khoá học.

### Xác Thực Azure CLI (Tùy chọn)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### Bạn Nên Dùng Quy Trình Đăng Nhập Nào?

- Dùng `azd auth login` nếu bạn theo đường dẫn AZD dành cho người mới và chủ yếu chạy các lệnh `azd`.
- Cũng dùng `az login` khi bạn muốn chạy các lệnh Azure CLI như `az account show` hoặc kiểm tra tài nguyên trực tiếp.
- Nếu bài tập bao gồm cả `azd` và `az`, hãy chạy cả hai lệnh đăng nhập một lần ngay đầu.

### Xác Thực Mã Thiết Bị
Nếu bạn dùng hệ thống không có giao diện hoặc gặp vấn đề trình duyệt:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Cho môi trường tự động:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Xác Nhận Thiết Lập Hoàn Chỉnh

Nếu bạn muốn kiểm tra nhanh trước khi bắt đầu Chương 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Cấu Hình

### Cấu Hình Toàn Cầu
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Biến Môi Trường
Thêm vào hồ sơ shell của bạn (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Tích Hợp IDE

### Visual Studio Code
Cài đặt tiện ích mở rộng Azure Developer CLI:
1. Mở VS Code
2. Vào Extensions (Ctrl+Shift+X)
3. Tìm kiếm "Azure Developer CLI"
4. Cài đặt tiện ích mở rộng

Tính năng:
- IntelliSense cho azure.yaml
- Lệnh trên terminal tích hợp
- Duyệt mẫu
- Giám sát triển khai

### GitHub Codespaces
Tạo `.devcontainer/devcontainer.json`:
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
2. Cấu hình thông tin đăng nhập Azure
3. Sử dụng terminal tích hợp cho lệnh azd

## 🐛 Khắc Phục Sự Cố Cài Đặt

### Vấn Đề Phổ Biến

#### Từ Chối Quyền (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Vấn Đề PATH
Thêm thủ công azd vào PATH của bạn:

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
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Xung Đột Phiên Bản
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Cần Thêm Trợ Giúp
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Cập Nhật azd

### Kiểm Tra Cập Nhật
azd sẽ cảnh báo khi có phiên bản mới và bạn có thể xác nhận bản dựng hiện tại với:
```bash
azd version
```

### Cập Nhật Thủ Công

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

## 💡 Câu Hỏi Thường Gặp

<details>
<summary><strong>Điểm khác biệt giữa azd và az CLI là gì?</strong></summary>

**Azure CLI (az)**: Công cụ cấp thấp quản lý tài nguyên Azure riêng lẻ
- `az webapp create`, `az storage account create`
- Quản lý từng tài nguyên một
- Tập trung vào quản lý hạ tầng

**Azure Developer CLI (azd)**: Công cụ cấp cao cho triển khai ứng dụng toàn diện
- `azd up` triển khai toàn bộ ứng dụng với tất cả tài nguyên
- Quy trình làm việc dựa trên mẫu
- Tập trung nâng cao năng suất lập trình viên

**Chúng độc lập**: azd dùng xác thực riêng theo mặc định. Chỉ cài và đăng nhập Azure CLI cho các lệnh `az`, hoặc chủ động chọn dùng `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Tôi có thể dùng azd với tài nguyên Azure hiện có không?</strong></summary>

Có! Bạn có thể:
1. Nhập tài nguyên hiện có vào môi trường azd
2. Tham chiếu tài nguyên hiện có trong mẫu Bicep của bạn
3. Dùng azd cho các triển khai mới song song với hạ tầng hiện tại

Xem [Hướng Dẫn Cấu Hình](../chapter-03-configuration/configuration.md) để biết chi tiết.
</details>

<details>
<summary><strong>azd có hoạt động với Azure Government hoặc Azure China không?</strong></summary>

Có, hãy cấu hình cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Nếu bạn cũng dùng Azure CLI, hãy cấu hình `az cloud set --name ...` riêng biệt. Các dịch vụ mẫu và sẵn có mô hình có thể thay đổi theo cloud.
</details>

<details>
<summary><strong>Tôi có thể dùng azd trong pipeline CI/CD không?</strong></summary>

Hoàn toàn có thể! azd được thiết kế cho tự động hóa:
- Tích hợp GitHub Actions
- Hỗ trợ Azure DevOps
- Xác thực service principal
- Chế độ không tương tác

Xem [Hướng Dẫn Triển Khai](../chapter-04-infrastructure/deployment-guide.md) cho các mẫu CI/CD.
</details>

<details>
<summary><strong>Chi phí khi dùng azd là gì?</strong></summary>

azd hoàn toàn **miễn phí** và mã nguồn mở. Bạn chỉ trả cho:
- Tài nguyên Azure bạn triển khai
- Chi phí tiêu thụ Azure (tính toán, lưu trữ, v.v.)

Dùng `azd provision --preview` để kiểm tra tài nguyên đề xuất, sau đó ước tính chi phí với [Bảng tính giá Azure](https://azure.microsoft.com/pricing/calculator/). Chế độ xem trước không tính giá.
</details>

## Các Bước Tiếp Theo

1. **Hoàn tất xác thực**: Đảm bảo bạn có thể truy cập đăng ký Azure của mình
2. **Thử triển khai đầu tiên**: Theo [Hướng Dẫn Dự Án Đầu Tiên](first-project.md)
3. **Khám phá các mẫu**: Duyệt mẫu có sẵn với `azd template list`
4. **Cấu hình IDE của bạn**: Thiết lập môi trường phát triển

## Hỗ Trợ

Nếu gặp sự cố:
- [Tài liệu chính thức](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Báo cáo sự cố](https://github.com/Azure/azure-dev/issues)
- [Thảo luận cộng đồng](https://github.com/Azure/azure-dev/discussions)
- [Hỗ trợ Azure](https://azure.microsoft.com/support/)
- [**Kỹ năng Azure Agent**](https://skills.sh/microsoft/github-copilot-for-azure) - Nhận hướng dẫn lệnh Azure trực tiếp trong trình soạn thảo với `npx skills add microsoft/github-copilot-for-azure`

---

**Điều Hướng Chương:**
- **📚 Trang Khóa Học**: [AZD For Beginners](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Cơ Bản & Bắt Đầu Nhanh
- **⬅️ Trước**: [AZD Basics](azd-basics.md) 
- **➡️ Tiếp Theo**: [Your First Project](first-project.md)
- **🚀 Chương Tiếp Theo**: [Chương 2: Phát Triển AI-Đầu Tiên](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Cài đặt hoàn tất!** Tiếp tục tới [Your First Project](first-project.md) để bắt đầu xây dựng với azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->