# פרק 2: פיתוח שממוקד ב‑AI

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-2 שעות | **⭐ Complexity**: בינוני

---

## מבוא

הפרק הזה מתמקד בפריסת יישומים המופעלים על ידי AI באמצעות Azure Developer CLI ושירותי Microsoft Foundry. מהאפליקציות צ'אט פשוטות ועד סוכנים חכמים עם כלים.

## מטרות הלמידה

By completing this chapter, you will:
- פריסת יישומי AI באמצעות תבניות AZD מוכנות
- הבנת האינטגרציה של Microsoft Foundry עם AZD
- הגדרה והתאמה של סוכני AI עם כלים
- פריסת יישומי RAG (Retrieval-Augmented Generation)

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [אינטגרציה עם Microsoft Foundry](microsoft-foundry-integration.md) | חיבור AZD לשירותי Foundry | 30 דקות |
| 2 | [מדריך סוכני AI](agents.md) | פריסת סוכנים אינטליגנטים עם כלים | 45 דקות |
| 3 | [פריסת מודלים של AI](ai-model-deployment.md) | פריסה והגדרה של מודלים של AI | 30 דקות |
| 4 | [סדנת AI מעשית](ai-workshop-lab.md) | מעשי: הכינו את פתרון ה‑AI שלכם להיות מוכן ל‑AZD | 60 דקות |

---

## 🚀 התחלה מהירה

```bash
# אפשרות 1: יישום צ'אט RAG
azd init --template azure-search-openai-demo
azd up

# אפשרות 2: סוכני בינה מלאכותית
azd init --template get-started-with-ai-agents
azd up

# אפשרות 3: אפליקציית צ'אט מהירה
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 תבניות AI מובילות

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | צ'אט RAG עם ציטוטים | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | סוכן AI עם כלים | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | צ'אט AI בסיסי | OpenAI + Container Apps |

---

## 💰 מודעות לעלות

| סביבה | עלות חודשית משוערת |
|-------------|----------------------|
| פיתוח | $80-150 |
| סביבת בדיקות | $150-300 |
| ייצור | $300-3,500+ |

**טיפ:** הריצו `azd down` לאחר הבדיקות כדי להימנע מחיובים.

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **הקודם** | [פרק 1: יסודות](../chapter-01-foundation/README.md) |
| **הבא** | [פרק 3: תצורה](../chapter-03-configuration/README.md) |
| **דלג אל** | [פרק 8: דפוסי ייצור](../chapter-08-production/README.md) |

---

## 📖 משאבים קשורים

- [פתרון תקלות AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [שיטות AI לייצור](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
הצהרת אחריות:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית Co-op Translator (https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי־דיוקים. יש להחשיב את המסמך המקורי בשפת המקור כמקור הסמכות. עבור מידע קריטי מומלץ תרגום מקצועי על ידי מתרגם אנושי. איננו אחראים לכל אי־הבנה או פרשנות שגויה הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->