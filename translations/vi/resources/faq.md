# Frequently Asked Questions (FAQ)

**Get Help by Chapter**
- **📚 Course Home**: [AZD cho Người mới bắt đầu](../README.md)
- **🚆 Installation Issues**: [Chương 1: Cài đặt & Thiết lập](../docs/getting-started/installation.md)
- **🤖 AI Questions**: [Chương 2: Phát triển ưu tiên AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Troubleshooting**: [Chương 7: Khắc phục sự cố & Gỡ lỗi](../docs/troubleshooting/common-issues.md)

## Introduction

FAQ toàn diện này cung cấp câu trả lời cho những câu hỏi thường gặp nhất về Azure Developer CLI (azd) và các triển khai trên Azure. Tìm giải pháp nhanh cho các vấn đề phổ biến, hiểu các phương pháp hay nhất, và làm rõ các khái niệm cùng quy trình làm việc của azd.

## Learning Goals

Bằng cách xem lại FAQ này, bạn sẽ:
- Tìm câu trả lời nhanh cho các câu hỏi và vấn đề thường gặp về Azure Developer CLI
- Hiểu các khái niệm và thuật ngữ chính thông qua định dạng Hỏi & Đáp thực tế
- Truy cập các giải pháp khắc phục sự cố cho các lỗi và kịch bản phổ biến
- Học các phương pháp hay nhất thông qua những câu hỏi thường gặp về tối ưu hóa
- Khám phá các tính năng nâng cao và khả năng thông qua các câu hỏi cấp chuyên gia
- Tham khảo hướng dẫn về chi phí, bảo mật và chiến lược triển khai một cách hiệu quả

## Learning Outcomes

Với việc tham khảo thường xuyên FAQ này, bạn sẽ có thể:
- Giải quyết các vấn đề phổ biến của Azure Developer CLI một cách độc lập bằng các giải pháp được cung cấp
- Đưa ra quyết định sáng suốt về chiến lược và cấu hình triển khai
- Hiểu mối quan hệ giữa azd và các công cụ/dịch vụ Azure khác
- Áp dụng các phương pháp tốt nhất dựa trên kinh nghiệm cộng đồng và khuyến nghị chuyên gia
- Khắc phục các vấn đề xác thực, triển khai và cấu hình một cách hiệu quả
- Tối ưu hóa chi phí và hiệu năng bằng các hiểu biết và khuyến nghị từ FAQ

## Table of Contents

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) là một công cụ dòng lệnh tập trung vào nhà phát triển giúp rút ngắn thời gian đưa ứng dụng từ môi trường phát triển cục bộ lên Azure. Nó cung cấp các phương pháp hay nhất thông qua các mẫu (templates) và hỗ trợ toàn bộ vòng đời triển khai.

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Công cụ đa năng để quản lý tài nguyên Azure
- **azd**: Công cụ tập trung vào nhà phát triển cho các luồng công việc triển khai ứng dụng
- azd sử dụng Azure CLI bên trong nhưng cung cấp các trừu tượng cấp cao hơn cho các kịch bản phát triển phổ biến
- azd bao gồm các template, quản lý môi trường và tự động hóa triển khai

### Q: Do I need Azure CLI installed to use azd?
**A**: Có, azd yêu cầu Azure CLI để xác thực và một số thao tác. Cài đặt Azure CLI trước, sau đó cài đặt azd.

### Q: What programming languages does azd support?
**A**: azd không phụ thuộc ngôn ngữ. Nó làm việc với:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Trang web tĩnh
- Ứng dụng container

### Q: Can I use azd with existing projects?
**A**: Có! Bạn có thể:
1. Sử dụng `azd init` để thêm cấu hình azd vào dự án hiện có
2. Điều chỉnh dự án hiện có để phù hợp với cấu trúc template của azd
3. Tạo template tùy chỉnh dựa trên kiến trúc hiện có của bạn

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: Sử dụng `azd auth login` sẽ mở một cửa sổ trình duyệt để xác thực Azure. Trong kịch bản CI/CD, sử dụng service principals hoặc managed identities.

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Có. Sử dụng `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` để chỉ định subscription nào sẽ được sử dụng cho mỗi môi trường.

### Q: What permissions do I need to deploy with azd?
**A**: Thông thường bạn cần:
- Vai trò **Contributor** trên resource group hoặc subscription
- **User Access Administrator** nếu triển khai các tài nguyên yêu cầu gán vai trò
- Quyền cụ thể thay đổi tùy theo template và tài nguyên được triển khai

### Q: Can I use azd in CI/CD pipelines?
**A**: Hoàn toàn có thể! azd được thiết kế để tích hợp CI/CD. Sử dụng service principals để xác thực và đặt biến môi trường cho cấu hình.

### Q: How do I handle authentication in GitHub Actions?
**A**: Sử dụng Azure Login action với thông tin đăng nhập service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- Official templates: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Community templates: Tìm trên GitHub với từ khóa "azd-template"
- Sử dụng `azd template list` để duyệt các template có sẵn

### Q: How do I create a custom template?
**A**: 
1. Bắt đầu với cấu trúc một template hiện có
2. Sửa `azure.yaml`, các file hạ tầng, và mã ứng dụng
3. Kiểm tra kỹ bằng `azd up`
4. Xuất bản lên GitHub với các tag phù hợp

### Q: Can I use azd without a template?
**A**: Có, sử dụng `azd init` trong một dự án hiện có để tạo các file cấu hình cần thiết. Bạn sẽ cần cấu hình thủ công `azure.yaml` và các file hạ tầng.

### Q: What's the difference between official and community templates?
**A**: 
- **Official templates**: Được Microsoft duy trì, cập nhật thường xuyên, có tài liệu đầy đủ
- **Community templates**: Do các nhà phát triển tạo, có thể phục vụ các trường hợp chuyên biệt, chất lượng và bảo trì khác nhau

### Q: How do I update a template in my project?
**A**: Template không được cập nhật tự động. Bạn có thể:
1. So sánh thủ công và gộp các thay đổi từ template nguồn
2. Bắt đầu lại với `azd init` sử dụng template đã cập nhật
3. Chọn lọc các cải tiến cụ thể từ template đã cập nhật

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: azd có thể triển khai bất kỳ dịch vụ Azure nào qua Bicep/ARM templates, bao gồm:
- App Services, Container Apps, Functions
- Cơ sở dữ liệu (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Mạng, bảo mật và các tài nguyên giám sát

### Q: Can I deploy to multiple regions?
**A**: Có, cấu hình nhiều vùng trong template Bicep của bạn và đặt tham số location phù hợp cho mỗi môi trường.

### Q: How do I handle database schema migrations?
**A**: Sử dụng deployment hooks trong `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: Có, sử dụng `azd provision` để chỉ triển khai các thành phần hạ tầng được định nghĩa trong template của bạn.

### Q: How do I deploy to existing Azure resources?
**A**: Điều này phức tạp và không được hỗ trợ trực tiếp. Bạn có thể:
1. Nhập tài nguyên hiện có vào template Bicep của bạn
2. Sử dụng tham chiếu tài nguyên hiện có trong template
3. Sửa template để tạo điều kiện có điều kiện (conditionally) tạo mới hoặc tham chiếu tài nguyên

### Q: Can I use Terraform instead of Bicep?
**A**: Hiện tại, azd chủ yếu hỗ trợ Bicep/ARM templates. Hỗ trợ Terraform chưa chính thức, mặc dù có thể có các giải pháp cộng đồng.

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: Tạo các môi trường riêng với `azd env new <environment-name>` và cấu hình các thiết lập khác nhau cho từng môi trường:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: Trong thư mục `.azure` bên trong thư mục dự án của bạn. Mỗi môi trường có thư mục riêng với các file cấu hình.

### Q: How do I set environment-specific configuration?
**A**: Sử dụng `azd env set` để cấu hình các biến môi trường:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: Thư mục `.azure` chứa thông tin nhạy cảm và không nên được commit vào hệ thống quản lý mã nguồn. Thay vào đó:
1. Ghi lại các biến môi trường cần thiết
2. Sử dụng script triển khai để thiết lập môi trường
3. Sử dụng Azure Key Vault cho cấu hình nhạy cảm

### Q: How do I override template defaults?
**A**: Đặt các biến môi trường tương ứng với tham số của template:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: Các nguyên nhân phổ biến:
1. **Authentication issues**: Chạy `azd auth login`
2. **Insufficient permissions**: Kiểm tra phân quyền vai trò Azure của bạn
3. **Resource naming conflicts**: Thay đổi AZURE_ENV_NAME
4. **Quota/capacity issues**: Kiểm tra khả năng sẵn có theo vùng
5. **Template errors**: Xác thực các template Bicep

### Q: How do I debug deployment failures?
**A**: 
1. Sử dụng `azd deploy --debug` để xem đầu ra chi tiết
2. Kiểm tra lịch sử triển khai trên Azure portal
3. Xem Activity Log trong Azure portal
4. Sử dụng `azd show` để hiển thị trạng thái môi trường hiện tại

### Q: Why are my environment variables not working?
**A**: Kiểm tra:
1. Tên biến khớp chính xác với tham số template
2. Giá trị được đặt trong dấu ngoặc nếu chứa khoảng trắng
3. Môi trường đã được chọn: `azd env select <environment>`
4. Biến được thiết lập trong môi trường đúng

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
This removes all resources and environment configuration.

### Q: Why is my application not accessible after deployment?
**A**: Kiểm tra:
1. Việc triển khai đã hoàn tất thành công
2. Ứng dụng đang chạy (kiểm tra logs trên Azure portal)
3. Network security groups cho phép lưu lượng
4. DNS/tên miền tùy chỉnh được cấu hình đúng

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: Chi phí phụ thuộc vào:
- Các dịch vụ Azure được triển khai
- Các cấp dịch vụ/SKU được chọn
- Sự khác biệt giá theo vùng
- Mẫu sử dụng

Sử dụng [Máy tính giá Azure](https://azure.microsoft.com/pricing/calculator/) để ước tính.

### Q: How do I control costs in azd deployments?
**A**: 
1. Sử dụng các SKU cấp thấp hơn cho môi trường phát triển
2. Thiết lập ngân sách và cảnh báo trên Azure
3. Sử dụng `azd down` để xóa tài nguyên khi không cần
4. Chọn vùng phù hợp (chi phí thay đổi theo vị trí)
5. Sử dụng công cụ Azure Cost Management

### Q: Are there free tier options for azd templates?
**A**: Nhiều dịch vụ Azure cung cấp các mức miễn phí:
- App Service: Có lớp miễn phí
- Azure Functions: 1M lượt thực thi miễn phí/tháng
- Cosmos DB: Mức miễn phí với 400 RU/s
- Application Insights: 5GB đầu tiên/tháng miễn phí

Cấu hình template để sử dụng các mức miễn phí khi có thể.

### Q: How do I estimate costs before deployment?
**A**: 
1. Xem `main.bicep` của template để biết những tài nguyên nào được tạo
2. Sử dụng Máy tính giá Azure với các SKU cụ thể
3. Triển khai vào môi trường phát triển trước để theo dõi chi phí thực tế
4. Sử dụng Azure Cost Management để phân tích chi phí chi tiết

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. Giữ mã ứng dụng tách biệt khỏi hạ tầng
2. Sử dụng tên dịch vụ có ý nghĩa trong `azure.yaml`
3. Thực hiện xử lý lỗi thích hợp trong script build
4. Sử dụng cấu hình theo môi trường
5. Bao gồm tài liệu toàn diện

### Q: How should I organize multiple services in azd?
**A**: Sử dụng cấu trúc được khuyến nghị:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Should I commit the `.azure` folder to version control?
**A**: **Không!** Thư mục `.azure` chứa thông tin nhạy cảm. Thêm nó vào `.gitignore`:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. Sử dụng Azure Key Vault cho bí mật
2. Tham chiếu bí mật từ Key Vault trong cấu hình ứng dụng
3. Không bao giờ commit bí mật vào hệ thống quản lý mã nguồn
4. Sử dụng managed identities cho xác thực giữa các dịch vụ

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. Sử dụng các môi trường riêng cho từng giai đoạn (dev/staging/prod)
2. Thực hiện kiểm thử tự động trước khi triển khai
3. Sử dụng service principals cho xác thực
4. Lưu cấu hình nhạy cảm trong secrets/variables của pipeline
5. Thiết lập các cổng phê duyệt cho triển khai production

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: Có, thông qua deployment hooks trong `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. Sử dụng các lệnh azd trong các script pipeline hiện có
2. Chuẩn hóa template azd giữa các nhóm
3. Tích hợp với hệ thống giám sát và cảnh báo hiện có
4. Sử dụng đầu ra JSON của azd cho tích hợp pipeline

### Q: Can I use azd with Azure DevOps?
**A**: Có, azd hoạt động với mọi hệ thống CI/CD. Tạo pipeline Azure DevOps sử dụng các lệnh azd.

### Q: How do I contribute to azd or create community templates?
**A**:
1. **Công cụ azd**: Đóng góp vào [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Mẫu**: Tạo các mẫu theo [hướng dẫn mẫu](https://github.com/Azure-Samples/awesome-azd)
3. **Tài liệu**: Đóng góp vào tài liệu tại [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Lộ trình cho azd là gì?
**A**: Xem [lộ trình chính thức](https://github.com/Azure/azure-dev/projects) để biết các tính năng và cải tiến dự kiến.

### Q: How do I migrate from other deployment tools to azd?
**A**: 
1. Phân tích kiến trúc triển khai hiện tại
2. Tạo các mẫu Bicep tương đương
3. Cấu hình `azure.yaml` để khớp với dịch vụ hiện có
4. Kiểm thử kỹ lưỡng trong môi trường phát triển
5. Di chuyển dần dần các môi trường

---

## Vẫn còn câu hỏi?

### **Tìm kiếm trước**
- Kiểm tra [tài liệu chính thức](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Tìm trong [GitHub issues](https://github.com/Azure/azure-dev/issues) các vấn đề tương tự

### **Nhận trợ giúp**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Hỗ trợ cộng đồng
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Câu hỏi kỹ thuật
- [Azure Discord](https://discord.gg/azure) - Trò chuyện cộng đồng theo thời gian thực

### **Báo cáo sự cố**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Báo cáo lỗi và yêu cầu tính năng
- Bao gồm nhật ký liên quan, thông báo lỗi và các bước để tái tạo

### **Tìm hiểu thêm**
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Khuôn khổ Well-Architected của Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*FAQ này được cập nhật thường xuyên. Cập nhật lần cuối: September 9, 2025*

---

**Điều hướng**
- **Bài học trước**: [Bảng chú giải](glossary.md)
- **Bài học tiếp theo**: [Hướng dẫn học](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do người thực hiện. Chúng tôi không chịu trách nhiệm đối với bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->