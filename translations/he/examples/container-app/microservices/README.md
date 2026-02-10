# ארכיטקטורת מיקרו-שירותים - דוגמת אפליקציית קונטיינר

⏱️ **זמן מוערך**: 25-35 דקות | 💰 **עלות מוערכת**: ~$50-100/חודש | ⭐ **מורכבות**: מתקדמת

ארכיטקטורת מיקרו-שירותים **מפושטת אך פונקציונלית** שמפורסת לאזור Azure Container Apps באמצעות AZD CLI. דוגמה זו מציגה תקשורת בין שירותים, תיאום קונטיינרים וניטור בהגדרה מעשית עם שתי שירותים.

> **📚 גישת למידה**: הדוגמה מתחילה בארכיטקטורה מינימלית של 2 שירותים (שער API + שירות Backend) שניתן לפרוס וללמוד ממנה. לאחר שתרכשו את הבסיס, נספק הדרכה להרחבת המערכת למערכת מיקרו-שירותים שלמה.

## מה תלמדו

בסיום הדוגמה:
- לפרוס מספר קונטיינרים ל-Azure Container Apps
- לממש תקשורת שירות לשירות עם רשת פנימית
- להגדיר סקיילינג ובדיקות בריאות מבוססות סביבה
- לנטר אפליקציות מבוזרות עם Application Insights
- להבין דפוסי פריסת מיקרו-שירותים ונוהלי עבודה מיטביים
- ללמוד התרחבות הדרגתית מארכיטקטורות פשוטות למורכבות

## ארכיטקטורה

### שלב 1: מה אנחנו בונים (כלול בדוגמה זו)

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
- ✅ פרוס והבן במהירות (25-35 דקות)
- ✅ למד דפוסי מיקרו-שירותים מרכזיים בלי מורכבות
- ✅ קוד פעיל שאפשר לשנות ולנסות
- ✅ עלויות נמוכות ללמידה (~$50-100/חודש לעומת $300-1400/חודש)
- ✅ בנה ביטחון לפני הוספת מסדי נתונים ותורי הודעות

**אנלוגיה**: חשבו על זה כעל לימוד נהיגה. מתחילים בחנייה ריקה (2 שירותים), שולטו ביסודות ואז מתקדמים לתנועה בעיר (5+ שירותים עם מסדי נתונים).

### שלב 2: הרחבה עתידית (ארכיטקטורת ייחוס)

ברגע שתשלוטו בארכיטקטורת 2 השירותים, תוכלו להרחיב ל:

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

ראו בסוף תחת "מדריך הרחבה" הוראות מפורטות שלב-אחרי-שלב.

## תכונות כלולות

✅ **גילוי שירות**: גילוי אוטומטי מבוסס DNS בין הקונטיינרים  
✅ **איזון עומסים**: איזון עומס מובנה בין העותקים  
✅ **סקיילינג אוטומטי**: סקיילינג עצמאי לכל שירות לפי בקשות HTTP  
✅ **ניטור בריאות**: בדיקות liveness ו-readiness לשני השירותים  
✅ **רישום מבוזר**: רישום מרכזי עם Application Insights  
✅ **רשת פנימית**: תקשורת מאובטחת בין שירותים  
✅ **תיאום קונטיינרים**: פריסה וסקיילינג אוטומטיים  
✅ **עדכונים ללא הפסקה**: עדכוני גלילה עם ניהול גרסאות  

## דרישות מוקדמות

### כלים נדרשים

לפני שמתחילים, ודאו שיש ברשותכם את הכלים האלה:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (גרסה 1.0.0 ומעלה)
   ```bash
   azd version
   # פלט צפוי: גרסת azd 1.0.0 ומעלה
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (גרסה 2.50.0 ומעלה)
   ```bash
   az --version
   # הפלט הצפוי: azure-cli גרסה 2.50.0 או מוגדל יותר
   ```

3. **[Docker](https://www.docker.com/get-started)** (לפיתוח/בדיקות מקומיות - אופציונלי)
   ```bash
   docker --version
   # פלט צפוי: גרסת Docker 20.10 או גבוהה יותר
   ```

### דרישות Azure

- מנוי **Azure פעיל** ([צרו חשבון חינמי](https://azure.microsoft.com/free/))
- הרשאות ליצירת משאבים במנוי שלכם
- תפקיד **Contributor** במנוי או בקבוצת המשאבים

### דרישות ידע

מדובר בדוגמה ברמת ידע **מתקדמת**. יש להכיר:
- השלמת דוגמת [Simple Flask API](../../../../../examples/container-app/simple-flask-api) 
- הבנה בסיסית של ארכיטקטורת מיקרו-שירותים
- היכרות עם REST APIs ו-HTTP
- הבנת מושגי קונטיינרים

**חדש ב-Container Apps?** התחילו עם דוגמת [Simple Flask API](../../../../../examples/container-app/simple-flask-api) כדי ללמוד את הבסיס.

## התחלה מהירה (שלב-אחר-שלב)

### שלב 1: שיבוט וניווט

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ בדיקת הצלחה**: ודאו שקיים `azure.yaml`:
```bash
ls
# צפוי: README.md, azure.yaml, infra/, src/
```

### שלב 2: אימות עם Azure

```bash
azd auth login
```

זה יפתח דפדפן לאימות Azure. התחברו עם פרטי Azure שלכם.

**✓ בדיקת הצלחה**: תראו:
```
Logged in to Azure.
```

### שלב 3: אתחול הסביבה

```bash
azd init
```

**המסכים שתראו**:
- **שם סביבה**: הקלידו שם קצר (למשל `microservices-dev`)
- **מנוי Azure**: בחרו את המנוי שלכם
- **אזור Azure**: בחרו אזור (כמו `eastus`, `westeurope`)

**✓ בדיקת הצלחה**: תראו:
```
SUCCESS: New project initialized!
```

### שלב 4: פריסת תשתית ושירותים

```bash
azd up
```

**מה מתרחש** (לוקח 8-12 דקות):
1. יצירת סביבה ב-Container Apps
2. יצירת Application Insights לניטור
3. בניית מיכל של API Gateway (Node.js)
4. בניית מיכל של Product Service (Python)
5. פריסת שני המיכלים ל-Azure
6. הגדרת רשת ובדיקות בריאות
7. הקמת ניטור ורישום

**✓ בדיקת הצלחה**: תראו:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ זמן**: 8-12 דקות

### שלב 5: בדיקה של הפריסה

```bash
# קבל את נקודת הקצה של שער ה-Gateway
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# בדוק את בריאות API Gateway
curl $GATEWAY_URL/health

# הפלט הצפוי:
# {"status":"בריא","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**בדיקת שירות מוצר דרך השער**:
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

**🎉 מזל טוב!** פרסתם ארכיטקטורת מיקרו-שירותים ב-Azure!

## מבנה הפרויקט

כל קבצי היישום כלולים – זו דוגמה מלאה ופועלת:

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

**תפקיד כל רכיב:**

**תשתית (infra/)**:
- `main.bicep`: מתאם את כל המשאבים והקשרים ב-Azure
- `core/container-apps-environment.bicep`: יוצר את סביבת Container Apps ו-Azure Container Registry
- `core/monitor.bicep`: מקים Application Insights לרישום מבוזר
- `app/*.bicep`: הגדרות אפליקציות קונטיינרים עם סקיילינג ובדיקות בריאות

**API Gateway (src/api-gateway/)**:
- שירות פומבי שמפנה בקשות לשירותי backend
- מממש רישום, טיפול בשגיאות, ושליחה לפנים
- מדגים תקשורת HTTP בין שירותים

**Product Service (src/product-service/)**:
- שירות פנימי עם קטלוג מוצרים (בזיכרון לפשטות)
- REST API עם בדיקות בריאות
- דוגמה לדפוס מיקרו-שירות backend

## סקירת שירותים

### API Gateway (Node.js/Express)

**פורט**: 8080  
**גישה**: פומבי (כניסת חוץ)  
**מטרה**: מנתב בקשות נכנסות לשירותי backend מתאימים  

**נקודות קצה**:
- `GET /` - מידע על השירות
- `GET /health` - נקודת בדיקת בריאות
- `GET /api/products` - הפנייה לשירות מוצר (רשימת הכל)
- `GET /api/products/:id` - הפנייה לשירות מוצר (פריט לפי מזהה)

**תכונות מרכזיות**:
- ניתוב בקשות עם axios
- רישום מרכזי
- טיפול בשגיאות וניהול תזמון
- גילוי שירות דרך משתני סביבה
- אינטגרציה עם Application Insights

**הדגשת קוד** (`src/api-gateway/app.js`):
```javascript
// תקשורת שירות פנימית
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### שירות מוצר (Python/Flask)

**פורט**: 8000  
**גישה**: פנימי בלבד (ללא כניסת חוץ)  
**מטרה**: ניהול קטלוג מוצרים בזיכרון פנימי  

**נקודות קצה**:
- `GET /` - מידע על השירות
- `GET /health` - נקודת בדיקת בריאות
- `GET /products` - רשימת כל המוצרים
- `GET /products/<id>` - מוצר לפי מזהה

**תכונות מרכזיות**:
- API RESTful עם Flask
- אחסון מוצר בזיכרון (פשוט, ללא צורך במסד נתונים)
- ניטור בריאות עם probes
- רישום מובנה
- אינטגרציה עם Application Insights

**מודל הנתונים**:
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
שירות המוצר לא חשוף לציבור. כל הבקשות חייבות לעבור דרך שער ה-API, שמספק:
- אבטחה: נקודת גישה מבוקרת
- גמישות: ניתן לשנות backend בלי להשפיע על הלקוחות
- ניטור: רישום בקשות מרכזי

## הבנת תקשורת שירות-לשירות

### איך השירותים מתקשרים ביניהם

בדוגמה זו, API Gateway מתקשר עם Product Service באמצעות **קריאות HTTP פנימיות**:

```javascript
// שער API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// בצע בקשת HTTP פנימית
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**נקודות מפתח**:

1. **גילוי מבוסס DNS**: Container Apps מספק אוטומטית DNS לשירותים פנימיים
   - FQDN שירות מוצר: `product-service.internal.<environment>.azurecontainerapps.io`
   - מפושט ל: `http://product-service` (Container Apps פותרת את זה)

2. **ללא חשיפה ציבורית**: לשירות מוצר יש `external: false` ב-Bicep
   - נגיש רק בתוך סביבת Container Apps
   - לא ניתן לגשת מהאינטרנט

3. **משתני סביבה**: כתובות השירות מוזרמות בזמן הפריסה
   - Bicep מעביר את ה-FQDN הפנימי לשער
   - אין כתובות קשיחות בקוד היישום

**אנלוגיה**: חשבו על זה כחדרי משרד. שער ה-API הוא דלפק קבלה (פומבי), ושירות המוצר הוא חדר במשרד (פנימי בלבד). מבקרים צריכים לעבור דרך הקבלה כדי להגיע לחדר.

## אפשרויות פריסה

### פריסה מלאה (מומלץ)

```bash
# פרוס תשתית ואת שתי השירותים
azd up
```

זה יפרוס:
1. סביבת Container Apps
2. Application Insights
3. Container Registry
4. מיכל API Gateway
5. מיכל שירות מוצר

**זמן**: 8-12 דקות

### לפרוס שירות יחיד

```bash
# לפרוס שירות אחד בלבד (אחרי הפעלת azd up ראשונית)
azd deploy api-gateway

# או לפרוס את שירות המוצר
azd deploy product-service
```

**מקרה שימוש**: כאשר עדכנתם קוד באחד השירותים ורוצים לפרוס רק אותו.

### עדכון תצורה

```bash
# שינוי פרמטרי קנה מידה
azd env set GATEWAY_MAX_REPLICAS 30

# פרוס מחדש עם תצורה חדשה
azd up
```

## תצורה

### קונפיגורציית סקיילינג

שני השירותים מוגדרים עם סקיילינג אוטומטי מבוסס HTTP בקבצי ה-Bicep שלהם:

**API Gateway**:
- מינימום עותקים: 2 (תמיד לפחות 2 לזמינות)
- מקסימום עותקים: 20
- טריגר סקיילינג: 50 בקשות בו זמנית לכל עותק

**Product Service**:
- מינימום עותקים: 1 (יכול לרדת לאפס לפי הצורך)
- מקסימום עותקים: 10
- טריגר סקיילינג: 100 בקשות בו זמנית לכל עותק

**התאמת סקיילינג** (ב- `infra/app/*.bicep`):
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
- סיבה: מטפל כל התעבורה החיצונית

**Product Service**:
- CPU: 0.5 vCPU
- זיכרון: 1 GiB
- סיבה: פעולות זיכרון קלות

### בדיקות בריאות

שני השירותים כוללים probes של liveness ו-readiness:

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
- **Liveness**: אם בדיקת הבריאות נכשלת, Container Apps מפעילה מחדש את הקונטיינר
- **Readiness**: אם לא מוכן, Container Apps מפסיקה לנתב אליו תעבורה



## ניטור ותצפית

### צפייה ביומני שירות

```bash
# הצג יומנים באמצעות azd monitor
azd monitor --logs

# או השתמש ב-Azure CLI עבור אפליקציות מכולה ספציפיות:
# הזרם יומנים מ-API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# הצג יומני שירות מוצר אחרונים
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**פלט צפוי**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### שאילתות Application Insights

גשו ל-Application Insights ב-Portal של Azure, והריצו את השאילתות האלה:

**מצא בקשות איטיות**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**עקוב אחרי קריאות שירות לשירות**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**קצב שגיאות לפי שירות**:
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

### גש ללוח ניטור

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

1. נווט ל-Application Insights ב-Portal Azure
2. לחץ על "Live Metrics"
3. ראה בקשות, כשלונות וביצועים בזמן אמת
4. בדוק ע"י הרצה: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## תרגילים מעשיים

[הערה: עיינו בתרגילים המלאים לעיל בקטגוריית "תרגילים מעשיים" לפעילויות מפורטות עם אימות פריסה, שינוי נתונים, בדיקות סקיילינג, טיפול בשגיאות והוספת שירות שלישי.]

## ניתוח עלויות

### עלויות חודשיות מוערכות (עבור הדוגמה של 2 שירותים)

| משאב | קונפיגורציה | עלות מוערכת |
|----------|--------------|----------------|
| API Gateway | 2-20 עותקים, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 עותקים, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | שכבת בסיס | $5 |
| Application Insights | 1-2 GB/חודש | $5-10 |
| Log Analytics | 1 GB/חודש | $3 |
| **סה"כ** | | **$58-243/חודש** |

**פירוט עלויות לפי שימוש**:
- **תעבורה קלה** (בדיקות/למידה): ~$60/חודש
- **תעבורה בינונית** (ייצור קטן): ~$120/חודש
- **תעבורה כבדה** (תקופות עמוסות): ~$240/חודש

### טיפים לאופטימיזציית עלויות

1. **סקיילינג לאפס לפיתוח**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **השתמש בתוכנית צריכה ל-Cosmos DB** (כשמתווסף):
   - תשלמו רק על השימוש
   - ללא חיוב מינימום

3. **הגדר דגימה ב-Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // דגום 50% מהבקשות
   ```

4. **נקה כשלא נדרש**:
   ```bash
   azd down
   ```

### אפשרויות שכבת חינם
ללמידה/בדיקה, שקול:
- השתמש במקרדיטים חינמיים של Azure (30 הימים הראשונים)
- שמור על מינימום עותקים
- מחק לאחר הבדיקה (ללא חיובים שוטפים)

---

## ניקוי

כדי למנוע חיובים שוטפים, מחק את כל המשאבים:

```bash
azd down --force --purge
```

**אישור**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

הקלד `y` לאישור.

**מה נמחק**:
- סביבה של Container Apps
- שני ה-Container Apps (שער ושירות מוצר)
- Container Registry
- Application Insights
- Log Analytics Workspace
- קבוצת משאבים

**✓ אימות ניקוי**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

צריך להחזיר ריק.

---

## מדריך הרחבה: מ-2 ל-5+ שירותים

לאחר שהשתלטת על ארכיטקטורה של שני שירותים, כך להרחיב:

### שלב 1: הוסף אחסון נתונים (הצעד הבא)

**הוסף Cosmos DB לשירות מוצר**:

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

2. עדכן את שירות המוצר לשימוש ב-Cosmos DB במקום בזכרון פנימי

3. עלות משוערת נוספת: כ-25$/חודש (serverless)

### שלב 2: הוסף שירות שלישי (ניהול הזמנות)

**צור שירות הזמנות**:

1. תיקייה חדשה: `src/order-service/` (Python/Node.js/C#)
2. Bicep חדש: `infra/app/order-service.bicep`
3. עדכן API Gateway לנתיב `/api/orders`
4. הוסף מסד נתונים Azure SQL לאחסון הזמנות

**הארכיטקטורה הופכת ל**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### שלב 3: הוסף תקשורת אסינכרונית (Service Bus)

**מימוש ארכיטקטורת מונחית אירועים**:

1. הוסף Azure Service Bus: `infra/core/servicebus.bicep`
2. שירות המוצר מפרסם אירועים "ProductCreated"
3. שירות ההזמנות מנוי לאירועי מוצר
4. הוסף שירות התראות לעיבוד האירועים

**תבנית**: בקשה/תגובה (HTTP) + מונחית אירועים (Service Bus)

### שלב 4: הוסף אימות משתמש

**מימוש שירות משתמש**:

1. צור `src/user-service/` (Go/Node.js)
2. הוסף Azure AD B2C או אימות JWT מותאם אישית
3. API Gateway מאמת אסימוני גישה
4. השירותים בודקים הרשאות משתמש

### שלב 5: מוכנות לייצור

**הוסף את הרכיבים הבאים**:
- Azure Front Door (איזון עומסים גלובלי)
- Azure Key Vault (ניהול סודות)
- Azure Monitor Workbooks (לוחות מחוונים מותאמים)
- צינור CI/CD (GitHub Actions)
- פריסות Blue-Green
- זהות מנוהלת לכל השירותים

**עלות מלאה של ארכיטקטורת הייצור**: כ-300-1,400$/חודש

---

## למידע נוסף

### תיעוד קשור
- [תיעוד Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [מדריך ארכיטקטורת מיקרו-שירותים](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights למעקב מפוזר](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### הצעדים הבאים בקורס זה
- ← קודם: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - דוגמת מיכל יחיד למתחילים
- → הבא: [מדריך אינטגרציית AI](../../../../../examples/docs/ai-foundry) - הוספת יכולות AI
- 🏠 [בית הקורס](../../README.md)

### השוואה: מתי להשתמש במה

**אפליקציית מיכל יחיד** (דוגמת Simple Flask API):
- ✅ אפליקציות פשוטות
- ✅ ארכיטקטורה מונוליתית
- ✅ פריסה מהירה
- ❌ סקלביליות מוגבלת
- **עלות**: כ-15-50$/חודש

**מיקרו-שירותים** (בדוגמה זו):
- ✅ אפליקציות מורכבות
- ✅ סקלביליות עצמאית לכל שירות
- ✅ אוטונומיה לצוותים שונים
- ❌ ניהול מורכב יותר
- **עלות**: כ-60-250$/חודש

**Kubernetes (AKS)**:
- ✅ שליטה וגמישות מקסימליים
- ✅ ניידות ריבו-עננית
- ✅ רשת מתקדמת
- ❌ מצריך מומחיות ב-Kubernetes
- **עלות**: מינימום כ-150-500$/חודש

**המלצה**: התחל עם Container Apps (בדוגמה זו), עבור ל-AKS רק במידת הצורך לפיצ'רים ספציפיים.

---

## שאלות נפוצות

**ש: למה רק 2 שירותים במקום 5+?**  
ת: התקדמות חינוכית. שלוט ביסודות (תקשורת שירותים, ניטור, סקלינג) עם דוגמה פשוטה לפני הוספת מורכבות. התבניות שלמדת כאן תקפות לארכיטקטורת 100 שירותים.

**ש: האם אפשר להוסיף עוד שירותים לבד?**  
ת: בהחלט! עקוב אחרי מדריך ההרחבה למעלה. כל שירות חדש עוקב אחרי אותה תבנית: צור תיקיית src, צור קובץ Bicep, עדכן azure.yaml, פרוס.

**ש: האם זה מוכן לייצור?**  
ת: זו בסיס איתן. לייצור, הוסף: זהות מנוהלת, Key Vault, מסדי נתונים מתמשכים, צינור CI/CD, התראות ניטור, ואסטרטגיית גיבוי.

**ש: למה לא להשתמש ב-Dapr או mesh שירות אחר?**  
ת: שמור על הפשטות ללמידה. ברגע שתבין את הרשת הפנימית של Container Apps, תוכל להוסיף Dapr לתרחישים מתקדמים.

**ש: איך עושים דיבוג מקומי?**  
ת: הרץ שירותים מקומית עם Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**ש: אפשר להשתמש בשפות תכנות שונות?**  
ת: כן! בדוגמה זו מציג Node.js (gateway) + Python (שירות מוצר). ניתן לשלב כל שפות שרצות במיכלים.

**ש: מה אם אין לי מקרדיטים ב-Azure?**  
ת: השתמש בשכבת Azure החינמית (30 הימים הראשונים לחשבונות חדשים) או פרוס זמנית לבדיקות קצרות ומחק מיד.

---

> **🎓 סיכום מסלול למידה**: למדת לפרוס ארכיטקטורה מרובת שירותים עם סקלינג אוטומטי, רשת פנימית, ניטור מרכזי, ותבניות מוכנות לייצור. בסיס זה מוכן להרחבה למערכות מבוזרות מורכבות וארכיטקטורות מיקרו-שירותים ארגוניות.

**📚 ניווט בקורס:**
- ← קודם: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → הבא: [דוגמה לאינטגרציית מסד נתונים](../../../../../examples/database-app)
- 🏠 [בית הקורס](../../../README.md)
- 📖 [הנחיות מיטב פרקטיקות Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש לקחת בחשבון כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפת המקור שלו צריך להיחשב כמקור הסמכותי. למידע קריטי מומלץ לקבל תרגום מקצועי ואנושי. אנו לא נושאים באחריות על כל אי הבנות או פרשנויות שגויות הנובעות מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->