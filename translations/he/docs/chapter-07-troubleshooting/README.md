# פרק 7: פתרון בעיות ודיבאג

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: 1-1.5 שעות | **⭐ רמת קושי**: בינוני

---

## סקירה כללית

פרק זה עוזר לך לאבחן ולפתור בעיות נפוצות בעת עבודה עם Azure Developer CLI. מכישלונות פריסה ועד בעיות ספציפיות ל-AI.

> הנחיית הפקודות נבדקה מול מַפְרֵט `azd 1.37.2` שפורסם. פריסות ענן לא בוצעו. החלף שמות ומזהים של משאבים לדוגמה לפני השימוש בפקודות.

## מטרות הלמידה

עם סיום פרק זה, תוכל:
- לאבחן כשלונות פריסה נפוצים ב-AZD
- לדבג בעיות הזדהות והרשאות
- לפתור בעיות בחיבור לשירותי AI
- להשתמש ב-Azure Portal וב-CLI לפתרון בעיות

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [בעיות נפוצות](common-issues.md) | בעיות הנפוצות לעיתים קרובות | 30 דק' |
| 2 | [מדריך דיבאג](debugging.md) | אסטרטגיות דיבאג צעד-אחר-צעד | 45 דק' |
| 3 | [פתרון בעיות AI](ai-troubleshooting.md) | בעיות ספציפיות ל-AI | 30 דק' |

---

## 🚨 פתרונות מהירים

### בעיות הזדהות
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### כישלונות פריסה
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### התנגשות משאבים
בדוק תחילה את המשאב הקיים ואת שגיאות הפריסה. אל תמחק סביבה משותפת או ייצורית כדי לפתור קונפליקט בשם. עבור **סביבה חד-פעמית חדשה**, השתמש בשם ייחודי:

```bash
azd env new different-name
azd up
```

### חריגת מכסות
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

שינוי `AZURE_LOCATION` אינו מעביר משאבים קיימים ויכול לגרום לקונפליקטים במיקום בעת פריסה מחדש.

---

## 📋 טבלת קודי שגיאה

| שגיאה | סיבה | פתרון |
|-------|-------|----------|
| `AuthenticationError` | לא מחובר | `azd auth login` |
| `ResourceNotFound` | משאב חסר | בדוק את שמות המשאבים |
| `QuotaExceeded` | מגבלות מנוי | בקש הגדלת מכסה |
| `InvalidTemplate` | שגיאת תחביר ב-Bicep | `az bicep build` |
| `Conflict` | המשאב כבר קיים | השתמש בשם חדש או מחק |
| `Forbidden` | הרשאות לא מספקות | בדוק תפקידי RBAC |

---

## 🔄 איפוס ושחזור

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

איפוס קשה מוחק נתונים ועלול לשנות נקודות קצה. גבה קודם ובחן את הודעות האישור באינטראקטיביות. `--force --purge` מתאים רק לסביבות חד-פעמיות כאשר יש כוונה למחיקה בלתי הפיכה.

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **הקודם** | [פרק 6: טרום פריסה](../chapter-06-pre-deployment/README.md) |
| **הבא** | [פרק 8: ייצור](../chapter-08-production/README.md) |

---

## 📖 משאבים קשורים

- [בדיקות טרום פריסה](../chapter-06-pre-deployment/preflight-checks.md)
- [מדריך תצורה](../chapter-03-configuration/configuration.md)
- [בעיות GitHub של AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->