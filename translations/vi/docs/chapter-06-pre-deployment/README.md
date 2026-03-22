# Chương 6: Lập kế hoạch & Xác thực trước khi triển khai

**📚 Khóa học**: [AZD cho Người mới bắt đầu](../../README.md) | **⏱️ Thời lượng**: 1 giờ | **⭐ Độ phức tạp**: Trung cấp

---

## Tổng quan

Chương này trình bày các bước lập kế hoạch và xác thực thiết yếu trước khi triển khai ứng dụng. Học cách tránh những sai lầm tốn kém thông qua việc lập kế hoạch công suất phù hợp, lựa chọn SKU và thực hiện kiểm tra trước khi triển khai.

## Mục tiêu học tập

Khi hoàn thành chương này, bạn sẽ:
- Thực hiện kiểm tra trước khi triển khai
- Lập kế hoạch công suất và ước tính yêu cầu tài nguyên
- Chọn SKU phù hợp để tối ưu chi phí
- Cấu hình Application Insights để giám sát
- Hiểu các mẫu phối hợp nhóm

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời lượng |
|---|--------|-------------|------|
| 1 | [Kiểm tra trước khi triển khai](preflight-checks.md) | Xác thực cấu hình trước khi triển khai | 15 phút |
| 2 | [Lập kế hoạch công suất](capacity-planning.md) | Ước tính yêu cầu tài nguyên | 20 phút |
| 3 | [Lựa chọn SKU](sku-selection.md) | Chọn hạng giá phù hợp | 15 phút |
| 4 | [Application Insights](application-insights.md) | Cấu hình giám sát | 20 phút |
| 5 | [Mẫu phối hợp](coordination-patterns.md) | Luồng công việc triển khai nhóm | 15 phút |

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

## ☑️ Danh sách kiểm tra trước khi triển khai

### Trước khi `azd provision`

- [ ] Hạn ngạch cho khu vực đã được xác minh
- [ ] Các SKU đã được chọn phù hợp
- [ ] Ước tính chi phí đã được xem xét
- [ ] Quy ước đặt tên nhất quán
- [ ] Bảo mật/RBAC đã được cấu hình

### Trước khi `azd deploy`

- [ ] Biến môi trường đã được thiết lập
- [ ] Bí mật trong Key Vault
- [ ] Chuỗi kết nối đã được xác minh
- [ ] Kiểm tra tình trạng đã được cấu hình

---

## 💰 Hướng dẫn chọn SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Tiếp theo** | [Chương 7: Xử lý sự cố](../chapter-07-troubleshooting/README.md) |

---

## 📖 Tài nguyên liên quan

- [Hướng dẫn cấu hình](../chapter-03-configuration/configuration.md)
- [Hướng dẫn triển khai](../chapter-04-infrastructure/deployment-guide.md)
- [Các sự cố thường gặp](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ gốc của nó nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, khuyến nghị nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->