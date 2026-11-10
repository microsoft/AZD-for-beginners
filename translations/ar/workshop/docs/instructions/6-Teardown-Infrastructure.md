# 6. تفكيك البنية التحتية

!!! tip "بنهاية هذه الوحدة، ستتمكن من"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## تمارين إضافية

قبل تفكيك المشروع، خذ بضع دقائق للقيام ببعض الاستكشاف المفتوح.

!!! info "جرب هذه المحفزات للاستكشاف"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## إزالة تجهيز البنية التحتية

1. تفكيك البنية التحتية سهل كما يلي:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. تأكد من البيئة المختارة وراجع الموارد المراد حذفها. هذا الإجراء يزيل موارد Azure وقد يدمر البيانات. احتفظ برسالة التأكيد لهذه العملية التعليمية. عند الانتهاء سترى مخرجات مشابهة لـ:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. تحقق من الحذف في البوابة الالكترونية وتفقد الموارد خارج نطاق النشر. تقارير التكلفة وتحديثات الحصص قد تتأخر. تبقى إعدادات `.azure` المحلية ما لم تقم بحذفها صراحة.

1. يطلب `azd down --purge` أيضاً الحذف الدائم للموارد المحذوفة ناعماً المدعومة. استخدمه فقط عندما لا تحتاج إلى الاسترداد وتفهم سياسات الاحتفاظ/الحماية من الحذف. لا يضمن تحرير الحصة فورياً.

1. لا تعيد النشر فقط للتحقق من التنظيف. يمكن لإجراء `azd up` مقصود لاحقاً إعادة إنشاء الموارد باستخدام المدخلات المحلية المتبقية، ويرافقه رسوم جديدة. تحديثات النموذج عادة تستخدم تغييرات التجهيز المدعومة، لا التفكيك.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->