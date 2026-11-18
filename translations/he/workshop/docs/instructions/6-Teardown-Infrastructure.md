# 6. פירוק תשתית

!!! tip "בסיום מודול זה תוכל ל"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## תרגילים בונוס

לפני שאנו פורקים את הפרויקט, הקדש כמה דקות לסקרנות חופשית.

!!! info "נסה את הגירויים הבאים לחקירה"

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

!!! warning "אם גם השלמת את תרגיל ה-GA hosted-agent"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. פירוק התשתית כל כך פשוט:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. אשר את הסביבה שנבחרה וסקור את המשאבים שיימחקו. פעולה זו מסירה משאבי Azure ועלולה לגרום לאבדן מידע. שמור על בקשת האישור עבור תהליך הלמידה הזה. לאחר סיום תראה פלט דומה ל:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. אמת את ההסרה בפורטל ובדוק עבור משאבים מחוץ להיקף ההתקנה. דיווח על עלויות ועדכוני מכסות עלולים לאחר. תצורת `.azure` המקומית נותרת אלא אם תסיר אותה במפורש.

1. `azd down --purge` מבקש בנוסף מחיקה קבועה של משאבים שנמחקו רך בתמיכה. השתמש בו רק כשאין צורך בשחזור ואתה מבין מדיניות שימור והגנה על סילוק. זה אינו מבטיח שחרור מיידי של המכסה.

1. אל תפרוס מחדש רק כדי לאמת ניקיון. `azd up` מכוון מאוחר יותר יכול ליצור מחדש משאבים באמצעות הקלטים המקומיים הנותרים ויגרום לחיובים שוב. עדכוני מודל בדרך כלל משתמשים בשינויים בתשתית הנתמכים ולא בפירוק.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->