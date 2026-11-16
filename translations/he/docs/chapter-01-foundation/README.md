# פרק 1: יסוד והתחלה מהירה

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: 75-120 דקות כולל הפריסה הראשונה; תרגילים נוספים אורכים יותר | **⭐ רמת קושי**: מתחילים

---

## סקירה כללית

פרק זה מציג את יסודות Azure Developer CLI (azd). תלמדו את המושגים הבסיסיים, תתקינו את הכלים ותפריסו את היישום הראשון שלכם לענן Azure.

> יעד סקירת פקודות והגדרות: `azd 1.37.2` (נובמבר 2026). פריסת Azure חיה לא התבצעה במהלך הסקירה.

## מטרות הלמידה

בסיום פרק זה, תוכלו:
- להבין מהו Azure Developer CLI ואיך הוא שונה מ- Azure CLI
- להתקין ולהגדיר את AZD בפלטפורמה שלכם
- לפרוס את היישום הראשון שלכם ל-Azure באמצעות `azd up`
- לנקות משאבים עם `azd down`

---

## 📚 שיעורים

| מספר | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [יסודות AZD](azd-basics.md) | מושגים בסיסיים, מונחים ומבנה הפרויקט | 15 דקות |
| 2 | [התקנה והגדרה](installation.md) | מדריכים מותאמים לפלטפורמה | 10 דקות |
| 3 | [הפרויקט הראשון שלך](first-project.md) | מעשי: פריסת אפליקציית ווב ל-Azure | 20 דקות |
| 4 | [הבא את האפליקציה שלך](bring-your-own-app.md) | הוספת azd לפרויקט קיים שיש לך | 15 דקות |
| 5 | [מכולות פיתוח וקודספייס](dev-containers.md) | סביבות azd לשחזור באמצעות מכולות פיתוח | 15 דקות |

---

## ✅ התחילו כאן: אמתו את ההגדרה שלכם

לפני שתתחילו, ודאו שהמחשב המקומי שלכם מוכן לתבנית פרק 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

אם הסקריפט מדווח על כלים חסרים, תקנו אותם תחילה ואז המשיכו בפרק.

---

## 🚀 התחלה מהירה

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ קריטריוני הצלחה

לאחר שתסיימו פרק זה, תוכלו:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **הבא** | [פרק 2: פיתוח מונחה AI](../chapter-02-ai-development/README.md) |
| **דלג אל** | [פרק 3: הגדרות](../chapter-03-configuration/README.md) |

---

## 📖 משאבים קשורים

- [גליון פקודות](../../resources/cheat-sheet.md)
- [שאלות נפוצות](../../resources/faq.md)
- [מילון מונחים](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->