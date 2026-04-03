# Chương 6: Lập kế hoạch & Xác thực trước triển khai

**📚 Khóa học**: [AZD For Beginners](../../README.md) | **⏱️ Thời lượng**: 1 giờ | **⭐ Độ phức tạp**: Trung bình

---

## Tổng quan

Chương này bao gồm các bước lập kế hoạch và xác thực quan trọng trước khi triển khai ứng dụng của bạn. Học cách tránh những sai lầm tốn kém bằng lập kế hoạch dung lượng đúng cách, lựa chọn SKU và kiểm tra tiền chuyến bay.

> Đã xác thực với `azd 1.23.12` vào tháng 3 năm 2026.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Chạy các kiểm tra trước khi triển khai
- Lên kế hoạch dung lượng và ước tính yêu cầu tài nguyên
- Chọn SKU phù hợp để tối ưu chi phí
- Cấu hình Application Insights để giám sát
- Hiểu các mẫu phối hợp nhóm

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Kiểm tra trước khi triển khai](preflight-checks.md) | Xác thực cấu hình trước khi triển khai | 15 phút |
| 2 | [Lập kế hoạch dung lượng](capacity-planning.md) | Ước tính yêu cầu tài nguyên | 20 phút |
| 3 | [Lựa chọn SKU](sku-selection.md) | Chọn hạng giá phù hợp | 15 phút |
| 4 | [Application Insights](application-insights.md) | Cấu hình giám sát | 20 phút |
| 5 | [Mẫu phối hợp](coordination-patterns.md) | Luồng công việc triển khai của nhóm | 15 phút |

---

## 🚀 Bắt đầu nhanh

```bash
# Kiểm tra hạn mức đăng ký
az vm list-usage --location eastus --output table

# Xem trước triển khai (không tạo tài nguyên)
azd provision --preview

# Xác thực cú pháp Bicep
az bicep build --file infra/main.bicep

# Kiểm tra cấu hình môi trường
azd env get-values
```

---

## ☑️ Danh sách kiểm tra trước triển khai

### Trước `azd provision`

- [ ] Hạn mức đã được xác minh cho khu vực
- [ ] Đã chọn SKU phù hợp
- [ ] Đã xem xét ước tính chi phí
- [ ] Quy ước đặt tên nhất quán
- [ ] Bảo mật/RBAC đã được cấu hình

### Trước `azd deploy`

- [ ] Các biến môi trường đã được thiết lập
- [ ] Bí mật trong Key Vault
- [ ] Chuỗi kết nối đã được xác minh
- [ ] Kiểm tra sức khỏe đã được cấu hình

---

## 💰 Hướng dẫn lựa chọn SKU

| Loại công việc | Phát triển | Sản xuất |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 5: Đa Tác nhân](../chapter-05-multi-agent/README.md) |
| **Tiếp theo** | [Chương 7: Khắc phục sự cố](../chapter-07-troubleshooting/README.md) |

---

## 📖 Tài nguyên liên quan

- [Hướng dẫn cấu hình](../chapter-03-configuration/configuration.md)
- [Hướng dẫn triển khai](../chapter-04-infrastructure/deployment-guide.md)
- [Các sự cố phổ biến](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn chính thức. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do người dịch thực hiện. Chúng tôi không chịu trách nhiệm đối với bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->