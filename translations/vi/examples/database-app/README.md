# Triển khai cơ sở dữ liệu Microsoft SQL và Ứng dụng Web với AZD

⏱️ **Thời gian dự kiến**: 20-30 phút | 💰 **Chi phí ước tính**: ~$15-25/tháng | ⭐ **Mức độ**: Trung cấp

Ví dụ hoàn chỉnh và hoạt động này minh họa cách sử dụng [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) để triển khai một ứng dụng web Python Flask với cơ sở dữ liệu Microsoft SQL lên Azure. Tất cả mã đều được bao gồm và kiểm thử — không cần phụ thuộc bên ngoài.

## Những gì bạn sẽ học

Khi hoàn thành ví dụ này, bạn sẽ:
- Triển khai ứng dụng nhiều tầng (web app + database) sử dụng hạ tầng như mã
- Cấu hình kết nối cơ sở dữ liệu an toàn mà không ghi cứng bí mật
- Giám sát sức khỏe ứng dụng với Application Insights
- Quản lý tài nguyên Azure hiệu quả với AZD CLI
- Tuân theo các thực hành tốt nhất của Azure về bảo mật, tối ưu chi phí và quan sát

## Tổng quan kịch bản
- **Web App**: REST API Python Flask với kết nối cơ sở dữ liệu
- **Database**: Azure SQL Database với dữ liệu mẫu
- **Infrastructure**: Triển khai bằng Bicep (mô-đun, có thể tái sử dụng)
- **Deployment**: Hoàn toàn tự động với các lệnh `azd`
- **Monitoring**: Application Insights cho logs và telemetry

## Yêu cầu trước khi bắt đầu

### Công cụ yêu cầu

Trước khi bắt đầu, xác minh bạn đã cài đặt các công cụ sau:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (phiên bản 2.50.0 trở lên)
   ```sh
   az --version
   # Đầu ra mong đợi: azure-cli 2.50.0 trở lên
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (phiên bản 1.0.0 trở lên)
   ```sh
   azd version
   # Đầu ra mong đợi: azd phiên bản 1.0.0 trở lên
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (cho phát triển cục bộ)
   ```sh
   python --version
   # Đầu ra mong đợi: Python 3.8 trở lên
   ```

4. **[Docker](https://www.docker.com/get-started)** (tùy chọn, cho phát triển container cục bộ)
   ```sh
   docker --version
   # Kết quả mong đợi: Docker phiên bản 20.10 trở lên
   ```

### Yêu cầu Azure

- Một **đăng ký Azure** đang hoạt động ([tạo tài khoản miễn phí](https://azure.microsoft.com/free/))
- Quyền tạo tài nguyên trong đăng ký của bạn
- Vai trò **Owner** hoặc **Contributor** trên đăng ký hoặc nhóm tài nguyên

### Yêu cầu kiến thức

Đây là một ví dụ **mức trung cấp**. Bạn nên quen thuộc với:
- Thao tác cơ bản trên dòng lệnh
- Khái niệm đám mây cơ bản (tài nguyên, nhóm tài nguyên)
- Hiểu biết cơ bản về ứng dụng web và cơ sở dữ liệu

**Mới bắt đầu với AZD?** Bắt đầu với [Hướng dẫn Bắt đầu](../../docs/chapter-01-foundation/azd-basics.md) trước.

## Kiến trúc

Ví dụ này triển khai kiến trúc hai tầng với ứng dụng web và cơ sở dữ liệu SQL:

```mermaid
graph TD
    Browser[Trình duyệt người dùng] <--> WebApp[Ứng dụng Web Azure<br/>Flask API<br/>/health<br/>/products]
    WebApp -- Kết nối an toàn<br/>Đã mã hóa --> SQL[Cơ sở dữ liệu Azure SQL<br/>Bảng Products<br/>Dữ liệu mẫu]
```
**Triển khai Tài nguyên:**
- **Resource Group**: Nơi chứa tất cả tài nguyên
- **App Service Plan**: Hosting trên Linux (hạng B1 để tối ưu chi phí)
- **Web App**: Runtime Python 3.11 với ứng dụng Flask
- **SQL Server**: Máy chủ cơ sở dữ liệu được quản lý với TLS tối thiểu 1.2
- **SQL Database**: Hạng Basic (2GB, phù hợp cho phát triển/kiểm thử)
- **Application Insights**: Giám sát và ghi nhật ký
- **Log Analytics Workspace**: Lưu trữ nhật ký tập trung

**Tương tự**: Hãy tưởng tượng giống như một nhà hàng (web app) với một phòng đông lạnh (database). Khách hàng đặt món từ thực đơn (API endpoints), và nhà bếp (ứng dụng Flask) lấy nguyên liệu (dữ liệu) từ phòng đông lạnh. Quản lý nhà hàng (Application Insights) theo dõi mọi thứ xảy ra.

## Cấu trúc Thư mục

Tất cả các tệp đều được bao gồm trong ví dụ này — không cần phụ thuộc bên ngoài:

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
- **azure.yaml**: Cho AZD biết những gì cần triển khai và nơi triển khai
- **infra/main.bicep**: Điều phối tất cả tài nguyên Azure
- **infra/resources/*.bicep**: Định nghĩa tài nguyên riêng lẻ (mô-đun để tái sử dụng)
- **src/web/app.py**: Ứng dụng Flask với logic cơ sở dữ liệu
- **requirements.txt**: Phụ thuộc gói Python
- **Dockerfile**: Hướng dẫn container hóa để triển khai

## Bắt đầu Nhanh (Từng bước)

### Bước 1: Clone và Điều hướng

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Kiểm tra thành công**: Xác minh bạn thấy `azure.yaml` và thư mục `infra/`:
```sh
ls
# Dự kiến: README.md, azure.yaml, infra/, src/
```

### Bước 2: Xác thực với Azure

```sh
azd auth login
```

Việc này sẽ mở trình duyệt để xác thực Azure. Đăng nhập bằng thông tin đăng nhập Azure của bạn.

**✓ Kiểm tra thành công**: Bạn sẽ thấy:
```
Logged in to Azure.
```

### Bước 3: Khởi tạo Môi trường

```sh
azd init
```

**Điều gì xảy ra**: AZD tạo cấu hình cục bộ cho triển khai của bạn.

**Các lời nhắc bạn sẽ thấy**:
- **Tên môi trường**: Nhập một tên ngắn (ví dụ, `dev`, `myapp`)
- **Azure subscription**: Chọn đăng ký của bạn từ danh sách
- **Vị trí Azure**: Chọn một vùng (ví dụ, `eastus`, `westeurope`)

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

**Bạn sẽ được yêu cầu cung cấp**:
- **Tên đăng nhập quản trị SQL**: Nhập tên người dùng (ví dụ, `sqladmin`)
- **Mật khẩu quản trị SQL**: Nhập mật khẩu mạnh (hãy lưu mật khẩu này!)

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

### Bước 6: Mở ứng dụng trên trình duyệt

```sh
azd browse
```

Việc này sẽ mở ứng dụng web bạn đã triển khai trong trình duyệt tại `https://app-<unique-id>.azurewebsites.net`

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

### Bước 7: Kiểm tra các endpoint API

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

**Liệt kê sản phẩm** (dữ liệu mẫu):
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

**Lấy một sản phẩm**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Kiểm tra thành công**: Tất cả các endpoint trả về dữ liệu JSON mà không lỗi.

---

**🎉 Chúc mừng!** Bạn đã triển khai thành công một ứng dụng web kèm cơ sở dữ liệu lên Azure bằng AZD.

## Đi sâu vào Cấu hình

### Biến môi trường

Bí mật được quản lý an toàn thông qua cấu hình Azure App Service — **không bao giờ ghi cứng trong mã nguồn**.

**Được AZD cấu hình tự động**:
- `SQL_CONNECTION_STRING`: Chuỗi kết nối cơ sở dữ liệu với thông tin xác thực được mã hóa
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Điểm cuối telemetry cho giám sát
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Bật cài đặt phụ thuộc tự động trong quá trình triển khai

**Nơi lưu trữ bí mật**:
1. Trong quá trình `azd provision`, bạn cung cấp thông tin xác thực SQL qua các lời nhắc an toàn
2. AZD lưu chúng trong tệp cục bộ `.azure/<env-name>/.env` (được git-ignore)
3. AZD tiêm chúng vào cấu hình Azure App Service (được mã hóa khi lưu trữ)
4. Ứng dụng đọc chúng qua `os.getenv()` khi chạy

### Phát triển cục bộ

Để kiểm thử cục bộ, tạo tệp `.env` từ mẫu:

```sh
cp .env.sample .env
# Chỉnh sửa .env bằng kết nối cơ sở dữ liệu cục bộ của bạn
```

**Luồng làm việc Phát triển cục bộ**:
```sh
# Cài đặt các phụ thuộc
cd src/web
pip install -r requirements.txt

# Thiết lập biến môi trường
export SQL_CONNECTION_STRING="your-local-connection-string"

# Chạy ứng dụng
python app.py
```

**Kiểm tra cục bộ**:
```sh
curl http://localhost:8000/health
# Kết quả mong đợi: {"status": "healthy", "database": "connected"}
```

### Hạ tầng như mã

Tất cả tài nguyên Azure được định nghĩa trong các mẫu Bicep (`infra/` folder):

- **Thiết kế mô-đun**: Mỗi loại tài nguyên có tệp riêng để tái sử dụng
- **Tham số hóa**: Tùy chỉnh SKU, vùng, quy ước đặt tên
- **Thực hành tốt nhất**: Tuân theo tiêu chuẩn đặt tên Azure và cài đặt bảo mật mặc định
- **Kiểm soát phiên bản**: Thay đổi hạ tầng được theo dõi trong Git

**Ví dụ tùy chỉnh**:
Để thay đổi hạng cơ sở dữ liệu, sửa `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Thực hành Bảo mật Tốt nhất

Ví dụ này tuân theo các thực hành bảo mật tốt nhất của Azure:

### 1. **Không lưu bí mật trong mã nguồn**
- ✅ Thông tin đăng nhập được lưu trong cấu hình Azure App Service (được mã hóa)
- ✅ Tệp `.env` được loại trừ khỏi Git qua `.gitignore`
- ✅ Bí mật được truyền qua tham số an toàn trong quá trình cấp phát

### 2. **Kết nối được mã hóa**
- ✅ TLS tối thiểu 1.2 cho SQL Server
- ✅ Chỉ cho phép HTTPS cho Web App
- ✅ Kết nối tới cơ sở dữ liệu sử dụng kênh được mã hóa

### 3. **Bảo mật Mạng**
- ✅ Firewall SQL Server được cấu hình chỉ cho phép dịch vụ Azure
- ✅ Truy cập mạng công khai bị hạn chế (có thể khóa thêm bằng Private Endpoints)
- ✅ FTPS bị vô hiệu hóa trên Web App

### 4. **Xác thực & Ủy quyền**
- ⚠️ **Hiện tại**: Xác thực SQL (username/password)
- ✅ **Khuyến nghị cho Production**: Sử dụng Azure Managed Identity để xác thực không cần mật khẩu

**Để nâng cấp lên Managed Identity** (cho production):
1. Bật managed identity trên Web App
2. Cấp quyền cho identity trên SQL
3. Cập nhật chuỗi kết nối để sử dụng managed identity
4. Loại bỏ xác thực dựa trên mật khẩu

### 5. **Kiểm toán & Tuân thủ**
- ✅ Application Insights ghi lại tất cả yêu cầu và lỗi
- ✅ SQL Database bật kiểm toán (có thể cấu hình cho tuân thủ)
- ✅ Tất cả tài nguyên được gắn thẻ cho quản trị

**Danh sách kiểm tra bảo mật trước khi lên Production**:
- [ ] Bật Azure Defender cho SQL
- [ ] Cấu hình Private Endpoints cho SQL Database
- [ ] Bật Web Application Firewall (WAF)
- [ ] Triển khai Azure Key Vault để xoay vòng bí mật
- [ ] Cấu hình xác thực Azure AD
- [ ] Bật ghi nhật ký chẩn đoán cho tất cả tài nguyên

## Tối ưu hóa Chi phí

**Chi phí ước tính hàng tháng** (tính đến tháng 11 năm 2025):

| Tài nguyên | SKU/Hạng | Chi phí ước tính |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/tháng |
| SQL Database | Basic (2GB) | ~$5/tháng |
| Application Insights | Pay-as-you-go | ~$2/tháng (lưu lượng thấp) |
| **Tổng cộng** | | **~$20/tháng** |

**💡 Mẹo Tiết kiệm Chi phí**:

1. **Sử dụng hạng miễn phí để học**:
   - App Service: hạng F1 (miễn phí, giờ giới hạn)
   - SQL Database: Sử dụng Azure SQL Database serverless
   - Application Insights: 5GB/tháng miễn phí cho ingestion

2. **Dừng tài nguyên khi không sử dụng**:
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
   Điều này sẽ xóa TẤT CẢ tài nguyên và ngăn chặn việc tính phí.

4. **SKU phát triển so với sản xuất**:
   - **Phát triển**: Hạng Basic (được dùng trong ví dụ này)
   - **Sản xuất**: Hạng Standard/Premium với khả năng dư thừa

**Giám sát chi phí**:
- Xem chi phí trong [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Thiết lập cảnh báo chi phí để tránh bất ngờ
- Gắn thẻ tất cả tài nguyên với `azd-env-name` để theo dõi

**Phương án hạng miễn phí thay thế**:
Cho mục đích học, bạn có thể chỉnh sửa `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Lưu ý**: Hạng miễn phí có giới hạn (60 phút/ngày CPU, không có always-on).

## Giám sát & Quan sát

### Tích hợp Application Insights

Ví dụ này bao gồm **Application Insights** cho giám sát toàn diện:

**Những gì được giám sát**:
- ✅ Yêu cầu HTTP (độ trễ, mã trạng thái, endpoints)
- ✅ Lỗi và ngoại lệ ứng dụng
- ✅ Logging tùy chỉnh từ ứng dụng Flask
- ✅ Sức khỏe kết nối cơ sở dữ liệu
- ✅ Chỉ số hiệu năng (CPU, bộ nhớ)

**Truy cập Application Insights**:
1. Mở [Azure Portal](https://portal.azure.com)
2. Điều hướng đến nhóm tài nguyên của bạn (`rg-<env-name>`)
3. Nhấp vào tài nguyên Application Insights (`appi-<unique-id>`)

**Truy vấn hữu ích** (Application Insights → Logs):

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
- Các lần đăng nhập thất bại
- Thay đổi lược đồ
- Truy cập dữ liệu (cho tuân thủ)

**Truy cập nhật ký kiểm toán**:
1. Azure Portal → SQL Database → Auditing
2. Xem logs trong Log Analytics workspace

### Giám sát thời gian thực

**Xem số liệu trực tiếp**:
1. Application Insights → Live Metrics
2. Xem yêu cầu, lỗi và hiệu năng theo thời gian thực

**Thiết lập cảnh báo**:
Tạo cảnh báo cho các sự kiện quan trọng:
- HTTP 500 > 5 trong 5 phút
- Lỗi kết nối cơ sở dữ liệu
- Thời gian phản hồi cao (>2 giây)

**Ví dụ tạo cảnh báo**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Khắc phục sự cố
### Các sự cố và giải pháp phổ biến

#### 1. `azd provision` thất bại với "Location not available"

**Symptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Solution**:
Chọn một vùng Azure khác hoặc đăng ký nhà cung cấp tài nguyên:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Kết nối SQL thất bại trong quá trình triển khai

**Symptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Solution**:
- Xác minh firewall của SQL Server cho phép dịch vụ Azure (được cấu hình tự động)
- Kiểm tra mật khẩu admin SQL đã được nhập chính xác trong khi chạy `azd provision`
- Đảm bảo SQL Server đã được cung cấp hoàn toàn (có thể mất 2-3 phút)

**Verify Connection**:
```sh
# Từ Azure Portal, vào SQL Database → Trình soạn thảo truy vấn
# Thử kết nối bằng thông tin đăng nhập của bạn
```

#### 3. Ứng dụng Web hiển thị "Application Error"

**Symptom**:
Trình duyệt hiển thị trang lỗi chung.

**Solution**:
Kiểm tra nhật ký ứng dụng:
```sh
# Xem nhật ký gần đây
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Common causes**:
- Thiếu biến môi trường (kiểm tra App Service → Cấu hình)
- Cài đặt gói Python thất bại (kiểm tra nhật ký triển khai)
- Lỗi khởi tạo cơ sở dữ liệu (kiểm tra kết nối SQL)

#### 4. `azd deploy` thất bại với "Build Error"

**Symptom**:
```
Error: Failed to build project
```

**Solution**:
- Đảm bảo `requirements.txt` không có lỗi cú pháp
- Kiểm tra rằng Python 3.11 được chỉ định trong `infra/resources/web-app.bicep`
- Xác minh Dockerfile có base image chính xác

**Debug locally**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" khi chạy các lệnh AZD

**Symptom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Solution**:
Đăng nhập lại với Azure:
```sh
# Bắt buộc cho các luồng công việc AZD
azd auth login

# Tùy chọn nếu bạn cũng đang sử dụng các lệnh Azure CLI trực tiếp
az login
```

Xác minh bạn có quyền phù hợp (vai trò Contributor) trên subscription.

#### 6. Chi phí cơ sở dữ liệu cao

**Symptom**:
Hóa đơn Azure bất ngờ.

**Solution**:
- Kiểm tra xem bạn có quên chạy `azd down` sau khi thử nghiệm không
- Xác minh SQL Database đang sử dụng tier Basic (không phải Premium)
- Xem lại chi phí trong Azure Cost Management
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

### Bài tập 1: Xác minh Triển khai của Bạn (Người mới bắt đầu)

**Mục tiêu**: Xác nhận tất cả tài nguyên đã được triển khai và ứng dụng hoạt động.

**Các bước**:
1. Liệt kê tất cả tài nguyên trong nhóm tài nguyên của bạn:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Kết quả mong đợi**: 6-7 resources (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Kiểm tra tất cả các endpoint API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Kết quả mong đợi**: Tất cả trả về JSON hợp lệ không lỗi

3. Kiểm tra Application Insights:
   - Truy cập Application Insights trong Azure Portal
   - Đi tới "Live Metrics"
   - Làm mới trình duyệt của bạn trên ứng dụng web
   **Kết quả mong đợi**: Thấy các yêu cầu xuất hiện theo thời gian thực

**Tiêu chí thành công**: Tất cả 6-7 tài nguyên tồn tại, tất cả endpoint trả về dữ liệu, Live Metrics hiển thị hoạt động.

---

### Bài tập 2: Thêm Endpoint API mới (Trung cấp)

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

### Bài tập 3: Thêm Giám sát và Cảnh báo (Nâng cao)

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

2. Kích hoạt cảnh báo bằng cách gây lỗi:
   ```sh
   # Yêu cầu một sản phẩm không tồn tại
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Kiểm tra xem cảnh báo có được kích hoạt không:
   - Azure Portal → Alerts → Alert Rules
   - Kiểm tra email của bạn (nếu đã cấu hình)

**Tiêu chí thành công**: Rule cảnh báo được tạo, kích hoạt khi có lỗi, nhận được thông báo.

---

### Bài tập 4: Thay đổi Sơ đồ Cơ sở dữ liệu (Nâng cao)

**Mục tiêu**: Thêm bảng mới và sửa ứng dụng để sử dụng bảng đó.

**Các bước**:
1. Kết nối tới SQL Database qua Query Editor trên Azure Portal

2. Tạo bảng `categories` mới:
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

3. Cập nhật `src/web/app.py` để bao gồm thông tin category trong phản hồi

4. Triển khai và kiểm tra

**Tiêu chí thành công**: Bảng mới tồn tại, sản phẩm hiển thị thông tin category, ứng dụng vẫn hoạt động.

---

### Bài tập 5: Thực hiện bộ nhớ đệm (Chuyên gia)

**Mục tiêu**: Thêm Azure Redis Cache để cải thiện hiệu năng.

**Các bước**:
1. Thêm Redis Cache vào `infra/main.bicep`
2. Cập nhật `src/web/app.py` để lưu vào bộ nhớ đệm các truy vấn sản phẩm
3. Đo cải thiện hiệu năng bằng Application Insights
4. So sánh thời gian phản hồi trước và sau khi áp dụng bộ nhớ đệm

**Tiêu chí thành công**: Redis được triển khai, bộ nhớ đệm hoạt động, thời gian phản hồi cải thiện >50%.

**Gợi ý**: Bắt đầu với [Tài liệu Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Dọn dẹp

Để tránh phí phát sinh liên tục, xóa tất cả tài nguyên khi hoàn tất:

```sh
azd down
```

**Thông báo xác nhận**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Gõ `y` để xác nhận.

**✓ Kiểm tra thành công**: 
- Tất cả tài nguyên đã bị xóa khỏi Azure Portal
- Không còn phí phát sinh
- Thư mục local `.azure/<env-name>` có thể bị xóa

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

### Các bước tiếp theo trong khóa học này
- **[Ví dụ Container Apps](../../../../examples/container-app)**: Triển khai microservices với Azure Container Apps
- **[Hướng dẫn tích hợp AI](../../../../docs/ai-foundry)**: Thêm khả năng AI vào ứng dụng của bạn
- **[Thực hành tốt nhất khi triển khai](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Mẫu triển khai cho môi trường production

### Chủ đề nâng cao
- **Managed Identity**: Loại bỏ mật khẩu và sử dụng xác thực Azure AD
- **Private Endpoints**: Bảo mật kết nối cơ sở dữ liệu trong mạng ảo
- **Tích hợp CI/CD**: Tự động hóa triển khai với GitHub Actions hoặc Azure DevOps
- **Đa môi trường**: Thiết lập dev, staging và production
- **Di chuyển cơ sở dữ liệu**: Sử dụng Alembic hoặc Entity Framework cho quản lý phiên bản schema

### So sánh với các phương pháp khác

**AZD vs. ARM Templates**:
- ✅ AZD: Trừu tượng cao hơn, lệnh đơn giản hơn
- ⚠️ ARM: Mô tả dài dòng hơn, kiểm soát chi tiết

**AZD vs. Terraform**:
- ✅ AZD: Tích hợp sẵn với Azure, native cho Azure
- ⚠️ Terraform: Hỗ trợ đa đám mây, hệ sinh thái lớn hơn

**AZD vs. Azure Portal**:
- ✅ AZD: Có thể lặp lại, kiểm soát phiên bản, tự động hóa được
- ⚠️ Portal: Thao tác thủ công, khó tái tạo

Hãy nghĩ về AZD như: Docker Compose cho Azure — cấu hình được đơn giản hóa cho các triển khai phức tạp.

---

## Các câu hỏi thường gặp

**Q: Tôi có thể sử dụng ngôn ngữ lập trình khác không?**  
A: Có! Thay thế `src/web/` bằng Node.js, C#, Go, hoặc bất kỳ ngôn ngữ nào. Cập nhật `azure.yaml` và Bicep tương ứng.

**Q: Làm sao để thêm nhiều cơ sở dữ liệu hơn?**  
A: Thêm một module SQL Database khác trong `infra/main.bicep` hoặc sử dụng PostgreSQL/MySQL từ dịch vụ Azure Database.

**Q: Tôi có thể dùng điều này cho production không?**  
A: Đây là điểm khởi đầu. Cho môi trường production, thêm: managed identity, private endpoints, dự phòng, chiến lược sao lưu, WAF, và giám sát nâng cao.

**Q: Nếu tôi muốn dùng containers thay vì triển khai mã thì sao?**  
A: Xem [Ví dụ Container Apps](../../../../examples/container-app) sử dụng Docker containers xuyên suốt.

**Q: Làm sao để kết nối tới cơ sở dữ liệu từ máy cục bộ của tôi?**  
A: Thêm IP của bạn vào firewall của SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Tôi có thể sử dụng cơ sở dữ liệu hiện có thay vì tạo mới không?**  
A: Có, chỉnh sửa `infra/main.bicep` để tham chiếu đến SQL Server hiện có và cập nhật các tham số chuỗi kết nối.

---

> **Ghi chú:** Ví dụ này trình bày các thực hành tốt nhất để triển khai một ứng dụng web với cơ sở dữ liệu sử dụng AZD. Nó bao gồm mã hoạt động, tài liệu toàn diện và các bài tập thực hành để củng cố kiến thức. Cho các triển khai production, xem xét bảo mật, khả năng mở rộng, tuân thủ và yêu cầu chi phí cụ thể của tổ chức bạn.

**📚 Điều hướng khóa học:**
- ← Trước: [Ví dụ Container Apps](../../../../examples/container-app)
- → Tiếp theo: [Hướng dẫn tích hợp AI](../../../../docs/ai-foundry)
- 🏠 [Trang chính của khóa học](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ gốc của nó nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->