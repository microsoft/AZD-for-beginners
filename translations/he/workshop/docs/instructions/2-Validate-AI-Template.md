# 2. אימות תבנית

> אומת מול `azd 1.27.1` ביולי 2026.

!!! tip "בסיום מודול זה תוכל ל־"

    - [ ] לנתח את ארכיטקטורת הפתרון של ה-AI
    - [ ] להבין את זרימת העבודה של פריסת AZD
    - [ ] להשתמש ב-GitHub Copilot לקבלת עזרה בשימוש ב-AZD
    - [ ] **מעבדה 2:** לפרוס ולאמת את תבנית סוכני ה-AI

---


## 1. מבוא

ה-[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) או `azd` הוא כלי שורת פקודה קוד פתוח שמייעל את זרימת העבודה של המפתחים בעת בנייה ופריסה של יישומים ב-Azure.

[תבניות AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) הן מאגרי קוד סטנדרטיים שכוללים קוד לדוגמה של יישום, נכסי _תשתית-כקוד_, וקובצי הגדרות של `azd` לארכיטקטורת פתרונות מגובשת. מתן התשתית הופך לפשוט עם הפקודה `azd provision` - בעוד ש־`azd up` מאפשרת לך לפרוס את התשתית **ומערכת** את היישום שלך בבת אחת!

כתוצאה מכך, התחלת פיתוח היישום שלך יכולה להיות פשוטה כמו מציאת תבנית _AZD Starter_ שתתאים לקרוב ביותר לצרכי היישום והתשתית שלך - ואז התאמת המאגר בהתאם לדרישות התרחיש שלך.

לפני שנתחיל, וודא שיש לך את Azure Developer CLI מותקן.

1. פתח מסוף ב-VS Code והקלד את הפקודה הבאה:

      ```bash title="" linenums="0"
      azd version
      ```

1. אתה אמור לראות משהו כזה!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**כעת אתה מוכן לבחור ולפרוס תבנית עם azd**

---

## 2. בחירת תבנית

פלטפורמת Microsoft Foundry מגיעה עם [מערכת תבניות AZD מומלצות](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) שמכסה תרחישי פתרונות פופולריים כמו _אוטומציה של זרימת עבודה רב-סוכנית_ ועיבוד תוכן רב-מודלי. ניתן גם לגלות תבניות אלה באמצעות ביקור בפורטל Microsoft Foundry.

1. בקר ב-[https://ai.azure.com/templates](https://ai.azure.com/templates)
1. היכנס לפורטל Microsoft Foundry כאשר תתבקש - תראה משהו כמו זה.

![Pick](../../../../../translated_images/he/01-pick-template.60d2d5fff5ebc374.webp)


אפשרויות **Basic** הן תבניות המתחילים שלך:

1. [ ] [התחל עם AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) שמפרוס יישום צ'אט בסיסי _עם הנתונים שלך_ ל-Azure Container Apps. השתמש בזה כדי לחקור תרחיש בסיסי של צ'אטבוט AI.
1. [X] [התחל עם AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) שמפרוס גם סוכן AI סטנדרטי (עם Foundry Agents). השתמש בזה כדי להכיר פתרונות AI אייג'נטיים הכוללים כלים ודגמים.

בקר בקישור השני בכרטיסייה חדשה בדפדפן (או לחץ על `Open in GitHub` עבור הכרטיס הקשור). אתה אמור לראות את מאגר התבנית הזו. קח דקה לחקור את ה-README. ארכיטקטורת היישום נראית כך:

![Arch](../../../../../translated_images/he/architecture.8cec470ec15c65c7.webp)

---

## 3. הפעלת התבנית

בוא ננסה לפרוס את התבנית הזו ונוודא שהיא תקינה. נעקוב אחר ההנחיות בסעיף [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. בחר סביבת עבודה עבור מאגר התבנית:

      - **GitHub Codespaces**: לחץ על [הקישור הזה](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ואשר `Create codespace`
      - **שכפול מקומי או מכולת פיתוח**: שכפל את `Azure-Samples/get-started-with-ai-agents` ופתח ב-VS Code

1. המתן עד שמסוף ה-VS Code יהיה מוכן, ואז הקלד את הפקודה הבאה:

   ```bash title="" linenums="0"
   azd up
   ```

השלם את שלבי זרימת העבודה שהפקודה תפעיל:

1. תתבקש להיכנס ל-Azure - פעל לפי ההוראות לאימות
1. הזן שם סביבת עבודה ייחודי עבורך - למשל, השתמשתי ב־`nitya-mshack-azd`
1. זה ייצור תיקייה `.azure/` - תראה תיקיית משנה עם שם הסביבה
1. תתבקש לבחור שם מנוי - בחר את ברירת המחדל
1. תתבקש לספק מיקום - השתמש ב־`East US 2`

כעת, המתן להשלמת ההקצאה. **זה לוקח 10-15 דקות**

1. בעת הסיום, הקונסולה שלך תציג הודעת SUCCESS כזו:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. פורטל Azure שלך יציג כעת קבוצת משאבים מפורסת עם שם הסביבה:

      ![Infra](../../../../../translated_images/he/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **כעת אתה מוכן לאמת את התשתית והיישום שהופצו**.

---

## 4. אימות התבנית

1. בקר בעמוד קבוצות המשאבים ב[Azure Portal](https://portal.azure.com/#browse/resourcegroups) - היכנס כאשר תתבקש
1. לחץ על קבוצת המשאבים של סביבת העבודה שלך - תראה את העמוד למעלה

      - לחץ על משאב Azure Container Apps
      - לחץ על כתובת היישום בקטע _Essentials_ (בחלק העליון ימינה)

1. אמור לראות ממשק משתמש של יישום מתארח כזה:

   ![App](../../../../../translated_images/he/03-test-application.471910da12c3038e.webp)

1. נסה לשאול כמה [שאלות לדוגמה](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. שאל: ```מהי בירת צרפת?``` 
      1. שאל: ```מה האוהל הטוב ביותר מתחת ל-200$ לשני אנשים, ואילו תכונות יש לו?```

1. אמור לקבל תשובות דומות לאלו המוצגות מטה. _אבל איך זה עובד?_

      ![App](../../../../../translated_images/he/03-test-question.521c1e863cbaddb6.webp)

---

## 5. אימות הסוכן

Azure Container App מפעיל נקודת קצה שמתחברת לסוכן ה-AI שהוקצה בפרויקט Microsoft Foundry עבור תבנית זו. בוא נבחן למה הכוונה.

1. חזור לעמוד _Overview_ של קבוצת המשאבים שלך ב-Azure Portal

1. לחץ על המשאב `Microsoft Foundry` ברשימה זו

1. אמור לראות זאת. לחץ על כפתור `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/he/04-view-foundry-project.fb94ca41803f28f3.webp)

1. אמור לראות את דף פרויקט Foundry של יישום ה-AI שלך
   ![Project](../../../../../translated_images/he/05-visit-foundry-portal.d734e98135892d7e.webp)

1. לחץ על `Agents` - תראה את הסוכן הסטנדרטי שהוקצה בפרויקט שלך
   ![Agents](../../../../../translated_images/he/06-visit-agents.bccb263f77b00a09.webp)

1. בחר אותו - ותראה את פרטי הסוכן. שים לב ל:

      - הסוכן משתמש בחיפוש בקבצים כברירת מחדל (תמיד)
      - בסוכן, `Knowledge` מציין שיש 32 קבצים שהועלו (לחיפוש בקבצים)
      ![Agents](../../../../../translated_images/he/07-view-agent-details.0e049f37f61eae62.webp)

1. חפש את האפשרות `Data+indexes` בתפריט השמאלי ולחץ לפרטים.

      - אמור לראות את 32 קבצי הנתונים שהועלו עבור הידע.
      - אלה תואמים ל-12 קבצי לקוח ו-20 קבצי מוצר תחת `src/files`
      ![Data](../../../../../translated_images/he/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**אימות פעולת הסוכן הושלם!**

1. התגובות של הסוכן מבוססות על הידע שבקבצים אלו.
1. כעת ניתן לשאול שאלות הקשורות לנתונים אלו ולקבל תגובות מבוססות.
1. דוגמה: `customer_info_10.json` מתאר את 3 הרכישות שביצעה "Amanda Perez"

חזור ללשונית הדפדפן עם נקודת הקצה של Container App ושאל: `אילו מוצרים בבעלות Amanda Perez?`. אמור לראות משהו כזה:

![Data](../../../../../translated_images/he/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. חצר המשחקים של הסוכן

בוא נבנה קצת אינטואיציה נוספת לגבי היכולות של Microsoft Foundry, על ידי לקיחת הסוכן לסיבוב ב-Agents Playground.

1. חזור לדף `Agents` ב-Microsoft Foundry - בחר את הסוכן הסטנדרטי
1. לחץ על האפשרות `Try in Playground` - תקבל ממשק UI של Playground כזה
1. שאל את אותה השאלה: `אילו מוצרים בבעלות Amanda Perez?`

    ![Data](../../../../../translated_images/he/09-ask-in-playground.a1b93794f78fa676.webp)

תקבל את אותה (או דומה) תגובה - אבל בנוסף גם מידע נוסף שתוכל להשתמש בו כדי להבין את האיכות, העלות והביצועים של היישום האייג'נטי שלך. לדוגמה:

1. שים לב שהתשובה מציינת קבצי נתונים המשמשים ל"עיגון" התגובה
1. העבר את הסמן מעל כל אחד מתוויות הקבצים האלה - האם הנתונים תואמים את השאילתה והתגובה המוצגת?

בנוסף תראה שורת _סטטיסטיקות_ מתחת לתגובה.

1. העבר את הסמן מעל כל מדד - למשל, Safety. תראה משהו כזה
1. האם ההערכה תואמת את התחושה שלך לגבי רמת הבטיחות של התגובה?

      ![Data](../../../../../translated_images/he/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. ניטור מובנה

ניטור משמעותו להצטייד את היישום שלך בכלים ליצירת נתונים שניתן להשתמש בהם להבנה, איתור באגים ואופטימיזציה. כדי לקבל מושג על כך:

1. לחץ על כפתור `View Run Info` - אמור לראות את התצוגה הזו. זהו דוגמא ל[מעקב אחר סוכן](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) בפעולה. _אפשר גם להשיג תצוגה זו על ידי לחיצה על Thread Logs בתפריט העליון_.

   - קבל מושג לגבי שלבי הריצה והכלים שהופעלו על ידי הסוכן
   - הבן את ספירת הטוקנים הכוללת (לעומת השימוש בטוקנים לפלט) עבור התגובה
   - הבן את האיחור והיכן מושקע הזמן בביצוע

      ![Agent](../../../../../translated_images/he/10-view-run-info.b20ebd75fef6a1cc.webp)

1. לחץ על לשונית `Metadata` כדי לראות מאפיינים נוספים של הריצה, שעשויים לספק הקשר שימושי לאיתור תקלות בעתיד.

      ![Agent](../../../../../translated_images/he/11-view-run-info-metadata.7966986122c7c2df.webp)


1. לחץ על לשונית `Evaluations` כדי לראות הערכות אוטומטיות שנעשו על תגובת הסוכן. אלו כוללות הערכות בטיחות (למשל, Self-harm) והערכות ספציפיות לסוכן (למשל, פתרון כוונה, עמידה במשימה).

      ![Agent](../../../../../translated_images/he/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. לבסוף, לחץ על לשונית `Monitoring` בתפריט הצדדי.

      - בחר בלשונית `Resource usage` בדף המוצג - וראה את המדדים.
      - עקוב אחרי שימוש היישום במונחים של עלויות (טוקנים) ועומס (בקשות).
      - עקוב אחרי השיהוי ממתן הקלט הראשון (עיבוד קלט) ועד הפלט האחרון.

      ![Agent](../../../../../translated_images/he/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. משתני סביבה

עד כה, עברנו את תהליך הפריסה בדפדפן - ואימתנו שהתשתית שלנו מופעלת והיישום פעיל. אבל כדי לעבוד עם היישום _בקוד תחילה_, עלינו להגדיר את סביבת הפיתוח המקומית שלנו עם המשתנים הרלוונטיים הדרושים לעבודה עם המשאבים האלה. השימוש ב־`azd` מקל על כך.

1. ה-Azure Developer CLI [משתמש במשתני סביבה](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) לאחסון וניהול הגדרות פריסה של היישומים.

1. משתני הסביבה מאוחסנים ב־`.azure/<env-name>/.env` - זה מקשר אותם לסביבת ה־`env-name` שבה נעשה שימוש במהלך הפריסה ועוזר לבודד סביבות בין יעדי פריסה שונים באותו מאגר.

1. משתני סביבה נטענים אוטומטית על ידי פקודת `azd` כאשר היא מריצה פקודה ספציפית (למשל, `azd up`). שים לב ש־`azd` אינו קורא אוטומטית משתני סביבה ברמת מערכת ההפעלה (למשל, שהוגדרו בגלישה) - במקום זאת השתמש ב־`azd set env` ו־`azd get env` להעברת מידע בתוך סקריפטים.


בוא ננסה כמה פקודות:

1. קבל את כל משתני הסביבה שהוגדרו ל־`azd` בסביבה זו:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      אתה רואה משהו כזה:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. קבל ערך ספציפי - למשל, אני רוצה לדעת אם הגדרנו את הערך `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      אתה רואה משהו כזה - לא הוגדר כברירת מחדל!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. הגדר משתנה סביבה חדש עבור `azd`. כאן, אנו מעדכנים את שם דגם הסוכן. _הערה: כל שינוי שתבצע ישתקף מיידית בקובץ `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      עכשיו, אמור למצוא שהערך הוגדר:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. שים לב שחלק מהמשאבים הם מתמידים (למשל, פריסות דגם) וידרשו יותר מ־`azd up` פשוט כדי לאלץ פריסה מחדש. בוא ננסה לפרק את הפריסה המקורית ולפרוס מחדש עם משתני סביבה ששונו.

1. **רענן** אם בעבר פרסת תשתית עם תבנית azd - תוכל _לרענן_ את מצב משתני הסביבה המקומיים שלך בהתבסס על המצב הנוכחי של הפריסה ב-Azure באמצעות פקודה זו:

      ```bash title="" linenums="0"
      azd env refresh
      ```


זו דרך חזקה ל_סנכרן_ משתני סביבה בין שני סביבות פיתוח מקומיות או יותר (למשל, צוות עם מספר מפתחים) - ומאפשרת לתשתית המופעלת לשמש כאמת הבסיס למצב משתנה הסביבה. חברי הצוות פשוט _מרעננים_ את המשתנים כדי לחזור לסנכרון.

---

## 9. מזל טוב 🏆

סיימת זה עתה תהליך עבודה מקצה לקצה שבו:

- [X] בחרת את תבנית AZD שברצונך להשתמש בה
- [X] פתחת את התבנית בסביבת פיתוח נתמכת
- [X] פרסת את התבנית ואמתת שהיא עובדת

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->