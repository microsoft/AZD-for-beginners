<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-09T20:58:54+00:00",
  "source_file": "README.md",
  "language_code": "vi"
}
-->
# AZD Dành Cho Người Mới Bắt Đầu

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.vi.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

Hãy làm theo các bước sau để bắt đầu sử dụng các tài nguyên này:  
1. **Fork Repository**: Nhấn vào [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Clone Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Tham gia cộng đồng Azure Discord để gặp gỡ các chuyên gia và nhà phát triển khác**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 Hỗ Trợ Đa Ngôn Ngữ  

#### Được hỗ trợ qua GitHub Action (Tự động & Luôn cập nhật)  

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](./README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**Nếu bạn muốn có thêm các ngôn ngữ được hỗ trợ, danh sách các ngôn ngữ có thể xem [tại đây](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## Giới Thiệu  

Chào mừng bạn đến với hướng dẫn toàn diện về Azure Developer CLI (azd). Repository này được thiết kế để giúp các nhà phát triển ở mọi cấp độ, từ sinh viên đến các nhà phát triển chuyên nghiệp, học và làm chủ Azure Developer CLI để triển khai đám mây hiệu quả. Tài liệu học tập có cấu trúc này cung cấp trải nghiệm thực hành với việc triển khai đám mây Azure, xử lý các vấn đề thường gặp, và áp dụng các phương pháp tốt nhất để triển khai mẫu AZD thành công.  

## Mục Tiêu Học Tập  

Khi làm việc qua repository này, bạn sẽ:  
- Làm chủ các khái niệm cơ bản và cốt lõi của Azure Developer CLI  
- Học cách triển khai và cung cấp tài nguyên Azure bằng Infrastructure as Code  
- Phát triển kỹ năng xử lý sự cố cho các vấn đề triển khai AZD thường gặp  
- Hiểu về xác thực trước triển khai và lập kế hoạch năng lực  
- Áp dụng các phương pháp bảo mật tốt nhất và chiến lược tối ưu hóa chi phí  
- Xây dựng sự tự tin trong việc triển khai ứng dụng sẵn sàng cho sản xuất lên Azure  

## Kết Quả Học Tập  

Sau khi hoàn thành khóa học này, bạn sẽ có thể:  
- Cài đặt, cấu hình, và sử dụng Azure Developer CLI thành công  
- Tạo và triển khai ứng dụng bằng các mẫu AZD  
- Xử lý sự cố liên quan đến xác thực, hạ tầng, và triển khai  
- Thực hiện kiểm tra trước triển khai bao gồm lập kế hoạch năng lực và lựa chọn SKU  
- Áp dụng các phương pháp tốt nhất về giám sát, bảo mật, và quản lý chi phí  
- Tích hợp các quy trình làm việc AZD vào các pipeline CI/CD  

## Mục Lục  

- [Azure Developer CLI là gì?](../..)  
- [Bắt Đầu Nhanh](../..)  
- [Tài Liệu](../..)  
- [Ví Dụ & Mẫu](../..)  
- [Tài Nguyên](../..)  
- [Đóng Góp](../..)  

## Azure Developer CLI là gì?  

Azure Developer CLI (azd) là giao diện dòng lệnh tập trung vào nhà phát triển, giúp tăng tốc quá trình xây dựng và triển khai ứng dụng lên Azure. Nó cung cấp:  

- **Triển khai dựa trên mẫu** - Sử dụng các mẫu được xây dựng sẵn cho các mô hình ứng dụng phổ biến  
- **Infrastructure as Code** - Quản lý tài nguyên Azure bằng Bicep hoặc Terraform  
- **Quy trình tích hợp** - Cung cấp, triển khai, và giám sát ứng dụng một cách liền mạch  
- **Thân thiện với nhà phát triển** - Tối ưu hóa cho năng suất và trải nghiệm của nhà phát triển  

## Bắt Đầu Nhanh  

### Yêu Cầu  
- Tài khoản Azure  
- Azure CLI đã được cài đặt  
- Git (để clone các mẫu)  

### Cài Đặt  
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### Triển Khai Đầu Tiên  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

## Tài Liệu  

### Bắt Đầu  
- [**Cơ Bản về AZD**](docs/getting-started/azd-basics.md) - Các khái niệm và thuật ngữ cốt lõi  
- [**Cài Đặt & Thiết Lập**](docs/getting-started/installation.md) - Hướng dẫn cài đặt theo nền tảng  
- [**Cấu Hình**](docs/getting-started/configuration.md) - Thiết lập môi trường và xác thực  
- [**Dự Án Đầu Tiên**](docs/getting-started/first-project.md) - Hướng dẫn từng bước  

### Triển Khai & Cung Cấp  
- [**Hướng Dẫn Triển Khai**](docs/deployment/deployment-guide.md) - Quy trình triển khai hoàn chỉnh  
- [**Cung Cấp Tài Nguyên**](docs/deployment/provisioning.md) - Quản lý tài nguyên Azure  

### Kiểm Tra Trước Triển Khai  
- [**Lập Kế Hoạch Năng Lực**](docs/pre-deployment/capacity-planning.md) - Xác thực năng lực tài nguyên Azure  
- [**Lựa Chọn SKU**](docs/pre-deployment/sku-selection.md) - Chọn SKU Azure phù hợp  
- [**Kiểm Tra Trước**](docs/pre-deployment/preflight-checks.md) - Các script xác thực tự động  

### Xử Lý Sự Cố  
- [**Các Vấn Đề Thường Gặp**](docs/troubleshooting/common-issues.md) - Các vấn đề thường gặp và giải pháp  
- [**Hướng Dẫn Gỡ Lỗi**](docs/troubleshooting/debugging.md) - Chiến lược gỡ lỗi từng bước  

## Ví Dụ & Mẫu  

### Mẫu Khởi Đầu  
- [**Ứng Dụng Web Đơn Giản**](../../examples/simple-web-app) - Triển khai ứng dụng Node.js cơ bản  
- [**Website Tĩnh**](../../examples/static-website) - Lưu trữ website tĩnh trên Azure Storage  
- [**Ứng Dụng Container**](../../examples/container-app) - Triển khai ứng dụng container hóa  
- [**Ứng Dụng Cơ Sở Dữ Liệu**](../../examples/database-app) - Ứng dụng web tích hợp cơ sở dữ liệu  

### Kịch Bản Nâng Cao  
- [**Microservices**](../../examples/microservices) - Kiến trúc ứng dụng đa dịch vụ  
- [**Hàm Serverless**](../../examples/serverless-function) - Triển khai Azure Functions  
- [**Ví Dụ Cấu Hình**](../../examples/configurations) - Các mẫu cấu hình có thể tái sử dụng  

## Tài Nguyên  

### Tham Khảo Nhanh  
- [**Bảng Lệnh Cheat Sheet**](resources/cheat-sheet.md) - Các lệnh azd thiết yếu  
- [**Thuật Ngữ**](resources/glossary.md) - Thuật ngữ Azure và azd  
- [**FAQ**](resources/faq.md) - Các câu hỏi thường gặp  
- [**Hướng Dẫn Học Tập**](resources/study-guide.md) - Mục tiêu học tập toàn diện và bài tập thực hành  

### Tài Nguyên Bên Ngoài  
- [Tài Liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Trung Tâm Kiến Trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Máy Tính Giá Azure](https://azure.microsoft.com/pricing/calculator/)  
- [Trạng Thái Azure](https://status.azure.com/)  

## Lộ Trình Học Tập  

### Dành Cho Sinh Viên & Người Mới Bắt Đầu  
1. Bắt đầu với [Cơ Bản về AZD](docs/getting-started/azd-basics.md)  
2. Theo dõi [Hướng Dẫn Cài Đặt](docs/getting-started/installation.md)  
3. Hoàn thành [Dự Án Đầu Tiên](docs/getting-started/first-project.md)  
4. Thực hành với [Ví Dụ Ứng Dụng Web Đơn Giản](../../examples/simple-web-app)  

### Dành Cho Nhà Phát Triển  
1. Xem lại [Hướng Dẫn Cấu Hình](docs/getting-started/configuration.md)  
2. Nghiên cứu [Hướng Dẫn Triển Khai](docs/deployment/deployment-guide.md)  
3. Làm việc với [Ví Dụ Ứng Dụng Cơ Sở Dữ Liệu](../../examples/database-app)  
4. Khám phá [Ví Dụ Ứng Dụng Container](../../examples/container-app)  

### Dành Cho Kỹ Sư DevOps  
1. Làm chủ [Cung Cấp Tài Nguyên](docs/deployment/provisioning.md)  
2. Thực hiện [Kiểm Tra Trước](docs/pre-deployment/preflight-checks.md)  
3. Thực hành [Lập Kế Hoạch Năng Lực](docs/pre-deployment/capacity-planning.md)  
4. Nâng cao với [Ví Dụ Microservices](../../examples/microservices)  

## Đóng Góp  

Chúng tôi hoan nghênh các đóng góp! Vui lòng đọc [Hướng Dẫn Đóng Góp](CONTRIBUTING.md) để biết chi tiết về:  
- Cách gửi vấn đề và yêu cầu tính năng  
- Hướng dẫn đóng góp mã  
- Cải thiện tài liệu  
- Tiêu chuẩn cộng đồng  

## Hỗ Trợ  

- **Vấn Đề**: [Báo cáo lỗi và yêu cầu tính năng](https://github.com/microsoft/azd-for-beginners/issues)  
- **Thảo Luận**: [Cộng đồng Microsoft Azure Discord Q&A và thảo luận](https://discord.gg/microsoft-azure)  
- **Email**: Dành cho các yêu cầu riêng tư  
- **Microsoft Learn**: [Tài liệu chính thức về Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## Giấy Phép  

Dự án này được cấp phép theo Giấy Phép MIT - xem tệp [LICENSE](../../LICENSE) để biết chi tiết.  

## 🎒 Các Khóa Học Khác  

Nhóm của chúng tôi sản xuất các khóa học khác! Xem thêm:  

- [**MỚI** Model Context Protocol (MCP) Dành Cho Người Mới Bắt Đầu](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents Dành Cho Người Mới Bắt Đầu](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI Dành Cho Người Mới Bắt Đầu sử dụng .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI Dành Cho Người Mới Bắt Đầu](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI Dành Cho Người Mới Bắt Đầu sử dụng Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML Dành Cho Người Mới Bắt Đầu](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Khoa Học Dữ Liệu Dành Cho Người Mới Bắt Đầu](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Dành Cho Người Mới Bắt Đầu](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [An Ninh Mạng Dành Cho Người Mới Bắt Đầu](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Lập trình Web cho Người mới bắt đầu](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT cho Người mới bắt đầu](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Phát triển XR cho Người mới bắt đầu](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Thành thạo GitHub Copilot cho Lập trình Đôi với AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Thành thạo GitHub Copilot cho Lập trình viên C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Chọn Cuộc Phiêu Lưu Copilot của Bạn](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Điều hướng**
- **Bài học tiếp theo**: [Cơ bản về AZD](docs/getting-started/azd-basics.md)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp từ con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.