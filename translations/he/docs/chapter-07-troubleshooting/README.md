# פרק 7: פתרון בעיות וניפוי שגיאות

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: 1-1.5 שעות | **⭐ מורכבות**: בינונית

---

## סקירה כללית

פרק זה יעזור לך לאבחן ולפתור בעיות נפוצות בעבודה עם Azure Developer CLI. מכישלונות פריסה ועד בעיות ספציפיות ל-AI.

> אומת מול `azd 1.25.6` ביוני 2026.

## יעדי למידה

בסיום פרק זה, תהיה מסוגל:
- לאבחן כישלונות פריסה נפוצים ב-AZD
- לנפות שגיאות בהתחברות ובסמכויות
- לפתור בעיות בחיבור לשירותי AI
- להשתמש ב-Azure Portal ו-CLI לפתרון בעיות

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [בעיות נפוצות](common-issues.md) | בעיות שנתקלים בהן לעיתים קרובות | 30 דק' |
| 2 | [מדריך ניפוי שגיאות](debugging.md) | אסטרטגיות ניפוי שגיאות שלב-אחר-שלב | 45 דק' |
| 3 | [פתרון בעיות AI](ai-troubleshooting.md) | בעיות ייחודיות ל-AI | 30 דק' |

---

## 🚨 תיקונים מהירים

### בעיות זיהוי זהות
```bash
# דרוש לסקריפטים של AZD
azd auth login

# אופציונלי אם אתה משתמש ישירות גם בפקודות Azure CLI
az login

azd auth status
```

### כשלים בפריסה
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### התנגשויות במשאבים
```bash
azd down --force --purge
azd env new different-name
azd up
```

### חריגה מהמכסה
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 רשימת קודי שגיאה

| שגיאה | סיבה | פתרון |
|-------|-------|----------|
| `AuthenticationError` | לא מחובר | `azd auth login` |
| `ResourceNotFound` | משאב חסר | בדוק שמות משאבים |
| `QuotaExceeded` | הגבלות מנוי | בקש הגדלת מכסה |
| `InvalidTemplate` | שגיאת תחביר בביספ | `az bicep build` |
| `Conflict` | המשאב כבר קיים | השתמש בשם חדש או מחק |
| `Forbidden` | הרשאות חסרות | בדוק תפקידי RBAC |

---

## 🔄 איפוס והשבה

```bash
# איפוס רך (שמירת משאבים, פריסת קוד מחדש)
azd deploy --force

# איפוס קשה (מחיקת הכל, התחלה חדשה)
azd down --force --purge
azd up
```

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **הקודם** | [פרק 6: לפני פריסה](../chapter-06-pre-deployment/README.md) |
| **הבא** | [פרק 8: הפקה](../chapter-08-production/README.md) |

---

## 📖 משאבים קשורים

- [בדיקות לפני פריסה](../chapter-06-pre-deployment/preflight-checks.md)
- [מדריך קונפיגורציה](../chapter-03-configuration/configuration.md)
- [בעיות AZD ב-GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->