<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a87eaee8309cd74837981fdc6834dd9",
  "translation_date": "2025-09-24T23:31:40+00:00",
  "source_file": "workshop/docs/index.md",
  "language_code": "vi"
}
-->
# AZD cho Hội thảo Nhà phát triển AI

> [!IMPORTANT]  
> **Hội thảo này được trang bị hướng dẫn mà bạn có thể xem trước trên trình duyệt của mình. Để bắt đầu, bạn cần khởi chạy GitHub Codespaces trên repo—sau đó chờ đến khi thấy một terminal VS Code đang hoạt động và nhập:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Bạn sẽ thấy một hộp thoại bật lên để mở trang xem trước trên trình duyệt.**

Chào mừng bạn đến với hội thảo thực hành để học Azure Developer CLI (AZD) với trọng tâm là triển khai ứng dụng AI. Hội thảo này giúp bạn hiểu rõ cách sử dụng các mẫu AZD qua 3 bước:

1. **Khám phá** - tìm mẫu phù hợp với bạn.
1. **Triển khai** - triển khai và xác nhận rằng nó hoạt động.
1. **Tùy chỉnh** - chỉnh sửa và lặp lại để làm cho nó phù hợp với bạn!

Trong suốt hội thảo này, bạn cũng sẽ được giới thiệu các công cụ và quy trình làm việc cốt lõi dành cho nhà phát triển, giúp bạn tối ưu hóa hành trình phát triển từ đầu đến cuối.

| | | 
|:---|:---|
| **📚 Trang chủ khóa học**| [AZD Cho Người Mới Bắt Đầu](../README.md)|
| **📖 Tài liệu** | [Bắt đầu với các mẫu AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Mẫu AI** | [Mẫu Azure AI Foundry](https://ai.azure.com/templates) |
|**🚀 Bước Tiếp Theo** | [Thử Thách Hội Thảo](../../../../workshop/docs) |
| | |

## Tổng Quan Hội Thảo

**Thời lượng:** 3-4 giờ  
**Cấp độ:** Người mới bắt đầu đến trung cấp  
**Yêu cầu:** Hiểu biết cơ bản về Azure, các khái niệm AI, VS Code & công cụ dòng lệnh.

Đây là một hội thảo thực hành nơi bạn học bằng cách làm. Sau khi hoàn thành các bài tập, chúng tôi khuyến nghị bạn xem lại chương trình AZD Cho Người Mới Bắt Đầu để tiếp tục học về các thực hành tốt nhất liên quan đến bảo mật và năng suất.

| Thời gian| Module  | Mục tiêu |
|:---|:---|:---|
| 15 phút | Giới thiệu | Đặt nền tảng, hiểu mục tiêu |
| 30 phút | Chọn Mẫu AI | Khám phá các tùy chọn và chọn mẫu khởi đầu | 
| 30 phút | Xác nhận Mẫu AI | Triển khai giải pháp mặc định lên Azure |
| 30 phút | Phân tích Mẫu AI | Khám phá cấu trúc và cấu hình |
| 30 phút | Cấu hình Mẫu AI | Kích hoạt và thử các tính năng có sẵn |
| 30 phút | Tùy chỉnh Mẫu AI | Điều chỉnh mẫu theo nhu cầu của bạn |
| 30 phút | Gỡ bỏ Hạ tầng | Dọn dẹp và giải phóng tài nguyên |
| 15 phút | Kết thúc & Bước Tiếp Theo | Tài nguyên học tập, Thử thách hội thảo |
| | |

## Những Gì Bạn Sẽ Học

Hãy coi Mẫu AZD như một hộp cát học tập để khám phá các khả năng và công cụ khác nhau cho phát triển từ đầu đến cuối trên Azure AI Foundry. Sau hội thảo này, bạn sẽ có cảm giác trực quan về các công cụ và khái niệm trong ngữ cảnh này.

| Khái niệm  | Mục tiêu |
|:---|:---|
| **Azure Developer CLI** | Hiểu các lệnh và quy trình làm việc của công cụ|
| **Mẫu AZD**| Hiểu cấu trúc dự án và cấu hình|
| **Azure AI Agent**| Cung cấp & triển khai dự án Azure AI Foundry  |
| **Azure AI Search**| Kích hoạt kỹ thuật ngữ cảnh với các agent |
| **Khả năng quan sát**| Khám phá theo dõi, giám sát và đánh giá |
| **Kiểm tra Đối kháng**| Khám phá kiểm tra đối kháng và các biện pháp giảm thiểu |
| | |

## Các Module Hội Thảo

Sẵn sàng bắt đầu chưa? Điều hướng qua các module hội thảo:

- [Module 1: Chọn Mẫu AI](instructions/1-Select-AI-Template.md)
- [Module 2: Xác nhận Mẫu AI](instructions/2-Validate-AI-Template.md) 
- [Module 3: Phân tích Mẫu AI](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: Cấu hình Mẫu AI](instructions/4-Configure-AI-Template.md)
- [Module 5: Tùy chỉnh Mẫu AI](instructions/5-Customize-AI-Template.md)
- [Module 6: Gỡ bỏ Hạ tầng](instructions/6-Teardown-Infrastructure.md)
- [Module 7: Kết thúc & Bước Tiếp Theo](instructions/7-Wrap-up.md)

## Có phản hồi?

Đăng một vấn đề trên repo này (gắn thẻ `Workshop`) hoặc tham gia với chúng tôi trên [Discord](https://aka.ms/foundry/discord) và đăng lên kênh `#get-help` của chúng tôi.

---

