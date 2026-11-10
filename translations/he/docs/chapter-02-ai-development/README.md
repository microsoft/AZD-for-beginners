# פרק 2: פיתוח מונחה בינה מלאכותית

**📚 קורס**: [AZD למתחילים](../../README.md) | **⏱️ משך**: 4-5 שעות כולל סדנה | **⭐ מורכבות**: בינוני

---

## סקירה כללית

פרק זה מתמקד בפריסת יישומים המונעים על ידי בינה מלאכותית באמצעות Azure Developer CLI ושירותי Microsoft Foundry. מיישומי צ'אט בינה מלאכותית פשוטים ועד סוכנים אינטליגנטיים עם כלים.

> **סקירת גרסה (2026-11-04):** הנחיית CLI של בינה מלאכותית נבדקה מול התיעוד/המקור שפורסם של `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, ו-`azure.ai.evaluations` `1.0.0-beta.2`. השתמש ב-`azd >= 1.37.0` עבור זרימת העבודה המשולבת. הערכות משתמשות כעת במרחב השמות הנפרד `azd ai eval`; ראה [שינויים בגרסה והנחיות הגירה](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). זה אינו אימות פריסה חי.

## מטרות הלמידה

בסיום פרק זה, תוכל:
- לפרוס יישומי בינה מלאכותית באמצעות תבניות AZD מוכנות מראש
- להבין אינטגרציה של Microsoft Foundry עם AZD
- להגדיר ולהתאים אישית סוכני בינה מלאכותית עם כלים
- לפרוס יישומי RAG (Retrieval-Augmented Generation)

---

## 📚 שיעורים

| # | שיעור | תיאור | משך |
|---|--------|-------------|------|
| 1 | [אינטגרציית Microsoft Foundry](microsoft-foundry-integration.md) | חיבור AZD עם שירותי Foundry | 30 דק |
| 2 | [מדריך סוכני בינה מלאכותית](agents.md) | פריסת סוכנים אינטליגנטיים עם כלים | 45 דק |
| 3 | [פריסת מודל בינה מלאכותית](ai-model-deployment.md) | לפרוס ולהגדיר מודלים של בינה מלאכותית | 30 דק |
| 4 | [מעבדת סדנת בינה מלאכותית](ai-workshop-lab.md) | עבודה מעשית: חקור תבנית ותכנן את ההמרה שלך | 2-3 שעות |

---

## 🚀 התחלה מהירה

בחר אפשרות אחת בספריית קבצים חדשה וריקה. בסוף `.` מאתחל את הספרייה הנוכחית; אחרת AZD יכול ליצור תיקיית משנה מבלי לשנות את ספריית העבודה של הטרמינל שלך.

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

## 🤖 תבניות בינה מלאכותית מובילות

| תבנית | תיאור | שירותים |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | צ'אט RAG עם ציטוטים | OpenAI + חיפוש בינה מלאכותית |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | סוכן בינה מלאכותית עם כלים | שירות סוכן בינה מלאכותית |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | צ'אט בסיסי של בינה מלאכותית | OpenAI + Container Apps |

---

## 💰 מודעות עלויות

אלה טווחים להמחשה בלבד, לא הצעות מחיר או הגבלות; תעבורת מודל, SKU של חיפוש/חישוב, אזור ותכונות אופציונליות יכולים לחרוג מהם. סקור את הנחיות התמחור הנוכחיות של הדוגמה שבחרת לפני הספקה.

| סביבה | עלות חודשית משוערת |
|-------------|----------------------|
| פיתוח | $80-150 |
| סביבה לבחינה | $150-300 |
| ייצור | $300-3,500+ |

**טיפ:** הרץ `azd down` לאחר הבדיקות כדי למנוע עלויות.

---

## 🔗 ניווט

| כיוון | פרק |
|-----------|---------|
| **הקודם** | [פרק 1: היסודות](../chapter-01-foundation/README.md) |
| **הבא** | [פרק 3: תצורה](../chapter-03-configuration/README.md) |
| **דילוג אל** | [פרק 8: דפוסי ייצור](../chapter-08-production/README.md) |

---

## 📖 משאבים קשורים

- [פתרון תקלות בבינה מלאכותית](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [שיטות עבודה בבינה מלאכותית לייצור](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->