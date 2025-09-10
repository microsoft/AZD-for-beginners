<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "59cb1c1635512e212da16d50f3259ca4",
  "translation_date": "2025-09-09T22:52:37+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "vi"
}
-->
# Thuật ngữ - Azure Developer CLI

## Giới thiệu

Bảng thuật ngữ toàn diện này cung cấp định nghĩa cho các thuật ngữ, khái niệm và từ viết tắt được sử dụng trong Azure Developer CLI và phát triển đám mây Azure. Đây là tài liệu tham khảo cần thiết để hiểu tài liệu kỹ thuật, khắc phục sự cố và giao tiếp hiệu quả về các dự án azd và dịch vụ Azure.

## Mục tiêu học tập

Khi sử dụng bảng thuật ngữ này, bạn sẽ:
- Hiểu các thuật ngữ và khái niệm cơ bản của Azure Developer CLI
- Nắm vững từ vựng và thuật ngữ kỹ thuật trong phát triển đám mây Azure
- Tham khảo thuật ngữ về Cơ sở hạ tầng dưới dạng mã và triển khai một cách hiệu quả
- Hiểu tên dịch vụ Azure, từ viết tắt và mục đích của chúng
- Truy cập định nghĩa cho các thuật ngữ khắc phục sự cố và gỡ lỗi
- Học các khái niệm nâng cao về kiến trúc và phát triển Azure

## Kết quả học tập

Với việc tham khảo thường xuyên bảng thuật ngữ này, bạn sẽ có thể:
- Giao tiếp hiệu quả bằng cách sử dụng đúng thuật ngữ của Azure Developer CLI
- Hiểu rõ hơn tài liệu kỹ thuật và thông báo lỗi
- Điều hướng các dịch vụ và khái niệm Azure một cách tự tin
- Khắc phục sự cố bằng cách sử dụng từ vựng kỹ thuật phù hợp
- Đóng góp vào các cuộc thảo luận nhóm với ngôn ngữ kỹ thuật chính xác
- Mở rộng kiến thức về phát triển đám mây Azure một cách có hệ thống

## A

**ARM Template**  
Mẫu Azure Resource Manager. Định dạng Cơ sở hạ tầng dưới dạng mã dựa trên JSON được sử dụng để định nghĩa và triển khai tài nguyên Azure một cách khai báo.

**App Service**  
Dịch vụ nền tảng dưới dạng dịch vụ (PaaS) của Azure để lưu trữ ứng dụng web, REST API và backend di động mà không cần quản lý cơ sở hạ tầng.

**Application Insights**  
Dịch vụ giám sát hiệu suất ứng dụng (APM) của Azure cung cấp thông tin sâu sắc về hiệu suất, khả dụng và mức sử dụng của ứng dụng.

**Azure CLI**  
Giao diện dòng lệnh để quản lý tài nguyên Azure. Được azd sử dụng cho xác thực và một số thao tác.

**Azure Developer CLI (azd)**  
Công cụ dòng lệnh tập trung vào nhà phát triển, giúp tăng tốc quá trình xây dựng và triển khai ứng dụng lên Azure bằng cách sử dụng mẫu và Cơ sở hạ tầng dưới dạng mã.

**azure.yaml**  
Tệp cấu hình chính cho một dự án azd, định nghĩa các dịch vụ, cơ sở hạ tầng và các hook triển khai.

**Azure Resource Manager (ARM)**  
Dịch vụ triển khai và quản lý của Azure cung cấp một lớp quản lý để tạo, cập nhật và xóa tài nguyên.

## B

**Bicep**  
Ngôn ngữ chuyên biệt (DSL) do Microsoft phát triển để triển khai tài nguyên Azure. Cung cấp cú pháp đơn giản hơn so với ARM templates trong khi vẫn biên dịch sang ARM.

**Build**  
Quá trình biên dịch mã nguồn, cài đặt các phụ thuộc và chuẩn bị ứng dụng để triển khai.

**Blue-Green Deployment**  
Chiến lược triển khai sử dụng hai môi trường sản xuất giống hệt nhau (blue và green) để giảm thiểu thời gian ngừng hoạt động và rủi ro.

## C

**Container Apps**  
Dịch vụ container serverless của Azure cho phép chạy các ứng dụng container hóa mà không cần quản lý cơ sở hạ tầng phức tạp.

**CI/CD**  
Tích hợp liên tục/Triển khai liên tục. Các thực hành tự động hóa để tích hợp thay đổi mã và triển khai ứng dụng.

**Cosmos DB**  
Dịch vụ cơ sở dữ liệu đa mô hình, phân phối toàn cầu của Azure cung cấp SLA toàn diện về thông lượng, độ trễ, khả dụng và tính nhất quán.

**Configuration**  
Các cài đặt và tham số điều khiển hành vi ứng dụng và tùy chọn triển khai.

## D

**Deployment**  
Quá trình cài đặt và cấu hình ứng dụng cùng các phụ thuộc của nó trên cơ sở hạ tầng mục tiêu.

**Docker**  
Nền tảng để phát triển, vận chuyển và chạy ứng dụng bằng công nghệ container hóa.

**Dockerfile**  
Tệp văn bản chứa các hướng dẫn để xây dựng hình ảnh container Docker.

## E

**Environment**  
Mục tiêu triển khai đại diện cho một phiên bản cụ thể của ứng dụng của bạn (ví dụ: phát triển, staging, sản xuất).

**Environment Variables**  
Các giá trị cấu hình được lưu trữ dưới dạng cặp khóa-giá trị mà ứng dụng có thể truy cập trong thời gian chạy.

**Endpoint**  
URL hoặc địa chỉ mạng nơi một ứng dụng hoặc dịch vụ có thể được truy cập.

## F

**Function App**  
Dịch vụ tính toán serverless của Azure cho phép chạy mã theo sự kiện mà không cần quản lý cơ sở hạ tầng.

## G

**GitHub Actions**  
Nền tảng CI/CD tích hợp với các kho lưu trữ GitHub để tự động hóa quy trình làm việc.

**Git**  
Hệ thống kiểm soát phiên bản phân tán được sử dụng để theo dõi các thay đổi trong mã nguồn.

## H

**Hooks**  
Các script hoặc lệnh tùy chỉnh chạy tại các điểm cụ thể trong vòng đời triển khai (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Loại dịch vụ Azure nơi ứng dụng sẽ được triển khai (ví dụ: appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Thực hành định nghĩa và quản lý cơ sở hạ tầng thông qua mã thay vì các quy trình thủ công.

**Init**  
Quá trình khởi tạo một dự án azd mới, thường từ một mẫu.

## J

**JSON**  
JavaScript Object Notation. Định dạng trao đổi dữ liệu thường được sử dụng cho tệp cấu hình và phản hồi API.

**JWT**  
JSON Web Token. Tiêu chuẩn để truyền thông tin một cách an toàn giữa các bên dưới dạng đối tượng JSON.

## K

**Key Vault**  
Dịch vụ của Azure để lưu trữ và quản lý an toàn các bí mật, khóa và chứng chỉ.

**Kusto Query Language (KQL)**  
Ngôn ngữ truy vấn được sử dụng để phân tích dữ liệu trong Azure Monitor, Application Insights và các dịch vụ Azure khác.

## L

**Load Balancer**  
Dịch vụ phân phối lưu lượng mạng đến nhiều máy chủ hoặc phiên bản.

**Log Analytics**  
Dịch vụ Azure để thu thập, phân tích và hành động dựa trên dữ liệu telemetry từ môi trường đám mây và tại chỗ.

## M

**Managed Identity**  
Tính năng của Azure cung cấp cho các dịch vụ Azure một danh tính được quản lý tự động để xác thực với các dịch vụ Azure khác.

**Microservices**  
Cách tiếp cận kiến trúc nơi ứng dụng được xây dựng dưới dạng tập hợp các dịch vụ nhỏ, độc lập.

**Monitor**  
Giải pháp giám sát hợp nhất của Azure cung cấp khả năng quan sát toàn diện trên ứng dụng và cơ sở hạ tầng.

## N

**Node.js**  
Runtime JavaScript được xây dựng trên công cụ JavaScript V8 của Chrome để xây dựng ứng dụng phía máy chủ.

**npm**  
Trình quản lý gói cho Node.js, quản lý các phụ thuộc và gói.

## O

**Output**  
Các giá trị được trả về từ triển khai cơ sở hạ tầng có thể được sử dụng bởi ứng dụng hoặc các tài nguyên khác.

## P

**Package**  
Quá trình chuẩn bị mã ứng dụng và các phụ thuộc để triển khai.

**Parameters**  
Các giá trị đầu vào được truyền vào các mẫu cơ sở hạ tầng để tùy chỉnh triển khai.

**PostgreSQL**  
Hệ thống cơ sở dữ liệu quan hệ mã nguồn mở được hỗ trợ dưới dạng dịch vụ được quản lý trong Azure.

**Provisioning**  
Quá trình tạo và cấu hình tài nguyên Azure được định nghĩa trong các mẫu cơ sở hạ tầng.

## Q

**Quota**  
Giới hạn về số lượng tài nguyên có thể được tạo trong một đăng ký hoặc khu vực Azure.

## R

**Resource Group**  
Container logic cho các tài nguyên Azure chia sẻ cùng vòng đời, quyền và chính sách.

**Resource Token**  
Chuỗi duy nhất được tạo bởi azd để đảm bảo tên tài nguyên là duy nhất trên các triển khai.

**REST API**  
Phong cách kiến trúc để thiết kế ứng dụng mạng sử dụng các phương thức HTTP.

**Rollback**  
Quá trình quay lại phiên bản trước của ứng dụng hoặc cấu hình cơ sở hạ tầng.

## S

**Service**  
Một thành phần của ứng dụng của bạn được định nghĩa trong azure.yaml (ví dụ: frontend web, backend API, cơ sở dữ liệu).

**SKU**  
Đơn vị lưu trữ. Đại diện cho các cấp dịch vụ hoặc mức hiệu suất khác nhau cho tài nguyên Azure.

**SQL Database**  
Dịch vụ cơ sở dữ liệu quan hệ được quản lý của Azure dựa trên Microsoft SQL Server.

**Static Web Apps**  
Dịch vụ Azure để xây dựng và triển khai ứng dụng web full-stack từ các kho mã nguồn.

**Storage Account**  
Dịch vụ Azure cung cấp lưu trữ đám mây cho các đối tượng dữ liệu bao gồm blob, tệp, hàng đợi và bảng.

**Subscription**  
Container tài khoản Azure chứa các nhóm tài nguyên và tài nguyên, với quản lý thanh toán và quyền truy cập liên quan.

## T

**Template**  
Cấu trúc dự án được xây dựng sẵn chứa mã ứng dụng, định nghĩa cơ sở hạ tầng và cấu hình cho các kịch bản phổ biến.

**Terraform**  
Công cụ Cơ sở hạ tầng dưới dạng mã mã nguồn mở hỗ trợ nhiều nhà cung cấp đám mây bao gồm Azure.

**Traffic Manager**  
Trình cân bằng tải DNS của Azure để phân phối lưu lượng trên các khu vực Azure toàn cầu.

## U

**URI**  
Uniform Resource Identifier. Chuỗi xác định một tài nguyên cụ thể.

**URL**  
Uniform Resource Locator. Loại URI chỉ định vị trí tài nguyên và cách truy xuất nó.

## V

**Virtual Network (VNet)**  
Khối xây dựng cơ bản cho mạng riêng trong Azure, cung cấp sự cô lập và phân đoạn.

**VS Code**  
Visual Studio Code. Trình chỉnh sửa mã phổ biến với tích hợp tuyệt vời với Azure và azd.

## W

**Webhook**  
HTTP callback được kích hoạt bởi các sự kiện cụ thể, thường được sử dụng trong các pipeline CI/CD.

**What-if**  
Tính năng của Azure hiển thị những thay đổi sẽ được thực hiện bởi một triển khai mà không thực sự thực hiện nó.

## Y

**YAML**  
YAML Ain't Markup Language. Tiêu chuẩn tuần tự hóa dữ liệu dễ đọc dành cho con người, được sử dụng cho các tệp cấu hình như azure.yaml.

## Z

**Zone**  
Các vị trí vật lý riêng biệt trong một khu vực Azure cung cấp khả năng dự phòng và tính khả dụng cao.

---

## Các từ viết tắt phổ biến

| Từ viết tắt | Tên đầy đủ | Mô tả |
|-------------|------------|-------|
| AAD | Azure Active Directory | Dịch vụ quản lý danh tính và quyền truy cập |
| ACR | Azure Container Registry | Dịch vụ đăng ký hình ảnh container |
| AKS | Azure Kubernetes Service | Dịch vụ Kubernetes được quản lý |
| API | Application Programming Interface | Tập hợp các giao thức để xây dựng phần mềm |
| ARM | Azure Resource Manager | Dịch vụ triển khai và quản lý của Azure |
| CDN | Content Delivery Network | Mạng lưới phân phối máy chủ |
| CI/CD | Continuous Integration/Continuous Deployment | Các thực hành phát triển tự động |
| CLI | Command Line Interface | Giao diện người dùng dựa trên văn bản |
| DNS | Domain Name System | Hệ thống chuyển đổi tên miền thành địa chỉ IP |
| HTTPS | Hypertext Transfer Protocol Secure | Phiên bản bảo mật của HTTP |
| IaC | Infrastructure as Code | Quản lý cơ sở hạ tầng thông qua mã |
| JSON | JavaScript Object Notation | Định dạng trao đổi dữ liệu |
| JWT | JSON Web Token | Định dạng token để truyền thông tin an toàn |
| KQL | Kusto Query Language | Ngôn ngữ truy vấn cho các dịch vụ dữ liệu Azure |
| RBAC | Role-Based Access Control | Phương pháp kiểm soát truy cập dựa trên vai trò người dùng |
| REST | Representational State Transfer | Phong cách kiến trúc cho dịch vụ web |
| SDK | Software Development Kit | Bộ công cụ phát triển phần mềm |
| SLA | Service Level Agreement | Cam kết về khả dụng/hiệu suất dịch vụ |
| SQL | Structured Query Language | Ngôn ngữ quản lý cơ sở dữ liệu quan hệ |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Các giao thức mã hóa |
| URI | Uniform Resource Identifier | Chuỗi xác định tài nguyên |
| URL | Uniform Resource Locator | Loại URI chỉ định vị trí tài nguyên |
| VM | Virtual Machine | Mô phỏng hệ thống máy tính |
| VNet | Virtual Network | Mạng riêng trong Azure |
| YAML | YAML Ain't Markup Language | Tiêu chuẩn tuần tự hóa dữ liệu |

---

## Tên dịch vụ Azure

| Tên thông dụng | Tên dịch vụ chính thức của Azure | Loại Host azd |
|----------------|----------------------------------|---------------|
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

## Thuật ngữ theo ngữ cảnh

### Thuật ngữ phát triển
- **Hot Reload**: Tự động cập nhật ứng dụng trong quá trình phát triển mà không cần khởi động lại
- **Build Pipeline**: Quy trình tự động để xây dựng và kiểm tra mã
- **Deployment Slot**: Môi trường staging trong App Service
- **Environment Parity**: Giữ cho các môi trường phát triển, staging và sản xuất tương tự nhau

### Thuật ngữ bảo mật
- **Managed Identity**: Tính năng của Azure cung cấp quản lý thông tin xác thực tự động
- **Key Vault**: Lưu trữ an toàn cho các bí mật, khóa và chứng chỉ
- **RBAC**: Kiểm soát truy cập dựa trên vai trò cho tài nguyên Azure
- **Network Security Group**: Tường lửa ảo để kiểm soát lưu lượng mạng

### Thuật ngữ giám sát
- **Telemetry**: Thu thập tự động các phép đo và dữ liệu
- **Application Performance Monitoring (APM)**: Giám sát hiệu suất phần mềm
- **Log Analytics**: Dịch vụ thu thập và phân tích dữ liệu nhật ký
- **Alert Rules**: Thông báo tự động dựa trên các chỉ số hoặc điều kiện

### Thuật ngữ triển khai
- **Blue-Green Deployment**: Chiến lược triển khai không có thời gian ngừng hoạt động
- **Canary Deployment**: Triển khai dần dần cho một nhóm người dùng nhỏ
- **Rolling Update**: Thay thế tuần tự các phiên bản ứng dụng
- **Rollback**: Quay lại phiên bản ứng dụng trước đó

---

**Mẹo sử dụng**: Sử dụng `Ctrl+F` để nhanh chóng tìm kiếm các thuật ngữ cụ thể trong bảng thuật ngữ này. Các thuật ngữ được tham chiếu chéo khi áp dụng.

---

**Điều hướng**
- **Bài học trước**: [Cheat Sheet](cheat-sheet.md)
- **Bài học tiếp theo**: [FAQ](faq.md)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.