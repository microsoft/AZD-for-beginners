# 4. הגדר תבנית

!!! tip "בסיום המודול הזה תוכל/י"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. התחלת עם התבנית עצמה

פתח/י את [`azure.yaml` בפתח התחלה עם סוכני AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) במאגר שהתחלת. תבנית המקור יכולה להשתנות באופן עצמאי מהסדנה הזו. הקטע הבא **נבדק** ב-4 בנובמבר 2026; הוא אינו תחליף לקובץ המלא:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` מזהה את פרויקט AZD; `metadata.template` רושם את גרסת התבנית.
- `requiredVersions.azd` הוא המינימום של התבנית, לא המלצה להישאר עם CLI ישן. השתמש בגרסת AZD נתמכת עדכנית.
- `services` מגדיר יעדי פריסה של האפליקציה. תבנית זו מפעילה את ממשק ה-API ב-Python ואת הממשק הקדמי כשירות Container Apps יחיד.
- `project` הוא יחסית ל-`azure.yaml`.
- `remoteBuild` מבקש בניית מכולה מרחוק. לזהותך עדיין דרושות הרשאות Azure נדרשות.

קבצי Bicep בתבנית תחת `infra/`, לא רק רשימת `services`, מכריזים על משאבים כמו Microsoft Foundry, פריסות מודל, אחסון, וחיפוש AI אופציונלי.

## 2. הבן/י את שגרות מחזור החיים (lifecycle hooks)

בדוק/י את הסעיף `hooks` ואת הסקריפטים המופנים בתוכו לפני הרצת התבנית. הגרסה שנבדקה מכילה:

| שגרה (Hook) | מטרה | התנהגות חשובה |
|------|---------|--------------------|
| `preup` | אמת קלטי סביבה של התבנית לפני זרימת העבודה `up` | סקריפטים ספציפיים לפלטפורמה יכולים לעצור את זרימת העבודה במקרה של כשלון |
| `postdeploy` | הרץ הגדרות ספציפיות לתבנית לאחר פריסת האפליקציה | בדוק/י את `continueOnError` ואת פלט הסקריפט; פריסה מוצלחת אינה מוכיחה שכל משימות ההגדרה הצליחו |

גרסה זו **אינה** מכילה את ה-hook הישן `postprovision` / `write_env` שהוצג בחומרי סדנאות קודמים. אל תעתיק הפניות ל-hook לסקריפטים שכבר אינם קיימים.

מפתחות ה-hook בוחרים אירועי מחזור חיים; `posix` ו-`windows` בוחרים יישומי פלטפורמה. `shell`, `run`, `interactive`, ו-`continueOnError` מבקרים את ההרצה. אלו סקריפטים ניתנים לביצוע עם ההרשאות שלך, לכן סקור אותם בדיוק כמו קוד אפליקציה.

ראה את [תיעוד ה-hooks של AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) למחזור החיים המלא.

## 3. עקוב אחרי קלטי סביבה לתשתית

הרץ את הפקודות האלה ממאגר הדוגמא שהאותחל:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

בדוק את `infra/main.parameters.json` כדי לראות אילו משתני סביבה התבנית אכן משתמשת בהם. קביעת שם שרירותי עם `azd env set` לא משנה אוטומטית משאב ב-Azure.

ברירות המחדל שנבדקו כוללות:

| קלט | ברירת מחדל / מטרה |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; יחידות הקצבה תלויות בדגם ובסוג הפריסה |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; השאר מושבת אלא אם כן נבדקה הטיפול בנתונים |

אלה קלטים ספציפיים לדוגמא, לא הגדרות AZD גלובליות. בדוק את [תיעוד התמיכה בדגם ובהתאמה לאזור](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) ואת הקצבה במנוי שלך לפני בחירת דגם, SKU, קיבולת, או מיקום. אל תפרש כל יחידת קיבולת כ-1,000 tokens לדקה.

לבחירת דגם צ'אט שונה, עדכן את **שם, גרסה, פורמט, SKU, וקיבולת התואמים יחד**, בהתאם ל-[מדריך ההתאמה של הדוגמא](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). שינוי שם בלבד יכול להשאיר גרסה או סוג פריסה לא תואמים.

## 4. מעבדה: הפעלת חיפוש ואיתור אופציונליים

!!! warning "הגדרות אלו יכולות להוסיף משאבים שחייבים בתשלום"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

שינויים בתשתית דורשים אספקה; רק `azd deploy` לא מפעיל שירותי אפליקציה. עבור אינדוקס חיפוש ואופציות איתור נתמכות, עקוב אחרי [מדריך חיפוש AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). עבור ניטור, עקוב אחרי [מדריך התצפית](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

אל תאפשר לכידת תוכן של פקודות/תגובות על נתוני לקוחות אמיתיים ללא הסכמה נדרשת, בקרות גישה, מדיניות אחסון, ועריכה.

## 5. משאבים קיימים ו-CI/CD

לשימוש חוזר בפרויקט Foundry, עקוב אחרי [הוראות המשאבים הקיימים של הדוגמא](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). קביעת `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` משנה את נתיב הפריסה; בתרחיש כזה, התבנית לא יוצרת Application Insights או AI Search עבורך. אמת תלות, הקצאות תפקידים, ופריסות דגם במפורש.

קטע `pipeline.variables` שולט בערכים שמועברים לצינור שנוצר; הוא אינו חנות סודות ואינו יוצר משאבי Azure. העדף זהות מנוהלת באפליקציה ו-OIDC ל-CI/CD. קבצי הסביבה של AZD הם טקסט פשוט ואסור להתחייב אותם.

AZD תומך בייבוא קובץ dotenv מהימן ומוכן מקומית:

```bash
azd env set --file .env
```

סקור את הקובץ לפני ייבוא, ואל תדפיס קבצי סביבה המכילים סודות בטרמינלים משותפים או בלוגי CI.

## 6. בדוק את הבנתך

- איזה שירות `azure.yaml` מפרס את האפליקציה?
- איזו פרמטר תשתית צורך כל ערך ששינית?
- אילו שינויים דורשים אספקה ולא רק פריסה?
- האם האזור והמנוי שנבחרו תמכו בדגם ובהקצבה?
- האם כל ה-hooks שהוגדרו הצליחו, והאם ניתן לאמת את התנהגות האפליקציה המופעלת?

המשך ל-[התאמת תבנית](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->