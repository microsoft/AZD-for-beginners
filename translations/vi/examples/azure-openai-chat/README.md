# Ứng Dụng Chat Azure OpenAI

**Lộ trình học:** Trung cấp ⭐⭐ | **Thời gian:** 35-45 phút | **Chi phí:** $50-200/tháng

Một ứng dụng chat Azure OpenAI hoàn chỉnh được triển khai bằng Azure Developer CLI (azd). Ví dụ này minh họa việc triển khai GPT-4, truy cập API an toàn và giao diện chat đơn giản.

## 🎯 Bạn Sẽ Học Được Gì

- Triển khai Azure OpenAI Service với mô hình GPT-4  
- Bảo mật khóa API OpenAI bằng Key Vault  
- Xây dựng giao diện chat đơn giản với Python  
- Giám sát việc sử dụng token và chi phí  
- Thực hiện giới hạn tốc độ và xử lý lỗi  

## 📦 Bao Gồm Những Gì

✅ **Azure OpenAI Service** - Triển khai mô hình GPT-4  
✅ **Ứng dụng Chat Python** - Giao diện chat dòng lệnh đơn giản  
✅ **Tích hợp Key Vault** - Lưu trữ khóa API an toàn  
✅ **ARM Templates** - Hạ tầng hoàn chỉnh dưới dạng mã  
✅ **Giám sát chi phí** - Theo dõi việc sử dụng token  
✅ **Giới hạn tốc độ** - Ngăn ngừa việc sử dụng vượt mức  

## Kiến Trúc

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## Yêu Cầu Trước

### Bắt Buộc

- **Azure Developer CLI (azd)** - [Hướng dẫn cài đặt](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **Tài khoản Azure** có quyền truy cập OpenAI - [Yêu cầu quyền truy cập](https://aka.ms/oai/access)  
- **Python 3.9+** - [Tải Python](https://www.python.org/downloads/)  

### Xác Minh Yêu Cầu Trước

```bash
# Kiểm tra phiên bản azd (cần 1.5.0 hoặc cao hơn)
azd version

# Xác minh đăng nhập Azure
azd auth login

# Kiểm tra phiên bản Python
python --version  # hoặc python3 --version

# Xác minh quyền truy cập OpenAI (kiểm tra trong Azure Portal)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Quan trọng:** Azure OpenAI yêu cầu phê duyệt ứng dụng. Nếu bạn chưa đăng ký, hãy truy cập [aka.ms/oai/access](https://aka.ms/oai/access). Thời gian phê duyệt thường mất 1-2 ngày làm việc.

## ⏱️ Thời Gian Triển Khai

| Giai đoạn | Thời gian | Nội dung |
|-----------|-----------|----------|
| Kiểm tra yêu cầu trước | 2-3 phút | Xác minh hạn mức OpenAI khả dụng |
| Triển khai hạ tầng | 8-12 phút | Tạo OpenAI, Key Vault, triển khai mô hình |
| Cấu hình ứng dụng | 2-3 phút | Thiết lập môi trường và phụ thuộc |
| **Tổng cộng** | **12-18 phút** | Sẵn sàng chat với GPT-4 |

**Lưu ý:** Triển khai OpenAI lần đầu có thể mất nhiều thời gian hơn do cần cung cấp mô hình.

## Bắt Đầu Nhanh

```bash
# Điều hướng đến ví dụ
cd examples/azure-openai-chat

# Khởi tạo môi trường
azd env new myopenai

# Triển khai mọi thứ (cơ sở hạ tầng + cấu hình)
azd up
# Bạn sẽ được nhắc:
# 1. Chọn đăng ký Azure
# 2. Chọn vị trí có sẵn OpenAI (ví dụ: eastus, eastus2, westus)
# 3. Chờ 12-18 phút để triển khai

# Cài đặt các phụ thuộc Python
pip install -r requirements.txt

# Bắt đầu trò chuyện!
python chat.py
```

**Kết quả mong đợi:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Xác Minh Triển Khai

### Bước 1: Kiểm Tra Tài Nguyên Azure

```bash
# Xem các tài nguyên đã triển khai
azd show

# Kết quả dự kiến hiển thị:
# - Dịch vụ OpenAI: (tên tài nguyên)
# - Key Vault: (tên tài nguyên)
# - Triển khai: gpt-4
# - Vị trí: eastus (hoặc khu vực bạn đã chọn)
```

### Bước 2: Kiểm Tra API OpenAI

```bash
# Lấy điểm cuối và khóa OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Kiểm tra cuộc gọi API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Phản hồi mong đợi:**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### Bước 3: Xác Minh Truy Cập Key Vault

```bash
# Liệt kê các bí mật trong Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Các bí mật mong đợi:**
- `openai-api-key`  
- `openai-endpoint`  

**Tiêu chí thành công:**
- ✅ Dịch vụ OpenAI được triển khai với GPT-4  
- ✅ Gọi API trả về kết quả hợp lệ  
- ✅ Các bí mật được lưu trữ trong Key Vault  
- ✅ Theo dõi việc sử dụng token hoạt động  

## Cấu Trúc Dự Án

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## Tính Năng Ứng Dụng

### Giao Diện Chat (`chat.py`)

Ứng dụng chat bao gồm:

- **Lịch Sử Hội Thoại** - Duy trì ngữ cảnh giữa các tin nhắn  
- **Đếm Token** - Theo dõi việc sử dụng và ước tính chi phí  
- **Xử Lý Lỗi** - Xử lý giới hạn tốc độ và lỗi API một cách mượt mà  
- **Ước Tính Chi Phí** - Tính toán chi phí theo thời gian thực cho mỗi tin nhắn  
- **Hỗ Trợ Streaming** - Tùy chọn phản hồi dạng streaming  

### Lệnh

Khi chat, bạn có thể sử dụng:  
- `quit` hoặc `exit` - Kết thúc phiên  
- `clear` - Xóa lịch sử hội thoại  
- `tokens` - Hiển thị tổng số token đã sử dụng  
- `cost` - Hiển thị tổng chi phí ước tính  

### Cấu Hình (`config.py`)

Tải cấu hình từ các biến môi trường:  
```python
AZURE_OPENAI_ENDPOINT  # Từ Key Vault
AZURE_OPENAI_API_KEY   # Từ Key Vault
AZURE_OPENAI_MODEL     # Mặc định: gpt-4
AZURE_OPENAI_MAX_TOKENS # Mặc định: 800
```

## Ví Dụ Sử Dụng

### Chat Cơ Bản

```bash
python chat.py
```

### Chat Với Mô Hình Tùy Chỉnh

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat Với Streaming

```bash
python chat.py --stream
```

### Ví Dụ Hội Thoại

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Quản Lý Chi Phí

### Giá Token (GPT-4)

| Mô hình | Đầu vào (mỗi 1K token) | Đầu ra (mỗi 1K token) |
|---------|-------------------------|-----------------------|
| GPT-4   | $0.03                  | $0.06                |
| GPT-3.5-Turbo | $0.0015          | $0.002              |

### Ước Tính Chi Phí Hàng Tháng

Dựa trên mô hình sử dụng:

| Mức sử dụng | Tin nhắn/ngày | Token/ngày | Chi phí hàng tháng |
|-------------|---------------|------------|---------------------|
| **Nhẹ**    | 20 tin nhắn   | 3,000 token | $3-5               |
| **Vừa phải** | 100 tin nhắn | 15,000 token | $15-25            |
| **Nặng**    | 500 tin nhắn  | 75,000 token | $75-125           |

**Chi phí cơ bản hạ tầng:** $1-2/tháng (Key Vault + tính toán tối thiểu)

### Mẹo Tối Ưu Chi Phí

```bash
# 1. Sử dụng GPT-3.5-Turbo cho các nhiệm vụ đơn giản hơn (rẻ hơn 20 lần)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Giảm số lượng token tối đa cho các phản hồi ngắn hơn
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Giám sát việc sử dụng token
python chat.py --show-tokens

# 4. Thiết lập cảnh báo ngân sách
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Giám Sát

### Xem Việc Sử Dụng Token

```bash
# Trong Azure Portal:
# Tài nguyên OpenAI → Số liệu → Chọn "Giao dịch Token"

# Hoặc qua Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Xem Nhật Ký API

```bash
# Luồng nhật ký chẩn đoán
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Truy vấn nhật ký
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Xử Lý Sự Cố

### Vấn Đề: Lỗi "Access Denied"

**Triệu chứng:** 403 Forbidden khi gọi API

**Giải pháp:**
```bash
# 1. Xác minh quyền truy cập OpenAI đã được phê duyệt
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Kiểm tra khóa API có chính xác
azd env get-value AZURE_OPENAI_API_KEY

# 3. Xác minh định dạng URL endpoint
azd env get-value AZURE_OPENAI_ENDPOINT
# Nên là: https://[name].openai.azure.com/
```

### Vấn Đề: "Rate Limit Exceeded"

**Triệu chứng:** 429 Too Many Requests

**Giải pháp:**
```bash
# 1. Kiểm tra hạn ngạch hiện tại
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Yêu cầu tăng hạn ngạch (nếu cần)
# Đi tới Azure Portal → Tài nguyên OpenAI → Hạn ngạch → Yêu cầu tăng

# 3. Thực hiện logic thử lại (đã có trong chat.py)
# Ứng dụng tự động thử lại với thời gian chờ tăng dần
```

### Vấn Đề: "Model Not Found"

**Triệu chứng:** Lỗi 404 khi triển khai

**Giải pháp:**
```bash
# 1. Liệt kê các triển khai có sẵn
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Xác minh tên mô hình trong môi trường
echo $AZURE_OPENAI_MODEL

# 3. Cập nhật tên triển khai chính xác
export AZURE_OPENAI_MODEL=gpt-4  # hoặc gpt-35-turbo
```

### Vấn Đề: Độ Trễ Cao

**Triệu chứng:** Thời gian phản hồi chậm (>5 giây)

**Giải pháp:**
```bash
# 1. Kiểm tra độ trễ khu vực
# Triển khai đến khu vực gần người dùng nhất

# 2. Giảm max_tokens để có phản hồi nhanh hơn
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Sử dụng streaming để cải thiện trải nghiệm người dùng
python chat.py --stream
```

## Thực Hành Bảo Mật

### 1. Bảo Vệ Khóa API

```bash
# Không bao giờ cam kết khóa vào kiểm soát nguồn
# Sử dụng Key Vault (đã được cấu hình)

# Xoay vòng khóa thường xuyên
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Thực Hiện Lọc Nội Dung

```python
# Azure OpenAI bao gồm bộ lọc nội dung tích hợp
# Cấu hình trong Azure Portal:
# Tài nguyên OpenAI → Bộ lọc nội dung → Tạo bộ lọc tùy chỉnh

# Danh mục: Thù hận, Tình dục, Bạo lực, Tự làm hại
# Mức độ: Lọc thấp, trung bình, cao
```

### 3. Sử Dụng Managed Identity (Sản Xuất)

```bash
# Đối với triển khai sản xuất, sử dụng danh tính được quản lý
# thay vì khóa API (yêu cầu ứng dụng được lưu trữ trên Azure)

# Cập nhật infra/openai.bicep để bao gồm:
# identity: { type: 'SystemAssigned' }
```

## Phát Triển

### Chạy Cục Bộ

```bash
# Cài đặt các phụ thuộc
pip install -r src/requirements.txt

# Thiết lập các biến môi trường
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Chạy ứng dụng
python src/chat.py
```

### Chạy Kiểm Tra

```bash
# Cài đặt các phụ thuộc kiểm tra
pip install pytest pytest-cov

# Chạy kiểm tra
pytest tests/ -v

# Với phạm vi kiểm tra
pytest tests/ --cov=src --cov-report=html
```

### Cập Nhật Triển Khai Mô Hình

```bash
# Triển khai phiên bản mô hình khác
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## Dọn Dẹp

```bash
# Xóa tất cả các tài nguyên Azure
azd down --force --purge

# Điều này sẽ xóa:
# - Dịch vụ OpenAI
# - Key Vault (với xóa mềm 90 ngày)
# - Nhóm tài nguyên
# - Tất cả các triển khai và cấu hình
```

## Bước Tiếp Theo

### Mở Rộng Ví Dụ Này

1. **Thêm Giao Diện Web** - Xây dựng frontend React/Vue  
   ```bash
   # Thêm dịch vụ frontend vào azure.yaml
   # Triển khai lên Azure Static Web Apps
   ```

2. **Thực Hiện RAG** - Thêm tìm kiếm tài liệu với Azure AI Search  
   ```python
   # Tích hợp Azure Cognitive Search
   # Tải lên tài liệu và tạo chỉ mục vector
   ```

3. **Thêm Gọi Hàm** - Kích hoạt sử dụng công cụ  
   ```python
   # Định nghĩa các hàm trong chat.py
   # Cho phép GPT-4 gọi các API bên ngoài
   ```

4. **Hỗ Trợ Nhiều Mô Hình** - Triển khai nhiều mô hình  
   ```bash
   # Thêm gpt-35-turbo, các mô hình embeddings
   # Triển khai logic định tuyến mô hình
   ```

### Các Ví Dụ Liên Quan

- **[Retail Multi-Agent](../retail-scenario.md)** - Kiến trúc đa tác nhân nâng cao  
- **[Ứng Dụng Cơ Sở Dữ Liệu](../../../../examples/database-app)** - Thêm lưu trữ dữ liệu lâu dài  
- **[Ứng Dụng Container](../../../../examples/container-app)** - Triển khai dưới dạng dịch vụ container  

### Tài Nguyên Học Tập

- 📚 [Khóa Học AZD Cho Người Mới Bắt Đầu](../../README.md) - Trang chính của khóa học  
- 📚 [Tài Liệu Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - Tài liệu chính thức  
- 📚 [Tham Chiếu API OpenAI](https://platform.openai.com/docs/api-reference) - Chi tiết API  
- 📚 [AI Có Trách Nhiệm](https://www.microsoft.com/ai/responsible-ai) - Thực hành tốt nhất  

## Tài Nguyên Bổ Sung

### Tài Liệu
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Hướng dẫn đầy đủ  
- **[Mô Hình GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Khả năng của mô hình  
- **[Lọc Nội Dung](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Tính năng an toàn  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Tham chiếu azd  

### Hướng Dẫn
- **[Bắt Đầu Nhanh OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Triển khai đầu tiên  
- **[Hoàn Thành Chat](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Xây dựng ứng dụng chat  
- **[Gọi Hàm](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Tính năng nâng cao  

### Công Cụ
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Playground trên web  
- **[Hướng Dẫn Prompt Engineering](https://platform.openai.com/docs/guides/prompt-engineering)** - Viết prompt tốt hơn  
- **[Máy Tính Token](https://platform.openai.com/tokenizer)** - Ước tính việc sử dụng token  

### Cộng Đồng
- **[Azure AI Discord](https://discord.gg/azure)** - Nhận trợ giúp từ cộng đồng  
- **[Thảo Luận GitHub](https://github.com/Azure-Samples/openai/discussions)** - Diễn đàn Hỏi & Đáp  
- **[Blog Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Cập nhật mới nhất  

---

**🎉 Thành Công!** Bạn đã triển khai Azure OpenAI và xây dựng một ứng dụng chat hoạt động. Hãy bắt đầu khám phá khả năng của GPT-4 và thử nghiệm với các prompt và trường hợp sử dụng khác nhau.

**Câu hỏi?** [Mở một vấn đề](https://github.com/microsoft/AZD-for-beginners/issues) hoặc kiểm tra [Câu hỏi thường gặp](../../resources/faq.md)

**Cảnh báo chi phí:** Hãy nhớ chạy `azd down` khi hoàn tất thử nghiệm để tránh các khoản phí liên tục (~$50-100/tháng cho việc sử dụng hoạt động).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->