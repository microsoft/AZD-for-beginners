# Chương 6: Kế Hoạch & Xác Thực Trước Triển Khai

**📚 Khóa học**: [AZD Dành cho Người Mới](../../README.md) | **⏱️ Thời lượng**: 2-4 giờ đọc; thêm thời gian cho các phòng lab điều chỉnh | **⭐ Độ phức tạp**: Trung cấp–Nâng cao

---

## Tổng Quan

Chương này bao gồm các bước kế hoạch và xác thực cần thiết trước khi triển khai ứng dụng của bạn. Học cách tránh những sai lầm tốn kém với kế hoạch năng lực đúng đắn, chọn SKU và kiểm tra trước khi bay.

> Hướng dẫn lệnh được rà soát đối chiếu với tài liệu tham khảo `azd 1.37.2` đã phát hành. Các triển khai trên đám mây không được thực hiện. Các bài học dài hơn bao gồm các đoạn minh họa, không phải dự án triển khai địa phương hoàn chỉnh.

## Mục Tiêu Học Tập

Sau khi hoàn thành chương này, bạn sẽ:
- Thực hiện kiểm tra trước khi triển khai
- Lập kế hoạch năng lực và ước tính yêu cầu tài nguyên
- Chọn SKU phù hợp để tối ưu chi phí
- Cấu hình Application Insights để giám sát
- Hiểu các mẫu phối hợp đa tác nhân và yêu cầu triển khai của chúng

---

## 📚 Các Bài Học

| # | Bài Học | Mô Tả | Thời Gian |
|---|--------|-------------|------|
| 1 | [Kiểm Tra Trước Bay](preflight-checks.md) | Xác thực cấu hình trước khi triển khai | 15 phút |
| 2 | [Lập Kế Hoạch Năng Lực](capacity-planning.md) | Ước tính yêu cầu tài nguyên | 20 phút |
| 3 | [Chọn SKU](sku-selection.md) | Lựa chọn cấp giá phù hợp | 15 phút |
| 4 | [Application Insights](application-insights.md) | Cấu hình giám sát | 20 phút |
| 5 | [Mẫu Phối Hợp](coordination-patterns.md) | Thiết kế điều phối đa tác nhân nâng cao | 60-75 phút |

---

## 🚀 Bắt Đầu Nhanh

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Danh Sách Kiểm Tra Trước Triển Khai

### Trước `azd provision`

- [ ] Đã xác minh hạn mức cho khu vực
- [ ] SKU được chọn phù hợp
- [ ] Ước tính chi phí đã được rà soát
- [ ] Quy ước đặt tên nhất quán
- [ ] Đã cấu hình bảo mật/RBAC

### Trước `azd deploy`

- [ ] Thiết lập biến môi trường
- [ ] Bí mật trong Key Vault
- [ ] Chuỗi kết nối đã được kiểm tra
- [ ] Đã cấu hình kiểm tra sức khỏe

---

## 💰 Hướng Dẫn Chọn SKU

| Khối Lượng Công Việc | Phát Triển | Sản Xuất |
|----------|-------------|------------|
| Container Apps | Tiêu thụ | Tiêu thụ hoặc cấu hình tải chuyên dụng, dựa trên tải đo được |
| App Service | B1/B2 | P1v3+ |
| Mô hình Azure OpenAI | Hỗ trợ triển khai trả theo dùng | Trả theo dùng hoặc thông lượng được cấp; tùy thuộc mô hình/khu vực |
| AI Search | Miễn phí/Cơ bản trong giới hạn | Cơ bản hoặc tiêu chuẩn tùy kích cỡ chỉ mục, bản sao, và tải truy vấn |

---

## 🔗 Điều Hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 5: Đa Tác Nhân](../chapter-05-multi-agent/README.md) |
| **Tiếp** | [Chương 7: Xử Lý Sự Cố](../chapter-07-troubleshooting/README.md) |

---

## 📖 Tài Nguyên Liên Quan

- [Hướng Dẫn Cấu Hình](../chapter-03-configuration/configuration.md)
- [Hướng Dẫn Triển Khai](../chapter-04-infrastructure/deployment-guide.md)
- [Các Vấn Đề Thường Gặp](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->