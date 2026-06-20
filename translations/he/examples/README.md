# דוגמאות - תבניות וקונפיגורציות מעשיות ל-AZD

**לומדים באמצעות דוגמאות - מאורגנות לפי פרקים**  
- **📚 דף הקורס הראשי**: [AZD למתחילים](../README.md)  
- **📖 מיפוי פרקים**: דוגמאות מאורגנות עפ"י רמת הקושי  
- **🚀 דוגמה מקומית**: [פתרון רב-סוכני קמעונאי](retail-scenario.md)  
- **🤖 דוגמאות חיצוניות של AI**: קישורים לריפוזיטורי Azure Samples  

> **📍 חשוב: דוגמאות מקומיות מול דוגמאות חיצוניות**  
> מאגר זה מכיל **4 דוגמאות מקומיות שלמות** עם מימושים מלאים:  
> - **Microsoft Foundry Models Chat** (פריסת gpt-4.1 עם ממשק צ'אט)  
> - **Container Apps** (API פשוט ב-Flask + מיקרוסרוויסים)  
> - **אפליקציית מסד נתונים** (ווב + מסד נתונים SQL)  
> - **פתרון רב-סוכני קמעונאי** (פתרון AI ארגוני)  
>  
> דוגמאות נוספות הן **הפניות חיצוניות** לריפוזיטורי Azure-Samples שניתן לשכפל.  

## הקדמה

תיקיה זו מספקת דוגמאות מעשיות והפניות שיעזרו לך ללמוד את Azure Developer CLI על ידי תרגול מעשי. תרחיש ה- Retail Multi-Agent הוא מימוש שלם ומוכן לפרודקשן הכלול במאגר זה. דוגמאות נוספות מפנות לדוגמאות רשמיות מ-Azure Samples המציגות דפוסי שימוש שונים של AZD.

### מקרא דירוג מורכבות

- ⭐ **מתחיל** - מושגים בסיסיים, שירות יחיד, 15-30 דקות  
- ⭐⭐ **בינוני** - מספר שירותים, אינטגרציית מסד נתונים, 30-60 דקות  
- ⭐⭐⭐ **מתקדם** - ארכיטקטורה מורכבת, אינטגרציית AI, שעה עד שעתיים  
- ⭐⭐⭐⭐ **מומחה** - מוכן לפרודקשן, דפוסי ארגוניים, מעל שעתיים  

## 🎯 מה באמת יש במאגר זה

### ✅ מימוש מקומי (מוכן לשימוש)

#### [אפליקציית צ'אט Microsoft Foundry Models](azure-openai-chat/README.md) 🆕  
**פריסת gpt-4.1 מלאה עם ממשק צ'אט הכלול במאגר זה**

- **מיקום:** `examples/azure-openai-chat/`  
- **מורכבות:** ⭐⭐ (בינוני)  
- **מה כלול:**  
  - פריסת Microsoft Foundry Models מלאה (gpt-4.1)  
  - ממשק שורת פקודה בצ'אט ב-Python  
  - אינטגרציה עם Key Vault למפתחות API מאובטחים  
  - תבניות תשתית ב-Bicep  
  - מעקב שימוש במטוקנים ועלות  
  - הגבלת קצב וטיפול בשגיאות  

**התחלה מהירה:**  
```bash
# נווט לדוגמה
cd examples/azure-openai-chat

# פרוס הכל
azd up

# התקן תלותיות והתחל לשוחח
pip install -r src/requirements.txt
python src/chat.py
```
  
**טכנולוגיות:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [דוגמאות ל-Container App](container-app/README.md) 🆕  
**דוגמאות מקיפות לפריסת קונטיינרים הכלולות במאגר זה**

- **מיקום:** `examples/container-app/`  
- **מורכבות:** ⭐-⭐⭐⭐⭐ (ממתחיל למתקדם)  
- **מה כלול:**  
  - [מדריך ראשי](container-app/README.md) - סקירה כוללת של פריסות קונטיינר  
  - [API פשוט ב-Flask](../../../examples/container-app/simple-flask-api) - דוגמה בסיסית ל-REST API  
  - [ארכיטקטורת מיקרוסרוויסים](../../../examples/container-app/microservices) - פריסה מוכנה לפרודקשן של מספר שירותים  
  - דפוסים של התחלה מהירה, פרודקשן, ומתקדמים  
  - ניטור, אבטחה והאופטימיזציה של עלויות  

**התחלה מהירה:**  
```bash
# הצג מדריך ראשי
cd examples/container-app

# פרוס ממשק API פשוט של Flask
cd simple-flask-api
azd up

# פרוס דוגמת מיקרו-שירותים
cd ../microservices
azd up
```
  
**טכנולוגיות:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [פתרון רב-סוכני קמעונאי](retail-scenario.md) 🆕  
**מימוש מלא ומוכן לפרודקשן הכלול במאגר זה**

- **מיקום:** `examples/retail-multiagent-arm-template/`  
- **מורכבות:** ⭐⭐⭐⭐ (מתקדם)  
- **מה כלול:**  
  - תבנית פריסת ARM שלמה  
  - ארכיטקטורת רב-סוכנית (לקוח + מלאי)  
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

## 🔗 דוגמאות חיצוניות מ-Azure Samples (לשכפול ושימוש)

הדוגמאות הבאות ניהולן בריפוזיטורי Azure-Samples הרשמיים. שכפל אותן כדי לחקור דפוסי AZD שונים:

### אפליקציות פשוטות (פרקים 1-2)

| תבנית | ריפוזיטורי | מורכבות | שירותים |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [מקומי: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **מיקרוסרוויסים** | [מקומי: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**כיצד להשתמש:**  
```bash
# לשכפל כל דוגמה
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# לפרוס
azd up
```
  
### דוגמאות לאפליקציות AI (פרקים 2, 5, 8)

| תבנית | ריפוזיטורי | מורכבות | התמקדות |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [מקומי: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | פריסת gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | צ'אט AI בסיסי |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | מסגרת סוכנים |
| **חיפוש + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | דפוס RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI ארגוני |

### מסדי נתונים ודפוסים מתקדמים (פרקים 3-8)

| תבנית | ריפוזיטורי | מורכבות | התמקדות |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | אינטגרציית מסד נתונים |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL ללא שרת |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | מיקרוסרוויסים |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## מטרות הלמידה

בלמידה דרך הדוגמאות הללו, תלמד:  
- לתרגל זרימות עבודה עם Azure Developer CLI על ידי תרחישי יישום ריאליסטיים  
- להבין ארכיטקטורות יישומים שונות ומימושי azd שלהן  
- לשלוט בדפוסי Infrastructure as Code לשירותי Azure שונים  
- ליישם אסטרטגיות ניהול קונפיגורציה ופריסת סביבות ממוקדות  
- לבצע ניטור, אבטחה ודפוסים להרחבה בהקשרים מעשיים  
- לצבור ניסיון באיתור תקלות וניפוי בעיות בתרחישי פריסה ממשיים  

## תוצאות הלמידה

בסיום הדוגמאות תהיה מסוגל לה:  
- לפרוס סוגי יישומים מגוונים בעזרת Azure Developer CLI בביטחון  
- להתאים תבניות למפרטים היישומיים שלך  
- לתכנן ולממש דפוסי תשתית מותאמים באמצעות Bicep  
- להגדיר יישומים מורכבים עם תלות נכונה בין שירותים  
- ליישם אבטחה, ניטור ופרקטיקות ביצועים מיטביות בתרחישים אמיתיים  
- לאתר תקלות, ולבצע אופטימיזציה לפריסות על בסיס ניסיון מעשי  

## מבנה התיקיה

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

> **💡 חדש ב-AZD?** התחל עם דוגמה #1 (Flask API) - לוקח כ-20 דקות ומלמד את המושגים המרכזיים.

### למתחילים  
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (מקומי) ⭐  
   פרוס REST API פשוט עם Scale-to-Zero  
   **זמן:** 20-25 דקות | **עלות:** $0-5 לחודש  
   **מה תלמד:** זרימת עבודה בסיסית של azd, קונטיינריזציה, בדיקות בריאות  
   **תוצאה צפויה:** נקודת קצה API פעילה שמחזירה "Hello, World!" עם ניטור  

2. **[אפליקציית ווב פשוטה - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   פרוס אפליקציית Node.js Express עם MongoDB  
   **זמן:** 25-35 דקות | **עלות:** $10-30 לחודש  
   **מה תלמד:** אינטגרציית מסד נתונים, משתני סביבה, מחרוזות חיבור  
   **תוצאה צפויה:** אפליקציית רשימת מטלות עם פעולות יצירה, קריאה, עדכון ומחיקה  

3. **[אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   אירוח אתר סטטי ב-React עם Azure Static Web Apps  
   **זמן:** 20-30 דקות | **עלות:** $0-10 לחודש  
   **מה תלמד:** אירוח סטטי, פונקציות ללא שרת, פריסת CDN  
   **תוצאה צפויה:** ממשק React עם API בשרת, SSL אוטומטי, CDN גלובלי  

### למשתמשים בינוניים  
4. **[אפליקציית צ'אט Microsoft Foundry Models](../../../examples/azure-openai-chat)** (מקומי) ⭐⭐  
   פרוס gpt-4.1 עם ממשק צ'אט וניהול מפתחי API מאובטח  
   **זמן:** 35-45 דקות | **עלות:** $50-200 לחודש  
   **מה תלמד:** פריסת Microsoft Foundry Models, אינטגרציה עם Key Vault, מעקב אחרי מטוקנים  
   **תוצאה צפויה:** אפליקציית צ'אט פעילה עם gpt-4.1 וניטור עלויות  

5. **[Container App - מיקרוסרוויסים](../../../examples/container-app/microservices)** (מקומי) ⭐⭐⭐⭐  
   ארכיטקטורת רב-שירותים מוכנה לפרודקשן  
   **זמן:** 45-60 דקות | **עלות:** $50-150 לחודש  
   **מה תלמד:** תקשורת בין שירותים, תורים, עקבות מבוזרות  
   **תוצאה צפויה:** מערכת 2 שירותים (API Gateway + שירות מוצר) עם ניטור  

6. **[אפליקציית מסד נתונים - C# עם Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   אפליקציית ווב עם API ב-C# ומסד נתונים Azure SQL  
   **זמן:** 30-45 דקות | **עלות:** $20-80 לחודש  
   **מה תלמד:** Entity Framework, מיגרציות מסד נתונים, אבטחת חיבור  
   **תוצאה צפויה:** API ב-C# עם מסד Azure SQL, פריסת סכימות אוטומטית  

7. **[פונקציה ללא שרת - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   פונקציות Azure בפייתון עם טריגרים HTTP ו-Cosmos DB  
   **זמן:** 30-40 דקות | **עלות:** $10-40 לחודש  
   **מה תלמד:** ארכיטקטורת אירועים, הרחבה ללא שרת, אינטגרציה עם NoSQL  
   **תוצאה צפויה:** פונקציית אפליקציה המגיבה ל-HTTP עם אחסון Cosmos DB  

8. **[מיקרוסרוויסים - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   אפליקציית Java רב שירותים עם Container Apps ו-API Gateway  
   **זמן:** 60-90 דקות | **עלות:** $80-200 לחודש  
   **מה תלמד:** פריסת Spring Boot, רשת שירותים, איזון עומסים  
   **תוצאה צפויה:** מערכת Java רב שירותית עם גילוי ושיוט שירותים  

### תבניות Microsoft Foundry

1. **[אפליקציית צ'אט Microsoft Foundry Models - דוגמה מקומית](../../../examples/azure-openai-chat)** ⭐⭐  
   פריסת gpt-4.1 מלאה עם ממשק צ'אט  
   **זמן:** 35-45 דקות | **עלות:** $50-200 לחודש  
   **תוצאה צפויה:** אפליקציית צ'אט פעילה עם מעקב מטוקנים וניטור עלויות  

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   אפליקציית צ'אט חכמה עם ארכיטקטורת RAG  
   **זמן:** 60-90 דקות | **עלות:** $100-300 לחודש  
   **תוצאה צפויה:** ממשק צ'אט מופעל ע"י RAG עם חיפוש מסמכים וציטוטים  

3. **[עיבוד מסמכים AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   ניתוח מסמכים באמצעות שירותי Azure AI  
   **זמן:** 40-60 דקות | **עלות:** $20-80 לחודש  
   **תוצאה צפויה:** API המוציא טקסט, טבלאות ויישויות ממסמכים שהועלו  

4. **[ערוץ למידת מכונה ML](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   זרימת עבודה MLOps עם Azure Machine Learning  
   **זמן:** 2-3 שעות | **עלות:** $150-500 לחודש  
   **תוצאה צפויה:** Pipeline אוטומטי ללמידת מכונה עם אימון, פריסה וניטור  

### תרחישים מהחיים

#### **פתרון רב-סוכני קמעונאי** 🆕  
**[מדריך מימוש מלא](./retail-scenario.md)**

פתרון שירות לקוחות רב-סוכני מקיף ומוכן לפרודקשן המדגים פריסת אפליקציית AI ארגונית עם AZD. התרחיש מספק:  

- **ארכיטקטורה מלאה**: מערכת רב-סוכנית עם סוכנים מתמחים בשירות לקוחות וניהול מלאי
- **תשתית ייצור**: פריסות של דגמי Microsoft Foundry באזורים מרובים, חיפוש בינה מלאכותית, אפליקציות מכולות, ומעקב מקיף  
- **תבנית ARM מוכנה לפריסה**: פריסה בלחיצה אחת עם מצבי קונפיגורציה מרובים (מינימלי/סטנדרטי/פרימיום)  
- **תכונות מתקדמות**: בדיקת אבטחה Red teaming, מסגרת הערכת סוכנים, אופטימיזציה של עלויות, ומדריכי פתרון תקלות  
- **הקשר עסקי אמיתי**: מקרה שימוש בתמיכה ללקוחות קמעונאים עם העלאת קבצים, אינטגרציית חיפוש וקנה מידה דינמי  

**טכנולוגיות**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**מורכבות**: ⭐⭐⭐⭐ (מתקדם - מוכן לייצור ארגוני)  

**מושלם עבור**: מפתחי בינה מלאכותית, אדריכלי פתרונות, וצוותים הבונים מערכות ייצור מרובות סוכנים  

**התחלה מהירה**: פרוס את הפתרון המלא תחת 30 דקות באמצעות תבנית ARM הכלולה עם `./deploy.sh -g myResourceGroup`  

## 📋 הוראות שימוש

### דרישות מקדימות

לפני הרצת כל דוגמה:  
- ✅ מנוי Azure עם גישת בעלים או משתתף  
- ✅ התקנת Azure Developer CLI ([מדריך התקנה](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop פועל (לדוגמאות מכולות)  
- ✅ מכסות Azure מתאימות (בדוק דרישות ספציפיות לדוגמה)  

> **💰 אזהרת עלויות:** כל הדוגמאות יוצרות משאבי Azure אמיתיים בעלי חיובים. ראה קבצי README נפרדים להערכת עלויות. זכור להריץ `azd down` בסיום כדי להימנע מחיובים מתמשכים.  

### הרצת דוגמאות באופן מקומי

1. **שכפל או העתק דוגמה**  
   ```bash
   # לנווט לדוגמה הרצויה
   cd examples/simple-web-app
   ```
  
2. **אתחל סביבה עם AZD**  
   ```bash
   # אתחול עם תבנית קיימת
   azd init
   
   # או יצירת סביבה חדשה
   azd env new my-environment
   ```
  
3. **הגדר סביבה**  
   ```bash
   # הגדר משתנים דרושים
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **פרוס**  
   ```bash
   # פרוס תשתית ויישום
   azd up
   ```
  
5. **ודא את הפריסה**  
   ```bash
   # קבל נקודות שירות
   azd env get-values
   
   # בדוק את נקודת הקצה (דוגמה)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **מדדי הצלחה צפויים:**  
   - ✅ `azd up` מסתיים ללא שגיאות  
   - ✅ נקודת קצה של השירות מחזירה HTTP 200  
   - ✅ פורטל Azure מציג סטטוס "רץ"  
   - ✅ Application Insights מקבלת טלמטריה  

> **⚠️ בעיות?** עיין ב-[בעיות נפוצות](../docs/chapter-07-troubleshooting/common-issues.md) לפתרון תקלות פריסה  

### התאמת דוגמאות

כל דוגמה כוללת:  
- **README.md** - הוראות הגדרה והתאמה מפורטות  
- **azure.yaml** - קונפיגורציית AZD עם הערות  
- **infra/** - תבניות Bicep עם הסברים על פרמטרים  
- **src/** - קוד אפליקציה לדוגמה  
- **scripts/** - סקריפטים עזר למשימות נפוצות  

## 🎯 מטרות למידה

### קטגוריות דוגמאות

#### **פריסות בסיסיות**  
- אפליקציות שירות יחיד  
- תבניות תשתית פשוטות  
- ניהול קונפיגורציה בסיסי  
- הגדרות פיתוח חסכוניות  

#### **תסריטים מתקדמים**  
- ארכיטקטורות מרובות שירותים  
- קונפיגורציות רשת מורכבות  
- דפוסי אינטגרציה עם מסדי נתונים  
- יישומי אבטחה וציות  

#### **תבניות מוכנות לייצור**  
- קונפיגורציות זמינות גבוהה  
- ניטור והתבוננות  
- אינטגרציית CI/CD  
- הגדרות התאוששות מאסון  

## 📖 תיאור דוגמאות

### אפליקציית ווב פשוטה - Node.js Express  
**טכנולוגיות**: Node.js, Express, MongoDB, Container Apps  
**מורכבות**: מתחיל  
**מושגים**: פריסה בסיסית, REST API, אינטגרציית NoSQL  

### אתר סטטי - React SPA  
**טכנולוגיות**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**מורכבות**: מתחיל  
**מושגים**: אירוח סטטי, backend ללא שרת, פיתוח ווב מודרני  

### אפליקציית מכולה - Python Flask  
**טכנולוגיות**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**מורכבות**: מתחיל  
**מושגים**: מיכליות, REST API, קנה מידה לאפס, בדיקות בריאות, ניטור  
**מיקום**: [דוגמה מקומית](../../../examples/container-app/simple-flask-api)  

### אפליקציית מכולה - ארכיטקטורת מיקרו-שירותים  
**טכנולוגיות**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**מורכבות**: מתקדם  
**מושגים**: ארכיטקטורה מרובת שירותים, תקשורת שירותים, תור הודעות, מעקב מבוזר  
**מיקום**: [דוגמה מקומית](../../../examples/container-app/microservices)  

### אפליקציית מסד נתונים - C# עם Azure SQL  
**טכנולוגיות**: C# ASP.NET Core, Azure SQL Database, App Service  
**מורכבות**: בינוני  
**מושגים**: Entity Framework, קישורי מסד נתונים, פיתוח API ווב  

### פונקציה ללא שרת - Python Azure Functions  
**טכנולוגיות**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**מורכבות**: בינוני  
**מושגים**: ארכיטקטורה מונעת אירועים, מחשוב ללא שרת, פיתוח מלא  

### מיקרו-שירותים - Java Spring Boot  
**טכנולוגיות**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**מורכבות**: בינוני  
**מושגים**: תקשורת מיקרו-שירותים, מערכות מבוזרות, תבניות ארגוניות  

### דוגמאות Microsoft Foundry

#### אפליקציית צ'אט לדגמי Microsoft Foundry  
**טכנולוגיות**: Microsoft Foundry Models, Azure AI Search, App Service  
**מורכבות**: בינוני  
**מושגים**: ארכיטקטורת RAG, חיפוש וקטור, אינטגרציית LLM  

#### עיבוד מסמכים עם בינה מלאכותית  
**טכנולוגיות**: Azure AI Document Intelligence, Storage, Functions  
**מורכבות**: בינוני  
**מושגים**: ניתוח מסמכים, OCR, חילוץ נתונים  

#### צינור למידת מכונה  
**טכנולוגיות**: Azure ML, MLOps, Container Registry  
**מורכבות**: מתקדם  
**מושגים**: אימון מודלים, צינורות פריסה, ניטור  

## 🛠 דוגמאות קונפיגורציה

ספריית `configurations/` מכילה רכיבים לשימוש חוזר:  

### קונפיגורציות סביבה  
- הגדרות סביבת פיתוח  
- קונפיגורציות סביבת בדיקה  
- הגדרות מוכנות לייצור  
- פריסות ריבוי אזורים  

### מודולים ביספ  
- רכיבי תשתית לשימוש חוזר  
- דפוסי משאבים נפוצים  
- תבניות מחוזקות אבטחה  
- קונפיגורציות לאופטימיזציית עלויות  

### סקריפטים עזר  
- אוטומציה להקמת סביבה  
- סקריפטים למיגרציות מסד נתונים  
- כלי אימות פריסה  
- כלים למעקב עלויות  

## 🔧 מדריך התאמה

### התאמת דוגמאות למקרה השימוש שלך

1. **סקור דרישות מקדימות**  
   - בדוק דרישות שירותי Azure  
   - אמת מגבלות מנוי  
   - הבן השלכות עלויות  

2. **שנה קונפיגורציה**  
   - עדכן הגדרות `azure.yaml`  
   - התאמת תבניות Bicep  
   - כוון משתני סביבה  

3. **בדוק ביסודיות**  
   - פרוס תחילה בסביבת פיתוח  
   - בדוק פונקציונליות  
   - הערך קנה מידה וביצועים  

4. **סקירת אבטחה**  
   - בדוק בקרות גישה  
   - הטמע ניהול סודות  
   - הפעל ניטור והתראות  

## 📊 מטריצת השוואה

| דוגמה                           | שירותים | בסיס נתונים | אימות | ניטור  | מורכבות  |
|---------------------------------|--------|-------------|-------|---------|----------|
| **Microsoft Foundry Models Chat** (מקומי)    | 2      | ❌           | Key Vault | מלא    | ⭐⭐      |
| **Python Flask API** (מקומי)                | 1      | ❌           | בסיסי  | מלא    | ⭐       |
| **Microservices** (מקומי)                    | 5+     | ✅           | ארגוני | מתקדם   | ⭐⭐⭐⭐    |
| Node.js Express Todo                        | 2      | ✅           | בסיסי  | בסיסי  | ⭐       |
| React SPA + Functions                        | 3      | ✅           | בסיסי  | מלא    | ⭐       |
| Python Flask Container                       | 2      | ❌           | בסיסי  | מלא    | ⭐       |
| C# Web API + SQL                            | 2      | ✅           | מלא    | מלא    | ⭐⭐      |
| Python Functions + SPA                       | 3      | ✅           | מלא    | מלא    | ⭐⭐      |
| Java Microservices                          | 5+     | ✅           | מלא    | מלא    | ⭐⭐      |
| Microsoft Foundry Models Chat               | 3      | ✅           | מלא    | מלא    | ⭐⭐⭐     |
| AI Document Processing                      | 2      | ❌           | בסיסי  | מלא    | ⭐⭐      |
| ML Pipeline                                | 4+     | ✅           | מלא    | מלא    | ⭐⭐⭐⭐    |
| **Retail Multi-Agent** (מקומי)              | **8+** | **✅**       | **ארגוני**| **מתקדם** | **⭐⭐⭐⭐** |

## 🎓 מסלול למידה

### התקדמות מומלצת

1. **התחל מאפליקציית ווב פשוטה**  
   - למד מושגי AZD בסיסיים  
   - הבן זרם עבודה לפריסה  
   - תרגל ניהול סביבה  

2. **נסה אתר סטטי**  
   - חקור אפשרויות אירוח שונות  
   - למד על אינטגרציה ל-CDN  
   - הבן קונפיגורציית DNS  

3. **עבור לאפליקציית מכולה**  
   - למד יסודות מיכליות  
   - הבן מושגי קנה מידה  
   - תרגל עם Docker  

4. **הוסף אינטגרציית מסד נתונים**  
   - למד הקמת מסד נתונים  
   - הבן מחרוזות חיבור  
   - תרגל ניהול סודות  

5. **חקור Serverless**  
   - הבן ארכיטקטורה מונעת אירועים  
   - למד על טריגרים וקישורים  
   - תרגל עם API  

6. **בנה מיקרו-שירותים**  
   - למד תקשורת שירותית  
   - הבן מערכות מבוזרות  
   - תרגל פריסות מורכבות  

## 🔍 מציאת הדוגמה המתאימה

### לפי ערימת טכנולוגיה  
- **Container Apps**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices (מקומי)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (מקומי)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (מקומי)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (מקומי)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Microservices User Service (מקומי)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **מכולות**: [Python Flask (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices (מקומי)](../../../examples/container-app/microservices), Java Microservices  
- **מסדי נתונים**: [Microservices (מקומי)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (מקומי)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **פתרון Retail Multi-Agent**  
- **מערכות מרובות סוכנים**: **פתרון Retail Multi-Agent**  
- **אינטגרציית OpenAI**: **[Microsoft Foundry Models Chat (מקומי)](../../../examples/azure-openai-chat)**, פתרון Retail Multi-Agent  
- **ייצור ארגוני**: [Microservices (מקומי)](../../../examples/container-app/microservices), **פתרון Retail Multi-Agent**  

### לפי תבנית ארכיטקטורה  
- **REST API פשוט**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api)  
- **מונוליטי**: Node.js Express Todo, C# Web API + SQL  
- **סטטי + Serverless**: React SPA + Functions, Python Functions + SPA  
- **מיקרו-שירותים**: [Production Microservices (מקומי)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **מכולתי**: [Python Flask (מקומי)](../../../examples/container-app/simple-flask-api), [Microservices (מקומי)](../../../examples/container-app/microservices)  
- **מונע בינה מלאכותית**: **[Microsoft Foundry Models Chat (מקומי)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **פתרון Retail Multi-Agent**  
- **ארכיטקטורת מרובי סוכנים**: **פתרון Retail Multi-Agent**  
- **ריבוי שירותים ארגוני**: [Microservices (מקומי)](../../../examples/container-app/microservices), **פתרון Retail Multi-Agent**  

### לפי רמת מורכבות  
- **מתחיל**: [Python Flask API (מקומי)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **בינוני**: **[Microsoft Foundry Models Chat (מקומי)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing  
- **מתקדם**: ML Pipeline  
- **מוכן לייצור ארגוני**: [Microservices (מקומי)](../../../examples/container-app/microservices) (רב-שירות עם תורי הודעות), **פתרון Retail Multi-Agent** (מערכת מרובת סוכנים מלאה עם פריסת תבנית ARM)  

## 📚 משאבים נוספים

### קישורים לתיעוד  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [תיעוד Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [מרכז ארכיטקטורת Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### דוגמאות מהקהילה  
- [תבניות Azure Samples AZD](https://github.com/Azure-Samples/azd-templates)  
- [תבניות Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)  
- [גלריית Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [אפליקציית Todo עם C# ו-Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [אפליקציית Todo עם Python ו-MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [אפליקציית Todo עם Node.js ו-PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [אפליקציית React עם API ב-C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions עם Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### פרקטיקות מיטביות
- [מסגרת Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [מסגרת אימוץ ענן](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 תרומת דוגמאות

יש לך דוגמה שימושית לחלוק? נשמח לתרומות!

### הנחיות הגשה
1. עקוב אחר מבנה התיקיות שהוגדר
2. כלול קובץ README.md מקיף
3. הוסף הערות לקבצי הקונפיגורציה
4. בדוק היטב לפני ההגשה
5. כלול הערכות עלות ותנאים מוקדמים

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

**טיפ מקצועי**: התחל עם הדוגמה הפשוטה ביותר המתאימה לערימת הטכנולוגיה שלך, ואז התקדם בהדרגה לתרחישים מורכבים יותר. כל דוגמה בונה על מושגים מהדוגמאות הקודמות!

## 🚀 מוכן להתחיל?

### מסלול הלמידה שלך

1. **מתחיל מוחלט?** → התחל עם [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 דקות)
2. **יש לך ידע בסיסי ב-AZD?** → נסה [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 דקות)
3. **בונה אפליקציות AI?** → התחל עם [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 דקות) או חקור את [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, יותר משעתיים)
4. **זקוק לערימת טכנולוגיה מסוימת?** → השתמש בקטגוריית [מציאת הדוגמה הנכונה](#-finding-the-right-example) למעלה

### השלבים הבאים

- ✅ בדוק את [התנאים המוקדמים](#דרישות-מקדימות) למעלה
- ✅ בחר דוגמה המתאימה לרמת המיומנות שלך (ראה [מיתוס מורכבות](#מקרא-דירוג-מורכבות))
- ✅ קרא היטב את README של הדוגמה לפני הפעלה
- ✅ קבע תזכורת להריץ `azd down` לאחר הבדיקה
- ✅ שתף את החוויה שלך דרך GitHub Issues או Discussions

### צריך עזרה?

- 📖 [שאלות נפוצות](../resources/faq.md) - תשובות לשאלות נפוצות
- 🐛 [מדריך פתרון בעיות](../docs/chapter-07-troubleshooting/common-issues.md) - פתרון בעיות בפריסה
- 💬 [דיונים ב-GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - שאל את הקהילה
- 📚 [מדריך לימודים](../resources/study-guide.md) - חיזוק הלמידה שלך

---

**ניווט**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../README.md)
- **📖 חומרי לימוד**: [מדריך לימודים](../resources/study-guide.md) | [גליון עזר](../resources/cheat-sheet.md) | [מילון מונחים](../resources/glossary.md)
- **🔧 משאבים**: [שאלות נפוצות](../resources/faq.md) | [פתרון בעיות](../docs/chapter-07-troubleshooting/common-issues.md)

---

*עודכן לאחרונה: נובמבר 2025 | [דווח על בעיות](https://github.com/microsoft/AZD-for-beginners/issues) | [תרום דוגמאות](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->