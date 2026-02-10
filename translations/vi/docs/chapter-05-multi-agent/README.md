# Chương 5: Giải pháp AI đa tác nhân

**📚 Khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md) | **⏱️ Thời lượng**: 2-3 giờ | **⭐ Độ khó**: Nâng cao

---

## Tổng quan

Chương này bao gồm các mẫu kiến trúc đa tác nhân nâng cao, điều phối tác nhân, và triển khai AI sẵn sàng cho môi trường sản xuất cho các kịch bản phức tạp.

## Mục tiêu học tập

By completing this chapter, you will:
- Hiểu các mẫu kiến trúc đa tác nhân
- Triển khai các hệ thống tác nhân AI phối hợp
- Triển khai giao tiếp giữa các tác nhân
- Xây dựng giải pháp đa tác nhân sẵn sàng cho sản xuất

---

## 📚 Bài học

| # | Bài | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Giải pháp bán lẻ đa tác nhân](../../examples/retail-scenario.md) | Hướng dẫn triển khai đầy đủ | 90 phút |
| 2 | [Mẫu điều phối](../chapter-06-pre-deployment/coordination-patterns.md) | Chiến lược điều phối tác nhân | 30 phút |
| 3 | [Triển khai ARM Template](../../examples/retail-multiagent-arm-template/README.md) | Triển khai chỉ với một lần nhấp | 30 phút |

---

## 🚀 Bắt đầu nhanh

```bash
# Triển khai giải pháp đa tác nhân cho bán lẻ
cd examples/retail-multiagent-arm-template
./deploy.sh

# Hoặc sử dụng mẫu trực tiếp
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Kiến trúc đa tác nhân

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Giải pháp tiêu biểu: Bán lẻ đa tác nhân

[Giải pháp bán lẻ đa tác nhân](../../examples/retail-scenario.md) minh họa:

- **Tác nhân Khách hàng**: Xử lý tương tác người dùng và sở thích
- **Tác nhân Kho**: Quản lý tồn kho và xử lý đơn hàng
- **Điều phối viên**: Điều phối giữa các tác nhân
- **Bộ nhớ dùng chung**: Quản lý ngữ cảnh giữa các tác nhân

### Dịch vụ sử dụng

| Dịch vụ | Mục đích |
|---------|---------|
| Azure OpenAI | Hiểu ngôn ngữ |
| Azure AI Search | Danh mục sản phẩm |
| Cosmos DB | Trạng thái và bộ nhớ của tác nhân |
| Container Apps | Lưu trữ tác nhân |
| Application Insights | Giám sát |

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 4: Hạ tầng](../chapter-04-infrastructure/README.md) |
| **Tiếp theo** | [Chương 6: Trước khi triển khai](../chapter-06-pre-deployment/README.md) |

---

## 📖 Tài nguyên liên quan

- [Hướng dẫn Tác nhân AI](../chapter-02-ai-development/agents.md)
- [Thực hành AI cho môi trường sản xuất](../chapter-08-production/production-ai-practices.md)
- [Xử lý sự cố AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, khuyến nghị sử dụng bản dịch chuyên nghiệp do người dịch là con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->