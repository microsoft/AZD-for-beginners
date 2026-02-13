# פריסה של מסד נתונים Microsoft SQL ואפליקציית ווב באמצעות AZD

⏱️ **זמן משוער**: 20-30 דקות | 💰 **עלות משוערת**: ~15-25$ לחודש | ⭐ **מורכבות**: בינוני

הדוגמה **המלאה והעובדת** הזו מדגימה כיצד להשתמש ב-[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) כדי לפרוס אפליקציית ווב ב-Python Flask עם מסד נתונים Microsoft SQL ל-Azure. כל הקוד כלול ונבדק—לא נדרשות תלות חיצונית.

## מה תלמדו

בסיום דוגמה זו, תוכל:
- לפרוס אפליקציה רב-שכבתית (אפליקציית ווב + מסד נתונים) באמצעות Infrastructure-as-Code
- להגדיר חיבורי מסד נתונים מאובטחים ללא הצפנת סודות בתוך הקוד
- לנטר את בריאות האפליקציה עם Application Insights
- לנהל משאבי Azure ביעילות עם AZD CLI
- לפעול לפי שיטות העבודה המומלצות של Azure לאבטחה, אופטימיזציה של עלויות וצפייה

## סקירת התרחיש
- **אפליקציית ווב**: REST API ב-Python Flask עם חיבור למסד נתונים
- **מסד הנתונים**: Azure SQL Database עם נתוני דוגמה
- **תשתית**: פרוסה באמצעות Bicep (תבניות מודולריות וניתנות לשימוש חוזר)
- **פריסה**: אוטומטית במלואה בעזרת פקודות `azd`
- **ניטור**: Application Insights ללוגים וטלטמטריה

## דרישות מוקדמות

### כלים נדרשים

לפני התחלה, וודאו שהתקנתם את הכלים הבאים:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (גרסה 2.50.0 ומעלה)
   ```sh
   az --version
   # פלט צפוי: azure-cli גרסה 2.50.0 או גבוהה יותר
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (גרסה 1.0.0 ומעלה)
   ```sh
   azd version
   # פלט צפוי: גרסת azd 1.0.0 או גבוהה יותר
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (לפיתוח מקומי)
   ```sh
   python --version
   # פלט צפוי: פייתון 3.8 או גרסה גבוהה יותר
   ```

4. **[Docker](https://www.docker.com/get-started)** (אופציונלי, לפיתוח מקומי במכולות)
   ```sh
   docker --version
   # פלט צפוי: גרסת דוקר 20.10 או גבוהה יותר
   ```

### דרישות Azure

- מנוי **Azure פעיל** ([צור חשבון חינם](https://azure.microsoft.com/free/))
- הרשאות ליצירת משאבים במנוי שלך
- תפקיד **בעלים** או **משתתף** על המנוי או קבוצת המשאבים

### דרישות ידע

זו דוגמה **בינונית-רמת**. מומלץ להכיר:
- פעולות שורת פקודה בסיסיות
- מושגי ענן בסיסיים (משאבים, קבוצות משאבים)
- הבנה בסיסית של אפליקציות ווב ומסדי נתונים

**חדש ב-AZD?** התחילו עם [מדריך התחלת העבודה](../../docs/chapter-01-foundation/azd-basics.md).

## ארכיטקטורה

בדוגמה זו מתפרסת ארכיטקטורה דו-שכבתית עם אפליקציית ווב ומסד נתונים SQL:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**פריסת משאבים:**
- **קבוצת משאבים**: מיכל לכל המשאבים
- **תוכנית App Service**: אירוח מבוסס Linux (דרגת B1 לחיסכון בעלויות)
- **אפליקציית ווב**: סביבת ריצה Python 3.11 עם אפליקציית Flask
- **שרת SQL**: שרת מסד נתונים מנוהל עם TLS 1.2 מינימום
- **מסד נתונים SQL**: דרגת Basic (2GB, מתאים לפיתוח/בדיקות)
- **Application Insights**: ניטור ולוגים
- **Workpace של Log Analytics**: אחסון מרכזי ללוגים

**אנלוגיה**: חשבו על זה כמו מסעדה (אפליקציית ווב) עם מקפיא גדול (מסד הנתונים). הלקוחות מזמינים מהתפריט (נקודות קצה של API), והמטבח (אפליקציית Flask) שולף מרכיבים (נתונים) מהמקפיא. מנהל המסעדה (Application Insights) עוקב אחרי כל מה שקורה.

## מבנה התיקיות

כל הקבצים כלולים בדוגמה זו—לא נדרשות תלות חיצונית:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**מה כל קובץ עושה:**
- **azure.yaml**: מגדיר ל-AZD מה לפרוס ולאן
- **infra/main.bicep**: מנחה את כל משאבי Azure
- **infra/resources/*.bicep**: הגדרות משאב בודדים (מודולריות לשימוש חוזר)
- **src/web/app.py**: אפליקציית Flask עם לוגיקת מסד נתונים
- **requirements.txt**: תלות חבילות Python
- **Dockerfile**: הוראות קונטיינר לפריסה

## התחלה מהירה (שלב-אחר-שלב)

### שלב 1: שכפול וניווט

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ בדיקת הצלחה**: ודא שאתה רואה את `azure.yaml` ואת תיקיית `infra/`:
```sh
ls
# צפוי: README.md, azure.yaml, infra/, src/
```

### שלב 2: התחברות ל-Azure

```sh
azd auth login
```

זה פתח את הדפדפן לאימות ב-Azure. היכנס עם פרטי Azure שלך.

**✓ בדיקת הצלחה**: תראה:
```
Logged in to Azure.
```

### שלב 3: אתחול הסביבה

```sh
azd init
```

**מה קורה**: AZD יוצר הגדרה מקומית לפריסה שלך.

**שאלות שתקבל**:
- **שם הסביבה**: הכנס שם קצר (למשל, `dev`, `myapp`)
- **מנוי Azure**: בחר את המנוי מהרשימה
- **מיקום Azure**: בחר אזור (למשל, `eastus`, `westeurope`)

**✓ בדיקת הצלחה**: תראה:
```
SUCCESS: New project initialized!
```

### שלב 4: פריסת משאבי Azure

```sh
azd provision
```

**מה קורה**: AZD מפריס את כל התשתית (אורך זמן 5-8 דקות):
1. יוצר קבוצת משאבים
2. יוצר שרת SQL ומסד נתונים
3. יוצר תוכנית App Service
4. יוצר אפליקציית ווב
5. יוצר Application Insights
6. מגדיר רשת ואבטחה

**תתבקש לספק**:
- **שם משתמש מנהל SQL**: הכנס שם משתמש (למשל, `sqladmin`)
- **סיסמת מנהל SQL**: הכנס סיסמה חזקה (שמור אותה!)

**✓ בדיקת הצלחה**: תראה:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ זמן**: 5-8 דקות

### שלב 5: פריסת האפליקציה

```sh
azd deploy
```

**מה קורה**: AZD בונה ומפריס את אפליקציית Flask שלך:
1. מארז את אפליקציית ה-Python
2. בונה את מכולת ה-Docker
3. דוחף לאפליקציית ווב ב-Azure
4. מאתחל את מסד הנתונים עם נתוני דוגמה
5. מפעיל את האפליקציה

**✓ בדיקת הצלחה**: תראה:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ זמן**: 3-5 דקות

### שלב 6: גלישה לאפליקציה

```sh
azd browse
```

זה פותח את אפליקציית הווב שהופעלה בדפדפן בכתובת `https://app-<unique-id>.azurewebsites.net`

**✓ בדיקת הצלחה**: תראה פלט JSON:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### שלב 7: בדיקת נקודות קצה של ה-API

**בדיקת בריאות** (ודא חיבור למסד הנתונים):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**תגובה צפויה**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**רשימת מוצרים** (נתוני דוגמה):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**תגובה צפויה**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**קבלת מוצר יחיד**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ בדיקת הצלחה**: כל נקודות הקצה מחזירות נתוני JSON ללא שגיאות.

---

**🎉 ברכות!** פרסת בהצלחה אפליקציית ווב עם מסד נתונים ל-Azure באמצעות AZD.

## ניתוח הגדרות

### משתני סביבה

סודות מנוהלים בצורה מאובטחת דרך הגדרות Azure App Service—**מעולם לא מוצפנים ישירות בקוד המקור**.

**מוגדר אוטומטית על ידי AZD**:
- `SQL_CONNECTION_STRING`: מחרוזת חיבור למסד הנתונים עם אישורים מוצפנים
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: נקודת קצה לטלטמטריה לניטור
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: מאפשר התקנת תלות אוטומטית בזמן פריסה

**היכן נשמרים הסודות**:
1. בעת `azd provision`, אתה מספק פרטי SQL דרך פרמטרים מאובטחים
2. AZD שומר אותם בקובץ `.azure/<env-name>/.env` מקומי (מנוטרל ב-git)
3. AZD מזריק אותם להגדרות Azure App Service (מוצפן במנוחה)
4. האפליקציה קוראת אותם דרך `os.getenv()` בזמן ריצה

### פיתוח מקומי

לבדיקות מקומיות, צור קובץ `.env` מתוך הדוגמה:

```sh
cp .env.sample .env
# ערוך את קובץ .env עם חיבור מסד הנתונים המקומי שלך
```

**זרימת פיתוח מקומי**:
```sh
# התקן תלותים
cd src/web
pip install -r requirements.txt

# הגדר משתני סביבה
export SQL_CONNECTION_STRING="your-local-connection-string"

# הפעל את היישום
python app.py
```

**בדיקה מקומית**:
```sh
curl http://localhost:8000/health
# צפוי: {"status": "healthy", "database": "connected"}
```

### Infrastructure as Code

כל משאבי Azure מוגדרים בתבניות **Bicep** (`infra/` תיקייה):

- **עיצוב מודולרי**: לכל סוג משאב קובץ נפרד לשימוש חוזר
- **פרמטרים**: ניתן להתאים SKUs, אזורים, שמות
- **שיטות העבודה המומלצות**: מבוסס על סטנדרטים של Azure ואבטחה ברירת מחדל
- **שליטה בגרסאות**: שינויים בתשתית מנוהלים בגיט

**דוגמת התאמה**:
כדי לשנות את דרגת מסד הנתונים, ערוך את `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## שיטות עבודה מומלצות לאבטחה

הדוגמה הזו פועלת לפי שיטות האבטחה המומלצות של Azure:

### 1. **אין סודות בקוד המקור**
- ✅ אישורים שמורים בהגדרות Azure App Service (מוצפן)
- ✅ קבצי `.env` אינם ב-Git (.gitignore)
- ✅ סודות מועברים בפרמטרים מאובטחים בפריסה

### 2. **חיבורים מוצפנים**
- ✅ TLS 1.2 מינימום לשרת SQL
- ✅ HTTPS בלבד לאפליקציית הווב
- ✅ חיבורי מסד נתונים משתמשים בערוצים מוצפנים

### 3. **אבטחת רשת**
- ✅ חומת אש של שרת SQL מוגדרת לאפשר רק שירותי Azure
- ✅ גישה ציבורית מוגבלת (ניתן להוסיף Private Endpoints לאבטחה נוספת)
- ✅ FTPS מושבת באפליקציית הווב

### 4. **אימות והרשאות**
- ⚠️ **נוכחי**: אימות SQL (שם משתמש/סיסמה)
- ✅ **המלצת ייצור**: השתמש בזהות מנוהלת של Azure לאימות ללא סיסמאות

**כדי לשדרג לזהות מנוהלת** (לייצור):
1. הפעל זהות מנוהלת באפליקציית הווב
2. הענק הרשאות SQL לזהות
3. עדכן את מחרוזת החיבור לשימוש בזהות מנוהלת
4. הסר את אימות בסיסמאות

### 5. **ביקורת וציות**
- ✅ Application Insights מנהל רישום של כל הבקשות והטעויות
- ✅ ביקורת מסד נתונים SQL מופעלת (ניתן להגדיר לצרכי ציות)
- ✅ כל המשאבים מתויגים לממשל

**רשימת בדיקה לאבטחה לפני ייצור**:
- [ ] הפעל Azure Defender עבור SQL
- [ ] הגדר Private Endpoints למסד הנתונים SQL
- [ ] הפעל Web Application Firewall (WAF)
- [ ] הטמע Azure Key Vault לסיבוב סודות
- [ ] הגדר אימות Azure AD
- [ ] הפעל רישום ביקור לכל המשאבים

## אופטימיזציה של עלויות

**עלויות חודשיות משוערות** (נכון לנובמבר 2025):

| משאב | SKU/דרגה | עלות משוערת |
|----------|----------|----------------|
| App Service Plan | B1 (בסיס) | ~13$ לחודש |
| SQL Database | Basic (2GB) | ~5$ לחודש |
| Application Insights | תשלום לפי שימוש | ~2$ לחודש (תעבורה נמוכה) |
| **סה"כ** | | **~20$ לחודש** |

**💡 טיפים לחיסכון בעלויות**:

1. **השתמש בדרגת חינם ללמידה**:
   - App Service: דרגת F1 (חינם, שעות מוגבלות)
   - SQL Database: השתמש בשירות serverless של Azure SQL Database
   - Application Insights: טביעת 5GB לחודש חינם

2. **עצור משאבים כשלא בשימוש**:
   ```sh
   # עצור את אפליקציית האינטרנט (המסד עדיין מחייב)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # הפעל מחדש כשנדרש
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **מחק הכל לאחר בדיקות**:
   ```sh
   azd down
   ```
   זה מסיר את כל המשאבים ועוצר חיובים.

4. **דרגות פיתוח לעומת ייצור**:
   - **פיתוח**: דרגת Basic (בדוגמה זו)
   - **ייצור**: דרגת Standard/Premium עם רדונדנס

**ניטור עלויות**:
- צפה בעלויות ב-[Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- הגדר התראות מחירים למניעת הפתעות
- תייג את כל המשאבים עם `azd-env-name` למעקב

**חלופה בדרגת חינם**:
לצורכי למידה, ניתן לשנות את `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**הערה**: דרגת חינם כוללת מגבלות (60 דק' CPU ליום, ללא Always On).

## ניטור וצפייה

### אינטגרציה עם Application Insights

הדוגמה כוללת **Application Insights** לניטור מקיף:

**מה מנוטר**:
- ✅ בקשות HTTP (השיהוי, קודי מצב, נקודות קצה)
- ✅ שגיאות והחרגות באפליקציה
- ✅ לוגים מותאמים מאפליקציית Flask
- ✅ בריאות חיבורי מסד נתונים
- ✅ מדדים בביצועים (CPU, זיכרון)

**גישה ל-Application Insights**:
1. פתח את [פורטל Azure](https://portal.azure.com)
2. עבור לקבוצת המשאבים שלך (`rg-<env-name>`)
3. לחץ על משאב Application Insights (`appi-<unique-id>`)

**שאילתות שימושיות** (Application Insights → לוגים):

**הצג את כל הבקשות**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**מצא שגיאות**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**בדוק נקודת בריאות**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### ביקורת מסד נתונים SQL

**ביקורת מסד נתונים SQL מופעלת** למעקב על:
- דפוסי גישה למסד הנתונים
- ניסיונות התחברות נכשלות
- שינויים בסכמות
- גישה לנתונים (לצורכי ציות)

**גישה ללוג ביקורת**:
1. פורטל Azure → מסד נתונים SQL → ביקורת
2. צפה בלוגים ב-Log Analytics workspace

### ניטור בזמן אמת

**הצג מדדים חיים**:
1. Application Insights → Live Metrics
2. צפה בבקשות, כישלונות וביצועים בזמן אמת

**הגדרת התראות**:
צור התראות לאירועים קריטיים:
- שגיאות HTTP 500 > 5 בתוך 5 דקות
- כישלונות חיבור למסד הנתונים
- זמני תגובה גבוהים (>2 שניות)

**דוגמת יצירת התראה**:  
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```
  
## פתרון בעיות

### בעיות נפוצות ופתרונות

#### 1. `azd provision` נכשל עם "Location not available"

**תסמין**:  
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```
  
**פתרון**:  
בחר אזור Azure שונה או הירשם לספק המשאבים:  
```sh
az provider register --namespace Microsoft.Insights
```
  
#### 2. כשל בחיבור ל-SQL במהלך הפריסה

**תסמין**:  
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```
  
**פתרון**:  
- אמת שהחומת אש של SQL Server מאפשרת שירותי Azure (מוגדר אוטומטית)  
- ודא שסיסמת מנהל SQL הוקלדה נכון בזמן `azd provision`  
- ודא ש-SQL Server סופק במלואו (יכול לקחת 2-3 דקות)

**אמת חיבור**:  
```sh
# מ הפורטל של Azure, עבור ל SQL Database → עורך השאילתות
# נסה להתחבר עם האישורים שלך
```
  
#### 3. אפליקציית רשת מציגה "Application Error"

**תסמין**:  
הדפדפן מציג דף שגיאה כללי.

**פתרון**:  
בדוק יומני האפליקציה:  
```sh
# הצג יומנים אחרונים
az webapp log tail --name <app-name> --resource-group <rg-name>
```
  
**סיבות נפוצות**:  
- משתני סביבה חסרים (בדוק App Service → Configuration)  
- התקנת חבילת Python נכשלה (בדוק יומני פריסה)  
- שגיאת אתחול בסיס נתונים (בדוק חיבוריות SQL)

#### 4. `azd deploy` נכשל עם "Build Error"

**תסמין**:  
```
Error: Failed to build project
```
  
**פתרון**:  
- ודא שקובץ `requirements.txt` ללא שגיאות תחביר  
- בדוק ש-Python 3.11 מוגדר בקובץ `infra/resources/web-app.bicep`  
- אמת שקובץ Dockerfile משתמש בתמונת בסיס נכונה

**ניפוי באגים מקומי**:  
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```
  
#### 5. "Unauthorized" בעת הרצת פקודות AZD

**תסמין**:  
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```
  
**פתרון**:  
התחבר מחדש ל-Azure:  
```sh
azd auth login
az login
```
  
ודא שיש לך הרשאות נכונות (תפקיד Contributor) במנוי.

#### 6. עלויות גבוהות של מסד הנתונים

**תסמין**:  
חשבונית Azure בלתי צפויה.

**פתרון**:  
- בדוק אם שכחת להריץ `azd down` לאחר הבדיקה  
- אמת ש-SQL Database משתמש ברמת Basic (לא Premium)  
- בדוק עלויות בניהול עלויות Azure  
- הגדר התראות עלויות

### קבלת עזרה

**הצג את כל משתני הסביבה של AZD**:  
```sh
azd env get-values
```
  
**בדוק סטטוס פריסה**:  
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```
  
**גש ליומני האפליקציה**:  
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```
  
**צריך עזרה נוספת?**  
- [מדריך פתרון בעיות AZD](../../docs/chapter-07-troubleshooting/common-issues.md)  
- [פתרון בעיות Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)  
- [פתרון בעיות Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## תרגילים מעשיים

### תרגיל 1: אמת את הפריסה שלך (מתחילים)

**מטרה**: לאשר שכל המשאבים מוטמעים והאפליקציה פועלת.

**שלבים**:  
1. רשום את כל המשאבים בקבוצת המשאבים שלך:  
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
  
**צפוי**: 6-7 משאבים (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. בדוק את כל נקודות הקצה של ה-API:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
  
**צפוי**: כולן מחזירות JSON תקין ללא שגיאות

3. בדוק את Application Insights:  
   - גש ל-Application Insights בפורטל Azure  
   - עבור ל-"Live Metrics"  
   - רענן את הדפדפן באפליקציית הרשת  
   **צפוי**: לראות בקשות מופיעות בזמן אמת

**קריטריוני הצלחה**: כל 6-7 המשאבים קיימים, כל נקודות הקצה מחזירות נתונים, Live Metrics מציג פעילות.

---

### תרגיל 2: הוסף נקודת API חדשה (ביניים)

**מטרה**: להרחיב את אפליקציית Flask עם נקודת קצה חדשה.

**קוד התחלתי**: נקודות הקצה הנוכחיות בקובץ `src/web/app.py`

**שלבים**:  
1. ערוך את הקובץ `src/web/app.py` והוסף נקודת קצה חדשה אחרי הפונקציה `get_product()`:  
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```
  
2. פרוס את האפליקציה המעודכנת:  
   ```sh
   azd deploy
   ```
  
3. בדוק את נקודת הקצה החדשה:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
  
**צפוי**: מחזירה מוצרים התואמים ל-"laptop"

**קריטריוני הצלחה**: נקודת הקצה החדשה עובדת, מחזירה תוצאות מסוננות, מופיעה ביומני Application Insights.

---

### תרגיל 3: הוסף ניטור והתראות (מתקדמים)

**מטרה**: להקים ניטור פרואקטיבי עם התראות.

**שלבים**:  
1. צור התראה לשגיאות HTTP 500:  
   ```sh
   # לקבלת מזהה משאבי Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # ליצור התראה
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```
  
2. הפעל את ההתראה על ידי יצירת שגיאות:  
   ```sh
   # בקש מוצר שאינו קיים
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```
  
3. בדוק אם ההתראה הופעלה:  
   - פורטל Azure → התראות → כללי התראה  
   - בדוק את האימייל שלך (אם מוגדר)

**קריטריוני הצלחה**: כלל התראה נוצר, מופעל על שגיאות, מתקבלות התראות.

---

### תרגיל 4: שינויים בסכמת מסד הנתונים (מתקדמים)

**מטרה**: הוסף טבלה חדשה ועדכן את האפליקציה להשתמש בה.

**שלבים**:  
1. התחבר למסד הנתונים SQL דרך עורך השאילתות בפורטל Azure

2. צור טבלה חדשה `categories`:  
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```
  
3. עדכן את `src/web/app.py` לכלול מידע על הקטגוריות בתגובות

4. פרוס ובדוק

**קריטריוני הצלחה**: טבלה חדשה קיימת, המוצרים מציגים מידע על קטגוריות, האפליקציה פועלת כהלכה.

---

### תרגיל 5: יישום מטמון (מומחה)

**מטרה**: הוסף Azure Redis Cache לשיפור ביצועים.

**שלבים**:  
1. הוסף Redis Cache ל-`infra/main.bicep`  
2. עדכן את `src/web/app.py` כדי לבצע מטמון של שאילתות מוצר  
3. מדוד שיפור ביצועים עם Application Insights  
4. השווה זמני תגובה לפני/אחרי המטמון

**קריטריוני הצלחה**: Redis פרוס, המטמון עובד, זמני תגובה משתפרים ביותר מ-50%.

**רמז**: התחל עם [תיעוד Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## ניקוי

כדי למנוע חיובים מתמשכים, מחק את כל המשאבים בסיום:

```sh
azd down
```
  
**בקשת אישור**:  
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```
  
הקלד `y` לאישור.

**✓ בדיקת הצלחה**:  
- כל המשאבים נמחקו מפורטל Azure  
- אין חיובים מתמשכים  
- תיקיית `.azure/<env-name>` המקומית ניתנת למחיקה

**חלופה** (שמור את התשתית, מחק את הנתונים):  
```sh
# מחק רק את קבוצת המשאבים (השאר את תצורת AZD)
az group delete --name rg-<env-name> --yes
```
  
## ללמוד עוד

### תיעוד קשור  
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [תיעוד Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)  
- [תיעוד Azure App Service](https://learn.microsoft.com/azure/app-service/)  
- [תיעוד Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)  
- [מדריך שפת Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### צעדים הבאים בקורס זה  
- **[דוגמת Container Apps](../../../../examples/container-app)**: פריסת מיקרו-שירותים עם Azure Container Apps  
- **[מדריך אינטגרציה עם AI](../../../../docs/ai-foundry)**: הוסף יכולות AI לאפליקציה שלך  
- **[שיטות עבודה מומלצות לפריסה](../../docs/chapter-04-infrastructure/deployment-guide.md)**: דפוסי פריסה בסביבת ייצור

### נושאים מתקדמים  
- **זהות מנוהלת**: הסר סיסמאות והשתמש באימות Azure AD  
- **נקודות קצה פרטיות**: אבטח חיבורים למסד הנתונים בתוך רשת וירטואלית  
- **אינטגרציית CI/CD**: אוטומציה של פריסות עם GitHub Actions או Azure DevOps  
- **סביבות מרובות**: הקם סביבות פיתוח, בדיקה וייצור  
- **הגירות מסד נתונים**: השתמש ב-Alembic או Entity Framework לניהול גרסאות סכמת הנתונים

### השוואה לשיטות אחרות

**AZD מול תבניות ARM**:  
- ✅ AZD: רמת הפשטה גבוהה יותר, פקודות פשוטות  
- ⚠️ ARM: מפורט יותר, שליטה מדויקת

**AZD מול Terraform**:  
- ✅ AZD: טבעי ל-Azure, משולב עם שירותי Azure  
- ⚠️ Terraform: תומך רב-ענני, מערכת אקולוגית גדולה

**AZD מול פורטל Azure**:  
- ✅ AZD: ניתן להרצה מחדש, נשלט בגרסאות, ניתן לאוטומציה  
- ⚠️ פורטל: פעולות ידניות, קשה לשכפול

**חשוב על AZD בתור**: Docker Compose ל-Azure — קונפигураציה פשוטה לפריסות מורכבות.

---

## שאלות נפוצות

**ש: האם אפשר להשתמש בשפת תכנות אחרת?**  
ת: כן! החלף את `src/web/` ל-Node.js, C#, Go או כל שפה אחרת. עדכן את `azure.yaml` ו-Bicep בהתאם.

**ש: איך מוסיפים מסדי נתונים נוספים?**  
ת: הוסף מודול SQL Database נוסף ב-`infra/main.bicep` או השתמש ב-PostgreSQL/MySQL משירותי Azure Database.

**ש: האם אפשר להשתמש בזה בייצור?**  
ת: זו נקודת התחלה. לייצור, הוסף: זהות מנוהלת, נקודות קצה פרטיות, ורנונדציה, אסטרטגיית גיבוי, WAF וניטור משופר.

**ש: מה אם אני רוצה להשתמש במיכלים במקום פריסת קוד?**  
ת: עיין ב-[דוגמת Container Apps](../../../../examples/container-app) שמשתמשת במיכלי Docker לאורך כל הדרך.

**ש: איך מתחברים למסד הנתונים מהמחשב המקומי?**  
ת: הוסף את כתובת ה-IP שלך לחומת האש של SQL Server:  
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```
  
**ש: האם אפשר להשתמש במסד נתונים קיים במקום ליצור חדש?**  
ת: כן, ערוך את `infra/main.bicep` כדי להפנות ל-SQL Server קיים ועדכן את פרמטרי מחרוזת החיבור.

---

> **הערה:** דוגמה זו ממחישה שיטות עבודה מומלצות לפריסת אפליקציית רשת עם מסד נתונים באמצעות AZD. היא כוללת קוד עובד, תיעוד מקיף ותרגילים מעשיים לחיזוק הלמידה. לפריסות ייצור, בדוק דרישות אבטחה, סקיילינג, תאימות ועלויות ספציפיות לארגונך.

**📚 ניווט בקורס:**  
- ← קודם: [דוגמת Container Apps](../../../../examples/container-app)  
- → הבא: [מדריך אינטגרציה עם AI](../../../../docs/ai-foundry)  
- 🏠 [בית הקורס](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**הצהרת אי-אחריות**:  
מסמך זה תורגם באמצעות שירות התרגום האוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). על אף שאנו שואפים לדיוק, יש לקחת בחשבון כי תרגומים אוטומטיים עלולים לכלול שגיאות או אי-דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב למקור הסמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. אנו אינם אחראים לכל הבנה שגויה או פרשנות שגויה הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->