# ۶. جمع‌آوری زیرساخت

!!! tip "در پایان این ماژول شما خواهید توانست"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## تمرینات اضافی

قبل از اینکه پروژه را جمع‌آوری کنیم، چند دقیقه وقت بگذارید و کاوش باز انجام دهید.

!!! info "این نکات کاوش را امتحان کنید"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## لغو تخصیص زیرساخت

۱. جمع‌آوری زیرساخت به سادگی زیر است:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. محیط انتخاب‌شده را تأیید کنید و منابعی که باید حذف شوند را مرور کنید. این کار منابع Azure را حذف می‌کند و ممکن است داده‌ها را نابود کند. برای این روند آموزشی تأیید را نگه دارید. پس از اتمام، خروجی مشابه زیر را خواهید دید:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

۱. حذف را در پرتال تأیید کنید و منابع خارج از دامنه استقرار را بررسی کنید. گزارش هزینه و به‌روزرسانی سهمیه ممکن است با تأخیر انجام شود. پیکربندی محلی `.azure` باقی می‌ماند مگر اینکه صراحتاً آن را حذف کنید.

۱. `azd down --purge` به‌علاوه درخواست حذف دائمی منابع قابل بازیابی نرم‌افزاری را می‌دهد. فقط زمانی استفاده کنید که بازیابی لازم نیست و سیاست‌های نگهداری/حفاظت از پاک‌سازی را می‌دانید. این تضمین نمی‌کند که فورا سهمیه آزاد شود.

۱. فقط برای تأیید پاک‌سازی دوباره استقرار نکنید. یک `azd up` عمدی بعدی می‌تواند منابع را با استفاده از ورودی‌های محلی باقی‌مانده مجدداً ایجاد کند و دوباره هزینه‌ها را تحمیل می‌کند. به‌روزرسانی مدل معمولاً از تغییرات پشتیبانی‌شده تخصیص استفاده می‌کند، نه جمع‌آوری.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->