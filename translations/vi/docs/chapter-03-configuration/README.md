# Chương 3: Cấu hình & Xác thực

**📚 Khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md) | **⏱️ Thời lượng**: 45-60 phút | **⭐ Độ khó**: Trung cấp

---

## Tổng quan

Chương này bao gồm cấu hình môi trường, các mẫu xác thực và các thực hành bảo mật tốt nhất cho các triển khai bằng Azure Developer CLI.

> Đã xác thực với `azd 1.25.6` vào tháng 6 năm 2026.

## Mục tiêu học tập

Khi hoàn thành chương này, bạn sẽ:
- Thành thạo hệ thống phân cấp cấu hình AZD
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

# Chuyển đổi giữa các môi trường
azd env select prod

# Thiết lập biến môi trường
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Xem cấu hình
azd env get-values
```

---

## 🔧 Hệ thống phân cấp cấu hình

AZD áp dụng các thiết lập theo thứ tự này (về sau ghi đè về trước):

1. **Giá trị mặc định** (được tích hợp trong mẫu)
2. **azure.yaml** (cấu hình dự án)
3. **Biến môi trường** (`azd env set`)
4. **Cờ dòng lệnh** (`--location eastus`)

---

## 🔐 Các thực hành bảo mật tốt nhất

```bash
# Sử dụng Managed Identity (khuyến nghị)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kiểm tra trạng thái xác thực AZD
azd auth status

# Tùy chọn: xác minh ngữ cảnh Azure CLI nếu bạn định chạy lệnh az
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

- [Kiểm tra trước khi triển khai](../chapter-06-pre-deployment/README.md)
- [Khắc phục sự cố](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->