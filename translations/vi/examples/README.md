# Ví dụ - Mẫu và Cấu hình AZD thực tiễn

**Học qua ví dụ - Sắp xếp theo chương**
- **📚 Trang Khóa học**: [AZD dành cho người mới](../README.md)
- **📖 Bản đồ chương**: Ví dụ được sắp xếp theo độ phức tạp học tập
- **🚀 Ví dụ cục bộ**: [Giải pháp bán lẻ đa tác nhân](retail-scenario.md)
- **🤖 Ví dụ AI bên ngoài**: Liên kết đến kho mẫu Azure Samples

> **📍 QUAN TRỌNG: Ví dụ cục bộ và bên ngoài**  
> Kho lưu trữ này bao gồm **4 ví dụ cục bộ hoàn chỉnh** với triển khai đầy đủ:  
> - **Microsoft Foundry Models Chat** (triển khai gpt-4.1 với giao diện chat)  
> - **Container Apps** (API Flask đơn giản + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Giải pháp AI doanh nghiệp)  
>  
> Các ví dụ bổ sung là **tham chiếu bên ngoài** tới các kho Azure-Samples mà bạn có thể clone.

## Giới thiệu

Thư mục này cung cấp các ví dụ thực tế và tham chiếu để giúp bạn học Azure Developer CLI thông qua thực hành. Kịch bản Retail Multi-Agent là một triển khai hoàn chỉnh, sẵn sàng cho sản xuất được bao gồm trong kho này. Các ví dụ bổ sung tham chiếu các Azure Samples chính thức minh họa các kiểu mẫu AZD khác nhau.

### Chú giải mức độ phức tạp

- ⭐ **Người mới** - Khái niệm cơ bản, một dịch vụ, 15-30 phút
- ⭐⭐ **Trung cấp** - Nhiều dịch vụ, tích hợp cơ sở dữ liệu, 30-60 phút
- ⭐⭐⭐ **Nâng cao** - Kiến trúc phức tạp, tích hợp AI, 1-2 giờ
- ⭐⭐⭐⭐ **Chuyên gia** - Sẵn sàng cho sản xuất, mẫu doanh nghiệp, 2+ giờ

## 🎯 Những gì thực sự có trong kho này

### ✅ Triển khai cục bộ (Sẵn sàng sử dụng)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Triển khai gpt-4.1 hoàn chỉnh với giao diện chat được bao gồm trong repo này**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (Trung cấp)
- **What's Included:**
  - Complete Microsoft Foundry Models deployment (gpt-4.1)
  - Python command-line chat interface
  - Key Vault integration for secure API keys
  - Bicep infrastructure templates
  - Token usage and cost tracking
  - Rate limiting and error handling

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

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (Từ Người mới đến Nâng cao)
- **What's Included:**
  - [Master Guide](container-app/README.md) - Tổng quan hoàn chỉnh về triển khai container
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Ví dụ REST API cơ bản
  - [Microservices Architecture](../../../examples/container-app/microservices) - Triển khai đa dịch vụ sẵn sàng cho sản xuất
  - Quick Start, Production, and Advanced patterns
  - Monitoring, security, and cost optimization

**Bắt đầu nhanh:**
```bash
# Xem hướng dẫn chính
cd examples/container-app

# Triển khai API Flask đơn giản
cd simple-flask-api
azd up

# Triển khai ví dụ về dịch vụ vi mô
cd ../microservices
azd up
```

**Công nghệ:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Triển khai hoàn chỉnh sẵn sàng cho sản xuất được bao gồm trong repo này**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Complexity:** ⭐⭐⭐⭐ (Nâng cao)
- **What's Included:**
  - Complete ARM deployment template
  - Multi-agent architecture (Customer + Inventory)
  - Microsoft Foundry Models integration
  - AI Search with RAG
  - Comprehensive monitoring
  - One-click deployment script

**Bắt đầu nhanh:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Công nghệ:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Azure Samples bên ngoài (Clone để sử dụng)

Các ví dụ sau được duy trì trong các kho Azure-Samples chính thức. Clone chúng để khám phá các kiểu mẫu AZD khác nhau:

### Ứng dụng đơn giản (Chương 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Cục bộ: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Cục bộ: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
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
| **Microsoft Foundry Models Chat** | [Cục bộ: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basic AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Cơ sở dữ liệu & Mẫu nâng cao (Chương 3-8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Mục tiêu học tập

Thông qua việc làm các ví dụ này, bạn sẽ:
- Thực hành các workflow Azure Developer CLI với các kịch bản ứng dụng thực tế
- Hiểu các kiến trúc ứng dụng khác nhau và các triển khai azd của chúng
- Thành thạo các mẫu Infrastructure as Code cho các dịch vụ Azure khác nhau
- Áp dụng quản lý cấu hình và chiến lược triển khai theo môi trường
- Triển khai các mẫu giám sát, bảo mật và mở rộng trong ngữ cảnh thực tế
- Xây dựng kinh nghiệm xử lý sự cố và gỡ lỗi các kịch bản triển khai thực tế

## Kết quả học tập

Khi hoàn thành các ví dụ này, bạn sẽ có thể:
- Triển khai nhiều loại ứng dụng khác nhau bằng Azure Developer CLI một cách tự tin
- Điều chỉnh các mẫu được cung cấp cho yêu cầu ứng dụng của bạn
- Thiết kế và triển khai các mẫu hạ tầng tùy chỉnh bằng Bicep
- Cấu hình các ứng dụng đa dịch vụ phức tạp với các phụ thuộc đúng đắn
- Áp dụng các thực hành tốt nhất về bảo mật, giám sát và hiệu năng trong các kịch bản thực tế
- Xử lý sự cố và tối ưu hóa triển khai dựa trên kinh nghiệm thực tế

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

## Ví dụ Bắt đầu Nhanh

> **💡 Mới làm quen với AZD?** Bắt đầu với ví dụ #1 (Flask API) - mất ~20 phút và dạy các khái niệm cốt lõi.

### Dành cho Người mới
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Cục bộ) ⭐  
   Triển khai một REST API đơn giản với khả năng scale-to-zero  
   **Thời gian:** 20-25 phút | **Chi phí:** $0-5/tháng  
   **Bạn sẽ học:** Workflow azd cơ bản, container hóa, health probes  
   **Kết quả mong đợi:** Endpoint API hoạt động trả về "Hello, World!" với giám sát

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Triển khai ứng dụng web Node.js Express với MongoDB  
   **Thời gian:** 25-35 phút | **Chi phí:** $10-30/tháng  
   **Bạn sẽ học:** Tích hợp cơ sở dữ liệu, biến môi trường, chuỗi kết nối  
   **Kết quả mong đợi:** Ứng dụng danh sách Todo với chức năng tạo/đọc/cập nhật/xóa

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Lưu trữ website tĩnh React với Azure Static Web Apps  
   **Thời gian:** 20-30 phút | **Chi phí:** $0-10/tháng  
   **Bạn sẽ học:** Lưu trữ tĩnh, function serverless, triển khai CDN  
   **Kết quả mong đợi:** Giao diện React với backend API, SSL tự động, CDN toàn cầu

### Dành cho Người dùng Trung cấp
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Cục bộ) ⭐⭐  
   Triển khai gpt-4.1 với giao diện chat và quản lý khóa API an toàn  
   **Thời gian:** 35-45 phút | **Chi phí:** $50-200/tháng  
   **Bạn sẽ học:** Triển khai Microsoft Foundry Models, tích hợp Key Vault, theo dõi token  
   **Kết quả mong đợi:** Ứng dụng chat hoạt động với gpt-4.1 và giám sát chi phí

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Cục bộ) ⭐⭐⭐⭐  
   Kiến trúc đa dịch vụ sẵn sàng cho sản xuất  
   **Thời gian:** 45-60 phút | **Chi phí:** $50-150/tháng  
   **Bạn sẽ học:** Giao tiếp dịch vụ, xếp hàng tin nhắn, theo dõi phân tán  
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
   **Kết quả mong đợi:** Function app phản hồi các yêu cầu HTTP với lưu trữ Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Ứng dụng đa dịch vụ Java với Container Apps và API gateway  
   **Thời gian:** 60-90 phút | **Chi phí:** $80-200/tháng  
   **Bạn sẽ học:** Triển khai Spring Boot, service mesh, cân bằng tải  
   **Kết quả mong đợi:** Hệ thống đa dịch vụ Java với phát hiện dịch vụ và định tuyến

### Mẫu Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Triển khai gpt-4.1 hoàn chỉnh với giao diện chat  
   **Thời gian:** 35-45 phút | **Chi phí:** $50-200/tháng  
   **Kết quả mong đợi:** Ứng dụng chat hoạt động với theo dõi token và giám sát chi phí

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Ứng dụng chat thông minh với kiến trúc RAG  
   **Thời gian:** 60-90 phút | **Chi phí:** $100-300/tháng  
   **Kết quả mong đợi:** Giao diện chat sử dụng RAG với tìm kiếm tài liệu và trích dẫn

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Phân tích tài liệu sử dụng dịch vụ Azure AI  
   **Thời gian:** 40-60 phút | **Chi phí:** $20-80/tháng  
   **Kết quả mong đợi:** API trích xuất văn bản, bảng và thực thể từ tài liệu tải lên

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Quy trình MLOps với Azure Machine Learning  
   **Thời gian:** 2-3 giờ | **Chi phí:** $150-500/tháng  
   **Kết quả mong đợi:** Pipeline ML tự động với huấn luyện, triển khai và giám sát

### Kịch bản Thực tế

#### **Retail Multi-Agent Solution** 🆕
**[Hướng dẫn triển khai hoàn chỉnh](./retail-scenario.md)**

Một giải pháp hỗ trợ khách hàng đa tác nhân toàn diện, sẵn sàng cho sản xuất, minh họa triển khai ứng dụng AI cấp doanh nghiệp với AZD. Kịch bản này cung cấp:
- **Kiến trúc hoàn chỉnh**: Hệ thống đa tác nhân với các tác nhân chuyên trách dịch vụ khách hàng và quản lý tồn kho
- **Hạ tầng sản xuất**: Triển khai Microsoft Foundry Models nhiều khu vực, Azure AI Search, Container Apps và giám sát toàn diện
- **Mẫu ARM sẵn sàng triển khai**: Triển khai một lần nhấp với nhiều chế độ cấu hình (Minimal/Standard/Premium)
- **Tính năng nâng cao**: Xác thực bảo mật red teaming, khung đánh giá tác nhân, tối ưu hóa chi phí và hướng dẫn khắc phục sự cố
- **Ngữ cảnh kinh doanh thực tế**: Trường hợp sử dụng hỗ trợ khách hàng bán lẻ với tải lên tệp, tích hợp tìm kiếm và mở rộng động

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Nâng cao - Sẵn sàng cho sản xuất doanh nghiệp)

**Phù hợp cho**: Nhà phát triển AI, kiến trúc sư giải pháp và các nhóm xây dựng hệ thống đa tác nhân cho môi trường sản xuất

**Bắt đầu nhanh**: Triển khai giải pháp hoàn chỉnh trong dưới 30 phút bằng mẫu ARM kèm theo với `./deploy.sh -g myResourceGroup`

## 📋 Hướng dẫn sử dụng

### Yêu cầu tiên quyết

Trước khi chạy bất kỳ ví dụ nào:
- ✅ Đăng ký Azure với quyền Owner hoặc Contributor
- ✅ Azure Developer CLI đã được cài đặt ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop đang chạy (cho các ví dụ container)
- ✅ Hạn mức Azure phù hợp (kiểm tra yêu cầu cụ thể theo ví dụ)

> **💰 Cảnh báo chi phí:** Tất cả ví dụ tạo tài nguyên Azure thực tế sẽ phát sinh phí. Xem các README riêng lẻ để ước tính chi phí. Nhớ chạy `azd down` khi xong để tránh phát sinh chi phí liên tục.

### Chạy ví dụ cục bộ

1. **Sao chép hoặc copy ví dụ**
   ```bash
   # Đi tới ví dụ mong muốn
   cd examples/simple-web-app
   ```

2. **Khởi tạo môi trường AZD**
   ```bash
   # Khởi tạo bằng mẫu hiện có
   azd init
   
   # Hoặc tạo môi trường mới
   azd env new my-environment
   ```

3. **Cấu hình môi trường**
   ```bash
   # Đặt các biến cần thiết
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Triển khai**
   ```bash
   # Triển khai hạ tầng và ứng dụng
   azd up
   ```

5. **Xác minh triển khai**
   ```bash
   # Lấy các điểm cuối của dịch vụ
   azd env get-values
   
   # Kiểm tra điểm cuối (ví dụ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Chỉ số thành công mong đợi:**
   - ✅ `azd up` hoàn thành mà không có lỗi
   - ✅ Endpoint dịch vụ trả về HTTP 200
   - ✅ Azure Portal hiển thị trạng thái "Running"
   - ✅ Application Insights đang nhận telemetry

> **⚠️ Gặp sự cố?** Xem [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) để khắc phục triển khai

### Thích ứng các ví dụ

Mỗi ví dụ bao gồm:
- **README.md** - Hướng dẫn thiết lập và tùy chỉnh chi tiết
- **azure.yaml** - Cấu hình AZD có chú thích
- **infra/** - Mẫu Bicep với giải thích tham số
- **src/** - Mã ứng dụng mẫu
- **scripts/** - Script hỗ trợ cho các tác vụ thường gặp

## 🎯 Mục tiêu học tập

### Các loại ví dụ

#### **Triển khai cơ bản**
- Ứng dụng dịch vụ đơn
- Mẫu hạ tầng đơn giản
- Quản lý cấu hình cơ bản
- Thiết lập phát triển tiết kiệm chi phí

#### **Kịch bản nâng cao**
- Kiến trúc nhiều dịch vụ
- Cấu hình mạng phức tạp
- Mẫu tích hợp cơ sở dữ liệu
- Thực thi bảo mật và tuân thủ

#### **Mẫu sẵn sàng cho sản xuất**
- Cấu hình độ sẵn sàng cao
- Giám sát và khả năng quan sát
- Tích hợp CI/CD
- Thiết lập phục hồi thảm họa

## 📖 Mô tả ví dụ

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Người mới bắt đầu  
**Concepts**: Triển khai cơ bản, REST API, tích hợp cơ sở dữ liệu NoSQL

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Người mới bắt đầu  
**Concepts**: Lưu trữ tĩnh, backend serverless, phát triển web hiện đại

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Người mới bắt đầu  
**Concepts**: Container hóa, REST API, scale-to-zero, health probes, giám sát  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Nâng cao  
**Concepts**: Kiến trúc đa dịch vụ, giao tiếp giữa dịch vụ, hàng đợi tin nhắn, phân tích theo dõi phân tán  
**Location**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Trung cấp  
**Concepts**: Entity Framework, kết nối cơ sở dữ liệu, phát triển web API

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Trung cấp  
**Concepts**: Kiến trúc hướng sự kiện, điện toán serverless, phát triển full-stack

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Trung cấp  
**Concepts**: Giao tiếp microservices, hệ thống phân tán, mẫu doanh nghiệp

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexity**: Trung cấp  
**Concepts**: Kiến trúc RAG, tìm kiếm vector, tích hợp LLM

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Trung cấp  
**Concepts**: Phân tích tài liệu, OCR, trích xuất dữ liệu

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Nâng cao  
**Concepts**: Huấn luyện mô hình, đường ống triển khai, giám sát

## 🛠 Ví dụ cấu hình

Thư mục `configurations/` chứa các thành phần tái sử dụng:

### Cấu hình môi trường
- Cài đặt môi trường Development
- Cấu hình môi trường Staging
- Cấu hình sẵn sàng cho Production
- Thiết lập triển khai đa khu vực

### Module Bicep
- Thành phần hạ tầng tái sử dụng
- Mẫu tài nguyên phổ biến
- Templates gia cố bảo mật
- Cấu hình tối ưu chi phí

### Script hỗ trợ
- Tự động hóa thiết lập môi trường
- Script di trú cơ sở dữ liệu
- Công cụ xác thực triển khai
- Tiện ích theo dõi chi phí

## 🔧 Hướng dẫn tùy chỉnh

### Thích ứng ví dụ cho trường hợp sử dụng của bạn

1. **Xem lại yêu cầu tiên quyết**
   - Kiểm tra yêu cầu dịch vụ Azure
   - Xác minh giới hạn subscription
   - Hiểu tác động về chi phí

2. **Thay đổi cấu hình**
   - Cập nhật định nghĩa dịch vụ trong `azure.yaml`
   - Tùy chỉnh mẫu Bicep
   - Điều chỉnh biến môi trường

3. **Kiểm tra kỹ lưỡng**
   - Triển khai trước vào môi trường phát triển
   - Xác thực chức năng
   - Kiểm thử mở rộng và hiệu năng

4. **Đánh giá bảo mật**
   - Xem xét kiểm soát truy cập
   - Thực hiện quản lý bí mật
   - Bật giám sát và cảnh báo

## 📊 Ma trận so sánh

| Ví dụ | Dịch vụ | Cơ sở dữ liệu | Xác thực | Giám sát | Độ phức tạp |
|-------|---------|---------------|---------|----------|-------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Đầy đủ | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Cơ bản | Đầy đủ | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Nâng cao | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Cơ bản | Cơ bản | ⭐ |
| React SPA + Functions | 3 | ✅ | Cơ bản | Đầy đủ | ⭐ |
| Python Flask Container | 2 | ❌ | Cơ bản | Đầy đủ | ⭐ |
| C# Web API + SQL | 2 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Đầy đủ | Đầy đủ | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Cơ bản | Đầy đủ | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Đầy đủ | Đầy đủ | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Nâng cao** | **⭐⭐⭐⭐** |

## 🎓 Lộ trình học

### Trình tự đề xuất

1. **Bắt đầu với Simple Web App**
   - Học các khái niệm AZD cơ bản
   - Hiểu quy trình triển khai
   - Thực hành quản lý môi trường

2. **Thử Static Website**
   - Khám phá các tùy chọn lưu trữ khác nhau
   - Tìm hiểu về tích hợp CDN
   - Hiểu cấu hình DNS

3. **Chuyển sang Container App**
   - Học các khái niệm cơ bản về container
   - Hiểu các khái niệm mở rộng
   - Thực hành với Docker

4. **Thêm tích hợp cơ sở dữ liệu**
   - Học cách provision cơ sở dữ liệu
   - Hiểu chuỗi kết nối
   - Thực hành quản lý bí mật

5. **Khám phá Serverless**
   - Hiểu kiến trúc hướng sự kiện
   - Tìm hiểu về triggers và bindings
   - Thực hành với API

6. **Xây dựng Microservices**
   - Học giao tiếp giữa dịch vụ
   - Hiểu hệ thống phân tán
   - Thực hành triển khai phức tạp

## 🔍 Tìm ví dụ phù hợp

### Theo ngăn xếp công nghệ
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Theo mô hình kiến trúc
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Kiến trúc đa tác nhân**: **Retail Multi-Agent Solution**
- **Doanh nghiệp nhiều dịch vụ**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Theo mức độ phức tạp
- **Người mới**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Trung cấp**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Nâng cao**: ML Pipeline
- **Sẵn sàng cho sản xuất doanh nghiệp**: [Microservices (Local)](../../../examples/container-app/microservices) (Nhiều dịch vụ với hàng đợi tin nhắn), **Retail Multi-Agent Solution** (Hệ thống đa tác nhân hoàn chỉnh với mẫu ARM để triển khai)

## 📚 Tài nguyên bổ sung

### Liên kết tài liệu
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Ví dụ cộng đồng
- [Mẫu AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Mẫu Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Thư viện Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Ứng dụng Todo với C# và Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Ứng dụng Todo với Python và MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Ứng dụng Todo với Node.js và PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Ứng dụng Web React với API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Tác vụ Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions với Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Thực tiễn tốt nhất
- [Khung Well-Architected của Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Khung Thích ứng Đám mây](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Góp ví dụ

Bạn có ví dụ hữu ích muốn chia sẻ? Chúng tôi hoan nghênh mọi đóng góp!

### Hướng dẫn gửi bài
1. Tuân theo cấu trúc thư mục đã thiết lập
2. Bao gồm README.md toàn diện
3. Thêm chú thích vào các tệp cấu hình
4. Kiểm tra kỹ lưỡng trước khi gửi
5. Bao gồm ước tính chi phí và các yêu cầu tiên quyết

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

**Mẹo chuyên nghiệp**: Bắt đầu với ví dụ đơn giản nhất phù hợp với ngăn xếp công nghệ của bạn, sau đó dần dần lên tới các kịch bản phức tạp hơn. Mỗi ví dụ xây dựng trên các khái niệm từ các ví dụ trước!

## 🚀 Sẵn sàng bắt đầu?

### Lộ trình học của bạn

1. **Hoàn toàn mới bắt đầu?** → Bắt đầu với [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 phút)
2. **Đã có kiến thức cơ bản về AZD?** → Thử [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 phút)
3. **Xây dựng ứng dụng AI?** → Bắt đầu với [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 phút) hoặc khám phá [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, hơn 2 giờ)
4. **Cần ngăn xếp công nghệ cụ thể?** → Sử dụng [Tìm ví dụ phù hợp](#-finding-the-right-example) mục ở trên

### Các bước tiếp theo

- ✅ Xem lại [Yêu cầu tiên quyết](#yêu-cầu-tiên-quyết) ở trên
- ✅ Chọn một ví dụ phù hợp với trình độ của bạn (xem [Chú giải mức độ phức tạp](#chú-giải-mức-độ-phức-tạp))
- ✅ Đọc kỹ README của ví dụ trước khi triển khai
- ✅ Đặt lời nhắc để chạy `azd down` sau khi kiểm tra
- ✅ Chia sẻ trải nghiệm của bạn thông qua GitHub Issues hoặc Discussions

### Cần trợ giúp?

- 📖 [FAQ](../resources/faq.md) - Các câu hỏi thường gặp được trả lời
- 🐛 [Hướng dẫn khắc phục sự cố](../docs/chapter-07-troubleshooting/common-issues.md) - Khắc phục sự cố triển khai
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Hỏi cộng đồng
- 📚 [Hướng dẫn học tập](../resources/study-guide.md) - Củng cố kiến thức của bạn

---

**Navigation**
- **📚 Trang khoá học**: [AZD dành cho người mới bắt đầu](../README.md)
- **📖 Tài liệu học**: [Hướng dẫn học tập](../resources/study-guide.md) | [Bảng tóm tắt](../resources/cheat-sheet.md) | [Thuật ngữ](../resources/glossary.md)
- **🔧 Tài nguyên**: [FAQ](../resources/faq.md) | [Khắc phục sự cố](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Cập nhật lần cuối: Tháng 11 năm 2025 | [Báo cáo sự cố](https://github.com/microsoft/AZD-for-beginners/issues) | [Góp ví dụ](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ gốc nên được coi là nguồn có thẩm quyền. Đối với các thông tin quan trọng, nên sử dụng bản dịch chuyên nghiệp do người dịch thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->