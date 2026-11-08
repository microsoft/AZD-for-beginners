# תשתית מרובת-סוכנים בקמעונאות

**דוגמה למבנה מתקדם — לא יישום מרובה-סוכנים פעיל.**

[דף הקורס הראשי](../../README.md) ·
[פרק 5](../../docs/chapter-05-multi-agent/README.md) ·
[תרשים הארכיטקטורה](../retail-scenario.md)

## מה שמופעל כאן

תיקיה זו מכילה תבנית ARM, פרמטרים, ותסריט הפריסה של Bash.
אין **מקור `azure.yaml` או אפליקציית קמעונאות**.

| משאב | מצב בפועל לאחר האספקה |
|---|---|
| חשבון OpenAI ראשי ב-Azure | פריסת `gpt-4.1-chat` באמצעות גרסת `gpt-4.1`, `2025-04-14`, `GlobalStandard` |
| חשבון OpenAI משני (אופציונלי) | `gpt-4.1-mini-inventory`, דגם `gpt-4.1-mini` גרסה `2025-04-14`, `GlobalStandard` |
| חשבון אנבידינג (אופציונלי) | גרסת `text-embedding-ada-002` `2`, `Standard`; אין צינור אינדוקס |
| חשבון Grader של OpenAI | `gpt-4.1-grader`, דגם `gpt-4.1` גרסה `2025-04-14`, `GlobalStandard`; ללא מעריך |
| חיפוש בינה מלאכותית | שירות ריק; ללא אינדקס או מסמכים |
| אחסון | מכולות בלוב ריקות של `documents` ו-`uploads` |
| Cosmos DB | חשבון ללא שרת, מסד נתונים `chathistory`, מכולה `conversations` מחולקת לפי `/userId`, TTL של פריט ל-30 יום |
| Container Apps | גם הנתב וגם ה-frontend פועלים עם `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` בפורט 80 |
| Key Vault (אופציונלי) | כספת עם RBAC ריקה; **ללא סודות או הקצאות תפקידים** |
| Application Insights / Log Analytics (אופציונלי) | משאבים ואיסוף יומני סביבה; ללא אינסטרומנטציה מותאמת של אפליקציה, התראות או לוחות בקרה |
| Document Intelligence | חשבון S0; ללא תזרים עבודה לעיבוד מסמכים |

גרסת Legacy Bing Search v7 פורשה ב-11 באוגוסט 2025 והיא **לא מסופקת**.
לא יושמה אינטגרציה חלופית של אחיזת רשת.

**לא כלול:** סוכני לקוח/מלאי, API נתב `/chat`, ממשק צ'אט frontend,
סכמת חיפוש או סקריפטים לבליעה, Azure Container Registry, נקודות קצה פרטיות,
זהויות מנוהלות, הקצאות RBAC, כשל אוטומטי, Front Door, סורק red-team,
CLI להערכה, אימות, או CI/CD.

הודעת הצלחה מ-ARM מאשרת רק פריסת משאבים. היא אינה מאשרת
תפקודיות האפליקציה, אבטחה, זמינות או מוכנות לייצור.

## תנאים מוקדמים ועלויות

- Bash (Git Bash/WSL ב-Windows) ו-
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- מנוי עם הרשאות ליצירת כל המשאבים הרשומים.
- בדוק זמינות של **כל דגם/גרסה/SKU בכל אזור שנבחר**
  ומכסת המנוי שלך. ברירות המחדל הן דוגמאות, לא ערובות.
  התייעץ עם [זמינות דגמים](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- בחר קבוצת משאבים ייעודית שניתן למחוק לאחר הבדיקה.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

מיקומים ברירת מחדל: ראשי `eastus2`, משני `westus2`, אנבידינג `francecentral`;
הגדרות ברירת המחדל של grader הן באזור הראשי אם לא מסופק `graderLocation`.
`--no-multi-region` מדלג על חשבונות משניים ואנבידינג; אינו מדלג על
חשבון ה-grader.

החיפוש מחויב בזמן פריסה גם כשהוא ריק. מינימום שכפולים במכולה,
עודף אחסון, בקשות/אחסון Cosmos DB, אסימוני דגם, שיחות Document Intelligence
וקליטת/אחסון יומנים עלולים להוסיף חיובים. אין סכום כולל חודשי
קבוע או מאומת. הערך את ה-SKUs המדויקים ב-
[מחשבון המחירים של Azure](https://azure.microsoft.com/pricing/calculator/) ו-
הגדר תקציב לפני הפריסה.

### מצבי פריסה

הגדרות אלה הן גדלי משאבים, **לא אישורים לייצור או SLA**:

| מצב | יחידות קיבולת שיחה / מיני / אנבידינג / גריידר | שכפולי נתב | שכפולי frontend | דרגת חיפוש | אחסון |
|---|---|---|---|---|---|
| מינימלי | 10 / 10 / 20 / 5 | 0–3 | 1–2 | בסיסי, שכפול 1 | Standard_LRS |
| סטנדרטי | 20 / 15 / 30 / 15 | 1–3 | 1–2 | סטנדרטי, שכפול 1 | Standard_ZRS |
| פרימיום | 40 / 30 / 60 / 30 | 1–10 | 1–5 | סטנדרטי2, שכפול 2 | Standard_GRS |

יחידות קיבולת דגם הן ספציפיות לדגם/SKU; אל תסכם אותן כהבטחת TPM אוניברסלית.
פרימיום אינו מפעיל Container Apps עם גיבוי אזורי: זה דורש
עיצוב רשת נוסף. חיפוש בסיסי תומך בחיפוש וקטורי, בכפוף
למגבלות השירות; הוא אינו לא תואם במהותו לוקטורים.

## 🚀 פריסה מהירה

עיין קודם ב-`azuredeploy.json` ו-`azuredeploy.parameters.json`. הפקודות
למטה **יוצרות משאבים ב-Azure שניתנים לחיוב**; אינן בדיקות לא מקוונות.

משורש המאגר:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

הסקריפט משתמש בנתיבים יחסיים לתקייתו, בודק כניסה/כלים/ארגומנטים,
יוצר את קבוצת המשאבים אם אינה קיימת, מאמת את הפריסה, מפעיל, ו
מציג פלטים שאינם סודיים. אין צורך או ביצוע של `jq`, מילוי נתונים, אחזור סודי, או
הגדרת יישום לאחר פריסה.

ערכי ברירת המחדל של שורת הפקודה בסקריפט גוברים על הערכים המתאימים בקובץ הפרמטרים.
ערוך את קובץ הפרמטרים עבור הגדרות כמו אזורים משניים/שלישוניים; השתמש בפריסה ישירה של CLI אם אתה צריך ביטולים שרירותיים של פרמטרים:


```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

הקצאה יכולה לקחת 15–45 דקות או יותר, ועלולה להיכשל על מגבלות מכסת אזורים או
הגבלות מחזור חיים של מודל. אל תנסה שוב באופן עיוור: קרא תחילה את הפעלה הכושלת.

## אפשרויות תצורה

| פרמטר | ברירת מחדל בתבנית | משמעות |
|---|---|---|
| `projectName` | דרוש (`retail` בקובץ הפרמטרים) | 3–10 אותיות קטנות/ספרות |
| `location` | מיקום קבוצת המשאבים | אזור ראשי (`eastus2` בקובץ הפרמטרים) |
| `secondaryLocation` | `westus2` | אזור חשבון מודל מזערי |
| `tertiaryLocation` | `francecentral` | אזור חשבון ההטמעות |
| `graderLocation` | אזור ראשי | אזור חשבון מגיש עצמאי |
| `environmentName` | `dev` | `dev`, `staging`, או `prod`; רק שם, לא מתג החמרה |
| `deploymentMode` | `standard` | בחירת SKU/קיבולת |
| `enableMultiRegion` | `true` | הוספת חשבונות משניים והטמעות |
| `enableMonitoring` | `true` | הוספת Insights/מרחב עבודה ואיסוף יומני סביבה |
| `enableSecurity` | `true` | יצירת כספת ריקה עם RBAC בלבד |

הפרמטר המבלבל `openAiApiVersion` הוסר: גרסת API של מישור נתונים
אינה שולטת בגרסאות משאבי ARM או בגרסאות מודלים. זוגות שם/גרסת מודל
קיימים ב-`variables.modelDeployments`; יש לבדוק אותם יחד עם SKU הפריסה.

## אמת פריסה

השתמש בשם הפריסה מהפלט של הסקריפט או מ-`az deployment group list`.
לפריסה ישירה למעלה:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

צפוי: מצב פריסה `Succeeded`. במקרה של כישלון, בדוק פרטי שגיאת הפעולה.
פלט רשימת המשאבים לבדו אינו בדיקה אמינה של מצב הפריסה.

בדוק את המזהה המייצג **root**, לא נקודת סיום סוכן שאינה קיימת:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

צפוי: דף HTTP 200 hello-world, **לא תגובת צ'אט**. שגיאת HTTP אינה נחשבת לאימות מוצלח.


לבדיקה אמיתית של מודל ראשי (חיובית):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

צפוי: JSON עם `choices` ו-`usage`. שם הפריסה הוא
`gpt-4.1-chat`, לא שם הדגם הבסיסי `gpt-4.1`.

## 🔧 לאחר פריסה: צעדים הבאים

זהו **מאגר פיתוח**, לא תרגיל גמור:

1. מימוש סוכני לקוחות/מלאי מאומתים וחוזה הנתב.
2. מימוש צד-לקוח ואימות התצורה שלו.
3. יצירת ואוכלוס אינדקס חיפוש עם מימד/פרופיל התואם את
   מודל האימבדינג שלך, וטיפול בכשלים ובעדכונים של מסמכים.
4. יצירת רשימה והגדרת זהות/הרשאות גרירת תמונות.
5. בנייה ודחיפה של תמונות אמיתיות. שינוי פורטי כניסה ובדיקות של Container App
   שיתאימו לתמונות האלה לפני הבדיקה; פורט 80 כאן שייך למחליפי המקום.
6. הגדרת סודות או זהויות מנוהלות ותפקידי מישור נתונים ממוקדים. לא
   לציין שמות סודות דמיוניים: תבנית זו לא יוצרת סודות אפליקציה.
7. מידוד אפליקציות, הגדרת התראות, בדיקות כשלים/התאוששות והערכת
   תוצאות עם אמת קרקע מייצגת וביקורת אנושית.

ראו את [תבנית הארכיטקטורה](../retail-scenario.md) עבור גבולות העיצוב.

## פתרון בעיות וגבולות אבטחה

- **המודל אינו זמין:** אמתו את המודל/הגרסה/ה-SKU, האזור והמכסה במנוי;
  הסקריפט לא מבצע טעינה מוקדמת של קטלוגי דגמים.
- **ניטור מושבת:** יעד היומן של הסביבה הוא `none`, לא
  תצורה שגויה ריקה של Log Analytics.
- **רק מחליפי מקום:** `/chat`, הערכת סוכן וטעינת קבצים אינם קיימים.
- **רשת/זהות:** נקודות קצה ציבוריות ואימות מקומי מופעלים.
  הפעלה בלבד של Key Vault RBAC אינה יוצרת הקצאות תפקידים או זהויות.
- **ייצור:** הוספת אימות, זהויות ממוקדות, ניהול סודות,
  רשת פרטית היכן שנדרש, עיצוב זמינות ובדיקות תפעוליות.
  חשבונות מודל מרובי אזורים לבדם אינם מספקים כשל.

## ניקוי

אין כאן פרויקט AZD; `azd down` אינו הפקודה לניקוי.
לאחר ווידוא שהקבוצה מכילה רק את משאבי הלמידה שלכם:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

צפוי לאחר השלמת המחיקה: `false`. משאבים שטוחים ב-Key Vault ו-Cognitive Services
עשויים לשמור שמות; ניקוי דורש הרשאות מתאימות.
בדקו את Cost Management עבור חיובים שנדחו.

[דווחו על בעיה](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->