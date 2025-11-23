<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-22T08:19:02+00:00",
  "source_file": "examples/README.md",
  "language_code": "vi"
}
-->
# Ví dụ - Mẫu và Cấu hình AZD Thực tiễn

**Học qua ví dụ - Sắp xếp theo chương**
- **📚 Trang chủ khóa học**: [AZD Cho Người Mới Bắt Đầu](../README.md)
- **📖 Sơ đồ chương**: Các ví dụ được sắp xếp theo độ phức tạp học tập
- **🚀 Ví dụ cục bộ**: [Giải pháp Đa Đại lý Bán lẻ](retail-scenario.md)
- **🤖 Ví dụ AI bên ngoài**: Liên kết đến kho mẫu Azure Samples

> **📍 QUAN TRỌNG: Ví dụ cục bộ và bên ngoài**  
> Kho này chứa **4 ví dụ cục bộ hoàn chỉnh** với các triển khai đầy đủ:  
> - **Azure OpenAI Chat** (Triển khai GPT-4 với giao diện trò chuyện)  
> - **Container Apps** (API Flask đơn giản + Microservices)  
> - **Ứng dụng Cơ sở dữ liệu** (Web + Cơ sở dữ liệu SQL)  
> - **Đa Đại lý Bán lẻ** (Giải pháp AI Doanh nghiệp)  
>  
> Các ví dụ bổ sung là **tham khảo bên ngoài** đến các kho Azure-Samples mà bạn có thể sao chép.

## Giới thiệu

Thư mục này cung cấp các ví dụ thực tiễn và tham khảo để giúp bạn học Azure Developer CLI thông qua thực hành. Kịch bản Đa Đại lý Bán lẻ là một triển khai hoàn chỉnh, sẵn sàng sản xuất được bao gồm trong kho này. Các ví dụ bổ sung tham khảo các mẫu chính thức của Azure để minh họa các mô hình AZD khác nhau.

### Huyền thoại Đánh giá Độ phức tạp

- ⭐ **Người mới bắt đầu** - Khái niệm cơ bản, dịch vụ đơn, 15-30 phút
- ⭐⭐ **Trung cấp** - Nhiều dịch vụ, tích hợp cơ sở dữ liệu, 30-60 phút
- ⭐⭐⭐ **Nâng cao** - Kiến trúc phức tạp, tích hợp AI, 1-2 giờ
- ⭐⭐⭐⭐ **Chuyên gia** - Sẵn sàng sản xuất, mô hình doanh nghiệp, 2+ giờ

## 🎯 Nội dung thực sự trong kho này

### ✅ Triển khai cục bộ (Sẵn sàng sử dụng)

#### [Ứng dụng Trò chuyện Azure OpenAI](azure-openai-chat/README.md) 🆕
**Triển khai GPT-4 hoàn chỉnh với giao diện trò chuyện được bao gồm trong kho này**

- **Vị trí:** `examples/azure-openai-chat/`
- **Độ phức tạp:** ⭐⭐ (Trung cấp)
- **Nội dung bao gồm:**
  - Triển khai Azure OpenAI hoàn chỉnh (GPT-4)
  - Giao diện trò chuyện dòng lệnh Python
  - Tích hợp Key Vault để bảo mật khóa API
  - Mẫu hạ tầng Bicep
  - Theo dõi sử dụng token và chi phí
  - Giới hạn tốc độ và xử lý lỗi

**Bắt đầu nhanh:**
```bash
# Điều hướng đến ví dụ
cd examples/azure-openai-chat

# Triển khai mọi thứ
azd up

# Cài đặt các phụ thuộc và bắt đầu trò chuyện
pip install -r src/requirements.txt
python src/chat.py
```

**Công nghệ:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Ví dụ Container App](container-app/README.md) 🆕
**Ví dụ triển khai container toàn diện được bao gồm trong kho này**

- **Vị trí:** `examples/container-app/`
- **Độ phức tạp:** ⭐-⭐⭐⭐⭐ (Người mới bắt đầu đến Chuyên gia)
- **Nội dung bao gồm:**
  - [Hướng dẫn chính](container-app/README.md) - Tổng quan đầy đủ về triển khai container
  - [API Flask đơn giản](../../../examples/container-app/simple-flask-api) - Ví dụ API REST cơ bản
  - [Kiến trúc Microservices](../../../examples/container-app/microservices) - Triển khai đa dịch vụ sẵn sàng sản xuất
  - Mô hình Bắt đầu nhanh, Sản xuất và Nâng cao
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

#### [Giải pháp Đa Đại lý Bán lẻ](retail-scenario.md) 🆕
**Triển khai sẵn sàng sản xuất hoàn chỉnh được bao gồm trong kho này**

- **Vị trí:** `examples/retail-multiagent-arm-template/`
- **Độ phức tạp:** ⭐⭐⭐⭐ (Nâng cao)
- **Nội dung bao gồm:**
  - Mẫu triển khai ARM hoàn chỉnh
  - Kiến trúc đa đại lý (Khách hàng + Hàng tồn kho)
  - Tích hợp Azure OpenAI
  - Tìm kiếm AI với RAG
  - Giám sát toàn diện
  - Script triển khai một lần nhấp

**Bắt đầu nhanh:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Công nghệ:** Azure OpenAI, Tìm kiếm AI, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Mẫu Azure bên ngoài (Sao chép để sử dụng)

Các ví dụ sau được duy trì trong các kho chính thức của Azure-Samples. Sao chép chúng để khám phá các mô hình AZD khác nhau:

### Ứng dụng đơn giản (Chương 1-2)

| Mẫu | Kho | Độ phức tạp | Dịch vụ |
|:---------|:-----------|:-----------|:---------|
| **API Flask Python** | [Cục bộ: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Cục bộ: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Đa dịch vụ, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Container Flask Python** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cách sử dụng:**
```bash
# Sao chép bất kỳ ví dụ nào
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Triển khai
azd up
```

### Ví dụ Ứng dụng AI (Chương 2, 5, 8)

| Mẫu | Kho | Độ phức tạp | Trọng tâm |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Cục bộ: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Triển khai GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Trò chuyện AI cơ bản |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Khung đại lý |
| **Demo Tìm kiếm + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Mô hình RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI Doanh nghiệp |

### Cơ sở dữ liệu & Mô hình Nâng cao (Chương 3-8)

| Mẫu | Kho | Độ phức tạp | Trọng tâm |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Tích hợp cơ sở dữ liệu |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Đa dịch vụ |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Mục tiêu học tập

Bằng cách làm việc qua các ví dụ này, bạn sẽ:
- Thực hành quy trình làm việc Azure Developer CLI với các kịch bản ứng dụng thực tế
- Hiểu các kiến trúc ứng dụng khác nhau và triển khai AZD của chúng
- Thành thạo các mô hình Infrastructure as Code cho các dịch vụ Azure khác nhau
- Áp dụng quản lý cấu hình và chiến lược triển khai theo môi trường cụ thể
- Triển khai các mô hình giám sát, bảo mật và mở rộng trong các ngữ cảnh thực tiễn
- Xây dựng kinh nghiệm với việc khắc phục sự cố và gỡ lỗi các kịch bản triển khai thực tế

## Kết quả học tập

Sau khi hoàn thành các ví dụ này, bạn sẽ có thể:
- Triển khai các loại ứng dụng khác nhau bằng Azure Developer CLI một cách tự tin
- Điều chỉnh các mẫu được cung cấp theo yêu cầu ứng dụng của riêng bạn
- Thiết kế và triển khai các mô hình hạ tầng tùy chỉnh bằng Bicep
- Cấu hình các ứng dụng đa dịch vụ phức tạp với các phụ thuộc phù hợp
- Áp dụng các thực tiễn tốt nhất về bảo mật, giám sát và hiệu suất trong các kịch bản thực tế
- Khắc phục sự cố và tối ưu hóa triển khai dựa trên kinh nghiệm thực tế

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

## Ví dụ Bắt đầu nhanh

> **💡 Mới với AZD?** Bắt đầu với ví dụ #1 (API Flask) - mất khoảng 20 phút và dạy các khái niệm cốt lõi.

### Dành cho Người mới bắt đầu
1. **[Container App - API Flask Python](../../../examples/container-app/simple-flask-api)** (Cục bộ) ⭐  
   Triển khai một API REST đơn giản với scale-to-zero  
   **Thời gian:** 20-25 phút | **Chi phí:** $0-5/tháng  
   **Bạn sẽ học:** Quy trình làm việc azd cơ bản, container hóa, kiểm tra sức khỏe  
   **Kết quả mong đợi:** Endpoint API hoạt động trả về "Hello, World!" với giám sát

2. **[Ứng dụng Web đơn giản - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Triển khai một ứng dụng web Node.js Express với MongoDB  
   **Thời gian:** 25-35 phút | **Chi phí:** $10-30/tháng  
   **Bạn sẽ học:** Tích hợp cơ sở dữ liệu, biến môi trường, chuỗi kết nối  
   **Kết quả mong đợi:** Ứng dụng danh sách việc cần làm với chức năng tạo/đọc/cập nhật/xóa

3. **[Trang web tĩnh - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Lưu trữ một trang web tĩnh React với Azure Static Web Apps  
   **Thời gian:** 20-30 phút | **Chi phí:** $0-10/tháng  
   **Bạn sẽ học:** Lưu trữ tĩnh, chức năng serverless, triển khai CDN  
   **Kết quả mong đợi:** Giao diện React với backend API, SSL tự động, CDN toàn cầu

### Dành cho Người dùng Trung cấp
4. **[Ứng dụng Trò chuyện Azure OpenAI](../../../examples/azure-openai-chat)** (Cục bộ) ⭐⭐  
   Triển khai GPT-4 với giao diện trò chuyện và quản lý khóa API bảo mật  
   **Thời gian:** 35-45 phút | **Chi phí:** $50-200/tháng  
   **Bạn sẽ học:** Triển khai Azure OpenAI, tích hợp Key Vault, theo dõi token  
   **Kết quả mong đợi:** Ứng dụng trò chuyện hoạt động với GPT-4 và giám sát chi phí

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Cục bộ) ⭐⭐⭐⭐  
   Kiến trúc đa dịch vụ sẵn sàng sản xuất  
   **Thời gian:** 45-60 phút | **Chi phí:** $50-150/tháng  
   **Bạn sẽ học:** Giao tiếp dịch vụ, xếp hàng tin nhắn, theo dõi phân tán  
   **Kết quả mong đợi:** Hệ thống 2 dịch vụ (API Gateway + Product Service) với giám sát

6. **[Ứng dụng Cơ sở dữ liệu - C# với Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Ứng dụng web với API C# và Cơ sở dữ liệu Azure SQL  
   **Thời gian:** 30-45 phút | **Chi phí:** $20-80/tháng  
   **Bạn sẽ học:** Entity Framework, di chuyển cơ sở dữ liệu, bảo mật kết nối  
   **Kết quả mong đợi:** API C# với backend Azure SQL, triển khai schema tự động

7. **[Chức năng Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions với triggers HTTP và Cosmos DB  
   **Thời gian:** 30-40 phút | **Chi phí:** $10-40/tháng  
   **Bạn sẽ học:** Kiến trúc dựa trên sự kiện, mở rộng serverless, tích hợp NoSQL  
   **Kết quả mong đợi:** Ứng dụng chức năng phản hồi yêu cầu HTTP với lưu trữ Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Ứng dụng Java đa dịch vụ với Container Apps và API gateway  
   **Thời gian:** 60-90 phút | **Chi phí:** $80-200/tháng  
   **Bạn sẽ học:** Triển khai Spring Boot, mesh dịch vụ, cân bằng tải  
   **Kết quả mong đợi:** Hệ thống Java đa dịch vụ với khám phá dịch vụ và định tuyến

### Mẫu Azure AI Foundry

1. **[Ứng dụng Trò chuyện Azure OpenAI - Ví dụ Cục bộ](../../../examples/azure-openai-chat)** ⭐⭐  
   Triển khai GPT-4 hoàn chỉnh với giao diện trò chuyện  
   **Thời gian:** 35-45 phút | **Chi phí:** $50-200/tháng  
   **Kết quả mong đợi:** Ứng dụng trò chuyện hoạt động với theo dõi token và giám sát chi phí

2. **[Demo Tìm kiếm + OpenAI Azure](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Ứng dụng trò chuyện thông minh với kiến trúc RAG  
   **Thời gian:** 60-90 phút | **Chi phí:** $100-300/tháng  
   **Kết quả mong đợi:** Giao diện trò chuyện RAG với tìm kiếm tài liệu và trích dẫn

3. **[Xử lý Tài liệu AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Phân tích tài liệu bằng các dịch vụ AI Azure  
   **Thời gian:** 40-60 phút | **Chi phí:** $20-80/tháng  
   **Kết quả mong đợi:** API trích xuất văn bản, bảng và thực thể từ tài liệu tải lên

4. **[Pipeline Học Máy](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Quy trình MLOps với Azure Machine Learning  
   **Thời gian:** 2-3 giờ | **Chi phí:** $150-500/tháng  
   **Kết quả mong đợi:** Pipeline ML tự động với đào tạo, triển khai và giám sát

### Kịch bản Thực tế

#### **Giải pháp Đa Đại lý Bán lẻ** 🆕
**[Hướng dẫn Triển khai Hoàn chỉnh](./retail-scenario.md)**

Một giải pháp hỗ trợ khách hàng đa đại lý toàn diện, sẵn sàng sản xuất, minh họa triển khai ứng dụng AI cấp doanh nghiệp với AZD. Kịch bản này cung cấp:

- **Kiến trúc Hoàn chỉnh**: Hệ thống đa đại lý với các đại lý dịch vụ khách hàng và quản lý hàng tồn kho chuyên biệt
- **Hạ tầng sản xuất**: Triển khai Azure OpenAI đa vùng, AI Search, Container Apps, và giám sát toàn diện  
- **Mẫu ARM sẵn sàng triển khai**: Triển khai chỉ với một cú nhấp chuột với nhiều chế độ cấu hình (Tối thiểu/Chuẩn/Cao cấp)  
- **Tính năng nâng cao**: Xác thực bảo mật Red Teaming, khung đánh giá tác nhân, tối ưu hóa chi phí, và hướng dẫn khắc phục sự cố  
- **Ngữ cảnh kinh doanh thực tế**: Trường hợp sử dụng hỗ trợ khách hàng cho nhà bán lẻ với tải lên tệp, tích hợp tìm kiếm, và khả năng mở rộng động  

**Công nghệ**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Độ phức tạp**: ⭐⭐⭐⭐ (Nâng cao - Sẵn sàng cho sản xuất doanh nghiệp)  

**Hoàn hảo cho**: Nhà phát triển AI, kiến trúc sư giải pháp, và các nhóm xây dựng hệ thống đa tác nhân sản xuất  

**Bắt đầu nhanh**: Triển khai giải pháp hoàn chỉnh trong vòng chưa đầy 30 phút bằng mẫu ARM đi kèm với `./deploy.sh -g myResourceGroup`  

## 📋 Hướng dẫn sử dụng  

### Yêu cầu trước  

Trước khi chạy bất kỳ ví dụ nào:  
- ✅ Đăng ký Azure với quyền Owner hoặc Contributor  
- ✅ Đã cài đặt Azure Developer CLI ([Hướng dẫn cài đặt](../docs/getting-started/installation.md))  
- ✅ Docker Desktop đang chạy (cho các ví dụ về container)  
- ✅ Hạn mức Azure phù hợp (kiểm tra yêu cầu cụ thể của từng ví dụ)  

> **💰 Cảnh báo chi phí:** Tất cả các ví dụ tạo tài nguyên Azure thực tế và sẽ phát sinh chi phí. Xem các tệp README riêng lẻ để ước tính chi phí. Nhớ chạy `azd down` khi hoàn thành để tránh chi phí liên tục.  

### Chạy ví dụ cục bộ  

1. **Clone hoặc sao chép ví dụ**  
   ```bash
   # Điều hướng đến ví dụ mong muốn
   cd examples/simple-web-app
   ```
  
2. **Khởi tạo môi trường AZD**  
   ```bash
   # Khởi tạo với mẫu hiện có
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
   # Triển khai cơ sở hạ tầng và ứng dụng
   azd up
   ```
  
5. **Xác minh triển khai**  
   ```bash
   # Lấy các điểm cuối dịch vụ
   azd env get-values
   
   # Kiểm tra điểm cuối (ví dụ)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Các chỉ số thành công mong đợi:**  
   - ✅ `azd up` hoàn thành mà không có lỗi  
   - ✅ Endpoint dịch vụ trả về HTTP 200  
   - ✅ Azure Portal hiển thị trạng thái "Running"  
   - ✅ Application Insights nhận dữ liệu giám sát  

> **⚠️ Vấn đề?** Xem [Các vấn đề thường gặp](../docs/troubleshooting/common-issues.md) để khắc phục sự cố triển khai  

### Tùy chỉnh ví dụ  

Mỗi ví dụ bao gồm:  
- **README.md** - Hướng dẫn thiết lập và tùy chỉnh chi tiết  
- **azure.yaml** - Cấu hình AZD với các chú thích  
- **infra/** - Các mẫu Bicep với giải thích tham số  
- **src/** - Mã ứng dụng mẫu  
- **scripts/** - Các script hỗ trợ cho các tác vụ thông thường  

## 🎯 Mục tiêu học tập  

### Danh mục ví dụ  

#### **Triển khai cơ bản**  
- Ứng dụng dịch vụ đơn  
- Mẫu hạ tầng đơn giản  
- Quản lý cấu hình cơ bản  
- Thiết lập phát triển tiết kiệm chi phí  

#### **Kịch bản nâng cao**  
- Kiến trúc đa dịch vụ  
- Cấu hình mạng phức tạp  
- Mẫu tích hợp cơ sở dữ liệu  
- Triển khai bảo mật và tuân thủ  

#### **Mẫu sẵn sàng sản xuất**  
- Cấu hình khả dụng cao  
- Giám sát và quan sát  
- Tích hợp CI/CD  
- Thiết lập khôi phục thảm họa  

## 📖 Mô tả ví dụ  

### Ứng dụng web đơn giản - Node.js Express  
**Công nghệ**: Node.js, Express, MongoDB, Container Apps  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Triển khai cơ bản, REST API, tích hợp cơ sở dữ liệu NoSQL  

### Website tĩnh - React SPA  
**Công nghệ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Lưu trữ tĩnh, backend serverless, phát triển web hiện đại  

### Container App - Python Flask  
**Công nghệ**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Độ phức tạp**: Người mới bắt đầu  
**Khái niệm**: Container hóa, REST API, scale-to-zero, kiểm tra sức khỏe, giám sát  
**Vị trí**: [Ví dụ cục bộ](../../../examples/container-app/simple-flask-api)  

### Container App - Kiến trúc Microservices  
**Công nghệ**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Độ phức tạp**: Nâng cao  
**Khái niệm**: Kiến trúc đa dịch vụ, giao tiếp dịch vụ, hàng đợi tin nhắn, truy vết phân tán  
**Vị trí**: [Ví dụ cục bộ](../../../examples/container-app/microservices)  

### Ứng dụng cơ sở dữ liệu - C# với Azure SQL  
**Công nghệ**: C# ASP.NET Core, Azure SQL Database, App Service  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Entity Framework, kết nối cơ sở dữ liệu, phát triển web API  

### Hàm serverless - Python Azure Functions  
**Công nghệ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Kiến trúc dựa trên sự kiện, tính toán serverless, phát triển full-stack  

### Microservices - Java Spring Boot  
**Công nghệ**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Giao tiếp microservices, hệ thống phân tán, mẫu doanh nghiệp  

### Ví dụ Azure AI Foundry  

#### Ứng dụng chat Azure OpenAI  
**Công nghệ**: Azure OpenAI, Cognitive Search, App Service  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Kiến trúc RAG, tìm kiếm vector, tích hợp LLM  

#### Xử lý tài liệu AI  
**Công nghệ**: Azure AI Document Intelligence, Storage, Functions  
**Độ phức tạp**: Trung cấp  
**Khái niệm**: Phân tích tài liệu, OCR, trích xuất dữ liệu  

#### Pipeline học máy  
**Công nghệ**: Azure ML, MLOps, Container Registry  
**Độ phức tạp**: Nâng cao  
**Khái niệm**: Huấn luyện mô hình, pipeline triển khai, giám sát  

## 🛠 Ví dụ cấu hình  

Thư mục `configurations/` chứa các thành phần có thể tái sử dụng:  

### Cấu hình môi trường  
- Cài đặt môi trường phát triển  
- Cấu hình môi trường staging  
- Cấu hình sẵn sàng sản xuất  
- Thiết lập triển khai đa vùng  

### Module Bicep  
- Thành phần hạ tầng có thể tái sử dụng  
- Mẫu tài nguyên thông thường  
- Mẫu bảo mật cao  
- Cấu hình tối ưu chi phí  

### Script hỗ trợ  
- Tự động hóa thiết lập môi trường  
- Script di chuyển cơ sở dữ liệu  
- Công cụ xác thực triển khai  
- Tiện ích giám sát chi phí  

## 🔧 Hướng dẫn tùy chỉnh  

### Tùy chỉnh ví dụ cho trường hợp sử dụng của bạn  

1. **Xem lại yêu cầu trước**  
   - Kiểm tra yêu cầu dịch vụ Azure  
   - Xác minh giới hạn đăng ký  
   - Hiểu rõ tác động chi phí  

2. **Chỉnh sửa cấu hình**  
   - Cập nhật định nghĩa dịch vụ trong `azure.yaml`  
   - Tùy chỉnh mẫu Bicep  
   - Điều chỉnh biến môi trường  

3. **Kiểm tra kỹ lưỡng**  
   - Triển khai trước vào môi trường phát triển  
   - Xác minh chức năng  
   - Kiểm tra khả năng mở rộng và hiệu suất  

4. **Xem xét bảo mật**  
   - Xem lại kiểm soát truy cập  
   - Triển khai quản lý bí mật  
   - Kích hoạt giám sát và cảnh báo  

## 📊 Ma trận so sánh  

| Ví dụ | Dịch vụ | Cơ sở dữ liệu | Xác thực | Giám sát | Độ phức tạp |  
|-------|---------|--------------|----------|----------|-------------|  
| **Azure OpenAI Chat** (Cục bộ) | 2 | ❌ | Key Vault | Đầy đủ | ⭐⭐ |  
| **Python Flask API** (Cục bộ) | 1 | ❌ | Cơ bản | Đầy đủ | ⭐ |  
| **Microservices** (Cục bộ) | 5+ | ✅ | Doanh nghiệp | Nâng cao | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Cơ bản | Cơ bản | ⭐ |  
| React SPA + Functions | 3 | ✅ | Cơ bản | Đầy đủ | ⭐ |  
| Python Flask Container | 2 | ❌ | Cơ bản | Đầy đủ | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | Đầy đủ | Đầy đủ | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Đầy đủ | Đầy đủ | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | Cơ bản | Đầy đủ | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | Đầy đủ | Đầy đủ | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Cục bộ) | **8+** | **✅** | **Doanh nghiệp** | **Nâng cao** | **⭐⭐⭐⭐** |  

## 🎓 Lộ trình học tập  

### Tiến trình khuyến nghị  

1. **Bắt đầu với ứng dụng web đơn giản**  
   - Học các khái niệm cơ bản về AZD  
   - Hiểu quy trình triển khai  
   - Thực hành quản lý môi trường  

2. **Thử website tĩnh**  
   - Khám phá các tùy chọn lưu trữ khác nhau  
   - Tìm hiểu về tích hợp CDN  
   - Hiểu cấu hình DNS  

3. **Chuyển sang Container App**  
   - Học các khái niệm cơ bản về container hóa  
   - Hiểu các khái niệm về khả năng mở rộng  
   - Thực hành với Docker  

4. **Thêm tích hợp cơ sở dữ liệu**  
   - Học cách cung cấp cơ sở dữ liệu  
   - Hiểu chuỗi kết nối  
   - Thực hành quản lý bí mật  

5. **Khám phá serverless**  
   - Hiểu kiến trúc dựa trên sự kiện  
   - Tìm hiểu về triggers và bindings  
   - Thực hành với APIs  

6. **Xây dựng microservices**  
   - Học giao tiếp dịch vụ  
   - Hiểu hệ thống phân tán  
   - Thực hành triển khai phức tạp  

## 🔍 Tìm ví dụ phù hợp  

### Theo công nghệ  
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
- **Hệ thống đa tác nhân**: **Retail Multi-Agent Solution**  
- **Tích hợp OpenAI**: **[Azure OpenAI Chat (Cục bộ)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Sản xuất doanh nghiệp**: [Microservices (Cục bộ)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Theo mẫu kiến trúc  
- **REST API đơn giản**: [Python Flask API (Cục bộ)](../../../examples/container-app/simple-flask-api)  
- **Monolithic**: Node.js Express Todo, C# Web API + SQL  
- **Tĩnh + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microservices**: [Production Microservices (Cục bộ)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Container hóa**: [Python Flask (Cục bộ)](../../../examples/container-app/simple-flask-api), [Microservices (Cục bộ)](../../../examples/container-app/microservices)  
- **AI-Powered**: **[Azure OpenAI Chat (Cục bộ)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Kiến trúc đa tác nhân**: **Retail Multi-Agent Solution**  
- **Doanh nghiệp đa dịch vụ**: [Microservices (Cục bộ)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Theo mức độ phức tạp  
- **Người mới bắt đầu**: [Python Flask API (Cục bộ)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Trung cấp**: **[Azure OpenAI Chat (Cục bộ)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing  
- **Nâng cao**: ML Pipeline  
- **Sẵn sàng sản xuất doanh nghiệp**: [Microservices (Cục bộ)](../../../examples/container-app/microservices) (Đa dịch vụ với hàng đợi tin nhắn), **Retail Multi-Agent Solution** (Hệ thống đa tác nhân hoàn chỉnh với triển khai mẫu ARM)  

## 📚 Tài nguyên bổ sung  

### Liên kết tài liệu  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Tài liệu Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Ví dụ cộng đồng  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Thư viện Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Ứng dụng Todo với C# và Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Ứng dụng Todo với Python và MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Ứng dụng Todo với Node.js và PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Ứng dụng Web React với API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions với Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Thực hành tốt nhất
- [Khung Kiến trúc Tốt của Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Khung Chuyển đổi Đám mây](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Đóng góp ví dụ

Có ví dụ hữu ích muốn chia sẻ? Chúng tôi hoan nghênh sự đóng góp của bạn!

### Hướng dẫn gửi bài
1. Tuân theo cấu trúc thư mục đã thiết lập
2. Bao gồm README.md chi tiết
3. Thêm chú thích vào các tệp cấu hình
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

**Mẹo chuyên nghiệp**: Bắt đầu với ví dụ đơn giản nhất phù hợp với công nghệ của bạn, sau đó dần dần tiến tới các kịch bản phức tạp hơn. Mỗi ví dụ xây dựng dựa trên các khái niệm từ những ví dụ trước!

## 🚀 Sẵn sàng bắt đầu?

### Lộ trình học tập của bạn

1. **Mới bắt đầu?** → Bắt đầu với [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 phút)
2. **Có kiến thức cơ bản về AZD?** → Thử [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 phút)
3. **Xây dựng ứng dụng AI?** → Bắt đầu với [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 phút) hoặc khám phá [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, hơn 2 giờ)
4. **Cần công nghệ cụ thể?** → Sử dụng phần [Tìm ví dụ phù hợp](../../../examples) ở trên

### Bước tiếp theo

- ✅ Xem lại [Yêu cầu cần thiết](../../../examples) ở trên
- ✅ Chọn một ví dụ phù hợp với trình độ của bạn (xem [Hướng dẫn độ phức tạp](../../../examples))
- ✅ Đọc kỹ README của ví dụ trước khi triển khai
- ✅ Đặt lời nhắc để chạy `azd down` sau khi kiểm tra
- ✅ Chia sẻ trải nghiệm của bạn qua GitHub Issues hoặc Discussions

### Cần giúp đỡ?

- 📖 [Câu hỏi thường gặp](../resources/faq.md) - Trả lời các câu hỏi phổ biến
- 🐛 [Hướng dẫn khắc phục sự cố](../docs/troubleshooting/common-issues.md) - Sửa lỗi triển khai
- 💬 [Thảo luận trên GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Hỏi cộng đồng
- 📚 [Hướng dẫn học tập](../resources/study-guide.md) - Củng cố kiến thức của bạn

---

**Điều hướng**
- **📚 Trang chủ khóa học**: [AZD For Beginners](../README.md)
- **📖 Tài liệu học tập**: [Hướng dẫn học tập](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Thuật ngữ](../resources/glossary.md)
- **🔧 Tài nguyên**: [Câu hỏi thường gặp](../resources/faq.md) | [Khắc phục sự cố](../docs/troubleshooting/common-issues.md)

---

*Cập nhật lần cuối: Tháng 11 năm 2025 | [Báo cáo vấn đề](https://github.com/microsoft/AZD-for-beginners/issues) | [Đóng góp ví dụ](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->