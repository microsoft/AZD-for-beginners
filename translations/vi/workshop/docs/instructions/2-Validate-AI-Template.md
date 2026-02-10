# 2. Xác thực một Mẫu

!!! tip "VÀO CUỐI MÔ-ĐUN NÀY BẠN SẼ CÓ THỂ"

    - [ ] Phân tích Kiến trúc Giải pháp AI
    - [ ] Hiểu Quy trình Triển khai AZD
    - [ ] Sử dụng GitHub Copilot để hỗ trợ sử dụng AZD
    - [ ] **Bài lab 2:** Triển khai & Xác thực mẫu AI Agents

---


## 1. Giới thiệu

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) hoặc `azd` là một công cụ dòng lệnh mã nguồn mở giúp tinh giản quy trình làm việc của nhà phát triển khi xây dựng và triển khai ứng dụng lên Azure.

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) là các kho lưu trữ tiêu chuẩn hóa bao gồm mã ứng dụng mẫu, tài sản _infrastructure-as-code_, và các tệp cấu hình `azd` cho một kiến trúc giải pháp thống nhất. Việc cấp phát hạ tầng trở nên đơn giản như một lệnh `azd provision` - trong khi sử dụng `azd up` cho phép bạn cấp phát hạ tầng **và** triển khai ứng dụng cùng lúc!

Kết quả là, việc khởi động quá trình phát triển ứng dụng có thể đơn giản như tìm mẫu _AZD Starter_ phù hợp nhất với nhu cầu ứng dụng và hạ tầng của bạn - sau đó tùy chỉnh kho lưu trữ để phù hợp với yêu cầu kịch bản của bạn.

Trước khi bắt đầu, hãy đảm bảo bạn đã cài đặt Azure Developer CLI.

1. Mở terminal trong VS Code và gõ lệnh sau:

      ```bash title="" linenums="0"
      azd version
      ```

1. Bạn sẽ thấy thứ gì đó như thế này!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Bạn giờ đã sẵn sàng để chọn và triển khai một mẫu bằng azd**

---

## 2. Lựa chọn Mẫu

Nền tảng Microsoft Foundry đi kèm với một [tập các mẫu AZD được khuyến nghị](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) bao phủ các kịch bản giải pháp phổ biến như _tự động hóa quy trình làm việc đa-tác nhân_ và _xử lý nội dung đa mô-đun_. Bạn cũng có thể khám phá các mẫu này bằng cách truy cập cổng Microsoft Foundry.

1. Truy cập [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Đăng nhập vào cổng Microsoft Foundry khi được yêu cầu - bạn sẽ thấy thứ gì đó giống như hình dưới.

![Chọn](../../../../../translated_images/vi/01-pick-template.60d2d5fff5ebc374.webp)


Các tùy chọn **Basic** là các mẫu khởi đầu của bạn:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) triển khai một ứng dụng chat cơ bản _với dữ liệu của bạn_ lên Azure Container Apps. Dùng mẫu này để khám phá kịch bản chatbot AI cơ bản.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) cũng triển khai một AI Agent tiêu chuẩn (với các Foundry Agents). Dùng mẫu này để làm quen với các giải pháp AI theo dạng tác nhân liên quan đến các công cụ và mô hình.

Mở liên kết thứ hai trong một tab trình duyệt mới (hoặc nhấp `Open in GitHub` cho thẻ liên quan). Bạn sẽ thấy kho lưu trữ cho Mẫu AZD này. Dành một phút để khám phá README. Kiến trúc ứng dụng trông như sau:

![Kiến trúc](../../../../../translated_images/vi/architecture.8cec470ec15c65c7.webp)

---

## 3. Kích hoạt Mẫu

Hãy thử triển khai mẫu này và đảm bảo nó hợp lệ. Chúng ta sẽ theo hướng dẫn trong phần [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Nhấp [liên kết này](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - xác nhận hành động mặc định là `Create codespace`
1. Điều này sẽ mở một tab trình duyệt mới - chờ cho phiên GitHub Codespaces hoàn tất tải
1. Mở terminal VS Code trong Codespaces - gõ lệnh sau:

   ```bash title="" linenums="0"
   azd up
   ```

Hoàn thành các bước quy trình làm việc mà lệnh này sẽ kích hoạt:

1. Bạn sẽ được yêu cầu đăng nhập vào Azure - làm theo hướng dẫn để xác thực
1. Nhập một tên môi trường duy nhất cho bạn - ví dụ, tôi đã dùng `nitya-mshack-azd`
1. Việc này sẽ tạo một thư mục `.azure/` - bạn sẽ thấy một thư mục con với tên env
1. Bạn sẽ được yêu cầu chọn tên subscription - chọn mặc định
1. Bạn sẽ được hỏi về vị trí - dùng `East US 2`

Bây giờ, bạn chờ cho việc cấp phát hoàn tất. **Điều này mất 10-15 phút**

1. Khi xong, console của bạn sẽ hiển thị thông báo SUCCESS như sau:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure Portal của bạn bây giờ sẽ có một resource group đã được cấp phát với tên env đó:

      ![Hạ tầng](../../../../../translated_images/vi/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Bạn giờ đã sẵn sàng để xác thực hạ tầng và ứng dụng đã triển khai**.

---

## 4. Xác thực Mẫu

1. Truy cập trang [Resource Groups](https://portal.azure.com/#browse/resourcegroups) của Azure Portal - đăng nhập khi được yêu cầu
1. Nhấp vào RG cho tên môi trường của bạn - bạn sẽ thấy trang như trên

      - nhấp vào resource Azure Container Apps
      - nhấp vào Application Url trong phần _Essentials_ (phía trên bên phải)

1. Bạn sẽ thấy giao diện front-end ứng dụng được host như thế này:

   ![Ứng dụng](../../../../../translated_images/vi/03-test-application.471910da12c3038e.webp)

1. Thử hỏi một vài [câu hỏi mẫu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Hỏi: ```What is the capital of France?``` 
      1. Hỏi: ```What's the best tent under $200 for two people, and what features does it include?```

1. Bạn sẽ nhận được câu trả lời tương tự như minh họa bên dưới. _Nhưng điều này hoạt động như thế nào?_

      ![Ứng dụng](../../../../../translated_images/vi/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Xác thực Agent

Azure Container App triển khai một endpoint kết nối tới AI Agent được cấp phát trong dự án Microsoft Foundry cho mẫu này. Hãy xem điều đó có nghĩa là gì.

1. Quay lại trang _Overview_ của resource group trong Azure Portal

1. Nhấp vào resource `Microsoft Foundry` trong danh sách đó

1. Bạn sẽ thấy như thế này. Nhấp nút `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/vi/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Bạn sẽ thấy trang Foundry Project cho ứng dụng AI của bạn
   ![Dự án](../../../../../translated_images/vi/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Nhấp vào `Agents` - bạn sẽ thấy Agent mặc định được cấp phát trong dự án của bạn
   ![Agents](../../../../../translated_images/vi/06-visit-agents.bccb263f77b00a09.webp)

1. Chọn nó - và bạn sẽ thấy chi tiết Agent. Lưu ý các điểm sau:

      - Agent sử dụng File Search theo mặc định (luôn luôn)
      - `Knowledge` của agent cho biết nó có 32 tệp được tải lên (cho tìm kiếm tệp)
      ![Agents](../../../../../translated_images/vi/07-view-agent-details.0e049f37f61eae62.webp)

1. Tìm tùy chọn `Data+indexes` trong menu bên trái và nhấp để xem chi tiết.

      - Bạn sẽ thấy 32 tệp dữ liệu được tải lên cho knowledge.
      - Chúng tương ứng với 12 tệp khách hàng và 20 tệp sản phẩm dưới `src/files`
      ![Dữ liệu](../../../../../translated_images/vi/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Bạn đã xác thực hoạt động của Agent!**

1. Các phản hồi của agent được căn cứ trên kiến thức trong những tệp đó.
1. Bây giờ bạn có thể hỏi các câu liên quan đến dữ liệu đó, và nhận được các phản hồi có nền tảng.
1. Ví dụ: `customer_info_10.json` mô tả 3 giao dịch mua do "Amanda Perez" thực hiện

Quay lại tab trình duyệt với endpoint Container App và hỏi: `What products does Amanda Perez own?`. Bạn sẽ thấy thứ gì đó như sau:

![Dữ liệu](../../../../../translated_images/vi/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Sân chơi Agent

Hãy xây dựng thêm trực giác về khả năng của Microsoft Foundry, bằng cách thử Agent trong Agents Playground.

1. Quay lại trang `Agents` trong Microsoft Foundry - chọn agent mặc định
1. Nhấp tùy chọn `Try in Playground` - bạn sẽ thấy giao diện Playground như thế này
1. Hỏi cùng một câu: `What products does Amanda Perez own?`

    ![Dữ liệu](../../../../../translated_images/vi/09-ask-in-playground.a1b93794f78fa676.webp)

Bạn nhận được cùng (hoặc tương tự) phản hồi - nhưng bạn cũng nhận thêm thông tin để hiểu chất lượng, chi phí và hiệu năng của ứng dụng tác nhân của bạn. Ví dụ:

1. Lưu ý rằng phản hồi trích dẫn các tệp dữ liệu được dùng để "căn cứ" phản hồi
1. Di chuột qua bất kỳ nhãn tệp nào - dữ liệu có khớp với truy vấn và phản hồi được hiển thị không?

Bạn cũng thấy một hàng _stats_ phía dưới phản hồi.

1. Di chuột qua bất kỳ chỉ số nào - ví dụ, Safety. Bạn sẽ thấy thứ gì đó như thế này
1. Đánh giá có phù hợp với trực giác của bạn về mức độ an toàn của phản hồi không?

      ![Dữ liệu](../../../../../translated_images/vi/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Tính quan sát tích hợp sẵn

Observability (khả năng quan sát) là việc trang bị công cụ cho ứng dụng để tạo ra dữ liệu có thể dùng để hiểu, gỡ lỗi và tối ưu hóa hoạt động của ứng dụng. Để có cảm nhận về điều này:

1. Nhấp nút `View Run Info` - bạn sẽ thấy chế độ xem này. Đây là một ví dụ về [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) đang hoạt động. _Bạn cũng có thể xem chế độ này bằng cách nhấp Thread Logs trong menu cấp cao_.

   - Nắm bắt các bước chạy và công cụ agent đã sử dụng
   - Hiểu tổng số Token (so với token đầu ra đã dùng) cho phản hồi
   - Hiểu độ trễ và nơi thời gian đang được tiêu tốn trong quá trình thực thi

      ![Tác nhân](../../../../../translated_images/vi/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Nhấp tab `Metadata` để xem các thuộc tính bổ sung cho lần chạy, có thể cung cấp bối cảnh hữu ích để gỡ lỗi sau này.   

      ![Tác nhân](../../../../../translated_images/vi/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Nhấp tab `Evaluations` để xem các tự đánh giá được thực hiện trên phản hồi của agent. Chúng bao gồm các đánh giá an toàn (ví dụ: Tự làm hại) và các đánh giá đặc thù agent (ví dụ: Giải quyết ý định, Tuân thủ tác vụ).

      ![Tác nhân](../../../../../translated_images/vi/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Cuối cùng nhưng không kém phần quan trọng, nhấp tab `Monitoring` trong menu bên.

      - Chọn tab `Resource usage` trên trang hiển thị - và xem các chỉ số.
      - Theo dõi việc sử dụng ứng dụng về chi phí (tokens) và tải (yêu cầu).
      - Theo dõi độ trễ ứng dụng đến byte đầu tiên (xử lý đầu vào) và byte cuối cùng (đầu ra).

      ![Tác nhân](../../../../../translated_images/vi/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Biến Môi trường

Cho đến nay, chúng ta đã đi qua triển khai trong trình duyệt - và xác thực rằng hạ tầng của chúng ta đã được cấp phát và ứng dụng hoạt động. Nhưng để làm việc với mã ứng dụng theo hướng _code-first_, chúng ta cần cấu hình môi trường phát triển cục bộ với các biến phù hợp cần thiết để làm việc với các tài nguyên này. Sử dụng `azd` làm cho việc này trở nên dễ dàng.

1. Azure Developer CLI [sử dụng các biến môi trường](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) để lưu trữ và quản lý các thiết lập cấu hình cho các lần triển khai ứng dụng.

1. Các biến môi trường được lưu trong `.azure/<env-name>/.env` - điều này phạm vi hóa chúng cho môi trường `env-name` được dùng trong triển khai và giúp bạn cô lập các môi trường giữa các mục tiêu triển khai khác nhau trong cùng một repo.

1. Các biến môi trường được `azd` tự động tải bất cứ khi nào nó thực thi một lệnh cụ thể (ví dụ, `azd up`). Lưu ý rằng `azd` không tự động đọc các biến môi trường cấp hệ điều hành (ví dụ, được thiết lập trong shell) - thay vào đó dùng `azd set env` và `azd get env` để chuyển thông tin trong các script.


Hãy thử một vài lệnh:

1. Lấy tất cả biến môi trường được đặt cho `azd` trong môi trường này:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Bạn sẽ thấy thứ gì đó như:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Lấy một giá trị cụ thể - ví dụ, tôi muốn biết liệu chúng ta đã đặt giá trị `AZURE_AI_AGENT_MODEL_NAME` hay chưa

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Bạn sẽ thấy thứ gì đó như thế này - nó không được đặt theo mặc định!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Đặt một biến môi trường mới cho `azd`. Ở đây, chúng ta cập nhật tên mô hình agent. _Lưu ý: mọi thay đổi sẽ được phản ánh ngay lập tức trong tệp `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Bây giờ, chúng ta nên thấy giá trị đã được đặt:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Lưu ý rằng một số tài nguyên là bền vững (ví dụ: triển khai mô hình) và sẽ yêu cầu hơn chỉ một `azd up` để buộc triển khai lại. Hãy thử xóa triển khai ban đầu và triển khai lại với các biến môi trường đã thay đổi.

1. **Làm mới** Nếu bạn đã từng triển khai hạ tầng trước đó bằng một mẫu azd - bạn có thể _làm mới_ trạng thái các biến môi trường cục bộ dựa trên trạng thái hiện tại của triển khai Azure của bạn bằng lệnh này:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Đây là một cách mạnh mẽ để _đồng bộ_ các biến môi trường giữa hai hoặc nhiều môi trường phát triển cục bộ (ví dụ: nhóm có nhiều nhà phát triển) - cho phép hạ tầng đã triển khai đóng vai trò là nguồn tham chiếu cho trạng thái các biến môi trường. Các thành viên trong nhóm chỉ cần _làm mới_ các biến để đồng bộ lại.

---

## 9. Chúc mừng 🏆

Bạn vừa hoàn thành một quy trình công việc từ đầu đến cuối, trong đó bạn đã:

- [X] Đã chọn Mẫu AZD mà bạn muốn sử dụng
- [X] Đã khởi chạy mẫu bằng GitHub Codespaces 
- [X] Đã triển khai mẫu và xác nhận nó hoạt động

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ gốc nên được coi là nguồn chính thức. Đối với những thông tin quan trọng, nên sử dụng bản dịch do người dịch chuyên nghiệp thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu nhầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->