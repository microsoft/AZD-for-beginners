<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-09-18T07:21:12+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "he"
}
-->
# דף עזר לפקודות - פקודות AZD חיוניות

**עזר מהיר לכל הפרקים**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../README.md)
- **📖 התחלה מהירה**: [פרק 1: יסודות והתחלה מהירה](../README.md#-chapter-1-foundation--quick-start)
- **🤖 פקודות AI**: [פרק 2: פיתוח מבוסס AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 מתקדם**: [פרק 4: תשתית כקוד](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## מבוא

דף עזר מקיף זה מספק עזר מהיר לפקודות CLI של Azure Developer הנפוצות ביותר, מאורגנות לפי קטגוריות עם דוגמאות מעשיות. מושלם לחיפושים מהירים במהלך פיתוח, פתרון בעיות ותפעול יומיומי עם פרויקטים של azd.

## מטרות למידה

על ידי שימוש בדף עזר זה, תוכלו:
- לקבל גישה מיידית לפקודות וסינטקס חיוניים של Azure Developer CLI
- להבין את ארגון הפקודות לפי קטגוריות פונקציונליות ושימושים
- לעיין בדוגמאות מעשיות לתרחישי פיתוח ופריסה נפוצים
- לגשת לפקודות פתרון בעיות לפתרון מהיר של תקלות
- למצוא אפשרויות מתקדמות להגדרות והתאמות אישיות ביעילות
- לאתר פקודות לניהול סביבות וזרימות עבודה מרובות סביבות

## תוצאות למידה

עם שימוש קבוע בדף עזר זה, תוכלו:
- לבצע פקודות azd בביטחון ללא צורך בעיון בתיעוד מלא
- לפתור בעיות נפוצות במהירות באמצעות פקודות אבחון מתאימות
- לנהל ביעילות סביבות מרובות ותרחישי פריסה
- ליישם תכונות מתקדמות של azd ואפשרויות הגדרה לפי הצורך
- לפתור בעיות פריסה באמצעות רצפי פקודות שיטתיים
- לייעל זרימות עבודה באמצעות שימוש אפקטיבי בקיצורי דרך ואפשרויות של azd

## פקודות התחלה

### אימות
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### אתחול פרויקט
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## פקודות פריסה מרכזיות

### זרימת עבודה מלאה לפריסה
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### תשתית בלבד
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### אפליקציה בלבד
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### בנייה ואריזה
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 ניהול סביבות

### פעולות סביבה
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### משתני סביבה
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ פקודות הגדרה

### הגדרה גלובלית
```bash
# List all configuration
azd config list

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### הגדרת פרויקט
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 ניטור ולוגים

### לוגים של אפליקציה
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### ניטור
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ פקודות תחזוקה

### ניקוי
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### עדכונים
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 פקודות מתקדמות

### פייפליין ו-CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### ניהול תשתית
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### ניהול שירותים
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 זרימות עבודה מהירות

### זרימת עבודה לפיתוח
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### זרימת עבודה מרובת סביבות
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### זרימת עבודה לפתרון בעיות
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 פקודות דיבוג

### מידע דיבוג
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### דיבוג תבניות
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 פקודות קבצים ותיקיות

### מבנה פרויקט
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 עיצוב פלט

### פלט JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### פלט טבלה
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 שילובי פקודות נפוצים

### סקריפט בדיקת בריאות
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### אימות פריסה
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### השוואת סביבות
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### סקריפט ניקוי משאבים
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 משתני סביבה

### משתני סביבה נפוצים
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 פקודות חירום

### תיקונים מהירים
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### פקודות שחזור
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 טיפים מקצועיים

### קיצורי דרך לזרימת עבודה מהירה
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### קיצורי דרך לפונקציות
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 עזרה ותיעוד

### קבלת עזרה
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### קישורים לתיעוד
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**טיפ**: סמנו את דף העזר הזה במועדפים והשתמשו ב-`Ctrl+F` כדי למצוא במהירות את הפקודות שאתם צריכים!

---

**ניווט**
- **שיעור קודם**: [בדיקות מקדימות](../docs/pre-deployment/preflight-checks.md)
- **שיעור הבא**: [מילון מונחים](glossary.md)

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.