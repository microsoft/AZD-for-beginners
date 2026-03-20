# 2. Xác thực một Mẫu

!!! tip "VÀO CUỐI MODULE NÀY BẠN SẼ CÓ THỂ"

    - [ ] Phân tích Kiến trúc Giải pháp AI
    - [ ] Hiểu Quy trình Triển khai AZD
    - [ ] Sử dụng GitHub Copilot để hỗ trợ sử dụng AZD
    - [ ] **Lab 2:** Triển khai & Xác thực mẫu AI Agents

---


## 1. Giới thiệu

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) hoặc `azd` là một công cụ dòng lệnh mã nguồn mở giúp đơn giản hóa quy trình làm việc của nhà phát triển khi xây dựng và triển khai ứng dụng tới Azure.

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) là các kho lưu trữ tiêu chuẩn hóa bao gồm mã ứng dụng mẫu, tài sản _infrastructure-as-code_, và các tệp cấu hình `azd` cho một kiến trúc giải pháp gắn kết. Việc cung cấp hạ tầng trở nên đơn giản như một lệnh `azd provision` - trong khi sử dụng `azd up` cho phép bạn cung cấp hạ tầng **và** triển khai ứng dụng chỉ trong một bước!

Kết quả là, việc khởi động quá trình phát triển ứng dụng có thể đơn giản như tìm mẫu _AZD Starter_ phù hợp nhất với nhu cầu ứng dụng và hạ tầng của bạn - sau đó tùy chỉnh kho lưu trữ để phù hợp với yêu cầu kịch bản.

Trước khi bắt đầu, hãy đảm bảo bạn đã cài đặt Azure Developer CLI.

1. Mở terminal VS Code và gõ lệnh sau:

      ```bash title="" linenums="0"
      azd version
      ```

1. Bạn sẽ thấy điều gì đó giống như thế này!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Bạn đã sẵn sàng để chọn và triển khai một mẫu bằng azd**

---

## 2. Lựa chọn Mẫu

Nền tảng Microsoft Foundry đi kèm với một [tập các mẫu AZD được khuyến nghị](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) bao phủ các kịch bản giải pháp phổ biến như _tự động hóa luồng công việc đa-tác nhân_ và _xử lý nội dung đa phương thức_. Bạn cũng có thể khám phá các mẫu này bằng cách truy cập cổng Microsoft Foundry.

1. Truy cập [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Đăng nhập vào cổng Microsoft Foundry khi được yêu cầu - bạn sẽ thấy điều gì đó như thế này.

![Chọn mẫu](../../../../../translated_images/vi/01-pick-template.60d2d5fff5ebc374.webp)


Các tùy chọn **Basic** là các mẫu khởi động cho bạn:

1. [ ] [Bắt đầu với AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) triển khai một ứng dụng chat cơ bản _với dữ liệu của bạn_ lên Azure Container Apps. Sử dụng mục này để khám phá kịch bản chatbot AI cơ bản.
1. [X] [Bắt đầu với AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) cũng triển khai một Agent AI chuẩn (với Foundry Agents). Sử dụng mục này để làm quen với các giải pháp AI có đặc tính tác nhân sử dụng công cụ và mô hình.

Mở liên kết thứ hai trong một tab trình duyệt mới (hoặc nhấp `Open in GitHub` cho thẻ liên quan). Bạn sẽ thấy kho lưu trữ cho Mẫu AZD này. Dành một phút để khám phá README. Kiến trúc ứng dụng trông như sau:

![Kiến trúc](../../../../../translated_images/vi/architecture.8cec470ec15c65c7.webp)

---

## 3. Kích hoạt Mẫu

Hãy thử triển khai mẫu này và đảm bảo nó hợp lệ. Chúng ta sẽ theo các hướng dẫn trong phần [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Nhấp [liên kết này](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - xác nhận hành động mặc định là `Create codespace`
1. Thao tác này mở một tab trình duyệt mới - chờ cho phiên GitHub Codespaces hoàn tất tải
1. Mở terminal VS Code trong Codespaces - gõ lệnh sau:

   ```bash title="" linenums="0"
   azd up
   ```

Hoàn thành các bước quy trình công việc mà lệnh này sẽ kích hoạt:

1. Bạn sẽ được yêu cầu đăng nhập vào Azure - làm theo hướng dẫn để xác thực
1. Nhập một tên môi trường duy nhất cho bạn - ví dụ, tôi đã dùng `nitya-mshack-azd`
1. Việc này sẽ tạo một thư mục `.azure/` - bạn sẽ thấy một thư mục con với tên env
1. Bạn sẽ được yêu cầu chọn tên subscription - chọn mặc định
1. Bạn sẽ được yêu cầu chọn vị trí - dùng `East US 2`

Bây giờ, bạn chờ cho việc cung cấp hạ tầng hoàn tất. **Việc này mất 10-15 phút**

1. Khi xong, console của bạn sẽ hiển thị thông báo SUCCESS như sau:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure Portal của bạn bây giờ sẽ có một resource group được cung cấp với tên env đó:

      ![Hạ tầng được cấp](../../../../../translated_images/vi/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Bạn đã sẵn sàng để xác thực hạ tầng và ứng dụng đã triển khai**.

---

## 4. Xác thực Mẫu

1. Truy cập trang Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - đăng nhập khi được yêu cầu
1. Nhấp vào RG cho tên môi trường của bạn - bạn sẽ thấy trang như trên

      - nhấp vào resource Azure Container Apps
      - nhấp vào Application Url trong phần _Essentials_ (góc trên bên phải)

1. Bạn sẽ thấy giao diện front-end ứng dụng được lưu trữ như sau:

   ![Ứng dụng](../../../../../translated_images/vi/03-test-application.471910da12c3038e.webp)

1. Thử hỏi một vài [câu hỏi mẫu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Hỏi: ```Thủ đô của Pháp là gì?``` 
      1. Hỏi: ```Lều tốt nhất dưới $200 cho hai người là gì, và nó bao gồm những tính năng nào?```

1. Bạn sẽ nhận được các câu trả lời tương tự như được hiển thị bên dưới. _Nhưng điều này hoạt động như thế nào?_

      ![Ứng dụng](../../../../../translated_images/vi/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Xác thực Agent

Azure Container App triển khai một endpoint kết nối tới AI Agent được cung cấp trong dự án Microsoft Foundry cho mẫu này. Hãy xem điều đó có ý nghĩa gì.

1. Quay lại trang Tổng quan (Overview) trong Azure Portal cho resource group của bạn

1. Nhấp vào resource `Microsoft Foundry` trong danh sách đó

1. Bạn sẽ thấy như này. Nhấp nút `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/vi/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Bạn sẽ thấy trang Dự án Foundry cho ứng dụng AI của bạn
   ![Dự án](../../../../../translated_images/vi/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Nhấp vào `Agents` - bạn sẽ thấy Agent mặc định được cung cấp trong dự án của bạn
   ![Agents](../../../../../translated_images/vi/06-visit-agents.bccb263f77b00a09.webp)

1. Chọn nó - và bạn sẽ thấy chi tiết Agent. Lưu ý các điểm sau:

      - Agent sử dụng File Search theo mặc định (luôn luôn)
      - `Knowledge` của agent cho biết nó đã tải lên 32 tệp (cho tìm kiếm tệp)
      ![Agents](../../../../../translated_images/vi/07-view-agent-details.0e049f37f61eae62.webp)

1. Tìm tùy chọn `Data+indexes` trong menu bên trái và nhấp để xem chi tiết. 

      - Bạn sẽ thấy 32 tệp dữ liệu đã được tải lên cho kiến thức.
      - Chúng sẽ tương ứng với 12 tệp khách hàng và 20 tệp sản phẩm trong `src/files`
      ![Dữ liệu](../../../../../translated_images/vi/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Bạn đã xác thực hoạt động của Agent!**

1. Các phản hồi của agent được dựa trên kiến thức trong những tệp đó.
1. Giờ bạn có thể hỏi các câu liên quan đến dữ liệu đó, và nhận phản hồi có căn cứ.
1. Ví dụ: `customer_info_10.json` mô tả 3 giao dịch mua được thực hiện bởi "Amanda Perez"

Quay lại tab trình duyệt với endpoint Container App và hỏi: `Amanda Perez sở hữu những sản phẩm nào?`. Bạn sẽ thấy điều gì đó như thế này:

![Dữ liệu](../../../../../translated_images/vi/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Khu vui chơi Agent (Agent Playground)

Hãy xây dựng thêm trực giác cho khả năng của Microsoft Foundry, bằng cách dùng Agent trong Agents Playground.

1. Quay lại trang `Agents` trong Microsoft Foundry - chọn agent mặc định
1. Nhấp vào tùy chọn `Try in Playground` - bạn sẽ nhận được giao diện Playground như thế này
1. Hỏi cùng câu hỏi: `Amanda Perez sở hữu những sản phẩm nào?`

    ![Dữ liệu](../../../../../translated_images/vi/09-ask-in-playground.a1b93794f78fa676.webp)

Bạn nhận được cùng (hoặc tương tự) phản hồi - nhưng bạn cũng nhận được thông tin bổ sung mà bạn có thể dùng để hiểu chất lượng, chi phí và hiệu năng của ứng dụng tác nhân của mình. Ví dụ:

1. Lưu ý rằng phản hồi trích dẫn các tệp dữ liệu được sử dụng để "nền tảng hóa" phản hồi
1. Di chuột qua bất kỳ nhãn tệp nào - dữ liệu có khớp với truy vấn và phản hồi hiển thị không?

Bạn cũng thấy một hàng _thống kê_ phía dưới phản hồi.

1. Di chuột qua bất kỳ chỉ số nào - ví dụ, Safety. Bạn sẽ thấy điều gì đó như này
1. Đánh giá được đưa ra có khớp với trực giác của bạn về mức độ an toàn của phản hồi không?

      ![Dữ liệu](../../../../../translated_images/vi/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Giám sát tích hợp sẵn

Observability (khả năng quan sát) là về việc trang bị công cụ cho ứng dụng của bạn để tạo dữ liệu có thể dùng để hiểu, gỡ lỗi và tối ưu hóa hoạt động của nó. Để nắm được điều này:

1. Nhấp nút `View Run Info` - bạn sẽ thấy khung nhìn này. Đây là một ví dụ của [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) đang hoạt động. _Bạn cũng có thể nhận được khung nhìn này bằng cách nhấp Thread Logs trong menu cấp cao_.

   - Nắm được các bước chạy và các công cụ được agent sử dụng
   - Hiểu tổng số Token (so với việc sử dụng token đầu ra) cho phản hồi
   - Hiểu độ trễ và nơi thời gian đang được tiêu tốn trong quá trình thực thi

      ![Agent](../../../../../translated_images/vi/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Nhấp tab `Metadata` để thấy các thuộc tính bổ sung cho lần chạy, có thể cung cấp bối cảnh hữu ích để gỡ lỗi vấn đề sau này.   

      ![Agent](../../../../../translated_images/vi/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Nhấp tab `Evaluations` để xem các tự đánh giá được thực hiện trên phản hồi của agent. Chúng bao gồm các đánh giá về an toàn (ví dụ, Tự gây hại) và các đánh giá chuyên biệt cho agent (ví dụ, Giải quyết ý định, Tuân thủ tác vụ).

      ![Agent](../../../../../translated_images/vi/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Cuối cùng nhưng không kém phần quan trọng, nhấp tab `Monitoring` trong menu bên.

      - Chọn tab `Resource usage` trong trang hiển thị - và xem các chỉ số.
      - Theo dõi mức sử dụng ứng dụng về chi phí (tokens) và tải (yêu cầu).
      - Theo dõi độ trễ ứng dụng tới byte đầu tiên (xử lý đầu vào) và byte cuối cùng (đầu ra).

      ![Agent](../../../../../translated_images/vi/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Biến Môi trường

Cho tới nay, chúng ta đã đi qua việc triển khai trong trình duyệt - và xác thực rằng hạ tầng của chúng ta được cung cấp và ứng dụng hoạt động. Nhưng để làm việc với mã ứng dụng theo phương pháp _code-first_, chúng ta cần cấu hình môi trường phát triển cục bộ với các biến liên quan cần thiết để làm việc với các tài nguyên này. Sử dụng `azd` giúp điều này trở nên dễ dàng.

1. Azure Developer CLI [sử dụng các biến môi trường](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) để lưu trữ và quản lý cài đặt cấu hình cho các triển khai ứng dụng.

1. Các biến môi trường được lưu trong `.azure/<env-name>/.env` - điều này giới hạn chúng theo môi trường `env-name` được sử dụng trong quá trình triển khai và giúp bạn tách biệt các môi trường giữa các mục tiêu triển khai khác nhau trong cùng một repo.

1. Các biến môi trường được `azd` tự động nạp mỗi khi nó thực thi một lệnh cụ thể (ví dụ, `azd up`). Lưu ý rằng `azd` không tự động đọc các biến môi trường cấp hệ điều hành (ví dụ, được thiết lập trong shell) - thay vào đó hãy sử dụng `azd set env` và `azd get env` để chuyển thông tin trong các script.


Hãy thử một vài lệnh:

1. Lấy tất cả các biến môi trường được thiết lập cho `azd` trong môi trường này:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Bạn sẽ thấy điều gì đó như:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Lấy một giá trị cụ thể - ví dụ, tôi muốn biết liệu chúng ta có đặt giá trị `AZURE_AI_AGENT_MODEL_NAME` không

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Bạn sẽ thấy điều gì đó như này - nó không được đặt theo mặc định!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Thiết lập một biến môi trường mới cho `azd`. Ở đây, chúng ta cập nhật tên mô hình agent. _Lưu ý: mọi thay đổi thực hiện sẽ được phản ánh ngay trong tệp `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Bây giờ, chúng ta nên thấy giá trị được đặt:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Lưu ý rằng một số tài nguyên là bền vững (ví dụ, triển khai mô hình) và sẽ yêu cầu nhiều hơn chỉ một `azd up` để buộc triển khai lại. Hãy thử gỡ cài đặt triển khai ban đầu và triển khai lại với các biến env đã thay đổi.

1. **Làm mới** Nếu bạn đã từng triển khai hạ tầng trước đó bằng mẫu azd - bạn có thể _làm mới_ trạng thái biến môi trường cục bộ dựa trên trạng thái hiện tại của triển khai Azure bằng cách sử dụng lệnh này:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Đây là một cách mạnh mẽ để _đồng bộ_ các biến môi trường giữa hai hoặc nhiều môi trường phát triển cục bộ (ví dụ: nhóm có nhiều nhà phát triển) - cho phép hạ tầng đã triển khai đóng vai trò là nguồn sự thật cho trạng thái biến môi trường. Các thành viên trong nhóm chỉ cần _làm mới_ các biến để đồng bộ trở lại.

---

## 9. Chúc mừng 🏆

Bạn vừa hoàn thành một quy trình làm việc từ đầu đến cuối nơi bạn:

- [X] Đã chọn Mẫu AZD mà bạn muốn sử dụng
- [X] Đã khởi chạy mẫu với GitHub Codespaces 
- [X] Đã triển khai mẫu và xác nhận nó hoạt động

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn tham chiếu có thẩm quyền. Đối với thông tin quan trọng, khuyến nghị sử dụng bản dịch do người dịch chuyên nghiệp thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu nhầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->