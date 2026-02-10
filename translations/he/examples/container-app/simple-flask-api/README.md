# דוגמת אפליקציית Container פשוטה עם Flask API

**מסלול הלמידה:** מתחילים ⭐ | **זמן:** 25-35 דקות | **עלות:** 0-15$/חודש

API של Flask עם Python מלא, ומתפקד, מסוג REST, מנוהל באמצעות Azure Container Apps עם כלי Azure Developer CLI (azd). דוגמה זו ממחישה פריסת מכולות, קנה מידה אוטומטי, ועקרונות מעקב.

## 🎯 מה תלמדו

- לפרוס אפליקציית Python מכולה ל-Azure  
- להגדיר קנה מידה אוטומטי עם קנה מידה לאפס  
- ליישם בדיקות בריאות ובדיקות מוכנות  
- לנטר יומני אפליקציה ומדדים  
- להשתמש ב-Azure Developer CLI לפריסה מהירה  

## 📦 כלול בחבילה

✅ **אפליקציית Flask** - REST API מלא עם פעולות CRUD (`src/app.py`)  
✅ **Dockerfile** - הגדרת מכולה מוכנה לייצור  
✅ **תשתית Bicep** - סביבת Container Apps ופריסת API  
✅ **קביעת תצורת AZD** - פריסה בפקודה אחת  
✅ **בדיקות בריאות** - לימות פעילות והכנות מוגדרות  
✅ **קנה מידה אוטומטי** - 0-10 שכפולים לפי עומס HTTP  

## ארכיטקטורה

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## דרישות מוקדמות

### דרוש
- **Azure Developer CLI (azd)** - [מדריך התקנה](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **מנוי Azure** - [חשבון חינמי](https://azure.microsoft.com/free/)  
- **Docker Desktop** - [התקנת Docker](https://www.docker.com/products/docker-desktop/) (לבדיקות מקומיות)  

### אימות דרישות מוקדמות

```bash
# בדוק את גרסת azd (נדרש 1.5.0 ומעלה)
azd version

# אמת את הכניסה ל-Azure
azd auth login

# בדוק את Docker (אופציונלי, לבדיקות מקומיות)
docker --version
```

## ⏱️ טיימליין פריסה

| שלב | משך זמן | מה קורה |
|-------|----------|--------------||
| הקמת סביבת עבודה | 30 שניות | יצירת סביבת azd |
| בניית מכולה | 2-3 דקות | בניית Docker לאפליקציית Flask |
| פריסת תשתית | 3-5 דקות | יצירת Container Apps, רישום, מעקב |
| פריסת אפליקציה | 2-3 דקות | העלאת תמונה ופריסה ל-Container Apps |
| **סה"כ** | **8-12 דקות** | פריסה מלאה מוכנה |

## התחלה מהירה

```bash
# נווט לדוגמה
cd examples/container-app/simple-flask-api

# אתחל סביבה (בחר שם ייחודי)
azd env new myflaskapi

# פרוס הכל (תשתית + יישום)
azd up
# תתבקש ל:
# 1. לבחור מנוי Azure
# 2. לבחור מיקום (למשל eastus2)
# 3. המתן 8-12 דקות לפריסה

# קבל את נקודת הקצה של ה-API שלך
azd env get-values

# בדוק את ה-API
curl $(azd env get-value API_ENDPOINT)/health
```

**פלט צפוי:**  
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ אימות פריסה

### שלב 1: בדיקת סטטוס הפריסה

```bash
# צפייה בשירותים שהופעלו
azd show

# הפלט הצפוי מציג:
# - שירות: api
# - נקודת קצה: https://ca-api-[env].xxx.azurecontainerapps.io
# - מצב: פועל
```

### שלב 2: בדיקת נקודות קצה API

```bash
# לקבל נקודת קצה של API
API_URL=$(azd env get-value API_ENDPOINT)

# בדוק את בריאות
curl $API_URL/health

# בדוק את נקודת הקצה השורשית
curl $API_URL/

# צור פריט
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# קבל את כל הפריטים
curl $API_URL/api/items
```

**קריטריוני הצלחה:**  
- ✅ נקודת בריאות מחזירה HTTP 200  
- ✅ נקודת שורש מציגה מידע על ה-API  
- ✅ POST יוצר פריט ומחזיר HTTP 201  
- ✅ GET מחזיר את הפריטים שיצרנו  

### שלב 3: צפייה ביומנים

```bash
# הזרם יומני רישום חיים באמצעות azd monitor
azd monitor --logs

# או השתמש ב-Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# עליך לראות:
# - הודעות הפעלה של Gunicorn
# - יומני בקשות HTTP
# - יומני מידע של היישום
```

## מבנה הפרויקט

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## נקודות קצה API

| נקודת קצה | שיטה | תיאור |
|----------|--------|-------------|
| `/health` | GET | בדיקת בריאות |
| `/api/items` | GET | רשימת כל הפריטים |
| `/api/items` | POST | יצירת פריט חדש |
| `/api/items/{id}` | GET | קבלת פריט ספציפי |
| `/api/items/{id}` | PUT | עדכון פריט |
| `/api/items/{id}` | DELETE | מחיקת פריט |

## קונפיגורציה

### משתני סביבה

```bash
# הגדר תצורה מותאמת אישית
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### קביעת קנה מידה

ה-API מבצע קנה מידה אוטומטי על פי תעבורת HTTP:  
- **מינימום שכפולים**: 0 (מקשה לקנה מידה לאפס כשהוא במצב לא פעיל)  
- **מקסימום שכפולים**: 10  
- **בקשות במקביל לכל שכפול**: 50  

## פיתוח

### הרצה מקומית

```bash
# התקן תלותים
cd src
pip install -r requirements.txt

# הפעל את האפליקציה
python app.py

# בדוק מקומית
curl http://localhost:8000/health
```

### בנייה ובדיקה של מכולה

```bash
# לבנות תמונת Docker
docker build -t flask-api:local ./src

# להריץ מיכל באופן מקומי
docker run -p 8000:8000 flask-api:local

# לבדוק מיכל
curl http://localhost:8000/health
```

## פריסה

### פריסה מלאה

```bash
# פרוס תשתית ויישום
azd up
```

### פריסה של קוד בלבד

```bash
# לפרוס רק קוד אפליקציה (התשתית לא השתנתה)
azd deploy api
```

### עדכון תצורה

```bash
# עדכן משתני סביבה
azd env set API_KEY "new-api-key"

# פרוס מחדש עם תצורה חדשה
azd deploy api
```

## מעקב

### צפייה ביומנים

```bash
# הזרם יומן חי באמצעות azd monitor
azd monitor --logs

# או השתמש ב-Azure CLI עבור אפליקציות מכולה:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# הצג את 100 השורות האחרונות
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### ניטור מדדים

```bash
# פתח את לוח הבקרה של Azure Monitor
azd monitor --overview

# צפה במדדים ספציפיים
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## בדיקות

### בדיקת בריאות

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

תגובה צפויה:  
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### יצירת פריט

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### קבלת כל הפריטים

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## אופטימיזציית עלויות

פריסה זו משתמשת בקנה מידה לאפס, כך שתשלמו רק כאשר ה-API מטפל בבקשות:

- **עלות במצב סרק**: כ-0$/חודש (הולך לאפס)  
- **עלות פעילה**: כ-0.000024$/שנייה לשכפול  
- **עלות צפויה לחודש** (שימוש קל): 5-15$

### דרכים להפחתת עלויות נוספות

```bash
# להקטין את מספר המחשבונות המרביים לסביבת הפיתוח
azd env set MAX_REPLICAS 3

# להשתמש בזמן המתנה קצר יותר
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 דקות
```

## תיקון תקלות

### המכולה לא מתחילה לפעול

```bash
# בדוק יומני מכולות באמצעות Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# אמת בניות תמונת Docker מקומית
docker build -t test ./src
```

### ה-API לא נגיש

```bash
# בדוק שהכניסה חיצונית
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### זמני תגובה ארוכים

```bash
# בדוק שימוש במעבד/זיכרון
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# הגדל את המשאבים במידת הצורך
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## ניקוי

```bash
# מחק את כל המשאבים
azd down --force --purge
```

## צעדים הבאים

### הרחבת הדוגמה הזו

1. **הוספת מסד נתונים** - אינטגרציה עם Azure Cosmos DB או מסד SQL  
   ```bash
   # הוסף מודול Cosmos DB ל-infra/main.bicep
   # עדכן את app.py עם חיבור למסד הנתונים
   ```

2. **הוספת אימות** - יישום Azure AD או מפתחות API  
   ```python
   # הוסף middleware של אימות ל-app.py
   from functools import wraps
   ```

3. **הקמת CI/CD** - זרימת עבודה באמצעות GitHub Actions  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **הוספת זהות מנוהלת** - גישה מאובטחת לשירותי Azure  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### דוגמאות קשורות

- **[אפליקציית מסד נתונים](../../../../../examples/database-app)** - דוגמה מלאה עם מסד SQL  
- **[מיקרו-שירותים](../../../../../examples/container-app/microservices)** - ארכיטקטורת שירותים מרובים  
- **[מדריך ראשי ל-Container Apps](../README.md)** - כל דפוסי המכולות  

### משאבי למידה

- 📚 [קורס AZD למתחילים](../../../README.md) - דף הבית של הקורס  
- 📚 [דפוסי Container Apps](../README.md) - דפוסי פריסה נוספים  
- 📚 [גלריית תבניות AZD](https://azure.github.io/awesome-azd/) - תבניות קהילתיות  

## משאבים נוספים

### תיעוד  
- **[תיעוד Flask](https://flask.palletsprojects.com/)** - מדריך לפריימוורק Flask  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - תיעוד רשמי של Azure  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - מימוש פקודות azd  

### מדריכים  
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - פריסת האפליקציה הראשונה שלך  
- **[Python ב-Azure](https://learn.microsoft.com/azure/developer/python/)** - מדריך פיתוח Python  
- **[שפת Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - תשתית כשירות קוד

### כלים  
- **[פורטל Azure](https://portal.azure.com)** - ניהול משאבים חזותי  
- **[הרחבת VS Code ל-Azure](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - אינטגרציה עם IDE  

---

**🎉 מזל טוב!** פרסתם בהצלחה Flask API מוכן לייצור עם Azure Container Apps וקנה מידה אוטומטי ומעקב.

**שאלות?** [פתחו בעיה](https://github.com/microsoft/AZD-for-beginners/issues) או בדקו את ה-[שאלות נפוצות](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדייק, יש לקחת בחשבון שתירגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפת המקור שלו צריך להיחשב כמקור המוסמך. למידע חיוני מומלץ להשתמש בתרגום מקצועי על ידי בני אדם. אנו לא נושאים באחריות לכל אי-הבנה או פרשנות שגויה הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->