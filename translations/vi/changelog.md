# Nhật ký thay đổi - AZD Dành cho Người Mới Bắt Đầu

## Giới thiệu

Nhật ký thay đổi này ghi lại tất cả các thay đổi, cập nhật và cải tiến đáng chú ý trong kho lưu trữ AZD Dành cho Người Mới Bắt Đầu. Chúng tôi tuân theo các nguyên tắc phiên bản ngữ nghĩa và duy trì nhật ký này để giúp người dùng hiểu những gì đã thay đổi giữa các phiên bản.

## Mục tiêu học tập

Khi xem xét nhật ký thay đổi này, bạn sẽ:
- Luôn cập nhật về các tính năng mới và bổ sung nội dung
- Hiểu các cải tiến được thực hiện đối với tài liệu hiện có
- Theo dõi các sửa lỗi và điều chỉnh để đảm bảo tính chính xác
- Theo dõi sự phát triển của tài liệu học tập theo thời gian

## Kết quả học tập

Sau khi xem xét các mục nhật ký thay đổi, bạn sẽ có thể:
- Xác định nội dung và tài nguyên mới có sẵn để học tập
- Hiểu các phần nào đã được cập nhật hoặc cải tiến
- Lên kế hoạch học tập dựa trên tài liệu mới nhất
- Đóng góp ý kiến và đề xuất cho các cải tiến trong tương lai

## Lịch sử phiên bản

### [v3.8.0] - 2025-11-19

#### Tài liệu nâng cao: Giám sát, Bảo mật và Mô hình Đa Tác Nhân
**Phiên bản này bổ sung các bài học cấp độ A toàn diện về tích hợp Application Insights, mô hình xác thực và phối hợp đa tác nhân cho triển khai sản xuất.**

#### Đã thêm
- **📊 Bài học Tích hợp Application Insights**: trong `docs/pre-deployment/application-insights.md`:
  - Triển khai tập trung vào AZD với tự động cung cấp
  - Mẫu Bicep hoàn chỉnh cho Application Insights + Log Analytics
  - Ứng dụng Python hoạt động với telemetry tùy chỉnh (hơn 1.200 dòng)
  - Mô hình giám sát AI/LLM (theo dõi token/chi phí Azure OpenAI)
  - 6 sơ đồ Mermaid (kiến trúc, truy vết phân tán, luồng telemetry)
  - 3 bài tập thực hành (cảnh báo, bảng điều khiển, giám sát AI)
  - Ví dụ truy vấn Kusto và chiến lược tối ưu hóa chi phí
  - Phát trực tiếp số liệu và gỡ lỗi thời gian thực
  - Thời gian học 40-50 phút với các mô hình sẵn sàng sản xuất

- **🔐 Bài học Mô hình Xác thực & Bảo mật**: trong `docs/getting-started/authsecurity.md`:
  - 3 mô hình xác thực (chuỗi kết nối, Key Vault, danh tính được quản lý)
  - Mẫu hạ tầng Bicep hoàn chỉnh cho triển khai an toàn
  - Mã ứng dụng Node.js với tích hợp Azure SDK
  - 3 bài tập hoàn chỉnh (kích hoạt danh tính được quản lý, danh tính do người dùng chỉ định, xoay vòng Key Vault)
  - Các thực hành tốt nhất về bảo mật và cấu hình RBAC
  - Hướng dẫn khắc phục sự cố và phân tích chi phí
  - Mô hình xác thực không mật khẩu sẵn sàng sản xuất

- **🤖 Bài học Mô hình Phối hợp Đa Tác Nhân**: trong `docs/pre-deployment/coordination-patterns.md`:
  - 5 mô hình phối hợp (tuần tự, song song, phân cấp, dựa trên sự kiện, đồng thuận)
  - Triển khai dịch vụ điều phối hoàn chỉnh (Python/Flask, hơn 1.500 dòng)
  - 3 triển khai tác nhân chuyên biệt (Nghiên cứu, Viết, Biên tập)
  - Tích hợp Service Bus để xếp hàng tin nhắn
  - Quản lý trạng thái Cosmos DB cho hệ thống phân tán
  - 6 sơ đồ Mermaid hiển thị tương tác giữa các tác nhân
  - 3 bài tập nâng cao (xử lý timeout, logic retry, circuit breaker)
  - Phân tích chi phí ($240-565/tháng) với chiến lược tối ưu hóa
  - Tích hợp Application Insights để giám sát

#### Đã cải thiện
- **Chương Tiền Triển Khai**: Bây giờ bao gồm các mô hình giám sát và phối hợp toàn diện
- **Chương Bắt Đầu**: Được nâng cấp với các mô hình xác thực chuyên nghiệp
- **Sẵn sàng Sản xuất**: Bao phủ đầy đủ từ bảo mật đến khả năng quan sát
- **Đề cương Khóa học**: Được cập nhật để tham chiếu các bài học mới trong Chương 3 và 6

#### Đã thay đổi
- **Tiến trình học tập**: Tích hợp tốt hơn bảo mật và giám sát trong suốt khóa học
- **Chất lượng tài liệu**: Tiêu chuẩn cấp độ A nhất quán (95-97%) trong các bài học mới
- **Mô hình sản xuất**: Bao phủ đầy đủ từ đầu đến cuối cho triển khai doanh nghiệp

#### Đã cải tiến
- **Trải nghiệm nhà phát triển**: Lộ trình rõ ràng từ phát triển đến giám sát sản xuất
- **Tiêu chuẩn bảo mật**: Mô hình chuyên nghiệp cho xác thực và quản lý bí mật
- **Khả năng quan sát**: Tích hợp Application Insights hoàn chỉnh với AZD
- **Khối lượng công việc AI**: Giám sát chuyên biệt cho Azure OpenAI và hệ thống đa tác nhân

#### Đã xác nhận
- ✅ Tất cả các bài học bao gồm mã hoạt động hoàn chỉnh (không phải đoạn mã)
- ✅ Sơ đồ Mermaid để học trực quan (tổng cộng 19 sơ đồ trong 3 bài học)
- ✅ Bài tập thực hành với các bước xác minh (tổng cộng 9 bài)
- ✅ Mẫu Bicep sẵn sàng sản xuất có thể triển khai qua `azd up`
- ✅ Phân tích chi phí và chiến lược tối ưu hóa
- ✅ Hướng dẫn khắc phục sự cố và các thực hành tốt nhất
- ✅ Điểm kiểm tra kiến thức với các lệnh xác minh

#### Kết quả đánh giá tài liệu
- **docs/pre-deployment/application-insights.md**: - Hướng dẫn giám sát toàn diện
- **docs/getting-started/authsecurity.md**: - Mô hình bảo mật chuyên nghiệp
- **docs/pre-deployment/coordination-patterns.md**: - Kiến trúc đa tác nhân nâng cao
- **Nội dung mới tổng thể**: - Tiêu chuẩn chất lượng cao nhất quán

#### Triển khai kỹ thuật
- **Application Insights**: Log Analytics + telemetry tùy chỉnh + truy vết phân tán
- **Xác thực**: Danh tính được quản lý + Key Vault + mô hình RBAC
- **Đa tác nhân**: Service Bus + Cosmos DB + Container Apps + điều phối
- **Giám sát**: Phát trực tiếp số liệu + truy vấn Kusto + cảnh báo + bảng điều khiển
- **Quản lý chi phí**: Chiến lược lấy mẫu, chính sách lưu giữ, kiểm soát ngân sách

### [v3.7.0] - 2025-11-19

#### Cải thiện chất lượng tài liệu và ví dụ mới về Azure OpenAI
**Phiên bản này nâng cao chất lượng tài liệu trên toàn bộ kho lưu trữ và bổ sung ví dụ triển khai Azure OpenAI hoàn chỉnh với giao diện trò chuyện GPT-4.**

#### Đã thêm
- **🤖 Ví dụ trò chuyện Azure OpenAI**: Triển khai GPT-4 hoàn chỉnh với triển khai hoạt động trong `examples/azure-openai-chat/`:
  - Hạ tầng Azure OpenAI hoàn chỉnh (triển khai mô hình GPT-4)
  - Giao diện trò chuyện dòng lệnh Python với lịch sử hội thoại
  - Tích hợp Key Vault để lưu trữ API key an toàn
  - Theo dõi sử dụng token và ước tính chi phí
  - Giới hạn tốc độ và xử lý lỗi
  - README toàn diện với hướng dẫn triển khai 35-45 phút
  - 11 tệp sẵn sàng sản xuất (mẫu Bicep, ứng dụng Python, cấu hình)
- **📚 Bài tập tài liệu**: Thêm bài tập thực hành vào hướng dẫn cấu hình:
  - Bài tập 1: Cấu hình đa môi trường (15 phút)
  - Bài tập 2: Thực hành quản lý bí mật (10 phút)
  - Tiêu chí thành công rõ ràng và các bước xác minh
- **✅ Xác minh triển khai**: Thêm phần xác minh vào hướng dẫn triển khai:
  - Quy trình kiểm tra sức khỏe
  - Danh sách tiêu chí thành công
  - Kết quả mong đợi cho tất cả các lệnh triển khai
  - Tham khảo nhanh khắc phục sự cố

#### Đã cải thiện
- **examples/README.md**: Được nâng cấp lên chất lượng cấp độ A (93%):
  - Thêm azure-openai-chat vào tất cả các phần liên quan
  - Cập nhật số lượng ví dụ cục bộ từ 3 lên 4
  - Thêm vào bảng Ví dụ Ứng dụng AI
  - Tích hợp vào Bắt đầu Nhanh cho Người dùng Trung cấp
  - Thêm vào phần Mẫu Microsoft Foundry Azure AI
  - Cập nhật Ma trận So sánh và các phần tìm kiếm công nghệ
- **Chất lượng tài liệu**: Cải thiện từ B+ (87%) → A- (92%) trên thư mục docs:
  - Thêm kết quả mong đợi vào các ví dụ lệnh quan trọng
  - Bao gồm các bước xác minh cho thay đổi cấu hình
  - Nâng cao học tập thực hành với các bài tập thực tế

#### Đã thay đổi
- **Tiến trình học tập**: Tích hợp tốt hơn các ví dụ AI cho người học trung cấp
- **Cấu trúc tài liệu**: Nhiều bài tập hành động hơn với kết quả rõ ràng
- **Quy trình xác minh**: Thêm tiêu chí thành công rõ ràng vào các quy trình chính

#### Đã cải tiến
- **Trải nghiệm nhà phát triển**: Triển khai Azure OpenAI hiện chỉ mất 35-45 phút (so với 60-90 phút cho các lựa chọn thay thế phức tạp)
- **Minh bạch chi phí**: Ước tính chi phí rõ ràng ($50-200/tháng) cho ví dụ Azure OpenAI
- **Lộ trình học tập**: Các nhà phát triển AI có điểm bắt đầu rõ ràng với azure-openai-chat
- **Tiêu chuẩn tài liệu**: Kết quả mong đợi và các bước xác minh nhất quán

#### Đã xác nhận
- ✅ Ví dụ Azure OpenAI hoạt động hoàn chỉnh với `azd up`
- ✅ Tất cả 11 tệp triển khai đúng cú pháp
- ✅ Hướng dẫn README khớp với trải nghiệm triển khai thực tế
- ✅ Liên kết tài liệu được cập nhật trên hơn 8 vị trí
- ✅ Chỉ mục ví dụ chính xác phản ánh 4 ví dụ cục bộ
- ✅ Không có liên kết bên ngoài trùng lặp trong bảng
- ✅ Tất cả tham chiếu điều hướng chính xác

#### Triển khai kỹ thuật
- **Kiến trúc Azure OpenAI**: GPT-4 + Key Vault + Container Apps
- **Bảo mật**: Sẵn sàng danh tính được quản lý, bí mật trong Key Vault
- **Giám sát**: Tích hợp Application Insights
- **Quản lý chi phí**: Theo dõi token và tối ưu hóa sử dụng
- **Triển khai**: Lệnh `azd up` duy nhất cho thiết lập hoàn chỉnh

### [v3.6.0] - 2025-11-19

#### Cập nhật lớn: Ví dụ triển khai ứng dụng container
**Phiên bản này giới thiệu các ví dụ triển khai ứng dụng container toàn diện, sẵn sàng sản xuất bằng Azure Developer CLI (AZD), với tài liệu đầy đủ và tích hợp vào lộ trình học tập.**

#### Đã thêm
- **🚀 Ví dụ ứng dụng container**: Các ví dụ cục bộ mới trong `examples/container-app/`:
  - [Hướng dẫn chính](examples/container-app/README.md): Tổng quan đầy đủ về triển khai container, bắt đầu nhanh, sản xuất và các mô hình nâng cao
  - [API Flask đơn giản](../../examples/container-app/simple-flask-api): API REST thân thiện với người mới bắt đầu với scale-to-zero, kiểm tra sức khỏe, giám sát và khắc phục sự cố
  - [Kiến trúc Microservices](../../examples/container-app/microservices): Triển khai đa dịch vụ sẵn sàng sản xuất (API Gateway, Product, Order, User, Notification), nhắn tin không đồng bộ, Service Bus, Cosmos DB, Azure SQL, truy vết phân tán, triển khai blue-green/canary
- **Thực hành tốt nhất**: Hướng dẫn bảo mật, giám sát, tối ưu hóa chi phí và CI/CD cho khối lượng công việc container
- **Mẫu mã**: `azure.yaml` hoàn chỉnh, mẫu Bicep và triển khai dịch vụ đa ngôn ngữ (Python, Node.js, C#, Go)
- **Kiểm tra & Khắc phục sự cố**: Kịch bản kiểm tra end-to-end, lệnh giám sát, hướng dẫn khắc phục sự cố

#### Đã thay đổi
- **README.md**: Được cập nhật để giới thiệu và liên kết các ví dụ ứng dụng container mới trong phần "Ví dụ Cục bộ - Ứng dụng Container"
- **examples/README.md**: Được cập nhật để làm nổi bật các ví dụ ứng dụng container, thêm mục ma trận so sánh và cập nhật tham chiếu công nghệ/kiến trúc
- **Đề cương Khóa học & Hướng dẫn Học tập**: Được cập nhật để tham chiếu các ví dụ ứng dụng container mới và mô hình triển khai trong các chương liên quan

#### Đã xác nhận
- ✅ Tất cả các ví dụ mới có thể triển khai với `azd up` và tuân theo các thực hành tốt nhất
- ✅ Liên kết chéo tài liệu và điều hướng được cập nhật
- ✅ Các ví dụ bao gồm từ kịch bản dành cho người mới bắt đầu đến nâng cao, bao gồm microservices sản xuất

#### Ghi chú
- **Phạm vi**: Tài liệu và ví dụ tiếng Anh
- **Bước tiếp theo**: Mở rộng với các mô hình container nâng cao và tự động hóa CI/CD trong các phiên bản tương lai

### [v3.5.0] - 2025-11-19

#### Đổi thương hiệu sản phẩm: Microsoft Foundry
**Phiên bản này thực hiện thay đổi tên sản phẩm toàn diện từ "Azure AI Foundry" thành "Microsoft Foundry" trên toàn bộ tài liệu tiếng Anh, phản ánh việc đổi thương hiệu chính thức của Microsoft.**

#### Đã thay đổi
- **🔄 Cập nhật tên sản phẩm**: Đổi thương hiệu hoàn toàn từ "Azure AI Foundry" thành "Microsoft Foundry"
  - Cập nhật tất cả các tham chiếu trên tài liệu tiếng Anh trong thư mục `docs/`
  - Đổi tên thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Đổi tên tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tổng cộng: 23 tham chiếu nội dung được cập nhật trên 7 tệp tài liệu

- **📁 Thay đổi cấu trúc thư mục**:
  - `docs/ai-foundry/` đổi tên thành `docs/microsoft-foundry/`
  - Tất cả các tham chiếu chéo được cập nhật để phản ánh cấu trúc thư mục mới
  - Liên kết điều hướng được xác nhận trên toàn bộ tài liệu

- **📄 Đổi tên tệp**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tất cả các liên kết nội bộ được cập nhật để tham chiếu tên tệp mới

#### Tệp được cập nhật
- **Tài liệu chương** (7 tệp):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 cập nhật liên kết điều hướng
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tham chiếu tên sản phẩm được cập nhật
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Đã sử dụng Microsoft Foundry (từ các cập nhật trước)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 tham chiếu được cập nhật (tổng quan, phản hồi cộng đồng, tài liệu)
  - `docs/getting-started/azd-basics.md` - 4 liên kết tham chiếu chéo được cập nhật
  - `docs/getting-started/first-project.md` - 2 liên kết điều hướng chương được cập nhật
  - `docs/getting-started/installation.md` - 2 liên kết chương tiếp theo được cập nhật
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 tham chiếu được cập nhật (điều hướng, cộng đồng Discord)
  - `docs/troubleshooting/common-issues.md` - 1 liên kết điều hướng được cập nhật
  - `docs/troubleshooting/debugging.md` - 1 liên kết điều hướng được cập nhật

- **Tệp cấu trúc khóa học** (2 tệp):
  - `README.md` - 17 tham chiếu được cập nhật (tổng quan khóa học, tiêu đề chương, phần mẫu, thông tin cộng đồng)
  - `course-outline.md` - 14 tham chiếu được cập nhật (tổng quan, mục tiêu học tập, tài nguyên chương)

#### Đã xác nhận
- ✅ Không còn tham chiếu đường dẫn thư mục "ai-foundry" trong tài liệu tiếng Anh
- ✅ Không còn tham chiếu tên sản phẩm "Azure AI Foundry" trong tài liệu tiếng Anh
- ✅ Tất cả các liên kết điều hướng hoạt động với cấu trúc thư mục mới
- ✅ Đổi tên tệp và thư mục hoàn tất thành công
- ✅ Tham chiếu chéo giữa các chương được
- **Workshop**: Tài liệu workshop (`workshop/`) chưa được cập nhật trong phiên bản này
- **Examples**: Các tệp ví dụ có thể vẫn tham chiếu đến cách đặt tên cũ (sẽ được xử lý trong bản cập nhật tương lai)
- **External Links**: Các URL bên ngoài và tham chiếu đến kho GitHub vẫn giữ nguyên

#### Hướng dẫn chuyển đổi cho người đóng góp
Nếu bạn có các nhánh cục bộ hoặc tài liệu tham chiếu đến cấu trúc cũ:
1. Cập nhật tham chiếu thư mục: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Cập nhật tham chiếu tệp: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Thay đổi tên sản phẩm: "Azure AI Foundry" → "Microsoft Foundry"
4. Xác minh tất cả các liên kết tài liệu nội bộ vẫn hoạt động

---

### [v3.4.0] - 2025-10-24

#### Xem trước hạ tầng và cải tiến xác thực
**Phiên bản này giới thiệu hỗ trợ toàn diện cho tính năng xem trước Azure Developer CLI và cải thiện trải nghiệm người dùng workshop.**

#### Đã thêm
- **🧪 Tài liệu tính năng azd provision --preview**: Bao quát toàn diện khả năng xem trước hạ tầng mới
  - Tham chiếu lệnh và ví dụ sử dụng trong cheat sheet
  - Tích hợp chi tiết trong hướng dẫn triển khai với các trường hợp sử dụng và lợi ích
  - Tích hợp kiểm tra trước khi triển khai để đảm bảo an toàn
  - Cập nhật hướng dẫn bắt đầu với thực hành triển khai an toàn
- **🚧 Banner trạng thái workshop**: Banner HTML chuyên nghiệp chỉ rõ trạng thái phát triển workshop
  - Thiết kế gradient với các chỉ báo xây dựng để giao tiếp rõ ràng với người dùng
  - Dấu thời gian cập nhật lần cuối để minh bạch
  - Thiết kế đáp ứng cho thiết bị di động

#### Đã cải tiến
- **An toàn hạ tầng**: Tính năng xem trước được tích hợp xuyên suốt tài liệu triển khai
- **Xác thực trước triển khai**: Các script tự động hiện bao gồm kiểm tra xem trước hạ tầng
- **Quy trình làm việc của nhà phát triển**: Cập nhật chuỗi lệnh để bao gồm xem trước như một thực hành tốt nhất
- **Trải nghiệm workshop**: Đặt kỳ vọng rõ ràng cho người dùng về trạng thái phát triển nội dung

#### Đã thay đổi
- **Thực hành triển khai tốt nhất**: Quy trình làm việc ưu tiên xem trước hiện được khuyến nghị
- **Luồng tài liệu**: Xác thực hạ tầng được chuyển lên sớm hơn trong quá trình học
- **Trình bày workshop**: Giao tiếp trạng thái chuyên nghiệp với thời gian phát triển rõ ràng

#### Đã cải thiện
- **Cách tiếp cận an toàn**: Các thay đổi hạ tầng hiện có thể được xác thực trước khi triển khai
- **Hợp tác nhóm**: Kết quả xem trước có thể được chia sẻ để xem xét và phê duyệt
- **Nhận thức về chi phí**: Hiểu rõ hơn về chi phí tài nguyên trước khi triển khai
- **Giảm thiểu rủi ro**: Giảm thất bại triển khai thông qua xác thực trước

#### Triển khai kỹ thuật
- **Tích hợp đa tài liệu**: Tính năng xem trước được tài liệu hóa trong 4 tệp chính
- **Mẫu lệnh**: Cú pháp và ví dụ nhất quán xuyên suốt tài liệu
- **Tích hợp thực hành tốt nhất**: Xem trước được bao gồm trong quy trình xác thực và script
- **Chỉ báo trực quan**: Đánh dấu tính năng MỚI rõ ràng để dễ dàng khám phá

#### Hạ tầng workshop
- **Giao tiếp trạng thái**: Banner HTML chuyên nghiệp với kiểu dáng gradient
- **Trải nghiệm người dùng**: Trạng thái phát triển rõ ràng ngăn ngừa nhầm lẫn
- **Trình bày chuyên nghiệp**: Duy trì uy tín của kho lưu trữ trong khi đặt kỳ vọng
- **Minh bạch thời gian**: Dấu thời gian cập nhật lần cuối vào tháng 10 năm 2025 để đảm bảo trách nhiệm

### [v3.3.0] - 2025-09-24

#### Tài liệu workshop nâng cao và trải nghiệm học tập tương tác
**Phiên bản này giới thiệu tài liệu workshop toàn diện với hướng dẫn tương tác trên trình duyệt và lộ trình học tập có cấu trúc.**

#### Đã thêm
- **🎥 Hướng dẫn workshop tương tác**: Trải nghiệm workshop trên trình duyệt với khả năng xem trước MkDocs
- **📝 Hướng dẫn workshop có cấu trúc**: Lộ trình học tập 7 bước từ khám phá đến tùy chỉnh
  - 0-Giới thiệu: Tổng quan và thiết lập workshop
  - 1-Chọn mẫu AI: Quy trình khám phá và chọn mẫu
  - 2-Xác thực mẫu AI: Quy trình triển khai và xác thực
  - 3-Phân tích mẫu AI: Hiểu kiến trúc mẫu
  - 4-Cấu hình mẫu AI: Cấu hình và tùy chỉnh
  - 5-Tùy chỉnh mẫu AI: Sửa đổi nâng cao và lặp lại
  - 6-Gỡ bỏ hạ tầng: Dọn dẹp và quản lý tài nguyên
  - 7-Kết thúc: Tóm tắt và bước tiếp theo
- **🛠️ Công cụ workshop**: Cấu hình MkDocs với chủ đề Material để cải thiện trải nghiệm học tập
- **🎯 Lộ trình học tập thực hành**: Phương pháp 3 bước (Khám phá → Triển khai → Tùy chỉnh)
- **📱 Tích hợp GitHub Codespaces**: Thiết lập môi trường phát triển liền mạch

#### Đã cải tiến
- **Phòng thí nghiệm workshop AI**: Mở rộng với trải nghiệm học tập có cấu trúc kéo dài 2-3 giờ
- **Tài liệu workshop**: Trình bày chuyên nghiệp với điều hướng và hỗ trợ trực quan
- **Tiến trình học tập**: Hướng dẫn từng bước rõ ràng từ chọn mẫu đến triển khai sản xuất
- **Trải nghiệm nhà phát triển**: Tích hợp công cụ để tối ưu hóa quy trình làm việc phát triển

#### Đã cải thiện
- **Khả năng tiếp cận**: Giao diện trên trình duyệt với chức năng tìm kiếm, sao chép và chuyển đổi chủ đề
- **Học tập tự định hướng**: Cấu trúc workshop linh hoạt phù hợp với tốc độ học tập khác nhau
- **Ứng dụng thực tế**: Các kịch bản triển khai mẫu AI trong thế giới thực
- **Tích hợp cộng đồng**: Tích hợp Discord để hỗ trợ và hợp tác trong workshop

#### Tính năng workshop
- **Tìm kiếm tích hợp**: Tìm kiếm từ khóa và bài học nhanh chóng
- **Sao chép khối mã**: Chức năng sao chép khi di chuột cho tất cả các ví dụ mã
- **Chuyển đổi chủ đề**: Hỗ trợ chế độ tối/sáng cho các sở thích khác nhau
- **Tài sản trực quan**: Ảnh chụp màn hình và sơ đồ để hiểu rõ hơn
- **Tích hợp trợ giúp**: Truy cập trực tiếp Discord để hỗ trợ cộng đồng

### [v3.2.0] - 2025-09-17

#### Tái cấu trúc điều hướng lớn và hệ thống học tập theo chương
**Phiên bản này giới thiệu cấu trúc học tập theo chương toàn diện với điều hướng nâng cao xuyên suốt kho lưu trữ.**

#### Đã thêm
- **📚 Hệ thống học tập theo chương**: Tái cấu trúc toàn bộ khóa học thành 8 chương học tập tiến bộ
  - Chương 1: Nền tảng & Bắt đầu nhanh (⭐ - 30-45 phút)
  - Chương 2: Phát triển AI đầu tiên (⭐⭐ - 1-2 giờ)
  - Chương 3: Cấu hình & Xác thực (⭐⭐ - 45-60 phút)
  - Chương 4: Hạ tầng dưới dạng mã & Triển khai (⭐⭐⭐ - 1-1.5 giờ)
  - Chương 5: Giải pháp AI đa tác nhân (⭐⭐⭐⭐ - 2-3 giờ)
  - Chương 6: Xác thực & Lập kế hoạch trước triển khai (⭐⭐ - 1 giờ)
  - Chương 7: Khắc phục sự cố & Gỡ lỗi (⭐⭐ - 1-1.5 giờ)
  - Chương 8: Mô hình sản xuất & Doanh nghiệp (⭐⭐⭐⭐ - 2-3 giờ)
- **📚 Hệ thống điều hướng toàn diện**: Tiêu đề và chân trang điều hướng nhất quán trên tất cả tài liệu
- **🎯 Theo dõi tiến trình**: Danh sách kiểm tra hoàn thành khóa học và hệ thống xác minh học tập
- **🗺️ Hướng dẫn lộ trình học tập**: Điểm vào rõ ràng cho các cấp độ kinh nghiệm và mục tiêu khác nhau
- **🔗 Điều hướng tham chiếu chéo**: Các chương liên quan và điều kiện tiên quyết được liên kết rõ ràng

#### Đã cải tiến
- **Cấu trúc README**: Chuyển đổi thành nền tảng học tập có cấu trúc với tổ chức theo chương
- **Điều hướng tài liệu**: Mỗi trang hiện bao gồm ngữ cảnh chương và hướng dẫn tiến trình
- **Tổ chức mẫu**: Các ví dụ và mẫu được ánh xạ đến các chương học tập phù hợp
- **Tích hợp tài nguyên**: Cheat sheet, FAQ và hướng dẫn học tập được kết nối với các chương liên quan
- **Tích hợp workshop**: Phòng thí nghiệm thực hành được ánh xạ đến nhiều mục tiêu học tập của chương

#### Đã thay đổi
- **Tiến trình học tập**: Chuyển từ tài liệu tuyến tính sang học tập linh hoạt theo chương
- **Vị trí cấu hình**: Đặt lại hướng dẫn cấu hình thành Chương 3 để cải thiện luồng học tập
- **Tích hợp nội dung AI**: Tích hợp tốt hơn nội dung cụ thể về AI xuyên suốt hành trình học tập
- **Nội dung sản xuất**: Các mẫu nâng cao được hợp nhất trong Chương 8 dành cho người học doanh nghiệp

#### Đã cải thiện
- **Trải nghiệm người dùng**: Dấu breadcrumbs điều hướng rõ ràng và chỉ báo tiến trình chương
- **Khả năng tiếp cận**: Mẫu điều hướng nhất quán để dễ dàng di chuyển trong khóa học
- **Trình bày chuyên nghiệp**: Cấu trúc khóa học kiểu đại học phù hợp cho đào tạo học thuật và doanh nghiệp
- **Hiệu quả học tập**: Giảm thời gian tìm nội dung liên quan thông qua tổ chức cải tiến

#### Triển khai kỹ thuật
- **Tiêu đề điều hướng**: Tiêu đề điều hướng chương được chuẩn hóa trên hơn 40 tệp tài liệu
- **Điều hướng chân trang**: Hướng dẫn tiến trình nhất quán và chỉ báo hoàn thành chương
- **Liên kết chéo**: Hệ thống liên kết nội bộ toàn diện kết nối các khái niệm liên quan
- **Ánh xạ chương**: Các mẫu và ví dụ được liên kết rõ ràng với các mục tiêu học tập

#### Cải tiến hướng dẫn học tập
- **📚 Mục tiêu học tập toàn diện**: Tái cấu trúc hướng dẫn học tập để phù hợp với hệ thống 8 chương
- **🎯 Đánh giá theo chương**: Mỗi chương bao gồm các mục tiêu học tập cụ thể và bài tập thực hành
- **📋 Theo dõi tiến trình**: Lịch trình học tập hàng tuần với kết quả đo lường và danh sách kiểm tra hoàn thành
- **❓ Câu hỏi đánh giá**: Câu hỏi xác thực kiến thức cho mỗi chương với kết quả chuyên nghiệp
- **🛠️ Bài tập thực hành**: Hoạt động thực hành với các kịch bản triển khai thực tế và khắc phục sự cố
- **📊 Tiến trình kỹ năng**: Tiến bộ rõ ràng từ các khái niệm cơ bản đến các mẫu doanh nghiệp với trọng tâm phát triển nghề nghiệp
- **🎓 Khung chứng nhận**: Kết quả phát triển chuyên nghiệp và hệ thống công nhận cộng đồng
- **⏱️ Quản lý thời gian**: Kế hoạch học tập 10 tuần có cấu trúc với xác thực cột mốc

### [v3.1.0] - 2025-09-17

#### Cải tiến giải pháp AI đa tác nhân
**Phiên bản này cải thiện giải pháp bán lẻ đa tác nhân với cách đặt tên tác nhân tốt hơn và tài liệu nâng cao.**

#### Đã thay đổi
- **Thuật ngữ đa tác nhân**: Thay thế "Cora agent" bằng "Customer agent" trong toàn bộ giải pháp bán lẻ đa tác nhân để dễ hiểu hơn
- **Kiến trúc tác nhân**: Cập nhật tất cả tài liệu, mẫu ARM và ví dụ mã để sử dụng cách đặt tên "Customer agent" nhất quán
- **Ví dụ cấu hình**: Hiện đại hóa các mẫu cấu hình tác nhân với cách đặt tên được cập nhật
- **Tính nhất quán tài liệu**: Đảm bảo tất cả các tham chiếu sử dụng tên tác nhân chuyên nghiệp, mô tả

#### Đã cải tiến
- **Gói mẫu ARM**: Cập nhật retail-multiagent-arm-template với các tham chiếu Customer agent
- **Sơ đồ kiến trúc**: Làm mới sơ đồ Mermaid với cách đặt tên tác nhân được cập nhật
- **Ví dụ mã**: Các lớp Python và ví dụ triển khai hiện sử dụng cách đặt tên CustomerAgent
- **Biến môi trường**: Cập nhật tất cả script triển khai để sử dụng các mẫu CUSTOMER_AGENT_NAME

#### Đã cải thiện
- **Trải nghiệm nhà phát triển**: Vai trò và trách nhiệm của tác nhân rõ ràng hơn trong tài liệu
- **Sẵn sàng sản xuất**: Cách đặt tên phù hợp hơn với các quy ước doanh nghiệp
- **Tài liệu học tập**: Cách đặt tên tác nhân trực quan hơn cho mục đích giáo dục
- **Khả năng sử dụng mẫu**: Hiểu đơn giản hơn về chức năng tác nhân và mẫu triển khai

#### Chi tiết kỹ thuật
- Cập nhật sơ đồ kiến trúc Mermaid với các tham chiếu CustomerAgent
- Thay thế tên lớp CoraAgent bằng CustomerAgent trong các ví dụ Python
- Sửa đổi cấu hình JSON mẫu ARM để sử dụng loại tác nhân "customer"
- Cập nhật biến môi trường từ CORA_AGENT_* sang các mẫu CUSTOMER_AGENT_*
- Làm mới tất cả các lệnh triển khai và cấu hình container

### [v3.0.0] - 2025-09-12

#### Thay đổi lớn - Tập trung vào nhà phát triển AI và tích hợp Azure AI Foundry
**Phiên bản này biến kho lưu trữ thành tài nguyên học tập toàn diện tập trung vào AI với tích hợp Azure AI Foundry.**

#### Đã thêm
- **🤖 Lộ trình học tập AI đầu tiên**: Tái cấu trúc hoàn chỉnh ưu tiên các nhà phát triển và kỹ sư AI
- **Hướng dẫn tích hợp Azure AI Foundry**: Tài liệu toàn diện về kết nối AZD với các dịch vụ Azure AI Foundry
- **Mẫu triển khai mô hình AI**: Hướng dẫn chi tiết về lựa chọn mô hình, cấu hình và chiến lược triển khai sản xuất
- **Phòng thí nghiệm workshop AI**: Workshop thực hành kéo dài 2-3 giờ để chuyển đổi ứng dụng AI thành giải pháp có thể triển khai AZD
- **Thực hành tốt nhất AI sản xuất**: Các mẫu sẵn sàng cho doanh nghiệp để mở rộng, giám sát và bảo mật khối lượng công việc AI
- **Hướng dẫn khắc phục sự cố AI cụ thể**: Khắc phục sự cố toàn diện cho Azure OpenAI, Cognitive Services và các vấn đề triển khai AI
- **Thư viện mẫu AI**: Bộ sưu tập nổi bật các mẫu Azure AI Foundry với xếp hạng độ phức tạp
- **Tài liệu workshop**: Cấu trúc workshop hoàn chỉnh với các phòng thí nghiệm thực hành và tài liệu tham khảo

#### Đã cải tiến
- **Cấu trúc README**: Tập trung vào nhà phát triển AI với dữ liệu quan tâm cộng đồng 45% từ Discord Azure AI Foundry
- **Lộ trình học tập**: Hành trình dành riêng cho nhà phát triển AI bên cạnh các lộ trình truyền thống cho sinh viên và kỹ sư DevOps
- **Khuyến nghị mẫu**: Các mẫu AI nổi bật bao gồm azure-search-openai-demo, contoso-chat và openai-chat-app-quickstart
- **Tích hợp cộng đồng**: Hỗ trợ cộng đồng Discord nâng cao với các kênh và thảo luận cụ thể về AI

#### Tập trung vào bảo mật & sản xuất
- **Mẫu nhận dạng được quản lý**: Cấu hình xác thực và bảo mật cụ thể cho AI
- **Tối ưu hóa chi phí**: Theo dõi sử dụng token và kiểm soát ngân sách cho khối lượng công việc AI
- **Triển khai đa vùng**: Chiến lược triển khai ứng dụng AI toàn cầu
- **Giám sát hiệu suất**: Các chỉ số cụ thể về AI và tích hợp Application Insights

#### Chất lượng tài liệu
- **Cấu trúc khóa học tuyến tính**: Tiến trình logic từ các mẫu triển khai AI cơ bản đến nâng cao
- **URL đã xác thực**: Tất cả các liên kết kho lưu trữ bên ngoài được xác minh và truy cập được
- **Tham chiếu hoàn chỉnh**: Tất cả các liên kết tài liệu nội bộ được xác thực và hoạt động
- **Sẵn sàng sản xuất**: Các mẫu triển khai doanh nghiệp với ví dụ thực tế

### [v2.0.0] - 2025-09-09

#### Thay đổi lớn - Tái cấu trúc kho lưu trữ và nâng cao
- **Trình bày nội dung**: Loại bỏ các yếu tố trang trí để tập trung vào định dạng rõ ràng, chuyên nghiệp
- **Cấu trúc liên kết**: Cập nhật tất cả các liên kết nội bộ để hỗ trợ hệ thống điều hướng mới

#### Cải tiến
- **Khả năng tiếp cận**: Loại bỏ sự phụ thuộc vào biểu tượng cảm xúc để cải thiện khả năng tương thích với trình đọc màn hình
- **Giao diện chuyên nghiệp**: Trình bày sạch sẽ, phong cách học thuật phù hợp cho học tập doanh nghiệp
- **Trải nghiệm học tập**: Cách tiếp cận có cấu trúc với mục tiêu và kết quả rõ ràng cho mỗi bài học
- **Tổ chức nội dung**: Dòng chảy logic tốt hơn và kết nối giữa các chủ đề liên quan

### [v1.0.0] - 2025-09-09

#### Phiên bản đầu tiên - Kho tài liệu học tập AZD toàn diện

#### Đã thêm
- **Cấu trúc tài liệu cốt lõi**
  - Loạt hướng dẫn bắt đầu hoàn chỉnh
  - Tài liệu triển khai và cung cấp toàn diện
  - Tài nguyên khắc phục sự cố và hướng dẫn gỡ lỗi chi tiết
  - Công cụ và quy trình xác thực trước khi triển khai

- **Module Bắt đầu**
  - AZD Cơ bản: Các khái niệm và thuật ngữ cốt lõi
  - Hướng dẫn cài đặt: Hướng dẫn thiết lập theo nền tảng
  - Hướng dẫn cấu hình: Thiết lập môi trường và xác thực
  - Hướng dẫn dự án đầu tiên: Học tập thực hành từng bước

- **Module Triển khai và Cung cấp**
  - Hướng dẫn triển khai: Tài liệu quy trình làm việc hoàn chỉnh
  - Hướng dẫn cung cấp: Hạ tầng dưới dạng mã với Bicep
  - Các thực hành tốt nhất cho triển khai sản xuất
  - Mẫu kiến trúc đa dịch vụ

- **Module Xác thực trước khi triển khai**
  - Lập kế hoạch năng lực: Xác thực khả dụng tài nguyên Azure
  - Lựa chọn SKU: Hướng dẫn toàn diện về cấp dịch vụ
  - Kiểm tra trước: Các script xác thực tự động (PowerShell và Bash)
  - Công cụ ước tính chi phí và lập kế hoạch ngân sách

- **Module Khắc phục sự cố**
  - Các vấn đề phổ biến: Các vấn đề thường gặp và giải pháp
  - Hướng dẫn gỡ lỗi: Phương pháp khắc phục sự cố có hệ thống
  - Kỹ thuật và công cụ chẩn đoán nâng cao
  - Giám sát hiệu suất và tối ưu hóa

- **Tài nguyên và tham khảo**
  - Bảng lệnh nhanh: Tham khảo nhanh các lệnh thiết yếu
  - Thuật ngữ: Định nghĩa thuật ngữ và từ viết tắt toàn diện
  - FAQ: Câu trả lời chi tiết cho các câu hỏi thường gặp
  - Liên kết tài nguyên bên ngoài và kết nối cộng đồng

- **Ví dụ và mẫu**
  - Ví dụ ứng dụng web đơn giản
  - Mẫu triển khai trang web tĩnh
  - Cấu hình ứng dụng container
  - Mẫu tích hợp cơ sở dữ liệu
  - Ví dụ kiến trúc microservices
  - Triển khai chức năng serverless

#### Tính năng
- **Hỗ trợ đa nền tảng**: Hướng dẫn cài đặt và cấu hình cho Windows, macOS, và Linux
- **Nhiều cấp độ kỹ năng**: Nội dung dành cho sinh viên đến các nhà phát triển chuyên nghiệp
- **Tập trung thực hành**: Ví dụ thực hành và kịch bản thực tế
- **Phạm vi toàn diện**: Từ các khái niệm cơ bản đến các mẫu doanh nghiệp nâng cao
- **Cách tiếp cận ưu tiên bảo mật**: Tích hợp các thực hành tốt nhất về bảo mật xuyên suốt
- **Tối ưu hóa chi phí**: Hướng dẫn triển khai hiệu quả về chi phí và quản lý tài nguyên

#### Chất lượng tài liệu
- **Ví dụ mã chi tiết**: Các mẫu mã thực tế, đã được kiểm tra
- **Hướng dẫn từng bước**: Hướng dẫn rõ ràng, có thể thực hiện
- **Xử lý lỗi toàn diện**: Khắc phục sự cố cho các vấn đề phổ biến
- **Tích hợp thực hành tốt nhất**: Tiêu chuẩn ngành và khuyến nghị
- **Tương thích phiên bản**: Cập nhật với các dịch vụ Azure mới nhất và tính năng azd

## Các cải tiến dự kiến trong tương lai

### Phiên bản 3.1.0 (Dự kiến)
#### Mở rộng nền tảng AI
- **Hỗ trợ đa mô hình**: Các mẫu tích hợp cho Hugging Face, Azure Machine Learning, và mô hình tùy chỉnh
- **Khung tác nhân AI**: Mẫu cho LangChain, Semantic Kernel, và triển khai AutoGen
- **Mẫu RAG nâng cao**: Các tùy chọn cơ sở dữ liệu vector ngoài Azure AI Search (Pinecone, Weaviate, v.v.)
- **Khả năng quan sát AI**: Giám sát nâng cao hiệu suất mô hình, sử dụng token, và chất lượng phản hồi

#### Trải nghiệm nhà phát triển
- **Tiện ích mở rộng VS Code**: Trải nghiệm phát triển tích hợp AZD + AI Foundry
- **Tích hợp GitHub Copilot**: Tạo mẫu AZD hỗ trợ AI
- **Hướng dẫn tương tác**: Bài tập mã hóa thực hành với xác thực tự động cho các kịch bản AI
- **Nội dung video**: Video hướng dẫn bổ sung cho người học trực quan tập trung vào triển khai AI

### Phiên bản 4.0.0 (Dự kiến)
#### Mẫu AI doanh nghiệp
- **Khung quản trị**: Quản trị mô hình AI, tuân thủ, và dấu vết kiểm toán
- **AI đa khách hàng**: Mẫu phục vụ nhiều khách hàng với các dịch vụ AI riêng biệt
- **Triển khai AI tại biên**: Tích hợp với Azure IoT Edge và các instance container
- **AI đám mây lai**: Mẫu triển khai đa đám mây và lai cho khối lượng công việc AI

#### Tính năng nâng cao
- **Tự động hóa pipeline AI**: Tích hợp MLOps với các pipeline Azure Machine Learning
- **Bảo mật nâng cao**: Mẫu zero-trust, điểm cuối riêng, và bảo vệ mối đe dọa nâng cao
- **Tối ưu hóa hiệu suất**: Chiến lược điều chỉnh và mở rộng nâng cao cho các ứng dụng AI thông lượng cao
- **Phân phối toàn cầu**: Mẫu phân phối nội dung và bộ nhớ đệm tại biên cho các ứng dụng AI

### Phiên bản 3.0.0 (Dự kiến) - Đã thay thế bởi phiên bản hiện tại
#### Các bổ sung đề xuất - Đã triển khai trong v3.0.0
- ✅ **Nội dung tập trung vào AI**: Tích hợp toàn diện Azure AI Foundry (Hoàn thành)
- ✅ **Hướng dẫn tương tác**: Phòng thí nghiệm workshop AI thực hành (Hoàn thành)
- ✅ **Module bảo mật nâng cao**: Mẫu bảo mật dành riêng cho AI (Hoàn thành)
- ✅ **Tối ưu hóa hiệu suất**: Chiến lược điều chỉnh khối lượng công việc AI (Hoàn thành)

### Phiên bản 2.1.0 (Dự kiến) - Đã triển khai một phần trong v3.0.0
#### Các cải tiến nhỏ - Một số đã hoàn thành trong phiên bản hiện tại
- ✅ **Ví dụ bổ sung**: Kịch bản triển khai tập trung vào AI (Hoàn thành)
- ✅ **FAQ mở rộng**: Câu hỏi và khắc phục sự cố dành riêng cho AI (Hoàn thành)
- **Tích hợp công cụ**: Hướng dẫn tích hợp IDE và trình soạn thảo nâng cao
- ✅ **Mở rộng giám sát**: Mẫu giám sát và cảnh báo dành riêng cho AI (Hoàn thành)

#### Vẫn được lên kế hoạch cho phiên bản tương lai
- **Tài liệu thân thiện với di động**: Thiết kế đáp ứng cho học tập trên thiết bị di động
- **Truy cập ngoại tuyến**: Gói tài liệu có thể tải xuống
- **Tích hợp IDE nâng cao**: Tiện ích mở rộng VS Code cho quy trình làm việc AZD + AI
- **Bảng điều khiển cộng đồng**: Số liệu cộng đồng theo thời gian thực và theo dõi đóng góp

## Đóng góp cho nhật ký thay đổi

### Báo cáo thay đổi
Khi đóng góp cho kho lưu trữ này, hãy đảm bảo các mục nhật ký thay đổi bao gồm:

1. **Số phiên bản**: Theo phiên bản ngữ nghĩa (major.minor.patch)
2. **Ngày**: Ngày phát hành hoặc cập nhật theo định dạng YYYY-MM-DD
3. **Danh mục**: Đã thêm, Đã thay đổi, Đã ngừng, Đã xóa, Đã sửa, Bảo mật
4. **Mô tả rõ ràng**: Mô tả ngắn gọn về những gì đã thay đổi
5. **Đánh giá tác động**: Cách thay đổi ảnh hưởng đến người dùng hiện tại

### Danh mục thay đổi

#### Đã thêm
- Tính năng mới, phần tài liệu hoặc khả năng mới
- Ví dụ mới, mẫu hoặc tài nguyên học tập
- Công cụ, script hoặc tiện ích bổ sung

#### Đã thay đổi
- Sửa đổi chức năng hoặc tài liệu hiện có
- Cập nhật để cải thiện độ rõ ràng hoặc độ chính xác
- Tái cấu trúc nội dung hoặc tổ chức

#### Đã ngừng
- Tính năng hoặc phương pháp đang bị loại bỏ
- Phần tài liệu dự kiến sẽ bị xóa
- Phương pháp có các lựa chọn thay thế tốt hơn

#### Đã xóa
- Tính năng, tài liệu hoặc ví dụ không còn phù hợp
- Thông tin lỗi thời hoặc phương pháp đã ngừng
- Nội dung dư thừa hoặc đã được hợp nhất

#### Đã sửa
- Sửa lỗi trong tài liệu hoặc mã
- Giải quyết các vấn đề hoặc sự cố đã báo cáo
- Cải thiện độ chính xác hoặc chức năng

#### Bảo mật
- Cải tiến hoặc sửa lỗi liên quan đến bảo mật
- Cập nhật các thực hành tốt nhất về bảo mật
- Giải quyết các lỗ hổng bảo mật

### Hướng dẫn phiên bản ngữ nghĩa

#### Phiên bản chính (X.0.0)
- Thay đổi lớn yêu cầu hành động của người dùng
- Tái cấu trúc nội dung hoặc tổ chức đáng kể
- Thay đổi làm thay đổi cách tiếp cận hoặc phương pháp cơ bản

#### Phiên bản phụ (X.Y.0)
- Tính năng mới hoặc bổ sung nội dung
- Cải tiến duy trì khả năng tương thích ngược
- Ví dụ, công cụ hoặc tài nguyên bổ sung

#### Phiên bản vá lỗi (X.Y.Z)
- Sửa lỗi và chỉnh sửa
- Cải tiến nhỏ cho nội dung hiện có
- Làm rõ và nâng cấp nhỏ

## Phản hồi và đề xuất từ cộng đồng

Chúng tôi khuyến khích mạnh mẽ phản hồi từ cộng đồng để cải thiện tài nguyên học tập này:

### Cách cung cấp phản hồi
- **GitHub Issues**: Báo cáo vấn đề hoặc đề xuất cải tiến (hoan nghênh các vấn đề liên quan đến AI)
- **Thảo luận trên Discord**: Chia sẻ ý tưởng và tham gia cộng đồng Azure AI Foundry
- **Pull Requests**: Đóng góp cải tiến trực tiếp cho nội dung, đặc biệt là các mẫu và hướng dẫn AI
- **Discord Azure AI Foundry**: Tham gia kênh #Azure để thảo luận về AZD + AI
- **Diễn đàn cộng đồng**: Tham gia các cuộc thảo luận rộng hơn của nhà phát triển Azure

### Danh mục phản hồi
- **Độ chính xác nội dung AI**: Sửa thông tin tích hợp và triển khai dịch vụ AI
- **Trải nghiệm học tập**: Đề xuất cải thiện luồng học tập cho nhà phát triển AI
- **Nội dung AI còn thiếu**: Yêu cầu thêm mẫu, mẫu hoặc ví dụ AI
- **Khả năng tiếp cận**: Cải tiến cho nhu cầu học tập đa dạng
- **Tích hợp công cụ AI**: Đề xuất cải thiện quy trình làm việc phát triển AI
- **Mẫu triển khai AI sản xuất**: Yêu cầu mẫu triển khai AI doanh nghiệp

### Cam kết phản hồi
- **Phản hồi vấn đề**: Trong vòng 48 giờ đối với các vấn đề đã báo cáo
- **Yêu cầu tính năng**: Đánh giá trong vòng một tuần
- **Đóng góp cộng đồng**: Xem xét trong vòng một tuần
- **Vấn đề bảo mật**: Ưu tiên ngay lập tức với phản hồi nhanh chóng

## Lịch trình bảo trì

### Cập nhật thường xuyên
- **Đánh giá hàng tháng**: Độ chính xác nội dung và xác thực liên kết
- **Cập nhật hàng quý**: Bổ sung và cải tiến nội dung lớn
- **Đánh giá nửa năm**: Tái cấu trúc và nâng cấp toàn diện
- **Phát hành hàng năm**: Cập nhật phiên bản chính với các cải tiến đáng kể

### Giám sát và đảm bảo chất lượng
- **Kiểm tra tự động**: Xác thực thường xuyên các ví dụ mã và liên kết
- **Tích hợp phản hồi cộng đồng**: Kết hợp thường xuyên các đề xuất của người dùng
- **Cập nhật công nghệ**: Căn chỉnh với các dịch vụ Azure mới nhất và phát hành azd
- **Kiểm tra khả năng tiếp cận**: Đánh giá thường xuyên các nguyên tắc thiết kế toàn diện

## Chính sách hỗ trợ phiên bản

### Hỗ trợ phiên bản hiện tại
- **Phiên bản chính mới nhất**: Hỗ trợ đầy đủ với các cập nhật thường xuyên
- **Phiên bản chính trước đó**: Cập nhật bảo mật và sửa lỗi quan trọng trong 12 tháng
- **Phiên bản cũ**: Chỉ hỗ trợ cộng đồng, không có cập nhật chính thức

### Hướng dẫn di chuyển
Khi các phiên bản chính được phát hành, chúng tôi cung cấp:
- **Hướng dẫn di chuyển**: Hướng dẫn chuyển đổi từng bước
- **Ghi chú tương thích**: Chi tiết về các thay đổi lớn
- **Hỗ trợ công cụ**: Script hoặc tiện ích hỗ trợ di chuyển
- **Hỗ trợ cộng đồng**: Diễn đàn dành riêng cho các câu hỏi di chuyển

---

**Điều hướng**
- **Bài học trước**: [Hướng dẫn học tập](resources/study-guide.md)
- **Bài học tiếp theo**: Quay lại [README chính](README.md)

**Cập nhật thường xuyên**: Theo dõi kho lưu trữ này để nhận thông báo về các phiên bản mới và cập nhật quan trọng cho tài liệu học tập.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->