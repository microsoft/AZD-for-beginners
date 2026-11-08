# 5. התאמה אישית של תבנית

!!! tip "בסוף מודול זה תוכל"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 הקמת קו בסיס

השתמש במאגר [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) שהאתחל מהמודולים הקודמים. רשום את גרסת התבנית, גרסת AZD, הסביבה הנבחרת, פריסת המודל, ואת שאלות הדוגמה העובדות לפני שינוי כל דבר.

הדוגמה מממשת יישום צ'אט הנתמך בסוכן. היא **אינה** הופכת למערכת קמעונאית עם שני סוכנים רק על ידי הגדרת משתני סביבה או שמירת קבצי הוראות נוספים. סוכנים נוספים, מטפלי כלים, ניתוב, הרשאות וגישה לנתונים דורשים קוד יישום.

בדוק את ההוראות והכלים של הסוכן שמוצב כרגע ב-Foundry. בדוק שאלה עובדתית אחת, שאלה של משאוב אחד, ושאלה שנתוני הדוגמה אינם יכולים לענות עליה. אמת את הציטוטים מול מסמכי המקור עצמם במקום להניח שתגובה שוטפת נכונה.

## 5.2 התאמה אישית של משאוב ידע

התבנית תומכת במשאוב מבוסס קבצים ואינטגרציה אופציונלית עם Azure AI Search. עקוב אחר [המדריך הנוכחי של AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) לאינדוקס והגדרת כלים.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

הפעלת השירות היא רק חלק ממשאוב. לפני העלאת הנתונים שלך:

1. אשר שיש לך הרשאה להשתמש במסמכים והסר מידע רגיש.
2. בחר מודל ההטמעה הנתמך באזור שלך וקבע את גרסתו התואמת, סוג הפריסה וממדי הוקטורים.
3. צור/מלא את האינדקס בעזרת התהליך המתועד בדוגמה.
4. הגדר את כלי המשאוב של הסוכן להשתמש באינדקס זה.
5. בדוק משאוב, ציטוטים, הרשאות והתנהגות כשאין מסמך רלוונטי.

אל תעבור מ-`text-embedding-3-small` למודל הטמעה שונה ללא בדיקת ממדים ובנייה/אינדוקס מחדש של וקטורים לפי הצורך. שם כמו `retail-products` אינו קטלוג מיושם או מדיניות בקרת גישה.

## 5.3 מעקב ובקרה

עקוב אחר [מדריך הנראות של הדוגמה](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). ודא שקיים משאבי Application Insights והחיבור הנדרש; אם משנים הגדרות תשתית, השתמש ב-`azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

שלח בקשת בדיקה, ואז בדוק את יומני היישום של Container App ואת תצוגת המעקב של הסוכן ב-Foundry. בדוק השהייה, קריאות כלים, שגיאות וקורלציה בין הבקשה למעקב. אל תניח שעקיבה מחוברת רק בגלל שהפריסה הצליחה.

השאר את `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` מושבת אלא אם בדקת במפורש הסכמה, הצפנה, שמירת נתונים ובקרות גישה. רובדים יכולים להכיל טיעוני כלים רגישים או תוכן מסמכים אפילו כשיומני יישום רגילים נראים תמימים.

## 5.4 הערכת סוכן

נקודת הכניסה להערכה בדוגמה היא כעת [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), לא ספריית `evals/`. משורש הדוגמה, השתמש בסביבת פייתון העומדת בדרישות המתועדות שלה:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

לפני הרצה, השלם את [דרישות מוקדמות להערכה](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). הבדיקות טוענות תצורה מ-`.azure/<environment>/.env` שנבחר; אשר שהסביבה המתכוונת נבחרה. קלטים חשובים כוללים:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, בפורמט הנדרש על ידי הדוגמה הנוכחית (גרסה שנבדקה משתמשת ב-`agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, המשמש כפריסת מודל השיפוט

בדוק את הבדיקות להבין בחירת מעריך, ספי הערכה, תפקידים נדרשים ועלויות מודל. ריצה שהושלמה אינה בהכרח מעבר בגדר איכות; בדוק ציונים, תיקי כישלון/שגיאה, והתוצאות המקושרות ב-Foundry.

### הרחבת הערכות AZד נפרדת

בדיקת הפייתון שלעיל היא **תהליך ספציפי לדוגמה**. ההרחבה האופציונלית `azure.ai.evaluations` היא תהליך שונה, עם תצורת `evals/azure.eval.yaml` משלה:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

להתקנת הרחבה מלאה, ראו [תהליכי הערכה והגירה](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). מאז סוכנים extension beta.22, אל תשתמש בפקודות הוסרו `azd ai agent eval`. התקנת הרחבת ההערכות לא ממירה את בדיקות הפייתון של הדוגמה או יוצרת אוטומטית תצורת הערכה.

## 5.5 Red teaming בבינה מלאכותית והערכה רציפה

הדוגמה הנוכחית מספקת [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). השלם את דרישותיה המקדימות וסקור את היעד והעלויות המתוכננים לפני הרצה:

```bash
pytest tests/test_red_teaming.py -s
```

השתמש בפריסת בדיקה מורשית ונתונים סינתטיים. סקור את ההתקפות והתוצאות שנוצרו; סריקה זו אינה מבססת שהיישום מאובטח או תואם.

המדריך ל[תצפית](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) מתאר גם הערכה רציפה המוגדרת בהפעלה של המכולה. הוא מעריך אינטראקציות משתמש אמיתיות, לא תנועה שנוצרה על ידי בדיקה, ותמיכת המעריך משתנה לפי אזור. אין אינטראקציות פירושו שאין ערכי הערכה. אמת את גרסת הדוגמה המותקנת ואת תצורת המעריך במקום להניח שלכל פריסה יש את ברירות המחדל זהות.

אימות מופרד מהערכת. עקוב אחר תצורת הזהות/הגישה המתועדת בדוגמה. אין תיעוד ל"נפילה לאימות בסיסי" שעליו ניתן לסמוך להגנה על נקודת קצה ציבורית.

## 5.6 תרגיל עיצוב: התאמה אישית בקמעונאות

!!! warning "תרגיל עיצוב, לא פריסה גמורה"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

כתוב תוכנית קצרה המתייחסת ל:

| תחום | החלטה והוכחות לאיסוף |
|------|----------------------------------|
| אחריות סוכן | להתחיל עם סוכן אחד, או להצדיק סוכני Shopper ו-Loyalty נפרדים ולוגיקת ניתוב |
| נתונים | להגדיר מערך נתונים סינתטי של קטלוג/תגמולים ובעלות על עדכונים |
| כלים | ליישם תחילה מטפלים לקריאה בלבד; לפרט הרשאות ואימות לכל כתיבה |
| מודלים | לבחור שילובי מודל/גרסה/קוד מוצר זמינים ולאמת מכסה; להימנע מהקצאת מודלים שלא בשימוש |
| אחזור | להגדיר אינדקסים, ממדי הטמעה, הפניות ושליטה בגישה ברמת מסמך |
| הערכה | להוסיף מקרים של תשובות צפויות, שאלות לא נתמכות, שימוש בכלים ומקרי בטיחות עם ספי הגדרה מפורשים |
| תפעול | להגדיר טלמטריה, תקציבי השהייה/שגיאה, הגבלות על עלויות, ובעלות על ניקוי |

שמירת `custom-agents/shopper-agent-instructions.md` לא גורמת לדוגמה לטעון אותו. מצא את קוד היישום שיוצר/מעדכן את הסוכן, חבר לשם את ההוראות שסקרת, ואמת גרסת הסוכן שנוצרה לפני הבדיקה. הוראות אינן יכולות להעניק גישה לנתונים או לכלים שלא יישמת.

החל שינוי אחד בכל פעם, פרוס מחדש את הרכיבים שהושפעו, והרץ מחדש את שאלות הבסיס וההערכות שלך. שמור גרסה עבודה להשוואה. להשראה ארכיטקטונית, עיין ב[מפת הדרכים לקמעונאות](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), שגם היא אינה יישום קמעונאי שלם.

!!! quote "בסוף מעבדה זו עליך שיהיה לך"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

המשך ל[פירוק תשתית](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->