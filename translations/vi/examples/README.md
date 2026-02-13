# Ví dụ - Mẫu và Cấu hình AZD Thực tế

**Học qua Ví dụ - Sắp xếp theo Chương**
- **📚 Trang Khóa học**: [AZD For Beginners](../README.md)
- **📖 Bản đồ Chương**: Ví dụ được sắp xếp theo độ phức tạp học tập
- **🚀 Ví dụ Cục bộ**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Ví dụ AI Bên Ngoài**: Liên kết đến các kho Azure Samples

> **📍 QUAN TRỌNG: Ví dụ Cục bộ so với Bên ngoài**  
> Kho mã này chứa **4 ví dụ cục bộ hoàn chỉnh** với triển khai đầy đủ:  
> - **Azure OpenAI Chat** (triển khai GPT-4 với giao diện chat)  
> - **Container Apps** (API Flask đơn giản + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Giải pháp AI doanh nghiệp)  
>  
> Các ví dụ bổ sung là **tham chiếu bên ngoài** tới các kho Azure-Samples mà bạn có thể clone.

## Giới thiệu

Thư mục này cung cấp các ví dụ thực tế và các tham chiếu để giúp bạn học Azure Developer CLI thông qua thực hành. Kịch bản Retail Multi-Agent là một triển khai hoàn chỉnh, sẵn sàng cho sản xuất và được bao gồm trong kho này. Các ví dụ bổ sung tham chiếu các Azure Samples chính thức minh họa các mẫu AZD khác nhau.

### Huy hiệu Đánh giá Độ phức tạp

- ⭐ **Người mới** - Khái niệm cơ bản, dịch vụ đơn, 15-30 phút
- ⭐⭐ **Trung cấp** - Nhiều dịch vụ, tích hợp cơ sở dữ liệu, 30-60 phút
- ⭐⭐⭐ **Nâng cao** - Kiến trúc phức tạp, tích hợp AI, 1-2 giờ
- ⭐⭐⭐⭐ **Chuyên gia** - Sẵn sàng cho sản xuất, mẫu doanh nghiệp, 2+ giờ

## 🎯 Những gì thực sự có trong Kho mã này

### ✅ Triển khai Cục bộ (Sẵn sàng sử dụng)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**Triển khai GPT-4 hoàn chỉnh với giao diện chat được bao gồm trong repo này**

- **Vị trí:** `examples/azure-openai-chat/`
- **Độ phức tạp:** ⭐⭐ (Trung cấp)
- **Những gì được bao gồm:**
  - Triển khai Azure OpenAI hoàn chỉnh (GPT-4)
  - Giao diện chat dòng lệnh Python
  - Tích hợp Key Vault để bảo mật khóa API
  - Mẫu hạ tầng Bicep
  - Theo dõi sử dụng token và chi phí
  - Giới hạn tần suất và xử lý lỗi

**Bắt đầu nhanh:**
```bash
# Đi đến ví dụ
cd examples/azure-openai-chat

# Triển khai mọi thứ
azd up

# Cài đặt các phụ thuộc và bắt đầu trò chuyện
pip install -r src/requirements.txt
python src/chat.py
```

**Công nghệ:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Các ví dụ triển khai container toàn diện được bao gồm trong repo này**

- **Vị trí:** `examples/container-app/`
- **Độ phức tạp:** ⭐-⭐⭐⭐⭐ (Từ Người mới đến Chuyên gia)
- **Những gì được bao gồm:**
  - [Master Guide](container-app/README.md) - Tổng quan hoàn chỉnh về triển khai container
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Ví dụ REST API cơ bản
  - [Microservices Architecture](../../../examples/container-app/microservices) - Triển khai đa dịch vụ sẵn sàng cho sản xuất
  - Bắt đầu nhanh, Mẫu sản xuất và Nâng cao
  - Giám sát, bảo mật và tối ưu hóa chi phí

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
**Triển khai sẵn sàng cho sản xuất hoàn chỉnh được bao gồm trong repo này**

- **Vị trí:** `examples/retail-multiagent-arm-template/`
- **Độ phức tạp:** ⭐⭐⭐⭐ (Nâng cao)
- **Những gì được bao gồm:**
  - Mẫu triển khai ARM hoàn chỉnh
  - Kiến trúc đa tác nhân (Khách hàng + Hàng tồn kho)
  - Tích hợp Azure OpenAI
  - AI Search với RAG
  - Giám sát toàn diện
  - Kịch bản triển khai một lần nhấn

**Bắt đầu nhanh:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Công nghệ:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Azure Samples Bên Ngoài (Clone để Sử dụng)

Các ví dụ sau được duy trì trong các kho chính thức Azure-Samples. Clone chúng để khám phá các mẫu AZD khác nhau:

### Ứng dụng Đơn giản (Chương 1-2)

| Mẫu | Kho lưu trữ | Độ phức tạp | Dịch vụ |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Cục bộ: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Cục bộ: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Đa dịch vụ, Service Bus, Cosmos DB, SQL |
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

| Mẫu | Kho lưu trữ | Độ phức tạp | Trọng tâm |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Cục bộ: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Triển khai GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat AI cơ bản |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Khung tác nhân |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Mẫu RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI doanh nghiệp |

### Cơ sở dữ liệu & Mẫu nâng cao (Chương 3-8)

| Mẫu | Kho lưu trữ | Độ phức tạp | Trọng tâm |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Tích hợp cơ sở dữ liệu |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Đa dịch vụ |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Mục tiêu học tập

Bằng cách làm theo các ví dụ này, bạn sẽ:
- Thực hành các luồng công việc Azure Developer CLI với các kịch bản ứng dụng thực tế
- Hiểu các kiến trúc ứng dụng khác nhau và cách triển khai chúng bằng azd
- Làm chủ các mẫu Hạ tầng như Mã cho các dịch vụ Azure khác nhau
- Áp dụng quản lý cấu hình và chiến lược triển khai theo môi trường
- Triển khai các mẫu giám sát, bảo mật và mở rộng trong bối cảnh thực tế
- Xây dựng kinh nghiệm gỡ rối và debug các kịch bản triển khai thực tế

## Kết quả học tập

Sau khi hoàn thành các ví dụ này, bạn sẽ có thể:
- Triển khai các loại ứng dụng khác nhau bằng Azure Developer CLI một cách tự tin
- Thích ứng các mẫu được cung cấp với yêu cầu ứng dụng của riêng bạn
- Thiết kế và triển khai các mẫu hạ tầng tùy chỉnh bằng Bicep
- Cấu hình các ứng dụng đa dịch vụ phức tạp với các phụ thuộc phù hợp
- Áp dụng các thực hành tốt về bảo mật, giám sát và hiệu suất trong các kịch bản thực tế
- Gỡ rối và tối ưu hóa các triển khai dựa trên kinh nghiệm thực hành

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

> **💡 Mới với AZD?** Bắt đầu với ví dụ #1 (Flask API) - mất ~20 phút và dạy các khái niệm cốt lõi.

### Dành cho Người mới
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Cục bộ) ⭐  
   Triển khai một REST API đơn giản với khả năng scale-to-zero  
   **Thời gian:** 20-25 phút | **Chi phí:** $0-5/tháng  
   **Bạn sẽ học:** Luồng công việc azd cơ bản, đóng gói container, health probes  
   **Kết quả mong đợi:** Endpoint API hoạt động trả về "Hello, World!" kèm giám sát

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Triển khai ứng dụng web Node.js Express với MongoDB  
   **Thời gian:** 25-35 phút | **Chi phí:** $10-30/tháng  
   **Bạn sẽ học:** Tích hợp cơ sở dữ liệu, biến môi trường, chuỗi kết nối  
   **Kết quả mong đợi:** Ứng dụng Todo với chức năng tạo/đọc/cập nhật/xóa

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Lưu trữ trang web tĩnh React với Azure Static Web Apps  
   **Thời gian:** 20-30 phút | **Chi phí:** $0-10/tháng  
   **Bạn sẽ học:** Lưu trữ tĩnh, hàm serverless, triển khai CDN  
   **Kết quả mong đợi:** Giao diện React với backend API, SSL tự động, CDN toàn cầu

### Dành cho Người dùng Trung cấp
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Cục bộ) ⭐⭐  
   Triển khai GPT-4 với giao diện chat và quản lý khóa API an toàn  
   **Thời gian:** 35-45 phút | **Chi phí:** $50-200/tháng  
   **Bạn sẽ học:** Triển khai Azure OpenAI, tích hợp Key Vault, theo dõi token  
   **Kết quả mong đợi:** Ứng dụng chat hoạt động với GPT-4 và giám sát chi phí

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Cục bộ) ⭐⭐⭐⭐  
   Kiến trúc đa dịch vụ sẵn sàng cho sản xuất  
   **Thời gian:** 45-60 phút | **Chi phí:** $50-150/tháng  
   **Bạn sẽ học:** Giao tiếp dịch vụ, hàng đợi tin nhắn, tracing phân tán  
   **Kết quả mong đợi:** Hệ thống 2 dịch vụ (API Gateway + Product Service) có giám sát

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Ứng dụng web với API C# và Azure SQL Database  
   **Thời gian:** 30-45 phút | **Chi phí:** $20-80/tháng  
   **Bạn sẽ học:** Entity Framework, migration cơ sở dữ liệu, bảo mật kết nối  
   **Kết quả mong đợi:** API C# với backend Azure SQL, triển khai schema tự động

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions với trigger HTTP và Cosmos DB  
   **Thời gian:** 30-40 phút | **Chi phí:** $10-40/tháng  
   **Bạn sẽ học:** Kiến trúc hướng sự kiện, scale serverless, tích hợp NoSQL  
   **Kết quả mong đợi:** Function app phản hồi yêu cầu HTTP với lưu trữ Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Ứng dụng Java đa dịch vụ với Container Apps và API gateway  
   **Thời gian:** 60-90 phút | **Chi phí:** $80-200/tháng  
   **Bạn sẽ học:** Triển khai Spring Boot, service mesh, cân bằng tải  
   **Kết quả mong đợi:** Hệ thống đa dịch vụ Java với khám phá dịch vụ và định tuyến

### Mẫu Microsoft Foundry

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Triển khai GPT-4 hoàn chỉnh với giao diện chat  
   **Thời gian:** 35-45 phút | **Chi phí:** $50-200/tháng  
   **Kết quả mong đợi:** Ứng dụng chat hoạt động với theo dõi token và giám sát chi phí

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Ứng dụng chat thông minh với kiến trúc RAG  
   **Thời gian:** 60-90 phút | **Chi phí:** $100-300/tháng  
   **Kết quả mong đợi:** Giao diện chat RAG với tìm kiếm tài liệu và trích dẫn

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Phân tích tài liệu sử dụng dịch vụ Azure AI  
   **Thời gian:** 40-60 phút | **Chi phí:** $20-80/tháng  
   **Kết quả mong đợi:** API trích xuất văn bản, bảng và thực thể từ tài liệu tải lên

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Luồng công việc MLOps với Azure Machine Learning  
   **Thời gian:** 2-3 giờ | **Chi phí:** $150-500/tháng  
   **Kết quả mong đợi:** Pipeline ML tự động với huấn luyện, triển khai và giám sát

### Kịch bản Thực tế

#### **Retail Multi-Agent Solution** 🆕
**[Hướng dẫn Triển khai Hoàn chỉnh](./retail-scenario.md)**

Một giải pháp hỗ trợ khách hàng đa tác nhân toàn diện, sẵn sàng cho sản xuất, minh họa triển khai ứng dụng AI cấp doanh nghiệp với AZD. Kịch bản này cung cấp:

- **Kiến trúc Hoàn chỉnh**: Hệ thống đa tác nhân với các tác nhân chuyên trách dịch vụ khách hàng và quản lý hàng tồn kho
- **Hạ tầng Sản xuất**: Triển khai Azure OpenAI đa vùng, Azure AI Search, Container Apps, và giám sát toàn diện
- **Mẫu ARM sẵn sàng triển khai**: Triển khai một lần nhấp với nhiều chế độ cấu hình (Minimal/Standard/Premium)
- **Tính năng Nâng cao**: Xác thực an ninh red teaming, khung đánh giá agent, tối ưu hóa chi phí, và hướng dẫn xử lý sự cố
- **Bối cảnh Kinh doanh Thực tế**: Trường hợp hỗ trợ khách hàng cho nhà bán lẻ với tải lên tệp, tích hợp tìm kiếm, và mở rộng động

**Công nghệ**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Độ phức tạp**: ⭐⭐⭐⭐ (Nâng cao - Sẵn sàng cho môi trường sản xuất doanh nghiệp)

**Phù hợp cho**: Nhà phát triển AI, kiến trúc sư giải pháp, và các đội xây dựng hệ thống đa-agent cho môi trường sản xuất

**Bắt đầu Nhanh**: Triển khai toàn bộ giải pháp trong dưới 30 phút bằng mẫu ARM kèm theo với `./deploy.sh -g myResourceGroup`

## 📋 Hướng dẫn Sử dụng

### Yêu cầu tiên quyết

Trước khi chạy bất kỳ ví dụ nào:
- ✅ Đăng ký Azure với quyền Owner hoặc Contributor
- ✅ Đã cài đặt Azure Developer CLI ([Hướng dẫn cài đặt](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop đang chạy (cho ví dụ container)
- ✅ Hạn mức Azure phù hợp (kiểm tra yêu cầu cụ thể cho từng ví dụ)

> **💰 Cảnh báo Chi phí:** Tất cả các ví dụ tạo tài nguyên Azure thực tế gây phát sinh chi phí. Xem các README riêng lẻ để biết ước tính chi phí. Hãy nhớ chạy `azd down` khi xong để tránh chi phí liên tục.

### Chạy các Ví dụ trên Máy cục bộ

1. **Sao chép hoặc Nhân bản Ví dụ**
   ```bash
   # Đi đến ví dụ mong muốn
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
   # Đặt các biến bắt buộc
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
   # Lấy các điểm cuối của dịch vụ
   azd env get-values
   
   # Kiểm tra điểm cuối (ví dụ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Chỉ số Thành công Mong đợi:**
   - ✅ `azd up` hoàn tất mà không có lỗi
   - ✅ Điểm cuối dịch vụ trả về HTTP 200
   - ✅ Azure Portal hiển thị trạng thái "Running"
   - ✅ Application Insights nhận được telemetry

> **⚠️ Gặp sự cố?** Xem [Các Sự cố Thường Gặp](../docs/chapter-07-troubleshooting/common-issues.md) để khắc phục triển khai

### Tùy chỉnh Ví dụ

Mỗi ví dụ bao gồm:
- **README.md** - Hướng dẫn thiết lập và tùy chỉnh chi tiết
- **azure.yaml** - Cấu hình AZD kèm chú thích
- **infra/** - Mẫu Bicep với giải thích tham số
- **src/** - Mã ứng dụng mẫu
- **scripts/** - Script trợ giúp cho các tác vụ phổ biến

## 🎯 Mục tiêu Học tập

### Các Loại Ví dụ

#### **Triển khai Cơ bản**
- Ứng dụng đơn dịch vụ
- Mô hình hạ tầng đơn giản
- Quản lý cấu hình cơ bản
- Thiết lập phát triển tiết kiệm chi phí

#### **Kịch bản Nâng cao**
- Kiến trúc nhiều dịch vụ
- Cấu hình mạng phức tạp
- Mẫu tích hợp cơ sở dữ liệu
- Triển khai bảo mật và tuân thủ

#### **Mẫu Sẵn sàng cho Sản xuất**
- Cấu hình độ sẵn sàng cao
- Giám sát và quan sát
- Tích hợp CI/CD
- Thiết lập khôi phục thảm họa

## 📖 Mô tả Ví dụ

### Ứng dụng Web Đơn giản - Node.js Express
**Công nghệ**: Node.js, Express, MongoDB, Container Apps  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Triển khai cơ bản, REST API, tích hợp cơ sở dữ liệu NoSQL

### Trang Tĩnh - React SPA
**Công nghệ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Lưu trữ tĩnh, backend serverless, phát triển web hiện đại

### Container App - Python Flask
**Công nghệ**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Container hóa, REST API, scale-to-zero, health probes, giám sát  
**Vị trí**: [Ví dụ cục bộ](../../../examples/container-app/simple-flask-api)

### Container App - Kiến trúc Microservices
**Công nghệ**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Độ phức tạp**: Nâng cao  
**Khái niệm**: Kiến trúc nhiều dịch vụ, giao tiếp dịch vụ, hàng đợi tin nhắn, theo dõi phân tán  
**Vị trí**: [Ví dụ cục bộ](../../../examples/container-app/microservices)

### Ứng dụng Cơ sở dữ liệu - C# với Azure SQL
**Công nghệ**: C# ASP.NET Core, Azure SQL Database, App Service  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Entity Framework, kết nối cơ sở dữ liệu, phát triển web API

### Hàm Serverless - Python Azure Functions
**Công nghệ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Kiến trúc hướng sự kiện, điện toán serverless, phát triển full-stack

### Microservices - Java Spring Boot
**Công nghệ**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Giao tiếp microservices, hệ thống phân tán, mẫu doanh nghiệp

### Ví dụ Microsoft Foundry

#### Ứng dụng Chat Azure OpenAI
**Công nghệ**: Azure OpenAI, Cognitive Search, App Service  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Kiến trúc RAG, tìm kiếm vector, tích hợp LLM

#### Xử lý Tài liệu bằng AI
**Công nghệ**: Azure AI Document Intelligence, Storage, Functions  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Phân tích tài liệu, OCR, trích xuất dữ liệu

#### Pipeline Machine Learning
**Công nghệ**: Azure ML, MLOps, Container Registry  
**Độ phức tạp**: Nâng cao  
**Khái niệm**: Huấn luyện mô hình, pipeline triển khai, giám sát

## 🛠 Ví dụ Cấu hình

The `configurations/` directory contains reusable components:

### Cấu hình Môi trường
- Cài đặt môi trường Development
- Cấu hình môi trường Staging
- Cấu hình sẵn sàng cho Production
- Thiết lập triển khai đa vùng

### Mô-đun Bicep
- Thành phần hạ tầng có thể tái sử dụng
- Mẫu tài nguyên chung
- Mẫu tăng cường bảo mật
- Cấu hình tối ưu chi phí

### Script Trợ giúp
- Tự động thiết lập môi trường
- Script di trú cơ sở dữ liệu
- Công cụ xác thực triển khai
- Tiện ích giám sát chi phí

## 🔧 Hướng dẫn Tùy chỉnh

### Tùy chỉnh Ví dụ cho Trường hợp Sử dụng của Bạn

1. **Kiểm tra Yêu cầu tiên quyết**
   - Kiểm tra yêu cầu dịch vụ Azure
   - Xác minh giới hạn thuê bao
   - Hiểu rõ tác động về chi phí

2. **Sửa Cấu hình**
   - Cập nhật định nghĩa dịch vụ trong `azure.yaml`
   - Tùy chỉnh các mẫu Bicep
   - Điều chỉnh biến môi trường

3. **Kiểm tra Kỹ lưỡng**
   - Triển khai trước ở môi trường development
   - Xác thực chức năng
   - Kiểm tra khả năng mở rộng và hiệu năng

4. **Rà soát Bảo mật**
   - Rà soát quyền truy cập
   - Triển khai quản lý bí mật
   - Bật giám sát và cảnh báo

## 📊 Bảng So sánh

| Ví dụ | Dịch vụ | Cơ sở dữ liệu | Xác thực | Giám sát | Độ phức tạp |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Cục bộ) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Cục bộ) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Cục bộ) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Cục bộ) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Lộ trình Học tập

### Trình tự Đề xuất

1. **Bắt đầu với Ứng dụng Web Đơn giản**
   - Học các khái niệm cơ bản của AZD
   - Hiểu quy trình triển khai
   - Thực hành quản lý môi trường

2. **Thử Trang Tĩnh**
   - Khám phá các tùy chọn lưu trữ khác nhau
   - Tìm hiểu về tích hợp CDN
   - Hiểu cấu hình DNS

3. **Chuyển sang Container App**
   - Học cơ bản về containerization
   - Hiểu các khái niệm mở rộng
   - Thực hành với Docker

4. **Thêm Tích hợp Cơ sở dữ liệu**
   - Học cách cấp phát cơ sở dữ liệu
   - Hiểu chuỗi kết nối
   - Thực hành quản lý bí mật

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
- **C#**: [Microservices Order Service (Cục bộ)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Cục bộ)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Cục bộ)](../../../examples/container-app/simple-flask-api), [Microservices (Cục bộ)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Cục bộ)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Cục bộ)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Cục bộ)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Cục bộ)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Theo Mô hình Kiến trúc
- **Simple REST API**: [Python Flask API (Cục bộ)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Cục bộ)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Cục bộ)](../../../examples/container-app/simple-flask-api), [Microservices (Cục bộ)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Cục bộ)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Cục bộ)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Theo Mức Độ Phức tạp
- **Người mới bắt đầu**: [Python Flask API (Cục bộ)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Trung cấp**: **[Azure OpenAI Chat (Cục bộ)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Nâng cao**: ML Pipeline
- **Sẵn sàng cho Sản xuất Doanh nghiệp**: [Microservices (Cục bộ)](../../../examples/container-app/microservices) (Nhiều dịch vụ với hàng đợi tin nhắn), **Retail Multi-Agent Solution** (Hệ thống đa-agent hoàn chỉnh với triển khai mẫu ARM)

## 📚 Tài nguyên Bổ sung

### Liên kết Tài liệu
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Ví dụ Cộng đồng
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Ứng dụng Todo với Node.js và PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Ứng dụng web React với API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Tác vụ Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions với Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Các thực hành tốt nhất
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Đóng góp Ví dụ

Bạn có ví dụ hữu ích muốn chia sẻ không? Chúng tôi hoan nghênh mọi đóng góp!

### Hướng dẫn gửi bài
1. Tuân theo cấu trúc thư mục đã được thiết lập
2. Bao gồm README.md chi tiết
3. Thêm chú thích vào các tệp cấu hình
4. Kiểm tra kỹ trước khi gửi
5. Bao gồm ước tính chi phí và các yêu cầu tiên quyết

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

**Mẹo chuyên gia**: Bắt đầu với ví dụ đơn giản nhất phù hợp với ngăn xếp công nghệ của bạn, sau đó từ từ nâng dần lên các kịch bản phức tạp hơn. Mỗi ví dụ xây dựng dựa trên các khái niệm từ các ví dụ trước!

## 🚀 Sẵn sàng bắt đầu?

### Lộ trình học của bạn

1. **Bạn hoàn toàn mới?** → Bắt đầu với [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 phút)
2. **Đã có kiến thức cơ bản về AZD?** → Thử [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 phút)
3. **Xây dựng ứng dụng AI?** → Bắt đầu với [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 phút) hoặc khám phá [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, hơn 2 giờ)
4. **Cần ngăn xếp công nghệ cụ thể?** → Sử dụng phần [Tìm ví dụ phù hợp](../../../examples) ở trên

### Bước tiếp theo

- ✅ Xem lại [Yêu cầu tiên quyết](../../../examples) ở trên
- ✅ Chọn một ví dụ phù hợp với trình độ của bạn (xem [Chú giải độ phức tạp](../../../examples))
- ✅ Đọc kỹ README của ví dụ trước khi triển khai
- ✅ Đặt lời nhắc để chạy `azd down` sau khi thử nghiệm
- ✅ Chia sẻ trải nghiệm của bạn qua GitHub Issues hoặc Discussions

### Cần trợ giúp?

- 📖 [FAQ](../resources/faq.md) - Các câu hỏi thường gặp
- 🐛 [Hướng dẫn khắc phục sự cố](../docs/chapter-07-troubleshooting/common-issues.md) - Sửa các vấn đề triển khai
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Hỏi cộng đồng
- 📚 [Hướng dẫn học](../resources/study-guide.md) - Củng cố kiến thức của bạn

---

**Điều hướng**
- **📚 Trang khóa học**: [AZD For Beginners](../README.md)
- **📖 Tài liệu học**: [Hướng dẫn học](../resources/study-guide.md) | [Tóm tắt](../resources/cheat-sheet.md) | [Thuật ngữ](../resources/glossary.md)
- **🔧 Tài nguyên**: [FAQ](../resources/faq.md) | [Khắc phục sự cố](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Cập nhật lần cuối: Tháng 11 năm 2025 | [Báo cáo lỗi](https://github.com/microsoft/AZD-for-beginners/issues) | [Đóng góp ví dụ](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Văn bản gốc bằng ngôn ngữ gốc của tài liệu nên được coi là nguồn chính thức. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->