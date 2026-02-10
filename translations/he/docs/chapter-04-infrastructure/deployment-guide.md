# מדריך פריסה - שליטה על פריסות AZD

**ניווט בין פרקים:**
- **📚 בית הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 4 - תשתית כקוד ופריסה
- **⬅️ פרק קודם**: [פרק 3: תצורה](../chapter-03-configuration/configuration.md)
- **➡️ הבא**: [הקצאת משאבים](provisioning.md)
- **🚀 הפרק הבא**: [פרק 5: פתרונות AI מרובי-סוכנים](../../examples/retail-scenario.md)

## מבוא

This## Understanding the Deployment Processcomprehensive guide covers everything you need to know about deploying applications using Azure Developer CLI, from basic single-command deployments to advanced production scenarios with custom hooks, multiple environments, and CI/CD integration. Master the complete deployment lifecycle with practical examples and best practices.

## מטרות הלמידה

על ידי השלמת מדריך זה, תוכל:
- לשלוט בכל פקודות וזרימות העבודה של Azure Developer CLI לפריסה
- להבין את מחזור חיי הפריסה המלא מההקצאה לניטור
- ליישם hooks מותאמים לפריסה לאוטומציה לפני ואחרי הפריסה
- להגדיר מספר סביבות עם פרמטרים ספציפיים לכל סביבה
- להגדיר אסטרטגיות פריסה מתקדמות כולל פריסות blue-green ו-canary
- לשלב פריסות `azd` בצנרת CI/CD ובזרימות עבודה של DevOps

## תוצאות למידה

בסיום, תוכל:
- להריץ ולפתור בעיות בכל זרימות העבודה של פריסת `azd` באופן עצמאי
- לעצב וליישם אוטומציה לפריסה מותאמת באמצעות hooks
- להגדיר פריסות מוכנות לייצור עם אבטחה וניטור מתאימים
- לנהל תרחישי פריסה מורכבים עם מספר סביבות
- לאופטם ביצועי פריסה וליישם אסטרטגיות החזרה למצב קודם
- לשלב פריסות `azd` בפרקטיקות DevOps ארגוניות

## סקירת פריסה

Azure Developer CLI מספקת מספר פקודות פריסה:
- `azd up` - זרימת עבודה מלאה (provision + deploy)
- `azd provision` - יצירה/עדכון של משאבי Azure בלבד
- `azd deploy` - פריסת קוד היישום בלבד
- `azd package` - בניה ועטיפת יישומים

## זרמי עבודה בסיסיים לפריסה

### פריסה מלאה (azd up)
זרימת העבודה השכיחה ביותר לפרויקטים חדשים:
```bash
# פרוס הכל מאפס
azd up

# פרוס בסביבה ספציפית
azd up --environment production

# פרוס עם פרמטרים מותאמים אישית
azd up --parameter location=westus2 --parameter sku=P1v2
```

### פריסה של תשתית בלבד
כאשר אתה צריך רק לעדכן משאבי Azure:
```bash
# פריסה/עדכון תשתית
azd provision

# פריסה עם הרצה יבשה לקבלת תצוגה מקדימה של השינויים
azd provision --preview

# פריסת שירותים ספציפיים
azd provision --service database
```

### פריסת קוד בלבד
לעדכונים מהירים של היישום:
```bash
# פרוס את כל השירותים
azd deploy

# פלט צפוי:
# פריסת שירותים (azd deploy)
# - web: פריסה... הושלמה
# - api: פריסה... הושלמה
# הצלחה: הפריסה שלך הושלמה בתוך 2 דקות ו-15 שניות

# פרוס שירות ספציפי
azd deploy --service web
azd deploy --service api

# פרוס עם פרמטרי בנייה מותאמים
azd deploy --service api --build-arg NODE_ENV=production

# אמת את הפריסה
azd show --output json | jq '.services'
```

### ✅ אימות פריסה

לאחר כל פריסה, אמת את ההצלחה:

```bash
# בדוק שכל השירותים פועלים
azd show

# בדוק נקודות קצה של מצב המערכת
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# עקוב אחר שגיאות (נפתח בדפדפן כברירת מחדל)
azd monitor --logs
```

**קריטריוני הצלחה:**
- ✅ כל השירותים מציגים מצב "Running"
- ✅ נקודות בריאות מחזירות HTTP 200
- ✅ אין יומני שגיאות בחמש הדקות האחרונות
- ✅ היישום מגיב לבקשות בדיקה

## 🏗️ הבנת תהליך הפריסה

### שלב 1: Pre-Provision Hooks
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

### שלב 3: Post-Provision Hooks
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

### שלב 4: אריזת היישום
- בונה את קוד היישום
- יוצר ארטיפקטים לפריסה
- אורז עבור הפלטפורמה היעד (containers, ZIP files, וכו')

### שלב 5: Pre-Deploy Hooks
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

### שלב 6: פריסת היישום
- מפרוס את היישומים הארוזים לשירותי Azure
- מעדכן הגדרות תצורה
- מתחיל/מאתחל שירותים

### שלב 7: Post-Deploy Hooks
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

### קונפיגורציות ספציפיות לסביבה
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

### יישומים מרובי-שירותים
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
# צור את הסביבה הכחולה
azd env new production-blue
azd up --environment production-blue

# בדוק את הסביבה הכחולה
./scripts/test-environment.sh production-blue

# העבר את התעבורה לסביבה הכחולה (עדכון DNS/מאזן עומסים ידני)
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

### אופטימיזציית Dockerfile רב-שלבית
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

## ⚡ אופטימיזציה של ביצועים

### פריסות ספציפיות לשירות
```bash
# פרוס שירות ספציפי לאיטרציה מהירה
azd deploy --service web
azd deploy --service api

# פרוס את כל השירותים
azd deploy
```

### caching בבנייה
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
# השתמש ב-azd deploy (לא ב-azd up) לשינויים של קוד בלבד
# זה מדלג על פריסת התשתית והוא הרבה יותר מהיר
azd deploy

# פרוס שירות ספציפי לאיטרציה מהירה יותר
azd deploy --service api
```

## 🔍 ניטור פריסה

### ניטור פריסה בזמן אמת
```bash
# נטר את היישום בזמן אמת
azd monitor --live

# צפה ביומני היישום
azd monitor --logs

# בדוק את מצב הפריסה
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
# אחסן סודות באופן מאובטח
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# התייחס לסודות בקובץ azure.yaml
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

## 🚨 אסטרטגיות החזרה למצב קודם

### החזרה מהירה
```bash
# ל-AZD אין גלגול לאחור מובנה. גישות מומלצות:

# אפשרות 1: פריסה מחדש מ-Git (מומלץ)
git revert HEAD  # בטל את ה-commit הבעייתי
git push
azd deploy

# אפשרות 2: פריסה מחדש של ה-commit הספציפי
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### החזרת תשתית
```bash
# תצוגה מקדימה של שינויים בתשתית לפני יישום
azd provision --preview

# לגלגול חזרה של התשתית, השתמש בבקרת גרסאות:
git revert HEAD  # בטל שינויים בתשתית
azd provision    # יישם את מצב התשתית הקודם
```

### החזרת מיגרציית מסד נתונים
```bash
#!/bin/bash
# סקריפטים/שחזור-מסד-נתונים.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 מדדי פריסה

### עקוב אחרי ביצועי הפריסה
```bash
# הצג מצב הפריסה הנוכחי
azd show

# נטר את היישום באמצעות Application Insights
azd monitor --overview

# הצג מדדי זמן אמת
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

## 🎯 שיטות עבודה מומלצות

### 1. עקביות סביבות
```bash
# השתמש בשמות עקביים
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# שמור על עקביות בין הסביבות
./scripts/sync-environments.sh
```

### 2. אימות תשתית
```bash
# תצוגה מקדימה של שינויים בתשתית לפני הפריסה
azd provision --preview

# השתמש ב-lint עבור ARM/Bicep
az bicep lint --file infra/main.bicep

# אמת את התחביר של Bicep
az bicep build --file infra/main.bicep
```

### 3. אינטגרציה של בדיקות
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

## הצעדים הבאים

- [הקצאת משאבים](provisioning.md) - העמקה בניהול תשתיות
- [תכנון לפני פריסה](../chapter-06-pre-deployment/capacity-planning.md) - תכנן את אסטרטגיית הפריסה שלך
- [בעיות נפוצות](../chapter-07-troubleshooting/common-issues.md) - פתרון בעיות פריסה
- [שיטות עבודה מומלצות](../chapter-07-troubleshooting/debugging.md) - אסטרטגיות פריסה מוכנות לייצור

## 🎯 תרגילי פריסה מעשיים

### תרגיל 1: זרם עבודה של פריסה אינקרמנטלית (20 דקות)
**מטרה**: לשלוט בהבחנה בין פריסות מלאות לאינקרמנטליות

```bash
# פריסה ראשונית
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# תעד את זמן הפריסה הראשונית
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
- [ ] פריסה מלאה אורכת 5–15 דקות
- [ ] פריסת קוד בלבד אורכת 2–5 דקות
- [ ] שינויים בקוד משתקפים ביישום המופעל
- [ ] התשתית לא משתנה לאחר `azd deploy`

**תוצאת למידה**: `azd deploy` מהיר ב-50–70% מ-`azd up` עבור שינויים בקוד

### תרגיל 2: Hooks מותאמים לפריסה (30 דקות)
**מטרה**: יישם אוטומציה לפני ואחרי הפריסה

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

# בדוק אם קיימים שינויים שלא בוצע להם commit
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# צור בדיקת תקינות בסיסית לאחר פריסה
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
- [ ] סקריפט Pre-deploy רץ לפני הפריסה
- [ ] הפריסה מבוטלת אם הבדיקות נכשלות
- [ ] בדיקת smoke לאחר הפריסה מאמתת את הבריאות
- [ ] ה-hooks מתבצעים בסדר הנכון

### תרגיל 3: אסטרטגיית פריסה רב-סביבתית (45 דקות)
**מטרה**: יישם זרם עבודה של פריסה בשלבים (dev → staging → production)

```bash
# ‎צור סקריפט לפריסה
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ‎שלב 1: פריסה לסביבת פיתוח
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ‎שלב 2: פריסה לסביבת סטייג'ינג
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ‎שלב 3: אישור ידני עבור הייצור
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

# ‎צור סביבות
azd env new dev
azd env new staging
azd env new production

# ‎הרץ פריסה בשלבים
./deploy-staged.sh
```

**קריטריוני הצלחה:**
- [ ] סביבת Dev נפרסת בהצלחה
- [ ] סביבת Staging נפרסת בהצלחה
- [ ] נדרש אישור ידני לפריסה לייצור
- [ ] לכל הסביבות יש בדיקות בריאות פועלות
- [ ] ניתן להחזיר למצב קודם אם נדרש

### תרגיל 4: אסטרטגיית החזרה למצב קודם (25 דקות)
**מטרה**: יישם ובדוק החזרה של פריסה באמצעות Git

```bash
# פרוס v1
azd env set APP_VERSION "1.0.0"
azd up

# שמור את ה-hash של ה-commit של v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# פרוס v2 עם שינוי שמפר תאימות
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# זהה כישלון והחזר לגרסה קודמת
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # החזר לגרסה קודמת באמצעות git
    git revert HEAD --no-edit
    
    # גלגול חזרה של הסביבה
    azd env set APP_VERSION "1.0.0"
    
    # פרוס מחדש v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**קריטריוני הצלחה:**
- [ ] יכול לזהות כישלונות פריסה
- [ ] סקריפט ההחזרה מתבצע אוטומטית
- [ ] היישום חוזר למצב עבודה
- [ ] בדיקות הבריאות עוברות לאחר ההחזרה

## 📊 מעקב אחר מדדי פריסה

### עקוב אחר ביצועי הפריסה שלך

```bash
# צור סקריפט למדדי פריסה
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
# הצג היסטוריית הפריסה
cat deployment-metrics.csv

# חשב את זמן הפריסה הממוצע
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## משאבים נוספים

- [תיעוד Azure Developer CLI לפריסה](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [פריסת Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [פריסת Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [פריסת Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ניווט**
- **הدرس הקודם**: [הפרויקט הראשון שלך](../chapter-01-foundation/first-project.md)
- **הدرس הבא**: [הקצאת משאבים](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
הצהרת אי-אחריות:
מסמך זה תורגם בעזרת שירות תרגום מבוסס בינה מלאכותית Co-op Translator (https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדייק, יש לקחת בחשבון שתורגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש לראות במסמך המקורי בשפתו כמקור הסמכות. עבור מידע קריטי מומלץ להיעזר בתרגום מקצועי על ידי מתרגם אנושי. איננו אחראים לכל אי-הבנה או פרשנות שגויה הנובעת מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->