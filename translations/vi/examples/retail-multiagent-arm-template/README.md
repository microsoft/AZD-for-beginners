<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-22T08:20:23+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "vi"
}
-->
# Giải pháp Đa Tác Nhân Bán Lẻ - Mẫu Hạ Tầng

**Chương 5: Gói Triển Khai Sản Xuất**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Liên Quan**: [Chương 5: Giải pháp AI Đa Tác Nhân](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Hướng Dẫn Kịch Bản**: [Kiến Trúc Hoàn Chỉnh](../retail-scenario.md)
- **🎯 Triển Khai Nhanh**: [Triển Khai Một Lần Nhấp](../../../../examples/retail-multiagent-arm-template)

> **⚠️ CHỈ LÀ MẪU HẠ TẦNG**  
> Mẫu ARM này triển khai **tài nguyên Azure** cho hệ thống đa tác nhân.  
>  
> **Những gì được triển khai (15-25 phút):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings trên 3 khu vực)
> - ✅ Dịch vụ Tìm kiếm AI (trống, sẵn sàng tạo chỉ mục)
> - ✅ Ứng dụng Container (hình ảnh mẫu, sẵn sàng cho mã của bạn)
> - ✅ Lưu trữ, Cosmos DB, Key Vault, Application Insights
>  
> **Những gì KHÔNG bao gồm (cần phát triển):**
> - ❌ Mã triển khai tác nhân (Tác nhân Khách hàng, Tác nhân Kho hàng)
> - ❌ Logic định tuyến và điểm cuối API
> - ❌ Giao diện chat frontend
> - ❌ Các schema chỉ mục tìm kiếm và pipeline dữ liệu
> - ❌ **Ước tính thời gian phát triển: 80-120 giờ**
>  
> **Sử dụng mẫu này nếu:**
> - ✅ Bạn muốn cung cấp hạ tầng Azure cho dự án đa tác nhân
> - ✅ Bạn dự định phát triển triển khai tác nhân riêng biệt
> - ✅ Bạn cần một cơ sở hạ tầng sẵn sàng cho sản xuất
>  
> **Không sử dụng nếu:**
> - ❌ Bạn mong đợi một demo đa tác nhân hoạt động ngay lập tức
> - ❌ Bạn đang tìm kiếm ví dụ mã ứng dụng hoàn chỉnh

## Tổng Quan

Thư mục này chứa một mẫu Azure Resource Manager (ARM) toàn diện để triển khai **nền tảng hạ tầng** của hệ thống hỗ trợ khách hàng đa tác nhân. Mẫu này cung cấp tất cả các dịch vụ Azure cần thiết, được cấu hình và kết nối đúng cách, sẵn sàng cho việc phát triển ứng dụng của bạn.

**Sau khi triển khai, bạn sẽ có:** Hạ tầng Azure sẵn sàng cho sản xuất  
**Để hoàn thành hệ thống, bạn cần:** Mã tác nhân, giao diện frontend, và cấu hình dữ liệu (xem [Hướng Dẫn Kiến Trúc](../retail-scenario.md))

## 🎯 Những gì được triển khai

### Hạ tầng Cốt lõi (Trạng thái Sau Triển Khai)

✅ **Dịch vụ Azure OpenAI** (Sẵn sàng cho các cuộc gọi API)
  - Khu vực chính: Triển khai GPT-4o (công suất 20K TPM)
  - Khu vực phụ: Triển khai GPT-4o-mini (công suất 10K TPM)
  - Khu vực thứ ba: Mô hình embeddings văn bản (công suất 30K TPM)
  - Khu vực đánh giá: Mô hình đánh giá GPT-4o (công suất 15K TPM)
  - **Trạng thái:** Hoạt động hoàn toàn - có thể thực hiện các cuộc gọi API ngay lập tức

✅ **Azure AI Search** (Trống - sẵn sàng cấu hình)
  - Khả năng tìm kiếm vector được kích hoạt
  - Tier tiêu chuẩn với 1 phân vùng, 1 bản sao
  - **Trạng thái:** Dịch vụ đang chạy, nhưng cần tạo chỉ mục
  - **Hành động cần thiết:** Tạo chỉ mục tìm kiếm với schema của bạn

✅ **Tài khoản Lưu trữ Azure** (Trống - sẵn sàng tải lên)
  - Các container blob: `documents`, `uploads`
  - Cấu hình bảo mật (chỉ HTTPS, không truy cập công khai)
  - **Trạng thái:** Sẵn sàng nhận tệp
  - **Hành động cần thiết:** Tải lên dữ liệu sản phẩm và tài liệu của bạn

⚠️ **Môi trường Ứng dụng Container** (Hình ảnh mẫu được triển khai)
  - Ứng dụng định tuyến tác nhân (hình ảnh mặc định nginx)
  - Ứng dụng frontend (hình ảnh mặc định nginx)
  - Cấu hình tự động mở rộng (0-10 instances)
  - **Trạng thái:** Đang chạy các container mẫu
  - **Hành động cần thiết:** Xây dựng và triển khai các ứng dụng tác nhân của bạn

✅ **Azure Cosmos DB** (Trống - sẵn sàng cho dữ liệu)
  - Cơ sở dữ liệu và container được cấu hình trước
  - Tối ưu hóa cho các hoạt động độ trễ thấp
  - TTL được kích hoạt để tự động dọn dẹp
  - **Trạng thái:** Sẵn sàng lưu trữ lịch sử chat

✅ **Azure Key Vault** (Tùy chọn - sẵn sàng cho các bí mật)
  - Xóa mềm được kích hoạt
  - RBAC được cấu hình cho các danh tính được quản lý
  - **Trạng thái:** Sẵn sàng lưu trữ các khóa API và chuỗi kết nối

✅ **Application Insights** (Tùy chọn - giám sát đang hoạt động)
  - Kết nối với workspace Log Analytics
  - Các chỉ số và cảnh báo tùy chỉnh được cấu hình
  - **Trạng thái:** Sẵn sàng nhận telemetry từ các ứng dụng của bạn

✅ **Document Intelligence** (Sẵn sàng cho các cuộc gọi API)
  - Tier S0 cho khối lượng công việc sản xuất
  - **Trạng thái:** Sẵn sàng xử lý các tài liệu được tải lên

✅ **Bing Search API** (Sẵn sàng cho các cuộc gọi API)
  - Tier S1 cho các tìm kiếm thời gian thực
  - **Trạng thái:** Sẵn sàng cho các truy vấn tìm kiếm web

### Chế độ Triển Khai

| Chế độ | Công suất OpenAI | Instances Container | Tier Tìm kiếm | Dự phòng Lưu trữ | Tốt nhất cho |
|-------|------------------|---------------------|---------------|------------------|--------------|
| **Tối thiểu** | 10K-20K TPM | 0-2 bản sao | Cơ bản | LRS (Cục bộ) | Phát triển/thử nghiệm, học tập, bằng chứng khái niệm |
| **Tiêu chuẩn** | 30K-60K TPM | 2-5 bản sao | Tiêu chuẩn | ZRS (Vùng) | Sản xuất, lưu lượng vừa phải (<10K người dùng) |
| **Cao cấp** | 80K-150K TPM | 5-10 bản sao, dự phòng vùng | Cao cấp | GRS (Địa lý) | Doanh nghiệp, lưu lượng cao (>10K người dùng), SLA 99.99% |

**Tác động Chi phí:**
- **Tối thiểu → Tiêu chuẩn:** Tăng chi phí ~4 lần ($100-370/tháng → $420-1,450/tháng)
- **Tiêu chuẩn → Cao cấp:** Tăng chi phí ~3 lần ($420-1,450/tháng → $1,150-3,500/tháng)
- **Chọn dựa trên:** Lưu lượng dự kiến, yêu cầu SLA, hạn chế ngân sách

**Lập Kế Hoạch Công Suất:**
- **TPM (Tokens Per Minute):** Tổng cộng trên tất cả các triển khai mô hình
- **Instances Container:** Phạm vi tự động mở rộng (bản sao tối thiểu-tối đa)
- **Tier Tìm kiếm:** Ảnh hưởng đến hiệu suất truy vấn và giới hạn kích thước chỉ mục

## 📋 Yêu Cầu Trước

### Công Cụ Cần Thiết
1. **Azure CLI** (phiên bản 2.50.0 hoặc cao hơn)
   ```bash
   az --version  # Kiểm tra phiên bản
   az login      # Xác thực
   ```

2. **Đăng ký Azure đang hoạt động** với quyền Chủ sở hữu hoặc Người đóng góp
   ```bash
   az account show  # Xác minh đăng ký
   ```

### Hạn Mức Azure Cần Thiết

Trước khi triển khai, hãy xác minh hạn mức đủ trong các khu vực mục tiêu của bạn:

```bash
# Kiểm tra tính khả dụng của Azure OpenAI trong khu vực của bạn
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Xác minh hạn mức OpenAI (ví dụ cho gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Kiểm tra hạn mức Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Hạn Mức Tối Thiểu Cần Thiết:**
- **Azure OpenAI:** 3-4 triển khai mô hình trên các khu vực
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Lưu ý:** GPT-4o có thể có danh sách chờ ở một số khu vực - kiểm tra [khả dụng mô hình](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Ứng dụng Container:** Môi trường được quản lý + 2-10 instances container
- **AI Search:** Tier tiêu chuẩn (Cơ bản không đủ cho tìm kiếm vector)
- **Cosmos DB:** Throughput tiêu chuẩn được cung cấp

**Nếu hạn mức không đủ:**
1. Đi tới Azure Portal → Quotas → Yêu cầu tăng
2. Hoặc sử dụng Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Cân nhắc các khu vực thay thế với khả dụng

## 🚀 Triển Khai Nhanh

### Tùy Chọn 1: Sử dụng Azure CLI

```bash
# Sao chép hoặc tải xuống các tệp mẫu
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Làm cho tập lệnh triển khai có thể thực thi
chmod +x deploy.sh

# Triển khai với cài đặt mặc định
./deploy.sh -g myResourceGroup

# Triển khai cho sản xuất với các tính năng cao cấp
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Tùy Chọn 2: Sử dụng Azure Portal

[![Triển khai lên Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Tùy Chọn 3: Sử dụng Azure CLI trực tiếp

```bash
# Tạo nhóm tài nguyên
az group create --name myResourceGroup --location eastus2

# Triển khai mẫu
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Thời Gian Triển Khai

### Những Gì Mong Đợi

| Giai đoạn | Thời gian | Những gì xảy ra |
|----------|-----------|-----------------||
| **Xác thực Mẫu** | 30-60 giây | Azure xác thực cú pháp mẫu ARM và các tham số |
| **Thiết lập Nhóm Tài nguyên** | 10-20 giây | Tạo nhóm tài nguyên (nếu cần) |
| **Cung cấp OpenAI** | 5-8 phút | Tạo 3-4 tài khoản OpenAI và triển khai mô hình |
| **Ứng dụng Container** | 3-5 phút | Tạo môi trường và triển khai các container mẫu |
| **Tìm kiếm & Lưu trữ** | 2-4 phút | Cung cấp dịch vụ Tìm kiếm AI và tài khoản lưu trữ |
| **Cosmos DB** | 2-3 phút | Tạo cơ sở dữ liệu và cấu hình container |
| **Thiết lập Giám sát** | 2-3 phút | Thiết lập Application Insights và Log Analytics |
| **Cấu hình RBAC** | 1-2 phút | Cấu hình danh tính được quản lý và quyền |
| **Triển khai Tổng cộng** | **15-25 phút** | Hạ tầng hoàn chỉnh sẵn sàng |

**Sau Triển Khai:**
- ✅ **Hạ tầng Sẵn Sàng:** Tất cả các dịch vụ Azure được cung cấp và chạy
- ⏱️ **Phát triển Ứng dụng:** 80-120 giờ (trách nhiệm của bạn)
- ⏱️ **Cấu hình Chỉ mục:** 15-30 phút (cần schema của bạn)
- ⏱️ **Tải lên Dữ liệu:** Thay đổi theo kích thước tập dữ liệu
- ⏱️ **Kiểm tra & Xác thực:** 2-4 giờ

---

## ✅ Xác Minh Thành Công Triển Khai

### Bước 1: Kiểm tra Cung cấp Tài nguyên (2 phút)

```bash
# Xác minh tất cả các tài nguyên đã triển khai thành công
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Kỳ vọng:** Bảng trống (tất cả tài nguyên hiển thị trạng thái "Succeeded")

### Bước 2: Xác minh Triển khai Azure OpenAI (3 phút)

```bash
# Liệt kê tất cả các tài khoản OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Kiểm tra triển khai mô hình cho khu vực chính
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Kỳ vọng:** 
- 3-4 tài khoản OpenAI (khu vực chính, phụ, thứ ba, đánh giá)
- 1-2 triển khai mô hình mỗi tài khoản (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Bước 3: Kiểm tra Điểm cuối Hạ tầng (5 phút)

```bash
# Lấy URL Ứng dụng Container
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Kiểm tra điểm cuối của bộ định tuyến (hình ảnh giữ chỗ sẽ phản hồi)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Kỳ vọng:** 
- Ứng dụng Container hiển thị trạng thái "Running"
- Nginx mẫu phản hồi với HTTP 200 hoặc 404 (chưa có mã ứng dụng)

### Bước 4: Xác minh Truy cập API Azure OpenAI (3 phút)

```bash
# Lấy điểm cuối và khóa OpenAI
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Kiểm tra triển khai GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Kỳ vọng:** Phản hồi JSON với hoàn thành chat (xác nhận OpenAI hoạt động)

### Những gì Hoạt động và Không Hoạt động

**✅ Hoạt động Sau Triển Khai:**
- Các mô hình Azure OpenAI được triển khai và chấp nhận các cuộc gọi API
- Dịch vụ Tìm kiếm AI đang chạy (trống, chưa có chỉ mục)
- Ứng dụng Container đang chạy (hình ảnh mẫu nginx)
- Tài khoản lưu trữ có thể truy cập và sẵn sàng tải lên
- Cosmos DB sẵn sàng cho các hoạt động dữ liệu
- Application Insights thu thập telemetry hạ tầng
- Key Vault sẵn sàng lưu trữ bí mật

**❌ Chưa Hoạt động (Cần Phát Triển):**
- Điểm cuối tác nhân (chưa triển khai mã ứng dụng)
- Chức năng chat (cần triển khai frontend + backend)
- Truy vấn tìm kiếm (chưa tạo chỉ mục tìm kiếm)
- Pipeline xử lý tài liệu (chưa tải lên dữ liệu)
- Telemetry tùy chỉnh (cần công cụ hóa ứng dụng)

**Bước Tiếp Theo:** Xem [Cấu hình Sau Triển Khai](../../../../examples/retail-multiagent-arm-template) để phát triển và triển khai ứng dụng của bạn

---

## ⚙️ Tùy Chọn Cấu Hình

### Tham Số Mẫu

| Tham số | Loại | Mặc định | Mô tả |
|---------|------|----------|-------|
| `projectName` | string | "retail" | Tiền tố cho tất cả tên tài nguyên |
| `location` | string | Vị trí nhóm tài nguyên | Khu vực triển khai chính |
| `secondaryLocation` | string | "westus2" | Khu vực phụ cho triển khai đa khu vực |
| `tertiaryLocation` | string | "francecentral" | Khu vực cho mô hình embeddings |
| `environmentName` | string | "dev" | Định danh môi trường (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Cấu hình triển khai (tối thiểu/tiêu chuẩn/cao cấp) |
| `enableMultiRegion` | bool | true | Kích hoạt triển khai đa khu vực |
| `enableMonitoring` | bool | true | Kích hoạt Application Insights và logging |
| `enableSecurity` | bool | true | Kích hoạt Key Vault và bảo mật nâng cao |

### Tùy Chỉnh Tham Số

Chỉnh sửa `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Tổng Quan Kiến Trúc

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Sử Dụng Script Triển Khai

Script `deploy.sh` cung cấp trải nghiệm triển khai tương tác:

```bash
# Hiển thị trợ giúp
./deploy.sh --help

# Triển khai cơ bản
./deploy.sh -g myResourceGroup

# Triển khai nâng cao với cài đặt tùy chỉnh
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Triển khai phát triển không có đa vùng
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Tính Năng Script

- ✅ **Xác thực yêu cầu trước** (Azure CLI, trạng thái đăng nhập, tệp mẫu)
- ✅ **Quản lý nhóm tài nguyên** (tạo nếu chưa tồn tại)
- ✅ **Xác thực mẫu** trước khi triển khai
- ✅ **Theo dõi tiến trình** với đầu ra có màu
- ✅ **Hiển thị đầu ra triển khai**
- ✅ **Hướng dẫn sau triển khai**

## 📊 Giám Sát Triển Khai

### Kiểm tra Trạng Thái Triển Khai

```bash
# Liệt kê các triển khai
az deployment group list --resource-group myResourceGroup --output table

# Lấy chi tiết triển khai
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Theo dõi tiến trình triển khai
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Đầu Ra Triển Khai

Sau khi triển khai thành công, các đầu ra sau sẽ có sẵn:

- **URL Frontend**: Điểm cuối công khai cho giao diện web
- **URL Router**: Điểm cuối API cho bộ định tuyến tác nhân
- **Điểm cuối OpenAI**: Điểm cuối dịch vụ OpenAI chính và phụ
- **Dịch vụ Tìm kiếm**: Điểm cuối dịch vụ Tìm kiếm AI Azure
- **Tài khoản Lưu trữ**: Tên tài khoản lưu trữ cho tài liệu
- **Key Vault**: Tên Key Vault (nếu được kích hoạt)
- **Application Insights**: Tên dịch vụ giám sát (nếu được kích hoạt)

## 🔧 Sau Triển Khai: Bước Tiếp Theo
> **📝 Quan trọng:** Hạ tầng đã được triển khai, nhưng bạn cần phát triển và triển khai mã ứng dụng.

### Giai đoạn 1: Phát triển Ứng dụng Agent (Trách nhiệm của bạn)

Mẫu ARM tạo ra **Container Apps trống** với hình ảnh nginx placeholder. Bạn cần:

**Phát triển bắt buộc:**
1. **Triển khai Agent** (30-40 giờ)
   - Agent dịch vụ khách hàng tích hợp GPT-4o
   - Agent quản lý hàng tồn kho tích hợp GPT-4o-mini
   - Logic định tuyến agent

2. **Phát triển Giao diện Người dùng** (20-30 giờ)
   - Giao diện trò chuyện (React/Vue/Angular)
   - Chức năng tải tệp lên
   - Hiển thị và định dạng phản hồi

3. **Dịch vụ Backend** (12-16 giờ)
   - FastAPI hoặc Express router
   - Middleware xác thực
   - Tích hợp telemetry

**Xem thêm:** [Hướng dẫn Kiến trúc](../retail-scenario.md) để biết các mẫu triển khai chi tiết và ví dụ mã

### Giai đoạn 2: Cấu hình Chỉ mục Tìm kiếm AI (15-30 phút)

Tạo một chỉ mục tìm kiếm phù hợp với mô hình dữ liệu của bạn:

```bash
# Lấy chi tiết dịch vụ tìm kiếm
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Tạo chỉ mục với lược đồ của bạn (ví dụ)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Tài nguyên:**
- [Thiết kế Schema Chỉ mục Tìm kiếm AI](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Cấu hình Tìm kiếm Vector](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Giai đoạn 3: Tải Dữ liệu của Bạn lên (Thời gian thay đổi)

Khi bạn đã có dữ liệu sản phẩm và tài liệu:

```bash
# Lấy chi tiết tài khoản lưu trữ
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Tải lên tài liệu của bạn
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Ví dụ: Tải lên một tệp
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Giai đoạn 4: Xây dựng và Triển khai Ứng dụng của Bạn (8-12 giờ)

Khi bạn đã phát triển mã agent:

```bash
# 1. Tạo Azure Container Registry (nếu cần thiết)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Xây dựng và đẩy hình ảnh agent router
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Xây dựng và đẩy hình ảnh frontend
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Cập nhật Container Apps với các hình ảnh của bạn
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Cấu hình các biến môi trường
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Giai đoạn 5: Kiểm tra Ứng dụng của Bạn (2-4 giờ)

```bash
# Lấy URL ứng dụng của bạn
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Kiểm tra điểm cuối của agent (sau khi mã của bạn được triển khai)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Kiểm tra nhật ký ứng dụng
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Tài nguyên Triển khai

**Kiến trúc & Thiết kế:**
- 📖 [Hướng dẫn Kiến trúc Hoàn chỉnh](../retail-scenario.md) - Các mẫu triển khai chi tiết
- 📖 [Mẫu Thiết kế Đa-Agent](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Ví dụ Mã:**
- 🔗 [Mẫu Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Mẫu RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Framework agent (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Điều phối agent (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Hội thoại đa-agent

**Ước tính Tổng Thời gian:**
- Triển khai hạ tầng: 15-25 phút (✅ Hoàn thành)
- Phát triển ứng dụng: 80-120 giờ (🔨 Công việc của bạn)
- Kiểm tra và tối ưu hóa: 15-25 giờ (🔨 Công việc của bạn)

## 🛠️ Xử lý sự cố

### Các vấn đề thường gặp

#### 1. Hết hạn mức Azure OpenAI

```bash
# Kiểm tra mức sử dụng hạn ngạch hiện tại
az cognitiveservices usage list --location eastus2

# Yêu cầu tăng hạn ngạch
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Triển khai Container Apps thất bại

```bash
# Kiểm tra nhật ký ứng dụng container
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Khởi động lại ứng dụng container
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Khởi tạo Dịch vụ Tìm kiếm

```bash
# Xác minh trạng thái dịch vụ tìm kiếm
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Kiểm tra kết nối dịch vụ tìm kiếm
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Xác thực Triển khai

```bash
# Xác minh tất cả các tài nguyên đã được tạo
az resource list \
  --resource-group myResourceGroup \
  --output table

# Kiểm tra trạng thái sức khỏe của tài nguyên
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Cân nhắc về Bảo mật

### Quản lý Khóa
- Tất cả các bí mật được lưu trữ trong Azure Key Vault (khi được kích hoạt)
- Container apps sử dụng managed identity để xác thực
- Tài khoản lưu trữ có cấu hình bảo mật mặc định (chỉ HTTPS, không truy cập blob công khai)

### Bảo mật Mạng
- Container apps sử dụng mạng nội bộ khi có thể
- Dịch vụ tìm kiếm được cấu hình với tùy chọn private endpoints
- Cosmos DB được cấu hình với quyền tối thiểu cần thiết

### Cấu hình RBAC
```bash
# Gán các vai trò cần thiết cho danh tính được quản lý
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Tối ưu hóa Chi phí

### Ước tính Chi phí (Hàng tháng, USD)

| Chế độ | OpenAI | Container Apps | Tìm kiếm | Lưu trữ | Tổng Ước tính |
|--------|--------|----------------|----------|---------|---------------|
| Tối thiểu | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Tiêu chuẩn | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Cao cấp | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Giám sát Chi phí

```bash
# Thiết lập cảnh báo ngân sách
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Cập nhật và Bảo trì

### Cập nhật Mẫu
- Quản lý phiên bản các tệp mẫu ARM
- Kiểm tra thay đổi trong môi trường phát triển trước
- Sử dụng chế độ triển khai gia tăng để cập nhật

### Cập nhật Tài nguyên
```bash
# Cập nhật với các tham số mới
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Sao lưu và Phục hồi
- Cosmos DB được kích hoạt sao lưu tự động
- Key Vault được kích hoạt soft delete
- Các phiên bản container app được duy trì để rollback

## 📞 Hỗ trợ

- **Vấn đề về Mẫu:** [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Hỗ trợ Azure:** [Cổng hỗ trợ Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Cộng đồng:** [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Sẵn sàng triển khai giải pháp đa-agent của bạn?**

Bắt đầu với: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->