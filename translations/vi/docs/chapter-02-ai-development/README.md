# Chương 2: Phát Triển Ưu Tiên AI

**📚 Khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md) | **⏱️ Thời lượng**: 4-5 giờ bao gồm cả hội thảo | **⭐ Độ khó**: Trung cấp

---

## Tổng quan

Chương này tập trung vào việc triển khai các ứng dụng AI sử dụng Azure Developer CLI và các dịch vụ Microsoft Foundry. Từ các ứng dụng trò chuyện AI đơn giản đến các đại lý thông minh với các công cụ.

> **Đánh giá phát hành (2026-11-04):** Hướng dẫn AI CLI đã được kiểm tra đối chiếu với tài liệu/nguồn `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, và `azure.ai.evaluations` `1.0.0-beta.2`. Sử dụng `azd >= 1.37.0` cho quy trình làm việc kết hợp. Các đánh giá hiện sử dụng namespace `azd ai eval` riêng biệt; xem [thay đổi phát hành và hướng dẫn di trú](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Đây không phải là xác nhận triển khai trực tiếp.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Triển khai các ứng dụng AI sử dụng các mẫu AZD có sẵn 
- Hiểu cách tích hợp Microsoft Foundry với AZD
- Cấu hình và tùy chỉnh các đại lý AI với công cụ
- Triển khai các ứng dụng RAG (Tạo nội dung tăng cường truy xuất)

---

## 📚 Bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Tích hợp Microsoft Foundry](microsoft-foundry-integration.md) | Kết nối AZD với dịch vụ Foundry | 30 phút |
| 2 | [Hướng dẫn đại lý AI](agents.md) | Triển khai đại lý thông minh với công cụ | 45 phút |
| 3 | [Triển khai mô hình AI](ai-model-deployment.md) | Triển khai và cấu hình mô hình AI | 30 phút |
| 4 | [Hội thảo AI](ai-workshop-lab.md) | Thực hành: Khám phá mẫu và lập kế hoạch chuyển đổi | 2-3 giờ |

---

## 🚀 Bắt Đầu Nhanh

Chọn một tùy chọn trong thư mục mới trống. `.` ở cuối sẽ khởi tạo thư mục hiện tại; nếu không thì AZD có thể tạo một thư mục con mà không thay đổi thư mục làm việc của shell của bạn.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Mẫu AI tiêu biểu

| Mẫu | Mô tả | Dịch vụ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Trò chuyện RAG có dẫn nguồn | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Đại lý AI với công cụ | Dịch vụ Đại lý AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Trò chuyện AI cơ bản | OpenAI + Container Apps |

---

## 💰 Nhận thức về chi phí

Đây là các phạm vi minh họa, không phải báo giá hoặc giới hạn; lưu lượng mô hình, SKU tìm kiếm/tính toán, khu vực, và các tính năng tùy chọn có thể vượt quá phạm vi này. Xem lại hướng dẫn định giá hiện tại của mẫu bạn chọn trước khi cấp phát.

| Môi trường | Chi phí ước tính hàng tháng |
|-------------|----------------------|
| Phát triển | $80-150 |
| Kiểm thử | $150-300 |
| Sản xuất | $300-3,500+ |

**Mẹo:** Chạy `azd down` sau khi thử nghiệm để tránh bị tính phí.

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 1: Nền tảng](../chapter-01-foundation/README.md) |
| **Tiếp theo** | [Chương 3: Cấu hình](../chapter-03-configuration/README.md) |
| **Bỏ qua tới** | [Chương 8: Mẫu sản xuất](../chapter-08-production/README.md) |

---

## 📖 Tài nguyên liên quan

- [Khắc phục sự cố AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Thực tiễn AI sản xuất](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->