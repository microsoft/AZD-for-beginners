# 5. Tùy chỉnh một Mẫu

!!! tip "CUỐI MODULE NÀY BẠN SẼ CÓ THỂ"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Thiết lập điểm chuẩn

Sử dụng kho lưu trữ đã khởi tạo [Bắt đầu với tác nhân AI](https://github.com/Azure-Samples/get-started-with-ai-agents) từ các module trước. Ghi lại phiên bản mẫu, phiên bản AZD, môi trường đã chọn, triển khai mô hình và các câu hỏi mẫu đang hoạt động trước khi thay đổi bất cứ điều gì.

Mẫu này hiện thực một ứng dụng trò chuyện có tác nhân hỗ trợ. Nó **không** trở thành hệ thống bán lẻ hai tác nhân chỉ bằng cách đặt biến môi trường hoặc lưu thêm các tệp hướng dẫn. Các tác nhân bổ sung, trình xử lý công cụ, luồng điều hướng, phân quyền và truy cập dữ liệu yêu cầu mã ứng dụng.

Kiểm tra các hướng dẫn và công cụ của tác nhân đang được triển khai trong Foundry. Thử một câu hỏi có sự thật, một câu hỏi truy xuất, và một câu hỏi mà dữ liệu mẫu không thể trả lời. Xác minh các trích dẫn với các tài liệu nguồn thực tế thay vì giả định câu trả lời mượt mà là chính xác.

## 5.2 Tùy chỉnh truy xuất kiến thức

Mẫu hỗ trợ truy xuất dựa trên tệp và tích hợp tùy chọn Azure AI Search. Tham khảo [hướng dẫn AI Search hiện tại](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) để lập chỉ mục và cấu hình công cụ.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Kích hoạt dịch vụ chỉ là một phần của truy xuất. Trước khi tải dữ liệu của bạn lên:

1. Xác nhận bạn có quyền sử dụng các tài liệu và loại bỏ thông tin nhạy cảm.
2. Chọn một mô hình nhúng được hỗ trợ tại khu vực của bạn và đặt phiên bản, loại triển khai và kích thước vector tương thích.
3. Tạo/điền dữ liệu cho chỉ mục theo quy trình được tài liệu trong mẫu.
4. Cấu hình công cụ truy xuất của tác nhân để sử dụng chỉ mục đó.
5. Kiểm tra truy xuất, trích dẫn, phân quyền và cách hành xử khi không có tài liệu liên quan.

Đừng chuyển từ `text-embedding-3-small` sang mô hình nhúng khác mà không kiểm tra kích thước và xây dựng/lập chỉ mục lại các vector khi cần thiết. Một tên như `retail-products` không phải là danh mục đã triển khai hay chính sách kiểm soát truy cập.

## 5.3 Theo dõi và giám sát

Tham khảo [hướng dẫn quan sát mẫu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Đảm bảo tài nguyên Application Insights cần thiết và kết nối đã tồn tại; nếu thay đổi thiết lập hạ tầng, sử dụng `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Gửi một yêu cầu thử nghiệm, sau đó kiểm tra nhật ký ứng dụng của Container App và chế độ xem theo dõi của tác nhân trong Foundry. Kiểm tra độ trễ, các cuộc gọi công cụ, lỗi, và mối liên hệ giữa yêu cầu và bản vết. Đừng cho rằng telemetry được kết nối chỉ vì việc triển khai thành công.

Giữ `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` ở trạng thái tắt trừ khi bạn đã xem xét rõ ràng về sự đồng ý, biên tập, lưu trữ và kiểm soát truy cập. Các bản vết có thể chứa tham số công cụ nhạy cảm hoặc nội dung tài liệu ngay cả khi nhật ký ứng dụng thông thường có vẻ vô hại.

## 5.4 Đánh giá tác nhân

Điểm vào đánh giá của mẫu là [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), không phải thư mục `evals/`. Từ thư mục gốc mẫu, sử dụng môi trường Python đáp ứng các yêu cầu được tài liệu:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Trước khi chạy, hoàn thành các [yêu cầu trước đánh giá](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Các bài kiểm tra tải cấu hình từ `.azure/<environment>/.env` đã chọn; xác nhận môi trường dự kiến được chọn. Các đầu vào quan trọng bao gồm:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, sử dụng định dạng yêu cầu bởi mẫu hiện tại (phiên bản đã xem xét dùng `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, dùng làm triển khai mô hình đánh giá

Kiểm tra các bài kiểm tra để hiểu lựa chọn đánh giá viên, ngưỡng, vai trò cần thiết, và chi phí mô hình. Một lần chạy hoàn chỉnh không tự động là cửa kiểm chất lượng đạt; kiểm tra điểm số, trường hợp thất bại/lỗi và kết quả Foundry được liên kết.

### Phần mở rộng đánh giá AZD riêng biệt

Bài kiểm tra Python ở trên là **quy trình làm việc đặc thù cho mẫu**. Phần mở rộng tùy chọn `azure.ai.evaluations` là một quy trình làm việc khác, có cấu hình `evals/azure.eval.yaml` riêng. Nó được cài đặt riêng, không bao gồm trong gói `microsoft.foundry` 1.0 có sẵn chung:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Để cài đặt phần mở rộng hoàn chỉnh, xem [quy trình đánh giá và di chuyển](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Kể từ phần mở rộng agents beta.22, không sử dụng các lệnh `azd ai agent eval` đã bị loại bỏ. Cài đặt phần mở rộng đánh giá không chuyển đổi các bài kiểm tra Python của mẫu hoặc tự động tạo cấu hình đánh giá.

Đối với **bài tập tác nhân được lưu trữ GA riêng biệt**, sử dụng thư mục trống ngoài mẫu của workshop này và làm theo [hướng dẫn Foundry từ cục bộ lên đám mây](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Nó sử dụng AZD 1.37.0+, gói `microsoft.foundry`, Python 3.13+, và uv hiện tại. Bạn sẽ kiểm tra `azure.yaml`, thử nghiệm cục bộ với Agent Inspector, triển khai mã nguồn cho bản dựng Foundry từ xa, và tạo/xem xét bộ dữ liệu cùng thang đánh giá trước khi cấu hình `azd ai eval init --name quality`. Đừng thay thế các bài kiểm tra mẫu này hoặc giả định cài đặt gói sẽ thay đổi mô hình lưu trữ.

## 5.5 Đội đỏ AI và đánh giá liên tục

Mẫu hiện tại cung cấp [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Hoàn thành các yêu cầu trước và xem xét mục tiêu dự kiến cùng chi phí trước khi chạy:

```bash
pytest tests/test_red_teaming.py -s
```

Sử dụng bản triển khai test được ủy quyền và dữ liệu tổng hợp. Xem lại các cuộc tấn công và kết quả tạo ra; việc quét này không xác nhận rằng ứng dụng an toàn hoặc tuân thủ.

Hướng dẫn [quan sát](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) cũng mô tả đánh giá liên tục được cấu hình khi khởi động container. Nó đánh giá các tương tác người dùng thực tế, không phải lưu lượng thử nghiệm được tạo ra, và hỗ trợ đánh giá thay đổi theo vùng miền. Không có tương tác nghĩa là không có mục đánh giá nào. Xác nhận phiên bản mẫu đã cài đặt và cấu hình trình đánh giá thay vì giả định mỗi triển khai đều có mặc định giống nhau.

Xác thực tách biệt với đánh giá. Làm theo thiết lập định danh/truy cập đã được ghi chép trong mẫu. Không có “dự phòng xác thực cơ bản” được ghi chép để dựa vào nhằm bảo vệ một điểm cuối công khai.

## 5.6 Bài tập thiết kế: tùy chỉnh bán lẻ

!!! warning "Bài tập thiết kế, không phải triển khai hoàn chỉnh"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Viết một kế hoạch ngắn đề cập đến:

| Khu vực | Quyết định và bằng chứng cần thu thập |
|------|----------------------------------|
| Trách nhiệm của đại lý | Bắt đầu với một đại lý, hoặc chứng minh lý do cho đại lý Shopper và Loyalty riêng biệt cùng logic định tuyến |
| Dữ liệu | Định nghĩa bộ dữ liệu danh mục/phần thưởng tổng hợp và quyền sở hữu các cập nhật |
| Công cụ | Triển khai trình xử lý chỉ đọc trước; chỉ định ủy quyền và kiểm tra cho bất kỳ thao tác ghi nào |
| Mô hình | Chọn các kết hợp mô hình/phiên bản/SKU có sẵn và xác minh hạn ngạch; tránh cấp phát mô hình không dùng |
| Truy xuất | Định nghĩa đánh chỉ mục, kích thước nhúng, trích dẫn và kiểm soát truy cập cấp tài liệu |
| Đánh giá | Thêm các trường hợp câu trả lời mong đợi, câu hỏi không hỗ trợ, sử dụng công cụ và an toàn với ngưỡng rõ ràng |
| Vận hành | Định nghĩa giám sát, ngân sách độ trễ/lỗi, giới hạn chi phí và quyền sở hữu dọn dẹp |

Lưu `custom-agents/shopper-agent-instructions.md` không làm mẫu tải nó. Tìm mã ứng dụng tạo/cập nhật đại lý, kết nối hướng dẫn bạn đã kiểm tra ở đó và xác minh phiên bản đại lý kết quả trước khi thử nghiệm. Hướng dẫn không thể cấp quyền truy cập dữ liệu hoặc công cụ bạn chưa triển khai.

Áp dụng một thay đổi mỗi lần, triển khai lại các thành phần liên quan và chạy lại các câu hỏi cơ bản cùng đánh giá của bạn. Giữ một phiên bản làm việc để đối chiếu. Để lấy cảm hứng kiến trúc, xem [mẫu bán lẻ](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), cũng không phải ứng dụng bán lẻ hoàn chỉnh.

!!! quote "CUỐI LAB NÀY BẠN SẼ CÓ"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Tiếp tục đến [Gỡ bỏ Cơ sở hạ tầng](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->