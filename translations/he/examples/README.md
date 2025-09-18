<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T07:14:40+00:00",
  "source_file": "examples/README.md",
  "language_code": "he"
}
-->
# דוגמאות - תבניות וקונפיגורציות מעשיות של AZD

**לימוד דרך דוגמאות - מאורגן לפי פרקים**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../README.md)
- **📖 מיפוי פרקים**: דוגמאות מאורגנות לפי רמת מורכבות הלמידה
- **🚀 להתחיל פשוט**: [דוגמאות פרק 1](../../../examples)
- **🤖 דוגמאות AI**: [דוגמאות פרק 2 ו-5 פתרונות AI](../../../examples)

## הקדמה

התיקייה הזו מכילה דוגמאות מעשיות, תבניות ותסריטים מהעולם האמיתי שיעזרו לך ללמוד את Azure Developer CLI דרך תרגול מעשי. כל דוגמה כוללת קוד עובד מלא, תבניות תשתית והוראות מפורטות עבור ארכיטקטורות אפליקציה ודפוסי פריסה שונים.

## מטרות למידה

על ידי עבודה עם הדוגמאות הללו, תוכל:
- לתרגל תהליכי עבודה של Azure Developer CLI עם תסריטי אפליקציה מציאותיים
- להבין ארכיטקטורות אפליקציה שונות והיישומים שלהן ב-AZD
- לשלוט בדפוסי Infrastructure as Code עבור שירותי Azure שונים
- ליישם ניהול קונפיגורציה ואסטרטגיות פריסה מותאמות לסביבה
- ליישם דפוסי ניטור, אבטחה והרחבה בהקשרים מעשיים
- לצבור ניסיון בפתרון בעיות ובדיבוג תסריטי פריסה אמיתיים

## תוצאות למידה

לאחר השלמת הדוגמאות הללו, תוכל:
- לפרוס סוגי אפליקציות שונים באמצעות Azure Developer CLI בביטחון
- להתאים את התבניות המסופקות לדרישות האפליקציה שלך
- לעצב וליישם דפוסי תשתית מותאמים אישית באמצעות Bicep
- להגדיר אפליקציות מורכבות מרובות שירותים עם תלות נכונה
- ליישם שיטות עבודה מומלצות לאבטחה, ניטור וביצועים בתסריטים אמיתיים
- לפתור בעיות ולייעל פריסות על בסיס ניסיון מעשי

## מבנה תיקייה

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

### למתחילים
1. **[אפליקציית ווב פשוטה - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - פריסת אפליקציית ווב Node.js Express עם MongoDB  
2. **[אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - אירוח אתר סטטי React עם Azure Static Web Apps  
3. **[אפליקציית קונטיינר - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - פריסת אפליקציית Python Flask בקונטיינר  

### למשתמשים בינוניים
4. **[אפליקציית בסיס נתונים - C# עם Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - אפליקציית ווב עם API ב-C# ובסיס נתונים Azure SQL  
5. **[פונקציה ללא שרת - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - פונקציות Azure Python עם טריגרים HTTP ו-Cosmos DB  
6. **[מיקרו-שירותים - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - אפליקציית Java מרובת שירותים עם Container Apps ושער API  

### תבניות Azure AI Foundry

1. **[אפליקציית צ'אט Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - אפליקציית צ'אט חכמה עם Azure OpenAI  
2. **[עיבוד מסמכים AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - ניתוח מסמכים באמצעות שירותי Azure AI  
3. **[צינור למידת מכונה](https://github.com/Azure-Samples/mlops-v2)** - תהליך MLOps עם Azure Machine Learning  

### תסריטים מהעולם האמיתי

#### **פתרון רב-סוכנים לקמעונאות** 🆕  
**[מדריך יישום מלא](./retail-scenario.md)**  

פתרון תמיכה לקוחות רב-סוכנים מקיף ומוכן לייצור שמדגים פריסת אפליקציות AI ברמה ארגונית עם AZD. התסריט הזה מספק:

- **ארכיטקטורה מלאה**: מערכת רב-סוכנים עם סוכנים מיוחדים לשירות לקוחות וניהול מלאי  
- **תשתית ייצור**: פריסות Azure OpenAI מרובות אזורים, AI Search, Container Apps וניטור מקיף  
- **תבנית ARM מוכנה לפריסה**: פריסה בלחיצה אחת עם מצבי קונפיגורציה מרובים (מינימלי/סטנדרטי/פרימיום)  
- **תכונות מתקדמות**: אימות אבטחה, מסגרת הערכת סוכנים, אופטימיזציה עלויות ומדריכי פתרון בעיות  
- **הקשר עסקי אמיתי**: תסריט תמיכה לקוחות לקמעונאים עם העלאת קבצים, אינטגרציית חיפוש והרחבה דינמית  

**טכנולוגיות**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**מורכבות**: ⭐⭐⭐⭐ (מתקדם - מוכן לייצור ארגוני)  

**מושלם עבור**: מפתחי AI, ארכיטקטי פתרונות וצוותים שבונים מערכות רב-סוכנים לייצור  

**התחלה מהירה**: פרוס את הפתרון המלא בפחות מ-30 דקות באמצעות תבנית ARM הכלולה עם `./deploy.sh -g myResourceGroup`  

## 📋 הוראות שימוש

### הרצת דוגמאות באופן מקומי

1. **שכפל או העתק דוגמה**  
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```  

2. **אתחל סביבה של AZD**  
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```  

3. **הגדר סביבה**  
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```  

4. **פרוס**  
   ```bash
   # Deploy infrastructure and application
   azd up
   ```  

### התאמת דוגמאות

כל דוגמה כוללת:
- **README.md** - הוראות מפורטות להגדרה והתאמה אישית  
- **azure.yaml** - קונפיגורציית AZD עם הערות  
- **infra/** - תבניות Bicep עם הסברים על פרמטרים  
- **src/** - קוד אפליקציה לדוגמה  
- **scripts/** - סקריפטים עזר למשימות נפוצות  

## 🎯 מטרות למידה

### קטגוריות דוגמאות

#### **פריסות בסיסיות**
- אפליקציות שירות יחיד  
- דפוסי תשתית פשוטים  
- ניהול קונפיגורציה בסיסי  
- סביבות פיתוח חסכוניות  

#### **תסריטים מתקדמים**
- ארכיטקטורות מרובות שירותים  
- קונפיגורציות רשת מורכבות  
- דפוסי אינטגרציה עם בסיסי נתונים  
- יישומי אבטחה וציות  

#### **דפוסים מוכנים לייצור**
- קונפיגורציות זמינות גבוהה  
- ניטור ותצפית  
- אינטגרציה עם CI/CD  
- הגדרות התאוששות מאסון  

## 📖 תיאורי דוגמאות

### אפליקציית ווב פשוטה - Node.js Express  
**טכנולוגיות**: Node.js, Express, MongoDB, Container Apps  
**מורכבות**: מתחילים  
**מושגים**: פריסה בסיסית, REST API, אינטגרציה עם בסיס נתונים NoSQL  

### אתר סטטי - React SPA  
**טכנולוגיות**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**מורכבות**: מתחילים  
**מושגים**: אירוח סטטי, backend ללא שרת, פיתוח ווב מודרני  

### אפליקציית קונטיינר - Python Flask  
**טכנולוגיות**: Python Flask, Docker, Container Apps, Container Registry  
**מורכבות**: מתחילים  
**מושגים**: קונטיינריזציה, ארכיטקטורת מיקרו-שירותים, פיתוח API  

### אפליקציית בסיס נתונים - C# עם Azure SQL  
**טכנולוגיות**: C# ASP.NET Core, Azure SQL Database, App Service  
**מורכבות**: בינוני  
**מושגים**: Entity Framework, חיבורי בסיס נתונים, פיתוח API ווב  

### פונקציה ללא שרת - Python Azure Functions  
**טכנולוגיות**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**מורכבות**: בינוני  
**מושגים**: ארכיטקטורה מונעת אירועים, מחשוב ללא שרת, פיתוח full-stack  

### מיקרו-שירותים - Java Spring Boot  
**טכנולוגיות**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**מורכבות**: בינוני  
**מושגים**: תקשורת בין שירותים, מערכות מבוזרות, דפוסים ארגוניים  

### דוגמאות Azure AI Foundry

#### אפליקציית צ'אט Azure OpenAI  
**טכנולוגיות**: Azure OpenAI, Cognitive Search, App Service  
**מורכבות**: בינוני  
**מושגים**: ארכיטקטורת RAG, חיפוש וקטורי, אינטגרציה עם LLM  

#### עיבוד מסמכים AI  
**טכנולוגיות**: Azure AI Document Intelligence, Storage, Functions  
**מורכבות**: בינוני  
**מושגים**: ניתוח מסמכים, OCR, חילוץ נתונים  

#### צינור למידת מכונה  
**טכנולוגיות**: Azure ML, MLOps, Container Registry  
**מורכבות**: מתקדם  
**מושגים**: אימון מודלים, צינורות פריסה, ניטור  

## 🛠 דוגמאות קונפיגורציה

התיקייה `configurations/` מכילה רכיבים לשימוש חוזר:

### קונפיגורציות סביבה
- הגדרות סביבה לפיתוח  
- קונפיגורציות סביבה לבדיקות  
- קונפיגורציות מוכנות לייצור  
- הגדרות פריסה מרובות אזורים  

### מודולי Bicep
- רכיבי תשתית לשימוש חוזר  
- דפוסי משאבים נפוצים  
- תבניות מאובטחות  
- קונפיגורציות חסכוניות  

### סקריפטים עזר
- אוטומציה להגדרת סביבה  
- סקריפטים למיגרציית בסיס נתונים  
- כלים לאימות פריסה  
- כלי ניטור עלויות  

## 🔧 מדריך התאמה אישית

### התאמת דוגמאות לצרכים שלך

1. **סקור דרישות מקדימות**
   - בדוק דרישות שירותי Azure  
   - וודא מגבלות מנוי  
   - הבן השלכות עלויות  

2. **שנה קונפיגורציה**
   - עדכן הגדרות שירות ב-`azure.yaml`  
   - התאם תבניות Bicep  
   - שנה משתני סביבה  

3. **בדוק ביסודיות**
   - פרוס קודם לסביבת פיתוח  
   - אמת פונקציונליות  
   - בדוק הרחבה וביצועים  

4. **סקור אבטחה**
   - בדוק בקרות גישה  
   - יישם ניהול סודות  
   - הפעל ניטור והתראות  

## 📊 טבלת השוואה

| דוגמה | שירותים | בסיס נתונים | אימות | ניטור | מורכבות |
|-------|---------|-------------|-------|--------|---------|
| Node.js Express Todo | 2 | ✅ | בסיסי | בסיסי | ⭐ |
| React SPA + Functions | 3 | ✅ | בסיסי | מלא | ⭐ |
| Python Flask Container | 2 | ❌ | בסיסי | מלא | ⭐ |
| C# Web API + SQL | 2 | ✅ | מלא | מלא | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | מלא | מלא | ⭐⭐ |
| Java Microservices | 5+ | ✅ | מלא | מלא | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | מלא | מלא | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | בסיסי | מלא | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | מלא | מלא | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **ארגוני** | **מתקדם** | **⭐⭐⭐⭐** |

## 🎓 מסלול למידה

### התקדמות מומלצת

1. **התחל עם אפליקציית ווב פשוטה**
   - למד מושגי AZD בסיסיים  
   - הבן תהליך פריסה  
   - תרגל ניהול סביבה  

2. **נסה אתר סטטי**
   - חקור אפשרויות אירוח שונות  
   - למד על אינטגרציית CDN  
   - הבן קונפיגורציית DNS  

3. **עבור לאפליקציית קונטיינר**
   - למד יסודות קונטיינריזציה  
   - הבן מושגי הרחבה  
   - תרגל עם Docker  

4. **הוסף אינטגרציה עם בסיס נתונים**
   - למד על הקצאת בסיסי נתונים  
   - הבן מחרוזות חיבור  
   - תרגל ניהול סודות  

5. **חקור פונקציות ללא שרת**
   - הבן ארכיטקטורה מונעת אירועים  
   - למד על טריגרים וקישורים  
   - תרגל עם APIs  

6. **בנה מיקרו-שירותים**
   - למד תקשורת בין שירותים  
   - הבן מערכות מבוזרות  
   - תרגל פריסות מורכבות  

## 🔍 מציאת הדוגמה המתאימה

### לפי טכנולוגיה
- **Node.js**: אפליקציית Node.js Express Todo  
- **Python**: אפליקציית Python Flask Container, Python Functions + SPA  
- **C#**: C# Web API + SQL Database, אפליקציית צ'אט Azure OpenAI, צינור ML  
- **Java**: מיקרו-שירותי Java Spring Boot  
- **React**: React SPA + Functions  
- **קונטיינרים**: אפליקציית Python Flask Container, מיקרו-שירותים Java  
- **בסיסי נתונים**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: אפליקציית צ'אט Azure OpenAI, עיבוד מסמכים AI, צינור ML, **פתרון רב-סוכנים לקמעונאות**  
- **מערכות רב-סוכנים**: **פתרון רב-סוכנים לקמעונאות**  
- **ייצור ארגוני**: **פתרון רב-סוכנים לקמעונאות**  

### לפי דפוס ארכיטקטורה
- **מונוליטי**: Node.js Express Todo, C# Web API + SQL  
- **סטטי + ללא שרת**: React SPA + Functions, Python Functions + SPA  
- **מיקרו-שירותים**: מיקרו-שירותי Java Spring Boot  
- **מוכוון קונטיינרים**: אפליקציית Python Flask Container  
- **מונע AI**: אפליקציית צ'אט Azure OpenAI, עיבוד מסמכים AI, צינור ML, **פתרון רב-סוכנים לקמעונאות**  
- **ארכיטקטורת רב-סוכנים**: **פתרון רב-סוכנים לקמעונאות**  
- **מרובה שירותים ארגוני**: **פתרון רב-סוכנים לקמעונאות**  

### לפי רמת מורכבות
- **מתחילים**: Node.js Express Todo, React SPA + Functions, אפליקציית Python Flask Container  
- **בינוני**: C# Web API + SQL, Python Functions + SPA, מיקרו-שירותים Java, אפליקציית צ'אט Azure OpenAI, עיבוד מסמכים AI  
- **מתקדם**: צינור ML  
- **מוכן לייצור ארגוני**: **פתרון רב-סוכנים לקמעונאות** (מערכת רב-סוכנים מלאה עם פריסת ARM)  

## 📚 משאבים נוספים

### קישורי תיעוד
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [תבניות AZD של Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [תיעוד Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [מרכז ארכיטקטורת Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### דוגמאות קהילתיות
- [תבניות AZD של Azure Samples](https://github.com/Azure-Samples/azd-templates)  
- [תבניות Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [גלריית Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [אפליקציית משימות עם C# ו-Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [אפליקציית משימות עם Python ו-MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [אפליקציית משימות עם Node.js ו-PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [אפליקציית ווב React עם API ב-C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)  
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

**טיפ מקצועי**: התחילו עם הדוגמה הפשוטה ביותר שמתאימה לטכנולוגיה שלכם, ואז התקדמו בהדרגה לתרחישים מורכבים יותר. כל דוגמה בונה על מושגים מהדוגמאות הקודמות!  

**השלבים הבאים**:  
- בחרו דוגמה שמתאימה לרמת המיומנות שלכם  
- עקבו אחר הוראות ההגדרה ב-README של הדוגמה  
- נסו לבצע התאמות אישיות  
- שתפו את התובנות שלכם עם הקהילה  

---

**ניווט**  
- **שיעור קודם**: [מדריך לימוד](../resources/study-guide.md)  
- **חזרה אל**: [README הראשי](../README.md)  

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.