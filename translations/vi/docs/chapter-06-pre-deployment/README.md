# Chương 6: Lập kế hoạch & Xác thực trước khi triển khai

**📚 Khóa học**: [AZD cho Người mới bắt đầu](../../README.md) | **⏱️ Thời lượng**: 1 giờ | **⭐ Độ khó**: Trung cấp

---

## Tổng quan

Chương này bao gồm các bước lập kế hoạch và xác thực thiết yếu trước khi triển khai ứng dụng của bạn. Học cách tránh những sai lầm tốn kém bằng lập kế hoạch dung lượng phù hợp, lựa chọn SKU và các kiểm tra tiền triển khai.

## Mục tiêu học tập

Khi hoàn thành chương này, bạn sẽ:
- Thực hiện các kiểm tra tiền triển khai trước khi triển khai
- Lập kế hoạch dung lượng và ước tính yêu cầu tài nguyên
- Chọn SKU phù hợp để tối ưu chi phí
- Cấu hình Application Insights để giám sát
- Hiểu các mẫu phối hợp nhóm

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Kiểm tra tiền triển khai](preflight-checks.md) | Xác thực cấu hình trước khi triển khai | 15 phút |
| 2 | [Lập kế hoạch dung lượng](capacity-planning.md) | Ước tính yêu cầu tài nguyên | 20 phút |
| 3 | [Lựa chọn SKU](sku-selection.md) | Chọn bậc giá phù hợp | 15 phút |
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

- [ ] Hạn ngạch đã được xác minh cho khu vực
- [ ] SKU đã được chọn phù hợp
- [ ] Ước tính chi phí đã được xem xét
- [ ] Quy ước đặt tên thống nhất
- [ ] Bảo mật/RBAC đã được cấu hình

### Trước `azd deploy`

- [ ] Biến môi trường đã được thiết lập
- [ ] Bí mật trong Key Vault
- [ ] Chuỗi kết nối đã được xác minh
- [ ] Kiểm tra sức khỏe đã được cấu hình

---

## 💰 Hướng dẫn lựa chọn SKU

| Khối lượng công việc | Phát triển | Sản xuất |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Tiếp theo** | [Chương 7: Xử lý sự cố](../chapter-07-troubleshooting/README.md) |

---

## 📖 Tài nguyên liên quan

- [Hướng dẫn Cấu hình](../chapter-03-configuration/configuration.md)
- [Hướng dẫn Triển khai](../chapter-04-infrastructure/deployment-guide.md)
- [Các sự cố phổ biến](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tuyên bố miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn chính thức. Đối với những thông tin quan trọng, nên sử dụng bản dịch chuyên nghiệp do người dịch thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hoặc cách hiểu sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->