# 6. انفراسٹرکچر کو ختم کرنا

!!! tip "اس ماڈیول کے اختتام تک آپ یہ کرنے کے قابل ہو جائیں گے"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## اضافی مشقیں

پروجیکٹ ختم کرنے سے پہلے، چند منٹ نکال کر چند کھلے سوالات پر غور کریں۔

!!! info "ان دریافت کے سوالات کو آزمائیں"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## انفراسٹرکچر کی ڈی پروویژننگ

!!! warning "اگر آپ نے GA ہوسٹڈ ایجنٹ کی مشق بھی مکمل کی ہے"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. انفراسٹرکچر کو ختم کرنا اتنا ہی آسان ہے جتنا کہ:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. منتخب شدہ ماحول کی تصدیق کریں اور حذف کیے جانے والے وسائل کا جائزہ لیں۔ اس سے Azure وسائل ہٹ جائیں گے اور ڈیٹا خراب ہو سکتا ہے۔ اس تعلیمی ورک فلوز کے لیے تصدیقی پیغام کو برقرار رکھیں۔ مکمل ہونے پر آپ کو اس طرح کا آؤٹ پٹ نظر آئے گا:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. پورٹل میں حذف کاری کی تصدیق کریں اور تعیناتی کی حد سے باہر وسائل کی جانچ کریں۔ لاگت کی رپورٹنگ اور کوٹہ اپ ڈیٹس میں تاخیر ہو سکتی ہے۔ لوکل `.azure` کی تشکیل برقرار رہتی ہے جب تک کہ آپ اسے واضح طور پر نہ ہٹائیں۔

1. `azd down --purge` اضافی طور پر سپورٹ شدہ نرم حذف شدہ وسائل کی مستقل حذف کاری کا مطالبہ کرتا ہے۔ اسے صرف تب استعمال کریں جب بازیابی کی ضرورت نہ ہو اور آپ برقرار رکھنے/خارج کرنے کی پالیسیوں کو سمجھتے ہوں۔ یہ فوری کوٹہ ریلیز کی ضمانت نہیں دیتا۔

1. صفائی کی تصدیق کے لیے دوبارہ تعینات نہ کریں۔ بعد میں ارادی طور پر `azd up` باقی لوکل ان پٹس کے ساتھ وسائل کو دوبارہ تخلیق کر سکتا ہے، اور دوبارہ چارجز لاگو ہوتے ہیں۔ ماڈل اپ ڈیٹس عام طور پر تھوڑے بہت پروویژننگ تبدیلیوں کے ذریعے کی جاتی ہیں، نہ کہ ختم کرنے کے ذریعے۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->