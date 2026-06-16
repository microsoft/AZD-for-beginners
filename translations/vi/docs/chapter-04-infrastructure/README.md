# Chương 4: Hạ tầng dưới dạng mã & Triển khai

**📚 Khóa học**: [AZD cho người mới](../../README.md) | **⏱️ Thời lượng**: 1-1.5 giờ | **⭐ Độ phức tạp**: Trung cấp

---

## Tổng quan

Chương này đề cập đến các mẫu Hạ tầng dưới dạng Mã (IaC) với các mẫu Bicep, cấp phát tài nguyên và các chiến lược triển khai bằng Azure Developer CLI.

> Đã kiểm chứng với `azd 1.25.6` vào tháng 6 năm 2026.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Hiểu cấu trúc và cú pháp của mẫu Bicep
- Cấp phát tài nguyên Azure bằng `azd provision`
- Triển khai ứng dụng bằng `azd deploy`
- Thực hiện chiến lược triển khai blue-green và rolling

---

## 📚 Bài học

| # | Bài | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Cấp phát tài nguyên](provisioning.md) | Quản lý tài nguyên Azure với AZD | 45 phút |
| 2 | [Hướng dẫn triển khai](deployment-guide.md) | Chiến lược triển khai ứng dụng | 45 phút |
| 3 | [Tạo mẫu của riêng bạn](custom-templates.md) | Xây dựng và xuất bản các mẫu azd tái sử dụng | 30 phút |

---

## 🚀 Bắt đầu nhanh

```bash
# Khởi tạo từ mẫu
azd init --template azure-functions-python-v2-http

# Xem trước những gì sẽ được tạo
azd provision --preview

# Chỉ triển khai hạ tầng
azd provision

# Chỉ triển khai mã
azd deploy

# Hoặc cả hai cùng nhau
azd up
```

---

## 📁 Cấu trúc dự án AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Các lệnh cần thiết

| Lệnh | Mô tả |
|---------|-------------|
| `azd init` | Khởi tạo dự án |
| `azd provision` | Tạo tài nguyên Azure |
| `azd deploy` | Triển khai mã ứng dụng |
| `azd up` | cấp phát + triển khai |
| `azd down` | Xóa tất cả tài nguyên |

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 3: Cấu hình](../chapter-03-configuration/README.md) |
| **Tiếp theo** | [Chương 5: Giải pháp đa tác nhân](../chapter-05-multi-agent/README.md) |

---

## 📖 Tài nguyên liên quan

- [Kiểm tra trước khi triển khai](../chapter-06-pre-deployment/README.md)
- [Ví dụ ứng dụng Container](../../examples/container-app/README.md)
- [Ví dụ ứng dụng cơ sở dữ liệu](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->