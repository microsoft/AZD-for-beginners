# פרק 8: תבניות ייצור וארגוניות

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: 2-3 שעות | **⭐ מורכבות**: מתקדם

---

## סקירה כללית

פרק זה מכסה תבניות פריסה מוכנות לארגון, החמרת אבטחה, ניטור ואופטימיזציית עלויות לעומסי עבודה של ייצור AI.

> אומת מול `azd 1.27.1` ביולי 2026.

## מטרות למידה

בסיום פרק זה, תוכל:
- לפרוס יישומים רב-אזוריים חסינים
- ליישם תבניות אבטחה ארגוניות
- להגדיר ניטור מקיף
- לאופטמיזציה של עלויות בקנה מידה
- להגדיר צינורות CI/CD עם AZD

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [שיטות ייצור AI](production-ai-practices.md) | תבניות פריסה ארגוניות | 90 דק' |

---

## 🚀 רשימת בדיקה לייצור

- [ ] פריסת רב-אזורית לחוסן
- [ ] זהות מנוהלת לאימות (ללא מפתחות)
- [ ] Application Insights לניטור
- [ ] תקציבי עלויות והתראות מוגדרים
- [ ] סריקת אבטחה מופעלת
- [ ] אינטגרציה לצינור CI/CD
- [ ] תכנית התאוששות מאסון

---

## 🏗️ תבניות ארכיטקטורה

### תבנית 1: מיקרוסרוויסים AI

```mermaid
graph LR
    Gateway[שער API] --> AI[שירות AI] --> Models[דגמי Microsoft Foundry]
    Gateway --> Auth[שירות אימות]
    AI --> Data[מאגר נתונים]
```

### תבנית 2: AI מונחה אירועים

```mermaid
graph LR
    EventGrid[רשת אירועים] --> Functions[פונקציות] --> Pipeline[צינור בינה מלאכותית]
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

## 💰 אופטימיזציית עלויות

| אסטרטגיה | חיסכון |
|----------|---------|
| סקייל לאפס (Container Apps) | 60-80% |
| שימוש בשכבות צריכה לפיתוח | 50-70% |
| סקייל מתוזמן | 30-50% |
| קיבולת שמורה | 20-40% |

```bash
# הגדרת התראות תקציב
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 הגדרת ניטור

```bash
# הזרם יומני
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
| **סיום קורס** | [בית הקורס](../../README.md) |

---

## 📖 משאבים קשורים

- [מדריך סוכני AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [פתרונות מרובי סוכנים](../chapter-05-multi-agent/README.md)
- [דוגמת מיקרוסרוויסים](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->