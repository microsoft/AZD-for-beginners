<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-21T17:24:16+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "he"
}
-->
# מדריך פריסה - שליטה בפריסות AZD

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 4 - תשתית כקוד ופריסה
- **⬅️ פרק קודם**: [פרק 3: תצורה](../getting-started/configuration.md)
- **➡️ הבא**: [הקצאת משאבים](provisioning.md)
- **🚀 פרק הבא**: [פרק 5: פתרונות AI מרובי סוכנים](../../examples/retail-scenario.md)

## מבוא

מדריך מקיף זה מכסה את כל מה שצריך לדעת על פריסת יישומים באמצעות Azure Developer CLI, החל מפריסות בסיסיות בפקודה אחת ועד לתרחישי ייצור מתקדמים עם ווים מותאמים אישית, סביבות מרובות ואינטגרציה עם CI/CD. שלוט במחזור החיים המלא של הפריסה עם דוגמאות מעשיות ושיטות עבודה מומלצות.

## מטרות למידה

עם סיום המדריך, תוכל:
- לשלוט בכל פקודות ותהליכי הפריסה של Azure Developer CLI
- להבין את מחזור החיים המלא של הפריסה, מהקצאה ועד ניטור
- ליישם ווים מותאמים אישית לאוטומציה לפני ואחרי פריסה
- להגדיר סביבות מרובות עם פרמטרים ייחודיים לכל סביבה
- להגדיר אסטרטגיות פריסה מתקדמות כולל פריסות כחול-ירוק ו-canary
- לשלב פריסות azd עם צינורות CI/CD ותהליכי DevOps

## תוצאות למידה

עם סיום המדריך, תוכל:
- לבצע ולפתור בעיות בכל תהליכי הפריסה של azd באופן עצמאי
- לעצב וליישם אוטומציה מותאמת אישית לפריסה באמצעות ווים
- להגדיר פריסות מוכנות לייצור עם אבטחה וניטור מתאימים
- לנהל תרחישי פריסה מורכבים עם סביבות מרובות
- לייעל את ביצועי הפריסה וליישם אסטרטגיות חזרה לאחור
- לשלב פריסות azd בפרקטיקות DevOps ארגוניות

## סקירת פריסה

Azure Developer CLI מספק מספר פקודות פריסה:
- `azd up` - תהליך מלא (הקצאה + פריסה)
- `azd provision` - יצירה/עדכון של משאבי Azure בלבד
- `azd deploy` - פריסת קוד יישום בלבד
- `azd package` - בנייה ואריזת יישומים

## תהליכי פריסה בסיסיים

### פריסה מלאה (azd up)
התהליך הנפוץ ביותר לפרויקטים חדשים:
```bash
# פרוס הכל מאפס
azd up

# פרוס עם סביבה ספציפית
azd up --environment production

# פרוס עם פרמטרים מותאמים אישית
azd up --parameter location=westus2 --parameter sku=P1v2
```

### פריסת תשתית בלבד
כאשר יש צורך לעדכן רק את משאבי Azure:
```bash
# אספקה/עדכון תשתית
azd provision

# אספקה עם הרצה יבשה כדי להציג שינויים
azd provision --preview

# אספקה של שירותים ספציפיים
azd provision --service database
```

### פריסת קוד בלבד
לעדכוני יישום מהירים:
```bash
# פרס את כל השירותים
azd deploy

# פלט צפוי:
# פריסת שירותים (azd deploy)
# - web: מפריס... בוצע
# - api: מפריס... בוצע
# הצלחה: הפריסה שלך הושלמה תוך 2 דקות ו-15 שניות

# פרס שירות ספציפי
azd deploy --service web
azd deploy --service api

# פרס עם ארגומנטים מותאמים אישית לבנייה
azd deploy --service api --build-arg NODE_ENV=production

# אמת את הפריסה
azd show --output json | jq '.services'
```

### ✅ אימות פריסה

לאחר כל פריסה, יש לוודא הצלחה:

```bash
# בדוק שכל השירותים פועלים
azd show

# בדוק נקודות קצה לבריאות
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# בדוק יומנים לשגיאות
azd logs --service api --since 5m | grep -i error
```

**קריטריונים להצלחה:**
- ✅ כל השירותים במצב "פועל"
- ✅ נקודות קצה בריאות מחזירות HTTP 200
- ✅ אין לוגים של שגיאות ב-5 הדקות האחרונות
- ✅ היישום מגיב לבקשות בדיקה

## 🏗️ הבנת תהליך הפריסה

### שלב 1: ווים לפני הקצאה
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
- קריאת תבניות תשתית (Bicep/Terraform)
- יצירה או עדכון של משאבי Azure
- הגדרת רשתות ואבטחה
- הגדרת ניטור ולוגים

### שלב 3: ווים אחרי הקצאה
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

### שלב 4: אריזת יישום
- בניית קוד יישום
- יצירת חבילות פריסה
- אריזה לפלטפורמת היעד (קונטיינרים, קבצי ZIP וכו')

### שלב 5: ווים לפני פריסה
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

### שלב 6: פריסת יישום
- פריסת יישומים ארוזים לשירותי Azure
- עדכון הגדרות תצורה
- הפעלה/הפעלה מחדש של שירותים

### שלב 7: ווים אחרי פריסה
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

## 🎛️ תצורת פריסה

### הגדרות פריסה ייחודיות לשירות
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

### תצורות ייחודיות לסביבה
```bash
# סביבת פיתוח
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# סביבת בדיקות
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

### פריסות כחול-ירוק
```bash
# צור סביבה כחולה
azd env new production-blue
azd up --environment production-blue

# בדוק את הסביבה הכחולה
./scripts/test-environment.sh production-blue

# העבר תנועה לכחול (עדכון DNS/מאזן עומסים ידני)
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

### פריסות מדורגות
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

### פריסות יישומי קונטיינר
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

### אופטימיזציה של Dockerfile רב-שלבי
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

### פריסות מקבילות
```bash
# הגדר פריסה מקבילה
azd config set deploy.parallelism 5

# פרוס שירותים במקביל
azd deploy --parallel
```

### שמירת בנייה
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### פריסות אינקרמנטליות
```bash
# לפרוס רק שירותים שהשתנו
azd deploy --incremental

# לפרוס עם זיהוי שינויים
azd deploy --detect-changes
```

## 🔍 ניטור פריסה

### ניטור פריסה בזמן אמת
```bash
# עקוב אחר התקדמות הפריסה
azd deploy --follow

# הצג יומני פריסה
azd logs --follow --service api

# בדוק את מצב הפריסה
azd show --service api
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

# בדוק את בריאות היישום
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
# אחסן סודות בצורה מאובטחת
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# הפנה לסודות ב-azure.yaml
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

### אבטחת רשת
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

## 🚨 אסטרטגיות חזרה לאחור

### חזרה לאחור מהירה
```bash
# חזרה לפריסה הקודמת
azd deploy --rollback

# חזרה לשירות ספציפי
azd deploy --service api --rollback

# חזרה לגרסה ספציפית
azd deploy --service api --version v1.2.3
```

### חזרה לאחור של תשתית
```bash
# החזר שינויים בתשתית
azd provision --rollback

# תצוגה מקדימה של שינויים בהחזרה
azd provision --rollback --preview
```

### חזרה לאחור של מיגרציית מסד נתונים
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 מדדי פריסה

### מעקב אחר ביצועי פריסה
```bash
# הפעל מדדי פריסה
azd config set telemetry.deployment.enabled true

# הצג היסטוריית פריסה
azd history

# קבל סטטיסטיקות פריסה
azd metrics --type deployment
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

### 1. עקביות סביבה
```bash
# השתמש בשמות עקביים
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# שמור על תאימות הסביבה
./scripts/sync-environments.sh
```

### 2. אימות תשתית
```bash
# אמת לפני הפריסה
azd provision --preview
azd provision --what-if

# השתמש בבדיקת ARM/Bicep
az bicep lint --file infra/main.bicep
```

### 3. שילוב בדיקות
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

### 4. תיעוד ולוגים
```bash
# לתעד את נהלי הפריסה
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## צעדים הבאים

- [הקצאת משאבים](provisioning.md) - צלילה עמוקה לניהול תשתית
- [תכנון לפני פריסה](../pre-deployment/capacity-planning.md) - תכנן את אסטרטגיית הפריסה שלך
- [בעיות נפוצות](../troubleshooting/common-issues.md) - פתרון בעיות פריסה
- [שיטות עבודה מומלצות](../troubleshooting/debugging.md) - אסטרטגיות פריסה מוכנות לייצור

## 🎯 תרגילי פריסה מעשיים

### תרגיל 1: תהליך פריסה אינקרמנטלי (20 דקות)
**מטרה**: לשלוט בהבדל בין פריסות מלאות לאינקרמנטליות

```bash
# פריסה ראשונית
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# רשום את זמן הפריסה הראשונית
echo "Full deployment: $(date)" > deployment-log.txt

# בצע שינוי בקוד
echo "// Updated $(date)" >> src/api/src/server.js

# פרוס רק את הקוד (מהיר)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# השווה זמנים
cat deployment-log.txt

# נקה
azd down --force --purge
```

**קריטריונים להצלחה:**
- [ ] פריסה מלאה לוקחת 5-15 דקות
- [ ] פריסת קוד בלבד לוקחת 2-5 דקות
- [ ] שינויים בקוד משתקפים ביישום שפורס
- [ ] התשתית לא משתנה לאחר `azd deploy`

**תוצאה למידה**: `azd deploy` מהיר ב-50-70% מ-`azd up` עבור שינויים בקוד

### תרגיל 2: ווים מותאמים אישית לפריסה (30 דקות)
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

# הוסף hooks ל-azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# בדוק פריסה עם hooks
azd deploy
```

**קריטריונים להצלחה:**
- [ ] סקריפט לפני פריסה רץ לפני הפריסה
- [ ] הפריסה נעצרת אם הבדיקות נכשלות
- [ ] בדיקת עשן לאחר פריסה מאמתת בריאות
- [ ] הווים מבוצעים בסדר הנכון

### תרגיל 3: אסטרטגיית פריסה מרובת סביבות (45 דקות)
**מטרה**: ליישם תהליך פריסה מדורג (dev → staging → production)

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

# שלב 2: פריסה לסביבת בדיקות
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# שלב 3: אישור ידני לפריסה לסביבת ייצור
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

# הפעל פריסה מדורגת
./deploy-staged.sh
```

**קריטריונים להצלחה:**
- [ ] סביבה dev נפרסת בהצלחה
- [ ] סביבה staging נפרסת בהצלחה
- [ ] נדרשת אישור ידני עבור production
- [ ] כל הסביבות כוללות בדיקות בריאות פעילות
- [ ] ניתן לחזור לאחור במידת הצורך

### תרגיל 4: אסטרטגיית חזרה לאחור (25 דקות)
**מטרה**: ליישם ולבדוק חזרה לאחור של פריסה

```bash
# פרוס גרסה 1
azd env set APP_VERSION "1.0.0"
azd up

# שמור את תצורת גרסה 1
cp -r .azure/production .azure/production-v1-backup

# פרוס גרסה 2 עם שינוי שובר
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# זיהוי כשל
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # החזר קוד לאחור
    git checkout src/api/src/server.js
    
    # החזר סביבה לאחור
    azd env set APP_VERSION "1.0.0"
    
    # פרוס מחדש גרסה 1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**קריטריונים להצלחה:**
- [ ] ניתן לזהות כשלי פריסה
- [ ] סקריפט חזרה לאחור מבוצע אוטומטית
- [ ] היישום חוזר למצב עבודה
- [ ] בדיקות בריאות עוברות לאחר חזרה לאחור

## 📊 מעקב אחר מדדי פריסה

### עקוב אחר ביצועי הפריסה שלך

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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# יומן לקובץ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# השתמש בזה
./track-deployment.sh
```

**נתח את המדדים שלך:**
```bash
# הצג היסטוריית פריסה
cat deployment-metrics.csv

# חשב זמן פריסה ממוצע
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## משאבים נוספים

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ניווט**
- **שיעור קודם**: [הפרויקט הראשון שלך](../getting-started/first-project.md)
- **שיעור הבא**: [הקצאת משאבים](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. איננו אחראים לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->