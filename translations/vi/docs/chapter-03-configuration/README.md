# Chương 3: Cấu Hình & Xác Thực

**📚 Khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md) | **⏱️ Thời lượng**: 90-150 phút bao gồm thực hành tích hợp | **⭐ Mức độ**: Trung cấp

---

## Tổng Quan

Chương này bao gồm cấu hình môi trường, các mẫu xác thực, và các thực hành bảo mật tốt nhất cho triển khai Azure Developer CLI.

> Mục tiêu xem xét lệnh và cấu hình: `azd 1.37.2` (Tháng 11 năm 2026). Việc cung cấp Azure trực tiếp không được thực hiện trong quá trình xem xét.

## Mục Tiêu Học Tập

Khi hoàn thành chương này, bạn sẽ:
- Thành thạo thứ bậc cấu hình của AZD
- Quản lý nhiều môi trường (dev, staging, prod)
- Triển khai xác thực an toàn với managed identities
- Cấu hình các thiết lập riêng cho từng môi trường

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|----------|
| 1 | [Hướng Dẫn Cấu Hình](configuration.md) | Thiết lập và quản lý môi trường | 30 phút |
| 2 | [Xác Thực & Bảo Mật](authsecurity.md) | Mẫu managed identity và RBAC | 30 phút |

---

## 🚀 Bắt Đầu Nhanh

Chạy từ thư mục gốc của **ứng dụng azd đã được khởi tạo**, không phải khoá học. Sử dụng tên môi trường chưa dùng nếu những tên đó đã tồn tại.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` là minh họa: nó ảnh hưởng đến hạ tầng chỉ khi mẫu của bạn rõ ràng sử dụng nó. Các giá trị `azd env set` thông thường được lưu trữ cục bộ dưới dạng văn bản thuần; chúng không phải là kho bí mật an toàn.

---

## 🔧 Thứ Bậc Cấu Hình

Giữ ba bề mặt cấu hình khác nhau riêng biệt: tùy chọn toàn cục (`azd config`), cấu trúc dự án (`azure.yaml`), và giá trị cho từng môi trường (`azd env`). Các cờ chỉ ghi đè các thiết lập mà chúng thực sự hỗ trợ; không có lớp phủ toàn cục của các biến môi trường tùy ý lên `azure.yaml` hoặc Bicep.

---

## 🔐 Thực Hành Bảo Mật Tốt Nhất

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Điều Hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 2: Phát Triển AI](../chapter-02-ai-development/README.md) |
| **Tiếp** | [Chương 4: Hạ Tầng](../chapter-04-infrastructure/README.md) |

---

## 📖 Tài Nguyên Liên Quan

- [Kiểm Tra Trước Triển Khai](../chapter-06-pre-deployment/README.md)
- [Khắc Phục Sự Cố](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->