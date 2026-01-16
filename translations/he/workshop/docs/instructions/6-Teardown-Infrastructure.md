<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T22:45:42+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "he"
}
-->
# 6. פירוק תשתית

!!! tip "בסיום המודול הזה תוכל"

    - [ ] פריט
    - [ ] פריט
    - [ ] פריט

---

## תרגילים נוספים

לפני שנפרק את הפרויקט, הקדש כמה דקות לחקירה פתוחה.

!!! danger "NITYA-TODO: תאר כמה הצעות לנסות"

---

## ביטול תשתית

1. פירוק התשתית פשוט כמו:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. הדגל `--purge` מבטיח שהוא גם מוחק משאבי שירות קוגניטיביים שנמחקו באופן רך, ובכך משחרר את המכסה שהוחזקה על ידי משאבים אלה. לאחר השלמת התהליך תראה משהו כזה:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (אופציונלי) אם עכשיו תפעיל שוב את `azd up`, תבחין שהמודל gpt-4.1 נפרס מכיוון שמשתנה הסביבה שונה (ונשמר) בתיקיית `.azure` המקומית.

      הנה פריסות המודל **לפני**:

      ![Initial](../../../../../translated_images/he/14-deploy-initial.30e4cf1c29b587bc.png)

      והנה הן **אחרי**:
      ![New](../../../../../translated_images/he/14-deploy-new.f7f3c355a3cf7299.png)

---

