# פרק 4: תשתית כקוד ופריסה

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: שעה עד שעה וחצי | **⭐ רמת קושי**: בינוני

---

## מבוא

הפרק הזה מכסה תבניות תשתית כקוד (IaC) עם תבניות Bicep, פריסת משאבי Azure ואסטרטגיות פריסה באמצעות Azure Developer CLI.

> נבדק עם `azd 1.23.12` במרץ 2026.

## מטרות הלמידה

בסיום פרק זה, תוכלו:
- להבין את מבנה התחביר של תבניות Bicep
- לספק משאבי Azure עם `azd provision`
- לפרוס יישומים עם `azd deploy`
- ליישם אסטרטגיות פריסה כחול-ירוק וגלגול

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [פריסת משאבים](provisioning.md) | ניהול משאבי Azure עם AZD | 45 דק' |
| 2 | [מדריך פריסה](deployment-guide.md) | אסטרטגיות פריסת יישומים | 45 דק' |

---

## 🚀 התחלה מהירה

```bash
# אתחול מתבנית
azd init --template azure-functions-python-v2-http

# תצוגה מקדימה של מה שייווצר
azd provision --preview

# לפרוס תשתית בלבד
azd provision

# לפרוס קוד בלבד
azd deploy

# או שניהם יחד
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

## 🔧 פקודות עיקריות

| פקודה | תיאור |
|---------|-------------|
| `azd init` | אתחול פרויקט |
| `azd provision` | יצירת משאבי Azure |
| `azd deploy` | פריסת קוד היישום |
| `azd up` | פריסה + יצירת משאבים |
| `azd down` | מחיקת כל המשאבים |

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **הקודם** | [פרק 3: תצורה](../chapter-03-configuration/README.md) |
| **הבא** | [פרק 5: פתרונות רב-סוכנים](../chapter-05-multi-agent/README.md) |

---

## 📖 משאבים קשורים

- [בדיקות לפני פריסה](../chapter-06-pre-deployment/README.md)
- [דוגמאות אפליקציית מיכל](../../examples/container-app/README.md)
- [דוגמא לאפליקציית מסד נתונים](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש לשים לב כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפת המקור שלו הוא המקור הסמכותי. עבור מידע קריטי מומלץ להשתמש בתרגום מקצועי אנושי. אין אנו אחראים לכל אי-הבנה או פרשנות שגויה הנובעת מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->