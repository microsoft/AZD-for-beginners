<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T23:34:42+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "vi"
}
-->
# 6. Gỡ bỏ hạ tầng

!!! tip "SAU KHI HOÀN THÀNH MODULE NÀY, BẠN SẼ CÓ THỂ"

    - [ ] Mục
    - [ ] Mục
    - [ ] Mục

---

## Bài tập bổ sung

Trước khi gỡ bỏ dự án, hãy dành vài phút để khám phá thêm một cách tự do.

!!! danger "NITYA-TODO: Đề xuất một số gợi ý để thử"

---

## Gỡ bỏ hạ tầng

1. Gỡ bỏ hạ tầng dễ dàng như sau:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Cờ `--purge` đảm bảo rằng nó cũng xóa các tài nguyên Cognitive Service đã bị xóa mềm, từ đó giải phóng hạn mức mà các tài nguyên này đang giữ. Sau khi hoàn tất, bạn sẽ thấy kết quả như sau:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Tùy chọn) Nếu bạn chạy lại `azd up`, bạn sẽ nhận thấy mô hình gpt-4.1 được triển khai vì biến môi trường đã được thay đổi (và lưu) trong thư mục `.azure` cục bộ.

      Đây là các triển khai mô hình **trước**:

      ![Ban đầu](../../../../../translated_images/14-deploy-initial.30e4cf1c29b587bc.vi.png)

      Và đây là **sau**:
      ![Mới](../../../../../translated_images/14-deploy-new.f7f3c355a3cf7299.vi.png)

---

