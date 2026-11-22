# פרק 2: פיתוח בשיטת AI-ראשון

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: 4-5 שעות כולל סדנה | **⭐ רמת קושי**: בינונית

---

## סקירה כללית

פרק זה מתמקד בפריסת יישומים המונעים בינה מלאכותית באמצעות Azure Developer CLI ושירותי Microsoft Foundry. מאפליקציות צ'אט מבוססות AI פשוטות לסוכנים חכמים עם כלים.

> **עדכון Foundry GA (2026-11-09):** חבילת `microsoft.foundry` 1.0 זמינה [לשימוש כללי](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). השתמש ב-`azd >= 1.37.0`; הערכות נשארו התקנה נפרדת. [מדריך הסוכן המתארח](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) כולל בדיקה מקומית של Agent Inspector ופריסת קוד מרחוק. זה סיקורת תיעודית, לא אימות פריסה בשידור חי; תכונות תצוגה מקדימה אופציונליות שומרים על מצבן.

## מטרות הלמידה

בסיום פרק זה, תוכל:
- לפרוס יישומי AI באמצעות תבניות AZD מוכנות מראש
- להבין את האינטגרציה של Microsoft Foundry עם AZD
- להתקין את חבילת GA ולבחון סוכן מתארח מקומית לפני פריסת המקור ל-Foundry
- לסקור את `azure.yaml`, נכסי הערכה, וניקוי פרויקטים חדשים מול ממוחזרים
- להגדיר ולהתאים סוכני AI עם כלים
- לפרוס יישומי RAG (ייצור משולב עם שליפה)

---

## 📚 שיעורים

| # | שיעור | תיאור | זמן |
|---|--------|-------------|------|
| 1 | [אינטגרציית Microsoft Foundry](microsoft-foundry-integration.md) | חבילת GA, זרימת עבודה של סוכן מתארח מקומי לענן, והערכות | 60 דק' |
| 2 | [מדריך סוכני AI](agents.md) | פריסת סוכנים חכמים עם כלים | 45 דק' |
| 3 | [פריסת מודל AI](ai-model-deployment.md) | פריסה והגדרה של מודלי AI | 30 דק' |
| 4 | [סדנת מעבדה AI](ai-workshop-lab.md) | מעשי: חקר תבנית ותכנון ההמרה שלך | 2-3 שעות |

---

## 🚀 התחלה מהירה

בחר אפשרות אחת בתיקייה ריקה חדשה. `.` בסוף מאתחל את התיקייה הנוכחית; אחרת AZD יכול ליצור תיקיית משנה בלי לשנות את תיקיית העבודה של הטרמינל שלך.

בשביל **נתיב פריסת הקוד של סוכן מתארח GA**, התחל במדריך המונחה [המדריך](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). נדרש AZD 1.37.0+, uv עדכנית, Python 3.13+, הרשאות Foundry וקווטת מודל. תבניות היישומים המלאות למטה הן אלטרנטיבות, לא דרישות מוקדמות למדריך זה.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 תבניות AI מומלצות

| תבנית | תיאור | שירותים |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | שיחת RAG עם אזכורים | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | סוכן AI עם כלים | שירות סוכני AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | צ'אט AI בסיסי | OpenAI + Container Apps |

---

## 💰 מודעות עלויות

אלו טווחים להמחשה בלבד, לא הצעות מחיר או תקרות; תעבורת מודל, SKU של חיפוש/מחשב, אזור ותכונות אופציונליות יכולים לחרוג מהן. עיין בהנחיות המחיר הנוכחיות של הדוגמה שבחרת לפני ההקצאה.

| סביבה | עלות חודשית משוערת |
|-------------|----------------------|
| פיתוח | $80-150 |
| ניסוי | $150-300 |
| ייצור | $300-3,500+ |

**ניקוי:** סקור את `azd down` לפני אישור: לפרויקט Foundry חדש זה מוחק את קבוצת המשאבים ואת כל התכולה שלה. לפרויקט Foundry ממוחזר, משאבי הפרויקט והסוכן נשארים במקומם; פעל על פי [הנחיות ניקוי המדריך](microsoft-foundry-integration.md#7-clean-up-deliberately) כדי להסיר משאבים לא רצויים בנפרד.

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **קודם** | [פרק 1: יסודות](../chapter-01-foundation/README.md) |
| **הבא** | [פרק 3: תצורה](../chapter-03-configuration/README.md) |
| **קפיצה אל** | [פרק 8: דפוסי ייצור](../chapter-08-production/README.md) |

---

## 📖 משאבים קשורים

- [פתרון בעיות בינה מלאכותית](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [שיטות הפקה בשימוש AI](../chapter-08-production/production-ai-practices.md)
- [תובנות יישומים](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->