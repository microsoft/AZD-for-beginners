# AZD Dành Cho Người Mới: Hành Trình Học Có Cấu Trúc

![AZD-cho-nguoi-moi](../../translated_images/vi/azdbeginners.5527441dd9f74068.webp) 

[![Người theo dõi GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks trên GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Ngôi sao GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord của Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Bản Dịch Tự Động (Luôn Cập Nhật)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Tiếng Ả Rập](../ar/README.md) | [Tiếng Bengali](../bn/README.md) | [Tiếng Bulgaria](../bg/README.md) | [Tiếng Miến Điện (Myanmar)](../my/README.md) | [Tiếng Trung (Giản thể)](../zh-CN/README.md) | [Tiếng Trung (Phồn thể, Hồng Kông)](../zh-HK/README.md) | [Tiếng Trung (Phồn thể, Macao)](../zh-MO/README.md) | [Tiếng Trung (Phồn thể, Đài Loan)](../zh-TW/README.md) | [Tiếng Croatia](../hr/README.md) | [Tiếng Séc](../cs/README.md) | [Tiếng Đan Mạch](../da/README.md) | [Tiếng Hà Lan](../nl/README.md) | [Tiếng Estonia](../et/README.md) | [Tiếng Phần Lan](../fi/README.md) | [Tiếng Pháp](../fr/README.md) | [Tiếng Đức](../de/README.md) | [Tiếng Hy Lạp](../el/README.md) | [Tiếng Do Thái](../he/README.md) | [Tiếng Hindi](../hi/README.md) | [Tiếng Hungary](../hu/README.md) | [Tiếng Indonesia](../id/README.md) | [Tiếng Ý](../it/README.md) | [Tiếng Nhật](../ja/README.md) | [Tiếng Kannada](../kn/README.md) | [Tiếng Hàn](../ko/README.md) | [Tiếng Litva](../lt/README.md) | [Tiếng Mã Lai](../ms/README.md) | [Tiếng Malayalam](../ml/README.md) | [Tiếng Marathi](../mr/README.md) | [Tiếng Nepal](../ne/README.md) | [Tiếng Pidgin Nigeria](../pcm/README.md) | [Tiếng Na Uy](../no/README.md) | [Tiếng Ba Tư (Farsi)](../fa/README.md) | [Tiếng Ba Lan](../pl/README.md) | [Tiếng Bồ Đào Nha (Brazil)](../pt-BR/README.md) | [Tiếng Bồ Đào Nha (Bồ Đào Nha)](../pt-PT/README.md) | [Tiếng Punjabi (Gurmukhi)](../pa/README.md) | [Tiếng Romania](../ro/README.md) | [Tiếng Nga](../ru/README.md) | [Tiếng Serbia (Chữ Cyrillic)](../sr/README.md) | [Tiếng Slovakia](../sk/README.md) | [Tiếng Slovenia](../sl/README.md) | [Tiếng Tây Ban Nha](../es/README.md) | [Tiếng Swahili](../sw/README.md) | [Tiếng Thụy Điển](../sv/README.md) | [Tiếng Tagalog (Filipino)](../tl/README.md) | [Tiếng Tamil](../ta/README.md) | [Tiếng Telugu](../te/README.md) | [Tiếng Thái](../th/README.md) | [Tiếng Thổ Nhĩ Kỳ](../tr/README.md) | [Tiếng Ukraina](../uk/README.md) | [Tiếng Urdu](../ur/README.md) | [Tiếng Việt](./README.md)

> **Ưu tiên Clone cục bộ?**
>
> Kho lưu trữ này bao gồm hơn 50 bản dịch ngôn ngữ, điều này làm tăng đáng kể kích thước tải xuống. Để clone mà không bao gồm các bản dịch, hãy dùng sparse checkout:
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
> Điều này cung cấp cho bạn mọi thứ cần thiết để hoàn thành khóa học với tốc độ tải xuống nhanh hơn.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Có gì mới trong azd hôm nay

Azure Developer CLI đã phát triển vượt ra ngoài các ứng dụng web và API truyền thống. Ngày nay, azd là công cụ duy nhất để triển khai bất kỳ ứng dụng nào lên Azure — bao gồm cả các ứng dụng hỗ trợ AI và các tác nhân thông minh.

Ý nghĩa của điều này cho bạn:

- **Các tác nhân AI hiện là workloads azd chính thức.** Bạn có thể khởi tạo, triển khai và quản lý các dự án tác nhân AI bằng cùng workflow `azd init` → `azd up` mà bạn đã biết.
- **Tích hợp Microsoft Foundry** mang việc triển khai mô hình, hosting tác nhân và cấu hình dịch vụ AI trực tiếp vào hệ sinh thái template của azd.
- **Luồng công việc cốt lõi không thay đổi.** Cho dù bạn đang triển khai một ứng dụng todo, một microservice, hay một giải pháp AI đa-tác nhân, các lệnh vẫn giống nhau.

Nếu bạn đã từng dùng azd trước đây, hỗ trợ AI là một phần mở rộng tự nhiên — không phải một công cụ riêng biệt hay một nhánh nâng cao. Nếu bạn bắt đầu từ đầu, bạn sẽ học một workflow duy nhất hoạt động cho mọi thứ.

---

## 🚀 Azure Developer CLI (azd) là gì?

**Azure Developer CLI (azd)** là một công cụ dòng lệnh thân thiện với nhà phát triển giúp đơn giản hóa việc triển khai ứng dụng lên Azure. Thay vì tạo và kết nối thủ công hàng chục tài nguyên Azure, bạn có thể triển khai toàn bộ ứng dụng chỉ với một lệnh.

### Phép màu của `azd up`

```bash
# Lệnh duy nhất này làm mọi thứ:
# ✅ Tạo tất cả các tài nguyên Azure
# ✅ Cấu hình mạng và bảo mật
# ✅ Xây dựng mã ứng dụng của bạn
# ✅ Triển khai lên Azure
# ✅ Cung cấp cho bạn một URL hoạt động
azd up
```

**Xong!** Không cần click trong Azure Portal, không cần học các ARM template phức tạp trước, không cần cấu hình thủ công — chỉ là các ứng dụng chạy được trên Azure.

---

## ❓ Azure Developer CLI và Azure CLI: Khác nhau như thế nào?

Đây là câu hỏi phổ biến nhất mà người mới thường hỏi. Đây là câu trả lời đơn giản:

| Tính năng | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Mục đích** | Quản lý các tài nguyên Azure riêng lẻ | Triển khai toàn bộ ứng dụng |
| **Tư duy** | Tập trung vào hạ tầng | Tập trung vào ứng dụng |
| **Ví dụ** | `az webapp create --name myapp...` | `azd up` |
| **Độ khó học** | Cần biết các dịch vụ Azure | Chỉ cần biết ứng dụng của bạn |
| **Phù hợp cho** | DevOps, Hạ tầng | Nhà phát triển, Prototype |

### So sánh đơn giản

- **Azure CLI** giống như có đầy đủ công cụ để xây một ngôi nhà — búa, cưa, đinh. Bạn có thể xây bất cứ thứ gì, nhưng bạn phải biết cách xây dựng.
- **Azure Developer CLI** giống như thuê một nhà thầu — bạn mô tả những gì bạn muốn, và họ lo phần xây dựng.

### Khi nào nên dùng cái nào

| Tình huống | Dùng cái này |
|----------|----------|
| "Tôi muốn triển khai web app nhanh" | `azd up` |
| "Tôi cần tạo một storage account riêng" | `az storage account create` |
| "Tôi đang xây một ứng dụng AI toàn diện" | `azd init --template azure-search-openai-demo` |
| "Tôi cần debug một tài nguyên Azure cụ thể" | `az resource show` |
| "Tôi muốn triển khai sẵn sàng cho production trong vài phút" | `azd up --environment production` |

### Chúng hoạt động cùng nhau!

AZD sử dụng Azure CLI ở tầng dưới. Bạn có thể dùng cả hai:
```bash
# Triển khai ứng dụng của bạn với AZD
azd up

# Sau đó tinh chỉnh các tài nguyên cụ thể bằng Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Tìm Mẫu trong Awesome AZD

Đừng bắt đầu từ con số 0! **Awesome AZD** là bộ sưu tập cộng đồng của các template sẵn sàng triển khai:

| Tài nguyên | Mô tả |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Duyệt hơn 200 mẫu với khả năng triển khai một cú nhấp |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Đóng góp mẫu của bạn cho cộng đồng |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Bấm Star và khám phá mã nguồn |

### Các Mẫu AI Phổ Biến từ Awesome AZD

```bash
# Trò chuyện RAG với các mô hình Microsoft Foundry + Tìm kiếm AI
azd init --template azure-search-openai-demo

# Ứng dụng trò chuyện AI nhanh
azd init --template openai-chat-app-quickstart

# Đại lý AI với các đại lý Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Bắt đầu trong 3 bước

### Bước 1: Cài AZD (2 phút)

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

### Bước 2: Đăng nhập vào Azure

```bash
azd auth login
```

### Bước 3: Triển khai Ứng dụng Đầu tiên của bạn

```bash
# Khởi tạo từ một mẫu
azd init --template todo-nodejs-mongo

# Triển khai đến Azure (tạo tất cả mọi thứ!)
azd up
```

**🎉 Xong rồi!** Ứng dụng của bạn giờ đã hoạt động trên Azure.

### Dọn dẹp (Đừng quên!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cách Sử Dụng Khóa Học Này

Khóa học này được thiết kế cho việc học theo trình tự — bắt đầu từ nơi bạn cảm thấy thoải mái và tiến dần lên:

| Kinh nghiệm của bạn | Bắt đầu ở đây |
|-----------------|------------|
| **Mới hoàn toàn với Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Biết Azure, mới với AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Muốn triển khai ứng dụng AI** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Muốn thực hành trực tiếp** | [🎓 Interactive Workshop](workshop/README.md) - Thực hành hướng dẫn 3-4 giờ |
| **Cần các mẫu triển khai cho môi trường sản xuất** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Thiết lập nhanh

1. **Fork Kho Lưu Trữ Này**: [![Forks trên GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone về máy**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Nhận trợ giúp**: [Cộng đồng Azure trên Discord](https://discord.com/invite/ByRwuEEgH4)

> **Ưu tiên Clone cục bộ?**
>
> Kho lưu trữ này bao gồm hơn 50 bản dịch ngôn ngữ, điều này làm tăng đáng kể kích thước tải xuống. Để clone mà không bao gồm các bản dịch, hãy dùng sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Điều này cung cấp cho bạn mọi thứ cần thiết để hoàn thành khóa học với tốc độ tải xuống nhanh hơn.


## Tổng Quan Khóa Học

Làm chủ Azure Developer CLI (azd) thông qua các chương được cấu trúc giúp việc học tiến bộ. **Tập trung đặc biệt vào triển khai ứng dụng AI với tích hợp Microsoft Foundry.**

### Tại sao Khóa học này cần thiết cho Nhà phát triển hiện đại

Dựa trên các thông tin từ cộng đồng Microsoft Foundry trên Discord, **45% nhà phát triển muốn sử dụng AZD cho workloads AI** nhưng gặp những thách thức như:
- Kiến trúc AI phức tạp với nhiều dịch vụ
- Các thực hành tốt nhất cho triển khai AI ở môi trường production  
- Tích hợp và cấu hình dịch vụ Azure AI
- Tối ưu chi phí cho workloads AI
- Khắc phục sự cố triển khai liên quan đến AI

### Mục tiêu học tập

Khi hoàn thành khóa học có cấu trúc này, bạn sẽ:
- **Làm chủ các khái niệm cơ bản AZD**: Khái niệm cốt lõi, cài đặt và cấu hình
- **Triển khai ứng dụng AI**: Sử dụng AZD với dịch vụ Microsoft Foundry
- **Áp dụng Infrastructure as Code**: Quản lý tài nguyên Azure bằng các template Bicep
- **Khắc phục sự cố triển khai**: Giải quyết các vấn đề phổ biến và debug
- **Tối ưu cho môi trường production**: Bảo mật, scale, giám sát và quản lý chi phí
- **Xây dựng giải pháp đa-tác nhân**: Triển khai kiến trúc AI phức tạp

## 🗺️ Bản đồ Khóa học: Điều hướng nhanh theo chương

Mỗi chương có một README riêng với mục tiêu học tập, hướng dẫn nhanh và bài tập:

| Chương | Chủ đề | Bài học | Thời lượng | Độ phức tạp |
|---------|-------|---------|----------|------------|
| **[Ch 1: Nền tảng](docs/chapter-01-foundation/README.md)** | Bắt đầu | [Cơ bản về AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Cài đặt](docs/chapter-01-foundation/installation.md) &#124; [Dự án đầu tiên](docs/chapter-01-foundation/first-project.md) | 30-45 phút | ⭐ |
| **[Ch 2: Phát triển AI](docs/chapter-02-ai-development/README.md)** | Ứng dụng ưu tiên AI | [Tích hợp Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Tác nhân AI](docs/chapter-02-ai-development/agents.md) &#124; [Triển khai Mô hình](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Hội thảo](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 giờ | ⭐⭐ |
| **[Ch 3: Cấu hình](docs/chapter-03-configuration/README.md)** | Xác thực & Bảo mật | [Cấu hình](docs/chapter-03-configuration/configuration.md) &#124; [Xác thực & Bảo mật](docs/chapter-03-configuration/authsecurity.md) | 45-60 phút | ⭐⭐ |
| **[Ch 4: Hạ tầng](docs/chapter-04-infrastructure/README.md)** | IaC & Triển khai | [Hướng dẫn Triển khai](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Cấp phát tài nguyên](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 giờ | ⭐⭐⭐ |
| **[Ch 5: Đa-Tác nhân](docs/chapter-05-multi-agent/README.md)** | Giải pháp Tác nhân AI | [Kịch bản Bán lẻ](examples/retail-scenario.md) &#124; [Mô hình Phối hợp](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 giờ | ⭐⭐⭐⭐ |
| **[Ch 6: Tiền-Triển khai](docs/chapter-06-pre-deployment/README.md)** | Lập kế hoạch & Xác thực | [Kiểm tra Trước khi bay](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Lập kế hoạch Dung lượng](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Lựa chọn SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 giờ | ⭐⭐ |
| **[Ch 7: Khắc phục sự cố](docs/chapter-07-troubleshooting/README.md)** | Gỡ lỗi & Sửa chữa | [Vấn đề Thường gặp](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Gỡ lỗi](docs/chapter-07-troubleshooting/debugging.md) &#124; [Vấn đề AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 giờ | ⭐⭐ |
| **[Ch 8: Sản xuất](docs/chapter-08-production/README.md)** | Mô hình Doanh nghiệp | [Thực hành Sản xuất](docs/chapter-08-production/production-ai-practices.md) | 2-3 giờ | ⭐⭐⭐⭐ |
| **[🎓 Hội thảo](workshop/README.md)** | Phòng thí nghiệm Thực hành | [Giới thiệu](workshop/docs/instructions/0-Introduction.md) &#124; [Lựa chọn](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Xác thực](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Phân tích](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Cấu hình](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tùy chỉnh](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Dọn dẹp Hạ tầng](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Tổng kết](workshop/docs/instructions/7-Wrap-up.md) | 3-4 giờ | ⭐⭐ |

**Tổng Thời lượng Khoá học:** ~10-14 giờ | **Tiến trình Kỹ năng:** Người mới → Sẵn sàng cho Sản xuất

---

## 📚 Các chương học

*Chọn lộ trình học dựa trên mức kinh nghiệm và mục tiêu*

### 🚀 Chương 1: Nền tảng & Bắt đầu nhanh
**Yêu cầu tiên quyết**: Azure subscription, kiến thức cơ bản về dòng lệnh  
**Thời lượng**: 30-45 phút  
**Độ phức tạp**: ⭐

#### Những gì bạn sẽ học
- Hiểu các nguyên tắc cơ bản của Azure Developer CLI
- Cài đặt AZD trên nền tảng của bạn
- Triển khai thành công đầu tiên của bạn

#### Tài nguyên học tập
- **🎯 Bắt đầu tại đây**: [Azure Developer CLI là gì?](#what-is-azure-developer-cli)
- **📖 Lý thuyết**: [AZD Cơ bản](docs/chapter-01-foundation/azd-basics.md) - Các khái niệm cốt lõi và thuật ngữ
- **⚙️ Thiết lập**: [Cài đặt & Thiết lập](docs/chapter-01-foundation/installation.md) - Hướng dẫn theo nền tảng
- **🛠️ Thực hành**: [Dự án đầu tiên của bạn](docs/chapter-01-foundation/first-project.md) - Hướng dẫn từng bước
- **📋 Tham khảo nhanh**: [Bảng tóm tắt lệnh](resources/cheat-sheet.md)

#### Bài tập thực hành
```bash
# Kiểm tra cài đặt nhanh
azd version

# Triển khai ứng dụng đầu tiên của bạn
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kết quả Chương**: Triển khai thành công một ứng dụng web đơn giản lên Azure bằng AZD

**✅ Xác nhận thành công:**
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
**📈 Mức kỹ năng sau:** Có thể triển khai các ứng dụng cơ bản một cách độc lập
**📈 Mức kỹ năng sau:** Có thể triển khai các ứng dụng cơ bản một cách độc lập

---

### 🤖 Chương 2: Phát triển AI-First (Đề xuất cho Nhà phát triển AI)
**Yêu cầu tiên quyết**: Hoàn thành Chương 1  
**Thời lượng**: 1-2 giờ  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Tích hợp Microsoft Foundry với AZD
- Triển khai các ứng dụng có khả năng AI
- Hiểu cấu hình dịch vụ AI

#### Tài nguyên học tập
- **🎯 Bắt đầu tại đây**: [Tích hợp Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Tác nhân AI**: [Hướng dẫn Tác nhân AI](docs/chapter-02-ai-development/agents.md) - Triển khai các tác nhân thông minh với AZD
- **📖 Mô hình**: [Triển khai Mô hình AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Triển khai và quản lý mô hình AI
- **🛠️ Phòng thí nghiệm**: [Phòng thí nghiệm AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Chuẩn hóa giải pháp AI cho AZD
- **🎥 Hướng dẫn tương tác**: [Tài liệu Hội thảo](workshop/README.md) - Học trên trình duyệt với MkDocs * Môi trường DevContainer
- **📋 Mẫu**: [Mẫu Microsoft Foundry](#đi-sâu-khả-năng-của-azd)
- **📝 Ví dụ**: [Ví dụ Triển khai AZD](examples/README.md)

#### Bài tập thực hành
```bash
# Triển khai ứng dụng AI đầu tiên của bạn
azd init --template azure-search-openai-demo
azd up

# Thử thêm các mẫu AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kết quả Chương**: Triển khai và cấu hình một ứng dụng chat hỗ trợ AI với khả năng RAG

**✅ Xác nhận thành công:**
```bash
# Sau Chương 2, bạn sẽ có thể:
azd init --template azure-search-openai-demo
azd up
# Kiểm tra giao diện trò chuyện AI
# Đặt câu hỏi và nhận câu trả lời do AI cung cấp kèm nguồn
# Xác minh tích hợp tìm kiếm hoạt động
azd monitor  # Kiểm tra Application Insights hiển thị dữ liệu telemetri
azd down --force --purge
```

**📊 Thời gian đầu tư:** 1-2 giờ  
**📈 Mức kỹ năng sau:** Có thể triển khai và cấu hình các ứng dụng AI sẵn sàng cho sản xuất  
**💰 Nhận thức về chi phí:** Hiểu chi phí phát triển $80-150/tháng, chi phí sản xuất $300-3500/tháng

#### 💰 Cân nhắc chi phí cho các triển khai AI

**Môi trường Phát triển (Ước tính $80-150/tháng):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/tháng (dựa trên việc sử dụng token)
- AI Search (Gói cơ bản): $75/tháng
- Container Apps (Tiêu thụ): $0-20/tháng
- Lưu trữ (Chuẩn): $1-5/tháng

**Môi trường Sản xuất (Ước tính $300-3,500+/tháng):**
- Microsoft Foundry Models (PTU để đảm bảo hiệu năng): $3,000+/tháng HOẶC Trả-theo-sử-dụng với khối lượng lớn
- AI Search (Gói tiêu chuẩn): $250/tháng
- Container Apps (Dành riêng): $50-100/tháng
- Application Insights: $5-50/tháng
- Lưu trữ (Cao cấp): $10-50/tháng

**💡 Mẹo tối ưu hóa chi phí:**
- Sử dụng **gói miễn phí** Microsoft Foundry Models để học (Azure OpenAI gồm 50,000 token/tháng)
- Chạy `azd down` để giải phóng tài nguyên khi không phát triển tích cực
- Bắt đầu với thanh toán theo mức tiêu thụ, nâng cấp lên PTU chỉ cho môi trường sản xuất
- Sử dụng `azd provision --preview` để ước tính chi phí trước khi triển khai
- Bật auto-scaling: chỉ trả cho mức sử dụng thực tế

**Giám sát Chi phí:**
```bash
# Kiểm tra chi phí ước tính hàng tháng
azd provision --preview

# Theo dõi chi phí thực tế trong Cổng thông tin Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chương 3: Cấu hình & Xác thực
**Yêu cầu tiên quyết**: Hoàn thành Chương 1  
**Thời lượng**: 45-60 phút  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Cấu hình và quản lý môi trường
- Thực hành tốt nhất về xác thực và bảo mật
- Đặt tên và tổ chức tài nguyên

#### Tài nguyên học tập
- **📖 Cấu hình**: [Hướng dẫn Cấu hình](docs/chapter-03-configuration/configuration.md) - Thiết lập môi trường
- **🔐 Bảo mật**: [Mẫu xác thực và managed identity](docs/chapter-03-configuration/authsecurity.md) - Các mẫu xác thực
- **📝 Ví dụ**: [Ví dụ Ứng dụng Cơ sở dữ liệu](examples/database-app/README.md) - Ví dụ Cơ sở dữ liệu AZD

#### Bài tập thực hành
- Cấu hình nhiều môi trường (dev, staging, prod)
- Thiết lập xác thực managed identity
- Thực hiện cấu hình theo môi trường

**💡 Kết quả Chương**: Quản lý nhiều môi trường với xác thực và bảo mật phù hợp

---

### 🏗️ Chương 4: Hạ tầng như mã & Triển khai
**Yêu cầu tiên quyết**: Hoàn thành Chương 1-3  
**Thời lượng**: 1-1.5 giờ  
**Độ phức tạp**: ⭐⭐⭐

#### Những gì bạn sẽ học
- Mô hình triển khai nâng cao
- Hạ tầng như mã với Bicep
- Chiến lược cấp phát tài nguyên

#### Tài nguyên học tập
- **📖 Triển khai**: [Hướng dẫn Triển khai](docs/chapter-04-infrastructure/deployment-guide.md) - Quy trình hoàn chỉnh
- **🏗️ Cấp phát**: [Cấp phát Tài nguyên](docs/chapter-04-infrastructure/provisioning.md) - Quản lý tài nguyên Azure
- **📝 Ví dụ**: [Ví dụ Container App](../../examples/container-app) - Triển khai container hóa

#### Bài tập thực hành
- Tạo mẫu Bicep tùy chỉnh
- Triển khai ứng dụng nhiều dịch vụ
- Thực hiện chiến lược triển khai blue-green

**💡 Kết quả Chương**: Triển khai các ứng dụng nhiều dịch vụ phức tạp bằng cách sử dụng mẫu hạ tầng tùy chỉnh

---

### 🎯 Chương 5: Giải pháp AI Đa-Tác nhân (Nâng cao)
**Yêu cầu tiên quyết**: Hoàn thành Chương 1-2  
**Thời lượng**: 2-3 giờ  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Mô hình kiến trúc đa-tác nhân
- Điều phối và phối hợp tác nhân
- Triển khai AI sẵn sàng cho sản xuất

#### Tài nguyên học tập
- **🤖 Dự án nổi bật**: [Giải pháp Đa-Tác nhân cho Bán lẻ](examples/retail-scenario.md) - Triển khai đầy đủ
- **🛠️ Mẫu ARM**: [Gói Mẫu ARM](../../examples/retail-multiagent-arm-template) - Triển khai một lần nhấp
- **📖 Kiến trúc**: [Mô hình phối hợp đa-tác nhân](docs/chapter-06-pre-deployment/coordination-patterns.md) - Các mẫu

#### Bài tập thực hành
```bash
# Triển khai giải pháp đa tác nhân bán lẻ hoàn chỉnh
cd examples/retail-multiagent-arm-template
./deploy.sh

# Khám phá cấu hình của các tác nhân
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kết quả Chương**: Triển khai và quản lý một giải pháp AI đa-tác nhân sẵn sàng cho sản xuất với các tác nhân Khách hàng và Hàng tồn kho

---

### 🔍 Chương 6: Xác thực & Lập kế hoạch trước khi Triển khai
**Yêu cầu tiên quyết**: Hoàn thành Chương 4  
**Thời lượng**: 1 giờ  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Lập kế hoạch dung lượng và xác thực tài nguyên
- Chiến lược lựa chọn SKU
- Kiểm tra trước khi bay và tự động hóa

#### Tài nguyên học tập
- **📊 Lập kế hoạch**: [Lập kế hoạch Dung lượng](docs/chapter-06-pre-deployment/capacity-planning.md) - Xác thực tài nguyên
- **💰 Lựa chọn**: [Lựa chọn SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Lựa chọn tiết kiệm chi phí
- **✅ Xác thực**: [Kiểm tra Trước khi bay](docs/chapter-06-pre-deployment/preflight-checks.md) - Script tự động

#### Bài tập thực hành
- Chạy script xác thực dung lượng
- Tối ưu lựa chọn SKU để tiết kiệm chi phí
- Thực hiện kiểm tra tự động trước triển khai

**💡 Kết quả Chương**: Xác thực và tối ưu triển khai trước khi thực hiện

---

### 🚨 Chương 7: Khắc phục sự cố & Gỡ lỗi
**Yêu cầu tiên quyết**: Hoàn thành bất kỳ chương triển khai nào  
**Thời lượng**: 1-1.5 giờ  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Phương pháp gỡ lỗi có hệ thống
- Vấn đề thường gặp và giải pháp
- Khắc phục sự cố đặc thù cho AI

#### Tài nguyên học tập
- **🔧 Vấn đề Thường gặp**: [Vấn đề Thường gặp](docs/chapter-07-troubleshooting/common-issues.md) - Câu hỏi thường gặp và giải pháp
- **🕵️ Gỡ lỗi**: [Hướng dẫn Gỡ lỗi](docs/chapter-07-troubleshooting/debugging.md) - Chiến lược từng bước
- **🤖 Vấn đề AI**: [Khắc phục Sự cố Đối với AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Vấn đề dịch vụ AI

#### Bài tập thực hành
- Chẩn đoán lỗi triển khai
- Giải quyết vấn đề xác thực
- Gỡ lỗi kết nối dịch vụ AI

**💡 Kết quả Chương**: Tự chẩn đoán và giải quyết các vấn đề triển khai thường gặp

---

### 🏢 Chương 8: Sản xuất & Mô hình Doanh nghiệp
**Yêu cầu tiên quyết**: Hoàn thành Chương 1-4  
**Thời lượng**: 2-3 giờ  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Tài nguyên học tập
- **🏭 Sản xuất**: [Các thực hành tốt nhất AI cho Production](docs/chapter-08-production/production-ai-practices.md) - Mẫu cho doanh nghiệp
- **📝 Ví dụ**: [Microservices Example](../../examples/microservices) - Kiến trúc phức tạp
- **📊 Giám sát**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Giám sát

#### Bài tập thực hành
- Thực hiện các mẫu bảo mật cho doanh nghiệp
- Thiết lập giám sát toàn diện
- Triển khai lên môi trường sản xuất với quản trị phù hợp

**💡 Kết quả chương**: Triển khai ứng dụng sẵn sàng cho doanh nghiệp với đầy đủ khả năng sản xuất

---

## 🎓 Tổng quan Hội thảo: Trải nghiệm Học tập Thực hành

> **⚠️ TÌNH TRẠNG HỘI THẢO: Đang phát triển**  
> Tài liệu hội thảo hiện đang được phát triển và hoàn thiện. Các mô-đun cốt lõi đang hoạt động, nhưng một số phần nâng cao chưa hoàn chỉnh. Chúng tôi đang tích cực làm việc để hoàn thành tất cả nội dung. [Theo dõi tiến độ →](workshop/README.md)

### Tài liệu Hội thảo Tương tác
**Học thực hành toàn diện với công cụ trên trình duyệt và bài tập có hướng dẫn**

Tài liệu hội thảo cung cấp trải nghiệm học tập tương tác và có cấu trúc, bổ trợ cho chương trình học theo chương ở phía trên. Hội thảo được thiết kế cho cả việc học tự chủ và các buổi do giảng viên hướng dẫn.

#### 🛠️ Tính năng Hội thảo
- **Giao diện trên trình duyệt**: Hoàn chỉnh hội thảo chạy trên MkDocs với tính năng tìm kiếm, sao chép và chủ đề
- **Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển chỉ với một cú nhấp
- **Lộ trình học có cấu trúc**: 8 mô-đun bài tập có hướng dẫn (3-4 giờ tổng cộng)
- **Phương pháp tiến bộ**: Giới thiệu → Lựa chọn → Xác thực → Phân tích cấu trúc → Cấu hình → Tùy chỉnh → Dọn dẹp → Tổng kết
- **Môi trường DevContainer tương tác**: Công cụ và phụ thuộc được cấu hình sẵn

#### 📚 Cấu trúc Mô-đun Hội thảo
Hội thảo theo một phương pháp tiến bộ 8 mô-đun giúp bạn từ khám phá đến thành thạo triển khai:

| Mô-đun | Chủ đề | Những gì bạn sẽ làm | Thời lượng |
|--------|-------|----------------|----------|
| **0. Giới thiệu** | Tổng quan Hội thảo | Hiểu mục tiêu học tập, điều kiện tiên quyết, và cấu trúc hội thảo | 15 phút |
| **1. Lựa chọn** | Khám phá mẫu | Khám phá các mẫu AZD và chọn mẫu AI phù hợp cho kịch bản của bạn | 20 phút |
| **2. Xác thực** | Triển khai & Xác minh | Triển khai mẫu với `azd up` và xác minh hạ tầng hoạt động | 30 phút |
| **3. Phân tích cấu trúc** | Hiểu cấu trúc | Sử dụng GitHub Copilot để khám phá kiến trúc mẫu, các tệp Bicep và tổ chức mã | 30 phút |
| **4. Cấu hình** | Đi sâu vào azure.yaml | Thành thạo cấu hình `azure.yaml`, hook vòng đời và biến môi trường | 30 phút |
| **5. Tùy chỉnh** | Làm cho nó thành của bạn | Kích hoạt AI Search, theo dõi, đánh giá, và tùy chỉnh cho kịch bản của bạn | 45 phút |
| **6. Dọn dẹp** | Dọn dẹp | Giải phóng tài nguyên an toàn với `azd down --purge` | 15 phút |
| **7. Tổng kết** | Bước tiếp theo | Xem lại thành tựu, khái niệm chính, và tiếp tục hành trình học tập của bạn | 15 phút |

**Luồng Hội thảo:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Bắt đầu với Hội thảo
```bash
# Tùy chọn 1: GitHub Codespaces (Được khuyến nghị)
# Nhấp vào "Code" → "Create codespace on main" trong kho lưu trữ

# Tùy chọn 2: Phát triển cục bộ
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Làm theo hướng dẫn cài đặt trong workshop/README.md
```

#### 🎯 Kết quả học tập của Hội thảo
Khi hoàn thành hội thảo, người tham gia sẽ:
- **Triển khai Ứng dụng AI cho Môi trường Production**: Sử dụng AZD với các dịch vụ Microsoft Foundry
- **Thành thạo Kiến trúc Đa Tác nhân**: Triển khai các giải pháp tác nhân AI phối hợp
- **Thực hiện Các Thực hành Bảo mật Tốt nhất**: Cấu hình xác thực và kiểm soát truy cập
- **Tối ưu hóa cho Quy mô**: Thiết kế triển khai hiệu suất cao và tiết kiệm chi phí
- **Khắc phục Sự cố Triển khai**: Giải quyết các vấn đề phổ biến một cách độc lập

#### 📖 Tài nguyên Hội thảo
- **🎥 Hướng dẫn tương tác**: [Workshop Materials](workshop/README.md) - Môi trường học tập trên trình duyệt
- **📋 Hướng dẫn theo mô-đun**:
  - [0. Giới thiệu](workshop/docs/instructions/0-Introduction.md) - Tổng quan hội thảo và mục tiêu
  - [1. Lựa chọn](workshop/docs/instructions/1-Select-AI-Template.md) - Tìm và chọn mẫu AI
  - [2. Xác thực](workshop/docs/instructions/2-Validate-AI-Template.md) - Triển khai và xác minh mẫu
  - [3. Phân tích cấu trúc](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Khám phá kiến trúc mẫu
  - [4. Cấu hình](workshop/docs/instructions/4-Configure-AI-Template.md) - Thành thạo azure.yaml
  - [5. Tùy chỉnh](workshop/docs/instructions/5-Customize-AI-Template.md) - Tùy chỉnh cho kịch bản của bạn
  - [6. Dọn dẹp](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Dọn dẹp tài nguyên
  - [7. Tổng kết](workshop/docs/instructions/7-Wrap-up.md) - Xem lại và các bước tiếp theo
- **🛠️ Phòng thí nghiệm Hội thảo AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Bài tập tập trung vào AI
- **💡 Bắt đầu Nhanh**: [Workshop Setup Guide](workshop/README.md#quick-start) - Cấu hình môi trường

**Phù hợp cho**: Đào tạo doanh nghiệp, khóa học đại học, tự học theo tốc độ cá nhân, và bootcamp dành cho lập trình viên.

---

## 📖 Đi sâu: Khả năng của AZD

Ngoài những điều cơ bản, AZD cung cấp các tính năng mạnh mẽ cho triển khai production:

- **Triển khai theo mẫu** - Sử dụng các mẫu đã xây dựng sẵn cho các mẫu ứng dụng phổ biến
- **Hạ tầng như Mã** - Quản lý tài nguyên Azure bằng Bicep hoặc Terraform  
- **Luồng công việc tích hợp** - Cấp phát, triển khai và giám sát ứng dụng một cách liền mạch
- **Thân thiện với nhà phát triển** - Tối ưu hóa cho năng suất và trải nghiệm nhà phát triển

### **AZD + Microsoft Foundry: Hoàn hảo cho triển khai AI**

**Tại sao chọn AZD cho Giải pháp AI?** AZD giải quyết các thách thức hàng đầu mà nhà phát triển AI gặp phải:

- **Mẫu sẵn sàng cho AI** - Mẫu được cấu hình trước cho Microsoft Foundry Models, Cognitive Services và tải công việc ML
- **Triển khai AI an toàn** - Mẫu bảo mật tích hợp cho dịch vụ AI, khóa API và điểm cuối mô hình  
- **Mẫu AI cho Production** - Thực hành tốt nhất cho triển khai ứng dụng AI có khả năng mở rộng và tối ưu chi phí
- **Luồng công việc AI đầu-cuối** - Từ phát triển mô hình đến triển khai production với giám sát phù hợp
- **Tối ưu chi phí** - Phân bổ tài nguyên và chiến lược mở rộng thông minh cho khối lượng công việc AI
- **Tích hợp Microsoft Foundry** - Kết nối liền mạch đến danh mục mô hình và điểm cuối Microsoft Foundry

---

## 🎯 Thư viện Mẫu & Ví dụ

### Nổi bật: Mẫu Microsoft Foundry
**Bắt đầu tại đây nếu bạn đang triển khai ứng dụng AI!**

> **Ghi chú:** Những mẫu này minh họa các mẫu AI khác nhau. Một số là Azure Samples bên ngoài, số khác là triển khai cục bộ.

| Mẫu | Chương | Độ phức tạp | Dịch vụ | Loại |
|----------|---------|------------|----------|------|
| [**Bắt đầu với chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chương 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Bên ngoài |
| [**Bắt đầu với tác nhân AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chương 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Bên ngoài |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chương 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Bên ngoài |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chương 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Bên ngoài |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chương 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Bên ngoài |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chương 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Bên ngoài |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chương 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Cục bộ** |

### Nổi bật: Kịch bản học tập đầy đủ
**Mẫu ứng dụng sẵn sàng cho production được ánh xạ tới các chương học**

| Mẫu | Chương học | Độ phức tạp | Bài học chính |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chương 2 | ⭐ | Mẫu triển khai AI cơ bản |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chương 2 | ⭐⭐ | Triển khai RAG với Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chương 4 | ⭐⭐ | Tích hợp Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chương 5 | ⭐⭐⭐ | Framework tác nhân và gọi hàm |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chương 8 | ⭐⭐⭐ | Orchestration AI doanh nghiệp |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chương 5 | ⭐⭐⭐⭐ | Kiến trúc đa-tác nhân với tác nhân Khách hàng và Kho hàng |

### Học qua Ví dụ theo Loại

> **📌 Ví dụ Cục bộ vs. Bên ngoài:**  
> **Ví dụ Cục bộ** (trong repo này) = Sẵn sàng sử dụng ngay  
> **Ví dụ Bên ngoài** (Azure Samples) = Clone từ các repository được liên kết

#### Ví dụ Cục bộ (Sẵn sàng sử dụng)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Triển khai hoàn chỉnh sẵn sàng cho production với các mẫu ARM
  - Kiến trúc đa-tác nhân (Tác nhân Khách hàng + Tác nhân Kho hàng)
  - Giám sát và đánh giá toàn diện
  - Triển khai một cú nhấp qua mẫu ARM

#### Ví dụ Cục bộ - Ứng dụng Container (Chương 2-5)
**Ví dụ triển khai container toàn diện trong kho này:**
- [**Container App Examples**](examples/container-app/README.md) - Hướng dẫn đầy đủ cho triển khai container hóa
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - REST API cơ bản với scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Triển khai đa-dịch vụ sẵn sàng cho production
  - Mẫu Bắt đầu Nhanh, Production và Nâng cao
  - Hướng dẫn giám sát, bảo mật và tối ưu chi phí

#### Ví dụ Bên ngoài - Ứng dụng đơn giản (Chương 1-2)
**Clone các repository Azure Samples này để bắt đầu:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mẫu triển khai cơ bản
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Triển khai nội dung tĩnh
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Triển khai REST API

#### Ví dụ Bên ngoài - Tích hợp Cơ sở dữ liệu (Chương 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mẫu kết nối cơ sở dữ liệu
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Luồng dữ liệu serverless

#### Ví dụ Bên ngoài - Mẫu nâng cao (Chương 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Kiến trúc đa-dịch vụ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Xử lý nền  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Mẫu ML sẵn sàng cho production

### Bộ sưu tập Mẫu Bên ngoài
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Bộ sưu tập tuyển chọn các mẫu chính thức và cộng đồng
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Tài liệu mẫu Microsoft Learn
- [**Examples Directory**](examples/README.md) - Ví dụ học tập cục bộ với giải thích chi tiết

---

## 📚 Tài nguyên học tập & Tài liệu tham khảo

### Tài liệu tham khảo nhanh
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Các lệnh azd thiết yếu được tổ chức theo chương
- [**Glossary**](resources/glossary.md) - Thuật ngữ Azure và azd  
- [**FAQ**](resources/faq.md) - Các câu hỏi phổ biến được tổ chức theo chương học
- [**Study Guide**](resources/study-guide.md) - Bài tập thực hành toàn diện

### Hội thảo thực hành
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Làm cho giải pháp AI của bạn có thể triển khai bằng AZD (2-3 giờ)
- [**Interactive Workshop**](workshop/README.md) - 8 mô-đun bài tập có hướng dẫn với MkDocs và GitHub Codespaces
  - Theo: Giới thiệu → Lựa chọn → Xác thực → Phân tích cấu trúc → Cấu hình → Tùy chỉnh → Dọn dẹp → Tổng kết

### Tài nguyên học tập bên ngoài
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Bộ tính giá Azure](https://azure.microsoft.com/pricing/calculator/)
- [Trạng thái Azure](https://status.azure.com/)

### Kỹ năng Tác nhân AI cho Trình soạn thảo của Bạn
- [**Kỹ năng Microsoft Azure trên skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 kỹ năng tác nhân mở cho Azure AI, Foundry, triển khai, chẩn đoán, tối ưu chi phí, và hơn thế nữa. Cài đặt chúng trong GitHub Copilot, Cursor, Claude Code, hoặc bất kỳ tác nhân được hỗ trợ nào:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hướng dẫn Khắc phục Sự cố Nhanh

**Các vấn đề thường gặp mà người mới gặp phải và giải pháp ngay lập tức:**

<details>
<summary><strong>❌ "azd: lệnh không được tìm thấy"</strong></summary>

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
# Liệt kê các đăng ký có sẵn
az account list --output table

# Đặt đăng ký mặc định
az account set --subscription "<subscription-id-or-name>"

# Đặt cho môi trường AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Xác minh
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" hoặc "Đã vượt quá hạn mức"</strong></summary>

```bash
# Thử vùng Azure khác
azd env set AZURE_LOCATION "westus2"
azd up

# Hoặc sử dụng SKU nhỏ hơn trong môi trường phát triển
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

# Lựa chọn 2: Chỉ sửa cơ sở hạ tầng
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
# Xác thực lại
az logout
az login

azd auth logout
azd auth login

# Xác minh xác thực
az account show
```
</details>

<details>
<summary><strong>❌ "Tài nguyên đã tồn tại" hoặc xung đột tên</strong></summary>

```bash
# AZD tạo tên duy nhất, nhưng nếu xung đột:
azd down --force --purge

# Sau đó thử lại với môi trường mới
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Việc triển khai mẫu mất quá nhiều thời gian</strong></summary>

**Thời gian chờ bình thường:**
- Ứng dụng web đơn giản: 5-10 phút
- Ứng dụng kèm cơ sở dữ liệu: 10-15 phút
- Ứng dụng AI: 15-25 phút (việc cấp phát OpenAI chậm)

```bash
# Kiểm tra tiến độ
azd show

# Nếu bị mắc kẹt hơn 30 phút, hãy kiểm tra Azure Portal:
azd monitor
# Tìm các triển khai thất bại
```
</details>

<details>
<summary><strong>❌ "Không có quyền" hoặc "Bị cấm"</strong></summary>

```bash
# Kiểm tra vai trò Azure của bạn
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Bạn cần có ít nhất vai trò "Contributor"
# Yêu cầu quản trị viên Azure của bạn cấp:
# - Contributor (cho các tài nguyên)
# - User Access Administrator (cho việc gán vai trò)
```
</details>

<details>
<summary><strong>❌ Không thể tìm thấy URL ứng dụng đã triển khai</strong></summary>

```bash
# Hiển thị tất cả các điểm cuối của dịch vụ
azd show

# Hoặc mở Azure Portal
azd monitor

# Kiểm tra dịch vụ cụ thể
azd env get-values
# Tìm các biến *_URL
```
</details>

### 📚 Tài nguyên Khắc phục Sự cố đầy đủ

- **Hướng dẫn Các Vấn đề Thường gặp:** [Giải pháp Chi tiết](docs/chapter-07-troubleshooting/common-issues.md)
- **Vấn đề Riêng cho AI:** [Khắc phục sự cố AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hướng dẫn Gỡ lỗi:** [Gỡ lỗi từng bước](docs/chapter-07-troubleshooting/debugging.md)
- **Nhận trợ giúp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Hoàn thành Khóa học & Chứng nhận

### Theo dõi Tiến độ
Theo dõi tiến trình học qua từng chương:

- [ ] **Chương 1**: Nền tảng & Bắt đầu nhanh ✅
- [ ] **Chương 2**: Phát triển Ưu tiên AI ✅  
- [ ] **Chương 3**: Cấu hình & Xác thực ✅
- [ ] **Chương 4**: Hạ tầng dưới dạng mã & Triển khai ✅
- [ ] **Chương 5**: Giải pháp AI đa-tác nhân ✅
- [ ] **Chương 6**: Xác thực & Lập kế hoạch trước Triển khai ✅
- [ ] **Chương 7**: Khắc phục Sự cố & Gỡ lỗi ✅
- [ ] **Chương 8**: Mô hình Sản xuất & Doanh nghiệp ✅

### Xác minh Học tập
Sau khi hoàn thành mỗi chương, xác minh kiến thức của bạn bằng:
1. **Bài tập Thực hành**: Hoàn thành việc triển khai thực hành của chương
2. **Kiểm tra Kiến thức**: Xem lại phần Câu hỏi thường gặp cho chương của bạn
3. **Thảo luận Cộng đồng**: Chia sẻ kinh nghiệm của bạn trong Azure Discord
4. **Chương tiếp theo**: Chuyển sang mức độ phức tạp tiếp theo

### Lợi ích khi Hoàn thành Khóa học
Khi hoàn thành tất cả các chương, bạn sẽ có:
- **Kinh nghiệm Sản xuất**: Đã triển khai ứng dụng AI thực tế lên Azure
- **Kỹ năng Chuyên nghiệp**: Khả năng triển khai sẵn sàng cho doanh nghiệp  
- **Sự công nhận từ Cộng đồng**: Thành viên tích cực của cộng đồng nhà phát triển Azure
- **Thăng tiến Nghề nghiệp**: Chuyên môn triển khai AZD và AI đang được săn đón

---

## 🤝 Cộng đồng & Hỗ trợ

### Nhận Trợ giúp & Hỗ trợ
- **Sự cố Kỹ thuật**: [Báo lỗi và yêu cầu tính năng](https://github.com/microsoft/azd-for-beginners/issues)
- **Câu hỏi Học tập**: [Cộng đồng Microsoft Azure Discord](https://discord.gg/microsoft-azure) và [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Trợ giúp chuyên cho AI**: Tham gia [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tài liệu**: [Tài liệu chính thức Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Những thông tin từ cộng đồng Microsoft Foundry Discord

**Kết quả Khảo sát Gần đây từ kênh #Azure:**
- **45%** nhà phát triển muốn sử dụng AZD cho khối lượng công việc AI
- **Những thách thức hàng đầu**: Triển khai đa dịch vụ, quản lý thông tin xác thực, sẵn sàng cho sản xuất  
- **Yêu cầu nhiều nhất**: Mẫu dành cho AI, hướng dẫn khắc phục sự cố, các thực hành tốt nhất

**Tham gia cộng đồng của chúng tôi để:**
- Chia sẻ kinh nghiệm AZD + AI và nhận trợ giúp
- Truy cập bản xem trước sớm các mẫu AI mới
- Đóng góp vào các thực hành tốt nhất cho triển khai AI
- Ảnh hưởng đến phát triển tính năng AI + AZD trong tương lai

### Đóng góp cho Khóa học
Chúng tôi hoan nghênh các đóng góp! Vui lòng đọc [Hướng dẫn Đóng góp](CONTRIBUTING.md) để biết chi tiết về:
- **Cải thiện Nội dung**: Nâng cao các chương và ví dụ hiện có
- **Ví dụ Mới**: Thêm các kịch bản và mẫu từ thực tế  
- **Dịch thuật**: Giúp duy trì hỗ trợ đa ngôn ngữ
- **Báo cáo Lỗi**: Cải thiện độ chính xác và rõ ràng
- **Tiêu chuẩn Cộng đồng**: Tuân theo các nguyên tắc cộng đồng bao gồm của chúng tôi

---

## 📄 Thông tin Khóa học

### Giấy phép
Dự án này được cấp phép theo Giấy phép MIT - xem tệp [LICENSE](../../LICENSE) để biết chi tiết.

### Các Tài nguyên Học tập Liên quan của Microsoft

Nhóm của chúng tôi sản xuất các khóa học học tập toàn diện khác:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j cho Người Mới Bắt Đầu](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js cho Người Mới Bắt Đầu](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain cho Người Mới Bắt Đầu](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Tác nhân
[![AZD cho Người Mới Bắt Đầu](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI cho Người Mới Bắt Đầu](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP cho Người Mới Bắt Đầu](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents cho Người Mới Bắt Đầu](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![AI Tạo sinh cho Người Mới Bắt Đầu](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Tạo sinh (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Tạo sinh (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI Tạo sinh (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Học Cơ bản
[![ML cho Người Mới Bắt Đầu](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Khoa học Dữ liệu cho Người Mới Bắt Đầu](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI cho Người Mới Bắt Đầu](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![An ninh mạng cho Người Mới Bắt Đầu](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Phát triển Web cho Người Mới Bắt Đầu](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT cho Người Mới Bắt Đầu](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Phát triển XR cho Người Mới Bắt Đầu](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Series Copilot
[![Copilot cho Lập trình Hợp tác cùng AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot cho C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Phiêu lưu Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Điều hướng Khóa học

**🚀 Sẵn sàng bắt đầu học?**

**Người mới bắt đầu**: Bắt đầu với [Chương 1: Nền tảng & Bắt đầu Nhanh](#-chapter-1-foundation--quick-start)  
**Nhà phát triển AI**: Chuyển tới [Chương 2: Phát triển Ưu tiên AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Nhà phát triển có kinh nghiệm**: Bắt đầu với [Chương 3: Cấu hình & Xác thực](#️-chapter-3-configuration--authentication)

**Bước tiếp theo**: [Bắt đầu Chương 1 - Kiến thức cơ bản AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->