<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-09T22:41:04+00:00",
  "source_file": "resources/faq.md",
  "language_code": "vi"
}
-->
# Câu hỏi thường gặp (FAQ)

## Giới thiệu

FAQ toàn diện này cung cấp câu trả lời cho các câu hỏi phổ biến nhất về Azure Developer CLI (azd) và triển khai Azure. Tìm giải pháp nhanh cho các vấn đề thường gặp, hiểu các phương pháp tốt nhất, và làm rõ các khái niệm cũng như quy trình làm việc của azd.

## Mục tiêu học tập

Khi xem qua FAQ này, bạn sẽ:
- Tìm câu trả lời nhanh cho các câu hỏi và vấn đề thường gặp về Azure Developer CLI
- Hiểu các khái niệm và thuật ngữ chính thông qua định dạng Hỏi & Đáp thực tế
- Truy cập các giải pháp khắc phục sự cố cho các vấn đề và lỗi thường gặp
- Học các phương pháp tối ưu thông qua các câu hỏi thường gặp về tối ưu hóa
- Khám phá các tính năng và khả năng nâng cao thông qua các câu hỏi chuyên sâu
- Tham khảo hướng dẫn về chi phí, bảo mật, và chiến lược triển khai một cách hiệu quả

## Kết quả học tập

Với việc tham khảo thường xuyên FAQ này, bạn sẽ có thể:
- Tự giải quyết các vấn đề thường gặp về Azure Developer CLI bằng các giải pháp được cung cấp
- Đưa ra quyết định sáng suốt về chiến lược và cấu hình triển khai
- Hiểu mối quan hệ giữa azd và các công cụ, dịch vụ Azure khác
- Áp dụng các phương pháp tốt nhất dựa trên kinh nghiệm cộng đồng và khuyến nghị của chuyên gia
- Khắc phục sự cố về xác thực, triển khai, và cấu hình một cách hiệu quả
- Tối ưu hóa chi phí và hiệu suất bằng cách sử dụng các thông tin và khuyến nghị từ FAQ

## Mục lục

- [Bắt đầu](../../../resources)
- [Xác thực & Truy cập](../../../resources)
- [Mẫu & Dự án](../../../resources)
- [Triển khai & Hạ tầng](../../../resources)
- [Cấu hình & Môi trường](../../../resources)
- [Khắc phục sự cố](../../../resources)
- [Chi phí & Thanh toán](../../../resources)
- [Phương pháp tốt nhất](../../../resources)
- [Chủ đề nâng cao](../../../resources)

---

## Bắt đầu

### Hỏi: Azure Developer CLI (azd) là gì?
**Đáp**: Azure Developer CLI (azd) là một công cụ dòng lệnh tập trung vào nhà phát triển, giúp tăng tốc thời gian đưa ứng dụng từ môi trường phát triển cục bộ lên Azure. Nó cung cấp các phương pháp tốt nhất thông qua các mẫu và hỗ trợ toàn bộ vòng đời triển khai.

### Hỏi: azd khác gì so với Azure CLI?
**Đáp**: 
- **Azure CLI**: Công cụ đa mục đích để quản lý tài nguyên Azure
- **azd**: Công cụ tập trung vào nhà phát triển cho quy trình triển khai ứng dụng
- azd sử dụng Azure CLI bên trong nhưng cung cấp các trừu tượng cấp cao hơn cho các kịch bản phát triển phổ biến
- azd bao gồm các mẫu, quản lý môi trường, và tự động hóa triển khai

### Hỏi: Tôi có cần cài đặt Azure CLI để sử dụng azd không?
**Đáp**: Có, azd yêu cầu Azure CLI để xác thực và một số thao tác. Hãy cài đặt Azure CLI trước, sau đó cài đặt azd.

### Hỏi: azd hỗ trợ những ngôn ngữ lập trình nào?
**Đáp**: azd không phụ thuộc vào ngôn ngữ. Nó hoạt động với:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Các trang web tĩnh
- Ứng dụng container hóa

### Hỏi: Tôi có thể sử dụng azd với các dự án hiện có không?
**Đáp**: Có! Bạn có thể:
1. Sử dụng `azd init` để thêm cấu hình azd vào các dự án hiện có
2. Điều chỉnh các dự án hiện có để phù hợp với cấu trúc mẫu azd
3. Tạo các mẫu tùy chỉnh dựa trên kiến trúc hiện có của bạn

---

## Xác thực & Truy cập

### Hỏi: Làm thế nào để tôi xác thực với Azure bằng azd?
**Đáp**: Sử dụng `azd auth login`, thao tác này sẽ mở một cửa sổ trình duyệt để xác thực Azure. Đối với các kịch bản CI/CD, sử dụng service principal hoặc managed identity.

### Hỏi: Tôi có thể sử dụng azd với nhiều subscription Azure không?
**Đáp**: Có. Sử dụng `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` để chỉ định subscription nào sẽ được sử dụng cho mỗi môi trường.

### Hỏi: Tôi cần quyền gì để triển khai với azd?
**Đáp**: Thông thường bạn cần:
- Quyền **Contributor** trên nhóm tài nguyên hoặc subscription
- Quyền **User Access Administrator** nếu triển khai tài nguyên yêu cầu gán vai trò
- Các quyền cụ thể phụ thuộc vào mẫu và tài nguyên được triển khai

### Hỏi: Tôi có thể sử dụng azd trong các pipeline CI/CD không?
**Đáp**: Chắc chắn! azd được thiết kế để tích hợp CI/CD. Sử dụng service principal để xác thực và thiết lập các biến môi trường cho cấu hình.

### Hỏi: Làm thế nào để xử lý xác thực trong GitHub Actions?
**Đáp**: Sử dụng Azure Login action với thông tin xác thực service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Mẫu & Dự án

### Hỏi: Tôi có thể tìm các mẫu azd ở đâu?
**Đáp**: 
- Mẫu chính thức: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Mẫu cộng đồng: Tìm kiếm trên GitHub với từ khóa "azd-template"
- Sử dụng `azd template list` để duyệt các mẫu có sẵn

### Hỏi: Làm thế nào để tôi tạo một mẫu tùy chỉnh?
**Đáp**: 
1. Bắt đầu với cấu trúc mẫu hiện có
2. Sửa đổi `azure.yaml`, các tệp hạ tầng, và mã ứng dụng
3. Kiểm tra kỹ với `azd up`
4. Đăng lên GitHub với các thẻ phù hợp

### Hỏi: Tôi có thể sử dụng azd mà không cần mẫu không?
**Đáp**: Có, sử dụng `azd init` trong một dự án hiện có để tạo các tệp cấu hình cần thiết. Bạn sẽ cần cấu hình thủ công `azure.yaml` và các tệp hạ tầng.

### Hỏi: Sự khác biệt giữa mẫu chính thức và mẫu cộng đồng là gì?
**Đáp**: 
- **Mẫu chính thức**: Được Microsoft duy trì, cập nhật thường xuyên, có tài liệu đầy đủ
- **Mẫu cộng đồng**: Được tạo bởi các nhà phát triển, có thể có các trường hợp sử dụng chuyên biệt, chất lượng và bảo trì khác nhau

### Hỏi: Làm thế nào để tôi cập nhật một mẫu trong dự án của mình?
**Đáp**: Các mẫu không được cập nhật tự động. Bạn có thể:
1. So sánh và hợp nhất thủ công các thay đổi từ mẫu nguồn
2. Bắt đầu lại với `azd init` sử dụng mẫu đã cập nhật
3. Chọn lọc các cải tiến cụ thể từ các mẫu đã cập nhật

---

## Triển khai & Hạ tầng

### Hỏi: azd có thể triển khai những dịch vụ Azure nào?
**Đáp**: azd có thể triển khai bất kỳ dịch vụ Azure nào thông qua các mẫu Bicep/ARM, bao gồm:
- App Services, Container Apps, Functions
- Cơ sở dữ liệu (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Tài nguyên mạng, bảo mật, và giám sát

### Hỏi: Tôi có thể triển khai đến nhiều vùng không?
**Đáp**: Có, cấu hình nhiều vùng trong các mẫu Bicep của bạn và đặt tham số location phù hợp cho từng môi trường.

### Hỏi: Làm thế nào để tôi xử lý việc di chuyển schema cơ sở dữ liệu?
**Đáp**: Sử dụng deployment hooks trong `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Hỏi: Tôi có thể chỉ triển khai hạ tầng mà không triển khai ứng dụng không?
**Đáp**: Có, sử dụng `azd provision` để chỉ triển khai các thành phần hạ tầng được định nghĩa trong các mẫu của bạn.

### Hỏi: Làm thế nào để tôi triển khai đến các tài nguyên Azure hiện có?
**Đáp**: Điều này phức tạp và không được hỗ trợ trực tiếp. Bạn có thể:
1. Nhập các tài nguyên hiện có vào các mẫu Bicep của bạn
2. Sử dụng tham chiếu tài nguyên hiện có trong các mẫu
3. Sửa đổi các mẫu để tạo hoặc tham chiếu tài nguyên một cách có điều kiện

### Hỏi: Tôi có thể sử dụng Terraform thay vì Bicep không?
**Đáp**: Hiện tại, azd chủ yếu hỗ trợ các mẫu Bicep/ARM. Hỗ trợ Terraform chưa được cung cấp chính thức, mặc dù có thể có các giải pháp từ cộng đồng.

---

## Cấu hình & Môi trường

### Hỏi: Làm thế nào để tôi quản lý các môi trường khác nhau (dev, staging, prod)?
**Đáp**: Tạo các môi trường riêng biệt với `azd env new <environment-name>` và cấu hình các thiết lập khác nhau cho từng môi trường:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Hỏi: Cấu hình môi trường được lưu trữ ở đâu?
**Đáp**: Trong thư mục `.azure` trong thư mục dự án của bạn. Mỗi môi trường có thư mục riêng với các tệp cấu hình.

### Hỏi: Làm thế nào để tôi thiết lập cấu hình cụ thể cho từng môi trường?
**Đáp**: Sử dụng `azd env set` để cấu hình các biến môi trường:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Hỏi: Tôi có thể chia sẻ cấu hình môi trường với các thành viên trong nhóm không?
**Đáp**: Thư mục `.azure` chứa thông tin nhạy cảm và không nên được commit vào hệ thống kiểm soát phiên bản. Thay vào đó:
1. Tài liệu hóa các biến môi trường cần thiết
2. Sử dụng các script triển khai để thiết lập môi trường
3. Sử dụng Azure Key Vault cho các cấu hình nhạy cảm

### Hỏi: Làm thế nào để tôi ghi đè các giá trị mặc định của mẫu?
**Đáp**: Thiết lập các biến môi trường tương ứng với các tham số mẫu:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Khắc phục sự cố

### Hỏi: Tại sao `azd up` bị lỗi?
**Đáp**: Các nguyên nhân phổ biến:
1. **Vấn đề xác thực**: Chạy `azd auth login`
2. **Quyền không đủ**: Kiểm tra các gán vai trò Azure của bạn
3. **Xung đột tên tài nguyên**: Thay đổi AZURE_ENV_NAME
4. **Vấn đề hạn mức/dung lượng**: Kiểm tra khả dụng khu vực
5. **Lỗi mẫu**: Xác thực các mẫu Bicep

### Hỏi: Làm thế nào để tôi gỡ lỗi các lỗi triển khai?
**Đáp**: 
1. Sử dụng `azd deploy --debug` để có đầu ra chi tiết
2. Kiểm tra lịch sử triển khai trên Azure portal
3. Xem nhật ký hoạt động trong Azure portal
4. Sử dụng `azd show` để hiển thị trạng thái môi trường hiện tại

### Hỏi: Tại sao các biến môi trường của tôi không hoạt động?
**Đáp**: Kiểm tra:
1. Tên biến khớp chính xác với các tham số mẫu
2. Giá trị được đặt đúng cách nếu chứa khoảng trắng
3. Môi trường được chọn: `azd env select <environment>`
4. Các biến được thiết lập trong môi trường đúng

### Hỏi: Làm thế nào để tôi dọn dẹp các triển khai thất bại?
**Đáp**: 
```bash
azd down --force --purge
```
Thao tác này sẽ xóa tất cả tài nguyên và cấu hình môi trường.

### Hỏi: Tại sao ứng dụng của tôi không truy cập được sau khi triển khai?
**Đáp**: Kiểm tra:
1. Triển khai đã hoàn tất thành công
2. Ứng dụng đang chạy (kiểm tra nhật ký trên Azure portal)
3. Nhóm bảo mật mạng cho phép lưu lượng truy cập
4. DNS/tên miền tùy chỉnh được cấu hình đúng cách

---

## Chi phí & Thanh toán

### Hỏi: Triển khai azd sẽ tốn bao nhiêu chi phí?
**Đáp**: Chi phí phụ thuộc vào:
- Dịch vụ Azure được triển khai
- Tiers/SKU của dịch vụ được chọn
- Sự khác biệt về giá khu vực
- Mô hình sử dụng

Sử dụng [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) để ước tính.

### Hỏi: Làm thế nào để tôi kiểm soát chi phí trong các triển khai azd?
**Đáp**: 
1. Sử dụng các SKU cấp thấp cho môi trường phát triển
2. Thiết lập ngân sách và cảnh báo Azure
3. Sử dụng `azd down` để xóa tài nguyên khi không cần thiết
4. Chọn khu vực phù hợp (chi phí khác nhau theo địa điểm)
5. Sử dụng các công cụ quản lý chi phí Azure

### Hỏi: Có các tùy chọn miễn phí nào cho các mẫu azd không?
**Đáp**: Nhiều dịch vụ Azure cung cấp các tùy chọn miễn phí:
- App Service: Có tier miễn phí
- Azure Functions: 1 triệu lần thực thi miễn phí/tháng
- Cosmos DB: Tier miễn phí với 400 RU/s
- Application Insights: 5GB đầu tiên/tháng miễn phí

Cấu hình các mẫu để sử dụng các tier miễn phí nếu có.

### Hỏi: Làm thế nào để tôi ước tính chi phí trước khi triển khai?
**Đáp**: 
1. Xem xét `main.bicep` của mẫu để biết tài nguyên nào được tạo
2. Sử dụng Azure Pricing Calculator với các SKU cụ thể
3. Triển khai vào môi trường phát triển trước để theo dõi chi phí thực tế
4. Sử dụng Azure Cost Management để phân tích chi phí chi tiết

---

## Phương pháp tốt nhất

### Hỏi: Các phương pháp tốt nhất cho cấu trúc dự án azd là gì?
**Đáp**: 
1. Giữ mã ứng dụng tách biệt với hạ tầng
2. Sử dụng tên dịch vụ có ý nghĩa trong `azure.yaml`
3. Thực hiện xử lý lỗi đúng cách trong các script build
4. Sử dụng cấu hình cụ thể cho từng môi trường
5. Bao gồm tài liệu đầy đủ

### Hỏi: Làm thế nào để tôi tổ chức nhiều dịch vụ trong azd?
**Đáp**: Sử dụng cấu trúc được khuyến nghị:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Hỏi: Tôi có nên commit thư mục `.azure` vào hệ thống kiểm soát phiên bản không?
**Đáp**: **Không!** Thư mục `.azure` chứa thông tin nhạy cảm. Thêm nó vào `.gitignore`:
```gitignore
.azure/
```

### Hỏi: Làm thế nào để tôi xử lý các bí mật và cấu hình nhạy cảm?
**Đáp**: 
1. Sử dụng Azure Key Vault cho các bí mật
2. Tham chiếu các bí mật Key Vault trong cấu hình ứng dụng
3. Không bao giờ commit các bí mật vào hệ thống kiểm soát phiên bản
4. Sử dụng managed identity cho xác thực giữa các dịch vụ

### Hỏi: Cách tiếp cận được khuyến nghị cho CI/CD với azd là gì?
**Đáp**: 
1. Sử dụng các môi trường riêng biệt cho từng giai đoạn (dev/staging/prod)
2. Thực hiện kiểm tra tự động trước khi triển khai
3. Sử dụng service principal để xác thực
4. Lưu trữ cấu hình nhạy cảm trong các biến/secret của pipeline
5. Thực hiện các cổng phê duyệt cho triển khai sản xuất

---

## Chủ đề nâng cao

### Hỏi: Tôi có thể mở rộng azd với các chức năng tùy chỉnh không?
**Đáp**: Có, thông qua deployment hooks trong `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Hỏi: Làm thế nào để tôi tích hợp azd với các quy trình DevOps hiện có?
**Đáp**: 
1. Sử dụng các lệnh azd trong các script pipeline hiện có
2. Chuẩn hóa các mẫu azd trên toàn bộ nhóm
3. Tích hợp với hệ thống giám sát và cảnh báo hiện có
4. Sử dụng đầu ra JSON của azd để tích hợp pipeline

### Hỏi: Tôi có thể sử dụng azd với Azure DevOps không?
**Đáp**: Có, azd hoạt động với bất kỳ hệ thống CI/CD nào. Tạo các pipeline Azure DevOps sử dụng các lệnh azd.

### Hỏi: Làm thế nào để tôi đóng góp cho azd hoặc tạo các mẫu cộng đồng?
**Đáp**: 
1. **Công cụ azd**: Đóng góp tại [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Mẫu**: Tạo mẫu theo [hướng dẫn mẫu](https://github.com/Azure-Samples/awesome-azd)
3. **Tài liệu**: Đóng góp cho tài liệu tại [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Hỏi: Lộ trình cho azd là gì?
**Đáp**: Kiểm tra [lộ trình chính thức](https://github.com/Azure/azure-dev/projects) để biết các tính năng và cải tiến được lên kế hoạch.

### Hỏi: Làm thế nào để tôi chuyển từ các công cụ triển khai khác sang azd?
**Đáp**:
1. Phân tích kiến trúc triển khai hiện tại  
2. Tạo các mẫu Bicep tương đương  
3. Cấu hình `azure.yaml` để phù hợp với các dịch vụ hiện tại  
4. Kiểm tra kỹ lưỡng trong môi trường phát triển  
5. Dần dần di chuyển các môi trường  

---

## Vẫn còn thắc mắc?

### **Tìm kiếm trước**
- Kiểm tra [tài liệu chính thức](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Tìm kiếm [các vấn đề trên GitHub](https://github.com/Azure/azure-dev/issues) để xem các vấn đề tương tự  

### **Nhận hỗ trợ**
- [Thảo luận trên GitHub](https://github.com/Azure/azure-dev/discussions) - Hỗ trợ từ cộng đồng  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Câu hỏi kỹ thuật  
- [Azure Discord](https://discord.gg/azure) - Chat cộng đồng theo thời gian thực  

### **Báo cáo vấn đề**
- [Vấn đề trên GitHub](https://github.com/Azure/azure-dev/issues/new) - Báo cáo lỗi và yêu cầu tính năng  
- Bao gồm nhật ký liên quan, thông báo lỗi, và các bước để tái hiện  

### **Tìm hiểu thêm**
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Khung Kiến trúc Tốt của Azure](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*FAQ này được cập nhật thường xuyên. Cập nhật lần cuối: Ngày 9 tháng 9 năm 2025*  

---

**Điều hướng**  
- **Bài học trước**: [Thuật ngữ](glossary.md)  
- **Bài học tiếp theo**: [Hướng dẫn học tập](study-guide.md)  

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.