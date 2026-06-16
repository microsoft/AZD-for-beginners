# Bảng thuật ngữ - Thuật ngữ Azure và AZD

**Tham khảo cho tất cả các chương**
- **📚 Trang khoá học**: [AZD For Beginners](../README.md)
- **📖 Học cơ bản**: [Chương 1: Kiến thức cơ bản về AZD](../docs/getting-started/azd-basics.md)
- **🤖 Thuật ngữ AI**: [Chương 2: Phát triển ưu tiên AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Giới thiệu

Bảng thuật ngữ toàn diện này cung cấp định nghĩa cho các thuật ngữ, khái niệm và từ viết tắt được sử dụng trong Azure Developer CLI và phát triển đám mây Azure. Là tài liệu tham khảo thiết yếu để hiểu tài liệu kỹ thuật, khắc phục sự cố và giao tiếp hiệu quả về các dự án azd và dịch vụ Azure.

## Mục tiêu học tập

Khi sử dụng bảng thuật ngữ này, bạn sẽ:
- Hiểu các thuật ngữ và khái niệm thiết yếu của Azure Developer CLI
- Thành thạo từ vựng và thuật ngữ kỹ thuật trong phát triển đám mây Azure
- Tham khảo hiệu quả thuật ngữ về Infrastructure as Code và triển khai
- Hiểu tên dịch vụ Azure, các từ viết tắt và mục đích của chúng
- Truy cập định nghĩa để khắc phục và gỡ lỗi
- Học các khái niệm kiến trúc và phát triển Azure nâng cao

## Kết quả học tập

Với việc tham khảo thường xuyên bảng thuật ngữ này, bạn sẽ có thể:
- Giao tiếp hiệu quả bằng cách sử dụng thuật ngữ chính xác của Azure Developer CLI
- Hiểu rõ hơn tài liệu kỹ thuật và thông báo lỗi
- Điều hướng dịch vụ và khái niệm Azure một cách tự tin
- Khắc phục sự cố bằng cách sử dụng từ vựng kỹ thuật phù hợp
- Đóng góp vào các cuộc thảo luận nhóm với ngôn ngữ kỹ thuật chính xác
- Mở rộng kiến thức phát triển đám mây Azure một cách hệ thống

## A

**ARM Template**  
Mẫu Azure Resource Manager. Định dạng Infrastructure as Code dựa trên JSON được sử dụng để định nghĩa và triển khai các tài nguyên Azure theo cách khai báo.

**App Service**  
Dịch vụ nền tảng như một dịch vụ (PaaS) của Azure để lưu trữ ứng dụng web, REST API và backend cho di động mà không cần quản lý hạ tầng.

**Application Insights**  
Dịch vụ giám sát hiệu năng ứng dụng (APM) của Azure cung cấp hiểu biết sâu sắc về hiệu năng, khả năng sẵn sàng và mức sử dụng của ứng dụng.

**Azure CLI**  
Giao diện dòng lệnh để quản lý tài nguyên Azure. Được azd sử dụng cho xác thực và một số thao tác.

**Azure Developer CLI (azd)**  
Công cụ dòng lệnh hướng tới nhà phát triển giúp tăng tốc quá trình xây dựng và triển khai ứng dụng lên Azure bằng cách sử dụng mẫu và Infrastructure as Code.

**azure.yaml**  
Tệp cấu hình chính cho một dự án azd xác định dịch vụ, hạ tầng và các hook triển khai.

**Azure Resource Manager (ARM)**  
Dịch vụ triển khai và quản lý của Azure cung cấp lớp quản lý để tạo, cập nhật và xóa tài nguyên.

## B

**Bicep**  
Ngôn ngữ miền chuyên biệt (DSL) do Microsoft phát triển để triển khai tài nguyên Azure. Cung cấp cú pháp đơn giản hơn so với ARM template trong khi biên dịch thành ARM.

**Build**  
Quá trình biên dịch mã nguồn, cài đặt phụ thuộc và chuẩn bị ứng dụng để triển khai.

**Blue-Green Deployment**  
Chiến lược triển khai sử dụng hai môi trường sản xuất giống hệt nhau (blue và green) để giảm thiểu thời gian ngưng hoạt động và rủi ro.

## C

**Container Apps**  
Dịch vụ container serverless của Azure cho phép chạy các ứng dụng đóng gói trong container mà không cần quản lý hạ tầng phức tạp.

**CI/CD**  
Continuous Integration/Continuous Deployment. Các thực hành tự động để tích hợp thay đổi mã và triển khai ứng dụng.

**Cosmos DB**  
Dịch vụ cơ sở dữ liệu đa mô hình, phân phối toàn cầu của Azure cung cấp SLA toàn diện cho throughput, độ trễ, khả năng sẵn sàng và nhất quán.

**Configuration**  
Cài đặt và tham số điều khiển hành vi ứng dụng và tùy chọn triển khai.

## D

**Deployment**  
Quá trình cài đặt và cấu hình ứng dụng cùng các phụ thuộc của chúng trên hạ tầng mục tiêu.

**Docker**  
Nền tảng để phát triển, đóng gói và chạy ứng dụng sử dụng công nghệ container hóa.

**Dockerfile**  
Tệp văn bản chứa các hướng dẫn để xây dựng ảnh container Docker.

## E

**Environment**  
Mục tiêu triển khai đại diện cho một bản sao cụ thể của ứng dụng của bạn (ví dụ: development, staging, production).

**Environment Variables**  
Các giá trị cấu hình được lưu trữ dưới dạng cặp khóa-giá trị mà ứng dụng có thể truy cập khi chạy.

**Endpoint**  
URL hoặc địa chỉ mạng nơi một ứng dụng hoặc dịch vụ có thể được truy cập.

## F

**Function App**  
Dịch vụ compute serverless của Azure cho phép chạy mã theo sự kiện mà không cần quản lý hạ tầng.

## G

**GitHub Actions**  
Nền tảng CI/CD tích hợp với kho lưu trữ GitHub để tự động hóa các workflow.

**Git**  
Hệ thống kiểm soát phiên bản phân tán được sử dụng để theo dõi thay đổi trong mã nguồn.

## H

**Hooks**  
Các script hoặc lệnh tùy chỉnh chạy tại các thời điểm cụ thể trong vòng đời triển khai (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Loại dịch vụ Azure nơi một ứng dụng sẽ được triển khai (ví dụ: appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Thực hành định nghĩa và quản lý hạ tầng thông qua mã thay vì quy trình thủ công.

**Init**  
Quá trình khởi tạo một dự án azd mới, thường là từ một mẫu.

## J

**JSON**  
JavaScript Object Notation. Định dạng trao đổi dữ liệu thường dùng cho các tệp cấu hình và phản hồi API.

**JWT**  
JSON Web Token. Tiêu chuẩn để truyền tải thông tin an toàn giữa các bên dưới dạng một đối tượng JSON.

## K

**Key Vault**  
Dịch vụ của Azure để lưu trữ và quản lý an toàn bí mật, khóa và chứng chỉ.

**Kusto Query Language (KQL)**  
Ngôn ngữ truy vấn được sử dụng để phân tích dữ liệu trong Azure Monitor, Application Insights và các dịch vụ Azure khác.

## L

**Load Balancer**  
Dịch vụ phân phối lưu lượng mạng đến nhiều máy chủ hoặc instance.

**Log Analytics**  
Dịch vụ của Azure để thu thập, phân tích và hành động dựa trên dữ liệu telemetry từ môi trường đám mây và tại chỗ.

## M

**Managed Identity**  
Tính năng của Azure cung cấp danh tính được quản lý tự động cho các dịch vụ Azure để xác thực tới các dịch vụ Azure khác.

**Microservices**  
Cách tiếp cận kiến trúc trong đó ứng dụng được xây dựng thành tập hợp các dịch vụ nhỏ, độc lập.

**Monitor**  
Giải pháp giám sát hợp nhất của Azure cung cấp khả năng quan sát toàn diện cho ứng dụng và hạ tầng.

## N

**Node.js**  
Môi trường chạy JavaScript được xây dựng trên V8 JavaScript engine của Chrome để xây dựng ứng dụng phía máy chủ.

**npm**  
Trình quản lý gói cho Node.js quản lý phụ thuộc và gói thư viện.

## O

**Output**  
Các giá trị trả về từ việc triển khai hạ tầng có thể được ứng dụng hoặc tài nguyên khác sử dụng.

## P

**Package**  
Quá trình chuẩn bị mã ứng dụng và các phụ thuộc cho việc triển khai.

**Parameters**  
Các giá trị đầu vào được truyền vào template hạ tầng để tuỳ chỉnh việc triển khai.

**PostgreSQL**  
Hệ quản trị cơ sở dữ liệu quan hệ mã nguồn mở được hỗ trợ dưới dạng dịch vụ quản lý trong Azure.

**Provisioning**  
Quá trình tạo và cấu hình các tài nguyên Azure được định nghĩa trong template hạ tầng.

## Q

**Quota**  
Giới hạn về số lượng tài nguyên có thể được tạo trong một subscription hoặc khu vực của Azure.

## R

**Resource Group**  
Vùng chứa logic cho các tài nguyên Azure chia sẻ cùng vòng đời, quyền truy cập và chính sách.

**Resource Token**  
Chuỗi duy nhất được azd tạo ra để đảm bảo tên tài nguyên là duy nhất trên các lần triển khai.

**REST API**  
Kiến trúc thiết kế ứng dụng mạng sử dụng các phương thức HTTP.

**Rollback**  
Quá trình quay trở lại phiên bản trước của một ứng dụng hoặc cấu hình hạ tầng.

## S

**Service**  
Một thành phần của ứng dụng của bạn được định nghĩa trong azure.yaml (ví dụ: giao diện web, backend API, cơ sở dữ liệu).

**SKU**  
Stock Keeping Unit. Đại diện cho các tầng dịch vụ hoặc cấp độ hiệu năng khác nhau cho tài nguyên Azure.

**SQL Database**  
Dịch vụ cơ sở dữ liệu quan hệ được quản lý của Azure dựa trên Microsoft SQL Server.

**Static Web Apps**  
Dịch vụ của Azure để xây dựng và triển khai ứng dụng web toàn stack từ kho mã nguồn.

**Storage Account**  
Dịch vụ của Azure cung cấp lưu trữ đám mây cho các đối tượng dữ liệu bao gồm blobs, files, queues và tables.

**Subscription**  
Vùng chứa tài khoản Azure giữ các resource group và tài nguyên, kèm theo quản lý thanh toán và truy cập.

## T

**Template**  
Cấu trúc dự án được chuẩn bị sẵn chứa mã ứng dụng, định nghĩa hạ tầng và cấu hình cho các kịch bản phổ biến.

**Terraform**  
Công cụ Infrastructure as Code mã nguồn mở hỗ trợ nhiều nhà cung cấp đám mây bao gồm Azure.

**Traffic Manager**  
Bộ cân bằng tải dựa trên DNS của Azure để phân phối lưu lượng giữa các vùng Azure toàn cầu.

## U

**URI**  
Uniform Resource Identifier. Chuỗi xác định một tài nguyên cụ thể.

**URL**  
Uniform Resource Locator. Loại URI chỉ định nơi một tài nguyên được lưu trữ và cách truy xuất nó.

## V

**Virtual Network (VNet)**  
Khối xây dựng cơ bản cho mạng riêng trong Azure, cung cấp cô lập và phân đoạn.

**VS Code**  
Visual Studio Code. Trình soạn thảo mã phổ biến với tích hợp Azure và azd xuất sắc.

## W

**Webhook**  
HTTP callback được kích hoạt bởi các sự kiện cụ thể, thường được sử dụng trong pipeline CI/CD.

**What-if**  
Tính năng của Azure hiển thị những thay đổi sẽ được thực hiện bởi một triển khai mà không thực sự thực thi nó.

## Y

**YAML**  
YAML Ain't Markup Language. Chuẩn tuần tự hóa dữ liệu dễ đọc cho con người, được dùng cho các tệp cấu hình như azure.yaml.

## Z

**Zone**  
Các vị trí vật lý tách biệt trong một khu vực Azure cung cấp độ dự phòng và khả năng sẵn sàng cao.

---

## Các từ viết tắt thường gặp

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory (nay là Microsoft Entra ID) | Dịch vụ quản lý danh tính và truy cập |
| ACR | Azure Container Registry | Dịch vụ đăng ký ảnh container |
| AKS | Azure Kubernetes Service | Dịch vụ Kubernetes được quản lý |
| API | Application Programming Interface | Bộ giao thức để xây dựng phần mềm |
| ARM | Azure Resource Manager | Dịch vụ triển khai và quản lý của Azure |
| CDN | Content Delivery Network | Mạng máy chủ phân phối nội dung |
| CI/CD | Continuous Integration/Continuous Deployment | Các thực hành phát triển tự động |
| CLI | Command Line Interface | Giao diện người dùng dựa trên văn bản |
| DNS | Domain Name System | Hệ thống chuyển đổi tên miền sang địa chỉ IP |
| HTTPS | Hypertext Transfer Protocol Secure | Phiên bản bảo mật của HTTP |
| IaC | Infrastructure as Code | Quản lý hạ tầng thông qua mã |
| JSON | JavaScript Object Notation | Định dạng trao đổi dữ liệu |
| JWT | JSON Web Token | Định dạng token để truyền thông tin an toàn |
| KQL | Kusto Query Language | Ngôn ngữ truy vấn cho các dịch vụ dữ liệu Azure |
| RBAC | Role-Based Access Control | Phương pháp kiểm soát truy cập dựa trên vai trò |
| REST | Representational State Transfer | Kiến trúc cho dịch vụ web |
| SDK | Software Development Kit | Bộ công cụ phát triển phần mềm |
| SLA | Service Level Agreement | Cam kết về khả năng sẵn sàng/hiệu năng dịch vụ |
| SQL | Structured Query Language | Ngôn ngữ quản lý cơ sở dữ liệu quan hệ |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Giao thức mã hóa |
| URI | Uniform Resource Identifier | Chuỗi xác định một tài nguyên |
| URL | Uniform Resource Locator | Loại URI chỉ định vị trí tài nguyên |
| VM | Virtual Machine | Mô phỏng một hệ thống máy tính |
| VNet | Virtual Network | Mạng riêng trong Azure |
| YAML | YAML Ain't Markup Language | Chuẩn tuần tự hóa dữ liệu |

---

## Bản đồ tên dịch vụ Azure

| Common Name | Official Azure Service Name | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Thuật ngữ theo bối cảnh

### Thuật ngữ phát triển
- **Hot Reload**: Tự động cập nhật ứng dụng trong quá trình phát triển mà không cần khởi động lại
- **Build Pipeline**: Quá trình tự động xây dựng và kiểm thử mã
- **Deployment Slot**: Môi trường staging trong App Service
- **Environment Parity**: Giữ cho các môi trường development, staging và production tương đồng

### Thuật ngữ bảo mật
- **Managed Identity**: Tính năng Azure cung cấp quản lý thông tin đăng nhập tự động
- **Key Vault**: Lưu trữ an toàn cho bí mật, khóa và chứng chỉ
- **RBAC**: Kiểm soát truy cập theo vai trò cho tài nguyên Azure
- **Network Security Group**: Tường lửa ảo để kiểm soát lưu lượng mạng

### Thuật ngữ giám sát
- **Telemetry**: Thu thập tự động các phép đo và dữ liệu
- **Application Performance Monitoring (APM)**: Giám sát hiệu năng phần mềm
- **Log Analytics**: Dịch vụ thu thập và phân tích dữ liệu nhật ký
- **Alert Rules**: Thông báo tự động dựa trên chỉ số hoặc điều kiện

### Thuật ngữ triển khai
- **Blue-Green Deployment**: Chiến lược triển khai không gián đoạn
- **Canary Deployment**: Triển khai dần cho một tập con người dùng
- **Rolling Update**: Thay thế tuần tự các instance ứng dụng
- **Rollback**: Quay trở lại phiên bản ứng dụng trước đó

---

**Mẹo sử dụng**: Sử dụng `Ctrl+F` để tìm nhanh các thuật ngữ cụ thể trong bảng thuật ngữ này. Các thuật ngữ được tham chiếu chéo khi có thể.

---

**Điều hướng**
- **Bài trước**: [Cheat Sheet](cheat-sheet.md)
- **Bài tiếp theo**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->