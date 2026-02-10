# Triển khai cơ sở dữ liệu Microsoft SQL và Web App bằng AZD

⏱️ **Thời gian ước tính**: 20-30 phút | 💰 **Chi phí ước tính**: ~$15-25/tháng | ⭐ **Độ phức tạp**: Trung cấp

Ví dụ **hoàn chỉnh, hoạt động** này minh họa cách sử dụng [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) để triển khai một ứng dụng web Python Flask với cơ sở dữ liệu Microsoft SQL lên Azure. Tất cả mã đều được bao gồm và kiểm thử — không cần phụ thuộc bên ngoài.

## Những gì bạn sẽ học

Hoàn thành ví dụ này, bạn sẽ:
- Triển khai ứng dụng đa tầng (web app + database) sử dụng hạ tầng dưới dạng mã
- Cấu hình kết nối cơ sở dữ liệu an toàn mà không ghi cứng bí mật
- Giám sát sức khỏe ứng dụng bằng Application Insights
- Quản lý tài nguyên Azure hiệu quả với AZD CLI
- Tuân theo các thực tiễn tốt nhất của Azure về bảo mật, tối ưu chi phí và khả năng quan sát

## Tổng quan kịch bản
- **Web App**: API REST Python Flask với kết nối cơ sở dữ liệu
- **Database**: Azure SQL Database với dữ liệu mẫu
- **Infrastructure**: Cấp phát bằng Bicep (mẫu mô-đun, có thể tái sử dụng)
- **Deployment**: Tự động hoàn toàn bằng lệnh `azd`
- **Monitoring**: Application Insights cho logs và telemetry

## Yêu cầu trước khi bắt đầu

### Công cụ cần thiết

Trước khi bắt đầu, xác nhận bạn đã cài đặt các công cụ sau:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (phiên bản 2.50.0 trở lên)
   ```sh
   az --version
   # Kết quả mong đợi: azure-cli 2.50.0 hoặc cao hơn
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (phiên bản 1.0.0 trở lên)
   ```sh
   azd version
   # Kết quả mong đợi: azd phiên bản 1.0.0 hoặc cao hơn
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (cho phát triển cục bộ)
   ```sh
   python --version
   # Đầu ra mong đợi: Python 3.8 hoặc mới hơn
   ```

4. **[Docker](https://www.docker.com/get-started)** (tùy chọn, cho phát triển trong container cục bộ)
   ```sh
   docker --version
   # Đầu ra mong đợi: Docker phiên bản 20.10 hoặc cao hơn
   ```

### Yêu cầu Azure

- Có **subscription Azure** đang hoạt động ([tạo tài khoản miễn phí](https://azure.microsoft.com/free/))
- Quyền tạo tài nguyên trong subscription của bạn
- Vai trò **Owner** hoặc **Contributor** trên subscription hoặc resource group

### Kiến thức cần có

Đây là ví dụ ở mức **trung cấp**. Bạn nên quen thuộc với:
- Các thao tác cơ bản dòng lệnh
- Các khái niệm đám mây cơ bản (resources, resource groups)
- Hiểu biết cơ bản về ứng dụng web và cơ sở dữ liệu

**Mới với AZD?** Bắt đầu với [Hướng dẫn Bắt đầu](../../docs/chapter-01-foundation/azd-basics.md) trước.

## Kiến trúc

Ví dụ này triển khai kiến trúc hai tầng với ứng dụng web và cơ sở dữ liệu SQL:

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
- **Resource Group**: Vùng chứa cho tất cả tài nguyên
- **App Service Plan**: Lưu trữ trên Linux (hạng B1 để tiết kiệm chi phí)
- **Web App**: Runtime Python 3.11 với ứng dụng Flask
- **SQL Server**: Máy chủ cơ sở dữ liệu được quản lý với TLS tối thiểu 1.2
- **SQL Database**: Hạng Basic (2GB, phù hợp cho phát triển/kiểm thử)
- **Application Insights**: Giám sát và ghi log
- **Log Analytics Workspace**: Lưu trữ log tập trung

**Tương tự**: Hãy tưởng tượng như một nhà hàng (web app) với kho đông (database). Khách hàng gọi món (các endpoint API), và bếp (ứng dụng Flask) lấy nguyên liệu (dữ liệu) từ kho đông. Quản lý nhà hàng (Application Insights) theo dõi mọi thứ xảy ra.

## Cấu trúc thư mục

Tất cả tệp đều được bao gồm trong ví dụ này — không cần phụ thuộc bên ngoài:

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

**Mỗi tệp làm gì:**
- **azure.yaml**: Cho AZD biết cái gì được triển khai và ở đâu
- **infra/main.bicep**: Điều phối tất cả tài nguyên Azure
- **infra/resources/*.bicep**: Định nghĩa từng tài nguyên riêng (mô-đun để tái sử dụng)
- **src/web/app.py**: Ứng dụng Flask với logic cơ sở dữ liệu
- **requirements.txt**: Phụ thuộc gói Python
- **Dockerfile**: Hướng dẫn đóng gói container cho triển khai

## Bắt đầu nhanh (Từng bước)

### Bước 1: Clone và điều hướng

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Kiểm tra thành công**: Xác nhận bạn thấy `azure.yaml` và thư mục `infra/`:
```sh
ls
# Mong đợi: README.md, azure.yaml, infra/, src/
```

### Bước 2: Xác thực với Azure

```sh
azd auth login
```

Lệnh này sẽ mở trình duyệt để xác thực Azure. Đăng nhập bằng thông tin xác thực Azure của bạn.

**✓ Kiểm tra thành công**: Bạn sẽ thấy:
```
Logged in to Azure.
```

### Bước 3: Khởi tạo môi trường

```sh
azd init
```

**Điều gì xảy ra**: AZD tạo cấu hình cục bộ cho việc triển khai của bạn.

**Các câu hỏi bạn sẽ thấy**:
- **Environment name**: Nhập một tên ngắn (ví dụ: `dev`, `myapp`)
- **Azure subscription**: Chọn subscription của bạn từ danh sách
- **Azure location**: Chọn một vùng (ví dụ: `eastus`, `westeurope`)

**✓ Kiểm tra thành công**: Bạn sẽ thấy:
```
SUCCESS: New project initialized!
```

### Bước 4: Cấp phát tài nguyên Azure

```sh
azd provision
```

**Điều gì xảy ra**: AZD triển khai toàn bộ hạ tầng (mất 5-8 phút):
1. Tạo resource group
2. Tạo SQL Server và Database
3. Tạo App Service Plan
4. Tạo Web App
5. Tạo Application Insights
6. Cấu hình mạng và bảo mật

**Bạn sẽ được yêu cầu nhập**:
- **SQL admin username**: Nhập tên người dùng (ví dụ: `sqladmin`)
- **SQL admin password**: Nhập mật khẩu mạnh (lưu lại!)

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

Lệnh này mở ứng dụng web đã triển khai trên trình duyệt tại `https://app-<unique-id>.azurewebsites.net`

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

### Bước 7: Kiểm thử các endpoint API

**Kiểm tra sức khỏe** (xác minh kết nối cơ sở dữ liệu):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Phản hồi mong đợi**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Liệt kê Sản phẩm** (dữ liệu mẫu):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Phản hồi mong đợi**:
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

**Lấy một Sản phẩm**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Kiểm tra thành công**: Tất cả endpoint trả về dữ liệu JSON không lỗi.

---

**🎉 Xin chúc mừng!** Bạn đã triển khai thành công một ứng dụng web kèm cơ sở dữ liệu lên Azure bằng AZD.

## Đi sâu vào Cấu hình

### Biến môi trường

Các bí mật được quản lý an toàn thông qua cấu hình Azure App Service — **không bao giờ ghi cứng trong mã nguồn**.

**Được AZD cấu hình tự động**:
- `SQL_CONNECTION_STRING`: Chuỗi kết nối tới cơ sở dữ liệu với thông tin đăng nhập được mã hóa
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Điểm cuối telemetry cho giám sát
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Cho phép cài đặt phụ thuộc tự động khi triển khai

**Nơi lưu trữ bí mật**:
1. Trong quá trình `azd provision`, bạn cung cấp thông tin đăng nhập SQL qua các lời nhắc an toàn
2. AZD lưu chúng trong tệp cục bộ `.azure/<env-name>/.env` (được git-ignore)
3. AZD tiêm chúng vào cấu hình Azure App Service (được mã hóa khi lưu)
4. Ứng dụng đọc chúng thông qua `os.getenv()` ở thời điểm chạy

### Phát triển cục bộ

Để kiểm thử cục bộ, tạo tệp `.env` từ mẫu:

```sh
cp .env.sample .env
# Chỉnh sửa tệp .env để sử dụng kết nối cơ sở dữ liệu cục bộ của bạn
```

**Luồng làm việc phát triển cục bộ**:
```sh
# Cài đặt các phụ thuộc
cd src/web
pip install -r requirements.txt

# Đặt biến môi trường
export SQL_CONNECTION_STRING="your-local-connection-string"

# Chạy ứng dụng
python app.py
```

**Kiểm thử cục bộ**:
```sh
curl http://localhost:8000/health
# Kết quả mong đợi: {"status": "healthy", "database": "connected"}
```

### Hạ tầng như mã

Tất cả tài nguyên Azure được định nghĩa trong **mẫu Bicep** (thư mục `infra/`):

- **Thiết kế mô-đun**: Mỗi loại tài nguyên có tệp riêng để tái sử dụng
- **Tham số hóa**: Tùy chỉnh SKUs, vùng, quy ước đặt tên
- **Thực tiễn tốt nhất**: Tuân theo tiêu chuẩn đặt tên và mặc định bảo mật của Azure
- **Quản lý phiên bản**: Thay đổi hạ tầng được theo dõi trong Git

**Ví dụ tùy chỉnh**:
Để thay đổi hạng cơ sở dữ liệu, chỉnh `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Thực hành bảo mật tốt nhất

Ví dụ này tuân theo các thực hành bảo mật tốt nhất của Azure:

### 1. **Không lưu bí mật trong mã nguồn**
- ✅ Thông tin xác thực được lưu trong cấu hình Azure App Service (được mã hóa)
- ✅ Các tệp `.env` được loại trừ khỏi Git qua `.gitignore`
- ✅ Bí mật được truyền qua tham số an toàn khi cấp phát

### 2. **Kết nối được mã hóa**
- ✅ TLS tối thiểu 1.2 cho SQL Server
- ✅ Chỉ cho phép HTTPS cho Web App
- ✅ Kết nối cơ sở dữ liệu sử dụng kênh được mã hóa

### 3. **Bảo mật mạng**
- ✅ Firewall của SQL Server được cấu hình cho phép dịch vụ Azure chỉ
- ✅ Truy cập mạng công cộng bị hạn chế (có thể khóa thêm bằng Private Endpoints)
- ✅ FTPS bị vô hiệu hóa trên Web App

### 4. **Xác thực & Ủy quyền**
- ⚠️ **Hiện tại**: Xác thực SQL (username/password)
- ✅ **Khuyến nghị cho Sản xuất**: Sử dụng Azure Managed Identity để xác thực không cần mật khẩu

**Để nâng cấp lên Managed Identity** (cho môi trường sản xuất):
1. Bật managed identity trên Web App
2. Cấp quyền SQL cho identity
3. Cập nhật chuỗi kết nối để sử dụng managed identity
4. Loại bỏ xác thực dựa trên mật khẩu

### 5. **Kiểm toán & Tuân thủ**
- ✅ Application Insights ghi lại tất cả yêu cầu và lỗi
- ✅ Audit của SQL Database được bật (có thể cấu hình cho tuân thủ)
- ✅ Tất cả tài nguyên được gắn tag cho quản trị

**Danh sách kiểm tra bảo mật trước khi đưa vào sản xuất**:
- [ ] Bật Azure Defender cho SQL
- [ ] Cấu hình Private Endpoints cho SQL Database
- [ ] Bật Web Application Firewall (WAF)
- [ ] Triển khai Azure Key Vault cho xoay vòng bí mật
- [ ] Cấu hình xác thực Azure AD
- [ ] Bật ghi nhật ký chẩn đoán cho tất cả tài nguyên

## Tối ưu chi phí

**Chi phí ước tính hàng tháng** (tính đến tháng 11 năm 2025):

| Tài nguyên | SKU/Tier | Chi phí ước tính |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Tổng** | | **~$20/month** |

**💡 Mẹo tiết kiệm chi phí**:

1. **Sử dụng hạng miễn phí để học**:
   - App Service: Hạng F1 (miễn phí, giờ sử dụng hạn chế)
   - SQL Database: Sử dụng Azure SQL Database serverless
   - Application Insights: 5GB/tháng miễn phí ingestion

2. **Tắt tài nguyên khi không sử dụng**:
   ```sh
   # Dừng ứng dụng web (cơ sở dữ liệu vẫn bị tính phí)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Khởi động lại khi cần
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Xóa mọi thứ sau khi kiểm thử**:
   ```sh
   azd down
   ```
   Điều này xóa TẤT CẢ tài nguyên và ngăn các khoản phí tiếp tục phát sinh.

4. **SKU cho Phát triển so với Sản xuất**:
   - **Phát triển**: Hạng Basic (được sử dụng trong ví dụ này)
   - **Sản xuất**: Hạng Standard/Premium với độ dư thừa

**Giám sát chi phí**:
- Xem chi phí trong [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Thiết lập cảnh báo chi phí để tránh bất ngờ
- Gắn tag tất cả tài nguyên với `azd-env-name` để theo dõi

**Lựa chọn hạng miễn phí thay thế**:
Cho mục đích học tập, bạn có thể sửa `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Lưu ý**: Hạng miễn phí có giới hạn (60 phút/ngày CPU, không luôn-on).

## Giám sát & Khả năng quan sát

### Tích hợp Application Insights

Ví dụ này bao gồm **Application Insights** cho giám sát toàn diện:

**Những gì được giám sát**:
- ✅ Yêu cầu HTTP (độ trễ, mã trạng thái, endpoint)
- ✅ Lỗi và exception của ứng dụng
- ✅ Ghi log tùy chỉnh từ ứng dụng Flask
- ✅ Sức khỏe kết nối cơ sở dữ liệu
- ✅ Thông số hiệu năng (CPU, bộ nhớ)

**Truy cập Application Insights**:
1. Mở [Azure Portal](https://portal.azure.com)
2. Điều hướng đến resource group của bạn (`rg-<env-name>`)
3. Nhấp vào resource Application Insights (`appi-<unique-id>`)

**Các truy vấn hữu ích** (Application Insights → Logs):

**Xem tất cả yêu cầu**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Tìm lỗi**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Kiểm tra endpoint sức khỏe**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Kiểm toán SQL Database

**Kiểm toán SQL Database được bật** để theo dõi:
- Mẫu truy cập cơ sở dữ liệu
- Thử đăng nhập thất bại
- Thay đổi schema
- Truy cập dữ liệu (cho mục đích tuân thủ)

**Truy cập log kiểm toán**:
1. Azure Portal → SQL Database → Auditing
2. Xem log trong Log Analytics workspace

### Giám sát theo thời gian thực

**Xem Live Metrics**:
1. Application Insights → Live Metrics
2. Xem yêu cầu, thất bại và hiệu năng theo thời gian thực

**Thiết lập cảnh báo**:
Tạo cảnh báo cho các sự kiện quan trọng:
- HTTP 500 errors > 5 trong 5 phút
- Thất bại kết nối cơ sở dữ liệu
- Thời gian phản hồi cao (>2 giây)

**Ví dụ Tạo Cảnh báo**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Khắc phục sự cố

### Các vấn đề thường gặp và giải pháp

#### 1. `azd provision` thất bại với "Location not available"

**Triệu chứng**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Giải pháp**:
Chọn một khu vực Azure khác hoặc đăng ký nhà cung cấp tài nguyên:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Kết nối SQL không thành công trong quá trình triển khai

**Triệu chứng**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Giải pháp**:
- Xác minh tường lửa SQL Server cho phép dịch vụ Azure (được cấu hình tự động)
- Kiểm tra mật khẩu quản trị SQL đã được nhập đúng khi chạy `azd provision`
- Đảm bảo SQL Server đã được cấp phát hoàn chỉnh (có thể mất 2-3 phút)

**Xác minh kết nối**:
```sh
# Từ Azure Portal, chuyển đến SQL Database → Trình chỉnh sửa truy vấn
# Thử kết nối bằng thông tin đăng nhập của bạn
```

#### 3. Ứng dụng Web hiển thị "Application Error"

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

#### 4. `azd deploy` thất bại với "Build Error"

**Triệu chứng**:
```
Error: Failed to build project
```

**Giải pháp**:
- Đảm bảo `requirements.txt` không có lỗi cú pháp
- Kiểm tra rằng Python 3.11 được chỉ định trong `infra/resources/web-app.bicep`
- Xác minh Dockerfile có image cơ sở chính xác

**Gỡ lỗi cục bộ**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" Khi chạy các lệnh AZD

**Triệu chứng**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Giải pháp**:
Đăng nhập lại với Azure:
```sh
azd auth login
az login
```

Xác minh bạn có quyền phù hợp (vai trò Contributor) trên đăng ký.

#### 6. Chi phí cơ sở dữ liệu cao

**Triệu chứng**:
Hóa đơn Azure bất ngờ.

**Giải pháp**:
- Kiểm tra xem bạn có quên chạy `azd down` sau khi thử nghiệm không
- Xác minh SQL Database đang sử dụng cấp Basic (không phải Premium)
- Xem xét chi phí trong Azure Cost Management
- Thiết lập cảnh báo chi phí

### Nhận trợ giúp

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

**Cần thêm trợ giúp?**
- [Hướng dẫn khắc phục sự cố AZD](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Khắc phục sự cố Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Khắc phục sự cố Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Bài tập thực hành

### Bài tập 1: Xác minh Triển khai của bạn (Người mới bắt đầu)

**Mục tiêu**: Xác nhận tất cả tài nguyên đã được triển khai và ứng dụng hoạt động.

**Các bước**:
1. Liệt kê tất cả tài nguyên trong nhóm tài nguyên của bạn:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Kết quả mong đợi**: 6-7 tài nguyên (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Kiểm tra tất cả các endpoint API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Kết quả mong đợi**: Tất cả trả về JSON hợp lệ, không có lỗi

3. Kiểm tra Application Insights:
   - Chuyển đến Application Insights trong Azure Portal
   - Chuyển đến "Live Metrics"
   - Làm mới trình duyệt của bạn trên ứng dụng web
   **Kết quả mong đợi**: Thấy các yêu cầu xuất hiện theo thời gian thực

**Tiêu chí thành công**: Tất cả 6-7 tài nguyên tồn tại, tất cả các endpoint trả về dữ liệu, Live Metrics hiển thị hoạt động.

---

### Bài tập 2: Thêm endpoint API mới (Trung cấp)

**Mục tiêu**: Mở rộng ứng dụng Flask với một endpoint mới.

**Mã khởi đầu**: Các endpoint hiện tại trong `src/web/app.py`

**Các bước**:
1. Chỉnh sửa `src/web/app.py` và thêm một endpoint mới sau hàm `get_product()`:
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

3. Kiểm tra endpoint mới:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Kết quả mong đợi**: Trả về các sản phẩm khớp với "laptop"

**Tiêu chí thành công**: Endpoint mới hoạt động, trả về kết quả đã lọc, xuất hiện trong nhật ký Application Insights.

---

### Bài tập 3: Thêm giám sát và cảnh báo (Nâng cao)

**Mục tiêu**: Thiết lập giám sát chủ động với cảnh báo.

**Các bước**:
1. Tạo một cảnh báo cho lỗi HTTP 500:
   ```sh
   # Lấy ID tài nguyên của Application Insights
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

3. Kiểm tra xem cảnh báo đã được kích hoạt chưa:
   - Azure Portal → Alerts → Alert Rules
   - Kiểm tra email của bạn (nếu được cấu hình)

**Tiêu chí thành công**: Quy tắc cảnh báo được tạo, kích hoạt khi có lỗi, nhận được thông báo.

---

### Bài tập 4: Thay đổi lược đồ cơ sở dữ liệu (Nâng cao)

**Mục tiêu**: Thêm một bảng mới và sửa đổi ứng dụng để sử dụng nó.

**Các bước**:
1. Kết nối tới SQL Database qua Azure Portal Query Editor

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
2. Cập nhật `src/web/app.py` để lưu vào bộ nhớ đệm các truy vấn sản phẩm
3. Đo cải thiện hiệu suất bằng Application Insights
4. So sánh thời gian phản hồi trước/sau khi dùng bộ nhớ đệm

**Tiêu chí thành công**: Redis được triển khai, bộ nhớ đệm hoạt động, thời gian phản hồi cải thiện >50%.

**Gợi ý**: Bắt đầu với [Tài liệu Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Dọn dẹp

Để tránh bị tính phí liên tục, hãy xóa tất cả tài nguyên khi hoàn tất:

```sh
azd down
```

**Lời nhắc xác nhận**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Gõ `y` để xác nhận.

**✓ Kiểm tra thành công**: 
- Tất cả tài nguyên đã bị xóa khỏi Azure Portal
- Không có khoản phí đang tiếp diễn
- Thư mục cục bộ `.azure/<env-name>` có thể bị xóa

**Thay thế** (giữ hạ tầng, xóa dữ liệu):
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
- [Tham chiếu ngôn ngữ Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Bước tiếp theo trong Khóa học này
- **[Ví dụ Container Apps](../../../../examples/container-app)**: Triển khai microservices với Azure Container Apps
- **[Hướng dẫn tích hợp AI](../../../../docs/ai-foundry)**: Thêm khả năng AI vào ứng dụng của bạn
- **[Thực hành tốt nhất triển khai](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Các mẫu triển khai cho môi trường sản xuất

### Chủ đề nâng cao
- **Managed Identity**: Loại bỏ mật khẩu và sử dụng xác thực Azure AD
- **Private Endpoints**: Bảo mật kết nối cơ sở dữ liệu trong mạng ảo
- **CI/CD Integration**: Tự động hóa triển khai với GitHub Actions hoặc Azure DevOps
- **Multi-Environment**: Thiết lập các môi trường dev, staging và production
- **Database Migrations**: Sử dụng Alembic hoặc Entity Framework cho quản lý phiên bản lược đồ

### So sánh với các phương pháp khác

**AZD so với ARM Templates**:
- ✅ AZD: Trừu tượng cấp cao hơn, các lệnh đơn giản hơn
- ⚠️ ARM: Chi tiết hơn, kiểm soát tỉ mỉ hơn

**AZD so với Terraform**:
- ✅ AZD: Thuộc Azure, tích hợp với các dịch vụ Azure
- ⚠️ Terraform: Hỗ trợ đa đám mây, hệ sinh thái lớn hơn

**AZD so với Azure Portal**:
- ✅ AZD: Có thể lặp lại, kiểm soát phiên bản, tự động hóa được
- ⚠️ Portal: Thao tác thủ công qua click, khó tái tạo

**Hãy nghĩ về AZD như**: Docker Compose cho Azure—cấu hình đơn giản cho các triển khai phức tạp.

---

## Câu hỏi thường gặp

**Q: Tôi có thể sử dụng ngôn ngữ lập trình khác không?**  
A: Có! Thay thế `src/web/` bằng Node.js, C#, Go, hoặc bất kỳ ngôn ngữ nào. Cập nhật `azure.yaml` và Bicep tương ứng.

**Q: Làm thế nào để thêm nhiều cơ sở dữ liệu hơn?**  
A: Thêm một module SQL Database khác trong `infra/main.bicep` hoặc sử dụng PostgreSQL/MySQL từ dịch vụ Azure Database.

**Q: Tôi có thể sử dụng điều này cho môi trường production không?**  
A: Đây là điểm khởi đầu. Đối với môi trường sản xuất, thêm: managed identity, private endpoints, redundancy, chiến lược sao lưu, WAF và giám sát nâng cao.

**Q: Nếu tôi muốn dùng containers thay vì triển khai mã thì sao?**  
A: Tham khảo [Ví dụ Container Apps](../../../../examples/container-app) sử dụng Docker containers xuyên suốt.

**Q: Làm thế nào để kết nối tới cơ sở dữ liệu từ máy cục bộ của tôi?**  
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Tôi có thể sử dụng cơ sở dữ liệu hiện có thay vì tạo một cái mới không?**  
A: Có, sửa `infra/main.bicep` để tham chiếu đến một SQL Server hiện có và cập nhật các tham số chuỗi kết nối.

---

> **Lưu ý:** Ví dụ này minh họa các thực hành tốt nhất để triển khai một ứng dụng web với cơ sở dữ liệu bằng AZD. Nó bao gồm mã hoạt động, tài liệu toàn diện và các bài tập thực hành để củng cố việc học. Đối với triển khai sản xuất, hãy xem xét các yêu cầu về bảo mật, mở rộng, tuân thủ và chi phí riêng cho tổ chức của bạn.

**📚 Điều hướng Khóa học:**
- ← Trước: [Ví dụ Container Apps](../../../../examples/container-app)
- → Tiếp theo: [Hướng dẫn tích hợp AI](../../../../docs/ai-foundry)
- 🏠 [Trang chủ Khóa học](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn chính thức. Đối với thông tin quan trọng, nên sử dụng bản dịch do chuyên gia dịch thuật thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu nhầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->