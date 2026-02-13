# AZD Cho Người Mới Bắt Đầu: Đề Cương Khóa Học & Khung Học Tập

## Tổng Quan Khóa Học

Nắm vững Azure Developer CLI (azd) qua các chương được cấu trúc nhằm học tập theo trình tự. **Tập trung đặc biệt vào triển khai ứng dụng AI với tích hợp Microsoft Foundry.**

### Tại Sao Khóa Học Này Quan Trọng Với Các Nhà Phát Triển Hiện Đại

Dựa trên những hiểu biết từ cộng đồng Microsoft Foundry Discord, **45% nhà phát triển muốn sử dụng AZD cho các khối lượng công việc AI** nhưng gặp phải thách thức với:
- Kiến trúc AI đa dịch vụ phức tạp
- Thực tiễn tốt nhất trong triển khai AI sản xuất  
- Tích hợp và cấu hình dịch vụ Azure AI
- Tối ưu chi phí cho khối lượng công việc AI
- Khắc phục sự cố triển khai đặc thù AI

### Mục Tiêu Học Tập Chính

Hoàn thành khóa học được cấu trúc này, bạn sẽ:
- **Làm Chủ Kiến Thức Cơ Bản AZD**: Các khái niệm cốt lõi, cài đặt và cấu hình
- **Triển Khai Ứng Dụng AI**: Sử dụng AZD cùng các dịch vụ Microsoft Foundry
- **Triển Khai Hạ Tầng Dưới Dạng Mã**: Quản lý tài nguyên Azure bằng mẫu Bicep
- **Khắc Phục Sự Cố Triển Khai**: Giải quyết vấn đề phổ biến và gỡ lỗi
- **Tối Ưu Cho Sản Xuất**: Bảo mật, mở rộng, giám sát và quản lý chi phí
- **Xây Dựng Giải Pháp Đa Tác Nhân**: Triển khai các kiến trúc AI phức tạp

## 🎓 Trải Nghiệm Học Tập Trong Workshop

### Tùy Chọn Cách Thức Học Linh Hoạt  
Khóa học này được thiết kế hỗ trợ cả **học cá nhân tự chủ** và **các phiên workshop có hướng dẫn**, giúp người học có trải nghiệm thực hành với AZD trong khi phát triển kỹ năng qua các bài tập tương tác.

#### 🚀 Chế Độ Học Tập Tự Chủ  
**Phù hợp với nhà phát triển cá nhân và học liên tục**

**Tính Năng:**
- **Giao Diện Trên Trình Duyệt**: Workshop chạy trên MkDocs truy cập qua bất kỳ trình duyệt web nào
- **Tích Hợp GitHub Codespaces**: Môi trường phát triển một cú nhấp với công cụ được cài đặt sẵn
- **Môi Trường DevContainer Tương Tác**: Không cần cài đặt tổ hợp cục bộ - bắt đầu code ngay lập tức
- **Theo Dõi Tiến Độ**: Điểm kiểm tra nội bộ và các bài tập xác nhận
- **Hỗ Trợ Cộng Đồng**: Truy cập các kênh Azure Discord để hỏi đáp và hợp tác

**Cấu Trúc Học Tập:**
- **Thời Gian Linh Hoạt**: Hoàn thành các chương theo tốc độ riêng trong vài ngày hoặc tuần
- **Hệ Thống Checkpoint**: Xác nhận học trước khi tiến lên các chủ đề phức tạp
- **Thư Viện Tài Nguyên**: Tài liệu toàn diện, ví dụ, và hướng dẫn xử lý sự cố
- **Phát Triển Hồ Sơ Dự Án**: Xây dựng dự án có thể triển khai cho hồ sơ cá nhân

**Bắt Đầu (Tự Chủ):**  
```bash
# Tùy chọn 1: GitHub Codespaces (Khuyến nghị)
# Điều hướng đến kho lưu trữ và nhấp "Code" → "Create codespace on main"

# Tùy chọn 2: Phát triển cục bộ
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Làm theo hướng dẫn thiết lập trong workshop/README.md
```

#### 🏛️ Phiên Workshop Có Hướng Dẫn  
**Lý tưởng cho đào tạo doanh nghiệp, bootcamp, và tổ chức giáo dục**

**Tùy Chọn Hình Thức Workshop:**

**📚 Tích Hợp Khóa Học Học Thuật (8-12 tuần)**  
- **Chương Trình Đại Học**: Khóa học cả học kỳ với các buổi 2 giờ hàng tuần  
- **Dạng Bootcamp**: Chương trình dày đặc 3-5 ngày với các phiên 6-8 giờ mỗi ngày  
- **Đào Tạo Doanh Nghiệp**: Các phiên nhóm hàng tháng với thực hành dự án  
- **Khung Đánh Giá**: Bài tập được chấm điểm, đánh giá đồng đẳng và dự án cuối khóa  

**🚀 Workshop Chuyên Sâu (1-3 ngày)**  
- **Ngày 1**: Cơ sở + Phát triển AI (Chương 1-2) - 6 giờ  
- **Ngày 2**: Cấu hình + Hạ tầng (Chương 3-4) - 6 giờ  
- **Ngày 3**: Mẫu nâng cao + Sản xuất (Chương 5-8) - 8 giờ  
- **Theo dõi**: Mentorship tùy chọn 2 tuần để hoàn tất dự án  

**⚡ Báo Cáo Điều Hành (4-6 giờ)**  
- **Tổng Quan Chiến Lược**: Giá trị AZD và tác động kinh doanh (1 giờ)  
- **Demo Thực Tế**: Triển khai ứng dụng AI đầu-cuối (2 giờ)  
- **Xem Xét Kiến Trúc**: Mẫu doanh nghiệp và quản trị (1 giờ)  
- **Lập Kế Hoạch Triển Khai**: Chiến lược áp dụng tổ chức (1-2 giờ)  

#### 🛠️ Phương Pháp Học Workshop  
**Phương pháp Khám Phá → Triển Khai → Tùy Biến để phát triển kỹ năng thực hành**

**Giai đoạn 1: Khám Phá (45 phút)**  
- **Khám Phá Mẫu**: Đánh giá các mẫu và dịch vụ Microsoft Foundry  
- **Phân Tích Kiến Trúc**: Hiểu các mẫu đa tác nhân và chiến lược triển khai  
- **Đánh Giá Yêu Cầu**: Xác định nhu cầu và hạn chế tổ chức  
- **Thiết Lập Môi Trường**: Cấu hình môi trường phát triển và tài nguyên Azure  

**Giai đoạn 2: Triển Khai (2 giờ)**  
- **Triển Khai Hướng Dẫn**: Cài đặt từng bước ứng dụng AI với AZD  
- **Cấu Hình Dịch Vụ**: Cấu hình dịch vụ Azure AI, điểm cuối và xác thực  
- **Thực Thi Bảo Mật**: Áp dụng mẫu bảo mật doanh nghiệp và kiểm soát truy cập  
- **Kiểm Tra Xác Nhận**: Xác minh triển khai và xử lý sự cố phổ biến  

**Giai đoạn 3: Tùy Biến (45 phút)**  
- **Chỉnh Sửa Ứng Dụng**: Điều chỉnh mẫu cho các trường hợp và yêu cầu cụ thể  
- **Tối Ưu Sản Xuất**: Thực hiện giám sát, quản lý chi phí và mở rộng  
- **Mẫu Nâng Cao**: Khám phá điều phối đa tác nhân và kiến trúc phức tạp  
- **Lập Kế Hoạch Tiếp Theo**: Định hướng con đường học tập phát triển kỹ năng tiếp tục  

#### 🎯 Kết Quả Học Tập Workshop  
**Kỹ năng có thể đo lường thông qua thực hành thực tế**

**Năng Lực Kỹ Thuật:**  
- **Triển Khai Ứng Dụng AI Sản Xuất**: Triển khai và cấu hình thành công các giải pháp AI  
- **Làm Chủ Hạ Tầng Dưới Dạng Mã**: Tạo và quản lý các mẫu Bicep tùy chỉnh  
- **Kiến Trúc Đa Tác Nhân**: Triển khai giải pháp AI phối hợp đa tác nhân  
- **Sẵn Sàng Sản Xuất**: Áp dụng mẫu bảo mật, giám sát và quản trị  
- **Chuyên Môn Khắc Phục Sự Cố**: Tự giải quyết vấn đề triển khai và cấu hình  

**Kỹ Năng Chuyên Nghiệp:**  
- **Lãnh Đạo Dự Án**: Dẫn dắt nhóm kỹ thuật trong sáng kiến triển khai đám mây  
- **Thiết Kế Kiến Trúc**: Thiết kế giải pháp Azure mở rộng và tiết kiệm chi phí  
- **Chuyển Giao Kiến Thức**: Đào tạo và hướng dẫn đồng nghiệp về thực hành tốt nhất AZD  
- **Lập Kế Hoạch Chiến Lược**: Ảnh hưởng chiến lược áp dụng đám mây trong tổ chức  

#### 📋 Tài Nguyên và Tài Liệu Workshop  
**Bộ công cụ toàn diện cho người hướng dẫn và người học**

**Cho Người Hướng Dẫn:**  
- **Hướng Dẫn Giảng Viên**: [Tổng Quan Workshop](workshop/README.md) - Lập kế hoạch và hướng dẫn giảng dạy  
- **Tài Liệu Thuyết Trình**: Slide, sơ đồ kiến trúc và kịch bản demo  
- **Công Cụ Đánh Giá**: Bài tập thực hành, kiểm tra kiến thức và tiêu chí đánh giá  
- **Thiết Lập Kỹ Thuật**: Cấu hình môi trường, hướng dẫn xử lý sự cố và kế hoạch dự phòng  

**Cho Người Học:**  
- **Môi Trường Workshop Tương Tác**: [Tài Liệu Workshop](workshop/README.md) - Nền tảng học trực tuyến trên trình duyệt  
- **Hướng Dẫn Từng Bước**: [Bài Tập Hướng Dẫn](../../workshop/docs/instructions) - Quy trình triển khai chi tiết  
- **Tài Liệu Tham Khảo**: [Phòng Thí Nghiệm AI Workshop](docs/microsoft-foundry/ai-workshop-lab.md) - Tìm hiểu chuyên sâu về AI  
- **Tài Nguyên Cộng Đồng**: Kênh Azure Discord, thảo luận GitHub và hỗ trợ chuyên gia  

#### 🏢 Triển Khai Workshop Doanh Nghiệp  
**Chiến lược triển khai và đào tạo tổ chức**

**Chương Trình Đào Tạo Doanh Nghiệp:**  
- **Đào Tạo Nhân Viên Mới**: Định hướng người mới với kiến thức cơ bản AZD (2-4 tuần)  
- **Nâng Cao Kỹ Năng Nhóm**: Workshop hàng quý cho các nhóm phát triển hiện tại (1-2 ngày)  
- **Đánh Giá Kiến Trúc**: Phiên đánh giá hàng tháng dành cho kỹ sư cao cấp và kiến trúc sư (4 giờ)  
- **Báo Cáo Lãnh Đạo**: Workshop dành cho nhà quyết định kỹ thuật (bán ngày)  

**Hỗ Trợ Triển Khai:**  
- **Thiết Kế Workshop Tùy Chỉnh**: Nội dung tùy chỉnh theo nhu cầu tổ chức  
- **Quản Lý Chương Trình Thí Điểm**: Triển khai có cấu trúc với chỉ số thành công và phản hồi  
- **Hỗ Trợ Mentorship Liên Tục**: Hỗ trợ sau workshop cho triển khai dự án  
- **Xây Dựng Cộng Đồng**: Cộng đồng nhà phát triển Azure AI nội bộ và chia sẻ kiến thức  

**Chỉ Số Thành Công:**  
- **Tiếp Thu Kỹ Năng**: Đánh giá trước/sau đo lường tăng trưởng năng lực kỹ thuật  
- **Tỷ Lệ Triển Khai Thành Công**: Tỷ lệ người tham gia triển khai ứng dụng sản xuất  
- **Thời Gian Đạt Hiệu Quả**: Rút ngắn thời gian tiếp nhận dự án Azure AI mới  
- **Giữ Kiến Thức**: Đánh giá theo dõi sau 3-6 tháng workshop  

## Cấu Trúc Học 8 Chương

### Chương 1: Nền Tảng & Bắt Đầu Nhanh (30-45 phút) 🌱  
**Yêu Cầu Trước**: Đăng ký Azure, kiến thức cơ bản dòng lệnh  
**Độ Phức Tạp**: ⭐

#### Những Gì Bạn Sẽ Học  
- Hiểu các kiến thức cơ bản về Azure Developer CLI  
- Cài đặt AZD trên nền tảng của bạn  
- Triển khai thành công đầu tiên  
- Các khái niệm và thuật ngữ cốt lõi  

#### Tài Nguyên Học Tập  
- [AZD Basics](docs/getting-started/azd-basics.md) - Các khái niệm cốt lõi  
- [Cài Đặt & Thiết Lập](docs/getting-started/installation.md) - Hướng dẫn theo nền tảng  
- [Dự Án Đầu Tiên](docs/getting-started/first-project.md) - Hướng dẫn thực hành  
- [Bảng Tóm Tắt Lệnh](resources/cheat-sheet.md) - Tham khảo nhanh  

#### Kết Quả Thực Tế  
Triển khai thành công ứng dụng web đơn giản lên Azure với AZD

---

### Chương 2: Phát Triển Ưu Tiên AI (1-2 giờ) 🤖  
**Yêu Cầu Trước**: Hoàn thành Chương 1  
**Độ Phức Tạp**: ⭐⭐

#### Những Gì Bạn Sẽ Học  
- Tích hợp Microsoft Foundry với AZD  
- Triển khai ứng dụng AI-powered  
- Hiểu cấu hình dịch vụ AI  
- Mẫu RAG (Retrieval-Augmented Generation)  

#### Tài Nguyên Học Tập  
- [Tích Hợp Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)  
- [Triển Khai Mô Hình AI](docs/microsoft-foundry/ai-model-deployment.md)  
- [Phòng Thí Nghiệm AI Workshop](docs/microsoft-foundry/ai-workshop-lab.md) - **MỚI**: Lab thực hành toàn diện 2-3 giờ  
- [Hướng Dẫn Workshop Tương Tác](workshop/README.md) - **MỚI**: Workshop trình duyệt MkDocs  
- [Mẫu Microsoft Foundry](README.md#featured-microsoft-foundry-templates)  
- [Hướng Dẫn Workshop](../../workshop/docs/instructions) - **MỚI**: Bài tập hướng dẫn từng bước  

#### Kết Quả Thực Tế  
Triển khai và cấu hình ứng dụng chat AI với khả năng RAG  

#### Lộ Trình Học Workshop (Tùy Chọn Nâng Cao)  
**Trải Nghiệm Tương Tác MỚI**: [Hướng Dẫn Workshop Đầy Đủ](workshop/README.md)  
1. **Khám Phá** (30 phút): Chọn lọc và đánh giá mẫu  
2. **Triển Khai** (45 phút): Triển khai và kiểm tra chức năng mẫu AI  
3. **Phân Tích** (30 phút): Hiểu kiến trúc và thành phần mẫu  
4. **Cấu Hình** (30 phút): Tùy chỉnh cài đặt và tham số  
5. **Tùy Biến** (45 phút): Sửa đổi và lặp lại  
6. **Dọn Dẹp** (15 phút): Xóa tài nguyên và hiểu vòng đời  
7. **Tổng Kết** (15 phút): Bước tiếp theo và lộ trình học nâng cao  

---

### Chương 3: Cấu Hình & Xác Thực (45-60 phút) ⚙️  
**Yêu Cầu Trước**: Hoàn thành Chương 1  
**Độ Phức Tạp**: ⭐⭐

#### Những Gì Bạn Sẽ Học  
- Cấu hình và quản lý môi trường  
- Xác thực và các thực hành bảo mật tốt nhất  
- Đặt tên và tổ chức tài nguyên  
- Triển khai đa môi trường  

#### Tài Nguyên Học Tập  
- [Hướng Dẫn Cấu Hình](docs/getting-started/configuration.md) - Thiết lập môi trường  
- [Xác Thực & Mẫu Bảo Mật](docs/getting-started/authsecurity.md) - Identity quản lý và tích hợp Key Vault  
- Ví dụ đa môi trường  

#### Kết Quả Thực Tế  
Quản lý nhiều môi trường với xác thực và bảo mật đúng cách  

---

### Chương 4: Hạ Tầng Dưới Dạng Mã & Triển Khai (1-1.5 giờ) 🏗️  
**Yêu Cầu Trước**: Hoàn thành Chương 1-3  
**Độ Phức Tạp**: ⭐⭐⭐

#### Những Gì Bạn Sẽ Học  
- Mẫu triển khai nâng cao  
- Hạ tầng dưới dạng mã với Bicep  
- Chiến lược cấp phát tài nguyên  
- Tạo mẫu tùy chỉnh  

- Triển khai ứng dụng container với Azure Container Apps và AZD  

#### Tài Nguyên Học Tập  
- [Hướng Dẫn Triển Khai](docs/deployment/deployment-guide.md) - Quy trình hoàn chỉnh  
- [Cấp Phát Tài Nguyên](docs/deployment/provisioning.md) - Quản lý tài nguyên  
- Ví dụ container và microservices  
- [Ví dụ Container App](examples/container-app/README.md) - Bắt đầu nhanh, sản xuất, và mẫu triển khai nâng cao  

#### Kết Quả Thực Tế  
Triển khai ứng dụng đa dịch vụ phức tạp sử dụng mẫu hạ tầng tùy chỉnh  

---

### Chương 5: Giải Pháp AI Đa Tác Nhân (2-3 giờ) 🤖🤖  
**Yêu Cầu Trước**: Hoàn thành Chương 1-2  
**Độ Phức Tạp**: ⭐⭐⭐⭐

#### Những Gì Bạn Sẽ Học  
- Mẫu kiến trúc đa tác nhân  
- Điều phối và phối hợp tác nhân  
- Triển khai AI sẵn sàng sản xuất  
- Triển khai tác nhân khách hàng và kho hàng  

- Tích hợp microservices container trong giải pháp dựa trên tác nhân  

#### Tài Nguyên Học Tập  
- [Giải Pháp Đa Tác Nhân Bán Lẻ](examples/retail-scenario.md) - Triển khai hoàn chỉnh  
- [Gói ARM Template](../../examples/retail-multiagent-arm-template) - Triển khai một cú nhấp  
- Mẫu điều phối đa tác nhân  
- [Ví dụ Kiến Trúc Microservices](../../examples/container-app/microservices) - Giao tiếp dịch vụ, nhắn tin không đồng bộ, triển khai sản xuất  

#### Kết Quả Thực Tế  
Triển khai và quản lý giải pháp AI đa tác nhân sẵn sàng sản xuất  

---

### Chương 6: Xác Nhận & Lập Kế Hoạch Trước Triển Khai (1 giờ) 🔍  
**Yêu Cầu Trước**: Hoàn thành Chương 4  
**Độ Phức Tạp**: ⭐⭐

#### Những Gì Bạn Sẽ Học  
- Lập kế hoạch năng lực và xác nhận tài nguyên  
- Chiến lược chọn SKU  
- Kiểm tra tiền triển khai và tự động hóa  
- Lập kế hoạch tối ưu chi phí  

#### Tài Nguyên Học Tập  
- [Lập Kế Hoạch Năng Lực](docs/pre-deployment/capacity-planning.md) - Xác nhận tài nguyên  
- [Chọn SKU](docs/pre-deployment/sku-selection.md) - Lựa chọn tối ưu chi phí  
- [Kiểm Tra Tiền Triển Khai](docs/pre-deployment/preflight-checks.md) - Kịch bản tự động  
- [Tích Hợp Application Insights](docs/pre-deployment/application-insights.md) - Giám sát và quan sát  
- [Mẫu Điều Phối Đa Tác Nhân](docs/pre-deployment/coordination-patterns.md) - Chiến lược điều phối tác nhân  

#### Kết Quả Thực Tế  
Xác nhận và tối ưu triển khai trước khi thực hiện

---

### Chương 7: Khắc phục sự cố & Gỡ lỗi (1-1.5 giờ) 🔧
**Yêu cầu trước**: Hoàn thành bất kỳ chương triển khai nào  
**Độ phức tạp**: ⭐⭐

#### Những gì bạn sẽ học
- Các phương pháp gỡ lỗi có hệ thống
- Các sự cố phổ biến và giải pháp
- Khắc phục sự cố dành riêng cho AI
- Tối ưu hóa hiệu suất

#### Tài nguyên học tập
- [Các vấn đề phổ biến](docs/troubleshooting/common-issues.md) - Câu hỏi thường gặp và giải pháp
- [Hướng dẫn gỡ lỗi](docs/troubleshooting/debugging.md) - Chiến lược từng bước
- [Khắc phục sự cố AI](docs/troubleshooting/ai-troubleshooting.md) - Vấn đề dịch vụ AI

#### Kết quả thực tế
Tự chẩn đoán và giải quyết các sự cố triển khai phổ biến

---

### Chương 8: Mẫu sản xuất & Doanh nghiệp (2-3 giờ) 🏢
**Yêu cầu trước**: Hoàn thành các chương 1-4  
**Độ phức tạp**: ⭐⭐⭐⭐

#### Những gì bạn sẽ học
- Chiến lược triển khai sản xuất
- Mẫu bảo mật doanh nghiệp
- Giám sát và tối ưu chi phí
- Khả năng mở rộng và quản trị

- Các phương pháp tốt nhất cho triển khai ứng dụng container trong sản xuất (bảo mật, giám sát, chi phí, CI/CD)

#### Tài nguyên học tập
- [Thực hành AI trong sản xuất](docs/microsoft-foundry/production-ai-practices.md) - Mẫu doanh nghiệp
- Ví dụ về microservices và doanh nghiệp
- Khung giám sát và quản trị
- [Ví dụ kiến trúc Microservices](../../examples/container-app/microservices) - Triển khai blue-green/canary, truy vết phân tán và tối ưu chi phí

#### Kết quả thực tế
Triển khai ứng dụng sẵn sàng doanh nghiệp với đầy đủ khả năng sản xuất

---

## Tiến trình học tập và độ phức tạp

### Xây dựng kỹ năng theo cấp độ

- **🌱 Người mới**: Bắt đầu với Chương 1 (Nền tảng) → Chương 2 (Phát triển AI)
- **🔧 Trung cấp**: Các chương 3-4 (Cấu hình & Hạ tầng) → Chương 6 (Xác thực)
- **🚀 Nâng cao**: Chương 5 (Giải pháp đa tác nhân) → Chương 7 (Khắc phục sự cố)
- **🏢 Doanh nghiệp**: Hoàn thành tất cả các chương, tập trung Chương 8 (Mẫu sản xuất)

- **Lộ trình Ứng dụng Container**: Các chương 4 (triển khai container hóa), 5 (tích hợp microservices), 8 (thực hành tốt nhất trong sản xuất)

### Chỉ số độ phức tạp

- **⭐ Cơ bản**: Khái niệm đơn lẻ, hướng dẫn từng bước, 30-60 phút
- **⭐⭐ Trung cấp**: Nhiều khái niệm, thực hành trực tiếp, 1-2 giờ  
- **⭐⭐⭐ Nâng cao**: Kiến trúc phức tạp, giải pháp tùy chỉnh, 1-3 giờ
- **⭐⭐⭐⭐ Chuyên gia**: Hệ thống sản xuất, mẫu doanh nghiệp, 2-4 giờ

### Lộ trình học linh hoạt

#### 🎯 Lộ trình nhanh dành cho nhà phát triển AI (4-6 giờ)
1. **Chương 1**: Nền tảng & Bắt đầu nhanh (45 phút)
2. **Chương 2**: Phát triển ưu tiên AI (2 giờ)  
3. **Chương 5**: Giải pháp AI đa tác nhân (3 giờ)
4. **Chương 8**: Thực hành AI trong sản xuất (1 giờ)

#### 🛠️ Lộ trình chuyên gia hạ tầng (5-7 giờ)
1. **Chương 1**: Nền tảng & Bắt đầu nhanh (45 phút)
2. **Chương 3**: Cấu hình & Xác thực (1 giờ)
3. **Chương 4**: Hạ tầng như mã & Triển khai (1.5 giờ)
4. **Chương 6**: Xác thực & Lập kế hoạch trước triển khai (1 giờ)
5. **Chương 7**: Khắc phục sự cố & Gỡ lỗi (1.5 giờ)
6. **Chương 8**: Mẫu sản xuất & Doanh nghiệp (2 giờ)

#### 🎓 Lộ trình học tập hoàn chỉnh (8-12 giờ)
Hoàn thành tuần tự 8 chương với thực hành và xác thực

## Khung hoàn thành khóa học

### Xác thực kiến thức
- **Điểm kiểm tra chương**: Bài tập thực tế với kết quả đo lường
- **Kiểm chứng thực hành**: Triển khai giải pháp hoạt động cho mỗi chương
- **Theo dõi tiến độ**: Chỉ báo trực quan và huy hiệu hoàn thành
- **Xác thực cộng đồng**: Chia sẻ trải nghiệm trong kênh Discord Azure

### Đánh giá kết quả học tập

#### Hoàn thành Chương 1-2 (Nền tảng + AI)
- ✅ Triển khai ứng dụng web cơ bản bằng AZD
- ✅ Triển khai ứng dụng chat AI có RAG
- ✅ Hiểu các khái niệm cốt lõi AZD và tích hợp AI

#### Hoàn thành Chương 3-4 (Cấu hình + Hạ tầng)  
- ✅ Quản lý triển khai đa môi trường
- ✅ Tạo mẫu Bicep hạ tầng tùy chỉnh
- ✅ Áp dụng mẫu xác thực bảo mật

#### Hoàn thành Chương 5-6 (Đa tác nhân + Xác thực)
- ✅ Triển khai giải pháp AI đa tác nhân phức tạp
- ✅ Lập kế hoạch năng lực và tối ưu chi phí
- ✅ Thực hiện tự động xác thực trước triển khai

#### Hoàn thành Chương 7-8 (Khắc phục sự cố + Sản xuất)
- ✅ Gỡ lỗi và khắc phục sự cố triển khai độc lập  
- ✅ Thực hiện giám sát và bảo mật cấp doanh nghiệp
- ✅ Triển khai ứng dụng sẵn sàng sản xuất có quản trị

### Chứng nhận và công nhận
- **Huy hiệu hoàn thành khóa học**: Hoàn thành 8 chương với xác thực thực hành
- **Công nhận cộng đồng**: Tham gia tích cực Microsoft Foundry Discord
- **Phát triển nghề nghiệp**: Kỹ năng triển khai AZD và AI có giá trị ngành
- **Tiến bộ sự nghiệp**: Khả năng triển khai đám mây doanh nghiệp

## 🎓 Kết quả học tập toàn diện

### Cấp độ nền tảng (Chương 1-2)
Sau khi hoàn thành các chương nền tảng, học viên sẽ chứng minh được:

**Khả năng kỹ thuật:**
- Triển khai ứng dụng web đơn giản lên Azure qua lệnh AZD
- Cấu hình và triển khai ứng dụng chat AI sử dụng RAG
- Hiểu các khái niệm cốt lõi AZD: mẫu, môi trường, luồng cấp phát
- Tích hợp dịch vụ Microsoft Foundry với triển khai AZD
- Điều hướng cấu hình dịch vụ Azure AI và endpoint API

**Kỹ năng chuyên môn:**
- Tuân thủ quy trình triển khai có cấu trúc để có kết quả nhất quán
- Khắc phục sự cố triển khai cơ bản qua logs và tài liệu
- Giao tiếp hiệu quả về quy trình triển khai đám mây
- Áp dụng thực hành tốt để tích hợp dịch vụ AI an toàn

**Xác minh học tập:**
- ✅ Triển khai thành công mẫu `todo-nodejs-mongo`
- ✅ Triển khai và cấu hình `azure-search-openai-demo` với RAG
- ✅ Hoàn thành bài tập tương tác workshop (giai đoạn Khám phá)
- ✅ Tham gia thảo luận cộng đồng Azure Discord

### Cấp độ trung cấp (Chương 3-4)
Sau khi hoàn thành các chương trung cấp, học viên sẽ chứng minh được:

**Khả năng kỹ thuật:**
- Quản lý triển khai đa môi trường (dev, staging, production)
- Tạo mẫu Bicep tùy chỉnh cho hạ tầng như mã
- Triển khai mẫu xác thực bảo mật với managed identity
- Triển khai ứng dụng đa dịch vụ phức tạp với cấu hình tùy chỉnh
- Tối ưu chiến lược cấp phát tài nguyên về chi phí và hiệu suất

**Kỹ năng chuyên môn:**
- Thiết kế kiến trúc hạ tầng có khả năng mở rộng
- Thực thi thực hành bảo mật tốt nhất cho triển khai đám mây
- Tài liệu hóa mẫu hạ tầng hỗ trợ phối hợp nhóm
- Đánh giá và lựa chọn dịch vụ Azure phù hợp yêu cầu

**Xác minh học tập:**
- ✅ Cấu hình môi trường riêng với thiết lập đặc thù
- ✅ Tạo và triển khai mẫu Bicep tùy chỉnh cho ứng dụng đa dịch vụ
- ✅ Áp dụng xác thực managed identity để truy cập an toàn
- ✅ Hoàn thành bài tập quản lý cấu hình thực tế

### Cấp độ nâng cao (Chương 5-6)
Sau khi hoàn thành các chương nâng cao, học viên sẽ chứng minh được:

**Khả năng kỹ thuật:**
- Triển khai và điều phối giải pháp AI đa tác nhân với luồng công việc phối hợp
- Triển khai kiến trúc Agent Khách hàng và Kho hàng cho kịch bản bán lẻ
- Lập kế hoạch năng lực toàn diện và xác thực tài nguyên
- Thực hiện xác thực tự động trước triển khai và tối ưu hóa
- Thiết kế lựa chọn SKU tiết kiệm dựa trên yêu cầu tải công việc

**Kỹ năng chuyên môn:**
- Kiến trúc giải pháp AI phức tạp cho môi trường sản xuất
- Dẫn dắt thảo luận kỹ thuật về chiến lược triển khai AI
- Mentor cho nhà phát triển junior về AZD và thực hành triển khai AI
- Đánh giá và đề xuất mẫu kiến trúc AI đáp ứng yêu cầu kinh doanh

**Xác minh học tập:**
- ✅ Triển khai giải pháp bán lẻ đa tác nhân hoàn chỉnh với mẫu ARM
- ✅ Thể hiện phối hợp agent và điều phối luồng công việc
- ✅ Hoàn thành bài tập lập kế hoạch năng lực có ràng buộc tài nguyên thực tế
- ✅ Xác thực trạng thái sẵn sàng triển khai qua kiểm tra tự động

### Cấp độ chuyên gia (Chương 7-8)
Sau khi hoàn thành các chương chuyên gia, học viên sẽ chứng minh được:

**Khả năng kỹ thuật:**
- Chẩn đoán và giải quyết sự cố triển khai phức tạp độc lập
- Triển khai mẫu bảo mật và khung quản trị cấp doanh nghiệp
- Thiết kế chiến lược giám sát và cảnh báo toàn diện
- Tối ưu triển khai sản xuất về quy mô, chi phí và hiệu năng
- Thiết lập pipeline CI/CD với kiểm thử và xác thực phù hợp

**Kỹ năng chuyên môn:**
- Lãnh đạo sáng kiến chuyển đổi đám mây doanh nghiệp
- Thiết kế và thực hiện tiêu chuẩn triển khai tổ chức
- Đào tạo và hướng dẫn nhóm phát triển về AZD nâng cao
- Ảnh hưởng quyết định kỹ thuật cho triển khai AI doanh nghiệp

**Xác minh học tập:**
- ✅ Giải quyết lỗi triển khai dịch vụ đa phức tạp
- ✅ Thực thi mẫu bảo mật doanh nghiệp theo chuẩn tuân thủ
- ✅ Thiết kế và triển khai giám sát sản xuất với Application Insights
- ✅ Hoàn thiện triển khai khung quản trị doanh nghiệp

## 🎯 Chứng nhận hoàn thành khóa học

### Khung theo dõi tiến độ
Theo dõi tiến trình học thông qua điểm kiểm tra cấu trúc:

- [ ] **Chương 1**: Nền tảng & Bắt đầu nhanh ✅
- [ ] **Chương 2**: Phát triển ưu tiên AI ✅  
- [ ] **Chương 3**: Cấu hình & Xác thực ✅
- [ ] **Chương 4**: Hạ tầng như mã & Triển khai ✅
- [ ] **Chương 5**: Giải pháp AI đa tác nhân ✅
- [ ] **Chương 6**: Xác thực & Lập kế hoạch trước triển khai ✅
- [ ] **Chương 7**: Khắc phục sự cố & Gỡ lỗi ✅
- [ ] **Chương 8**: Mẫu sản xuất & Doanh nghiệp ✅

### Quy trình xác minh
Sau khi hoàn thành mỗi chương, xác nhận kiến thức qua:

1. **Hoàn thành bài tập thực hành**: Triển khai giải pháp hoạt động cho mỗi chương
2. **Đánh giá kiến thức**: Xem lại các phần FAQ và thực hiện tự đánh giá
3. **Tham gia cộng đồng**: Chia sẻ trải nghiệm và nhận phản hồi trên Azure Discord
4. **Phát triển hồ sơ dự án**: Tài liệu triển khai và bài học kinh nghiệm
5. **Đánh giá bạn học**: Hợp tác với các học viên khác giải quyết tình huống phức tạp

### Lợi ích hoàn thành khóa học
Sau khi hoàn thành toàn bộ chương với xác minh, học viên sẽ có:

**Chuyên môn kỹ thuật:**
- **Kinh nghiệm sản xuất**: Triển khai ứng dụng AI thực tế trên môi trường Azure
- **Kỹ năng chuyên nghiệp**: Khả năng triển khai và khắc phục sự cố doanh nghiệp  
- **Kiến thức kiến trúc**: Giải pháp AI đa tác nhân và mẫu hạ tầng phức tạp
- **Thành thạo khắc phục sự cố**: Giải quyết độc lập các lỗi triển khai và cấu hình

**Phát triển nghề nghiệp:**
- **Công nhận ngành**: Kỹ năng xác minh trong các lĩnh vực AZD và AI có nhu cầu cao
- **Tiến bộ sự nghiệp**: Đủ điều kiện vị trí kiến trúc sư đám mây và chuyên gia triển khai AI
- **Lãnh đạo cộng đồng**: Thành viên tích cực trong cộng đồng nhà phát triển Azure và AI
- **Học tập liên tục**: Nền tảng cho chuyên môn hóa sâu hơn Microsoft Foundry

**Tài sản hồ sơ dự án:**
- **Các giải pháp đã triển khai**: Ví dụ thực tế ứng dụng AI và mẫu hạ tầng
- **Tài liệu**: Hướng dẫn triển khai toàn diện và quy trình khắc phục sự cố  
- **Đóng góp cộng đồng**: Thảo luận, ví dụ, và cải tiến chia sẻ với cộng đồng Azure
- **Mạng lưới chuyên nghiệp**: Kết nối với chuyên gia Azure và người thực hành triển khai AI

### Lộ trình học tiếp sau khóa học
Học viên sẵn sàng cho chuyên môn hóa nâng cao về:
- **Chuyên gia Microsoft Foundry**: Chuyên sâu triển khai và điều phối mô hình AI
- **Lãnh đạo kiến trúc đám mây**: Thiết kế triển khai quy mô doanh nghiệp và quản trị
- **Lãnh đạo cộng đồng phát triển**: Cống hiến ví dụ và tài nguyên cho cộng đồng Azure
- **Đào tạo doanh nghiệp**: Giảng dạy kỹ năng AZD và triển khai AI trong tổ chức


---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Từ chối trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ gốc nên được xem là nguồn thông tin chính thức. Đối với các thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->