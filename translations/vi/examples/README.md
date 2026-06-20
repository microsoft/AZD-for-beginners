# Ví dụ - Mẫu AZD Thực hành và Cấu hình

**Học qua Ví dụ - Sắp xếp theo Chương**
- **📚 Trang Khóa Học**: [AZD For Beginners](../README.md)
- **📖 Bản đồ Chương**: Ví dụ được sắp xếp theo độ phức tạp học tập
- **🚀 Ví dụ Cục bộ**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Ví dụ AI Bên ngoài**: Liên kết tới các kho Azure Samples

> **📍 QUAN TRỌNG: Ví dụ Cục bộ vs Bên ngoài**  
> Kho lưu trữ này chứa **4 ví dụ cục bộ hoàn chỉnh** với triển khai đầy đủ:  
> - **Microsoft Foundry Models Chat** (triển khai gpt-4.1 với giao diện chat)  
> - **Container Apps** (API Flask đơn giản + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Giải pháp AI doanh nghiệp)  
>  
> Các ví dụ bổ sung là **tham chiếu bên ngoài** tới các kho Azure-Samples mà bạn có thể clone.

## Giới thiệu

Thư mục này cung cấp các ví dụ thực hành và tham chiếu để giúp bạn học Azure Developer CLI thông qua thực hành trực tiếp. Kịch bản Retail Multi-Agent là một triển khai hoàn chỉnh, sẵn sàng cho môi trường production có trong kho này. Các ví dụ bổ sung tham chiếu các Azure Samples chính thức minh họa các kiểu mẫu AZD khác nhau.

### Huy hiệu Đánh giá Độ phức tạp

- ⭐ **Người mới** - Khái niệm cơ bản, dịch vụ đơn lẻ, 15-30 phút
- ⭐⭐ **Trung cấp** - Nhiều dịch vụ, tích hợp cơ sở dữ liệu, 30-60 phút
- ⭐⭐⭐ **Nâng cao** - Kiến trúc phức tạp, tích hợp AI, 1-2 giờ
- ⭐⭐⭐⭐ **Chuyên gia** - Sẵn sàng production, mẫu doanh nghiệp, 2+ giờ

## 🎯 Những gì thực sự có trong Kho này

### ✅ Triển khai Cục bộ (Sẵn sàng sử dụng)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Triển khai gpt-4.1 đầy đủ với giao diện chat được bao gồm trong repo này**

- **Vị trí:** `examples/azure-openai-chat/`
- **Độ phức tạp:** ⭐⭐ (Trung cấp)
- **Bao gồm:**
  - Triển khai Microsoft Foundry Models hoàn chỉnh (gpt-4.1)
  - Giao diện chat dòng lệnh Python
  - Tích hợp Key Vault để bảo mật API keys
  - Mẫu hạ tầng Bicep
  - Theo dõi sử dụng token và chi phí
  - Giới hạn tốc độ và xử lý lỗi

**Bắt đầu nhanh:**
```bash
# Đi tới ví dụ
cd examples/azure-openai-chat

# Triển khai tất cả
azd up

# Cài đặt các phụ thuộc và bắt đầu trò chuyện
pip install -r src/requirements.txt
python src/chat.py
```

**Công nghệ:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Các ví dụ triển khai container toàn diện được bao gồm trong repo này**

- **Vị trí:** `examples/container-app/`
- **Độ phức tạp:** ⭐-⭐⭐⭐⭐ (Từ Người mới đến Nâng cao)
- **Bao gồm:**
  - [Master Guide](container-app/README.md) - Tổng quan đầy đủ về triển khai container
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Ví dụ REST API cơ bản
  - [Microservices Architecture](../../../examples/container-app/microservices) - Triển khai đa dịch vụ sẵn sàng production
  - Mẫu Bắt đầu Nhanh, Production và Nâng cao
  - Giám sát, bảo mật và tối ưu chi phí

**Bắt đầu nhanh:**
```bash
# Xem hướng dẫn chính
cd examples/container-app

# Triển khai API Flask đơn giản
cd simple-flask-api
azd up

# Triển khai ví dụ microservices
cd ../microservices
azd up
```

**Công nghệ:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Triển khai sẵn sàng production hoàn chỉnh được bao gồm trong repo này**

- **Vị trí:** `examples/retail-multiagent-arm-template/`
- **Độ phức tạp:** ⭐⭐⭐⭐ (Nâng cao)
- **Bao gồm:**
  - Mẫu triển khai ARM hoàn chỉnh
  - Kiến trúc đa tác nhân (Customer + Inventory)
  - Tích hợp Microsoft Foundry Models
  - AI Search với RAG
  - Giám sát toàn diện
  - Script triển khai một cú nhấp

**Bắt đầu nhanh:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Công nghệ:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Các Azure Samples Bên ngoài (Clone để sử dụng)

Các ví dụ sau được duy trì trong các kho Azure-Samples chính thức. Clone chúng để khám phá các mẫu AZD khác nhau:

### Ứng dụng đơn giản (Chương 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cách sử dụng:**
```bash
# Sao chép bất kỳ ví dụ nào
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Triển khai
azd up
```

### Ví dụ Ứng dụng AI (Chương 2, 5, 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basic AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Cơ sở dữ liệu & Mẫu Nâng cao (Chương 3-8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Mục tiêu học tập

Bằng cách làm việc qua các ví dụ này, bạn sẽ:
- Thực hành các workflow Azure Developer CLI với các kịch bản ứng dụng thực tế
- Hiểu các kiến trúc ứng dụng khác nhau và cách triển khai chúng bằng azd
- Làm chủ các mẫu Infrastructure as Code cho các dịch vụ Azure khác nhau
- Áp dụng quản lý cấu hình và chiến lược triển khai theo môi trường
- Triển khai các mẫu giám sát, bảo mật và mở rộng trong ngữ cảnh thực tế
- Xây dựng kinh nghiệm khắc phục sự cố và gỡ lỗi các kịch bản triển khai thực tế

## Kết quả học tập

Sau khi hoàn thành các ví dụ này, bạn sẽ có thể:
- Triển khai các loại ứng dụng khác nhau bằng Azure Developer CLI một cách tự tin
- Điều chỉnh các mẫu cung cấp để phù hợp yêu cầu ứng dụng của bạn
- Thiết kế và triển khai các mẫu hạ tầng tùy chỉnh sử dụng Bicep
- Cấu hình các ứng dụng đa dịch vụ phức tạp với các phụ thuộc đúng đắn
- Áp dụng các thực hành tốt về bảo mật, giám sát và hiệu suất trong các kịch bản thực tế
- Khắc phục sự cố và tối ưu hóa các triển khai dựa trên kinh nghiệm thực tiễn

## Cấu trúc Thư mục

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

## Ví dụ Bắt đầu Nhanh

> **💡 Mới với AZD?** Bắt đầu với ví dụ #1 (Flask API) - mất khoảng ~20 phút và dạy các khái niệm cốt lõi.

### Dành cho Người mới
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Cục bộ) ⭐  
   Triển khai REST API đơn giản với scale-to-zero  
   **Thời gian:** 20-25 phút | **Chi phí:** $0-5/tháng  
   **Bạn sẽ học:** Workflow azd cơ bản, containerization, health probes  
   **Kết quả mong đợi:** Endpoint API hoạt động trả về "Hello, World!" với giám sát

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Triển khai ứng dụng web Node.js Express với MongoDB  
   **Thời gian:** 25-35 phút | **Chi phí:** $10-30/tháng  
   **Bạn sẽ học:** Tích hợp cơ sở dữ liệu, biến môi trường, chuỗi kết nối  
   **Kết quả mong đợi:** Ứng dụng Todo với chức năng tạo/đọc/cập nhật/xóa

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Lưu trữ website tĩnh React với Azure Static Web Apps  
   **Thời gian:** 20-30 phút | **Chi phí:** $0-10/tháng  
   **Bạn sẽ học:** Hosting tĩnh, functions serverless, triển khai CDN  
   **Kết quả mong đợi:** Giao diện React với backend API, SSL tự động, CDN toàn cầu

### Dành cho Người dùng Trung cấp
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Cục bộ) ⭐⭐  
   Triển khai gpt-4.1 với giao diện chat và quản lý API key an toàn  
   **Thời gian:** 35-45 phút | **Chi phí:** $50-200/tháng  
   **Bạn sẽ học:** Triển khai Microsoft Foundry Models, tích hợp Key Vault, theo dõi token  
   **Kết quả mong đợi:** Ứng dụng chat hoạt động với gpt-4.1 và giám sát chi phí

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Cục bộ) ⭐⭐⭐⭐  
   Kiến trúc đa dịch vụ sẵn sàng production  
   **Thời gian:** 45-60 phút | **Chi phí:** $50-150/tháng  
   **Bạn sẽ học:** Giao tiếp dịch vụ, hàng đợi tin nhắn, theo dõi phân tán  
   **Kết quả mong đợi:** Hệ thống 2 dịch vụ (API Gateway + Product Service) với giám sát

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Ứng dụng web với API C# và Azure SQL Database  
   **Thời gian:** 30-45 phút | **Chi phí:** $20-80/tháng  
   **Bạn sẽ học:** Entity Framework, migrations cơ sở dữ liệu, bảo mật kết nối  
   **Kết quả mong đợi:** API C# với backend Azure SQL, triển khai schema tự động

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions với HTTP triggers và Cosmos DB  
   **Thời gian:** 30-40 phút | **Chi phí:** $10-40/tháng  
   **Bạn sẽ học:** Kiến trúc hướng sự kiện, scale serverless, tích hợp NoSQL  
   **Kết quả mong đợi:** Function app phản hồi yêu cầu HTTP với lưu trữ Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Ứng dụng Java đa dịch vụ với Container Apps và API gateway  
   **Thời gian:** 60-90 phút | **Chi phí:** $80-200/tháng  
   **Bạn sẽ học:** Triển khai Spring Boot, service mesh, cân bằng tải  
   **Kết quả mong đợi:** Hệ thống đa dịch vụ Java với khám phá dịch vụ và routing

### Mẫu Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Triển khai gpt-4.1 đầy đủ với giao diện chat  
   **Thời gian:** 35-45 phút | **Chi phí:** $50-200/tháng  
   **Kết quả mong đợi:** Ứng dụng chat hoạt động với theo dõi token và giám sát chi phí

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Ứng dụng chat thông minh với kiến trúc RAG  
   **Thời gian:** 60-90 phút | **Chi phí:** $100-300/tháng  
   **Kết quả mong đợi:** Giao diện chat dùng RAG với tìm kiếm tài liệu và trích dẫn

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Phân tích tài liệu sử dụng dịch vụ Azure AI  
   **Thời gian:** 40-60 phút | **Chi phí:** $20-80/tháng  
   **Kết quả mong đợi:** API trích xuất văn bản, bảng và thực thể từ tài liệu tải lên

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Quy trình MLOps với Azure Machine Learning  
   **Thời gian:** 2-3 giờ | **Chi phí:** $150-500/tháng  
   **Kết quả mong đợi:** Pipeline ML tự động với đào tạo, triển khai và giám sát

### Kịch bản Thực tế

#### **Retail Multi-Agent Solution** 🆕
**[Hướng dẫn Triển khai Hoàn chỉnh](./retail-scenario.md)**

Một giải pháp hỗ trợ khách hàng đa tác nhân toàn diện, sẵn sàng cho production, minh họa triển khai ứng dụng AI cấp doanh nghiệp bằng AZD. Kịch bản này cung cấp:

- **Kiến trúc Hoàn chỉnh**: Hệ thống đa tác nhân với các tác nhân chuyên trách dịch vụ khách hàng và quản lý tồn kho
- **Hạ tầng Sản xuất**: Triển khai Microsoft Foundry Models đa vùng, Azure AI Search, Container Apps, và giám sát toàn diện
- **Mẫu ARM Sẵn để Triển khai**: Triển khai một lần nhấp với nhiều chế độ cấu hình (Minimal/Standard/Premium)
- **Tính năng Nâng cao**: Xác thực an ninh red teaming, khung đánh giá agent, tối ưu hóa chi phí, và hướng dẫn khắc phục sự cố
- **Bối cảnh Kinh doanh Thực tế**: Trường hợp hỗ trợ khách hàng của nhà bán lẻ với tải lên tệp, tích hợp tìm kiếm, và mở rộng động

**Công nghệ**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Độ phức tạp**: ⭐⭐⭐⭐ (Nâng cao - Sẵn sàng Sản xuất Doanh nghiệp)

**Phù hợp cho**: Nhà phát triển AI, kiến trúc sư giải pháp, và các nhóm xây dựng hệ thống đa-agent ở môi trường sản xuất

**Bắt đầu Nhanh**: Triển khai giải pháp hoàn chỉnh trong dưới 30 phút bằng mẫu ARM kèm theo với `./deploy.sh -g myResourceGroup`

## 📋 Hướng dẫn Sử dụng

### Yêu cầu tiên quyết

Trước khi chạy bất kỳ ví dụ nào:
- ✅ Đăng ký Azure với quyền Owner hoặc Contributor
- ✅ Azure Developer CLI đã được cài ([Hướng dẫn Cài đặt](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop đang chạy (cho các ví dụ container)
- ✅ Hạn ngạch Azure phù hợp (kiểm tra yêu cầu riêng cho từng ví dụ)

> **💰 Cảnh báo Chi phí:** Tất cả các ví dụ tạo tài nguyên Azure thực tế sẽ phát sinh chi phí. Xem file README riêng cho từng ví dụ để biết ước tính chi phí. Hãy nhớ chạy `azd down` khi hoàn tất để tránh phát sinh chi phí liên tục.

### Chạy Ví dụ Cục bộ

1. **Sao chép hoặc Nhân bản Ví dụ**
   ```bash
   # Đi tới ví dụ mong muốn
   cd examples/simple-web-app
   ```

2. **Khởi tạo Môi trường AZD**
   ```bash
   # Khởi tạo bằng mẫu hiện có
   azd init
   
   # Hoặc tạo môi trường mới
   azd env new my-environment
   ```

3. **Cấu hình Môi trường**
   ```bash
   # Thiết lập các biến cần thiết
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Triển khai**
   ```bash
   # Triển khai hạ tầng và ứng dụng
   azd up
   ```

5. **Xác minh Triển khai**
   ```bash
   # Lấy các điểm cuối dịch vụ
   azd env get-values
   
   # Kiểm tra điểm cuối (ví dụ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Chỉ số Thành công Mong đợi:**
   - ✅ `azd up` hoàn tất không có lỗi
   - ✅ Endpoint dịch vụ trả về HTTP 200
   - ✅ Azure Portal hiển thị trạng thái "Running"
   - ✅ Application Insights nhận dữ liệu telemetry

> **⚠️ Gặp sự cố?** Xem [Các Vấn đề Thường Gặp](../docs/chapter-07-troubleshooting/common-issues.md) để khắc phục khi triển khai

### Điều chỉnh Ví dụ

Mỗi ví dụ bao gồm:
- **README.md** - Hướng dẫn thiết lập và tùy chỉnh chi tiết
- **azure.yaml** - Cấu hình AZD có chú thích
- **infra/** - Mẫu Bicep với giải thích tham số
- **src/** - Mã ứng dụng mẫu
- **scripts/** - Script hỗ trợ cho các tác vụ chung

## 🎯 Mục tiêu Học tập

### Các Loại Ví dụ

#### **Triển khai Cơ bản**
- Ứng dụng dịch vụ đơn
- Mẫu hạ tầng đơn giản
- Quản lý cấu hình cơ bản
- Thiết lập phát triển tiết kiệm chi phí

#### **Kịch bản Nâng cao**
- Kiến trúc đa dịch vụ
- Cấu hình mạng phức tạp
- Mẫu tích hợp cơ sở dữ liệu
- Triển khai bảo mật và tuân thủ

#### **Mô hình Sẵn sàng cho Sản xuất**
- Cấu hình độ sẵn sàng cao
- Giám sát và khả năng quan sát
- Tích hợp CI/CD
- Thiết lập phục hồi thảm họa

## 📖 Mô tả Ví dụ

### Ứng dụng Web Đơn giản - Node.js Express
**Công nghệ**: Node.js, Express, MongoDB, Container Apps  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Triển khai cơ bản, REST API, tích hợp cơ sở dữ liệu NoSQL

### Website Tĩnh - React SPA
**Công nghệ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Lưu trữ tĩnh, backend serverless, phát triển web hiện đại

### Container App - Python Flask
**Công nghệ**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Containerization, REST API, scale-to-zero, health probes, giám sát  
**Vị trí**: [Ví dụ Cục bộ](../../../examples/container-app/simple-flask-api)

### Container App - Kiến trúc Microservices
**Công nghệ**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Độ phức tạp**: Nâng cao  
**Khái niệm**: Kiến trúc đa dịch vụ, giao tiếp dịch vụ, hàng đợi thông điệp, phân tán tracing  
**Vị trí**: [Ví dụ Cục bộ](../../../examples/container-app/microservices)

### Ứng dụng Cơ sở dữ liệu - C# với Azure SQL
**Công nghệ**: C# ASP.NET Core, Azure SQL Database, App Service  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Entity Framework, kết nối cơ sở dữ liệu, phát triển web API

### Function Serverless - Python Azure Functions
**Công nghệ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Kiến trúc hướng sự kiện, điện toán serverless, phát triển full-stack

### Microservices - Java Spring Boot
**Công nghệ**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Giao tiếp microservices, hệ thống phân tán, mẫu doanh nghiệp

### Ví dụ Microsoft Foundry

#### Ứng dụng Chat Microsoft Foundry Models
**Công nghệ**: Microsoft Foundry Models, Azure AI Search, App Service  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Kiến trúc RAG, tìm kiếm vector, tích hợp LLM

#### Xử lý Tài liệu AI
**Công nghệ**: Azure AI Document Intelligence, Storage, Functions  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Phân tích tài liệu, OCR, trích xuất dữ liệu

#### Pipeline Máy học
**Công nghệ**: Azure ML, MLOps, Container Registry  
**Độ phức tạp**: Nâng cao  
**Khái niệm**: Huấn luyện mô hình, pipeline triển khai, giám sát

## 🛠 Ví dụ Cấu hình

Thư mục `configurations/` chứa các thành phần có thể tái sử dụng:

### Cấu hình Môi trường
- Cài đặt cho môi trường Development
- Cấu hình cho môi trường Staging
- Cấu hình sẵn sàng cho Production
- Thiết lập triển khai đa vùng

### Mô-đun Bicep
- Thành phần hạ tầng tái sử dụng
- Mẫu tài nguyên phổ biến
- Template được harden về bảo mật
- Cấu hình tối ưu chi phí

### Script Hỗ trợ
- Tự động thiết lập môi trường
- Script di chuyển cơ sở dữ liệu
- Công cụ xác thực triển khai
- Tiện ích giám sát chi phí

## 🔧 Hướng dẫn Tùy chỉnh

### Điều chỉnh Ví dụ cho Trường hợp Sử dụng của Bạn

1. **Xem lại Yêu cầu tiên quyết**
   - Kiểm tra yêu cầu dịch vụ Azure
   - Xác minh giới hạn subscription
   - Hiểu tác động về chi phí

2. **Sửa đổi Cấu hình**
   - Cập nhật định nghĩa dịch vụ trong `azure.yaml`
   - Tùy chỉnh template Bicep
   - Điều chỉnh biến môi trường

3. **Kiểm thử Kỹ lưỡng**
   - Triển khai trước vào môi trường development
   - Xác thực chức năng
   - Kiểm thử khả năng scale và hiệu năng

4. **Đánh giá Bảo mật**
   - Xem lại kiểm soát truy cập
   - Triển khai quản lý secrets
   - Bật giám sát và cảnh báo

## 📊 Bảng So sánh

| Ví dụ | Dịch vụ | Cơ sở dữ liệu | Xác thực | Giám sát | Độ phức tạp |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Cục bộ) | 2 | ❌ | Key Vault | Đầy đủ | ⭐⭐ |
| **Python Flask API** (Cục bộ) | 1 | ❌ | Cơ bản | Đầy đủ | ⭐ |
| **Microservices** (Cục bộ) | 5+ | ✅ | Doanh nghiệp | Nâng cao | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Cơ bản | Cơ bản | ⭐ |
| React SPA + Functions | 3 | ✅ | Cơ bản | Đầy đủ | ⭐ |
| Python Flask Container | 2 | ❌ | Cơ bản | Đầy đủ | ⭐ |
| C# Web API + SQL | 2 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Đầy đủ | Đầy đủ | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Cơ bản | Đầy đủ | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Đầy đủ | Đầy đủ | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Cục bộ) | **8+** | **✅** | **Doanh nghiệp** | **Nâng cao** | **⭐⭐⭐⭐** |

## 🎓 Lộ trình Học tập

### Thứ tự Đề xuất

1. **Bắt đầu với Ứng dụng Web Đơn giản**
   - Học các khái niệm AZD cơ bản
   - Hiểu quy trình triển khai
   - Thực hành quản lý môi trường

2. **Thử Website Tĩnh**
   - Khám phá các tùy chọn hosting khác nhau
   - Tìm hiểu tích hợp CDN
   - Hiểu cấu hình DNS

3. **Chuyển sang Container App**
   - Học các khái niệm containerization cơ bản
   - Hiểu khái niệm scale
   - Thực hành với Docker

4. **Thêm Tích hợp Cơ sở dữ liệu**
   - Học cách cung cấp cơ sở dữ liệu
   - Hiểu chuỗi kết nối
   - Thực hành quản lý secrets

5. **Khám phá Serverless**
   - Hiểu kiến trúc hướng sự kiện
   - Tìm hiểu về triggers và bindings
   - Thực hành với API

6. **Xây dựng Microservices**
   - Học giao tiếp dịch vụ
   - Hiểu hệ thống phân tán
   - Thực hành triển khai phức tạp

## 🔍 Tìm Ví dụ Phù hợp

### Theo Ngăn xếp Công nghệ
- **Container Apps**: [Python Flask API (Cục bộ)](../../../examples/container-app/simple-flask-api), [Microservices (Cục bộ)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Cục bộ)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Cục bộ)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Cục bộ)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Cục bộ)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Cục bộ)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Cục bộ)](../../../examples/container-app/simple-flask-api), [Microservices (Cục bộ)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Cục bộ)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Cục bộ)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Cục bộ)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Cục bộ)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Theo Mẫu Kiến trúc
- **Simple REST API**: [Python Flask API (Cục bộ)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Cục bộ)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Cục bộ)](../../../examples/container-app/simple-flask-api), [Microservices (Cục bộ)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Cục bộ)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Cục bộ)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Theo Mức Độ Phức tạp
- **Người mới bắt đầu**: [Python Flask API (Cục bộ)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Trung cấp**: **[Microsoft Foundry Models Chat (Cục bộ)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Nâng cao**: ML Pipeline
- **Sẵn sàng cho Sản xuất Doanh nghiệp**: [Microservices (Cục bộ)](../../../examples/container-app/microservices) (Đa dịch vụ với hàng đợi thông điệp), **Retail Multi-Agent Solution** (Hệ thống đa-agent hoàn chỉnh với triển khai mẫu ARM)

## 📚 Tài nguyên Bổ sung

### Liên kết Tài liệu
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Ví dụ từ Cộng đồng
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Ứng dụng web React với API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions với Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Thực hành tốt nhất
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Góp ví dụ

Bạn có một ví dụ hữu ích để chia sẻ? Chúng tôi chào đón đóng góp!

### Hướng dẫn gửi bài
1. Tuân theo cấu trúc thư mục đã thiết lập
2. Bao gồm README.md đầy đủ
3. Thêm chú thích vào các tệp cấu hình
4. Kiểm tra kỹ lưỡng trước khi gửi
5. Bao gồm ước tính chi phí và các điều kiện tiên quyết

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

**Mẹo chuyên nghiệp**: Bắt đầu với ví dụ đơn giản nhất phù hợp với ngăn xếp công nghệ của bạn, sau đó từ từ mở rộng sang các kịch bản phức tạp hơn. Mỗi ví dụ xây dựng trên các khái niệm từ các ví dụ trước đó!

## 🚀 Sẵn sàng bắt đầu?

### Lộ trình học của bạn

1. **Hoàn toàn mới?** → Bắt đầu với [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 phút)
2. **Đã có kiến thức cơ bản về AZD?** → Thử [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 phút)
3. **Xây dựng ứng dụng AI?** → Bắt đầu với [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 phút) hoặc khám phá [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ giờ)
4. **Cần ngăn xếp công nghệ cụ thể?** → Sử dụng phần [Tìm ví dụ phù hợp](#-finding-the-right-example) ở trên

### Bước tiếp theo

- ✅ Xem lại [Yêu cầu tiên quyết](#yêu-cầu-tiên-quyết) ở trên
- ✅ Chọn ví dụ phù hợp với trình độ của bạn (xem [Chú thích độ phức tạp](#huy-hiệu-đánh-giá-độ-phức-tạp))
- ✅ Đọc kỹ README của ví dụ trước khi triển khai
- ✅ Đặt lời nhắc để chạy `azd down` sau khi kiểm tra
- ✅ Chia sẻ trải nghiệm của bạn qua GitHub Issues hoặc Discussions

### Cần trợ giúp?

- 📖 [Câu hỏi thường gặp](../resources/faq.md) - Giải đáp các câu hỏi phổ biến
- 🐛 [Hướng dẫn khắc phục sự cố](../docs/chapter-07-troubleshooting/common-issues.md) - Sửa các vấn đề triển khai
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Hỏi cộng đồng
- 📚 [Hướng dẫn học tập](../resources/study-guide.md) - Củng cố kiến thức của bạn

---

**Điều hướng**
- **📚 Trang khóa học**: [AZD For Beginners](../README.md)
- **📖 Tài liệu học tập**: [Hướng dẫn học tập](../resources/study-guide.md) | [Bảng tóm tắt](../resources/cheat-sheet.md) | [Thuật ngữ](../resources/glossary.md)
- **🔧 Tài nguyên**: [Câu hỏi thường gặp](../resources/faq.md) | [Khắc phục sự cố](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Cập nhật lần cuối: November 2025 | [Báo cáo sự cố](https://github.com/microsoft/AZD-for-beginners/issues) | [Góp ví dụ](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->