# AZD Dành Cho Người Mới Bắt Đầu: Đề Cương Khóa Học & Khung Học Tập

## Tổng Quan Khóa Học

Làm chủ Azure Developer CLI (azd) thông qua các chương học được thiết kế theo lộ trình học tập tiến bộ. **Tập trung đặc biệt vào triển khai ứng dụng AI với tích hợp Microsoft Foundry.**

### Tại Sao Khóa Học Này Quan Trọng Đối Với Các Nhà Phát Triển Hiện Đại

Dựa trên những thông tin từ cộng đồng Microsoft Foundry Discord, **45% nhà phát triển muốn sử dụng AZD cho các khối lượng công việc AI** nhưng gặp khó khăn với:
- Kiến trúc AI đa dịch vụ phức tạp
- Các thực hành tốt nhất để triển khai AI trong môi trường sản xuất  
- Tích hợp và cấu hình dịch vụ Azure AI
- Tối ưu hóa chi phí cho khối lượng công việc AI
- Khắc phục sự cố triển khai AI cụ thể

### Mục Tiêu Học Tập Cốt Lõi

Hoàn thành khóa học này, bạn sẽ:
- **Làm chủ các nguyên tắc cơ bản của AZD**: Khái niệm cốt lõi, cài đặt và cấu hình
- **Triển khai ứng dụng AI**: Sử dụng AZD với các dịch vụ Microsoft Foundry
- **Thực hiện Infrastructure as Code**: Quản lý tài nguyên Azure với các mẫu Bicep
- **Khắc phục sự cố triển khai**: Giải quyết các vấn đề phổ biến và gỡ lỗi
- **Tối ưu hóa cho môi trường sản xuất**: Bảo mật, mở rộng, giám sát và quản lý chi phí
- **Xây dựng giải pháp đa tác nhân**: Triển khai kiến trúc AI phức tạp

## 🎓 Trải Nghiệm Học Tập Trong Workshop

### Các Tùy Chọn Học Tập Linh Hoạt
Khóa học này được thiết kế để hỗ trợ cả **học tập cá nhân tự định hướng** và **các buổi workshop có người hướng dẫn**, giúp người học có cơ hội thực hành với AZD trong khi phát triển kỹ năng thông qua các bài tập tương tác.

#### 🚀 Chế Độ Học Tự Định Hướng
**Hoàn hảo cho các nhà phát triển cá nhân và học tập liên tục**

**Tính năng:**
- **Giao diện dựa trên trình duyệt**: Workshop được hỗ trợ bởi MkDocs, có thể truy cập qua bất kỳ trình duyệt web nào
- **Tích hợp GitHub Codespaces**: Môi trường phát triển chỉ với một cú nhấp chuột, với các công cụ được cấu hình sẵn
- **Môi trường DevContainer tương tác**: Không cần thiết lập cục bộ - bắt đầu mã hóa ngay lập tức
- **Theo dõi tiến độ**: Các điểm kiểm tra và bài tập xác thực tích hợp sẵn
- **Hỗ trợ cộng đồng**: Truy cập các kênh Discord của Azure để đặt câu hỏi và hợp tác

**Cấu trúc học tập:**
- **Thời gian linh hoạt**: Hoàn thành các chương học theo tốc độ của bạn trong vài ngày hoặc vài tuần
- **Hệ thống điểm kiểm tra**: Xác thực kiến thức trước khi tiến tới các chủ đề phức tạp hơn
- **Thư viện tài nguyên**: Tài liệu toàn diện, ví dụ và hướng dẫn khắc phục sự cố
- **Phát triển danh mục đầu tư**: Xây dựng các dự án có thể triển khai cho danh mục chuyên nghiệp

**Bắt Đầu (Học Tự Định Hướng):**
```bash
# Tùy chọn 1: GitHub Codespaces (Khuyến nghị)
# Điều hướng đến kho lưu trữ và nhấp vào "Code" → "Create codespace on main"

# Tùy chọn 2: Phát triển cục bộ
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Làm theo hướng dẫn thiết lập trong workshop/README.md
```

#### 🏛️ Các Buổi Workshop Có Người Hướng Dẫn
**Lý tưởng cho đào tạo doanh nghiệp, bootcamp và các tổ chức giáo dục**

**Các Tùy Chọn Định Dạng Workshop:**

**📚 Tích Hợp Khóa Học Học Thuật (8-12 tuần)**
- **Chương trình đại học**: Khóa học kéo dài một học kỳ với các buổi học hàng tuần kéo dài 2 giờ
- **Định dạng Bootcamp**: Chương trình chuyên sâu kéo dài 3-5 ngày với các buổi học hàng ngày từ 6-8 giờ
- **Đào tạo doanh nghiệp**: Các buổi học nhóm hàng tháng với triển khai dự án thực tế
- **Khung đánh giá**: Bài tập được chấm điểm, đánh giá đồng nghiệp và dự án cuối khóa

**🚀 Workshop Chuyên Sâu (1-3 ngày)**
- **Ngày 1**: Nền tảng + Phát triển AI (Chương 1-2) - 6 giờ
- **Ngày 2**: Cấu hình + Hạ tầng (Chương 3-4) - 6 giờ  
- **Ngày 3**: Mẫu nâng cao + Sản xuất (Chương 5-8) - 8 giờ
- **Theo dõi**: Tùy chọn cố vấn 2 tuần để hoàn thành dự án

**⚡ Tóm Tắt Dành Cho Lãnh Đạo (4-6 giờ)**
- **Tổng quan chiến lược**: Giá trị của AZD và tác động kinh doanh (1 giờ)
- **Demo thực hành**: Triển khai ứng dụng AI từ đầu đến cuối (2 giờ)
- **Xem xét kiến trúc**: Các mẫu doanh nghiệp và quản trị (1 giờ)
- **Lập kế hoạch triển khai**: Chiến lược áp dụng trong tổ chức (1-2 giờ)

#### 🛠️ Phương Pháp Học Tập Trong Workshop
**Khám phá → Triển khai → Tùy chỉnh để phát triển kỹ năng thực hành**

**Giai đoạn 1: Khám phá (45 phút)**
- **Khám phá mẫu**: Đánh giá các mẫu và dịch vụ Azure AI Foundry
- **Phân tích kiến trúc**: Hiểu các mẫu đa tác nhân và chiến lược triển khai
- **Đánh giá yêu cầu**: Xác định nhu cầu và hạn chế của tổ chức
- **Thiết lập môi trường**: Cấu hình môi trường phát triển và tài nguyên Azure

**Giai đoạn 2: Triển khai (2 giờ)**
- **Hướng dẫn thực hiện**: Triển khai từng bước ứng dụng AI với AZD
- **Cấu hình dịch vụ**: Cấu hình các dịch vụ Azure AI, điểm cuối và xác thực
- **Thực hiện bảo mật**: Áp dụng các mẫu bảo mật doanh nghiệp và kiểm soát truy cập
- **Kiểm tra xác thực**: Xác minh triển khai và khắc phục các vấn đề phổ biến

**Giai đoạn 3: Tùy chỉnh (45 phút)**
- **Sửa đổi ứng dụng**: Điều chỉnh mẫu cho các trường hợp sử dụng và yêu cầu cụ thể
- **Tối ưu hóa sản xuất**: Thực hiện chiến lược giám sát, quản lý chi phí và mở rộng
- **Mẫu nâng cao**: Khám phá sự phối hợp đa tác nhân và kiến trúc phức tạp
- **Lập kế hoạch bước tiếp theo**: Xác định lộ trình học tập để phát triển kỹ năng liên tục

#### 🎯 Kết Quả Học Tập Trong Workshop
**Kỹ năng đo lường được phát triển thông qua thực hành**

**Năng lực kỹ thuật:**
- **Triển khai ứng dụng AI trong sản xuất**: Triển khai và cấu hình thành công các giải pháp hỗ trợ AI
- **Làm chủ Infrastructure as Code**: Tạo và quản lý các mẫu Bicep tùy chỉnh
- **Kiến trúc đa tác nhân**: Thực hiện các giải pháp AI phối hợp tác nhân
- **Sẵn sàng sản xuất**: Áp dụng các mẫu bảo mật, giám sát và quản trị
- **Chuyên môn khắc phục sự cố**: Tự giải quyết các vấn đề triển khai và cấu hình

**Kỹ năng chuyên nghiệp:**
- **Lãnh đạo dự án**: Dẫn dắt các nhóm kỹ thuật trong các sáng kiến triển khai đám mây
- **Thiết kế kiến trúc**: Thiết kế các giải pháp Azure có khả năng mở rộng và tối ưu chi phí
- **Chuyển giao kiến thức**: Đào tạo và cố vấn đồng nghiệp về các thực hành tốt nhất của AZD
- **Lập kế hoạch chiến lược**: Ảnh hưởng đến chiến lược áp dụng đám mây của tổ chức

#### 📋 Tài Nguyên Và Vật Liệu Workshop
**Bộ công cụ toàn diện cho người hướng dẫn và người học**

**Dành cho Người Hướng Dẫn:**
- **Hướng dẫn giảng viên**: [Hướng dẫn tổ chức workshop](workshop/docs/instructor-guide.md) - Lập kế hoạch và mẹo triển khai buổi học
- **Tài liệu trình bày**: Slide, sơ đồ kiến trúc và kịch bản demo
- **Công cụ đánh giá**: Bài tập thực hành, kiểm tra kiến thức và tiêu chí đánh giá
- **Thiết lập kỹ thuật**: Cấu hình môi trường, hướng dẫn khắc phục sự cố và kế hoạch dự phòng

**Dành cho Người Học:**
- **Môi trường workshop tương tác**: [Tài liệu workshop](workshop/README.md) - Nền tảng học tập dựa trên trình duyệt
- **Hướng dẫn từng bước**: [Bài tập hướng dẫn](../../workshop/docs/instructions) - Hướng dẫn triển khai chi tiết  
- **Tài liệu tham khảo**: [Phòng thí nghiệm AI Workshop](docs/ai-foundry/ai-workshop-lab.md) - Phân tích chuyên sâu tập trung vào AI
- **Tài nguyên cộng đồng**: Các kênh Discord của Azure, thảo luận trên GitHub và hỗ trợ từ chuyên gia

#### 🏢 Triển Khai Workshop Trong Doanh Nghiệp
**Chiến lược triển khai và đào tạo trong tổ chức**

**Chương trình đào tạo doanh nghiệp:**
- **Đào tạo nhân viên mới**: Định hướng nhân viên mới với các nguyên tắc cơ bản của AZD (2-4 tuần)
- **Nâng cao kỹ năng nhóm**: Workshop hàng quý cho các nhóm phát triển hiện tại (1-2 ngày)
- **Xem xét kiến trúc**: Các buổi hàng tháng dành cho kỹ sư và kiến trúc sư cấp cao (4 giờ)
- **Tóm tắt dành cho lãnh đạo**: Workshop dành cho các nhà ra quyết định kỹ thuật (nửa ngày)

**Hỗ trợ triển khai:**
- **Thiết kế workshop tùy chỉnh**: Nội dung được điều chỉnh cho các nhu cầu cụ thể của tổ chức
- **Quản lý chương trình thí điểm**: Triển khai có cấu trúc với các chỉ số thành công và vòng phản hồi  
- **Cố vấn liên tục**: Hỗ trợ sau workshop để triển khai dự án
- **Xây dựng cộng đồng**: Các cộng đồng nhà phát triển Azure AI nội bộ và chia sẻ kiến thức

**Chỉ số thành công:**
- **Tiếp thu kỹ năng**: Đánh giá trước/sau đo lường sự tăng trưởng năng lực kỹ thuật
- **Thành công triển khai**: Tỷ lệ người tham gia triển khai ứng dụng sản xuất thành công
- **Thời gian đạt năng suất**: Giảm thời gian định hướng cho các dự án Azure AI mới
- **Giữ lại kiến thức**: Đánh giá theo dõi sau 3-6 tháng workshop

## Cấu Trúc Học Tập 8 Chương

### Chương 1: Nền Tảng & Bắt Đầu Nhanh (30-45 phút) 🌱
**Yêu cầu trước**: Đăng ký Azure, kiến thức cơ bản về dòng lệnh  
**Độ phức tạp**: ⭐

#### Những Gì Bạn Sẽ Học
- Hiểu các nguyên tắc cơ bản của Azure Developer CLI
- Cài đặt AZD trên nền tảng của bạn  
- Triển khai thành công đầu tiên
- Các khái niệm và thuật ngữ cốt lõi

#### Tài Nguyên Học Tập
- [Cơ bản về AZD](docs/getting-started/azd-basics.md) - Các khái niệm cốt lõi
- [Cài đặt & Thiết lập](docs/getting-started/installation.md) - Hướng dẫn theo nền tảng
- [Dự án đầu tiên của bạn](docs/getting-started/first-project.md) - Hướng dẫn thực hành
- [Bảng tham khảo lệnh](resources/cheat-sheet.md) - Tham khảo nhanh

#### Kết Quả Thực Hành
Triển khai thành công một ứng dụng web đơn giản lên Azure bằng AZD

---

### Chương 2: Phát Triển Ưu Tiên AI (1-2 giờ) 🤖
**Yêu cầu trước**: Hoàn thành Chương 1  
**Độ phức tạp**: ⭐⭐

#### Những Gì Bạn Sẽ Học
- Tích hợp Microsoft Foundry với AZD
- Triển khai ứng dụng hỗ trợ AI
- Hiểu cấu hình dịch vụ AI
- Các mẫu RAG (Retrieval-Augmented Generation)

#### Tài Nguyên Học Tập
- [Tích hợp Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [Triển khai mô hình AI](docs/microsoft-foundry/ai-model-deployment.md)
- [Phòng thí nghiệm AI Workshop](docs/microsoft-foundry/ai-workshop-lab.md) - **MỚI**: Phòng thí nghiệm thực hành toàn diện 2-3 giờ
- [Hướng dẫn Workshop Tương Tác](workshop/README.md) - **MỚI**: Workshop dựa trên trình duyệt với bản xem trước MkDocs
- [Mẫu Microsoft Foundry](README.md#featured-microsoft-foundry-templates)
- [Hướng dẫn Workshop](../../workshop/docs/instructions) - **MỚI**: Bài tập hướng dẫn từng bước

#### Kết Quả Thực Hành
Triển khai và cấu hình một ứng dụng chat hỗ trợ AI với khả năng RAG

#### Lộ Trình Học Workshop (Tăng Cường Tùy Chọn)
**Trải Nghiệm Tương Tác MỚI**: [Hướng Dẫn Workshop Hoàn Chỉnh](workshop/README.md)
1. **Khám phá** (30 phút): Lựa chọn và đánh giá mẫu
2. **Triển khai** (45 phút): Triển khai và xác thực chức năng mẫu AI  
3. **Phân tích** (30 phút): Hiểu kiến trúc và thành phần mẫu
4. **Cấu hình** (30 phút): Tùy chỉnh cài đặt và tham số
5. **Tùy chỉnh** (45 phút): Sửa đổi và lặp lại để làm cho nó phù hợp với bạn
6. **Dọn dẹp** (15 phút): Dọn dẹp tài nguyên và hiểu vòng đời
7. **Kết thúc** (15 phút): Các bước tiếp theo và lộ trình học nâng cao

---

### Chương 3: Cấu Hình & Xác Thực (45-60 phút) ⚙️
**Yêu cầu trước**: Hoàn thành Chương 1  
**Độ phức tạp**: ⭐⭐

#### Những Gì Bạn Sẽ Học
- Cấu hình và quản lý môi trường
- Các thực hành tốt nhất về xác thực và bảo mật
- Đặt tên và tổ chức tài nguyên
- Triển khai đa môi trường

#### Tài Nguyên Học Tập
- [Hướng dẫn cấu hình](docs/getting-started/configuration.md) - Thiết lập môi trường
- [Mẫu xác thực & bảo mật](docs/getting-started/authsecurity.md) - Tích hợp Managed Identity và Key Vault
- Ví dụ về triển khai đa môi trường

#### Kết Quả Thực Hành
Quản lý nhiều môi trường với xác thực và bảo mật phù hợp

---

### Chương 4: Infrastructure as Code & Triển Khai (1-1.5 giờ) 🏗️
**Yêu cầu trước**: Hoàn thành Chương 1-3  
**Độ phức tạp**: ⭐⭐⭐

#### Những Gì Bạn Sẽ Học
- Các mẫu triển khai nâng cao
- Infrastructure as Code với Bicep
- Chiến lược cung cấp tài nguyên
- Tạo mẫu tùy chỉnh

- Triển khai ứng dụng container hóa với Azure Container Apps và AZD

#### Tài Nguyên Học Tập
- [Hướng dẫn triển khai](docs/deployment/deployment-guide.md) - Quy trình hoàn chỉnh
- [Cung cấp tài nguyên](docs/deployment/provisioning.md) - Quản lý tài nguyên
- Ví dụ về container và microservices
- [Ví dụ về Container App](examples/container-app/README.md) - Bắt đầu nhanh, sản xuất và các mẫu triển khai nâng cao

#### Kết Quả Thực Hành
Triển khai các ứng dụng đa dịch vụ phức tạp bằng các mẫu hạ tầng tùy chỉnh

---

### Chương 5: Giải Pháp AI Đa Tác Nhân (2-3 giờ) 🤖🤖
**Yêu cầu trước**: Hoàn thành Chương 1-2  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những Gì Bạn Sẽ Học
- Các mẫu kiến trúc đa tác nhân
- Điều phối và phối hợp tác nhân
- Triển khai AI sẵn sàng sản xuất
- Triển khai tác nhân khách hàng và tác nhân quản lý hàng tồn kho

- Tích hợp microservices container hóa như một phần của giải pháp dựa trên tác nhân

#### Tài Nguyên Học Tập
- [Giải pháp đa tác nhân bán lẻ](examples/retail-scenario.md) - Triển khai hoàn chỉnh
- [Gói mẫu ARM](../../examples/retail-multiagent-arm-template) - Triển khai chỉ với một cú nhấp chuột
- Các mẫu phối hợp đa tác nhân
- [Ví dụ về kiến trúc microservices](../../examples/container-app/microservices) - Giao tiếp giữa các dịch vụ, nhắn tin không đồng bộ và triển khai sản xuất

#### Kết Quả Thực Hành
Triển khai và quản lý một giải pháp AI đa tác nhân sẵn sàng
Xác thực và tối ưu hóa triển khai trước khi thực hiện

---

### Chương 7: Khắc phục sự cố & Gỡ lỗi (1-1.5 giờ) 🔧
**Yêu cầu trước**: Hoàn thành bất kỳ chương triển khai nào  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Phương pháp gỡ lỗi có hệ thống
- Các vấn đề phổ biến và giải pháp
- Khắc phục sự cố liên quan đến AI
- Tối ưu hóa hiệu suất

#### Tài liệu học tập
- [Các vấn đề phổ biến](docs/troubleshooting/common-issues.md) - FAQ và giải pháp
- [Hướng dẫn gỡ lỗi](docs/troubleshooting/debugging.md) - Chiến lược từng bước
- [Khắc phục sự cố AI](docs/troubleshooting/ai-troubleshooting.md) - Các vấn đề về dịch vụ AI

#### Kết quả thực hành
Tự chẩn đoán và giải quyết các vấn đề triển khai phổ biến

---

### Chương 8: Mô hình sản xuất & doanh nghiệp (2-3 giờ) 🏢
**Yêu cầu trước**: Hoàn thành các chương 1-4  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Chiến lược triển khai sản xuất
- Mô hình bảo mật doanh nghiệp
- Giám sát và tối ưu hóa chi phí
- Khả năng mở rộng và quản trị

- Các phương pháp tốt nhất để triển khai ứng dụng container trong môi trường sản xuất (bảo mật, giám sát, chi phí, CI/CD)

#### Tài liệu học tập
- [Các phương pháp tốt nhất về AI trong sản xuất](docs/microsoft-foundry/production-ai-practices.md) - Mô hình doanh nghiệp
- Ví dụ về microservices và doanh nghiệp
- Khung giám sát và quản trị
- [Ví dụ về kiến trúc Microservices](../../examples/container-app/microservices) - Triển khai blue-green/canary, truy vết phân tán, và tối ưu hóa chi phí

#### Kết quả thực hành
Triển khai ứng dụng sẵn sàng cho doanh nghiệp với đầy đủ khả năng sản xuất

---

## Tiến trình học tập và độ phức tạp

### Xây dựng kỹ năng theo cấp độ

- **🌱 Người mới bắt đầu**: Bắt đầu với Chương 1 (Nền tảng) → Chương 2 (Phát triển AI)
- **🔧 Trung cấp**: Các chương 3-4 (Cấu hình & Hạ tầng) → Chương 6 (Xác thực)
- **🚀 Nâng cao**: Chương 5 (Giải pháp đa tác nhân) → Chương 7 (Khắc phục sự cố)
- **🏢 Doanh nghiệp**: Hoàn thành tất cả các chương, tập trung vào Chương 8 (Mô hình sản xuất)

- **Lộ trình ứng dụng container**: Các chương 4 (Triển khai container), 5 (Tích hợp microservices), 8 (Các phương pháp tốt nhất trong sản xuất)

### Chỉ số độ phức tạp

- **⭐ Cơ bản**: Khái niệm đơn lẻ, hướng dẫn từng bước, 30-60 phút
- **⭐⭐ Trung cấp**: Nhiều khái niệm, thực hành thực tế, 1-2 giờ  
- **⭐⭐⭐ Nâng cao**: Kiến trúc phức tạp, giải pháp tùy chỉnh, 1-3 giờ
- **⭐⭐⭐⭐ Chuyên gia**: Hệ thống sản xuất, mô hình doanh nghiệp, 2-4 giờ

### Lộ trình học tập linh hoạt

#### 🎯 Lộ trình nhanh dành cho nhà phát triển AI (4-6 giờ)
1. **Chương 1**: Nền tảng & Bắt đầu nhanh (45 phút)
2. **Chương 2**: Phát triển AI-First (2 giờ)  
3. **Chương 5**: Giải pháp AI đa tác nhân (3 giờ)
4. **Chương 8**: Các phương pháp tốt nhất về AI trong sản xuất (1 giờ)

#### 🛠️ Lộ trình chuyên gia hạ tầng (5-7 giờ)
1. **Chương 1**: Nền tảng & Bắt đầu nhanh (45 phút)
2. **Chương 3**: Cấu hình & Xác thực (1 giờ)
3. **Chương 4**: Hạ tầng dưới dạng mã & Triển khai (1.5 giờ)
4. **Chương 6**: Xác thực & Lập kế hoạch trước triển khai (1 giờ)
5. **Chương 7**: Khắc phục sự cố & Gỡ lỗi (1.5 giờ)
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
- ✅ Thực hiện lập kế hoạch dung lượng và tối ưu hóa chi phí
- ✅ Áp dụng xác thực tự động trước triển khai

#### Hoàn thành Chương 7-8 (Khắc phục sự cố + Sản xuất)
- ✅ Gỡ lỗi và giải quyết các vấn đề triển khai một cách độc lập  
- ✅ Áp dụng các mô hình giám sát và bảo mật cấp doanh nghiệp
- ✅ Triển khai ứng dụng sẵn sàng sản xuất với quản trị

### Chứng nhận và công nhận
- **Huy hiệu hoàn thành khóa học**: Hoàn thành tất cả 8 chương với xác thực thực hành
- **Công nhận cộng đồng**: Tham gia tích cực trong Discord của Microsoft Foundry
- **Phát triển chuyên môn**: Kỹ năng triển khai AZD và AI phù hợp với ngành
- **Thăng tiến sự nghiệp**: Khả năng triển khai đám mây sẵn sàng cho doanh nghiệp

## 🎓 Kết quả học tập toàn diện

### Cấp độ nền tảng (Chương 1-2)
Sau khi hoàn thành các chương nền tảng, người học sẽ thể hiện:

**Khả năng kỹ thuật:**
- Triển khai ứng dụng web đơn giản lên Azure bằng lệnh AZD
- Cấu hình và triển khai ứng dụng chat tích hợp AI với khả năng RAG
- Hiểu các khái niệm cốt lõi của AZD: mẫu, môi trường, quy trình cung cấp
- Tích hợp dịch vụ Microsoft Foundry với triển khai AZD
- Điều hướng cấu hình dịch vụ AI của Azure và điểm cuối API

**Kỹ năng chuyên môn:**
- Thực hiện quy trình triển khai có cấu trúc để đạt kết quả nhất quán
- Khắc phục các vấn đề triển khai cơ bản bằng cách sử dụng nhật ký và tài liệu
- Giao tiếp hiệu quả về quy trình triển khai đám mây
- Áp dụng các phương pháp tốt nhất để tích hợp dịch vụ AI an toàn

**Xác thực học tập:**
- ✅ Triển khai thành công mẫu `todo-nodejs-mongo`
- ✅ Triển khai và cấu hình `azure-search-openai-demo` với RAG
- ✅ Hoàn thành các bài tập hội thảo tương tác (Giai đoạn khám phá)
- ✅ Tham gia thảo luận cộng đồng trên Discord của Azure

### Cấp độ trung cấp (Chương 3-4)
Sau khi hoàn thành các chương trung cấp, người học sẽ thể hiện:

**Khả năng kỹ thuật:**
- Quản lý triển khai đa môi trường (dev, staging, production)
- Tạo mẫu Bicep tùy chỉnh cho hạ tầng dưới dạng mã
- Áp dụng các mô hình xác thực bảo mật với danh tính được quản lý
- Triển khai ứng dụng đa dịch vụ phức tạp với cấu hình tùy chỉnh
- Tối ưu hóa chiến lược cung cấp tài nguyên cho chi phí và hiệu suất

**Kỹ năng chuyên môn:**
- Thiết kế kiến trúc hạ tầng có khả năng mở rộng
- Áp dụng các phương pháp bảo mật tốt nhất cho triển khai đám mây
- Tài liệu hóa các mô hình hạ tầng để hợp tác nhóm
- Đánh giá và chọn các dịch vụ Azure phù hợp với yêu cầu

**Xác thực học tập:**
- ✅ Cấu hình các môi trường riêng biệt với cài đặt cụ thể cho từng môi trường
- ✅ Tạo và triển khai mẫu Bicep tùy chỉnh cho ứng dụng đa dịch vụ
- ✅ Áp dụng xác thực danh tính được quản lý để truy cập an toàn
- ✅ Hoàn thành các bài tập quản lý cấu hình với các tình huống thực tế

### Cấp độ nâng cao (Chương 5-6)
Sau khi hoàn thành các chương nâng cao, người học sẽ thể hiện:

**Khả năng kỹ thuật:**
- Triển khai và điều phối các giải pháp AI đa tác nhân với quy trình phối hợp
- Áp dụng kiến trúc tác nhân Khách hàng và Hàng tồn kho cho các tình huống bán lẻ
- Thực hiện lập kế hoạch dung lượng toàn diện và xác thực tài nguyên
- Thực hiện xác thực tự động trước triển khai và tối ưu hóa
- Thiết kế lựa chọn SKU hiệu quả về chi phí dựa trên yêu cầu công việc

**Kỹ năng chuyên môn:**
- Kiến trúc các giải pháp AI phức tạp cho môi trường sản xuất
- Dẫn dắt các cuộc thảo luận kỹ thuật về chiến lược triển khai AI
- Hướng dẫn các nhà phát triển trẻ về các phương pháp tốt nhất triển khai AZD và AI
- Đánh giá và đề xuất các mô hình kiến trúc AI phù hợp với yêu cầu kinh doanh

**Xác thực học tập:**
- ✅ Triển khai giải pháp bán lẻ đa tác nhân hoàn chỉnh với mẫu ARM
- ✅ Chứng minh sự phối hợp tác nhân và điều phối quy trình làm việc
- ✅ Hoàn thành các bài tập lập kế hoạch dung lượng với các ràng buộc tài nguyên thực tế
- ✅ Xác thực sự sẵn sàng triển khai thông qua các kiểm tra trước tự động

### Cấp độ chuyên gia (Chương 7-8)
Sau khi hoàn thành các chương chuyên gia, người học sẽ thể hiện:

**Khả năng kỹ thuật:**
- Chẩn đoán và giải quyết các vấn đề triển khai phức tạp một cách độc lập
- Áp dụng các mô hình bảo mật cấp doanh nghiệp và khung quản trị
- Thiết kế chiến lược giám sát và cảnh báo toàn diện
- Tối ưu hóa triển khai sản xuất cho quy mô, chi phí và hiệu suất
- Thiết lập các pipeline CI/CD với kiểm tra và xác thực phù hợp

**Kỹ năng chuyên môn:**
- Dẫn dắt các sáng kiến chuyển đổi đám mây doanh nghiệp
- Thiết kế và thực hiện các tiêu chuẩn triển khai tổ chức
- Đào tạo và hướng dẫn các nhóm phát triển về các thực hành AZD nâng cao
- Ảnh hưởng đến việc ra quyết định kỹ thuật cho các triển khai AI doanh nghiệp

**Xác thực học tập:**
- ✅ Giải quyết các lỗi triển khai đa dịch vụ phức tạp
- ✅ Áp dụng các mô hình bảo mật doanh nghiệp với yêu cầu tuân thủ
- ✅ Thiết kế và triển khai giám sát sản xuất với Application Insights
- ✅ Hoàn thành việc triển khai khung quản trị doanh nghiệp

## 🎯 Chứng nhận hoàn thành khóa học

### Khung theo dõi tiến trình
Theo dõi tiến trình học tập của bạn thông qua các điểm kiểm tra có cấu trúc:

- [ ] **Chương 1**: Nền tảng & Bắt đầu nhanh ✅
- [ ] **Chương 2**: Phát triển AI-First ✅  
- [ ] **Chương 3**: Cấu hình & Xác thực ✅
- [ ] **Chương 4**: Hạ tầng dưới dạng mã & Triển khai ✅
- [ ] **Chương 5**: Giải pháp AI đa tác nhân ✅
- [ ] **Chương 6**: Xác thực & Lập kế hoạch trước triển khai ✅
- [ ] **Chương 7**: Khắc phục sự cố & Gỡ lỗi ✅
- [ ] **Chương 8**: Mô hình sản xuất & doanh nghiệp ✅

### Quy trình xác thực
Sau khi hoàn thành mỗi chương, xác thực kiến thức của bạn thông qua:

1. **Hoàn thành bài tập thực hành**: Triển khai các giải pháp hoạt động cho từng chương
2. **Đánh giá kiến thức**: Xem lại các phần FAQ và hoàn thành tự đánh giá
3. **Tham gia cộng đồng**: Chia sẻ kinh nghiệm và nhận phản hồi trong Discord của Azure
4. **Phát triển danh mục đầu tư**: Tài liệu hóa các triển khai và bài học đã học
5. **Đánh giá đồng nghiệp**: Hợp tác với các học viên khác trong các tình huống phức tạp

### Lợi ích hoàn thành khóa học
Sau khi hoàn thành tất cả các chương với xác thực, học viên sẽ có:

**Chuyên môn kỹ thuật:**
- **Kinh nghiệm sản xuất**: Triển khai các ứng dụng AI thực tế lên môi trường Azure
- **Kỹ năng chuyên môn**: Khả năng triển khai và khắc phục sự cố sẵn sàng cho doanh nghiệp  
- **Kiến thức kiến trúc**: Giải pháp AI đa tác nhân và các mô hình hạ tầng phức tạp
- **Thành thạo khắc phục sự cố**: Giải quyết độc lập các vấn đề triển khai và cấu hình

**Phát triển chuyên môn:**
- **Công nhận ngành**: Kỹ năng có thể xác minh trong các lĩnh vực triển khai AZD và AI có nhu cầu cao
- **Thăng tiến sự nghiệp**: Trình độ cho các vai trò kiến trúc đám mây và chuyên gia triển khai AI
- **Lãnh đạo cộng đồng**: Thành viên tích cực trong các cộng đồng nhà phát triển Azure và AI
- **Học tập liên tục**: Nền tảng cho chuyên môn hóa nâng cao của Microsoft Foundry

**Tài sản danh mục đầu tư:**
- **Các giải pháp đã triển khai**: Các ví dụ hoạt động của ứng dụng AI và mô hình hạ tầng
- **Tài liệu hóa**: Hướng dẫn triển khai toàn diện và quy trình khắc phục sự cố  
- **Đóng góp cộng đồng**: Các thảo luận, ví dụ, và cải tiến được chia sẻ với cộng đồng Azure
- **Mạng lưới chuyên nghiệp**: Kết nối với các chuyên gia Azure và thực hành triển khai AI

### Lộ trình học tập sau khóa học
Học viên tốt nghiệp được chuẩn bị cho chuyên môn hóa nâng cao trong:
- **Chuyên gia Microsoft Foundry**: Chuyên môn sâu về triển khai và điều phối mô hình AI
- **Lãnh đạo kiến trúc đám mây**: Thiết kế triển khai quy mô doanh nghiệp và quản trị
- **Lãnh đạo cộng đồng nhà phát triển**: Đóng góp vào các mẫu Azure và tài nguyên cộng đồng
- **Đào tạo doanh nghiệp**: Giảng dạy kỹ năng triển khai AZD và AI trong các tổ chức

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->