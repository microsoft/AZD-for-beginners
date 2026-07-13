# Chương 2: Phát triển Ưu tiên AI

**📚 Khóa học**: [AZD For Beginners](../../README.md) | **⏱️ Thời lượng**: 1-2 giờ | **⭐ Độ phức tạp**: Trung cấp

---

## Tổng quan

Chương này tập trung vào việc triển khai các ứng dụng được hỗ trợ bởi AI sử dụng Azure Developer CLI và dịch vụ Microsoft Foundry. Từ các ứng dụng chat AI đơn giản đến các đại lý thông minh với công cụ.

> **Lưu ý xác nhận (2026-07-13):** Các hướng dẫn về luồng lệnh và tiện ích mở rộng trong chương này đã được kiểm tra đối chiếu với `azd` `1.27.1` và bản phát hành bản xem trước tiện ích AI agent hiện tại `azure.ai.agents` `1.0.0-beta.5`. Nếu bạn đang dùng bản AZD cũ hơn, hãy cập nhật trước rồi tiếp tục với các bài tập.

## Mục tiêu học tập

Khi hoàn thành chương này, bạn sẽ:
- Triển khai ứng dụng AI sử dụng mẫu AZD đã xây dựng sẵn
- Hiểu tích hợp Microsoft Foundry với AZD
- Cấu hình và tùy chỉnh các AI agent với công cụ
- Triển khai ứng dụng RAG (Retrieval-Augmented Generation)

---

## 📚 Các bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Tích hợp Microsoft Foundry](microsoft-foundry-integration.md) | Kết nối AZD với dịch vụ Foundry | 30 phút |
| 2 | [Hướng dẫn AI Agents](agents.md) | Triển khai đại lý thông minh với công cụ | 45 phút |
| 3 | [Triển khai mô hình AI](ai-model-deployment.md) | Triển khai và cấu hình mô hình AI | 30 phút |
| 4 | [Phòng thí nghiệm AI Workshop](ai-workshop-lab.md) | Thực hành: Chuẩn bị giải pháp AI sẵn sàng với AZD | 60 phút |

---

## 🚀 Bắt đầu nhanh

```bash
# Lựa chọn 1: Ứng dụng Chat RAG
azd init --template azure-search-openai-demo
azd up

# Lựa chọn 2: Đại lý AI
azd init --template get-started-with-ai-agents
azd up

# Lựa chọn 3: Ứng dụng Chat Nhanh
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Các mẫu AI nổi bật

| Mẫu | Mô tả | Dịch vụ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG với trích dẫn | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Đại lý AI với công cụ | Dịch vụ AI Agent |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI cơ bản | OpenAI + Container Apps |

---

## 💰 Nhận thức về chi phí

| Môi trường | Chi phí ước tính hàng tháng |
|-------------|----------------------|
| Phát triển | $80-150 |
| Kiểm thử | $150-300 |
| Sản xuất | $300-3,500+ |

**Mẹo:** Chạy `azd down` sau khi thử để tránh phát sinh chi phí.

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 1: Nền tảng](../chapter-01-foundation/README.md) |
| **Tiếp theo** | [Chương 3: Cấu hình](../chapter-03-configuration/README.md) |
| **Chuyển tới** | [Chương 8: Mô hình sản xuất](../chapter-08-production/README.md) |

---

## 📖 Tài nguyên liên quan

- [Khắc phục sự cố AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Thực hành AI sản xuất](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->