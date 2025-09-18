<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T07:44:46+00:00",
  "source_file": "examples/README.md",
  "language_code": "vi"
}
-->
# Ví dụ - Mẫu và Cấu hình AZD Thực tiễn

**Học qua ví dụ - Sắp xếp theo chương**
- **📚 Trang chủ khóa học**: [AZD Cho Người Mới Bắt Đầu](../README.md)
- **📖 Sơ đồ chương**: Các ví dụ được sắp xếp theo độ phức tạp học tập
- **🚀 Bắt đầu đơn giản**: [Ví dụ Chương 1](../../../examples)
- **🤖 Ví dụ AI**: [Giải pháp AI Chương 2 & 5](../../../examples)

## Giới thiệu

Thư mục này chứa các ví dụ thực tiễn, mẫu và tình huống thực tế để giúp bạn học Azure Developer CLI thông qua thực hành. Mỗi ví dụ cung cấp mã hoạt động hoàn chỉnh, mẫu hạ tầng và hướng dẫn chi tiết cho các kiến trúc ứng dụng và mô hình triển khai khác nhau.

## Mục tiêu học tập

Khi làm việc qua các ví dụ này, bạn sẽ:
- Thực hành quy trình làm việc của Azure Developer CLI với các tình huống ứng dụng thực tế
- Hiểu các kiến trúc ứng dụng khác nhau và cách triển khai chúng với azd
- Làm chủ các mô hình Infrastructure as Code cho nhiều dịch vụ Azure
- Áp dụng quản lý cấu hình và chiến lược triển khai theo môi trường cụ thể
- Thực hiện các mô hình giám sát, bảo mật và mở rộng trong các ngữ cảnh thực tiễn
- Xây dựng kinh nghiệm với việc khắc phục sự cố và gỡ lỗi các tình huống triển khai thực tế

## Kết quả học tập

Sau khi hoàn thành các ví dụ này, bạn sẽ có thể:
- Triển khai các loại ứng dụng khác nhau bằng Azure Developer CLI một cách tự tin
- Tùy chỉnh các mẫu được cung cấp theo yêu cầu ứng dụng của riêng bạn
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

## Ví dụ Bắt Đầu Nhanh

### Dành cho Người Mới Bắt Đầu
1. **[Ứng dụng Web Đơn giản - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Triển khai ứng dụng web Node.js Express với MongoDB
2. **[Website Tĩnh - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Lưu trữ website tĩnh React với Azure Static Web Apps
3. **[Ứng dụng Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Triển khai ứng dụng Python Flask được container hóa

### Dành cho Người Dùng Trung Cấp
4. **[Ứng dụng Cơ sở Dữ liệu - C# với Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Ứng dụng web với API C# và cơ sở dữ liệu Azure SQL
5. **[Hàm Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions với HTTP triggers và Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Ứng dụng Java đa dịch vụ với Container Apps và API gateway

### Mẫu Azure AI Foundry

1. **[Ứng dụng Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Ứng dụng chat thông minh với Azure OpenAI
2. **[Xử lý Tài liệu AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Phân tích tài liệu bằng các dịch vụ Azure AI
3. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** - Quy trình MLOps với Azure Machine Learning

### Tình huống Thực tế

#### **Giải pháp Đa Tác Nhân Bán Lẻ** 🆕
**[Hướng dẫn Triển khai Hoàn chỉnh](./retail-scenario.md)**

Một giải pháp hỗ trợ khách hàng đa tác nhân sẵn sàng sản xuất toàn diện, minh họa việc triển khai ứng dụng AI cấp doanh nghiệp với AZD. Tình huống này cung cấp:

- **Kiến trúc Hoàn chỉnh**: Hệ thống đa tác nhân với các tác nhân chuyên biệt về dịch vụ khách hàng và quản lý hàng tồn kho
- **Hạ tầng Sản xuất**: Triển khai Azure OpenAI đa vùng, AI Search, Container Apps và giám sát toàn diện
- **Mẫu ARM Sẵn sàng Triển khai**: Triển khai một lần nhấp với nhiều chế độ cấu hình (Tối thiểu/Chuẩn/Cao cấp)
- **Tính năng Nâng cao**: Xác thực bảo mật red teaming, khung đánh giá tác nhân, tối ưu hóa chi phí và hướng dẫn khắc phục sự cố
- **Ngữ cảnh Kinh doanh Thực tế**: Tình huống hỗ trợ khách hàng của nhà bán lẻ với tải lên tệp, tích hợp tìm kiếm và mở rộng động

**Công nghệ**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Độ phức tạp**: ⭐⭐⭐⭐ (Nâng cao - Sẵn sàng Sản xuất Doanh nghiệp)

**Hoàn hảo cho**: Nhà phát triển AI, kiến trúc sư giải pháp và các nhóm xây dựng hệ thống đa tác nhân sản xuất

**Bắt đầu Nhanh**: Triển khai giải pháp hoàn chỉnh trong vòng chưa đầy 30 phút bằng mẫu ARM đi kèm với `./deploy.sh -g myResourceGroup`

## 📋 Hướng dẫn Sử dụng

### Chạy Ví dụ Cục bộ

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
- **README.md** - Hướng dẫn thiết lập và tùy chỉnh chi tiết
- **azure.yaml** - Cấu hình AZD với các chú thích
- **infra/** - Mẫu Bicep với giải thích tham số
- **src/** - Mã ứng dụng mẫu
- **scripts/** - Script hỗ trợ cho các tác vụ thông thường

## 🎯 Mục tiêu Học tập

### Danh mục Ví dụ

#### **Triển khai Cơ bản**
- Ứng dụng đơn dịch vụ
- Mô hình hạ tầng đơn giản
- Quản lý cấu hình cơ bản
- Thiết lập phát triển tiết kiệm chi phí

#### **Tình huống Nâng cao**
- Kiến trúc đa dịch vụ
- Cấu hình mạng phức tạp
- Mô hình tích hợp cơ sở dữ liệu
- Triển khai bảo mật và tuân thủ

#### **Mô hình Sẵn sàng Sản xuất**
- Cấu hình độ khả dụng cao
- Giám sát và quan sát
- Tích hợp CI/CD
- Thiết lập khôi phục thảm họa

## 📖 Mô tả Ví dụ

### Ứng dụng Web Đơn giản - Node.js Express
**Công nghệ**: Node.js, Express, MongoDB, Container Apps  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Triển khai cơ bản, REST API, tích hợp cơ sở dữ liệu NoSQL

### Website Tĩnh - React SPA
**Công nghệ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Lưu trữ tĩnh, backend serverless, phát triển web hiện đại

### Ứng dụng Container - Python Flask
**Công nghệ**: Python Flask, Docker, Container Apps, Container Registry  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Container hóa, kiến trúc microservices, phát triển API

### Ứng dụng Cơ sở Dữ liệu - C# với Azure SQL
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

#### Xử lý Tài liệu AI
**Công nghệ**: Azure AI Document Intelligence, Storage, Functions  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Phân tích tài liệu, OCR, trích xuất dữ liệu

#### Pipeline Machine Learning
**Công nghệ**: Azure ML, MLOps, Container Registry  
**Độ phức tạp**: Nâng cao  
**Khái niệm**: Huấn luyện mô hình, quy trình triển khai, giám sát

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
- Cấu hình tối ưu hóa chi phí

### Script Hỗ trợ
- Tự động hóa thiết lập môi trường
- Script di chuyển cơ sở dữ liệu
- Công cụ xác thực triển khai
- Tiện ích giám sát chi phí

## 🔧 Hướng dẫn Tùy chỉnh

### Tùy chỉnh Ví dụ cho Trường hợp Sử dụng của Bạn

1. **Xem lại Yêu cầu**
   - Kiểm tra yêu cầu dịch vụ Azure
   - Xác minh giới hạn đăng ký
   - Hiểu các tác động chi phí

2. **Chỉnh sửa Cấu hình**
   - Cập nhật định nghĩa dịch vụ trong `azure.yaml`
   - Tùy chỉnh mẫu Bicep
   - Điều chỉnh biến môi trường

3. **Kiểm tra Kỹ lưỡng**
   - Triển khai vào môi trường phát triển trước
   - Xác thực chức năng
   - Kiểm tra khả năng mở rộng và hiệu suất

4. **Xem xét Bảo mật**
   - Xem lại kiểm soát truy cập
   - Triển khai quản lý bí mật
   - Kích hoạt giám sát và cảnh báo

## 📊 Ma trận So sánh

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
| **Retail Multi-Agent** | **8+** | **✅** | **Doanh nghiệp** | **Nâng cao** | **⭐⭐⭐⭐** |

## 🎓 Lộ trình Học tập

### Tiến trình Đề xuất

1. **Bắt đầu với Ứng dụng Web Đơn giản**
   - Học các khái niệm cơ bản của AZD
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

4. **Thêm Tích hợp Cơ sở Dữ liệu**
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

## 🔍 Tìm Ví dụ Phù hợp

### Theo Công nghệ
- **Node.js**: Ứng dụng Node.js Express Todo
- **Python**: Ứng dụng Python Flask Container, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Ứng dụng Python Flask Container, Java Microservices
- **Cơ sở dữ liệu**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Hệ thống Đa Tác Nhân**: **Retail Multi-Agent Solution**
- **Sản xuất Doanh nghiệp**: **Retail Multi-Agent Solution**

### Theo Mô hình Kiến trúc
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Tĩnh + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: Ứng dụng Python Flask Container
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Kiến trúc Đa Tác Nhân**: **Retail Multi-Agent Solution**
- **Đa Dịch vụ Doanh nghiệp**: **Retail Multi-Agent Solution**

### Theo Mức Độ Phức Tạp
- **Người mới bắt đầu**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Trung cấp**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Nâng cao**: ML Pipeline
- **Sẵn sàng Sản xuất Doanh nghiệp**: **Retail Multi-Agent Solution** (Hệ thống đa tác nhân hoàn chỉnh với triển khai mẫu ARM)

## 📚 Tài nguyên Bổ sung

### Liên kết Tài liệu
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Mẫu AZD Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Tài liệu Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Ví dụ Cộng đồng
- [Mẫu AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Mẫu Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Thư viện Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Ứng dụng Todo với C# và Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Ứng dụng Todo với Python và MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Ứng dụng Todo với Node.js và PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Ứng dụng Web React với API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions với Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Các nguyên tắc tốt nhất
- [Khung Kiến Trúc Tốt của Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Khung Chuyển Đổi Đám Mây](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Đóng góp ví dụ

Có ví dụ hữu ích muốn chia sẻ? Chúng tôi hoan nghênh sự đóng góp của bạn!

### Hướng dẫn gửi bài
1. Tuân theo cấu trúc thư mục đã thiết lập
2. Bao gồm README.md chi tiết
3. Thêm nhận xét vào các tệp cấu hình
4. Kiểm tra kỹ lưỡng trước khi gửi
5. Bao gồm ước tính chi phí và các yêu cầu cần thiết

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

**Mẹo hay**: Bắt đầu với ví dụ đơn giản nhất phù hợp với công nghệ của bạn, sau đó dần dần tiến tới các tình huống phức tạp hơn. Mỗi ví dụ xây dựng dựa trên các khái niệm từ ví dụ trước!

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