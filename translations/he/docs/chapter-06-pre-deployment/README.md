# פרק 6: תכנון ואימות לפני פריסה

**📚 קורס**: [AZD For Beginners](../../README.md) | **⏱️ משך**: 1 hour | **⭐ רמת קושי**: Intermediate

---

## סקירה כללית

פרק זה מכסה שלבים חיוניים של תכנון ואימות לפני פריסת היישום שלכם. למדו כיצד להימנע מטעויות יקרות באמצעות תכנון קיבולת נכון, בחירת SKU וביצוע בדיקות מקדימות.

## מטרות הלמידה

By completing this chapter, you will:
- להריץ בדיקות מקדימות לפני הפריסה
- לתכנן קיבולת ולהעריך דרישות משאבים
- לבחור SKU מתאימים לאופטימיזציה של עלויות
- להגדיר את Application Insights לניטור
- להבין דפוסי תיאום צוות

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [בדיקות מקדימות](preflight-checks.md) | לאמת תצורה לפני פריסה | 15 דקות |
| 2 | [תכנון קיבולת](capacity-planning.md) | להעריך דרישות משאבים | 20 דקות |
| 3 | [בחירת SKU](sku-selection.md) | לבחור שכבות תמחור מתאימות | 15 דקות |
| 4 | [Application Insights](application-insights.md) | להגדיר ניטור | 20 דקות |
| 5 | [דפוסי תיאום](coordination-patterns.md) | תזרימי עבודה לפריסה בצוות | 15 דקות |

---

## 🚀 התחלה מהירה

```bash
# בדוק מכסות המנוי
az vm list-usage --location eastus --output table

# תצוגה מקדימה של פריסה (לא ייווצרו משאבים)
azd provision --preview

# אמת את תחביר Bicep
az bicep build --file infra/main.bicep

# בדוק את תצורת הסביבה
azd env get-values
```

---

## ☑️ רשימת בדיקה לפני פריסה

### לפני `azd provision`

- [ ] מכסה מאומתת לאזור
- [ ] בחירת SKU מתאימה
- [ ] הערכת עלות נבדקה
- [ ] קונבנציה לשמות עקבית
- [ ] אבטחה/RBAC מוגדרים

### לפני `azd deploy`

- [ ] משתני סביבה הוגדרו
- [ ] סודות ב-Key Vault
- [ ] מחרוזות חיבור אומתו
- [ ] בדיקות בריאות הוגדרו

---

## 💰 מדריך לבחירת SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **הקודם** | [פרק 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **הבא** | [פרק 7: פתרון בעיות](../chapter-07-troubleshooting/README.md) |

---

## 📖 משאבים קשורים

- [מדריך תצורה](../chapter-03-configuration/configuration.md)
- [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md)
- [בעיות נפוצות](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
הצהרת אחריות:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית Co-op Translator (https://github.com/Azure/co-op-translator). אף שאנו שואפים לדיוק, יש להביא בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להסתמך על המסמך המקורי בשפתו כמקור הסמכות. במקרה של מידע קריטי, מומלץ לפנות לתרגום מקצועי על ידי מתרגם אנושי. איננו אחראים לכל אי-הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->