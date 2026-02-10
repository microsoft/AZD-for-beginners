# AZD Cho Người Mới Bắt Đầu: Hành Trình Học Có Cấu Trúc

![AZD-cho-nguoi-moi](../../translated_images/vi/azdbeginners.5527441dd9f74068.webp) 

[![Người theo dõi GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Fork trên GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Sao trên GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Bản Dịch Tự Động (Luôn Cập Nhật)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Tiếng Ả Rập](../ar/README.md) | [Tiếng Bengali](../bn/README.md) | [Tiếng Bungari](../bg/README.md) | [Tiếng Miến Điện (Myanmar)](../my/README.md) | [Tiếng Trung (Giản thể)](../zh-CN/README.md) | [Tiếng Trung (Phồn thể, Hồng Kông)](../zh-HK/README.md) | [Tiếng Trung (Phồn thể, Ma Cao)](../zh-MO/README.md) | [Tiếng Trung (Phồn thể, Đài Loan)](../zh-TW/README.md) | [Tiếng Croatia](../hr/README.md) | [Tiếng Séc](../cs/README.md) | [Tiếng Đan Mạch](../da/README.md) | [Tiếng Hà Lan](../nl/README.md) | [Tiếng Estonia](../et/README.md) | [Tiếng Phần Lan](../fi/README.md) | [Tiếng Pháp](../fr/README.md) | [Tiếng Đức](../de/README.md) | [Tiếng Hy Lạp](../el/README.md) | [Tiếng Do Thái](../he/README.md) | [Tiếng Hindi](../hi/README.md) | [Tiếng Hungary](../hu/README.md) | [Tiếng Indonesia](../id/README.md) | [Tiếng Ý](../it/README.md) | [Tiếng Nhật](../ja/README.md) | [Tiếng Kannada](../kn/README.md) | [Tiếng Hàn](../ko/README.md) | [Tiếng Litva](../lt/README.md) | [Tiếng Mã Lai](../ms/README.md) | [Tiếng Malayalam](../ml/README.md) | [Tiếng Marathi](../mr/README.md) | [Tiếng Nepal](../ne/README.md) | [Tiếng Pidgin Nigeria](../pcm/README.md) | [Tiếng Na Uy](../no/README.md) | [Tiếng Ba Tư (Farsi)](../fa/README.md) | [Tiếng Ba Lan](../pl/README.md) | [Tiếng Bồ Đào Nha (Brazil)](../pt-BR/README.md) | [Tiếng Bồ Đào Nha (Bồ Đào Nha)](../pt-PT/README.md) | [Tiếng Punjabi (Gurmukhi)](../pa/README.md) | [Tiếng Romania](../ro/README.md) | [Tiếng Nga](../ru/README.md) | [Tiếng Serbia (Kirill)](../sr/README.md) | [Tiếng Slovakia](../sk/README.md) | [Tiếng Slovenia](../sl/README.md) | [Tiếng Tây Ban Nha](../es/README.md) | [Tiếng Swahili](../sw/README.md) | [Tiếng Thụy Điển](../sv/README.md) | [Tiếng Tagalog (Filipino)](../tl/README.md) | [Tiếng Tamil](../ta/README.md) | [Tiếng Telugu](../te/README.md) | [Tiếng Thái](../th/README.md) | [Tiếng Thổ Nhĩ Kỳ](../tr/README.md) | [Tiếng Ukraina](../uk/README.md) | [Tiếng Urdu](../ur/README.md) | [Tiếng Việt](./README.md)

> **Muốn Clone cục bộ?**

> Kho lưu trữ này bao gồm hơn 50 bản dịch ngôn ngữ, làm tăng đáng kể kích thước tải xuống. Để clone mà không có phần bản dịch, hãy sử dụng sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Điều này cung cấp cho bạn mọi thứ bạn cần để hoàn thành khóa học với thời gian tải xuống nhanh hơn nhiều.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) là gì?

**Azure Developer CLI (azd)** là một công cụ dòng lệnh thân thiện với nhà phát triển giúp đơn giản hóa việc triển khai ứng dụng lên Azure. Thay vì phải tạo và kết nối thủ công hàng chục tài nguyên Azure, bạn có thể triển khai toàn bộ ứng dụng chỉ với một lệnh.

### Sức mạnh của `azd up`

```bash
# Lệnh duy nhất này làm tất cả mọi thứ:
# ✅ Tạo tất cả các tài nguyên Azure
# ✅ Cấu hình mạng và bảo mật
# ✅ Xây dựng mã ứng dụng của bạn
# ✅ Triển khai lên Azure
# ✅ Cung cấp cho bạn một URL hoạt động
azd up
```

**Xong!** Không cần nhấp trong Azure Portal, không cần học trước các mẫu ARM phức tạp, không cần cấu hình thủ công - chỉ có các ứng dụng hoạt động trên Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Sự khác biệt là gì?

Đây là câu hỏi phổ biến nhất người mới thường hỏi. Đây là câu trả lời ngắn gọn:

| Tính năng | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Mục đích** | Quản lý từng tài nguyên Azure riêng lẻ | Triển khai ứng dụng hoàn chỉnh |
| **Tư duy** | Tập trung vào hạ tầng | Tập trung vào ứng dụng |
| **Ví dụ** | `az webapp create --name myapp...` | `azd up` |
| **Đường cong học tập** | Cần biết các dịch vụ Azure | Chỉ cần biết ứng dụng của bạn |
| **Phù hợp cho** | DevOps, Hạ tầng | Nhà phát triển, Tạo mẫu |

### Phép ẩn dụ đơn giản

- **Azure CLI** giống như có tất cả các công cụ để xây nhà - búa, cưa, đinh. Bạn có thể xây bất cứ thứ gì, nhưng bạn cần biết xây dựng.
- **Azure Developer CLI** giống như thuê một nhà thầu - bạn mô tả những gì bạn muốn, và họ lo phần xây dựng.

### Khi nào nên dùng từng công cụ

| Kịch bản | Dùng lệnh |
|----------|----------|
| "Tôi muốn triển khai ứng dụng web nhanh chóng" | `azd up` |
| "Tôi chỉ cần tạo một tài khoản lưu trữ" | `az storage account create` |
| "Tôi đang xây dựng một ứng dụng AI hoàn chỉnh" | `azd init --template azure-search-openai-demo` |
| "Tôi cần gỡ lỗi một tài nguyên Azure cụ thể" | `az resource show` |
| "Tôi muốn triển khai sẵn sàng cho sản xuất trong vài phút" | `azd up --environment production` |

### Chúng hoạt động cùng nhau!

AZD sử dụng Azure CLI bên trong. Bạn có thể dùng cả hai:
```bash
# Triển khai ứng dụng của bạn bằng AZD
azd up

# Sau đó điều chỉnh cụ thể các tài nguyên với Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Tìm mẫu trong Awesome AZD

Đừng bắt đầu từ con số không! **Awesome AZD** là bộ sưu tập cộng đồng các mẫu sẵn sàng để triển khai:

| Tài nguyên | Mô tả |
|----------|-------------|
| 🔗 [**Thư viện Awesome AZD**](https://azure.github.io/awesome-azd/) | Duyệt hơn 200 mẫu và triển khai bằng một cú nhấp |
| 🔗 [**Gửi mẫu**](https://github.com/Azure/awesome-azd/issues) | Đóng góp mẫu của bạn cho cộng đồng |
| 🔗 [**Kho GitHub**](https://github.com/Azure/awesome-azd) | Nhấn sao và khám phá mã nguồn |

### Các mẫu AI phổ biến từ Awesome AZD

```bash
# Trò chuyện RAG với Azure OpenAI + Tìm kiếm AI
azd init --template azure-search-openai-demo

# Ứng dụng trò chuyện AI nhanh
azd init --template openai-chat-app-quickstart

# Đại lý AI với Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Bắt đầu trong 3 bước

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

### Bước 2: Đăng nhập vào Azure

```bash
azd auth login
```

### Bước 3: Triển khai Ứng dụng Đầu tiên của Bạn

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

## 📚 Cách Sử Dụng Khóa Học Này

Khóa học này được thiết kế cho việc **học theo tiến trình** - bắt đầu từ nơi bạn thấy thoải mái và tiến dần lên:

| Kinh nghiệm của bạn | Bắt đầu tại đây |
|-----------------|------------|
| **Hoàn toàn mới với Azure** | [Ch 1: Nền tảng](../..) |
| **Biết Azure, mới với AZD** | [Ch 1: Nền tảng](../..) |
| **Muốn triển khai ứng dụng AI** | [Ch 2: Phát triển ưu tiên AI](../..) |
| **Muốn thực hành trực tiếp** | [🎓 Workshop Tương tác](workshop/README.md) - bài lab có hướng dẫn 3-4 giờ |
| **Cần các mô hình cho môi trường sản xuất** | [Ch 8: Sản xuất & Doanh nghiệp](../..) |

### Cài đặt nhanh

1. **Tạo fork kho lưu trữ này**: [![Fork trên GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone nó**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Nhận trợ giúp**: [Cộng đồng Azure trên Discord](https://discord.com/invite/ByRwuEEgH4)

> **Muốn Clone cục bộ?**

> Kho lưu trữ này bao gồm hơn 50 bản dịch ngôn ngữ, làm tăng đáng kể kích thước tải xuống. Để clone mà không có phần bản dịch, hãy sử dụng sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Điều này cung cấp cho bạn mọi thứ bạn cần để hoàn thành khóa học với thời gian tải xuống nhanh hơn nhiều.


## Tổng quan Khóa học

Làm chủ Azure Developer CLI (azd) thông qua các chương có cấu trúc được thiết kế cho việc học theo tiến trình. **Tập trung đặc biệt vào triển khai ứng dụng AI với tích hợp Microsoft Foundry.**

### Tại sao Khóa học này quan trọng với nhà phát triển hiện đại

Dựa trên những nhận định từ cộng đồng Microsoft Foundry trên Discord, **45% nhà phát triển muốn sử dụng AZD cho các workload AI** nhưng gặp các thách thức về:
- Kiến trúc AI nhiều dịch vụ phức tạp
- Thực hành tốt nhất cho triển khai AI vào môi trường sản xuất  
- Tích hợp và cấu hình dịch vụ AI của Azure
- Tối ưu chi phí cho workload AI
- Khắc phục sự cố triển khai dành riêng cho AI

### Mục tiêu học tập

Khi hoàn thành khóa học có cấu trúc này, bạn sẽ:
- **Nắm vững cơ bản AZD**: Các khái niệm cốt lõi, cài đặt và cấu hình
- **Triển khai ứng dụng AI**: Sử dụng AZD với các dịch vụ Microsoft Foundry
- **Triển khai Hạ tầng như Mã (IaC)**: Quản lý tài nguyên Azure bằng các mẫu Bicep
- **Khắc phục lỗi triển khai**: Giải quyết các vấn đề phổ biến và gỡ lỗi
- **Tối ưu cho môi trường sản xuất**: Bảo mật, mở rộng, giám sát và quản lý chi phí
- **Xây dựng các giải pháp đa tác tử**: Triển khai các kiến trúc AI phức tạp

## 🗺️ Bản đồ Khóa học: Điều hướng nhanh theo chương

Mỗi chương có một README riêng với mục tiêu học tập, hướng dẫn khởi động nhanh, và bài tập:

| Chương | Chủ đề | Bài học | Thời lượng | Độ phức tạp |
|---------|-------|---------|----------|------------|
| **[Ch 1: Nền tảng](docs/chapter-01-foundation/README.md)** | Bắt đầu | [Cơ bản AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Cài đặt](docs/chapter-01-foundation/installation.md) &#124; [Dự án đầu tiên](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: Phát triển AI](docs/chapter-02-ai-development/README.md)** | Ứng dụng lấy AI làm trung tâm | [Tích hợp Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Các tác tử AI](docs/chapter-02-ai-development/agents.md) &#124; [Triển khai mô hình AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Cấu hình](docs/chapter-03-configuration/README.md)** | Xác thực & Bảo mật | [Cấu hình](docs/chapter-03-configuration/configuration.md) &#124; [Xác thực & Bảo mật](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Hạ tầng](docs/chapter-04-infrastructure/README.md)** | IaC & Triển khai | [Hướng dẫn triển khai](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Cấp phát](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Đa Tác Nhân](docs/chapter-05-multi-agent/README.md)** | Giải pháp Tác nhân AI | [Kịch bản Bán lẻ](examples/retail-scenario.md) &#124; [Mẫu Điều phối](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 giờ | ⭐⭐⭐⭐ |
| **[Ch 6: Trước Triển khai](docs/chapter-06-pre-deployment/README.md)** | Lập kế hoạch & Xác thực | [Kiểm tra trước triển khai](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Lập kế hoạch công suất](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Chọn SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 giờ | ⭐⭐ |
| **[Ch 7: Khắc phục sự cố](docs/chapter-07-troubleshooting/README.md)** | Gỡ lỗi & Sửa | [Vấn đề Thường Gặp](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Gỡ lỗi](docs/chapter-07-troubleshooting/debugging.md) &#124; [Vấn đề AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 giờ | ⭐⭐ |
| **[Ch 8: Sản xuất](docs/chapter-08-production/README.md)** | Mẫu Doanh nghiệp | [Thực hành Sản xuất](docs/chapter-08-production/production-ai-practices.md) | 2-3 giờ | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Phòng Thực hành | [Giới thiệu](workshop/docs/instructions/0-Introduction.md) &#124; [Lựa chọn](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Xác thực](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Phân tích](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Cấu hình](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tùy chỉnh](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Dỡ hạ tầng](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Tổng kết](workshop/docs/instructions/7-Wrap-up.md) | 3-4 giờ | ⭐⭐ |

**Tổng thời lượng khoá học:** ~10-14 giờ | **Lộ trình kỹ năng:** Người mới → Sẵn sàng sản xuất

---

## 📚 Các chương học

*Chọn đường học tập dựa trên mức kinh nghiệm và mục tiêu*

### 🚀 Chương 1: Nền tảng & Bắt đầu Nhanh
**Yêu cầu tiên quyết**: Tài khoản Azure, kiến thức cơ bản về dòng lệnh  
**Thời lượng**: 30-45 phút  
**Độ phức tạp**: ⭐

#### Những gì bạn sẽ học
- Hiểu các khái niệm cơ bản của Azure Developer CLI
- Cài đặt AZD trên nền tảng của bạn
- Triển khai thành công đầu tiên của bạn

#### Tài nguyên học tập
- **🎯 Bắt đầu tại đây**: [Azure Developer CLI là gì?](../..)
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

**💡 Kết quả Chương**: Triển khai thành công một ứng dụng web đơn giản lên Azure bằng AZD

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
**📈 Trình độ sau:** Có thể triển khai các ứng dụng cơ bản một cách độc lập

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
**📈 Trình độ sau:** Có thể triển khai các ứng dụng cơ bản một cách độc lập

---

### 🤖 Chương 2: Phát triển ưu tiên AI (Khuyến nghị cho Nhà phát triển AI)
**Yêu cầu**: Hoàn thành Chương 1  
**Thời lượng**: 1-2 giờ  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Tích hợp Microsoft Foundry với AZD
- Triển khai các ứng dụng tích hợp AI
- Hiểu cấu hình dịch vụ AI

#### Tài nguyên học tập
- **🎯 Bắt đầu tại đây**: [Tích hợp Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Tác nhân AI**: [Hướng dẫn Tác nhân AI](docs/chapter-02-ai-development/agents.md) - Triển khai tác nhân thông minh với AZD
- **📖 Mẫu**: [Triển khai mô hình AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Triển khai và quản lý mô hình AI
- **🛠️ Xưởng**: [Phòng thí nghiệm Workshop AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Chuẩn bị giải pháp AI cho AZD
- **🎥 Hướng dẫn tương tác**: [Tài liệu Workshop](workshop/README.md) - Học qua trình duyệt với MkDocs * Môi trường DevContainer
- **📋 Mẫu**: [Microsoft Foundry Templates](../..)
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

**💡 Kết quả Chương**: Triển khai và cấu hình một ứng dụng chat tích hợp AI với khả năng RAG

**✅ Xác thực thành công:**
```bash
# Sau Chương 2, bạn sẽ có thể:
azd init --template azure-search-openai-demo
azd up
# Kiểm tra giao diện trò chuyện AI
# Đặt câu hỏi và nhận phản hồi do AI cung cấp kèm nguồn
# Xác minh tích hợp tìm kiếm hoạt động
azd monitor  # Kiểm tra Application Insights hiển thị dữ liệu giám sát
azd down --force --purge
```

**📊 Thời gian đầu tư:** 1-2 giờ  
**📈 Trình độ sau:** Có thể triển khai và cấu hình các ứng dụng AI sẵn sàng cho sản xuất  
**💰 Nhận biết chi phí:** Hiểu chi phí phát triển $80-150/tháng, chi phí sản xuất $300-3500/tháng

#### 💰 Cân nhắc chi phí cho triển khai AI

**Môi trường Phát triển (Ước tính $80-150/tháng):**
- Azure OpenAI (Trả theo sử dụng): $0-50/tháng (dựa trên sử dụng token)
- AI Search (Hạng cơ bản): $75/tháng
- Container Apps (Tiêu thụ): $0-20/tháng
- Lưu trữ (Chuẩn): $1-5/tháng

**Môi trường Sản xuất (Ước tính $300-3,500+/tháng):**
- Azure OpenAI (PTU cho hiệu năng ổn định): $3,000+/tháng HOẶC Trả theo sử dụng với khối lượng lớn
- AI Search (Hạng chuẩn): $250/tháng
- Container Apps (Dành riêng): $50-100/tháng
- Application Insights: $5-50/tháng
- Lưu trữ (Cao cấp): $10-50/tháng

**💡 Mẹo tối ưu chi phí:**
- Sử dụng **Lớp Miễn phí** Azure OpenAI để học (bao gồm 50.000 tokens/tháng)
- Chạy `azd down` để giải phóng tài nguyên khi không phát triển tích cực
- Bắt đầu với thanh toán theo tiêu thụ, chỉ nâng cấp lên PTU cho môi trường sản xuất
- Dùng `azd provision --preview` để ước tính chi phí trước khi triển khai
- Bật tự động mở rộng: chỉ trả cho mức sử dụng thực tế

**Giám sát chi phí:**
```bash
# Kiểm tra chi phí ước tính hàng tháng
azd provision --preview

# Giám sát chi phí thực tế trong Cổng thông tin Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chương 3: Cấu hình & Xác thực
**Yêu cầu**: Hoàn thành Chương 1  
**Thời lượng**: 45-60 phút  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Cấu hình và quản lý môi trường
- Xác thực và các thực hành bảo mật tốt nhất
- Đặt tên và tổ chức tài nguyên

#### Tài nguyên học tập
- **📖 Cấu hình**: [Hướng dẫn Cấu hình](docs/chapter-03-configuration/configuration.md) - Thiết lập môi trường
- **🔐 Bảo mật**: [Mẫu xác thực và managed identity](docs/chapter-03-configuration/authsecurity.md) - Mẫu xác thực
- **📝 Ví dụ**: [Ví dụ Ứng dụng Cơ sở dữ liệu](examples/database-app/README.md) - Ví dụ cơ sở dữ liệu AZD

#### Bài tập thực hành
- Cấu hình nhiều môi trường (dev, staging, prod)
- Thiết lập xác thực bằng managed identity
- Thực hiện cấu hình theo môi trường

**💡 Kết quả Chương**: Quản lý nhiều môi trường với xác thực và bảo mật đúng đắn

---

### 🏗️ Chương 4: Hạ tầng như Mã & Triển khai
**Yêu cầu**: Hoàn thành Chương 1-3  
**Thời lượng**: 1-1.5 giờ  
**Độ phức tạp**: ⭐⭐⭐

#### Những gì bạn sẽ học
- Mẫu triển khai nâng cao
- Hạ tầng như mã với Bicep
- Chiến lược cấp phát tài nguyên

#### Tài nguyên học tập
- **📖 Triển khai**: [Hướng dẫn Triển khai](docs/chapter-04-infrastructure/deployment-guide.md) - Quy trình hoàn chỉnh
- **🏗️ Cấp phát**: [Cấp phát tài nguyên](docs/chapter-04-infrastructure/provisioning.md) - Quản lý tài nguyên Azure
- **📝 Ví dụ**: [Ví dụ Container App](../../examples/container-app) - Triển khai container

#### Bài tập thực hành
- Tạo mẫu Bicep tùy chỉnh
- Triển khai ứng dụng đa dịch vụ
- Thực hiện chiến lược triển khai blue-green

**💡 Kết quả Chương**: Triển khai các ứng dụng đa dịch vụ phức tạp sử dụng các mẫu hạ tầng tùy chỉnh

---

### 🎯 Chương 5: Giải pháp AI Đa Tác Nhân (Nâng cao)
**Yêu cầu**: Hoàn thành Chương 1-2  
**Thời lượng**: 2-3 giờ  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Mẫu kiến trúc đa tác nhân
- Điều phối và phối hợp giữa các tác nhân
- Triển khai AI sẵn sàng cho sản xuất

#### Tài nguyên học tập
- **🤖 Dự án tiêu biểu**: [Giải pháp Đa Tác Nhân Bán lẻ](examples/retail-scenario.md) - Triển khai hoàn chỉnh
- **🛠️ Mẫu ARM**: [Gói Mẫu ARM](../../examples/retail-multiagent-arm-template) - Triển khai một cú nhấp
- **📖 Kiến trúc**: [Mẫu điều phối đa tác nhân](docs/chapter-06-pre-deployment/coordination-patterns.md) - Các mẫu

#### Bài tập thực hành
```bash
# Triển khai giải pháp bán lẻ đa tác nhân hoàn chỉnh
cd examples/retail-multiagent-arm-template
./deploy.sh

# Khám phá cấu hình các tác nhân
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kết quả Chương**: Triển khai và quản lý một giải pháp AI đa tác nhân sẵn sàng cho sản xuất với các tác nhân Khách hàng và Hàng tồn kho

---

### 🔍 Chương 6: Xác thực & Lập kế hoạch Trước Triển khai
**Yêu cầu**: Hoàn thành Chương 4  
**Thời lượng**: 1 giờ  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Lập kế hoạch công suất và xác thực tài nguyên
- Chiến lược chọn SKU
- Kiểm tra trước triển khai và tự động hóa

#### Tài nguyên học tập
- **📊 Lập kế hoạch**: [Lập kế hoạch công suất](docs/chapter-06-pre-deployment/capacity-planning.md) - Xác thực tài nguyên
- **💰 Lựa chọn**: [Chọn SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Lựa chọn tiết kiệm chi phí
- **✅ Xác thực**: [Kiểm tra trước triển khai](docs/chapter-06-pre-deployment/preflight-checks.md) - Các script tự động

#### Bài tập thực hành
- Chạy các script xác thực công suất
- Tối ưu lựa chọn SKU để tiết kiệm chi phí
- Thực hiện các kiểm tra tự động trước triển khai

**💡 Kết quả Chương**: Xác thực và tối ưu triển khai trước khi thực hiện

---

### 🚨 Chương 7: Khắc phục sự cố & Gỡ lỗi
**Yêu cầu**: Hoàn thành bất kỳ chương triển khai nào  
**Thời lượng**: 1-1.5 giờ  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Phương pháp gỡ lỗi hệ thống có hệ thống
- Vấn đề thường gặp và giải pháp
- Khắc phục sự cố chuyên biệt cho AI

#### Tài nguyên học tập
- **🔧 Vấn đề Thường Gặp**: [Vấn đề Thường Gặp](docs/chapter-07-troubleshooting/common-issues.md) - Câu hỏi thường gặp và giải pháp
- **🕵️ Gỡ lỗi**: [Hướng dẫn Gỡ lỗi](docs/chapter-07-troubleshooting/debugging.md) - Chiến lược theo bước
- **🤖 Vấn đề AI**: [Khắc phục sự cố chuyên biệt cho AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Vấn đề dịch vụ AI

#### Bài tập thực hành
- Chẩn đoán lỗi triển khai
- Giải quyết vấn đề xác thực
- Gỡ lỗi kết nối dịch vụ AI

**💡 Kết quả Chương**: Tự mình chẩn đoán và giải quyết các vấn đề triển khai phổ biến

---

### 🏢 Chương 8: Sản xuất & Mẫu Doanh nghiệp
**Yêu cầu**: Hoàn thành Chương 1-4  
**Thời lượng**: 2-3 giờ  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Chiến lược triển khai cho môi trường sản xuất
- Mẫu bảo mật doanh nghiệp
- Giám sát và tối ưu chi phí

#### Tài nguyên học tập
- **🏭 Sản xuất**: [Thực hành tốt nhất AI cho Sản xuất](docs/chapter-08-production/production-ai-practices.md) - Mẫu doanh nghiệp
- **📝 Ví dụ**: [Ví dụ Microservices](../../examples/microservices) - Kiến trúc phức tạp
- **📊 Giám sát**: [Tích hợp Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Giám sát

#### Bài tập thực hành
- Thực hiện các mẫu bảo mật doanh nghiệp
- Thiết lập giám sát toàn diện
- Triển khai vào sản xuất với quản trị phù hợp

**💡 Kết quả Chương**: Triển khai các ứng dụng sẵn sàng cho doanh nghiệp với đầy đủ khả năng sản xuất

---

## 🎓 Tổng quan Workshop: Trải nghiệm Học tập Thực hành

> **⚠️ TÌNH TRẠNG WORKSHOP: Đang Phát triển**  
> Tài liệu workshop hiện đang được phát triển và tinh chỉnh. Các module cốt lõi hoạt động, nhưng một số phần nâng cao chưa hoàn thiện. Chúng tôi đang tích cực hoàn thiện tất cả nội dung. [Theo dõi tiến độ →](workshop/README.md)

### Tài liệu Workshop tương tác
**Học thực hành toàn diện với công cụ trên trình duyệt và bài tập có hướng dẫn**
Tài liệu hội thảo của chúng tôi cung cấp một trải nghiệm học tập có cấu trúc và tương tác, bổ sung cho chương trình dựa trên chương ở trên. Hội thảo được thiết kế cho cả việc tự học theo nhịp độ và các buổi do giảng viên hướng dẫn.

#### 🛠️ Tính năng hội thảo
- **Giao diện trên trình duyệt**: Hội thảo hoàn chỉnh chạy bằng MkDocs với các tính năng tìm kiếm, sao chép và chủ đề
- **Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển chỉ với một lần nhấp
- **Lộ trình học có cấu trúc**: 8 mô-đun hướng dẫn (tổng 3-4 giờ)
- **Phương pháp tiến triển**: Giới thiệu → Lựa chọn → Xác thực → Phân tích cấu trúc → Cấu hình → Tùy chỉnh → Dọn dẹp → Tổng kết
- **Môi trường DevContainer tương tác**: Công cụ và phụ thuộc được cấu hình sẵn

#### 📚 Cấu trúc mô-đun hội thảo
Hội thảo theo một **phương pháp tiến triển gồm 8 mô-đun** đưa bạn từ khám phá đến thành thạo triển khai:

| Mô-đun | Chủ đề | Bạn sẽ làm gì | Thời lượng |
|--------|--------|----------------|----------|
| **0. Giới thiệu** | Tổng quan hội thảo | Hiểu các mục tiêu học tập, yêu cầu trước, và cấu trúc hội thảo | 15 phút |
| **1. Lựa chọn** | Khám phá mẫu | Khám phá các mẫu AZD và chọn mẫu AI phù hợp cho kịch bản của bạn | 20 phút |
| **2. Xác thực** | Triển khai & Xác minh | Triển khai mẫu bằng `azd up` và xác minh hạ tầng hoạt động | 30 phút |
| **3. Phân tích cấu trúc** | Hiểu cấu trúc | Sử dụng GitHub Copilot để khám phá kiến trúc mẫu, các file Bicep, và tổ chức mã | 30 phút |
| **4. Cấu hình** | Tìm hiểu sâu azure.yaml | Thành thạo cấu hình `azure.yaml`, lifecycle hooks, và biến môi trường | 30 phút |
| **5. Tùy chỉnh** | Biến nó thành của bạn | Kích hoạt AI Search, tracing, evaluation, và tùy chỉnh cho kịch bản của bạn | 45 phút |
| **6. Dọn dẹp** | Dọn dẹp | Giải phóng tài nguyên an toàn với `azd down --purge` | 15 phút |
| **7. Tổng kết** | Bước tiếp theo | Ôn lại những gì đã đạt được, các khái niệm chính, và tiếp tục hành trình học tập của bạn | 15 phút |

**Luồng hội thảo:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Bắt đầu với hội thảo
```bash
# Tùy chọn 1: GitHub Codespaces (Được khuyến nghị)
# Nhấp "Code" → "Tạo codespace trên nhánh main" trong kho lưu trữ

# Tùy chọn 2: Phát triển cục bộ
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Làm theo hướng dẫn cài đặt trong workshop/README.md
```

#### 🎯 Kết quả học tập của hội thảo
Bằng cách hoàn thành hội thảo, người tham gia sẽ:
- **Triển khai Ứng dụng AI cho sản xuất**: Sử dụng AZD với dịch vụ Microsoft Foundry
- **Thành thạo kiến trúc đa-tác nhân**: Triển khai các giải pháp tác nhân AI có phối hợp
- **Thực hiện các thực hành bảo mật tốt nhất**: Cấu hình xác thực và kiểm soát truy cập
- **Tối ưu hóa cho quy mô**: Thiết kế các triển khai hiệu suất tốt, tiết kiệm chi phí
- **Khắc phục sự cố triển khai**: Giải quyết các sự cố phổ biến một cách độc lập

#### 📖 Tài nguyên hội thảo
- **🎥 Hướng dẫn tương tác**: [Tài liệu Hội thảo](workshop/README.md) - Môi trường học trên trình duyệt
- **📋 Hướng dẫn từng mô-đun**:
  - [0. Giới thiệu](workshop/docs/instructions/0-Introduction.md) - Tổng quan hội thảo và mục tiêu
  - [1. Lựa chọn](workshop/docs/instructions/1-Select-AI-Template.md) - Tìm và chọn mẫu AI
  - [2. Xác thực](workshop/docs/instructions/2-Validate-AI-Template.md) - Triển khai và xác minh mẫu
  - [3. Phân tích cấu trúc](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Khám phá kiến trúc mẫu
  - [4. Cấu hình](workshop/docs/instructions/4-Configure-AI-Template.md) - Thành thạo azure.yaml
  - [5. Tùy chỉnh](workshop/docs/instructions/5-Customize-AI-Template.md) - Tùy chỉnh cho kịch bản của bạn
  - [6. Dọn dẹp](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Dọn dẹp tài nguyên
  - [7. Tổng kết](workshop/docs/instructions/7-Wrap-up.md) - Ôn tập và bước tiếp theo
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Bài tập tập trung vào AI
- **💡 Bắt đầu nhanh**: [Workshop Setup Guide](workshop/README.md#quick-start) - Cấu hình môi trường

**Phù hợp cho**: Đào tạo doanh nghiệp, khóa học đại học, học tự học theo nhịp độ, và bootcamp cho nhà phát triển.

---

## 📖 Đi sâu: Khả năng của AZD

Ngoài những điều cơ bản, AZD cung cấp các tính năng mạnh mẽ cho triển khai sản xuất:

- **Triển khai dựa trên mẫu** - Sử dụng các mẫu dựng sẵn cho các kiểu ứng dụng phổ biến
- **Hạ tầng như mã** - Quản lý tài nguyên Azure bằng Bicep hoặc Terraform  
- **Luồng công việc tích hợp** - Cung cấp, triển khai và giám sát ứng dụng một cách liền mạch
- **Thân thiện với nhà phát triển** - Tối ưu cho năng suất và trải nghiệm của nhà phát triển

### **AZD + Microsoft Foundry: Hoàn hảo cho triển khai AI**

**Tại sao chọn AZD cho giải pháp AI?** AZD giải quyết những thách thức hàng đầu mà nhà phát triển AI gặp phải:

- **Mẫu sẵn sàng cho AI** - Mẫu được cấu hình sẵn cho Azure OpenAI, Cognitive Services, và khối lượng công việc ML
- **Triển khai AI an toàn** - Các mẫu bảo mật tích hợp cho dịch vụ AI, API keys, và endpoints mô hình  
- **Mẫu AI cho môi trường sản xuất** - Thực hành tốt nhất cho các triển khai ứng dụng AI có khả năng mở rộng và tiết kiệm chi phí
- **Luồng công việc AI đầu-cuối** - Từ phát triển mô hình đến triển khai sản xuất với giám sát phù hợp
- **Tối ưu chi phí** - Phân bổ tài nguyên thông minh và chiến lược scale cho khối lượng công việc AI
- **Tích hợp Microsoft Foundry** - Kết nối liền mạch tới danh mục mô hình và endpoints của Microsoft Foundry

---

## 🎯 Thư viện Mẫu & Ví dụ

### Nổi bật: Mẫu Microsoft Foundry
**Bắt đầu tại đây nếu bạn đang triển khai ứng dụng AI!**

> **Lưu ý:** Những mẫu này minh họa các mẫu AI khác nhau. Một số là Azure Samples bên ngoài, số khác là triển khai cục bộ.

| Mẫu | Chương | Độ phức tạp | Dịch vụ | Loại |
|----------|---------|------------|----------|------|
| [**Bắt đầu với chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chương 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Bắt đầu với AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chương 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chương 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chương 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chương 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chương 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Giải pháp Đa-tác nhân Bán lẻ**](examples/retail-scenario.md) | Chương 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Cục bộ** |

### Nổi bật: Kịch bản học tập hoàn chỉnh
**Các mẫu ứng dụng sẵn sàng cho sản xuất được ánh xạ tới các chương học**

| Template | Chương học | Độ phức tạp | Kiến thức chính |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chương 2 | ⭐ | Mẫu triển khai AI cơ bản |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chương 2 | ⭐⭐ | Triển khai RAG với Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chương 4 | ⭐⭐ | Tích hợp Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chương 5 | ⭐⭐⭐ | Framework tác nhân và gọi hàm |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chương 8 | ⭐⭐⭐ | Orchestration AI cho doanh nghiệp |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chương 5 | ⭐⭐⭐⭐ | Kiến trúc đa-tác nhân với tác nhân Khách hàng và Tồn kho |

### Học qua loại ví dụ

> **📌 Ví dụ Cục bộ vs. Bên ngoài:**  
> **Ví dụ Cục bộ** (trong repo này) = Sẵn sàng sử dụng ngay  
> **Ví dụ Bên ngoài** (Azure Samples) = Clone từ các repository liên kết

#### Ví dụ cục bộ (Sẵn sàng sử dụng)
- [**Giải pháp Đa-tác nhân Bán lẻ**](examples/retail-scenario.md) - Triển khai hoàn chỉnh sẵn sàng cho sản xuất với ARM templates
  - Kiến trúc đa-tác nhân (Tác nhân Khách hàng + Tác nhân Tồn kho)
  - Giám sát và đánh giá toàn diện
  - Triển khai một lần nhấp qua ARM template

#### Ví dụ cục bộ - Ứng dụng Container (Chương 2-5)
**Các ví dụ triển khai container toàn diện trong repository này:**
- [**Ví dụ Ứng dụng Container**](examples/container-app/README.md) - Hướng dẫn hoàn chỉnh cho triển khai container
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - REST API cơ bản với scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Triển khai đa dịch vụ sẵn sàng cho sản xuất
  - Mẫu Bắt đầu Nhanh, Sản xuất và Nâng cao
  - Hướng dẫn giám sát, bảo mật và tối ưu chi phí

#### Ví dụ bên ngoài - Ứng dụng đơn giản (Chương 1-2)
**Clone các repository Azure Samples này để bắt đầu:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Các mẫu triển khai cơ bản
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Triển khai nội dung tĩnh
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Triển khai REST API

#### Ví dụ bên ngoài - Tích hợp cơ sở dữ liệu (Chương 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mẫu kết nối cơ sở dữ liệu
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Luồng dữ liệu serverless

#### Ví dụ bên ngoài - Mẫu nâng cao (Chương 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Kiến trúc đa dịch vụ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Xử lý nền  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Mẫu ML sẵn sàng cho sản xuất

### Bộ sưu tập mẫu bên ngoài
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Bộ sưu tập tuyển chọn các mẫu chính thức và cộng đồng
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Tài liệu mẫu Microsoft Learn
- [**Examples Directory**](examples/README.md) - Ví dụ học tập cục bộ với giải thích chi tiết

---

## 📚 Tài nguyên học tập & Tham khảo

### Tham khảo nhanh
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Các lệnh azd thiết yếu được sắp xếp theo chương
- [**Glossary**](resources/glossary.md) - Thuật ngữ Azure và azd  
- [**FAQ**](resources/faq.md) - Các câu hỏi thường gặp được sắp xếp theo chương học
- [**Study Guide**](resources/study-guide.md) - Bài tập thực hành toàn diện

### Hội thảo thực hành
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Làm cho giải pháp AI của bạn có thể triển khai bằng AZD (2-3 giờ)
- [**Interactive Workshop**](workshop/README.md) - 8 mô-đun hướng dẫn với MkDocs và GitHub Codespaces
  - Tuân theo: Giới thiệu → Lựa chọn → Xác thực → Phân tích cấu trúc → Cấu hình → Tùy chỉnh → Dọn dẹp → Tổng kết

### Tài nguyên học tập bên ngoài
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Hướng dẫn khắc phục sự cố nhanh

**Các vấn đề phổ biến người mới gặp phải và giải pháp ngay lập tức:**

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
<summary><strong>❌ "InsufficientQuota" hoặc "Vượt quá hạn mức"</strong></summary>

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
# Tùy chọn 1: Dọn dẹp và thử lại
azd down --force --purge
azd up

# Tùy chọn 2: Chỉ sửa cơ sở hạ tầng
azd provision

# Tùy chọn 3: Kiểm tra trạng thái chi tiết
azd show

# Tùy chọn 4: Kiểm tra nhật ký trong Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Xác thực thất bại" hoặc "Mã thông báo hết hạn"</strong></summary>

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
# AZD tạo tên duy nhất, nhưng nếu có xung đột:
azd down --force --purge

# Sau đó thử lại với môi trường mới
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ "Triển khai mẫu mất quá nhiều thời gian"</strong></summary>

**Thời gian chờ thông thường:**
- Ứng dụng web đơn giản: 5-10 phút
- Ứng dụng có cơ sở dữ liệu: 10-15 phút
- Ứng dụng AI: 15-25 phút (Quá trình cấp phát OpenAI chậm)

```bash
# Kiểm tra tiến độ
azd show

# Nếu bị kẹt hơn 30 phút, kiểm tra Azure Portal:
azd monitor
# Tìm các triển khai thất bại
```
</details>

<details>
<summary><strong>❌ "Quyền truy cập bị từ chối" hoặc "Bị cấm"</strong></summary>

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
<summary><strong>❌ "Không tìm thấy URL ứng dụng đã triển khai"</strong></summary>

```bash
# Hiển thị tất cả các điểm kết nối dịch vụ
azd show

# Hoặc mở Azure Portal
azd monitor

# Kiểm tra dịch vụ cụ thể
azd env get-values
# Tìm các biến *_URL
```
</details>

### 📚 Tài nguyên khắc phục sự cố đầy đủ

- **Hướng dẫn các sự cố thường gặp:** [Giải pháp Chi tiết](docs/chapter-07-troubleshooting/common-issues.md)
- **Các sự cố liên quan đến AI:** [Khắc phục sự cố AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hướng dẫn gỡ lỗi:** [Gỡ lỗi từng bước](docs/chapter-07-troubleshooting/debugging.md)
- **Nhận trợ giúp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Hoàn thành Khóa học & Chứng nhận

### Theo dõi tiến trình
Theo dõi tiến trình học của bạn qua từng chương:

- [ ] **Chương 1**: Nền tảng & Bắt đầu Nhanh ✅
- [ ] **Chương 2**: Phát triển ưu tiên AI ✅  
- [ ] **Chương 3**: Cấu hình & Xác thực ✅
- [ ] **Chương 4**: Hạ tầng như mã & Triển khai ✅
- [ ] **Chương 5**: Giải pháp AI đa tác nhân ✅
- [ ] **Chương 6**: Xác thực & Lập kế hoạch trước triển khai ✅
- [ ] **Chương 7**: Khắc phục sự cố & Gỡ lỗi ✅
- [ ] **Chương 8**: Sản xuất & Mẫu Doanh nghiệp ✅

### Xác minh Học tập
Sau khi hoàn thành mỗi chương, xác minh kiến thức của bạn bằng:
1. **Bài tập Thực hành**: Hoàn thành bài thực hành triển khai của chương
2. **Kiểm tra Kiến thức**: Xem lại phần Câu hỏi thường gặp cho chương của bạn
3. **Thảo luận Cộng đồng**: Chia sẻ kinh nghiệm của bạn trong Azure Discord
4. **Chương Tiếp theo**: Chuyển sang mức độ phức tạp tiếp theo

### Lợi ích khi Hoàn thành Khóa học
Khi hoàn thành tất cả các chương, bạn sẽ có:
- **Kinh nghiệm triển khai sản xuất**: Đã triển khai các ứng dụng AI thực tế lên Azure
- **Kỹ năng chuyên nghiệp**: Khả năng triển khai sẵn sàng cho doanh nghiệp  
- **Công nhận cộng đồng**: Thành viên tích cực của cộng đồng nhà phát triển Azure
- **Phát triển nghề nghiệp**: Chuyên môn AZD và triển khai AI được ưa chuộng

---

## 🤝 Cộng đồng & Hỗ trợ

### Nhận Trợ giúp & Hỗ trợ
- **Sự cố Kỹ thuật:** [Báo lỗi và yêu cầu tính năng](https://github.com/microsoft/azd-for-beginners/issues)
- **Câu hỏi Học tập:** [Cộng đồng Microsoft Azure trên Discord](https://discord.gg/microsoft-azure) và [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Hỗ trợ chuyên về AI:** Tham gia [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tài liệu:** [Tài liệu chính thức về Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Thông tin cộng đồng từ Microsoft Foundry Discord

**Kết quả thăm dò gần đây từ kênh #Azure:**
- **45%** nhà phát triển muốn sử dụng AZD cho khối lượng công việc AI
- **Thách thức hàng đầu**: Triển khai đa dịch vụ, quản lý thông tin xác thực, sẵn sàng cho môi trường production  
- **Được yêu cầu nhiều nhất**: Mẫu dành riêng cho AI, hướng dẫn khắc phục sự cố, các phương pháp hay nhất

**Tham gia cộng đồng của chúng tôi để:**
- Chia sẻ kinh nghiệm AZD + AI của bạn và nhận trợ giúp
- Truy cập bản xem trước sớm của các mẫu AI mới
- Đóng góp vào các phương pháp hay nhất triển khai AI
- Tác động đến việc phát triển tính năng AI + AZD trong tương lai

### Đóng góp cho Khóa học
Chúng tôi hoan nghênh các đóng góp! Vui lòng đọc [Hướng dẫn Đóng góp](CONTRIBUTING.md) để biết chi tiết về:
- **Cải thiện Nội dung**: Nâng cao các chương và ví dụ hiện có
- **Ví dụ Mới**: Thêm các kịch bản và mẫu thực tế  
- **Dịch thuật**: Giúp duy trì hỗ trợ đa ngôn ngữ
- **Báo cáo Lỗi**: Cải thiện độ chính xác và rõ ràng
- **Tiêu chuẩn Cộng đồng**: Tuân theo các hướng dẫn cộng đồng mang tính bao gồm của chúng tôi

---

## 📄 Thông tin Khóa học

### Giấy phép
Dự án này được cấp phép theo Giấy phép MIT - xem file [LICENSE](../../LICENSE) để biết chi tiết.

### Tài nguyên Học tập liên quan của Microsoft

Nhóm của chúng tôi sản xuất các khóa học học tập toàn diện khác:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Chuỗi AI Sinh tạo
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Học cốt lõi
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Chuỗi Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Điều hướng Khóa học

**🚀 Sẵn sàng bắt đầu học chưa?**

**Beginners**: Start with [Chương 1: Nền tảng & Bắt đầu Nhanh](../..)
**Nhà phát triển AI**: Đi tới [Chương 2: Phát triển ưu tiên AI](../..)  
**Nhà phát triển có kinh nghiệm**: Bắt đầu với [Chương 3: Cấu hình & Xác thực](../..)

**Bước tiếp theo**: [Bắt đầu Chương 1 - AZD Cơ bản](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn có thẩm quyền. Đối với những thông tin quan trọng, nên sử dụng bản dịch chuyên nghiệp do người dịch thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->