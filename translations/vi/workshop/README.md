<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 Workshop AZD cho Nhà phát triển AI
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Một workshop thực hành để xây dựng ứng dụng AI với Azure Developer CLI.</strong><br>
      Hoàn thành 7 mô-đun để thành thạo các mẫu AZD và quy trình triển khai AI.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Cập nhật lần cuối: Tháng 3 2026
      </span>
    </div>
  </div>
</div>

# Workshop AZD cho Nhà phát triển AI

Chào mừng đến với workshop thực hành để học Azure Developer CLI (AZD) với trọng tâm là triển khai ứng dụng AI. Workshop này giúp bạn có hiểu biết thực tế về các mẫu AZD trong 3 bước:

1. **Khám phá** - tìm mẫu phù hợp với bạn.
1. **Triển khai** - triển khai và xác thực rằng nó hoạt động
1. **Tùy chỉnh** - chỉnh sửa và lặp để biến nó thành của bạn!

Trong suốt quá trình workshop, bạn cũng sẽ được giới thiệu các công cụ và quy trình làm việc cốt lõi dành cho nhà phát triển, giúp bạn hợp lý hóa hành trình phát triển từ đầu đến cuối.

<br/>

## Hướng dẫn trên trình duyệt

Các bài học trong workshop ở định dạng Markdown. Bạn có thể điều hướng trực tiếp trên GitHub - hoặc khởi chạy bản xem trước trên trình duyệt như hiển thị trong ảnh chụp màn hình bên dưới.

![Hội thảo](../../../translated_images/vi/workshop.75906f133e6f8ba0.webp)

Để sử dụng tùy chọn này - fork repository vào hồ sơ của bạn, rồi khởi chạy GitHub Codespaces. Khi terminal của VS Code đã hoạt động, gõ lệnh sau:

This browser preview works in GitHub Codespaces, dev containers, or a local clone with Python and MkDocs installed.

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Trong vài giây, bạn sẽ thấy một hộp thoại bật lên. Chọn tùy chọn `Mở trong trình duyệt`. Hướng dẫn trên web sẽ mở trong một tab trình duyệt mới. Một số lợi ích của bản xem trước này:

1. **Tìm kiếm tích hợp** - tìm từ khóa hoặc bài học nhanh chóng.
1. **Biểu tượng sao chép** - di chuột qua các khối mã để thấy tùy chọn này
1. **Chuyển đổi giao diện** - chuyển đổi giữa chủ đề tối và sáng
1. **Nhận trợ giúp** - nhấp vào biểu tượng Discord trong footer để tham gia!

<br/>

## Tổng quan về Workshop

**Thời lượng:** 3-4 giờ  
**Trình độ:** Người mới đến Trung cấp  
**Yêu cầu trước:** Quen thuộc với Azure, khái niệm AI, VS Code & công cụ dòng lệnh.

Đây là một workshop thực hành nơi bạn học thông qua làm. Khi bạn hoàn thành các bài tập, chúng tôi khuyên bạn xem lại chương trình AZD For Beginners để tiếp tục hành trình học của mình về các thực hành tốt nhất liên quan đến Bảo mật và Năng suất.

| Thời gian| Mô-đun  | Mục tiêu |
|:---|:---|:---|
| 15 phút | [Giới thiệu](docs/instructions/0-Introduction.md) | Đặt nền tảng, hiểu các mục tiêu |
| 30 phút | [Chọn Mẫu AI](docs/instructions/1-Select-AI-Template.md) | Khám phá lựa chọn và chọn mẫu khởi đầu | 
| 30 phút | [Xác thực Mẫu AI](docs/instructions/2-Validate-AI-Template.md) | Triển khai giải pháp mặc định lên Azure |
| 30 phút | [Phân tích Mẫu AI](docs/instructions/3-Deconstruct-AI-Template.md) | Khám phá cấu trúc và cấu hình |
| 30 phút | [Cấu hình Mẫu AI](docs/instructions/4-Configure-AI-Template.md) | Kích hoạt và thử các tính năng có sẵn |
| 30 phút | [Tùy chỉnh Mẫu AI](docs/instructions/5-Customize-AI-Template.md) | Điều chỉnh mẫu theo nhu cầu của bạn |
| 30 phút | [Gỡ bỏ Hạ tầng](docs/instructions/6-Teardown-Infrastructure.md) | Dọn dẹp và giải phóng tài nguyên |
| 15 phút | [Kết thúc & Bước tiếp theo](docs/instructions/7-Wrap-up.md) | Tài nguyên học tập, Thử thách Workshop |

<br/>

## Bạn sẽ học gì

Hãy coi Mẫu AZD như một sandbox học tập để khám phá các khả năng và công cụ khác nhau cho phát triển end-to-end trên Microsoft Foundry. Đến cuối workshop này, bạn sẽ có cảm nhận trực quan về các công cụ và khái niệm khác nhau trong ngữ cảnh này.

| Khái niệm  | Mục tiêu |
|:---|:---|
| **Azure Developer CLI** | Hiểu các lệnh công cụ và quy trình làm việc |
| **AZD Templates**| Hiểu cấu trúc dự án và cấu hình |
| **Azure AI Agent**| Cấp phát & triển khai dự án Microsoft Foundry |
| **Azure AI Search**| Hỗ trợ kỹ thuật bối cảnh với các tác nhân |
| **Observability**| Khám phá tracing, giám sát và đánh giá |
| **Red Teaming**| Khám phá kiểm thử đối kháng và các biện pháp giảm thiểu |

<br/>

## Cấu trúc Workshop

Workshop được cấu trúc để đưa bạn từ việc khám phá mẫu, đến triển khai, phân tích cấu trúc và tùy chỉnh - sử dụng mẫu khởi động chính thức [Bắt đầu với AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) làm cơ sở.

### [Mô-đun 1: Chọn Mẫu AI](docs/instructions/1-Select-AI-Template.md) (30 phút)

- Mẫu AI là gì?
- Tôi có thể tìm Mẫu AI ở đâu?
- Làm thế nào để bắt đầu xây dựng AI Agents?
- **Lab**: Khởi động nhanh trong Codespaces hoặc dev container

### [Mô-đun 2: Xác thực Mẫu AI](docs/instructions/2-Validate-AI-Template.md) (30 phút)

- Kiến trúc Mẫu AI là gì?
- Quy trình phát triển AZD là gì?
- Làm thế nào để nhận trợ giúp với phát triển AZD?
- **Lab**: Triển khai & Xác thực mẫu AI Agents

### [Mô-đun 3: Phân tích Mẫu AI](docs/instructions/3-Deconstruct-AI-Template.md) (30 phút)

- Khám phá môi trường của bạn trong `.azure/` 
- Khám phá thiết lập tài nguyên của bạn trong `infra/` 
- Khám phá cấu hình AZD của bạn trong `azure.yaml`s
- **Lab**: Chỉnh sửa Biến Môi trường & Triển khai lại

### [Mô-đun 4: Cấu hình Mẫu AI](docs/instructions/4-Configure-AI-Template.md) (30 phút)
- Khám phá: Retrieval Augmented Generation
- Khám phá: Đánh giá Agent & Red Teaming
- Khám phá: Tracing & Giám sát
- **Lab**: Khám phá AI Agent + Observability 

### [Mô-đun 5: Tùy chỉnh Mẫu AI](docs/instructions/5-Customize-AI-Template.md) (30 phút)
- Xác định: PRD với Yêu cầu Kịch bản
- Cấu hình: Biến Môi trường cho AZD
- Triển khai: Hooks vòng đời cho các tác vụ bổ sung
- **Lab**: Tùy chỉnh mẫu cho kịch bản của tôi

### [Mô-đun 6: Gỡ bỏ Hạ tầng](docs/instructions/6-Teardown-Infrastructure.md) (30 phút)
- Tóm tắt: Mẫu AZD là gì?
- Tóm tắt: Tại sao dùng Azure Developer CLI?
- Bước tiếp theo: Thử một mẫu khác!
- **Lab**: Gỡ cấp phát hạ tầng & dọn dẹp

<br/>

## Thử thách Workshop

Muốn thử thách bản thân làm nhiều hơn? Dưới đây là một số gợi ý dự án - hoặc chia sẻ ý tưởng của bạn với chúng tôi!!

| Project | Description |
|:---|:---|
|1. **Phân tích Một Mẫu AI Phức tạp** | Sử dụng quy trình làm việc và công cụ chúng ta đã mô tả và xem liệu bạn có thể triển khai, xác thực và tùy chỉnh một mẫu giải pháp AI khác. _Bạn đã học được gì?_|
|2. **Tùy chỉnh Theo Kịch bản của Bạn**  | Thử viết một PRD (Product Requirements Document) cho một kịch bản khác. Sau đó sử dụng GitHub Copilot trong repo mẫu của bạn ở Agent Model - và yêu cầu nó tạo một quy trình tùy chỉnh cho bạn. _Bạn đã học được gì? Bạn có thể cải thiện những gợi ý này như thế nào?_|
| | |

## Có phản hồi?

1. Đăng một issue trên repo này - gắn thẻ `Workshop` cho tiện.
1. Tham gia Microsoft Foundry Discord - kết nối với các đồng nghiệp của bạn!


| | | 
|:---|:---|
| **📚 Trang khóa học**| [AZD For Beginners](../README.md)|
| **📖 Tài liệu** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Mẫu AI** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Bước tiếp theo** | [Begin Workshop](#tổng-quan-về-workshop) |
| | |

<br/>

---

**Điều hướng:** [Khóa học chính](../README.md) | [Giới thiệu](docs/instructions/0-Introduction.md) | [Mô-đun 1: Chọn Mẫu](docs/instructions/1-Select-AI-Template.md)

**Sẵn sàng bắt đầu xây dựng ứng dụng AI với AZD?**

[Bắt đầu Workshop: Giới thiệu →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ ban đầu của nó nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->