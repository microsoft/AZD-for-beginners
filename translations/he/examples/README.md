# דוגמאות — מקור באנגלית ודוגמאות Azure

אלה דוגמאות ללמידה, לא אפליקציות מאושרות לייצור. קרא את
הדרישות המוקדמות, ההגבלות, העלויות והוראות הניקוי של כל
דוגמה לפני הפעלת הפקודות. יש לבדוק זמינות ומכסים של Azure במנוי שלך.

- [דף הקורס](../README.md)
- [התקנה](../docs/chapter-01-foundation/installation.md)
- [פתרון בעיות](../docs/chapter-07-troubleshooting/common-issues.md)

## מה באמת קיים מקומית

קיימות **ארבע דוגמאות אפליקציה** ו-**מסגרת תשתית אחת**:

| דוגמה | מימוש מקומי | מוקד למידה | רמה |
|---|---|---|---|
| [API Flask פשוט](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | פריסת מכולות, בדיקות, לוגים | מתחילים |
| [מיקרו-שירותים עם שני שירותים](../../../examples/container-app/microservices) | שער Node.js ושירות מוצר Python לקריאה בלבד, Dockerfiles, Bicep, `azure.yaml` | תקשורת HTTPS פנימית, סקיילינג עצמאי | ביניים |
| [אפליקציית מסד נתונים](../../../examples/database-app) | API Flask לקריאה, Azure SQL, App Service, Bicep, `azure.yaml` | חיבוריות SQL, אתחול, לוגים | ביניים |
| [צ'אט Azure OpenAI](../../../examples/azure-openai-chat) | CLI Python מקומי, Azure OpenAI ו-Key Vault Bicep, רק תשתית `azure.yaml` | אספקת מודלים, היסטוריית שיחה, הערכות אסימונים | ביניים |
| [תשתית קמעונאית](../../../examples/retail-multiagent-arm-template) | תבנית ARM, פרמטרים, סקריפט פריסה ב-Bash; **מכולות hello-world בלבד** | תשתית לאפליקציית סוכנים מרובים עתידית | מתקדם |

התרחיש [קמעונאי](retail-scenario.md) הוא **שרטוט אדריכלי**, לא
מימוש מלא של סוכנים מרובים. אין קוד לסוכן קמעונאי, ממשק שיח חזיתי,
ממשק API של נתב, צינור נתוני חיפוש, ממשק CLI להערכה, כשל אוטומטי, או
חיזוק לייצור כלולים. יש לתכנן, לבנות ולבדוק אותם בנפרד.

התצוגה הכוללת של [מיקרוסרוויסים](microservices/README.md) מצביעה על דוגמת
שתי שירותים שניתן להריץ; זו לא תיקיית פריסה נוספת.

## מסלול למידה מומלץ

1. פרוס את API של Flask ואמת את `/health` ופעולות CRUD.
2. פרוס את אפליקציית מסד הנתונים ואמת את חמשת המוצרים שהוזנו מראש.
3. פרוס את דוגמת שתי השירותים ואמת את הבקשות מ-gateway למוצר.
4. ספק את משאבי השיח והפעל את ה-CLI האינטראקטיבי **מקומית**.
5. למד את שרטוט הקמעונאות לאחר השלמת הדוגמאות העובדות.

יש להקצות בערך 30–60 דקות לכל דוגמה של אפליקציה כולל דרישות מוקדמות ואימות.
מימוש קמעונאי הוא פרויקט פיתוח נפרד, לא סדנה של 30 דקות.
קריאת האדריכלות שלה אורכת כ-2–3 שעות; מימוש
ומוכנות לייצור יכולים לקחת זמן משמעותי יותר מה-80–120 שעות
פיתוח הממחישות במדריך.

## התחלה מהירה

משורש המאגר, לדוגמה הראשונה למכולה:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

צפוי: HTTP 200 ו-JSON המכיל `"status": "healthy"`.
יש צורך בדוקר פועל לבניית המכולה המקומית.

לשיח, פעל לפי [קובץ ה-README לשיח](azure-openai-chat/README.md): השתמש ב-
`azd provision`, טען את מפתח ה-API מ-Key Vault לנאד הנוכחי, התקן את
`src/requirements.txt`, והפעל את `python src/chat.py`. אין שירות שיח מתארח.

לקמעונאות, השתמש ב-[מדריך ARM](retail-multiagent-arm-template/README.md).
אין בו `azure.yaml` ו**לא** מופעל או מוסר על ידי `azd up`/`azd down`.

## עלויות ומגבלות

- כל הפריסות יוצרות משאבי Azure שניתנים לחיוב. סיווי לאפס חל רק
  על חישוב האפליקציה; הוא לא מבטל עלויות של רישום, מסד נתונים, אחסון, חיפוש או לוגים.
- מחירים מדויקים תלויים באזור, מטבע, תעבורה, דגם/SKU, ושימור.
  השתמש ב-[מחשבון מחירי Azure](https://azure.microsoft.com/pricing/calculator/)
  לפני הפריסה וקבע תקציב בניהול עלויות Azure.
- נתוני CRUD של Flask בזיכרון, מוגבלים לעובד אחד ולרפליקה אחת לכל היותר כברירת מחדל.
  הם נעלמים באתחול מחדש או סיווי לאפס. זה לא אחסון עמיד.
- המיקרוסרוויס של המוצר חושף רק נקודות קצה GET. אין שירות הזמנות, שירות משתמש,
  מסד נתונים, Service Bus, מימוש C# או Go כלולים.
- משאבי Application Insights לא מנטרים באופן אוטומטי כל אפליקציה.
  עיין בכל דוגמה לגבי הטלמטריה שמופקת בפועל.
- הדוגמאות לא מיישמות אימות אפליקציה. הוסף זהות, הרשאה,
  אחסון עמיד, בקרה על רשת, בדיקות ונהלים תפעוליים לפני הפקה.

## דוגמאות Azure חיצוניות — שכפל בנפרד

קישורים אלו הם הפניות למאגרים נפרדים, **לא דוגמאות מקומיות**.
מנהליהן הם בעלי ההוראות להתקנה, מימוש, תלות ועלויות.

| דוגמה | מיקוד |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | אפליקציית Node.js עם מסד נתונים |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# ו-SQL של Azure |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ממשק קידמי סטטי עם פונקציות C# ו-SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | אפליקציית שרתלס ב-Python |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Backend של חנות במכולה |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | אפליקציית צ'ט מבוססת AI |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | אפליקציית סוכנים |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG עם חיפוש וציטוטים |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | דוגמת AI שיחתי |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | מיקרו-שירותי Java |

גלו פרויקטים נוספים ב-[גלריית תבניות AZD](https://azure.github.io/awesome-azd/).
אל תניחו שהפרויקט החיצוני תומך ב-`azd` מבלי לבדוק את קובץ ה-README העדכני שלו.

## מבנה המאגר

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

אין ספריית `configurations/`, `scripts/` או בדיקות משותפת שמובטחת על ידי
אינדקס זה. קבצים בפועל ורעיונות הרחבה אופציונליים מוגדרים בכל מדריך.

## ניקוי

עבור ארבע דוגמאות AZD, הריצו זאת **מתוך תקיית הדוגמה שנבחרה**:

```bash
azd down
```

עברו על ההנחיות למחיקה. עבור קמעונאות, מחקו רק קבוצת המשאבים הייעודית
שיצרתם, בהתאם להוראות במדריך ARM שלה. בדקו את ניהול העלויות של Azure
לאחר הניקוי; נתוני חיוב עשויים להופיע מאוחר יותר.

## תרומה

כללו את הקוד המקור, התשתית, תצורת הפריסה, שלבי ההקמה והבדיקה המעשיים,
מגבלות והוראות ניקוי עם כל דוגמת אפליקציה. סמנו במפורש חומר ארכיטקטורה בלבד וקטעי קוד לא שלמים.
אל תטעו לטעון שהפרויקט מוכן לייצור ללא בדיקות פריסה, פונקציונליות ותפעול.


[שאלות נפוצות](../resources/faq.md) · [מדריך לימוד](../resources/study-guide.md) ·
[דווח על בעיה](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->