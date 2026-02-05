# דוגמאות - תבניות וקונפיגורציות מעשיות של AZD

**לימוד דרך דוגמאות - מאורגן לפי פרקים**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../README.md)
- **📖 מיפוי פרקים**: דוגמאות מאורגנות לפי רמת מורכבות הלמידה
- **🚀 דוגמה מקומית**: [פתרון רב-סוכנים לקמעונאות](retail-scenario.md)
- **🤖 דוגמאות AI חיצוניות**: קישורים למאגרי דוגמאות של Azure

> **📍 חשוב: דוגמאות מקומיות מול חיצוניות**  
> מאגר זה מכיל **4 דוגמאות מקומיות מלאות** עם יישומים מלאים:  
> - **Azure OpenAI Chat** (פריסת GPT-4 עם ממשק צ'אט)  
> - **Container Apps** (API פשוט של Flask + מיקרו-שירותים)  
> - **Database App** (אפליקציה אינטרנטית + מסד נתונים SQL)  
> - **Retail Multi-Agent** (פתרון AI ארגוני)  
>  
> דוגמאות נוספות הן **הפניות חיצוניות** למאגרי Azure-Samples שניתן לשכפל.

## מבוא

תיקייה זו מספקת דוגמאות מעשיות והפניות שיעזרו לכם ללמוד את Azure Developer CLI דרך תרגול מעשי. תרחיש רב-הסוכנים לקמעונאות הוא יישום מלא ומוכן לייצור הכלול במאגר זה. דוגמאות נוספות מפנות לדוגמאות רשמיות של Azure שמדגימות דפוסי AZD שונים.

### מדריך דירוג מורכבות

- ⭐ **מתחילים** - מושגים בסיסיים, שירות יחיד, 15-30 דקות
- ⭐⭐ **בינוני** - מספר שירותים, אינטגרציה עם מסד נתונים, 30-60 דקות
- ⭐⭐⭐ **מתקדם** - ארכיטקטורה מורכבת, אינטגרציה עם AI, 1-2 שעות
- ⭐⭐⭐⭐ **מומחה** - מוכן לייצור, דפוסים ארגוניים, 2+ שעות

## 🎯 מה באמת נמצא במאגר הזה

### ✅ יישום מקומי (מוכן לשימוש)

#### [אפליקציית צ'אט Azure OpenAI](azure-openai-chat/README.md) 🆕
**פריסת GPT-4 מלאה עם ממשק צ'אט כלול במאגר זה**

- **מיקום:** `examples/azure-openai-chat/`
- **מורכבות:** ⭐⭐ (בינוני)
- **מה כלול:**
  - פריסת Azure OpenAI מלאה (GPT-4)
  - ממשק צ'אט מבוסס Python
  - אינטגרציה עם Key Vault לאבטחת מפתחות API
  - תבניות תשתית Bicep
  - מעקב אחר שימוש בטוקנים ועלויות
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

**טכנולוגיות:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [דוגמאות לאפליקציות קונטיינר](container-app/README.md) 🆕
**דוגמאות פריסה מקיפות של קונטיינרים כלולות במאגר זה**

- **מיקום:** `examples/container-app/`
- **מורכבות:** ⭐-⭐⭐⭐⭐ (מתחילים עד מומחים)
- **מה כלול:**
  - [מדריך ראשי](container-app/README.md) - סקירה מלאה של פריסות קונטיינרים
  - [API פשוט של Flask](../../../examples/container-app/simple-flask-api) - דוגמת REST API בסיסית
  - [ארכיטקטורת מיקרו-שירותים](../../../examples/container-app/microservices) - פריסה רב-שירותית מוכנה לייצור
  - דפוסי התחלה מהירה, ייצור ודפוסים מתקדמים
  - ניטור, אבטחה ואופטימיזציה של עלויות

**התחלה מהירה:**
```bash
# צפה במדריך הראשי
cd examples/container-app

# פרוס API פשוט של Flask
cd simple-flask-api
azd up

# פרוס דוגמה למיקרו-שירותים
cd ../microservices
azd up
```

**טכנולוגיות:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [פתרון רב-סוכנים לקמעונאות](retail-scenario.md) 🆕
**יישום מלא ומוכן לייצור כלול במאגר זה**

- **מיקום:** `examples/retail-multiagent-arm-template/`
- **מורכבות:** ⭐⭐⭐⭐ (מתקדם)
- **מה כלול:**
  - תבנית פריסה ARM מלאה
  - ארכיטקטורת רב-סוכנים (לקוח + מלאי)
  - אינטגרציה עם Azure OpenAI
  - חיפוש AI עם RAG
  - ניטור מקיף
  - סקריפט פריסה בלחיצה אחת

**התחלה מהירה:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**טכנולוגיות:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 דוגמאות חיצוניות של Azure (לשכפול ושימוש)

הדוגמאות הבאות מתוחזקות במאגרי Azure-Samples רשמיים. שכפלו אותן כדי לחקור דפוסי AZD שונים:

### אפליקציות פשוטות (פרקים 1-2)

| תבנית | מאגר | מורכבות | שירותים |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [מקומי: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **מיקרו-שירותים** | [מקומי: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | רב-שירותי, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**איך להשתמש:**
```bash
# שיבוט כל דוגמה
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# פרוס
azd up
```

### דוגמאות אפליקציות AI (פרקים 2, 5, 8)

| תבנית | מאגר | מורכבות | מיקוד |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [מקומי: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | פריסת GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | צ'אט AI בסיסי |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | מסגרת סוכנים |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | דפוס RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI ארגוני |

### מסדי נתונים ודפוסים מתקדמים (פרקים 3-8)

| תבנית | מאגר | מורכבות | מיקוד |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | אינטגרציה עם מסד נתונים |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL ללא שרת |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | רב-שירותי |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## מטרות למידה

על ידי עבודה עם דוגמאות אלו, תלמדו:
- לתרגל זרימות עבודה של Azure Developer CLI עם תרחישי אפליקציות מציאותיים
- להבין ארכיטקטורות אפליקציות שונות ויישומי AZD שלהן
- לשלוט בדפוסי תשתית כקוד עבור שירותי Azure שונים
- ליישם ניהול קונפיגורציה ואסטרטגיות פריסה ספציפיות לסביבה
- ליישם דפוסי ניטור, אבטחה והרחבה בהקשרים מעשיים
- לצבור ניסיון עם פתרון בעיות ודיוג תרחישי פריסה אמיתיים

## תוצאות למידה

לאחר השלמת הדוגמאות, תוכלו:
- לפרוס סוגי אפליקציות שונים באמצעות Azure Developer CLI בביטחון
- להתאים את התבניות המסופקות לדרישות האפליקציה שלכם
- לעצב וליישם דפוסי תשתית מותאמים אישית באמצעות Bicep
- להגדיר אפליקציות רב-שירותיות מורכבות עם תלות נכונה
- ליישם שיטות עבודה מומלצות לאבטחה, ניטור וביצועים בתרחישים אמיתיים
- לפתור בעיות ולייעל פריסות על בסיס ניסיון מעשי

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

## דוגמאות התחלה מהירה

> **💡 חדש ב-AZD?** התחילו עם דוגמה #1 (Flask API) - לוקח כ-20 דקות ומלמד מושגים בסיסיים.

### למתחילים
1. **[אפליקציית קונטיינר - Python Flask API](../../../examples/container-app/simple-flask-api)** (מקומי) ⭐  
   פרסו REST API פשוט עם scale-to-zero  
   **זמן:** 20-25 דקות | **עלות:** $0-5 לחודש  
   **מה תלמדו:** זרימת עבודה בסיסית של azd, קונטיינריזציה, בדיקות בריאות  
   **תוצאה צפויה:** נקודת קצה API פעילה שמחזירה "Hello, World!" עם ניטור

2. **[אפליקציית אינטרנט פשוטה - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   פרסו אפליקציית אינטרנט Node.js Express עם MongoDB  
   **זמן:** 25-35 דקות | **עלות:** $10-30 לחודש  
   **מה תלמדו:** אינטגרציה עם מסד נתונים, משתני סביבה, מחרוזות חיבור  
   **תוצאה צפויה:** אפליקציית רשימת משימות עם פונקציות יצירה/קריאה/עדכון/מחיקה

3. **[אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   אירחו אתר סטטי React עם Azure Static Web Apps  
   **זמן:** 20-30 דקות | **עלות:** $0-10 לחודש  
   **מה תלמדו:** אירוח סטטי, פונקציות ללא שרת, פריסת CDN  
   **תוצאה צפויה:** ממשק React עם API אחורי, SSL אוטומטי, CDN גלובלי

### למשתמשים בינוניים
4. **[אפליקציית צ'אט Azure OpenAI](../../../examples/azure-openai-chat)** (מקומי) ⭐⭐  
   פרסו GPT-4 עם ממשק צ'אט וניהול מפתחות API מאובטח  
   **זמן:** 35-45 דקות | **עלות:** $50-200 לחודש  
   **מה תלמדו:** פריסת Azure OpenAI, אינטגרציה עם Key Vault, מעקב טוקנים  
   **תוצאה צפויה:** אפליקציית צ'אט פעילה עם GPT-4 וניטור עלויות

5. **[אפליקציית קונטיינר - מיקרו-שירותים](../../../examples/container-app/microservices)** (מקומי) ⭐⭐⭐⭐  
   ארכיטקטורה רב-שירותית מוכנה לייצור  
   **זמן:** 45-60 דקות | **עלות:** $50-150 לחודש  
   **מה תלמדו:** תקשורת בין שירותים, תורים להודעות, מעקב מבוזר  
   **תוצאה צפויה:** מערכת דו-שירותית (API Gateway + Product Service) עם ניטור

6. **[אפליקציית מסד נתונים - C# עם Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   אפליקציית אינטרנט עם API ב-C# ומסד נתונים Azure SQL  
   **זמן:** 30-45 דקות | **עלות:** $20-80 לחודש  
   **מה תלמדו:** Entity Framework, מיגרציות מסד נתונים, אבטחת חיבורים  
   **תוצאה צפויה:** API ב-C# עם מסד נתונים Azure SQL, פריסת סכימה אוטומטית

7. **[פונקציה ללא שרת - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   פונקציות Azure Python עם טריגרים HTTP ו-Cosmos DB  
   **זמן:** 30-40 דקות | **עלות:** $10-40 לחודש  
   **מה תלמדו:** ארכיטקטורה מונעת אירועים, הרחבה ללא שרת, אינטגרציה עם NoSQL  
   **תוצאה צפויה:** אפליקציית פונקציה שמגיבה לבקשות HTTP עם אחסון ב-Cosmos DB

8. **[מיקרו-שירותים - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   אפליקציית Java רב-שירותית עם Container Apps ו-API Gateway  
   **זמן:** 60-90 דקות | **עלות:** $80-200 לחודש  
   **מה תלמדו:** פריסת Spring Boot, רשת שירותים, איזון עומסים  
   **תוצאה צפויה:** מערכת Java רב-שירותית עם גילוי שירותים וניתוב

### תבניות Azure AI Foundry

1. **[אפליקציית צ'אט Azure OpenAI - דוגמה מקומית](../../../examples/azure-openai-chat)** ⭐⭐  
   פריסת GPT-4 מלאה עם ממשק צ'אט  
   **זמן:** 35-45 דקות | **עלות:** $50-200 לחודש  
   **תוצאה צפויה:** אפליקציית צ'אט פעילה עם מעקב טוקנים וניטור עלויות

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   אפליקציית צ'אט חכמה עם ארכיטקטורת RAG  
   **זמן:** 60-90 דקות | **עלות:** $100-300 לחודש  
   **תוצאה צפויה:** ממשק צ'אט מבוסס RAG עם חיפוש מסמכים וציטוטים

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   ניתוח מסמכים באמצעות שירותי Azure AI  
   **זמן:** 40-60 דקות | **עלות:** $20-80 לחודש  
   **תוצאה צפויה:** API שמפיק טקסט, טבלאות וישויות ממסמכים שהועלו

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   זרימת עבודה של MLOps עם Azure Machine Learning  
   **זמן:** 2-3 שעות | **עלות:** $150-500 לחודש  
   **תוצאה צפויה:** צינור ML אוטומטי עם אימון, פריסה וניטור

### תרחישים מציאותיים

#### **פתרון רב-סוכנים לקמעונאות** 🆕
**[מדריך יישום מלא](./retail-scenario.md)**

פתרון תמיכה לקוחות רב-סוכנים מקיף ומוכן לייצור שמדגים פריסת אפליקציות AI ארגוניות ברמה גבוהה עם AZD. תרחיש זה מספק:

- **ארכיטקטורה מלאה**: מערכת רב-סוכנים עם סוכנים ייעודיים לשירות לקוחות וניהול מלאי
- **תשתית ייצור**: פריסות Azure OpenAI מרובות אזורים, חיפוש AI, אפליקציות מכולות וניטור מקיף  
- **תבנית ARM מוכנה לפריסה**: פריסה בלחיצה אחת עם מצבי תצורה מרובים (מינימלי/סטנדרטי/פרימיום)  
- **תכונות מתקדמות**: אימות אבטחה (Red Teaming), מסגרת הערכת סוכנים, אופטימיזציית עלויות ומדריכי פתרון בעיות  
- **הקשר עסקי אמיתי**: מקרה שימוש בתמיכת לקוחות קמעונאית עם העלאת קבצים, שילוב חיפוש וסקיילינג דינמי  

**טכנולוגיות**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**מורכבות**: ⭐⭐⭐⭐ (מתקדם - מוכן לייצור ארגוני)  

**מושלם עבור**: מפתחי AI, אדריכלי פתרונות וצוותים הבונים מערכות סוכנים מרובות לייצור  

**התחלה מהירה**: פרס את הפתרון המלא בפחות מ-30 דקות באמצעות תבנית ARM הכלולה עם `./deploy.sh -g myResourceGroup`  

## 📋 הוראות שימוש  

### דרישות מוקדמות  

לפני הרצת כל דוגמה:  
- ✅ מנוי Azure עם גישת Owner או Contributor  
- ✅ Azure Developer CLI מותקן ([מדריך התקנה](../docs/getting-started/installation.md))  
- ✅ Docker Desktop פועל (לדוגמאות מכולות)  
- ✅ מכסות Azure מתאימות (בדוק דרישות ספציפיות לדוגמה)  

> **💰 אזהרת עלות:** כל הדוגמאות יוצרות משאבי Azure אמיתיים שגורמים לחיובים. ראה קבצי README בודדים להערכות עלות. זכור להריץ `azd down` בסיום כדי להימנע מעלויות מתמשכות.  

### הרצת דוגמאות מקומית  

1. **שכפל או העתק דוגמה**  
   ```bash
   # נווט לדוגמה הרצויה
   cd examples/simple-web-app
   ```
  
2. **אתחל סביבה של AZD**  
   ```bash
   # אתחל עם תבנית קיימת
   azd init
   
   # או צור סביבה חדשה
   azd env new my-environment
   ```
  
3. **הגדר סביבה**  
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
  
5. **וודא פריסה**  
   ```bash
   # קבל נקודות קצה של שירות
   azd env get-values
   
   # בדוק את נקודת הקצה (דוגמה)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **אינדיקטורים להצלחה צפויה:**  
   - ✅ `azd up` מסתיים ללא שגיאות  
   - ✅ נקודת הקצה של השירות מחזירה HTTP 200  
   - ✅ פורטל Azure מציג סטטוס "פועל"  
   - ✅ Application Insights מקבל טלמטריה  

> **⚠️ בעיות?** ראה [בעיות נפוצות](../docs/troubleshooting/common-issues.md) לפתרון בעיות בפריסה  

### התאמת דוגמאות  

כל דוגמה כוללת:  
- **README.md** - הוראות מפורטות להגדרה והתאמה אישית  
- **azure.yaml** - תצורת AZD עם הערות  
- **infra/** - תבניות Bicep עם הסברים על פרמטרים  
- **src/** - קוד אפליקציה לדוגמה  
- **scripts/** - סקריפטים עזר למשימות נפוצות  

## 🎯 מטרות למידה  

### קטגוריות דוגמאות  

#### **פריסות בסיסיות**  
- אפליקציות שירות יחיד  
- תבניות תשתית פשוטות  
- ניהול תצורה בסיסי  
- הגדרות פיתוח חסכוניות  

#### **תרחישים מתקדמים**  
- ארכיטקטורות מרובות שירותים  
- תצורות רשת מורכבות  
- תבניות שילוב מסדי נתונים  
- יישומי אבטחה וציות  

#### **תבניות מוכנות לייצור**  
- תצורות זמינות גבוהה  
- ניטור ותצפית  
- שילוב CI/CD  
- הגדרות התאוששות מאסון  

## 📖 תיאורי דוגמאות  

### אפליקציית ווב פשוטה - Node.js Express  
**טכנולוגיות**: Node.js, Express, MongoDB, Container Apps  
**מורכבות**: מתחילים  
**מושגים**: פריסה בסיסית, REST API, שילוב מסד נתונים NoSQL  

### אתר סטטי - React SPA  
**טכנולוגיות**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**מורכבות**: מתחילים  
**מושגים**: אירוח סטטי, backend serverless, פיתוח ווב מודרני  

### אפליקציית מכולה - Python Flask  
**טכנולוגיות**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**מורכבות**: מתחילים  
**מושגים**: קונטיינריזציה, REST API, scale-to-zero, בדיקות בריאות, ניטור  
**מיקום**: [דוגמה מקומית](../../../examples/container-app/simple-flask-api)  

### אפליקציית מכולה - ארכיטקטורת מיקרו-שירותים  
**טכנולוגיות**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**מורכבות**: מתקדם  
**מושגים**: ארכיטקטורת שירותים מרובים, תקשורת שירותים, תורים להודעות, מעקב מבוזר  
**מיקום**: [דוגמה מקומית](../../../examples/container-app/microservices)  

### אפליקציית מסד נתונים - C# עם Azure SQL  
**טכנולוגיות**: C# ASP.NET Core, Azure SQL Database, App Service  
**מורכבות**: בינוני  
**מושגים**: Entity Framework, חיבורי מסד נתונים, פיתוח Web API  

### פונקציה Serverless - Python Azure Functions  
**טכנולוגיות**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**מורכבות**: בינוני  
**מושגים**: ארכיטקטורה מונעת אירועים, מחשוב serverless, פיתוח full-stack  

### מיקרו-שירותים - Java Spring Boot  
**טכנולוגיות**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**מורכבות**: בינוני  
**מושגים**: תקשורת מיקרו-שירותים, מערכות מבוזרות, תבניות ארגוניות  

### דוגמאות Azure AI Foundry  

#### אפליקציית צ'אט Azure OpenAI  
**טכנולוגיות**: Azure OpenAI, Cognitive Search, App Service  
**מורכבות**: בינוני  
**מושגים**: ארכיטקטורת RAG, חיפוש וקטורי, שילוב LLM  

#### עיבוד מסמכים AI  
**טכנולוגיות**: Azure AI Document Intelligence, Storage, Functions  
**מורכבות**: בינוני  
**מושגים**: ניתוח מסמכים, OCR, חילוץ נתונים  

#### צינור למידת מכונה  
**טכנולוגיות**: Azure ML, MLOps, Container Registry  
**מורכבות**: מתקדם  
**מושגים**: אימון מודלים, צינורות פריסה, ניטור  

## 🛠 דוגמאות תצורה  

התיקייה `configurations/` מכילה רכיבים לשימוש חוזר:  

### תצורות סביבה  
- הגדרות סביבה לפיתוח  
- תצורות סביבה לבדיקות  
- תצורות מוכנות לייצור  
- הגדרות פריסה מרובות אזורים  

### מודולי Bicep  
- רכיבי תשתית לשימוש חוזר  
- תבניות משאבים נפוצות  
- תבניות מחוזקות אבטחה  
- תצורות אופטימיזציית עלויות  

### סקריפטים עזר  
- אוטומציה להגדרת סביבה  
- סקריפטים למיגרציית מסדי נתונים  
- כלים לאימות פריסה  
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
   - עדכן משתני סביבה  

3. **בדוק ביסודיות**  
   - פרוס תחילה לסביבת פיתוח  
   - אמת פונקציונליות  
   - בדוק סקיילינג וביצועים  

4. **סקירת אבטחה**  
   - בדוק בקרות גישה  
   - יישם ניהול סודות  
   - הפעל ניטור והתראות  

## 📊 טבלת השוואה  

| דוגמה | שירותים | מסד נתונים | אימות | ניטור | מורכבות |  
|-------|---------|------------|-------|--------|----------|  
| **Azure OpenAI Chat** (מקומי) | 2 | ❌ | Key Vault | מלא | ⭐⭐ |  
| **Python Flask API** (מקומי) | 1 | ❌ | בסיסי | מלא | ⭐ |  
| **Microservices** (מקומי) | 5+ | ✅ | ארגוני | מתקדם | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | בסיסי | בסיסי | ⭐ |  
| React SPA + Functions | 3 | ✅ | בסיסי | מלא | ⭐ |  
| Python Flask Container | 2 | ❌ | בסיסי | מלא | ⭐ |  
| C# Web API + SQL | 2 | ✅ | מלא | מלא | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | מלא | מלא | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | מלא | מלא | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | מלא | מלא | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | בסיסי | מלא | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | מלא | מלא | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (מקומי) | **8+** | **✅** | **ארגוני** | **מתקדם** | **⭐⭐⭐⭐** |  

## 🎓 מסלול למידה  

### התקדמות מומלצת  

1. **התחל עם אפליקציית ווב פשוטה**  
   - למד מושגי AZD בסיסיים  
   - הבן את תהליך הפריסה  
   - תרגל ניהול סביבות  

2. **נסה אתר סטטי**  
   - חקור אפשרויות אירוח שונות  
   - למד על שילוב CDN  
   - הבן תצורת DNS  

3. **עבור לאפליקציית מכולה**  
   - למד את יסודות הקונטיינריזציה  
   - הבן מושגי סקיילינג  
   - תרגל עם Docker  

4. **הוסף שילוב מסד נתונים**  
   - למד פריסת מסדי נתונים  
   - הבן מחרוזות חיבור  
   - תרגל ניהול סודות  

5. **חקור Serverless**  
   - הבן ארכיטקטורה מונעת אירועים  
   - למד על טריגרים וקישורים  
   - תרגל עם APIs  

6. **בנה מיקרו-שירותים**  
   - למד תקשורת שירותים  
   - הבן מערכות מבוזרות  
   - תרגל פריסות מורכבות  

## 🔍 מציאת הדוגמה המתאימה  

### לפי טכנולוגיה  
- **אפליקציות מכולות**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices (מקומי)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (מקומי)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (מקומי)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (מקומי)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Microservices User Service (מקומי)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **מכולות**: [Python Flask (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices (מקומי)](../../../examples/container-app/microservices), Java Microservices  
- **מסדי נתונים**: [Microservices (מקומי)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (מקומי)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **מערכות מרובות סוכנים**: **Retail Multi-Agent Solution**  
- **שילוב OpenAI**: **[Azure OpenAI Chat (מקומי)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **ייצור ארגוני**: [Microservices (מקומי)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### לפי תבנית ארכיטקטורה  
- **REST API פשוט**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api)  
- **מונוליטי**: Node.js Express Todo, C# Web API + SQL  
- **סטטי + Serverless**: React SPA + Functions, Python Functions + SPA  
- **מיקרו-שירותים**: [Production Microservices (מקומי)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **מכולות**: [Python Flask (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices (מקומי)](../../../examples/container-app/microservices)  
- **מונע AI**: **[Azure OpenAI Chat (מקומי)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **ארכיטקטורת סוכנים מרובים**: **Retail Multi-Agent Solution**  
- **שירותים מרובים ארגוניים**: [Microservices (מקומי)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### לפי רמת מורכבות  
- **מתחילים**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **בינוני**: **[Azure OpenAI Chat (מקומי)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing  
- **מתקדם**: ML Pipeline  
- **מוכן לייצור ארגוני**: [Microservices (מקומי)](../../../examples/container-app/microservices) (שירותים מרובים עם תורים להודעות), **Retail Multi-Agent Solution** (מערכת סוכנים מרובים מלאה עם פריסת ARM template)  

## 📚 משאבים נוספים  

### קישורים לתיעוד  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [תיעוד Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### דוגמאות קהילה  
- [תבניות AZD של Azure Samples](https://github.com/Azure-Samples/azd-templates)  
- [תבניות Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [גלריית Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [אפליקציית Todo עם C# ו-Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [אפליקציית Todo עם Python ו-MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [אפליקציית משימות עם Node.js ו-PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [אפליקציית ווב React עם API ב-C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [משימות Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions עם Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### שיטות עבודה מומלצות  
- [מסגרת הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [מסגרת אימוץ הענן](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 דוגמאות לתרומה  

יש לכם דוגמה שימושית לשתף? נשמח לקבל תרומות!  

### הנחיות להגשה  
1. עקבו אחר מבנה התיקיות הקיים  
2. כללו README.md מפורט  
3. הוסיפו הערות לקבצי הקונפיגורציה  
4. בדקו היטב לפני ההגשה  
5. כללו הערכות עלויות ודרישות מקדימות  

### מבנה תבנית לדוגמה  
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

**טיפ מקצועי**: התחילו עם הדוגמה הפשוטה ביותר שמתאימה לטכנולוגיה שלכם, ואז עברו בהדרגה לתרחישים מורכבים יותר. כל דוגמה בונה על מושגים מהקודמת!  

## 🚀 מוכנים להתחיל?  

### מסלול הלמידה שלכם  

1. **מתחילים לגמרי?** → התחילו עם [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 דקות)  
2. **יש לכם ידע בסיסי ב-AZD?** → נסו [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 דקות)  
3. **בונים אפליקציות AI?** → התחילו עם [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 דקות) או חקרו [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, יותר מ-2 שעות)  
4. **צריכים טכנולוגיה ספציפית?** → השתמשו בקטע [מציאת הדוגמה הנכונה](../../../examples) למעלה  

### צעדים הבאים  

- ✅ עברו על [דרישות מקדימות](../../../examples) למעלה  
- ✅ בחרו דוגמה שמתאימה לרמת המיומנות שלכם (ראו [אגדת מורכבות](../../../examples))  
- ✅ קראו את README של הדוגמה היטב לפני הפריסה  
- ✅ קבעו תזכורת להריץ `azd down` לאחר הבדיקה  
- ✅ שתפו את החוויה שלכם דרך GitHub Issues או Discussions  

### צריכים עזרה?  

- 📖 [שאלות נפוצות](../resources/faq.md) - תשובות לשאלות נפוצות  
- 🐛 [מדריך פתרון תקלות](../docs/troubleshooting/common-issues.md) - תיקון בעיות בפריסה  
- 💬 [דיונים ב-GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - שאלו את הקהילה  
- 📚 [מדריך לימוד](../resources/study-guide.md) - חיזוק הלמידה שלכם  

---

**ניווט**  
- **📚 דף הקורס**: [AZD למתחילים](../README.md)  
- **📖 חומרי לימוד**: [מדריך לימוד](../resources/study-guide.md) | [דף עזר](../resources/cheat-sheet.md) | [מילון מונחים](../resources/glossary.md)  
- **🔧 משאבים**: [שאלות נפוצות](../resources/faq.md) | [פתרון תקלות](../docs/troubleshooting/common-issues.md)  

---

*עודכן לאחרונה: נובמבר 2025 | [דווחו על בעיות](https://github.com/microsoft/AZD-for-beginners/issues) | [תרמו דוגמאות](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. איננו אחראים לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->