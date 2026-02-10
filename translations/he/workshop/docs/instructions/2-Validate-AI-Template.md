# 2. לאמת תבנית

!!! tip "בסוף המודול הזה תהיה מסוגל"

    - [ ] לנתח את ארכיטקטורת פתרון ה-AI
    - [ ] להבין את זרימת העבודה של פריסת AZD
    - [ ] להשתמש ב-GitHub Copilot לקבלת עזרה בשימוש ב-AZD
    - [ ] **מעבדה 2:** פריסה ואימות של תבנית סוכני AI

---


## 1. מבוא

ה-[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) או `azd` הוא כלי שורת פקודה בקוד פתוח שמפשט את זרימת העבודה של המפתח בעת בניית ופריסת יישומים ל-Azure. 

[תבניות AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) הן מאגרים סטנדרטיים הכוללים קוד דוגמה של יישומים, נכסי _תשתית כקוד_ וקבצי תצורה של `azd` עבור ארכיטקטורת פתרון מלוכדת. הטמעה של התשתית הופכת לפשוטה כמו פקודת `azd provision` - בעוד שפקודת `azd up` מאפשרת להטמיע תשתית **ולפרוס את היישום שלך** בבת אחת!

כתוצאה מכך, התחלת תהליך הפיתוח של היישום שלך יכולה להיות פשוטה כמו מציאת תבנית _AZD Starter_ המתאימה ביותר לצרכים שלך ביישום ובתשתית - ואז התאמת המאגרים לדרישות התרחיש שלך.

לפני שנתחיל, בוא נוודא שיש לך את Azure Developer CLI מותקן.

1. פתח מסוף ב-VS Code והקלד את הפקודה הבאה:

      ```bash title="" linenums="0"
      azd version
      ```

1. אתה אמור לראות משהו כזה!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**כעת אתה מוכן לבחור ולפרוס תבנית באמצעות azd**

---

## 2. בחירת תבנית

פלטפורמת Microsoft Foundry מגיעה עם [סט של תבניות AZD מומלצות](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) שמכסה תרחישי פתרון פופולריים כמו _אוטומציה של זרימת עבודה עם רב-סוכנים_ ו-_עיבוד תוכן רב-מודאלי_. ניתן גם לגלות את התבניות האלו בביקור ב- Microsoft Foundry portal.

1. בקר ב-[https://ai.azure.com/templates](https://ai.azure.com/templates)
1. התחבר לפורטל Microsoft Foundry כאשר תתבקש - תראה משהו כזה.

![Pick](../../../../../translated_images/he/01-pick-template.60d2d5fff5ebc374.webp)


אפשרויות ה-**Basic** הן תבניות ההתחלה שלך:

1. [ ] [התחל עם AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) שמפרסמת יישום צ'אט בסיסי _עם המידע שלך_ ל-Azure Container Apps. השתמש בזה כדי לחקור תרחיש בסיסי של צ'אטבוט AI.
1. [X] [התחל עם סוכני AI](https://github.com/Azure-Samples/get-started-with-ai-agents) שמפרסמת גם סוכן AI סטנדרטי (עם סוכני Foundry). השתמש בזה כדי להכיר פתרונות AI מבוססי סוכנים הכוללים כלים ודגמים.

בקר בקישור השני בלשונית דפדפן חדשה (או לחץ על `Open in GitHub` עבור הכרטיס הרלוונטי). אתה אמור לראות את המאגר של תבנית AZD זו. קח רגע לסקור את README. ארכיטקטורת היישום נראית כך:

![Arch](../../../../../translated_images/he/architecture.8cec470ec15c65c7.webp)

---

## 3. הפעלת התבנית

בוא ננסה לפרוס את התבנית הזו ולוודא שהיא תקפה. נעקוב אחר ההנחיות בסעיף [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. לחץ [בקישור הזה](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - אשר את הפעולה המוגדרת ל־`Create codespace`
1. זה יפתח לשונית דפדפן חדשה - המתן עד ש-GitHub Codespaces יטען לחלוטין
1. פתח את מסוף ה-VS Code ב-Codespaces - הקלד את הפקודה הבאה:

   ```bash title="" linenums="0"
   azd up
   ```

השלים את השלבים בזרימת העבודה שזו תפעיל:

1. תתבקש להתחבר ל-Azure - פעל לפי ההוראות לאימות
1. הזן שם סביבה ייחודי עבורך - לדוגמה, השתמשתי ב-`nitya-mshack-azd`
1. זה ייצור תיקייה `.azure/` - תראה תיקיית משנה עם שם הסביבה
1. תתבקש לבחור שם מנוי - בחר את ברירת המחדל
1. תתבקש להזין מיקום - השתמש ב־`East US 2`

כעת המתן לסיום ההטמעה. **זה לוקח 10-15 דקות**

1. כשזה יסתיים, הטרמינל שלך יציג הודעת הצלחה (SUCCESS) כמו זו:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. פורטל ה-Azure שלך יכיל כעת קבוצת משאבים מוטמעת עם שם הסביבה:

      ![Infra](../../../../../translated_images/he/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **כעת אתה מוכן לאמת את תשתית היישום והמפרוס.**

---

## 4. אימות התבנית

1. עבור אל דף קבוצות המשאבים ב-Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - התחבר אם תתבקש
1. לחץ על קבוצת משאבים עבור שם הסביבה שלך - תראה את הדף שלמעלה

      - לחץ על משאב Azure Container Apps
      - לחץ על כתובת ה-URL של היישום בקטגוריית _Essentials_ (בחלק העליון מימין)

1. אמור להופיע לך ממשק משתמש של יישום צד קדמי שמתארח כך:

   ![App](../../../../../translated_images/he/03-test-application.471910da12c3038e.webp)

1. נסה לשאול כמה [שאלות לדוגמה](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. שאל: ```מהי בירת צרפת?``` 
      1. שאל: ```מה היא האוהל הטוב ביותר מתחת ל-200 דולר לשני אנשים, ואילו תכונות יש לו?```

1. אמורים להגיע תשובות דומות לאלו שמוצגות למטה. _אבל איך זה עובד?_

      ![App](../../../../../translated_images/he/03-test-question.521c1e863cbaddb6.webp)

---

## 5. אימות הסוכן

יישום Azure Container מפרסמת נקודת קצה שמתחברת לסוכן AI שהוטמע בפרויקט Microsoft Foundry עבור התבנית הזו. בוא נסתכל מה זה אומר.

1. חזור לעמוד _Overview_ בפורטל Azure עבור קבוצת המשאבים שלך

1. לחץ על משאב `Microsoft Foundry` ברשימה זו

1. אמור לראות זאת. לחץ על כפתור `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/he/04-view-foundry-project.fb94ca41803f28f3.webp)

1. תראה את עמוד הפרויקט Foundry עבור יישום ה-AI שלך
   ![Project](../../../../../translated_images/he/05-visit-foundry-portal.d734e98135892d7e.webp)

1. לחץ על `Agents` - תראה את הסוכן ברירת המחדל שהוטמע בפרויקט שלך
   ![Agents](../../../../../translated_images/he/06-visit-agents.bccb263f77b00a09.webp)

1. בחר אותו - ותראה את פרטי הסוכן. שים לב לפרטים הבאים:

      - הסוכן משתמש בחיפוש קבצים כברירת מחדל (תמיד)
      - בפרטי `Knowledge` של הסוכן מצוין כי הועלו 32 קבצים (לצורך חיפוש קבצים)
      ![Agents](../../../../../translated_images/he/07-view-agent-details.0e049f37f61eae62.webp)

1. עבור לאפשרות `Data+indexes` בתפריט השמאלי ולחץ לפרטים. 

      - אמורות להופיע 32 קבצי נתונים שהועלו לידע.
      - אלה יתאימו ל-12 קבצי לקוחות ו-20 קבצי מוצרים בתיקייה `src/files` 
      ![Data](../../../../../translated_images/he/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**אמתת את פעולת הסוכן!** 

1. התגובות של הסוכן מבוססות על הידע בקבצים אלו. 
1. כעת אפשר לשאול שאלות הקשורות לנתונים ולקבל תגובות מבוססות.
1. לדוגמה: הקובץ `customer_info_10.json` מתאר את 3 הרכישות שביצעה "Amanda Perez"

חזור ללשונית הדפדפן עם נקודת הקצה של Container App ושאל: `אילו מוצרים בבעלותה של Amanda Perez?`. אמור להופיע משהו כזה:

![Data](../../../../../translated_images/he/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. מגרש הסוכן

בוא נבנה קצת אינטואיציה נוספת לגבי היכולות של Microsoft Foundry, על ידי הפעלת הסוכן במגרש הסוכנים (Agents Playground). 

1. חזור לדף `Agents` ב-Microsoft Foundry - בחר את הסוכן ברירת המחדל
1. לחץ על האופציה `Try in Playground` - תקבל ממשק מגרש משחקים כזה
1. שאל את אותה השאלה: `אילו מוצרים בבעלותה של Amanda Perez?`

    ![Data](../../../../../translated_images/he/09-ask-in-playground.a1b93794f78fa676.webp)

תקבל את אותה תגובה (או דומה) - אך תקבל גם מידע נוסף שתוכל להשתמש בו כדי להבין את האיכות, העלות והביצועים של יישום הסוכן שלך. לדוגמה:

1. שים לב שהתשובה מציינת את קבצי הנתונים בהם השתמשה "להנחת" התגובה
1. העבר את העכבר מעל אחת התוויות האלו - האם הנתונים תואמים את השאילתה שלך ואת התגובה המוצגת?

אתה גם רואה שורת _סטטיסטיקות_ מתחת לתגובה. 

1. העבר את העכבר מעל מדד כלשהו - לדוגמה, Safety. תראה משהו כזה
1. האם דירוג ההערכה תואם את האינטואיציה שלך לגבי רמת הבטיחות של התגובה?

      ![Data](../../../../../translated_images/he/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. נראות מובנית

נראות היא על כלים שמכשירים את היישום שלך ליצירת נתונים שניתן להשתמש בהם כדי להבין, לתקן ולייעל את פעולתו. כדי לקבל מושג על כך:

1. לחץ על כפתור `View Run Info` - אמור להופיע לך תצוגה כזו. זו דוגמה ל-[Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) בפעולה. _ניתן גם לגשת לתצוגה זו על ידי לחיצה על Thread Logs בתפריט הראשי_.

   - קבל מושג על שלבי הריצה והכלים בהם השתמש הסוכן
   - הבן את סך כל כמות הטוקנים (לעומת שימוש בטוקנים לפלט) עבור התגובה
   - הבן את ההשהיה ומתי מתבזבז זמן בביצוע

      ![Agent](../../../../../translated_images/he/10-view-run-info.b20ebd75fef6a1cc.webp)

1. לחץ על לשונית `Metadata` כדי לראות תכונות נוספות של הריצה שעשויות לספק הקשר שימושי לפתרון בעיות בעתיד.   

      ![Agent](../../../../../translated_images/he/11-view-run-info-metadata.7966986122c7c2df.webp)


1. לחץ על לשונית `Evaluations` כדי לראות הערכות אוטומטיות שנעשו על תגובת הסוכן. אלה כוללות הערכות בטיחות (כמו Self-harm) והערכות ספציפיות לסוכן (כמו פתרון כוונה, עמידה במשימה).

      ![Agent](../../../../../translated_images/he/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. ולבסוף, לחץ על לשונית `Monitoring` בתפריט הצדדי.

      - בחר בקטגוריית `Resource usage` בעמוד שמוצג - וצפה במדדים.
      - עקוב אחר שימוש היישום במונחים של עלויות (טוקנים) ועומס (בקשות).
      - עקוב אחר השהיית היישום לקבלת הבייט הראשון (עיבוד קלט) והבייט האחרון (פלט).

      ![Agent](../../../../../translated_images/he/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. משתני סביבה

עד כה עברנו על הפריסה בדפדפן - ואישרנו שהתשתית שלנו מוטמעת והיישום פעיל. אך כדי לעבוד עם קוד היישום _בראשונה_, עלינו להגדיר את סביבת הפיתוח המקומית שלנו עם המשתנים הרלוונטיים הנדרשים לעבודה עם משאבים אלו. השימוש ב־`azd` עושה זאת בקלות.

1. Azure Developer CLI [משתמש במשתני סביבה](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) לאחסון וניהול הגדרות תצורה עבור פריסות היישום.

1. משתני סביבה מאוחסנים ב- `.azure/<env-name>/.env` - זה מצמצם אותם לסביבת `env-name` שהשתמשת בה בעת הפריסה ועוזר לך לבודד סביבות בין יעדי פריסה שונים באותו מאגר.

1. משתני סביבה נטענים אוטומטית על ידי פקודת `azd` בכל פעם שהיא מבצעת פקודה ספציפית (למשל, `azd up`). שים לב ש־`azd` לא קורא אוטומטית משתני סביבה ברמת מערכת ההפעלה (לדוגמה, מוגדרים ב-shell) - במקום זאת יש להשתמש בפקודות `azd set env` ו-`azd get env` להעברת המידע בתוך סקריפטים.


בוא ננסה כמה פקודות:

1. קבל את כל משתני הסביבה שהוגדרו עבור `azd` בסביבה זו:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      אתה רואה משהו כזה:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. קבל ערך מסוים - לדוגמה, אני רוצה לבדוק אם הגדרנו את הערך `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      אתה רואה משהו כזה - לא הוגדר כברירת מחדל!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. הגדר משתנה סביבה חדש ל־`azd`. כאן, אנו מעדכנים את שם דגם הסוכן. _הערה: כל שינוי שיתבצע ישתקף מיידית בקובץ `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      כעת, ערך זה צריך להיות מוגדר:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. שים לב שחלק מהמשאבים הם מתמשכים (לדוגמה, פריסות דגמים) ויידרשו יותר מפקודת `azd up` כדי לאלץ פריסה מחדש. בוא ננסה לפרק את הפריסה המקורית ולפרוס מחדש עם משתני סביבה ששונו.

1. **רענן** אם פרסת בעבר תשתית באמצעות תבנית azd - תוכל _לרענן_ את מצב משתני הסביבה המקומיים שלך בהתבסס על מצב הפריסה הנוכחי ב-Azure באמצעות הפקודה הבאה:

      ```bash title="" linenums="0"
      azd env refresh
      ```

זו דרך עוצמתית ל_סנכרן_ משתני סביבה בין שני סביבות פיתוח מקומיות או יותר (למשל, צוות עם מספר מפתחים) - מאפשרת לתשתית המופעלת לשמש כאמת היסוד למצב משתנה הסביבה. חברי הצוות פשוט _מרעננים_ את המשתנים כדי לחזור לסנכרון.

---

## 9. ברכות 🏆

סיימת זה עתה תהליך מקצה-לקצה שבו:

- [X] בחרת את תבנית AZD שברצונך להשתמש בה
- [X] השקת את התבנית עם GitHub Codespaces 
- [X] פרסת את התבנית ואימתת שהיא פועלת

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לדעת כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפתו הטבעית צריך להיחשב כמקור הסמכות. למידע קריטי מומלץ לבצע תרגום מקצועי על ידי אדם. אנו לא נושאים באחריות לכל אי-הבנה או פרשנות שגויה הנובעים משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->