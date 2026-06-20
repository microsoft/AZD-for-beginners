# מדריך פריסה - שליטה בפריסות AZD

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 4 - תשתית כקוד ופריסה
- **⬅️ הפרק הקודם**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)
- **➡️ הבא**: [הקצאת משאבים](provisioning.md)
- **🧩 גם בפרק זה**: [כתיבת תבנית משלך](custom-templates.md)
- **🚀 הפרק הבא**: [פרק 5: פתרונות AI מרובי סוכנים](../../examples/retail-scenario.md)

## مقدمة

מדריך מקיף זה מכסה את כל מה שעליך לדעת על פריסת יישומים באמצעות Azure Developer CLI, מהפריסות הבסיסיות בפקודה בודדת ועד תרחישי פרודקשן מתקדמים עם hooks מותאמים אישית, מספר סביבות ואינטגרציה עם CI/CD. שלוט במחזור החיים המלא של הפריסה עם דוגמאות מעשיות ושיטות עבודה מומלצות.

## מטרות הלמידה

לאחר השלמת מדריך זה, תוכל:
- לשלוט בכל פקודות וזרימות העבודה של פריסת Azure Developer CLI
- להבין את מחזור החיים המלא של הפריסה מהקצאה ועד ניטור
- ליישם hooks מותאמים אישית לאוטומציה לפני ואחרי פריסה
- להגדיר מספר סביבות עם פרמטרים ייחודיים לכל סביבה
- להגדיר אסטרטגיות פריסה מתקדמות כולל פריסות blue-green ו-canary
- לשלב פריסות azd עם pipelines של CI/CD וזרימות עבודה של DevOps

## תוצאות הלמידה

בסיום, תהיה מסוגל:
- לבצע ולפתור תקלות בכל זרימות העבודה של azd באופן עצמאי
- לתכנן וליישם אוטומציה מותאמת לפריסה באמצעות hooks
- להגדיר פריסות מוכנות לפרודקשן עם אבטחה וניטור מתאימים
- לנהל תרחישי פריסה מרובי סביבות מורכבים
- לאופטימיזציה של ביצועי הפריסה וליישם אסטרטגיות Rollback
- לשלב פריסות azd בפרקטיקות DevOps ארגוניות

## סקירת פריסות

Azure Developer CLI מספק מספר פקודות פריסה:
- `azd up` - זרימה מלאה (הקצאה + פריסה)
- `azd provision` - יצירה/עדכון של משאבי Azure בלבד
- `azd deploy` - פריסת קוד האפליקציה בלבד
- `azd package` - בנייה ואריזה של אפליקציות

## זרימות עבודה בסיסיות לפריסה

### פריסה מלאה (azd up)
זרימת העבודה הנפוצה ביותר לפרויקטים חדשים:
```bash
# לפרוס הכל מאפס
azd up

# לפרוס עם סביבה ספציפית
azd up --environment production

# לפרוס עם פרמטרים מותאמים אישית
azd up --parameter location=westus2 --parameter sku=P1v2
```

### פריסת תשתית בלבד
כאשר אתה רק צריך לעדכן משאבי Azure:
```bash
# סִפּוּק/עדכון תשתית
azd provision

# סִפּוּק עם הרצה יבשה לצפייה מוקדמת בשינויים
azd provision --preview

# סִפּוּק שירותים ספציפיים
azd provision --service database
```

### פריסת קוד בלבד
לעדכוני אפליקציה מהירים:
```bash
# פרוס את כל השירותים
azd deploy

# פלט צפוי:
# מפריס שירותים (azd deploy)
# - web: מפריס... בוצע
# - api: מפריס... בוצע
# הצלחה: הפריסה שלך הושלמה תוך 2 דקות ו-15 שניות

# פרוס שירות ספציפי
azd deploy --service web
azd deploy --service api

# פרוס עם ארגומנטים מותאמים לבנייה
azd deploy --service api --build-arg NODE_ENV=production

# אמת את הפריסה
azd show --output json | jq '.services'
```

### ✅ אימות הפריסה

לאחר כל פריסה, אמת את הצלחתה:

```bash
# בדוק שכל השירותים פועלים
azd show

# בדוק נקודות קצה בריאות
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# פקח אחר שגיאות (נפתח בדפדפן כברירת מחדל)
azd monitor --logs
```

**קריטריוני הצלחה:**
- ✅ כל השירותים במצב "ריצה"
- ✅ נקודות בריאות מחזירות HTTP 200
- ✅ אין יומני שגיאות בחמש הדקות האחרונות
- ✅ האפליקציה מגיבה לבדיקות

## 🏗️ הבנת תהליך הפריסה

### חדש ל-hooks? התחל כאן

**hook** הוא פקודה ש-azd מריץ אוטומטית ברגע מסוים במהלך תהליך הפריסה — לפני או אחרי ההקצאה, וכן לפני או אחרי פריסת הקוד. הם מאפשרים לאוטומט את המשימות הקטנות שתמיד מלווים פריסה: טעינת בסיס נתונים, הרצת מיגרציות, בניית נכסים או בדיקת עשן של האפליקציה החיה.

| Hook | מתבצע ב… | שימוש נפוץ |
|------|-----------|-------------|
| `preprovision` | לפני יצירת המשאבים | אימות תנאים מוקדמים, התחברות לרשומה |
| `postprovision` | לאחר יצירת המשאבים | הגדרת משאבים, הקמת בסיס הנתונים |
| `predeploy` | לפני פריסת הקוד | בניית נכסי front-end, הרצת בדיקות יחידה |
| `postdeploy` | לאחר פריסת הקוד | הרצת מיגרציות DB, בדיקת עשן של נקודת הקצה |

Hooks נמצאים בקובץ `azure.yaml`. הנה הדוגמה הקטנה ביותר — פשוט מדפיסה הודעה לאחר הפריסה:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

וזהו — בפעם הבאה שתריץ `azd up`, ההודעה תודפס אוטומטית. אפשר גם להריץ hook לבד, בלי פריסה מלאה, מה שמאוד נוח לבדיקה:

```bash
azd hooks run postdeploy
```

השלבים הבאים מראים hooks אמיתיים (מיגרציות, בדיקות, אימות) לכל שלב.

### שלב 1: Hooks לפני הקצאה
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### שלב 2: הקצאת תשתית
- קורא תבניות תשתית (Bicep/Terraform)
- יוצר או מעדכן משאבי Azure
- מגדיר רשת ואבטחה
- מגדיר ניטור ורישום לוגים

### שלב 3: Hooks אחרי הקצאה
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### שלב 4: אריזת אפליקציה
- בונה קוד האפליקציה
- יוצר ארטיפקטים לפריסה
- אורז לפלטפורמה היעד (קונטיינרים, קובצי ZIP וכו')

### שלב 5: Hooks לפני פריסה
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### שלב 6: פריסת אפליקציה
- מפריס אפליקציות ארוזות לשירותי Azure
- מעדכן הגדרות תצורה
- מפעיל/מאתחל שירותים

### שלב 7: Hooks אחרי פריסה
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

### טיפול בשגיאות ב-Hooks

ברירת המחדל, **אם פקודת hook יוצאת עם קוד שגיאה, azd עוצר את כל הפעולה.** בדרך כלל זה מה שרוצים — מיגרציה שנכשלה אמורה לעצור את הפריסה, לא לשגר אפליקציה שבורה. אך זה אומר ש-hooks צריכים להיכתב בזהירות.

**1. גרום לכשלים להיות ברורים ובכוונה.** hook נכשל כאשר הפקודה האחרונה שלו מחזירה קוד שגיאה שונה מאפס. בסקריפטים של shell, הוסף `set -e` כך שה-hook יעצור בפקודה הראשונה שנכשלה במקום להמשיך בשקט:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. אפשר ל-hook להיכשל בלי לעצור את azd.** בשלבים לא קריטיים (חימום מטמון אופציונלי, התראת נסיון מיטבי), הגדר `continueOnError: true`. azd רושם את הכישלון אבל ממשיך לפעול:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. בדוק hooks בנפרד לפני ריצה מלאה.** אין צורך להריץ `azd up` כדי לנפות שגיאות ב-hook — הרץ אותו בנפרד וחזור על התהליך במהירות:

```bash
azd hooks run predeploy          # מריץ רק את ה-hook של טרם הפריסה
azd hooks run postdeploy --service api
```

**4. שים לב ל-shell ספציפי למערכת הפעלה.** hook שמשתמש ב-`shell: pwsh` דורש PowerShell מותקן במכונה שמריצה אותו (כולל סוכני CI). השתמש ב-`shell: sh` לניידות הרחבה ביותר, או ספק שני סוגים: `windows` ו-`posix`:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **טיפ לניפוי באגים:** הרץ כל פקודת azd עם `--debug` כדי לראות את שורת הפקודה המדויקת של ה-hook ואת הפלט המלא — שימושי מאוד כאשר hook עובד מקומית אבל נכשל ב-CI.

## 🎛️ תצורת פריסה

### הגדרות פריסה ספציפיות לשירות
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### תצורות ספציפיות לסביבה
```bash
# סביבת פיתוח
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# סביבת סטייג'ינג
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# סביבת ייצור
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 תרחישי פריסה מתקדמים

### יישומים מרובי שירותים
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### פריסות Blue-Green
```bash
# צור סביבה כחולה
azd env new production-blue
azd up --environment production-blue

# בדוק את הסביבה הכחולה
./scripts/test-environment.sh production-blue

# העבר תנועה לכחולה (עדכון DNS/מאזן עומסים ידני)
./scripts/switch-traffic.sh production-blue

# נקה את הסביבה הירוקה
azd env select production-green
azd down --force
```

### פריסות Canary
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### פריסות בשלבים
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 פריסות קונטיינרים

### פריסות Container App
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### אופטימיזציית Dockerfile מרובה שלבים
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ אופטימיזציית ביצועים

### פריסות ספציפיות לשירות
```bash
# פרוס שירות ספציפי לחזרה מהירה יותר
azd deploy --service web
azd deploy --service api

# פרוס את כל השירותים
azd deploy
```

### קאשינג של בנייה
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### פריסות קוד יעילות
```bash
# השתמש ב-azd deploy (לא ב-azd up) לשינויים בקוד בלבד
# זה מדלג על פריסת התשתית ומהיר בהרבה
azd deploy

# פרוס שירות ספציפי עבור האיטרציה המהירה ביותר
azd deploy --service api
```

## 🔍 ניטור פריסה

### ניטור פריסה בזמן אמת
```bash
# לנטר את האפליקציה בזמן אמת
azd monitor --live

# לצפות בלוגים של האפליקציה
azd monitor --logs

# לבדוק את מצב הפריסה
azd show
```

### בדיקות בריאות
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### אימות לאחר פריסה
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# בדוק את בריאות האפליקציה
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 שיקולי אבטחה

### ניהול סודות
```bash
# לאחסן סודות בצורה מאובטחת
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# להפנות לסודות בקובץ azure.yaml
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### אבטחת הרשת
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ניהול זהויות וגישה
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 אסטרטגיות Rollback

### Rollback מהיר
```bash
# ל-AZD אין אפשרות גלילה מובנית. גישות מומלצות:

# אפשרות 1: לפרוס מחדש מ-Git (מומלץ)
git revert HEAD  # לבטל את הקומיט הבעייתי
git push
azd deploy

# אפשרות 2: לפרוס מחדש קומיט ספציפי
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback של תשתית
```bash
# תצוגה מקדימה של שינויים בתשתית לפני יישום
azd provision --preview

# לשחזור תשתית, השתמש בבקרת גרסאות:
git revert HEAD  # ביטול שינויים בתשתית
azd provision    # יישום מצב תשתית קודם
```

### Rollback של מיגרציות בסיס נתונים
```bash
#!/בין/בהש
# סקריפטים/חזרה-למאגר-נתונים.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 מדדי פריסה

### מעקב אחרי ביצועי הפריסה
```bash
# הצג את מצב הפריסה הנוכחי
azd show

# ניטור יישום עם Application Insights
azd monitor --overview

# הצג מדדים חיים
azd monitor --live
```

### איסוף מדדים מותאמים אישית
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 שיטות עבודה מומלצות

### 1. עקביות בסביבה
```bash
# השתמש בשם עקבי
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# שמור על איזון סביבתי
./scripts/sync-environments.sh
```

### 2. אימות תשתית
```bash
# הצג שינויים בתשתית לפני פריסה
azd provision --preview

# השתמש בבדיקת שגיאות ARM/Bicep
az bicep lint --file infra/main.bicep

# אמת את תחביר ה-Bicep
az bicep build --file infra/main.bicep
```

### 3. אינטגרציית בדיקות
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. תיעוד ורישום לוגים
```bash
# לתעד נהלי פריסה
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## צעדים הבאים

- [הקצאת משאבים](provisioning.md) - העמקה בניהול תשתית
- [תכנון לפני פריסה](../chapter-06-pre-deployment/capacity-planning.md) - תכנן את אסטרטגיית הפריסה שלך
- [בעיות נפוצות](../chapter-07-troubleshooting/common-issues.md) - פתרון בעיות בפריסה
- [שיטות עבודה מומלצות](../chapter-07-troubleshooting/debugging.md) - אסטרטגיות פריסה מוכנות לפרודקשן

## 🎯 תרגילי פריסה מעשיים

### תרגיל 1: זרימת עבודה לפריסה הדרגתית (20 דקות)
**מטרה**: לשלוט בהבדלים בין פריסה מלאה להדרגתית

```bash
# פריסה ראשונית
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# רישום זמן פריסה ראשוני
echo "Full deployment: $(date)" > deployment-log.txt

# בצע שינוי קוד
echo "// Updated $(date)" >> src/api/src/server.js

# פרוס רק את הקוד (מהיר)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# השווה זמנים
cat deployment-log.txt

# ניקוי
azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] פריסה מלאה לוקחת 5–15 דקות
- [ ] פריסת קוד בלבד לוקחת 2–5 דקות
- [ ] שינויים בקוד משתקפים באפליקציה שמופעלת
- [ ] התשתית נשארת ללא שינוי לאחר `azd deploy`

**תוצאת למידה**: `azd deploy` מהיר ב-50–70% מ-`azd up` בשינויים בקוד

### תרגיל 2: Hooks מותאמים אישית לפריסה (30 דקות)
**מטרה**: ליישם אוטומציה לפני ואחרי פריסה

```bash
# צור סקריפט אימות לפני פריסה
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# בדוק אם הבדיקות עוברות
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# בדוק אם יש שינויים שלא התחייבו
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# צור בדיקת עשן לאחר פריסה
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# הוסף קרס למערכת azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# בדוק פריסה עם קרסים
azd deploy
```

**קריטריוני הצלחה:**
- [ ] סקריפט לפני פריסה רץ לפני הפריסה
- [ ] הפריסה מופרעת במקרה של כשל בבדיקות
- [ ] בדיקת עשן אחרי פריסה מאמתת את הבריאות
- [ ] Hooks מבוצעים בסדר הנכון

### תרגיל 3: אסטרטגיית פריסה מרובת סביבות (45 דקות)
**מטרה**: ליישם זרימת עבודה בשלבים (פיתוח → סטייג'ינג → פרודקשן)

```bash
# צור סקריפט פריסה
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# שלב 1: פריסה לסביבת פיתוח
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# שלב 2: פריסה לסביבת סטייג'ינג
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# שלב 3: אישור ידני להפקה
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# צור סביבות
azd env new dev
azd env new staging
azd env new production

# הפעל פריסה בשלבים
./deploy-staged.sh
```

**קריטריוני הצלחה:**
- [ ] סביבת פיתוח מתפרסת בהצלחה
- [ ] סביבת סטייג'ינג מתפרסת בהצלחה
- [ ] דרושה אישור ידני לפרודקשן
- [ ] לכל הסביבות בדיקות בריאות עובדות
- [ ] אפשר ל-roll back במידת הצורך

### תרגיל 4: אסטרטגיית Rollback (25 דקות)
**מטרה**: ליישם ולבדוק Rollback בפריסה באמצעות Git

```bash
# פרוס גרסה 1
azd env set APP_VERSION "1.0.0"
azd up

# שמור את הגרסה של המחויבות v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# פרוס גרסה 2 עם שינוי שמשבש
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# גלה כישלון ובצע החזרה אחורה
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # החזר אחורה באמצעות git
    git revert HEAD --no-edit
    
    # החזר את הסביבה למצב קודם
    azd env set APP_VERSION "1.0.0"
    
    # פרוס מחדש את גרסה 1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**קריטריוני הצלחה:**
- [ ] ניתן לאתר כשלים בפריסה
- [ ] סקריפט Rollback מבוצע אוטומטית
- [ ] האפליקציה חוזרת למצב תקין
- [ ] בדיקות בריאות עוברות לאחר Rollback

## 📊 מעקב מדדי פריסה

### עקוב אחרי ביצועי הפריסה שלך

```bash
# צור סקריפט מדדי פריסה
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# כתוב לקובץ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# השתמש בזה
./track-deployment.sh
```

**נתח את המדדים שלך:**
```bash
# הצג היסטוריית פריסות
cat deployment-metrics.csv

# חשב זמן פריסה ממוצע
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## משאבים נוספים

- [הפניה לפריסת Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [פריסת Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [פריסת Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [פריסת Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ניווט**
- **השיעור הקודם**: [הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **השיעור הבא**: [הקצאת משאבים](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->