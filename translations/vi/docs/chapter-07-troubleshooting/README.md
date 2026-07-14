# Chương 7: Xử lý sự cố & Gỡ lỗi

**📚 Khóa học**: [AZD Dành cho Người Mới](../../README.md) | **⏱️ Thời lượng**: 1-1.5 giờ | **⭐ Độ phức tạp**: Trung cấp

---

## Tổng quan

Chương này giúp bạn chẩn đoán và giải quyết các vấn đề phổ biến khi làm việc với Azure Developer CLI. Từ lỗi triển khai đến các sự cố đặc thù về AI.

> Đã kiểm tra với `azd 1.27.1` vào tháng 7 năm 2026.

## Mục tiêu học tập

Khi hoàn thành chương này, bạn sẽ:
- Chẩn đoán các lỗi triển khai AZD phổ biến
- Gỡ lỗi các sự cố xác thực và quyền truy cập
- Giải quyết các vấn đề kết nối dịch vụ AI
- Sử dụng Azure Portal và CLI để xử lý sự cố

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Vấn đề phổ biến](common-issues.md) | Các vấn đề thường gặp | 30 phút |
| 2 | [Hướng dẫn gỡ lỗi](debugging.md) | Chiến lược gỡ lỗi từng bước | 45 phút |
| 3 | [Xử lý sự cố AI](ai-troubleshooting.md) | Các vấn đề đặc thù AI | 30 phút |

---

## 🚨 Cách sửa nhanh

### Vấn đề xác thực
```bash
# Yêu cầu cho các quy trình làm việc AZD
azd auth login

# Tùy chọn nếu bạn cũng đang sử dụng các lệnh Azure CLI trực tiếp
az login

azd auth status
```

### Lỗi trong quá trình cấp phát
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

## 📋 Tham khảo mã lỗi

| Lỗi | Nguyên nhân | Giải pháp |
|-------|-------|----------|
| `AuthenticationError` | Chưa đăng nhập | `azd auth login` |
| `ResourceNotFound` | Thiếu tài nguyên | Kiểm tra tên tài nguyên |
| `QuotaExceeded` | Giới hạn đăng ký | Yêu cầu tăng hạn mức |
| `InvalidTemplate` | Lỗi cú pháp Bicep | `az bicep build` |
| `Conflict` | Tài nguyên đã tồn tại | Dùng tên mới hoặc xóa bỏ |
| `Forbidden` | Quyền không đủ | Kiểm tra vai trò RBAC |

---

## 🔄 Đặt lại và Phục hồi

```bash
# Đặt lại mềm (giữ tài nguyên, triển khai lại mã)
azd deploy --force

# Đặt lại cứng (xóa hết, bắt đầu lại)
azd down --force --purge
azd up
```

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 6: Trước khi Triển khai](../chapter-06-pre-deployment/README.md) |
| **Tiếp** | [Chương 8: Sản xuất](../chapter-08-production/README.md) |

---

## 📖 Tài nguyên liên quan

- [Kiểm tra trước triển khai](../chapter-06-pre-deployment/preflight-checks.md)
- [Hướng dẫn cấu hình](../chapter-03-configuration/configuration.md)
- [Sự cố AZD trên GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->