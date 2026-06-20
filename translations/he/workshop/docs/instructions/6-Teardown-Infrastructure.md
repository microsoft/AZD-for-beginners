# 6. פירוק תשתית

!!! tip "בסוף מודול זה תוכל"

    - [ ] להבין את חשיבות ניקוי המשאבים וניהול העלויות
    - [ ] להשתמש ב-`azd down` כדי לפרק את התשתית בצורה בטוחה
    - [ ] לשחזר שירותי Azure AI שנמחקו ברכות אם יש צורך
    - [ ] **מעבדה 6:** לנקות משאבי Azure ולאמת את ההסרה

---

## תרגילים בונוס

לפני שנפרק את הפרויקט, הקדש כמה דקות לחקור באופן פתוח.

!!! info "נסה את שאלות החקר האלו"

    **נסה את GitHub Copilot:**
    
    1. שאל: `איזה תבניות AZD נוספות אוכל לנסות לתרחישי סוכנים מרובי-תחומים?`
    2. שאל: `איך אוכל להתאים את הוראות הסוכן למקרה שימוש בתחום הבריאות?`
    3. שאל: `אילו משתני סביבה שולטים באופטימיזציית עלויות?`
    
    **חקור את פורטל Azure:**
    
    1. סקור מדדי Application Insights עבור הפריסה שלך
    2. בדוק את ניתוח העלויות עבור המשאבים שסופקו
    3. חקור שוב את מגרש המשחקים של סוכן פורטל Microsoft Foundry

---

## פירוק תשתית

1. פירוק התשתית הוא פשוט כמו:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. הדגל `--purge` מבטיח שהוא גם מנקה משאבי שירותי קוגניציה שנמחקו ברכות, וכך משחרר מכסת שימוש שהוחזקה על ידי משאבים אלו. בסיום תראה משהו כזה:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (אופציונלי) אם עכשיו תפעיל שוב `azd up`, תראה שהדגם gpt-4.1 מתפרס מכיוון שמשתנה הסביבה שונה (ונשמר) בתיקיית `.azure` המקומית. 

      להלן פריסות המודל **לפני**:

      ![Initial](../../../../../translated_images/he/14-deploy-initial.30e4cf1c29b587bc.webp)

      וכאן זה **אחרי**:
      ![New](../../../../../translated_images/he/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->