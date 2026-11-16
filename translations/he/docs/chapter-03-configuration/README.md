# פרק 3: תצורה ואימות

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: 90-150 דקות כולל תרגול אינטגרציה | **⭐ רמת מורכבות**: בינונית

---

## סקירה כללית

פרק זה עוסק בתצורת הסביבה, דפוסי אימות, ופרקטיקות אבטחה מיטביות לפריסות Azure Developer CLI.

> יעד סקירת פקודה ותצורה: `azd 1.37.2` (נובמבר 2026). לא בוצעה פריסת Azure חיה במהלך הסקירה.

## מטרות הלמידה

בסיום פרק זה תוכל:
- לשלוט בהיררכיית התצורה של AZD
- לנהל סביבות מרובות (פיתוח, תיק, הפקה)
- ליישם אימות מאובטח עם זהויות מנוהלות
- להגדיר הגדרות ייחודיות לסביבה

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [מדריך תצורה](configuration.md) | התקנה וניהול סביבה | 30 דקות |
| 2 | [אימות ואבטחה](authsecurity.md) | דפוסי זהות מנוהלת ו-RBAC | 30 דקות |

---

## 🚀 התחלה מהירה

הפעל משורש **אפליקציית azd שכבר הופעלה**, לא מאגר הקורס. השתמש בשמות סביבה לא בשימוש אם אלו כבר קיימים.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` הוא להמחשה: הוא משפיע על התשתית רק אם התבנית שלך צורכת אותו במפורש. ערכי `azd env set` רגילים נשמרים מקומית בטקסט ברור; אינם אחסון סודי מאובטח.

---

## 🔧 היררכיית תצורה

שמור על שלוש משטחים נפרדים של תצורה: העדפות גלובליות (`azd config`), מבנה הפרויקט (`azure.yaml`), וערכי סביבה (`azd env`). דגלים מעלים רק את ההגדרות הנתמכות בפועל; אין שכבת על אוניברסלית של משתני סביבה שרירותיים על `azure.yaml` או Bicep.

---

## 🔐 פרקטיקות אבטחה מיטביות

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **קודם** | [פרק 2: פיתוח בינה מלאכותית](../chapter-02-ai-development/README.md) |
| **הבא** | [פרק 4: תשתית](../chapter-04-infrastructure/README.md) |

---

## 📖 משאבים קשורים

- [בדיקות לפני פריסה](../chapter-06-pre-deployment/README.md)
- [איתור תקלות](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->