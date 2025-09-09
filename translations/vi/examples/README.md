<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T22:13:10+00:00",
  "source_file": "examples/README.md",
  "language_code": "vi"
}
-->
# Ví dụ - Mẫu và Cấu hình AZD Thực Tiễn

## Giới thiệu

Thư mục này chứa các ví dụ thực tiễn, mẫu, và tình huống thực tế để giúp bạn học Azure Developer CLI thông qua thực hành. Mỗi ví dụ cung cấp mã hoạt động hoàn chỉnh, mẫu hạ tầng, và hướng dẫn chi tiết cho các kiến trúc ứng dụng và mô hình triển khai khác nhau.

## Mục tiêu học tập

Khi làm việc qua các ví dụ này, bạn sẽ:
- Thực hành quy trình làm việc của Azure Developer CLI với các tình huống ứng dụng thực tế
- Hiểu các kiến trúc ứng dụng khác nhau và cách triển khai chúng với azd
- Thành thạo các mô hình Infrastructure as Code cho nhiều dịch vụ Azure
- Áp dụng quản lý cấu hình và chiến lược triển khai theo môi trường cụ thể
- Thực hiện các mô hình giám sát, bảo mật, và mở rộng trong các ngữ cảnh thực tế
- Xây dựng kinh nghiệm với việc khắc phục sự cố và gỡ lỗi các tình huống triển khai thực tế

## Kết quả học tập

Sau khi hoàn thành các ví dụ này, bạn sẽ có thể:
- Triển khai các loại ứng dụng khác nhau bằng Azure Developer CLI một cách tự tin
- Tùy chỉnh các mẫu được cung cấp theo yêu cầu ứng dụng của bạn
- Thiết kế và triển khai các mô hình hạ tầng tùy chỉnh bằng Bicep
- Cấu hình các ứng dụng đa dịch vụ phức tạp với các phụ thuộc phù hợp
- Áp dụng các thực tiễn tốt nhất về bảo mật, giám sát, và hiệu suất trong các tình huống thực tế
- Khắc phục sự cố và tối ưu hóa triển khai dựa trên kinh nghiệm thực tế

## Cấu trúc thư mục

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Ví dụ Bắt Đầu Nhanh

### Dành cho Người Mới Bắt Đầu
1. **[Ứng dụng Web Đơn Giản](../../../examples/simple-web-app)** - Triển khai một ứng dụng web Node.js cơ bản
2. **[Website Tĩnh](../../../examples/static-website)** - Lưu trữ một website tĩnh trên Azure Storage
3. **[Ứng dụng Container](../../../examples/container-app)** - Triển khai một ứng dụng container hóa

### Dành cho Người Dùng Trung Cấp
4. **[Ứng dụng Cơ Sở Dữ Liệu](../../../examples/database-app)** - Ứng dụng web với cơ sở dữ liệu PostgreSQL
5. **[Hàm Serverless](../../../examples/serverless-function)** - Azure Functions với các trigger HTTP
6. **[Microservices](../../../examples/microservices)** - Ứng dụng đa dịch vụ với API gateway

## 📋 Hướng dẫn sử dụng

### Chạy các ví dụ trên máy cục bộ

1. **Clone hoặc Sao chép Ví dụ**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Khởi tạo Môi trường AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Cấu hình Môi trường**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Triển khai**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Tùy chỉnh Ví dụ

Mỗi ví dụ bao gồm:
- **README.md** - Hướng dẫn chi tiết về thiết lập và tùy chỉnh
- **azure.yaml** - Cấu hình AZD với các chú thích
- **infra/** - Mẫu Bicep với giải thích tham số
- **src/** - Mã ứng dụng mẫu
- **scripts/** - Các script hỗ trợ cho các tác vụ thông thường

## 🎯 Mục tiêu học tập

### Danh mục Ví dụ

#### **Triển khai Cơ Bản**
- Ứng dụng đơn dịch vụ
- Mô hình hạ tầng đơn giản
- Quản lý cấu hình cơ bản
- Thiết lập phát triển tiết kiệm chi phí

#### **Tình huống Nâng Cao**
- Kiến trúc đa dịch vụ
- Cấu hình mạng phức tạp
- Mô hình tích hợp cơ sở dữ liệu
- Triển khai bảo mật và tuân thủ

#### **Mô hình Sẵn Sàng Sản Xuất**
- Cấu hình độ khả dụng cao
- Giám sát và quan sát
- Tích hợp CI/CD
- Thiết lập khôi phục thảm họa

## 📖 Mô tả Ví dụ

### Ứng dụng Web Đơn Giản
**Công nghệ**: Node.js, App Service, Application Insights  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Triển khai cơ bản, biến môi trường, kiểm tra sức khỏe

### Website Tĩnh
**Công nghệ**: HTML/CSS/JS, Storage Account, CDN  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Lưu trữ tĩnh, tích hợp CDN, tên miền tùy chỉnh

### Ứng dụng Container
**Công nghệ**: Docker, Container Apps, Container Registry  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Container hóa, mở rộng, cấu hình ingress

### Ứng dụng Cơ Sở Dữ Liệu
**Công nghệ**: Python Flask, PostgreSQL, App Service  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Kết nối cơ sở dữ liệu, quản lý bí mật, di chuyển dữ liệu

### Hàm Serverless
**Công nghệ**: Azure Functions, Cosmos DB, API Management  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Kiến trúc dựa trên sự kiện, bindings, quản lý API

### Microservices
**Công nghệ**: Nhiều dịch vụ, Service Bus, API Gateway  
**Độ phức tạp**: Nâng cao  
**Khái niệm**: Giao tiếp dịch vụ, hàng đợi tin nhắn, cân bằng tải

## 🛠 Ví dụ Cấu hình

Thư mục `configurations/` chứa các thành phần có thể tái sử dụng:

### Cấu hình Môi trường
- Cài đặt môi trường phát triển
- Cấu hình môi trường staging
- Cấu hình sẵn sàng sản xuất
- Thiết lập triển khai đa vùng

### Module Bicep
- Thành phần hạ tầng có thể tái sử dụng
- Mô hình tài nguyên thông thường
- Mẫu bảo mật cao
- Cấu hình tối ưu chi phí

### Script Hỗ Trợ
- Tự động hóa thiết lập môi trường
- Script di chuyển cơ sở dữ liệu
- Công cụ xác thực triển khai
- Tiện ích giám sát chi phí

## 🔧 Hướng dẫn Tùy chỉnh

### Tùy chỉnh Ví dụ cho Trường Hợp Sử Dụng của Bạn

1. **Xem lại Yêu cầu**
   - Kiểm tra yêu cầu dịch vụ Azure
   - Xác minh giới hạn đăng ký
   - Hiểu các tác động chi phí

2. **Chỉnh sửa Cấu hình**
   - Cập nhật định nghĩa dịch vụ trong `azure.yaml`
   - Tùy chỉnh mẫu Bicep
   - Điều chỉnh biến môi trường

3. **Kiểm tra Kỹ Lưỡng**
   - Triển khai vào môi trường phát triển trước
   - Xác thực chức năng
   - Kiểm tra khả năng mở rộng và hiệu suất

4. **Xem lại Bảo mật**
   - Xem lại kiểm soát truy cập
   - Thực hiện quản lý bí mật
   - Kích hoạt giám sát và cảnh báo

## 📊 Ma trận So sánh

| Ví dụ | Dịch vụ | Cơ sở dữ liệu | Xác thực | Giám sát | Độ phức tạp |
|-------|---------|--------------|----------|----------|-------------|
| Ứng dụng Web Đơn Giản | 1 | ❌ | Cơ bản | Cơ bản | ⭐ |
| Website Tĩnh | 1 | ❌ | ❌ | Cơ bản | ⭐ |
| Ứng dụng Container | 1 | ❌ | Cơ bản | Đầy đủ | ⭐⭐ |
| Ứng dụng Cơ Sở Dữ Liệu | 2 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐⭐ |
| Hàm Serverless | 3 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | Đầy đủ | Đầy đủ | ⭐⭐⭐⭐ |

## 🎓 Lộ trình học tập

### Tiến trình Khuyến nghị

1. **Bắt đầu với Ứng dụng Web Đơn Giản**
   - Học các khái niệm cơ bản về AZD
   - Hiểu quy trình triển khai
   - Thực hành quản lý môi trường

2. **Thử Website Tĩnh**
   - Khám phá các tùy chọn lưu trữ khác nhau
   - Tìm hiểu về tích hợp CDN
   - Hiểu cấu hình DNS

3. **Chuyển sang Ứng dụng Container**
   - Học các khái niệm cơ bản về container hóa
   - Hiểu các khái niệm mở rộng
   - Thực hành với Docker

4. **Thêm Tích hợp Cơ Sở Dữ Liệu**
   - Học cách cung cấp cơ sở dữ liệu
   - Hiểu chuỗi kết nối
   - Thực hành quản lý bí mật

5. **Khám phá Serverless**
   - Hiểu kiến trúc dựa trên sự kiện
   - Tìm hiểu về trigger và bindings
   - Thực hành với API

6. **Xây dựng Microservices**
   - Học giao tiếp dịch vụ
   - Hiểu hệ thống phân tán
   - Thực hành triển khai phức tạp

## 🔍 Tìm Ví dụ Phù Hợp

### Theo Công Nghệ
- **Node.js**: Ứng dụng Web Đơn Giản, Microservices
- **Python**: Ứng dụng Cơ Sở Dữ Liệu, Hàm Serverless
- **Website Tĩnh**: Website Tĩnh
- **Container**: Ứng dụng Container, Microservices
- **Cơ Sở Dữ Liệu**: Ứng dụng Cơ Sở Dữ Liệu, Hàm Serverless

### Theo Mô Hình Kiến Trúc
- **Monolithic**: Ứng dụng Web Đơn Giản, Ứng dụng Cơ Sở Dữ Liệu
- **Tĩnh**: Website Tĩnh
- **Microservices**: Ví dụ Microservices
- **Serverless**: Hàm Serverless
- **Hybrid**: Ứng dụng Container

### Theo Mức Độ Phức Tạp
- **Người mới bắt đầu**: Ứng dụng Web Đơn Giản, Website Tĩnh
- **Trung cấp**: Ứng dụng Container, Ứng dụng Cơ Sở Dữ Liệu, Hàm Serverless  
- **Nâng cao**: Microservices

## 📚 Tài nguyên bổ sung

### Liên kết Tài liệu
- [Đặc tả Mẫu AZD](https://aka.ms/azd/templates)
- [Tài liệu Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Ví dụ Cộng đồng
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Thư viện Mẫu AZD](https://azure.github.io/awesome-azd/)

### Thực tiễn tốt nhất
- [Khung Kiến trúc Tốt Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Khung Chấp nhận Đám mây](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Đóng góp Ví dụ

Có ví dụ hữu ích để chia sẻ? Chúng tôi hoan nghênh đóng góp!

### Hướng dẫn Gửi
1. Tuân theo cấu trúc thư mục đã thiết lập
2. Bao gồm README.md toàn diện
3. Thêm chú thích vào các tệp cấu hình
4. Kiểm tra kỹ lưỡng trước khi gửi
5. Bao gồm ước tính chi phí và yêu cầu

### Cấu trúc Mẫu Ví dụ
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Mẹo chuyên nghiệp**: Bắt đầu với ví dụ đơn giản nhất phù hợp với công nghệ của bạn, sau đó dần dần tiến lên các tình huống phức tạp hơn. Mỗi ví dụ xây dựng trên các khái niệm từ ví dụ trước!

**Bước tiếp theo**: 
- Chọn một ví dụ phù hợp với trình độ của bạn
- Làm theo hướng dẫn thiết lập trong README của ví dụ
- Thử nghiệm với các tùy chỉnh
- Chia sẻ những gì bạn học được với cộng đồng

---

**Điều hướng**
- **Bài học trước**: [Hướng dẫn học tập](../resources/study-guide.md)
- **Quay lại**: [README chính](../README.md)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp từ con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.