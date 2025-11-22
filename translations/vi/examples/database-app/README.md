<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-22T10:49:29+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "vi"
}
-->
# Triển khai Cơ sở Dữ liệu Microsoft SQL và Ứng dụng Web với AZD

⏱️ **Thời gian ước tính**: 20-30 phút | 💰 **Chi phí ước tính**: ~15-25 USD/tháng | ⭐ **Độ phức tạp**: Trung cấp

Ví dụ **hoàn chỉnh, hoạt động** này minh họa cách sử dụng [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) để triển khai một ứng dụng web Python Flask với Cơ sở Dữ liệu Microsoft SQL lên Azure. Tất cả mã nguồn đều được bao gồm và kiểm tra—không yêu cầu phụ thuộc bên ngoài.

## Bạn sẽ học được gì

Khi hoàn thành ví dụ này, bạn sẽ:
- Triển khai một ứng dụng đa tầng (ứng dụng web + cơ sở dữ liệu) bằng cách sử dụng hạ tầng như mã
- Cấu hình kết nối cơ sở dữ liệu an toàn mà không cần mã hóa cứng thông tin bí mật
- Giám sát sức khỏe ứng dụng với Application Insights
- Quản lý tài nguyên Azure hiệu quả với AZD CLI
- Tuân theo các thực hành tốt nhất của Azure về bảo mật, tối ưu hóa chi phí và khả năng quan sát

## Tổng quan về Kịch bản
- **Ứng dụng Web**: REST API Python Flask với kết nối cơ sở dữ liệu
- **Cơ sở Dữ liệu**: Azure SQL Database với dữ liệu mẫu
- **Hạ tầng**: Được cung cấp bằng Bicep (mẫu mô-đun, có thể tái sử dụng)
- **Triển khai**: Hoàn toàn tự động với các lệnh `azd`
- **Giám sát**: Application Insights để ghi nhật ký và theo dõi

## Yêu cầu trước

### Công cụ cần thiết

Trước khi bắt đầu, hãy đảm bảo bạn đã cài đặt các công cụ sau:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (phiên bản 2.50.0 hoặc cao hơn)
   ```sh
   az --version
   # Kết quả mong đợi: azure-cli 2.50.0 hoặc cao hơn
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (phiên bản 1.0.0 hoặc cao hơn)
   ```sh
   azd version
   # Kết quả mong đợi: phiên bản azd 1.0.0 hoặc cao hơn
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (dành cho phát triển cục bộ)
   ```sh
   python --version
   # Kết quả mong đợi: Python 3.8 hoặc cao hơn
   ```

4. **[Docker](https://www.docker.com/get-started)** (tùy chọn, dành cho phát triển container hóa cục bộ)
   ```sh
   docker --version
   # Kết quả mong đợi: Phiên bản Docker 20.10 hoặc cao hơn
   ```

### Yêu cầu Azure

- Một **tài khoản Azure** đang hoạt động ([tạo tài khoản miễn phí](https://azure.microsoft.com/free/))
- Quyền tạo tài nguyên trong tài khoản của bạn
- Vai trò **Chủ sở hữu** hoặc **Cộng tác viên** trên tài khoản hoặc nhóm tài nguyên

### Yêu cầu về kiến thức

Đây là một ví dụ ở **mức trung cấp**. Bạn nên quen thuộc với:
- Các thao tác cơ bản trên dòng lệnh
- Các khái niệm cơ bản về đám mây (tài nguyên, nhóm tài nguyên)
- Hiểu biết cơ bản về ứng dụng web và cơ sở dữ liệu

**Mới với AZD?** Hãy bắt đầu với [Hướng dẫn Bắt đầu](../../docs/getting-started/azd-basics.md) trước.

## Kiến trúc

Ví dụ này triển khai một kiến trúc hai tầng với một ứng dụng web và cơ sở dữ liệu SQL:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Triển khai Tài nguyên:**
- **Nhóm Tài nguyên**: Chứa tất cả các tài nguyên
- **App Service Plan**: Lưu trữ dựa trên Linux (tầng B1 để tiết kiệm chi phí)
- **Ứng dụng Web**: Runtime Python 3.11 với ứng dụng Flask
- **SQL Server**: Máy chủ cơ sở dữ liệu được quản lý với TLS 1.2 tối thiểu
- **SQL Database**: Tầng cơ bản (2GB, phù hợp cho phát triển/kiểm thử)
- **Application Insights**: Giám sát và ghi nhật ký
- **Log Analytics Workspace**: Lưu trữ nhật ký tập trung

**Ví dụ minh họa**: Hãy tưởng tượng điều này giống như một nhà hàng (ứng dụng web) với một tủ đông (cơ sở dữ liệu). Khách hàng gọi món từ thực đơn (API endpoints), và nhà bếp (ứng dụng Flask) lấy nguyên liệu (dữ liệu) từ tủ đông. Quản lý nhà hàng (Application Insights) theo dõi mọi thứ diễn ra.

## Cấu trúc Thư mục

Tất cả các tệp đều được bao gồm trong ví dụ này—không yêu cầu phụ thuộc bên ngoài:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Chức năng của từng tệp:**
- **azure.yaml**: Chỉ định AZD triển khai cái gì và ở đâu
- **infra/main.bicep**: Điều phối tất cả các tài nguyên Azure
- **infra/resources/*.bicep**: Định nghĩa từng tài nguyên riêng lẻ (mô-đun để tái sử dụng)
- **src/web/app.py**: Ứng dụng Flask với logic cơ sở dữ liệu
- **requirements.txt**: Các phụ thuộc gói Python
- **Dockerfile**: Hướng dẫn container hóa để triển khai

## Bắt đầu nhanh (Các bước thực hiện)

### Bước 1: Sao chép và Điều hướng

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Kiểm tra thành công**: Xác minh bạn thấy `azure.yaml` và thư mục `infra/`:
```sh
ls
# Mong đợi: README.md, azure.yaml, infra/, src/
```

### Bước 2: Xác thực với Azure

```sh
azd auth login
```

Điều này sẽ mở trình duyệt của bạn để xác thực Azure. Đăng nhập bằng thông tin tài khoản Azure của bạn.

**✓ Kiểm tra thành công**: Bạn sẽ thấy:
```
Logged in to Azure.
```

### Bước 3: Khởi tạo Môi trường

```sh
azd init
```

**Điều gì xảy ra**: AZD tạo một cấu hình cục bộ cho việc triển khai của bạn.

**Các lời nhắc bạn sẽ thấy**:
- **Tên môi trường**: Nhập một tên ngắn (ví dụ: `dev`, `myapp`)
- **Tài khoản Azure**: Chọn tài khoản của bạn từ danh sách
- **Vị trí Azure**: Chọn một khu vực (ví dụ: `eastus`, `westeurope`)

**✓ Kiểm tra thành công**: Bạn sẽ thấy:
```
SUCCESS: New project initialized!
```

### Bước 4: Cung cấp Tài nguyên Azure

```sh
azd provision
```

**Điều gì xảy ra**: AZD triển khai tất cả hạ tầng (mất 5-8 phút):
1. Tạo nhóm tài nguyên
2. Tạo SQL Server và Cơ sở Dữ liệu
3. Tạo App Service Plan
4. Tạo Ứng dụng Web
5. Tạo Application Insights
6. Cấu hình mạng và bảo mật

**Bạn sẽ được yêu cầu nhập**:
- **Tên người dùng quản trị SQL**: Nhập một tên người dùng (ví dụ: `sqladmin`)
- **Mật khẩu quản trị SQL**: Nhập một mật khẩu mạnh (lưu lại!)

**✓ Kiểm tra thành công**: Bạn sẽ thấy:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Thời gian**: 5-8 phút

### Bước 5: Triển khai Ứng dụng

```sh
azd deploy
```

**Điều gì xảy ra**: AZD xây dựng và triển khai ứng dụng Flask của bạn:
1. Đóng gói ứng dụng Python
2. Xây dựng container Docker
3. Đẩy lên Azure Web App
4. Khởi tạo cơ sở dữ liệu với dữ liệu mẫu
5. Khởi động ứng dụng

**✓ Kiểm tra thành công**: Bạn sẽ thấy:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Thời gian**: 3-5 phút

### Bước 6: Duyệt Ứng dụng

```sh
azd browse
```

Điều này sẽ mở ứng dụng web đã triển khai của bạn trong trình duyệt tại `https://app-<unique-id>.azurewebsites.net`

**✓ Kiểm tra thành công**: Bạn sẽ thấy đầu ra JSON:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Bước 7: Kiểm tra API Endpoints

**Kiểm tra Sức khỏe** (xác minh kết nối cơ sở dữ liệu):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Phản hồi Dự kiến**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Danh sách Sản phẩm** (dữ liệu mẫu):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Phản hồi Dự kiến**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Lấy Một Sản phẩm**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Kiểm tra thành công**: Tất cả các endpoints trả về dữ liệu JSON mà không có lỗi.

---

**🎉 Chúc mừng!** Bạn đã triển khai thành công một ứng dụng web với cơ sở dữ liệu lên Azure bằng AZD.

## Phân tích Cấu hình Chi tiết

### Biến Môi trường

Các thông tin bí mật được quản lý an toàn qua cấu hình Azure App Service—**không bao giờ mã hóa cứng trong mã nguồn**.

**Được cấu hình tự động bởi AZD**:
- `SQL_CONNECTION_STRING`: Kết nối cơ sở dữ liệu với thông tin xác thực được mã hóa
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Điểm cuối giám sát telemetry
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Kích hoạt cài đặt phụ thuộc tự động

**Nơi lưu trữ thông tin bí mật**:
1. Trong quá trình `azd provision`, bạn cung cấp thông tin xác thực SQL qua các lời nhắc an toàn
2. AZD lưu trữ chúng trong tệp `.azure/<env-name>/.env` cục bộ (được bỏ qua trong git)
3. AZD chèn chúng vào cấu hình Azure App Service (được mã hóa khi lưu trữ)
4. Ứng dụng đọc chúng qua `os.getenv()` khi chạy

### Phát triển Cục bộ

Để kiểm tra cục bộ, tạo một tệp `.env` từ mẫu:

```sh
cp .env.sample .env
# Chỉnh sửa .env với kết nối cơ sở dữ liệu cục bộ của bạn
```

**Quy trình Phát triển Cục bộ**:
```sh
# Cài đặt các phụ thuộc
cd src/web
pip install -r requirements.txt

# Thiết lập các biến môi trường
export SQL_CONNECTION_STRING="your-local-connection-string"

# Chạy ứng dụng
python app.py
```

**Kiểm tra cục bộ**:
```sh
curl http://localhost:8000/health
# Mong đợi: {"status": "healthy", "database": "connected"}
```

### Hạ tầng như Mã

Tất cả tài nguyên Azure được định nghĩa trong **mẫu Bicep** (thư mục `infra/`):

- **Thiết kế Mô-đun**: Mỗi loại tài nguyên có tệp riêng để tái sử dụng
- **Tham số hóa**: Tùy chỉnh SKUs, khu vực, quy ước đặt tên
- **Thực hành Tốt nhất**: Tuân theo tiêu chuẩn đặt tên và mặc định bảo mật của Azure
- **Kiểm soát Phiên bản**: Các thay đổi hạ tầng được theo dõi trong Git

**Ví dụ Tùy chỉnh**:
Để thay đổi tầng cơ sở dữ liệu, chỉnh sửa `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Thực hành Tốt nhất về Bảo mật

Ví dụ này tuân theo các thực hành tốt nhất về bảo mật của Azure:

### 1. **Không Lưu Thông tin Bí mật trong Mã Nguồn**
- ✅ Thông tin xác thực được lưu trong cấu hình Azure App Service (được mã hóa)
- ✅ Tệp `.env` được loại trừ khỏi Git qua `.gitignore`
- ✅ Thông tin bí mật được truyền qua các tham số an toàn trong quá trình cung cấp

### 2. **Kết nối Mã hóa**
- ✅ TLS 1.2 tối thiểu cho SQL Server
- ✅ Chỉ cho phép HTTPS cho Ứng dụng Web
- ✅ Kết nối cơ sở dữ liệu sử dụng kênh mã hóa

### 3. **Bảo mật Mạng**
- ✅ Tường lửa SQL Server được cấu hình chỉ cho phép các dịch vụ Azure
- ✅ Truy cập mạng công cộng bị hạn chế (có thể khóa thêm với Private Endpoints)
- ✅ FTPS bị vô hiệu hóa trên Ứng dụng Web

### 4. **Xác thực & Ủy quyền**
- ⚠️ **Hiện tại**: Xác thực SQL (tên người dùng/mật khẩu)
- ✅ **Khuyến nghị Sản xuất**: Sử dụng Azure Managed Identity để xác thực không cần mật khẩu

**Để Nâng cấp lên Managed Identity** (cho sản xuất):
1. Kích hoạt managed identity trên Ứng dụng Web
2. Cấp quyền SQL cho identity
3. Cập nhật chuỗi kết nối để sử dụng managed identity
4. Loại bỏ xác thực dựa trên mật khẩu

### 5. **Kiểm toán & Tuân thủ**
- ✅ Application Insights ghi nhật ký tất cả các yêu cầu và lỗi
- ✅ Kiểm toán SQL Database được kích hoạt (có thể cấu hình để tuân thủ)
- ✅ Tất cả tài nguyên được gắn thẻ để quản trị

**Danh sách Kiểm tra Bảo mật Trước Sản Xuất**:
- [ ] Kích hoạt Azure Defender cho SQL
- [ ] Cấu hình Private Endpoints cho SQL Database
- [ ] Kích hoạt Web Application Firewall (WAF)
- [ ] Triển khai Azure Key Vault để xoay vòng thông tin bí mật
- [ ] Cấu hình xác thực Azure AD
- [ ] Kích hoạt ghi nhật ký chẩn đoán cho tất cả tài nguyên

## Tối ưu hóa Chi phí

**Chi phí Hàng Tháng Ước Tính** (tính đến tháng 11 năm 2025):

| Tài nguyên | SKU/Tầng | Chi phí Ước tính |
|------------|----------|------------------|
| App Service Plan | B1 (Cơ bản) | ~13 USD/tháng |
| SQL Database | Cơ bản (2GB) | ~5 USD/tháng |
| Application Insights | Trả theo mức sử dụng | ~2 USD/tháng (lưu lượng thấp) |
| **Tổng cộng** | | **~20 USD/tháng** |

**💡 Mẹo Tiết Kiệm Chi Phí**:

1. **Sử dụng Tầng Miễn Phí để Học Tập**:
   - App Service: Tầng F1 (miễn phí, giới hạn giờ)
   - SQL Database: Sử dụng Azure SQL Database serverless
   - Application Insights: 5GB/tháng miễn phí ghi nhận

2. **Dừng Tài Nguyên Khi Không Sử Dụng**:
   ```sh
   # Dừng ứng dụng web (cơ sở dữ liệu vẫn tính phí)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Khởi động lại khi cần thiết
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Xóa Mọi Thứ Sau Khi Kiểm Tra**:
   ```sh
   azd down
   ```
   Điều này xóa TẤT CẢ tài nguyên và ngừng tính phí.

4. **Tầng Phát Triển vs. Sản Xuất**:
   - **Phát triển**: Tầng cơ bản (được sử dụng trong ví dụ này)
   - **Sản xuất**: Tầng Tiêu chuẩn/Cao cấp với tính năng dự phòng

**Giám sát Chi Phí**:
- Xem chi phí trong [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Thiết lập cảnh báo chi phí để tránh bất ngờ
- Gắn thẻ tất cả tài nguyên với `azd-env-name` để theo dõi

**Tùy chọn Tầng Miễn Phí**:
Để học tập, bạn có thể chỉnh sửa `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Lưu ý**: Tầng miễn phí có giới hạn (60 phút/ngày CPU, không luôn bật).

## Giám sát & Khả năng Quan sát

### Tích hợp Application Insights

Ví dụ này bao gồm **Application Insights** để giám sát toàn diện:

**Những gì được giám sát**:
- ✅ Yêu cầu HTTP (độ trễ, mã trạng thái, endpoints)
- ✅ Lỗi và ngoại lệ ứng dụng
- ✅ Ghi nhật ký tùy chỉnh từ ứng dụng Flask
- ✅ Sức khỏe kết nối cơ sở dữ liệu
- ✅ Số liệu hiệu suất (CPU, bộ nhớ)

**Truy cập Application Insights**:
1. Mở [Azure Portal](https://portal.azure.com)
2. Điều hướng đến nhóm tài nguyên của bạn (`rg-<env-name>`)
3. Nhấp vào tài nguyên Application Insights (`appi-<unique-id>`)

**Truy vấn Hữu ích** (Application Insights → Logs):

**Xem Tất Cả Yêu Cầu**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Tìm Lỗi**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Kiểm tra Endpoint Sức Khỏe**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Kiểm toán SQL Database

**Kiểm toán SQL Database được kích hoạt** để theo dõi:
- Mẫu truy cập cơ sở dữ liệu
- Các lần đăng nhập thất bại
- Thay đổi cấu trúc
- Truy cập dữ liệu (để tuân thủ)

**Truy cập Nhật ký Kiểm toán**:
1. Azure Portal → SQL Database → Auditing
2. Xem nhật ký trong Log Analytics workspace

### Giám sát Thời gian Thực

**Xem Số liệu Trực tiếp**:
1. Application Insights → Live Metrics
2. Xem các yêu cầu, lỗi và hiệu suất trong thời gian thực

**Thiết lập Cảnh báo**:
Tạo cảnh báo cho các sự kiện quan trọng:
- Lỗi HTTP 500 > 5 trong 5 phút
- Lỗi kết nối cơ sở dữ liệu
- Thời gian phản hồi cao (>2 giây)

**Ví dụ Tạo Cảnh Báo**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Xử lý sự cố

### Các vấn đề thường gặp và giải pháp

#### 1. `azd provision` thất bại với lỗi "Location not available"

**Triệu chứng**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Giải pháp**:
Chọn một khu vực Azure khác hoặc đăng ký nhà cung cấp tài nguyên:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Kết nối SQL thất bại trong quá trình triển khai

**Triệu chứng**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Giải pháp**:
- Xác minh tường lửa SQL Server cho phép các dịch vụ Azure (được cấu hình tự động)
- Kiểm tra mật khẩu quản trị SQL đã được nhập đúng trong `azd provision`
- Đảm bảo SQL Server đã được triển khai hoàn toàn (có thể mất 2-3 phút)

**Xác minh kết nối**:
```sh
# Từ Azure Portal, đi đến SQL Database → Trình chỉnh sửa truy vấn
# Thử kết nối bằng thông tin đăng nhập của bạn
```

#### 3. Ứng dụng web hiển thị "Application Error"

**Triệu chứng**:
Trình duyệt hiển thị trang lỗi chung.

**Giải pháp**:
Kiểm tra nhật ký ứng dụng:
```sh
# Xem nhật ký gần đây
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Nguyên nhân phổ biến**:
- Thiếu biến môi trường (kiểm tra App Service → Configuration)
- Cài đặt gói Python thất bại (kiểm tra nhật ký triển khai)
- Lỗi khởi tạo cơ sở dữ liệu (kiểm tra kết nối SQL)

#### 4. `azd deploy` thất bại với lỗi "Build Error"

**Triệu chứng**:
```
Error: Failed to build project
```

**Giải pháp**:
- Đảm bảo `requirements.txt` không có lỗi cú pháp
- Kiểm tra rằng Python 3.11 được chỉ định trong `infra/resources/web-app.bicep`
- Xác minh Dockerfile có hình ảnh cơ sở chính xác

**Gỡ lỗi cục bộ**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" khi chạy các lệnh AZD

**Triệu chứng**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Giải pháp**:
Xác thực lại với Azure:
```sh
azd auth login
az login
```

Xác minh bạn có quyền chính xác (vai trò Contributor) trên subscription.

#### 6. Chi phí cơ sở dữ liệu cao

**Triệu chứng**:
Hóa đơn Azure không mong muốn.

**Giải pháp**:
- Kiểm tra xem bạn có quên chạy `azd down` sau khi thử nghiệm không
- Xác minh SQL Database đang sử dụng tier Basic (không phải Premium)
- Xem lại chi phí trong Azure Cost Management
- Thiết lập cảnh báo chi phí

### Nhận hỗ trợ

**Xem tất cả biến môi trường AZD**:
```sh
azd env get-values
```

**Kiểm tra trạng thái triển khai**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Truy cập nhật ký ứng dụng**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Cần thêm hỗ trợ?**
- [Hướng dẫn xử lý sự cố AZD](../../docs/troubleshooting/common-issues.md)
- [Xử lý sự cố Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Xử lý sự cố Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Bài tập thực hành

### Bài tập 1: Xác minh triển khai của bạn (Cơ bản)

**Mục tiêu**: Xác nhận tất cả tài nguyên đã được triển khai và ứng dụng hoạt động.

**Các bước**:
1. Liệt kê tất cả tài nguyên trong nhóm tài nguyên của bạn:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Kỳ vọng**: 6-7 tài nguyên (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Kiểm tra tất cả các điểm cuối API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Kỳ vọng**: Tất cả trả về JSON hợp lệ không có lỗi

3. Kiểm tra Application Insights:
   - Điều hướng đến Application Insights trong Azure Portal
   - Đi đến "Live Metrics"
   - Làm mới trình duyệt của bạn trên ứng dụng web
   **Kỳ vọng**: Thấy các yêu cầu xuất hiện trong thời gian thực

**Tiêu chí thành công**: Tất cả 6-7 tài nguyên tồn tại, tất cả các điểm cuối trả về dữ liệu, Live Metrics hiển thị hoạt động.

---

### Bài tập 2: Thêm một điểm cuối API mới (Trung cấp)

**Mục tiêu**: Mở rộng ứng dụng Flask với một điểm cuối mới.

**Mã khởi đầu**: Các điểm cuối hiện tại trong `src/web/app.py`

**Các bước**:
1. Chỉnh sửa `src/web/app.py` và thêm một điểm cuối mới sau hàm `get_product()`:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Triển khai ứng dụng đã cập nhật:
   ```sh
   azd deploy
   ```

3. Kiểm tra điểm cuối mới:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Kỳ vọng**: Trả về các sản phẩm khớp với "laptop"

**Tiêu chí thành công**: Điểm cuối mới hoạt động, trả về kết quả đã lọc, xuất hiện trong nhật ký Application Insights.

---

### Bài tập 3: Thêm giám sát và cảnh báo (Nâng cao)

**Mục tiêu**: Thiết lập giám sát chủ động với cảnh báo.

**Các bước**:
1. Tạo một cảnh báo cho lỗi HTTP 500:
   ```sh
   # Lấy ID tài nguyên Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Tạo cảnh báo
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Kích hoạt cảnh báo bằng cách gây ra lỗi:
   ```sh
   # Yêu cầu một sản phẩm không tồn tại
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Kiểm tra xem cảnh báo đã được kích hoạt:
   - Azure Portal → Alerts → Alert Rules
   - Kiểm tra email của bạn (nếu đã cấu hình)

**Tiêu chí thành công**: Quy tắc cảnh báo được tạo, kích hoạt khi có lỗi, nhận được thông báo.

---

### Bài tập 4: Thay đổi schema cơ sở dữ liệu (Nâng cao)

**Mục tiêu**: Thêm một bảng mới và sửa đổi ứng dụng để sử dụng nó.

**Các bước**:
1. Kết nối với SQL Database qua Azure Portal Query Editor

2. Tạo một bảng `categories` mới:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Cập nhật `src/web/app.py` để bao gồm thông tin danh mục trong phản hồi

4. Triển khai và kiểm tra

**Tiêu chí thành công**: Bảng mới tồn tại, sản phẩm hiển thị thông tin danh mục, ứng dụng vẫn hoạt động.

---

### Bài tập 5: Triển khai bộ nhớ đệm (Chuyên gia)

**Mục tiêu**: Thêm Azure Redis Cache để cải thiện hiệu suất.

**Các bước**:
1. Thêm Redis Cache vào `infra/main.bicep`
2. Cập nhật `src/web/app.py` để lưu trữ các truy vấn sản phẩm vào bộ nhớ đệm
3. Đo lường cải thiện hiệu suất với Application Insights
4. So sánh thời gian phản hồi trước/sau khi sử dụng bộ nhớ đệm

**Tiêu chí thành công**: Redis được triển khai, bộ nhớ đệm hoạt động, thời gian phản hồi cải thiện >50%.

**Gợi ý**: Bắt đầu với [tài liệu Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Dọn dẹp

Để tránh chi phí liên tục, hãy xóa tất cả tài nguyên khi hoàn thành:

```sh
azd down
```

**Nhắc nhở xác nhận**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Nhập `y` để xác nhận.

**✓ Kiểm tra thành công**: 
- Tất cả tài nguyên đã bị xóa khỏi Azure Portal
- Không có chi phí liên tục
- Thư mục `.azure/<env-name>` cục bộ có thể bị xóa

**Lựa chọn thay thế** (giữ cơ sở hạ tầng, xóa dữ liệu):
```sh
# Chỉ xóa nhóm tài nguyên (giữ cấu hình AZD)
az group delete --name rg-<env-name> --yes
```
## Tìm hiểu thêm

### Tài liệu liên quan
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Tài liệu Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Tài liệu Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Tài liệu Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Tham khảo ngôn ngữ Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Các bước tiếp theo trong khóa học này
- **[Ví dụ Container Apps](../../../../examples/container-app)**: Triển khai microservices với Azure Container Apps
- **[Hướng dẫn tích hợp AI](../../../../docs/ai-foundry)**: Thêm khả năng AI vào ứng dụng của bạn
- **[Thực hành triển khai tốt nhất](../../docs/deployment/deployment-guide.md)**: Mô hình triển khai sản xuất

### Chủ đề nâng cao
- **Managed Identity**: Loại bỏ mật khẩu và sử dụng xác thực Azure AD
- **Private Endpoints**: Bảo mật kết nối cơ sở dữ liệu trong mạng ảo
- **Tích hợp CI/CD**: Tự động hóa triển khai với GitHub Actions hoặc Azure DevOps
- **Multi-Environment**: Thiết lập môi trường dev, staging và production
- **Database Migrations**: Sử dụng Alembic hoặc Entity Framework để quản lý phiên bản schema

### So sánh với các phương pháp khác

**AZD vs. ARM Templates**:
- ✅ AZD: Trừu tượng hóa cấp cao hơn, lệnh đơn giản hơn
- ⚠️ ARM: Chi tiết hơn, kiểm soát từng phần

**AZD vs. Terraform**:
- ✅ AZD: Tích hợp Azure-native, tích hợp với các dịch vụ Azure
- ⚠️ Terraform: Hỗ trợ đa đám mây, hệ sinh thái lớn hơn

**AZD vs. Azure Portal**:
- ✅ AZD: Có thể lặp lại, kiểm soát phiên bản, tự động hóa
- ⚠️ Portal: Nhấp chuột thủ công, khó tái tạo

**Hãy nghĩ về AZD như**: Docker Compose dành cho Azure—cấu hình đơn giản cho các triển khai phức tạp.

---

## Câu hỏi thường gặp

**Q: Tôi có thể sử dụng ngôn ngữ lập trình khác không?**  
A: Có! Thay thế `src/web/` bằng Node.js, C#, Go, hoặc bất kỳ ngôn ngữ nào. Cập nhật `azure.yaml` và Bicep tương ứng.

**Q: Làm thế nào để thêm nhiều cơ sở dữ liệu hơn?**  
A: Thêm một module SQL Database khác trong `infra/main.bicep` hoặc sử dụng PostgreSQL/MySQL từ các dịch vụ cơ sở dữ liệu Azure.

**Q: Tôi có thể sử dụng điều này cho sản xuất không?**  
A: Đây là điểm khởi đầu. Đối với sản xuất, hãy thêm: managed identity, private endpoints, dự phòng, chiến lược sao lưu, WAF, và giám sát nâng cao.

**Q: Nếu tôi muốn sử dụng container thay vì triển khai mã thì sao?**  
A: Xem [Ví dụ Container Apps](../../../../examples/container-app) sử dụng Docker container toàn bộ.

**Q: Làm thế nào để kết nối với cơ sở dữ liệu từ máy cục bộ của tôi?**  
A: Thêm IP của bạn vào tường lửa SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Tôi có thể sử dụng cơ sở dữ liệu hiện có thay vì tạo mới không?**  
A: Có, sửa đổi `infra/main.bicep` để tham chiếu đến SQL Server hiện có và cập nhật các tham số chuỗi kết nối.

---

> **Lưu ý:** Ví dụ này minh họa các thực hành tốt nhất để triển khai ứng dụng web với cơ sở dữ liệu sử dụng AZD. Nó bao gồm mã hoạt động, tài liệu toàn diện, và các bài tập thực hành để củng cố việc học. Đối với triển khai sản xuất, hãy xem xét các yêu cầu về bảo mật, mở rộng, tuân thủ, và chi phí cụ thể cho tổ chức của bạn.

**📚 Điều hướng khóa học:**
- ← Trước: [Ví dụ Container Apps](../../../../examples/container-app)
- → Tiếp theo: [Hướng dẫn tích hợp AI](../../../../docs/ai-foundry)
- 🏠 [Trang chủ khóa học](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->