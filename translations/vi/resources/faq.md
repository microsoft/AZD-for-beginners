# Câu Hỏi Thường Gặp (FAQ)

**Nhận Trợ Giúp Theo Chương**
- **📚 Trang Chủ Khóa Học**: [AZD For Beginners](../README.md)
- **🚆 Vấn Đề Cài Đặt**: [Chương 1: Cài Đặt & Thiết Lập](../docs/chapter-01-foundation/installation.md)
- **🤖 Các Câu Hỏi về AI**: [Chương 2: Phát Triển AI-First](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Khắc Phục Sự Cố**: [Chương 7: Khắc Phục & Gỡ Lỗi](../docs/chapter-07-troubleshooting/common-issues.md)

## Giới Thiệu

FAQ toàn diện này cung cấp câu trả lời cho các câu hỏi phổ biến nhất về Azure Developer CLI (azd) và các triển khai Azure. Tìm giải pháp nhanh cho các vấn đề thường gặp, hiểu các thực hành tốt nhất, và làm rõ các khái niệm và quy trình làm việc của azd.

## Mục Tiêu Học Tập

Qua việc xem xét FAQ này, bạn sẽ:
- Tìm câu trả lời nhanh cho các câu hỏi và vấn đề phổ biến về Azure Developer CLI
- Hiểu các khái niệm và thuật ngữ chính qua hình thức hỏi đáp thực tiễn
- Truy cập các giải pháp khắc phục sự cố cho các vấn đề và lỗi thường gặp
- Học các thực hành tốt nhất thông qua các câu hỏi thường gặp về tối ưu hóa
- Khám phá các tính năng nâng cao và khả năng thông qua các câu hỏi chuyên sâu
- Tham khảo hướng dẫn về chi phí, bảo mật và chiến lược triển khai một cách hiệu quả

## Kết Quả Học Tập

Với việc tham khảo thường xuyên FAQ này, bạn sẽ có thể:
- Giải quyết các vấn đề Azure Developer CLI phổ biến một cách độc lập bằng các giải pháp được cung cấp
- Đưa ra quyết định sáng suốt về các chiến lược và cấu hình triển khai
- Hiểu mối quan hệ giữa azd và các công cụ, dịch vụ Azure khác
- Áp dụng thực hành tốt nhất dựa trên kinh nghiệm cộng đồng và đề xuất chuyên gia
- Khắc phục sự cố xác thực, triển khai và cấu hình một cách hiệu quả
- Tối ưu hóa chi phí và hiệu suất bằng các kiến thức và đề xuất từ FAQ

## Mục Lục

- [Bắt Đầu](#getting-started)
- [Xác Thực & Truy Cập](#authentication--access)
- [Mẫu & Dự Án](#templates--projects)
- [Triển Khai & Hạ Tầng](#deployment--infrastructure)
- [Cấu Hình & Môi Trường](#configuration--environments)
- [Khắc Phục Sự Cố](#troubleshooting)
- [Chi Phí & Hóa Đơn](#cost--billing)
- [Thực Hành Tốt Nhất](#best-practices)
- [Chủ Đề Nâng Cao](#advanced-topics)

---

## Bắt Đầu

### Q: Azure Developer CLI (azd) là gì?
**A**: Azure Developer CLI (azd) là công cụ dòng lệnh tập trung cho nhà phát triển giúp tăng tốc thời gian đưa ứng dụng của bạn từ môi trường phát triển cục bộ lên Azure. Nó cung cấp thực hành tốt nhất qua các mẫu và hỗ trợ toàn bộ vòng đời triển khai.

### Q: azd khác gì so với Azure CLI?
**A**: 
- **Azure CLI**: Công cụ đa năng để quản lý tài nguyên Azure
- **azd**: Công cụ tập trung cho nhà phát triển làm việc với quy trình triển khai ứng dụng
- azd có quy trình xác thực và triển khai riêng; Azure CLI là công cụ bổ trợ riêng biệt
- azd bao gồm các mẫu, quản lý môi trường và tự động hóa triển khai

### Q: Tôi có cần cài Azure CLI để dùng azd không?
**A**: Không cần cho luồng AZD chính. Xác thực bằng `azd auth login`. Cài Azure CLI riêng khi mã mẫu hoặc bài tập chạy các lệnh `az` rõ ràng.

### Q: azd hỗ trợ những ngôn ngữ lập trình nào?
**A**: azd không phụ thuộc ngôn ngữ, hỗ trợ:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Trang web tĩnh
- Ứng dụng container hóa

### Q: Tôi có thể dùng azd với các dự án hiện có không?
**A**: Có! Bạn có thể:
1. Dùng `azd init` để thêm cấu hình azd vào dự án hiện có
2. Điều chỉnh dự án hiện tại để phù hợp cấu trúc mẫu azd
3. Tạo mẫu tùy chỉnh dựa trên kiến trúc hiện tại của bạn

---

## Xác Thực & Truy Cập

### Q: Tôi làm sao để xác thực với Azure qua azd?
**A**: Dùng `azd auth login` sẽ mở cửa sổ trình duyệt để xác thực Azure. Với CI/CD, dùng service principal hoặc managed identities.

### Q: Tôi có thể dùng azd với nhiều subscription Azure không?
**A**: Có. Dùng `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` để chỉ định subscription cho từng môi trường.

### Q: Tôi cần quyền gì để triển khai bằng azd?
**A**: Thông thường cần:
- Vai trò **Contributor** trên nhóm tài nguyên hoặc subscription
- Vai trò **User Access Administrator** nếu triển khai tài nguyên cần phân quyền
- Quyền cụ thể thay đổi theo mẫu và tài nguyên triển khai

### Q: Tôi có thể dùng azd trong pipeline CI/CD không?
**A**: Hoàn toàn được! azd thiết kế để tích hợp CI/CD. Dùng service principal để xác thực và thiết lập biến môi trường cấu hình.

### Q: Làm sao xử lý xác thực trong GitHub Actions?
**A**: Ưu tiên workload identity federation (OIDC), cấu hình với `azd pipeline config`. Workflow tạo ra sẽ cài đặt AZD và xác thực AZD trực tiếp với danh tính liên kết. Một bước `azure/login` riêng lẻ không thiết lập đăng nhập AZD. Bước đăng nhập trong job có ví dụ:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Triển khai hoặc cung cấp sau đăng nhập, với môi trường AZD, subscription và vị trí được cấu hình. Chứng chỉ liên kết phải tin tưởng kho/ref hoặc môi trường GitHub của workflow, và vai trò Azure phải cho phép thao tác yêu cầu.

---

## Mẫu & Dự Án

### Q: Tôi tìm mẫu azd ở đâu?
**A**: 
- Mẫu chính thức và cộng đồng: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Mẫu cộng đồng: Tìm kiếm GitHub với "azd-template"
- Dùng `azd template list` để duyệt các mẫu có sẵn

### Q: Làm sao tạo mẫu tùy chỉnh?
**A**: 
1. Bắt đầu với cấu trúc mẫu hiện có
2. Sửa đổi `azure.yaml`, các file hạ tầng và mã ứng dụng
3. Thử nghiệm kỹ với `azd up`
4. Xuất bản lên GitHub với thẻ thích hợp

### Q: Tôi có thể dùng azd mà không cần mẫu không?
**A**: Có, dùng `azd init` trong dự án hiện có để tạo file cấu hình cần thiết. Bạn cần cấu hình thủ công `azure.yaml` và các file hạ tầng.

### Q: Sự khác nhau giữa mẫu chính thức và mẫu cộng đồng là gì?
**A**: 
- **Mẫu chính thức**: Được Microsoft duy trì, cập nhật thường xuyên, tài liệu đầy đủ
- **Mẫu cộng đồng**: Được lập trình viên tạo ra, có thể dành cho các trường hợp chuyên biệt, chất lượng và mức độ duy trì khác nhau

### Q: Làm sao cập nhật mẫu trong dự án?
**A**: Mẫu không tự động cập nhật. Bạn có thể:
1. So sánh và hợp nhất thủ công các thay đổi từ nguồn mẫu
2. Bắt đầu lại với `azd init` sử dụng mẫu mới
3. Lựa chọn riêng các cải tiến cụ thể từ mẫu cập nhật

---

## Triển Khai & Hạ Tầng

### Q: azd có thể triển khai dịch vụ Azure nào?
**A**: azd có thể triển khai bất kỳ dịch vụ Azure nào qua các mẫu Bicep/ARM, bao gồm:
- App Services, Container Apps, Functions
- Cơ sở dữ liệu (SQL, PostgreSQL, Cosmos DB)
- Lưu trữ, Key Vault, Application Insights
- Mạng, bảo mật, và tài nguyên giám sát

### Q: Tôi có thể triển khai ở nhiều vùng không?
**A**: Có, cấu hình nhiều vùng trong mẫu Bicep và đặt tham số vị trí phù hợp cho mỗi môi trường.

### Q: Tôi xử lý di cư lược đồ cơ sở dữ liệu thế nào?
**A**: Dùng hook triển khai trong `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Tôi có thể chỉ triển khai hạ tầng mà không có ứng dụng không?
**A**: Có, dùng `azd provision` để chỉ triển khai các thành phần hạ tầng định nghĩa trong mẫu của bạn.

### Q: Làm sao triển khai tới tài nguyên Azure hiện có?
**A**: Có thể nếu mẫu hỗ trợ. Tham chiếu tài nguyên hiện có bằng khai báo `existing` của Bicep hoặc tham số tài nguyên hiện có theo tài liệu mẫu, và ánh xạ dịch vụ ứng dụng đến mục tiêu dự kiến. Điều này không nhập quyền sở hữu hay tự động tạo quyền bị thiếu. Xem xét kỹ mẫu trước khi triển khai.

### Q: Tôi có thể dùng Terraform thay vì Bicep không?
**A**: Có. AZD hỗ trợ cả Terraform và Bicep. Chọn mẫu dựa trên Terraform hoặc cấu hình `infra.provider: terraform` trong `azure.yaml`, cùng file Terraform và cấu hình trạng thái/backend phù hợp. Xem [quy trình Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Cấu Hình & Môi Trường

### Q: Tôi quản lý các môi trường khác nhau (dev, staging, prod) thế nào?
**A**: Tạo các môi trường riêng với `azd env new <environment-name>` và cấu hình thiết lập khác nhau cho từng môi trường:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Cấu hình môi trường được lưu ở đâu?
**A**: Trong thư mục `.azure` trong thư mục dự án. Mỗi môi trường có thư mục riêng với các file cấu hình.

### Q: Làm sao thiết lập cấu hình riêng cho từng môi trường?
**A**: Dùng `azd env set` để cấu hình biến môi trường:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Tôi có thể chia sẻ cấu hình môi trường cho các thành viên không?
**A**: Thư mục `.azure` chứa thông tin nhạy cảm và không nên được commit vào kiểm soát phiên bản. Thay vào đó:
1. Ghi tài liệu biến môi trường cần thiết
2. Dùng script triển khai để thiết lập môi trường
3. Dùng Azure Key Vault để bảo vệ cấu hình nhạy cảm

### Q: Tôi ghi đè các thiết lập mặc định của mẫu thế nào?
**A**: Thiết lập biến môi trường tương ứng với các tham số trong mẫu:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Chỉ các biến được mẫu sử dụng mới ảnh hưởng đến triển khai. `SKU_NAME` trên là ví dụ đầu vào tùy chỉnh, không phải thiết lập chung của AZD.

---

## Khắc Phục Sự Cố

### Q: Tại sao `azd up` thất bại?
**A**: Nguyên nhân phổ biến:
1. **Vấn đề xác thực**: Chạy `azd auth login`
2. **Quyền không đủ**: Kiểm tra phân quyền Azure của bạn
3. **Xung đột tên tài nguyên**: Xem lại tài nguyên và đầu vào tên mẫu; tạo môi trường riêng với `azd env new` khi cần cô lập
4. **Hạn ngạch/dung lượng**: Kiểm tra khả năng vùng
5. **Lỗi mẫu**: Xác thực mẫu Bicep

### Q: Làm thế nào để gỡ lỗi các lỗi triển khai?
**A**: 
1. Dùng `azd deploy --debug` để xem chi tiết xuất
2. Kiểm tra lịch sử triển khai trên Azure portal
3. Xem lại Nhật ký Hoạt động trên portal Azure
4. Dùng `azd show` để hiển thị trạng thái môi trường hiện tại

### Q: Tại sao biến môi trường không hoạt động?
**A**: Kiểm tra:
1. Tên biến trùng với tham số mẫu chính xác
2. Giá trị được trích dẫn đúng nếu có khoảng trắng
3. Môi trường đang được chọn: `azd env select <environment>`
4. Biến được thiết lập ở môi trường đúng

### Q: Làm sao dọn dẹp các triển khai thất bại?
**A**: 
```bash
azd down
```
Xem kỹ môi trường chọn và xác nhận xoá trước. Lệnh này xoá tài nguyên Azure đã provision, không xoá cấu hình môi trường `.azure` trên máy. `--purge` còn yêu cầu xoá vĩnh viễn các tài nguyên xóa mềm hỗ trợ và có thể bị chặn bởi bảo vệ giữ lại/xoá; không phải bước phục hồi thường xuyên.

### Q: Tại sao ứng dụng không truy cập được sau khi triển khai?
**A**: Kiểm tra:
1. Triển khai hoàn tất thành công
2. Ứng dụng đang chạy (xem log trên Azure portal)
3. Nhóm bảo mật mạng cho phép lưu lượng
4. DNS/domain tùy chỉnh cấu hình đúng

---

## Chi Phí & Hóa Đơn

### Q: Triển khai azd tốn bao nhiêu?
**A**: Chi phí phụ thuộc vào:
- Dịch vụ Azure được triển khai
- Các cấp/SKU lựa chọn
- Sự khác biệt giá theo vùng
- Mô hình sử dụng

Dùng [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) để ước lượng.

### Q: Làm sao kiểm soát chi phí trong triển khai azd?
**A**: 
1. Dùng SKU cấp thấp hơn cho môi trường phát triển
2. Thiết lập ngân sách và cảnh báo Azure
3. Dùng `azd down` để gỡ tài nguyên khi không cần
4. Chọn vùng phù hợp (chi phí thay đổi theo vị trí)
5. Sử dụng công cụ Quản lý Chi phí Azure

### Q: Có tùy chọn miễn phí cho mẫu azd không?
**A**: Một số dịch vụ có SKU miễn phí hoặc hạn mức hàng tháng, phụ thuộc điều kiện, kế hoạch host, vùng và giới hạn subscription. Nhưng điều này không làm toàn bộ mẫu miễn phí: cơ sở dữ liệu, tìm kiếm, mạng, registry, telemety và suy luận mô hình có thể tốn phí riêng. Kiểm tra [danh sách dịch vụ miễn phí Azure](https://azure.microsoft.com/free/) và giá hiện tại cho từng tài nguyên trước triển khai.

### Q: Làm sao ước lượng chi phí trước triển khai?
**A**: 
1. Xem `main.bicep` mẫu để biết tài nguyên tạo ra
2. Dùng Azure Pricing Calculator với các SKU cụ thể
3. Triển khai vào môi trường phát triển trước để giám sát chi phí thực tế
4. Dùng Azure Cost Management để phân tích chi tiết chi phí

---

## Thực Hành Tốt Nhất

### Q: Thực hành tốt nhất cho cấu trúc dự án azd là gì?
**A**: 
1. Giữ mã ứng dụng tách biệt với hạ tầng
2. Dùng tên dịch vụ có ý nghĩa trong `azure.yaml`
3. Thực hiện xử lý lỗi phù hợp trong các script build
4. Dùng cấu hình riêng theo môi trường
5. Bao gồm tài liệu đầy đủ

### Q: Tôi nên tổ chức nhiều dịch vụ trong azd thế nào?
**A**: Dùng cấu trúc đề xuất:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Tôi có nên commit thư mục `.azure` vào kiểm soát phiên bản không?
**A**: **Không!** Thư mục `.azure` chứa thông tin nhạy cảm. Thêm nó vào `.gitignore`:
```gitignore
.azure/
```

### H: Làm thế nào để tôi xử lý bí mật và cấu hình nhạy cảm?
**Đ**: 
1. Sử dụng Azure Key Vault cho bí mật
2. Tham chiếu bí mật Key Vault trong cấu hình ứng dụng
3. Không bao giờ cam kết bí mật lên hệ thống kiểm soát phiên bản
4. Sử dụng managed identities cho xác thực dịch vụ với dịch vụ

### H: Phương pháp được khuyến nghị cho CI/CD với azd là gì?
**Đ**: 
1. Sử dụng các môi trường riêng biệt cho mỗi giai đoạn (dev/staging/prod)
2. Thực hiện kiểm tra tự động trước khi triển khai
3. Sử dụng service principals để xác thực
4. Lưu cấu hình nhạy cảm trong bí mật/biến pipeline
5. Thực hiện các cổng duyệt phê duyệt cho triển khai sản xuất

---

## Chủ đề nâng cao

### H: Tôi có thể mở rộng azd với chức năng tùy chỉnh không?
**Đ**: Có, thông qua các hook triển khai trong `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### H: Làm thế nào tôi tích hợp azd với các quy trình DevOps hiện có?
**Đ**: 
1. Sử dụng các lệnh azd trong các script pipeline hiện có
2. Chuẩn hóa các mẫu azd trên toàn đội
3. Tích hợp với hệ thống giám sát và cảnh báo hiện có
4. Sử dụng đầu ra JSON của azd để tích hợp pipeline

### H: Tôi có thể sử dụng azd với Azure DevOps không?
**Đ**: Có, azd hoạt động với bất kỳ hệ thống CI/CD nào. Tạo pipeline Azure DevOps sử dụng các lệnh azd.

### H: Làm thế nào tôi đóng góp cho azd hoặc tạo các mẫu cộng đồng?
**Đ**: 
1. **công cụ azd**: Đóng góp tại [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Mẫu**: Theo dõi [hướng dẫn đóng góp thư viện Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Tài liệu**: Đóng góp tài liệu tại [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### H: Lộ trình của azd là gì?
**Đ**: Kiểm tra [lộ trình chính thức](https://github.com/Azure/azure-dev/projects) cho các tính năng và cải tiến dự kiến.

### H: Làm thế nào tôi di chuyển từ các công cụ triển khai khác sang azd?
**Đ**: 
1. Phân tích kiến trúc triển khai hiện tại
2. Tạo các mẫu Bicep tương đương
3. Cấu hình `azure.yaml` để phù hợp với các dịch vụ hiện tại
4. Kiểm tra kỹ trong môi trường phát triển
5. Di chuyển dần dần các môi trường

---

## Vẫn còn câu hỏi?

### **Tìm kiếm trước**
- Kiểm tra [tài liệu chính thức](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Tìm kiếm [vấn đề trên GitHub](https://github.com/Azure/azure-dev/issues) cho các vấn đề tương tự

### **Nhận hỗ trợ**
- [Thảo luận GitHub](https://github.com/Azure/azure-dev/discussions) - Hỗ trợ cộng đồng
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Câu hỏi kỹ thuật
- [Discord Azure](https://discord.gg/azure) - Chat cộng đồng thời gian thực

### **Báo cáo vấn đề**
- [Vấn đề GitHub](https://github.com/Azure/azure-dev/issues/new) - Báo lỗi và yêu cầu tính năng
- Bao gồm nhật ký liên quan, thông báo lỗi và các bước tái tạo

### **Tìm hiểu thêm**
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Trung tâm kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Khung công tác Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Hướng dẫn kỹ thuật được xem xét: ngày 4 tháng 11, 2026. Phải kiểm tra tính sẵn có và giá cả đám mây theo đăng ký và khu vực của bạn.*

---

**Điều hướng**
- **Bài học trước**: [Thuật ngữ](glossary.md)
- **Bài học tiếp theo**: [Hướng dẫn học tập](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->