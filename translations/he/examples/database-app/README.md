<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-21T18:18:49+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "he"
}
-->
# פריסת מסד נתונים של Microsoft SQL ואפליקציית ווב עם AZD

⏱️ **זמן משוער**: 20-30 דקות | 💰 **עלות משוערת**: ~$15-25 לחודש | ⭐ **רמת קושי**: בינונית

דוגמה **מלאה ועובדת** זו מדגימה כיצד להשתמש ב-[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) כדי לפרוס אפליקציית ווב Python Flask עם מסד נתונים Microsoft SQL ב-Azure. כל הקוד כלול ונבדק—אין צורך בתלות חיצונית.

## מה תלמדו

על ידי השלמת דוגמה זו, תלמדו:
- לפרוס אפליקציה מרובת שכבות (אפליקציית ווב + מסד נתונים) באמצעות תשתית כקוד
- להגדיר חיבורים מאובטחים למסד נתונים ללא קידוד סודות בקוד
- לנטר את בריאות האפליקציה עם Application Insights
- לנהל משאבי Azure ביעילות עם AZD CLI
- לעקוב אחר שיטות העבודה המומלצות של Azure לאבטחה, אופטימיזציית עלויות וניטור

## סקירת תרחיש
- **אפליקציית ווב**: API REST של Python Flask עם חיבור למסד נתונים
- **מסד נתונים**: Azure SQL Database עם נתוני דוגמה
- **תשתית**: נפרסת באמצעות Bicep (תבניות מודולריות לשימוש חוזר)
- **פריסה**: אוטומטית לחלוטין עם פקודות `azd`
- **ניטור**: Application Insights עבור לוגים וטלמטריה

## דרישות מוקדמות

### כלים נדרשים

לפני שתתחילו, ודאו שהכלים הבאים מותקנים:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (גרסה 2.50.0 או גבוהה יותר)
   ```sh
   az --version
   # תוצאה צפויה: azure-cli 2.50.0 או גבוה יותר
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (גרסה 1.0.0 או גבוהה יותר)
   ```sh
   azd version
   # תוצאה צפויה: גרסת azd 1.0.0 או גבוהה יותר
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (לפיתוח מקומי)
   ```sh
   python --version
   # תוצאה צפויה: פייתון 3.8 או גבוה יותר
   ```

4. **[Docker](https://www.docker.com/get-started)** (אופציונלי, לפיתוח מקומי במכולות)
   ```sh
   docker --version
   # תוצאה צפויה: גרסת Docker 20.10 או גבוהה יותר
   ```

### דרישות Azure

- מנוי **Azure** פעיל ([צרו חשבון חינמי](https://azure.microsoft.com/free/))
- הרשאות ליצירת משאבים במנוי שלכם
- תפקיד **Owner** או **Contributor** במנוי או בקבוצת המשאבים

### ידע מוקדם

זו דוגמה ברמת **ביניים**. עליכם להכיר:
- פעולות בסיסיות בשורת הפקודה
- מושגי ענן בסיסיים (משאבים, קבוצות משאבים)
- הבנה בסיסית של אפליקציות ווב ומסדי נתונים

**חדשים ב-AZD?** התחילו עם [מדריך ההתחלה](../../docs/getting-started/azd-basics.md) תחילה.

## ארכיטקטורה

דוגמה זו פורסת ארכיטקטורה דו-שכבתית עם אפליקציית ווב ומסד נתונים SQL:

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
- **App Service Plan**: אירוח מבוסס לינוקס (רמת B1 לחיסכון בעלויות)
- **אפליקציית ווב**: סביבת Python 3.11 עם אפליקציית Flask
- **שרת SQL**: שרת מסד נתונים מנוהל עם TLS 1.2 מינימום
- **מסד נתונים SQL**: רמת Basic (2GB, מתאים לפיתוח/בדיקות)
- **Application Insights**: ניטור ולוגים
- **Log Analytics Workspace**: אחסון לוגים מרכזי

**אנלוגיה**: חשבו על זה כמו מסעדה (אפליקציית ווב) עם מקפיא (מסד נתונים). לקוחות מזמינים מהתפריט (נקודות קצה של API), והמטבח (אפליקציית Flask) שולף מרכיבים (נתונים) מהמקפיא. מנהל המסעדה (Application Insights) עוקב אחרי כל מה שקורה.

## מבנה תיקיות

כל הקבצים כלולים בדוגמה זו—אין צורך בתלות חיצונית:

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

**מה עושה כל קובץ:**
- **azure.yaml**: מגדיר ל-AZD מה לפרוס ואיפה
- **infra/main.bicep**: מתזמר את כל משאבי Azure
- **infra/resources/*.bicep**: הגדרות משאבים בודדים (מודולריים לשימוש חוזר)
- **src/web/app.py**: אפליקציית Flask עם לוגיקת מסד נתונים
- **requirements.txt**: תלות חבילות Python
- **Dockerfile**: הוראות מכולה לפריסה

## התחלה מהירה (שלב-אחר-שלב)

### שלב 1: שיבטו ונווטו

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ בדיקת הצלחה**: ודאו שאתם רואים את `azure.yaml` ותיקיית `infra/`:
```sh
ls
# צפוי: README.md, azure.yaml, infra/, src/
```

### שלב 2: אימות מול Azure

```sh
azd auth login
```

זה יפתח את הדפדפן שלכם לאימות מול Azure. התחברו עם האישורים שלכם.

**✓ בדיקת הצלחה**: אתם אמורים לראות:
```
Logged in to Azure.
```

### שלב 3: אתחול הסביבה

```sh
azd init
```

**מה קורה**: AZD יוצר תצורה מקומית לפריסה שלכם.

**הנחיות שתראו**:
- **שם סביבה**: הזינו שם קצר (למשל, `dev`, `myapp`)
- **מנוי Azure**: בחרו את המנוי שלכם מהרשימה
- **מיקום Azure**: בחרו אזור (למשל, `eastus`, `westeurope`)

**✓ בדיקת הצלחה**: אתם אמורים לראות:
```
SUCCESS: New project initialized!
```

### שלב 4: פריסת משאבי Azure

```sh
azd provision
```

**מה קורה**: AZD פורסת את כל התשתית (לוקח 5-8 דקות):
1. יוצרת קבוצת משאבים
2. יוצרת שרת SQL ומסד נתונים
3. יוצרת App Service Plan
4. יוצרת אפליקציית ווב
5. יוצרת Application Insights
6. מגדירה רשתות ואבטחה

**תתבקשו להזין**:
- **שם משתמש מנהל SQL**: הזינו שם משתמש (למשל, `sqladmin`)
- **סיסמת מנהל SQL**: הזינו סיסמה חזקה (שמרו אותה!)

**✓ בדיקת הצלחה**: אתם אמורים לראות:
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

**מה קורה**: AZD בונה ופורסת את אפליקציית Flask שלכם:
1. אורזת את אפליקציית Python
2. בונה את מכולת Docker
3. דוחפת ל-Azure Web App
4. מאתחלת את מסד הנתונים עם נתוני דוגמה
5. מפעילה את האפליקציה

**✓ בדיקת הצלחה**: אתם אמורים לראות:
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

זה יפתח את אפליקציית הווב שלכם בדפדפן בכתובת `https://app-<unique-id>.azurewebsites.net`

**✓ בדיקת הצלחה**: אתם אמורים לראות פלט JSON:
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

### שלב 7: בדיקת נקודות הקצה של ה-API

**בדיקת בריאות** (אימות חיבור למסד נתונים):
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

**קבלת מוצר בודד**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ בדיקת הצלחה**: כל נקודות הקצה מחזירות נתוני JSON ללא שגיאות.

---

**🎉 מזל טוב!** פרסתם בהצלחה אפליקציית ווב עם מסד נתונים ל-Azure באמצעות AZD.

## תצורה מעמיקה

### משתני סביבה

סודות מנוהלים בצורה מאובטחת דרך תצורת Azure App Service—**לעולם לא מקודדים בקוד המקור**.

**מוגדר אוטומטית על ידי AZD**:
- `SQL_CONNECTION_STRING`: חיבור למסד נתונים עם אישורים מוצפנים
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: נקודת קצה לטלמטריה
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: מאפשר התקנת תלות אוטומטית

**איפה נשמרים הסודות**:
1. במהלך `azd provision`, אתם מספקים אישורי SQL דרך הנחיות מאובטחות
2. AZD שומר אותם בקובץ `.azure/<env-name>/.env` המקומי (מוחרג מ-Git)
3. AZD מזריק אותם לתצורת Azure App Service (מוצפן במנוחה)
4. האפליקציה קוראת אותם דרך `os.getenv()` בזמן ריצה

### פיתוח מקומי

לבדיקות מקומיות, צרו קובץ `.env` מהדוגמה:

```sh
cp .env.sample .env
# ערוך את .env עם חיבור מסד הנתונים המקומי שלך
```

**תהליך עבודה לפיתוח מקומי**:
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

### תשתית כקוד

כל משאבי Azure מוגדרים בתבניות **Bicep** (`infra/` תיקייה):

- **עיצוב מודולרי**: לכל סוג משאב יש קובץ משלו לשימוש חוזר
- **מפרמטר**: התאמה אישית של SKUs, אזורים, מוסכמות שמות
- **שיטות עבודה מומלצות**: עוקב אחרי סטנדרטים של Azure ונקודות ברירת מחדל לאבטחה
- **נשלט גרסה**: שינויים בתשתית מתועדים ב-Git

**דוגמת התאמה אישית**:
כדי לשנות את רמת מסד הנתונים, ערכו את `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## שיטות עבודה מומלצות לאבטחה

דוגמה זו עוקבת אחרי שיטות העבודה המומלצות של Azure לאבטחה:

### 1. **אין סודות בקוד המקור**
- ✅ אישורים נשמרים בתצורת Azure App Service (מוצפן)
- ✅ קבצי `.env` מוחרגים מ-Git דרך `.gitignore`
- ✅ סודות מועברים דרך פרמטרים מאובטחים במהלך הפריסה

### 2. **חיבורים מוצפנים**
- ✅ TLS 1.2 מינימום עבור שרת SQL
- ✅ HTTPS בלבד מופעל עבור אפליקציית ווב
- ✅ חיבורים למסד נתונים משתמשים בערוצים מוצפנים

### 3. **אבטחת רשת**
- ✅ חומת אש של שרת SQL מוגדרת לאפשר רק שירותי Azure
- ✅ גישה לרשת ציבורית מוגבלת (ניתן להחמיר עם Private Endpoints)
- ✅ FTPS מושבת באפליקציית ווב

### 4. **אימות והרשאה**
- ⚠️ **נוכחי**: אימות SQL (שם משתמש/סיסמה)
- ✅ **המלצה לפרודקשן**: השתמשו ב-Azure Managed Identity לאימות ללא סיסמה

**כדי לשדרג ל-Managed Identity** (לפרודקשן):
1. הפעילו Managed Identity באפליקציית ווב
2. העניקו הרשאות SQL לזהות
3. עדכנו את מחרוזת החיבור לשימוש ב-Managed Identity
4. הסירו אימות מבוסס סיסמה

### 5. **ביקורת וציות**
- ✅ Application Insights מתעד את כל הבקשות והשגיאות
- ✅ ביקורת מסד נתונים SQL מופעלת (ניתן להגדיר לציות)
- ✅ כל המשאבים מתויגים למטרות ניהול

**רשימת בדיקות אבטחה לפני פרודקשן**:
- [ ] הפעלת Azure Defender עבור SQL
- [ ] הגדרת Private Endpoints למסד נתונים SQL
- [ ] הפעלת Web Application Firewall (WAF)
- [ ] יישום Azure Key Vault לסיבוב סודות
- [ ] הגדרת אימות Azure AD
- [ ] הפעלת לוגים דיאגנוסטיים לכל המשאבים

## אופטימיזציית עלויות

**עלויות חודשיות משוערות** (נכון לנובמבר 2025):

| משאב | SKU/רמה | עלות משוערת |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13 לחודש |
| SQL Database | Basic (2GB) | ~$5 לחודש |
| Application Insights | תשלום לפי שימוש | ~$2 לחודש (תעבורה נמוכה) |
| **סה"כ** | | **~$20 לחודש** |

**💡 טיפים לחיסכון בעלויות**:

1. **השתמשו ברמת חינם ללמידה**:
   - App Service: רמת F1 (חינם, שעות מוגבלות)
   - SQL Database: השתמשו ב-Azure SQL Database serverless
   - Application Insights: 5GB/חודש חינם

2. **עצרו משאבים כשאינם בשימוש**:
   ```sh
   # לעצור את אפליקציית האינטרנט (המסד נתונים עדיין מחייב)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # להפעיל מחדש כשצריך
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **מחקו הכל לאחר בדיקות**:
   ```sh
   azd down
   ```
   זה יסיר את כל המשאבים ויעצור חיובים.

4. **רמות פיתוח מול פרודקשן**:
   - **פיתוח**: רמת Basic (משמשת בדוגמה זו)
   - **פרודקשן**: רמת Standard/Premium עם יתירות

**מעקב עלויות**:
- צפו בעלויות ב-[Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- הגדירו התראות עלויות כדי להימנע מהפתעות
- תייגו את כל המשאבים עם `azd-env-name` למעקב

**אלטרנטיבה חינמית**:
למטרות למידה, תוכלו לשנות את `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**הערה**: לרמת חינם יש מגבלות (60 דקות/יום CPU, ללא always-on).

## ניטור ונצפות

### אינטגרציית Application Insights

דוגמה זו כוללת **Application Insights** לניטור מקיף:

**מה מנוטר**:
- ✅ בקשות HTTP (זמן תגובה, קודי סטטוס, נקודות קצה)
- ✅ שגיאות וחריגים באפליקציה
- ✅ לוגים מותאמים אישית מאפליקציית Flask
- ✅ בריאות חיבור למסד נתונים
- ✅ מדדי ביצועים (CPU, זיכרון)

**גישה ל-Application Insights**:
1. פתחו את [Azure Portal](https://portal.azure.com)
2. נווטו לקבוצת המשאבים שלכם (`rg-<env-name>`)
3. לחצו על משאב Application Insights (`appi-<unique-id>`)

**שאילתות שימושיות** (Application Insights → Logs):

**צפו בכל הבקשות**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**מצאו שגיאות**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**בדקו את נקודת הקצה של הבריאות**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### ביקורת מסד נתונים SQL

**ביקורת מסד נתונים SQL מופעלת** כדי לעקוב אחרי:
- דפוסי גישה למסד נתונים
- ניסיונות כניסה שנכשלו
- שינויים בסכימה
- גישה לנתונים (למטרות ציות)

**גישה ללוגי ביקורת**:
1. Azure Portal → SQL Database → Auditing
2. צפו בלוגים ב-Log Analytics workspace

### ניטור בזמן אמת

**צפו במדדים חיים**:
1. Application Insights → Live Metrics
2. ראו בקשות, כשלונות וביצועים בזמן אמת

**הגדירו התראות**:
צרו התראות לאירועים קריטיים:
- שגיאות HTTP 500 > 5 ב-5 דקות
- כשלונות חיבור למסד נתונים
- זמני תגובה גבוהים (>2 שניות)

**דוגמה ליצירת התראה**:
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

#### 1. `azd provision` נכשל עם "מיקום לא זמין"

**תסמין**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**פתרון**:
בחר אזור Azure אחר או רשום את ספק המשאבים:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. חיבור SQL נכשל במהלך הפריסה

**תסמין**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**פתרון**:
- ודא שחומת האש של SQL Server מאפשרת שירותי Azure (מוגדר אוטומטית)
- בדוק שהסיסמה של מנהל SQL הוזנה נכון במהלך `azd provision`
- ודא ש-SQL Server הוקצה במלואו (יכול לקחת 2-3 דקות)

**אימות חיבור**:
```sh
# מתוך פורטל Azure, עבור למסד נתונים SQL → עורך שאילתות
# נסה להתחבר עם האישורים שלך
```

#### 3. אפליקציית האינטרנט מציגה "שגיאת אפליקציה"

**תסמין**:
הדפדפן מציג דף שגיאה כללי.

**פתרון**:
בדוק את יומני האפליקציה:
```sh
# הצג יומנים אחרונים
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**גורמים נפוצים**:
- משתני סביבה חסרים (בדוק App Service → Configuration)
- התקנת חבילות Python נכשלה (בדוק יומני פריסה)
- שגיאת אתחול מסד נתונים (בדוק את חיבור ה-SQL)

#### 4. `azd deploy` נכשל עם "שגיאת בנייה"

**תסמין**:
```
Error: Failed to build project
```

**פתרון**:
- ודא שאין שגיאות תחביר ב-`requirements.txt`
- בדוק ש-Python 3.11 מוגדר ב-`infra/resources/web-app.bicep`
- ודא ש-Dockerfile מכיל תמונת בסיס נכונה

**ניפוי שגיאות מקומי**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "לא מורשה" בעת הרצת פקודות AZD

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

ודא שיש לך הרשאות מתאימות (תפקיד Contributor) במנוי.

#### 6. עלויות מסד נתונים גבוהות

**תסמין**:
חשבון Azure בלתי צפוי.

**פתרון**:
- בדוק אם שכחת להריץ `azd down` לאחר הבדיקה
- ודא שמסד הנתונים של SQL משתמש בשכבת Basic (לא Premium)
- סקור עלויות ב-Azure Cost Management
- הגדר התראות עלויות

### קבלת עזרה

**הצג את כל משתני הסביבה של AZD**:
```sh
azd env get-values
```

**בדוק את מצב הפריסה**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**גש ליומני האפליקציה**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**צריך עוד עזרה?**
- [מדריך פתרון בעיות AZD](../../docs/troubleshooting/common-issues.md)
- [פתרון בעיות Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [פתרון בעיות Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## תרגילים מעשיים

### תרגיל 1: אימות הפריסה שלך (מתחילים)

**מטרה**: ודא שכל המשאבים נפרסו והאפליקציה פועלת.

**שלבים**:
1. רשום את כל המשאבים בקבוצת המשאבים שלך:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **צפוי**: 6-7 משאבים (אפליקציית אינטרנט, SQL Server, מסד נתונים SQL, תוכנית שירות אפליקציה, Application Insights, Log Analytics)

2. בדוק את כל נקודות הקצה של ה-API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **צפוי**: כולן מחזירות JSON תקין ללא שגיאות

3. בדוק את Application Insights:
   - נווט ל-Application Insights בפורטל Azure
   - עבור ל-"Live Metrics"
   - רענן את הדפדפן שלך באפליקציית האינטרנט
   **צפוי**: ראה בקשות מופיעות בזמן אמת

**קריטריוני הצלחה**: כל 6-7 המשאבים קיימים, כל נקודות הקצה מחזירות נתונים, Live Metrics מציג פעילות.

---

### תרגיל 2: הוסף נקודת קצה חדשה ל-API (בינוני)

**מטרה**: הרחב את אפליקציית Flask עם נקודת קצה חדשה.

**קוד התחלתי**: נקודות הקצה הנוכחיות ב-`src/web/app.py`

**שלבים**:
1. ערוך את `src/web/app.py` והוסף נקודת קצה חדשה אחרי הפונקציה `get_product()`:
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
   **צפוי**: מחזיר מוצרים התואמים ל-"laptop"

**קריטריוני הצלחה**: נקודת הקצה החדשה פועלת, מחזירה תוצאות מסוננות, מופיעה ביומני Application Insights.

---

### תרגיל 3: הוסף ניטור והתראות (מתקדם)

**מטרה**: הגדר ניטור פרואקטיבי עם התראות.

**שלבים**:
1. צור התראה עבור שגיאות HTTP 500:
   ```sh
   # קבל מזהה משאב של Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # צור התראה
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. גרום לשגיאות כדי להפעיל את ההתראה:
   ```sh
   # בקש מוצר שאינו קיים
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. בדוק אם ההתראה הופעלה:
   - פורטל Azure → התראות → חוקי התראה
   - בדוק את הדוא"ל שלך (אם הוגדר)

**קריטריוני הצלחה**: חוק ההתראה נוצר, מופעל על שגיאות, מתקבלות התראות.

---

### תרגיל 4: שינויים בסכמת מסד הנתונים (מתקדם)

**מטרה**: הוסף טבלה חדשה ועדכן את האפליקציה להשתמש בה.

**שלבים**:
1. התחבר למסד הנתונים של SQL דרך עורך השאילתות בפורטל Azure

2. צור טבלת `categories` חדשה:
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

3. עדכן את `src/web/app.py` לכלול מידע על קטגוריות בתגובות

4. פרוס ובדוק

**קריטריוני הצלחה**: הטבלה החדשה קיימת, מוצרים מציגים מידע על קטגוריות, האפליקציה עדיין פועלת.

---

### תרגיל 5: יישום מטמון (מומחה)

**מטרה**: הוסף Azure Redis Cache לשיפור הביצועים.

**שלבים**:
1. הוסף Redis Cache ל-`infra/main.bicep`
2. עדכן את `src/web/app.py` למטמון שאילתות מוצרים
3. מדוד שיפור ביצועים עם Application Insights
4. השווה זמני תגובה לפני/אחרי המטמון

**קריטריוני הצלחה**: Redis נפרס, המטמון פועל, זמני התגובה משתפרים ביותר מ-50%.

**רמז**: התחל עם [תיעוד Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## ניקוי

כדי להימנע מחיובים מתמשכים, מחק את כל המשאבים בסיום:

```sh
azd down
```

**אישור**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

הקלד `y` לאישור.

**✓ בדיקת הצלחה**: 
- כל המשאבים נמחקו מפורטל Azure
- אין חיובים מתמשכים
- ניתן למחוק את התיקייה המקומית `.azure/<env-name>`

**חלופה** (שמור על התשתית, מחק נתונים):
```sh
# מחק רק את קבוצת המשאבים (שמור את תצורת AZD)
az group delete --name rg-<env-name> --yes
```
## למידע נוסף

### תיעוד קשור
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [תיעוד מסד נתונים Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/)
- [תיעוד Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [תיעוד Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [תיעוד שפת Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### השלבים הבאים בקורס זה
- **[דוגמת אפליקציות קונטיינר](../../../../examples/container-app)**: פרוס מיקרו-שירותים עם Azure Container Apps
- **[מדריך אינטגרציית AI](../../../../docs/ai-foundry)**: הוסף יכולות AI לאפליקציה שלך
- **[שיטות פריסה מומלצות](../../docs/deployment/deployment-guide.md)**: דפוסי פריסה לייצור

### נושאים מתקדמים
- **Managed Identity**: הסר סיסמאות והשתמש באימות Azure AD
- **Private Endpoints**: אבטח חיבורי מסד נתונים בתוך רשת וירטואלית
- **CI/CD Integration**: אוטומציה של פריסות עם GitHub Actions או Azure DevOps
- **Multi-Environment**: הגדר סביבות פיתוח, בדיקות וייצור
- **Database Migrations**: השתמש ב-Alembic או Entity Framework לגרסאות סכמות

### השוואה לגישות אחרות

**AZD לעומת ARM Templates**:
- ✅ AZD: הפשטה ברמה גבוהה, פקודות פשוטות
- ⚠️ ARM: מפורט יותר, שליטה גרנולרית

**AZD לעומת Terraform**:
- ✅ AZD: מקורי ל-Azure, משולב עם שירותי Azure
- ⚠️ Terraform: תמיכה בריבוי עננים, אקוסיסטם רחב יותר

**AZD לעומת פורטל Azure**:
- ✅ AZD: ניתן לשחזור, נשלט בגרסאות, ניתן לאוטומציה
- ⚠️ פורטל: קליקים ידניים, קשה לשחזור

**חשוב על AZD כ**: Docker Compose עבור Azure—תצורה פשוטה לפריסות מורכבות.

---

## שאלות נפוצות

**ש: האם אני יכול להשתמש בשפת תכנות אחרת?**  
ת: כן! החלף את `src/web/` ב-Node.js, C#, Go או כל שפה אחרת. עדכן את `azure.yaml` ו-Bicep בהתאם.

**ש: איך אני מוסיף עוד מסדי נתונים?**  
ת: הוסף מודול מסד נתונים SQL נוסף ב-`infra/main.bicep` או השתמש ב-PostgreSQL/MySQL משירותי מסדי הנתונים של Azure.

**ש: האם אני יכול להשתמש בזה לייצור?**  
ת: זהו נקודת התחלה. לייצור, הוסף: Managed Identity, Private Endpoints, יתירות, אסטרטגיית גיבוי, WAF וניטור משופר.

**ש: מה אם אני רוצה להשתמש בקונטיינרים במקום פריסת קוד?**  
ת: עיין ב-[דוגמת אפליקציות קונטיינר](../../../../examples/container-app) שמשתמשת בקונטיינרים של Docker לאורך כל הדרך.

**ש: איך אני מתחבר למסד הנתונים מהמחשב המקומי שלי?**  
ת: הוסף את ה-IP שלך לחומת האש של SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**ש: האם אני יכול להשתמש במסד נתונים קיים במקום ליצור חדש?**  
ת: כן, עדכן את `infra/main.bicep` כדי להתייחס ל-SQL Server קיים ועדכן את פרמטרי מחרוזת החיבור.

---

> **הערה:** דוגמה זו מדגימה שיטות עבודה מומלצות לפריסת אפליקציית אינטרנט עם מסד נתונים באמצעות AZD. היא כוללת קוד עובד, תיעוד מקיף ותרגילים מעשיים לחיזוק הלמידה. לפריסות ייצור, סקור דרישות אבטחה, סקיילינג, תאימות ועלויות ספציפיות לארגון שלך.

**📚 ניווט בקורס:**
- ← קודם: [דוגמת אפליקציות קונטיינר](../../../../examples/container-app)
- → הבא: [מדריך אינטגרציית AI](../../../../docs/ai-foundry)
- 🏠 [דף הבית של הקורס](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. איננו אחראים לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->