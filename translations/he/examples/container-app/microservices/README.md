# ארכיטקטורת מיקרו-שירותים - דוגמה לאפליקציות מכולות

⏱️ **זמן משוער**: 25-35 דקות | 💰 **עלות משוערת**: ~$50-100 לחודש | ⭐ **רמת קושי**: מתקדם

ארכיטקטורת מיקרו-שירותים **פשוטה אך פונקציונלית** המופעלת ב-Azure Container Apps באמצעות AZD CLI. דוגמה זו מדגימה תקשורת בין שירותים, תזמור מכולות וניטור עם תצורה מעשית של שני שירותים.

> **📚 גישה ללמידה**: דוגמה זו מתחילה בארכיטקטורה מינימלית של שני שירותים (API Gateway + Backend Service) שתוכלו לפרוס וללמוד ממנה בפועל. לאחר שליטה ביסודות, אנו מספקים הדרכה להרחבה לאקוסיסטם מלא של מיקרו-שירותים.

## מה תלמדו

על ידי השלמת דוגמה זו, תלמדו:
- לפרוס מספר מכולות ל-Azure Container Apps
- ליישם תקשורת בין שירותים עם רשת פנימית
- להגדיר סקיילינג מבוסס סביבה ובדיקות בריאות
- לנטר אפליקציות מבוזרות עם Application Insights
- להבין דפוסי פריסה של מיקרו-שירותים ופרקטיקות מומלצות
- ללמוד הרחבה פרוגרסיבית מארכיטקטורה פשוטה למורכבת

## ארכיטקטורה

### שלב 1: מה אנו בונים (כלול בדוגמה זו)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**למה להתחיל פשוט?**
- ✅ לפרוס ולהבין במהירות (25-35 דקות)
- ✅ ללמוד דפוסי מיקרו-שירותים בסיסיים ללא מורכבות
- ✅ קוד עובד שתוכלו לשנות ולנסות
- ✅ עלות נמוכה ללמידה (~$50-100 לחודש לעומת $300-1400 לחודש)
- ✅ לבנות ביטחון לפני הוספת מסדי נתונים ותורי הודעות

**אנלוגיה**: חשבו על זה כמו ללמוד לנהוג. מתחילים בחניון ריק (2 שירותים), שולטים ביסודות, ואז מתקדמים לתנועה עירונית (5+ שירותים עם מסדי נתונים).

### שלב 2: הרחבה עתידית (ארכיטקטורת ייחוס)

לאחר שליטה בארכיטקטורה של שני שירותים, תוכלו להרחיב ל:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

ראו את סעיף "מדריך הרחבה" בסוף להוראות שלב-אחר-שלב.

## תכונות כלולות

✅ **גילוי שירותים**: גילוי אוטומטי מבוסס DNS בין מכולות  
✅ **איזון עומסים**: איזון עומסים מובנה בין רפליקות  
✅ **סקיילינג אוטומטי**: סקיילינג עצמאי לכל שירות בהתבסס על בקשות HTTP  
✅ **ניטור בריאות**: בדיקות חיות ומוכנות לשני השירותים  
✅ **לוגים מבוזרים**: לוגים מרכזיים עם Application Insights  
✅ **רשת פנימית**: תקשורת מאובטחת בין שירותים  
✅ **תזמור מכולות**: פריסה וסקיילינג אוטומטיים  
✅ **עדכונים ללא השבתה**: עדכונים מתגלגלים עם ניהול גרסאות  

## דרישות מקדימות

### כלים נדרשים

לפני שמתחילים, ודאו שיש לכם את הכלים הבאים מותקנים:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (גרסה 1.0.0 או גבוהה יותר)  
   ```bash
   azd version
   # תוצאה צפויה: גרסת azd 1.0.0 או גבוהה יותר
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (גרסה 2.50.0 או גבוהה יותר)  
   ```bash
   az --version
   # תוצאה צפויה: azure-cli 2.50.0 או גבוה יותר
   ```

3. **[Docker](https://www.docker.com/get-started)** (לפיתוח/בדיקה מקומית - אופציונלי)  
   ```bash
   docker --version
   # פלט צפוי: גרסת Docker 20.10 או גבוהה יותר
   ```

### דרישות Azure

- מנוי **Azure** פעיל ([צרו חשבון חינמי](https://azure.microsoft.com/free/))
- הרשאות ליצירת משאבים במנוי שלכם
- תפקיד **Contributor** במנוי או בקבוצת המשאבים

### ידע מקדים

זו דוגמה ברמת **מתקדמים**. עליכם:
- להשלים את [דוגמת Flask API פשוטה](../../../../../examples/container-app/simple-flask-api)  
- להבין את יסודות ארכיטקטורת מיקרו-שירותים
- להכיר REST APIs ו-HTTP
- להבין מושגים של מכולות

**חדשים ל-Container Apps?** התחילו עם [דוגמת Flask API פשוטה](../../../../../examples/container-app/simple-flask-api) קודם כדי ללמוד את היסודות.

## התחלה מהירה (שלב-אחר-שלב)

### שלב 1: שיבוט וניווט

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ בדיקת הצלחה**: ודאו שאתם רואים `azure.yaml`:  
```bash
ls
# צפוי: README.md, azure.yaml, infra/, src/
```

### שלב 2: אימות מול Azure

```bash
azd auth login
```

זה פותח את הדפדפן שלכם לאימות מול Azure. התחברו עם האישורים שלכם.

**✓ בדיקת הצלחה**: אתם אמורים לראות:  
```
Logged in to Azure.
```

### שלב 3: אתחול הסביבה

```bash
azd init
```

**הנחיות שתראו**:
- **שם הסביבה**: הזינו שם קצר (לדוגמה, `microservices-dev`)
- **מנוי Azure**: בחרו את המנוי שלכם
- **מיקום Azure**: בחרו אזור (לדוגמה, `eastus`, `westeurope`)

**✓ בדיקת הצלחה**: אתם אמורים לראות:  
```
SUCCESS: New project initialized!
```

### שלב 4: פריסת תשתית ושירותים

```bash
azd up
```

**מה קורה** (לוקח 8-12 דקות):
1. יצירת סביבה ל-Container Apps
2. יצירת Application Insights לניטור
3. בניית מכולת API Gateway (Node.js)
4. בניית מכולת Product Service (Python)
5. פריסת שתי המכולות ל-Azure
6. הגדרת רשת ובדיקות בריאות
7. הגדרת ניטור ולוגים

**✓ בדיקת הצלחה**: אתם אמורים לראות:  
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ זמן**: 8-12 דקות

### שלב 5: בדיקת הפריסה

```bash
# קבל את נקודת הקצה של השער
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# בדוק את בריאות שער ה-API
curl $GATEWAY_URL/health

# פלט צפוי:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**בדיקת שירות המוצרים דרך השער**:  
```bash
# רשימת מוצרים
curl $GATEWAY_URL/api/products

# פלט צפוי:
# [
#   {"id":1,"name":"מחשב נייד","price":999.99,"stock":50},
#   {"id":2,"name":"עכבר","price":29.99,"stock":200},
#   {"id":3,"name":"מקלדת","price":79.99,"stock":150}
# ]
```

**✓ בדיקת הצלחה**: שני נקודות הקצה מחזירות נתוני JSON ללא שגיאות.

---

**🎉 מזל טוב!** פרסתם ארכיטקטורת מיקרו-שירותים ל-Azure!

## מבנה הפרויקט

כל קבצי היישום כלולים—זו דוגמה מלאה ועובדת:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**מה כל רכיב עושה:**

**תשתית (infra/)**:
- `main.bicep`: מתזמר את כל משאבי Azure ותלותיהם
- `core/container-apps-environment.bicep`: יוצר את סביבה ל-Container Apps ואת Azure Container Registry
- `core/monitor.bicep`: מגדיר Application Insights ללוגים מבוזרים
- `app/*.bicep`: הגדרות מכולות פרטניות עם סקיילינג ובדיקות בריאות

**API Gateway (src/api-gateway/)**:
- שירות ציבורי שמנתב בקשות לשירותי backend
- מיישם לוגים, טיפול בשגיאות והעברת בקשות
- מדגים תקשורת HTTP בין שירותים

**Product Service (src/product-service/)**:
- שירות פנימי עם קטלוג מוצרים (בזיכרון לפשטות)
- REST API עם בדיקות בריאות
- דוגמה לדפוס מיקרו-שירותים backend

## סקירת שירותים

### API Gateway (Node.js/Express)

**פורט**: 8080  
**גישה**: ציבורית (ingress חיצוני)  
**מטרה**: מנתב בקשות נכנסות לשירותי backend המתאימים  

**נקודות קצה**:
- `GET /` - מידע על השירות
- `GET /health` - נקודת בדיקת בריאות
- `GET /api/products` - העברה לשירות המוצרים (רשימת הכל)
- `GET /api/products/:id` - העברה לשירות המוצרים (קבלת לפי מזהה)

**תכונות עיקריות**:
- ניתוב בקשות עם axios
- לוגים מרכזיים
- טיפול בשגיאות וניהול זמן קצוב
- גילוי שירותים באמצעות משתני סביבה
- אינטגרציה עם Application Insights

**הדגשת קוד** (`src/api-gateway/app.js`):  
```javascript
// תקשורת שירות פנימית
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**פורט**: 8000  
**גישה**: פנימית בלבד (ללא ingress חיצוני)  
**מטרה**: מנהל קטלוג מוצרים עם נתונים בזיכרון  

**נקודות קצה**:
- `GET /` - מידע על השירות
- `GET /health` - נקודת בדיקת בריאות
- `GET /products` - רשימת כל המוצרים
- `GET /products/<id>` - קבלת מוצר לפי מזהה

**תכונות עיקריות**:
- API RESTful עם Flask
- חנות מוצרים בזיכרון (פשוט, ללא צורך במסד נתונים)
- ניטור בריאות עם בדיקות
- לוגים מובנים
- אינטגרציה עם Application Insights

**מודל נתונים**:  
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**למה פנימי בלבד?**
שירות המוצרים אינו חשוף לציבור. כל הבקשות חייבות לעבור דרך ה-API Gateway, שמספק:
- אבטחה: נקודת גישה מבוקרת
- גמישות: ניתן לשנות backend מבלי להשפיע על לקוחות
- ניטור: לוגים מרכזיים של בקשות

## הבנת תקשורת בין שירותים

### איך שירותים מתקשרים זה עם זה

בדוגמה זו, ה-API Gateway מתקשר עם שירות המוצרים באמצעות **קריאות HTTP פנימיות**:

```javascript
// שער API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// בצע בקשת HTTP פנימית
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**נקודות עיקריות**:

1. **גילוי מבוסס DNS**: Container Apps מספק באופן אוטומטי DNS לשירותים פנימיים  
   - FQDN של שירות המוצרים: `product-service.internal.<environment>.azurecontainerapps.io`  
   - מפושט ל: `http://product-service` (Container Apps פותר זאת)

2. **ללא חשיפה ציבורית**: לשירות המוצרים יש `external: false` ב-Bicep  
   - נגיש רק בתוך סביבה ל-Container Apps  
   - לא ניתן להגיע אליו מהאינטרנט

3. **משתני סביבה**: כתובות שירות מוזרקות בזמן הפריסה  
   - Bicep מעביר את ה-FQDN הפנימי לשער  
   - אין כתובות מקודדות בקוד היישום

**אנלוגיה**: חשבו על זה כמו חדרי משרד. ה-API Gateway הוא דלפק הקבלה (פונה לציבור), ושירות המוצרים הוא חדר משרד (פנימי בלבד). מבקרים חייבים לעבור דרך הקבלה כדי להגיע לכל חדר.

## אפשרויות פריסה

### פריסה מלאה (מומלץ)

```bash
# פרוס תשתית ושני השירותים
azd up
```

זה מפרס:
1. סביבה ל-Container Apps
2. Application Insights
3. Container Registry
4. מכולת API Gateway
5. מכולת Product Service

**זמן**: 8-12 דקות

### פריסת שירות פרטני

```bash
# פרוס רק שירות אחד (לאחר azd up ראשוני)
azd deploy api-gateway

# או פרוס שירות מוצר
azd deploy product-service
```

**שימוש**: כאשר עדכנתם קוד בשירות אחד ורוצים לפרוס מחדש רק את השירות הזה.

### עדכון תצורה

```bash
# שינוי פרמטרי קנה מידה
azd env set GATEWAY_MAX_REPLICAS 30

# פריסה מחדש עם תצורה חדשה
azd up
```

## תצורה

### תצורת סקיילינג

שני השירותים מוגדרים עם סקיילינג אוטומטי מבוסס HTTP בקבצי Bicep שלהם:

**API Gateway**:
- מינימום רפליקות: 2 (תמיד לפחות 2 לזמינות)
- מקסימום רפליקות: 20
- טריגר סקיילינג: 50 בקשות בו-זמניות לכל רפליקה

**Product Service**:
- מינימום רפליקות: 1 (יכול להתרחב לאפס אם צריך)
- מקסימום רפליקות: 10
- טריגר סקיילינג: 100 בקשות בו-זמניות לכל רפליקה

**התאמת סקיילינג** (ב-`infra/app/*.bicep`):  
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### הקצאת משאבים

**API Gateway**:
- CPU: 1.0 vCPU
- זיכרון: 2 GiB
- סיבה: מטפל בכל התעבורה החיצונית

**Product Service**:
- CPU: 0.5 vCPU
- זיכרון: 1 GiB
- סיבה: פעולות קלות בזיכרון

### בדיקות בריאות

שני השירותים כוללים בדיקות חיות ומוכנות:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**מה זה אומר**:
- **חיות**: אם בדיקת הבריאות נכשלת, Container Apps מאתחל את המכולה
- **מוכנות**: אם לא מוכן, Container Apps מפסיק לנתב תעבורה לרפליקה זו

## ניטור ותצפיות

### צפייה בלוגי שירות

```bash
# זרם יומנים מ-API Gateway
azd logs api-gateway --follow

# הצג יומני שירות מוצר אחרונים
azd logs product-service --tail 100

# הצג את כל היומנים משני השירותים
azd logs --follow
```

**פלט צפוי**:  
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### שאילתות Application Insights

גשו ל-Application Insights בפורטל Azure, ואז הריצו את השאילתות הבאות:

**מציאת בקשות איטיות**:  
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**מעקב אחר קריאות שירות-לשירות**:  
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**שיעור שגיאות לפי שירות**:  
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**נפח בקשות לאורך זמן**:  
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### גישה ללוח ניטור

```bash
# קבל פרטי Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# פתח את ניטור פורטל Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### מדדים חיים

1. נווטו ל-Application Insights בפורטל Azure  
2. לחצו על "מדדים חיים"  
3. ראו בקשות, כשלונות וביצועים בזמן אמת  
4. בדקו על ידי הרצה: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## תרגילים מעשיים

[הערה: ראו את התרגילים המלאים לעיל בסעיף "תרגילים מעשיים" להוראות מפורטות שלב-אחר-שלב כולל אימות פריסה, שינוי נתונים, בדיקות סקיילינג אוטומטי, טיפול בשגיאות והוספת שירות שלישי.]

## ניתוח עלויות

### עלויות חודשיות משוערות (לדוגמה זו של שני שירותים)

| משאב | תצורה | עלות משוערת |
|----------|--------------|----------------|
| API Gateway | 2-20 רפליקות, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 רפליקות, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | רמה בסיסית | $5 |
| Application Insights | 1-2 GB לחודש | $5-10 |
| Log Analytics | 1 GB לחודש | $3 |
| **סה"כ** | | **$58-243 לחודש** |

**פירוט עלויות לפי שימוש**:
- **תעבורה קלה** (בדיקה/למידה): ~$60 לחודש
- **תעבורה מתונה** (ייצור קטן): ~$120 לחודש
- **תעבורה גבוהה** (תקופות עמוסות): ~$240 לחודש

### טיפים לאופטימיזציית עלויות

1. **סקיילינג לאפס לפיתוח**:  
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **שימוש בתוכנית צריכה עבור Cosmos DB** (כשמוסיפים אותו):  
   - תשלום רק עבור מה שמשתמשים  
   - ללא חיוב מינימלי

3. **הגדרת דגימה ב-Application Insights**:  
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // דגום 50% מהבקשות
   ```

4. **ניקוי כשלא צריך**:  
   ```bash
   azd down
   ```

### אפשרויות רמה חינמית


ללימוד/בדיקה, שקול:
- השתמש בקרדיטים חינמיים של Azure (30 הימים הראשונים)
- שמור על מינימום רפליקות
- מחק לאחר הבדיקה (ללא חיובים מתמשכים)

---

## ניקוי

כדי להימנע מחיובים מתמשכים, מחק את כל המשאבים:

```bash
azd down --force --purge
```

**אישור מחיקה**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

הקלד `y` כדי לאשר.

**מה נמחק**:
- סביבה של Container Apps
- שני Container Apps (gateway ושירות המוצרים)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ אימות ניקוי**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

צריך להחזיר ריק.

---

## מדריך הרחבה: משני שירותים ל-5+ שירותים

לאחר שלמדת את הארכיטקטורה של שני שירותים, כך תוכל להרחיב:

### שלב 1: הוספת מסד נתונים (השלב הבא)

**הוסף Cosmos DB לשירות המוצרים**:

1. צור `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. עדכן את שירות המוצרים לשימוש ב-Cosmos DB במקום נתונים בזיכרון

3. עלות משוערת נוספת: ~$25 לחודש (שרת ללא מצב)

### שלב 2: הוספת שירות שלישי (ניהול הזמנות)

**צור שירות הזמנות**:

1. תיקייה חדשה: `src/order-service/` (Python/Node.js/C#)
2. קובץ Bicep חדש: `infra/app/order-service.bicep`
3. עדכן את API Gateway לנתב `/api/orders`
4. הוסף מסד נתונים Azure SQL לניהול הזמנות

**הארכיטקטורה הופכת ל**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### שלב 3: הוספת תקשורת אסינכרונית (Service Bus)

**יישום ארכיטקטורה מבוססת אירועים**:

1. הוסף Azure Service Bus: `infra/core/servicebus.bicep`
2. שירות המוצרים מפרסם אירועים "ProductCreated"
3. שירות ההזמנות נרשם לאירועי מוצרים
4. הוסף שירות התראות לעיבוד אירועים

**תבנית**: בקשה/תגובה (HTTP) + מבוסס אירועים (Service Bus)

### שלב 4: הוספת אימות משתמשים

**יישום שירות משתמשים**:

1. צור `src/user-service/` (Go/Node.js)
2. הוסף Azure AD B2C או אימות JWT מותאם אישית
3. API Gateway מאמת אסימונים
4. השירותים בודקים הרשאות משתמשים

### שלב 5: מוכנות לייצור

**הוסף את הרכיבים הבאים**:
- Azure Front Door (איזון עומסים גלובלי)
- Azure Key Vault (ניהול סודות)
- Azure Monitor Workbooks (לוחות מחוונים מותאמים אישית)
- CI/CD Pipeline (GitHub Actions)
- פריסות Blue-Green
- Managed Identity לכל השירותים

**עלות ארכיטקטורה מלאה לייצור**: ~$300-1,400 לחודש

---

## למידע נוסף

### תיעוד קשור
- [תיעוד Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [מדריך ארכיטקטורת מיקרו-שירותים](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights למעקב מבוזר](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### השלבים הבאים בקורס זה
- ← קודם: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - דוגמה למיכל יחיד למתחילים
- → הבא: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - הוספת יכולות AI
- 🏠 [דף הבית של הקורס](../../README.md)

### השוואה: מתי להשתמש במה

**Container App יחיד** (דוגמת Simple Flask API):
- ✅ יישומים פשוטים
- ✅ ארכיטקטורה מונוליתית
- ✅ פריסה מהירה
- ❌ יכולת הרחבה מוגבלת
- **עלות**: ~$15-50 לחודש

**מיקרו-שירותים** (דוגמה זו):
- ✅ יישומים מורכבים
- ✅ יכולת הרחבה עצמאית לכל שירות
- ✅ אוטונומיה צוותית (שירותים שונים, צוותים שונים)
- ❌ ניהול מורכב יותר
- **עלות**: ~$60-250 לחודש

**Kubernetes (AKS)**:
- ✅ שליטה וגמישות מרבית
- ✅ ניידות בין עננים
- ✅ רשתות מתקדמות
- ❌ דורש מומחיות ב-Kubernetes
- **עלות**: ~$150-500 לחודש מינימום

**המלצה**: התחל עם Container Apps (דוגמה זו), עבור ל-AKS רק אם אתה זקוק לתכונות ספציפיות של Kubernetes.

---

## שאלות נפוצות

**ש: למה רק שני שירותים במקום 5+?**  
ת: התקדמות חינוכית. למד את היסודות (תקשורת בין שירותים, ניטור, הרחבה) עם דוגמה פשוטה לפני הוספת מורכבות. הדפוסים שתלמד כאן חלים גם על ארכיטקטורות של 100 שירותים.

**ש: האם אני יכול להוסיף שירותים נוספים בעצמי?**  
ת: בהחלט! עקוב אחר מדריך ההרחבה למעלה. כל שירות חדש עוקב אחר אותו דפוס: צור תיקיית src, צור קובץ Bicep, עדכן azure.yaml, פרוס.

**ש: האם זה מוכן לייצור?**  
ת: זו תשתית מוצקה. לייצור, הוסף: זהות מנוהלת, Key Vault, מסדי נתונים מתמשכים, CI/CD, התראות ניטור ואסטרטגיית גיבוי.

**ש: למה לא להשתמש ב-Dapr או רשת שירותים אחרת?**  
ת: שמור על פשטות ללמידה. לאחר שתבין את הרשתות הטבעיות של Container Apps, תוכל להוסיף Dapr לתרחישים מתקדמים.

**ש: איך אני מבצע ניפוי שגיאות מקומי?**  
ת: הפעל שירותים מקומית עם Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**ש: האם אני יכול להשתמש בשפות תכנות שונות?**  
ת: כן! דוגמה זו מציגה Node.js (gateway) + Python (שירות מוצרים). אתה יכול לשלב כל שפות שרצות במיכלים.

**ש: מה אם אין לי קרדיטים של Azure?**  
ת: השתמש במדרגת החינם של Azure (30 הימים הראשונים עם חשבונות חדשים) או פרוס לתקופות בדיקה קצרות ומחק מיד.

---

> **🎓 סיכום מסלול הלמידה**: למדת לפרוס ארכיטקטורה מרובת שירותים עם הרחבה אוטומטית, רשת פנימית, ניטור מרכזי ודפוסים מוכנים לייצור. תשתית זו מכינה אותך למערכות מבוזרות מורכבות ולארכיטקטורות מיקרו-שירותים ארגוניות.

**📚 ניווט בקורס**:
- ← קודם: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → הבא: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [דף הבית של הקורס](../../README.md)
- 📖 [Best Practices ל-Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. אנו לא נושאים באחריות לאי הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->