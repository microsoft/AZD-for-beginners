# 6. Dỡ bỏ Hạ tầng

!!! tip "VÀO CUỐI MODULE NÀY BẠN SẼ CÓ THỂ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bài Tập Thưởng

Trước khi chúng ta dỡ dự án, hãy dành vài phút để khám phá mở rộng.

!!! info "Thử Những Gợi Ý Khám Phá Này"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Thu hồi Hạ tầng

!!! warning "Nếu bạn cũng đã hoàn thành bài tập máy chủ được lưu trữ GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Việc dỡ bỏ hạ tầng thật dễ dàng như:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Xác nhận môi trường đã chọn và xem lại các tài nguyên sẽ bị xóa. Việc này sẽ loại bỏ các tài nguyên Azure và có thể làm mất dữ liệu. Giữ lời nhắc xác nhận cho quy trình học này. Khi hoàn thành bạn sẽ thấy đầu ra tương tự:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Kiểm tra việc xóa trong portal và kiểm tra các tài nguyên ngoài phạm vi triển khai. Báo cáo chi phí và cập nhật hạn mức có thể chậm. Cấu hình `.azure` cục bộ vẫn còn trừ khi bạn xóa nó rõ ràng.

1. `azd down --purge` còn yêu cầu xóa vĩnh viễn các tài nguyên bị xóa mềm được hỗ trợ. Chỉ dùng khi không cần khôi phục và bạn hiểu chính sách giữ/làm sạch bảo vệ. Nó không đảm bảo giải phóng hạn mức ngay lập tức.

1. Không triển khai lại chỉ để xác minh dọn dẹp. Một `azd up` có chủ ý sau này có thể tạo lại tài nguyên bằng đầu vào cục bộ còn lại và lại phát sinh phí. Các cập nhật mô hình thông thường dùng các thay đổi cấp phép được hỗ trợ, không phải dỡ bỏ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->