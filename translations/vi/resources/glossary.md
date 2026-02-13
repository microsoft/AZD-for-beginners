# Bảng Thuật Ngữ - Thuật Ngữ Azure và AZD

**Tài liệu tham khảo cho tất cả các chương**
- **📚 Trang Khóa Học**: [AZD For Beginners](../README.md)
- **📖 Học Cơ Bản**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 Thuật Ngữ AI**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Giới thiệu

Bảng thuật ngữ toàn diện này cung cấp định nghĩa cho các thuật ngữ, khái niệm và từ viết tắt được sử dụng trong Azure Developer CLI và phát triển đám mây Azure. Là tài liệu tham khảo thiết yếu để hiểu tài liệu kỹ thuật, khắc phục sự cố và giao tiếp hiệu quả về các dự án azd và dịch vụ Azure.

## Mục tiêu học tập

Bằng cách sử dụng bảng thuật ngữ này, bạn sẽ:
- Hiểu các thuật ngữ và khái niệm thiết yếu của Azure Developer CLI
- Thành thạo từ vựng và các thuật ngữ kỹ thuật về phát triển đám mây Azure
- Tham khảo hiệu quả thuật ngữ về Hạ tầng như Mã và triển khai
- Hiểu tên dịch vụ Azure, các từ viết tắt và mục đích của chúng
- Truy cập các định nghĩa để khắc phục sự cố và gỡ lỗi
- Học các khái niệm phát triển và kiến trúc Azure nâng cao

## Kết quả học tập

Với việc tham khảo thường xuyên bảng thuật ngữ này, bạn sẽ có thể:
- Giao tiếp hiệu quả bằng cách sử dụng thuật ngữ Azure Developer CLI chính xác
- Hiểu tài liệu kỹ thuật và thông báo lỗi rõ ràng hơn
- Điều hướng các dịch vụ và khái niệm Azure với sự tự tin
- Khắc phục sự cố bằng từ vựng kỹ thuật phù hợp
- Đóng góp vào thảo luận nhóm bằng ngôn ngữ kỹ thuật chính xác
- Mở rộng kiến thức phát triển đám mây Azure một cách có hệ thống

## A

**ARM Template**  
Azure Resource Manager template. Định dạng Hạ tầng như Mã dựa trên JSON được sử dụng để định nghĩa và triển khai các tài nguyên Azure theo cách khai báo.

**App Service**  
Dịch vụ nền tảng dạng dịch vụ (PaaS) của Azure để lưu trữ ứng dụng web, REST API và backend di động mà không cần quản lý hạ tầng.

**Application Insights**  
Dịch vụ giám sát hiệu năng ứng dụng (APM) của Azure cung cấp cái nhìn sâu về hiệu suất, tính khả dụng và cách sử dụng ứng dụng.

**Azure CLI**  
Giao diện dòng lệnh để quản lý tài nguyên Azure. Được azd sử dụng để xác thực và một số thao tác.

**Azure Developer CLI (azd)**  
Công cụ dòng lệnh dành cho nhà phát triển giúp tăng tốc quá trình xây dựng và triển khai ứng dụng lên Azure bằng cách sử dụng các mẫu và Hạ tầng như Mã.

**azure.yaml**  
Tệp cấu hình chính cho một dự án azd định nghĩa các dịch vụ, hạ tầng và các hook triển khai.

**Azure Resource Manager (ARM)**  
Dịch vụ triển khai và quản lý của Azure cung cấp một lớp quản lý để tạo, cập nhật và xóa tài nguyên.

## B

**Bicep**  
Ngôn ngữ đặc thù ngành (DSL) được Microsoft phát triển để triển khai tài nguyên Azure. Cung cấp cú pháp đơn giản hơn so với mẫu ARM trong khi biên dịch thành ARM.

**Build**  
Quá trình biên dịch mã nguồn, cài đặt phụ thuộc và chuẩn bị ứng dụng để triển khai.

**Blue-Green Deployment**  
Chiến lược triển khai sử dụng hai môi trường sản xuất giống hệt nhau (blue và green) để giảm thiểu thời gian ngừng hoạt động và rủi ro.

## C

**Container Apps**  
Dịch vụ container serverless của Azure cho phép chạy các ứng dụng đóng gói trong container mà không cần quản lý hạ tầng phức tạp.

**CI/CD**  
Continuous Integration/Continuous Deployment. Các thực hành tự động để tích hợp thay đổi mã và triển khai ứng dụng.

**Cosmos DB**  
Dịch vụ cơ sở dữ liệu đa mô hình, phân phối toàn cầu của Azure cung cấp các SLA toàn diện cho thông lượng, độ trễ, tính khả dụng và tính nhất quán.

**Configuration**  
Các cài đặt và tham số điều khiển hành vi ứng dụng và các tùy chọn triển khai.

## D

**Deployment**  
Quá trình cài đặt và cấu hình ứng dụng cùng các phụ thuộc của chúng trên hạ tầng mục tiêu.

**Docker**  
Nền tảng để phát triển, đóng gói và chạy ứng dụng bằng công nghệ container hóa.

**Dockerfile**  
Tệp văn bản chứa các hướng dẫn để xây dựng image container Docker.

## E

**Environment**  
Một mục tiêu triển khai đại diện cho một phiên bản cụ thể của ứng dụng của bạn (ví dụ: development, staging, production).

**Environment Variables**  
Giá trị cấu hình được lưu dưới dạng cặp khóa-giá trị mà ứng dụng có thể truy cập lúc chạy.

**Endpoint**  
URL hoặc địa chỉ mạng nơi một ứng dụng hoặc dịch vụ có thể được truy cập.

## F

**Function App**  
Dịch vụ compute serverless của Azure cho phép chạy mã theo sự kiện mà không cần quản lý hạ tầng.

## G

**GitHub Actions**  
Nền tảng CI/CD tích hợp với kho lưu trữ GitHub để tự động hóa các workflow.

**Git**  
Hệ thống kiểm soát phiên bản phân tán dùng để theo dõi thay đổi trong mã nguồn.

## H

**Hooks**  
Các script hoặc lệnh tùy chỉnh chạy tại các thời điểm cụ thể trong vòng đời triển khai (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Loại dịch vụ Azure nơi một ứng dụng sẽ được triển khai (ví dụ: appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Thực hành định nghĩa và quản lý hạ tầng thông qua mã thay vì các quy trình thủ công.

**Init**  
Quá trình khởi tạo một dự án azd mới, thường dựa trên một mẫu.

## J

**JSON**  
JavaScript Object Notation. Định dạng trao đổi dữ liệu thường dùng cho tệp cấu hình và phản hồi API.

**JWT**  
JSON Web Token. Chuẩn để truyền thông tin an toàn giữa các bên dưới dạng một đối tượng JSON.

## K

**Key Vault**  
Dịch vụ của Azure để lưu trữ và quản lý bí mật, khóa và chứng chỉ một cách an toàn.

**Kusto Query Language (KQL)**  
Ngôn ngữ truy vấn dùng để phân tích dữ liệu trong Azure Monitor, Application Insights và các dịch vụ Azure khác.

## L

**Load Balancer**  
Dịch vụ phân phối lưu lượng mạng đến nhiều máy chủ hoặc instance.

**Log Analytics**  
Dịch vụ của Azure để thu thập, phân tích và hành động dựa trên dữ liệu telemetry từ môi trường đám mây và tại chỗ.

## M

**Managed Identity**  
Tính năng của Azure cung cấp danh tính được quản lý tự động cho các dịch vụ Azure để xác thực tới các dịch vụ Azure khác.

**Microservices**  
Cách tiếp cận kiến trúc nơi ứng dụng được xây dựng như một tập hợp các dịch vụ nhỏ, độc lập.

**Monitor**  
Giải pháp giám sát hợp nhất của Azure cung cấp khả năng quan sát toàn diện cho ứng dụng và hạ tầng.

## N

**Node.js**  
Runtime JavaScript được xây dựng trên engine V8 của Chrome để xây dựng ứng dụng phía máy chủ.

**npm**  
Trình quản lý gói cho Node.js quản lý phụ thuộc và gói.

## O

**Output**  
Các giá trị trả về từ việc triển khai hạ tầng có thể được ứng dụng hoặc tài nguyên khác sử dụng.

## P

**Package**  
Quá trình chuẩn bị mã ứng dụng và phụ thuộc để triển khai.

**Parameters**  
Các giá trị đầu vào được truyền cho mẫu hạ tầng để tùy chỉnh triển khai.

**PostgreSQL**  
Hệ quản trị cơ sở dữ liệu quan hệ mã nguồn mở được hỗ trợ dưới dạng dịch vụ được quản lý trong Azure.

**Provisioning**  
Quá trình tạo và cấu hình các tài nguyên Azure được định nghĩa trong các mẫu hạ tầng.

## Q

**Quota**  
Giới hạn về số lượng tài nguyên có thể được tạo trong một subscription hoặc vùng của Azure.

## R

**Resource Group**  
Vùng chứa logic cho các tài nguyên Azure chia sẻ cùng vòng đời, quyền và chính sách.

**Resource Token**  
Chuỗi duy nhất được azd tạo ra để đảm bảo tên tài nguyên là duy nhất giữa các lần triển khai.

**REST API**  
Kiến trúc để thiết kế ứng dụng mạng sử dụng các phương thức HTTP.

**Rollback**  
Quá trình quay trở lại phiên bản trước của ứng dụng hoặc cấu hình hạ tầng.

## S

**Service**  
Một thành phần của ứng dụng của bạn được định nghĩa trong azure.yaml (ví dụ: web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Đại diện cho các tầng dịch vụ hoặc mức hiệu năng khác nhau cho tài nguyên Azure.

**SQL Database**  
Dịch vụ cơ sở dữ liệu quan hệ được quản lý của Azure dựa trên Microsoft SQL Server.

**Static Web Apps**  
Dịch vụ Azure để xây dựng và triển khai ứng dụng web full-stack từ kho mã nguồn.

**Storage Account**  
Dịch vụ Azure cung cấp lưu trữ đám mây cho các đối tượng dữ liệu bao gồm blobs, files, queues và tables.

**Subscription**  
Thùng chứa tài khoản Azure chứa resource groups và tài nguyên, cùng với quản lý thanh toán và quyền truy cập.

## T

**Template**  
Cấu trúc dự án được dựng sẵn chứa mã ứng dụng, định nghĩa hạ tầng và cấu hình cho các kịch bản phổ biến.

**Terraform**  
Công cụ Hạ tầng như Mã mã nguồn mở hỗ trợ nhiều nhà cung cấp đám mây bao gồm Azure.

**Traffic Manager**  
Bộ cân bằng tải dựa trên DNS của Azure để phân phối lưu lượng giữa các vùng Azure trên toàn cầu.

## U

**URI**  
Uniform Resource Identifier. Chuỗi nhận dạng một tài nguyên cụ thể.

**URL**  
Uniform Resource Locator. Loại URI chỉ rõ nơi một tài nguyên được lưu và cách để truy xuất nó.

## V

**Virtual Network (VNet)**  
Khối xây dựng cơ bản cho mạng riêng trong Azure, cung cấp khả năng cô lập và phân vùng.

**VS Code**  
Visual Studio Code. Trình soạn thảo mã phổ biến với tích hợp Azure và azd tốt.

## W

**Webhook**  
HTTP callback được kích hoạt bởi các sự kiện cụ thể, thường dùng trong pipeline CI/CD.

**What-if**  
Tính năng của Azure hiển thị những thay đổi sẽ được thực hiện bởi một lần triển khai mà không thực sự thực thi nó.

## Y

**YAML**  
YAML Ain't Markup Language. Chuẩn tuần tự hóa dữ liệu dễ đọc cho con người được sử dụng cho các tệp cấu hình như azure.yaml.

## Z

**Zone**  
Các vị trí vật lý tách biệt trong một vùng Azure cung cấp khả năng dự phòng và tính sẵn sàng cao.

---

## Các Từ Viết Tắt Thông Dụng

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Dịch vụ quản lý danh tính và truy cập |
| ACR | Azure Container Registry | Dịch vụ đăng ký image container |
| AKS | Azure Kubernetes Service | Dịch vụ Kubernetes được quản lý |
| API | Application Programming Interface | Giao diện lập trình ứng dụng |
| ARM | Azure Resource Manager | Dịch vụ triển khai và quản lý của Azure |
| CDN | Content Delivery Network | Mạng lưới phân phối nội dung |
| CI/CD | Continuous Integration/Continuous Deployment | Các thực hành phát triển tự động |
| CLI | Command Line Interface | Giao diện dòng lệnh |
| DNS | Domain Name System | Hệ thống chuyển đổi tên miền sang địa chỉ IP |
| HTTPS | Hypertext Transfer Protocol Secure | Phiên bản bảo mật của HTTP |
| IaC | Infrastructure as Code | Quản lý hạ tầng thông qua mã |
| JSON | JavaScript Object Notation | Định dạng trao đổi dữ liệu |
| JWT | JSON Web Token | Định dạng token để truyền thông tin an toàn |
| KQL | Kusto Query Language | Ngôn ngữ truy vấn cho dịch vụ dữ liệu Azure |
| RBAC | Role-Based Access Control | Phương pháp kiểm soát truy cập dựa trên vai trò |
| REST | Representational State Transfer | Kiến trúc cho dịch vụ web |
| SDK | Software Development Kit | Bộ công cụ phát triển phần mềm |
| SLA | Service Level Agreement | Cam kết về tính khả dụng/hiệu năng dịch vụ |
| SQL | Structured Query Language | Ngôn ngữ quản lý cơ sở dữ liệu quan hệ |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Các giao thức mật mã |
| URI | Uniform Resource Identifier | Chuỗi nhận dạng một tài nguyên |
| URL | Uniform Resource Locator | Loại URI chỉ rõ vị trí tài nguyên |
| VM | Virtual Machine | Mô phỏng một hệ thống máy tính |
| VNet | Virtual Network | Mạng riêng trong Azure |
| YAML | YAML Ain't Markup Language | Chuẩn tuần tự hóa dữ liệu |

---

## Ánh xạ Tên Dịch Vụ Azure

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
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Thuật Ngữ Theo Ngữ Cảnh

### Thuật ngữ Phát triển
- **Hot Reload**: Tự động cập nhật ứng dụng trong quá trình phát triển mà không cần khởi động lại
- **Build Pipeline**: Quá trình tự động để build và kiểm thử mã
- **Deployment Slot**: Môi trường staging trong App Service
- **Environment Parity**: Giữ cho các môi trường development, staging và production tương đồng

### Thuật ngữ Bảo mật
- **Managed Identity**: Tính năng Azure cung cấp quản lý thông tin xác thực tự động
- **Key Vault**: Kho lưu trữ an toàn cho bí mật, khóa và chứng chỉ
- **RBAC**: Kiểm soát truy cập theo vai trò cho các tài nguyên Azure
- **Network Security Group**: Tường lửa ảo để kiểm soát lưu lượng mạng

### Thuật ngữ Giám sát
- **Telemetry**: Thu thập tự động các phép đo và dữ liệu
- **Application Performance Monitoring (APM)**: Giám sát hiệu năng phần mềm
- **Log Analytics**: Dịch vụ thu thập và phân tích dữ liệu log
- **Alert Rules**: Thông báo tự động dựa trên các số liệu hoặc điều kiện

### Thuật ngữ Triển khai
- **Blue-Green Deployment**: Chiến lược triển khai không gián đoạn
- **Canary Deployment**: Triển khai dần dần cho một tập con người dùng
- **Rolling Update**: Thay thế tuần tự các instance của ứng dụng
- **Rollback**: Quay về phiên bản ứng dụng trước đó

---

**Mẹo sử dụng**: Sử dụng `Ctrl+F` để nhanh chóng tìm các thuật ngữ cụ thể trong bảng thuật ngữ này. Các thuật ngữ được tham chiếu chéo khi áp dụng.

---

**Điều hướng**
- **Bài học trước**: [Cheat Sheet](cheat-sheet.md)
- **Bài học tiếp theo**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc sai sót. Văn bản gốc bằng ngôn ngữ ban đầu nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hay diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->