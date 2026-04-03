# Chương 2: Phát triển Ưu tiên AI

**📚 Khóa học**: [AZD For Beginners](../../README.md) | **⏱️ Thời lượng**: 1-2 giờ | **⭐ Độ phức tạp**: Trung cấp

---

## Tổng quan

Chương này tập trung vào triển khai các ứng dụng được hỗ trợ bởi AI bằng Azure Developer CLI và dịch vụ Microsoft Foundry. Từ các ứng dụng chat AI đơn giản đến các tác nhân thông minh có công cụ.

> **Ghi chú xác nhận (2026-03-25):** Luồng lệnh và hướng dẫn mở rộng trong chương này đã được rà soát so với `azd` `1.23.12` và bản xem trước hiện tại của phần mở rộng tác nhân AI `azure.ai.agents` `0.1.18-preview`. Nếu bạn đang dùng bản AZD cũ hơn, hãy cập nhật trước rồi tiếp tục với các bài tập.

## Mục tiêu học tập

Khi hoàn thành chương này, bạn sẽ:
- Triển khai các ứng dụng AI bằng các mẫu AZD có sẵn
- Hiểu cách tích hợp Microsoft Foundry với AZD
- Cấu hình và tùy chỉnh các tác nhân AI với công cụ
- Triển khai các ứng dụng RAG (Retrieval-Augmented Generation)

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Tích hợp Microsoft Foundry](microsoft-foundry-integration.md) | Kết nối AZD với dịch vụ Foundry | 30 min |
| 2 | [Hướng dẫn Tác nhân AI](agents.md) | Triển khai các tác nhân thông minh với công cụ | 45 min |
| 3 | [Triển khai Mô hình AI](ai-model-deployment.md) | Triển khai và cấu hình các mô hình AI | 30 min |
| 4 | [Phòng thí nghiệm AI Workshop](ai-workshop-lab.md) | Thực hành: Chuẩn bị giải pháp AI của bạn cho AZD | 60 min |

---

## 🚀 Bắt đầu Nhanh

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

## 🤖 Mẫu AI nổi bật

| Mẫu | Mô tả | Dịch vụ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Trò chuyện RAG có trích dẫn | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Tác nhân AI có công cụ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Trò chuyện AI cơ bản | OpenAI + Container Apps |

---

## 💰 Nhận thức về Chi phí

| Môi trường | Chi phí ước tính hàng tháng |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Mẹo:** Chạy `azd down` sau khi kiểm thử để tránh phát sinh chi phí.

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 1: Nền tảng](../chapter-01-foundation/README.md) |
| **Tiếp theo** | [Chương 3: Cấu hình](../chapter-03-configuration/README.md) |
| **Nhảy tới** | [Chương 8: Mẫu cho Sản xuất](../chapter-08-production/README.md) |

---

## 📖 Tài nguyên liên quan

- [Khắc phục sự cố AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Thực hành AI cho Sản xuất](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn có thẩm quyền. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu nhầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->