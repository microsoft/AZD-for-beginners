# Chương 7: Khắc phục sự cố & Gỡ lỗi

**📚 Khóa học**: [AZD cho Người Mới Bắt Đầu](../../README.md) | **⏱️ Thời lượng**: 1-1.5 giờ | **⭐ Độ khó**: Trung cấp

---

## Tổng quan

Chương này giúp bạn chẩn đoán và giải quyết các vấn đề thường gặp khi làm việc với Azure Developer CLI. Từ lỗi triển khai đến các sự cố đặc thù của AI.

> Đã kiểm chứng với `azd 1.25.6` vào tháng 6 năm 2026.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Chẩn đoán các lỗi triển khai AZD thường gặp
- Gỡ lỗi các vấn đề xác thực và quyền hạn
- Giải quyết các vấn đề kết nối dịch vụ AI
- Sử dụng Azure Portal và CLI để khắc phục sự cố

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Các vấn đề thường gặp](common-issues.md) | Các vấn đề thường gặp | 30 phút |
| 2 | [Hướng dẫn gỡ lỗi](debugging.md) | Chiến lược gỡ lỗi từng bước | 45 phút |
| 3 | [Khắc phục sự cố AI](ai-troubleshooting.md) | Các vấn đề liên quan đến AI | 30 phút |

---

## 🚨 Khắc phục nhanh

### Vấn đề xác thực
```bash
# Bắt buộc cho các luồng công việc AZD
azd auth login

# Tùy chọn nếu bạn cũng đang sử dụng trực tiếp các lệnh Azure CLI
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

### Vượt quá hạn ngạch
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
| `ResourceNotFound` | Không tìm thấy tài nguyên | Kiểm tra tên tài nguyên |
| `QuotaExceeded` | Giới hạn đăng ký | Yêu cầu tăng hạn ngạch |
| `InvalidTemplate` | Lỗi cú pháp Bicep | `az bicep build` |
| `Conflict` | Tài nguyên đã tồn tại | Sử dụng tên mới hoặc xóa |
| `Forbidden` | Không đủ quyền | Kiểm tra vai trò RBAC |

---

## 🔄 Thiết lập lại và Phục hồi

```bash
# Đặt lại nhẹ (giữ nguyên tài nguyên, triển khai lại mã)
azd deploy --force

# Đặt lại hoàn toàn (xóa mọi thứ, bắt đầu lại từ đầu)
azd down --force --purge
azd up
```

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 6: Trước khi Triển khai](../chapter-06-pre-deployment/README.md) |
| **Tiếp theo** | [Chương 8: Sản xuất](../chapter-08-production/README.md) |

---

## 📖 Tài nguyên liên quan

- [Kiểm tra trước khi triển khai](../chapter-06-pre-deployment/preflight-checks.md)
- [Hướng dẫn cấu hình](../chapter-03-configuration/configuration.md)
- [Vấn đề AZD trên GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->