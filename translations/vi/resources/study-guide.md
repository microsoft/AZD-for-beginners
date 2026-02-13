# Hướng Dẫn Học - Mục Tiêu Học Tập Toàn Diện

**Điều Hướng Lộ Trình Học Tập**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../README.md)
- **📖 Bắt Đầu Học**: [Chương 1: Nền Tảng & Bắt Đầu Nhanh](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Theo Dõi Tiến Độ**: [Hoàn Thành Khóa Học](../README.md#-course-completion--certification)

## Giới Thiệu

Hướng dẫn học toàn diện này cung cấp các mục tiêu học tập có cấu trúc, các khái niệm chính, bài tập thực hành và tài liệu đánh giá để giúp bạn làm chủ Azure Developer CLI (azd). Sử dụng hướng dẫn này để theo dõi tiến độ của bạn và đảm bảo bạn đã bao quát tất cả các chủ đề thiết yếu.

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

## Cấu Trúc Học Tập 8 Chương

### Chương 1: Nền Tảng & Bắt Đầu Nhanh (Tuần 1)
**Thời Lượng**: 30-45 phút | **Độ Phức Tạp**: ⭐

#### Mục Tiêu Học Tập
- Hiểu các khái niệm cốt lõi và thuật ngữ của Azure Developer CLI
- Cài đặt và cấu hình AZD thành công trên nền tảng phát triển của bạn
- Triển khai ứng dụng đầu tiên của bạn bằng một mẫu có sẵn
- Điều hướng giao diện dòng lệnh AZD một cách hiệu quả

#### Các Khái Niệm Chính Cần Làm Chủ
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
- Làm thế nào để khởi tạo một dự án mới từ một mẫu?
- Sự khác biệt giữa `azd up` và `azd deploy` là gì?
- Làm thế nào để quản lý nhiều môi trường với AZD?

---

### Chương 2: Phát Triển Ưu Tiên AI (Tuần 2)
**Thời Lượng**: 1-2 giờ | **Độ Phức Tạp**: ⭐⭐

#### Mục Tiêu Học Tập
- Tích hợp các dịch vụ Microsoft Foundry với quy trình làm việc AZD
- Triển khai và cấu hình các ứng dụng hỗ trợ AI
- Hiểu các mẫu triển khai RAG (Retrieval-Augmented Generation)
- Quản lý triển khai mô hình AI và khả năng mở rộng

#### Các Khái Niệm Chính Cần Làm Chủ
- Tích hợp dịch vụ Azure OpenAI và quản lý API
- Cấu hình tìm kiếm AI và lập chỉ mục vector
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
- Làm chủ các chiến lược cấu hình và quản lý môi trường
- Triển khai các mẫu xác thực an toàn và danh tính được quản lý
- Tổ chức tài nguyên với các quy ước đặt tên phù hợp
- Cấu hình triển khai đa môi trường (dev, staging, prod)

#### Các Khái Niệm Chính Cần Làm Chủ
- Thứ bậc môi trường và ưu tiên cấu hình
- Xác thực danh tính được quản lý và dịch vụ chính
- Tích hợp Key Vault để quản lý bí mật
- Quản lý tham số cụ thể cho từng môi trường

#### Bài Tập Thực Hành
1. **Cài Đặt Đa Môi Trường**: Cấu hình môi trường dev, staging và prod
2. **Cấu Hình Bảo Mật**: Triển khai xác thực danh tính được quản lý
3. **Quản Lý Bí Mật**: Tích hợp Azure Key Vault cho dữ liệu nhạy cảm
4. **Quản Lý Tham Số**: Tạo cấu hình cụ thể cho từng môi trường

#### Câu Hỏi Đánh Giá
- Làm thế nào để cấu hình các môi trường khác nhau với AZD?
- Lợi ích của việc sử dụng danh tính được quản lý thay vì dịch vụ chính là gì?
- Làm thế nào để quản lý bí mật ứng dụng một cách an toàn?
- Thứ bậc cấu hình trong AZD là gì?

---

### Chương 4: Hạ Tầng dưới dạng Mã & Triển Khai (Tuần 4-5)
**Thời Lượng**: 1-1.5 giờ | **Độ Phức Tạp**: ⭐⭐⭐

#### Mục Tiêu Học Tập
- Tạo và tùy chỉnh mẫu hạ tầng Bicep
- Triển khai các mẫu triển khai nâng cao và quy trình làm việc
- Hiểu các chiến lược cung cấp tài nguyên
- Thiết kế kiến trúc đa dịch vụ có khả năng mở rộng

- Triển khai ứng dụng container hóa bằng Azure Container Apps và AZD

#### Các Khái Niệm Chính Cần Làm Chủ
- Cấu trúc mẫu Bicep và các thực hành tốt nhất
- Phụ thuộc tài nguyên và thứ tự triển khai
- Tệp tham số và tính mô đun của mẫu
- Các hook tùy chỉnh và tự động hóa triển khai
- Các mẫu triển khai ứng dụng container (bắt đầu nhanh, sản xuất, microservices)

#### Bài Tập Thực Hành
1. **Tạo Mẫu Tùy Chỉnh**: Xây dựng mẫu ứng dụng đa dịch vụ
2. **Làm Chủ Bicep**: Tạo các thành phần hạ tầng mô đun, có thể tái sử dụng
3. **Tự Động Hóa Triển Khai**: Triển khai các hook trước/sau triển khai
4. **Thiết Kế Kiến Trúc**: Triển khai kiến trúc microservices phức tạp
5. **Triển Khai Ứng Dụng Container**: Triển khai các ví dụ [Simple Flask API](../../../examples/container-app/simple-flask-api) và [Microservices Architecture](../../../examples/container-app/microservices) bằng AZD

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
- Tích hợp microservices container hóa như một phần của giải pháp đa tác nhân

#### Các Khái Niệm Chính Cần Làm Chủ
- Các mẫu kiến trúc đa tác nhân và nguyên tắc thiết kế
- Các giao thức giao tiếp giữa các tác nhân và luồng dữ liệu
- Chiến lược cân bằng tải và mở rộng cho các tác nhân AI
- Giám sát sản xuất cho hệ thống đa tác nhân
- Giao tiếp giữa các dịch vụ trong môi trường container hóa

#### Bài Tập Thực Hành
1. **Triển Khai Giải Pháp Bán Lẻ**: Triển khai kịch bản bán lẻ đa tác nhân hoàn chỉnh
2. **Tùy Chỉnh Tác Nhân**: Sửa đổi hành vi của tác nhân Khách Hàng và Kho Hàng
3. **Mở Rộng Kiến Trúc**: Triển khai cân bằng tải và tự động mở rộng
4. **Giám Sát Sản Xuất**: Thiết lập giám sát và cảnh báo toàn diện
5. **Tích Hợp Microservices**: Mở rộng ví dụ [Microservices Architecture](../../../examples/container-app/microservices) để hỗ trợ quy trình làm việc dựa trên tác nhân

#### Câu Hỏi Đánh Giá
- Làm thế nào để thiết kế các mẫu giao tiếp đa tác nhân hiệu quả?
- Các cân nhắc chính để mở rộng khối lượng công việc của tác nhân AI là gì?
- Làm thế nào để giám sát và gỡ lỗi hệ thống AI đa tác nhân?
- Các mẫu sản xuất nào đảm bảo độ tin cậy cho các tác nhân AI?

---

### Chương 6: Xác Thực & Lập Kế Hoạch Trước Triển Khai (Tuần 8)
**Thời Lượng**: 1 giờ | **Độ Phức Tạp**: ⭐⭐

#### Mục Tiêu Học Tập
- Thực hiện lập kế hoạch năng lực toàn diện và xác thực tài nguyên
- Chọn các SKU Azure tối ưu để tiết kiệm chi phí
- Triển khai kiểm tra và xác thực tự động trước khi triển khai
- Lập kế hoạch triển khai với các chiến lược tối ưu hóa chi phí

#### Các Khái Niệm Chính Cần Làm Chủ
- Hạn ngạch tài nguyên Azure và giới hạn năng lực
- Tiêu chí chọn SKU và tối ưu hóa chi phí
- Tập lệnh xác thực tự động và kiểm tra
- Lập kế hoạch triển khai và đánh giá rủi ro

#### Bài Tập Thực Hành
1. **Phân Tích Năng Lực**: Phân tích yêu cầu tài nguyên cho ứng dụng của bạn
2. **Tối Ưu Hóa SKU**: So sánh và chọn các cấp dịch vụ tiết kiệm chi phí
3. **Tự Động Hóa Xác Thực**: Triển khai tập lệnh kiểm tra trước triển khai
4. **Lập Kế Hoạch Chi Phí**: Tạo ước tính chi phí triển khai và ngân sách

#### Câu Hỏi Đánh Giá
- Làm thế nào để xác thực năng lực Azure trước khi triển khai?
- Các yếu tố nào ảnh hưởng đến quyết định chọn SKU?
- Làm thế nào để tự động hóa xác thực trước triển khai?
- Các chiến lược nào giúp tối ưu hóa chi phí triển khai?

---

### Chương 7: Khắc Phục Sự Cố & Gỡ Lỗi (Tuần 9)
**Thời Lượng**: 1-1.5 giờ | **Độ Phức Tạp**: ⭐⭐

#### Mục Tiêu Học Tập
- Phát triển các phương pháp tiếp cận gỡ lỗi có hệ thống cho triển khai AZD
- Giải quyết các vấn đề triển khai và cấu hình phổ biến
- Gỡ lỗi các vấn đề cụ thể về AI và hiệu suất
- Triển khai giám sát và cảnh báo để phát hiện vấn đề chủ động

#### Các Khái Niệm Chính Cần Làm Chủ
- Kỹ thuật chẩn đoán và chiến lược ghi nhật ký
- Các mẫu lỗi phổ biến và giải pháp của chúng
- Giám sát hiệu suất và tối ưu hóa
- Quy trình phản ứng và khôi phục sự cố

#### Bài Tập Thực Hành
1. **Kỹ Năng Chẩn Đoán**: Thực hành với các triển khai bị lỗi có chủ ý
2. **Phân Tích Nhật Ký**: Sử dụng Azure Monitor và Application Insights hiệu quả
3. **Tối Ưu Hóa Hiệu Suất**: Tối ưu hóa các ứng dụng hoạt động chậm
4. **Quy Trình Khôi Phục**: Triển khai sao lưu và khôi phục thảm họa

#### Câu Hỏi Đánh Giá
- Các lỗi triển khai AZD phổ biến nhất là gì?
- Làm thế nào để gỡ lỗi các vấn đề xác thực và quyền?
- Các chiến lược giám sát nào giúp ngăn ngừa vấn đề sản xuất?
- Làm thế nào để tối ưu hóa hiệu suất ứng dụng trong Azure?

---

### Chương 8: Mẫu Sản Xuất & Doanh Nghiệp (Tuần 10-11)
**Thời Lượng**: 2-3 giờ | **Độ Phức Tạp**: ⭐⭐⭐⭐

#### Mục Tiêu Học Tập
- Triển khai các chiến lược triển khai cấp doanh nghiệp
- Thiết kế các mẫu bảo mật và khung tuân thủ
- Thiết lập giám sát, quản trị và quản lý chi phí
- Tạo các pipeline CI/CD có khả năng mở rộng với tích hợp AZD
- Áp dụng các thực hành tốt nhất cho triển khai ứng dụng container sản xuất (bảo mật, giám sát, chi phí, CI/CD)

#### Các Khái Niệm Chính Cần Làm Chủ
- Yêu cầu bảo mật và tuân thủ cấp doanh nghiệp
- Khung quản trị và triển khai chính sách
- Giám sát nâng cao và quản lý chi phí
- Tích hợp CI/CD và các pipeline triển khai tự động
- Chiến lược triển khai blue-green và canary cho khối lượng công việc container hóa

#### Bài Tập Thực Hành
1. **Bảo Mật Doanh Nghiệp**: Triển khai các mẫu bảo mật toàn diện
2. **Khung Quản Trị**: Thiết lập Azure Policy và quản lý tài nguyên
3. **Giám Sát Nâng Cao**: Tạo bảng điều khiển và cảnh báo tự động
4. **Tích Hợp CI/CD**: Xây dựng các pipeline triển khai tự động
5. **Ứng Dụng Container Sản Xuất**: Áp dụng bảo mật, giám sát và tối ưu hóa chi phí cho ví dụ [Microservices Architecture](../../../examples/container-app/microservices)

#### Câu Hỏi Đánh Giá
- Làm thế nào để triển khai bảo mật cấp doanh nghiệp trong các triển khai AZD?
- Các mẫu quản trị nào đảm bảo tuân thủ và kiểm soát chi phí?
- Làm thế nào để thiết kế giám sát có khả năng mở rộng cho hệ thống sản xuất?
- Các mẫu CI/CD nào hoạt động tốt nhất với quy trình làm việc AZD?

#### Mục Tiêu Học Tập
- Hiểu các khái niệm cơ bản và cốt lõi của Azure Developer CLI
- Cài đặt và cấu hình azd thành công trên môi trường phát triển của bạn
- Hoàn thành triển khai đầu tiên của bạn bằng một mẫu có sẵn
- Điều hướng cấu trúc dự án azd và hiểu các thành phần chính

#### Các Khái Niệm Chính Cần Làm Chủ
- Mẫu, môi trường và dịch vụ
- Cấu trúc cấu hình azure.yaml
- Các lệnh cơ bản của azd (init, up, down, deploy)
- Nguyên tắc Hạ Tầng dưới dạng Mã
- Xác thực và ủy quyền Azure

#### Bài Tập Thực Hành

**Bài Tập 1.1: Cài Đặt và Cấu Hình**
```bash
# Hoàn thành các nhiệm vụ này:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Bài Tập 1.2: Triển Khai Đầu Tiên**
```bash
# Triển khai một ứng dụng web đơn giản:
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
3. Các môi trường giúp quản lý các mục tiêu triển khai
5. Những yếu tố cần cân nhắc khi triển khai đa vùng?

### Module 4: Xác thực trước triển khai (Tuần 5)

#### Mục tiêu học tập
- Thực hiện kiểm tra toàn diện trước triển khai
- Nắm vững kế hoạch dung lượng và xác thực tài nguyên
- Hiểu cách chọn SKU và tối ưu hóa chi phí
- Xây dựng các pipeline xác thực tự động

#### Các khái niệm cần nắm vững
- Hạn mức và giới hạn tài nguyên Azure
- Tiêu chí chọn SKU và tác động chi phí
- Các script và công cụ xác thực tự động
- Phương pháp lập kế hoạch dung lượng
- Kiểm tra hiệu suất và tối ưu hóa

#### Bài tập thực hành

**Bài tập 4.1: Lập kế hoạch dung lượng**
```bash
# Thực hiện xác minh dung lượng:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Bài tập 4.2: Xác thực trước triển khai**
```powershell
# Xây dựng quy trình xác thực toàn diện:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Bài tập 4.3: Tối ưu hóa SKU**
```bash
# Tối ưu hóa cấu hình dịch vụ:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Câu hỏi tự đánh giá
1. Những yếu tố nào nên ảnh hưởng đến quyết định chọn SKU?
2. Làm thế nào để xác thực tính khả dụng của tài nguyên Azure trước khi triển khai?
3. Các thành phần chính của hệ thống kiểm tra trước triển khai là gì?
4. Làm thế nào để ước tính và kiểm soát chi phí triển khai?
5. Những yếu tố giám sát nào là cần thiết cho việc lập kế hoạch dung lượng?

### Module 5: Xử lý sự cố và gỡ lỗi (Tuần 6)

#### Mục tiêu học tập
- Nắm vững các phương pháp xử lý sự cố có hệ thống
- Phát triển kỹ năng gỡ lỗi các vấn đề triển khai phức tạp
- Thực hiện giám sát và cảnh báo toàn diện
- Xây dựng quy trình phản ứng và phục hồi sự cố

#### Các khái niệm cần nắm vững
- Các mẫu lỗi triển khai phổ biến
- Kỹ thuật phân tích và liên kết nhật ký
- Giám sát hiệu suất và tối ưu hóa
- Phát hiện và phản ứng với sự cố bảo mật
- Phục hồi thảm họa và liên tục kinh doanh

#### Bài tập thực hành

**Bài tập 5.1: Kịch bản xử lý sự cố**
```bash
# Thực hành giải quyết các vấn đề phổ biến:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Bài tập 5.2: Thực hiện giám sát**
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
# Xây dựng quy trình phản hồi sự cố:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Câu hỏi tự đánh giá
1. Phương pháp tiếp cận có hệ thống để xử lý sự cố triển khai azd là gì?
2. Làm thế nào để liên kết nhật ký giữa nhiều dịch vụ và tài nguyên?
3. Những chỉ số giám sát nào là quan trọng nhất để phát hiện sớm vấn đề?
4. Làm thế nào để thực hiện các quy trình phục hồi thảm họa hiệu quả?
5. Các thành phần chính của kế hoạch phản ứng sự cố là gì?

### Module 6: Chủ đề nâng cao và thực tiễn tốt nhất (Tuần 7-8)

#### Mục tiêu học tập
- Thực hiện các mẫu triển khai cấp doanh nghiệp
- Nắm vững tích hợp và tự động hóa CI/CD
- Phát triển các mẫu tùy chỉnh và đóng góp cho cộng đồng
- Hiểu các yêu cầu bảo mật và tuân thủ nâng cao

#### Các khái niệm cần nắm vững
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
# Tạo và xuất bản các mẫu tùy chỉnh:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Bài tập 6.3: Triển khai cấp doanh nghiệp**
```bash
# Triển khai các tính năng cấp doanh nghiệp:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Câu hỏi tự đánh giá
1. Làm thế nào để tích hợp azd vào các workflow CI/CD hiện có?
2. Những yếu tố cần cân nhắc khi phát triển mẫu tùy chỉnh là gì?
3. Làm thế nào để thực hiện quản trị và tuân thủ trong các triển khai azd?
4. Những thực tiễn tốt nhất cho các triển khai quy mô doanh nghiệp là gì?
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

**Kết quả cần đạt được**:
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

**Kết quả cần đạt được**:
- Ứng dụng hoàn chỉnh với xác thực người dùng
- Schema cơ sở dữ liệu và script migration
- Dashboard giám sát và quy tắc cảnh báo
- Cấu hình triển khai đa môi trường

### Dự án 3: Nền tảng Thương mại Điện tử Microservices
**Độ phức tạp**: Nâng cao  
**Thời gian**: 4-6 tuần

Thiết kế và triển khai một nền tảng thương mại điện tử dựa trên microservices:
- Nhiều dịch vụ API (catalog, orders, payments, users)
- Tích hợp hàng đợi tin nhắn với Service Bus
- Bộ nhớ đệm Redis để tối ưu hóa hiệu suất
- Nhật ký và giám sát toàn diện

**Ví dụ tham khảo**: Xem [Kiến trúc Microservices](../../../examples/container-app/microservices) để biết mẫu sẵn sàng sản xuất và hướng dẫn triển khai

**Kết quả cần đạt được**:
- Kiến trúc microservices hoàn chỉnh
- Các mẫu giao tiếp giữa các dịch vụ
- Kiểm tra hiệu suất và tối ưu hóa
- Thực hiện bảo mật sẵn sàng sản xuất

## Đánh giá và Chứng nhận

### Kiểm tra kiến thức

Hoàn thành các bài kiểm tra sau mỗi module:

**Đánh giá Module 1**: Các khái niệm cơ bản và cài đặt
- Câu hỏi trắc nghiệm về các khái niệm cốt lõi
- Nhiệm vụ cài đặt và cấu hình thực tế
- Bài tập triển khai đơn giản

**Đánh giá Module 2**: Cấu hình và môi trường
- Các kịch bản quản lý môi trường
- Bài tập xử lý sự cố cấu hình
- Thực hiện cấu hình bảo mật

**Đánh giá Module 3**: Triển khai và cung cấp tài nguyên
- Thách thức thiết kế hạ tầng
- Các kịch bản triển khai nhiều dịch vụ
- Bài tập tối ưu hóa hiệu suất

**Đánh giá Module 4**: Xác thực trước triển khai
- Nghiên cứu trường hợp lập kế hoạch dung lượng
- Các kịch bản tối ưu hóa chi phí
- Thực hiện pipeline xác thực

**Đánh giá Module 5**: Xử lý sự cố và gỡ lỗi
- Bài tập chẩn đoán vấn đề
- Nhiệm vụ thực hiện giám sát
- Mô phỏng phản ứng sự cố

**Đánh giá Module 6**: Chủ đề nâng cao
- Thiết kế pipeline CI/CD
- Phát triển mẫu tùy chỉnh
- Các kịch bản kiến trúc cấp doanh nghiệp

### Dự án Capstone Cuối cùng

Thiết kế và triển khai một giải pháp hoàn chỉnh thể hiện sự nắm vững tất cả các khái niệm:

**Yêu cầu**:
- Kiến trúc ứng dụng nhiều tầng
- Nhiều môi trường triển khai
- Giám sát và cảnh báo toàn diện
- Thực hiện bảo mật và tuân thủ
- Tối ưu hóa chi phí và hiệu suất
- Tài liệu và runbook hoàn chỉnh

**Tiêu chí đánh giá**:
- Chất lượng thực hiện kỹ thuật
- Độ hoàn chỉnh của tài liệu
- Tuân thủ bảo mật và thực tiễn tốt nhất
- Tối ưu hóa hiệu suất và chi phí
- Hiệu quả xử lý sự cố và giám sát

## Tài liệu học tập và tham khảo

### Tài liệu chính thức
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Tài liệu Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Tài nguyên cộng đồng
- [Thư viện mẫu AZD](https://azure.github.io/awesome-azd/)
- [Tổ chức GitHub Azure-Samples](https://github.com/Azure-Samples)
- [Kho GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)

### Môi trường thực hành
- [Tài khoản miễn phí Azure](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Công cụ bổ sung
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Gói mở rộng công cụ Azure](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Khuyến nghị lịch học

### Học toàn thời gian (8 tuần)
- **Tuần 1-2**: Module 1-2 (Bắt đầu, Cấu hình)
- **Tuần 3-4**: Module 3-4 (Triển khai, Xác thực trước triển khai)
- **Tuần 5-6**: Module 5-6 (Xử lý sự cố, Chủ đề nâng cao)
- **Tuần 7-8**: Dự án thực hành và đánh giá cuối cùng

### Học bán thời gian (16 tuần)
- **Tuần 1-4**: Module 1 (Bắt đầu)
- **Tuần 5-7**: Module 2 (Cấu hình và môi trường)
- **Tuần 8-10**: Module 3 (Triển khai và cung cấp tài nguyên)
- **Tuần 11-12**: Module 4 (Xác thực trước triển khai)
- **Tuần 13-14**: Module 5 (Xử lý sự cố và gỡ lỗi)
- **Tuần 15-16**: Module 6 (Chủ đề nâng cao và đánh giá)

---

## Theo dõi tiến độ và khung đánh giá

### Danh sách kiểm tra hoàn thành chương

Theo dõi tiến độ của bạn qua từng chương với các kết quả có thể đo lường:

#### 📚 Chương 1: Nền tảng & Bắt đầu nhanh
- [ ] **Hoàn tất cài đặt**: AZD được cài đặt và xác minh trên nền tảng của bạn
- [ ] **Triển khai đầu tiên**: Triển khai thành công mẫu todo-nodejs-mongo
- [ ] **Cài đặt môi trường**: Cấu hình biến môi trường đầu tiên
- [ ] **Điều hướng tài nguyên**: Khám phá tài nguyên đã triển khai trong Azure Portal
- [ ] **Thành thạo lệnh**: Thoải mái với các lệnh cơ bản của AZD

#### 🤖 Chương 2: Phát triển AI-First  
- [ ] **Triển khai mẫu AI**: Triển khai thành công azure-search-openai-demo
- [ ] **Thực hiện RAG**: Cấu hình lập chỉ mục và truy xuất tài liệu
- [ ] **Cấu hình mô hình**: Thiết lập nhiều mô hình AI với các mục đích khác nhau
- [ ] **Giám sát AI**: Thực hiện Application Insights cho các workload AI
- [ ] **Tối ưu hóa hiệu suất**: Tinh chỉnh hiệu suất ứng dụng AI

#### ⚙️ Chương 3: Cấu hình & Xác thực
- [ ] **Cài đặt đa môi trường**: Cấu hình môi trường dev, staging và prod
- [ ] **Thực hiện bảo mật**: Thiết lập xác thực danh tính được quản lý
- [ ] **Quản lý bí mật**: Tích hợp Azure Key Vault cho dữ liệu nhạy cảm
- [ ] **Quản lý tham số**: Tạo cấu hình cụ thể cho từng môi trường
- [ ] **Thành thạo xác thực**: Thực hiện các mẫu truy cập an toàn

#### 🏗️ Chương 4: Hạ tầng dưới dạng mã & Triển khai
- [ ] **Tạo mẫu tùy chỉnh**: Xây dựng mẫu ứng dụng nhiều dịch vụ
- [ ] **Thành thạo Bicep**: Tạo các thành phần hạ tầng có thể tái sử dụng
- [ ] **Tự động hóa triển khai**: Thực hiện các hook trước/sau triển khai
- [ ] **Thiết kế kiến trúc**: Triển khai kiến trúc microservices phức tạp
- [ ] **Tối ưu hóa mẫu**: Tối ưu hóa mẫu cho hiệu suất và chi phí

#### 🎯 Chương 5: Giải pháp AI Đa-Agent
- [ ] **Triển khai giải pháp bán lẻ**: Triển khai hoàn chỉnh kịch bản bán lẻ đa-agent
- [ ] **Tùy chỉnh agent**: Sửa đổi hành vi của agent Khách hàng và Kho hàng
- [ ] **Mở rộng kiến trúc**: Thực hiện cân bằng tải và tự động mở rộng
- [ ] **Giám sát sản xuất**: Thiết lập giám sát và cảnh báo toàn diện
- [ ] **Tinh chỉnh hiệu suất**: Tối ưu hóa hiệu suất hệ thống đa-agent

#### 🔍 Chương 6: Xác thực trước triển khai & Lập kế hoạch
- [ ] **Phân tích dung lượng**: Phân tích yêu cầu tài nguyên cho ứng dụng
- [ ] **Tối ưu hóa SKU**: Chọn các cấp dịch vụ hiệu quả về chi phí
- [ ] **Tự động hóa xác thực**: Thực hiện các script kiểm tra trước triển khai
- [ ] **Lập kế hoạch chi phí**: Tạo ước tính chi phí triển khai và ngân sách
- [ ] **Đánh giá rủi ro**: Xác định và giảm thiểu rủi ro triển khai

#### 🚨 Chương 7: Xử lý sự cố & Gỡ lỗi
- [ ] **Kỹ năng chẩn đoán**: Gỡ lỗi thành công các triển khai bị lỗi có chủ ý
- [ ] **Phân tích nhật ký**: Sử dụng Azure Monitor và Application Insights hiệu quả
- [ ] **Tinh chỉnh hiệu suất**: Tối ưu hóa các ứng dụng hoạt động chậm
- [ ] **Quy trình phục hồi**: Thực hiện sao lưu và phục hồi thảm họa
- [ ] **Thiết lập giám sát**: Tạo giám sát và cảnh báo chủ động

#### 🏢 Chương 8: Mẫu sản xuất & Doanh nghiệp
- [ ] **Bảo mật doanh nghiệp**: Thực hiện các mẫu bảo mật toàn diện
- [ ] **Khung quản trị**: Thiết lập Azure Policy và quản lý tài nguyên
- [ ] **Giám sát nâng cao**: Tạo dashboard và cảnh báo tự động
- [ ] **Tích hợp CI/CD**: Xây dựng các pipeline triển khai tự động
- [ ] **Thực hiện tuân thủ**: Đáp ứng các yêu cầu tuân thủ cấp doanh nghiệp

### Lộ trình học tập và các cột mốc

#### Tuần 1-2: Xây dựng nền tảng
- **Cột mốc**: Triển khai ứng dụng AI đầu tiên bằng AZD
- **Xác thực**: Ứng dụng hoạt động được truy cập qua URL công khai
- **Kỹ năng**: Workflow cơ bản của AZD và tích hợp dịch vụ AI

#### Tuần 3-4: Thành thạo cấu hình
- **Cột mốc**: Triển khai đa môi trường với xác thực an toàn
- **Xác thực**: Cùng một ứng dụng được triển khai trên dev/staging/prod
- **Kỹ năng**: Quản lý môi trường và thực hiện bảo mật

#### Tuần 5-6: Chuyên môn về hạ tầng
- **Cột mốc**: Mẫu tùy chỉnh cho ứng dụng nhiều dịch vụ phức tạp
- **Xác thực**: Mẫu có thể tái sử dụng được triển khai bởi thành viên khác
- **Kỹ năng**: Thành thạo Bicep và tự động hóa hạ tầng

#### Tuần 7-8: Thực hiện AI nâng cao
- **Cột mốc**: Giải pháp AI đa-agent sẵn sàng sản xuất
- **Xác thực**: Hệ thống xử lý tải thực tế với giám sát
- **Kỹ năng**: Điều phối đa-agent và tối ưu hóa hiệu suất

#### Tuần 9-10: Sẵn sàng sản xuất
- **Cột mốc**: Triển khai cấp doanh nghiệp với đầy đủ tuân thủ
- **Xác thực**: Đạt yêu cầu đánh giá bảo mật và tối ưu hóa chi phí
- **Kỹ năng**: Quản trị, giám sát và tích hợp CI/CD

### Đánh giá và Chứng nhận

#### Phương pháp xác thực kiến thức
1. **Triển khai thực tế
5. **Đóng góp cộng đồng**: Chia sẻ mẫu hoặc cải tiến

#### Kết quả phát triển chuyên môn
- **Dự án danh mục**: 8 triển khai sẵn sàng sản xuất
- **Kỹ năng kỹ thuật**: Chuyên môn triển khai AZD và AI theo tiêu chuẩn ngành
- **Khả năng giải quyết vấn đề**: Tự xử lý sự cố và tối ưu hóa
- **Công nhận cộng đồng**: Tham gia tích cực vào cộng đồng nhà phát triển Azure
- **Thăng tiến sự nghiệp**: Kỹ năng áp dụng trực tiếp vào các vai trò về đám mây và AI

#### Chỉ số thành công
- **Tỷ lệ triển khai thành công**: >95% triển khai thành công
- **Thời gian xử lý sự cố**: <30 phút cho các vấn đề phổ biến
- **Tối ưu hóa hiệu suất**: Cải thiện rõ rệt về chi phí và hiệu suất
- **Tuân thủ bảo mật**: Tất cả các triển khai đều đáp ứng tiêu chuẩn bảo mật doanh nghiệp
- **Chuyển giao kiến thức**: Có khả năng hướng dẫn các nhà phát triển khác

### Học tập liên tục và tham gia cộng đồng

#### Cập nhật thường xuyên
- **Cập nhật Azure**: Theo dõi ghi chú phát hành Azure Developer CLI
- **Sự kiện cộng đồng**: Tham gia các sự kiện dành cho nhà phát triển Azure và AI
- **Tài liệu**: Đóng góp vào tài liệu và ví dụ của cộng đồng
- **Phản hồi**: Cung cấp phản hồi về nội dung khóa học và các dịch vụ Azure

#### Phát triển sự nghiệp
- **Mạng lưới chuyên nghiệp**: Kết nối với các chuyên gia Azure và AI
- **Cơ hội diễn thuyết**: Trình bày những gì đã học tại các hội nghị hoặc buổi gặp mặt
- **Đóng góp mã nguồn mở**: Đóng góp vào các mẫu và công cụ AZD
- **Hướng dẫn**: Dẫn dắt các nhà phát triển khác trong hành trình học AZD của họ

---

**Điều hướng chương:**
- **📚 Trang chủ khóa học**: [AZD For Beginners](../README.md)
- **📖 Bắt đầu học**: [Chương 1: Nền tảng & Bắt đầu nhanh](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Theo dõi tiến độ**: Theo dõi sự tiến bộ của bạn qua hệ thống học tập 8 chương toàn diện
- **🤝 Cộng đồng**: [Azure Discord](https://discord.gg/microsoft-azure) để nhận hỗ trợ và thảo luận

**Theo dõi tiến độ học tập**: Sử dụng hướng dẫn có cấu trúc này để thành thạo Azure Developer CLI thông qua việc học tập thực tế, tiến bộ và có thể đo lường được, cùng với các lợi ích phát triển chuyên môn.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->