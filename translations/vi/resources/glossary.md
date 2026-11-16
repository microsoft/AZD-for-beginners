# Thuật Ngữ - Azure và Thuật Ngữ AZD

**Tham khảo cho Tất cả Chương**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../README.md)
- **📖 Học Cơ Bản**: [Chương 1: Cơ Bản về AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Thuật Ngữ AI**: [Chương 2: Phát Triển AI-First](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Giới Thiệu

Bảng thuật ngữ toàn diện này cung cấp định nghĩa cho các thuật ngữ, khái niệm, và từ viết tắt được sử dụng trong Azure Developer CLI và phát triển đám mây Azure. Tham khảo thiết yếu để hiểu tài liệu kỹ thuật, xử lý sự cố, và giao tiếp hiệu quả về dự án azd và dịch vụ Azure.

## Mục Tiêu Học Tập

Bằng cách sử dụng bảng thuật ngữ này, bạn sẽ:
- Hiểu các thuật ngữ và khái niệm thiết yếu của Azure Developer CLI
- Thành thạo từ vựng và thuật ngữ kỹ thuật phát triển đám mây Azure
- Tham khảo hiệu quả thuật ngữ Hạ tầng dưới dạng Mã và triển khai
- Hiểu tên dịch vụ Azure, từ viết tắt, và mục đích của chúng
- Truy cập định nghĩa cho thuật ngữ xử lý sự cố và gỡ lỗi
- Học các khái niệm kiến trúc và phát triển Azure nâng cao

## Kết Quả Học Tập

Thường xuyên tham khảo bảng thuật ngữ này, bạn sẽ có thể:
- Giao tiếp hiệu quả sử dụng thuật ngữ chính xác của Azure Developer CLI
- Hiểu tài liệu kỹ thuật và thông báo lỗi rõ ràng hơn
- Điều hướng dịch vụ và khái niệm Azure một cách tự tin
- Xử lý sự cố sử dụng từ vựng kỹ thuật phù hợp
- Góp phần vào thảo luận nhóm với ngôn ngữ kỹ thuật chính xác
- Mở rộng kiến thức phát triển đám mây Azure một cách có hệ thống

## A

**ARM Template**  
Mẫu Azure Resource Manager. Định dạng Hạ tầng dưới dạng Mã dựa trên JSON dùng để định nghĩa và triển khai các tài nguyên Azure theo cách mô tả.

**App Service**  
Dịch vụ nền tảng dưới dạng dịch vụ (PaaS) của Azure để lưu trữ ứng dụng web, REST API, và backend di động mà không cần quản lý hạ tầng.

**Application Insights**  
Dịch vụ giám sát hiệu suất ứng dụng (APM) của Azure cung cấp cái nhìn sâu sắc về hiệu suất, khả dụng và mức sử dụng ứng dụng.

**Azure CLI**  
Giao diện dòng lệnh để quản lý tài nguyên Azure. Nó bổ sung cho AZD nhưng có đăng nhập riêng; xác thực chính của AZD sử dụng `azd auth login`.

**Azure Developer CLI (azd)**  
Công cụ dòng lệnh tập trung vào nhà phát triển giúp tăng tốc quá trình xây dựng và triển khai ứng dụng lên Azure sử dụng mẫu và Hạ tầng dưới dạng Mã.

**azure.yaml**  
Tệp cấu hình chính cho dự án azd định nghĩa dịch vụ, hạ tầng và móc triển khai.

**Azure Resource Manager (ARM)**  
Dịch vụ triển khai và quản lý của Azure cung cấp lớp quản lý để tạo, cập nhật và xóa tài nguyên.

## B

**Bicep**  
Ngôn ngữ đặc thù lĩnh vực (DSL) do Microsoft phát triển để triển khai tài nguyên Azure. Cung cấp cú pháp đơn giản hơn ARM template trong khi biên dịch ra ARM.

**Build**  
Quá trình biên dịch mã nguồn, cài đặt phụ thuộc, và chuẩn bị ứng dụng cho triển khai.

**Blue-Green Deployment**  
Chiến lược triển khai sử dụng hai môi trường sản xuất giống hệt nhau (màu xanh và màu xanh lá) để giảm thiểu thời gian chết và rủi ro.

## C

**Container Apps**  
Dịch vụ container serverless của Azure cho phép chạy ứng dụng container hóa mà không cần quản lý hạ tầng phức tạp.

**CI/CD**  
Tích hợp liên tục/Triển khai liên tục. Các thực hành tự động để tích hợp thay đổi mã và triển khai ứng dụng.

**Cosmos DB**  
Dịch vụ cơ sở dữ liệu đa mô hình phân phối toàn cầu của Azure cung cấp các SLA toàn diện về thông lượng, độ trễ, khả dụng và tính nhất quán.

**Configuration**  
Cài đặt và tham số kiểm soát hành vi ứng dụng và tùy chọn triển khai.

## D

**Deployment**  
Quá trình cài đặt và cấu hình ứng dụng cùng các phụ thuộc trên hạ tầng đích.

**Docker**  
Nền tảng phát triển, vận chuyển và chạy ứng dụng sử dụng công nghệ container hóa.

**Dockerfile**  
Tệp văn bản chứa hướng dẫn để xây dựng hình ảnh container Docker.

## E

**Environment**  
Mục tiêu triển khai đại diện cho một bản sao cụ thể của ứng dụng bạn (ví dụ: phát triển, staging, sản xuất).

**Environment Variables**  
Giá trị cấu hình lưu dưới dạng cặp khóa-giá trị mà ứng dụng có thể truy cập khi chạy.

**Endpoint**  
URL hoặc địa chỉ mạng nơi một ứng dụng hoặc dịch vụ có thể truy cập.

## F

**Function App**  
Dịch vụ điện toán serverless của Azure cho phép chạy mã dựa trên sự kiện mà không cần quản lý hạ tầng.

## G

**GitHub Actions**  
Nền tảng CI/CD tích hợp với kho lưu trữ GitHub để tự động hóa quy trình làm việc.

**Git**  
Hệ thống kiểm soát phiên bản phân tán được sử dụng để theo dõi thay đổi trong mã nguồn.

## H

**Hooks**  
Các script hoặc lệnh tùy chỉnh chạy tại các điểm cụ thể trong vòng đời triển khai (trước cung cấp, sau cung cấp, trước triển khai, sau triển khai).

**Host**  
Loại dịch vụ Azure nơi ứng dụng sẽ được triển khai (ví dụ: appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Thực hành định nghĩa và quản lý hạ tầng thông qua mã thay vì quy trình thủ công.

**Init**  
Quá trình khởi tạo dự án azd mới, thường từ một mẫu.

## J

**JSON**  
JavaScript Object Notation. Định dạng trao đổi dữ liệu thường dùng cho tệp cấu hình và phản hồi API.

**JWT**  
JSON Web Token. Chuẩn để truyền thông tin bảo mật giữa các bên dưới dạng đối tượng JSON.

## K

**Key Vault**  
Dịch vụ của Azure để lưu trữ và quản lý bí mật, khóa, và chứng chỉ một cách an toàn.

**Kusto Query Language (KQL)**  
Ngôn ngữ truy vấn dùng để phân tích dữ liệu trong Azure Monitor, Application Insights, và các dịch vụ Azure khác.

## L

**Load Balancer**  
Dịch vụ phân phối lưu lượng mạng đến nhiều máy chủ hoặc bản sao.

**Log Analytics**  
Dịch vụ Azure để thu thập, phân tích, và xử lý dữ liệu telemety từ môi trường đám mây và tại chỗ.

## M

**Managed Identity**  
Tính năng Azure cung cấp danh tính được quản lý tự động cho dịch vụ Azure để xác thực đến các dịch vụ Azure khác.

**Microservices**  
Phương pháp kiến trúc nơi ứng dụng được xây dựng như tập hợp các dịch vụ nhỏ, độc lập.

**Monitor**  
Giải pháp giám sát tích hợp của Azure cung cấp khả năng quan sát toàn diện qua ứng dụng và hạ tầng.

## N

**Node.js**  
Runtime JavaScript xây dựng trên động cơ JavaScript V8 của Chrome để tạo ứng dụng phía máy chủ.

**npm**  
Trình quản lý gói cho Node.js điều phối phụ thuộc và gói phần mềm.

## O

**Output**  
Giá trị trả về từ triển khai hạ tầng có thể sử dụng bởi ứng dụng hoặc tài nguyên khác.

## P

**Package**  
Quá trình chuẩn bị mã ứng dụng và các phụ thuộc để triển khai.

**Parameters**  
Giá trị đầu vào được truyền cho mẫu hạ tầng để tùy chỉnh triển khai.

**PostgreSQL**  
Hệ quản trị cơ sở dữ liệu quan hệ mã nguồn mở được hỗ trợ như dịch vụ quản lý trên Azure.

**Provisioning**  
Quá trình tạo và cấu hình các tài nguyên Azure được định nghĩa trong mẫu hạ tầng.

## Q

**Quota**  
Giới hạn về số lượng tài nguyên có thể tạo trong một đăng ký hoặc vùng Azure.

## R

**Resource Group**  
Container logic chứa các tài nguyên Azure cùng vòng đời, quyền hạn và chính sách.

**Resource Token**  
Chuỗi duy nhất được tạo bởi azd để đảm bảo tên tài nguyên là duy nhất qua các triển khai.

**REST API**  
Kiểu kiến trúc thiết kế ứng dụng mạng sử dụng các phương thức HTTP.

**Rollback**  
Quá trình trở về phiên bản trước của ứng dụng hoặc cấu hình hạ tầng.

## S

**Service**  
Thành phần của ứng dụng bạn định nghĩa trong azure.yaml (ví dụ: frontend web, backend API, cơ sở dữ liệu).

**SKU**  
Đơn vị quản lý hàng tồn kho. Đại diện cho các tầng dịch vụ hoặc mức hiệu suất dịch vụ Azure.

**SQL Database**  
Dịch vụ cơ sở dữ liệu quan hệ được quản lý của Azure dựa trên Microsoft SQL Server.

**Static Web Apps**  
Dịch vụ Azure để xây dựng và triển khai ứng dụng web đầy đủ từ kho mã nguồn.

**Storage Account**  
Dịch vụ Azure cung cấp lưu trữ đám mây cho các đối tượng dữ liệu bao gồm blobs, files, queues, và tables.

**Subscription**  
Container tài khoản Azure chứa nhóm tài nguyên và tài nguyên, cùng quản lý thanh toán và truy cập liên quan.

## T

**Template**  
Cấu trúc dự án có sẵn chứa mã ứng dụng, định nghĩa hạ tầng, và cấu hình cho các kịch bản phổ biến.

**Terraform**  
Công cụ Hạ tầng dưới dạng Mã mã nguồn mở hỗ trợ nhiều nhà cung cấp đám mây bao gồm Azure.

**Traffic Manager**  
Bộ cân bằng tải dựa trên DNS của Azure để phân phối lưu lượng giữa các vùng Azure toàn cầu.

## U

**URI**  
Định danh Tài nguyên Đồng nhất. Chuỗi xác định một tài nguyên cụ thể.

**URL**  
Bộ định vị Tài nguyên Đồng nhất. Loại URI chỉ định vị trí tài nguyên và cách truy xuất nó.

## V

**Virtual Network (VNet)**  
Khối xây dựng cơ bản cho mạng riêng trong Azure, cung cấp tính cô lập và phân đoạn.

**VS Code**  
Visual Studio Code. Trình soạn thảo mã phổ biến tích hợp tuyệt vời với Azure và azd.

## W

**Webhook**  
Call back HTTP được kích hoạt bởi các sự kiện cụ thể, thường dùng trong pipeline CI/CD.

**What-if**  
Tính năng Azure hiển thị những thay đổi sẽ được thực hiện bởi triển khai mà không thực sự thực thi nó.

## Y

**YAML**  
YAML Ain't Markup Language. Chuẩn tuần tự hóa dữ liệu dễ đọc cho con người dùng trong tệp cấu hình như azure.yaml.

## Z

**Zone**  
Vị trí vật lý riêng biệt trong một khu vực Azure cung cấp khả năng dự phòng và sẵn sàng cao.

---

## Viết Tắt Thông Dụng

| Viết Tắt | Hình Thức Đầy Đủ | Mô Tả |
|---------|-----------|-------------|
| AAD | Azure Active Directory (nay là Microsoft Entra ID) | Dịch vụ quản lý danh tính và truy cập |
| ACR | Azure Container Registry | Dịch vụ đăng ký hình ảnh container |
| AKS | Azure Kubernetes Service | Dịch vụ Kubernetes được quản lý |
| API | Application Programming Interface | Bộ giao thức để xây dựng phần mềm |
| ARM | Azure Resource Manager | Dịch vụ triển khai và quản lý Azure |
| CDN | Content Delivery Network | Mạng phân phối nội dung phân tán |
| CI/CD | Continuous Integration/Continuous Deployment | Thực hành phát triển tự động |
| CLI | Command Line Interface | Giao diện dòng lệnh |
| DNS | Domain Name System | Hệ thống chuyển đổi tên miền thành địa chỉ IP |
| HTTPS | Hypertext Transfer Protocol Secure | Phiên bản bảo mật của HTTP |
| IaC | Infrastructure as Code | Quản lý hạ tầng qua mã |
| JSON | JavaScript Object Notation | Định dạng trao đổi dữ liệu |
| JWT | JSON Web Token | Định dạng token truyền tin an toàn |
| KQL | Kusto Query Language | Ngôn ngữ truy vấn cho dịch vụ dữ liệu Azure |
| RBAC | Role-Based Access Control | Phương pháp kiểm soát truy cập theo vai trò |
| REST | Representational State Transfer | Kiểu kiến trúc cho dịch vụ web |
| SDK | Software Development Kit | Bộ công cụ phát triển phần mềm |
| SLA | Service Level Agreement | Cam kết về sẵn sàng/hiệu suất dịch vụ |
| SQL | Structured Query Language | Ngôn ngữ quản lý cơ sở dữ liệu quan hệ |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Giao thức mã hóa |
| URI | Uniform Resource Identifier | Chuỗi xác định một tài nguyên |
| URL | Uniform Resource Locator | Loại URI xác định vị trí tài nguyên |
| VM | Virtual Machine | Mô phỏng hệ thống máy tính |
| VNet | Virtual Network | Mạng riêng trong Azure |
| YAML | YAML Ain't Markup Language | Chuẩn tuần tự hóa dữ liệu |

---

## Bảng Đối Chiếu Tên Dịch Vụ Azure

| Tên Thông Dụng | Tên Dịch Vụ Azure Chính Thức | Loại Host azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Tài nguyên hạ tầng, không phải ứng dụng `host` |
| NoSQL DB | Azure Cosmos DB | Tài nguyên hạ tầng, không phải ứng dụng `host` |
| Storage | Azure Storage Account | Tài nguyên hạ tầng, không phải ứng dụng tích hợp sẵn `host` |
| Cache | Azure Managed Redis | Tài nguyên hạ tầng, không phải ứng dụng `host` |
| Search | Azure AI Search | Tài nguyên hạ tầng, không phải ứng dụng `host` |
| Messaging | Azure Service Bus | Tài nguyên hạ tầng, không phải ứng dụng `host` |

`services.<name>.host` chọn mục tiêu triển khai ứng dụng; không phải là viết tắt của bất kỳ loại tài nguyên Azure nào. Cơ sở dữ liệu, bộ nhớ đệm, dịch vụ tìm kiếm, và hàng đợi thường được cung cấp qua nhà cung cấp hạ tầng và kết nối với ứng dụng thông qua đầu ra/cấu hình.

---

## Thuật Ngữ Cụ Thể Ngữ Cảnh

### Thuật Ngữ Phát Triển
- **Hot Reload**: Tự động cập nhật ứng dụng trong quá trình phát triển mà không cần khởi động lại
- **Build Pipeline**: Quá trình tự động xây dựng và kiểm thử mã
- **Deployment Slot**: Môi trường staging trong App Service
- **Environment Parity**: Giữ cho môi trường phát triển, staging và sản xuất tương tự nhau

### Thuật Ngữ Bảo Mật
- **Managed Identity**: Tính năng Azure cung cấp quản lý thông tin xác thực tự động
- **Key Vault**: Kho lưu trữ an toàn cho bí mật, khóa và chứng chỉ
- **RBAC**: Kiểm soát truy cập theo vai trò cho tài nguyên Azure
- **Network Security Group**: Tường lửa ảo kiểm soát lưu lượng mạng

### Thuật Ngữ Giám Sát
- **Telemetry**: Thu thập tự động các phép đo và dữ liệu
- **Application Performance Monitoring (APM)**: Giám sát hiệu suất phần mềm
- **Log Analytics**: Dịch vụ thu thập và phân tích dữ liệu log
- **Alert Rules**: Thông báo tự động dựa trên các chỉ số hoặc điều kiện

### Thuật Ngữ Triển Khai
- **Blue-Green Deployment**: Chiến lược triển khai không gián đoạn
- **Canary Deployment**: Triển khai dần dần cho một nhóm người dùng nhỏ
- **Rolling Update**: Thay thế tuần tự các bản sao ứng dụng
- **Rollback**: Quay về phiên bản ứng dụng trước đó

---

**Mẹo Sử Dụng**: Sử dụng `Ctrl+F` để tìm nhanh các thuật ngữ cụ thể trong bảng thuật ngữ này. Các thuật ngữ có liên kết chéo khi có thể.

---

**Điều Hướng**
- **Bài Học Trước**: [Phiên Bản Tóm Tắt](cheat-sheet.md)
- **Bài Học Tiếp Theo**: [Câu Hỏi Thường Gặp](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->