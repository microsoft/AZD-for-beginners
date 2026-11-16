# AZD cho Nhà phát triển AI Workshop

> Hướng dẫn nguồn được xem xét theo AZD 1.37.2 vào ngày 4 tháng 11 năm 2026. Ảnh chụp màn hình chỉ mang tính minh họa; tính khả dụng dịch vụ, nhãn cổng thông tin và mặc định mẫu có thể thay đổi.

> [!IMPORTANT]  
> **Workshop này được trang bị hướng dẫn workshop mà bạn có thể xem trước trong trình duyệt cục bộ của mình. Để bắt đầu, mở repo trong GitHub Codespaces, một dev container, hoặc bản sao cục bộ với MkDocs đã cài đặt — sau đó đợi cho đến khi bạn thấy terminal VS Code hoạt động và gõ:**  
> Từ thư mục gốc của khoá học, cài đặt `requirements-dev.txt`, sau đó chạy `python -m mkdocs serve --config-file workshop/mkdocs.yml` ở chế độ tiền cảnh.
> **Bạn sẽ nhìn thấy hộp thoại bật lên để mở trang xem trước trong trình duyệt.**

Chào mừng bạn đến với workshop thực hành để học Azure Developer CLI (AZD) với trọng tâm là triển khai ứng dụng AI. Workshop này giúp bạn có hiểu biết thực tiễn về các mẫu AZD trong 3 bước:

1. **Khám phá** - tìm mẫu phù hợp với bạn.
1. **Triển khai** - triển khai và xác nhận nó hoạt động
1. **Tùy chỉnh** - sửa đổi và lặp lại để biến nó thành của bạn!

Trong suốt khóa học này, bạn cũng sẽ được giới thiệu về các công cụ và quy trình phát triển cốt lõi, giúp bạn tối ưu hóa hành trình phát triển toàn diện.

| | | 
|:---|:---|
| **📚 Trang chủ khóa học**| [AZD Cho Người Mới](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 Tài liệu** | [Bắt đầu với các mẫu AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Mẫu AI** | [Mẫu Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Bước Tiếp Theo** | [Tham gia Thách Thức](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## Tổng quan Workshop

**Thời lượng:** 3-4 giờ  
**Cấp độ:** Người mới đến Trung cấp  
**Tiền đề:** Hiểu biết về Azure, khái niệm AI, VS Code & công cụ dòng lệnh.

Đây là một workshop thực hành nơi bạn học bằng cách làm. Sau khi hoàn thành các bài tập, chúng tôi khuyên bạn nên xem lại chương trình AZD Cho Người Mới để tiếp tục hành trình học về các thực hành tốt nhất về Bảo mật và Năng suất.

| Thời gian| Module  | Mục tiêu |
|:---|:---|:---|
| 15 phút | Giới thiệu | Đặt bối cảnh, hiểu mục tiêu |
| 30 phút | Chọn Mẫu AI | Khám phá lựa chọn và chọn khởi đầu | 
| 30 phút | Xác nhận Mẫu AI | Triển khai giải pháp mặc định lên Azure |
| 30 phút | Phân tích Mẫu AI | Khám phá cấu trúc và cấu hình |
| 30 phút | Cấu hình Mẫu AI | Kích hoạt và thử các tính năng có sẵn |
| 30 phút | Tùy chỉnh Mẫu AI | Điều chỉnh mẫu theo nhu cầu của bạn |
| 30 phút | Dọn dẹp Hạ tầng | Dọn sạch và giải phóng tài nguyên |
| 15 phút | Tổng kết & Bước tiếp theo | Tài nguyên học tập, thách thức Workshop |
| | |

## Bạn Sẽ Học Được Gì

Hãy nghĩ về Mẫu AZD như một hộp cát học tập để khám phá các khả năng và công cụ khác nhau cho phát triển toàn diện trên Microsoft Foundry. Cuối workshop này, bạn nên có cảm nhận trực quan về các công cụ và khái niệm khác nhau trong bối cảnh này.

| Khái niệm  | Mục tiêu |
|:---|:---|
| **Azure Developer CLI** | Hiểu các lệnh công cụ và quy trình làm việc|
| **Mẫu AZD**| Hiểu cấu trúc dự án và cấu hình|
| **Azure AI Agent**| Cấp phát & triển khai dự án Microsoft Foundry  |
| **Azure AI Search**| Kích hoạt kỹ thuật ngữ cảnh với các agent |
| **Khả năng quan sát**| Khám phá truy vết, giám sát và đánh giá |
| **Red Teaming**| Khám phá kiểm thử đối kháng và biện pháp giảm thiểu |
| | |

## Các Module Workshop

Sẵn sàng bắt đầu? Dẫn hướng qua các module workshop:

- [Module 1: Chọn Mẫu AI](instructions/1-Select-AI-Template.md)
- [Module 2: Xác nhận Mẫu AI](instructions/2-Validate-AI-Template.md) 
- [Module 3: Phân tích Mẫu AI](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: Cấu hình Mẫu AI](instructions/4-Configure-AI-Template.md)
- [Module 5: Tùy chỉnh Mẫu AI](instructions/5-Customize-AI-Template.md)
- [Module 6: Dọn dẹp Hạ tầng](instructions/6-Teardown-Infrastructure.md)
- [Module 7: Tổng kết & Bước tiếp theo](instructions/7-Wrap-up.md)

## Có phản hồi?

Đăng một issue trên repo này (gắn thẻ `Workshop`) hoặc tham gia cùng chúng tôi trên [Discord](https://aka.ms/foundry/discord) và đăng bài lên kênh `#get-help` của chúng tôi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->