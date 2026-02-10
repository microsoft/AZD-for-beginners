# Bảng tóm tắt lệnh - Các lệnh AZD thiết yếu

**Tham khảo nhanh cho tất cả các chương**
- **📚 Trang Khóa Học**: [AZD dành cho Người Mới Bắt Đầu](../README.md)
- **📖 Bắt Đầu Nhanh**: [Chương 1: Nền tảng & Bắt đầu Nhanh](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Lệnh AI**: [Chương 2: Phát triển ưu tiên AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Nâng cao**: [Chương 4: Hạ tầng như mã](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Giới thiệu

Cheat sheet toàn diện này cung cấp tham khảo nhanh cho các lệnh Azure Developer CLI được sử dụng phổ biến nhất, được tổ chức theo danh mục với các ví dụ thực tiễn. Hoàn hảo cho tra cứu nhanh trong quá trình phát triển, khắc phục sự cố và vận hành hàng ngày với các dự án azd.

## Mục tiêu học tập

Bằng cách sử dụng bảng tóm tắt này, bạn sẽ:
- Có quyền truy cập ngay lập tức vào các lệnh và cú pháp Azure Developer CLI thiết yếu
- Hiểu cách tổ chức lệnh theo các danh mục chức năng và trường hợp sử dụng
- Tham khảo các ví dụ thực tế cho các kịch bản phát triển và triển khai phổ biến
- Truy cập các lệnh khắc phục sự cố để giải quyết vấn đề nhanh chóng
- Tìm các tùy chọn cấu hình và tùy chỉnh nâng cao một cách hiệu quả
- Xác định các lệnh quản lý môi trường và quy trình làm việc đa môi trường

## Kết quả học tập

Khi thường xuyên tham khảo bảng tóm tắt này, bạn sẽ có thể:
- Thực thi các lệnh azd một cách tự tin mà không cần tham khảo toàn bộ tài liệu
- Giải quyết nhanh các sự cố phổ biến bằng các lệnh chẩn đoán phù hợp
- Quản lý hiệu quả nhiều môi trường và kịch bản triển khai
- Áp dụng các tính năng và tùy chọn cấu hình azd nâng cao khi cần
- Khắc phục sự cố triển khai bằng các chuỗi lệnh có hệ thống
- Tối ưu hóa quy trình làm việc thông qua việc sử dụng hiệu quả các phím tắt và tùy chọn azd

## Các lệnh bắt đầu

### Xác thực
```bash
# Đăng nhập vào Azure qua AZD
azd auth login

# Đăng nhập vào Azure CLI (AZD sử dụng điều này trong nền)
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

## Các lệnh Triển khai Cốt lõi

### Quy trình Triển khai Hoàn chỉnh
```bash
# Triển khai mọi thứ (cấp phát + triển khai)
azd up

# Triển khai với các lời nhắc xác nhận đã bị tắt
azd up --confirm-with-no-prompt

# Triển khai đến môi trường cụ thể
azd up --environment production

# Triển khai với các tham số tùy chỉnh
azd up --parameter location=westus2
```

### Chỉ Hạ tầng
```bash
# Triển khai tài nguyên Azure
azd provision

# 🧪 Xem trước thay đổi hạ tầng
azd provision --preview
# Hiển thị chế độ chạy thử (dry-run) xem những tài nguyên nào sẽ được tạo/được sửa/được xóa
# Tương tự như 'terraform plan' hoặc 'bicep what-if' - an toàn để chạy, không có thay đổi nào được áp dụng
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

### Thao tác Môi trường
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

## ⚙️ Các lệnh Cấu hình

### Cấu hình Toàn cục
```bash
# Liệt kê tất cả cấu hình
azd config list

# Thiết lập mặc định toàn cục
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Xóa cấu hình
azd config unset defaults.location

# Đặt lại tất cả cấu hình
azd config reset
```

### Cấu hình Dự án
```bash
# Xác thực azure.yaml
azd config validate

# Hiển thị thông tin dự án
azd show

# Lấy các điểm cuối của dịch vụ
azd show --output json
```

## 📊 Giám sát và Chẩn đoán

### Bảng điều khiển Giám sát
```bash
# Mở bảng điều khiển giám sát trên cổng thông tin Azure
azd monitor

# Mở số liệu trực tiếp của Application Insights
azd monitor --live

# Mở blade nhật ký của Application Insights
azd monitor --logs

# Mở trang tổng quan của Application Insights
azd monitor --overview
```

### Xem nhật ký Container
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
# Truy cập Log Analytics qua Cổng thông tin Azure
azd monitor --logs

# Truy vấn nhật ký bằng Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Các lệnh Bảo trì

### Dọn dẹp
```bash
# Xóa tất cả tài nguyên Azure
azd down

# Buộc xóa mà không cần xác nhận
azd down --force

# Xóa vĩnh viễn các tài nguyên đã bị xóa mềm
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
azd config list
```

## 🔧 Các lệnh Nâng cao

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
# Tạo các mẫu hạ tầng
azd infra generate

# 🧪 Xem trước và Lập kế hoạch hạ tầng
azd provision --preview
# Mô phỏng việc thiết lập hạ tầng mà không triển khai
# Phân tích các template Bicep/Terraform và hiển thị:
# - Tài nguyên sẽ được thêm (xanh lá +)
# - Tài nguyên sẽ được sửa đổi (màu vàng ~)
# - Tài nguyên sẽ bị xóa (màu đỏ -)
# An toàn để chạy - không có thay đổi thực tế nào được thực hiện trên môi trường Azure

# Tổng hợp hạ tầng từ tệp azure.yaml
azd infra synth
```

### Thông tin Dự án
```bash
# Hiển thị trạng thái dự án và các điểm cuối
azd show

# Hiển thị thông tin dự án chi tiết dưới dạng JSON
azd show --output json

# Lấy các điểm cuối dịch vụ
azd show --output json | jq '.services'
```

## 🎯 Các quy trình nhanh

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

# Triển khai lên môi trường dev
azd env select dev
azd up

# Kiểm thử và đẩy lên môi trường staging
azd env select staging
azd up

# Triển khai lên môi trường production
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

## 🔍 Các lệnh Gỡ lỗi

### Thông tin Gỡ lỗi
```bash
# Bật đầu ra gỡ lỗi
export AZD_DEBUG=true
azd <command> --debug

# Vô hiệu hóa telemetry để đầu ra sạch hơn
export AZD_DISABLE_TELEMETRY=true

# Kiểm tra cấu hình hiện tại
azd config list

# Kiểm tra trạng thái xác thực
az account show
```

### Gỡ lỗi Mẫu
```bash
# Liệt kê các mẫu có sẵn kèm chi tiết
azd template list --output json

# Hiển thị thông tin mẫu
azd template show <template-name>

# Xác thực mẫu trước khi khởi tạo
azd template validate <template-name>
```

## 📁 Các lệnh Tệp và Thư mục

### Cấu trúc Dự án
```bash
# Hiển thị cấu trúc thư mục hiện tại
tree /f  # Windows
find . -type f  # Linux/macOS

# Điều hướng đến thư mục gốc dự án azd
cd $(azd root)

# Hiển thị thư mục cấu hình azd
echo $AZD_CONFIG_DIR  # Thường là ~/.azd
```

## 🎨 Định dạng Đầu ra

### Đầu ra JSON
```bash
# Lấy đầu ra JSON cho tập lệnh
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

## 🔧 Các kết hợp lệnh phổ biến

### Script Kiểm tra Sức khỏe
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

### Các biến Môi trường chung
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

## 🚨 Các lệnh Khẩn cấp

### Khắc phục nhanh
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

### Các lệnh Khôi phục
```bash
# Khôi phục sau triển khai thất bại - dọn dẹp và triển khai lại
azd down --force --purge
azd up

# Chỉ tái cung cấp cơ sở hạ tầng
azd provision

# Chỉ triển khai lại ứng dụng
azd deploy
```

## 💡 Mẹo chuyên gia

### Bí danh cho quy trình nhanh hơn
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

**Mẹo**: Đánh dấu trang bảng tóm tắt này và sử dụng `Ctrl+F` để nhanh chóng tìm các lệnh bạn cần!

---

**Navigation**
- **Bài trước**: [Kiểm tra tiền triển khai](../docs/pre-deployment/preflight-checks.md)
- **Bài tiếp theo**: [Thuật ngữ](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa sai sót hoặc không chính xác. Văn bản gốc bằng ngôn ngữ gốc của nó nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc cách hiểu sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->