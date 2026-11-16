# 6۔ انفراسٹرکچر کا خاتمہ

!!! tip "اس ماڈیول کے اختتام تک آپ درج ذیل کرنے کے قابل ہو جائیں گے"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## اضافی مشقیں

پروجیکٹ ختم کرنے سے پہلے، چند منٹ نکال کر کچھ آزادانہ کھوج کریں۔

!!! info "یہ دریافت کے سوالات آزمائیں"

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

1۔ انفراسٹرکچر کا خاتمہ اتنا ہی آسان ہے جتنا کہ:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1۔ منتخب شدہ ماحول کی تصدیق کریں اور حذف کیے جانے والے وسائل کا جائزہ لیں۔ اس سے Azure وسائل ختم ہو سکتے ہیں اور ڈیٹا متاثر ہو سکتا ہے۔ اس سیکھنے کے عمل کے لئے تصدیقی پیغام رکھیں۔ مکمل ہونے پر آپ کو اس جیسا آؤٹ پٹ دکھائی دے گا:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1۔ پورٹل میں حذف کرنے کی تصدیق کریں اور تعیناتی کے دائرہ کار سے باہر کے وسائل چیک کریں۔ لاگت کی رپورٹنگ اور کوٹا اپ ڈیٹس میں تاخیر ہو سکتی ہے۔ مقامی `.azure` ترتیب تب تک رہتی ہے جب تک آپ اسے واضح طور پر ہٹا نہ دیں۔

1۔ `azd down --purge` اضافی طور پر حمایت یافتہ سافٹ-حذف شدہ وسائل کی مستقل حذف کی درخواست کرتا ہے۔ اسے صرف اس وقت استعمال کریں جب بازیابی ضروری نہ ہو اور آپ احتفاظ/صفائی-تحفظ کی پالیسیاں سمجھتے ہوں۔ یہ فوری کوٹا کی رہائی کی ضمانت نہیں دیتا۔

1۔ صفائی کی تصدیق کے لئے دوبارہ تعیناتی نہ کریں۔ بعد میں جان بوجھ کر کی جانے والی `azd up` بچا ہوا مقامی انپٹس استعمال کرتے ہوئے وسائل دوبارہ بنا سکتی ہے، اور اس پر دوبارہ چارجز لاگو ہوتے ہیں۔ ماڈل اپ ڈیٹس عام طور پر معاون پروویژننگ تبدیلیوں کا استعمال کرتے ہیں، نہ کہ انفراسٹرکچر ختم کرنے کا۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->