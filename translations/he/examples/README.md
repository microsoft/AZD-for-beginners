# דוגמאות - תבניות והגדרות מעשיות ל-AZD

**לומדים באמצעות דוגמה - מאורגן לפי פרקים**
- **📚 הבית של הקורס**: [AZD למתחילים](../README.md)
- **📖 מיפוי פרקים**: דוגמאות מאורגנות לפי דרגת הקושי בלמידה
- **🚀 דוגמה מקומית**: [פתרון קמעונאות מרובה-סוכנים](retail-scenario.md)
- **🤖 דוגמאות AI חיצוניות**: קישורים למאגרי דוגמאות של Azure

> **📍 חשוב: דוגמאות מקומיות לעומת חיצוניות**  
> מאגר זה מכיל **4 דוגמאות מקומיות מלאות** עם יישומים מלאים:  
> - **שיחת דגמי Microsoft Foundry** (פריסת gpt-4.1 עם ממשק צ׳אט)  
> - **יישומי מכולות** (API פשוט ב-Flask + מיקרו-שירותים)  
> - **אפליקציית מסד נתונים** (אינטרנט + מסד נתונים SQL)  
> - **פתרון קמעונאות מרובה-סוכנים** (פתרון AI ארגוני)  
>  
> דוגמאות נוספות הן **הפניות חיצוניות** למאגרי Azure-Samples שניתן לשכפל.

## הקדמה

תיקיה זו מספקת דוגמאות מעשיות והפניות שיעזרו לך ללמוד את Azure Developer CLI באמצעות תרגול מעשי. תרחיש קמעונאות מרובה-סוכנים הוא יישום מלא, מוכן לייצור, שנכלל במאגר זה. דוגמאות נוספות מפנות לדוגמאות רשמיות של Azure הממחישות תבניות שונות של AZD.

### מדרג דרגת הקושי

- ⭐ **מתחיל** - מושגים בסיסיים, שירות יחיד, 15-30 דקות
- ⭐⭐ **בינוני** - מספר שירותים, אינטגרציית מסד נתונים, 30-60 דקות
- ⭐⭐⭐ **מתקדם** - ארכיטקטורה מורכבת, אינטגרציית AI, 1-2 שעות
- ⭐⭐⭐⭐ **מומחה** - מוכן לייצור, תבניות ארגוניות, מעל שעתיים

## 🎯 מה באמת יש במאגר הזה

### ✅ יישום מקומי (מוכן לשימוש)

#### [אפליקציית שיחת דגמי Microsoft Foundry](azure-openai-chat/README.md) 🆕  
**פריסת gpt-4.1 מלאה עם ממשק צ׳אט כלולה במאגר זה**

- **מיקום:** `examples/azure-openai-chat/`
- **דרגת קושי:** ⭐⭐ (בינוני)
- **מה כלול:**
  - פריסת Microsoft Foundry Models מלאה (gpt-4.1)
  - ממשק שיחת פקודת שורת פקודה בפייתון
  - אינטגרציה עם Key Vault למפתחות API מאובטחים
  - תבניות תשתית Bicep
  - מעקב אחר שימוש וכרטיסי זיהוי
  - הגבלת קצב וטיפול בשגיאות

**התחלה מהירה:**  
```bash
# נווט לדוגמה
cd examples/azure-openai-chat

# פרוס הכל
azd up

# התקן תלותים והתחל לשוחח
pip install -r src/requirements.txt
python src/chat.py
```
  
**טכנולוגיות:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [דוגמאות אפליקציות מכולות](container-app/README.md) 🆕  
**דוגמאות פריסה מקיפות של מכולות כלולות במאגר זה**

- **מיקום:** `examples/container-app/`
- **דרגת קושי:** ⭐-⭐⭐⭐⭐ (מתחיל עד מתקדם)
- **מה כלול:**
  - [מדריך ראשי](container-app/README.md) - סקירה מלאה של פריסות מכולות
  - [API Flask פשוט](../../../examples/container-app/simple-flask-api) - דוגמת REST API בסיסי
  - [ארכיטקטורת מיקרו-שירותים](../../../examples/container-app/microservices) - פריסה מוכנה לייצור עם מספר שירותים
  - תבניות התחלה מהירה, ייצור ומתקדמות
  - ניטור, אבטחה ואופטימיזציה של עלויות

**התחלה מהירה:**  
```bash
# הצג מדריך ראשי
cd examples/container-app

# פרוס API פשוט ב-Flask
cd simple-flask-api
azd up

# פרוס דוגמת מיקרוסרביסים
cd ../microservices
azd up
```
  
**טכנולוגיות:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [פתרון קמעונאות מרובה-סוכנים](retail-scenario.md) 🆕  
**יישום מלא, מוכן לייצור כלול במאגר זה**

- **מיקום:** `examples/retail-multiagent-arm-template/`
- **דרגת קושי:** ⭐⭐⭐⭐ (מתקדם)
- **מה כלול:**
  - תבנית פריסת ARM מלאה
  - ארכיטקטורת מרובה-סוכנים (לקוח + מלאי)
  - אינטגרציה עם Microsoft Foundry Models
  - חיפוש AI עם RAG
  - ניטור מקיף
  - סקריפט פריסה בלחיצה אחת

**התחלה מהירה:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**טכנולוגיות:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 דוגמאות Azure חיצוניות (לשכפול ושימוש)

הדוגמאות הבאות מנוהלות במאגרי Azure-Samples הרשמיים. שכפל אותן כדי ללמוד תבניות AZD שונות:

### אפליקציות פשוטות (פרקים 1-2)

| תבנית | מאגר | דרגת קושי | שירותים |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [מקומי: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **מיקרו-שירותים** | [מקומי: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | שירותים מרובים, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + פונקציות** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**כיצד להשתמש:**  
```bash
# שכפל כל דוגמה
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# פרוס
azd up
```
  
### דוגמאות יישומי AI (פרקים 2, 5, 8)

| תבנית | מאגר | דרגת קושי | מיקוד |
|:---------|:-----------|:-----------|:------|
| **שיחת דגמי Microsoft Foundry** | [מקומי: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | פריסת gpt-4.1 |
| **התנעה מהירה לשיחת AI** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | שיחת AI בסיסית |
| **סוכני AI** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | מסגרת סוכנים |
| **חיפוש + דוגמת OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | תבנית RAG |
| **צ׳אט של Contoso** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI ארגוני |

### מסדי נתונים ותבניות מתקדמות (פרקים 3-8)

| תבנית | מאגר | דרגת קושי | מיקוד |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | אינטגרציית מסדי נתונים |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL ללא שרת |
| **מיקרוסרוויסים ב-Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | שירותים מרובים |
| **צינור ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## יעדי למידה

כשאתה עובד דרך הדוגמאות האלה, תלמד:
- לתרגל תהליכי עבודה ב-Azure Developer CLI עם תרחישי יישום אמיתיים
- להבין ארכיטקטורות אפליקציה שונות והיישומים שלהן ב-AZD
- לשלוט בתבניות Infrastructure as Code לשירותי Azure שונים
- ליישם אסטרטגיות ניהול תצורה ופריסה ייעודית לסביבות
- ליישם תבניות ניטור, אבטחה והרחבה בהקשרים מעשיים
- לצבור נסיון בפתרון תקלות ודיבוג תרחישי פריסה אמיתיים

## תוצאות למידה

בסיום דוגמאות אלו תוכל:
- לפרוס סוגים שונים של יישומים באמצעות Azure Developer CLI בביטחון
- להתאים תבניות קיימות לדרישות היישום שלך
- לעצב וליישם תבניות תשתית מותאמות אישית באמצעות Bicep
- להגדיר אפליקציות מרובות שירותים עם תלות מתאימה
- ליישם אבטחה, ניטור ופרקטיקות ביצועים טובים בתרחישים אמיתיים
- לפתור תקלות ואופטימיזציות פריסה בהתבסס על נסיון מעשי

## מבנה תיקיות

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```
  
## דוגמאות להתחלה מהירה

> **💡 חדש ב-AZD?** התחל עם דוגמה #1 (Flask API) - לוקח כ-20 דקות ולומד מושגים בסיסיים.

### למתחילים
1. **[אפליקציית מכולות - Python Flask API](../../../examples/container-app/simple-flask-api)** (מקומי) ⭐  
   פרוס REST API פשוט עם קנה מידה לאפס  
   **זמן:** 20-25 דקות | **עלות:** 0-5$/חודש  
   **מה תלמד:** תהליך עבודה בסיסי ב-azd, מכולות, בדיקות בריאות  
   **תוצאה צפויה:** נקודת קצה API פעילה המחזירה "Hello, World!" עם ניטור

2. **[אפליקציית ווב פשוטה - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   פרוס אפליקציית ווב ב-Node.js Express עם MongoDB  
   **זמן:** 25-35 דקות | **עלות:** 10-30$/חודש  
   **מה תלמד:** אינטגרציית מסד נתונים, משתני סביבה, מחרוזות חיבור  
   **תוצאה צפויה:** אפליקציית רשימת מטלות עם פעולות יצירה/קריאה/עדכון/מחיקה

3. **[אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   אירוח אתר סטטי React עם Azure Static Web Apps  
   **זמן:** 20-30 דקות | **עלות:** 0-10$/חודש  
   **מה תלמד:** אירוח סטטי, פונקציות ללא שרת, פריסת CDN  
   **תוצאה צפויה:** ממשק React עם Backend API, SSL אוטומטי, CDN גלובלית

### למשתמשים בינוניים
4. **[אפליקציית שיחת דגמי Microsoft Foundry](../../../examples/azure-openai-chat)** (מקומי) ⭐⭐  
   פרוס gpt-4.1 עם ממשק שיחה וניהול מפתחות API מאובטח  
   **זמן:** 35-45 דקות | **עלות:** 50-200$/חודש  
   **מה תלמד:** פריסת Microsoft Foundry Models, אינטגרציה עם Key Vault, מעקב אחר כרטיסים  
   **תוצאה צפויה:** אפליקציית שיחה פעילה עם gpt-4.1 ומעקב עלויות

5. **[אפליקציית מכולות - מיקרו-שירותים](../../../examples/container-app/microservices)** (מקומי) ⭐⭐⭐⭐  
   ארכיטקטורת שירותים מרובים מוכן לייצור  
   **זמן:** 45-60 דקות | **עלות:** 50-150$/חודש  
   **מה תלמד:** תקשורת שירותים, תורים, מעקב מבוזר  
   **תוצאה צפויה:** מערכת של שני שירותים (שער API + שירות מוצרים) עם ניטור

6. **[אפליקציית מסד נתונים - C# עם Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   אפליקציית ווב עם API ב-C# ומסד נתונים Azure SQL  
   **זמן:** 30-45 דקות | **עלות:** 20-80$/חודש  
   **מה תלמד:** Entity Framework, מיגרציות מסד נתונים, אבטחת חיבור  
   **תוצאה צפויה:** API ב-C# עם בסיס Azure SQL עם פריסת סכימות אוטומטית

7. **[פונקציה ללא שרת - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   פונקציות Azure ב-Python עם טריגרים HTTP ו-Cosmos DB  
   **זמן:** 30-40 דקות | **עלות:** 10-40$/חודש  
   **מה תלמד:** ארכיטקטורת ארועים, קנה מידה ללא שרת, אינטגרציית NoSQL  
   **תוצאה צפויה:** אפליקציית פונקציות המגיבה לבקשות HTTP עם אחסון Cosmos DB

8. **[מיקרו-שירותים - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   אפליקציית Java עם שירותים מרובים, Container Apps ו-gateway  
   **זמן:** 60-90 דקות | **עלות:** 80-200$/חודש  
   **מה תלמד:** פריסת Spring Boot, רשת שירותים, איזון עומסים  
   **תוצאה צפויה:** מערכת Java מרובת שירותים עם גילוי ושיגור שירותים

### תבניות Microsoft Foundry

1. **[אפליקציית שיחת דגמי Microsoft Foundry - דוגמה מקומית](../../../examples/azure-openai-chat)** ⭐⭐  
   פריסת gpt-4.1 מלאה עם ממשק שיחה  
   **זמן:** 35-45 דקות | **עלות:** 50-200$/חודש  
   **תוצאה צפויה:** אפליקציית שיחה פעילה עם מעקב כרטיסים וניטור עלויות

2. **[Azure Search + הדגמת OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   אפליקציית שיחה חכמה עם ארכיטקטורת RAG  
   **זמן:** 60-90 דקות | **עלות:** 100-300$/חודש  
   **תוצאה צפויה:** ממשק שיחה מופעל על ידי RAG עם חיפוש מסמכים וציטוטים

3. **[עיבוד מסמכי AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   ניתוח מסמכים באמצעות שירותי Azure AI  
   **זמן:** 40-60 דקות | **עלות:** 20-80$/חודש  
   **תוצאה צפויה:** API המחלץ טקסט, טבלאות ויישויות ממסמכים שהועלו

4. **[צינור למידת מכונה](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   תהליך MLOps עם Azure Machine Learning  
   **זמן:** 2-3 שעות | **עלות:** 150-500$/חודש  
   **תוצאה צפויה:** צינור ML אוטומטי עם אימון, פריסה וניטור

### תרחישים מהעולם האמיתי

#### **פתרון קמעונאות מרובה-סוכנים** 🆕  
**[מדריך יישום מלא](./retail-scenario.md)**

פתרון תמיכה רב-סוכני לקמעונאות מוכן לייצור המדגים פריסת יישום AI ארגוני עם AZD. תרחיש זה מספק:
- **ארכיטקטורה שלמה**: מערכת מרובת סוכנים עם סוכנים מתמחים בשירות לקוחות וניהול מלאי  
- **תשתית ייצור**: פריסות מודלים של Microsoft Foundry במספר אזורים, Azure AI Search, Container Apps ומעקב מקיף  
- **תבנית ARM מוכנה לפריסה**: פריסה בלחיצה אחת עם מצבי תצורה מרובים (מינימלי/סטנדרטי/פרימיום)  
- **תכונות מתקדמות**: אימות אבטחה red teaming, מסגרת הערכת סוכנים, אופטימיזציה של עלויות ומדריכי פתרון תקלות  
- **הקשר עסקי אמיתי**: מקרה שימוש בתמיכת לקוחות קמעונאית עם העלאות קבצים, אינטגרציית חיפוש וקנה מידה דינמי  

**טכנולוגיות**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**מורכבות**: ⭐⭐⭐⭐ (מתקדם - מוכן לפרודקשן ארגוני)  

**מושלם ל**: מפתחי AI, ארכיטקטים של פתרונות וצוותים הבונים מערכות מרובות סוכנים לפרודקשן  

**התחלה מהירה**: פרוס את הפתרון המלא בפחות מ-30 דקות באמצעות תבנית ARM המצורפת עם `./deploy.sh -g myResourceGroup`  

## 📋 הוראות שימוש  

### דרישות מוקדמות  

לפני הרצת כל דוגמה:  
- ✅ מנוי Azure עם הרשאות Owner או Contributor  
- ✅ התקנת Azure Developer CLI ([מדריך התקנה](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop פועל (לדוגמאות עם מכולות)  
- ✅ מכסות Azure מתאימות (בדוק דרישות ספציפיות לדוגמה)  

> **💰 אזהרת עלות:** כל הדוגמאות מייצרות משאבי Azure אמיתיים שגורמים לחיובים. עיין בקבצי README בנפרד לאומדני עלות. זכור להריץ `azd down` בסיום כדי להימנע מעלויות מתמשכות.  

### הרצת דוגמאות מקומית  

1. **שכפל או העתיק דוגמה**  
   ```bash
   # לנווט לדוגמה הרצויה
   cd examples/simple-web-app
   ```
  
2. **אתחל את סביבה של AZD**  
   ```bash
   # לאתחל עם תבנית קיימת
   azd init
   
   # או ליצור סביבה חדשה
   azd env new my-environment
   ```
  
3. **קבע תצורה לסביבה**  
   ```bash
   # הגדר משתנים נדרשים
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **פרוס**  
   ```bash
   # פרוס תשתית ויישום
   azd up
   ```
  
5. **אמת פריסה**  
   ```bash
   # השג נקודות קצה של שירות
   azd env get-values
   
   # בדוק את נקודת הקצה (דוגמה)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **מדדים צפויים להצלחה:**  
   - ✅ `azd up` מסתיים ללא שגיאות  
   - ✅ נקודת סוף השירות מחזירה HTTP 200  
   - ✅ פורטל Azure מציג סטטוס "Running"  
   - ✅ Application Insights מקבל טלמטריה  

> **⚠️ בעיות?** עיין ב-[בעיות נפוצות](../docs/chapter-07-troubleshooting/common-issues.md) לפתרון תקלות בפריסה  

### התאמת דוגמאות  

כל דוגמה כוללת:  
- **README.md** - הוראות מפורטות להגדרה והתאמה  
- **azure.yaml** - תצורת AZD עם הערות  
- **infra/** - תבניות Bicep עם הסברים לפרמטרים  
- **src/** - קוד יישום לדוגמה  
- **scripts/** - סקריפטים עזר למשימות נפוצות  

## 🎯 מטרות למידה  

### קטגוריות דוגמאות  

#### **פריסות בסיסיות**  
- יישומים עם שירות יחיד  
- דפוסי תשתית פשוטים  
- ניהול תצורה בסיסי  
- הגדרות פיתוח חסכוניות  

#### **תסריטים מתקדמים**  
- ארכיטקטורות מרובות שירותים  
- תצורות רשת מורכבות  
- דפוסי אינטגרציה עם מסדי נתונים  
- יישומי אבטחה וציות  

#### **דפוסים מוכנים לפרודקשן**  
- תצורות זמינות גבוהה  
- ניטור ותצפית  
- אינטגרציה של CI/CD  
- הגדרות שיקום מאסון  

## 📖 תיאורי דוגמאות  

### אפליקציית ווב פשוטה - Node.js Express  
**טכנולוגיות**: Node.js, Express, MongoDB, Container Apps  
**מורכבות**: מתחיל  
**מושגים**: פריסה בסיסית, REST API, אינטגרציה עם מסד NoSQL  

### אתר סטטי - React SPA  
**טכנולוגיות**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**מורכבות**: מתחיל  
**מושגים**: אירוח סטטי, backend ללא שרת, פיתוח ווב מודרני  

### Container App - Python Flask  
**טכנולוגיות**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**מורכבות**: מתחיל  
**מושגים**: מכולות, REST API, scale-to-zero, בדיקות בריאות, ניטור  
**מיקום**: [דוגמה מקומית](../../../examples/container-app/simple-flask-api)  

### Container App - ארכיטקטורת מיקרו-שירותים  
**טכנולוגיות**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**מורכבות**: מתקדם  
**מושגים**: ארכיטקטורת שירותים מרובים, תקשורת שירותים, תורים להודעות, מעקב מפוזר  
**מיקום**: [דוגמה מקומית](../../../examples/container-app/microservices)  

### אפליקציית מסד נתונים - C# עם Azure SQL  
**טכנולוגיות**: C# ASP.NET Core, Azure SQL Database, App Service  
**מורכבות**: בינוני  
**מושגים**: Entity Framework, חיבורים למסד נתונים, פיתוח REST API  

### פונקציות Serverless - Python Azure Functions  
**טכנולוגיות**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**מורכבות**: בינוני  
**מושגים**: ארכיטקטורה מוכוונת אירועים, מחשוב ללא שרת, פיתוח full-stack  

### מיקרו-שירותים - Java Spring Boot  
**טכנולוגיות**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**מורכבות**: בינוני  
**מושגים**: תקשורת מיקרו-שירותים, מערכות מפוזרות, דפוסי ארגוניים  

### דוגמאות Microsoft Foundry  

#### אפליקציית צ'אט Microsoft Foundry Models  
**טכנולוגיות**: Microsoft Foundry Models, Cognitive Search, App Service  
**מורכבות**: בינוני  
**מושגים**: ארכיטקטורת RAG, חיפוש וקטורים, אינטגרציה עם LLM  

#### עיבוד מסמכים מבוסס AI  
**טכנולוגיות**: Azure AI Document Intelligence, Storage, Functions  
**מורכבות**: בינוני  
**מושגים**: ניתוח מסמכים, OCR, הפקת נתונים  

#### קו צינור למידת מכונה  
**טכנולוגיות**: Azure ML, MLOps, Container Registry  
**מורכבות**: מתקדם  
**מושגים**: אימון מודלים, קווי פריסה, ניטור  

## 🛠 דוגמאות תצורה  

ספריית `configurations/` כוללת רכיבים לשימוש חוזר:  

### תצורות סביבה  
- הגדרות סביבה לפיתוח  
- תצורות סביבה לסביבת בדיקות  
- תצורות מוכנות לפרודקשן  
- הגדרות פריסה מרובת אזורים  

### מודולי Bicep  
- רכיבי תשתית לשימוש חוזר  
- דפוסי משאבים נפוצים  
- תבניות מאובטחות  
- תצורות לאופטימיזציה של עלויות  

### סקריפטים עזר  
- אוטומציה של הגדרת סביבה  
- סקריפטים למיגרציית מסדי נתונים  
- כלי אימות לפריסה  
- כלי ניטור עלויות  

## 🔧 מדריך התאמה אישית  

### התאמת דוגמאות למקרה השימוש שלך  

1. **בדוק דרישות מוקדמות**  
   - בדוק דרישות שירותי Azure  
   - אמת מגבלות מנוי  
   - הבן השלכות עלות  

2. **שנה תצורה**  
   - עדכן הגדרות שירות ב-`azure.yaml`  
   - התאם תבניות Bicep  
   - התאם משתני סביבה  

3. **בצע בדיקות יסודיות**  
   - פרוס ראשית בסביבת פיתוח  
   - אמת תפקודיות  
   - בדוק קנה מידה וביצועים  

4. **סקור אבטחה**  
   - בדוק בקרות גישה  
   - הטמע ניהול סודות  
   - אפשר ניטור והתראות  

## 📊 טבלת השוואה  

| דוגמה | שירותים | מסד נתונים | אימות | ניטור | מורכבות |  
|--------|---------|------------|-------|-------|----------|  
| **Microsoft Foundry Models Chat** (מקומי) | 2 | ❌ | Key Vault | מלא | ⭐⭐ |  
| **Python Flask API** (מקורי) | 1 | ❌ | בסיסי | מלא | ⭐ |  
| **Microservices** (מקורי) | 5+ | ✅ | ארגוני | מתקדם | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | בסיסי | בסיסי | ⭐ |  
| React SPA + Functions | 3 | ✅ | בסיסי | מלא | ⭐ |  
| Python Flask Container | 2 | ❌ | בסיסי | מלא | ⭐ |  
| C# Web API + SQL | 2 | ✅ | מלא | מלא | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | מלא | מלא | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | מלא | מלא | ⭐⭐ |  
| Microsoft Foundry Models Chat | 3 | ✅ | מלא | מלא | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | בסיסי | מלא | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | מלא | מלא | ⭐⭐⭐⭐ |  
| **טרייל מרובה סוכנים קמעונאי** (מקורי) | **8+** | **✅** | **ארגוני** | **מתקדם** | **⭐⭐⭐⭐** |  

## 🎓 מסלול למידה  

### התקדמות מומלצת  

1. **התחל מאפליקציית ווב פשוטה**  
   - למד מושגי AZD בסיסיים  
   - הבן תהליך פריסה  
   - תרגל ניהול סביבה  

2. **נסה אתר סטטי**  
   - גלה אפשרויות אירוח שונות  
   - למד על אינטגרציית CDN  
   - הבן תצורת DNS  

3. **עבור ל-Container App**  
   - למד יסודות מכולות  
   - הבן מושגי קנה מידה  
   - תרגל עם Docker  

4. **הוסף אינטגרציית מסד נתונים**  
   - למד אספקת מסד נתונים  
   - הבן מחרוזות חיבור  
   - תרגל ניהול סודות  

5. **חקור Serverless**  
   - הבן ארכיטקטורה מוכוונת אירועים  
   - למד על טריגרים וקישורים  
   - תרגל עם API  

6. **בנה מיקרו-שירותים**  
   - למד תקשורת שירותים  
   - הבן מערכות מפוזרות  
   - תרגל פריסות מורכבות  

## 🔍 מציאת הדוגמה הנכונה  

### לפי סטאק טכנולוגי  
- **Container Apps**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices (מקורי)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (מקור)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (מקורי)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (מקורי)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (מקורי)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Microservices User Service (מקורי)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **מכולות**: [Python Flask (מקורי)](../../../examples/container-app/simple-flask-api), [Microservices (מקורי)](../../../examples/container-app/microservices), Java Microservices  
- **מסדי נתונים**: [Microservices (מקורי)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (מקורי)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **טרייל מרובה סוכנים קמעונאי**  
- **מערכות מרובות סוכנים**: **טרייל מרובה סוכנים קמעונאי**  
- **אינטגרציית OpenAI**: **[Microsoft Foundry Models Chat (מקורי)](../../../examples/azure-openai-chat)**, טרייל מרובה סוכנים קמעונאי  
- **פרודקשן ארגוני**: [Microservices (מקורי)](../../../examples/container-app/microservices), **טרייל מרובה סוכנים קמעונאי**  

### לפי דפוס ארכיטקטורה  
- **REST API פשוט**: [Python Flask API (מקורי)](../../../examples/container-app/simple-flask-api)  
- **מונוליטי**: Node.js Express Todo, C# Web API + SQL  
- **סטטי + Serverless**: React SPA + Functions, Python Functions + SPA  
- **מיקרו-שירותים**: [פרודקשן מיקרו-שירותים (מקורי)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **מכולתי**: [Python Flask (מקורי)](../../../examples/container-app/simple-flask-api), [Microservices (מקורי)](../../../examples/container-app/microservices)  
- **מונע AI**: **[Microsoft Foundry Models Chat (מקורי)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **טרייל מרובה סוכנים קמעונאי**  
- **ארכיטקטורה מרובת סוכנים**: **טרייל מרובה סוכנים קמעונאי**  
- **ארגון רב שירותים**: [Microservices (מקורי)](../../../examples/container-app/microservices), **טרייל מרובה סוכנים קמעונאי**  

### לפי רמת מורכבות  
- **מתחילים**: [Python Flask API (מקורי)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **בינוניים**: **[Microsoft Foundry Models Chat (מקורי)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing  
- **מתקדמים**: ML Pipeline  
- **מוכן לפרודקשן ארגוני**: [Microservices (מקורי)](../../../examples/container-app/microservices) (מערכת מרובת שירותים עם תורים להודעות), **טרייל מרובה סוכנים קמעונאי** (מערכת מרובת סוכנים מלאה עם תבנית ARM לפריסה)  

## 📚 משאבים נוספים  

### קישורי תיעוד  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [תיעוד Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [מרכז ארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### דוגמאות מהקהילה
- [תבניות דוגמאות Azure AZD](https://github.com/Azure-Samples/azd-templates)
- [תבניות Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [גלריית Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [אפליקציית Todo עם C# ו-Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [אפליקציית Todo עם Python ו-MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [אפליקציית Todo עם Node.js ו-PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [אפליקציית רשת React עם API ב-C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions עם Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### שיטות עבודה מומלצות
- [מסגרת Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [מסגרת אימוץ ענן](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 תרומת דוגמאות

יש לך דוגמה שימושית לשתף? נשמח לתרומות!

### הנחיות הגשה
1. לעקוב אחרי מבנה התיקיות הקיים
2. לכלול README.md מקיף
3. להוסיף הערות לקבצי הקונפיגורציה
4. לבדוק בהרחבה לפני ההגשה
5. לכלול הערכות עלויות ותנאים מוקדמים

### מבנה תבנית דוגמה
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**טיפ מקצועי**: התחילו עם הדוגמה הפשוטה ביותר שמתאימה לערימת הטכנולוגיה שלכם, ואז התקדמו בהדרגה לתרחישים מורכבים יותר. כל דוגמה בונה על רעיונות מהדוגמאות הקודמות!

## 🚀 מוכנים להתחיל?

### מסלול הלמידה שלך

1. **מתחילים מוחלטים?** → התחל עם [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 דקות)
2. **יש ידע בסיסי ב-AZD?** → נסה את [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 דקות)
3. **בונים אפליקציות AI?** → התחל עם [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 דקות) או חקור את [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, שעתיים ומעלה)
4. **צריך ערימת טכנולוגיה ספציפית?** → השתמש בקטע [מציאת הדוגמה הנכונה](#-finding-the-right-example) למעלה

### צעדים הבאים

- ✅ סקירת [תנאים מוקדמים](#דרישות-מוקדמות) למעלה
- ✅ בחירת דוגמה התואמת לרמת המומחיות שלך (ראה [מיתוג מורכבות](#מדרג-דרגת-הקושי))
- ✅ קריאת README של הדוגמה לעומק לפני פריסה
- ✅ הגדרת תזכורת להריץ `azd down` לאחר הבדיקה
- ✅ שיתוף הניסיון שלך דרך GitHub Issues או Discussions

### צריך עזרה?

- 📖 [שאלות נפוצות](../resources/faq.md) - תשובות לשאלות נפוצות
- 🐛 [מדריך פתרון בעיות](../docs/chapter-07-troubleshooting/common-issues.md) - תיקון בעיות פריסה
- 💬 [דיונים ב-GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - שאל את הקהילה
- 📚 [מדריך לימוד](../resources/study-guide.md) - חיזוק הלמידה שלך

---

**ניווט**
- **📚 דף הבית לקורס**: [AZD למתחילים](../README.md)
- **📖 חומרי לימוד**: [מדריך לימוד](../resources/study-guide.md) | [גליון רמזים](../resources/cheat-sheet.md) | [מילון מונחים](../resources/glossary.md)
- **🔧 משאבים**: [שאלות נפוצות](../resources/faq.md) | [פתרון בעיות](../docs/chapter-07-troubleshooting/common-issues.md)

---

*עודכן לאחרונה: נובמבר 2025 | [דווח על בעיות](https://github.com/microsoft/AZD-for-beginners/issues) | [תרום דוגמאות](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות התרגום בעזרת בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, אנא היו מודעים לכך שתירגומים אוטומטיים עלולים להכיל טעויות או אי דיוקים. המסמך המקורי בשפתו הראשית מהווה את המקור הסמכותי. למידע קריטי מומלץ תרגום מקצועי על ידי מתרגם אנושי. אנו לא נושאים באחריות לכל אי הבנה או פרשנות שגויה הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->