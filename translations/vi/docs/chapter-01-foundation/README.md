# Chương 1: Nền tảng & Bắt đầu nhanh

**📚 Khóa học**: [AZD dành cho người mới bắt đầu](../../README.md) | **⏱️ Thời lượng**: 30-45 phút | **⭐ Độ khó**: Người mới bắt đầu

---

## Tổng quan

Chương này giới thiệu các nguyên tắc cơ bản của Azure Developer CLI (azd). Bạn sẽ học các khái niệm cốt lõi, cài đặt công cụ và triển khai ứng dụng đầu tiên của mình lên Azure.

> Đã kiểm chứng với `azd 1.23.12` vào tháng 3 năm 2026.

## Mục tiêu học tập

Hoàn thành chương này, bạn sẽ:
- Hiểu Azure Developer CLI là gì và khác gì so với Azure CLI
- Cài đặt và cấu hình AZD trên nền tảng của bạn
- Triển khai ứng dụng đầu tiên lên Azure với `azd up`
- Dọn dẹp tài nguyên với `azd down`

---

## 📚 Bài học

| # | Bài | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [AZD Cơ bản](azd-basics.md) | Khái niệm cốt lõi, thuật ngữ, và cấu trúc dự án | 15 min |
| 2 | [Cài đặt & Thiết lập](installation.md) | Hướng dẫn cài đặt theo nền tảng | 10 min |
| 3 | [Dự án đầu tiên của bạn](first-project.md) | Thực hành: Triển khai ứng dụng web lên Azure | 20 min |

---

## ✅ Bắt đầu ở đây: Xác thực cài đặt của bạn

Trước khi bắt đầu, xác nhận rằng máy cục bộ của bạn đã sẵn sàng cho mẫu Chương 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script reports missing tools, fix those first and then continue with the chapter.

---

## 🚀 Bắt đầu nhanh

```bash
# Kiểm tra cài đặt
azd version

# Xác thực cho AZD
# Tùy chọn: az login nếu bạn định chạy các lệnh Azure CLI trực tiếp
azd auth login

# Triển khai ứng dụng đầu tiên của bạn
azd init --template todo-nodejs-mongo
azd up

# Dọn dẹp khi xong
azd down --force --purge
```

---

## ✅ Tiêu chí thành công

Sau khi hoàn thành chương này, bạn sẽ có thể:

```bash
azd version              # Hiển thị phiên bản đã cài đặt
azd init --template todo-nodejs-mongo  # Khởi tạo dự án
azd up                   # Triển khai lên Azure
azd show                 # Hiển thị URL ứng dụng đang chạy
azd down --force --purge # Dọn dẹp tài nguyên
```

---

## 🔗 Điều hướng

| Direction | Chapter |
|-----------|---------|
| **Next** | [Chương 2: Phát triển ưu tiên AI](../chapter-02-ai-development/README.md) |
| **Skip to** | [Chương 3: Cấu hình](../chapter-03-configuration/README.md) |

---

## 📖 Tài nguyên liên quan

- [Tổng hợp lệnh](../../resources/cheat-sheet.md)
- [Câu hỏi thường gặp](../../resources/faq.md)
- [Thuật ngữ](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ gốc nên được coi là nguồn chính thức. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->