# פרק 2: פיתוח מונחה בינה מלאכותית

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך זמן**: 1-2 שעות | **⭐ רמת קושי**: בינונית

---

## סקירה כללית

פרק זה מתמקד בפריסת אפליקציות מופעלות בינה מלאכותית באמצעות Azure Developer CLI ושירותי Microsoft Foundry. מאפליקציות צ'אט פשוטות ועד סוכנים אינטיליגנטיים עם כלים.

> **הערת אימות (2026-07-13):** זרימת הפקודות וההנחיות להרחבות בפרק זה נבדקו מול `azd` `1.27.1` וגרסת התצוגה המקדימה של הרחבת סוכני הבינה המלאכותית `azure.ai.agents` `1.0.0-beta.5`. אם אתם משתמשים בבניית AZD ישנה יותר, עדכנו קודם ואז המשיכו עם התרגילים.

## מטרות למידה

בסיום פרק זה תוכלו:
- לפרוס אפליקציות בינה מלאכותית באמצעות תבניות AZD מוכנות מראש
- להבין את האינטגרציה של Microsoft Foundry עם AZD
- להגדיר ולהתאים סוכני בינה מלאכותית עם כלים
- לפרוס אפליקציות RAG (ייצור משודרג בבחירת מידע)

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [אינטגרציה עם Microsoft Foundry](microsoft-foundry-integration.md) | חיבור AZD לשירותי Foundry | 30 דק' |
| 2 | [מדריך סוכני בינה מלאכותית](agents.md) | פריסת סוכנים אינטיליגנטיים עם כלים | 45 דק' |
| 3 | [פריסת דגמי בינה מלאכותית](ai-model-deployment.md) | לפרוס ולהגדיר דגמי בינה מלאכותית | 30 דק' |
| 4 | [מעבדת סדנת בינה מלאכותית](ai-workshop-lab.md) | מעשי: הכנת פתרון בינה מלאכותית המוכן ל-AZD | 60 דק' |

---

## 🚀 התחלה מהירה

```bash
# אפשרות 1: יישום שיחה RAG
azd init --template azure-search-openai-demo
azd up

# אפשרות 2: סוכני AI
azd init --template get-started-with-ai-agents
azd up

# אפשרות 3: יישום שיחה מהיר
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 תבניות בינה מלאכותית מובילות

| תבנית | תיאור | שירותים |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | צ'אט RAG עם מקורות | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | סוכן בינה מלאכותית עם כלים | שירות סוכני בינה מלאכותית |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | צ'אט בינה מלאכותית בסיסי | OpenAI + Container Apps |

---

## 💰 מודעות לעלות

| סביבה | עלות חודשית מוערכת |
|-------------|----------------------|
| פיתוח | 80-150$ |
| סביבה ביניים | 150-300$ |
| ייצור | 300-3,500$+ |

**טיפ:** הריצו `azd down` לאחר בדיקות כדי למנוע חיובים.

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **קודם** | [פרק 1: יסודות](../chapter-01-foundation/README.md) |
| **הבא** | [פרק 3: תצורה](../chapter-03-configuration/README.md) |
| **דלג ל** | [פרק 8: דפוסי ייצור](../chapter-08-production/README.md) |

---

## 📖 משאבים קשורים

- [פתרון בעיות בינה מלאכותית](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [פרקטיקות ייצור לבינה מלאכותית](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->