# מדריך פריסה - שליטה בפריסות AZD

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 4 - תשתית כקוד ופריסה
- **⬅️ הפרק הקודם**: [פרק 3: קונפיגורציה](../chapter-03-configuration/configuration.md)
- **➡️ הבא**: [פריסת משאבים](provisioning.md)
- **🧩 גם בפרק זה**: [יצירת תבנית משלך](custom-templates.md)
- **🚀 הפרק הבא**: [פרק 5: פתרונות AI מרובי סוכנים](../../examples/retail-scenario.md)

## מבוא

> נבדק אל מול `azd 1.37.2` (נובמבר 2026). הפקודות משתמשות בבאש; דוגמאות JSON דורשות `jq`. מלבד תרגיל ה-todo המזוהה במפורש, דוגמאות מתקדמות הן **קטעי אינטגרציה**: ספק את המקור, התשתית, הבדיקות והסקריפטים שלך. לא בוצעו פריסות Azure בבדיקה זו.

מדריך מקיף זה מכסה כל מה שצריך לדעת על פריסת אפליקציות באמצעות Azure Developer CLI, מפריסות בסיסיות בפקודה אחת ועד תסריטי ייצור מתקדמים עם ווים מותאמים, סביבות מרובות ושילוב CI/CD. שלוט במחזור חיי הפריסה המלא עם דוגמאות מעשיות ונוהלי עבודה מומלצים.

## מטרות למידה

עם סיום מדריך זה, תוכל:
- לשלוט בכל פקודות וזרימות העבודה של פריסת Azure Developer CLI
- להבין את מחזור חיי הפריסה המלא מפרוביז'ן למעקב
- ליישם ווים מותאמים לאוטומציה לפני ואחרי פריסה
- לקנפג סביבות מרובות עם פרמטרים ספציפיים לסביבה
- להגדיר אסטרטגיות פריסה מתקדמות כולל פריסות כחול-ירוק וקנרי
- לשלב פריסות azd עם צינורות CI/CD וזרימות עבודה של DevOps

## תוצאות למידה

בסיום, תוכל:
- להריץ ולפתור בעיות בכל זרימות העבודה של azd לפריסה באופן עצמאי
- לעצב וליישם אוטומציה מותאמת לפריסה באמצעות ווים
- לקנפג פריסות מוכנות לייצור עם אבטחה ומעקב נכונים
- לנהל תסריטי פריסה מורכבים מרובי סביבות
- לאופטם ביצועי פריסה וליישם אסטרטגיות rollback
- לשלב פריסות azd בפרקטיקות DevOps ארגוניות

## מבט כולל על פריסה

Azure Developer CLI מספק מספר פקודות פריסה:
- `azd up` - זרימת עבודה מלאה (פרוביז'ן + פריסה)
- `azd provision` - יצירה/עדכון משאבי Azure בלבד
- `azd deploy` - פריסת קוד אפליקציה בלבד
- `azd package` - בנייה וחבילה של אפליקציות

## זרימות עבודה בסיסיות לפריסה

### פריסה מלאה (azd up)
זרימת העבודה הנפוצה ביותר לפרויקטים חדשים:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### פריסה של תשתית בלבד
כשאתה רק צריך לעדכן משאבי Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### פריסת קוד בלבד
לעדכונים מהירים של האפליקציה:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ אימות פריסה

לאחר כל פריסה, אמת הצלחה:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**קריטריוני הצלחה:**
- ✅ `azd show` פותר כתובות URL/שירותים כפי שמצופה
- ✅ בקשות לנתיבי האפליקציה מחזירות סטטוס וגוף מצופים
- ✅ אין יומני שגיאה בחמש הדקות האחרונות
- ✅ האפליקציה מגיבה לבקשות בדיקה

## 🏗️ הבנת תהליך הפריסה

### חדש בווים? התחלה כאן

**וו** הוא פקודה ש-azd מריץ אוטומטית ברגע מסויים בתהליך הפריסה — לפני או אחרי הפרוביז'ן, ולפני או אחרי פריסת הקוד שלך. הם מאפשרים לך לאוטומט משימות קטנות שסביב הפריסה: זריעת בסיס נתונים, הרצת מיגרציות, בניית נכסים, או בדיקת עשן לאפליקציה חיה.

| וו | מריץ... | שימוש נפוץ |
|------|-------|------------|
| `preprovision` | לפני יצירת משאבים | אימות דרישות, התחברות לרישום |
| `postprovision` | אחרי קיום משאבים | קונפיגורציית משאבים, הקמת בסיס הנתונים |
| `predeploy` | לפני פריסת קוד | בניית נכסים בצד לקוח, הרצת בדיקות יחידה |
| `postdeploy` | אחרי קוד חי | הרצת מיגרציות DB, בדיקת עשן לנקודת הקצה |

הווים נמצאים ב`azure.yaml` שלך. הנה הדוגמה הקטנה ביותר — היא רק מדפיסה הודעה אחרי פריסה:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

זהו זה — בפעם הבאה שתריץ `azd up`, ההודעה תודפס אוטומטית. אפשר גם להריץ וו בפני עצמו, בלי פריסה מלאה, שזה נהדר לבדיקה:

```bash
azd hooks run postdeploy
```

השלבים הבאים מראים ווים מעשיים (מיגרציות, בדיקות, אימות) לכל שלב.

### שלב 1: ווים לפני פרוביז'ן
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

### שלב 2: פרוביז'ן תשתית
- קורא תבניות תשתית (Bicep/Terraform)
- יוצר או מעדכן משאבי Azure
- מקנפג רשת ואבטחה
- מגדיר מעקב ורישום

### שלב 3: ווים אחרי פרוביז'ן
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

### שלב 4: חבילות אפליקציה
- בונה קוד אפליקציה
- יוצר ארטיפקטים לפריסה
- חבילות לפלטפורמות יעד (מיכלים, קבצי ZIP, וכו')

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

### שלב 6: פריסת אפליקציה
- מפריס אפליקציות חבילות לשירותי Azure
- מעדכן הגדרות קונפיגורציה
- מפעיל/מאתחל שירותים

### שלב 7: ווים אחרי פריסה
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### טיפול בשגיאות ווים

כבררת מחדל, **אם פקודת וו מחזירה קוד יציאה שונה מאפס, azd עוצר את כל הפעולה.** זה בדרך כלל רצוי — מיגרציה שנכשלת צריכה לעצור את הפריסה, לא לפרוס אפליקציה שבורה. אבל משמעות הדבר היא שהווים צריכים להיכתב בקפידה.

**1. הפוך כשלים לרועשים ובכוונה.** וו נכשל כאשר הפקודה האחרונה שלו מחזירה קוד יציאה שונה מאפס. בסקריפטים של shell, הוסף `set -e` כדי שהוו יעצור בפקודה הראשונה המכשלת במקום להמשיך בשקט:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. אפשר וו להיכשל בלי לעצור את azd.** עבור שלבים לא קריטיים (חימום מטמון אופציונלי, הודעת מיטב מאמץ), קבע `continueOnError: true`. azd מתעד בקובץ הלוג את הכשל אבל ממשיך:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. בדוק ווים בסביבה מבודדת לפני הרצה מלאה.** לא חייבים להריץ `azd up` כדי לבודק וו — הריץ אותו בנפרד וחזור על התהליך במהירות:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. שים לב ל-shells ייעודיים למערכת הפעלה.** וו המשתמש ב-`shell: pwsh` צריך PowerShell מותקן במכונת ההרצה (כולל סוכני CI). השתמש ב-`shell: sh` להניידות הרחבה ביותר, או ספק גם את הגרסאות `windows` ו-`posix`:

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

> **טיפ לאיתור תקלות:** הפעל כל פקודת azd עם `--debug` כדי לראות את הפקודה המדויקת של הוו ותוצאתה המלאה — יקר ערך כשוו עובד מקומית אך נכשל ב-CI.

## 🎛️ קונפיגורציית פריסה

### הגדרות פריסה ספציפיות לשירות
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### קונפיגורציות לפי סביבה

אלו ערכי azd מקומיים בלבד. מיפוי מפורש אל הקונפיגורציה של התשתית/ריצה. `NODE_ENV` הוא בדרך כלל `production` לאפליקציית Node מפורסת, כולל פריסת staging; השתמש במשתנה נפרד ספציפי לאפליקציה כדי להבדיל בין שלבי פריסה.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 תסריטי פריסה מתקדמים

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

**סקיצה אופרטיבית להמחשה:** יש לספק את שתי הסביבות, שכבת ניתוב תנועה משותפת, ושני הסקריפטים למטה. azd לא מחליף תנועה או מאמת מוכנות rollback אוטומטית. שמור על ירוק עד שהכחול עבר בדיקות ו-roll back כבר לא דרוש.

```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### פריסות קנרי
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

פיצול תנועה מתבצע בקונפיגורציית Container Apps (Bicep או Azure CLI), לא בתכונת `azure.yaml` `trafficSplit` של azd. פריויו/פרוביז'ן ופריסות מאוחרות יותר חייבות לשמור על מצב השדרוג וכללי הניתוב שבחרת.

### פריסות בשלבים
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 פריסות מכולות

### פריסות אפליקציית מכולה
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

קונפיגורציית סודות ריצה עם `configuration.secrets`/`secretRef` (או הפניות Key Vault) וקנה מידה עם `template.scale` בתשתית Container App. אל תמציא תכונות `secrets` או `scale` ברמת שירות בתוך `azure.yaml`.

### אופטימיזציה של Dockerfile בשלבים מרובים
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
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
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### קאש לבנייה
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

זרימת העבודה הסטנדרטית ל-Node משתמשת בסקריפטים של חבילות; ווים שירותיים של `prepackage` יכולים להוסיף שלבים נדרשים. קאש שכבות Docker נפרד מהגדרה של פקודת build לשירות.

### פריסות קוד יעילות
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 מעקב פריסה

### מעקב פריסה בזמן אמת
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### בדיקות בריאות
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

האפליקציה שלך חייבת לממש `/health`; הוא לא מסופק אוטומטית על ידי azd. אין תכונה כללית `azure.yaml` `healthCheck` לשירות.

### אימות אחרי פריסה
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
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
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` אינו תקין. ערכי סביבה רגילים הם טקסט ברור מקומי; אל תנחש שפקודות קריאה מורידות אותם. הפקודות למעלה שומרות הפניות Key Vault, אבל התשתית/האפליקציה שלך חייבות עדיין לצרוך את הסודות ולהעניק גישה לזהות ריצה.

### אבטחת רשת
הכרז וצרוך פרמטרי רשת ב-Bicep, ומפה אותם ב-`infra/main.parameters.json`. אין שכבת `infra.parameters` כללית ב-`azure.yaml`. טווחי דוגמא בתיעוד `203.0.113.0/24` ו-`198.51.100.0/24` אינם רשתות משרד/VPN אמיתיות; החלף בטווחי רשת מאושרים.

### ניהול זהויות וגישה
אפשר `identity` של Container App ב-Bicep והקצה את תפקיד מישור הנתונים של Key Vault הנדרש בהיקף המלש. קונפג סודות עם שם מגובים ב-Key Vault והפניות ריצה במשאב זה; `identity` ו-`keyVault` אינם תכונות שירות כלליות של azd. ראה [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 אסטרטגיות rollback

### rollback מהיר
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### rollback תשתיתי
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### rollback של מיגרציות DB
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 מדדים לפריסה

### מעקב ביצועי פריסה
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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

## 🎯 נוהלי עבודה מומלצים

### 1. עקביות סביבתית
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. אימות תשתיתי
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## צעדים הבאים

- [פריסת משאבים](provisioning.md) - למידה מעמיקה של ניהול תשתית
- [תכנון לפני פריסה](../chapter-06-pre-deployment/capacity-planning.md) - תכנן את אסטרטגיית הפריסה שלך
- [בעיות נפוצות](../chapter-07-troubleshooting/common-issues.md) - פתרון בעיות בפריסה
- [נוהלי עבודה מומלצים](../chapter-07-troubleshooting/debugging.md) - אסטרטגיות פריסה מוכנות לייצור

## 🎯 תרגילי פריסה מעשיים

### תרגיל 1: זרימת עבודה לפריסה אינקרמנטלית (20 דקות)
**מטרה**: לשלוט בהבדל בין פריסה מלאה ואינקרמנטלית

**נקודת התחלה:** Bash, Node.js 22, Git, התחברות azd, ומנוי Azure עם הרשאות פריסה. הרץ בספריה חדשה; צפוי שימוש במשאבי App Service/Cosmos DB בתשלום. הזמנים תלויים באזור ובתבנית.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] רשום את הזמן שעבר עבור שתי הפקודות (אין ערבות לזמן)
- [ ] שתי הפקודות רצות בהצלחה
- [ ] ה-API נותר פעיל; העריכה רק של תגובות לא משנה ממשק משתמש נראה לעין
- [ ] התשתית לא השתנתה אחרי `azd deploy`

**תוצאה בלמידה**: `azd deploy` מדלג על פרוביז'ן של תשתית. השווה זמנים מדודים במקום להניח אחוז תאוצה קבוע.

### תרגיל 2: ווים מותאמים לפריסה (30 דקות)
**מטרה**: ליישם אוטומציה לפני ואחרי פריסה

**נקודת התחלה:** פרויקט `deployment-practice` המאופס למעלה. אם ניקית אותו, הרץ `azd up` שוב לפני בדיקת פריסת קוד בלבד. האימות למטה משתמש בסקריפט הבנייה האמיתי של ה-API, לא בסקריפט שורש שאינו קיים `test:unit`. בדיקות ה-API של התבנית דורשות גישת בסיס נתונים מורכבת; הן לא בדיקות יחידה מבודדות.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**קריטריוני הצלחה:**
- [ ] סקריפט לפני פריסה רץ לפני הפריסה
- [ ] הפריסה מבוטלת אם אימות הבנייה נכשל
- [ ] בדיקת עשן אחרי פריסה מאמתת בריאות
- [ ] הווים מתבצעים בסדר הנכון

### תרגיל 3: אסטרטגיית פריסה מרובת סביבות (45 דקות)
**מטרה**: ליישם זרימת עבודה פריסה בשלבים (Dev → Staging → Production)

**נקודת התחלה:** אותו פרויקט todo מאותחל עם `jq`. צור את הסביבות הבאות עם ערכי מנוי/מיקום אמיתיים (או הגדר `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` בכל אחת) **לפני** קריאת תהליך ללא הודעות בקשה. הוא נכשל בכוונה במקום להמציא ערכים חסרים. השתמש רק בסביבות אימון חד-פעמיות, לא במנוי ייצור אמיתי.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**קריטריוני הצלחה:**
- [ ] סביבה לפיתוח מתפרסת בהצלחה
- [ ] סביבה לסנכרון מתפרסת בהצלחה
- [ ] נדרש אישור ידני לייצור
- [ ] לכל הסביבות יש בדיקות בריאות תקינות
- [ ] ניתן לבצע חזרה לאחור במידת הצורך

### תרגיל 4: אסטרטגיית Rollback (25 דקות)
**מטרה**: ליישם ולבדוק חזרת פריסה לאחור באמצעות Git

**נקודת התחלה:** העתקת אימון מבודדת של תבנית ה-todo עם כל קוד הבסיס שהועבר, עץ עבודה נקי של Git, וסביבה חד-פעמית מוגדרת. לעולם אל תכניס כשל מכוון בפרויקט ייצור אמיתי. `APP_VERSION` למטה הוא רק לשמירת רישום אלא אם תחבר אותו מפורשות לאפליקציה.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**קריטריוני הצלחה:**
- [ ] יכול לזהות כשלי פריסה
- [ ] סקריפט החזרה לאחור מתבצע באופן אוטומטי
- [ ] האפליקציה חוזרת למצב עבודה
- [ ] בדיקות הבריאות עוברות לאחר החזרה לאחור

## 📊 מעקב מדדי פריסה

### עקוב אחרי ביצועי הפריסה שלך

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**נתח את המדדים שלך:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## משאבים נוספים

- [מדריך לפריסת Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
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
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->