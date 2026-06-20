# פרק 4: תשתית כקוד ופריסה

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: שעה עד שעה וחצי | **⭐ מורכבות**: בינוני

---

## מבוא

פרק זה מכסה תבניות תשתית כקוד (IaC) עם תבניות Bicep, פריסת משאבים ואסטרטגיות פריסה באמצעות Azure Developer CLI.

> אומת עם `azd 1.25.6` ביוני 2026.

## יעדי הלמידה

בסיום פרק זה, תוכל:
- להבין את מבנה התחביר של תבניות Bicep
- לפרוס משאבי Azure עם `azd provision`
- לפרוס יישומים עם `azd deploy`
- ליישם אסטרטגיות פריסה כחול-ירוק ופריסה מתגלגלת

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [פריסת משאבים](provisioning.md) | ניהול משאבי Azure עם AZD | 45 דק' |
| 2 | [מדריך פריסה](deployment-guide.md) | אסטרטגיות פריסת יישומים | 45 דק' |
| 3 | [כתיבת תבנית משלך](custom-templates.md) | יצירה ופרסום תבניות azd לשימוש חוזר | 30 דק' |

---

## 🚀 התחלה מהירה

```bash
# אתחול מתבנית
azd init --template azure-functions-python-v2-http

# תצוגה מקדימה של מה שיווצר
azd provision --preview

# פריסת תשתית בלבד
azd provision

# פריסת קוד בלבד
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

## 🔧 פקודות חיוניות

| פקודה | תיאור |
|---------|-------------|
| `azd init` | איפוס פרויקט |
| `azd provision` | יצירת משאבי Azure |
| `azd deploy` | פריסת קוד היישום |
| `azd up` | פריסה + יצירת משאבים |
| `azd down` | מחיקת כל המשאבים |

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **הקודם** | [פרק 3: תצורה](../chapter-03-configuration/README.md) |
| **הבא** | [פרק 5: פתרונות מרובי סוכנים](../chapter-05-multi-agent/README.md) |

---

## 📖 משאבים קשורים

- [בדיקות טרום פריסה](../chapter-06-pre-deployment/README.md)
- [דוגמאות לאפליקציית מכולות](../../examples/container-app/README.md)
- [דוגמה לאפליקציית מסד נתונים](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->