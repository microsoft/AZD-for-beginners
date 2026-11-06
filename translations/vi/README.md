# AZD Cho Người Mới Bắt Đầu: Hành Trình Học Tập Có Cấu Trúc

![AZD-for-beginners](../../translated_images/vi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Bản Dịch Tự Động (Luôn Cập Nhật Mới Nhất)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](./README.md)

> **Ưu tiên sao chép cục bộ?**
>
> Kho lưu trữ này bao gồm hơn 50 bản dịch ngôn ngữ làm tăng đáng kể kích thước tải về. Để sao chép mà không có bản dịch, hãy sử dụng sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Điều này cung cấp cho bạn tất cả những gì cần để hoàn thành khóa học với tốc độ tải xuống nhanh hơn nhiều.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Có Gì Mới Trong azd Hôm Nay

> 📌 Khóa học này được xác thực với **`azd 1.27.1`** (tháng 7 năm 2026). Chạy `azd version` để kiểm tra bản build, và `azd upgrade` để lấy bản mới nhất.

Azure Developer CLI đã phát triển vượt ra ngoài các ứng dụng web và API truyền thống. Ngày nay, azd là công cụ duy nhất để triển khai **bất kỳ** ứng dụng nào lên Azure — bao gồm các ứng dụng AI và đại lý thông minh.

Điều đó có ý nghĩa gì với bạn:

- **Các đại lý AI hiện là loại workload đầu tiên trong azd.** Bạn có thể khởi tạo, triển khai và quản lý các dự án đại lý AI bằng cùng quy trình `azd init` → `azd up` mà bạn đã biết.
- **Chu trình đại lý hoàn chỉnh trên CLI.** Tiện ích mở rộng `azure.ai.agents` hiện bao phủ toàn bộ hành trình — `azd ai agent init` để dựng khung, `azd ai agent invoke` để kiểm thử (với đầu ra thời gian phản hồi), `azd ai agent eval generate` và `azd ai agent optimize` để đo lường và cải thiện chất lượng, và `azd ai agent delete` để dọn dẹp.
- **Nhiều khối xây dựng AI hơn.** Các tiện ích mở rộng xem trước mới — `azure.ai.skills` và `azure.ai.connections` — cho phép bạn quản lý kỹ năng đại lý có thể tái sử dụng và kết nối Foundry trực tiếp với azd.
- **Tích hợp Microsoft Foundry** mang việc triển khai mô hình, lưu trữ đại lý và cấu hình dịch vụ AI vào trực tiếp hệ sinh thái mẫu azd.
- **Cải tiến mượt mà trong các thao tác hàng ngày.** Các phiên bản gần đây đã làm cho `azd init` trở nên idempotent (an toàn để chạy lại), giúp `azd auth login` tự động xóa bỏ token cũ, và thêm lời nhắc thiết lập thân thiện `azd tool` khi chạy lần đầu.
- **Quy trình làm việc cốt lõi không thay đổi.** Dù bạn đang triển khai ứng dụng todo, microservice hay giải pháp AI đa đại lý, các lệnh vẫn như cũ.

> **Lưu ý dành cho người dùng Aspire:** Microsoft hiện gọi sản phẩm chỉ là **Aspire** (trước đây là ".NET Aspire"). Hỗ trợ Aspire của azd không thay đổi — chỉ là cập nhật tên gọi.

Nếu bạn đã từng dùng azd, hỗ trợ AI là sự mở rộng tự nhiên — không phải công cụ riêng hay đường học nâng cao. Nếu bạn bắt đầu mới, bạn sẽ học một quy trình làm việc duy nhất cho mọi thứ.

---

## 🚀 Azure Developer CLI (azd) Là Gì?

**Azure Developer CLI (azd)** là công cụ dòng lệnh thân thiện với nhà phát triển giúp đơn giản hóa việc triển khai ứng dụng lên Azure. Thay vì tạo và kết nối thủ công hàng chục tài nguyên Azure, bạn có thể triển khai toàn bộ ứng dụng chỉ với một lệnh duy nhất.

### Phép Thuật của `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**Chỉ vậy thôi!** Không cần bấm trong Azure Portal, không cần học các mẫu ARM phức tạp, không cần cấu hình thủ công - chỉ việc chạy ứng dụng trên Azure.

---

## ❓ Azure Developer CLI và Azure CLI: Khác Nhau Như Thế Nào?

Đây là câu hỏi phổ biến nhất của người mới. Đây là câu trả lời đơn giản:

| Tính năng | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Mục đích** | Quản lý tài nguyên Azure riêng lẻ | Triển khai ứng dụng hoàn chỉnh |
| **Tư duy** | Tập trung vào hạ tầng | Tập trung vào ứng dụng |
| **Ví dụ** | `az webapp create --name myapp...` | `azd up` |
| **Độ khó học** | Phải biết dịch vụ Azure | Chỉ cần biết ứng dụng của bạn |
| **Phù hợp cho** | DevOps, Hạ tầng | Nhà phát triển, Tạo mẫu nhanh |

### So Sánh Đơn Giản

- **Azure CLI** giống như bạn có tất cả đồ nghề để xây nhà - búa, cưa, đinh. Bạn có thể xây mọi thứ, nhưng phải biết xây dựng.
- **Azure Developer CLI** giống như thuê nhà thầu - bạn chỉ định muốn gì, họ lo phần xây dựng.

### Khi Nào Dùng Cái Nào

| Tình huống | Dùng Cái Này |
|----------|----------|
| "Tôi muốn triển khai web app nhanh" | `azd up` |
| "Tôi chỉ cần tạo tài khoản lưu trữ" | `az storage account create` |
| "Tôi đang xây dựng ứng dụng AI đầy đủ" | `azd init --template azure-search-openai-demo` |
| "Tôi cần gỡ lỗi tài nguyên Azure cụ thể" | `az resource show` |
| "Tôi muốn triển khai sẵn sàng cho sản xuất trong vài phút" | `azd up --environment production` |

### Hai Công Cụ Hoạt Động Cùng Nhau!

AZD sử dụng Azure CLI ở phía sau. Bạn có thể dùng cả hai:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Tìm Mẫu Trong Awesome AZD

Đừng bắt đầu từ con số không! **Awesome AZD** là bộ sưu tập mẫu cộng đồng sẵn sàng triển khai:

| Tài nguyên | Mô tả |
|----------|-------------|
| 🔗 [**Thư viện Awesome AZD**](https://azure.github.io/awesome-azd/) | Duyệt 200+ mẫu với triển khai một cú nhấp |
| 🔗 [**Gửi Mẫu**](https://github.com/Azure/awesome-azd/issues) | Đóng góp mẫu của bạn cho cộng đồng |
| 🔗 [**Kho GitHub**](https://github.com/Azure/awesome-azd) | Thêm sao và khám phá mã nguồn |

### Mẫu AI Phổ Biến Từ Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Bắt Đầu Trong 3 Bước

Trước khi bắt đầu, hãy chắc chắn máy bạn sẵn sàng cho mẫu bạn muốn triển khai:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Nếu bất cứ kiểm tra nào không đạt, hãy sửa trước rồi tiếp tục với bắt đầu nhanh.

### Bước 1: Cài Đặt AZD (2 phút)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Bước 2: Xác Thực Cho AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Nếu bạn không chắc cần cái nào, hãy theo quy trình thiết lập đầy đủ trong [Cài Đặt & Thiết Lập](docs/chapter-01-foundation/installation.md#authentication-setup).

### Bước 3: Triển Khai Ứng Dụng Đầu Tiên

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Xong rồi!** Ứng dụng của bạn đã hoạt động trên Azure.

### Dọn Dẹp (Đừng Quên!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cách Sử Dụng Khóa Học Này

Khóa học này được thiết kế cho **học tập tiến bộ** - bắt đầu từ mức bạn thoải mái và tiến dần lên:

| Kinh Nghiệm Của Bạn | Bắt Đầu Tại Đây |
|-----------------|------------|
| **Mới hoàn toàn với Azure** | [Chương 1: Nền Tảng](#-chapter-1-foundation--quick-start) |
| **Biết Azure, mới với AZD** | [Chương 1: Nền Tảng](#-chapter-1-foundation--quick-start) |
| **Muốn triển khai ứng dụng AI** | [Chương 2: Phát Triển Ưu Tiên AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Muốn thực hành trực tiếp** | [🎓 Workshop Tương Tác](workshop/README.md) - phòng lab hướng dẫn 3-4 tiếng |
| **Cần mẫu sản xuất** | [Chương 8: Sản Xuất & Doanh Nghiệp](#-chapter-8-production--enterprise-patterns) |

### Thiết Lập Nhanh

1. **Fork Kho Lưu Trữ Này**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone Nó**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Nhận Trợ Giúp**: [Cộng Đồng Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Ưu tiên sao chép cục bộ?**

> Kho lưu trữ này bao gồm hơn 50 bản dịch ngôn ngữ làm tăng đáng kể kích thước tải về. Để sao chép mà không có bản dịch, hãy sử dụng sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Điều này cung cấp cho bạn tất cả những gì cần để hoàn thành khóa học với tốc độ tải xuống nhanh hơn nhiều.


## Tổng Quan Khóa Học

Nắm vững Azure Developer CLI (azd) qua các chương có cấu trúc thiết kế cho học tập tiến bộ. **Tập trung đặc biệt vào triển khai ứng dụng AI với tích hợp Microsoft Foundry.**

### Tại Sao Khóa Học Này Quan Trọng Với Nhà Phát Triển Hiện Đại

Dựa trên thông tin cộng đồng Microsoft Foundry Discord, **45% nhà phát triển muốn sử dụng AZD cho workload AI** nhưng gặp khó khăn với:
- Kiến trúc AI đa dịch vụ phức tạp
- Thực tiễn tốt nhất triển khai AI trong sản xuất  
- Tích hợp và cấu hình dịch vụ Azure AI
- Tối ưu hóa chi phí cho workload AI
- Khắc phục sự cố triển khai AI cụ thể

### Mục Tiêu Học Tập

Khi hoàn thành khóa học có cấu trúc này, bạn sẽ:
- **Thành thạo cơ bản AZD**: Khái niệm cốt lõi, cài đặt và cấu hình
- **Triển khai ứng dụng AI**: Sử dụng AZD với dịch vụ Microsoft Foundry
- **Triển khai Hạ tầng dưới dạng Mã**: Quản lý tài nguyên Azure với các mẫu Bicep  
- **Khắc phục Sự cố Triển khai**: Giải quyết các vấn đề phổ biến và gỡ lỗi  
- **Tối ưu cho Môi trường Sản xuất**: Bảo mật, mở rộng, giám sát và quản lý chi phí  
- **Xây dựng Giải pháp Đa Tác nhân**: Triển khai kiến trúc AI phức tạp  

## Trước Khi Bắt Đầu: Tài khoản, Quyền truy cập và Giả định  

Trước khi bạn bắt đầu Chương 1, hãy chắc chắn bạn có những điều sau đây. Các bước cài đặt trong hướng dẫn này giả định những điều cơ bản này đã được chuẩn bị.  

- **Một đăng ký Azure**: Bạn có thể sử dụng đăng ký hiện có từ công việc hoặc tài khoản của mình, hoặc tạo một [dùng thử miễn phí](https://aka.ms/azurefreetrial) để bắt đầu.  
- **Quyền tạo tài nguyên Azure**: Đối với hầu hết các bài tập, bạn nên có quyền truy cập ít nhất là **Contributor** trên đăng ký hoặc nhóm tài nguyên mục tiêu. Một số chương cũng giả định bạn có thể tạo nhóm tài nguyên, danh tính được quản lý và các gán RBAC.  
- [**Một tài khoản GitHub**](https://github.com): Điều này hữu ích để fork kho lưu trữ, theo dõi các thay đổi của bạn và sử dụng GitHub Codespaces cho khóa học.  
- **Yêu cầu về môi trường chạy mẫu**: Một số mẫu cần công cụ cục bộ như Node.js, Python, Java hoặc Docker. Chạy trình kiểm tra thiết lập trước khi bắt đầu để phát hiện thiếu công cụ sớm.  
- **Sự quen thuộc cơ bản với terminal**: Bạn không cần phải là chuyên gia, nhưng nên thoải mái chạy các lệnh như `git clone`, `azd auth login`, và `azd up`.  

> **Làm việc trong đăng ký doanh nghiệp?**  
> Nếu môi trường Azure của bạn được quản lý bởi quản trị viên, hãy xác nhận trước rằng bạn có thể triển khai tài nguyên trong đăng ký hoặc nhóm tài nguyên bạn dự định sử dụng. Nếu không, hãy yêu cầu đăng ký sandbox hoặc quyền Contributor trước khi bắt đầu.  

> **Mới với Azure?**  
> Bắt đầu với đăng ký dùng thử Azure riêng của bạn hoặc đăng ký trả tiền theo mức sử dụng tại https://aka.ms/azurefreetrial để bạn có thể hoàn thành các bài tập từ đầu đến cuối mà không phải chờ phê duyệt ở cấp tenant.  

## 🗺️ Bản đồ Khóa học: Định vị nhanh theo chương  

Mỗi chương có một README riêng với mục tiêu học tập, hướng dẫn nhanh và bài tập:  

| Chương | Chủ đề | Bài học | Thời lượng | Độ phức tạp |  
|---------|-------|---------|----------|------------|  
| **[Ch 1: Nền tảng](docs/chapter-01-foundation/README.md)** | Bắt đầu | [AZD Cơ bản](docs/chapter-01-foundation/azd-basics.md) &#124; [Cài đặt](docs/chapter-01-foundation/installation.md) &#124; [Dự án đầu tiên](docs/chapter-01-foundation/first-project.md) | 30-45 phút | ⭐ |  
| **[Ch 2: Phát triển AI](docs/chapter-02-ai-development/README.md)** | Ứng dụng AI-Đầu tiên | [Tích hợp Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Tác nhân AI](docs/chapter-02-ai-development/agents.md) &#124; [Triển khai mô hình](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tiếng | ⭐⭐ |  
| **[Ch 3: Cấu hình](docs/chapter-03-configuration/README.md)** | Xác thực & Bảo mật | [Cấu hình](docs/chapter-03-configuration/configuration.md) &#124; [Xác thực & Bảo mật](docs/chapter-03-configuration/authsecurity.md) | 45-60 phút | ⭐⭐ |  
| **[Ch 4: Hạ tầng](docs/chapter-04-infrastructure/README.md)** | IaC & Triển khai | [Hướng dẫn triển khai](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Cung cấp](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 tiếng | ⭐⭐⭐ |  
| **[Ch 5: Đa Tác nhân](docs/chapter-05-multi-agent/README.md)** | Giải pháp Tác nhân AI | [Kịch bản Bán lẻ](examples/retail-scenario.md) &#124; [Mẫu phối hợp](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tiếng | ⭐⭐⭐⭐ |  
| **[Ch 6: Trước Triển khai](docs/chapter-06-pre-deployment/README.md)** | Lập kế hoạch & Xác thực | [Kiểm tra tiền chuyến bay](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Lập kế hoạch công suất](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Chọn SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tiếng | ⭐⭐ |  
| **[Ch 7: Khắc phục sự cố](docs/chapter-07-troubleshooting/README.md)** | Gỡ lỗi & Sửa lỗi | [Các vấn đề phổ biến](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Gỡ lỗi](docs/chapter-07-troubleshooting/debugging.md) &#124; [Vấn đề AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 tiếng | ⭐⭐ |  
| **[Ch 8: Sản xuất](docs/chapter-08-production/README.md)** | Mẫu doanh nghiệp | [Thực hành sản xuất](docs/chapter-08-production/production-ai-practices.md) | 2-3 tiếng | ⭐⭐⭐⭐ |  
| **[🎓 Workshop](workshop/README.md)** | Phòng Lab Thực hành | [Giới thiệu](workshop/docs/instructions/0-Introduction.md) &#124; [Lựa chọn](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Xác thực](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Phân tích](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Cấu hình](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tùy chỉnh](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Dọn dẹp](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Kết thúc](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tiếng | ⭐⭐ |  

**Tổng Thời lượng Khóa học:** ~10-14 tiếng | **Tiến trình Kỹ năng:** Người mới bắt đầu → Sẵn sàng sản xuất  

---  

## 📚 Các chương học  

*Chọn con đường học tập dựa trên trình độ và mục tiêu của bạn*  

### 🚀 Chương 1: Nền tảng & Bắt đầu nhanh  
**Yêu cầu trước**: Đăng ký Azure, kiến thức cơ bản về dòng lệnh  
**Thời lượng**: 30-45 phút  
**Độ phức tạp**: ⭐  

#### Những gì bạn sẽ học  
- Hiểu các kiến thức cơ bản về Azure Developer CLI  
- Cài đặt AZD trên nền tảng của bạn  
- Triển khai thành công dự án đầu tiên của bạn  

#### Tài nguyên học tập  
- **🎯 Bắt đầu tại đây**: [Azure Developer CLI là gì?](#what-is-azure-developer-cli)  
- **📖 Lý thuyết**: [AZD Cơ bản](docs/chapter-01-foundation/azd-basics.md) - Khái niệm và thuật ngữ cốt lõi  
- **⚙️ Thiết lập**: [Cài đặt & Thiết lập](docs/chapter-01-foundation/installation.md) - Hướng dẫn cho từng nền tảng  
- **🛠️ Thực hành**: [Dự án Đầu tiên của bạn](docs/chapter-01-foundation/first-project.md) - Hướng dẫn từng bước  
- **📋 Tham khảo nhanh**: [Bảng lệnh tắt](resources/cheat-sheet.md)  

#### Bài tập thực tế  
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Kết quả Chương**: Triển khai thành công một ứng dụng web đơn giản lên Azure bằng AZD  

**✅ Đánh giá thành công:**  
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```
  
**📊 Thời gian đầu tư:** 30-45 phút  
**📈 Trình độ sau khi học:** Có thể tự triển khai các ứng dụng cơ bản  
**📈 Trình độ sau khi học:** Có thể tự triển khai các ứng dụng cơ bản  

---  

### 🤖 Chương 2: Phát triển AI-Đầu tiên (Khuyến nghị cho nhà phát triển AI)  
**Yêu cầu trước**: Hoàn thành Chương 1  
**Thời lượng**: 1-2 tiếng  
**Độ phức tạp**: ⭐⭐  

#### Những gì bạn sẽ học  
- Tích hợp Microsoft Foundry với AZD  
- Triển khai các ứng dụng AI  
- Hiểu cấu hình dịch vụ AI  

#### Tài nguyên học tập  
- **🎯 Bắt đầu tại đây**: [Tích hợp Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 Tác nhân AI**: [Hướng dẫn Tác nhân AI](docs/chapter-02-ai-development/agents.md) - Triển khai tác nhân thông minh với AZD  
- **📖 Mẫu**: [Triển khai Mô hình AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Triển khai và quản lý mô hình AI  
- **🛠️ Workshop**: [Phòng Lab AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Chuẩn bị giải pháp AI cho AZD  
- **🎥 Hướng dẫn Tương tác**: [Tài liệu Workshop](workshop/README.md) - Học trên trình duyệt với MkDocs * Môi trường DevContainer  
- **📋 Mẫu**: [Mẫu Microsoft Foundry](#featured-microsoft-foundry-templates)  
- **📝 Ví dụ**: [Ví dụ Triển khai AZD](examples/README.md)  

#### Bài tập thực tế  
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Kết quả Chương**: Triển khai và cấu hình ứng dụng chat AI với khả năng RAG  

**✅ Đánh giá thành công:**  
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```
  
**📊 Thời gian đầu tư:** 1-2 tiếng  
**📈 Trình độ sau khi học:** Có thể triển khai và cấu hình ứng dụng AI sẵn sàng sản xuất  
**💰 Nhận thức chi phí:** Hiểu chi phí phát triển $80-150/tháng, chi phí sản xuất $300-3500/tháng  

#### 💰 Cân nhắc Chi phí cho Triển khai AI  

**Môi trường phát triển (ước tính $80-150/tháng):**  
- Mô hình Microsoft Foundry (Trả theo mức sử dụng): $0-50/tháng (dựa trên token sử dụng)  
- AI Search (Cấp cơ bản): $75/tháng  
- Container Apps (Tiêu thụ): $0-20/tháng  
- Lưu trữ (Chuẩn): $1-5/tháng  

**Môi trường sản xuất (ước tính $300-3,500+/tháng):**  
- Mô hình Microsoft Foundry (PTU cho hiệu suất ổn định): $3,000+/tháng HOẶC Trả theo mức sử dụng với khối lượng lớn  
- AI Search (Cấp chuẩn): $250/tháng  
- Container Apps (Dành riêng): $50-100/tháng  
- Application Insights: $5-50/tháng  
- Lưu trữ (Cao cấp): $10-50/tháng  

**💡 Mẹo Tối ưu Chi phí:**  
- Sử dụng **Mức miễn phí** của Mô hình Microsoft Foundry để học (Azure OpenAI bao gồm 50.000 token/tháng)  
- Chạy `azd down` để giải phóng tài nguyên khi không phát triển  
- Bắt đầu với tính phí theo mức sử dụng, chỉ nâng cấp PTU cho môi trường sản xuất  
- Sử dụng `azd provision --preview` để ước tính chi phí trước khi triển khai  
- Kích hoạt tự động mở rộng: chỉ trả phí theo mức dùng thực tế  

**Giám sát Chi phí:**  
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```
  
---  

### ⚙️ Chương 3: Cấu hình & Xác thực  
**Yêu cầu trước**: Hoàn thành Chương 1  
**Thời lượng**: 45-60 phút  
**Độ phức tạp**: ⭐⭐  

#### Những gì bạn sẽ học  
- Cấu hình và quản lý môi trường  
- Các thực tiễn tốt nhất về xác thực và bảo mật  
- Đặt tên và tổ chức tài nguyên  

#### Tài nguyên học tập  
- **📖 Cấu hình**: [Hướng dẫn Cấu hình](docs/chapter-03-configuration/configuration.md) - Thiết lập môi trường  
- **🔐 Bảo mật**: [Mẫu xác thực và danh tính được quản lý](docs/chapter-03-configuration/authsecurity.md) - Mẫu xác thực  
- **📝 Ví dụ**: [Ví dụ ứng dụng cơ sở dữ liệu](examples/database-app/README.md) - Ví dụ AZD cho Cơ sở dữ liệu  

#### Bài tập thực tế  
- Cấu hình nhiều môi trường (phát triển, thử nghiệm, sản xuất)  
- Thiết lập xác thực danh tính được quản lý  
- Triển khai các cấu hình theo môi trường  

**💡 Kết quả Chương**: Quản lý nhiều môi trường với xác thực và bảo mật hợp lý  

---  

### 🏗️ Chương 4: Hạ tầng dưới dạng Mã & Triển khai  
**Yêu cầu trước**: Hoàn thành các chương 1-3  
**Thời lượng**: 1-1.5 tiếng  
**Độ phức tạp**: ⭐⭐⭐  

#### Những gì bạn sẽ học  
- Các mẫu triển khai nâng cao  
- Hạ tầng dưới dạng mã với Bicep  
- Chiến lược cung cấp tài nguyên  

#### Tài nguyên học tập  
- **📖 Triển khai**: [Hướng dẫn Triển khai](docs/chapter-04-infrastructure/deployment-guide.md) - Quy trình hoàn chỉnh  
- **🏗️ Cung cấp**: [Cung cấp Tài nguyên](docs/chapter-04-infrastructure/provisioning.md) - Quản lý tài nguyên Azure  
- **📝 Ví dụ**: [Ví dụ ứng dụng Container](../../examples/container-app) - Triển khai container hóa  

#### Bài tập thực tế  
- Tạo các mẫu Bicep tùy chỉnh  
- Triển khai ứng dụng đa dịch vụ  
- Triển khai các chiến lược blue-green deployment  

**💡 Kết quả Chương**: Triển khai các ứng dụng đa dịch vụ phức tạp sử dụng mẫu hạ tầng tùy chỉnh  

---  

### 🎯 Chương 5: Giải pháp AI Đa Tác nhân (Nâng cao)  
**Yêu cầu trước**: Hoàn thành các chương 1-2  
**Thời lượng**: 2-3 tiếng  
**Độ phức tạp**: ⭐⭐⭐⭐  

#### Những gì bạn sẽ học  
- Mẫu kiến trúc đa tác nhân  
- Điều phối và phối hợp tác nhân  
- Triển khai AI sẵn sàng cho sản xuất  

#### Tài nguyên học tập  
- **🤖 Dự án nổi bật**: [Giải pháp đa tác nhân Bán lẻ](examples/retail-scenario.md) - Triển khai hoàn chỉnh  
- **🛠️ Mẫu ARM**: [Gói Mẫu ARM](../../examples/retail-multiagent-arm-template) - Triển khai một-click  
- **📖 Kiến trúc**: [Mẫu phối hợp đa tác nhân](docs/chapter-06-pre-deployment/coordination-patterns.md) - Các mẫu hiện hành  

#### Bài tập thực tế  
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Kết quả Chương**: Triển khai và quản lý giải pháp AI đa tác nhân sẵn sàng cho sản xuất gồm Tác nhân Khách hàng và Tác nhân Hàng tồn kho  

---  

### 🔍 Chương 6: Xác thực & Lập kế hoạch Trước Triển khai  
**Yêu cầu trước**: Hoàn thành Chương 4  
**Thời lượng**: 1 tiếng  
**Độ phức tạp**: ⭐⭐  

#### Những gì bạn sẽ học  
- Lập kế hoạch công suất và xác thực tài nguyên  
- Chiến lược lựa chọn SKU  
- Các kiểm tra tiền chuyến bay và tự động hóa  

#### Tài nguyên học tập  
- **📊 Lập kế hoạch**: [Lập kế hoạch năng lực](docs/chapter-06-pre-deployment/capacity-planning.md) - Xác nhận tài nguyên
- **💰 Lựa chọn**: [Lựa chọn SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Lựa chọn tiết kiệm chi phí
- **✅ Xác nhận**: [Kiểm tra trước khi triển khai](docs/chapter-06-pre-deployment/preflight-checks.md) - Kịch bản tự động

#### Bài tập thực hành
- Chạy các kịch bản xác nhận năng lực
- Tối ưu lựa chọn SKU để tiết kiệm chi phí
- Triển khai kiểm tra tự động trước khi triển khai

**💡 Kết quả chương**: Xác nhận và tối ưu triển khai trước khi thực thi

---

### 🚨 Chương 7: Khắc phục sự cố & Gỡ lỗi
**Yêu cầu trước**: Hoàn thành bất kỳ chương triển khai nào  
**Thời lượng**: 1-1.5 giờ  
**Độ phức tạp**: ⭐⭐

#### Bạn sẽ học được gì
- Phương pháp gỡ lỗi có hệ thống
- Các vấn đề phổ biến và giải pháp
- Khắc phục sự cố dành cho AI

#### Tài nguyên học tập
- **🔧 Vấn đề phổ biến**: [Vấn đề phổ biến](docs/chapter-07-troubleshooting/common-issues.md) - FAQ và giải pháp
- **🕵️ Gỡ lỗi**: [Hướng dẫn gỡ lỗi](docs/chapter-07-troubleshooting/debugging.md) - Chiến lược từng bước
- **🤖 Vấn đề AI**: [Khắc phục sự cố AI cụ thể](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Vấn đề dịch vụ AI

#### Bài tập thực hành
- Chẩn đoán lỗi triển khai
- Giải quyết các sự cố xác thực
- Gỡ lỗi kết nối dịch vụ AI

**💡 Kết quả chương**: Tự chủ chẩn đoán và giải quyết các sự cố triển khai phổ biến

---

### 🏢 Chương 8: Mẫu sản xuất & Doanh nghiệp
**Yêu cầu trước**: Hoàn thành Chương 1-4  
**Thời lượng**: 2-3 giờ  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Bạn sẽ học được gì
- Chiến lược triển khai sản xuất
- Mẫu bảo mật doanh nghiệp
- Giám sát và tối ưu chi phí

#### Tài nguyên học tập
- **🏭 Sản xuất**: [Thực tiễn AI Sản xuất](docs/chapter-08-production/production-ai-practices.md) - Mẫu doanh nghiệp
- **📝 Ví dụ**: [Ví dụ Microservices](../../examples/microservices) - Kiến trúc phức tạp
- **📊 Giám sát**: [Tích hợp Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Giám sát

#### Bài tập thực hành
- Triển khai mẫu bảo mật doanh nghiệp
- Thiết lập giám sát toàn diện
- Triển khai sản xuất với quản trị phù hợp

**💡 Kết quả chương**: Triển khai ứng dụng sẵn sàng doanh nghiệp với đầy đủ năng lực sản xuất

---

## 🎓 Tổng quan Workshop: Trải nghiệm học thực hành

> **⚠️ TRẠNG THÁI WORKSHOP: Đang phát triển**  
> Tài liệu workshop hiện đang được phát triển và hoàn thiện. Các module chính đã hoạt động, nhưng một số phần nâng cao chưa hoàn chỉnh. Chúng tôi đang tích cực hoàn thành toàn bộ nội dung. [Theo dõi tiến độ →](workshop/README.md)

### Tài liệu Workshop Tương tác
**Học thực hành toàn diện với công cụ trên trình duyệt và bài tập điều hướng**

Tài liệu workshop cung cấp trải nghiệm học tương tác có cấu trúc, bổ sung cho chương trình học theo chương ở trên. Workshop được thiết kế cho cả học tự học và các buổi học do giảng viên hướng dẫn.

#### 🛠️ Đặc điểm Workshop
- **Giao diện trên trình duyệt**: Workshop hoàn chỉnh sử dụng MkDocs với chức năng tìm kiếm, sao chép, và giao diện chủ đề
- **Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển chỉ với một cú nhấp
- **Lộ trình học có cấu trúc**: 8 module bài tập hướng dẫn (tổng 3-4 giờ)
- **Phương pháp tiến triển**: Giới thiệu → Lựa chọn → Xác nhận → Phân tích → Cấu hình → Tùy chỉnh → Dọn dẹp → Kết thúc
- **Môi trường DevContainer tương tác**: Công cụ và phụ thuộc đã cấu hình sẵn

#### 📚 Cấu trúc Module Workshop
Workshop theo một **phương pháp tiến triển 8 module** đưa bạn từ khám phá đến thành thạo triển khai:

| Module | Chủ đề | Bạn sẽ làm gì | Thời lượng |
|--------|-------|----------------|----------|
| **0. Giới thiệu** | Tổng quan Workshop | Hiểu mục tiêu học tập, điều kiện tiên quyết, và cấu trúc workshop | 15 phút |
| **1. Lựa chọn** | Khám phá mẫu | Khám phá mẫu AZD và chọn mẫu AI phù hợp cho kịch bản của bạn | 20 phút |
| **2. Xác nhận** | Triển khai & Kiểm tra | Triển khai mẫu bằng `azd up` và xác nhận hạ tầng hoạt động | 30 phút |
| **3. Phân tích** | Hiểu cấu trúc | Dùng GitHub Copilot khám phá kiến trúc mẫu, file Bicep, và tổ chức code | 30 phút |
| **4. Cấu hình** | Khám phá sâu azure.yaml | Thông thạo cấu hình `azure.yaml`, các hook vòng đời và biến môi trường | 30 phút |
| **5. Tùy chỉnh** | Tùy biến | Kích hoạt AI Search, tracing, đánh giá và tùy chỉnh theo kịch bản của bạn | 45 phút |
| **6. Dọn dẹp** | Dọn dẹp | An toàn gỡ tài nguyên với `azd down --purge` | 15 phút |
| **7. Kết thúc** | Bước tiếp theo | Xem lại thành tựu, khái niệm chính và tiếp tục hành trình học tập | 15 phút |

**Luồng Workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Bắt đầu với Workshop
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Kết quả học tập Workshop
Bằng việc hoàn thành workshop, người tham gia sẽ:
- **Triển khai ứng dụng AI sản xuất**: Sử dụng AZD với dịch vụ Microsoft Foundry
- **Thành thạo kiến trúc đa đại lý**: Triển khai giải pháp phối hợp các đại lý AI
- **Triển khai bảo mật tốt nhất**: Cấu hình xác thực và kiểm soát truy cập
- **Tối ưu cho quy mô**: Thiết kế triển khai tiết kiệm chi phí, hiệu suất cao
- **Khắc phục sự cố triển khai**: Giải quyết sự cố phổ biến một cách độc lập

#### 📖 Tài nguyên Workshop
- **🎥 Hướng dẫn tương tác**: [Tài liệu Workshop](workshop/README.md) - Môi trường học trên trình duyệt
- **📋 Hướng dẫn từng module**:
  - [0. Giới thiệu](workshop/docs/instructions/0-Introduction.md) - Tổng quan và mục tiêu workshop
  - [1. Lựa chọn](workshop/docs/instructions/1-Select-AI-Template.md) - Tìm và chọn mẫu AI
  - [2. Xác nhận](workshop/docs/instructions/2-Validate-AI-Template.md) - Triển khai và kiểm tra mẫu
  - [3. Phân tích](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Khám phá kiến trúc mẫu
  - [4. Cấu hình](workshop/docs/instructions/4-Configure-AI-Template.md) - Thông thạo azure.yaml
  - [5. Tùy chỉnh](workshop/docs/instructions/5-Customize-AI-Template.md) - Tùy chỉnh theo kịch bản
  - [6. Dọn dẹp](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Dọn dẹp tài nguyên
  - [7. Kết thúc](workshop/docs/instructions/7-Wrap-up.md) - Xem lại và bước tiếp theo
- **🛠️ AI Workshop Lab**: [Phòng Lab Workshop AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Bài tập tập trung về AI
- **💡 Bắt đầu nhanh**: [Hướng dẫn thiết lập Workshop](workshop/README.md#quick-start) - Cấu hình môi trường

**Phù hợp với**: Đào tạo doanh nghiệp, khóa học đại học, học tự học, và bootcamp dành cho lập trình viên.

---

## 📖 Tìm hiểu sâu: Các tính năng AZD

Ngoài những kiến thức cơ bản, AZD cung cấp các tính năng mạnh mẽ cho triển khai sản xuất:

- **Triển khai dựa trên mẫu** - Sử dụng mẫu có sẵn cho các mô hình ứng dụng phổ biến
- **Hạ tầng dưới dạng mã** - Quản lý tài nguyên Azure dùng Bicep hoặc Terraform  
- **Quy trình tích hợp** - Cung cấp, triển khai và giám sát ứng dụng liền mạch
- **Thân thiện với lập trình viên** - Tối ưu năng suất và trải nghiệm nhà phát triển

### **AZD + Microsoft Foundry: Lý tưởng cho triển khai AI**

**Tại sao chọn AZD cho giải pháp AI?** AZD giải quyết các thách thức lớn mà nhà phát triển AI gặp phải:

- **Mẫu sẵn sàng AI** - Mẫu được cấu hình sẵn cho Microsoft Foundry Models, dịch vụ Azure AI và khối lượng công việc ML
- **Triển khai AI an toàn** - Mẫu bảo mật tích hợp cho dịch vụ AI, khóa API và điểm cuối mô hình  
- **Mẫu AI sản xuất** - Thực tiễn tốt nhất cho triển khai ứng dụng AI có thể mở rộng và tiết kiệm chi phí
- **Quy trình AI đầu-cuối** - Từ phát triển mô hình đến triển khai sản xuất với giám sát phù hợp
- **Tối ưu chi phí** - Phân bổ tài nguyên thông minh và chiến lược mở rộng cho khối lượng công việc AI
- **Tích hợp Microsoft Foundry** - Kết nối liền mạch với catalog mô hình và điểm cuối Microsoft Foundry

---

## 🎯 Thư viện Mẫu & Ví dụ

### Nổi bật: Mẫu Microsoft Foundry
**Bắt đầu ở đây nếu bạn triển khai ứng dụng AI!**

> **Lưu ý:** Các mẫu này mô phỏng các mô hình AI khác nhau. Một số là Azure Samples bên ngoài, một số là triển khai nội bộ.

| Mẫu | Chương | Độ phức tạp | Dịch vụ | Loại |
|----------|---------|------------|----------|------|
| [**Bắt đầu với chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chương 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ngoài |
| [**Bắt đầu với đại lý AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chương 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ngoài |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chương 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ngoài |
| [**Khởi động nhanh ứng dụng chat OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chương 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ngoài |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chương 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ngoài |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chương 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ngoài |
| [**Giải pháp đa đại lý bán lẻ**](examples/retail-scenario.md) | Chương 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Nội bộ** |

### Nổi bật: Kịch bản học tập hoàn chỉnh
**Mẫu ứng dụng sẵn sàng sản xuất được map theo chương học**

| Mẫu | Chương học | Độ phức tạp | Học chính |
|----------|------------------|------------|--------------|
| [**khởi động ứng dụng chat openai**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chương 2 | ⭐ | Mô hình triển khai AI cơ bản |
| [**demo azure-search-openai**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chương 2 | ⭐⭐ | Triển khai RAG với Azure AI Search |
| [**xử lý tài liệu AI**](https://github.com/Azure-Samples/ai-document-processing) | Chương 4 | ⭐⭐ | Tích hợp Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chương 5 | ⭐⭐⭐ | Khung đại lý và gọi hàm |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chương 8 | ⭐⭐⭐ | Điều phối AI doanh nghiệp |
| [**giải pháp đa đại lý bán lẻ**](examples/retail-scenario.md) | Chương 5 | ⭐⭐⭐⭐ | Kiến trúc đa đại lý với đại lý Khách hàng và Kho hàng |

### Học theo loại ví dụ

> **📌 Ví dụ nội bộ vs. bên ngoài:**  
> **Ví dụ nội bộ** (trong repo này) = Sẵn dùng ngay lập tức  
> **Ví dụ bên ngoài** (Azure Samples) = Clone từ các repo liên kết

#### Ví dụ nội bộ (Sẵn dùng)
- [**Giải pháp đa đại lý bán lẻ**](examples/retail-scenario.md) - Triển khai sản xuất hoàn chỉnh với mẫu ARM
  - Kiến trúc đa đại lý (Khách hàng + Đại lý Kho hàng)
  - Giám sát và đánh giá toàn diện
  - Triển khai nhanh một cú nhấp qua mẫu ARM

#### Ví dụ nội bộ - Ứng dụng Container (Chương 2-5)
**Các ví dụ triển khai container toàn diện trong repo này:**
- [**Ví dụ ứng dụng Container**](examples/container-app/README.md) - Hướng dẫn hoàn chỉnh triển khai container
  - [API Flask đơn giản](../../examples/container-app/simple-flask-api) - API REST cơ bản với khả năng scale-to-zero
  - [Kiến trúc Microservices](../../examples/container-app/microservices) - Triển khai đa dịch vụ sẵn sàng sản xuất
  - Khởi động nhanh, sản xuất và các mẫu triển khai nâng cao
  - Hướng dẫn giám sát, bảo mật, và tối ưu chi phí

#### Ví dụ bên ngoài - Ứng dụng đơn giản (Chương 1-2)
**Clone các repo Azure Samples này để bắt đầu:**
- [Ứng dụng Web đơn giản - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mô hình triển khai cơ bản
- [Website tĩnh - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Triển khai nội dung tĩnh
- [Ứng dụng Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Triển khai API REST

#### Ví dụ bên ngoài - Tích hợp Cơ sở dữ liệu (Chương 3-4)  
- [Ứng dụng CSDL - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mô hình kết nối cơ sở dữ liệu
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Quy trình dữ liệu không máy chủ

#### Ví dụ bên ngoài - Mẫu nâng cao (Chương 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Kiến trúc đa dịch vụ
- [Jobs Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Xử lý nền  
- [Pipeline ML doanh nghiệp](https://github.com/Azure-Samples/mlops-v2) - Mẫu ML sẵn sàng sản xuất

### Bộ sưu tập mẫu bên ngoài
- [**Thư viện mẫu chính thức của AZD**](https://azure.github.io/awesome-azd/) - Bộ sưu tập mẫu chính thức và cộng đồng chọn lọc
- [**Mẫu Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Tài liệu mẫu Microsoft Learn
- [**Thư mục ví dụ**](examples/README.md) - Ví dụ học tập nội bộ với giải thích chi tiết

---

## 📚 Tài nguyên & Tham khảo học tập

### Tham Khảo Nhanh
- [**Bảng Lệnh Tổng Hợp**](resources/cheat-sheet.md) - Các lệnh azd thiết yếu được sắp xếp theo chương
- [**Thuật Ngữ**](resources/glossary.md) - Thuật ngữ Azure và azd  
- [**Câu Hỏi Thường Gặp**](resources/faq.md) - Các câu hỏi phổ biến được sắp xếp theo chương học
- [**Hướng Dẫn Học Tập**](resources/study-guide.md) - Các bài tập luyện tập toàn diện

### Các Buổi Thực Hành
- [**Phòng Thí Nghiệm AI Workshop**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Biến giải pháp AI của bạn có thể triển khai bằng AZD (2-3 giờ)
- [**Buổi Thực Hành Tương Tác**](workshop/README.md) - 8 bài tập có hướng dẫn với MkDocs và GitHub Codespaces
  - Các bước: Giới thiệu → Lựa chọn → Xác thực → Phân tích → Cấu hình → Tùy chỉnh → Dọn dẹp → Tổng kết

### Tài Nguyên Học Ngoài
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Trung tâm Kiến Trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Máy tính Giá Trị Azure](https://azure.microsoft.com/pricing/calculator/)
- [Trạng thái Azure](https://status.azure.com/)

### Kỹ Năng Đại Lý AI Cho Trình Soạn Thảo Của Bạn
- [**Kỹ Năng Microsoft Azure trên skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 kỹ năng đại lý mở cho AI Azure, Foundry, triển khai, chẩn đoán, tối ưu chi phí, và nhiều hơn. Cài đặt chúng trong GitHub Copilot, Cursor, Claude Code hoặc các đại lý được hỗ trợ:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hướng Dẫn Sửa Lỗi Nhanh

**Các sự cố thường gặp của người mới và các giải pháp ngay lập tức:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Thời gian chờ bình thường:**
- Ứng dụng web đơn giản: 5-10 phút
- Ứng dụng có cơ sở dữ liệu: 10-15 phút
- Ứng dụng AI: 15-25 phút (Việc cung cấp OpenAI chậm)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Tài Nguyên Sửa Lỗi Toàn Diện

- **Hướng dẫn các sự cố phổ biến:** [Giải pháp chi tiết](docs/chapter-07-troubleshooting/common-issues.md)
- **Các sự cố AI cụ thể:** [Sửa lỗi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hướng dẫn gỡ lỗi:** [Gỡ lỗi từng bước](docs/chapter-07-troubleshooting/debugging.md)
- **Nhận trợ giúp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Hoàn Thành Khóa Học & Chứng Nhận

### Theo Dõi Tiến Độ
Theo dõi tiến trình học qua từng chương:

- [ ] **Chương 1**: Nền tảng & Khởi đầu nhanh ✅
- [ ] **Chương 2**: Phát triển ưu tiên AI ✅  
- [ ] **Chương 3**: Cấu hình & Xác thực ✅
- [ ] **Chương 4**: Cơ sở hạ tầng dưới dạng mã & Triển khai ✅
- [ ] **Chương 5**: Giải pháp AI đa đại lý ✅
- [ ] **Chương 6**: Kiểm tra & Lập kế hoạch tiền triển khai ✅
- [ ] **Chương 7**: Sửa lỗi & Gỡ lỗi ✅
- [ ] **Chương 8**: Mô hình sản xuất & doanh nghiệp ✅

### Xác Minh Kiến Thức
Sau khi hoàn thành mỗi chương, xác minh kiến thức của bạn bằng cách:
1. **Bài Tập Thực Hành**: Hoàn thành bài triển khai thực tế của chương
2. **Kiểm Tra Kiến Thức**: Xem lại phần FAQ cho chương của bạn
3. **Thảo Luận Cộng Đồng**: Chia sẻ trải nghiệm của bạn trong Azure Discord
4. **Chương Tiếp Theo**: Tiến bước sang cấp độ phức tạp hơn

### Lợi Ích Khi Hoàn Thành Khóa Học
Khi hoàn thành tất cả các chương, bạn sẽ có:
- **Kinh nghiệm sản xuất**: Triển khai ứng dụng AI thực tế trên Azure
- **Kỹ năng chuyên nghiệp**: Khả năng triển khai sẵn sàng cho doanh nghiệp  
- **Sự công nhận cộng đồng**: Thành viên tích cực của cộng đồng nhà phát triển Azure
- **Thăng tiến nghề nghiệp**: Chuyên môn AZD và triển khai AI có nhu cầu cao

---

## 🤝 Cộng Đồng & Hỗ Trợ

### Nhận Trợ Giúp & Hỗ Trợ
- **Vấn đề kỹ thuật**: [Báo lỗi và yêu cầu tính năng](https://github.com/microsoft/azd-for-beginners/issues)
- **Câu hỏi học tập**: [Cộng đồng Microsoft Azure Discord](https://discord.gg/microsoft-azure) và [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Trợ giúp AI cụ thể**: Tham gia [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tài liệu**: [Tài liệu chính thức Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Thông Tin Cộng Đồng Từ Microsoft Foundry Discord

**Kết quả khảo sát gần đây từ kênh #Azure:**
- **45%** nhà phát triển muốn sử dụng AZD cho khối lượng công việc AI
- **Thách thức hàng đầu**: Triển khai đa dịch vụ, quản lý thông tin đăng nhập, sẵn sàng sản xuất  
- **Yêu cầu nhiều nhất**: Mẫu AI cụ thể, hướng dẫn sửa lỗi, thực hành tốt nhất

**Tham gia cộng đồng của chúng tôi để:**
- Chia sẻ kinh nghiệm AZD + AI và nhận trợ giúp
- Truy cập bản xem trước sớm các mẫu AI mới
- Góp phần vào các thực hành tốt nhất về triển khai AI
- Ảnh hưởng đến phát triển tính năng AI + AZD trong tương lai

### Đóng Góp Cho Khóa Học
Chúng tôi hoan nghênh các đóng góp! Vui lòng đọc [Hướng dẫn đóng góp](CONTRIBUTING.md) của chúng tôi về:
- **Cải thiện nội dung**: Nâng cao các chương và ví dụ hiện có
- **Ví dụ mới**: Thêm các tình huống và mẫu thực tế  
- **Dịch thuật**: Giúp duy trì hỗ trợ đa ngôn ngữ
- **Báo cáo lỗi**: Nâng cao độ chính xác và rõ ràng
- **Tiêu chuẩn cộng đồng**: Tuân thủ các hướng dẫn cộng đồng bao gồm của chúng tôi

---

## 📄 Thông Tin Khóa Học

### Giấy phép
Dự án này được cấp phép theo Giấy phép MIT - xem file [LICENSE](../../LICENSE) để biết chi tiết.

### Tài Nguyên Học Liên Quan của Microsoft

Nhóm của chúng tôi sản xuất các khóa học học tập toàn diện khác:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j cho Người Mới](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js cho Người Mới](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain cho Người Mới](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Đại Lý
[![AZD cho Người Mới](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI cho Người Mới](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP cho Người Mới](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Đại Lý cho Người Mới](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Chuỗi AI Sinh Tạo
[![AI Sinh Tạo cho Người Mới](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Sinh Tạo (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Sinh Tạo (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI Sinh Tạo (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Học Cốt Lõi
[![ML cho Người Mới](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Khoa Học Dữ Liệu cho Người Mới](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI cho Người Mới](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![An Ninh Mạng cho Người Mới](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Phát Triển Web cho Người Mới](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT cho Người Mới](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Phát Triển XR cho Người Mới](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Chuỗi Copilot
[![Copilot cho Lập Trình Ghép AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot cho C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Cuộc Phiêu Lưu Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Điều Hướng Khóa Học

**🚀 Sẵn sàng bắt đầu học?**

**Người mới bắt đầu**: Bắt đầu với [Chương 1: Nền tảng & Khởi đầu nhanh](#-chapter-1-foundation--quick-start)  
**Nhà phát triển AI**: Nhảy đến [Chương 2: Phát triển ưu tiên AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Nhà phát triển có kinh nghiệm**: Bắt đầu với [Chương 3: Cấu hình & Xác thực](#️-chapter-3-configuration--authentication)

**Bước tiếp theo**: [Bắt đầu Chương 1 - Cơ bản về AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->