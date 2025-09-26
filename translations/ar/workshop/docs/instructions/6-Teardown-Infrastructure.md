<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T12:06:15+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "ar"
}
-->
# 6. تفكيك البنية التحتية

!!! tip "بنهاية هذه الوحدة ستكون قادرًا على"

    - [ ] عنصر
    - [ ] عنصر
    - [ ] عنصر

---

## تمارين إضافية

قبل أن نقوم بتفكيك المشروع، خذ بضع دقائق لاستكشاف بعض الأفكار المفتوحة.

!!! danger "NITYA-TODO: قم بتحديد بعض الأفكار للتجربة"

---

## إلغاء تخصيص البنية التحتية

1. تفكيك البنية التحتية يتم بسهولة عبر:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. العلم `--purge` يضمن أيضًا حذف الموارد المحذوفة بشكل ناعم لخدمات الذكاء الاصطناعي، مما يحرر الحصة التي تحتفظ بها هذه الموارد. بمجرد الانتهاء، سترى شيئًا مثل هذا:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (اختياري) إذا قمت الآن بتشغيل `azd up` مرة أخرى، ستلاحظ أن نموذج gpt-4.1 يتم نشره لأن متغير البيئة تم تغييره (وتم حفظه) في المجلد المحلي `.azure`.

      هنا عمليات نشر النموذج **قبل**:

      ![Initial](../../../../../translated_images/14-deploy-initial.30e4cf1c29b587bc86efd11a0dd0b6ee6bec92ae4425860272179121951bd917.ar.png)

      وهنا **بعد**:
      ![New](../../../../../translated_images/14-deploy-new.f7f3c355a3cf7299572bca5941cfeec14090237cd3d20310e347f27564089379.ar.png)

---

