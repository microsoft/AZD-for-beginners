# Bảng tham khảo lệnh - Các lệnh AZD thiết yếu

**Tham khảo nhanh cho tất cả các chương**
- **📚 Trang khóa học**: [AZD cho Người mới bắt đầu](../README.md)
- **📖 Bắt đầu nhanh**: [Chương 1: Nền tảng & Bắt đầu nhanh](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Lệnh AI**: [Chương 2: Phát triển ưu tiên AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Nâng cao**: [Chương 4: Hạ tầng như mã](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Giới thiệu

Bảng tham khảo toàn diện này cung cấp tham chiếu nhanh cho các lệnh Azure Developer CLI được sử dụng phổ biến nhất, được sắp xếp theo danh mục kèm ví dụ thực tế. Hoàn hảo để tra cứu nhanh trong quá trình phát triển, khắc phục sự cố và hoạt động hàng ngày với các dự án azd.

## Mục tiêu học tập

Bằng cách sử dụng bảng tham khảo này, bạn sẽ:
- Có quyền truy cập ngay lập tức vào các lệnh và cú pháp Azure Developer CLI thiết yếu
- Hiểu được cách tổ chức lệnh theo các danh mục chức năng và trường hợp sử dụng
- Tham khảo các ví dụ thực tế cho các kịch bản phát triển và triển khai phổ biến
- Truy cập các lệnh khắc phục sự cố để giải quyết vấn đề nhanh chóng
- Tìm các tùy chọn cấu hình và tùy chỉnh nâng cao một cách hiệu quả
- Tìm lệnh quản lý môi trường và quy trình làm việc đa môi trường

## Kết quả học tập

Với việc tham khảo thường xuyên bảng này, bạn sẽ có thể:
- Thực thi các lệnh azd một cách tự tin mà không cần tham khảo tài liệu đầy đủ
- Nhanh chóng giải quyết các vấn đề phổ biến bằng các lệnh chẩn đoán phù hợp
- Quản lý nhiều môi trường và kịch bản triển khai một cách hiệu quả
- Áp dụng các tính năng và tùy chọn cấu hình azd nâng cao khi cần
- Khắc phục sự cố triển khai bằng các chuỗi lệnh có hệ thống
- Tối ưu hóa quy trình làm việc thông qua việc sử dụng hiệu quả các phím tắt và tùy chọn của azd

## Các lệnh bắt đầu

### Xác thực
```bash
# Đăng nhập vào Azure qua AZD
azd auth login

# Đăng nhập vào Azure CLI (AZD sử dụng điều này ở nền)
az login

# Kiểm tra tài khoản hiện tại
az account show

# Đặt đăng ký mặc định
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Đăng xuất khỏi AZD
azd auth logout

# Đăng xuất khỏi Azure CLI
az logout
```

### Khởi tạo dự án
```bash
# Duyệt các mẫu có sẵn
azd template list

# Khởi tạo từ mẫu
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Khởi tạo trong thư mục hiện tại
azd init .

# Khởi tạo với tên tùy chỉnh
azd init --template todo-nodejs-mongo my-awesome-app
```

## Các lệnh triển khai chính

### Quy trình triển khai hoàn chỉnh
```bash
# Triển khai mọi thứ (cấp phát + triển khai)
azd up

# Triển khai với lời nhắc xác nhận bị tắt
azd up --confirm-with-no-prompt

# Triển khai tới môi trường cụ thể
azd up --environment production

# Triển khai với các tham số tùy chỉnh
azd up --parameter location=westus2
```

### Chỉ hạ tầng
```bash
# Cấp phát tài nguyên Azure
azd provision

# 🧪 Xem trước các thay đổi hạ tầng
azd provision --preview
# Hiển thị chế độ chạy thử những tài nguyên sẽ được tạo/sửa đổi/xóa
# Tương tự 'terraform plan' hoặc 'bicep what-if' - an toàn để chạy, không có thay đổi nào được áp dụng
```

### Chỉ ứng dụng
```bash
# Triển khai mã ứng dụng
azd deploy

# Triển khai dịch vụ cụ thể
azd deploy --service web
azd deploy --service api

# Triển khai tất cả các dịch vụ
azd deploy --all
```

### Xây dựng và đóng gói
```bash
# Xây dựng ứng dụng
azd package

# Xây dựng dịch vụ cụ thể
azd package --service api
```

## 🌍 Quản lý Môi trường

### Hoạt động môi trường
```bash
# Liệt kê tất cả các môi trường
azd env list

# Tạo môi trường mới
azd env new development
azd env new staging --location westus2

# Chọn môi trường
azd env select production

# Hiển thị các môi trường khả dụng
azd env list

# Làm mới trạng thái môi trường
azd env refresh
```

### Biến môi trường
```bash
# Đặt biến môi trường
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Lấy biến môi trường
azd env get API_KEY

# Liệt kê tất cả các biến môi trường
azd env get-values

# Xóa biến môi trường
azd env unset DEBUG
```

## ⚙️ Các lệnh cấu hình

### Cấu hình toàn cục
```bash
# Liệt kê tất cả cấu hình
azd config show

# Đặt mặc định toàn cục
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Xóa cấu hình
azd config unset defaults.location

# Đặt lại tất cả cấu hình
azd config reset
```

### Cấu hình dự án
```bash
# Xác thực azure.yaml
azd config validate

# Hiển thị thông tin dự án
azd show

# Lấy các điểm cuối dịch vụ
azd show --output json
```

## 📊 Giám sát và Chẩn đoán

### Bảng điều khiển giám sát
```bash
# Mở bảng điều khiển giám sát trên cổng Azure
azd monitor

# Mở số liệu trực tiếp của Application Insights
azd monitor --live

# Mở blade nhật ký của Application Insights
azd monitor --logs

# Mở tổng quan của Application Insights
azd monitor --overview
```

### Xem nhật ký container
```bash
# Xem nhật ký qua Azure CLI (cho Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Theo dõi nhật ký theo thời gian thực
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Xem nhật ký từ Azure Portal
azd monitor --logs
```

### Truy vấn Log Analytics
```bash
# Truy cập Log Analytics qua Azure Portal
azd monitor --logs

# Truy vấn nhật ký bằng Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Các lệnh bảo trì

### Dọn dẹp
```bash
# Xóa tất cả các tài nguyên Azure
azd down

# Buộc xóa mà không cần xác nhận
azd down --force

# Xóa vĩnh viễn các tài nguyên bị xóa mềm
azd down --purge

# Hoàn tất dọn dẹp
azd down --force --purge
```

### Cập nhật
```bash
# Kiểm tra cập nhật azd
azd version

# Lấy phiên bản hiện tại
azd version

# Xem cấu hình hiện tại
azd config show
```

## 🔧 Các lệnh nâng cao

### Pipeline và CI/CD
```bash
# Cấu hình GitHub Actions
azd pipeline config

# Cấu hình Azure DevOps
azd pipeline config --provider azdo

# Hiển thị cấu hình pipeline
azd pipeline show
```

### Quản lý cơ sở hạ tầng
```bash
# Tạo mẫu hạ tầng
azd infra generate

# 🧪 Xem trước và lập kế hoạch hạ tầng
azd provision --preview
# Mô phỏng việc cung cấp hạ tầng mà không triển khai
# Phân tích các mẫu Bicep/Terraform và hiển thị:
# - Tài nguyên sẽ được thêm (màu xanh lá +)
# - Tài nguyên sẽ được sửa đổi (màu vàng ~)
# - Tài nguyên sẽ bị xóa (màu đỏ -)
# An toàn để chạy - không có thay đổi thực tế nào được thực hiện trên môi trường Azure

# Tổng hợp hạ tầng từ azure.yaml
azd infra synth
```

### Thông tin dự án
```bash
# Hiển thị trạng thái dự án và các điểm cuối
azd show

# Hiển thị thông tin dự án chi tiết dưới dạng JSON
azd show --output json

# Lấy các điểm cuối của dịch vụ
azd show --output json | jq '.services'
```

## 🤖 Lệnh AI & Phần mở rộng

### Tiện ích mở rộng AZD
```bash
# Liệt kê tất cả các tiện ích mở rộng có sẵn (bao gồm AI)
azd extension list

# Cài đặt tiện ích mở rộng Foundry agents
azd extension install azure.ai.agents

# Cài đặt tiện ích mở rộng tinh chỉnh
azd extension install azure.ai.finetune

# Cài đặt tiện ích mở rộng mô hình tùy chỉnh
azd extension install azure.ai.models

# Nâng cấp tất cả các tiện ích mở rộng đã cài đặt
azd extension upgrade --all
```

### Lệnh tác nhân AI
```bash
# Khởi tạo một dự án tác nhân từ manifest
azd ai agent init -m <manifest-path-or-uri>

# Chỉ định một dự án Foundry cụ thể
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Chỉ định thư mục nguồn của tác nhân
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Chọn mục tiêu lưu trữ
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# Khởi động máy chủ MCP cho dự án của bạn
azd mcp start

# Quản lý sự cho phép của công cụ cho các hoạt động MCP
azd copilot consent list
```

### Tạo hạ tầng
```bash
# Tạo các tệp IaC từ định nghĩa dự án của bạn
azd infra generate

# Tổng hợp hạ tầng từ azure.yaml
azd infra synth
```

---

## 🎯 Quy trình làm việc nhanh

### Quy trình phát triển
```bash
# Bắt đầu dự án mới
azd init --template todo-nodejs-mongo
cd my-project

# Triển khai lên môi trường phát triển
azd env new dev
azd up

# Thực hiện thay đổi và triển khai lại
azd deploy

# Mở bảng điều khiển giám sát
azd monitor --live
```

### Quy trình đa môi trường
```bash
# Thiết lập các môi trường
azd env new dev
azd env new staging  
azd env new production

# Triển khai lên môi trường dev
azd env select dev
azd up

# Kiểm tra và đẩy lên môi trường staging
azd env select staging
azd up

# Triển khai lên môi trường sản xuất
azd env select production
azd up
```

### Quy trình khắc phục sự cố
```bash
# Bật chế độ gỡ lỗi
export AZD_DEBUG=true

# Kiểm tra trạng thái triển khai
azd show

# Xác thực cấu hình
azd config show

# Mở bảng điều khiển giám sát để xem nhật ký
azd monitor --logs

# Kiểm tra trạng thái tài nguyên
azd show --output json
```

## 🔍 Các lệnh gỡ lỗi

### Thông tin gỡ lỗi
```bash
# Bật đầu ra gỡ lỗi
export AZD_DEBUG=true
azd <command> --debug

# Vô hiệu hóa thu thập dữ liệu chẩn đoán để đầu ra gọn hơn
export AZD_DISABLE_TELEMETRY=true

# Kiểm tra cấu hình hiện tại
azd config show

# Kiểm tra trạng thái xác thực
az account show
```

### Gỡ lỗi mẫu
```bash
# Liệt kê các mẫu có sẵn kèm theo chi tiết
azd template list --output json

# Hiển thị thông tin mẫu
azd template show <template-name>

# Xác thực mẫu trước khi khởi tạo
azd template validate <template-name>
```

## 📁 Các lệnh tệp và thư mục

### Cấu trúc dự án
```bash
# Hiển thị cấu trúc thư mục hiện tại
tree /f  # Windows
find . -type f  # Linux/macOS

# Đi tới thư mục gốc của dự án azd
cd $(azd root)

# Hiển thị thư mục cấu hình azd
echo $AZD_CONFIG_DIR  # Thông thường ~/.azd
```

## 🎨 Định dạng đầu ra

### Đầu ra JSON
```bash
# Lấy đầu ra JSON để viết script
azd show --output json
azd env list --output json
azd config show --output json

# Phân tích cú pháp bằng jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Đầu ra bảng
```bash
# Định dạng dưới dạng bảng
azd env list --output table

# Xem các dịch vụ đã triển khai
azd show --output json | jq '.services | keys'
```

## 🔧 Các kết hợp lệnh phổ biến

### Kịch bản kiểm tra sức khỏe
```bash
#!/bin/bash
# Kiểm tra sức khỏe nhanh
azd show
azd env get-values
azd monitor --logs
```

### Xác thực triển khai
```bash
#!/bin/bash
# Kiểm tra trước khi triển khai
azd show
azd provision --preview  # Xem trước các thay đổi trước khi triển khai
az account show
```

### So sánh môi trường
```bash
#!/bin/bash
# So sánh các môi trường
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Kịch bản dọn dẹp tài nguyên
```bash
#!/bin/bash
# Dọn dẹp các môi trường cũ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Biến môi trường

### Các biến môi trường phổ biến
```bash
# Cấu hình Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Cấu hình AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Cấu hình ứng dụng
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Các lệnh khẩn cấp

### Sửa nhanh
```bash
# Đặt lại xác thực
az account clear
az login

# Buộc làm mới môi trường
azd env refresh

# Triển khai lại tất cả dịch vụ
azd deploy

# Kiểm tra trạng thái triển khai
azd show --output json
```

### Các lệnh phục hồi
```bash
# Khôi phục sau triển khai thất bại - dọn dẹp và triển khai lại
azd down --force --purge
azd up

# Chỉ cung cấp lại cơ sở hạ tầng
azd provision

# Chỉ triển khai lại ứng dụng
azd deploy
```

## 💡 Mẹo chuyên gia

### Bí danh để tăng tốc quy trình
```bash
# Thêm vào .bashrc hoặc .zshrc của bạn
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Phím tắt chức năng
```bash
# Chuyển đổi môi trường nhanh chóng
azd-env() {
    azd env select $1 && azd show
}

# Triển khai nhanh với giám sát
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Trạng thái môi trường
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Trợ giúp và Tài liệu

### Nhận trợ giúp
```bash
# Trợ giúp chung
azd --help
azd help

# Trợ giúp theo lệnh
azd up --help
azd env --help
azd config --help

# Hiển thị thông tin phiên bản và bản dựng
azd version
azd version --output json
```

### Liên kết Tài liệu
```bash
# Mở tài liệu trong trình duyệt
azd docs

# Hiển thị tài liệu mẫu
azd template show <template-name> --docs
```

---

**Mẹo**: Đánh dấu trang này và sử dụng `Ctrl+F` để nhanh chóng tìm các lệnh bạn cần!

---

**Điều hướng**
- **Bài học trước**: [Kiểm tra trước khi triển khai](../docs/pre-deployment/preflight-checks.md)
- **Bài học tiếp theo**: [Bảng thuật ngữ](glossary.md)

---

> **💡 Bạn muốn trợ giúp lệnh Azure trong trình soạn thảo của mình?** Cài đặt [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) bằng `npx skills add microsoft/github-copilot-for-azure` — 37 kỹ năng cho AI, Foundry, triển khai, chẩn đoán, và hơn thế nữa.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đạt độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->