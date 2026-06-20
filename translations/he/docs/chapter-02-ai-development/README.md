# פרק 2: פיתוח ממוקד בינה מלאכותית

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: 1-2 שעות | **⭐ רמת קושי**: בינונית

---

## סקירה כללית

פרק זה מתמקד בפריסת אפליקציות מונעות בינה מלאכותית באמצעות Azure Developer CLI ושירותי Microsoft Foundry. החל מאפליקציות צ'אט פשוטות ועד סוכנים אינטיליגנטים עם כלים.

> **הערת אימות (2026-06-15):** זרימת הפקודות וההנחיות להרחבות בפרק זה נבדקו מול `azd` `1.25.6` והגרסה הנוכחית של תוסף הסוכנים האנליטיים preview `azure.ai.agents` `0.1.40-preview`. אם אתה משתמש בגרסת AZD ישנה יותר, עדכן תחילה ואז המשך עם התרגילים.

## מטרות הלמידה

בסיום פרק זה, תלמד כיצד:
- לפרוס אפליקציות AI תוך שימוש בתבניות AZD מוכנות מראש
- להבין את האינטגרציה של Microsoft Foundry עם AZD
- להגדיר ולהתאים סוכני AI עם כלים
- לפרוס אפליקציות RAG (Retrieval-Augmented Generation)

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [אינטגרציה עם Microsoft Foundry](microsoft-foundry-integration.md) | חיבור AZD עם שירותי Foundry | 30 דק' |
| 2 | [מדריך לסוכני AI](agents.md) | פריסה של סוכנים אינטיליגנטים עם כלים | 45 דק' |
| 3 | [פריסת מודלי AI](ai-model-deployment.md) | פריסה והגדרה של מודלי AI | 30 דק' |
| 4 | [מעבדת AI Workshop](ai-workshop-lab.md) | עבודה מעשית: הפוך את פתרון ה-AI שלך למוכן ל-AZD | 60 דק' |

---

## 🚀 התחלה מהירה

```bash
# אפשרות 1: יישום שיחת RAG
azd init --template azure-search-openai-demo
azd up

# אפשרות 2: סוכני בינה מלאכותית
azd init --template get-started-with-ai-agents
azd up

# אפשרות 3: אפליקציית שיחה מהירה
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 תבניות AI מובחרות

| תבנית | תיאור | שירותים |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | צ'אט RAG עם הפניות | OpenAI + חיפוש AI |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | סוכן AI עם כלים | שירות סוכן AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | צ'אט AI בסיסי | OpenAI + Container Apps |

---

## 💰 מודעות לעלות

| סביבה | עלות חודשית משוערת |
|-------------|----------------------|
| פיתוח | $80-150 |
| סביבות בדיקה | $150-300 |
| הפקה | $300-3,500+ |

**טיפ:** הפעל `azd down` לאחר הבדיקות כדי להימנע מחיובים.

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **קודם** | [פרק 1: יסודות](../chapter-01-foundation/README.md) |
| **הבא** | [פרק 3: הגדרות](../chapter-03-configuration/README.md) |
| **דלג אל** | [פרק 8: דפוסי הפקה](../chapter-08-production/README.md) |

---

## 📖 משאבים קשורים

- [פתרון בעיות AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [שיטות הפקה ב-AI](../chapter-08-production/production-ai-practices.md)
- [תובנות יישומים](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->