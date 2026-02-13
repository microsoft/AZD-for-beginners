# Chương 3: Cấu hình & Xác thực

**📚 Khóa học**: [AZD For Beginners](../../README.md) | **⏱️ Thời lượng**: 45-60 phút | **⭐ Độ khó**: Trung cấp

---

## Tổng quan

Chương này bao gồm cấu hình môi trường, các mẫu xác thực và các thực hành bảo mật tốt nhất cho triển khai Azure Developer CLI.

## Mục tiêu học tập

Hoàn thành chương này, bạn sẽ:
- Nắm vững phân cấp cấu hình của AZD
- Quản lý nhiều môi trường (dev, staging, prod)
- Triển khai xác thực an toàn với Managed Identities
- Cấu hình các thiết lập theo môi trường

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | Thiết lập và quản lý môi trường | 30 phút |
| 2 | [Authentication & Security](authsecurity.md) | Mẫu managed identity và RBAC | 30 phút |

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

AZD áp dụng các thiết lập theo thứ tự này (mục sau ghi đè mục trước):

1. **Giá trị mặc định** (được tích hợp trong mẫu)
2. **azure.yaml** (cấu hình dự án)
3. **Biến môi trường** (`azd env set`)
4. **Tham số dòng lệnh** (`--location eastus`)

---

## 🔐 Thực hành bảo mật tốt nhất

```bash
# Sử dụng danh tính được quản lý (khuyến nghị)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kiểm tra trạng thái xác thực
azd auth whoami
az account show

# Xác thực lại nếu cần
azd auth login
az login
```

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chapter 2: AI Development](../chapter-02-ai-development/README.md) |
| **Tiếp theo** | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 Tài nguyên liên quan

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn chính thức. Đối với những thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm đối với bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->