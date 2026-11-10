# 6. פירוק תשתית

!!! tip "בסוף מודול זה תוכל"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## תרגילים נוספים

לפני שנפרק את הפרויקט, הקדש כמה דקות לביצוע חקירה פתוחה.

!!! info "נסה את רעיונות החקירה האלה"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## פירוק תשתית

1. פירוק התשתית הוא פשוט כמו:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. אשר את הסביבה שנבחרה ובדוק את המשאבים שיוסרו. פעולה זו מסירה משאבים ב-Azure ועלולה להשמיד נתונים. שמור את הנחיית האישור עבור תהליך למידה זה. לאחר שתסתיים תראה פלט דומה ל:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. אמת את המחיקה בפורטל ובדוק משאבים שמחוץ לטווח הפריסה. דיווחי עלויות ועדכוני מכסות יכולים להתעכב. תצורת `.azure` המקומית נשארת אלא אם הסרת אותה במפורש.

1. `azd down --purge` מבקשת בנוסף מחיקה סופית של משאבים שנמחקו ברכות ונמצאים בתמיכה. השתמש בו רק כשאין צורך בשחזור ואתה מבין את מדיניות השימור/הגנה מפני מחיקה. הוא אינו מבטיח שחרור מכסה מיידי.

1. אל תפרוס מחדש רק כדי לבדוק את הניקוי. `azd up` מכוון שיעלה מחדש משאבים באמצעות קלטים מקומיים קיימים, ועלול לגרום לחיובים שוב. עדכוני מודל בדרך כלל משתמשים בשינויים נתמכים בפריסה, לא בפירוק.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->