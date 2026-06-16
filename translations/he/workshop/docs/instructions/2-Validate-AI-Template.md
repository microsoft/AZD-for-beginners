# 2. אימות תבנית

> אומת עם `azd 1.25.6` ביוני 2026.

!!! tip "בסוף המודול הזה תוכל ל־"

    - [ ] לנתח את ארכיטקטורת הפתרון AI
    - [ ] להבין את זרימת העבודה של פריסת AZD
    - [ ] להשתמש ב־GitHub Copilot לקבלת עזרה בשימוש ב־AZD
    - [ ] **מעבדה 2:** לפרוס ולאמת את תבנית הסוכנים AI

---

## 1. מבוא

ה־[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) או `azd` הוא כלי שורת פקודה קוד פתוח שמייעל את זרימת העבודה של המפתח בעת בנייה ופריסה של אפליקציות ב־Azure.

[תבניות AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) הן מאגרי קוד סטנדרטיים הכוללים דוגמאות קוד לאפליקציות, נכסי _תשתית כקוד_, וקבצי תצורה של `azd` לארכיטקטורת פתרון משולבת. הפעלת התשתית הופכת לפשוטה כמו פקודת `azd provision` - בעוד ש־`azd up` מאפשר לך לפרוס תשתית **וגם** לפרוס את האפליקציה שלך בפעם אחת!

כתוצאה מכך, התחלת תהליך פיתוח האפליקציה שלך יכולה להיות פשוטה כמו מציאת תבנית _AZD Starter_ המתאימה ביותר לצרכי האפליקציה והתשתית שלך - ואז להתאים את המאגר לפי דרישות התרחיש שלך.

לפני שנתחיל, נוודא שיש לך את Azure Developer CLI מותקן.

1. פתח מסוף ב־VS Code והקלד את הפקודה הזו:

      ```bash title="" linenums="0"
      azd version
      ```

1. אתה אמור לראות משהו כזה!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**כעת אתה מוכן לבחור ולפרוס תבנית עם azd**

---

## 2. בחירת תבנית

פלטפורמת Microsoft Foundry מגיעה עם [מערך תבניות AZD מומלצות](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) שמכסה תרחישי פתרון פופולריים כמו _אוטומציה של זרימת עבודה רב-סוכנים_ ו־_עיבוד תוכן רב־מודאלי_. ניתן גם לגלות תבניות אלו דרך פורטל Microsoft Foundry.

1. בקר בכתובת [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. היכנס לפורטל Microsoft Foundry כשמתבקש - תראה משהו כזה.

![Pick](../../../../../translated_images/he/01-pick-template.60d2d5fff5ebc374.webp)


האפשרויות **Basic** הן תבניות הפתיחה שלך:

1. [ ] [התחל עם AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) שמפריסה אפליקציית צ’אט בסיסית _עם הנתונים שלך_ ל־Azure Container Apps. השתמש בזה כדי לבדוק תרחיש צ’אטבוט AI בסיסי.
1. [X] [התחל עם AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) שמפריסה גם סוכן AI סטנדרטי (עם Foundry Agents). השתמש בזה כדי להכיר פתרונות AI סוכניים הכוללים כלים ודגמים.

בקר בקישור השני בלשונית דפדפן חדשה (או לחץ על `Open in GitHub` בכרטיס המתאים). אמור להופיע מאגר התבנית הזה. קח דקה להתרשם מקובץ ה־README. ארכיטקטורת האפליקציה נראית כך:

![Arch](../../../../../translated_images/he/architecture.8cec470ec15c65c7.webp)

---

## 3. הפעלת תבנית

ננסה לפרוס את התבנית הזו ונוודא שהיא תקינה. נפעל לפי ההנחיות בסעיף [התחלה](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. בחר סביבת עבודה למאגר התבנית:

      - **GitHub Codespaces**: לחץ על [קישור זה](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ואשר `Create codespace`
      - **שכפול מקומי או מיכל פיתוח**: שכפל את `Azure-Samples/get-started-with-ai-agents` ופתח אותו ב־VS Code

1. המתן עד שמסוף VS Code מוכן, ואז הקלד את הפקודה הבאה:

   ```bash title="" linenums="0"
   azd up
   ```

השלים את צעדי זרימת העבודה שהדבר יפעיל:

1. יתבקש ממך להיכנס ל־Azure - פעל לפי ההוראות לאימות
1. הזן שם סביבה ייחודי עבורך - לדוגמה, השתמשתי ב־`nitya-mshack-azd`
1. זה ייצור תיקיית `.azure/` - תראה תיקיית משנה עם שם הסביבה
1. יתבקש ממך לבחור שם למנוי - בחר בברירת המחדל
1. יתבקש ממך לבחור מיקום - השתמש ב־`East US 2`

כעת, המתן לסיום הפריסה. **זה לוקח 10-15 דקות**

1. בסיום, הטרמינל שלך יציג הודעת הצלחה בסגנון הזה:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. פורטל Azure שלך יכיל כעת קבוצת משאבים פרוסה עם שם הסביבה:

      ![Infra](../../../../../translated_images/he/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **כעת אתה מוכן לאמת את התשתית והאפליקציה שפורסמו**.

---

## 4. אימות תבנית

1. בקר בדף [Resource Groups](https://portal.azure.com/#browse/resourcegroups) בפורטל Azure - היכנס כשמתבקש
1. לחץ על קבוצת המשאבים עבור שם הסביבה שלך - תראה את הדף לעיל

      - לחץ על משאב Azure Container Apps
      - לחץ על כתובת האפליקציה בקטגוריית _Essentials_ (למעלה מימין)

1. אמור להופיע ממשק משתמש של אפליקציה מתארחת כך:

   ![App](../../../../../translated_images/he/03-test-application.471910da12c3038e.webp)

1. נסה לשאול כמה [שאלות לדוגמה](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. שאל: ```מהי עיר הבירה של צרפת?```
      1. שאל: ```מה הוא הכי טוב לאוהל מתחת ל-200$, לשני אנשים, ואילו תכונות יש לו?```

1. אמורים להגיע תשובות דומות לאלה שמוצגות למטה. _אבל איך זה עובד?_

      ![App](../../../../../translated_images/he/03-test-question.521c1e863cbaddb6.webp)

---

## 5. אימות סוכן

אפליקציית Azure Container App מפריסה נקודת קצה שמתחברת לסוכן ה־AI שפורס ב־Microsoft Foundry בפרויקט התבנית הזו. בוא נבחן מה משמעות הדבר.

1. חזור לדף _Overview_ בסביבת העבודה שלך בפורטל Azure

1. לחץ על משאב `Microsoft Foundry` ברשימה זו

1. אמור להופיע זה. לחץ על כפתור `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/he/04-view-foundry-project.fb94ca41803f28f3.webp)

1. אמור להופיע דף פרויקט Foundry עבור האפליקציה שלך
   ![Project](../../../../../translated_images/he/05-visit-foundry-portal.d734e98135892d7e.webp)

1. לחץ על `Agents` - תראה את הסוכן המוגדר כברירת מחדל בפרויקט שלך
   ![Agents](../../../../../translated_images/he/06-visit-agents.bccb263f77b00a09.webp)

1. בחר בו - ותראה פרטי הסוכן. שים לב ל:

      - הסוכן משתמש בחיפוש קבצים כברירת מחדל (תמיד)
      - באזור `Knowledge` מצוין שהועלו 32 קבצים (לחיפוש קבצים)
      ![Agents](../../../../../translated_images/he/07-view-agent-details.0e049f37f61eae62.webp)

1. חפש את האפשרות `Data+indexes` בתפריט השמאלי ולחץ לפרטים.

      - אתה אמור לראות את 32 קבצי הנתונים שהועלו עבור הידע.
      - אלה יהיו מקבילים ל־12 קבצי לקוחות ו־20 קבצי מוצרים ב־`src/files`
      ![Data](../../../../../translated_images/he/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**אימת ההפעלה של הסוכן בוצע!**

1. תגובות הסוכן מבוססות על הידע שבקבצים אלו.
1. כעת ניתן לשאול שאלות הקשורות לאותם נתונים ולקבל תגובות מבוססות.
1. לדוגמה: `customer_info_10.json` מתאר את שלוש הרכישות שביצעה "אמנדה פרז"

חזור ללשונית הדפדפן עם נקודת הקצה של Container App ושאל: `אילו מוצרים בבעלות אמנדה פרז?`. אמור להופיע משהו כזה:

![Data](../../../../../translated_images/he/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. מגרש המשחקים של הסוכן

בוא נבנה קצת הבנה על היכולות של Microsoft Foundry, על ידי התנסות בסוכן במשחקייה.

1. חזור לדף `Agents` ב־Microsoft Foundry - בחר את הסוכן המוגדר כברירת מחדל
1. לחץ על האפשרות `Try in Playground` - אמור להופיע ממשק Playground כזה
1. שאל את אותה השאלה: `אילו מוצרים בבעלות אמנדה פרז?`

    ![Data](../../../../../translated_images/he/09-ask-in-playground.a1b93794f78fa676.webp)

תקבל את אותה התגובה (או דומה) - אך גם מידע נוסף שתוכל להשתמש בו כדי להבין את איכות, עלות וביצועי אפליקציית הסוכן שלך. לדוגמה:

1. שים לב שהתשובה מציגה את קבצי הנתונים ששימשו "להטלת בסיס" לתגובה
1. העמד את הסמן על כל אחת מתוויות הקבצים - האם הנתונים תואמים לשאילתה ולתגובה המוצגת?

כמו כן תראה שורת _סטטיסטיקות_ מתחת לתגובה.

1. העמד את הסמן על כל מדד - למשל בטיחות. תראה משהו כזה
1. האם דירוג ההערכה מתאים לאינטואיציה שלך לגבי רמת הביטחון של התגובה?

      ![Data](../../../../../translated_images/he/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. יכולת תצפית מובנית

תצפית היא אודות חיווט האפליקציה שלך על מנת לייצר נתונים שניתן להשתמש בהם להבנה, ניפוי שגיאות ואופטימיזציה של פעולתה. לקבלת תחושה על כך:

1. לחץ על כפתור `View Run Info` - אמור להופיע מבט כזה. זהו דוגמה ל־[Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) בפעולה. _ניתן גם לקבל מבט זה על ידי לחיצה על Thread Logs בתפריט הראשי_.

   - קבל תחושה על צעדי הריצה והכלים שבהם נעשה שימוש על ידי הסוכן
   - הבן את מספר הטוקנים הכולל (לעומת שימוש טוקנים ביציאה) עבור התגובה
   - הבן את זמן ההשהיה ומהיכן הזמן מתבזבז בביצוע

      ![Agent](../../../../../translated_images/he/10-view-run-info.b20ebd75fef6a1cc.webp)

1. לחץ על לשונית `Metadata` כדי לראות מאפיינים נוספים של הריצה, שלעיתים מספקים הקשר שימושי לניפוי תקלות בהמשך.

      ![Agent](../../../../../translated_images/he/11-view-run-info-metadata.7966986122c7c2df.webp)



1. לחץ על לשונית `Evaluations` כדי לראות הערכות אוטומטיות שנעשו על תגובת הסוכן. אלה כוללות הערכות בטיחות (למשל, פגיעה עצמית) והערכות ספציפיות לסוכן (למשל, פתרון כוונה, עמידה במשימה).

      ![Agent](../../../../../translated_images/he/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. לבסוף, לחץ על לשונית `Monitoring` בתפריט הצדדי.

      - בחר בלשונית `Resource usage` בעמוד שמוצג - וצפה במדדים.
      - עקוב אחרי שימוש באפליקציה במונחי עלויות (טוקנים) ועומס (בקשות).
      - עקוב אחרי זמן ההשהיה של האפליקציה עד הבייט הראשון (עיבוד כניסה) והבייט האחרון (יציאה).

      ![Agent](../../../../../translated_images/he/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. משתני סביבה

עד כה עברנו על הפריסה בדפדפן - ואימתנו שהתשתית שלנו פרוסה והאפליקציה פעילה. אך לעבודה עם קוד האפליקציה _קודם כל_, עלינו להגדיר את סביבת הפיתוח המקומית עם המשתנים המתאימים הדרושים לעבודה עם המשאבים האלה. שימוש ב־`azd` מקל על כך.

1. Azure Developer CLI [משתמש במשתני סביבה](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) לאחסון וניהול הגדרות התצורה של פריסות האפליקציה.

1. משתני הסביבה מאוחסנים בקובץ `.azure/<env-name>/.env` - מה שמגדיר אותם לסביבת `env-name` שבה נעשה שימוש בפריסה ועוזר לבודד סביבות בין יעדי פריסה שונים באותו מאגר.

1. משתני הסביבה נטענים אוטומטית על ידי פקודת `azd` בכל פעם שהיא מבצעת פקודה ספציפית (למשל, `azd up`). שים לב ש־`azd` אינה קוראת אוטומטית משתני סביבה ברמת מערכת ההפעלה (למשל, מוגדרים בשל), אלא יש להשתמש בפקודות `azd set env` ו־`azd get env` להעברת מידע בתוך סקריפטים.


בוא ננסה כמה פקודות:

1. קבל את כל משתני הסביבה שהוגדרו ל־`azd` בסביבה זו:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      תראה משהו כמו:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. קבל ערך ספציפי - למשל, אני רוצה לדעת אם הגדרנו את המשתנה `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      תראה משהו כזה - הוא לא הוגדר כברירת מחדל!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. הגדר משתנה סביבה חדש ל־`azd`. כאן אנו מעדכנים את שם דגם הסוכן. _הערה: כל שינוי שתעשה ישתקף מייד בקובץ `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      כעת, כדאי למצוא שהערך הוגדר:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. שים לב שחלק מהמשאבים הם מתמשכים (למשל, פריסות דגם) וידרשו יותר מאשר רק `azd up` כדי לאלץ פריסה מחדש. ננסה לפרק את הפריסה המקורית ולפרוס מחדש עם משתני סביבה שהשתנו.

1. **רענון** אם כבר פרסת תשתית באמצעות תבנית azd - תוכל _לרענן_ את מצב משתני הסביבה המקומיים שלך בהתבסס על מצב הפריסה הנוכחי שלך ב־Azure באמצעות הפקודה הזו:

      ```bash title="" linenums="0"
      azd env refresh
      ```

זוהי דרך עוצמתית ל_לסנכרן_ משתני סביבה בין שני סביבות פיתוח מקומיות או יותר (למשל, צוות עם מספר מפתחים) - מאפשרת לתשתית המופעלת לשמש כאמת היסוד למצב משתנה הסביבה. חברי הצוות פשוט צריכים _לרענן_ את המשתנים כדי לחזור לסנכרון.

---

## 9. ברכות 🏆

סיימת הרצה מקצה לקצה שבה:

- [X] בחרת את תבנית AZD שברצונך להשתמש בה
- [X] פתחת את התבנית בסביבת פיתוח נתמכת
- [X] פרסת את התבנית ואישרת שהיא פועלת

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->