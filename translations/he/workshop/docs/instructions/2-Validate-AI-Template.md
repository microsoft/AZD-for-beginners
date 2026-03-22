# 2. אימות תבנית

!!! tip "בסוף מודול זה תוכל ל"

    - [ ] לנתח את ארכיטקטורת הפתרון של ה-AI
    - [ ] להבין את זרימת העבודה של פריסת AZD
    - [ ] להשתמש ב-GitHub Copilot לקבלת עזרה בשימוש ב-AZD
    - [ ] **מעבדה 2:** פריסה ואימות תבנית הסוכנים של ה-AI

---


## 1. הקדמה

ה-[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) או `azd` הוא כלי שורת פקודה בקוד פתוח שמייעל את זרימת העבודה של המפתח בזמן בנייה ופריסה של יישומים ל-Azure.

[תבניות AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) הן מאגרים סטנדרטיים הכוללים קוד דוגמה של יישומים, נכסי _תשתית כקוד_, וקבצי תצורה של `azd` עבור ארכיטקטורת פתרון מגובשת. הקמת התשתית נעשית פשוטה כמו הרצת הפקודה `azd provision` - בעוד שפקודת `azd up` מאפשרת הקמת תשתית **ופריסת** היישום שלך בבת אחת!

כתוצאה מכך, התחלת פיתוח היישום יכולה להיות פשוטה כמו מציאת תבנית הזנקת AZD המתאימה ביותר לצרכי היישום והתשתית שלך - ואז התאמת המאגר לדרישות התרחיש שלך.

לפני שנתחיל, בוא נעשה וודא שיש לך את Azure Developer CLI מותקן.

1. פתח טרמינל ב-VS Code והקלד את הפקודה הבאה:

      ```bash title="" linenums="0"
      azd version
      ```

1. אתה אמור לראות משהו כזה!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**עכשיו אתה מוכן לבחור ולפרוס תבנית עם azd**

---

## 2. בחירת תבנית

פלטפורמת Microsoft Foundry מגיעה עם [קבוצה של תבניות AZD מומלצות](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) המכסות תרחישי פתרון פופולריים כמו _אוטומציית זרימת עבודה עם סוכנים מרובים_ ו_עיבוד תוכן מולטימודלי_. ניתן גם לגלות את התבניות האלה על ידי ביקור בפורטל Microsoft Foundry.

1. בקר בכתובת [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. התחבר לפורטל Microsoft Foundry כשהתבקש - תראה משהו כזה.

![Pick](../../../../../translated_images/he/01-pick-template.60d2d5fff5ebc374.webp)


האפשרויות **Basic** הן תבניות ההתחלה שלך:

1. [ ] [התחל עם צ’אט AI](https://github.com/Azure-Samples/get-started-with-ai-chat) שמפריסה יישום צ’אט בסיסי _עם הנתונים שלך_ לאפליקציות מכולה של Azure. השתמש בזה כדי לחקור תרחיש של צ’אטבוט AI בסיסי.
1. [X] [התחל עם סוכני AI](https://github.com/Azure-Samples/get-started-with-ai-agents) שגם מפריסה סוכן AI סטנדרטי (עם סוכני Foundry). השתמש בזה כדי להכיר פתרונות AI סוכניים הכוללים כלים ודגמים.

בקר בקישור השני בכרטיסיה חדשה בדפדפן (או לחץ על `Open in GitHub` עבור הכרטיס המתאים). אמור להופיע מאגר התבנית הזו של AZD. הקדש דקה לחקור את ה-README. ארכיטקטורת היישום נראית כך:

![Arch](../../../../../translated_images/he/architecture.8cec470ec15c65c7.webp)

---

## 3. הפעלת תבנית

בוא ננסה לפרוס את התבנית הזו ולוודא שהיא תקינה. נעקוב אחר ההנחיות בסעיף [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. לחץ על [הקישור הזה](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - אשר את הפעולה המוגדרת מראש של `Create codespace`
1. זה יפתח כרטיסייה חדשה בדפדפן - המתן לסיום טעינת מושב GitHub Codespaces
1. פתח את טרמינל ה-VS Code ב-Codespaces - הקלד את הפקודה הבאה:

   ```bash title="" linenums="0"
   azd up
   ```

השלים את שלבי זרימת העבודה שהפקודה הזו תפעיל:

1. תתבקש להתחבר ל-Azure - עקוב אחר ההוראות לאימות
1. הזן שם סביבה ייחודי עבורך - למשל, השתמשתי ב-`nitya-mshack-azd`
1. זה ייצור תיקייה `.azure/` - תראה בתוכה תיקייה משנית עם שם הסביבה
1. תתבקש לבחור שם למנוי - בחר את ברירת המחדל
1. תתבקש לבחור מיקום - השתמש ב-`East US 2`

עכשיו המתן לסיום הקמת התשתית. **זה לוקח 10-15 דקות**

1. כאשר זה יסתיים, הקונסולה שלך תציג הודעת הצלחה כזו:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. פורטל Azure שלך יציג כעת קבוצת משאבים שהוקמה עם שם הסביבה:

      ![Infra](../../../../../translated_images/he/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **עכשיו אתה מוכן לאמת את התשתית והיישום שפועלים**.

---

## 4. אימות תבנית

1. עבור לדף Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - התחבר כשמתבקש
1. לחץ על קבוצת המשאבים בשם הסביבה שלך - תראה את הדף המוצג למעלה

      - לחץ על המשאב Azure Container Apps
      - לחץ על כתובת ה-URL של היישום במקטע _Essentials_ (בחלק העליון מימין)

1. אמור להופיע ממשק משתמש של יישום מתארח כמו הבא:

   ![App](../../../../../translated_images/he/03-test-application.471910da12c3038e.webp)

1. נסה לשאול כמה [שאלות לדוגמה](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. שאל: ```מהי בירת צרפת?```
      1. שאל: ```מה היא האוהל הטוב ביותר מתחת ל-200$ לשני אנשים, ומה התכונות שהוא כולל?```

1. אתה אמור לקבל תשובות דומות לאלה המוצגות למטה. _אבל איך זה עובד?_

      ![App](../../../../../translated_images/he/03-test-question.521c1e863cbaddb6.webp)

---

## 5. אימות סוכן

יישום Azure Container App מפרסם נקודת קצה שמתחברת לסוכן AI שהוקם בפרויקט Microsoft Foundry עבור תבנית זו. בוא נבחן מה המשמעות של זה.

1. חזור לדף _Overview_ של קבוצת המשאבים שלך בפורטל Azure

1. לחץ על המשאב `Microsoft Foundry` ברשימה הזו

1. אמור להופיע הדבר הבא. לחץ על כפתור `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/he/04-view-foundry-project.fb94ca41803f28f3.webp)

1. אמור להופיע דף הפרויקט Foundry של יישום ה-AI שלך
   ![Project](../../../../../translated_images/he/05-visit-foundry-portal.d734e98135892d7e.webp)

1. לחץ על `Agents` - תראה את הסוכן כבר מוגדר בפרויקט שלך
   ![Agents](../../../../../translated_images/he/06-visit-agents.bccb263f77b00a09.webp)

1. בחר אותו - תראה את פרטי הסוכן. שים לב לנתונים הבאים:

      - הסוכן משתמש כברירת מחדל בחיפוש בקבצים (תמיד)
      - `Knowledge` של הסוכן מציין שיש לו 32 קבצים שהועלו (לחיפוש בקבצים)
      ![Agents](../../../../../translated_images/he/07-view-agent-details.0e049f37f61eae62.webp)

1. חפש את האפשרות `Data+indexes` בתפריט השמאלי ולחץ לפרטים.

      - אמור להופיע 32 קבצים שהועלו עבור הידע.
      - אלה יתאימו ל-12 קבצי הלקוח ו-20 קבצי המוצר שבתיקיית `src/files`
      ![Data](../../../../../translated_images/he/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**אישרת את תפקוד הסוכן!**

1. תגובות הסוכן מבוססות על הידע בקבצים האלה.
1. אתה יכול כעת לשאול שאלות הקשורות לאותם נתונים ולקבל תגובות מבוססות.
1. דוגמה: `customer_info_10.json` מתארת את 3 הרכישות שבוצעו על ידי "Amanda Perez"

חזור לכרטיסיית הדפדפן עם נקודת הקצה של Container App ושאל: `באילו מוצרים אמנדה פרז היא בעלים?`. אמור להופיע משהו כזה:

![Data](../../../../../translated_images/he/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. מגרש משחקים לסוכן

בוא נבנה מעט אינטואיציה נוספת לגבי היכולות של Microsoft Foundry, על ידי הפעלת הסוכן במגרש המשחקים של הסוכנים.

1. חזור לעמוד `Agents` ב-Microsoft Foundry - בחר את הסוכן המוגדר כבררת מחדל
1. לחץ על אפשרות `Try in Playground` - אמור להופיע ממשק Playground כזה
1. שאל את אותה שאלה: `באילו מוצרים אמנדה פרז היא בעלים?`

    ![Data](../../../../../translated_images/he/09-ask-in-playground.a1b93794f78fa676.webp)

תקבל את אותה תגובה (או דומה) - אבל תקבל גם מידע נוסף שתוכל להשתמש בו כדי להבין את האיכות, העלות והביצועים של אפליקציית הסוכנים שלך. לדוגמה:

1. שים לב שהתשובה מצטטת קבצי נתונים ששימשו ל"ייסוד" התגובה
1. עמד מעל אחד התוויות של הקבצים - האם הנתונים תואמים את השאילתה ואת התגובה שמוצגת?

אתה גם רואה שורת _סטטיסטיקות_ מתחת לתגובה.

1. העבר את הסמן מעל כל מדד - למשל Safety. תראה משהו כזה
1. האם הדירוג שניתן תואם את האינטואיציה שלך לגבי רמת הבטיחות של התגובה?

      ![Data](../../../../../translated_images/he/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. תצפית מובנית

תצפית היא לגבי הכלת כלי מדידה ביישום שלך שמפיקים נתונים שניתן להשתמש בהם להבנה, ניפוי שגיאות, ואופטימיזציה של פעולותיו. כדי לקבל מושג על זה:

1. לחץ על כפתור `View Run Info` - אמור להופיע תצוגה זו. זו דוגמה ל[מעקב סוכן](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) בפעולה. _אפשר גם לקבל תצוגה זו ע"י לחיצה על Thread Logs בתפריט העליון._

   - קבל מושג על שלבי הריצה והכלים בהם השתמש הסוכן
   - הבן את סך כל מספר הטוקנים (לעומת שימוש בטוקנים בתגובה)
   - הבן את זמן ההשהייה והיכן מושקע הזמן בביצוע

      ![Agent](../../../../../translated_images/he/10-view-run-info.b20ebd75fef6a1cc.webp)

1. לחץ על לשונית `Metadata` כדי לראות מאפיינים נוספים של הריצה, שיכולים לספק הקשר שימושי לניפוי שגיאות בעתיד.

      ![Agent](../../../../../translated_images/he/11-view-run-info-metadata.7966986122c7c2df.webp)


1. לחץ על לשונית `Evaluations` כדי לראות הערכות אוטומטיות שנעשו על תגובת הסוכן. אלה כוללות הערכות בטיחות (למשל, Self-harm) והערכות סוכן ספציפיות (למשל, פתרון כוונות, שמירת משימה).

      ![Agent](../../../../../translated_images/he/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. לבסוף, לחץ על לשונית `Monitoring` בתפריט הצדדי.

      - בחר בלשונית `Resource usage` בדף שמוצג - וצפה במדדים.
      - עקוב אחרי שימוש במשאבים מבחינת עלויות (טוקנים) ועומס (בקשות).
      - עקוב אחרי השהיית היישום עד הבייט הראשון (עיבוד כניסה) והבייט האחרון (פלט).

      ![Agent](../../../../../translated_images/he/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. משתני סביבה

עד כה, עברנו על הפריסה בדפדפן - ואישרנו שהתשתית הוקמה והיישום פעיל. אבל כדי לעבוד עם הקוד של היישום _קודם כל_, אנחנו צריכים להגדיר את סביבת הפיתוח המקומית עם המשתנים הרלוונטיים הדרושים לעבודה עם המשאבים האלה. שימוש ב-`azd` עושה זאת פשוט.

1. Azure Developer CLI [משתמש במשתני סביבה](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) לאחסון וניהול הגדרות תצורה לפריסות יישומים.

1. משתני הסביבה נשמרים בתיקייה `.azure/<env-name>/.env` - זו סוגרת אותם לסביבת `env-name` ששומשה בפריסה ועוזרת לבודד סביבות בין יעדי פריסה שונים באותו מאגר.

1. משתני סביבה נטענים אוטומטית על ידי פקודות `azd` בכל פעם שמבצעים פקודה מסוימת (למשל, `azd up`). שים לב ש-`azd` לא קורא אוטומטית משתני סביבה ברמת מערכת ההפעלה (למשל, שהוגדרו בשורת הפקודה) - במקום זאת השתמש ב-`azd set env` ו-`azd get env` להעברת מידע בתוך סקריפטים.


בוא ננסה כמה פקודות:

1. קבל את כל משתני הסביבה שהוגדרו ל-`azd` בסביבה זו:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      תראה משהו כזה:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. קבל ערך ספציפי - למשל, אני רוצה לדעת אם הוגדר הערך `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      תראה משהו כזה - הוא לא הוגדר כברירת מחדל!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. הגדר משתנה סביבה חדש ל-`azd`. כאן אנו מעדכנים את שם מודל הסוכן. _שים לב: כל שינוי שתבצע ישתקף מיידית בקובץ `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      עכשיו, אנחנו אמורים לראות שהערך הוגדר:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. שים לב שכמה משאבים הם מתמשכים (למשל, פריסות מודלים) וידרשו יותר מפעם אחת של `azd up` כדי לאלץ פריסה מחדש. בוא ננסה לשבור את הפריסה המקורית ולפרוס מחדש עם משתני סביבה ששונו.

1. **רענון** אם פרסת בעבר תשתית באמצעות תבנית azd - תוכל _לרענן_ את מצב משתני הסביבה המקומיים שלך בהתאם למצב הנוכחי של הפריסה ב-Azure באמצעות הפקודה הזו:

      ```bash title="" linenums="0"
      azd env refresh
      ```

זו דרך חזקה ל_לסנכרן_ משתני סביבה בין שני סביבות פיתוח מקומיות או יותר (למשל, צוות עם מספר מפתחים) – מה שמאפשר לתשתית שהופעלה לשמש כעובדה בסיסית למצב משתני הסביבה. חברי הצוות פשוט _מרעננים_ את המשתנים כדי לחזור לסינכרון.

---

## 9. כל הכבוד 🏆

רק סיימת תהליך עבודה מקצה לקצה שבו:

- [X] בחרת את תבנית AZD שברצונך להשתמש בה
- [X] הפעלת את התבנית באמצעות GitHub Codespaces
- [X] פרסת את התבנית ואישרת שהיא עובדת

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש לראות את המסמך המקורי בשפתו המקורית כמקור הסמכות. עבור מידע קריטי, מומלץ להיעזר בתרגום מקצועי מאת אדם. אנו לא נושאים באחריות לכל אי-הבנה או פרשנות שגויה הנובעת מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->