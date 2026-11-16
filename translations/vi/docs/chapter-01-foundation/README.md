# Chương 1: Nền tảng & Bắt đầu nhanh

**📚 Khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md) | **⏱️ Thời lượng**: 75-120 phút bao gồm triển khai đầu tiên; bài tập bổ sung sẽ mất nhiều thời gian hơn | **⭐ Độ phức tạp**: Người mới bắt đầu

---

## Tổng quan

Chương này giới thiệu các kiến thức cơ bản về Azure Developer CLI (azd). Bạn sẽ học các khái niệm cốt lõi, cài đặt công cụ và triển khai ứng dụng đầu tiên lên Azure.

> Mục tiêu xem xét lệnh và cấu hình: `azd 1.37.2` (Tháng 11 năm 2026). Việc cung cấp Azure trực tiếp không được chạy trong quá trình đánh giá.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Hiểu Azure Developer CLI là gì và nó khác Azure CLI như thế nào
- Cài đặt và cấu hình AZD trên nền tảng của bạn
- Triển khai ứng dụng đầu tiên lên Azure bằng `azd up`
- Dọn dẹp tài nguyên bằng `azd down`

---

## 📚 Các bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Cơ bản về AZD](azd-basics.md) | Các khái niệm cốt lõi, thuật ngữ và cấu trúc dự án | 15 phút |
| 2 | [Cài đặt & Thiết lập](installation.md) | Hướng dẫn cài đặt theo nền tảng | 10 phút |
| 3 | [Dự án đầu tiên của bạn](first-project.md) | Thực hành: Triển khai ứng dụng web lên Azure | 20 phút |
| 4 | [Mang ứng dụng của bạn đến](bring-your-own-app.md) | Thêm azd vào dự án hiện có của bạn | 15 phút |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Môi trường azd có thể tái lập với dev containers | 15 phút |

---

## ✅ Bắt đầu tại đây: Xác nhận Cấu hình của bạn

Trước khi bắt đầu, hãy xác nhận máy cục bộ của bạn đã sẵn sàng cho mẫu Chapter 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Nếu script báo thiếu công cụ, hãy sửa lỗi đó trước rồi tiếp tục với chương.

---

## 🚀 Bắt đầu nhanh

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Tiêu chí thành công

Sau khi hoàn thành chương này, bạn cần có khả năng:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Điều hướng

| Hướng đi | Chương |
|-----------|---------|
| **Tiếp theo** | [Chương 2: Phát triển AI-First](../chapter-02-ai-development/README.md) |
| **Bỏ qua đến** | [Chương 3: Cấu hình](../chapter-03-configuration/README.md) |

---

## 📖 Tài nguyên liên quan

- [Bảng tóm tắt lệnh](../../resources/cheat-sheet.md)
- [Câu hỏi thường gặp](../../resources/faq.md)
- [Thuật ngữ](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->