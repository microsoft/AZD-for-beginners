# Chương 8: Mẫu Triển khai Sản xuất & Doanh nghiệp

**📚 Khóa học**: [AZD Cho Người Mới](../../README.md) | **⏱️ Thời lượng**: 2-3 hours | **⭐ Độ phức tạp**: Nâng cao

---

## Tổng quan

Chương này bao gồm các mẫu triển khai sẵn sàng cho doanh nghiệp, gia cố bảo mật, giám sát và tối ưu hóa chi phí cho các khối lượng công việc AI trong môi trường sản xuất.

## Mục tiêu học tập

Khi hoàn thành chương này, bạn sẽ:
- Triển khai ứng dụng chịu lỗi đa vùng
- Thực hiện các mẫu bảo mật cho doanh nghiệp
- Cấu hình giám sát toàn diện
- Tối ưu hóa chi phí ở quy mô lớn
- Thiết lập CI/CD pipeline với AZD

---

## 📚 Bài học

| # | Bài | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Thực hành AI cho Sản xuất](production-ai-practices.md) | Mẫu triển khai cho doanh nghiệp | 90 phút |

---

## 🚀 Danh sách kiểm tra sản xuất

- [ ] Triển khai đa vùng để đảm bảo khả năng chịu lỗi
- [ ] Sử dụng managed identity cho xác thực (không dùng khóa)
- [ ] Application Insights để giám sát
- [ ] Cấu hình ngân sách chi phí và cảnh báo
- [ ] Bật quét bảo mật
- [ ] Tích hợp pipeline CI/CD
- [ ] Kế hoạch khôi phục thảm họa

---

## 🏗️ Mẫu kiến trúc

### Mẫu 1: Microservices cho AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### Mẫu 2: AI theo sự kiện

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Thực hành bảo mật tốt nhất

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Tối ưu hóa chi phí

| Chiến lược | Tiết kiệm |
|----------|---------|
| Thu nhỏ xuống 0 (Container Apps) | 60-80% |
| Sử dụng tầng tiêu thụ cho môi dev | 50-70% |
| Tăng/giảm quy mô theo lịch | 30-50% |
| Dung lượng đặt trước | 20-40% |

```bash
# Đặt cảnh báo ngân sách
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Cài đặt giám sát

```bash
# Phát trực tiếp nhật ký
azd monitor --logs

# Kiểm tra Application Insights
azd monitor

# Xem số liệu
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 7: Khắc phục sự cố](../chapter-07-troubleshooting/README.md) |
| **Hoàn thành Khóa học** | [Trang chủ Khóa học](../../README.md) |

---

## 📖 Tài nguyên liên quan

- [Hướng dẫn Tác nhân AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Giải pháp đa tác nhân](../chapter-05-multi-agent/README.md)
- [Ví dụ Microservices](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn chính thức. Đối với những thông tin quan trọng, nên sử dụng bản dịch do người dịch/chuyên gia dịch thuật thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->