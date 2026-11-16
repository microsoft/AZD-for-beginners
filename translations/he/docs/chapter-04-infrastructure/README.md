# פרק 4: תשתית כקוד והטמעה

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: 2-3 שעות קריאה; יש להוסיף זמן נוסף לתרגילי הטמעה | **⭐ רמת קושי**: בינוני

---

## סקירה כללית

פרק זה מכסה דפוסי תשתית כקוד (IaC) עם תבניות Bicep, הספקת משאבים וגישות הטמעה באמצעות Azure Developer CLI.

> מטרה לסקירת פקודות וקונפיגורציה: `azd 1.37.2` (נובמבר 2026). לא בוצעה הפעלה חיה של Azure במהלך הסקירה.

## יעדי למידה

בסיום פרק זה, תוכל:
- להבין את מבנה ותוכן תבנית Bicep
- לספק משאבי Azure עם `azd provision`
- לפרוס אפליקציות עם `azd deploy`
- ליישם אסטרטגיות הטמעה כחולה-ירוקה והטמעה מדורגת

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [ספקת משאבים](provisioning.md) | ניהול משאבי Azure עם AZD | 45 דק' |
| 2 | [מדריך הטמעה](deployment-guide.md) | אסטרטגיות הטמעת אפליקציות | 45 דק' |
| 3 | [כתיבת תבנית משלך](custom-templates.md) | בנייה ופרסום תבניות azd רב-פעמיות | 30 דק' |

---

## 🚀 התחלה מהירה

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 מבנה פרויקט AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 פקודות חיוניות

| פקודה | תיאור |
|---------|-------------|
| `azd init` | אתחול פרויקט |
| `azd provision` | יצירת משאבי Azure |
| `azd deploy` | פריסת קוד אפליקציה |
| `azd up` | ספק + פרוס |
| `azd down` | מחיקת כל המשאבים |

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **הקודם** | [פרק 3: קונפיגורציה](../chapter-03-configuration/README.md) |
| **הבא** | [פרק 5: פתרונות רב-סוכניים](../chapter-05-multi-agent/README.md) |

---

## 📖 משאבים קשורים

- [בדיקות לפני הטמעה](../chapter-06-pre-deployment/README.md)
- [דוגמאות לאפליקציות מכולה](../../examples/container-app/README.md)
- [דוגמת אפליקציית בסיס נתונים](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->