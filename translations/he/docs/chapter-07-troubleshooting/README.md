# פרק 7: פתרון בעיות וניפוי שגיאות

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: 1-1.5 שעות | **⭐ רמת קושי**: בינונית

---

## סקירה כללית

פרק זה עוזר לך לאבחן ולפתור בעיות נפוצות בעת עבודה עם Azure Developer CLI. מכישלונות פריסה ועד בעיות ספציפיות ל-AI.

> אומת נגד `azd 1.23.12` במרץ 2026.

## מטרות הלמידה

בסיום הפרק, תוכל:
- לאבחן כישלונות נפוצים בפריסת AZD
- לנפות קשיי אימות והרשאות
- לפתור בעיות חיבור לשירותי AI
- להשתמש ב-Azure Portal וב-CLI לפתרון בעיות

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [בעיות נפוצות](common-issues.md) | בעיות נפוצות שנתקלים בהן | 30 דק' |
| 2 | [מדריך לניפוי שגיאות](debugging.md) | אסטרטגיות ניפוי שגיאות שלב אחר שלב | 45 דק' |
| 3 | [פתרון בעיות AI](ai-troubleshooting.md) | בעיות ספציפיות ל-AI | 30 דק' |

---

## 🚨 תיקונים מהירים

### בעיות אימות
```bash
# נדרש עבור תהליכי עבודה של AZD
azd auth login

# אופציונלי אם אתה משתמש גם בפקודות Azure CLI ישירות
az login

azd auth status
```

### כישלונות פריסה
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### התנגשות משאבים
```bash
azd down --force --purge
azd env new different-name
azd up
```

### חריגות מכסת שימוש
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 הפניה לקודי שגיאה

| שגיאה | סיבה | פתרון |
|-------|-------|----------|
| `AuthenticationError` | לא מחובר | `azd auth login` |
| `ResourceNotFound` | משאב חסר | בדוק שמות משאבים |
| `QuotaExceeded` | מגבלות מנוי | בקש הגדלת מכסה |
| `InvalidTemplate` | שגיאת תחביר ב-Bicep | `az bicep build` |
| `Conflict` | המשאב קיים | השתמש בשם חדש או מחק |
| `Forbidden` | הרשאות לא מספקות | בדוק תפקידי RBAC |

---

## 🔄 איפוס ושחזור

```bash
# איפוס רך (שמירת משאבים, פריסה מחדש של הקוד)
azd deploy --force

# איפוס קשה (מחיקת הכל, התחלה מחדש)
azd down --force --purge
azd up
```

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
מסמך זה תורגם באמצעות שירות תרגום בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי-דיוקים. יש להתייחס למסמך המקורי בשפתו המקורית כמקור המוסמך. למידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. איננו נושאים באחריות על אי-הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->