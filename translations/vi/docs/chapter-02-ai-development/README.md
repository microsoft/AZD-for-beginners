# Chương 2: Phát Triển AI-First

**📚 Khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md) | **⏱️ Thời lượng**: 4-5 giờ bao gồm cả hội thảo | **⭐ Độ phức tạp**: Trung cấp

---

## Tổng quan

Chương này tập trung vào việc triển khai các ứng dụng sử dụng AI bằng cách sử dụng Azure Developer CLI và dịch vụ Microsoft Foundry. Từ các ứng dụng trò chuyện AI đơn giản đến các tác nhân thông minh với công cụ hỗ trợ.

> **Cập nhật Foundry GA (2026-11-09):** Bộ `microsoft.foundry` 1.0 đã [phát hành chính thức](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Sử dụng `azd >= 1.37.0`; các bản đánh giá vẫn là một phần cài đặt riêng biệt. Bản hướng dẫn [tác nhân được lưu trữ](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) bao gồm thử nghiệm Agent Inspector cục bộ và triển khai mã từ xa. Đây là xem lại tài liệu, không phải kiểm tra triển khai trực tiếp; các tính năng xem trước có thể tùy chọn vẫn giữ trạng thái riêng của chúng.

## Mục tiêu học tập

Sau khi hoàn thành chương này, bạn sẽ:
- Triển khai ứng dụng AI bằng các mẫu AZD có sẵn
- Hiểu cách tích hợp Microsoft Foundry với AZD
- Cài đặt bộ GA và thử nghiệm tác nhân được lưu trữ cục bộ trước khi triển khai nguồn lên Foundry
- Xem xét `azure.yaml`, tài sản đánh giá, và dọn dẹp dự án mới so với tái sử dụng
- Cấu hình và tùy chỉnh tác nhân AI với các công cụ
- Triển khai các ứng dụng RAG (Tạo nội dung hỗ trợ truy xuất)

---

## 📚 Các bài học

| # | Bài học | Mô tả | Thời gian |
|---|--------|-------------|------|
| 1 | [Tích hợp Microsoft Foundry](microsoft-foundry-integration.md) | Bộ GA, quy trình tác nhân lưu trữ từ cục bộ lên đám mây, và đánh giá | 60 phút |
| 2 | [Hướng dẫn Tác nhân AI](agents.md) | Triển khai các tác nhân thông minh với công cụ | 45 phút |
| 3 | [Triển khai Mô hình AI](ai-model-deployment.md) | Triển khai và cấu hình mô hình AI | 30 phút |
| 4 | [Xưởng thực hành AI](ai-workshop-lab.md) | Thực hành: Khám phá mẫu và lên kế hoạch chuyển đổi | 2-3 giờ |

---

## 🚀 Bắt đầu nhanh

Chọn một lựa chọn trong một thư mục trống mới. `.` ở cuối sẽ khởi tạo thư mục hiện tại; nếu không, AZD có thể tạo một thư mục con mà không thay đổi thư mục làm việc của shell bạn.

Đối với **đường dẫn triển khai mã tác nhân lưu trữ GA**, hãy bắt đầu với [hướng dẫn có hướng dẫn](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Nó yêu cầu AZD 1.37.0+, uv hiện tại, Python 3.13+, quyền Foundry và hạn ngạch mô hình. Các mẫu ứng dụng đầy đủ dưới đây là các lựa chọn thay thế, không phải điều kiện tiên quyết của hướng dẫn đó.

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

## 🤖 Mẫu AI Nổi bật

| Mẫu | Mô tả | Dịch vụ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG có trích dẫn | OpenAI + Tìm kiếm AI |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Tác nhân AI với công cụ | Dịch vụ Tác nhân AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI cơ bản | OpenAI + Container Apps |

---

## 💰 Nhận thức về chi phí

Đây là các phạm vi minh họa, không phải báo giá hay giới hạn; lưu lượng mô hình, SKU tìm kiếm/tính toán, vùng miền, và các tính năng tùy chọn có thể vượt quá chúng. Xem lại hướng dẫn giá hiện tại của mẫu bạn chọn trước khi cung cấp tài nguyên.

| Môi trường | Chi phí ước tính hàng tháng |
|-------------|----------------------|
| Phát triển | $80-150 |
| Kiểm thử | $150-300 |
| Sản xuất | $300-3,500+ |

**Dọn dẹp:** Xem lại `azd down` trước khi xác nhận: với dự án Foundry mới tạo, nó sẽ xóa nhóm tài nguyên và tất cả mọi thứ trong đó. Với dự án Foundry tái sử dụng, nó giữ lại dự án và tài nguyên tác nhân; làm theo [hướng dẫn dọn dẹp theo hướng dẫn](microsoft-foundry-integration.md#7-clean-up-deliberately) để xóa các tài nguyên không mong muốn riêng biệt.

---

## 🔗 Điều hướng

| Hướng | Chương |
|-----------|---------|
| **Trước** | [Chương 1: Nền tảng](../chapter-01-foundation/README.md) |
| **Tiếp theo** | [Chương 3: Cấu hình](../chapter-03-configuration/README.md) |
| **Bỏ qua đến** | [Chương 8: Mẫu Sản xuất](../chapter-08-production/README.md) |

---

## 📖 Tài nguyên liên quan

- [Khắc phục sự cố AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Thực hành AI Sản xuất](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->