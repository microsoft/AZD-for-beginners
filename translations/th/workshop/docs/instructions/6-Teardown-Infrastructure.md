# 6. รื้อถอนโครงสร้างพื้นฐาน

!!! tip "เมื่อคุณเรียนจบโมดูลนี้ คุณจะสามารถ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## แบบฝึกหัดเสริม

ก่อนที่เราจะรื้อถอนโปรเจกต์ ใช้เวลาสักครู่เพื่อสำรวจแบบเปิดกว้าง

!!! info "ลองใช้แนวทางการสำรวจเหล่านี้"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## ยกเลิกการจัดสรรโครงสร้างพื้นฐาน

!!! warning "หากคุณได้ทำแบบฝึกหัดตัวแทนที่โฮสต์ด้วย GA แล้ว"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. การรื้อถอนโครงสร้างพื้นฐานง่ายเหมือนกับ:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. ตรวจสอบสภาพแวดล้อมที่เลือกและตรวจทัพยากรที่จะถูกลบออก การลบนี้จะลบทรัพยากร Azure และอาจทำให้ข้อมูลถูกทำลาย เก็บพรอมต์การยืนยันสำหรับกระบวนการเรียนรู้นี้ เมื่อเสร็จสิ้น คุณจะเห็นผลลัพธ์คล้ายกับ:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. ตรวจสอบการลบในพอร์ทัลและตรวจหาทรัพยากรที่อยู่นอกขอบเขตการปรับใช้ รายงานค่าใช้จ่ายและการอัปเดตโควต้าสามารถล่าช้า การกำหนดค่าท้องถิ่น `.azure` จะคงอยู่เว้นแต่คุณจะลบออกอย่างชัดเจน

1. `azd down --purge` จะร้องขอการลบถาวรของทรัพยากรที่ถูกลบแบบอ่อนรองรับด้วย ใช้เฉพาะเมื่อไม่จำเป็นต้องกู้คืนและคุณเข้าใจนโยบายการเก็บรักษา/ป้องกันการล้างข้อมูล ซึ่งไม่ได้รับประกันการว่างโควตาทันที

1. อย่านำไปปรับใช้ซ้ำเพียงเพื่อตรวจสอบการทำความสะอาด การ `azd up` เจตนาในภายหลังสามารถสร้างทรัพยากรโดยใช้ข้อมูลป้อนเข้าท้องถิ่นที่เหลืออยู่และจะคิดค่าบริการอีกครั้ง การอัปเดตโมเดลโดยปกติจะใช้การเปลี่ยนแปลงการจัดสรรที่รองรับ ไม่ใช่การรื้อถอน

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->