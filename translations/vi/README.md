# AZD Dành Cho Người Mới Bắt Đầu: Một Hành Trình Học Tập Có Cấu Trúc

![AZD-for-beginners](../../translated_images/vi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Dịch Tự Động (Luôn Cập Nhật Mới Nhất)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](./README.md)

> **Muốn Sao Chép Cục Bộ?**
>
> Kho mã này bao gồm hơn 50 bản dịch ngôn ngữ làm tăng đáng kể kích thước tải xuống. Để sao chép mà không có bản dịch, sử dụng sparse checkout:
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
> Điều này cung cấp tất cả những gì bạn cần để hoàn thành khóa học với tốc độ tải xuống nhanh hơn nhiều.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Có Gì Mới Trong azd Hôm Nay

> 📌 Khóa học này được xác nhận với **`azd 1.27.1`** (Tháng 7 năm 2026). Chạy `azd version` để kiểm tra phiên bản của bạn, và `azd upgrade` để lấy phiên bản mới nhất.

Azure Developer CLI đã phát triển vượt ra ngoài các ứng dụng web truyền thống và API. Ngày nay, azd là công cụ duy nhất để triển khai **bất kỳ** ứng dụng nào lên Azure — bao gồm các ứng dụng tích hợp AI và đại lý thông minh.

Dưới đây là ý nghĩa dành cho bạn:

- **Các đại lý AI hiện là khối lượng công việc chính trong azd.** Bạn có thể khởi tạo, triển khai và quản lý các dự án đại lý AI sử dụng quy trình làm việc `azd init` → `azd up` mà bạn đã quen thuộc.
- **Một vòng đời đại lý hoàn chỉnh từ CLI.** Tiện ích mở rộng `azure.ai.agents` giờ đây bao gồm toàn bộ hành trình — `azd ai agent init` để tạo khung, `azd ai agent invoke` để kiểm tra (có hiển thị thời gian phản hồi), `azd ai agent eval generate` và `azd ai agent optimize` để đo lường và cải thiện chất lượng, và `azd ai agent delete` để dọn dẹp.
- **Nhiều khối xây dựng AI hơn.** Các tiện ích mở rộng xem trước mới — `azure.ai.skills` và `azure.ai.connections` — cho phép bạn quản lý các kỹ năng đại lý có thể tái sử dụng và kết nối Foundry trực tiếp với azd.
- **Tích hợp Microsoft Foundry** mang việc triển khai mô hình, lưu trữ đại lý, và cấu hình dịch vụ AI trực tiếp vào hệ sinh thái mẫu azd.
- **Những điều cơ bản hàng ngày mượt mà hơn.** Các bản phát hành gần đây đã làm cho `azd init` có thể chạy lại an toàn (idempotent), tự động xoá các token cũ khi đăng nhập bằng `azd auth login`, và thêm lời nhắc thiết lập lần chạy thân thiện cho `azd tool`.
- **Quy trình chính không thay đổi.** Dù bạn đang triển khai ứng dụng todo, microservice, hay giải pháp AI đa đại lý, các lệnh vẫn giống nhau.

> **Lưu ý dành cho người dùng Aspire:** Microsoft hiện gọi sản phẩm đơn giản là **Aspire** (trước đây là ".NET Aspire"). Hỗ trợ Aspire trong azd không thay đổi — chỉ thay đổi tên gọi.

Nếu bạn đã dùng azd trước đây, hỗ trợ AI là phần mở rộng tự nhiên — không phải công cụ riêng biệt hay hướng chuyên sâu. Nếu bạn bắt đầu mới, bạn sẽ học một quy trình làm việc dùng cho tất cả.

---

## 🚀 Azure Developer CLI (azd) Là Gì?

**Azure Developer CLI (azd)** là công cụ dòng lệnh thân thiện với nhà phát triển, giúp đơn giản hóa việc triển khai ứng dụng lên Azure. Thay vì tạo và kết nối thủ công hàng loạt tài nguyên Azure, bạn có thể triển khai toàn bộ ứng dụng chỉ với một lệnh.

### Phép Màu Của `azd up`

```bash
# Lệnh duy nhất này thực hiện tất cả mọi thứ:
# ✅ Tạo tất cả tài nguyên Azure
# ✅ Cấu hình mạng và bảo mật
# ✅ Xây dựng mã ứng dụng của bạn
# ✅ Triển khai lên Azure
# ✅ Cung cấp cho bạn một URL hoạt động
azd up
```

**Chỉ vậy thôi!** Không cần nhấp trên Azure Portal, không cần học các mẫu ARM phức tạp, không cần cấu hình thủ công — chỉ đơn giản là ứng dụng hoạt động trên Azure.

---

## ❓ Azure Developer CLI và Azure CLI: Khác Biệt Như Thế Nào?

Đây là câu hỏi phổ biến nhất mà người mới hỏi. Đây là câu trả lời đơn giản:

| Tính năng | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Mục đích** | Quản lý từng tài nguyên Azure riêng lẻ | Triển khai ứng dụng hoàn chỉnh |
| **Tư duy** | Tập trung vào hạ tầng | Tập trung vào ứng dụng |
| **Ví dụ** | `az webapp create --name myapp...` | `azd up` |
| **Độ khó học** | Phải biết dịch vụ Azure | Chỉ cần biết ứng dụng của bạn |
| **Phù hợp với** | DevOps, Hạ tầng | Nhà phát triển, Phát triển mẫu |

### Ví Dụ So Sánh Đơn Giản

- **Azure CLI** như có tất cả công cụ để xây nhà — búa, cưa, đinh. Bạn có thể xây bất cứ gì nhưng phải biết xây dựng.
- **Azure Developer CLI** như thuê nhà thầu — bạn chỉ cần mô tả bạn muốn gì, họ sẽ lo phần xây dựng.

### Khi Nào Dùng Loại Nào

| Tình huống | Dùng Cái Này |
|----------|----------|
| "Tôi muốn triển khai web app nhanh" | `azd up` |
| "Tôi chỉ cần tạo một tài khoản lưu trữ" | `az storage account create` |
| "Tôi đang xây ứng dụng AI đầy đủ" | `azd init --template azure-search-openai-demo` |
| "Tôi cần gỡ lỗi tài nguyên Azure cụ thể" | `az resource show` |
| "Tôi muốn triển khai sẵn sàng sản xuất trong vài phút" | `azd up --environment production` |

### Chúng Hợp Tác Với Nhau!

AZD sử dụng Azure CLI ở nền tảng. Bạn có thể dùng cả hai:
```bash
# Triển khai ứng dụng của bạn với AZD
azd up

# Sau đó tinh chỉnh các tài nguyên cụ thể bằng Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Tìm Mẫu Trong Awesome AZD

Đừng bắt đầu từ con số 0! **Awesome AZD** là bộ sưu tập mẫu sẵn sàng triển khai do cộng đồng phát triển:

| Tài nguyên | Mô tả |
|----------|-------------|
| 🔗 [**Thư Viện Awesome AZD**](https://azure.github.io/awesome-azd/) | Duyệt hơn 200 mẫu với triển khai một cú nhấp |
| 🔗 [**Gửi Mẫu**](https://github.com/Azure/awesome-azd/issues) | Đóng góp mẫu của bạn cho cộng đồng |
| 🔗 [**Kho GitHub**](https://github.com/Azure/awesome-azd) | Thích và khám phá mã nguồn |

### Các Mẫu AI Phổ Biến từ Awesome AZD

```bash
# Trò chuyện RAG với các mô hình Microsoft Foundry + Tìm kiếm AI
azd init --template azure-search-openai-demo

# Ứng dụng trò chuyện AI nhanh
azd init --template openai-chat-app-quickstart

# Các tác nhân AI với các tác nhân Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Bắt Đầu Trong 3 Bước

Trước khi bắt đầu, hãy đảm bảo máy của bạn đã sẵn sàng cho mẫu bạn muốn triển khai:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Nếu có phần kiểm tra nào không đạt, hãy sửa trước rồi tiếp tục với khởi động nhanh.

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

### Bước 2: Xác Thực cho AZD

```bash
# Tùy chọn nếu bạn dự định sử dụng các lệnh Azure CLI trực tiếp trong khóa học này
az login

# Bắt buộc cho các workflow AZD
azd auth login
```

Nếu bạn không chắc mình cần loại nào, hãy theo quy trình thiết lập đầy đủ trong [Cài Đặt & Thiết Lập](docs/chapter-01-foundation/installation.md#authentication-setup).

### Bước 3: Triển Khai Ứng Dụng Đầu Tiên

```bash
# Khởi tạo từ mẫu
azd init --template todo-nodejs-mongo

# Triển khai lên Azure (tạo mọi thứ!)
azd up
```

**🎉 Xong rồi!** Ứng dụng của bạn bây giờ đã trực tiếp trên Azure.

### Dọn Dẹp (Đừng Quên!)

```bash
# Xóa tất cả các tài nguyên khi hoàn thành thử nghiệm
azd down --force --purge
```

---

## 📚 Cách Sử Dụng Khóa Học Này

Khóa học được thiết kế theo kiểu **học tiến bộ** — bắt đầu từ chỗ bạn thoải mái và nâng dần lên:

| Kinh nghiệm của bạn | Bắt đầu tại đây |
|--------------------|------------------|
| **Hoàn toàn mới với Azure** | [Chương 1: Nền Tảng](#-chapter-1-foundation--quick-start) |
| **Biết Azure, mới với AZD** | [Chương 1: Nền Tảng](#-chapter-1-foundation--quick-start) |
| **Muốn triển khai ứng dụng AI** | [Chương 2: Phát Triển Ưu Tiên AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Muốn thực hành thực tế** | [🎓 Hội Thảo Tương Tác](workshop/README.md) – phòng thí nghiệm hướng dẫn 3-4 giờ |
| **Cần mẫu cho môi trường sản xuất** | [Chương 8: Sản Xuất & Doanh Nghiệp](#-chapter-8-production--enterprise-patterns) |

### Thiết Lập Nhanh

1. **Fork Kho Mã Này**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Sao Chép Nó**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Nhận Trợ Giúp**: [Cộng đồng Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Muốn Sao Chép Cục Bộ?**

> Kho mã này bao gồm hơn 50 bản dịch ngôn ngữ làm tăng đáng kể kích thước tải xuống. Để sao chép mà không có bản dịch, sử dụng sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Điều này cung cấp tất cả những gì bạn cần để hoàn thành khóa học với tốc độ tải xuống nhanh hơn nhiều.


## Tổng Quan Khóa Học

Làm chủ Azure Developer CLI (azd) thông qua các chương được thiết kế để học tiến bộ. **Tập trung đặc biệt vào triển khai ứng dụng AI với tích hợp Microsoft Foundry.**


### Tại sao Khóa học này quan trọng đối với Nhà phát triển Hiện đại

Dựa trên những hiểu biết từ cộng đồng Microsoft Foundry Discord, **45% nhà phát triển muốn sử dụng AZD cho các khối lượng công việc AI** nhưng gặp phải những thách thức với:
- Kiến trúc AI phức tạp đa dịch vụ
- Các thực tiễn tốt nhất triển khai AI trong môi trường sản xuất  
- Tích hợp và cấu hình dịch vụ AI Azure
- Tối ưu chi phí cho các khối lượng công việc AI
- Xử lý sự cố triển khai riêng biệt cho AI

### Mục tiêu học tập

Khi hoàn thành khóa học có cấu trúc này, bạn sẽ:
- **Nắm vững kiến thức cơ bản về AZD**: Các khái niệm cốt lõi, cài đặt và cấu hình
- **Triển khai Ứng dụng AI**: Sử dụng AZD với các dịch vụ Microsoft Foundry
- **Thực hiện Hạ tầng dưới dạng Mã**: Quản lý tài nguyên Azure bằng các mẫu Bicep
- **Xử lý sự cố Triển khai**: Giải quyết những vấn đề thường gặp và gỡ lỗi
- **Tối ưu cho môi trường Sản xuất**: Bảo mật, mở rộng, giám sát, và quản lý chi phí
- **Xây dựng Giải pháp Đa Đại lý**: Triển khai các kiến trúc AI phức tạp

## Trước khi Bắt đầu: Tài khoản, Quyền truy cập và Giả định

Trước khi bạn bắt đầu Chương 1, hãy chắc chắn rằng bạn đã chuẩn bị những điều sau. Các bước cài đặt trong hướng dẫn này giả định những điều cơ bản này đã được xử lý.

- **Một đăng ký Azure**: Bạn có thể dùng đăng ký hiện có từ công việc hoặc tài khoản riêng của bạn, hoặc tạo một [dùng thử miễn phí](https://aka.ms/azurefreetrial) để bắt đầu.
- **Quyền tạo tài nguyên Azure**: Đối với hầu hết các bài tập, bạn nên có ít nhất quyền **Contributor** trên đăng ký hoặc nhóm tài nguyên mục tiêu. Một số chương cũng giả định bạn có thể tạo nhóm tài nguyên, managed identities, và phân quyền RBAC.
- [**Một tài khoản GitHub**](https://github.com): Điều này hữu ích để fork kho lưu trữ, theo dõi các thay đổi của bạn, và dùng GitHub Codespaces cho workshop.
- **Yêu cầu trước khi chạy mẫu**: Một số mẫu cần công cụ cục bộ như Node.js, Python, Java, hoặc Docker. Chạy trình xác thực thiết lập trước khi bắt đầu để phát hiện thiếu công cụ sớm.
- **Quen thuộc cơ bản với terminal**: Bạn không cần là chuyên gia, nhưng nên thoải mái chạy các lệnh như `git clone`, `azd auth login`, và `azd up`.

> **Làm việc trong đăng ký doanh nghiệp?**
> Nếu môi trường Azure của bạn được quản lý bởi quản trị viên, hãy xác nhận trước rằng bạn có thể triển khai tài nguyên trong đăng ký hoặc nhóm tài nguyên định dùng. Nếu không, hãy yêu cầu đăng ký sandbox hoặc quyền Contributor trước khi bắt đầu.

> **Mới với Azure?**
> Bắt đầu với đăng ký dùng thử hoặc trả tiền khi dùng của bạn tại https://aka.ms/azurefreetrial để có thể hoàn thành các bài tập trọn vẹn mà không phải chờ phê duyệt trên cấp tenant.

## 🗺️ Bản đồ Khóa học: Điều hướng Nhanh theo Chương

Mỗi chương có README riêng với mục tiêu học tập, hướng dẫn nhanh và bài tập:

| Chương | Chủ đề | Bài học | Thời lượng | Độ phức tạp |
|---------|-------|---------|----------|------------|
| **[Ch 1: Nền tảng](docs/chapter-01-foundation/README.md)** | Bắt đầu | [AZD Cơ bản](docs/chapter-01-foundation/azd-basics.md) &#124; [Cài đặt](docs/chapter-01-foundation/installation.md) &#124; [Dự án Đầu tiên](docs/chapter-01-foundation/first-project.md) | 30-45 phút | ⭐ |
| **[Ch 2: Phát triển AI](docs/chapter-02-ai-development/README.md)** | Ứng dụng AI đầu tiên | [Tích hợp Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Triển khai Mô hình](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 giờ | ⭐⭐ |
| **[Ch 3: Cấu hình](docs/chapter-03-configuration/README.md)** | Xác thực & Bảo mật | [Cấu hình](docs/chapter-03-configuration/configuration.md) &#124; [Xác thực & Bảo mật](docs/chapter-03-configuration/authsecurity.md) | 45-60 phút | ⭐⭐ |
| **[Ch 4: Hạ tầng](docs/chapter-04-infrastructure/README.md)** | IaC & Triển khai | [Hướng dẫn triển khai](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Cấp phát tài nguyên](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 giờ | ⭐⭐⭐ |
| **[Ch 5: Đa Đại lý](docs/chapter-05-multi-agent/README.md)** | Giải pháp Đại lý AI | [Tình huống Bán lẻ](examples/retail-scenario.md) &#124; [Mô hình Phối hợp](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 giờ | ⭐⭐⭐⭐ |
| **[Ch 6: Trước Triển khai](docs/chapter-06-pre-deployment/README.md)** | Lập kế hoạch & Xác thực | [Kiểm tra tiền hành trình](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kế hoạch năng lực](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Lựa chọn SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 giờ | ⭐⭐ |
| **[Ch 7: Xử lý sự cố](docs/chapter-07-troubleshooting/README.md)** | Gỡ lỗi & Sửa lỗi | [Vấn đề Thường gặp](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Gỡ lỗi](docs/chapter-07-troubleshooting/debugging.md) &#124; [Vấn đề AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 giờ | ⭐⭐ |
| **[Ch 8: Sản xuất](docs/chapter-08-production/README.md)** | Mô hình Doanh nghiệp | [Thực hành Sản xuất](docs/chapter-08-production/production-ai-practices.md) | 2-3 giờ | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Thực hành tay | [Giới thiệu](workshop/docs/instructions/0-Introduction.md) &#124; [Lựa chọn](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Xác thực](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Phân tích](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Cấu hình](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tùy chỉnh](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Dọn dẹp](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Tổng kết](workshop/docs/instructions/7-Wrap-up.md) | 3-4 giờ | ⭐⭐ |

**Tổng Thời lượng Khóa học:** ~10-14 giờ | **Trình độ Nâng cao:** Người mới → Sẵn sàng sản xuất

---

## 📚 Các Chương Học

*Chọn lộ trình học dựa trên trình độ kinh nghiệm và mục tiêu*

### 🚀 Chương 1: Nền tảng & Bắt đầu Nhanh
**Điều kiện tiên quyết**: Đăng ký Azure, kiến thức cơ bản về dòng lệnh  
**Thời lượng**: 30-45 phút  
**Độ phức tạp**: ⭐

#### Bạn sẽ học được gì
- Hiểu được các kiến thức cơ bản của Azure Developer CLI
- Cài đặt AZD trên nền tảng của bạn
- Triển khai thành công đầu tiên của bạn

#### Tài nguyên học tập
- **🎯 Bắt đầu tại đây**: [Azure Developer CLI là gì?](#what-is-azure-developer-cli)
- **📖 Lý thuyết**: [AZD Cơ bản](docs/chapter-01-foundation/azd-basics.md) - Các khái niệm cốt lõi và thuật ngữ
- **⚙️ Thiết lập**: [Cài đặt & Thiết lập](docs/chapter-01-foundation/installation.md) - Hướng dẫn theo nền tảng
- **🛠️ Thực hành**: [Dự án Đầu tiên của bạn](docs/chapter-01-foundation/first-project.md) - Hướng dẫn từng bước
- **📋 Tham khảo nhanh**: [Bảng lệnh tắt](resources/cheat-sheet.md)

#### Bài tập thực hành
```bash
# Kiểm tra cài đặt nhanh
azd version

# Triển khai ứng dụng đầu tiên của bạn
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kết quả Chương**: Triển khai thành công một ứng dụng web đơn giản lên Azure bằng AZD

**✅ Xác nhận Thành công:**
```bash
# Sau khi hoàn thành Chương 1, bạn nên có khả năng:
azd version              # Hiển thị phiên bản đã cài đặt
azd init --template todo-nodejs-mongo  # Khởi tạo dự án
azd up                  # Triển khai lên Azure
azd show                # Hiển thị URL ứng dụng đang chạy
# Ứng dụng mở trong trình duyệt và hoạt động
azd down --force --purge  # Dọn dẹp tài nguyên
```

**📊 Thời gian đầu tư:** 30-45 phút  
**📈 Trình độ Sau khi học:** Có thể tự triển khai ứng dụng cơ bản
**📈 Trình độ Sau khi học:** Có thể tự triển khai ứng dụng cơ bản

---

### 🤖 Chương 2: Phát triển AI-Đầu tiên (Khuyến nghị cho Nhà phát triển AI)
**Điều kiện tiên quyết**: Đã hoàn thành Chương 1  
**Thời lượng**: 1-2 giờ  
**Độ phức tạp**: ⭐⭐

#### Bạn sẽ học được gì
- Tích hợp Microsoft Foundry với AZD
- Triển khai các ứng dụng được hỗ trợ bởi AI
- Hiểu về cấu hình dịch vụ AI

#### Tài nguyên học tập
- **🎯 Bắt đầu tại đây**: [Tích hợp Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Đại lý AI**: [Hướng dẫn Đại lý AI](docs/chapter-02-ai-development/agents.md) - Triển khai đại lý thông minh với AZD
- **📖 Mẫu mẫu**: [Triển khai Mô hình AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Triển khai và quản lý mô hình AI
- **🛠️ Workshop**: [Phòng Lab Workshop AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Chuẩn bị giải pháp AI với AZD
- **🎥 Hướng dẫn Tương tác**: [Tài liệu Workshop](workshop/README.md) - Học trên trình duyệt với MkDocs * Môi trường DevContainer
- **📋 Mẫu**: [Mẫu Microsoft Foundry nổi bật](#tài-nguyên-hội-thảo)
- **📝 Ví dụ**: [Ví dụ Triển khai AZD](examples/README.md)

#### Bài tập thực hành
```bash
# Triển khai ứng dụng AI đầu tiên của bạn
azd init --template azure-search-openai-demo
azd up

# Thử các mẫu AI bổ sung
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kết quả Chương**: Triển khai và cấu hình ứng dụng chat AI với khả năng RAG

**✅ Xác nhận Thành công:**
```bash
# Sau Chương 2, bạn sẽ có thể:
azd init --template azure-search-openai-demo
azd up
# Kiểm tra giao diện trò chuyện AI
# Đặt câu hỏi và nhận phản hồi được hỗ trợ bởi AI cùng với nguồn tham khảo
# Xác minh tích hợp tìm kiếm hoạt động
azd monitor  # Kiểm tra Application Insights hiển thị dữ liệu Telemetry
azd down --force --purge
```

**📊 Thời gian đầu tư:** 1-2 giờ  
**📈 Trình độ Sau khi học:** Có thể triển khai và cấu hình ứng dụng AI sẵn sàng sản xuất  
**💰 Nhận thức Chi phí:** Hiểu chi phí phát triển $80-150/tháng, chi phí sản xuất $300-3500/tháng

#### 💰 Cân nhắc Chi phí cho Triển khai AI

**Môi trường Phát triển (Ước tính $80-150/tháng):**
- Microsoft Foundry Models (Thanh toán theo sử dụng): $0-50/tháng (dựa trên lượng token sử dụng)
- AI Search (Cấp cơ bản): $75/tháng
- Container Apps (Tiêu thụ): $0-20/tháng
- Lưu trữ (Tiêu chuẩn): $1-5/tháng

**Môi trường Sản xuất (Ước tính $300-3,500+/tháng):**
- Microsoft Foundry Models (PTU để hiệu suất ổn định): $3,000+/tháng HOẶC Thanh toán khi dùng với khối lượng lớn
- AI Search (Cấp chuẩn): $250/tháng
- Container Apps (Dành riêng): $50-100/tháng
- Application Insights: $5-50/tháng
- Lưu trữ (Cao cấp): $10-50/tháng

**💡 Mẹo tối ưu Chi phí:**
- Sử dụng **Mức Miễn phí** Microsoft Foundry Models để học tập (Azure OpenAI bao gồm 50,000 token/tháng)
- Chạy `azd down` để giải phóng tài nguyên khi không phát triển tích cực
- Bắt đầu với thanh toán theo tiêu thụ, chỉ nâng cấp lên PTU khi vào sản xuất
- Dùng `azd provision --preview` để ước tính chi phí trước khi triển khai
- Kích hoạt tự động mở rộng: chỉ trả cho sử dụng thực tế

**Giám sát Chi phí:**
```bash
# Kiểm tra ước tính chi phí hàng tháng
azd provision --preview

# Giám sát chi phí thực tế trong Cổng Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chương 3: Cấu hình & Xác thực
**Điều kiện tiên quyết**: Đã hoàn thành Chương 1  
**Thời lượng**: 45-60 phút  
**Độ phức tạp**: ⭐⭐

#### Bạn sẽ học được gì
- Cấu hình và quản lý môi trường
- Thực hành tốt về xác thực và bảo mật
- Đặt tên và tổ chức tài nguyên

#### Tài nguyên học tập
- **📖 Cấu hình**: [Hướng dẫn Cấu hình](docs/chapter-03-configuration/configuration.md) - Thiết lập môi trường
- **🔐 Bảo mật**: [Mô hình xác thực và managed identity](docs/chapter-03-configuration/authsecurity.md) - Các mô hình xác thực
- **📝 Ví dụ**: [Ví dụ Ứng dụng Database](examples/database-app/README.md) - Ví dụ cơ sở dữ liệu AZD

#### Bài tập thực hành
- Cấu hình nhiều môi trường (dev, staging, prod)
- Thiết lập xác thực managed identity
- Triển khai các cấu hình riêng theo môi trường

**💡 Kết quả Chương**: Quản lý nhiều môi trường với xác thực và bảo mật đúng chuẩn

---

### 🏗️ Chương 4: Hạ tầng dưới dạng Mã & Triển khai
**Điều kiện tiên quyết**: Hoàn thành các chương 1-3  
**Thời lượng**: 1-1.5 giờ  
**Độ phức tạp**: ⭐⭐⭐

#### Bạn sẽ học được gì
- Mẫu triển khai nâng cao
- Hạ tầng dưới dạng Mã với Bicep
- Chiến lược cấp phát tài nguyên

#### Tài nguyên học tập
- **📖 Triển khai**: [Hướng dẫn Triển khai](docs/chapter-04-infrastructure/deployment-guide.md) - Quy trình làm việc hoàn chỉnh
- **🏗️ Cấp phát tài nguyên**: [Cấp phát tài nguyên](docs/chapter-04-infrastructure/provisioning.md) - Quản lý tài nguyên Azure
- **📝 Ví dụ**: [Ví dụ Container App](../../examples/container-app) - Triển khai container hóa

#### Bài tập thực hành
- Tạo mẫu Bicep tùy chỉnh
- Triển khai ứng dụng đa dịch vụ
- Triển khai chiến lược blue-green

**💡 Kết quả Chương**: Triển khai ứng dụng đa dịch vụ phức tạp dùng mẫu hạ tầng tùy chỉnh

---


### 🎯 Chương 5: Giải pháp AI đa tác nhân (Nâng cao)
**Yêu cầu trước**: Hoàn thành chương 1-2  
**Thời gian**: 2-3 giờ  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Các mẫu kiến trúc đa tác nhân
- Điều phối và phối hợp tác nhân
- Triển khai AI sẵn sàng cho sản xuất

#### Tài nguyên học tập
- **🤖 Dự án nổi bật**: [Giải pháp đa tác nhân bán lẻ](examples/retail-scenario.md) - Triển khai hoàn chỉnh
- **🛠️ Mẫu ARM**: [Gói mẫu ARM](../../examples/retail-multiagent-arm-template) - Triển khai chỉ với một cú nhấp
- **📖 Kiến trúc**: [Mẫu điều phối đa tác nhân](docs/chapter-06-pre-deployment/coordination-patterns.md) - Các mẫu

#### Bài tập thực hành
```bash
# Triển khai giải pháp đa tác nhân bán lẻ hoàn chỉnh
cd examples/retail-multiagent-arm-template
./deploy.sh

# Khám phá các cấu hình tác nhân
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kết quả chương**: Triển khai và quản lý giải pháp AI đa tác nhân sẵn sàng cho sản xuất với các tác nhân Khách hàng và Hàng tồn kho

---

### 🔍 Chương 6: Kiểm tra & Lập kế hoạch trước khi triển khai
**Yêu cầu trước**: Hoàn thành chương 4  
**Thời gian**: 1 giờ  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Lập kế hoạch năng lực và kiểm tra nguồn lực
- Chiến lược lựa chọn SKU
- Kiểm tra tiền bay và tự động hóa

#### Tài nguyên học tập
- **📊 Lập kế hoạch**: [Lập kế hoạch năng lực](docs/chapter-06-pre-deployment/capacity-planning.md) - Kiểm tra nguồn lực
- **💰 Lựa chọn**: [Lựa chọn SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Lựa chọn chi phí hiệu quả
- **✅ Kiểm tra**: [Kiểm tra tiền bay](docs/chapter-06-pre-deployment/preflight-checks.md) - Kịch bản tự động

#### Bài tập thực hành
- Chạy các kịch bản kiểm tra năng lực
- Tối ưu lựa chọn SKU về chi phí
- Triển khai kiểm tra tiền triển khai tự động

**💡 Kết quả chương**: Xác thực và tối ưu triển khai trước khi thực thi

---

### 🚨 Chương 7: Khắc phục sự cố & Gỡ lỗi
**Yêu cầu trước**: Hoàn thành bất kỳ chương triển khai nào  
**Thời gian**: 1-1.5 giờ  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Phương pháp gỡ lỗi có hệ thống
- Các vấn đề thường gặp và giải pháp
- Khắc phục sự cố đặc thù AI

#### Tài nguyên học tập
- **🔧 Vấn đề thường gặp**: [Các vấn đề phổ biến](docs/chapter-07-troubleshooting/common-issues.md) - Câu hỏi thường gặp và giải pháp
- **🕵️ Gỡ lỗi**: [Hướng dẫn gỡ lỗi](docs/chapter-07-troubleshooting/debugging.md) - Chiến lược từng bước
- **🤖 Vấn đề AI**: [Khắc phục sự cố AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Vấn đề dịch vụ AI

#### Bài tập thực hành
- Chẩn đoán lỗi triển khai
- Giải quyết vấn đề xác thực
- Gỡ lỗi kết nối dịch vụ AI

**💡 Kết quả chương**: Độc lập chẩn đoán và giải quyết các sự cố phổ biến trong triển khai

---

### 🏢 Chương 8: Mẫu sản xuất & Doanh nghiệp
**Yêu cầu trước**: Hoàn thành chương 1-4  
**Thời gian**: 2-3 giờ  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Chiến lược triển khai sản xuất
- Mẫu bảo mật doanh nghiệp
- Giám sát và tối ưu chi phí

#### Tài nguyên học tập
- **🏭 Sản xuất**: [Thực hành tốt AI sản xuất](docs/chapter-08-production/production-ai-practices.md) - Mẫu doanh nghiệp
- **📝 Ví dụ**: [Ví dụ Microservices](../../examples/microservices) - Kiến trúc phức tạp
- **📊 Giám sát**: [Tích hợp Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Giám sát

#### Bài tập thực hành
- Triển khai mẫu bảo mật doanh nghiệp
- Thiết lập giám sát toàn diện
- Triển khai sản xuất với quản trị thích hợp

**💡 Kết quả chương**: Triển khai ứng dụng sẵn sàng doanh nghiệp với đầy đủ khả năng sản xuất

---

## 🎓 Tổng quan hội thảo: Trải nghiệm học thực hành

> **⚠️ TRẠNG THÁI HỘI THẢO: Đang phát triển**  
> Tài liệu hội thảo đang được phát triển và hoàn thiện. Các mô-đun cốt lõi đã hoạt động, tuy nhiên một số phần nâng cao còn chưa hoàn chỉnh. Chúng tôi đang tích cực hoàn thiện toàn bộ nội dung. [Theo dõi tiến độ →](workshop/README.md)

### Tài liệu hội thảo tương tác
**Học thực hành toàn diện với công cụ trình duyệt và các bài tập hướng dẫn**

Tài liệu hội thảo cung cấp trải nghiệm học tập có cấu trúc, tương tác bổ sung cho chương trình học theo chương bên trên. Hội thảo thiết kế để học tự học cũng như học có hướng dẫn.

#### 🛠️ Tính năng hội thảo
- **Giao diện trên trình duyệt**: Hội thảo hoàn chỉnh xây dựng trên MkDocs với tìm kiếm, sao chép, và giao diện
- **Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển chỉ với một cú nhấp
- **Lộ trình học có cấu trúc**: 8 mô-đun bài tập hướng dẫn (tổng 3-4 giờ)
- **Phương pháp tiến bộ**: Giới thiệu → Lựa chọn → Xác thực → Phân tích → Cấu hình → Tùy chỉnh → Gỡ bỏ → Tổng kết
- **Môi trường DevContainer tương tác**: Công cụ và phụ thuộc cấu hình sẵn

#### 📚 Cấu trúc mô-đun hội thảo
Hội thảo theo phương pháp **8 mô-đun tiến bộ** từ khám phá đến thành thạo triển khai:

| Mô-đun | Chủ đề | Những gì bạn sẽ làm | Thời lượng |
|--------|-------|----------------|----------|
| **0. Giới thiệu** | Tổng quan hội thảo | Hiểu mục tiêu học tập, yêu cầu trước, và cấu trúc hội thảo | 15 phút |
| **1. Lựa chọn** | Khám phá mẫu | Khám phá mẫu AZD và chọn mẫu AI phù hợp cho kịch bản của bạn | 20 phút |
| **2. Xác thực** | Triển khai & Xác minh | Triển khai mẫu với `azd up` và xác minh hạ tầng hoạt động | 30 phút |
| **3. Phân tích** | Hiểu cấu trúc | Sử dụng GitHub Copilot để khám phá kiến trúc mẫu, tệp Bicep và tổ chức mã | 30 phút |
| **4. Cấu hình** | Tìm hiểu sâu azure.yaml | Thành thạo cấu hình `azure.yaml`, các hook vòng đời, và biến môi trường | 30 phút |
| **5. Tùy chỉnh** | Làm cho nó thành của bạn | Kích hoạt Tìm kiếm AI, theo dõi, đánh giá, và tùy chỉnh cho kịch bản | 45 phút |
| **6. Gỡ bỏ** | Dọn dẹp | An toàn gỡ tài nguyên với `azd down --purge` | 15 phút |
| **7. Tổng kết** | Bước tiếp theo | Xem lại thành quả, khái niệm chính, và tiếp tục hành trình học tập | 15 phút |

**Quy trình hội thảo:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Bắt đầu với hội thảo
```bash
# Lựa chọn 1: GitHub Codespaces (Khuyến nghị)
# Nhấp "Code" → "Create codespace on main" trong kho lưu trữ

# Lựa chọn 2: Phát triển cục bộ
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Làm theo hướng dẫn cài đặt trong workshop/README.md
```

#### 🎯 Kết quả học tập hội thảo
Người tham gia hoàn thành hội thảo sẽ:
- **Triển khai ứng dụng AI sản xuất**: Sử dụng AZD với dịch vụ Microsoft Foundry
- **Thành thạo kiến trúc đa tác nhân**: Thực hiện giải pháp tác nhân AI phối hợp
- **Triển khai bảo mật tốt nhất**: Cấu hình xác thực và kiểm soát truy cập
- **Tối ưu cho quy mô**: Thiết kế triển khai chi phí hiệu quả và hiệu năng cao
- **Khắc phục sự cố triển khai**: Giải quyết vấn đề thường gặp độc lập

#### 📖 Tài nguyên hội thảo
- **🎥 Hướng dẫn tương tác**: [Tài liệu hội thảo](workshop/README.md) - Môi trường học trình duyệt
- **📋 Hướng dẫn từng mô-đun**:
  - [0. Giới thiệu](workshop/docs/instructions/0-Introduction.md) - Tổng quan và mục tiêu hội thảo
  - [1. Lựa chọn](workshop/docs/instructions/1-Select-AI-Template.md) - Tìm và chọn mẫu AI
  - [2. Xác thực](workshop/docs/instructions/2-Validate-AI-Template.md) - Triển khai và xác minh mẫu
  - [3. Phân tích](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Khám phá kiến trúc mẫu
  - [4. Cấu hình](workshop/docs/instructions/4-Configure-AI-Template.md) - Thành thạo azure.yaml
  - [5. Tùy chỉnh](workshop/docs/instructions/5-Customize-AI-Template.md) - Tùy chỉnh cho kịch bản
  - [6. Gỡ bỏ](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Dọn dẹp tài nguyên
  - [7. Tổng kết](workshop/docs/instructions/7-Wrap-up.md) - Tổng kết và bước tiếp theo
- **🛠️ Phòng lab AI Workshop**: [Phòng lab AI Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) - Bài tập tập trung AI
- **💡 Bắt đầu nhanh**: [Hướng dẫn thiết lập hội thảo](workshop/README.md#quick-start) - Cấu hình môi trường

**Phù hợp cho**: Đào tạo doanh nghiệp, khóa học đại học, học tự học, và bootcamp dành cho nhà phát triển.

---

## 📖 Tìm hiểu sâu: Năng lực AZD

Ngoài những điều cơ bản, AZD cung cấp các tính năng mạnh mẽ cho triển khai sản xuất:

- **Triển khai dựa trên mẫu** - Sử dụng các mẫu dựng sẵn cho các mẫu ứng dụng phổ biến
- **Hạ tầng dưới dạng mã** - Quản lý tài nguyên Azure bằng Bicep hoặc Terraform  
- **Quy trình làm việc tích hợp** - Cung cấp, triển khai và giám sát ứng dụng một cách liền mạch
- **Thân thiện với nhà phát triển** - Tối ưu năng suất và trải nghiệm phát triển

### **AZD + Microsoft Foundry: Hoàn hảo cho triển khai AI**

**Tại sao chọn AZD cho Giải pháp AI?** AZD giải quyết các thách thức lớn mà nhà phát triển AI gặp phải:

- **Mẫu sẵn sàng AI** - Mẫu cấu hình sẵn cho Microsoft Foundry Models, dịch vụ AI Azure, và khối lượng công việc ML
- **Triển khai AI bảo mật** - Mẫu bảo mật tích hợp cho dịch vụ AI, khóa API, và điểm kết mô hình  
- **Mẫu AI sản xuất** - Thực hành tốt cho triển khai ứng dụng AI có khả năng mở rộng và tiết kiệm chi phí
- **Quy trình AI đầu cuối** - Từ phát triển mô hình đến triển khai sản xuất có giám sát thích hợp
- **Tối ưu chi phí** - Chiến lược phân bổ tài nguyên thông minh và mở rộng cho khối lượng công việc AI
- **Tích hợp Microsoft Foundry** - Kết nối liền mạch với danh mục mô hình và điểm kết Microsoft Foundry

---

## 🎯 Thư viện Mẫu & Ví dụ

### Nổi bật: Mẫu Microsoft Foundry
**Bắt đầu tại đây nếu bạn đang triển khai ứng dụng AI!**

> **Lưu ý:** Những mẫu này trình bày các mẫu AI khác nhau. Một số là Azure Samples bên ngoài, một số là triển khai tại chỗ.

| Mẫu | Chương | Độ phức tạp | Dịch vụ | Loại |
|----------|---------|------------|----------|------|
| [**Bắt đầu với chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chương 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Bên ngoài |
| [**Bắt đầu với tác nhân AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chương 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Bên ngoài |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chương 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Bên ngoài |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chương 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Bên ngoài |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chương 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Bên ngoài |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chương 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Bên ngoài |
| [**Giải pháp đa tác nhân bán lẻ**](examples/retail-scenario.md) | Chương 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Tại chỗ** |

### Nổi bật: Kịch bản học tập hoàn chỉnh
**Mẫu ứng dụng sẵn sàng sản xuất liên kết với chương học**

| Mẫu | Chương học | Độ phức tạp | Nội dung chính học |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chương 2 | ⭐ | Mẫu triển khai AI cơ bản |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chương 2 | ⭐⭐ | Triển khai RAG với Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chương 4 | ⭐⭐ | Tích hợp Trí tuệ tài liệu |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chương 5 | ⭐⭐⭐ | Khung tác nhân và gọi hàm |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chương 8 | ⭐⭐⭐ | Điều phối AI doanh nghiệp |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chương 5 | ⭐⭐⭐⭐ | Kiến trúc đa tác nhân với tác nhân Khách hàng và Hàng tồn kho |

### Học theo loại ví dụ

> **📌 Ví dụ tại chỗ vs bên ngoài:**  
> **Ví dụ tại chỗ** (trong repo này) = Sẵn sàng sử dụng ngay  
> **Ví dụ bên ngoài** (Azure Samples) = Sao chép từ repo liên kết

#### Ví dụ tại chỗ (Sẵn sàng sử dụng)
- [**Giải pháp đa tác nhân bán lẻ**](examples/retail-scenario.md) - Triển khai sẵn sàng sản xuất hoàn chỉnh với mẫu ARM
  - Kiến trúc đa tác nhân (Tác nhân Khách hàng + Hàng tồn kho)
  - Giám sát và đánh giá toàn diện
  - Triển khai một cú nhấp qua mẫu ARM

#### Ví dụ tại chỗ - Ứng dụng container (Chương 2-5)
**Ví dụ triển khai container toàn diện trong kho này:**

- [**Ví dụ về Ứng dụng Container**](examples/container-app/README.md) - Hướng dẫn đầy đủ về triển khai container hóa
  - [API Flask Đơn giản](../../examples/container-app/simple-flask-api) - REST API cơ bản với mở rộng quy mô đến không
  - [Kiến trúc Microservices](../../examples/container-app/microservices) - Triển khai đa dịch vụ sẵn sàng cho sản xuất
  - Các mẫu triển khai Khởi động nhanh, Sản xuất và Nâng cao
  - Hướng dẫn giám sát, bảo mật và tối ưu chi phí

#### Ví dụ Bên ngoài - Ứng dụng Đơn giản (Chương 1-2)
**Sao chép các kho mẫu Azure này để bắt đầu:**
- [Ứng dụng Web Đơn giản - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Các mẫu triển khai cơ bản
- [Trang Web Tĩnh - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Triển khai nội dung tĩnh
- [Ứng dụng Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Triển khai REST API

#### Ví dụ Bên ngoài - Tích hợp Cơ sở dữ liệu (Chương 3-4)  
- [Ứng dụng Cơ sở dữ liệu - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mẫu kết nối cơ sở dữ liệu
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Quy trình dữ liệu serverless

#### Ví dụ Bên ngoài - Mẫu Nâng cao (Chương 4-8)
- [Microservices Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Kiến trúc đa dịch vụ
- [Công việc Ứng dụng Container](https://github.com/Azure-Samples/container-apps-jobs) - Xử lý nền  
- [Pipeline ML Doanh nghiệp](https://github.com/Azure-Samples/mlops-v2) - Mẫu ML sẵn sàng cho sản xuất

### Bộ Sưu tập Mẫu Bên ngoài
- [**Thư viện Mẫu Chính thức AZD**](https://azure.github.io/awesome-azd/) - Bộ sưu tập mẫu chính thức và cộng đồng tuyển chọn
- [**Mẫu Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Tài liệu mẫu Microsoft Learn
- [**Thư mục Ví dụ**](examples/README.md) - Ví dụ học tập tại chỗ với giải thích chi tiết

---

## 📚 Tài Nguyên Học Tập & Tham Khảo

### Tham Khảo Nhanh
- [**Bảng Giác Đấu Lệnh**](resources/cheat-sheet.md) - Các lệnh azd thiết yếu sắp xếp theo chương
- [**Thuật Ngữ**](resources/glossary.md) - Thuật ngữ Azure và azd  
- [**Câu Hỏi Thường Gặp**](resources/faq.md) - Các câu hỏi phổ biến sắp xếp theo chương học
- [**Hướng Dẫn Học Tập**](resources/study-guide.md) - Bài tập thực hành toàn diện

### Hội Thảo Thực Hành
- [**Phòng Thí Nghiệm AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Làm giải pháp AI của bạn sẵn sàng triển khai AZD (2-3 giờ)
- [**Hội Thảo Tương Tác**](workshop/README.md) - 8 module bài tập hướng dẫn với MkDocs và GitHub Codespaces
  - Tiếp theo: Giới thiệu → Lựa chọn → Xác nhận → Phân tích → Cấu hình → Tùy chỉnh → Dọn dẹp → Tổng kết

### Tài Nguyên Học Tập Bên ngoài
- Tài liệu Azure Developer CLI (https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Trung tâm Kiến trúc Azure (https://learn.microsoft.com/en-us/azure/architecture/)
- Máy tính Giá Azure (https://azure.microsoft.com/pricing/calculator/)
- Trạng thái Azure (https://status.azure.com/)

### Kỹ năng Đại lý AI cho Trình soạn thảo của bạn
- [**Kỹ năng Microsoft Azure trên skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 kỹ năng đại lý mở cho Azure AI, Foundry, triển khai, chẩn đoán, tối ưu chi phí và nhiều hơn nữa. Cài đặt trong GitHub Copilot, Cursor, Claude Code hoặc bất kỳ đại lý nào được hỗ trợ:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hướng Dẫn Khắc Phục Sự Cố Nhanh

**Các vấn đề phổ biến người mới gặp và cách giải quyết ngay:**

<details>
<summary><strong>❌ "azd: lệnh không tìm thấy"</strong></summary>

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
<summary><strong>❌ "Không tìm thấy đăng ký" hoặc "Chưa đặt đăng ký"</strong></summary>

```bash
# Liệt kê các gói đăng ký có sẵn
az account list --output table

# Đặt gói đăng ký mặc định
az account set --subscription "<subscription-id-or-name>"

# Đặt cho môi trường AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Xác minh
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" hoặc "Vượt quá hạn ngạch"</strong></summary>

```bash
# Thử các khu vực Azure khác nhau
azd env set AZURE_LOCATION "westus2"
azd up

# Hoặc sử dụng SKU nhỏ hơn trong phát triển
# Chỉnh sửa infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" thất bại giữa chừng</strong></summary>

```bash
# Lựa chọn 1: Dọn dẹp và thử lại
azd down --force --purge
azd up

# Lựa chọn 2: Chỉ sửa hạ tầng
azd provision

# Lựa chọn 3: Kiểm tra trạng thái chi tiết
azd show

# Lựa chọn 4: Kiểm tra nhật ký trong Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Xác thực thất bại" hoặc "Token hết hạn"</strong></summary>

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
<summary><strong>❌ "Tài nguyên đã tồn tại" hoặc xung đột tên</strong></summary>

```bash
# AZD tạo tên duy nhất, nhưng nếu có xung đột:
azd down --force --purge

# Sau đó thử lại với môi trường mới
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Triển khai mẫu mất quá nhiều thời gian</strong></summary>

**Thời gian chờ thông thường:**
- Ứng dụng web đơn giản: 5-10 phút
- Ứng dụng có cơ sở dữ liệu: 10-15 phút
- Ứng dụng AI: 15-25 phút (Cung cấp OpenAI chậm)

```bash
# Kiểm tra tiến trình
azd show

# Nếu bị kẹt >30 phút, kiểm tra Azure Portal:
azd monitor --overview
# Tìm các triển khai thất bại
```
</details>

<details>
<summary><strong>❌ "Từ chối quyền" hoặc "Cấm"</strong></summary>

```bash
# Kiểm tra vai trò Azure của bạn
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Bạn cần ít nhất vai trò "Người đóng góp"
# Yêu cầu quản trị viên Azure của bạn cấp:
# - Người đóng góp (cho các tài nguyên)
# - Quản trị viên truy cập người dùng (cho việc phân bổ vai trò)
```
</details>

<details>
<summary><strong>❌ Không tìm thấy URL ứng dụng đã triển khai</strong></summary>

```bash
# Hiển thị tất cả các điểm cuối dịch vụ
azd show

# Hoặc mở Cổng thông tin Azure
azd monitor

# Kiểm tra dịch vụ cụ thể
azd env get-values
# Tìm các biến *_URL
```
</details>

### 📚 Tài Nguyên Khắc Phục Sự Cố Toàn Diện

- **Hướng dẫn các vấn đề phổ biến:** [Giải pháp chi tiết](docs/chapter-07-troubleshooting/common-issues.md)
- **Vấn đề AI cụ thể:** [Khắc phục sự cố AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hướng dẫn gỡ lỗi:** [Gỡ lỗi theo bước](docs/chapter-07-troubleshooting/debugging.md)
- **Nhận hỗ trợ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Hoàn Thành Khóa Học & Chứng Nhận

### Theo Dõi Tiến Độ
Theo dõi tiến trình học của bạn qua từng chương:

- [ ] **Chương 1**: Nền tảng & Khởi động nhanh ✅
- [ ] **Chương 2**: Phát triển AI-First ✅  
- [ ] **Chương 3**: Cấu hình & Xác thực ✅
- [ ] **Chương 4**: Hạ tầng dưới dạng mã & Triển khai ✅
- [ ] **Chương 5**: Giải pháp AI đa tác nhân ✅
- [ ] **Chương 6**: Xác nhận & Lập kế hoạch trước khi triển khai ✅
- [ ] **Chương 7**: Khắc phục sự cố & Gỡ lỗi ✅
- [ ] **Chương 8**: Mẫu sản xuất & doanh nghiệp ✅

### Xác minh Học tập
Sau khi hoàn thành mỗi chương, xác minh kiến thức của bạn bằng cách:
1. **Bài tập Thực hành**: Hoàn thành triển khai thực tế của chương
2. **Kiểm tra Kiến thức**: Xem lại phần FAQ cho chương của bạn
3. **Thảo luận Cộng đồng**: Chia sẻ kinh nghiệm của bạn trong Azure Discord
4. **Chương tiếp theo**: Chuyển đến mức độ phức tạp kế tiếp

### Lợi Ích khi Hoàn Thành Khóa Học
Sau khi hoàn thành tất cả các chương, bạn sẽ có:
- **Kinh nghiệm Sản xuất**: Triển khai ứng dụng AI thực tế trên Azure
- **Kỹ năng Chuyên nghiệp**: Năng lực triển khai sẵn sàng doanh nghiệp  
- **Sự công nhận từ Cộng đồng**: Thành viên tích cực của cộng đồng nhà phát triển Azure
- **Tiến triển nghề nghiệp**: Chuyên môn AZD và triển khai AI được săn đón

---

## 🤝 Cộng Đồng & Hỗ Trợ

### Nhận Hỗ Trợ & Giúp Đỡ
- **Vấn đề Kỹ thuật**: [Báo cáo lỗi và yêu cầu tính năng](https://github.com/microsoft/azd-for-beginners/issues)
- **Câu hỏi Học tập**: [Cộng đồng Microsoft Azure Discord](https://discord.gg/microsoft-azure) và [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Hỗ trợ AI cụ thể**: Tham gia [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tài liệu**: [Tài liệu chính thức Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Thông tin Cộng đồng từ Microsoft Foundry Discord

**Kết quả Khảo sát Gần đây từ Kênh #Azure:**
- **45%** nhà phát triển muốn dùng AZD cho workloads AI
- **Thách thức hàng đầu**: Triển khai đa dịch vụ, quản lý thông tin đăng nhập, sẵn sàng sản xuất  
- **Yêu cầu nhiều nhất**: Mẫu AI cụ thể, hướng dẫn khắc phục sự cố, thực hành tốt nhất

**Tham gia cộng đồng của chúng tôi để:**
- Chia sẻ trải nghiệm AZD + AI và nhận hỗ trợ
- Truy cập bản xem trước sớm của các mẫu AI mới
- Góp phần vào thực hành triển khai AI tốt nhất
- Ảnh hưởng đến phát triển tính năng AI + AZD trong tương lai

### Góp Phần cho Khóa Học
Chúng tôi hoan nghênh các đóng góp! Vui lòng đọc [Hướng dẫn Góp phần](CONTRIBUTING.md) để biết chi tiết về:
- **Cải thiện Nội dung**: Nâng cao các chương và ví dụ hiện có
- **Ví dụ Mới**: Thêm các tình huống và mẫu thực tế  
- **Dịch thuật**: Hỗ trợ duy trì hỗ trợ đa ngôn ngữ
- **Báo cáo Lỗi**: Cải thiện độ chính xác và rõ ràng
- **Tiêu chuẩn Cộng đồng**: Tuân thủ các hướng dẫn cộng đồng đa dạng của chúng tôi

---

## 📄 Thông Tin Khóa Học

### Giấy phép
Dự án này được cấp phép theo giấy phép MIT - xem tệp [LICENSE](../../LICENSE) để biết chi tiết.

### Tài Nguyên Học Tập Microsoft Liên Quan

Đội ngũ của chúng tôi sản xuất các khóa học học tập toàn diện khác:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j cho Người Mới](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js cho Người Mới](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain cho Người Mới](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Đại lý
[![AZD cho Người Mới](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI cho Người Mới](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP cho Người Mới](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Đại lý AI cho Người Mới](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Chuỗi AI Sinh Tạo
[![AI Sinh Tạo cho Người Mới](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Sinh Tạo (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Sinh Tạo (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Học Tập Cốt Lõi
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Thương Hiệu Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Điều Hướng Khóa Học

**🚀 Sẵn sàng để bắt đầu học?**

**Người mới bắt đầu**: Bắt đầu với [Chương 1: Nền tảng & Bắt đầu nhanh](#-chapter-1-foundation--quick-start)  
**Nhà phát triển AI**: Nhảy đến [Chương 2: Phát triển ưu tiên AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Nhà phát triển có kinh nghiệm**: Bắt đầu với [Chương 3: Cấu hình & Xác thực](#️-chapter-3-configuration--authentication)

**Bước tiếp theo**: [Bắt đầu Chương 1 - AZD Cơ bản](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->