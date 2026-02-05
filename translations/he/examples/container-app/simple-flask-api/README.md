# דוגמה לאפליקציית קונטיינר - API פשוט עם Flask

**מסלול לימוד:** מתחילים ⭐ | **זמן:** 25-35 דקות | **עלות:** $0-15 לחודש

API מלא ופעיל ב-Flask Python, פרוס ל-Azure Container Apps באמצעות Azure Developer CLI (azd). דוגמה זו מדגימה פריסה בקונטיינר, סקיילינג אוטומטי ובסיסי ניטור.

## 🎯 מה תלמדו

- לפרוס אפליקציה Python בקונטיינר ל-Azure  
- להגדיר סקיילינג אוטומטי עם scale-to-zero  
- ליישם בדיקות בריאות ובדיקות מוכנות  
- לנטר לוגים ומדדים של האפליקציה  
- להשתמש ב-Azure Developer CLI לפריסה מהירה  

## 📦 מה כלול

✅ **אפליקציית Flask** - API מלא עם פעולות CRUD (`src/app.py`)  
✅ **Dockerfile** - קונפיגורציה מוכנה לפרודקשן בקונטיינר  
✅ **תשתית Bicep** - סביבה ל-Container Apps ופריסת API  
✅ **קונפיגורציית AZD** - הגדרת פריסה בפקודה אחת  
✅ **בדיקות בריאות** - בדיקות חיות ומוכנות מוגדרות  
✅ **סקיילינג אוטומטי** - 0-10 רפליקות בהתבסס על עומס HTTP  

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

### נדרש
- **Azure Developer CLI (azd)** - [מדריך התקנה](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **מנוי Azure** - [חשבון חינמי](https://azure.microsoft.com/free/)  
- **Docker Desktop** - [התקנת Docker](https://www.docker.com/products/docker-desktop/) (לבדיקות מקומיות)  

### אימות דרישות מוקדמות

```bash
# בדוק גרסת azd (צריך 1.5.0 או גבוהה יותר)
azd version

# אמת כניסה ל-Azure
azd auth login

# בדוק Docker (אופציונלי, לבדיקות מקומיות)
docker --version
```

## ⏱️ ציר זמן לפריסה

| שלב | משך זמן | מה קורה |
|-----|----------|---------|
| הגדרת סביבה | 30 שניות | יצירת סביבה עם azd |
| בניית קונטיינר | 2-3 דקות | בניית אפליקציית Flask עם Docker |
| פריסת תשתית | 3-5 דקות | יצירת Container Apps, רישום, ניטור |
| פריסת אפליקציה | 2-3 דקות | דחיפת תמונה ופריסה ל-Container Apps |
| **סה"כ** | **8-12 דקות** | פריסה מלאה מוכנה |

## התחלה מהירה

```bash
# נווט לדוגמה
cd examples/container-app/simple-flask-api

# אתחל סביבה (בחר שם ייחודי)
azd env new myflaskapi

# פרוס הכל (תשתית + יישום)
azd up
# תתבקש:
# 1. לבחור מנוי Azure
# 2. לבחור מיקום (לדוגמה, eastus2)
# 3. להמתין 8-12 דקות לפריסה

# קבל את נקודת הקצה של ה-API
azd env get-values

# בדוק את ה-API
curl $(azd env get-value API_ENDPOINT)/health
```

**תוצאה צפויה:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ אימות פריסה

### שלב 1: בדיקת סטטוס פריסה

```bash
# הצג שירותים שהופעלו
azd show

# הפלט הצפוי מציג:
# - שירות: api
# - נקודת קצה: https://ca-api-[env].xxx.azurecontainerapps.io
# - מצב: פועל
```

### שלב 2: בדיקת נקודות קצה של API

```bash
# קבל נקודת קצה API
API_URL=$(azd env get-value API_ENDPOINT)

# בדוק בריאות
curl $API_URL/health

# בדוק נקודת קצה ראשית
curl $API_URL/

# צור פריט
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# קבל את כל הפריטים
curl $API_URL/api/items
```

**קריטריונים להצלחה:**
- ✅ נקודת קצה בריאות מחזירה HTTP 200  
- ✅ נקודת קצה ראשית מציגה מידע על ה-API  
- ✅ POST יוצר פריט ומחזיר HTTP 201  
- ✅ GET מחזיר פריטים שנוצרו  

### שלב 3: צפייה בלוגים

```bash
# זרם יומנים חיים
azd logs api --follow

# אתה אמור לראות:
# - הודעות הפעלה של Gunicorn
# - יומני בקשות HTTP
# - יומני מידע של האפליקציה
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

## נקודות קצה של API

| נקודת קצה | שיטה | תיאור |
|-----------|-------|-------|
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

### קונפיגורציית סקיילינג

ה-API מבצע סקיילינג אוטומטי בהתבסס על תעבורת HTTP:  
- **מינימום רפליקות**: 0 (סקיילינג לאפס במצב לא פעיל)  
- **מקסימום רפליקות**: 10  
- **בקשות מקבילות לכל רפליקה**: 50  

## פיתוח

### הרצה מקומית

```bash
# התקן תלותים
cd src
pip install -r requirements.txt

# הפעל את האפליקציה
python app.py

# בדוק באופן מקומי
curl http://localhost:8000/health
```

### בנייה ובדיקת קונטיינר

```bash
# בנה תמונת Docker
docker build -t flask-api:local ./src

# הפעל מיכל באופן מקומי
docker run -p 8000:8000 flask-api:local

# בדוק מיכל
curl http://localhost:8000/health
```

## פריסה

### פריסה מלאה

```bash
# פרוס תשתית ויישום
azd up
```

### פריסת קוד בלבד

```bash
# פרס רק את קוד היישום (התשתית לא משתנה)
azd deploy api
```

### עדכון קונפיגורציה

```bash
# עדכן משתני סביבה
azd env set API_KEY "new-api-key"

# פרוס מחדש עם תצורה חדשה
azd deploy api
```

## ניטור

### צפייה בלוגים

```bash
# זרם יומנים חיים
azd logs api --follow

# הצג 100 השורות האחרונות
azd logs api --tail 100
```

### ניטור מדדים

```bash
# פתח לוח מחוונים של Azure Monitor
azd monitor --overview

# הצג מדדים ספציפיים
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

## אופטימיזציה עלויות

פריסה זו משתמשת ב-scale-to-zero, כך שמשלמים רק כשה-API מעבד בקשות:

- **עלות במצב לא פעיל**: ~$0 לחודש (סקיילינג לאפס)  
- **עלות פעילה**: ~$0.000024 לשנייה לכל רפליקה  
- **עלות חודשית צפויה** (שימוש קל): $5-15  

### הפחתת עלויות נוספת

```bash
# הקטן את מספר הרפליקות המרבי עבור פיתוח
azd env set MAX_REPLICAS 3

# השתמש בזמן השבתה קצר יותר
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 דקות
```

## פתרון בעיות

### הקונטיינר לא מתחיל

```bash
# בדוק יומני מכולה
azd logs api --tail 100

# אמת בניית תמונת Docker באופן מקומי
docker build -t test ./src
```

### ה-API לא נגיש

```bash
# אמת שהכניסה היא חיצונית
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### זמני תגובה גבוהים

```bash
# בדוק שימוש במעבד/זיכרון
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# הגדל משאבים אם נדרש
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

1. **הוספת מסד נתונים** - שילוב עם Azure Cosmos DB או SQL Database  
   ```bash
   # הוסף מודול Cosmos DB ל-infra/main.bicep
   # עדכן את app.py עם חיבור למסד הנתונים
   ```

2. **הוספת אימות** - יישום Azure AD או מפתחות API  
   ```python
   # הוסף תוכנת ביניים לאימות ל-app.py
   from functools import wraps
   ```

3. **הגדרת CI/CD** - תהליך עבודה עם GitHub Actions  
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

- **[אפליקציית מסד נתונים](../../../../../examples/database-app)** - דוגמה מלאה עם SQL Database  
- **[מיקרו-שירותים](../../../../../examples/container-app/microservices)** - ארכיטקטורה מרובת שירותים  
- **[מדריך ראשי ל-Container Apps](../README.md)** - כל תבניות הקונטיינר  

### משאבי לימוד

- 📚 [קורס למתחילים עם AZD](../../../README.md) - דף הבית של הקורס  
- 📚 [תבניות ל-Container Apps](../README.md) - תבניות פריסה נוספות  
- 📚 [גלריית תבניות AZD](https://azure.github.io/awesome-azd/) - תבניות קהילתיות  

## משאבים נוספים

### תיעוד
- **[תיעוד Flask](https://flask.palletsprojects.com/)** - מדריך למסגרת Flask  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - תיעוד רשמי של Azure  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - הפניות לפקודות azd  

### מדריכים
- **[התחלה מהירה עם Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - פרוס את האפליקציה הראשונה שלך  
- **[Python ב-Azure](https://learn.microsoft.com/azure/developer/python/)** - מדריך לפיתוח Python  
- **[שפת Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - תשתית כקוד  

### כלים
- **[Azure Portal](https://portal.azure.com)** - ניהול משאבים בצורה חזותית  
- **[תוסף Azure ל-VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - אינטגרציה עם IDE  

---

**🎉 מזל טוב!** פרסתם API מוכן לפרודקשן עם Flask ל-Azure Container Apps עם סקיילינג אוטומטי וניטור.

**שאלות?** [פתחו בעיה](https://github.com/microsoft/AZD-for-beginners/issues) או בדקו את [שאלות נפוצות](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. איננו נושאים באחריות לאי הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->