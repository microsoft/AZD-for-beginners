# 6. การรื้อถอนโครงสร้างพื้นฐาน

!!! tip "เมื่อจบโมดูลนี้คุณจะสามารถ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## แบบฝึกหัดเสริม

ก่อนที่เราจะรื้อถอนโปรเจกต์ ใช้เวลาสักครู่เพื่อสำรวจแบบเปิดกว้าง

!!! info "ลองใช้คำถามเหล่านี้เพื่อสำรวจ"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## การถอนการจัดสรรโครงสร้างพื้นฐาน

1. การรื้อถอนโครงสร้างพื้นฐานง่ายเหมือนกับ:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. ยืนยันสภาพแวดล้อมที่เลือกและตรวจสอบทรัพยากรที่จะถูกลบ การดำเนินการนี้จะลบทรัพยากร Azure และอาจทำลายข้อมูล โปรดเก็บคำยืนยันนี้สำหรับกระบวนการเรียนรู้นี้ เมื่อเสร็จแล้วคุณจะเห็นผลลัพธ์คล้ายกับ:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. ตรวจสอบการลบในพอร์ทัลและตรวจดูทรัพยากรที่อยู่นอกขอบเขตการปรับใช้ รายงานค่าใช้จ่ายและการอัปเดตโควต้าอาจล่าช้า การตั้งค่า `.azure` ภายในเครื่องยังคงอยู่เว้นแต่คุณจะลบออกอย่างชัดเจน

1. `azd down --purge` ยังขอการลบถาวรของทรัพยากรที่ถูกลบแบบอ่อนที่รองรับด้วย ใช้เฉพาะเมื่อไม่ต้องการกู้คืนและคุณเข้าใจนโยบายการเก็บรักษา/ป้องกันการล้างข้อมูล มันไม่ได้รับประกันว่าจะปล่อยโควต้าทันที

1. อย่าปรับใช้ใหม่เพื่อแค่ตรวจสอบการล้างข้อมูล `azd up` ที่ตั้งใจใช้ภายหลังสามารถสร้างทรัพยากรขึ้นมาใหม่โดยใช้ข้อมูลป้อนเข้าภายในเครื่องที่เหลืออยู่ และจะเสียค่าใช้จ่ายอีก การอัปเดตรูปแบบโดยทั่วไปใช้การเปลี่ยนแปลงการจัดสรรที่รองรับ ไม่ใช่การรื้อถอน

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->