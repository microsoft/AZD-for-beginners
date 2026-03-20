# Hướng Dẫn Học - Mục Tiêu Học Tập Toàn Diện

**Điều Hướng Lộ Trình Học**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../README.md)
- **📖 Bắt Đầu Học**: [Chương 1: Nền Tảng & Bắt Đầu Nhanh](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Theo Dõi Tiến Độ**: [Hoàn Thành Khóa Học](../README.md#-course-completion--certification)

## Giới Thiệu

Hướng dẫn học toàn diện này cung cấp các mục tiêu học tập có cấu trúc, khái niệm chính, bài tập thực hành và tài liệu đánh giá để giúp bạn nắm vững Azure Developer CLI (azd). Sử dụng hướng dẫn này để theo dõi tiến độ và đảm bảo bạn đã phủ hết các chủ đề thiết yếu.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Làm chủ tất cả các khái niệm cơ bản và nâng cao của Azure Developer CLI
- Phát triển kỹ năng thực tế trong triển khai và quản lý ứng dụng trên Azure
- Xây dựng sự tự tin trong khắc phục sự cố và tối ưu hóa triển khai
- Hiểu các thực hành triển khai sẵn sàng cho sản xuất và các cân nhắc về bảo mật

## Kết Quả Học Tập

Sau khi hoàn thành tất cả các phần của hướng dẫn này, bạn sẽ có thể:
- Thiết kế, triển khai và quản lý kiến trúc ứng dụng hoàn chỉnh bằng azd
- Triển khai các chiến lược giám sát, bảo mật và tối ưu chi phí toàn diện
- Khắc phục các sự cố triển khai phức tạp một cách độc lập
- Tạo các mẫu tùy chỉnh và đóng góp cho cộng đồng azd

## Cấu Trúc Học 8 Chương

### Chương 1: Nền Tảng & Bắt Đầu Nhanh (Tuần 1)
**Thời lượng**: 30-45 phút | **Mức độ phức tạp**: ⭐

#### Mục tiêu học tập
- Hiểu các khái niệm cốt lõi và thuật ngữ của Azure Developer CLI
- Cài đặt và cấu hình AZD trên nền tảng phát triển của bạn thành công
- Triển khai ứng dụng đầu tiên sử dụng một mẫu có sẵn
- Điều hướng giao diện dòng lệnh AZD hiệu quả

#### Các khái niệm chính cần nắm
- Cấu trúc dự án AZD và các thành phần (azure.yaml, infra/, src/)
- Quy trình triển khai dựa trên mẫu
- Những điều cơ bản về cấu hình môi trường
- Quản lý nhóm tài nguyên và đăng ký (subscription)

#### Bài tập thực hành
1. **Xác minh cài đặt**: Cài đặt AZD và xác minh bằng `azd version`
2. **Triển khai đầu tiên**: Triển khai mẫu todo-nodejs-mongo thành công
3. **Cấu hình môi trường**: Cấu hình các biến môi trường đầu tiên của bạn
4. **Khám phá tài nguyên**: Điều hướng các tài nguyên đã triển khai trên Azure Portal

#### Câu hỏi đánh giá
- Những thành phần cốt lõi của một dự án AZD là gì?
- Làm thế nào để bạn khởi tạo một dự án mới từ một mẫu?
- Sự khác biệt giữa `azd up` và `azd deploy` là gì?
- Làm thế nào để quản lý nhiều môi trường với AZD?

---

### Chương 2: Phát Triển Ưu Tiên AI (Tuần 2)
**Thời lượng**: 1-2 giờ | **Mức độ phức tạp**: ⭐⭐

#### Mục tiêu học tập
- Tích hợp dịch vụ Microsoft Foundry với quy trình AZD
- Triển khai và cấu hình các ứng dụng hỗ trợ AI
- Hiểu các mẫu triển khai RAG (Tạo sinh được tăng cường bằng truy xuất)
- Quản lý triển khai mô hình AI và khả năng mở rộng

#### Các khái niệm chính cần nắm
- Tích hợp dịch vụ Microsoft Foundry Models và quản lý API
- Cấu hình AI Search và lập chỉ mục vector
- Chiến lược triển khai mô hình và lập kế hoạch năng lực
- Giám sát ứng dụng AI và tối ưu hiệu suất

#### Bài tập thực hành
1. **Triển khai AI Chat**: Triển khai mẫu azure-search-openai-demo
2. **Triển khai RAG**: Cấu hình lập chỉ mục và truy xuất tài liệu
3. **Cấu hình mô hình**: Thiết lập nhiều mô hình AI với các mục đích khác nhau
4. **Giám sát AI**: Triển khai Application Insights cho khối lượng công việc AI

#### Câu hỏi đánh giá
- Làm thế nào để cấu hình dịch vụ Microsoft Foundry Models trong một mẫu AZD?
- Những thành phần chính của kiến trúc RAG là gì?
- Làm thế nào để quản lý năng lực và khả năng mở rộng của mô hình AI?
- Những chỉ số giám sát nào quan trọng cho các ứng dụng AI?

---

### Chương 3: Cấu Hình & Xác Thực (Tuần 3)
**Thời lượng**: 45-60 phút | **Mức độ phức tạp**: ⭐⭐

#### Mục tiêu học tập
- Nắm vững chiến lược cấu hình và quản lý môi trường
- Triển khai các mẫu xác thực an toàn và Managed Identity
- Tổ chức tài nguyên với quy ước đặt tên hợp lý
- Cấu hình triển khai đa môi trường (dev, staging, prod)

#### Các khái niệm chính cần nắm
- Phân cấp môi trường và thứ tự ưu tiên cấu hình
- Xác thực bằng Managed Identity và service principal
- Tích hợp Key Vault để quản lý bí mật
- Quản lý tham số theo từng môi trường

#### Bài tập thực hành
1. **Thiết lập đa môi trường**: Cấu hình môi trường dev, staging và prod
2. **Cấu hình bảo mật**: Triển khai xác thực bằng Managed Identity
3. **Quản lý bí mật**: Tích hợp Azure Key Vault cho dữ liệu nhạy cảm
4. **Quản lý tham số**: Tạo các cấu hình theo môi trường

#### Câu hỏi đánh giá
- Làm thế nào để bạn cấu hình các môi trường khác nhau với AZD?
- Lợi ích của việc sử dụng Managed Identity so với service principals là gì?
- Làm thế nào để quản lý bí mật ứng dụng một cách an toàn?
- Thứ tự ưu tiên cấu hình trong AZD là gì?

---

### Chương 4: Cơ Sở Hạ Tầng như Mã & Triển Khai (Tuần 4-5)
**Thời lượng**: 1-1.5 giờ | **Mức độ phức tạp**: ⭐⭐⭐

#### Mục tiêu học tập
- Tạo và tùy chỉnh các mẫu hạ tầng Bicep
- Triển khai các mẫu và quy trình triển khai nâng cao
- Hiểu chiến lược cung cấp tài nguyên
- Thiết kế kiến trúc nhiều dịch vụ có khả năng mở rộng

- Triển khai ứng dụng container hóa bằng Azure Container Apps và AZD


#### Các khái niệm chính cần nắm
- Cấu trúc mẫu Bicep và các thực hành tốt nhất
- Phụ thuộc tài nguyên và thứ tự triển khai
- Tệp tham số và tính mô-đun của mẫu
- Hook tùy chỉnh và tự động hóa triển khai
- Các mẫu triển khai container app (bắt đầu nhanh, sản xuất, microservices)

#### Bài tập thực hành
1. **Tạo mẫu tùy chỉnh**: Xây dựng mẫu ứng dụng nhiều dịch vụ
2. **Thành thạo Bicep**: Tạo các thành phần hạ tầng mô-đun, có thể tái sử dụng
3. **Tự động hóa triển khai**: Triển khai pre/post deployment hooks
4. **Thiết kế kiến trúc**: Triển khai kiến trúc microservices phức tạp
5. **Triển khai Container App**: Triển khai [Simple Flask API](../../../examples/container-app/simple-flask-api) và [Kiến trúc Microservices](../../../examples/container-app/microservices) ví dụ bằng AZD

#### Câu hỏi đánh giá
- Làm thế nào để tạo các mẫu Bicep tùy chỉnh cho AZD?
- Các thực hành tốt nhất khi tổ chức mã hạ tầng là gì?
- Làm thế nào để xử lý phụ thuộc tài nguyên trong các mẫu?
- Những mẫu triển khai nào hỗ trợ cập nhật không gián đoạn?

---

### Chương 5: Giải Pháp AI Đa Tác Nhân (Tuần 6-7)
**Thời lượng**: 2-3 giờ | **Mức độ phức tạp**: ⭐⭐⭐⭐

#### Mục tiêu học tập
- Thiết kế và triển khai kiến trúc AI đa tác nhân
- Điều phối phối hợp và giao tiếp giữa các tác nhân
- Triển khai các giải pháp AI sẵn sàng cho sản xuất với giám sát
- Hiểu chuyên môn hóa tác nhân và các mẫu luồng công việc
- Tích hợp microservices container hóa như một phần của giải pháp đa tác nhân

#### Các khái niệm chính cần nắm
- Mẫu kiến trúc đa tác nhân và nguyên tắc thiết kế
- Giao thức giao tiếp giữa các tác nhân và luồng dữ liệu
- Chiến lược cân bằng tải và mở rộng cho các tác nhân AI
- Giám sát sản xuất cho hệ thống đa tác nhân
- Giao tiếp dịch vụ-đến-dịch vụ trong môi trường container hóa

#### Bài tập thực hành
1. **Triển khai giải pháp bán lẻ**: Triển khai kịch bản bán lẻ đa tác nhân hoàn chỉnh
2. **Tùy chỉnh tác nhân**: Thay đổi hành vi của tác nhân Khách hàng và Tồn kho
3. **Mở rộng kiến trúc**: Triển khai cân bằng tải và tự động mở rộng
4. **Giám sát sản xuất**: Thiết lập giám sát và cảnh báo toàn diện
5. **Tích hợp Microservices**: Mở rộng ví dụ [Kiến trúc Microservices](../../../examples/container-app/microservices) để hỗ trợ luồng công việc dựa trên tác nhân

#### Câu hỏi đánh giá
- Làm thế nào để thiết kế các mẫu giao tiếp đa tác nhân hiệu quả?
- Những cân nhắc chính khi mở rộng khối lượng công việc của tác nhân AI là gì?
- Làm thế nào để giám sát và gỡ lỗi hệ thống AI đa tác nhân?
- Những mẫu sản xuất nào đảm bảo độ tin cậy cho các tác nhân AI?

---

### Chương 6: Xác Thực & Lập Kế Hoạch Trước Triển Khai (Tuần 8)
**Thời lượng**: 1 giờ | **Mức độ phức tạp**: ⭐⭐

#### Mục tiêu học tập
- Thực hiện lập kế hoạch công suất và xác thực tài nguyên toàn diện
- Chọn SKU Azure tối ưu để tiết kiệm chi phí
- Triển khai các kiểm tra tự động trước khi triển khai và xác thực
- Lập kế hoạch triển khai với chiến lược tối ưu chi phí

#### Các khái niệm chính cần nắm
- Hạn mức tài nguyên Azure và giới hạn năng lực
- Tiêu chí lựa chọn SKU và tối ưu hóa chi phí
- Kịch bản xác thực tự động và kiểm thử
- Lập kế hoạch triển khai và đánh giá rủi ro

#### Bài tập thực hành
1. **Phân tích công suất**: Phân tích yêu cầu tài nguyên cho ứng dụng của bạn
2. **Tối ưu SKU**: So sánh và chọn các cấp dịch vụ tiết kiệm chi phí
3. **Tự động hóa xác thực**: Triển khai tập lệnh kiểm tra trước triển khai
4. **Lập kế hoạch chi phí**: Tạo ước tính chi phí triển khai và ngân sách

#### Câu hỏi đánh giá
- Làm thế nào để xác thực công suất Azure trước khi triển khai?
- Những yếu tố nào ảnh hưởng đến quyết định chọn SKU?
- Làm thế nào để tự động hóa xác thực trước triển khai?
- Những chiến lược nào giúp tối ưu chi phí triển khai?

---

### Chương 7: Xử Lý Sự Cố & Gỡ Lỗi (Tuần 9)
**Thời lượng**: 1-1.5 giờ | **Mức độ phức tạp**: ⭐⭐

#### Mục tiêu học tập
- Phát triển các phương pháp gỡ lỗi có hệ thống cho các triển khai AZD
- Giải quyết các vấn đề triển khai và cấu hình thường gặp
- Gỡ lỗi các vấn đề đặc thù AI và hiệu suất
- Triển khai giám sát và cảnh báo để phát hiện vấn đề chủ động

#### Các khái niệm chính cần nắm
- Kỹ thuật chẩn đoán và chiến lược ghi log
- Các mẫu lỗi thường gặp và giải pháp của chúng
- Giám sát hiệu suất và tối ưu hoá
- Quy trình phản ứng sự cố và khôi phục

#### Bài tập thực hành
1. **Kỹ năng chẩn đoán**: Thực hành với các triển khai bị hỏng có chủ ý
2. **Phân tích log**: Sử dụng Azure Monitor và Application Insights hiệu quả
3. **Tối ưu hiệu suất**: Tối ưu các ứng dụng có hiệu suất chậm
4. **Quy trình khôi phục**: Triển khai sao lưu và khôi phục sau thảm họa

#### Câu hỏi đánh giá
- Những lỗi triển khai AZD phổ biến nhất là gì?
- Làm thế nào để gỡ lỗi các vấn đề xác thực và quyền hạn?
- Những chiến lược giám sát nào giúp ngăn ngừa sự cố sản xuất?
- Làm thế nào để tối ưu hiệu suất ứng dụng trên Azure?

---

### Chương 8: Mẫu cho Sản Xuất & Doanh Nghiệp (Tuần 10-11)
**Thời lượng**: 2-3 giờ | **Mức độ phức tạp**: ⭐⭐⭐⭐

#### Mục tiêu học tập
- Triển khai các chiến lược triển khai cấp doanh nghiệp
- Thiết kế các mẫu bảo mật và khung tuân thủ
- Thiết lập giám sát, quản trị và quản lý chi phí
- Tạo các pipeline CI/CD có khả năng mở rộng với tích hợp AZD
- Áp dụng các thực hành tốt nhất cho triển khai container app sản xuất (bảo mật, giám sát, chi phí, CI/CD)

#### Các khái niệm chính cần nắm
- Yêu cầu bảo mật doanh nghiệp và tuân thủ
- Khung quản trị và triển khai chính sách
- Giám sát nâng cao và quản lý chi phí
- Tích hợp CI/CD và pipeline triển khai tự động
- Chiến lược blue-green và canary cho khối lượng công việc container hóa

#### Bài tập thực hành
1. **Bảo mật doanh nghiệp**: Triển khai các mẫu bảo mật toàn diện
2. **Khung quản trị**: Thiết lập Azure Policy và quản lý tài nguyên
3. **Giám sát nâng cao**: Tạo dashboard và cảnh báo tự động
4. **Tích hợp CI/CD**: Xây dựng pipeline triển khai tự động
5. **Container Apps cho sản xuất**: Áp dụng bảo mật, giám sát và tối ưu chi phí cho ví dụ [Kiến trúc Microservices](../../../examples/container-app/microservices)

#### Câu hỏi đánh giá
- Làm thế nào để triển khai bảo mật cấp doanh nghiệp trong các triển khai AZD?
- Những mẫu quản trị nào đảm bảo tuân thủ và kiểm soát chi phí?
- Làm thế nào để thiết kế giám sát có khả năng mở rộng cho hệ thống sản xuất?
- Những mẫu CI/CD nào hoạt động tốt nhất với quy trình AZD?

#### Mục tiêu học tập
- Hiểu các nguyên tắc cơ bản và khái niệm cốt lõi của Azure Developer CLI
- Cài đặt và cấu hình azd trên môi trường phát triển của bạn thành công
- Hoàn thành triển khai đầu tiên bằng một mẫu có sẵn
- Điều hướng cấu trúc dự án azd và hiểu các thành phần chính

#### Các khái niệm chính cần nắm
- Mẫu, môi trường và dịch vụ
- Cấu trúc cấu hình azure.yaml
- Các lệnh azd cơ bản (init, up, down, deploy)
- Nguyên tắc Infrastructure as Code
- Xác thực và ủy quyền trên Azure

#### Bài tập Thực hành

**Exercise 1.1: Installation and Setup**
```bash
# Hoàn thành các nhiệm vụ sau:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercise 1.2: First Deployment**
```bash
# Triển khai một ứng dụng web đơn giản:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Exercise 1.3: Project Structure Analysis**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Câu hỏi Tự đánh giá
1. What are the three core concepts of azd architecture?
2. What is the purpose of the azure.yaml file?
3. How do environments help manage different deployment targets?
4. What authentication methods can be used with azd?
5. What happens when you run `azd up` for the first time?

---

## Khung Theo Dõi Tiến Độ và Đánh Giá
```bash
# Tạo và cấu hình nhiều môi trường:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Exercise 2.2: Advanced Configuration**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Exercise 2.3: Security Configuration**
```bash
# Thực hiện các thực hành tốt nhất về bảo mật:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Câu hỏi Tự đánh giá
1. How does azd handle environment variable precedence?
2. What are deployment hooks and when should you use them?
3. How do you configure different SKUs for different environments?
4. What are the security implications of different authentication methods?
5. How do you manage secrets and sensitive configuration data?

### Module 3: Triển Khai và Cung Cấp Tài Nguyên (Tuần 4)

#### Mục tiêu học tập
- Thành thạo các luồng triển khai và các thực hành tốt nhất
- Hiểu Infrastructure as Code với các mẫu Bicep
- Triển khai các kiến trúc đa dịch vụ phức tạp
- Tối ưu hóa hiệu suất và độ tin cậy triển khai

#### Các khái niệm chính cần nắm
- Cấu trúc mẫu Bicep và modules
- Phụ thuộc tài nguyên và thứ tự
- Chiến lược triển khai (blue-green, rolling updates)
- Triển khai đa khu vực
- Migrations cơ sở dữ liệu và quản lý dữ liệu

#### Bài tập Thực hành

**Exercise 3.1: Custom Infrastructure**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Exercise 3.2: Multi-Service Application**
```bash
# Triển khai kiến trúc microservices:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercise 3.3: Database Integration**
```bash
# Thực hiện các mẫu triển khai cơ sở dữ liệu:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Câu hỏi Tự đánh giá
1. What are the advantages of using Bicep over ARM templates?
2. How do you handle database migrations in azd deployments?
3. What strategies exist for zero-downtime deployments?
4. How do you manage dependencies between services?
5. What are the considerations for multi-region deployments?

### Module 4: Xác Thực Trước Triển Khai (Tuần 5)
- Thực hiện kiểm tra toàn diện trước khi triển khai
- Nắm vững lập kế hoạch công suất và xác thực tài nguyên
- Hiểu lựa chọn SKU và tối ưu chi phí
- Xây dựng pipeline xác thực tự động

#### Các Khái Niệm Chính Cần Nắm
- Hạn mức và quota tài nguyên Azure
- Tiêu chí lựa chọn SKU và ảnh hưởng chi phí
- Script và công cụ xác thực tự động
- Phương pháp lập kế hoạch công suất
- Kiểm thử hiệu năng và tối ưu hóa

#### Bài Tập Thực Hành

**Bài tập 4.1: Lập kế hoạch công suất**
```bash
# Thực hiện xác thực dung lượng:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Bài tập 4.2: Xác thực trước khi bay**
```powershell
# Xây dựng quy trình kiểm tra toàn diện:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Bài tập 4.3: Tối ưu SKU**
```bash
# Tối ưu hóa cấu hình dịch vụ:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Câu hỏi Tự Đánh Giá
1. Những yếu tố nào nên ảnh hưởng đến quyết định lựa chọn SKU?
2. Làm thế nào để bạn xác thực khả năng sẵn sàng tài nguyên Azure trước khi triển khai?
3. Những thành phần chính của hệ thống kiểm tra trước khi bay là gì?
4. Làm thế nào để ước tính và kiểm soát chi phí triển khai?
5. Những gì cần giám sát để lập kế hoạch công suất?

### Module 5: Khắc phục sự cố và Gỡ lỗi (Tuần 6)

#### Mục tiêu học tập
- Nắm vững các phương pháp khắc phục sự cố có hệ thống
- Phát triển chuyên môn trong gỡ lỗi các vấn đề triển khai phức tạp
- Triển khai giám sát và cảnh báo toàn diện
- Xây dựng quy trình phản ứng sự cố và phục hồi

#### Các Khái Niệm Chính Cần Nắm
- Các mẫu lỗi triển khai phổ biến
- Kỹ thuật phân tích và tương quan log
- Giám sát hiệu năng và tối ưu hóa
- Phát hiện và phản ứng sự cố bảo mật
- Khôi phục thảm họa và kế hoạch liên tục hoạt động kinh doanh

#### Bài Tập Thực Hành

**Bài tập 5.1: Tình huống khắc phục sự cố**
```bash
# Thực hành giải quyết các vấn đề thường gặp:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Bài tập 5.2: Triển khai giám sát**
```bash
# Thiết lập giám sát toàn diện:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Bài tập 5.3: Phản ứng sự cố**
```bash
# Xây dựng quy trình ứng phó sự cố:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Câu hỏi Tự Đánh Giá
1. Tiếp cận có hệ thống để khắc phục sự cố các triển khai azd là gì?
2. Làm thế nào để bạn tương quan log giữa nhiều dịch vụ và tài nguyên?
3. Những chỉ số giám sát nào là quan trọng nhất để phát hiện sớm vấn đề?
4. Làm thế nào để triển khai các thủ tục khôi phục thảm họa hiệu quả?
5. Những thành phần chính của kế hoạch phản ứng sự cố là gì?

### Module 6: Các chủ đề nâng cao và Thực hành tốt nhất (Tuần 7-8)

#### Mục tiêu học tập
- Triển khai các mẫu triển khai cấp doanh nghiệp
- Nắm vững tích hợp CI/CD và tự động hóa
- Phát triển mẫu tùy chỉnh và đóng góp cho cộng đồng
- Hiểu các yêu cầu bảo mật và tuân thủ nâng cao

#### Các Khái Niệm Chính Cần Nắm
- Mẫu tích hợp pipeline CI/CD
- Phát triển và phân phối mẫu tùy chỉnh
- Quản trị doanh nghiệp và tuân thủ
- Cấu hình mạng và bảo mật nâng cao
- Tối ưu hóa hiệu năng và quản lý chi phí

#### Bài Tập Thực Hành

**Bài tập 6.1: Tích hợp CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Bài tập 6.2: Phát triển mẫu tùy chỉnh**
```bash
# Tạo và xuất bản mẫu tùy chỉnh:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Bài tập 6.3: Triển khai doanh nghiệp**
```bash
# Triển khai các tính năng cấp doanh nghiệp:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Câu hỏi Tự Đánh Giá
1. Làm thế nào để tích hợp azd vào workflow CI/CD hiện có?
2. Những cân nhắc chính khi phát triển mẫu tùy chỉnh là gì?
3. Làm thế nào để triển khai quản trị và tuân thủ trong các triển khai azd?
4. Những thực hành tốt nhất cho triển khai quy mô doanh nghiệp là gì?
5. Làm thế nào để đóng góp hiệu quả cho cộng đồng azd?

## Dự án Thực tế

### Dự án 1: Website Hồ sơ cá nhân
**Độ phức tạp**: Người mới bắt đầu  
**Thời lượng**: 1-2 tuần

Xây dựng và triển khai website hồ sơ cá nhân sử dụng:
- Lưu trữ website tĩnh trên Azure Storage
- Cấu hình tên miền tùy chỉnh
- Tích hợp CDN để tối ưu hiệu năng toàn cầu
- Pipeline triển khai tự động

**Kết quả bàn giao**:
- Website hoạt động triển khai trên Azure
- Mẫu azd tùy chỉnh cho triển khai portfolio
- Tài liệu quy trình triển khai
- Phân tích chi phí và đề xuất tối ưu

### Dự án 2: Ứng dụng Quản lý Công việc
**Độ phức tạp**: Trung cấp  
**Thời lượng**: 2-3 tuần

Tạo một ứng dụng full-stack quản lý công việc bao gồm:
- Frontend React triển khai lên App Service
- Backend API Node.js có xác thực
- Cơ sở dữ liệu PostgreSQL có migration
- Giám sát bằng Application Insights

**Kết quả bàn giao**:
- Ứng dụng hoàn chỉnh với xác thực người dùng
- Sơ đồ cơ sở dữ liệu và script migration
- Dashboard giám sát và quy tắc cảnh báo
- Cấu hình triển khai đa môi trường

### Dự án 3: Nền tảng Thương mại điện tử Microservices
**Độ phức tạp**: Nâng cao  
**Thời lượng**: 4-6 tuần

Thiết kế và triển khai nền tảng thương mại điện tử dựa trên microservices:
- Nhiều dịch vụ API (catalog, orders, payments, users)
- Tích hợp hàng đợi tin nhắn với Service Bus
- Redis cache để tối ưu hiệu năng
- Ghi log và giám sát toàn diện

**Ví dụ Tham khảo**: Xem [Kiến trúc Microservices](../../../examples/container-app/microservices) cho mẫu sẵn sàng sản xuất và hướng dẫn triển khai

**Kết quả bàn giao**:
- Kiến trúc microservices hoàn chỉnh
- Mẫu giao tiếp giữa các dịch vụ
- Kiểm thử hiệu năng và tối ưu hóa
- Triển khai bảo mật sẵn sàng cho sản xuất

## Đánh giá và Chứng nhận

### Kiểm tra Kiến thức

Hoàn thành các bài kiểm tra này sau mỗi module:

**Bài kiểm tra Module 1**: Khái niệm cơ bản và cài đặt
- Câu hỏi trắc nghiệm về các khái niệm lõi
- Nhiệm vụ cài đặt và cấu hình thực hành
- Bài tập triển khai đơn giản

**Bài kiểm tra Module 2**: Cấu hình và môi trường
- Tình huống quản lý môi trường
- Bài tập khắc phục cấu hình
- Triển khai cấu hình bảo mật

**Bài kiểm tra Module 3**: Triển khai và cung cấp
- Thử thách thiết kế hạ tầng
- Tình huống triển khai đa dịch vụ
- Bài tập tối ưu hiệu năng

**Bài kiểm tra Module 4**: Xác thực trước khi triển khai
- Case study lập kế hoạch công suất
- Tình huống tối ưu chi phí
- Triển khai pipeline xác thực

**Bài kiểm tra Module 5**: Khắc phục sự cố và gỡ lỗi
- Bài tập chẩn đoán vấn đề
- Nhiệm vụ triển khai giám sát
- Mô phỏng phản ứng sự cố

**Bài kiểm tra Module 6**: Chủ đề nâng cao
- Thiết kế pipeline CI/CD
- Phát triển mẫu tùy chỉnh
- Tình huống kiến trúc doanh nghiệp

### Dự án Tốt nghiệp Cuối khóa

Thiết kế và triển khai một giải pháp hoàn chỉnh thể hiện sự thuần thục tất cả các khái niệm:

**Yêu cầu**:
- Kiến trúc ứng dụng đa tầng
- Nhiều môi trường triển khai
- Giám sát và cảnh báo toàn diện
- Triển khai bảo mật và tuân thủ
- Tối ưu chi phí và điều chỉnh hiệu năng
- Tài liệu hoàn chỉnh và runbook

**Tiêu chí đánh giá**:
- Chất lượng triển khai kỹ thuật
- Độ hoàn chỉnh của tài liệu
- Tuân thủ bảo mật và thực hành tốt nhất
- Tối ưu hóa hiệu năng và chi phí
- Hiệu quả trong khắc phục sự cố và giám sát

## Tài nguyên và Tham khảo học tập

### Tài liệu chính thức
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Tài nguyên cộng đồng
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Môi trường thực hành
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Công cụ bổ sung
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Khuyến nghị Lịch học

### Học Toàn thời gian (8 tuần)
- **Tuần 1-2**: Modules 1-2 (Bắt đầu, Cấu hình)
- **Tuần 3-4**: Modules 3-4 (Triển khai, Trước khi triển khai)
- **Tuần 5-6**: Modules 5-6 (Khắc phục sự cố, Chủ đề nâng cao)
- **Tuần 7-8**: Dự án thực tế và Bài kiểm tra cuối

### Học Bán thời gian (16 tuần)
- **Tuần 1-4**: Module 1 (Bắt đầu)
- **Tuần 5-7**: Module 2 (Cấu hình và Môi trường)
- **Tuần 8-10**: Module 3 (Triển khai và Cung cấp)
- **Tuần 11-12**: Module 4 (Xác thực trước khi triển khai)
- **Tuần 13-14**: Module 5 (Khắc phục sự cố và Gỡ lỗi)
- **Tuần 15-16**: Module 6 (Chủ đề nâng cao và Đánh giá)

---

## Khung Theo dõi Tiến độ và Đánh giá

### Danh sách Kiểm tra Hoàn thành Chương

Theo dõi tiến độ qua từng chương với các kết quả đo lường được:

#### 📚 Chapter 1: Foundation & Quick Start
- [ ] **Installation Complete**: AZD installed and verified on your platform
- [ ] **First Deployment**: Successfully deployed todo-nodejs-mongo template
- [ ] **Environment Setup**: Configured first environment variables
- [ ] **Resource Navigation**: Explored deployed resources in Azure Portal
- [ ] **Command Mastery**: Comfortable with basic AZD commands

#### 🤖 Chapter 2: AI-First Development  
- [ ] **AI Template Deployment**: Deployed azure-search-openai-demo successfully
- [ ] **RAG Implementation**: Configured document indexing and retrieval
- [ ] **Model Configuration**: Set up multiple AI models with different purposes
- [ ] **AI Monitoring**: Implemented Application Insights for AI workloads
- [ ] **Performance Optimization**: Tuned AI application performance

#### ⚙️ Chapter 3: Configuration & Authentication
- [ ] **Multi-Environment Setup**: Configured dev, staging, and prod environments
- [ ] **Security Implementation**: Set up managed identity authentication
- [ ] **Secrets Management**: Integrated Azure Key Vault for sensitive data
- [ ] **Parameter Management**: Created environment-specific configurations
- [ ] **Authentication Mastery**: Implemented secure access patterns

#### 🏗️ Chapter 4: Infrastructure as Code & Deployment
- [ ] **Custom Template Creation**: Built a multi-service application template
- [ ] **Bicep Mastery**: Created modular, reusable infrastructure components
- [ ] **Deployment Automation**: Implemented pre/post deployment hooks
- [ ] **Architecture Design**: Deployed complex microservices architecture
- [ ] **Template Optimization**: Optimized templates for performance and cost

#### 🎯 Chapter 5: Multi-Agent AI Solutions
- [ ] **Retail Solution Deployment**: Deployed complete multi-agent retail scenario
- [ ] **Agent Customization**: Modified Customer and Inventory agent behaviors
- [ ] **Architecture Scaling**: Implemented load balancing and auto-scaling
- [ ] **Production Monitoring**: Set up comprehensive monitoring and alerting
- [ ] **Performance Tuning**: Optimized multi-agent system performance

#### 🔍 Chapter 6: Pre-Deployment Validation & Planning
- [ ] **Capacity Analysis**: Analyzed resource requirements for applications
- [ ] **SKU Optimization**: Selected cost-effective service tiers
- [ ] **Validation Automation**: Implemented pre-deployment check scripts
- [ ] **Cost Planning**: Created deployment cost estimates and budgets
- [ ] **Risk Assessment**: Identified and mitigated deployment risks

#### 🚨 Chapter 7: Troubleshooting & Debugging
- [ ] **Diagnostic Skills**: Successfully debugged intentionally broken deployments
- [ ] **Log Analysis**: Used Azure Monitor and Application Insights effectively
- [ ] **Performance Tuning**: Optimized slow-performing applications
- [ ] **Recovery Procedures**: Implemented backup and disaster recovery
- [ ] **Monitoring Setup**: Created proactive monitoring and alerting

#### 🏢 Chapter 8: Production & Enterprise Patterns
- [ ] **Enterprise Security**: Implemented comprehensive security patterns
- [ ] **Governance Framework**: Set up Azure Policy and resource management
- [ ] **Advanced Monitoring**: Created dashboards and automated alerting
- [ ] **CI/CD Integration**: Built automated deployment pipelines
- [ ] **Compliance Implementation**: Met enterprise compliance requirements

### Lộ trình học và Cột mốc

#### Tuần 1-2: Xây dựng nền tảng
- **Cột mốc**: Triển khai ứng dụng AI đầu tiên bằng AZD
- **Xác thực**: Ứng dụng hoạt động có thể truy cập qua URL công khai
- **Kỹ năng**: Quy trình AZD cơ bản và tích hợp dịch vụ AI

#### Tuần 3-4: Thành thạo cấu hình
- **Cột mốc**: Triển khai đa môi trường với xác thực bảo mật
- **Xác thực**: Cùng ứng dụng triển khai trên dev/staging/prod
- **Kỹ năng**: Quản lý môi trường và triển khai bảo mật

#### Tuần 5-6: Chuyên môn hạ tầng
- **Cột mốc**: Mẫu tùy chỉnh cho ứng dụng đa dịch vụ phức tạp
- **Xác thực**: Mẫu có thể tái sử dụng triển khai bởi thành viên khác
- **Kỹ năng**: Thành thạo Bicep và tự động hóa hạ tầng

#### Tuần 7-8: Triển khai AI nâng cao
- **Cột mốc**: Giải pháp multi-agent AI sẵn sàng cho sản xuất
- **Xác thực**: Hệ thống xử lý tải thực tế với giám sát
- **Kỹ năng**: Điều phối multi-agent và tối ưu hiệu năng

#### Tuần 9-10: Chuẩn bị lên sản xuất
- **Cột mốc**: Triển khai cấp doanh nghiệp với tuân thủ đầy đủ
- **Xác thực**: Qua kiểm duyệt bảo mật và kiểm toán tối ưu chi phí
- **Kỹ năng**: Quản trị, giám sát và tích hợp CI/CD

### Đánh giá và Chứng nhận

#### Phương pháp xác thực kiến thức
1. **Triển khai thực tế**: Ứng dụng hoạt động cho mỗi chương
2. **Code Review**: Đánh giá chất lượng mẫu và cấu hình
3. **Giải quyết vấn đề**: Tình huống khắc phục sự cố và giải pháp
4. **Dạy đồng nghiệp**: Giải thích khái niệm cho người học khác
5. **Đóng góp cộng đồng**: Chia sẻ mẫu hoặc cải tiến

#### Kết quả phát triển nghề nghiệp
- **Dự án trong hồ sơ**: 8 bản triển khai sẵn sàng cho sản xuất
- **Kỹ năng kỹ thuật**: Chuyên môn triển khai AZD và AI theo tiêu chuẩn ngành
- **Khả năng giải quyết vấn đề**: Khả năng tự xử lý sự cố và tối ưu hóa
- **Sự công nhận cộng đồng**: Tham gia tích cực trong cộng đồng nhà phát triển Azure
- **Thăng tiến nghề nghiệp**: Kỹ năng áp dụng trực tiếp cho các vai trò về điện toán đám mây và AI

#### Các chỉ số thành công
- **Tỷ lệ triển khai thành công**: >95% bản triển khai thành công
- **Thời gian xử lý sự cố**: <30 phút cho các vấn đề thường gặp
- **Tối ưu hóa hiệu năng**: Cải thiện rõ rệt về chi phí và hiệu suất
- **Tuân thủ bảo mật**: Tất cả các triển khai đáp ứng tiêu chuẩn bảo mật doanh nghiệp
- **Chuyển giao kiến thức**: Khả năng hướng dẫn các nhà phát triển khác

### Học tập liên tục và tham gia cộng đồng

#### Luôn cập nhật
- **Cập nhật Azure**: Theo dõi ghi chú phát hành của Azure Developer CLI
- **Sự kiện cộng đồng**: Tham gia các sự kiện dành cho nhà phát triển Azure và AI
- **Tài liệu**: Đóng góp vào tài liệu và ví dụ cho cộng đồng
- **Vòng phản hồi**: Cung cấp phản hồi về nội dung khóa học và các dịch vụ Azure

#### Phát triển nghề nghiệp
- **Mạng lưới chuyên nghiệp**: Kết nối với các chuyên gia Azure và AI
- **Cơ hội thuyết trình**: Trình bày những điều đã học tại các hội nghị hoặc buổi gặp gỡ
- **Đóng góp mã nguồn mở**: Đóng góp vào các mẫu và công cụ AZD
- **Cố vấn**: Hướng dẫn các nhà phát triển khác trong hành trình học AZD của họ

---

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD cho Người Mới Bắt Đầu](../README.md)
- **📖 Bắt đầu học**: [Chương 1: Nền tảng & Bắt đầu nhanh](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Theo dõi tiến trình**: Theo dõi tiến bộ của bạn thông qua hệ thống học 8 chương toàn diện
- **🤝 Cộng đồng**: [Azure Discord](https://discord.gg/microsoft-azure) để hỗ trợ và thảo luận

**Theo dõi tiến trình học**: Sử dụng hướng dẫn có cấu trúc này để thành thạo Azure Developer CLI thông qua học tập theo lộ trình, thực hành thiết thực với kết quả có thể đo lường và lợi ích phát triển nghề nghiệp.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc thiếu chính xác. Văn bản gốc bằng ngôn ngữ gốc nên được coi là nguồn chính thức. Đối với những thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->