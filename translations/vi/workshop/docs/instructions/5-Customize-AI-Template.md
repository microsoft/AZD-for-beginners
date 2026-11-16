# 5. Tùy chỉnh một Mẫu

!!! tip "VÀO CUỐI MODULE NÀY BẠN SẼ CÓ KHẢ NĂNG"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Thiết lập mốc cơ bản

Sử dụng kho lưu trữ [Bắt đầu với Các Đại lý AI](https://github.com/Azure-Samples/get-started-with-ai-agents) đã khởi tạo từ các module trước. Ghi nhận bản sửa mẫu, phiên bản AZD, môi trường đã chọn, triển khai mô hình, và các câu hỏi mẫu đang hoạt động trước khi thay đổi bất cứ điều gì.

Mẫu này triển khai một ứng dụng chat hỗ trợ đại lý. Nó **không** trở thành một hệ thống bán lẻ hai đại lý chỉ bằng cách đặt biến môi trường hoặc lưu các tập tin hướng dẫn bổ sung. Các đại lý thêm, trình xử lý công cụ, định tuyến, ủy quyền và truy cập dữ liệu đòi hỏi mã ứng dụng.

Kiểm tra các hướng dẫn và công cụ của đại lý đang triển khai trong Foundry. Thử một câu hỏi thực tế, một câu hỏi truy xuất, và một câu hỏi mà dữ liệu mẫu không thể trả lời. Xác minh trích dẫn với tài liệu nguồn thực tế thay vì giả định phản hồi mạch lạc là đúng.

## 5.2 Tùy chỉnh truy xuất kiến thức

Mẫu hỗ trợ truy xuất dựa trên tập tin và tích hợp tùy chọn Azure AI Search. Theo dõi [hướng dẫn AI Search hiện tại](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) để lập chỉ mục và cấu hình công cụ.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Kích hoạt dịch vụ chỉ là một phần của truy xuất. Trước khi tải dữ liệu riêng của bạn:

1. Xác nhận bạn có quyền sử dụng các tài liệu và loại bỏ thông tin nhạy cảm.
2. Chọn mô hình embedding được hỗ trợ ở khu vực của bạn và đặt phiên bản tương thích, loại triển khai, và kích thước véc tơ phù hợp.
3. Tạo/điền chỉ mục theo quy trình được ghi trong mẫu.
4. Cấu hình công cụ truy xuất của đại lý để sử dụng chỉ mục đó.
5. Kiểm tra truy xuất, trích dẫn, ủy quyền, và hành vi khi không có tài liệu liên quan.

Không chuyển từ `text-embedding-3-small` sang mô hình embedding khác mà không kiểm tra kích thước và xây dựng lại/chỉ mục lại véc tơ khi cần. Một tên như `retail-products` không phải là một catalog được triển khai hoặc chính sách kiểm soát truy cập.

## 5.3 Theo dõi và giám sát

Theo dõi [hướng dẫn quan sát mẫu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Đảm bảo tài nguyên và kết nối Application Insights cần thiết đã tồn tại; nếu thay đổi thiết lập hạ tầng, sử dụng `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Gửi một yêu cầu kiểm tra, sau đó kiểm tra nhật ký ứng dụng của Container App và chế độ xem theo dõi của đại lý trong Foundry. Kiểm tra độ trễ, cuộc gọi công cụ, lỗi, và sự liên kết giữa yêu cầu và trace. Không thể giả định telemetry được kết nối chỉ vì triển khai thành công.

Giữ `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` bị vô hiệu hóa trừ khi bạn đã xem xét rõ ràng về sự đồng ý, biện pháp che chắn, lưu trữ, và kiểm soát truy cập. Các trace có thể chứa tham số công cụ nhạy cảm hoặc nội dung tài liệu ngay cả khi nhật ký ứng dụng thông thường trông có vẻ vô hại.

## 5.4 Đánh giá đại lý

Điểm vào đánh giá của mẫu bây giờ là [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), không phải thư mục `evals/`. Từ gốc mẫu, sử dụng môi trường Python đáp ứng các yêu cầu đã ghi:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Trước khi chạy, hoàn thành [điều kiện tiên quyết đánh giá](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Các bài kiểm tra tải cấu hình từ `.azure/<environment>/.env` đã chọn; xác nhận môi trường mong muốn được chọn. Các đầu vào quan trọng bao gồm:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, sử dụng định dạng theo yêu cầu của mẫu hiện tại (phiên bản đã xem xét dùng `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, được dùng như triển khai mô hình giám khảo

Kiểm tra các bài kiểm tra để hiểu chọn lựa evaluator, ngưỡng, vai trò yêu cầu, và chi phí mô hình. Một lần chạy hoàn chỉnh không tự động là cổng chất lượng đạt; kiểm tra điểm số, các trường hợp thất bại/lỗi, và kết quả liên kết trong Foundry.

### Phần mở rộng đánh giá AZD riêng biệt

Bài kiểm tra Python ở trên là **quy trình làm việc mẫu cụ thể**. Phần mở rộng `azure.ai.evaluations` tùy chọn là một quy trình khác, với cấu hình `evals/azure.eval.yaml` riêng:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Để thiết lập phần mở rộng đầy đủ, xem [quy trình đánh giá và di cư](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Kể từ đại lý extension beta.22, không sử dụng các lệnh `azd ai agent eval` đã bị loại bỏ. Cài đặt phần mở rộng đánh giá không biến đổi bài kiểm tra Python của mẫu hoặc tự động tạo cấu hình đánh giá.

## 5.5 Đội đỏ AI và đánh giá liên tục

Mẫu hiện tại cung cấp [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Hoàn thành điều kiện tiên quyết và xem lại mục tiêu cùng chi phí trước khi chạy:

```bash
pytest tests/test_red_teaming.py -s
```

Sử dụng triển khai kiểm tra được ủy quyền và dữ liệu tổng hợp. Xem lại các cuộc tấn công và kết quả được tạo; quét này không xác định rằng ứng dụng an toàn hoặc tuân thủ.

Hướng dẫn [quan sát](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) cũng mô tả việc đánh giá liên tục được cấu hình khi khởi động container. Nó đánh giá các tương tác người dùng thực, không phải lưu lượng kiểm thử được tạo ra, và sự hỗ trợ bộ đánh giá thay đổi theo khu vực. Không có tương tác có nghĩa là không có mục đánh giá nào. Xác minh phiên bản mẫu đã cài đặt và cấu hình bộ đánh giá thay vì giả định mọi triển khai đều có cấu hình mặc định giống nhau.

Xác thực là tách biệt với đánh giá. Làm theo thiết lập danh tính/truy cập được tài liệu hóa trong mẫu. Không có "dự phòng xác thực cơ bản" được tài liệu hóa để dựa vào nhằm bảo vệ một điểm cuối công cộng.

## 5.6 Bài tập thiết kế: tùy chỉnh bán lẻ

!!! warning "Bài tập thiết kế, không phải một triển khai hoàn chỉnh"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Viết một kế hoạch ngắn giải quyết:

| Khu vực | Quyết định và bằng chứng cần thu thập |
|------|----------------------------------|
| Trách nhiệm của đại lý | Bắt đầu với một đại lý, hoặc giải thích cho các đại lý Shopper và Loyalty riêng biệt cùng với logic điều hướng |
| Dữ liệu | Xác định danh mục/bộ dữ liệu phần thưởng tổng hợp và quyền sở hữu cập nhật |
| Công cụ | Thực hiện các trình xử lý chỉ đọc trước; xác định quyền ủy quyền và xác thực cho bất kỳ thao tác ghi nào |
| Mô hình | Chọn các kết hợp mô hình/phiên bản/SKU có sẵn và xác minh hạn mức; tránh cấp phát mô hình không sử dụng |
| Truy xuất | Định nghĩa lập chỉ mục, kích thước nhúng, trích dẫn và kiểm soát truy cập cấp tài liệu |
| Đánh giá | Thêm các trường hợp câu trả lời dự kiến, câu hỏi không được hỗ trợ, sử dụng công cụ và an toàn với ngưỡng rõ ràng |
| Vận hành | Định nghĩa viễn thám, ngân sách độ trễ/lỗi, giới hạn chi phí và trách nhiệm dọn dẹp |

Việc lưu `custom-agents/shopper-agent-instructions.md` không khiến mẫu tải nó lên. Tìm mã ứng dụng tạo/cập nhật đại lý, kết nối các hướng dẫn bạn đã xem xét ở đó, và xác minh phiên bản đại lý kết quả trước khi thử nghiệm. Hướng dẫn không thể cấp quyền truy cập dữ liệu hoặc công cụ mà bạn chưa thực hiện.

Thực hiện một thay đổi mỗi lần, triển khai lại các thành phần bị ảnh hưởng và chạy lại các câu hỏi và đánh giá cơ bản của bạn. Giữ một phiên bản làm việc để so sánh. Để lấy cảm hứng kiến trúc, xem [bản thiết kế bán lẻ](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), đây cũng không phải là một ứng dụng bán lẻ hoàn chỉnh.

!!! quote "VÀO CUỐI BÀI THỰC HÀNH NÀY BẠN SẼ CÓ"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Tiếp tục đến [Phá dỡ Cơ sở Hạ tầng](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->