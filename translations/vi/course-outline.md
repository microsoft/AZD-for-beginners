<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-18T07:34:34+00:00",
  "source_file": "course-outline.md",
  "language_code": "vi"
}
-->
## Cấu trúc học tập 8 chương

### Chương 1: Nền tảng & Bắt đầu nhanh (30-45 phút) 🌱
**Yêu cầu trước**: Đăng ký Azure, kiến thức cơ bản về dòng lệnh  
**Độ phức tạp**: ⭐

#### Những gì bạn sẽ học
- Hiểu các nguyên tắc cơ bản của Azure Developer CLI
- Cài đặt AZD trên nền tảng của bạn  
- Triển khai thành công đầu tiên
- Các khái niệm và thuật ngữ cốt lõi

#### Tài liệu học tập
- [AZD Basics](docs/getting-started/azd-basics.md) - Các khái niệm cốt lõi
- [Installation & Setup](docs/getting-started/installation.md) - Hướng dẫn theo nền tảng
- [Your First Project](docs/getting-started/first-project.md) - Hướng dẫn thực hành
- [Command Cheat Sheet](resources/cheat-sheet.md) - Tham khảo nhanh

#### Kết quả thực hành
Triển khai thành công một ứng dụng web đơn giản lên Azure bằng AZD

---

### Chương 2: Phát triển ưu tiên AI (1-2 giờ) 🤖
**Yêu cầu trước**: Hoàn thành Chương 1  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Tích hợp Azure AI Foundry với AZD
- Triển khai ứng dụng tích hợp AI
- Hiểu cấu hình dịch vụ AI
- Mô hình RAG (Retrieval-Augmented Generation)

#### Tài liệu học tập
- [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Phòng thực hành
- [Azure AI Foundry Templates](README.md#featured-azure-ai-foundry-templates)

#### Kết quả thực hành
Triển khai và cấu hình ứng dụng chat tích hợp AI với khả năng RAG

---

### Chương 3: Cấu hình & Xác thực (45-60 phút) ⚙️
**Yêu cầu trước**: Hoàn thành Chương 1  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Cấu hình và quản lý môi trường
- Các phương pháp tốt nhất về xác thực và bảo mật
- Đặt tên và tổ chức tài nguyên
- Triển khai đa môi trường

#### Tài liệu học tập
- [Configuration Guide](docs/getting-started/configuration.md) - Thiết lập môi trường
- Các mô hình bảo mật và danh tính được quản lý
- Ví dụ về triển khai đa môi trường

#### Kết quả thực hành
Quản lý nhiều môi trường với xác thực và bảo mật phù hợp

---

### Chương 4: Hạ tầng dưới dạng mã & Triển khai (1-1.5 giờ) 🏗️
**Yêu cầu trước**: Hoàn thành Chương 1-3  
**Độ phức tạp**: ⭐⭐⭐

#### Những gì bạn sẽ học
- Các mô hình triển khai nâng cao
- Hạ tầng dưới dạng mã với Bicep
- Chiến lược cung cấp tài nguyên
- Tạo mẫu tùy chỉnh

#### Tài liệu học tập
- [Deployment Guide](docs/deployment/deployment-guide.md) - Quy trình hoàn chỉnh
- [Provisioning Resources](docs/deployment/provisioning.md) - Quản lý tài nguyên
- Ví dụ về container và microservices

#### Kết quả thực hành
Triển khai ứng dụng đa dịch vụ phức tạp bằng các mẫu hạ tầng tùy chỉnh

---

### Chương 5: Giải pháp AI đa tác nhân (2-3 giờ) 🤖🤖
**Yêu cầu trước**: Hoàn thành Chương 1-2  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Các mô hình kiến trúc đa tác nhân
- Điều phối và phối hợp tác nhân
- Triển khai AI sẵn sàng cho sản xuất
- Triển khai tác nhân khách hàng và kho hàng

#### Tài liệu học tập
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Triển khai hoàn chỉnh
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - Triển khai một lần nhấp
- Các mô hình phối hợp đa tác nhân

#### Kết quả thực hành
Triển khai và quản lý giải pháp AI đa tác nhân sẵn sàng cho sản xuất

---

### Chương 6: Xác thực & Lập kế hoạch trước triển khai (1 giờ) 🔍
**Yêu cầu trước**: Hoàn thành Chương 4  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Lập kế hoạch dung lượng và xác thực tài nguyên
- Chiến lược lựa chọn SKU
- Kiểm tra trước triển khai và tự động hóa
- Lập kế hoạch tối ưu hóa chi phí

#### Tài liệu học tập
- [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Xác thực tài nguyên
- [SKU Selection](docs/pre-deployment/sku-selection.md) - Lựa chọn hiệu quả chi phí
- [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Tập lệnh tự động

#### Kết quả thực hành
Xác thực và tối ưu hóa triển khai trước khi thực hiện

---

### Chương 7: Xử lý sự cố & Gỡ lỗi (1-1.5 giờ) 🔧
**Yêu cầu trước**: Hoàn thành bất kỳ chương triển khai nào  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Các phương pháp gỡ lỗi có hệ thống
- Các vấn đề thường gặp và giải pháp
- Xử lý sự cố cụ thể cho AI
- Tối ưu hóa hiệu suất

#### Tài liệu học tập
- [Common Issues](docs/troubleshooting/common-issues.md) - FAQ và giải pháp
- [Debugging Guide](docs/troubleshooting/debugging.md) - Chiến lược từng bước
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Các vấn đề dịch vụ AI

#### Kết quả thực hành
Tự chẩn đoán và giải quyết các vấn đề triển khai phổ biến

---

### Chương 8: Mô hình sản xuất & doanh nghiệp (2-3 giờ) 🏢
**Yêu cầu trước**: Hoàn thành Chương 1-4  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Chiến lược triển khai sản xuất
- Các mô hình bảo mật doanh nghiệp
- Giám sát và tối ưu hóa chi phí
- Khả năng mở rộng và quản trị

#### Tài liệu học tập
- [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Mô hình doanh nghiệp
- Ví dụ về microservices và doanh nghiệp
- Các khung giám sát và quản trị

#### Kết quả thực hành
Triển khai ứng dụng sẵn sàng cho doanh nghiệp với đầy đủ khả năng sản xuất

---

## Tiến trình học tập và độ phức tạp

### Xây dựng kỹ năng theo cấp độ

- **🌱 Người mới bắt đầu**: Bắt đầu với Chương 1 (Nền tảng) → Chương 2 (Phát triển AI)
- **🔧 Trung cấp**: Chương 3-4 (Cấu hình & Hạ tầng) → Chương 6 (Xác thực)
- **🚀 Nâng cao**: Chương 5 (Giải pháp đa tác nhân) → Chương 7 (Xử lý sự cố)
- **🏢 Doanh nghiệp**: Hoàn thành tất cả các chương, tập trung vào Chương 8 (Mô hình sản xuất)

### Chỉ số độ phức tạp

- **⭐ Cơ bản**: Các khái niệm đơn lẻ, hướng dẫn có sẵn, 30-60 phút
- **⭐⭐ Trung cấp**: Nhiều khái niệm, thực hành thực tế, 1-2 giờ  
- **⭐⭐⭐ Nâng cao**: Kiến trúc phức tạp, giải pháp tùy chỉnh, 1-3 giờ
- **⭐⭐⭐⭐ Chuyên gia**: Hệ thống sản xuất, mô hình doanh nghiệp, 2-4 giờ

### Lộ trình học tập linh hoạt

#### 🎯 Lộ trình nhanh dành cho nhà phát triển AI (4-6 giờ)
1. **Chương 1**: Nền tảng & Bắt đầu nhanh (45 phút)
2. **Chương 2**: Phát triển ưu tiên AI (2 giờ)  
3. **Chương 5**: Giải pháp AI đa tác nhân (3 giờ)
4. **Chương 8**: Thực hành AI sản xuất (1 giờ)

#### 🛠️ Lộ trình chuyên gia hạ tầng (5-7 giờ)
1. **Chương 1**: Nền tảng & Bắt đầu nhanh (45 phút)
2. **Chương 3**: Cấu hình & Xác thực (1 giờ)
3. **Chương 4**: Hạ tầng dưới dạng mã & Triển khai (1.5 giờ)
4. **Chương 6**: Xác thực & Lập kế hoạch trước triển khai (1 giờ)
5. **Chương 7**: Xử lý sự cố & Gỡ lỗi (1.5 giờ)
6. **Chương 8**: Mô hình sản xuất & doanh nghiệp (2 giờ)

#### 🎓 Hành trình học tập hoàn chỉnh (8-12 giờ)
Hoàn thành tuần tự tất cả 8 chương với thực hành và xác thực

## Khung hoàn thành khóa học

### Xác thực kiến thức
- **Điểm kiểm tra chương**: Bài tập thực hành với kết quả đo lường được
- **Xác minh thực hành**: Triển khai các giải pháp hoạt động cho từng chương
- **Theo dõi tiến trình**: Chỉ báo trực quan và huy hiệu hoàn thành
- **Xác thực cộng đồng**: Chia sẻ kinh nghiệm trong các kênh Discord của Azure

### Đánh giá kết quả học tập

#### Hoàn thành Chương 1-2 (Nền tảng + AI)
- ✅ Triển khai ứng dụng web cơ bản bằng AZD
- ✅ Triển khai ứng dụng chat tích hợp AI với RAG
- ✅ Hiểu các khái niệm cốt lõi của AZD và tích hợp AI

#### Hoàn thành Chương 3-4 (Cấu hình + Hạ tầng)  
- ✅ Quản lý triển khai đa môi trường
- ✅ Tạo mẫu hạ tầng Bicep tùy chỉnh
- ✅ Áp dụng các mô hình xác thực bảo mật

#### Hoàn thành Chương 5-6 (Đa tác nhân + Xác thực)
- ✅ Triển khai giải pháp AI đa tác nhân phức tạp
- ✅ Lập kế hoạch dung lượng và tối ưu hóa chi phí
- ✅ Thực hiện xác thực tự động trước triển khai

#### Hoàn thành Chương 7-8 (Xử lý sự cố + Sản xuất)
- ✅ Gỡ lỗi và giải quyết vấn đề triển khai một cách độc lập  
- ✅ Áp dụng giám sát và bảo mật cấp doanh nghiệp
- ✅ Triển khai ứng dụng sẵn sàng cho sản xuất với quản trị

### Chứng nhận và công nhận
- **Huy hiệu hoàn thành khóa học**: Hoàn thành tất cả 8 chương với xác thực thực hành
- **Công nhận cộng đồng**: Tham gia tích cực trong Discord của Azure AI Foundry
- **Phát triển chuyên môn**: Kỹ năng triển khai AZD và AI phù hợp với ngành
- **Thăng tiến sự nghiệp**: Khả năng triển khai đám mây sẵn sàng cho doanh nghiệp

## Nội dung phù hợp với nhà phát triển hiện đại

### Độ sâu kỹ thuật và phạm vi
- **Tích hợp Azure OpenAI**: Bao phủ đầy đủ GPT-4o, embeddings, và triển khai đa mô hình
- **Mô hình kiến trúc AI**: Triển khai RAG, điều phối đa tác nhân, và quy trình AI sản xuất
- **Hạ tầng dưới dạng mã**: Mẫu Bicep, triển khai ARM, và cung cấp tự động
- **Sẵn sàng sản xuất**: Bảo mật, mở rộng, giám sát, tối ưu hóa chi phí, và quản trị
- **Mô hình doanh nghiệp**: Triển khai đa môi trường, tích hợp CI/CD, và khung tuân thủ

### Tập trung vào học tập thực hành
- **Tự động hóa triển khai**: Nhấn mạnh vào quy trình AZD thực hành, không lý thuyết
- **Kịch bản thực tế**: Giải pháp đa tác nhân bán lẻ hoàn chỉnh với tác nhân khách hàng và kho hàng
- **Ví dụ sản xuất**: Gói mẫu ARM, triển khai một lần nhấp, và mô hình doanh nghiệp
- **Kỹ năng xử lý sự cố**: Gỡ lỗi cụ thể cho AI, chẩn đoán đa dịch vụ, và tối ưu hóa hiệu suất
- **Liên quan đến ngành**: Dựa trên phản hồi từ cộng đồng Azure AI Foundry và yêu cầu doanh nghiệp

### Tích hợp cộng đồng và hỗ trợ
- **Tích hợp Discord**: Tham gia tích cực trong cộng đồng Azure AI Foundry và Microsoft Azure
- **Thảo luận GitHub**: Học tập và giải quyết vấn đề cùng đồng nghiệp và chuyên gia
- **Truy cập chuyên gia**: Kết nối trực tiếp với kỹ sư Microsoft và chuyên gia triển khai AI
- **Cập nhật liên tục**: Nội dung khóa học phát triển theo các cập nhật nền tảng Azure và phản hồi cộng đồng
- **Phát triển sự nghiệp**: Kỹ năng áp dụng trực tiếp vào vai trò phát triển đám mây và AI hiện đại

### Xác thực kết quả học tập
- **Kỹ năng đo lường được**: Mỗi chương bao gồm bài tập triển khai thực hành với kết quả có thể xác minh
- **Phát triển danh mục**: Hoàn thành các dự án phù hợp cho danh mục chuyên nghiệp và phỏng vấn việc làm
- **Công nhận ngành**: Kỹ năng phù hợp với nhu cầu thị trường việc làm hiện tại về AZD và triển khai AI
- **Mạng lưới chuyên nghiệp**: Truy cập cộng đồng nhà phát triển Azure để thăng tiến sự nghiệp và hợp tác

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.