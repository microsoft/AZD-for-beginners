# Chương 7: Khắc phục sự cố & Gỡ lỗi

**📚 Khóa học**: [AZD Dành cho Người mới bắt đầu](../../README.md) | **⏱️ Thời lượng**: 1-1.5 giờ | **⭐ Độ phức tạp**: Trung cấp

---

## Tổng quan

Chương này giúp bạn chẩn đoán và giải quyết các sự cố phổ biến khi làm việc với Azure Developer CLI. Từ lỗi triển khai đến các vấn đề riêng biệt về AI.

> Hướng dẫn lệnh được kiểm tra so với tham khảo `azd 1.37.2` đã phát hành. Việc triển khai trên đám mây không được thực thi. Thay thế tên và ID tài nguyên ví dụ trước khi sử dụng các lệnh.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Chẩn đoán lỗi triển khai AZD thường gặp
- Gỡ lỗi các vấn đề xác thực và quyền truy cập
- Giải quyết các vấn đề kết nối dịch vụ AI
- Sử dụng Cổng Azure và CLI để xử lý sự cố

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Sự cố phổ biến](common-issues.md) | Các vấn đề thường gặp | 30 phút |
| 2 | [Hướng dẫn Gỡ lỗi](debugging.md) | Chiến lược gỡ lỗi từng bước | 45 phút |
| 3 | [Khắc phục sự cố AI](ai-troubleshooting.md) | Vấn đề riêng về AI | 30 phút |

---

## 🚨 Sửa lỗi nhanh

### Vấn đề xác thực
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Lỗi Provisioning
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Xung đột tài nguyên
Kiểm tra tài nguyên hiện có và lỗi triển khai trước. Không xóa môi trường dùng chung hoặc môi trường sản xuất để giải quyết xung đột tên. Với **môi trường dùng thử mới**, hãy sử dụng tên duy nhất:

```bash
azd env new different-name
azd up
```

### Quá hạn mức
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Thay đổi `AZURE_LOCATION` không di chuyển tài nguyên hiện có và có thể gây ra xung đột vị trí khi triển khai lại.

---

## 📋 Tham chiếu mã lỗi

| Lỗi | Nguyên nhân | Giải pháp |
|-------|-------|----------|
| `AuthenticationError` | Chưa đăng nhập | `azd auth login` |
| `ResourceNotFound` | Thiếu tài nguyên | Kiểm tra tên tài nguyên |
| `QuotaExceeded` | Giới hạn đăng ký | Yêu cầu tăng hạn mức |
| `InvalidTemplate` | Lỗi cú pháp Bicep | `az bicep build` |
| `Conflict` | Tài nguyên tồn tại | Dùng tên mới hoặc xóa đi |
| `Forbidden` | Quyền không đủ | Kiểm tra vai trò RBAC |

---

## 🔄 Đặt lại và Khôi phục

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Việc đặt lại cứng sẽ xóa dữ liệu và có thể thay đổi điểm cuối. Sao lưu trước và xem lại các lời nhắc xóa tương tác. `--force --purge` chỉ phù hợp cho môi trường dùng thử khi dự định xóa không thể phục hồi.

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 6: Trước Triển khai](../chapter-06-pre-deployment/README.md) |
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