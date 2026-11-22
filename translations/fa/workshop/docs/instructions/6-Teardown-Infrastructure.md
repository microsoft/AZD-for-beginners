# ۶. برچیدن زیرساخت

!!! tip "در پایان این بخش شما قادر خواهید بود"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## تمرین‌های اضافی

قبل از برچیدن پروژه، چند دقیقه وقت بگذارید و به طور آزاد به کاوش بپردازید.

!!! info "این پرسش‌های کاوش را امتحان کنید"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## حذف زیرساخت

!!! warning "اگر تمرین عامل میزبانی GA را نیز انجام داده‌اید"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

۱. برچیدن زیرساخت به سادگی به صورت زیر است:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
۱. تأیید محیط انتخاب‌شده و بررسی منابعی که قرار است حذف شوند. این کار منابع Azure را حذف کرده و ممکن است داده‌ها را نابود کند. درخواست تأیید را برای این روند یادگیری نگه دارید. پس از اتمام، خروجی مشابه مشاهده خواهید کرد:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

۱. حذف را در پورتال تأیید کرده و منابع خارج از محدوده استقرار را بررسی کنید. گزارش هزینه و به‌روزرسانی سهمیه‌ها ممکن است با تأخیر انجام شود. پیکربندی محلی `.azure` باقی می‌ماند مگر شما صریحاً آن را حذف کنید.

۱. `azd down --purge` همچنین درخواست حذف دائمی منابع نرم‌حذف‌شده پشتیبانی‌شده را می‌دهد. فقط زمانی از آن استفاده کنید که بازیابی نیاز نیست و سیاست‌های حفظ/حفاظت از پاک‌سازی را می‌دانید. این تضمینی برای آزادسازی فوری سهمیه نیست.

۱. صرفاً برای تأیید پاکسازی مجدد راه‌اندازی نکنید. یک `azd up` عمدی بعدی می‌تواند منابع را با ورودی‌های محلی باقی‌مانده دوباره ایجاد کند و دوباره هزینه ایجاد می‌کند. به‌روزرسانی مدل معمولاً از تغییرات پشتیبانی‌شده در تأمین استفاده می‌کند، نه از برچیدن.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->