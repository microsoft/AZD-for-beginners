<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-18T07:11:01+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "he"
}
-->
# מדריך פריסה - שליטה בפריסות AZD

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 4 - תשתית כקוד ופריסה
- **⬅️ פרק קודם**: [פרק 3: הגדרות](../getting-started/configuration.md)
- **➡️ הבא**: [הקצאת משאבים](provisioning.md)
- **🚀 פרק הבא**: [פרק 5: פתרונות AI מרובי סוכנים](../../examples/retail-scenario.md)

## הקדמה

מדריך מקיף זה מכסה את כל מה שצריך לדעת על פריסת יישומים באמצעות Azure Developer CLI, החל מפריסות בסיסיות בפקודה אחת ועד לתרחישי ייצור מתקדמים עם hooks מותאמים אישית, סביבות מרובות ואינטגרציה עם CI/CD. שלוט במחזור החיים המלא של הפריסה עם דוגמאות מעשיות ושיטות עבודה מומלצות.

## מטרות למידה

עם סיום המדריך, תלמדו:
- לשלוט בכל הפקודות והזרימות של פריסת Azure Developer CLI
- להבין את מחזור החיים המלא של הפריסה, מהקצאה ועד לניטור
- ליישם hooks מותאמים אישית לאוטומציה לפני ואחרי הפריסה
- להגדיר סביבות מרובות עם פרמטרים ייחודיים לכל סביבה
- להקים אסטרטגיות פריסה מתקדמות כמו פריסות כחול-ירוק ופריסות קנריות
- לשלב פריסות azd עם צינורות CI/CD וזרימות עבודה של DevOps

## תוצאות למידה

עם סיום המדריך, תוכלו:
- לבצע ולפתור בעיות בכל זרימות הפריסה של azd באופן עצמאי
- לעצב וליישם אוטומציה מותאמת אישית לפריסה באמצעות hooks
- להגדיר פריסות מוכנות לייצור עם אבטחה וניטור מתאימים
- לנהל תרחישי פריסה מורכבים עם סביבות מרובות
- לייעל ביצועי פריסה וליישם אסטרטגיות חזרה לאחור
- לשלב פריסות azd בשיטות DevOps ארגוניות

## סקירת פריסה

Azure Developer CLI מספק מספר פקודות פריסה:
- `azd up` - זרימת עבודה מלאה (הקצאה + פריסה)
- `azd provision` - יצירה/עדכון של משאבי Azure בלבד
- `azd deploy` - פריסת קוד יישום בלבד
- `azd package` - בנייה ואריזת יישומים

## זרימות עבודה בסיסיות לפריסה

### פריסה מלאה (azd up)
זרימת העבודה הנפוצה ביותר עבור פרויקטים חדשים:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### פריסת תשתית בלבד
כאשר יש צורך לעדכן רק את משאבי Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### פריסת קוד בלבד
לעדכונים מהירים של יישומים:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ הבנת תהליך הפריסה

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
- קריאת תבניות תשתית (Bicep/Terraform)
- יצירה או עדכון של משאבי Azure
- הגדרת רשתות ואבטחה
- הקמת ניטור ורישום

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

### שלב 4: אריזת יישומים
- בניית קוד יישום
- יצירת ארטיפקטים לפריסה
- אריזה לפלטפורמת היעד (קונטיינרים, קבצי ZIP וכו')

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

### שלב 6: פריסת יישומים
- פריסת יישומים ארוזים לשירותי Azure
- עדכון הגדרות תצורה
- הפעלה/הפעלה מחדש של שירותים

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

## 🎛️ הגדרות פריסה

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

### הגדרות ייחודיות לסביבה
```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
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

### פריסות קנריות
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
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### שמירת מטמון בנייה
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
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 ניטור פריסה

### ניטור פריסה בזמן אמת
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
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

# Check application health
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
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
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
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### חזרה לאחור של תשתית
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### חזרה לאחור של מיגרציית בסיס נתונים
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
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
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

### 1. עקביות בין סביבות
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. אימות תשתית
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. בדיקות אינטגרציה
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
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## צעדים הבאים

- [הקצאת משאבים](provisioning.md) - צלילה עמוקה לניהול תשתיות
- [תכנון לפני פריסה](../pre-deployment/capacity-planning.md) - תכננו את אסטרטגיית הפריסה שלכם
- [בעיות נפוצות](../troubleshooting/common-issues.md) - פתרון בעיות פריסה
- [שיטות עבודה מומלצות](../troubleshooting/debugging.md) - אסטרטגיות פריסה מוכנות לייצור

## משאבים נוספים

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ניווט**
- **שיעור קודם**: [הפרויקט הראשון שלכם](../getting-started/first-project.md)
- **שיעור הבא**: [הקצאת משאבים](provisioning.md)

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו אחראים לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.