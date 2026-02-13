# Chương 1: Nền tảng & Bắt đầu Nhanh

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 30-45 phút | **⭐ Complexity**: Người mới

---

## Tổng quan

Chương này giới thiệu những kiến thức cơ bản về Azure Developer CLI (azd). Bạn sẽ học các khái niệm cốt lõi, cài đặt công cụ và triển khai ứng dụng đầu tiên của mình lên Azure.

## Mục tiêu học tập

Hoàn thành chương này, bạn sẽ:
- Hiểu Azure Developer CLI là gì và khác với Azure CLI như thế nào
- Cài đặt và cấu hình AZD trên nền tảng của bạn
- Triển khai ứng dụng đầu tiên lên Azure bằng `azd up`
- Dọn dẹp tài nguyên bằng `azd down`

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Các khái niệm cốt lõi, thuật ngữ và cấu trúc dự án | 15 phút |
| 2 | [Installation & Setup](installation.md) | Hướng dẫn cài đặt theo nền tảng | 10 phút |
| 3 | [Your First Project](first-project.md) | Thực hành: Triển khai một ứng dụng web lên Azure | 20 phút |

---

## 🚀 Bắt đầu Nhanh

```bash
# Kiểm tra cài đặt
azd version

# Đăng nhập vào Azure
azd auth login

# Triển khai ứng dụng đầu tiên của bạn
azd init --template todo-nodejs-mongo
azd up

# Dọn dẹp khi hoàn tất
azd down --force --purge
```

---

## ✅ Tiêu chí thành công

Sau khi hoàn thành chương này, bạn sẽ có thể:

```bash
azd version              # Hiển thị phiên bản đã cài đặt
azd init --template todo-nodejs-mongo  # Khởi tạo dự án
azd up                   # Triển khai lên Azure
azd show                 # Hiển thị URL của ứng dụng đang chạy
azd down --force --purge # Dọn dẹp tài nguyên
```

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Tiếp theo** | [Chương 2: Phát triển ưu tiên AI](../chapter-02-ai-development/README.md) |
| **Chuyển đến** | [Chương 3: Cấu hình](../chapter-03-configuration/README.md) |

---

## 📖 Tài nguyên liên quan

- [Bảng tóm tắt lệnh](../../resources/cheat-sheet.md)
- [Câu hỏi thường gặp](../../resources/faq.md)
- [Thuật ngữ](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn thông tin có thẩm quyền. Đối với những thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do người dịch thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hay giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->