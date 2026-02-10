# Tác nhân AI với Azure Developer CLI

**Chuyển hướng chương:**
- **📚 Trang Khóa học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 2 - Phát Triển Ưu Tiên AI
- **⬅️ Trước**: [Triển khai Mô hình AI](ai-model-deployment.md)
- **➡️ Tiếp theo**: [Thực hành AI cho Môi trường Sản xuất](production-ai-practices.md)
- **🚀 Nâng cao**: [Giải pháp Đa Tác nhân](../../examples/retail-scenario.md)

---

## Giới thiệu

Tác nhân AI là các chương trình tự động có khả năng nhận biết môi trường của chúng, đưa ra quyết định và thực hiện hành động để đạt được các mục tiêu cụ thể. Không giống như các chatbot đơn giản chỉ phản hồi theo lời nhắc, các tác nhân có thể:

- **Sử dụng công cụ** - Gọi API, tìm kiếm cơ sở dữ liệu, thực thi mã
- **Lập kế hoạch và suy luận** - Chia nhiệm vụ phức tạp thành các bước
- **Học từ ngữ cảnh** - Duy trì bộ nhớ và điều chỉnh hành vi
- **Hợp tác** - Làm việc với các tác nhân khác (hệ thống đa tác nhân)

Hướng dẫn này chỉ cho bạn cách triển khai các tác nhân AI lên Azure bằng Azure Developer CLI (azd).

## Mục tiêu học tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Hiểu tác nhân AI là gì và khác biệt so với chatbot như thế nào
- Triển khai các mẫu tác nhân đã xây dựng trước bằng AZD
- Cấu hình Foundry Agents cho các tác nhân tùy chỉnh
- Triển khai các mẫu tác nhân cơ bản (sử dụng công cụ, RAG, đa tác nhân)
- Giám sát và gỡ lỗi các tác nhân đã triển khai

## Kết quả học tập

Sau khi hoàn thành, bạn sẽ có khả năng:
- Triển khai ứng dụng tác nhân AI lên Azure chỉ bằng một lệnh
- Cấu hình công cụ và khả năng cho tác nhân
- Triển khai retrieval-augmented generation (RAG) với tác nhân
- Thiết kế kiến trúc đa tác nhân cho các luồng công việc phức tạp
- Khắc phục các sự cố triển khai tác nhân phổ biến

---

## 🤖 Điều gì khiến một tác nhân khác với một chatbot?

| Tính năng | Chatbot | Tác nhân AI |
|---------|---------|----------|
| **Hành vi** | Trả lời theo lời nhắc | Thực hiện các hành động tự chủ |
| **Công cụ** | Không có | Có thể gọi API, tìm kiếm, thực thi mã |
| **Bộ nhớ** | Chỉ theo phiên | Bộ nhớ tồn tại giữa các phiên |
| **Lập kế hoạch** | Phản hồi đơn lẻ | Suy luận nhiều bước |
| **Hợp tác** | Thực thể đơn lẻ | Có thể làm việc với các tác nhân khác |

### Tương tự đơn giản

- **Chatbot** = Một người hữu ích trả lời câu hỏi tại quầy thông tin
- **Tác nhân AI** = Một trợ lý cá nhân có thể gọi điện, đặt lịch hẹn và hoàn thành công việc cho bạn

---

## 🚀 Bắt đầu nhanh: Triển khai Tác nhân đầu tiên của bạn

### Tùy chọn 1: Mẫu Foundry Agents (Khuyến nghị)

```bash
# Khởi tạo mẫu các tác nhân AI
azd init --template get-started-with-ai-agents

# Triển khai lên Azure
azd up
```

**Những gì được triển khai:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (cho RAG)
- ✅ Azure Container Apps (giao diện web)
- ✅ Application Insights (giám sát)

**Thời gian:** ~15-20 phút
**Chi phí:** ~$100-150/tháng (phát triển)

### Tùy chọn 2: Tác nhân OpenAI với Prompty

```bash
# Khởi tạo mẫu tác nhân dựa trên Prompty
azd init --template agent-openai-python-prompty

# Triển khai lên Azure
azd up
```

**Những gì được triển khai:**
- ✅ Azure Functions (thực thi tác nhân không máy chủ)
- ✅ Azure OpenAI
- ✅ Tệp cấu hình Prompty
- ✅ Ví dụ triển khai tác nhân

**Thời gian:** ~10-15 phút
**Chi phí:** ~$50-100/tháng (phát triển)

### Tùy chọn 3: Tác nhân Chat RAG

```bash
# Khởi tạo mẫu chat RAG
azd init --template azure-search-openai-demo

# Triển khai lên Azure
azd up
```

**Những gì được triển khai:**
- ✅ Azure OpenAI
- ✅ Azure AI Search với dữ liệu mẫu
- ✅ Quy trình xử lý tài liệu
- ✅ Giao diện trò chuyện với trích dẫn

**Thời gian:** ~15-25 phút
**Chi phí:** ~$80-150/tháng (phát triển)

---

## 🏗️ Mẫu Kiến trúc Tác nhân

### Mẫu 1: Tác nhân đơn với công cụ

Mẫu tác nhân đơn giản nhất - một tác nhân có thể sử dụng nhiều công cụ.

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**Phù hợp cho:**
- Bot hỗ trợ khách hàng
- Trợ lý nghiên cứu
- Tác nhân phân tích dữ liệu

**Mẫu AZD:** `azure-search-openai-demo`

### Mẫu 2: Tác nhân RAG (Retrieval-Augmented Generation)

Một tác nhân truy xuất các tài liệu liên quan trước khi tạo phản hồi.

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**Phù hợp cho:**
- Cơ sở tri thức doanh nghiệp
- Hệ thống Hỏi đáp tài liệu
- Nghiên cứu tuân thủ và pháp lý

**Mẫu AZD:** `azure-search-openai-demo`

### Mẫu 3: Hệ thống nhiều tác nhân

Nhiều tác nhân chuyên môn hoá làm việc cùng nhau cho các nhiệm vụ phức tạp.

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**Phù hợp cho:**
- Tạo nội dung phức tạp
- Luồng công việc nhiều bước
- Nhiệm vụ đòi hỏi các chuyên môn khác nhau

**Tìm hiểu thêm:** [Các Mẫu Điều phối Đa Tác nhân](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Cấu hình Công cụ cho Tác nhân

Tác nhân trở nên mạnh mẽ khi chúng có thể sử dụng công cụ. Đây là cách cấu hình các công cụ phổ biến:

### Cấu hình công cụ trong Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Định nghĩa các công cụ tùy chỉnh
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# Tạo tác nhân với các công cụ
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Cấu hình Môi trường

```bash
# Thiết lập các biến môi trường riêng cho agent
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Triển khai với cấu hình đã cập nhật
azd deploy
```

---

## 📊 Giám sát Tác nhân

### Tích hợp Application Insights

Tất cả mẫu tác nhân AZD bao gồm Application Insights để giám sát:

```bash
# Mở bảng điều khiển giám sát
azd monitor --overview

# Xem nhật ký theo thời gian thực
azd monitor --logs

# Xem số liệu theo thời gian thực
azd monitor --live
```

### Các chỉ số chính cần theo dõi

| Chỉ số | Mô tả | Mục tiêu |
|--------|-------------|--------|
| Độ trễ phản hồi | Thời gian để tạo phản hồi | < 5 giây |
| Sử dụng token | Token trên mỗi yêu cầu | Giám sát để kiểm soát chi phí |
| Tỷ lệ gọi công cụ thành công | % thực thi công cụ thành công | > 95% |
| Tỷ lệ lỗi | Yêu cầu tác nhân thất bại | < 1% |
| Sự hài lòng của người dùng | Điểm phản hồi | > 4.0/5.0 |

### Ghi nhật ký tùy chỉnh cho Tác nhân

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 Cân nhắc chi phí

### Chi phí ước tính hàng tháng theo mẫu

| Mẫu | Môi trường Phát triển | Sản xuất |
|---------|-----------------|------------|
| Tác nhân đơn | $50-100 | $200-500 |
| Tác nhân RAG | $80-150 | $300-800 |
| Đa tác nhân (2-3 tác nhân) | $150-300 | $500-1,500 |
| Đa tác nhân doanh nghiệp | $300-500 | $1,500-5,000+ |

### Mẹo tối ưu hóa chi phí

1. **Sử dụng GPT-4o-mini cho các tác vụ đơn giản**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Thực hiện caching cho các truy vấn lặp lại**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Đặt giới hạn token**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Giới hạn độ dài phản hồi
   )
   ```

4. **Tự động scale về không khi không sử dụng**
   ```bash
   # Container Apps tự động co về 0
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Khắc phục sự cố Tác nhân

### Các vấn đề thường gặp và giải pháp

<details>
<summary><strong>❌ Tác nhân không phản hồi các cuộc gọi công cụ</strong></summary>

```bash
# Kiểm tra xem các công cụ đã được đăng ký đúng cách hay chưa
azd show

# Xác minh triển khai OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Kiểm tra nhật ký tác nhân
azd monitor --logs
```

**Nguyên nhân phổ biến:**
- Ký hiệu hàm công cụ không khớp
- Thiếu quyền cần thiết
- Điểm cuối API không thể truy cập
</details>

<details>
<summary><strong>❌ Độ trễ cao trong phản hồi của tác nhân</strong></summary>

```bash
# Kiểm tra Application Insights để tìm các điểm nghẽn
azd monitor --live

# Cân nhắc sử dụng mô hình nhanh hơn
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Mẹo tối ưu hóa:**
- Sử dụng phản hồi dạng stream
- Thực hiện caching phản hồi
- Giảm kích thước cửa sổ ngữ cảnh
</details>

<details>
<summary><strong>❌ Tác nhân trả về thông tin không chính xác hoặc ảo tưởng</strong></summary>

```python
# Cải thiện bằng các lời nhắc hệ thống tốt hơn
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Thêm cơ chế truy xuất để làm nền tảng
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Căn cứ phản hồi vào các tài liệu
)
```
</details>

<details>
<summary><strong>❌ Lỗi vượt quá giới hạn token</strong></summary>

```python
# Triển khai quản lý cửa sổ ngữ cảnh
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Ước lượng sơ bộ
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Thực hành

### Bài tập 1: Triển khai một tác nhân cơ bản (20 phút)

**Mục tiêu:** Triển khai tác nhân AI đầu tiên của bạn bằng AZD

```bash
# Bước 1: Khởi tạo mẫu
azd init --template get-started-with-ai-agents

# Bước 2: Đăng nhập vào Azure
azd auth login

# Bước 3: Triển khai
azd up

# Bước 4: Kiểm tra tác nhân
# Mở URL được hiển thị trong đầu ra

# Bước 5: Dọn dẹp
azd down --force --purge
```

**Tiêu chí thành công:**
- [ ] Tác nhân phản hồi các câu hỏi
- [ ] Có thể truy cập bảng điều khiển giám sát
- [ ] Tài nguyên đã được dọn dẹp thành công

### Bài tập 2: Thêm một công cụ tùy chỉnh (30 phút)

**Mục tiêu:** Mở rộng tác nhân với một công cụ tùy chỉnh

1. Triển khai mẫu tác nhân
2. Tạo một hàm công cụ mới:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Cuộc gọi API tới dịch vụ thời tiết
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Đăng ký công cụ với tác nhân
4. Kiểm tra rằng tác nhân sử dụng công cụ mới

**Tiêu chí thành công:**
- [ ] Tác nhân nhận diện các truy vấn liên quan đến thời tiết
- [ ] Công cụ được gọi chính xác
- [ ] Phản hồi bao gồm thông tin thời tiết

### Bài tập 3: Xây dựng Tác nhân RAG (45 phút)

**Mục tiêu:** Tạo một tác nhân trả lời câu hỏi từ tài liệu của bạn

```bash
# Triển khai mẫu RAG
azd init --template azure-search-openai-demo
azd up

# Tải lên tài liệu của bạn
# (Thực hiện theo hướng dẫn nhập dữ liệu của mẫu)

# Kiểm tra bằng các câu hỏi chuyên ngành
```

**Tiêu chí thành công:**
- [ ] Tác nhân trả lời từ các tài liệu đã tải lên
- [ ] Phản hồi bao gồm trích dẫn
- [ ] Không có ảo tưởng về các câu hỏi ngoài phạm vi

---

## 📚 Bước tiếp theo

Bây giờ bạn đã hiểu về tác nhân AI, khám phá các chủ đề nâng cao sau:

| Chủ đề | Mô tả | Liên kết |
|-------|-------------|------|
| **Hệ thống Đa Tác nhân** | Xây dựng hệ thống với nhiều tác nhân hợp tác | [Ví dụ Đa tác nhân Bán lẻ](../../examples/retail-scenario.md) |
| **Mẫu Điều phối** | Tìm hiểu các mẫu điều phối và giao tiếp | [Mẫu Điều phối](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Triển khai cho Môi trường Sản xuất** | Triển khai tác nhân sẵn sàng cho doanh nghiệp | [Thực hành AI cho Môi trường Sản xuất](production-ai-practices.md) |
| **Đánh giá Tác nhân** | Kiểm thử và đánh giá hiệu suất tác nhân | [Khắc phục sự cố AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Tài nguyên bổ sung

### Tài liệu chính thức
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Mẫu AZD cho Tác nhân
- [Bắt đầu với Tác nhân AI](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Tài nguyên cộng đồng
- [Awesome AZD - Mẫu Tác nhân](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Điều hướng**
- **Bài học trước**: [Triển khai Mô hình AI](ai-model-deployment.md)
- **Bài học tiếp theo**: [Thực hành AI cho Môi trường Sản xuất](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Văn bản này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo tính chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc thiếu chính xác. Văn bản gốc bằng ngôn ngữ gốc nên được coi là nguồn chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->