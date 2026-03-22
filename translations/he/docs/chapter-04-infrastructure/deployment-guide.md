# מדריך פריסה - שליטה בפריסות AZD

**ניווט בפרקים:**
- **📚 דף קורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 4 - תשתית כקוד ופריסה
- **⬅️ פרק קודם**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)
- **➡️ הבא**: [הקצאת משאבים](provisioning.md)
- **🚀 פרק הבא**: [פרק 5: פתרונות AI מרובי-סוכנים](../../examples/retail-scenario.md)

## הקדמה

מדריך מקיף זה מכסה את כל מה שצריך לדעת על פריסת יישומים באמצעות Azure Developer CLI, מפריסות בפקודה בודדת בסיסית ועד תרחישי ייצור מתקדמים עם hooks מותאמים, סביבות מרובות ואינטגרציה של CI/CD. שלוט בכל מחזור חיי הפריסה עם דוגמאות מעשיות ונהלים מומלצים.

## יעדי הלמידה

בסיום מדריך זה, תוכל:
- לשלוט בכל פקודות וזרמי העבודה של פריסה ב-Azure Developer CLI
- להבין את מחזור חיי הפריסה המלא מהקצאה ועד ניטור
- ליישם hooks מותאמים לפריסה לאוטומציה לפני ואחרי הפריסה
- להגדיר סביבות מרובות עם פרמטרים ייחודיים לסביבה
- להקים אסטרטגיות פריסה מתקדמות כולל פריסות כחול-ירוק ו-canary
- לאחד פריסות azd עם צינורות CI/CD וזרמי עבודה ב-DevOps

## תוצאות הלמידה

בסיום תוכל:
- להפעיל ולטפל בבעיות בכל זרמי העבודה של פריסת azd באופן עצמאי
- לעצב וליישם אוטומציה מותאמת לפריסה באמצעות hooks
- להגדיר פריסות מוכנות לייצור עם אבטחה וניטור מתאימים
- לנהל תרחישי פריסה מורכבים בסביבות מרובות
- לאופטם ביצועי פריסה וליישם אסטרטגיות חזרה אחורה
- לשלב פריסות azd בפרקטיקות DevOps ארגוניות

## סקירת פריסה

Azure Developer CLI מספק מספר פקודות לפריסה:
- `azd up` - זרם עבודה מלא (הקצאה + פריסה)
- `azd provision` - יצירה/עדכון משאבי Azure בלבד
- `azd deploy` - פריסת קוד אפליקציה בלבד
- `azd package` - בניה וחבילה של יישומים

## זרמי עבודה בסיסיים לפריסה

### פריסה מלאה (azd up)
זרם העבודה הנפוץ ביותר לפרויקטים חדשים:
```bash
# לפרוס הכל מאפס
azd up

# לפרוס עם סביבה ספציפית
azd up --environment production

# לפרוס עם פרמטרים מותאמים אישית
azd up --parameter location=westus2 --parameter sku=P1v2
```

### פריסת תשתית בלבד
כשצריך רק לעדכן משאבי Azure:
```bash
# פרוס/עדכן תשתית
azd provision

# פרוס עם הרצה יבשה לצפייה מקדימה בשינויים
azd provision --preview

# פרוס שירותים ספציפיים
azd provision --service database
```

### פריסת קוד בלבד
לעדכוני אפליקציה מהירים:
```bash
# פרוס את כל השירותים
azd deploy

# פלט צפוי:
# מפריס שירותים (azd deploy)
# - web: בפריסה... בוצע
# - api: בפריסה... בוצע
# הצלחה: הפריסה שלך הושלמה תוך 2 דקות ו-15 שניות

# פרוס שירות ספציפי
azd deploy --service web
azd deploy --service api

# פרוס עם ארגומנטים מותאמים לבנייה
azd deploy --service api --build-arg NODE_ENV=production

# אמת את הפריסה
azd show --output json | jq '.services'
```

### ✅ אימות פריסה

לאחר כל פריסה, אמת הצלחה:

```bash
# בדוק שכל השירותים פועלים
azd show

# בדוק נקודות קצה של מצב בריאות
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# נטר שגיאות (נפתח בדפדפן כברירת מחדל)
azd monitor --logs
```

**קריטריוני הצלחה:**
- ✅ כל השירותים במצב "Running"
- ✅ נקודות הבריאות מחזירות HTTP 200
- ✅ אין רשומות שגיאה ב-5 הדקות האחרונות
- ✅ האפליקציה מגיבה לבקשות בדיקה

## 🏗️ הבנת תהליך הפריסה

### שלב 1: Hooks לפני ההקצאה
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
- מגדיר ניטור ורישום

### שלב 3: Hooks אחרי ההקצאה
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

### שלב 4: אריזת האפליקציה
- בונה קוד אפליקציה
- יוצר ארטיפקטים לפריסה
- אורז לפלטפורמה היעד (קונטיינרים, קבצי ZIP ועוד)

### שלב 5: Hooks לפני הפריסה
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

### שלב 6: פריסת האפליקציה
- מפריס אפליקציות ארוזות לשירותי Azure
- מעדכן הגדרות תצורה
- מפעיל/מאתחל מחדש שירותים

### שלב 7: Hooks אחרי הפריסה
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

## 🎛️ הגדרות פריסה

### הגדרות פריסה לשירות מסוים
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

### אפליקציות מרובות שירותים
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

# החלף תנועה לכחולה (עדכון DNS/מאזן עומסים ידני)
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

## 🐳 פריסות קונטיינר

### פריסות אפליקציות קונטיינר
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

### אופטימיזציית Dockerfile מרובת שלבים
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

### פריסות לשירות ייחודי
```bash
# לפרוס שירות ספציפי עבור איטרציה מהירה יותר
azd deploy --service web
azd deploy --service api

# לפרוס את כל השירותים
azd deploy
```

### מטמון בניה
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
# השתמש ב-azd deploy (ולא ב-azd up) לשינויים בקוד בלבד
# זה מדלג על פריסת תשתית ומהיר בהרבה
azd deploy

# פרוס שירות ספציפי כדי לחזור במהירות מירבית
azd deploy --service api
```

## 🔍 ניטור הפריסה

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

# בדוק את מצב הבריאות של האפליקציה
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

## 🚨 אסטרטגיות חזרה אחורה

### חזרה אחורה מהירה
```bash
# ל-AZD אין אפשרות החזרה מובנית. גישות מומלצות:

# אפשרות 1: פריסה מחדש מ-Git (מומלץ)
git revert HEAD  # החזר את ה-commit הבעייתי
git push
azd deploy

# אפשרות 2: פריסה מחדש של commit מסוים
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### חזרה אחורה בתשתית
```bash
# תצוגה מקדימה של שינויים בתשתית לפני יישום
azd provision --preview

# עבור הרצת תשתית חזרה, השתמש בבקרת גירסאות:
git revert HEAD  # ביטול שינויים בתשתית
azd provision    # יישום מצב תשתית קודם
```

### חזרה אחורה במיגרציית מסד נתונים
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

### מעקב אחרי ביצועי הפריסה
```bash
# הצג את מצב הפריסה הנוכחי
azd show

# נטר את היישום עם Application Insights
azd monitor --overview

# הצג מדדים בזמן אמת
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

## 🎯 נהלים מומלצים

### 1. עקביות סביבתית
```bash
# השתמש בשם עקבי
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# שמור על תאימות סביבתית
./scripts/sync-environments.sh
```

### 2. אימות תשתית
```bash
# תצוגה מקדימה של שינויים בתשתית לפני הפריסה
azd provision --preview

# השתמש בלינטינג של ARM/Bicep
az bicep lint --file infra/main.bicep

# אשר תחביר Bicep
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
# תעד את נהלי הפריסה
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## שלבים הבאים

- [הקצאת משאבים](provisioning.md) - העמקה בניהול תשתית
- [תכנון לפני פריסה](../chapter-06-pre-deployment/capacity-planning.md) - תכנן את אסטרטגיית הפריסה שלך
- [בעיות נפוצות](../chapter-07-troubleshooting/common-issues.md) - פתרון בעיות בפריסה
- [נהלים מומלצים](../chapter-07-troubleshooting/debugging.md) - אסטרטגיות פריסה מוכנות לייצור

## 🎯 תרגילי פריסה מעשיים

### תרגיל 1: זרם עבודה של פריסה הדרגתית (20 דקות)
**מטרה**: לשלוט בהבדל בין פריסה מלאה להדרגתית

```bash
# פריסת התחלתית
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# הקלט זמן פריסת התחלתית
echo "Full deployment: $(date)" > deployment-log.txt

# ביצוע שינוי בקוד
echo "// Updated $(date)" >> src/api/src/server.js

# פרוס רק קוד (מהיר)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# השווה זמנים
cat deployment-log.txt

# ניקוי
azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] פריסה מלאה נמשכת 5-15 דקות
- [ ] פריסת קוד בלבד נמשכת 2-5 דקות
- [ ] שינויים בקוד משתקפים באפליקציה המופעלת
- [ ] התשתית לא משתנה לאחר `azd deploy`

**תוצאת למידה**: `azd deploy` מהיר ב-50-70% מ-`azd up` עבור שינויים בקוד

### תרגיל 2: Hooks מותאמים לפריסה (30 דקות)
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

# בדוק שינויים בלתי מחויבים
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# צור בדיקת עישון לאחר פריסה
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

# הוסף ווים ל-azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# בדוק פריסה עם ווים
azd deploy
```

**קריטריוני הצלחה:**
- [ ] סקריפט לפני הפריסה רץ לפני הפריסה
- [ ] פריסה מבוטלת אם הבדיקות נכשלות
- [ ] בדיקת עשן לאחר הפריסה מאמתת בריאות
- [ ] Hooks מתבצעים בסדר הנכון

### תרגיל 3: אסטרטגיית פריסה מרובת סביבות (45 דקות)
**מטרה**: ליישם זרם עבודה פריסה בשלבים (dev → staging → הפקה)

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

# שלב 2: פריסה לסביבת העמסה
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

# הפעלת פריסה בשלבים
./deploy-staged.sh
```

**קריטריוני הצלחה:**
- [ ] סביבות פיתוח מתפרסות בהצלחה
- [ ] סביבות בדיקה מתפרסות בהצלחה
- [ ] נדרש אישור ידני לייצור
- [ ] בכל הסביבות קיימות בדיקות בריאות עובדות
- [ ] אפשרות לחזרה אחורה במידת הצורך

### תרגיל 4: אסטרטגיית חזרה אחורה (25 דקות)
**מטרה**: ליישם ולבדוק חזרה אחורה לפריסה בעזרת Git

```bash
# פרוס גרסה 1
azd env set APP_VERSION "1.0.0"
azd up

# שמור את ה-hash של הקומיט בגרסה 1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# פרוס גרסה 2 עם שינוי שמשבר תאימות
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# זיהוי כשל וביצוע ביטול
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # בטל באמצעות git
    git revert HEAD --no-edit
    
    # בטל את הסביבה
    azd env set APP_VERSION "1.0.0"
    
    # פרוס מחדש את גרסה 1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**קריטריוני הצלחה:**
- [ ] יכולת לזהות כשלים בפריסה
- [ ] סקריפט חזרה אחורה מתבצע אוטומטית
- [ ] האפליקציה חוזרת למצב תקין
- [ ] בדיקות הבריאות עובדות לאחר החזרה אחורה

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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# רשום לקובץ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
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

- [מדריך הפניות לפריסות Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
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
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עשויים לכלול טעויות או חוסר דיוקים. המסמך המקורי בשפת המקור שלו צריך להיחשב כמקור הסמכותי. למידע קריטי מומלץ להיעזר בתרגום מקצועי אנושי. אנו לא אחראים לכל אי הבנה או פרשנות שגויה הנובעת מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->