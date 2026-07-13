# 2. Xác thực một Mẫu

> Đã xác thực với `azd 1.27.1` vào tháng 7 năm 2026.

!!! tip "VỀ CUỐI MODULE NÀY BẠN SẼ CÓ THỂ"

    - [ ] Phân tích Kiến trúc Giải pháp AI
    - [ ] Hiểu Quy trình Triển khai AZD
    - [ ] Sử dụng GitHub Copilot để được trợ giúp về cách dùng AZD
    - [ ] **Bài tập 2:** Triển khai & Xác thực mẫu AI Agents

---


## 1. Giới thiệu

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) hay `azd` là công cụ dòng lệnh mã nguồn mở giúp tối ưu hóa quy trình làm việc của nhà phát triển khi xây dựng và triển khai ứng dụng lên Azure.

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) là các kho chuẩn hóa bao gồm mã ứng dụng mẫu, tài sản _hạ tầng như mã_, và các file cấu hình `azd` cho một kiến trúc giải pháp thống nhất. Việc cấp phát hạ tầng trở nên đơn giản chỉ với lệnh `azd provision` – và lệnh `azd up` cho phép bạn vừa cấp phát hạ tầng **vừa** triển khai ứng dụng chỉ với một bước!

Do đó, khởi đầu cho quá trình phát triển ứng dụng của bạn có thể chỉ là tìm một _mẫu AZD Starter_ phù hợp nhất với yêu cầu ứng dụng và hạ tầng của bạn – sau đó tùy chỉnh kho cho phù hợp với kịch bản của bạn.

Trước khi bắt đầu, hãy chắc chắn rằng bạn đã cài đặt Azure Developer CLI.

1. Mở terminal trong VS Code và gõ lệnh sau:

      ```bash title="" linenums="0"
      azd version
      ```

1. Bạn sẽ thấy kết quả như sau!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Bạn đã sẵn sàng chọn và triển khai một mẫu với azd**

---

## 2. Lựa chọn Mẫu

Nền tảng Microsoft Foundry đi kèm với [bộ mẫu AZD được đề xuất](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) bao phủ các kịch bản giải pháp phổ biến như _tự động hóa quy trình đa tác nhân_ và _xử lý nội dung đa phương tiện_. Bạn cũng có thể khám phá các mẫu này qua trang Microsoft Foundry portal.

1. Truy cập [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Đăng nhập vào portal Microsoft Foundry khi được yêu cầu – bạn sẽ thấy giao diện như bên dưới.

![Pick](../../../../../translated_images/vi/01-pick-template.60d2d5fff5ebc374.webp)


Các tuỳ chọn **Basic** là mẫu khởi đầu của bạn:

1. [ ] [Bắt đầu với AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) triển khai ứng dụng chat cơ bản _với dữ liệu của bạn_ lên Azure Container Apps. Dùng để khám phá kịch bản chatbot AI cơ bản.
1. [X] [Bắt đầu với AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) triển khai một AI Agent chuẩn (với các Foundry Agents). Dùng để làm quen với giải pháp AI theo dạng agent có sử dụng công cụ và mô hình.

Mở liên kết thứ hai ở tab trình duyệt mới (hoặc nhấn `Open in GitHub` trên thẻ liên quan). Bạn sẽ thấy kho mẫu AZD này. Dành vài phút khám phá README. Kiến trúc ứng dụng trông như sau:

![Arch](../../../../../translated_images/vi/architecture.8cec470ec15c65c7.webp)

---

## 3. Kích hoạt Mẫu

Hãy thử triển khai mẫu này và xác thực rằng nó hợp lệ. Chúng ta sẽ theo hướng dẫn trong phần [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Chọn môi trường làm việc cho kho mẫu:

      - **GitHub Codespaces**: Nhấp [liên kết này](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) và xác nhận `Create codespace`
      - **Bản clone local hoặc container phát triển**: Clone `Azure-Samples/get-started-with-ai-agents` rồi mở trong VS Code

1. Chờ terminal VS Code sẵn sàng, rồi gõ lệnh sau:

   ```bash title="" linenums="0"
   azd up
   ```

Hoàn thành các bước trong quy trình làm việc mà lệnh này kích hoạt:

1. Bạn sẽ được nhắc đăng nhập Azure – làm theo hướng dẫn để xác thực
1. Nhập tên môi trường duy nhất cho bạn – ví dụ, tôi dùng `nitya-mshack-azd`
1. Lệnh này sẽ tạo thư mục `.azure/` – bạn sẽ thấy thư mục con tên theo môi trường
1. Bạn sẽ được yêu cầu chọn tên subscription – chọn mặc định
1. Bạn sẽ được hỏi vị trí – chọn `East US 2`

Giờ bạn chờ cho việc cấp phát hoàn tất. **Quá trình này mất khoảng 10-15 phút**

1. Khi xong, bảng điều khiển sẽ hiển thị thông báo THÀNH CÔNG như sau:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure Portal của bạn sẽ có nhóm tài nguyên được cấp phát với tên môi trường:

      ![Infra](../../../../../translated_images/vi/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Bạn đã sẵn sàng xác thực hạ tầng và ứng dụng đã được triển khai**.

---

## 4. Xác thực Mẫu

1. Truy cập trang [Resource Groups](https://portal.azure.com/#browse/resourcegroups) Azure Portal – đăng nhập nếu được yêu cầu
1. Nhấp vào RG theo tên môi trường của bạn – bạn sẽ thấy trang như trên

      - nhấp vào Azure Container Apps resource
      - nhấp vào URL ứng dụng trong phần _Essentials_ (góc phải phía trên)

1. Bạn sẽ thấy giao diện front-end ứng dụng host như sau:

   ![App](../../../../../translated_images/vi/03-test-application.471910da12c3038e.webp)

1. Thử đặt một vài [câu hỏi mẫu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Hỏi: ```Thủ đô của Pháp là gì?```
      1. Hỏi: ```Lều tốt nhất dưới $200 cho hai người là gì, và nó có những tính năng nào?```

1. Bạn sẽ nhận được câu trả lời tương tự như hình dưới đây. _Nhưng điều này hoạt động thế nào?_

      ![App](../../../../../translated_images/vi/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Xác thực Agent

Azure Container App triển khai một endpoint kết nối tới AI Agent được cấp phát trong dự án Microsoft Foundry cho mẫu này. Hãy cùng xem điều đó nghĩa là gì.

1. Quay lại trang _Overview_ trong Azure Portal cho nhóm tài nguyên của bạn

1. Nhấp vào tài nguyên `Microsoft Foundry` trong danh sách đó

1. Bạn sẽ thấy như bên dưới. Nhấp nút `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/vi/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Bạn sẽ thấy trang Dự án Foundry cho ứng dụng AI của bạn
   ![Project](../../../../../translated_images/vi/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Nhấp vào `Agents` - bạn sẽ thấy agent mặc định đã được cấp phát trong dự án
   ![Agents](../../../../../translated_images/vi/06-visit-agents.bccb263f77b00a09.webp)

1. Chọn agent đó – bạn sẽ thấy chi tiết agent. Lưu ý các điểm sau:

      - Agent mặc định sử dụng File Search (tìm kiếm file) luôn
      - Thông tin `Knowledge` của agent chỉ ra có 32 file được tải lên (dùng cho tìm kiếm file)
      ![Agents](../../../../../translated_images/vi/07-view-agent-details.0e049f37f61eae62.webp)

1. Tìm tùy chọn `Data+indexes` trên menu bên trái và nhấp để xem chi tiết.

      - Bạn sẽ thấy 32 file dữ liệu được tải lên cho kiến thức.
      - Các file này tương ứng với 12 file khách hàng và 20 file sản phẩm trong `src/files`
      ![Data](../../../../../translated_images/vi/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Bạn đã xác thực hoạt động của Agent!**

1. Các phản hồi của agent dựa trên kiến thức trong các file đó.
1. Bạn có thể đặt câu hỏi liên quan đến dữ liệu và nhận được câu trả lời dựa trên kiến thức.
1. Ví dụ: file `customer_info_10.json` mô tả 3 giao dịch mua của "Amanda Perez"

Quay lại tab trình duyệt với endpoint Container App và hỏi: `Amanda Perez sở hữu những sản phẩm nào?` Bạn sẽ thấy kết quả như sau:

![Data](../../../../../translated_images/vi/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Khu vui chơi Agent

Hãy tạo thêm cảm nhận về khả năng của Microsoft Foundry bằng cách thử Agent trong Agents Playground.

1. Quay lại trang `Agents` trong Microsoft Foundry - chọn agent mặc định
1. Nhấp tùy chọn `Try in Playground` - bạn sẽ thấy giao diện Playground như sau
1. Hỏi lại câu hỏi: `Amanda Perez sở hữu những sản phẩm nào?`

    ![Data](../../../../../translated_images/vi/09-ask-in-playground.a1b93794f78fa676.webp)

Bạn sẽ nhận được câu trả lời tương tự (hoặc gần giống) - đồng thời có thêm thông tin giúp bạn đánh giá chất lượng, chi phí và hiệu suất ứng dụng agentic của bạn. Ví dụ:

1. Lưu ý câu trả lời trích dẫn các file dữ liệu dùng để "trang bị kiến thức" cho phản hồi
1. Di chuột lên nhãn file để xem dữ liệu có phù hợp với câu hỏi và phản hồi hiển thị không?

Bạn cũng thấy một hàng _thống kê_ bên dưới câu trả lời.

1. Di chuột lên bất kỳ chỉ số nào – ví dụ, Safety. Bạn sẽ thấy như hình
1. Xếp hạng đánh giá có phù hợp với trực giác của bạn về mức độ an toàn câu trả lời không?

      ![Data](../../../../../translated_images/vi/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Khả năng giám sát tích hợp sẵn

Khả năng giám sát liên quan tới việc trang bị công cụ cho ứng dụng của bạn để tạo dữ liệu có thể dùng để hiểu, gỡ lỗi và tối ưu hóa hoạt động. Để cảm nhận điều này:

1. Nhấp nút `View Run Info` - bạn sẽ thấy giao diện này. Đây là ví dụ về [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground). _Bạn cũng có thể xem qua tùy chọn Thread Logs trong menu cấp cao_.

   - Cảm nhận các bước chạy và công cụ agent sử dụng
   - Hiểu tổng số Token (đối với token đầu ra)
   - Hiểu độ trễ và vị trí tiêu tốn thời gian khi chạy

      ![Agent](../../../../../translated_images/vi/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Nhấp tab `Metadata` để xem các thuộc tính bổ sung cho phiên chạy, có thể hữu ích khi gỡ lỗi sau này.

      ![Agent](../../../../../translated_images/vi/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Nhấp tab `Evaluations` để xem các đánh giá tự động về phản hồi của agent. Bao gồm đánh giá an toàn (ví dụ, Tự làm hại bản thân) và đánh giá riêng cho agent (ví dụ, Giải quyết ý định, Tuân thủ nhiệm vụ).

      ![Agent](../../../../../translated_images/vi/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Cuối cùng, nhấp tab `Monitoring` trong menu bên.

      - Chọn tab `Resource usage` trong trang hiện ra – và xem các số liệu.
      - Theo dõi việc sử dụng ứng dụng về chi phí (token) và tải (yêu cầu).
      - Theo dõi độ trễ ứng dụng tới byte đầu tiên (xử lý đầu vào) và byte cuối cùng (đầu ra).

      ![Agent](../../../../../translated_images/vi/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Biến Môi trường

Cho đến nay, chúng ta đã triển khai trên trình duyệt - và xác thực rằng hạ tầng đã được cấp phát và ứng dụng vận hành. Nhưng để làm việc với mã nguồn ứng dụng _trước tiên_, chúng ta cần cấu hình môi trường phát triển local với các biến cần thiết để thao tác với tài nguyên. Sử dụng `azd` làm điều này trở nên dễ dàng.

1. Azure Developer CLI [sử dụng biến môi trường](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) để lưu trữ và quản lý các cài đặt cấu hình cho việc triển khai ứng dụng.

1. Các biến môi trường được lưu trong `.azure/<env-name>/.env` – phạm vi biến theo môi trường `env-name` dùng trong triển khai, giúp tách biệt các môi trường trên các đích triển khai khác nhau trong cùng một kho.

1. Các biến môi trường được tự động tải bởi lệnh `azd` mỗi khi thực hiện một lệnh cụ thể (ví dụ, `azd up`). Lưu ý `azd` không tự đọc biến môi trường ở cấp độ hệ điều hành (ví dụ, thiết lập trong shell) – thay vào đó dùng `azd set env` và `azd get env` để chuyển thông tin trong scripts.


Hãy thử một vài lệnh:

1. Lấy tất cả biến môi trường được thiết lập cho `azd` trong môi trường này:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Bạn sẽ thấy kết quả như sau:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Lấy giá trị cụ thể – ví dụ, tôi muốn biết có đặt giá trị `AZURE_AI_AGENT_MODEL_NAME` không

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Bạn sẽ thấy như hình – giá trị chưa được đặt mặc định!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Đặt biến môi trường mới cho `azd`. Ở đây ta cập nhật tên mô hình agent. _Lưu ý: mọi thay đổi sẽ được phản chiếu ngay lập tức trong file `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Giờ ta sẽ thấy giá trị đã được đặt:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Lưu ý một số tài nguyên có tính bền vững (ví dụ, việc triển khai mô hình) và sẽ cần nhiều hơn một lệnh `azd up` để buộc triển khai lại. Ta thử tháo gỡ triển khai ban đầu và triển khai lại với biến môi trường mới.

1. **Làm mới** Nếu trước đây bạn đã triển khai hạ tầng bằng mẫu azd – bạn có thể _làm mới_ trạng thái biến môi trường local dựa trên trạng thái hiện tại của triển khai Azure bằng lệnh này:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Đây là một cách mạnh mẽ để _đồng bộ_ các biến môi trường giữa hai hoặc nhiều môi trường phát triển cục bộ (ví dụ: nhóm với nhiều nhà phát triển) - cho phép hạ tầng đã triển khai làm cơ sở thực tế cho trạng thái biến môi trường. Các thành viên trong nhóm chỉ cần _làm mới_ biến để đồng bộ lại.

---

## 9. Chúc mừng 🏆

Bạn vừa hoàn thành một quy trình làm việc từ đầu đến cuối, trong đó bạn đã:

- [X] Chọn mẫu AZD bạn muốn sử dụng
- [X] Mở mẫu trong một môi trường phát triển được hỗ trợ
- [X] Triển khai mẫu và xác thực nó hoạt động

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->