# Câu Hỏi Thường Gặp (FAQ)

**Nhận Trợ Giúp theo Chương**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../README.md)
- **🚆 Vấn Đề Cài Đặt**: [Chương 1: Cài Đặt & Thiết Lập](../docs/chapter-01-foundation/installation.md)
- **🤖 Câu Hỏi về AI**: [Chương 2: Phát Triển AI-Đầu Tiên](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Khắc Phục Sự Cố**: [Chương 7: Khắc Phục Lỗi & Gỡ Rối](../docs/chapter-07-troubleshooting/common-issues.md)

## Giới Thiệu

FAQ toàn diện này cung cấp câu trả lời cho các câu hỏi phổ biến nhất về Azure Developer CLI (azd) và triển khai Azure. Tìm giải pháp nhanh cho các vấn đề thường gặp, hiểu các phương pháp hay nhất, và làm rõ các khái niệm cùng quy trình làm việc của azd.

## Mục Tiêu Học Tập

Qua việc xem xét FAQ này, bạn sẽ:
- Tìm câu trả lời nhanh cho các câu hỏi và sự cố phổ biến về Azure Developer CLI
- Hiểu các khái niệm và thuật ngữ chính qua định dạng hỏi đáp thực tiễn
- Truy cập các giải pháp khắc phục sự cố cho các vấn đề và tình huống lỗi thường gặp
- Học các phương pháp hay nhất thông qua các câu hỏi thường gặp về tối ưu hóa
- Khám phá các tính năng và khả năng nâng cao qua các câu hỏi cấp chuyên gia
- Tham khảo hướng dẫn về chi phí, bảo mật, và chiến lược triển khai một cách hiệu quả

## Kết Quả Học Tập

Thường xuyên tham khảo FAQ này, bạn sẽ có thể:
- Tự mình giải quyết các sự cố thường gặp của Azure Developer CLI bằng các giải pháp được cung cấp
- Đưa ra quyết định thông minh về chiến lược và cấu hình triển khai
- Hiểu mối quan hệ giữa azd và các công cụ, dịch vụ Azure khác
- Áp dụng các phương pháp hay nhất dựa trên kinh nghiệm cộng đồng và khuyến nghị chuyên gia
- Hiệu quả khắc phục lỗi xác thực, triển khai và cấu hình
- Tối ưu chi phí và hiệu suất dựa trên hiểu biết và đề xuất trong FAQ

## Mục Lục

- [Bắt Đầu](#getting-started)
- [Xác Thực & Truy Cập](#authentication--access)
- [Mẫu & Dự Án](#templates--projects)
- [Triển Khai & Hạ Tầng](#deployment--infrastructure)
- [Cấu Hình & Môi Trường](#configuration--environments)
- [Khắc Phục Sự Cố](#troubleshooting)
- [Chi Phí & Thanh Toán](#cost--billing)
- [Phương Pháp Hay Nhất](#best-practices)
- [Chủ Đề Nâng Cao](#advanced-topics)

---

## Bắt Đầu

### H: Azure Developer CLI (azd) là gì?
**Đ**: Azure Developer CLI (azd) là công cụ dòng lệnh tập trung vào nhà phát triển giúp rút ngắn thời gian để bạn đưa ứng dụng từ môi trường phát triển cục bộ lên Azure. Nó cung cấp các phương pháp hay nhất qua các mẫu và hỗ trợ toàn bộ chu kỳ triển khai.

### H: azd khác Azure CLI như thế nào?
**Đ**: 
- **Azure CLI**: Công cụ đa năng để quản lý tài nguyên Azure
- **azd**: Công cụ tập trung vào nhà phát triển cho quy trình triển khai ứng dụng
- azd có quy trình xác thực và triển khai riêng; Azure CLI là công cụ riêng biệt, bổ trợ
- azd bao gồm mẫu, quản lý môi trường và tự động hóa triển khai

### H: Tôi có cần cài đặt Azure CLI để dùng azd không?
**Đ**: Không cần cho quy trình chính của AZD. Xác thực với `azd auth login`. Cài Azure CLI riêng khi một hook mẫu hoặc bài tập yêu cầu chạy lệnh `az`.

### H: azd hỗ trợ ngôn ngữ lập trình nào?
**Đ**: azd không phụ thuộc ngôn ngữ. Nó làm việc với:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Trang web tĩnh
- Ứng dụng container hóa

### H: Tôi có thể dùng azd với dự án hiện có không?
**Đ**: Có! Bạn có thể:
1. Dùng `azd init` để thêm cấu hình azd cho dự án hiện có
2. Điều chỉnh dự án hiện có cho phù hợp cấu trúc mẫu azd
3. Tạo mẫu tuỳ chỉnh dựa trên kiến trúc hiện có của bạn

### H: Có gì thay đổi với mở rộng Foundry khi ra mắt chính thức?
**Đ**: Gói `microsoft.foundry` đã đạt phiên bản 1.0 và ra mắt chính thức vào ngày 5 tháng 11 năm 2026. Với AZD 1.37.0+, sử dụng `azd ext install microsoft.foundry` để cài bảy tiện ích mở rộng chính cho tác nhân, kết nối, kiểm tra, dự án, quy trình, kỹ năng, và công cụ. Đây không phải là namespace lệnh mới, các thành phần được phiên bản độc lập. Đánh giá, bộ dữ liệu, tinh chỉnh và mô hình tùy chỉnh được cài riêng; các tính năng xem trước tùy chọn không trở thành chính thức chỉ vì gói đã ra mắt.

Bài [hướng dẫn sử dụng hosted-agent](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) sử dụng Python 3.13+ và uv hiện tại. `azd ai agent run` mở Agent Inspector cục bộ, nhưng các cuộc gọi mô hình vẫn dùng Azure và phát sinh phí. Chế độ mã `azd deploy` tải lên mã nguồn để dựng từ xa mà không cần xây dựng container cục bộ.

### Hỏi: `azd down` có xóa một hosted agent khỏi dự án Foundry hiện có không?
**Đáp**: Không đối với đường dẫn tái sử dụng dự án mô tả trong hosted-agent quickstart: nó giữ nguyên dự án, hosted agent và các tài nguyên khác. Hãy xóa các tài nguyên không mong muốn riêng biệt mà không xóa tài nguyên dùng chung. Nếu môi trường tạo một dự án Foundry mới, `azd down` sẽ xóa nhóm tài nguyên và mọi thứ trong đó. Xem lại [hướng dẫn dọn dẹp](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) và các yêu cầu xác nhận xóa trước khi đồng ý.

---

## Xác thực & Truy cập

### Hỏi: Làm thế nào để xác thực với Azure bằng azd?
**Đáp**: Dùng `azd auth login` sẽ mở cửa sổ trình duyệt để xác thực Azure. Đối với trường hợp CI/CD, dùng service principals hoặc managed identities.

### Hỏi: Tôi có thể dùng azd với nhiều đăng ký Azure không?
**Đáp**: Có. Dùng `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` để chỉ định đăng ký dùng cho từng môi trường.

### Hỏi: Tôi cần quyền gì để triển khai với azd?
**Đáp**: Thường bạn cần:
- Quyền **Contributor** trên nhóm tài nguyên hoặc đăng ký
- Quyền **User Access Administrator** nếu triển khai tài nguyên yêu cầu phân quyền
- Quyền cụ thể thay đổi theo mẫu và tài nguyên triển khai

### Hỏi: Tôi có thể dùng azd trong pipeline CI/CD không?
**Đáp**: Chắc chắn rồi! azd được thiết kế để tích hợp CI/CD. Dùng service principals để xác thực và thiết lập biến môi trường cho cấu hình.

### Hỏi: Tôi xử lý xác thực trong GitHub Actions thế nào?
**Đáp**: Ưu tiên sử dụng workload identity federation (OIDC), cấu hình với `azd pipeline config`. Quy trình làm việc tạo ra sẽ cài AZD và xác thực AZD trực tiếp với danh tính liên kết. Một bước `azure/login` riêng lẻ không thiết lập đăng nhập AZD. Bước đăng nhập trong một job hiện có là:
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

Triển khai hoặc phân phối sau khi đăng nhập, với môi trường AZD, đăng ký và vị trí đã cấu hình. Chứng chỉ danh tính liên kết phải tin cậy kho mã/người dùng hoặc môi trường GitHub, và các vai trò Azure của nó phải cho phép các thao tác yêu cầu.

---

## Mẫu & Dự án

### Hỏi: Tôi có thể tìm các mẫu azd ở đâu?
**Đáp**: 
- Mẫu chính thức và cộng đồng: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Mẫu cộng đồng: tìm kiếm GitHub với từ khóa "azd-template"
- Dùng `azd template list` để duyệt các mẫu có sẵn

### Hỏi: Làm sao để tạo mẫu tùy chỉnh?
**Đáp**: 
1. Bắt đầu với cấu trúc mẫu hiện có
2. Sửa `azure.yaml`, các tệp hạ tầng, và mã ứng dụng
3. Kiểm thử kỹ với `azd up`
4. Xuất bản lên GitHub với các thẻ thích hợp

### Hỏi: Tôi có thể dùng azd mà không cần mẫu không?
**Đáp**: Có, dùng `azd init` trong dự án hiện có để tạo các tệp cấu hình cần thiết. Bạn sẽ cần cấu hình `azure.yaml` và các tệp hạ tầng thủ công.

### Hỏi: Sự khác biệt giữa mẫu chính thức và mẫu cộng đồng là gì?
**Đáp**: 
- **Mẫu chính thức**: Được Microsoft duy trì, cập nhật thường xuyên, tài liệu đầy đủ
- **Mẫu cộng đồng**: Do các nhà phát triển tạo ra, có thể có các trường hợp sử dụng chuyên biệt, chất lượng và bảo trì khác nhau

### Hỏi: Làm sao để tôi cập nhật một mẫu trong dự án của mình?
**Đáp**: Mẫu không được cập nhật tự động. Bạn có thể:
1. So sánh và hợp nhất các thay đổi từ mẫu nguồn thủ công
2. Bắt đầu lại với `azd init` bằng cách sử dụng mẫu đã cập nhật
3. Chọn lọc các cải tiến cụ thể từ các mẫu đã cập nhật

---

## Triển khai & Hạ tầng

### Hỏi: azd có thể triển khai dịch vụ Azure nào?
**Đáp**: azd có thể triển khai bất kỳ dịch vụ Azure nào thông qua các mẫu Bicep/ARM, bao gồm:
- App Services, Container Apps, Functions
- Cơ sở dữ liệu (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Mạng, bảo mật, và tài nguyên giám sát

### Hỏi: Tôi có thể triển khai ở nhiều khu vực không?
**Đáp**: Có, cấu hình nhiều khu vực trong các mẫu Bicep của bạn và đặt tham số location phù hợp cho từng môi trường.

### Hỏi: Làm sao xử lý các di chuyển schema cơ sở dữ liệu?
**Đáp**: Sử dụng deployment hooks trong `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Hỏi: Tôi có thể chỉ triển khai hạ tầng mà không có ứng dụng không?
**Đáp**: Có, sử dụng `azd provision` để chỉ triển khai các thành phần hạ tầng được định nghĩa trong các mẫu của bạn.

### Hỏi: Làm sao tôi triển khai vào các tài nguyên Azure hiện có?
**Đáp**: Có, khi mẫu hỗ trợ. Tham chiếu tài nguyên hiện có với khai báo `existing` của Bicep hoặc tham số tài nguyên hiện có được tài liệu của mẫu cung cấp, và ánh xạ dịch vụ ứng dụng đến các mục tiêu dự kiến. Điều này không nhập quyền sở hữu hoặc tự động tạo các quyền thiếu. Xem lại mẫu trước khi triển khai.

### Hỏi: Tôi có thể dùng Terraform thay vì Bicep không?
**Đáp**: Có. AZD hỗ trợ Terraform cũng như Bicep. Chọn mẫu dựa trên Terraform hoặc cấu hình `infra.provider: terraform` trong `azure.yaml`, kèm theo các file Terraform và cấu hình state/backend phù hợp. Xem [Quy trình làm việc Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Cấu hình & Môi trường

### Hỏi: Làm sao quản lý các môi trường khác nhau (dev, staging, prod)?
**Đáp**: Tạo các môi trường riêng bằng `azd env new <environment-name>` và cấu hình các thiết lập khác nhau cho từng môi trường:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Hỏi: Cấu hình môi trường được lưu ở đâu?
**Đáp**: Trong thư mục `.azure` bên trong thư mục dự án của bạn. Mỗi môi trường có thư mục riêng với các file cấu hình.

### Hỏi: Làm sao đặt cấu hình đặc thù cho từng môi trường?
**Đáp**: Sử dụng `azd env set` để cấu hình biến môi trường:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Hỏi: Tôi có thể chia sẻ cấu hình môi trường giữa các thành viên trong nhóm không?
**Đáp**: Thư mục `.azure` chứa thông tin nhạy cảm và không nên được commit vào quản lý phiên bản. Thay vào đó:
1. Ghi chép các biến môi trường cần thiết
2. Dùng script triển khai để thiết lập môi trường
3. Sử dụng Azure Key Vault cho cấu hình nhạy cảm

### Hỏi: Làm sao ghi đè các giá trị mặc định của mẫu?
**Đáp**: Đặt biến môi trường tương ứng với các tham số mẫu:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Chỉ những biến được mẫu sử dụng mới ảnh hưởng đến việc triển khai. `SKU_NAME` ở trên là ví dụ về đầu vào tùy chỉnh, không phải cài đặt AZD chung.

---

## Khắc phục sự cố

### Hỏi: Tại sao `azd up` bị lỗi?
**Đáp**: Nguyên nhân phổ biến:
1. **Sự cố xác thực**: Chạy `azd auth login`
2. **Quyền hạn không đủ**: Kiểm tra các vai trò Azure được phân công
3. **Xung đột tên tài nguyên**: Xem lại tài nguyên bị xung đột và các tham số đặt tên trong mẫu; tạo một môi trường riêng biệt với `azd env new` khi cần cách ly
4. **Vấn đề hạn ngạch/dung lượng**: Kiểm tra tính khả dụng theo vùng
5. **Lỗi mẫu**: Xác thực các mẫu Bicep

### Hỏi: Làm thế nào để gỡ lỗi khi triển khai thất bại?
**Đáp**: 
1. Sử dụng `azd deploy --debug` để xem chi tiết đầu ra
2. Kiểm tra lịch sử triển khai trên cổng Azure
3. Xem lại Nhật ký Hoạt động trong cổng Azure
4. Sử dụng `azd show` để hiển thị trạng thái môi trường hiện tại

### Hỏi: Tại sao biến môi trường của tôi không hoạt động?
**Đáp**: Kiểm tra:
1. Tên biến khớp chính xác với các tham số trong mẫu
2. Giá trị được đặt dấu ngoặc nếu có chứa dấu cách
3. Môi trường đã được chọn: `azd env select <environment>`
4. Biến được thiết lập trong đúng môi trường

### Hỏi: Làm thế nào để dọn dẹp các triển khai thất bại?
**Đáp**: 
```bash
azd down
```
Xem lại môi trường được chọn và xác nhận xóa trước. Việc này sẽ xóa các tài nguyên Azure đã cấp phát, không xóa cấu hình môi trường `.azure` tại máy cục bộ. `--purge` thêm yêu cầu xóa vĩnh viễn các tài nguyên đã bị xóa mềm và có thể bị chặn bởi chính sách giữ/làm sạch; đây không phải là bước phục hồi thường xuyên.

### Hỏi: Tại sao ứng dụng của tôi không truy cập được sau khi triển khai?
**Đáp**: Kiểm tra:
1. Triển khai đã hoàn thành thành công
2. Ứng dụng đang chạy (kiểm tra nhật ký trong cổng Azure)
3. Các nhóm bảo mật mạng cho phép lưu lượng
4. DNS/tên miền tùy chỉnh được cấu hình đúng

---

## Chi phí & Thanh toán

### Hỏi: Việc triển khai azd sẽ tốn bao nhiêu chi phí?
**Đáp**: Chi phí phụ thuộc vào:
- Dịch vụ Azure được triển khai
- Các mức dịch vụ/SKU được chọn
- Sự khác biệt về giá theo vùng
- Mô hình sử dụng

Sử dụng [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) để ước tính.

### Hỏi: Làm thế nào để kiểm soát chi phí trong các triển khai azd?
**Đáp**: 
1. Sử dụng các SKU cấp thấp hơn cho môi trường phát triển
2. Thiết lập ngân sách và cảnh báo Azure
3. Sử dụng `azd down` để loại bỏ tài nguyên khi không cần thiết
4. Chọn các vùng phù hợp (chi phí khác nhau theo vị trí)
5. Sử dụng công cụ Quản lý Chi phí Azure

### H: Có các tùy chọn tầng miễn phí cho các mẫu azd không?
**Đ**: Một số dịch vụ có SKU miễn phí hoặc khoản cấp hàng tháng, tùy thuộc vào điều kiện đủ tiêu chuẩn, kế hoạch lưu trữ, khu vực và giới hạn đăng ký. Những điều này không làm cho toàn bộ mẫu miễn phí: cơ sở dữ liệu, tìm kiếm, mạng, registry, dữ liệu truyền về, và suy luận mô hình có thể phát sinh phí riêng biệt. Kiểm tra [danh sách dịch vụ miễn phí Azure](https://azure.microsoft.com/free/) và giá hiện tại của từng tài nguyên trước khi triển khai.

### H: Làm thế nào để tôi ước tính chi phí trước khi triển khai?
**Đ**: 
1. Xem xét `main.bicep` của mẫu để biết những tài nguyên được tạo
2. Sử dụng Máy tính Giá Azure với các SKU cụ thể
3. Triển khai trước sang môi trường phát triển để theo dõi chi phí thực tế
4. Sử dụng Azure Cost Management để phân tích chi phí chi tiết

---

## Các Thực Tiễn Tốt Nhất

### H: Các thực tiễn tốt nhất cho cấu trúc dự án azd là gì?
**Đ**: 
1. Giữ mã ứng dụng tách biệt với hạ tầng
2. Sử dụng tên dịch vụ ý nghĩa trong `azure.yaml`
3. Thực hiện xử lý lỗi thích hợp trong các script build
4. Sử dụng cấu hình riêng cho từng môi trường
5. Bao gồm tài liệu hướng dẫn đầy đủ

### H: Tôi nên tổ chức nhiều dịch vụ trong azd như thế nào?
**Đ**: Sử dụng cấu trúc được đề xuất:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### H: Tôi có nên cam kết thư mục `.azure` vào quản lý phiên bản không?
**Đ**: **Không!** Thư mục `.azure` chứa thông tin nhạy cảm. Thêm nó vào `.gitignore`:
```gitignore
.azure/
```

### H: Tôi xử lý các bí mật và cấu hình nhạy cảm như thế nào?
**Đ**: 
1. Sử dụng Azure Key Vault cho các bí mật
2. Tham chiếu bí mật Key Vault trong cấu hình ứng dụng
3. Không bao giờ cam kết bí mật vào quản lý phiên bản
4. Sử dụng managed identities cho xác thực dịch vụ với dịch vụ

### H: Cách tiếp cận được khuyến nghị cho CI/CD với azd là gì?
**Đ**: 
1. Sử dụng môi trường riêng biệt cho từng giai đoạn (dev/staging/prod)
2. Thực hiện kiểm thử tự động trước khi triển khai
3. Sử dụng service principals để xác thực
4. Lưu cấu hình nhạy cảm trong bí mật/biến của pipeline
5. Thực hiện các cổng phê duyệt cho triển khai môi trường sản xuất

---

## Chủ Đề Nâng Cao

### H: Tôi có thể mở rộng azd với chức năng tùy chỉnh không?
**Đ**: Có, thông qua các deployment hooks trong `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### H: Làm thế nào để tôi tích hợp azd với các quy trình DevOps hiện có?
**Đ**: 
1. Sử dụng các lệnh azd trong các script pipeline hiện có
2. Chuẩn hóa các mẫu azd trên các nhóm
3. Tích hợp với giám sát và cảnh báo hiện có
4. Sử dụng đầu ra JSON của azd để tích hợp pipeline

### H: Tôi có thể sử dụng azd với Azure DevOps không?
**Đ**: Có, azd hoạt động với bất kỳ hệ thống CI/CD nào. Tạo các pipeline Azure DevOps sử dụng các lệnh azd.

### H: Làm thế nào để tôi đóng góp cho azd hoặc tạo mẫu cộng đồng?
**Đ**: 
1. **Công cụ azd**: Đóng góp cho [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Mẫu**: Theo dõi [hướng dẫn đóng góp thư viện AZD tuyệt vời](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Tài liệu**: Đóng góp cho tài liệu tại [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### H: Lộ trình cho azd là gì?
**Đ**: Kiểm tra [lộ trình chính thức](https://github.com/Azure/azure-dev/projects) cho các tính năng và cải tiến dự kiến.

### H: Làm thế nào để tôi di chuyển từ các công cụ triển khai khác sang azd?
**Đ**: 
1. Phân tích kiến trúc triển khai hiện tại
2. Tạo các mẫu Bicep tương đương
3. Cấu hình `azure.yaml` để phù hợp với các dịch vụ hiện tại
4. Kiểm thử kỹ lưỡng trong môi trường phát triển
5. Di chuyển các môi trường một cách dần dần

---

## Vẫn Còn Câu Hỏi?

### **Tìm Kiếm Trước**
- Kiểm tra [tài liệu chính thức](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Tìm kiếm [vấn đề trên GitHub](https://github.com/Azure/azure-dev/issues) cho các vấn đề tương tự

### **Nhận Trợ Giúp**
- [Thảo luận trên GitHub](https://github.com/Azure/azure-dev/discussions) - Hỗ trợ cộng đồng
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Câu hỏi kỹ thuật
- [Discord Azure](https://discord.gg/azure) - Trò chuyện cộng đồng thời gian thực

### **Báo Cáo Vấn Đề**
- [Vấn đề trên GitHub](https://github.com/Azure/azure-dev/issues/new) - Báo lỗi và đề xuất tính năng
- Bao gồm nhật ký liên quan, thông báo lỗi, và các bước để tái hiện

### **Tìm Hiểu Thêm**
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Khung Kiến trúc Tốt Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Hướng dẫn kỹ thuật được rà soát: Ngày 4 tháng 11 năm 2026. Cần kiểm tra tính sẵn có trên đám mây và giá cả cho đăng ký cũng như khu vực của bạn.*

---

**Điều Hướng**
- **Bài học trước**: [Thuật ngữ](glossary.md)
- **Bài học tiếp theo**: [Hướng dẫn học tập](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->