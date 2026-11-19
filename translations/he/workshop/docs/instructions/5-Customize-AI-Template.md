# 5. התאמה אישית של תבנית

!!! tip "בסוף מודול זה תוכל ל־"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 קביעת בסיס

השתמש במאגר [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) שהותחל במודולים הקודמים. רשום את גרסת התבנית, גרסת AZD, הסביבה שנבחרה, פריסת המודל, ושאלות דוגמה עובדות לפני שתשנה משהו.

הדוגמה מממשת אפליקציית צ'אט הנתמכת בסוכן. היא **אינה** הופכת למערכת קמעונאות מבוססת שני סוכנים רק על ידי הגדרת משתני סביבה או שמירת קבצי הוראות נוספים. סוכנים נוספים, מטפלי כלים, ניתוב, הרשאה, וגישת נתונים דורשים קוד אפליקציה.

בדוק את הוראות הסוכן והמכשירים המפורסים ב-Foundry. שנה בדיקה אחת לשאלה עובדתי, שאלה של אחזור, ושאלה שהנתונים בדוגמה אינם יכולים לענות עליה. ודא את הציטוטים מול מסמכי המקור האמיתיים במקום להניח שהתשובה השטיפה נכונה.

## 5.2 התאמת אחזור הידע

התבנית תומכת באחזור מבוסס קבצים ואינטגרציה אופציונלית עם Azure AI Search. עקוב אחר [מדריך AI Search הנוכחי](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) לאינדוקס והגדרת הכלים.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

הפעלת השירות היא רק חלק מאחזור המידע. לפני העלאת הנתונים שלך:

1. אשר שיש לך הרשאה להשתמש במסמכים והסר מידע רגיש.
2. בחר מודל הטמעה הנתמך באזור שלך והגדר את גרסתו התואמת, סוג הפריסה, וממדי הוקטור.
3. צור/אכלס את האינדקס באמצעות התהליך המתועד בדוגמה.
4. הגדר את כלי האחזור של הסוכן להשתמש באינדקס זה.
5. בדוק אחזור, ציטוטים, הרשאות, והתנהגות כאשר אין מסמך רלוונטי.

אל תעבור מ־`text-embedding-3-small` למודל הטמעה שונה ללא בדיקת ממדים ובנייה/אינדוקס מחדש של וקטורים לפי הצורך. שם כמו `retail-products` אינו קטלוג מיושם או מדיניות בקרת גישה.

## 5.3 מעקב וניטור

עקוב אחר [מדריך התצפית בדוגמה](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). ודא כי משאב Application Insights והחיבור הנדרשים קיימים כבר; אם משנים הגדרות תשתית, השתמש ב־`azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

שלח בקשת בדיקה, ולאחר מכן בדוק את יומני האפליקציה של Container App ואת תצוגת המעקב של הסוכן ב-Foundry. בדוק עיכובים, קריאות לכלים, שגיאות, וקורלציה בין הבקשה למעקב. אל תניח שטלמטריה מחוברת רק משום שהפריסה הצליחה.

השאר את `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` מושבת אלא אם אישרת במפורש סכמה, הסרה, שמירה, ובקרות גישה. מעקבים יכולים להכיל ארגומנטים של כלים או תכולת מסמכים רגישים גם כאשר יומני אפליקציה רגילים נראים בטוחים.

## 5.4 הערכת סוכן

נקודת הכניסה להערכת הדוגמה היא [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), לא ספריית `evals/`. מהשורש של הדוגמה, השתמש בסביבת Python שעומדת בדרישות המתועדות שלה:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

לפני ההרצה, השלם את [הדרישות המקדימות להערכה](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). הבדיקות טוענות קונפיגורציה מה-`.azure/<environment>/.env` שנבחר; אשר כי הסביבה המתוכננת נבחרה. קלטים חשובים כוללים:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, תוך שימוש בפורמט הדרוש לדוגמה הנוכחית (הגרסה שנבדקה משתמשת ב־`agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, משמש כמודל שיפוט לפריסה

בדוק את הבדיקות כדי להבין את בחירת המעריך, ספים, תפקידים נדרשים, ועלויות מודל. ריצה שהושלמה אינה בהכרח שער איכות שעברה; בדוק ציונים, מקרים שנכשלו/שגויים, ותוצאות מקושרות ב-Foundry.

### הרחבת הערכות נפרדת ל-AZD

בדיקת ה-Python למעלה היא **זרימת עבודה ספציפית לדוגמה**. הרחבת `azure.ai.evaluations` האופציונלית היא זרימת עבודה נפרדת, עם קונפיגורציית `evals/azure.eval.yaml` משלה. היא מותקנת בנפרד, לא כלולה בחבילת `microsoft.foundry` 1.0 הזמינה באופן כללי:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

לקבלת התקנה מלאה של ההרחבה, ראה [זרימות עבודה והגירה של הערכות](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). מאז beta.22 של הרחבת הסוכנים, אל תשתמש בפקודות שהוסרו `azd ai agent eval`. התקנת הרחבת ההערכות אינה הופכת את בדיקות ה-Python של הדוגמה או יוצרת אוטומטית קונפיגורציית הערכה.

עבור **תרגיל סוכן GA נפרד** השתמש בתיקיה ריקה מחוץ לדוגמת הסדנה הזו ועקוב אחר [המדריך Foundry מקומי לענן](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). הוא משתמש ב-AZD 1.37.0+, חבילת `microsoft.foundry`, Python 3.13+, ו-uv הנוכחי. תבדוק את `azure.yaml`, תבדוק מקומית עם Agent Inspector, תפרוס מקור לבניית Foundry מרוחקת, ותיצור/תסקור מערך נתונים וערכה לפני הגדרת `azd ai eval init --name quality`. אל תחליף את הבדיקות של הדוגמה הזו או תניח שהתקנת החבילה משנה את מודל האחסון שלה.

## 5.5 הרד-טימינג של AI והערכה רציפה

הדוגמה הנוכחית מספקת [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). השלם את הדרישות המקדימות וסקור את היעד והעלויות המיועדות לפני ההרצה:

```bash
pytest tests/test_red_teaming.py -s
```

השתמש בפריסת בדיקה מאושרת ובנתונים סינתטיים. בדוק את ההתקפות והתוצאות שנוצרו; סריקה זו אינה ממציאה שמדובר באפליקציה בטוחה או תואמת.

ה-[מדריך הנראות](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) מתאר גם הערכה רציפה המוגדרת בעת הפעלת המכולה. היא מעריכה אינטראקציות אמיתיות של משתמשים, לא תעבורת בדיקה שנוצרה, ותמיכת המעריך משתנה לפי אזור. חוסר אינטראקציות פירושו שאין רשומות הערכה. אמת את גרסת הדוגמה המותקנת ותצורת המעריך במקום להניח שלכל פריסה יש את ברירות המחדל זהות.

האימות נפרד מההערכה. פעל לפי הגדרת הזהות/הגישה המתועדת בדוגמה. אין "מנגנון גיבוי אבטחה בסיסי" מתועד שניתן לסמוך עליו להגנת נקודת קצה ציבורית.

## 5.6 תרגיל עיצוב: התאמה קמעונאית

!!! warning "תרגיל עיצוב, לא פריסה מלאה"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

כתוב תוכנית קצרה המתייחסת ל:

| תחום | החלטה וראיות לאיסוף |
|------|----------------------------------|
| אחריות הסוכן | התחל עם סוכן אחד, או הצדק סוכנים נפרדים לקונה ולנאמנות ולוגיקת ניתוב |
| נתונים | הגדר קטלוג/מערכת פרסים סינתטית ובעלות על עדכונים |
| כלים | מימוש מטפלים לקריאה בלבד תחילה; פרט הרשאה ואימות לכל כתיבה |
| דגמים | בחר שילובי דגם/גרסה/SKU זמינים ואמת מכסת שימוש; הימנע מהקצאת דגמים שאינם בשימוש |
| אחזור | הגדר אינדוקס, ממדי הטמעה, ציטוטים ושליטת גישה ברמת מסמך |
| הערכה | הוסף מקרים של תשובה צפויה, שאלה לא נתמכת, שימוש בכלי ומקרי בטיחות עם ספים מפורשים |
| תפעול | הגדר טלמטריה, תקציבי השהייה/שגיאות, מגבלות עלויות ואחריות ניקיון |

שמירת `custom-agents/shopper-agent-instructions.md` לא גורמת לדוגמה לטעון אותו. מצא את קוד היישום שיוצר/מעדכן את הסוכן, חבר את ההוראות שבדקת שם, ואמת את גרסת הסוכן המתקבלת לפני הבדיקה. ההוראות אינן יכולות להעניק גישה לנתונים או כלים שלא מימשת.

יישם שינוי אחד בכל פעם, פרוס מחדש את הרכיבים המושפעים, והריץ שוב את שאלות הבסיס וההערכות. שמור גרסה עובדת להשוואה. להשראה לארכיטקטורה, ראה את [התכנית הקמעונאית](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), שגם היא לא יישום קמעונאי מלא.

!!! quote "בסיום המעבדה הזו עליך להיות בעל"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

המשך ל-[פירוק התשתית](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->