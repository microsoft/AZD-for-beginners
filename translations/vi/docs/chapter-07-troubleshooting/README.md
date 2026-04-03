# Chương 7: Khắc phục sự cố & Gỡ lỗi

**📚 Khóa học**: [AZD cho Người Mới Bắt Đầu](../../README.md) | **⏱️ Thời lượng**: 1-1.5 giờ | **⭐ Độ khó**: Trung cấp

---

## Tổng quan

Chương này giúp bạn chẩn đoán và giải quyết các sự cố thường gặp khi làm việc với Azure Developer CLI. Từ lỗi triển khai đến các vấn đề cụ thể về AI.

> Đã xác thực trên `azd 1.23.12` vào tháng 3 năm 2026.

## Mục tiêu học tập

Hoàn thành chương này, bạn sẽ:
- Chẩn đoán các lỗi triển khai AZD thường gặp
- Gỡ lỗi các vấn đề xác thực và quyền
- Giải quyết các sự cố kết nối dịch vụ AI
- Sử dụng Azure Portal và CLI để khắc phục sự cố

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Các vấn đề phổ biến](common-issues.md) | Các vấn đề thường gặp | 30 min |
| 2 | [Hướng dẫn gỡ lỗi](debugging.md) | Chiến lược gỡ lỗi từng bước | 45 min |
| 3 | [Khắc phục sự cố AI](ai-troubleshooting.md) | Các vấn đề cụ thể về AI | 30 min |

---

## 🚨 Khắc phục nhanh

### Sự cố xác thực
```bash
# Bắt buộc cho các luồng công việc AZD
azd auth login

# Tùy chọn nếu bạn cũng đang sử dụng các lệnh Azure CLI trực tiếp
az login

azd auth status
```

### Lỗi cấp phát
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Xung đột tài nguyên
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Vượt quá hạn mức
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Tham chiếu mã lỗi

| Lỗi | Nguyên nhân | Giải pháp |
|-------|-------|----------|
| `AuthenticationError` | Chưa đăng nhập | `azd auth login` |
| `ResourceNotFound` | Thiếu tài nguyên | Kiểm tra tên tài nguyên |
| `QuotaExceeded` | Giới hạn đăng ký | Yêu cầu tăng hạn mức |
| `InvalidTemplate` | Lỗi cú pháp Bicep | `az bicep build` |
| `Conflict` | Tài nguyên đã tồn tại | Sử dụng tên mới hoặc xóa |
| `Forbidden` | Không đủ quyền | Kiểm tra vai trò RBAC |

---

## 🔄 Đặt lại và Phục hồi

```bash
# Đặt lại nhẹ (giữ tài nguyên, triển khai lại mã)
azd deploy --force

# Đặt lại cứng (xóa mọi thứ, bắt đầu lại)
azd down --force --purge
azd up
```

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 6: Trước Triển Khai](../chapter-06-pre-deployment/README.md) |
| **Tiếp theo** | [Chương 8: Sản xuất](../chapter-08-production/README.md) |

---

## 📖 Tài nguyên liên quan

- [Kiểm tra trước triển khai](../chapter-06-pre-deployment/preflight-checks.md)
- [Hướng dẫn cấu hình](../chapter-03-configuration/configuration.md)
- [Vấn đề AZD trên GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguồn nên được xem là nguồn có thẩm quyền. Đối với thông tin quan trọng, khuyến nghị nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->