# מדריך לפריסה - לשלוט בפריסות AZD

**ניווט פרקים:**
- **📚 בית הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 4 - תשתית כקוד ופריסה
- **⬅️ פרק קודם**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)
- **➡️ הבא**: [הקצאת משאבים](provisioning.md)
- **🚀 הפרק הבא**: [פרק 5: פתרונות AI מרובי-סוכנים](../../examples/retail-scenario.md)

## הקדמה

מדריך מקיף זה מכסה כל מה שצריך לדעת על פריסת יישומים באמצעות Azure Developer CLI, מהפריסות הפשוטות בפקודה אחת ועד לתרחישי ייצור מתקדמים עם הוקים מותאמים אישית, סביבות מרובות ואינטגרציה עם CI/CD. שלוט במחזור החיים המלא של הפריסה עם דוגמאות מעשיות ונהלים מיטביים.

## מטרות הלמידה

בסיום מדריך זה תוכל:
- לשלוט בכל פקודות ותהליכי הפריסה של Azure Developer CLI
- להבין את מחזור החיים המלא של הפריסה מהקצאה ועד ניטור
- ליישם הוקים מותאמים לפריסה לאוטומציה לפני ואחרי פריסה
- להגדיר סביבות מרובות עם פרמטרים ייחודיים לכל סביבה
- להגדיר אסטרטגיות פריסה מתקדמות כולל פריסות כחול-ירוק וכנריות
- לשלב פריסות azd בצינורות CI/CD ותהליכי DevOps

## תוצאות הלמידה

בסיום תוכל:
- להפעיל ולטפל בבעיות בכל תהליכי הפריסה של azd באופן עצמאי
- לעצב וליישם אוטומציה מותאמת על ידי שימוש בהוקים
- להגדיר פריסות מוכנות לייצור עם אבטחה וניטור נכונים
- לנהל תרחישי פריסה מורכבים עם סביבות מרובות
- לייעל ביצועי פריסה וליישם אסטרטגיות חזרה לאחור
- לשלב פריסות azd בפרקטיקות DevOps ארגוניות

## סקירת הפריסה

Azure Developer CLI מספק מספר פקודות לפריסה:
- `azd up` - תהליך מלא (הקצאה + פריסה)
- `azd provision` - יצירה/עדכון משאבי Azure בלבד
- `azd deploy` - פריסת קוד היישום בלבד
- `azd package` - בנייה ואריזת יישומים

## תהליכי פריסה בסיסיים

### פריסה מלאה (azd up)
תהליך נפוץ לפרויקטים חדשים:
```bash
# לפרוס הכל מההתחלה
azd up

# לפרוס עם סביבה ספציפית
azd up --environment production

# לפרוס עם פרמטרים מותאמים אישית
azd up --parameter location=westus2 --parameter sku=P1v2
```

### פריסת תשתית בלבד
כשאתה צריך רק לעדכן משאבי Azure:
```bash
# הקם/עדכן תשתית
azd provision

# הקם עם הרצה יבשה כדי לתצפת שינויים
azd provision --preview

# הקם שירותים ספציפיים
azd provision --service database
```

### פריסת קוד בלבד
לעדכונים מהירים של היישום:
```bash
# פרוס את כל השירותים
azd deploy

# הפלט הצפוי:
# מפרסמים שירותים (azd deploy)
# - web: מפרסם... בוצע
# - api: מפרסם... בוצע
# הצלחה: הפריסה הושלמה תוך 2 דקות ו-15 שניות

# פרוס שירות מסוים
azd deploy --service web
azd deploy --service api

# פרוס עם ארגומנטים מותאמים לבנייה
azd deploy --service api --build-arg NODE_ENV=production

# אמת פריסה
azd show --output json | jq '.services'
```

### ✅ אימות פריסה

אחרי כל פריסה, וודא הצלחה:

```bash
# בדוק שכל השירותים פועלים
azd show

# בדוק את נקודות הקצה לבריאות
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# נטר שגיאות (נפתח בדפדפן כברירת מחדל)
azd monitor --logs
```

**קריטריוני הצלחה:**
- ✅ כל השירותים במצב "Running"
- ✅ נקודות בדיקת בריאות מחזירות HTTP 200
- ✅ אין רשומות שגיאה ב-5 הדקות האחרונות
- ✅ היישום מגיב לבקשות בדיקה

## 🏗️ הבנת תהליך הפריסה

### שלב 1: הוקים לפני הקצאה
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
- מגדיר רשתות ואבטחה
- מגדיר ניטור ורישום

### שלב 3: הוקים לאחר הקצאה
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
- בונה קוד היישום
- יוצר ארטיפקטים לפריסה
- אורז לפלטפורמה היעד (מכולות, קבצי ZIP וכו׳)

### שלב 5: הוקים לפני פריסה
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
- מפריס את היישום לאשכולות Azure
- מעדכן הגדרות תצורה
- מפעיל/מאתחל שירותים

### שלב 7: הוקים לאחר פריסה
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

### תצורות ייחודיות לסביבה
```bash
# סביבת פיתוח
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# סביבת בדיקה
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

### יישומים עם מספר שירותים
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

# העבר תנועה לכחולה (עדכון DNS/מאזן עומסים ידני)
./scripts/switch-traffic.sh production-blue

# נקה את הסביבה הירוקה
azd env select production-green
azd down --force
```

### פריסות כנריות
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

## 🐳 פריסות מכולות

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

### אופטימיזציה של Dockerfile מרובה שלבים
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
# לפרוס שירות ספציפי לצורך איטרציה מהירה יותר
azd deploy --service web
azd deploy --service api

# לפרוס את כל השירותים
azd deploy
```

### מטמון בנייה
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

# פרוס שירות ספציפי לאיטרציה המהירה ביותר
azd deploy --service api
```

## 🔍 ניטור פריסה

### ניטור פריסה בזמן אמת
```bash
# לנטר את היישום בזמן אמת
azd monitor --live

# לצפות ביומני היישום
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

# בדוק את מצב הבריאות של היישום
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

# הפנה לסודות בקובץ azure.yaml
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

### חזרה מהירה
```bash
# ל-AZD אין יכולת החזרת שינויים מובנית. גישות מומלצות:

# אפשרות 1: לפרוס מחדש מ-Git (מומלץ)
git revert HEAD  # לחזור להתחייבות הבעייתית
git push
azd deploy

# אפשרות 2: לפרוס מחדש התחייבות ספציפית
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### חזרה בתשתית
```bash
# התצוגה המקדימה של שינויים בתשתית לפני היישום
azd provision --preview

# לשחזור התשתית, השתמש בשליטת גרסאות:
git revert HEAD  # בטל שינויים בתשתית
azd provision    # החל את מצב התשתית הקודם
```

### חזרה במיגרציית מסד נתונים
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

### מעקב ביצועי פריסה
```bash
# הצג את מצב הפריסה הנוכחי
azd show

# עקוב אחר האפליקציה עם Application Insights
azd monitor --overview

# הצג מדדים בחי
azd monitor --live
```

### איסוף מדדים מותאמים
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

## 🎯 נהלים מומלצים

### 1. עקביות סביבה
```bash
# השתמש בשמות עקביים
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# שמור על התאמה בין סביבות
./scripts/sync-environments.sh
```

### 2. אימות תשתית
```bash
# תצוגה מקדימה של שינויים בתשתית לפני פריסה
azd provision --preview

# השתמש באימות ARM/Bicep
az bicep lint --file infra/main.bicep

# אמת תחביר Bicep
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

### 4. תיעוד ורישום
```bash
# לתעד נהלי פריסה
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## צעדים הבאים

- [הקצאת משאבים](provisioning.md) - התעמקות בניהול תשתית
- [תכנון מקדים לפריסה](../chapter-06-pre-deployment/capacity-planning.md) - תכנן את אסטרטגיית הפריסה שלך
- [בעיות נפוצות](../chapter-07-troubleshooting/common-issues.md) - פתרון בעיות בפריסה
- [נהלים מומלצים](../chapter-07-troubleshooting/debugging.md) - אסטרטגיות פריסה מוכנות לייצור

## 🎯 תרגולי פריסה מעשיים

### תרגיל 1: תהליך פריסה מדרגי (20 דקות)
**מטרה**: לשלוט בהבדל בין פריסה מלאה למדרגתית

```bash
# פריסה ראשונית
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# תעד זמן פריסה ראשוני
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

**קריטריוני הצלחה:**
- [ ] פריסה מלאה אורכת 5-15 דקות
- [ ] פריסה של קוד בלבד אורכת 2-5 דקות
- [ ] שינויים בקוד משתקפים ביישום המופעל
- [ ] התשתית לא השתנתה לאחר `azd deploy`

**תוצאה צפויה**: `azd deploy` מהיר ב-50-70% לעומת `azd up` בשינויים בקוד

### תרגיל 2: הוקים מותאמים לפריסה (30 דקות)
**מטרה**: ליישם אוטומציה לפני ואחרי פריסה

```bash
# צור סקריפט אימות לפני פריסה
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# בדוק אם המבחנים עוברים בהצלחה
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# בדוק שינויים שלא הוכנסו לקומיט
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# צור בדיקת עשן לאחר הפריסה
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

# הוסף hooks לקובץ azure.yaml
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

**קריטריוני הצלחה:**
- [ ] סקריפט לפני פריסה רץ לפני הפריסה
- [ ] הפריסה מופסקת אם הבדיקות נכשלות
- [ ] בדיקת אש אחר פריסה מאמתת בריאות
- [ ] הוקים מתבצעים בסדר הנכון

### תרגיל 3: אסטרטגיית פריסה מרובת סביבות (45 דקות)
**מטרה**: ליישם תהליך פריסה בשלבים (dev → staging → ייצור)

```bash
# צור סקריפט פריסה
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# שלב 1: פריסה לסביבת הפיתוח
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# שלב 2: פריסה לסביבת הביניים
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# שלב 3: אישור ידני לייצור
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
- [ ] סביבה dev מתפרסת בהצלחה
- [ ] סביבה staging מתפרסת בהצלחה
- [ ] דרוש אישור ידני לפריסה לייצור
- [ ] לכל הסביבות יש בדיקות בריאות עובדות
- [ ] ניתן לבצע חזרה לאחור במידת הצורך

### תרגיל 4: אסטרטגיית חזרה לאחור (25 דקות)
**מטרה**: ליישם ולבדוק חזרה לאחור בפריסה באמצעות Git

```bash
# פרוס גרסה 1
azd env set APP_VERSION "1.0.0"
azd up

# שמור את המקף של התחייבות גרסה 1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# פרוס גרסה 2 עם שינוי שמשבר תאימות
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# זיהוי כישלון וביצוע החזרה אחורה
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # החזרה אחורה באמצעות git
    git revert HEAD --no-edit
    
    # סביבה להחזרה אחורה
    azd env set APP_VERSION "1.0.0"
    
    # פרוס מחדש גרסה 1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**קריטריוני הצלחה:**
- [ ] יכולה לזהות כשלים בפריסה
- [ ] סקריפט חזרה לאחור רץ אוטומטית
- [ ] היישום חוזר למצב תקין
- [ ] בדיקות בריאות מצליחות לאחר החזרה

## 📊 מעקב מדדי פריסה

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# רישום לקובץ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# השתמש בזה
./track-deployment.sh
```

**נתח את המדדים שלך:**
```bash
# הצגת היסטוריית הפריסה
cat deployment-metrics.csv

# חישוב זמן הפריסה הממוצע
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## משאבים נוספים

- [מדריך הפקודות לפריסת Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [פריסת Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [פריסת Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [פריסת Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ניווט**
- **שיעור קודם**: [הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **שיעור הבא**: [הקצאת משאבים](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתמלילים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפת המקור שלו נחשב כמקור סמכותי. עבור מידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי אדם. אנחנו לא נושאים באחריות לכל אי הבנות או פירושים שגויים הנובעים מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->