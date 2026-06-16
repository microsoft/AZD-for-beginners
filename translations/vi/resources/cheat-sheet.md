# Command Cheat Sheet - Essential AZD Commands

**Quick Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Quick Start**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

Tài liệu tóm tắt toàn diện này cung cấp tham khảo nhanh cho các lệnh Azure Developer CLI được sử dụng thường xuyên nhất, được tổ chức theo danh mục với các ví dụ thực tế. Hoàn hảo để tra cứu nhanh trong quá trình phát triển, khắc phục sự cố và thao tác hàng ngày với các dự án azd.

## Learning Goals

Bằng cách sử dụng bảng cheat sheet này, bạn sẽ:
- Có truy cập tức thì đến các lệnh và cú pháp Azure Developer CLI thiết yếu
- Hiểu được cách tổ chức lệnh theo các danh mục chức năng và trường hợp sử dụng
- Tham khảo các ví dụ thực tế cho các kịch bản phát triển và triển khai phổ biến
- Truy cập các lệnh khắc phục sự cố để giải quyết sự cố nhanh chóng
- Tìm các tùy chọn cấu hình và tùy chỉnh nâng cao một cách hiệu quả
- Xác định các lệnh quản lý môi trường và quy trình làm việc đa môi trường

## Learning Outcomes

Với việc thường xuyên tham khảo bảng này, bạn sẽ có thể:
- Thực thi các lệnh azd một cách tự tin mà không cần tham khảo tài liệu đầy đủ
- Nhanh chóng giải quyết các vấn đề phổ biến bằng các lệnh chẩn đoán phù hợp
- Quản lý nhiều môi trường và kịch bản triển khai một cách hiệu quả
- Áp dụng các tính năng azd nâng cao và các tuỳ chọn cấu hình khi cần
- Khắc phục sự cố triển khai bằng cách sử dụng chuỗi lệnh hệ thống
- Tối ưu hóa quy trình làm việc thông qua việc sử dụng hiệu quả các phím tắt và tuỳ chọn của azd

## Getting Started Commands

### Authentication
```bash
# Đăng nhập vào Azure qua AZD
azd auth login

# Đăng nhập vào Azure CLI (AZD sử dụng điều này phía sau)
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

### Project Initialization
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

## Core Deployment Commands

### Complete Deployment Workflow
```bash
# Triển khai mọi thứ (thiết lập môi trường + triển khai)
azd up

# Triển khai với lời nhắc xác nhận bị tắt
azd up --confirm-with-no-prompt

# Triển khai tới môi trường cụ thể
azd up --environment production

# Triển khai với tham số tùy chỉnh
azd up --parameter location=westus2
```

### Infrastructure Only
```bash
# Cấp phát tài nguyên Azure
azd provision

# 🧪 Xem trước thay đổi hạ tầng
azd provision --preview
# Hiển thị chế độ chạy thử (dry-run) về những tài nguyên sẽ được tạo/ sửa đổi/ xóa
# Tương tự 'terraform plan' hoặc 'bicep what-if' - an toàn để chạy, không có thay đổi nào được áp dụng.
```

### Application Only
```bash
# Triển khai mã ứng dụng
azd deploy

# Triển khai dịch vụ cụ thể
azd deploy --service web
azd deploy --service api

# Triển khai tất cả các dịch vụ
azd deploy --all
```

### Build and Package
```bash
# Khôi phục (tải xuống) các phụ thuộc của ứng dụng
azd restore

# Khôi phục một dịch vụ cụ thể
azd restore --service api

# Xây dựng một artifact có thể triển khai mà không triển khai
azd package

# Xây dựng một dịch vụ cụ thể
azd package --service api
```

> **`azd restore`** tải xuống các phụ thuộc của ứng dụng của bạn (npm, pip, NuGet, Maven, v.v.). Nó chạy tự động trong quá trình `azd package` và `azd deploy`, vì vậy bạn hiếm khi cần gọi trực tiếp — chạy thủ công để tiền tải các phụ thuộc (ví dụ, để làm ấm cache CI hoặc làm việc ngoại tuyến sau đó).

> **`azd package`** xây dựng artifact có thể triển khai (một image container hoặc zip) **mà không** đẩy nó lên Azure. Sử dụng riêng lẻ để xác minh việc build thành công, kiểm tra đầu ra, hoặc tạo artifact mà một quy trình riêng sẽ triển khai sau. `azd deploy` tự động package, vì vậy bạn chỉ cần `azd package` khi muốn có artifact mà không triển khai.

## 🌍 Environment Management

### Environment Operations
```bash
# Liệt kê tất cả môi trường
azd env list

# Tạo môi trường mới
azd env new development
azd env new staging --location westus2

# Chọn môi trường
azd env select production

# Hiển thị các môi trường có sẵn
azd env list

# Làm mới trạng thái môi trường
azd env refresh
```

### Environment Variables
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

## ⚙️ Configuration Commands

### Global Configuration
```bash
# Liệt kê tất cả cấu hình
azd config show

# Đặt các giá trị mặc định toàn cục
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Xóa cấu hình
azd config unset defaults.location

# Đặt lại toàn bộ cấu hình
azd config reset
```

### Project Configuration
```bash
# Kiểm tra azure.yaml
azd config validate

# Hiển thị thông tin dự án
azd show

# Lấy các điểm cuối dịch vụ
azd show --output json
```

## 📊 Monitoring and Diagnostics

### Monitoring Dashboard
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

### Viewing Container Logs
```bash
# Xem nhật ký qua Azure CLI (cho Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Theo dõi nhật ký theo thời gian thực
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Xem nhật ký từ Azure Portal
azd monitor --logs
```

### Log Analytics Queries
```bash
# Truy cập Log Analytics qua Azure Portal
azd monitor --logs

# Truy vấn nhật ký bằng Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Maintenance Commands

### Cleanup
```bash
# Xóa tất cả tài nguyên Azure
azd down

# Buộc xóa mà không cần xác nhận
azd down --force

# Xóa vĩnh viễn các tài nguyên đã bị xóa tạm thời
azd down --purge

# Dọn dẹp hoàn toàn
azd down --force --purge
```

### Updates
```bash
# Kiểm tra bản cập nhật cho azd
azd version

# Lấy phiên bản hiện tại
azd version

# Xem cấu hình hiện tại
azd config show
```

## 🔧 Advanced Commands

### Pipeline and CI/CD
```bash
# Cấu hình GitHub Actions
azd pipeline config

# Cấu hình Azure DevOps
azd pipeline config --provider azdo

# Hiển thị cấu hình pipeline
azd pipeline show
```

### Infrastructure Management
```bash
# Tạo các mẫu hạ tầng
azd infra generate

# 🧪 Xem trước và lập kế hoạch hạ tầng
azd provision --preview
# Mô phỏng việc thiết lập hạ tầng mà không triển khai
# Phân tích các mẫu Bicep/Terraform và hiển thị:
# - Các tài nguyên sẽ được thêm (màu xanh lá +)
# - Các tài nguyên sẽ được sửa đổi (màu vàng ~)
# - Các tài nguyên sẽ bị xóa (màu đỏ -)
# An toàn để chạy - không có thay đổi thực tế nào được thực hiện trên môi trường Azure

# Tổng hợp hạ tầng từ azure.yaml
azd infra synth
```

### Project Information
```bash
# Hiển thị trạng thái dự án và các điểm cuối
azd show

# Hiển thị thông tin dự án chi tiết dưới dạng JSON
azd show --output json

# Lấy các điểm cuối dịch vụ
azd show --output json | jq '.services'
```

## 🤖 AI & Extensions Commands

### AZD Extensions
```bash
# Liệt kê tất cả các tiện ích mở rộng có sẵn (bao gồm AI)
azd extension list

# Cài đặt tiện ích mở rộng Foundry agents
azd extension install azure.ai.agents

# Cài đặt tiện ích mở rộng agent skills (bản xem trước)
azd extension install azure.ai.skills

# Cài đặt tiện ích mở rộng Foundry connections (bản xem trước)
azd extension install azure.ai.connections

# Cài đặt tiện ích mở rộng tinh chỉnh
azd extension install azure.ai.finetune

# Cài đặt tiện ích mở rộng mô hình tùy chỉnh
azd extension install azure.ai.models

# Nâng cấp tất cả các tiện ích mở rộng đã cài đặt
azd extension upgrade --all
```

### AI Agent Commands
```bash
# Khởi tạo dự án agent từ tệp manifest
azd ai agent init -m <manifest-path-or-uri>

# Chỉ định một dự án Foundry cụ thể
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Chỉ định thư mục nguồn của agent
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Chọn đích lưu trữ
azd ai agent init -m agent-manifest.yaml --host containerapp

# Kiểm tra agent đã triển khai (in độ trễ + thời gian tới byte đầu tiên)
azd ai agent invoke

# Hiển thị cấu hình điểm cuối trực tiếp
azd ai agent endpoint show

# Tạo bộ dữ liệu đánh giá, sau đó tối ưu hóa agent
azd ai agent eval generate
azd ai agent optimize

# Tải xuống mã nguồn đã triển khai của một agent lưu trữ dựa trên mã
azd ai agent code download

# Xóa một agent được lưu trữ và tất cả các phiên bản của nó (--force kết thúc các phiên đang hoạt động)
azd ai agent delete --force
```

### MCP Server (Alpha)
```bash
# Khởi động máy chủ MCP cho dự án của bạn
azd mcp start

# Quản lý việc chấp thuận công cụ cho các hoạt động MCP
azd copilot consent list
```

### Infrastructure Generation
```bash
# Tạo các tệp IaC từ định nghĩa dự án của bạn
azd infra generate

# Tổng hợp hạ tầng từ azure.yaml
azd infra synth
```

---

## 🎯 Quick Workflows

### Development Workflow
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

### Multi-Environment Workflow
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

### Troubleshooting Workflow
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

## 🔍 Debugging Commands

### Debug Information
```bash
# Bật đầu ra gỡ lỗi
export AZD_DEBUG=true
azd <command> --debug

# Tắt thu thập số liệu để đầu ra sạch hơn
export AZD_DISABLE_TELEMETRY=true

# Kiểm tra cấu hình hiện tại
azd config show

# Kiểm tra trạng thái xác thực
az account show
```

### Template Debugging
```bash
# Liệt kê các mẫu có sẵn cùng với chi tiết
azd template list --output json

# Hiển thị thông tin mẫu
azd template show <template-name>

# Xác thực mẫu trước khi khởi tạo
azd template validate <template-name>
```

## 📁 File and Directory Commands

### Project Structure
```bash
# Hiển thị cấu trúc thư mục hiện tại
tree /f  # Windows
find . -type f  # Linux/macOS

# Đi tới thư mục gốc của dự án azd
cd $(azd root)

# Hiển thị thư mục cấu hình azd
echo $AZD_CONFIG_DIR  # Thông thường ~/.azd
```

## 🎨 Output Formatting

### JSON Output
```bash
# Lấy đầu ra JSON để viết script
azd show --output json
azd env list --output json
azd config show --output json

# Phân tích cú pháp bằng jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Table Output
```bash
# Định dạng dưới dạng bảng
azd env list --output table

# Xem các dịch vụ đã triển khai
azd show --output json | jq '.services | keys'
```

## 🔧 Common Command Combinations

### Health Check Script
```bash
#!/bin/bash
# Kiểm tra nhanh tình trạng
azd show
azd env get-values
azd monitor --logs
```

### Deployment Validation
```bash
#!/bin/bash
# Xác thực trước khi triển khai
azd show
azd provision --preview  # Xem trước các thay đổi trước khi triển khai
az account show
```

### Environment Comparison
```bash
#!/bin/bash
# So sánh các môi trường
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resource Cleanup Script
```bash
#!/bin/bash
# Dọn dẹp các môi trường cũ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Environment Variables

### Common Environment Variables
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

## 🚨 Emergency Commands

### Quick Fixes
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

### Recovery Commands
```bash
# Khôi phục sau triển khai thất bại - dọn dẹp và triển khai lại
azd down --force --purge
azd up

# Chỉ thiết lập lại cơ sở hạ tầng
azd provision

# Chỉ triển khai lại ứng dụng
azd deploy
```

## 💡 Pro Tips

### Aliases for Faster Workflow
```bash
# Thêm vào .bashrc hoặc .zshrc của bạn
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Function Shortcuts
```bash
# Chuyển đổi môi trường nhanh chóng
azd-env() {
    azd env select $1 && azd show
}

# Triển khai nhanh kèm giám sát
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

## 📖 Help and Documentation

### Getting Help
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

### Documentation Links
```bash
# Mở tài liệu trong trình duyệt
azd docs

# Hiển thị tài liệu mẫu
azd template show <template-name> --docs
```

---

**Tip**: Đánh dấu trang cheat sheet này và sử dụng `Ctrl+F` để nhanh chóng tìm các lệnh bạn cần!

---

**Navigation**
- **Previous Lesson**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [Glossary](glossary.md)

---

> **💡 Want Azure command help in your editor?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — 37 kỹ năng cho AI, Foundry, triển khai, chẩn đoán, và hơn thế nữa.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->