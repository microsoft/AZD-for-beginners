# Workshop AZD cho Nhà phát triển AI

> Đã xác minh với `azd 1.25.6` vào tháng 6 năm 2026.

> [!IMPORTANT]  
> **Workshop này được trang bị một hướng dẫn thực hành mà bạn có thể xem trước trong trình duyệt cục bộ của mình. Để bắt đầu, mở repo trong GitHub Codespaces, một dev container, hoặc một bản sao cục bộ với MkDocs đã được cài đặt—sau đó chờ đến khi bạn thấy một terminal VS Code hoạt động và gõ:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Bạn sẽ thấy một hộp thoại bật lên để mở trang xem trước trong trình duyệt.**

Chào mừng bạn đến với buổi workshop thực hành để học Azure Developer CLI (AZD) với trọng tâm là triển khai ứng dụng AI. Buổi workshop này giúp bạn có hiểu biết ứng dụng về các mẫu AZD qua 3 bước:

1. **Khám phá** - tìm mẫu phù hợp với bạn.
1. **Triển khai** - triển khai và xác thực rằng nó hoạt động
1. **Tùy chỉnh** - sửa đổi và lặp để biến nó thành của bạn!

Trong suốt buổi workshop này, bạn cũng sẽ được giới thiệu về các công cụ và quy trình làm việc cốt lõi cho nhà phát triển, giúp bạn tinh giản hành trình phát triển đầu-cuối của mình.

| | | 
|:---|:---|
| **📚 Course Home**| [AZD Dành cho Người Mới](../README.md)|
| **📖 Documentation** | [Bắt đầu với các mẫu AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ Mẫu AI** | [Mẫu Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Bước tiếp theo** | [Tham gia Thử thách](#workshop-challenge) |
| | |

## Tổng quan hội thảo

**Thời lượng:** 3-4 giờ  
**Trình độ:** Từ cơ bản đến trung cấp  
**Yêu cầu tiên quyết:** Quen thuộc với Azure, các khái niệm AI, VS Code & công cụ dòng lệnh.

Đây là một buổi workshop thực hành nơi bạn học thông qua thực hành. Sau khi hoàn thành các bài tập, chúng tôi khuyến nghị bạn xem lại chương trình AZD Dành cho Người Mới để tiếp tục hành trình học tập của mình về các phương pháp hay nhất về Bảo mật và Năng suất.

| Thời gian| Mô-đun  | Mục tiêu |
|:---|:---|:---|
| 15 phút | Giới thiệu | Thiết lập bối cảnh, hiểu các mục tiêu |
| 30 phút | Chọn Mẫu AI | Khám phá các tùy chọn và chọn mẫu khởi đầu | 
| 30 phút | Xác nhận Mẫu AI | Triển khai giải pháp mặc định lên Azure |
| 30 phút | Phân tích Mẫu AI | Khám phá cấu trúc và cấu hình |
| 30 phút | Cấu hình Mẫu AI | Kích hoạt và thử các tính năng có sẵn |
| 30 phút | Tùy chỉnh Mẫu AI | Điều chỉnh mẫu theo nhu cầu của bạn |
| 30 phút | Dỡ bỏ Cơ sở hạ tầng | Dọn dẹp và giải phóng tài nguyên |
| 15 phút | Kết thúc & Bước tiếp theo | Tài nguyên học tập, thử thách hội thảo |
| | |

## Những gì bạn sẽ học

Hãy coi Mẫu AZD như một sandbox học tập để khám phá các khả năng và công cụ khác nhau cho phát triển đầu-cuối trên Microsoft Foundry. Kết thúc buổi workshop, bạn sẽ có cảm nhận trực quan về các công cụ và khái niệm khác nhau trong ngữ cảnh này.

| Khái niệm  | Mục tiêu |
|:---|:---|
| **Azure Developer CLI** | Hiểu các lệnh và luồng công việc của công cụ|
| **AZD Templates**| Hiểu cấu trúc dự án và cấu hình|
| **Azure AI Agent**| Cấp phát & triển khai dự án Microsoft Foundry  |
| **Azure AI Search**| Kích hoạt kỹ thuật ngữ cảnh với các agent |
| **Observability**| Khám phá theo dõi, giám sát và đánh giá |
| **Red Teaming**| Khám phá kiểm thử đối kháng và các biện pháp giảm thiểu |
| | |

## Các mô-đun của hội thảo

Sẵn sàng bắt đầu? Điều hướng qua các mô-đun của hội thảo:

- [Mô-đun 1: Chọn Mẫu AI](instructions/1-Select-AI-Template.md)
- [Mô-đun 2: Xác nhận Mẫu AI](instructions/2-Validate-AI-Template.md) 
- [Mô-đun 3: Phân tích Mẫu AI](instructions/3-Deconstruct-AI-Template.md)
- [Mô-đun 4: Cấu hình Mẫu AI](instructions/4-Configure-AI-Template.md)
- [Mô-đun 5: Tùy chỉnh Mẫu AI](instructions/5-Customize-AI-Template.md)
- [Mô-đun 6: Dỡ bỏ Cơ sở hạ tầng](instructions/6-Teardown-Infrastructure.md)
- [Mô-đun 7: Kết thúc & Bước tiếp theo](instructions/7-Wrap-up.md)

## Bạn có phản hồi?

Đăng một issue trên repo này (gắn thẻ `Workshop`) hoặc tham gia cùng chúng tôi trên [Discord](https://aka.ms/foundry/discord) và đăng lên kênh `#get-help` của chúng tôi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->