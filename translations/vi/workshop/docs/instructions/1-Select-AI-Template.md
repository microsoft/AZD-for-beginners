# 1. Chọn một Mẫu

!!! tip "ĐẾN CUỐI MODULE NÀY BẠN SẼ CÓ THỂ"

    - [ ] Mô tả mẫu AZD là gì
    - [ ] Khám phá và sử dụng mẫu AZD cho AI
    - [ ] Bắt đầu với mẫu AI Agents
    - [ ] **Bài Lab 1:** AZD Quickstart với GitHub Codespaces

---

## 1. Phép ẩn dụ về người xây dựng

Xây dựng một ứng dụng AI hiện đại sẵn sàng cho doanh nghiệp _từ đầu_ có thể là điều đáng sợ. Nó hơi giống như tự mình xây ngôi nhà mới, viên gạch này đến viên gạch kia. Vâng, điều đó có thể làm được! Nhưng đó không phải là cách hiệu quả nhất để đạt được kết quả mong muốn!

Thay vào đó, chúng ta thường bắt đầu với một _bản thiết kế_ có sẵn, và làm việc với một kiến trúc sư để tùy chỉnh nó theo yêu cầu cá nhân. Và đó chính xác là cách tiếp cận nên áp dụng khi xây dựng các ứng dụng thông minh. Trước tiên, tìm một kiến trúc thiết kế phù hợp với không gian vấn đề của bạn. Sau đó làm việc với một kiến trúc sư giải pháp để tùy chỉnh và phát triển giải pháp cho kịch bản cụ thể của bạn.

Nhưng chúng ta có thể tìm những bản thiết kế này ở đâu? Và làm thế nào để tìm một kiến trúc sư sẵn sàng dạy chúng ta cách tùy chỉnh và triển khai những bản thiết kế này? Trong workshop này, chúng tôi trả lời những câu hỏi đó bằng cách giới thiệu cho bạn ba công nghệ:

1. [Azure Developer CLI](https://aka.ms/azd) - một công cụ mã nguồn mở giúp tăng tốc lộ trình từ phát triển cục bộ (build) đến triển khai lên đám mây (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - các kho mã nguồn mở chuẩn hóa chứa mã mẫu, cơ sở hạ tầng và tệp cấu hình để triển khai một kiến trúc giải pháp AI.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - một tác nhân hỗ trợ lập mã được nền tảng hóa trong kiến thức Azure, có thể hướng dẫn chúng ta điều hướng mã nguồn và thực hiện thay đổi bằng ngôn ngữ tự nhiên.

Với các công cụ này trong tay, giờ chúng ta có thể _khám phá_ mẫu phù hợp, _triển khai_ nó để xác thực hoạt động, và _tùy chỉnh_ nó cho các kịch bản cụ thể của mình. Hãy cùng tìm hiểu cách chúng hoạt động.

---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) là một công cụ dòng lệnh mã nguồn mở có thể đẩy nhanh hành trình từ mã đến đám mây của bạn với một loạt lệnh thân thiện với nhà phát triển hoạt động nhất quán trên IDE (phát triển) và môi trường CI/CD (devops).

Với `azd`, hành trình triển khai của bạn có thể đơn giản như:

- `azd init` - Khởi tạo một dự án AI mới từ một mẫu AZD có sẵn.
- `azd up` - Cung cấp cơ sở hạ tầng và triển khai ứng dụng của bạn trong một bước.
- `azd monitor` - Nhận giám sát và chẩn đoán theo thời gian thực cho ứng dụng đã triển khai.
- `azd pipeline config` - Thiết lập các pipeline CI/CD để tự động hóa triển khai lên Azure.

**🎯 | BÀI TẬP**: <br/> Khám phá công cụ dòng lệnh `azd` trong môi trường GitHub Codespaces của bạn ngay bây giờ. Bắt đầu bằng cách gõ lệnh này để xem công cụ có thể làm gì:

```bash title="" linenums="0"
azd help
```

![Luồng](../../../../../translated_images/vi/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Mẫu AZD

Để `azd` thực hiện điều này, nó cần biết cơ sở hạ tầng để cung cấp, các cài đặt cấu hình cần áp dụng, và ứng dụng cần triển khai. Đây là nơi [mẫu AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) phát huy tác dụng.

Mẫu AZD là các kho mã nguồn mở kết hợp mã mẫu với các tệp cơ sở hạ tầng và cấu hình cần thiết để triển khai kiến trúc giải pháp.
Bằng cách sử dụng phương pháp _Infrastructure-as-Code_ (IaC), chúng cho phép định nghĩa tài nguyên của mẫu và các cài đặt cấu hình được quản lý bởi hệ thống kiểm soát phiên bản (giống như mã nguồn ứng dụng) - tạo ra các luồng công việc có thể tái sử dụng và nhất quán giữa những người dùng của dự án đó.

Khi tạo hoặc tái sử dụng một mẫu AZD cho kịch bản _của bạn_, hãy cân nhắc những câu hỏi sau:

1. Bạn đang xây dựng gì? → Có mẫu nào có mã khởi tạo cho kịch bản đó không?
1. Giải pháp của bạn được kiến trúc như thế nào? → Có mẫu nào có các tài nguyên cần thiết không?
1. Giải pháp của bạn được triển khai như thế nào? → Nghĩ đến `azd deploy` với các hook tiền/ hậu xử lý!
1. Bạn có thể tối ưu hóa nó hơn nữa như thế nào? → Nghĩ đến giám sát tích hợp và các pipeline tự động!

**🎯 | BÀI TẬP**: <br/> 
Truy cập [Awesome AZD](https://azure.github.io/awesome-azd/) gallery và sử dụng bộ lọc để khám phá hơn 250 mẫu hiện có. Xem liệu bạn có thể tìm được cái nào phù hợp với yêu cầu kịch bản _của bạn_ hay không.

![Mã](../../../../../translated_images/vi/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Mẫu Ứng dụng AI

Đối với các ứng dụng được hỗ trợ bởi AI, Microsoft cung cấp các mẫu chuyên biệt có **Microsoft Foundry** và **Foundry Agents**. Những mẫu này tăng tốc con đường xây dựng các ứng dụng thông minh, sẵn sàng cho môi trường sản xuất.

### Microsoft Foundry & Foundry Agents Templates

Chọn một mẫu bên dưới để triển khai. Mỗi mẫu có sẵn trên [Awesome AZD](https://azure.github.io/awesome-azd/) và có thể được khởi tạo chỉ với một lệnh.

| Template | Description | Deploy Command |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Ứng dụng chat với Retrieval Augmented Generation sử dụng Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Xây dựng các agent AI với Foundry Agents để thực hiện tác vụ tự động | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Điều phối nhiều Foundry Agents cho các luồng công việc phức tạp | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Trích xuất và phân tích tài liệu với các mô hình Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Xây dựng chatbot thông minh tích hợp Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Tạo ảnh sử dụng DALL-E qua Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Các agent AI sử dụng Semantic Kernel với Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Hệ thống đa-agent sử dụng framework AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Bắt đầu Nhanh

1. **Duyệt mẫu**: Truy cập [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) và lọc theo `AI`, `Agents`, hoặc `Microsoft Foundry`
2. **Chọn mẫu**: Chọn một mẫu phù hợp với trường hợp sử dụng của bạn
3. **Khởi tạo**: Chạy lệnh `azd init` cho mẫu bạn chọn
4. **Triển khai**: Chạy `azd up` để cung cấp cơ sở hạ tầng và triển khai

**🎯 | BÀI TẬP**: <br/>
Chọn một trong các mẫu ở trên dựa trên kịch bản của bạn:

- **Đang xây dựng chatbot?** → Bắt đầu với **AI Chat with RAG** hoặc **Conversational AI Bot**
- **Cần các agent tự hành?** → Thử **Foundry Agent Service Starter** hoặc **Multi-Agent Orchestration**
- **Xử lý tài liệu?** → Sử dụng **AI Document Intelligence**
- **Muốn trợ giúp viết mã bằng AI?** → Khám phá **Semantic Kernel Agent** hoặc **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "KHÁM PHÁ THÊM MẪU"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) chứa hơn 250 mẫu. Sử dụng bộ lọc để tìm các mẫu phù hợp với yêu cầu cụ thể của bạn về ngôn ngữ, framework và các dịch vụ Azure.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn tham chiếu chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->