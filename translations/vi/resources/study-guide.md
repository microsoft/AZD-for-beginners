<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T22:28:39+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "vi"
}
-->
# Hướng Dẫn Học - AZD Cho Người Mới Bắt Đầu

## Giới Thiệu

Hướng dẫn học toàn diện này cung cấp các mục tiêu học tập có cấu trúc, các khái niệm chính, bài tập thực hành và tài liệu đánh giá để giúp bạn làm chủ Azure Developer CLI (azd). Sử dụng hướng dẫn này để theo dõi tiến trình của bạn và đảm bảo bạn đã bao quát tất cả các chủ đề thiết yếu.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn học này, bạn sẽ:
- Làm chủ tất cả các khái niệm cơ bản và nâng cao của Azure Developer CLI
- Phát triển kỹ năng thực hành trong việc triển khai và quản lý ứng dụng Azure
- Xây dựng sự tự tin trong việc khắc phục sự cố và tối ưu hóa triển khai
- Hiểu các thực hành triển khai sẵn sàng cho sản xuất và các cân nhắc về bảo mật

## Kết Quả Học Tập

Sau khi hoàn thành tất cả các phần của hướng dẫn học này, bạn sẽ có thể:
- Thiết kế, triển khai và quản lý kiến trúc ứng dụng hoàn chỉnh bằng azd
- Thực hiện các chiến lược giám sát, bảo mật và tối ưu hóa chi phí toàn diện
- Tự khắc phục các vấn đề triển khai phức tạp
- Tạo mẫu tùy chỉnh và đóng góp cho cộng đồng azd

## Cấu Trúc Khóa Học

### Module 1: Bắt Đầu (Tuần 1-2)

#### Mục Tiêu Học Tập
- Hiểu các khái niệm cơ bản và nền tảng của Azure Developer CLI
- Cài đặt và cấu hình azd thành công trên môi trường phát triển của bạn
- Hoàn thành triển khai đầu tiên bằng cách sử dụng mẫu có sẵn
- Điều hướng cấu trúc dự án azd và hiểu các thành phần chính

#### Các Khái Niệm Chính Cần Làm Chủ
- Mẫu, môi trường và dịch vụ
- Cấu trúc cấu hình azure.yaml
- Các lệnh cơ bản của azd (init, up, down, deploy)
- Nguyên tắc Infrastructure as Code
- Xác thực và ủy quyền Azure

#### Bài Tập Thực Hành

**Bài Tập 1.1: Cài Đặt và Thiết Lập**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Bài Tập 1.2: Triển Khai Đầu Tiên**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Bài Tập 1.3: Phân Tích Cấu Trúc Dự Án**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Câu Hỏi Tự Đánh Giá
1. Ba khái niệm cốt lõi của kiến trúc azd là gì?
2. Mục đích của tệp azure.yaml là gì?
3. Môi trường giúp quản lý các mục tiêu triển khai khác nhau như thế nào?
4. Các phương pháp xác thực nào có thể được sử dụng với azd?
5. Điều gì xảy ra khi bạn chạy `azd up` lần đầu tiên?

### Module 2: Cấu Hình và Môi Trường (Tuần 3)

#### Mục Tiêu Học Tập
- Làm chủ quản lý môi trường và cấu hình
- Hiểu cấu hình nâng cao của azure.yaml
- Thực hiện các cài đặt và biến cụ thể cho môi trường
- Cấu hình xác thực cho các tình huống khác nhau

#### Các Khái Niệm Chính Cần Làm Chủ
- Cấp bậc môi trường và sự ưu tiên của biến
- Cấu hình dịch vụ và tham số
- Hooks và các sự kiện vòng đời
- Các phương pháp xác thực (người dùng, service principal, managed identity)
- Quản lý tệp cấu hình

#### Bài Tập Thực Hành

**Bài Tập 2.1: Thiết Lập Nhiều Môi Trường**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Bài Tập 2.2: Cấu Hình Nâng Cao**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Bài Tập 2.3: Cấu Hình Bảo Mật**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Câu Hỏi Tự Đánh Giá
1. Azd xử lý sự ưu tiên của biến môi trường như thế nào?
2. Deployment hooks là gì và khi nào bạn nên sử dụng chúng?
3. Làm thế nào để bạn cấu hình các SKU khác nhau cho các môi trường khác nhau?
4. Các tác động bảo mật của các phương pháp xác thực khác nhau là gì?
5. Làm thế nào để bạn quản lý các bí mật và dữ liệu cấu hình nhạy cảm?

### Module 3: Triển Khai và Cung Cấp (Tuần 4)

#### Mục Tiêu Học Tập
- Làm chủ quy trình triển khai và các thực hành tốt nhất
- Hiểu Infrastructure as Code với các mẫu Bicep
- Thực hiện các kiến trúc đa dịch vụ phức tạp
- Tối ưu hóa hiệu suất và độ tin cậy triển khai

#### Các Khái Niệm Chính Cần Làm Chủ
- Cấu trúc mẫu Bicep và các module
- Sự phụ thuộc và thứ tự tài nguyên
- Chiến lược triển khai (blue-green, rolling updates)
- Triển khai đa vùng
- Di chuyển cơ sở dữ liệu và quản lý dữ liệu

#### Bài Tập Thực Hành

**Bài Tập 3.1: Hạ Tầng Tùy Chỉnh**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Bài Tập 3.2: Ứng Dụng Đa Dịch Vụ**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Bài Tập 3.3: Tích Hợp Cơ Sở Dữ Liệu**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Câu Hỏi Tự Đánh Giá
1. Lợi ích của việc sử dụng Bicep so với ARM templates là gì?
2. Làm thế nào để bạn xử lý di chuyển cơ sở dữ liệu trong các triển khai azd?
3. Các chiến lược nào tồn tại để triển khai không gián đoạn?
4. Làm thế nào để bạn quản lý sự phụ thuộc giữa các dịch vụ?
5. Các cân nhắc cho triển khai đa vùng là gì?

### Module 4: Xác Thực Trước Triển Khai (Tuần 5)

#### Mục Tiêu Học Tập
- Thực hiện kiểm tra trước triển khai toàn diện
- Làm chủ lập kế hoạch dung lượng và xác thực tài nguyên
- Hiểu tiêu chí chọn SKU và tối ưu hóa chi phí
- Xây dựng các pipeline xác thực tự động

#### Các Khái Niệm Chính Cần Làm Chủ
- Hạn mức và giới hạn tài nguyên Azure
- Tiêu chí chọn SKU và tác động chi phí
- Các script và công cụ xác thực tự động
- Phương pháp lập kế hoạch dung lượng
- Kiểm tra hiệu suất và tối ưu hóa

#### Bài Tập Thực Hành

**Bài Tập 4.1: Lập Kế Hoạch Dung Lượng**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Bài Tập 4.2: Xác Thực Trước Triển Khai**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Bài Tập 4.3: Tối Ưu Hóa SKU**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Câu Hỏi Tự Đánh Giá
1. Những yếu tố nào nên ảnh hưởng đến quyết định chọn SKU?
2. Làm thế nào để bạn xác thực tính khả dụng của tài nguyên Azure trước khi triển khai?
3. Các thành phần chính của hệ thống kiểm tra trước triển khai là gì?
4. Làm thế nào để bạn ước tính và kiểm soát chi phí triển khai?
5. Những giám sát nào là cần thiết cho lập kế hoạch dung lượng?

### Module 5: Khắc Phục Sự Cố và Gỡ Lỗi (Tuần 6)

#### Mục Tiêu Học Tập
- Làm chủ các phương pháp khắc phục sự cố có hệ thống
- Phát triển chuyên môn trong việc gỡ lỗi các vấn đề triển khai phức tạp
- Thực hiện giám sát và cảnh báo toàn diện
- Xây dựng quy trình phản ứng và phục hồi sự cố

#### Các Khái Niệm Chính Cần Làm Chủ
- Các mẫu lỗi triển khai phổ biến
- Kỹ thuật phân tích và liên kết log
- Giám sát hiệu suất và tối ưu hóa
- Phát hiện và phản ứng sự cố bảo mật
- Phục hồi thảm họa và liên tục kinh doanh

#### Bài Tập Thực Hành

**Bài Tập 5.1: Các Tình Huống Khắc Phục Sự Cố**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Bài Tập 5.2: Thực Hiện Giám Sát**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Bài Tập 5.3: Phản Ứng Sự Cố**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Câu Hỏi Tự Đánh Giá
1. Phương pháp tiếp cận có hệ thống để khắc phục sự cố triển khai azd là gì?
2. Làm thế nào để bạn liên kết log giữa nhiều dịch vụ và tài nguyên?
3. Các chỉ số giám sát nào là quan trọng nhất để phát hiện vấn đề sớm?
4. Làm thế nào để bạn thực hiện các quy trình phục hồi thảm họa hiệu quả?
5. Các thành phần chính của kế hoạch phản ứng sự cố là gì?

### Module 6: Các Chủ Đề Nâng Cao và Thực Hành Tốt Nhất (Tuần 7-8)

#### Mục Tiêu Học Tập
- Thực hiện các mẫu triển khai cấp doanh nghiệp
- Làm chủ tích hợp và tự động hóa CI/CD
- Phát triển mẫu tùy chỉnh và đóng góp cho cộng đồng
- Hiểu các yêu cầu bảo mật và tuân thủ nâng cao

#### Các Khái Niệm Chính Cần Làm Chủ
- Các mẫu tích hợp pipeline CI/CD
- Phát triển và phân phối mẫu tùy chỉnh
- Quản trị và tuân thủ cấp doanh nghiệp
- Cấu hình mạng và bảo mật nâng cao
- Tối ưu hóa hiệu suất và quản lý chi phí

#### Bài Tập Thực Hành

**Bài Tập 6.1: Tích Hợp CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Bài Tập 6.2: Phát Triển Mẫu Tùy Chỉnh**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Bài Tập 6.3: Triển Khai Cấp Doanh Nghiệp**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Câu Hỏi Tự Đánh Giá
1. Làm thế nào để bạn tích hợp azd vào các workflow CI/CD hiện có?
2. Những cân nhắc chính cho việc phát triển mẫu tùy chỉnh là gì?
3. Làm thế nào để bạn thực hiện quản trị và tuân thủ trong các triển khai azd?
4. Các thực hành tốt nhất cho triển khai quy mô doanh nghiệp là gì?
5. Làm thế nào để bạn đóng góp hiệu quả cho cộng đồng azd?

## Dự Án Thực Tế

### Dự Án 1: Website Portfolio Cá Nhân
**Độ Phức Tạp**: Người Mới Bắt Đầu  
**Thời Gian**: 1-2 tuần

Xây dựng và triển khai một website portfolio cá nhân sử dụng:
- Lưu trữ website tĩnh trên Azure Storage
- Cấu hình tên miền tùy chỉnh
- Tích hợp CDN để tối ưu hóa hiệu suất toàn cầu
- Pipeline triển khai tự động

**Kết Quả**:
- Website hoạt động được triển khai trên Azure
- Mẫu azd tùy chỉnh cho triển khai portfolio
- Tài liệu về quy trình triển khai
- Khuyến nghị tối ưu hóa chi phí

### Dự Án 2: Ứng Dụng Quản Lý Nhiệm Vụ
**Độ Phức Tạp**: Trung Cấp  
**Thời Gian**: 2-3 tuần

Tạo một ứng dụng quản lý nhiệm vụ full-stack với:
- Frontend React triển khai trên App Service
- Backend API Node.js với xác thực
- Cơ sở dữ liệu PostgreSQL với di chuyển dữ liệu
- Giám sát bằng Application Insights

**Kết Quả**:
- Ứng dụng hoàn chỉnh với xác thực người dùng
- Schema cơ sở dữ liệu và script di chuyển
- Dashboard giám sát và quy tắc cảnh báo
- Cấu hình triển khai đa môi trường

### Dự Án 3: Nền Tảng Thương Mại Điện Tử Microservices
**Độ Phức Tạp**: Nâng Cao  
**Thời Gian**: 4-6 tuần

Thiết kế và triển khai một nền tảng thương mại điện tử dựa trên microservices:
- Nhiều dịch vụ API (catalog, orders, payments, users)
- Tích hợp hàng đợi tin nhắn với Service Bus
- Bộ nhớ đệm Redis để tối ưu hóa hiệu suất
- Giám sát và logging toàn diện

**Kết Quả**:
- Kiến trúc microservices hoàn chỉnh
- Các mẫu giao tiếp giữa các dịch vụ
- Kiểm tra hiệu suất và tối ưu hóa
- Triển khai bảo mật sẵn sàng cho sản xuất

## Đánh Giá và Chứng Nhận

### Kiểm Tra Kiến Thức

Hoàn thành các bài đánh giá sau mỗi module:

**Đánh Giá Module 1**: Các khái niệm cơ bản và cài đặt
- Câu hỏi trắc nghiệm về các khái niệm cốt lõi
- Nhiệm vụ cài đặt và cấu hình thực tế
- Bài tập triển khai đơn giản

**Đánh Giá Module 2**: Cấu hình và môi trường
- Các tình huống quản lý môi trường
- Bài tập khắc phục sự cố cấu hình
- Thực hiện cấu hình bảo mật

**Đánh Giá Module 3**: Triển khai và cung cấp
- Thách thức thiết kế hạ tầng
- Các tình huống triển khai đa dịch vụ
- Bài tập tối ưu hóa hiệu suất

**Đánh Giá Module 4**: Xác thực trước triển khai
- Nghiên cứu trường hợp lập kế hoạch dung lượng
- Các tình huống tối ưu hóa chi phí
- Thực hiện pipeline xác thực

**Đánh Giá Module 5**: Khắc phục sự cố và gỡ lỗi
- Bài tập chẩn đoán vấn đề
- Nhiệm vụ thực hiện giám sát
- Mô phỏng phản ứng sự cố

**Đánh Giá Module 6**: Các chủ đề nâng cao
- Thiết kế pipeline CI/CD
- Phát triển mẫu tùy chỉnh
- Các tình huống kiến trúc cấp doanh nghiệp

### Dự Án Capstone Cuối Cùng

Thiết kế và triển khai một giải pháp hoàn chỉnh thể hiện sự làm chủ tất cả các khái niệm:

**Yêu Cầu**:
- Kiến trúc ứng dụng nhiều tầng
- Nhiều môi trường triển khai
- Giám sát và cảnh báo toàn diện
- Thực hiện bảo mật và tuân thủ
- Tối ưu hóa chi phí và hiệu suất
- Tài liệu và runbook hoàn chỉnh

**Tiêu Chí Đánh Giá**:
- Chất lượng triển khai kỹ thuật
- Độ hoàn chỉnh của tài liệu
- Tuân thủ bảo mật và thực hành tốt nhất
- Tối ưu hóa hiệu suất và chi phí
- Hiệu quả khắc phục sự cố và giám sát

## Tài Nguyên Học Tập và Tham Khảo

### Tài Liệu Chính Thức
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Tài Nguyên Cộng Đồng
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Môi Trường Thực Hành
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Công Cụ Bổ Sung
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Khuyến Nghị Lịch Học

### Học Toàn Thời Gian (8 tuần)
- **Tuần 1-2**: Module 1-2 (Bắt Đầu, Cấu Hình)
- **Tuần 3-4**: Module 3-4 (Triển Khai, Xác Thực Trước Triển Khai)
- **Tuần 5-6**: Module 5-6 (Khắc Phục Sự Cố, Các Chủ Đề Nâng Cao)
- **Tuần 7-8**: Dự Án Thực Tế và Đánh Giá Cuối Cùng

### Học Bán Thời Gian (16 tuần)
- **Tuần 1-4**: Module 1 (Bắt Đầu)
- **Tuần 5-7**: Module 2 (Cấu Hình và Môi Trường)
- **Tuần 8-10**: Module 3 (Triển Khai và Cung Cấp)
- **Tuần 11-12**: Module 4 (Xác Thực Trước Triển Khai)
- **Tuần 13-14**: Module 5 (Khắc Phục Sự Cố và Gỡ Lỗi)
- **Tuần 15-16**: Module 6 (Các Chủ Đề Nâng Cao và Đánh Giá)

### Học Tự Do
- Hoàn thành mỗi module theo tốc độ của bạn
- Dành thêm thời gian cho các khái niệm khó
- Lặp lại bài tập cho đến khi bạn đạt được sự làm chủ
- Tham gia thảo luận cộng đồng và đặt
3. **Đóng góp cho mã nguồn mở**: Chia sẻ các mẫu và giải pháp của bạn với cộng đồng  
4. **Dạy người khác**: Giải thích các khái niệm cho người khác sẽ củng cố sự hiểu biết của chính bạn  
5. **Luôn tò mò**: Liên tục khám phá các dịch vụ Azure mới và các mô hình tích hợp  

---

**Điều hướng**  
- **Bài học trước**: [FAQ](faq.md)  
- **Bài học tiếp theo**: [Changelog](../changelog.md)  

**Theo dõi tiến độ học tập**: Sử dụng hướng dẫn này để theo dõi hành trình học tập của bạn và đảm bảo bao quát toàn diện tất cả các khái niệm và thực hành của Azure Developer CLI.  

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.