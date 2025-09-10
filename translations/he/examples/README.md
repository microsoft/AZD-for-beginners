<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:18:17+00:00",
  "source_file": "examples/README.md",
  "language_code": "he"
}
-->
# דוגמאות - תבניות וקונפיגורציות מעשיות של AZD

## הקדמה

התיקייה הזו מכילה דוגמאות מעשיות, תבניות ותסריטים מהעולם האמיתי שיעזרו לך ללמוד את Azure Developer CLI דרך תרגול מעשי. כל דוגמה מספקת קוד עובד מלא, תבניות תשתית והוראות מפורטות עבור ארכיטקטורות יישומים ודפוסי פריסה שונים.

## מטרות למידה

על ידי עבודה עם הדוגמאות הללו, תלמד:
- לתרגל תהליכי עבודה של Azure Developer CLI עם תסריטי יישומים מציאותיים
- להבין ארכיטקטורות יישומים שונות ואת היישום שלהן ב-azd
- לשלוט בדפוסי Infrastructure as Code עבור שירותי Azure שונים
- ליישם ניהול קונפיגורציה ואסטרטגיות פריסה מותאמות לסביבה
- ליישם דפוסי ניטור, אבטחה וסקיילינג בהקשרים מעשיים
- לצבור ניסיון בפתרון בעיות ובדיבוג תסריטי פריסה אמיתיים

## תוצאות למידה

לאחר השלמת הדוגמאות הללו, תוכל:
- לפרוס סוגי יישומים שונים באמצעות Azure Developer CLI בביטחון
- להתאים את התבניות המסופקות לדרישות היישום שלך
- לעצב וליישם דפוסי תשתית מותאמים אישית באמצעות Bicep
- להגדיר יישומים מורכבים מרובי שירותים עם תלות נכונה
- ליישם שיטות עבודה מומלצות לאבטחה, ניטור וביצועים בתסריטים אמיתיים
- לפתור בעיות ולייעל פריסות על בסיס ניסיון מעשי

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

## דוגמאות להתחלה מהירה

### למתחילים
1. **[אפליקציית ווב פשוטה - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - פריסת אפליקציית ווב Node.js Express עם MongoDB  
2. **[אתר סטטי - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - אירוח אתר סטטי React עם Azure Static Web Apps  
3. **[אפליקציית קונטיינר - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - פריסת אפליקציית Python Flask בקונטיינר  

### למשתמשים בינוניים
4. **[אפליקציית בסיס נתונים - C# עם Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - אפליקציית ווב עם API ב-C# ובסיס נתונים Azure SQL  
5. **[פונקציה ללא שרת - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - פונקציות Azure Python עם טריגרים HTTP ו-Cosmos DB  
6. **[מיקרו-שירותים - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - אפליקציית Java מרובת שירותים עם Container Apps ו-API Gateway  

### תבניות Azure AI Foundry

1. **[אפליקציית צ'אט Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - אפליקציית צ'אט חכמה עם Azure OpenAI  
2. **[עיבוד מסמכים AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - ניתוח מסמכים באמצעות שירותי Azure AI  
3. **[צינור למידת מכונה](https://github.com/Azure-Samples/mlops-v2)** - תהליך MLOps עם Azure Machine Learning  

## 📋 הוראות שימוש

### הרצת דוגמאות באופן מקומי

1. **שכפול או העתקת דוגמה**  
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **הגדרת סביבת AZD**  
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **הגדרת סביבה**  
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **פריסה**  
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### התאמת דוגמאות

כל דוגמה כוללת:
- **README.md** - הוראות מפורטות להגדרה והתאמה אישית  
- **azure.yaml** - קונפיגורציית AZD עם הערות  
- **infra/** - תבניות Bicep עם הסברים על פרמטרים  
- **src/** - קוד יישום לדוגמה  
- **scripts/** - סקריפטים עזר למשימות נפוצות  

## 🎯 מטרות למידה

### קטגוריות דוגמאות

#### **פריסות בסיסיות**
- יישומים עם שירות יחיד  
- דפוסי תשתית פשוטים  
- ניהול קונפיגורציה בסיסי  
- הגדרות פיתוח חסכוניות  

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
- סקריפטים למיגרציית בסיסי נתונים  
- כלים לאימות פריסה  
- כלי ניטור עלויות  

## 🔧 מדריך התאמה אישית

### התאמת דוגמאות לצרכים שלך

1. **סקירת דרישות מקדימות**
   - בדוק את דרישות שירותי Azure  
   - וודא מגבלות מנוי  
   - הבן השלכות עלויות  

2. **שינוי קונפיגורציה**
   - עדכן את הגדרות השירות ב-`azure.yaml`  
   - התאמה אישית של תבניות Bicep  
   - התאמת משתני סביבה  

3. **בדיקה יסודית**
   - פרוס תחילה לסביבת פיתוח  
   - אמת את הפונקציונליות  
   - בדוק סקיילינג וביצועים  

4. **סקירת אבטחה**
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

## 🎓 מסלול למידה

### התקדמות מומלצת

1. **התחל עם אפליקציית ווב פשוטה**
   - למד מושגי AZD בסיסיים  
   - הבן את תהליך הפריסה  
   - תרגל ניהול סביבה  

2. **נסה אתר סטטי**
   - חקור אפשרויות אירוח שונות  
   - למד על אינטגרציה עם CDN  
   - הבן קונפיגורציית DNS  

3. **עבור לאפליקציית קונטיינר**
   - למד את יסודות הקונטיינריזציה  
   - הבן מושגי סקיילינג  
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
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **קונטיינרים**: Python Flask Container App, Java Microservices  
- **בסיסי נתונים**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline  

### לפי דפוס ארכיטקטורה
- **מונוליטי**: Node.js Express Todo, C# Web API + SQL  
- **סטטי + ללא שרת**: React SPA + Functions, Python Functions + SPA  
- **מיקרו-שירותים**: Java Spring Boot Microservices  
- **בקונטיינר**: Python Flask Container App  
- **מונע AI**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline  

### לפי רמת מורכבות
- **מתחילים**: Node.js Express Todo, React SPA + Functions, Python Flask Container App  
- **בינוני**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing  
- **מתקדם**: ML Pipeline  

## 📚 משאבים נוספים

### קישורים לתיעוד
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [תבניות AZD של Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [תיעוד Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### דוגמאות קהילתיות
- [תבניות AZD של Azure Samples](https://github.com/Azure-Samples/azd-templates)  
- [תבניות Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [גלריית Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [אפליקציית Todo עם C# ו-Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [אפליקציית Todo עם Python ו-MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [אפליקציית Todo עם Node.js ו-PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [אפליקציית ווב React עם API ב-C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [משימת Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)  
- [פונקציות Azure עם Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### שיטות עבודה מומלצות
- [מסגרת הארכיטקטורה המומלצת של Azure](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [מסגרת אימוץ הענן](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 תרומת דוגמאות

יש לך דוגמה שימושית לשתף? נשמח לקבל תרומות!

### הנחיות להגשה
1. עקוב אחר מבנה התיקייה הקיים  
2. כלול README.md מקיף  
3. הוסף הערות לקבצי הקונפיגורציה  
4. בדוק היטב לפני ההגשה  
5. כלול הערכות עלויות ודרישות מקדימות  

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

**טיפ מקצועי**: התחל עם הדוגמה הפשוטה ביותר שמתאימה לערימת הטכנולוגיה שלך, ואז התקדם בהדרגה לתסריטים מורכבים יותר. כל דוגמה בונה על מושגים מהקודמות!

**צעדים הבאים**:  
- בחר דוגמה שמתאימה לרמת המיומנות שלך  
- עקוב אחר הוראות ההגדרה ב-README של הדוגמה  
- נסה התאמות אישיות  
- שתף את הלמידות שלך עם הקהילה  

---

**ניווט**  
- **שיעור קודם**: [מדריך לימוד](../resources/study-guide.md)  
- **חזרה ל**: [README ראשי](../README.md)  

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.