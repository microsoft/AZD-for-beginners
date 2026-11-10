# Ví dụ — Nguồn tiếng Anh và Mẫu Azure

Đây là các mẫu học tập, không phải ứng dụng đã được chứng nhận sản xuất. Đọc kỹ
các yêu cầu, giới hạn, chi phí và hướng dẫn dọn dẹp của từng ví dụ trước khi
chạy các lệnh. Cần kiểm tra tính khả dụng và hạn mức của Azure trong đăng ký của bạn.

- [Trang khóa học](../README.md)
- [Cài đặt](../docs/chapter-01-foundation/installation.md)
- [Khắc phục sự cố](../docs/chapter-07-troubleshooting/common-issues.md)

## Những gì thực sự tồn tại trên máy cục bộ

Có **bốn mẫu ứng dụng** và **một khung hạ tầng**:

| Ví dụ | Triển khai cục bộ | Trọng tâm học tập | Cấp độ |
|---|---|---|---|
| [API Flask đơn giản](../../../examples/container-app/simple-flask-api) | API CRUD Flask, Dockerfile, Bicep, `azure.yaml` | Triển khai container, probes, nhật ký | Người mới bắt đầu |
| [Microservices hai dịch vụ](../../../examples/container-app/microservices) | Gateway Node.js và dịch vụ sản phẩm Python chỉ đọc, Dockerfiles, Bicep, `azure.yaml` | Giao tiếp HTTPS nội bộ, mở rộng độc lập | Trung cấp |
| [Ứng dụng cơ sở dữ liệu](../../../examples/database-app) | API đọc Flask, Azure SQL, App Service, Bicep, `azure.yaml` | Kết nối SQL, khởi tạo, nhật ký | Trung cấp |
| [Chat Azure OpenAI](../../../examples/azure-openai-chat) | CLI Python cục bộ, Bicep Azure OpenAI và Key Vault, chỉ hạ tầng `azure.yaml` | Cung cấp mô hình, lịch sử trò chuyện, ước tính token | Trung cấp |
| [Hạ tầng bán lẻ](../../../examples/retail-multiagent-arm-template) | Mẫu ARM, tham số, script triển khai Bash; chỉ **container hello-world** | Hạ tầng cho ứng dụng đa tác vụ trong tương lai | Nâng cao |

Kịch bản [bán lẻ](retail-scenario.md) là một **bản thiết kế kiến trúc**, không phải là
triển khai đa tác nhân hoàn chỉnh. Không có mã đại lý bán lẻ, giao diện trò chuyện, bộ định tuyến
API, đường ống dữ liệu tìm kiếm, CLI đánh giá, failover tự động, hoặc củng cố môi trường sản xuất đều được bao gồm. Những điều này phải được thiết kế, xây dựng và kiểm tra riêng biệt.


Tổng quan về [microservices](microservices/README.md) chỉ đến phần có thể chạy được
mẫu hai dịch vụ; nó không phải là một thư mục triển khai khác.

## Lộ trình học được đề xuất

1. Triển khai API Flask và xác minh `/health` cũng như các thao tác CRUD.
2. Triển khai ứng dụng cơ sở dữ liệu và kiểm tra năm sản phẩm mẫu.
3. Triển khai ví dụ hai dịch vụ và xác minh các yêu cầu từ gateway đến sản phẩm.
4. Cấp phát tài nguyên chat và chạy CLI tương tác **tại máy**.
5. Nghiên cứu bản thiết kế bán lẻ sau khi hoàn thành các ví dụ làm việc.

Dành khoảng 30–60 phút cho mỗi mẫu ứng dụng bao gồm các điều kiện tiên quyết và
xác minh. Việc triển khai bán lẻ là một dự án phát triển riêng biệt, không phải là một 
hội thảo 30 phút. Việc đọc kiến trúc của nó mất khoảng 2–3 giờ; việc triển khai
và sẵn sàng cho sản xuất có thể mất lâu hơn đáng kể so với
80–120 giờ phát triển minh họa trong hướng dẫn.

## Bắt đầu nhanh

Từ thư mục gốc của kho lưu trữ, đối với mẫu container đầu tiên:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Mong đợi: HTTP 200 và JSON chứa `"status": "healthy"`.
Bạn cần Docker đang chạy để xây dựng container cục bộ.

Đối với chat, làm theo [chat README](azure-openai-chat/README.md): sử dụng
`azd provision`, tải khóa API từ Key Vault vào shell hiện tại, cài đặt
`src/requirements.txt`, và chạy `python src/chat.py`. Không có dịch vụ trò chuyện được lưu trữ.

Đối với bán lẻ, sử dụng [hướng dẫn ARM](retail-multiagent-arm-template/README.md).
Nó không có `azure.yaml` và **không** được triển khai hoặc loại bỏ bởi `azd up`/`azd down`.

## Chi phí và hạn chế

- Tất cả các triển khai tạo ra các tài nguyên Azure có phí. Chỉ số hóa theo quy mô về 0 áp dụng cho
  tính toán ứng dụng; nó không loại bỏ chi phí đăng ký, cơ sở dữ liệu, lưu trữ, tìm kiếm hoặc nhật ký.
- Giá chính xác phụ thuộc vào khu vực, tiền tệ, lưu lượng, mô hình/SKU, và giữ lại.
  Sử dụng [máy tính giá Azure](https://azure.microsoft.com/pricing/calculator/)
  trước khi triển khai và cấu hình ngân sách trong Azure Cost Management.
- Dữ liệu CRUD Flask nằm trong bộ nhớ, giới hạn ở một worker và tối đa một bản sao theo
  mặc định. Nó biến mất khi khởi động lại hoặc khi tỉ lệ về 0. Đây không phải là lưu trữ bền vững.
- Microservice sản phẩm chỉ cung cấp các điểm cuối GET. Không có dịch vụ đơn đặt hàng, người dùng,
  cơ sở dữ liệu, Service Bus, C#, hoặc triển khai Go được bao gồm.
- Tài nguyên Application Insights không tự động đo lường từng ứng dụng.
  Xem từng ví dụ để biết dữ liệu telemetry thực sự được phát ra.
- Các mẫu không thực hiện xác thực ứng dụng. Thêm định danh, ủy quyền,
  lưu trữ bền vững, kiểm soát mạng, kiểm thử và quy trình vận hành trước khi đưa vào sản xuất.

## Mẫu Azure bên ngoài — sao chép riêng biệt

Các liên kết này là tham chiếu tới các kho lưu trữ riêng biệt, **không phải ví dụ cục bộ**.
Người quản lý của chúng chịu trách nhiệm hướng dẫn cài đặt, triển khai, phụ thuộc, và chi phí.

| Mẫu | Chú ý |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Ứng dụng Node.js với cơ sở dữ liệu |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# và Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Frontend tĩnh với C# Functions và SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Ứng dụng serverless Python |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Backend cửa hàng đóng gói trong container |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | Ứng dụng chat AI |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Ứng dụng agent |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG với tìm kiếm và trích dẫn |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Mẫu AI hội thoại |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Microservices Java |

Khám phá nhiều dự án hơn trong [thư viện mẫu AZD](https://azure.github.io/awesome-azd/).
Đừng cho rằng một dự án bên ngoài hỗ trợ `azd` nếu không kiểm tra README hiện tại của nó.

## Cấu trúc kho lưu trữ

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

Không có thư mục `configurations/`, `scripts/` hoặc thư mục test dùng chung nào được hứa hẹn bởi
chỉ mục này. Các tệp thực tế và ý tưởng mở rộng tùy chọn được xác định trong từng hướng dẫn.

## Dọn dẹp

Đối với bốn mẫu AZD, chạy lệnh này **từ thư mục mẫu đã chọn**:

```bash
azd down
```

Xem lại nhắc xóa. Với ngành bán lẻ, chỉ xóa nhóm tài nguyên riêng
mà bạn đã tạo, sử dụng hướng dẫn trong tài liệu ARM của nó. Kiểm tra Quản lý Chi phí Azure
sau khi dọn dẹp; dữ liệu thanh toán có thể đến muộn hơn.

## Đóng góp

Bao gồm mã nguồn, hạ tầng, cấu hình triển khai, các bước thiết lập và
xác minh khả thi, giới hạn, và hướng dẫn dọn dẹp với mỗi ví dụ ứng dụng.
Đánh dấu rõ ràng tài liệu chỉ về kiến trúc và các đoạn mã chưa hoàn chỉnh.
Không tuyên bố sẵn sàng cho sản xuất nếu chưa có thử nghiệm triển khai, chức năng và vận hành.

[Câu hỏi thường gặp](../resources/faq.md) · [Hướng dẫn học](../resources/study-guide.md) ·
[Báo cáo sự cố](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->