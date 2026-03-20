# Bảng Tóm Tắt Lệnh - Các lệnh AZD Cơ bản

**Tham khảo Nhanh cho Tất cả Chương**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../README.md)
- **📖 Bắt Đầu Nhanh**: [Chương 1: Nền tảng & Bắt đầu Nhanh](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Lệnh AI**: [Chương 2: Phát triển Ưu Tiên AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Nâng cao**: [Chương 4: Hạ tầng như Mã](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Giới thiệu

Bảng tóm tắt đầy đủ này cung cấp tài liệu tham khảo nhanh cho các lệnh hay dùng nhất của Azure Developer CLI, được sắp xếp theo danh mục kèm ví dụ thực tế. Hoàn hảo để tra cứu nhanh trong quá trình phát triển, khắc phục sự cố và hoạt động hàng ngày với các dự án azd.

## Mục tiêu học tập

Bằng cách sử dụng bảng tóm tắt này, bạn sẽ:
- Truy cập ngay lập tức các lệnh thiết yếu và cú pháp của Azure Developer CLI
- Hiểu cách tổ chức lệnh theo các danh mục chức năng và trường hợp sử dụng
- Tham khảo các ví dụ thực tế cho các kịch bản phát triển và triển khai phổ biến
- Truy cập các lệnh khắc phục sự cố để giải quyết vấn đề nhanh
- Tìm các tùy chọn cấu hình và tuỳ chỉnh nâng cao một cách hiệu quả
- Xác định các lệnh quản lý môi trường và quy trình làm việc đa môi trường

## Kết quả học tập

Với việc tham khảo thường xuyên bảng tóm tắt này, bạn sẽ có thể:
- Thực thi các lệnh azd một cách tự tin mà không cần tham khảo toàn bộ tài liệu
- Nhanh chóng giải quyết các sự cố thường gặp bằng các lệnh chẩn đoán phù hợp
- Quản lý hiệu quả nhiều môi trường và kịch bản triển khai
- Áp dụng các tính năng nâng cao của azd và các tùy chọn cấu hình khi cần
- Khắc phục sự cố triển khai bằng các chuỗi lệnh có hệ thống
- Tối ưu hóa quy trình làm việc thông qua việc sử dụng hiệu quả các phím tắt và tùy chọn của azd

## Các lệnh bắt đầu

### Xác thực
```bash
# Đăng nhập vào Azure bằng AZD
azd auth login

# Đăng nhập vào Azure CLI (AZD sử dụng điều này nội bộ)
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

### Khởi tạo Dự án
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

## Các Lệnh Triển Khai Chính

### Quy trình Triển khai Hoàn chỉnh
```bash
# Triển khai mọi thứ (thiết lập + triển khai)
azd up

# Triển khai với lời nhắc xác nhận bị vô hiệu hóa
azd up --confirm-with-no-prompt

# Triển khai đến môi trường cụ thể
azd up --environment production

# Triển khai với các tham số tùy chỉnh
azd up --parameter location=westus2
```

### Chỉ Hạ tầng
```bash
# Cung cấp tài nguyên Azure
azd provision

# 🧪 Xem trước thay đổi hạ tầng
azd provision --preview
# Hiển thị chế độ chạy thử (dry-run) về những tài nguyên sẽ được tạo/sửa/xóa
# Tương tự 'terraform plan' hoặc 'bicep what-if' - an toàn để chạy, không có thay đổi nào được áp dụng
```

### Chỉ Ứng dụng
```bash
# Triển khai mã ứng dụng
azd deploy

# Triển khai dịch vụ cụ thể
azd deploy --service web
azd deploy --service api

# Triển khai tất cả các dịch vụ
azd deploy --all
```

### Xây dựng và Đóng gói
```bash
# Xây dựng ứng dụng
azd package

# Xây dựng dịch vụ cụ thể
azd package --service api
```

## 🌍 Quản lý Môi trường

### Hoạt động Môi trường
```bash
# Liệt kê tất cả các môi trường
azd env list

# Tạo môi trường mới
azd env new development
azd env new staging --location westus2

# Chọn môi trường
azd env select production

# Hiển thị môi trường hiện tại
azd env show

# Làm mới trạng thái môi trường
azd env refresh
```

### Biến Môi trường
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

## ⚙️ Các Lệnh Cấu hình

### Cấu hình Toàn cục
```bash
# Liệt kê tất cả các cấu hình
azd config list

# Thiết lập mặc định toàn cục
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Xóa cấu hình
azd config unset defaults.location

# Đặt lại tất cả các cấu hình
azd config reset
```

### Cấu hình Dự án
```bash
# Xác thực azure.yaml
azd config validate

# Hiển thị thông tin dự án
azd show

# Lấy điểm cuối dịch vụ
azd show --output json
```

## 📊 Giám sát và Chẩn đoán

### Bảng điều khiển Giám sát
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

### Xem Nhật ký Container
```bash
# Xem nhật ký qua Azure CLI (dành cho Container Apps)
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

## 🛠️ Các Lệnh Bảo trì

### Dọn dẹp
```bash
# Xóa tất cả tài nguyên Azure
azd down

# Buộc xóa mà không cần xác nhận
azd down --force

# Xóa vĩnh viễn các tài nguyên đã bị xóa mềm
azd down --purge

# Dọn dẹp hoàn toàn
azd down --force --purge
```

### Cập nhật
```bash
# Kiểm tra cập nhật azd
azd version

# Lấy phiên bản hiện tại
azd version

# Xem cấu hình hiện tại
azd config list
```

## 🔧 Các Lệnh Nâng cao

### Pipeline và CI/CD
```bash
# Cấu hình GitHub Actions
azd pipeline config

# Cấu hình Azure DevOps
azd pipeline config --provider azdo

# Hiển thị cấu hình pipeline
azd pipeline show
```

### Quản lý Hạ tầng
```bash
# Tạo mẫu hạ tầng
azd infra generate

# 🧪 Xem trước & Lập kế hoạch hạ tầng
azd provision --preview
# Mô phỏng việc cung cấp hạ tầng mà không triển khai
# Phân tích các mẫu Bicep/Terraform và hiển thị:
# - Tài nguyên sẽ được thêm vào (màu xanh +)
# - Tài nguyên sẽ được chỉnh sửa (màu vàng ~)
# - Tài nguyên sẽ bị xóa (màu đỏ -)
# An toàn để chạy - không có thay đổi thực tế nào được thực hiện trên môi trường Azure

# Tổng hợp hạ tầng từ azure.yaml
azd infra synth
```

### Thông tin Dự án
```bash
# Hiển thị trạng thái dự án và các điểm cuối
azd show

# Hiển thị thông tin dự án chi tiết dưới dạng JSON
azd show --output json

# Lấy các điểm cuối của dịch vụ
azd show --output json | jq '.services'
```

## 🤖 Các Lệnh AI & Tiện ích mở rộng

### Tiện ích mở rộng AZD
```bash
# Liệt kê tất cả các phần mở rộng có sẵn (bao gồm cả AI)
azd extension list

# Cài đặt phần mở rộng Foundry agents
azd extension install azure.ai.agents

# Cài đặt phần mở rộng tinh chỉnh
azd extension install azure.ai.finetune

# Cài đặt phần mở rộng mô hình tùy chỉnh
azd extension install azure.ai.models

# Nâng cấp tất cả các phần mở rộng đã cài đặt
azd extension upgrade --all
```

### Các lệnh Tác nhân AI
```bash
# Khởi tạo một dự án agent từ tệp manifest
azd ai agent init -m <manifest-path-or-uri>

# Chỉ định một dự án Foundry cụ thể
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Chỉ định thư mục nguồn của agent
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Chọn mục tiêu lưu trữ
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Máy chủ MCP (Alpha)
```bash
# Khởi động máy chủ MCP cho dự án của bạn
azd mcp start

# Quản lý sự cho phép của công cụ cho các hoạt động MCP
azd mcp consent
```

### Tạo Hạ tầng
```bash
# Tạo các tệp IaC từ định nghĩa dự án của bạn
azd infra generate

# Tổng hợp hạ tầng từ azure.yaml
azd infra synth
```

---

## 🎯 Quy trình Nhanh

### Quy trình Phát triển
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

### Quy trình Đa môi trường
```bash
# Thiết lập các môi trường
azd env new dev
azd env new staging  
azd env new production

# Triển khai lên dev
azd env select dev
azd up

# Kiểm tra và đẩy lên staging
azd env select staging
azd up

# Triển khai lên production
azd env select production
azd up
```

### Quy trình Khắc phục sự cố
```bash
# Bật chế độ gỡ lỗi
export AZD_DEBUG=true

# Kiểm tra trạng thái triển khai
azd show

# Xác thực cấu hình
azd config list

# Mở bảng điều khiển giám sát để xem nhật ký
azd monitor --logs

# Kiểm tra trạng thái tài nguyên
azd show --output json
```

## 🔍 Các Lệnh Gỡ lỗi

### Thông tin Gỡ lỗi
```bash
# Bật đầu ra gỡ lỗi
export AZD_DEBUG=true
azd <command> --debug

# Tắt tính năng thu thập số liệu để đầu ra sạch hơn
export AZD_DISABLE_TELEMETRY=true

# Kiểm tra cấu hình hiện tại
azd config list

# Kiểm tra trạng thái xác thực
az account show
```

### Gỡ lỗi Mẫu
```bash
# Liệt kê các mẫu có sẵn kèm theo chi tiết
azd template list --output json

# Hiển thị thông tin mẫu
azd template show <template-name>

# Xác thực mẫu trước khi khởi tạo
azd template validate <template-name>
```

## 📁 Các Lệnh Tệp và Thư mục

### Cấu trúc Dự án
```bash
# Hiển thị cấu trúc thư mục hiện tại
tree /f  # Windows
find . -type f  # Linux/macOS

# Chuyển đến thư mục gốc của dự án azd
cd $(azd root)

# Hiển thị thư mục cấu hình azd
echo $AZD_CONFIG_DIR  # Thông thường ~/.azd
```

## 🎨 Định dạng Đầu ra

### Đầu ra JSON
```bash
# Lấy đầu ra JSON cho các script
azd show --output json
azd env list --output json
azd config list --output json

# Phân tích bằng jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Đầu ra Bảng
```bash
# Định dạng dưới dạng bảng
azd env list --output table

# Xem các dịch vụ đã triển khai
azd show --output json | jq '.services | keys'
```

## 🔧 Các Kết hợp Lệnh Thường gặp

### Kịch bản Kiểm tra Sức khỏe
```bash
#!/bin/bash
# Kiểm tra nhanh tình trạng
azd show
azd env show
azd monitor --logs
```

### Xác thực Triển khai
```bash
#!/bin/bash
# Xác thực trước khi triển khai
azd show
azd provision --preview  # Xem trước các thay đổi trước khi triển khai
az account show
```

### So sánh Môi trường
```bash
#!/bin/bash
# So sánh các môi trường
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script Dọn dẹp Tài nguyên
```bash
#!/bin/bash
# Dọn dẹp các môi trường cũ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Biến Môi trường

### Các Biến Môi trường Thường dùng
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

## 🚨 Các Lệnh Khẩn cấp

### Sửa chữa Nhanh
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

### Các Lệnh Khôi phục
```bash
# Khôi phục sau triển khai thất bại - dọn dẹp và triển khai lại
azd down --force --purge
azd up

# Chỉ tái cấp phát hạ tầng
azd provision

# Chỉ triển khai lại ứng dụng
azd deploy
```

## 💡 Mẹo Chuyên gia

### Bí danh cho Quy trình Nhanh hơn
```bash
# Thêm vào .bashrc hoặc .zshrc của bạn
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Phím tắt Chức năng
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
    azd env show
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

**Mẹo**: Đánh dấu trang bảng tóm tắt này và dùng `Ctrl+F` để nhanh chóng tìm các lệnh bạn cần!

---

**Điều hướng**
- **Bài học Trước**: [Kiểm tra Trước khi Triển khai](../docs/pre-deployment/preflight-checks.md)
- **Bài học Tiếp theo**: [Thuật ngữ](glossary.md)

---

> **💡 Muốn trợ giúp lệnh Azure ngay trong trình soạn thảo?** Cài đặt [Kỹ năng Microsoft Azure Agent](https://skills.sh/microsoft/github-copilot-for-azure) bằng `npx skills add microsoft/github-copilot-for-azure` — 37 kỹ năng cho AI, Foundry, triển khai, chẩn đoán, và hơn thế nữa.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, nên sử dụng bản dịch chuyên nghiệp do người dịch thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->