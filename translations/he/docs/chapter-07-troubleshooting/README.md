# פרק 7: פתרון בעיות ודיבוג

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: 1-1.5 שעות | **⭐ מורכבות**: בינוני

---

## סקירה כללית

פרק זה עוזר לך לאבחן ולפתור בעיות נפוצות בעת עבודה עם Azure Developer CLI. החל מכשלונות פריסה ועד בעיות ספציפיות ל-AI.

## מטרות למידה

בסיום פרק זה, תוכל:
- לאבחן כישלונות פריסה נפוצים של AZD
- לדבג בעיות אימות והרשאות
- לפתור בעיות חיבור לשירותי AI
- להשתמש ב-Azure Portal וב-CLI לצורך פתרון בעיות

---

## 📚 שיעורים

| # | שיעור | תיאור | משך |
|---|--------|-------------|------|
| 1 | [בעיות נפוצות](common-issues.md) | בעיות שנפגשות לעתים קרובות | 30 דקות |
| 2 | [מדריך דיבוג](debugging.md) | אסטרטגיות דיבוג שלב-אחר-שלב | 45 דקות |
| 3 | [פתרון בעיות AI](ai-troubleshooting.md) | בעיות ספציפיות ל-AI | 30 דקות |

---

## 🚨 תיקונים מהירים

### בעיות אימות
```bash
azd auth login
az login
azd auth whoami
```

### כישלונות בהקצאה
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

### חריגת מכסה
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 מדריך קודי שגיאה

| שגיאה | גורם | פתרון |
|-------|-------|----------|
| `AuthenticationError` | לא מחובר | `azd auth login` |
| `ResourceNotFound` | משאב חסר | בדוק את שמות המשאבים |
| `QuotaExceeded` | מגבלות המנוי | בקש הגדלת מכסה |
| `InvalidTemplate` | שגיאת תחביר ב-Bicep | `az bicep build` |
| `Conflict` | המשאב כבר קיים | השתמש בשם חדש או מחק |
| `Forbidden` | חסרות הרשאות | בדוק תפקידי RBAC |

---

## 🔄 איפוס ושחזור

```bash
# אתחול רך (שמירה על המשאבים, פריסה מחדש של הקוד)
azd deploy --force

# אתחול קשה (מחיקת הכל, התחלה מחדש)
azd down --force --purge
azd up
```

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **הקודם** | [פרק 6: טרום-פריסה](../chapter-06-pre-deployment/README.md) |
| **הבא** | [פרק 8: ייצור](../chapter-08-production/README.md) |

---

## 📖 משאבים קשורים

- [בדיקות טרום-פריסה](../chapter-06-pre-deployment/preflight-checks.md)
- [מדריך תצורה](../chapter-03-configuration/configuration.md)
- [בעיות ב-GitHub של AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
הצהרת אחריות:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית Co-op Translator (https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לשים לב כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להתייחס למסמך המקורי בשפתו כמקור הסמכותי. עבור מידע קריטי, מומלץ לבצע תרגום מקצועי על ידי מתרגם אנושי. איננו אחראים לכל אי-הבנות או פרשנויות שגויות הנובעות מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->