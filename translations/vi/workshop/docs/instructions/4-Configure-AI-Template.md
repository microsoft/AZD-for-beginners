# 4. Cấu Hình Mẫu

!!! tip "VÀO CUỐI MODULE NÀY BẠN SẼ CÓ THỂ"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Bắt đầu với mẫu thực tế

Mở [`azure.yaml` trong Bắt đầu với AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) trong kho lưu trữ bạn đã khởi tạo. Mẫu gốc có thể thay đổi độc lập với hội thảo này. Đoạn trích **dưới đây** đã được kiểm tra ngày 4 tháng 11 năm 2026; nó không thay thế cho tệp đầy đủ:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` xác định dự án AZD; `metadata.template` ghi lại phiên bản mẫu.
- `requiredVersions.azd` là mức tối thiểu của mẫu, không phải đề xuất dùng CLI cũ. Sử dụng phiên bản AZD hiện tại được hỗ trợ.
- `services` định nghĩa các mục tiêu triển khai ứng dụng. Mẫu này triển khai API Python và frontend dưới dạng một dịch vụ Container Apps.
- `project` là tương đối so với `azure.yaml`.
- `remoteBuild` yêu cầu xây dựng container từ xa. Danh tính của bạn vẫn cần các quyền Azure cần thiết.

Các tệp Bicep của mẫu dưới `infra/`, không chỉ danh sách `services`, khai báo các tài nguyên như Microsoft Foundry, triển khai mô hình, lưu trữ, và AI Search tùy chọn.

## 2. Hiểu các móc vòng đời

Kiểm tra phần `hooks` và các script được tham chiếu trước khi chạy mẫu. Phiên bản được xem xét bao gồm:

| Móc | Mục đích | Hành vi quan trọng |
|------|---------|--------------------|
| `preup` | Xác thực đầu vào môi trường mẫu trước quy trình `up` | Các script shell theo nền tảng có thể dừng quy trình khi thất bại |
| `postdeploy` | Thực thi thiết lập riêng của mẫu sau khi triển khai ứng dụng | Kiểm tra `continueOnError` và kết quả script; một triển khai thành công không chứng minh mọi tác vụ thiết lập đã thành công |

Phiên bản này **không** bao gồm móc `postprovision` / `write_env` cũ đã được trình bày trong tài liệu hội thảo trước đây. Không sao chép tham chiếu móc đến các script không còn tồn tại.

Các khóa móc chọn sự kiện vòng đời; `posix` và `windows` chọn triển khai nền tảng. `shell`, `run`, `interactive`, và `continueOnError` kiểm soát thực thi. Đây là các script có thể thực thi với quyền của bạn, vì vậy hãy xem xét chúng như mã ứng dụng.

Xem [tài liệu móc AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) để biết vòng đời đầy đủ.

## 3. Theo dõi đầu vào môi trường vào hạ tầng

Chạy các lệnh này từ kho mẫu đã được khởi tạo:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Kiểm tra `infra/main.parameters.json` để xem các biến môi trường mà mẫu thực sự sử dụng. Đặt tên tùy ý với `azd env set` không tự động thay đổi một tài nguyên Azure.

Các mặc định được xem xét bao gồm:

| Đầu vào | Mặc định / mục đích |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; đơn vị hạn ngạch tùy thuộc mô hình và loại triển khai |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; tắt trừ khi đã xem xét xử lý dữ liệu |

Đây là đầu vào riêng cho mẫu, không phải cài đặt AZD toàn cục. Kiểm tra [tài liệu hỗ trợ mô hình và khu vực](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) cùng hạn ngạch thuê bao trước khi chọn mô hình, SKU, công suất hoặc vị trí. Đừng hiểu mỗi đơn vị công suất là 1,000 tokens mỗi phút.

Để chọn mô hình trò chuyện khác, cập nhật cùng lúc **tên, phiên bản, định dạng, SKU, và công suất tương thích**, theo [hướng dẫn tùy chỉnh mẫu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Thay đổi chỉ tên có thể để lại phiên bản hoặc loại triển khai không tương thích.

## 4. Thực hành: bật tìm kiếm tùy chọn và truy vết

!!! warning "Các cài đặt này có thể thêm tài nguyên tính phí"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Thay đổi hạ tầng cần cấp phát; `azd deploy` chỉ triển khai các dịch vụ ứng dụng. Để cho lập chỉ mục tìm kiếm và các tùy chọn truy xuất được hỗ trợ, làm theo [hướng dẫn AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Để giám sát, làm theo [hướng dẫn quan sát](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Không bật ghi lại nội dung lời nhắc/phản hồi trên dữ liệu khách hàng thực tế nếu không có sự đồng ý, kiểm soát truy cập, chính sách lưu giữ, và che khuất bắt buộc.

## 5. Tài nguyên hiện có và CI/CD

Để tái sử dụng dự án Foundry, làm theo [hướng dẫn tài nguyên hiện có của mẫu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Cài đặt `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` thay đổi đường đi triển khai; trong trường hợp đó, mẫu không tạo Application Insights hay AI Search cho bạn. Kiểm tra rõ ràng các phụ thuộc, gán vai trò, và triển khai mô hình.

Phần `pipeline.variables` kiểm soát giá trị được truyền vào pipeline tạo ra; nó không phải kho bí mật và không tạo tài nguyên Azure. Ưu tiên mã định danh được quản lý trong ứng dụng và OIDC cho CI/CD. Các tệp môi trường AZD là văn bản thuần và không nên cam kết.

AZD hỗ trợ nhập một tệp dotenv đã được chuẩn bị cục bộ tin cậy:

```bash
azd env set --file .env
```

Xem lại tệp đó trước khi nhập, và không in các tệp môi trường chứa bí mật trong terminal chia sẻ hoặc nhật ký CI.

## 6. Kiểm tra hiểu biết của bạn

- Dịch vụ `azure.yaml` nào triển khai ứng dụng?
- Tham số hạ tầng nào tiêu thụ từng giá trị bạn đã thay đổi?
- Những thay đổi nào yêu cầu cấp phát thay vì chỉ triển khai?
- Khu vực và thuê bao được chọn có hỗ trợ mô hình và hạn ngạch không?
- Tất cả các móc thiết lập có thành công và bạn có thể xác minh hành vi ứng dụng đã triển khai không?

Tiếp tục đến [Tùy chỉnh một Mẫu](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->