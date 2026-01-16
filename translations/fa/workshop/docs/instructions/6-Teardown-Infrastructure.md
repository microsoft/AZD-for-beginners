<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T10:55:04+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "fa"
}
-->
# 6. تخریب زیرساخت

!!! tip "در پایان این ماژول شما قادر خواهید بود"

    - [ ] مورد
    - [ ] مورد
    - [ ] مورد

---

## تمرین‌های اضافی

قبل از اینکه پروژه را تخریب کنیم، چند دقیقه وقت بگذارید و به صورت آزادانه به کاوش بپردازید.

!!! danger "NITYA-TODO: برخی پیشنهادات برای امتحان کردن را مشخص کنید"

---

## حذف زیرساخت

1. تخریب زیرساخت به سادگی انجام می‌شود:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```

1. استفاده از فلگ `--purge` تضمین می‌کند که منابع سرویس‌های شناختی که به صورت نرم حذف شده‌اند نیز پاک شوند و سهمیه‌ای که توسط این منابع نگه داشته شده آزاد شود. پس از تکمیل، چیزی شبیه به این خواهید دید:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (اختیاری) اگر اکنون دوباره دستور `azd up` را اجرا کنید، متوجه خواهید شد که مدل gpt-4.1 مستقر می‌شود زیرا متغیر محیطی تغییر کرده (و ذخیره شده) در پوشه محلی `.azure`.

      اینجا استقرار مدل‌ها **قبل از تغییر**:

      ![Initial](../../../../../translated_images/fa/14-deploy-initial.30e4cf1c29b587bc.png)

      و اینجا **بعد از تغییر**:
      ![New](../../../../../translated_images/fa/14-deploy-new.f7f3c355a3cf7299.png)

---

