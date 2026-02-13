# Chương 2: Phát triển lấy AI làm trung tâm

**📚 Khóa học**: [AZD cho Người Mới](../../README.md) | **⏱️ Thời lượng**: 1-2 giờ | **⭐ Trình độ**: Trung cấp

---

## Tổng quan

Chương này tập trung vào triển khai các ứng dụng được hỗ trợ bởi AI bằng Azure Developer CLI và các dịch vụ Microsoft Foundry. Từ các ứng dụng chat AI đơn giản đến các tác nhân thông minh có công cụ.

## Mục tiêu học tập

Hoàn thành chương này, bạn sẽ:
- Triển khai ứng dụng AI bằng các mẫu AZD đã dựng sẵn
- Hiểu tích hợp Microsoft Foundry với AZD
- Cấu hình và tùy chỉnh các tác nhân AI với công cụ
- Triển khai ứng dụng RAG (Retrieval-Augmented Generation)

---

## 📚 Bài học

| # | Bài | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Tích hợp Microsoft Foundry](microsoft-foundry-integration.md) | Kết nối AZD với các dịch vụ Foundry | 30 phút |
| 2 | [Hướng dẫn Tác nhân AI](agents.md) | Triển khai các tác nhân thông minh với công cụ | 45 phút |
| 3 | [Triển khai Mô hình AI](ai-model-deployment.md) | Triển khai và cấu hình các mô hình AI | 30 phút |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Thực hành: Chuẩn bị giải pháp AI của bạn sẵn sàng cho AZD | 60 phút |

---

## 🚀 Bắt đầu nhanh

```bash
# Lựa chọn 1: Ứng dụng trò chuyện RAG
azd init --template azure-search-openai-demo
azd up

# Lựa chọn 2: Tác nhân AI
azd init --template get-started-with-ai-agents
azd up

# Lựa chọn 3: Ứng dụng chat nhanh
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Mẫu AI nổi bật

| Template | Mô tả | Dịch vụ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Trò chuyện RAG kèm trích dẫn | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Tác nhân AI với công cụ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Trò chuyện AI cơ bản | OpenAI + Container Apps |

---

## 💰 Nhận thức về chi phí

| Môi trường | Chi phí hàng tháng ước tính |
|-------------|----------------------|
| Phát triển | $80-150 |
| Staging | $150-300 |
| Sản xuất | $300-3,500+ |

**Mẹo:** Chạy `azd down` sau khi thử nghiệm để tránh phát sinh phí.

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 1: Nền tảng](../chapter-01-foundation/README.md) |
| **Tiếp theo** | [Chương 3: Cấu hình](../chapter-03-configuration/README.md) |
| **Đi tới** | [Chương 8: Mẫu sản xuất](../chapter-08-production/README.md) |

---

## 📖 Tài nguyên liên quan

- [Khắc phục sự cố AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Thực hành AI cho môi trường sản xuất](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ ban đầu nên được coi là nguồn chính thức. Đối với các thông tin quan trọng, nên sử dụng bản dịch chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->