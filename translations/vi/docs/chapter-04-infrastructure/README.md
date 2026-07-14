# Chương 4: Hạ tầng dưới dạng Mã & Triển khai

**📚 Khóa học**: [AZD For Beginners](../../README.md) | **⏱️ Thời lượng**: 1-1.5 giờ | **⭐ Độ khó**: Trung cấp

---

## Tổng quan

Chương này trình bày các mẫu Hạ tầng dưới dạng Mã (IaC) với các mẫu Bicep, cấp phát tài nguyên và chiến lược triển khai sử dụng Azure Developer CLI.

> Đã xác thực với `azd 1.27.1` vào tháng 7 năm 2026.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Hiểu được cấu trúc và cú pháp mẫu Bicep
- Cấp phát tài nguyên Azure với `azd provision`
- Triển khai ứng dụng với `azd deploy`
- Thực hiện các chiến lược triển khai xanh-lục và triển khai lăn

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Cấp phát tài nguyên](provisioning.md) | Quản lý tài nguyên Azure với AZD | 45 phút |
| 2 | [Hướng dẫn triển khai](deployment-guide.md) | Chiến lược triển khai ứng dụng | 45 phút |
| 3 | [Tạo mẫu tự thiết kế](custom-templates.md) | Xây dựng và xuất bản mẫu azd tái sử dụng | 30 phút |

---

## 🚀 Bắt đầu nhanh

```bash
# Khởi tạo từ mẫu
azd init --template azure-functions-python-v2-http

# Xem trước những gì sẽ được tạo
azd provision --preview

# Chỉ cung cấp hạ tầng
azd provision

# Chỉ triển khai mã
azd deploy

# Hoặc cả hai cùng nhau
azd up
```

---

## 📁 Cấu trúc Dự án AZD

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

## 🔧 Các lệnh thiết yếu

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
| **Tiếp** | [Chương 5: Giải pháp đa tác nhân](../chapter-05-multi-agent/README.md) |

---

## 📖 Tài nguyên liên quan

- [Kiểm tra trước triển khai](../chapter-06-pre-deployment/README.md)
- [Ví dụ Ứng dụng Container](../../examples/container-app/README.md)
- [Ví dụ Ứng dụng Cơ sở dữ liệu](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->