# דוגמאות - תבניות וקונפיגורציות מעשיות ל-AZD

**למידה דרך דוגמאות - מאורגנת לפי פרקים**  
- **📚 דף הבית של הקורס**: [AZD למתחילים](../README.md)  
- **📖 מיפוי פרקים**: דוגמאות מאורגנות לפי רמת הקושי  
- **🚀 דוגמה מקומית**: [פתרון Multi-Agent קמעונאי](retail-scenario.md)  
- **🤖 דוגמאות AI חיצוניות**: קישורים למאגרי דוגמאות Azure  

> **📍 חשוב: דוגמאות מקומיות מול חיצוניות**  
> מאגר זה מכיל **4 דוגמאות מקומיות מלאות** עם מימושים שלמים:  
> - **Azure OpenAI Chat** (פריסה של GPT-4 עם ממשק שיחה)  
> - **Container Apps** (API פשוט ב-Flask + מיקרו-שירותים)  
> - **אפליקציית מסד נתונים** (אתר + מסד נתונים SQL)  
> - **Retail Multi-Agent** (פתרון AI ארגוני)  
>  
> דוגמאות נוספות הן **הפניות חיצוניות** למאגרי Azure-Samples אותם ניתן לשכפל.

## הקדמה

תיקייה זו מספקת דוגמאות מעשיות והפניות שיסייעו לכם ללמוד את Azure Developer CLI באמצעות תרגול מעשי. תרחיש Retail Multi-Agent הוא מימוש שלם ומוכן לפרודקשן שמכלולו כלול במאגר זה. דוגמאות נוספות מפנות למאגרי Azure רשמיים המציגים תבניות שונות של AZD.

### אגד דרגת קושי

- ⭐ **מתחיל** - מושגים בסיסיים, שירות יחיד, 15-30 דקות  
- ⭐⭐ **בינוני** - מספר שירותים, אינטגרציית מסד נתונים, 30-60 דקות  
- ⭐⭐⭐ **מתקדם** - ארכיטקטורה מורכבת, אינטגרציית AI, 1-2 שעות  
- ⭐⭐⭐⭐ **מומחה** - מוכן לפרודקשן, תבניות ארגוניות, מעל 2 שעות  

## 🎯 מה באמת נמצא במאגר זה

### ✅ מימוש מקומי (מוכן לשימוש)

#### [אפליקציית Azure OpenAI Chat](azure-openai-chat/README.md) 🆕  
**פריסה מלאה של GPT-4 עם ממשק שיחה כלול במאגר זה**

- **מיקום:** `examples/azure-openai-chat/`  
- **רמת קושי:** ⭐⭐ (בינוני)  
- **מה כלול:**  
  - פריסה מלאה של Azure OpenAI (GPT-4)  
  - ממשק שיחה בקו הפקודה בפייתון  
  - אינטגרציה עם Key Vault למפתחות API מאובטחים  
  - תבניות תשתית ב-Bicep  
  - מעקב שימוש ואיתור עלויות  
  - הגבלת קצב וטיפול בשגיאות  

**התחלה מהירה:**  
```bash
# נווט לדוגמה
cd examples/azure-openai-chat

# פרוס הכל
azd up

# התקן תלות והתחל לשוחח
pip install -r src/requirements.txt
python src/chat.py
```
  
**טכנולוגיות:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep  

#### [דוגמאות ל-Container App](container-app/README.md) 🆕  
**דוגמאות מקיפות לפריסות container כלולות במאגר זה**

- **מיקום:** `examples/container-app/`  
- **רמת קושי:** ⭐-⭐⭐⭐⭐ (מתחיל עד מתקדם)  
- **מה כלול:**  
  - [מדריך ראשי](container-app/README.md) - סקירה מלאה של פריסות container  
  - [API פשוט ב-Flask](../../../examples/container-app/simple-flask-api) - דוגמת REST API בסיסית  
  - [ארכיטקטורה מיקרו-שירותית](../../../examples/container-app/microservices) - פריסה מוכנה לפרודקשן מרובת שירותים  
  - דפוסי התחלה מהירה, פרודקשן ומתקדמים  
  - ניטור, אבטחה ואופטימיזציה של עלויות  

**התחלה מהירה:**  
```bash
# הצג מדריך ראשי
cd examples/container-app

# פרוס API פשוט של Flask
cd simple-flask-api
azd up

# פרוס דוגמה למיקרו-שירותים
cd ../microservices
azd up
```
  
**טכנולוגיות:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [פתרון Retail Multi-Agent](retail-scenario.md) 🆕  
**מימוש מלא ומוכן לפרודקשן כלול במאגר זה**

- **מיקום:** `examples/retail-multiagent-arm-template/`  
- **רמת קושי:** ⭐⭐⭐⭐ (מתקדם)  
- **מה כלול:**  
  - תבנית פריסה מלאה ב-ARM  
  - ארכיטקטורת multi-agent (לקוח + מלאי)  
  - אינטגרציה ל-Azure OpenAI  
  - חיפוש AI עם RAG  
  - ניטור מקיף  
  - סקריפט פריסה בלחיצת כפתור  

**התחלה מהירה:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**טכנולוגיות:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 דוגמאות רשמיות של Azure (לשכפול ולהפעלה)

הדוגמאות הבאות מתוחזקות במאגרי Azure-Samples הרשמיים. שיכפלו אותם כדי לחקור תבניות AZD שונות:

### אפליקציות פשוטות (פרקים 1-2)

| תבנית | מאגר | רמת קושי | שירותים |  
|:---------|:-----------|:-----------|:---------|  
| **Python Flask API** | [מקומי: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |  
| **Microservices** | [מקומי: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | מיקרו-שירותים, Service Bus, Cosmos DB, SQL |  
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |  
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |  
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |  

**איך להשתמש:**  
```bash
# שכפל כל דוגמה
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# פרוס
azd up
```
  
### דוגמאות ליישומי AI (פרקים 2, 5, 8)

| תבנית | מאגר | רמת קושי | התמקדות |  
|:---------|:-----------|:-----------|:------|  
| **Azure OpenAI Chat** | [מקומי: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | פריסת GPT-4 |  
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | שיחת AI בסיסית |  
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | מסגרת סוכן |  
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | דפוס RAG |  
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI ארגוני |  

### מסדי נתונים ודפוסי מתקדמים (פרקים 3-8)

| תבנית | מאגר | רמת קושי | התמקדות |  
|:---------|:-----------|:-----------|:------|  
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | אינטגרציית מסד נתונים |  
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL ללא שרתים |  
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | מיקרו-שירותים |  
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |  

## מטרות למידה

באמצעות עבודה על דוגמאות אלו תוכלו:  
- לתרגל תהליכי עבודה עם Azure Developer CLI בסצנות יישומיות מציאותיות  
- להבין ארכיטקטורות יישומים שונות ואת מימושי azd שלהן  
- להשתלט על דפוסי Infrastructure as Code לשירותי Azure שונים  
- ליישם ניהול תצורה ואסטרטגיות פריסה מותאמות לסביבות שונות  
- להטמיע דפוסי ניטור, אבטחה וקנה מידה בהקשרים מעשיים  
- לצבור ניסיון באיתור תקלות ודיבוג בסצנות פריסה אמיתיות  

## תוצאות למידה

בסיום דוגמאות אלו תוכלו:  
- לפרוס סוגי יישומים שונים באמצעות Azure Developer CLI בביטחון  
- להתאים תבניות לסביבת היישום שלכם  
- לעצב ולממש תבניות תשתית מותאמות אישית באמצעות Bicep  
- להגדיר יישומים מרובי שירותים עם תלות נכונה  
- ליישם אבטחה, ניטור ונהלי ביצועים מיטביים בסצנות אמיתיות  
- לאתר ולשפר פריסות על סמך ניסיון מעשי  

## מבנה התיקייה

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
  
## דוגמאות התחלה מהירה

> **💡 חדש ב-AZD?** התחילו עם דוגמה #1 (Flask API) - לוקח כ-20 דקות ולומדים מושגי יסוד.

### למתחילים  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (מקומי) ⭐  
   לפרוס REST API פשוט עם scale-to-zero  
   **זמן:** 20-25 דקות | **עלות:** 0-5$ לחודש  
   **תלמדו:** תהליך עבודה בסיסי עם azd, קונטיינריזציה, בדיקת בריאות  
   **תוצאה צפויה:** נקודת קצה API פעילה שמחזירה "Hello, World!" עם ניטור  

2. **[אפליקציית ווב פשוטה - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   לפרוס אפליקציית ווב ב-Node.js Express עם MongoDB  
   **זמן:** 25-35 דקות | **עלות:** 10-30$ לחודש  
   **תלמדו:** אינטגרציה למסד נתונים, משתני סביבה, מחרוזות חיבור  
   **תוצאה צפויה:** אפליקציית רשימת מטלות עם פעולות CRUD  

3. **[אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   לארח אתר סטטי ב-React באמצעות Azure Static Web Apps  
   **זמן:** 20-30 דקות | **עלות:** 0-10$ לחודש  
   **תלמדו:** אירוח סטטי, פונקציות ללא שרת, פריסת CDN  
   **תוצאה צפויה:** ממשק React עם backend API, SSL אוטומטי, CDN גלובלי  

### למשתמשים בינוניים  
4. **[אפליקציית Azure OpenAI Chat](../../../examples/azure-openai-chat)** (מקומי) ⭐⭐  
   לפרוס GPT-4 עם ממשק שיחה וניהול מפתחות API מאובטח  
   **זמן:** 35-45 דקות | **עלות:** 50-200$ לחודש  
   **תלמדו:** פריסת Azure OpenAI, אינטגרציה עם Key Vault, מעקב אחר אסימונים  
   **תוצאה צפויה:** אפליקציית שיחה פעילה עם GPT-4 ומעקב עלויות  

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (מקומי) ⭐⭐⭐⭐  
   ארכיטקטורה מוכנה לפרודקשן עם מספר שירותים  
   **זמן:** 45-60 דקות | **עלות:** 50-150$ לחודש  
   **תלמדו:** תקשורת שירותים, תור הודעות, מעקב מבוזר  
   **תוצאה צפויה:** מערכת עם שני שירותים (API Gateway + שירות מוצר) עם ניטור  

6. **[אפליקציית מסד נתונים - C# עם Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   אפליקציית ווב עם API ב-C# ומסד נתונים Azure SQL  
   **זמן:** 30-45 דקות | **עלות:** 20-80$ לחודש  
   **תלמדו:** Entity Framework, מיגרציות מסד נתונים, אבטחת חיבורים  
   **תוצאה צפויה:** API ב-C# עם backend של Azure SQL ופריסת סכימה אוטומטית  

7. **[פונקציה ללא שרת - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   פונקציות Python ב-Azure עם טריגרים HTTP ו-Cosmos DB  
   **זמן:** 30-40 דקות | **עלות:** 10-40$ לחודש  
   **תלמדו:** ארכיטקטורה מבוססת אירועים, קנה מידה ללא שרת, אינטגרציית NoSQL  
   **תוצאה צפויה:** אפליקציית פונקציות שמגיבה לבקשות HTTP עם אחסון Cosmos DB  

8. **[מיקרו-שירותים - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   אפליקציית Java מרובת שירותים עם Container Apps ו-API gateway  
   **זמן:** 60-90 דקות | **עלות:** 80-200$ לחודש  
   **תלמדו:** פריסת Spring Boot, רשת שירותים, איזון עומסים  
   **תוצאה צפויה:** מערכת Java עם גילוי שירותים וניתוב  

### תבניות Microsoft Foundry

1. **[אפליקציית Azure OpenAI Chat - דוגמה מקומית](../../../examples/azure-openai-chat)** ⭐⭐  
   פריסה מלאה של GPT-4 עם ממשק שיחה  
   **זמן:** 35-45 דקות | **עלות:** 50-200$ לחודש  
   **תוצאה צפויה:** אפליקציית שיחה פעילה עם מעקב אסימונים וניטור עלויות  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   אפליקציית שיחה חכמה מבוססת ארכיטקטורת RAG  
   **זמן:** 60-90 דקות | **עלות:** 100-300$ לחודש  
   **תוצאה צפויה:** ממשק שיחה מבוסס RAG עם חיפוש מסמכים וציטוטים  

3. **[עיבוד מסמכים AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   ניתוח מסמכים באמצעות שירותי AI של Azure  
   **זמן:** 40-60 דקות | **עלות:** 20-80$ לחודש  
   **תוצאה צפויה:** API המחלץ טקסט, טבלאות ויישויות ממסמכים שהועלו  

4. **[צינור למידת מכונה](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   תהליך MLOps עם Azure Machine Learning  
   **זמן:** 2-3 שעות | **עלות:** 150-500$ לחודש  
   **תוצאה צפויה:** צינור ML אוטומטי עם אימון, פריסה וניטור  

### תרחישים מהעולם האמיתי

#### **פתרון Retail Multi-Agent** 🆕  
**[מדריך מימוש מלא](./retail-scenario.md)**

פתרון תמיכה בלקוחות מבוסס multi-agent מקיף ומוכן לפרודקשן, המדגים פריסת יישום AI ברמה ארגונית עם AZD. תרחיש זה מספק:  

- **ארכיטקטורה מלאה**: מערכת multi-agent עם סוכני שירות לקוחות וניהול מלאי מתמחים
- **תשתית ייצור**: פריסות Azure OpenAI רב-אזוריות, חיפוש מבוסס AI, Container Apps, וניטור מקיף  
- **תבנית ARM מוכנה לפריסה**: פריסה בלחיצה אחת עם מספר מצבי קונפיגורציה (מינימלי/סטנדרטי/פרימיום)  
- **תכונות מתקדמות**: אימות אבטחה באמצעות Red Teaming, מסגרת הערכת סוכנים, אופטימיזציה של עלויות ומדריכי פתרון תקלות  
- **הקשר עסקי אמיתי**: מקרה שימוש בתמיכת לקוחות קמעונאים עם העלאות קבצים, אינטגרציית חיפוש, וקנה מידה דינמי  

**טכנולוגיות**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**מורכבות**: ⭐⭐⭐⭐ (מורכב - מוכן לייצור ארגוני)  

**מומלץ עבור**: מפתחי AI, ארכיטקטי פתרונות, וצוותים הבונים מערכות מרובות סוכנים לייצור  

**התחלה מהירה**: פרס את הפתרון המלא בפחות מ-30 דקות באמצעות תבנית ARM הכלולה עם `./deploy.sh -g myResourceGroup`  

## 📋 הוראות שימוש  

### דרישות מוקדמות  

לפני הרצת כל דוגמה:  
- ✅ מנוי Azure עם הרשאות Owner או Contributor  
- ✅ התקנת Azure Developer CLI ([מדריך התקנה](../docs/chapter-01-foundation/installation.md))  
- ✅ הפעלת Docker Desktop (לדוגמאות המבוססות מכולות)  
- ✅ שמישות מתאימה במכסת Azure (בדוק דרישות ספציפיות לדוגמה)  

> **💰 אזהרת עלויות:** כל הדוגמאות יוצרות משאבים אמיתיים ב-Azure שגובים תשלום. ראה קבצי README נפרדים להערכת עלויות. זכור להריץ `azd down` בסיום כדי למנוע עלויות מתמשכות.  

### הרצת דוגמאות מקומית  

1. **שכפל או העתק את הדוגמה**  
   ```bash
   # נווט לדוגמה הרצויה
   cd examples/simple-web-app
   ```
  
2. **אתחל את סביבת AZD**  
   ```bash
   # אתחול עם תבנית קיימת
   azd init
   
   # או יצירת סביבה חדשה
   azd env new my-environment
   ```
  
3. **קנפג את הסביבה**  
   ```bash
   # הגדר משתנים נדרשים
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **פרוס**  
   ```bash
   # לפרוס תשתיות ויישום
   azd up
   ```
  
5. **אמת את הפריסה**  
   ```bash
   # קבל נקודות קצה של שירות
   azd env get-values
   
   # בדוק את נקודת הקצה (דוגמה)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **מדדי הצלחה צפויים:**  
   - ✅ `azd up` מסתיים ללא שגיאות  
   - ✅ נקודת הקצה של השירות מחזירה HTTP 200  
   - ✅ פורטל Azure מציג סטטוס "Running"  
   - ✅ Application Insights מקבל טלמטריה  

> **⚠️ בעיות?** ראה את [בעיות נפוצות](../docs/chapter-07-troubleshooting/common-issues.md) לפתרון תקלות בפריסה  

### התאמת דוגמאות  

כל דוגמה כוללת:  
- **README.md** - הוראות מפורטות להגדרה והתאמה  
- **azure.yaml** - קונפיגורציית AZD עם הערות  
- **infra/** - תבניות Bicep עם הסברים לפרמטרים  
- **src/** - קוד דוגמה של האפליקציה  
- **scripts/** - סקריפטים עזר למשימות נפוצות  

## 🎯 מטרות למידה  

### קטגוריות דוגמאות  

#### **פריסות בסיסיות**  
- אפליקציות שירות בודד  
- תבניות תשתית פשוטות  
- ניהול קונפיגורציה בסיסי  
- סביבות פיתוח חסכוניות  

#### **תסריטים מתקדמים**  
- ארכיטקטורת מרובי שירותים  
- קונפיגורציות רשת מורכבות  
- דפוסי אינטגרציה עם מסדי נתונים  
- יישום אבטחה וציות  

#### **תבניות מוכנות לייצור**  
- קונפיגורציות זמינות גבוהה  
- ניטור ותצפית  
- אינטגרציית CI/CD  
- תרחישי שחזור מאסון  

## 📖 תיאורי דוגמאות  

### אפליקציית ווב פשוטה - Node.js Express  
**טכנולוגיות**: Node.js, Express, MongoDB, Container Apps  
**מורכבות**: מתחילים  
**מושגים**: פריסה בסיסית, REST API, אינטגרציה עם NoSQL  

### אתר סטטי - React SPA  
**טכנולוגיות**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**מורכבות**: מתחילים  
**מושגים**: אירוח סטטי, Backend ללא שרת, פיתוח ווב מודרני  

### Container App - Python Flask  
**טכנולוגיות**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**מורכבות**: מתחילים  
**מושגים**: מכולות, REST API, קנה מידה ל-0, בדיקות בריאות, ניטור  
**מיקום**: [דוגמה מקומית](../../../examples/container-app/simple-flask-api)  

### Container App - ארכיטקטורת מיקרו-שירותים  
**טכנולוגיות**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**מורכבות**: מתקדם  
**מושגים**: ארכיטקטורת שירותים מרובים, תקשורת שירותים, תורים של הודעות, עקבות מבוזרות  
**מיקום**: [דוגמה מקומית](../../../examples/container-app/microservices)  

### אפליקציית מסד נתונים - C# עם Azure SQL  
**טכנולוגיות**: C# ASP.NET Core, Azure SQL Database, App Service  
**מורכבות**: בינוני  
**מושגים**: Entity Framework, חיבורי מסד נתונים, פיתוח Web API  

### פונקציית Serverless - Python Azure Functions  
**טכנולוגיות**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**מורכבות**: בינוני  
**מושגים**: ארכיטקטורת Event-driven, מחשוב ללא שרת, פיתוח full-stack  

### מיקרו-שירותים - Java Spring Boot  
**טכנולוגיות**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**מורכבות**: בינוני  
**מושגים**: תקשורת מיקרו-שירותים, מערכות מבוזרות, תבניות ארגוניות  

### דוגמאות Microsoft Foundry  

#### אפליקציית צ’אט Azure OpenAI  
**טכנולוגיות**: Azure OpenAI, Cognitive Search, App Service  
**מורכבות**: בינוני  
**מושגים**: ארכיטקטורת RAG, חיפוש וקטורי, אינטגרציית LLM  

#### עיבוד מסמכים AI  
**טכנולוגיות**: Azure AI Document Intelligence, Storage, Functions  
**מורכבות**: בינוני  
**מושגים**: ניתוח מסמכים, OCR, חילוץ נתונים  

#### צינור למידת מכונה  
**טכנולוגיות**: Azure ML, MLOps, Container Registry  
**מורכבות**: מתקדם  
**מושגים**: אימון מודלים, צינורות פריסה, ניטור  

## 🛠 דוגמאות קונפיגורציה  

תיקיית `configurations/` מכילה רכיבים לשימוש חוזר:  

### קונפיגורציות סביבתיות  
- הגדרות סביבות פיתוח  
- קונפיגורציות סביבות Staging  
- קונפיגורציות מוכנות לייצור  
- פריסות רב-אזוריות  

### מודולי Bicep  
- רכיבי תשתית לשימוש חוזר  
- תבניות משאבים נפוצות  
- תבניות מוקשחות לאבטחה  
- קונפיגורציות מיטוב עלויות  

### סקריפטים לעזר  
- אוטומציה להגדרת סביבה  
- סקריפטים להיגררות מסד נתונים  
- כלים לאימות פריסות  
- כלי ניטור עלויות  

## 🔧 מדריך התאמה  

### התאמת דוגמאות למקרה השימוש שלך  

1. **בדוק דרישות מוקדמות**  
   - דרישות שירותי Azure  
   - מגבלות מנוי  
   - הבנת השלכות עלויות  

2. **שנה קונפיגורציה**  
   - עדכן הגדרות ב-`azure.yaml`  
   - התאמה אישית של תבניות Bicep  
   - שינוי משתני סביבה  

3. **בדוק בקפידה**  
   - פריסת ראשונית לסביבת פיתוח  
   - אימות פונקציונליות  
   - בדיקות סקיילינג וביצועים  

4. **סקירת אבטחה**  
   - סקור בקרות גישה  
   - יישום ניהול סודות  
   - הפעלת ניטור והתראות  

## 📊 טבלת השוואה  

| דוגמה                  | שירותים | מסד נתונים | אימות     | ניטור | מורכבות  |  
|------------------------|---------|------------|-----------|-------|----------|  
| **Azure OpenAI Chat** (מקומי) | 2       | ❌         | Key Vault | מלא   | ⭐⭐       |  
| **Python Flask API** (מקומי)   | 1       | ❌         | בסיסי     | מלא   | ⭐        |  
| **Microservices** (מקומי)      | 5+      | ✅         | ארגוני    | מתקדם | ⭐⭐⭐⭐     |  
| Node.js Express Todo           | 2       | ✅         | בסיסי     | בסיסי | ⭐        |  
| React SPA + Functions          | 3       | ✅         | בסיסי     | מלא   | ⭐        |  
| Python Flask Container         | 2       | ❌         | בסיסי     | מלא   | ⭐        |  
| C# Web API + SQL              | 2       | ✅         | מלא       | מלא   | ⭐⭐       |  
| Python Functions + SPA         | 3       | ✅         | מלא       | מלא   | ⭐⭐       |  
| Java Microservices             | 5+      | ✅         | מלא       | מלא   | ⭐⭐       |  
| Azure OpenAI Chat              | 3       | ✅         | מלא       | מלא   | ⭐⭐⭐      |  
| AI Document Processing        | 2       | ❌         | בסיסי     | מלא   | ⭐⭐       |  
| ML Pipeline                   | 4+      | ✅         | מלא       | מלא   | ⭐⭐⭐⭐     |  
| **Retail Multi-Agent** (מקומי) | **8+**  | **✅**     | **ארגוני** | **מתקדם** | **⭐⭐⭐⭐** |  

## 🎓 מסלול למידה  

### המלצות להתקדמות  

1. **התחל מאפליקציית ווב פשוטה**  
   - למד מושגי בסיס של AZD  
   - הבן את רצף הפריסה  
   - תרגל ניהול סביבה  

2. **נסה אתר סטטי**  
   - חקור אפשרויות אירוח שונות  
   - למד על אינטגרציית CDN  
   - הבן קונפיגורציית DNS  

3. **עבור לאפליקציית Container**  
   - למד יסודות מכולות  
   - הבן מושגי קנה מידה  
   - תרגל עבודה עם Docker  

4. **הוסף אינטגרציית מסד נתונים**  
   - למד פרוביז’נינג מסדי נתונים  
   - הבן מחרוזות חיבור  
   - תרגל ניהול סודות  

5. **חקור Serverless**  
   - הבן ארכיטקטורת event-driven  
   - למד על טריגרים וקישורים  
   - תרגל עם APIs  

6. **בנה מיקרו-שירותים**  
   - למד תקשורת שירותים  
   - הבן מערכות מבוזרות  
   - תרגל פריסות מורכבות  

## 🔍 מציאת הדוגמה הנכונה  

### לפי ערכת טכנולוגיה  
- **Container Apps**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices (מקומי)](../../../examples/container-app/microservices), מיקרו-שירותים Java  
- **Node.js**: אפליקציית Node.js Express Todo, [Microservices API Gateway (מקומי)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (מקומי)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (מקומי)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Microservices User Service (מקומי)](../../../examples/container-app/microservices)  
- **Java**: מיקרו-שירותים Java Spring Boot  
- **React**: React SPA + Functions  
- **מכולות**: [Python Flask (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices (מקומי)](../../../examples/container-app/microservices), מיקרו-שירותים Java  
- **מסדי נתונים**: [Microservices (מקומי)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (מקומי)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, עיבוד מסמכים AI, ML Pipeline, **פתרון רב-סוכן לקמעונאות**  
- **מערכות מרובי סוכנים**: **פתרון רב-סוכן לקמעונאות**  
- **אינטגרציית OpenAI**: **[Azure OpenAI Chat (מקומי)](../../../examples/azure-openai-chat)**, פתרון רב-סוכן לקמעונאות  
- **ייצור ארגוני**: [Microservices (מקומי)](../../../examples/container-app/microservices), **פתרון רב-סוכן לקמעונאות**  

### לפי תבנית ארכיטקטורה  
- **REST API פשוט**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api)  
- **מונוליתית**: Node.js Express Todo, C# Web API + SQL  
- **סטטי + Serverless**: React SPA + Functions, Python Functions + SPA  
- **מיקרו-שירותים**: [Production Microservices (מקומי)](../../../examples/container-app/microservices), מיקרו-שירותים Java Spring Boot  
- **מכולות**: [Python Flask (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices (מקומי)](../../../examples/container-app/microservices)  
- **מבוסס AI**: **[Azure OpenAI Chat (מקומי)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, עיבוד מסמכים AI, ML Pipeline, **פתרון רב-סוכן לקמעונאות**  
- **ארכיטקטורת רב-סוכנים**: **פתרון רב-סוכן לקמעונאות**  
- **ארגון רב-שירותים**: [Microservices (מקומי)](../../../examples/container-app/microservices), **פתרון רב-סוכן לקמעונאות**  

### לפי רמת מורכבות  
- **מתחילים**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **בינוניים**: **[Azure OpenAI Chat (מקומי)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, מיקרו-שירותים Java, Azure OpenAI Chat App, עיבוד מסמכים AI  
- **מתקדמים**: ML Pipeline  
- **מוכן לייצור ארגוני**: [Microservices (מקומי)](../../../examples/container-app/microservices) (רב-שירותים עם תור הודעות), **פתרון רב-סוכן לקמעונאות** (מערכת רב-סוכנים מלאה עם פריסת ARM)  

## 📚 משאבים נוספים  

### קישורי תיעוד  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [תיעוד Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### דוגמאות מהקהילה  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [גלריית Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [אפליקציית Todo עם C# ו-Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [אפליקציית Todo עם Python ו-MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [אפליקציית Todo עם Node.js ו-PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [אפליקציית React עם API ב-C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions עם Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### שיטות עבודה מומלצות
- [מסגרת Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [מסגרת אימוץ ענן](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 תרומת דוגמאות

יש לך דוגמה שימושית לשתף? נשמח לתרומות!

### הנחיות להגשה
1. עקוב אחר מבנה התיקיות המוסכם
2. כלול README.md מקיף
3. הוסף הערות לקבצי התצורה
4. בדוק היטב לפני ההגשה
5. כלול הערכות עלות ודרישות מוקדמות

### מבנה תבנית הדוגמה
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

**טיפ מקצועי**: התחל עם הדוגמה הפשוטה ביותר שתואמת את טכנולוגייתך, ואז התקדם בהדרגה לתרחישים מורכבים יותר. כל דוגמה בונה על מושגים מהקודמות לה!

## 🚀 מוכן להתחיל?

### מסלול הלמידה שלך

1. **מתחיל מוחלט?** → התחל עם [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 דקות)
2. **יש ידע בסיסי ב-AZD?** → נסה [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 דקות)
3. **בונה אפליקציות AI?** → התחל עם [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 דקות) או חקור [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, שעתיים ומעלה)
4. **צריך טכנולוגיית ספציפית?** → השתמש בסעיף [מציאת הדוגמה הנכונה](../../../examples) למעלה

### השלבים הבאים

- ✅ עיין ב-[דרישות מוקדמות](../../../examples) למעלה
- ✅ בחר דוגמה התואמת לרמת המיומנות שלך (ראה [מדד מורכבות](../../../examples))
- ✅ קרא את ה-README של הדוגמה היטב לפני הפריסה
- ✅ הגדר תזכורת להריץ `azd down` לאחר הבדיקה
- ✅ שתף את החוויות שלך דרך GitHub Issues או Discussions

### צריך עזרה?

- 📖 [שאלות נפוצות](../resources/faq.md) - תשובות לשאלות נפוצות
- 🐛 [מדריך לפתרון תקלות](../docs/chapter-07-troubleshooting/common-issues.md) - טפל בבעיות פריסה
- 💬 [דיונים ב-GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - שאל את הקהילה
- 📚 [מדריך ללמידה](../resources/study-guide.md) - חיזוק הידע שלך

---

**ניווט**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../README.md)
- **📖 חומרי לימוד**: [מדריך ללמידה](../resources/study-guide.md) | [גליון רמאי](../resources/cheat-sheet.md) | [מילון מונחים](../resources/glossary.md)
- **🔧 משאבים**: [שאלות נפוצות](../resources/faq.md) | [פתרון בעיות](../docs/chapter-07-troubleshooting/common-issues.md)

---

*עודכן לאחרונה: נובמבר 2025 | [דווח על בעיות](https://github.com/microsoft/AZD-for-beginners/issues) | [תרום דוגמאות](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור אחריות**:  
מסמך זה תורגם באמצעות שירות התרגום באמצעות בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון כי תרגומים אוטומטיים עשויים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפתו הטבעית נחשב למקור המוסמך. למידע קריטי מומלץ להיעזר בתרגום מקצועי של אדם. אנו אינם אחראים לכל אי-הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->