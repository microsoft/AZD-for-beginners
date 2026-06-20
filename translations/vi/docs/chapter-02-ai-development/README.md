# Chương 2: Phát triển Ưu tiên AI

**📚 Khóa học**: [AZD For Beginners](../../README.md) | **⏱️ Thời lượng**: 1-2 hours | **⭐ Độ phức tạp**: Trung cấp

---

## Tổng quan

Chương này tập trung vào việc triển khai các ứng dụng hỗ trợ AI sử dụng Azure Developer CLI và dịch vụ Microsoft Foundry. Từ các ứng dụng trò chuyện AI đơn giản đến các tác nhân thông minh có công cụ.

> **Ghi chú xác thực (2026-06-15):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.25.6` and the current preview AI agent extension release `azure.ai.agents` `0.1.40-preview`. Nếu bạn đang dùng bản AZD cũ hơn, hãy cập nhật trước rồi tiếp tục với các bài tập.

## Mục tiêu học tập

By completing this chapter, you will:
- Triển khai ứng dụng AI sử dụng mẫu AZD có sẵn
- Hiểu cách tích hợp Microsoft Foundry với AZD
- Cấu hình và tùy chỉnh các tác nhân AI với công cụ
- Triển khai ứng dụng RAG (Tăng cường tạo sinh dựa trên truy xuất)

---

## 📚 Bài học

| # | Bài | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Kết nối AZD với dịch vụ Foundry | 30 phút |
| 2 | [AI Agents Guide](agents.md) | Triển khai các tác nhân thông minh với công cụ | 45 phút |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Triển khai và cấu hình mô hình AI | 30 phút |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Thực hành: Chuẩn bị giải pháp AI của bạn sẵn sàng cho AZD | 60 phút |

---

## 🚀 Bắt đầu nhanh

```bash
# Tùy chọn 1: Ứng dụng chat RAG
azd init --template azure-search-openai-demo
azd up

# Tùy chọn 2: Tác nhân AI
azd init --template get-started-with-ai-agents
azd up

# Tùy chọn 3: Ứng dụng chat nhanh
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Mẫu AI Nổi bật

| Mẫu | Mô tả | Dịch vụ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Trò chuyện RAG với trích dẫn | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Tác nhân AI với công cụ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Trò chuyện AI cơ bản | OpenAI + Container Apps |

---

## 💰 Nhận thức về chi phí

| Môi trường | Chi phí ước tính hàng tháng |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Mẹo:** Chạy `azd down` sau khi kiểm thử để tránh bị tính phí.

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 1: Nền tảng](../chapter-01-foundation/README.md) |
| **Tiếp theo** | [Chương 3: Cấu hình](../chapter-03-configuration/README.md) |
| **Chuyển tới** | [Chương 8: Mẫu sản xuất](../chapter-08-production/README.md) |

---

## 📖 Tài nguyên liên quan

- [Khắc phục sự cố AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Thực hành AI cho sản xuất](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->