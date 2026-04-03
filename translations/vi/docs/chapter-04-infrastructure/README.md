# Chương 4: Hạ tầng như Mã & Triển khai

**📚 Khóa học**: [AZD Cho Người Mới](../../README.md) | **⏱️ Thời lượng**: 1-1.5 giờ | **⭐ Độ khó**: Trung cấp

---

## Tổng quan

Chương này bao gồm các mẫu Hạ tầng như Mã (IaC) với các template Bicep, việc cung cấp tài nguyên và các chiến lược triển khai sử dụng Azure Developer CLI.

> Đã xác thực với `azd 1.23.12` vào tháng 3 năm 2026.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Hiểu cấu trúc và cú pháp của template Bicep
- Cung cấp tài nguyên Azure bằng `azd provision`
- Triển khai ứng dụng bằng `azd deploy`
- Thực hiện các chiến lược triển khai blue-green và rolling

---

## 📚 Bài học

| # | Bài | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Cung cấp tài nguyên](provisioning.md) | Quản lý tài nguyên Azure với AZD | 45 phút |
| 2 | [Hướng dẫn triển khai](deployment-guide.md) | Chiến lược triển khai ứng dụng | 45 phút |

---

## 🚀 Bắt đầu nhanh

```bash
# Khởi tạo từ mẫu
azd init --template azure-functions-python-v2-http

# Xem trước những gì sẽ được tạo
azd provision --preview

# Chỉ thiết lập cơ sở hạ tầng
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
| `azd provision` | Tạo các tài nguyên Azure |
| `azd deploy` | Triển khai mã ứng dụng |
| `azd up` | cung cấp + triển khai |
| `azd down` | Xóa tất cả tài nguyên |

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 3: Cấu hình](../chapter-03-configuration/README.md) |
| **Tiếp theo** | [Chương 5: Giải pháp đa tác nhân](../chapter-05-multi-agent/README.md) |

---

## 📖 Tài nguyên liên quan

- [Kiểm tra trước triển khai](../chapter-06-pre-deployment/README.md)
- [Ví dụ ứng dụng Container](../../examples/container-app/README.md)
- [Ví dụ ứng dụng cơ sở dữ liệu](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ ban đầu của nó nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->