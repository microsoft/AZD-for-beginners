# 6. تفكيك البنية التحتية

!!! tip "بنهاية هذه الوحدة ستكون قادرًا على"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## تمارين إضافية

قبل أن نقوم بتفكيك المشروع، خذ بضع دقائق للقيام ببعض الاستكشاف المفتوح.

!!! info "جرب هذه المطالبات للاستكشاف"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## إلغاء تزويد البنية التحتية

!!! warning "إذا كنت قد أكملت أيضًا تمرين الوكيل المستضاف GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. تفكيك البنية التحتية سهل مثل:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. تأكد من البيئة المختارة وراجع الموارد التي سيتم حذفها. هذا الإجراء يزيل موارد Azure وقد يدمر البيانات. احتفظ برسالة التأكيد لهذه العملية التعليمية. عند الانتهاء سترى مخرجات مشابهة لـ:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. تحقق من الحذف في البوابة وتحقق من الموارد خارج نطاق النشر. قد تتأخر تقارير التكلفة وتحديثات الحصة. يبقى تكوين `.azure` المحلي ما لم تقم بإزالته صراحة.

1. يقوم `azd down --purge` أيضًا بطلب الحذف الدائم للموارد المحذوفة مؤقتًا المدعومة. استخدمه فقط عندما لا تكون هناك حاجة للاسترداد وتفهم سياسات الاحتفاظ والحماية من الحذف. لا يضمن تحرير الحصة الفوري.

1. لا تعيد النشر فقط للتحقق من التنظيف. يمكن لعملية `azd up` المتعمدة لاحقًا إعادة إنشاء الموارد باستخدام المدخلات المحلية المتبقية، وستتسبب في رسوم مجددًا. تستخدم تحديثات النموذج عادةً تغييرات التزويد المدعومة، وليس التفكيك.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->