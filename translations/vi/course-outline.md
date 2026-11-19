# AZD Cho Người Mới Bắt Đầu: Đề cương Khóa học & Khung Học tập

## Tổng quan Khóa học

Làm chủ Azure Developer CLI (azd) qua các chương có cấu trúc được thiết kế để học theo tiến trình. **Tập trung đặc biệt vào triển khai ứng dụng AI với tích hợp Microsoft Foundry.**

### Tại sao Khóa học này Quan trọng với Nhà Phát triển Hiện đại

Các nhà phát triển triển khai khối lượng công việc AI thường cần hướng dẫn về:
- Kiến trúc AI nhiều dịch vụ phức tạp
- Thực tiễn tốt nhất triển khai AI trong môi trường sản xuất  
- Tích hợp và cấu hình dịch vụ AI Azure
- Tối ưu chi phí cho khối lượng công việc AI
- Xử lý sự cố những vấn đề đặc thù khi triển khai AI

### Mục tiêu Học tập Cốt lõi

Sau khi hoàn thành khóa học có cấu trúc này, bạn sẽ:
- **Làm chủ Kiến thức Cơ bản AZD**: Khái niệm core, cài đặt và cấu hình
- **Triển khai Ứng dụng AI**: Sử dụng AZD với dịch vụ Microsoft Foundry
- **Áp dụng Cơ sở Hạ tầng dưới dạng Mã**: Quản lý tài nguyên Azure với mẫu Bicep
- **Xử lý Sự cố Triển khai**: Giải quyết vấn đề phổ biến và gỡ lỗi
- **Tối ưu cho Sản xuất**: An ninh, mở rộng, giám sát, và quản lý chi phí
- **Xây dựng Giải pháp Đa Tác nhân**: Triển khai kiến trúc AI phức tạp

## 🎓 Trải nghiệm Học tập trong Hội thảo

### Các Lựa chọn Hình thức Học tập Linh hoạt
Khóa học này được thiết kế để hỗ trợ cả **học cá nhân theo tiến độ riêng** và **buổi hội thảo có người hướng dẫn**, cho phép người học trải nghiệm thực tế với AZD đồng thời phát triển kỹ năng thực tiễn qua các bài tập tương tác.

#### 🚀 Chế độ Học Tự học
**Hoàn hảo cho nhà phát triển cá nhân và học tập liên tục**

**Tính năng:**
- **Giao diện Trình duyệt**: Hoàn thành hội thảo chạy bởi MkDocs truy cập qua mọi trình duyệt web
- **Tích hợp GitHub Codespaces**: Môi trường phát triển một cú nhấp chuột với công cụ được cấu hình sẵn
- **Môi trường DevContainer Tương tác**: Không cần thiết lập cục bộ - bắt đầu code ngay lập tức
- **Theo dõi Tiến độ**: Các điểm kiểm tra và bài tập xác nhận tích hợp
- **Hỗ trợ Cộng đồng**: Truy cập các kênh Azure Discord để hỏi đáp và hợp tác

**Cấu trúc Học tập:**
- **Thời gian Linh hoạt**: Hoàn thành các chương theo tiến độ trong vài ngày hoặc tuần
- **Hệ thống Kiểm tra**: Xác nhận học tập trước khi chuyển sang chủ đề phức tạp hơn
- **Thư viện Tài nguyên**: Tài liệu đầy đủ, ví dụ, và hướng dẫn xử lý sự cố
- **Phát triển Hồ sơ**: Xây dựng dự án có thể triển khai cho hồ sơ chuyên nghiệp

**Bắt đầu (Tự học):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Buổi Hội thảo Có Hướng dẫn
**Lý tưởng cho đào tạo doanh nghiệp, bootcamps, và cơ sở giáo dục**

**Lựa chọn Hình thức Hội thảo:**

**📚 Tích hợp Khóa học Học thuật (8-12 tuần)**
- **Chương trình Đại học**: Khóa học theo học kỳ với các buổi 2 giờ mỗi tuần
- **Hình thức Bootcamp**: Chương trình chuyên sâu 3-5 ngày với các buổi 6-8 giờ mỗi ngày
- **Đào tạo Doanh nghiệp**: Buổi họp nhóm hàng tháng với triển khai dự án thực tế
- **Khung Đánh giá**: Bài tập chấm điểm, đánh giá đồng đẳng, và dự án cuối khóa

**🚀 Hội thảo Tập trung (1-3 ngày)**
- **Ngày 1**: Nền tảng + Phát triển AI (Chương 1-2) - 6 giờ
- **Ngày 2**: Cấu hình + Hạ tầng (Chương 3-4) - 6 giờ  
- **Ngày 3**: Mô hình nâng cao + Sản xuất (Chương 5-8) - 8 giờ
- **Theo dõi**: Hướng dẫn tùy chọn 2 tuần để hoàn thành dự án

**⚡ Tóm tắt Điều hành (4-6 giờ)**
- **Tổng quan Chiến lược**: Đề xuất giá trị AZD và ảnh hưởng kinh doanh (1 giờ)
- **Demo Thực hành**: Triển khai ứng dụng AI từ đầu đến cuối (2 giờ)
- **Đánh giá Kiến trúc**: Các mô hình doanh nghiệp và quản trị (1 giờ)
- **Lập Kế hoạch Triển khai**: Chiến lược chấp nhận tổ chức (1-2 giờ)

#### 🛠️ Phương pháp Học tập trong Hội thảo
**Phương pháp Khám phá → Triển khai → Tùy chỉnh để phát triển kỹ năng thực hành**

**Giai đoạn 1: Khám phá (45 phút)**
- **Khám phá Mẫu**: Đánh giá mẫu và dịch vụ Microsoft Foundry
- **Phân tích Kiến trúc**: Hiểu các mô hình đa tác nhân và chiến lược triển khai
- **Đánh giá Yêu cầu**: Xác định nhu cầu và ràng buộc tổ chức
- **Thiết lập Môi trường**: Cấu hình môi trường phát triển và tài nguyên Azure

**Giai đoạn 2: Triển khai (2 giờ)**
- **Triển khai Có Hướng dẫn**: Triển khai ứng dụng AI bằng AZD từng bước
- **Cấu hình Dịch vụ**: Cấu hình dịch vụ AI Azure, endpoint, và xác thực
- **Thực hiện An ninh**: Áp dụng mô hình bảo mật doanh nghiệp và kiểm soát truy cập
- **Kiểm tra Xác nhận**: Xác minh triển khai và xử lý sự cố phổ biến

**Giai đoạn 3: Tùy chỉnh (45 phút)**
- **Chỉnh sửa Ứng dụng**: Điều chỉnh mẫu cho các trường hợp và yêu cầu cụ thể
- **Tối ưu Sản xuất**: Triển khai giám sát, quản lý chi phí, và chiến lược mở rộng
- **Mô hình Nâng cao**: Khám phá phối hợp đa tác nhân và kiến trúc phức tạp
- **Lập Kế hoạch Tiếp theo**: Định nghĩa lộ trình học tập để phát triển kỹ năng tiếp tục

#### 🎯 Kết quả Học tập Hội thảo
**Phát triển kỹ năng đo lường qua thực hành thực tế**

**Năng lực Kỹ thuật:**
- **Triển khai Ứng dụng AI Sản xuất**: Thành công trong triển khai và cấu hình giải pháp AI
- **Thành thạo Cơ sở Hạ tầng dưới dạng Mã**: Tạo và quản lý mẫu Bicep tùy chỉnh
- **Kiến trúc Đa Tác nhân**: Triển khai giải pháp AI nhiều tác nhân phối hợp
- **Sẵn sàng Sản xuất**: Áp dụng mô hình bảo mật, giám sát, và quản trị
- **Chuyên môn Xử lý Sự cố**: Giải quyết độc lập các vấn đề triển khai và cấu hình

**Kỹ năng Chuyên nghiệp:**
- **Lãnh đạo Dự án**: Dẫn dắt nhóm kỹ thuật trong sáng kiến triển khai đám mây
- **Thiết kế Kiến trúc**: Thiết kế giải pháp Azure mở rộng, tối ưu chi phí
- **Chuyển giao Kiến thức**: Đào tạo và hướng dẫn đồng nghiệp về best practice AZD
- **Lập Kế hoạch Chiến lược**: Ảnh hưởng chiến lược chấp nhận đám mây tổ chức

#### 📋 Tài nguyên và Tài liệu Hội thảo
**Bộ công cụ toàn diện cho người dẫn và học viên**

**Dành cho Người Dẫn:**
- **Hướng dẫn Giảng viên**: [Tổng quan Hội thảo](workshop/README.md) - Kế hoạch và hướng dẫn thực hiện buổi học
- **Tài liệu Thuyết trình**: Slide, sơ đồ kiến trúc, và kịch bản demo
- **Công cụ Đánh giá**: Bài tập thực hành, kiểm tra kiến thức, và bảng đánh giá
- **Thiết lập Kỹ thuật**: Cấu hình môi trường, hướng dẫn xử lý sự cố, và kế hoạch dự phòng

**Dành cho Người Học:**
- **Môi trường Hội thảo Tương tác**: [Tài liệu Hội thảo](workshop/README.md) - Nền tảng học trực tuyến trên trình duyệt
- **Hướng dẫn Từng Bước**: [Bài tập Gắn Hướng dẫn](../../workshop/docs/instructions) - Hướng dẫn triển khai chi tiết  
- **Tài liệu Tham khảo**: [Phòng Thí nghiệm AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Nghiên cứu chuyên sâu về AI
- **Tài nguyên Cộng đồng**: Kênh Azure Discord, thảo luận GitHub và hỗ trợ chuyên gia

#### 🏢 Triển khai Hội thảo Doanh nghiệp
**Chiến lược triển khai và đào tạo tổ chức**

**Chương trình Đào tạo Doanh nghiệp:**
- **Đào tạo Nhân viên Mới**: Hướng dẫn nhân viên mới với kiến thức cơ bản AZD (2-4 tuần)
- **Nâng cao Kỹ năng Nhóm**: Hội thảo hàng quý cho đội phát triển hiện tại (1-2 ngày)
- **Đánh giá Kiến trúc**: Buổi họp hàng tháng dành cho kỹ sư cao cấp và kiến trúc sư (4 giờ)
- **Tóm tắt Lãnh đạo**: Hội thảo điều hành cho nhà quyết định kỹ thuật (nửa ngày)

**Hỗ trợ Triển khai:**
- **Thiết kế Hội thảo Tùy chỉnh**: Nội dung phù hợp nhu cầu tổ chức cụ thể
- **Quản lý Chương trình Thí điểm**: Triển khai có cấu trúc với các chỉ số thành công và phản hồi  
- **Hỗ trợ Đồng hành Liên tục**: Hỗ trợ sau hội thảo cho việc triển khai dự án
- **Xây dựng Cộng đồng**: Cộng đồng nhà phát triển Azure AI nội bộ và chia sẻ kiến thức

**Chỉ số Thành công:**
- **Tiếp thu Kỹ năng**: Đánh giá trước/sau đo lường tăng trưởng năng lực kỹ thuật
- **Thành công Triển khai**: Tỷ lệ người tham gia triển khai ứng dụng sản xuất thành công
- **Thời gian Đạt hiệu quả**: Rút ngắn thời gian hòa nhập dự án AI Azure mới
- **Duy trì Kiến thức**: Đánh giá theo dõi 3-6 tháng sau hội thảo

## Cấu trúc Học tập 8 Chương

### Chương 1: Nền tảng & Bắt đầu nhanh (30-45 phút) 🌱
**Yêu cầu trước**: Đăng ký Azure, kiến thức dòng lệnh cơ bản  
**Độ phức tạp**: ⭐

#### Những Gì Bạn Sẽ Học
- Hiểu kiến thức cơ bản Azure Developer CLI
- Cài đặt AZD trên nền tảng của bạn  
- Triển khai thành công đầu tiên
- Khái niệm và thuật ngữ cốt lõi

#### Tài nguyên Học tập
- [Kiến thức Cơ bản AZD](docs/chapter-01-foundation/azd-basics.md) - Khái niệm cốt lõi
- [Cài đặt & Thiết lập](docs/chapter-01-foundation/installation.md) - Hướng dẫn nền tảng cụ thể
- [Dự án Đầu tiên của bạn](docs/chapter-01-foundation/first-project.md) - Hướng dẫn thực hành
- [Bảng Tham khảo Lệnh](resources/cheat-sheet.md) - Tham khảo nhanh

#### Kết quả Thực tiễn
Triển khai thành công một ứng dụng web đơn giản lên Azure sử dụng AZD

---

### Chương 2: Phát triển AI-Đầu tiên (4-5 giờ bao gồm hội thảo) 🤖
**Yêu cầu trước**: Hoàn thành Chương 1  
**Độ phức tạp**: ⭐⭐

#### Những Gì Bạn Sẽ Học
- Tích hợp Microsoft Foundry với AZD
- Cài đặt gói GA `microsoft.foundry` và triển khai mã tác nhân được lưu trữ
- Kiểm thử Local Agent Inspector và tập dữ liệu/rubric đánh giá riêng
- Triển khai ứng dụng AI-powered
- Hiểu cấu hình dịch vụ AI
- Các mẫu RAG (Retrieval-Augmented Generation)

#### Tài nguyên Học tập
- [Tích hợp Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [Hướng dẫn Hosted-Agent (GA)](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) - Khởi tạo, xem `azure.yaml`, cung cấp, kiểm thử cục bộ, triển khai, đánh giá, và dọn dẹp
- [Hướng dẫn Tác nhân AI](docs/chapter-02-ai-development/agents.md)
- [Triển khai Mô hình AI](docs/chapter-02-ai-development/ai-model-deployment.md)
- [Phòng Thí nghiệm Hội thảo AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - **MỚI**: Phòng thí nghiệm thực hành chi tiết 2-3 giờ
- [Hướng dẫn Hội thảo Tương tác](workshop/README.md) - **MỚI**: Hội thảo trên trình duyệt với bản xem trước MkDocs
- [Mẫu Microsoft Foundry](README.md#featured-microsoft-foundry-templates)
- [Hướng dẫn Hội thảo](../../workshop/docs/instructions) - **MỚI**: Bài tập hướng dẫn từng bước

#### Kết quả Thực tiễn
Kiểm thử tác nhân được lưu trữ cục bộ và trong Foundry dùng gói GA, xem lại kết quả đánh giá, và phân biệt dọn dẹp dự án mới và dự án tái sử dụng. Đường dẫn RAG/hội thảo riêng xử lý cấu hình ứng dụng chat AI-powered.

#### Lộ trình Học tập Hội thảo (Tùy chọn Nâng cao)
**Trải nghiệm Tương tác MỚI**: [Hướng dẫn Hội thảo Toàn diện](workshop/README.md)
1. **Khám phá** (30 phút): Lựa chọn và đánh giá mẫu
2. **Triển khai** (45 phút): Triển khai và xác nhận chức năng mẫu AI  
3. **Phân tích** (30 phút): Hiểu kiến trúc và thành phần mẫu
4. **Cấu hình** (30 phút): Tùy chỉnh cài đặt và tham số
5. **Tùy chỉnh** (45 phút): Sửa đổi và lặp lại để phù hợp với bạn
6. **Dọn dẹp** (15 phút): Dọn dẹp tài nguyên và hiểu vòng đời
7. **Tổng kết** (15 phút): Bước tiếp theo và lộ trình học nâng cao

---

### Chương 3: Cấu hình & Xác thực (45-60 phút) ⚙️
**Yêu cầu trước**: Hoàn thành Chương 1  
**Độ phức tạp**: ⭐⭐

#### Những Gì Bạn Sẽ Học
- Cấu hình và quản lý môi trường
- Thực hành tốt về xác thực và bảo mật
- Đặt tên và tổ chức tài nguyên
- Triển khai đa môi trường

#### Tài nguyên Học tập
- [Hướng dẫn Cấu hình](docs/chapter-03-configuration/configuration.md) - Thiết lập môi trường
- [Mô hình Xác thực & Bảo mật](docs/chapter-03-configuration/authsecurity.md) - Tích hợp managed identity và Key Vault
- Ví dụ đa môi trường

#### Kết quả Thực tiễn
Quản lý nhiều môi trường với xác thực và bảo mật đúng cách

---

### Chương 4: Cơ sở Hạ tầng dưới dạng Mã & Triển khai (1-1.5 giờ) 🏗️
**Yêu cầu trước**: Hoàn thành Chương 1-3  
**Độ phức tạp**: ⭐⭐⭐

#### Những Gì Bạn Sẽ Học
- Mô hình triển khai nâng cao
- Cơ sở hạ tầng dưới dạng mã với Bicep
- Chiến lược cấp phát tài nguyên
- Tạo mẫu tùy chỉnh

- Triển khai ứng dụng chứa với Azure Container Apps và AZD

#### Tài nguyên Học tập
- [Hướng dẫn Triển khai](docs/chapter-04-infrastructure/deployment-guide.md) - Quy trình đầy đủ
- [Cấp phát Tài nguyên](docs/chapter-04-infrastructure/provisioning.md) - Quản lý tài nguyên
- Ví dụ về container và microservices
- [Ví dụ Container App](examples/container-app/README.md) - Bắt đầu nhanh, sản xuất, và mô hình nâng cao

#### Kết quả Thực tiễn
Triển khai ứng dụng đa dịch vụ phức tạp sử dụng mẫu hạ tầng tùy chỉnh

---

### Chương 5: Giải pháp AI Đa Tác nhân (2-3 giờ) 🤖🤖
**Yêu cầu trước**: Hoàn thành Chương 1-2  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những Gì Bạn Sẽ Học
- Mô hình kiến trúc đa tác nhân
- Điều phối và phối hợp tác nhân
- Triển khai AI sẵn sàng cho sản xuất
- Triển khai tác nhân Khách hàng và Quản lý hàng hóa

- Tích hợp microservices chứa như phần của giải pháp dựa trên tác nhân

#### Tài nguyên Học tập
- [Giải pháp Đa Tác nhân Bán lẻ](examples/retail-scenario.md) - Bản thiết kế kiến trúc, không phải ứng dụng hoàn chỉnh
- [Gói Mẫu ARM](../../examples/retail-multiagent-arm-template) - Sườn hạ tầng với yêu cầu triển khai
- Mô hình điều phối đa tác nhân
- [Ví dụ Kiến trúc Microservices](../../examples/container-app/microservices) - Giao tiếp dịch vụ, nhắn tin không đồng bộ, và triển khai sản xuất

#### Kết quả Thực tiễn
Thiết kế giải pháp AI đa tác nhân và xác định triển khai ứng dụng, xác thực, và công việc vận hành cần thiết ngoài cấp phát hạ tầng

---

### Chương 6: Xác nhận Trước Triển khai & Lập kế hoạch (1 giờ) 🔍
**Yêu cầu trước**: Hoàn thành Chương 4  
**Độ phức tạp**: ⭐⭐

#### Những Gì Bạn Sẽ Học
- Lập kế hoạch năng lực và xác nhận tài nguyên
- Chiến lược lựa chọn SKU
- Kiểm tra trước bay và tự động hóa
- Lập kế hoạch tối ưu hóa chi phí

#### Tài nguyên Học tập
- [Lập kế hoạch Năng lực](docs/chapter-06-pre-deployment/capacity-planning.md) - Xác nhận tài nguyên
- [Lựa chọn SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Lựa chọn tiết kiệm chi phí
- [Kiểm tra trước khi bay](docs/chapter-06-pre-deployment/preflight-checks.md) - Kịch bản tự động
- [Tích hợp Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Giám sát và khả năng quan sát
- [Mô hình phối hợp đa tác nhân](docs/chapter-06-pre-deployment/coordination-patterns.md) - Chiến lược điều phối tác nhân

#### Kết quả thực tế
Xác thực và tối ưu hóa triển khai trước khi thực thi

---

### Chương 7: Xử lý sự cố & Gỡ lỗi (1-1.5 giờ) 🔧
**Yêu cầu trước**: Hoàn thành bất kỳ chương triển khai nào  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Các phương pháp gỡ lỗi có hệ thống
- Các sự cố và giải pháp phổ biến
- Xử lý sự cố đặc thù AI
- Tối ưu hóa hiệu năng

#### Tài nguyên học tập
- [Sự cố phổ biến](docs/chapter-07-troubleshooting/common-issues.md) - Câu hỏi thường gặp và giải pháp
- [Hướng dẫn gỡ lỗi](docs/chapter-07-troubleshooting/debugging.md) - Chiến lược từng bước
- [Xử lý sự cố AI đặc thù](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Vấn đề dịch vụ AI

#### Kết quả thực tế
Tự chẩn đoán và giải quyết các vấn đề triển khai phổ biến

---

### Chương 8: Mô hình sản xuất & Doanh nghiệp (2-3 giờ) 🏢
**Yêu cầu trước**: Hoàn thành chương 1-4  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Chiến lược triển khai sản xuất
- Mô hình bảo mật doanh nghiệp
- Giám sát và tối ưu chi phí
- Khả năng mở rộng và quản trị

- Thực hành tốt nhất cho triển khai ứng dụng container sản xuất (bảo mật, giám sát, chi phí, CI/CD)

#### Tài nguyên học tập
- [Thực hành tốt nhất AI sản xuất](docs/chapter-08-production/production-ai-practices.md) - Mô hình doanh nghiệp
- Ví dụ về microservices và doanh nghiệp
- Khung giám sát và quản trị
- [Ví dụ kiến trúc Microservices](../../examples/container-app/microservices) - Triển khai xanh-lục/canary, theo dõi phân tán, tối ưu chi phí

#### Kết quả thực tế
Triển khai ứng dụng sẵn sàng doanh nghiệp với đầy đủ khả năng sản xuất

---

## Tiến trình học tập và độ phức tạp

### Xây dựng kỹ năng theo từng bước

- **🌱 Người mới bắt đầu**: Bắt đầu với Chương 1 (Nền tảng) → Chương 2 (Phát triển AI)
- **🔧 Trung cấp**: Chương 3-4 (Cấu hình & Hạ tầng) → Chương 6 (Xác thực)
- **🚀 Nâng cao**: Chương 5 (Giải pháp đa tác nhân) → Chương 7 (Xử lý sự cố)
- **🏢 Doanh nghiệp**: Hoàn thành tất cả các chương, tập trung Chương 8 (Mô hình sản xuất)

- **Lộ trình ứng dụng Container**: Chương 4 (Triển khai container), 5 (Tích hợp microservices), 8 (Thực hành tốt nhất sản xuất)

### Chỉ số độ phức tạp

- **⭐ Cơ bản**: Khái niệm đơn lẻ, hướng dẫn từng bước, 30-60 phút
- **⭐⭐ Trung cấp**: Nhiều khái niệm, thực hành thực tế, 1-2 giờ  
- **⭐⭐⭐ Nâng cao**: Kiến trúc phức tạp, giải pháp tùy chỉnh, 1-3 giờ
- **⭐⭐⭐⭐ Chuyên gia**: Hệ thống sản xuất, mô hình doanh nghiệp, 2-4 giờ

### Lộ trình học tập linh hoạt

#### 🎯 Lộ trình nhanh nhà phát triển AI (4-6 giờ)
1. **Chương 1**: Nền tảng & Bắt đầu nhanh (45 phút)
2. **Chương 2**: Phát triển AI-First (2 giờ)  
3. **Chương 5**: Giải pháp AI đa tác nhân (3 giờ)
4. **Chương 8**: Thực hành tốt nhất AI sản xuất (1 giờ)

#### 🛠️ Lộ trình chuyên gia hạ tầng (5-7 giờ)
1. **Chương 1**: Nền tảng & Bắt đầu nhanh (45 phút)
2. **Chương 3**: Cấu hình & Xác thực (1 giờ)
3. **Chương 4**: Hạ tầng dưới dạng mã & Triển khai (1.5 giờ)
4. **Chương 6**: Xác thực trước triển khai & Lập kế hoạch (1 giờ)
5. **Chương 7**: Xử lý sự cố & Gỡ lỗi (1.5 giờ)
6. **Chương 8**: Mô hình sản xuất & Doanh nghiệp (2 giờ)

#### 🎓 Hành trình học tập toàn diện (8-12 giờ)
Hoàn thành tuần tự tất cả 8 chương với thực hành và xác thực

## Khung hoàn thành khóa học

### Xác thực kiến thức
- **Điểm kiểm tra từng chương**: Bài tập thực hành với kết quả đo lường được
- **Xác minh thực hành**: Triển khai giải pháp hoạt động cho từng chương
- **Theo dõi tiến độ**: Chỉ báo trực quan và huy hiệu hoàn thành
- **Xác thực cộng đồng**: Chia sẻ kinh nghiệm trong các kênh Discord Azure

### Đánh giá kết quả học tập

#### Hoàn thành Chương 1-2 (Nền tảng + AI)
- ✅ Triển khai ứng dụng web cơ bản bằng AZD
- ✅ Triển khai ứng dụng chat AI với RAG
- ✅ Hiểu các khái niệm cốt lõi AZD và tích hợp AI

#### Hoàn thành Chương 3-4 (Cấu hình + Hạ tầng)  
- ✅ Quản lý triển khai đa môi trường
- ✅ Tạo mẫu Bicep hạ tầng tùy chỉnh
- ✅ Triển khai mô hình xác thực bảo mật

#### Hoàn thành Chương 5-6 (Đa tác nhân + Xác thực)
- ✅ Triển khai giải pháp AI đa tác nhân phức tạp
- ✅ Thực hiện lập kế hoạch công suất và tối ưu chi phí
- ✅ Triển khai xác thực tự động trước khi triển khai

#### Hoàn thành Chương 7-8 (Xử lý sự cố + Sản xuất)
- ✅ Gỡ lỗi và giải quyết sự cố triển khai độc lập  
- ✅ Thực thi giám sát và bảo mật cấp doanh nghiệp
- ✅ Triển khai ứng dụng sẵn sàng sản xuất với quản trị

### Chứng nhận và công nhận
- **Huy hiệu hoàn thành khóa học**: Hoàn thành tất cả 8 chương với xác thực thực hành
- **Công nhận cộng đồng**: Tham gia tích cực trong Microsoft Foundry Discord
- **Phát triển chuyên môn**: Kỹ năng triển khai AZD và AI có giá trị ngành
- **Thăng tiến sự nghiệp**: Năng lực triển khai đám mây chuẩn doanh nghiệp

## 🎓 Kết quả học tập toàn diện

### Cấp độ nền tảng (Chương 1-2)
Sau khi hoàn thành các chương nền tảng, học viên sẽ thể hiện:

**Năng lực kỹ thuật:**
- Triển khai ứng dụng web đơn giản lên Azure sử dụng lệnh AZD
- Cấu hình và triển khai ứng dụng chat AI với khả năng RAG
- Hiểu các khái niệm lõi của AZD: mẫu, môi trường, quy trình cung cấp
- Tích hợp dịch vụ Microsoft Foundry với triển khai AZD
- Điều hướng cấu hình dịch vụ AI Azure và điểm cuối API

**Kỹ năng chuyên nghiệp:**
- Tuân theo quy trình triển khai có cấu trúc để kết quả nhất quán
- Xử lý sự cố triển khai cơ bản bằng cách sử dụng nhật ký và tài liệu
- Giao tiếp hiệu quả về quy trình triển khai đám mây
- Áp dụng thực hành tốt nhất cho tích hợp dịch vụ AI an toàn

**Xác minh học tập:**
- ✅ Thành công triển khai mẫu `todo-nodejs-mongo`
- ✅ Triển khai và cấu hình `azure-search-openai-demo` với RAG
- ✅ Hoàn thành bài tập thực hành tương tác (giai đoạn Khám phá)
- ✅ Tham gia thảo luận cộng đồng Azure Discord

### Cấp độ trung cấp (Chương 3-4)
Sau khi hoàn thành các chương trung cấp, học viên sẽ thể hiện:

**Năng lực kỹ thuật:**
- Quản lý triển khai đa môi trường (dev, staging, production)
- Tạo mẫu Bicep tùy chỉnh cho hạ tầng như mã
- Triển khai mô hình xác thực bảo mật với danh tính được quản lý
- Triển khai ứng dụng đa dịch vụ phức tạp với cấu hình tùy chỉnh
- Tối ưu chiến lược cung cấp tài nguyên về chi phí và hiệu năng

**Kỹ năng chuyên nghiệp:**
- Thiết kế kiến trúc hạ tầng có thể mở rộng
- Thực hiện thực hành bảo mật tốt nhất cho triển khai đám mây
- Tài liệu mẫu hạ tầng để hợp tác nhóm
- Đánh giá và lựa chọn dịch vụ Azure phù hợp yêu cầu

**Xác minh học tập:**
- ✅ Cấu hình môi trường riêng biệt với cài đặt riêng môi trường
- ✅ Tạo và triển khai mẫu Bicep tùy chỉnh cho ứng dụng đa dịch vụ
- ✅ Triển khai xác thực danh tính được quản lý để truy cập an toàn
- ✅ Hoàn thành bài tập quản lý cấu hình với tình huống thực tế

### Cấp độ nâng cao (Chương 5-6)
Sau khi hoàn thành các chương nâng cao, học viên sẽ thể hiện:

**Năng lực kỹ thuật:**
- Triển khai và điều phối giải pháp AI đa tác nhân với quy trình phối hợp
- Triển khai kiến trúc tác nhân Khách hàng và Kho cho kịch bản bán lẻ
- Thực hiện lập kế hoạch công suất và xác thực tài nguyên toàn diện
- Thực hiện xác thực tự động trước triển khai và tối ưu hóa
- Thiết kế lựa chọn SKU tiết kiệm dựa trên yêu cầu khối lượng công việc

**Kỹ năng chuyên nghiệp:**
- Thiết kế kiến trúc AI phức tạp cho môi trường sản xuất
- Dẫn dắt thảo luận kỹ thuật về chiến lược triển khai AI
- Hướng dẫn lập trình viên mới về thực hành tốt nhất AZD và AI
- Đánh giá và đề xuất mô hình kiến trúc AI phù hợp yêu cầu doanh nghiệp

**Xác minh học tập:**
- ✅ Đánh giá bản thiết kế đa tác nhân bán lẻ và phân biệt hạ tầng đã cung cấp với phần ứng dụng thiếu
- ✅ Thể hiện phối hợp tác nhân và điều phối quy trình làm việc
- ✅ Hoàn thành bài tập lập kế hoạch công suất với giới hạn tài nguyên thực tế
- ✅ Xác thực sẵn sàng triển khai qua kiểm tra tự động trước khi bay

### Cấp độ chuyên gia (Chương 7-8)
Sau khi hoàn thành các chương chuyên gia, học viên sẽ thể hiện:

**Năng lực kỹ thuật:**
- Chẩn đoán và giải quyết các sự cố triển khai phức tạp độc lập
- Triển khai mô hình bảo mật và khuôn khổ quản trị cấp doanh nghiệp
- Thiết kế chiến lược giám sát và cảnh báo toàn diện
- Tối ưu triển khai sản xuất về quy mô, chi phí và hiệu suất
- Thiết lập pipeline CI/CD với kiểm thử và xác thực đầy đủ

**Kỹ năng chuyên nghiệp:**
- Dẫn dắt sáng kiến chuyển đổi đám mây doanh nghiệp
- Thiết kế và thực hiện tiêu chuẩn tổ chức về triển khai
- Đào tạo và huấn luyện nhóm phát triển về thực hành AZD nâng cao
- Ảnh hưởng đến quyết định kỹ thuật cho triển khai AI doanh nghiệp

**Xác minh học tập:**
- ✅ Giải quyết sự cố triển khai đa dịch vụ phức tạp
- ✅ Thực thi mô hình bảo mật doanh nghiệp với yêu cầu tuân thủ
- ✅ Thiết kế và triển khai giám sát sản xuất với Application Insights
- ✅ Hoàn thành thực hiện khuôn khổ quản trị doanh nghiệp

## 🎯 Chứng nhận hoàn thành khóa học

### Khung theo dõi tiến trình
Theo dõi tiến độ học tập qua các điểm kiểm tra cấu trúc:

- [ ] **Chương 1**: Nền tảng & Bắt đầu nhanh ✅
- [ ] **Chương 2**: Phát triển AI-First ✅  
- [ ] **Chương 3**: Cấu hình & Xác thực ✅
- [ ] **Chương 4**: Hạ tầng dưới dạng mã & Triển khai ✅
- [ ] **Chương 5**: Giải pháp AI đa tác nhân ✅
- [ ] **Chương 6**: Xác thực trước triển khai & Lập kế hoạch ✅
- [ ] **Chương 7**: Xử lý sự cố & Gỡ lỗi ✅
- [ ] **Chương 8**: Mô hình sản xuất & Doanh nghiệp ✅

### Quy trình xác minh
Sau khi hoàn thành mỗi chương, xác minh kiến thức bằng:

1. **Hoàn thành bài tập thực hành**: Triển khai giải pháp hoạt động cho từng chương
2. **Đánh giá kiến thức**: Xem lại phần FAQ và hoàn thành tự đánh giá
3. **Tham gia cộng đồng**: Chia sẻ kinh nghiệm và nhận phản hồi trên Azure Discord
4. **Phát triển hồ sơ năng lực**: Ghi chép triển khai và bài học kinh nghiệm
5. **Đánh giá đồng nghiệp**: Hợp tác với học viên khác trong các kịch bản phức tạp

### Lợi ích hoàn thành khóa học
Sau khi hoàn thành tất cả chương với xác minh, học viên sẽ có:

**Chuyên môn kỹ thuật:**
- **Kinh nghiệm sản xuất**: Triển khai ứng dụng AI thực tế lên môi trường Azure
- **Kỹ năng chuyên nghiệp**: Năng lực triển khai doanh nghiệp và xử lý sự cố  
- **Kiến thức kiến trúc**: Giải pháp AI đa tác nhân và mẫu hạ tầng phức tạp
- **Thành thạo xử lý sự cố**: Giải quyết sự cố triển khai và cấu hình độc lập

**Phát triển chuyên môn:**
- **Công nhận ngành**: Kỹ năng xác thực trong lĩnh vực triển khai AZD và AI rất được ưa chuộng
- **Thăng tiến nghề nghiệp**: Bằng cấp cho vai trò kiến trúc sư đám mây và chuyên gia triển khai AI
- **Lãnh đạo cộng đồng**: Thành viên tích cực trong cộng đồng nhà phát triển Azure và AI
- **Học tập liên tục**: Nền tảng cho chuyên môn hóa Microsoft Foundry nâng cao

**Tài sản hồ sơ năng lực:**
- **Giải pháp đã triển khai**: Ví dụ hoạt động về ứng dụng AI và mẫu hạ tầng
- **Tài liệu**: Hướng dẫn triển khai toàn diện và quy trình xử lý sự cố  
- **Đóng góp cộng đồng**: Thảo luận, ví dụ và cải tiến chia sẻ với cộng đồng Azure
- **Mạng chuyên nghiệp**: Kết nối với chuyên gia Azure và thực hành triển khai AI

### Lộ trình học sau khóa học
Học viên chuẩn bị cho chuyên môn nâng cao trong:
- **Chuyên gia Microsoft Foundry**: Chuyên sâu triển khai và điều phối mô hình AI
- **Lãnh đạo kiến trúc đám mây**: Thiết kế và quản trị triển khai quy mô doanh nghiệp
- **Lãnh đạo cộng đồng nhà phát triển**: Góp phần vào tài nguyên mẫu và cộng đồng Azure
- **Đào tạo doanh nghiệp**: Giảng dạy kỹ năng AZD và triển khai AI trong tổ chức

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->