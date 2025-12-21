<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1caf5e63f84a4cdffbeb8d0fe5fa3fa8",
  "translation_date": "2025-12-21T17:45:29+00:00",
  "source_file": "README.md",
  "language_code": "vi"
}
-->
# AZD Cho Người Mới Bắt Đầu: Hành Trình Học Tập Có Cấu Trúc

![AZD-cho-nguoi-bat-dau](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.vi.png) 

[![Người theo dõi trên GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Fork trên GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Ngôi sao trên GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Bắt đầu với Khóa học này

Làm theo các bước sau để bắt đầu hành trình học AZD của bạn:

1. **Tạo fork của kho lưu trữ**: Click [![Fork trên GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone kho lưu trữ**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Tham gia Cộng đồng**: [Cộng đồng Azure trên Discord](https://discord.com/invite/ByRwuEEgH4) để được hỗ trợ từ chuyên gia
4. **Chọn Lộ trình Học của bạn**: Chọn một chương bên dưới phù hợp với trình độ của bạn

### Hỗ trợ Đa ngôn ngữ

#### Các bản dịch tự động (Luôn cập nhật)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Tiếng Ả Rập](../ar/README.md) | [Tiếng Bengal](../bn/README.md) | [Tiếng Bulgaria](../bg/README.md) | [Tiếng Miến Điện (Myanmar)](../my/README.md) | [Tiếng Trung (Giản thể)](../zh/README.md) | [Tiếng Trung (Phồn thể, Hồng Kông)](../hk/README.md) | [Tiếng Trung (Phồn thể, Macau)](../mo/README.md) | [Tiếng Trung (Phồn thể, Đài Loan)](../tw/README.md) | [Tiếng Croatia](../hr/README.md) | [Tiếng Séc](../cs/README.md) | [Tiếng Đan Mạch](../da/README.md) | [Tiếng Hà Lan](../nl/README.md) | [Tiếng Estonia](../et/README.md) | [Tiếng Phần Lan](../fi/README.md) | [Tiếng Pháp](../fr/README.md) | [Tiếng Đức](../de/README.md) | [Tiếng Hy Lạp](../el/README.md) | [Tiếng Do Thái](../he/README.md) | [Tiếng Hindi](../hi/README.md) | [Tiếng Hungary](../hu/README.md) | [Tiếng Indonesia](../id/README.md) | [Tiếng Ý](../it/README.md) | [Tiếng Nhật](../ja/README.md) | [Tiếng Kannada](../kn/README.md) | [Tiếng Hàn](../ko/README.md) | [Tiếng Litva](../lt/README.md) | [Tiếng Mã Lai](../ms/README.md) | [Tiếng Malayalam](../ml/README.md) | [Tiếng Marathi](../mr/README.md) | [Tiếng Nepal](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Tiếng Na Uy](../no/README.md) | [Tiếng Ba Tư (Farsi)](../fa/README.md) | [Tiếng Ba Lan](../pl/README.md) | [Tiếng Bồ Đào Nha (Brazil)](../br/README.md) | [Tiếng Bồ Đào Nha (Portugal)](../pt/README.md) | [Tiếng Punjabi (Gurmukhi)](../pa/README.md) | [Tiếng Romania](../ro/README.md) | [Tiếng Nga](../ru/README.md) | [Tiếng Serbia (Chữ Cyrillic)](../sr/README.md) | [Tiếng Slovak](../sk/README.md) | [Tiếng Slovenia](../sl/README.md) | [Tiếng Tây Ban Nha](../es/README.md) | [Tiếng Swahili](../sw/README.md) | [Tiếng Thụy Điển](../sv/README.md) | [Tiếng Tagalog (Filipino)](../tl/README.md) | [Tiếng Tamil](../ta/README.md) | [Tiếng Telugu](../te/README.md) | [Tiếng Thái](../th/README.md) | [Tiếng Thổ Nhĩ Kỳ](../tr/README.md) | [Tiếng Ukraina](../uk/README.md) | [Tiếng Urdu](../ur/README.md) | [Tiếng Việt](./README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Tổng quan Khóa học

Thành thạo Azure Developer CLI (azd) thông qua các chương học có cấu trúc thiết kế theo mức độ tiến bộ. **Tập trung đặc biệt vào triển khai ứng dụng AI với tích hợp Microsoft Foundry.**

### Tại sao Khóa học này cần thiết cho Các nhà phát triển hiện đại

Dựa trên nhận định từ cộng đồng Microsoft Foundry trên Discord, **45% nhà phát triển muốn sử dụng AZD cho khối lượng công việc AI** nhưng gặp các thách thức với:
- Kiến trúc AI phức tạp gồm nhiều dịch vụ
- Thực hành tốt nhất cho triển khai AI vào production  
- Tích hợp và cấu hình dịch vụ Azure AI
- Tối ưu chi phí cho khối lượng công việc AI
- Xử lý sự cố triển khai đặc thù cho AI

### Mục tiêu học tập

Sau khi hoàn thành khóa học có cấu trúc này, bạn sẽ:
- **Thành thạo các kiến thức cơ bản về AZD**: Các khái niệm lõi, cài đặt và cấu hình
- **Triển khai ứng dụng AI**: Sử dụng AZD với dịch vụ Microsoft Foundry
- **Thực hiện Hạ tầng dưới dạng Mã**: Quản lý tài nguyên Azure bằng mẫu Bicep
- **Xử lý sự cố triển khai**: Giải quyết các vấn đề phổ biến và gỡ lỗi
- **Tối ưu cho môi trường production**: Bảo mật, mở rộng, giám sát và quản lý chi phí
- **Xây dựng giải pháp đa-tác nhân**: Triển khai các kiến trúc AI phức tạp

## 📚 Các chương học

*Chọn lộ trình học dựa trên trình độ và mục tiêu của bạn*

### 🚀 Chương 1: Nền tảng & Bắt đầu Nhanh
**Yêu cầu trước**: Azure subscription, kiến thức cơ bản về dòng lệnh  
**Thời lượng**: 30-45 phút  
**Mức độ phức tạp**: ⭐

#### Những gì bạn sẽ học
- Hiểu các khái niệm cơ bản về Azure Developer CLI
- Cài đặt AZD trên nền tảng của bạn
- Triển khai thành công lần đầu tiên

#### Tài nguyên học tập
- **🎯 Bắt đầu tại đây**: [Azure Developer CLI là gì?](../..)
- **📖 Lý thuyết**: [Các khái niệm cơ bản về AZD](docs/getting-started/azd-basics.md) - Các khái niệm lõi và thuật ngữ
- **⚙️ Thiết lập**: [Cài đặt & Thiết lập](docs/getting-started/installation.md) - Hướng dẫn theo nền tảng
- **🛠️ Thực hành**: [Dự án đầu tiên của bạn](docs/getting-started/first-project.md) - Hướng dẫn từng bước
- **📋 Tham khảo nhanh**: [Bảng tổng hợp lệnh](resources/cheat-sheet.md)

#### Bài tập thực hành
```bash
# Kiểm tra cài đặt nhanh
azd version

# Triển khai ứng dụng đầu tiên của bạn
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kết quả chương học**: Triển khai thành công một ứng dụng web đơn giản lên Azure bằng AZD

**✅ Tiêu chí xác nhận thành công:**
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
**📈 Trình độ sau khi hoàn thành:** Có thể tự triển khai các ứng dụng cơ bản

**✅ Tiêu chí xác nhận thành công:**
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
**📈 Trình độ sau khi hoàn thành:** Có thể tự triển khai các ứng dụng cơ bản

---

### 🤖 Chương 2: Phát triển Ưu tiên AI (Khuyến nghị cho Nhà phát triển AI)
**Yêu cầu trước**: Hoàn thành Chương 1  
**Thời lượng**: 1-2 giờ  
**Mức độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Tích hợp Microsoft Foundry với AZD
- Triển khai các ứng dụng được hỗ trợ bởi AI
- Hiểu cấu hình dịch vụ AI

#### Tài nguyên học tập
- **🎯 Bắt đầu tại đây**: [Tích hợp Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mẫu**: [Triển khai mô hình AI](docs/microsoft-foundry/ai-model-deployment.md) - Triển khai và quản lý mô hình AI
- **🛠️ Xưởng thực hành**: [Phòng thí nghiệm Workshop AI](docs/microsoft-foundry/ai-workshop-lab.md) - Chuẩn bị giải pháp AI để sử dụng với AZD
- **🎥 Hướng dẫn tương tác**: [Tài liệu Workshop](workshop/README.md) - Học qua trình duyệt với MkDocs * DevContainer Environment
- **📋 Mẫu**: [Mẫu Microsoft Foundry](../..)
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

**💡 Kết quả chương học**: Triển khai và cấu hình một ứng dụng chat được hỗ trợ bởi AI với khả năng RAG

**✅ Tiêu chí xác nhận thành công:**
```bash
# Sau Chương 2, bạn sẽ có thể:
azd init --template azure-search-openai-demo
azd up
# Kiểm tra giao diện trò chuyện AI
# Đặt câu hỏi và nhận các câu trả lời do AI cung cấp kèm nguồn
# Xác minh tích hợp tìm kiếm hoạt động
azd monitor  # Kiểm tra Application Insights hiển thị dữ liệu telemetri
azd down --force --purge
```

**📊 Thời gian đầu tư:** 1-2 giờ  
**📈 Trình độ sau khi hoàn thành:** Có thể triển khai và cấu hình các ứng dụng AI sẵn sàng cho production  
**💰 Nhận thức về chi phí:** Hiểu chi phí phát triển khoảng $80-150/tháng, chi phí production $300-3500/tháng

#### 💰 Cân nhắc chi phí cho triển khai AI

**Môi trường phát triển (Ước tính $80-150/tháng):**
- Azure OpenAI (Trả theo mức sử dụng): $0-50/tháng (tùy theo lượng token)
- AI Search (Hạng cơ bản): $75/tháng
- Container Apps (Tiêu thụ): $0-20/tháng
- Storage (Chuẩn): $1-5/tháng

**Môi trường production (Ước tính $300-3,500+/tháng):**
- Azure OpenAI (PTU cho hiệu năng ổn định): $3,000+/tháng HOẶC Trả theo mức sử dụng với lưu lượng lớn
- AI Search (Hạng chuẩn): $250/tháng
- Container Apps (Dành riêng): $50-100/tháng
- Application Insights: $5-50/tháng
- Storage (Cao cấp): $10-50/tháng

**💡 Mẹo tối ưu chi phí:**
- Sử dụng **Free Tier** của Azure OpenAI để học (bao gồm 50.000 tokens/tháng)
- Chạy `azd down` để giải phóng tài nguyên khi không phát triển tích cực
- Bắt đầu với thanh toán theo mức tiêu thụ, chỉ nâng cấp lên PTU khi vào production
- Sử dụng `azd provision --preview` để ước tính chi phí trước khi triển khai
- Bật auto-scaling: chỉ trả cho lượng sử dụng thực tế

**Giám sát chi phí:**
```bash
# Kiểm tra chi phí ước tính hàng tháng
azd provision --preview

# Theo dõi chi phí thực tế trên Cổng Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chương 3: Cấu hình & Xác thực
**Yêu cầu trước**: Hoàn thành Chương 1  
**Thời lượng**: 45-60 phút  
**Mức độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Cấu hình và quản lý môi trường
- Xác thực và các thực hành bảo mật tốt nhất
- Đặt tên tài nguyên và tổ chức

#### Tài nguyên học tập
- **📖 Cấu hình**: [Hướng dẫn cấu hình](docs/getting-started/configuration.md) - Thiết lập môi trường
- **🔐 Bảo mật**: [Mẫu xác thực và managed identity](docs/getting-started/authsecurity.md) - Mẫu xác thực
- **📝 Ví dụ**: [Ví dụ ứng dụng cơ sở dữ liệu](examples/database-app/README.md) - Ví dụ về AZD và cơ sở dữ liệu

#### Bài tập thực hành
- Cấu hình nhiều môi trường (dev, staging, prod)
- Thiết lập xác thực bằng managed identity
- Thực hiện cấu hình theo từng môi trường

**💡 Kết quả chương học**: Quản lý nhiều môi trường với xác thực và bảo mật đúng cách

---

### 🏗️ Chương 4: Hạ tầng Dưới dạng Mã & Triển khai
**Yêu cầu trước**: Hoàn thành các chương 1-3  
**Thời lượng**: 1-1.5 giờ  
**Mức độ phức tạp**: ⭐⭐⭐

#### Những gì bạn sẽ học
- Mẫu triển khai nâng cao
- Hạ tầng dưới dạng mã với Bicep
- Chiến lược cấp phát tài nguyên

#### Tài nguyên học tập
- **📖 Triển khai**: [Hướng dẫn triển khai](docs/deployment/deployment-guide.md) - Quy trình hoàn chỉnh
- **🏗️ Cấp phát**: [Cấp phát tài nguyên](docs/deployment/provisioning.md) - Quản lý tài nguyên Azure
- **📝 Ví dụ**: [Ví dụ Container App](../../examples/container-app) - Triển khai container hóa

#### Bài tập thực hành
- Tạo mẫu Bicep tùy chỉnh
- Triển khai ứng dụng nhiều dịch vụ
- Thực hiện chiến lược triển khai blue-green

**💡 Kết quả chương học**: Triển khai các ứng dụng đa dịch vụ phức tạp sử dụng mẫu hạ tầng tùy chỉnh

---

### 🎯 Chương 5: Giải pháp AI đa-tác nhân (Nâng cao)
**Yêu cầu trước**: Hoàn thành các chương 1-2  
**Thời lượng**: 2-3 giờ  
**Mức độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Mẫu kiến trúc đa-tác nhân
- Điều phối và phối hợp giữa các tác nhân
- Triển khai AI sẵn sàng cho production

#### Tài nguyên học tập
- **🤖 Dự án nổi bật**: [Giải pháp bán lẻ đa-tác nhân](examples/retail-scenario.md) - Triển khai hoàn chỉnh
- **🛠️ Mẫu ARM**: [Gói Mẫu ARM](../../examples/retail-multiagent-arm-template) - Triển khai chỉ với một lần nhấp
- **📖 Kiến trúc**: [Các mẫu phối hợp đa tác nhân](/docs/pre-deployment/coordination-patterns.md) - Các mẫu

#### Bài Tập Thực Hành
```bash
# Triển khai giải pháp đa tác nhân bán lẻ hoàn chỉnh
cd examples/retail-multiagent-arm-template
./deploy.sh

# Khám phá cấu hình các tác nhân
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kết quả Chương**: Triển khai và quản lý một giải pháp AI đa tác nhân sẵn sàng cho môi trường sản xuất với các tác nhân Khách hàng và Tồn kho

---

### 🔍 Chương 6: Xác thực & Lập kế hoạch trước khi triển khai
**Yêu cầu tiên quyết**: Hoàn thành Chương 4  
**Thời lượng**: 1 giờ  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Lập kế hoạch năng lực và xác thực tài nguyên
- Chiến lược chọn SKU
- Kiểm tra trước khi triển khai và tự động hóa

#### Tài nguyên học tập
- **📊 Lập kế hoạch**: [Lập kế hoạch năng lực](docs/pre-deployment/capacity-planning.md) - Xác thực tài nguyên
- **💰 Lựa chọn**: [Chọn SKU](docs/pre-deployment/sku-selection.md) - Lựa chọn tiết kiệm chi phí
- **✅ Xác thực**: [Kiểm tra trước khi triển khai](docs/pre-deployment/preflight-checks.md) - Các script tự động

#### Bài tập thực hành
- Chạy các script xác thực năng lực
- Tối ưu lựa chọn SKU để tiết kiệm chi phí
- Thực hiện kiểm tra tự động trước khi triển khai

**💡 Kết quả Chương**: Xác thực và tối ưu các triển khai trước khi thực hiện

---

### 🚨 Chương 7: Xử lý sự cố & Gỡ lỗi
**Yêu cầu tiên quyết**: Hoàn thành bất kỳ chương triển khai nào  
**Thời lượng**: 1-1.5 giờ  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Các phương pháp gỡ lỗi có hệ thống
- Các vấn đề phổ biến và giải pháp
- Xử lý sự cố đặc thù cho AI

#### Tài nguyên học tập
- **🔧 Vấn đề phổ biến**: [Common Issues](docs/troubleshooting/common-issues.md) - Hỏi đáp và giải pháp
- **🕵️ Gỡ lỗi**: [Debugging Guide](docs/troubleshooting/debugging.md) - Chiến lược từng bước
- **🤖 Vấn đề AI**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Các vấn đề dịch vụ AI

#### Bài tập thực hành
- Chẩn đoán lỗi triển khai
- Giải quyết các vấn đề xác thực
- Gỡ lỗi kết nối dịch vụ AI

**💡 Kết quả Chương**: Tự chủ chẩn đoán và giải quyết các vấn đề triển khai phổ biến

---

### 🏢 Chương 8: Các mẫu cho Sản xuất & Doanh nghiệp
**Yêu cầu tiên quyết**: Đã hoàn thành Chương 1-4  
**Thời lượng**: 2-3 giờ  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Chiến lược triển khai cho môi trường sản xuất
- Các mẫu bảo mật cho doanh nghiệp
- Giám sát và tối ưu chi phí

#### Tài nguyên học tập
- **🏭 Sản xuất**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Các mẫu cho doanh nghiệp
- **📝 Ví dụ**: [Microservices Example](../../examples/microservices) - Kiến trúc phức tạp
- **📊 Giám sát**: [Tích hợp Application Insights](docs/pre-deployment/application-insights.md) - Giám sát

#### Bài tập thực hành
- Triển khai các mẫu bảo mật cho doanh nghiệp
- Thiết lập giám sát toàn diện
- Triển khai lên môi trường sản xuất với quản trị phù hợp

**💡 Kết quả Chương**: Triển khai các ứng dụng sẵn sàng cho doanh nghiệp với đầy đủ khả năng cho môi trường sản xuất

---

## 🎓 Tổng quan Hội thảo: Trải nghiệm Học tập Thực hành

> **⚠️ TRẠNG THÁI HỘI THẢO: Đang Phát triển**  
> Tài liệu hội thảo hiện đang được phát triển và hoàn thiện. Các module cốt lõi hoạt động, nhưng một số phần nâng cao chưa hoàn chỉnh. Chúng tôi đang tích cực hoàn thiện toàn bộ nội dung. [Theo dõi tiến độ →](workshop/README.md)

### Tài liệu Hội thảo Tương tác
**Học tập thực hành toàn diện với công cụ trên trình duyệt và bài tập có hướng dẫn**

Tài liệu hội thảo cung cấp một trải nghiệm học tập tương tác, có cấu trúc, bổ trợ cho chương trình theo chương nêu trên. Hội thảo được thiết kế cho cả học tự học theo tiến độ riêng và các buổi do giảng viên hướng dẫn.

#### 🛠️ Tính năng Hội thảo
- **Giao diện trên trình duyệt**: Hội thảo hoàn chỉnh chạy trên MkDocs với tính năng tìm kiếm, sao chép và chủ đề
- **Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển chỉ với một lần nhấp
- **Đường dẫn học tập có cấu trúc**: 7 bước bài tập hướng dẫn (tổng 3.5 giờ)
- **Khám phá → Triển khai → Tùy chỉnh**: Phương pháp tiếp cận theo tiến trình
- **Môi trường DevContainer tương tác**: Các công cụ và phụ thuộc được cấu hình sẵn

#### 📚 Cấu trúc Hội thảo
Hội thảo tuân theo phương pháp **Khám phá → Triển khai → Tùy chỉnh**:

1. **Giai đoạn Khám phá** (45 phút)
   - Khám phá các mẫu và dịch vụ Microsoft Foundry
   - Hiểu các mẫu kiến trúc đa tác nhân
   - Xem xét yêu cầu triển khai và các điều kiện tiên quyết

2. **Giai đoạn Triển khai** (2 giờ)
   - Triển khai thực hành các ứng dụng AI bằng AZD
   - Cấu hình dịch vụ AI Azure và các endpoint
   - Triển khai các mẫu bảo mật và xác thực

3. **Giai đoạn Tùy chỉnh** (45 phút)
   - Điều chỉnh ứng dụng cho các trường hợp sử dụng cụ thể
   - Tối ưu cho triển khai sản xuất
   - Triển khai giám sát và quản lý chi phí

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
- **Triển khai Ứng dụng AI cho Sản xuất**: Sử dụng AZD với các dịch vụ Microsoft Foundry
- **Thành thạo Kiến trúc Đa tác nhân**: Triển khai các giải pháp tác nhân AI phối hợp
- **Triển khai Các thực hành bảo mật tốt nhất**: Cấu hình xác thực và quản lý truy cập
- **Tối ưu cho Quy mô**: Thiết kế triển khai tiết kiệm chi phí và có hiệu năng
- **Xử lý sự cố Triển khai**: Giải quyết các vấn đề phổ biến một cách độc lập

#### 📖 Tài nguyên Hội thảo
- **🎥 Hướng dẫn Tương tác**: [Tài liệu Hội thảo](workshop/README.md) - Môi trường học tập trên trình duyệt
- **📋 Hướng dẫn từng bước**: [Bài tập có hướng dẫn](../../workshop/docs/instructions) - Hướng dẫn chi tiết
- **🛠️ Phòng thí nghiệm Hội thảo AI**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Bài tập tập trung vào AI
- **💡 Bắt đầu nhanh**: [Hướng dẫn thiết lập Hội thảo](workshop/README.md#quick-start) - Cấu hình môi trường

**Phù hợp cho**: Đào tạo doanh nghiệp, các khóa học đại học, tự học theo tiến độ, và bootcamp cho nhà phát triển.

---

## 📖 Azure Developer CLI là gì?

Azure Developer CLI (azd) là một giao diện dòng lệnh hướng tới nhà phát triển, giúp tăng tốc quy trình xây dựng và triển khai ứng dụng lên Azure. Nó cung cấp:

- **Triển khai dựa trên mẫu** - Sử dụng các mẫu dựng sẵn cho các mẫu ứng dụng phổ biến
- **Hạ tầng như Mã** - Quản lý tài nguyên Azure bằng Bicep hoặc Terraform  
- **Luồng công việc tích hợp** - Cung cấp, triển khai và giám sát ứng dụng một cách liền mạch
- **Thân thiện với nhà phát triển** - Tối ưu cho năng suất và trải nghiệm của nhà phát triển

### **AZD + Microsoft Foundry: Hoàn hảo cho các Triển khai AI**

**Tại sao chọn AZD cho các giải pháp AI?** AZD giải quyết những thách thức hàng đầu mà các nhà phát triển AI gặp phải:

- **Mẫu sẵn sàng cho AI** - Các mẫu đã cấu hình sẵn cho Azure OpenAI, Cognitive Services và khối lượng công việc ML
- **Triển khai AI an toàn** - Các mẫu bảo mật tích hợp cho dịch vụ AI, khóa API, và các endpoint mô hình  
- **Mẫu AI cho sản xuất** - Các thực hành tốt nhất cho triển khai ứng dụng AI có thể mở rộng và tiết kiệm chi phí
- **Luồng công việc AI đầu-cuối** - Từ phát triển mô hình đến triển khai sản xuất với giám sát thích hợp
- **Tối ưu chi phí** - Phân bổ tài nguyên thông minh và chiến lược scale cho khối lượng công việc AI
- **Tích hợp Microsoft Foundry** - Kết nối liền mạch với danh mục mô hình và các endpoint của Microsoft Foundry

---

## 🎯 Thư viện Mẫu & Ví dụ

### Nổi bật: Mẫu Microsoft Foundry
**Bắt đầu tại đây nếu bạn đang triển khai ứng dụng AI!**

> **Lưu ý:** Các mẫu này minh họa các mẫu AI khác nhau. Một số là Azure Samples bên ngoài, số khác là triển khai nội bộ.

| Mẫu | Chương | Độ phức tạp | Dịch vụ | Loại |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chương 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Bên ngoài |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chương 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Bên ngoài |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chương 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Bên ngoài |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chương 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Bên ngoài |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chương 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Bên ngoài |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chương 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Bên ngoài |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chương 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Nội bộ** |

### Nổi bật: Kịch bản học tập hoàn chỉnh
**Các mẫu ứng dụng sẵn sàng cho sản xuất được ánh xạ tới các chương học**

| Mẫu | Chương học | Độ phức tạp | Kiến thức chính |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chương 2 | ⭐ | Các mẫu triển khai AI cơ bản |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chương 2 | ⭐⭐ | Triển khai RAG với Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chương 4 | ⭐⭐ | Tích hợp Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chương 5 | ⭐⭐⭐ | Khung tác nhân và gọi hàm |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chương 8 | ⭐⭐⭐ | Điều phối AI cấp doanh nghiệp |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chương 5 | ⭐⭐⭐⭐ | Kiến trúc đa tác nhân với tác nhân Khách hàng và Tồn kho |

### Loại Ví dụ để Học

> **📌 Ví dụ Nội bộ vs. Bên ngoài:**  
> **Ví dụ Nội bộ** (trong repo này) = Sẵn sàng sử dụng ngay  
> **Ví dụ Bên ngoài** (Azure Samples) = Clone từ các kho liên kết

#### Ví dụ Nội bộ (Sẵn sàng sử dụng)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Triển khai hoàn chỉnh sẵn sàng cho môi trường sản xuất với các mẫu ARM
  - Kiến trúc đa tác nhân (Khách hàng + Tồn kho)
  - Giám sát và đánh giá toàn diện
  - Triển khai một lần nhấp qua mẫu ARM

#### Ví dụ Nội bộ - Ứng dụng Container (Chương 2-5)
**Các ví dụ triển khai container toàn diện trong kho này:**
- [**Container App Examples**](examples/container-app/README.md) - Hướng dẫn đầy đủ về triển khai container
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - REST API cơ bản với scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Triển khai đa dịch vụ sẵn sàng cho sản xuất
  - Bắt đầu nhanh, Sản xuất, và các mẫu triển khai nâng cao
  - Hướng dẫn giám sát, bảo mật và tối ưu chi phí

#### Ví dụ Bên ngoài - Ứng dụng đơn giản (Chương 1-2)
**Clone các kho Azure Samples này để bắt đầu:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mẫu triển khai cơ bản
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Triển khai nội dung tĩnh
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Triển khai REST API

#### Ví dụ Bên ngoài - Tích hợp cơ sở dữ liệu (Chương 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mẫu kết nối cơ sở dữ liệu
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Luồng dữ liệu không máy chủ

#### Ví dụ Bên ngoài - Mẫu nâng cao (Chương 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Kiến trúc đa dịch vụ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Xử lý nền  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Mẫu ML sẵn sàng cho sản xuất

### Bộ sưu tập Mẫu Bên ngoài
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Bộ sưu tập được tuyển chọn các mẫu chính thức và cộng đồng
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Tài liệu mẫu Microsoft Learn
- [**Examples Directory**](examples/README.md) - Ví dụ học tập nội bộ với giải thích chi tiết

---

## 📚 Tài nguyên học tập & Tham khảo

### Tham khảo nhanh
- [**Bảng tóm tắt lệnh**](resources/cheat-sheet.md) - Các lệnh azd thiết yếu được tổ chức theo chương
- [**Thuật ngữ**](resources/glossary.md) - Thuật ngữ Azure và azd  
- [**Câu hỏi thường gặp**](resources/faq.md) - Các câu hỏi thường gặp được tổ chức theo chương học
- [**Hướng dẫn học tập**](resources/study-guide.md) - Bài tập thực hành toàn diện

### Hội thảo Thực hành
- [**Phòng thí nghiệm Hội thảo AI**](docs/microsoft-foundry/ai-workshop-lab.md) - Biến giải pháp AI của bạn có thể triển khai bằng AZD (2-3 hours)
- [**Hướng dẫn Hội thảo Tương tác**](workshop/README.md) - Hội thảo trên trình duyệt với MkDocs và Môi trường DevContainer Environment
- [**Lộ trình Học tập Có cấu trúc**](../../workshop/docs/instructions) -7-step bài tập hướng dẫn (Khám phá → Triển khai → Tùy chỉnh)
- [**Hội thảo AZD cho Người mới bắt đầu**](workshop/README.md) - Tài liệu hội thảo thực hành đầy đủ với GitHub Codespaces integration

### Tài nguyên Học tập Bên ngoài
- [Tài liệu Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Trung tâm Kiến trúc Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Hướng dẫn Khắc phục Sự cố Nhanh

**Các sự cố phổ biến mà người mới gặp phải và cách giải quyết ngay lập tức:**

### ❌ "azd: command not found"

```bash
# Cài đặt AZD trước tiên
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Xác minh cài đặt
azd version
```

### ❌ "No subscription found" hoặc "Subscription not set"

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

### ❌ "InsufficientQuota" hoặc "Quota exceeded"

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

### ❌ "azd up" fails halfway through

```bash
# Tùy chọn 1: Dọn sạch và thử lại
azd down --force --purge
azd up

# Tùy chọn 2: Chỉ sửa hạ tầng
azd provision

# Tùy chọn 3: Kiểm tra nhật ký chi tiết
azd show
azd logs
```

### ❌ "Authentication failed" hoặc "Token expired"

```bash
# Xác thực lại
az logout
az login

azd auth logout
azd auth login

# Kiểm tra xác thực
az account show
```

### ❌ "Resource already exists" hoặc naming conflicts

```bash
# AZD tạo tên duy nhất, nhưng nếu xảy ra xung đột:
azd down --force --purge

# Sau đó thử lại với môi trường mới
azd env new dev-v2
azd up
```

### ❌ Template deployment taking too long

```bash
# Kiểm tra tiến độ
azd show

# Nếu bị kẹt hơn 30 phút, kiểm tra Azure Portal:
azd monitor
# Tìm các triển khai thất bại
```

### ❌ "Permission denied" hoặc "Forbidden"

```bash
# Kiểm tra vai trò Azure của bạn
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Bạn cần ít nhất vai trò "Contributor"
# Yêu cầu quản trị viên Azure của bạn cấp:
# - Contributor (cho tài nguyên)
# - User Access Administrator (cho việc gán vai trò)
```

### ❌ Can't find deployed application URL

```bash
# Hiển thị tất cả các điểm cuối dịch vụ
azd show

# Hoặc mở Azure Portal
azd monitor

# Kiểm tra dịch vụ cụ thể
azd env get-values
# Tìm các biến *_URL
```

### 📚 Tài nguyên Khắc phục Sự cố đầy đủ

- **Hướng dẫn Các Sự cố Thường gặp:** [Các Giải pháp Chi tiết](docs/troubleshooting/common-issues.md)
- **Các vấn đề liên quan đến AI:** [Khắc phục sự cố AI](docs/troubleshooting/ai-troubleshooting.md)
- **Hướng dẫn Gỡ lỗi:** [Gỡ lỗi từng bước](docs/troubleshooting/debugging.md)
- **Nhận trợ giúp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Hướng dẫn Khắc phục Sự cố Nhanh

**Các sự cố phổ biến mà người mới gặp phải và cách giải quyết ngay lập tức:**

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

# Đặt cho môi trường AZD
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
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Lựa chọn 1: Dọn dẹp và thử lại
azd down --force --purge
azd up

# Lựa chọn 2: Chỉ sửa cơ sở hạ tầng
azd provision

# Lựa chọn 3: Kiểm tra nhật ký chi tiết
azd show
azd logs
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
<summary><strong>❌ "Resource already exists" hoặc naming conflicts</strong></summary>

```bash
# AZD tạo tên duy nhất, nhưng nếu có xung đột:
azd down --force --purge

# Sau đó thử lại với môi trường mới
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Thời gian chờ thông thường:**
- Ứng dụng web đơn giản: 5-10 phút
- Ứng dụng có cơ sở dữ liệu: 10-15 phút
- Ứng dụng AI: 15-25 phút (OpenAI provisioning is slow)

```bash
# Kiểm tra tiến độ
azd show

# Nếu bị kẹt hơn 30 phút, kiểm tra Azure Portal:
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
# - Contributor (cho các tài nguyên)
# - User Access Administrator (cho việc gán vai trò)
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

### 📚 Tài nguyên Khắc phục Sự cố đầy đủ

- **Hướng dẫn Các Sự cố Thường gặp:** [Các Giải pháp Chi tiết](docs/troubleshooting/common-issues.md)
- **Các vấn đề liên quan đến AI:** [Khắc phục sự cố AI](docs/troubleshooting/ai-troubleshooting.md)
- **Hướng dẫn Gỡ lỗi:** [Gỡ lỗi từng bước](docs/troubleshooting/debugging.md)
- **Nhận trợ giúp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Hoàn thành Khóa học & Chứng nhận

### Theo dõi Tiến độ
Theo dõi tiến độ học của bạn qua từng chương:

- [ ] **Chương 1**: Nền tảng & Bắt đầu nhanh ✅
- [ ] **Chương 2**: Phát triển Ưu tiên AI ✅  
- [ ] **Chương 3**: Cấu hình & Xác thực ✅
- [ ] **Chương 4**: Hạ tầng như mã & Triển khai ✅
- [ ] **Chương 5**: Giải pháp AI Đa tác nhân ✅
- [ ] **Chương 6**: Xác thực & Lập kế hoạch Trước khi Triển khai ✅
- [ ] **Chương 7**: Khắc phục sự cố & Gỡ lỗi ✅
- [ ] **Chương 8**: Mô hình Sản xuất & Doanh nghiệp ✅

### Xác minh Kiến thức
Sau khi hoàn thành mỗi chương, xác minh kiến thức bằng cách:
1. **Bài tập thực hành**: Hoàn thành việc triển khai thực hành của chương
2. **Kiểm tra kiến thức**: Xem lại phần Câu hỏi thường gặp cho chương của bạn
3. **Thảo luận Cộng đồng**: Chia sẻ kinh nghiệm của bạn trên Azure Discord
4. **Chương tiếp theo**: Chuyển sang mức độ phức tạp tiếp theo

### Lợi ích khi Hoàn thành Khóa học
Khi hoàn thành tất cả các chương, bạn sẽ có:
- **Kinh nghiệm triển khai thực tế**: Đã triển khai các ứng dụng AI thực tế lên Azure
- **Kỹ năng chuyên nghiệp**: Khả năng triển khai sẵn sàng cho doanh nghiệp  
- **Công nhận cộng đồng**: Thành viên tích cực của cộng đồng nhà phát triển Azure
- **Thăng tiến nghề nghiệp**: Chuyên môn triển khai AZD và AI được săn đón

---

## 🤝 Cộng đồng & Hỗ trợ

### Nhận Trợ giúp & Hỗ trợ
- **Sự cố kỹ thuật**: [Báo lỗi và yêu cầu tính năng](https://github.com/microsoft/azd-for-beginners/issues)
- **Câu hỏi học tập**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Hỗ trợ dành cho AI**: Tham gia [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tài liệu**: [Tài liệu chính thức Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Những hiểu biết từ cộng đồng Microsoft Foundry Discord

**Kết quả thăm dò gần đây từ kênh #Azure:**
- **45%** nhà phát triển muốn sử dụng AZD cho khối lượng công việc AI
- **Thách thức hàng đầu**: Triển khai đa dịch vụ, quản lý thông tin xác thực, sẵn sàng cho sản xuất  
- **Yêu cầu nhiều nhất**: Mẫu dành cho AI, hướng dẫn khắc phục sự cố, các thực hành tốt nhất

**Tham gia cộng đồng của chúng tôi để:**
- Chia sẻ kinh nghiệm AZD + AI của bạn và nhận trợ giúp
- Truy cập bản xem trước sớm các mẫu AI mới
- Đóng góp vào các thực hành tốt nhất cho triển khai AI
- Ảnh hưởng đến phát triển tính năng AI + AZD trong tương lai

### Đóng góp cho Khóa học
Chúng tôi hoan nghênh các đóng góp! Vui lòng đọc [Hướng dẫn đóng góp](CONTRIBUTING.md) để biết chi tiết về:
- **Cải tiến nội dung**: Nâng cao các chương và ví dụ hiện có
- **Ví dụ mới**: Thêm các kịch bản và mẫu thực tế  
- **Dịch thuật**: Giúp duy trì hỗ trợ đa ngôn ngữ
- **Báo cáo lỗi**: Cải thiện độ chính xác và rõ ràng
- **Tiêu chuẩn cộng đồng**: Tuân theo hướng dẫn cộng đồng hòa nhập của chúng tôi

---

## 📄 Thông tin Khóa học

### Giấy phép
Dự án này được cấp phép theo Giấy phép MIT - xem tệp [LICENSE](../../LICENSE) để biết chi tiết.

### Tài nguyên Học tập Microsoft liên quan

Đội ngũ chúng tôi tạo các khóa học học tập toàn diện khác:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j cho Người mới bắt đầu](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js cho Người mới bắt đầu](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agents
[![AZD cho Người mới bắt đầu](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI cho Người mới bắt đầu](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP cho Người mới bắt đầu](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents cho Người mới bắt đầu](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Loạt AI Sinh tạo
[![AI sinh tạo cho Người mới bắt đầu](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI sinh tạo (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI sinh tạo (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI sinh tạo (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Học Cốt lõi
[![ML cho Người mới bắt đầu](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Khoa học Dữ liệu cho Người mới bắt đầu](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI cho Người mới bắt đầu](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![An ninh mạng cho Người mới bắt đầu](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Phát triển Web cho Người mới bắt đầu](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT cho Người mới bắt đầu](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Phát triển XR cho Người mới bắt đầu](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Loạt Copilot
[![Copilot cho Lập trình ghép đôi AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot cho C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Phiêu lưu Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Điều hướng Khóa học

**🚀 Sẵn sàng bắt đầu học?**

**Người mới bắt đầu**: Bắt đầu với [Chương 1: Nền tảng & Bắt đầu Nhanh](../..)  
**Nhà phát triển AI**: Chuyển đến [Chương 2: Phát triển Ưu tiên AI](../..)  
**Nhà phát triển có kinh nghiệm**: Bắt đầu với [Chương 3: Cấu hình & Xác thực](../..)

**Bước tiếp theo**: [Bắt đầu Chương 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc sai sót. Văn bản gốc bằng ngôn ngữ ban đầu nên được coi là nguồn chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng bản dịch chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ hiểu nhầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->