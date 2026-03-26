# AZD For Beginners: A Structured Learning Journey

![AZD dành cho người mới](../../translated_images/vi/azdbeginners.5527441dd9f74068.webp) 

[![Người theo dõi GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks trên GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Stars trên GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Bản dịch tự động (Luôn được cập nhật)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Tiếng Ả Rập](../ar/README.md) | [Tiếng Bengal](../bn/README.md) | [Tiếng Bulgaria](../bg/README.md) | [Miến Điện (Myanmar)](../my/README.md) | [Tiếng Trung (Giản thể)](../zh-CN/README.md) | [Tiếng Trung (Phồn thể, Hồng Kông)](../zh-HK/README.md) | [Tiếng Trung (Phồn thể, Ma Cao)](../zh-MO/README.md) | [Tiếng Trung (Phồn thể, Đài Loan)](../zh-TW/README.md) | [Tiếng Croatia](../hr/README.md) | [Tiếng Séc](../cs/README.md) | [Tiếng Đan Mạch](../da/README.md) | [Tiếng Hà Lan](../nl/README.md) | [Tiếng Estonia](../et/README.md) | [Tiếng Phần Lan](../fi/README.md) | [Tiếng Pháp](../fr/README.md) | [Tiếng Đức](../de/README.md) | [Tiếng Hy Lạp](../el/README.md) | [Tiếng Do Thái](../he/README.md) | [Tiếng Hindi](../hi/README.md) | [Tiếng Hungary](../hu/README.md) | [Tiếng Indonesia](../id/README.md) | [Tiếng Ý](../it/README.md) | [Tiếng Nhật](../ja/README.md) | [Tiếng Kannada](../kn/README.md) | [Tiếng Hàn](../ko/README.md) | [Tiếng Litva](../lt/README.md) | [Tiếng Mã Lai](../ms/README.md) | [Tiếng Malayalam](../ml/README.md) | [Tiếng Marathi](../mr/README.md) | [Tiếng Nepal](../ne/README.md) | [Tiếng Pidgin Nigeria](../pcm/README.md) | [Tiếng Na Uy](../no/README.md) | [Tiếng Ba Tư (Farsi)](../fa/README.md) | [Tiếng Ba Lan](../pl/README.md) | [Tiếng Bồ Đào Nha (Brazil)](../pt-BR/README.md) | [Tiếng Bồ Đào Nha (Portugal)](../pt-PT/README.md) | [Tiếng Punjabi (Gurmukhi)](../pa/README.md) | [Tiếng Romania](../ro/README.md) | [Tiếng Nga](../ru/README.md) | [Tiếng Serbia (Chữ Cyrillic)](../sr/README.md) | [Tiếng Slovak](../sk/README.md) | [Tiếng Slovenia](../sl/README.md) | [Tiếng Tây Ban Nha](../es/README.md) | [Tiếng Swahili](../sw/README.md) | [Tiếng Thụy Điển](../sv/README.md) | [Tiếng Tagalog (Filipino)](../tl/README.md) | [Tiếng Tamil](../ta/README.md) | [Tiếng Telugu](../te/README.md) | [Tiếng Thái](../th/README.md) | [Tiếng Thổ Nhĩ Kỳ](../tr/README.md) | [Tiếng Ukraina](../uk/README.md) | [Tiếng Urdu](../ur/README.md) | [Tiếng Việt](./README.md)

> **Ưu tiên sao chép cục bộ?**
>
> Kho lưu trữ này bao gồm hơn 50 bản dịch ngôn ngữ, điều này làm tăng đáng kể kích thước tải xuống. Để clone mà không có các bản dịch, sử dụng sparse checkout:
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
> Điều này cung cấp cho bạn mọi thứ cần thiết để hoàn thành khóa học với tốc độ tải xuống nhanh hơn nhiều.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Có gì mới trong azd hôm nay

Azure Developer CLI đã phát triển vượt ra ngoài các ứng dụng web và API truyền thống. Ngày nay, azd là công cụ duy nhất để triển khai bất kỳ ứng dụng nào lên Azure — bao gồm cả các ứng dụng có AI và các agent thông minh.

Điều này có nghĩa gì cho bạn:

- **Các agent AI hiện là workloads azd hạng nhất.** Bạn có thể khởi tạo, triển khai và quản lý các dự án agent AI bằng cùng quy trình `azd init` → `azd up` mà bạn đã biết.
- **Tích hợp Microsoft Foundry** đưa việc triển khai mô hình, hosting agent và cấu hình dịch vụ AI trực tiếp vào hệ sinh thái template của azd.
- **Quy trình chính không thay đổi.** Cho dù bạn đang triển khai một ứng dụng todo, một microservice hay một giải pháp AI đa-agent, các lệnh vẫn giống nhau.

Nếu bạn đã từng dùng azd trước đây, hỗ trợ AI là phần mở rộng tự nhiên — không phải là một công cụ riêng biệt hay một nhánh nâng cao. Nếu bạn bắt đầu mới, bạn sẽ học một quy trình duy nhất phù hợp cho mọi thứ.

---

## 🚀 Azure Developer CLI (azd) là gì?

**Azure Developer CLI (azd)** là một công cụ dòng lệnh thân thiện với nhà phát triển giúp đơn giản hóa việc triển khai ứng dụng lên Azure. Thay vì tạo và kết nối hàng chục tài nguyên Azure thủ công, bạn có thể triển khai toàn bộ ứng dụng chỉ với một lệnh.

### Sức mạnh của `azd up`

```bash
# Lệnh duy nhất này làm mọi thứ:
# ✅ Tạo tất cả tài nguyên Azure
# ✅ Cấu hình mạng và bảo mật
# ✅ Xây dựng mã ứng dụng của bạn
# ✅ Triển khai lên Azure
# ✅ Cung cấp cho bạn một URL hoạt động
azd up
```

**Chỉ vậy thôi!** Không cần click trên Azure Portal, không cần học các template ARM phức tạp trước, không cần cấu hình thủ công - chỉ là các ứng dụng hoạt động trên Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Khác nhau thế nào?

Đây là câu hỏi phổ biến nhất mà người mới thường hỏi. Đây là câu trả lời đơn giản:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Quản lý các tài nguyên Azure riêng lẻ | Triển khai ứng dụng hoàn chỉnh |
| **Mindset** | Tập trung vào hạ tầng | Tập trung vào ứng dụng |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Cần biết về dịch vụ Azure | Chỉ cần biết về ứng dụng của bạn |
| **Best For** | DevOps, Hạ tầng | Nhà phát triển, Prototyping |

### Tương tự đơn giản

- **Azure CLI** giống như có tất cả công cụ để xây nhà - búa, cưa, đinh. Bạn có thể xây bất cứ thứ gì, nhưng bạn cần biết xây dựng.
- **Azure Developer CLI** giống như thuê một nhà thầu - bạn mô tả những gì bạn muốn, và họ lo phần xây dựng.

### Khi nào dùng từng công cụ

| Scenario | Use This |
|----------|----------|
| "Tôi muốn triển khai web app nhanh" | `azd up` |
| "Tôi cần tạo chỉ một storage account" | `az storage account create` |
| "Tôi đang xây dựng một ứng dụng AI toàn diện" | `azd init --template azure-search-openai-demo` |
| "Tôi cần gỡ lỗi một tài nguyên Azure cụ thể" | `az resource show` |
| "Tôi muốn triển khai sẵn sàng cho production trong vài phút" | `azd up --environment production` |

### Chúng hoạt động cùng nhau!

AZD sử dụng Azure CLI ở tầng dưới. Bạn có thể dùng cả hai:
```bash
# Triển khai ứng dụng của bạn bằng AZD
azd up

# Sau đó điều chỉnh các tài nguyên cụ thể bằng Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Tìm template trong Awesome AZD

Đừng bắt đầu từ đầu! **Awesome AZD** là bộ sưu tập cộng đồng gồm các template sẵn sàng triển khai:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Duyệt hơn 200 template với một cú nhấp để triển khai |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Góp phần template của bạn cho cộng đồng |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Star và khám phá mã nguồn |

### Các mẫu AI phổ biến từ Awesome AZD

```bash
# Trò chuyện RAG với các Mô hình Microsoft Foundry + Tìm kiếm AI
azd init --template azure-search-openai-demo

# Ứng dụng Trò chuyện AI Nhanh
azd init --template openai-chat-app-quickstart

# Các Tác nhân AI với Tác nhân Foundry
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

### Bước 3: Triển khai Ứng dụng đầu tiên của bạn

```bash
# Khởi tạo từ một mẫu
azd init --template todo-nodejs-mongo

# Triển khai lên Azure (tạo mọi thứ!)
azd up
```

**🎉 Xong rồi!** Ứng dụng của bạn giờ đã hoạt động trên Azure.

### Dọn dẹp (Đừng quên!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Cách sử dụng khóa học này

Khóa học này được thiết kế cho việc học theo lộ trình - bắt đầu từ nơi bạn cảm thấy thoải mái và tiến dần lên:

| Your Experience | Start Here |
|-----------------|------------|
| **Hoàn toàn mới với Azure** | [Chương 1: Nền tảng](#-chapter-1-foundation--quick-start) |
| **Biết Azure, mới với AZD** | [Chương 1: Nền tảng](#-chapter-1-foundation--quick-start) |
| **Muốn triển khai ứng dụng AI** | [Chương 2: Phát triển ưu tiên AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Muốn thực hành trực tiếp** | [🎓 Workshop tương tác](workshop/README.md) - lab hướng dẫn 3-4 giờ |
| **Cần các mẫu cho production** | [Chương 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Thiết lập nhanh

1. **Fork kho lưu trữ này**: [![Forks trên GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone nó**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Nhận trợ giúp**: [Cộng đồng Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Ưu tiên sao chép cục bộ?**

> Kho lưu trữ này bao gồm hơn 50 bản dịch ngôn ngữ, điều này làm tăng đáng kể kích thước tải xuống. Để clone mà không có các bản dịch, sử dụng sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Điều này cung cấp cho bạn mọi thứ cần thiết để hoàn thành khóa học với tốc độ tải xuống nhanh hơn nhiều.


## Tổng quan khóa học

Làm chủ Azure Developer CLI (azd) thông qua các chương được thiết kế để học dần. **Tập trung đặc biệt vào triển khai ứng dụng AI với tích hợp Microsoft Foundry.**

### Tại sao khóa học này quan trọng với nhà phát triển hiện đại

Dựa trên những hiểu biết từ cộng đồng Microsoft Foundry Discord, **45% nhà phát triển muốn sử dụng AZD cho workloads AI** nhưng gặp các thách thức về:
- Kiến trúc AI nhiều dịch vụ phức tạp
- Các thực hành tốt nhất cho triển khai AI production  
- Tích hợp và cấu hình dịch vụ AI Azure
- Tối ưu chi phí cho workloads AI
- Khắc phục sự cố triển khai liên quan đến AI

### Mục tiêu học tập

Khi hoàn thành khóa học có cấu trúc này, bạn sẽ:
- **Thành thạo các khái niệm cơ bản về AZD**: Khái niệm lõi, cài đặt và cấu hình
- **Triển khai ứng dụng AI**: Sử dụng AZD với dịch vụ Microsoft Foundry
- **Thực hiện Hạ tầng như Mã (IaC)**: Quản lý tài nguyên Azure bằng template Bicep
- **Khắc phục sự cố triển khai**: Giải quyết các vấn đề phổ biến và gỡ lỗi
- **Tối ưu cho production**: Bảo mật, scale, giám sát và quản lý chi phí
- **Xây dựng giải pháp Multi-Agent**: Triển khai các kiến trúc AI phức tạp

## 🗺️ Bản đồ khóa học: Điều hướng nhanh theo chương

Mỗi chương có một README riêng với mục tiêu học tập, khởi động nhanh và bài tập:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Nền tảng](docs/chapter-01-foundation/README.md)** | Bắt đầu | [Cơ bản về AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Cài đặt](docs/chapter-01-foundation/installation.md) &#124; [Dự án đầu tiên](docs/chapter-01-foundation/first-project.md) | 30-45 phút | ⭐ |
| **[Chương 2: Phát triển AI](docs/chapter-02-ai-development/README.md)** | Ứng dụng Ưu Tiên AI | [Tích hợp Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Tác nhân AI](docs/chapter-02-ai-development/agents.md) &#124; [Triển khai Mô hình](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Thực hành](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 giờ | ⭐⭐ |
| **[Chương 3: Cấu hình](docs/chapter-03-configuration/README.md)** | Xác thực & Bảo mật | [Cấu hình](docs/chapter-03-configuration/configuration.md) &#124; [Xác thực & Bảo mật](docs/chapter-03-configuration/authsecurity.md) | 45-60 phút | ⭐⭐ |
| **[Chương 4: Hạ tầng](docs/chapter-04-infrastructure/README.md)** | IaC & Triển khai | [Hướng dẫn Triển khai](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Cung cấp tài nguyên](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 giờ | ⭐⭐⭐ |
| **[Chương 5: Đa tác nhân](docs/chapter-05-multi-agent/README.md)** | Giải pháp Tác nhân AI | [Kịch bản Bán lẻ](examples/retail-scenario.md) &#124; [Mẫu Điều phối](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 giờ | ⭐⭐⭐⭐ |
| **[Chương 6: Tiền Triển khai](docs/chapter-06-pre-deployment/README.md)** | Lập kế hoạch & Xác thực | [Kiểm tra tiền triển khai](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Lập kế hoạch công suất](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Chọn SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 giờ | ⭐⭐ |
| **[Chương 7: Khắc phục sự cố](docs/chapter-07-troubleshooting/README.md)** | Gỡ lỗi & Sửa | [Vấn đề Thường gặp](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Gỡ lỗi](docs/chapter-07-troubleshooting/debugging.md) &#124; [Vấn đề AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 giờ | ⭐⭐ |
| **[Chương 8: Sản xuất](docs/chapter-08-production/README.md)** | Mô hình Doanh nghiệp | [Thực hành Sản xuất](docs/chapter-08-production/production-ai-practices.md) | 2-3 giờ | ⭐⭐⭐⭐ |
| **[🎓 Hội thảo](workshop/README.md)** | Phòng thí nghiệm Thực hành | [Giới thiệu](workshop/docs/instructions/0-Introduction.md) &#124; [Lựa chọn](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Xác thực](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Phân tích](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Cấu hình](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tùy chỉnh](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Dọn dẹp](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Tổng kết](workshop/docs/instructions/7-Wrap-up.md) | 3-4 giờ | ⭐⭐ |

**Tổng thời lượng khóa học:** ~10-14 giờ | **Lộ trình kỹ năng:** Người mới → Sẵn sàng sản xuất

---

## 📚 Các chương học

*Chọn lộ trình học dựa trên mức độ kinh nghiệm và mục tiêu*

### 🚀 Chương 1: Nền tảng & Bắt đầu Nhanh
**Yêu cầu trước**: Đăng ký Azure, kiến thức cơ bản về dòng lệnh  
**Thời lượng**: 30-45 phút  
**Mức độ**: ⭐

#### Những gì bạn sẽ học
- Hiểu các nguyên tắc cơ bản của Azure Developer CLI
- Cài đặt AZD trên nền tảng của bạn
- Triển khai thành công đầu tiên của bạn

#### Tài nguyên học
- **🎯 Bắt đầu tại đây**: [Azure Developer CLI là gì?](#what-is-azure-developer-cli)
- **📖 Lý thuyết**: [AZD Cơ bản](docs/chapter-01-foundation/azd-basics.md) - Khái niệm cốt lõi và thuật ngữ
- **⚙️ Cài đặt**: [Cài đặt & Thiết lập](docs/chapter-01-foundation/installation.md) - Hướng dẫn theo nền tảng
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

**💡 Kết quả chương**: Triển khai thành công một ứng dụng web đơn giản lên Azure bằng AZD

**✅ Xác nhận thành công:**
```bash
# Sau khi hoàn thành Chương 1, bạn sẽ có thể:
azd version              # Hiển thị phiên bản đã cài đặt
azd init --template todo-nodejs-mongo  # Khởi tạo dự án
azd up                  # Triển khai lên Azure
azd show                # Hiển thị URL ứng dụng đang chạy
# Ứng dụng mở trong trình duyệt và hoạt động
azd down --force --purge  # Dọn dẹp tài nguyên
```

**📊 Thời gian đầu tư:** 30-45 phút  
**📈 Mức kỹ năng sau khi hoàn thành:** Có thể triển khai các ứng dụng cơ bản một cách độc lập
**📈 Mức kỹ năng sau khi hoàn thành:** Có thể triển khai các ứng dụng cơ bản một cách độc lập

---

### 🤖 Chương 2: Phát triển Ưu tiên AI (Khuyến nghị cho Nhà phát triển AI)
**Yêu cầu trước**: Hoàn thành Chương 1  
**Thời lượng**: 1-2 giờ  
**Mức độ**: ⭐⭐

#### Những gì bạn sẽ học
- Tích hợp Microsoft Foundry với AZD
- Triển khai các ứng dụng sử dụng AI
- Hiểu cấu hình các dịch vụ AI

#### Tài nguyên học
- **🎯 Bắt đầu tại đây**: [Tích hợp Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Tác nhân AI**: [Hướng dẫn Tác nhân AI](docs/chapter-02-ai-development/agents.md) - Triển khai các tác nhân thông minh với AZD
- **📖 Mẫu**: [Triển khai Mô hình AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Triển khai và quản lý mô hình AI
- **🛠️ Thực hành**: [Phòng thí nghiệm AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Chuẩn bị giải pháp AI sẵn sàng với AZD
- **🎥 Hướng dẫn tương tác**: [Tài liệu Workshop](workshop/README.md) - Học trên trình duyệt với MkDocs * DevContainer Environment
- **📋 Mẫu**: [Mẫu Microsoft Foundry](#tài-nguyên-hội-thảo)
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

**💡 Kết quả chương**: Triển khai và cấu hình ứng dụng chat sử dụng AI với khả năng RAG

**✅ Xác nhận thành công:**
```bash
# Sau Chương 2, bạn sẽ có thể:
azd init --template azure-search-openai-demo
azd up
# Kiểm tra giao diện chat AI
# Đặt câu hỏi và nhận phản hồi do AI cung cấp kèm nguồn
# Xác minh tích hợp tìm kiếm hoạt động
azd monitor  # Kiểm tra Application Insights hiển thị dữ liệu giám sát
azd down --force --purge
```

**📊 Thời gian đầu tư:** 1-2 giờ  
**📈 Mức kỹ năng sau khi hoàn thành:** Có thể triển khai và cấu hình các ứng dụng AI sẵn sàng cho sản xuất  
**💰 Nhận thức về chi phí:** Hiểu chi phí phát triển ~$80-150/tháng, chi phí sản xuất ~$300-3500/tháng

#### 💰 Cân nhắc chi phí cho triển khai AI

**Môi trường Phát triển (Ước tính $80-150/tháng):**
- Microsoft Foundry Models (Trả theo mức sử dụng): $0-50/tháng (dựa trên lượng token)
- AI Search (mức Basic): $75/tháng
- Container Apps (Consumption): $0-20/tháng
- Lưu trữ (Standard): $1-5/tháng

**Môi trường Sản xuất (Ước tính $300-3,500+/tháng):**
- Microsoft Foundry Models (PTU cho hiệu năng ổn định): $3,000+/tháng OR Trả theo mức sử dụng với khối lượng lớn
- AI Search (mức Standard): $250/tháng
- Container Apps (Dedicated): $50-100/tháng
- Application Insights: $5-50/tháng
- Lưu trữ (Premium): $10-50/tháng

**💡 Mẹo tối ưu chi phí:**
- Sử dụng **Free Tier** Microsoft Foundry Models để học (Azure OpenAI 50,000 tokens/tháng included)
- Chạy `azd down` để giải phóng tài nguyên khi không phát triển
- Bắt đầu với thanh toán theo mức tiêu thụ, chỉ nâng cấp lên PTU cho môi trường sản xuất
- Dùng `azd provision --preview` để ước tính chi phí trước khi triển khai
- Bật tự động mở rộng: chỉ trả cho mức sử dụng thực tế

**Giám sát chi phí:**
```bash
# Kiểm tra chi phí ước tính hàng tháng
azd provision --preview

# Theo dõi chi phí thực tế trong Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chương 3: Cấu hình & Xác thực
**Yêu cầu trước**: Hoàn thành Chương 1  
**Thời lượng**: 45-60 phút  
**Mức độ**: ⭐⭐

#### Những gì bạn sẽ học
- Cấu hình và quản lý môi trường
- Các thực hành tốt nhất về xác thực và bảo mật
- Đặt tên và tổ chức tài nguyên

#### Tài nguyên học
- **📖 Cấu hình**: [Hướng dẫn Cấu hình](docs/chapter-03-configuration/configuration.md) - Thiết lập môi trường
- **🔐 Bảo mật**: [Mẫu xác thực và managed identity](docs/chapter-03-configuration/authsecurity.md) - Các mẫu xác thực
- **📝 Ví dụ**: [Ví dụ Ứng dụng Database](examples/database-app/README.md) - Ví dụ Database AZD

#### Bài tập thực hành
- Cấu hình nhiều môi trường (dev, staging, prod)
- Thiết lập xác thực managed identity
- Triển khai cấu hình riêng cho từng môi trường

**💡 Kết quả chương**: Quản lý nhiều môi trường với xác thực và bảo mật đúng cách

---

### 🏗️ Chương 4: Hạ tầng như Mã & Triển khai
**Yêu cầu trước**: Hoàn thành Chương 1-3  
**Thời lượng**: 1-1.5 giờ  
**Mức độ**: ⭐⭐⭐

#### Những gì bạn sẽ học
- Các mẫu triển khai nâng cao
- Hạ tầng như mã với Bicep
- Chiến lược cấp phát tài nguyên

#### Tài nguyên học
- **📖 Triển khai**: [Hướng dẫn Triển khai](docs/chapter-04-infrastructure/deployment-guide.md) - Quy trình hoàn chỉnh
- **🏗️ Cấp phát**: [Cung cấp tài nguyên](docs/chapter-04-infrastructure/provisioning.md) - Quản lý tài nguyên Azure
- **📝 Ví dụ**: [Ví dụ Container App](../../examples/container-app) - Triển khai container hóa

#### Bài tập thực hành
- Tạo các mẫu Bicep tùy chỉnh
- Triển khai ứng dụng nhiều dịch vụ
- Triển khai chiến lược blue-green

**💡 Kết quả chương**: Triển khai các ứng dụng phức tạp nhiều dịch vụ bằng các mẫu hạ tầng tùy chỉnh

---

### 🎯 Chương 5: Giải pháp AI Đa tác nhân (Nâng cao)
**Yêu cầu trước**: Hoàn thành Chương 1-2  
**Thời lượng**: 2-3 giờ  
**Mức độ**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Các mẫu kiến trúc đa tác nhân
- Orchestration và điều phối tác nhân
- Triển khai AI sẵn sàng cho sản xuất

#### Tài nguyên học
- **🤖 Dự án tiêu biểu**: [Giải pháp Đa-tác nhân Bán lẻ](examples/retail-scenario.md) - Triển khai hoàn chỉnh
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Triển khai một lần nhấp
- **📖 Kiến trúc**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Các mẫu

#### Bài tập thực hành
```bash
# Triển khai giải pháp đa tác nhân bán lẻ hoàn chỉnh
cd examples/retail-multiagent-arm-template
./deploy.sh

# Khám phá cấu hình tác nhân
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kết quả chương**: Triển khai và quản lý giải pháp AI đa-tác nhân sẵn sàng cho sản xuất với các tác nhân Khách hàng và Hàng tồn kho

---

### 🔍 Chương 6: Xác thực & Lập kế hoạch trước Triển khai
**Yêu cầu trước**: Hoàn thành Chương 4  
**Thời lượng**: 1 giờ  
**Mức độ**: ⭐⭐

#### Những gì bạn sẽ học
- Lập kế hoạch công suất và xác thực tài nguyên
- Chiến lược chọn SKU
- Kiểm tra tiền triển khai và tự động hóa

#### Tài nguyên học
- **📊 Lập kế hoạch**: [Lập kế hoạch công suất](docs/chapter-06-pre-deployment/capacity-planning.md) - Xác thực tài nguyên
- **💰 Lựa chọn**: [Chọn SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Lựa chọn tối ưu chi phí
- **✅ Xác thực**: [Kiểm tra tiền triển khai](docs/chapter-06-pre-deployment/preflight-checks.md) - Script tự động

#### Bài tập thực hành
- Chạy script xác thực công suất
- Tối ưu lựa chọn SKU theo chi phí
- Triển khai kiểm tra tiền triển khai tự động

**💡 Kết quả chương**: Xác thực và tối ưu triển khai trước khi thực hiện

---

### 🚨 Chương 7: Khắc phục sự cố & Gỡ lỗi
**Yêu cầu trước**: Hoàn thành bất kỳ chương triển khai nào  
**Thời lượng**: 1-1.5 giờ  
**Mức độ**: ⭐⭐

#### Những gì bạn sẽ học
- Các phương pháp gỡ lỗi có hệ thống
- Các vấn đề thường gặp và giải pháp
- Khắc phục sự cố riêng cho AI

#### Tài nguyên học
- **🔧 Vấn đề thường gặp**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ và giải pháp
- **🕵️ Gỡ lỗi**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Chiến lược từng bước
- **🤖 Vấn đề AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Sự cố dịch vụ AI

#### Bài tập thực hành
- Chẩn đoán lỗi triển khai
- Giải quyết các vấn đề xác thực
- Gỡ lỗi kết nối dịch vụ AI

**💡 Kết quả chương**: Tự mình chẩn đoán và giải quyết các vấn đề triển khai thường gặp

---

### 🏢 Chương 8: Sản xuất & Mô hình Doanh nghiệp
**Yêu cầu trước**: Hoàn thành Chương 1-4  
**Thời lượng**: 2-3 giờ  
**Mức độ**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Chiến lược triển khai sản xuất
- Mẫu bảo mật doanh nghiệp
- Giám sát và tối ưu chi phí

#### Tài nguyên học
- **🏭 Sản xuất**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Các mẫu doanh nghiệp
- **📝 Ví dụ**: [Microservices Example](../../examples/microservices) - Kiến trúc phức tạp
- **📊 Giám sát**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Giám sát

#### Bài tập Thực hành
- Triển khai các mẫu bảo mật cho doanh nghiệp
- Thiết lập giám sát toàn diện
- Triển khai lên môi trường sản xuất với quản trị phù hợp

**💡 Kết quả chương**: Triển khai ứng dụng sẵn sàng cho doanh nghiệp với đầy đủ khả năng sản xuất

---

## 🎓 Tổng quan Hội thảo: Trải nghiệm Học tập Thực hành

> **⚠️ TRẠNG THÁI HỘI THẢO: Đang phát triển**  
> Tài liệu hội thảo hiện đang được phát triển và hoàn thiện. Các mô-đun cốt lõi đang hoạt động, nhưng một số phần nâng cao chưa hoàn thiện. Chúng tôi đang tích cực hoàn thành toàn bộ nội dung. [Track progress →](workshop/README.md)

### Tài liệu Hội thảo Tương tác
**Học thực hành toàn diện với công cụ trên trình duyệt và bài tập có hướng dẫn**

Tài liệu hội thảo cung cấp trải nghiệm học tập có cấu trúc và tương tác, bổ trợ cho chương trình học theo chương ở trên. Hội thảo được thiết kế cho cả tự học theo nhịp độ riêng và các buổi có người hướng dẫn.

#### 🛠️ Các tính năng Hội thảo
- **Giao diện trên trình duyệt**: Hội thảo đầy đủ chạy trên MkDocs với tính năng tìm kiếm, sao chép, và các theme
- **Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển với một lần nhấp
- **Lộ trình học có cấu trúc**: 8 mô-đun bài tập có hướng dẫn (tổng 3-4 giờ)
- **Phương pháp tiến trình**: Giới thiệu → Lựa chọn → Xác nhận → Phân tích cấu trúc → Cấu hình → Tùy chỉnh → Dọn dẹp → Tổng kết
- **Môi trường DevContainer tương tác**: Công cụ và phụ thuộc đã cấu hình sẵn

#### 📚 Cấu trúc Mô-đun Hội thảo
Hội thảo theo **phương pháp tiến trình 8 mô-đun** đưa bạn từ khám phá đến thành thạo triển khai:

| Mô-đun | Chủ đề | Bạn sẽ làm gì | Thời lượng |
|--------|-------|----------------|----------|
| **0. Giới thiệu** | Tổng quan hội thảo | Hiểu mục tiêu học tập, yêu cầu tiên quyết, và cấu trúc hội thảo | 15 phút |
| **1. Lựa chọn** | Khám phá mẫu | Khám phá các mẫu AZD và chọn mẫu AI phù hợp cho kịch bản của bạn | 20 phút |
| **2. Xác nhận** | Triển khai & Xác minh | Triển khai mẫu với `azd up` và xác minh hạ tầng hoạt động | 30 phút |
| **3. Phân tích cấu trúc** | Hiểu cấu trúc | Sử dụng GitHub Copilot để khám phá kiến trúc mẫu, file Bicep, và tổ chức mã | 30 phút |
| **4. Cấu hình** | Đi sâu azure.yaml | Làm chủ cấu hình `azure.yaml`, hooks vòng đời, và biến môi trường | 30 phút |
| **5. Tùy chỉnh** | Cá nhân hoá | Kích hoạt AI Search, theo dõi (tracing), đánh giá, và tuỳ chỉnh cho kịch bản của bạn | 45 phút |
| **6. Dọn dẹp** | Dọn dẹp | Xóa tài nguyên an toàn với `azd down --purge` | 15 phút |
| **7. Tổng kết** | Bước tiếp theo | Xem lại thành tựu, khái niệm chính, và tiếp tục hành trình học của bạn | 15 phút |

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
# Tùy chọn 1: GitHub Codespaces (Được khuyến nghị)
# Nhấp vào "Code" → "Create codespace on main" trong kho lưu trữ

# Tùy chọn 2: Phát triển cục bộ
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Làm theo hướng dẫn cài đặt trong workshop/README.md
```

#### 🎯 Kết quả học tập của Hội thảo
Bằng cách hoàn thành hội thảo, người tham gia sẽ:
- **Triển khai Ứng dụng AI cho môi trường sản xuất**: Sử dụng AZD với dịch vụ Microsoft Foundry
- **Làm chủ Kiến trúc đa tác nhân**: Triển khai giải pháp các tác nhân AI phối hợp
- **Áp dụng Thực hành bảo mật tốt nhất**: Cấu hình xác thực và kiểm soát truy cập
- **Tối ưu cho khả năng mở rộng**: Thiết kế triển khai chi phí-hiệu quả, hiệu năng cao
- **Xử lý sự cố triển khai**: Giải quyết các vấn đề phổ biến một cách độc lập

#### 📖 Tài nguyên Hội thảo
- **🎥 Hướng dẫn tương tác**: [Workshop Materials](workshop/README.md) - Môi trường học tập trên trình duyệt
- **📋 Hướng dẫn từng mô-đun**:
  - [0. Giới thiệu](workshop/docs/instructions/0-Introduction.md) - Tổng quan hội thảo và mục tiêu
  - [1. Lựa chọn](workshop/docs/instructions/1-Select-AI-Template.md) - Tìm và chọn mẫu AI
  - [2. Xác nhận](workshop/docs/instructions/2-Validate-AI-Template.md) - Triển khai và xác minh mẫu
  - [3. Phân tích cấu trúc](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Khám phá kiến trúc mẫu
  - [4. Cấu hình](workshop/docs/instructions/4-Configure-AI-Template.md) - Làm chủ azure.yaml
  - [5. Tùy chỉnh](workshop/docs/instructions/5-Customize-AI-Template.md) - Tùy chỉnh cho kịch bản của bạn
  - [6. Dọn dẹp](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Dọn dẹp tài nguyên
  - [7. Tổng kết](workshop/docs/instructions/7-Wrap-up.md) - Xem lại và các bước tiếp theo
- **🛠️ Phòng thí nghiệm Hội thảo AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Bài tập tập trung vào AI
- **💡 Bắt đầu nhanh**: [Workshop Setup Guide](workshop/README.md#quick-start) - Cấu hình môi trường

**Phù hợp cho**: Đào tạo doanh nghiệp, khoá học đại học, tự học theo nhịp độ riêng, và bootcamp cho nhà phát triển.

---

## 📖 Đi sâu: Khả năng của AZD

Ngoài những điều cơ bản, AZD cung cấp các tính năng mạnh mẽ cho triển khai sản xuất:

- **Triển khai dựa trên mẫu** - Sử dụng các mẫu dựng sẵn cho các mẫu ứng dụng phổ biến
- **Cơ sở hạ tầng dưới dạng mã** - Quản lý tài nguyên Azure bằng Bicep hoặc Terraform  
- **Luồng công việc tích hợp** - Cung cấp, triển khai, và giám sát ứng dụng một cách liền mạch
- **Thân thiện với nhà phát triển** - Tối ưu cho năng suất và trải nghiệm của nhà phát triển

### **AZD + Microsoft Foundry: Hoàn hảo cho Triển khai AI**

**Tại sao AZD cho Giải pháp AI?** AZD giải quyết các thách thức hàng đầu mà nhà phát triển AI gặp phải:

- **Mẫu sẵn sàng cho AI** - Mẫu đã cấu hình sẵn cho các Mô hình Microsoft Foundry, Cognitive Services, và khối lượng công việc ML
- **Triển khai AI an toàn** - Các mẫu bảo mật tích hợp sẵn cho dịch vụ AI, khóa API, và các endpoint mô hình  
- **Các mẫu AI cho môi trường sản xuất** - Thực hành tốt nhất cho triển khai ứng dụng AI có khả năng mở rộng và tối ưu chi phí
- **Luồng công việc AI đầu-cuối** - Từ phát triển mô hình đến triển khai sản xuất kèm giám sát thích hợp
- **Tối ưu chi phí** - Phân bổ tài nguyên thông minh và chiến lược scaling cho khối lượng công việc AI
- **Tích hợp Microsoft Foundry** - Kết nối liền mạch đến danh mục mô hình Microsoft Foundry và các endpoint

---

## 🎯 Thư viện Mẫu & Ví dụ

### Nổi bật: Mẫu Microsoft Foundry
**Bắt đầu ở đây nếu bạn đang triển khai ứng dụng AI!**

> **Lưu ý:** Các mẫu này minh họa các mẫu AI khác nhau. Một số là Azure Samples bên ngoài, số khác là triển khai cục bộ.

| Mẫu | Chương | Độ phức tạp | Dịch vụ | Loại |
|----------|---------|------------|----------|------|
| [**Bắt đầu với AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chương 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Bên ngoài |
| [**Bắt đầu với tác nhân AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chương 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Bên ngoài |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chương 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Bên ngoài |
| [**Khởi động Nhanh Ứng dụng Chat OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chương 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Bên ngoài |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chương 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Bên ngoài |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chương 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Bên ngoài |
| [**Giải pháp Bán lẻ Đa tác nhân**](examples/retail-scenario.md) | Chương 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Nội bộ** |

### Nổi bật: Các Kịch bản Học tập Hoàn chỉnh
**Mẫu ứng dụng sẵn sàng cho sản xuất được ánh xạ tới các chương học**

| Mẫu | Chương Học | Độ phức tạp | Kiến thức chính |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chương 2 | ⭐ | Mẫu triển khai AI cơ bản |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chương 2 | ⭐⭐ | Triển khai RAG với Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chương 4 | ⭐⭐ | Tích hợp Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chương 5 | ⭐⭐⭐ | Framework tác nhân và function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chương 8 | ⭐⭐⭐ | Orchestration AI doanh nghiệp |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chương 5 | ⭐⭐⭐⭐ | Kiến trúc đa tác nhân với tác nhân Khách hàng và Kho hàng |

### Học theo Loại Ví dụ

> **📌 Ví dụ Nội bộ vs. Bên ngoài:**  
> **Ví dụ Nội bộ** (trong repo này) = Sẵn sàng sử dụng ngay  
> **Ví dụ Bên ngoài** (Azure Samples) = Clone từ các repository liên kết

#### Ví dụ Nội bộ (Sẵn sàng sử dụng)
- [**Giải pháp Bán lẻ Đa tác nhân**](examples/retail-scenario.md) - Triển khai hoàn chỉnh, sẵn sàng cho sản xuất với ARM templates
  - Kiến trúc đa tác nhân (tác nhân Khách hàng + tác nhân Kho hàng)
  - Giám sát và đánh giá toàn diện
  - Triển khai một lần nhấp qua ARM template

#### Ví dụ Nội bộ - Ứng dụng Container (Chương 2-5)
**Các ví dụ triển khai container toàn diện trong repository này:**
- [**Container App Examples**](examples/container-app/README.md) - Hướng dẫn đầy đủ về triển khai container
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST cơ bản với scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Triển khai đa dịch vụ sẵn sàng cho sản xuất
  - Mẫu Khởi động Nhanh, Sản xuất, và Triển khai Nâng cao
  - Hướng dẫn giám sát, bảo mật, và tối ưu chi phí

#### Ví dụ Bên ngoài - Ứng dụng Đơn giản (Chương 1-2)
**Clone các repository Azure Samples này để bắt đầu:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mẫu triển khai cơ bản
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Triển khai nội dung tĩnh
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Triển khai REST API

#### Ví dụ Bên ngoài - Tích hợp Cơ sở dữ liệu (Chương 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mẫu kết nối cơ sở dữ liệu
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Luồng dữ liệu serverless

#### Ví dụ Bên ngoài - Mẫu Nâng cao (Chương 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Kiến trúc đa dịch vụ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Xử lý nền  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Mẫu ML sẵn sàng cho sản xuất

### Bộ sưu tập Mẫu Bên ngoài
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Bộ sưu tập tuyển chọn các mẫu chính thức và cộng đồng
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Tài liệu mẫu Microsoft Learn
- [**Examples Directory**](examples/README.md) - Ví dụ học tập nội bộ với giải thích chi tiết

---

## 📚 Tài nguyên Học tập & Tham khảo

### Tham khảo Nhanh
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Các lệnh azd thiết yếu được tổ chức theo chương
- [**Glossary**](resources/glossary.md) - Thuật ngữ Azure và azd  
- [**FAQ**](resources/faq.md) - Câu hỏi thường gặp được tổ chức theo chương học
- [**Study Guide**](resources/study-guide.md) - Bài tập thực hành toàn diện

### Hội thảo Thực hành
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Làm cho giải pháp AI của bạn có thể triển khai bằng AZD (2-3 giờ)
- [**Interactive Workshop**](workshop/README.md) - 8 mô-đun bài tập có hướng dẫn với MkDocs và GitHub Codespaces
  - Theo: Giới thiệu → Lựa chọn → Xác nhận → Phân tích cấu trúc → Cấu hình → Tùy chỉnh → Dọn dẹp → Tổng kết

### Tài nguyên Học tập Bên ngoài
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Máy tính Giá Azure](https://azure.microsoft.com/pricing/calculator/)
- [Trạng thái Azure](https://status.azure.com/)

### Kỹ năng Tác nhân AI cho Trình soạn thảo của bạn
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 kỹ năng tác nhân mở cho Azure AI, Foundry, triển khai, chẩn đoán, tối ưu chi phí và hơn thế nữa. Cài đặt chúng trong GitHub Copilot, Cursor, Claude Code, hoặc bất kỳ tác nhân được hỗ trợ nào:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hướng dẫn Khắc phục Sự cố Nhanh

**Các vấn đề thường gặp mà người mới gặp phải và giải pháp ngay lập tức:**

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
<summary><strong>❌ "No subscription found" hoặc "Subscription not set"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" hoặc "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "Authentication failed" hoặc "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" hoặc xung đột đặt tên</strong></summary>

```bash
# AZD tạo tên duy nhất, nhưng nếu có xung đột:
azd down --force --purge

# Sau đó thử lại với môi trường mới
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Việc triển khai template mất quá nhiều thời gian</strong></summary>

**Thời gian chờ bình thường:**
- Simple web app: 5-10 minutes
- App with database: 10-15 minutes
- AI applications: 15-25 minutes (OpenAI provisioning is slow)

```bash
# Kiểm tra tiến độ
azd show

# Nếu bị kẹt hơn 30 phút, hãy kiểm tra Azure Portal:
azd monitor
# Tìm các triển khai thất bại
```
</details>

<details>
<summary><strong>❌ "Permission denied" hoặc "Forbidden"</strong></summary>

```bash
# Kiểm tra vai trò Azure của bạn
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Bạn cần ít nhất vai trò "Contributor"
# Yêu cầu quản trị viên Azure của bạn cấp:
# - Contributor (cho tài nguyên)
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

### 📚 Tài nguyên Khắc phục Sự cố Đầy đủ

- **Hướng dẫn Các Vấn đề Thường Gặp:** [Giải pháp Chi tiết](docs/chapter-07-troubleshooting/common-issues.md)
- **Vấn đề Cụ thể của AI:** [Khắc phục sự cố AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hướng dẫn Gỡ lỗi:** [Gỡ lỗi từng bước](docs/chapter-07-troubleshooting/debugging.md)
- **Nhận trợ giúp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Hoàn thành Khóa học & Chứng nhận

### Theo dõi Tiến trình
Theo dõi tiến trình học tập của bạn qua từng chương:

- [ ] **Chương 1**: Nền tảng & Bắt đầu Nhanh ✅
- [ ] **Chương 2**: Phát triển Ưu tiên AI ✅  
- [ ] **Chương 3**: Cấu hình & Xác thực ✅
- [ ] **Chương 4**: Cơ sở hạ tầng dưới dạng mã & Triển khai ✅
- [ ] **Chương 5**: Giải pháp AI Đa Tác nhân ✅
- [ ] **Chương 6**: Xác thực & Lập kế hoạch Trước Triển khai ✅
- [ ] **Chương 7**: Khắc phục sự cố & Gỡ lỗi ✅
- [ ] **Chương 8**: Mô hình Sản xuất & Doanh nghiệp ✅

### Xác minh Học tập
Sau khi hoàn thành mỗi chương, xác minh kiến thức của bạn bằng cách:
1. **Bài tập Thực hành**: Hoàn thành việc triển khai thực tế của chương
2. **Kiểm tra Kiến thức**: Xem lại mục Câu hỏi thường gặp (FAQ) cho chương của bạn
3. **Thảo luận Cộng đồng**: Chia sẻ trải nghiệm của bạn trên Azure Discord
4. **Chương Tiếp theo**: Chuyển sang mức độ phức tạp tiếp theo

### Lợi ích khi Hoàn thành Khóa học
Khi hoàn thành tất cả các chương, bạn sẽ có:
- **Kinh nghiệm Triển khai Thực tế**: Đã triển khai các ứng dụng AI thực tế lên Azure
- **Kỹ năng Chuyên nghiệp**: Khả năng triển khai sẵn sàng cho doanh nghiệp  
- **Sự Công nhận từ Cộng đồng**: Thành viên tích cực của cộng đồng nhà phát triển Azure
- **Thăng tiến Nghề nghiệp**: Chuyên môn triển khai AZD và AI đang được săn đón

---

## 🤝 Cộng đồng & Hỗ trợ

### Nhận Trợ giúp & Hỗ trợ
- **Vấn đề Kỹ thuật**: [Báo lỗi và yêu cầu tính năng](https://github.com/microsoft/azd-for-beginners/issues)
- **Câu hỏi Học tập**: [Cộng đồng Microsoft Azure Discord](https://discord.gg/microsoft-azure) và [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Trợ giúp Chuyên biệt cho AI**: Tham gia [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tài liệu**: [Tài liệu chính thức của Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Những hiểu biết của cộng đồng từ Discord Microsoft Foundry

**Kết quả Khảo sát Gần đây từ kênh #Azure:**
- **45%** nhà phát triển muốn sử dụng AZD cho các khối lượng công việc AI
- **Thách thức hàng đầu**: Triển khai đa dịch vụ, quản lý thông tin xác thực, sẵn sàng cho sản xuất  
- **Yêu cầu nhiều nhất**: Mẫu dành cho AI, hướng dẫn khắc phục sự cố, các phương pháp hay nhất

**Tham gia cộng đồng của chúng tôi để:**
- Chia sẻ kinh nghiệm AZD + AI của bạn và nhận trợ giúp
- Truy cập bản xem trước sớm các mẫu AI mới
- Đóng góp vào các phương pháp hay nhất cho triển khai AI
- Góp phần ảnh hưởng đến phát triển tính năng AI + AZD trong tương lai

### Đóng góp cho Khóa học
Chúng tôi hoan nghênh các đóng góp! Vui lòng đọc [Hướng dẫn Đóng góp](CONTRIBUTING.md) để biết chi tiết về:
- **Cải tiến Nội dung**: Nâng cao các chương và ví dụ hiện có
- **Ví dụ Mới**: Thêm các kịch bản và mẫu thực tế  
- **Dịch thuật**: Giúp duy trì hỗ trợ đa ngôn ngữ
- **Báo cáo Lỗi**: Cải thiện độ chính xác và rõ ràng
- **Tiêu chuẩn Cộng đồng**: Tuân theo các hướng dẫn cộng đồng mang tính bao trùm của chúng tôi

---

## 📄 Thông tin Khóa học

### Giấy phép
Dự án này được cấp phép theo Giấy phép MIT - xem tệp [LICENSE](../../LICENSE) để biết chi tiết.

### Tài nguyên Học tập Liên quan của Microsoft

Nhóm của chúng tôi sản xuất các khóa học toàn diện khác:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j dành cho Người mới bắt đầu](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js dành cho Người mới bắt đầu](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain dành cho Người mới bắt đầu](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Tác nhân
[![AZD dành cho Người mới bắt đầu](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI dành cho Người mới bắt đầu](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP dành cho Người mới bắt đầu](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Tác nhân AI dành cho Người mới bắt đầu](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Chuỗi AI Tạo sinh
[![AI Tạo sinh dành cho Người mới bắt đầu](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Tạo sinh (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI Tạo sinh (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI Tạo sinh (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Học Cốt lõi
[![Học máy dành cho Người mới bắt đầu](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Khoa học Dữ liệu dành cho Người mới bắt đầu](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI dành cho Người mới bắt đầu](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![An ninh mạng dành cho Người mới bắt đầu](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Phát triển Web dành cho Người mới bắt đầu](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT dành cho Người mới bắt đầu](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Phát triển XR dành cho Người mới bắt đầu](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Chuỗi Copilot
[![Copilot cho Lập trình Ghép cặp AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot cho C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Cuộc phiêu lưu Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Điều hướng Khóa học

**🚀 Sẵn sàng bắt đầu?**

**Người mới**: Bắt đầu với [Chương 1: Nền tảng & Bắt đầu Nhanh](#-chapter-1-foundation--quick-start)  
**Nhà phát triển AI**: Chuyển đến [Chương 2: Phát triển ưu tiên AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Lập trình viên có kinh nghiệm**: Bắt đầu với [Chương 3: Cấu hình & Xác thực](#️-chapter-3-configuration--authentication)

**Bước tiếp theo**: [Bắt đầu Chương 1 - AZD Cơ bản](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Văn bản này đã được dịch bằng dịch vụ dịch máy AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Văn bản gốc bằng ngôn ngữ ban đầu nên được coi là nguồn tham khảo có thẩm quyền. Đối với các thông tin quan trọng, nên sử dụng dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->