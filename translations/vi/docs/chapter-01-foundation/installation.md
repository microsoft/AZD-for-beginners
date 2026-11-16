# Hướng Dẫn Cài Đặt & Thiết Lập

**Điều Hướng Chương:**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Nền Tảng & Bắt Đầu Nhanh
- **⬅️ Trước**: [Cơ Bản AZD](azd-basics.md)
- **➡️ Tiếp**: [Dự Án Đầu Tiên Của Bạn](first-project.md)
- **🚀 Chương Tiếp Theo**: [Chương 2: Phát Triển Ưu Tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giới Thiệu

Hướng dẫn toàn diện này sẽ đưa bạn qua các bước cài đặt và cấu hình Azure Developer CLI (azd) trên hệ thống của bạn. Bạn sẽ học nhiều phương pháp cài đặt cho các hệ điều hành khác nhau, thiết lập xác thực và cấu hình ban đầu để chuẩn bị môi trường phát triển cho việc triển khai Azure.

## Mục Tiêu Học Tập

Sau bài học này, bạn sẽ:
- Cài đặt thành công Azure Developer CLI trên hệ điều hành của bạn
- Cấu hình xác thực với Azure bằng nhiều phương pháp khác nhau
- Thiết lập môi trường phát triển với các yêu cầu cần thiết
- Hiểu các tùy chọn cài đặt khác nhau và khi nào nên sử dụng từng cái
- Khắc phục các sự cố cài đặt và thiết lập thường gặp

## Kết Quả Học Tập

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Cài đặt azd bằng phương pháp phù hợp cho nền tảng của bạn
- Xác thực với Azure bằng cách sử dụng azd auth login
- Kiểm tra cài đặt và thử các lệnh azd cơ bản
- Cấu hình môi trường phát triển để sử dụng azd tối ưu
- Tự giải quyết các vấn đề cài đặt phổ biến

Hướng dẫn này sẽ giúp bạn cài đặt và cấu hình Azure Developer CLI trên hệ thống của bạn, bất kể hệ điều hành hay môi trường phát triển bạn sử dụng.

## Yêu Cầu Trước

Trước khi cài đặt azd, hãy đảm bảo bạn có:
- **Đăng ký Azure** - [Tạo tài khoản miễn phí](https://azure.microsoft.com/free/)
- **Azure CLI** (tùy chọn) - Cho các ví dụ chạy `az` rõ ràng; azd xác thực độc lập
- **Git** - Để sao chép mẫu và kiểm soát phiên bản
- **Docker** (tùy chọn) - Cho ứng dụng đóng gói container

## Phương Pháp Cài Đặt

### Windows

#### Lựa chọn 1: Trình Quản Lý Gói Windows (Khuyến nghị)
```cmd
winget install microsoft.azd
```

#### Lựa chọn 2: Script Cài Đặt PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Lựa chọn 3: Chocolatey
```cmd
choco install azd
```

#### Lựa chọn 4: Cài Đặt Thủ Công
1. Tải bản phát hành mới nhất từ [GitHub](https://github.com/Azure/azure-dev/releases)
2. Giải nén vào `C:\Program Files\azd\`
3. Thêm vào biến môi trường PATH

### macOS

#### Lựa chọn 1: Homebrew (Khuyến nghị)
```bash
brew tap azure/azd
brew install azd
```

#### Lựa chọn 2: Script Cài Đặt
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Lựa chọn 3: Cài Đặt Thủ Công
Tải tập tin lưu trữ phù hợp với kiến trúc macOS của bạn từ [các tài sản phát hành](https://github.com/Azure/azure-dev/releases), giải nén, và thêm `azd` nhị phân vào `PATH` của bạn.

### Linux

#### Lựa chọn 1: Script Cài Đặt (Khuyến nghị)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Lựa chọn 2: Trình Quản Lý Gói

**Cài đặt thủ công từ tài sản phát hành:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Một số môi trường Codespaces và vùng chứa phát triển đã bao gồm `azd`, nhưng bạn nên xác nhận thay vì giả định điều đó:

```bash
azd version
```

Nếu thiếu `azd`, cài đặt bằng script chuẩn cho môi trường.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Container tạm thời này không giữ trạng thái đăng nhập giữa các lần chạy. Để triển khai nhiều lần, hãy sử dụng [cấu hình vùng chứa phát triển](dev-containers.md); xây dựng container cũng yêu cầu daemon Docker có thể truy cập từ bên trong container.

## ✅ Xác Minh Cài Đặt

Sau khi cài đặt, xác minh azd hoạt động chính xác:

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

**Lưu ý**: Số phiên bản thực tế sẽ khác nhau. Kiểm tra [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) để biết phiên bản mới nhất.

**✅ Danh Sách Kiểm Tra Cài Đặt Thành Công:**
- [ ] `azd version` hiển thị số phiên bản không lỗi
- [ ] `azd --help` hiển thị tài liệu lệnh
- [ ] `azd template list` hiển thị các mẫu có sẵn
- [ ] Bạn có thể tạo thư mục thử nghiệm và chạy `azd init` thành công

**Nếu tất cả kiểm tra đều đạt, bạn sẵn sàng tiếp tục tới [Dự Án Đầu Tiên Của Bạn](first-project.md)!**

## Thiết Lập Xác Thực

### Thiết Lập Khuyến Nghị Cho Người Mới

Đối với quy trình làm việc ưu tiên AZD, đăng nhập bằng `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Chỉ sử dụng đăng nhập Azure CLI khi bạn dự định tự chạy các lệnh `az` trong khóa học.

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

### Nên Sử Dụng Quy Trình Đăng Nhập Nào?

- Sử dụng `azd auth login` nếu bạn theo đường dẫn AZD cho người mới và chủ yếu chạy các lệnh `azd`.
- Cũng sử dụng `az login` khi bạn muốn chạy các lệnh Azure CLI như `az account show` hoặc kiểm tra tài nguyên trực tiếp.
- Nếu bài tập bao gồm cả `azd` và `az`, chạy cả hai lệnh đăng nhập một lần lúc bắt đầu.

### Xác Thực Mã Thiết Bị
Nếu bạn sử dụng hệ thống không có giao diện hoặc có vấn đề với trình duyệt:
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

### Xác Thực Thiết Lập Hoàn Chỉnh

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

### Cấu Hình Toàn Cục
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Biến Môi Trường
Thêm vào tập tin profile shell của bạn (`.bashrc`, `.zshrc`, `.profile`):
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
2. Vào phần Extensions (Ctrl+Shift+X)
3. Tìm "Azure Developer CLI"
4. Cài đặt tiện ích mở rộng

Tính năng:
- IntelliSense cho azure.yaml
- Lệnh tích hợp terminal
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

## 🐛 Khắc Phục Sự Cố Cài Đặt

### Các Vấn Đề Phổ Biến

#### Lỗi Quyền (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Vấn Đề PATH
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

### Cách Lấy Trợ Giúp Thêm
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
azd cảnh báo khi có phiên bản mới hơn, và bạn có thể kiểm tra bản dựng hiện tại của mình bằng:
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
<summary><strong>Sự khác biệt giữa azd và az CLI là gì?</strong></summary>

**Azure CLI (az)**: Công cụ cấp thấp để quản lý từng tài nguyên Azure riêng lẻ
- `az webapp create`, `az storage account create`
- Quản lý từng tài nguyên một
- Tập trung vào quản lý hạ tầng

**Azure Developer CLI (azd)**: Công cụ cấp cao để triển khai ứng dụng hoàn chỉnh
- `azd up` triển khai toàn bộ ứng dụng với tất cả tài nguyên
- Quy trình dựa trên mẫu
- Tập trung vào năng suất lập trình viên

**Chúng độc lập**: azd sử dụng xác thực riêng theo mặc định. Cài đặt và đăng nhập Azure CLI chỉ khi cần các lệnh `az`, hoặc chọn rõ ràng vào `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Tôi có thể sử dụng azd với tài nguyên Azure hiện có không?</strong></summary>

Có thể! Bạn có thể:
1. Nhập tài nguyên hiện có vào môi trường azd
2. Tham chiếu tài nguyên hiện có trong mẫu Bicep của bạn
3. Sử dụng azd cho triển khai mới bên cạnh cơ sở hạ tầng hiện có

Xem [Hướng Dẫn Cấu Hình](../chapter-03-configuration/configuration.md) để biết chi tiết.
</details>

<details>
<summary><strong>Azd có hoạt động với Azure Government hay Azure Trung Quốc không?</strong></summary>

Có, cấu hình đám mây:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Nếu bạn cũng sử dụng Azure CLI, cấu hình `az cloud set --name ...` riêng biệt. Dịch vụ mẫu và tính khả dụng mô hình thay đổi theo đám mây.
</details>

<details>
<summary><strong>Tôi có thể dùng azd trong pipeline CI/CD không?</strong></summary>

Chắc chắn rồi! azd được thiết kế cho tự động hóa:
- Tích hợp GitHub Actions
- Hỗ trợ Azure DevOps
- Xác thực service principal
- Chế độ không tương tác

Xem [Hướng Dẫn Triển Khai](../chapter-04-infrastructure/deployment-guide.md) cho các mẫu CI/CD.
</details>

<details>
<summary><strong>Chi phí sử dụng azd là bao nhiêu?</strong></summary>

Azd hoàn toàn **miễn phí** và mã nguồn mở. Bạn chỉ phải trả cho:
- Tài nguyên Azure bạn triển khai
- Chi phí tiêu thụ Azure (tính toán, lưu trữ, v.v.)

Sử dụng `azd provision --preview` để kiểm tra tài nguyên đề xuất, sau đó ước tính chi phí với [Máy Tính Giá Azure](https://azure.microsoft.com/pricing/calculator/). Chế độ xem trước không tính giá.
</details>

## Bước Tiếp Theo

1. **Hoàn thành xác thực**: Đảm bảo bạn có thể truy cập đăng ký Azure của mình
2. **Thử triển khai đầu tiên**: Theo hướng dẫn [Dự Án Đầu Tiên](first-project.md)
3. **Khám phá mẫu**: Duyệt các mẫu có sẵn bằng `azd template list`
4. **Cấu hình IDE**: Thiết lập môi trường phát triển của bạn

## Hỗ Trợ

Nếu bạn gặp sự cố:
- [Tài liệu chính thức](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Báo cáo sự cố](https://github.com/Azure/azure-dev/issues)
- [Thảo luận cộng đồng](https://github.com/Azure/azure-dev/discussions)
- [Hỗ trợ Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Nhận hướng dẫn lệnh Azure trực tiếp trong trình soạn thảo với `npx skills add microsoft/github-copilot-for-azure`

---

**Điều Hướng Chương:**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 1 - Nền Tảng & Bắt Đầu Nhanh
- **⬅️ Trước**: [Cơ Bản AZD](azd-basics.md) 
- **➡️ Tiếp**: [Dự Án Đầu Tiên Của Bạn](first-project.md)
- **🚀 Chương Tiếp Theo**: [Chương 2: Phát Triển Ưu Tiên AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Đã Hoàn Thành Cài Đặt!** Tiếp tục tới [Dự Án Đầu Tiên Của Bạn](first-project.md) để bắt đầu xây dựng với azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->