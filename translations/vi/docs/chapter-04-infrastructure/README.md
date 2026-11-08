# Chương 4: Hạ Tầng Dưới Dạng Mã & Triển Khai

**📚 Khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md) | **⏱️ Thời gian**: 2-3 giờ đọc; dành thêm thời gian cho bài tập triển khai | **⭐ Độ khó**: Trung cấp

---

## Tổng quan

Chương này bao gồm các mẫu Hạ Tầng dưới dạng Mã (IaC) với template Bicep, cấp phát tài nguyên và chiến lược triển khai sử dụng Azure Developer CLI.

> Mục tiêu xem xét lệnh và cấu hình: `azd 1.37.2` (Tháng 11 năm 2026). Không chạy cấp phát Azure trực tiếp trong quá trình xem xét.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Hiểu cấu trúc và cú pháp template Bicep
- Cấp phát tài nguyên Azure với `azd provision`
- Triển khai ứng dụng với `azd deploy`
- Thực hiện chiến lược triển khai xanh-xanh và tuần tự

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Cấp phát Tài nguyên](provisioning.md) | Quản lý tài nguyên Azure với AZD | 45 phút |
| 2 | [Hướng dẫn Triển khai](deployment-guide.md) | Chiến lược triển khai ứng dụng | 45 phút |
| 3 | [Tạo Template Riêng của Bạn](custom-templates.md) | Xây dựng và xuất bản template azd tái sử dụng | 30 phút |

---

## 🚀 Bắt đầu Nhanh

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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

## 🔧 Lệnh Cơ bản

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
| **Tiếp** | [Chương 5: Giải pháp Đa Tác nhân](../chapter-05-multi-agent/README.md) |

---

## 📖 Tài nguyên Liên quan

- [Kiểm tra Trước Triển khai](../chapter-06-pre-deployment/README.md)
- [Ví dụ Ứng dụng Container](../../examples/container-app/README.md)
- [Ví dụ Ứng dụng Cơ sở Dữ liệu](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->