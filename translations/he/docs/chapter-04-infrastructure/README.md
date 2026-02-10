# פרק 4: תשתית כקוד ופריסה

**📚 קורס**: [AZD For Beginners](../../README.md) | **⏱️ משך**: 1-1.5 שעות | **⭐ רמת קושי**: בינוני

---

## סקירה

פרק זה מכסה דפוסי Infrastructure as Code (IaC) עם תבניות Bicep, הקצאת משאבים, ואסטרטגיות פריסה באמצעות Azure Developer CLI.

## מטרות הלמידה

בסיום פרק זה, תוכל:
- להבין את מבנה ותמצות התחביר של תבניות Bicep
- להקצות משאבי Azure עם `azd provision`
- לפרוס יישומים עם `azd deploy`
- ליישם אסטרטגיות פריסה מסוג blue-green ו-rolling

---

## 📚 שיעורים

| # | שיעור | תאור | זמן |
|---|--------|-------------|------|
| 1 | [הקצאת משאבים](provisioning.md) | ניהול משאבי Azure עם AZD | 45 דקות |
| 2 | [מדריך פריסה](deployment-guide.md) | אסטרטגיות פריסת יישומים | 45 דקות |

---

## 🚀 התחל במהירות

```bash
# אתחול מתוך תבנית
azd init --template azure-functions-python-v2-http

# תצוגה מקדימה של מה שייווצר
azd provision --preview

# הקצאת תשתיות בלבד
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

| פקודה | תאור |
|---------|-------------|
| `azd init` | אתחול הפרויקט |
| `azd provision` | יצירת משאבי Azure |
| `azd deploy` | פריסת קוד היישום |
| `azd up` | הקצאה + פריסה |
| `azd down` | מחיקת כל המשאבים |

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **הקודם** | [פרק 3: תצורה](../chapter-03-configuration/README.md) |
| **הבא** | [פרק 5: פתרונות רב-סוכניים](../chapter-05-multi-agent/README.md) |

---

## 📖 משאבים קשורים

- [בדיקות לפני פריסה](../chapter-06-pre-deployment/README.md)
- [דוגמאות לאפליקציות Container](../../examples/container-app/README.md)
- [דוגמה לאפליקציית מסד נתונים](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
כתב ויתור:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לשים לב כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להתייחס למסמך המקורי בשפתו כמקור הסמכות. עבור מידע קריטי מומלץ להיעזר בתרגום מקצועי על ידי מתרגם אנושי. איננו אחראים לכל אי-הבנה או לפרשנות שגויה הנובעת מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->