# Chương 6: Lập Kế Hoạch & Xác Thực Trước Triển Khai

**📚 Khóa học**: [AZD Cho Người Mới](../../README.md) | **⏱️ Thời lượng**: 1 giờ | **⭐ Độ phức tạp**: Trung cấp

---

## Tổng quan

Chương này bao gồm các bước lập kế hoạch và xác thực cần thiết trước khi triển khai ứng dụng của bạn. Học cách tránh các sai sót tốn kém với lập kế hoạch dung lượng đúng đắn, lựa chọn SKU và kiểm tra trước khi bay.

> Đã xác thực với `azd 1.27.1` vào tháng 7 năm 2026.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Thực hiện kiểm tra trước khi triển khai
- Lập kế hoạch dung lượng và ước tính yêu cầu tài nguyên
- Lựa chọn SKU phù hợp để tối ưu chi phí
- Cấu hình Application Insights để giám sát
- Hiểu các mẫu phối hợp trong nhóm

---

## 📚 Các bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Kiểm tra trước khi bay](preflight-checks.md) | Xác thực cấu hình trước triển khai | 15 phút |
| 2 | [Lập kế hoạch dung lượng](capacity-planning.md) | Ước tính yêu cầu tài nguyên | 20 phút |
| 3 | [Lựa chọn SKU](sku-selection.md) | Chọn mức giá phù hợp | 15 phút |
| 4 | [Application Insights](application-insights.md) | Cấu hình giám sát | 20 phút |
| 5 | [Các mẫu phối hợp](coordination-patterns.md) | Quy trình làm việc nhóm khi triển khai | 15 phút |

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

### Trước khi chạy `azd provision`

- [ ] Đã xác minh hạn mức cho khu vực
- [ ] SKU đã lựa chọn phù hợp
- [ ] Đã xem xét ước tính chi phí
- [ ] Quy ước đặt tên nhất quán
- [ ] Cấu hình bảo mật/RBAC

### Trước khi chạy `azd deploy`

- [ ] Các biến môi trường đã thiết lập
- [ ] Bí mật trong Key Vault
- [ ] Đã xác minh chuỗi kết nối
- [ ] Cấu hình kiểm tra sức khỏe

---

## 💰 Hướng dẫn lựa chọn SKU

| Khối lượng công việc | Phát triển | Sản xuất |
|----------|-------------|------------|
| Container Apps | Tiêu thụ | D4 dành riêng |
| App Service | B1/B2 | P1v3+ |
| Mô hình Microsoft Foundry | Tiêu chuẩn | Tiêu chuẩn + PTU |
| AI Search | Cơ bản | Tiêu chuẩn S2+ |

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 5: Đa tác nhân](../chapter-05-multi-agent/README.md) |
| **Tiếp theo** | [Chương 7: Khắc phục sự cố](../chapter-07-troubleshooting/README.md) |

---

## 📖 Tài nguyên liên quan

- [Hướng dẫn cấu hình](../chapter-03-configuration/configuration.md)
- [Hướng dẫn triển khai](../chapter-04-infrastructure/deployment-guide.md)
- [Các sự cố phổ biến](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->