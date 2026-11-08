# Khung cơ sở hạ tầng đa tác nhân cho Bán lẻ

**Ví dụ kiến trúc nâng cao — không phải ứng dụng đa tác nhân hoạt động.**

[Trang khóa học](../../README.md) ·
[Chương 5](../../docs/chapter-05-multi-agent/README.md) ·
[Bản thiết kế kiến trúc](../retail-scenario.md)

## Những gì được triển khai

Thư mục này chứa một mẫu ARM, các tham số, và một script triển khai Bash.
Không có **`azure.yaml` hoặc mã nguồn ứng dụng bán lẻ**.

| Tài nguyên | Trạng thái thực tế sau khi triển khai |
|---|---|
| Tài khoản Azure OpenAI chính | Triển khai `gpt-4.1-chat` sử dụng phiên bản `gpt-4.1` `2025-04-14`, `GlobalStandard` |
| Tài khoản OpenAI phụ (tùy chọn) | `gpt-4.1-mini-inventory`, mô hình `gpt-4.1-mini` phiên bản `2025-04-14`, `GlobalStandard` |
| Tài khoản Embeddings (tùy chọn) | `text-embedding-ada-002` phiên bản `2`, `Standard`; không có pipeline lập chỉ mục |
| Tài khoản Grader OpenAI | `gpt-4.1-grader`, mô hình `gpt-4.1` phiên bản `2025-04-14`, `GlobalStandard`; không có evaluator |
| AI Search | Dịch vụ trống; không có index hay tài liệu |
| Storage | Các container blob `documents` và `uploads` trống |
| Cosmos DB | Tài khoản serverless, cơ sở dữ liệu `chathistory`, container `conversations` phân vùng theo `/userId`, TTL mục 30 ngày |
| Container Apps | Router và frontend đều chạy `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` trên cổng 80 |
| Key Vault (tùy chọn) | Kho trống được bật RBAC; **không có bí mật hay phân quyền vai trò** |
| Application Insights / Log Analytics (tùy chọn) | Thu thập nhật ký tài nguyên và môi trường; không có instrumentation ứng dụng tùy chỉnh, cảnh báo, hay dashboard |
| Document Intelligence | Tài khoản S0; không có quy trình xử lý tài liệu |

Bing Search v7 kế thừa đã ngừng hoạt động vào ngày 11 tháng 8 năm 2025 và **không được cấp phát**.
Không có tích hợp thay thế web-grounding được thực hiện.

**Không bao gồm:** đại lý khách hàng/kho, API router `/chat`, giao diện trò chuyện frontend,
sơ đồ tìm kiếm hoặc script nhập liệu, Azure Container Registry, điểm cuối riêng tư,
danh tính được quản lý, phân quyền RBAC, tự động chuyển đổi khi sự cố, Front Door, bộ quét red-team,
CLI đánh giá, xác thực, hoặc CI/CD.

Thông báo thành công ARM chỉ xác nhận việc cấp phát tài nguyên. Nó không chứng nhận
chức năng ứng dụng, bảo mật, khả dụng, hay sẵn sàng cho sản xuất.

## Yêu cầu và chi phí

- Bash (Git Bash/WSL trên Windows) và
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Một đăng ký có quyền tạo tất cả tài nguyên được liệt kê.
- Kiểm tra tính khả dụng của **mỗi mô hình/phiên bản/SKU trong mỗi khu vực đã chọn** và
  hạn ngạch cho đăng ký của bạn. Mặc định là ví dụ, không phải đảm bảo.
  Tham khảo [tính khả dụng mô hình](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Chọn một nhóm tài nguyên chuyên dụng mà bạn có thể xóa sau khi thử nghiệm.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Vị trí mặc định: `eastus2` chính, `westus2` phụ, `francecentral` embeddings;
grader mặc định ở vùng chính trừ khi `graderLocation` được cung cấp.
`--no-multi-region` bỏ qua tài khoản phụ và embeddings; không bỏ qua tài khoản
grader.

Search tính phí khi được cấp phát ngay cả khi trống. Số bản sao container tối thiểu,
độ dư thừa lưu trữ, yêu cầu/lưu trữ Cosmos DB, token mô hình, cuộc gọi Document Intelligence
và nhập liệu/lưu trữ nhật ký có thể phát sinh phí. Không có **tổng cố định hoặc xác thực
hàng tháng**. Ước tính SKU chính xác trong
[máy tính giá Azure](https://azure.microsoft.com/pricing/calculator/) và
cấu hình ngân sách trước khi triển khai.

### Chế độ triển khai

Các thiết lập này là kích thước tài nguyên, **không phải chứng nhận sản xuất hoặc SLA**:

| Chế độ | Đơn vị công suất chat / mini / embedding / grader | Bản sao Router | Bản sao Frontend | Cấp độ Search | Storage |
|---|---|---|---|---|---|
| tối thiểu | 10 / 10 / 20 / 5 | 0–3 | 1–2 | cơ bản, 1 bản sao | Standard_LRS |
| chuẩn | 20 / 15 / 30 / 15 | 1–3 | 1–2 | chuẩn, 1 bản sao | Standard_ZRS |
| cao cấp | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 bản sao | Standard_GRS |

Đơn vị công suất mô hình là theo mô hình/SKU; không cộng chúng như một bảo đảm TPM chung.
Cao cấp không cho phép Container Apps dự phòng theo vùng: điều đó cần
thiết kế mạng bổ sung. Search cơ bản hỗ trợ tìm kiếm vector, tùy thuộc vào
giới hạn dịch vụ; không hoàn toàn không tương thích với vector.

## 🚀 Triển khai nhanh

Xem lại `azuredeploy.json` và `azuredeploy.parameters.json` trước. Các lệnh
bên dưới **tạo tài nguyên Azure có phí**; không phải kiểm tra offline.

Từ thư mục gốc của kho lưu trữ:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Script sử dụng đường dẫn tương đối với thư mục của chính nó, kiểm tra đăng nhập/công cụ/tham số,
tạo nhóm tài nguyên nếu chưa có, xác thực triển khai, cấp phát, và
hiển thị kết quả không bí mật. Không yêu cầu hoặc thực hiện việc `jq`, điền dữ liệu, lấy bí mật, hoặc
thiết lập ứng dụng sau triển khai.

Giá trị dòng lệnh mặc định của script ghi đè giá trị tương ứng trong
file tham số. Chỉnh sửa file tham số cho các thiết lập như vùng phụ/bên thứ ba;
sử dụng triển khai CLI trực tiếp nếu cần ghi đè tham số tùy ý:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

Việc cấp phát có thể mất 15–45 phút hoặc lâu hơn, và có thể thất bại do hạn ngạch khu vực hoặc
các hạn chế vòng đời mô hình. Không thử lại một cách mù quáng: hãy đọc lỗi vận hành trước.

## Tùy chọn cấu hình

| Tham số | Mặc định trong mẫu | Ý nghĩa |
|---|---|---|
| `projectName` | Bắt buộc (`retail` trong file tham số) | 3–10 chữ thường hoặc chữ số |
| `location` | Vị trí nhóm tài nguyên | Vùng chính (`eastus2` trong file tham số) |
| `secondaryLocation` | `westus2` | Vùng tài khoản mô hình mini |
| `tertiaryLocation` | `francecentral` | Vùng tài khoản embeddings |
| `graderLocation` | Vùng chính | Vùng tài khoản grader độc lập |
| `environmentName` | `dev` | `dev`, `staging`, hoặc `prod`; chỉ tên, không phải công tắc bảo mật |
| `deploymentMode` | `standard` | Lựa chọn SKU/công suất |
| `enableMultiRegion` | `true` | Thêm tài khoản phụ và embeddings |
| `enableMonitoring` | `true` | Thêm Insights/workspace và thu thập nhật ký môi trường |
| `enableSecurity` | `true` | Tạo kho được bật RBAC trống chỉ |

Tham số `openAiApiVersion` gây nhầm lẫn đã bị loại bỏ: phiên bản API dữ liệu không
kiểm soát phiên bản tài nguyên ARM hoặc phiên bản mô hình. Cặp tên/phiên bản mô hình
nằm trong `variables.modelDeployments`; kiểm tra chúng cùng SKU triển khai.

## Xác minh cấp phát

Sử dụng tên triển khai từ đầu ra của script hoặc `az deployment group list`.
Đối với triển khai trực tiếp ở trên:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Mong đợi: trạng thái triển khai `Succeeded`. Nếu thất bại, kiểm tra chi tiết lỗi vận hành.
Chỉ xuất danh sách tài nguyên không phải kiểm tra trạng thái cấp phát đáng tin cậy.

Kiểm tra đại diện **root**, không phải điểm cuối đại lý không tồn tại:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Mong đợi: trang hello-world HTTP 200, **không phải phản hồi chat**. Lỗi HTTP không
tính là xác minh thành công.

Để thử suy luận mô hình chính thực (có phí):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

Mong đợi: JSON với `choices` và `usage`. Tên triển khai là
`gpt-4.1-chat`, không phải tên mô hình nền `gpt-4.1`.

## 🔧 Sau triển khai: bước tiếp theo

Đây là **danh sách phát triển**, không phải bài tập hoàn chỉnh:

1. Triển khai đại lý khách hàng/kho được xác thực và hợp đồng router.
2. Triển khai frontend và xác thực cấu hình của nó.
3. Tạo và điền một chỉ mục tìm kiếm với chiều/cấu hình phù hợp mô hình embedding của bạn,
   và xử lý lỗi cũng như cập nhật tài liệu.
4. Tạo registry và cấu hình danh tính/ quyền rút ảnh.
5. Xây dựng và đẩy ảnh thực. Thay đổi cổng ingress Container App và các probe cho phù hợp với
   ảnh đó trước khi thử nghiệm; cổng 80 ở đây là của các phần giữ chỗ.
6. Cấu hình bí mật hoặc danh tính được quản lý và các vai trò vùng để dữ liệu. Không
   tham chiếu tên bí mật ảo: mẫu này không tạo bí mật ứng dụng.
7. Instrument ứng dụng, cấu hình cảnh báo, thử nghiệm thất bại/phục hồi, và đánh giá
   kết quả với dữ liệu thật đại diện và đánh giá con người.

Xem [kiến trúc tổng thể](../retail-scenario.md) để biết ranh giới thiết kế.

## Xử lý sự cố và ranh giới bảo mật

- **Mô hình không khả dụng:** kiểm tra mô hình/phiên bản/SKU, khu vực, và hạn ngạch đăng ký;
  script không kiểm tra trước danh mục mô hình.
- **Giám sát bị tắt:** đích nhật ký môi trường là `none`, không phải
  cấu hình Log Analytics trống không hợp lệ.
- **Chỉ phần giữ chỗ:** `/chat`, đánh giá đại lý, và nhập tệp không tồn tại.
- **Mạng/danh tính:** điểm cuối công khai và xác thực cục bộ được bật.
  Chỉ bật RBAC Key Vault không tạo phân quyền vai trò hay danh tính.
- **Sản xuất:** thêm xác thực, danh tính được giới hạn, quản lý bí mật,
  mạng riêng khi thích hợp, thiết kế khả dụng, và kiểm tra vận hành.
  Các tài khoản mô hình đa vùng không tự động cung cấp dự phòng.

## Dọn dẹp

Không có dự án AZD ở đây; `azd down` không phải lệnh dọn dẹp.
Sau khi kiểm tra nhóm chỉ chứa tài nguyên học tập của bạn:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Mong đợi sau khi xóa hoàn tất: `false`. Tài nguyên Key Vault và Cognitive Services
bị xóa mềm có thể giữ tên; xoá vĩnh viễn cần quyền phù hợp.
Kiểm tra Cost Management cho các khoản phí sử dụng bị trì hoãn.

[Báo cáo vấn đề](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->