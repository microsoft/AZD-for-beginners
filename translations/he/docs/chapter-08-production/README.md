# פרק 8: תבניות ייצור וארגוניות

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: 2-3 שעות | **⭐ מורכבות**: מתקדמת

---

## סקירה

פרק זה מכסה תבניות פריסה מוכנות לארגון, חיזוק אבטחה, ניטור ואופטימיזציה של עלויות עבור עומסי עבודה של AI בסביבת ייצור.

> אומת עם `azd 1.25.6` ביוני 2026.

## יעדי למידה

בסיום פרק זה, תוכל:
- לפרוס יישומים בעלי עמידות במספר אזורים
- ליישם תבניות אבטחה ארגוניות
- להגדיר ניטור מקיף
- לאופטimize עלויות בקנה מידה רחב
- להקים צינורות CI/CD עם AZD

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [שיטות AI לייצור](production-ai-practices.md) | תבניות פריסה ארגוניות | 90 דקות |

---

## 🚀 רשימת בדיקה לייצור

- [ ] פריסה במולטי-ריגיון לעמידות
- [ ] זהות מנוהלת לאימות (ללא מפתחות)
- [ ] Application Insights לניטור
- [ ] תקציבי עלות והתראות מוגדרים
- [ ] סריקת אבטחה מופעלת
- [ ] אינטגרציה של צינור CI/CD
- [ ] תוכנית לשחזור מאסון

---

## 🏗️ תבניות ארכיטקטורה

### תבנית 1: מיקרוסרביסים AI

```mermaid
graph LR
    Gateway[שער API] --> AI[שירות בינה מלאכותית] --> Models[מודלים של Microsoft Foundry]
    Gateway --> Auth[שירות אימות]
    AI --> Data[מאגר נתונים]
```

### תבנית 2: AI מונחה אירועים

```mermaid
graph LR
    EventGrid[רשת אירועים] --> Functions[פונקציות] --> Pipeline[צנרת בינה מלאכותית]
```

---

## 🔐 שיטות אבטחה מומלצות

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 אופטימיזציה בעלויות

| אסטרטגיה | חיסכון |
|----------|---------|
| התאמה לאפס (Container Apps) | 60-80% |
| שימוש בשכבות צריכה לפיתוח | 50-70% |
| התאמה מתוזמנת | 30-50% |
| קיבולת שמורה | 20-40% |

```bash
# הגדר התראות תקציב
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 הגדרת ניטור

```bash
# הזרם יומני רישום
azd monitor --logs

# בדוק תובנות יישום
azd monitor --overview

# הצג מדדים
az monitor metrics list --resource <resource-id>
```

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **קודם** | [פרק 7: פתרון בעיות](../chapter-07-troubleshooting/README.md) |
| **השלמת הקורס** | [בית הקורס](../../README.md) |

---

## 📖 משאבים קשורים

- [מדריך סוכני AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [פתרונות מולטי-אייגנט](../chapter-05-multi-agent/README.md)
- [דוגמה למיקרוסרביסים](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->