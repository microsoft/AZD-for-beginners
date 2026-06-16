# 6. Dỡ bỏ Hạ tầng

!!! tip "KHI KẾT THÚC MODULE NÀY BẠN SẼ CÓ THỂ"

    - [ ] Hiểu tầm quan trọng của việc dọn dẹp tài nguyên và quản lý chi phí
    - [ ] Sử dụng `azd down` để gỡ bỏ hạ tầng một cách an toàn
    - [ ] Phục hồi các dịch vụ Azure AI bị xóa mềm nếu cần
    - [ ] **Lab 6:** Dọn dẹp tài nguyên Azure và xác minh việc loại bỏ

---

## Bài tập bổ sung

Trước khi dỡ bỏ dự án, hãy dành vài phút để khám phá theo hướng mở.

!!! info "Thử những gợi ý khám phá này"

    **Thử nghiệm với GitHub Copilot:**
    
    1. Hỏi: `What other AZD templates could I try for multi-agent scenarios?`
    2. Hỏi: `How can I customize the agent instructions for a healthcare use case?`
    3. Hỏi: `What environment variables control cost optimization?`
    
    **Khám phá Azure Portal:**
    
    1. Xem lại các số liệu Application Insights cho bản triển khai của bạn
    2. Kiểm tra phân tích chi phí cho các tài nguyên đã được cấp phát
    3. Khám phá lại khu vực thử nghiệm agent trên cổng Microsoft Foundry một lần nữa

---

## Gỡ bỏ Hạ tầng

1. Việc dỡ bỏ hạ tầng dễ như sau:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Tùy chọn) Nếu bạn chạy `azd up` một lần nữa, bạn sẽ thấy mô hình gpt-4.1 được triển khai vì biến môi trường đã bị thay đổi (và được lưu) trong thư mục cục bộ `.azure`. 

      Đây là các bản triển khai mô hình **trước**:

      ![Ban đầu](../../../../../translated_images/vi/14-deploy-initial.30e4cf1c29b587bc.webp)

      Và đây là **sau**:
      ![Mới](../../../../../translated_images/vi/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->