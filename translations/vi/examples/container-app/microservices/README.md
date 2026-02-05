# Kiến trúc Microservices - Ví dụ về Ứng dụng Container

⏱️ **Thời gian ước tính**: 25-35 phút | 💰 **Chi phí ước tính**: ~$50-100/tháng | ⭐ **Độ phức tạp**: Nâng cao

Một kiến trúc microservices **đơn giản nhưng hoạt động đầy đủ** được triển khai trên Azure Container Apps bằng AZD CLI. Ví dụ này minh họa giao tiếp giữa các dịch vụ, điều phối container, và giám sát với thiết lập thực tế gồm 2 dịch vụ.

> **📚 Cách học**: Ví dụ này bắt đầu với kiến trúc tối giản gồm 2 dịch vụ (API Gateway + Backend Service) mà bạn có thể triển khai và học hỏi. Sau khi nắm vững nền tảng này, chúng tôi cung cấp hướng dẫn để mở rộng thành hệ sinh thái microservices đầy đủ.

## Những gì bạn sẽ học

Khi hoàn thành ví dụ này, bạn sẽ:
- Triển khai nhiều container lên Azure Container Apps
- Thực hiện giao tiếp giữa các dịch vụ với mạng nội bộ
- Cấu hình mở rộng dựa trên môi trường và kiểm tra sức khỏe
- Giám sát ứng dụng phân tán với Application Insights
- Hiểu các mẫu triển khai microservices và các thực tiễn tốt nhất
- Học cách mở rộng từ kiến trúc đơn giản đến phức tạp

## Kiến trúc

### Giai đoạn 1: Những gì chúng ta đang xây dựng (Bao gồm trong ví dụ này)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Tại sao bắt đầu đơn giản?**
- ✅ Triển khai và hiểu nhanh chóng (25-35 phút)
- ✅ Học các mẫu microservices cốt lõi mà không phức tạp
- ✅ Mã hoạt động mà bạn có thể chỉnh sửa và thử nghiệm
- ✅ Chi phí học tập thấp (~$50-100/tháng so với $300-1400/tháng)
- ✅ Xây dựng sự tự tin trước khi thêm cơ sở dữ liệu và hàng đợi tin nhắn

**Ví dụ minh họa**: Hãy nghĩ về việc học lái xe. Bạn bắt đầu với bãi đỗ xe trống (2 dịch vụ), nắm vững các kỹ năng cơ bản, sau đó tiến đến giao thông thành phố (5+ dịch vụ với cơ sở dữ liệu).

### Giai đoạn 2: Mở rộng trong tương lai (Kiến trúc tham khảo)

Sau khi nắm vững kiến trúc 2 dịch vụ, bạn có thể mở rộng thành:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Xem phần "Hướng dẫn mở rộng" ở cuối để biết hướng dẫn từng bước.

## Các tính năng bao gồm

✅ **Khám phá dịch vụ**: Tự động khám phá DNS giữa các container  
✅ **Cân bằng tải**: Cân bằng tải tích hợp giữa các bản sao  
✅ **Tự động mở rộng**: Mở rộng độc lập cho từng dịch vụ dựa trên yêu cầu HTTP  
✅ **Giám sát sức khỏe**: Kiểm tra liveness và readiness cho cả hai dịch vụ  
✅ **Ghi nhật ký phân tán**: Ghi nhật ký tập trung với Application Insights  
✅ **Mạng nội bộ**: Giao tiếp dịch vụ an toàn  
✅ **Điều phối container**: Triển khai và mở rộng tự động  
✅ **Cập nhật không gián đoạn**: Cập nhật cuốn chiếu với quản lý phiên bản  

## Yêu cầu trước

### Công cụ cần thiết

Trước khi bắt đầu, hãy kiểm tra rằng bạn đã cài đặt các công cụ sau:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (phiên bản 1.0.0 hoặc cao hơn)
   ```bash
   azd version
   # Kết quả mong đợi: phiên bản azd 1.0.0 hoặc cao hơn
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (phiên bản 2.50.0 hoặc cao hơn)
   ```bash
   az --version
   # Kết quả mong đợi: azure-cli 2.50.0 hoặc cao hơn
   ```

3. **[Docker](https://www.docker.com/get-started)** (dành cho phát triển/kiểm tra cục bộ - tùy chọn)
   ```bash
   docker --version
   # Kết quả mong đợi: Phiên bản Docker 20.10 hoặc cao hơn
   ```

### Yêu cầu Azure

- Một **tài khoản Azure** đang hoạt động ([tạo tài khoản miễn phí](https://azure.microsoft.com/free/))
- Quyền tạo tài nguyên trong tài khoản của bạn
- Vai trò **Contributor** trên tài khoản hoặc nhóm tài nguyên

### Kiến thức cần thiết

Đây là ví dụ **cấp độ nâng cao**. Bạn nên:
- Hoàn thành [ví dụ API Flask đơn giản](../../../../../examples/container-app/simple-flask-api) 
- Hiểu cơ bản về kiến trúc microservices
- Quen thuộc với REST APIs và HTTP
- Hiểu các khái niệm về container

**Mới làm quen với Container Apps?** Bắt đầu với [ví dụ API Flask đơn giản](../../../../../examples/container-app/simple-flask-api) trước để học những điều cơ bản.

## Bắt đầu nhanh (Hướng dẫn từng bước)

### Bước 1: Clone và điều hướng

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Kiểm tra thành công**: Xác nhận bạn thấy `azure.yaml`:
```bash
ls
# Dự kiến: README.md, azure.yaml, infra/, src/
```

### Bước 2: Xác thực với Azure

```bash
azd auth login
```

Điều này sẽ mở trình duyệt của bạn để xác thực Azure. Đăng nhập bằng thông tin tài khoản Azure của bạn.

**✓ Kiểm tra thành công**: Bạn sẽ thấy:
```
Logged in to Azure.
```

### Bước 3: Khởi tạo môi trường

```bash
azd init
```

**Các lời nhắc bạn sẽ thấy**:
- **Tên môi trường**: Nhập tên ngắn (ví dụ: `microservices-dev`)
- **Tài khoản Azure**: Chọn tài khoản của bạn
- **Vị trí Azure**: Chọn khu vực (ví dụ: `eastus`, `westeurope`)

**✓ Kiểm tra thành công**: Bạn sẽ thấy:
```
SUCCESS: New project initialized!
```

### Bước 4: Triển khai hạ tầng và dịch vụ

```bash
azd up
```

**Những gì xảy ra** (mất 8-12 phút):
1. Tạo môi trường Container Apps
2. Tạo Application Insights để giám sát
3. Xây dựng container API Gateway (Node.js)
4. Xây dựng container Product Service (Python)
5. Triển khai cả hai container lên Azure
6. Cấu hình mạng và kiểm tra sức khỏe
7. Thiết lập giám sát và ghi nhật ký

**✓ Kiểm tra thành công**: Bạn sẽ thấy:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Thời gian**: 8-12 phút

### Bước 5: Kiểm tra triển khai

```bash
# Lấy điểm cuối cổng
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Kiểm tra sức khỏe API Gateway
curl $GATEWAY_URL/health

# Kết quả mong đợi:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Kiểm tra dịch vụ sản phẩm qua gateway**:
```bash
# Liệt kê sản phẩm
curl $GATEWAY_URL/api/products

# Kết quả mong đợi:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Chuột","price":29.99,"stock":200},
#   {"id":3,"name":"Bàn phím","price":79.99,"stock":150}
# ]
```

**✓ Kiểm tra thành công**: Cả hai endpoint trả về dữ liệu JSON mà không có lỗi.

---

**🎉 Chúc mừng!** Bạn đã triển khai kiến trúc microservices lên Azure!

## Cấu trúc dự án

Tất cả các tệp triển khai đều được bao gồm—đây là một ví dụ hoàn chỉnh và hoạt động:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Chức năng của từng thành phần:**

**Hạ tầng (infra/)**:
- `main.bicep`: Điều phối tất cả tài nguyên Azure và các phụ thuộc của chúng
- `core/container-apps-environment.bicep`: Tạo môi trường Container Apps và Azure Container Registry
- `core/monitor.bicep`: Thiết lập Application Insights để ghi nhật ký phân tán
- `app/*.bicep`: Định nghĩa từng ứng dụng container với mở rộng và kiểm tra sức khỏe

**API Gateway (src/api-gateway/)**:
- Dịch vụ công khai định tuyến yêu cầu đến các dịch vụ backend
- Thực hiện ghi nhật ký, xử lý lỗi, và chuyển tiếp yêu cầu
- Minh họa giao tiếp HTTP giữa các dịch vụ

**Product Service (src/product-service/)**:
- Dịch vụ nội bộ với danh mục sản phẩm (trong bộ nhớ để đơn giản)
- REST API với kiểm tra sức khỏe
- Ví dụ về mẫu microservice backend

## Tổng quan về dịch vụ

### API Gateway (Node.js/Express)

**Cổng**: 8080  
**Truy cập**: Công khai (external ingress)  
**Mục đích**: Định tuyến yêu cầu đến các dịch vụ backend phù hợp  

**Endpoints**:
- `GET /` - Thông tin dịch vụ
- `GET /health` - Endpoint kiểm tra sức khỏe
- `GET /api/products` - Chuyển tiếp đến dịch vụ sản phẩm (liệt kê tất cả)
- `GET /api/products/:id` - Chuyển tiếp đến dịch vụ sản phẩm (lấy theo ID)

**Các tính năng chính**:
- Định tuyến yêu cầu với axios
- Ghi nhật ký tập trung
- Xử lý lỗi và quản lý thời gian chờ
- Khám phá dịch vụ qua biến môi trường
- Tích hợp Application Insights

**Điểm nổi bật của mã** (`src/api-gateway/app.js`):
```javascript
// Giao tiếp dịch vụ nội bộ
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Cổng**: 8000  
**Truy cập**: Chỉ nội bộ (không có external ingress)  
**Mục đích**: Quản lý danh mục sản phẩm với dữ liệu trong bộ nhớ  

**Endpoints**:
- `GET /` - Thông tin dịch vụ
- `GET /health` - Endpoint kiểm tra sức khỏe
- `GET /products` - Liệt kê tất cả sản phẩm
- `GET /products/<id>` - Lấy sản phẩm theo ID

**Các tính năng chính**:
- API RESTful với Flask
- Lưu trữ sản phẩm trong bộ nhớ (đơn giản, không cần cơ sở dữ liệu)
- Giám sát sức khỏe với probes
- Ghi nhật ký có cấu trúc
- Tích hợp Application Insights

**Mô hình dữ liệu**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Tại sao chỉ nội bộ?**
Dịch vụ sản phẩm không được công khai. Tất cả các yêu cầu phải đi qua API Gateway, cung cấp:
- Bảo mật: Điểm truy cập được kiểm soát
- Linh hoạt: Có thể thay đổi backend mà không ảnh hưởng đến client
- Giám sát: Ghi nhật ký yêu cầu tập trung

## Hiểu giao tiếp giữa các dịch vụ

### Cách các dịch vụ giao tiếp với nhau

Trong ví dụ này, API Gateway giao tiếp với Product Service bằng **gọi HTTP nội bộ**:

```javascript
// Cổng API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Thực hiện yêu cầu HTTP nội bộ
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Điểm chính**:

1. **Khám phá DNS**: Container Apps tự động cung cấp DNS cho các dịch vụ nội bộ
   - FQDN của Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Đơn giản hóa thành: `http://product-service` (Container Apps tự động giải quyết)

2. **Không công khai**: Product Service có `external: false` trong Bicep
   - Chỉ có thể truy cập trong môi trường Container Apps
   - Không thể truy cập từ internet

3. **Biến môi trường**: URL dịch vụ được tiêm vào lúc triển khai
   - Bicep truyền FQDN nội bộ đến gateway
   - Không có URL hardcoded trong mã ứng dụng

**Ví dụ minh họa**: Hãy nghĩ về điều này như các phòng trong văn phòng. API Gateway là bàn lễ tân (công khai), và Product Service là một phòng làm việc (chỉ nội bộ). Khách phải đi qua lễ tân để đến bất kỳ phòng nào.

## Tùy chọn triển khai

### Triển khai đầy đủ (Khuyến nghị)

```bash
# Triển khai cơ sở hạ tầng và cả hai dịch vụ
azd up
```

Điều này triển khai:
1. Môi trường Container Apps
2. Application Insights
3. Container Registry
4. Container API Gateway
5. Container Product Service

**Thời gian**: 8-12 phút

### Triển khai từng dịch vụ

```bash
# Triển khai chỉ một dịch vụ (sau khi azd up ban đầu)
azd deploy api-gateway

# Hoặc triển khai dịch vụ sản phẩm
azd deploy product-service
```

**Trường hợp sử dụng**: Khi bạn đã cập nhật mã trong một dịch vụ và muốn triển khai lại chỉ dịch vụ đó.

### Cập nhật cấu hình

```bash
# Thay đổi các tham số tỷ lệ
azd env set GATEWAY_MAX_REPLICAS 30

# Triển khai lại với cấu hình mới
azd up
```

## Cấu hình

### Cấu hình mở rộng

Cả hai dịch vụ đều được cấu hình với tự động mở rộng dựa trên HTTP trong các tệp Bicep của chúng:

**API Gateway**:
- Số bản sao tối thiểu: 2 (luôn ít nhất 2 để đảm bảo khả dụng)
- Số bản sao tối đa: 20
- Kích hoạt mở rộng: 50 yêu cầu đồng thời mỗi bản sao

**Product Service**:
- Số bản sao tối thiểu: 1 (có thể mở rộng xuống 0 nếu cần)
- Số bản sao tối đa: 10
- Kích hoạt mở rộng: 100 yêu cầu đồng thời mỗi bản sao

**Tùy chỉnh mở rộng** (trong `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Phân bổ tài nguyên

**API Gateway**:
- CPU: 1.0 vCPU
- Bộ nhớ: 2 GiB
- Lý do: Xử lý tất cả lưu lượng công khai

**Product Service**:
- CPU: 0.5 vCPU
- Bộ nhớ: 1 GiB
- Lý do: Hoạt động nhẹ trong bộ nhớ

### Kiểm tra sức khỏe

Cả hai dịch vụ đều bao gồm liveness và readiness probes:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Ý nghĩa**:
- **Liveness**: Nếu kiểm tra sức khỏe thất bại, Container Apps sẽ khởi động lại container
- **Readiness**: Nếu không sẵn sàng, Container Apps sẽ ngừng định tuyến lưu lượng đến bản sao đó

## Giám sát & Khả năng quan sát

### Xem nhật ký dịch vụ

```bash
# Truyền phát nhật ký từ API Gateway
azd logs api-gateway --follow

# Xem nhật ký dịch vụ sản phẩm gần đây
azd logs product-service --tail 100

# Xem tất cả nhật ký từ cả hai dịch vụ
azd logs --follow
```

**Kết quả mong đợi**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Truy vấn Application Insights

Truy cập Application Insights trong Azure Portal, sau đó chạy các truy vấn sau:

**Tìm yêu cầu chậm**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Theo dõi các cuộc gọi giữa các dịch vụ**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Tỷ lệ lỗi theo dịch vụ**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Khối lượng yêu cầu theo thời gian**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Truy cập bảng điều khiển giám sát

```bash
# Lấy chi tiết Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Mở giám sát Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Số liệu trực tiếp

1. Điều hướng đến Application Insights trong Azure Portal
2. Nhấp vào "Live Metrics"
3. Xem các yêu cầu, lỗi, và hiệu suất theo thời gian thực
4. Kiểm tra bằng cách chạy: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Bài tập thực hành

[Chú ý: Xem các bài tập đầy đủ ở phần "Bài tập thực hành" phía trên để biết hướng dẫn chi tiết từng bước bao gồm xác minh triển khai, sửa đổi dữ liệu, kiểm tra tự động mở rộng, xử lý lỗi, và thêm dịch vụ thứ ba.]

## Phân tích chi phí

### Chi phí hàng tháng ước tính (Cho ví dụ 2 dịch vụ này)

| Tài nguyên | Cấu hình | Chi phí ước tính |
|------------|----------|------------------|
| API Gateway | 2-20 bản sao, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 bản sao, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Tier cơ bản | $5 |
| Application Insights | 1-2 GB/tháng | $5-10 |
| Log Analytics | 1 GB/tháng | $3 |
| **Tổng cộng** | | **$58-243/tháng** |

**Phân tích chi phí theo mức sử dụng**:
- **Lưu lượng nhẹ** (kiểm tra/học tập): ~$60/tháng
- **Lưu lượng vừa phải** (sản xuất nhỏ): ~$120/tháng
- **Lưu lượng cao** (thời gian bận rộn): ~$240/tháng

### Mẹo tối ưu hóa chi phí

1. **Mở rộng xuống 0 cho phát triển**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Sử dụng Consumption Plan cho Cosmos DB** (khi bạn thêm nó):
   - Chỉ trả tiền cho những gì bạn sử dụng
   - Không có phí tối thiểu

3. **Đặt Sampling cho Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Lấy mẫu 50% yêu cầu
   ```

4. **Dọn dẹp khi không cần thiết**:
   ```bash
   azd down
   ```

### Tùy chọn miễn phí
Để học tập/thử nghiệm, hãy cân nhắc:
- Sử dụng tín dụng miễn phí Azure (30 ngày đầu tiên)
- Giữ số lượng bản sao tối thiểu
- Xóa sau khi thử nghiệm (không có chi phí liên tục)

---

## Dọn dẹp

Để tránh chi phí liên tục, hãy xóa tất cả tài nguyên:

```bash
azd down --force --purge
```

**Xác nhận nhắc nhở**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Nhập `y` để xác nhận.

**Những gì sẽ bị xóa**:
- Môi trường Container Apps
- Cả hai Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Xác minh dọn dẹp**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Kết quả trả về phải trống.

---

## Hướng dẫn mở rộng: Từ 2 đến 5+ dịch vụ

Khi bạn đã thành thạo kiến trúc 2 dịch vụ này, đây là cách mở rộng:

### Giai đoạn 1: Thêm cơ sở dữ liệu lưu trữ (Bước tiếp theo)

**Thêm Cosmos DB cho Product Service**:

1. Tạo `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Cập nhật product service để sử dụng Cosmos DB thay vì dữ liệu trong bộ nhớ

3. Chi phí ước tính thêm: ~$25/tháng (serverless)

### Giai đoạn 2: Thêm dịch vụ thứ ba (Quản lý đơn hàng)

**Tạo Order Service**:

1. Thư mục mới: `src/order-service/` (Python/Node.js/C#)
2. Bicep mới: `infra/app/order-service.bicep`
3. Cập nhật API Gateway để định tuyến `/api/orders`
4. Thêm Azure SQL Database để lưu trữ đơn hàng

**Kiến trúc trở thành**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Giai đoạn 3: Thêm giao tiếp không đồng bộ (Service Bus)

**Triển khai kiến trúc dựa trên sự kiện**:

1. Thêm Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service phát hành sự kiện "ProductCreated"
3. Order Service đăng ký sự kiện sản phẩm
4. Thêm Notification Service để xử lý sự kiện

**Mẫu**: Yêu cầu/Phản hồi (HTTP) + Dựa trên sự kiện (Service Bus)

### Giai đoạn 4: Thêm xác thực người dùng

**Triển khai User Service**:

1. Tạo `src/user-service/` (Go/Node.js)
2. Thêm Azure AD B2C hoặc xác thực JWT tùy chỉnh
3. API Gateway xác thực token
4. Các dịch vụ kiểm tra quyền người dùng

### Giai đoạn 5: Sẵn sàng cho sản xuất

**Thêm các thành phần này**:
- Azure Front Door (cân bằng tải toàn cầu)
- Azure Key Vault (quản lý bí mật)
- Azure Monitor Workbooks (bảng điều khiển tùy chỉnh)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity cho tất cả các dịch vụ

**Chi phí kiến trúc sản xuất đầy đủ**: ~$300-1,400/tháng

---

## Tìm hiểu thêm

### Tài liệu liên quan
- [Tài liệu Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Hướng dẫn Kiến trúc Microservices](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights cho Truy vết Phân tán](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Các bước tiếp theo trong khóa học này
- ← Trước: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Ví dụ đơn giản với một container
- → Tiếp theo: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Thêm khả năng AI
- 🏠 [Trang chủ khóa học](../../README.md)

### So sánh: Khi nào nên sử dụng gì

**Single Container App** (Ví dụ Simple Flask API):
- ✅ Ứng dụng đơn giản
- ✅ Kiến trúc nguyên khối
- ✅ Triển khai nhanh
- ❌ Khả năng mở rộng hạn chế
- **Chi phí**: ~$15-50/tháng

**Microservices** (Ví dụ này):
- ✅ Ứng dụng phức tạp
- ✅ Mở rộng độc lập cho từng dịch vụ
- ✅ Độc lập nhóm (dịch vụ khác nhau, nhóm khác nhau)
- ❌ Quản lý phức tạp hơn
- **Chi phí**: ~$60-250/tháng

**Kubernetes (AKS)**:
- ✅ Kiểm soát và linh hoạt tối đa
- ✅ Khả năng di chuyển đa đám mây
- ✅ Mạng nâng cao
- ❌ Yêu cầu chuyên môn về Kubernetes
- **Chi phí**: ~$150-500/tháng tối thiểu

**Khuyến nghị**: Bắt đầu với Container Apps (ví dụ này), chỉ chuyển sang AKS nếu bạn cần các tính năng cụ thể của Kubernetes.

---

## Câu hỏi thường gặp

**Q: Tại sao chỉ có 2 dịch vụ thay vì 5+?**  
A: Tiến trình học tập. Hãy thành thạo các nguyên tắc cơ bản (giao tiếp dịch vụ, giám sát, mở rộng) với một ví dụ đơn giản trước khi thêm phức tạp. Các mẫu bạn học ở đây áp dụng cho kiến trúc 100 dịch vụ.

**Q: Tôi có thể tự thêm nhiều dịch vụ hơn không?**  
A: Chắc chắn! Hãy làm theo hướng dẫn mở rộng ở trên. Mỗi dịch vụ mới tuân theo cùng một mẫu: tạo thư mục src, tạo tệp Bicep, cập nhật azure.yaml, triển khai.

**Q: Đây có sẵn sàng cho sản xuất không?**  
A: Đây là một nền tảng vững chắc. Để sản xuất, hãy thêm: managed identity, Key Vault, cơ sở dữ liệu lưu trữ, CI/CD pipeline, cảnh báo giám sát và chiến lược sao lưu.

**Q: Tại sao không sử dụng Dapr hoặc các service mesh khác?**  
A: Giữ đơn giản để học tập. Khi bạn hiểu rõ mạng lưới Container Apps gốc, bạn có thể thêm Dapr cho các kịch bản nâng cao.

**Q: Làm thế nào để gỡ lỗi cục bộ?**  
A: Chạy các dịch vụ cục bộ với Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Tôi có thể sử dụng các ngôn ngữ lập trình khác nhau không?**  
A: Có! Ví dụ này sử dụng Node.js (gateway) + Python (product service). Bạn có thể kết hợp bất kỳ ngôn ngữ nào chạy trong container.

**Q: Nếu tôi không có tín dụng Azure thì sao?**  
A: Sử dụng gói miễn phí Azure (30 ngày đầu tiên với tài khoản mới) hoặc triển khai trong thời gian ngắn để thử nghiệm và xóa ngay lập tức.

---

> **🎓 Tóm tắt lộ trình học tập**: Bạn đã học cách triển khai kiến trúc đa dịch vụ với khả năng mở rộng tự động, mạng nội bộ, giám sát tập trung và các mẫu sẵn sàng cho sản xuất. Nền tảng này chuẩn bị cho bạn các hệ thống phân tán phức tạp và kiến trúc microservices doanh nghiệp.

**📚 Điều hướng khóa học:**
- ← Trước: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Tiếp theo: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Trang chủ khóa học](../../README.md)
- 📖 [Container Apps Best Practices](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->