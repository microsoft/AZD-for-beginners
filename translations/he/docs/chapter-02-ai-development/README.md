# פרק 2: פיתוח ממוקד בינה מלאכותית

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: שעה-שעתיים | **⭐ מורכבות**: בינוני

---

## סקירה כללית

פרק זה מתמקד בפריסת יישומים מונעי בינה מלאכותית באמצעות Azure Developer CLI ושירותי Microsoft Foundry. החל מאפליקציות צ'אט פשוטות ועד סוכנים אינטיליגנטים עם כלים.

> **הערת אימות (2026-03-25):** זרימת הפקודות וההנחיות להרחבות בפרק זה נבדקו מול `azd` `1.23.12` וגרסת התצוגה המקדימה הנוכחית של הרחבת סוכן הבינה המלאכותית `azure.ai.agents` `0.1.18-preview`. אם אתם משתמשים בבניית AZD ישנה יותר, עדכנו תחילה ואז המשיכו עם התרגילים.

## מטרות הלמידה

בסיום פרק זה תוכלו:
- לפרוס יישומי בינה מלאכותית באמצעות תבניות AZD מוכנות מראש
- להבין את האינטגרציה של Microsoft Foundry עם AZD
- להגדיר ולהתאים סוכני בינה מלאכותית עם כלים
- לפרוס יישומי RAG (יצירה משולבת בהבאת מידע חיצוני)

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [אינטגרציה עם Microsoft Foundry](microsoft-foundry-integration.md) | חיבור AZD לשירותי Foundry | 30 דקות |
| 2 | [מדריך סוכני בינה מלאכותית](agents.md) | פריסת סוכנים אינטיליגנטים עם כלים | 45 דקות |
| 3 | [פריסת מודל בינה מלאכותית](ai-model-deployment.md) | פריסת והגדרת מודלים של AI | 30 דקות |
| 4 | [מעבדת סדנת בינה מלאכותית](ai-workshop-lab.md) | מעשי: הפוך את פתרון ה-AI שלך מוכן ל-AZD | 60 דקות |

---

## 🚀 התחלה מהירה

```bash
# אפשרות 1: יישום צ'אט RAG
azd init --template azure-search-openai-demo
azd up

# אפשרות 2: סוכני בינה מלאכותית
azd init --template get-started-with-ai-agents
azd up

# אפשרות 3: יישום צ'אט מהיר
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 תבניות AI מובילות

| תבנית | תיאור | שירותים |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | צ'אט RAG עם ציטוטים | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | סוכן AI עם כלים | שירות סוכן AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | צ'אט AI בסיסי | OpenAI + Container Apps |

---

## 💰 מודעות לעלויות

| סביבה | עלות חודשית משוערת |
|-------------|----------------------|
| פיתוח | $80-150 |
| סימולציה | $150-300 |
| ייצור | $300-3,500+ |

**טיפ:** הרץ `azd down` לאחר בדיקות כדי למנוע חיובים.

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **קודם** | [פרק 1: יסודות](../chapter-01-foundation/README.md) |
| **הבא** | [פרק 3: הגדרות](../chapter-03-configuration/README.md) |
| **קפוץ ל** | [פרק 8: דפוסי ייצור](../chapter-08-production/README.md) |

---

## 📖 משאבים קשורים

- [פתרון בעיות בינה מלאכותית](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [שיטות ייצור בבינה מלאכותית](../chapter-08-production/production-ai-practices.md)
- [תובנות יישומים](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). אף על פי שאנו שואפים לדיוק, יש לקחת בחשבון כי תרגומים אוטומטיים עלולים להכיל שגיאות או חוסר דיוקים. יש להתייחס למסמך המקורי בשפתו המקורית כמקור הסמכותי. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי אדם. אנו לא נושאים באחריות לכל אי הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->