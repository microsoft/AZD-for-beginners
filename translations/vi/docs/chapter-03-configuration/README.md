# Chương 3: Cấu hình & Xác thực

**📚 Khóa học**: [AZD cho Người mới bắt đầu](../../README.md) | **⏱️ Thời lượng**: 45-60 phút | **⭐ Độ phức tạp**: Trung cấp

---

## Tổng quan

Chương này bao quát cấu hình môi trường, các mẫu xác thực và các phương pháp bảo mật tốt nhất cho việc triển khai Azure Developer CLI.

> Đã xác thực với `azd 1.23.12` vào tháng 3 năm 2026.

## Mục tiêu học tập

Bằng cách hoàn thành chương này, bạn sẽ:
- Thành thạo cấu trúc cấp bậc cấu hình AZD
- Quản lý nhiều môi trường (dev, staging, prod)
- Triển khai xác thực an toàn với managed identities
- Cấu hình các thiết lập riêng cho từng môi trường

---

## 📚 Bài học

| # | Bài | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Hướng dẫn Cấu hình](configuration.md) | Thiết lập và quản lý môi trường | 30 phút |
| 2 | [Xác thực & Bảo mật](authsecurity.md) | Mẫu managed identity và RBAC | 30 phút |

---

## 🚀 Bắt đầu nhanh

```bash
# Tạo nhiều môi trường
azd env new dev
azd env new staging
azd env new prod

# Chuyển đổi môi trường
azd env select prod

# Đặt biến môi trường
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Xem cấu hình
azd env get-values
```

---

## 🔧 Phân cấp cấu hình

AZD áp dụng các thiết lập theo thứ tự này (các mục sau ghi đè mục trước):

1. **Giá trị mặc định** (được tích hợp trong mẫu)
2. **azure.yaml** (cấu hình dự án)
3. **Biến môi trường** (`azd env set`)
4. **Tham số dòng lệnh** (`--location eastus`)

---

## 🔐 Các phương pháp bảo mật tốt nhất

```bash
# Sử dụng managed identity (khuyến nghị)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kiểm tra trạng thái xác thực AZD
azd auth status

# Tùy chọn: xác minh ngữ cảnh Azure CLI nếu bạn định chạy các lệnh az
az account show

# Xác thực lại nếu cần
azd auth login

# Tùy chọn: làm mới xác thực Azure CLI cho các lệnh az
az login
```

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 2: Phát triển AI](../chapter-02-ai-development/README.md) |
| **Tiếp theo** | [Chương 4: Hạ tầng](../chapter-04-infrastructure/README.md) |

---

## 📖 Tài nguyên liên quan

- [Kiểm tra trước triển khai](../chapter-06-pre-deployment/README.md)
- [Khắc phục sự cố](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn chính thức. Đối với những thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->