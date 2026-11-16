# Đóng góp cho AZD For Beginners

Cảm ơn bạn đã quan tâm đến việc đóng góp cho khóa học AZD For Beginners! Tài liệu này cung cấp các hướng dẫn và thông tin dành cho những người đóng góp.

## Cách đóng góp

### Báo cáo sự cố

Nếu bạn tìm thấy lỗi, sự cố hoặc có đề xuất cải tiến:

1. **Kiểm tra sự cố hiện tại**: Tìm kiếm [các sự cố hiện có](https://github.com/microsoft/azd-for-beginners/issues) để tránh trùng lặp
2. **Tạo sự cố mới**: Sử dụng mẫu sự cố phù hợp
3. **Cung cấp chi tiết**: Bao gồm các bước tái tạo, hành vi mong đợi và ảnh chụp màn hình nếu có

### Đề xuất thay đổi

1. **Fork kho lưu trữ**: Tạo bản fork của dự án cho riêng bạn
2. **Tạo nhánh**: Tạo nhánh tính năng cho các thay đổi của bạn
3. **Thực hiện thay đổi**: Tuân theo tiêu chuẩn mã nguồn và tài liệu của chúng tôi
4. **Kiểm tra thay đổi**: Xác minh tất cả liên kết hoạt động và nội dung hiển thị chính xác
5. **Gửi Pull Request**: Cung cấp mô tả rõ ràng về những thay đổi của bạn

### Các loại đóng góp

Chúng tôi hoan nghênh các loại đóng góp sau:

#### Cải tiến nội dung
- Sửa lỗi chính tả, ngữ pháp và vấn đề định dạng
- Cải thiện sự rõ ràng của tài liệu hiện có
- Cập nhật thông tin lỗi thời
- Thêm giải thích hoặc ngữ cảnh còn thiếu

#### Ví dụ mới
- Thêm các kịch bản triển khai thực tế
- Tạo mẫu AZD mới cho các trường hợp sử dụng phổ biến
- Cung cấp thêm mẫu code và bài tập

#### Hỗ trợ dịch thuật
- Giúp duy trì các bản dịch hiện có
- Cải thiện chất lượng bản dịch
- Thêm bản dịch cho nội dung mới

#### Báo cáo lỗi
- Báo cáo liên kết hỏng hoặc ví dụ mã sai
- Xác định sự không nhất quán trong tài liệu
- Đánh dấu các vấn đề về khả năng tiếp cận

## Hướng dẫn đóng góp

### Tiêu chuẩn tài liệu

- Sử dụng ngôn ngữ rõ ràng, thân thiện với người mới bắt đầu
- Bao gồm mục tiêu học tập và kết quả mong đợi
- Cung cấp hướng dẫn từng bước với kết quả dự kiến
- Thêm liên kết điều hướng tới nội dung liên quan
- Sử dụng định dạng và phong cách markdown nhất quán

### Ví dụ mã

- Đảm bảo tất cả ví dụ mã được kiểm tra và hoạt động đúng
- Bao gồm chú thích giải thích các khái niệm chính
- Tuân theo các thực hành tốt nhất của Azure và AZD
- Cung cấp đầu ra mong đợi khi có thể

### Xác thực tài liệu tiếng Anh

Từ thư mục gốc của kho lưu trữ, cài đặt các yêu cầu phát triển hiện có và chạy:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Trình kiểm tra liên kết offline kiểm tra các đường dẫn Markdown/HTML tiếng Anh, tiêu đề, mỏ neo rõ ràng và các chỗ giữ liên kết trống. Nó loại trừ các thư mục tạo bởi `translations/` và `translated_images/`, bao gồm liên kết đến các thư mục đó. Nó không truy xuất các trang web bên ngoài hoặc xác thực các triển khai Azure. Sử dụng `--json <report-path>` để xuất các lỗi và danh mục URL bên ngoài cho việc kiểm tra mạng riêng biệt. Xác minh các lệnh đầu nguồn và các điều kiện tiên quyết mẫu hiện tại khi thay đổi hướng dẫn kỹ thuật; phân biệt các ứng dụng đã kiểm thử với bản thiết kế mẫu.

### Thông điệp commit

Sử dụng thông điệp commit rõ ràng, mô tả:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Quy tắc ứng xử

Vui lòng đọc và tuân theo [Quy tắc ứng xử](CODE_OF_CONDUCT.md) của chúng tôi để duy trì một cộng đồng thân thiện và hòa nhập.

## Nhận trợ giúp

- **Câu hỏi**: Tìm kiếm hoặc mở một [vấn đề GitHub](https://github.com/microsoft/AZD-for-beginners/issues)
- **Cộng đồng**: Tham gia [Azure Discord](https://discord.gg/microsoft-azure)
- **Tài liệu**: Xem lại [tài liệu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Giấy phép

Khi đóng góp cho kho lưu trữ này, bạn đồng ý rằng các đóng góp của bạn sẽ được cấp phép theo [Giấy phép MIT](../../LICENSE).

---

Cảm ơn bạn đã giúp làm cho AZD For Beginners trở thành một tài nguyên học tập tốt hơn cho cộng đồng!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->