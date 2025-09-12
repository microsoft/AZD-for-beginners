<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T22:01:36+00:00",
  "source_file": "workshop/README.md",
  "language_code": "vi"
}
-->
# Hội Thảo AZD dành cho Nhà Phát Triển AI

**Trước:** [Hướng Dẫn Khắc Phục Sự Cố AI](../docs/troubleshooting/ai-troubleshooting.md) | **Tiếp Theo:** [Các Module Thực Hành Hội Thảo](../../../workshop)

Chào mừng bạn đến với hội thảo thực hành học Azure Developer CLI (AZD) với trọng tâm là triển khai ứng dụng AI. Hội thảo này được thiết kế để giúp bạn từ những kiến thức cơ bản về AZD đến triển khai các giải pháp AI sẵn sàng cho sản xuất.

## Tổng Quan Hội Thảo

**Thời lượng:** 2-3 giờ  
**Cấp độ:** Người mới bắt đầu đến trung cấp  
**Yêu cầu:** Kiến thức cơ bản về Azure, công cụ dòng lệnh, và các khái niệm AI

### Những Điều Bạn Sẽ Học

- **Kiến thức cơ bản về AZD**: Hiểu về Infrastructure as Code với AZD
- 🤖 **Tích hợp dịch vụ AI**: Triển khai Azure OpenAI, AI Search, và các dịch vụ AI khác
- **Triển khai Container**: Sử dụng Azure Container Apps cho các ứng dụng AI
- **Thực hành bảo mật**: Áp dụng Managed Identity và cấu hình an toàn
- **Giám sát & Quan sát**: Thiết lập Application Insights cho các khối lượng công việc AI
- **Mô hình sản xuất**: Chiến lược triển khai sẵn sàng cho doanh nghiệp

## Cấu Trúc Hội Thảo

### Module 1: Nền Tảng AZD (30 phút)
- Cài đặt và cấu hình AZD
- Hiểu cấu trúc dự án AZD
- Triển khai AZD đầu tiên của bạn
- **Thực hành**: Triển khai một ứng dụng web đơn giản

### Module 2: Tích Hợp Azure OpenAI (45 phút)
- Thiết lập tài nguyên Azure OpenAI
- Chiến lược triển khai mô hình
- Cấu hình truy cập API và xác thực
- **Thực hành**: Triển khai ứng dụng chat với GPT-4

### Module 3: Ứng Dụng RAG (45 phút)
- Tích hợp Azure AI Search
- Xử lý tài liệu với Azure Document Intelligence
- Vector embeddings và tìm kiếm ngữ nghĩa
- **Thực hành**: Xây dựng hệ thống hỏi đáp tài liệu

### Module 4: Triển Khai Sản Xuất (30 phút)
- Cấu hình Container Apps
- Tối ưu hóa hiệu suất và khả năng mở rộng
- Giám sát và ghi nhật ký
- **Thực hành**: Triển khai sản xuất với khả năng quan sát

### Module 5: Mô Hình Nâng Cao (15 phút)
- Triển khai đa môi trường
- Tích hợp CI/CD
- Chiến lược tối ưu hóa chi phí
- **Kết thúc**: Danh sách kiểm tra sẵn sàng sản xuất

## Yêu Cầu

### Công Cụ Cần Thiết

Vui lòng cài đặt các công cụ này trước hội thảo:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Thiết Lập Tài Khoản Azure

1. **Đăng ký Azure**: [Đăng ký miễn phí](https://azure.microsoft.com/free/)  
2. **Truy cập Azure OpenAI**: [Yêu cầu quyền truy cập](https://aka.ms/oai/access)  
3. **Quyền cần thiết**:  
   - Vai trò Contributor trên subscription hoặc resource group  
   - User Access Administrator (cho các phân quyền RBAC)  

### Xác Minh Yêu Cầu

Chạy script này để xác minh thiết lập của bạn:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Tài Liệu Hội Thảo

### Bài Tập Thực Hành

Mỗi module bao gồm các bài thực hành với mã khởi đầu và hướng dẫn từng bước:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Triển khai AZD đầu tiên của bạn  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Ứng dụng chat với Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - Ứng dụng RAG với AI Search  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Mô hình triển khai sản xuất  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Kịch bản triển khai nâng cao  

### Tài Liệu Tham Khảo

- **[Hướng Dẫn Tích Hợp AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Các mô hình tích hợp toàn diện  
- **[Hướng Dẫn Triển Khai Mô Hình AI](../docs/ai-foundry/ai-model-deployment.md)** - Thực hành triển khai mô hình  
- **[Thực Hành AI Sản Xuất](../docs/ai-foundry/production-ai-practices.md)** - Mô hình triển khai doanh nghiệp  
- **[Hướng Dẫn Khắc Phục Sự Cố AI](../docs/troubleshooting/ai-troubleshooting.md)** - Các vấn đề thường gặp và giải pháp  

### Mẫu Template

Template khởi đầu nhanh cho các kịch bản AI phổ biến:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Bắt Đầu

### Tùy Chọn 1: GitHub Codespaces (Khuyến Nghị)

Cách nhanh nhất để bắt đầu hội thảo:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Tùy Chọn 2: Phát Triển Cục Bộ

1. **Clone repository hội thảo:**  
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Đăng nhập vào Azure:**  
```bash
az login
azd auth login
```

3. **Bắt đầu với Lab 1:**  
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Tùy Chọn 3: Hội Thảo Có Người Hướng Dẫn

Nếu bạn tham gia một buổi hướng dẫn:

- 🎥 **Ghi hình hội thảo**: [Có sẵn theo yêu cầu](https://aka.ms/azd-ai-workshop)  
- 💬 **Cộng đồng Discord**: [Tham gia để được hỗ trợ trực tiếp](https://aka.ms/foundry/discord)  
- **Phản hồi hội thảo**: [Chia sẻ trải nghiệm của bạn](https://aka.ms/azd-workshop-feedback)  

## Lịch Trình Hội Thảo

### Tự Học (3 giờ)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Buổi Hướng Dẫn (2.5 giờ)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## Tiêu Chí Thành Công

Kết thúc hội thảo, bạn sẽ có thể:

✅ **Triển khai ứng dụng AI** sử dụng template AZD  
✅ **Cấu hình Azure OpenAI** với bảo mật phù hợp  
✅ **Xây dựng ứng dụng RAG** với tích hợp Azure AI Search  
✅ **Áp dụng mô hình sản xuất** cho khối lượng công việc AI doanh nghiệp  
✅ **Giám sát và khắc phục sự cố** triển khai ứng dụng AI  
✅ **Áp dụng chiến lược tối ưu hóa chi phí** cho khối lượng công việc AI  

## Cộng Đồng & Hỗ Trợ

### Trong Hội Thảo

- 🙋 **Câu hỏi**: Sử dụng chat hội thảo hoặc giơ tay  
- 🐛 **Vấn đề**: Kiểm tra [hướng dẫn khắc phục sự cố](../docs/troubleshooting/ai-troubleshooting.md)  
- **Mẹo**: Chia sẻ khám phá với các người tham gia khác  

### Sau Hội Thảo

- 💬 **Discord**: [Cộng đồng Azure AI Foundry](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [Báo cáo vấn đề về template](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Phản hồi**: [Biểu mẫu đánh giá hội thảo](https://aka.ms/azd-workshop-feedback)  

## Bước Tiếp Theo

### Tiếp Tục Học

1. **Kịch bản nâng cao**: Khám phá [triển khai đa vùng](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **Tích hợp CI/CD**: Thiết lập [GitHub Actions workflows](../docs/deployment/github-actions.md)  
3. **Template tùy chỉnh**: Tạo [template AZD của riêng bạn](../docs/getting-started/custom-templates.md)  

### Áp Dụng Vào Dự Án Của Bạn

1. **Đánh giá**: Sử dụng [danh sách kiểm tra sẵn sàng](./production-readiness-checklist.md)  
2. **Template**: Bắt đầu với [template dành riêng cho AI](../../../workshop/templates)  
3. **Hỗ trợ**: Tham gia [Discord Azure AI Foundry](https://aka.ms/foundry/discord)  

### Chia Sẻ Thành Công Của Bạn

- ⭐ **Gắn sao repository** nếu hội thảo này giúp bạn  
- 🐦 **Chia sẻ trên mạng xã hội** với #AzureDeveloperCLI #AzureAI  
- 📝 **Viết bài blog** về hành trình triển khai AI của bạn  

---

## Phản Hồi Hội Thảo

Phản hồi của bạn giúp chúng tôi cải thiện trải nghiệm hội thảo:

| Khía cạnh | Đánh giá (1-5) | Bình luận |
|----------|----------------|-----------|
| Chất lượng nội dung | ⭐⭐⭐⭐⭐ | |
| Bài tập thực hành | ⭐⭐⭐⭐⭐ | |
| Tài liệu | ⭐⭐⭐⭐⭐ | |
| Mức độ khó | ⭐⭐⭐⭐⭐ | |
| Trải nghiệm tổng thể | ⭐⭐⭐⭐⭐ | |

**Gửi phản hồi**: [Biểu mẫu đánh giá hội thảo](https://aka.ms/azd-workshop-feedback)

---

**Trước:** [Hướng Dẫn Khắc Phục Sự Cố AI](../docs/troubleshooting/ai-troubleshooting.md) | **Tiếp Theo:** Bắt đầu với [Lab 1: Nền Tảng AZD](../../../workshop/lab-1-azd-basics)

**Sẵn sàng bắt đầu xây dựng ứng dụng AI với AZD?**

[Bắt đầu Lab 1: Nền Tảng AZD →](./lab-1-azd-basics/README.md)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.