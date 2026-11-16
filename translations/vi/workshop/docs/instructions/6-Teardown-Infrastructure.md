# 6. Gỡ bỏ Hạ tầng

!!! tip "KHI KẾT THÚC MODULE NÀY BẠN SẼ CÓ KHẢ NĂNG"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bài tập Thưởng

Trước khi gỡ bỏ dự án, hãy dành vài phút để khám phá mở rộng.

!!! info "Thử Những Gợi ý Khám phá Này"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Hủy cấp phát Hạ tầng

1. Việc gỡ bỏ hạ tầng rất đơn giản:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Xác nhận môi trường đã chọn và xem xét các tài nguyên sẽ bị xóa. Việc này sẽ loại bỏ tài nguyên Azure và có thể phá hủy dữ liệu. Giữ lại lời nhắc xác nhận cho quy trình học tập này. Khi hoàn thành bạn sẽ thấy kết quả tương tự:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Xác minh việc xóa trong cổng thông tin và kiểm tra các tài nguyên ngoài phạm vi triển khai. Báo cáo chi phí và cập nhật hạn mức có thể bị chậm. Cấu hình `.azure` cục bộ sẽ vẫn còn trừ khi bạn chủ động xoá nó.

1. `azd down --purge` còn yêu cầu xóa vĩnh viễn các tài nguyên được xóa mềm được hỗ trợ. Chỉ sử dụng khi không cần khôi phục và bạn hiểu các chính sách giữ/bảo vệ xóa bỏ. Nó không đảm bảo việc giải phóng hạn mức ngay lập tức.

1. Không triển khai lại chỉ để xác minh việc dọn dẹp. Một `azd up` có chủ đích sau đó có thể tái tạo tài nguyên sử dụng các đầu vào cục bộ còn lại, và sẽ phát sinh phí lại. Việc cập nhật mô hình thường dùng các thay đổi cấp phát được hỗ trợ, không phải gỡ bỏ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->