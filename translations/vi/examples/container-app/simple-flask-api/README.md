<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-22T10:41:52+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "vi"
}
-->
# API Flask Đơn Giản - Ví Dụ Ứng Dụng Container

**Lộ trình học:** Người mới bắt đầu ⭐ | **Thời gian:** 25-35 phút | **Chi phí:** $0-15/tháng

Một API REST Python Flask hoàn chỉnh, hoạt động được triển khai trên Azure Container Apps bằng Azure Developer CLI (azd). Ví dụ này minh họa việc triển khai container, tự động mở rộng và các khái niệm cơ bản về giám sát.

## 🎯 Bạn Sẽ Học Được Gì

- Triển khai một ứng dụng Python được đóng gói container lên Azure
- Cấu hình tự động mở rộng với scale-to-zero
- Thực hiện kiểm tra sức khỏe và kiểm tra sẵn sàng
- Giám sát nhật ký và số liệu ứng dụng
- Sử dụng Azure Developer CLI để triển khai nhanh chóng

## 📦 Bao Gồm Những Gì

✅ **Ứng dụng Flask** - API REST hoàn chỉnh với các thao tác CRUD (`src/app.py`)  
✅ **Dockerfile** - Cấu hình container sẵn sàng cho sản xuất  
✅ **Hạ tầng Bicep** - Môi trường Container Apps và triển khai API  
✅ **Cấu hình AZD** - Thiết lập triển khai chỉ với một lệnh  
✅ **Kiểm tra sức khỏe** - Đã cấu hình kiểm tra liveness và readiness  
✅ **Tự động mở rộng** - 0-10 bản sao dựa trên tải HTTP  

## Kiến Trúc

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Yêu Cầu Trước

### Bắt buộc
- **Azure Developer CLI (azd)** - [Hướng dẫn cài đặt](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Tài khoản Azure** - [Tài khoản miễn phí](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Cài đặt Docker](https://www.docker.com/products/docker-desktop/) (để kiểm tra cục bộ)

### Xác Minh Yêu Cầu Trước

```bash
# Kiểm tra phiên bản azd (cần 1.5.0 hoặc cao hơn)
azd version

# Xác minh đăng nhập Azure
azd auth login

# Kiểm tra Docker (tùy chọn, để kiểm tra cục bộ)
docker --version
```

## ⏱️ Thời Gian Triển Khai

| Giai đoạn | Thời gian | Điều gì xảy ra |
|-----------|-----------|----------------||
| Thiết lập môi trường | 30 giây | Tạo môi trường azd |
| Xây dựng container | 2-3 phút | Docker build ứng dụng Flask |
| Cung cấp hạ tầng | 3-5 phút | Tạo Container Apps, registry, giám sát |
| Triển khai ứng dụng | 2-3 phút | Đẩy hình ảnh và triển khai lên Container Apps |
| **Tổng cộng** | **8-12 phút** | Hoàn thành triển khai sẵn sàng |

## Bắt Đầu Nhanh

```bash
# Điều hướng đến ví dụ
cd examples/container-app/simple-flask-api

# Khởi tạo môi trường (chọn tên duy nhất)
azd env new myflaskapi

# Triển khai mọi thứ (cơ sở hạ tầng + ứng dụng)
azd up
# Bạn sẽ được nhắc:
# 1. Chọn đăng ký Azure
# 2. Chọn vị trí (ví dụ: eastus2)
# 3. Chờ 8-12 phút để triển khai

# Lấy điểm cuối API của bạn
azd env get-values

# Kiểm tra API
curl $(azd env get-value API_ENDPOINT)/health
```

**Kết quả mong đợi:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Xác Minh Triển Khai

### Bước 1: Kiểm Tra Trạng Thái Triển Khai

```bash
# Xem các dịch vụ đã triển khai
azd show

# Kết quả mong đợi hiển thị:
# - Dịch vụ: api
# - Điểm cuối: https://ca-api-[env].xxx.azurecontainerapps.io
# - Trạng thái: Đang chạy
```

### Bước 2: Kiểm Tra Các Điểm Kết Nối API

```bash
# Lấy điểm cuối API
API_URL=$(azd env get-value API_ENDPOINT)

# Kiểm tra sức khỏe
curl $API_URL/health

# Kiểm tra điểm cuối gốc
curl $API_URL/

# Tạo một mục
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Lấy tất cả các mục
curl $API_URL/api/items
```

**Tiêu chí thành công:**
- ✅ Điểm kiểm tra sức khỏe trả về HTTP 200
- ✅ Điểm gốc hiển thị thông tin API
- ✅ POST tạo mục và trả về HTTP 201
- ✅ GET trả về các mục đã tạo

### Bước 3: Xem Nhật Ký

```bash
# Truyền phát nhật ký trực tiếp
azd logs api --follow

# Bạn sẽ thấy:
# - Thông báo khởi động Gunicorn
# - Nhật ký yêu cầu HTTP
# - Nhật ký thông tin ứng dụng
```

## Cấu Trúc Dự Án

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## Các Điểm Kết Nối API

| Điểm kết nối | Phương thức | Mô tả |
|--------------|------------|-------|
| `/health` | GET | Kiểm tra sức khỏe |
| `/api/items` | GET | Liệt kê tất cả các mục |
| `/api/items` | POST | Tạo mục mới |
| `/api/items/{id}` | GET | Lấy mục cụ thể |
| `/api/items/{id}` | PUT | Cập nhật mục |
| `/api/items/{id}` | DELETE | Xóa mục |

## Cấu Hình

### Biến Môi Trường

```bash
# Đặt cấu hình tùy chỉnh
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Cấu Hình Mở Rộng

API tự động mở rộng dựa trên lưu lượng HTTP:
- **Số bản sao tối thiểu**: 0 (mở rộng về 0 khi không hoạt động)
- **Số bản sao tối đa**: 10
- **Số yêu cầu đồng thời mỗi bản sao**: 50

## Phát Triển

### Chạy Cục Bộ

```bash
# Cài đặt các phụ thuộc
cd src
pip install -r requirements.txt

# Chạy ứng dụng
python app.py

# Kiểm tra cục bộ
curl http://localhost:8000/health
```

### Xây Dựng và Kiểm Tra Container

```bash
# Xây dựng hình ảnh Docker
docker build -t flask-api:local ./src

# Chạy container cục bộ
docker run -p 8000:8000 flask-api:local

# Kiểm tra container
curl http://localhost:8000/health
```

## Triển Khai

### Triển Khai Đầy Đủ

```bash
# Triển khai cơ sở hạ tầng và ứng dụng
azd up
```

### Chỉ Triển Khai Mã

```bash
# Triển khai chỉ mã ứng dụng (cơ sở hạ tầng không thay đổi)
azd deploy api
```

### Cập Nhật Cấu Hình

```bash
# Cập nhật các biến môi trường
azd env set API_KEY "new-api-key"

# Triển khai lại với cấu hình mới
azd deploy api
```

## Giám Sát

### Xem Nhật Ký

```bash
# Truyền phát nhật ký trực tiếp
azd logs api --follow

# Xem 100 dòng cuối cùng
azd logs api --tail 100
```

### Giám Sát Số Liệu

```bash
# Mở bảng điều khiển Azure Monitor
azd monitor --overview

# Xem các số liệu cụ thể
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Kiểm Tra

### Kiểm Tra Sức Khỏe

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Phản hồi mong đợi:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Tạo Mục

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Lấy Tất Cả Các Mục

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Tối Ưu Hóa Chi Phí

Triển khai này sử dụng scale-to-zero, vì vậy bạn chỉ trả tiền khi API xử lý yêu cầu:

- **Chi phí khi không hoạt động**: ~$0/tháng (mở rộng về 0)
- **Chi phí khi hoạt động**: ~$0.000024/giây mỗi bản sao
- **Chi phí hàng tháng dự kiến** (sử dụng nhẹ): $5-15

### Giảm Chi Phí Hơn Nữa

```bash
# Giảm số lượng bản sao tối đa cho môi trường phát triển
azd env set MAX_REPLICAS 3

# Sử dụng thời gian chờ không hoạt động ngắn hơn
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 phút
```

## Xử Lý Sự Cố

### Container Không Khởi Động

```bash
# Kiểm tra nhật ký container
azd logs api --tail 100

# Xác minh Docker image được xây dựng cục bộ
docker build -t test ./src
```

### API Không Truy Cập Được

```bash
# Xác minh ingress là bên ngoài
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Thời Gian Phản Hồi Cao

```bash
# Kiểm tra sử dụng CPU/Bộ nhớ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Tăng tài nguyên nếu cần
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Dọn Dẹp

```bash
# Xóa tất cả tài nguyên
azd down --force --purge
```

## Bước Tiếp Theo

### Mở Rộng Ví Dụ Này

1. **Thêm Cơ Sở Dữ Liệu** - Tích hợp Azure Cosmos DB hoặc SQL Database
   ```bash
   # Thêm mô-đun Cosmos DB vào infra/main.bicep
   # Cập nhật app.py với kết nối cơ sở dữ liệu
   ```

2. **Thêm Xác Thực** - Thực hiện Azure AD hoặc khóa API
   ```python
   # Thêm middleware xác thực vào app.py
   from functools import wraps
   ```

3. **Thiết Lập CI/CD** - Quy trình làm việc GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Thêm Managed Identity** - Bảo mật truy cập vào các dịch vụ Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Các Ví Dụ Liên Quan

- **[Ứng Dụng Cơ Sở Dữ Liệu](../../../../../examples/database-app)** - Ví dụ hoàn chỉnh với SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Kiến trúc đa dịch vụ
- **[Hướng Dẫn Toàn Diện Container Apps](../README.md)** - Tất cả các mẫu container

### Tài Nguyên Học Tập

- 📚 [Khóa Học AZD Cho Người Mới Bắt Đầu](../../../README.md) - Trang chính của khóa học
- 📚 [Mẫu Container Apps](../README.md) - Các mẫu triển khai khác
- 📚 [Thư Viện Mẫu AZD](https://azure.github.io/awesome-azd/) - Mẫu cộng đồng

## Tài Nguyên Bổ Sung

### Tài Liệu
- **[Tài Liệu Flask](https://flask.palletsprojects.com/)** - Hướng dẫn về framework Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Tài liệu chính thức của Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Tham khảo lệnh azd

### Hướng Dẫn
- **[Bắt Đầu Nhanh Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Triển khai ứng dụng đầu tiên của bạn
- **[Python trên Azure](https://learn.microsoft.com/azure/developer/python/)** - Hướng dẫn phát triển Python
- **[Ngôn Ngữ Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Hạ tầng dưới dạng mã

### Công Cụ
- **[Azure Portal](https://portal.azure.com)** - Quản lý tài nguyên trực quan
- **[Tiện Ích Azure cho VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Tích hợp IDE

---

**🎉 Chúc mừng!** Bạn đã triển khai một API Flask sẵn sàng cho sản xuất lên Azure Container Apps với tự động mở rộng và giám sát.

**Câu hỏi?** [Mở một vấn đề](https://github.com/microsoft/AZD-for-beginners/issues) hoặc kiểm tra [Câu hỏi thường gặp](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->