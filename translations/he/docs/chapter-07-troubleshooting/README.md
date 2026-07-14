# פרק 7: פתרון בעיות ואיתור באגים

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: שעה עד שעתיים | **⭐ רמת קושי**: בינוני

---

## מבט כללי

פרק זה עוזר לך לאבחן ולפתור בעיות נפוצות בעבודה עם Azure Developer CLI. מכשלונות פריסה ועד בעיות ייחודיות לבינה מלאכותית.

> אומת נגד `azd 1.27.1` ביולי 2026.

## מטרות למידה

עם סיום פרק זה, תוכל:
- לאבחן כשלונות פריסה נפוצים ב-AZD
- לאתר בעיות אימות והרשאות
- לפתור בעיות חיבור לשירותי AI
- להשתמש בפורטל Azure ו-CLI לפתרון בעיות

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [בעיות נפוצות](common-issues.md) | בעיות שמופיעות לעיתים קרובות | 30 דק' |
| 2 | [מדריך איתור באגים](debugging.md) | אסטרטגיות איתור באגים שלב אחר שלב | 45 דק' |
| 3 | [פתרון בעיות ב-AI](ai-troubleshooting.md) | בעיות ייחודיות לבינה מלאכותית | 30 דק' |

---

## 🚨 תיקונים מהירים

### בעיות אימות
```bash
# דרוש עבור זרימות עבודה של AZD
azd auth login

# אופציונלי אם אתה גם משתמש בפקודות Azure CLI ישירות
az login

azd auth status
```

### כשלונות פריסה
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### התנגשויות משאבים
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

## 📋 הפניות לקוד שגיאה

| שגיאה | סיבה | פתרון |
|-------|-------|----------|
| `AuthenticationError` | לא מחובר | `azd auth login` |
| `ResourceNotFound` | משאב חסר | בדוק שמות משאבים |
| `QuotaExceeded` | גבולות מנוי | בקש הגדלת מכסה |
| `InvalidTemplate` | שגיאת תחביר ב-Bicep | `az bicep build` |
| `Conflict` | משאב קיים | השתמש בשם חדש או מחק |
| `Forbidden` | הרשאות לא מספקות | בדוק תפקידי RBAC |

---

## 🔄 איפוס והתאוששות

```bash
# איפוס רך (שמירת משאבים, פרוס מחדש קוד)
azd deploy --force

# איפוס קשה (מחק הכל, התחל מחדש)
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
- [מדריך הגדרות](../chapter-03-configuration/configuration.md)
- [בעיות ב-AZD בגיטהאב](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->