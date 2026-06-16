# Chapter 6: Lập Kế Hoạch & Xác Thực Trước Triển Khai

**📚 Course**: [AZD cho người mới bắt đầu](../../README.md) | **⏱️ Duration**: 1 giờ | **⭐ Complexity**: Trung cấp

---

## Tổng quan

Chương này bao gồm các bước lập kế hoạch và xác thực thiết yếu trước khi triển khai ứng dụng của bạn. Học cách tránh những sai lầm tốn kém với việc lập kế hoạch dung lượng hợp lý, lựa chọn SKU và kiểm tra tiền bay.

> Đã xác thực với `azd 1.25.6` vào tháng 6 năm 2026.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Chạy kiểm tra tiền bay trước khi triển khai
- Lập kế hoạch dung lượng và ước tính yêu cầu tài nguyên
- Chọn SKU phù hợp để tối ưu chi phí
- Cấu hình Application Insights để giám sát
- Hiểu các mẫu phối hợp nhóm

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Xác thực cấu hình trước khi triển khai | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Ước tính yêu cầu tài nguyên | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Chọn hạng giá phù hợp | 15 min |
| 4 | [Application Insights](application-insights.md) | Cấu hình giám sát | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Quy trình làm việc triển khai của nhóm | 15 min |

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

- [ ] Hạn mức (quota) đã được xác minh cho khu vực
- [ ] Đã chọn SKU phù hợp
- [ ] Ước tính chi phí đã được xem xét
- [ ] Quy ước đặt tên thống nhất
- [ ] Bảo mật/RBAC đã được cấu hình

### Trước `azd deploy`

- [ ] Biến môi trường đã được thiết lập
- [ ] Bí mật đã lưu trong Key Vault
- [ ] Chuỗi kết nối đã được xác minh
- [ ] Kiểm tra tình trạng đã được cấu hình

---

## 💰 Hướng dẫn lựa chọn SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Điều hướng

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chương 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Next** | [Chương 7: Khắc phục sự cố](../chapter-07-troubleshooting/README.md) |

---

## 📖 Tài nguyên liên quan

- [Hướng dẫn cấu hình](../chapter-03-configuration/configuration.md)
- [Hướng dẫn triển khai](../chapter-04-infrastructure/deployment-guide.md)
- [Các sự cố thường gặp](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->