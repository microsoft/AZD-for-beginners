<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-18T07:47:52+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "vi"
}
-->
# Hướng Dẫn Học Tập - Mục Tiêu Học Tập Toàn Diện

**Điều Hướng Lộ Trình Học Tập**
- **📚 Trang Chủ Khóa Học**: [AZD For Beginners](../README.md)
- **📖 Bắt Đầu Học**: [Chương 1: Nền Tảng & Bắt Đầu Nhanh](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Theo Dõi Tiến Độ**: [Hoàn Thành Khóa Học](../README.md#-course-completion--certification)

## Giới Thiệu

Hướng dẫn học tập toàn diện này cung cấp các mục tiêu học tập có cấu trúc, các khái niệm chính, bài tập thực hành, và tài liệu đánh giá để giúp bạn làm chủ Azure Developer CLI (azd). Sử dụng hướng dẫn này để theo dõi tiến độ của bạn và đảm bảo bạn đã nắm vững tất cả các chủ đề quan trọng.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Làm chủ tất cả các khái niệm cơ bản và nâng cao của Azure Developer CLI
- Phát triển kỹ năng thực hành trong việc triển khai và quản lý ứng dụng Azure
- Xây dựng sự tự tin trong việc xử lý sự cố và tối ưu hóa triển khai
- Hiểu các thực hành triển khai sẵn sàng cho sản xuất và các cân nhắc về bảo mật

## Kết Quả Học Tập

Sau khi hoàn thành tất cả các phần của hướng dẫn này, bạn sẽ có thể:
- Thiết kế, triển khai, và quản lý kiến trúc ứng dụng hoàn chỉnh bằng azd
- Thực hiện các chiến lược giám sát, bảo mật, và tối ưu hóa chi phí toàn diện
- Xử lý sự cố triển khai phức tạp một cách độc lập
- Tạo mẫu tùy chỉnh và đóng góp cho cộng đồng azd

## Cấu Trúc Học Tập 8 Chương

### Chương 1: Nền Tảng & Bắt Đầu Nhanh (Tuần 1)
**Thời Lượng**: 30-45 phút | **Độ Phức Tạp**: ⭐

#### Mục Tiêu Học Tập
- Hiểu các khái niệm cốt lõi và thuật ngữ của Azure Developer CLI
- Cài đặt và cấu hình AZD thành công trên nền tảng phát triển của bạn
- Triển khai ứng dụng đầu tiên bằng mẫu có sẵn
- Điều hướng giao diện dòng lệnh AZD một cách hiệu quả

#### Các Khái Niệm Chính Cần Nắm Vững
- Cấu trúc dự án AZD và các thành phần (azure.yaml, infra/, src/)
- Quy trình triển khai dựa trên mẫu
- Cấu hình môi trường cơ bản
- Quản lý nhóm tài nguyên và đăng ký

#### Bài Tập Thực Hành
1. **Xác Minh Cài Đặt**: Cài đặt AZD và xác minh bằng `azd version`
2. **Triển Khai Đầu Tiên**: Triển khai mẫu todo-nodejs-mongo thành công
3. **Cài Đặt Môi Trường**: Cấu hình biến môi trường đầu tiên của bạn
4. **Khám Phá Tài Nguyên**: Điều hướng các tài nguyên đã triển khai trong Azure Portal

#### Câu Hỏi Đánh Giá
- Các thành phần cốt lõi của một dự án AZD là gì?
- Làm thế nào để khởi tạo một dự án mới từ mẫu?
- Sự khác biệt giữa `azd up` và `azd deploy` là gì?
- Làm thế nào để quản lý nhiều môi trường với AZD?

---

### Chương 2: Phát Triển Ưu Tiên AI (Tuần 2)
**Thời Lượng**: 1-2 giờ | **Độ Phức Tạp**: ⭐⭐

#### Mục Tiêu Học Tập
- Tích hợp các dịch vụ Azure AI Foundry với quy trình làm việc AZD
- Triển khai và cấu hình các ứng dụng tích hợp AI
- Hiểu các mẫu triển khai RAG (Retrieval-Augmented Generation)
- Quản lý triển khai mô hình AI và khả năng mở rộng

#### Các Khái Niệm Chính Cần Nắm Vững
- Tích hợp dịch vụ Azure OpenAI và quản lý API
- Cấu hình AI Search và lập chỉ mục vector
- Chiến lược triển khai mô hình và lập kế hoạch năng lực
- Giám sát ứng dụng AI và tối ưu hóa hiệu suất

#### Bài Tập Thực Hành
1. **Triển Khai Chat AI**: Triển khai mẫu azure-search-openai-demo
2. **Triển Khai RAG**: Cấu hình lập chỉ mục và truy xuất tài liệu
3. **Cấu Hình Mô Hình**: Thiết lập nhiều mô hình AI với các mục đích khác nhau
4. **Giám Sát AI**: Triển khai Application Insights cho khối lượng công việc AI

#### Câu Hỏi Đánh Giá
- Làm thế nào để cấu hình dịch vụ Azure OpenAI trong một mẫu AZD?
- Các thành phần chính của kiến trúc RAG là gì?
- Làm thế nào để quản lý năng lực và khả năng mở rộng của mô hình AI?
- Các chỉ số giám sát quan trọng cho ứng dụng AI là gì?

---

### Chương 3: Cấu Hình & Xác Thực (Tuần 3)
**Thời Lượng**: 45-60 phút | **Độ Phức Tạp**: ⭐⭐

#### Mục Tiêu Học Tập
- Làm chủ chiến lược cấu hình và quản lý môi trường
- Triển khai các mẫu xác thực an toàn và danh tính được quản lý
- Tổ chức tài nguyên với quy ước đặt tên hợp lý
- Cấu hình triển khai đa môi trường (dev, staging, prod)

#### Các Khái Niệm Chính Cần Nắm Vững
- Thứ bậc môi trường và ưu tiên cấu hình
- Xác thực danh tính được quản lý và dịch vụ chính
- Tích hợp Key Vault để quản lý bí mật
- Quản lý tham số cụ thể cho từng môi trường

#### Bài Tập Thực Hành
1. **Cài Đặt Đa Môi Trường**: Cấu hình môi trường dev, staging, và prod
2. **Cấu Hình Bảo Mật**: Triển khai xác thực danh tính được quản lý
3. **Quản Lý Bí Mật**: Tích hợp Azure Key Vault cho dữ liệu nhạy cảm
4. **Quản Lý Tham Số**: Tạo cấu hình cụ thể cho từng môi trường

#### Câu Hỏi Đánh Giá
- Làm thế nào để cấu hình các môi trường khác nhau với AZD?
- Lợi ích của việc sử dụng danh tính được quản lý thay vì dịch vụ chính là gì?
- Làm thế nào để quản lý bí mật ứng dụng một cách an toàn?
- Thứ bậc cấu hình trong AZD hoạt động như thế nào?

---

### Chương 4: Hạ Tầng dưới dạng Mã & Triển Khai (Tuần 4-5)
**Thời Lượng**: 1-1.5 giờ | **Độ Phức Tạp**: ⭐⭐⭐

#### Mục Tiêu Học Tập
- Tạo và tùy chỉnh mẫu hạ tầng Bicep
- Triển khai các mẫu triển khai và quy trình làm việc nâng cao
- Hiểu chiến lược cung cấp tài nguyên
- Thiết kế kiến trúc đa dịch vụ có khả năng mở rộng

#### Các Khái Niệm Chính Cần Nắm Vững
- Cấu trúc mẫu Bicep và các thực hành tốt nhất
- Phụ thuộc tài nguyên và thứ tự triển khai
- Tệp tham số và tính mô-đun của mẫu
- Hook tùy chỉnh và tự động hóa triển khai

#### Bài Tập Thực Hành
1. **Tạo Mẫu Tùy Chỉnh**: Xây dựng mẫu ứng dụng đa dịch vụ
2. **Làm Chủ Bicep**: Tạo các thành phần hạ tầng mô-đun, có thể tái sử dụng
3. **Tự Động Hóa Triển Khai**: Triển khai hook trước/sau triển khai
4. **Thiết Kế Kiến Trúc**: Triển khai kiến trúc microservices phức tạp

#### Câu Hỏi Đánh Giá
- Làm thế nào để tạo mẫu Bicep tùy chỉnh cho AZD?
- Các thực hành tốt nhất để tổ chức mã hạ tầng là gì?
- Làm thế nào để xử lý phụ thuộc tài nguyên trong mẫu?
- Các mẫu triển khai nào hỗ trợ cập nhật không gián đoạn?

---

### Chương 5: Giải Pháp AI Đa Tác Nhân (Tuần 6-7)
**Thời Lượng**: 2-3 giờ | **Độ Phức Tạp**: ⭐⭐⭐⭐

#### Mục Tiêu Học Tập
- Thiết kế và triển khai kiến trúc AI đa tác nhân
- Điều phối sự phối hợp và giao tiếp giữa các tác nhân
- Triển khai các giải pháp AI sẵn sàng cho sản xuất với giám sát
- Hiểu sự chuyên môn hóa của tác nhân và các mẫu quy trình làm việc

#### Các Khái Niệm Chính Cần Nắm Vững
- Các mẫu kiến trúc đa tác nhân và nguyên tắc thiết kế
- Giao thức giao tiếp giữa các tác nhân và luồng dữ liệu
- Chiến lược cân bằng tải và khả năng mở rộng cho các tác nhân AI
- Giám sát sản xuất cho hệ thống đa tác nhân

#### Bài Tập Thực Hành
1. **Triển Khai Giải Pháp Bán Lẻ**: Triển khai kịch bản bán lẻ đa tác nhân hoàn chỉnh
2. **Tùy Chỉnh Tác Nhân**: Sửa đổi hành vi của tác nhân Khách Hàng và Kho Hàng
3. **Mở Rộng Kiến Trúc**: Triển khai cân bằng tải và tự động mở rộng
4. **Giám Sát Sản Xuất**: Thiết lập giám sát toàn diện và cảnh báo tự động

#### Câu Hỏi Đánh Giá
- Làm thế nào để thiết kế các mẫu giao tiếp hiệu quả giữa các tác nhân?
- Các cân nhắc chính để mở rộng khối lượng công việc của tác nhân AI là gì?
- Làm thế nào để giám sát và gỡ lỗi hệ thống AI đa tác nhân?
- Các mẫu sản xuất nào đảm bảo độ tin cậy cho các tác nhân AI?

---

### Chương 6: Xác Minh & Lập Kế Hoạch Trước Triển Khai (Tuần 8)
**Thời Lượng**: 1 giờ | **Độ Phức Tạp**: ⭐⭐

#### Mục Tiêu Học Tập
- Thực hiện lập kế hoạch năng lực và xác minh tài nguyên toàn diện
- Lựa chọn các SKU Azure tối ưu để tiết kiệm chi phí
- Triển khai kiểm tra và xác minh tự động trước khi triển khai
- Lập kế hoạch triển khai với các chiến lược tối ưu hóa chi phí

#### Các Khái Niệm Chính Cần Nắm Vững
- Hạn mức tài nguyên Azure và các giới hạn năng lực
- Tiêu chí lựa chọn SKU và tối ưu hóa chi phí
- Kịch bản xác minh tự động và kiểm tra
- Phương pháp lập kế hoạch năng lực
- Kiểm tra hiệu suất và tối ưu hóa

#### Bài Tập Thực Hành
1. **Phân Tích Năng Lực**: Phân tích yêu cầu tài nguyên cho ứng dụng của bạn
2. **Tối Ưu SKU**: So sánh và lựa chọn các cấp dịch vụ tiết kiệm chi phí
3. **Tự Động Hóa Xác Minh**: Triển khai kịch bản kiểm tra trước triển khai
4. **Lập Kế Hoạch Chi Phí**: Tạo ước tính chi phí triển khai và ngân sách

#### Câu Hỏi Đánh Giá
- Các yếu tố nào nên ảnh hưởng đến quyết định lựa chọn SKU?
2. Làm thế nào để xác thực tính khả dụng của tài nguyên Azure trước khi triển khai?  
3. Các thành phần chính của hệ thống kiểm tra trước khi triển khai là gì?  
4. Làm thế nào để ước tính và kiểm soát chi phí triển khai?  
5. Những yếu tố giám sát nào là cần thiết cho việc lập kế hoạch dung lượng?

### Module 5: Xử lý sự cố và Gỡ lỗi (Tuần 6)

#### Mục tiêu học tập
- Nắm vững các phương pháp xử lý sự cố một cách hệ thống  
- Phát triển kỹ năng gỡ lỗi các vấn đề triển khai phức tạp  
- Triển khai hệ thống giám sát và cảnh báo toàn diện  
- Xây dựng quy trình phản ứng và phục hồi sự cố  

#### Các khái niệm chính cần nắm vững
- Các mẫu lỗi triển khai phổ biến  
- Phân tích và liên kết nhật ký  
- Giám sát hiệu suất và tối ưu hóa  
- Phát hiện và phản ứng với sự cố bảo mật  
- Khôi phục thảm họa và duy trì hoạt động kinh doanh  

#### Bài tập thực hành

**Bài tập 5.1: Các tình huống xử lý sự cố**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Bài tập 5.2: Triển khai giám sát**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Bài tập 5.3: Phản ứng với sự cố**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Câu hỏi tự đánh giá
1. Phương pháp tiếp cận hệ thống để xử lý sự cố triển khai azd là gì?  
2. Làm thế nào để liên kết nhật ký giữa nhiều dịch vụ và tài nguyên?  
3. Những chỉ số giám sát nào là quan trọng nhất để phát hiện sớm vấn đề?  
4. Làm thế nào để triển khai các quy trình khôi phục thảm họa hiệu quả?  
5. Các thành phần chính của kế hoạch phản ứng sự cố là gì?

### Module 6: Chủ đề nâng cao và Thực hành tốt nhất (Tuần 7-8)

#### Mục tiêu học tập
- Triển khai các mẫu triển khai cấp doanh nghiệp  
- Nắm vững tích hợp và tự động hóa CI/CD  
- Phát triển mẫu tùy chỉnh và đóng góp cho cộng đồng  
- Hiểu các yêu cầu bảo mật và tuân thủ nâng cao  

#### Các khái niệm chính cần nắm vững
- Các mẫu tích hợp pipeline CI/CD  
- Phát triển và phân phối mẫu tùy chỉnh  
- Quản trị và tuân thủ cấp doanh nghiệp  
- Cấu hình mạng và bảo mật nâng cao  
- Tối ưu hóa hiệu suất và quản lý chi phí  

#### Bài tập thực hành

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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Bài tập 6.3: Triển khai cấp doanh nghiệp**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Câu hỏi tự đánh giá
1. Làm thế nào để tích hợp azd vào các workflow CI/CD hiện có?  
2. Những yếu tố quan trọng cần xem xét khi phát triển mẫu tùy chỉnh là gì?  
3. Làm thế nào để triển khai quản trị và tuân thủ trong các triển khai azd?  
4. Các thực hành tốt nhất cho triển khai quy mô doanh nghiệp là gì?  
5. Làm thế nào để đóng góp hiệu quả cho cộng đồng azd?

## Dự án thực hành

### Dự án 1: Website Portfolio Cá nhân  
**Độ phức tạp**: Cơ bản  
**Thời gian**: 1-2 tuần  

Xây dựng và triển khai một website portfolio cá nhân sử dụng:  
- Lưu trữ website tĩnh trên Azure Storage  
- Cấu hình tên miền tùy chỉnh  
- Tích hợp CDN để cải thiện hiệu suất toàn cầu  
- Pipeline triển khai tự động  

**Kết quả cần đạt**:  
- Website hoạt động được triển khai trên Azure  
- Mẫu azd tùy chỉnh cho các triển khai portfolio  
- Tài liệu về quy trình triển khai  
- Đề xuất tối ưu hóa chi phí  

### Dự án 2: Ứng dụng Quản lý Công việc  
**Độ phức tạp**: Trung cấp  
**Thời gian**: 2-3 tuần  

Tạo một ứng dụng quản lý công việc full-stack với:  
- Frontend React triển khai trên App Service  
- Backend API Node.js với xác thực  
- Cơ sở dữ liệu PostgreSQL với các script migration  
- Giám sát bằng Application Insights  

**Kết quả cần đạt**:  
- Ứng dụng hoàn chỉnh với xác thực người dùng  
- Schema cơ sở dữ liệu và script migration  
- Dashboard giám sát và quy tắc cảnh báo  
- Cấu hình triển khai đa môi trường  

### Dự án 3: Nền tảng E-commerce Microservices  
**Độ phức tạp**: Nâng cao  
**Thời gian**: 4-6 tuần  

Thiết kế và triển khai một nền tảng e-commerce dựa trên microservices:  
- Nhiều dịch vụ API (catalog, orders, payments, users)  
- Tích hợp hàng đợi tin nhắn với Service Bus  
- Redis cache để tối ưu hóa hiệu suất  
- Hệ thống nhật ký và giám sát toàn diện  

**Kết quả cần đạt**:  
- Kiến trúc microservices hoàn chỉnh  
- Mô hình giao tiếp giữa các dịch vụ  
- Kiểm tra hiệu suất và tối ưu hóa  
- Triển khai bảo mật sẵn sàng cho sản xuất  

## Đánh giá và Chứng nhận

### Kiểm tra kiến thức

Hoàn thành các bài kiểm tra sau mỗi module:

**Đánh giá Module 1**: Các khái niệm cơ bản và cài đặt  
- Câu hỏi trắc nghiệm về các khái niệm cốt lõi  
- Nhiệm vụ cài đặt và cấu hình thực tế  
- Bài tập triển khai đơn giản  

**Đánh giá Module 2**: Cấu hình và môi trường  
- Các tình huống quản lý môi trường  
- Bài tập xử lý sự cố cấu hình  
- Triển khai cấu hình bảo mật  

**Đánh giá Module 3**: Triển khai và cung cấp tài nguyên  
- Thách thức thiết kế hạ tầng  
- Các tình huống triển khai nhiều dịch vụ  
- Bài tập tối ưu hóa hiệu suất  

**Đánh giá Module 4**: Xác thực trước triển khai  
- Nghiên cứu trường hợp lập kế hoạch dung lượng  
- Các tình huống tối ưu hóa chi phí  
- Triển khai pipeline xác thực  

**Đánh giá Module 5**: Xử lý sự cố và gỡ lỗi  
- Bài tập chẩn đoán vấn đề  
- Nhiệm vụ triển khai giám sát  
- Mô phỏng phản ứng sự cố  

**Đánh giá Module 6**: Chủ đề nâng cao  
- Thiết kế pipeline CI/CD  
- Phát triển mẫu tùy chỉnh  
- Các tình huống kiến trúc cấp doanh nghiệp  

### Dự án Capstone Cuối cùng

Thiết kế và triển khai một giải pháp hoàn chỉnh thể hiện sự thành thạo tất cả các khái niệm:

**Yêu cầu**:  
- Kiến trúc ứng dụng nhiều tầng  
- Nhiều môi trường triển khai  
- Hệ thống giám sát và cảnh báo toàn diện  
- Triển khai bảo mật và tuân thủ  
- Tối ưu hóa chi phí và hiệu suất  
- Tài liệu và runbook đầy đủ  

**Tiêu chí đánh giá**:  
- Chất lượng triển khai kỹ thuật  
- Độ hoàn chỉnh của tài liệu  
- Tuân thủ bảo mật và thực hành tốt nhất  
- Tối ưu hóa hiệu suất và chi phí  
- Hiệu quả xử lý sự cố và giám sát  

## Tài nguyên học tập và tham khảo

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

## Lịch trình học tập đề xuất

### Học toàn thời gian (8 tuần)
- **Tuần 1-2**: Module 1-2 (Bắt đầu, Cấu hình)  
- **Tuần 3-4**: Module 3-4 (Triển khai, Xác thực trước triển khai)  
- **Tuần 5-6**: Module 5-6 (Xử lý sự cố, Chủ đề nâng cao)  
- **Tuần 7-8**: Dự án thực hành và Đánh giá cuối cùng  

### Học bán thời gian (16 tuần)
- **Tuần 1-4**: Module 1 (Bắt đầu)  
- **Tuần 5-7**: Module 2 (Cấu hình và môi trường)  
- **Tuần 8-10**: Module 3 (Triển khai và cung cấp tài nguyên)  
- **Tuần 11-12**: Module 4 (Xác thực trước triển khai)  
- **Tuần 13-14**: Module 5 (Xử lý sự cố và gỡ lỗi)  
- **Tuần 15-16**: Module 6 (Chủ đề nâng cao và Đánh giá)  

---

## Theo dõi tiến độ và khung đánh giá

### Danh sách kiểm tra hoàn thành chương

Theo dõi tiến độ của bạn qua từng chương với các kết quả có thể đo lường:

#### 📚 Chương 1: Nền tảng & Bắt đầu nhanh  
- [ ] **Hoàn thành cài đặt**: AZD được cài đặt và xác minh trên nền tảng của bạn  
- [ ] **Triển khai đầu tiên**: Thành công triển khai mẫu todo-nodejs-mongo  
- [ ] **Cài đặt môi trường**: Cấu hình biến môi trường đầu tiên  
- [ ] **Khám phá tài nguyên**: Tìm hiểu tài nguyên đã triển khai trên Azure Portal  
- [ ] **Thành thạo lệnh**: Sử dụng thành thạo các lệnh cơ bản của AZD  

#### 🤖 Chương 2: Phát triển AI-First  
- [ ] **Triển khai mẫu AI**: Thành công triển khai azure-search-openai-demo  
- [ ] **Triển khai RAG**: Cấu hình indexing và truy xuất tài liệu  
- [ ] **Cấu hình mô hình**: Thiết lập nhiều mô hình AI với các mục đích khác nhau  
- [ ] **Giám sát AI**: Triển khai Application Insights cho workload AI  
- [ ] **Tối ưu hóa hiệu suất**: Tinh chỉnh hiệu suất ứng dụng AI  

#### ⚙️ Chương 3: Cấu hình & Xác thực  
- [ ] **Thiết lập đa môi trường**: Cấu hình môi trường dev, staging, và prod  
- [ ] **Triển khai bảo mật**: Cài đặt xác thực bằng managed identity  
- [ ] **Quản lý bí mật**: Tích hợp Azure Key Vault cho dữ liệu nhạy cảm  
- [ ] **Quản lý tham số**: Tạo cấu hình riêng cho từng môi trường  
- [ ] **Thành thạo xác thực**: Triển khai các mẫu truy cập an toàn  

#### 🏗️ Chương 4: Hạ tầng dưới dạng mã & Triển khai  
- [ ] **Tạo mẫu tùy chỉnh**: Xây dựng mẫu ứng dụng nhiều dịch vụ  
- [ ] **Thành thạo Bicep**: Tạo các thành phần hạ tầng tái sử dụng  
- [ ] **Tự động hóa triển khai**: Triển khai các hook trước/sau triển khai  
- [ ] **Thiết kế kiến trúc**: Triển khai kiến trúc microservices phức tạp  
- [ ] **Tối ưu hóa mẫu**: Tinh chỉnh mẫu để đạt hiệu suất và chi phí tối ưu  

#### 🎯 Chương 5: Giải pháp AI Đa-Agent  
- [ ] **Triển khai giải pháp bán lẻ**: Thành công triển khai kịch bản bán lẻ đa-agent  
- [ ] **Tùy chỉnh agent**: Thay đổi hành vi của Customer và Inventory agent  
- [ ] **Mở rộng kiến trúc**: Triển khai cân bằng tải và tự động mở rộng  
- [ ] **Giám sát sản xuất**: Thiết lập hệ thống giám sát và cảnh báo toàn diện  
- [ ] **Tối ưu hóa hiệu suất**: Tinh chỉnh hiệu suất hệ thống đa-agent  

#### 🔍 Chương 6: Xác thực trước triển khai & Lập kế hoạch  
- [ ] **Phân tích dung lượng**: Phân tích yêu cầu tài nguyên cho ứng dụng  
- [ ] **Tối ưu hóa SKU**: Lựa chọn các cấp dịch vụ hiệu quả về chi phí  
- [ ] **Tự động hóa xác thực**: Triển khai script kiểm tra trước triển khai  
- [ ] **Lập kế hoạch chi phí**: Tạo ước tính chi phí triển khai và ngân sách  
- [ ] **Đánh giá rủi ro**: Xác định và giảm thiểu rủi ro triển khai  

#### 🚨 Chương 7: Xử lý sự cố & Gỡ lỗi  
- [ ] **Kỹ năng chẩn đoán**: Thành công gỡ lỗi các triển khai bị lỗi có chủ ý  
- [ ] **Phân tích nhật ký**: Sử dụng hiệu quả Azure Monitor và Application Insights  
- [ ] **Tối ưu hóa hiệu suất**: Tinh chỉnh các ứng dụng hoạt động chậm  
- [ ] **Quy trình phục hồi**: Triển khai backup và khôi phục thảm họa  
- [ ] **Thiết lập giám sát**: Tạo hệ thống giám sát và cảnh báo chủ động  

#### 🏢 Chương 8: Sản xuất & Mẫu cấp doanh nghiệp  
- [ ] **Bảo mật doanh nghiệp**: Triển khai các mẫu bảo mật toàn diện  
- [ ] **Khung quản trị**: Cài đặt Azure Policy và quản lý tài nguyên  
- [ ] **Giám sát nâng cao**: Tạo dashboard và cảnh báo tự động  
- [ ] **Tích hợp CI/CD**: Xây dựng pipeline triển khai tự động  
- [ ] **Triển khai tuân thủ**: Đáp ứng các yêu cầu tuân thủ cấp doanh nghiệp  

### Lộ trình học tập và các cột mốc

#### Tuần 1-2: Xây dựng nền tảng  
- **Cột mốc**: Triển khai ứng dụng AI đầu tiên bằng AZD  
- **Xác thực**: Ứng dụng hoạt động được truy cập qua URL công khai  
- **Kỹ năng**: Workflow cơ bản của AZD và tích hợp dịch vụ AI  

#### Tuần 3-4: Thành thạo cấu hình  
- **Cột mốc**: Triển khai đa môi trường với xác thực bảo mật  
- **Xác thực**: Cùng một ứng dụng được triển khai trên dev/staging/prod  
- **Kỹ năng**: Quản lý môi trường và triển khai bảo mật  

#### Tuần 5-6: Chuyên môn về hạ tầng  
- **Cột mốc**: Mẫu tùy chỉnh cho ứng dụng nhiều dịch vụ phức tạp  
- **Xác thực**: Mẫu tái sử dụng được triển khai bởi thành viên khác trong nhóm  
- **Kỹ năng**: Thành thạo Bicep và tự động hóa hạ tầng  

#### Tuần 7-8: Triển khai AI nâng cao  
- **Cột mốc**: Giải pháp AI đa-agent sẵn sàng cho sản xuất  
- **Xác thực**: Hệ thống xử lý tải thực tế với giám sát đầy đủ  
- **Kỹ năng**: Điều phối đa-agent và tối ưu hóa hiệu suất  

#### Tuần 9-10: Sẵn sàng sản xuất  
- **Cột mốc**: Triển khai cấp doanh nghiệp với tuân thủ đầy đủ  
- **Xác thực**: Đạt yêu cầu bảo mật và tối ưu hóa chi phí  
- **Kỹ năng**: Quản trị, giám sát, và tích hợp CI/CD  

### Đánh giá và Chứng nhận

#### Phương pháp xác thực kiến thức  
1. **Triển khai thực tế**: Các ứng dụng hoạt động cho từng chương  
2. **Đánh giá mã nguồn**: Đánh giá chất lượng mẫu và cấu hình  
3. **Giải quyết vấn đề**: Các tình huống xử lý sự cố và giải pháp  
4. **Giảng dạy đồng nghiệp**: Giải thích các khái niệm cho người học khác  
5. **Đóng góp cộng đồng**: Chia sẻ mẫu hoặc cải tiến  

#### Kết quả phát triển chuyên môn  
- **Dự án Portfolio**: 8 triển khai sẵn sàng sản xuất  
- **Kỹ năng kỹ thuật**: Chuyên môn triển khai AZD và AI theo tiêu chuẩn ngành  
- **Khả năng giải quyết vấn đề**: Xử lý sự cố và tối ưu hóa độc lập  
- **Công nhận cộng đồng**: Tham gia tích cực vào cộng đồng nhà phát triển Azure  
- **Thăng tiến nghề nghiệp**: Kỹ năng áp dụng trực tiếp vào các vai trò về cloud và AI  

#### Chỉ số thành công  
- **Tỷ lệ triển khai thành công**: >95% triển khai thành công  
- **Thời gian xử lý sự cố**: <30 phút cho các vấn đề phổ biến  
- **T
- **Tài liệu**: Đóng góp vào tài liệu cộng đồng và các ví dụ
- **Vòng phản hồi**: Cung cấp phản hồi về nội dung khóa học và các dịch vụ Azure

#### Phát triển sự nghiệp
- **Mạng lưới chuyên nghiệp**: Kết nối với các chuyên gia Azure và AI
- **Cơ hội diễn thuyết**: Trình bày những gì đã học tại các hội nghị hoặc buổi gặp mặt
- **Đóng góp mã nguồn mở**: Đóng góp vào các mẫu và công cụ AZD
- **Hướng dẫn**: Dẫn dắt các nhà phát triển khác trong hành trình học AZD của họ

---

**Điều hướng chương:**
- **📚 Trang chủ khóa học**: [AZD Cho Người Mới Bắt Đầu](../README.md)
- **📖 Bắt đầu học**: [Chương 1: Nền tảng & Khởi động nhanh](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Theo dõi tiến độ**: Theo dõi sự tiến bộ của bạn qua hệ thống học tập toàn diện gồm 8 chương
- **🤝 Cộng đồng**: [Azure Discord](https://discord.gg/microsoft-azure) để nhận hỗ trợ và thảo luận

**Theo dõi tiến độ học tập**: Sử dụng hướng dẫn có cấu trúc này để làm chủ Azure Developer CLI thông qua việc học tập tiến bộ, thực hành thực tế với kết quả đo lường được và lợi ích phát triển chuyên môn.

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.