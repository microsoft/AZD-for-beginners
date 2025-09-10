<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:19:01+00:00",
  "source_file": "examples/README.md",
  "language_code": "vi"
}
-->
# Ví dụ - Mẫu và Cấu hình AZD Thực tiễn

## Giới thiệu

Thư mục này chứa các ví dụ thực tiễn, mẫu và tình huống thực tế để giúp bạn học Azure Developer CLI thông qua thực hành. Mỗi ví dụ cung cấp mã hoạt động đầy đủ, mẫu hạ tầng và hướng dẫn chi tiết cho các kiến trúc ứng dụng và mô hình triển khai khác nhau.

## Mục tiêu học tập

Khi làm việc qua các ví dụ này, bạn sẽ:
- Thực hành quy trình làm việc của Azure Developer CLI với các tình huống ứng dụng thực tế
- Hiểu các kiến trúc ứng dụng khác nhau và cách triển khai chúng với azd
- Nắm vững các mô hình Infrastructure as Code cho các dịch vụ Azure khác nhau
- Áp dụng quản lý cấu hình và chiến lược triển khai theo môi trường cụ thể
- Triển khai các mô hình giám sát, bảo mật và mở rộng trong các ngữ cảnh thực tiễn
- Xây dựng kinh nghiệm với việc khắc phục sự cố và gỡ lỗi các tình huống triển khai thực tế

## Kết quả học tập

Sau khi hoàn thành các ví dụ này, bạn sẽ có thể:
- Tự tin triển khai các loại ứng dụng khác nhau bằng Azure Developer CLI
- Tùy chỉnh các mẫu được cung cấp theo yêu cầu ứng dụng của bạn
- Thiết kế và triển khai các mô hình hạ tầng tùy chỉnh bằng Bicep
- Cấu hình các ứng dụng đa dịch vụ phức tạp với các phụ thuộc phù hợp
- Áp dụng các thực tiễn tốt nhất về bảo mật, giám sát và hiệu suất trong các tình huống thực tế
- Khắc phục sự cố và tối ưu hóa triển khai dựa trên kinh nghiệm thực tiễn

## Cấu trúc thư mục

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Ví dụ khởi động nhanh

### Dành cho người mới bắt đầu
1. **[Ứng dụng Web đơn giản - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Triển khai ứng dụng web Node.js Express với MongoDB
2. **[Website tĩnh - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Lưu trữ website tĩnh React với Azure Static Web Apps
3. **[Ứng dụng Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Triển khai ứng dụng Python Flask được container hóa

### Dành cho người dùng trung cấp
4. **[Ứng dụng cơ sở dữ liệu - C# với Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Ứng dụng web với API C# và cơ sở dữ liệu Azure SQL
5. **[Hàm Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions với HTTP triggers và Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Ứng dụng Java đa dịch vụ với Container Apps và API gateway

### Mẫu Azure AI Foundry

1. **[Ứng dụng Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Ứng dụng chat thông minh với Azure OpenAI
2. **[Xử lý tài liệu AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Phân tích tài liệu bằng các dịch vụ Azure AI
3. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** - Quy trình MLOps với Azure Machine Learning

## 📋 Hướng dẫn sử dụng

### Chạy ví dụ trên máy cục bộ

1. **Clone hoặc sao chép ví dụ**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Khởi tạo môi trường AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Cấu hình môi trường**
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

### Tùy chỉnh ví dụ

Mỗi ví dụ bao gồm:
- **README.md** - Hướng dẫn thiết lập và tùy chỉnh chi tiết
- **azure.yaml** - Cấu hình AZD với các chú thích
- **infra/** - Mẫu Bicep với giải thích tham số
- **src/** - Mã ứng dụng mẫu
- **scripts/** - Các script hỗ trợ cho các tác vụ thông thường

## 🎯 Mục tiêu học tập

### Danh mục ví dụ

#### **Triển khai cơ bản**
- Ứng dụng đơn dịch vụ
- Mô hình hạ tầng đơn giản
- Quản lý cấu hình cơ bản
- Thiết lập phát triển tiết kiệm chi phí

#### **Tình huống nâng cao**
- Kiến trúc đa dịch vụ
- Cấu hình mạng phức tạp
- Mô hình tích hợp cơ sở dữ liệu
- Triển khai bảo mật và tuân thủ

#### **Mô hình sẵn sàng cho sản xuất**
- Cấu hình độ khả dụng cao
- Giám sát và quan sát
- Tích hợp CI/CD
- Thiết lập khôi phục thảm họa

## 📖 Mô tả ví dụ

### Ứng dụng Web đơn giản - Node.js Express
**Công nghệ**: Node.js, Express, MongoDB, Container Apps  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Triển khai cơ bản, REST API, tích hợp cơ sở dữ liệu NoSQL

### Website tĩnh - React SPA
**Công nghệ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Lưu trữ tĩnh, backend serverless, phát triển web hiện đại

### Ứng dụng Container - Python Flask
**Công nghệ**: Python Flask, Docker, Container Apps, Container Registry  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Container hóa, kiến trúc microservices, phát triển API

### Ứng dụng cơ sở dữ liệu - C# với Azure SQL
**Công nghệ**: C# ASP.NET Core, Azure SQL Database, App Service  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Entity Framework, kết nối cơ sở dữ liệu, phát triển web API

### Hàm Serverless - Python Azure Functions
**Công nghệ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Kiến trúc dựa trên sự kiện, tính toán serverless, phát triển full-stack

### Microservices - Java Spring Boot
**Công nghệ**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Giao tiếp microservices, hệ thống phân tán, mô hình doanh nghiệp

### Ví dụ Azure AI Foundry

#### Ứng dụng Chat Azure OpenAI
**Công nghệ**: Azure OpenAI, Cognitive Search, App Service  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Kiến trúc RAG, tìm kiếm vector, tích hợp LLM

#### Xử lý tài liệu AI
**Công nghệ**: Azure AI Document Intelligence, Storage, Functions  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Phân tích tài liệu, OCR, trích xuất dữ liệu

#### Pipeline Machine Learning
**Công nghệ**: Azure ML, MLOps, Container Registry  
**Độ phức tạp**: Nâng cao  
**Khái niệm**: Huấn luyện mô hình, quy trình triển khai, giám sát

## 🛠 Ví dụ cấu hình

Thư mục `configurations/` chứa các thành phần có thể tái sử dụng:

### Cấu hình môi trường
- Cài đặt môi trường phát triển
- Cấu hình môi trường staging
- Cấu hình sẵn sàng cho sản xuất
- Thiết lập triển khai đa vùng

### Module Bicep
- Thành phần hạ tầng có thể tái sử dụng
- Mô hình tài nguyên thông thường
- Mẫu bảo mật cao
- Cấu hình tối ưu chi phí

### Script hỗ trợ
- Tự động hóa thiết lập môi trường
- Script di chuyển cơ sở dữ liệu
- Công cụ xác thực triển khai
- Tiện ích giám sát chi phí

## 🔧 Hướng dẫn tùy chỉnh

### Tùy chỉnh ví dụ cho trường hợp sử dụng của bạn

1. **Xem lại yêu cầu**
   - Kiểm tra yêu cầu dịch vụ Azure
   - Xác minh giới hạn đăng ký
   - Hiểu các tác động chi phí

2. **Chỉnh sửa cấu hình**
   - Cập nhật định nghĩa dịch vụ trong `azure.yaml`
   - Tùy chỉnh mẫu Bicep
   - Điều chỉnh biến môi trường

3. **Kiểm tra kỹ lưỡng**
   - Triển khai vào môi trường phát triển trước
   - Xác thực chức năng
   - Kiểm tra khả năng mở rộng và hiệu suất

4. **Xem xét bảo mật**
   - Xem lại kiểm soát truy cập
   - Triển khai quản lý bí mật
   - Kích hoạt giám sát và cảnh báo

## 📊 Ma trận so sánh

| Ví dụ | Dịch vụ | Cơ sở dữ liệu | Xác thực | Giám sát | Độ phức tạp |
|-------|---------|--------------|----------|----------|-------------|
| Node.js Express Todo | 2 | ✅ | Cơ bản | Cơ bản | ⭐ |
| React SPA + Functions | 3 | ✅ | Cơ bản | Đầy đủ | ⭐ |
| Python Flask Container | 2 | ❌ | Cơ bản | Đầy đủ | ⭐ |
| C# Web API + SQL | 2 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Đầy đủ | Đầy đủ | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Cơ bản | Đầy đủ | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Đầy đủ | Đầy đủ | ⭐⭐⭐⭐ |

## 🎓 Lộ trình học tập

### Tiến trình đề xuất

1. **Bắt đầu với Ứng dụng Web đơn giản**
   - Học các khái niệm cơ bản về AZD
   - Hiểu quy trình triển khai
   - Thực hành quản lý môi trường

2. **Thử Website tĩnh**
   - Khám phá các tùy chọn lưu trữ khác nhau
   - Tìm hiểu về tích hợp CDN
   - Hiểu cấu hình DNS

3. **Chuyển sang Ứng dụng Container**
   - Học các khái niệm cơ bản về container hóa
   - Hiểu các khái niệm mở rộng
   - Thực hành với Docker

4. **Thêm tích hợp cơ sở dữ liệu**
   - Học cách cung cấp cơ sở dữ liệu
   - Hiểu chuỗi kết nối
   - Thực hành quản lý bí mật

5. **Khám phá Serverless**
   - Hiểu kiến trúc dựa trên sự kiện
   - Học về triggers và bindings
   - Thực hành với APIs

6. **Xây dựng Microservices**
   - Học giao tiếp dịch vụ
   - Hiểu hệ thống phân tán
   - Thực hành triển khai phức tạp

## 🔍 Tìm ví dụ phù hợp

### Theo công nghệ
- **Node.js**: Ứng dụng Node.js Express Todo
- **Python**: Ứng dụng Python Flask Container, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Theo mô hình kiến trúc
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Theo mức độ phức tạp
- **Người mới bắt đầu**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Trung cấp**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Nâng cao**: ML Pipeline

## 📚 Tài nguyên bổ sung

### Liên kết tài liệu
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Mẫu AZD Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Tài liệu Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Ví dụ cộng đồng
- [Mẫu AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Mẫu Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Thư viện Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Ứng dụng Todo với C# và Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Ứng dụng Todo với Python và MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Ứng dụng Todo với Node.js và PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Ứng dụng Web React với API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Công việc Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions với Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Thực tiễn tốt nhất
- [Khung Kiến trúc Tốt Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Khung Chấp nhận Đám mây](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Đóng góp ví dụ

Có ví dụ hữu ích để chia sẻ? Chúng tôi hoan nghênh các đóng góp!

### Hướng dẫn gửi bài
1. Tuân theo cấu trúc thư mục đã thiết lập
2. Bao gồm README.md toàn diện
3. Thêm chú thích vào các tệp cấu hình
4. Kiểm tra kỹ lưỡng trước khi gửi
5. Bao gồm ước tính chi phí và yêu cầu

### Cấu trúc mẫu ví dụ
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

**Mẹo chuyên nghiệp**: Bắt đầu với ví dụ đơn giản nhất phù hợp với công nghệ của bạn, sau đó dần dần tiến lên các tình huống phức tạp hơn. Mỗi ví dụ xây dựng trên các khái niệm từ các ví dụ trước!

**Bước tiếp theo**: 
- Chọn ví dụ phù hợp với trình độ của bạn
- Làm theo hướng dẫn thiết lập trong README của ví dụ
- Thử nghiệm với các tùy chỉnh
- Chia sẻ những gì bạn học được với cộng đồng

---

**Điều hướng**
- **Bài học trước**: [Hướng dẫn học tập](../resources/study-guide.md)
- **Quay lại**: [README chính](../README.md)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.