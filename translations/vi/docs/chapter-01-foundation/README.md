# Chương 1: Nền tảng & Bắt đầu nhanh

**📚 Khóa học**: [AZD cho Người mới bắt đầu](../../README.md) | **⏱️ Thời lượng**: 30-45 phút | **⭐ Độ khó**: Người mới bắt đầu

---

## Tổng quan

Chương này giới thiệu các khái niệm cơ bản về Azure Developer CLI (azd). Bạn sẽ học các khái niệm cốt lõi, cài đặt công cụ và triển khai ứng dụng đầu tiên của mình lên Azure.

> Đã xác thực với `azd 1.25.6` vào tháng 6 năm 2026.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Hiểu Azure Developer CLI là gì và khác với Azure CLI như thế nào
- Cài đặt và cấu hình AZD trên nền tảng của bạn
- Triển khai ứng dụng đầu tiên của bạn lên Azure bằng `azd up`
- Dọn dẹp tài nguyên bằng `azd down`

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [AZD Cơ bản](azd-basics.md) | Các khái niệm cốt lõi, thuật ngữ và cấu trúc dự án | 15 phút |
| 2 | [Cài đặt & Thiết lập](installation.md) | Hướng dẫn cài đặt theo nền tảng | 10 phút |
| 3 | [Dự án đầu tiên của bạn](first-project.md) | Thực hành: Triển khai ứng dụng web lên Azure | 20 phút |
| 4 | [Mang Ứng dụng của Bạn](bring-your-own-app.md) | Thêm azd vào dự án hiện có của bạn | 15 phút |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Môi trường azd có thể tái tạo với dev containers | 15 phút |

---

## ✅ Bắt đầu tại đây: Xác nhận Cài đặt của bạn

Trước khi bạn bắt đầu, hãy xác nhận rằng máy cục bộ của bạn đã sẵn sàng cho mẫu Chương 1:

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

## 🚀 Bắt đầu Nhanh

```bash
# Kiểm tra cài đặt
azd version

# Xác thực cho AZD
# Tùy chọn: az login nếu bạn dự định chạy các lệnh Azure CLI trực tiếp
azd auth login

# Triển khai ứng dụng đầu tiên của bạn
azd init --template todo-nodejs-mongo
azd up

# Dọn dẹp khi hoàn tất
azd down --force --purge
```

---

## ✅ Tiêu chí Thành công

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
| **Tiếp theo** | [Chương 2: Phát triển theo hướng AI](../chapter-02-ai-development/README.md) |
| **Đi tới** | [Chương 3: Cấu hình](../chapter-03-configuration/README.md) |

---

## 📖 Tài nguyên liên quan

- [Bảng tóm tắt lệnh](../../resources/cheat-sheet.md)
- [Câu hỏi thường gặp (FAQ)](../../resources/faq.md)
- [Thuật ngữ](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->