# Chương 4: Hạ tầng như mã & Triển khai

**📚 Khóa học**: [AZD For Beginners](../../README.md) | **⏱️ Thời lượng**: 1-1.5 giờ | **⭐ Độ phức tạp**: Trung cấp

---

## Tổng quan

Chương này bao gồm các mẫu Hạ tầng như Mã (IaC) với Bicep, cấp phát tài nguyên và các chiến lược triển khai bằng Azure Developer CLI.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Hiểu cấu trúc và cú pháp mẫu Bicep
- Cấp phát tài nguyên Azure bằng `azd provision`
- Triển khai ứng dụng bằng `azd deploy`
- Áp dụng chiến lược triển khai blue-green và rolling

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Cấp phát Tài nguyên](provisioning.md) | Quản lý tài nguyên Azure với AZD | 45 phút |
| 2 | [Hướng dẫn Triển khai](deployment-guide.md) | Các chiến lược triển khai ứng dụng | 45 phút |

---

## 🚀 Bắt đầu nhanh

```bash
# Khởi tạo từ mẫu
azd init --template azure-functions-python-v2-http

# Xem trước những gì sẽ được tạo
azd provision --preview

# Chỉ cung cấp hạ tầng
azd provision

# Chỉ triển khai mã nguồn
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
- [Ví dụ Ứng dụng Container](../../examples/container-app/README.md)
- [Ví dụ Ứng dụng Cơ sở dữ liệu](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn thông tin có thẩm quyền. Đối với những thông tin quan trọng, khuyến nghị sử dụng bản dịch do chuyên gia người bản ngữ thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu nhầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->