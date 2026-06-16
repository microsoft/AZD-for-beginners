# AZD For Beginners: A Structured Learning Journey

![AZD dành cho người mới bắt đầu](../../translated_images/vi/azdbeginners.5527441dd9f74068.webp) 

[![Người theo dõi GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Fork trên GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Sao trên GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Bản dịch tự động (Luôn được cập nhật)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Tiếng Ả Rập](../ar/README.md) | [Tiếng Bengal](../bn/README.md) | [Tiếng Bungari](../bg/README.md) | [Tiếng Miến Điện (Myanmar)](../my/README.md) | [Tiếng Trung (Giản thể)](../zh-CN/README.md) | [Tiếng Trung (Phồn thể, Hồng Kông)](../zh-HK/README.md) | [Tiếng Trung (Phồn thể, Macao)](../zh-MO/README.md) | [Tiếng Trung (Phồn thể, Đài Loan)](../zh-TW/README.md) | [Tiếng Croatia](../hr/README.md) | [Tiếng Séc](../cs/README.md) | [Tiếng Đan Mạch](../da/README.md) | [Tiếng Hà Lan](../nl/README.md) | [Tiếng Estonia](../et/README.md) | [Tiếng Phần Lan](../fi/README.md) | [Tiếng Pháp](../fr/README.md) | [Tiếng Đức](../de/README.md) | [Tiếng Hy Lạp](../el/README.md) | [Tiếng Do Thái](../he/README.md) | [Tiếng Hindi](../hi/README.md) | [Tiếng Hungary](../hu/README.md) | [Tiếng Indonesia](../id/README.md) | [Tiếng Ý](../it/README.md) | [Tiếng Nhật](../ja/README.md) | [Tiếng Kannada](../kn/README.md) | [Tiếng Khmer](../km/README.md) | [Tiếng Hàn](../ko/README.md) | [Tiếng Litva](../lt/README.md) | [Tiếng Mã Lai](../ms/README.md) | [Tiếng Malayalam](../ml/README.md) | [Tiếng Marathi](../mr/README.md) | [Tiếng Nepal](../ne/README.md) | [Tiếng Pidgin Nigeria](../pcm/README.md) | [Tiếng Na Uy](../no/README.md) | [Tiếng Ba Tư (Farsi)](../fa/README.md) | [Tiếng Ba Lan](../pl/README.md) | [Tiếng Bồ Đào Nha (Brazil)](../pt-BR/README.md) | [Tiếng Bồ Đào Nha (Portugal)](../pt-PT/README.md) | [Tiếng Punjabi (Gurmukhi)](../pa/README.md) | [Tiếng Romania](../ro/README.md) | [Tiếng Nga](../ru/README.md) | [Tiếng Serbia (Chữ Cyrillic)](../sr/README.md) | [Tiếng Slovakia](../sk/README.md) | [Tiếng Slovenia](../sl/README.md) | [Tiếng Tây Ban Nha](../es/README.md) | [Tiếng Swahili](../sw/README.md) | [Tiếng Thụy Điển](../sv/README.md) | [Tiếng Tagalog (Filipino)](../tl/README.md) | [Tiếng Tamil](../ta/README.md) | [Tiếng Telugu](../te/README.md) | [Tiếng Thái](../th/README.md) | [Tiếng Thổ Nhĩ Kỳ](../tr/README.md) | [Tiếng Ukraina](../uk/README.md) | [Tiếng Urdu](../ur/README.md) | [Tiếng Việt](./README.md)

> **Ưu tiên sao chép cục bộ?**
>
> Kho lưu trữ này bao gồm hơn 50 bản dịch ngôn ngữ, điều này làm tăng đáng kể dung lượng tải xuống. Để clone mà không có các bản dịch, hãy sử dụng sparse checkout:
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
> Điều này cung cấp cho bạn mọi thứ bạn cần để hoàn thành khóa học với tốc độ tải xuống nhanh hơn nhiều.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Có gì mới trong azd hôm nay

> 📌 Khóa học này được kiểm thử với **`azd 1.25.6`** (tháng 6 năm 2026). Chạy `azd version` để kiểm tra phiên bản của bạn, và `azd upgrade` để cập nhật lên bản mới nhất.

Azure Developer CLI đã phát triển vượt ra ngoài các ứng dụng web và API truyền thống. Ngày nay, azd là công cụ duy nhất để triển khai **bất kỳ** ứng dụng nào lên Azure—bao gồm cả các ứng dụng được hỗ trợ bởi AI và các tác nhân thông minh.

Điều này có ý nghĩa gì với bạn:

- **Các tác nhân AI giờ là workload azd hạng nhất.** Bạn có thể khởi tạo, triển khai và quản lý các dự án tác nhân AI bằng cùng quy trình `azd init` → `azd up` mà bạn đã biết.
- **Một vòng đời tác nhân hoàn chỉnh từ CLI.** Tiện ích mở rộng `azure.ai.agents` giờ bao phủ toàn bộ hành trình—`azd ai agent init` để tạo khung, `azd ai agent invoke` để thử nghiệm (với đầu ra thời gian phản hồi), `azd ai agent eval generate` và `azd ai agent optimize` để đo lường và cải thiện chất lượng, và `azd ai agent delete` để dọn dẹp.
- **Nhiều khối xây dựng AI hơn.** Các tiện ích mở rộng preview mới—`azure.ai.skills` và `azure.ai.connections`—cho phép bạn quản lý các kỹ năng tác nhân có thể tái sử dụng và các kết nối Foundry trực tiếp với azd.
- **Tích hợp Microsoft Foundry** mang việc triển khai mô hình, hosting tác nhân và cấu hình dịch vụ AI trực tiếp vào hệ sinh thái mẫu azd.
- **Các thao tác cơ bản mượt mà hơn.** Các bản phát hành gần đây đã làm cho `azd init` là idempotent (an toàn để chạy lại), làm cho `azd auth login` tự động xóa token cũ, và thêm lời nhắc thiết lập lần chạy đầu thân thiện cho `azd tool`.
- **Quy trình chính không thay đổi.** Dù bạn đang triển khai một ứng dụng todo, một microservice, hay một giải pháp AI đa tác nhân, các lệnh vẫn giống nhau.

> **Lưu ý cho người dùng Aspire:** Microsoft hiện gọi sản phẩm đơn giản là **Aspire** (trước đây là ".NET Aspire"). Hỗ trợ Aspire trong azd không thay đổi—chỉ có tên được cập nhật.

Nếu bạn đã dùng azd trước đây, hỗ trợ AI là sự mở rộng tự nhiên—không phải một công cụ riêng hay một nhánh nâng cao. Nếu bạn bắt đầu mới, bạn sẽ học một quy trình làm việc áp dụng cho mọi thứ.

---

## 🚀 Azure Developer CLI (azd) là gì?

**Azure Developer CLI (azd)** là công cụ dòng lệnh thân thiện với nhà phát triển, giúp đơn giản hóa việc triển khai ứng dụng lên Azure. Thay vì phải tạo và kết nối hàng chục tài nguyên Azure một cách thủ công, bạn có thể triển khai toàn bộ ứng dụng chỉ với một lệnh.

### Phép màu của `azd up`

```bash
# Lệnh đơn này thực hiện mọi thứ:
# ✅ Tạo tất cả tài nguyên Azure
# ✅ Cấu hình mạng và bảo mật
# ✅ Xây dựng mã ứng dụng của bạn
# ✅ Triển khai lên Azure
# ✅ Cung cấp cho bạn một URL hoạt động
azd up
```

**Xong rồi!** Không cần nhấp trong Azure Portal, không cần học các template ARM phức tạp trước, không cần cấu hình thủ công - chỉ có các ứng dụng hoạt động trên Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Sự khác biệt là gì?

Đây là câu hỏi phổ biến nhất mà người mới thường hỏi. Đây là câu trả lời đơn giản:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Quản lý các tài nguyên Azure riêng lẻ | Triển khai ứng dụng hoàn chỉnh |
| **Mindset** | Tập trung vào hạ tầng | Tập trung vào ứng dụng |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Phải biết các dịch vụ Azure | Chỉ cần biết ứng dụng của bạn |
| **Best For** | DevOps, Hạ tầng | Nhà phát triển, Phát thảo nhanh |

### Tương tự đơn giản

- **Azure CLI** giống như có đầy đủ công cụ để xây một ngôi nhà - búa, cưa, đinh. Bạn có thể xây bất cứ thứ gì, nhưng bạn cần biết xây dựng.
- **Azure Developer CLI** giống như thuê một nhà thầu - bạn mô tả những gì bạn muốn, và họ lo phần xây dựng.

### Khi nào dùng cái nào

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Chúng hoạt động cùng nhau!

AZD sử dụng Azure CLI bên dưới. Bạn có thể dùng cả hai:
```bash
# Triển khai ứng dụng của bạn bằng AZD
azd up

# Sau đó điều chỉnh cụ thể các tài nguyên với Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Tìm mẫu trong Awesome AZD

Đừng bắt đầu từ con số không! **Awesome AZD** là bộ sưu tập cộng đồng các mẫu sẵn sàng để triển khai:

| Resource | Description |
|----------|-------------|
| 🔗 [**Thư viện Awesome AZD**](https://azure.github.io/awesome-azd/) | Duyệt hơn 200 mẫu với triển khai một lần nhấp |
| 🔗 [**Gửi một mẫu**](https://github.com/Azure/awesome-azd/issues) | Đóng góp mẫu của bạn cho cộng đồng |
| 🔗 [**Kho GitHub**](https://github.com/Azure/awesome-azd) | Nhấn sao và khám phá mã nguồn |

### Các mẫu AI phổ biến từ Awesome AZD

```bash
# Trò chuyện RAG với Mô hình Microsoft Foundry + Tìm kiếm AI
azd init --template azure-search-openai-demo

# Ứng dụng Trò chuyện AI Nhanh
azd init --template openai-chat-app-quickstart

# Đại lý AI với Đại lý Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Bắt đầu trong 3 Bước

Trước khi bắt đầu, hãy đảm bảo máy của bạn sẵn sàng cho mẫu mà bạn muốn triển khai:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Nếu bất kỳ kiểm tra bắt buộc nào không đạt, hãy khắc phục trước rồi tiếp tục với phần bắt đầu nhanh.

### Bước 1: Cài đặt AZD (2 phút)

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

### Bước 2: Xác thực cho AZD

```bash
# Tùy chọn nếu bạn có kế hoạch sử dụng các lệnh Azure CLI trực tiếp trong khóa học này
az login

# Bắt buộc cho các quy trình làm việc AZD
azd auth login
```

Nếu bạn không chắc cần cái nào, hãy làm theo quy trình thiết lập đầy đủ trong [Cài đặt & Thiết lập](docs/chapter-01-foundation/installation.md#authentication-setup).

### Bước 3: Triển khai Ứng dụng Đầu tiên của bạn

```bash
# Khởi tạo từ một mẫu
azd init --template todo-nodejs-mongo

# Triển khai lên Azure (tạo mọi thứ!)
azd up
```

**🎉 Xong rồi!** Ứng dụng của bạn hiện đã hoạt động trên Azure.

### Dọn dẹp (Đừng quên!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cách sử dụng Khóa học này

Khóa học này được thiết kế cho việc **học tiến bộ** - bắt đầu từ nơi bạn cảm thấy thoải mái và nâng dần trình độ:

| Your Experience | Start Here |
|-----------------|------------|
| **Brand new to Azure** | [Chương 1: Nền tảng](#-chapter-1-foundation--quick-start) |
| **Know Azure, new to AZD** | [Chương 1: Nền tảng](#-chapter-1-foundation--quick-start) |
| **Want to deploy AI apps** | [Chương 2: Phát triển ưu tiên AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Want hands-on practice** | [🎓 Hội thảo tương tác](workshop/README.md) - phòng thí nghiệm hướng dẫn 3-4 giờ |
| **Need production patterns** | [Chương 8: Sản xuất & Doanh nghiệp](#-chapter-8-production--enterprise-patterns) |

### Thiết lập nhanh

1. **Fork kho lưu trữ này**: [![Fork trên GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Sao chép (Clone)**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Nhận trợ giúp**: [Cộng đồng Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Ưu tiên sao chép cục bộ?**

> Kho lưu trữ này bao gồm hơn 50 bản dịch ngôn ngữ, điều này làm tăng đáng kể dung lượng tải xuống. Để clone mà không có các bản dịch, hãy sử dụng sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Điều này cung cấp cho bạn mọi thứ bạn cần để hoàn thành khóa học với tốc độ tải xuống nhanh hơn nhiều.


## Tổng quan Khóa học

Thành thạo Azure Developer CLI (azd) thông qua các chương được cấu trúc cho việc học tiến bộ. **Tập trung đặc biệt vào triển khai ứng dụng AI với tích hợp Microsoft Foundry.**
### Tại sao Khóa học này là Cần thiết cho các Nhà phát triển Hiện đại

Dựa trên những thông tin từ cộng đồng Microsoft Foundry trên Discord, **45% nhà phát triển muốn sử dụng AZD cho khối lượng công việc AI** nhưng gặp phải các thách thức với:
- Kiến trúc AI phức tạp nhiều dịch vụ
- Những thực hành tốt nhất khi triển khai AI lên production  
- Tích hợp và cấu hình dịch vụ AI trên Azure
- Tối ưu chi phí cho khối lượng công việc AI
- Khắc phục sự cố triển khai liên quan đến AI

### Mục tiêu học tập

Khi hoàn thành khóa học có cấu trúc này, bạn sẽ:
- **Nắm vững nền tảng AZD**: Các khái niệm cốt lõi, cài đặt và cấu hình
- **Triển khai ứng dụng AI**: Sử dụng AZD với các dịch vụ Microsoft Foundry
- **Thực hiện Infrastructure as Code**: Quản lý tài nguyên Azure bằng mẫu Bicep
- **Khắc phục sự cố triển khai**: Giải quyết các vấn đề phổ biến và gỡ lỗi
- **Tối ưu cho môi trường sản xuất**: Bảo mật, mở rộng, giám sát và quản lý chi phí
- **Xây dựng giải pháp đa tác nhân**: Triển khai kiến trúc AI phức tạp

## Trước khi bạn bắt đầu: Tài khoản, quyền truy cập và giả định

Trước khi bạn bắt đầu Chương 1, hãy đảm bảo bạn đã có những điều sau. Các bước cài đặt trong hướng dẫn này giả định rằng những yêu cầu cơ bản này đã được xử lý.

- **Một đăng ký Azure**: Bạn có thể dùng một đăng ký sẵn có từ công ty hoặc tài khoản cá nhân, hoặc tạo một [dùng thử miễn phí](https://aka.ms/azurefreetrial) để bắt đầu.
- **Quyền tạo tài nguyên Azure**: Đối với hầu hết bài tập, bạn nên có ít nhất quyền **Contributor** trên đăng ký hoặc nhóm tài nguyên mục tiêu. Một số chương có thể còn giả định rằng bạn có thể tạo nhóm tài nguyên, managed identities và gán RBAC.
- [**Một tài khoản GitHub**](https://github.com): Điều này hữu ích để fork repository, theo dõi thay đổi của riêng bạn và sử dụng GitHub Codespaces cho workshop.
- **Yêu cầu runtime cho mẫu**: Một số mẫu cần công cụ cục bộ như Node.js, Python, Java hoặc Docker. Chạy công cụ xác thực thiết lập trước khi bắt đầu để phát hiện thiếu sót sớm.
- **Làm quen cơ bản với terminal**: Bạn không cần phải là chuyên gia, nhưng nên thoải mái khi chạy các lệnh như `git clone`, `azd auth login`, và `azd up`.

> **Đang làm việc trong đăng ký doanh nghiệp?**
> Nếu môi trường Azure của bạn do quản trị viên quản lý, hãy xác nhận trước rằng bạn có thể triển khai tài nguyên trong đăng ký hoặc nhóm tài nguyên bạn dự định sử dụng. Nếu không, hãy yêu cầu một đăng ký sandbox hoặc quyền Contributor trước khi bắt đầu.

> **Mới với Azure?**
> Bắt đầu với đăng ký dùng thử Azure của bạn hoặc đăng ký trả theo sử dụng tại https://aka.ms/azurefreetrial để bạn có thể hoàn thành các bài tập từ đầu tới cuối mà không phải chờ phê duyệt ở cấp tenant.

## 🗺️ Sơ đồ khóa học: Điều hướng nhanh theo chương

Each chapter has a dedicated README with learning objectives, quick starts, and exercises:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Bắt đầu | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | Ứng dụng ưu tiên AI | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Xác thực & Bảo mật | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Triển khai | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Giải pháp tác nhân AI | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Lập kế hoạch & Xác thực | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Gỡ lỗi & Sửa | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Mô hình doanh nghiệp | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Phòng thí nghiệm thực hành | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Total Course Duration:** ~10-14 hours | **Skill Progression:** Beginner → Production-Ready

---

## 📚 Các chương học

*Chọn lộ trình học dựa trên trình độ và mục tiêu*

### 🚀 Chương 1: Nền tảng & Bắt đầu nhanh
**Yêu cầu**: đăng ký Azure, kiến thức cơ bản về dòng lệnh  
**Thời lượng**: 30-45 phút  
**Mức độ phức tạp**: ⭐

#### Những gì bạn sẽ học
- Hiểu các khái niệm cơ bản về Azure Developer CLI
- Cài đặt AZD trên nền tảng của bạn
- Triển khai thành công dự án đầu tiên của bạn

#### Tài nguyên học tập
- **🎯 Bắt đầu tại đây**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Lý thuyết**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Các khái niệm cốt lõi và thuật ngữ
- **⚙️ Thiết lập**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Hướng dẫn theo nền tảng
- **🛠️ Thực hành**: [Your First Project](docs/chapter-01-foundation/first-project.md) - Hướng dẫn từng bước
- **📋 Tham khảo nhanh**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Bài tập thực hành
```bash
# Kiểm tra cài đặt nhanh
azd version

# Triển khai ứng dụng đầu tiên của bạn
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kết quả chương**: Triển khai thành công một ứng dụng web đơn giản lên Azure bằng AZD

**✅ Xác thực thành công:**
```bash
# Sau khi hoàn thành Chương 1, bạn sẽ có thể:
azd version              # Hiển thị phiên bản đã cài đặt
azd init --template todo-nodejs-mongo  # Khởi tạo dự án
azd up                  # Triển khai lên Azure
azd show                # Hiển thị URL của ứng dụng đang chạy
# Ứng dụng mở trong trình duyệt và hoạt động
azd down --force --purge  # Dọn dẹp tài nguyên
```

**📊 Thời gian đầu tư:** 30-45 phút  
**📈 Trình độ sau khi hoàn thành:** Có thể tự triển khai các ứng dụng cơ bản độc lập
**📈 Trình độ sau khi hoàn thành:** Có thể tự triển khai các ứng dụng cơ bản độc lập

---

### 🤖 Chương 2: Phát triển ưu tiên AI (Khuyến nghị cho nhà phát triển AI)
**Yêu cầu**: Hoàn thành Chương 1  
**Thời lượng**: 1-2 giờ  
**Mức độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Tích hợp Microsoft Foundry với AZD
- Triển khai các ứng dụng được hỗ trợ bởi AI
- Hiểu cấu hình dịch vụ AI

#### Tài nguyên học tập
- **🎯 Bắt đầu tại đây**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Tác nhân AI**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Triển khai các tác nhân thông minh với AZD
- **📖 Mẫu & mô hình**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Triển khai và quản lý mô hình AI
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Chuẩn hóa giải pháp AI cho AZD
- **🎥 Hướng dẫn tương tác**: [Workshop Materials](workshop/README.md) - Học trên trình duyệt với MkDocs * DevContainer Environment
- **📋 Mẫu**: [Microsoft Foundry Templates](#tài-nguyên-hội-thảo)
- **📝 Ví dụ**: [AZD Deployment Examples](examples/README.md)

#### Bài tập thực hành
```bash
# Triển khai ứng dụng AI đầu tiên của bạn
azd init --template azure-search-openai-demo
azd up

# Thử thêm các mẫu AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kết quả chương**: Triển khai và cấu hình một ứng dụng chat tích hợp AI với khả năng RAG

**✅ Xác thực thành công:**
```bash
# Sau Chương 2, bạn sẽ có thể:
azd init --template azure-search-openai-demo
azd up
# Kiểm tra giao diện trò chuyện AI
# Đặt câu hỏi và nhận câu trả lời do AI cung cấp kèm nguồn
# Xác minh tích hợp tìm kiếm hoạt động
azd monitor  # Kiểm tra Application Insights hiển thị dữ liệu giám sát
azd down --force --purge
```

**📊 Thời gian đầu tư:** 1-2 giờ  
**📈 Trình độ sau khi hoàn thành:** Có thể triển khai và cấu hình các ứng dụng AI sẵn sàng cho production  
**💰 Nhận thức về chi phí:** Hiểu mức chi phí phát triển $80-150/tháng, chi phí production $300-3500/tháng

#### 💰 Cân nhắc chi phí cho việc triển khai AI

**Môi trường phát triển (Ước tính $80-150/tháng):**
- Microsoft Foundry Models (Thanh toán theo mức sử dụng): $0-50/tháng (dựa trên lượng token)
- AI Search (hạng Basic): $75/tháng
- Container Apps (Consumption): $0-20/tháng
- Storage (Standard): $1-5/tháng

**Môi trường production (Ước tính $300-3,500+/tháng):**
- Microsoft Foundry Models (PTU cho hiệu năng ổn định): $3,000+/tháng HOẶC Thanh toán theo mức sử dụng với khối lượng cao
- AI Search (hạng Standard): $250/tháng
- Container Apps (Dedicated): $50-100/tháng
- Application Insights: $5-50/tháng
- Storage (Premium): $10-50/tháng

**💡 Mẹo tối ưu chi phí:**
- Sử dụng **Free Tier** Microsoft Foundry Models để học (Azure OpenAI 50,000 tokens/tháng được bao gồm)
- Chạy `azd down` để giải phóng tài nguyên khi không phát triển tích cực
- Bắt đầu với thanh toán theo mức tiêu thụ, chỉ nâng cấp lên PTU cho production
- Sử dụng `azd provision --preview` để ước tính chi phí trước khi triển khai
- Bật auto-scaling: chỉ trả cho mức sử dụng thực tế

**Giám sát chi phí:**
```bash
# Kiểm tra ước tính chi phí hàng tháng
azd provision --preview

# Giám sát chi phí thực tế trong Cổng thông tin Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chương 3: Cấu hình & Xác thực
**Yêu cầu**: Hoàn thành Chương 1  
**Thời lượng**: 45-60 phút  
**Mức độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Cấu hình và quản lý môi trường
- Các thực hành tốt nhất về xác thực và bảo mật
- Đặt tên và tổ chức tài nguyên

#### Tài nguyên học tập
- **📖 Cấu hình**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Thiết lập môi trường
- **🔐 Bảo mật**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Các mẫu xác thực
- **📝 Ví dụ**: [Database App Example](examples/database-app/README.md) - Ví dụ database với AZD

#### Bài tập thực hành
- Cấu hình nhiều môi trường (dev, staging, prod)
- Thiết lập xác thực managed identity
- Triển khai các cấu hình theo môi trường cụ thể

**💡 Kết quả chương**: Quản lý nhiều môi trường với xác thực và bảo mật thích hợp

---

### 🏗️ Chương 4: Infrastructure as Code & Triển khai
**Yêu cầu**: Hoàn thành Chương 1-3  
**Thời lượng**: 1-1.5 giờ  
**Mức độ phức tạp**: ⭐⭐⭐

#### Những gì bạn sẽ học
- Các mẫu triển khai nâng cao
- Infrastructure as Code với Bicep
- Chiến lược cấp phát tài nguyên

#### Tài nguyên học tập
- **📖 Triển khai**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Quy trình hoàn chỉnh
- **🏗️ Cấp phát**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Quản lý tài nguyên Azure
- **📝 Ví dụ**: [Container App Example](../../examples/container-app) - Triển khai có container

#### Bài tập thực hành
- Tạo các mẫu Bicep tùy chỉnh
- Triển khai các ứng dụng nhiều dịch vụ
- Triển khai chiến lược blue-green

**💡 Kết quả chương**: Triển khai các ứng dụng nhiều dịch vụ phức tạp bằng cách sử dụng các mẫu hạ tầng tùy chỉnh
### 🎯 Chương 5: Giải pháp AI đa tác nhân (Nâng cao)
**Yêu cầu trước**: Đã hoàn thành Chương 1-2  
**Thời lượng**: 2-3 giờ  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Mẫu kiến trúc đa tác nhân
- Điều phối và phối hợp giữa các tác nhân
- Triển khai AI sẵn sàng cho sản xuất

#### Tài nguyên học tập
- **🤖 Dự án nổi bật**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Triển khai hoàn chỉnh
- **🛠️ Gói mẫu ARM**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Triển khai một lần nhấp
- **📖 Kiến trúc**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Các mẫu phối hợp

#### Bài tập thực hành
```bash
# Triển khai giải pháp đa tác nhân bán lẻ hoàn chỉnh
cd examples/retail-multiagent-arm-template
./deploy.sh

# Khám phá cấu hình các tác nhân
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kết quả chương**: Triển khai và quản lý giải pháp AI đa tác nhân sẵn sàng cho sản xuất với các tác nhân Customer và Inventory

---

### 🔍 Chương 6: Xác thực & Lập kế hoạch Trước Triển khai
**Yêu cầu trước**: Đã hoàn thành Chương 4  
**Thời lượng**: 1 giờ  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Lập kế hoạch công suất và xác thực tài nguyên
- Chiến lược lựa chọn SKU
- Kiểm tra trước chuyến bay và tự động hóa

#### Tài nguyên học tập
- **📊 Lập kế hoạch**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Xác thực tài nguyên
- **💰 Lựa chọn**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Lựa chọn tiết kiệm chi phí
- **✅ Xác thực**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Kịch bản tự động

#### Bài tập thực hành
- Chạy các kịch bản xác thực công suất
- Tối ưu lựa chọn SKU theo chi phí
- Triển khai kiểm tra tự động trước triển khai

**💡 Kết quả chương**: Xác thực và tối ưu hóa triển khai trước khi thực hiện

---

### 🚨 Chương 7: Khắc phục sự cố & Gỡ lỗi
**Yêu cầu trước**: Đã hoàn thành bất kỳ chương triển khai nào  
**Thời lượng**: 1-1.5 giờ  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Các phương pháp gỡ lỗi có hệ thống
- Các vấn đề phổ biến và giải pháp
- Khắc phục sự cố đặc thù cho AI

#### Tài nguyên học tập
- **🔧 Vấn đề phổ biến**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - Câu hỏi thường gặp và giải pháp
- **🕵️ Gỡ lỗi**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Các chiến lược từng bước
- **🤖 Vấn đề AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Sự cố dịch vụ AI

#### Bài tập thực hành
- Chẩn đoán thất bại triển khai
- Giải quyết vấn đề xác thực
- Gỡ lỗi kết nối dịch vụ AI

**💡 Kết quả chương**: Tự chủ chẩn đoán và khắc phục các sự cố triển khai phổ biến

---

### 🏢 Chương 8: Mẫu Sản xuất & Doanh nghiệp
**Yêu cầu trước**: Đã hoàn thành Chương 1-4  
**Thời lượng**: 2-3 giờ  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Chiến lược triển khai sản xuất
- Mẫu bảo mật cho doanh nghiệp
- Giám sát và tối ưu chi phí

#### Tài nguyên học tập
- **🏭 Sản xuất**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Mẫu doanh nghiệp
- **📝 Ví dụ**: [Microservices Example](../../examples/microservices) - Kiến trúc phức tạp
- **📊 Giám sát**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Giám sát

#### Bài tập thực hành
- Triển khai các mẫu bảo mật cho doanh nghiệp
- Thiết lập giám sát toàn diện
- Triển khai lên môi trường sản xuất với quản trị phù hợp

**💡 Kết quả chương**: Triển khai ứng dụng sẵn sàng cho doanh nghiệp với đầy đủ khả năng sản xuất

---

## 🎓 Tổng quan Hội thảo: Trải nghiệm Học tập Thực hành

> **⚠️ TRẠNG THÁI HỘI THẢO: Đang phát triển**  
> Tài liệu hội thảo đang được phát triển và hoàn thiện. Các mô-đun cốt lõi hoạt động, nhưng một số phần nâng cao chưa hoàn thiện. Chúng tôi đang tích cực hoàn thành toàn bộ nội dung. [Theo dõi tiến độ →](workshop/README.md)

### Tài liệu hội thảo tương tác
**Học thực hành toàn diện với công cụ dựa trên trình duyệt và bài tập có hướng dẫn**

Tài liệu hội thảo của chúng tôi cung cấp một trải nghiệm học có cấu trúc, tương tác, bổ sung cho chương trình học theo chương ở trên. Hội thảo được thiết kế cho cả học tự học và các buổi có giảng viên hướng dẫn.

#### 🛠️ Tính năng hội thảo
- **Giao diện dựa trên trình duyệt**: Hội thảo đầy đủ chạy trên MkDocs với tìm kiếm, sao chép và tính năng giao diện
- **Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển một lần nhấp
- **Lộ trình học có cấu trúc**: 8 mô-đun bài tập hướng dẫn (tổng 3-4 giờ)
- **Phương pháp lũy tiến**: Giới thiệu → Lựa chọn → Xác thực → Phân tích → Cấu hình → Tùy chỉnh → Dọn dẹp → Kết thúc
- **Môi trường DevContainer tương tác**: Công cụ và phụ thuộc được cấu hình sẵn

#### 📚 Cấu trúc mô-đun hội thảo
Hội thảo tuân theo một **phương pháp 8 mô-đun lũy tiến** đưa bạn từ khám phá đến thành thạo triển khai:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**Luồng hội thảo:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Bắt đầu với Hội thảo
```bash
# Tùy chọn 1: GitHub Codespaces (Được khuyên dùng)
# Nhấp vào "Code" → "Create codespace on main" trong kho lưu trữ

# Tùy chọn 2: Phát triển cục bộ
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Làm theo hướng dẫn thiết lập trong workshop/README.md
```

#### 🎯 Kết quả học tập của Hội thảo
Bằng cách hoàn thành hội thảo, người tham gia sẽ:
- **Triển khai Ứng dụng AI cho Sản xuất**: Sử dụng AZD với dịch vụ Microsoft Foundry
- **Thành thạo Kiến trúc đa tác nhân**: Triển khai các giải pháp tác nhân AI phối hợp
- **Thực hiện các Thực hành Bảo mật**: Cấu hình xác thực và kiểm soát truy cập
- **Tối ưu cho Quy mô**: Thiết kế triển khai hiệu quả về chi phí và hiệu năng
- **Khắc phục sự cố Triển khai**: Giải quyết các vấn đề phổ biến một cách độc lập

#### 📖 Tài nguyên hội thảo
- **🎥 Hướng dẫn tương tác**: [Workshop Materials](workshop/README.md) - Môi trường học tập dựa trên trình duyệt
- **📋 Hướng dẫn theo mô-đun**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Tổng quan hội thảo và mục tiêu
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Tìm và chọn mẫu AI
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Triển khai và xác minh mẫu
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Khám phá kiến trúc mẫu
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Làm chủ azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Tùy chỉnh cho kịch bản của bạn
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Dọn dẹp tài nguyên
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Tổng kết và bước tiếp theo
- **🛠️ Phòng thí nghiệm Hội thảo AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Bài tập tập trung vào AI
- **💡 Bắt đầu nhanh**: [Workshop Setup Guide](workshop/README.md#quick-start) - Cấu hình môi trường

**Phù hợp cho**: Đào tạo doanh nghiệp, khoá học đại học, học tự tốc độ, và bootcamp dành cho nhà phát triển.

---

## 📖 Tìm hiểu sâu: Khả năng của AZD

Ngoài những điều cơ bản, AZD cung cấp các tính năng mạnh mẽ cho triển khai sản xuất:

- **Triển khai dựa trên mẫu** - Sử dụng các mẫu dựng sẵn cho các mô hình ứng dụng phổ biến
- **Hạ tầng như mã** - Quản lý tài nguyên Azure bằng Bicep hoặc Terraform  
- **Luồng công việc tích hợp** - Cấp phát, triển khai và giám sát ứng dụng một cách liền mạch
- **Thân thiện với nhà phát triển** - Tối ưu cho năng suất và trải nghiệm nhà phát triển

### **AZD + Microsoft Foundry: Hoàn hảo cho Triển khai AI**

**Tại sao chọn AZD cho Giải pháp AI?** AZD giải quyết các thách thức hàng đầu mà các nhà phát triển AI gặp phải:

- **Mẫu sẵn sàng cho AI** - Mẫu cấu hình trước cho Microsoft Foundry Models, Azure AI Services, và khối lượng công việc ML
- **Triển khai AI an toàn** - Mẫu bảo mật tích hợp cho dịch vụ AI, khóa API và điểm cuối mô hình  
- **Mẫu AI cho sản xuất** - Thực hành tốt nhất cho triển khai ứng dụng AI có khả năng mở rộng và hiệu quả chi phí
- **Luồng công việc AI đầu-cuối** - Từ phát triển mô hình đến triển khai sản xuất với giám sát phù hợp
- **Tối ưu chi phí** - Phân bổ tài nguyên thông minh và chiến lược tự động mở rộng cho khối lượng công việc AI
- **Tích hợp Microsoft Foundry** - Kết nối liền mạch tới danh mục mô hình và điểm cuối Microsoft Foundry

---

## 🎯 Thư viện Mẫu & Ví dụ

### Nổi bật: Mẫu Microsoft Foundry
**Bắt đầu ở đây nếu bạn đang triển khai ứng dụng AI!**

> **Lưu ý:** Các mẫu này minh họa các mẫu AI khác nhau. Một số là Azure Samples bên ngoài, số khác là triển khai nội bộ.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Nổi bật: Kịch bản học tập hoàn chỉnh
**Mẫu ứng dụng sẵn sàng cho sản xuất được ánh xạ theo chương học**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Các mẫu triển khai AI cơ bản |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | Triển khai RAG với Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Tích hợp Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Khung tác nhân và gọi hàm |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Điều phối AI cho doanh nghiệp |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Kiến trúc đa tác nhân với các tác nhân Customer và Inventory |

### Học theo loại ví dụ

> **📌 Ví dụ Nội bộ vs. Bên ngoài:**  
> **Local Examples** (trong repo này) = Sẵn sàng sử dụng ngay  
> **External Examples** (Azure Samples) = Clone từ các kho liên kết

#### Ví dụ nội bộ (Sẵn sàng sử dụng)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Triển khai hoàn chỉnh sẵn sàng cho sản xuất với mẫu ARM
  - Kiến trúc đa tác nhân (Customer + Inventory agents)
  - Giám sát và đánh giá toàn diện
  - Triển khai một lần nhấp qua mẫu ARM

#### Ví dụ nội bộ - Ứng dụng Container (Chương 2-5)
**Các ví dụ triển khai container toàn diện trong kho này:**
- [**Ví dụ Container App**](examples/container-app/README.md) - Hướng dẫn đầy đủ cho các triển khai dựa trên container
  - [API Flask đơn giản](../../examples/container-app/simple-flask-api) - API REST cơ bản với khả năng scale-to-zero
  - [Kiến trúc Microservices](../../examples/container-app/microservices) - Triển khai nhiều dịch vụ sẵn sàng cho môi trường production
  - Bắt đầu Nhanh, Triển khai Production, và các mẫu nâng cao
  - Hướng dẫn giám sát, bảo mật và tối ưu chi phí

#### Ví dụ bên ngoài - Ứng dụng đơn giản (Chương 1-2)
**Sao chép các kho Azure Samples này để bắt đầu:**
- [Ứng dụng Web đơn giản - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Các mẫu triển khai cơ bản
- [Trang Web Tĩnh - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Triển khai nội dung tĩnh
- [Ứng dụng Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Triển khai API REST

#### Ví dụ bên ngoài - Tích hợp cơ sở dữ liệu (Chương 3-4)  
- [Ứng dụng cơ sở dữ liệu - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Các mẫu kết nối cơ sở dữ liệu
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Luồng công việc dữ liệu serverless

#### Ví dụ bên ngoài - Mẫu nâng cao (Chương 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Kiến trúc nhiều dịch vụ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Xử lý nền  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Các mẫu ML sẵn sàng cho production

### Bộ mẫu bên ngoài
- [**Thư viện mẫu AZD chính thức**](https://azure.github.io/awesome-azd/) - Bộ sưu tập tuyển chọn các mẫu chính thức và cộng đồng
- [**Mẫu Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Tài liệu mẫu trên Microsoft Learn
- [**Thư mục ví dụ**](examples/README.md) - Ví dụ học tập cục bộ với giải thích chi tiết

---

## 📚 Tài nguyên Học tập & Tài liệu tham khảo

### Tham khảo Nhanh
- [**Bảng tóm tắt lệnh**](resources/cheat-sheet.md) - Các lệnh azd thiết yếu được tổ chức theo chương
- [**Thuật ngữ**](resources/glossary.md) - Thuật ngữ Azure và azd  
- [**Câu hỏi thường gặp**](resources/faq.md) - Các câu hỏi thường gặp được tổ chức theo chương học
- [**Hướng dẫn học tập**](resources/study-guide.md) - Bài tập thực hành toàn diện

### Hội thảo Thực hành
- [**Phòng thí nghiệm Hội thảo AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Biến giải pháp AI của bạn có thể triển khai bằng AZD (2-3 giờ)
- [**Hội thảo Tương tác**](workshop/README.md) - 8 bài hướng dẫn theo mô-đun với MkDocs và GitHub Codespaces
  - Theo: Giới thiệu → Lựa chọn → Xác thực → Phân tích → Cấu hình → Tùy chỉnh → Dọn dẹp → Tổng kết

### Tài nguyên Học tập bên ngoài
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### Kỹ năng tác nhân AI cho Trình soạn thảo của bạn
- [**Kỹ năng Microsoft Azure trên skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 kỹ năng tác nhân công khai cho Azure AI, Foundry, triển khai, chẩn đoán, tối ưu chi phí và hơn thế nữa. Cài chúng trong GitHub Copilot, Cursor, Claude Code, hoặc bất kỳ tác nhân nào được hỗ trợ:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hướng dẫn Khắc phục Sự cố Nhanh

**Các sự cố thường gặp mà người mới gặp phải và giải pháp ngay lập tức:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Cài đặt AZD trước
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Xác minh cài đặt
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Liệt kê các đăng ký có sẵn
az account list --output table

# Đặt đăng ký mặc định
az account set --subscription "<subscription-id-or-name>"

# Thiết lập cho môi trường AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Xác minh
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Thử vùng Azure khác
azd env set AZURE_LOCATION "westus2"
azd up

# Hoặc sử dụng các SKU nhỏ hơn trong môi trường phát triển
# Chỉnh sửa infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Tùy chọn 1: Dọn dẹp và thử lại
azd down --force --purge
azd up

# Tùy chọn 2: Chỉ sửa hạ tầng
azd provision

# Tùy chọn 3: Kiểm tra trạng thái chi tiết
azd show

# Tùy chọn 4: Kiểm tra nhật ký trong Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Xác thực lại cho AZD
azd auth logout
azd auth login

# Tùy chọn: làm mới Azure CLI nếu bạn đang chạy các lệnh az
az logout
az login

# Xác minh xác thực
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD tạo các tên duy nhất, nhưng nếu xảy ra xung đột:
azd down --force --purge

# Thử lại với môi trường mới
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Thời gian chờ bình thường:**
- Ứng dụng web đơn giản: 5-10 phút
- Ứng dụng có cơ sở dữ liệu: 10-15 phút
- Ứng dụng AI: 15-25 phút (Việc cấp phát OpenAI chậm)

```bash
# Kiểm tra tiến độ
azd show

# Nếu bị kẹt hơn 30 phút, kiểm tra Azure Portal:
azd monitor --overview
# Tìm các triển khai thất bại
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Kiểm tra vai trò Azure của bạn
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Bạn cần ít nhất vai trò "Contributor"
# Yêu cầu quản trị viên Azure của bạn cấp:
# - Contributor (cho các tài nguyên)
# - User Access Administrator (để gán vai trò)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Hiển thị tất cả các điểm cuối dịch vụ
azd show

# Hoặc mở Azure Portal
azd monitor

# Kiểm tra dịch vụ cụ thể
azd env get-values
# Tìm các biến *_URL
```
</details>

### 📚 Tài nguyên Khắc phục Sự cố Đầy đủ

- **Hướng dẫn Các vấn đề Thường gặp:** [Giải pháp Chi tiết](docs/chapter-07-troubleshooting/common-issues.md)
- **Các vấn đề Riêng cho AI:** [Khắc phục sự cố AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hướng dẫn Gỡ lỗi:** [Gỡ lỗi theo bước](docs/chapter-07-troubleshooting/debugging.md)
- **Nhận trợ giúp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Hoàn thành Khóa học & Chứng chỉ

### Theo dõi Tiến độ
Theo dõi tiến độ học tập của bạn qua từng chương:

- [ ] **Chương 1**: Nền tảng & Bắt đầu Nhanh ✅
- [ ] **Chương 2**: Phát triển Ưu tiên AI ✅  
- [ ] **Chương 3**: Cấu hình & Xác thực ✅
- [ ] **Chương 4**: Hạ tầng dưới dạng mã & Triển khai ✅
- [ ] **Chương 5**: Giải pháp AI đa tác nhân ✅
- [ ] **Chương 6**: Xác nhận & Lập kế hoạch trước khi triển khai ✅
- [ ] **Chương 7**: Khắc phục sự cố & Gỡ lỗi ✅
- [ ] **Chương 8**: Mẫu cho Sản xuất & Doanh nghiệp ✅

### Xác minh Học tập
Sau khi hoàn thành mỗi chương, xác minh kiến thức của bạn bằng cách:
1. **Bài tập Thực hành**: Hoàn thành triển khai thực hành của chương
2. **Kiểm tra Kiến thức**: Xem lại phần Câu hỏi thường gặp của chương bạn
3. **Thảo luận Cộng đồng**: Chia sẻ kinh nghiệm của bạn trên Azure Discord
4. **Chương Tiếp theo**: Chuyển sang mức độ phức tạp tiếp theo

### Lợi ích khi Hoàn thành Khóa học
Khi hoàn thành tất cả các chương, bạn sẽ có:
- **Kinh nghiệm sản xuất**: Đã triển khai các ứng dụng AI thực tế lên Azure
- **Kỹ năng Chuyên nghiệp**: Năng lực triển khai sẵn sàng cho doanh nghiệp  
- **Sự công nhận từ cộng đồng**: Thành viên tích cực của cộng đồng nhà phát triển Azure
- **Thăng tiến nghề nghiệp**: Chuyên môn triển khai AZD và AI đang được săn đón

---

## 🤝 Cộng đồng & Hỗ trợ

### Nhận Trợ giúp & Hỗ trợ
- **Vấn đề Kỹ thuật**: [Báo lỗi và yêu cầu tính năng](https://github.com/microsoft/azd-for-beginners/issues)
- **Câu hỏi Học tập**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) và [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Hỗ trợ Riêng cho AI**: Tham gia [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tài liệu**: [Tài liệu chính thức Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Những hiểu biết từ cộng đồng trên Microsoft Foundry Discord

**Kết quả thăm dò gần đây từ kênh #Azure:**
- **45%** nhà phát triển muốn sử dụng AZD cho khối lượng công việc AI
- **Thách thức hàng đầu**: Triển khai nhiều dịch vụ, quản lý thông tin xác thực, sẵn sàng cho production  
- **Được yêu cầu nhiều nhất**: Mẫu riêng cho AI, hướng dẫn khắc phục sự cố, các thực hành tốt nhất

**Tham gia cộng đồng để:**
- Chia sẻ kinh nghiệm AZD + AI của bạn và nhận trợ giúp
- Truy cập bản xem trước sớm các mẫu AI mới
- Đóng góp vào các thực hành tốt nhất cho triển khai AI
- Ảnh hưởng đến việc phát triển tính năng AI + AZD trong tương lai

### Đóng góp cho Khóa học
Chúng tôi hoan nghênh các đóng góp! Vui lòng đọc [Hướng dẫn Đóng góp](CONTRIBUTING.md) để biết chi tiết về:
- **Cải thiện Nội dung**: Nâng cao các chương và ví dụ hiện có
- **Ví dụ Mới**: Thêm các kịch bản thực tế và mẫu  
- **Dịch thuật**: Giúp duy trì hỗ trợ đa ngôn ngữ
- **Báo lỗi**: Cải thiện độ chính xác và rõ ràng
- **Tiêu chuẩn Cộng đồng**: Tuân theo các hướng dẫn cộng đồng mang tính bao gồm của chúng tôi

---

## 📄 Thông tin Khóa học

### Giấy phép
Dự án này được cấp phép theo MIT License - xem tệp [LICENSE](../../LICENSE) để biết chi tiết.

### Các Tài nguyên Học tập liên quan của Microsoft

Nhóm của chúng tôi sản xuất các khóa học học tập toàn diện khác:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j cho Người mới bắt đầu](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js cho Người mới bắt đầu](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain cho Người mới bắt đầu](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD cho Người mới bắt đầu](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI cho Người mới bắt đầu](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP cho Người mới bắt đầu](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Tác nhân AI cho Người mới bắt đầu](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Series AI Tạo sinh
[![AI Tạo sinh cho Người mới bắt đầu](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Tạo sinh (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Tạo sinh (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI tạo sinh (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Học tập cốt lõi
[![Học máy cho người mới bắt đầu](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Khoa học dữ liệu cho người mới bắt đầu](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI cho người mới bắt đầu](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![An ninh mạng cho người mới bắt đầu](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Phát triển Web cho người mới bắt đầu](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT cho người mới bắt đầu](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Phát triển XR cho người mới bắt đầu](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Chuỗi Copilot
[![Copilot cho Lập trình ghép cặp AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot cho C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Cuộc phiêu lưu Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Điều hướng khóa học

**🚀 Sẵn sàng bắt đầu học?**

**Người mới bắt đầu**: Bắt đầu với [Chương 1: Nền tảng & Bắt đầu nhanh](#-chapter-1-foundation--quick-start)  
**Nhà phát triển AI**: Chuyển tới [Chương 2: Phát triển theo hướng AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Nhà phát triển có kinh nghiệm**: Bắt đầu với [Chương 3: Cấu hình & Xác thực](#️-chapter-3-configuration--authentication)

**Bước tiếp theo**: [Bắt đầu Chương 1 - AZD Cơ bản](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->